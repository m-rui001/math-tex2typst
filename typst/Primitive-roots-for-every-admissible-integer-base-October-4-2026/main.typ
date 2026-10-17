#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Primitive roots for every admissible integer base]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $a$ be an integer and let $p$ be a prime not dividing $a$. The multiplicative order $"ord"_p \( a \)$ is the least positive integer $k$ such that $a^k equiv 1 med \( mod med p \)$. The residue class of $a$ is a primitive root modulo $p$ if $"ord"_p \( a \) = p - 1$. Call $a$ #emph[admissible] if $a eq.not - 1$ and $a$ is not the square of an integer. These are necessary conditions for primitive-root behavior at infinitely many primes: the order of $- 1$ is at most $2$, and a nonzero square modulo an odd prime has order dividing $\( p - 1 \) \/ 2$.

Artin’s primitive root conjecture, formulated in 1927, asserts that every admissible integer is a primitive root modulo infinitely many primes; its quantitative form predicts a positive-density asymptotic [1] Section 17.2. We prove the following lower bound.

#prodef([Theorem 1.1.])[
  #emph[ For every admissible integer $a$, there are constants $c_a > 0$ and $x_a gt.eq 2$ such that, for every real $x gt.eq x_a$, 
$ \# { p upright(" prime") : x < p < 2 x \, med p divides.not a \, med "ord"_p \( a \) = p - 1 } gt.eq c_a frac(x, \( log x \)^2) . $

]
] <thm:primitive-root>

The predicted counting scale is $x \/ log x$; the theorem gives $x \/ \( log x \)^2$ in every sufficiently large dyadic interval. In particular, it proves the infinitude assertion for each fixed admissible integer, including the prescribed base $2$. The constants and the threshold may depend on the base.

The analytic part of the proof establishes a separate theorem. A finite-order Hecke character of a number field $F$ means a continuous finite-image character of the idele class group $F^times without bb(A)_F^times$. Write $mu_m$ for the group of $m$th roots of unity.

#prodef([Theorem 1.2.])[
  #emph[Let $F$ be a cyclotomic number field containing $mu_12$. For every finite-order Hecke character $eta$ of $F$, the meromorphic continuation of $L_F \( s \, eta \)$ has no zeros in 
$ "Re" s > 1 - 10^(- 6) . $

]
] <thm:hecke-zero-free>

The principal character is included, with its pole at $s = 1$ permitted. The width is common to all fields and characters in the statement, with no conductor or height cutoff. In the proof, $F$ and $eta$ are fixed before the auxiliary data are chosen. Constants and the points from which estimates hold may depend on them; the numerical saving in the final Mellin argument does not. This distinction is what allows a uniform splitting estimate for a growing family of fields.

=== 1.1 Historical context and the two obstructions <historical-context-and-the-two-obstructions>

Hooley proved Artin’s predicted asymptotic under the Riemann hypothesis for the Dedekind zeta functions of the Kummer fields $bb(Q) \( mu_n \, a^(1 \/ n) \)$, with $n$ squarefree [13]. These fields encode the obstructions to maximal order. For a prime $q$ and $p divides.not a q$, the conditions

$ p equiv 1 med \( mod med q \) \, #h(2em) a^(\( p - 1 \) \/ q) equiv 1 med \( mod med p \) $

say that $p$ splits completely in $bb(Q) \( mu_q \, a^(1 \/ q) \)$. They hold precisely when $q$ divides the index $\( p - 1 \) \/ "ord"_p \( a \)$. Hooley’s method counts and sums such splitting conditions. Here a restricted factorization of $p - 1$ confines the possible index divisors to ranges where they can all be removed.

Classical unconditional results allow a finite choice of bases. Gupta and Murty constructed a set of thirteen integers from three distinct primes, at least one of which is a primitive root modulo infinitely many primes [9]. Heath-Brown proved that at most two prime bases fail the infinitude assertion, so at least one of $2 \, 3 \, 5$ satisfies it [11]. Averaging over the base gives another approach. Goldfeld and Stephens established early average theorems [7,26]; Klurman, Shparlinski, and Teräväinen obtained the expected asymptotic for almost all integers in a range as short as $1 lt.eq a lt.eq exp \( \( log log x \)^2 \)$ [17]. The exceptional set may depend on $x$, so these average results do not by themselves settle a prescribed base.

Two difficulties must be addressed for a fixed base. One is analytic: the splitting fields vary with the possible index divisor. A standard simultaneous zero-free region for Hecke characters associated with an abelian extension has logarithmic width depending on the field, conductors, and height, and permits at most one simple real exceptional zero [28] Theorem 3.1. The common width in Theorem 2 instead gives a common power saving. The other difficulty is the prime construction: we need many primes for which the possible index divisors fall in the range controlled by that saving. We now describe the two parts of the proof and the points where they meet.

=== 1.2 The Hecke zero-free argument <the-hecke-zero-free-argument>

Fix a cyclotomic field $F$ containing $mu_12$ and a finite-order Hecke character $eta$. The analytic construction uses cubic theta coefficients under sextic Kummer twists. Patterson’s cubic theta series over $bb(Q) \( sqrt(- 3) \)$ is the model for the Gauss coefficients and their transformations [24,25]; the comparison formulas are recorded by Dunn and Radziwiłł [5] Section 5.1 and Appendix A. The companion manuscript #emph[The Quasi-Riemann Hypothesis] develops a coefficient reflection and an additive probe over that field while retaining unrestricted cube factors [23] Part I, Sections 5–7. Its zero-free theorem treats Dirichlet $L$-functions and finite-order Hecke $L$-functions over $bb(Q) \( sqrt(- 3) \)$. We construct the required mechanisms over each fixed $F$, using the cubic theta representation of Kazhdan and Patterson and a normalized global Whittaker factorization consistent with their correction [15,16].

Two local calculations govern the comparison. We choose generators for which sextic reciprocity has no supplementary factor. In a reflected interaction between a prime occurring to valuation one in the varying twist and a varying squarefree coefficient prime, the sextic exponents are $1$ and $- 4$. Their sum is $3$ modulo $6$, so the interaction is quadratic. The quadratic large sieve of Heath-Brown, in its number-field form due to Goldmakher and Louvel, then controls the reflected moment [12,8].

On the Poisson side, a relative-norm formula identifies the cube of the cubic Gauss phase with the negative of a unitary Hecke-character value. A finite-order correction gives the target character $eta$. At a prime ideal $frak(p)$ outside a fixed excluded set, the first squarefree theta term at the principal frequency is $- eta \( frak(p) \) \( upright(N) frak(p) \)^(- xi)$, where $xi$ is the Mellin variable for the coefficient norm. Together with the constant term, it supplies the local factor of the reciprocal target $L$-function. The remaining local terms give a holomorphic, nonvanishing correction in the region used at the end of the proof.

Reflection and Poisson summation thus estimate the same additive average in two ways. A conductor large sieve and zero detection control the nonprincipal frequencies. The resulting power saving for the principal inverse Mellin integral continues its Mellin transform across the line $"Re" s = 1$ and excludes zeros of the target function. The use of ideal norms keeps the numerical exponents in this argument independent of the degree of $F$. Sections 3–8 carry out this proof; Appendix 13 provides the theta normalization.

=== 1.3 Controlled predecessors in a fixed progression <controlled-predecessors-in-a-fixed-progression>

The construction produces many primes of the form

$ p = c r Q + 1 \, #h(2em) c in { 2 \, 4 } \, #h(2em) Q > x^0.9 upright(" prime") \, $

where every prime divisor of $r$ lies between $exp \( \( log x \)^0.1 \)$ and $exp \( \( log x \)^0.3 \)$. We also prescribe a residue class on which the Legendre symbol $\( a \/ p \)$ equals $- 1$. This excludes $2$ as an index divisor. A nontrivial remaining index has a prime divisor in $r Q$: the factor $Q$ leads to a small elementary exceptional set, and the factors of $r$ fall within the uniform splitting estimate.

The construction starts with weighted integers $d = c r Q + 1$ of this shape. A sieve removes small prime factors of $d$. For a remaining composite $d = m n$, with $n$ its least prime factor, a marked bilinear estimate replaces the restriction on the cofactor $m$ by an explicit density and a weaker condition on its small prime factors. Buchstab’s least-prime-factor identity leaves a positive margin between the initial sifted mass and the mass removed in this comparison. A separate upper bound makes the contribution from two prime factors close to $sqrt(x)$ smaller than that margin.

The marked prime estimate is an input from #emph[The Poisson–Dirichlet law for the prime factors of $p - 1$] [21] Theorem 3.1. We extract its scalar coefficient criterion and verify the full character and frequency estimates for the rough-factor comparison. The weights require $d - 1$ to have a prime divisor in each of several prescribed ranges; these choices are the marks. A bounded multiplier in the bilinear estimate may depend on the quotient left after every power of these primes has been removed. A congruence condition on $d = m n$ need not have this invariance. We therefore expand $m n equiv u med \( mod med M \)$ in Dirichlet characters and separate it into factors $lambda \( m \) lambda \( n \)$ in the two scalar coefficient sequences. Fixed twists preserve the required long character-sum bound.

The resulting fixed-progression construction is stated separately in Proposition 3. It applies to any fixed data $M \, c \, u$ satisfying its local coprimality conditions, independently of the primitive-root application. Its proof uses Bombieri–Vinogradov distribution, a Brun–Hooley block sieve, and the continuous rough-number density [3,29,6,4]. The precise elementary sieve and density forms are adapted from [20] Lemmas 2.9 and 7.4, with proofs included here.

=== 1.4 Organization and notation <organization-and-notation>

Section 2 states the controlled-predecessor and splitting estimates and combines them to prove Theorem 1. Sections 3–8 prove Theorem 2 for a fixed arbitrary $F$ and $eta$, independently of the integer base. The analytic scale parameters in those sections are local to that proof. Section 9 returns to the fixed integer $a$ and derives the uniform splitting bound. Section 10 proves the marked coefficient and rough-factor estimates; Section 11 supplies the elementary sieve facts; Section 12 proves the fixed-progression construction. Appendix 13 verifies the selected Kazhdan–Patterson specialization and Whittaker normalization.

Throughout, $log$ is the natural logarithm, and $L = log x$ in the prime-counting arguments. The symbols $lt.double$ and $O$ have their usual meaning; subscripts record permitted dependence when it matters. Auxiliary parameters are fixed before the relevant asymptotic variable tends to infinity. Uniformity in those parameters is stated explicitly. The general representation-theoretic, class-field, Hecke-continuation, and classical sieve theorems are cited at their points of use. The marked Type II argument also uses the companion papers cited in the bibliography.

== 2 Reduction to controlled predecessors and complete splitting <sec:reduction>

For a prime $p divides.not a$, failure of $a$ to generate $bb(F)_p^times$ means that some prime divides the index

$ i_p \( a \) = frac(p - 1, "ord"_p \( a \)) . $

We construct primes for which the possible divisors of this index belong to two ranges. A large divisor forces $p$ to divide one of a short list of integers $a^j - 1$; the remaining divisors are controlled by complete splitting in Kummer fields. This is the index-divisor reduction underlying Hooley’s work [13] Sections 4–7.

The first proposition supplies the primes, with a fixed congruence that will force quadratic nonresiduosity.

#prodef([Proposition 2.1.])[
  (Primes with controlled predecessors).  #emph[ Let $M$ be a fixed positive multiple of $8$, let $c in { 2 \, 4 }$, and let $u$ be an integer satisfying 
#[#set math.equation(numbering: n => "(2.1)")
 $ \( u \, M \) = 1 \, #h(2em) c divides u - 1 \, #h(2em) (frac(u - 1, c) \, M / c) = 1 . $ <alg:progression-conditions>]

 For every sufficiently large real $x$, there are $gt.double_(M \, c \, u) x \/ L^2$ distinct primes $p in \( x \, 2 x \)$ satisfying 
#[#set math.equation(numbering: n => "(2.2)")
 $ p equiv u med \( mod med M \) \, #h(2em) p - 1 = c r Q \, #h(2em) Q > x^0.9 med upright("prime") \, $ <eq:controlled-predecessor>]

 where $r$ is a positive integer all of whose prime divisors lie in 
$ #scale(x: 120%, y: 120%)[\(] exp \( L^0.1 \) \, exp \( L^0.3 \) #scale(x: 120%, y: 120%)[\)] . $

]
] <prop:controlled>

We prove Proposition 3 in Section 12. For the second input, write $mu_m$ for the group of $m$th roots of unity. For a nonzero integer $a$ and a prime $q$, put

#[#set math.equation(numbering: n => "(2.3)")
 $ E_q = bb(Q) \( mu_q \) \, #h(2em) K_q = bb(Q) \( mu_q \, a^(1 \/ q) \) . $ <alg:kummer-fields>]

The choice of the root $a^(1 \/ q)$ does not affect $K_q$.

#prodef([Proposition 2.2.])[
  (Uniform bound for complete splitting).  #emph[Fix an integer $a$ with $\| a \| > 1$, and put $delta_0 = 10^(- 6)$. For all sufficiently large real $x$ and all primes $q$ sufficiently large in terms of $a$, with $q lt.eq exp \( L^0.3 \)$, one has 
#[#set math.equation(numbering: n => "(2.4)")
 $ \# { p upright(" prime") : x < p lt.eq 2 x \, med p upright(" splits completely in ") K_q } lt.double_a frac(x, q \( q - 1 \) L) + x^(1 - delta_0) . $ <eq:uniform-splitting>]

 The implied constant and the threshold for $x$ are independent of $q$. For $a = 2$, every prime $q gt.eq 5$ is allowed, with absolute constants and an absolute threshold for $x$.]
] <prop:splitting>

Section 9 proves this proposition from the Hecke zero-free theorem, Theorem 2. To apply it, we first record the elementary interpretation of complete splitting.

#prodef([Lemma 2.3.])[
  (Splitting test).  #emph[Let $a eq.not 0$ be an integer, and let $p \, q$ be primes with $p divides.not a q$. Then $p$ splits completely in $K_q$ if and only if 
#[#set math.equation(numbering: n => "(2.5)")
 $ p equiv 1 med \( mod med q \) \, #h(2em) a^(\( p - 1 \) \/ q) equiv 1 med \( mod med p \) . $ <eq:kummer-frobenius-test>]

]
] <alg:splitting-test>

#proof[
  The field $K_q$ is the splitting field of $T^q - a$. Fix a prime $frak(P)$ of $K_q$ above $p$. The roots are integral and have distinct reductions modulo $frak(P)$, since $p$ does not divide the polynomial discriminant $plus.minus q^q a^(q - 1)$. Every inertia element permutes the roots and fixes their reductions, so it fixes every root. Thus $p$ is unramified. Let $sigma$ be its arithmetic Frobenius at $frak(P)$. On $mu_q$, this automorphism acts by $zeta mapsto zeta^p$, so it fixes $E_q$ exactly when $p equiv 1 med \( mod med q \)$. Under this condition, with $alpha = a^(1 \/ q)$, we have
  $ frac(sigma \( alpha \), alpha) in mu_q \, #h(2em) frac(sigma \( alpha \), alpha) equiv alpha^(p - 1) = a^(\( p - 1 \) \/ q) med \( mod med frak(P) \) . $
  The division is valid because $p divides.not a$. Reduction on $mu_q$ is injective at $p eq.not q$, so the second congruence in (2.5) is equivalent to $sigma \( alpha \) = alpha$. Together the two conditions say that $sigma$ fixes the generators of $K_q$. Since $K_q \/ bb(Q)$ is Galois, this is precisely complete splitting. ◻
]

We now choose a progression of quadratic nonresidues satisfying all the hypotheses of Proposition 3.

#prodef([Lemma 2.4.])[
  (A progression of quadratic nonresidues).  #emph[Let $a in bb(Z)$ be neither $- 1$ nor an integer square, and set 
$ M = 8 product_(ell divides a\
ell upright(" odd prime")) ell . $

 There are $c in { 2 \, 4 }$ and an integer $u$ satisfying (2.1) such that every prime $p equiv u med \( mod med M \)$ satisfies $p divides.not a$ and $\( a \/ p \) = - 1$.]
] <alg:quadratic-progression>

#proof[
  Write $a = d_0 t^2$, where $t gt.eq 1$ is an integer and $d_0 eq.not 1$ is signed squarefree. We choose $u$ to be a unit modulo $M$, with $u equiv.not 1 med \( mod med ell \)$ for every odd prime $ell divides M$, and $u med mod med 8 in { 3 \, 5 \, 7 }$. These restrictions already imply $p divides.not a$.
  Suppose first that an odd prime $j gt.eq 5$ divides $d_0$. Fix any of the allowed residues modulo $8$ and at the odd primes other than $j$. Quadratic reciprocity expresses $\( d_0 \/ p \)$ as a fixed sign times $\( p \/ j \)$. Among the nonzero residues modulo $j$ other than $1$, there are $\( j - 3 \) \/ 2 gt.eq 1$ squares and $\( j - 1 \) \/ 2$ nonsquares. We can therefore choose $u med mod med j$ so that $\( d_0 \/ p \) = - 1$.
  If no such $j$ exists, the seven possibilities for $d_0$ are treated by the following table. Whenever $3 divides M$, also take $u equiv 2 med \( mod med 3 \)$.
  #[
  #set par(justify: false)
#table(
  columns: 8,
  align: (center, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$d_0$
], table.cell(rowspan: 1, colspan: 1)[$- 1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$- 6$
]),
  table.cell(rowspan: 1, colspan: 1)[$u med mod med 8$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$7$
],
)
]
  The supplementary laws give the first three entries. For the last four, the combined residues modulo $24$ are respectively $5 \, 5 \, 11 \, 23$; quadratic reciprocity gives $\( d_0 \/ p \) = - 1$ in each case. Odd primes dividing $M$ but not $d_0$ occur only in the square factor $t^2$ and can be assigned any allowed residue. The Chinese remainder theorem combines these choices into a class $u med \( mod med M \)$.
  If $u equiv 3$ or $7 med \( mod med 8 \)$, take $c = 2$; if $u equiv 5 med \( mod med 8 \)$, take $c = 4$. In each case $\( u - 1 \) \/ c$ is odd. For every odd $ell divides M$, the condition $u equiv.not 1 med \( mod med ell \)$ also makes $\( u - 1 \) \/ c$ nonzero modulo $ell$. This proves (2.1). Finally, $\( a \/ p \) = \( d_0 \/ p \) = - 1$, since $p divides.not t$. ◻
]

#proof[
  Fix $a$ as in the theorem, so $\| a \| > 1$. Choose $M \, c \, u$ by Lemma 6, and take the $gt.double_a x \/ L^2$ primes supplied by Proposition 3. For each such prime $p$, Euler’s criterion gives $a^(\( p - 1 \) \/ 2) equiv - 1 med \( mod med p \)$. Consequently $i_p \( a \)$ is odd: an even index would make $"ord"_p \( a \)$ divide $\( p - 1 \) \/ 2$.
  If $i_p \( a \) > 1$, choose a prime divisor $q$ of this index. Since $p - 1 = c r Q$ and $c$ is a power of $2$, we have $q divides r Q$. Moreover $"ord"_p \( a \) divides \( p - 1 \) \/ q$, so (2.5) holds. We bound the number of such primes $p$ in the two possible ranges of $q$.
  If $q = Q$, then
  $ 1 lt.eq frac(p - 1, Q) < 2 x^0.1 . $
  Thus $p$ divides the positive integer
  $ B_a \( x \) = product_(1 lt.eq j lt.eq 2 x^0.1) \| a^j - 1 \| . $
  No factor vanishes because $\| a \| > 1$, and
  $ log B_a \( x \) lt.eq sum_(1 lt.eq j lt.eq 2 x^0.1) #scale(x: 120%, y: 120%)[\(] j log \| a \| + log 2 #scale(x: 120%, y: 120%)[\)] lt.double_a x^0.2 . $
  Every distinct prime divisor $p > x$ contributes at least $L$ to this logarithm. The number of primes lost in this case is therefore $O_a \( x^0.2 \/ L \) = o \( x \/ L^2 \)$.
  If $q divides r$, then $exp \( L^0.1 \) < q < exp \( L^0.3 \)$. For large $x$, all these primes are sufficiently large for Proposition 4; also $p divides.not a q$. Lemma 5 and a union bound give at most
  #[#set math.equation(numbering: n => "(2.6)")
   $ & lt.double_a x / L sum_(m > exp \( L^0.1 \)) frac(1, m \( m - 1 \)) + x^(1 - delta_0) exp \( L^0.3 \)\
 & lt.double_a x / L exp \( - L^0.1 \) + x exp \( - delta_0 L + L^0.3 \) = o \( x \/ L^2 \) $ <alg:exceptional-small-divisors>]
  primes, where the first sum is over integers. The first estimate uses (2.4) for each possible $q$; the second uses the telescoping sum of $1 \/ \( m \( m - 1 \) \)$.
  Subtracting these two losses leaves $gt.double_a x \/ L^2$ primes with $i_p \( a \) = 1$. All choices depend only on $a$, and both estimates hold for every sufficiently large real $x$. This proves the theorem. ◻
]

For $a = 2$, the theorem gives $gt.double x \/ L^2$ primes in $\( x \, 2 x \)$ with primitive root $2$, with absolute constants. This case can use the particularly simple choice $\( M \, c \, u \) = \( 8 \, 4 \, 5 \)$ in Proposition 3: the predecessors are $4 r Q$, and $p equiv 5 med \( mod med 8 \)$ gives $\( 2 \/ p \) = - 1$ directly.

#prodef([Remark 2.5.])[
  Negative squares are covered by the row $d_0 = - 1$ in the progression lemma. Odd perfect powers also require no separate exclusion. If $a = b^h$ with fixed odd $h > 1$, every prime divisor of $h$ is eventually smaller than every prime factor of $r Q$; hence $\( h \, p - 1 \) = 1$ for the constructed primes. This explains directly how the controlled predecessor removes the obstruction from the fixed exponent.
]

== 3 S-integers, residue symbols, and Gauss sums <sec:arithmetic>

The analytic argument will sum over ideals while also using their generators in local fields. We first choose generators for which reciprocity has no supplementary factor. We then identify the two Hecke characters which account for the phases of the cubic and sextic Gauss sums.

Fix a cyclotomic field $F$ containing $mu_12$, and put $\[ F : bb(Q) \] = 2 r$. At a finite place $v$, normalize the absolute value by $\| pi.alt_v \|_v = \( upright(N) v \)^(- 1)$; at a complex place use the square of the ordinary modulus. These are the absolute values in the product formula. Let

$ psi = product_v psi_v : bb(A)_F \/ F arrow.r bb(C)^times $

be the standard trace additive character. We also fix a finite-order Hecke character $eta$. Choose a finite set $S$ containing the complex places, all places above $6$, the finite conductor of $eta$, and every place at which $cal(O)_v$ is not self-dual for the pairing $psi_v \( x y \)$. The theta normalization in 13 and the local Euler-product estimate in 24 require two additional fixed finite sets of excluded places. Include both sets in $S$. Their existence is established at those points, independently of the summation variables and of the arithmetic choices below. We may include any further fixed finite set of places. Enlarging $S$ by finitely many primes which generate the ideal class group, we arrange that the ring of S-integers

$ R = cal(O)_S = { a in F : v_(frak(p)) \( a \) gt.eq 0 upright(" for every ") frak(p) in.not S } $

is principal. This is the final choice of $S$, and all arithmetic data below are constructed for it before the coefficient family is defined. All assertions in this section concern this fixed $F$ and $S$; their auxiliary constants may depend on them.

Write $S_f$ for the finite places in $S$, $s_f = \| S_f \|$, and

$ U_S = R^times \, #h(2em) F_S = product_(v in S) F_v \, #h(2em) \| y \|_S = product_(v in S) \| y_v \|_v \, #h(2em) F_S^1 = { y in F_S^times : \| y \|_S = 1 } . $

An #emph[exterior ideal] is a nonzero integral ideal of $R$, equivalently an ideal supported at primes outside $S$. Its norm is $q_(frak(a)) = upright(N) frak(a) = \| R \/ frak(a) \|$, extended multiplicatively to fractional ideals. Roman letters will denote generators of the corresponding fraktur ideals. For $a in F^times$, put $q_a = \| a \|_S$. Finally, on the additive group $F_S$ set

$ upright(e) \( x \) = product_(v in S) psi_v \( x_v \) \, #h(2em) hat(f) \( y \) = integral_(F_S) f \( x \) upright(e) \( - x y \) thin d x \, $

where $d x$ is the product of the self-dual local additive measures.

#prodef([Lemma 3.1.])[
  (The S-integer lattice).  #emph[The diagonal copy of $R$ is a discrete cocompact subgroup of $F_S$, is its own annihilator for the pairing $upright(e) \( x y \)$, and has covolume $1$. For every Bruhat–Schwartz function $f$ on $F_S$, 
$ sum_(m in R) f \( m \) = sum_(nu in R) hat(f) \( nu \) . $

 If $frak(a) = a R$ is an exterior fractional ideal, then 
$ q_a = q_(frak(a)) \, #h(2em) \( a R \)^perp = a^(- 1) R \, #h(2em) sum_(m in a R) f \( m \) = q_(frak(a))^(- 1) sum_(nu in a^(- 1) R) hat(f) \( nu \) . $

]
] <lem:s-lattice>

#proof[
  Put $K^S = product_(v in.not S) cal(O)_v$, embedded in the adeles with zero S-components. At every place outside $S$, the defining conductor condition says that $cal(O)_v$ is its own annihilator. Its self-dual measure is consequently $1$, and $hat(upright(bold(1))_(K^S)) = upright(bold(1))_(K^S)$. Adelic additive duality identifies the annihilator of $F$ in $bb(A)_F$ with $F$, and the additive quotient $bb(A)_F \/ F$ has volume $1$; see [30] Chapter II, §29. Strong approximation identifies
  $ F_S \/ R tilde.eq bb(A)_F \/ \( F + K^S \) . $
  The quotient is compact because $bb(A)_F \/ F$ is compact. To check discreteness, choose a compact neighborhood $C$ of zero in $F_S$. The intersection $F ∩ \( C times K^S \)$ is finite because diagonal $F$ is discrete and closed in the adeles. Shrinking $C$ excludes the finitely many nonzero S-components in this intersection, so zero is isolated in $R$. Taking annihilators in the last quotient gives
  $ \( F + K^S \)^perp = F ∩ \( F_S times K^S \) = R \, $
  with $R$ diagonally embedded, so its annihilator in $F_S$ is indeed $R$. The covolume of a lattice and that of its annihilator are reciprocal under self-dual measure; hence this covolume is $1$.
  More directly, apply adelic Poisson summation [30] Chapter III, §41, equation (39) to $f ⊗ upright(bold(1))_(K^S)$. Only the elements of $R$ occur on either side, and the exterior factor is unchanged by Fourier transform. This gives the displayed Poisson identity with no scalar factor. Multiplication by $a$ has additive modulus $\| a \|_S$, so scaling this identity gives the formula for $a R$. The product formula gives
  $ \| a \|_S = product_(v in.not S) \| a \|_v^(- 1) = upright(N) \( a R \) = q_(frak(a)) \, $
  which finishes the proof. ◻
]

We use Hilbert symbols to remove the supplementary factor in sextic reciprocity. Choose the local reciprocity map $"Art"_v$ in which a uniformizer acts as arithmetic Frobenius on an unramified extension. For $n in { 2 \, 3 \, 6 }$, set

$ \( a \, b \)_(n \, v) = frac("Art"_v \( b \) \( a^(1 \/ n) \), a^(1 \/ n)) . $

This orders the two arguments oppositely to the convention in [19] Chapter V, §3. Thus, at a place of residue characteristic prime to $n$, for a unit $u$ and a uniformizer $pi.alt$,

$ \( u \, pi.alt \)_(n \, v) equiv u^(\( upright(N) v - 1 \) \/ n) med \( mod med v \) . $

The value is read in $mu_n subset F$. On

$ cal(V) = F_S^times \/ F_S^(times 6) $

define $H_S \( x \, y \) = product_(v in S) \( x_v \, y_v \)_(6 \, v)$, and let $E$ be the image of $U_S$ in $cal(V)$. For $T > 0$, let $ell_T in F_S^times$ have finite components $1$ and component $T^(1 \/ \( 2 r \))$ at every complex place. Then $\| ell_T \|_S = T$.

#prodef([Lemma 3.2.])[
  (Generators with fixed power classes).  #emph[The pairing $H_S$ on $cal(V)$ is nondegenerate and alternating. The map $U_S \/ U_S^6 arrow.r cal(V)$ is injective, its image $E$ satisfies $E^perp = E$, and there is an isotropic subgroup $B$ such that $cal(V) = E xor B$.]
  #emph[Every exterior fractional ideal $frak(a)$ has a generator $a$ whose class $\[ a \]$ in $cal(V)$ belongs to $B$. Any two such generators differ by an element of $U_S^6$. They can be chosen so that 
$ a \/ ell_(q_(frak(a))) in cal(K)_(upright("bal")) $

 for one fixed compact subset $cal(K)_(upright("bal")) subset F_S^1$, independent of $frak(a)$.]
] <lem:balanced-generators>

#proof[
  For $ell = 2 \, 3$, put $cal(V)_ell = F_S^times \/ F_S^(times ell)$. Local Kummer theory and local reciprocity give a nondegenerate Hilbert pairing on this group [19] Chapter V, Proposition (3.2). At a finite place $v$,
  $ dim_(bb(F)_ell) F_v^times \/ F_v^(times ell) = 2 + upright(bold(1))_(v divides ell) \[ F_v : bb(Q)_ell \] . $
  Indeed the valuation contributes one dimension. When $v divides.not ell$, the residue units contribute one dimension and the principal units are $ell$-divisible. When $v divides ell$, the principal units have a $bb(Z)_ell$-part of rank $\[ F_v : bb(Q)_ell \]$ and an $ell$-power root-of-unity part contributing one more dimension. The latter is present because $F$ contains $mu_ell$. This is also the local power-class formula [19] Chapter II, Corollary (5.8). Complex power-class groups are trivial. All places above $ell$ lie in $S$, so their local degrees sum to $2 r$ and
  #[#set math.equation(numbering: n => "(3.1)")
   $ dim_(bb(F)_ell) cal(V)_ell = 2 s_f + 2 r . $ <eq:local-power-dimension>]
  The S-unit theorem [19] Chapter I, Corollary (11.7) gives $U_S tilde.eq mu \( F \) times bb(Z)^(r + s_f - 1)$. Since $mu \( F \)$ is cyclic and contains $mu_ell$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ dim_(bb(F)_ell) U_S \/ U_S^ell = r + s_f . $ <eq:unit-power-dimension>]
  We next check that the latter group injects into $cal(V)_ell$. Suppose that $u in U_S$ is an $ell$-th power in every $F_v$ with $v in S$. The Kummer extension $F \( u^(1 \/ ell) \) \/ F$ is cyclic and split at $S$. At every exterior prime $u$ is a unit and $ell$ is invertible, so this extension is unramified there. It is consequently an everywhere unramified abelian extension in which every S-prime splits. The Hilbert class-field correspondence, together with the quotient description of the S-class group, identifies such extensions with quotients of the class group of $R$, which is trivial [19] Chapter I, Proposition (11.6); Chapter VI, Proposition (6.9) and Theorem (7.3). Hence $u = t^ell$ for $t in F$. Its exterior valuations show $t in U_S$, proving the injection.
  For two S-units, every exterior Hilbert symbol is $1$, since both arguments are units and the residue characteristic is prime to $6$. Hilbert reciprocity [19] Chapter VI, Theorem (8.1) therefore makes their S-product $1$. The Hilbert pairing is alternating here: $- 1 = zeta_12^6$, and the diagonal identity $\( x \, x \)_(n \, v) = \( x \, - 1 \)_(n \, v)$ makes its diagonal trivial for $n = 2 \, 3 \, 6$. By (3.1) and (3.2), the injected unit image in $cal(V)_ell$ is an isotropic subspace of half the dimension. Nondegeneracy implies that it is self-orthogonal. Symplectic linear algebra supplies an isotropic complementary subspace for each $ell$. The Chinese remainder isomorphism $cal(V) tilde.eq cal(V)_2 xor cal(V)_3$, under which the two pairings are the third and second powers of $H_S$, combines these complements into $B$. It also gives the asserted injection and self-orthogonality for exponent $6$.
  Let $frak(a) = a_0 R$. Decompose $\[ a_0 \] = e b$ in $E xor B$, and choose an S-unit representing $e^(- 1)$. Its product with $a_0$ is a generator $a$ with $\[ a \] in B$. If $a'$ is another, then $a' \/ a$ is an S-unit whose class lies in $E ∩ B$. It is therefore locally a sixth power at $S$, and the injection already proved says $a' \/ a in U_S^6$.
  Finally $a \/ ell_(q_(frak(a)))$ belongs to $F_S^1$, by 8. To see the relevant compactness explicitly, the norm-one idele class group is compact [19] Chapter VI, Theorem (1.6). The subgroup $F_S^1 times product_(v in.not S) cal(O)_v^times$ is open in the norm-one ideles and meets diagonal $F^times$ in $U_S$. Its quotient by $U_S$ is therefore an open, hence closed, subgroup of that compact idele class group. Its projection onto $F_S^1 \/ U_S$ is surjective, so $F_S^1 \/ U_S$ is compact. Since $U_S^6$ has finite index in $U_S$, $F_S^1 \/ U_S^6$ is compact as well. Choosing a compact set which maps onto this quotient and multiplying $a$ by a suitable element of $U_S^6$ proves the last assertion. ◻
]

Call a generator with class in $B$ #emph[allowed], and call it #emph[balanced] when it satisfies the compactness condition in 9. We use balanced representatives for estimates involving S-components. In multiplicative identities we may instead use the product of the allowed generators of the prime factors: the product remains allowed and differs from the selected representative by an element of $U_S^6$.

For an exterior prime $frak(p)$, the reduction of $mu_6$ into $\( R \/ frak(p) \)^times$ is injective. Define the sextic residue character by

$ chi_(frak(p)) \( x \) equiv x^(\( q_(frak(p)) - 1 \) \/ 6) med \( mod med frak(p) \) quad \( x equiv.not 0 med \( mod med frak(p) \) \) \, #h(2em) chi_(frak(p)) \( 0 \) = 0 . $

For every integer $j$, the notation $chi_(frak(p)) \( x \)^j$ means the usual character power on units and means $0$ on nonunits, also when $j equiv 0 med \( mod med 6 \)$. If $frak(a) = product_(frak(p)) frak(p)^(k_(frak(p)))$, put

$ chi_(frak(a)) \( x \) = product_(frak(p) divides frak(a)) chi_(frak(p)) \( x \)^(k_(frak(p))) \, #h(2em) chi_R \( x \) = 1 . $

The same zero convention applies to powers of $chi_(frak(a))$.

For distinct exterior primes with allowed generators $p \, p'$, global reciprocity gives the exact equality

#[#set math.equation(numbering: n => "(3.3)")
 $ chi_(frak(p)) \( p' \) = chi_(frak(p)') \( p \) . $ <eq:sextic-reciprocity>]

Indeed the only possibly nontrivial exterior symbols in the product formula for $\( p \, p' \)_6$ are $\( p \, p' \)_(6 \, frak(p)) = chi_(frak(p)) \( p' \)^(- 1)$ and $\( p \, p' \)_(6 \, frak(p)') = chi_(frak(p)') \( p \)$. The S-product is $1$ because $B$ is isotropic. If $m in R \\ { 0 }$ and $frak(b) = \( m \) R$, write $m = epsilon.alt b$ with $b$ allowed and $epsilon.alt in U_S$. Multiplying (3.3) over prime factors gives, for an allowed generator $a$ of $frak(a)$,

#[#set math.equation(numbering: n => "(3.4)")
 $ chi_(frak(a)) \( m \) = chi_(frak(a)) \( epsilon.alt \) chi_(frak(b)) \( a \) . $ <eq:generator-reciprocity>]

This includes the case $\( frak(a) \, frak(b) \) eq.not R$: both sides are then zero. For an S-unit $epsilon.alt$, the same product formula gives

#[#set math.equation(numbering: n => "(3.5)")
 $ chi_(frak(a)) \( epsilon.alt \) = H_S \( epsilon.alt \, a \)^(- 1) . $ <eq:unit-symbol>]

Thus its dependence on $frak(a)$ is through the finite class $\[ a \]$.

#prodef([Lemma 3.3.])[
  (Kummer and class characters).  #emph[For $u in R \\ { 0 }$, the ideal function 
$ chi_bullet \( u \) \( frak(a) \) = chi_(frak(a)) \( u \) $

 is induced away from $S$ and the prime divisors of $\( u \) R$ by a finite-order Hecke character. Its values at those prime divisors are set equal to zero. If $frak(f)_u$ is the conductor of the inducing primitive character, then 
#[#set math.equation(numbering: n => "(3.6)")
 $ upright(N) frak(f)_u lt.eq C_(F \, S) upright(N) "rad" \( \( u \) R \) lt.eq C_(F \, S) q_u . $ <eq:kummer-conductor>]

 The same bound, with a changed constant, holds after twisting by the fixed $eta$. The inducing characters associated to $u$ and $v$ agree if and only if $u \/ v in F^(times 6)$.]
  #emph[Every character of the finite group $B$, evaluated on allowed generators, extends to a finite-order Hecke character unramified outside $S$.]
  #emph[The following parametrization will index the nonzero Poisson frequencies; its character distinctness and conductor bound will be used in zero detection. Choose a complete set of representatives $cal(U)$ modulo $U_S^6$ among the nonzero S-integers whose exterior valuations belong to ${ 0 \, 1 \, dots.h \, 5 }$, with $1 in cal(U)$. For allowed generators $r$, the map 
#[#set math.equation(numbering: n => "(3.7)")
 $ \( u \, frak(r) \) mapsto \[ u r^6 \] quad upright("from ") cal(U) times { upright("exterior ideals") } quad upright("to ") \( R \\ { 0 } \) \/ U_S^6 $ <eq:frequency-decomposition>]

 is a bijection. Among $u in cal(U)$, only $u = 1$ induces the principal character, and distinct $u$’s induce distinct characters, also after the fixed twist by $eta$.]
] <lem:kummer-characters>

#proof[
  Because $mu_6 subset F$, Kummer theory [19] Chapter IV, Theorem (3.3) and Corollary (3.6) identifies $u in F^times$ with the character
  $ kappa_u \( sigma \) = frac(sigma \( u^(1 \/ 6) \), u^(1 \/ 6)) quad upright("of ") "Gal" \( overline(F) \/ F \) \, $
  whose kernel as a function of $u$ is exactly $F^(times 6)$. Global class-field theory identifies this finite abelian character with a finite-order Hecke character [19] Chapter VI, Theorem (5.5) and Proposition (5.6). At an exterior prime $frak(p) divides.not \( u \) R$, arithmetic Frobenius satisfies
  $ kappa_u \( "Frob"_(frak(p)) \) equiv \( u^(1 \/ 6) \)^(q_(frak(p)) - 1) = u^(\( q_(frak(p)) - 1 \) \/ 6) = chi_(frak(p)) \( u \) med \( mod med frak(p) \) . $
  Reduction is injective on $mu_6$, so these are equal as roots of unity. This proves the asserted identification on good primes.
  At an exterior place, the principal units are sixth powers by Hensel’s lemma. Hence the associated local Hilbert character is trivial on principal units, giving conductor exponent at most one. The tame Hilbert formula [19] Chapter V, Proposition (3.4) shows that the pairing of two units is $1$, so if $u$ is a local unit the character is unramified. At a place in $S$, it depends only on the class of $u$ in the finite group $F_v^times \/ F_v^(times 6)$; the finitely many resulting local conductors have a fixed maximum. This proves (3.6). A fixed twist supported in $S$ only changes that maximum. Equality of two inducing Hecke characters is equality of their Kummer characters, since unramified Frobenius elements determine a finite abelian character. The Kummer kernel gives the stated criterion. Setting extra prime values to zero merely omits Euler factors and does not alter the inducing character.
  For a character $theta_B$ of $B$, extend it to $cal(V) = E xor B$ by $theta_S \( e b \) = theta_B \( b \)$. This is a continuous finite-order character of $F_S^times$ trivial on $U_S$. If $frak(a) = a R$, define $theta \( frak(a) \) = theta_S \( a \)$. It is independent of the generator and multiplicative. At every exterior place take the unramified local character sending a uniformizer to $theta \( frak(p) \)$, and at $S$ take $theta_S^(- 1)$. Their product is trivial on diagonal $F^times$ by construction and is the required Hecke character.
  To prove (3.7), divide each exterior valuation of a nonzero $h$ by $6$. This determines an ideal $frak(r)$ and the exterior valuations of an S-integer $u_0 = h \/ r^6$ in ${ 0 \, dots.h \, 5 }$. Replacing $u_0$ by its representative in $cal(U)$ changes $u_0 r^6$ only by an element of $U_S^6$. Conversely, the exterior valuations of $\[ u r^6 \]$ determine $frak(r)$ and those of $u$; equality of two such classes then says that the two representatives $u$ differ by $U_S^6$. Changing an allowed $r$ by $U_S^6$ does not affect its image in the quotient. This proves bijectivity.
  If $u in cal(U)$ induces the principal character, the first part gives $u = t^6$ in $F$. Its exterior valuations are divisible by $6$ and between $0$ and $5$, hence are all zero; the same is true for the exterior valuations of $t$. Thus $u in U_S^6$, giving $u = 1$. If $u \, v in cal(U)$ induce the same character, the differences of their exterior valuations are divisible by $6$ and lie in $\[ - 5 \, 5 \]$, so vanish. Their quotient is then a sixth power of an S-unit, and $u = v$. The fixed twist by $eta$ cancels from an equality of twisted characters. ◻
]

We now determine the phases of the Gauss sums. If $frak(c)$ is a squarefree exterior ideal with allowed generator $c$, define

#[#set math.equation(numbering: n => "(3.8)")
 $ gamma_j \( frak(c) \) = q_(frak(c))^(- 1 \/ 2) sum_(x med mod med frak(c)) chi_(frak(c)) \( x \)^j upright(e) \( x \/ c \) \, #h(2em) gamma_j \( R \) = 1 . $ <eq:normalized-gauss>]

The additive character on $R \/ frak(c)$ here is primitive by 8. A change $c mapsto epsilon.alt^6 c$, with $epsilon.alt in U_S$, changes the additive argument by a sixth power and is absorbed by a change of residue variable; hence the sum is independent of the allowed generator. At an exterior prime, the adelic product formula gives

$ upright(e) \( x \/ p \) = psi_(frak(p)) \( - x \/ p \) . $

The reduction of $mu_12$ is injective there, so $q_(frak(p)) equiv 1 med \( mod med 12 \)$ and $chi_(frak(p)) \( - 1 \) = 1$. The minus sign can therefore be suppressed in all these prime Gauss sums.

#prodef([Lemma 3.4.])[
  (The Gauss correction characters).  #emph[There are a unitary Hecke character $Lambda$, unramified outside $S$, and a finite-order Hecke character $G$, unramified outside $S$, such that for every exterior prime $frak(p)$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ gamma_2 \( frak(p) \)^3 = - Lambda \( frak(p) \) \, #h(2em) G \( frak(p) \) = overline(chi_(frak(p)) \( 4 \)) thin gamma_3 \( frak(p) \) \, #h(2em) gamma_1 \( frak(p) \) gamma_2 \( frak(p) \) = - Lambda \( frak(p) \) G \( frak(p) \) . $ <eq:gauss-corrections>]

 At each complex place the infinity type of $Lambda$ is purely angular of exponent $1$ or $- 1$, in the ordinary angular coordinate. The values $gamma_3 \( frak(p) \)$ are signs and depend multiplicatively on the class of an allowed $p$ in $B$.]
  #emph[For coprime squarefree exterior ideals, 
#[#set math.equation(numbering: n => "(3.10)")
 $ gamma_j \( frak(c)_1 frak(c)_2 \) = chi_(frak(c)_1) \( c_2 \)^j chi_(frak(c)_2) \( c_1 \)^j gamma_j \( frak(c)_1 \) gamma_j \( frak(c)_2 \) . $ <eq:gauss-crt>]

]
] <lem:gauss-characters>

#proof[
  First work over a finite field $k$ of size $Q$, with a nontrivial additive character $psi_k$, a character $chi$ of exact order $6$, and $rho = chi^2$. Write
  $ G_j = sum_(x in k) chi \( x \)^j psi_k \( x \) \, #h(2em) J \( alpha \, beta \) = sum_(x in k) alpha \( x \) beta \( 1 - x \) . $
  For nontrivial characters the usual Gauss inversion and Gauss–Jacobi identities give
  #[#set math.equation(numbering: n => "(3.11)")
   $ G_2 G_4 = Q \, #h(2em) G_2^2 = J \( rho \, rho \) G_4 \, #h(2em) \( Q^(- 1 \/ 2) G_2 \)^3 = Q^(- 1 \/ 2) J \( rho \, rho \) . $ <eq:cubic-jacobi>]
  The first equality uses $rho \( - 1 \) = 1$. Changing $psi_k \( x \)$ to $psi_k \( a x \)$ multiplies $G_j$ by $overline(chi \( a \))^(thin j)$, so the cube in (3.11) is independent of the additive character.
  Let $E_0 = bb(Q) \( omega \)$, where $omega^2 + omega + 1 = 0$. Every ideal of $bb(Z) \[ omega \]$ prime to $3$ has a unique generator congruent to $1$ modulo $3$; denote it by $pi_(+) \( frak(a) \)$. This follows from class number one and the bijection of the six units with $\( bb(Z) \[ omega \] \/ 3 \)^times$, and is the convention used in [2] §2.1. For a prime $frak(q) divides.not 6$ with residue size $Q$, take $rho \( x \) equiv x^(\( Q - 1 \) \/ 3) med \( mod med frak(q) \)$. Reduction of the Jacobi sum gives
  $ J \( rho \, rho \) equiv sum_(x in bb(F)_Q) x^(\( Q - 1 \) \/ 3) \( 1 - x \)^(\( Q - 1 \) \/ 3) = 0 med \( mod med frak(q) \) \, $
  since every monomial has degree strictly between $0$ and $Q - 1$. The Gauss identities also give $\| J \( rho \, rho \) \|^2 = Q$. To determine the unit, put $t = 1 - omega$; the ideals $\( t^2 \)$ and $\( 3 \)$ are equal. Writing $rho \( x \) = omega^(k \( x \))$, with $k \( x \) in { 0 \, 1 \, 2 }$, and expanding modulo $t^2$ yields
  $ J \( rho \, rho \) equiv Q - 2 - t sum_(x eq.not 0 \, 1) #scale(x: 120%, y: 120%)[\(] k \( x \) + k \( 1 - x \) #scale(x: 120%, y: 120%)[\)] equiv Q - 2 - 2 \( Q - 1 \) t equiv - 1 med \( mod med 3 \) . $
  Here each value of $rho$ occurs $\( Q - 1 \) \/ 3$ times on $bb(F)_Q^times$, and $Q equiv 1 med \( mod med 3 \)$. Divisibility by $frak(q)$, the norm equality, and this congruence show
  #[#set math.equation(numbering: n => "(3.12)")
   $ J \( rho \, rho \) = - pi_(+) \( frak(q) \) . $ <eq:eisenstein-jacobi>]
  This is also the prime case of the classical cubic Gauss identity $g \( n \)^3 = mu \( n \) upright(N) \( n \) n$ in [2] §2.2, equation (11) in arXiv:0804.2233v4.
  Define on ideals of $E_0$ prime to $3$
  $ Lambda_(E_0) \( frak(a) \) = frac(pi_(+) \( frak(a) \), \| pi_(+) \( frak(a) \) \|) . $
  The generators congruent to $1 med \( mod med 3 \)$ multiply, so this is a multiplicative ideal character. On a principal ideal generated by $a equiv 1 med \( mod med 3 \)$ its value is $a \/ \| a \|$; thus it is the unitary Hecke character of finite conductor dividing $\( 3 \)$ and angular infinity type of exponent $1$, in ideal-character convention. Set $Lambda = Lambda_(E_0) compose upright(N)_(F \/ E_0)$. If $frak(p)$ lies above $frak(q)$ with residue degree $f$, the power definition of the residue character shows that the cubic character at $frak(p)$ is the lift of that at $frak(q)$ by the residue-field norm. The Davenport–Hasse Jacobi lifting formula says
  $ J_(bb(F)_(Q^f)) \( rho compose upright(N) \, rho compose upright(N) \) = \( - 1 \)^(f - 1) J_(bb(F)_Q) \( rho \, rho \)^f \; $
  its hypotheses hold because $rho$, $rho$, and $rho^2$ are all nontrivial [14] Theorem 1.1. By (3.12), the right side is $- pi_(+) \( frak(q) \)^f$. Since $upright(N)_(F \/ E_0) frak(p) = frak(q)^f$, (3.11) proves $gamma_2 \( frak(p) \)^3 = - Lambda \( frak(p) \)$. The local norm at infinity is a product of complex coordinates or their conjugates. Consequently its angular exponent at each complex place of $F$ is $1$ or $- 1$, with no radial factor. Pullback by norm is unramified wherever $Lambda_(E_0)$ is unramified, so its finite conductor is supported in $S$.
  For the quadratic sum we use one global additive character to relate the local signs. For $a in F_v^times$, define the normalized Weil index
  $ frak(w)_v \( a \) = frac("WeilIndex"_(psi_v) \( a x^2 \), "WeilIndex"_(psi_v) \( x^2 \)) . $
  It depends only on the square class of $a$. Weil’s product formula and the Hilbert-symbol identity are
  #[#set math.equation(numbering: n => "(3.13)")
   $ product_v frak(w)_v \( a \) = 1 quad \( a in F^times \) \, #h(2em) frak(w)_v \( a \) frak(w)_v \( b \) = \( a \, b \)_(2 \, v) frak(w)_v \( a b \) \; $ <eq:weil-index>]
  see [30] Chapter II, §28 and Proposition 5 in §30. At an odd conductor-zero place, the local Gauss integral for the Weil index [30] Chapter II, §27 gives $frak(w)_v \( u \) = 1$ for a unit $u$ and
  $ frak(w)_(frak(p)) \( p^(- 1) \) = q_(frak(p))^(- 1 \/ 2) sum_(x med mod med frak(p)) psi_(frak(p)) \( x^2 \/ p \) = q_(frak(p))^(- 1 \/ 2) sum_(x med mod med frak(p)) chi_(frak(p)) \( x \)^3 psi_(frak(p)) \( x \/ p \) = gamma_3 \( frak(p) \) . $
  For the second equality, the number of square roots of $x$ is $1 + chi_(frak(p)) \( x \)^3$, and the sum of a nontrivial additive character is zero. The last equality uses $chi_(frak(p)) \( - 1 \) = 1$.
  Put $frak(w)_S = product_(v in S) frak(w)_v$. Applying the first identity of (3.13) to $p^(- 1)$, all exterior places other than $frak(p)$ contribute $1$, and hence
  $ gamma_3 \( frak(p) \) = frak(w)_S \( p^(- 1) \)^(- 1) . $
  On $B$ the multiplicative defect in the second identity is
  $ product_(v in S) \( a \, b \)_(2 \, v) = H_S \( a \, b \)^3 = 1 . $
  Thus $\[ a \] mapsto frak(w)_S \( a^(- 1) \)^(- 1)$ is a character of $B$ factoring through square classes. It takes values in ${ plus.minus 1 }$; equivalently Gauss inversion gives $gamma_3 \( frak(p) \)^2 = chi_(frak(p)) \( - 1 \)^3 = 1$. Extend this B-character by 10. Since $4$ is an S-unit, $chi_bullet \( 4 \)$ is also a finite-order Hecke character unramified outside $S$. Their product, with $chi_bullet \( 4 \)$ conjugated, defines $G$ and gives its displayed prime value.
  It remains to check the sextic duplication factor. In the finite-field notation above put $phi.alt = chi^3$. Completing the square and counting square roots gives
  $ J \( chi \, chi \) = overline(chi \( 4 \)) sum_(t in k) chi \( 1 - t^2 \) = overline(chi \( 4 \)) J \( phi.alt \, chi \) . $
  In the second equality the part without $phi.alt$ vanishes, since $chi$ is nontrivial. Applying the Gauss–Jacobi identity to both sides yields
  $ G_1 G_4 = overline(chi \( 4 \)) G_2 G_3 . $
  Together with $G_2 G_4 = Q$, this gives
  $ gamma_1 \( frak(p) \) gamma_2 \( frak(p) \) = overline(chi_(frak(p)) \( 4 \)) thin gamma_3 \( frak(p) \) gamma_2 \( frak(p) \)^3 = - Lambda \( frak(p) \) G \( frak(p) \) . $
  Finally use the allowed product $c_1 c_2$ to evaluate the sum at $frak(c)_1 frak(c)_2$. Chinese remaindering writes its additive character as the product of the characters modulo $frak(c)_i$, with their arguments multiplied respectively by $c_2^(- 1)$ and $c_1^(- 1)$. Changing the two residue variables contributes $chi_(frak(c)_1) \( c_2 \)^j chi_(frak(c)_2) \( c_1 \)^j$. This proves (3.10), including $j equiv 0 med \( mod med 6 \)$ with the specified zero convention. ◻
]

For later use set

$ theta.alt = overline(Lambda) thin overline(G) thin eta . $

Its finite conductor is supported in $S$. If $theta.alt_v$ denote its idele-class components, define

$ L_S \( y \) = product_(v in S) theta.alt_v \( y_v \)^(- 1) . $

The global character is trivial on $F^times$, so for every exterior ideal with allowed generator $a$,

#[#set math.equation(numbering: n => "(3.14)")
 $ theta.alt \( frak(a) \) = L_S \( a \) \, #h(2em) L_S \( epsilon.alt \) = 1 quad \( epsilon.alt in U_S \) . $ <eq:vartheta-s>]

This is a smooth unitary character of $F_S^times$. Finite-order characters are trivial on the connected group $bb(C)^times$; hence the infinity components contributed by $G$ and $eta$ are trivial. Those of $L_S$ are therefore purely angular of exponent $1$ or $- 1$ at each complex place.

== 4 The coefficient family and analytic comparison <sec:coefficient-family>

The two analytic evaluations use the same family of coefficient sums. We define that family and state the second moment proved by the theta and reflection arguments, then explain how the moment enters the zero-free argument.

Retain the field $F$, the final set $S$, the ring $R = cal(O)_S$, and the generator convention fixed in 3. Unless explicitly stated otherwise, all ideals in this section are integral exterior ideals. A roman letter representing an ideal is always an allowed $B$-generator; it need not be balanced unless this is stated. In particular, products of allowed prime generators are permitted. The row variable $m$ below ranges over all of $R$.

For $"Re" s > 1$, write $zeta_F^S \( s \) = sum_(frak(a)) q_(frak(a))^(- s)$ for the Dedekind zeta function with its factors at $S$ omitted, and set

$ L_F^S \( s \, eta \) = L^S \( s \, eta \) := product_(frak(p) in.not S) \( 1 - eta \( frak(p) \) q_(frak(p))^(- s) \)^(- 1) . $

The latter notation also denotes the usual meromorphic continuation of this incomplete Hecke $L$-function; a principal pole is permitted. All primes dividing the conductor of $eta$ already lie in $S$, so there are no further omitted exterior factors for this target character. For $t > 0$ put

#[#set math.equation(numbering: n => "(4.1)")
 $ P_G \( t \) = frac(1, 2 sqrt(pi)) exp #h(-0.16667em) (- frac(\( log t \)^2, 4)) \, #h(2em) integral_0^oo P_G \( t \) t^xi thin frac(thin upright(d) t, t) = e^(xi^2) quad \( xi in bb(C) \) . $ <eq:reflection-gaussian>]

The transform identity follows by putting $v = log t$ and completing the square, first for real $xi$ and then by entire continuation. Write $theta.alt = overline(Lambda) thin overline(G) thin eta$. For $m in R$ and $Z > 0$ define

#[#set math.equation(numbering: n => "(4.2)")
 $ B_m \( Z \) = sum_(frak(c) med upright("squarefree")\
frak(n)) frac(gamma_2 \( frak(c) \), q_(frak(c))^(1 \/ 2) q_(frak(n))) theta.alt \( frak(A) \) chi_(frak(A)) \( m \) P_G #h(-0.16667em) (q_(frak(A)) / Z) \, #h(2em) frak(A) = frak(c) frak(n)^3 \, quad A = c n^3 . $ <eq:reflection-B-definition>]

Here $c \, n \, A$ are allowed generators, and $frak(n)$ is unrestricted, so it may share primes with $frak(c)$. Every residue-character power has the zero extension on nonunits fixed in 3, including powers with exponent zero modulo six. The sum is independent of the permitted generator choices. It converges absolutely: $\| gamma_2 \( frak(c) \) \| = 1$ for squarefree $frak(c)$, and for any $sigma > 1 \/ 2$ the bound $P_G \( t \) lt.double_sigma t^(- sigma)$ reduces the absolute sum, after a factor $O_sigma \( Z^sigma \)$, to

#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(frak(c) \, frak(n)) q_(frak(c))^(- 1 \/ 2 - sigma) q_(frak(n))^(- 1 - 3 sigma) lt.eq zeta_F^S \( sigma + 1 \/ 2 \) zeta_F^S \( 3 sigma + 1 \) < oo . $ <eq:reflection-original-dirichlet-majorant>]

At $m = 0$, the mask kills every term with $frak(A) eq.not R$, so $B_0 \( Z \) = P_G \( 1 \/ Z \)$. The factor $gamma_2 \( frak(c) \) \/ \( q_(frak(c))^(1 \/ 2) q_(frak(n)) \)$ will be identified in 5 as the exterior coefficient supplied by the normalized local theta formula.

The comparison uses rows at scale $X Y$, where

#[#set math.equation(numbering: n => "(4.4)")
 $ a = 9 / 10 \, #h(2em) b = 133 / 1000 \, #h(2em) M_0 = a + b = 1033 / 1000 \,\
h_0 = 1 - a = 1 / 10 \, #h(2em) X = Z^a \, quad Y = Z^b . $ <eq:reflection-scales>]

Recall the norm section $ell_T$ fixed in 3, for which $\| ell_T \|_S = T$. If $cal(K) subset F_S^times$ is compact, set

$ cal(B)_Z \( cal(K) \) = R ∩ ell_(Z^(M_0)) cal(K) . $

Thus every local absolute value of $ell_(Z^(M_0))^(- 1) m$ is bounded above and away from zero on this set. These are the compact balanced annular row sets used below. For $m eq.not 0$ decompose its exterior ideal uniquely as

$ \( m \)_S = frak(h) \( m \) frak(d) \( m \) \, #h(2em) frak(h) \( m \) = product_(v_(frak(p)) \( m \) gt.eq 2) frak(p)^(v_(frak(p)) \( m \)) \, #h(2em) frak(d) \( m \) = product_(v_(frak(p)) \( m \) = 1) frak(p) . $

The ideal $frak(d) \( m \)$ is squarefree and coprime to $frak(h) \( m \)$; every prime exponent of $frak(h) \( m \)$ is at least two. We call such an ideal powerful.

The theta and reflection arguments in Section 5, Section 6 prove the following estimate.

#prodef([Proposition 4.1.])[
  (Reflected second moment).  #emph[Let $F$ be a fixed cyclotomic field containing $mu_12$, let $S$ and the arithmetic data be as above, and fix a compact subset $cal(K) subset F_S^times$. For every $epsilon.alt > 0$, every $Z gt.eq 2$, and all dyadic lengths $P \, D gt.eq 1$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ sum_(m in cal(B)_Z \( cal(K) \)\
P lt.eq q_(frak(h) \( m \)) < 2 P\
D lt.eq q_(frak(d) \( m \)) < 2 D) \| B_m \( Z \) \|^2 lt.double_(F \, S \, eta \, cal(K) \, epsilon.alt) Z^epsilon.alt P^(1 \/ 2) (D + frac(D^2 P, Z)) . $ <eq:reflection-dyadic-mass>]

 In particular, 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(m in cal(B)_Z \( cal(K) \)) \| B_m \( Z \) \|^2 lt.double_(F \, S \, eta \, cal(K) \, epsilon.alt) Z^(2 M_0 - 1 + epsilon.alt) . $ <eq:reflection-total-mass>]

 The estimate is uniform if $cal(K)$ is multiplied by an element of any fixed compact subset of the norm-one group of $F_S^times$.]
] <prop:reflection>

Here is the analytic comparison proved in Section 7, Section 8. The first of those sections constructs a scalar $I_Z = I \( Z^a \, Z^b \, Z \)$ by pairing $B_m \( Z \)$, on a fixed compact annular row set of scale $X Y$, with a normalized sum of $chi_(frak(s)) \( d \) upright(e) \( - m d \/ s \)$, where $q_(frak(s)) asymp Y$ and $d in \( R \/ frak(s) \)^times$. It specifies the weights and the average over $F_S^1 \/ U_S^6$. The whole additive factor has squared row mass $O \( Y^(- 1) \)$, uniformly in that average. Hence (4.6) and Cauchy–Schwarz give, for every $epsilon.alt > 0$,

$ I_Z lt.double Z^(\( 2 M_0 - 1 - b \) \/ 2 + epsilon.alt) = Z^(933 \/ 2000 + epsilon.alt) . $

The constants here and below may depend on the fixed $F \, S \, eta$ and the fixed weights, as well as on any displayed loss.

Poisson summation gives a second evaluation. Its nonzero frequencies are grouped by $u in cal(U)$ through (3.7). Only the principal class $u = 1$, the class of sixth powers, contributes both numerator poles in the auxiliary Mellin variables: $w = 1$ and $z = 1 \/ 6$. The Euler calculation constructs a specific principal correction $cal(H)_eta \( s \)$ by specializing the correction for $u = 1$ at $\( w \, z \) = \( 1 \, 1 \/ 6 \)$. It proves that $cal(H)_eta$ is holomorphic and nowhere zero on an open neighborhood of the closed half-plane $"Re" s gt.eq .998$, and is bounded on that closed half-plane uniformly in height. The double residue equals $c_0 f_eta \( Z \)$, where $c_0 eq.not 0$ and

$ f_eta \( Z \) = frac(1, 2 pi i) integral_(\( 2 \)) Z^(s - 8 \/ 15) e^(\( s - 5 \/ 6 \)^2) frac(cal(H)_eta \( s \), L^S \( s \, eta \)) thin d s #h(2em) \( Z > 0 \) . $

The exponent left by the two residues is $a \/ 2 + s - 1 + h_0 \/ 6 = s - 8 \/ 15$, whose value at $s = 1$ is $7 \/ 15$.

The zero-detection argument proves, for sufficiently large $Z$,

$ I_Z = c_0 f_eta \( Z \) + O \( Z^(7 \/ 15 - .0004) \) . $

Since $933 \/ 2000 = 7 \/ 15 - 1 \/ 6000$, this identity and the preceding bound, with the stated losses, give $f_eta \( Z \) lt.double Z^(7 \/ 15 - 1 \/ 20000)$. Moving the original $s$-line in the inverse Mellin integral to the right gives $f_eta \( Z \) = O_A \( Z^A \)$ for every $A > 0$ and $0 < Z lt.eq 1$. Consequently the shifted Mellin transform $integral_0^oo f_eta \( Z \) Z^(- s + 8 \/ 15) thin d Z \/ Z$ is holomorphic for $"Re" s > 1 - 1 \/ 20000$. Fourier inversion on $"Re" s = 2$, followed by meromorphic continuation, identifies it throughout that half-plane with

$ e^(\( s - 5 \/ 6 \)^2) frac(cal(H)_eta \( s \), L^S \( s \, eta \)) . $

Its numerator is holomorphic and nowhere zero there, so $L^S \( s \, eta \)$ has no zero there; a principal pole only gives a zero of the reciprocal. The numerical saving $1 \/ 20000$ is absolute; the constants and thresholds may depend on $F \, S \, eta$. The later sections supply the residue calculation and the contour and Fourier justifications.

== 5 The normalized cubic theta input and its radial profiles <sec:theta>

To prove the reflected moment, we first realize the exterior coefficient $gamma_2 \( frak(c) \) \/ \( q_(frak(c))^(1 \/ 2) q_(frak(n)) \)$ in the family $B_m$. The cubic theta representation used here has one-dimensional local Whittaker spaces. Its selected central datum, together with normalized induction, gives the factor $q_(frak(p))^(- 1)$ for a triple valuation step. Compatible rational, torus, root, and compact sections fix the unit factor at valuation $e$ as $chi_(frak(p)) \( u \)^(2 e)$. We state this normalized input first and then identify its exterior coefficient. The verification of the Kazhdan–Patterson specialization is in 13.

Throughout this section $F$ is the fixed cyclotomic field from the preceding section, and $bb(A)_F$ is its adele ring. In particular, $mu_12 subset F$. We use the standard trace character $psi : F without bb(A)_F arrow.r bb(C)^times$, and choose the self-dual additive Haar measures, for which $F without bb(A)_F$ has volume one. Write

$ n \( x \) = mat(delim: "(", 1, x; 0, 1) \, #h(2em) macron(n) \( x \) = mat(delim: "(", 1, 0; x, 1) \, #h(2em) a \( y \) = mat(delim: "(", y, 0; 0, 1) \, #h(2em) w = mat(delim: "(", 0, 1; 1, 0) . $

The same notation will denote the specified lifts below. A Whittaker functional with character $psi_v$ means a linear functional $lambda$ satisfying $lambda \( pi \( n \( x \) \) phi \) = psi_v \( x \) lambda \( phi \)$.

=== 5.1 The automorphic input and its exterior coefficients <the-automorphic-input-and-its-exterior-coefficients>

We use the determinant-modified cover of Kazhdan and Patterson with parameter $c = 2$, with the ordinary torus section and the canonical root splittings. The embedding $iota : mu_3 \( F \) arrow.r.hook bb(C)^times$ is oriented as in the exterior cocycle formula below. If $a_v \( y \)$ denotes the chosen torus lift, define the effective scalar $cal(C)_v \( x \, y \)$ by

$ pi \( a_v \( x \) \) pi \( a_v \( y \) \) = cal(C)_v \( x \, y \) pi \( a_v \( x y \) \) $

in a genuine representation $pi$. Thus this notation includes the chosen embedding of the central $mu_3$.

#prodef([Proposition 5.1.])[
  (Cubic theta input).  #emph[For the fixed field $F$, there is a threefold central cover 
$ 1 arrow.r mu_3 arrow.r tilde(upright("PGL"))_2 \( bb(A)_F \) arrow.r upright("PGL")_2 \( bb(A)_F \) arrow.r 1 $

 which splits over $upright("PGL")_2 \( F \)$, and an irreducible genuine automorphic representation $Theta = ⨂'_v Theta_v$ on this cover, with the following properties.]
  + #emph[#emph[Global representation and Fourier expansion.] The cover is the quotient of the $c = 2$ cover $tilde(upright("GL"))_2^(\( 2 \))$ by the ordinary split scalar subgroup. The inducing character of $Theta_v$, on the center of the covering torus before this quotient, is 
#[#set math.equation(numbering: n => "(5.1)")
 $ omega_v #h(-0.16667em) (zeta thin s_v \( "diag" \( x^3 \, y^3 \) \) s_v \( z I \)) = iota \( zeta \) lr(|x^3 \/ y^3|)_v^(1 \/ 6) . $ <eq:theta-central-datum>]

 Here $s_v$ is the ordinary torus section. The normalized inducing norm exponents are $1 \/ 6 \, - 1 \/ 6$. The local exceptional representation is the irreducible quotient for these exponents and the irreducible subrepresentation for their Weyl conjugates. Every $Theta_v$ has a one-dimensional Whittaker space. The global functional 
$ lambda \( phi \) = integral_(F without bb(A)_F) theta_phi \( n \( x \) \) overline(psi \( x \)) thin thin upright(d) x $

 on the automorphic realization $phi mapsto theta_phi$ is nonzero. The representation is spherical at all but finitely many finite places. There is a preliminary pure tensor $phi^compose$ on which $lambda$ is nonzero. Its finitely many nondistinguished finite places lie in the final fixed $S$, along with the archimedean places, the places over $6$, and the places where $psi_v$ has nonzero conductor.]
    #emph[For a pure tensor $phi = phi_S ⊗ ⨂_(v in.not S) phi_v$, with the distinguished spherical vector at almost every $v in.not S$, the global Whittaker function factors as 
#[#set math.equation(numbering: n => "(5.2)")
 $ cal(W)_phi \( g \) := lambda \( pi \( g \) phi \) = cal(W)_(S \, phi_S) \( g_S \) product_(v in.not S) W_(v \, phi_v) \( g_v \) . $ <eq:theta-normalized-factorization>]

 Each exterior spherical functional is normalized at one, so only finitely many factors in this product differ from one for adelic $g$. The functional at $S$ factors at its complex places; at its finite places it may be retained as a finite sum of products of local Whittaker functionals. For a smooth automorphic vector, 
#[#set math.equation(numbering: n => "(5.3)")
 $ theta_phi \( g \) = theta_(phi \, N) \( g \) + sum_(nu in F^times) cal(W)_phi \( a \( nu \) g \) \, #h(2em) theta_(phi \, N) \( g \) = integral_(F without bb(A)_F) theta_phi \( n \( x \) g \) thin thin upright(d) x . $ <eq:theta-fourier-expansion>]

 This expansion converges absolutely and locally uniformly on compact sets of $g$.]
  + #emph[#emph[Exact lifts and exterior local values.] On the quotient the chosen lifts satisfy 
#[#set math.equation(numbering: n => "(5.4)")
 $ n \( x \) a \( y \) = a \( y \) n \( x \/ y \) \, #h(2em) w a \( y \) w^(- 1) = a \( y^(- 1) \) \,\
w n \( H \) = n \( H^(- 1) \) a \( - H^(- 2) \) macron(n) \( H^(- 1) \) . $ <eq:theta-lift-identities>]

 In the last identity $H eq.not 0$. At an exterior prime, when $H^(- 1)$ is integral the last factor is compact, and a compact diagonal may absorb the minus sign.]
    #emph[For every exterior prime $frak(p)$, choose a uniformizer $pi.alt$, put $q_(frak(p)) = upright(N) frak(p)$, and use the compact splitting on $upright("PGL")_2 \( cal(O)_(frak(p)) \)$. The orientation of $iota$, equivalently that of the Hilbert-symbol convention, can be fixed so that the scalar by which the torus cocycle acts in a genuine representation is 
#[#set math.equation(numbering: n => "(5.5)")
 $ cal(C)_(frak(p)) \( pi.alt \, u \) = chi_(frak(p)) \( u \)^(- 2) #h(2em) \( u in cal(O)_(frak(p))^times \) . $ <eq:theta-effective-cocycle>]

 The compact splitting agrees with the chosen sections on unit diagonals, Weyl elements, and integral upper and lower root elements. Define 
$ g_(2 \, frak(p)) = q_(frak(p))^(- 1 \/ 2) sum_(x med mod med frak(p)) chi_(frak(p)) \( x \)^2 psi_(frak(p)) \( x \/ pi.alt \) . $

 Then $\| g_(2 \, frak(p)) \| = 1$. If $W_(frak(p))$ is the spherical Whittaker function normalized by $W_(frak(p)) \( 1 \) = 1$, then, for $u in cal(O)_(frak(p))^times$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ W_(frak(p)) \( a \( pi.alt^e u \) \) = chi_(frak(p)) \( u \)^(2 e) cases(delim: "{", 0 \, & e < 0 \,, q_(frak(p))^(- k) \, & e = 3 k \, quad k gt.eq 0 \,, q_(frak(p))^(- k - 1 \/ 2) g_(2 \, frak(p)) \, & e = 3 k + 1 \, quad k gt.eq 0 \,, 0 \, & e = 3 k + 2 \, quad k gt.eq 0 .) $ <eq:theta-local-values>]

 In particular a shift by three nonnegative valuations multiplies the value by $q_(frak(p))^(- 1)$.]
  + #emph[#emph[Complex local behavior.] At a complex place, $Theta_v$ is the ordinary spherical $upright("PGL")_2 \( bb(C) \)$ principal series with normalized characters $\( \| dot.op \|_v^(1 \/ 6) \, \| dot.op \|_v^(- 1 \/ 6) \)$, where $\| y \|_v$ is the square of the ordinary modulus. Its spherical Whittaker function is a nonzero constant times 
#[#set math.equation(numbering: n => "(5.7)")
 $ \| y \|_v^(1 \/ 2) K_(1 \/ 3) #scale(x: 120%, y: 120%)[\(] c_v \| y \|_v^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] \, #h(2em) c_v > 0 . $ <eq:theta-complex-bessel>]

 The constant term of the automorphic theta function belongs to the Weyl-conjugate torus induction. In particular its dependence on a complex diagonal $a \( y \)$ is radial, also when the vector on its right has been acted on by a fixed compact element.]
] <prop:theta-input>

In (5.2), the condition $W_(frak(p)) \( 1 \) = 1$ fixes every exterior spherical scalar; the remaining normalization belongs to the $S$-functional. 13 derives this product from the nonzero global functional and local uniqueness, including the correction to the original global formula. The noncompact norm integrations below require the separate absolute bounds in 16.

#prodef([Corollary 5.2.])[
  (The exterior theta coefficient).  #emph[At every exterior prime use an allowed prime generator as the uniformizer in 13. Let $A in R \\ { 0 }$ be an allowed generator of an integral exterior ideal $frak(A)$. Then 
#[#set math.equation(numbering: n => "(5.8)")
 $ product_(frak(p) in.not S) W_(frak(p)) \( a \( A \) \) = cases(delim: "{", frac(gamma_2 \( frak(c) \), q_(frak(c))^(1 \/ 2) q_(frak(n))) \, & frak(A) = frak(c) frak(n)^3 \, quad frak(c) med upright("squarefree") \,, 0 \, & upright("otherwise") .) $ <eq:theta-exterior-coefficient>]

 In the first case $frak(c) \, frak(n)$ are uniquely determined; they need not be coprime.]
] <cor:theta-exterior-coefficient>

#proof[
  The local support in (5.6) permits precisely the valuations $3 k$ and $3 k + 1$. They give the unique decomposition $frak(A) = frak(c) frak(n)^3$, with $frak(c)$ squarefree, and magnitudes $q_(frak(p))^(- k)$ and $q_(frak(p))^(- k - 1 \/ 2)$, respectively. Use allowed product generators $A = c n^3$; any other allowed $A$ differs by an element of $U_S^6$, which has no effect on the local values. At a prime $frak(p) divides frak(c)$, the local unit factor is $chi_(frak(p)) \( c \/ p \)^2$. The unit from $n^3$ has exponent divisible by six in the symbol, including when $frak(p) divides frak(n)$, and disappears. The normalized prime sum $g_(2 \, frak(p))$ equals $gamma_2 \( frak(p) \)$: the local additive sign from (3.8) has no effect because $chi_(frak(p)) \( - 1 \) = 1$. The product of the unit factors and these prime sums is $gamma_2 \( frak(c) \)$ by (3.10). Multiplying the magnitudes gives (5.8). ◻
]

Thus theta supplies the exterior factor in $B_m$. The ideal character will enter through an $S$-average, and finite upper-unipotent translations will insert the moving sextic twist. The chosen $S$-Whittaker function first supplies a radial profile; an exact radial average will replace it by $P_G$. We prepare those $S$-components next.

The arithmetic power classes also describe the torus factor at $S$. Put $cal(C)_S = product_(v in S) cal(C)_v$. At an exterior prime, (5.5) and the tame Hilbert-symbol formula give $cal(C)_(frak(p)) \( x \, y \) = \( x \, y \)_(6 \, frak(p))^2$ for all local $x \, y$. For rational $a \, b$, the product formulas for the chosen torus lifts and for the Hilbert symbol therefore imply

$ cal(C)_S \( a \, b \) = product_(frak(p) in.not S) cal(C)_(frak(p)) \( a \, b \)^(- 1) = H_S \( a \, b \)^2 . $

Both sides are continuous on $F_S^times times F_S^times$, so weak approximation gives

#[#set math.equation(numbering: n => "(5.9)")
 $ cal(C)_S \( x \, y \) = H_S \( x \, y \)^2 #h(2em) \( x \, y in F_S^times \) . $ <eq:reflection-S-cocycle>]

In particular this factor depends only on the classes in the fixed finite group $cal(V) = F_S^times \/ F_S^(times 6)$. The local sections here are the same ones used by the rational splitting.

=== 5.2 Bounds and a prescribed finite Whittaker function <bounds-and-a-prescribed-finite-whittaker-function>

For $v divides oo$, define the derivative in the logarithm of the norm by

$ cal(D)_v f \( y \) = frac(thin upright(d), thin upright(d) t) f \( e^(t \/ 2) y \)\|_(t = 0) . $

The factor $1 \/ 2$ makes $\| e^(t \/ 2) y \|_v = e^t \| y \|_v$.

We give both the Bessel calculation and bounds for the fixed rotations of the vectors that we will use. Choose complex coordinates in which $psi_v \( z \) = e^(i c_v "Re" z)$, with $c_v > 0$; a harmless rotation and a change of sign give this form. Put $𝜚 = \| y \|_v^(1 \/ 2)$. In the dominant normalized principal series set $nu_0 = 1 \/ 2 + 1 \/ 6 = 2 \/ 3$. Its spherical section, restricted to $w n \( x \) a \( y \)$, is a constant times

$ 𝜚^(2 nu_0) \( 𝜚^2 + \| x \|_(upright("ord"))^2 \)^(- 2 nu_0) \, $

where $\| x \|_(upright("ord"))$ is the ordinary complex modulus. The Jacquet integral is absolutely convergent because $2 nu_0 > 1$. Using the Laplace representation of the negative power and the two-dimensional Gaussian Fourier integral gives

$ 𝜚^(2 nu_0) integral_(bb(R)^2) frac(e^(- i c_v x_1), \( 𝜚^2 + x_1^2 + x_2^2 \)^(2 nu_0)) thin thin upright(d) x_1 thin upright(d) x_2 & = frac(pi 𝜚^(2 nu_0), Gamma \( 2 nu_0 \)) integral_0^oo t^(2 nu_0 - 2) e^(- t 𝜚^2 - c_v^2 \/ \( 4 t \)) thin thin upright(d) t\
 & = c'_v 𝜚 K_(2 nu_0 - 1) \( c_v 𝜚 \) = c'_v 𝜚 K_(1 \/ 3) \( c_v 𝜚 \) \, #h(2em) c'_v eq.not 0 . $

The Laplace and Gaussian integrals may be interchanged absolutely: after integrating the Gaussian without its phase the integrand at zero is $O \( t^(2 nu_0 - 2) \)$, with exponent greater than $- 1$. This proves (5.7).

For an upper root translate, Whittaker equivariance gives

#[#set math.equation(numbering: n => "(5.10)")
 $ W_(pi \( n \( z \) \) phi) \( a \( y \) \) = psi_v \( y z \) W_phi \( a \( y \) \) . $ <eq:theta-lie-multiplier>]

Suitable complex linear combinations of the two real Lie derivatives in $z$ therefore multiply the spherical function by $y$ and by $macron(y)$, respectively. Write $omega_m \( y \) = \( y \/ \| y \|_v^(1 \/ 2) \)^m$ for $m in { 1 \, - 1 }$. After multiplying each derivative vector by a nonzero constant, its Whittaker function is

#[#set math.equation(numbering: n => "(5.11)")
 $ W_(v \, m) \( a \( y \) \) = \| y \|_v thin omega_m \( y \) K_(1 \/ 3) \( c_v \| y \|_v^(1 \/ 2) \) . $ <eq:theta-complex-derivative>]

Here are uniform bounds for every vector in a fixed finite list consisting of these derivative vectors and their fixed compact rotations. A rotation of a first Lie derivative of the spherical vector is another first Lie derivative, since the spherical vector is compact invariant and $pi \( k \) thin upright(d) pi \( X \) = thin upright(d) pi \( "Ad" \( k \) X \) pi \( k \)$. For a fixed real Lie algebra element $X$, differentiate the spherical section using

$ f^compose \( g \) = (frac(\| det g \|_(upright("ord")), \| g_21 \|_(upright("ord"))^2 + \| g_22 \|_(upright("ord"))^2))^(2 nu_0) . $

On $w n \( x \) a \( y \)$, its first Lie derivative and any number of $cal(D)_v$-derivatives are the preceding spherical integrand times a finite sum of bounded homogeneous rational functions of $\( y \, x \)$. More precisely, for every norm derivative order $b$ and every $x_1$-derivative order $h$, the resulting derivative is bounded by

$ C_(b \, h) 𝜚^(2 nu_0) \( 𝜚^2 + \| x \|_(upright("ord"))^2 \)^(- 2 nu_0 - h \/ 2) . $

This follows by differentiating the displayed quotient: each derivative adds a polynomial numerator of the same degree as its denominator, and an $x_1$-derivative lowers the homogeneous degree by one. The integral of the bound with $h = 0$ is $O \( 𝜚^(2 - 2 nu_0) \) = O \( 𝜚^(2 \/ 3) \)$. For $𝜚 gt.eq 1$, integrating by parts $h$ times against $e^(- i c_v x_1)$ instead gives $O_(b \, h) \( 𝜚^(2 \/ 3 - h) \)$. These integrable derivative bounds justify the integrations by parts by cutoff and limit. Consequently, for every integer $j gt.eq 0$ and every $A > 0$, the fixed list satisfies

#[#set math.equation(numbering: n => "(5.12)")
 $ \| cal(D)_v^j W \( a \( y \) \) \| lt.eq C_(A \, j) min #scale(x: 120%, y: 120%)[\(] \| y \|_v^(1 \/ 3) \, \| y \|_v^(- A) #scale(x: 120%, y: 120%)[\)] . $ <eq:theta-complex-bounds>]

At a finite place the corresponding elementary bounds hold for every fixed smooth vector. To be explicit, let $W_phi \( y \) = lambda_v \( pi_v \( a \( y \) \) phi \)$. There is an additive open subgroup $J subset F_v$ for which $n \( J \)$ fixes $phi$. The identity

$ W_phi \( y \) = psi_v \( y x \) W_phi \( y \) #h(2em) \( x in J \) $

forces $W_phi \( y \) = 0$ when $\| y \|_v$ is sufficiently large. For the other end, put $Q_v = \# \( cal(O)_v \/ frak(p)_v \)$ and $z_v = a \( pi.alt_v^3 \)$. This element is central in the covering torus. By the two-cell Jacquet calculation [15] Proposition I.2.1, p. 61, and Theorem I.2.9(e), p. 72, the two constituents of the unnormalized ordinary Jacquet module of the principal series have $z_v$-eigenvalues of absolute values

$ Q_v^(- 1) quad upright("and") quad Q_v^(- 2) . $

These are the exponents $1 \/ 2 - 1 \/ 6$ and $1 \/ 2 + 1 \/ 6$ on a triple valuation step. Exactness of the ordinary Jacquet functor gives the same possible eigenvalues on the exceptional subquotient. Hence a polynomial all of whose roots have those absolute values annihilates the action of $z_v$ on this Jacquet module.

For completeness, this gives a recurrence on the Whittaker values themselves. If $P$ is such an annihilating polynomial, then

$ P \( pi_v \( z_v \) \) phi = sum_(i = 1)^h #scale(x: 120%, y: 120%)[\(] pi_v \( n \( x_i \) \) - 1 #scale(x: 120%, y: 120%)[\)] phi_i $

for finitely many $x_i \, phi_i$. Apply $lambda_v pi_v \( a \( y \) \)$. For all sufficiently small $\| y \|_v$ the right side is zero because every $psi_v \( y x_i \)$ is one. Cube cocycles are trivial, so the left side is the recurrence $P \( E \) W_phi \( y \)$, where $E W_phi \( y \) = W_phi \( y pi.alt_v^3 \)$. On each valuation progression its solutions are sums of a polynomial in the valuation times the powers of the roots of $P$. The unit variable ranges over only finitely many classes after restricting to a sufficiently small unit subgroup which fixes the vector and consists of cubes. It follows that, for every fixed $delta < 1 \/ 3$,

#[#set math.equation(numbering: n => "(5.13)")
 $ W_phi \( y \) = 0 quad \( \| y \|_v > C_phi \) \, #h(2em) \| W_phi \( y \) \| lt.eq C_(phi \, delta) \| y \|_v^delta quad \( \| y \|_v lt.eq 1 \) . $ <eq:theta-finite-bounds>]

All constants in this paragraph may depend on the place, the vector, and the functional. For a fixed finite list one may choose a common positive $delta$. The local twisted Jacquet quotients of $Theta_v$ are finite dimensional by the quotient argument in 13.2. Thus the same conclusions hold term by term for the finite sum of products at $S$ in 13.

#prodef([Lemma 5.3.])[
  (Finite torus cutoff).  #emph[Let $S_f$ be a finite set of nonarchimedean places and let $lambda_f eq.not 0$ be a Whittaker functional with character $product_(v in S_f) psi_v$ on a smooth representation of the product of the local covers. For a vector $phi$, put 
$ W_phi \( y \) = lambda_f #h(-0.16667em) (pi #scale(x: 120%, y: 120%)[\(] \( a \( y_v \) \)_(v in S_f) #scale(x: 120%, y: 120%)[\)] phi) \, #h(2em) y in product_(v in S_f) F_v^times . $

 Given any open subgroup $H_f$ of the product of the unit groups, there are a compact open product subgroup $U subset H_f$ and a smooth vector $phi_U$ for which 
$ W_(phi_U) \( y \) = upright(bold(1))_U \( y \) #h(2em) (y in product_(v in S_f) F_v^times) . $

]
] <lem:finite-whittaker-cutoff>

#proof[
  Choose a vector with $lambda_f \( phi \) eq.not 0$. The map $y mapsto W_phi \( y \)$ is locally constant near one. Choose a product of sufficiently small groups $1 + frak(p)_v^(m_v)$, contained in $H_f$, on which it is the constant $lambda_f \( phi \)$; call that product $U$. As a subset of the additive product $product F_v$, $U$ is compact and open. By additive Fourier inversion choose a Schwartz–Bruhat function $phi.alt$ with
  $ integral_(product F_v) phi.alt \( t \) product_v psi_v \( y_v t_v \) thin thin upright(d) t = upright(bold(1))_U \( y \) . $
  The vector $phi' = integral phi.alt \( t \) pi \( n \( t \) \) phi thin thin upright(d) t$ is a well-defined smooth vector: its integrand is locally constant on the compact support of $phi.alt$, so the integral is a finite linear combination of vectors. The split root relation gives
  $ W_(phi') \( y \) = W_phi \( y \) integral phi.alt \( t \) product_v psi_v \( y_v t_v \) thin thin upright(d) t = W_phi \( y \) upright(bold(1))_U \( y \) . $
  Divide $phi'$ by $lambda_f \( phi \)$. ◻
]

Here is the choice at $S$ that will be used later. Write $S_f = S \\ S_oo$. Let $cal(L)$ be any fixed finite family of smooth unitary characters $cal(L)_S$ of $F_S^times$, each trivial on $U_S$, radially trivial at infinity, and with angular component $omega_(m_v)$, $m_v in { 1 \, - 1 }$, at each complex place. This permits the arithmetic character $L_S$ and its finitely many finite-order twists used below. Factor the nonzero global functional at its complex places, leaving a nonzero functional at the finite places of $S$. Apply 15 with an open subgroup contained in the sixth powers and in the intersection of the kernels of the finite components of all $cal(L)_S in cal(L)$. We obtain one product $U = product_(v in S_f) U_v$ and one finite vector. For each $cal(L)_S$, choose at each complex place the derivative of its angular type. The functions in (5.11) are nonzero at one, and their normalization gives an $S$-Whittaker function

#[#set math.equation(numbering: n => "(5.14)")
 $ W_(S \, cal(L)_S) \( a \( y \) \) = upright(bold(1))_U \( y_f \) product_(v divides oo) \| y_v \|_v thin omega_(m_v) \( y_v \) K_(1 \/ 3) \( c_v \| y_v \|_v^(1 \/ 2) \) . $ <eq:theta-chosen-S-function>]

In particular $cal(L)_S \( y \)^(- 1) W_(S \, cal(L)_S) \( a \( y \) \)$ is the product of the same radial Bessel factors and $upright(bold(1))_U \( y_f \)$ for every member of the family. The radial profile and its Gaussian averaging kernel below may therefore be chosen in common for this finite family.

The complex constant term is radial by 13, whereas $cal(L)_S^(- 1)$ has a nontrivial angular component. We will use this distinction in 6, after the actual weighted theta sums have been shown to descend to the quotient on which they are integrated.

=== 5.3 Integration on norm sheets <integration-on-norm-sheets>

Recall that $r = \# S_oo = \[ F : bb(Q) \] \/ 2$, and define

$ X_u = { y in F_S^times : \| y \|_S = u } #h(2em) \( u > 0 \) . $

For $d in F_S^times$, put $q_d = \| d \|_S$. Multiplication by $d$ sends $X_l$ to $X_(q_d l)$, and inversion sends $X_l$ to $X_(1 \/ l)$. The forward and reflected theta terms will therefore lead to sheet integrals at norms $q_d l$ and $q_d \/ l$, respectively. We now bound such one-variable profiles, including absolute envelopes that will justify the ideal sums and the radial average. The two signed orbit substitutions will be proved with their actual integrands in 6.

There is at least one complex place. Use the norm section $ell_u$ from 3; it satisfies $\| ell_u \|_S = u$ and $ell_u ell_v = ell_(u v)$. Choose multiplicative Haar measures and Haar measure on $X_1$ so that

#[#set math.equation(numbering: n => "(5.15)")
 $ integral_(F_S^times) f \( y \) thin thin upright(d)^times y = integral_0^oo integral_(X_u) f \( y \) thin thin upright(d)_u^times y thin frac(thin upright(d) u, u) \, $ <eq:sheet-disintegration>]

where the measure on $X_u$ is the translate by $ell_u$ of that on $X_1$. At a complex place we take angle measure of total mass one, so its multiplicative measure is a fixed constant times $thin upright(d) t \/ t$ times angle measure, with $t = \| y_v \|_v$. At a finite place every valuation shell has the same multiplicative measure.

#prodef([Lemma 5.4.])[
  (Norm-sheet profiles).  #emph[Let $cal(I)$ be a finite index set. For every $kappa in cal(I)$, let $f_kappa$ be a finite sum of products 
$ f_kappa \( y \) = sum_(ell = 1)^(L_kappa) product_(v in S) f_(kappa \, ell \, v) \( y_v \) \, #h(2em) y in F_S^times . $

 Assume that for one $delta > 0$ all these local factors satisfy the following conditions.]
  + #emph[At a finite $v$, $f_(kappa \, ell \, v)$ is locally constant, vanishes for $\| y_v \|_v > C_v$, and is $O \( \| y_v \|_v^delta \)$ for $\| y_v \|_v lt.eq 1$.]
  + #emph[At a complex $v$, the factor is smooth on $F_v^times$ and, for every $j gt.eq 0$ and $A > 0$, 
$ \| cal(D)_v^j f_(kappa \, ell \, v) \( y_v \) \| lt.eq C_(A \, j) min \( \| y_v \|_v^delta \, \| y_v \|_v^(- A) \) . $

]
  #emph[All constants may depend on the finite family. Define 
$ H_kappa \( u \) = integral_(X_u) f_kappa \( y \) thin thin upright(d)_u^times y \, #h(2em) D = u frac(thin upright(d), thin upright(d) u) . $

 Fix one complex place $v_0$, and define the nonnegative absolute derivative profile 
$ H_(kappa \, j)^(upright("abs")) \( u \) = sum_(ell = 1)^(L_kappa) integral_(X_u) \| cal(D)_(v_0)^j f_(kappa \, ell \, v_0) \( y_(v_0) \) \| product_(v eq.not v_0) \| f_(kappa \, ell \, v) \( y_v \) \| thin thin upright(d)_u^times y . $

 Then $H_kappa$ is smooth, and for every $j gt.eq 0$ and $sigma > - delta$, 
#[#set math.equation(numbering: n => "(5.16)")
 $ \| D^j H_kappa \( u \) \| lt.eq H_(kappa \, j)^(upright("abs")) \( u \) lt.eq C_(sigma \, j) u^(- sigma) #h(2em) \( u > 0 \) . $ <eq:sheet-weighted-bound>]

 In particular, for any $0 < alpha < delta$ and every $A > 0$, 
#[#set math.equation(numbering: n => "(5.17)")
 $ \| D^j H_kappa \( u \) \| + H_(kappa \, j)^(upright("abs")) \( u \) lt.eq C_(A \, j) min \( u^alpha \, u^(- A) \) . $ <eq:sheet-two-ended-bound>]

 The conclusions are unchanged if each $f_kappa$ is multiplied by a fixed smooth unitary character of $F_S^times$ and by a bounded function of its class in the finite group $cal(V)$.]
  #emph[Let $cal(K) : \( 0 \, oo \) arrow.r bb(C)$ have every absolute moment 
$ M_beta \( cal(K) \) = integral_0^oo \| cal(K) \( T \) \| T^beta thin frac(thin upright(d) T, T) < oo #h(2em) \( beta in bb(R) \) . $

 Both convolutions 
$ integral_0^oo cal(K) \( T \) H_kappa \( u T \) thin frac(thin upright(d) T, T) \, #h(2em) Phi_kappa \( u \) := integral_0^oo cal(K) \( T \) H_kappa \( u \/ T \) thin frac(thin upright(d) T, T) $

 and their norm derivatives obey (5.17), with constants depending also on the indicated moments. For every $j$, the two absolute majorants $integral \| cal(K) \( T \) \| H_(kappa \, j)^(upright("abs")) \( u T^(plus.minus 1) \) thin thin upright(d) T \/ T$ satisfy the same two-ended size bound. For any $x_i > 0$, complex $a_i$, indices $kappa_i in cal(I)$, $tau in { 1 \, - 1 }$, and $sigma > - delta$, one has the absolute bound 
#[#set math.equation(numbering: n => "(5.18)")
 $ & integral_0^oo \| cal(K) \( T \) \| sum_i \| a_i \| H_(kappa_i \, 0)^(upright("abs")) \( u x_i T^tau \) thin frac(thin upright(d) T, T)\
 & #h(12mm)  lt.eq C_(sigma \, 0) u^(- sigma) M_(- tau sigma) \( cal(K) \) sum_i \| a_i \| x_i^(- sigma) . $ <eq:sheet-absolute-sum>]

 In particular the sum and integral may be interchanged if the final series is finite.]
] <lem:sheet-profile>

#proof[
  For a finite place, let $A_v \( Q_v^(- k) \)$ be the supremum of the absolute local factor on its $k$-th valuation shell. Condition (a) implies, for every $sigma > - delta$,
  $ sum_(k in bb(Z)) A_v \( Q_v^(- k) \) Q_v^(- sigma k) < oo : $
  there are only finitely many negative $k$, and the positive tail is geometric with ratio $Q_v^(- \( delta + sigma \))$. At a complex place condition (b) likewise gives
  $ integral_(F_v^times) \| f_v \( y \) \| thin \| y \|_v^sigma thin thin upright(d)^times y < oo \, #h(2em) sup_(y in F_v^times) \| y \|_v^sigma \| cal(D)_v^j f_v \( y \) \| < oo . $
  These statements remain valid for all factors in the fixed finite family.
  Use $t_(v_0) = \| y_(v_0) \|_(v_0)$ as the dependent norm in (5.15). On $X_u$,
  $ t_(v_0) = u product_(v eq.not v_0) \| y_v \|_v^(- 1) \, $
  and the sheet measure is the product of the angle measure at $v_0$ and the multiplicative measures at the other places, up to its fixed normalization. Multiplying the absolute integrand by $u^sigma = product_v \| y_v \|_v^sigma$, take the weighted supremum of the $v_0$-factor and the weighted integrals of all the others. This gives (5.16), including its absolute version. On this parametrization $D$ differentiates only the $v_0$-factor and is exactly $cal(D)_(v_0)$. The same weighted majorants for each derivative justify differentiation under the integral on compact $u$-intervals. Taking $sigma = - alpha$ and then $sigma = A$ proves (5.17).
  At a complex place the sixth-power quotient is trivial, and at a finite place it is finite. Thus a bounded function of $cal(V)$ is a finite linear combination of products of local class indicators. A unitary character factors over the finite product $S$; at a complex place its norm derivatives only introduce fixed constants. Multiplying by these functions preserves the hypotheses after splitting into a finite family.
  For the convolutions, apply the bound with $sigma = - alpha$ or $sigma = A$ under the $T$-integral. For example the two bounds for the reflected convolution have additional factors $M_(- alpha) \( cal(K) \)$ and $M_A \( cal(K) \)$. The corresponding absolute derivative profiles dominate differentiation on compact $u$-intervals. Finally apply (5.16) to each summand in (5.18); Tonelli and the definition of the moment give the displayed bound. ◻
]

The lemma also gives the smooth separation on norm dyads that we will use. If $rho$ is a fixed smooth compactly supported function on $bb(R)$, integration by parts twice in its ordinary Fourier transform gives

#[#set math.equation(numbering: n => "(5.19)")
 $ ∥accent(rho \( t \) Phi_kappa \( u e^t \), ̂)∥_(L^1 \( bb(R) \)) lt.eq C_(A \, rho) min \( u^alpha \, u^(- A) \) . $ <eq:sheet-fourier-separation>]

Indeed the $L^1$ norm is bounded by a constant times the suprema of the function and its derivatives of orders one and two; these derivatives are controlled by (5.17). Fourier inversion with $t = log x - log y$, for $x \, y$ in fixed ratio intervals, therefore separates the two norm variables with bounded $L^1$ cost and retains any chosen large-$u$ power saving.

=== 5.4 Exact radial smoothing <exact-radial-smoothing>

For the chosen $S$-function (5.14), the angular characters cancel against $cal(L)_S^(- 1)$. Define its radial profile by

#[#set math.equation(numbering: n => "(5.20)")
 $ V \( u \) = integral_(X_u) upright(bold(1))_U \( y_f \) product_(v divides oo) \| y_v \|_v K_(1 \/ 3) \( c_v \| y_v \|_v^(1 \/ 2) \) thin thin upright(d)_u^times y . $ <eq:theta-V-profile>]

It is a positive, nonzero profile covered by 16. In this subsection the Mellin convention is $hat(f) \( s \) = integral_0^oo f \( u \) u^s thin thin upright(d) u \/ u$. The unreflected theta average will contain $V \( q_(frak(A)) l \)$. At $l = T \/ Z$, the next lemma averages this profile to exactly $P_G \( q_(frak(A)) \/ Z \)$. After the Weyl operation the norm variable is inverted, and the same kernel instead produces the controlled profiles $integral cal(K) \( T \) H_kappa \( u \/ T \) thin thin upright(d) T \/ T$.

#prodef([Lemma 5.5.])[
  (Exact Gaussian smoothing).  #emph[For $V$ in (5.20), there are constants $C_0 > 0$ and $A_0 > 0$ such that 
#[#set math.equation(numbering: n => "(5.21)")
 $ hat(V) \( s \) = C_0 A_0^s #scale(x: 120%, y: 120%)[\[] Gamma \( s + 5 \/ 6 \) Gamma \( s + 7 \/ 6 \) #scale(x: 120%, y: 120%)[\]]^r #h(2em) \( "Re" s > - 5 \/ 6 \) . $ <eq:theta-V-mellin>]

 There is a smooth function $cal(K) : \( 0 \, oo \) arrow.r bb(C)$ such that, for every $N > 0$ and $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.22)")
 $ lr(|\( T partial_T \)^j cal(K) \( T \)|) lt.eq C_(N \, j) min \( T^N \, T^(- N) \) \, $ <eq:theta-kernel-bounds>]

 and, for every $u > 0$, 
#[#set math.equation(numbering: n => "(5.23)")
 $ integral_0^oo cal(K) \( T \) V \( u T \) thin frac(thin upright(d) T, T) = P_G \( u \) = frac(1, 2 sqrt(pi)) exp #h(-0.16667em) (- frac(\( log u \)^2, 4)) . $ <eq:theta-exact-gaussian>]

 Its Mellin transform satisfies the exact sign convention 
#[#set math.equation(numbering: n => "(5.24)")
 $ hat(cal(K)) \( - s \) = frac(e^(s^2), hat(V) \( s \)) . $ <eq:theta-kernel-mellin>]

 The quotient on the right is interpreted by its entire continuation. For every fixed finite family of rotated $S$-profiles $H_kappa$ covered by 16, the functions $Phi_kappa \( u \) = integral cal(K) \( T \) H_kappa \( u \/ T \) thin thin upright(d) T \/ T$ obey the signed and absolute bounds of that lemma.]
] <lem:gaussian-smoothing>

#proof[
  The disintegration (5.15) and Tonelli give the Mellin transform of $V$ as the product of its local Mellin integrals. Each finite factor is the positive volume of $U_v$, because $\| y_v \|_v = 1$ there. At a complex place put $t = \| y_v \|_v$. The classical Bessel integral, or the same Laplace integral used above, gives
  #[#set math.equation(numbering: n => "(5.25)")
   $ integral_0^oo t^(s + 1) K_(1 \/ 3) \( c_v sqrt(t) \) thin frac(thin upright(d) t, t) & = 2^(2 s + 1) c_v^(- 2 s - 2) Gamma \( s + 5 \/ 6 \) Gamma \( s + 7 \/ 6 \) \, #h(2em) "Re" s > - 5 \/ 6 . $ <eq:theta-bessel-mellin>]
  The angle integrals only change the positive measure constant. Multiplication over the $r$ complex places proves (5.21).
  Set
  $ cal(R)_V \( s \) = frac(e^(s^2), hat(V) \( s \)) = C_0^(- 1) A_0^(- s) e^(s^2) #scale(x: 120%, y: 120%)[\[] Gamma \( s + 5 \/ 6 \) Gamma \( s + 7 \/ 6 \) #scale(x: 120%, y: 120%)[\]]^(- r) . $
  The reciprocal gamma function is entire, so $cal(R)_V$ is entire. On each fixed closed vertical strip, Stirling’s formula implies
  $ \| cal(R)_V \( sigma + i t \) \| lt.eq C \( 1 + \| t \| \)^C e^(- t^2 + pi r \| t \|) . $
  The same bound with a different polynomial holds after multiplication by any power of $s$. Hence
  #[#set math.equation(numbering: n => "(5.26)")
   $ cal(K) \( T \) = frac(1, 2 pi i) integral_(\( sigma \)) cal(R)_V \( s \) T^s thin thin upright(d) s $ <eq:theta-kernel-definition>]
  converges absolutely and is independent of the real line $sigma$: the horizontal sides of a rectangle tend to zero by the Gaussian bound. Differentiation in $log T$ inserts a power of $s$. Moving the line to $N$ for $0 < T lt.eq 1$, and to $- N$ for $T gt.eq 1$, proves (5.22). In particular every $M_beta \( cal(K) \)$ in 16 is finite.
  Fourier inversion in $log T$ on a vertical line in (5.26) gives $hat(cal(K)) \( - s \) = cal(R)_V \( s \)$ on that line. Both sides are entire, so (5.24) holds everywhere. For example on any real line $sigma > 0$, absolute Mellin Fubini is valid because
  $ integral_0^oo \| cal(K) \( T \) \| T^(- sigma) frac(thin upright(d) T, T) < oo \, #h(2em) integral_0^oo V \( u \) u^sigma frac(thin upright(d) u, u) < oo . $
  It follows that the Mellin transform of the left side of (5.23) is $hat(V) \( s \) hat(cal(K)) \( - s \) = e^(s^2)$. The function on the right of (5.23) has the same transform, by the elementary Gaussian integral. Mellin inversion proves the identity. The final assertion follows from the convolution part of 16. ◻
]

== 6 Reflection and the quadratic large sieve <sec:reflection>

We prove the second-moment estimate in 12. Following the reflection method of [23] Part I, Sections 5–7, we realize $B_m$ as a theta average and apply the rational Weyl element. At a valuation-one row prime the reflected coefficient contributes a first power of the sextic symbol; a squarefree column prime contributes power $- 4$ in the same pairing. Their product has exponent $1 - 4 equiv 3 med \( mod med 6 \)$, so a quadratic large sieve applies. The reflected norm gives a column length of order $D^2 P \/ Z$, and the rapid decay of the norm profile controls the remaining terms.

=== 6.1 An automorphic expression for $B_m$ <an-automorphic-expression-for-b_m>

All implied constants in this section may depend on the fixed field, $S$, the target character $eta$, the compact set $cal(K)$, and the chosen finite family of local theta data.

We first replace elements by ideal rows. Choose a balanced allowed generator $m_0$ of each exterior ideal $frak(m)$. For every nonzero $m in R$ generating $frak(m)$, write $m = epsilon_m m_0$ with $epsilon_m in U_S$. When $m in cal(B)_Z \( cal(K) \)$, the balanced shapes of $m_0$, the fixed shape set $cal(K)$, and $q_(frak(m)) asymp_(cal(K)) Z^(M_0)$ put $epsilon_m$ in a fixed compact subset of the norm-one group. The $S$-unit theorem makes $U_S$ discrete there, so one ideal is generated by only boundedly many elements of the row set. Put

$ Gamma = U_S^6 \, #h(2em) U_6 = U_S \/ Gamma \, #h(2em) upsilon_m = epsilon_m Gamma in U_6 . $

The group $U_6$ is finite. The value of $B_m$ depends on the unit $epsilon_m$ only through $upsilon_m$, which is fixed when the row $m$ is fixed.

For a nonzero row let $j_(frak(p)) = v_(frak(p)) \( frak(m) \) med mod med 6$ in ${ 0 \, dots.h \, 5 }$. For an allowed generator $A$ of an integral exterior ideal $frak(A)$, reciprocity gives

#[#set math.equation(numbering: n => "(6.1)")
 $ chi_(frak(A)) \( m \) = chi_(frak(A)) \( epsilon_m \) product_(frak(p) divides frak(m)) chi_(frak(p)) \( A \)^(j_(frak(p))) . $ <eq:reflection-moving-twist>]

For coprime ideals this is the multiplicative reciprocity law from the arithmetic section. At a shared prime both sides vanish by zero extension, including when $j_(frak(p)) = 0$; the zeroth power there is the unit indicator.

Define $lambda_(epsilon_m) \( y \) = H_S \( epsilon_m \, y \)^(- 1)$ on $F_S^times$. By (3.5), its value at an allowed generator $A$ is $chi_(frak(A)) \( epsilon_m \)$, and isotropy of $E$ makes it trivial on $U_S$. It depends only on $upsilon_m$. With the character $L_S$ from (3.14), put $L_(upsilon_m) = L_S lambda_(epsilon_m)$. Then

#[#set math.equation(numbering: n => "(6.2)")
 $ L_(upsilon_m) \( A \) = theta.alt \( frak(A) \) chi_(frak(A)) \( epsilon_m \) #h(2em) upright("for every allowed generator ") A . $ <eq:reflection-S-character>]

These characters form a fixed finite family. They are smooth, unitary, and trivial on $U_S$; their radial components at infinity are trivial, and their angular component at each complex place has power $1$ or $- 1$.

We insert the moving twists by finite upper-unipotent translations. At an exterior prime $frak(p)$, write $k_(frak(p)) = cal(O)_F \/ frak(p)$ and use its allowed generator $p$ as a local uniformizer. For $1 lt.eq j lt.eq 5$ put

$ tau_(frak(p) \, j) = sum_(v in k_(frak(p))^times) chi_(frak(p)) \( v \)^(- j) psi_(frak(p)) \( v \/ p \) . $

The character is nontrivial, so $\| tau_(frak(p) \, j) \| = q_(frak(p))^(1 \/ 2)$. Define

#[#set math.equation(numbering: n => "(6.3)")
 $ alpha_(frak(p) \, j) \( v \) = cases(delim: "{", tau_(frak(p) \, j)^(- 1) chi_(frak(p)) \( v \)^(- j) \, & 1 lt.eq j lt.eq 5 \, med v eq.not 0 \,, 0 \, & 1 lt.eq j lt.eq 5 \, med v = 0 \,, 1 - q_(frak(p))^(- 1) \, & j = 0 \, med v = 0 \,, - q_(frak(p))^(- 1) \, & j = 0 \, med v eq.not 0 .) $ <eq:reflection-Fourier-mask>]

For every $t in cal(O)_(frak(p))$,

#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(v in k_(frak(p))) alpha_(frak(p) \, j) \( v \) psi_(frak(p)) \( t v \/ p \) = chi_(frak(p)) \( t \)^j . $ <eq:reflection-mask-identity>]

For $j eq.not 0$, substitution by $t^(- 1)$ proves this for a unit $t$, and both sides vanish for a nonunit. For $j = 0$, the left side is $1 - q_(frak(p))^(- 1) sum_v psi_(frak(p)) \( t v \/ p \)$, the unit indicator. Thus the formula includes the masked zeroth power.

For each $upsilon in U_6$, choose the theta vector in 13 whose finite $S$-Whittaker function is the indicator of the common small product subgroup contained in sixth powers and in $ker L_upsilon$, and whose complex angular type is that of $L_upsilon$. Denote its automorphic function by $theta_upsilon$. The cutoff and the normalizations are those of (5.14); these choices form a fixed finite family. For the remainder of this subsection fix a nonzero $m$, put $upsilon = upsilon_m$, and write $L = L_upsilon$.

For $y in F_S^times$ and digits $bold(v) = \( v_(frak(p)) \)_(frak(p) divides frak(m))$, let $g \( y \, bold(v) \)$ have component $a \( y \)$ at $S$, component $n \( v_(frak(p)) \/ p \)$ at $frak(p) divides frak(m)$, and identity at the other exterior places. Use the lifts in (5.4), choose representatives of the residue digits, and set

$ bold(alpha)_m \( bold(v) \) = product_(frak(p) divides frak(m)) alpha_(frak(p) \, j_(frak(p))) \( v_(frak(p)) \) \, #h(2em) w_(+) = 1 \, quad w_(-) = w . $

The combined digit sums that we shall integrate are

#[#set math.equation(numbering: n => "(6.5)")
 $ cal(D)_m^plus.minus \( y \) & = sum_(bold(v)) bold(alpha)_m \( bold(v) \) theta_upsilon \( w_plus.minus g \( y \, bold(v) \) \) \,\
cal(D)_(m \, N)^plus.minus \( y \) & = sum_(bold(v)) bold(alpha)_m \( bold(v) \) theta_(upsilon \, N) \( w_plus.minus g \( y \, bold(v) \) \) . $ <eq:reflection-combined-digits>]

Rational automorphy gives $cal(D)_m^(+) = cal(D)_m^(-)$. We next show that all four sums descend under $Gamma$.

For $gamma in Gamma$, choose representatives $v'_(frak(p)) equiv gamma v_(frak(p)) med \( mod med frak(p) \)$, and put

$ u_(frak(p)) = \( gamma v_(frak(p)) - v'_(frak(p)) \) \/ p in cal(O)_(frak(p)) . $

Let $k_S = 1$, $k_(frak(p)) = n \( u_(frak(p)) \) a \( gamma \)$ for $frak(p) divides frak(m)$, and $k_(frak(q)) = a \( gamma \)$ at the other exterior places. Because $gamma$ is an exterior unit, these are compact lifts fixing the original exterior spherical vector. At $S$ the torus factors involving $gamma$ are trivial, since it is a sixth power. At a row prime the exact root relation gives

$ n \( v'_(frak(p)) \/ p \) n \( u_(frak(p)) \) a \( gamma \) = a \( gamma \) n \( v_(frak(p)) \/ p \) . $

The rational diagonal and Weyl lifts therefore satisfy

#[#set math.equation(numbering: n => "(6.6)")
 $ g \( gamma y \, bold(v)' \) & = a \( gamma \) g \( y \, bold(v) \) k^(- 1) \,\
w g \( gamma y \, bold(v)' \) & = a \( gamma^(- 1) \) w g \( y \, bold(v) \) k^(- 1) . $ <eq:reflection-quotient-lifts>]

The second identity has the same compact factor at the far right.

The upper constant term has the required invariance at these right arguments as well. For $q in F^times$, any adelic $h$, and any such exterior compact $k$, the root relation and the product formula give

#[#set math.equation(numbering: n => "(6.7)")
 $ theta_(upsilon \, N) \( a \( q \) h k^(- 1) \) & = integral_(F without bb(A)_F) theta_upsilon \( a \( q \) n \( x \/ q \) h k^(- 1) \) thin thin upright(d) x\
 & = theta_(upsilon \, N) \( h \) . $ <eq:reflection-constant-term-descent>]

Indeed $n \( x \) a \( q \) = a \( q \) n \( x \/ q \)$; rational automorphy removes $a \( q \)$, and right invariance removes $k^(- 1)$ at the far right. The substitution $x mapsto x \/ q$ preserves Haar measure on $F without bb(A)_F$. This argument applies in particular when $h_(frak(p)) = w n \( v \/ p \)$. Finally $chi_(frak(p)) \( gamma \) = 1$, so $alpha_(frak(p) \, j) \( gamma v \) = alpha_(frak(p) \, j) \( v \)$, including the zero digit. Reindexing by $bold(v)' = gamma bold(v)$ in (6.6), (6.7) proves the asserted descent of the combined sums before and after $w$.

Recall $X_l = { y in F_S^times : \| y \|_S = l }$ and the sheet measures from (5.15). The quotient $X_l \/ Gamma$ is compact; choose a measurable fundamental set $Omega_1 subset X_1$ and put $Omega_l = ell_l Omega_1$, using the norm section from that disintegration. Every integral over $X_l \/ Gamma$ means the integral over $Omega_l$ with the restricted sheet measure, equivalently the quotient measure induced using counting measure on $Gamma$. The factors $upright(bold(1))_B \( \[ y \] \)$ and $L \( y \)^(- 1)$ also descend, since $\[ gamma \] = 1$ in $cal(V)$ and $L \( gamma \) = 1$. The resulting integrands are integrable on the quotient: the digit sums are finite and the factors are smooth or locally constant.

Both combined constant terms have zero weighted integral. To see this, rotate $y$ by a complex number $z$ of modulus one at one complex place. In the plus sum this acts by the left diagonal $a \( z \)$; in the minus sum it acts by $a \( z^(- 1) \)$. The constant term belongs to the torus induction in 13. Its complex inducing law is radial for every right argument, so both sums are unchanged, including at the exterior arguments $w n \( v \/ p \)$. The class condition is unchanged because $bb(C)^times$ is sixth-divisible, while $L \( y \)^(- 1)$ transforms by a nontrivial angular character. Haar invariance therefore gives

#[#set math.equation(numbering: n => "(6.8)")
 $ integral_(X_l \/ Gamma) upright(bold(1))_B \( \[ y \] \) L \( y \)^(- 1) cal(D)_(m \, N)^plus.minus \( y \) thin thin upright(d)_l^times y = 0 . $ <eq:reflection-angular-cancellation>]

We may now define the quotient average

#[#set math.equation(numbering: n => "(6.9)")
 $ cal(T)_m \( l \) & = integral_(X_l \/ Gamma) upright(bold(1))_B \( \[ y \] \) L \( y \)^(- 1) cal(D)_m^(+) \( y \) thin thin upright(d)_l^times y\
 & = integral_(X_l \/ Gamma) upright(bold(1))_B \( \[ y \] \) L \( y \)^(- 1) cal(D)_m^(-) \( y \) thin thin upright(d)_l^times y . $ <eq:reflection-theta-average>]

#prodef([Lemma 6.1.])[
  (Theta representation of the smoothed sum).  #emph[Let $V$ and $cal(K)$ be the common unrotated profile and Gaussian averaging weight from 17. For $l \, Z > 0$, 
#[#set math.equation(numbering: n => "(6.10)")
 $ cal(T)_m \( l \) & = sum_(frak(c) med upright("squarefree")\
frak(n)) frac(gamma_2 \( frak(c) \), q_(frak(c))^(1 \/ 2) q_(frak(n))) L \( A \) product_(frak(p) divides frak(m)) chi_(frak(p)) \( A \)^(j_(frak(p))) V \( q_(frak(A)) l \) \,\
B_m \( Z \) & = integral_0^oo cal(K) \( T \) cal(T)_m \( T \/ Z \) thin frac(thin upright(d) T, T) . $ <eq:reflection-unreflected>]

 Here $frak(A) = frak(c) frak(n)^3$ and $A = c n^3$ is an allowed product generator. The ideal sums are over integral exterior ideals. Both formulas converge absolutely after the sheet integrations, and the second converges absolutely after the $T$-integration.]
] <lem:reflection-theta-representation>

#proof[
  Use the Fourier expansion and normalized factorization in (5.3), (5.2) in the plus average. The constant term vanishes by (6.8). At a nonconstant rational frequency $nu$, a row-prime factor is
  $ W_(frak(p)) \( a \( nu \) n \( v \/ p \) \) = psi_(frak(p)) \( nu v \/ p \) W_(frak(p)) \( a \( nu \) \) . $
  Spherical support forces $nu in R$; summing the digits with (6.4) supplies $product_(frak(p) divides frak(m)) chi_(frak(p)) \( nu \)^(j_(frak(p)))$.
  Write $f_upsilon \( v \)$ for the chosen unrotated $S$-Whittaker function. The $S$-factor of the frequency is $cal(C)_S \( nu \, y \) f_upsilon \( nu y \)$. Its cutoff has $\[ nu y \] = 1$ in $cal(V)$. Together with $\[ y \] in B$, this gives $\[ nu \] in B$. By alternation and (5.9),
  $ cal(C)_S \( nu \, y \) = H_S \( nu \, nu^(- 1) \)^2 H_S \( nu \, nu y \)^2 = 1 $
  on that support. If $A$ is an allowed generator of the exterior ideal of $nu$, then $nu \/ A in U_S$. The direct sum $E xor B$ and the injection $U_6 arrow.r E$ now imply $nu = gamma A$ for $gamma in Gamma$. The grouped exterior factor is unchanged by this multiplication, by the local unit rule and $chi_(frak(p)) \( gamma \) = 1$.
  We justify the orbit substitution with an absolute integral first. The sets $gamma Omega_l$ partition $X_l$ up to null sets. Tonelli, multiplicative Haar invariance, and (5.16) give for $sigma > 1 \/ 2$
  #[#set math.equation(numbering: n => "(6.11)")
   $ sum_(gamma in Gamma) integral_(Omega_l) \| f_upsilon \( gamma A y \) \| thin thin upright(d)_l^times y & = integral_(X_(q_(frak(A)) l)) \| f_upsilon \( v \) \| thin thin upright(d)_(q_(frak(A)) l)^times v\
 & lt.double_sigma \( q_(frak(A)) l \)^(- sigma) . $ <eq:reflection-forward-absolute>]
  The signed substitution $v = gamma A y$ is therefore legitimate. Since $\[ y \] = \[ A \]^(- 1) \[ v \]$ and $L \( y \)^(- 1) = L \( A \) L \( v \)^(- 1)$, it gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ & sum_(gamma in Gamma) integral_(Omega_l) upright(bold(1))_B \( \[ y \] \) L \( y \)^(- 1) f_upsilon \( gamma A y \) thin thin upright(d)_l^times y\
 & quad = L \( A \) integral_(X_(q_(frak(A)) l)) upright(bold(1))_B \( \[ A \]^(- 1) \[ v \] \) L \( v \)^(- 1) f_upsilon \( v \) thin thin upright(d)_(q_(frak(A)) l)^times v\
 & quad = L \( A \) V \( q_(frak(A)) l \) . $ <eq:reflection-forward-unfolding>]
  For the last equality, $\[ v \] = 1$ on the cutoff, $\[ A \] in B$, and the angular characters cancel as in (5.20). Thus the integral depends on $A$ only through its norm. Multiplicative Haar measure introduces no norm Jacobian.
  By 14, the exterior spherical coefficient vanishes unless $frak(A) = frak(c) frak(n)^3$ with $frak(c)$ squarefree, and then equals $gamma_2 \( frak(c) \) \/ \( q_(frak(c))^(1 \/ 2) q_(frak(n)) \)$. This includes primes shared by $frak(c)$ and $frak(n)$. Together with (6.12) it proves (6.10).
  Here are the absolute bounds for the exchanges. Summing (6.11) with the exterior magnitudes is at most $l^(- sigma)$ times the convergent expression in (4.3). Before evaluating the finite digit sums, their total absolute mass is at most $q_(frak(p))^(1 \/ 2)$ for $j eq.not 0$ and is less than $2$ for $j = 0$. For a fixed row their finite product multiplies the same spherical majorant, which justifies that earlier exchange. Finally 17 gives every absolute moment of $cal(K)$. The averaged absolute sum is bounded by a constant times
  $ Z^sigma M_(- sigma) \( cal(K) \) $
  times the finite sum in (4.3). We may therefore apply (5.23) term by term. (6.1), (6.2) and the definition of $B_m$ give (6.10). ◻
]

=== 6.2 The local Weyl calculation <the-local-weyl-calculation>

The second expression in (6.9) is now the starting point. At $S$, $w a \( y \) = a \( y^(- 1) \) w$ replaces the vector by a fixed rotation and the argument by $y^(- 1)$. Its constant term has already been removed in (6.8). At an exterior place with zero or no digit, $w$ is compact. We compute the effect of each nonzero digit.

#prodef([Lemma 6.2.])[
  (Local effect of reflection).  #emph[Let $frak(p)$ be an exterior prime and put $W_e = W_(frak(p)) \( a \( p^e \) \)$. For $j in { 0 \, dots.h \, 5 }$, a unit $t$, and an integer $e$, define 
$ cal(R)_(frak(p) \, j \, e) \( t \) = sum_(v in k_(frak(p))^times) alpha_(frak(p) \, j) \( v \) W_(frak(p)) \( a \( p^(e - 2) t \) w n \( v \/ p \) \) . $

 It vanishes for $e < 0$. For $e gt.eq 0$, 
#[#set math.equation(numbering: n => "(6.13)")
 $ cal(R)_(frak(p) \, j \, e) \( t \) = W_e chi_(frak(p)) \( t \)^(4 + 2 e) sum_(v in k_(frak(p))^times) alpha_(frak(p) \, j) \( v \) chi_(frak(p)) \( v \)^4 psi_(frak(p)) \( p^(e - 1) t \/ v \) . $ <eq:reflection-local-formula>]

 For $j = 1$, it vanishes for $e > 0$, while 
#[#set math.equation(numbering: n => "(6.14)")
 $ cal(R)_(frak(p) \, 1 \, 0) \( t \) & = omega_(frak(p)) chi_(frak(p)) \( t \) \, #h(2em) \| omega_(frak(p)) \| = 1 \,\
omega_(frak(p)) & = frac(sum_(x eq.not 0) chi_(frak(p)) \( x \)^3 psi_(frak(p)) \( x \/ p \), tau_(frak(p) \, 1)) . $ <eq:reflection-valuation-one>]

 For all $j$, its magnitude at $e = 0$ is at most $1$, and for $e > 0$ is at most $q_(frak(p))^(1 \/ 2) \| W_e \|$. More precisely, for $e gt.eq 0$ put $s_(frak(p) \, j \, e) = cal(R)_(frak(p) \, j \, e) \( 1 \)$ and choose the exponents modulo $6$ by 
#[#set math.equation(numbering: n => "(6.15)")
 $ b_(j \, 0) equiv 8 - j \, #h(2em) b_(j \, e) equiv 4 + 2 e med \( e > 0 \) \, #h(2em) cal(R)_(frak(p) \, j \, e) \( t \) = s_(frak(p) \, j \, e) chi_(frak(p)) \( t \)^(b_(j \, e)) . $ <eq:reflection-local-monomial>]

 For $e > 0$, $s_(frak(p) \, j \, e) = 0$ unless $j = 4$, and it also vanishes for $e equiv 2 med \( mod med 3 \)$. The zero-digit term is available only for $j = 0$; at a frequency $nu$ it is $\( 1 - q_(frak(p))^(- 1) \) W_(frak(p)) \( a \( nu \) \)$, with ordinary spherical support.]
] <lem:reflection-local-Weyl>

#proof[
  For a unit digit $v$, the exact lift identity in (5.4), with $H = v \/ p$, is
  $ w n \( H \) = n \( H^(- 1) \) a \( H^(- 2) \) k_v \, #h(2em) k_v = a \( - 1 \) macron(n) \( p \/ v \) $
  with $k_v$ in the spherical compact group. Only the diagonal minus sign has been absorbed in $k_v$; its symbols are trivial because $F$ contains $mu_12$. Commuting the upper root past $a \( p^(e - 2) t \)$ gives the positive additive argument $psi_(frak(p)) \( p^(e - 1) t \/ v \)$. The effective torus law gives, for integers $e_1 \, e_2$ and units $u \, v$,
  $ cal(C)_(frak(p)) \( p^(e_1) u \, p^(e_2) v \) = chi_(frak(p)) \( u \)^(2 e_2) chi_(frak(p)) \( v \)^(- 2 e_1) . $
  The unit–unit and uniformizer–uniformizer factors are trivial. Thus torus multiplication contributes
  $ cal(C)_(frak(p)) \( p^(e - 2) t \, p^2 v^(- 2) \) = chi_(frak(p)) \( t \)^4 chi_(frak(p)) \( v \)^(4 \( e - 2 \)) . $
  The remaining spherical argument is $p^e t v^(- 2)$. It is zero for $e < 0$; otherwise (5.6) contributes $chi_(frak(p)) \( t \)^(2 e) chi_(frak(p)) \( v \)^(- 4 e) W_e$. Their product proves (6.13).
  For $e > 0$ the additive character is trivial. Unit-character orthogonality makes the digit sum zero unless $j = 4$, including the case $j = 0$. For every $j$ its absolute value is at most $q_(frak(p))^(1 \/ 2)$: use $\| alpha_(frak(p) \, j) \( v \) \| = q_(frak(p))^(- 1 \/ 2)$ for $j eq.not 0$ and $q_(frak(p))^(- 1)$ for $j = 0$. Its unit dependence is the power $4 + 2 e$, and $W_e = 0$ for $e equiv 2 med \( mod med 3 \)$.
  For $e = 0$, substitute $x = t \/ v$. If $j eq.not 0$, this leaves the power $chi_(frak(p)) \( t \)^(8 - j)$, divided by $tau_(frak(p) \, j)$, and the Gauss sum of $chi_(frak(p))^(j - 4)$ against $psi_(frak(p)) \( x \/ p \)$. That sum has magnitude $q_(frak(p))^(1 \/ 2)$, except for $j = 4$, when it has magnitude $1$. For $j = 1$ its character is quadratic and $8 - j equiv 1 med \( mod med 6 \)$, giving (6.14). For $j = 0$, the same substitution leaves $chi_(frak(p)) \( t \)^8$ times a nontrivial Gauss sum divided by $- q_(frak(p))$, again of magnitude at most one. These observations prove (6.15) and the remaining bounds. Finally, compactness of $w$ gives the zero-digit assertion by spherical right invariance. ◻
]

For a row $frak(m) = frak(h) frak(d)$, call a prime active when its digit is nonzero. Every prime of $frak(d)$ is active, because there $j_(frak(p)) = 1$. For $frak(p) divides frak(h)$ put $j_(frak(p)) = v_(frak(p)) \( frak(h) \) med mod med 6$. The exact set of possible active products in $frak(h)$ is

#[#set math.equation(numbering: n => "(6.16)")
 $ cal(F) \( frak(h) \) = {frak(f) med upright("squarefree") : frak(f) divides "rad" \( frak(h) \) \, med frak(p) divides frak(f) med upright("if ") med frak(p) divides frak(h) \, med j_(frak(p)) eq.not 0} . $ <eq:reflection-active-set>]

Only a prime with $j_(frak(p)) = 0$ can be inactive. For $frak(f) in cal(F) \( frak(h) \)$, its exact inactive scalar is

$ I_(frak(h) \, frak(f)) = product_(frak(p) divides frak(h)\
frak(p) divides.not frak(f)) \( 1 - q_(frak(p))^(- 1) \) \, $

and powerfulness gives

#[#set math.equation(numbering: n => "(6.17)")
 $ frak(f) divides "rad" \( frak(h) \) \, #h(2em) q_(frak(f))^2 lt.eq q_(frak(h)) . $ <eq:reflection-active-norm>]

Let $cal(A) \( frak(f) \)$ be the integral exterior ideals $frak(a)'_(frak(f))$ supported on $frak(f)$, with every exponent congruent to $0$ or $1$ modulo $3$; set $cal(A) \( 1 \) = { 1 }$. This is a convenient common support: the actual coefficient $s_(frak(p) \, j_(frak(p)) \, e)$ remains zero in the locally vanishing cases of 19.

The local support shows that every frequency with a nonzero grouped exterior coefficient occurs among

#[#set math.equation(numbering: n => "(6.18)")
 $ nu = epsilon frac(a'_(frak(f)) c' \( n' \)^3, \( d f \)^2) \, #h(2em) frak(a)' = frak(a)'_(frak(f)) frak(c)' \( frak(n)' \)^3 \, #h(2em) epsilon in U_S \, $ <eq:reflection-frequency>]

where $frak(a)'_(frak(f)) in cal(A) \( frak(f) \)$, $frak(c)'$ is squarefree, and $\( frak(c)' frak(n)' \, frak(d) frak(f) \) = 1$. The displayed elements $d \, f \, a'_(frak(f)) \, c' \, n'$ are allowed generators. The ideals $frak(c)'$ and $frak(n)'$ may share primes, and primes of $frak(h)$ omitted from $frak(f)$ may occur in either. The valuation-one formula forces numerator exponent zero at each prime of $frak(d)$. Away from $frak(d) frak(f)$, the valuations $3 k$ and $3 k + 1$ determine $frak(c)'$ and $frak(n)'$ uniquely. The remaining ambiguity is the displayed $S$-unit, since allowed product generators are unique modulo $Gamma$.

For later absolute estimates define

#[#set math.equation(numbering: n => "(6.19)")
 $ beta_(frak(p)) \( e \) = cases(delim: "{", 1 \, & e = 0 \,, q_(frak(p))^(- k) \, & e = 1 + 3 k \, med k gt.eq 0 \,, q_(frak(p))^(1 \/ 2 - k) \, & e = 3 k \, med k gt.eq 1 \,, 0 \, & upright("otherwise") \,) #h(2em) beta_(frak(f)) \( frak(a)'_(frak(f)) \) = product_(frak(p) divides frak(f)) beta_(frak(p)) \( v_(frak(p)) \( frak(a)'_(frak(f)) \) \) . $ <eq:reflection-frozen-weight>]

The local lemma and the spherical magnitudes give $\| s_(frak(p) \, j \, e) \| lt.eq beta_(frak(p)) \( e \)$. The other exterior magnitudes together are at most $q_(frak(c)')^(- 1 \/ 2) q_(frak(n)')^(- 1)$.

=== 6.3 The full reflected expansion <the-full-reflected-expansion>

We now assemble these local factors. The $S$-integrals form a fixed family of one-variable profiles. Let $f_(w \, upsilon) \( v \)$ be the $S$-Whittaker function of the chosen vector after the fixed Weyl rotation. Choose once a presentation

$ f_(w \, upsilon) \( v \) = sum_(ell = 1)^(J_upsilon) product_(a in S) f_(upsilon \, ell \, a) \( v_a \) . $

The finite $S$-functional and the fixed cutoff vector provide such presentations by Proposition 5.1, (5.14); their lengths are bounded over the finite row-class family. All fixed scalar coefficients are included in the displayed local factors. Write $H_S$ also for its induced pairing on $cal(V)$. For $kappa in cal(V)$, define

#[#set math.equation(numbering: n => "(6.20)")
 $ H_(upsilon \, kappa \, ell) \( x \) & = integral_(X_x) upright(bold(1))_B \( kappa \[ v \]^(- 1) \) H_S \( kappa \, \[ v \] \)^2 L_upsilon \( v \)\
 & #h(25mm)  times product_(a in S) f_(upsilon \, ell \, a) \( v_a \) thin thin upright(d)_x^times v \,\
Phi_(upsilon \, kappa \, ell) \( x \) & = integral_0^oo cal(K) \( T \) H_(upsilon \, kappa \, ell) \( x \/ T \) thin frac(thin upright(d) T, T) \,\
Phi_(upsilon \, kappa) \( x \) & = sum_(ell = 1)^(J_upsilon) Phi_(upsilon \, kappa \, ell) \( x \) . $ <eq:reflection-profiles>]

The class multiplier is bounded and depends only on $cal(V)$, by (5.9). The local bounds for the fixed rotated vectors and Lemma 5.4, Lemma 5.5 therefore give one $alpha > 0$ such that, for every $N > 0$ and integer $j gt.eq 0$,

#[#set math.equation(numbering: n => "(6.21)")
 $ \| \( x partial_x \)^j Phi_(upsilon \, kappa) \( x \) \| lt.double_(N \, j) min \( x^alpha \, x^(- N) \) #h(2em) \( x > 0 \) . $ <eq:reflection-profile-bound>]

The constants are uniform in $upsilon in U_6$ and $kappa in cal(V)$. This is a fixed finite family: the functional and tensor terms have been combined in $Phi_(upsilon \, kappa)$, while the bounded class function stays inside its integral. In particular those fixed coefficients will not enter the local majorant $beta_(frak(f))$.

Choose representatives $epsilon_u$ for the separate frequency-unit classes $u in U_6$. For

$ frak(t) = \( frak(h) \, frak(f) \, frak(a)'_(frak(f)) \, frak(n)' \, u \) \, #h(2em) frak(f) in cal(F) \( frak(h) \) \, quad frak(a)'_(frak(f)) in cal(A) \( frak(f) \) \, quad \( frak(n)' \, frak(f) \) = 1 \, $

and class slices $s_d \, s_c in B$, put

#[#set math.equation(numbering: n => "(6.22)")
 $ kappa_6 \( frak(t) \; s_d \, s_c \) = \[ epsilon_u \] \[ a'_(frak(f)) \] s_c \[ n' \]^3 s_d^(- 2) \[ f \]^(- 2) in cal(V) . $ <eq:reflection-profile-class>]

This is a selected class, rather than a further summation index. For $frak(p) divides frak(f)$, abbreviate

$ e_(frak(p)) = v_(frak(p)) \( frak(a)'_(frak(f)) \) \, #h(2em) s_(frak(p)) = s_(frak(p) \, j_(frak(p)) \, e_(frak(p))) \, #h(2em) b_(frak(p)) = b_(j_(frak(p)) \, e_(frak(p))) . $

With $upsilon \, frak(t) \, s_d \, s_c$ fixed, the next three factors organize the dependence on the two varying ideals: $omega$ depends on neither, $rho$ depends on the row $frak(d)$ alone, and $lambda$ depends on the column $frak(c)'$ alone. All three are independent of $Z$. The quadratic symbol and norm profile will contain the remaining joint dependence on $frak(d)$ and $frak(c)'$. For $L = L_upsilon$ and $epsilon = epsilon_u$, define

#[#set math.equation(numbering: n => "(6.23)")
 $ omega_(upsilon \, frak(t)) =  & I_(frak(h) \, frak(f)) L \( a'_(frak(f)) \)^(- 1) L \( n' \)^(- 3) L \( f \)^2\
 &  times product_(frak(p) divides frak(f)) s_(frak(p)) chi_(frak(p)) #h(-0.16667em) (epsilon a'_(frak(f)) / p^(e_(frak(p))) \( n' \)^3 \( f \/ p \)^(- 2))^(b_(frak(p))) . $ <eq:reflection-frozen-factor>]

For a squarefree $frak(d)$ with $\( frak(d) \, frak(h) frak(n)' \) = 1$ and $\[ d \] = s_d$, put

#[#set math.equation(numbering: n => "(6.24)")
 $ rho_(upsilon \, frak(t) \, s_d) \( frak(d) \) =  & L \( d \)^2\
 &  times product_(frak(p) divides frak(d)) omega_(frak(p)) chi_(frak(p)) #h(-0.16667em) (epsilon a'_(frak(f)) \( n' \)^3 \( d \/ p \)^(- 2) f^(- 2))\
 &  times product_(frak(p) divides frak(f)) chi_(frak(p)) \( d \)^(- 2 b_(frak(p))) \, $ <eq:reflection-row-factor>]

and put it equal to zero otherwise. For a squarefree $frak(c)'$ with $\( frak(c)' \, frak(f) \) = 1$ and $\[ c' \] = s_c$, put

#[#set math.equation(numbering: n => "(6.25)")
 $ lambda_(upsilon \, frak(t) \, s_c) \( frak(c)' \) =  & L \( c' \)^(- 1) product_(frak(p) divides frak(f)) chi_(frak(p)) \( c' \)^(b_(frak(p)))\
 &  times product_(frak(q) divides frak(c)') g_(2 \, frak(q)) chi_(frak(q)) #h(-0.16667em) (epsilon a'_(frak(f)) \( c' \/ q \) f^(- 2))^2 \, $ <eq:reflection-column-factor>]

and put it equal to zero otherwise. All character arguments in these formulas are units at their primes on the stated supports. Thus negative character powers are well-defined. These definitions give one coherent row function and one coherent column function for each frozen tuple and class slice.

#prodef([Lemma 6.3.])[
  (The reflected expansion).  #emph[For every nonzero $m in R$ and $Z > 0$, let $\( m \)_S = frak(h) frak(d)$ and $upsilon = upsilon_m$. Then 
#[#set math.equation(numbering: n => "(6.26)")
 $ B_m \( Z \) =  & sum_(frak(f) in cal(F) \( frak(h) \)) sum_(frak(a)'_(frak(f)) in cal(A) \( frak(f) \)\
frak(n)'\
\( frak(n)' \, frak(f) \) = 1) sum_(u in U_6\
s_d \, s_c in B) omega_(upsilon \, frak(t)) / q_(frak(n)')\
 &  times rho_(upsilon \, frak(t) \, s_d) \( frak(d) \) #scale(x: 300%, y: 300%)[\[] sum_(frak(c)' med upright("squarefree")) frac(lambda_(upsilon \, frak(t) \, s_c) \( frak(c)' \), q_(frak(c)')^(1 \/ 2)) chi_(frak(d)) \( c' \)^3\
 &  times Phi_(upsilon \, kappa_6 \( frak(t) \; s_d \, s_c \)) #h(-0.16667em) (frac(Z q_(frak(a)'_(frak(f))) q_(frak(c)') q_(frak(n)')^3, q_(frak(d))^2 q_(frak(f))^2)) #scale(x: 300%, y: 300%)[\]] . $ <eq:reflection-global-expansion>]

 All ideal sums are over integral exterior ideals, and the expansion is absolutely convergent. The coefficients satisfy 
$ \| omega_(upsilon \, frak(t)) \| lt.eq beta_(frak(f)) \( frak(a)'_(frak(f)) \) \, #h(2em) \| rho_(upsilon \, frak(t) \, s_d) \| lt.eq 1 \, #h(2em) \| lambda_(upsilon \, frak(t) \, s_c) \| lt.eq 1 . $

 The row-unit class $upsilon$ is fixed; $u$ is the independently summed frequency-unit class.]
] <lem:reflection-quadratic-pairing>

#proof[
  We use the minus average in (6.9) and its nonconstant Fourier terms. We first supply the absolute bound needed before unfolding any signed unit orbit. Define
  $ F_(w \, upsilon)^(upright("abs")) \( v \) = sum_(ell = 1)^(J_upsilon) product_(a in S) \| f_(upsilon \, ell \, a) \( v_a \) \| \, #h(2em) H_(w \, upsilon)^(upright("abs")) \( x \) = integral_(X_x) F_(w \, upsilon)^(upright("abs")) \( v \) thin thin upright(d)_x^times v . $
  This is an absolute profile of 16; in particular $H_(w \, upsilon)^(upright("abs")) \( x \) lt.double_sigma x^(- sigma)$ for $sigma > 1 \/ 2$, uniformly over the fixed row-class family. For any $nu_0 in F^times$, the sets $gamma Omega_l^(- 1)$ partition $X_(1 \/ l)$. Tonelli and multiplicative Haar invariance give
  #[#set math.equation(numbering: n => "(6.27)")
   $ sum_(gamma in Gamma) integral_(Omega_l) F_(w \, upsilon)^(upright("abs")) \( gamma nu_0 \/ y \) thin thin upright(d)_l^times y & = H_(w \, upsilon)^(upright("abs")) \( \| nu_0 \|_S \/ l \)\
 & lt.double_sigma \( \| nu_0 \|_S \/ l \)^(- sigma) . $ <eq:reflection-reflected-absolute>]
  For a fixed row, this also justifies the exchanges before evaluating the digits. At one nonzero digit, the absolute Whittaker factor in the proof of 19 is $\| W_e \|$ at numerator valuation $e gt.eq 0$. Summing the absolute digit weights costs at most $q_(frak(p))^(1 \/ 2)$ for $j eq.not 0$ and is less than $2$ for $j = 0$. For $sigma > 1 \/ 2$, the weighted spherical series is
  $ sum_(e gt.eq 0) \| W_e \| q_(frak(p))^(- sigma e) = frac(1 + q_(frak(p))^(- 1 \/ 2 - sigma), 1 - q_(frak(p))^(- 1 - 3 sigma)) < oo . $
  The denominator shift $e - 2$ multiplies this by $q_(frak(p))^(2 sigma)$. There are only finitely many row primes, so their resulting product is finite for the fixed row. Here the numerator valuations at the primes of $frak(d)$ are still summed. The product of ordinary spherical series at the other primes is bounded by $zeta_F^S \( sigma + 1 \/ 2 \) zeta_F^S \( 3 sigma + 1 \)$. Partitioning the units into the finitely many $U_6$-classes and applying (6.27) bounds the absolute sheet sum. The $T$-average then uses $M_sigma \( cal(K) \) < oo$. Thus these preliminary exchanges are valid for each fixed row. The uniform estimates below use the coefficients after the finite digit sums have been evaluated.
  Partition the zero and nonzero digits by $frak(f) in cal(F) \( frak(h) \)$, apply 19, and parameterize the frequencies by (6.18). For the fixed representative $epsilon = epsilon_u$, write
  $ nu = gamma nu_0 \, #h(2em) nu_0 = epsilon frac(a'_(frak(f)) c' \( n' \)^3, \( d f \)^2) \, #h(2em) gamma in Gamma . $
  The valuations and then the frequency-unit class give a unique such parameterization on the stated support. At $frak(p) divides frak(d)$, the local unit of $nu_0 = p^(- 2) t$ is
  $ t = epsilon a'_(frak(f)) c' \( n' \)^3 \( d \/ p \)^(- 2) f^(- 2) . $
  At $frak(p) divides frak(f)$, the local unit of $nu_0 = p^(e_(frak(p)) - 2) t$ is
  $ t = epsilon \( a'_(frak(f)) \/ p^(e_(frak(p))) \) c' \( n' \)^3 d^(- 2) \( f \/ p \)^(- 2) . $
  At $frak(q) divides frak(c)'$, put $k = v_(frak(q)) \( frak(n)' \)$. The spherical valuation is $1 + 3 k$, and its unit exponent is $2$ modulo $6$. The cube unit from $\( n' \/ q^k \)^3$ disappears from the symbol. A prime of $frak(n)'$ outside $frak(c)'$ has unit exponent divisible by $6$. Consequently the exact grouped exterior factor on $\( frak(d) \, frak(h) frak(n)' \) = \( frak(c)' \, frak(f) \) = \( frak(d) \, frak(c)' \) = 1$ is
  #[#set math.equation(numbering: n => "(6.28)")
   $ cal(E)_(frak(t)) \( frak(d) \, frak(c)' \) =  & frac(I_(frak(h) \, frak(f)), q_(frak(c)')^(1 \/ 2) q_(frak(n)'))\
 &  times product_(frak(p) divides frak(d)) omega_(frak(p)) chi_(frak(p)) #h(-0.16667em) (epsilon a'_(frak(f)) c' \( n' \)^3 \( d \/ p \)^(- 2) f^(- 2))\
 &  times product_(frak(p) divides frak(f)) s_(frak(p)) chi_(frak(p)) #h(-0.16667em) (epsilon \( a'_(frak(f)) \/ p^(e_(frak(p))) \) c' \( n' \)^3 d^(- 2) \( f \/ p \)^(- 2))^(b_(frak(p)))\
 &  times product_(frak(q) divides frak(c)') g_(2 \, frak(q)) chi_(frak(q)) #h(-0.16667em) (epsilon a'_(frak(f)) \( c' \/ q \) \( d f \)^(- 2))^2 . $ <eq:reflection-exterior-factorization>]
  The factor $I_(frak(h) \, frak(f))$ is present whether or not an inactive prime occurs in $frak(c)'$ or $frak(n)'$. Thus the formula includes their overlap at such a prime as well as every other $frak(c)'$–$frak(n)'$ overlap. The local zeros $s_(frak(p)) = 0$ keep the broader active numerator support exact.
  We identify the only factor involving both row and column variables. At a pair $frak(p) divides frak(d)$, $frak(q) divides frak(c)'$, the row factor supplies $chi_(frak(p)) \( q \)$, and the denominator $d^(- 2)$ in the spherical column factor supplies $chi_(frak(q)) \( p \)^(- 4)$. Allowed-generator reciprocity gives
  #[#set math.equation(numbering: n => "(6.29)")
   $ chi_(frak(p)) \( q \) chi_(frak(q)) \( p \)^(- 4) = chi_(frak(p)) \( q \)^(1 - 4) = chi_(frak(p)) \( q \)^3 . $ <eq:reflection-one-minus-four>]
  Multiplying over the pairs gives $chi_(frak(d)) \( c' \)^3$. There is no further pairing from a prime occurring only in $frak(n)'$, since its unit exponent is divisible by $6$. The separated $S$-character is
  $ L \( nu_0 \)^(- 1) = L \( a'_(frak(f)) \)^(- 1) L \( c' \)^(- 1) L \( n' \)^(- 3) L \( d \)^2 L \( f \)^2 \, $
  because $L \( epsilon \) = 1$. Comparing (6.28) with (6.23), (6.24), (6.25) therefore gives, on the indicated class slices,
  #[#set math.equation(numbering: n => "(6.30)")
   $ cal(E)_(frak(t)) \( frak(d) \, frak(c)' \) L \( nu_0 \)^(- 1) = frac(omega_(upsilon \, frak(t)) rho_(upsilon \, frak(t) \, s_d) \( frak(d) \) lambda_(upsilon \, frak(t) \, s_c) \( frak(c)' \), q_(frak(c)')^(1 \/ 2) q_(frak(n)')) chi_(frak(d)) \( c' \)^3 . $ <eq:reflection-factor-separation>]
  The local bounds prove the three coefficient bounds in the lemma. The zero extension of the quadratic symbol makes the right side zero when $frak(d)$ and $frak(c)'$ meet, as the valuation-one support requires. A prime shared by $frak(d)$ and $frak(n)'$ must instead be removed by the separate row support of $rho$. Together with $\( frak(n)' \, frak(f) \) = 1$ and the column support of $lambda$, these conditions reproduce exactly $\( frak(c)' frak(n)' \, frak(d) frak(f) \) = 1$.
  It remains to evaluate the $S$-integral. The grouped digit sums $cal(R)_(frak(p) \, j \, e) \( t \)$ are unchanged under $t mapsto gamma t$ for $gamma in Gamma$, by (6.15). The same is true of each ordinary spherical factor and of the zero-digit factor, since $chi_(frak(p)) \( gamma \) = 1$. This includes active $j = 0$ terms and the zero digit. Thus the grouped exterior coefficient may be taken outside the signed $Gamma$-orbit. That orbit is absolutely dominated by (6.27).
  The reflected $S$-factor is $cal(C)_S \( gamma nu_0 \, y^(- 1) \) f_(w \, upsilon) \( gamma nu_0 \/ y \)$. In the legitimate substitution $v = gamma nu_0 \/ y$, $\[ y \] = \[ nu_0 \] \[ v \]^(- 1)$ and $L \( y \)^(- 1) = L \( nu_0 \)^(- 1) L \( v \)$. Alternation and (5.9) give
  $ cal(C)_S \( gamma nu_0 \, y^(- 1) \) = H_S \( gamma nu_0 \, v \/ \( gamma nu_0 \) \)^2 = H_S \( nu_0 \, v \)^2 . $
  We obtain the exact identity
  #[#set math.equation(numbering: n => "(6.31)")
   $ & sum_(gamma in Gamma) integral_(Omega_l) upright(bold(1))_B \( \[ y \] \) L \( y \)^(- 1) cal(C)_S \( gamma nu_0 \, y^(- 1) \) f_(w \, upsilon) \( gamma nu_0 \/ y \) thin thin upright(d)_l^times y\
 & quad = L \( nu_0 \)^(- 1) integral_(X_(\| nu_0 \|_S \/ l)) upright(bold(1))_B \( \[ nu_0 \] \[ v \]^(- 1) \) H_S \( nu_0 \, v \)^2 L \( v \) f_(w \, upsilon) \( v \) thin thin upright(d)_(\| nu_0 \|_S \/ l)^times v . $ <eq:reflection-S-unfolding>]
  The sheet norm is
  $ frac(\| nu_0 \|_S, l) = frac(q_(frak(a)'_(frak(f))) q_(frak(c)') q_(frak(n)')^3, q_(frak(d))^2 q_(frak(f))^2 l) \; $
  there is no norm Jacobian. Inside the integral $nu_0$ occurs only through its class in $cal(V)$. On the supports of the two class indicators this class is exactly $kappa_6 \( frak(t) \; s_d \, s_c \)$. Thus no continuous shape of the row or column generator remains inside the profile.
  Insert the two class partitions, use (6.30), and split the fixed $S$-function into its $ell$-terms. Putting $l = T \/ Z$ in (6.10) produces precisely the combined profile in (6.20), and hence (6.26). For a fixed row class and fixed ideal data $\( frak(h) \, frak(f) \, frak(a)'_(frak(f)) \, frak(n)' \)$, there are only $\| U_6 \| \| B \|^2$ choices of the frequency unit and two slices. After those choices, the class $kappa_6$ is determined and there is one combined profile. The active sets and the ideal sums are the explicit outer sums in the expansion.
  We finish by verifying the uniform absolute bound after grouping. For $sigma gt.eq 0$,
  #[#set math.equation(numbering: n => "(6.32)")
   $ E_(frak(p)) \( sigma \) := sum_(e gt.eq 0) beta_(frak(p)) \( e \) q_(frak(p))^(- sigma e) = 1 + frac(q_(frak(p))^(- sigma) + q_(frak(p))^(- 1 \/ 2 - 3 sigma), 1 - q_(frak(p))^(- 1 - 3 sigma)) lt.eq 3 + sqrt(2) . $ <eq:reflection-frozen-Dirichlet>]
  In particular, for every $delta_1 > 0$, $product_(frak(p) divides frak(f)) E_(frak(p)) \( sigma \) lt.double_(F \, delta_1) q_(frak(f))^(delta_1)$, uniformly for $sigma gt.eq 0$. Absorb the finitely many primes of norm below $\( 3 + sqrt(2) \)^(1 \/ delta_1)$ into the constant and bound each remaining factor by $q_(frak(p))^(delta_1)$.
  Put $Q = q_(frak(a)'_(frak(f))) q_(frak(c)') q_(frak(n)')^3$. Dropping squarefreeness and the unfrozen coprimality restrictions in the nonnegative majorant gives
  #[#set math.equation(numbering: n => "(6.33)")
   $ cal(D)_(frak(f)) \( sigma \) & := sum_(frak(a)'_(frak(f)) \, frak(c)' \, frak(n)') beta_(frak(f)) \( frak(a)'_(frak(f)) \) q_(frak(c)')^(- 1 \/ 2) q_(frak(n)')^(- 1) Q^(- sigma)\
 & lt.eq zeta_F^S \( sigma + 1 \/ 2 \) zeta_F^S \( 3 sigma + 1 \) product_(frak(p) divides frak(f)) E_(frak(p)) \( sigma \) < oo #h(2em) \( sigma > 1 \/ 2 \) . $ <eq:reflection-reflected-Dirichlet>]
  The frozen ideal still ranges over $cal(A) \( frak(f) \)$. For $t_(frak(d)) = q_(frak(d))^2 q_(frak(f))^2 \/ Z$, the absolute profile above dominates every class multiplier and yields
  #[#set math.equation(numbering: n => "(6.34)")
   $ & integral_0^oo \| cal(K) \( T \) \| sum_(frak(a)'_(frak(f)) \, frak(c)' \, frak(n)') beta_(frak(f)) \( frak(a)'_(frak(f)) \) q_(frak(c)')^(- 1 \/ 2) q_(frak(n)')^(- 1) H_(w \, upsilon)^(upright("abs")) #h(-0.16667em) (frac(Q, t_(frak(d)) T)) frac(thin upright(d) T, T)\
 & #h(2cm)  lt.double_sigma t_(frak(d))^sigma M_sigma \( cal(K) \) cal(D)_(frak(f)) \( sigma \) < oo . $ <eq:reflection-reflected-Fubini>]
  This justifies all exchanges in the grouped expansion. Its constants are uniform in the ideal data, apart from the displayed product of local majorants. Since $cal(F) \( frak(h) \)$ is finite for each fixed row, the full expansion is absolutely convergent. ◻
]

The case $m = 0$ remains the separate identity $B_0 \( Z \) = P_G \( 1 \/ Z \)$ from the coefficient-family section.

The expansion also displays the length used in the second moment. On dyads $P lt.eq q_(frak(h)) < 2 P$ and $D lt.eq q_(frak(d)) < 2 D$, put

#[#set math.equation(numbering: n => "(6.35)")
 $ Q & = q_(frak(a)'_(frak(f))) q_(frak(c)') q_(frak(n)')^3 \, & #h(2em) t_(frak(d)) & = frac(q_(frak(d))^2 q_(frak(f))^2, Z) \,\
cal(L) & = frac(8 D^2 P, Z) \, & R_0 & = Z^delta cal(L) \, $ <eq:reflection-column-cutoff>]

where $delta > 0$ will be chosen small. By (6.17), $t_(frak(d)) lt.eq cal(L)$. We shall retain $Q lt.eq R_0$, which in particular gives $q_(frak(c)') lt.eq R_0$. If $R_0 < 1$, this range is empty because $Q$ is the norm of an integral ideal. The tail estimate below justifies this truncation for every dyad, including that case.

=== 6.4 The quadratic large sieve and the moment estimate <the-quadratic-large-sieve-and-the-moment-estimate>

We use the quadratic large sieve established over $bb(Q)$ by Heath-Brown and extended to Hecke families by Goldmakher–Louvel [12,8]. We state the latter result in the form needed for (6.26) and verify its family hypotheses for the present generator convention.

#prodef([Lemma 6.4.])[
  (Quadratic large sieve for the exterior symbols).  #emph[For $C \, D gt.eq 1$ and complex coefficients $z_(frak(c))$ supported on squarefree exterior ideals with $q_(frak(c)) lt.eq C$, one has, for every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(6.36)")
 $ sum_(frak(d) med upright("squarefree")\
q_(frak(d)) lt.eq D) lr(|sum_(frak(c) med upright("squarefree")\
q_(frak(c)) lt.eq C) z_(frak(c)) chi_(frak(d)) \( c \)^3|)^2 lt.double_(F \, S \, epsilon.alt) \( C + D \) \( C D \)^epsilon.alt sum_(frak(c)) \| z_(frak(c)) \|^2 . $ <eq:reflection-quadratic-sieve>]

 Arbitrary restrictions on the rows and separate restrictions or unitary factors on the columns are allowed by deleting rows and changing the coefficients.]
] <lem:reflection-quadratic-sieve>

#proof[
  We verify Definition 1 of Goldmakher–Louvel before applying their Theorem 1.1 [8]. Choose an ordinary integral ideal $frak(q)_S$ supported on the finite places of $S$, with a positive exponent $m_v$ at each such place large enough that $1 + frak(p)_v^(m_v) cal(O)_v subset F_v^(times 2)$. Every local quadratic character at $v$ is trivial on this subgroup, so its conductor exponent is at most $m_v$. Exterior ideals are exactly the ordinary ideals prime to $frak(q)_S$, with the same norms.
  For a squarefree exterior ideal $frak(c)$, let $Xi_(frak(c))$ be the primitive Hecke character of the possibly trivial quadratic Kummer extension $F \( sqrt(c) \) \/ F$. It is independent of the allowed generator, since two such generators differ by a sixth power of an $S$-unit. At an exterior prime its local conductor exponent is one if the prime divides $frak(c)$ and zero otherwise: at the odd residue characteristics under consideration an odd valuation gives a tamely ramified quadratic extension, whereas a unit gives an unramified or trivial extension. Thus
  $ "cond" \( Xi_(frak(c)) \) = frak(c) frak(s)_(frak(c)) \, #h(2em) frak(s)_(frak(c)) divides frak(q)_S . $
  Its infinite type is trivial because all infinite places of $F$ are complex. On an exterior ideal $frak(d)$,
  $ Xi_(frak(c)) \( frak(d) \) = chi_(frak(d)) \( c \)^3 . $
  This includes the zero at a shared prime, which is in the conductor of $Xi_(frak(c))$. These are the primitive global characters, not a character with additional artificially deleted Euler factors.
  Let $B_2$ be the image of $B$ in $F_S^times \/ F_S^(times 2)$ and set $upright("cl")_2 \( frak(c) \) = \[ c \]_(S \, 2) in B_2$. Allowed generators multiply modulo $U_S^6$, so this extends to a homomorphism on the group of all fractional exterior ideals. It has finite image. It is also ray-class data for $frak(q)_S$: for a principal exterior ideal $\( x \)$ its value is the $B_2$-projection of $\[ x \]_(S \, 2)$ in the direct sum induced by $E xor B$; if $x equiv 1 med \( mod med frak(q)_S \)$, all its local classes at $S$ are squares, so this projection is trivial.
  For coprime squarefree exterior ideals, the exact reciprocity of allowed generators gives
  $ Xi_(frak(c)) \( frak(d) \) = chi_(frak(d)) \( c \)^3 = chi_(frak(c)) \( d \)^3 = Xi_(frak(d)) \( frak(c) \) . $
  Thus the finite-class reciprocity factor in that definition may be taken identically one. If $frak(c)_1 \, frak(c)_2$ are coprime squarefree exterior ideals and have the same $upright("cl")_2$, their quotient $c_1 \/ c_2$ is a square at every place of $S$. The primitive character inducing $Xi_(frak(c)_1) overline(Xi_(frak(c)_2))$ is consequently trivial there. At every prime of $frak(c)_1 frak(c)_2$ it is tamely ramified with conductor exponent one, and at every other exterior prime it is unramified. Its #emph[global] conductor is therefore exactly $frak(c)_1 frak(c)_2$. The product here is understood as the primitive inducing character, with the convention specified in [8] §2. This verifies the conductor-product axiom, including the part at $S$.
  We have thus obtained a quadratic Hecke family in the precise sense of [8] Definition 1. Its Theorem 1.1 gives (6.36). Apply that theorem to the full family and then delete unwanted rows or set unwanted coefficients to zero; a single class slice need not itself be a Hecke family. ◻
]

#proof[
  The initial element-to-ideal reduction lets us fix one row-unit class $upsilon in U_6$ and sum over ideal rows at a bounded cost. Fix dyads $P lt.eq q_(frak(h)) < 2 P$ and $D lt.eq q_(frak(d)) < 2 D$ which meet the row set. They satisfy
  #[#set math.equation(numbering: n => "(6.37)")
   $ P D lt.double_(cal(K)) Z^(M_0) \, #h(2em) P \, D gt.eq 1 . $ <eq:reflection-PD-range>]
  There are $O_F \( P^(1 \/ 2) \)$ powerful ideals on the first dyad. In fact every powerful ideal has a unique expression $frak(r)^2 frak(s)^3$ with $frak(s)$ squarefree (choose its exponent as the parity of each prime exponent). The fixed-field bound for the number of ideals of norm at most $t$ is $O_F \( t \)$, hence
  #[#set math.equation(numbering: n => "(6.38)")
   $ \# { frak(h) upright(" powerful") : q_(frak(h)) < 2 P } lt.double_F P^(1 \/ 2) sum_(frak(s)) q_(frak(s))^(- 3 \/ 2) lt.double_F P^(1 \/ 2) . $ <eq:reflection-powerful-count>]
  Fix $frak(h)$, and use $Q \, t_(frak(d)) \, cal(L) \, R_0$ from (6.35). For each $frak(f) in cal(F) \( frak(h) \)$ and $upright(bold(s)) = \( u \, s_d \, s_c \) in U_6 times B^2$, split its partial sum in (6.26) according to $Q lt.eq R_0$ or $Q > R_0$. Denote these sums, which still include $frak(a)'_(frak(f)) \, frak(n)' \, frak(c)'$, by $"Ret"_(frak(f) \, upright(bold(s)) \, frak(d))$ and $"Tail"_(frak(f) \, upright(bold(s)) \, frak(d))$. Sum them over the admitted $frak(f)$ and the finite $upright(bold(s))$ to define $"Ret"_(frak(h) \, frak(d))$ and $"Tail"_(frak(h) \, frak(d))$. Thus, on a row with class $upsilon$,
  $ B_m \( Z \) = "Ret"_(frak(h) \, frak(d)) + "Tail"_(frak(h) \, frak(d)) . $
  Set both parts to zero outside the squarefree rows $frak(d)$ coprime to $frak(h)$. The threshold $R_0$ is common to the dyad and independent of the individual row. When $R_0 < 1$ the retained part is empty, so no large sieve at a length below one is required.
  We first bound the discarded terms, uniformly in this case as well. Put $cal(J) = max \( Z^delta \, cal(L)^(- 1) \)$, and fix $N > sigma > 1 \/ 2$. For $Q > R_0$ we have both $Q \/ t_(frak(d)) > Z^delta$ and $Q \/ t_(frak(d)) gt.eq cal(L)^(- 1)$, because $Q gt.eq 1$. The profile estimate therefore gives
  $ upright(bold(1))_(Q > R_0) \| Phi_(upsilon \, kappa) \( Q \/ t_(frak(d)) \) \| lt.double_N cal(J)^(- \( N - sigma \)) \( t_(frak(d)) \/ Q \)^sigma . $
  Summing absolutely with (6.33), for one active product and one fixed $upright(bold(s))$, yields
  #[#set math.equation(numbering: n => "(6.39)")
   $ \| "Tail"_(frak(f) \, upright(bold(s)) \, frak(d)) \| lt.double_(N \, sigma \, F) cal(L)^sigma cal(J)^(- \( N - sigma \)) zeta_F^S \( sigma + 1 \/ 2 \) zeta_F^S \( 3 sigma + 1 \) product_(frak(p) divides frak(f)) E_(frak(p)) \( sigma \) . $ <eq:reflection-tail-bound>]
  This one estimate includes all column, cube, and frozen-exponent tails. If $R_0 < 1$, then $cal(J) = cal(L)^(- 1)$ and the corresponding entire partial sum is $O \( cal(L)^N product E_(frak(p)) \( sigma \) \)$.
  For every $delta_1 > 0$, (6.32) also gives
  #[#set math.equation(numbering: n => "(6.40)")
   $ sum_(frak(f) divides "rad" \( frak(h) \)) product_(frak(p) divides frak(f)) E_(frak(p)) \( sigma \) = product_(frak(p) divides frak(h)) \( 1 + E_(frak(p)) \( sigma \) \) lt.double_(F \, delta_1) q_(frak(h))^(delta_1) #h(2em) \( sigma gt.eq 0 \) . $ <eq:reflection-active-choice-sum>]
  The same finite-small-prime argument proves this inequality; including all divisors only adds active choices that may actually be forbidden. Sum (6.39) over them and over the fixed finite class list, square, and use $O_F \( D \)$ for the number of row ideals on the second dyad and (6.38). The total squared tail is
  #[#set math.equation(numbering: n => "(6.41)")
   $ lt.double_(N \, sigma \, F \, delta_1) P^(1 \/ 2 + 2 delta_1) D thin cal(L)^(2 sigma) cal(J)^(- 2 \( N - sigma \)) . $ <eq:reflection-tail-mass>]
  Here (6.37) implies $P lt.double Z^(M_0)$ and $cal(L) lt.double Z^(2 M_0 - 1)$, while $cal(J) gt.eq Z^delta$. Given any $A_0 > 0$, choosing $N$ with
  $ 2 delta \( N - sigma \) > A_0 + 2 M_0 delta_1 + 2 sigma \( 2 M_0 - 1 \) $
  makes (6.41) $O \( Z^(- A_0) P^(1 \/ 2) D \)$. This proves the promised absolute domination of the discarded range, including all dyads for which $R_0 < 1$.
  It remains to bound the retained terms when $R_0 gt.eq 1$. Fix $frak(f) \, upright(bold(s)) \, frak(a)'_(frak(f)) \, frak(n)'$. Then $kappa = kappa_6 \( frak(t) \; s_d \, s_c \)$ is fixed, while $rho_(upsilon \, frak(t) \, s_d)$ and $lambda_(upsilon \, frak(t) \, s_c)$ are coherent functions of all rows and columns in the two slices. Split $frak(c)'$ into dyads $C lt.eq q_(frak(c)') < 2 C$, $C gt.eq 1$. Put
  $ v_0 = frac(Z q_(frak(a)'_(frak(f))) q_(frak(n)')^3 C, D^2 q_(frak(f))^2) \, #h(2em) x = log \( q_(frak(c)') \/ C \) - 2 log \( q_(frak(d)) \/ D \) . $
  Then $x in \[ - 2 log 2 \, log 2 \]$, and the profile in (6.26) is $Phi_(upsilon \, kappa) \( v_0 e^x \)$. Choose a fixed $phi in C_c^oo \( bb(R) \)$ equal to one on that interval and set $g_(v_0) \( x \) = phi \( x \) Phi_(upsilon \, kappa) \( v_0 e^x \)$. Applying (5.19) with this cutoff gives
  #[#set math.equation(numbering: n => "(6.42)")
   $ integral_(bb(R)) \| hat(g)_(v_0) \( tau \) \| thin thin upright(d) tau lt.double_N min \( v_0^alpha \, v_0^(- N) \) lt.double_N 1 . $ <eq:reflection-Fourier-separation>]
  Fourier inversion now separates the norm factors as $\( q_(frak(c)') \/ C \)^(i tau) \( q_(frak(d)) \/ D \)^(- 2 i tau)$ with the bounded integral cost in (6.42). The retained indicator $upright(bold(1))_(q_(frak(a)'_(frak(f))) q_(frak(c)') q_(frak(n)')^3 lt.eq R_0)$ is a column coefficient after the two frozen ideals are fixed.
  Use Minkowski’s inequality for this Fourier integral and apply 21 to each $tau$. Separate row factors have modulus at most one, and the column square mass is
  $ sum_(C lt.eq q_(frak(c)') < 2 C) q_(frak(c)')^(- 1) lt.double_F 1 $
  by ideal counting. For any $delta_2 > 0$, the row $ell^2$ norm of this one column dyad, before the factor $beta_(frak(f)) \( frak(a)'_(frak(f)) \) \/ q_(frak(n)')$, is therefore at most
  #[#set math.equation(numbering: n => "(6.43)")
   $ lt.double_(N \, delta_2) \( D + C \)^(1 \/ 2) \( D C \)^(delta_2 \/ 2) min \( v_0^alpha \, v_0^(- N) \) . $ <eq:reflection-one-column-dyad>]
  The restrictions $\( frak(d) \, frak(h) frak(n)' \) = 1$ merely delete rows. The zero extension of the symbol already treats shared row and column primes, so no joint restriction was removed in applying the sieve.
  For the retained range, $C lt.eq R_0$ and $q_(frak(n)') lt.eq R_0^(1 \/ 3)$. There are $O \( log \( 2 R_0 \) \)$ such column dyads, and partial summation of the fixed-field ideal count gives
  $ sum_(q_(frak(n)') lt.eq R_0^(1 \/ 3)) q_(frak(n)')^(- 1) lt.double_F log \( 2 R_0 \) . $
  Drop the final minimum in (6.43) and use Minkowski successively for the column dyads, $frak(n)'$, and $frak(a)'_(frak(f))$. (6.32) at $sigma = 0$ shows that their retained row norm, for fixed $frak(h) \, frak(f) \, upright(bold(s))$, is
  $ lt.double_(delta_2) (product_(frak(p) divides frak(f)) E_(frak(p)) \( 0 \)) log^2 \( 2 R_0 \) \( D + R_0 \)^(1 \/ 2) \( D R_0 \)^(delta_2 \/ 2) . $
  Sum these norms over the admitted $frak(f)$ and the finite $upright(bold(s))$, using (6.40) for the former. Square the resulting estimate for each fixed $frak(h)$, and only then sum the squares over $frak(h)$. Since each row has a unique powerful part, no triangle inequality across different powerful parts is necessary. (6.38) yields
  #[#set math.equation(numbering: n => "(6.44)")
   $ sum_(frak(h) med upright("powerful")\
P lt.eq q_(frak(h)) < 2 P) sum_(D lt.eq q_(frak(d)) < 2 D) \| "Ret"_(frak(h) \, frak(d)) \|^2 lt.double_(delta_1 \, delta_2) P^(1 \/ 2 + 2 delta_1) log^4 \( 2 R_0 \) \( D + R_0 \) \( D R_0 \)^(delta_2) . $ <eq:reflection-retained-mass>]
  All the finite unit and $S$-class choices have only multiplied this by a fixed constant.
  We make the power losses explicit. On the range (6.37),
  $ D + R_0 lt.double Z^delta (D + frac(D^2 P, Z)) \, #h(2em) D R_0 lt.double Z^(3 M_0 - 1 + delta) \, #h(2em) P lt.double Z^(M_0) . $
  For any $delta_3 > 0$, $log^4 \( 2 R_0 \) lt.double_(delta_3) Z^(delta_3)$ because $1 lt.eq R_0 lt.double Z^(2 M_0 - 1 + delta)$. Choose the positive auxiliaries so that
  $ delta + 2 M_0 delta_1 + \( 3 M_0 - 1 + delta \) delta_2 + delta_3 < epsilon.alt . $
  Then (6.44) is bounded by the right side of (4.5). The retained mass is zero for $R_0 < 1$, and (6.41) is smaller than that right side in all cases after $N$ is chosen as above. Adding the two parts and restoring the bounded element multiplicities proves (4.5).
  Finally, for every nonempty dyad, $P gt.eq 1$ and (6.37) give
  $ P^(1 \/ 2) D lt.eq P D lt.double Z^(M_0) lt.eq Z^(2 M_0 - 1) \, #h(2em) P^(1 \/ 2) frac(D^2 P, Z) = frac(\( P D \)^2, Z P^(1 \/ 2)) lt.double Z^(2 M_0 - 1) \, $
  where the first comparison uses $M_0 > 1$. There are only $O \( \( log Z \)^2 \)$ possible dyads. Applying the dyadic estimate with a smaller preliminary loss absorbs this factor and proves (4.6). Multiplying $cal(K)$ by any element of a fixed compact norm-one set only enlarges the fixed compact shape set used in the initial multiplicity bound, which proves the asserted uniformity. ◻
]

== 7 The Poisson probe and its Euler product <sec:poisson>

We insert the theta sum $B_m \( Z \)$ of (4.2) into an additive average. The reflected second moment bounds this average from above. Poisson summation will give a second expression whose principal frequency contains the reciprocal of the target $L$-function. The use of an auxiliary additive polynomial while retaining the unrestricted cube factors follows the method of [23] Part I, §§6–7; the calculation here is over the fixed field $F$ and uses its sextic characters.

Keep the field $F$, the set $S$, the target $eta$, and the allowed generators fixed as in 3. In particular $theta.alt = overline(Lambda) thin overline(G) thin eta$, and every character power is zero on nonunits, including the zeroth power. The scale notation $a \, b \, M_0 \, h_0 \, X \, Y$ is fixed in (4.4). All implied constants in this and the next section may depend on the fixed $F \, S \, eta$ and the fixed weights. Exponents displayed as numerical constants do not have that dependence. An arbitrary positive power loss may always be chosen smaller before an estimate is applied.

=== 7.1 Weights and the estimate from reflection <weights-and-the-estimate-from-reflection>

Choose a nonzero nonnegative function $W_1 in C_c^oo \( \( 0 \, oo \) \)$, and set

$ hat(W)_1 \( w \) = integral_0^oo W_1 \( t \) t^w thin frac(d t, t) . $

Choose a tensor Bruhat–Schwartz function $W_0$ on $F_S$, compactly supported in $F_S^times$, such that

#[#set math.equation(numbering: n => "(7.1)")
 $ hat(W)_0 \( 0 \) = 0 \, #h(2em) M \( 1 \/ 6 \) eq.not 0 \, #h(2em) M \( z \) = integral_(F_S^times) hat(W)_0 \( y \) \| y \|_S^z thin d^times y . $ <eq:poisson-Fourier-weight>]

The condition $hat(W)_0 \( 0 \) = 0$ will remove the zero additive frequency after Poisson summation. The condition $M \( 1 \/ 6 \) eq.not 0$ will ensure that the weight does not kill the residue at $z = 1 \/ 6$ in that expansion. These are separate from the support condition on $W_0$, which removes the original row $m = 0$ from the probe. Here the Fourier sign is the one fixed in 3. We explain the choice and the analytic properties that will be needed. At each place the local zeta functional equation gives, for $0 < s < 1$,

$ integral_(F_v^times) hat(W)_v \( y \) \| y \|_v^s thin d^times y = c_v \( s \) integral_(F_v^times) W_v \( y \) \| y \|_v^(1 - s) thin d^times y \, #h(2em) c_v \( 1 \/ 6 \) eq.not 0 \; $

the nonzero constant incorporates the chosen local measures and Fourier sign [27] Theorem 2.4.1. At one complex place take a smooth annular function whose additive integral is zero but whose pairing with $\| y \|_v^(5 \/ 6) d^times y$ is nonzero. Such a function is obtained by subtracting suitable multiples of two smooth bumps supported in different radial subannuli: the additive integral is a constant multiple of the pairing with $\| y \|_v d^times y$, and the two radial weights are not proportional. At all other places take nonnegative nonzero annular functions. The local identity then proves both requirements in (7.1).

For every $sigma > 0$, each local integral of $\| hat(W)_v \( y \) \| \| y \|_v^sigma$ is finite. At a finite place this follows by summing the geometric series of shells near zero and using compact support at infinity; at a complex place it follows from boundedness at zero and Schwartz decay at infinity. The same assertions hold after any number of derivatives in a complex logarithmic norm. Thus $M$ is holomorphic for $"Re" z > 0$, and integration by parts in that norm gives, for every compact interval $J subset \( 0 \, oo \)$ and every $A > 0$,

#[#set math.equation(numbering: n => "(7.2)")
 $ \| M \( sigma + i tau \) \| lt.double_(J \, A) \( 1 + \| tau \| \)^(- A) quad \( sigma in J \) . $ <eq:poisson-M-decay>]

The analogous estimate holds for $hat(W)_1$ on every fixed real strip.

For an exterior ideal $frak(s)$, with an allowed generator $s$, put

$ g_(frak(s)) \( k \) = sum_(d med mod med frak(s)) chi_(frak(s)) \( d \) upright(e) \( k d \/ s \) . $

The value is independent of the allowed generator: a change by $epsilon.alt^6$, $epsilon.alt in U_S$, is absorbed by the same change of the residue variable. Use product multiplicative Haar measures for which the norm decomposition of $F_S^times$ has the form

$ d^times y = frac(d T, T) thin d t \, #h(2em) y = t ell_T \, quad t in F_S^1 . $

The measure on $F_S^1 \/ U_S^6$ below is the quotient measure induced by $d t$. This choice also fixes the normalization in $M$. Define

#[#set math.equation(numbering: n => "(7.3)")
 $ I \( X \, Y \, Z \) = integral_(F_S^1 \/ U_S^6) 1 / Y sum_(frak(s)) W_1 \( q_(frak(s)) \/ Y \) 1 / sqrt(q_(frak(s)) X) sum_(m in R) q_(frak(s))^(- 1 \/ 2) g_(frak(s)) \( - m \) W_0 #h(-0.16667em) (frac(m, t_0 ell_(q_(frak(s)) X))) B_m \( Z \) thin d t_0 . $ <eq:poisson-probe>]

All undecorated ideal sums in this section are over nonzero integral exterior ideals. The summand for $m = 0$ vanishes because $W_0$ is supported in $F_S^times$. For $epsilon.alt in U_S^6$, $chi_(frak(A)) \( epsilon.alt \) = chi_(frak(s)) \( epsilon.alt \) = 1$; changing $m$ to $epsilon.alt m$ shows that the integrand descends to the quotient. That quotient is compact by 9, and we use representatives in a fixed bounded subset of $F_S^1$. For each such representative the $m$-sum has finite support. The Gaussian weight in $B_m$ makes its ideal sum absolutely convergent.

We first record the additive estimate in the form also used later for conductor characters. If $frak(s) = R$, its one residue class is understood to give the single fraction $0$.

#prodef([Lemma 7.1.])[
  (Separated additive fractions).  #emph[Let $K$ be a fixed compact subset of $F_S$, and let $N \, V gt.eq 2$. Choose balanced generators $s$ for the exterior ideals with $q_(frak(s)) lt.eq V$. Let $cal(P)$ be any subset of the distinct points 
$ {d / s + R : q_(frak(s)) lt.eq V \, med d in \( R \/ frak(s) \)^times} subset F_S \/ R . $

 For any complex $b_alpha$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(m in R ∩ ell_N K) lr(|sum_(alpha in cal(P)) b_alpha upright(e) \( m alpha \)|)^2 lt.double_(F \, S \, K) \( N + V^2 \) sum_(alpha in cal(P)) \| b_alpha \|^2 . $ <eq:additive-sieve>]

 The dual inequality, with the sums over $m$ and $alpha$ interchanged, has the same constant.]
] <lem:additive-sieve>

#proof[
  Reduced fractions with distinct denominator ideals are distinct modulo $R$. Indeed, at a prime dividing its denominator the valuation of a reduced fraction is the negative of the denominator valuation; at any other exterior prime it is nonnegative. If the denominator valuations differ, their difference therefore has negative valuation there. If all agree, congruence modulo $R$ says the residue classes agree. For distinct fractions and any $r in R$, the numerator in
  $ d / s - d' / s' + r = frac(d s' - d' s + r s s', s s') $
  is a nonzero element of $R$. The norm identity of 8 gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ lr(|d / s - d' / s' + r|)_S gt.eq \( q_(frak(s)) q_(frak(s)') \)^(- 1) gt.eq V^(- 2) . $ <eq:additive-separation>]
  For $r in R \\ { 0 }$ it also gives $\| r \|_S gt.eq 1$.
  Put $d_F = \[ F : bb(Q) \]$ and $delta = c min \( N^(- 1 \/ d_F) \, V^(- 2 \/ d_F) \)$, with $c > 0$ fixed sufficiently small. There is a nonnegative Bruhat–Schwartz function $Phi$ which is at least one on $ell_N K$, has $hat(Phi) \( 0 \) lt.double delta^(- d_F)$, and whose Fourier transform is supported in a product of fixed finite-place additive subgroups and complex disks of ordinary radius $C delta$. Here is a direct construction. At each complex place take the inverse transform of a smooth bump supported in a disk, evaluated at $delta y_v$. Its value stays bounded below when $delta \| y_v \|$ is sufficiently small. At finite places use the inverse transform of the indicator of a sufficiently small compact open subgroup, whose annihilator contains the finite projection of $K$. The product, multiplied by a fixed constant and squared in modulus, majorizes the box. Fourier support follows from convolution, and a change of scale gives integral $O \( delta^(- d_F) \)$. Shrinking $c$ makes this support contain no translate by $R$ of a difference of distinct points in $cal(P)$, by (7.5): the product of the complex squared absolute values on that support is $O \( delta^(d_F) \)$, and its finite-place product is bounded by a fixed constant. It contains no nonzero point of $R$ for the same reason.
  Expand the square after majorizing it by $Phi$, and apply Poisson summation on $R$. For $alpha \, beta in cal(P)$,
  $ sum_(m in R) Phi \( m \) upright(e) \( m \( alpha - beta \) \) = sum_(r in R) hat(Phi) \( r - alpha + beta \) = upright(bold(1))_(alpha = beta) hat(Phi) \( 0 \) . $
  Since $delta^(- d_F) lt.double N + V^2$, this proves (7.4). Equality of the operator norms of a finite matrix and its adjoint gives the dual assertion. ◻
]

#prodef([Proposition 7.2.])[
  #emph[For the weights above, for every $epsilon.alt > 0$ and $Z gt.eq 2$, 
#[#set math.equation(numbering: n => "(7.6)")
 $ I \( Z^a \, Z^b \, Z \) lt.double_(F \, S \, eta \, W_0 \, W_1 \, epsilon.alt) Z^(\( 2 M_0 - 1 - b \) \/ 2 + epsilon.alt) = Z^(933 \/ 2000 + epsilon.alt) . $ <eq:probe-low>]

]
] <prop:probe-low>

#proof[
  Write $v = q_(frak(s)) \/ Y$ and $y = m \/ \( t_0 ell_(X Y) \)$. For $v$ in the support of $W_1$, the support of $W_0 \( y \/ ell_v \)$ puts $y$ in one fixed compact annular set. On this set the smooth function
  $ v^(- 1 \/ 2) W_1 \( v \) W_0 \( y \/ ell_v \) $
  has a Fourier series in $log v$ whose coefficients $c_j \( y \)$ satisfy $sum_j parallel c_j parallel_oo < oo$, uniformly in $y$. To see this, take a compact interval containing the logarithmic support, extend by zero to a slightly larger period, and integrate twice by parts. All the required derivatives are bounded uniformly on the compact $y$-set. Thus we can separate this weight from the additive sums with a bounded total coefficient cost.
  For each Fourier term, expansion of $g_(frak(s))$ gives a coefficient of modulus $Y^(- 1) q_(frak(s))^(- 1 \/ 2)$ at each reduced fraction $d \/ s$, with $q_(frak(s)) asymp Y$. Their total squared mass is at most
  $ Y^(- 2) sum_(q_(frak(s)) asymp Y) q_(frak(s))^(- 1) \| \( R \/ frak(s) \)^times \| lt.double_F Y^(- 1) \, $
  using the fixed-field ideal count. Take $N = X Y$ and $V lt.double Y$ in 22. The bounded set of representatives $t_0$ only enlarges the fixed compact row box. By the triangle inequality for the Fourier series, the squared $ell^2$ norm in $m$ of the whole additive factor in (7.3), including $\( q_(frak(s)) X \)^(- 1 \/ 2)$, is
  $ lt.double \( X Y \)^(- 1) frac(X Y + Y^2, Y) lt.double Y^(- 1) . $
  The last inequality uses $b < a$. On the same enlarged compact annular row box, 12 gives
  $ sum_m \| B_m \( Z \) \|^2 lt.double_epsilon.alt Z^(2 M_0 - 1 + epsilon.alt) . $
  Cauchy–Schwarz in $m$, followed by integration over the compact quotient, proves (7.6), after decreasing the preliminary loss. ◻
]

=== 7.2 Poisson summation and three Mellin variables <poisson-summation-and-three-mellin-variables>

For an exterior ideal $frak(A)$ with allowed generator $A$, write

$ g_(chi_(frak(A))) \( A \, k \) = sum_(v med mod med frak(A)) chi_(frak(A)) \( v \) upright(e) \( k v \/ A \) $

and, for $h in R$, define

#[#set math.equation(numbering: n => "(7.7)")
 $ F \( s \, A \, h \) = sum_(d med mod med frak(s)\
h equiv A d med \( mod med frak(s) \)) chi_(frak(s)) \( d \) thin g_(chi_(frak(A))) #h(-0.16667em) (A \, frac(h - A d, s)) . $ <eq:finite-Poisson-factor>]

The argument of the last Gauss sum is in $R$ by the congruence. The definitions for the unit ideal mean a single residue and the value $1$ for its character.

The finite Fourier transform of the row coefficient modulo $frak(s) frak(A) = s A R$ is exactly

#[#set math.equation(numbering: n => "(7.8)")
 $ sum_(m med mod med frak(s) frak(A)) q_(frak(s))^(- 1 \/ 2) g_(frak(s)) \( - m \) chi_(frak(A)) \( m \) upright(e) \( h m \/ \( s A \) \) = q_(frak(s))^(1 \/ 2) F \( s \, A \, h \) . $ <eq:finite-Poisson-transform>]

In fact expand $g_(frak(s))$, write $m = v + A j$ with $v med mod med frak(A)$ and $j med mod med frak(s)$, and sum over $j$. The sum of $upright(e) \( \( h - A d \) j \/ s \)$ is $q_(frak(s))$ precisely when $h equiv A d med \( mod med frak(s) \)$, and is zero otherwise. The remaining sum over $v$ is the one in (7.7). This argument does not require $frak(s)$ and $frak(A)$ to be coprime.

The dilation $t_0 ell_(q_(frak(s)) X)$ has additive modulus $q_(frak(s)) X$, and the lattice $s A R$ has index $q_(frak(s)) q_(frak(A))$. Apply Poisson summation to the $m$-sum and use (7.8). Its dilation divided by the index is $X \/ q_(frak(A))$; after the two square root factors in the probe the multiplier is

$ \( q_(frak(s)) X \)^(- 1 \/ 2) X / q_(frak(A)) q_(frak(s))^(1 \/ 2) = X^(1 \/ 2) / q_(frak(A)) . $

The Fourier argument at $h$ is

$ t_0 ell_(q_(frak(s)) X) frac(h, s A) \, #h(2em) lr(|ell_(q_(frak(s)) X) frac(h, s A)|)_S = frac(X q_h, q_(frak(A))) . $

These norm factors will determine all three Mellin exponents.

For $epsilon.alt in U_S^6$, changing $d$ to $epsilon.alt d$ and the Gauss residue variable $v$ to $epsilon.alt^(- 1) v$ in (7.7) shows $F \( s \, A \, epsilon.alt h \) = F \( s \, A \, h \)$. Sum the nonzero $h$’s in such orbits and unfold the quotient $F_S^1 \/ U_S^6$. If

$ V_0 \( T \) = integral_(F_S^1) hat(W)_0 \( t ell_T \) thin d t \, $

the orbit of $h$ contributes $F \( s \, A \, h \) V_0 \( X q_h \/ q_(frak(A)) \)$. Multiplication by the norm-one part of $ell_(q_(frak(s)) X) h \/ \( s A \)$ preserves the sheet measure, so no shape factor remains. This unfolding is absolutely justified: for each $sigma > 0$, the local integrability used above gives an absolute sheet majorant $O_sigma \( T^(- sigma) \)$, by using one complex weighted supremum and the other weighted local integrals. Taking $sigma > 1$ sums the $q_u^(- sigma) q_(frak(r))^(- 6 sigma)$ majorant, while the Gaussian handles the ideal $frak(A)$; this permits Tonelli’s theorem in the orbit sum. The zero frequency contributes nothing because $hat(W)_0 \( 0 \) = 0$.

By the measure disintegration, the Mellin transform of $V_0$ is $M$. The same weighted derivative majorants in the complex norm variables justify differentiation of the sheet integral in $log T$, so $V_0 \( T \)$ is smooth for $T > 0$. Its absolute weighted integrability and (7.2) then give pointwise Mellin inversion by Fourier inversion in $log T$ on each line $"Re" z > 0$. By (3.7), write the orbits uniquely as $h = u r^6$, where $u in cal(U)$ and $frak(r)$ is an exterior ideal with allowed generator $r$. The principal row $u = 1$ consists of the surviving nonzero sixth-power frequencies $h = r^6$. Hence the precise Poisson expression is

#[#set math.equation(numbering: n => "(7.9)")
 $ I \( X \, Y \, Z \) =  & X^(1 \/ 2) / Y sum_(frak(c) med upright("squarefree")\
frak(n) \, frak(s)) frac(gamma_2 \( frak(c) \) theta.alt \( frak(A) \), q_(frak(c))^(1 \/ 2) q_(frak(n)) q_(frak(A))) thin P_G \( q_(frak(A)) \/ Z \) W_1 \( q_(frak(s)) \/ Y \)\
 &  times sum_(u in cal(U)) sum_(frak(r)) F \( s \, A \, u r^6 \) V_0 #h(-0.16667em) (frac(X q_u q_(frak(r))^6, q_(frak(A)))) \, #h(2em) frak(A) = frak(c) frak(n)^3 . $ <eq:Poisson-orbits>]

Here $P_G$ is the Gaussian of (4.1).

Use Mellin inversion for $P_G \, W_1 \, V_0$, with transforms $e^(t^2) \, hat(W)_1 \( w \) \, M \( z \)$, respectively. The factors involving $frak(A)$ are $q_(frak(A))^(- 1) q_(frak(A))^(- t) q_(frak(A))^z$. Set $t = xi + z - 1$. We obtain

#[#set math.equation(numbering: n => "(7.10)")
 $ I \( X \, Y \, Z \) = frac(1, \( 2 pi i \)^3) integral_(\( 4 \)) integral_(\( 4 \)) integral_(\( 2 \)) & X^(1 \/ 2 - z) Z^(xi + z - 1) Y^(w - 1) e^(\( xi + z - 1 \)^2) M \( z \) hat(W)_1 \( w \)\
 &  times sum_(u in cal(U)) q_u^(- z) cal(F)_u \( xi \, w \, z \) thin d z thin d w thin d xi \, $ <eq:poisson-mellin>]

where the innermost line is $"Re" z = 2$, the middle line is $"Re" w = 4$, and the outer line is $"Re" xi = 4$, and

#[#set math.equation(numbering: n => "(7.11)")
 $ cal(F)_u \( xi \, w \, z \) = sum_(frak(c) med upright("squarefree")\
frak(n) \, frak(s) \, frak(r)) gamma_2 \( frak(c) \) theta.alt \( frak(A) \) F \( s \, A \, u r^6 \) q_(frak(c))^(- 1 \/ 2 - xi) q_(frak(n))^(- 1 - 3 xi) q_(frak(s))^(- w) q_(frak(r))^(- 6 z) \, #h(2em) frak(A) = frak(c) frak(n)^3 . $ <eq:calF-definition>]

All interchanges used for (7.10) are in absolute convergence. For example, $\| F \( s \, A \, h \) \| lt.eq q_(frak(s)) q_(frak(A))$, $\| gamma_2 \( frak(c) \) \| = 1$, and the ideal count, including the finitely many S-unit classes for $u$, give absolute convergence on these lines. The factors $M \( z \)$ and $hat(W)_1 \( w \)$ have arbitrary vertical polynomial decay, while the Gaussian has Gaussian decay in $"Im" \( xi + z \)$. Changing height variables to $\( "Im" \( xi + z \) \, "Im" z \, "Im" w \)$ proves absolute integrability as well.

=== 7.3 The local correction <the-local-correction>

We extend the notation $L^S \( s \, eta \)$ from 4 to a Hecke character on exterior primes: the factors at $S$ are omitted, and any additional zero prime values are retained in the Euler product. Thus, for example,

$ L^S \( w \, chi_bullet \( u \) \) = product_(frak(p) in.not S) \( 1 - chi_(frak(p)) \( u \) q_(frak(p))^(- w) \)^(- 1) quad \( "Re" w > 1 \) . $

As before, $zeta_F^S \( s \) = product_(frak(p) in.not S) \( 1 - q_(frak(p))^(- s) \)^(- 1)$.

#prodef([Proposition 7.3.])[
  #emph[For every $u in cal(U)$, the series in (7.11) has the Euler factorization 
#[#set math.equation(numbering: n => "(7.12)")
 $ cal(F)_u \( xi \, w \, z \) = frac(zeta_F^S \( 6 z \) L^S \( w \, chi_bullet \( u \) \), L^S \( xi \, eta overline(chi_bullet \( u \)) \)) cal(H)_u \( xi \, w \, z \) $ <eq:probe-euler-product>]

 initially in absolute convergence. The correction $cal(H)_u$ is holomorphic in open neighborhoods of both real-part regions 
#[#set math.equation(numbering: n => "(7.13)")
 $ "Re" xi gt.eq .998 \, & "Re" w gt.eq .003 \, & "Re" z gt.eq .4 \,\
"Re" xi gt.eq .998 \, & "Re" w gt.eq .95 \, & "Re" z gt.eq .16 . $ <eq:euler-regions>]

 For every $epsilon.alt > 0$ it satisfies 
$ \| cal(H)_u \( xi \, w \, z \) \| lt.double_(F \, S \, eta \, epsilon.alt) q_u^epsilon.alt $

 there, uniformly in all heights. If $S$ contains every prime of norm at most a sufficiently large fixed constant, then $cal(H)_1$ is bounded and nowhere zero on both neighborhoods.]
] <prop:euler-product>

The two regions serve different contour movements in the next section. The first permits the small and intermediate nonprincipal rows to place $w$ at $.003$ and $z$ at $.4$, while $xi$ can reach $.998$ once the reciprocal denominator has been controlled. The second contains the principal numerator poles $w = 1$, $z = 1 \/ 6$ and the nearby lines $w = .95$, $z = .16$ used to isolate their double residue. The nowhere-zero conclusion for $u = 1$ will ensure that its correction does not cancel a singularity of $1 \/ L^S \( xi \, eta \)$.

#proof[
  We first factor the finite expression, keeping the units that Chinese remaindering introduces. Use products of allowed prime generators for $s \, A \, r$. They differ from any other allowed choices by sixth powers of S-units, which have no effect on the expressions. At an exterior prime $frak(p)$, with generator $p$ and norm $Q = q_(frak(p))$, write
  $ t = v_(frak(p)) \( frak(A) \) = e_0 + 3 l \, quad e_0 = v_(frak(p)) \( frak(c) \) in { 0 \, 1 } \, quad l = v_(frak(p)) \( frak(n) \) \, quad k = v_(frak(p)) \( frak(s) \) \,\
j = v_(frak(p)) \( u \) \, quad m' = v_(frak(p)) \( frak(r) \) \, quad J = j + 6 m' . $
  Write $s = p^k s_p$, $A = p^t A_p$, and $u r^6 = p^J h_p$; the subscripts mean that the full $p$-power has been omitted. These three subscripted quantities are units at $frak(p)$. Put $psi_(frak(p))^compose \( x \) = psi_(frak(p)) \( - x \)$. For $x in F$, the global additive product gives $upright(e) \( x \) = product_(frak(p) in.not S) psi_(frak(p))^compose \( x \)$, with only finitely many nontrivial factors. Expand the inner Gauss sum in (7.7) and apply the Chinese remainder decomposition to each residue ring. Before changing variables, the local factor of $F \( s \, A \, u r^6 \)$ is
  $ sum_(d med mod med p^k\
p^J h_p equiv p^t A_p d med \( mod med p^k \)) chi_(frak(p)) \( d \)^k sum_(v med mod med p^t) chi_(frak(p)) \( v \)^t psi_(frak(p))^compose #h(-0.16667em) (frac(\( p^J h_p - p^t A_p d \) v, p^(k + t) s_p A_p)) . $
  Here an absent modulus $p^0$ has one residue and character value $1$. For a positive modulus the character retains its unit mask, even when its exponent is divisible by six. Now make the changes
  $ d = \( h_p \/ A_p \) d' \, #h(2em) v = \( s_p A_p \/ h_p \) v' . $
  They are bijections of the relevant residue rings. The congruence becomes $p^J equiv p^t d' med \( mod med p^k \)$, and the local additive argument becomes $\( p^J - p^t d' \) v' \/ p^(k + t)$. The unit multiplier removed by these changes is exactly
  #[#set math.equation(numbering: n => "(7.14)")
   $ chi_(frak(p)) \( h_p \)^(k - t) chi_(frak(p)) \( s_p \)^t chi_(frak(p)) \( A_p \)^(t - k) . $ <eq:Euler-CRT-unit>]
  There are no hidden coprimality assumptions here: these changes only use the units left after omitting the full $p$-powers. Moreover $chi_(frak(p)) \( h_p \) = chi_(frak(p)) \( u \/ p^j \)$, because the remaining factors of $r^6$ are sixth powers.
  For completeness define the stripped local sum by
  #[#set math.equation(numbering: n => "(7.15)")
   $ C_(t \, k) \( J \) = sum_(d med mod med p^k\
p^J equiv p^t d med \( mod med p^k \)) chi_(frak(p)) \( d \)^k sum_(v med mod med p^t) chi_(frak(p)) \( v \)^t psi_(frak(p))^compose (frac(\( p^J - p^t d \) v, p^(k + t))) . $ <eq:C-local-definition>]
  When $k = 0$ the outer modulus is one, its character is one, and its single residue may be taken to be zero. The analogous convention applies to $t = 0$ in the inner sum. When $k > 0$ or $t > 0$, the corresponding character is supported on units even if its exponent is divisible by six. These conventions distinguish the absent modulus from the zeroth power character on a nontrivial modulus.
  We check explicitly that the remaining factors in different primes separate. Expand (7.14) using the product generators, and consider an unordered pair of distinct primes $frak(p) \, frak(p)'$. In their common symbol $chi_(frak(p)) \( p' \) = chi_(frak(p)') \( p \)$, the contributions from $chi_(frak(p)) \( s_p \)^t$ and $chi_(frak(p)) \( A_p \)^(t - k)$, together with the analogous factors at $frak(p)'$, have exponent
  $ t k' + t' k + \( t - k \) t' + \( t' - k' \) t = 2 t t' . $
  In particular all $s$-$A$ interactions cancel. By (3.10), the Chinese remainder factors in $gamma_2 \( frak(c) \)$ add $4 e_0 e'_0$. Their total is
  $ 2 \( e_0 + 3 l \) \( e'_0 + 3 l' \) + 4 e_0 e'_0 equiv 0 med \( mod med 6 \) . $
  Thus all cross-prime terms cancel, including when both moduli have powers of the same primes; those shared powers were retained inside (7.15). The $h_p$-factors remain precisely as characters of $u \/ p^j$. If $theta_(frak(p)) = chi_(frak(p)) \( u \/ p^j \) in mu_6$, the exact local factor is consequently
  #[#set math.equation(numbering: n => "(7.16)")
   $ cal(F)_(u \, frak(p)) \( xi \, w \, z \) = sum_(e_0 = 0 \, 1\
l \, k \, m' gt.eq 0) & gamma_2 \( frak(p) \)^(e_0) theta.alt \( frak(p) \)^(e_0 + 3 l) theta_(frak(p))^(thin k - e_0 - 3 l) C_(e_0 + 3 l \, k) \( j + 6 m' \)\
 &  times Q^(- e_0 \( 1 \/ 2 + xi \) - l \( 1 + 3 xi \) - k w - 6 m' z) . $ <eq:exact-Euler-factor>]
  It follows initially by absolute convergence that $cal(F)_u = product_(frak(p) in.not S) cal(F)_(u \, frak(p))$.
  Here are explicit evaluations of every $C_(t \, k) \( J \)$. Put
  $ T_v \( y \) = sum_(x med mod med p) chi_(frak(p)) \( x \)^v psi_(frak(p))^compose \( y x \/ p \) \, #h(2em) tau_v = T_v \( 1 \) . $
  The unit mask is retained for $v equiv 0 med \( mod med 6 \)$. Thus
  $ T_v \( y \) = cases(delim: "{", overline(chi_(frak(p)) \( y \))^(thin v) tau_v \, & p divides.not y \,, Q - 1 \, & p divides y \, med v equiv 0 med \( mod med 6 \) \,, 0 \, & p divides y \, med v equiv.not 0 med \( mod med 6 \) \,) #h(2em) \| tau_v \| = sqrt(Q) med \( v equiv.not 0 #h(-0.16667em) #h(-0.16667em) med \( mod med 6 \) \) \, quad tau_0 = - 1 . $
  For $t = 0$ the value is $C_(0 \, 0) \( J \) = 1$, and $C_(0 \, k) \( J \) = upright(bold(1))_(J = 0)$ for $k > 0$. For $t > 0$ it is
  #[#set math.equation(numbering: n => "(7.17)")
   $ C_(t \, 0) \( J \) & = upright(bold(1))_(J gt.eq t - 1) Q^(t - 1) T_t \( p^(J - t + 1) \) \,\
C_(t \, 1) \( J \) & = upright(bold(1))_(J gt.eq t) tau_1 Q^(t - 1) T_(t - 1) \( p^(J - t) \) \,\
C_(t \, k) \( J \) & = 0 #h(2em) \( k gt.eq 2 \) . $ <eq:C-local-values>]
  For the first formula sum the $Q^(t - 1)$ lifts of a residue $v med mod med p$ in the inner sum; they cancel unless $J gt.eq t - 1$. For $k = 1$ the congruence first requires $J gt.eq 1$. Sum $d med mod med p$ before $v$. Because $v$ is a unit, the sum is $tau_1 overline(chi_(frak(p)) \( v \))$; $chi_(frak(p)) \( - 1 \) = 1$ removes the sign. The remaining sum over lifts of $v$ is zero unless $J gt.eq t$, and then gives the second formula. For $k gt.eq 2$, varying $d$ by $p^(k - 1) lambda$, $lambda med mod med p$, preserves the congruence and its unit character. For every unit $v$ the phase varies by $psi_(frak(p))^compose \( - lambda v \/ p \)$, whose sum in $lambda$ is zero. This proves the last formula. In particular, for $t > 0$,
  #[#set math.equation(numbering: n => "(7.18)")
   $ \| C_(t \, 0) \( J \) \| lt.eq Q^t \, #h(2em) \| C_(t \, 1) \( J \) \| lt.eq Q^(t + 1 \/ 2) \, $ <eq:C-local-bounds>]
  with the support restrictions visible in (7.17).
  Suppose first that $frak(p) divides.not \( u \) R$, so $j = 0$. Set
  $ V = Q^(- 6 z) \, quad W = chi_(frak(p)) \( u \) Q^(- w) \, quad D_1 = eta \( frak(p) \) overline(chi_(frak(p)) \( u \)) Q^(- xi) \, quad E_1 = theta.alt \( frak(p) \)^6 Q^(4 - 6 xi) V . $
  The $t = 0$ values give $\( 1 - V \)^(- 1) + W \/ \( 1 - W \)$: a positive $k$ requires $J = 0$. The first squarefree theta term has $e_0 = 1$, $l = k = m' = 0$, hence $t = 1$, $J = 0$, and $C_(1 \, 0) \( 0 \) = tau_1$. Its contribution is
  $ & gamma_2 \( frak(p) \) theta.alt \( frak(p) \) overline(chi_(frak(p)) \( u \)) Q^(- 1 \/ 2 - xi) tau_1\
 & #h(2em) = gamma_1 \( frak(p) \) gamma_2 \( frak(p) \) theta.alt \( frak(p) \) overline(chi_(frak(p)) \( u \)) Q^(- xi) = - D_1 . $
  Indeed $tau_1 = sqrt(Q) thin gamma_1 \( frak(p) \)$ in the chosen additive sign, and (3.9) gives $gamma_1 gamma_2 theta.alt = - eta$. This negative term is the first nonconstant term of the reciprocal local $L$-factor $1 - D_1$; it is the reason that $L^S \( xi \, eta overline(chi_bullet \( u \)) \)$ occurs in the denominator of (7.12). We extract $\( 1 - V \)^(- 1) \( 1 - W \)^(- 1) \( 1 - D_1 \)$, whose first two factors are those of $zeta_F^S \( 6 z \)$ and $L^S \( w \, chi_bullet \( u \) \)$. The mixed terms and the higher theta terms will be included in the correction.
  For $t > 0$ and $J = 6 m'$, the formulas show that only $t equiv 0 \, 1 med \( mod med 6 \)$ occur. For $t = 6 d$, $d gt.eq 1$, the $k = 0$ sum is
  $ E_1^d frac(1 - Q^(- 1), 1 - V) \, $
  and the $k = 1$ term is $E_1^d W$. For the latter, the only possible valuation is $J = t$, and $tau_1 tau_5 = Q$. For $t = 6 d + 1$, $d gt.eq 0$, the $k = 0$ term is $- D_1 E_1^d$, extending the first squarefree term just computed. Finally its $k = 1$ sum is
  $ - \( Q - 1 \) D_1 E_1^d thin frac(W V, 1 - V) . $
  Here $J > t$ and $T_0 \( p^(J - t) \) = Q - 1$; the first possible extra $m'$ gives the displayed $V$. Summing in $d$ proves the closed formula
  #[#set math.equation(numbering: n => "(7.19)")
   $ cal(F)_(u \, frak(p)) =  & frac(1, 1 - V) + frac(W, 1 - W) + frac(E_1, 1 - E_1) (frac(1 - Q^(- 1), 1 - V) + W)\
 & - frac(D_1, 1 - E_1) (1 + frac(\( Q - 1 \) W V, 1 - V)) . $ <eq:Euler-good-exact>]
  This derivation also explains the vanishing of the allowed theta exponents $t equiv 3 \, 4 med \( mod med 6 \)$: the possible boundary values of $J$ in (7.17) have the wrong residue modulo six, and the remaining $T$-sum is a nontrivial character sum at zero.
  Define at every prime
  $ cal(H)_(u \, frak(p)) = \( 1 - V \) frac(1 - W, 1 - D_1) cal(F)_(u \, frak(p)) \, $
  where $W = D_1 = 0$ at $frak(p) divides \( u \) R$, in accordance with the zero extension. We verify normal convergence on explicit open neighborhoods: in each line of (7.13) decrease all three lower endpoints by $10^(- 5)$, and use the resulting strict inequalities. On these neighborhoods all of $V \, W \, D_1 \, E_1$ have modulus bounded away from one once $Q$ exceeds a fixed constant. Subtracting $1$ after multiplying (7.19) by $\( 1 - V \) \( 1 - W \) \/ \( 1 - D_1 \)$ gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ \| cal(H)_(u \, frak(p)) - 1 \| lt.double \| V W \| + \| D_1 V \| + \| D_1 W \| + Q \| D_1 W V \| + \| E_1 \| lt.double Q^(- 1 - delta) \, #h(2em) delta = 1 / 4000 \, $ <eq:Euler-good-error>]
  uniformly for $frak(p) divides.not \( u \) R$. For clarity, before the $10^(- 5)$ enlargement the weakest of the first three terms is $\| D_1 W \| lt.eq Q^(- 1.001)$, in the first region. The exponents in the last two terms are at most
  $ 1 - "Re" xi - "Re" w - 6 "Re" z lt.eq - 1.908 \, #h(2em) 4 - 6 "Re" xi - 6 "Re" z lt.eq - 2.948 $
  on the union of the two regions. The enlargement leaves respectively the margins $0.00098$, $0.90792$, and $1.94788$ beyond exponent $- 1$, which suffice for the stated $delta$. More explicitly, the specialization at $E_1 = 0$ satisfies
  $ cal(H)_(u \, frak(p))\|_(E_1 = 0) - 1 = frac(D_1 \( W + V - W V \) - W V - \( Q - 1 \) D_1 \( 1 - W \) W V, 1 - D_1) . $
  This accounts for the $Q \| D_1 W V \|$ term as well as the first three terms in (7.20). The difference from this specialization is $O \( \| E_1 \| \)$ on the stated neighborhoods: the remaining denominators are bounded, and $Q \| D_1 W V \| < 1$ once $Q$ exceeds the fixed cutoff.
  At $frak(p) divides \( u \) R$, $1 lt.eq j lt.eq 5$. The $t = 0$ contribution is $\( 1 - V \)^(- 1)$. The term $t = 1 \, k = 0$ vanishes, since $J gt.eq 1$ and $T_1 \( p^J \) = 0$. By (7.18), the sum for $t = 1 \, k = 1$ has modulus at most
  $ frac(Q^(1 - "Re" xi - "Re" w), 1 - \| V \|) . $
  Its exponent is at most $- 0.001$ on the first region and at most $- 0.948$ on the second. For $l gt.eq 1$, before the factor $V^(m')$, the bound for the summand with $e_0 in { 0 \, 1 }$ is at most a constant times $Q$ to the power
  #[#set math.equation(numbering: n => "(7.21)")
   $ \( 2 - 3 "Re" xi \) l + \( 1 \/ 2 - "Re" xi \) e_0 + max \( 0 \, 1 \/ 2 - "Re" w \) . $ <eq:Euler-bad-exponents>]
  This is at most $- 0.497$ for $l = 1 \, e_0 = 0$ on the first region and decreases by at least $0.994$ for each further $l$; the second region has a larger saving. The $10^(- 5)$ enlargement still leaves a saving greater than $0.49$ in this sum, and leaves $0.00098$ in the $t = 1 \, k = 1$ term. The geometric sums in $l \, m'$, followed by multiplication by $1 - V$, therefore give
  #[#set math.equation(numbering: n => "(7.22)")
   $ cal(H)_(u \, frak(p)) = 1 + O \( Q^(- delta) \) quad \( frak(p) divides \( u \) R \) \, #h(2em) delta = 1 / 4000 \, $ <eq:Euler-bad-error>]
  on the same neighborhoods. These estimates prove absolute local convergence there as well.
  The product of the factors in (7.20) converges normally, since $sum_(frak(p)) q_(frak(p))^(- 1 - delta) < oo$. The remaining primes are precisely the divisors of $\( u \) R$. For every $epsilon.alt > 0$,
  $ product_(frak(p) divides \( u \) R) \( 1 + C q_(frak(p))^(- delta) \) lt.double_(F \, S \, epsilon.alt) q_u^epsilon.alt : $
  for sufficiently large $Q$ each local factor is at most $Q^epsilon.alt$, and the finitely many smaller primes contribute a fixed constant. Consequently $cal(H)_u = product_(frak(p) in.not S) cal(H)_(u \, frak(p))$ is holomorphic and obeys the asserted bound. Multiplication of its defining local factors gives (7.12) in the initial region and then as a meromorphic identity on either neighborhood.
  For $u = 1$ every prime satisfies (7.20). The local estimate determines a fixed norm cutoff beyond which its uniform bound is smaller than $1 \/ 2$. Choose $S$ to contain all primes up to that cutoff from the outset, as permitted in 3. Every remaining $cal(H)_(1 \, frak(p))$ is nonzero, and its logarithm defined near $1$ has an absolutely and uniformly convergent sum. Its exponential is $cal(H)_1$, which is therefore bounded and nowhere zero on both neighborhoods. This proves the proposition. ◻
]

For the remainder of the proof, write

$ cal(H)_eta \( s \) := cal(H)_1 \( s \, 1 \, 1 \/ 6 \) . $

This is the principal specialization announced in 4. Since $\( w \, z \) = \( 1 \, 1 \/ 6 \)$ lies in the second region of (7.13), $cal(H)_eta$ is holomorphic, bounded, and nowhere zero on an open neighborhood of the closed half-plane $"Re" s gt.eq .998$, uniformly in height.

== 8 Zero detection and Mellin continuation <sec:zero-free>

We now prove 2 for the fixed but arbitrary $F$ and $eta$. The factorization in 24 singles out the frequency $u = 1$: it is the only row whose numerator $L$-function has a pole. We shall bound the other rows by a conductor large sieve, isolate the two residues of that principal row, and compare them with 23. The resulting bound for one Mellin integral will exclude zeros of the target function.

=== 8.1 A conductor large sieve and a zero detector <a-conductor-large-sieve-and-a-zero-detector>

Let $omega_u$ denote the primitive Hecke character inducing $eta overline(chi_bullet \( u \))$. By 10, on a dyad $U lt.eq q_u < 2 U$,

#[#set math.equation(numbering: n => "(8.1)")
 $ upright(N) frak(f)_(omega_u) lt.double_(F \, S \, eta) U \, #h(2em) \# { u in cal(U) : U lt.eq q_u < 2 U } lt.double_(F \, S) U . $ <eq:row-conductor-count>]

The second bound follows from the ideal count and the finite number of S-unit classes modulo sixth powers. The characters $omega_u$ in this family are distinct: equality cancels the fixed twist and forces $u \/ v$ to be a sixth power in $F$; the selected exterior valuations then agree, and the quotient is in $U_S^6$. Their local components at $S$ run through a fixed finite set, since the Kummer part depends on $F_v^times \/ F_v^(times 6)$. The principal numerator occurs only for $u = 1$. The primitive denominator $omega_u$ may be principal for a different row, so it will be treated separately in zero detection.

We give the conductor estimate required for that detection. In the next lemma and in the detector, ideals without the adjective exterior are integral ideals of $cal(O)_F$, and $q_(frak(n)) = upright(N) frak(n)$ also for those ideals.

#prodef([Lemma 8.1.])[
  (Primitive conductor large sieve).  #emph[Fix $C_0 > 0$ and a finite set $cal(L)_S$ of possible local components at $S$. Let $cal(X) \( U \)$ be any family of distinct primitive finite-order Hecke characters of $F$ whose conductor norms are at most $C_0 U$ and whose components at $S$ belong to that set. For $N \, U gt.eq 2$, any complex coefficients $b_(frak(n))$, and every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(8.2)")
 $ sum_(omega in cal(X) \( U \)) lr(|sum_(q_(frak(n)) lt.eq N) b_(frak(n)) omega \( frak(n) \)|)^2 lt.double_(F \, S \, C_0 \, cal(L)_S \, epsilon.alt) \( N + U^2 \) \( N U \)^epsilon.alt sum_(q_(frak(n)) lt.eq N) \| b_(frak(n)) \|^2 . $ <eq:conductor-sieve>]

 As usual a primitive character is extended by zero on ideals meeting its conductor.]
] <lem:conductor-sieve>

#proof[
  First restrict the coefficient ideals to one exterior norm dyad and the characters to one choice of their components at $S$. If $frak(q)$ is the exterior part of the conductor, principality of $R$ and the global character relation write the value at $frak(n) = n R$, for its selected balanced generator $n$, as
  $ omega \( frak(n) \) = lambda_S \( n \) lambda_(frak(q)) \( n \) . $
  Here $lambda_S$ is a common fixed unitary function of the S-components, and $lambda_(frak(q))$ is a primitive residue character modulo $frak(q)$. The orientation of the local characters is absorbed in these two symbols. The formula includes zero on nonunits. It follows directly by evaluating the idele character at the rational element $n$: the unramified exterior components give $omega \( frak(n) \)$, leaving the ramified exterior components and the components in $S$. In particular, for this fixed S-choice the residue character determines $omega$.
  Let $q$ be a balanced generator of $frak(q)$. By 8, $\( n \, d \) mapsto upright(e) \( n d \/ q \)$ is a perfect additive pairing on $R \/ frak(q)$. Put
  $ tau \( overline(lambda_(frak(q))) \) = sum_(d med mod med frak(q)) overline(lambda_(frak(q)) \( d \)) thin upright(e) \( d \/ q \) . $
  For a primitive residue character, this Gauss sum has modulus $q_(frak(q))^(1 \/ 2)$, and
  $ lambda_(frak(q)) \( n \) = frac(1, tau \( overline(lambda_(frak(q))) \)) sum_(d med mod med frak(q)) overline(lambda_(frak(q)) \( d \)) thin upright(e) \( n d \/ q \) . $
  For a unit $n$ this follows by a change of residue variable. For a nonunit the Gauss sum is zero: locally at a prime dividing $n$ the additive character factors through a proper quotient of the conductor, and multiplication by a unit in the kernel of that quotient on which the primitive multiplicative character is nontrivial forces the sum to vanish. Finite additive Parseval now gives
  $ sum_(n med mod med frak(q)) lr(|sum_(d med mod med frak(q)) overline(lambda_(frak(q)) \( d \)) upright(e) \( n d \/ q \)|)^2 = q_(frak(q)) \| \( R \/ frak(q) \)^times \| . $
  The left side is $\| \( R \/ frak(q) \)^times \| thin \| tau \( overline(lambda_(frak(q))) \) \|^2$, which proves the asserted modulus. Put
  $ T_(d \/ q) = sum_(frak(n)) b_(frak(n)) lambda_S \( n \) upright(e) \( n d \/ q \) . $
  Sum the square of the preceding Gauss expansion over the characters of conductor $frak(q)$. Extending that sum to all residue characters and using character orthogonality bounds it by
  $ frac(\| \( R \/ frak(q) \)^times \|, q_(frak(q))) sum_(d in \( R \/ frak(q) \)^times) \| T_(d \/ q) \|^2 lt.eq sum_(d in \( R \/ frak(q) \)^times) \| T_(d \/ q) \|^2 . $
  The same assertion holds for the unit conductor with its single residue. Sum now over $q_(frak(q)) lt.eq C_0 U$. The fractions are distinct reduced fractions. The balanced generators of the coefficient ideals on a norm dyad lie in $ell_(N') K$ for one fixed compact $K$, with $N' lt.eq N$, by 9. The dual assertion of 22, with $V = max \( 2 \, C_0 U \)$, bounds this sum by $\( N + U^2 \) sum \| b_(frak(n)) \|^2$.
  To pass to all exterior lengths at most $N$, split into dyads and use Cauchy–Schwarz, at a logarithmic cost. For general $cal(O)_F$ ideals write $frak(n) = frak(n)_S frak(n)^S$, with the first factor supported in $S_f$. There are $O_S \( \( 1 + log N \)^(\| S_f \|) \)$ possibilities for $frak(n)_S$. Within a fixed S-choice the value $omega \( frak(n)_S \)$ is fixed (or zero). Cauchy–Schwarz over these possibilities and the preceding exterior estimate introduce only powers of $log N$; the square masses over the disjoint pieces sum to the original square mass. The finite partition by S-components costs a constant. Absorbing all logarithms into $\( N U \)^epsilon.alt$ proves (8.2). ◻
]

We use standard Hecke continuation and the functional equation in a deliberately conservative convexity bound. For a nonprincipal primitive finite-order $omega$ with $upright(N) frak(f)_omega lt.double U$, there is an $A_F > 0$, depending on the fixed field, such that on any of the fixed strips below, in particular for $.003 lt.eq sigma lt.eq 4$,

#[#set math.equation(numbering: n => "(8.3)")
 $ \| L_F \( sigma + i t \, omega \) \| lt.double_(F \, S \, eta \, epsilon.alt) U^(1 \/ 2 + epsilon.alt) \( 2 + \| t \| \)^(A_F) . $ <eq:Hecke-conservative-convexity>]

This follows from the functional equation, the absolutely convergent Euler product on a right line, and the Phragmén–Lindelöf principle; the gamma factors contribute the field-dependent height power [27] Main Theorem 4.4.1 and §4.5. The same estimates give polynomial height bounds on any fixed strip for $\( s - 1 \) zeta_F \( s \)$. Omitting factors at a fixed set or at primes dividing $u$ changes a positive-real-part estimate by $q_u^epsilon.alt$: for a fixed $sigma_(*) > 0$, each of

$ product_(frak(p) divides \( u \) R) \( 1 + q_(frak(p))^(- sigma_(*)) \) \, #h(2em) product_(frak(p) divides \( u \) R) \( 1 - q_(frak(p))^(- sigma_(*)) \)^(- 1) $

is $O_(epsilon.alt \, sigma_(*)) \( q_u^epsilon.alt \)$, by bounding a sufficiently large prime’s factor by $q_(frak(p))^epsilon.alt$ and absorbing the finitely many other primes into the constant.

#prodef([Proposition 8.2.])[
  #emph[For the fixed $F \, S \, eta$ there are $rho > 0$ and $U_0$ with the following property. For every $U gt.eq U_0$, there is a set $cal(E) \( U \) subset { u in cal(U) : U lt.eq q_u < 2 U }$ of cardinality 
$ \| cal(E) \( U \) \| lt.double_(F \, S \, eta) U^(1 \/ 2) $

 which contains every row for which $omega_u$ is principal or $L_F \( s \, omega_u \)$ has a zero with $"Re" s gt.eq .996$ and $\| "Im" s \| lt.eq 4 U^rho$. For $u in.not cal(E) \( U \)$ and every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(8.4)")
 $ lr(|L^S \( xi \, eta overline(chi_bullet \( u \)) \)^(- 1)|) lt.double_(F \, S \, eta \, epsilon.alt) U^epsilon.alt #h(2em) \( "Re" xi gt.eq .998 \, med \| "Im" xi \| lt.eq 2 U^rho \) . $ <eq:good-reciprocal>]

 The exponents $.996 \, .998 \, 1 \/ 2$ are absolute. The height exponent $rho$, the constants, and $U_0$ may depend on the fixed data.]
] <prop:zero-density>

#proof[
  Set $sigma_0 = .996$. For a primitive nonprincipal character $omega$ in the family of (8.1), define the truncated inverse and its product coefficients by
  $ D_U \( s \, omega \) = sum_(q_(frak(d)) lt.eq U^2) mu_F \( frak(d) \) omega \( frak(d) \) q_(frak(d))^(- s) \, #h(2em) alpha_U \( frak(n) \) = sum_(frak(d) divides frak(n)\
q_(frak(d)) lt.eq U^2) mu_F \( frak(d) \) . $
  Here $mu_F$ is the Möbius function of integral $cal(O)_F$ ideals. In absolute convergence,
  $ L_F \( s \, omega \) D_U \( s \, omega \) = sum_(frak(n)) alpha_U \( frak(n) \) omega \( frak(n) \) q_(frak(n))^(- s) . $
  Complete multiplicativity with the primitive zero extension justifies this identity also on ideals meeting the conductor. The coefficients are independent of $omega$ and satisfy
  #[#set math.equation(numbering: n => "(8.5)")
   $ alpha_U \( 1 \) = 1 \, #h(2em) alpha_U \( frak(n) \) = 0 quad \( 1 < q_(frak(n)) lt.eq U^2 \) \, #h(2em) \| alpha_U \( frak(n) \) \| lt.eq tau_F \( frak(n) \) lt.double_(F \, epsilon.alt) q_(frak(n))^epsilon.alt . $ <eq:detector-coefficients>]
  The coefficients with $1 < q_(frak(n)) lt.eq U^2$ have vanished. We shall show that at a zero in the stated rectangle the full exponentially smoothed sum is $o \( 1 \)$. After its exponential tail is discarded, the unit coefficient must therefore be cancelled, up to $o \( 1 \)$, by terms with $U^2 < q_(frak(n)) lt.eq U^11$. A dyadic prefix of those terms is consequently large. The conductor sieve will bound the number of characters for which such a prefix can be large at any allowed height.
  Suppose $L_F \( beta + i gamma \, omega \) = 0$ with $beta gt.eq sigma_0$, $\| gamma \| lt.eq 4 U^rho$. Absolute convergence of the Euler product implies $beta lt.eq 1$. Mellin inversion of the exponential gives, with $c > 1$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ sum_(frak(n)) alpha_U \( frak(n) \) omega \( frak(n) \) q_(frak(n))^(- beta - i gamma) e^(- q_(frak(n)) \/ U^10) = frac(1, 2 pi i) integral_(\( c \)) L_F \( beta + i gamma + v \, omega \) D_U \( beta + i gamma + v \, omega \) Gamma \( v \) U^(10 v) thin d v . $ <eq:zero-detector>]
  Move the $v$-line to $"Re" v = 1 \/ 2 - beta$, which lies between $- 1 \/ 2$ and $- .496$. The only crossed gamma pole is $v = 0$, and its residue vanishes because $L_F \( beta + i gamma \, omega \) = 0$. The character is nonprincipal, so its $L$-function has no pole in the shift. The gamma decay and the polynomial height bounds justify the horizontal limits.
  On the new line the fixed-field ideal count gives
  $ \| D_U \( 1 \/ 2 + i t \, omega \) \| lt.eq sum_(q_(frak(d)) lt.eq U^2) q_(frak(d))^(- 1 \/ 2) lt.double_F U . $
  Use (8.3) and integrate the gamma factor. The right side of (8.6) is at most
  #[#set math.equation(numbering: n => "(8.7)")
   $ lt.double U^(10 \( 1 \/ 2 - beta \) + 1 \/ 2 + 1 + epsilon.alt) \( 1 + \| gamma \| \)^(A_F) lt.double U^(- 3.46 + A_F rho + epsilon.alt) . $ <eq:detector-shift-bound>]
  Choose once and for all
  $ 0 < rho < min {1 / 10 \, frac(1, A_F + 1)} $
  and then take the preliminary loss small. The last bound is $o \( 1 \)$.
  The first term on the left of (8.6) is $e^(- U^(- 10)) = 1 + o \( 1 \)$, and the intervening terms through $U^2$ vanish by (8.5). The portion with $q_(frak(n)) > U^11$ is exponentially small, uniformly in $beta gt.eq sigma_0$: the divisor bound and ideal count majorize it by a fixed power of $U$ times $e^(- U \/ 2)$. It follows that the sum over $U^2 < q_(frak(n)) lt.eq U^11$ has modulus bounded below by a positive constant. Decompose this interval into $O \( log U \)$ dyads. On any such dyad the remaining real weight is
  $ t^(sigma_0 - beta) e^(- t \/ U^10) \, $
  which is nonnegative, decreasing, and at most one. Partial summation therefore bounds its weighted sum by twice the maximum modulus of the unweighted prefix sums. Consequently for at least one dyadic $U^2 \/ 2 < N lt.eq U^11$ and one $y in \[ N \, 2 N \]$,
  #[#set math.equation(numbering: n => "(8.8)")
   $ lr(|sum_(N < q_(frak(n)) lt.eq y) alpha_U \( frak(n) \) omega \( frak(n) \) q_(frak(n))^(- sigma_0 - i gamma)|) gt.double \( log U \)^(- 1) . $ <eq:detecting-partial-sum>]
  We spell out the two maximal estimates needed to use the conductor sieve on this assertion. Order the ideals on a dyad by norm, with any fixed order for ties. A prefix is the disjoint union of at most $O \( log N \)$ binary index intervals. Cauchy–Schwarz and summation over those intervals bound the squared maximum of all prefixes by the sum of their squared interval sums, with $O \( \( log N \)^2 \)$ total cost after the large sieve is applied; every coefficient occurs in one interval at each level. For a fixed interval its Dirichlet polynomial $P_omega \( t \)$ satisfies on a unit interval the elementary bound
  $ sup_(t in \[ j \, j + 1 \]) \| P_omega \( t \) \|^2 lt.double integral_(j - 1)^(j + 2) #scale(x: 120%, y: 120%)[\(] \| P_omega \( t \) \|^2 + \| P'_omega \( t \) \|^2 #scale(x: 120%, y: 120%)[\)] thin d t . $
  The derivative only multiplies its coefficients by $log q_(frak(n)) lt.double log N$. Apply 25 at each $t$, and sum these integrals over $\| t \| lt.eq 4 U^rho$. This costs $U^rho$ and powers of logarithms. The squared coefficient mass on a dyad is
  $ sum_(N < q_(frak(n)) lt.eq 2 N) \| alpha_U \( frak(n) \) \|^2 q_(frak(n))^(- 2 sigma_0) lt.double_(F \, epsilon.alt) N^(1 - 2 sigma_0 + epsilon.alt) . $
  Since $N > U^2 \/ 2$ and $N lt.eq U^11$, the nonlogarithmic cost in (8.2) is bounded by
  #[#set math.equation(numbering: n => "(8.9)")
   $ \( N + U^2 \) N^(1 - 2 sigma_0 + epsilon.alt) lt.double N^(2 - 2 sigma_0 + epsilon.alt) lt.double U^(.088 + O \( epsilon.alt \)) . $ <eq:density-exponent>]
  Here $2 - 2 sigma_0 = .008$, and $11 \( .008 \) = .088$; the factor $\( N U \)^epsilon.alt$ in the large sieve is included in $U^(O \( epsilon.alt \))$. Chebyshev’s inequality with (8.8), followed by summation over the $O \( log U \)$ dyads, gives
  $ \# { omega upright(" with a detected zero") } lt.double U^(.088 + rho + O \( epsilon.alt \)) . $
  The choice $rho < .1$ leaves more than $0.31$ before exponent $1 \/ 2$. Take the losses small and include the at most one principal character. Distinctness of the $omega_u$’s now gives the asserted bound for $cal(E) \( U \)$.
  It remains to obtain the reciprocal bound from the zero-free rectangles just proved. Let $T = U^rho$ and $u in.not cal(E) \( U \)$. For $\| t \| lt.eq 2 T$, consider disks centered at $2 + i t$ of radii
  $ R_2 = 1.0035 \, #h(2em) r_2 = 1.003 \, #h(2em) r_0 = .999 \, #h(2em) r_1 = 1.002 . $
  For large $U$ the outer disk lies within $"Re" s > .996 \, med \| "Im" s \| < 4 T$; its left edge is $.9965$. The nonprincipal $L_F \( s \, omega_u \)$ is entire and nonzero on the disk. It has a branch of $log L_F$ there agreeing at the center with the Euler logarithm. The convexity bound gives $"Re" log L_F = log \| L_F \| lt.eq C_F log U$ on the outer disk, and the value at the center is $O_F \( 1 \)$. Borel–Carathéodory consequently bounds $\| log L_F \|$ by $O_F \( log U \)$ on radius $r_2$. On radius $r_0$ the real part is at least $1.001$, so the absolutely convergent Euler logarithm is $O_F \( 1 \)$. The three-circles theorem applied to the analytic function $log L_F$ now gives, on radius $r_1$,
  $ \| log L_F \( s \, omega_u \) \| lt.double_F \( log U \)^theta \, #h(2em) theta = frac(log \( 1.002 \/ .999 \), log \( 1.003 \/ .999 \)) < 1 . $
  These disks reach the line $"Re" s = .998$; absolute convergence covers the larger real parts outside them. Hence for $"Re" s gt.eq .998$ and $\| "Im" s \| lt.eq 2 T$,
  $ \| L_F \( s \, omega_u \)^(- 1) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] O_F \( \( log U \)^theta \) #scale(x: 120%, y: 120%)[\)] lt.double_(F \, epsilon.alt) U^epsilon.alt . $
  The estimate for omitted factors preceding the proposition gives the same bound for the incomplete function, proving (8.4). ◻
]

=== 8.2 The principal component and the other frequency rows <the-principal-component-and-the-other-frequency-rows>

Use the scales in (4.4), and let $sigma_xi \, sigma_w \, sigma_z$ denote the real parts of $xi \, w \, z$. Write $E_(*) \( sigma_xi \, sigma_w \, sigma_z \)$ for the real power of $Z$ outside the Dirichlet factors in (7.10). In the principal row, taking the residues at $w = 1$ and $z = 1 \/ 6$ leaves the exponent $C_(*) \( xi \)$ in the second line:

#[#set math.equation(numbering: n => "(8.10)")
 $ E_(*) \( sigma_xi \, sigma_w \, sigma_z \) & = a / 2 + sigma_xi - 1 + h_0 sigma_z + b \( sigma_w - 1 \) \,\
C_(*) \( xi \) & = a / 2 + xi - 1 + h_0 / 6 = xi - 8 / 15 \, #h(2em) C_(*) \( 1 \) = 7 / 15 . $ <eq:contour-exponent>]

Thus $C_(*) \( 1 \) = 7 \/ 15$ is the reference power for comparing the principal remainders and the other frequency rows.

We specify a decay observation that justifies the contour limits and, later, the truncated shifts. On any fixed real strips used below, for every $A > 0$,

#[#set math.equation(numbering: n => "(8.11)")
 $ lr(|e^(\( xi + z - 1 \)^2) M \( z \) hat(W)_1 \( w \)|) lt.double_A e^(- \( "Im" xi + "Im" z \)^2) \( 1 + \| "Im" z \| \)^(- A) \( 1 + \| "Im" w \| \)^(- A) . $ <eq:triple-height-decay>]

The constants can depend on those strips. Away from the poles extracted below, all numerator Hecke and zeta functions on them have polynomial height growth, and $cal(H)_u$ is uniformly bounded by $q_u^epsilon.alt$. After increasing $A$, their height powers are absorbed in (8.11). In particular for every $A_1 > 0$,

$ integral_(bb(R)) e^(- \( T + v \)^2) \( 1 + \| v \| \)^(- A) thin d v lt.double_(A_1) \( 1 + \| T \| \)^(- A_1) $

with $A$ sufficiently large. Thus integration in $z \, w$ gives arbitrary polynomial decay in the remaining $xi$-height as well. On lines $"Re" xi > 1$ the reciprocal denominator is globally bounded by its absolutely convergent Euler product. These facts justify all infinite contour shifts on such lines by their horizontal limits.

Let $I_1 \( Z \)$ denote the contribution of $u = 1$ to the initially absolutely convergent formula (7.10), on the scales $\( X \, Y \) = \( Z^a \, Z^b \)$. Its numerator is $zeta_F^S \( w \)$. Put $delta_1 = 10^(- 7)$, $sigma_1 = 1 + delta_1$, and $zeta_1 = 1 \/ 6 + delta_1$. Move the initial lines to

$ "Re" xi = sigma_1 \, #h(2em) "Re" w = sigma_1 \, #h(2em) "Re" z = zeta_1 . $

These moves cross no poles: both zeta arguments remain to the right of one, and the reciprocal denominator is in absolute convergence. The second region of (7.13) contains all the moves. Now move $w$ to $.95$, crossing its simple pole at $1$, and call the remaining triple integral $R_w \( Z \)$. In the $w = 1$ residue move $z$ to $.16$, crossing the pole of $zeta_F^S \( 6 z \)$ at $1 \/ 6$, and call the remaining residue integral $R_z \( Z \)$. Their contours are

$ R_w : & quad \( "Re" xi \, "Re" w \, "Re" z \) = \( sigma_1 \, .95 \, zeta_1 \) \,\
R_z : & quad \( "Re" xi \, w \, "Re" z \) = \( sigma_1 \, 1 \, .16 \) . $

The other term is the double residue. With its evaluation $c_0 f_eta \( Z \)$ below, the principal component is exactly

$ I_1 \( Z \) = c_0 f_eta \( Z \) + R_w \( Z \) + R_z \( Z \) . $

The powers of the two remainders relative to $C_(*) \( 1 \)$ are

$ E_(*) \( sigma_1 \, .95 \, zeta_1 \) - C_(*) \( 1 \) & = \( 1 + h_0 \) delta_1 - .05 b = - .00664989 \,\
E_(*) \( sigma_1 \, 1 \, .16 \) - C_(*) \( 1 \) & = delta_1 + h_0 \( .16 - 1 \/ 6 \) = - .000666566666 dots.h . $

The height bounds just given and 24 therefore give

#[#set math.equation(numbering: n => "(8.12)")
 $ R_w \( Z \) & = O_(F \, S \, eta \, W_0 \, W_1) #scale(x: 120%, y: 120%)[\(] Z^(C_(*) \( 1 \) - .0005) #scale(x: 120%, y: 120%)[\)] \,\
R_z \( Z \) & = O_(F \, S \, eta \, W_0 \, W_1) #scale(x: 120%, y: 120%)[\(] Z^(C_(*) \( 1 \) - .0005) #scale(x: 120%, y: 120%)[\)] . $ <eq:principal-remainders>]

To evaluate the double residue, write $R_S = "Res"_(s = 1) zeta_F^S \( s \) > 0$. It has the form $c_0 f_eta \( Z \)$, where

#[#set math.equation(numbering: n => "(8.13)")
 $ c_0 & = R_S^2 / 6 M \( 1 \/ 6 \) hat(W)_1 \( 1 \) eq.not 0 \,\
f_eta \( Z \) & = frac(1, 2 pi i) integral_(\( 2 \)) Z^(C_(*) \( xi \)) e^(\( xi - 5 \/ 6 \)^2) frac(cal(H)_eta \( xi \), L^S \( xi \, eta \)) thin d xi . $ <eq:principal-Mellin-integral>]

Indeed the residue of $zeta_F^S \( 6 z \)$ is $R_S \/ 6$, and $hat(W)_1 \( 1 \) = integral_0^oo W_1 \( t \) thin d t > 0$. The other factor is nonzero by (7.1). The norm measures were fixed before the probe, so this is the exact scalar in its normalization. The line of the double residue was initially $"Re" xi = sigma_1$; we moved it right to $2$ to write (8.13). This uses only absolute convergence of $1 \/ L^S \( xi \, eta \)$ for $"Re" xi > 1$.

It remains to bound the rows with $u eq.not 1$. Split their sum on the initial lines into dyads $U lt.eq q_u < 2 U$, $U = 1 \, 2 \, 4 \, dots.h$, before shifting any of them. Each dyad contains finitely many rows; the full sum on the initial lines is absolutely convergent. Denote by $cal(J)_(cal(C)) \( Z \)$ the triple integral of a subset $cal(C)$ of such a dyad, and set

$ cal(J)_U^(upright("np")) \( Z \) = cal(J)_({ u eq.not 1 : U lt.eq q_u < 2 U }) \( Z \) . $

The numerator for each of these rows is entire. From (8.3) and the omitted-factor bound,

#[#set math.equation(numbering: n => "(8.14)")
 $ L^S \( w \, chi_bullet \( u \) \) lt.double_epsilon.alt U^(1 \/ 2 + epsilon.alt) \( 2 + \| "Im" w \| \)^(A_F) #h(2em) \( .003 lt.eq "Re" w lt.eq 4 \) . $ <eq:numerator-convexity>]

On $"Re" xi = sigma_1$, independently of $u$ and the height,

$ \| L^S \( xi \, eta overline(chi_bullet \( u \)) \)^(- 1) \| lt.eq product_(frak(p) in.not S) \( 1 + q_(frak(p))^(- sigma_1) \) lt.eq zeta_F \( sigma_1 \) . $

For each row move the initial lines to

$ "Re" xi = sigma_1 \, #h(2em) "Re" w = .003 \, #h(2em) "Re" z = .4 . $

One may first move $xi$, then $z$, then $w$. The $z$-line remains above $1 \/ 6$; the numerator is entire; and the denominator stays in absolute convergence. The first region of (7.13) contains the whole move. If $\| cal(C) \| lt.double U^alpha$, the bounds above give

#[#set math.equation(numbering: n => "(8.15)")
 $ \| cal(J)_(cal(C)) \( Z \) \| lt.double_epsilon.alt Z^(E_(*) \( sigma_1 \, .003 \, .4 \)) U^(alpha + 1 \/ 2 - .4 + epsilon.alt) . $ <eq:dyadic-contour-bound>]

The factor $U^(- .4)$ is the $q_u^(- z)$ in (7.10). The height integral is bounded by (8.11).

To see how the size of the frequency determines the contours, rewrite (8.15) as

$ \| cal(J)_(cal(C)) \( Z \) \| lt.double_epsilon.alt Z^(a \/ 2 + sigma_1 - 1 + b \( .003 - 1 \)) U^(alpha + 1 \/ 2 + epsilon.alt) (Z^(h_0) / U)^.4 . $

For a general $z$-line, the corresponding factor is $\( Z^(h_0) \/ U \)^("Re" z)$. Its dependence on $"Re" z$ changes direction at $U = Z^(h_0) = Z^.1$: below that scale a rightward $z$-shift enlarges this factor, while above it such a shift reduces the factor. We retain the current low-$w$ contour through $U lt.eq Z^(h_0 + .00001)$, and use a rightward $z$-shift beyond that enlarged threshold.

The common $Z$-exponent on the current contour, relative to the principal scale, is

$ E_(*) \( sigma_1 \, .003 \, .4 \) - C_(*) \( 1 \) = 10^(- 7) + 7 / 300 - .132601 = - .109267566666 dots.h . $

For $U lt.eq Z^.09$, use (8.15) with $alpha = 1$. The $U^1.1$ factor adds at most $.09 \( 1.1 \) = .099$ to this relative exponent, so these rows are already smaller than the principal scale.

We use 26 only in the remaining interval

#[#set math.equation(numbering: n => "(8.16)")
 $ Z^.09 < U lt.eq Z^(h_0 + .00001) = Z^.10001 \, $ <eq:intermediate-frequency-range>]

where its threshold $U_0$ is met for all sufficiently large $Z$. For the rows in $cal(E) \( U \)$, use the same contour estimate with $alpha = 1 \/ 2$. The $U^.6$ factor then adds at most $.10001 \( .6 \) = .060006$ to the same relative exponent.

For each remaining row truncate its $xi$-line at $\| "Im" xi \| lt.eq U^rho$, and move that finite portion to $"Re" xi = .998$. The rectangle and its two horizontal sides satisfy (8.4); hence the new central integral satisfies

#[#set math.equation(numbering: n => "(8.17)")
 $ lt.double_epsilon.alt Z^(E_(*) \( .998 \, .003 \, .4 \)) U^(1 + 1 \/ 2 - .4 + epsilon.alt) $ <eq:good-central-bound>]

after summing all the good rows of the dyad. The estimate does not use the reciprocal outside the specified rectangle. Since $E_(*)$ is linear in $"Re" xi$ with coefficient one, this move gains $Z^(.998 - sigma_1) = Z^(- .0020001)$. Including the $U^1.1$ cost up to the upper endpoint of (8.16), the relative exponent is at most

#[#set math.equation(numbering: n => "(8.18)")
 $ - .002 + 7 / 300 - .132601 + .10001 \( 1.1 \) = - 377 / 300000 = - .001256666666 dots.h . $ <eq:good-numerical-margin>]

To bound the discarded and horizontal portions, integrate in $z \, w$ first in (8.11). For every prescribed $A_1 > 0$ the discarded tails on $"Re" xi = sigma_1$ and the horizontal portions at $"Im" xi = plus.minus U^rho$ are, in total over a good dyad, at most

#[#set math.equation(numbering: n => "(8.19)")
 $ lt.double_(A_1 \, epsilon.alt) Z^(E_(*) \( sigma_1 \, .003 \, .4 \)) U^(1 + 1 \/ 2 - .4 + epsilon.alt - rho A_1) . $ <eq:xi-tail-bound>]

On the horizontal portions the real exponent is bounded by its value at $sigma_1$; the reciprocal is bounded by (8.4). On the discarded original tails it is bounded by absolute convergence. The convolution estimate following (8.11), used with pointwise exponent $A_1 + 2$ before integrating the discarded $xi$-tails, supplies $U^(- rho A_1)$ in both cases. Since $U > Z^.09$, choosing $A_1 > 1 \/ rho$, after $rho$ is fixed, gives more than enough additional saving for these terms.

All these comparisons leave a fixed margin after the arbitrary small power losses. The sums over the $O \( log Z \)$ dyads in these ranges cost only another arbitrarily small power.

Finally consider $U > Z^.10001$. Now $Z^(h_0) \/ U lt.eq Z^(- .00001)$, so a fixed rightward $z$-shift suppresses the whole dyad. Keep $"Re" xi = "Re" w = 4$ and move $z$ to the fixed right line $"Re" z = R_0 = 350000$. The move stays in the Euler region, crosses no pole, and uses the holomorphy of $M$ on $"Re" z > 0$. Both Hecke factors are bounded by absolute convergence on these lines, so 24 and (8.11) give

$ \| cal(J)_(cal(C)) \( Z \) \| lt.double_epsilon.alt Z^3.849 U^(1 + epsilon.alt) (Z^.1 / U)^(R_0) = Z^(3.849 + .1 R_0) U^(1 - R_0 + epsilon.alt) . $

The dyads sum geometrically. At their lower endpoint the power of $Z$ is

#[#set math.equation(numbering: n => "(8.20)")
 $ 3.849 + .1 R_0 + .10001 \( 1 - R_0 + epsilon.alt \) = .44901 + .10001 epsilon.alt . $ <eq:far-frequency-exponent>]

This is strictly less than $C_(*) \( 1 \) - .01$ for small $epsilon.alt$. The very large $z$-line is fixed; its weight constants may be large, but are independent of $Z$ and $U$.

Choose the preliminary losses small enough that their total cost in the finite frequency ranges, including the dyadic count, is less than $10^(- 4)$ in the $Z$-exponent. This is possible since $U lt.eq Z^.10001$ there. The smallest central saving in (8.18) is larger than $0.0012$; (8.19) and (8.20) have larger savings. We have therefore proved

#[#set math.equation(numbering: n => "(8.21)")
 $ sum_(j gt.eq 0) cal(J)_(2^j)^(upright("np")) \( Z \) lt.double Z^(C_(*) \( 1 \) - .0004) . $ <eq:nonprincipal-row-total>]

Each dyadic integral here is obtained from its initial absolutely convergent integral, and the preceding bounds justify their sum.

=== 8.3 Completion of the Mellin argument <completion-of-the-mellin-argument>

The numerical exponents established above, before the indicated small losses, are collected in 1. In particular the exponent from reflection is

$ frac(2 M_0 - 1 - b, 2) = 933 / 2000 = C_(*) \( 1 \) - 1 / 6000 . $

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (left, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Contribution
], table.cell(rowspan: 1, colspan: 1)[exponent relative to $C_(*) \( 1 \) = 7 \/ 15$
]),
  table.cell(rowspan: 1, colspan: 1)[Probe bound from reflection
], table.cell(rowspan: 1, colspan: 1)[$- 1 \/ 6000 = - .000166666 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[Principal remainder $R_w$
], table.cell(rowspan: 1, colspan: 1)[$- .00664989$
],
  table.cell(rowspan: 1, colspan: 1)[Principal remainder $R_z$
], table.cell(rowspan: 1, colspan: 1)[$- .000666566 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[Nonprincipal rows $U lt.eq Z^.09$
], table.cell(rowspan: 1, colspan: 1)[$- .010267566 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[Exceptional rows $U lt.eq Z^.10001$
], table.cell(rowspan: 1, colspan: 1)[$- .049261566 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[Good central rows $U lt.eq Z^.10001$
], table.cell(rowspan: 1, colspan: 1)[$- .001256666 dots.h$
],
  table.cell(rowspan: 1, colspan: 1)[Rows $U > Z^.10001$, $R_0 = 350000$
], table.cell(rowspan: 1, colspan: 1)[$- .017656666 dots.h$
],
)
]],
  caption: [Table 2: The fixed exponent margins in the probe comparison. The row bounds precede arbitrary small power losses. ],
)

Combining the principal decomposition $I_1 = c_0 f_eta + R_w + R_z$, (8.12), (8.21), and (7.10) gives, for sufficiently large $Z$,

$ I \( Z^a \, Z^b \, Z \) = c_0 f_eta \( Z \) + O \( Z^(C_(*) \( 1 \) - .0004) \) . $

Use 23 with, for example, a loss $10^(- 5)$. Since $1 \/ 6000 - 10^(- 5) > 1 \/ 20000$ and $c_0 eq.not 0$, the preceding identity implies the safe bound

#[#set math.equation(numbering: n => "(8.22)")
 $ f_eta \( Z \) lt.double_(F \, S \, eta \, W_0 \, W_1) Z^(7 \/ 15 - 1 \/ 20000) #h(2em) \( Z upright(" sufficiently large") \) . $ <eq:f-large-bound>]

Set

$ cal(A) \( xi \) = e^(\( xi - 5 \/ 6 \)^2) frac(cal(H)_eta \( xi \), L^S \( xi \, eta \)) . $

For $"Re" xi > 1$ this is holomorphic. In the definition of $f_eta$ in (8.13), its $xi$-line may be moved right from $2$ to any fixed real part $sigma_R > 2$. The reciprocal there is in absolute convergence, the correction is holomorphic and bounded, and the Gaussian gives rapid vertical decay. It follows that for every $A_0 > 0$,

#[#set math.equation(numbering: n => "(8.23)")
 $ f_eta \( Z \) = O_(A_0) \( Z^(A_0) \) #h(2em) \( 0 < Z lt.eq 1 \) \, $ <eq:f-small-bound>]

by taking $sigma_R > A_0 + 8 \/ 15$. Thus this endpoint estimate has used no zero exclusion to the left of one.

Consider

#[#set math.equation(numbering: n => "(8.24)")
 $ cal(T) \( s \) = integral_0^oo f_eta \( Z \) Z^(- C_(*) \( s \)) thin frac(d Z, Z) . $ <eq:final-Mellin-transform>]

By (8.22), (8.23), it converges locally uniformly, and hence defines a holomorphic function, for

$ "Re" s > 1 - 1 / 20000 . $

Indeed at infinity the real exponent is $1 - 1 \/ 20000 - "Re" s < 0$, and at zero (8.23) allows an arbitrarily large exponent. The same majorants with powers of $log Z$ justify differentiation under the integral.

We identify this transform on its original line without a formal contour interchange. Put $t = log Z$. From (8.13),

$ e^(- C_(*) \( 2 \) t) f_eta \( e^t \) = frac(1, 2 pi) integral_(bb(R)) e^(i tau t) cal(A) \( 2 + i tau \) thin d tau . $

The function $cal(A) \( 2 + i tau \)$ is continuous and rapidly decreasing by the Gaussian and the bounded Euler factors. The endpoint bounds on $f_eta$ make the left side integrable in $t$. Fourier inversion therefore gives

#[#set math.equation(numbering: n => "(8.25)")
 $ cal(T) \( 2 + i tau \) = cal(A) \( 2 + i tau \) #h(2em) \( tau in bb(R) \) . $ <eq:Mellin-identification>]

For $"Re" s > 1 - 1 \/ 20000$, the second neighborhood in 24 makes the numerator

$ e^(\( s - 5 \/ 6 \)^2) cal(H)_eta \( s \) $

holomorphic and nowhere zero. The Hecke continuation makes $cal(A) \( s \)$ meromorphic there. The identity theorem, first on $"Re" s > 1$ using (8.25) and then for meromorphic functions on the connected larger half-plane, identifies $cal(A)$ with the holomorphic function $cal(T)$. A zero of $L^S \( s \, eta \)$ in that half-plane would be a pole of $cal(A)$, since its numerator is nonzero, which is impossible. A pole of the principal $L$-function simply makes its reciprocal vanish.

The finite factors removed from $L_F \( s \, eta \)$ are either one or $1 - eta \( frak(p) \) q_(frak(p))^(- s)$ with $\| eta \( frak(p) \) \| = 1$; their zeros have real part zero. Thus the same zero exclusion holds for the full $L_F \( s \, eta \)$. The obtained half-plane contains $"Re" s > 1 - 10^(- 6)$. All onsets and constants in the proof were allowed to depend on $F \, S \, eta$, but the numerical saving $1 \/ 20000$ is absolute. A field-dependent onset in (8.22) affects only a finite portion of the integral and does not change its half-plane of convergence. Since the initial field and finite-order character were arbitrary in the scope of 2, this proves that theorem.

== 9 A uniform estimate for complete splitting <sec:splitting>

We prove Proposition 4 for the fields $K_q = bb(Q) \( mu_q \, a^(1 \/ q) \)$, where $a$ is a fixed integer with $\| a \| > 1$. Theorem 2, proved in Section 8, supplies the common zero-free width $delta_0 = 10^(- 6)$. We transfer that region to $zeta_(K_q)$ and then use a smooth explicit formula whose constants depend on the field only through its degree and discriminant.

=== 9.1 Field bounds and descent of the zero-free region <field-bounds-and-descent-of-the-zero-free-region>

The field $K_q$ need not be cyclotomic. We first place it in an abelian extension of a cyclotomic field, so that Theorem 2 applies, and then descend the resulting zero-free region to $zeta_(K_q)$.

#prodef([Lemma 9.1.])[
  #emph[Fix an integer $a$ with $\| a \| > 1$. For every sufficiently large prime $q$, the degree $n_q = \[ K_q : bb(Q) \]$ and absolute discriminant $D_q$ satisfy 
#[#set math.equation(numbering: n => "(9.1)")
 $ n_q = q \( q - 1 \) \, #h(2em) D_q lt.eq q^(q \( q - 2 \)) \( q^q \| a \|^(q - 1) \)^(q - 1) \, #h(2em) log D_q + n_q lt.double_a n_q log \( 2 q \) . $ <spl:degree-discriminant>]

 Every rational prime $p divides.not a q$ is unramified in $K_q$, and 
#[#set math.equation(numbering: n => "(9.2)")
 $ zeta_(K_q) \( s \) eq.not 0 #h(2em) \( "Re" s > 1 - delta_0 \, med s eq.not 1 \) . $ <spl:kummer-zero-free>]

]
] <spl:field-bounds>

#proof[
  Fix a rational prime $ell divides a$, and let $v_ell \( a \) > 0$ be its valuation. Take $q$ large enough that $q eq.not ell$ and $q > v_ell \( a \)$. When $a = 2$, the choice $ell = 2$ works for every prime $q gt.eq 5$. The cyclotomic discriminant formula gives $\| d_(E_q) \| = q^(q - 2)$, so $ell$ is unramified in $E_q$ and the valuation of $a$ at every prime above $ell$ is $v_ell \( a \)$. This is not divisible by $q$, and therefore $a$ is not a $q$th power in $E_q$.
  Since $E_q$ contains $mu_q$, the extension $K_q \/ E_q$ is Galois and the map
  $ sigma mapsto frac(sigma \( a^(1 \/ q) \), a^(1 \/ q)) $
  embeds its Galois group in $mu_q$. Its degree divides the prime $q$ and is not one, so it equals $q$. This proves the degree formula.
  The root $a^(1 \/ q)$ is integral, and the relative field discriminant divides the discriminant of its power basis:
  $ frak(d)_(K_q \/ E_q) divides \( q^q a^(q - 1) \) cal(O)_(E_q) . $
  The discriminant tower formula now gives
  $ D_q = \| d_(E_q) \|^q "N"_(E_q \/ bb(Q)) \( frak(d)_(K_q \/ E_q) \) lt.eq q^(q \( q - 2 \)) \( q^q \| a \|^(q - 1) \)^(q - 1) . $
  This also proves unramifiedness away from $a q$, and taking logarithms proves the last estimate in (9.1). We use the standard cyclotomic and relative discriminant formulas in [19] Chapter I, §10; Chapter III, §2.
  To obtain (9.2), put
  $ F_q = bb(Q) \( mu_(12 q) \) \, #h(2em) tilde(K)_q = K_q F_q . $
  The extension $tilde(K)_q \/ F_q$ is cyclic, since it is obtained by adjoining $a^(1 \/ q)$ to a field containing $mu_q$. The extension $tilde(K)_q \/ K_q$ is also abelian: it is Galois, and restriction embeds its Galois group in the abelian group $"Gal" \( F_q \/ bb(Q) \)$. Abelian Artin factorization, with one-dimensional Artin functions identified with primitive Hecke functions, gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ zeta_(tilde(K)_q) \( s \) & = product_(eta in accent("Gal" \( tilde(K)_q \/ F_q \), ̂)) L_(F_q) \( s \, eta \) \,\
frac(zeta_(tilde(K)_q) \( s \), zeta_(K_q) \( s \)) & = product_(eta in accent("Gal" \( tilde(K)_q \/ K_q \), ̂)\
eta eq.not 1) L_(K_q) \( s \, eta \) . $ <spl:factorization-upstairs>]
  See [19] Chapter VII, Corollary (10.5), Theorem (10.6), and the following remarks. Every factor in (9.3) is covered by Theorem 2, because $F_q$ is cyclotomic and contains $mu_12$. Thus $zeta_(tilde(K)_q)$ is zero-free in the indicated half-plane. Every factor in (9.3) is an entire nonprincipal Hecke $L$-function. A zero of $zeta_(K_q)$ there would therefore be a zero of $zeta_(tilde(K)_q)$. This proves (9.2). ◻
]

The width in (9.2) is independent of $q$. It remains to turn it into a prime-ideal estimate whose constants retain only the explicit dependence on degree and discriminant in (9.1).

=== 9.2 A smooth prime-ideal estimate <a-smooth-prime-ideal-estimate>

Smoothing permits an absolutely convergent sum over zeros. The following form of the explicit formula is useful because its error is linear in $log D + n$. We give the calculation with this dependence explicit.

#prodef([Lemma 9.2.])[
  #emph[Fix $0 < delta < 1 \/ 2$ and a nonnegative function $f in C_c^oo \( \( 0 \, oo \) \)$. Let $K$ be a number field of degree $n$ and absolute discriminant $D$ whose Dedekind zeta function has no zero in $"Re" s > 1 - delta$. For every real $x gt.eq 2$, 
#[#set math.equation(numbering: n => "(9.4)")
 $ Theta_(K \, f) \( x \) := sum_(frak(p)) sum_(j gt.eq 1) \( log "N" frak(p) \) f (frac(\( "N" frak(p) \)^j, x)) lt.double_f x + x^(1 - delta) \( log D + n \) \, $ <spl:smooth-prime-ideal-bound>]

 where $frak(p)$ ranges over the nonzero prime ideals of $K$. The implied constant is independent of $K$ and $x$.]
] <spl:smooth-estimate>

#proof[
  Let $\( r_1 \, r_2 \)$ be the signature of $K$, so $n = r_1 + 2 r_2$, and define the Mellin transform
  $ Phi \( s \) = integral_0^oo f \( t \) t^(s - 1) thin d t . $
  It is entire. Repeated integration by parts shows that, for every fixed vertical strip and every $A > 0$, $Phi \( s \) lt.double_(f \, A) \( 1 + \| "Im" s \| \)^(- A)$ on that strip. Mellin inversion and the absolutely convergent Euler series on $"Re" s = 2$ give
  #[#set math.equation(numbering: n => "(9.5)")
   $ Theta_(K \, f) \( x \) = frac(1, 2 pi i) integral_(\( 2 \)) - zeta'_K / zeta_K \( s \) x^s Phi \( s \) thin d s . $ <spl:mellin-integral>]
  We shift the contour to $"Re" s = - 1 \/ 2$. On this line the functional equation gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ lr(|zeta'_K / zeta_K \( s \)|) lt.double log D + n log \( 2 + \| "Im" s \| \) \, $ <spl:left-line>]
  with an absolute implied constant. To see the dependence on $K$, the Euler series at $1 - s$, whose real part is $3 \/ 2$, is bounded by
  $ n sum_p frac(\( log p \) p^(- 3 \/ 2), 1 - p^(- 3 \/ 2)) lt.double n . $
  Indeed the sum of the residue degrees of primes above a rational prime is at most $n$. The remaining terms in the functional equation are $log D$ and the logarithmic derivatives of
  $ Gamma_(bb(R)) \( s \)^(r_1) Gamma_(bb(C)) \( s \)^(r_2) \, #h(2em) Gamma_(bb(R)) \( s \) = pi^(- s \/ 2) Gamma \( s \/ 2 \) \, quad Gamma_(bb(C)) \( s \) = 2 \( 2 pi \)^(- s) Gamma \( s \) . $
  On the lines involved their logarithmic derivatives are $O \( log \( 2 + \| "Im" s \| \) \)$, by Stirling’s formula and their fixed distance from poles. This proves (9.6); see also [27] Main Theorem 4.4.1 and §4.5 for the functional equation.
  The poles crossed in (9.5) are the pole of $zeta_K$ at $1$, its nontrivial zeros $rho$ counted with multiplicity, and the zero at $0$ of order $r_1 + r_2 - 1$. The last order follows from the gamma factors and the simple pole of the completed zeta function at $0$; when the order is zero there is no residue. There are no other trivial zeros between the two lines. The nontrivial zeros lie in $0 < "Re" rho < 1$: the hypothesis excludes the boundary at $1$, and the functional equation excludes nontrivial zeros on the boundary at $0$.
  For completeness, the zero count needed to justify the shift and bound its residues is
  #[#set math.equation(numbering: n => "(9.7)")
   $ \# { rho : T lt.eq "Im" rho < T + 1 } lt.double log D + n log \( 2 + \| T \| \) \, $ <spl:unit-zero-count>]
  uniformly in $K$ and real $T$. This follows from the uniform Dedekind zero-counting formula of [10] Corollary 1.2, Equation (1.3): for $\| T \| gt.eq 2$, subtract the formula at heights $\| T \| - 1$ and $\| T \| + 2$; for $\| T \| < 2$, use the count up to height $3$. For each fixed $K$, (9.7) permits horizontal contour edges tending to infinity and staying an inverse polynomial distance from all zeros. The Hadamard partial-fraction expansion of the completed zeta function then bounds its logarithmic derivative on these edges by a polynomial in their heights. The rapid decay of $Phi$ makes the horizontal integrals tend to zero. The same zero count makes the resulting zero sum absolutely convergent. Hence the contour shift and (9.6) yield
  #[#set math.equation(numbering: n => "(9.8)")
   $ Theta_(K \, f) \( x \) = x Phi \( 1 \) - sum_rho x^rho Phi \( rho \) - \( r_1 + r_2 - 1 \) Phi \( 0 \) + O_f #scale(x: 120%, y: 120%)[\(] x^(- 1 \/ 2) \( log D + n \) #scale(x: 120%, y: 120%)[\)] . $ <spl:smooth-explicit-formula>]
  Although the contour edges may be chosen separately for each field, the error here has a uniform constant, since it is bounded directly by the integral on the fixed line in (9.6).
  Every nontrivial zero has $"Re" rho lt.eq 1 - delta$. Using (9.7) and the rapid decay on $0 lt.eq "Re" s lt.eq 1$, we obtain
  $ sum_rho \| x^rho Phi \( rho \) \| & lt.double_f x^(1 - delta) sum_(k in bb(Z)) \( 1 + \| k \| \)^(- 3) #scale(x: 120%, y: 120%)[\(] log D + n log \( 2 + \| k \| \) #scale(x: 120%, y: 120%)[\)]\
 & lt.double_f x^(1 - delta) \( log D + n \) . $
  The residue at zero in (9.8) is $O_f \( n \)$. Absorbing it and the left-line error proves (9.4). ◻
]

#proof[
  Choose once and for all a nonnegative $f in C_c^oo \( \( 0 \, oo \) \)$ with $f gt.eq 1$ on $\[ 1 \, 2 \]$. Apply Lemma 28 to $K_q$ with $delta = delta_0$, using Lemma 27. Each rational prime $p in \( x \, 2 x \]$ that splits completely supplies $n_q$ prime ideals of norm $p$. Their first-power terms contribute at least $n_q L$ to the nonnegative sum $Theta_(K_q \, f) \( x \)$. It follows that
  $ & \# { p upright(" prime") : x < p lt.eq 2 x \, med p upright(" splits completely in ") K_q }\
 & #h(2em) lt.double_f frac(x, n_q L) + frac(x^(1 - delta_0) \( log D_q + n_q \), n_q L)\
 & #h(2em) lt.double_a frac(x, q \( q - 1 \) L) + frac(x^(1 - delta_0) log \( 2 q \), L) . $
  For $q lt.eq exp \( L^0.3 \)$, the ratio $log \( 2 q \) \/ L$ is bounded once $x$ is large. This proves (2.4), with constants and an $x$ threshold independent of $q$. For $a = 2$, the field bounds hold for every $q gt.eq 5$ with absolute constants, giving the stated specialization. ◻
]

== 10 Marked Type II estimates and rough factors <sec:type-ii>

The prime construction will count integers whose predecessor has the form in (2.2), then remove the composite integers from that count. The estimate in this section makes that subtraction possible: inside a marked bilinear sum, it replaces a prime condition on one factor by a condition involving only small prime divisors. We first state the imported prime estimate and isolate the coefficient property used by its proof. We then verify that property for the rough-factor condition needed when a composite’s least prime factor stays below the square-root range.

Return to the real variable $x$ from 2, and put

#[#set math.equation(numbering: n => "(10.1)")
 $ L = log x \, #h(2em) W = exp \( L^0.24 \) \, #h(2em) V \( y \) = product_(p lt.eq y) (1 - 1 / p) . $ <eq:sieve-basic-parameters>]

For an integer $m > 1$, write $P^(-) \( m \)$ for its least prime factor, and put $P^(-) \( 1 \) = oo$. Thus $P^(-) \( m \) > y$ means that $m$ is $y$-rough. All Dirichlet characters below, including principal characters, are extended by zero on nonunits.

Fix an integer $K gt.eq 1$ and real numbers $0.1 < a_1 < dots.h.c < a_K < 0.2$, all before letting $x$ grow. The prime groups

#[#set math.equation(numbering: n => "(10.2)")
 $ cal(P)_i = { p upright(" prime") : exp \( L^(a_i) \) lt.eq p lt.eq exp \( 2 L^(a_i) \) } quad \( 1 lt.eq i lt.eq K \) $ <eq:marked-prime-groups>]

are disjoint for sufficiently large $x$. For a positive integer $h$, let

#[#set math.equation(numbering: n => "(10.3)")
 $ h_(cal(P)) = product_(p in union.big_i cal(P)_i) p^(v_p \( h \)) $ <eq:complete-band-part>]

be its complete part supported on these group primes. A function $F : bb(Z)_(> 0) arrow.r bb(C)$ satisfies $F \( p h \) = F \( h \)$ for every group prime $p$ and every positive $h$ if and only if it depends only on $h \/ h_(cal(P))$. In particular this invariance removes every power of a group prime, not only a selected divisor.

Define

#[#set math.equation(numbering: n => "(10.4)")
 $ V_i & = sum_(p in cal(P)_i) 1 / p \, & omega_i \( h \) & = sum_(p in cal(P)_i) upright(bold(1))_(p divides h) \,\
omega \( h \) & = sum_(i = 1)^K omega_i \( h \) \, & cal(W) \( h \) & = q^(omega \( h \) - K) product_(i = 1)^K frac(omega_i \( h \), V_i) \, #h(2em) 0 < q < 1 . $ <eq:marked-weight>]

The prime number theorem and partial summation give $V_i = log 2 + o \( 1 \)$. In particular these denominators are positive for large $x$. The weight is nonnegative and vanishes unless each group supplies a prime divisor. It is bounded by a constant depending only on the fixed $K \, q$, since $j q^(j - 1)$ is bounded for positive integers $j$. In 12 we shall take $q = 1 \/ 2$.

The following is the one-sided marked Type II estimate of #emph[The Poisson–Dirichlet law for the prime factors of $p - 1$] [21] Theorem 3.1.

#prodef([Theorem 10.1.])[
  (One-sided marked Type II estimate).  #emph[Fix $delta \, C \, D_(*) > 0$ and $q in \( 0 \, 1 \)$. Suppose $H_m \, H_n gt.eq x^delta$ and $X = H_m H_n asymp x$. Let $F$ satisfy $\| F \( h \) \| lt.eq 1$ and $F \( p h \) = F \( h \)$ for every prime in the groups defined in (10.2). Let $alpha_m$ be supported on an arbitrary interval in $\[ H_m \, 2 H_m \]$, where it has the value 
$ alpha_m = m^(i v) (upright(bold(1))_(m upright(" prime")) - frac(upright(bold(1))_(P^(-) \( m \) > W), V \( W \) log m)) \, #h(2em) \| v \| lt.eq L^C . $

 Let $beta_n$ be supported on $W$-rough integers in $\[ H_n \, 2 H_n \]$, with $\| beta_n \| lt.eq L^C$. If $K$ is sufficiently large in terms of $delta \, C \, D_(*) \, q$, then 
#[#set math.equation(numbering: n => "(10.5)")
 $ lr(|sum_(m \, n) alpha_m beta_n F \( m n - 1 \) cal(W) \( m n - 1 \)|) lt.double X L^(- D_(*)) . $ <eq:marked-type-ii>]

 The required lower bound on $K$ is independent of the particular $a_i$. The implicit constant and the threshold for $x$ may depend on all the fixed parameters, including the $a_i$.]
] <thm:marked-type-ii>

The invariance is required for every positive $h$, including when $p divides h$. The estimate is uniform over the permitted $F$, coefficient intervals, and coefficients. The symbol $X$ in this section denotes only the product $H_m H_n$.

We need the same marked bound for a rough-factor discrepancy. The following lemma isolates a sufficient condition on a scalar coefficient: cancellation against every character of logarithmic modulus throughout the stated frequency range. Its proof extracts the coefficient dependence from the argument of [21] Theorem 3.1.

#prodef([Lemma 10.2.])[
  (Coefficient criterion for the marked estimate).  #emph[Fix $delta \, C \, D_(*) > 0$ and $q in \( 0 \, 1 \)$. Retain the marked data and the hypotheses on $F \, H_m \, H_n$ in 29, with fixed comparison constants in $X = H_m H_n asymp x$. Let $\( alpha_m \)$ and $\( beta_n \)$ be scalar sequences indexed by positive integers, supported on $W$-rough integers in their respective dyads, with $alpha$ supported on an arbitrary interval $I subset.eq \[ H_m \, 2 H_m \]$, and with $\| alpha_m \| \, \| beta_n \| lt.eq L^C$. Suppose that for every fixed $A_0 \, B \, A > 0$, every Dirichlet character $chi$ modulo $k lt.eq L^(A_0)$, and every $\| t \| lt.eq 2 X L^B$, 
#[#set math.equation(numbering: n => "(10.6)")
 $ lr(|1 / H_m sum_m alpha_m chi \( m \) m^(i t)|) lt.double_A L^(- A) \, $ <eq:type-ii-long-coefficient-interface>]

 uniformly in the permitted interval, character, and frequency. The constant and threshold in this hypothesis may depend on $A_0 \, B \, A$, the fixed setup, and all further fixed parameters defining the coefficients; these parameters are chosen before $x$ grows.]
  #emph[Then (10.5) holds when $K$ is sufficiently large in terms of the fixed data, independently of the particular band exponents $a_i$. Its implicit constant and threshold may depend on all the fixed data, including the $a_i$.]
] <lem:marked-coefficient-transfer>

#proof[
  We extract the assertion from the proof of [21] Theorem 3.1. In its marked expansion, write $m n - 1 = a h$, where $a$ is the product of the selected primes. Invariance gives $F \( m n - 1 \) = F \( h \)$. Except when a selected prime has its square dividing $m n - 1$, one also has $omega \( m n - 1 \) - K = omega \( h \)$. Replacing the damping by $q^(omega \( h \))$ therefore costs $O_A \( X L^(- A) \)$ for every fixed $A$. The resulting factor $F \( h \) q^(omega \( h \))$ has modulus at most one and is discarded in the following Cauchy bound. There are $O_K \( L \)$ dyads $Y$ for the product of the selected primes. For the contribution $S_Y$ of one dyad, Cauchy’s inequality gives
  $ \| S_Y \|^2 lt.double X / Y cal(Q)_Y \, $
  where the nonnegative expanded square is
  #[#set math.equation(numbering: n => "(10.7)")
   $ cal(Q)_Y = (product_i V_i^(- 2)) sum_(a \, b \, m \, n \, m' \, n'\
m n - 1 = a h \, med m' n' - 1 = b h upright(" for some ") h) rho \( a \/ Y \) rho \( b \/ Y \) alpha_m overline(alpha_(m')) beta_n overline(beta_(n')) . $ <eq:type-ii-cauchy-square>]
  Here $a \, b$ each select one prime from every group, and $rho$ is the fixed real smooth dyadic cutoff supported in $\[ 1 \, 4 \]$. Pairs $a \, b$ sharing a selected prime cost $O_A \( X Y L^(- A) \)$. For the remaining coprime pairs, the common-$h$ condition is equivalent to $t = b - a$, where $t = b m n - a m' n'$. These reductions use only coefficient bounds and the invariance of $F$; see [21] Section 3.1.
  For a fixed $A_0 > 0$, let $frak(M) subset bb(R) \/ bb(Z)$ be the union of the arcs
  $ "dist"_(bb(R) \/ bb(Z)) \( theta \, c \/ k \) lt.eq frac(2 L^(A_0), Y) \, #h(2em) 1 lt.eq k lt.eq L^(A_0) \, quad c med mod med k \, quad \( c \, k \) = 1 . $
  The selected-product range has $log Y gt.double L^0.1$, so these arcs are disjoint for large $x$. Choose the companion’s fixed real $psi in C_c^oo \( bb(R) \)$, equal to one on $\[ - 4 \, 4 \]$, and define
  $ cal(H)_(frak(M)) \( t \; a \, b \) = psi \( t \/ Y \) integral_(frak(M)) exp #scale(x: 120%, y: 120%)[\(] 2 pi i theta \( t - b + a \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta . $
  The major form is the scalar sum
  #[#set math.equation(numbering: n => "(10.8)")
   $ cal(Q)_Y^(upright("maj")) =  & (product_i V_i^(- 2)) sum_(a \, b \, m \, n \, m' \, n') rho \( a \/ Y \) rho \( b \/ Y \)\
 & #h(2em)  times alpha_m overline(alpha_(m')) beta_n overline(beta_(n')) cal(H)_(frak(M)) \( b m n - a m' n' \; a \, b \) \, $ <eq:type-ii-major-form>]
  where $a \, b$ now run independently over products of one prime from every group.
  The proof of the replacement conclusion in [21] Proposition 4.1 applies to these scalar coefficients. Its operator moment is independent of their values. The passage from that moment to the scalar endpoint pairing uses only $W$-rough support and norm and supremum bounds with logarithmic exponents depending on $C$, not on $K$ [21] Sections 3.2–3.3. This pairing initially has projections onto the good endpoint states of that argument. In removing either projection, only the error from the endpoint outside its good set is majorized absolutely: each whole scalar endpoint factor is replaced by its logarithmic supremum bound, discarding both its coefficient value and its support indicator before the one-edge root replacement. The surviving unprojected pairing retains its exact endpoint vectors. Expanding those vectors and controlling collisions uses only size, rough support, and fixed divisor moments [21] Section 4.9. Thus the replacement conclusion, including restoration of independent $a \, b$, gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ \| cal(Q)_Y - cal(Q)_Y^(upright("maj")) \| lt.double_A X Y L^(- A) $ <eq:type-ii-minor-transfer>]
  for every prescribed fixed accuracy, with the choices specified below.
  The proof of the major-term estimate [21] Proposition 5.1 separates characters only at moduli $k lt.eq L^(A_0)$. The group primes and all prime divisors of the rough variables exceed these moduli, so every variable is a unit there. After Mellin separation its retained rectangle, for a fixed $B$ chosen after $A_0$, has $\| s' \| lt.eq L^B$ and $\| t \| lt.eq X L^B$, so both $t$ and $s' - t$ lie in the range of (10.6). Transform decay and the product mean square on translated intervals control the discarded tails using only scalar coefficient bounds and fixed divisor moments. The further Mellin shift enters only the one-group prime polynomial and the bounded factor from the other groups; the sparse-frequency estimate is uniform in this shift [21] Lemma 5.3. On the remaining sparse frequency set, the only further input about $alpha$ is the supremum in (10.6), in the role of [21] Lemma 5.2. The same hypothesis covers the conjugated endpoint, by conjugating and replacing $chi \, t$ by $overline(chi) \, - t$. The major-term proof therefore gives
  #[#set math.equation(numbering: n => "(10.10)")
   $ \| cal(Q)_Y^(upright("maj")) \| lt.double_D X Y L^(- D) $ <eq:type-ii-major-transfer>]
  for every fixed $D > 0$.
  Choose the desired square accuracy $D_1$ sufficiently large in terms of $D_(*) \, C$, before choosing $K$. For (10.9), choose the moment accuracy $E_0$ after $D_1 \, C$, then the arc exponent $A_0$, and then $K$, as in [21] Proposition 4.1. These choices do not depend on the particular $a_i$. The analytic accuracies in (10.10) are chosen after $A_0$, as permitted by (10.6) for every fixed accuracy. Taking $A = D = D_1$ gives $cal(Q)_Y lt.double X Y L^(- D_1)$. Cauchy’s inequality yields $\| S_Y \| lt.double X L^(- D_1 \/ 2)$. The $O_K \( L \)$ dyads and all fixed coefficient losses are absorbed by the choice of $D_1$. The logarithmic exponents used in that choice are independent of $K$; constants depending on $K$ affect only the implicit constant and threshold. This proves (10.5). ◻
]

We now construct a coefficient satisfying this criterion for $x^gamma$-rough integers. Its comparison weight comes from the continuous measure of products of large primes. For $w > gamma > 0$, define

#[#set math.equation(numbering: n => "(10.11)")
 $ D_gamma \( w \) & = sum_(j gt.eq 1) D_(gamma \, j) \( w \) \, #h(2em) D_(gamma \, 1) \( w \) = 1 / w \,\
D_(gamma \, j) \( w \) & = frac(1, j !) integral_(t_i gt.eq gamma med \( 1 lt.eq i < j \)\
sum_(i < j) t_i lt.eq w - gamma) frac(1, w - sum_(i < j) t_i) product_(i < j) frac(thin upright(d) t_i, t_i) quad \( j gt.eq 2 \) . $ <eq:rough-density-definition>]

The term with $j gt.eq 2$ is zero unless $w gt.eq j gamma$, so the sum is locally finite. This is the density of [20] Lemma 7.4.

Its normalization has an exact continuous meaning. For an interval $I$ whose closure is a compact subset of $\( x^gamma \, oo \)$, and each $j gt.eq 1$,

#[#set math.equation(numbering: n => "(10.12)")
 $ frac(1, j !) integral_(y_i > x^gamma\
product_i y_i in I) product_(i = 1)^j frac(thin upright(d) y_i, log y_i) = 1 / L integral_I D_(gamma \, j) \( log y \/ L \) thin thin upright(d) y . $ <eq:rough-density-pushforward>]

For $j = 1$, the integrands agree because $D_(gamma \, 1) \( log y \/ L \) \/ L = 1 \/ log y$. For $j gt.eq 2$, put $y = product_i y_i$, $t_i = log y_i \/ L$ for $i < j$, and $w = log y \/ L$. The change of variables gives

$ product_(i = 1)^j frac(thin upright(d) y_i, log y_i) = frac(thin upright(d) y, L) thin frac(product_(i < j) \( thin upright(d) t_i \/ t_i \), w - sum_(i < j) t_i) . $

The strict domain from $y_i > x^gamma$ differs from the weak simplex in (10.11) only on null boundaries. The factor $1 \/ j !$ divides the ordered prime-product measure by the number of permutations. This identity concerns the full domain $w > gamma$; the upper exponent restriction in the next proposition belongs to the Type II estimate, not to the density.

The functions in (10.11) are jointly continuous on compact subsets of $w > gamma > 0$, and, for fixed $gamma$, are Lipschitz in $w$ on each such compact interval. To check the assertion also at $w = j gamma$ for $j gt.eq 2$, write $s = w - j gamma$. For $s gt.eq 0$, the change of variables $t_i = gamma + s y_i$ gives

$ D_(gamma \, j) \( w \) = frac(s^(j - 1), j !) integral_(y_i gt.eq 0\
sum_(i < j) y_i lt.eq 1) frac(product_(i < j) thin upright(d) y_i, product_(i < j) \( gamma + s y_i \) #scale(x: 120%, y: 120%)[\(] gamma + s \( 1 - sum_(i < j) y_i \) #scale(x: 120%, y: 120%)[\)]) . $

Every denominator stays bounded away from zero on the indicated compact sets. The formula extended by zero for $s < 0$ has the claimed regularity; the term $1 \/ w$ is smooth. In particular $w D_gamma \( w \)$ has bounded total variation on each fixed compact interval above $gamma$. This variation bound will allow us to weight the high-frequency proxy estimate below, and joint continuity will control the upper Riemann sum in the least-prime-factor subtraction.

The character count proved below gives $D_gamma \( log m \/ L \) \/ L$ as the principal local density of the $x^gamma$-rough sequence, while the $W$-rough sequence has density $V \( W \)$. This explains the normalization of its comparison weight.

#prodef([Proposition 10.3.])[
  (A rough-factor Type II estimate).  #emph[Retain the marked data and all the hypotheses on $F \, beta \, H_m \, H_n$ of 29. Fix real numbers $0 < gamma < w_(-) < w_(+) < 1$, and suppose 
$ \[ log H_m \/ L \, log \( 2 H_m \) \/ L \] subset.eq \[ w_(-) \, w_(+) \] . $

 On an arbitrary interval $I subset.eq \[ H_m \, 2 H_m \]$, set 
#[#set math.equation(numbering: n => "(10.13)")
 $ alpha_m = m^(i v) (upright(bold(1))_(P^(-) \( m \) > x^gamma) - frac(D_gamma \( log m \/ L \), L V \( W \)) upright(bold(1))_(P^(-) \( m \) > W)) \, #h(2em) \| v \| lt.eq L^C \, $ <eq:rough-type-ii-coefficient>]

 and set $alpha_m = 0$ outside $I$. Then (10.5) holds for every fixed $D_(*) > 0$ when $K$ is sufficiently large in terms of the fixed data. Its required lower bound is independent of the particular band exponents $a_i$; the threshold and implicit constant may depend on all the fixed data. In particular, $gamma$ and the gap $w_(-) - gamma$ are fixed before $x$ grows.]
] <prop:rough-type-ii>

#proof[
  We verify (10.6) for this coefficient. At low frequencies the two principal counting terms cancel. At higher frequencies the prime-product sequence and the $W$-rough comparison sequence are each small. The support and size conditions of 30 will then follow directly from the coefficient formula.
  Put $M = H_m$ and write $R_gamma \( m \) = upright(bold(1))_(P^(-) \( m \) > x^gamma)$. On this dyad a number counted by $R_gamma$ has at most $J = floor.l w_(+) \/ gamma floor.r$ prime factors counted with multiplicity. Define
  $ T_gamma \( m \) = sum_(j = 1)^J frac(1, j !) sum_(p_1 \, dots.h \, p_j > x^gamma upright(" prime")\
p_1 dots.h.c p_j = m) 1 . $
  If $m$ is squarefree and $x^gamma$-rough, the ordered lists give $T_gamma \( m \) = 1$. If the prime multiplicities are $e_p$, the corresponding value is $1 \/ product_p e_p !$, which is at most one. Thus the difference is supported on a square of a prime exceeding $x^gamma$, and, uniformly for every subinterval of the dyad,
  #[#set math.equation(numbering: n => "(10.14)")
   $ sum_(M lt.eq m lt.eq 2 M) \| R_gamma \( m \) - T_gamma \( m \) \| lt.eq sum_(p > x^gamma) ⌊frac(2 M, p^2)⌋ lt.double M x^(- gamma) . $ <eq:rough-convolution-square-error>]
  The same bound holds after any character and real power twist. It is smaller than $M$ times every fixed negative power of $L$.
  We next obtain the counting formula needed at low frequencies. For every fixed $A_1 \, A_0 > 0$, every $k lt.eq L^(A_0)$, every character $chi med mod med k$, and every interval $I' subset.eq \[ M \, 2 M \]$, we claim
  #[#set math.equation(numbering: n => "(10.15)")
   $ sum_(m in I') R_gamma \( m \) chi \( m \) = upright(bold(1))_(chi upright(" principal")) 1 / L integral_(I') D_gamma \( log y \/ L \) thin upright(d) y + O \( M L^(- A_1) \) . $ <eq:rough-convolution-low-count>]
  The constant may depend on the displayed fixed parameters and on $gamma \, w_(-) \, w_(+)$, but the estimate is uniform in the interval and character.
  To prove it, split every prime variable of a term of $T_gamma$ into half-open dyads $\[ P_i \, 2 P_i \)$. All their scales satisfy $P_i gt.eq x^gamma \/ 2$ and $P_i lt.eq 2 M$. There are $O \( L^j \)$ possible boxes for the $j$-prime term. A box that meets the product interval has $M \/ 2^j lt.eq product_i P_i lt.eq 2 M$. On a prime dyad of scale $P$, the Siegel–Walfisz estimate, summed against $chi$ over its reduced classes, gives for every subinterval $J' subset.eq \[ P \, 2 P \]$
  #[#set math.equation(numbering: n => "(10.16)")
   $ sum_(p in J') chi \( p \) = upright(bold(1))_(chi upright(" principal")) integral_(J') frac(thin upright(d) y, log y) + O_(A_2) \( P L^(- A_2) \) $ <eq:rough-slot-siegel-walfisz>]
  with arbitrary fixed $A_2$. Indeed $log P asymp L$ with fixed comparison constants, and one chooses the Siegel–Walfisz accuracy to absorb the at most $L^(A_0)$ residue classes. This is the classical estimate in [22] Proposition 2.1. Taking differences of its endpoint estimates gives the absolute error in (10.16) even for an arbitrarily short subinterval. The cutoff $p > x^gamma$ can be intersected with that interval. For large $x$, these primes exceed $k$; hence the principal character is one on them. The same orthogonality argument covers imprimitive characters.
  Replace the prime measures in one box successively using (10.16). When all other variables are fixed, whether at prime values or at real values in a previous replacement, the product condition leaves an interval in the remaining prime dyad. Its error is $O \( P_i L^(- A_2) \)$. The total absolute mass of each other variable, either its prime counting measure or $thin upright(d) y \/ log y$, is $O \( P_h \)$. The error in that box is therefore $O \( M L^(- A_2) \)$. There are only the fixed $j$ replacements and $O \( L^j \)$ boxes, so their errors give $O \( M L^(- A_1) \)$ on choosing $A_2$ sufficiently large. A nonprincipal character has zero continuous main term. For a principal character the main term of the $j$-prime summand is exactly
  $ frac(1, j !) integral_(y_i > x^gamma\
product_i y_i in I') product_(i = 1)^j frac(thin upright(d) y_i, log y_i) . $
  By (10.12), these integrals sum to the principal main term in (10.15). Finally (10.14) absorbs repeated primes and proves the claim.
  The matching small-prime count is
  #[#set math.equation(numbering: n => "(10.17)")
   $ sum_(m in I'\
P^(-) \( m \) > W) chi \( m \) = upright(bold(1))_(chi upright(" principal")) V \( W \) \| I' \| + O \( M L^(- A_1) \) $ <eq:rough-small-prime-character-count>]
  for every fixed $A_1$, with the same interval and character uniformity. This is [21] Lemma 2.5. Notice that all prime divisors of $k lt.eq L^(A_0)$ are less than $W$ for large $x$, so its principal character is one on the rough support.
  Write $u = t + v$. Fix temporarily a constant $B_2 > C + 2$. If $\| t \| lt.eq L^(B_2)$, then $\| u \| lt.eq 2 L^(B_2)$. Partial summation in (10.15) against $y^(i u)$ costs at most $1 + O \( \| u \| \)$, since this is its total variation on a dyad. Partial summation in (10.17) against $D_gamma \( log y \/ L \) y^(i u) \/ \( L V \( W \) \)$ likewise has only a fixed logarithmic cost: $D_gamma$ is Lipschitz on the fixed interval and Mertens’ theorem gives $L V \( W \) asymp L^0.76$. The two resulting principal main terms are both
  $ 1 / L integral_I D_gamma \( log y \/ L \) y^(i u) thin upright(d) y \, $
  while both nonprincipal main terms vanish. Choosing $A_1$ after $B_2$ proves (10.6) with any fixed accuracy on this low-frequency range.
  For the remaining frequencies, use the long prime polynomial estimate [22] Lemma 3.1 and the corresponding bound for the small-prime proxy. For fixed $0 < tau_(upright("lp")) < theta_(upright("lp")) < 1$ and fixed $A_0 \, A_3 > 0$, the prime estimate gives a constant $B_0 = B_0 \( tau_(upright("lp")) \, theta_(upright("lp")) \, A_0 \, A_3 \)$ such that
  #[#set math.equation(numbering: n => "(10.18)")
   $ lr(|sum_(p in J') chi \( p \) p^(- 1 + i u)|) lt.double L^(- A_3) $ <eq:rough-slot-high>]
  for every interval $J' subset.eq \[ P \, 2 P \]$, every character modulo $k lt.eq L^(A_0)$, and
  $ x^(tau_(upright("lp"))) \/ 2 lt.eq P lt.eq x^(theta_(upright("lp"))) \, #h(2em) L^(B_0) lt.eq \| u \| lt.eq x^2 . $
  Choose $0 < tau_(upright("lp")) < gamma$ and $w_(+) < theta_(upright("lp")) < 1$. Every prime dyad in the finite convolution lies in this scale range for sufficiently large $x$. Partial summation changes the reciprocal weight in (10.18) to give $lr(|sum_(p in J') chi \( p \) p^(i u)|) lt.double P L^(- A_3)$. In each box of the convolution, fix all but one prime; the remaining product restriction is again an arbitrary interval. This bound in that one slot and trivial bounds in the other slots give $O \( M L^(- A_3) \)$ per box. Taking $A_3$ to absorb the $O \( L^j \)$ boxes and using (10.14) proves any requested logarithmic saving for $M^(- 1) sum_(m in I) R_gamma \( m \) chi \( m \) m^(i u)$ throughout this range.
  For the proxy, the proof of [21] Lemma 5.2 gives the following uniform estimate. Put $T_(*) = exp \( L \/ \( log L \)^2 \)$. For every interval $I' subset.eq \[ M \, 2 M \]$, and with arbitrary fixed $A_4$, it states
  #[#set math.equation(numbering: n => "(10.19)")
   $ lr(|frac(1, M V \( W \)) sum_(m in I'\
P^(-) \( m \) > W) frac(chi \( m \) m^(i u), log m)|) lt.double L^(- A_4) +  cases(delim: "{", L^(C_0) \( \| u \|^(- 1) + x^(- c_0) \) \, & 1 lt.eq \| u \| lt.eq T_(*) \,, L^(C_0) exp \( - L \/ \( log L \)^(C_3) \) \, & T_(*) lt.eq \| u \| < x^2 .) $ <eq:rough-high-source>]
  Here $C_0 \, c_0 > 0$ are fixed after $A_0 \, delta$, and $C_3 > 0$ is absolute; $C_0$ does not grow with $A_4$. The second range uses the logarithmic-phase estimate of [22] Lemma 3.3, valid for arbitrary residue classes and subintervals. The first follows in the cited proof of the long-coefficient lemma by comparison with the integral of $y^(i u)$ on each progression.
  For $w = log m \/ L$, the coefficient of the proxy can be written
  $ frac(D_gamma \( w \), L V \( W \)) = frac(w D_gamma \( w \), V \( W \) log m) . $
  The multiplier $w D_gamma \( w \)$ is bounded and has bounded total variation on our fixed interval. Since (10.19) holds on every subinterval, one more partial summation proves that same bound for the proxy coefficient. Choose the requested accuracy first, then $A_3 \, A_4$ and the corresponding $B_0$, and finally take
  $ B_2 > max { C + 2 \, med B_0 + 2 \, med A + C_0 + 2 } . $
  When $L^(B_2) lt.eq \| t \| lt.eq 2 X L^B$, one has $\| u \| asymp \| t \|$, $\| u \| gt.eq L^(B_0)$, and $\| u \| lt.eq 2 X L^B + L^C < x^2$ for large $x$. The prime convolution and (10.19) therefore give the saving $L^(- A)$ for the two parts separately. The complementary range $\| t \| lt.eq L^(B_2)$, including $t$ near $- v$, was already handled by cancellation of their low-frequency main terms. This covers every $\| t \| lt.eq 2 X L^B$; the conjugated assertion then follows as in 30.
  Finally, $x^gamma > W$ for large $x$, and $D_gamma$ is bounded on our fixed interval. Since $L V \( W \) asymp L^0.76$, both parts of (10.13) are bounded and supported on $W$-rough integers. Thus the support, size, and long-coefficient hypotheses of 30 all hold. Applying that lemma proves (10.5) and the proposition. ◻
]

== 11 Two elementary sieve facts <sec:sieve>

The prime construction needs two elementary facts. The first estimates the mass left after excluding local divisibility conditions, with an explicit bound on the moduli in the error term. The second identifies the density removed when a least prime factor is selected. We give proofs, following the forms in [20] Lemmas 2.9 and 7.4.

=== 11.1 A block sieve with bounded coefficients <a-block-sieve-with-bounded-coefficients>

The advantage of the following form of the Brun–Hooley sieve is that its remainders occur without divisor weights. Its underlying product inequalities are those of Ford and Halberstam [6] Section 1, Lemma 1.

#prodef([Lemma 11.1.])[
  (Block sieve).  #emph[Let $cal(A)$ be a finite set with nonnegative weights, and let $cal(P)$ be a set of primes at most $z$, where $z gt.eq 2$. For each $p in cal(P)$, specify a bad condition on $cal(A)$. Suppose that, for every squarefree product $d$ of primes in $cal(P)$, the weight of the objects satisfying all conditions at $p divides d$ is 
$ A \( d \) = X' g \( d \) + E \( d \) \, $

 including $d = 1$, where $X' gt.eq 0$, $g \( 1 \) = 1$, and $g$ is multiplicative. Assume that, for fixed constants $eta_0 > 0$ and $C_0 < oo$, 
#[#set math.equation(numbering: n => "(11.1)")
 $ 0 lt.eq g \( p \) lt.eq 1 - eta_0 \, #h(2em) sum_(v < p lt.eq v^2\
p in cal(P)) g \( p \) lt.eq C_0 quad \( v > 1 \) . $ <eq:block-hypotheses>]

 For every sufficiently large even integer $H$, the weight $S$ of objects avoiding all the bad conditions satisfies 
#[#set math.equation(numbering: n => "(11.2)")
 $ S = X' product_(p in cal(P)) \( 1 - g \( p \) \) #scale(x: 120%, y: 120%)[\(] 1 + O \( exp \( - H \) \) #scale(x: 120%, y: 120%)[\)] + O (sum_(d lt.eq z^(4 H + 2)\
d divides product_(p in cal(P)) p) \| E \( d \) \|) . $ <eq:block-sieve>]

 The constants and the lower bound on $H$ depend only on $eta_0 \, C_0$. In particular, the estimate is uniform when $H$ grows. For $H = 2$ there is the upper bound 
#[#set math.equation(numbering: n => "(11.3)")
 $ S lt.double_(eta_0 \, C_0) X' product_(p in cal(P)) \( 1 - g \( p \) \) + sum_(d lt.eq z^10\
d divides product_(p in cal(P)) p) \| E \( d \) \| . $ <eq:block-sieve-upper>]

]
] <lem:block>

#proof[
  Write $b_p in { 0 \, 1 }$ for the indicator of the bad condition at $p$. Use the blocks
  $ cal(B)_j = { p in cal(P) : z^(2^(- j - 1)) < p lt.eq z^(2^(- j)) } \, #h(2em) j gt.eq 0 \, $
  ignoring empty blocks and retaining the indicated indices. Put $h_j = \( j + 1 \) H$. Let $I_j$ be the indicator of avoiding the conditions in $cal(B)_j$. Define $U_j$ to be the inclusion–exclusion polynomial through degree $h_j$, and $T_j$ to be the sum of the unsigned degree-$h_j + 1$ inclusion–exclusion terms:
  $ U_j = sum_(J subset.eq cal(B)_j\
\| J \| lt.eq h_j) \( - 1 \)^(\| J \|) product_(p in J) b_p \, #h(2em) T_j = sum_(J subset.eq cal(B)_j\
\| J \| = h_j + 1) product_(p in J) b_p . $
  If exactly $t$ conditions in the block hold, then, since $h_j$ is even,
  $ U_j = sum_(a = 0)^(h_j) \( - 1 \)^a binom(t, a) = cases(delim: "{", 1 \, & t = 0 \,, binom(t - 1, h_j) \, & t gt.eq 1 .) $
  As usual, a binomial coefficient vanishes when its lower index exceeds its nonnegative upper index. Thus $0 lt.eq I_j lt.eq U_j$ and $U_j - I_j lt.eq T_j$. Telescoping the product, all of whose factors are nonnegative, gives
  $ 0 lt.eq product_j U_j - product_j I_j lt.eq sum_j T_j product_(k eq.not j) U_k . $
  Consequently the polynomials
  #[#set math.equation(numbering: n => "(11.4)")
   $ U = product_j U_j \, #h(2em) B = U - sum_j T_j product_(k eq.not j) U_k $ <eq:block-polynomials>]
  satisfy $B lt.eq upright(bold(1))_(upright("no bad condition")) lt.eq U$.
  Every monomial in $U$ has degree at most $h_j$ in block $j$. A monomial in correction $j$ has degree exactly $h_j + 1$ there and degree at most $h_k$ in every other block. Hence the supports of the corrections are disjoint from one another and from the support of $U$. All coefficients of both $B$ and $U$ therefore have absolute value at most one. The prime product indexing a monomial of $U$ has logarithm at most
  $ log z sum_(j gt.eq 0) \( j + 1 \) H 2^(- j) = 4 H log z . $
  A correction adds at most $log z$, so every monomial used is supported on a squarefree $d lt.eq z^(4 H + 2)$.
  It remains to evaluate the main terms of these polynomials. Give the indicators $b_p$ independent Bernoulli laws with means $g \( p \)$, and write $bb(E)$ for expectation under this auxiliary law. By (11.1), each block has total mean at most $C_0$. Its avoidance probability satisfies
  $ a_j := bb(E) I_j = product_(p in cal(B)_j) \( 1 - g \( p \) \) gt.eq exp \( - C_0 \/ eta_0 \) = : a_(*) > 0 \, $
  because $- log \( 1 - u \) lt.eq u \/ eta_0$ for $0 lt.eq u lt.eq 1 - eta_0$. Moreover,
  $ t_j := bb(E) T_j lt.eq frac(C_0^(h_j + 1), \( h_j + 1 \) !) \, #h(2em) a_j lt.eq bb(E) U_j lt.eq a_j + t_j . $
  The factorial bound implies
  $ R_H := sum_j t_j / a_j lt.double_(eta_0 \, C_0) exp \( - H \) $
  for all sufficiently large even $H$: for sufficiently large $n$, $C_0^n \/ n ! lt.eq exp \( - 2 n \)$, and $h_j = \( j + 1 \) H$. For $H = 2$, the same sum is bounded in terms of $eta_0 \, C_0$. Independence of the blocks now yields
  $ product_j a_j lt.eq bb(E) U lt.eq product_j a_j exp \( R_H \) \, #h(2em) bb(E) \( U - B \) lt.eq product_j a_j R_H exp \( R_H \) . $
  Thus both bounding polynomials have expectation $product_j a_j \( 1 + O \( exp \( - H \) \) \)$ when $H$ is sufficiently large; for $H = 2$, the upper expectation is $O \( product_j a_j \)$.
  Finally evaluate $U$ and $B$ in the original weighted set. Multiplicativity makes their main terms $X' bb(E) U$ and $X' bb(E) B$. The coefficient and support bounds show that each error is at most the sum of $\| E \( d \) \|$ in (11.2). Squeezing $S$ between the two weighted polynomial sums proves both assertions. ◻
]

=== 11.2 Rough-number densities <rough-number-densities>

Recall the density $D_gamma \( s \)$ from (10.11). Its $j$th term describes a product of $j$ primes whose logarithms, in units of $log x$, sum to $s$ and are at least $gamma$; the factor $1 \/ j !$ normalizes the ordered prime lists. These are Buchstab’s rough-number densities, expressed in logarithmic coordinates. The identity below is the corresponding least-prime-factor decomposition [4]. The normalization and regularity were established in Section 10; we now prove the two estimates needed to subtract composite mass.

For the product $V \( y \)$ in (10.1), Mertens’ theorem gives

#[#set math.equation(numbering: n => "(11.5)")
 $ V \( y \) tilde.op frac(exp \( - gamma_E \), log y) \, $ <eq:mertens-product>]

where $gamma_E$ is Euler’s constant.

#prodef([Lemma 11.2.])[
  (Rough-number density).  #emph[For $0 < b < 1 \/ 2$, 
#[#set math.equation(numbering: n => "(11.6)")
 $ integral_b^(1 \/ 2) D_t \( 1 - t \) thin frac(d t, t) = D_b \( 1 \) - 1 \, $ <eq:density-identity>]

 where the integrand at $1 \/ 2$ is interpreted by its left limit. There are absolute constants $b_0 \, c_d \, C_d > 0$ such that, for $0 < b < b_0$, 
#[#set math.equation(numbering: n => "(11.7)")
 $ D_b \( 1 \) lt.eq frac(exp \( - gamma_E \), b) #scale(x: 120%, y: 120%)[\(] 1 + C_d exp \( - c_d \/ b \) #scale(x: 120%, y: 120%)[\)] . $ <eq:density-upper>]

 One may take $c_d = 1 \/ 20$.]
] <lem:density>

#proof[
  To prove (11.6), write a term of $D_b \( 1 \)$ with $j gt.eq 2$ as an integral on
  $ t_1 + dots.h.c + t_j = 1 \, #h(2em) t_i gt.eq b \, #h(2em) frac(1, j !) frac(d t_1 dots.h.c d t_(j - 1), t_1 dots.h.c t_j) . $
  This measure is invariant under permutations of the $j$ coordinates: interchanging a dependent and an independent coordinate has absolute Jacobian one. Except on a set of measure zero, the minimum coordinate is unique. Choose it in $j$ ways and call its value $t$. The remaining $j - 1$ coordinates sum to $1 - t$ and are at least $t$; their measure is the $\( j - 1 \)$-factor term of $D_t \( 1 - t \)$, multiplied by $d t \/ t$, since $j \/ j ! = 1 \/ \( j - 1 \) !$. Necessarily $t lt.eq 1 \/ 2$. Summing over $j gt.eq 2$ proves the identity; the omitted one-prime term of $D_b \( 1 \)$ equals $1$.
  For (11.7), we compare $D_b \( 1 \)$ with ordinary rough integers and then apply Lemma 32. Fix $b > 0$, put $L = log x$, and let
  $ R_b \( x \) = \# { n in bb(N) : x < n lt.eq 2 x \, med P^(-) \( n \) > x^b } . $
  We first claim that
  #[#set math.equation(numbering: n => "(11.8)")
   $ D_b \( 1 \) lt.eq liminf_(x arrow.r oo) L / x R_b \( x \) . $ <eq:density-rough-lower>]
  For $j gt.eq 2$ and fixed $eta > 0$, count ordered prime lists $\( p_1 \, dots.h \, p_j \)$ with weight $1 \/ j !$, subject to
  $ p_i > x^b quad \( i < j \) \, #h(2em) Q := p_1 dots.h.c p_(j - 1) < x^(1 - b - eta) \, #h(2em) x \/ Q < p_j lt.eq 2 x \/ Q . $
  Every product counted is in $R_b \( x \)$, because $p_j > x^(b + eta)$. An integer with prime multiplicities $e_1 \, e_2 \, dots.h$ receives total weight at most $1 \/ product_i e_i ! lt.eq 1$, even when prime factors repeat. Its total number of prime factors also determines $j$. Thus summing these counts over $j$, together with the one-prime contribution, gives a lower bound for $R_b \( x \)$.
  Uniformly in the indicated range of $Q$, the prime number theorem gives
  $ \# { p_j : x \/ Q < p_j lt.eq 2 x \/ Q } = \( 1 + o \( 1 \) \) frac(x, Q log \( x \/ Q \)) . $
  For fixed $0 < alpha < beta$, Mertens’ theorem gives
  $ sum_(x^alpha < p lt.eq x^beta) 1 / p arrow.r log \( beta \/ alpha \) . $
  Consequently the reciprocal-prime measures on any fixed compact interval of positive logarithmic exponents converge to $d t \/ t$. Their finite products converge as well. On the truncated simplex $t_i gt.eq b$, $sum_(i < j) t_i < 1 - b - eta$, the function $\( 1 - sum_(i < j) t_i \)^(- 1)$ is bounded, and its boundary has measure zero. The weighted count above, multiplied by $L \/ x$, therefore tends to
  $ frac(1, j !) integral_(t_i gt.eq b med \( i < j \)\
sum_(i < j) t_i < 1 - b - eta) frac(1, 1 - sum_(i < j) t_i) product_(i < j) frac(d t_i, t_i) . $
  There are only finitely many relevant $j$ for fixed $b$. The one-prime contribution tends to $1$. First let $x$ tend to infinity with $b \, eta$ fixed, and then let $eta$ decrease to zero. The boundary hyperplanes are null, so these integrals increase to the terms in $D_b \( 1 \)$. This proves (11.8).
  For the upper bound on $R_b \( x \)$, apply Lemma 32 to the integers in $\( x \, 2 x \]$, with bad conditions $p divides n$ for $p lt.eq z = x^b$. Here $X' = x$, $g \( d \) = 1 \/ d$, and $E \( d \) = O \( 1 \)$, uniformly in $d$. The hypotheses hold with absolute constants: $g \( p \) lt.eq 1 \/ 2$, and the sums of $1 \/ p$ over $\( v \, v^2 \]$ are bounded. Choose
  $ H = 2 ⌊frac(1, 40 b)⌋ . $
  For sufficiently small $b$, this is an admissible even integer, $H gt.double 1 \/ b$, and $b \( 4 H + 2 \) lt.eq 1 \/ 5 + 2 b < 1$. Lemma 32 gives, with absolute implied constants,
  $ R_b \( x \) lt.eq x V \( x^b \) #scale(x: 120%, y: 120%)[\(] 1 + O \( exp \( - c \/ b \) \) #scale(x: 120%, y: 120%)[\)] + O #scale(x: 120%, y: 120%)[\(] x^(1 \/ 5 + 2 b) #scale(x: 120%, y: 120%)[\)] $
  with $c = 1 \/ 20$, since $exp \( - H \) lt.eq upright(e)^2 exp \( - 1 \/ \( 20 b \) \)$. Multiplying by $L \/ x$, applying (11.5), and letting $x$ tend to infinity proves (11.7) by (11.8). ◻
]

The term $1$ in (11.6) is the one-prime contribution. The integral accounts for the composite contributions by selecting their least prime factor. This is the cancellation that will leave a positive prime mass in the construction below.

== 12 Primes with a controlled predecessor in a fixed progression <sec:prime-construction>

We prove Proposition 3. Fix its data $M \, c \, u$, so

#[#set math.equation(numbering: n => "(12.1)")
 $ M equiv 0 med \( mod med 8 \) \, #h(2em) c in { 2 \, 4 } \, #h(2em) \( u \, M \) = 1 \, #h(2em) c divides u - 1 \, #h(2em) (frac(u - 1, c) \, M / c) = 1 . $ <con:progression>]

We first assign nonnegative weights to integers $d = c r Q + 1$ in the specified progression. A lower sieve bound supplies integers with no small prime factor. The marked Type II estimate then allows us to bound the mass of composites according to their least prime factor. Factors close to the square root require a separate upper sieve bound. Keeping the constant in that last bound independent of the number of marks will permit the final parameter choices.

=== 12.1 The weights and the Type II estimate <the-weights-and-the-type-ii-estimate>

Use the parameters $L \, W \, V$, the prime groups $cal(P)_i$, and the marks $cal(W)$ of (10.1), (10.2), and (10.4), with $q = 1 \/ 2$. All prime-indexed sums and products below are over rational primes. The integer $K gt.eq 1$ and exponents $0.1 < a_1 < dots.h.c < a_K < 0.2$ are fixed before $x$ grows; their eventual choice will follow the other sieve parameters. The groups are disjoint for large $x$, and Mertens’ theorem gives $V_i = log 2 + o \( 1 \)$. Their primes are then coprime to $M$ and lie in $\( exp \( L^0.1 \) \, exp \( L^0.3 \) \)$.

The factor $omega_i \( h \)$ counts choices of a prime divisor of $h$ from the $i$th group. Thus $cal(W) \( h \)$ vanishes unless every group contributes, while $omega_i \( h \) 2^(1 - omega_i \( h \))$ remains bounded when several primes from one group divide $h$. These choices are the marks in the Type II estimate below.

Call a positive integer a #emph[group integer] if all its prime divisors belong to $union.big_i cal(P)_i$, and include $1$. Use the complete group-prime part $h_(cal(P))$ defined in (10.3). Fix a smooth function $Psi$ compactly supported in $\( 1 \, 2 \)$, with $0 lt.eq Psi lt.eq 1$ and $integral Psi > 0$, and define

#[#set math.equation(numbering: n => "(12.2)")
 $ F \( h \) & = upright(bold(1))_({ h \/ h_(cal(P)) = c Q upright(" for a prime ") Q > x^0.9 }) \,\
w \( d \) & = upright(bold(1))_({ d equiv u med \( mod med M \) }) Psi \( d \/ x \) F \( d - 1 \) cal(W) \( d - 1 \) #h(2em) \( d gt.eq 2 \) . $ <con:weight>]

Set $w \( 1 \) = 0$. Since $\( p h \)_(cal(P)) = p h_(cal(P))$ for every group prime $p$, including when $p divides h$, we have

#[#set math.equation(numbering: n => "(12.3)")
 $ F \( p h \) = F \( h \) #h(2em) \( h gt.eq 1 \, med p in union.big_i cal(P)_i \) . $ <con:invariance>]

On the support of $w$, the representation $d = c r Q + 1$ is unique: $r = \( d - 1 \)_(cal(P))$, since neither $c$ nor $Q$ has a group prime factor. In particular,

#[#set math.equation(numbering: n => "(12.4)")
 $ r lt.eq x^0.11 \, #h(2em) cal(W) \( d - 1 \) = cal(W) \( r \) \, #h(2em) 0 lt.eq w \( d \) lt.eq B_K $ <con:support>]

for a constant $B_K$. The last assertion follows from $j 2^(1 - j) lt.eq 1$ for each integer $j gt.eq 1$; in fact $0 lt.eq cal(W) \( h \) lt.eq B_K$ for every $h gt.eq 1$.

Write $X_0 = sum_d w \( d \)$ for the total mass. Our aim is to prove that the prime mass is $gt.double X_0 \/ L$, while $X_0 gt.double x \/ L$. The bound $w lt.eq B_K$ will then give the required count of primes. The marked estimate supplies the comparison needed to subtract composite mass.

Use the rough-number density $D_gamma \( s \)$ from (10.11). For fixed $gamma > 0$ and integers $m > x^gamma$, put

#[#set math.equation(numbering: n => "(12.5)")
 $ R_gamma \( m \) = upright(bold(1))_({ P^(-) \( m \) > x^gamma }) \, #h(2em) B_gamma \( m \) = frac(D_gamma \( log m \/ L \), L V \( W \)) upright(bold(1))_({ P^(-) \( m \) > W }) . $ <con:proxies>]

We will replace $R_gamma$ by $B_gamma$ inside sums weighted by $w \( m n \)$: the factor $D_gamma \/ \( L V \( W \) \)$ compensates for retaining only $W$-roughness. Lemma 30 and the character-transform bound proved in Proposition 31 permit this replacement after the fixed congruence is expanded in characters. We verify that application next. All Dirichlet characters retain the zero extension off the units used in Section 10.

#prodef([Lemma 12.1.])[
  (Type II estimate in the progression).  #emph[Fix $delta > 0$ and $0 < gamma < s_(-) < s_(+) < 1$. Let $H_m \, H_n gt.eq x^delta$, with $X = H_m H_n asymp x$ and fixed comparison constants, and let $I subset.eq \[ H_m \, 2 H_m \]$ be an interval. Suppose 
#[#set math.equation(numbering: n => "(12.6)")
 $ \[ log H_m \/ L \, log \( 2 H_m \) \/ L \] subset.eq \[ s_(-) \, s_(+) \] . $ <con:exponent-range>]

 Let $\| b_n \| lt.eq 1$ be supported on $W$-rough integers in $\[ H_n \, 2 H_n \]$. For sufficiently large $K$, 
#[#set math.equation(numbering: n => "(12.7)")
 $ lr(|sum_(m in I \, n) #scale(x: 120%, y: 120%)[\(] R_gamma \( m \) - B_gamma \( m \) #scale(x: 120%, y: 120%)[\)] b_n w \( m n \)|) lt.double X L^(- 6) . $ <con:type-ii-bound>]

 This is uniform in the dyads, interval, and coefficients. The lower bound on $K$ is independent of the $a_i$. Constants and thresholds may depend on all fixed parameters, including the band exponents.]
] <con:type-ii>

#proof[
  The congruence in $w$ cannot be incorporated into $F$ while preserving (12.3). Instead, character orthogonality and $\( u \, M \) = 1$ give
  $ upright(bold(1))_({ m n equiv u med \( mod med M \) }) = frac(1, phi \( M \)) sum_(lambda med mod med M) overline(lambda \( u \)) lambda \( m \) lambda \( n \) . $
  By the proof of Proposition 31, the sequence $alpha_m = upright(bold(1))_I \( m \) m^(i v) \( R_gamma \( m \) - B_gamma \( m \) \)$ satisfies (10.6) for every fixed $A_0 \, B \, A \, C > 0$, every character of modulus at most $L^(A_0)$, and every $\| t \| lt.eq 2 X L^B$, uniformly for $\| v \| lt.eq L^C$ and every interval $I$ under the present fixed exponent hypotheses. If $alpha$ satisfies that bound, so does $alpha_m lambda \( m \)$: the product $lambda chi$, with its zero extension, is a character modulo $"lcm" \( M \, k \)$, which is at most $M L^(A_0) lt.eq L^(A_0 + 1)$ for large $x$.
  To separate the smooth factor, write
  $ hat(psi) \( v \) = frac(1, 2 pi) integral_(bb(R)) Psi \( upright(e)^s \) upright(e)^(- i v s) thin d s . $
  Fourier inversion yields
  $ Psi \( m n \/ x \) = integral_(bb(R)) hat(psi) \( v \) x^(- i v) m^(i v) n^(i v) thin d v . $
  For $\| v \| lt.eq L$, apply Lemma 30 to the invariant function $F$ in (12.2), with $C = 2$, $D_(*) = 6$, and
  $ alpha_m = m^(i v) lambda \( m \) \( R_gamma \( m \) - B_gamma \( m \) \) \, #h(2em) beta_n = b_n lambda \( n \) n^(i v) . $
  Here the formula for $alpha_m$ applies on $I$, and $alpha_m = 0$ elsewhere. Both sequences are $W$-rough and bounded by $L^2$ for large $x$: $x^gamma > W$, $D_gamma$ is bounded on the fixed exponent interval, and $L V \( W \) asymp L^0.76$. The finite number of characters is fixed with $M$. The integral of $\| hat(psi) \|$ is finite, whereas its tail beyond $L$ is $O_A \( L^(- A) \)$ for every fixed $A$. On that tail the bilinear sum is $O_K \( X \)$ by (12.4). Integration proves (12.7). ◻
]

All parameters in the remainder of the section are fixed before $x$ tends to infinity. Unless an independence is explicitly asserted, constants, thresholds, and rates of convergence may depend on those fixed parameters. The estimates are valid for arbitrary fixed marks, subject to the lower bounds on $K$ in the Type II applications. We will choose the parameters together at the end.

=== 12.2 Mass and distribution in progressions <mass-and-distribution-in-progressions>

Let $r$ range over group integers, and define

#[#set math.equation(numbering: n => "(12.8)")
 $ J_0 & = sum_r frac(cal(W) \( r \), r) \,\
A_r & = sum_(Q > x^0.9 upright(" prime")\
c r Q + 1 equiv u med \( mod med M \)) Psi \( \( c r Q + 1 \) \/ x \) \, #h(2em) X_0 = sum_d w \( d \) = sum_r cal(W) \( r \) A_r . $ <con:mass-definitions>]

We shall show that $X_0$ is of order $x J_0 \/ L$, and that the family at each small $r$ has enough distribution to apply the block sieve. The harmonic sum makes this possible without constants depending on the pointwise bound $B_K$.

#prodef([Lemma 12.2.])[
  (Harmonic mass).  #emph[For each group put 
$ E_i \( t \) = product_(p in cal(P)_i) (1 + frac(t, p - 1)) . $

 The harmonic mass has the exact Euler-product expression 
#[#set math.equation(numbering: n => "(12.9)")
 $ J_0 & = product_(i = 1)^K frac(E'_i \( 1 \/ 2 \), V_i)\
 & = product_(i = 1)^K {frac(E_i \( 1 \/ 2 \), V_i) sum_(p in cal(P)_i) frac(1, p - 1 + 1 \/ 2)} . $ <con:harmonic-identity>]

 For every fixed $epsilon > 0$, 
#[#set math.equation(numbering: n => "(12.10)")
 $ 1 lt.eq J_0 lt.double_K 1 \, #h(2em) sum_(r > x^epsilon) frac(cal(W) \( r \), r) lt.double_K exp \( - epsilon L^(1 - a_K) \) . $ <con:harmonic-bounds>]

 Consequently the part of $X_0$ with $r > x^epsilon$ is $O_K \( x exp \( - epsilon L^(1 - a_K) \) \)$.]
] <con:harmonic>

#proof[
  At a prime $p$, summing over its positive exponents contributes $sum_(j gt.eq 1) p^(- j) = 1 \/ \( p - 1 \)$. Consequently $E_i \( t \)$ is the harmonic generating function for integers supported on the $i$th group, with $t$ recording their number of distinct prime factors. Differentiating its finite product and evaluating at $t = 1 \/ 2$ inserts the factor $omega_i \( r \) \( 1 \/ 2 \)^(omega_i \( r \) - 1)$. The groups are disjoint, so multiplying these marked sums and dividing by $product_i V_i$ proves (12.9).
  Integers with one prime, to exponent one, from each group contribute
  $ product_(i = 1)^K (V_i^(- 1) sum_(p in cal(P)_i) p^(- 1)) = 1 $
  to $J_0$. For the upper bound and tail put $s = L^(- a_K)$. Every group prime satisfies $p^s lt.eq upright(e)^2$, so, for large $x$,
  $ sum_(j gt.eq 1) p^(- j \( 1 - s \)) lt.eq frac(2 upright(e)^2, p) . $
  Bounding the mark by $B_K$ and multiplying the geometric series over group primes gives
  $ sum_r frac(cal(W) \( r \), r^(1 - s)) lt.double_K 1 \, $
  since $sum_i V_i lt.double K$. Multiplication by $x^(- epsilon s)$ on $r > x^epsilon$ proves the tail. Finally, $A_r lt.double x \/ r$ by counting integers in the interval for $Q$ whenever $A_r eq.not 0$; otherwise the bound is immediate. ◻
]

Take temporarily

#[#set math.equation(numbering: n => "(12.11)")
 $ 0 < kappa < 0.01 \, #h(2em) 0 < epsilon < kappa \, #h(2em) 0 < b < 0.01 \, #h(2em) D = x^(1 \/ 2 - kappa \/ 2) . $ <con:small-parameters>]

For an odd squarefree integer $ell$, let $A_r \( ell \)$ denote the sum defining $A_r$ with the additional condition $ell divides c r Q + 1$, and set

#[#set math.equation(numbering: n => "(12.12)")
 $ g_r \( ell \) = frac(upright(bold(1))_({ \( ell \, M r \) = 1 }), phi \( ell \)) \, #h(2em) E_r \( ell \) = A_r \( ell \) - g_r \( ell \) A_r . $ <con:local-density>]

In particular, $g_r \( 1 \) = 1$ and $E_r \( 1 \) = 0$.

#prodef([Lemma 12.3.])[
  (Distribution of the weighted family).  #emph[For every fixed $A > 0$, 
#[#set math.equation(numbering: n => "(12.13)")
 $ sum_(r lt.eq x^epsilon) cal(W) \( r \) sum_(ell lt.eq D\
ell upright(" odd squarefree")) \| E_r \( ell \) \| lt.double x J_0 L^(- A) . $ <con:bv-sum>]

 Moreover, writing $A_Psi = integral_1^2 Psi \( y \) thin d y$, we have 
#[#set math.equation(numbering: n => "(12.14)")
 $ X_0 tilde.op frac(x J_0 A_Psi, c phi \( M \/ c \) L) #h(2em) \( x arrow.r oo \) \, $ <con:mass-asymptotic>]

 with all construction parameters fixed and $J_0 = J_0 \( x \)$. In particular, 
#[#set math.equation(numbering: n => "(12.15)")
 $ X_0 asymp_(M \, Psi) frac(x J_0, L) \, $ <con:total-mass>]

 with comparison constants independent of $K \, kappa \, epsilon \, b$.]
] <con:distribution>

#proof[
  Put $N = M \/ c$. For $r lt.eq x^epsilon$, the support of $Psi$ makes $Q > x^0.9$ automatic. The progression for $d$ is equivalent to the reduced class
  $ Q equiv frac(u - 1, c) thin r^(- 1) med \( mod med N \) . $
  If $\( ell \, M r \) > 1$, then $A_r \( ell \) = g_r \( ell \) = 0$. Otherwise the additional condition is $Q equiv - \( c r \)^(- 1) med \( mod med ell \)$, and the two classes combine to one reduced class modulo $N ell$.
  We use the prime-counting form of the Bombieri–Vinogradov theorem [3,29]: for fixed $A' \, eta > 0$,
  #[#set math.equation(numbering: n => "(12.16)")
   $ sum_(q < Y^(1 \/ 2 - eta)) max_(\( v \, q \) = 1) lr(|pi \( Y \; q \, v \) - frac("Li" \( Y \), phi \( q \))|) lt.double_(A' \, eta) Y \( log Y \)^(- A') . $ <con:bv-input>]
  Here $"Li" \( Y \) = integral_2^Y d t \/ log t$. Uniformly for $r lt.eq x^epsilon$ and $Y asymp x \/ \( c r \)$, the moduli $N ell$, $ell lt.eq D$, lie in this range. Indeed, with $eta = \( kappa - epsilon \) \/ 4$,
  $ \( 1 - epsilon \) \( 1 \/ 2 - eta \) - \( 1 \/ 2 - kappa \/ 2 \) = frac(\( kappa - epsilon \) \( 1 + epsilon \), 4) > 0 \, $
  which also absorbs the fixed factor $N$.
  Define
  $ I_r = frac(x, c r) integral_1^2 frac(Psi \( y \), log \( \( x y - 1 \) \/ \( c r \) \)) thin d y . $
  For every fixed $0 < theta < 0.1$, the support of $Psi$ forces $Q > x^0.9$ whenever $r lt.eq x^theta$. The prime number theorem in the fixed reduced progressions modulo $N$, followed by partial summation, therefore gives, for every fixed $A > 0$,
  #[#set math.equation(numbering: n => "(12.17)")
   $ A_r = frac(I_r, phi \( N \)) + O_(A \, M \, Psi) #scale(x: 120%, y: 120%)[\(] \( x \/ r \) L^(- A) #scale(x: 120%, y: 120%)[\)] #h(2em) \( r lt.eq x^theta \) . $ <con:fixed-r-mass>]
  The class varies with $r$, but $N$ is fixed and every class is reduced. The implied constant is independent of $theta$, although the threshold for the automatic cutoff may depend on $theta$. This single-modulus estimate thus holds throughout $0 < theta < 0.1$; the restriction $epsilon < kappa$ is needed for the joint modulus estimate that follows.
  Partial summation in (12.16) yields
  #[#set math.equation(numbering: n => "(12.18)")
   $ sum_(ell lt.eq D\
ell upright(" odd squarefree")) lr(|A_r \( ell \) - frac(g_r \( ell \), phi \( N \)) I_r|) lt.double_(A') x / r L^(- A') . $ <con:smoothed-bv>]
  To check the smoothing uniformly, integrate the progression remainder against the derivative of $Psi \( \( c r t + 1 \) \/ x \)$. Its total absolute integral is $integral \| Psi' \( y \) \| thin d y$, independently of $r$, and all integration points have $t asymp x \/ \( c r \)$. The moduli $N ell$ are distinct, and the maximum in (12.16) covers their varying residue classes.
  The term $ell = 1$ of (12.18) evaluates $A_r$. Replacing $I_r \/ phi \( N \)$ by $A_r$ in the other terms costs at most one logarithmic factor, because
  $ sum_(ell lt.eq D) g_r \( ell \) lt.eq sum_(ell lt.eq D) frac(1, phi \( ell \)) lt.double L . $
  For example, expand $n \/ phi \( n \) = sum_(d divides n) mu^2 \( d \) \/ phi \( d \)$ and use $sum_d mu^2 \( d \) \/ \( d phi \( d \) \) < oo$. Choosing $A'$ sufficiently large gives $sum_(ell lt.eq D) \| E_r \( ell \) \| lt.double \( x \/ r \) L^(- A)$; summing with the marks proves (12.13).
  On the support of $Psi$, for $r lt.eq x^epsilon$ the logarithm in $I_r$ is comparable to $L$, with absolute comparison constants since $epsilon < 0.01$ and $c in { 2 \, 4 }$. Thus $I_r asymp_Psi x \/ \( r L \)$. Summing the evaluation of $A_r$ and using Lemma 35 proves (12.15). The tail divided by $x J_0 \/ L$ tends to zero since $J_0 gt.eq 1$. Although its threshold may depend on $K$, the resulting comparison constants do not.
  To obtain the precise asymptotic, fix an auxiliary exponent $0 < theta < epsilon$, without changing the sieve parameters. Uniformly for $r lt.eq x^theta$ and $y$ in the support of $Psi$,
  $ log \( \( x y - 1 \) \/ \( c r \) \) = L + O \( theta L + 1 \) \, $
  and hence
  $ I_r = frac(x A_Psi, c r L) #scale(x: 120%, y: 120%)[\(] 1 + O \( theta \) + O \( L^(- 1) \) #scale(x: 120%, y: 120%)[\)] . $
  The constants in these relative errors are independent of $theta$. Use the $ell = 1$ term of (12.18) with $A' > 2$, multiply by $cal(W) \( r \)$, and sum over $r lt.eq x^theta$. The summed progression error is $O \( x J_0 L^(- A') \)$. Lemma 35 bounds the omitted parts of both $X_0$ and $J_0$; after the harmonic tail is multiplied by $x \/ L$, both are $o_theta \( x J_0 \/ L \)$, since $J_0 gt.eq 1$. Thus
  $ frac(c phi \( N \) L X_0, x J_0 A_Psi) = 1 + O \( theta \) + o_theta \( 1 \) . $
  First let $x$ tend to infinity with $theta$ fixed, and then let $theta$ decrease to zero. This proves (12.14). For $\( M \, c \, u \) = \( 8 \, 4 \, 5 \)$, it becomes $X_0 tilde.op x J_0 A_Psi \/ \( 4 L \)$, since $phi \( M \/ c \) = phi \( 2 \) = 1$. ◻
]

To express the sieve products, define

#[#set math.equation(numbering: n => "(12.19)")
 $ V_M \( y \) & = product_(2 < p lt.eq y\
p divides.not M) (1 - frac(1, p - 1)) \,\
frak(S)_M & = 2 product_(p > 2) (1 - frac(1, \( p - 1 \)^2)) product_(p divides M\
p > 2) (1 - frac(1, p - 1))^(- 1) > 0 . $ <con:singular-product>]

Division by $V \( y \)$ and Mertens’ theorem give

#[#set math.equation(numbering: n => "(12.20)")
 $ V_M \( y \) tilde.op frak(S)_M V \( y \) \, #h(2em) V \( y \) tilde.op frac(upright(e)^(- gamma_E), log y) \, $ <con:mertens>]

where $gamma_E$ is Euler’s constant. The primes dividing any supported $r$ are large enough that their omission changes these products negligibly. More precisely, (12.4) gives

#[#set math.equation(numbering: n => "(12.21)")
 $ sum_(p divides r) 1 / p lt.eq 0.11 L^0.9 exp \( - L^0.1 \) = o \( 1 \) \, #h(2em) product_(2 < p lt.eq y) \( 1 - g_r \( p \) \) = \( 1 + o \( 1 \) \) V_M \( y \) \, $ <con:omitted-primes>]

uniformly for $r lt.eq x^0.11$ and all $y$. The bound on the relative error is independent of $K$.

=== 12.3 Two sieve estimates <two-sieve-estimates>

The block sieve of Lemma 32, from [20] Lemma 2.9, now gives the initial mass without small prime factors and a conditional mass for a specified divisor. Both estimates use the distribution already proved, but at different sieve depths.

First sieve the prime objects $Q$ in $A_r$, for $r lt.eq x^epsilon$, by the conditions $p divides c r Q + 1$ at odd primes $p lt.eq z = x^b$. The local densities are $g_r \( p \)$, with $g_r \( p \) lt.eq 1 \/ 2$ and $sum_(v < p lt.eq v^2) g_r \( p \) lt.double 1$ with absolute constants. Choose the even depth

$ H = 2 ⌊frac(1, 40 b)⌋ . $

For sufficiently small fixed $b$, this is large enough for the lower bound in Lemma 32; moreover,

$ z^(4 H + 2) lt.eq x^(0.2 + 2 b) < D \, #h(2em) upright(e)^(- H) lt.eq upright(e)^2 exp \( - 1 \/ \( 20 b \) \) . $

All remainders are therefore covered by (12.13). Every supported $d$ is odd. Summing the sieve bound with the marks, using (12.20)–(12.21) and the negligible tail in Lemma 35, gives

#[#set math.equation(numbering: n => "(12.22)")
 $ S_b := sum_(P^(-) \( d \) > x^b) w \( d \) gt.eq frac(frak(S)_M X_0, L) {upright(e)^(- gamma_E) / b \( 1 - C_s upright(e)^(- c_s \/ b) \) + o \( 1 \)} \, $ <con:initial-lower>]

where $C_s \, c_s > 0$ are absolute; the displayed bound on $upright(e)^(- H)$ permits $c_s = 1 \/ 20$, after enlarging $C_s$. The remainders are $o \( X_0 \/ L \)$ by taking $A > 2$ in (12.13).

#prodef([Lemma 12.4.])[
  (Mass conditioned on a divisor).  #emph[For any fixed $b lt.eq gamma < gamma' lt.eq 1 \/ 2 - kappa$, 
#[#set math.equation(numbering: n => "(12.23)")
 $ sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) sum_(n divides d\
P^(-) \( d \) > W) w \( d \) = frak(S)_M X_0 V \( W \) (log gamma' / gamma + o \( 1 \)) . $ <con:bin-mass-formula>]

]
] <con:bin-mass>

#proof[
  For large $x$, the primes $n$ in this sum exceed $W$ and all group primes, and do not divide $M$. Fix $r lt.eq x^epsilon$ and condition the family in $A_r$ on $n divides c r Q + 1$. For a squarefree product $ell$ of odd primes at most $W$, the intersection count is
  $ A_r \( n ell \) = frac(A_r, n - 1) g_r \( ell \) + E_r \( n ell \) . $
  This includes $ell = 1$, as allowed in Lemma 32. Apply that lemma with main mass $A_r \/ \( n - 1 \)$ and $H = 2 ceil.l \( log L \)^2 ceil.r$. Its relative error tends to zero, and its remainder moduli satisfy
  $ ell lt.eq W^(4 H + 2) = exp \( O \( L^0.24 \( log L \)^2 \) \) = x^(o \( 1 \)) \, #h(2em) n ell lt.eq x^(1 \/ 2 - kappa + o \( 1 \)) < D . $
  The map $\( n \, ell \) mapsto n ell$ is injective, since $n$ is the unique prime factor exceeding $W$. Thus the total remainder after summing $n$ and the marked $r$’s is bounded by a single copy of (12.13).
  The sieve product is $\( 1 + o \( 1 \) \) V_M \( W \)$ uniformly in $r$, and Mertens’ theorem gives
  $ sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) frac(1, n - 1) = log \( gamma' \/ gamma \) + o \( 1 \) . $
  By (12.8), Lemma 35, and (12.15), for every fixed $A > 0$ we have
  $ sum_(r lt.eq x^epsilon) cal(W) \( r \) A_r = X_0 + o \( X_0 L^(- A) \) . $
  This evaluates the contribution of $r lt.eq x^epsilon$ with the exact main mass $X_0$; taking $A$ large in (12.13) makes the remainders $o \( X_0 V \( W \) \)$. Finally, each supported $d$ has at most $log \( 2 x \) \/ \( b L \) = O \( 1 \/ b \)$ distinct prime divisors above $x^b$. Consequently the harmonic tail bounds the omitted $r > x^epsilon$ contribution even after summing over $n$. This proves (12.23). ◻
]

=== 12.4 Removing composites by their least prime factor <removing-composites-by-their-least-prime-factor>

We next pass from $S_b$ to

$ U_kappa = sum_(P^(-) \( d \) > x^(1 \/ 2 - kappa)) w \( d \) . $

For a bin $\( gamma \, gamma' \] subset.eq \( b \, 1 \/ 2 - kappa \]$, with the first left endpoint allowed to equal $b$, define

$ T_(gamma \, gamma') = sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) sum_(P^(-) \( m \) > x^gamma) w \( m n \) . $

If $x^gamma < P^(-) \( d \) lt.eq x^(gamma')$, taking $n = P^(-) \( d \)$ and $m = d \/ n$ shows that its weight is included in this sum. This remains true when $n^2 divides d$.

Partition both factors into disjoint half-open dyads with endpoints powers of two, retaining pairs that meet the smooth product support and the range of $n$. On that support, with $t = log n \/ L$,

$ frac(log m, L) = 1 - t + O \( L^(- 1) \) . $

Every retained full $m$-dyad therefore satisfies (12.6) with

$ s_(-) = 1 \/ 2 + kappa \/ 2 \, #h(2em) s_(+) = 1 - b \/ 2 \, $

for large $x$; in particular $s_(-) > gamma$. Both dyad scales are at least $x^(b \/ 2)$, and their product is comparable to $x$. There are $O \( L \)$ such pairs, since each $n$-dyad allows only a bounded number of $m$-dyads.

Apply Lemma 34 in every pair with $delta = b \/ 2$ and with $b_n$ the prime indicator restricted to its dyad and bin. These coefficients are $W$-rough. The total error is $O \( x L^(- 5) \) = o \( X_0 \/ L \)$, by (12.15) and $J_0 gt.eq 1$. Hence

$ T_(gamma \, gamma') = sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) sum_(m > x^gamma) frac(D_gamma \( log m \/ L \), L V \( W \)) upright(bold(1))_({ P^(-) \( m \) > W }) w \( m n \) + o \( X_0 \/ L \) . $

Joint continuity of the density on the fixed compact exponent range gives, on the support of the summand,

$ D_gamma \( log m \/ L \) lt.eq sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) + o \( 1 \) . $

Since $n > W$, the remaining roughness condition is precisely $P^(-) \( m n \) > W$. Lemma 37 thus gives

#[#set math.equation(numbering: n => "(12.24)")
 $ T_(gamma \, gamma') lt.eq frac(frak(S)_M X_0, L) {sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) log gamma' / gamma + o \( 1 \)} . $ <con:bin-cost>]

The density estimate in Lemma 33 is normalized to match this expression:

#[#set math.equation(numbering: n => "(12.25)")
 $ integral_b^(1 \/ 2) D_t \( 1 - t \) frac(d t, t) = D_b \( 1 \) - 1 \, #h(2em) D_b \( 1 \) lt.eq upright(e)^(- gamma_E) / b \( 1 + C_d upright(e)^(- c_d \/ b) \) $ <con:density-budget>]

for sufficiently small fixed $b$. On $b lt.eq gamma lt.eq t lt.eq 1 \/ 2 - kappa$, the point $\( gamma \, 1 - t \)$ stays a fixed distance from $s = gamma$. Uniform continuity and the finite mass of $d t \/ t$ therefore give a sufficiently fine fixed partition

$ b = gamma_0 < gamma_1 < dots.h.c < gamma_J = 1 \/ 2 - kappa $

such that

$ sum_(j = 1)^J sup_(gamma_(j - 1) lt.eq t lt.eq gamma_j) D_(gamma_(j - 1)) \( 1 - t \) log gamma_j / gamma_(j - 1) & lt.eq integral_b^(1 \/ 2 - kappa) D_t \( 1 - t \) frac(d t, t) + 0.1\
 & lt.eq D_b \( 1 \) - 1 + 0.1 . $

Subtracting (12.24) for these finitely many bins from (12.22) proves

#[#set math.equation(numbering: n => "(12.26)")
 $ U_kappa gt.eq frac(frak(S)_M X_0, L) {0.9 - upright(e)^(- gamma_E) / b \( C_s upright(e)^(- c_s \/ b) + C_d upright(e)^(- c_d \/ b) \) + o \( 1 \)} . $ <con:post-bin>]

The unit term in (12.25) is what leaves a positive mass after this subtraction. It remains to remove the composites whose two prime factors are both close to $sqrt(x)$.

=== 12.5 Composites with two nearly equal prime factors <composites-with-two-nearly-equal-prime-factors>

A composite counted by $U_kappa$ has exactly two prime factors with multiplicity: three factors greater than $x^(1 \/ 2 - kappa)$ would have product exceeding $2 x$. Each factor lies in $\[ x^(1 \/ 2 - kappa) \, 2 x^(1 \/ 2 + kappa) \]$. Cover the ordered factor pairs by dyadic boxes

#[#set math.equation(numbering: n => "(12.27)")
 $ cal(B) = \[ M_1 \, 2 M_1 \) times \[ M_2 \, 2 M_2 \) $ <con:boxes>]

that meet this range in each coordinate and admit a product in $\[ x \, 2 x \]$. They satisfy $x \/ 4 lt.eq M_1 M_2 lt.eq 2 x$, and their full coordinate intervals lie in $\[ x^0.46 \, x^0.54 \]$ for large $x$. There are at most $C_(upright("dyad")) \( kappa L + 1 \)$ boxes, where $C_(upright("dyad"))$ is absolute: this bounds the number of first coordinate dyads, and the product condition leaves only a bounded number of second coordinate dyads for each.

The rough-pair bound holds on a slightly wider fixed range of boxes, which includes all the boxes just selected.

#prodef([Lemma 12.5.])[
  (An upper bound for rough pairs).  #emph[Let $cal(B) = \[ M_1 \, 2 M_1 \) times \[ M_2 \, 2 M_2 \)$ be any dyadic box such that 
#[#set math.equation(numbering: n => "(12.28)")
 $ x \/ 4 lt.eq M_1 M_2 lt.eq 2 x \, #h(2em) x^0.46 \/ 2 lt.eq M_i lt.eq 2 x^0.54 quad \( i = 1 \, 2 \) . $ <con:rough-box-range>]

 Then 
#[#set math.equation(numbering: n => "(12.29)")
 $ sum_(\( m \, n \) in cal(B)\
P^(-) \( m \) > W \, med P^(-) \( n \) > W) w \( m n \) lt.eq C_1 X_0 V \( W \)^2 \, $ <con:rough-pair-bound>]

 where $C_1$ depends at most on $M \, Psi$, and is independent of $K \, kappa \, b \, epsilon$.]
] <con:rough-pairs>

#proof[
  Fix a contributing group integer $r lt.eq x^0.11$, and set $k_r = c r$, $z' = x^0.002$. The corresponding pairs satisfy $m n equiv 1 med \( mod med k_r \)$. At every odd prime $j lt.eq z'$ with $j divides.not r$, they avoid
  #[#set math.equation(numbering: n => "(12.30)")
   $ m n equiv 1 med \( mod med j \) \, #h(2em) upright("and, if ") j lt.eq W \, #h(2em) m n equiv 0 med \( mod med j \) . $ <con:pair-bad>]
  Indeed, $m n - 1 = k_r Q$ with $Q > x^0.9 > z'$, while both factors are $W$-rough. We impose no further condition at primes dividing $k_r$ and may omit the fixed progression for this upper bound.
  For a squarefree product $ell$ of the designated odd primes, put
  $ rho \( ell \) = product_(j divides ell) #scale(x: 120%, y: 120%)[\(] j - 1 + \( 2 j - 1 \) upright(bold(1))_({ j lt.eq W }) #scale(x: 120%, y: 120%)[\)] . $
  The conditions $m n = 1$ and $m n = 0$ modulo $j$ are disjoint and have respectively $j - 1$ and $2 j - 1$ residue pairs. There are $phi \( k_r \)$ pairs with product one modulo $k_r$. The Chinese remainder theorem therefore gives exactly $phi \( k_r \) rho \( ell \)$ pairs modulo $k_r ell$ satisfying the base congruence and all the forbidden conditions at primes dividing $ell$. Their count in the box is
  $ X' g \( ell \) + E \( ell \) \, #h(2em) X' = M_1 M_2 frac(phi \( k_r \), k_r^2) \, #h(2em) g \( ell \) = frac(rho \( ell \), ell^2) \, $
  where
  #[#set math.equation(numbering: n => "(12.31)")
   $ E \( ell \) lt.double phi \( k_r \) rho \( ell \) (frac(M_1 + M_2, k_r ell) + 1) . $ <con:lattice-error>]
  This formula also holds at $ell = 1$.
  The local bounds $g \( j \) lt.eq 7 \/ 9$ and $g \( j \) lt.eq 3 \/ j$ verify the gap and block-sum hypotheses of Lemma 32, with absolute constants. Its upper bound with $H = 2$ uses $ell lt.eq \( z' \)^10 = x^0.02$. For squarefree $ell$,
  $ rho \( ell \) lt.eq product_(j divides ell) 3 j lt.eq tau \( ell \)^2 ell \, $
  where $tau$ is the divisor function. Since $phi \( k_r \) lt.eq k_r$ and $k_r = c r lt.eq 4 r$, (12.31) gives
  $ \| E \( ell \) \| lt.double tau \( ell \)^2 \( M_1 + M_2 + r ell \) . $
  The needed divisor sum follows elementarily. Let $tau_4 \( n \)$ count ordered decompositions of $n$ into four positive factors. Prime by prime, $tau \( n \)^2 lt.eq tau_4 \( n \)$; summing over the first three factors therefore yields, for $Y gt.eq 2$,
  $ sum_(n lt.eq Y) tau \( n \)^2 lt.eq Y (sum_(a lt.eq Y) 1 / a)^3 lt.double Y #scale(x: 120%, y: 120%)[\(] log \( 2 Y \) #scale(x: 120%, y: 120%)[\)]^3 . $
  Consequently, taking $Y = x^0.02$ and using $M_1 + M_2 lt.eq 4 x^0.54$ from (12.28), we obtain
  #[#set math.equation(numbering: n => "(12.32)")
   $ sum_(ell lt.eq x^0.02) \| E \( ell \) \| lt.double \( x^0.56 + r x^0.04 \) L^3 = o #scale(x: 120%, y: 120%)[\(] \( x \/ r \) L^(- 10) #scale(x: 120%, y: 120%)[\)] $ <con:lattice-sum>]
  uniformly for $r lt.eq x^0.11$. The ratios of the two displayed power terms to $x \/ r$ are at most $x^(- 0.33)$ and $x^(- 0.74)$, respectively, and absorb the logarithmic factor.
  For $j lt.eq W$, the surviving sieve factor is
  $ 1 - frac(3 j - 2, j^2) = (1 - 1 / j)^3 (1 - frac(1, \( j - 1 \)^2)) \, $
  and for $W < j lt.eq z'$ it is
  $ 1 - frac(j - 1, j^2) = (1 - 1 / j) (1 + frac(1, j \( j - 1 \))) . $
  The correction products are bounded. Omitting the primes dividing $r$ costs a bounded factor by (12.21), and omitting two costs a fixed factor. Thus
  $ product_(2 < j lt.eq z'\
j divides.not r) \( 1 - g \( j \) \) lt.double V \( W \)^2 V \( z' \) . $
  As $X' lt.double x \/ r$, the upper sieve and (12.32) bound the pair count at this $r$ by $O \( \( x \/ r \) V \( W \)^2 V \( z' \) \)$, uniformly in all the marks. Bound $Psi$ by one, multiply by $cal(W) \( r \)$, and sum. The result is
  $ O #scale(x: 120%, y: 120%)[\(] x J_0 V \( W \)^2 V \( z' \) #scale(x: 120%, y: 120%)[\)] . $
  Finally $V \( z' \) asymp L^(- 1)$, with fixed comparison constants, and (12.15) proves (12.29). Only $J_0$, rather than the pointwise bound $B_K$, entered this calculation, so $C_1$ has the claimed independence. ◻
]

Return now to the boxes selected in (12.27), whose full coordinate intervals lie in $\[ x^0.46 \, x^0.54 \]$. We replace the prime indicators in each of these boxes. Apply Lemma 34 with

$ gamma = 0.4 \, #h(2em) s_(-) = 0.46 \, #h(2em) s_(+) = 0.54 \, #h(2em) delta = b \/ 2 . $

In this range $R_0.4 \( m \)$ is exactly the prime indicator, since $2 \( 0.4 \) > 0.54$, and $D_0.4 \( s \) = 1 \/ s$. Its comparison coefficient is therefore

$ B_(upright("pr")) \( m \) = frac(upright(bold(1))_({ P^(-) \( m \) > W }), V \( W \) log m) . $

The identity

$ upright(bold(1))_({ m upright(" prime") }) upright(bold(1))_({ n upright(" prime") }) - B_(upright("pr")) \( m \) B_(upright("pr")) \( n \) & = \( upright(bold(1))_({ m upright(" prime") }) - B_(upright("pr")) \( m \) \) upright(bold(1))_({ n upright(" prime") })\
 & quad + B_(upright("pr")) \( m \) \( upright(bold(1))_({ n upright(" prime") }) - B_(upright("pr")) \( n \) \) $

allows two successive applications, interchanging the variables in the second. The companion coefficient is $W$-rough and bounded by one for large $x$ in both cases. All coefficients retain their box restrictions. The total error over the boxes is $O \( x L^(- 5) \) = o \( X_0 \/ L \)$.

Since $log m \, log n gt.eq 0.46 L$, Lemma 38 bounds the resulting sum in one box by $\( 0.46 \)^(- 2) C_1 X_0 \/ L^2$. The ordered prime-pair sum includes prime squares and may count other semiprimes twice, which is harmless for an upper bound. Summing the boxes gives

#[#set math.equation(numbering: n => "(12.33)")
 $ sum_(P^(-) \( d \) > x^(1 \/ 2 - kappa)\
d upright(" composite")) w \( d \) lt.eq C_2 \( kappa + L^(- 1) \) X_0 / L + o \( X_0 \/ L \) \, $ <con:balanced-cost>]

where $C_2 = \( 0.46 \)^(- 2) C_1 C_(upright("dyad"))$ depends at most on $M \, Psi$, and is independent of $K \, kappa \, b \, epsilon$.

=== 12.6 Choice of parameters and completion <choice-of-parameters-and-completion>

#proof[
  #emph[Completion of the proof of Proposition 3.] Fix $M \, c \, u \, Psi$ first, and hence the constants $frak(S)_M$ and $C_2$. Choose $0 < kappa < 0.01$ such that
  $ C_2 kappa < frak(S)_M \/ 4 \, $
  and then choose $0 < epsilon < kappa$. Choose $b > 0$ sufficiently small for the sieve and density estimates, and so that
  $ upright(e)^(- gamma_E) / b \( C_s upright(e)^(- c_s \/ b) + C_d upright(e)^(- c_d \/ b) \) < 0.2 . $
  Fix the partition used in the least-factor subtraction. Only finitely many Type II parameter sets now occur. Choose $K$ sufficiently large for all of them, and choose the exponents afterward, for example
  $ a_i = 0.1 + frac(0.1 i, K + 1) #h(2em) \( 1 lt.eq i lt.eq K \) . $
  This order is permitted by Lemma 30 and Proposition 31, hence by Lemma 34.
  Every supported prime is counted by $U_kappa$. Subtracting (12.33) from (12.26), and then taking $x$ sufficiently large for the fixed parameters, gives
  $ frac(L, frak(S)_M X_0) sum_(d upright(" prime")) w \( d \) gt.eq 0.9 - 0.2 - 1 / 4 + o \( 1 \) > 1 / 4 . $
  By (12.15), $J_0 gt.eq 1$, and $w lt.eq B_K$, the number of distinct supported primes is therefore $gt.double_(M \, c \, u) x \/ L^2$. Their support in (12.2) ensures $x < d < 2 x$, $d equiv u med \( mod med M \)$, and $d = c r Q + 1$ with $Q > x^0.9$ prime. Every prime factor of $r$ belongs to a group in (10.2), hence lies in $\( exp \( L^0.1 \) \, exp \( L^0.3 \) \)$ for all sufficiently large $x$. These are precisely the assertions of the proposition. ◻
]

== 13 The cubic theta normalization <app:whittaker>

This appendix supplies the Kazhdan–Patterson specialization and normalization behind 13. We first specialize their cover, inducing datum, and global representation, and derive the normalized Whittaker factorization. We then verify the exact lift identities and compute the spherical Jacquet integral in the sections used in the paper. The local calculation fixes the Gauss phase and the unit factor together, and includes the modular factor in the triple-valuation step. The main argument uses the resulting global Fourier expansion with normalized local factors and the exact local rules for the Weyl calculation.

=== 13.1 The selected cover and global representation <subsec:theta-specialization>

Denote the cubic Hilbert symbol at a place $v$ by $\( thin dot.op thin \, thin dot.op thin \)_(3 \, v)$. In the convention of Kazhdan and Patterson, the restriction of their determinant-modified cocycle to the diagonal torus is

#[#set math.equation(numbering: n => "(13.1)")
 $ sigma_(c \, v) #scale(x: 120%, y: 120%)[\(] "diag" \( a \, b \) \, "diag" \( a' \, b' \) #scale(x: 120%, y: 120%)[\)] = \( a \, b' \)_(3 \, v) \( a b \, a' b' \)_(3 \, v)^c \, #h(2em) c in bb(Z) \/ 3 bb(Z) . $ <eq:kp-torus-cocycle>]

The root groups have their canonical splittings. These conventions are those of [15] Section 0.1, pp. 39–44.

For the $n$-fold cover of $upright("GL")_d$, where $d$ is the rank parameter, the center criterion of [15] Proposition 0.1.1, p. 42 requires $z^(d - 1 + 2 d c) in F_v^(times n)$ for a scalar $z I$. For $d = 2 \, n = 3$ the exponent is $1 + 4 c$, which is zero modulo three exactly when $c = 2$. Moreover, (13.1) on two scalars is

$ sigma_(2 \, v) \( z I \, z' I \) = \( z \, z' \)_(3 \, v)^(thin 1 + 4 dot.op 2) = 1 . $

Thus their full preimage is central and the ordinary scalar section splits. Quotienting its image gives the asserted local covers of $upright("PGL")_2$. The adelic cover and its rational splitting are obtained by the reciprocity construction in [15] Section 0.2. The ordinary scalar section agrees with that splitting on rational scalars, so the quotient retains a rational splitting.

We check the datum in (5.1). A Hilbert symbol with a cube argument is one; the cocycle on scalar pairs is also one. Consequently the cube and scalar sections commute and multiply without any remaining cocycle. If an element has two presentations in (5.1), their two cube coordinates differ by a common scalar cube, so the displayed absolute-value ratio agrees. The formula is therefore a genuine character, trivial on the split scalar subgroup. On a coroot cube it gives

$ omega_v #scale(x: 120%, y: 120%)[\(] s_v \( "diag" \( t^3 \, t^(- 3) \) \) #scale(x: 120%, y: 120%)[\)] = \| t \|_v . $

This is exactly the exceptional condition of [15] Section I.2, p. 71. The exceptional condition alone would only specify the square of the value on $a \( pi.alt^3 \)$; the datum in the main text chooses the pure absolute-value value.

Use the idele norm in (5.1) to define the global character. A rational diagonal lying in the adelic cube torus times scalars has a rational ratio which is a cube at every completion. If that ratio were not a cube in $F$, its nontrivial Kummer extension would have a nonsplit unramified prime by Chebotarev. Thus the ratio is a rational cube. The product formula now shows that our character is trivial on the intersection with the rational lift. This is the compatibility hypothesis in [15] Section II.1, p. 107, immediately after Lemma II.1.1. Extending by the trivial character on rational lifts gives the character on the rational maximal abelian subgroup of that lemma. As in [15] Section II.1, pp. 107–109, one chooses an extension on the product of local maximal abelian subgroups which agrees with the former character on their intersection. The character on the scalar center is unitary.

At finite places, the local quotient and subrepresentation assertions are [15] Theorem I.2.9(a),(b), p. 72. At tame finite places, part (f) of that theorem supplies the spherical vector for the normalized unramified datum. For a tame place, the uniqueness criterion is

$ d = n - 1 \, quad 2 \( c + 1 \) = 0 med \( mod med n \) \, #h(2em) upright("or") #h(2em) d = n $

by [15] Corollary I.3.6, p. 79. It applies to $\( d \, n \, c \) = \( 2 \, 3 \, 2 \)$. The residue construction and restricted tensor product are [15] Theorem II.2.1, p. 118. Since the tame local Whittaker spaces have dimension one, [15] Theorem II.2.5(a), p. 122 gives a nonzero global Whittaker functional, and part (b) gives local uniqueness at every place. At the complex places this also follows directly from [15] Theorem I.6.5(c), p. 105. The inducing spaces, their exceptional images, and the automorphic residue all inherit the scalar action of $omega$. That action is trivial, so these representations descend to the scalar quotients.

On the quotient torus the section of $a \( y \)$ has cocycle $\( x \, y \)_(3 \, v)^2$. Since $- 1$ is a cube in $F$, this is an alternating bimultiplicative law. At a tame place it is trivial on pairs of units, and its value on a uniformizer and a unit is the cubic residue symbol or its inverse, with a common orientation at all places. Choose the embedding $iota$ with the orientation giving (5.5). The canonical compact splitting agrees with the sections of unit diagonals, Weyl elements, and integral upper root elements by [15] Proposition 0.1.3, p. 44. Conjugating by the Weyl element gives the same agreement for the lower root group. [15] Corollary I.3.4, p. 78 gives relations for the coefficient functions defining local Whittaker functionals. [15] Theorems I.4.2–I.4.3, p. 87 convert them to spherical Whittaker values with the modular factor and give the central step. The direct local calculation below proves (5.6) and the lift identities (5.4) in these conventions.

At a complex place the Hilbert symbol and the cover are trivial. [15] Theorem I.6.4(c), p. 104 identifies the exceptional representation with the ordinary principal series when $d lt.eq n$. Our cube datum fixes the characters on all of $bb(C)^times$, because every complex number has a cube root. Triviality on scalars removes the determinant character; equivalently any possible remaining finite-order continuous character of the connected group $bb(C)^times$ is trivial. This gives the characters in part (iii) of 13. Their Bessel function is computed in the main text from the Jacquet integral. Finally, the two Bruhat terms in the constant term of the Eisenstein series are described by [15] Proposition II.1.2, p. 110. At the exceptional residue the surviving term belongs to the Weyl-conjugate induction, as in [15] Section II.1, p. 114. Its complex inducing character, including the modular factor, is $\| y \|_v^(1 \/ 3)$; in particular it has no angular part.

=== 13.2 The normalized global Whittaker expansion <subsec:theta-global-normalization>

Let $lambda$ be the nonzero global functional just obtained. The restricted tensor product is spanned by pure tensors, so there is a pure tensor $phi^compose$ with $lambda \( phi^compose \) eq.not 0$. Its nondistinguished finite places form a finite set. The final $S$ contains this set; the arithmetic data are constructed only after that final choice. For $v in.not S$, varying only the $v$-component of $phi^compose$ gives a nonzero local Whittaker functional. Normalize it at $phi_v^compose$. If other finitely many components have already been varied, the resulting partial functional at $v$ is still a Whittaker functional, and local uniqueness makes it a scalar multiple of the normalized one. Evaluating at $phi_v^compose$ identifies that scalar. Induction on the number of varied components proves (5.2). The same argument factors the complex components.

At a finite product of remaining places the functional descends to the tensor product of the local twisted Jacquet quotients. The twisted Jacquet quotient of the principal series is finite dimensional by [15] Lemma I.3.2, p. 75. Since $Theta_v$ is its quotient by Theorem I.2.9(b), its twisted Jacquet quotient is a quotient of that finite-dimensional space. A functional on the finite tensor product is therefore a finite sum of products. This is the finite-S assertion in 13.

This normalization accounts for the correction to the original global formula. The erratum withdraws an auxiliary spherical-functional vanishing assertion on pp. 119–120. It replaces stabilization of the auxiliary coefficient $C_S$ by stabilization of $C_S T \( S \)$, where in rank two

$ T \( S \) = product_(v in S\
v divides.not oo) \( 1 + Q_v^(- 1) \) \, #h(2em) Q_v = \# \( cal(O)_v \/ frak(p)_v \) . $

The sums in Theorems II.2.2–II.2.3 become finite-$S$ limits with the factor $T \( S \)^(- 1)$, and the same change applies on p. 130 [16] correction to Theorems II.2.2–II.2.3. The preceding argument begins with the nonzero automorphic functional and normalizes each exterior local functional at the distinguished spherical vector. It proves the product (5.2) without the withdrawn assertion or an unnormalized infinite product.

The rational splitting identifies every nonconstant Fourier coefficient with this Whittaker function. Conjugate $n \( x \)$ by the rational lift of $a \( nu \)$ and change $x$ to $nu x$; the adelic Jacobian is one. This gives (5.3). On a fixed compact set of $g$, smoothness at infinity and invariance under a fixed finite open subgroup reduce the expansion along $F without bb(A)_F$ to the smooth Fourier expansion on a compact real torus. Integration by parts in sufficiently many archimedean directions gives absolute local uniform convergence there.

=== 13.3 Sections and the spherical induced vector <sections-and-the-spherical-induced-vector>

Fix an exterior finite place $frak(p)$. In this appendix write $cal(O) = cal(O)_(frak(p))$, let $pi.alt$ be the chosen uniformizer, put $Q = q_(frak(p))$, and abbreviate $psi = psi_(frak(p))$, $chi = chi_(frak(p))$, and $cal(C) = cal(C)_(frak(p))$. Thus $psi$ has conductor $cal(O)$, additive measure gives $cal(O)$ volume one, and $chi$ is the sextic residue character on $cal(O)^times$. In all finite sums it is extended by zero to the zero residue, including when its exponent is zero. The embedding of the cubic symbol has been chosen so that the effective torus cocycle is

#[#set math.equation(numbering: n => "(13.2)")
 $ cal(C) \( pi.alt \, u \) = chi \( u \)^(- 2) \, quad cal(C) \( u \, pi.alt \) = chi \( u \)^2 \, quad cal(C) \( u \, u' \) = 1 \, quad cal(C) \( pi.alt \, pi.alt \) = 1 #h(2em) \( u \, u' in cal(O)^times \) . $ <eq:app-torus-laws>]

The last two identities follow from tameness and alternation. In particular pure uniformizer powers multiply without a cocycle. All symbols with $- 1$ are one because $- 1 in F^(times 6)$.

We first record explicitly why the ordinary rank-one decompositions are valid for these lifts. See Kubota [18] p. 114 for the local rank-one construction. In the convention of [15] Section 0.1, p. 41, the determinant-modified formula is

$ sigma_c \( g_1 \, g_2 \) = (frac(x \( g_1 g_2 \), x \( g_1 \)) \, frac(x \( g_1 g_2 \), x \( g_2 \) det g_1))_3 \( det g_1 \, det g_2 \)_3^c \, quad x \( g \) = cases(delim: "{", g_21 \, & g_21 eq.not 0 \,, g_22 \, & g_21 = 0 .) $

We take $c = 2$ and then quotient the split scalar subgroup. Substitution in this formula gives

$ n \( x \) a \( y \) = a \( y \) n \( x \/ y \) \, #h(2em) w a \( y \) = a \( y^(- 1) \) w $

on the quotient. Before quotienting, the second equality has the extra scalar $y I$. All its cocycles are symbols between powers of $y$ and $- 1$, hence are one. For $H eq.not 0$, the matrix identity

$ w n \( H \) = n \( H^(- 1) \) "diag" \( - H^(- 1) \, H \) macron(n) \( H^(- 1) \) $

also lifts exactly. The product of the first two factors has cocycle one, and multiplication by the last factor has cocycle $\( H^(- 1) \, - H \)_3 = 1$. The middle diagonal is the product of the split scalar $H I$ and $a \( - H^(- 2) \)$, again without a cocycle. Thus

#[#set math.equation(numbering: n => "(13.3)")
 $ w n \( H \) = n \( H^(- 1) \) a \( - H^(- 2) \) macron(n) \( H^(- 1) \) $ <eq:app-bruhat-lift>]

on the quotient. If $H^(- 1) in cal(O)$, the last factor is in the compact splitting. The latter agrees with the sections on unit diagonals, $w$, and integral upper root elements by [15] Proposition 0.1.3, p. 44; conjugation by $w$ gives agreement on the lower root group. The diagonal $a \( - 1 \)$ can therefore be absorbed in a compact factor in any spherical calculation.

Let $sigma^(-)$ be the unramified representation of the covering torus with central character the Weyl conjugate of (5.1). Its norm exponent on $a \( y \)$ is $- 1 \/ 6$. Modulo scalars, the subgroup of torus elements of valuation divisible by three is maximal abelian: the tame group $F_(frak(p))^times \/ F_(frak(p))^(times 3)$ has one valuation and one unit coordinate over $bb(Z) \/ 3 bb(Z)$, and the commutator pairing pairs those coordinates nondegenerately. The torus construction in [15] Section 0.3, pp. 54–55, and Section I.1, p. 58 realizes $sigma^(-)$ by induction from a character of this subgroup. Its index is three, so the unramified Heisenberg representation has dimension three. The canonical unramified extension is trivial on unit lifts [15] Section I.1, p. 60; the induced basis vector supported on that subgroup is therefore unit fixed. Call it $e_0$, and set

#[#set math.equation(numbering: n => "(13.4)")
 $ e_j = Q^(- j \/ 6) sigma^(-) \( a \( pi.alt^j \) \) e_0 \, #h(2em) j in bb(Z) . $ <eq:app-Heisenberg-basis>]

The central element $a \( pi.alt^3 \)$ acts by $Q^(1 \/ 2)$, so $e_(j + 3) = e_j$. These three vectors form a basis. From (13.2) and unit invariance one obtains

#[#set math.equation(numbering: n => "(13.5)")
 $ sigma^(-) \( a \( pi.alt^j u \) \) e_0 = Q^(j \/ 6) chi \( u \)^(2 j) e_j #h(2em) \( j in bb(Z) \, med u in cal(O)^times \) . $ <eq:app-torus-on-e0>]

Use the vector-valued realization of normalized induction

$ I^(-) = "Ind"_(tilde(B))^(tilde(upright("PGL"))_2) \( sigma^(-) \) \, #h(2em) f \( n \( x \) a \( y \) g \) = \| y \|_(frak(p))^(1 \/ 2) sigma^(-) \( a \( y \) \) f \( g \) . $

Its spherical vector $f^compose$ is determined by $f^compose \( k \) = e_0$ on the compact subgroup. The total norm exponent in this transformation law is $1 \/ 2 - 1 \/ 6 = 1 \/ 3$. The compact-invariant line of this normalized unramified induction is one dimensional by [15] Lemma I.1.3, p. 60. By [15] Theorem I.2.9(a),(f), p. 72, the local exceptional representation is the irreducible subrepresentation of $I^(-)$ and has a nonzero compact-invariant vector. That vector is a scalar multiple of $f^compose$, so the subrepresentation contains $f^compose$.

=== 13.4 The shells of the Jacquet integral <the-shells-of-the-jacquet-integral>

For a smooth $f in I^(-)$, define the vector Jacquet functional by

$ cal(J) \( f \) = lim_(L arrow.r oo) integral_(pi.alt^(- L) cal(O)) f \( w n \( x \) \) overline(psi \( x \)) thin thin upright(d) x . $

This limit stabilizes. Indeed, when $\| x \|$ is sufficiently large, the right invariance of $f$ makes $macron(n) \( x^(- 1) \)$ fix $f$. The lifted Bruhat formula then expresses $f \( w n \( x \) \)$ as

$ \| x \|_(frak(p))^(- 1) sigma^(-) \( a \( - x^(- 2) \) \) f \( 1 \) . $

Choose $m$ so that $1 + pi.alt^m cal(O)$ consists of cubes and its unit lifts fix the vector $f \( 1 \)$ in the smooth torus representation. On a shell $x = pi.alt^(- l) v$, the displayed expression is unchanged when $v$ is replaced by $v u$, $u in 1 + pi.alt^m cal(O)$: the norm is unchanged, all cocycles with $u$ are trivial, and $a \( u^(- 2) \)$ fixes $f \( 1 \)$. Each such unit coset is an additive coset of $pi.alt^m cal(O)$. For $l > m$, the character $psi \( pi.alt^(- l) v \)$ has zero integral on it. All sufficiently large shells therefore vanish. This argument applies to every smooth $f$, including each of its right translates.

If $t in F_(frak(p))$, choose a ball large enough to contain $t$ and to realize the stable values for both $f$ and $pi \( n \( t \) \) f$. Translation $x mapsto x + t$ preserves that ball and gives $cal(J) \( pi \( n \( t \) \) f \) = psi \( t \) cal(J) \( f \)$. Thus each scalar coordinate of $cal(J)$ is a Whittaker functional. This is a direct stable version, at the present inducing parameter, of the Jacquet functionals introduced in [15] Section I.3, pp. 74–75.

For $e gt.eq 0$ put $J_e = cal(J) \( pi \( a \( pi.alt^e \) \) f^compose \)$; explicitly,

#[#set math.equation(numbering: n => "(13.6)")
 $ J_e = integral_(F_(frak(p))) f^compose \( w n \( x \) a \( pi.alt^e \) \) overline(psi \( x \)) thin thin upright(d) x . $ <eq:app-Jacquet>]

The integral retains the stable interpretation just established. We now evaluate it shell by shell.

Put $x = pi.alt^e H$ and use the first two lift identities above. The measure contributes $Q^(- e)$, the modular factor of $a \( pi.alt^(- e) \)$ contributes $Q^(e \/ 2)$, and its torus norm factor contributes $Q^(- e \/ 6)$. Thus every shell has the common factor

#[#set math.equation(numbering: n => "(13.7)")
 $ Q^(- e + e \/ 2 - e \/ 6) = Q^(- 2 e \/ 3) . $ <eq:app-common-factor>]

If $H in cal(O)$, then $w n \( H \)$ belongs to the compact subgroup, and $psi \( pi.alt^e H \) = 1$. This region contributes $e_(- e)$ inside the common factor.

Suppose instead that $H = pi.alt^(- l) v$, with $l gt.eq 1$ and $v in cal(O)^times$. In (13.3) the last factor is compact, while the first acts trivially in the inducing transformation law. The modular factor of $a \( - H^(- 2) \)$ is $Q^(- l)$, and its torus norm factor is $Q^(l \/ 3)$. Furthermore,

$ a \( pi.alt^(2 l) v^(- 2) \) = cal(C) \( pi.alt^(2 l) \, v^(- 2) \)^(- 1) a \( pi.alt^(2 l) \) a \( v^(- 2) \) \, #h(2em) cal(C) \( pi.alt^(2 l) \, v^(- 2) \)^(- 1) = chi \( v \)^(- 8 l) . $

The minus sign in $- H^(- 2)$ has no effect. Multiplication by $a \( pi.alt^(- e) \)$ changes the basis index by $- e$, without a cocycle between the pure uniformizer powers. Finally $thin upright(d) H = Q^l thin thin upright(d) v$. It follows that this shell contributes, inside (13.7),

#[#set math.equation(numbering: n => "(13.8)")
 $ Q^(l \/ 3) e_(- e + 2 l) integral_(cal(O)^times) chi \( v \)^(- 8 l) overline(psi \( pi.alt^(e - l) v \)) thin thin upright(d) v . $ <eq:app-shell>]

This accounts separately for the measure, modular, norm, and Hilbert-symbol factors.

Define the normalized prime Gauss sums

$ g_j = Q^(- 1 \/ 2) sum_(x med mod med frak(p)) chi \( x \)^j psi \( x \/ pi.alt \) \, #h(2em) j in bb(Z) . $

The powers in these sums retain the unit mask. Since $chi \( - 1 \) = 1$, replacing $psi \( x \/ pi.alt \)$ by its complex conjugate has no effect on $g_j$. For $j equiv.not 0 med \( mod med 6 \)$, the usual finite-field Gauss identity gives

$ \| g_j \| = 1 \, #h(2em) g_j g_(- j) = chi \( - 1 \)^j = 1 . $

In particular $g_2 g_4 = 1$. These identities follow, for example, by expanding the product of the two sums, substituting $x = t y$, and using the additive sum in $y$; the result is $Q chi \( - 1 \)^j$ before division by $Q$.

Write $I_(e \, l)$ for the integral in (13.8). The character there is $chi^(- 2 l)$, since $- 8 l equiv - 2 l med \( mod med 6 \)$. Its exact values are

#[#set math.equation(numbering: n => "(13.9)")
 $ I_(e \, l) = cases(delim: "{", 1 - Q^(- 1) \, & 1 lt.eq l lt.eq e \, quad 3 divides l \,, 0 \, & 1 lt.eq l lt.eq e \, quad 3 divides.not l \,, Q^(- 1 \/ 2) g_(- 2 l) \, & l = e + 1 \, quad 3 divides.not l \,, - Q^(- 1) \, & l = e + 1 \, quad 3 divides l \,, 0 \, & l > e + 1 .) $ <eq:app-shell-integrals>]

Indeed, for $l lt.eq e$ the additive character is trivial, so unit orthogonality gives the first two cases. For $l = e + 1$, integration over the residue classes gives $Q^(- 1)$ times the corresponding prime Gauss sum; the trivial character with its unit mask gives $sum_(x eq.not 0) psi \( x \/ pi.alt \) = - 1$. For $l > e + 1$, split each unit class modulo $pi.alt^(l - e - 1)$ into its $Q$ lifts modulo $pi.alt^(l - e)$. The multiplicative character is unchanged on these lifts, whereas the additive factors sum to $sum_(t med mod med frak(p)) psi \( t \/ pi.alt \) = 0$. This also proves the asserted stabilization of (13.6).

We can now sum the shells. For $k gt.eq 0$, the integral unit ball and the shells $l = 3 \, 6 \, dots.h \, 3 k$ have the same basis index and combined coefficient

$ 1 + \( 1 - Q^(- 1) \) sum_(j = 1)^k Q^j = Q^k . $

For $e = 3 k$, the terminal shell $l = 3 k + 1$ has coefficient $Q^(k - 1 \/ 6) g_4$ and basis vector $e_2$. For $e = 3 k + 1$, the terminal shell $l = 3 k + 2$ has coefficient $Q^(k + 1 \/ 6) g_2$ and basis vector $e_0$. For $e = 3 k + 2$, the terminal shell $l = 3 k + 3$ has coefficient $- Q^k$ and the same basis vector $e_1$ as the preceding combined contribution. Multiplying by (13.7) therefore gives

#[#set math.equation(numbering: n => "(13.10)")
 $ J_(3 k) & = Q^(- k) \( e_0 + Q^(- 1 \/ 6) g_4 e_2 \) \,\
J_(3 k + 1) & = Q^(- k) \( Q^(- 1 \/ 2) g_2 e_0 + Q^(- 2 \/ 3) e_2 \) = Q^(- k - 1 \/ 2) g_2 \( e_0 + Q^(- 1 \/ 6) g_4 e_2 \) \,\
J_(3 k + 2) & = 0 . $ <eq:app-J-values>]

The second equality uses $g_2 g_4 = 1$.

In particular $J_0 = e_0 + Q^(- 1 \/ 6) g_4 e_2 eq.not 0$. Choose a scalar coordinate nonzero on $J_0$. Its Jacquet functional is nonzero on the exceptional subrepresentation, since that subrepresentation contains $f^compose$. The local Whittaker space is one dimensional by [15] Corollary I.3.6, p. 79. Hence every spherical Whittaker function normalized at one has the ratios in (13.10):

#[#set math.equation(numbering: n => "(13.11)")
 $ W \( a \( pi.alt^(3 k) \) \) = Q^(- k) \, #h(2em) W \( a \( pi.alt^(3 k + 1) \) \) = Q^(- k - 1 \/ 2) g_2 \, #h(2em) W \( a \( pi.alt^(3 k + 2) \) \) = 0 . $ <eq:app-pure-values>]

The middle term is $Q^(- k - 1) sum_x chi \( x \)^2 psi \( x \/ pi.alt \)$, as claimed. This computation agrees with the central-step statement of [15] Theorem I.4.3, p. 87: on $a \( pi.alt^3 \)$ the Weyl-conjugate inducing character is $Q^(1 \/ 2)$ and the modular half-character is $Q^(- 3 \/ 2)$, so their product is $Q^(- 1)$.

=== 13.5 Negative valuations and the unit normalization <negative-valuations-and-the-unit-normalization>

For $e < 0$, choose $x in cal(O)$ for which $psi \( pi.alt^e x \) eq.not 1$. The spherical vector is fixed by $n \( x \)$, while the split root relation and Whittaker equivariance give

$ W \( a \( pi.alt^e \) \) = W \( a \( pi.alt^e \) n \( x \) \) = psi \( pi.alt^e x \) W \( a \( pi.alt^e \) \) . $

Thus the value is zero. For a unit $u$, the compact section of $a \( u \)$ fixes the spherical vector. The torus law gives

$ a \( pi.alt^e u \) = cal(C) \( pi.alt^e \, u \)^(- 1) a \( pi.alt^e \) a \( u \) \, $

where $cal(C)$ includes the scalar action on a genuine vector. Consequently

#[#set math.equation(numbering: n => "(13.12)")
 $ W \( a \( pi.alt^e u \) \) = chi \( u \)^(2 e) W \( a \( pi.alt^e \) \) . $ <eq:app-unit-rule>]

Together with (13.11), this proves (5.6).

There is a useful check that fixes the orientation without referring to a convention for the name of a cubic Gauss sum. At a tame place the residue character is unchanged when $pi.alt$ is replaced by $pi.alt u$. Substitution $x = u v$ in the residue sum yields

$ Q^(- 1) sum_(x med mod med frak(p)) chi \( x \)^2 psi \( x \/ \( pi.alt u \) \) = chi \( u \)^2 Q^(- 1) sum_(v med mod med frak(p)) chi \( v \)^2 psi \( v \/ pi.alt \) . $

This is exactly the $e = 1$ transformation in (13.12). Thus the Gauss phase and the unit factor are a single compatible normalization. Changing the sign of an additive Gauss argument is harmless because $chi \( - 1 \) = 1$.

#heading(level: 1)[References]
#bibitem([1])[E.~Artin and H.~Hasse, #emph[Emil Artin und Helmut Hasse: Die Korrespondenz 1923--1934], edited and commented by G.~Frei and P.~Roquette, with F.~Lemmermeyer, Universitätsverlag Göttingen, 2008. #link("https://univerlag.uni-goettingen.de/handle/3/isbn-978-3-940344-50-2")[Publisher's edition].]
#bibitem([2])[S.~Baier and M.~P.~Young, Mean values with cubic characters, #emph[J. Number Theory] #strong[130] (2010), no.~4, 879--903. #link("https://doi.org/10.1016/j.jnt.2009.11.007")[doi:10.1016/j.jnt.2009.11.007]. The cited equation numbering is that of #link("https://arxiv.org/abs/0804.2233v4")[arXiv:0804.2233v4].]
#bibitem([3])[E.~Bombieri, On the large sieve, #emph[Mathematika] #strong[12] (1965), no.~2, 201--225. #link("https://doi.org/10.1112/S0025579300005313")[doi:10.1112/S0025579300005313].]
#bibitem([4])[A.~Buchstab, Asymptotische Abschätzung einer allgemeinen zahlentheoretischen Funktion, #emph[Rec. Math. \[Mat. Sbornik\] N.S.] #strong[2(44)] (1937), no.~6, 1239--1246 (Russian, with a German summary). #link("https://www.mathnet.ru/eng/sm5649")[MathNet record and original text].]
#bibitem([5])[A.~Dunn and M.~Radziwiłł, Bias in cubic Gauss sums: Patterson's conjecture, #emph[Ann. of Math.] (2) #strong[200] (2024), no.~3, 967--1057. #link("https://doi.org/10.4007/annals.2024.200.3.3")[doi:10.4007/annals.2024.200.3.3]. Author version: #link("https://arxiv.org/abs/2109.07463v3")[arXiv:2109.07463v3].]
#bibitem([6])[K.~Ford and H.~Halberstam, The Brun--Hooley sieve, #emph[J. Number Theory] #strong[81] (2000), no.~2, 335--350. #link("https://doi.org/10.1006/jnth.1999.2479")[doi:10.1006/jnth.1999.2479].]
#bibitem([7])[M.~Goldfeld, Artin's conjecture on the average, #emph[Mathematika] #strong[15] (1968), no.~2, 223--226. #link("https://doi.org/10.1112/S0025579300002606")[doi:10.1112/S0025579300002606].]
#bibitem([8])[L.~Goldmakher and B.~Louvel, A quadratic large sieve inequality over number fields, #emph[Math. Proc. Cambridge Philos. Soc.] #strong[154] (2013), no.~2, 193--212. #link("https://doi.org/10.1017/S0305004112000370")[doi:10.1017/S0305004112000370].]
#bibitem([9])[R.~Gupta and M.~R.~Murty, A remark on Artin's conjecture, #emph[Invent. Math.] #strong[78] (1984), no.~1, 127--130. #link("https://doi.org/10.1007/BF01388719")[doi:10.1007/BF01388719].]
#bibitem([10])[E.~Hasanalizade, Q.~Shen, and P.-J.~Wong, Counting zeros of Dedekind zeta functions, #emph[Math. Comp.] #strong[91] (2022), no.~333, 277--293. #link("https://doi.org/10.1090/mcom/3665")[doi:10.1090/mcom/3665].]
#bibitem([11])[D.~R.~Heath-Brown, Artin's conjecture for primitive roots, #emph[Quart. J. Math. Oxford] (2) #strong[37] (1986), no.~1, 27--38. #link("https://doi.org/10.1093/qmath/37.1.27")[doi:10.1093/qmath/37.1.27].]
#bibitem([12])[D.~R.~Heath-Brown, A mean value estimate for real character sums, #emph[Acta Arith.] #strong[72] (1995), no.~3, 235--275. #link("https://doi.org/10.4064/aa-72-3-235-275")[doi:10.4064/aa-72-3-235-275].]
#bibitem([13])[C.~Hooley, On Artin's conjecture, #emph[J. Reine Angew. Math.] #strong[225] (1967), 209--220. #link("https://doi.org/10.1515/crll.1967.225.209")[doi:10.1515/crll.1967.225.209].]
#bibitem([14])[A.~Hoshi and K.~Kanai, Davenport and Hasse's theorems and lifts of multiplication matrices of Gaussian periods, #emph[Finite Fields Appl.] #strong[84] (2022), article~102101. #link("https://doi.org/10.1016/j.ffa.2022.102101")[doi:10.1016/j.ffa.2022.102101].]
#bibitem([15])[D.~A.~Kazhdan and S.~J.~Patterson, Metaplectic forms, #emph[Publ. Math. Inst. Hautes Études Sci.] #strong[59] (1984), 35--142. #link("https://doi.org/10.1007/BF02698770")[doi:10.1007/BF02698770].]
#bibitem([16])[D.~A.~Kazhdan and S.~J.~Patterson, Corrections to #emph[Metaplectic forms], #emph[Publ. Math. Inst. Hautes Études Sci.] #strong[62] (1985), 203. #link("https://doi.org/10.1007/BF02698809")[doi:10.1007/BF02698809].]
#bibitem([17])[O.~Klurman, I.~E.~Shparlinski, and J.~Teräväinen, On Artin's conjecture on average and short character sums, #emph[Bull. Lond. Math. Soc.] #strong[57] (2025), no.~8, 2429--2443. #link("https://doi.org/10.1112/blms.70103")[doi:10.1112/blms.70103].]
#bibitem([18])[T.~Kubota, Topological covering of $upright(S L) \( 2 \)$ over a local field, #emph[J. Math. Soc. Japan] #strong[19] (1967), no.~1, 114--121. #link("https://doi.org/10.2969/jmsj/01910114")[doi:10.2969/jmsj/01910114].]
#bibitem([19])[J.~Neukirch, #emph[Algebraic Number Theory], translated by N.~Schappacher, Grundlehren der mathematischen Wissenschaften, vol.~322, Springer, Berlin, 1999. #link("https://doi.org/10.1007/978-3-662-03983-0")[doi:10.1007/978-3-662-03983-0].]
#bibitem([20])[OpenAI, Weighted dilation graphs, smooth shifted primes and totient fibers, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Weighted-Dilation-Graphs-Smooth-Shifted-Primes-and-Totient-Fibers-September-24-2026/paper.pdf")[OAI:Weighted-Dilation-Graphs-Smooth-Shifted-Primes-and-Totient-Fibers-September-24-2026], 2026. Lemmas~2.9 and~7.4.]
#bibitem([21])[OpenAI, The Poisson--Dirichlet law for prime predecessors, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Poisson-Dirichlet-Law-for-Prime-Predecessors-September-24-2026/paper.pdf")[OAI:The-Poisson-Dirichlet-Law-for-Prime-Predecessors-September-24-2026], 2026. Theorem~3.1 and Sections~3--5.]
#bibitem([22])[OpenAI, Prime Predecessors with an Even Number of Prime Factors, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Prime-Predecessors-with-an-Even-Number-of-Prime-Factors-September-17-2026/paper.pdf")[OAI:Prime-Predecessors-with-an-Even-Number-of-Prime-Factors-September-17-2026], 2026. Section~3, especially Lemmas~3.1 and~3.3.]
#bibitem([23])[OpenAI, The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane $upright(R e) \( s \) > 7 \/ 8$, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/paper.pdf")[OAI:The-Quasi-Riemann-Hypothesis-September-30-2026], 2026. Part~I, Sections~5--7.]
#bibitem([24])[S.~J.~Patterson, A cubic analogue of the theta series, #emph[J. Reine Angew. Math.] #strong[296] (1977), 125--161. #link("https://doi.org/10.1515/crll.1977.296.125")[doi:10.1515/crll.1977.296.125].]
#bibitem([25])[S.~J.~Patterson, A cubic analogue of the theta series. II, #emph[J. Reine Angew. Math.] #strong[296] (1977), 217--220. #link("https://doi.org/10.1515/crll.1977.296.217")[doi:10.1515/crll.1977.296.217].]
#bibitem([26])[P.~J.~Stephens, An average result for Artin's conjecture, #emph[Mathematika] #strong[16] (1969), no.~2, 178--188. #link("https://doi.org/10.1112/S0025579300008159")[doi:10.1112/S0025579300008159].]
#bibitem([27])[J.~T.~Tate, Fourier analysis in number fields and Hecke's zeta-functions, in #emph[Algebraic Number Theory], edited by J.~W.~S.~Cassels and A.~Fröhlich, Academic Press, London, 1967, 305--347. #link("https://math.arizona.edu/~cais/scans/Cassels-Frohlich-Algebraic_Number_Theory.pdf")[Scan of the volume].]
#bibitem([28])[J.~Thorner and A.~Zaman, A unified and improved Chebotarev density theorem, #emph[Algebra Number Theory] #strong[13] (2019), no.~5, 1039--1068. #link("https://doi.org/10.2140/ant.2019.13.1039")[doi:10.2140/ant.2019.13.1039].]
#bibitem([29])[A.~I.~Vinogradov, On the density hypothesis for Dirichlet $L$-series, #emph[Izv. Akad. Nauk SSSR Ser. Mat.] #strong[29] (1965), no.~4, 903--934 (Russian). #link("https://www.mathnet.ru/eng/im3080")[MathNet record and original text]. Correction, #emph[ibid.] #strong[30] (1966), no.~3, 719--720; #link("https://www.mathnet.ru/eng/im2856")[MathNet record and correction].]
#bibitem([30])[A.~Weil, Sur certains groupes d'opérateurs unitaires, #emph[Acta Math.] #strong[111] (1964), 143--211. #link("https://doi.org/10.1007/BF02391012")[doi:10.1007/BF02391012].]


