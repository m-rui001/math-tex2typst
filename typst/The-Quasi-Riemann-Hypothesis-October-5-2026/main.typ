#set page(paper: "us-letter", margin: (x: 70.9pt, y: 70.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Quasi-Riemann Hypothesis]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

For a primitive Dirichlet character $chi$ of conductor $q$,
  the associated #emph[Dirichlet $L$-function] is defined for $"Re" s > 1$ by the formula

$ L \( s \, chi \) = sum_(n gt.eq 1) frac(chi \( n \), n^s) \, wide "Re" s > 1 \, $

and admits a meromorphic continuation to $s in bb(C)$ [22] §4.6.
  When $chi$ is the trivial character, $L \( s \, chi \)$ recovers the Riemann zeta function $zeta \( s \)$ [41].

The zeros of Dirichlet $L$-functions are of significant interest,
  such as for their role in governing the distribution of primes in arithmetic progressions.
  The #emph[Generalized Riemann Hypothesis] predicts that all zeros of $L \( s \, chi \)$ in the critical strip
  $0 < "Re" s < 1$ satisfy $"Re" s = 1 \/ 2$. For $zeta \( s \)$,
  the weaker assertion that there exists $epsilon > 0$ such that $zeta \( s \)$ has no zeros in $"Re" s > 1 -
  epsilon$ is called a #emph[quasi-Riemann Hypothesis] (e.g., in [2] §1, [34] p. 274, and [4] §2).
  For Dirichlet $L$-functions, we consider the analogous assertion with a single $epsilon >
  0$ valid for every primitive character $chi$, independently of both conductor and height.

Let $K = bb(Q) \( sqrt(- 3) \)$. The main result of this paper is the following.

#thm([Theorem 1.1.])[
  #emph[Every finite-order Hecke $L$-function over $K$ has no zeros in the half-plane $"Re" s > 11 \/ 12$.
    Thus every Dirichlet $L$-function, including $zeta \( s \)$, has no zeros for $"Re" s > 11 \/ 12$.]
] <thm:main>

Section 3 proves the theorem assuming Proposition 3, whose proof is completed in Section 5.6.

Theorem 1 is a natural intermediate step toward the stronger zero-free region $"Re" s > 7 \/
  8$ established in [36] Theorem 1.1. For simplicity, we have isolated Theorem 1 and its proof here.
  By a standard explicit-formula argument (see [6] Chapters 19–20),
  Theorem 1 gives the following quantitative form of the prime number theorem in arithmetic progressions.

#thm([Corollary 1.2.])[
  #emph[Let $pi \( x \; q \, a \)$ count the primes $p lt.eq x$ with $p equiv a med \( mod med q \)$.
    Write $phi$ for Euler’s totient function. For $x gt.eq 2$,
$ sup_(1 lt.eq q lt.eq x\
\( a \, q \) = 1) \| pi \( x \; q \, a \) - frac(1, phi \( q \)) integral_2^x frac(thin d t, log t)
  #scale(x: 240%, y: 240%)[\|] lt.double x^(11 \/ 12) log x \, $

 where the implied constant is absolute and effective.]
] <cor:primes-ap>

Theorem 1 has a number of additional arithmetic consequences.
  By the zero-free-region method originating with Rodosskiı̆ [42], in the form recorded in [33] Theorem 13.12,
  the least quadratic nonresidue modulo an odd prime $p$ is bounded by a fixed power of $log p$,
  which in particular proves Vinogradov’s conjecture [49] that this nonresidue is $lt.double_epsilon
  p^epsilon$ for every $epsilon > 0$. See also Bhargava, Ivanyos, Mittal,
  and Saxena [3] Theorem 6.7 for this consequence of a fixed zero-free half-plane.
  From a computational number theory perspective, this bound allows square roots modulo $p$ to be extracted
  deterministically in time polynomial in $log p$ using the Tonelli–Shanks algorithm (see [11] §2.9).
  Theorem 1 also yields a deterministic polynomial-time implementation of Miller’s primality test [32];
  note that polynomial-time primality testing was previously known unconditionally via the Agrawal–Kayal–Saxena
  algorithm [1]. For negative fundamental discriminants $D$, Littlewood’s short Euler-product argument [29],
  applied to the fixed zero-free half-plane in Theorem 1, together with Dirichlet’s class-number formula (see [6]
  Chapter 6), yields the effective class-number bound $h \( D \) gt.double sqrt(\| D \|) \/ log log \| D \|$,
  with an absolute computable implied constant. The class-group computations of Elsenhans, Klüners,
  and Nicolae [8] Theorem 2, building on Weinberger [50], give a complete list of imaginary quadratic fields with
  class-group exponent dividing two when there are no Landau–Siegel zeros.
  Together with Grube’s characterization of idoneal numbers and his reduction to fundamental discriminants [15]
  (see [23] Theorem 6 and §2.3), this shows that Theorem 1 confirms the completeness of Euler’s list of 65 idoneal
  numbers.

=== 1.1 Prior work <prior-work>

There is a long line of work establishing zero-free regions for Dirichlet $L$-functions.
  Hadamard and de la Vallée Poussin proved the Prime Number Theorem in 1896 by establishing that $zeta \( s \)$
  has no zeros on the line $"Re" s = 1$ [16,46]. De la Vallée Poussin subsequently obtained a quantitative
  zero-free region to the left of this line [47]. For nonprincipal primitive Dirichlet characters,
  the classical zero-free-region theorem of Grönwall and Titchmarsh [14,45],
  in the modern form given in [22] Theorem 5.26 (see also [6] Chapter 14), gives an absolute,
  effective constant $c_0 > 0$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ L \( sigma + upright(i) t \, chi \) eq.not 0 quad upright("if") quad sigma > 1 -
   frac(c_0, log \( q \( \| t \| + 3 \) \)) \, $ <eq:intro-classical-region>]

with at most one exception for each primitive character. Any exception is a simple real zero,
  can occur only if $chi$ is quadratic, and is called a #emph[Landau–Siegel zero].
  Theorem 1 rules out the existence of such a zero.

There are two parameters in (1.1): the conductor $q$ and the height $\| t \|$.
  Even when $q$ is fixed, its width tends to zero with the height.
  Vinogradov and Korobov developed methods [48,24] to prove that

#[#set math.equation(numbering: n => "(1.2)")
 $ zeta \( sigma + upright(i) t \) eq.not 0 quad upright("if") quad sigma > 1 -
   frac(c_1, \( log \| t \| \)^(2 \/ 3) \( log log \| t \| \)^(1 \/ 3)) \, wide \| t \| gt.eq 3 \,
   $ <eq:intro-vk-region>]

for an absolute $c_1 > 0$ (Ford [9] gives an explicit value of $c_1$).
  The assertion of Theorem 1 is a half-plane of fixed width, independent of both conductor and height.

As we will see in the outline, the proof of Theorem 1 draws on modern developments in character large sieves and
  metaplectic theta series. In particular, the connection between cubic Gauss sums and cubic theta coefficients
  [26,38] links the argument to work on Patterson’s conjecture by Heath-Brown and Patterson [20],
  Heath-Brown [19], and Dunn and Radziwiłł [7]. The recursive large-sieve arguments also build on Heath-Brown’s
  proof of the quadratic large sieve inequality [18].

=== 1.2 Organization <organization>

Section 2 gives a high-level outline of the argument. Section 3 deduces the zero-free region from a mean-square
  estimate for twisted Möbius sums. Section 4 reduces this estimate to a dual mean square with cubic Gauss-sum
  coefficients. Section 5 states the completed mean-square and transfer estimates,
  combines them into a recursive inequality, and proves the required mean-square bound.
  Sections 6 and 7 prove the completed estimate and the bounds for the remaining cube-divisor sums, respectively.
  Appendix 8 supplies the arithmetic identities and the detailed theta calculation.
  Appendix 9 records the smooth separation lemma used throughout.

=== 1.3 Notation <notation>

Write $cal(O) = cal(O)_K = bb(Z) \[ omega \]$, where $omega = e^(2 pi upright(i) \/ 3)$.
  For $a in K$, write $upright(N)_(K \/ bb(Q)) \( a \) = a overline(a) = \| a \|^2$ for its norm.
  For a nonzero integral ideal $frak(a) subset.eq cal(O)$, write
  $upright(N)_(K \/ bb(Q)) \( frak(a) \) = \# \( cal(O) \/ frak(a) \)$.
  We use $upright(bold(1))_(cal(C))$ for the indicator of a condition $cal(C)$.
  For a prime ideal represented by $p$ and a nonzero element or ideal $a$,
  write $v_p \( a \)$ for its exponent in the prime factorization of $a$.

We use standard asymptotic notation, writing $f = O \( g \)$ or $f lt.double g$ when $\| f \| lt.eq C g$,
  where $g gt.eq 0$ and $C > 0$ is an absolute constant unless otherwise specified.
  Subscripts indicate possible dependence of the implied constant:
  for example, $f lt.double_(nu \, W \, epsilon) g$ means $\| f \| lt.eq C_(nu \, W \, epsilon) g$,
  where the constant may depend on $nu \, W \, epsilon$ but is uniform in all other varying parameters.
  For nonnegative $f \, g$, we write $f asymp g$ when $f lt.double g$ and $g lt.double f$.
  A dyadic norm range is an interval $R lt.eq upright(N)_(K \/ bb(Q)) \( a \) < 2 R$;
  a sum over dyadic scales uses $R = 2^j$.

We use $D gt.eq 2$ as an ambient size parameter; in the main argument,
  it is the original norm scale introduced in the outline below.
  Auxiliary scales may vary within ranges bounded by fixed powers of $D$. We write

$ A prec.curly.eq B quad upright("if") quad A lt.double_epsilon D^epsilon B wide upright("for every ") epsilon > 0 \, $

uniformly in the varying parameters over their stated ranges.
  Implied constants may also depend on the fixed data specified in each statement.

== 2 Outline of the argument <sec:outline>

In this section, we sketch the proof of Theorem 1, suppressing various coprimality conditions, local factors,
  and details of smoothing. The precise statements appear in Sections 3–7.

=== 2.1 Step 1: Reduction to power-saving estimates for twisted Möbius sums <step-1-reduction-to-power-saving-estimates-for-twisted-möbius-sums>

Fix a finite-order Hecke character $nu$ of $K$. Let $L_K \( s \, nu \)$ be the corresponding Hecke $L$-function.
  We extend $nu$ by zero to ideals not coprime to its conductor.
  We will deduce Theorem 1 from a power-saving estimate for $nu$-twisted Möbius sums.

Let $mu$ denote the ideal Möbius function on $K$. All original ideal sums run over nonzero integral ideals.
  As in Section 3, the ideals in these sums are understood to be prime to $2$, $3$, and the conductor of $nu$.
  For a norm scale $D > 0$, consider

$ A_1 \( D \) = sum_(frak(n)) mu \( frak(n) \) nu \( frak(n) \) W \( upright(N)_(K \/ bb(Q)) \( frak(n) \) \/ D \) \, $

where $W in C_c^oo \( \( 0 \, oo \) \; bb(C) \)$ is a smooth cutoff function.
  Thus $A_1 \( D \)$ is a smoothed $nu$-twisted Möbius sum over ideals of norm comparable to $D$,
  with roughly $D$ terms. We seek a power saving over this size: for a fixed $delta > 0$ and every $epsilon > 0$,

#[#set math.equation(numbering: n => "(2.1)")
 $ A_1 \( D \) lt.double_(nu \, W \, epsilon) D^(1 - delta + epsilon) upright(" for every ") W in
   C_c^oo \( \( 0 \, oo \) \; bb(C) \) . $ <eq:power-savings>]

The implication from (2.1) to a zero-free half-plane is the smoothed Hecke version of the classical relation
  between Möbius sums and zero-free regions. In the zeta-function case,
  the equivalence between the Riemann Hypothesis and the bound $sum_(n lt.eq x) mu \( n \) lt.double_epsilon
  x^(1 \/ 2 + epsilon)$ is due to Littlewood [28]; see also [31] §1. Section 3 gives the complete argument needed here.

=== 2.2 Step 2: Embedding the sum in a family <step-2-embedding-the-sum-in-a-family>

In order to estimate $A_1 \( D \)$, we embed it into a family of such sums, parametrized by $u in cal(O)_K$,
  by introducing a sextic twist. We call an element of $cal(O)$ #emph[primary] if it is congruent to $1$ modulo
  $3$. The ring $cal(O) = bb(Z) \[ omega \]$ is Euclidean, so it has unique factorization and every ideal is
  principal; for an ideal coprime to $3$, multiplying any generator by a unique unit gives $n equiv
  1 med \( mod med 3 \)$, since the six units represent the six invertible residue classes modulo $3$.
  For a primary element $n$, we write $mu \( n \) = mu \( \( n \) \)$ and $nu \( n \) = nu \( \( n \) \)$;
  divisor sums count each ideal divisor once, using its primary generator.
  For an ideal $frak(n)$ prime to $6$, use its unique primary generator $n$ and write

$ chi_(frak(n)) \( u \) = chi_n \( u \) = \( u \/ n \)_6 . $

Here $\( u \/ n \)_6$ is the sextic residue symbol, extended by zero when $\( u \, n \) eq.not
  1$.#footnote[For a primary prime $p divides.not 6$ and $p divides.not u$,
  $\( u \/ p \)_6$ is the unique sixth root of unity congruent to
  $u^(\( upright(N)_(K \/ bb(Q)) \( p \) - 1 \) \/ 6)$ modulo $p$; set $\( u \/ p \)_6 = 0$ when $p divides u$.
  Extend multiplicatively in the denominator to define $chi_n \( u \) = \( u \/ n \)_6$ for primary $n$ coprime to
  $6$. For the unit ideal, $chi_1 \( u \) = 1$ for every $u$, including $u =
  0$.] We also write $\( u \/ n \)_2$ and $\( u \/ n \)_3$ for the quadratic and cubic residue symbols,
  defined by the same convention with $6$ replaced by $2$ and $3$, respectively.
  When $\( n \, 6 \) = 1$, they equal $chi_n \( u \)^3$ and $chi_n \( u \)^2$.
  Restrictions that keep these symbols defined are understood when omitted in the outline. The family is

#[#set math.equation(numbering: n => "(2.2)")
 $ A_u \( D \) = sum_(frak(n)) mu \( frak(n) \) nu \( frak(n) \) chi_(frak(n)) \( u \)
   W \( upright(N)_(K \/ bb(Q)) \( frak(n) \) \/ D \) . $ <eq:intro-family>]

Fix $0 < theta.alt lt.eq 1 \/ 10$. The crucial estimate, Proposition 3, is that

#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( u \) lt.eq H) \| A_u \( D \) \|^2
   lt.double_(nu \, W \, theta.alt \, epsilon) D^(1 + epsilon) H \, wide H = D^(1 + theta.alt) . $ <eq:intro-ms>]

In a mean square, we call the variable in the outer sum the #emph[row] and the variable in the inner sum the
  #emph[column]. In (2.3) these are $u$ and $frak(n)$, respectively.
  Up to the factor of $D^epsilon$, (2.3) can be thought of as saying that the family ${
  A_u \( D \) }$ exhibits “square-root cancellation” on average (in the $L^2$ sense) over $u$.

The mean-square estimate (2.3) gives the desired power saving for $A_1 \( D \)$ because $A_(p^6) \( D \) approx
  A_1 \( D \)$ for many primes $p$. For a primary prime $p$ with $Y \/ 2 < upright(N)_(K \/ bb(Q)) \( p \) lt.eq
  Y$, the identity $chi_n \( p^6 \) = upright(bold(1))_(p divides.not n)$ leaves only $O_W \( D \/ Y \)$ differing
  terms and hence gives

#[#set math.equation(numbering: n => "(2.4)")
 $ A_(p^6) \( D \) = A_1 \( D \) + O_W \( D \/ Y \) . $ <eq:A_u-vs-A_1>]

By Landau’s prime ideal theorem [27] (see [22] Theorem 5.33), there are $asymp Y \/ log Y$ choices of such $p$.
  Taking $Y = H^(1 \/ 6)$, considering the contribution of such terms to (2.3) and using (2.4) gives

#[#set math.equation(numbering: n => "(2.5)")
 $ \| A_1 \( D \) \|^2 lt.double D^(1 + epsilon) H^(5 \/ 6) + D^2 H^(- 1 \/ 3) . $ <eq:intro-extraction>]

With $H = D^(1 + theta.alt)$, this gives $A_1 \( D \) lt.double
  D^(11 \/ 12 + 5 theta.alt \/ 12 + epsilon)$ for every fixed $0 < theta.alt lt.eq 1 \/ 10$.
  Choosing $theta.alt$ sufficiently small for each requested exponent loss yields $A_1 \( D \)
  lt.double_(nu \, W \, epsilon) D^(11 \/ 12 + epsilon)$. Therefore it remains to establish (2.3).

=== 2.3 Step 3: Poisson summation <step-3-poisson-summation>

We turn to the task of proving the mean-square estimate (2.3).
  Now that we have introduced the row variable $u$, we can apply Poisson summation in this variable.
  This introduces sextic Gauss sums, arising from the Fourier transforms of the sextic characters.
  Upon application of the Gauss–Jacobi identities, these sextic Gauss sums absorb the factor of $mu$ and turn into
  cubic Gauss sums. We interpret the resulting cubic Gauss sums as coefficients of Kubota’s cubic theta function.
  In the next step, we use the automorphy of this theta function.
  For now, we explain the appearance of these Gauss sums in more detail.

Define the additive character

$ e \( z \) = exp \( 4 pi upright(i) thin "Im" z \/ sqrt(3) \) quad \( z in bb(C) \) . $

For a squarefree Eisenstein integer $n equiv 1 med \( mod med 3 \)$ prime to $6$ and an integer $j$,
  define the normalized Gauss sums

#[#set math.equation(numbering: n => "(2.6)")
 $ gamma_j \( n \) = 1 / sqrt(upright(N)_(K \/ bb(Q)) \( n \)) sum_(x med mod med n) chi_n \( x \)^j
   e \( x \/ n \) . $ <eq:intro-gauss-sum>]

For $j = - 1$, we interpret $chi_n^(- 1)$ as the conjugate character $overline(chi_n)$.

Consider the classical identity

$ (frac(- 1, m)) = (1 / sqrt(m) sum_(x med mod med m) (x / m) e^(2 pi i x \/ m))^2 \, $

where $m$ is an odd squarefree positive integer and the symbols are Jacobi symbols.
  We would like a similar decomposition for $mu$ instead of $(frac(- 1, m))$.
  Following the work of Hasse [17] pp. 443–445 and Heath-Brown [19] (2),
  we derive the following identity in Appendix 8.1, valid for squarefree primary $n$ away from a fixed set of
  excluded primes:

$ mu \( n \) gamma_(- 1) \( n \) = chi_n \( - 1 \) G \( n \)^(- 1) overline(alpha \( n \)) gamma_2 \( n \) \, wide
  alpha \( n \) = frac(n, \| n \|) \, quad G \( n \) = overline(chi_n \( 4 \)) gamma_3 \( n \) . $

Here $G \( n \)$ is a fixed ray-class factor. The factor $gamma_(- 1) \( n \)$ comes from Poisson summation;
  as promised, it combines with $mu \( n \)$ to produce the cubic coefficient $overline(alpha \( n \))
  gamma_2 \( n \)$ (up to ray-class factors). Further details are given in Section 4.

We call the sums obtained after applying Poisson summation #emph[dual sums].#footnote[For this terminology,
  see [40] p. 440, [25] §2.3, and [10] arXiv abstract.] Rearranging these dual sums reduces the problem of
  estimating $sum_u \| A_u \( D \) \|^2$ to estimating the following family of column sums (for clarity,
  we have suppressed auxiliary twists and coprimality conditions):

#[#set math.equation(numbering: n => "(2.7)")
 $ B_h \( X \) = sum_(n in cal(O)\
n equiv 1 med \( 3 \)\
n med upright("squarefree")) overline(alpha \( n \)) gamma_2 \( n \) xi \( n \) chi_n \( h \)
  U \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \) . $ <eq:intro-gauss-family>]

Here $h$ is the new row variable, Fourier dual to $u$, while $U$ is a smooth weight restricting the column
  variable $n$ to norm comparable to $X$. We choose $xi$ to be either $nu eta$ or $overline(nu) eta$,
  where $eta$ ranges over a finite set of ray class characters of fixed modulus.#footnote[The ray class group
  modulo an ideal $frak(m)$ is the group of fractional ideals prime to $frak(m)$,
  modulo principal ideals generated by elements congruent to $1$ modulo $frak(m)$.
  A ray class character is a character of this finite group.
  For an element prime to $frak(m)$, its ray class means the class of its principal ideal.] For each choice of
  $xi$, this defines a family of sums $B_h \( X \)$.

After treating the diagonal and separating the smooth weights, we roughly get that

#[#set math.equation(numbering: n => "(2.8)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( u \) lt.eq H) \| A_u \( D \) \|^2 prec.curly.eq D H + H /
   D sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| B_h \( D \) \|^2 . $ <eq:intro-poisson-comparison>]

Here $cal(H) asymp D^2 \/ H$ is the dual norm scale. This schematic comparison suppresses the common factors
  arising when the square is expanded. Thus the desired estimate is

#[#set math.equation(numbering: n => "(2.9)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| B_h \( D \) \|^2 prec.curly.eq D^2 .
   $ <eq:intro-dual-ms>]

=== 2.4 Step 4: Relation to cubic Gauss sums and Kubota’s cubic theta function <step-4-relation-to-cubic-gauss-sums-and-kubotas-cubic-theta-function>

To estimate (2.9), we first identify the cubic Gauss coefficients with Fourier coefficients of a theta function.
  Its transformation law applies to a sum with extra cube factors, which we will remove in Step 5.

Let $theta \( z \, v \)$ be Kubota’s cubic theta function on hyperbolic three-space ($z in bb(C)$,
  $v in bb(R)_(> 0)$), obtained as a residue of a cubic metaplectic Eisenstein series [26,38].
  We use the normalization of [7] §5.1, (5.6)–(5.8), recalled below in (6.1).

Put $lambda = 1 + 2 omega$. For primary elements $n \, b in cal(O) = bb(Z) \[ omega \]$,
  with $n$ squarefree and $\( n b \, 6 \) = 1$, let $c_theta \( n b^3 \)$ denote the Fourier coefficient of
  $overline(theta)$ indexed by $lambda^(- 3) n b^3$ in its expansion in $z$.
  Patterson’s formula [38] Theorem 8.1, recorded in [7] (5.7), gives

#[#set math.equation(numbering: n => "(2.10)")
 $ c_theta \( n b^3 \) = 3^(5 \/ 2) \| b \| thin overline(chi_n \( lambda \)^2) gamma_2 \( n \) .
   $ <eq:intro-theta-coefficients>]

Taking $b = 1$ in (2.10) and substituting into (2.7) yields

#[#set math.equation(numbering: n => "(2.11)")
 $ B_h \( X \) = 3^(- 5 \/ 2) sum_(n in cal(O)\
n equiv 1 med \( 3 \)\
n med upright("squarefree")) c_theta \( n \) overline(alpha \( n \)) chi_n \( lambda \)^2 xi \( n \) chi_n \( h \)
  U \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \) . $ <eq:intro-theta-family>]

Thus (2.11) expresses $B_h \( X \)$ as a smoothed, twisted sum of the squarefree-index coefficients of
  $overline(theta)$. This connection was used by Heath-Brown and Patterson to study Kummer sums [20].

To use the summation formula for theta coefficients, we embed the sum (2.11) in a completed sum,
  by including terms indexed by $n b^3$. This use of cube completion follows Dunn and Radziwiłł [7] Lemma 5.4 and
  Proposition 5.3, with the underlying theta coefficients given by Patterson [38] Theorem 8.1.
  For fixed $h$, $xi$, and $U$, define

#[#set math.equation(numbering: n => "(2.12)")
 $ T_h \( X \) := frac(1, 3^(5 \/ 2) sqrt(X)) sum_(n \, b in cal(O)\
n \, b equiv 1 med \( 3 \)\
n med upright("squarefree")) c_theta \( n b^3 \) overline(alpha \( n b^3 \)) chi_(n b^3) \( lambda \)^2
  xi \( n b^3 \) chi_(n b^3) \( h \) U \( upright(N)_(K \/ bb(Q)) \( n b^3 \) \/ X \) .
  $ <eq:intro-completed-theta-sum>]

The $b = 1$ terms are exactly $X^(- 1 \/ 2) B_h \( X \)$;
  the other terms supply the cube indices in the theta expansion.
  The first goal is to bound the mean square of $T_h \( X \)$ over $h$.

The automorphy of $theta$ gives a summation formula that transforms the completed column sum $T_h \( X \)$,
  with the row $h$ held fixed, into dual sums of theta coefficients with new smooth weights and character twists.
  A cusp is represented by a boundary point in $K union { oo }$.
  A #emph[cusp expansion] is the Fourier expansion in the horizontal variable after a change of coordinates taking
  infinity to that point. We call its Fourier coefficients #emph[cusp coefficients].
  Our starting point is a variant (established in Appendix 8.2) of the theta transformation of Dunn and
  Radziwiłł [7] §5, extending work of Patterson [38] and Yoshimoto [51].
  The key point is how the character twists change. Suppose for illustration that $h$ is squarefree and primary,
  with $\( h \, 6 \) = 1$. Then, by Proposition 14, the transformed expression is a finite linear combination of
  sums of the form

#[#set math.equation(numbering: n => "(2.13)")
 $ sum_(0 eq.not m in cal(O)) frac(d_theta \( m \) alpha \( m \), sqrt(upright(N)_(K \/ bb(Q)) \( m \))) thin
   chi_h \( m \)^3 V_(*)^sharp #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(upright(N)_(K \/ bb(Q)) \( m \) X, upright(N)_(K \/ bb(Q)) \( h \)^2) #scale(x: 180%, y: 180%)[\)] .
   $ <eq:intro-dual-theta-sum>]

The dual column index is $m$, while $h$ remains the row index.
  Here $d_theta \( m \)$ denotes the coefficient at the Fourier index $lambda^(- 4)
  m$ in a cusp expansion of $overline(theta)$, and $V_(*)^sharp$ is the transform in (6.6),
  applied to $V_(*) \( y \) = y^(1 \/ 2) U \( y \)$. We have suppressed a finite sum over these cusp expansions,
  fixed periodic twists, bounded prefactors, and fixed scale constants.
  Within each fixed ray class of $h$, the coefficient sequences and transformed weights are independent of $h$ by
  Lemma 15. Proposition 14 gives the precise formula, writing $d \( ell \)$ for the cusp coefficient at $ell =
  lambda^(- 4) m$.

Since $V_(*)^sharp$ decays rapidly at infinity, the effective norm range in (2.13) is
  $upright(N)_(K \/ bb(Q)) \( m \) lt.double upright(N)_(K \/ bb(Q)) \( h \)^2 \/ X$,
  in place of the original range $upright(N)_(K \/ bb(Q)) \( n b^3 \) asymp X$.
  These dual sums arise from the theta transformation and involve theta coefficients on the transformed scale,
  now twisted by the quadratic character $chi_h^3$. This character arises because, at each prime $p divides h$,
  the Fourier and theta factors combine as

#[#set math.equation(numbering: n => "(2.14)")
 $ chi_p^(- 1) chi_p^(- 2) = chi_p^(- 3) = chi_p^3 . $ <eq:intro-quadratic-twist>]

Now a key point is that since $chi_p^3$ is quadratic, Goldmakher and Louvel’s quadratic large sieve [13]
  Theorem 1.1 and Corollary 1.2 (a generalization of Heath-Brown’s quadratic large sieve [18] to number fields)
  bounds the mean square of the sums in (2.13) as $h$ varies.
  For squarefree quadratic families with row and column norm ranges $M \, L$,
  the quadratic large sieve gives the factor $M + L$, up to $\( M L \)^epsilon$.
  Crucially, this avoids the additional term $\( M L \)^(2 \/ 3)$ in Blomer, Goldmakher,
  and Louvel’s general higher-order large sieve [5] Theorem 1.3.

We then apply Cauchy–Schwarz in the cube variable and the quadratic large sieve in the squarefree column variable
  to estimate the mean square of $T_h \( X \)$. The details are given in the proof of Proposition 10, which gives,
  for $cal(H) \, X gt.eq 1$,

#[#set math.equation(numbering: n => "(2.15)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| T_h \( X \) \|^2
   lt.double_(epsilon \, xi \, U) \( cal(H) X \)^epsilon #scale(x: 180%, y: 180%)[\(] cal(H) + cal(H)^2 /
   X #scale(x: 180%, y: 180%)[\)] . $ <eq:intro-completed-ms>]

At $X = D$ and $cal(H) lt.eq D$, the heuristic comparison $B_h \( D \) approx
  sqrt(D) thin T_h \( D \)$ would therefore give the desired $D^2$ bound.
  The remaining task is to justify the corresponding mean-square bound by removing the cube factors.

=== 2.5 Step 5: Removing the cube factors <step-5-removing-the-cube-factors>

We now pass from a mean-square bound for $T_h \( X \)$ to one for $X^(- 1 \/ 2) B_h \( X \)$,
  with both averages taken over $h$. Note that one cannot simply discard the terms with $b eq.not 1$,
  because the contributions from different $b$ can cancel. We begin by undoing the addition of cube factors using
  Möbius inversion. Related completions appear in Patterson [38] Theorem 6.1 and Heath-Brown [19] §3,
  with explicit removal of the cube factors by Möbius inversion in Dunn and Radziwiłł [7] Proposition 5.3 and (8.2).

Fix $h$ and $xi$, and write $P_h \( X \) = X^(- 1 \/ 2) B_h \( X \)$ for the $b = 1$ part of $T_h \( X \)$.
  Substituting the coefficient formula (2.10) into (2.12) gives

#[#set math.equation(numbering: n => "(2.16)")
 $ T_h \( X \) = sum_(b in cal(O)\
b equiv 1 med \( 3 \)) frac(w_h \( b \), upright(N)_(K \/ bb(Q)) \( b \)) thin P_h #h(-0.16667em)
  #scale(x: 180%, y: 180%)[\(] frac(X, upright(N)_(K \/ bb(Q)) \( b \)^3) #scale(x: 180%, y: 180%)[\)] \,
  $ <eq:intro-cube-completion>]

where

#[#set math.equation(numbering: n => "(2.17)")
 $ w_h \( b \) = overline(alpha \( b \))^(thin 3) xi \( b \)^3 chi_b \( h \)^3 . $ <eq:intro-cube-weight>]

