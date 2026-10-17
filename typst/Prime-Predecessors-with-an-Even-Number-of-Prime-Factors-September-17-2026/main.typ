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

#align(center)[#text(size: 16pt, weight: "bold")[Prime Predecessors with an Even Number of Prime Factors]]
#align(center)[OpenAI]
#align(center)[September 17, 2026]

== 1 Introduction <sec:introduction>

Let $Omega \( n \)$ be the number of prime factors of $n$, counted with multiplicity, and let $omega \( n \)$ count its distinct prime factors. We prove the following affirmative answer to the parity question for predecessors of primes.

#thm([Theorem 1.1.])[
  #emph[There are infinitely many primes $p$ such that $p - 1$ is squarefree and $Omega \( p - 1 \)$ is even. In particular, there are infinitely many such primes under either convention for counting prime factors.]
] <thm:main>

The squarefreeness condition is useful rather than cosmetic: it removes the ambiguity between the two counting conventions. Writing $p = 2 u + 1$, we will construct nonnegative weights on odd integers $u$ for which $Omega \( u \)$ is odd. These weights have enough bilinear distribution to detect prime values of $2 u + 1$, and their nonsquarefree part is negligible at the scale of the detected prime mass.

===== 1.1 Relation to earlier work. <relation-to-earlier-work.>

Prime-factor parity is a classical obstruction in sieve theory: congruence information alone need not distinguish the two Liouville signs. The role of additional bilinear information is illustrated by the asymptotic sieve of Friedlander and Iwaniec [2] Section 1. Work on smooth shifted primes, including Baker and Harman [1] and Lichtman [3], provides related context for imposing multiplicative restrictions on a prime’s predecessor. The parity condition here is a different restriction; we do not deduce it from smoothness alone.

Our structural inputs are the dilation-graph transference, ideal-kernel, weighted-sieve, and proxy estimates of the companion paper #emph[Weighted dilation graphs, smooth shifted primes and totient fibers] [4], hereafter S. Their hypotheses and the conclusions needed here are stated where they enter the proof. We do not reprove those results.

S’s shifted-correlation argument uses a rough integer in a designated long factor slot and unsigned marked weights. Neither smoothness of the predecessor nor that unsigned statement gives the parity conclusion of Theorem 1. The new work is to permit a prime in the long slot and the same group-supported Liouville sign at both endpoints. We prove both extensions here.

===== 1.2 The two analytic extensions. <the-two-analytic-extensions.>

First, a logarithmic-phase estimate gives arbitrary fixed logarithmic cancellation in a prime Dirichlet polynomial of positive-power length at all sufficiently large logarithmic heights up to $x^2$. A quantitative power-sum iteration supplies the weak high-height zero-free strip needed for this estimate. The growing degree and all its constants are kept explicit enough for the application.

Second, the sign of a shared dilation occurs twice in a lifted correlation and cancels by complete multiplicativity. This observation allows the graph reduction to retain a parity-sensitive weight. The comparison terms are controlled by local Fourier energy: a small-prime factor restricts difficult frequencies to a sparse set, the new prime estimate treats its large frequencies, and a prescribed character–Mellin discrepancy treats its small frequencies. The resulting correlation estimate implies a Type II theorem for the nonnegative parity-selecting weight.

The common-sign cancellation and the prime-slot estimate are stated separately, so their use is not tied to the final sieve. In the extraction argument, ordinary congruence distribution handles the initial sieve; the stronger Type II statement justifies replacing prime and roughness indicators by bounded local-density proxies. An upper bound for balanced semiprimes then leaves positive prime mass.

===== 1.3 Organization. <organization.>

Section 2 fixes conventions and records the classical inputs. Section 3 proves the prime-polynomial estimate, Lemma 6, and Section 4 proves the twisted correlation, Theorem 12. Section 5 constructs the weights. Their Type II and congruence distribution are Theorems 20 and 22, proved in Sections 6 and 7. Section 8 extracts the required primes. All auxiliary constants are fixed before $x$ tends to infinity; in particular, the final proxy precision is chosen only after the required discrepancy exponent. We make this order explicit at the steps where it matters.

== 2 Conventions and classical estimates <sec:preliminaries>

Throughout the proof,

$ x arrow.r oo \, #h(2em) L = log x \, #h(2em) T = log L \, #h(2em) W = exp \( sqrt(L) \) \, #h(2em) upright(e) \( t \) = exp \( 2 pi i t \) . $

A logarithmic power always has a fixed exponent, chosen before $x$ tends to infinity. The implied constants may depend on all previously fixed parameters. No effective threshold for $x$ is asserted. The letters $p$ and $q$ in explicitly indicated prime sums range over primes; general factorization variables are positive integers. We put $P^(-) \( 1 \) = oo$, where $P^(-) \( n \)$ is the least prime factor of $n > 1$, and write $tau \( n \)$ for its divisor function. The notation $n asymp Y$ restricts $n$ to a fixed constant enlargement of a dyad $\[ Y \, 2 Y \)$. All such enlargements remain bounded independently of $x$. Dirichlet characters are extended by zero on nonunits.

We use the following classical estimates in the forms recorded in S [4] Section 2. This explicit list fixes their uniformity; it does not require any distribution theorem beyond the stated ranges.

#thm([Proposition 2.1.])[
  (Prime estimates).  #emph[The prime number theorem holds with an error smaller than every fixed negative logarithmic power. Mertens’ estimates give 
$ sum_(p lt.eq y) 1 / p = log log y + O \( 1 \) \, #h(2em) product_(p lt.eq y) (1 - 1 / p) tilde.op frac(e^(- gamma_E), log y) \, $

 where $gamma_E$ is Euler’s constant. For fixed $A \, C > 0$, uniformly for $r lt.eq \( log y \)^C$ and $\( a \, r \) = 1$, the Siegel–Walfisz estimate is 
$ \# { p lt.eq y : p equiv a med \( mod med r \) } = frac("Li" \( y \), phi \( r \)) + O_(A \, C) (frac(y, \( log y \)^A)) . $

 Its constants need not be effective.]
] <pre:primes>

All short intervals used with the prime number theorem have either a fixed logarithmic-length interpretation in a fixed positive-power band, or relative length a fixed negative power of $L$; the absolute error above is made sufficiently small before taking their differences. We never assume a relative prime asymptotic on every arbitrarily short interval.

#thm([Proposition 2.2.])[
  (Large sieve and moment bounds).  #emph[For arbitrary coefficients supported on the integers of an interval of length $H$, 
$ sum_(r lt.eq R) frac(r, phi \( r \)) sum_(chi med mod med r)^(*) lr(|sum_n a_n chi \( n \)|)^2 lt.double \( H + 1 + R^2 \) sum_n \| a_n \|^2 . $

 The asterisk denotes primitive characters. For every fixed integer $k gt.eq 0$ there is $C_k$ such that 
$ sum_(n lt.eq Y) tau \( n \)^k lt.double_k Y \( log \( 2 Y \) \)^(C_k) \, #h(2em) sum_(n lt.eq Y) frac(tau \( n \)^k, n) lt.double_k \( log \( 2 Y \) \)^(C_k) . $

 If $P \( t \) = sum_(n lt.eq Y) c_n n^(i t)$, then on any real interval $I$ of length $H$, 
$ integral_I \| P \( t \) \|^2 thin d t lt.double \( H + Y log \( 2 Y \) \) sum_n \| c_n \|^2 . $

 For a set $cal(T) subset I$ with mutual spacing at least one, 
$ sum_(t in cal(T)) \| P \( t \) \|^2 lt.double \( H + 1 + Y log \( 2 Y \) \) \( log \( 2 Y \) \)^2 sum_n \| c_n \|^2 . $

 The constants in the last two estimates are absolute, independently of how the coefficients were formed.]
] <pre:moments>

These are Theorem 2.3 and Lemmas 2.5–2.6 of S. In particular, the fixed-moment estimate applies to a convolution of a fixed number of logarithmically bounded sequences, giving coefficient-square mass $U L^(O \( 1 \))$ on a dyad of size $U$. With reciprocal-index normalization the bound is $L^(O \( 1 \)) \/ U$. For the one growing power used later, we instead prove a factorial coefficient bound and use the coefficient-independent mean-square inequality.

#thm([Proposition 2.3.])[
  (Derivative tests).  #emph[Let $f$ be real-valued on an interval containing $H$ consecutive integers. If $f'$ is monotone and remains in $\[ j + lambda \, j + 1 - lambda \]$ for an integer $j$ and $0 < lambda lt.eq 1 \/ 2$, then 
$ sum_n upright(e) \( f \( n \) \) lt.double lambda^(- 1) . $

 If instead $f$ is twice continuously differentiable and $lambda lt.eq \| f'' \| lt.eq C lambda$ throughout the interval, then 
$ sum_n upright(e) \( f \( n \) \) lt.double_C H sqrt(lambda) + lambda^(- 1 \/ 2) . $

 Both estimates apply on every subinterval satisfying their hypotheses.]
] <pre:derivatives>

This is the form of S, Lemma 2.7. The distance from integers in the first test is part of the hypothesis, not merely a lower bound on the absolute derivative.

We will repeatedly separate smooth functions in logarithmic coordinates. The following elementary version of S, Lemma 2.8, explains the order in which frequency cutoffs and accuracies may be chosen.

#thm([Lemma 2.4.])[
  (Smooth separation).  #emph[Let $F$ be smooth and supported on a fixed bounded box in $bb(R)^b$, with $b$ fixed. Suppose all derivatives of order $j$ are bounded by $C_j L^(C \( j + 1 \))$. Fourier inversion separates its variables with integrated absolute coefficient mass $L^(O \( 1 \))$. There is a fixed exponent $C' > 0$, depending on $b \, C$, such that truncating each frequency at $L^(C')$ makes an error $O_A \( L^(- A) \)$ for every fixed $A > 0$. The exponent $C'$ is fixed before $A$.]
] <pre:separation>

#proof[
  Integration by parts gives, for each fixed $j$, an integrable tail bounded by a constant times $L^(C \( j + 1 \)) \( 1 + \| xi \| \)^(- j)$. Using a fixed $j > b$ first bounds the full integral by a fixed logarithmic power. Outside $\| xi \| gt.eq L^(C')$ the same calculation gives
  $ O_j #scale(x: 120%, y: 120%)[\(] L^(C \( j + 1 \) - C' \( j - b \)) #scale(x: 120%, y: 120%)[\)] . $
  Fix $C' > C$ and then increase $j$ for any prescribed $A$. The Fourier phase factors into one-dimensional phases. Applied to normalized logarithmic coordinates, these are multiplicative power twists. ◻
]

The fixed-dimension condition in Lemma 5 will not be used with a growing-dimensional box. In the allocation argument there are $O \( T \)$ separate one-dimensional transitions, each with a fixed Fourier integral norm. Their product costs only $exp \( O \( T \) \) = L^(O \( 1 \))$; a telescoping estimate controls their combined tails.

The weighted block sieve and local-density proxies are stated in the prime-extraction section, where their particular coefficient bounds and precision dependence are needed. The generic dilation-graph results are likewise stated at their application in the shifted correlation section. These are the only nonclassical imported ingredients of the proof.

== 3 A long prime polynomial <lp:section>

The correlation argument will require cancellation in a prime polynomial at frequencies as large as $x^2$. We prove the required estimate here, including the dependence on a growing degree in the elementary mean-value argument. Throughout this section, $L = log x$ and $T = log L$.

#thm([Lemma 3.1.])[
  (Long prime polynomial).  #emph[Fix $0 < tau < eta < 1$, $C > 0$, and $A > 0$. There is a constant $B_0 = B_0 \( tau \, eta \, C \, A \)$ such that, uniformly for 
$ x^tau / 2 lt.eq N lt.eq x^eta \, #h(2em) q lt.eq L^C \, #h(2em) L^(B_0) lt.eq \| t \| lt.eq x^2 \, $

 every Dirichlet character $chi$ modulo $q$ and every interval $I subset \[ N \, 2 N \]$ satisfy 
#[#set math.equation(numbering: n => "(3.1)")
 $ lr(|sum_(p in I) chi \( p \) p^(- 1 + i t)|) lt.double_(tau \, eta \, C \, A) L^(- A) . $ <lp:prime-estimate>]

]
] <lp:prime-polynomial>

The proof proceeds from a quantitative power-sum estimate to cancellation for a logarithmic phase, then to a high-height zero-free strip, and finally to primes by Mellin inversion. We first establish a power-sum estimate with sufficient uniformity in its degree. For integers $k gt.eq 2$, $s gt.eq 1$, and $M gt.eq 1$, let $J_(s \, k) \( M \)$ count the solutions of

$ sum_(i = 1)^s u_i^j = sum_(i = 1)^s v_i^j quad \( 1 lt.eq j lt.eq k \) \, #h(2em) 1 lt.eq u_i \, v_i lt.eq M . $

Writing $K = k \( k + 1 \) \/ 2$ and

$ f \( bold(alpha) \) = sum_(n = 1)^M upright(e) #h(-0.16667em) (sum_(j = 1)^k alpha_j n^j) \, $

orthogonality gives $J_(s \, k) \( M \) = integral_(\[ 0 \, 1 \]^k) \| f \( bold(alpha) \) \|^(2 s) thin d bold(alpha)$.

The argument uses the classical Vinogradov mean-value method in Linnik’s $p$-adic form; see Wooley [5] Section 2, pp. 1583–1585 for an exposition. We derive the required degree-uniform quantitative estimate below, without invoking the modern efficient-congruencing theorem of that paper.

#thm([Lemma 3.2.])[
  (A quantitative power-sum bound).  #emph[There are absolute constants $C_1 \, C_2 > 0$ such that, for every integer $k gt.eq 2$, some integer $s$ with $k lt.eq s lt.eq C_1 k^4$ satisfies 
#[#set math.equation(numbering: n => "(3.2)")
 $ J_(s \, k) \( M \) lt.eq exp \( C_1 k^(C_2) \) M^(2 s - K + 1 \/ 100) #h(2em) \( M gt.eq 1 \) . $ <lp:mean-value-bound>]

]
] <lp:mean-value>

#proof[
  We iterate estimates
  #[#set math.equation(numbering: n => "(3.3)")
   $ J_(s \, k) \( M \) lt.eq C_s M^(E_s) \, #h(2em) E_s = 2 s - K + epsilon.alt_s \, $ <lp:inductive-bound>]
  starting with $s = k$, $C_k = 1$, and $epsilon.alt_k = K$. The iteration sends $s$ to $s + k$ and $epsilon.alt_s$ to $\( 1 - 1 \/ k \) epsilon.alt_s$.
  Choose a sufficiently large absolute constant $A_1$. If $M^(1 \/ k) < A_1 k^6$, then $log M lt.double k log \( 2 k \)$, and the trivial bound $J_(u \, k) \( M \) lt.eq M^(2 u)$ costs at most
  #[#set math.equation(numbering: n => "(3.4)")
   $ M^K lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( k^3 log \( 2 k \) \) #scale(x: 120%, y: 120%)[\)] $ <lp:small-M-cost>]
  relative to every proposed estimate with exponent $2 u - K + epsilon.alt$, $epsilon.alt gt.eq 0$. Thus it suffices to treat $M^(1 \/ k) gt.eq A_1 k^6$. The prime number theorem in Proposition 2, after enlarging $A_1$, supplies a fixed list of $2 k^3 + 5$ primes $r$ in $\[ M^(1 \/ k) \, 2 M^(1 \/ k) \]$, all greater than $k$.
  At moment $s + k$, call a tuple degenerate if it has fewer than $k$ distinct coordinates. There are at most $k^(s + k) M^(k - 1)$ such tuples. If $G$ is their exponential sum, its contribution on one side of the equations is at most
  $ integral_(\[ 0 \, 1 \]^k) \| G \| thin \| f \|^(s + k) lt.eq k^(s + k) M^(k - 1) J_(s + k \, k) \( M \)^(1 \/ 2) . $
  The contribution with a degenerate tuple on either side is therefore at most twice this quantity.
  For a nondegenerate solution, select $k$ distinct coordinates on each side and permute them to the first $k$ positions. This costs at most $\( s + k \)^(2 k)$. The product of the two Vandermonde products is a nonzero integer of absolute value at most $M^(k \( k - 1 \))$. Fewer than $k^2 \( k - 1 \) + 1$ primes of size at least $M^(1 \/ k)$ can divide it. Hence some prime $r$ in our list makes these first $k$ coordinates distinct modulo $r$ on each side.
  For such a prime put
  $ F_r \( bold(alpha) \) = sum_(1 lt.eq z_1 \, dots.h \, z_k lt.eq M\
z_i equiv.not z_j med \( mod med r \) med \( i eq.not j \)) upright(e) #h(-0.16667em) (sum_(j = 1)^k alpha_j sum_(i = 1)^k z_i^j) . $
  The relevant number of solutions is bounded by
  $ \( s + k \)^(2 k) sum_r integral_(\[ 0 \, 1 \]^k) \| F_r \|^2 \| f \|^(2 s) . $
  The integrands are nonnegative. Write $f = sum_(a med mod med r) f_a$, where $f_a$ is restricted to $n equiv a med \( mod med r \)$. Hölder’s inequality gives
  $ \| f \|^(2 s) lt.eq r^(2 s - 1) sum_(a med mod med r) \| f_a \|^(2 s) . $
  Fix $a$. In the system counted by $integral \| F_r \|^2 \| f_a \|^(2 s)$, translate all variables by $- a$. Translation preserves the equations for the first $k$ powers by the binomial formula. The remaining $s$ variables on either side are multiples of $r$, so the first lists $bold(z) \, bold(z)'$ obey
  #[#set math.equation(numbering: n => "(3.5)")
   $ sum_(i = 1)^k z_i^j equiv sum_(i = 1)^k \( z'_i \)^j med \( mod med r^j \) #h(2em) \( 1 lt.eq j lt.eq k \) . $ <lp:power-congruences>]
  There are at most $M^k$ choices for the first list. For each such list, there are at most $k ! r^(K - k)$ choices for the second. To see this, lift the prescribed $j$th sum modulo $r^j$ to a residue modulo $r^k$. The number of choices for all lifts is $product_(j = 1)^k r^(k - j) = r^(K - k)$. For each full vector of sums modulo $r^k$, Newton’s identities determine the multiset of roots modulo $r$, since $r > k$. There are at most $k !$ orderings. The Jacobian of the power sums has determinant
  $ k ! product_(i < j) \( z'_j - z'_i \) \, $
  up to sign, and is invertible modulo $r$. Each ordering therefore lifts uniquely from modulus $r$ to modulus $r^k$: at each stage the next digits are the unique solution of the corresponding linear system modulo $r$. Finally, an interval of $M$ integers contains at most one representative of any residue modulo $r^k$, because $M lt.eq r^k$.
  After both first lists are fixed, divide the remaining variables by $r$. They range over a common interval of at most $ceil.l M \/ r ceil.r$ integers and have prescribed differences of power sums. Translation to an initial interval changes only these prescribed differences. The count is a Fourier coefficient of the nonnegative function $\| f \|^(2 s)$ at that shorter length, and consequently is at most $J_(s \, k) \( ceil.l M \/ r ceil.r \)$. Summing over $a$ accounts for the final factor $r$, and gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ J_(s + k \, k) \( M \) & lt.eq 2 k^(s + k) M^(k - 1) J_(s + k \, k) \( M \)^(1 \/ 2)\
 & quad + \( s + k \)^(2 k) \( 2 k^3 + 5 \) k ! max_r r^(2 s + K - k) M^k J_(s \, k) \( ceil.l M \/ r ceil.r \) . $ <lp:recurrence-count>]
  Insert (3.3). Since $E_s gt.eq 0$, rounding costs at most $2^(E_s)$, and the exponent of $r$ becomes
  $ 2 s + K - k - E_s = k^2 - epsilon.alt_s gt.eq 0 . $
  Replacing $r$ by at most $2 M^(1 \/ k)$ therefore gives the exponent
  $ k + E_s + frac(k^2 - epsilon.alt_s, k) = 2 \( s + k \) - K + \( 1 - 1 \/ k \) epsilon.alt_s . $
  The inequality $J lt.eq a sqrt(J) + b$ implies $J lt.eq 2 a^2 + 2 b$. The exponent $2 k - 2$ from $a^2$ is admissible: the target exponent starts at $2 k$, and at each step its increase is $2 k - epsilon.alt_s \/ k gt.eq 2 k - K \/ k > 0$. Thus the asserted iteration holds. Its constants can be chosen with
  $ log C_(s + k) lt.eq log \( 1 + C_s \) + O #h(-0.16667em) (\( s + k \) log \( 2 k \) + k log \( s + k \) + k^3 log \( 2 k \)) \, $
  including (3.4).
  After $O \( k log \( 2 k \) \)$ steps, $epsilon.alt_s = K \( 1 - 1 \/ k \)^(\( s - k \) \/ k) lt.eq 1 \/ 100$. Then $s = O \( k^2 log \( 2 k \) \) lt.eq C_1 k^4$, and summing the displayed costs gives $log C_s lt.eq C_1 k^(C_2)$ for absolute constants. Increasing the exponent from $epsilon.alt_s$ to $1 \/ 100$ proves the Lemma. ◻
]

#thm([Lemma 3.3.])[
  (A logarithmic phase on progressions).  #emph[Fix $C > 0$. There is an absolute constant $C_3 > 0$ such that, for sufficiently large $x$ in terms of $C$, the following holds uniformly: 
$ exp \( L \/ T^2 \) lt.eq N' lt.eq 2 x^5 \, #h(2em) q lt.eq L^C \, #h(2em) exp \( L \/ \( 2 T^2 \) \) lt.eq \| v \| lt.eq 4 x^3 . $

 For every residue $a med \( mod med q \)$ and every interval $I subset \[ N' \, 2 N' \]$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ lr(|sum_(n in I\
n equiv a med \( mod med q \)) n^(i v)|) lt.double N' / q exp \( - L \/ T^(C_3) \) . $ <lp:progression-estimate>]

]
] <lp:log-phase>