Each factor in (2.17) is completely multiplicative in $b$.
  Thus $w_h \( b c \) = w_h \( b \) w_h \( c \)$ even when $b \, c$ share prime factors,
  and $\| w_h \( b \) \| lt.eq 1$. Möbius inversion (cf. [22] §1.3) gives

#[#set math.equation(numbering: n => "(2.18)")
 $ P_h \( X \) = sum_(d in cal(O)\
d equiv 1 med \( 3 \)) frac(mu \( d \) w_h \( d \), upright(N)_(K \/ bb(Q)) \( d \)) thin T_h #h(-0.16667em)
  #scale(x: 180%, y: 180%)[\(] frac(X, upright(N)_(K \/ bb(Q)) \( d \)^3) #scale(x: 180%, y: 180%)[\)] .
  $ <eq:intro-cube-inversion>]

Indeed, substituting (2.16) into (2.18) and grouping by the total cube index $b$ gives the factor $w_h \( b \)
  sum_(d divides b) mu \( d \)$, which is $1$ for $b = 1$ and $0$ otherwise.

The objective is now an estimate for $P_h$, rather than for the completed sum $T_h$.
  For the simplified family and the parameter ranges arising from Step 3, the required bound is

#[#set math.equation(numbering: n => "(2.19)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_h \( X \) \|^2
   lt.double_(epsilon \, xi \, U) \( cal(H) X \)^epsilon X . $ <eq:intro-cube-target>]

Since $B_h \( X \) = sqrt(X) thin P_h \( X \)$, this is equivalent to a bound of size $X^2$,
  up to the same small power, for the mean square of $B_h \( X \)$.

For $1 lt.eq H_c lt.eq X^(1 \/ 3)$, let $P_(h \, lt.eq H_c) \( X \)$ be the part of (2.18) with
  $upright(N)_(K \/ bb(Q)) \( d \) lt.eq H_c$. Applying weighted Cauchy–Schwarz for each fixed $h$,
  then summing over $h$ and using (2.15), gives

$ & sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_(h \, lt.eq H_c) \( X \) \|^2\
 & quad lt.eq #scale(x: 180%, y: 180%)[\(] sum_(upright(N)_(K \/ bb(Q)) \( e \) lt.eq H_c)
   frac(1, upright(N)_(K \/ bb(Q)) \( e \)) #scale(x: 180%, y: 180%)[\)] #scale(x: 180%, y: 180%)[\(]
   sum_(upright(N)_(K \/ bb(Q)) \( d \) lt.eq H_c) frac(1, upright(N)_(K \/ bb(Q)) \( d \))
   sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| T_h #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
   X \/ upright(N)_(K \/ bb(Q)) \( d \)^3 #scale(x: 120%, y: 120%)[\)] \|^2 #scale(x: 180%, y: 180%)[\)]\
 & quad prec.curly.eq sum_(upright(N)_(K \/ bb(Q)) \( d \) lt.eq H_c) frac(1, upright(N)_(K \/ bb(Q)) \( d \))
   #scale(x: 180%, y: 180%)[\(] cal(H) + frac(cal(H)^2 upright(N)_(K \/ bb(Q)) \( d \)^3, X)
   #scale(x: 180%, y: 180%)[\)] prec.curly.eq cal(H) + frac(cal(H)^2 H_c^3, X) . $

Thus

#[#set math.equation(numbering: n => "(2.20)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_(h \, lt.eq H_c) \( X \) \|^2
   lt.double_(epsilon \, xi \, U) \( cal(H) X \)^epsilon #scale(x: 180%, y: 180%)[\(] cal(H) +
   frac(cal(H)^2 H_c^3, X) #scale(x: 180%, y: 180%)[\)] . $ <eq:intro-short-cube-ms>]

For $cal(H) lt.eq X$, the estimate (2.20) is within the target (2.19) provided $cal(H)^2 H_c^3 \/ X lt.eq X$.
  Thus we apply the completed mean-square bound directly only up to the cutoff

#[#set math.equation(numbering: n => "(2.21)")
 $ H_c = min #h(-0.16667em) { X^(1 \/ 3) \, #scale(x: 180%, y: 180%)[\(] X /
   cal(H) #scale(x: 180%, y: 180%)[\)]^(2 \/ 3) #scale(x: 240%, y: 240%)[}] . $ <eq:intro-cube-cutoff>]

At the basic scales from Step 3,

$ X asymp D \, wide cal(H) asymp D^(1 - theta.alt) \, wide H_c asymp D^(2 theta.alt \/ 3) . $

The inverse sum can extend to $upright(N)_(K \/ bb(Q)) \( d \) asymp D^(1 \/ 3)$,
  so we must still control the larger divisors.

Write $tau_(upright("div")) \( b \)$ for the number of nonzero integral ideal divisors of $\( b \)$.
  Let $P_(h \, > H_c) \( X \)$ denote the terms with $upright(N)_(K \/ bb(Q)) \( d \) > H_c$ in (2.18),
  and put $L_b = X \/ upright(N)_(K \/ bb(Q)) \( b \)^3$. Substituting (2.16) into the truncated inversion formula
  for $P_(h \, > H_c) \( X \)$ obtained from (2.18), and grouping by $b = d c$, gives

$ P_(h \, > H_c) \( X \) & = sum_(upright(N)_(K \/ bb(Q)) \( d \) > H_c) sum_c
  frac(mu \( d \) w_h \( d \) w_h \( c \), upright(N)_(K \/ bb(Q)) \( d \) upright(N)_(K \/ bb(Q)) \( c \)) P_h
  #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(X, upright(N)_(K \/ bb(Q)) \( d c \)^3) #scale(x: 180%, y: 180%)[\)]\
 & =
   sum_(upright(N)_(K \/ bb(Q)) \( b \) > H_c)
   frac(beta_0 \( b \) chi_b \( h \)^3, upright(N)_(K \/ bb(Q)) \( b \)) P_h \( L_b \) \, $

where all indices are primary and

$ beta_0 \( b \) = overline(alpha \( b \))^(thin 3) xi \( b \)^3 sum_(d divides b\
upright(N)_(K \/ bb(Q)) \( d \) > H_c) mu \( d \) \, wide \| beta_0 \( b \) \| lt.eq tau_(upright("div")) \( b \) . $

The support of $U$ restricts $upright(N)_(K \/ bb(Q)) \( b \) lt.double_U X^(1 \/ 3)$.
  Weighted Cauchy–Schwarz for each $h$, followed by summation, gives

#[#set math.equation(numbering: n => "(2.22)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_(h \, > H_c) \( X \) \|^2 & lt.eq
   #scale(x: 180%, y: 180%)[\(] sum_b frac(tau_(upright("div")) \( b \), upright(N)_(K \/ bb(Q)) \( b \))
   #scale(x: 180%, y: 180%)[\)] sum_b frac(tau_(upright("div")) \( b \), upright(N)_(K \/ bb(Q)) \( b \))
   sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_h \( L_b \) \|^2\
 & prec.curly.eq sup_b sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_h \( L_b \) \|^2 .
   $ <eq:intro-long-cube-ms>]

Put $a_xi \( n \) = overline(alpha \( n \)) gamma_2 \( n \) xi \( n \)$. Write

$ E \( cal(H) \, X \) := 1 / X sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| sum_n^(*)
  a_xi \( n \) chi_n \( h \) U \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \) #scale(x: 180%, y: 180%)[\|]^2 . $

A star restricts an index to squarefree primary elements. By (2.7) and the definition of $P_h$, we have

$ E \( cal(H) \, X \) = 1 / X sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| B_h \( X \) \|^2 =
  sum_(0 < upright(N)_(K \/ bb(Q)) \( h \) lt.double cal(H)) \| P_h \( X \) \|^2 . $

At the scales from Step 3, our goal is to prove

#[#set math.equation(numbering: n => "(2.23)")
 $ E \( cal(H) \, X \) prec.curly.eq X . $ <eq:intro-energy-target>]

At $X = D$, this is precisely the bound (2.9) for the mean square of $B_h \( D \)$.
  Substitution into the Poisson comparison (2.8) then gives the required original mean-square estimate (2.3).
  Combining (2.20) for $P_(h \, lt.eq H_c)$ (the terms with $upright(N)_(K \/ bb(Q)) \( d \) lt.eq
  H_c$) and (2.22) for $P_(h \, > H_c)$ (the terms with $upright(N)_(K \/ bb(Q)) \( d \) > H_c$),
  with the cutoff (2.21), gives

$ E \( cal(H) \, X \) prec.curly.eq X + sup_(b : thin 1 lt.eq L_b lt.eq X \/ H_c^3) E \( cal(H) \, L_b \) . $

It therefore remains to prove $E \( cal(H) \, L_b \) prec.curly.eq X$ for $1 < L_b lt.eq X \/ H_c^3$.
  Here the row range $cal(H)$ stays fixed, and the required bound is still of size $X$ even though the column
  scale has decreased to $L_b$.

We now expand the square and apply Poisson summation in $h$ as before;
  we now record the proof in terms of $E \( cal(H) \, L_b \)$.
  The Gauss-sum coefficients become Möbius coefficients, and the new row variable $y$ has norm at most about
  $L_b^2 \/ cal(H)$. After separating the weights, this gives schematically

$ E \( cal(H) \, L_b \) & prec.curly.eq X + cal(H) / L_b^2
  sum_(0 < upright(N)_(K \/ bb(Q)) \( y \) lt.double L_b^2 \/ cal(H)) \| M \( y \) \|^2 \,\
M \( y \) & = sum_(upright(N)_(K \/ bb(Q)) \( n \) asymp L_b)^(*) mu \( n \) xi_1 \( n \) overline(chi_n \( y \))
  U_1 \( upright(N)_(K \/ bb(Q)) \( n \) \/ L_b \) . $

Here $xi_1$ is another fixed ray class character and $U_1$ is a smooth compactly supported weight produced by
  separating the variables. The term $X$ includes the diagonal and zero-frequency contributions, using $cal(H) lt.eq X$.

Since $L_b = X \/ upright(N)_(K \/ bb(Q)) \( b \)^3 lt.eq X$, we may enlarge the nonnegative sum over $y$ to

$ upright(N)_(K \/ bb(Q)) \( y \) lt.double Y \, wide Y = frac(X L_b, cal(H)) gt.eq L_b^2 / cal(H) . $

The purpose of this enlargement is that a second application of Poisson summation gives a shorter row range:

$ cal(H)' = L_b^2 / Y = frac(cal(H) L_b, X) . $

The coefficients return to cubic Gauss-sum coefficients, and

$ sum_(0 < upright(N)_(K \/ bb(Q)) \( y \) lt.double Y) \| M \( y \) \|^2 prec.curly.eq Y L_b +
  Y E' \( cal(H)' \, L_b \) . $

Here $E'$ has the same form as $E$, with possibly different smooth weights and fixed characters;
  $Y L_b$ accounts for the zero-frequency contribution. Consequently,

$ E \( cal(H) \, L_b \) prec.curly.eq X + X / L_b E' #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
  frac(cal(H) L_b, X) \, L_b #scale(x: 180%, y: 180%)[\)] \, wide frac(E \( cal(H) \, L_b \), X) prec.curly.eq 1 +
  frac(E' \( cal(H) L_b \/ X \, L_b \), L_b) . $

Thus it suffices to prove

$ E' #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(cal(H) L_b, X) \,
  L_b #scale(x: 180%, y: 180%)[\)] prec.curly.eq L_b . $

This is the original type of estimate at smaller parameters:

$ \( cal(H)' \, X' \) = #scale(x: 180%, y: 180%)[\(] frac(cal(H), upright(N)_(K \/ bb(Q)) \( b \)^3) \,
  frac(X, upright(N)_(K \/ bb(Q)) \( b \)^3) #scale(x: 180%, y: 180%)[\)] \, wide cal(H)' / X' = cal(H) / X . $

Both scales decrease while their ratio stays fixed. The factor $X \/
  L_b$ in the preceding inequality is exactly what converts the new target bound $L_b$ into the required bound
  $X$. These two Poisson summations give the #emph[transfer estimate]:
  a bound for the remaining mean square in terms of new mean squares of the same type.
  For related uses of an enlarged summation range, see Goldmakher–Louvel [13] Lemma 4.4 and the proof of
  Theorem 4.1, following Heath-Brown [18] Lemma 9.

Combining the bounds (2.20) and (2.22) from the first part of Step 5 with the transfer estimate above gives the
  recursive bound

$ frac(E \( cal(H) \, X \), X) prec.curly.eq 1 + sup_(upright(N)_(K \/ bb(Q)) \( b \) > H_c\
L_b > 1) frac(E' \( cal(H)' \, X' \), X') \, wide X' = L_b \, quad cal(H)' = frac(cal(H) L_b, X) . $

For each $b$ in this supremum, the cutoff (2.21) gives $cal(H)' < cal(H) \( cal(H) \/ X \)^2 lt.double
  D^(- 2 theta.alt) cal(H)$. Since $cal(H)' \/ X' = cal(H) \/ X$, the same contraction applies at every step.
  After $O_theta.alt \( 1 \)$ steps, every resulting mean square either has an empty remainder or has row
  parameter at most $1$, where counting gives the desired bound at its reduced scales.
  Applying the recursive inequality back through these steps proves (2.23) for the original $E \( cal(H) \, X \)$,
  completing the sketch of the proof.

The preceding sketch suppresses auxiliary twists and common factors for the purpose of illustration.
  To carry out this argument with the auxiliary twists included, we use the family

$ cal(E) \( cal(H) \, X \, F \) = frac(1, X F) sum_(upright(N)_(K \/ bb(Q)) \( f \) asymp F)^(*)
  sum_(0 < upright(N)_(K \/ bb(Q)) \( k \) lt.double cal(H)) \| sum_n^(*) a_xi \( n \) chi_n \( k \)
  chi_n \( f \)^4 U \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \) #scale(x: 180%, y: 180%)[\|]^2 $

and prove $cal(E) \( cal(H) \, X \, F \) prec.curly.eq X F$ in the parameter ranges of Proposition 9.
  Unlike the sketch above, the full argument must also handle the common factors and the resulting dyadic ranges.
  The precise family is defined in (4.4), and Proposition 12 states the transfer estimate.
  Combining it with the bounds for the two parts of the inverse sum in Step 5 reduces the row range at each step.
  Section 5 proves the desired bound by a finite iteration,
  following the admissible-exponent method of Heath-Brown [18] Lemma 8 and §8, [19] Lemma 9;
  see also [13] Theorem 4.1 and [5] §3.2.

== 3 From the mean-square estimate to the zero-free region <sec:reduction>

We first carry out Steps 1 and 2 of the outline: extract cancellation in $A_1 \( D \)$ from a mean-square estimate
  for the family, then use a Mellin transform to deduce nonvanishing.
  Fix a finite-order Hecke character $nu$ of $K$ and a finite set $S$ of prime ideals that contains all prime
  ideals above $2$ or $3$, as well as all prime ideals dividing the conductor of $nu$.
  For an ideal or element $a$, write $\( a \, S \) = 1$ if no prime ideal in $S$ divides $a$.
  An ideal is supported on $S$ if all its prime factors belong to $S$.
  For $W in C_c^oo \( \( 0 \, oo \) \; bb(C) \)$, recall the family

$ A_u \( D \) := sum_(\( n \, S \) = 1) mu \( n \) nu \( n \) chi_n \( u \)
  W \( upright(N)_(K \/ bb(Q)) \( n \) \/ D \) \, $

introduced in (2.2). Here and throughout the original family, $n$ runs over ideals prime to $S$,
  represented by their primary generators. The key estimate is the following.

#thm([Proposition 3.1.])[
  #emph[For every fixed $0 < theta.alt lt.eq 1 \/ 10$ and $epsilon > 0$, there exists an integer $k =
    k \( theta.alt \, epsilon \) gt.eq 1$ such that, for every compact interval $I subset \( 0 \, oo \)$,
    all smooth $W$ supported in $I$, and $D gt.eq 2$,
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( u \) lt.eq D^(1 + theta.alt)) \| A_u \( D \) \|^2
   lt.double_(nu \, S \, I \, theta.alt \, epsilon) #scale(x: 180%, y: 180%)[\(] max_(0 lt.eq j lt.eq k) parallel
   W^(\( j \)) parallel_oo #scale(x: 180%, y: 180%)[\)]^2 D^(2 + theta.alt + epsilon) . $ <eq:ms>]

]
] <thm:ms>

We first deduce Theorem 1 assuming Proposition 3. The proof of the proposition is completed in Section 5.6.

#proof[
  Fix $0 < theta.alt lt.eq 1 \/ 10$, and put $H = D^(1 + theta.alt)$ and $Y = H^(1 \/ 6) =
    D^(\( 1 + theta.alt \) \/ 6)$. For prime ideals $Y \/ 2 < upright(N)_(K \/ bb(Q)) \( frak(p) \) lt.eq Y$,
    $frak(p) in.not S$, let $p$ be their primary generators, chosen with $p equiv 1 med \( mod med 3 \)$.
    Then $chi_n \( p^6 \) = upright(bold(1))_(frak(p) divides.not n)$ and therefore
  $ \| A_1 \( D \) - A_(p^6) \( D \) \| lt.eq parallel W parallel_oo \# { n : \( n \, S \) = 1 \, med
    frak(p) divides n \, med upright(N)_(K \/ bb(Q)) \( n \) asymp D } lt.double_W D \/ Y . $
  For this fixed field, Landau’s prime ideal theorem [27] (see [22] Theorem 5.33) gives $J asymp Y \/ log
    Y$ such primes. Their sixth powers are distinct rows of norm at most $H$.
    Apply (3.1) with loss $epsilon \/ 2$ and use $log Y lt.double_epsilon D^(epsilon \/ 2)$ to obtain
  #[#set math.equation(numbering: n => "(3.2)")
   $ \| A_1 \( D \) \|^2 & lt.eq 2 / J sum_(Y \/ 2 < upright(N)_(K \/ bb(Q)) \( p \) lt.eq Y\
\( p \, S \) = 1) \| A_(p^6) \( D \) \|^2 + O_W \( D^2 \/ Y^2 \)\
 & lt.double_(nu \, S \, W \, theta.alt \, epsilon) D^(2 + theta.alt + epsilon) \/ Y + D^2 \/ Y^2 =
   D^(11 \/ 6 + 5 theta.alt \/ 6 + epsilon) + D^(5 \/ 3 - theta.alt \/ 3) . $ <eq:prime-extract>]
  Thus $A_1 \( D \) lt.double_(nu \, S \, W \, theta.alt \, epsilon) D^(11 \/ 12 + 5 theta.alt \/ 12 + epsilon)$.
    Given any requested exponent loss, choose $theta.alt > 0$ and then the loss in Proposition 3 sufficiently
    small. Renaming the resulting loss $epsilon$, we obtain
  #[#set math.equation(numbering: n => "(3.3)")
   $ A_1 \( D \) lt.double_(nu \, S \, W \, epsilon) D^(11 \/ 12 + epsilon) . $ <eq:mobius-saving>]
  We now use (3.3) to rule out a zero of $L_K \( s \, nu \)$ in $"Re" s > 11 \/ 12$.
    Suppose such a zero $𝜚$ exists. Choose $0 eq.not phi.alt in C_c^oo \( \( 1 \, 2 \) \)$, $phi.alt gt.eq 0$,
    and $W \( y \) = y^(- 𝜚) phi.alt \( y \)$. With the Mellin convention $hat(W) \( s \) =
    integral_0^oo W \( y \) y^s thin d y \/ y$, we have $hat(W) \( 𝜚 \) =
    integral phi.alt \( y \) thin d y \/ y > 0$. The function
  $ cal(M)_W \( s \) = integral_0^oo A_1 \( D \) D^(- s) frac(thin d D, D) $
  is holomorphic on $"Re" s > 11 \/ 12$: the estimate (3.3) controls the integral at infinity,
    and the compact support of $W$ makes $A_1 \( D \)$ vanish for sufficiently small $D$.
    Termwise integration for $"Re" s > 1$ gives
  $ cal(M)_W \( s \) = hat(W) \( s \) sum_(\( n \, S \) = 1)
    frac(mu \( n \) nu \( n \), upright(N)_(K \/ bb(Q)) \( n \)^s) = frac(hat(W) \( s \), L_K^S \( s \, nu \)) \, $
  where $L_K^S$ is the Euler product outside $S$:
  $ L_K^S \( s \, nu \) :=
    L_K \( s \, nu \) product_(frak(p) in S) \( 1 - nu \( frak(p) \) upright(N)_(K \/ bb(Q)) \( frak(p) \)^(- s) \) . $
  By Hecke’s meromorphic continuation theorem [21] (see [22] §5.10) and the identity theorem,
    the identity $L_K^S \( s \, nu \) cal(M)_W \( s \) = hat(W) \( s \)$ holds on $"Re" s > 11 \/ 12$.
    The omitted Euler factors are nonzero here, so evaluation at $s = 𝜚$ gives $0 = hat(W) \( 𝜚 \) > 0$,
    a contradiction.
  To deduce the assertion for Dirichlet $L$-functions in Theorem 1,
    let $chi_(- 3)$ be the nontrivial character modulo $3$. For any Dirichlet character $chi$,
    quadratic base change gives, up to Euler factors nonzero in $"Re" s > 0$,
  $ L_K \( s \, chi compose upright(N)_(K \/ bb(Q)) \) = L \( s \, chi \) L \( s \, chi chi_(- 3) \) . $
  The Hecke conclusion excludes zeros of either factor away from $s = 1$.
    At $s = 1$, the only possible pole–zero cancellation is ruled out by Dirichlet’s nonvanishing theorem,
    which gives $L \( 1 \, chi_(- 3) \) > 0$ (see [6] Chapters 4 and 6). ◻
]

== 4 Poisson summation and the dual mean square <sec:initialization>

We now turn to the mean-square estimate in Proposition 3.
  Following Step 3 of the outline, we expand the square and apply Poisson summation in the row variable $u$.
  The finite Fourier transforms of the characters supply Gauss sums.
  Arithmetic identities then combine these Gauss sums with the original Möbius coefficients to give the normalized
  cubic Gauss-sum coefficients that appear in the theta function.

The column indices produced by expanding the square need not be coprime.
  We first extract their common factor, then use Möbius inversion to separate the remaining coprimality condition.
  These operations introduce an auxiliary twisting index and an exclusion ideal.
  The comparison below removes the exclusion without changing the row range or the product of the column and
  auxiliary scales.

We record the arithmetic and Poisson identities first, then define this family.
  Proposition 8 states the estimate for it that suffices to prove (3.1);
  the rest of the section proves that implication.

=== 4.1 The arithmetic identities <the-arithmetic-identities>

We first record the identities that convert between Möbius coefficients and normalized cubic Gauss sums.
  Recall that, for a squarefree primary element $n$ with $\( n \, S \) = 1$,

$ alpha \( n \) = frac(n, \| n \|) \, wide gamma_j \( n \) = 1 /
  sqrt(upright(N)_(K \/ bb(Q)) \( n \)) sum_(x med mod med n) chi_n \( x \)^j e \( x \/ n \) quad \( j in bb(Z) \) \, $

where $e \( z \) = exp \( 4 pi upright(i) thin "Im" z \/ sqrt(3) \)$, as in (2.6). Put

$ a_xi \( n \) = overline(alpha \( n \)) gamma_2 \( n \) xi \( n \) wide \( n upright(" squarefree") \) \, $

where $xi$ is a fixed ray class character. The character $xi$ accounts for the original twist $nu$ and for the
  residue-class factors in the identities below.

By character orthogonality [22] §3.1, we can absorb functions on a fixed ray class group into a finite sum of
  twists $xi$. Choose a fixed modulus, supported on $S$, divisible by the conductor of $nu$ and sufficiently large
  that all reciprocity factors below depend only on the corresponding ray classes.
  We then expand these factors in characters of this finite group.

The following lemma collects standard consequences of the Gauss–Jacobi identities,
  quadratic Gauss-sum evaluations, and reciprocity.

#thm([Lemma 4.1.])[
  #emph[On a fixed ray class group, there are a function $G$ with values in ${ z in bb(C) : \| z \| =
    1 }$ and a symmetric ${ plus.minus 1 }$-valued bicharacter $cal(R)$.
    This means that $cal(R) \( a \, b \) = cal(R) \( b \, a \)$ and $cal(R)$ is multiplicative in each argument
    separately:
$ cal(R) \( a a' \, b \) & = cal(R) \( a \, b \) cal(R) \( a' \, b \) \,\
cal(R) \( a \, b b' \) & = cal(R) \( a \, b \) cal(R) \( a \, b' \) \, $

 for all classes $a \, a' \, b \, b'$ in the ray class group. These functions have the following properties.
   Let $a \, b \, n$ be primary elements prime to $S$, with $\( a \, b \) = 1$ and $n$ squarefree. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ chi_b \( a \) & = cal(R) \( a \, b \) chi_a \( b \) \, & G \( a b \) & = G \( a \) G \( b \) cal(R) \( a \, b \) \,\
gamma_2 \( n \)^3 & = mu \( n \) alpha \( n \) \, & gamma_1 \( n \) gamma_2 \( n \) & =
  mu \( n \) alpha \( n \) G \( n \) \,\
G \( n \) & = overline(chi_n \( 4 \)) gamma_3 \( n \) \, & gamma_1 \( n \) gamma_(- 1) \( n \) & =
  chi_n \( - 1 \) . $ <eq:recip>]

 Consequently
#[#set math.equation(numbering: n => "(4.2)")
 $ overline(alpha \( n \)) gamma_2 \( n \) gamma_1 \( n \) & = mu \( n \) G \( n \) \,\
mu \( n \) gamma_(- 1) \( n \) & = chi_n \( - 1 \) G \( n \)^(- 1) overline(alpha \( n \)) gamma_2 \( n \) \,\
a_xi \( a b \) & = a_xi \( a \) a_xi \( b \) chi_b \( a \)^4 \,\
chi_a \( - 1 \) overline(G \( a \)) G \( b \) cal(R) \( a \, b \) & = G \( b a^(- 1) \) . $ <eq:convert1>]

 In (4.2), $a \, b$ are also squarefree. The identity for $G \( a b \)$ in (4.1) extends to all classes of the
   fixed ray class group; the quotient in (4.2) is taken in that group.]
] <lem:arithmetic>

The proof, including the dependence of $G$ and $cal(R)$ on fixed ray classes, is given in Appendix 8.1.
  Under Poisson summation, (4.2) converts the Möbius coefficients to $a_xi \( n \)$,
  up to fixed ray class factors, while (4.2) converts them back.

=== 4.2 Poisson summation with excluded primes <poisson-summation-with-excluded-primes>

The row sum to which we apply Poisson summation will have an additional coprimality restriction.
  We record the formula with that restriction included, so that its effect on the Fourier frequencies and the
  normalization is explicit.

For a nonzero ideal $frak(r)$, write $"rad" frak(r)$ for the product of its distinct prime divisors.
  We use the additive character $e$ introduced in Step 3. In quotients and Gauss sums,
  use a fixed generator for each ideal, chosen primary when the ideal is prime to $3$.

#thm([Lemma 4.2.])[
  #emph[Let $cal(H) > 0$, let $frak(r)$ be a nonzero ideal,
    and let $Phi \( upright(N)_(K \/ bb(Q)) \( k \) \/ cal(H) \)$ be a smooth radial Schwartz weight on the row
    lattice. Let $chi$ be a primitive multiplicative character of $\( cal(O) \/ frak(m) \)^times$,
    viewed as a function on $cal(O)$ by reduction modulo $frak(m)$ and extension by zero on nonunits. Write
$ gamma \( chi \) = upright(N)_(K \/ bb(Q)) \( frak(m) \)^(- 1 \/ 2) sum_(x med mod med frak(m)) chi \( x \)
  e \( x \/ frak(m) \) $

 for its normalized Gauss sum. Since $chi$ is primitive, its modulus $frak(m)$ is determined by $chi$ and is
   suppressed in the notation. Then
#[#set math.equation(numbering: n => "(4.3)")
 $ & sum_k chi \( k \) upright(bold(1))_(\( k \, frak(r) \) = 1) Phi \( upright(N)_(K \/ bb(Q)) \( k \) \/ cal(H) \)\
 & quad = frac(cal(H) gamma \( chi \), sqrt(upright(N)_(K \/ bb(Q)) \( frak(m) \))) sum_(d divides "rad" frak(r))
   frac(mu \( d \) chi \( d \), upright(N)_(K \/ bb(Q)) \( d \)) sum_h overline(chi \( h \)) hat(Phi)
   #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(cal(H) upright(N)_(K \/ bb(Q)) \( h \), upright(N)_(K \/ bb(Q)) \( d \) upright(N)_(K \/ bb(Q)) \(
   frak(m) \)) #scale(x: 180%, y: 180%)[\)] . $ <eq:poisson>]

 Here $hat(Phi)$ is defined by
$ hat(Phi) \( \| w \|^2 \) = 2 / sqrt(3) integral_(bb(C)) Phi \( \| z \|^2 \) e \( - z w \) thin d x thin d y \,
  wide z = x + upright(i) y . $

 The measure is normalized so that $cal(O)$ has covolume one.
   Here $k \, h in cal(O)$, and $h$ is the Fourier frequency. We have
$ chi upright(" nonprincipal") quad arrow.r.double quad overline(chi \( 0 \)) = 0 . $

 For the principal primitive character ($chi = upright(bold(1))$, $frak(m) = 1$), the zero-frequency contribution is
$ cal(H) hat(Phi) \( 0 \) product_(frak(p) divides frak(r)) #scale(x: 180%, y: 180%)[\(] 1 -
  frac(1, upright(N)_(K \/ bb(Q)) \( frak(p) \)) #scale(x: 180%, y: 180%)[\)] . $

]
] <lem:poisson>

#proof[
  Inclusion–exclusion followed by $k = d ell$ gives
  $ sum_k chi \( k \) upright(bold(1))_(\( k \, frak(r) \) = 1)
    Phi \( upright(N)_(K \/ bb(Q)) \( k \) \/ cal(H) \) = sum_(d divides "rad" frak(r)) mu \( d \) chi \( d \)
    sum_ell chi \( ell \) Phi #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
    frac(upright(N)_(K \/ bb(Q)) \( ell \), cal(H) \/ upright(N)_(K \/ bb(Q)) \( d \)) #scale(x: 180%, y: 180%)[\)] . $
  Apply lattice Poisson summation [22] Theorem 4.5 in $ell$ on residue classes modulo $frak(m)$,
    at scale $cal(H) \/ upright(N)_(K \/ bb(Q)) \( d \)$. The primitive Gauss-sum identity [22] (3.12) evaluates
    the finite Fourier transform as $sqrt(upright(N)_(K \/ bb(Q)) \( frak(m) \)) gamma \( chi \)
    overline(chi \( h \))$ for every $h$, giving (4.3). For a nonprincipal primitive character,
    $overline(chi \( 0 \)) = 0$, so the zero-frequency term vanishes.
    For the principal character, sum $mu \( d \) \/ upright(N)_(K \/ bb(Q)) \( d \)$ over $d divides "rad"
    frak(r)$ to obtain the displayed zero-frequency contribution. ◻
]