#proof[
  Put $H = N' \/ q$ and $y = log \| v \| \/ log H$. Then
  #[#set math.equation(numbering: n => "(3.8)")
   $ log H gt.eq L \/ T^2 - C T gt.double L \/ T^2 \, #h(2em) y lt.double T^2 . $ <lp:phase-scales>]
  Writing $n = q \( b + a \/ q \)$, with $0 lt.eq a < q$, reduces the sum, up to a factor of modulus one, to $sum_(b in cal(I)) \( b + a \/ q \)^(i v)$, where $cal(I)$ is an interval of integers and $H lt.eq b + a \/ q lt.eq 2 H$.
  If $y < 4 \/ 5$, the derivative of $v log \( b + a \/ q \) \/ \( 2 pi \)$ is monotone, has magnitude comparable to $\| v \| \/ H$, and has magnitude less than $1 \/ 2$. The monotone first derivative estimate in Proposition 4 therefore bounds the sum by $O \( H \/ \| v \| \)$. The lower bound on $\| v \|$ makes this smaller than (3.7).
  Suppose now that $y gt.eq 4 \/ 5$. Set
  $ M = floor.l H^(3 \/ 4) floor.r \, #h(2em) k = ceil.l 4 y + 8 ceil.r . $
  Averaging the sum over forward shifts $1 lt.eq h lt.eq M$ changes it by $O \( M \)$: a shift changes an interval at only $O \( h \)$ endpoints. For $b in cal(I)$, Taylor expansion gives
  $ frac(v, 2 pi) log \( b + h + a \/ q \) = frac(v, 2 pi) log \( b + a \/ q \) + sum_(j = 1)^k alpha_j \( b \) h^j + O \( H^(- 2) \) \, #h(2em) alpha_j \( b \) = frac(\( - 1 \)^(j - 1) v, 2 pi j \( b + a \/ q \)^j) . $
  Indeed the remainder is $O \( \| v \| \( M \/ H \)^(k + 1) \) = O \( H^(y - \( k + 1 \) \/ 4) \) = O \( H^(- 9 \/ 4) \)$, uniformly even as $k$ grows. Thus, with
  $ S \( bold(alpha) \) = sum_(h = 1)^M upright(e) #h(-0.16667em) (sum_(j = 1)^k alpha_j h^j) \, $
  the original sum is bounded by
  #[#set math.equation(numbering: n => "(3.9)")
   $ 1 / M sum_(b in cal(I)) \| S \( bold(alpha) \( b \) \) \| + O \( M + H^(- 1) \) . $ <lp:shifted-phase>]
  Partition the coefficient torus $\[ 0 \, 1 \)^k$ into boxes with side length $M^(- j)$ in coordinate $j$. Each box contains at most
  #[#set math.equation(numbering: n => "(3.10)")
   $ exp \( O \( k \) \) H^(4 \/ 5) $ <lp:occupancy>]
  of the vectors $bold(alpha) \( b \) med \( mod med 1 \)$. For this it suffices to use the coordinate $j = ceil.l y + 3 \/ 20 ceil.r$, which lies between $1$ and $k$. Before reduction modulo one, this coordinate has magnitude $O \( H^(- 3 \/ 20) \)$, is monotone, and has derivative of magnitude at least
  $ frac(\| v \|, 2 pi \( 2 H \)^(j + 1)) gt.eq exp \( - O \( k \) \) H^(y - j - 1) . $
  A coordinate interval of length $M^(- j)$ on the torus pulls back to at most two intervals in $b$. Their total length is at most $exp \( O \( k \) \) H^(1 + j \/ 4 - y)$. Here the floor in $M$ costs $exp \( O \( k \) \)$, while
  $ y - j / 4 gt.eq frac(3 y, 4) - 23 / 80 gt.eq 5 / 16 > 1 / 5 . $
  Counting integer points proves (3.10).
  Let $s$ be supplied by Lemma 7. We also need the following bound for suprema over boxes $Q$:
  #[#set math.equation(numbering: n => "(3.11)")
   $ sum_Q sup_(bold(alpha) in Q) \| S \( bold(alpha) \) \|^(2 s) lt.eq exp \( O \( s k + k \) \) M^K J_(s \, k) \( M \) . $ <lp:box-supremum>]
  To prove it, rescale each box to $\[ 0 \, 1 \]^k$. Iterating the one-dimensional fundamental theorem of calculus gives, for any smooth function $F$ on that cube,
  $ sup \| F \| lt.eq sum_(bold(epsilon.alt) in { 0 \, 1 }^k) integral_(\[ 0 \, 1 \]^k) \| partial^(bold(epsilon.alt)) F \| . $
  Hölder’s inequality bounds the $2 s$th power of the right-hand side by $2^(k \( 2 s - 1 \))$ times the sum of the corresponding $2 s$th moments. For the rescaled $S$, every mixed derivative has coefficients bounded in modulus by $\( 2 pi \)^k$: each differentiation in coordinate $j$ introduces the factor $2 pi i h^j \/ M^j$. On summing over the boxes, change of variables contributes $M^K$. Orthogonality then bounds the full-torus moment of every such derivative by $\( 2 pi \)^(2 s k) J_(s \, k) \( M \)$. This proves (3.11), with constants controlled at the growing degree.
  Apply Hölder’s inequality to the sum in (3.9), and use (3.10), (3.11), and (3.2). Since $\| cal(I) \| lt.double H$, the result is
  #[#set math.equation(numbering: n => "(3.12)")
   $ 1 / M sum_(b in cal(I)) \| S \( bold(alpha) \( b \) \) \| lt.double H (exp \( O \( k^(C_4) \) \) H^(- 1 \/ 5) M^(1 \/ 100))^(1 \/ \( 2 s \)) $ <lp:phase-final-bound>]
  for an absolute constant $C_4$. We have $k lt.double T^2$ and $s lt.double T^8$, whereas
  $ - 1 / 5 log H + 1 / 100 log M lt.eq - 77 / 400 log H . $
  Every fixed power of $T$ is $o \( L \/ T^2 \)$. Thus the right-hand side of (3.12) is at most $H exp \( - c_1 L \/ T^10 \)$ for some absolute $c_1 > 0$, once $x$ is sufficiently large. The errors in (3.9) are smaller. Increasing a fixed exponent $C_3 > 10$ absorbs $c_1$ and proves the Lemma. ◻
]

We write $D \( s \, chi \)$ for the Dirichlet $L$-function, to distinguish it from $L = log x$. Characters need not be primitive. Periodicity gives $sum_(n lt.eq u) chi \( n \) = c_chi u + O \( q \)$, where $c_chi = q^(- 1) sum_(a med mod med q) chi \( a \)$. Partial summation therefore continues $D \( s \, chi \)$ meromorphically to $"Re" s > 0$, with only the possible simple pole at $s = 1$, and gives, for $sigma = "Re" s$ in a fixed compact subinterval of $\( 0 \, oo \)$,

#[#set math.equation(numbering: n => "(3.13)")
 $ D \( s \, chi \) = sum_(n lt.eq Y) frac(chi \( n \), n^s) + frac(c_chi Y^(1 - s), s - 1) + O #scale(x: 120%, y: 120%)[\(] q \( 1 + \| s \| \) Y^(- sigma) #scale(x: 120%, y: 120%)[\)] . $ <lp:L-tail>]

#thm([Lemma 3.4.])[
  (A bound near the line $"Re" s = 1$).  #emph[Fix $C > 0$ and put $r_(*) = T^4 \/ L$. Uniformly for $q lt.eq L^C$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ log \| D \( sigma + i v \, chi \) \| lt.double_C T^2 quad (\| sigma - 1 \| lt.eq 10 r_(*) \, quad 1 / 2 lt.eq \| v \| lt.eq 3 x^3) . $ <lp:L-upper-bound>]

]
] <lp:L-upper>

#proof[
  First suppose $\| v \| lt.eq exp \( L \/ \( 2 T^2 \) \)$, and use $Y = exp \( 2 L \/ T^2 \)$ in (3.13). Absolute summation gives
  $ sum_(n lt.eq Y) n^(- sigma) lt.double \( 1 + log Y \) max \( 1 \, Y^(1 - sigma) \) lt.eq exp \( O \( T^2 \) \) . $
  Since $\| s - 1 \| gt.eq 1 \/ 2$, the pole term has the same bound. The error is at most
  $ exp (- frac(3 L, 2 T^2) + O \( T^2 + C T \)) \, $
  and hence is negligible.
  For $exp \( L \/ \( 2 T^2 \) \) < \| v \| lt.eq 3 x^3$, take $Y = x^5$. The terms with $n lt.eq exp \( L \/ T^2 \)$ again contribute $exp \( O \( T^2 \) \)$ in absolute value. On a dyadic interval above this threshold, sum (3.7), with phase $- v$, over the residue classes modulo $q$, including their character coefficients. The factors $q$ and $1 \/ q$ cancel. Partial summation with $n^(- sigma)$ bounds that dyad by
  $ exp \( - L \/ T^(C_3) \) exp \( O \( T^4 \) \) . $
  There are $O \( L \)$ dyads, and the same bound applies to a final partial dyad. Their total is negligible, since $L \/ T^(C_3)$ exceeds every fixed power of $T$. Finally, the pole term and remainder in (3.13) are bounded respectively by
  $ exp (- frac(L, 2 T^2) + O \( T^4 \)) \, #h(2em) exp #scale(x: 120%, y: 120%)[\(] - 2 L + O \( T^4 + C T \) #scale(x: 120%, y: 120%)[\)] . $
  This proves (3.14). ◻
]

#thm([Lemma 3.5.])[
  (Local logarithmic derivative).  #emph[Fix $C > 0$, let $q lt.eq L^C$, and put $s_0 = 1 + r_(*) + i v$, where $1 lt.eq \| v \| lt.eq 5 / 2 x^3$. There is a radius $R$ with $4 r_(*) lt.eq R lt.eq 5 r_(*)$, with no zero on its boundary, for which 
#[#set math.equation(numbering: n => "(3.15)")
 $ D' / D \( s \, chi \) = sum_(\| rho - s_0 \| < R) frac(1, s - rho) + O_C \( T^2 \/ r_(*) \) #h(2em) \( \| s - s_0 \| lt.eq 2 r_(*) \) \, $ <lp:local-log-derivative-formula>]

 away from zeros. The sum counts zeros with multiplicity and has $O_C \( T^2 \)$ terms.]
] <lp:local-log-derivative>

#proof[
  For large $x$, the disk $\| s - s_0 \| lt.eq 8 r_(*)$ avoids the possible pole at $s = 1$ and lies in the region of Lemma 9. At its center the Euler product gives
  $ \| D \( s_0 \, chi \) \| gt.eq product_p \( 1 + p^(- 1 - r_(*)) \)^(- 1) = frac(zeta \( 2 + 2 r_(*) \), zeta \( 1 + r_(*) \)) gt.double r_(*) . $
  Thus $log \| D \( s_0 \, chi \) \| gt.eq - O \( T \)$. Jensen’s formula, using the radius $8 r_(*)$ and the upper bound $O_C \( T^2 \)$, shows that the disk of radius $5 r_(*)$ contains $O_C \( T^2 \)$ zeros. Choose $R in \[ 4 r_(*) \, 5 r_(*) \]$ so that none lies on its boundary.
  Use centered coordinates $z = s - s_0$, and write $a = rho - s_0$ for each zero in $\| z \| < R$. Divide $D \( s_0 + z \, chi \)$ by the disk Blaschke factors
  $ B_a \( z \) = frac(R \( z - a \), R^2 - overline(a) z) \, $
  repeated with multiplicity. The quotient $G$ is holomorphic and nonvanishing on the closed disk, and has the same boundary modulus as $D$. Maximum modulus gives $log \| G \| lt.eq M_0$ throughout the disk for some $M_0 = O_C \( T^2 \)$. Since $\| B_a \( 0 \) \| < 1$, $log \| G \( 0 \) \| gt.eq - O \( T \)$.
  Let $h$ be an analytic logarithm of $G$. The positive harmonic function $M_0 - "Re" h$ has value $O_C \( T^2 \)$ at the center. The Poisson formula, or its derivative together with Harnack’s inequality on concentric disks, gives
  $ \| h' \( z \) \| lt.double_C T^2 \/ r_(*) #h(2em) \( \| z \| lt.eq 2 r_(*) \) . $
  Restoring the factors uses
  $ B'_a / B_a \( z \) = frac(1, z - a) + frac(overline(a), R^2 - overline(a) z) . $
  The second term is $O \( 1 \/ r_(*) \)$ on $\| z \| lt.eq 2 r_(*)$, uniformly in $\| a \| < R$. There are $O_C \( T^2 \)$ such terms, giving exactly (3.15). ◻
]

#thm([Lemma 3.6.])[
  (A zero-free strip at large height).  #emph[For each fixed $C > 0$ there is $c = c \( C \) > 0$ such that every character of modulus at most $L^C$ has no zero in 
#[#set math.equation(numbering: n => "(3.16)")
 $ "Re" s gt.eq 1 - c T^2 \/ L \, #h(2em) 1 lt.eq \| "Im" s \| lt.eq x^3 . $ <lp:zero-free-region>]

 Moreover, 
#[#set math.equation(numbering: n => "(3.17)")
 $ lr(|D' / D \( s \, chi \)|) lt.double_C L quad (1 - frac(c T^2, 2 L) lt.eq "Re" s lt.eq 1 + 1 / L \, quad 2 lt.eq \| "Im" s \| lt.eq x^3 / 2) . $ <lp:log-derivative-bound>]

]
] <lp:zero-free>

#proof[
  For $sigma > 1$, the Euler products and the inequality $3 + 4 cos theta + cos \( 2 theta \) = 2 \( 1 + cos theta \)^2 gt.eq 0$ give
  #[#set math.equation(numbering: n => "(3.18)")
   $ 0 lt.eq - 3 zeta' / zeta \( sigma \) - 4 "Re" D' / D \( sigma + i v \, chi \) - "Re" D' / D \( sigma + 2 i v \, chi^2 \) . $ <lp:trigonometric-positivity>]
  Indeed this follows term by term in the absolutely convergent prime-power expansions; primes dividing the modulus contribute only the positive zeta term. Also $- zeta' \/ zeta \( sigma \) = 1 \/ \( sigma - 1 \) + O \( 1 \)$ near $1$.
  Suppose $rho = beta + i v$ were a zero in (3.16), and set $sigma = 1 + 20 c T^2 \/ L$. Apply Lemma 10 at heights $v$ and $2 v$. The evaluation points lie in the respective inner disks, and $rho$ lies in the first zero sum, because $T^2 \/ L = o \( r_(*) \)$. No zero has real part greater than $1$, by the absolutely convergent Euler product. All terms in the zero sums therefore contribute nonpositively to the negative real logarithmic derivatives. Retaining the term at $rho$, and using $0 < sigma - beta lt.eq 21 c T^2 \/ L$, bounds the right-hand side of (3.18) by
  $ (frac(3, 20 c) - frac(4, 21 c) + O_C \( 1 \)) L / T^2 = (- frac(17, 420 c) + O_C \( 1 \)) L / T^2 . $
  Here the errors are $O_C \( T^2 \/ r_(*) \) = O_C \( L \/ T^2 \)$. Choosing a sufficiently small fixed $c > 0$ gives a contradiction.
  For $s$ in the region of (3.17), apply the local formula centered at $1 + r_(*) + i "Im" s$. Every zero in its sum has absolute imaginary part between $1$ and $x^3$, since $2 lt.eq \| "Im" s \| lt.eq x^3 \/ 2$ and $r_(*) = o \( 1 \)$. By (3.16), its horizontal distance from $s$ is at least $c T^2 \/ \( 2 L \)$. The $O_C \( T^2 \)$ zero terms and the local error therefore total $O_C \( L \)$, proving (3.17). ◻
]

#proof[
  We first establish the analogous bound with the von Mangoldt weight. Let $delta = L^(- A - 4)$. Smooth the indicator of $I \/ N subset \[ 1 \, 2 \]$ by convolution with a nonnegative smooth kernel of width $delta$. This gives $0 lt.eq g lt.eq 1$, supported in $\[ 1 \/ 2 \, 3 \]$, whose difference from the indicator is supported within $O \( delta \)$ of its endpoints, and with $parallel g^(\( j \)) parallel_oo lt.double_j delta^(- j)$. The construction also applies when $I$ is shorter than $delta N$. Since $Lambda \( n \) lt.eq log n$, the error in replacing the interval by $g \( n \/ N \)$ is
  #[#set math.equation(numbering: n => "(3.19)")
   $ O #h(-0.16667em) (\( delta N + 1 \) frac(log \( 3 N \), N)) = O \( L^(- A - 2) \) \, $ <lp:smoothing-error>]
  uniformly in $I$.
  Define the Mellin transform by
  $ hat(g) \( z \) = integral_0^oo g \( w \) w^z thin frac(d w, w) . $
  On every fixed bounded real-part strip, integration by parts gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ \| hat(g) \( u + i v \) \| lt.double_j L^(\( j + 1 \) \( A + 5 \)) \( 1 + \| v \| \)^(- j) . $ <lp:mellin-decay>]
  Also $\| hat(g) \( u + i v \) \| lt.double 1$ there, by absolute integration. Mellin inversion and the absolutely convergent logarithmic derivative on $"Re" z = 1 \/ L$ yield
  #[#set math.equation(numbering: n => "(3.21)")
   $ sum_n Lambda \( n \) chi \( n \) n^(- 1 + i t) g \( n \/ N \) = frac(1, 2 pi i) integral_(1 \/ L - i oo)^(1 \/ L + i oo) hat(g) \( z \) N^z (- D' / D \( 1 - i t + z \, chi \)) d z . $ <lp:mellin-inversion>]
  On this full line, absolute convergence gives
  $ lr(|D' / D \( 1 + 1 \/ L + i u \, chi \)|) lt.eq sum_n frac(Lambda \( n \), n^(1 + 1 \/ L)) = - zeta' / zeta \( 1 + 1 \/ L \) lt.double L \, $
  at every height $u$.
  Choose a fixed $C_5 > A + 6$ and put $H_0 = L^(C_5)$. Then choose a fixed integration-by-parts order $j$ large enough that (3.20) makes the two tails with $\| "Im" z \| > H_0$ in (3.21) $O \( L^(- A - 2) \)$. Explicitly their bound is
  $ O_j #h(-0.16667em) (L^(1 + \( j + 1 \) \( A + 5 \)) H_0^(1 - j)) \, $
  since $N^(1 \/ L) lt.double 1$. Fix $B_0 > C_5 + 2$. For $L^(B_0) lt.eq \| t \| lt.eq x^2$, every point in the rectangle
  $ - frac(c T^2, 2 L) lt.eq "Re" z lt.eq 1 / L \, #h(2em) \| "Im" z \| lt.eq H_0 $
  has
  #[#set math.equation(numbering: n => "(3.22)")
   $ 2 lt.eq \| - t + "Im" z \| lt.eq x^2 + H_0 < x^3 / 2 $ <lp:contour-heights>]
  for large $x$. Thus Lemma 11 applies throughout the rectangle. There are no zeros or poles of the logarithmic derivative inside it; in particular, the possible principal-character pole at $z = i t$ is outside it.
  Shift the truncated contour to $"Re" z = - c T^2 \/ \( 2 L \)$. The horizontal edges are $O \( L^(- A - 2) \)$, by (3.17) and (3.20), increasing the already fixed order $j$ if necessary. On the new vertical segment,
  $ \| N^z \| = exp (- frac(c T^2 log N, 2 L)) lt.double exp \( - c tau T^2 \/ 2 \) . $
  Its remaining factors and length cost at most a fixed power of $L$. Since $exp \( - c tau T^2 \/ 2 \)$ is smaller than every prescribed fixed power of $L^(- 1)$, the shifted integral is $O \( L^(- A - 2) \)$. Together with (3.19), this proves, uniformly for all subintervals $I subset \[ N \, 2 N \]$,
  #[#set math.equation(numbering: n => "(3.23)")
   $ sum_(n in I) Lambda \( n \) chi \( n \) n^(- 1 + i t) lt.double L^(- A - 2) . $ <lp:mangoldt-estimate>]
  Prime powers of exponent at least two contribute in absolute value at most $O \( N^(- 1 \/ 2) \( log \( 3 N \) \)^2 \)$: there are $O \( sqrt(N) log \( 3 N \) \)$ possible bases and exponents with $N lt.eq p^a lt.eq 2 N$, and every summand has size $O \( log \( 3 N \) \/ N \)$. This is smaller than every fixed power of $L^(- 1)$ in the present range. Removing them from (3.23) gives the same uniform bound for $sum_(p in I) \( log p \) chi \( p \) p^(- 1 + i t)$. Finally, partial summation against $1 \/ log u$, whose value and total variation on $\[ N \, 2 N \]$ are $O_tau \( 1 \/ L \)$, removes the logarithmic weight and proves (3.1). ◻
]

== 4 A prime-slot shifted correlation with a common parity twist <sh:section>

We prove the shifted-correlation estimate needed below. The graph transference and residual ideal operator are imported from [4]; the replacement of a long rough-integer factor by a prime factor, and the common parity twist, are proved here.

=== 4.1 Groups, marked weights, and the assertion <groups-marked-weights-and-the-assertion>

Fix

$ 0 < a < b < c < d < 0.47 \, #h(2em) c_0 \, C_0 \, v_(-) \, v_(+) > 0 \, #h(2em) 0 < q_0 < 1 \, #h(2em) ell gt.eq 1 . $

The integer $ell$ is fixed. Let $cal(S) \, cal(B)$ index pairwise disjoint groups of primes $cal(P)_g$, with

#[#set math.equation(numbering: n => "(4.1)")
 $ c_0 T lt.eq \| cal(S) \| \, \| cal(B) \| lt.eq C_0 T \, #h(2em) v_(-) lt.eq V_g := sum_(p in cal(P)_g) 1 / p lt.eq v_(+) \,\
cal(P)_g subset \[ exp \( L^a \) \, exp \( L^b \) \] quad \( g in cal(S) \) \, #h(2em) cal(P)_g subset \[ exp \( L^c \) \, exp \( L^d \) \] quad \( g in cal(B) \) . $ <sh:groups>]

Each big group is the set of all primes in an interval. Put $cal(P) = union.big_g cal(P)_g$, $s_P = \| cal(S) \| + \| cal(B) \|$, and, for $n gt.eq 1$,

$ n_(*) = product_(p in.not cal(P)) p^(v_p \( n \)) \, #h(2em) omega_g \( n \) = sum_(p in cal(P)_g) upright(bold(1))_(p divides n) \, #h(2em) omega_P \( n \) = sum_g omega_g \( n \) . $

For the graph definitions below, extend $omega_g$ and $omega_P$ to all $n in bb(Z)$ by these same divisibility formulas, including the convention that every prime divides zero. For a vector $upright(bold(t)) = \( t_g \)$ of nonnegative integers define

#[#set math.equation(numbering: n => "(4.2)")
 $ W_(upright(bold(t))) \( n \) = q_0^(omega_P \( n \) - sum_g t_g) product_g frac(\( omega_g \( n \) \)_(t_g), V_g^(t_g)) \, #h(2em) W_ell = W_(\( ell \, dots.h \, ell \)) . $ <sh:marked-weight>]