=== 4.3 The dual mean squares <the-dual-mean-squares>

We use the following mean square of the column sums with coefficients $a_xi \( n \)$.

#prodef([Definition 4.3.])[
  The parameters $cal(H)$, $X$, and $F$ are the norm scales of $k$, $n$, and $f$, respectively.
    Here $k$ ranges over elements of $cal(O)$, and a star restricts a sum to squarefree ideals prime to $S$,
    represented by their primary generators. For a smooth compactly supported weight $W$ on $\( 0 \, oo \)$,
    define the #emph[dual mean square] by
  #[#set math.equation(numbering: n => "(4.4)")
   $ & cal(E) \( cal(H) \, X \, F \; xi \, W \)\
 & wide = frac(1, X F) sum_(F lt.eq upright(N)_(K \/ bb(Q)) \( f \) < 2 F\
\( f \, S \) = 1)^(*) sum_(0 < upright(N)_(K \/ bb(Q)) \( k \) lt.eq cal(H)) \| sum_(\( n \, S \) = 1)^(*)
  a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 W \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \)
  #scale(x: 180%, y: 180%)[\|]^2 . $ <eq:energy>]
]

Below, $xi$ ranges over all characters of the fixed ray class group chosen above, through which $nu$, $G$,
  and $cal(R)$ factor.

Write $cal(E)_(frak(r))$ for the same expression with the additional restriction $\( n \, frak(r) \) = 1$.
  This notation is only needed in the Poisson reductions; the following comparison returns to $cal(E)$.

#thm([Lemma 4.4.])[
  #emph[Let $r_0$ be the product of the primes dividing $frak(r)$ outside $S$.
    For $cal(H) \, X > 0$, $F gt.eq 1$, and smooth compactly supported $W$,
#[#set math.equation(numbering: n => "(4.5)")
 $ cal(E)_(frak(r)) \( cal(H) \, X \, F \; xi \, W \) lt.eq
   tau_(upright("div")) \( r_0 \) sum_(d divides r_0) cal(E) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] cal(H) \,
   frac(X, upright(N)_(K \/ bb(Q)) \( d \)) \, F upright(N)_(K \/ bb(Q)) \( d \) \; xi \,
   W #scale(x: 180%, y: 180%)[\)] . $ <eq:remove-exclusions>]

]
] <lem:remove-exclusions>

#proof[
  Let $C_(frak(r)) \( X \; k \, f \)$ denote the inner column sum defining $cal(E)_(frak(r))$, with $xi \,
    W$ fixed. Inclusion–exclusion, $n = d m$, and (4.2) give
  $ C_(frak(r)) \( X \; k \, f \) & = sum_(d divides r_0) mu \( d \) sum_(\( n \, S \) = 1\
d divides n)^(*) a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 W \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \)\
 & = sum_(d divides r_0\
\( d \, f \) = 1) mu \( d \) a_xi \( d \) chi_d \( k \) chi_d \( f \)^4
  C_1 \( X \/ upright(N)_(K \/ bb(Q)) \( d \) \; k \, d f \) . $
  Indeed, $chi_m \( d \)^4$ enforces $\( m \, d \) = 1$ and combines with $chi_m \( f \)^4$;
    terms with $\( d \, f \) eq.not 1$ vanish. Each exterior coefficient has modulus at most one.
    Apply Cauchy–Schwarz in $d$, then enlarge the injective image $f mapsto d f$ to the squarefree range $F
    upright(N)_(K \/ bb(Q)) \( d \) lt.eq upright(N)_(K \/ bb(Q)) \( d f \) < 2 F
    upright(N)_(K \/ bb(Q)) \( d \)$. The normalizing product is unchanged:
    $\( X \/ upright(N)_(K \/ bb(Q)) \( d \) \) \( F upright(N)_(K \/ bb(Q)) \( d \) \) = X F$. ◻
]

=== 4.4 Reduction to the dual mean square <reduction-to-the-dual-mean-square>

The following proposition gives the dual estimate sufficient for (3.1).
  Its proof applies Poisson summation directly to the original Möbius sums.

#thm([Proposition 4.5.])[
  #emph[Fix $0 < theta.alt lt.eq 1 \/ 10$ and put $H = D^(1 + theta.alt)$.
    For each fixed $C gt.eq 1$ and all real $B \, F gt.eq 1$, consider the ranges
#[#set math.equation(numbering: n => "(4.6)")
 $ X = frac(D, B F) \, wide 0 < cal(H) lt.eq frac(C D^2, H B^2) \, wide X F = D / B . $ <eq:initial-scales>]

 Suppose that for every $epsilon > 0$ there exists an integer $J = J \( theta.alt \, epsilon \) gt.eq
   1$ such that, for every compact interval $I subset \( 0 \, oo \)$ and every smooth $W$ supported in $I$,
#[#set math.equation(numbering: n => "(4.7)")
 $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_(nu \, S \, I \, C \, theta.alt \, epsilon) parallel W
   parallel_(C^J \( I \))^2 D^epsilon X F \, $ <eq:auxiliary-target>]

 where
$ parallel W parallel_(C^J \( I \)) = max_(0 lt.eq j lt.eq J) sup_(x in I) \| W^(\( j \)) \( x \) \| . $

 For functions of several variables, the norm uses all partial derivatives of total order at most $J$.
   Then the original mean-square estimate in Proposition 3 holds.]
] <prop:poisson-reduction>

#proof[
  Write $I = \[ a_0 \, b_0 \]$. Choose a nonnegative radial Schwartz weight $Phi$ such that $Phi \( x \) gt.eq
    1$ on $\[ 0 \, 1 \]$ and $"supp" hat(Phi) subset \[ 0 \, C_Phi \]$ for some fixed $C_Phi > 0$.
    It suffices to prove $cal(M)_D lt.double_(nu \, S \, I \, theta.alt \, epsilon) parallel W
    parallel_(C^(J') \( I \))^2 H D^epsilon$ for some $J' = J' \( theta.alt \, epsilon \)$, where
  #[#set math.equation(numbering: n => "(4.8)")
   $ cal(M)_D := 1 / D sum_(u in cal(O)) Phi \( upright(N)_(K \/ bb(Q)) \( u \) \/ H \) \| sum_(\( n \, S \) = 1)
     mu \( n \) nu \( n \) chi_n \( u \) W \( upright(N)_(K \/ bb(Q)) \( n \) \/ D \)
     #scale(x: 180%, y: 180%)[\|]^2 . $ <eq:expanded-ms>]
  Conjugate the inner sum, expand the square, and put $g = \( n_1 \, n_2 \)$ and $n_j = g z_j$.
    The squarefree indices satisfy $\( z_1 \, z_2 \) = \( z_1 z_2 \, g \) = 1$, and
  $ overline(chi_(n_1) \( u \)) chi_(n_2) \( u \) = upright(bold(1))_(\( u \, g \) = 1)
    overline(chi_(z_1) \( u \)) chi_(z_2) \( u \) . $
  Apply Lemma 5 with $chi = overline(chi_(z_1)) chi_(z_2)$ and exclusion $g$:
  #[#set math.equation(numbering: n => "(4.9)")
   $ & sum_u Phi \( upright(N)_(K \/ bb(Q)) \( u \) \/ H \) upright(bold(1))_(\( u \, g \) = 1) chi \( u \)\
 & quad =
   sum_(e divides g)
   frac(H mu \( e \) chi \( e \) gamma \( chi \), upright(N)_(K \/ bb(Q)) \( e \) sqrt(upright(N)_(K \/ bb(Q)) \(
   z_1 \) upright(N)_(K \/ bb(Q)) \( z_2 \))) sum_h overline(chi \( h \)) hat(Phi) #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(]
   frac(H upright(N)_(K \/ bb(Q)) \( h \), upright(N)_(K \/ bb(Q)) \( e \) upright(N)_(K \/ bb(Q)) \( z_1 \)
   upright(N)_(K \/ bb(Q)) \( z_2 \)) #scale(x: 180%, y: 180%)[\)] . $ <eq:initial-poisson-rows>]
  The zero frequency occurs only when $z_1 = z_2 = 1$ and contributes
  $ Z = H / D hat(Phi) \( 0 \) sum_(\( g \, S \) = 1)^(*) \| W \( upright(N)_(K \/ bb(Q)) \( g \) \/ D \) \|^2
    product_(p divides g) #scale(x: 180%, y: 180%)[\(] 1 - frac(1, upright(N)_(K \/ bb(Q)) \( p \))
    #scale(x: 180%, y: 180%)[\)] lt.double_(Phi \, I) H parallel W parallel_oo^2 . $
  Retain all $h eq.not 0$, including those with $z_1 = z_2 = 1$.
  Expand the fixed ray class function $overline(nu \( t \)) G \( t^(- 1) \) = sum_xi c_xi xi \( t \)$.
    The Chinese remainder theorem and (4.2)–(4.2) give
  #[#set math.equation(numbering: n => "(4.10)")
   $ mu \( z_1 \) mu \( z_2 \) overline(nu \( z_1 \)) nu \( z_2 \) gamma \( overline(chi_(z_1)) chi_(z_2) \) =
     sum_xi c_xi a_xi \( z_1 \) overline(a_xi \( z_2 \)) . $ <eq:initial-paired-gauss>]
  Write $N = upright(N)_(K \/ bb(Q))$ for the remainder of this proof, and put $W_0 \( x \) =
    x^(- 1 \/ 2) overline(W \( x \))$. Substituting (4.10) into (4.9),
    including the normalization $1 \/ D$ in (4.8), gives
  $ cal(M)_D - Z = sum_xi c_xi cal(S)_xi \, wide \| cal(M)_D - Z \| lt.double max_xi \| cal(S)_xi \| \, $
  since the character sum is fixed and finite. Fix $xi$. Using $overline(chi_z \( e \)) = chi_z \( e^5 \)$,
    its contribution is
  $ cal(S)_xi =  & H / D^2 sum_g^(*) sum_(e divides g) frac(mu \( e \) N \( g \), N \( e \)) sum_(h eq.not 0)
    sum_(z_1 \, z_2\
\( z_1 \, z_2 \) = 1\
\( z_1 z_2 \, g \) = 1)^(*) a_xi \( z_1 \) overline(a_xi \( z_2 \)) chi_(z_1) \( h e^5 \)
  overline(chi_(z_2) \( h e^5 \))\
 & quad  times W_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( g z_1 \), D) #scale(x: 180%, y: 180%)[\)]
   overline(W_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( g z_2 \), D) #scale(x: 180%, y: 180%)[\)])
   hat(Phi) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(H N \( h \), N \( e \) N \( z_1 \) N \( z_2 \))
   #scale(x: 180%, y: 180%)[\)] . $
  Here and below every starred variable is squarefree, primary, and prime to $S$, while $h \,
    k$ range over nonzero elements of $cal(O)$. We must show $\| cal(S)_xi \|
    lt.double_(nu \, S \, I \, theta.alt \, epsilon) parallel W parallel_(C^(J') \( I \))^2 H D^epsilon$.
  Insert the coprimality identity and change variables:
  $ upright(bold(1))_(\( z_1 \, z_2 \) = 1) = sum_(v divides z_1 \, med v divides z_2) mu \( v \) \, wide z_j =
    v m_j . $
  By (4.2), the common factor from the two columns satisfies
  $ a_xi \( v m \) = a_xi \( v \) a_xi \( m \) chi_m \( v \)^4 \, wide \| a_xi \( v \) chi_v \( h e^5 \) \|^2 =
    upright(bold(1))_(\( v \, h \) = 1) \, $
  where $\( v \, e \) = 1$. Thus the same sum becomes
  $ cal(S)_xi =  & H / D^2 sum_(g \, v\
\( g \, v \) = 1)^(*) sum_(e divides g) frac(mu \( e \) mu \( v \) N \( g \), N \( e \)) sum_(h eq.not 0\
\( h \, v \) = 1) sum_(m_1 \, m_2\
\( m_1 m_2 \, g v \) = 1)^(*) a_xi \( m_1 \) overline(a_xi \( m_2 \))\
 & quad  times chi_(m_1) \( h e^5 v^4 \) overline(chi_(m_2) \( h e^5 v^4 \)) W_0 #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(] frac(N \( g v m_1 \), D) #scale(x: 180%, y: 180%)[\)] overline(W_0 #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(] frac(N \( g v m_2 \), D) #scale(x: 180%, y: 180%)[\)])\
 & quad  times hat(Phi) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(H N \( h \), N \( e \) N \( v \)^2 N \( m_1 \) N \( m_2 \)) #scale(x: 180%, y: 180%)[\)] . $
  There is now no restriction $\( m_1 \, m_2 \) = 1$. Make the bijective change of variables
  $ b = g \/ e \, wide f = e v \, wide k = e h \,\
e = \( f \, k \) \, wide v = f \/ e \, wide g = b e \, wide h = k \/ e . $
  The resulting $b \, f$ are coprime and squarefree, $k eq.not 0$ is arbitrary, and
  $ g v = b f \, wide h e^5 v^4 = k f^4 \, wide mu \( e \) mu \( v \) = mu \( f \) \, wide
    frac(N \( g \), N \( e \)) = N \( b \) . $
  Consequently,
  #[#set math.equation(numbering: n => "(4.11)")
   $ cal(S)_xi =  & H / D^2 sum_(b \, f\
\( b \, f \) = 1)^(*) mu \( f \) N \( b \) sum_(k eq.not 0) sum_(m_1 \, m_2\
\( m_1 m_2 \, b \) = 1)^(*) a_xi \( m_1 \) overline(a_xi \( m_2 \)) chi_(m_1) \( k f^4 \)
  overline(chi_(m_2) \( k f^4 \))\
 & quad  times W_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( b f m_1 \), D)
   #scale(x: 180%, y: 180%)[\)] overline(W_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( b f m_2 \), D)
   #scale(x: 180%, y: 180%)[\)]) hat(Phi) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(H N \( k \), N \( f \)^2 N \( m_1 \) N \( m_2 \)) #scale(x: 180%, y: 180%)[\)] . $ <eq:initial-column-output>]
  The characters enforce $\( m_j \, f \) = 1$, leaving only the displayed exclusion $\( m_j \, b \) = 1$.
    The supports of $W_0$ and $hat(Phi)$ give
  $ N \( b \) N \( f \) lt.eq b_0 D \, wide 0 < N \( k \) lt.eq frac(C_Phi b_0^2 D^2, H N \( b \)^2) . $
  Partition $B lt.eq N \( b \) < 2 B$ and $F lt.eq N \( f \) < 2 F$ into dyadic ranges.
    Denote the corresponding contribution to (4.11) by $cal(S)_(xi \; B \, F)$, and put
  $ X = frac(D, B F) \, wide cal(H) = frac(C_(I \, Phi) D^2, H B^2) \, wide C_(I \, Phi) =
    max \( 2 \, C_Phi b_0^2 \) . $
  These satisfy (4.6). In the variables $x_j = N \( m_j \) \/ X$, the coupled smooth weight is
  $ cal(K)_(b \, f \, k) \( x_1 \, x_2 \) = W_0 \( r x_1 \) overline(W_0 \( r x_2 \)) hat(Phi) #h(-0.16667em)
    #scale(x: 180%, y: 180%)[\(] frac(a, x_1 x_2) #scale(x: 180%, y: 180%)[\)] \,\
r = frac(N \( b \) N \( f \), B F) in \[ 1 \, 4 \) \, wide a = frac(H N \( k \), N \( f \)^2 X^2) lt.eq C_(I \, Phi) . $
  For every integer $q gt.eq 0$, these kernels satisfy
  $ sup_(b \, f \, k) parallel cal(K)_(b \, f \, k) parallel_(C^q \( \[ a_0 \/ 4 \, b_0 \]^2 \))
    lt.double_(I \, Phi \, q) parallel W parallel_(C^q \( I \))^2 . $
  For $U in C_c^oo \( I_(*) \)$, where $I_(*) = \[ a_0 \/ 8 \, 2 b_0 \]$, put
  $ S_U \( b \, f \, k \) = sum_(\( n \, S \) = 1\
\( n \, b \) = 1)^(*) a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 U \( N \( n \) \/ X \) . $
  The shifts $\( X \, F \) mapsto \( X \/ N \( d \) \, F N \( d \) \)$ preserve (4.6).
    Thus Lemma 7 and (4.7), with $J = J \( theta.alt \, epsilon \/ 4 \)$, give
  $ sum_(f \, k) \| S_U \( b \, f \, k \) \|^2 & = X F thin cal(E)_(\( b \)) \( cal(H) \, X \, F \; xi \, U \)\
 & lt.eq X F thin tau_(upright("div")) \( b \) sum_(d divides b)
   cal(E) \( cal(H) \, X \/ N \( d \) \, F N \( d \) \; xi \, U \)\
 & lt.double_(nu \, S \, I \, theta.alt \, epsilon) D^(epsilon \/ 2) \( X F \)^2 parallel U
   parallel_(C^J \( I_(*) \))^2 . $
  Here $N \( b \) lt.double_I D$, so the divisor factors are absorbed in $D^(epsilon \/ 4)$.
    We use the following smooth-weight principle, stated and proved in Lemma 23:
    a mean-square bound valid for every common test function, with a $C^J$ norm,
    also bounds the corresponding quadratic sum with a kernel depending on the row,
    at a cost given by the kernel’s $C^(2 J + 4)$ norm. For each fixed $b$,
    apply Lemma 23 with row index $\( f \, k \)$, coefficient $mu \( f \) upright(bold(1))_(\( f \, b \) = 1)$,
    and kernel $cal(K)_(b \, f \, k)$. The larger row range $0 < N \( k \) lt.eq
    cal(H)$ adds only terms whose original kernel vanishes. With $q = 2 J + 4$, this gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| cal(S)_(xi \; B \, F) \| & lt.double_(nu \, S \, I \, theta.alt \, epsilon) D^(epsilon \/ 2) parallel W
     parallel_(C^q \( I \))^2 sum_(B lt.eq N \( b \) < 2 B)^(*) frac(H N \( b \), D^2) \( X F \)^2\
 & lt.double D^(epsilon \/ 2) parallel W parallel_(C^q \( I \))^2 frac(H B, D^2) thin B thin \( X F \)^2 =
   D^(epsilon \/ 2) parallel W parallel_(C^q \( I \))^2 H \, $ <eq:weighted>]
  where $X F = D \/ B$ and ideal counting gives $O \( B \)$ choices of $b$.
    Summing the $O \( \( log D \)^2 \)$ nonempty dyadic ranges bounds $cal(S)_xi$ as required.
    Sum over the fixed finite set of $xi$, include $Z$, and restore the factor $D$ to obtain (3.1).
    The required derivative order depends only on $theta.alt \, epsilon$. ◻
]

== 5 Iteration of the dual mean-square estimate <sec:descent>

Put $Sigma = X F$. We prove the following estimate for the family (4.4), with exclusions removed by Lemma 7.
  The two inputs are proved in Sections 6 and 7.

#thm([Proposition 5.1.])[
  #emph[Fix $kappa > 0$ and $C_0 gt.eq 1$. Suppose that
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(H) \, X \, F gt.eq 1 \, wide Sigma = X F lt.eq D^(C_0) \, wide cal(H) lt.eq
   Sigma D^(- kappa) . $ <eq:positive-gap>]

 For every $epsilon > 0$ there is an integer $J = J \( kappa \, C_0 \, epsilon \) gt.eq 1$ such that
#[#set math.equation(numbering: n => "(5.2)")
 $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_(I \, nu \, S \, kappa \, C_0 \, epsilon) parallel W
   parallel_(C^J \( I \))^2 D^epsilon Sigma $ <eq:canonical-bound>]

 for every compact interval $I subset \( 0 \, oo \)$ and smooth $W$ supported in $I$.]
] <prop:canonical>

The proof is given in Section 5.5, using Lemma 11 and Proposition 12.

=== 5.1 The completed sums <the-completed-sums>

Let $Psi$ be a completely multiplicative $bb(C)$-valued function on the nonzero integral ideals of $cal(O)_K =
  bb(Z) \[ omega \]$ coprime to $3$, vanishing on ideals divisible by a prime in $S$.
  For a primary element $n$, write $Psi \( n \) = Psi \( \( n \) \)$. Define

#[#set math.equation(numbering: n => "(5.3)")
 $ T \( X \; Psi \) = sum_(\( n \, S \) = 1)^(*) sum_(b in cal(O)\
b equiv 1 med \( 3 \)\
\( b \, S \) =
  1)
  frac(overline(alpha \( n \)) gamma_2 \( n \) Psi \( n \) overline(alpha \( b \))^(thin 3) Psi \( b \)^3,
  sqrt(upright(N)_(K \/ bb(Q)) \( n \)) thin upright(N)_(K \/ bb(Q)) \( b \)) thin
  V_(*) \( upright(N)_(K \/ bb(Q)) \( n \) upright(N)_(K \/ bb(Q)) \( b \)^3 \/ X \) \, $ <eq:T>]

where $V_(*) \( y \) = sqrt(y) thin W \( y \)$. The extra index $b$ supplies the cubes in the Fourier expansion of
  the Kubota theta function. Here $n \, b$ are primary elements of $cal(O)$; only $n$ is required to be squarefree.

The $b = 1$ part is exactly $X^(- 1 \/ 2) sum_(\( n \, S \) = 1)^(*) overline(alpha \( n \)) gamma_2 \( n \)
  Psi \( n \) W \( upright(N)_(K \/ bb(Q)) \( n \) \/ X \)$.
  To identify this with the normalized column sum in (4.4), fix a ray class character $xi$.
  For a nonzero row $k in cal(O)$ and a squarefree primary $f$ prime to $S$, set

#[#set math.equation(numbering: n => "(5.4)")
 $ Psi_k \( n \) := xi \( n \) chi_n \( k \) chi_n \( f \)^4 \, wide T \( X \; k \, f \) :=
   T \( X \; Psi_k \) . $ <eq:completed-twist>]

The displayed product defines $Psi_k \( n \)$ for $\( n \, S \) = 1$; set $Psi_k \( n \) = 0$ otherwise.
  Thus the zero extension required in (5.3) is part of this definition.

=== 5.2 The completed mean-square estimate <the-completed-mean-square-estimate>

For the twist (5.4), the theta transformation converts the relevant sextic twists into quadratic characters.
  Combining it with the quadratic large sieve gives the following estimate, proved in Section 6.

#thm([Proposition 5.2.])[
  #emph[Fix $epsilon > 0$, $C_0 gt.eq 1$, and a character $xi$ of the fixed ray class group.
    There is $J = J \( epsilon \, C_0 \) gt.eq 1$ such that
#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(0 < upright(N)_(K \/ bb(Q)) \( k \) lt.double cal(H)) \| T \( X \; k \, f \) \|^2
   lt.double_(I \, xi \, S \, epsilon \, C_0) D^epsilon parallel W parallel_(C^J \( I \))^2
   #scale(x: 180%, y: 180%)[\(] cal(H) + frac(cal(H)^2 upright(N)_(K \/ bb(Q)) \( f \), X)
   #scale(x: 180%, y: 180%)[\)] $ <eq:R>]

 whenever
$ 1 lt.eq cal(H) \, X \, upright(N)_(K \/ bb(Q)) \( f \) lt.eq D^(C_0) . $

 Here $f$ is squarefree and primary with $\( f \, S \) = 1$,
   $W$ is smooth and supported in a compact interval $I subset \( 0 \, oo \)$, and $T$ is defined by (5.4).]
] <prop:R>

=== 5.3 Cube inversion and the remaining sums <cube-inversion-and-the-remaining-sums>

Set

#[#set math.equation(numbering: n => "(5.6)")
 $ H_c^3 = min #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] X \, X^2 / cal(H)^2 #scale(x: 180%, y: 180%)[\)] \,
   wide L_b = frac(X, upright(N)_(K \/ bb(Q)) \( b \)^3) . $ <eq:cube-cutoff>]

#thm([Lemma 5.3.])[
  #emph[Fix $C_0 gt.eq 1$ and $epsilon > 0$. Suppose $1 lt.eq cal(H) \, X \, F lt.eq D^(C_0)$ and $cal(H) lt.eq
    Sigma = X F$. There is an integer $J = J \( epsilon \, C_0 \) gt.eq 1$ such that
#[#set math.equation(numbering: n => "(5.7)")
 $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_(I \, nu \, S \, C_0 \, epsilon) D^epsilon
   #scale(x: 240%, y: 240%)[\(] Sigma parallel W parallel_(C^J \( I \))^2 +
   sup_(b equiv 1 med \( 3 \) \, med \( b \, S \) = 1\
upright(N)_(K \/ bb(Q)) \( b \) > H_c \, med L_b > 1) cal(E) \( cal(H) \, L_b \, F \; xi \, W \)
  #scale(x: 240%, y: 240%)[\)] $ <eq:cube-reduction>]

 for every compact interval $I subset \( 0 \, oo \)$ and $W in C_c^oo \( I \)$.
   An empty supremum is zero; in particular it is empty when $cal(H)^2 lt.eq X$.]
] <lem:cube-reduction>

#proof[
  Write $N = upright(N)_(K \/ bb(Q))$ and $I = \[ u \, v \]$.
    Complete multiplicativity in (5.3), including at the zeros of $Psi_k$, gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ & X^(- 1 \/ 2) sum_(\( n \, S \) = 1)^(*) a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 W \( N \( n \) \/ X \)\
 & wide = sum_(\( h \, S \) = 1) frac(mu \( h \) overline(alpha \( h \))^(thin 3) Psi_k \( h \)^3, N \( h \))
   T \( X \/ N \( h \)^3 \; k \, f \) . $ <eq:cube-inverse>]
  Indeed, after substitution of (5.3), the coefficient of the total cube index $b$ contains $sum_(h divides b)
    mu \( h \) = upright(bold(1))_(b = 1)$. This is Möbius inversion; compare [22] (1.18) and [7] (8.2).
  Split the right-hand side of (5.8) into $P_(upright("short")) \( k \, f \) + P_(upright("long")) \( k \, f \)$, where
  $ P_(upright("short")) \( k \, f \) & = sum_(\( h \, S \) = 1\
N \( h \) lt.eq H_c) frac(mu \( h \) overline(alpha \( h \))^(thin 3) Psi_k \( h \)^3, N \( h \))
  T \( X \/ N \( h \)^3 \; k \, f \) \,\
cal(E)_(upright("short")) & = 1 / F sum_(F lt.eq N \( f \) < 2 F\
\( f \, S \) = 1)^(*) sum_(0 < N \( k \) lt.eq cal(H)) \| P_(upright("short")) \( k \, f \) \|^2 . $
  Define $cal(E)_(upright("long"))$ in the same way using $P_(upright("long"))$.
    Weighted Cauchy–Schwarz for each $k \, f$, followed by Proposition 10, gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ cal(E)_(upright("short")) & lt.eq #scale(x: 180%, y: 180%)[\(] sum_(N \( h \) lt.eq H_c) frac(1, N \( h \))
     #scale(x: 180%, y: 180%)[\)] sum_(N \( h \) lt.eq H_c) frac(1, N \( h \)) 1 / F sum_(F lt.eq N \( f \) < 2 F\
\( f \, S \) = 1)^(*) sum_(0 < N \( k \) lt.eq cal(H)) \| T \( X \/ N \( h \)^3 \; k \, f \) \|^2\
 & lt.double_(I \, nu \, S \, C_0 \, epsilon) D^(epsilon \/ 2) parallel W parallel_(C^J \( I \))^2
   #scale(x: 180%, y: 180%)[\(] cal(H) + frac(cal(H)^2 F H_c^3, X) #scale(x: 180%, y: 180%)[\)] lt.double
   D^(epsilon \/ 2) Sigma parallel W parallel_(C^J \( I \))^2 . $ <eq:short-cube-bound>]
  Here $X \/ N \( h \)^3 gt.eq 1$, and the reciprocal-norm sum contributes only a logarithm.
    We use Proposition 10 with exponent $epsilon \/ 4$ and range $C_0 + 1$, since $N \( f \) < 2 D^(C_0)$.
    If $H_c < 1$, the sum is empty.
  Expand $T$ using (5.3) in the remaining terms, with cube index $c$:
  $ P_(upright("long")) \( k \, f \) =  & 1 / sqrt(X) sum_(\( h \, S \) = 1\
N \( h \) > H_c) sum_(\( c \, S \) = 1) mu \( h \) sqrt(N \( h c \)) thin overline(alpha \( h c \))^(thin 3)
  Psi_k \( h c \)^3\
 & quad times sum_(\( n \, S \) = 1)^(*) a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 W #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(] frac(N \( n \) N \( h c \)^3, X) #scale(x: 180%, y: 180%)[\)] . $
  Put $b = h c$; the pairs giving $b$ are exactly $\( h \, b \/ h \)$ with $h divides b$ and $N \( h \) > H_c$.
    Since $Psi_k \( b \)^3 = xi \( b \)^3 chi_b \( k \)^3 upright(bold(1))_(\( b \, f \) = 1)$, this gives
  $ P_(upright("long")) \( k \, f \) =  & sum_(\( b \, S \) = 1\
N \( b \) > H_c) frac(beta_0 \( b \, f \) chi_b \( k \)^3, N \( b \)) 1 /
  sqrt(L_b) sum_(\( n \, S \) = 1)^(*) a_xi \( n \) chi_n \( k \) chi_n \( f \)^4 W \( N \( n \) \/ L_b \) \,\
beta_0 \( b \, f \) :=  & overline(alpha \( b \))^(thin 3) xi \( b \)^3 upright(bold(1))_(\( b \, f \) = 1)
  sum_(h divides b\
N \( h \) > H_c) mu \( h \) \, wide \| beta_0 \( b \, f \) \| lt.eq tau_(upright("div")) \( b \) . $
  The divisor function $tau_(upright("div")) \( b \)$ counts ideal divisors.
    All these indices are primary and prime to $S$; $b$ need not be squarefree.
    The support of $W$ restricts the sum to $N \( b \)^3 lt.eq v X$. Weighted Cauchy–Schwarz now gives
  $ cal(E)_(upright("long")) & lt.eq #scale(x: 180%, y: 180%)[\(] sum_(H_c < N \( b \) lt.eq \( v X \)^(1 \/ 3)\
\( b \, S \) = 1) frac(tau_(upright("div")) \( b \), N \( b \)) #scale(x: 180%, y: 180%)[\)]
  sum_(H_c < N \( b \) lt.eq \( v X \)^(1 \/ 3)\
\( b \, S \) = 1) frac(tau_(upright("div")) \( b \), N \( b \)) cal(E) \( cal(H) \, L_b \, F \; xi \, W \) . $
  The reciprocal divisor sum is $lt.double_I log^2 \( 2 + X \)$, since
  $ sum_(N \( b \) lt.eq R) frac(tau_(upright("div")) \( b \), N \( b \)) =
    sum_(N \( c d \) lt.eq R) frac(1, N \( c \) N \( d \)) lt.eq
    #scale(x: 180%, y: 180%)[\(] sum_(N \( c \) lt.eq R) frac(1, N \( c \)) #scale(x: 180%, y: 180%)[\)]^2
    lt.double log^2 \( 2 R \) wide \( R gt.eq 1 \) . $
  If $L_b lt.eq 1$, the column sum is empty unless $L_b gt.eq 1 \/ v$; otherwise it has $O_I \( 1 \)$ terms, so
  $ cal(E) \( cal(H) \, L_b \, F \; xi \, W \) lt.double_I cal(H) /
    L_b parallel W parallel_oo^2 lt.double_I Sigma parallel W parallel_oo^2 . $
  Absorb the logarithms in $D^epsilon$ and combine the two parts using $cal(E) lt.eq 2 cal(E)_(upright("short")) +
    2 cal(E)_(upright("long"))$. This proves (5.7). If $cal(H)^2 lt.eq X$, then $H_c = X^(1 \/ 3)$,
    so $N \( b \) > H_c$ implies $L_b < 1$. ◻
]

=== 5.4 The transfer estimate <the-transfer-estimate>

Fix a nonnegative radial Schwartz weight $Phi$ with $Phi \( t \) gt.eq 1$ for $0 lt.eq t lt.eq
  1$ and $"supp" hat(Phi) subset \[ 0 \, C_Phi \]$. Such a weight is obtained by squaring and rescaling a real
  radial Schwartz function with compactly supported Fourier transform. Write $N = upright(N)_(K \/ bb(Q))$.
  For fixed $cal(H) \, L \, F \, xi$, put

#[#set math.equation(numbering: n => "(5.10)")
 $ cal(A) \( W \) := frac(1, L F) sum_(F lt.eq N \( f \) < 2 F\
\( f \, S \) = 1)^(*) sum_(k in cal(O)) Phi \( N \( k \) \/ cal(H) \) \| sum_(\( n \, S \) = 1)^(*) a_xi \( n \)
  chi_n \( k \) chi_n \( f \)^4 W \( N \( n \) \/ L \) #scale(x: 180%, y: 180%)[\|]^2 . $ <eq:smoothed-energy>]

Thus $cal(E) \( cal(H) \, L \, F \; xi \, W \) lt.eq cal(A) \( W \)$.
  In the following proposition $Sigma$ is an independent target scale;
  we will apply it at column scale $L_b$ with $Sigma = X F$.

#thm([Proposition 5.4.])[
  #emph[Assume $1 lt.eq cal(H) \, L \, F \, Sigma lt.eq D^(C_0)$ and $max { cal(H) \, L F } lt.eq Sigma$,
    for fixed $C_0 gt.eq 1$. For every integer $m gt.eq 0$ and $epsilon > 0$,
#[#set math.equation(numbering: n => "(5.11)")
 $ cal(A) \( W \) lt.double D^epsilon Sigma parallel W parallel_(C^(4 m + 12) \( I \))^2
   #scale(x: 180%, y: 180%)[\(] 1 + sup frac(cal(E) \( cal(H)' \, X' \, F' \; xi' \, U \), Sigma')
   #scale(x: 180%, y: 180%)[\)] $ <eq:transfer-summary>]

 where the supremum is over the family (4.4), with $Sigma' = X' F'$, $cal(H)' \, X' \, F' gt.eq 1$, and
#[#set math.equation(numbering: n => "(5.12)")
 $ cal(H)' lt.eq frac(cal(H) L, Sigma F) \, wide cal(H)' / Sigma' lt.eq cal(H) / Sigma \, wide Sigma' lt.eq
   L . $ <eq:transfer-scales>]

 For $I = \[ u \, v \]$, the tests satisfy $U in C_c^oo \( I' \)$, $I' = \[ u \/ 16 \, 4 v \]$,
   and $parallel U parallel_(C^m \( I' \)) lt.eq 1$; an empty supremum is zero.
   The estimate holds for every compact $I subset \( 0 \, oo \)$ and $W in C_c^oo \( I \)$,
   with implied constant depending on $m \, C_0 \, epsilon \, I \, nu \, S$ and the fixed ray class group.]
] <prop:transfer>

The proof is given in Section 7, by combining Lemmas 19 and 21.

=== 5.5 Proof of Proposition 9 <sec:canonical-proof>

#proof[
  Fix $kappa > 0$ and $C_0 gt.eq 1$. We prove by induction on $j gt.eq
    0$ that the proposition holds under the additional restriction $cal(H) lt.eq D^(j kappa)$,
    with the derivative order and implied constant allowed to depend on $j$.
    More precisely, for every $epsilon > 0$ there is an integer $J = J \( j \, kappa \, C_0 \, epsilon \) gt.eq
    1$ such that
  $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_(I \, nu \, S \, j \, kappa \, C_0 \, epsilon) D^epsilon
    Sigma parallel W parallel_(C^J \( I \))^2 $
  for every compact interval $I = \[ u \, v \] subset \( 0 \, oo \)$ and $W in C_c^oo \( I \)$,
    under the hypotheses of the proposition. The derivative order is independent of $I$;
    this allows us to apply the induction hypothesis on the enlarged interval in the transfer estimate.
    For the base case $j = 0$, we have $cal(H) lt.eq 1$. In (4.4),
    the support of $W$ restricts $n$ to the $O_I \( X \)$ ideals with $upright(N)_(K \/ bb(Q)) \( n \)
    in \[ u X \, v X \]$. The factors $a_xi \( n \)$, $chi_n \( k \)$,
    and $chi_n \( f \)^4$ have absolute value at most one, so the triangle inequality bounds each inner sum by
    $O_I \( X parallel W parallel_oo \)$. There are $O \( F \)$ choices of $f$ and $O \( cal(H) \)$ choices of
    $k$. Consequently,
  $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_I frac(F cal(H), X F) #scale(x: 120%, y: 120%)[\(] X
    parallel W parallel_oo #scale(x: 120%, y: 120%)[\)]^2 = cal(H) X parallel W parallel_oo^2 . $
  Dividing by $Sigma = X F$ and using $cal(H) lt.eq 1$ and $F gt.eq 1$ proves the assertion for $j = 0$, with $J = 1$.
  Suppose the assertion holds for $j$, and fix $epsilon > 0$.
    Let $m$ be the derivative order supplied by the induction hypothesis with exponent $epsilon \/ 3$.
    For $cal(H) lt.eq D^(\( j + 1 \) kappa)$, apply Lemma 11 with exponent $epsilon \/ 3$.
    We must bound the mean squares in its supremum uniformly in $b$.
    If this supremum is nonempty, then $cal(H)^2 > X$ and $H_c^3 = X^2 \/ cal(H)^2$.
    For each such $b$, recall that $L_b = X \/ upright(N)_(K \/ bb(Q)) \( b \)^3 > 1$.
    Since $L_b lt.eq X$ and $Sigma gt.eq max { cal(H) \, L_b F }$, Proposition 12 applies at column scale $L_b$,
    with derivative order $m$, and exponent $epsilon \/ 3$. Its estimate also bounds
    $cal(E) \( cal(H) \, L_b \, F \; xi \, W \)$ because $cal(E) \( cal(H) \, L_b \, F \; xi \, W \) lt.eq
    cal(A) \( W \)$.
  Let $cal(H)' \, X' \, F'$ be any parameters in the supremum in (5.11), with $Sigma' =
    X' F'$ as in that proposition. By (5.12) and $upright(N)_(K \/ bb(Q)) \( b \) > H_c$,
  $ cal(H)' & lt.eq frac(cal(H) L_b, Sigma F) = frac(cal(H), upright(N)_(K \/ bb(Q)) \( b \)^3 F^2) < cal(H)
    #scale(x: 180%, y: 180%)[\(] cal(H) / Sigma #scale(x: 180%, y: 180%)[\)]^2 lt.eq D^(- 2 kappa) cal(H) lt.eq
    D^(j kappa) \,\
cal(H)' / Sigma' & lt.eq cal(H) / Sigma lt.eq D^(- kappa) \, wide Sigma' lt.eq L_b lt.eq Sigma lt.eq D^(C_0) . $
  Thus each of these mean squares is covered by the induction hypothesis.
    Its weight $U$ is supported in $\[ u \/ 16 \, 4 v \]$ and has $C^m$ norm at most one.
    Applying the induction hypothesis on this interval gives
  $ frac(cal(E) \( cal(H)' \, X' \, F' \; xi' \, U \), Sigma')
    lt.double_(I \, nu \, S \, j \, kappa \, C_0 \, epsilon) D^(epsilon \/ 3) . $
  The enlarged interval is determined by $I$, so the implied constant has only the permitted dependence on the
    support. Substituting into (5.11) yields, uniformly in $b$,
  $ cal(E) \( cal(H) \, L_b \, F \; xi \, W \) lt.double_(I \, nu \, S \, j \, kappa \, C_0 \, epsilon)
    D^(2 epsilon \/ 3) Sigma parallel W parallel_(C^(4 m + 12) \( I \))^2 . $
  Substitution into (5.7) contributes the remaining factor $D^(epsilon \/ 3)$.
    Choose $J$ at least $4 m + 12$ and at least the derivative order required by Lemma 11. We obtain
  $ cal(E) \( cal(H) \, X \, F \; xi \, W \) lt.double_(I \, nu \, S \, j \, kappa \, C_0 \, epsilon) D^epsilon
    Sigma parallel W parallel_(C^J \( I \))^2 . $
  The choice of $J$ depends only on $j \, kappa \, C_0 \, epsilon$.
    If the supremum in (5.7) is empty, the same bound follows directly from that lemma. This completes the induction.
  Finally, take $j = ceil.l C_0 \/ kappa ceil.r$. The hypothesis $cal(H) lt.eq Sigma lt.eq
    D^(C_0)$ ensures $cal(H) lt.eq D^(j kappa)$, so the induction gives the proposition. ◻
]

=== 5.6 The original mean square and the exponent $11 \/ 12$ <sec:completion>

#proof[
  Fix $0 < theta.alt lt.eq 1 \/ 10$ and put $H = D^(1 + theta.alt)$. The ranges in (4.6) give
  #[#set math.equation(numbering: n => "(5.13)")
   $ cal(H) lt.eq frac(C D^(1 - theta.alt), B^2) \, wide Sigma = X F = D / B \, wide cal(H) /
     Sigma lt.double D^(- theta.alt) . $ <eq:initial-positive-gap>]
  For large $D$, Proposition 9 applies with $kappa = theta.alt \/ 2$ and $C_0 = 2$.
    If $X < 1$, nonempty support forces $X gt.double_I 1$, and counting gives $cal(E) lt.double_I cal(H) parallel
    W parallel_oo^2 lt.double Sigma parallel W parallel_oo^2$; if $cal(H) < 1$, the sum is empty.
    Thus (4.7) holds, with derivative order depending only on $theta.alt \, epsilon$,
    and Proposition 8 proves (3.1). Bounded $D$ is again covered by counting. ◻
]

== 6 Proof of the completed mean-square estimate <sec:reflection>

We prove Proposition 10. We first express the completed sum (5.3) using cubic theta coefficients and state the
  transformation formula. We then apply the quadratic large sieve and account for repeated prime factors in $k$.

=== 6.1 Realization by the cubic theta function <realization-by-the-cubic-theta-function>

With the row $k$ and auxiliary index $f$ fixed, we express $T \( X \; k \, f \)$ as a weighted sum of Fourier
  coefficients of the cubic theta function. Its automorphy then expresses this sum in terms of coefficients at
  other cusps, as in [7] §5 and Appendix A. We use $Psi_k$ from (5.4),
  suppressing its dependence on the fixed $f$ and $xi$.

Write $\( z \, v \) in bb(C) times bb(R)_(> 0)$ for upper half-space coordinates,
  with horizontal coordinate $z$ and height $v$. We use Kubota’s cubic theta function in the normalization of
  [7] §5.1, (5.6):

#[#set math.equation(numbering: n => "(6.1)")
 $ theta \( z \, v \) = 3^(5 \/ 2) / 2 v^(2 \/ 3) + sum_(ell in lambda^(- 3) cal(O)\
ell eq.not 0) tau \( ell \) v K_(1 \/ 3) \( 4 pi \| ell \| v \) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 2
  pi upright(i) \( ell z + overline(ell z) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cubic-theta-definition>]

Here $K_(1 \/ 3)$ is the modified Bessel function of the second kind,
  and $tau \( ell \)$ is the coefficient sequence given explicitly in [7] (5.7)–(5.8),
  following Patterson’s calculation [38] Theorem 8.1.

We define $Theta_k \( z \, v \)$ by twisting the Fourier coefficients of $overline(theta)$.
  First define $phi.alt_k : cal(O) arrow.r bb(C)$ by

$ phi.alt_k \( n \) =
  cases(delim: "{", chi_n \( lambda \)^2 Psi_k \( n \) \, & n equiv 1 med \( mod med 3 \) \, quad \( n \, S \) =
  1 \,, 0 \, & upright("otherwise") .) $

Then we define $Theta_k \( z \, v \)$ by multiplying the Fourier coefficient of $overline(theta)$ at $ell$,
  which is $overline(tau \( - ell \))$, by $phi.alt_k \( lambda^3 ell \)$:

#[#set math.equation(numbering: n => "(6.2)")
 $ Theta_k \( z \, v \) = sum_(ell in lambda^(- 3) cal(O)\
ell eq.not 0) overline(tau \( - ell \)) phi.alt_k \( lambda^3 ell \) v K_(1 \/ 3) \( 4 pi \| ell \| v \) exp
  #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 2 pi upright(i) \( ell z + overline(ell z) \)
  #scale(x: 120%, y: 120%)[\)] . $ <eq:twisted-theta-definition>]

Recall that $c_theta \( n b^3 \)$ is defined in (2.10). Choose a nonzero $q in
  cal(O)$ such that $phi.alt_k$ is periodic modulo $\( q \)$, and put

$ hat(phi.alt)_k \( h \) = frac(1, upright(N)_(K \/ bb(Q)) \( q \)) sum_(n med mod med q) phi.alt_k \( n \)
  e \( - h n \/ q \) . $

#thm([Lemma 6.1.])[
  #emph[With these definitions,
#[#set math.equation(numbering: n => "(6.3)")
 $ T \( X \; k \, f \) = frac(1, 3^(5 \/ 2) sqrt(X)) sum_(n \, b in cal(O)\
n \, b equiv 1 med \( 3 \)\
n med upright("squarefree")\
\( n b \, S \) = 1) c_theta \( n b^3 \) phi.alt_k \( n b^3 \) overline(alpha \( n b^3 \)) W #h(-0.16667em)
  #scale(x: 180%, y: 180%)[\(] frac(upright(N)_(K \/ bb(Q)) \( n b^3 \), X) #scale(x: 180%, y: 180%)[\)] .
  $ <eq:T-theta>]

 Moreover,
#[#set math.equation(numbering: n => "(6.4)")
 $ Theta_k \( z \, v \) = sum_(h in cal(O) \/ \( q \)) hat(phi.alt)_k \( h \)
   overline(theta \( z + lambda^2 h \/ q \, v \)) . $ <eq:theta-twist-translates>]

]
] <lem:theta-realization>

#proof[
  The coefficient formula (2.10) gives
  $ c_theta \( n b^3 \) phi.alt_k \( n b^3 \) = 3^(5 \/ 2) \| b \| gamma_2 \( n \) Psi_k \( n \) Psi_k \( b \)^3 . $
  Substitution into (5.3), using $V_(*) \( y \) = sqrt(y) thin W \( y \)$, proves (6.3). Finite Fourier inversion gives
  $ phi.alt_k \( n \) = sum_(h in cal(O) \/ \( q \)) hat(phi.alt)_k \( h \) e \( n h \/ q \) \, wide
    sum_(h in cal(O) \/ \( q \)) hat(phi.alt)_k \( h \) = phi.alt_k \( 0 \) = 0 . $
  Multiplication of the $ell$th Fourier mode by $e \( lambda^3 ell h \/ q \)$ translates $z$ to $z +
    lambda^2 h \/ q$. The second identity cancels the constant term, proving (6.4). ◻
]

The resulting transformation formula is stated in the next subsection;
  its automorphy calculation is given in Appendix 8.2.

=== 6.2 The theta transformation <the-theta-transformation>

Recall that, for a primary prime $p in.not S$, $chi_p \( x \) = \( x \/ p \)_6$ is the sextic residue character on
  $\( cal(O) \/ \( p \) \)^times$. For every integer $j$, write $chi_p^j$ for its $j$th power on this group,
  extended by zero on multiples of $p$; in particular, $chi_p^0 \( x \) = upright(bold(1))_(p divides.not x)$.
  Sextic reciprocity (4.1) expresses the factors of $Psi_k$ at primes outside $S$ as such powers, with $0 lt.eq
  j lt.eq 5$.

For a primary prime $p in.not S$, $j in { 0 \, dots.h \, 5 }$, and $x in cal(O)$, define the local factor

#[#set math.equation(numbering: n => "(6.5)")
 $ B_(p \, j) \( x \) =
   cases(delim: "{", chi_p \( x \)^(- j - 2) \, & j eq.not 0 \, 4 \,, upright(N)_(K \/ bb(Q)) \( p \)^(- 1 \/
   2) \( - 1 + upright(N)_(K \/ bb(Q)) \( p \) upright(bold(1))_(p divides x) \) \, & j = 4 \,, upright(N)_(K \/
   bb(Q)) \( p \)^(- 1 \/ 2) chi_p \( x \)^(- 2) \, & j = 0 .) $ <eq:theta-local-factors>]

The key case is the quadratic character

$ B_(p \, 1) \( x \) = chi_p \( x \)^3 . $

For the smooth compactly supported weight $V_(*)$ in (5.3), put $hat(V)_(*) \( s \) =
  integral_0^oo V_(*) \( x \) x^s thin d x \/ x$. We write $integral_(\( sigma \))$ for integration upwards along
  the vertical line with real part $sigma$. With $Gamma$ denoting Euler’s gamma function,
  the accompanying transform of the weight is

#[#set math.equation(numbering: n => "(6.6)")
 $ V_(*)^sharp \( x \) = frac(1, 2 pi upright(i)) integral_(\( 0 \)) hat(V)_(*) \( - t \)
   frac(Gamma \( 7 \/ 6 + t \) Gamma \( 5 \/ 6 + t \), Gamma \( 7 \/ 6 - t \) Gamma \( 5 \/ 6 - t \))
   #scale(x: 180%, y: 180%)[\(] frac(\( 2 pi \)^4 x, 27) #scale(x: 180%, y: 180%)[\)]^(- t) thin d t \, wide
   x > 0 . $ <eq:theta-weight>]

Here $theta$ is Kubota’s cubic theta function, normalized in (6.1).
  The dual sums use the Fourier coefficients of $overline(theta)$ at three cusps. Take the representatives

#[#set math.equation(numbering: n => "(6.7)")
 $ gamma_0 = I \, wide gamma_(+) = mat(delim: "(", 1, 0; omega, 1) \, wide gamma_(-) =
   mat(delim: "(", 1, 0; omega^2, 1) \, $ <eq:theta-cusp-representatives>]

acting on upper half-space. For $sigma in { 0 \, + \, - }$,
  define $d_sigma \( ell \)$ by the Fourier expansion [7] (5.9), (5.15)

#[#set math.equation(numbering: n => "(6.8)")
 $ overline(theta \( gamma_sigma \( z \, v \) \)) = 3^(5 \/ 2) / 2 upright(bold(1))_(sigma = 0) v^(2 \/ 3) +
   sum_(0 eq.not ell in lambda^(- 4) cal(O)) d_sigma \( ell \) v K_(1 \/ 3) \( 4 pi \| ell \| v \) exp
   #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 2 pi upright(i) \( ell z + overline(ell z) \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:cusp-coefficient-definition>]

Thus $d_0 \( ell \) = overline(tau \( - ell \))$, with $tau$ extended by zero outside $lambda^(- 3) cal(O)$.
  In particular, $c_theta \( n b^3 \) = d_0 \( lambda^(- 3) n b^3 \)$ for the indices in (2.10);
  the outline uses $d_theta \( m \)$ for $d_sigma \( lambda^(- 4) m \)$ with one of these three choices of
  $sigma$. The arithmetic formulas for all three sequences are given by (8.6) and (8.7) in Appendix 8.2.

We state the formula for a general product of local twists.
  Fix a ray class character whose conductor is supported on $S$,
  and let $Psi_0$ be its extension by zero at every prime in $S$.
  Let $cal(P)$ be a finite set of primes outside $S$, each represented by its primary generator in $cal(O)$,
  and choose integers $0 lt.eq j_p lt.eq 5$ for each $p in cal(P)$. For primary $n in cal(O)$, set

$ Psi \( n \) = Psi_0 \( n \) product_(p in cal(P)) chi_p^(j_p) \( n \) . $

In the transformed sums, $cal(A)$ will range over subsets satisfying

$ { p in cal(P) : j_p eq.not 0 } subset.eq cal(A) subset.eq cal(P) . $

Thus only primes with $j_p = 0$ may be omitted from $cal(A)$.
  We call the primes in $cal(A)$ #emph[active] and those in $cal(P) \\ cal(A)$ #emph[inactive].
  For such a subset and $c_0 in cal(O) \\ { 0 }$, write

$ c = c_0 product_(p in cal(A)) p . $

#thm([Proposition 6.2.])[
  #emph[The quantity $T \( X \; Psi \)$ defined in (5.3) is a sum of $O_(Psi_0 \, S) \( 2^(\| cal(P) \|) \)$ terms
    of the form
#[#set math.equation(numbering: n => "(6.9)")
 $ C sum_(0 eq.not ell in lambda^(- 4) cal(O))
   frac(d \( ell \) alpha \( ell \), sqrt(upright(N)_(K \/ bb(Q)) \( ell \))) thin psi \( lambda^4 ell \)
   product_(p in cal(A)) B_(p \, j_p) \( lambda^4 ell \) V_(*)^sharp #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(upright(N)_(K \/ bb(Q)) \( ell \) X, upright(N)_(K \/ bb(Q)) \( c \)^2) #scale(x: 180%, y: 180%)[\)] .
   $ <eq:reflection>]

]
  #emph[Here $cal(A)$ and $c$ are as above, and $\| C \| lt.double_(Psi_0 \, S) 1$.
    The triples $\( d \, psi \, c_0 \)$ belong to a fixed finite family depending only on $Psi_0 \, S$,
    where $d in { d_0 \, d_(+) \, d_(-) }$, $c_0 in cal(O) \\ { 0 }$,
    and $psi$ is a unit-modulus additive character on $cal(O)$.]
] <lem:reflection>

To average the transformed sums over $k_0$, we need to choose their cusp coefficients and additive characters
  consistently as $k_0$ varies. Fix a finite set $cal(P)_(upright("fix"))$ of primary primes outside $S$ and
  exponents $j_p in { 0 \, dots.h \, 5 }$, and put

$ Psi_(k_0) \( n \) = Psi_0 \( n \) product_(p in cal(P)_(upright("fix"))) chi_p^(j_p) \( n \)
  product_(p divides k_0) chi_p \( n \) \, $

where $k_0$ is primary and squarefree, with $\( k_0 \, S product_(p in cal(P)_(upright("fix"))) p \) = 1$.
  Let $cal(A)_(upright("fix"))$ range over the subsets satisfying

$ { p in cal(P)_(upright("fix")) : j_p eq.not 0 } subset.eq cal(A)_(upright("fix")) subset.eq
  cal(P)_(upright("fix")) \, wide cal(A) = cal(A)_(upright("fix")) union { p : p divides k_0 } . $

Every prime dividing $k_0$ belongs to $cal(A)$, since its exponent is $1$.

#thm([Lemma 6.3.])[
  (Uniformity in the twist).  #emph[For the family $Psi_(k_0)$ above,
    the summands in Proposition 14 may be indexed by $\( h \, cal(A)_(upright("fix")) \)$,
    with $h$ in a fixed finite set depending only on $Psi_0 \, S$. Zero scalar coefficients are permitted.
    For each fixed index, the triple $\( d \, psi \, c_0 \)$ depends on $k_0$ only through its ray class modulo a
    fixed ideal supported on $S$ and depending only on $Psi_0 \, S$.]
] <lem:reflection-uniformity>

To estimate the dual sums, we need bounds for the cusp coefficients and the transformed weight.

#thm([Lemma 6.4.])[
  #emph[For each $d in { d_0 \, d_(+) \, d_(-) }$, the coefficient $d \( ell \)$ vanishes unless $ell$ can be written as
#[#set math.equation(numbering: n => "(6.10)")
 $ ell = u lambda^m n b^3 \, $ <eq:theta-support>]

 where $u in cal(O)^times$, $m in bb(Z)$ with $m gt.eq - 4$, and $n \, b in cal(O)$ are primary with $n$ squarefree.
#[#set math.equation(numbering: n => "(6.11)")
 $ \| d \( ell \) \| = \| d \( u lambda^m n b^3 \) \| lt.eq
   27 dot.op 3^(m \/ 6) \| b \| . $ <eq:theta-coefficient-bound>]

]
  #emph[For $A > 0$, integers $j gt.eq 0$, and $V_(*)$ supported in a fixed compact interval $I
    subset \( 0 \, oo \)$, there is $J = J \( A \, j \)$ such that
#[#set math.equation(numbering: n => "(6.12)")
 $ \| \( x partial_x \)^j V_(*)^sharp \( x \) \| lt.double_(A \, j \, I) parallel V_(*) parallel_(C^J \( I \))
   min \( x^(1 \/ 4) \, x^(- A) \) \, wide x > 0 . $ <eq:theta-weight-decay>]

]
] <lem:theta-bounds>

Proposition 14 and Lemmas 15 and 16 are proved in Appendix 8.2.

=== 6.3 The quadratic mean square on the dual side <the-quadratic-mean-square-on-the-dual-side>

We record the quadratic large-sieve estimate needed below.

#thm([Lemma 6.5.])[
  #emph[Let $cal(H) \, U gt.eq 1$, and let $beta \( n \)$ be complex coefficients on squarefree primary $n$ with
    $upright(N)_(K \/ bb(Q)) \( n \) asymp U$. For every $epsilon > 0$,
#[#set math.equation(numbering: n => "(6.13)")
 $ sum_(k equiv 1 med \( 3 \) \, med \( k \, S \) = 1\
upright(N)_(K \/ bb(Q)) \( k \) lt.eq cal(H))^(*) \| sum_(n equiv 1 med \( 3 \) \, med n med upright("squarefree")\
upright(N)_(K \/ bb(Q)) \( n \) asymp U) beta \( n \) chi_k \( n \)^3 #scale(x: 180%, y: 180%)[\|]^2
  lt.double_(S \, epsilon) \( cal(H) U \)^epsilon \( cal(H) + U \) sum_n \| beta \( n \) \|^2 . $ <eq:Q>]

 The star restricts $k$ to squarefree primary elements.]
] <lem:quadratic>

#proof[
  This is Goldmakher and Louvel’s quadratic large sieve [13] Theorem 1.1,
    after fixing the product of the prime factors of $n$ lying in $S$, and finitely many ray classes.
    For completeness, let $e_k in { 0 \, 1 }$ according as $upright(N)_(K \/ bb(Q)) \( k \) equiv 1 \,
    3 med \( mod med 4 \)$, and let $kappa_lambda$ be the nontrivial character modulo $lambda$.
    The character $x mapsto \( x \/ k \)_2 kappa_lambda \( x \)^(e_k)$ is trivial on units and has primitive
    conductor $k lambda^(e_k)$. When $e_k = 0$, the factor $kappa_lambda \( x \)^(e_k)$ is omitted.
    Classes modulo $24 cal(O)$ fix the supplementary characters and reciprocity factors; for coprime $k_1 \,
    k_2$ in the same class, the product character has conductor $k_1 k_2$.
    These are the hypotheses in [13] Definition 1 and §2. ◻
]

=== 6.4 Squarefree rows and the completed bound <squarefree-rows-and-the-completed-bound>

Write $N \( a \) = upright(N)_(K \/ bb(Q)) \( a \)$. In (5.4), allow any $g in cal(O) \\ { 0 }$ in place of $f$,
  so $Psi_k \( n \) = xi \( n \) chi_n \( k \) chi_n \( g \)^4$. The zero extension at $S$ is retained.
  Choose prime-ideal generators, primary away from $3$, and extend multiplicatively to all ideals.
  We first bound squarefree rows.

#thm([Lemma 6.6.])[
  #emph[For every $epsilon > 0$ and $C_0 gt.eq 1$ there is $J = J \( epsilon \, C_0 \) gt.eq 1$ such that
#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(0 < N \( s \) lt.eq cal(H)\
s med upright("squarefree")) \| T \( X \; u_0 s \, g \) \|^2 lt.double_(I \, xi \, S \, epsilon \, C_0) D^epsilon
  parallel W parallel_(C^J \( I \))^2 #scale(x: 180%, y: 180%)[\(] cal(H) +
  frac(cal(H)^2 N \( g \), X) #scale(x: 180%, y: 180%)[\)] $ <eq:squarefree-completed>]

 for $1 lt.eq cal(H) \, X \, N \( g \) lt.eq D^(C_0)$, $u_0 in cal(O)^times$,
   every compact interval $I subset \( 0 \, oo \)$, and $W in C_c^oo \( I \)$.
   The sum uses the chosen generators of squarefree ideals, including those meeting $S$.]
] <lem:squarefree-completed>