Here $\( u \)_t = u \( u - 1 \) dots.h.c \( u - t + 1 \)$, and $\( u \)_0 = 1$. An ordered marked list has $t_g$ distinct prime divisors from each $cal(P)_g$. If $upright(bold(b))$ is a function of these lists, define

$ W_(upright(bold(t)))^(upright(bold(b))) \( n \) = q_0^(omega_P \( n \) - sum_g t_g) product_g V_g^(- t_g) sum_(upright("marked lists at ") n) upright(bold(b)) . $

Equivalently, this is $W_(upright(bold(t))) \( n \)$ times the average of $upright(bold(b))$ over its lists, with value zero when no such list exists. If $t_g lt.eq t_max$ and $\| upright(bold(b)) \| lt.eq 1$, then

#[#set math.equation(numbering: n => "(4.3)")
 $ \| W_(upright(bold(t)))^(upright(bold(b))) \( n \) \| lt.eq W_(upright(bold(t))) \( n \) lt.eq L^(C \( t_max \)) . $ <sh:weight-bound>]

Indeed $q_0^(u - t) \( u \)_t V_g^(- t)$ is bounded uniformly in integers $u gt.eq t$, with a bound depending only on $t_max$ and the fixed group data, and there are $O \( T \)$ groups.

Use the same choice at both endpoints in

#[#set math.equation(numbering: n => "(4.4)")
 $ epsilon \( n \) = 1 quad upright("or") quad epsilon \( n \) = \( - 1 \)^(sum_(p in cal(P)) v_p \( n \)) . $ <sh:sign>]

In either case $epsilon$ is completely multiplicative, real, and of modulus one. An invariant endpoint core has the form

#[#set math.equation(numbering: n => "(4.5)")
 $ F \( n \) = sum_(m p r = n_(*)) alpha_m chi_0 \( m \) m^(i sigma_0) upright(bold(1))_(p in I_p \, med p med upright("prime")) p^(i sigma_1) c_r . $ <sh:core>]

Fix $0 < tau < eta < 1 \/ 4$. Here $I_p subset \[ x^tau \, x^eta \]$ is an interval, $\| alpha_m \| \, \| c_r \| lt.eq L^C$, $alpha_m = 0$ unless $P^(-) \( m \) > W$, and the modulus of $chi_0$ and $\| sigma_0 \| \, \| sigma_1 \|$ are at most $L^C$. The constants in this section may depend on these fixed bounds. The word invariant refers to the identity $F \( v n \) = F \( n \)$ whenever $v_(*) = 1$.

#thm([Theorem 4.1.])[
  (Twisted prime-slot correlation).  #emph[Let $F \, G$ have the form (4.5), with possibly different coefficients, characters, intervals, and frequencies, subject to fixed bounds as above. For every fixed $D_0 > 0$ there is a fixed $B > 0$ with the following property. Suppose that the sequence $alpha$ in $F$ satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ lr(|sum_(m in I) alpha_m chi \( m \) m^(- 1 + i t)|) lt.eq L^(- B) quad vec(I subset \[ 1 \, x^2 \] upright(" an interval") \,, mod \( chi \) lt.eq L^B \, quad \| t \| lt.eq L^B) . $ <sh:discrepancy>]

 There is no discrepancy requirement on $G$. Uniformly for $x L^(- C) lt.eq Z lt.eq x L^C$, integers $0 < \| k \| lt.eq L^C$, $\| a_1 \| \, \| a_2 \| lt.eq L^C$, and smooth functions $psi$ supported in a fixed compact subinterval of $\( 0 \, oo \)$ with $parallel psi^(\( j \)) parallel_oo lt.double_j L^(C \( j + 1 \))$, one has 
#[#set math.equation(numbering: n => "(4.7)")
 $ sum_(z > 0\
z + k > 0) frac(psi \( z \/ Z \), z) z^(i a_1) \( z + k \)^(i a_2) overline(F \( z \)) G \( z + k \) W_ell \( z \) W_ell \( z + k \) epsilon \( z \) epsilon \( z + k \) lt.double L^(- D_0) . $ <sh:correlation-bound>]

 The exponent $B$ depends only on $D_0$ and the displayed fixed data.]
] <sh:correlation>

The proof uses a residual operator made up of one raw term and signed comparison terms. Transference makes the residual pairing small; after the shared dilation is removed, the raw term is the correlation in (4.7), because the common sign cancels. Each comparison has two independent large free products, allowing a Fourier estimate. We will bound these comparisons and subtract them from the residual pairing.

=== 4.2 The graph inputs <the-graph-inputs>

We give the operator definitions to specify their normalizations. For a sufficiently large fixed integer $J$, put $M = J + ell$ and $mu_g \( p \) = 1 \/ \( p V_g \)$. A pattern $nu$ specifies $C_g subset { 1 \, dots.h \, J }$ with $C_g = diameter$ in small groups and $\| C_g \| lt.eq m_0$ in big groups. Put $t_g = ell + \| C_g \|$. The first $J$ slots outside $C_g$ are shared between the endpoints. To form the dilation $D$, take their labels and independent auxiliary labels of law $mu_g$ in the slots of $C_g$. Thus $D$ contains $J$ labels from each group, counted with multiplicity. The coefficient $K_nu$ may depend only on the ordered big-group source and target labels and the auxiliary big-group free labels.

A physical state at $n in bb(Z)$ consists of $M$ ordered, distinct divisors from each group. Each state has mass $product_g V_g^(- M)$, with counting measure in $n$. For a row transition from $n$ to $n' = n + k D$, retain the shared labels and sum over all physical target lists with coefficient $product_g V_g^(- t_g)$. Auxiliary free labels are forbidden from both endpoint lists; they may coincide with one another. The row multiplier is

#[#set math.equation(numbering: n => "(4.8)")
 $ K_nu D^(i zeta) q_0^(\( omega_P \( n \) - M s_P \) \/ 2) q_0^(\( omega_P \( n' \) - M s_P \) \/ 2) . $ <sh:physical-multiplier>]

The operator $cal(A)_zeta$ is the sum of these row operations, averaged over independent permutations of the $M$ slots in every group at each endpoint. In particular the joint normalization of the two lists in group $g$ is $V_g^(- M - t_g)$.

The ideal operator acts on the probability space of the ordered big-group lists, with independent coordinates of law $mu_g$; repetitions are permitted. It retains the same shared slots and samples both the unshared target slots and the auxiliary slots independently. If $D_(cal(B))$ is the big-group part of $D$, its multiplier is $K_nu D_(cal(B))^(i zeta) upright(e) \( Theta D_(cal(B)) \)$. The sum, symmetrized at both ends, is $cal(T)_zeta \( Theta \)$.

#thm([Proposition 4.2.])[
  (Transference input).  #emph[The following are the Local Transference Theorem, its Endpoint Pairing Corollary, and the Absolute Physical Bounds Lemma of [4] Section 3, Theorem 3.5, Corollary 3.11, and Lemma 3.4. Assume $sum_nu sup \| K_nu \| lt.eq L^(C_1)$, where $m_0 \, C_1$ are fixed independently of $J$. For every fixed $E > 0$ there is an $E_(upright("id")) > 0$, depending only on $E$ and the group data, such that 
$ sup_(Theta in bb(R)) parallel cal(T)_zeta \( Theta \) parallel_(2 arrow.r 2) lt.eq L^(- E_(upright("id"))) $

 implies the following conclusion for all sufficiently large fixed $J$. Let $I = \[ X \, 2 X \)$ with $x^gamma lt.eq X lt.eq x^(1 \/ gamma)$ for some fixed $gamma > 0$. If $f$ is supported on positions in $I$, is independent of the chosen marks, and 
$ sup \| f \| lt.eq exp \( O \( sqrt(L) \) \) \, #h(2em) parallel f parallel \, parallel g parallel lt.eq X^(1 \/ 2) L^(C_3) \, $

 then 
#[#set math.equation(numbering: n => "(4.9)")
 $ \| chevron.l f \, cal(A)_zeta g chevron.r \| lt.double X L^(- E + 2 C_3) . $ <sh:pairing>]

 The lower bound for $J$ may depend on $m_0 \, C_1$; the threshold for $x$ may also depend on $J$, the fixed exponent bounding $\| k \|$, and $gamma$. There is no additional restriction on $zeta$ beyond the ideal norm hypothesis. The operator obtained by taking absolute values of all transition coefficients has row and column sums at most $L^(C_(upright("abs")))$, with $C_(upright("abs"))$ independent of $J$.]
] <sh:transference>

#thm([Proposition 4.3.])[
  (Residual ideal family and comparison kernels).  #emph[The following are the Residual Ideal Operator Theorem and Comparison Kernel Lemma of [4] Section 4, Theorem 4.1 and Lemma 4.3. For every prescribed $E_(upright("id")) > 0$ and fixed $C_4 gt.eq 0$, there are fixed $m_0 \, J_0 \, C_1$ such that, for each fixed $J gt.eq J_0$, a family consisting of the raw pattern $C_g = diameter$, $K_0 = 1$, and signed comparison patterns satisfies 
#[#set math.equation(numbering: n => "(4.10)")
 $ sum_nu sup \| K_nu \| lt.eq L^(C_1) \, #h(2em) sup_(Theta in bb(R)\
\| zeta \| lt.eq L^(C_4)) parallel cal(T)_zeta \( Theta \) parallel_(2 arrow.r 2) lt.eq L^(- E_(upright("id"))) . $ <sh:ideal-bound>]

 The family is independent of the individual values of $Theta \, zeta$, and all its defining parameters are independent of $J$.]
  #emph[Split the big groups into two blocks. Every comparison frees nonempty sets of probes $A \, B$ in the respective blocks and has coefficient 
#[#set math.equation(numbering: n => "(4.11)")
 $ - \( - 1 \)^(\| A \| + \| B \|) cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) . $ <sh:comparison-kernel-product>]

 Here $D_A \, D_B$ are the free products, $X_A$ is the corresponding target-mark product, and $X_B$ the corresponding source-mark product. No shared label or final $ell$ mark enters these kernels. For a slot set $Lambda$, their exact form is 
#[#set math.equation(numbering: n => "(4.12)")
 $ cal(K)_Lambda \( D \, X \) = sum_(j : nu_(Lambda j) gt.eq xi) frac(upright(bold(1))_(log D in I_j) upright(bold(1))_(log X in I_j), nu_(Lambda j)) sum_(chi med upright("primitive")\
"cond" \( chi \) lt.eq Q) overline(chi \( D \)) chi \( X \) \, quad I_j = \[ j h \, \( j + 1 \) h \) \, $ <sh:kernel>]

 where $nu_(Lambda j)$ is the probability of the indicated cell under the independent slot laws. The quantities $Q \, h^(- 1) \, xi^(- 1)$ are fixed powers of $L$, with $h lt.eq 1$. There are at most $Q^2$ characters and $O_(m_0) \( 1 + T L^d \/ h \)$ nonempty cells, and 
$ sup \| cal(K)_Lambda \| lt.eq Q^2 xi^(- 1) \, #h(2em) sup_X bb(E)_D \| cal(K)_Lambda \( D \, X \) \| lt.eq Q^2 . $

 More precisely, the parameters can be chosen, independently of $J$, so that for any fixed $A_0 > 0$, any tuple tests $f \( X_B \) \, g \( X_A \)$, and every $theta in bb(R)$, $\| zeta \| lt.eq L^(C_4)$, 
#[#set math.equation(numbering: n => "(4.13)")
 $ \| bb(E) thin overline(f \( X_B \)) g \( X_A \) #scale(x: 120%, y: 120%)[\[] & \( X_A X_B \)^(i zeta) upright(e) \( theta X_A X_B \)\
 & - cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) \( D_A D_B \)^(i zeta) upright(e) \( theta D_A D_B \) #scale(x: 120%, y: 120%)[\]] \| lt.eq L^(- A_0) parallel f parallel_2 parallel g parallel_2 . $ <sh:comparison-contract>]

 All four label tuples in this expectation are independent. The tests need not be functions only of their products. Expanding the two kernels in (4.11), including all patterns, has total coefficient mass and number of terms bounded by fixed powers of $L$.]
] <sh:ideal>

These are precisely the graph inputs we use. In particular, (4.12) consists of two global character and cell expansions, not one expansion for each group.

=== 4.3 Endpoint norms and removal of the shared dilation <endpoint-norms-and-removal-of-the-shared-dilation>

We now prove Theorem 12 using these contracts. Write $tau \( v \)$ for the divisor-counting function. The pointwise estimate

#[#set math.equation(numbering: n => "(4.14)")
 $ \| F \( n \) \| lt.double L^(C') tau \( n_(*) \)^2 $ <sh:core-divisor>]

follows by counting the three-factor decompositions in (4.5); the same estimate holds for $G$. On physical states the function

$ F \( n \) epsilon \( n \) q_0^(\( omega_P \( n \) - M s_P \) \/ 2) $

is independent of the chosen marks, and its damping is at most one. For a fixed physical list of product $P$, one has $n_(*) divides n \/ P$. Consequently Proposition 3 gives, uniformly on a fixed enlargement of a position dyad,

$ sum_(n asymp X\
P divides n) \| F \( n \) \|^2 lt.double L^(C') sum_(v lt.double X \/ P) tau \( v \)^4 lt.double \( X \/ P \) L^(C'') . $

The normalized reciprocal sum of the admissible lists is at most

$ product_g V_g^(- M) sum_(upright("lists")) 1 / P lt.eq product_g (sum_(p in cal(P)_g) frac(1, p V_g))^M = 1 . $

Here $P lt.eq exp \( O_J \( T L^d \) \) = x^(o \( 1 \))$, so $X \/ P$ is in the ordinary divisor-moment range. We have proved

#[#set math.equation(numbering: n => "(4.15)")
 $ parallel F epsilon q_0^(\( omega_P - M s_P \) \/ 2) parallel_(n asymp X) lt.double X^(1 \/ 2) L^(C_3) \, $ <sh:endpoint-norm>]

with $C_3$ independent of $J$ and of the subsequent kernel choices. Bounded smooth factors do not affect this independence. Moreover, both $m$ and $p$ in (4.5) are $W$-rough for large $x$. There are at most $O \( sqrt(L) \)$ prime factors above $W$ in $n asymp x^(1 + o \( 1 \))$, counted with multiplicity. Assigning each such factor to $m \, p$, or the remaining factor shows

#[#set math.equation(numbering: n => "(4.16)")
 $ \| F \( n \) \| lt.eq L^(C') 3^(O \( sqrt(L) \)) = exp \( O \( sqrt(L) \) \) . $ <sh:endpoint-sup>]

This proves every endpoint hypothesis of Proposition 13.

Consider the physical pairing with extra cutoff, harmonic measure, and phases

#[#set math.equation(numbering: n => "(4.17)")
 $ frac(psi \( n \/ \( Z D \) \), n) D^(- i \( a_1 + a_2 \)) n^(i a_1) \( n' \)^(i a_2) overline(F \( n \)) G \( n' \) epsilon \( n \) epsilon \( n' \) q_0^(\( omega_P \( n \) - M s_P \) \/ 2) q_0^(\( omega_P \( n' \) - M s_P \) \/ 2) . $ <sh:lifted-pairing>]

The row operation itself contributes the other two half-damping factors in (4.8). Summation over states, auxiliary draws, and patterns is understood in (4.17), with the row coefficient $K_nu$.

Here $n asymp Z D = x^(1 + o \( 1 \))$ and $\| n' - n \| = x^(o \( 1 \))$. Split $n$ among $O \( L \)$ dyads $\[ X \, 2 X \)$ and restrict $n'$ to a fixed enlargement of each dyad. As in Lemma 5, Fourier inversion of $u mapsto psi \( e^u \)$ separates the cutoff into powers of $n$ and $D$; put the bounded factor $X \/ n$ in the first vector and divide the pairing by $X$. The total Fourier integral mass is a fixed power of $L$, independent of $J$.

We specify a useful quantifier here. If the logarithmic cutoff derivatives are bounded by $O_j \( L^(C_psi \( j + 1 \)) \)$, fix an exponent $F_0 > C_psi + 2$ before forming the ideal family. Integration by parts gives, for each fixed $N$,

$ integral_(\| v \| > L^(F_0)) \| accent(psi compose exp, ̂) \( v \) \| thin d v lt.double_N L^(C_psi \( N + 1 \) - F_0 \( N - 1 \)) . $

Thus this same cutoff exponent permits arbitrary saving by increasing $N$. Choose $C_4$ to contain $a_1 + a_2$ and all frequencies in the truncated integral. By (4.15) and (4.16), choose $E$ large enough for the desired saving after the fixed Fourier and dyadic costs; then choose $E_(upright("id"))$, the residual family, and finally $J$. The Fourier tail is bounded using the absolute row and column bounds of Proposition 13; its accuracy can be increased after the family and $J$ have been fixed without changing $F_0$ or $C_4$. It follows that the sum of the residual pairings is $O \( L^(- D) \)$ for any prescribed fixed $D$.

We next identify each individual pairing. Write $D = D_R D_C$, where $D_R$ is the shared product and $D_C$ the free product, and put $n = D_R w$, $n' = D_R w'$. Then $w' = w + k D_C$. Away from overlaps of shared labels with one another or with the divisors of $w \, w'$, the number of shared labels in group $g$ is $M - t_g$, and

$ omega_g \( D_R w \) - M = omega_g \( w \) - t_g . $