#proof[
  By homogeneity assume $parallel W parallel_(C^J \( I \)) lt.eq 1$, with $J$ chosen below. Write
  $ s = t k_0 \, wide t = product_(p divides s\
p divides g med upright("or") med p in S) p \, wide N \( k_0 \) lt.eq cal(H)_0 := frac(cal(H), N \( t \)) . $
  Fix $t$; then $k_0$ is squarefree and primary, with $\( k_0 \, g \) = 1$ and $\( k_0 \, S \) = 1$.
    Discard empty ranges, so $cal(H)_0 gt.eq 1$, and retain these restrictions below.
    For a coefficient function $A \( n \, b \)$, a positive scale $Y$, and an integer $m gt.eq - 4$, put
  #[#set math.equation(numbering: n => "(6.15)")
   $ cal(S)_m \[ A \, Y \] \( k_0 \) := sum_(n \, b equiv 1 med \( 3 \)\
n med upright("squarefree")) frac(A \( n \, b \) chi_(k_0) \( n b \)^3, 3^(m \/ 3) sqrt(N \( n \)) thin N \( b \))
  V_(*)^sharp #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
  frac(3^m N \( n \) N \( b \)^3 cal(H)_0^2, Y N \( k_0 \)^2) #scale(x: 180%, y: 180%)[\)] . $ <eq:prepared-theta-sum>]
  We shall obtain, after partitioning $k_0$ into fixed ray classes,
  $ T \( X \; u_0 t k_0 \, g \) = sum_(iota in cal(I)) sum_(m gt.eq - 4) c_(iota \, m) \( k_0 \)
    cal(S)_m \[ A_(iota \, m) \, Y_iota \] \( k_0 \) \, $
  where $cal(I)$ is independent of $k_0$, $\| cal(I) \| prec.curly.eq 1$,
    $\| c_(iota \, m) \( k_0 \) \| lt.double 1$, and $A_(iota \, m)$ is independent of $k_0$.
    For some $a_iota \, Y_iota > 0$, the coefficients and lengths satisfy
  #[#set math.equation(numbering: n => "(6.16)")
   $ \| A_(iota \, m) \( n \, b \) \| lt.double a_iota \, wide a_iota^2 lt.eq 1 \, wide
     a_iota^2 Y_iota lt.double cal(H)_0^2 / X N \( t \)^2 N \( g \) . $ <eq:auxiliary-conductor-bound>]
  All column restrictions are included by extending $A_(iota \, m)$ by zero. Put $k = u_0 t k_0$.
    For $cal(P) = { p in.not S : p divides k g }$, sextic reciprocity (4.1) gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ Psi_k \( n \) = Psi_0 \( n \) product_(p in cal(P)) chi_p^(j_p) \( n \) \, wide j_p equiv v_p \( k \) +
     4 v_p \( g \) med \( mod med 6 \) \, wide 0 lt.eq j_p lt.eq 5 . $ <eq:theta-row-twist>]
  Even when $j_p = 0$, the factor $chi_p^0 \( n \) = upright(bold(1))_(p divides.not n)$ retains the zero
    extension at $p divides k g$. The fixed factor $Psi_0$ contains $xi$, the factors at $S$, the unit factors,
    and $n mapsto cal(R) \( n \, product_(p in.not S) p^(v_p \( k \)) \)$.
    The fourth power at $g$ contributes no reciprocity sign, and the factors at $S$ depend only on exponents
    modulo six. Thus $Psi_0$ ranges over a fixed finite family.
    In the notation of Lemma 15, take $cal(P)_(upright("fix")) = { p in.not S : p divides t g }$,
    so that $cal(P) = cal(P)_(upright("fix")) union.sq { p : p divides k_0 }$;
    the exponents on $cal(P)_(upright("fix"))$ are fixed with $t \, g$.
    Partitioning $k_0$ into fixed ray classes fixes $Psi_0$ and, by Lemma 15, the data $d \, psi \,
    c_0$ in each transformed term.
  Fix one transformed term, with active primes $cal(A)_(upright("fix"))$ away from $k_0$, and put $c_(*) =
    c_0 product_(p in cal(A)_(upright("fix"))) p$. Thus $c = c_(*) k_0$ in (6.9).
    By (6.10), write $ell = u lambda^m n b^3$, with $u \, m \, n \, b$ as there.
    Every prime dividing $k_0$ has $j_p = 1$, and hence
  #[#set math.equation(numbering: n => "(6.18)")
   $ B_(p \, 1) \( u lambda^(m + 4) n b^3 \) = chi_p \( u lambda^(m + 4) \)^3 chi_p \( n b \)^3 .
     $ <eq:residual-quadratic-factor>]
  Indeed, the transformed exponent is $- 1 - 2 equiv 3 med \( mod med 6 \)$ and $chi_p \( b \)^9 =
    chi_p \( b \)^3$, also when $p divides b$ by zero extension.
    The coefficient bound and rapid decay in Lemma 16 give absolute convergence of the transformed series,
    so we may regroup its terms below. Set
  $ A_(u \, m) \( n \, b \) =
    frac(d \( u lambda^m n b^3 \) alpha \( u lambda^m n b^3 \) psi \( u lambda^(m + 4) n b^3 \), 3^(m \/ 6)
    sqrt(N \( b \))) \, wide \| A_(u \, m) \( n \, b \) \| lt.eq 27 . $
  The transformed term is therefore
  $ & C \( k_0 \) sum_(u in cal(O)^times) sum_(m gt.eq - 4) chi_(k_0) \( u lambda^(m + 4) \)^3
    sum_(n \, b equiv 1 med \( 3 \)\
n med
  upright("squarefree")) frac(A_(u \, m) \( n \, b \) chi_(k_0) \( n b \)^3, 3^(m \/ 3) sqrt(N \( n \)) thin N \( b \))\
 & wide times product_(p in cal(A)_(upright("fix"))) B_(p \, j_p) \( u lambda^(m + 4) n b^3 \) V_(*)^sharp
   #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(3^m N \( n \) N \( b \)^3 X, N \( c_(*) \)^2 N \( k_0 \)^2)
   #scale(x: 180%, y: 180%)[\)] \, wide \| C \( k_0 \) \| lt.double 1 . $
  The representation is unique: away from $lambda$, the prime exponents of $ell$ are $3 v_p \( b \)$ or $1 +
    3 v_p \( b \)$. Apart from the quadratic character and weight, the $k_0$-dependence is a bounded scalar.
  Fix $u \, m$ and write $q = N \( p \)$ for an active prime $p divides.not k_0$. For $j_p = 4$, the local identity is
  $ B_(p \, 4) \( u lambda^(m + 4) n b^3 \) = - q^(- 1 \/ 2) + q^(1 \/ 2) upright(bold(1))_(p divides n) +
    q^(1 \/ 2) upright(bold(1))_(p divides.not n \, med p divides b) . $
  To display the reindexing in (6.15), let $A^(\( p \)) \( n \, b \)$ include all the other local factors and set
  $ A^(\( p \, n \)) \( n \, b \) = upright(bold(1))_(p divides.not n) A^(\( p \)) \( p n \, b \) \, wide
    A^(\( p \, b \)) \( n \, b \) = upright(bold(1))_(p divides.not n) A^(\( p \)) \( n \, p b \) . $
  Then the changes $n = p n'$ and $b = p b'$ give the exact identity
  $ & cal(S)_m \[ A^(\( p \)) \( n \, b \) B_(p \, 4) \( u lambda^(m + 4) n b^3 \) \, q^2 Y \] \( k_0 \)\
 & quad = - q^(- 1 \/ 2) cal(S)_m \[ A^(\( p \)) \, q^2 Y \] \( k_0 \) +
   chi_(k_0) \( p \)^3 cal(S)_m \[ A^(\( p \, n \)) \, q Y \] \( k_0 \)\
 & wide quad + q^(- 1 \/ 2) chi_(k_0) \( p \)^3 cal(S)_m \[ A^(\( p \, b \)) \, Y \/ q \] \( k_0 \) . $
  In the second term $p divides.not n'$ preserves squarefreeness; in the third,
    $p divides.not n$ is retained and $b'$ is unrestricted at $p$. Both extracted phases have modulus one.
    The factors $q^(1 \/ 2)$ in the local identity cancel against $sqrt(N \( p n' \))$ or leave $q^(- 1 \/ 2)$
    after division by $N \( p b' \)$.
  Let $a$ track a bound $\| A \( n \, b \) \| lt.eq 27 a$ for the coefficient in (6.15), and let $Y$ be its scale.
    Before inserting the active primes, these are $a = 1$ and $Y = N \( c_0 \)^2 cal(H)_0^2 \/ X$.
    Each active prime contributes $q^2$ to the squared conductor norm. Including this factor, the updates are
  $ \( a^2 \, Y \) mapsto
    cases(delim: "{", \( a^2 \, q^2 Y \) \, & j_p in.not { 0 \, 4 } \,, \( a^2 \/ q \, q^2 Y \) \, & j_p =
    0 \,, \( a^2 \/ q \, q^2 Y \) \, med \( a^2 \, q Y \) \, med \( a^2 \/ q \, Y \/ q \) \, & j_p = 4 .) $
  Thus $a^2$ never increases. If $p divides t$ and $p in.not S$, then $j_p$ is odd,
    so $a^2 Y$ costs at most $N \( p \)^2$. If $p divides g$ and $p divides.not t$,
    the cost is $N \( p \)$ for $j_p = 0 \, 4$ and $N \( p \)^2$ for $j_p = 2$;
    the latter case requires $v_p \( g \) gt.eq 2$. Hence
  $ a^2 Y lt.double cal(H)_0^2 / X product_(p divides t\
p in.not S) N \( p \)^2 product_(p divides g\
p divides.not t \, med p in.not S) N \( p \)^(v_p \( g \)) lt.eq frac(cal(H)_0^2 N \( t \)^2 N \( g \), X) . $
  Reindexing at distinct primes preserves the form and zero extensions.
    By Lemma 15, the transformed terms, units, and at most three choices per prime $p in
    cal(A)_(upright("fix"))$ with $j_p = 4$ form an index set of divisor-bounded size in $t g$.
    Here and below, divisor-bounded in $a$ means bounded by $C
    tau_(upright("div")) \( a \)^A$ for fixed constants $C \, A$; in particular,
    this is $lt.double_epsilon upright(N)_(K \/ bb(Q)) \( a \)^epsilon$ for every $epsilon > 0$.
    For one index $iota$, abbreviate $a = a_iota$, $Y = Y_iota$, and $A_m = A_(iota \, m)$.
    The local updates give $Y lt.double D^(C_1)$ for some fixed $C_1 = C_1 \( C_0 \)$.
    Split $b$ into $B lt.eq N \( b \) < 2 B$, and $n$ by a smooth dyadic partition $V \( N \( n \) \/ U \)$,
    with $U \, B gt.eq 1$ and uniformly bounded cutoffs. For this part of (6.15), write
  $ cal(S)_(m \; U \, B) \( k_0 \) & = 3^(- m \/ 3) sum_(B lt.eq N \( b \) < 2 B)
    frac(chi_(k_0) \( b \)^3, N \( b \)) F_b \( k_0 \) \,\
F_b \( k_0 \) & = sum_(n med upright("squarefree")) frac(A_m \( n \, b \) chi_(k_0) \( n \)^3, sqrt(N \( n \)))
  V \( N \( n \) \/ U \) V_(*)^sharp #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
  frac(3^m N \( n \) N \( b \)^3 cal(H)_0^2, Y N \( k_0 \)^2) #scale(x: 180%, y: 180%)[\)] . $
  Here $n \, b$ remain primary. Put $z_(*) = 3^m U B^3 \/ Y$ and fix a decay exponent $A > 0$.
    With $m \, U \, B \, Y$ fixed, Lemma 22, applied only in $N \( n \) \/ U$,
    gives the following representation in a real Mellin variable $s$:
  #[#set math.equation(numbering: n => "(6.19)")
   $ F_b \( k_0 \) & = integral_(bb(R)) c_(b \, k_0) \( s \) G_(b \, s) \( k_0 \) thin d s \,\
G_(b \, s) \( k_0 \) & = sum_(n med upright("squarefree")\
N \( n \) asymp U) frac(A_m \( n \, b \) chi_(k_0) \( n \)^3, sqrt(N \( n \))) \( N \( n \) \/ U \)^(upright(i) s) \,\
\| c_(b \, k_0) \( s \) \| & lt.double_(I \, A) \( 1 + z_(*) \)^(- A) \( 1 + \| s \| \)^(- 2) .
  $ <eq:theta-separated-columns>]
  Indeed, the scale $R$ in (9.2) is $3^m U N \( b \)^3 cal(H)_0^2 \/ \( Y N \( k_0 \)^2 \) gt.eq z_(*)$.
    Lemma 16 supplies the required derivative bounds, independently of $b \, k_0 \, U \, B \, m$.
    Since $sum_(N \( n \) asymp U) N \( n \)^(- 1) lt.double 1$, Lemma 17 gives, for any $sigma > 0$,
  $ sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| G_(b \, s) \( k_0 \) \|^2 lt.double_(S \, sigma)
    a^2 \( cal(H)_0 U \)^sigma \( cal(H)_0 + U \) . $
  Apply weighted Cauchy–Schwarz to the Mellin integral, as recorded in (9.6), with the common majorant in (6.19),
    then weighted Cauchy–Schwarz in $b$, using $sum_(B lt.eq N \( b \) < 2 B) N \( b \)^(- 1) lt.double 1$:
  #[#set math.equation(numbering: n => "(6.20)")
   $ sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| cal(S)_(m \; U \, B) \( k_0 \) \|^2 & lt.eq
     3^(- 2 m \/ 3) #scale(x: 180%, y: 180%)[\(] sum_(B lt.eq N \( b \) < 2 B) frac(1, N \( b \))
     #scale(x: 180%, y: 180%)[\)] sum_(B lt.eq N \( b \) < 2 B) frac(1, N \( b \))
     sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| F_b \( k_0 \) \|^2\
 & lt.double_(I \, S \, A \, sigma) a^2
   3^(- 2 m \/ 3) \( cal(H)_0 U \)^sigma \( cal(H)_0 + U \) \( 1 + z_(*) \)^(- 2 A) . $ <eq:prepared-mean-square>]
  Since $m gt.eq - 4$, we have $U lt.eq 81 Y z_(*)$ and hence $cal(H)_0 U lt.double
    D^(C_0 + C_1) \( 1 + z_(*) \)$. Choose $0 < sigma lt.eq 1$ small in terms of $epsilon_1 > 0 \,
    C_0$ and take $A = 3$. Taking square roots in (6.20) gives
  $ #scale(x: 180%, y: 180%)[\(] sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| cal(S)_(m \; U \, B) \( k_0 \) \|^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.double a D^(epsilon_1)
    3^(- m \/ 3) \( sqrt(cal(H)_0) + sqrt(U) \) \( 1 + 3^m U B^3 \/ Y \)^(- 2) . $
  The infinite dyadic sums converge: for dyadic $U \, B gt.eq 1$ and every $Z > 0$,
  $ sum_(U \, B med upright("dyadic")) \( 1 + U B^3 \/ Z \)^(- 2) lt.double log^2 \( 2 + Z \) \, wide
    sum_(U \, B med upright("dyadic")) sqrt(U) \( 1 + U B^3 \/ Z \)^(- 2) lt.double sqrt(Z) . $
  These estimates make the sum of $ell^2 \( k_0 \)$ norms finite.
    The triangle inequality and the geometric sum over $m gt.eq - 4$ therefore give
  $ #scale(x: 180%, y: 180%)[\(] sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| sum_(m gt.eq - 4) c_(iota \, m) \( k_0 \)
    cal(S)_m \[ A_m \, Y \] \( k_0 \) #scale(x: 180%, y: 180%)[\|]^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2)
    lt.double a D^(epsilon_1) #scale(x: 120%, y: 120%)[\(] sqrt(cal(H)_0) log^2 \( 2 + Y \) +
    sqrt(Y) #scale(x: 120%, y: 120%)[\)] . $
  Combine the divisor-bounded choices of $iota$ and use (6.16) to obtain
  $ sum_(N \( k_0 \) lt.eq cal(H)_0)^(*) \| T \( X \; u_0 t k_0 \, g \) \|^2 prec.curly.eq max_iota
    a_iota^2 \( cal(H)_0 + Y_iota \) lt.double cal(H)_0 + frac(cal(H)_0^2 N \( t \)^2 N \( g \), X) lt.eq cal(H) +
    frac(cal(H)^2 N \( g \), X) . $
  Sum the fixed ray classes and the divisor-bounded choices $t divides
    "rad" \( g product_(frak(p) in S) frak(p) \)$, choosing $epsilon_1$ and the other small-power losses in terms
    of $epsilon$. The weight estimates above require a fixed number $J = J \( epsilon \, C_0 \)$ of derivatives.
    Homogeneity restores $parallel W parallel_(C^J \( I \))^2$ and proves (6.14). ◻
]

#proof[
  Write uniquely $k = u_0 s v^2$, with $s$ squarefree and $s \, v$ among the chosen ideal generators.
    No condition $\( s \, v \) = 1$ is imposed. Since $8 equiv 2 med \( mod med 6 \)$, including the zero extensions,
  $ chi_n \( u_0 s v^2 \) chi_n \( f \)^4 = chi_n \( u_0 s \) chi_n \( f v^2 \)^4 \, wide
    T \( X \; u_0 s v^2 \, f \) = T \( X \; u_0 s \, f v^2 \) . $
  Apply Lemma 18 with row bound $cal(H) \/ N \( v \)^2$ and auxiliary twist $g = f v^2$.
    Here $N \( g \) lt.eq cal(H) N \( f \) lt.eq D^(2 C_0)$, so use that lemma with $2 C_0$. Summing its bounds gives
  $ sum_(0 < N \( k \) lt.eq cal(H)) \| T \( X \; k \, f \) \|^2 & =
    sum_(u_0 in cal(O)^times) sum_(N \( v \)^2 lt.eq cal(H)) sum_(N \( s \) lt.eq cal(H) \/ N \( v \)^2\
s med upright("squarefree")) \| T \( X \; u_0 s \, f v^2 \) \|^2\
 & lt.double D^epsilon parallel W parallel_(C^J \( I \))^2 #scale(x: 180%, y: 180%)[\(] cal(H) +
   frac(cal(H)^2 N \( f \), X) #scale(x: 180%, y: 180%)[\)] sum_v frac(1, N \( v \)^2) . $
  The last sum is $zeta_K \( 2 \) < oo$, where $zeta_K \( s \) =
    L_K \( s \, upright(bold(1)) \)$ is the Dedekind zeta function of $K$. This proves (5.5). ◻
]

== 7 Proof of the transfer proposition <sec:transfer-proof>

We prove Proposition 12 for $cal(A) \( W \)$ defined in (5.10).
  Throughout this section, $cal(H) \, L \, F \, Sigma \, xi$ satisfy the hypotheses of that proposition.
  We retain the fixed weight $Phi$ and the support bound $C_Phi$ chosen before (5.10).
  The enlargement by $Sigma \/ \( L F \) gt.eq 1$ in the intermediate mean square makes the second Poisson
  summation return to (4.4) with row range at most $cal(H) L \/ \( Sigma F \)$.
  Lemma 23 separates the weights, and Lemma 7 removes the remaining exclusion.

=== 7.1 First application of Poisson summation <first-application-of-poisson-summation>

Write $N = upright(N)_(K \/ bb(Q))$, $I = \[ u \, v \]$, and $I_(*) = \[ u \/ 2 \, 2 v \]$.
  All ideal indices below are prime to $S$ and represented by their primary generators;
  a star additionally requires squarefreeness. The variables $k \, h \, y$ range over $cal(O)$.
  For squarefree $C \, t$ with $\( C \, t \) = 1$, and for $d divides C$, put

$ ell = frac(L, N \( C \) N \( t \)) \, wide w_(C \, d) = frac(cal(H) N \( C \), N \( d \) L^2 F) \, wide
  Y_(C \, d) = c_I frac(Sigma L F N \( d \), cal(H) N \( C \)^2) \, $

where $c_I gt.eq max \( 1 \, 4 C_Phi v^2 \)$ is fixed. Retain only $ell gt.eq 1 \/ \( 2 v \)$.
  For $U in C_c^oo \( I_(*) \)$ and a character $xi_1$ of the fixed ray class group, define

#[#set math.equation(numbering: n => "(7.1)")
 $ p_y \( n \) & = mu \( n \) xi_1 \( n \) upright(bold(1))_(\( n \, t \) = 1) overline(chi_n \( y \))
   chi_n \( C \)^4 chi_n \( d \) \,\
P_(C \, d \, t) \( y \; U \) & = sum_n^(*) p_y \( n \) U \( N \( n \) \/ ell \) . $ <eq:P>]

The notation $p_y$ suppresses its dependence on $C \, d \, t \, xi_1$.
  The nonnegative form required in the second Poisson calculation is

#[#set math.equation(numbering: n => "(7.2)")
 $ cal(Q)_(xi_1) \( U \) = sum_(C \, t upright(" squarefree")\
\( C t \, S \) = 1 \, \( C \, t \) = 1\
N \( C \) N \( t \) lt.eq 2 v L) sum_(d divides C) w_(C \, d) sum_y Phi \( N \( y \) \/ Y_(C \, d) \) \|
  P_(C \, d \, t) \( y \; U \) \|^2 . $ <eq:first-transfer-forms>]

The outer domain has no additional restriction coming from the support of $hat(Phi)$.
  Here $Y_(C \, d) > 0$ may be smaller than $1$; the outer sums are finite, and the $y$-sum converges absolutely.

#thm([Lemma 7.1.])[
  #emph[Under the hypotheses of Proposition 12, fix an integer $j gt.eq 0$ and $epsilon_0 > 0$.
    If $M gt.eq 0$ satisfies $cal(Q)_(xi_1) \( U \) lt.eq M parallel U parallel_(C^j \( I_(*) \))^2$ for every $U
    in C_c^oo \( I_(*) \)$ and every $xi_1$, then
$ cal(A) \( W \) lt.double D^(epsilon_0) \( Sigma + M \) parallel W parallel_(C^(2 j + 4) \( I \))^2 . $

]
] <lem:first-transfer>

#proof[
  Expand the square defining $cal(A) \( W \)$, and write $n_i = C u_i$,
    where $C = \( n_1 \, n_2 \)$ and $\( u_1 \, u_2 \) = \( u_1 u_2 \, C \) = 1$.
    The row character is $chi_(u_1) overline(chi_(u_2))$, primitive modulo $u_1 u_2$,
    with the extra restriction $\( k \, C \) = 1$. Lemma 5 introduces $d divides C$ and a frequency $h$.
    Let $Z$ denote the zero-frequency contribution. It requires $u_1 = u_2 = 1$, so
  $ \| Z \| lt.double frac(cal(H), L F) sum_(F lt.eq N \( f \) < 2 F)^(*) sum_C^(*) \| W \( N \( C \) \/ L \) \|^2
    lt.double_I cal(H) parallel W parallel_oo^2 . $
  For the other frequencies, the Chinese remainder theorem, (4.2), and (4.2) give the paired identity
  #[#set math.equation(numbering: n => "(7.3)")
   $ a_xi \( u_1 \) overline(a_xi \( u_2 \)) gamma \( chi_(u_1) overline(chi_(u_2)) \) =
     mu \( u_1 \) mu \( u_2 \) \( xi G \) \( u_1 u_2^(- 1) \) . $ <eq:paired-first-gauss>]
  Expand $\( xi G \) \( z \) = sum_(xi_1) ell_(xi_1) xi_1 \( z \)$ on the fixed ray class group.
    Insert $upright(bold(1))_(\( u_1 \, u_2 \) = 1) = sum_(t divides u_1 \, med t divides u_2)
    mu \( t \)$ and put $u_i = t x_i$. The inverse is $x_i = u_i \/ t$; squarefreeness imposes $\( x_i \, t \) =
    1$, but no condition $\( x_1 \, x_2 \) = 1$ remains. The factors at $C \, t$ cancel against their conjugates,
    leaving $mu \( d \) mu \( t \)$ and the restrictions $\( f \, C t \) = \( h \, t \) = 1$. Thus
  $ & cal(A) \( W \) - Z = sum_(xi_1) ell_(xi_1) sum_(C \, t upright(" squarefree")\
\( C t \, S \) = 1 \, \( C \, t \) = 1\
N \( C \) N \( t \) lt.eq 2 v L) sum_(d divides C) mu \( d \) mu \( t \) w_(C \, d)\
 & quad times sum_(F lt.eq N \( f \) < 2 F\
\( f \, C t \) = 1)^(*) sum_(h eq.not 0 \, \( h \, t \) = 1\
N \( h \) lt.eq C_Phi v^2 L^2 N \( d \) \/ \( cal(H) N \( C \)^2 \)) sum_(x_1 \, x_2)^(*) p_(h f^2) \( x_1 \)
  overline(p_(h f^2) \( x_2 \)) cal(K)_h \( N \( x_1 \) \/ ell \, N \( x_2 \) \/ ell \) \, $
  where, for each integer $j_0 gt.eq 0$,
  $ cal(K)_h \( z_1 \, z_2 \) & = \( z_1 z_2 \)^(- 1 \/ 2) W \( z_1 \) overline(W \( z_2 \)) hat(Phi)
    #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(cal(H) N \( h \) N \( C \)^2, L^2 N \( d \) z_1 z_2)
    #scale(x: 180%, y: 180%)[\)] \,\
sup_(C \, d \, h) parallel cal(K)_h parallel_(C^(j_0) \( I^2 \)) & lt.double_(I \, Phi \, j_0) parallel W
  parallel_(C^(j_0) \( I \))^2 . $
  Here $chi_(x_i) \( C \)^4$ supplies $\( x_i \, C \) = 1$;
    the other original zeros are supplied by $p_(h f^2) \( x_i \)$.
    The displayed frequency range follows from the support of $hat(Phi)$.
  For fixed $C \, d \, t$, the map $\( f \, h \) mapsto y = h f^2$ has divisor-bounded multiplicity in $y$.
    Since $Sigma \/ \( L F \) gt.eq 1$, its nonzero image satisfies $N \( y \) lt.eq
    4 C_Phi v^2 L^2 F^2 N \( d \) \/ \( cal(H) N \( C \)^2 \) lt.eq Y_(C \, d)$.
    Since $Phi gt.eq 1$ on $\[ 0 \, 1 \]$ and is nonnegative,
  $ sum_(C \, t) sum_(d divides C) w_(C \, d) sum_(f \, h) \| P_(C \, d \, t) \( h f^2 \; U \) \|^2 prec.curly.eq
    cal(Q)_(xi_1) \( U \) lt.eq M parallel U parallel_(C^j \( I_(*) \))^2 \, $
  with the preceding ranges on the left. Apply Lemma 23 to the full displayed expression for $cal(A) \( W \) - Z$.
    The kernel bound gives
  $ \| cal(A) \( W \) - Z \| lt.double D^(epsilon_0 \/ 2) M parallel W parallel_(C^(2 j + 4) \( I \))^2 . $
  Together with $cal(H) lt.eq Sigma$, this proves the result after allocating the divisor losses within $epsilon_0$. ◻
]

=== 7.2 Second application of Poisson summation <second-application-of-poisson-summation>

Let $C \, t$ be coprime squarefree primary elements prime to $S$, and let $d divides C$.
  Fix a character $xi_1$ of the ray class group. For arbitrary scales $ell \,
  Y > 0$ and $U in C_c^oo \( I_(*) \)$, with $I_(*) = \[ a \, b \] subset \( 0 \, oo \)$, put

#[#set math.equation(numbering: n => "(7.4)")
 $ P \( y \) & = sum_(\( n \, S \) = 1)^(*) mu \( n \) xi_1 \( n \) upright(bold(1))_(\( n \, t \) = 1)
   overline(chi_n \( y \)) chi_n \( C \)^4 chi_n \( d \) U \( N \( n \) \/ ell \) \,\
cal(M) & = sum_(y in cal(O)) Phi \( N \( y \) \/ Y \) \| P \( y \) \|^2 . $ <eq:common-mobius-sum>]

Here $P \( y \)$ abbreviates $P_(C \, d \, t) \( y \; U \)$ from (7.1), with the scale $ell$ now arbitrary.

The second Poisson summation turns the Möbius coefficients back into cubic Gauss-sum coefficients.
  To state the identity, put $U_0 \( x \) = x^(- 1 \/ 2) U \( x \)$ and expand

$ xi_1 \( z \) G \( z^(- 1) \) = sum_(xi') c_(xi') xi' \( z \) $

on the fixed ray class group.

On the transformed side, $g$ is the common divisor of the original columns,
  $e divides g$ comes from the row exclusion, and $w$ removes the remaining coprimality condition.
  The index $h$ is the nonzero Fourier frequency. Let $g \,
  w$ range over squarefree primary elements prime to $S$, $e$ over divisors of $g$,
  and $h$ over $cal(O) \\ { 0 }$, subject to

$ \( g \, C t \) = \( w \, g C t h \) = 1 \, wide N \( g w \) lt.eq b ell \, wide N \( h \) lt.eq
  frac(C_Phi b^2 ell^2 N \( e \), Y N \( g \)^2) . $

These conditions ensure that $t g \/ e$ and $C e w$ are coprime and squarefree.
  For each such choice and each character $xi'$, the new column scale, coefficient, and coupled smooth weight are

#[#set math.equation(numbering: n => "(7.5)")
 $ X' = frac(ell, N \( g w \)) \,\
a^sharp \( n \) = a_(xi') \( n \) upright(bold(1))_(\( n \, t g \/ e \) = 1) chi_n \( d e h \) chi_n \( C e w \)^4 \,\
cal(K) \( x_1 \, x_2 \) = U_0 \( x_1 \) overline(U_0 \( x_2 \)) hat(Phi) #h(-0.16667em)
  #scale(x: 180%, y: 180%)[\(] frac(Y N \( h \) N \( g \)^2, N \( e \) ell^2 x_1 x_2)
  #scale(x: 180%, y: 180%)[\)] . $ <eq:common-poisson-output>]

Here $cal(K)$ depends on $U \, Y \, ell \, g \, e \, h$. A star on a sum over $n_1 \,
  n_2$ restricts each index separately to squarefree primary elements. Define also

$ Z = Y hat(Phi) \( 0 \) sum_(\( g \, C t \) = 1\
\( g \, S \) = 1)^(*) \| U \( N \( g \) \/ ell \) \|^2 product_(p divides g) #scale(x: 180%, y: 180%)[\(] 1 -
  frac(1, N \( p \)) #scale(x: 180%, y: 180%)[\)] . $