The full damping therefore leaves exactly the two damping factors of $W_(upright(bold(t))) \( w \) W_(upright(bold(t))) \( w' \)$. The identity

$ V_g^(- M - t_g) = V_g^(- \( M - t_g \)) V_g^(- 2 t_g) $

and $1 \/ n = 1 \/ \( D_R w \)$ turn the shared labels into independent draws of law $mu_g$, leaving the normalizations for the two unshared marked lists. The cores are unchanged. The sign identity is exact, even when overlaps occur:

#[#set math.equation(numbering: n => "(4.18)")
 $ epsilon \( D_R w \) epsilon \( D_R w' \) = epsilon \( D_R \)^2 epsilon \( w \) epsilon \( w' \) = epsilon \( w \) epsilon \( w' \) . $ <sh:shared-sign>]

The phases and cutoff in (4.17) become

$ psi \( w \/ \( Z D_C \) \) thin \( w \/ D_C \)^(i a_1) \( w' \/ D_C \)^(i a_2) \/ \( D_R w \) . $

Since the outer vectors were mark-independent, the initial symmetrizations do not alter this computation. After summing the shared labels, the pairing for pattern $nu$ is, up to negligible error,

#[#set math.equation(numbering: n => "(4.19)")
 $ bb(E)_(upright("free")) sum_(w > 0\
w' = w + k D_C > 0) & frac(psi \( w \/ \( Z D_C \) \), w) \( w \/ D_C \)^(i a_1) \( w' \/ D_C \)^(i a_2) overline(F \( w \)) G \( w' \) epsilon \( w \) epsilon \( w' \)\
 & #h(10mm)  dot.op W_(upright(bold(t))) \( w \) W_(upright(bold(t))) \( w' \) bb(E)_(upright("marks")) K_nu . $ <sh:stripped>]

The final expectation means averaging over the unshared marked lists.

For completeness, all discarded restrictions have superpolynomial logarithmic saving. Conditional on $w \, w'$, the free labels, and earlier shared draws, at most $O_J \( L \)$ prime values are excluded from a shared draw. Every atom is $O \( exp \( - L^a \) \)$. When bounding actual overlapping configurations, unshared physical marks still divide $w \, w'$; ignoring damping changes their weight by at most $q_0^(- 2 M s_P) = L^(O_J \( 1 \))$. Equations (4.3) and (4.14), followed by Cauchy–Schwarz and fixed divisor moments on the two translated intervals, bound the remaining harmonic sum by $L^(O_J \( 1 \))$. Shared overlaps thus cost $L^(O_J \( 1 \)) exp \( - L^a \)$.

If an auxiliary free label $p'$ belongs to an unshared endpoint list, then $p' divides D_C$ and hence $p' divides w \, w'$. Set $w = p' y$. The new shift $k D_C \/ p'$ is integral, the invariant cores are unchanged, and the harmonic measure supplies $1 \/ p'$. Applying the same divisor moments at scale $Z D_C \/ p'$ bounds this contribution by $L^(O_J \( 1 \)) \/ p'$. There are $O_J \( T \)$ free slots and $p' gt.eq exp \( L^c \)$. This bounds all free exclusions. After summing the fixed-power coefficient costs, the error in (4.19) is $O_A \( L^(- A) \)$ for every fixed $A$. For the raw pattern, $D_C = 1$, $upright(bold(t)) = \( ell \, dots.h \, ell \)$, and (4.19) is exactly the left side of (4.7). It remains to bound the comparisons.

=== 4.4 Comparison multipliers and minor arcs <comparison-multipliers-and-minor-arcs>

Expand the two kernels in a comparison using (4.12). Their four factors are bounded weights on $D_A \, D_B$ and on the big unshared marks at the respective endpoints, times a total coefficient cost $L^(O \( 1 \))$. The free products are restricted to logarithmic cells of width at most one. Let their lower endpoints be $U_1 \, U_2$, put $H' = U_1 U_2$, and set $Y = Z H'$. Then

#[#set math.equation(numbering: n => "(4.20)")
 $ U_1 \, U_2 gt.eq exp \( L^c - O \( 1 \) \) \, quad H' lt.eq exp \( O \( T L^d \) \) \, quad Y = x^(1 + o \( 1 \)) . $ <sh:comparison-scales>]

The positions $w \, w'$ in (4.19) are comparable to $Y$. Logarithmic Fourier separation of the smooth cutoff and phases therefore reduces it, with total cost $L^(O \( 1 \)) \/ Y$, to expressions

#[#set math.equation(numbering: n => "(4.21)")
 $ bb(E) thin b_1 \( D_A \) b_2 \( D_B \) sum_w overline(cal(U) \( w \)) cal(V) \( w + k D_A D_B \) \, #h(2em) \| b_1 \| \, \| b_2 \| lt.eq 1 . $ <sh:comparison-convolution>]

An endpoint here is its core times $epsilon$, a power twist of fixed log-power frequency, $W_(upright(bold(t)))^(upright(bold(b)))$ with $upright(bold(b))$ depending only on big marks, and a smooth size cutoff at $Y$. Fixed divisor moments give

#[#set math.equation(numbering: n => "(4.22)")
 $ sum_w \| cal(U) \( w \) \|^2 + sum_w \| cal(V) \( w \) \|^2 lt.double Y L^(C_5) . $ <sh:comparison-norms>]

They also control the Fourier-separation tails to arbitrary accuracy.

The Fourier multiplier of (4.21) is

$ frak(m) \( theta \) = bb(E) thin b_1 \( D_A \) b_2 \( D_B \) upright(e) \( k theta D_A D_B \) \, #h(2em) \| frak(m) \( theta \) \| lt.eq 1 . $

For a selected product $D$ with at most $m_0$ slots per group, unique factorization gives

#[#set math.equation(numbering: n => "(4.23)")
 $ bb(P) \( D = n \) = 1 / n product_g frac(k_g !, V_g^(k_g) product_(p in cal(P)_g) v_p \( n \) !) lt.eq L^(C_6) / n . $ <sh:product-atoms>]

Thus a bounded test collapsed onto product values $n asymp U_i$ has squared coefficient norm $O \( L^(C_6) \/ U_i \)$.

We use the integer bilinear estimate of [4] Section 4, Lemma 4.2: for coefficients on intervals of lengths $O \( U \) \, O \( V \)$, and $alpha = u \/ r + beta$ with $\( u \, r \) = 1$, $\| beta \| lt.eq r^(- 2)$,

$ lr(|sum_(n \, t) a_n b_t upright(e) \( alpha n t \)|) lt.double parallel a parallel_2 parallel b parallel_2 \[ U + \( 1 + V \/ r \) { U + r log \( 2 r \) } \]^(1 \/ 2) . $

Arbitrary missing coefficients and translated containing intervals are allowed. Together with (4.23), this bounds $\| frak(m) \( theta \) \|$ by

#[#set math.equation(numbering: n => "(4.24)")
 $ L^(C_7) (1 / U_2 + 1 / r + frac(log \( 2 r \), U_1) + frac(r log \( 2 r \), H'))^(1 \/ 2) $ <sh:minor-bound>]

whenever $r$ is a Dirichlet-approximation denominator for $k theta$.

Choose such an approximation with maximum denominator $floor.l H' \/ L^(C') floor.r$. If $r > L^(C')$, all terms in (4.24) save an arbitrarily large fixed log power when $C'$ is sufficiently large, by (4.20). If $r lt.eq L^(C')$, then $theta$ belongs, after accounting for $\| k \| lt.eq L^C$, to an arc

#[#set math.equation(numbering: n => "(4.25)")
 $ lr(|theta - h / r|)_(bb(R) \/ bb(Z)) lt.eq L^(C_(upright("arc"))) / H' \, #h(2em) 1 lt.eq r lt.eq L^(C_(upright("arc"))) \, quad h med mod med r \, $ <sh:arcs>]

for a sufficiently large fixed $C_(upright("arc"))$. The letters $h \, r$ in (4.25) denote the resulting rational center, rather than necessarily the original approximation. There are a fixed logarithmic power of arcs. Parseval and (4.22) dispose of their complement. On the arcs, Cauchy–Schwarz shows that it suffices to prove, for every fixed $A > 0$ and every arc center $h \/ r$,

#[#set math.equation(numbering: n => "(4.26)")
 $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(cal(U)) \( h \/ r + beta \) \|^2 thin d beta lt.double_A Y L^(- A) \, #h(2em) H = H' \/ L^(C_(upright("arc"))) . $ <sh:arc-target>]

Here $hat(cal(U)) \( theta \) = sum_w cal(U) \( w \) upright(e) \( theta w \)$, $H arrow.r oo$, and $H = x^(o \( 1 \))$.

=== 4.5 The endpoint on a major arc <the-endpoint-on-a-major-arc>

Choose a small group $g_s$ and a designated one of its $ell gt.eq 1$ marks. Because the mark weight $upright(bold(b))$ uses only big marks, removing this prime gives, unless a prime in $g_s$ divides $w$ twice,

#[#set math.equation(numbering: n => "(4.27)")
 $ W_(upright(bold(t)))^(upright(bold(b))) \( w \) = 1 / V_(g_s) sum_(p_s divides w\
p_s in cal(P)_(g_s)) W_(upright(bold(t)) - upright(bold(e))_(g_s))^(upright(bold(b))) \( w \/ p_s \) . $ <sh:small-mark-extraction>]

The equality includes damping: removing $p_s$ decreases both $omega_P$ and $sum_g t_g$ by one. On the excluded set both weights are bounded by fixed log powers. Since $w_(*) divides w \/ p_s^2$ on a multiple of $p_s^2$, divisor moments show that the endpoint error has squared norm

#[#set math.equation(numbering: n => "(4.28)")
 $ lt.double Y L^(C_8) sum_(p_s in cal(P)_(g_s)) p_s^(- 2) lt.double Y L^(C_8) exp \( - L^a \) . $ <sh:small-square-error>]

Its Fourier energy is negligible by Parseval.

The factors $m \, p$ in (4.5) contain no group prime. After (4.27), write $w = m p_s p r'$. Complete multiplicativity gives $epsilon \( w \) = epsilon \( p_s \) epsilon \( r' \)$; the remaining marked weight and $c_(r'_(*))$ are functions of $r'$ alone. They have a fixed log-power bound, so may be absorbed into one residual coefficient.

To remove the rational center, fix $d' = \( r' \, r \)$ and put $q = r \/ d'$. The first three factors $m \, p_s \, p$ are units modulo $r$ for all large $x$, and $r' \/ d'$ is a unit modulo $q$. On units the exact character expansion is

#[#set math.equation(numbering: n => "(4.29)")
 $ upright(e) \( h v \/ q \) = sum_(chi med mod med q) c_(h \, q) \( chi \) chi \( v \) \, #h(2em) c_(h \, q) \( chi \) = frac(1, phi \( q \)) sum_(v med mod med q)^(*) upright(e) \( h v \/ q \) overline(chi \( v \)) \, quad \| c_(h \, q) \( chi \) \| lt.eq 1 . $ <sh:rational-characters>]

Apply this with $v = m p_s p \( r' \/ d' \)$. The gcd restriction and $chi \( r' \/ d' \)$ go into the residual coefficient. Summing over $d'$ and all characters costs a fixed power of $L$ and includes the principal and imprimitive characters. The product of the new character on $m$ with $chi_0$ is a character of fixed log-power modulus. It is therefore enough to bound the energy at zero of

#[#set math.equation(numbering: n => "(4.30)")
 $ a_w = psi_1 \( w \/ Y \) w^(i v_1) sum_(m p_s p r' = w) alpha_m chi_m \( m \) m^(i sigma_0) b_s \( p_s \) upright(bold(1))_(p in I_p \, med p med upright("prime")) chi_p \( p \) p^(i sigma_1) d_(r') . $ <sh:four-factors>]

Here $p_s in cal(P)_(g_s)$, $\| b_s \| lt.double 1$, $\| d_(r') \| lt.eq L^(C_9)$, and all characters, frequencies and smooth-cutoff derivatives have fixed log-power bounds. The sign on $p_s$ and $1 \/ V_(g_s)$ are included in $b_s$. In particular,

#[#set math.equation(numbering: n => "(4.31)")
 $ sum_w \| a_w \|^2 lt.double Y L^(C_10) . $ <sh:a-norm>]

=== 4.6 Local Fourier energy and Mellin polynomials <local-fourier-energy-and-mellin-polynomials>

We include the scale conversion from [4] Section 5, equation (5.16) with its proof, as its normalization is useful here.

#thm([Lemma 4.4.])[
  (Local Mellin energy).  #emph[Let $a_w$ be supported on $w asymp Y$, where $Y = x^(1 + o \( 1 \))$, and let $H = x^(o \( 1 \))$ tend to infinity. For every fixed $j gt.eq 1$, 
#[#set math.equation(numbering: n => "(4.32)")
 $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(a) \( beta \) \|^2 thin d beta lt.double_j 1 / Y integral_(bb(R)) \( 1 + H \| t \| \/ Y \)^(- j) lr(|sum_w a_w w^(i t)|)^2 d t + (H / Y)^2 sum_w \| a_w \|^2 . $ <sh:mellin-inequality>]

]
] <sh:mellin-energy>

#proof[
  Take a smooth bump $K$ of integral one, supported sufficiently near zero that its Fourier transform, with convention $hat(K) \( xi \) = integral K \( u \) upright(e) \( - xi u \) thin d u$, has modulus at least $1 \/ 2$ on $\[ - 1 \, 1 \]$. Plancherel gives
  $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(a) \( beta \) \|^2 thin d beta lt.double H^(- 2) integral_(bb(R)) lr(|sum_w a_w K \( \( w - v \) \/ H \)|)^2 d v . $
  Only $v asymp Y$ contributes. Keep this restriction when replacing the kernel by $K \( v log \( w \/ v \) \/ H \)$. On the union of their supports, $\| w - v \| lt.double H$, and their arguments differ by $O \( H \/ Y \)$. Cauchy–Schwarz over the $O \( H \)$ possible integers $w$, followed by integration over the $O \( H \)$ centers for each $w$, bounds the normalized squared error by $\( H \/ Y \)^2 sum_w \| a_w \|^2$.
  Put $h_0 = H \/ Y$, $v = Y exp \( u \)$, and $P_a \( t \) = sum_w a_w w^(i t)$. Fourier inversion for the new kernel gives
  $ sum_w a_w K \( v log \( w \/ v \) \/ H \) = frac(h_0, 2 pi) integral_(bb(R)) e^(- u) hat(K) \( h_0 e^(- u) t \/ \( 2 pi \) \) v^(- i t) P_a \( t \) thin d t . $
  Insert a fixed smooth compact cutoff in $u$ equal to one on the required range. The Fourier transform in $u$ of the resulting amplitude $e^(- u) hat(K) \( h_0 e^(- u) t \/ \( 2 pi \) \)$ is bounded by
  $ C_j \( 1 + \| s \| \)^(- 2) \( 1 + h_0 \| t \| \)^(- j) \, $
  by two integrations by parts and the Schwartz bounds for $hat(K)$. Expand that amplitude in its $u$-Fourier transform, apply Minkowski in $s$ and Plancherel in $u$, and use $d v lt.double Y thin d u$. The normalization is $H^(- 2) Y h_0^2 = Y^(- 1)$. Increasing the decay order if necessary proves (4.32). ◻
]

Apply this lemma to (4.30). The error term is $O_A \( Y L^(- A) \)$ for every fixed $A$, by (4.31). Dirichlet-polynomial mean squares imply, on every dyadic time scale $R gt.eq 1$,

#[#set math.equation(numbering: n => "(4.33)")
 $ Y^(- 2) integral_(R lt.eq \| t \| lt.eq 2 R) \| P_a \( t \) \|^2 d t lt.double \( 1 + R \/ Y \) L^(C_11) . $ <sh:mellin-tail-ms>]

Consequently, with $T_0 = L Y \/ H$, the part $\| t \| > T_0$ of the first term in (4.32) is at most

$ Y L^(C_11) sum_(r gt.eq 0) \( 2^r L \)^(- j) (1 + frac(2^r L, H)) lt.double_j Y L^(C_11 - j) \( 1 + L \/ H \) . $

It is $O_A \( Y L^(- A) \)$ on taking $j$ large enough.

Split the four variables in (4.30) into dyads. There are $O \( L^4 \)$ relevant boxes, and their product scales are comparable to $Y$. Write

$ frac(P_a \( t \), Y) = sum_w 1 / w #scale(x: 120%, y: 120%)[\(] \( w \/ Y \) psi_1 \( w \/ Y \) #scale(x: 120%, y: 120%)[\)] w^(i \( t + v_1 \)) sum_(m p_s p r' = w) \( upright("the four coefficients") \) . $

Fourier-separate the parenthesized function in $log \( w \/ Y \)$. On every box the fourfold collapsed reciprocal coefficients have squared norm $lt.double L^(C_12) \/ Y$, by a fixed divisor moment. Hence centered mean squares give a bound $L^(C_13)$ for the integral of their squared polynomial on any translate of $\[ - T_0 \, T_0 \]$. Minkowski therefore bounds a separating-frequency tail by a fixed log power times the square of the $L^1$ mass of that tail. Integration by parts makes it arbitrarily small at a fixed log-power cutoff. This proves the claimed separation also for unbounded tail frequencies. Retained shifts enlarge the time interval to at most $\[ - 2 T_0 \, 2 T_0 \]$, since $Y \/ H$ exceeds every fixed log power.

After absorbing these shifts into $t$ and the fixed frequencies, it suffices to prove, for arbitrary fixed $A' > 0$,

#[#set math.equation(numbering: n => "(4.34)")
 $ integral_(\| t \| lt.eq 2 L Y \/ H) \| P_s \( t \) P_l \( t \) cal(R) \( t \) \|^2 d t lt.double L^(- A') \, $ <sh:polynomial-target>]

where

$ P_s \( t \) & = sum_(p_s asymp P) b_s \( p_s \) p_s^(- 1 + i t) \,\
P_l \( t \) & = sum_(p asymp P' \, med p in I_p\
p med upright("prime")) chi_p \( p \) p^(- 1 + i sigma_1 + i t) \,\
cal(R) \( t \) & = (sum_(m asymp M_1) alpha_m chi_m \( m \) m^(- 1 + i sigma_0 + i t)) (sum_(r' asymp R_1) d_(r') \( r' \)^(- 1 + i t)) . $

The small primes retain their group restriction, and each dyad is intersected with its original interval. Their sizes satisfy

#[#set math.equation(numbering: n => "(4.35)")
 $ 1 / 2 exp \( L^a \) lt.eq P lt.eq exp \( L^b \) \, #h(2em) x^tau \/ 2 lt.eq P' lt.eq x^eta \, #h(2em) P M_1 P' R_1 asymp Y . $ <sh:polynomial-scales>]

For any subproduct of these four polynomials, collapsed as $sum_(n asymp U) c_n n^(i t)$, a fixed divisor moment gives

#[#set math.equation(numbering: n => "(4.36)")
 $ sum_n \| c_n \|^2 lt.double L^(C_14) \/ U . $ <sh:collapsed-norm>]

Only four convolution factors are involved: all remaining marked weights have already entered the single bounded coefficient $d_(r')$.

=== 4.7 Exceptional times and completion of the proof <exceptional-times-and-completion-of-the-proof>

First consider $\| P_s \( t \) \| lt.eq L^(- A_s)$. The polynomial $P_l cal(R)$ has size $Y \/ P$, and

$ frac(Y \/ P, 2 L Y \/ H) = frac(H, 2 L P) arrow.r oo $

by $b < c$ and (4.20). Its mean square on the entire time interval is $L^(O \( 1 \))$, by (4.36). Choose $A_s$ sufficiently large to bound this part of (4.34).

Let $cal(J)$ be the integer unit intervals meeting ${ \| t \| lt.eq 2 L Y \/ H : \| P_s \( t \) \| > L^(- A_s) }$. We establish

#[#set math.equation(numbering: n => "(4.37)")
 $ \| cal(J) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( L^b + L^(1 - a) log L \) #scale(x: 120%, y: 120%)[\)] = Y^(o \( 1 \)) . $ <sh:exceptional-count>]

Put $j_0 = floor.l log Y \/ log \( 2 P \) floor.r$. Unique factorization shows directly that the squared coefficient norm of $P_s^(j_0)$ is at most

#[#set math.equation(numbering: n => "(4.38)")
 $ j_0 ! (sum_(p_s asymp P) \| b_s \( p_s \) \|^2 p_s^(- 2))^(j_0) lt.eq j_0 ! \( C \/ P \)^(j_0) . $ <sh:factorial-norm>]

Indeed for each multiset of $j_0$ primes, one of the two multinomial coefficients in its squared coefficient is at most $j_0 !$. This argument remains valid when $j_0$ grows; no growing-order divisor-moment estimate is being used.

Select a point with $\| P_s \| > L^(- A_s)$ in each occupied interval. Split the intervals into three classes according to their integer index modulo three, so the chosen points in a class are separated by at least one. The indices of $P_s^(j_0)$ are at most $Y$, and the time range is contained in $\[ - Y \, Y \]$ for large $x$. The separated-point mean-square inequality and (4.38) give

$ \| cal(J) \| lt.double Y L^(C_15) j_0 ! \( C L^(2 A_s) \/ P \)^(j_0) . $

Since $Y P^(- j_0) lt.eq 2 P thin 2^(j_0)$, $log P lt.eq L^b$, and $j_0 = O \( L^(1 - a) \)$, this proves (4.37).

We next prove the sparse mean-square estimate

#[#set math.equation(numbering: n => "(4.39)")
 $ sum_(I in cal(J)) sup_(t in I) \| cal(R) \( t \) \|^2 lt.double L^(C_16) . $ <sh:sparse-supremum>]

Collapse $cal(R) \( t \) = sum_(n asymp U) c_n n^(i t)$, where

$ U = M_1 R_1 asymp Y \/ \( P P' \) gt.eq Y^(1 - eta - o \( 1 \)) > Y^0.6 \, #h(2em) sum_n \| c_n \|^2 lt.double L^(C_14) \/ U . $

Choose a maximizing point on each closed unit interval and again split into three separated classes. The Gram matrix of the evaluation vectors $\( n^(i t_i) \)_(n asymp U)$ has entries $sum_(n asymp U) n^(i \( t_i - t_j \))$. For $1 lt.eq \| Delta \| lt.eq c_(*) U$, with a sufficiently small fixed $c_(*) > 0$, the derivative of $Delta log n \/ \( 2 pi \)$ is monotone, has magnitude comparable to $\| Delta \| \/ U$, and is bounded away from nonzero integers. The first derivative test of Proposition 4 gives $O \( U \/ \| Delta \| \)$. For $c_(*) U lt.eq \| Delta \| lt.double Y$, the second derivative test gives

$ O #scale(x: 120%, y: 120%)[\(] sqrt(\| Delta \|) + U \/ sqrt(\| Delta \|) #scale(x: 120%, y: 120%)[\)] = O \( Y^(1 \/ 2) \) . $

The diagonal entry is $O \( U \)$. Thus all entries are bounded by

$ O (frac(U, 1 + \| t_i - t_j \|) + Y^(1 \/ 2)) . $

Separation and (4.37) bound an absolute row sum by

$ O #scale(x: 120%, y: 120%)[\(] U log Y + \| cal(J) \| Y^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] = O \( U log Y \) . $

The operator norm is bounded by this row sum. Multiplying by $sum \| c_n \|^2$ proves (4.39).

On the exceptional intervals, $\| P_s \( t \) \| lt.double 1$. Prescribe a sufficiently large saving for $P_l$, and apply Lemma 6. Choose $B_1$ larger than its frequency threshold and the fixed exponent bounding $\| sigma_1 \|$. For $\| t \| gt.eq L^(B_1)$ in the present range, the lemma applies to $t + sigma_1$: it is above the required logarithmic threshold and

$ \| t + sigma_1 \| lt.eq 2 L Y \/ H + \| sigma_1 \| < x^2 . $

It bounds $P_l$ by an arbitrarily large negative log power. Equation (4.39) then proves the required integral bound for these times.

For $\| t \| lt.eq L^(B_1)$, use (4.6) on the $m$-polynomial in $cal(R)$. Its dyad lies below $x^2$; the character modulus and shifted frequency are fixed log powers. All other factors have fixed log-power absolute bounds. Choosing $B$ last, larger than these modulus and frequency exponents and with $2 B > B_1 + C_17 + A'$, makes this last integral $O \( L^(- A') \)$. This proves (4.34), hence (4.26).

The major-arc estimate, the minor-arc estimate, and Parseval now bound every comparison (4.19) by an arbitrarily large negative log power, after paying the fixed number of arcs, kernel expansions, and Fourier integrals. Their sum has the same bound. Subtracting it from the controlled residual pairing leaves the raw pattern, which is (4.7). This completes the proof of Theorem 12.

#prodef([Remark 4.5.])[
  (Order of choices).  The endpoint norm exponent and the original Fourier cutoff exponent are fixed from the input data. Then choose the physical accuracy $E$, ideal accuracy $E_(upright("id"))$, ideal frequency range $C_4$, all kernel parameters, and finally a sufficiently large fixed $J$. Once this family is fixed, choose the minor-arc and major-arc accuracies, the prime-polynomial accuracy and threshold $B_1$, and last the discrepancy exponent $B$. Any stronger Fourier-tail saving required by these choices is obtained by more integrations by parts at the already fixed cutoff exponent. No kernel parameter or frequency range has to be changed after choosing $J$.
] <sh:choice-order>

== 5 Candidate weights and their mass <wt:section>

The ordinary bands $Q_j$ give an even number of prime slots and allow the candidate to be split near a prescribed size. The smaller groups $cal(P)_g$ supply the graph marks and the odd parity restriction. Separating the two families keeps these roles independent.

We now fix the prime groups used in the remainder of the proof. All constants in this section depend only on the following fixed geometry and on the function $Psi$. In particular, they are independent of the parameters $kappa \, b_1$ and of the proxy precision chosen later.

Choose a fixed even integer $r_0$ sufficiently large that

$ frac(\( r_0 - 1 \) c_1, 2) gt.eq c_2 + 1 \, #h(2em) c_2 s' < 1 / 4 \, $

where

#[#set math.equation(numbering: n => "(5.1)")
 $ c_1 = 1 \, quad c_2 = 6 / 5 \, quad c_3 = 3 / 2 \, quad c_4 = 9 / 5 \, #h(2em) s' = frac(1, r_0 \( c_1 + c_2 \)) \, #h(2em) s_j = s' 2^(- j) L . $ <wt:geometry>]

Let $j_x$ be the largest nonnegative integer with $c_1 s_(j_x) gt.eq 20 T$, and let $Q_j$ consist of the primes with $c_1 s_j lt.eq log p lt.eq c_2 s_j$, for $0 lt.eq j lt.eq j_x$. For each $j$ such that $\[ c_3 s_j \, c_4 s_j \]$ is contained in either $\[ L^(1 \/ 10) \, L^(1 \/ 5) \]$ or $\[ L^(3 \/ 10) \, L^(2 \/ 5) \]$, take the primes whose logarithms belong to $\[ c_3 s_j \, c_4 s_j \]$ as one group $cal(P)_g$. As before, $cal(P)$ is the union of these groups and $n_(*)$ is the part of $n$ supported outside $cal(P)$.

These intervals are mutually disjoint, including between the $Q_j$ and the $cal(P)_g$: indeed $c_2 < c_3 < c_4 < 2 c_1$ and $c_4 \/ 2 < c_1$. The number of groups in a logarithmic range $\[ L^a \, L^b \]$ is $\( b - a \) T \/ log 2 + O \( 1 \)$. The prime number theorem and partial summation give, uniformly in the indices,