#thm([Lemma 7.2.])[
  (Second Poisson identity).  #emph[With the notation and index ranges above,
#[#set math.equation(numbering: n => "(7.6)")
 $ cal(M) = Z + sum_(g \, e \, w \, h \, xi') frac(Y mu \( e \) mu \( w \) c_(xi') N \( g \), N \( e \) ell)
   sum_(\( n_1 n_2 \, S \) = 1)^(*) a^sharp \( n_1 \) overline(a^sharp \( n_2 \)) cal(K) #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(] frac(N \( n_1 \), X') \, frac(N \( n_2 \), X') #scale(x: 180%, y: 180%)[\)] .
   $ <eq:arithmetic-poisson-identity>]

 The zero-frequency term satisfies
$ \| Z \| lt.double_(I_(*) \, Phi) Y ell parallel U parallel_oo^2 . $

]
] <lem:arithmetic-poisson>

#proof[
  Expand the square, put $g = \( n_1 \, n_2 \)$ and $n_i = g z_i$. The nonzero terms satisfy
  $ \( z_1 \, z_2 \) = \( z_1 z_2 \, g C t \) = \( g \, C t \) = 1 \, wide
    overline(chi_(n_1) \( y \)) chi_(n_2) \( y \) = upright(bold(1))_(\( y \, g \) = 1)
    overline(chi_(z_1) \( y \)) chi_(z_2) \( y \) . $
  Apply Lemma 5 to this last character, with exclusion $g$ and divisor $e divides g$.
    Its zero frequency occurs exactly when $z_1 = z_2 = 1$ and gives the displayed $Z$;
    counting $g$ gives its bound. For the nonzero frequencies, (4.2)–(4.2) and the Chinese remainder theorem give
  $ mu \( z_1 \) mu \( z_2 \) xi_1 \( z_1 \) overline(xi_1 \( z_2 \)) gamma \( overline(chi_(z_1)) chi_(z_2) \) =
    sum_(xi') c_(xi') a_(xi') \( z_1 \) overline(a_(xi') \( z_2 \)) . $
  Use also
  $ chi_z \( d h \) overline(chi_z \( e \)) chi_z \( C \)^4 & = chi_z \( d e h \) chi_z \( C e \)^4 \,\
frac(U \( N \( g z_1 \) \/ ell \) overline(U \( N \( g z_2 \) \/ ell \)), sqrt(N \( z_1 \) N \( z_2 \))) & =
  frac(N \( g \), ell) U_0 \( N \( g z_1 \) \/ ell \) overline(U_0 \( N \( g z_2 \) \/ ell \)) . $
  Thus the full nonzero contribution is
  $ cal(M) - Z =  & sum_(xi') c_(xi') sum_(g\
\( g \, C t \) = 1)^(*) sum_(e divides g) frac(Y mu \( e \) N \( g \), N \( e \) ell) sum_(h eq.not 0)\
 & quad times sum_(z_1 \, z_2\
\( z_1 \, z_2 \) = 1\
\( z_1 z_2 \, g C t \) = 1)^(*) a_(xi') \( z_1 \) overline(a_(xi') \( z_2 \)) chi_(z_1) \( d e h \)
  overline(chi_(z_2) \( d e h \)) chi_(z_1) \( C e \)^4 overline(chi_(z_2) \( C e \)^4)\
 & quad times U_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( g z_1 \), ell)
   #scale(x: 180%, y: 180%)[\)] overline(U_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( g z_2 \), ell)
   #scale(x: 180%, y: 180%)[\)]) hat(Phi) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(Y N \( h \), N \( e \) N \( z_1 \) N \( z_2 \)) #scale(x: 180%, y: 180%)[\)] . $
  All starred ideal indices are prime to $S$. Insert
  $ upright(bold(1))_(\( z_1 \, z_2 \) = 1) = sum_(w divides z_1 \, med w divides z_2) mu \( w \) \, wide z_i =
    w n_i . $
  Here $\( w \, g C t \) = 1$. Equation (4.2) and the zero-extended characters give
  $ a_(xi') \( w n \) = a_(xi') \( w \) a_(xi') \( n \) chi_n \( w \)^4 quad \( \( w \, n \) = 1 \) \,\
\| a_(xi') \( w \) chi_w \( d e h \) chi_w \( C e \)^4 \|^2 = upright(bold(1))_(\( w \, h \) = 1) \,\
upright(bold(1))_(\( n \, g C t w \) = 1) chi_n \( d e h \) chi_n \( C e w \)^4 =
  upright(bold(1))_(\( n \, t g \/ e \) = 1) chi_n \( d e h \) chi_n \( C e w \)^4 . $
  Consequently the preceding full sum becomes
  $ & cal(M) - Z = sum_(xi') c_(xi') sum_(g \, w\
\( g \, C t \) = \( w \, g C t \) = 1)^(*) sum_(e divides g)
  frac(Y mu \( e \) mu \( w \) N \( g \), N \( e \) ell) sum_(h eq.not 0\
\( h \, w \) = 1)\
 & quad times sum_(\( n_1 n_2 \, S \) = 1)^(*) a^sharp \( n_1 \) overline(a^sharp \( n_2 \)) U_0 #h(-0.16667em)
   #scale(x: 180%, y: 180%)[\(] frac(N \( g w n_1 \), ell) #scale(x: 180%, y: 180%)[\)]
   overline(U_0 #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( g w n_2 \), ell)
   #scale(x: 180%, y: 180%)[\)]) hat(Phi) #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
   frac(Y N \( h \), N \( e \) N \( w \)^2 N \( n_1 \) N \( n_2 \)) #scale(x: 180%, y: 180%)[\)] . $
  There is no remaining condition $\( n_1 \, n_2 \) = 1$. The column support gives $N \( g w \) lt.eq
    b ell$ and $N \( z_1 z_2 \) lt.eq b^2 ell^2 \/ N \( g \)^2$;
    the support of $hat(Phi)$ therefore imposes the stated bound on $N \( h \)$.
    Substituting (7.5) gives (7.6), with only finitely many terms. ◻
]

#thm([Lemma 7.3.])[
  #emph[Return to $I = \[ u \, v \]$ and $I_(*) = \[ u \/ 2 \, 2 v \]$.
    For an integer $m gt.eq 0$, let $S_m$ be the supremum in (5.11). Then, for every $epsilon_0 > 0$,
$ cal(Q)_(xi_1) \( U \) lt.double D^(epsilon_0) Sigma \( 1 + S_m \) parallel U
  parallel_(C^(2 m + 4) \( I_(*) \))^2 wide \( U in C_c^oo \( I_(*) \) \) . $

 The test functions in $S_m$ are supported in $I' = \[ u \/ 16 \, 4 v \]$ and have $C^m \( I' \)$ norm at most
   one; an empty supremum is zero.]
] <lem:second-transfer>

#proof[
  Write $N = upright(N)_(K \/ bb(Q))$. Apply Lemma 20 with input length $ell$, row scale $Y_(C \, d)$,
    and the same $C \, d \, t$, using the character $xi_1$. Here $h$ is the new Fourier variable for the sum over
    $y$. Its nonzero output has squarefree $g \, w$, $e divides g$, and
  $ \( g \, C t \) = \( w \, g C t h \) = 1 \, wide r = t g \/ e \, quad f' = C e w \, quad k' = d e h . $
  Thus $r \, f'$ are coprime and squarefree, and the coefficient $a^sharp$ from (7.5) becomes
  $ a^sharp \( n \) = a_(xi') \( n \) upright(bold(1))_(\( n \, r \) = 1) chi_n \( k' \) chi_n \( f' \)^4 . $
  Write $X'_0$ for the individual column scale $X'$ in (7.5); below, $X'$ will denote a common dyadic scale.
    The length, coefficient, and Fourier parameter simplify to
  $ X'_0 & = frac(ell, N \( g \) N \( w \)) = frac(L, N \( r \) N \( f' \)) \,\