#[#set math.equation(numbering: n => "(5.2)")
 $ V_(Q \, j) := sum_(p in Q_j) 1 / p = log 6 / 5 + o \( 1 \) \, #h(2em) V_g := sum_(p in cal(P)_g) 1 / p = log 6 / 5 + o \( 1 \) . $ <wt:band-masses>]

The uniformity follows because the smallest logarithmic endpoint tends to infinity. Thus the group hypotheses of Theorem 12 hold with $\( a \, b \, c \, d \) = \( 1 \/ 10 \, 1 \/ 5 \, 3 \/ 10 \, 2 \/ 5 \)$. Every prime in our construction is at least $L^20$ once $x$ is sufficiently large. The classical prime estimates used here and below are those in [4] Section “Notation and preliminary estimates”.

Take $q_0 = 1 \/ 2$ and $ell = 1$ in the marked weights, so explicitly

$ W_1 \( n \) = product_g frac(q_0^(omega_g \( n \) - 1) omega_g \( n \), V_g) . $

For a positive integer $v$, let $a \( v \)$ be the number of ordered prime tuples with product $v$, with $r_0$ slots in every $Q_j$, divided by $\( r_0 ! \)^(j_x + 1)$. Repetitions are allowed. Fix a nonnegative smooth function $Psi$ supported in $\[ 1 \, 2 \]$ and positive on a nonempty open subinterval of $\( 1 \, 2 \)$. Define

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(E) \( u \) = \( - 1 \)^(sum_(p in cal(P)) v_p \( u \)) \, #h(2em) A_0 \( u \) = W_1 \( u \) a \( u_(*) \) \,\
A \( u \) = A_0 \( u \) frac(1 - cal(E) \( u \), 2) \, #h(2em) X_A = sum_u A \( u \) Psi \( u \/ x \) . $ <wt:definition>]

Here $v_p \( u \)$ denotes the exponent of $p$ in $u$. If $e_p$ are the exponents of an integer in the support of $a$, then

$ a \( v \) = product_(j = 0)^(j_x) product_(p in Q_j) frac(1, e_p !) \, #h(2em) sum_(p in Q_j) e_p = r_0 . $

In particular $0 lt.eq a \( v \) lt.eq 1$. The function $k mapsto k q_0^(k - 1)$ is bounded on the nonnegative integers, and there are $O \( T \)$ groups with $V_g$ bounded away from zero. Consequently

#[#set math.equation(numbering: n => "(5.4)")
 $ 0 lt.eq A \( u \) lt.eq A_0 \( u \) lt.eq L^(C_0) $ <wt:pointwise>]

for a fixed $C_0$. The ordinary part of a supported integer has exactly $r_0 \( j_x + 1 \)$ prime factors counted with multiplicity. This number is even, whereas the parity projection in $A$ selects an odd number of group-prime factors. Thus

#[#set math.equation(numbering: n => "(5.5)")
 $ A \( u \) > 0 quad arrow.r.double quad Omega \( u \) med upright("is odd") \, #h(2em) Omega \( 2 u \) med upright("is even") . $ <wt:parity>]

=== 5.1 Harmonic measures and the group tail <harmonic-measures-and-the-group-tail>

Set

#[#set math.equation(numbering: n => "(5.6)")
 $ H_Q = sum_v frac(a \( v \), v) = product_(j = 0)^(j_x) frac(V_(Q \, j)^(r_0), r_0 !) \, #h(2em) H_P = sum_(r : thin r_(*) = 1) frac(W_1 \( r \), r) . $ <wt:harmonic-masses>]

Since $j_x + 1 = O \( T \)$, Equation (5.2) gives $L^(- C) lt.eq H_Q lt.eq L^C$ for a fixed $C$. For one group introduce

$ Z_g \( q \) = product_(p in cal(P)_g) (1 + frac(q, p - 1)) . $

The factor of $H_P$ associated with this group is

#[#set math.equation(numbering: n => "(5.7)")
 $ H_g = frac(Z'_g \( q_0 \), V_g) = frac(Z_g \( q_0 \), V_g) sum_(p in cal(P)_g) frac(1, p - 1 + q_0) . $ <wt:group-mass>]

This follows by expanding the Euler product: each occurring prime has harmonic mass $sum_(k gt.eq 1) p^(- k) = 1 \/ \( p - 1 \)$, and differentiation chooses one of the distinct prime divisors as its mark. Because $q_0 lt.eq 1$, the sum on the right of Equation (5.7) is at least $V_g$. The same sum is bounded above, and $Z_g \( q_0 \)$ is bounded above, by constants uniform in $g$. Hence

#[#set math.equation(numbering: n => "(5.8)")
 $ 1 lt.eq Z_g \( q_0 \) lt.eq H_g lt.eq C \, #h(2em) H_P = product_g H_g \, #h(2em) 1 lt.eq H_P lt.eq L^C \, #h(2em) product_(p in cal(P)) (1 + frac(q_0, p - 1)) lt.eq H_P . $ <wt:HP-bounds>]

Normalize $a \( v \) \/ v$ and $W_1 \( r \) \/ r$ by $H_Q$ and $H_P$, respectively, and draw the two parts independently. The $Q$-measure can equivalently be sampled by drawing every ordered slot independently with law $1 \/ \( p V_(Q \, j) \)$ in band $j$. The group measure is a product of the normalized measures belonging to Equation (5.7). Write $V$ and $R$ for these two random integers and $U = V R$.

In one group the unnormalized harmonic mass of total multiplicity one is exactly $V_g \/ V_g = 1$. The contribution to multiplicity two from two distinct primes is

$ frac(2 q_0, V_g) sum_(p < q in cal(P)_g) frac(1, p q) = q_0 / V_g (V_g^2 - sum_(p in cal(P)_g) 1 / p^2) . $

It is bounded below by a positive constant for sufficiently large $x$. Since $H_g lt.eq C$, each group therefore has both even and odd total multiplicity with probability at least a fixed $delta_0 > 0$. Conditioning on all groups except one proves

#[#set math.equation(numbering: n => "(5.9)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(E) \( R \) = - 1 #scale(x: 120%, y: 120%)[\)] gt.eq delta_0 . $ <wt:odd-mass>]

The bound is independent of the number of groups.

#thm([Lemma 5.1.])[
  (Tail of the group part).  #emph[There is a fixed $C$ such that, for each fixed $sigma > 0$, 
$ sum_(r > x^sigma\
r_(*) = 1) frac(W_1 \( r \), r) lt.eq L^C exp \( - sigma L^(3 \/ 5) \) $

 for all sufficiently large $x$.]
] <wt:tail>

#proof[
  Put $delta = L^(- 2 \/ 5)$. The mass in one group after inserting $r^delta$ is
  $ product_(p in cal(P)_g) (1 + frac(q_0, p^(1 - delta) - 1)) 1 / V_g sum_(p in cal(P)_g) frac(1, p^(1 - delta) - 1 + q_0) . $
  Every group prime satisfies $p^delta lt.eq e$, so this expression is bounded above by a fixed constant, using Equation (5.2). Multiplying over $O \( T \)$ groups gives $sum_(r_(*) = 1) W_1 \( r \) r^(- 1 + delta) lt.eq L^C$. For $r > x^sigma$, the extra factor is at least $x^(sigma delta) = exp \( sigma L^(3 \/ 5) \)$, proving the assertion. ◻
]

=== 5.2 Localization at the target size <localization-at-the-target-size>

#thm([Lemma 5.2.])[
  (Total candidate mass).  #emph[There is a fixed $C_A$ such that 
$ X_A asymp x / L H_Q H_P \, #h(2em) X_A gt.double x L^(- C_A) . $

 The implied constants and $C_A$ depend only on the fixed geometry and on $Psi$.]
] <wt:mass>

#proof[
  The exact probability identity is
  #[#set math.equation(numbering: n => "(5.10)")
   $ X_A = H_Q H_P thin bb(E) [U Psi \( U \/ x \) thin upright(bold(1))_({ cal(E) \( R \) = - 1 })] . $ <wt:expectation>]
  Leave one ordered slot in $Q_0$ free and condition on every other variable. On the support of $Psi \( U \/ x \)$, its logarithm must lie in an interval of length $log 2$. Uniformly in the location of such an interval, its normalized harmonic prime mass in $Q_0$ is $O \( 1 \/ L \)$. For example, after intersecting with $Q_0$, the interval is contained in $\[ y \, 2 y \]$ with $log y asymp L$, and the prime number theorem bounds the reciprocal prime sum there by $O \( 1 \/ L \)$. Since $U lt.eq 2 x$ on the effective support, this proves the upper bound.
  For the lower bound let
  $ m_j = frac(c_1 + c_2, 2) s_j \, #h(2em) Delta = \( c_2 - c_1 \) s' L . $
  The infinite midpoint sum satisfies $r_0 sum_(j gt.eq 0) m_j = L$, by the choice of $s'$. Choose a fixed integer $J_0$ such that
  $ sum_(j > J_0) r_0 c_2 s_j < Delta \/ 24 . $
  For sufficiently large $x$ we have $j_x > J_0$. Restrict all slots in $0 lt.eq j lt.eq J_0$, except the free slot in $Q_0$, to fixed small neighborhoods of their respective midpoints, choosing the widths so that their total logarithmic deviation is less than $Delta \/ 24$. There are only finitely many restrictions, each with harmonic probability bounded below by a positive constant by the prime number theorem. Their joint probability is therefore bounded below.
  Independently, require $cal(E) \( R \) = - 1$ and $log R lt.eq Delta \/ 12$. Equations (5.8) and (5.9), together with Lemma 17 applied to the fixed positive number $Delta \/ \( 12 L \)$, show that these two requirements have probability at least $delta_0 \/ 2$ for sufficiently large $x$. No restrictions are needed on the remaining $Q$-slots. Their total logarithm and the infinite midpoint sum for their bands both lie between zero and $Delta \/ 24$. Consequently, if $B$ is the logarithm of the product of all variables except the free prime, then on the event just described
  $ lr(|B - \( L - m_0 \)|) < Delta \/ 6 . $
  Choose $1 < alpha < beta < 2$ with $Psi \( t \) gt.eq c_Psi > 0$ throughout $\[ alpha \, beta \]$. For the free prime it is enough to require
  $ log p in \[ L + log alpha - B \, med L + log beta - B \] . $
  This interval has the fixed positive length $log \( beta \/ alpha \)$. Its endpoints lie strictly inside $\[ c_1 s_0 \, c_2 s_0 \]$ with distance $gt.double Delta$ from the boundary, since $m_0$ is its midpoint and $Delta$ its full width. The prime number theorem and partial summation give harmonic mass $gt.double 1 \/ L$ for the interval, uniformly in the conditioned variables. On it $U gt.eq alpha x$ and $Psi \( U \/ x \) gt.eq c_Psi$. Equation (5.10) now gives the lower bound. Finally $H_Q gt.eq L^(- C)$ and $H_P gt.eq 1$ imply the stated fixed-power lower bound for $X_A$. ◻
]

=== 5.3 Squarefree predecessors <squarefree-predecessors>

#thm([Lemma 5.3.])[
  (Squarefree loss).  #emph[The mass of nonsquarefree predecessors satisfies 
$ sum_(u gt.eq 1\
2 u med upright(n o t med s q u a r e f r e e)) A \( u \) Psi \( u \/ x \) = o \( X_A \/ L \) . $

]
] <wt:squarefree>

#proof[
  In one $Q$-band the probability that two given slots coincide is
  $ sum_(p in Q_j) frac(1, p^2 V_(Q \, j)^2) lt.eq L^(- 20) / V_(Q \, j) lt.double L^(- 20) . $
  The number of pairs of slots within bands is $O \( T \)$, so the probability of any repeated $Q$-prime is $O \( T L^(- 20) \)$.
  For completeness, fix $p in cal(P)_g$ and write $Z_(g \, p) \( q \) = product_(q' in cal(P)_g \, med q' eq.not p) \( 1 + q \/ \( q' - 1 \) \)$. The unnormalized mass of integers in this group that are divisible by $p$ is
  $ frac(Z_(g \, p) \( q_0 \) + q_0 Z'_(g \, p) \( q_0 \), V_g \( p - 1 \)) lt.double 1 / p . $
  The bound follows from the uniform group harmonic masses; division by $H_g gt.eq 1$ preserves it. Conditional on the set of distinct prime divisors, the exponent of an occurring prime has distribution proportional to $p^(- k)$, $k gt.eq 1$. The conditional probability that its exponent is at least two is therefore exactly $1 \/ p$. Thus the probability of a square from the group part is
  $ lt.double sum_(p in cal(P)) 1 / p^2 lt.eq e^(- L^(1 \/ 10)) sum_g V_g lt.double T e^(- L^(1 \/ 10)) . $
  All bands and groups are disjoint, and all their primes are odd. It follows that $2 U$ is not squarefree with probability $O \( T L^(- 20) \)$ under the unrestricted harmonic measure. Using Equation (5.10) and dropping parity and size localization gives the upper bound
  $ 2 x parallel Psi parallel_oo H_Q H_P thin O \( T L^(- 20) \) lt.double x H_Q H_P T L^(- 20) . $
  By Lemma 18, its ratio to $X_A \/ L$ is $O \( T L^(- 18) \) = o \( 1 \)$, as required. ◻
]

== 6 Bilinear distribution <ti:section>

We retain the groups, ordinary prime bands, and weights of the preceding section. In particular, every ordinary slot contains a prime, there are $r_0$ labelled slots in each $Q_j$, and

$ s_j = s' 2^(- j) L \, #h(2em) 20 T lt.eq s_(j_x) < 40 T \, #h(2em) frac(\( r_0 - 1 \) c_1, 2) gt.eq c_2 + 1 . $

The smooth allocation and change of variables below follow the Type II method of [4]. We give the argument for the present all-prime weight and its parity twist, using Theorem 12 for the resulting correlations.

#thm([Theorem 6.1.])[
  (Type II distribution).  #emph[Fix $D_(*) \, b_(*) \, C > 0$. Let $U \, V$ be dyadic scales such that 
$ U V asymp x \, #h(2em) x^(b_(*)) lt.eq U \, V lt.eq x^(1 - b_(*)) \, $

 and let $K subset \[ U \, 2 U \)$ and $J subset \[ V \, 2 V \)$ be intervals. Suppose $\| alpha_m \| \, \| beta_n \| lt.eq L^C$ and $alpha_m = 0$ unless $P^(-) \( m \) > W$. There is a fixed $B$, depending only on these fixed data and on the fixed weight and cutoff data, for which the following holds. Assume that the sequence $alpha_m upright(bold(1))_(m in K)$ satisfies (4.6); explicitly, assume 
#[#set math.equation(numbering: n => "(6.1)")
 $ lr(|sum_(m in I) alpha_m upright(bold(1))_(m in K) chi \( m \) m^(- 1 + i t)|) lt.eq L^(- B) quad vec(I subset \[ 1 \, x^2 \] upright(" an interval") \,, mod \( chi \) lt.eq L^B \, quad \| t \| lt.eq L^B) . $ <ti:actual-discrepancy>]

 Then 
#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(m in K \, med n in J \, med u gt.eq 1\
m n = 2 u + 1) alpha_m beta_n A \( u \) Psi \( u \/ x \) lt.double x L^(- D_(*)) . $ <ti:bound>]

 The estimate is uniform in the intervals and coefficient sequences satisfying these assumptions. No discrepancy or smoothness assumption is imposed on $beta$.]
] <ti:distribution>

#proof[
  Extend the actually restricted sequences by zero, and write them again as $alpha$ and $beta$. Thus $alpha$ in every subsequent convolution is the sequence appearing in (6.1). By $A = A_0 \( 1 - cal(E) \) \/ 2$, it suffices to prove the assertion with $A_0 \( u \) epsilon \( u \)$, for each of the two choices
  $ epsilon = 1 quad upright("or") quad epsilon = cal(E) . $
  The choice will be the same at the two endpoints of each correlation.
  ===== 6.1 Removing a large group-prime part. <removing-a-large-group-prime-part.>
  Choose a fixed band index $j_(* *)$ so large that
  #[#set math.equation(numbering: n => "(6.3)")
   $ tau = c_1 s' 2^(- j_(* *)) > 0 \, #h(2em) eta = c_2 s' 2^(- j_(* *)) < min \( b_(*) \/ 4 \, 1 \/ 4 \) . $ <ti:designated-range>]
  For sufficiently large $x$, this band is present. Designate one of its labelled slots, whose prime therefore lies in $\[ x^tau \, x^eta \]$. This merely names an existing slot in the weight.
  Put $u_P = u \/ u_(*)$. We first discard $u_P > x^(b_(*) \/ 4)$. For $u asymp x$, the part of $2 u + 1$ supported on primes exceeding $W$ has at most $O \( L \/ log W \) = O \( sqrt(L) \)$ prime factors with multiplicity. Its number of divisors is consequently at most $exp \( O \( sqrt(L) \) \)$, since $a + 1 lt.eq 2^a$ for $a gt.eq 1$. This bounds the possible rough divisors $m$. The tail bound in Lemma 17, with $d = 2 \/ 5$, gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ & sum_(m n = 2 u + 1 \, med u asymp x\
u_P > x^(b_(*) \/ 4)) \| alpha_m beta_n \| A_0 \( u \) \| Psi \( u \/ x \) \|\
 & #h(2em) lt.double x L^(O \( 1 \)) exp \( O \( sqrt(L) \) \) (sum_v frac(a \( v \), v)) sum_(r > x^(b_(*) \/ 4)\
r_(*) = 1) frac(W_1 \( r \), r) lt.double x L^(O \( 1 \)) exp (- b_(*) / 4 L^(1 - d) + O \( sqrt(L) \)) . $ <ti:large-group-error>]
  To obtain the first inequality, write $u = v r$, use $v r asymp x$ to bound $1 lt.double x \/ \( v r \)$, and then drop the product restriction. The harmonic ordinary-slot mass is $H_Q = L^(O \( 1 \))$. Since $1 - d > 1 \/ 2$, (6.4) is $O_H \( x L^(- H) \)$ for every fixed $H$. The same conclusion will hold whenever we reinstate these discarded tuples with a multiplier of absolute value at most one.
  ===== 6.2 A smooth allocation with bounded residual. <a-smooth-allocation-with-bounded-residual.>
  Set
  #[#set math.equation(numbering: n => "(6.5)")
   $ E = U L^(- K_0) \, $ <ti:E>]
  where the fixed positive constant $K_0$ will be chosen below. Put the entire group-prime part and the designated prime into $h$. Process all remaining ordinary slots by increasing band index, in a fixed order within each band, assigning each slot either to $e$ or to $h$. Write these slots as $p_1 \, dots.h \, p_N$, with band indices $j \( i \)$; here $N = r_0 \( j_x + 1 \) - 1 = O \( T \)$.
  Fix a smooth function $gamma : bb(R) arrow.r \[ 0 \, 1 \]$ equal to zero on $\( - oo \, 0 \]$ and to one on $\[ 1 \, oo \)$. At slot $i$, with residual target $R_i$, assign the prime to $e$ with weight
  $ gamma (frac(R_i - log p_i, s_(j \( i \)))) $
  and to $h$ with the complementary weight. Start with $R_1 = log E$, and subtract $log p_i$ from the residual precisely when the slot is assigned to $e$.
  For a tuple surviving the preceding deletion, the product withheld from allocation is at most $x^(b_(*) \/ 2)$. Since $u asymp x$ and $U lt.eq x^(1 - b_(*))$, its available logarithms satisfy, for large $x$,
  $ 0 < log E lt.eq sum_(i = 1)^N log p_i . $
  Every branch of positive weight has the invariant
  #[#set math.equation(numbering: n => "(6.6)")
   $ 0 lt.eq R_i lt.eq sum_(t = i)^N log p_t + \( c_2 + 1 \) s_(j_x) #h(2em) \( 1 lt.eq i lt.eq N + 1 \) . $ <ti:allocation-invariant>]
  Indeed, taking a slot requires $R_i > log p_i$, so preserves both nonnegativity and the upper bound after subtracting that logarithm. Skipping a slot in band $j$ requires
  $ R_i < log p_i + s_j lt.eq \( c_2 + 1 \) s_j . $
  If $j < j_x$, the next band has at least $r_0 - 1$ available slots and therefore total logarithm at least $\( r_0 - 1 \) c_1 s_j \/ 2 gt.eq \( c_2 + 1 \) s_j$. These slots are all still unprocessed. If $j = j_x$, the error term in (6.6) supplies the bound directly. This proves the invariant by induction, including the terminal step.
  The geometric sum of all unprocessed band scales is $O \( s_(j \( i \)) \)$. Thus (6.6) also places every argument $\( R_i - log p_i \) \/ s_(j \( i \))$ in one fixed compact interval, independently of $K_0$. At termination,
  $ 0 lt.eq log \( E \/ e \) = R_(N + 1) lt.eq \( c_2 + 1 \) s_(j_x) . $
  Choose once and for all $C_s > 40 \( c_2 + 1 \)$. Every surviving branch has
  #[#set math.equation(numbering: n => "(6.7)")
   $ E L^(- C_s) lt.eq e lt.eq E . $ <ti:e-range>]
  This choice of $C_s$ is independent of $K_0$.
  Choose a fixed smooth $rho : bb(R) arrow.r \[ 0 \, 1 \]$ of compact support which equals one throughout the possible argument interval, and put
  $ f_1 = rho gamma \, #h(2em) f_0 = rho \( 1 - gamma \) . $
  The allocation is unchanged on the retained tuples. On any tuple the sum of its full branch weights is at most one, since $f_0 + f_1 = rho lt.eq 1$ at every node of the choice tree. We may consequently impose (6.7) and reinstate all discarded tuples, with the same negligible error (6.4).
  ===== 6.3 Separation and its uniform cost. <separation-and-its-uniform-cost.>
  Use the Fourier convention
  $ hat(f) \( xi \) = integral_(bb(R)) f \( t \) e^(- i xi t) thin d t \, #h(2em) f \( t \) = integral_(bb(R)) hat(f) \( xi \) e^(i xi t) frac(d xi, 2 pi) \, $
  and set
  $ C_F = max (1 \, integral \| hat(f)_0 \( xi \) \| frac(d xi, 2 pi) \, integral \| hat(f)_1 \( xi \) \| frac(d xi, 2 pi)) . $
  For a fixed branch $delta = \( delta_1 \, dots.h \, delta_N \) in { 0 \, 1 }^N$, Fourier inversion of its $N$ transitions has total variation at most $C_F^N$. Summing over the branches costs at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ \( 2 C_F \)^N lt.eq L^(C_f) $ <ti:fourier-cost>]
  for a fixed exponent, increased below to include the fixed cutoff $Psi$. In particular this exponent is independent of $K_0$. Truncating each transition variable at $\| xi_i \| lt.eq L$ has total error at most
  #[#set math.equation(numbering: n => "(6.9)")
   $ 2^N N C_M C_F^(N - 1) L^(- M) $ <ti:fourier-tail>]
  for any fixed $M$, by the union bound on the complementary integration regions and the rapid decay of a single Fourier factor. The constant $C_M$ occurs only once in each term of this estimate. Increasing $M$ therefore does not increase the exponent arising from $C_F^N$.
  To see the separated phases explicitly, use $R_i = log E - sum_(t < i) delta_t log p_t$. The product of the Fourier phases is
  #[#set math.equation(numbering: n => "(6.10)")
   $ exp (i log E sum_(i = 1)^N xi_i / s_(j \( i \))) product_(t = 1)^N p_t^(i sigma_t) \, #h(2em) sigma_t = - xi_t / s_(j \( t \)) - delta_t sum_(i > t) xi_i / s_(j \( i \)) . $ <ti:slot-frequencies>]
  The dependence on $E$ is entirely in the scalar of modulus one. Since $sum_i s_(j \( i \))^(- 1) = O \( T^(- 1) \)$, the retained frequencies satisfy $\| sigma_t \| = O \( L \/ T \)$. Fourier inversion of the fixed smooth function $t mapsto Psi \( e^t \)$ likewise separates $Psi \( e h \/ x \)$, with bounded integral norm; truncation at a fixed power of $L$ has arbitrary logarithmic accuracy. Its contribution is a factor $h^(i 𝜚)$, a factor $e^(i 𝜚)$ absorbed into the coefficient of $e$, and a scalar of modulus one.
  All these errors can be summed before Cauchy–Schwarz. The original $m \, n$ restrictions still imply $u asymp x$, and the unmodified factorization mass is bounded by
  $ sum_(m n = 2 u + 1\
u asymp x) \| alpha_m beta_n \| A_0 \( u \) lt.double L^(O \( 1 \)) sum_(v asymp x) tau \( v \) lt.double x L^(O \( 1 \)) . $
  Here and below $tau$ is the divisor function. The same estimate applies to the labelled-slot sum with its original factorial normalization. Combining it with (6.9) proves an error $O_H \( x L^(- H) \)$ for arbitrary fixed $H$, without changing the fixed exponent in (6.8).
  Consequently the required sum is, up to these errors, a sum and integral of total variation at most $L^(C_f)$ of expressions
  #[#set math.equation(numbering: n => "(6.11)")
   $ B' & = sum_(e \, n) a_e \( e \) beta_n sum_(m n = 2 e h + 1) alpha_m a_h \( h \) \,\
a_h \( h \) & = h^(i 𝜚) epsilon \( h \) W_1 \( h \) H \( h_(*) \) \, #h(2em) H \( t \) = sum_(p r = t) upright(bold(1))_(p in Q_(j_(* *))) p^(i sigma) c_r . $ <ti:separated-bilinear>]
  The original $m \, n$ restrictions are in $alpha \, beta$, and the $e$ range (6.7) is in $a_e$. The prime in $H$ is the designated prime. Its phase can be taken to be zero at this stage; we allow a bounded-power frequency $sigma$ in the notation. All phases in (6.11) have fixed logarithmic-power bounds.
  Both $a_e$ and $c_r$ are bounded coefficients. In fact, for a fixed branch and a fixed product, disjointness of the bands determines the prime multiset in every band. There are at most $r_0 !$ assignments to the relevant labelled slots of any one band, even when primes repeat. Distributing the original factorial normalizations between the two coefficients only improves the resulting bound
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| a_e \( e \) \| \, \| c_r \| lt.eq \( r_0 ! \)^(j_x + 1) lt.eq L^(C_a) \, #h(2em) \| a_h \( h \) \| lt.eq L^(C_h) tau \( h_(*) \) . $ <ti:coefficient-bounds>]
  The last bound comes from summing over the designated prime divisor of $h_(*)$. The exponents $C_a \, C_h$ are fixed independently of $K_0$ and of the Fourier error accuracy. Only ordinary-band primes were assigned to $e$, so its removal leaves the marked group weight and the sign exactly on $h$, as used in (6.11).
  ===== 6.4 Cauchy–Schwarz and the diagonal. <cauchyschwarz-and-the-diagonal.>
  Choose bounded nonnegative smooth majorants $eta_e \, eta_n$, equal to at least one on the $e \, n$ ranges. We can arrange
  $ "supp" eta_e subset \[ 1 / 2 L^(- C_s) \, 2 \] \, #h(2em) "supp" eta_n subset \[ 1 \/ 2 \, 3 \] \, #h(2em) parallel eta_e^(\( j \)) parallel_oo + parallel eta_n^(\( j \)) parallel_oo lt.double_j L^(C_eta \( j + 1 \)) \, $
  where $C_eta$ depends only on $C_s$. There are $O \( E V \)$ pairs $\( e \, n \)$ in the original ranges. Hence (6.12) and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(6.13)")
   $ \| B' \|^2 lt.double E V L^(C_p) cal(N) \, #h(2em) cal(N) = sum_(e \, n) eta_e \( e \/ E \) eta_n \( n \/ V \) lr(|sum_(m n = 2 e h + 1) alpha_m a_h \( h \)|)^2 . $ <ti:cauchy>]
  Here $C_p$ is fixed independently of $K_0$.
  The diagonal $m = m'$ in the square forces $h = h'$. Collecting by $v = m n$ and then using (6.12) gives
  #[#set math.equation(numbering: n => "(6.14)")
   $ cal(N)_(upright("diag")) & lt.double L^(C_d) sum_(v asymp x\
v med upright("odd")) tau \( v \) sum_(e divides \( v - 1 \) \/ 2) tau (frac(v - 1, 2 e))^2\
 & lt.eq L^(C_d) sum_(v asymp x) tau \( v \) tau \( v - 1 \)^3 lt.double x L^(C'_d) . $ <ti:diagonal>]
  The final estimate follows from Cauchy–Schwarz and the fixed second and sixth moments of $tau$ in Proposition 3. Enlarging the $e$ divisor set in this calculation makes $C'_d$ independent of $K_0$. Since $E V asymp x L^(- K_0)$, the diagonal contribution to the right side of (6.13) is at most $x^2 L^(- K_0 + C_p + C'_d)$. We now fix
  #[#set math.equation(numbering: n => "(6.15)")
   $ K_0 > 2 \( D_(*) + C_f + 1 \) + C_p + C'_d . $ <ti:K-choice>]
  It remains to obtain an arbitrarily strong logarithmic saving for the off-diagonal part of $cal(N)$ with this fixed $K_0$.
  ===== 6.5 The off-diagonal change of variables. <the-off-diagonal-change-of-variables.>
  A pair of representations in the expanded square satisfies
  $ m n = 2 e h + 1 \, #h(2em) m' n = 2 e h' + 1 . $
  The first identity gives $\( n \, 2 e \) = 1$. Subtracting the two identities therefore gives a unique integer $k$ with
  #[#set math.equation(numbering: n => "(6.16)")
   $ m' - m = 2 e k \, #h(2em) h' - h = k n \, #h(2em) z = m' h \, #h(2em) z + k = m h' . $ <ti:determinant-forward>]
  Indeed $m h' - m' h = k \( m n - 2 e h \) = k$. On the off-diagonal $k eq.not 0$, and the lower support bound for $e$ gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ 0 < \| k \| lt.double L^(K_0 + C_s) . $ <ti:k-range>]
  For completeness, this parametrization is reversible for both signs of $k$. Start from positive factorizations $z = m' h$, $z + k = m h'$, require $m' equiv m med \( mod med 2 \| k \| \)$, and put
  #[#set math.equation(numbering: n => "(6.18)")
   $ e = frac(m' - m, 2 k) > 0 \, #h(2em) n = frac(2 e h + 1, m) . $ <ti:determinant-reverse>]
  The first quantity is an integer. The determinant identity implies
  $ m \( h' - h \) = k \( 2 e h + 1 \) . $
  Since $P^(-) \( m \) > W$ and $k$ has the fixed logarithmic-power bound (6.17), we have $\( m \, k \) = 1$ for large $x$. Thus $n$ is a positive integer and $h' - h = k n$. Substituting $m' = m + 2 e k$ recovers $m' n = 2 e h' + 1$. Every reconstructed variable is unique. Applying the size cutoffs in (6.13) therefore gives an exact bijection, with no additional multiplicity or divisibility condition.
  Both $m \, m'$ are odd and coprime to $k$. With $q_k = 2 \| k \|$, their congruence is imposed exactly by
  #[#set math.equation(numbering: n => "(6.19)")
   $ upright(bold(1))_(m' equiv m med \( upright("mod") med q_k \)) = frac(1, phi \( q_k \)) sum_(chi med \( upright("mod") med q_k \)) chi \( m \) overline(chi \( m' \)) . $ <ti:character-orthogonality>]
  The normalized character sum has total coefficient mass one.
  ===== 6.6 The pulled-back cutoffs. <the-pulled-back-cutoffs.>
  On the supports above, $h asymp x \/ e$ and $m' asymp U$. Thus $z asymp U x \/ e$ lies between fixed constant multiples of $x L^(K_0)$ and $x L^(K_0 + C_s)$. Insert a smooth dyadic partition in $z$, retaining an outer cutoff $psi_Z \( z \/ Z \)$ in every piece. Only $O \( 1 + T \)$ dyads are needed, and all have $Z = x L^(O \( 1 \))$.
  For a fixed $k \, Z$, put
  $ t_1 = log \( m \/ U \) \, quad t_2 = log \( m' \/ U \) \, quad t_3 = log \( z \/ Z \) . $
  The arguments of the two majorants are exactly
  #[#set math.equation(numbering: n => "(6.20)")
   $ e / E & = frac(m' - m, 2 k E) = frac(U, 2 k E) \( e^(t_2) - e^(t_1) \) \,\
n / V & = 1 / V (frac(\( m' - m \) z, k m m') + 1 / m)\
 & = frac(Z, k U V) e^(t_3) \( e^(- t_1) - e^(- t_2) \) + frac(1, U V) e^(- t_1) . $ <ti:pulled-cutoffs>]
  On a fixed compact box in these coordinates, every log-coordinate derivative of the first expression is $O_j \( U \/ \( \| k \| E \) \)$, and every derivative of the second is
  $ O_j (frac(Z, \| k \| U V) + frac(1, U V)) . $
  All these quantities are bounded by fixed powers of $L$ after (6.15). The chain rule and the derivative bounds for $eta_e \, eta_n$ therefore give, for each multi-index $nu$,
  #[#set math.equation(numbering: n => "(6.21)")
   $ parallel partial^nu b_(k \, Z) parallel_oo lt.double_nu L^(C_0 \( \| nu \| + 1 \)) $ <ti:pulled-derivatives>]
  for the pulled-back product of majorants, multiplied by fixed smooth buffers in $t_1 \, t_2 \, t_3$. Choose these buffers to equal one on the original $m \, m'$ dyads and on the support of the outer $z$ cutoff. This places $b_(k \, Z)$ on a fixed compact box and leaves the sequence $alpha$ unchanged. The majorants vanish in neighborhoods of nonpositive $e \/ E$ and $n \/ V$, so extending the product by zero across those regions is smooth. Positivity in (6.18) is thereby imposed by the same cutoffs.
  This is the fixed-dimensional setting of Lemma 5. Choose a fixed $C_8$ larger than the slope required in (6.21), and put $P = L^(C_8)$. Repeated integration by parts in these three coordinates gives
  $ \| hat(b)_(k \, Z) \( bold(xi) \) \| lt.double_j \( 1 + \| bold(xi) \| \/ P \)^(- j) \, #h(2em) integral_(bb(R)^3) \| hat(b)_(k \, Z) \( bold(xi) \) \| thin d bold(xi) lt.double P^3 \, $
  and
  #[#set math.equation(numbering: n => "(6.22)")
   $ integral_(\| bold(xi) \| > P L) \| hat(b)_(k \, Z) \( bold(xi) \) \| thin d bold(xi) lt.double_j P^3 L^(3 - j) . $ <ti:post-fourier-tail>]
  Consequently the cutoffs separate into phases $m^(i xi_1) \( m' \)^(i xi_2) z^(i xi_3)$ at fixed logarithmic-power cost and with fixed logarithmic-power frequencies. Scalars involving $U$ and $Z$ have modulus one.
  To justify the tails absolutely, an endpoint convolution is bounded by $L^(O \( 1 \)) tau \( v_(*) \)^2$: there are at most $tau_3 \( v_(*) \) lt.eq tau \( v_(*) \)^2$ triples $m p r = v_(*)$. Including the bounded group weights and dropping the congruence, Cauchy–Schwarz and the fixed fourth divisor moment in Proposition 3 give
  #[#set math.equation(numbering: n => "(6.23)")
   $ L^(O \( 1 \)) sum_(z asymp Z) tau \( z \)^2 tau \( z + k \)^2 lt.double Z L^(O \( 1 \)) . $ <ti:absolute-correlation>]
  Here $\| k \| lt.double L^(O \( 1 \)) = o \( Z \)$ and both positions are positive. This estimate controls (6.22), after summing over all $k$ and $Z$, to arbitrary logarithmic accuracy by increasing $j$. The fixed exponent $C_8$ need not increase with that accuracy.
  ===== 6.7 Identifying the two endpoints. <identifying-the-two-endpoints.>
  Fix one character in (6.19) and one retained Fourier term. Before the character and Fourier factors, the coefficient from the expanded square is
  $ alpha_m overline(alpha_(m')) a_h \( h \) overline(a_h \( h' \)) . $
  Define invariant cores, for positive integers $v$, by
  #[#set math.equation(numbering: n => "(6.24)")
   $ F_0 \( v \) & = sum_(m p r = v_(*)) alpha_m chi \( m \) m^(i \( 𝜚 - xi_2 \)) upright(bold(1))_(p in Q_(j_(* *))) p^(- i sigma) overline(c_r) \,\
G_0 \( v \) & = sum_(m p r = v_(*)) alpha_m chi \( m \) m^(i \( xi_1 + 𝜚 \)) upright(bold(1))_(p in Q_(j_(* *))) p^(- i sigma) overline(c_r) . $ <ti:endpoint-cores>]
  Both cores contain the original restricted sequence $alpha$. All group primes are below $W$, whereas $m \, m'$ have no prime factor at most $W$. Therefore
  #[#set math.equation(numbering: n => "(6.25)")
   $ z_(*) = m' h_(*) \, #h(2em) \( z + k \)_(*) = m h'_(*) \,\
W_1 \( z \) = W_1 \( h \) \, quad W_1 \( z + k \) = W_1 \( h' \) \, #h(2em) epsilon \( z \) = epsilon \( h \) \, quad epsilon \( z + k \) = epsilon \( h' \) . $ <ti:group-identities>]
  Using also $h = z \/ m'$ and $h' = \( z + k \) \/ m$, direct expansion shows that the separated sum is precisely
  #[#set math.equation(numbering: n => "(6.26)")
   $ sum_(z > 0\
z + k > 0) psi_Z \( z \/ Z \) z^(i \( 𝜚 + xi_3 \)) \( z + k \)^(- i 𝜚) overline(F_0 \( z \)) G_0 \( z + k \) W_1 \( z \) W_1 \( z + k \) epsilon \( z \) epsilon \( z + k \) . $ <ti:separated-correlation>]
  For example, conjugating the first core supplies $overline(alpha_(m')) overline(chi \( m' \)) \( m' \)^(i \( xi_2 - 𝜚 \)) H \( h_(*) \)$, while the second core supplies $alpha_m chi \( m \) m^(i \( xi_1 + 𝜚 \)) overline(H \( h'_(*) \))$. The remaining powers in (6.26) give exactly $h^(i 𝜚) \( h' \)^(- i 𝜚) z^(i xi_3)$. Thus the discrepancy-bearing first core has the required coefficient $alpha$, with its conjugation occurring outside that core.
  Every hypothesis of Theorem 12 is now satisfied. The designated slot is a prime in the fixed range (6.3); the residual coefficients are bounded by (6.12); the character modulus $2 \| k \|$ and all frequencies have fixed logarithmic-power bounds; and the two endpoints have the same allowed sign. Finally, set
  $ tilde(psi)_Z \( t \) = t psi_Z \( t \) . $
  Then $psi_Z \( z \/ Z \) = \( Z \/ z \) tilde(psi)_Z \( z \/ Z \)$. Consequently (6.26) is exactly $Z$ times a harmonic correlation covered by that theorem. For any prescribed $D_0$ it is therefore
  #[#set math.equation(numbering: n => "(6.27)")
   $ O \( Z L^(- D_0) \) \, $ <ti:correlation-bound>]
  provided the discrepancy exponent $B$ is chosen sufficiently large after all the fixed bounds and $D_0$.
  ===== 6.8 Completing the parameter choices. <completing-the-parameter-choices.>
  Here is an explicit ordering of the choices. First fix the weight geometry, $b_(*) \, D_(*) \, C$, the designated band, the allocation functions, and the cutoff. These determine the exponents
  $ C_s \, med C_a \, med C_h \, med C_f \, med C_p \, med C'_d . $
  Fix $K_0$ by (6.15). This fixes the derivative and frequency bounds after Cauchy–Schwarz, the Fourier scale $P$, and exponents $K_k \, K_z \, C_(upright("sep"))$ such that there are at most $L^(K_k)$ shifts, $Z lt.eq x L^(K_z)$, and the total post-Cauchy separation cost, including the dyads, is at most $L^(C_(upright("sep")))$. These exponents are all fixed.
  Choose $A_(upright("off")) > 0$ so that
  $ - K_0 + C_p - A_(upright("off")) < - 2 \( D_(*) + C_f + 1 \) \, $
  and then choose
  $ D_0 > A_(upright("off")) + K_k + K_z + C_(upright("sep")) + 2 . $
  Choose the differentiation orders in the Fourier tail estimates large enough for the same error target. Theorem 12 now supplies a sufficiently large fixed $B$. Summing (6.27) over shifts, dyads, characters, and the retained Fourier integrals gives
  $ \| cal(N)_(upright("off")) \| lt.double x L^(- A_(upright("off"))) . $
  Together with (6.14), (6.15), and (6.13), this proves $\| B' \| lt.double x L^(- D_(*) - C_f - 1)$. The total pre-Cauchy variation $L^(C_f)$ and the arbitrarily small previously discarded errors prove (6.2) for each choice of $epsilon$, and hence for $A$. ◻
]

#prodef([Remark 6.2.])[
  (Precision in subsequent proxy replacements).  Theorem 20 permits the actual interval restriction to be included in $alpha$, and it asks only for boundedness of the other coefficient. Thus it can be applied a second time after exchanging the two factors, even if the first coefficient has already been replaced by a nonsmooth bounded proxy. On $O \( L \)$ contributing factor dyads, its total error is $O \( x L^(- D_(*) + 1) \)$. The lower bound $X_A gt.double x L^(- C_A)$ in Lemma 18 makes this $o \( X_A \/ L \)$ whenever $D_(*) > C_A + 2$.
  In particular, if a later proxy construction has coefficients bounded by one independently of its logarithmic cell precision $S_1$, use that coefficient bound when making all the choices above. First fix $K_0$, the shifted-correlation accuracy, and finally the discrepancy exponent $B$; only afterwards choose the proxy precision $S_1 > 2 B + 3$. Neither $C_f$ nor the coefficient or diagonal exponents depends on $S_1$. Increasing $S_1$ therefore changes only how large $x$ must be and does not reopen any earlier choice.
] <ti:proxy-order>

== 7 Distribution in congruence classes <cg:section>

For an odd squarefree integer $d$ define

#[#set math.equation(numbering: n => "(7.1)")
 $ r \( d \) = sum_(u gt.eq 1\
2 u + 1 equiv 0 med \( mod med d \)) A \( u \) Psi \( u \/ x \) - frac(X_A, phi \( d \)) . $ <cg:remainder>]

The following estimate supplies the distribution needed by the sieve. Its proof uses only the prime slot in $Q_0$, the weight bounds already proved, and the classical Siegel–Walfisz and multiplicative large sieve estimates in [4] Section “Notation and preliminary estimates”.

#thm([Theorem 7.1.])[
  (Congruence distribution).  #emph[For every fixed $0 < theta.alt < 1 \/ 2$ and $D > 0$, 
$ sum_(d lt.eq x^theta.alt\
d med upright(o d d med a n d med s q u a r e f r e e)) \| r \( d \) \| lt.double_(theta.alt \, D) x L^(- D) + X_A L^(- 18) . $

 The constants may depend on the fixed weight geometry and $Psi$, but not on any later proxy precision. No effective bound on the threshold for $x$ is asserted.]
] <cg:distribution>