w_(C \, d) frac(Y_(C \, d) N \( g \), N \( e \) ell) & = frac(c_I Sigma N \( r \), L^2) \,\
frac(Y_(C \, d) N \( h \) N \( g \)^2, N \( e \) ell^2) & = frac(c_I Sigma F N \( k' \) N \( r \)^2, cal(H) L) . $
  Put $U_0 \( x \) = x^(- 1 \/ 2) U \( x \)$. The coupled kernel is therefore
  $ cal(K)_(r \, f' \, k') \( x_1 \, x_2 \) = U_0 \( x_1 \) overline(U_0 \( x_2 \)) hat(Phi) #h(-0.16667em)
    #scale(x: 180%, y: 180%)[\(] frac(c_I Sigma F N \( k' \) N \( r \)^2, cal(H) L x_1 x_2)
    #scale(x: 180%, y: 180%)[\)] \, $
  with both columns evaluated at $x_j = N \( n_j \) \/ X'_0$. In particular its nonzero support requires
  $ N \( r \) N \( f' \) lt.eq 2 v L \, wide 0 < N \( k' \) lt.eq
    frac(4 C_Phi v^2, c_I) frac(cal(H) L, Sigma F N \( r \)^2) lt.eq frac(cal(H) L, Sigma F N \( r \)^2) \, $
  since $C_Phi \( 2 v \)^2 \/ c_I lt.eq 1$.
  For fixed $r \, f' \, k'$, all preimages are obtained by choosing
  $ t divides r \, wide f' = C e w \, wide e divides k' \, wide \( w \, k' \) = 1 \, wide d divides \( C \, k' \) \, $
  and setting $g = e \( r \/ t \)$, $h = k' \/ \( d e \)$. The factorization $f' =
    C e w$ is disjoint and squarefree. All these preimages have the same kernel:
    $C t g w = r f'$, and the Fourier parameter displayed above depends only on $r \, k'$.
    Thus the support restrictions discard only zero kernels. The choices $t divides
    r$ contribute $tau_(upright("div")) \( r \)$. At a prime $p divides f'$, the choices $p divides C$,
    $p divides e$, and $p divides w$, respectively, contribute
  $ #scale(x: 120%, y: 120%)[\(] 1 + upright(bold(1))_(p divides k') #scale(x: 120%, y: 120%)[\)] -
    upright(bold(1))_(p divides k') - upright(bold(1))_(p divides.not k') = upright(bold(1))_(p divides k') $
  to the sum of $mu \( e \) mu \( w \)$ over the preimages;
    the two choices inside the first term are $p divides.not d$ and $p divides d$.
    Let $cal(Z)$ be the total zero-frequency contribution: the sum of the terms $Z$ from Lemma 20,
    with the outer weights $w_(C \, d)$ and ranges in (7.2). Consequently,
    regrouping before taking absolute values gives
  $ cal(Q)_(xi_1) \( U \) - cal(Z) =  & frac(c_I Sigma, L^2) sum_(xi') c_(xi') sum_(r \, f' med upright("squarefree")\
\( r \, f' \) = 1) N \( r \) tau_(upright("div")) \( r \) sum_(k' eq.not 0\
f' divides k')\
 & quad times sum_(n_1 \, n_2)^(*) a^sharp \( n_1 \) overline(a^sharp \( n_2 \)) cal(K)_(r \, f' \, k')
   #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] frac(N \( n_1 \), X'_0) \,
   frac(N \( n_2 \), X'_0) #scale(x: 180%, y: 180%)[\)] . $
  Fix $R lt.eq N \( r \) < 2 R$, $F' lt.eq N \( f' \) < 2 F'$ dyadically, and put
  $ X' = frac(L, R F') \, wide Sigma' = X' F' = L / R \, wide cal(H)' = frac(cal(H) L, Sigma F R^2) . $
  Retain only those $r$ for which a nonzero term occurs in these ranges. Since $f' divides k'$, each such $r$ satisfies
  $ F' lt.eq N \( f' \) lt.eq N \( k' \) lt.eq frac(cal(H) L, Sigma F N \( r \)^2) . $
  In particular $cal(H)' gt.eq 1$. For every $j divides r$, using $cal(H) lt.eq Sigma$, we also have
  #[#set math.equation(numbering: n => "(7.7)")
   $ frac(X', N \( j \)) gt.eq frac(Sigma F N \( r \)^2, cal(H) R N \( j \)) gt.eq frac(F Sigma, cal(H)) gt.eq
     1 . $ <eq:child-column-lower-bound>]
  Moreover $1 lt.eq X' \/ X'_0 < 4$. The rescaled kernels
  $ cal(K)_(r \, f' \, k') \( x_1 \, x_2 \) = cal(K)_(r \, f' \, k') #h(-0.16667em) #scale(x: 180%, y: 180%)[\(]
    X' / X'_0 x_1 \, X' / X'_0 x_2 #scale(x: 180%, y: 180%)[\)] $
  have support in $\[ u \/ 8 \, 2 v \]^2 subset "int" \( I' ""^2 \)$ and satisfy
  $ sup_(r \, f' \, k') parallel cal(K)_(r \, f' \, k') parallel_(C^(2 m + 4) \( I' ""^2 \))
    lt.double_(I_(*) \, m \, Phi) parallel U parallel_(C^(2 m + 4) \( I_(*) \))^2 \, $
  where the supremum is over the retained indices in the dyadic block.
    This follows from the Schwartz bounds for $hat(Phi)$. The common parameters satisfy exactly
  $ cal(H)' / Sigma' = frac(cal(H), Sigma F R) lt.eq cal(H) / Sigma \, wide Sigma' lt.eq L \, wide cal(H)' lt.eq
    frac(cal(H) L, Sigma F) . $
  Fix $delta > 0$, to be chosen in terms of $epsilon_0$ at the end.
    For each retained $r$, enlarge the $f' \, k'$ ranges by positivity, keeping this set of $r$ fixed.
    Lemma 7 then gives, for $V in C_c^oo \( I' \)$,
  $ sum_(F' lt.eq N \( f' \) < 2 F')^(*) sum_(0 < N \( k' \) lt.eq cal(H)') \| sum_n^(*) a^sharp \( n \)
    V \( N \( n \) \/ X' \) #scale(x: 180%, y: 180%)[\|]^2 & =
    Sigma' cal(E)_(\( r \)) \( cal(H)' \, X' \, F' \; xi' \, V \)\
 & lt.double_delta D^delta \( Sigma' \)^2 S_m parallel V parallel_(C^m \( I' \))^2 . $
  Indeed exclusion removal replaces $\( X' \, F' \)$ by $\( X' \/ N \( j \) \, F' N \( j \) \)$, $j divides r$,
    preserving $cal(H)'$ and $Sigma'$. Equation (7.7) gives $X' \/ N \( j \) gt.eq 1$, and $F' N \( j \) gt.eq
    1$ as well. Thus every resulting mean square lies in the defining supremum.
  There are $O \( R \)$ ideals $r$ in the dyadic range. Apply Lemma 23 with row index $\( r \, f' \, k' \)$,
    the preceding mean-square bound, and the uniform kernel bound.
    The absolute contribution of this dyadic block is at most
  $ D^(2 delta) frac(Sigma R, L^2) thin R \( Sigma' \)^2 S_m parallel U parallel_(C^(2 m + 4) \( I_(*) \))^2 =
    D^(2 delta) Sigma S_m parallel U parallel_(C^(2 m + 4) \( I_(*) \))^2 \, $
  because $\( Sigma R \/ L^2 \) R \( L \/ R \)^2 = Sigma$.
  Finally, the zero-frequency bound in Lemma 20 gives
  $ \| cal(Z) \| & lt.double_(I_(*) \, Phi) parallel U parallel_oo^2 sum_(N \( C t \) lt.eq 2 v L)
    sum_(d divides C) w_(C \, d) Y_(C \, d) ell\
 & lt.double_(I_(*)) Sigma parallel U parallel_oo^2 sum_C frac(tau_(upright("div")) \( C \), N \( C \)^2)
   sum_(N \( t \) lt.eq 2 v L) frac(1, N \( t \)) lt.double_(I_(*) \, delta) D^delta Sigma parallel U parallel_oo^2 . $
  This uses only $Y_(C \, d) > 0$, not $Y_(C \, d) gt.eq 1$.
    Sum the $O_(I_(*) \, C_0) \( \( log \( 2 D \) \)^2 \)$ dyadic blocks and the fixed finite character set,
    and take $delta = epsilon_0 \/ 4$. The stated bound follows, with implied constant depending only on $I_(*) \,
    m \, C_0 \, epsilon_0$, the fixed cutoffs and arithmetic data. ◻
]

#proof[
  Use $S_m$ as in Lemma 21, with $m$ as in the proposition.
    Lemma 21, with loss $D^(epsilon \/ 4)$, supplies the hypothesis of Lemma 19 with $j = 2 m +
    4$ and $M lt.double D^(epsilon \/ 4) Sigma \( 1 + S_m \)$. Applying that lemma with the same loss gives
  $ cal(A) \( W \) lt.double D^(epsilon \/ 2) Sigma \( 1 + S_m \) parallel W parallel_(C^(4 m + 12) \( I \))^2 \, $
  which proves (5.11). ◻
]

== 8 Arithmetic identities and theta calculations <sec:arithmetic>

=== 8.1 Reciprocity and Gauss sums <app:gauss-identities>

#proof[
  #emph[Proof of (4.1).] For squarefree $n$, set $G \( n \) = overline(chi_n \( 4 \)) gamma_3 \( n \)$.
    Its dependence on a fixed ray class will be verified below.
    Fix a primary prime $p equiv 1 med \( mod med 3 \)$ outside $S$.
    For multiplicative characters $A \, B$ of $\( cal(O) \/ \( p \) \)^times$, extended by zero at $0$, write
  $ J \( A \, B \) = sum_(x med mod med p) A \( x \) B \( 1 - x \) . $
  For each $y in cal(O) \/ \( p \)$, the substitution $u = 2 x - 1$ gives
  $ \# { x med mod med p : 4 x \( 1 - x \) = y } = \# { u med mod med p : u^2 = 1 - y } = 1 + chi_p^3 \( 1 - y \) \, $
  since $p divides.not 2$ and $chi_p^3$ is the quadratic character, extended by zero at $0$. Hence
  $ chi_p \( 4 \) J \( chi_p \, chi_p \) = sum_(x med mod med p) chi_p #scale(x: 120%, y: 120%)[\(] 4
    x \( 1 - x \) #scale(x: 120%, y: 120%)[\)] = sum_(y med mod med p) chi_p \( y \) #scale(x: 120%, y: 120%)[\(]
    1 + chi_p^3 \( 1 - y \) #scale(x: 120%, y: 120%)[\)] = J \( chi_p \, chi_p^3 \) . $
  The Gauss–Jacobi identity (cf. [22] (3.18)) gives
  $ frac(gamma_1 \( p \) gamma_3 \( p \), gamma_4 \( p \)) =
    frac(J \( chi_p \, chi_p^3 \), sqrt(upright(N)_(K \/ bb(Q)) \( p \))) =
    chi_p \( 4 \) frac(J \( chi_p \, chi_p \), sqrt(upright(N)_(K \/ bb(Q)) \( p \))) =
    chi_p \( 4 \) frac(gamma_1 \( p \)^2, gamma_2 \( p \)) . $
  For $j equiv.not 0 med \( mod med 6 \)$, the normalized Gauss sums satisfy
  $ gamma_j \( p \) gamma_(- j) \( p \) = chi_p \( - 1 \)^j . $
  Taking $j = 2$ gives $gamma_2 \( p \) gamma_4 \( p \) = chi_p^2 \( - 1 \) = 1$, since $chi_p^2$ is cubic.
    Combining this with the Gauss–Jacobi relation above gives, after cancelling $gamma_1 \( p \)$ and rearranging,
  $ gamma_1 \( p \) gamma_2 \( p \) = overline(chi_p \( 4 \)) gamma_3 \( p \) gamma_2 \( p \)^3 . $
  To finish the prime case of (4.1), it remains to evaluate $gamma_2 \( p \)^3$.
    We do so by computing $J \( chi_p^2 \, chi_p^2 \)$. Put $q = upright(N)_(K \/ bb(Q)) \( p \)$.
    We have $J \( chi_p^2 \, chi_p^2 \) in cal(O)$ and $upright(N)_(K \/ bb(Q)) #scale(x: 120%, y: 120%)[\(]
    J \( chi_p^2 \, chi_p^2 \) #scale(x: 120%, y: 120%)[\)] = q$.
    For $0 lt.eq ell lt.eq \( q - 1 \) \/ 3$, the exponent $\( q - 1 \) \/ 3 +
    ell$ lies strictly between $0$ and $q - 1$, so $sum_(x med mod med p) x^(\( q - 1 \) \/ 3 + ell) =
    0$ in $cal(O) \/ \( p \)$. Reducing modulo $p$ and expanding the binomial therefore gives
  $ J \( chi_p^2 \, chi_p^2 \) & equiv sum_(x med mod med p) x^(\( q - 1 \) \/ 3) \( 1 - x \)^(\( q - 1 \) \/ 3)\
 & = sum_(ell = 0)^(\( q - 1 \) \/ 3) \( - 1 \)^ell binom(\( q - 1 \) \/ 3, ell) sum_(x med mod med p)
   x^(\( q - 1 \) \/ 3 + ell) = 0 med \( mod med p \) . $
  Thus $J \( chi_p^2 \, chi_p^2 \) \/ p in cal(O)$ has norm one,
    so $J \( chi_p^2 \, chi_p^2 \)$ is a unit multiple of $p$.
    To determine the unit, write $chi_p^2 \( x \( 1 - x \) \) = omega^(j_x)$ with $j_x in { 0 \, 1 \,
    2 }$ for $x in cal(O) \/ \( p \) \\ { 0 \, 1 }$. Then
  $ product_(x eq.not 0 \, 1) x \( 1 - x \) = 1 quad arrow.r.double quad sum_(x eq.not 0 \, 1) j_x equiv
    0 med \( mod med 3 \) . $
  Since $\( omega - 1 \)^2$ generates $\( 3 \)$, expansion modulo this ideal gives
  $ J \( chi_p^2 \, chi_p^2 \) = sum_(x eq.not 0 \, 1) omega^(j_x) equiv \( q - 2 \) + \( omega - 1 \)
    sum_(x eq.not 0 \, 1) j_x equiv - 1 med \( mod med 3 \) . $
  Together with $p equiv 1 med \( mod med 3 \)$, this fixes the unit:
  $ J \( chi_p^2 \, chi_p^2 \) = - p . $
  Consequently
  $ gamma_2 \( p \)^3 = frac(gamma_2 \( p \)^2, gamma_4 \( p \)) =
    frac(J \( chi_p^2 \, chi_p^2 \), sqrt(upright(N)_(K \/ bb(Q)) \( p \))) = - alpha \( p \) . $
  The Chinese remainder theorem extends these prime-modulus identities to (4.1) for squarefree $n$,
    with one minus sign for each prime factor accounting for $mu \( n \)$.
  #emph[Proof of (4.2).] For coprime squarefree primary $a \, b$ prime to $S$, the Chinese remainder theorem gives
  $ gamma_2 \( a b \) = gamma_2 \( a \) gamma_2 \( b \) chi_a \( b \)^2 chi_b \( a \)^2 \, $
  and cubic reciprocity gives $chi_a \( b \)^2 = chi_b \( a \)^2$.
    Multiplying by $overline(alpha \( a b \)) xi \( a b \)$ therefore proves (4.2).
  #emph[Proof of (4.1).] We now prove (4.1) and the formula for $G \( n \)$ in (4.1),
    including their dependence on a fixed ray class. We begin by evaluating the normalized quadratic Gauss sum.
    For $c in cal(O)$ coprime to $2$, we will show that
  #[#set math.equation(numbering: n => "(8.1)")
   $ Gamma_(upright("quad")) \( c \) := \| c \|^(- 1) sum_(x med mod med c) e \( x^2 \/ c \) = 1 /
     2 sum_(y med mod med 2 cal(O)) e \( - c y^2 \/ 4 \) . $ <eq:quadratic-gaussian>]
  To justify (8.1), apply Poisson summation over $z in cal(O)$ to $e \( z^2 \/ c \) e^(- pi eta \| z \|^2)$,
    with $eta > 0$. The Gaussian makes the sum convergent. The Fourier transform of the product is
  $ frac(\| c \|, 2 sqrt(r_eta)) e^(- pi eta upright(N)_(K \/ bb(Q)) \( c \) \| y \|^2 \/ \( 4 r_eta \))
    e \( - c y^2 \/ \( 4 r_eta \) \) \, wide r_eta = 1 + 3 upright(N)_(K \/ bb(Q)) \( c \) eta^2 \/ 16 . $
  Divide both sides by the Gaussian mass
  $ sum_(z in cal(O)) e^(- pi eta \| z \|^2) asymp eta^(- 1) . $
  On the Fourier side, replacing $r_eta$ by $1$ has total error
  $ O_c #h(-0.16667em) #scale(x: 240%, y: 240%)[\(] eta^2 sum_(y in cal(O)) \| y \|^2 e^(- C_c eta \| y \|^2)
    #scale(x: 240%, y: 240%)[\)] = O_c \( 1 \) \, $
  where $C_c > 0$ is fixed. The normalized error is therefore $O_c \( eta \) arrow.r 0$.
    Grouping the original sum modulo $c$ and the Fourier sum modulo $2 cal(O)$, then letting $eta arrow.b 0$,
    gives (8.1).
  For $c = a + b omega$, formula (8.1) becomes
  $ Gamma_(upright("quad")) \( a + b omega \) = frac(1 + upright(i)^(- b) + upright(i)^a + upright(i)^(b - a), 2) . $
  Thus $Gamma_(upright("quad")) \( c \)$ depends only on $c med mod med
    4 cal(O)$ and is invariant under multiplication by a square in $\( cal(O) \/ 4 cal(O) \)^times$.
    Representatives for the four square classes and their values are
  $ c & 1 & - 1 & lambda & - lambda\
Gamma_(upright("quad")) \( c \) & 1 & 1 & upright(i) & - upright(i) . $
  Consequently the function
  $ cal(R) \( c_1 \, c_2 \) :=
    frac(Gamma_(upright("quad")) \( c_1 c_2 \), Gamma_(upright("quad")) \( c_1 \) Gamma_(upright("quad")) \( c_2 \)) $
  on these square classes satisfies
  $ cal(R) \( \( - 1 \)^e lambda^f \, \( - 1 \)^g lambda^h \) = \( - 1 \)^(e h + f g + f h) \, wide e \, f \, g \,
    h in { 0 \, 1 } \, $
  and is a symmetric bicharacter. For a prime $p$, each $y in cal(O) \/ \( p \)$ has $1 +
    chi_p^3 \( y \)$ square roots. Grouping by $y = x^2$ gives
  $ Gamma_(upright("quad")) \( p \) = frac(1, \| p \|) sum_(y med mod med p) #scale(x: 120%, y: 120%)[\(] 1 +
    chi_p^3 \( y \) #scale(x: 120%, y: 120%)[\)] e \( y \/ p \) = gamma_3 \( p \) \, $
  since $sum_(y med mod med p) e \( y \/ p \) = 0$. The Chinese remainder theorem extends this equality to
    squarefree $n$. Together with cubic reciprocity, it identifies the above $cal(R)$ with the quotient
    $chi_b \( a \) \/ chi_a \( b \)$ for coprime primary $a \, b$.
    Furthermore $chi_c \( 4 \) = \( - 2 \/ c \)_3 = \( c \/ \( - 2 \) \)_3$ is a character modulo $2$.
    Consequently $G \( c \) = overline(chi_c \( 4 \)) Gamma_(upright("quad")) \( c \)$ factors through a fixed ray
    class group and satisfies (4.1), with $cal(R) \( c \, c \) = chi_c \( - 1 \)$.
  #emph[Proof of (4.2).] In the fixed ray class group, the multiplicative relation for $G$ gives
  $ G \( a^(- 1) \) = chi_a \( - 1 \) overline(G \( a \)) . $
  Using the symmetry and multiplicativity of $cal(R)$, we obtain
  $ G \( b a^(- 1) \) = G \( b \) G \( a^(- 1) \) cal(R) \( b \, a^(- 1) \) =
    chi_a \( - 1 \) overline(G \( a \)) G \( b \) cal(R) \( a \, b \) \, $
  which is (4.2).
  #emph[Proof of (4.2)–(4.2).] The second identity in (4.1) follows from the inverse-character Gauss identity:
    $gamma_1 \( n \) gamma_(- 1) \( n \) = chi_n \( - 1 \)$. It remains to prove (4.2)–(4.2).
    Multiplying the second identity in (4.1) by $overline(alpha \( n \))$ gives (4.2),
    and combining it with this inverse-character identity gives (4.2). ◻
]

=== 8.2 The cubic theta transformation with fixed ray class twists <app:fixed-ray>

We prove the transformation formula of Proposition 14 for the completed sum $T \( X \; Psi \)$ in (5.3),
  together with the uniformity assertion of Lemma 15 and the coefficient and weight bounds of Lemma 16.
  The proof adapts the theta-transformation method of Dunn and Radziwiłł [7] §5 and Appendix A,
  which extends Patterson [38] and Yoshimoto [51]. The treatment of the fixed ray class twists and the uniformity
  assertions are supplied below. We use the setup preceding the proposition and the dependence of constants
  specified in these three statements: $Psi_0 \, S$ are fixed,
  while $cal(P)$ is the varying finite set of primes outside $S$ and $j_p$ are the exponents of their character
  factors in $Psi$. Character powers follow the zero-extension convention preceding (6.5); in particular,
  $chi_p^0 \( x \) = upright(bold(1))_(p divides.not x)$. This convention also applies when we write $chi_p \( x \)^j$.

Write $w = \( z \, v \) in bb(C) times bb(R)_(> 0)$, and use $theta$ from (6.1).
  The three sequences $d_sigma$, $sigma in { 0 \, + \, - }$,
  are defined by the Fourier expansions of $overline(theta \( gamma_sigma w \))$ in (6.8),
  with the representatives (6.7). For the additive characters, write $breve(e) \( z \) =
  exp \( 2 pi upright(i) \( z + macron(z) \) \)$; thus $e \( z \) = breve(e) \( z \/ lambda \)$, with $e$ as in (2.6).

#proof[
  #emph[Finite Fourier expansion.] Define $phi.alt : cal(O) arrow.r bb(C)$ by
  $ phi.alt \( n \) =
    cases(delim: "{", chi_n \( lambda \)^2 Psi_0 \( n \) \, & n equiv 1 med \( mod med 3 \) \, quad \( n \, S \) =
    1 \,, 0 \, & upright("otherwise") .) $
  For $Psi \( n \) = Psi_0 \( n \) product_(p in cal(P)) chi_p^(j_p) \( n \)$, define
  #[#set math.equation(numbering: n => "(8.2)")
   $ Theta_Psi \( z \, v \) = sum_(ell in lambda^(- 3) cal(O)\
ell eq.not 0) overline(tau \( - ell \)) phi.alt \( lambda^3 ell \) #scale(x: 180%, y: 180%)[\(]
  product_(p in cal(P)) chi_p^(j_p) \( lambda^3 ell \) #scale(x: 180%, y: 180%)[\)] v
  K_(1 \/ 3) \( 4 pi \| ell \| v \) breve(e) \( ell z \) . $ <eq:general-twisted-theta-definition>]
  When $Psi = Psi_k$, the multiplier of $overline(tau \( - ell \))$ is $phi.alt_k \( lambda^3 ell \)$,
    so this definition recovers $Theta_k$ in (6.2). We first write $Theta_Psi$ as a finite sum of translates of
    $overline(theta)$ and determine their reduced denominators.
    Choose once and for all a nonzero $L in cal(O)$, with prime divisors in $S$,
    divisible by the conductor of $Psi_0$, every prime in $S$,
    and sufficiently high powers of the primes above $2$ and $3$.
    The supplementary law of cubic reciprocity for $lambda$ [7] (1.5),
    which evaluates $chi_n \( lambda \)^2 = \( lambda \/ n \)_3$, makes $phi.alt$ periodic modulo $L$.
    As before (6.4), define
  $ hat(phi.alt) \( h_0 \) = frac(1, upright(N)_(K \/ bb(Q)) \( L \)) sum_(x med mod med L) phi.alt \( x \)
    e \( - h_0 x \/ L \) \, wide h_0 in cal(O) \/ \( L \) . $
  Since $\| phi.alt \| lt.eq 1$, we have $\| hat(phi.alt) \( h_0 \) \| lt.eq 1$.
  For $p in cal(P)$ and $0 lt.eq j lt.eq 5$, we expand $chi_p^j$ on $cal(O) \/ \( p \)$ in additive characters.
    Its Fourier coefficients are defined, for $h_p in cal(O) \/ \( p \)$, by
  #[#set math.equation(numbering: n => "(8.3)")
   $ C_(p \, j) \( h_p \) & := frac(1, upright(N)_(K \/ bb(Q)) \( p \)) sum_(y med mod med p) chi_p^j \( y \)
     e \( - h_p y \/ p \) .\
\
upright("Finite Fourier inversion then gives, for ") x in cal(O) upright(",")\
chi_p^j \( x \) & = sum_(h_p in cal(O) \/ \( p \)) C_(p \, j) \( h_p \) e \( h_p x \/ p \) . $ <eq:theta-local-fourier>]
  Multiplying (8.3) over the primes in $cal(P)$ gives, for $x in cal(O)$,
  $ product_(p in cal(P)) chi_p^(j_p) \( x \) = sum_(h_p in cal(O) \/ \( p \)\
p in cal(P)) #scale(x: 180%, y: 180%)[\(] product_(p in cal(P)) C_(p \, j_p) \( h_p \)
  #scale(x: 180%, y: 180%)[\)] e #h(-0.16667em) #scale(x: 180%, y: 180%)[\(] x sum_(p in cal(P)) h_p /
  p #scale(x: 180%, y: 180%)[\)] . $
  Each summand is indexed by a tuple $\( h_p \)_(p in cal(P))$.
    At $x = lambda^3 ell$, its additive character gives the shift $lambda^2 sum_(p in cal(P)) h_p \/
    p$ of $overline(theta)$. Writing $bold(h) = \( h_0 \, \( h_p \)_(p in cal(P)) \)$ with $h_0 in
    cal(O) \/ \( L \)$, we claim that
  $ Theta_Psi \( z \, v \) = sum_(bold(h)) c_(upright(F)) \( bold(h) \) overline(theta \( z + z_(bold(h)) \, v \)) \, $
  where
  #[#set math.equation(numbering: n => "(8.4)")
   $ z_(bold(h)) = lambda^2 #scale(x: 180%, y: 180%)[\(] h_0 \/ L +
     sum_(p in cal(P)) h_p \/ p #scale(x: 180%, y: 180%)[\)] \, wide c_(upright(F)) \( bold(h) \) =
     hat(phi.alt) \( h_0 \) product_(p in cal(P)) C_(p \, j_p) \( h_p \) . $ <eq:theta-factorized-shifts>]
  To verify this identity, expand the fixed factor $phi.alt$ as well.
    The finite Fourier expansions identify all nonzero Fourier coefficients,
    and the constant terms of the translates cancel because
  $ sum_(bold(h)) c_(upright(F)) \( bold(h) \) = phi.alt \( 0 \) product_(p in cal(P)) chi_p^(j_p) \( 0 \) = 0 . $
  For $j equiv.not 0 med \( mod med 6 \)$, we use $gamma_j \( p \)$ from (2.6). Changing $y$ to $- y$ gives
  $ 1 / sqrt(upright(N)_(K \/ bb(Q)) \( p \)) sum_(y med mod med p) chi_p \( y \)^j e \( - y \/ p \) =
    chi_p \( - 1 \)^j gamma_j \( p \) \, wide \| gamma_j \( p \) \| = 1 . $
  For $h_p eq.not 0$, substitute $y = h_p^(- 1) u$ in the definition of $C_(p \, j) \( h_p \)$.
    For $h_p = 0$ and $j eq.not 0$, use character orthogonality; for $j = 0$,
    sum the additive character over nonzero residues directly. These calculations give
  #[#set math.equation(numbering: n => "(8.5)")
   $ C_(p \, j) \( h_p \) =
     cases(delim: "{", upright(N)_(K \/ bb(Q)) \( p \)^(- 1 \/ 2) chi_p \( - 1 \)^j gamma_j \( p \) chi_p \(
     h_p \)^(- j) \, & j eq.not 0 \, med h_p eq.not 0 \,, 0 \, & j eq.not 0 \, med h_p = 0 \,, - upright(N)_(K \/
     bb(Q)) \( p \)^(- 1) \, & j = 0 \, med h_p eq.not 0 \,, 1 - upright(N)_(K \/ bb(Q)) \( p \)^(- 1) \, & j =
     0 \, med h_p = 0 .) $ <eq:ray-fourier>]
  For the tuple $bold(h)$, define its set of #emph[active primes] by $cal(A) \( bold(h) \) := { p in cal(P) :
    h_p eq.not 0 }$. By (8.5), $c_(upright(F)) \( bold(h) \) eq.not 0$ implies ${ p in cal(P) :
    j_p eq.not 0 } subset.eq cal(A) \( bold(h) \)$. Thus only primes with $j_p = 0$ can be inactive,
    as asserted in the proposition. Put $r = product_(p in cal(A) \( bold(h) \)) p$,
    and let $c_0$ be the reduced denominator of $lambda^2 h_0 \/ L$. At each active prime $p$,
  $ v_p \( lambda^2 h_p \/ p \) = - 1 \, wide v_p \( z_(bold(h)) - lambda^2 h_p \/ p \) gt.eq 0 \, $
  so the factor $p$ cannot cancel from the denominator. At primes dividing $L$,
    all terms $lambda^2 h_p \/ p$ are integral. Thus the reduced denominator is $c = c_0 r$ up to a unit,
    including when $\( h_0 \, L \) eq.not 1$. The finite Fourier expansion has therefore expressed $Theta_Psi$ as
    $O_L \( 2^(\| cal(P) \|) \)$ groups of translates $overline(theta \( z + z_(bold(h)) \, v \))$,
    with shifts $z_(bold(h))$ and coefficients $c_(upright(F)) \( bold(h) \)$ given by (8.4).
    The groups are indexed by $h_0 in cal(O) \/ \( L \)$ and the active set $cal(A)$.
    Each group has a common reduced denominator $c = c_0 product_(p in cal(A)) p$ up to a unit.
    For each translate $overline(theta \( z + z_(bold(h)) \, v \))$,
    we next identify which of the three Fourier expansions in (6.8) will be used after changing coordinates at
    $z_(bold(h))$.
  #emph[Reduced denominators and cusp coefficients.] We next express each translate
    $overline(theta \( z + z_(bold(h)) \, v \))$ using one of the three cusp expansions identified above.
    Our representatives $gamma_0 \, gamma_(+) \, gamma_(-)$ correspond to $gamma_1 \, gamma_10 \, gamma_19$,
    respectively, in the numbering of [7] §5.1, which follows [38] Table II.
    We allow $\( h_0 \, L \) eq.not 1$ and keep the reduced denominator $c_0$ of $lambda^2 h_0 \/
    L$ in the calculation; this is the extension beyond [7] Corollary 5.1.
  Set $M = lambda^12 L^4$. Since $\( p \, M \) = 1$ for $p in cal(A) \( bold(h) \)$,
    the Chinese remainder theorem lets us choose representatives $h_p in cal(O)$ with $h_p equiv
    0 med \( mod med M^2 \)$. Changing representatives modulo $p$ changes $z_(bold(h))$ by an element of $lambda^2
    cal(O) = 3 cal(O)$, under which $theta$ is periodic. To track dependence on the primes in $r$,
    restrict $r$ to a residue class modulo $M^2$. For fixed $h_0$, active set, and this residue class,
    write $z_(bold(h)) = a \/ c$ in lowest terms, normalizing $a equiv
    1 med \( mod med 3 \)$ if $lambda divides c$, and $c equiv 1 med \( mod med 3 \)$ otherwise. Since
  $ a = lambda^2 c #scale(x: 180%, y: 180%)[\(] h_0 \/ L + sum_(p divides r) h_p \/ p #scale(x: 180%, y: 180%)[\)] \, $
  these choices fix the residue of $a$ modulo $M c_0$. Since $\( a \, c \) = 1$ and $\( r \, M \) = 1$,
    the Chinese remainder theorem gives $delta' in cal(O)$ satisfying the following congruences,
    where $q$ ranges over prime divisors of the indicated elements:
  $ a delta' & equiv 1 med \( mod med q^(v_q \( M c_0 \)) \) &  & \( q divides c_0 \) \,\
delta' & equiv 0 med \( mod med q^(v_q \( M \)) \) &  & \( q divides M \, med q divides.not c_0 \) \,\
a delta' & equiv 1 med \( mod med r \) . $
  Put
  $ b_g = frac(a delta' - 1, c) \, wide g = mat(delim: "(", a, b_g; c, delta') in upright("SL")_2 \( cal(O) \) . $
  The congruences for $delta'$ give
  $ b_g equiv cases(delim: "{", 0 \, & q divides c_0 \,, - c^(- 1) \, & q divides M \, med q divides.not c_0 \,)
    med \( mod med q^(v_q \( M \)) \) . $
  To choose the cusp expansion at $a \/ c$, put
  $ H =
    cases(delim: "{", I \, & 3 divides c \,, mat(delim: "(", 1, 0; u_0, 1) \, & v_lambda \( c \) = 1 \, quad u_0
    in { lambda \, - lambda } \, quad u_0 equiv c med \( mod med 3 \) \,, mat(delim: "(", u_0, - 1; 1, 0) \, & \(
    c \, lambda \) = 1 \, quad u_0 equiv a med \( mod med 3 \) .) $
  In the last case choose $u_0 in cal(O)$ from a fixed set of representatives modulo $3$.
    In each case, put $g_1 = g H^(- 1)$. Then $g = g_1 H$ and $g_1 equiv I med \( mod med 3 \)$, as in [7] §5.1.
    The invariances
  $ theta \( gamma w \) = theta \( w \) quad \( gamma in upright("SL")_2 \( bb(Z) \) \) \, wide
    theta \( z + t \, v \) = theta \( z \, v \) quad \( t in bb(Z) + 3 cal(O) \) $
  reduce $overline(theta) \( H w \)$ to one of the three functions $overline(theta \( gamma_sigma w \))$,
    $sigma in { 0 \, - \, + }$, with the matrices $gamma_sigma$ from (6.7).
    These representatives give the infinity expansion and the two additional cusp expansions needed here:
    translating by $omega$ or $- omega$, then applying inversion, gives the representatives labeled $-$ and $+$,
    respectively [7] (5.9)–(5.15), Appendix A. Write $t_sigma \( ell \)$ for the coefficient of $v
    K_(1 \/ 3) \( 4 pi \| ell \| v \) breve(e) \( ell z \)$ in $theta \( gamma_sigma w \)$.
    Let $tau_1 \, tau_2 : lambda^(- 4) cal(O) \\ { 0 } arrow.r
    bb(C)$ be the coefficient sequences defined in [7] (5.13), (5.14).
    Patterson’s cusp calculation [38] Theorem 8.1 and Table III then gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ t_0 \( ell \) = tau \( ell \) \, wide t_(-) \( ell \) = omega^2 tau_1 \( omega^2 ell \) breve(e) \( ell \) \,
     wide t_(+) \( ell \) = omega tau_2 \( omega ell \) breve(e) \( ell \) . $ <eq:cusp-fourier-coefficients>]
  Complex conjugation changes the Fourier frequency from $ell$ to $- ell$.
    Thus the coefficients in the normalization (6.8) are
  #[#set math.equation(numbering: n => "(8.7)")
   $ d_sigma \( ell \) = overline(t_sigma \( - ell \)) \, wide
     sigma in { 0 \, + \, - } . $ <eq:conjugate-cusp-coefficients>]
  For indices $ell = u lambda^m n b^3$ as in (6.10), the coefficient magnitudes satisfy
  $ \| t_0 \( ell \) \| lt.eq
    cases(delim: "{", 3^(k \/ 2 + 2) \| b \| \, & m = 3 k - 4 \, med k gt.eq 1 \,, 3^(k \/ 2 + 5 \/ 2) \|
    b \| \, & m = 3 k - 3 \, med k gt.eq 0 .) $
  The $m = - 4$ coefficients of $t_(-)$ and $t_(+)$ have magnitude at most $9 \| b \|$.
    For the chosen $H$, let $sigma in { 0 \, + \, - }$ index the corresponding expansion in (6.8).
    For each translate $overline(theta \( z + a \/ c \, v \))$,
    we have identified the Fourier expansion in $z$ of $overline(theta \( H \( z \, v \) \))$ as one of the three
    expansions in (6.8):
  $ overline(theta \( H \( z \, v \) \)) = 3^(5 \/ 2) / 2 upright(bold(1))_(sigma = 0) v^(2 \/ 3) +
    sum_(0 eq.not ell in lambda^(- 4) cal(O)) d_sigma \( ell \) v K_(1 \/ 3) \( 4 pi \| ell \| v \)
    breve(e) \( ell z \) . $
  These coefficients satisfy the support restriction (6.10) and bound (6.11),
    proving the coefficient assertions of Lemma 16. The next step uses $g =
    g_1 H$ to express the original translate through this Fourier series evaluated at
    $g^(- 1) \( z + a \/ c \, v \)$, and computes the accompanying multiplier and additive phase.
    The matrix $g$ maps $oo$ to $a \/ c$, which is why this is called an expansion at the cusp $a \/ c$.
  #emph[The local character transformation.] The matrix factorization $g = g_1 H$ lets us apply the automorphy law
  $ theta \( g_1 w \) = kappa \( g_1 \) theta \( w \) \, wide kappa \( g_1 \) = \( c_1 \/ a_1 \)_3 \, wide g_1 =
    mat(delim: "(", a_1, b_1; c_1, d_1) equiv I med \( mod med 3 \) \, $
  where $kappa$ is Kubota’s cubic character [7] (5.4), (5.6).
    We will combine its conjugate with the finite Fourier coefficients $C_(p \, j) \( h_p \)$ in (8.5) to obtain
    the factors $B_(p \, j)$ of (6.5). For the translated theta function, the automorphy law gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ overline(theta \( z + a \/ c \, v \)) = overline(kappa \( g_1 \)) thin
     overline(theta #scale(x: 120%, y: 120%)[\(] H g^(- 1) \( z + a \/ c \, v \) #scale(x: 120%, y: 120%)[\)]) \,
     $ <eq:theta-cusp-automorphy>]
  where
  #[#set math.equation(numbering: n => "(8.9)")
   $ g^(- 1) \( z + a \/ c \, v \) = #scale(x: 180%, y: 180%)[\(] - delta' / c -
     frac(macron(z), c^2 \( v^2 + \| z \|^2 \)) \, frac(v, upright(N)_(K \/ bb(Q)) \( c \) \( v^2 + \| z \|^2 \))
     #scale(x: 180%, y: 180%)[\)] . $ <eq:theta-cusp-coordinates>]
  At $z = 0$, the term with Fourier index $ell$ in the expansion of $overline(theta) \( H w \)$ therefore acquires
    the phase $breve(e) \( - delta' ell \/ c \)$. We claim that the multiplier is given by
  #[#set math.equation(numbering: n => "(8.10)")
   $ kappa \( g_1 \) =
     cases(delim: "{", \( c_0 \/ a \)_3 \( a \/ r \)_3 \, & 3 divides c \,, \( - u_0 \/ \( a - u_0 b_g \) \)_3
     thin \( \( c_0 \/ u_0 \) \/ a \)_3 \( a \/ r \)_3 \, & v_lambda \( c \) = 1 \,, \( a \/ c_0 \)_3 \( a \/
     r \)_3 \, & \( c \, lambda \) = 1 .) $ <eq:ray-multiplier>]
  To verify (8.10), use the determinant equation and cubic reciprocity.
    For the case $v_lambda \( c \) = 1$, the required congruences are
  $ a \( c - u_0 delta' \) equiv - u_0 med \( mod med a - u_0 b_g \) \, wide b_g c equiv - 1 med \( mod med a \) . $
  For $\( c \, lambda \) = 1$, the congruence
  $ - b_g c = 1 - a delta' equiv 1 med \( mod med 9 \) $
  removes the supplementary factors; reciprocity at the remaining primes then gives
    $\( delta' \/ \( - b_g c \) \)_3 = 1$. The factors other than $\( a \/ r \)_3$ depend only on the fixed
    residues at primes in $S$. We may therefore write
  $ kappa \( g_1 \) = kappa_0 \( a \/ r \)_3 = kappa_0 product_(p divides r) chi_p \( a \)^2 \,
    wide \| kappa_0 \| = 1 \, $
  where $kappa_0$ is fixed once $h_0$, the active set, and $r med mod med M^2$ are fixed.
  Fix $h_0$ and the active set, so that the denominator $c =
    c_0 r$ is fixed while the nonzero residues $h_p$ vary. Put $D_0 = lambda^3 c_0$.
    For each active prime $p$, define in $cal(O) \/ \( p \)$
  $ sigma_p = lambda^2 c \/ p \, wide epsilon.alt_p = - #scale(x: 120%, y: 120%)[\(] \( lambda^3 c \/ p \) sigma_p
    #scale(x: 120%, y: 120%)[\)]^(- 1) . $
  The inverse in $epsilon.alt_p$ is taken in the field $cal(O) \/ \( p \)$;
    it exists because $r$ is squarefree and $p divides.not lambda c_0$.
    The expression for $a$ gives $a equiv sigma_p h_p med \( mod med p \)$.
    For a dual Fourier index $ell in lambda^(- 4) cal(O)$, the additive form of the Chinese remainder theorem yields
  #[#set math.equation(numbering: n => "(8.11)")
   $ breve(e) \( - delta' ell \/ c \) = psi \( lambda^4 ell \) product_(p divides r)
     e \( epsilon.alt_p h_p^(- 1) lambda^4 ell \/ p \) \, $ <eq:ray-additive-crt>]
  where
  $ psi \( lambda^4 ell \) := e \( - delta'_0 r^(- 1) lambda^4 ell \/ D_0 \) \, wide delta'_0 = delta' med mod med
    D_0 . $
  The residues $delta'_0$ and $r^(- 1) med mod med D_0$ are fixed by the choices above,
    so $psi$ ranges over a fixed finite family of additive characters of $cal(O)$.
    We claim the local transformation identity
  #[#set math.equation(numbering: n => "(8.12)")
   $ sum_(h_p eq.not 0) C_(p \, j) \( h_p \) chi_p \( a \)^(- 2)
     e \( epsilon.alt_p h_p^(- 1) lambda^4 ell \/ p \) = chi_p \( sigma_p \)^(- 2) omega_(p \, j)
     B_(p \, j) \( lambda^4 ell \) \, $ <eq:ray-local-transform>]
  where $B_(p \, j)$ is defined in (6.5), and
  $ omega_(p \, j) =
    cases(delim: "{", chi_p \( - 1 \)^j gamma_j \( p \) gamma_(j + 2) \( p \) chi_p \( epsilon.alt_p \)^(- j -
    2) \, & j eq.not 0 \, 4 \,, gamma_4 \( p \) \, & j = 4 \,, - gamma_2 \( p \) chi_p \( epsilon.alt_p \)^(-
    2) \, & j = 0 med upright("active") .) $
  The indices of $gamma_j \( p \)$ are read modulo six; in the second case, $chi_p \( - 1 \)^4 = 1$.
    In each case $\| omega_(p \, j) \| = 1$. To prove (8.12), combine (8.5), the conjugate of (8.10), and (8.11).
    Setting $y = h_p^(- 1)$ changes the character exponent as follows:
  $ chi_p \( h_p \)^(- j) chi_p \( a \)^(- 2) = chi_p \( sigma_p \)^(- 2) chi_p \( h_p \)^(- j - 2) =
    chi_p \( sigma_p \)^(- 2) chi_p \( y \)^(j + 2) \, wide y = h_p^(- 1) . $
  For $j eq.not 0 \, 4$, the character $chi_p^(j + 2)$ is nontrivial,
    and its Gauss sum gives the first case of $B_(p \, j)$. For $j = 4$, it is trivial on nonzero residues;
    after rescaling by $epsilon.alt_p eq.not 0$, the sum is
  $ sum_(y eq.not 0) e \( lambda^4 ell y \/ p \) = - 1 + upright(N)_(K \/ bb(Q)) \( p \)
    upright(bold(1))_(p divides lambda^4 ell) . $
  For active $j = 0$, the coefficient $- upright(N)_(K \/ bb(Q)) \( p \)^(- 1)$ combines with a cubic Gauss sum to give
  $ B_(p \, 0) \( lambda^4 ell \) = upright(N)_(K \/ bb(Q)) \( p \)^(- 1 \/ 2) chi_p \( lambda^4 ell \)^(- 2) \, $
  with the unit factors included in $omega_(p \, 0)$. This proves (8.12) in every case.
    An inactive prime has $j = 0$ and contributes only the scalar $1 - upright(N)_(K \/ bb(Q)) \( p \)^(- 1)$.
    Consequently, for each fixed $h_0$ and active set $cal(A)$,
    combining the Fourier coefficients $d_sigma \( ell \)$ of $overline(theta \( H \( z \, v \) \))$ with the sums
    over $h_p eq.not 0$ gives
  $ d_sigma \( ell \) psi \( lambda^4 ell \) product_(p in cal(A)) B_(p \, j_p) \( lambda^4 ell \) \, $
  up to a scalar independent of $ell$. These are the arithmetic factors in the dual sum (6.9).
    In particular, $B_(p \, 1) \( lambda^4 ell \) = chi_p \( lambda^4 ell \)^3$ is the quadratic factor used in (6.18).
  #emph[The archimedean transform.] We now derive the transformed weight $V_(*)^sharp$ in (6.6) and the scalar
    multiplying the dual sum. For $"Re" s > 1$, introduce the Dirichlet series associated with the completed sum (5.3):
  $ cal(T) \( s \, Psi \) = #scale(x: 180%, y: 180%)[\(] sum_(n in cal(O)\
n equiv 1 med \( 3 \)\
\( n \, S \) = 1)^(*) overline(alpha \( n \)) gamma_2 \( n \) Psi \( n \) upright(N)_(K \/ bb(Q)) \( n \)^(- s)
  #scale(x: 180%, y: 180%)[\)] #scale(x: 180%, y: 180%)[\(] sum_(b in cal(O)\
b equiv 1 med \( 3 \)\
\( b \, S \) = 1) overline(alpha \( b \))^(thin 3) Psi \( b \)^3 upright(N)_(K \/ bb(Q)) \( b \)^(- 3 s + 1 \/ 2)
  #scale(x: 180%, y: 180%)[\)] . $
  With $V_(*)$ from (5.3) and its Mellin transform defined before (6.6), Mellin inversion gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ T \( X \; Psi \) = frac(1, 2 pi upright(i)) integral_(\( sigma \)) hat(V)_(*) \( s - 1 / 2 \)
     cal(T) \( s \, Psi \) X^(s - 1 \/ 2) thin d s \, wide sigma > 1 . $ <eq:theta-mellin-inversion>]
  The identity (6.3), with $Psi$ in place of $Psi_k$, identifies these coefficients with those of $Theta_Psi$
    after inserting the factor $overline(alpha \( n b^3 \))$.
    We now compute the normalization relating $cal(T) \( s \, Psi \)$ to the Mellin transform of the derivative of
    $Theta_Psi$.
  For $z = x + upright(i) y$, use $partial_(macron(z)) = \( partial_x + upright(i) partial_y \) \/
    2$ and $partial_z = \( partial_x - upright(i) partial_y \) \/ 2$.
    Differentiation in $macron(z)$ supplies a factor $macron(ell)$ in each Fourier mode.
    Combined with the factor $\| ell \|^(- 1)$ from the Bessel integral below,
    this produces the required angular factor $overline(alpha \( ell \))$.
    We therefore define, initially for $"Re" s > 1$, the Mellin transform
  $ cal(J) \( s \) = integral_0^oo partial_(macron(z)) Theta_Psi \( z \, v \) #scale(x: 180%, y: 180%)[\|]_(z = 0)
    v^(2 s - 1) thin d v . $
  For each nonzero Fourier mode, differentiation and the Mellin integral for $K_(1 \/ 3)$ (see [35] (10.43.19))
    give the following formulas:
  #[#set math.equation(numbering: n => "(8.14)")
   $ partial_(macron(z)) breve(e) \( ell z \) & = 2 pi upright(i) macron(ell) thin breve(e) \( ell z \) \,\