#proof[
  Write $Q = x^theta.alt$ and $w \( u \) = A \( u \) Psi \( u \/ x \)$. The congruence in Equation (7.1) is the single unit class $a_d equiv - 2^(- 1) med \( mod med d \)$. Character orthogonality gives the exact identity
  #[#set math.equation(numbering: n => "(7.2)")
   $ r \( d \) = frac(1, phi \( d \)) sum_(chi med mod med d\
chi eq.not chi_0) overline(chi \( a_d \)) sum_u w \( u \) chi \( u \) - frac(1, phi \( d \)) sum_(\( u \, d \) > 1) w \( u \) . $ <cg:characters>]
  We first bound the correction in the second term. Mertens’ estimate implies
  #[#set math.equation(numbering: n => "(7.3)")
   $ sum_(h lt.eq Q) frac(mu^2 \( h \), phi \( h \)) lt.eq product_(p lt.eq Q) (1 + frac(1, p - 1)) lt.double L . $ <cg:totient-sum>]
  For a fixed $u$ in the effective support of $w$, we have $x lt.eq u lt.eq 2 x$ and every prime divisor of $u$ is at least $L^20$. Writing a squarefree $d$ divisible by $p$ as $p h$, and then using a union bound, gives
  $ sum_(d lt.eq Q\
d med upright("squarefree")\
\( d \, u \) > 1) frac(1, phi \( d \)) lt.eq sum_(p divides u) frac(1, p - 1) sum_(h lt.eq Q) frac(mu^2 \( h \), phi \( h \)) lt.double L sum_(p divides u) frac(1, p - 1) lt.double L^(- 18) . $
  For the last inequality, $u$ has at most $log \( 2 x \) \/ \( 20 T \)$ distinct prime divisors. Since $w gt.eq 0$, the total principal correction is therefore $O \( X_A L^(- 18) \)$.
  To treat the nonprincipal characters, delete one designated ordered slot of $Q_0$ from the definition of $a$. Retain the original divisor $\( r_0 ! \)^(j_x + 1)$ in the resulting coefficient, denoted by $a^(-) \( v \)$. If the residual exponents are $e_p$, then
  $ a^(-) \( v \) = 1 / r_0 product_(j = 0)^(j_x) product_(p in Q_j) frac(1, e_p !) lt.eq 1 / r_0 \, $
  with $r_0 - 1$ slots in $Q_0$ and $r_0$ slots in every other band, and $a^(-) \( v \) = 0$ off this support. Partitioning ordered tuples by the deleted prime gives, including when primes repeat,
  $ a \( v \) = sum_(p in Q_0\
p divides v) a^(-) \( v \/ p \) . $
  The $Q_0$-primes lie outside $cal(P)$, so removing that slot changes neither $W_1$ nor $cal(E)$. Consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ A \( u \) = sum_(p r = u\
p in Q_0) b \( r \) \, #h(2em) b \( r \) = W_1 \( r \) frac(1 - cal(E) \( r \), 2) a^(-) \( r_(*) \) \, #h(2em) \| b \( r \) \| lt.eq L^(B_0) \, $ <cg:prime-convolution>]
  where $B_0$ is fixed by the weight geometry.
  Split $p \, r$ into dyads of sizes $P \, R$. Only $O \( L \)$ pairs of dyads contribute, and on these $P R asymp x$. Since $x^(c_1 s') lt.eq p lt.eq x^(c_2 s')$, there is a fixed $c > 0$, depending only on Equation (5.1), such that
  #[#set math.equation(numbering: n => "(7.5)")
   $ P \, R gt.eq x^c $ <cg:factor-ranges>]
  for every contributing pair and all sufficiently large $x$. For example any $c < min \( c_1 s' \, 1 - c_2 s' \)$ suffices.
  Every character modulo an odd squarefree $d$ is induced by a unique primitive character $chi_f$ of conductor $f divides d$. Write $d = f h$; then $\( f \, h \) = 1$ and $phi \( d \) = phi \( f \) phi \( h \)$. For such an induced character,
  $ chi \( p r \) = chi_f \( p \) chi_f \( r \) upright(bold(1))_({ \( p \, h \) = 1 }) upright(bold(1))_({ \( r \, h \) = 1 }) . $
  The nonprincipal characters have $f > 1$; there is no multiplicity in this parametrization. After applying the triangle inequality in Equation (7.2), it remains to bound sums of the form
  #[#set math.equation(numbering: n => "(7.6)")
   $ sum_(h lt.eq Q\
h med upright(o d d med a n d med s q u a r e f r e e)) frac(1, phi \( h \)) sum_(1 < f lt.eq Q \/ h\
f med upright(o d d med a n d med s q u a r e f r e e)\
\( f \, h \) = 1) & frac(1, phi \( f \)) sum_(chi_f med mod med f)^(*)\
 & quad dot.op lr(|sum_(p in Q_0 \, med p asymp P\
r asymp R) b \( r \) chi_f \( p r \) upright(bold(1))_({ \( p r \, h \) = 1 }) Psi \( p r \/ x \)|) . $ <cg:primitive-sum>]
  Here and below the asterisk denotes primitive characters. Modulus restrictions may be discarded in nonnegative majorants, which will be useful when applying the large sieve.
  Choose a fixed $K$ later, and first consider the conductors $f > L^K$. Put $psi \( v \) = Psi \( e^v \)$ and $hat(psi) \( t \) = integral_(bb(R)) psi \( v \) e^(- i t v) thin d v$. Fourier inversion gives
  $ Psi \( p r \/ x \) = frac(1, 2 pi) integral_(bb(R)) hat(psi) \( t \) x^(- i t) p^(i t) r^(i t) thin d t \, #h(2em) integral_(bb(R)) \| hat(psi) \( t \) \| thin d t lt.double_Psi 1 . $
  There is no frequency truncation error. For fixed $h \, t$, define
  $ cal(P)_h \( chi \, t \) = sum_(p in Q_0 \, med p asymp P\
\( p \, h \) = 1) chi \( p \) p^(i t) \, #h(2em) cal(R)_h \( chi \, t \) = sum_(r asymp R\
\( r \, h \) = 1) b \( r \) chi \( r \) r^(i t) . $
  Their coefficient squared norms are at most $O \( P \)$ and $O \( R L^(2 B_0) \)$, respectively, uniformly in $h \, t$. On a conductor dyad $F < f lt.eq 2 F$, Cauchy–Schwarz followed by the primitive multiplicative large sieve therefore yields
  #[#set math.equation(numbering: n => "(7.7)")
   $ sum_(F < f lt.eq 2 F) frac(1, phi \( f \)) sum_(chi_f med mod med f)^(*) \| cal(P)_h \( chi_f \, t \) cal(R)_h \( chi_f \, t \) \| & lt.double L^(B_0) / F sqrt(\( P + F^2 \) \( R + F^2 \) P R)\
 & lt.double x L^(B_0) (1 / F + 1 / sqrt(P) + 1 / sqrt(R) + F / sqrt(x)) . $ <cg:large-sieve-bound>]
  Indeed $1 \/ phi \( f \) lt.double F^(- 1) f \/ phi \( f \)$ on this dyad, giving exactly the large sieve’s primitive-character weight. The masks $upright(bold(1))_(\( p \, h \) = 1) \, upright(bold(1))_(\( r \, h \) = 1)$ do not enlarge the coefficient norms.
  Integrate against $\| hat(psi) \|$, sum the conductor and factor dyads, and use Equation (7.3) for the remaining $h$-sum. Since $F lt.eq Q$, Equations (7.5) and (7.7) give a total at most
  #[#set math.equation(numbering: n => "(7.8)")
   $ x L^(B_2) (L^(- K) + x^(- c \/ 2) + x^(theta.alt - 1 \/ 2)) $ <cg:large-conductors>]
  for a fixed $B_2$ independent of $K$. One can use dyads intersected with $f > L^K$, so their lower endpoints are at least $L^K \/ 2$. In particular the summation over $h$ costs a logarithmic factor, not a factor $Q$. Taking $K > B_2 + D + 2$ makes Equation (7.8) $O \( x L^(- D) \)$, because $theta.alt < 1 \/ 2$.
  It remains to consider $1 < f lt.eq 2 L^K$. For fixed $r asymp R$, apply Siegel–Walfisz to the nonprincipal character $chi_f$ on the prime interval $Q_0 ∩ \[ P \, 2 P \)$. Since $P gt.eq x^c$, the modulus is bounded by a fixed power of $log P$. Summing the residue-class estimate against $chi_f$ and asking for a stronger initial saving absorbs the at most $phi \( f \)$ classes. Partial summation, using the uniformly bounded supremum and total variation of $p mapsto Psi \( p r \/ x \)$ on this interval, gives, for any fixed $M$,
  #[#set math.equation(numbering: n => "(7.9)")
   $ sum_(p in Q_0\
p asymp P) chi_f \( p \) Psi \( p r \/ x \) lt.double_(K \, M) P L^(- M) . $ <cg:small-prime-sum>]
  This use of Siegel–Walfisz includes possible exceptional real characters; its potentially ineffective constants cause no problem.
  Imposing $\( p \, h \) = 1$ deletes only $O \( 1 \)$ terms in Equation (7.9): each deleted prime is at least $x^c$, while $h lt.eq x^theta.alt$, so there are at most $theta.alt \/ c + O \( 1 \)$ such primes. Thus the inner double sum in Equation (7.6) is at most
  $ R L^(B_0) #scale(x: 120%, y: 120%)[\(] P L^(- M) + O \( 1 \) #scale(x: 120%, y: 120%)[\)] lt.double x L^(B_0 - M) + x^(1 - c) L^(B_0) . $
  The other mask, $\( r \, h \) = 1$, only decreases this absolute bound. For the small conductors,
  $ sum_(1 < f lt.eq 2 L^K) frac(1, phi \( f \)) sum_(chi_f med mod med f)^(*) 1 lt.double L^K . $
  Combining this with Equation (7.3) and the number of factor dyads bounds the small-conductor contribution by
  #[#set math.equation(numbering: n => "(7.10)")
   $ x L^(B_3 + K - M) + x^(1 - c) L^(B_3 + K) $ <cg:small-conductors>]
  for a fixed $B_3$ independent of $K \, M$. Choose $M > B_3 + K + D + 2$. Equation (7.10) is then $O \( x L^(- D) \)$. Together with the large-conductor estimate and the principal correction, this proves the theorem. ◻
]

== 8 Prime extraction <ex:section>

Put $N_u = 2 u + 1$ and $a_x \( u \) = A \( u \) Psi \( u \/ x \)$, so that $a_x \( u \) gt.eq 0$ and $X_A = sum_u a_x \( u \)$. Throughout this section the band geometry, the even integer $r_0$, the damping $q_0 = 1 \/ 2$, and $Psi$ are the fixed data of the weight construction. In particular, Lemma 18 gives

#[#set math.equation(numbering: n => "(8.1)")
 $ X_A asymp x / L H_Q H_P \, #h(2em) X_A gt.double x L^(- C_A) \, #h(2em) H_P gt.eq 1 . $ <ex:mass-reminder>]

We use the Type II and congruence distribution results proved above, together with the following explicitly stated sieve and proxy inputs.

=== 8.1 Sieve and proxy inputs <sieve-and-proxy-inputs>

#thm([Lemma 8.1.])[
  (Block sieve, imported).  #emph[Consider finitely many objects with nonnegative weights and, at some primes $p lt.eq z$, designated bad conditions. Suppose that for every squarefree product $d$ of these primes, including $d = 1$, the weight on which all conditions indexed by $p divides d$ hold is $X g \( d \) + r \( d \)$. Here $X gt.eq 0$, $g$ is multiplicative, and, for fixed $eta_0 > 0$ and $C$, one has 
$ 0 lt.eq g \( p \) lt.eq 1 - eta_0 \, #h(2em) sum_(w < p lt.eq w^2) g \( p \) lt.eq C quad \( w > 1 \) . $

 For every sufficiently large even integer $h$, the weight avoiding all the bad conditions equals 
#[#set math.equation(numbering: n => "(8.2)")
 $ X product_(p lt.eq z) \( 1 - g \( p \) \) \( 1 + O \( e^(- h) \) \) + O #h(-0.16667em) (sum_(d lt.eq z^(4 h + 2)\
d upright(" squarefree")) \| r \( d \) \|) . $ <ex:block-formula>]

 The products and sums use only the designated primes. Constants depend only on the two density bounds, and are uniform when $h$ grows. For $h = 2$ there is an upper bound by a fixed constant times the displayed main term, plus the same remainder sum.]
  #emph[The upper and lower inclusion–exclusion polynomials have coefficients of absolute value at most one, supported on squarefree $d lt.eq z^(4 h + 2)$. The upper polynomial is nonnegative. Its overcount is bounded by the nonnegative difference between the upper and lower polynomials; that difference also has coefficients of absolute value at most one and the same support bound.]
] <ex:block-sieve>

This is the Block sieve, Lemma 2.9 of [4]. Its coefficient bound, its growing-$h$ uniformity, and its fixed-depth upper bound will each be used below. No sieve assertion about the present weight is included in the import: its required remainder estimates come from Theorem 22 or from the explicit box count below.

Define

#[#set math.equation(numbering: n => "(8.3)")
 $ V \( y \) & = product_(p lt.eq y) \( 1 - 1 \/ p \) \, #h(2em) V_1 \( y \) = product_(3 lt.eq p lt.eq y) \( 1 - 1 \/ \( p - 1 \) \) \,\
frak(S) & = 2 product_(p gt.eq 3) (1 - frac(1, \( p - 1 \)^2)) > 0 . $ <ex:euler-products>]

Mertens’ estimate and the convergent quotient product give

#[#set math.equation(numbering: n => "(8.4)")
 $ V \( y \) tilde.op frac(e^(- gamma_E), log y) \, #h(2em) V_1 \( y \) tilde.op frak(S) V \( y \) \, $ <ex:mertens>]

where $gamma_E$ is Euler’s constant.

Here are the proxy estimates we use. For the moment let $0 < kappa < 1 \/ 50$ and $0 < b_1 < 1 \/ 2 - kappa$ be arbitrary fixed numbers, and let $\( gamma \, gamma' \]$ range over a fixed finite partition of $\( b_1 \, 1 \/ 2 - kappa \]$. On $\[ x^(b_1 \/ 4) \, x^(1 - b_1 \/ 4) \]$ consider the tests

$ I_(upright("pr")) \( m \) = upright(bold(1))_(m upright(" prime")) \, #h(2em) I_gamma \( m \) = upright(bold(1))_(P^(-) \( m \) > x^gamma) . $

For a fixed precision $S_1 > 0$, partition the logarithmic axis into cells of width $Delta_L = L^(- S_1)$. On every full cell $C_Y = \( Y \, e^(Delta_L) Y \]$ meeting the ambient interval, put

#[#set math.equation(numbering: n => "(8.5)")
 $ c_I \( C_Y \) = frac(sum_(m in C_Y) I \( m \), \# { m in C_Y : P^(-) \( m \) > W }) \, #h(2em) B_I \( m \) = c_I \( C_Y \) upright(bold(1))_(P^(-) \( m \) > W) quad \( m in C_Y \) . $ <ex:proxy-definition>]

Even if a later factor range cuts a cell, both counts in this definition are taken on the full cell. Range restrictions are applied only after the ratio has been defined.

#thm([Lemma 8.2.])[
  (Proxy estimates, imported).  #emph[For sufficiently large $x$, the denominators in (8.5) are positive and $0 lt.eq c_I lt.eq 1$. For every fixed $B > 0$, every fixed $S_1 > 2 B + 3$, and every interval $K$ inside a dyad in the stated factor ranges, the sequence 
$ alpha_m = \( I \( m \) - B_I \( m \) \) upright(bold(1))_(m in K) $

 vanishes outside $P^(-) \( m \) > W$, has absolute value at most one, and satisfies 
#[#set math.equation(numbering: n => "(8.6)")
 $ lr(|sum_(m in J) alpha_m chi \( m \) m^(- 1 + i t)|) lt.eq L^(- B) $ <ex:proxy-discrepancy>]

 for every interval $J subset \[ 1 \, x^2 \]$, every Dirichlet character of modulus at most $L^B$, and every $\| t \| lt.eq L^B$.]
  #emph[Write 
$ cal(B)_kappa = \[ x^(1 \/ 2 - 2 kappa) \, x^(1 \/ 2 + 2 kappa) \] . $

 There is an absolute constant $C_(upright("pr"))$ such that 
#[#set math.equation(numbering: n => "(8.7)")
 $ c_(upright("pr")) \( m \) lt.eq frac(C_(upright("pr")), L V \( W \)) #h(2em) \( m in cal(B)_kappa \) . $ <ex:prime-density>]

 The constant is independent of $kappa$ and $S_1$; the threshold for $x$ may depend on all fixed parameters.]
  #emph[For $w > gamma > 0$, set 
#[#set math.equation(numbering: n => "(8.8)")
 $ D_gamma \( w \) = 1 / w + sum_(l gt.eq 2) frac(1, l !) integral_(t_i gt.eq gamma med \( 1 lt.eq i < l \)\
sum_(i < l) t_i lt.eq w - gamma) frac(product_(i < l) \( d t_i \/ t_i \), w - sum_(i < l) t_i) . $ <ex:rough-density>]

 This sum is locally finite and nonnegative, and is jointly continuous on compact subsets of $w > gamma > 0$, including the thresholds $w = l gamma$. If $m n = N_u$ on the support of $Psi \( u \/ x \)$ and $log n \/ L in \( gamma \, gamma' \]$, then 
#[#set math.equation(numbering: n => "(8.9)")
 $ c_gamma \( m \) lt.eq frac(sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) + o \( 1 \), L V \( W \)) . $ <ex:rough-proxy-bound>]

 Here the parameters are restricted to a compact subset of $w > gamma > 0$, as holds for the bins under consideration. For fixed sufficiently small $b > 0$, 
#[#set math.equation(numbering: n => "(8.10)")
 $ integral_b^(1 \/ 2) D_alpha \( 1 - alpha \) frac(d alpha, alpha) & = D_b \( 1 \) - 1 \,\
D_b \( 1 \) & lt.eq e^(- gamma_E) / b \( 1 + O \( e^(- c \/ b) \) \) $ <ex:density-integral>]

 with an absolute $c > 0$. The endpoint of the integral is interpreted by its left limit.]
] <ex:proxies>

The discrepancy assertion and the density assertions are, respectively, Lemmas 7.3 and 7.4 of [4], in the section “Extracting primes with smooth predecessors.” These results concern ordinary integer cells; their hypotheses contain no candidate weight. In particular they apply to the present $A$. The exact bound $c_I lt.eq 1$ also follows directly because each test selects a subset of the $W$-rough integers in its cell. Thus the coefficient bounds of both $B_I$ and $I - B_I$ do not depend on the precision $S_1$. In (8.9),

$ frac(log m, L) = 1 - frac(log n, L) + O \( 1 \/ L \) \, #h(2em) frac(log m, L) - gamma gt.eq 2 kappa + O \( 1 \/ L \) \, $

which verifies the required separation from $w = gamma$. Every little-oh assertion in the proxy estimates is taken only after its parameters have been fixed.

=== 8.2 A uniform positive pair bound <a-uniform-positive-pair-bound>

We first prove an upper bound that uses only the original weight geometry. This establishes the constant needed to choose $kappa$ without referring to $b_1$, the Type II discrepancy exponent, or the eventual proxy precision.

Choose a sufficiently large fixed integer $j'$ and a fixed $theta$ in the gap

#[#set math.equation(numbering: n => "(8.11)")
 $ c_2 s' 2^(- j') < theta < c_1 s' 2^(- j' + 1) \, #h(2em) 10 theta lt.eq 1 / 20 \, #h(2em) sum_(j gt.eq j') r_0 c_2 s' 2^(- j) lt.eq 1 / 25 . $ <ex:micro-choice>]

Such choices exist because $c_2 < 2 c_1$, and all endpoints decrease geometrically. Call $Q_j$ with $j gt.eq j'$ the micro bands and those with $j < j'$ the macro bands.

#thm([Lemma 8.3.])[
  (Assignment and mask majorant).  #emph[An assignment $a$ consists of the complete ordered $r_0$-tuples in all the micro bands and one prime mark from each $cal(P)_g$. Let $D_1 = D_1 \( a \)$ be their product, with multiplicities retained, and put 
$ lambda_a = product_(j = j')^(j_x) frac(1, r_0 !) product_g V_g^(- 1) . $

 For sufficiently large $x$, 
#[#set math.equation(numbering: n => "(8.12)")
 $ D_1 lt.eq x^(1 \/ 20) \, #h(2em) sum_a lambda_a / D_1 lt.double H_Q \, #h(2em) sum_a lambda_a lt.double x^(1 \/ 20) H_Q . $ <ex:assignment-masses>]

 For each assignment, ban every odd non-$cal(P)$ prime at most $x^theta$ not dividing $D_1$, and independently ban each $cal(P)$ prime not dividing $D_1$ with probability $1 - q_0$. With expectation over this finite random mask, 
#[#set math.equation(numbering: n => "(8.13)")
 $ A \( u \) lt.eq A_0 \( u \) lt.eq sum_a lambda_a upright(bold(1))_(D_1 divides u) thin bb(E)_a upright(bold(1))_(u upright(" is divisible by no banned prime")) . $ <ex:positive-majorant>]

 The constants in (8.12) depend only on the fixed weight geometry and $j'$.]
] <ex:mask>

#proof[
  The product of the micro entries is at most $x^(1 \/ 25)$ by (8.11). There are $O \( T \)$ marks and every mark is at most $exp \( L^(2 \/ 5) \)$, so their product is $exp \( O \( T L^(2 \/ 5) \) \) = x^(o \( 1 \))$. This proves the asserted bound for $D_1$, including assignments with repeated micro entries. Write
  $ H_Q^(upright("mic")) = product_(j = j')^(j_x) frac(1, r_0 !) (sum_(p in Q_j) 1 / p)^(r_0) . $
  Summing the reciprocal product of the marks gives $product_g \( V_g^(- 1) sum_(p in cal(P)_g) p^(- 1) \) = 1$. Consequently $sum_a lambda_a \/ D_1 = H_Q^(upright("mic")) lt.double H_Q$: only finitely many fixed band factors, bounded above and below, have been omitted from $H_Q$. The last assertion in (8.12) follows by multiplying by the bound for $D_1$.
  To prove the majorant, fix $u$ with $A_0 \( u \) > 0$ and a compatible choice of ordered micro entries and marks. The band gap in (8.11) implies that all non-$cal(P)$ prime factors of $u$ below $x^theta$ are among these micro entries, whereas every macro prime exceeds $x^theta$. All group primes are below $x^theta$ for sufficiently large $x$. The only random survival conditions are therefore at the distinct unmarked group-prime divisors of $u$. There are exactly $omega_P \( u \) - s_P$ of them, so the survival probability is $q_0^(omega_P \( u \) - s_P)$, even when marked or unmarked primes occur to higher powers.
  Summing one mark per group with normalization $product_g V_g^(- 1)$ recovers the factor $W_1 \( u \)$. For a fixed prime multiset in any band, the number of ordered $r_0$-tuples divided by $r_0 !$ is $1 \/ product_p v_p ! lt.eq 1$. Summing the normalized compatible micro lists retains their exact contribution to $a \( u_(*) \)$; dropping the remaining macro-list contribution can only increase it. Thus the compatible assignments already dominate $A_0 \( u \)$. Incompatible assignments contribute nonnegative terms, proving (8.13). ◻
]

#thm([Lemma 8.4.])[
  (Positive dyadic pair estimate).  #emph[There is a constant $C_(upright("box"))$, depending only on the fixed weight data and the choices in (8.11), such that, on every dyadic box with $M_1 M_2 asymp x$ and $M_i lt.double x^0.54$, 
#[#set math.equation(numbering: n => "(8.14)")
 $ sum_(M_1 lt.eq m < 2 M_1 \, med M_2 lt.eq n < 2 M_2\
m n = N_u \, med P^(-) \( m \) \, P^(-) \( n \) > W) a_x \( u \) lt.eq C_(upright("box")) X_A V \( W \)^2 . $ <ex:box-bound>]

 The fixed constants in the size comparisons can be taken to cover all boxes meeting $m n = 2 u + 1$ with $u in \[ x \, 2 x \]$.]
] <ex:box>

#proof[
  Use Lemma 25 and bound $Psi$ by its fixed supremum. Fix an assignment and a mask. Since $D_1$ is odd, $D_1 divides u$ implies $m n equiv 1 med \( mod med D_1 \)$. We count all pairs in the box with this congruence, dropping both the parity of $m n$ and the remaining support restriction on $u$.
  For every odd prime $l lt.eq x^theta$ not dividing $D_1$, impose the bad condition $m n equiv 0 med \( mod med l \)$ when $l lt.eq W$, and the bad condition $m n equiv 1 med \( mod med l \)$ when $l$ is banned. There are $2 l - 1$ pairs of residues with product zero and $l - 1$ with product one; the two sets are disjoint. Hence the local number and density of bad residue pairs are
  #[#set math.equation(numbering: n => "(8.15)")
   $ nu \( l \) = \( 2 l - 1 \) upright(bold(1))_(l lt.eq W) + \( l - 1 \) upright(bold(1))_(l upright(" banned")) \, #h(2em) g \( l \) = frac(nu \( l \), l^2) . $ <ex:local-density>]
  In particular $g \( l \) lt.eq 7 \/ 9$ and $g \( l \) lt.eq 3 \/ l$. These give uniform density hypotheses for Lemma 23, independent of the assignment and mask.
  There are exactly $phi \( D_1 \)$ residue pairs with product one modulo $D_1$: choose the first unit and then its unique inverse. This statement does not require $D_1$ to be squarefree. For a squarefree $d$ built from the sieving primes, the Chinese remainder theorem gives exactly $phi \( D_1 \) nu \( d \)$ pairs modulo $D_1 d$, where $nu$ is multiplicative. Each pair of classes contributes
  $ frac(M_1 M_2, \( D_1 d \)^2) + O (1 + frac(M_1 + M_2, D_1 d)) . $
  Thus the base mass is $M_1 M_2 phi \( D_1 \) \/ D_1^2$, with local density $g \( d \)$. Since $nu \( d \) lt.eq d tau \( d \)^2$, the lattice remainders satisfy
  $ \| r_a \( d \) \| lt.double tau \( d \)^2 { M_1 + M_2 + D_1 d } . $
  Use the $h = 2$ upper bound in Lemma 23, whose level is $D = \( x^theta \)^10$. Fixed divisor-moment bounds give
  #[#set math.equation(numbering: n => "(8.16)")
   $ sum_(d lt.eq D) \| r_a \( d \) \| lt.double L^(C_0) { \( M_1 + M_2 \) D + D_1 D^2 } $ <ex:box-error>]
  for a fixed $C_0$. This includes $d = 1$ and is uniform in the mask.
  We next compare the sieve product with Mertens products. For $l lt.eq W$ banned by the mask, its factor is $1 - 3 \/ l + 2 \/ l^2$; for an allowed $l lt.eq W$ it is $\( 1 - 1 \/ l \)^2$. For $W < l lt.eq x^theta$ outside $D_1$, all primes are non-group primes and banned, and the factor is $1 - 1 \/ l + 1 \/ l^2$. Comparing these factors, allowing a convergent product of $1 + O \( l^(- 2) \)$ and the fixed factor at $2$, gives
  #[#set math.equation(numbering: n => "(8.17)")
   $ product_(3 lt.eq l lt.eq x^theta\
l divides.not D_1) \( 1 - g \( l \) \) lt.double V \( W \)^2 V \( x^theta \) product_(l divides D_1) \( 1 - 1 \/ l \)^(- 3) product_(l in cal(P) \, med l divides.not D_1\
l upright(" allowed")) \( 1 - 1 \/ l \)^(- 1) . $ <ex:product-comparison>]
  Every prime dividing $D_1$ is at least $L^20$, and $log D_1 = O \( L \)$, so
  $ sum_(l divides D_1) 1 / l lt.double frac(L^(- 19), log L) . $
  Its correction product in (8.17) is therefore uniformly bounded. Independence of the mask gives
  $ bb(E)_a product_(l in cal(P) \, med l divides.not D_1\
l upright(" allowed")) \( 1 - 1 \/ l \)^(- 1) & = product_(l in cal(P)\
l divides.not D_1) (1 + frac(q_0, l - 1))\
 & lt.eq product_(l in cal(P)) (1 + frac(q_0, l - 1)) lt.eq H_P . $
  For the last inequality, the group factor in $H_P$ is
  $ product_(p in cal(P)_g) (1 + frac(q_0, p - 1)) 1 / V_g sum_(p in cal(P)_g) frac(1, p - 1 + q_0) \, $
  and the final factor is at least one.
  Since $phi \( D_1 \) \/ D_1^2 lt.eq 1 \/ D_1$, summing the main term over assignments with Lemma 25 gives
  #[#set math.equation(numbering: n => "(8.18)")
   $ lt.double x V \( W \)^2 V \( x^theta \) H_Q H_P lt.double X_A V \( W \)^2 . $ <ex:box-main>]
  Here $V \( x^theta \) asymp L^(- 1)$, with $theta$ already fixed, and we used (8.1). It remains essential to sum the errors over assignments as well. From (8.12),
  $ sum_a lambda_a D_1 lt.eq x^(1 \/ 10) O \( H_Q \) . $
  Since $D lt.eq x^(1 \/ 20)$ and $M_i lt.double x^0.54$,
  #[#set math.equation(numbering: n => "(8.19)")
   $ sum_a lambda_a sum_(d lt.eq D) \| r_a \( d \) \| & lt.double L^(C_0) H_Q { x^(1 \/ 20) \( M_1 + M_2 \) D + x^(1 \/ 10) D^2 }\
 & lt.double L^(C_0) H_Q \( x^0.64 + x^0.20 \) = o \( X_A V \( W \)^2 \) . $ <ex:all-box-errors>]
  Indeed $X_A V \( W \)^2 asymp x H_Q H_P \/ L^2$ and $H_P gt.eq 1$. This proves (8.14). Every constant used here depends only on the original weight data and $j' \, theta$. ◻
]

For later use, a dyadic decomposition of $cal(B)_kappa$ and Lemma 26 imply

#[#set math.equation(numbering: n => "(8.20)")
 $ R_kappa := sum_(m n = N_u \, med m \, n in cal(B)_kappa\
P^(-) \( m \) \, P^(-) \( n \) > W) a_x \( u \) lt.eq C_1 \( kappa L + 1 \) X_A V \( W \)^2 . $ <ex:all-balanced-pairs>]

There are $O \( kappa L + 1 \)$ first-factor dyads because the interval has logarithmic length $4 kappa L$, and only $O \( 1 \)$ second-factor dyads per first-factor dyad because $m n in \[ 2 x + 1 \, 4 x + 1 \]$. Enlarging partially intersected boxes is legitimate by positivity. For $kappa < 1 \/ 50$ all their sides are $O \( x^0.54 \)$. Consequently $C_1$ is independent of $kappa \, b_1 \, S_1$. Fix, at this point, the constant

#[#set math.equation(numbering: n => "(8.21)")
 $ C_(upright("bal")) = C_(upright("pr"))^2 C_1 \, $ <ex:balanced-constant>]

enlarging it if necessary to absorb the fixed dyadic conventions.

=== 8.3 Parameter choice and test replacement <parameter-choice-and-test-replacement>

Choose $0 < kappa < 1 \/ 50$ so small that

#[#set math.equation(numbering: n => "(8.22)")
 $ C_(upright("bal")) kappa < frak(S) \/ 4 . $ <ex:kappa-choice>]

Next choose $b_1 > 0$ sufficiently small, with $b_1 < 1 \/ 100$, to satisfy the presieve and subtraction conditions below. The constants in those conditions do not depend on a later proxy precision. Set

$ theta.alt = 1 / 2 - kappa / 2 \, #h(2em) b_(*) = b_1 \/ 3 . $

By continuity in Lemma 24, a sufficiently fine fixed partition of $\( b_1 \, 1 \/ 2 - kappa \]$ satisfies

#[#set math.equation(numbering: n => "(8.23)")
 $ sum_(\( gamma \, gamma' \]) sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) log \( gamma' \/ gamma \) lt.eq D_(b_1) \( 1 \) - 1 + 1 / 10 . $ <ex:mesh>]

In fact these sums converge to $integral_(b_1)^(1 \/ 2 - kappa) D_alpha \( 1 - alpha \) thin d alpha \/ alpha$: on this fixed compact range, replacing $gamma$ and $t$ by the same point changes the continuous integrand uniformly by a quantity tending to zero with the mesh. Positivity and (8.10) then give (8.23).

Prescribe a Type II saving $D_(*) > C_A + 4$ and a congruence saving $D_(upright("cg")) > C_A + 4$. Apply Theorem 20 with $b_(*)$ and coefficient bound one, obtaining its required fixed discrepancy exponent $B$. Only now fix $S_1 > 2 B + 3$ and define the proxies by (8.5). All these parameters, including any prime number theorem accuracies in the proxy inputs, are fixed before $x$ tends to infinity.

#thm([Lemma 8.5.])[
  (Replacement on the required factor ranges).  #emph[In all factor sums used below, a test $I$ on either factor of $m n = N_u$ can be replaced by $B_I$ with total error $o \( X_A \/ L \)$, provided the coefficient on the other factor has absolute value at most one. This holds also when that other coefficient is a proxy.]
] <ex:replacement>

#proof[
  For the unbalanced sums, the prime factor $n$ is in $\( x^(b_1) \, x^(1 \/ 2 - kappa) \]$, and the complementary factor lies between fixed positive multiples of $x^(1 \/ 2 + kappa)$ and $x^(1 - b_1)$. For the balanced sums both factors are in $cal(B)_kappa$. Thus every contributing factor dyad, after intersecting with its actual interval, has scale between $x^(b_1 \/ 3)$ and $x^(1 - b_1 \/ 3)$ for sufficiently large $x$. The actual factor ranges also lie inside the ambient proxy interval. The fixed gaps in these exponent inequalities absorb all dyadic endpoint constants.
  On a dyad use $\( I - B_I \) upright(bold(1))_K$ as the first sequence in Theorem 20, where $K$ is the actual summation interval. Lemma 24 supplies its rough support, coefficient bound, and discrepancy. Exchange the factor names when the test is on the second factor. The theorem requires only boundedness of the companion sequence, so a nonsmooth proxy is permitted. There are $O \( L \)$ contributing dyadic pairs for each of the fixed finitely many tests. The total error is therefore $O \( x L^(- D_(*) + 1) \) = o \( X_A \/ L \)$ by (8.1). The full-cell normalization is retained when $K$ cuts a cell. In particular, neither $B$ nor the coefficient exponent used in the Type II theorem depends on $S_1$. ◻
]

=== 8.4 Presieving and unbalanced composites <presieving-and-unbalanced-composites>

For odd squarefree $d$ write, as in the congruence theorem,

$ r \( d \) = sum_(d divides N_u) a_x \( u \) - frac(X_A, phi \( d \)) . $

Theorem 22, with the already fixed $theta.alt \, D_(upright("cg"))$, gives

#[#set math.equation(numbering: n => "(8.24)")
 $ sum_(d lt.eq x^theta.alt\
d upright(" odd and squarefree")) \| r \( d \) \| lt.double x L^(- D_(upright("cg"))) + X_A L^(- 18) = o \( X_A \/ L \) . $ <ex:remainder-sum>]

#thm([Lemma 8.6.])[
  (Initial sifted mass).  #emph[For sufficiently small fixed $b_1$, 
#[#set math.equation(numbering: n => "(8.25)")
 $ sum_(P^(-) \( N_u \) > x^(b_1)) a_x \( u \) gt.eq frac(frak(S) X_A, L) {e^(- gamma_E) / b_1 \( 1 - O \( e^(- c \/ b_1) \) \) + o \( 1 \)} . $ <ex:presieve-bound>]

]
] <ex:presieve>

#proof[
  Apply Lemma 23 to the nonnegative weights $a_x \( u \)$, with bad condition $p divides N_u$ at odd primes $p lt.eq z = x^(b_1)$. Its density is $g \( p \) = 1 \/ \( p - 1 \)$, at most $1 \/ 2$; the sums of these densities over $\( w \, w^2 \]$ are bounded. Take
  $ h = 2 ⌊frac(1, 40 b_1)⌋ . $
  Making $b_1$ small ensures that this even integer is sufficiently large for the two-sided sieve. Its level satisfies
  $ b_1 \( 4 h + 2 \) lt.eq 1 / 5 + 2 b_1 < theta.alt . $
  Thus (8.24) supplies the full remainder sum. Since $N_u$ is odd, avoiding the specified odd primes is exactly $P^(-) \( N_u \) > x^(b_1)$. Finally use (8.4) and $e^(- h) = O \( e^(- c \/ b_1) \)$ in (8.2). ◻
]

#thm([Lemma 8.7.])[
  (Conditional small-prime sieve).  #emph[For each fixed bin $\( gamma \, gamma' \]$ of the chosen partition, 
#[#set math.equation(numbering: n => "(8.26)")
 $ sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) sum_(n divides N_u\
P^(-) \( N_u \) > W) a_x \( u \) = X_A V_1 \( W \) { log \( gamma' \/ gamma \) + o \( 1 \) } . $ <ex:conditional-sieve>]

]
] <ex:conditional>

#proof[
  Fix such a prime $n$. For each odd squarefree $d$ supported on primes at most $W$, one has $n > W$ for sufficiently large $x$, and
  $ sum_(n d divides N_u) a_x \( u \) = frac(X_A, \( n - 1 \) phi \( d \)) + r \( n d \) . $
  Apply Lemma 23 on the objects with $n divides N_u$, using base mass $X_A \/ \( n - 1 \)$, local density $1 \/ \( p - 1 \)$, and $h = 2 ceil.l T^2 ceil.r$. Its stated growing-$h$ uniformity applies; the level for $d$ is
  $ D_W = W^(4 h + 2) = exp \( O \( sqrt(L) thin T^2 \) \) = x^(o \( 1 \)) . $
  Every product $n d$ used is at most $x^(1 \/ 2 - kappa + o \( 1 \)) < x^theta.alt$.
  Crucially, the map $\( n \, d \) mapsto n d$ is injective, since $n$ is the unique prime divisor of $n d$ exceeding $W$. This remains true when the sums are taken over all the disjoint bins. The sieve polynomials have coefficients of absolute value at most one, so the sum of the remainders over all $n$ and $d$ is bounded by the single sum (8.24), with no divisor multiplicity. It is $o \( X_A V_1 \( W \) \)$, since $V_1 \( W \) asymp L^(- 1 \/ 2)$. The main terms are
  $ X_A V_1 \( W \) \( 1 + O \( e^(- h) \) \) sum_(x^gamma < n lt.eq x^(gamma')\
n upright(" prime")) frac(1, n - 1) . $
  Partial summation from the prime number theorem gives the last sum as $log \( gamma' \/ gamma \) + o \( 1 \)$, proving the result. ◻
]

#thm([Lemma 8.8.])[
  (Removal of unbalanced composites).  #emph[The weight of prime values $N_u$, together with composite values whose least prime factor exceeds $x^(1 \/ 2 - kappa)$, is at least 
#[#set math.equation(numbering: n => "(8.27)")
 $ frac(frak(S) X_A, 2 L) $ <ex:surviving-mass>]

 for sufficiently large $x$ after $b_1$ is chosen sufficiently small.]
] <ex:unbalanced>

#proof[
  If a presieved composite has least prime factor $n in \( x^gamma \, x^(gamma') \]$, every prime factor of $m = N_u \/ n$ is at least $n > x^gamma$. This includes a repeated occurrence of $n$. Its weight is therefore bounded above by the sum over $m n = N_u$ of $I_gamma \( m \) upright(bold(1))_(x^gamma < n lt.eq x^(gamma') \, med n upright(" prime")) a_x \( u \)$. Other divisors counted by this sum merely increase the upper bound.
  Replace $I_gamma$ by $B_gamma$ using Lemma 27, and use (8.9). Because $n > W$, $P^(-) \( m \) > W$ is equivalent to $P^(-) \( N_u \) > W$; no coprimality between $m$ and $n$ is needed. Lemma 29 and (8.4) bound the weight removed for this bin by
  $ frac(frak(S) X_A, L) {sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) log \( gamma' \/ gamma \) + o \( 1 \)} \, $
  apart from the total $o \( X_A \/ L \)$ replacement error. Summing over the fixed mesh and using (8.23) bounds the total removed weight by
  $ frac(frak(S) X_A, L) { D_(b_1) \( 1 \) - 1 + 1 \/ 10 + o \( 1 \) } . $
  Subtract this from Lemma 28. By (8.10), the coefficient of $frak(S) X_A \/ L$ left over is at least
  $ 1 - 1 / 10 - O \( b_1^(- 1) e^(- c \/ b_1) \) + o \( 1 \) . $
  Choose $b_1$ so small that this is greater than $1 \/ 2$ for sufficiently large $x$. This choice also satisfies the initial sieve conditions. The surviving presieved values are exactly among the two classes in the assertion, so their weight proves (8.27). ◻
]

=== 8.5 Balanced composites and the conclusion <balanced-composites-and-the-conclusion>

#thm([Lemma 8.9.])[
  (Balanced composite bound).  #emph[With the constant fixed in (8.21), the weight of composite $N_u$ with $P^(-) \( N_u \) > x^(1 \/ 2 - kappa)$ is at most 
#[#set math.equation(numbering: n => "(8.28)")
 $ C_(upright("bal")) \( kappa + 1 \/ L \) X_A / L + o \( X_A \/ L \) . $ <ex:balanced-bound>]

]
] <ex:balanced>

#proof[
  Such a composite has exactly two prime factors counted with multiplicity: three would give $N_u > x^(3 \( 1 \/ 2 - kappa \)) > 4 x + 1$. Both factors lie in $cal(B)_kappa$ for sufficiently large $x$, since the larger one is at most $\( 4 x + 1 \) x^(- 1 \/ 2 + kappa) < x^(1 \/ 2 + 2 kappa)$. Ordered prime pairs cover every such composite at least once; distinct primes give two pairs and a repeated prime gives one. Thus their total weight is bounded by
  $ sum_(m n = N_u\
m \, n in cal(B)_kappa) I_(upright("pr")) \( m \) I_(upright("pr")) \( n \) a_x \( u \) . $
  Use the exact identity
  $ I_(upright("pr")) \( m \) I_(upright("pr")) \( n \) - B_(upright("pr")) \( m \) B_(upright("pr")) \( n \) = \( I_(upright("pr")) - B_(upright("pr")) \) \( m \) I_(upright("pr")) \( n \) + B_(upright("pr")) \( m \) \( I_(upright("pr")) - B_(upright("pr")) \) \( n \) . $
  Lemma 27 applies to the two terms in turn, exchanging factor roles in the second. Both companion sequences have absolute value at most one, independently of $S_1$. The resulting positive proxy sum is, by (8.7), at most
  #[#set math.equation(numbering: n => "(8.29)")
   $ frac(C_(upright("pr"))^2, L^2 V \( W \)^2) sum_(m n = N_u \, med m \, n in cal(B)_kappa\
P^(-) \( m \) \, P^(-) \( n \) > W) a_x \( u \) . $ <ex:prime-to-positive>]
  Apply (8.20) and (8.21), and add the $o \( X_A \/ L \)$ replacement error. This proves (8.28). ◻
]

#proof[
  Combining Lemmas 30 and 31 gives
  $ sum_(N_u upright(" prime")) a_x \( u \) gt.eq (frak(S) / 2 - C_(upright("bal")) kappa - o \( 1 \)) X_A / L gt.double X_A / L \, $
  by (8.22). Lemma 19 removes only $o \( X_A \/ L \)$ from this mass. Consequently there is a supported $u$ with $2 u + 1$ prime and $2 u$ squarefree.
  For completeness, the support condition counts prime factors with their multiplicities. The ordinary part $u_(*)$ has $r_0 \( j_x + 1 \)$ prime factors, an even number because $r_0$ is even. The factor $\( 1 - cal(E) \( u \) \) \/ 2$ in $A \( u \)$ imposes an odd total multiplicity on the group-prime part. Hence $Omega \( u \)$ is odd. Every supported $u$ is odd, so $Omega \( 2 u \) = 1 + Omega \( u \)$ is even. On the retained squarefree predecessors this is also an even number of distinct prime factors. Finally $u in \[ x \, 2 x \]$ wherever $a_x \( u \) > 0$; the resulting primes exceed $x$ for arbitrarily large $x$, proving infinitude. ◻
]

The order of choices is intrinsic to the argument: the original weight data and the micro-band choices determine $C_(upright("box"))$ and $C_(upright("bal"))$; then come $kappa$, $b_1$, the finite mesh, the distribution savings and their discrepancy exponent, and finally $S_1$. All thresholds for $x$ are imposed afterwards. In particular the absolute prime-proxy constant and the coefficient bound one, rather than any precision-dependent regularity, are what make this order valid.

#heading(level: 1)[References]
#bibitem([1])[R.~C. Baker and G.~Harman, #emph[Shifted primes without large prime factors], Acta Arith. #strong[83] (1998), no.~4, 331--361. #link("https://doi.org/10.4064/aa-83-4-331-361")[doi:10.4064/aa-83-4-331-361].]
#bibitem([2])[J.~Friedlander and H.~Iwaniec, #emph[Asymptotic sieve for primes], Ann. of Math. (2) #strong[148] (1998), no.~3, 1041--1065. #link("https://doi.org/10.2307/121035")[doi:10.2307/121035]\; #link("https://arxiv.org/abs/math/9811186v1")[arXiv:math/9811186v1].]
#bibitem([3])[J.~D. Lichtman, #emph[Primes in arithmetic progressions to large moduli, and shifted primes without large prime factors], #link("https://arxiv.org/abs/2211.09641v1")[arXiv:2211.09641v1], 14 November 2022.]
#bibitem([4])[OpenAI, #emph[Weighted dilation graphs, smooth shifted primes and totient fibers], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Weighted-Dilation-Graphs-Smooth-Shifted-Primes-and-Totient-Fibers-September-24-2026/paper.pdf")[OAI:Weighted-Dilation-Graphs-Smooth-Shifted-Primes-and-Totient-Fibers-September-24-2026], 2026.]
#bibitem([5])[T.~D. Wooley, #emph[Vinogradov's mean value theorem via efficient congruencing], Ann. of Math. (2) #strong[175] (2012), 1575--1627. #link("https://doi.org/10.4007/annals.2012.175.3.12")[doi:10.4007/annals.2012.175.3.12].]