integral_0^oo v^(2 s) K_(1 \/ 3) \( 4 pi \| ell \| v \) thin d v & =
  frac(2^(2 s - 1) Gamma \( s + 1 \/ 3 \) Gamma \( s + 2 \/ 3 \), \( 4 pi \| ell \| \)^(2 s + 1)) wide
  "Re" s > 0 . $ <eq:fourier-derivative>]
  For $"Re" s > 1$, the coefficient formula (2.10) and (8.14) show that the sum of the integrals of the absolute
    values is finite. We may therefore integrate the differentiated Fourier series term by term.
  For $ell = lambda^(- 3) n b^3$, the phase and scale simplify to
  $ upright(i) overline(alpha \( ell \)) \| ell \|^(- 2 s) =
    27^s overline(alpha \( n \)) thin overline(alpha \( b \))^(thin 3) upright(N)_(K \/ bb(Q)) \( n \)^(- s)
    upright(N)_(K \/ bb(Q)) \( b \)^(- 3 s) . $
  Combining this with (2.10) gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ cal(J) \( s \) = 3^(5 \/ 2) / 4 #scale(x: 180%, y: 180%)[\(] frac(27, \( 2 pi \)^2)
     #scale(x: 180%, y: 180%)[\)]^s Gamma \( s + 1 \/ 3 \) Gamma \( s + 2 \/ 3 \) cal(T) \( s \, Psi \) .
     $ <eq:ray-mellin>]
  We next show that $cal(J) \( s \)$ is entire and use (8.15) to continue $cal(T) \( s \, Psi \)$.
  Write $\( z' \, v' \) = g^(- 1) \( z + a \/ c \, v \)$. Differentiating (8.9) at $z = 0$ gives
  $ frac(partial z', partial macron(z)) \|_(z = 0) = - frac(1, c^2 v^2) \, wide
    frac(partial overline(z'), partial macron(z)) \|_(z = 0) = 0 \, wide
    frac(partial v', partial macron(z)) \|_(z = 0) = 0 . $
  Thus the derivative in cusp coordinates is $- \( c v \)^(- 2) partial_(z')$, with no height-derivative term.
    The defining Fourier series (8.2) for $Theta_Psi$ controls $v arrow.r oo$.
    For $v arrow.r 0$, use (8.8) and the cusp expansions (6.8).
    In each expansion the horizontal derivative removes the constant mode.
    The remaining modes decay exponentially as $v arrow.r oo$; at $v arrow.r 0$,
    the transformed height $1 \/ \( upright(N)_(K \/ bb(Q)) \( c \) v \)$ tends to infinity,
    giving exponential decay in $1 \/ v$. Thus the integral defining $cal(J) \( s \)$ converges for every $s$ and
    defines an entire function. Equation (8.15), after division by its gamma factors,
    also continues $cal(T) \( s \, Psi \)$ to an entire function.
  For the term indexed by $bold(h)$ in (8.4), write $c_(bold(h)) \, delta'_(bold(h)) \, g_(1 \, bold(h)) \,
    H_(bold(h))$ for the corresponding choices above. Let $sigma_(bold(h))$ be the cusp index determined by
    $H_(bold(h))$. Define its cusp Mellin transform by
  #[#set math.equation(numbering: n => "(8.16)")
   $ cal(J)_(bold(h))^or \( s \) = integral_0^oo partial_z { overline(theta \( H_(bold(h)) \( z \, v \) \))
     #scale(x: 120%, y: 120%)[}] #scale(x: 180%, y: 180%)[\|]_(z = - delta'_(bold(h)) \/ c_(bold(h))) v^(2 s - 1)
     thin d v . $ <eq:dual-cusp-mellin>]
  Substituting $v mapsto \( upright(N)_(K \/ bb(Q)) \( c_(bold(h)) \) v \)^(- 1)$ in each translated term of
    $cal(J) \( s \)$, using (8.8), gives
  #[#set math.equation(numbering: n => "(8.17)")
   $ cal(J) \( s \) = - sum_(bold(h)) c_(upright(F)) \( bold(h) \) overline(kappa \( g_(1 \, bold(h)) \)) thin
     overline(alpha \( c_(bold(h)) \))^(thin 2) upright(N)_(K \/ bb(Q)) \( c_(bold(h)) \)^(1 - 2 s)
     cal(J)_(bold(h))^or \( 1 - s \) . $ <eq:theta-mellin-functional-equation>]
  Here $c_(upright(F)) \( bold(h) \)$ is the coefficient in (8.4).
    The cusp coefficients $d_(sigma_(bold(h))) \( ell \)$ and (8.14) give, for $"Re" s > 1$,
  #[#set math.equation(numbering: n => "(8.18)")
   $ cal(J)_(bold(h))^or \( s \) =
     frac(upright(i) thin Gamma \( s + 1 \/ 3 \) Gamma \( s + 2 \/ 3 \), 4 \( 2 pi \)^(2 s))
     sum_(0 eq.not ell in lambda^(- 4) cal(O))
     frac(d_(sigma_(bold(h))) \( ell \) alpha \( ell \), upright(N)_(K \/ bb(Q)) \( ell \)^s)
     breve(e) \( - delta'_(bold(h)) ell \/ c_(bold(h)) \) . $ <eq:dual-cusp-mellin-series>]
  The Dirichlet series $cal(T) \( s \, Psi \)$ converges absolutely for $"Re" s > 1$,
    while the series in (8.18) at $1 - s$ converges absolutely for $"Re" s < 0$.
    The functional equation (8.17) and Stirling’s formula [22] §5.A.4 therefore give polynomial bounds in $\| "Im"
    s \|$ for $cal(T) \( s \, Psi \)$ on both sides of the strip $0 lt.eq "Re" s lt.eq 1$.
    Splitting the integral defining $cal(J) \( s \)$ at $v = 1$ gives finite order;
    Phragmén–Lindelöf [22] Theorem 5.53 then gives the same type of bound inside the strip (compare the arguments
    of Dunn and Radziwiłł in [7] Propositions 5.1–5.2). Together with the rapid decay of $hat(V)_(*)$ on vertical
    lines, these bounds justify moving the $s$-contour in (8.13) to $"Re" s < 0$.
    No poles are crossed, since $cal(T) \( s \, Psi \)$ is entire.
    Setting $t = 1 / 2 - s$ then gives a line $"Re" t > 1 \/ 2$, where the dual coefficient series converges absolutely.
  For fixed $h_0$ and active set, insert (8.18) into (8.17) and use (8.12) to sum over the nonzero $h_p$.
    After the normalization in (8.15), the scalar $C$ in (6.9) for this group of translates is
  $ C = - upright(i) / 81 overline(alpha \( c \))^(thin 2) hat(phi.alt) \( h_0 \) overline(kappa_0)
    product_(p med upright("inactive")) \( 1 - upright(N)_(K \/ bb(Q)) \( p \)^(- 1) \)
    product_(p med upright("active")) chi_p \( sigma_p \)^(- 2) omega_(p \, j_p) \, wide \| C \| lt.eq 1 \/ 81 . $
  Dividing (8.15) by its gamma factors and setting $t = 1 / 2 - s$ produces the gamma quotient in (6.6).
    Its numerator gamma factors have their first pole at $t = - 5 \/ 6$,
    and its reciprocal denominator gamma factors are entire. Thus no poles lie between the current contour $"Re"
    t > 1 \/ 2$ and $"Re" t = 0$. The rapid decay of $hat(V)_(*)$, together with Stirling’s formula,
    allows us to shift each kernel contour to $"Re" t = 0$. This gives the weight $V_(*)^sharp$ defined in (6.6),
    evaluated at $upright(N)_(K \/ bb(Q)) \( ell \) X \/ upright(N)_(K \/ bb(Q)) \( c \)^2$.
    Together with (8.12), this gives the dual sum (6.9).
  For $k_0$ as in Lemma 15, fix $h_0$, the factors of $Psi$ other than $chi_(k_0)$,
    and the active/inactive choices at their primes. Every prime dividing $k_0$ has exponent $j_p =
    1$ and is therefore active, so
  $ r = k_0 product_(p in cal(A)_(upright("fix"))) p . $
  Thus $r \/ k_0$ is fixed, and fixing $k_0 med mod med M^2$ fixes $r med mod med M^2$.
    The choices of $H \, c_0$ and the residues in (8.11) are therefore fixed in each such class.
    Thus $d = d_sigma$, $psi$, and $c_0$ have precisely the asserted dependence on $k_0$.
  It remains to bound the transformed weight. The first numerator pole of the gamma quotient in (6.6) is at $t = -
    5 \/ 6$. We may therefore shift the kernel contour to $"Re" t = - 1 \/ 4$ for $0 < x lt.eq 1$,
    obtaining the factor $x^(1 \/ 4)$, and to $"Re" t = A$ for $x gt.eq 1$, obtaining $x^(- A)$.
    Each application of $x partial_x$ introduces a factor $- t$.
    Stirling’s formula on $- 1 \/ 4 lt.eq "Re" t lt.eq A$ then gives, for every $A > 0$ and $j gt.eq 0$,
  #[#set math.equation(numbering: n => "(8.19)")
   $ \| \( x partial_x \)^j V_(*)^sharp \( x \) \| & lt.double_(A \, j) min { x^(1 \/ 4) \, \( 1 + x \)^(- A) }\
 & quad times sup_(- A lt.eq eta lt.eq 1 \/ 4) integral_(bb(R)) \( 1 + \| u \| \)^(ceil.l 4 A ceil.r + j + 2) \|
   hat(V)_(*) \( eta + upright(i) u \) \| thin d u . $ <eq:ray-kernel>]
  When $V_(*)$ is supported in a fixed compact interval $I subset \( 0 \, oo \)$,
    repeated integration by parts in its Mellin transform gives rapid decay in $\| u \|$, uniformly for $- A lt.eq
    eta lt.eq 1 \/ 4$. Thus, for a sufficiently large $J = J \( A \, j \)$,
    the supremum of integrals in (8.19) is $lt.double_(A \, j \, I) parallel V_(*) parallel_(C^J \( I \))$.
    This proves (6.12). Thus (6.9) expresses $T \( X \; Psi \)$ as $O_(Psi_0 \, S) \( 2^(\| cal(P) \|) \)$ dual
    sums with $\| C \| lt.eq 1 \/ 81$, the asserted ray class dependence of $\( d \, psi \, c_0 \)$,
    and the weight decay just established. Together with the support and coefficient bounds proved above,
    this completes the proof of Proposition 14 and Lemmas 15 and 16. ◻
]

== 9 Separating variables in smooth weights <app:weights>

This appendix justifies the separation of smooth weights in the completed mean-square estimate of Section 6,
  and the treatment of kernels depending on the row in the Poisson reductions of Sections 4 and 7.

=== 9.1 Separating the variables <separating-the-variables>

We use Mellin inversion to separate the variables of a smooth weight,
  with coefficient bounds controlled by finitely many derivatives.

#thm([Lemma 9.1.])[
  #emph[Fix a box $cal(I) = I_1 times dots.h.c times I_d$, where each $I_j$ is a compact interval in
    $\( 0 \, oo \)$. Every $cal(K) in C_c^oo \( \( 0 \, oo \)^d \)$ supported in $cal(I)$ has a representation
#[#set math.equation(numbering: n => "(9.1)")
 $ cal(K) \( upright(bold(x)) \) = integral_(bb(R)^d) b \( upright(bold(t)) \) product_(j = 1)^d
   x_j^(upright(i) t_j) thin d upright(bold(t)) \, wide x_j > 0 . $ <eq:smooth-separation>]

 For $J gt.eq 0$ and every even integer $q > J + d$, the coefficient satisfies
$ integral_(bb(R)^d) \| b \( upright(bold(t)) \) \| \( 1 + \| upright(bold(t)) \| \)^J thin d upright(bold(t))
  lt.double_(cal(I) \, J \, q \, d) parallel cal(K) parallel_(C^q \( cal(I) \)) . $

]
] <lem:smooth>

#proof[
  Take the Fourier transform in logarithmic coordinates:
  $ b \( upright(bold(t)) \) = frac(1, \( 2 pi \)^d) integral_(bb(R)^d) cal(K) \( e^(y_1) \, dots.h \, e^(y_d) \)
    e^(- upright(i) upright(bold(t)) dot.op upright(bold(y))) thin d upright(bold(y)) . $
  Applying Fourier inversion to this gives (9.1). Since the intervals $I_j$ are fixed and bounded away from zero,
    the $C^q$ norm in logarithmic coordinates is bounded by a constant times $parallel cal(K)
    parallel_(C^q \( cal(I) \))$. Applying $\( 1 - Delta_(upright(bold(y))) \)^(q \/ 2)$ under the integral
    therefore gives
  $ \| b \( upright(bold(t)) \) \| lt.double_(cal(I) \, q \, d) \( 1 + \| upright(bold(t)) \| \)^(- q) parallel
    cal(K) parallel_(C^q \( cal(I) \)) wide \( q gt.eq 0 upright(" even") \) . $
  Multiplication by $\( 1 + \| upright(bold(t)) \| \)^J$ and integration proves the bound when $q > J + d$.
    See also the multivariable Mellin formulation in [39] §10.1, (130)–(131). ◻
]

In our applications, the weight has the more specific form

$ cal(K)_R \( upright(bold(x)) \) = product_(j = 1)^d W_j \( x_j \) F #scale(x: 180%, y: 180%)[\(] R
  product_(j = 1)^d x_j^(a_j) #scale(x: 180%, y: 180%)[\)] \, wide R > 0 \, $

where the exponents $a_j$ are fixed real numbers and $W_j in C_c^oo \( \( 0 \, oo \) \)$ is supported in $I_j$.
  Assume that $F in C^oo \( \( 0 \, oo \) \)$ satisfies

$ parallel F parallel_(A \, q) := max_(0 lt.eq m lt.eq q) sup_(u > 0) \( 1 + u \)^A \| \( u partial_u \)^m
  F \( u \) #scale(x: 120%, y: 120%)[\|] < oo wide \( A gt.eq 0 \, med q in bb(Z)_(gt.eq 0) \) . $

On the fixed box $cal(I)$, the argument of $F$ is comparable to $R$.
  The chain rule and the pointwise bound in the proof give coefficients $b_R$ satisfying, for $A gt.eq
  0$ and even $q gt.eq 0$,

#[#set math.equation(numbering: n => "(9.2)")
 $ \| b_R \( upright(bold(t)) \) \| lt.double \( 1 + R \)^(- A) \( 1 + \| upright(bold(t)) \| \)^(- q) parallel F
   parallel_(A \, q) product_(j = 1)^d parallel W_j parallel_(C^q \( I_j \)) . $ <eq:smooth-pointwise>]

Consequently, for $J gt.eq 0$ and even $q > J + d$,

#[#set math.equation(numbering: n => "(9.3)")
 $ integral_(bb(R)^d) \| b_R \( upright(bold(t)) \) \| \( 1 + \| upright(bold(t)) \| \)^J thin d upright(bold(t))
   lt.double \( 1 + R \)^(- A) parallel F parallel_(A \, q) product_(j = 1)^d parallel W_j
   parallel_(C^q \( I_j \)) . $ <eq:smooth-weight-bound>]

The constants depend only on $A \, J \, q \, d$, the intervals $I_j$, and the exponents $a_j$.
  Thus separation preserves the decay in $R$, and its cost is controlled by finitely many derivatives of the
  original weights.

=== 9.2 Weights depending on the row <weights-depending-on-the-row>

The next lemma extends mean-square bounds for a common test function to smooth kernels depending on the row,
  with losses controlled by uniform bounds on their derivatives.

Fix compact intervals $I subset "int" I_(*)$ in $\( 0 \, oo \)$ and an integer $m gt.eq 0$.

#thm([Lemma 9.2.])[
  #emph[Consider two families of finite sums
$ S_(j \, r) \( U \) = sum_n a_(j \, r) \( n \) U \( x_(j \, r \, n) \) \, wide j = 1 \, 2 \, quad
  x_(j \, r \, n) > 0 \, $

 with a finite set of rows $r$ and nonnegative weights $w_r$. Suppose that, for every $U in C_c^oo \( I_(*) \)$,
$ sum_r w_r \| S_(j \, r) \( U \) \|^2 lt.eq M_j parallel U parallel_(C^m \( I_(*) \))^2 \, wide j = 1 \, 2 . $

 Then for any $\| c_r \| lt.eq w_r$ and smooth kernels $cal(K)_r$ supported in $I^2$,
#[#set math.equation(numbering: n => "(9.4)")
 $ \| sum_r c_r sum_(n_1 \, n_2) a_(1 \, r) \( n_1 \) overline(a_(2 \, r) \( n_2 \))
   cal(K)_r \( x_(1 \, r \, n_1) \, x_(2 \, r \, n_2) \) #scale(x: 180%, y: 180%)[\|] lt.double_(I \, I_(*) \, m)
   sqrt(M_1 M_2) thin sup_r parallel cal(K)_r parallel_(C^(2 m + 4) \( I^2 \)) . $ <eq:coupled-mean-square>]

]
] <lem:smooth-mean-square>

#proof[
  Choose a real $V in C_c^oo \( I_(*) \)$ equal to one on $I$, and set $U_t \( x \) = V \( x \) x^(upright(i) t)$.
    Apply (9.1) of Lemma 22 to each $cal(K)_r$ with $d = 2$ and $cal(I) = I^2$.
    Replacing the second Mellin variable by its negative and multiplying by $V \( x \) V \( y \)$,
    which equals one on the support of $cal(K)_r$, gives
  $ cal(K)_r \( x \, y \) = integral_(bb(R)^2) b_r \( s \, t \) U_s \( x \) overline(U_t \( y \)) thin d s thin d t \, $
  with the following uniform bound, obtained from the pointwise coefficient estimate in the proof of Lemma 22 with
    $d = 2$ and $cal(I) = I^2$:
  $ sup_r \| b_r \( s \, t \) \| lt.double_(I \, q)
    frac(sup_r parallel cal(K)_r parallel_(C^q \( I^2 \)), \( 1 + \| s \| + \| t \| \)^q)
    wide \( q gt.eq 0 upright(" even") \) . $
  The hypothesis applies to each $U_t$, and $parallel U_t parallel_(C^m \( I_(*) \))
    lt.double_(I \, I_(*) \, m) \( 1 + \| t \| \)^m$. Taking the common bound for $b_r$ before integrating and
    applying Cauchy–Schwarz in $r$ therefore bounds the absolute value in (9.4) by a constant depending on $I \,
    I_(*) \, m \, q$ times
  #[#set math.equation(numbering: n => "(9.5)")
   $ sqrt(M_1 M_2) sup_r parallel cal(K)_r parallel_(C^q \( I^2 \)) integral_(bb(R)^2)
     frac(\( 1 + \| s \| \)^m \( 1 + \| t \| \)^m, \( 1 + \| s \| + \| t \| \)^q) thin d s thin d t .
     $ <eq:kernel-bilinear-integral>]
  Taking $q = 2 m + 4$ makes the integral converge and proves the claim. ◻
]

=== 9.3 Recombining the separated sums <recombining-the-separated-sums>

We use weighted Cauchy–Schwarz to pass from mean-square bounds for the separated sums to a bound for their
  weighted integral.

#thm([Lemma 9.3.])[
  #emph[Let $r \, iota$ range over finite sets, let $d gt.eq 1$, and let $w_r gt.eq 0$.
    Suppose the measurable coefficients $c_(iota \, r)$ satisfy
$ \| c_(iota \, r) \( upright(bold(t)) \) \| lt.eq b_iota \( upright(bold(t)) \) \, wide M :=
  sum_iota integral_(bb(R)^d) b_iota \( upright(bold(t)) \) thin d upright(bold(t)) < oo \, $

 where $b_iota : bb(R)^d arrow.r \[ 0 \, oo \)$. For measurable $F_(iota \, upright(bold(t))) \( r \)$,
   whenever the right-hand side is finite, one has
#[#set math.equation(numbering: n => "(9.6)")
 $ sum_r w_r \| sum_iota integral c_(iota \, r) \( upright(bold(t)) \) F_(iota \, upright(bold(t))) \( r \) thin d
   upright(bold(t)) #scale(x: 180%, y: 180%)[\|]^2 lt.eq M sum_iota integral b_iota \( upright(bold(t)) \) sum_r
   w_r \| F_(iota \, upright(bold(t))) \( r \) \|^2 thin d upright(bold(t)) . $ <eq:integral-mean-square>]

 The same assertion holds for finite sums with the integrals omitted.]
] <lem:recombine>

#proof[
  For each fixed $r$, weighted Cauchy–Schwarz gives
  $ \| sum_iota integral c_(iota \, r) \( upright(bold(t)) \) F_(iota \, upright(bold(t))) \( r \) thin d
    upright(bold(t)) #scale(x: 180%, y: 180%)[\|]^2 lt.eq M sum_iota integral b_iota \( upright(bold(t)) \) \|
    F_(iota \, upright(bold(t))) \( r \) \|^2 thin d upright(bold(t)) . $
  Multiply by $w_r$ and sum over $r$ to obtain (9.6). The same argument with sums in place of integrals proves the
    finite version. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Agrawal, N.~Kayal, and N.~Saxena, PRIMES is in P, #emph[Ann.
  of Math.] (2) #strong[160] (2004), no.~2, 781--793.]
#bibitem([2])[S.~Bettin and S.~M.~Gonek, The $theta = oo$ conjecture implies the Riemann hypothesis,
  #emph[Mathematika] #strong[63] (2017), no.~1, 29--33.
  #link("https://doi.org/10.1112/S0025579316000139")[doi:10.1112/S0025579316000139].]
#bibitem([3])[V.~Bhargava, G.~Ivanyos, R.~Mittal, and N.~Saxena,
  Irreducibility and deterministic $r$-th root finding over finite fields, in #emph[Proceedings of ISSAC 2017],
  ACM, 2017, 37--44.]
#bibitem([4])[G.~Bhowmik and I.~Z.~Ruzsa, Average Goldbach and the quasi-Riemann hypothesis, #emph[Anal.
  Math.] #strong[44] (2018), no.~1, 51--56.]
#bibitem([5])[V.~Blomer, L.~Goldmakher, and B.~Louvel, $L$-functions with $n$-th-order twists, #emph[Int. Math.
  Res. Not.] (2014), no.~7, 1925--1955. #link("https://doi.org/10.1093/imrn/rns257")[doi:10.1093/imrn/rns257].]
#bibitem([6])[H.~Davenport, #emph[Multiplicative Number Theory], 3rd ed., revised by H.~L.~Montgomery,
  Graduate Texts in Mathematics #strong[74], Springer, New York, 2000.]
#bibitem([7])[A.~Dunn and M.~Radziwiłł, Bias in cubic Gauss sums: Patterson's conjecture, #emph[Ann.
  of Math.] (2) #strong[200] (2024), no.~3, 967--1057.
  #link("https://doi.org/10.4007/annals.2024.200.3.3")[doi:10.4007/annals.2024.200.3.3].]
#bibitem([8])[A.-S.~Elsenhans, J.~Klüners, and F.~Nicolae,
  Imaginary quadratic number fields with class groups of small exponent, #emph[Acta Arith.] #strong[193] (2020),
  no.~3, 217--233.]
#bibitem([9])[K.~Ford, Zero-free regions for the Riemann zeta function, in #emph[Number Theory for the Millennium,
  II] (Urbana, IL, 2000), A K Peters, Natick, MA, 2002, 25--56. Corrected version:
  #link("https://arxiv.org/abs/1910.08205")[arXiv:1910.08205].]
#bibitem([10])[E.~Frenkel, R.~Langlands, and B.~C.~Ngô, Formule des traces et fonctorialité:
  le début d'un programme, #emph[Ann. Sci. Math. Québec] #strong[34] (2010), no.~2, 199--243.
  #link("https://arxiv.org/abs/1003.4578")[arXiv:1003.4578].]
#bibitem([11])[S.~D.~Galbraith, #emph[Mathematics of Public Key Cryptography], Cambridge University Press, 2012.]
#bibitem([12])[P.~Gao and L.~Zhao, Mean squares of quadratic twists of the Möbius function, #emph[J.
  Number Theory] #strong[247] (2023), 1--14.
  #link("https://doi.org/10.1016/j.jnt.2022.12.007")[doi:10.1016/j.jnt.2022.12.007].]
#bibitem([13])[L.~Goldmakher and B.~Louvel, A quadratic large sieve inequality over number fields, #emph[Math.
  Proc. Cambridge Philos. Soc.] #strong[154] (2013), no.~2, 193--212.
  #link("https://doi.org/10.1017/S0305004112000370")[doi:10.1017/S0305004112000370].]
#bibitem([14])[T.~H.~Grönwall, Sur les séries de Dirichlet correspondant à des caractères complexes, #emph[Rend.
  Circ. Mat. Palermo] #strong[35] (1913), 145--159.
  #link("https://doi.org/10.1007/BF03015596")[doi:10.1007/BF03015596].]
#bibitem([15])[F.~Grube, Ueber einige Euler'sche Sätze aus der Theorie der quadratischen Formen, #emph[Z. Math.
  Phys.] #strong[19] (1874), 492--519.]
#bibitem([16])[J.~Hadamard, Sur la distribution des zéros de la fonction $zeta \( s \)$ et ses conséquences
  arithmétiques, #emph[Bull. Soc. Math. France] #strong[24] (1896), 199--220.
  #link("https://doi.org/10.24033/bsmf.545")[doi:10.24033/bsmf.545].]
#bibitem([17])[H.~Hasse, #emph[Vorlesungen über Zahlentheorie],
  Grundlehren der mathematischen Wissenschaften #strong[59], Springer, Berlin, 1950.
  #link("https://doi.org/10.1007/978-3-642-52795-1")[doi:10.1007/978-3-642-52795-1].]
#bibitem([18])[D.~R.~Heath-Brown, A mean value estimate for real character sums,
  #emph[Acta Arith.] #strong[72] (1995), no.~3, 235--275.]
#bibitem([19])[D.~R.~Heath-Brown, Kummer's conjecture for cubic Gauss sums, #emph[Israel J.
  Math.] #strong[120] (2000), 97--124.
  #link("https://doi.org/10.1007/s11856-000-1273-y")[doi:10.1007/s11856-000-1273-y].]
#bibitem([20])[D.~R.~Heath-Brown and S.~J.~Patterson, The distribution of Kummer sums at prime arguments, #emph[J.
  Reine Angew. Math.] #strong[310] (1979), 111--130.
  #link("https://doi.org/10.1515/crll.1979.310.111")[doi:10.1515/crll.1979.310.111].]
#bibitem([21])[E.~Hecke, Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung der Primzahlen, I,
  II, #emph[Math. Z.] #strong[1] (1918), 357--376; #strong[6] (1920), 11--51.]
#bibitem([22])[H.~Iwaniec and E.~Kowalski, #emph[Analytic Number Theory],
  American Mathematical Society Colloquium Publications #strong[53], American Mathematical Society, Providence,
  RI, 2004. #link("https://doi.org/10.1090/coll/053")[doi:10.1090/coll/053].]
#bibitem([23])[E.~Kani, Idoneal numbers and some generalizations, #emph[Ann. Sci. Math.
  Québec] #strong[35] (2011), no.~2, 197--227.]
#bibitem([24])[N.~M.~Korobov, Estimates of trigonometric sums and their applications, #emph[Uspekhi Mat.
  Nauk] #strong[13] (1958), no.~4(82), 185--192 (Russian). #link("https://www.mathnet.ru/eng/rm7458")[Math-Net.Ru:
  rm7458].]
#bibitem([25])[E.~Kowalski, Y.~Lin, Ph.~Michel, and W.~Sawin,
  Periodic twists of $upright(G L)_3$-automorphic forms, #emph[Forum Math. Sigma] #strong[8] (2020), e15.
  #link("https://doi.org/10.1017/fms.2020.7")[doi:10.1017/fms.2020.7].
  #link("https://people.math.ethz.ch/~kowalski/gl3-twists.pdf")[Author version].]
#bibitem([26])[T.~Kubota, #emph[On automorphic functions and the reciprocity law in a number field],
  Lectures in Mathematics, Department of Mathematics, Kyoto University, No.~2, Kinokuniya Book-Store, Tokyo, 1969.
  #link("https://hdl.handle.net/2433/84907")[Kyoto University repository].]
#bibitem([27])[E.~Landau, Neuer Beweis des Primzahlsatzes und Beweis des Primidealsatzes, #emph[Math.
  Ann.] #strong[56] (1903), 645--670. #link("https://doi.org/10.1007/BF01444310")[doi:10.1007/BF01444310].]
#bibitem([28])[J.~E.~Littlewood, Quelques conséquences de l'hypothèse que la fonction $zeta \( s \)$ de Riemann
  n'a pas de zéros dans le demi-plan $"R" \( s \) > 1 \/ 2$, #emph[C. R. Acad. Sci.
  Paris] #strong[154] (1912), 263--266.]
#bibitem([29])[J.~E.~Littlewood, On the class-number of the corpus $P \( sqrt(- k) \)$, #emph[Proc. London Math.
  Soc.] (2) #strong[27] (1928), no.~1, 358--372.]
#bibitem([30])[R.~F.~Lu, A.~Zaman, and H.~Zhao, Numerical computations concerning Landau--Siegel zeros,
  preprint, 2026. #link("https://arxiv.org/abs/2602.03626")[arXiv:2602.03626].]
#bibitem([31])[H.~Maier and H.~L.~Montgomery, The sum of the Möbius function, #emph[Bull. London Math.
  Soc.] #strong[41] (2009), no.~2, 213--226. #link("https://doi.org/10.1112/blms/bdn119")[doi:10.1112/blms/bdn119].]
#bibitem([32])[G.~L.~Miller, Riemann's hypothesis and tests for primality, #emph[J. Comput.
  System Sci.] #strong[13] (1976), no.~3, 300--317.]
#bibitem([33])[H.~L.~Montgomery and R.~C.~Vaughan, #emph[Multiplicative Number Theory I:
  Classical Theory], Cambridge Studies in Advanced Mathematics #strong[97], Cambridge University Press, 2007.]
#bibitem([34])[M.~Ram Murty and A.~Sankaranarayanan, Averages of exponential twists of the Liouville function,
  #emph[Forum Math.] #strong[14] (2002), no.~2, 273--291.]
#bibitem([35])[NIST Digital Library of Mathematical Functions, §10.43, equation (10.43.19).
  #link("https://dlmf.nist.gov/10.43.E19").]
#bibitem([36])[OpenAI, The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane $upright(R e) \( s \) > 7 \/ 8$,
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/paper.pdf")[OAI:The-Quasi-Riemann-Hypothesis-September-30-2026],
  2026.]
#bibitem([37])[A.~Page, On the number of primes in an arithmetic progression, #emph[Proc. London Math.
  Soc.] (2) #strong[39] (1935), 116--141.
  #link("https://doi.org/10.1112/plms/s2-39.1.116")[doi:10.1112/plms/s2-39.1.116].]
#bibitem([38])[S.~J.~Patterson, A cubic analogue of the theta series, #emph[J. Reine Angew.
  Math.] #strong[296] (1977), 125--161.
  #link("https://doi.org/10.1515/crll.1977.296.125")[doi:10.1515/crll.1977.296.125].]
#bibitem([39])[I.~Petrow and M.~P.~Young, A generalized cubic moment and the Petersson formula for newforms,
  #emph[Math. Ann.] #strong[373] (2019), nos.~1--2, 287--353.]
#bibitem([40])[I.~Petrow and M.~P.~Young, The Weyl bound for Dirichlet $L$-functions of cube-free conductor,
  #emph[Ann. of Math.] (2) #strong[192] (2020), no.~2, 437--486.
  #link("https://doi.org/10.4007/annals.2020.192.2.3")[doi:10.4007/annals.2020.192.2.3].]
#bibitem([41])[B.~Riemann, Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse, #emph[Monatsber. Königl.
  Preuss. Akad. Wiss. Berlin] (1859), 671--680.
  #link("https://www.maths.tcd.ie/pub/HistMath/People/Riemann/Zeta/")[Original text and English translation].]
#bibitem([42])[K.~A.~Rodosskiı̆, On non-residues and zeros of $L$-functions, #emph[Izv. Akad. Nauk SSSR Ser.
  Mat.] #strong[20] (1956), no.~3, 303--306 (Russian).]
#bibitem([43])[C.~L.~Siegel, Über die Classenzahl quadratischer Zahlkörper, #emph[Acta Arith.] #strong[1] (1935),
  83--86. #link("https://doi.org/10.4064/aa-1-1-83-86")[doi:10.4064/aa-1-1-83-86].]
#bibitem([44])[T.~Tatuzawa, On a theorem of Siegel, #emph[Japan. J. Math.] #strong[21] (1951), 163--178.
  #link("https://doi.org/10.4099/jjm1924.21.0_163")[doi:10.4099/jjm1924.21.0\_163].]
#bibitem([45])[E.~C.~Titchmarsh, A divisor problem, #emph[Rend. Circ. Mat.
  Palermo] #strong[54] (1930), 414--429; correction, #strong[57] (1933), 478--479.
  #link("https://doi.org/10.1007/BF03021203")[doi:10.1007/BF03021203]\;
  #link("https://doi.org/10.1007/BF03017588")[correction].]
#bibitem([46])[C.-J.~de la Vallée Poussin, Recherches analytiques sur la théorie des nombres premiers.
  Première partie: La fonction $zeta \( s \)$ de Riemann et les nombres premiers en général, #emph[Ann. Soc. Sci.
  Bruxelles], deuxième partie, #strong[20] (1896), 183--256.]
#bibitem([47])[C.-J.~de la Vallée Poussin, Sur la fonction $zeta \( s \)$ de Riemann et le nombre des nombres
  premiers inférieurs à une limite donnée, #emph[Mém. Couronnés Autres Mém. Acad. Roy. Sci.
  Lettres Beaux-Arts Belgique], collection in-$8^compose$, #strong[59] (1899), 1--74.
  #link("https://doi.org/10.3406/marb.1899.2449")[doi:10.3406/marb.1899.2449].]
#bibitem([48])[I.~M.~Vinogradov, A new estimate of the function $zeta \( 1 + i t \)$, #emph[Izv. Akad.
  Nauk SSSR Ser. Mat.] #strong[22] (1958), no.~2, 161--164 (Russian).
  #link("https://www.mathnet.ru/eng/im3962")[Math-Net.Ru: im3962].]
#bibitem([49])[I.~M.~Vinogradov, #emph[Selected Works], edited by L.~D.~Faddeev et al., Springer, Berlin, 1985.]
#bibitem([50])[P.~J.~Weinberger, Exponents of the class groups of complex quadratic fields,
  #emph[Acta Arith.] #strong[22] (1973), 117--124.
  #link("https://doi.org/10.4064/aa-22-2-117-124")[doi:10.4064/aa-22-2-117-124].]
#bibitem([51])[A.~Yoshimoto, On the cubic theta function, #emph[Nagoya Math. J.] #strong[105] (1987), 153--167.]
