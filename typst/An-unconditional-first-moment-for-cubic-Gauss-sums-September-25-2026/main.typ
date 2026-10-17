#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[An unconditional first moment for cubic Gauss sums]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Let $omega = e^(2 pi i \/ 3)$ and $cal(O) = bb(Z) \[ omega \]$. Write $N \( z \) = z macron(z) = \| z \|^2$, $e \( x \) = e^(2 pi i x)$, and $"Tr" \( z \) = z + macron(z)$. An element prime to $3$ is called primary when it is congruent to $1$ modulo $3$. Every ideal prime to $3$ has exactly one primary generator. In particular, both conjugate prime ideals above a split rational prime are counted. For primary $b$, let $chi_b$ be the cubic residue symbol with denominator $b$, extended by zero on nonunits modulo $b$, and put

#[#set math.equation(numbering: n => "(1.1)")
 $ G \( b \) = 1 / sqrt(N \( b \)) sum_(v med mod med b) chi_b \( v \) e #scale(x: 120%, y: 120%)[\(] "Tr" \( v \/ b \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) c_(*) = frac(\( 2 pi \)^(2 \/ 3), 3 Gamma \( 2 \/ 3 \)) . $ <eq:gauss-definition>]

#thm([Theorem 1.1.])[
  (First moment over primary primes).  #emph[As $X arrow.r oo$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ sum_(N pi lt.eq X\
pi equiv 1 med \( mod med 3 \) med upright("prime")) G \( pi \) = 6 / 5 c_(*) frac(X^(5 \/ 6), log X) + o #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $ <eq:main>]

 The sum is over all primary primes in $cal(O)$.]
] <thm:main>

Theorem 23 compares $G \( pi \)$ with the elementary model $c_(*) N \( pi \)^(- 1 \/ 6)$ after inserting $\( pi \/ \| pi \| \)^ell$, for every fixed integer $ell$. For $ell eq.not 0$ both the model and the twisted Gauss-sum moment are $o_ell \( X^(5 \/ 6) \/ log X \)$. The dependence on a fixed mode is essential; no uniformity in a growing angular parameter is asserted. The cubic Gauss-sum identity then gives cancellation at this same scale for every fixed power $G \( pi \)^k$ with $3 divides.not k$ and $\| k \| > 1$; see (8.14).

Partial summation also gives the logarithmically weighted form

#[#set math.equation(numbering: n => "(1.3)")
 $ sum_(N pi lt.eq X\
pi equiv 1 med \( mod med 3 \) med upright("prime")) G \( pi \) log N pi = 6 / 5 c_(*) X^(5 \/ 6) + o \( X^(5 \/ 6) \) . $ <eq:log-weighted-main>]

Indeed, if $A \( y \)$ denotes the sum in (1.2), then the weighted sum is $A \( X \) log X - integral_2^X A \( y \) thin d y \/ y$; the integral is $O \( X^(5 \/ 6) \/ log X \)$.

Theorem 1 is the asymptotic displayed after Equation (1.8) of Dunn–Radziwiłł [2]. Equivalently, it is the rational-prime formulation stated by Wan [16] Conjecture 4.13, as the conversion below shows. Thus Theorem 1 resolves positively Patterson’s first-moment conjecture in these explicit normalizations. Patterson’s complementary conjecture predicts $o \( X^(5 \/ 6) \/ log X \)$ for the sum of $G \( pi \)^k$ for every fixed integer $k in.not { 0 \, plus.minus 1 }$; see [2] Equation (1.9). The fixed-power consequence above establishes the part with $3 divides.not k$; nonzero multiples of three require stronger information about angular Hecke prime sums. The error here is little-oh at the first-moment scale. The distinction between the primary-prime and rational-prime normalizations is addressed below.

=== 1.1 History and significance <history-and-significance>

For a rational prime $p equiv 1 med \( mod med 3 \)$, Kummer’s sum is

$ S_p = sum_(x med mod med p) e \( x^3 \/ p \) . $

Kummer’s numerical observations [10] suggested a bias toward positive values. Heath-Brown and Patterson [6] proved equidistribution of the normalized cubic Gauss sums on the unit circle. This controls the distribution on the prime-counting scale $X \/ log X$, and is compatible with a smaller persistent first moment. Patterson [13] predicted a bias on the scale $X^(5 \/ 6) \/ log X$. Heath-Brown’s cubic large sieve gave the unconditional upper bound $O_epsilon.alt \( X^(5 \/ 6 + epsilon.alt) \)$ [5]. His metaplectic mean-square estimate, recalled in Theorem 7, is also essential here: it controls Type I sums averaged over Mellin height.

The analytic continuation behind these estimates comes from cubic theta series. Within Kubota’s metaplectic theory, Patterson computed their coefficients and developed the relevant functional equation [12]; Yoshimoto studied character twists by related functional-equation methods [18]. Dunn and Radziwiłł extended these calculations to a level-aspect Voronoi formula [2] Section 1.3 and Proposition 5.3. Together with corrected dispersion, they proved a smoothed first-moment asymptotic under the Generalized Riemann Hypothesis for Hecke $L$-functions. The correction retains a main term from nonzero cube frequencies in Poisson summation before estimating the other frequencies. Their level formula itself is unconditional and is our exact imported input; their GRH-dependent cancellation estimates are not used.

The new cancellation needed here is confined to structured prime polynomials. We do not improve the cubic large sieve for arbitrary coefficients. Instead, moments at several lengths reduce a putative large contribution to a range in which a Gram-matrix estimate is strictly stronger. Two further points are important. An exact bin-based stopping rule gives independent coefficients without a coupled least-prime cutoff, and localization in both norm variables recovers enough diagonal saving at large Mellin heights to remove the smooth weight. These arguments may be useful in other first-moment problems where a structured dual family and a narrow product transition occur together.

=== 1.2 The rational-prime convention <sec:normalization>

The exact conversion is

#[#set math.equation(numbering: n => "(1.4)")
 $ G \( pi \) + G \( macron(pi) \) = S_p / sqrt(p) \, #h(2em) p = pi macron(pi) equiv 1 med \( mod med 3 \) . $ <eq:pairing>]

Indeed cubic reciprocity and conjugation give

$ chi_pi \( macron(pi) \) = chi_(macron(pi)) \( pi \) = overline(chi_pi \( macron(pi) \)) \, $

so this cube root of unity is $1$. Via the isomorphism $bb(Z) \/ p bb(Z) tilde.eq cal(O) \/ \( pi \)$, the additive coefficient in $e \( "Tr" \( v \/ pi \) \)$ is $macron(pi) med mod med pi$. It can therefore be removed without changing the cubic Gauss sum. Counting cube roots in $bb(F)_p$ gives the sum of the two conjugate cubic Gauss sums, proving (1.4). The conjugacy assertion also follows directly from the definition, since $chi_pi \( - 1 \) = 1$. Inert primes have norm $p^2$ and contribute $O \( sqrt(X) \)$ in total. Consequently Theorem 1 gives

#[#set math.equation(numbering: n => "(1.5)")
 $ sum_(p lt.eq X\
p equiv 1 med \( mod med 3 \)) frac(S_p, 2 sqrt(p)) tilde.op 3 / 5 c_(*) frac(X^(5 \/ 6), log X) = frac(\( 2 pi \)^(2 \/ 3), 5 Gamma \( 2 \/ 3 \)) frac(X^(5 \/ 6), log X) . $ <eq:rational-main>]

This is precisely the coefficient in [16] Conjecture 4.13. That formulation sums over all rational primes; the primes $p equiv 2 med \( mod med 3 \)$ have $S_p = 0$ because cubing permutes $bb(F)_p$, and $p = 3$ does not affect the asymptotic.

#prodef([Remark 1.2.])[
  (Scope of the historical identification).  The version of [2] cited here prints the coefficient $\( 6 \/ 5 \) c_(*)$ both in its rational-prime Conjecture 1, whose summand is $S_p \/ \( 2 sqrt(p) \)$, and in its all-primary-prime display after Equation (1.8). These two displays cannot be equivalent under (1.4). We use the latter display to identify the precise conjectural statement proved here; the rational consequence is (1.5). We do not silently identify the conflicting normalizations or claim to have settled which printed historical coefficient is authoritative.
] <rem:normalization>

=== 1.3 The argument and its inputs <the-argument-and-its-inputs>

The analytic target is a comparison with the elementary model $c_(*) N \( pi \)^(- 1 \/ 6)$ on each dyadic prime interval. Its sum has the required constant by the prime ideal theorem and partial summation. The difficulty is to make that comparison with a sharp upper limit: smoothing the interval at a sufficiently fine scale introduces Mellin heights up to $X^(1 \/ 6 + rho)$ for a small fixed $rho > 0$.

At low heights, the level Voronoi formula gives the Type I comparison. For bilinear sums, Poisson summation has nonzero frequencies that are cubes. These frequencies produce precisely the model term, rather than an error. Corrected dispersion subtracts that term. The remaining frequencies are controlled by large sieves except in two conductor-length configurations. Section 4 treats these configurations by moments of several lengths and an off-diagonal Gram estimate. The coefficients there are independent smooth convolutions of prime sequences; this restriction is retained at every application.

An exact prime decomposition must therefore preserve coefficient independence. The stopping rule in Section 6 orders norm bins and counts the selected factors in the final bin. A binomial weight then separates the two sides exactly. This also isolates the only logarithmic transition, a product of three primes of nearly equal norm. Prime sparsity supplies enough saving there. At large heights the Gauss-sum term is treated without subtracting its model. Localizing #emph[both] norm variables gives a smaller diagonal near the product boundary; away from that boundary, oscillation in height supplies the saving. Figure 1 records these joins.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-4, 3.4), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Voronoi formula#linebreak()Height mean square]]])])
  content((0, 3.4), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Structured moments#linebreak()Section~4]]])])
  content((4, 3.4), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Prime decomposition#linebreak()Section~6]]])])
  content((-4, 1.6), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Type~I estimates#linebreak()Section~3]]])])
  content((0, 1.6), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Dispersion estimates#linebreak()Section~5]]])])
  content((4, 1.6), [#box(width: 3.703cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Two-variable localization#linebreak()Section~7]]])])
  content((0, -0.3), [#box(width: 6.353cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Sharp cutoff and prime model#linebreak()Theorem~1.1]]])])
  line((-4, 2.875), (-4, 2.125), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 2.875), (0, 2.125), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-2.149, 1.6), (-1.851, 1.6), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4, 2.875), (4, 2.125), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.149, 2.875), (1.851, 2.125), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.851, 1.6), (2.149, 1.6), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-4, 1.075), (-3.176, 0.225), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 1.075), (0, 0.225), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4, 1.075), (3.176, 0.225), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The proof of the sharp first moment. Solid arrows indicate uses of proved estimates. The exact prime decomposition supplies the coefficient classes required by both bilinear branches. ],
) <fig:proof-map>

Section 2 states the public arithmetic and analytic inputs, and Section 3 derives the two Type I estimates. The structured moments of Section 4 enter the dispersion estimates of Section 5. The exact decomposition is proved in Section 6; Section 7 assembles all the estimates, fixes the order of parameters, and removes the smooth cutoff. Appendix 8 proves the fixed-angular extension, including the shifted Hecke input, the angular Type I estimates and the required twisted sequence condition.

The formal literature inputs are cubic reciprocity and its supplementary laws; the functional equation, prime ideal theorem, and logarithmic conductor prime estimates for Hecke characters; Heath-Brown’s cubic large sieve and metaplectic height mean square; and the unconditional level Voronoi formula and residue of Dunn and Radziwiłł. Their normalizations and uniformity are stated where used. The ordinary character sieve, the nonsquarefree extensions of the cubic sieve, and all further cancellation and decomposition arguments are proved here. In particular, no GRH-dependent cancellation result is an input.

== 2 Arithmetic and analytic preliminaries <sec:background>

Write $K = bb(Q) \( omega \)$, $cal(O) = bb(Z) \[ omega \]$, and $lambda = sqrt(- 3)$, where $omega = e^(2 pi i \/ 3)$. An element is #emph[primary] if it is congruent to $1$ modulo $3$. Every nonzero ideal prime to $3$ has a unique primary generator. Unless specified otherwise, sums over $a \, b \, c \, d \, r \, u$ and their divisors are over these generators. In contrast, Poisson frequencies range over the full lattice indicated in the formula. We use

$ N \( z \) = \| z \|^2 \, #h(2em) "Tr" \( z \) = z + overline(z) \, #h(2em) e \( x \) = exp \( 2 pi i x \) . $

The functions $mu$, $tau$, and $phi$ are the ideal Mobius, divisor, and Euler functions; thus $phi \( r \) = \# \( cal(O) \/ \( r \) \)^times$. The ideal von Mangoldt function is $Lambda \( n \) = log N pi$ when $n = pi^k$ for a prime $pi$ and $k gt.eq 1$, and is zero otherwise. We write $Omega \( n \)$ for the number of prime factors counted with multiplicity. The arithmetic function $Lambda \( n \)$ is distinguished by its argument from a completed $L$-function $Lambda \( s \, chi \)$.

For a primary prime $pi$, the cubic residue symbol $chi_pi \( v \)$ is the element of ${ 1 \, omega \, omega^2 }$ congruent to $v^(\( N pi - 1 \) \/ 3)$ modulo $pi$ when $\( v \, pi \) = 1$, and is zero otherwise. Extend it multiplicatively in its lower argument. Put

$ G \( b \) = 1 / sqrt(N b) sum_(v med mod med b) chi_b \( v \) e #scale(x: 120%, y: 120%)[\(] "Tr" \( v \/ b \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) c_(*) = frac(\( 2 pi \)^(2 \/ 3), 3 Gamma \( 2 \/ 3 \)) . $

Cubic reciprocity and its supplementary laws, in these conventions, give $chi_b \( a \) = chi_a \( b \)$ for primary $a \, b$. The characters $b mapsto chi_b \( zeta lambda^j \)$, with $zeta$ a unit, have bounded conductor supported above $3$ and trivial infinite parameter. We use these standard laws in the form recorded in [2] Section 2.

Complete Gauss-sum evaluation and the Chinese remainder theorem give

#[#set math.equation(numbering: n => "(2.1)")
 $ \| G \( a \) \| = mu^2 \( a \) \, #h(2em) G \( a b \) = G \( a \) G \( b \) overline(chi_b \( a \)) . $ <eq:mult>]

For completeness, the additive character is primitive away from $3$. At a squarefree modulus the multiplicative character is primitive as well, so the unnormalized sum has absolute value $sqrt(N a)$. At a repeated prime, summation over the final additive lift vanishes, whereas the multiplicative character is inflated from a smaller modulus. For coprime $a \, b$, the two Chinese-remainder factors give $chi_b \( a \) chi_a \( b \) = overline(chi_b \( a \))$ by reciprocity. If $\( a \, b \) eq.not 1$, both sides of the second identity vanish.

For $h eq.not 0$ that is not a cube in $K$, the character $b mapsto chi_b \( h \)$ is nonprincipal. Indeed it is the cubic character of the nontrivial Kummer extension $K \( root(3, h) \) \/ K$. The splitting criterion at unramified primes, together with the prime ideal theorem for that extension, proves nontriviality. Passing to the associated primitive character or adding coprimality restrictions does not alter this assertion. Since $cal(O)$ is integrally closed, an element of $cal(O)$ that is a cube in $K$ is already a cube in $cal(O)$.

=== 2.1 Uniform conventions and classical inputs <uniform-conventions-and-classical-inputs>

Throughout the proof, $X$ tends to infinity and $L = log X$. Lengths refer to norms. All dyads have fixed bounded endpoint ratios; bounded lengths are allowed. All variables and reciprocal scale parameters under consideration are bounded by fixed powers of $X$. A sequence is #emph[divisor-bounded] if its absolute value is at most $L^C tau \( n \)^C$ for some fixed $C$. Every fixed moment of this majorant on a norm dyad of length $B$ is $O \( B L^(C') \)$, with $C'$ fixed. The same assertion holds after collecting elements having the same rational norm: the number of ideals of norm $m$, and their divisor multiplicities, are bounded by fixed powers of the ordinary divisor function. These bounds follow from Euler products and the usual mean estimates for fixed divisor functions.

The constants in $lt.double_epsilon.alt$ may depend on all fixed support, smoothness, and coefficient parameters. Each use of $X^epsilon.alt$ permits an arbitrarily small positive exponent, chosen after those parameters. We will explicitly retain logarithmic bounds when a small power loss would not suffice.

We use Mellin inversion with the convention

$ cal(M) W \( s \) = integral_0^oo W \( v \) v^s thin frac(d v, v) \, #h(2em) W \( v \) = frac(1, 2 pi i) integral_(\( sigma \)) cal(M) W \( s \) v^(- s) thin d s . $

Smooth functions in products or ratios of norm variables can consequently be separated on fixed dyads. At fixed smoothness scale the Mellin integrands decrease faster than every power of their imaginary variables. A fixed number of derivatives bounded by powers of $L$ gives corresponding logarithmic costs. Derivative scales smaller than one will be tracked when they are introduced.

The classical analytic inputs are the functional equation for primitive Hecke characters, the prime ideal theorem and its Siegel–Walfisz form over the fixed field $K$, and the ordinary mean-value inequality for Dirichlet polynomials; see, for general analytic background, [8]. For the precise finite-order completion, see [17] Section 3.6, and for entireness see [15] Section 2C. More precisely, if $chi$ is primitive with trivial infinite parameter and conductor norm $D$, then

$ Lambda \( s \, chi \) = (frac(sqrt(3 D), 2 pi))^s Gamma \( s \) L \( s \, chi \) \, #h(2em) Lambda \( s \, chi \) = epsilon_chi Lambda \( 1 - s \, overline(chi) \) \, quad \| epsilon_chi \| = 1 . $

The field has discriminant $- 3$ and one complex place. The complex gamma factor in [17] is $2 \( 2 pi \)^(- s) Gamma \( s \)$; dividing the completion by the constant $2$ gives exactly this convention. For a nonprincipal character the completed function is entire. For every fixed $A \, M > 0$, nonprincipal cubic characters with primitive conductor norm at most $\( log x \)^A$ satisfy, uniformly,

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(N pi lt.eq x) chi \( pi \) lt.double_(A \, M) x \( log x \)^(- M) . $ <eq:hecke-sw>]

Here is an explicit route to this uniformity. Apply [15] Theorem 1.4 to the cyclic cubic extension of $K$ cut out by $chi$. Its three characters are $1 \, chi \, overline(chi)$, and both nontrivial conductors have norm $D$. The parameters of that theorem are $n_K = 2$, $D_K = 3$, and $Q = D$. Weighting the three Frobenius-class counts by $chi$ cancels their principal terms. The possible exceptional character is real; in a cyclic group of order three it must be trivial, so its term also cancels. The resulting error is at most a constant times

$ "Li" \( x \) {exp #h(-0.16667em) (- frac(c log x, log \( 12 D \))) + exp \( - c sqrt(log x) \)} + O \( log \( 2 D \) \) . $

For $D lt.eq \( log x \)^A$, the theorem’s threshold $x gt.eq \( 12 D \)^(c_2)$ holds eventually, and this error gives (2.2) for every fixed $M$. The same theorem for a fixed extension gives the prime ideal theorem and the nonprincipality test used above. Standard partial summation gives the smooth and interval versions of (2.2). Any additional omitted Euler factors will be accounted for through their deleted primes at the point of use. For coefficients indexed by rational integers we use the classical mean-value estimate of Montgomery and Vaughan [11],

#[#set math.equation(numbering: n => "(2.3)")
 $ integral_I lr(|sum_(n lt.eq Z) v_n n^(i t)|)^2 d t lt.double \( \| I \| + Z \) sum_(n lt.eq Z) \| v_n \|^2 \, $ <eq:ordinary-mean-value>]

where $I$ is any interval. An arbitrary fixed translation of the height is absorbed into the coefficients.

=== 2.2 Two large sieves <two-large-sieves>

#thm([Theorem 2.1.])[
  (Heath-Brown’s cubic large sieve).  #emph[Let $A \, B gt.eq 1$, and let $\( u_b \)$ be supported on primary squarefree elements with $N b asymp B$. Then, for every $epsilon.alt > 0$, 
$ sum_(N a asymp A) mu^2 \( a \) lr(|sum_b u_b chi_a \( b \)|)^2 lt.double_epsilon.alt \( A B \)^epsilon.alt #scale(x: 120%, y: 120%)[\(] A + B + \( A B \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)] sum_b \| u_b \|^2 . $

 The same assertion holds with upper cutoffs in place of dyads.]
] <thm:cls>

This is [5] Theorem 2. Its squarefree hypotheses apply to both arguments, and will not be discarded without the following explicit extensions.

The underlying planar large sieve is the number-field inequality associated with Huxley [7]; its exact $Z + Q^2$ scale is also recorded in [3] Equation (1.2). We give the primitive-character argument needed here, including the absence of a small-power conductor loss.

#thm([Lemma 2.2.])[
  (The ordinary character large sieve).  #emph[For distinct primitive ray characters of trivial infinite parameter, with conductor norm at most $Q$ and with conductor above $3$ dividing a fixed modulus, and coefficients supported on a norm dyad of length $Z$, one has 
$ sum_chi lr(|sum_n v_n chi \( n \)|)^2 lt.double \( Z + Q^2 \) sum_n \| v_n \|^2 . $

 The implied constant is uniform when a fixed additional modulus above $3$ is allowed. In particular, the bound applies to the cubic characters indexed by coprime primary squarefree $p \, q$ through $b mapsto chi_b \( p q^2 \)$, whose conductor away from $3$ is $p q$. There is no $Q^epsilon.alt$ loss.]
] <lem:ordinary-sieve>

#proof[
  Fixing one of the finitely many classes at the bounded modulus above $3$ reduces the claim to primitive group characters modulo a primary $r$, with $N r lt.double Q$. Let $S \( y \) = sum_n v_n e \( "Tr" \( n y \) \)$. Primitive Gauss-sum expansion and character orthogonality give
  $ sum_(chi med mod med r)^(upright("primitive")) lr(|sum_n v_n chi \( n \)|)^2 lt.eq frac(phi \( r \), N r) sum_(h med mod med r\
\( h \, r \) = 1) \| S \( h \/ r \) \|^2 lt.eq sum_(h med mod med r\
\( h \, r \) = 1) \| S \( h \/ r \) \|^2 . $
  Fixed factors arising from the trace-dual lattice are immaterial. Distinct reduced fractions with denominator norms $O \( Q \)$ are separated by $gt.double Q^(- 1)$ on the dual torus: their difference, after a lattice translation, has a nonzero integral numerator and denominator of absolute value $O \( Q \)$.
  The planar additive large sieve for such a separated set has bound $O \( Z + Q^2 \)$. Here is the usual smoothing argument. Take a nonnegative Schwartz majorant of the disk containing the support of $\( v_n \)$, at scale $sqrt(Z)$. By duality and Poisson summation the resulting Gram matrix has entries bounded by
  $ C_N Z sum_ell \( 1 + sqrt(Z) thin \| y - y' + ell \| \)^(- N) . $
  Packing a $Q^(- 1)$-separated set in successive planar annuli bounds each row sum by $O \( Z + Q^2 \)$, for a fixed sufficiently large $N$. The operator norm has the same bound, proving the assertion. The exponents $1$ and $2$ at the primes dividing $p q$ distinguish the cubic characters in the last assertion; bounded ramified factors only introduce a bounded multiplicity. ◻
]

#thm([Lemma 2.3.])[
  (Extensions of the cubic large sieve).  #emph[The following estimates allow an arbitrarily small $X^epsilon.alt$ loss. First, for divisor-bounded coefficients $\( v_n \)$ of norm length $Z$, without a squarefree restriction, 
#[#set math.equation(numbering: n => "(2.4)")
 $ sum_(N a asymp P) mu^2 \( a \) lr(|sum_n v_n chi_a \( n \)|)^2 lt.double_epsilon.alt X^epsilon.alt Z #scale(x: 120%, y: 120%)[\(] P + Z + \( P Z \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)] . $ <eq:inner-extension>]

 Second, for coefficients $\( u_b \)$ on primary squarefree elements of norm length $P$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ sum_(N a asymp J) lr(|sum_b u_b chi_b \( a \)|)^2 lt.double_epsilon.alt X^epsilon.alt #scale(x: 120%, y: 120%)[\(] J + \( J P \)^(2 \/ 3) + J^(1 \/ 3) P #scale(x: 120%, y: 120%)[\)] sum_b \| u_b \|^2 . $ <eq:outer-extension>]

 The latter also holds when $a$ ranges over all nonzero elements of $cal(O)$ of norm $asymp J$. If $J gt.double P$, its last term is absorbed by $\( J P \)^(2 \/ 3)$.]
] <lem:cubic-extensions>

#proof[
  For the first estimate write uniquely $n = s t^2 c^3$, with $s \, t$ coprime and squarefree. Restrict their norms to dyads $S \, V \, C$, so that $S V^2 C^3 asymp Z$. For each fixed $t \, c$, the factors involving them have modulus at most one on the outer variable. Apply Theorem 3 to the $s$ sum and then use the triangle inequality in the outer squared-sum norm. The squared norm of the restricted coefficient sequence is $O_epsilon.alt \( X^epsilon.alt S \)$. There are $O \( V C \)$ choices of $t \, c$, and the resulting bound is
  #[#set math.equation(numbering: n => "(2.6)")
   $ X^epsilon.alt \( V C \)^2 S #scale(x: 120%, y: 120%)[\(] P + S + \( P S \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)] . $ <eq:inner-extension-dyad>]
  Since $\( V C \)^2 S lt.double Z$ and $S lt.double Z$, summing the logarithmically many dyads proves (2.4). We retain (2.6) when a restriction makes $S$ shorter.
  For the second estimate factor the outer argument in the same way. Fixing $t \, c$ when $S gt.eq V$, and applying Theorem 3 to $s$, costs
  $ X^epsilon.alt V C #scale(x: 120%, y: 120%)[\(] S + P + \( S P \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)] sum_b \| u_b \|^2 . $
  Fixing $s \, c$ when $S < V$ gives instead
  $ X^epsilon.alt S C #scale(x: 120%, y: 120%)[\(] V + P + \( V P \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)] sum_b \| u_b \|^2 \, $
  with character conjugation if necessary. Using $S V^2 C^3 lt.double J$ and the indicated order of $S \, V$, each expression is bounded by the right side of (2.5). The coprimality restriction imposed by $c$ is simply a restriction of the coefficients for each fixed $c$. For a full-lattice argument write $a = zeta lambda^i s t^2 c^3$, $i in { 0 \, 1 \, 2 }$, allowing powers of $lambda$ in $c$. The finitely many unit and residual ramified factors are coefficient twists. The same proof applies. ◻
]

=== 2.3 The unconditional level input <the-unconditional-level-input>

We use only the unconditional summation formula of Dunn and Radziwill, not their subsequent estimates that assume GRH. To identify the exact input, equation numbers in the following statement refer to [2] arXiv version 3, Proposition 5.3.

#thm([Theorem 2.4.])[
  (Level Voronoi formula, the required form).  #emph[Let $r$ be primary and squarefree, and let $W$ be smooth and compactly supported in $\( 0 \, oo \)$. Put $R = N r$ and $A_0 = \( 2 pi \)^(5 \/ 3) \/ \( 3^(7 \/ 2) Gamma \( 2 \/ 3 \) \)$. The completed sum 
$ cal(C)_r \( V \; W \) = sum_(d \, u\
\( d \, r \) = 1) \| d \| G \( u r \) W (frac(N \( u d^3 \), V)) $

 has main term $A_0 cal(M) W \( 5 \/ 6 \) V^(5 \/ 6) phi \( r \) R^(- 7 \/ 6)$. Its remaining term is 
$ frac(R^(1 \/ 2), 3^(7 \/ 2) \( 2 pi \)^2) sum_(0 eq.not nu in lambda^(- 1) cal(O) \, d\
\( d \, r \) = 1) frac(a_r \( nu \) b_r \( nu \), N nu thin \( N d \)^(5 \/ 2)) caron(W) (frac(\( 2 pi \)^4 N \( d^3 nu \) V, R^2)) \, $

 where, for sufficiently small $sigma > 0$, 
$ caron(W) \( v \) = frac(1, 2 pi i) integral_(\( - sigma \)) v^z frac(Gamma \( 5 \/ 6 - z \) Gamma \( 7 \/ 6 - z \), Gamma \( z - 1 \/ 6 \) Gamma \( z + 1 \/ 6 \)) cal(M) W \( z \) thin d z . $

 The coefficients depend only on $r$ and $nu$, independently of $V$ and $W$. They vanish outside representations 
$ nu = lambda^j zeta h w \( h' \)^3 \, quad j gt.eq - 1 \, quad h \, h' divides r^oo \, quad \( w \, r \) = 1 \, quad mu^2 \( h w \) = 1 \, $

 where $h \, h' \, w$ are primary and $zeta$ is a unit. On this support, they are 
$ a_r \( nu \) = a^star.op \( lambda^(- 3) nu \) \, #h(2em) b_r \( nu \) = mu (frac(r, \( lambda nu \, r \))) frac(phi \( r \), phi (r \/ \( lambda nu \, r \))) \, $

 where $a^star.op$ is the theta coefficient in [2] Equation (5.74); the second formula is its Equation (5.68). The index $lambda^(- 3) nu$ is the one supplied by its coefficient identity (5.79). They satisfy 
$ \| a_r \( nu \) \| lt.double 3^(max \( j \, 0 \) \/ 3) \| h' \| \, #h(2em) \| b_r \( nu \) \| lt.eq N \( \( lambda nu \, r \) \) . $

 In particular, if $V \, V^(- 1) \, R lt.double X^(C_0)$ for fixed $C_0$, $W$ is supported in a fixed compact subinterval of $\( 0 \, oo \)$, and each fixed derivative bound is at most a fixed logarithmic power, then 
#[#set math.equation(numbering: n => "(2.7)")
 $ cal(C)_r \( V \; W \) = A_0 cal(M) W \( 5 \/ 6 \) V^(5 \/ 6) frac(phi \( r \), R^(7 \/ 6)) + O_epsilon.alt \( X^epsilon.alt R^(1 \/ 2) \) . $ <eq:voronoi>]

]
] <thm:voronoi-background>

#proof[
  #emph[Derivation of the stated consequence.] The summation formula and coefficient information are the cited background theorem, with Equations (5.7), (5.13)–(5.14), (5.74), and (5.79)–(5.81). In particular, the dual theta coefficient is read from the proof formula (5.79), where its index is $lambda^(- 3) nu$; this avoids the repeated ramified exponent in the printed (5.67). The theta formulas give $\| a_r \( nu \) \| lt.double 3^(max \( j \, 0 \) \/ 6) \| h' \|$, which implies the stated weaker bound; the finitely many exceptional ramified cases have bounded factors. Multiplying the original summation formula by $G \( r \)$ uses $G \( r \) overline(g \( r \)) = R^(1 \/ 2)$, where $g \( r \) = sqrt(R) thin G \( r \)$. This proves the displayed normalization of both terms.
  We give the absolute convergence argument for (2.7). On $"Re" z = - sigma$, rapid Mellin decay and Stirling’s formula bound the transform by
  $ X^(O \( sigma \)) L^(O \( 1 \)) #scale(x: 120%, y: 120%)[\(] N \( d^3 nu \) #scale(x: 120%, y: 120%)[\)]^(- sigma) . $
  For a prime of norm $p$ dividing $r$, the exponents in $h \, h'$ are $e in { 0 \, 1 }$ and $k gt.eq 0$. Its absolute local sum is bounded by
  $ sum_(e = 0)^1 sum_(k gt.eq 0) p^(1_(e + k > 0)) p^(k \/ 2) p^(- \( e + 3 k \) \( 1 + sigma \)) = 1 + p^(- sigma) + O_sigma \( p^(- 3 \/ 2 - 3 sigma) \) . $
  For every fixed $eta > 0$, the product over $p divides r$ is $O_(sigma \, eta) \( R^eta \)$: separate the finitely many small primes, then bound each remaining factor by $p^eta$. The free $w$ sum converges at $1 + sigma$, the ramified sum is dominated by $sum_(j gt.eq 0) 3^(- j \( 2 \/ 3 + sigma \))$, and the $d$ sum converges at $5 \/ 2 + 3 sigma$. Choosing $sigma$ and $eta$ sufficiently small in terms of the final $epsilon.alt$ proves (2.7). ◻
]

#thm([Theorem 2.5.])[
  (The metaplectic mean-square input).  #emph[For primary squarefree $r$, the Dirichlet series 
$ f_r \( s \) = sum_u G \( r u \) \( N u \)^(- s) \, #h(2em) "Re" s > 1 \, $

 continues meromorphically to $"Re" s > 1 \/ 2$, with at most a simple pole at $5 \/ 6$. It has polynomial growth in closed strips there, away from its pole. For sufficiently small $epsilon.alt > 0$ and every $T gt.eq 1$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ integral_(- T)^T \| f_r \( 1 \/ 2 + epsilon.alt + i t \) \|^2 d t lt.double_epsilon.alt \( N r \)^(1 \/ 2 + 4 epsilon.alt) T^2 . $ <eq:hb-mean-square>]

 Its residue $rho_r$ satisfies $\| rho_r \| lt.double \( N r \)^(- 1 \/ 6)$.]
] <thm:hb-height>

The mean-square assertion is [5] Section 3, Lemma 3, with angular index zero; the series there is exactly $f_r$ in this normalization. We spell out the other analytic properties separately. Multiplicativity identifies $f_r$ with $G \( r \)$ times the series in [2] Proposition 5.2. Its completion includes the factor $sum_(\( d \, r \) = 1) \( N d \)^(- \( 3 s - 1 \/ 2 \))$, whose Euler product is nonzero for $"Re" s > 1 \/ 2$. Thus division introduces no further pole in this half-plane. The residue is

#[#set math.equation(numbering: n => "(2.9)")
 $ rho_r = A_0 frac(phi \( r \), \( N r \)^(7 \/ 6)) (sum_(\( d \, r \) = 1) \( N d \)^(- 2))^(- 1) . $ <eq:typeI-residue>]

The last sum is at least one, proving the bound without a small power loss in the level.

For the growth needed in a contour shift, put $R = N r$. In the notation of [5] Section 3, Equation (14), write $Z \( q \, z \) = zeta_K \( 3 z - 2 \; 1_3 \) psi \( q \, z \)$, where $1_3$ denotes omission of the prime above $3$. Equation (19) there bounds this function at large height by

$ \| Z \( q \, alpha + i y \) \| lt.double_e \( N q \)^(\( 3 \/ 2 + e - alpha \) \/ 2) \( 1 + y^2 \)^(3 \/ 2 + e - alpha) \, #h(2em) 1 / 2 lt.eq alpha lt.eq 3 / 2 . $

Only $\| y \| gt.eq 1$ is used, away from the possible pole. The finite-divisor identity at the end of that section gives $f_r \( s \) = R^s psi_r \( 1 \, s + 1 \/ 2 \)$ and, for $"Re" z gt.eq 1 + delta$,

$ \| psi_r \( 1 \, z \) \| lt.double_delta R^(- 1 \/ 2) sum_(d divides r) \( N d \)^(- 1 \/ 2) \| psi \( r \/ d \, z \) \| . $

The inverse zeta factor and the finite Euler factors in this identity are bounded by absolutely convergent products in that region. Consequently, for $1 \/ 2 + delta lt.eq sigma lt.eq .9$, $\| t \| gt.eq 1$, and any fixed $e \, nu > 0$,

$ \| f_r \( sigma + i t \) \| lt.double_(delta \, e \, nu) R^(sigma \/ 2 + e \/ 2 + nu) \( 1 + t^2 \)^(1 + e - sigma) . $

Here the divisor sum costs at most $tau \( r \) lt.double_nu R^nu$.

To cover the rest of a strip, set $S_r \( U \) = sum_(N u lt.eq U) G \( r u \)$. For $U gt.eq R^2$, [5] Lemma 1, with its parameter $1 \/ 12$, applies because $R lt.eq \( R U \)^(1 \/ 3)$ and gives

$ \| S_r \( U \) \| lt.double R^(- 1 \/ 6) U^(5 \/ 6) + R^(1 \/ 4) U^(3 \/ 4) lt.double R^(1 \/ 3) U^(5 \/ 6) . $

For $1 lt.eq U < R^2$ the same final bound follows from the trivial bound $O \( U \)$. Abel summation now gives, for $"Re" s > 5 \/ 6$,

$ f_r \( s \) = s integral_1^oo S_r \( y \) y^(- s - 1) thin d y \, #h(2em) \| f_r \( s \) \| lt.double R^(1 \/ 3) frac(\| s \|, "Re" s - 5 \/ 6) . $

This proves polynomial growth on $"Re" s gt.eq .9$, overlapping the previous range. Bounded heights away from the pole follow from meromorphy for each fixed level. These bounds justify the contour shifts below; their quantitative height estimate is (2.8).

== 3 Type I estimates <sec:typeI>

The Type I sums have arbitrary coefficients in the level $r$ and a smooth unrestricted sum over $u$. The level formula evaluates this inner sum after completion by cubes. We remove that completion by Möbius inversion: its residue gives the squarefree model, while the discarded cube divisors are bounded by counting at small levels and by the cubic large sieve at the remaining levels. At large Mellin heights we instead estimate the Gauss-sum term directly from the metaplectic mean square.

#thm([Proposition 3.1.])[
  (Type I comparison).  #emph[Suppose $R U asymp X$ and $1 lt.eq R lt.double X^.51$. Let $\( a_r \)$ be divisor-bounded and supported on $N r asymp R$. Let $W_r$ have support in a fixed compact subinterval of $\( 0 \, oo \)$, with each fixed derivative bounded by a fixed power of $L$, uniformly in $r$. Then 
$ sum_r a_r sum_u (G \( r u \) - c_(*) frac(mu^2 \( r u \), N \( r u \)^(1 \/ 6))) W_r \( N u \/ U \) lt.double X^(5 \/ 6 - eta) $

 for some fixed $eta > 0$. One may take $eta = 1 \/ 100$, with constants depending on the stated fixed parameters.]
] <prop:typeI>

#proof[
  Nonsquarefree $r$ contribute zero to both terms. For squarefree $r$, invert cube completion by the exact identity
  #[#set math.equation(numbering: n => "(3.1)")
   $ sum_u G \( r u \) W_r \( N u \/ U \) = sum_(\( c \, r \) = 1) mu \( c \) \| c \| thin cal(C)_r \( U \/ \( N c \)^3 \; W_r \) . $ <eq:inverse-completion>]
  Indeed the coefficient at a cube $e^3$ is $\| e \| sum_(c divides e) mu \( c \)$, equal to zero unless $e = 1$. All sums in this identity are finite at the given compact support. Use (2.7) for $N c lt.eq C_(*)$, where
  $ C_(*) = cases(delim: "{", X^.13 \, & R lt.eq X^.40 \,, X^.02 \, & R > X^.40 .) $
  After summing $r$, the total error is
  #[#set math.equation(numbering: n => "(3.2)")
   $ lt.double X^epsilon.alt R^(3 \/ 2) C_(*)^(3 \/ 2) lt.double X^(.795 + epsilon.alt) . $ <eq:short-completion-error>]
  The main term, completed to all $c$, is
  #[#set math.equation(numbering: n => "(3.3)")
   $ A_0 cal(M) W_r \( 5 \/ 6 \) U^(5 \/ 6) frac(phi \( r \), \( N r \)^(7 \/ 6)) sum_(\( c \, r \) = 1) frac(mu \( c \), \( N c \)^2) . $ <eq:typeI-main>]
  Its omitted tail, after summing $r$, is $O \( X^(5 \/ 6 + epsilon.alt) C_(*)^(- 1) \)$.
  We compare (3.3) with the model directly. The coset $1 + 3 cal(O)$ has Euclidean area density $2 \/ \( 9 sqrt(3) \)$, hence radial density $2 pi \/ \( 9 sqrt(3) \)$ in the norm variable. Square-divisor and coprimality inversion show, for a log-smooth weight $W$, that
  $ sum_(\( u \, r \) = 1) mu^2 \( u \) W \( N u \/ U \) = frac(2 pi U, 9 sqrt(3)) cal(M) W \( 1 \) frac(phi \( r \), N r) sum_(\( c \, r \) = 1) frac(mu \( c \), \( N c \)^2) + O_epsilon.alt \( X^epsilon.alt sqrt(U) \) . $
  To justify the error, truncate square divisors at $N c lt.double sqrt(U)$. Each relevant sublattice count differs from its area by at most a constant times one plus its scaled radius. Summing these errors and the divisors of $r$ costs only $X^epsilon.alt sqrt(U)$; completing the area term has the same error. Apply this formula to $v^(- 1 \/ 6) W_r \( v \)$ and use
  $ c_(*) frac(2 pi, 9 sqrt(3)) = A_0 . $
  The model therefore equals (3.3), with total error over $r$ bounded by
  #[#set math.equation(numbering: n => "(3.4)")
   $ X^epsilon.alt R^(5 \/ 6) U^(1 \/ 3) asymp X^(1 \/ 3 + epsilon.alt) R^(1 \/ 2) lt.double X^(.589 + epsilon.alt) . $ <eq:typeI-lattice-error>]
  It remains to bound the omitted part of (3.1). Combine $c \, d$ into $e = c d$, and restrict $N e$ to a dyad of length $E gt.double C_(*)$. Its coefficient is divisor-bounded times $E^(1 \/ 2)$; the restriction $\( e \, r \) = 1$ may be kept in the outer coefficient. Trivial counting gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ lt.double X^(1 + epsilon.alt) E^(- 3 \/ 2) . $ <eq:typeI-trivial-tail>]
  When $R lt.eq X^.40$ this is $O \( X^(.805 + epsilon.alt) \)$.
  For the other range fix $e$ and put $U_e = U \/ E^3$. Using (2.1), Cauchy in $r$, and Theorem 3, the bilinear sum in $r \, u$ costs
  $ lt.double X^epsilon.alt sqrt(R U_e) #scale(x: 120%, y: 120%)[\(] R + U_e + \( R U_e \)^(2 \/ 3) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The automatic vanishing restricts both variables to squarefree elements. Mellin inversion separates the weights; the arbitrary dependence of $W_r$ on $r$ changes only the outer coefficients and a common integrable majorant. Summing the absolute $e$ coefficients on the dyad costs $O \( X^epsilon.alt E^(3 \/ 2) \)$. Thus the tail on that dyad is
  #[#set math.equation(numbering: n => "(3.6)")
   $ lt.double X^(1 \/ 2 + epsilon.alt) (R + U \/ E^3 + \( X \/ E^3 \)^(2 \/ 3))^(1 \/ 2) . $ <eq:typeI-sieve-tail>]
  For $X^.40 < R lt.double X^.51$ and $E gt.double X^.02$, its three terms have exponents at most
  $ .755 \, #h(2em) .77 \, #h(2em) 1 / 2 + frac(1 - .06, 3) = 5 / 6 - 1 / 50 . $
  The same last upper exponent bounds the omitted main-term tail in this range. Equations (3.2)– (3.6), with logarithmically many dyads and sufficiently small epsilon losses, prove the assertion with $eta = 1 \/ 100$. ◻
]

#thm([Proposition 3.2.])[
  (Type I at large Mellin heights).  #emph[Suppose $R U asymp X$, and let $\( a_r \)$ be divisor-bounded on $N r asymp R$. Suppose the smooth compactly supported weights $W_r$ have fixed support ratios and uniformly bounded derivatives, independently of $X$. For $T gt.eq 2$ and every fixed $D > 0$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ & integral_(\| t \| asymp T) sum_(N r asymp R) \| a_r \| lr(|sum_u G \( r u \) \( N u \)^(i t) W_r \( N u \/ U \)|) frac(d t, T)\
 & #h(12mm)  lt.double_epsilon.alt X^(1 \/ 2 + epsilon.alt) R^(3 \/ 4) T^(1 \/ 2) + O_D #scale(x: 120%, y: 120%)[\(] X^(5 \/ 6) L^C T^(- D) #scale(x: 120%, y: 120%)[\)] \, $ <eq:typeI-height>]

 where $C$ depends only on the coefficient bounds.]
] <prop:typeIheight>

#proof[
  Again only squarefree $r$ contribute. For each such $r$, Mellin inversion on a line to the right of one gives
  $ sum_u G \( r u \) \( N u \)^(i t) W_r \( N u \/ U \) = frac(1, 2 pi i) integral_(\( 2 \)) cal(M) W_r \( s \) U^s f_r \( s - i t \) thin d s . $
  Shift to $sigma = 1 \/ 2 + epsilon.alt'$, with $epsilon.alt' > 0$ small. Theorem 7 and rapid Mellin decay justify this shift. The residue is
  $ rho_r U^(5 \/ 6 + i t) cal(M) W_r \( 5 \/ 6 + i t \) lt.double_D U^(5 \/ 6) R^(- 1 \/ 6) \( 1 + \| t \| \)^(- D) . $
  For the new integral use Minkowski and Cauchy in $t$. For every real $v$, (2.8), applied on a symmetric interval of radius $O \( T + \| v \| + 1 \)$, gives
  $ (integral_(\| t \| asymp T) \| f_r \( sigma + i \( v - t \) \) \|^2 frac(d t, T))^(1 \/ 2) lt.double_(epsilon.alt') R^(1 \/ 4 + 2 epsilon.alt') frac(T + \| v \| + 1, sqrt(T)) . $
  Since $cal(M) W_r \( sigma + i v \)$ decreases rapidly, uniformly in $r$, the mean absolute value of the new integral is
  $ lt.double_(epsilon.alt') U^(1 \/ 2 + epsilon.alt') R^(1 \/ 4 + 2 epsilon.alt') sqrt(T) . $
  Finally $sum_(N r asymp R) \| a_r \| lt.double R L^C$. Summing the last bound and the residues, and taking $epsilon.alt'$ sufficiently small in terms of $epsilon.alt$, proves (3.7). ◻
]

The two applications of Proposition 9 are

$ R lt.eq X^.40 \, quad T lt.double X^.01 \, #h(2em) upright("and") #h(2em) R lt.eq X^(1 \/ 3 - kappa \/ 2) \, quad T lt.double X^(1 \/ 6 + rho) . $

The respective first-term exponents are at most $.805 + epsilon.alt$ and $5 \/ 6 - 3 kappa \/ 8 + rho \/ 2 + epsilon.alt$. Both have a fixed power gap when $rho$ is sufficiently small in terms of $kappa$. Above a sufficiently large fixed power of $L$, the pole term has any prescribed logarithmic saving by choosing $D$ large.

== 4 Character moments at the two exceptional configurations <sec:dual>

This section supplies the power saving needed at the two boundary configurations of the dispersion argument. The coefficients have a restricted but important form: they are convolutions of a bounded number of prime sequences with independently specified smooth norm weights. There is no sharp condition coupling the prime factors.

Fix a positive constant $c$, a positive integer $k_0$, and fixed support and smoothness bounds. An admissible prime convolution at length $Y$ is

#[#set math.equation(numbering: n => "(4.1)")
 $ beta \( b \) = mu^2 \( b \) sum_(b = pi_1 dots.h.c pi_k) product_(j = 1)^k w_j #scale(x: 120%, y: 120%)[\(] N \( pi_j \) \/ F_j #scale(x: 120%, y: 120%)[\)] \, #h(2em) 1 lt.eq k lt.eq k_0 \, #h(2em) product_(j = 1)^k F_j asymp Y \, $ <eq:prime-convolution>]

where the primes are primary, the tuple is ordered, every supported prime has norm at least $Y^c$, and the $w_j$ have compact support in fixed subintervals of $\( 0 \, oo \)$. Each fixed derivative is bounded by a fixed power of $log Y$, uniformly over the family under consideration. These bounds imply fixed divisor bounds for all coefficients below.

For sums $sum_b beta \( b \) chi_b \( p q^2 \)$, with $p \, q$ coprime and squarefree of norm lengths $P \, Q$, the two sieves reach the same bound at different configurations. At $\( P \, Q \) = \( Y \, 1 \)$, Theorem 3 gives, up to an arbitrarily small power loss, the second-moment bound

$ Y #scale(x: 120%, y: 120%)[\(] Y + Y + Y^(4 \/ 3) #scale(x: 120%, y: 120%)[\)] lt.double Y^(7 \/ 3) . $

At $P = Q = Y^(1 \/ 3)$ the conductor norm is $O \( P Q \) = O \( Y^(2 \/ 3) \)$, so Lemma 4 gives $Y \( Y + Y^(4 \/ 3) \) lt.double Y^(7 \/ 3)$, again up to an arbitrarily small power loss. These are the two configurations left by the dispersion argument below. The convolution structure permits a fixed power saving in neighborhoods of both.

#thm([Proposition 4.1.])[
  (The exceptional character moments).  #emph[There are constants $delta \, eta > 0$, depending only on the fixed data in (4.1), with the following property. Let $v \, e in cal(O) \\ { 0 }$ satisfy $N \( v \) \, N \( e \) lt.eq Y^delta$, and let $1 + \| u \| lt.eq Y^0.36$. Put 
$ A \( p \, q \) = sum_(\( b \, e \) = 1) beta \( b \) N \( b \)^(i u) chi_b \( v p q^2 \) . $

 If $p \, q$ run through coprime primary squarefree elements of respective norm lengths $P \, Q gt.eq 1$, and either 
$ lr(|frac(log P, log Y) - 1|) lt.eq delta \, #h(2em) 0 lt.eq frac(log Q, log Y) lt.eq delta \, $

 or 
$ lr(|frac(log P, log Y) - 1 / 3|) lt.eq delta \, #h(2em) lr(|frac(log Q, log Y) - 1 / 3|) lt.eq delta \, $

 then 
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(p \, q) \| A \( p \, q \) \|^2 lt.double Y^(7 \/ 3 - eta) . $ <eq:exceptional-moment>]

 The implied constant is uniform for the specified support and smoothness bounds.]
] <prop:dual>

The short convolution identity used in the proof replaces each prime sum by products of truncated Mobius sums and full smooth sums. A factor of essentially full length is shortened by the functional equation. Otherwise, moments of products with factors repeated or omitted rule out the second configuration and force a precise relation between factor length and value in the first. There the off-diagonal Gram estimate supplies the final contradiction. We first prove the two analytic estimates needed for these alternatives. Throughout, the unrestricted-inner form of Lemma 5 permits divisor-bounded coefficients that need not be squarefree.

In the next lemma a full sum means the complete ideal sum of the primitive Hecke $L$-function. A restriction excluding primes above $3$, or other missing Euler factors, is first removed by inclusion–exclusion; this is carried out explicitly in the dominant-full-sum argument below.

#thm([Lemma 4.2.])[
  (A full smooth sum and its dual).  #emph[Let $chi$ be a primitive nonprincipal Hecke character of trivial infinite parameter and conductor norm $D$. Let $W$ be smooth and supported in a fixed compact subinterval of $\( 0 \, oo \)$, with each fixed derivative bounded by a fixed power of $log Y$. The full sum $sum_n W \( N \( n \) \/ Z \) chi \( n \) N \( n \)^(i t)$ admits a decomposition into dual norm dyads 
$ J lt.double Y^epsilon.alt D \( 1 + \| t \| \)^2 \/ Z $

 with amplitude $O \( Y^epsilon.alt sqrt(Z \/ J) \)$. The coefficients in a dual dyad are divisor-bounded, and its character is $overline(chi)$. All additional norm shifts can be integrated against a common conductor-independent $L^1$ majorant of mass $O \( Y^epsilon.alt \)$. The omitted tail is smaller than any prescribed negative power of $Y$, provided the lengths and heights are bounded by fixed powers of $Y$.]
] <lem:smooth-character-duality>

#proof[
  Write $tilde(W) \( s \) = integral_0^oo W \( x \) x^s thin d x \/ x$. Fixed logarithmic factors in the coefficients can be included in $W$. Mellin inversion expresses the sum as
  $ frac(1, 2 pi i) integral tilde(W) \( s \) Z^s L \( s - i t \, chi \) thin d s . $
  The character is nonprincipal, so shifting the contour to the left crosses no pole of the $L$-function. Up to fixed field constants, its functional equation is
  $ L \( s \, chi \) = epsilon.alt \( chi \) D^(1 \/ 2 - s) frac(Gamma \( 1 - s \), Gamma \( s \)) L \( 1 - s \, overline(chi) \) \, #h(2em) \| epsilon.alt \( chi \) \| = 1 . $
  On a sufficiently far-left line the dual Dirichlet series is absolutely convergent. Partition it into smooth norm dyads there. Stirling’s formula and the rapid decay of $tilde(W)$ show that dyads beyond $Y^epsilon.alt D \( 1 + \| t \| \)^2 \/ Z$ have an arbitrarily small total tail. This truncation is performed before moving the retained, finite dyads back to the line $Re s = 1 \/ 2$.
  On that line, with $s = 1 \/ 2 + i tau$, the integrand for a retained dyad is $sqrt(Z) thin tilde(W) \( 1 \/ 2 + i tau \)$ times
  #[#set math.equation(numbering: n => "(4.3)")
   $ epsilon.alt \( chi \) D^(i \( t - tau \)) Z^(i tau) frac(Gamma \( 1 \/ 2 - i \( tau - t \) \), Gamma \( 1 \/ 2 + i \( tau - t \) \)) sum_(N \( n \) asymp J) overline(chi) \( n \) N \( n \)^(- 1 \/ 2 + i \( tau - t \)) w_J \( N \( n \) \/ J \) . $ <eq:symmetry-line-character>]
  The multiplier preceding the polynomial has absolute value one. In particular, its conductor and root-number dependence is a scalar for each character, not a change in the coefficients of the polynomial. The gamma poles lie to the right of this move. Extracting $J^(- 1 \/ 2)$ from the polynomial proves the amplitude assertion. Rapid Mellin decay gives a common $L^1$ majorant in $tau$, including any fixed logarithmic derivative costs. Minkowski’s inequality in a square-sum norm over characters therefore applies with the same shifts for every character. A common cutoff based on the largest conductor in the average is permissible by the earlier far-left tail estimate. ◻
]

#thm([Lemma 4.3.])[
  (An off-diagonal Gram estimate).  #emph[Let $p$ be primary squarefree with $N \( p \) asymp P$, and let $W$ be a fixed smooth radial norm weight of compact support in $\( 0 \, oo \)$. For primary squarefree $p'$ of the same norm length put 
$ T_(p \, p') = sum_(n equiv 1 thin \( 3 \)) W \( N \( n \) \/ Z \) chi_p \( n \) overline(chi_(p') \( n \)) . $

 For $Z gt.eq 1$ and every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ sum_(p' eq.not p) \| T_(p \, p') \|^2 lt.double_epsilon.alt \( P Z \)^epsilon.alt Z (P + \( P^3 \/ Z \)^(2 \/ 3)) . $ <eq:near-orthogonality>]

 The same bound holds with a subset of the available $p'$.]
] <lem:character-gram>

#proof[
  Fix $k = \( p \, p' \)$, put $K = N \( k \)$, and write $p = k a$, $p' = k b$. The remaining moduli $a \, b$ are coprime and squarefree. The common factor contributes the restriction $\( n \, k \) = 1$. Remove this restriction by summing over $m divides k$ with coefficient $mu \( m \)$, and put $M = N \( m \)$. After $n = m x$, the character is $psi \( x \) = chi_a \( x \) overline(chi_b \( x \))$, apart from a scalar of absolute value one. It is primitive modulo $a b$ and nonprincipal: the only principal case would be $a = b = 1$, contrary to $p' eq.not p$.
  Apply Poisson summation on $x equiv 1 med \( mod med 3 \)$ modulo $3 a b$. The zero frequency vanishes. Primitive Gauss evaluation gives amplitude
  $ asymp frac(Z, M sqrt(N \( a b \))) asymp frac(Z K, M P) \, $
  and natural dual norm length
  $ J_0 asymp frac(N \( a b \) M, Z) asymp frac(P^2 M, K^2 Z) . $
  For clarity about the subsequent sieve application, the complete Gauss factor and CRT unit factors are independent of the frequency. They are scalars for each $b$. The frequency character is $overline(chi_a \( h \)) chi_b \( h \)$, and the primary residue condition adds only a fixed bounded-modulus phase. The Fourier transform is radial, so its remaining dependence on $b$ is through its norm.
  More explicitly, set $c = a b$ and $g \( psi \) = sum_(x med mod med c) psi \( x \) e \( "Tr" \( x \/ c \) \)$. Writing the primary residue classes as $x = c + 3 s$ gives the complete finite Fourier coefficient
  $ e ("Tr" frac(h, 3 lambda)) psi \( 3 lambda \) overline(psi \( h \)) g \( psi \) = e ("Tr" frac(h, 3 lambda)) overline(psi \( h \)) g \( psi \) \, $
  because $3 lambda = \( - lambda \)^3$. This also displays directly why no varying-modulus factor remains inside the frequency coefficients.
  On a frequency dyad $N \( h \) asymp J$, Mellin separation in the compact scaled variables $N \( h \) \/ J$ and $N \( b \) \/ \( P \/ K \)$ gives coefficients independent of $b$, integrated against a rapidly decreasing common majorant. For every fixed $A > 0$ its mass is $O_A \( \( 1 + J \/ J_0 \)^(- A) \)$; derivatives have the same property after adjusting $A$. Units and exact powers of the ramified prime in $h$ can be separated first. Their character values are again rowwise scalars, and the number of cases costs an arbitrarily small power. The extension with unrestricted inner coefficients in Lemma 5 now bounds this dyad, after squaring and summing over $b$, by
  $ \( P Z \)^epsilon.alt (frac(Z K, M P))^2 J (P / K + J + \( P J \/ K \)^(2 \/ 3)) \( 1 + J \/ J_0 \)^(- A) . $
  The restrictions on $b$ may be dropped in this upper bound.
  Sum the frequency dyads, retaining the rapid decay also when $J_0 < 1$. The three powers of $J$ are $1 \, 2 \, 5 \/ 3$; for $A$ sufficiently large their dyadic sums are bounded by the corresponding powers of $J_0$. Substitution gives the three terms
  $ frac(Z P, M K) \, #h(2em) P^2 / K^2 \, #h(2em) frac(P^2 Z^(1 \/ 3), K^2 M^(1 \/ 3)) . $
  Since $Z \, K \, M gt.eq 1$, their sum is $O \( Z P + P^2 Z^(1 \/ 3) \)$. There are only a divisor-bounded number of choices $k divides p$ and $m divides k$. Cauchy’s inequality over those choices, with a rechoice of $epsilon.alt$, proves (4.4). ◻
]

#proof[
  We use a limiting-exponent contradiction, and give the uniformity argument explicitly at the end. Thus suppose that along a sequence $Y arrow.r oo$ the extra twist and exclusion norms are $Y^(o \( 1 \))$, the pair of length exponents tends to $\( 1 \, 0 \)$ or $\( 1 \/ 3 \, 1 \/ 3 \)$, and the moment is at least $Y^(7 \/ 3 - o \( 1 \))$. Throughout this proof, a subpower loss means a bound with an arbitrarily small fixed positive power loss; it is never used as a logarithmic saving.
  #emph[Prime powers and repeated factors.] First remove the squarefree restriction in (4.1), and replace each prime weight by its smooth $Lambda \/ log N$ counterpart. The resulting discrepancy has divisor-bounded coefficients on a set of size $O \( Y^(1 - theta) \)$ for some fixed $theta > 0$. Indeed every discrepancy contains either a repeated prime of norm at least $Y^c$, or a prime power of exponent at least two and norm at least $Y^c$. In either case its squareful part has positive-power norm. In the canonical factorization $b = s t^2 d^3$, with $s \, t$ coprime squarefree, this also implies $N \( s \) lt.eq Y^(1 - theta')$ for some fixed $theta' > 0$. To include prime powers with a small base, if $pi^j$ has $j gt.eq 2$ and $N \( pi^j \) gt.eq Y^c$, then $N \( b \/ s \) gt.eq N \( pi^j \)^(1 \/ 2) gt.eq Y^(c \/ 2)$. Also $b$ is divisible by the square of $pi^(floor.l j \/ 2 floor.r)$, whose norm is at least $Y^(c \/ 4)$. Summing $O \( Y \/ N \( d \)^2 \)$ over square divisors with $N \( d \) gt.eq Y^(c \/ 4)$ gives support size $O \( Y^(1 - c \/ 4) \)$. Repeated large primes satisfy the same bounds, with room to spare.
  In the first configuration fix $q$, at a subpower cost. In the factorization $b = s t^2 d^3$, let $S \, V \, C$ be the dyadic norms of $s \, t \, d$. Then $S V^2 C^3 asymp Y$ gives $\( V C \)^2 S lt.double Y$, while $S lt.double Y^(1 - theta')$. Substituting these two bounds in (2.6), and summing the dyads, bounds the discrepancy moment by
  $ Y^(1 + o \( 1 \)) (Y + Y^(1 - theta') + Y^(\( 4 - 2 theta' \) \/ 3)) \, $
  which saves a power. In the second configuration, square the discrepancy polynomial. Its support has size at most $Y^(2 - 2 theta)$ and its coefficients remain divisor-bounded. The ordinary character sieve, at polynomial length $Y^2$ and conductor norm at most $Y^(2 \/ 3 + o \( 1 \))$, therefore bounds its fourth moment by $Y^(4 - 2 theta + o \( 1 \))$. Cauchy’s inequality over $Y^(2 \/ 3 + o \( 1 \))$ characters gives a second moment at most $Y^(7 \/ 3 - theta + o \( 1 \))$. The fixed extra character and exclusions are part of the coefficients in these applications. Hence both discrepancies can be discarded.
  #emph[A short convolution identity.] Here $*$ denotes Dirichlet convolution on ideals and $1$ is the constant-one arithmetic function. For a prime-polynomial dyad with upper endpoint $F'$, let $m = mu thin 1_(N lt.eq sqrt(F'))$ and let $upright(bold(1))_(*)$ denote the convolution identity. The function $upright(bold(1))_(*) - m * 1$ vanishes up to norm $sqrt(F')$, so its convolution square vanishes up to norm $F'$. Convolving with $Lambda$ and using $1 * Lambda = log N$ gives, on the dyad,
  #[#set math.equation(numbering: n => "(4.5)")
   $ Lambda = \( 2 m - m * m * 1 \) * log N . $ <eq:short-mobius-identity>]
  Apply this identity to every factor, insert smooth norm dyads, and separate the original product weights by Mellin inversion. The number of pieces and the $L^1$ costs are subpower. Rapid Mellin decay permits truncation of additional shifts at $Y^epsilon.alt$; the tails are negligible by trivial bounds. Minkowski’s inequality permits fixing the same shifts across each character average.
  It follows that some product of a bounded number of divisor-bounded character polynomials still has second moment $Y^(7 \/ 3 - o \( 1 \))$. Pass to a subsequence on which their length exponents tend to
  $ a_i gt.eq 0 \, #h(2em) sum_i a_i = 1 . $
  The common norm twists and fixed character factors can be distributed multiplicatively over these polynomials. Every truncated Mobius factor has length at most $Y^(1 \/ 2 + o \( 1 \))$. Thus, if an $a_i$ is one, that factor is a full smooth sum, with logarithmic factors allowed, and with twist height at most $Y^0.37$.
  #emph[A dominant full sum.] Suppose that $a_i = 1$. All other factors have subpower trivial size. The character in the full sum is nonprincipal. Its conductor away from the fixed ramified part agrees with $p q$ except at primes dividing the subpower extra twist or exclusion number. Partition according to the part of $p q$ at those primes and their local character values, and remove missing Euler factors by inclusion-exclusion. There are subpowerly many possibilities. For each one the rescaled full-sum length is still $Y^(1 + o \( 1 \))$; outside the fixed small parts, the variable character is the original cubic character or its conjugate. Exact powers of the ramified prime can likewise be separated on the dual side. In detail, let $S$ be the primes dividing $3 v e$, fix the $S$ parts of $p \, q$, and fix the resulting primitive local character $psi_S$. There are $Y^(o \( 1 \))$ choices, since the product of the relevant small prime norms is subpower. The remaining primitive character is $psi_S chi_(p_0) chi_(q_0)^2$, with $\( p_0 q_0 \, S \) = 1$. Inclusion-exclusion for missing Euler factors rescales by a fixed subpower divisor before the functional equation is applied. On the dual side $overline(psi_S)$ is a fixed coefficient twist; its root number and conductor phase are rowwise scalars as in (4.3). The surviving $p_0$, or $p_0 q_0$, has positive-power norm, so this primitive character is nonprincipal.
  Apply Lemma 11. In the second configuration the conductor is at most $Y^(2 \/ 3 + o \( 1 \))$, so the trivial dual estimate is
  $ \| upright("full sum") \| lt.double Y^(1 \/ 3 + 0.37 + o \( 1 \)) . $
  Summing squares over the available characters has exponent at most $2 \/ 3 + 2 \( 1 \/ 3 + 0.37 \) < 7 \/ 3$. In the first configuration fix $q$ and the small parts. The variable squarefree conductor has length $Y^(1 + o \( 1 \))$, and the dual polynomial has length $J lt.eq Y^(0.74 + o \( 1 \))$, allowing an arbitrarily small fixed power loss. The cubic sieve with unrestricted inner coefficients gives
  $ Y^(1 + o \( 1 \)) (Y + J + \( Y J \)^(2 \/ 3)) lt.eq Y^(2.16 + o \( 1 \)) . $
  Both estimates contradict the unsaved moment. The averaging here is legitimate precisely because the conductor-dependent factors in (4.3) are outside each polynomial.
  #emph[Moments of different lengths.] We may now assume that every $a_i < 1$. Pigeonhole the absolute values of the individual polynomials. Values smaller than a sufficiently large fixed negative power of $Y$ can be discarded using the trivial bounds for the other factors and the number of characters. After a further subsequence, there is a set of $R$ rows on which their absolute values are $Y^(v_i + o \( 1 \))$, where $v_i lt.eq a_i$, and
  #[#set math.equation(numbering: n => "(4.6)")
   $ r := lim frac(log R, log Y) gt.eq 7 / 3 - 2 v \, #h(2em) v = sum_i v_i . $ <eq:dual-large-values>]
  In the second configuration, cardinality gives $r lt.eq 2 \/ 3$. The ordinary sieve applied to the square of the full product gives $r + 4 v lt.eq 4$. Together with (4.6), these imply $v = 5 \/ 6$ and $r = 2 \/ 3$. There is therefore an index with $0 < a_i < 1$ and $v_i gt.eq 5 a_i \/ 6$. Multiply the full product by this additional factor, and put $z = 1 + a_i in \( 1 \, 2 \)$. Its value on the chosen rows has exponent at least $5 z \/ 6$. The ordinary sieve yields
  $ r lt.eq max \( 4 \/ 3 \, z \) + z - 5 z \/ 3 = max \( 4 \/ 3 \, z \) - 2 z \/ 3 < 2 \/ 3 \, $
  a contradiction.
  In the first configuration fix $q$ without changing the limiting inequality (4.6). The rows are now distinct squarefree $p$ of length $Y^(1 + o \( 1 \))$. Put $d_i = v_i - 5 a_i \/ 6$. For any fixed nonnegative integer multiplicities $k_i$ such that $z = sum_i k_i a_i in \[ 1 \/ 2 \, 2 \]$, the corresponding product is a divisor-bounded polynomial of length $Y^(z + o \( 1 \))$. The unrestricted-inner cubic sieve gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ r lt.eq 2 / 3 - 2 sum_i k_i d_i . $ <eq:dual-multiplicity>]
  Here we used
  $ z + max { 1 \, z \, 2 \( 1 + z \) \/ 3 } = 2 / 3 + frac(5 z, 3) #h(2em) \( 1 \/ 2 lt.eq z lt.eq 2 \) . $
  The all-ones multiplicity vector makes the right side of (4.7) equal to the lower bound in (4.6). Increasing any one multiplicity therefore proves $d_i lt.eq 0$. Decreasing it proves $d_i gt.eq 0$ whenever $a_i lt.eq 1 \/ 2$. Thus all short factors have $d_i = 0$, including factors with $a_i = 0$.
  There is at most one index with $a_i > 1 \/ 2$. If there is one, remove it and use copies of a positive short factor to obtain a length exponent in $\[ 1 \/ 2 \, 2 \]$. Such a short factor exists because no $a_i$ is one. Equation (4.7) then gives $r lt.eq 2 \/ 3$, forcing the remaining $d_i gt.eq 0$ as well. Consequently all $d_i = 0$ and $r = 2 \/ 3$.
  Choose a positive short exponent $a lt.eq 1 \/ 2$. Some fixed integer multiple of $a$ lies strictly between $4 \/ 3$ and $2$, since the width of that interval exceeds $a$. Taking the corresponding copies produces a divisor-bounded polynomial of length $Z = Y^(z + o \( 1 \))$, with $4 \/ 3 < z < 2$, whose values are $Y^(5 z \/ 6 + o \( 1 \))$ on at least $Y^(2 \/ 3 - o \( 1 \))$ distinct squarefree rows. The integer multiplicity is fixed after passing to the subsequence; it does not grow with $Y$, even when the limiting $a$ is small.
  #emph[Near orthogonality.] Choose a nonnegative smooth radial weight equal to at least one on the support of this last polynomial. Weighted Cauchy and the row-sum bound for its Gram matrix give the classical Bombieri–Halász–Montgomery inequality; see [4] Theorem 1, equation (1) for this Hilbert-space step. In the present notation it gives
  $ R Y^(5 z \/ 3 + o \( 1 \)) lt.eq Z Y^(o \( 1 \)) (O \( Z \) + max_p sum_(p' eq.not p) \| T_(p \, p') \|) . $
  The support ratio is fixed, since the number of copied factors is fixed. Lemma 12, with $P = Y^(1 + o \( 1 \))$, bounds each squared off-diagonal row sum by
  $ Y^(o \( 1 \)) Z (Y + \( Y^3 \/ Z \)^(2 \/ 3)) . $
  After dividing the Gram inequality by $Z R$, the left side has exponent $2 z \/ 3$. The diagonal has exponent at most $z - 2 \/ 3$, and Cauchy’s inequality bounds the off-diagonal average by exponent
  $ frac(z + max \( 1 \, 2 - 2 z \/ 3 \) - 2 \/ 3, 2) . $
  Both are strictly less than $2 z \/ 3$: the diagonal gap is $\( 2 - z \) \/ 3$; the other gap is $\( 3 z - 4 \) \/ 6$ for $z lt.eq 3 \/ 2$, and $\( z - 1 \) \/ 6$ for $z gt.eq 3 \/ 2$. These positive gaps absorb every arbitrarily small fixed power loss and give the final contradiction.
  #emph[Uniform neighborhoods.] If the proposition failed for every positive neighborhood size and power saving, choose successively shrinking neighborhood sizes and savings, and then arbitrarily large counterexamples. A diagonal sequence would have extra twist and exclusion norms $Y^(o \( 1 \))$, length exponents tending to one of the specified pairs, and moment at least $Y^(7 \/ 3 - o \( 1 \))$. There are only boundedly many factors, and their length exponents lie in a compact simplex. The preceding pigeonholing also confines all relevant value exponents to a fixed compact interval. The proof therefore applies to a subsequence of these counterexamples. Every selected multiplicity and every small power loss is fixed before taking the limit. The resulting contradiction proves the existence of fixed $delta \, eta > 0$ and the asserted uniform bound. ◻
]

== 5 Corrected dispersion <sec:dispersion>

The correction in this section is the cubic-frequency term in Poisson summation. This is the dispersion mechanism used by Dunn and Radziwiłł [2] Section 9, Propositions 9.1–9.2. Their squarefree majorant and cube-frequency correction guide the argument. The noncube estimates and the Type I mixed-term comparison are proved here with the unconditional inputs of the preceding sections. We keep track of the coefficient restrictions and the frequency ranges needed here; the two exceptional ranges will be handled by Proposition 10.

Throughout the section, put

#[#set math.equation(numbering: n => "(5.1)")
 $ A B asymp X \, #h(2em) X^0.32 lt.eq B lt.double X^(1 \/ 2) \, #h(2em) H = B^2 / A \, #h(2em) cal(Q) = A B H^(1 \/ 3) \, #h(2em) L = log X . $ <eq:dispersion-scales>]

All sums over letters denoting ideals use primary generators prime to $3$, unless a full lattice is expressly specified. Let $beta_b$ be divisor-bounded, supported on squarefree $b$ with $N b asymp B$. When $B > X^0.40$, suppose in addition that $beta$ is a squarefree-restricted convolution of a fixed number of prime sequences of the kind in Proposition 10, each prime having norm at least $X^c$ for some fixed $c > 0$. The weights on the individual prime dyads are smooth; there is no additional cutoff coupling their products. Set

#[#set math.equation(numbering: n => "(5.2)")
 $ beta_b \( u \) & = beta_b \( N b \)^(i u) \, & S \( u \) & = sum_b beta_b \( u \) \( N b \)^(- 1 \/ 6) \,\
F_u \( a \) & = sum_b beta_b \( u \) G \( b \) overline(chi_b \( a \)) . $ <eq:dispersion-polynomials>]

Let $W$ be a nonnegative radial smooth function, bounded in absolute value and supported in a fixed annulus in $bb(C)$, and write $W_A \( a \) = W \( a \/ sqrt(A) \)$.

The low-height assertion uses the following property of $beta$:

#quote(block: true)[
  #emph[(SW)] For every fixed conductor log-power and every fixed norm-height log-power, the sum of $beta_b$ against a nonprincipal cubic Hecke character of the indicated conductor, with a norm twist of the indicated height, is $O_D \( B L^(- D) \)$ for every $D > 0$. The same assertion holds after imposing coprimality to any specified element of norm $X^(O \( 1 \))$.
]

The implied constants are uniform in these characters, twists, and exclusions. The fixed powers in the divisor bounds are chosen before any roughness parameter below.

#thm([Proposition 5.1.])[
  (Dispersion estimates).  #emph[Under the preceding hypotheses the following assertions hold.]
  + #emph[If $H gt.double 1$ and $\| u \| lt.eq X^0.17$, and the derivatives of $W$ are bounded independently of $X$, then 
$ sum_a W_A \( a \) \| F_u \( a \) \|^2 lt.double cal(Q) L^(O \( 1 \)) . $

]
  + #emph[Suppose $\| u \| lt.eq L^(O \( 1 \))$, $H gt.double 1$, and $beta$ has property #emph[(SW)] and is supported on elements all of whose prime factors have norm greater than $L^(C_r)$. For every fixed $K > 0$, if $C_r \, C_g$ are sufficiently large, then for $H gt.eq L^(C_g)$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ sum_a mu^2 \( a \) W_A \( a \) lr(|F_u \( a \) - c_(*) overline(G \( a \)) \( N a \)^(- 1 \/ 6) S \( u \)|)^2 lt.double cal(Q) L^(- K) . $ <eq:dispersion-corrected>]

 For $1 lt.double H < L^(C_g)$ one has the uncorrected estimate 
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_a W_A \( a \) \| F_u \( a \) \|^2 lt.double A sum_b \| beta_b \|^2 + cal(Q) {(B^(- 1) sum_b \| beta_b \|)^2 + L^(- K)} . $ <eq:dispersion-short>]

 Here $1 lt.double H$ means only that $H$ is bounded below by a positive constant. In these low-height assertions the derivatives of $W$ are bounded independently of $X$.]
  + #emph[Suppose $u = plus.minus t + u_0$, $T lt.eq \| t \| lt.eq 2 T$, $2 T + \| u_0 \| lt.eq X^0.17$, and $\| partial^j W \| lt.double_j L^(C j)$ for fixed $C$. For every fixed $K > 0$, if $T gt.eq L^(C_t)$ with $C_t$ sufficiently large, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ integral_(T lt.eq \| t \| lt.eq 2 T) sum_a W_A \( a \) \| F_(plus.minus t + u_0) \( a \) \|^2 frac(d t, T) lt.eq integral_(T lt.eq \| t \| lt.eq 2 T) cal(D)_W frac(d t, T) + O \( cal(Q) L^(- K) \) \, $ <eq:dispersion-height>]

 where the exact diagonal is 
$ cal(D)_W = sum_b \| beta_b \|^2 sum_(\( a \, b \) = 1) W_A \( a \) . $

 No lower bound on $H$ is required here. When $B lt.eq X^0.40$ the restriction on $u_0$ can be omitted.]
    #emph[There is also an absolute sufficiently small $gamma > 0$ such that, when $B lt.eq X^0.40$, $T gt.double X^0.01$, and $\| partial^j W \| lt.double_j X^(j gamma)$, the corresponding estimate is 
#[#set math.equation(numbering: n => "(5.6)")
 $ integral_(T lt.eq \| t \| lt.eq 2 T) sum_a W_A \( a \) \| F_(plus.minus t + u_0) \( a \) \|^2 frac(d t, T) lt.eq integral_(T lt.eq \| t \| lt.eq 2 T) cal(D)_W frac(d t, T) + O \( cal(Q) X^(- 10 gamma) \) . $ <eq:dispersion-power>]

 This $gamma$ is independent of the fixed powers in the divisor bounds. In the last two estimates, a radial support of width $O \( J^(- 1) \)$ gives 
$ cal(D)_W lt.double A / J sum_b \| beta_b \|^2 $

 for $J lt.eq L^(O \( 1 \))$, or $J lt.eq X^gamma$, respectively. In particular, when $B lt.eq X^0.40$, the coefficients may be restricted sharply to any norm cell without changing these assertions.]
] <prop:dispersion>

#proof[
  Opening the second moment isolates its diagonal; Poisson summation expresses the off-diagonal part in frequencies. For (5.3), the cube contributions identified below produce the model square, while the noncube contribution is small. The Type I comparison supplies the matching mixed term, giving cancellation in the corrected square. For the height averages, averaging makes the cube contributions small as well, leaving the exact diagonal needed for norm localization. We establish the shared frequency bounds before evaluating the cube main term and completing that cancellation.
  All arbitrarily small power losses below come from Heath-Brown’s cubic large sieve [5], in the forms of Theorem 3 and Lemma 5; they will be chosen smaller than the fixed power gaps. For logarithmic savings at small conductors we instead use Lemma 4, with no such loss.
  ===== 5.1 Squarefree majorization. <squarefree-majorization.>
  Only for (5.3), majorize the squarefree weight in the positive $\| F_u \( a \) \|^2$ term by
  #[#set math.equation(numbering: n => "(5.7)")
   $ mu^2 \( a \) lt.eq (sum_(c^2 divides a\
N c lt.eq L^(D_0)) mu \( c \))^2 = sum_(d^2 divides a) lambda_d . $ <eq:dispersion-sieve>]
  The inequality is equality on squarefree $a$. Expanding the square shows that $d$ is squarefree, $N d lt.eq L^(2 D_0)$, $\| lambda_d \| lt.eq tau \( d \)^2$, and $lambda_d = mu \( d \)$ for $N d lt.eq L^(D_0)$. For the uncorrected estimates take only $d = 1$, with coefficient one. The mixed and model terms of the corrected square will retain their true squarefree weights.
  The diagonal is $cal(D)_W$ when $d = 1$. In the sieved case it is $O \( A B L^(O \( 1 \)) \)$: for example, sum $\| lambda_d \| A \/ \( N d \)^2$ and use the coefficient second moment. This is $O \( cal(Q) L^(- K) \)$ once $H gt.eq L^(C_g)$ with $C_g$ large enough.
  ===== 5.2 Poisson summation. <poisson-summation.>
  For an off-diagonal pair write
  $ f = \( b_1 \, b_2 \) \, #h(2em) b_i = f p_i \, #h(2em) F = N f \, $
  so that $p_1 \, p_2$ are coprime, squarefree, prime to $f$, and have norm $asymp B \/ F$. The summand vanishes unless $\( b_1 b_2 \, d \) = 1$. Remove the remaining restriction $\( a \, f \) = 1$ by Mobius inversion, and write
  $ a = d^2 m x \, #h(2em) m divides f \, #h(2em) M = N m \, #h(2em) D_d = N d . $
  Use normalized plane measure and Fourier transform
  $ d frak(m) \( z \) = 2 / sqrt(3) thin d Re z thin d Im z \, #h(2em) hat(W) \( y \) = integral_(bb(C)) W \( z \) e \( - "Tr" \( z y \) \) thin d frak(m) \( z \) . $
  Poisson summation gives, for this pair and these $d \, m$, the following expression, to be multiplied by $lambda_d mu \( m \)$:
  #[#set math.equation(numbering: n => "(5.8)")
   $ & frac(A, 9 D_d^2 M) frac(beta_(f p_1) \( u \) overline(beta_(f p_2) \( u \)), \| p_1 p_2 \|) sum_(h in cal(O)\
h eq.not 0) e ("Tr" frac(h, 3 lambda)) hat(W) (frac(h sqrt(A), 3 lambda D_d sqrt(M) thin p_1 p_2))\
 & #h(35mm)  dot.op chi_(p_1) #scale(x: 120%, y: 120%)[\(] d h \( f m \)^(- 1) #scale(x: 120%, y: 120%)[\)] overline(chi_(p_2) #scale(x: 120%, y: 120%)[\(] d h \( f m \)^(- 1) #scale(x: 120%, y: 120%)[\)]) . $ <eq:poisson>]
  The inverses here and below are residue-class notation.
  Here are the arithmetic details of this identity. The trace-dual lattice of $cal(O)$ is $lambda^(- 1) cal(O)$. Thus the modulus $3 p_1 p_2$ has index $9 N \( p_1 p_2 \)$, and the dilation contributes $A \/ \( D_d^2 M \)$. Since $d \, m$ are primary, $x$ must be primary. Put $q = p_1 p_2$ and represent this coset by $x = q + 3 s$, $s$ modulo $q$. Its additive factor is
  $ e ("Tr" frac(h, 3 lambda)) e ("Tr" frac(s h, lambda q)) . $
  The local Gauss sums have magnitude $\| q \|$. Their normalized factors cancel those in $G \( f p_1 \) overline(G \( f p_2 \))$, by (2.1). The CRT factors at $p_1$ and $p_2$ cancel by reciprocity, and the factor $3 lambda = \( - lambda \)^3$ is a cube. What remains from $f$, $m$, and $d^2$ is exactly $chi_(p_1) \( d h \/ \( f m \) \) overline(chi_(p_2) \( d h \/ \( f m \) \))$, since $overline(chi \( d^2 \)) = chi \( d \)$. The common local factors at $f$ were the indicator $\( a \, f \) = 1$, explaining its Mobius removal. At frequency zero at least one nontrivial character modulo $p_i$ has zero sum, because the original pair was unequal. Finally, radiality permits the complex dilation by $d^2 m$ to be replaced by its absolute value.
  ===== 5.3 Discarding large common divisors. <discarding-large-common-divisors.>
  Fix a sufficiently small positive $delta$, to be specified after the frequency estimates, and first remove $F gt.eq X^delta$. The natural dual norm scale in (5.8) is
  #[#set math.equation(numbering: n => "(5.9)")
   $ H' = frac(H D_d^2 M, F^2) . $ <eq:dispersion-dual-scale>]
  If $H < X^(delta \/ 2)$, then $M lt.eq F$ gives $H' lt.eq X^(- delta \/ 2 + o \( 1 \))$. Every nonzero frequency is in a rapidly decreasing Fourier tail, so the contribution is power-negligible. This remains so for the power-width weights after choosing $gamma$ sufficiently small in terms of $delta$.
  If $H gt.eq X^(delta \/ 2)$, invert the function $1_(N \( b_1 \, b_2 \) gt.eq X^delta)$ on the divisor lattice. Its divisor coefficients are bounded by $tau \( e \)$ and vanish for $N e < X^delta$. For each fixed $e$, the resulting full form is bounded by a sum of squares with inner length $B \/ N e$: the common factor $chi_e \( a \)$ drops out in absolute value, and (2.1) merely rephases the coefficients. The sieve weight costs at most a small power. By (2.5), a dyad $N e asymp E$ therefore costs
  $ X^epsilon.alt E (A + \( A B \/ E \)^(2 \/ 3)) B / E = X^epsilon.alt (A B + cal(Q) E^(- 2 \/ 3)) . $
  Here $A gt.double B \/ E$ allows the last term of (2.5) to be absorbed. Relative to $cal(Q)$, the first term saves $H^(- 1 \/ 3) lt.eq X^(- delta \/ 6)$ and the second saves $E^(- 2 \/ 3) lt.eq X^(- 2 delta \/ 3)$. Removing a diagonal costs at most $X^epsilon.alt A B$, with the same saving. Summing the logarithmically many dyads proves the required power saving.
  ===== 5.4 Separating the remaining pairs. <separating-the-remaining-pairs.>
  For $F < X^delta$, both $p_i$ are nontrivial. In (5.8) remove their mutual coprimality by $sum_(l divides \( p_1 \, p_2 \)) mu \( l \)$, and set
  $ p_i = l n_i \, #h(2em) V_l = N l \, #h(2em) B' = B \/ \( F V_l \) . $
  For clarity, we extend the #emph[displayed expression] in (5.8) to all pairs before this Mobius inversion; we do not assert the original Poisson identity for artificial noncoprime pairs. The inversion returns precisely the original coprime pairs. Squarefree support forces $\( l \, n_i \) = 1$. The common character factors then multiply to $\| chi_l \( d h \/ \( f m \) \) \|^2$, an exclusion on $h$ alone. All other fixed coprimality conditions may be put into the individual coefficients. Artificial equal pairs cancel in the exact Mobius identity; the only exceptional pair $p_1 = p_2 = 1$ is impossible in this range.
  On a frequency dyad $N h asymp J$, put $k = J \/ H'$. Mellin separation of the radial transform and the norm denominators, followed by Cauchy in $h$, reduces the estimate to shifted squares
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(h in cal(O)\
N h asymp J) lr(|sum_n beta_(f l n) \( N n \)^(i u') chi_n #scale(x: 120%, y: 120%)[\(] d h \( f m \)^(- 1) #scale(x: 120%, y: 120%)[\)]|)^2 \, $ <eq:dispersion-separated>]
  with fixed exclusions understood. The shift $u'$ is $u$ plus a Mellin variable. A smooth cutoff equal to one on all possible scaled norm ratios lets us place every additional smooth factor into the separated kernel. Thus at $f = l = 1$ no new cutoff on the prime products is imposed: both the prime-convolution hypothesis and (SW) are preserved.
  We record the transform cost explicitly. On the compact sets of positive scaled norms, integration by parts in the plane Fourier transform and then in the two log-norm variables gives, for arbitrary fixed $R \, M_0$, a separated-kernel bound of the form
  $ C_(R \, M_0) \( W \) \( 1 + k \)^(- R) \( 1 + \| v_1 \| + \| v_2 \| \)^(- M_0) . $
  Here $C_(R \, M_0) \( W \)$ is bounded by finitely many derivative seminorms of $W$. It is a fixed log-power for log-scale weights and $X^(O \( gamma \))$ for power-width weights. We can truncate $k$ and all shifts at $X^(delta')$, for any sufficiently small fixed $delta' > 0$, with power-negligible tails, choosing finitely many integrations by parts first and $gamma$ afterwards. Inside the truncation we retain these decaying factors, so their integrals, even with fixed polynomial weights in $k$ and the shifts, cost only log-powers or $X^(O \( gamma \))$. All shifts are independent of the averaging variable $t$. Different shifts on the two sides of Cauchy present no problem. There are $O \( L \)$ frequency dyads.
  Use $J^(1 \/ 3) B' ""^2$ as a benchmark for (5.10). The prefactor in (5.8) has size $A F \/ \( D_d^2 M B \)$. Dividing its product with this benchmark by $cal(Q)$ gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ frac(A F, D_d^2 M B) frac(J^(1 \/ 3) B' ""^2, cal(Q)) = k^(1 \/ 3) D_d^(- 4 \/ 3) M^(- 2 \/ 3) F^(- 5 \/ 3) V_l^(- 2) . $ <eq:dispersion-benchmark>]
  The $f$ sum with $m divides f$, and the $d$ sum with its divisor-bounded sieve coefficients, converge with these powers.
  First discard $V_l gt.eq X^delta$. Equation (2.5) bounds the square by
  $ X^epsilon.alt #scale(x: 120%, y: 120%)[\(] J + \( J B' \)^(2 \/ 3) + J^(1 \/ 3) B' #scale(x: 120%, y: 120%)[\)] B' . $
  Its ratios to the benchmark are $J^(2 \/ 3) \/ B'$, $\( J \/ B' \)^(1 \/ 3)$, and $1$. On the retained transforms, $J lt.double X^(2 delta') B \/ F$, since $H lt.double B$, $M lt.eq F$, and $D_d$ is polylogarithmic. Also $B \/ F gt.double X^0.3$. After summing the $l$ in a dyad, the respective costs from the $V_l^(- 2)$ factor in (5.11) are bounded, up to small powers, by
  $ X^(4 delta' \/ 3) \( B \/ F \)^(- 1 \/ 3) \, #h(2em) X^(2 delta' \/ 3) V_l^(- 2 \/ 3) \, #h(2em) V_l^(- 1) . $
  Choose $delta'$ sufficiently small relative to $delta$. Each term then saves a fixed power, including after all divisor and dyadic sums.
  ===== 5.5 The large-conductor frequency ranges. <the-large-conductor-frequency-ranges.>
  For the remaining $l$, factor a nonzero frequency as
  $ h = zeta lambda^i p q^2 j^3 \, #h(2em) i in { 0 \, 1 \, 2 } \, $
  where $p \, q$ are coprime squarefree primary elements. A fixed convention on units makes the multiplicity bounded; the cube part may contain powers of $lambda$. In dyads put $N p asymp P$, $N q asymp Q$. Then $P Q^2 lt.double J$ and $N j asymp \( J \/ \( P Q^2 \) \)^(1 \/ 3)$, up to bounded factors. For each fixed $j$ the relevant benchmark is
  #[#set math.equation(numbering: n => "(5.12)")
   $ B' ""^2 \( P Q^2 \)^(1 \/ 3) . $ <eq:dispersion-pq-benchmark>]
  The number of $j$ restores the benchmark $J^(1 \/ 3) B' ""^2$. The cube part only excludes $\( n \, j \) > 1$; the other fixed symbols are coefficient twists. The inverse twist can, if desired, be written using $\( f m \)^2$ on its coprime support.
  We claim a fixed power saving over (5.12) whenever $P Q^2 gt.eq X^0.003$. Here is the full limiting-exponent check. Let $delta \, delta'$ shrink to zero along a hypothetical sequence without a power saving. Then $B' = B^(1 + o \( 1 \))$ and $P Q^2 lt.eq B^(1 + o \( 1 \))$. If $P$ has larger limiting exponent than $Q$, fix $q$ and use Theorem 3 on $p$. The bound $Q B \( P + B + \( P B \)^(2 \/ 3) \)$, divided by $B^2 \( P Q^2 \)^(1 \/ 3)$, has the three ratios
  #[#set math.equation(numbering: n => "(5.13)")
   $ frac(P^(2 \/ 3) Q^(1 \/ 3), B) \, #h(2em) \( Q \/ P \)^(1 \/ 3) \, #h(2em) \( P Q \/ B \)^(1 \/ 3) . $ <eq:dispersion-p-dominant>]
  Under $P Q^2 lt.eq B^(1 + o \( 1 \))$, all save unless $P = B^(1 + o \( 1 \))$, $Q = B^(o \( 1 \))$. If $Q$ has larger exponent, reverse the roles, conjugating the cubic character as necessary. The ratios are
  #[#set math.equation(numbering: n => "(5.14)")
   $ frac(P^(2 \/ 3) Q^(1 \/ 3), B) \, #h(2em) \( P \/ Q \)^(2 \/ 3) \, #h(2em) \( P^2 \/ B \)^(1 \/ 3) \, $ <eq:dispersion-q-dominant>]
  all with strict gaps. If the exponents agree, write $P = Q = B^(v + o \( 1 \))$. Lemma 4 gives the bound $\( B + \( P Q \)^2 \) B$, whose ratio is
  $ B^(- v + o \( 1 \)) + B^(3 v - 1 + o \( 1 \)) . $
  Since $0 < v lt.eq 1 \/ 3$, this saves unless $v = 1 \/ 3$; the endpoint $v = 0$ is ruled out by $P Q^2 gt.eq X^0.003$.
  The two exceptional configurations are exactly those of Proposition 10. Both force $P Q^2 = B^(1 + o \( 1 \))$, hence $J gt.eq B^(1 - o \( 1 \))$, $H gt.eq B^(1 - o \( 1 \))$, and $B = X^(1 \/ 2 + o \( 1 \))$. Thus the required prime-convolution hypothesis is available. Since every supported prime has norm at least $X^c$, choosing $delta < c$ forces $f = l = 1$ eventually in this limiting test. The remaining $d$, cube part $j$, and fixed twists or exclusions have subpower norm. Moreover
  $ 1 + \| u' \| lt.eq X^0.17 + X^(delta') + 1 lt.eq B^0.36 $
  eventually. Proposition 10 therefore supplies the missing strict power saving. To check the normalization of this saving, write $delta_D \, eta_D$ for the constants in that proposition and choose an exceptional exponent radius $h_0 < min \( delta_D \/ 4 \, eta_D \/ 4 \)$. In either such neighborhood, $B^2 \( P Q^2 \)^(1 \/ 3) gt.eq B^(7 \/ 3 - h_0)$. Thus the bound $B^(7 \/ 3 - eta_D)$ still saves at least $B^(3 eta_D \/ 4)$ relative to the local benchmark; the allowed extra twists and exclusions are restricted to the same smaller neighborhood. Its fixed-neighborhood interpretation and compactness of the exponent region yield one positive saving for some fixed sufficiently small $delta \, delta'$. The arbitrary small-power losses are chosen after this gap.
  If $B lt.eq X^0.40$, the two exceptional configurations cannot occur: $H = B^3 \/ X lt.eq X^0.20$, whereas $B gt.eq X^0.32$, so $H$ cannot be $B^(1 - o \( 1 \))$. Consequently the gaps in this range are absolute. We may choose $delta \, delta'$, and subsequently $gamma$, separately for this range, independently of the prime-convolution parameters or of the fixed divisor exponents. No restriction on the norm twists is needed in this case.
  ===== 5.6 Small conductors and averaging in height. <small-conductors-and-averaging-in-height.>
  Suppose now that $P Q^2 < X^0.003$. The primitive characters indexed by the coprime squarefree pair $\( p \, q \)$ have conductor away from $3$ equal to $p q$, and the two exponents distinguish them. All fixed symbols and exclusions can be put into the coefficients. Since $\( P Q \)^2 lt.eq X^0.006 lt.double B'$, Lemma 4 bounds the ratio to (5.12) by
  #[#set math.equation(numbering: n => "(5.15)")
   $ L^(O \( 1 \)) tau \( f l \)^(O \( 1 \)) \( P Q^2 \)^(- 1 \/ 3) . $ <eq:dispersion-small-conductor>]
  The divisor factor is summable against (5.11). This gives any desired log saving once $P Q^2$ exceeds a sufficiently large fixed log-power. Without any improvement for the smaller $P \, Q$, it gives a log-power bound throughout. Together with the preceding power-saving ranges and the diagonal, this proves the coarse assertion when $H gt.double 1$.
  For the height average, fix one character row and collect equal norms in its inner polynomial. Divisor moments bound the squared coefficient sum by $B' L^(O \( 1 \)) tau \( f l \)^(O \( 1 \))$. The ordinary mean-value inequality therefore gives
  $ integral_(T lt.eq \| t \| lt.eq 2 T) \| upright("inner polynomial") \|^2 frac(d t, T) lt.double \( B' + B' ""^2 \/ T \) L^(O \( 1 \)) tau \( f l \)^(O \( 1 \)) . $
  After summing the $O \( P Q \)$ rows, the ratio to (5.12) is
  #[#set math.equation(numbering: n => "(5.16)")
   $ L^(O \( 1 \)) tau \( f l \)^(O \( 1 \)) P^(2 \/ 3) Q^(1 \/ 3) (T^(- 1) + B' ""^(- 1)) . $ <eq:dispersion-height-small>]
  Use (5.15) above a sufficiently large log-power of $P Q^2$, and (5.16) below it. Taking $C_t$ large absorbs all fixed logarithmic output and transform costs, proving (5.5).
  For (5.6), throughout this small-conductor range
  $ P^(2 \/ 3) Q^(1 \/ 3) lt.eq \( P Q^2 \)^(2 \/ 3) < X^0.002 \, #h(2em) T^(- 1) lt.double X^(- 0.01) \, #h(2em) B' ""^(- 1) lt.double X^(- 0.3) . $
  There is thus an absolute power gap, at least $0.008$ before arbitrarily small losses, in (5.16). The other frequency ranges already have absolute gaps when $B lt.eq X^0.40$. Choose $gamma$ small enough that these gaps absorb all the finitely many transform seminorm costs and the requested factor $X^(10 gamma)$. Fixed divisor powers are harmless because their losses can be taken arbitrarily small. This proves (5.6).
  Neither argument used $H gt.double 1$: if $H'$ is small, the nonzero frequency dyads merely have large $k = J \/ H'$ and are in the Fourier tail. In particular, no cube lattice asymptotic is used for the height averages. For $B lt.eq X^0.40$ only coefficient moments and large sieves were used, which proves the asserted freedom of cell restrictions and of $u_0$. Finally an annulus of radial width $O \( J^(- 1) \)$ contains $O \( A \/ J + sqrt(A) + 1 \)$ lattice points. Since $A gt.double X^(1 \/ 2)$ and $gamma$ is small, this is $O \( A \/ J \)$ in the stated ranges, proving the localized diagonal bound.
  ===== 5.7 Low-height nonprincipal frequencies. <low-height-nonprincipal-frequencies.>
  We now assume roughness and (SW). If $f$ or $l$ is nonunit, its norm exceeds $L^(C_r)$. The convergent tails in (5.11), with the fixed divisor factors, give $O \( cal(Q) L^(- K') \)$ for every desired $K'$ by taking $C_r$ large. For example, the $f$ tail decays as $F^(- 2 \/ 3)$ and the $l$ tail as $V_l^(- 1)$ on dyads, up to fixed divisor powers. The transform and coefficient complexity costs do not grow with $C_r$.
  It remains to consider $f = l = m = 1$. Exclude precisely the frequencies for which $d h$ is a cube. If $P Q^2$ is bounded by a fixed log-power, the remaining character $n mapsto chi_n \( d h \)$ is nonprincipal, with primitive conductor bounded by a fixed log-power. The cube part only adds the exclusion $\( n \, j \) = 1$, permitted in (SW). Hence (SW) gives any required log saving in (5.12), taking its exponent large enough to absorb the number of rows and the other logarithmic costs. For Mellin shifts beyond a sufficiently large log-power use rapid transform decay and the coarse bounds already proved for the separated squares. Together with (5.15) and the large-conductor power savings, this leaves only the cube frequencies, with error $O \( cal(Q) L^(- K') \)$.
  ===== 5.8 The cube frequencies and their constant. <the-cube-frequencies-and-their-constant.>
  Since $d$ is squarefree, $d h$ is a cube exactly when
  $ h = d^2 j^3 \, #h(2em) j in cal(O) \\ { 0 } . $
  Every such $h$ has exactly three preimages, from the three cube roots of unity. The additive phase in (5.8) is one: a cube in $cal(O)$ is congruent modulo $3$ to a rational integer, and $d equiv 1 med \( mod med 3 \)$. Choose $C_r > 2 D_0$, so $d$ is coprime to every supported $b$.
  Temporarily discard $\( j \, b_1 b_2 \) = 1$. Substituting $h = d^2 j^3$ into (5.8) cancels the magnitude of $d^2$ against $D_d$ in the Fourier argument. A rotation is immaterial by radiality. The cube frequency sum, counting each frequency once, is therefore
  #[#set math.equation(numbering: n => "(5.17)")
   $ 1 / 3 (frac(27 N \( b_1 b_2 \), A))^(1 \/ 3) integral_(bb(C)) hat(W) \( z^3 \) thin d frak(m) \( z \) + O \( H^(1 \/ 6) + 1 \) . $ <eq:dispersion-cube-lattice>]
  Indeed the lattice radius is comparable to $H^(1 \/ 6)$, and $z mapsto hat(W) \( z^3 \)$ is Schwartz. The elementary lattice Riemann-sum error is $O \( H^(1 \/ 6) + 1 \)$; deleting the origin costs $O \( 1 \)$. For $H gt.eq L^(C_g)$ this is a relative $O \( H^(- 1 \/ 6) \)$ saving. For any prime $pi$, rapid decay bounds the nonzero multiples of $pi$ in this lattice sum by $O \( H^(1 \/ 3) \/ N pi \)$, also when the lattice spacing exceeds the radius. Restoring coprimality thus costs
  $ O (H^(1 \/ 3) sum_(pi divides b_1 b_2) frac(1, N pi)) \, $
  which saves arbitrarily many log-powers by roughness. For (5.4), with $d = 1$, only the absolute bound $O \( H^(1 \/ 3) \)$ for this sum is needed. Its contribution is directly
  $ lt.double A / B H^(1 \/ 3) (sum_b \| beta_b \|)^2 = cal(Q) (B^(- 1) sum_b \| beta_b \|)^2 . $
  Together with the diagonal and the already bounded noncube terms, this proves (5.4).
  We evaluate the integral in (5.17) exactly. The cubing map has Jacobian $9 \| z \|^4$ and generic multiplicity three, so
  $ integral hat(W) \( z^3 \) thin d frak(m) \( z \) = 1 / 3 integral hat(W) \( y \) \| y \|^(- 4 \/ 3) thin d frak(m) \( y \) . $
  For the trace Fourier pairing its Riesz-kernel constant, including $1 \/ 3$, is
  $ 1 / 3 2 / sqrt(3) pi \( 2 pi \)^(- 2 \/ 3) frac(Gamma \( 1 \/ 3 \), Gamma \( 2 \/ 3 \)) = frac(\( 2 pi \)^(4 \/ 3), 9 Gamma \( 2 \/ 3 \)^2) = c_(*)^2 . $
  For completeness, represent $\| y \|^(- 4 \/ 3)$ as a Gamma integral of Gaussians and apply the two-dimensional Gaussian Fourier integral; the pairing $"Tr" \( z y \) = 2 Re \( z y \)$ replaces the ordinary Fourier frequency by twice a reflected vector, while $d frak(m) = \( 2 \/ sqrt(3) \) thin d Re y thin d Im y$ supplies the other factor. The last equality uses $Gamma \( 1 \/ 3 \) Gamma \( 2 \/ 3 \) = 2 pi \/ sqrt(3)$. Gaussian regularization justifies the interchange, since the singularity at zero is locally integrable and $hat(W)$ is rapidly decreasing. We conclude that
  #[#set math.equation(numbering: n => "(5.18)")
   $ integral hat(W) \( z^3 \) thin d frak(m) \( z \) = c_(*)^2 integral W \( y \) \| y \|^(- 2 \/ 3) thin d frak(m) \( y \) . $ <eq:dispersion-riesz>]
  Combining (5.17) with the prefactor in (5.8) gives the scaled factor
  $ frac(A^(2 \/ 3), 9 D_d^2) \( N b_1 N b_2 \)^(- 1 \/ 6) . $
  Moreover,
  $ sum_d frac(lambda_d, \( N d \)^2) = sum_d frac(mu \( d \), \( N d \)^2) + O \( L^(- D_0 \/ 2) \) \, $
  by $lambda_d = mu \( d \)$ up to $L^(D_0)$ and absolute convergence with the divisor bound. The primary coset has density $1 \/ 9$. Ordinary squarefree lattice counting, by square-divisor inversion, therefore identifies the total cube term as
  #[#set math.equation(numbering: n => "(5.19)")
   $ c_(*)^2 \| S \( u \) \|^2 sum_a mu^2 \( a \) W_A \( a \) \( N a \)^(- 1 \/ 3) + O \( cal(Q) L^(- K') \) \, $ <eq:dispersion-cube-main>]
  on taking $D_0 \, C_r \, C_g$ sufficiently large. The counting error is a power saving: a smooth annular squarefree count has error $O_epsilon.alt \( A^(1 \/ 2 + epsilon.alt) \)$, and the extra weight contributes $A^(- 1 \/ 3)$ instead of the main scale $A^(2 \/ 3)$.
  ===== 5.9 Cancellation in the corrected square. <cancellation-in-the-corrected-square.>
  Open the square in (5.3). The preceding work bounds its positive $\| F_u \|^2$ part by the main term in (5.19) and $O \( cal(Q) L^(- K') \)$. For its mixed term retain the true squarefree weight and use (2.1):
  $ sum_a mu^2 \( a \) W_A \( a \) \( N a \)^(- 1 \/ 6) G \( a \) F_u \( a \) = sum_(a \, b) beta_b \( u \) W_A \( a \) \( N a \)^(- 1 \/ 6) G \( a b \) . $
  Apply Proposition 8 at $R = B$, $U = A$, which is allowed since $B lt.double X^(1 \/ 2) < X^0.51$. It replaces this by
  $ c_(*) sum_(a \, b) beta_b \( u \) mu^2 \( a b \) W_A \( a \) \( N a \)^(- 1 \/ 3) \( N b \)^(- 1 \/ 6) \, $
  with error $O \( A^(- 1 \/ 6) X^(5 \/ 6 - eta) \)$. Since $\| S \( u \) \| lt.double B^(5 \/ 6) L^(O \( 1 \))$, multiplication by $overline(S \( u \))$ leaves error
  $ A^(- 1 \/ 6) B^(5 \/ 6) X^(5 \/ 6 - eta) L^(O \( 1 \)) = cal(Q) X^(- eta) L^(O \( 1 \)) . $
  In the model sum, remove the mutual coprimality of $a \, b$ at logarithmic cost. A shared prime has norm greater than $L^(C_r)$, and the unweighted pair count saves a factor bounded by $sum_(N pi > L^(C_r)) \( N pi \)^(- 2)$; coefficient moments and Cauchy retain an arbitrarily large log saving as $C_r$ grows. Thus the mixed main term, after multiplication by $c_(*) overline(S \( u \))$, is exactly the main term in (5.19), within the desired error. The model square has that same main term because $\| G \( a \) \|^2 = 1$ on squarefree $a$. Its coefficients in the expanded corrected square are consequently $1 \, - 2 \, 1$, which cancel.
  Choose $D_0$ first, then $C_r$ large enough for roughness and the sieve coprimality, and $C_g$ large enough for the diagonal and lattice errors; use (SW) with the finitely many required conductor, twist, and saving powers. This proves (5.3) and completes the proof of all assertions. ◻
]

#prodef([Remark 5.2.])[
  (The logarithmic transition).  The uncorrected estimate retains the useful prime sparsity. If $b$ is one prime and $a$ is a product of two primes, each in its specified dyad of length $X^(1 \/ 3) L^(O \( 1 \))$, bounded weights give a bilinear bound $O \( X^(5 \/ 6) L^(- 3 \/ 2) \)$ for $H gt.double 1$. Proposition 20 will derive this from (5.4), retaining the different prime-density factors on the two sides. This half-power of logarithmic saving beyond $X^(5 \/ 6) \/ L$ is what allows the three-prime transition to survive a fixed power of $log L$ in the number of pieces. No power saving at that transition is required.
] <rem:dispersion-transition>

== 6 An exact decomposition of the prime sum <sec:decomposition>

All factorizations in this section are factorizations of ideals prime to $3$, written using their primary generators. In particular, prime factors of the same norm are still regarded as distinct when their ideals are distinct. Write $L = log X$, and let $V$ be a fixed smooth function supported in a compact subinterval of $\( 0 \, oo \)$. We consider sums with the envelope $V \( N \( n \) \/ X \)$. Constants below may depend on its support and on fixed smoothness bounds.

Fix sufficiently small positive constants $kappa \, rho$, with $rho$ sufficiently small in terms of $kappa$, and then fix

$ 0 < xi < kappa \/ 10 \, #h(2em) w = X^xi \, #h(2em) z = X^.40 . $

The choice of $kappa$ relative to the power-width constant in Proposition 13 will be made in the next section. We call a height block #emph[ordinary] when $T lt.double X^.01$, including bounded heights, and #emph[upper] when $T gt.double X^.01$. The upper blocks used below have $T lt.double X^(1 \/ 6 + rho)$.

The construction reflects the two coefficient regimes in dispersion. For bilinear norm lengths $A B asymp X$, with $B lt.double sqrt(X)$, the range $B > X^.40$ requires independently weighted smooth prime convolutions; the range $B lt.eq X^.40$ permits sharp restrictions on divisor-bounded coefficients. We first expose a bounded tuple of primes with norms between $w$ and $2 z$. If its product scale is large, we expand the remaining factors into bounded prime tuples and group their fixed scales. If that scale is small, we use Mobius inversion and stop a product of small primes in norm bins. This second construction must separate the two coefficients exactly. On ordinary blocks it must also retain roughness and (SW), apart from a sparse family whose contribution can be bounded directly.

#thm([Proposition 6.1.])[
  (Prime decomposition).  #emph[For either kind of height block, the prime sum with envelope $V$ has an exact decomposition into a number of Type I and bilinear terms bounded by a fixed power of $L$. This decomposition is valid with either kernel 
$ G \( n \) N \( n \)^(i t) quad upright("or") quad c_(*) mu^2 \( n \) N \( n \)^(- 1 \/ 6 + i t) \, $

 and uses the same coefficients for the two kernels. The coefficients are independent of $t$, divisor-bounded, and have all fixed absolute moments of the usual size $Y L^(O \( 1 \))$ on a norm dyad of length $Y$. The resulting terms have the following properties.]
  + #emph[Type I terms have an unrestricted inner variable $u$ and an outer variable $r$ with 
$ N \( r \) asymp R \, #h(2em) R lt.eq X^.40 quad upright("on ordinary blocks") \, #h(2em) R lt.eq X^(1 \/ 3 - kappa \/ 2) quad upright("on upper blocks") . $

 Their inner weight is a smooth envelope at length $X \/ R$, with fixed derivative bounds, depending permissibly on $r$.]
  + #emph[Bilinear terms have independent coefficients $alpha_a \, beta_b$, may be restricted individually to squarefree $a \, b$, and satisfy 
$ N \( a \) asymp A \, quad N \( b \) asymp B \, quad A B asymp X \, quad B lt.double sqrt(X) . $

 On ordinary blocks, $B gt.eq c X^(1 \/ 3)$ for some fixed $c > 0$; on upper blocks, $B gt.eq X^(1 \/ 3 - 3 kappa)$. Whenever $B > X^.40$, the $b$ coefficient is a squarefree-restricted convolution of a bounded number of prime sequences on independent smooth norm dyads, each prime having norm at least a fixed positive power of $X$. There is no additional cutoff coupling those prime dyads.]
  + #emph[On ordinary blocks, apart from the sparse terms in part (5), the $b$ coefficient is supported on numbers all of whose prime factors have norm greater than $L^(C_r)$ and satisfies the property (SW) required in Proposition 13. Here $C_r$ is any fixed constant chosen sufficiently large later.]
  + #emph[For any fixed $C_g$, the ordinary bilinear terms with 
$ 1 lt.double H := B^2 \/ A < L^(C_g) $

 consist of precisely three primes: one prime on the $b$ side and two specified prime dyads on the $a$ side. All three scales are $X^(1 \/ 3) L^(O \( 1 \))$, their weights and multiplicities are bounded, and the number of these terms is $O \( \( 1 + log L \)^(O \( 1 \)) \)$. In each such term, 
#[#set math.equation(numbering: n => "(6.1)")
 $ sum_a \| alpha_a \|^2 lt.double A \/ L^2 \, #h(2em) sum_b \| beta_b \|^2 + sum_b \| beta_b \| lt.double B \/ L . $ <eq:decomposition-triple-moments>]

 All other nonsparse ordinary bilinear terms have $H gt.eq L^(C_g)$ for sufficiently large $X$.]
  + #emph[The remaining ordinary terms have $X^.35 lt.double B < X^.40$ and a sparse $b$ support. Their total contribution, for either kernel and uniformly in $t$, is $O \( X^(5 \/ 6 - eta) \)$ for some $eta > 0$ depending on the fixed parameters.]
  #emph[The exponents in the number of terms and in the divisor bounds can be chosen independently of $C_r$ and $C_g$. All asserted identities hold before estimating either kernel.]
] <prop:decomposition>

=== 6.1 Prime detection and bounded prime tuples <prime-detection-and-bounded-prime-tuples>

Take a fixed smooth function $psi$ with values in $\[ 0 \, 1 \]$, equal to $1$ on $\( 0 \, 1 \]$ and to $0$ on $\[ 2 \, oo \)$, and put

$ psi_y \( pi \) = psi \( N \( pi \) \/ y \) \, #h(2em) cal(F)_y \( n \) = product_(pi divides n) \( 1 - psi_y \( pi \) \) . $

Both kernels in Proposition 15 vanish on nonsquarefree arguments. We may therefore use identities only on squarefree $n$ throughout this section.

#thm([Lemma 6.2.])[
  (Exact prime detector).  #emph[For squarefree $n$ on the envelope support and sufficiently large $X$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ bold(1)_({ n med upright("prime") }) = cal(F)_z \( n \) - bold(1)_({ Omega \( n \) = 2 }) cal(F)_z \( n \) . $ <eq:prime-detector>]

 Moreover, $cal(F)_z \( n \)$ is an exact sum of bounded-length distinguished prime tuples 
#[#set math.equation(numbering: n => "(6.3)")
 $ cal(F)_z \( n \) = sum_(i gt.eq 0) frac(1, i !) sum_(n = pi_1 dots.h.c pi_i h) cal(F)_w \( h \) product_(j = 1)^i \( psi_w \( pi_j \) - psi_z \( pi_j \) \) . $ <eq:distinguished-tuples>]

 Only boundedly many $i$ contribute, and the distinguished primes have norms in $\[ w \, 2 z \]$.]
] <lem:prime-detector>

#proof[
  Nonvanishing of $cal(F)_z \( n \)$ requires every prime factor to have norm greater than $z$. Three factors would give $N \( n \) > X^1.20$, outside the fixed envelope. On a prime in that envelope the factor $cal(F)_z$ is exactly $1$. This proves (6.2).
  Expand, independently at every prime factor,
  $ 1 - psi_z = \( 1 - psi_w \) + \( psi_w - psi_z \) . $
  The chosen factors in the second summand form an unordered subset; ordering them and dividing by $i !$ gives (6.3). The difference of cutoffs vanishes below $w$ and above $2 z$. Since the total norm is $O \( X \)$ and every chosen prime has norm at least $X^xi$, their number is bounded in terms of $xi$. The same bound applies to the number of prime factors of $h$ when $cal(F)_w \( h \) eq.not 0$. ◻
]

The two-prime correction in (6.2) is an ordered pair sum with scalar $1 \/ 2$. Smooth dyadic partitions place its two prime norms between constant multiples of $X^.40$ and $X^.60$. Taking the shorter scale for $B$ gives all the required bilinear properties, with $H$ a fixed positive power of $X$.

In (6.3), put $r = pi_1 dots.h.c pi_i$ and insert smooth norm dyads on the distinguished primes. Let $R$ be the product of their scales, with $R = 1$ when $i = 0$. Thus $N \( r \) asymp R$, with a fixed support ratio. Set

$ s_0 = .345 quad upright("on ordinary blocks") \, #h(2em) s_0 = 1 \/ 3 - 2 kappa quad upright("on upper blocks") . $

Suppose first that $R gt.eq X^(s_0)$. Expand $h$ by its bounded number of prime factors, divide the ordered factorization by its factorial, and insert independent smooth prime dyads. All prime norms are at least $w$ and at most a constant times $X^(1 - s_0)$. The distinguished ones also have norm at most $2 z$. A configuration of scales can be discarded when it is disjoint from the envelope, but no product or partial-product cutoff is inserted into its coefficients.

#thm([Lemma 6.3.])[
  (Grouping prime factors).  #emph[The prime factors just obtained can be grouped into scales $A \, B$, with $A B asymp X$ and $B lt.double sqrt(X)$, as follows. On ordinary blocks either $B gt.eq X^(1 \/ 3 + delta_1)$ for some fixed $delta_1 > 0$, or there are exactly three prime factors with exponents close to $1 \/ 3$, and $B$ is the largest of their three scales. On upper blocks one can always arrange $B gt.eq X^(1 \/ 3 - 3 kappa)$.]
] <lem:prime-grouping>

#proof[
  Normalize the logarithms of the prime scales by the logarithm of their product. In any limiting configuration they are positive, sum to $1$, and are bounded below in terms of $xi$. On ordinary blocks no part reaches $2 \/ 3$, since every part is at most $1 - .345 = .655$.
  We claim that a positive partition of $1$, with every part less than $2 \/ 3$, has a subset sum in $\( 1 \/ 3 \, 2 \/ 3 \)$ unless it is $\( 1 \/ 3 \, 1 \/ 3 \, 1 \/ 3 \)$. If there is no such subset, every individual part is at most $1 \/ 3$. If a part $a < 1 \/ 3$ exists, start with it and add parts until the sum first exceeds $1 \/ 3$. The resulting sum is at most $2 \/ 3$. Equality would require both the preceding sum and the last added part to be $1 \/ 3$; but then $a$ together with that last part is a subset sum in $\( 1 \/ 3 \, 2 \/ 3 \)$. Thus equality is also impossible. The only remaining partition has all parts equal to $1 \/ 3$.
  There are finitely many possible factor counts. On the compact sets of their allowed exponent vectors, outside a fixed small neighborhood of the exceptional three-part vector, an interior subset has a uniform distance from both endpoints. Group that subset and its complement and call the shorter group $B$. The fixed support ratios can be absorbed by reducing the uniform gap, giving the claimed $delta_1$. In the exceptional neighborhood, take the largest prime scale for $B$; make the neighborhood small enough that $B < X^.40$ and $B lt.double sqrt(X)$.
  For upper blocks, a part exceeding $2 \/ 3$ can only come from $h$, and its complement has limiting exponent at least $s_0$. If no part exceeds $2 \/ 3$, a subset sum in $\[ 1 \/ 3 \, 2 \/ 3 \]$ exists by the same successive-sum argument. Fixed support ratios and limiting errors are absorbed by the spare $kappa$ in the asserted lower bound. ◻
]

For three factors, their largest scale satisfies $B gt.eq c X^(1 \/ 3)$. If $H = B^2 \/ A asymp B^3 \/ X < L^(C_g)$, then $B lt.double X^(1 \/ 3) L^(C_g \/ 3)$. Since the product of all three scales is comparable to $X$ and each is at most $B$, each is also at least $X^(1 \/ 3)$ times a fixed negative power of $L$. Thus only $O \( \( 1 + log L \)^3 \)$ triples of dyads occur. Their roles in (6.3) and their orderings have bounded multiplicity. The prime ideal theorem, or its upper bound alone, gives (6.1). This proves the exceptional assertions of the proposition in this branch.

=== 6.2 Stopping without coupled coefficients <stopping-without-coupled-coefficients>

It remains to treat $R < X^(s_0)$. Exact Mobius expansion gives

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(F)_w \( h \) = sum_(m u = h) mu \( m \) product_(pi divides m) psi_w \( pi \) . $ <eq:rough-mobius-expansion>]

The $m$ primes have norm at most $2 w$, whereas $u$ is unrestricted. Partition their possible prime norms into $O \( L \)$ bins, in descending order, each with upper/lower ratio at most $1 + delta_0$. Here $delta_0 > 0$ is fixed sufficiently small in terms of $kappa$. On ordinary blocks include $L^(C_r)$ as a boundary. Endpoints can be assigned consistently to either adjacent bin; use the lower side at this particular boundary.

If a prime lies in a bin of lower endpoint $ell$, replace its norm by $ell$ when forming a #emph[surrogate product], denoted $S$. There are $O \( L \)$ factors in any nonzero term on the envelope. Consequently $delta_0$ can be chosen so that

#[#set math.equation(numbering: n => "(6.5)")
 $ S \( m' \) lt.eq N \( m' \) lt.eq X^(kappa \/ 4) S \( m' \) $ <eq:surrogate-norm>]

for every selected subproduct $m'$. Start the running surrogate at the exact value $N \( r \)$.

On ordinary blocks process first the bins above $L^(C_r)$ and stop on first reaching $X^.36$. If these bins are exhausted without a stop, process the remaining bins, now stopping on first reaching $X^.38$. On upper blocks process all bins with the single stopping threshold $X^(1 \/ 3 - kappa)$. Since $N \( r \) asymp R < X^(s_0)$, the initial value lies below every applicable first threshold for large $X$.

If there is no stop, then $N \( r \) S \( m \) < Z$, where the final threshold $Z$ is $X^.38$ on ordinary blocks and $X^(1 \/ 3 - kappa)$ on upper blocks. All predicates involve $r \, m$ alone. Grouping by dyads of $N \( r m \)$ therefore gives Type I coefficients, with $u$ unrestricted. By (6.5), $N \( r m \) lt.eq X^(kappa \/ 4) N \( r \) S \( m \) < X^(kappa \/ 4) Z$. Thus the outer norm is less than $X^(.38 + kappa \/ 4) < X^.40$ on ordinary blocks, and less than $X^(1 \/ 3 - 3 kappa \/ 4) < X^(1 \/ 3 - kappa \/ 2)$ on upper blocks. For outer variable $v = r m$ on a dyad of length $R'$ the inner weight is $V \( N \( v \) U x \/ X \)$, where $U = X \/ R'$. Its derivatives are bounded uniformly in $v$, as required in Propositions 8 and 9.

For stopped terms write $m = m_(+) m_(-)$ and set

$ b = r m_(+) \, #h(2em) a = m_(-) u . $

The crossing prime has norm at most $2 X^xi$. Thus ordinary stopped terms have

$ X^.36 lt.eq N \( b \) lt.double X^(.38 + xi + kappa \/ 4) < X^.40 \, $

and upper stopped terms have

$ X^(1 \/ 3 - kappa) lt.eq N \( b \) lt.double X^(1 \/ 3 - kappa + xi + kappa \/ 4) < X^.40 . $

Sharp norm dyads may now be inserted separately on $a \, b$; prime-polynomial structure is not required in this range.

#thm([Lemma 6.4.])[
  (Exact separation at the stopping bin).  #emph[The stopped terms are exact sums with independent coefficients on $a$ and $b$. The number of additional outer indices is a fixed power of $L$, and the coefficients have fixed divisor bounds independent of $C_r$.]
] <lem:stopping-separation>

#proof[
  Fix the last bin, its lower endpoint $ell$, and the numbers $k_(+) gt.eq 1$ and $k_(-) gt.eq 0$ of selected and remaining factors in this bin. All factors in earlier bins belong to $m_(+)$ and all factors in later bins to $m_(-)$. If $Z$ is the applicable threshold, the crossing predicate is
  #[#set math.equation(numbering: n => "(6.6)")
   $ N \( r \) S \( m_(+) \) \/ ell < Z lt.eq N \( r \) S \( m_(+) \) . $ <eq:crossing-predicate>]
  For an ordinary stop below the roughness boundary, additionally require $N \( r \) S \( m_(+)^(>) \) < X^.36$, where $m_(+)^(>)$ contains the factors above that boundary. Every factor in those earlier bins is already on the selected side. Hence both predicates depend only on the $b$-side variables.
  The surrogate uses the same $ell$ for every prime in the final bin. For a fixed original squarefree $m$, exactly $binom(k_(+) + k_(-), k_(+))$ selections have the stated counts, and either all or none satisfy the crossing test. Give each selection the scalar
  #[#set math.equation(numbering: n => "(6.7)")
   $ binom(k_(+) + k_(-), k_(+))^(- 1) . $ <eq:stopping-scalar>]
  Their sum restores the original coefficient exactly. The Mobius factor and all prime weights split multiplicatively between $m_(+)$ and $m_(-)$. Once the last bin and its two counts have been fixed, the $b$ coefficient sums only over $r \, m_(+)$, and the $a$ coefficient only over $m_(-) \, u$.
  More explicitly, let $v \( r \)$ denote the weighted distinguished tuple sum, including its factor $1 \/ i !$, and put $q \( d \) = mu \( d \) product_(pi divides d) psi_w \( pi \)$. If $j$ is the last bin and $cal(C)_(j \, k) \( r \, d \)$ is the crossing condition with exactly $k$ factors of $d$ in bin $j$ and no factors in later bins, define
  $ beta_(j \, k) \( b \) = sum_(r d = b) v \( r \) q \( d \) bold(1)_(cal(C)_(j \, k) \( r \, d \)) \, #h(2em) alpha_(j \, l) \( a \) = sum_(e u = a) q \( e \) bold(1)_(e upright(" has factors only in bins ") j \, j + 1 \, dots.h\
e upright(" has exactly ") l upright(" factors in bin ") j) . $
  Then the stopped sum against any squarefree-supported kernel $K$ is exactly
  $ sum_(j \, k gt.eq 1 \, l gt.eq 0) binom(k + l, k)^(- 1) sum_(a \, b) alpha_(j \, l) \( a \) beta_(j \, k) \( b \) K \( a b \) . $
  Here $K$ includes the product envelope, and the notation $cal(C)_(j \, k)$ includes the failed first-stage test when needed.
  One may enlarge these independent sums by allowing overlaps among $r \, m_(+) \, m_(-) \, u$. Each added tuple has nonsquarefree total product and is individually annihilated by both kernels, before coefficient collection. After collection, $a \, b$ can be restricted separately squarefree; a remaining cross-side common prime is killed by $G \( a b \)$ and by $mu^2 \( a b \)$. Thus independence does not require an unaccounted coprimality restriction.
  The bin groups are unordered divisors. Only the already bounded distinguished tuple is ordered. Their multiplicities are therefore bounded by fixed powers of $tau \( a \) \, tau \( b \)$, and the scalar (6.7) is at most $1$. There are $O \( L \)$ choices for the final bin and $O \( L \)$ for each of its two counts. The complete bin occupancy vector is not an outer index: all other bin conditions remain inside the respective coefficient. Adding the boundary $L^(C_r)$ adds at most one bin and changes none of these powers. ◻
]

=== 6.3 Sparse late stops <sparse-late-stops>

For an ordinary stop using a prime of norm at most $L^(C_r)$, the high-bin running surrogate is less than $X^.36$, while the final surrogate is at least $X^.38$. Thus $b$ has a divisor $d$ with

$ N \( d \) gt.eq X^.02 \, #h(2em) N \( pi \) lt.eq L^(C_r) quad \( pi divides d \) . $

For fixed $C_r$, choose a fixed $sigma > 0$ with $C_r sigma < 1$. Rankin’s inequality gives

#[#set math.equation(numbering: n => "(6.8)")
 $ sum_(N \( d \) gt.eq X^.02\
N \( pi \) lt.eq L^(C_r) med \( pi divides d \)) frac(1, N \( d \)) & lt.eq X^(- .02 sigma) product_(N \( pi \) lt.eq L^(C_r)) \( 1 - N \( pi \)^(- 1 + sigma) \)^(- 1)\
 & lt.eq X^(- .02 sigma + o \( 1 \)) . $ <eq:late-stop-rankin>]

Indeed the logarithm of the product is $O \( L^(C_r sigma) \) = o \( L \)$, using the prime ideal counting upper bound. The number of multiples of $d$ on a dyad of length $B$ is $O \( B \/ N \( d \) \)$ when $N \( d \) lt.double B$; it follows that the allowed $b$ have cardinality $O \( B X^(- delta) \)$ for some $delta > 0$. Fixed divisor bounds preserve a smaller positive power saving in $sum_b \| beta_b \|^2$.

Here $X^.35 lt.double B < X^.40$ and $A asymp X \/ B$, so $A + B + \( A B \)^(2 \/ 3) lt.double X^(2 \/ 3)$. Cauchy’s inequality and the cubic large sieve yield

$ lr(|sum_(a \, b) alpha_a beta_b G \( a b \) N \( a b \)^(i t) V \( N \( a b \) \/ X \)|) lt.double X^(5 \/ 6 - eta) $

for a fixed $eta > 0$. The envelope separates by smooth Mellin inversion. The model has the same saving by direct sparse counting, since $N \( a b \)^(- 1 \/ 6) asymp X^(- 1 \/ 6)$. Norm twists have modulus $1$. This proves part (5) of Proposition 15, even after summing the polynomially many pieces.

=== 6.4 Coefficient moments and the Siegel–Walfisz condition <coefficient-moments-and-the-siegelwalfisz-condition>

All coefficients constructed above satisfy fixed divisor bounds. For completeness, these give the requisite moment estimates also after collecting equal norms. The number of ideals of norm $m$ is at most the ordinary divisor function $d \( m \)$, and the ideal divisor function of any such ideal is at most $d \( m \)^2$. Each fixed power of $d \( m \)$ is bounded by a higher divisor function, whose sum up to $Y$ is $O \( Y \( log \( 2 Y \) \)^C \)$. Thus every fixed coefficient moment on a dyad has the claimed bound. This reasoning also bounds the total absolute multiplicity of complementary factorizations below.

The nonsparse stopped ordinary coefficients are rough: distinguished primes have norm at least $w$, and selected bin primes exceed $L^(C_r)$. Pure prime-tuple coefficients are rough as well, since all factors exceed $w$.

#thm([Lemma 6.5.])[
  (The sequence condition).  #emph[Every nonsparse ordinary $b$ coefficient satisfies (SW): against any nonprincipal cubic Hecke character of the indicated trivial infinite parameter and primitive conductor of fixed polylogarithmic norm, its sum is $O_D \( B L^(- D) \)$ for every fixed $D$. This remains true with the permitted polynomial-norm coprimality exclusions and fixed-polylogarithmic norm twists.]
] <lem:decomposition-sw>

#proof[
  First discard terms all of whose prime factors have norm at most $y = exp \( sqrt(L) \)$. Apply Rankin’s inequality with $sigma = 1 \/ sqrt(L)$. Fixed divisor multiplicities can be included in the Euler product; its logarithm is $O \( log L \)$, since
  $ sum_(N \( pi \) lt.eq y) N \( pi \)^(- 1 + 1 \/ sqrt(L)) = O \( log L \) . $
  As $B$ is a fixed positive power of $X$, the resulting total absolute weight is at most $B exp \( - c sqrt(L) \) L^C$. This gives every desired logarithmic saving.
  In the remaining terms select a largest prime, breaking ties by a fixed order. Fix its role, its norm dyad $P$, and all other factors. There are boundedly many distinguished roles and one unordered selected-bin role; no permutation of a bin product is introduced. We have $P gt.double exp \( sqrt(L) \)$.
  Refine its range by the bins. If the variable prime lies in $m_(+)$, all surrogate data are constant within its bin. If it lies in $r$, then $N \( r \)$ is a fixed multiple of its norm. Accordingly, (6.6), the possible failed first-stage test, the final $b$ dyad, and the largest-prime condition each give an interval restriction in its norm. Their intersection has only polynomially many interval pieces as the bin varies. After the other factors are fixed, the Mobius sign is constant, and the remaining prime weights are smooth with bounded scaled derivatives.
  The prime ideal Siegel–Walfisz estimate from the background inputs applies on this prime range. A conductor bound $L^C$ is a bound $\( log P \)^(2 C + O \( 1 \))$, and arbitrary powers of $log P$ give arbitrary powers of $L$ in the saving. Partial summation absorbs the smooth weights and any fixed-polylogarithmic norm twist. It applies to arbitrary subintervals by subtracting two initial-interval estimates.
  Tie decisions and distinctness cause no loss: in this quadratic field there are at most two prime ideals of any prime norm, and at most one of an inert prime-square norm. Once the other factors are fixed, tie rules affect only endpoint norms. Coprimality to a number of polynomial norm removes $O \( L \)$ additional primes. These deletions are negligible relative to $P L^(- D)$, since $P gt.double exp \( sqrt(L) \)$.
  For a fixed dyad $P$, the total absolute weight of complementary factorizations is at most $\( B \/ P \) L^(O \( 1 \))$, by the fixed divisor multiplicity bounds. Summing the prime cancellation over these choices, over roles, and over the polynomially many dyads and interval pieces proves the assertion. The argument for pure prime-tuple coefficients is the same, without the surrogate restrictions. ◻
]

#proof[
  #emph[Completion of Proposition 15.] The identities (6.2), (6.3), and (6.4) are exact on squarefree numbers. Lemma 17 treats the large-$R$ branch, and Lemma 18 treats the small-$R$ branch. The actual norm ranges proved above give parts (1) and (2). Lemma 19 gives part (3), and the three-prime counting argument gives part (4). Ordinary stopped terms have $H gt.double X^.08$, so no additional small-$H$ configuration is omitted. The sparse estimate gives part (5).
  The total number of pieces is a fixed power of $L$: the distinguished tuple has bounded length, the bin and endpoint-count indices have polynomially many choices, and the side dyads add only polynomial factors. No full occupancy vector of the bins is enumerated. The exponents in this complexity and in the divisor bounds are independent of $C_r \, C_g$; those parameters affect only fixed constants in the exceptional triple count, not its polynomial dependence on $log L$.
  The parameter choices are therefore noncircular. First fix the absolute power-width constant for $B lt.eq X^.40$ in Proposition 13; then fix $kappa \, rho \, xi$ and the resulting bounded tuple complexity. Choose the logarithmic output and localization savings, and the large-height threshold power, after that complexity. Finally choose $C_g \, C_r$ and the needed SW saving powers. The large-$B$ prime-polynomial estimates may depend on the now fixed tuple complexity and $xi$; they do not determine the earlier absolute power-width constant. ◻
]

== 7 Bilinear sums and the sharp prime cutoff <sec:perron>

We now assemble the estimates, keeping track of the losses needed to pass from smooth weights to the interval indicator. Throughout this section, $L = log X$, $A B asymp X$,

$ H = B^2 / A \, #h(2em) cal(Q) = A B H^(1 \/ 3) \, #h(2em) A cal(Q) = \( A B \)^(5 \/ 3) asymp X^(5 \/ 3) . $

All support ratios are fixed. Coefficients are divisor-bounded, and their fixed moment bounds may contribute fixed powers of $L$. Write

$ cal(D) \( n \) = G \( n \) - c_(*) frac(mu^2 \( n \), N \( n \)^(1 \/ 6)) . $

Both terms vanish unless $n$ is squarefree. Thus separate squarefree restrictions may always be imposed on the two variables in a sum of $cal(D) \( a b \)$; common factors are still permitted, since the complete summand then vanishes. Let $V$ denote a fixed smooth compactly supported function on $\( 0 \, oo \)$.

The assembly uses the three ranges in Table 1. The low range compares the Gauss sum with its model; the high ranges treat the Gauss sum alone, after removing the undecomposed prime model. The small constants and logarithmic powers are chosen below in an explicit order.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Height range
], table.cell(rowspan: 1, colspan: 1)[Type I outer length
], table.cell(rowspan: 1, colspan: 1)[Type II shorter length
]),
  table.cell(rowspan: 1, colspan: 1)[$\| t \| lt.eq L^(C_t)$
], table.cell(rowspan: 1, colspan: 1)[$R lt.eq X^.40$
], table.cell(rowspan: 1, colspan: 1)[$c X^(1 \/ 3) lt.eq B lt.double X^(1 \/ 2)$
],
  table.cell(rowspan: 1, colspan: 1)[$L^(C_t) lt.eq T lt.double X^.01$
], table.cell(rowspan: 1, colspan: 1)[$R lt.eq X^.40$
], table.cell(rowspan: 1, colspan: 1)[$c X^(1 \/ 3) lt.eq B lt.double X^(1 \/ 2)$
],
  table.cell(rowspan: 1, colspan: 1)[$X^.01 lt.double T lt.double X^(1 \/ 6 + rho)$
], table.cell(rowspan: 1, colspan: 1)[$R lt.eq X^(1 \/ 3 - kappa \/ 2)$
], table.cell(rowspan: 1, colspan: 1)[$X^(1 \/ 3 - 3 kappa) lt.eq B lt.double X^(1 \/ 2)$
],
)
]],
  caption: [Table 1: Ranges supplied by Proposition 15, with $A B asymp X$ and fixed $c > 0$. At high heights and $B lt.eq X^.40$, the cell parameter is $J = L^(D')$ in the middle row and $J = X^gamma$ in the last row. Larger $B$ uses averaged dispersion directly. ],
)

=== 7.1 Bilinear sums at low heights <bilinear-sums-at-low-heights>

#thm([Proposition 7.1.])[
  (Low-height bilinear comparison).  #emph[Suppose $X^.32 lt.eq B lt.double sqrt(X)$, $H gt.double 1$, and the coefficient $beta_b$ satisfies the structural hypotheses of Proposition 13. At low heights assume, in addition, its roughness and Siegel–Walfisz hypotheses. For every fixed $D \, U > 0$, the logarithmic parameters in that proposition can be chosen so that, uniformly for $\| t \| lt.eq L^U$ and $H gt.eq L^(C_g)$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ sum_(a \, b) alpha_a beta_b cal(D) \( a b \) N \( a b \)^(i t) V #h(-0.16667em) (frac(N \( a b \), X)) lt.double X^(5 \/ 6) L^(- D) . $ <eq:bilinear-low>]

 There is also the following transition estimate. Suppose $b$ is one prime, $a$ is a product of two primes, each of the three primes has its own specified smooth dyad of length $X^(1 \/ 3) L^(O \( 1 \))$, and their weights are bounded. If $1 lt.double H < L^(C_g)$, then the left side of (7.1) is 
#[#set math.equation(numbering: n => "(7.2)")
 $ O #h(-0.16667em) (X^(5 \/ 6) L^(- 3 \/ 2)) . $ <eq:bilinear-transition>]

 The constants are uniform for the families of dyads in Proposition 15.]
] <prop:bilinear-low>

#proof[
  First omit the product envelope. In the notation of Proposition 13, multiplicativity gives
  $ sum_(a \, b) alpha_a beta_b G \( a b \) N \( a b \)^(i t) = sum_a alpha_a G \( a \) N \( a \)^(i t) F_t \( a \) . $
  Apply Cauchy’s inequality in $a$ to the corrected estimate (5.3). Since $sum_a \| alpha_a \|^2 lt.double A L^(O \( 1 \))$, its contribution is
  $ lt.double \( A cal(Q) \)^(1 \/ 2) L^(- K \/ 2 + O \( 1 \)) lt.double X^(5 \/ 6) L^(- K \/ 2 + O \( 1 \)) . $
  The resulting main term is
  $ c_(*) sum_a alpha_a mu^2 \( a \) N \( a \)^(i t - 1 \/ 6) sum_b beta_b N \( b \)^(i t - 1 \/ 6) . $
  It remains to reinstate coprimality between $a$ and $b$. Any common prime has norm greater than $L^(C_r)$. The number of pairs sharing such a prime is
  $ lt.double A B sum_(N frak(p) > L^(C_r)) frac(1, N frak(p)^2) lt.double A B L^(- C_r) . $
  Here ideals of norm at most $Y$ have count $O \( Y \)$, so the last inequality follows even on summing over all ideals. By Cauchy’s inequality and the coefficient moment bounds, the weighted number of these pairs is $lt.double A B L^(- C_r \/ 2 + O \( 1 \))$. Multiplication by $N \( a b \)^(- 1 \/ 6)$ makes their model contribution $lt.double X^(5 \/ 6) L^(- C_r \/ 2 + O \( 1 \))$. Taking $K \, C_r$ large proves (7.1) without its envelope.
  For the transition, the specified prime dyads and their bounded weights give
  $ sum_a \| alpha_a \|^2 lt.double A / L^2 \, #h(2em) sum_b \| beta_b \|^2 lt.double B / L \, #h(2em) sum_b \| beta_b \| lt.double B / L . $
  The possible ordering multiplicity for the two primes in $a$ is bounded. Apply (5.4) and Cauchy’s inequality. The diagonal contributes
  $ (A / L^2 frac(A B, L))^(1 \/ 2) lt.double X^(5 \/ 6) H^(- 1 \/ 6) L^(- 3 \/ 2) \, $
  and the remaining displayed main bound contributes
  $ (A / L^2 cal(Q) / L^2)^(1 \/ 2) lt.double X^(5 \/ 6) L^(- 2) . $
  The $L^(- K)$ remainder is smaller by increasing $K$. Since $H gt.double 1$, this bounds the Gauss-sum term as asserted. The model term is bounded directly by $O \( X^(5 \/ 6) L^(- 3) \)$, using the independent counts on the three specified prime dyads.
  For completeness, the envelope introduces no logarithmic loss in these arguments. Mellin inversion separates $V \( N \( a b \) \/ X \)$ into common norm twists with a rapidly decreasing, integrable weight. Keep shifts $\| v \| lt.eq L^E$, for a sufficiently large fixed $E$, in the low-height estimates, choosing their permitted height exponent after $E$. From $L^E$ up to $X^c$, with a small fixed $c > 0$, the coarse part of Proposition 13 and Cauchy’s inequality bound the uncorrected sum by $X^(5 \/ 6) L^(O \( 1 \))$; the model has the same bound trivially. Rapid decay of the Mellin weight makes this tail as small a log power as needed. Beyond $X^c$, its rapid decay and the trivial bound $X L^(O \( 1 \))$ give a power saving. This proves both claims with the envelope. ◻
]

=== 7.2 Large heights and localization near the product boundary <large-heights-and-localization-near-the-product-boundary>

The next estimate treats the Gauss-sum term alone; the prime model will be removed before decomposition. When $B > X^.40$, the averaged dispersion diagonal already saves a fixed power. For smaller $B$, divide both log-norm ranges into cells. Near the product boundary, each cell has only boundedly many partners, so the localized diagonal gains the square root of the cell width. Away from the boundary, integration by parts in height supplies the saving.

Choose the absolute exponent in (5.6) so small that $0 < gamma < 10^(- 3)$, and then choose

#[#set math.equation(numbering: n => "(7.3)")
 $ 0 < kappa < gamma / 100 \, #h(2em) 0 < rho < kappa / 100 . $ <eq:power-parameters>]

The decomposition uses a fixed $0 < xi < kappa \/ 10$. The availability of an absolute $gamma$ in the range $B lt.eq X^.40$ is important: these choices precede, and do not depend on, the number of prime factors permitted in the decomposition.

#thm([Proposition 7.2.])[
  (Integrated bilinear estimate).  #emph[Let $X_0 asymp X$, and let $h_T$ be smooth, supported where $T lt.eq \| t \| lt.eq 2 T$, with $h_T^(\( j \)) \( t \) lt.double_j T^(- j)$. Suppose 
$ L^(C_t) lt.eq T lt.double X^(1 \/ 6 + rho) \, #h(2em) B lt.double sqrt(X) \, $

 and suppose that either 
#[#set math.equation(numbering: n => "(a)")
 $ T lt.double X^.01 \, & #h(2em) c X^(1 \/ 3) lt.eq B \, quad c > 0 upright(" fixed") \,\
T gt.double X^.01 \, & #h(2em) X^(1 \/ 3 - 3 kappa) lt.eq B . $]

 Assume the structural hypotheses of Proposition 13, but impose neither roughness nor Siegel–Walfisz conditions. For every fixed $D > 0$, by taking $C_t$ sufficiently large, 
#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(a \, b) alpha_a beta_b G \( a b \) V #h(-0.16667em) (frac(N \( a b \), X)) integral h_T \( t \) (frac(N \( a b \), X_0))^(i t) frac(d t, T) lt.double X^(5 \/ 6) L^(- D) . $ <eq:bilinear-integrated>]

]
] <prop:bilinear-height>

#proof[
  When $B > X^.40$, apply Cauchy’s inequality in $a \, t$, followed by (5.5). The diagonal costs
  $ lt.double A sqrt(B) thin L^(O \( 1 \)) asymp X / sqrt(B) L^(O \( 1 \)) lt.double X^.80 L^(O \( 1 \)) \, $
  whereas the error costs $X^(5 \/ 6) L^(- K \/ 2 + O \( 1 \))$. The product envelope separates by Mellin inversion. Its shifts may be truncated at a small fixed power of $X$, since the tails are negligible trivially. The retained shifts satisfy $2 T + \| u_0 \| lt.eq X^.17$, because $rho < .001$. This proves the assertion in this range.
  Assume now $B lt.eq X^.40$. Partition the two fixed log-norm intervals into disjoint cells of width $1 \/ J$, where
  $ J = L^(D') quad upright("in case (a)") \, #h(2em) J = X^gamma quad upright("in case (b)") . $
  There are $O \( J \)$ cells on each side. Put
  $ a_i = parallel alpha thin 1_(upright("cell ") i) parallel_2 \, #h(2em) b_j = parallel beta thin 1_(upright("cell ") j) parallel_2 . $
  A smooth majorant of an $a$-cell has derivatives of order $s$ bounded by $O_s \( J^s \)$. Its lattice-point count is
  $ O \( A \/ J + sqrt(A) + 1 \) = O \( A \/ J \) \, $
  because $A gt.double X^.60$ and $gamma < .30$. Restricting $beta$ sharply to a cell preserves its divisor bounds and squarefree support; there is no additional prime-polynomial hypothesis in this range of $B$.
  For a fixed cell pair, Cauchy’s inequality and the averaged dispersion estimate give the bound
  #[#set math.equation(numbering: n => "(7.5)")
   $ C a_i (A / J b_j^2 + cal(Q) epsilon_J)^(1 \/ 2) \, #h(2em) epsilon_J = cases(delim: "{", L^(- K) \, & upright("in case (a)") \,, X^(- 10 gamma) \, & upright("in case (b)") .) $ <eq:cell-pair>]
  It holds uniformly after any fixed common Mellin shift: for $B lt.eq X^.40$, Proposition 13 places no restriction on $u_0$. In particular it applies with the product envelope, whose Mellin transform has bounded $L^1$ norm.
  Call a pair near if its rectangle meets $lr(|log \( N \( a b \) \/ X_0 \)|) lt.eq c_0 \/ J$, with a fixed $c_0 > 0$. Every cell has only $O \( 1 \)$ near neighbors. Hence the diagonal parts of (7.5), summed over near pairs, are
  #[#set math.equation(numbering: n => "(7.6)")
   $ lt.double sqrt(A / J) thin parallel alpha parallel_2 parallel beta parallel_2 lt.double X^(5 \/ 6) L^(O \( 1 \)) H^(- 1 \/ 6) J^(- 1 \/ 2) . $ <eq:near-cell-diagonal>]
  This is the required log saving in case (a), by choosing $D'$ large. In case (b), $H gt.double X^(- 9 kappa)$, so its additional power of $X$ is at most $3 kappa \/ 2 - gamma \/ 2 < 0$.
  The errors in (7.5) are absolute errors; no reduction with the mass of a $b$-cell is assumed. Even summing them over all $O \( J^2 \)$ pairs gives at most
  #[#set math.equation(numbering: n => "(7.7)")
   $ sqrt(cal(Q) epsilon_J) thin J sum_i a_i & lt.double sqrt(cal(Q) epsilon_J) thin J^(3 \/ 2) parallel alpha parallel_2\
 & lt.double X^(5 \/ 6) L^(O \( 1 \)) J^(3 \/ 2) epsilon_J^(1 \/ 2) . $ <eq:all-cell-error>]
  In case (a), take $K$ large after $D'$. In case (b), the additional factor is $X^(- 7 gamma \/ 2)$.
  It remains to handle far pairs. Set $ell = log \( N \( a b \) \/ X_0 \)$. On a far pair $\| ell \| > c_0 \/ J$. Integrating by parts $q$ times in the height integral differentiates only $h_T$ and produces a factor $\( J \/ T \)^q$, a new height function proportional to $T^q h_T^(\( q \))$, and the product weight $\( J ell \)^(- q)$. The new height function still has the same normalized derivative bounds.
  There is no loss by a power of $J$ in the Mellin $L^1$ norm. Indeed, for a fixed integer $q gt.eq 2$, choose a smooth function $F_q$ on $bb(R)$ which equals $s^(- q)$ for $\| s \| gt.eq c_0$ and is zero near zero. Both $F_q$ and $F''_q$ are integrable. Consequently its Fourier transform is integrable, and
  $ parallel accent(F_q \( J thin dot.op \), ̂) parallel_1 = parallel hat(F)_q parallel_1 < oo . $
  The smooth extension $F_q \( J ell \)$, multiplied by the fixed envelope, therefore has Mellin $L^1$ cost $O_q \( 1 \)$, uniformly in $J$. All these shifts are independent of $t$. Even a shift larger than $T$ is allowed here: it simply multiplies the fixed Dirichlet-polynomial coefficients by phases, as reflected in the unrestricted $u_0$ assertion of Proposition 13.
  Apply (7.5) again with this separated weight. Before the integration-by-parts factor, the sum of all diagonal parts is
  #[#set math.equation(numbering: n => "(7.8)")
   $ lt.double sqrt(A / J) (sum_i a_i) (sum_j b_j) lt.double X^(5 \/ 6) L^(O \( 1 \)) H^(- 1 \/ 6) J^(1 \/ 2) . $ <eq:far-cell-diagonal>]
  In case (a), $\( J \/ T \)^q lt.eq L^(- q \( C_t - D' \))$, which pays for this loss by taking $C_t$ sufficiently large. In case (b), it is at most a constant times $X^(- q \( .01 - gamma \))$, which pays for $H^(- 1 \/ 6) J^(1 \/ 2) lt.double X^(3 kappa \/ 2 + gamma \/ 2)$. The errors are already controlled by (7.7). This proves (7.4). ◻
]

=== 7.3 Choice of the logarithmic parameters <choice-of-the-logarithmic-parameters>

We record the order of choices to make the uniformity in the final assembly explicit. First choose $gamma \, kappa \, rho$ as in (7.3), then $xi$ and the fixed bin ratio of Proposition 15. Its number of terms is now at most $L^(C_(upright("dec")))$, and fix $M$ larger than all the coefficient moment exponents needed below. These exponents are independent of $C_r$.

Choose

$ D > C_(upright("dec")) + 10 \, #h(2em) D' > 2 \( D + M + 2 \) \, #h(2em) K > 3 D' + 2 \( D + M + 2 \) . $

The log-width near-cell and error bounds are then respectively

$ X^(5 \/ 6) L^(M - D' \/ 2) #h(2em) upright("and") #h(2em) X^(5 \/ 6) L^(M + 3 D' \/ 2 - K \/ 2) . $

Choose $C_t$ large enough for the averaged dispersion estimate at derivative scale $L^(D')$ and output power $K$, for the far-cell estimate with a fixed $q gt.eq 2$, and for the prime-model estimate below.

Only now choose the parameters for low heights. Take the required corrected-variance output power larger than $2 \( D + M + 2 \)$, choose the sieve depth and the logarithmic transform cutoffs in the proof of Proposition 13, and fix a height exponent covering $L^(C_t)$ together with all retained transform shifts. Then choose $C_r \, C_g$ sufficiently large for the rough-support, diagonal, and cube-approximation errors, and request the finitely many Siegel–Walfisz saving powers needed for these choices. That property is available for every fixed logarithmic conductor and height range. Inserting $L^(C_r)$ as a bin endpoint does not change the exponent $C_(upright("dec"))$, and enlarging $C_g$ only changes fixed constants in the number of transition configurations.

Finally choose all arbitrary small-power losses below the positive power gaps obtained with these fixed choices, including the sparse support gap, which may depend on $C_r$. There is no circular dependence: the absolute power-width estimate is used only for $B lt.eq X^.40$, where it is independent of prime-polynomial complexity.

=== 7.4 A smooth truncation of the interval indicator <a-smooth-truncation-of-the-interval-indicator>

#thm([Lemma 7.3.])[
  (Fourier truncation).  #emph[Let $1 lt.eq T lt.eq X$, and let $V$ be a fixed smooth function supported in $\( 1 \/ 2 \, 4 \)$, equal to one on a neighborhood of $\[ 1 \, 2 \]$. There is a smooth function $I_T$ such that 
#[#set math.equation(numbering: n => "(7.9)")
 $ I_T \( s \) = frac(1, 2 pi) integral_(bb(R)) eta \( t \/ T \) frac(1 - 2^(- i t), i t) e^(i t s) thin d t \, $ <eq:interval-fourier>]

 where $eta$ is a fixed smooth cutoff supported in $\[ - 1 \, 1 \]$ and equal to one near zero. For every $m > 0$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ lr(|1_(\[ 1 \, 2 \]) \( v \) - V \( v \) I_T \( log v \)|) lt.double_m sum_(b in { 0 \, log 2 }) \( 1 + T \| log v - b \| \)^(- m) $ <eq:interval-boundary-error>]

 on the support of $V$, and the difference is zero outside it. If coefficients collected at each integer norm satisfy $\| c_n \| lt.double_epsilon.alt X^epsilon.alt$ for $X \/ 2 < n < 4 X$, then 
#[#set math.equation(numbering: n => "(7.11)")
 $ sum_n \| c_n \| lr(|1_(\[ X \, 2 X \]) \( n \) - V \( n \/ X \) I_T \( log \( n \/ X \) \)|) lt.double_epsilon.alt X^epsilon.alt \( 1 + X \/ T \) . $ <eq:perron-error>]

]
] <lem:perron-truncation>

#proof[
  With the Fourier convention in (7.9), the Fourier transform of $1_(\[ 0 \, log 2 \])$ is $\( 1 - 2^(- i t) \) \/ \( i t \)$, interpreted continuously at zero. The inverse transform of $eta \( t \/ T \)$ is a Schwartz approximate identity $T k \( T s \)$ of integral one. Convolving the interval indicator with it proves (7.9). Away from either endpoint, the error is bounded by the integral of the rapidly decreasing kernel beyond that endpoint; this proves (7.10). In the portion where $V eq.not 1$, the distance to $\[ 1 \, 2 \]$ is bounded below, so the same estimate holds there. On $1 \/ 2 lt.eq v lt.eq 4$, distance in $log v$ is comparable to distance in $v$. Summing $\( 1 + T \| n - X_0 \| \/ X \)^(- 2)$ over integers, for $X_0 = X \, 2 X$, costs $O \( 1 + X \/ T \)$, uniformly in the location of $X_0$. This gives (7.11), including exact endpoint equality. ◻
]

=== 7.5 Completion of the prime asymptotic <completion-of-the-prime-asymptotic>

#proof[
  Use Lemma 22 with
  $ T_max = X^(1 \/ 6 + rho) . $
  At each norm the number of primary prime generators is divisor-bounded, and $\| G \( pi \) \| = 1$. Thus the lemma applies separately to the Gauss-sum and model prime coefficients. Taking $epsilon.alt < rho$ in (7.11), their total truncation error is
  $ lt.double X^epsilon.alt \( 1 + X \/ T_max \) = o #h(-0.16667em) (X^(5 \/ 6) / L) . $
  It remains to estimate their difference with the smoothed indicator.
  Split the integral in (7.9) into bounded frequencies and smooth dyadic height blocks. Outside bounded frequencies its two endpoint terms have the form
  $ integral h_T \( t \) (frac(N \( n \), X_0))^(i t) frac(d t, T) \, #h(2em) X_0 = X upright(" or ") 2 X \, $
  where $h_T^(\( j \)) lt.double_j T^(- j)$. Indeed the factor $1 \/ \( i t \)$ is $1 \/ T$ times a smooth bounded function on a height block; the cutoff at $T_max$ preserves these derivative bounds. At bounded frequencies the original difference of endpoint terms is bounded, including at zero.
  For $\| t \| lt.eq L^(C_t)$, use the ordinary-block decomposition of Proposition 15 on the difference $cal(D) \( n \)$. The Type I terms are controlled by Proposition 8; a norm twist of logarithmic height only introduces logarithmic derivative bounds. The regular Type II terms are controlled by Proposition 20 with the arbitrary output power $D$ fixed above. The sparse terms have a fixed power saving.
  The remaining terms are exactly the three-prime transition described in Proposition 15. They have bounded weights, $1 lt.double H < L^(C_g)$, and only $O \( \( 1 + log L \)^C \)$ configurations for a fixed $C$. Proposition 20 bounds each by $X^(5 \/ 6) L^(- 3 \/ 2)$. There are only $O \( 1 + log L \)$ low-height blocks. Therefore their aggregate contribution is
  $ lt.double X^(5 \/ 6) L^(- 3 \/ 2) \( 1 + log L \)^(C + 1) = o #h(-0.16667em) (X^(5 \/ 6) / L) . $
  All other low-height terms are smaller after summing their $L^(C_(upright("dec")))$ pieces.
  At heights $T gt.eq L^(C_t)$, first discard the #emph[undecomposed] prime model. On the fixed envelope, write its norm polynomial as
  $ P_0 \( t \) = sum_(n asymp X) d_n n^(i t) \, #h(2em) sum_n \| d_n \|^2 lt.double X^(2 \/ 3) L^(O \( 1 \)) . $
  The last bound follows by collecting the model coefficients $c_(*) N \( pi \)^(- 1 \/ 6) V \( N \( pi \) \/ X \)$ at equal norms and using the divisor moment bound. The ordinary mean-value inequality and Cauchy’s inequality give
  $ integral_(T lt.eq \| t \| lt.eq 2 T) \| P_0 \( t \) \| frac(d t, T) & lt.double X^(1 \/ 3) L^(O \( 1 \)) \( 1 + X \/ T \)^(1 \/ 2)\
 & lt.double X^(5 \/ 6) L^(O \( 1 \)) T^(- 1 \/ 2) \, $
  since $T lt.double X^(1 \/ 6 + rho) < X$. Taking $C_t$ large makes this negligible even after all $O \( L \)$ height blocks. No decomposition of this model term, and no cancellation between its decomposed pieces, is required.
  Apply the decomposition to the Gauss-sum term alone at the remaining heights. Ordinary blocks have $T lt.double X^.01$; their no-stop Type I terms satisfy $R lt.eq X^.40$. By Proposition 9, the first term of their bound has exponent at most
  $ 1 / 2 + 3 / 4 \( .40 \) + 1 / 2 \( .01 \) = .805 < 5 / 6 . $
  For upper blocks $T gt.double X^.01$, use the upper-block decomposition. Its no-stop terms have $R lt.eq X^(1 \/ 3 - kappa \/ 2)$, and their first-term exponent is
  $ 1 / 2 + 3 / 4 (1 / 3 - kappa / 2) + 1 / 2 (1 / 6 + rho) = 5 / 6 - frac(3 kappa, 8) + rho / 2 < 5 / 6 . $
  The pole term in Proposition 9 is $X^(5 \/ 6) L^(O \( 1 \)) T^(- q)$ for every fixed $q$, and is therefore negligible above $L^(C_t)$. These bounds permit the uniformly smooth envelope at scale $X \/ N \( r \)$, and any twist of the outer coefficient has absolute value one.
  Every nonsparse Type II term is in case (a) or case (b) of Proposition 21. Its bound can have the arbitrary fixed output power $D$. The sparse ordinary-block terms retain their power saving uniformly in the norm twist. Summing the $O \( L \)$ height blocks and the at most $L^(C_(upright("dec")))$ pieces consequently costs less than the chosen logarithmic saving. Changing the decomposition between height blocks is legitimate because each is an exact identity on squarefree arguments.
  Combining the low and high heights with the truncation error proves
  #[#set math.equation(numbering: n => "(7.12)")
   $ sum_(X < N \( pi \) lt.eq 2 X) (G \( pi \) - c_(*) N \( pi \)^(- 1 \/ 6)) = o #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $ <eq:prime-dyadic-comparison>]
  Changing endpoint inclusion has only divisor-bounded cost. Dyadically sum (7.12). For example, on dyads above $X^(1 \/ 2)$, the little-oh coefficient is uniformly small, the logarithms are comparable to $log X$, and the $5 \/ 6$-powers form a geometric sum. The terms below $X^(1 \/ 2)$ are $O \( X^(1 \/ 2) \)$ trivially. We obtain
  $ sum_(N \( pi \) lt.eq X) G \( pi \) = c_(*) sum_(N \( pi \) lt.eq X) N \( pi \)^(- 1 \/ 6) + o #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $
  Finally the prime ideal theorem in the fixed field gives $\# { pi : N \( pi \) lt.eq y } tilde.op y \/ log y$; omission of the prime above $3$ is immaterial. Partial summation yields
  $ sum_(N \( pi \) lt.eq X) N \( pi \)^(- 1 \/ 6) tilde.op integral_2^X frac(u^(- 1 \/ 6), log u) thin d u tilde.op 6 / 5 frac(X^(5 \/ 6), log X) . $
  This proves the asserted primary-prime asymptotic with constant $6 / 5 c_(*)$. ◻
]

== 8 Fixed angular twists <sec:angular>

The first-moment comparison also holds after insertion of a fixed angular Fourier mode. The primary-generator convention matters here: it permits every integer mode, with no divisibility condition. Throughout this appendix, $ell in bb(Z)$ is fixed before $X$ tends to infinity. All implied constants and subsequent fixed parameter choices may depend on $ell$. For nonzero $z in bb(C)$, put

$ theta_ell \( z \) = \( z \/ \| z \| \)^ell \, #h(2em) G_ell \( n \) = theta_ell \( n \) G \( n \) \, #h(2em) cal(D)_ell \( n \) = theta_ell \( n \) #scale(x: 120%, y: 120%)[\(] G \( n \) - c_(*) mu^2 \( n \) N \( n \)^(- 1 \/ 6) #scale(x: 120%, y: 120%)[\)] . $

As before, ideal sums use the unique primary generators.

#thm([Theorem 8.1.])[
  (Comparison in each fixed angular mode).  #emph[For every fixed integer $ell$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_(N pi lt.eq X\
pi equiv 1 med \( mod med 3 \) med upright("prime")) theta_ell \( pi \) #scale(x: 120%, y: 120%)[\(] G \( pi \) - c_(*) N \( pi \)^(- 1 \/ 6) #scale(x: 120%, y: 120%)[\)] = o_ell #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $ <eq:angular-comparison>]

 In particular, for every fixed nonzero integer $ell$, 
#[#set math.equation(numbering: n => "(8.2)")
 $ sum_(N pi lt.eq X\
pi equiv 1 med \( mod med 3 \) med upright("prime")) theta_ell \( pi \) G \( pi \) = o_ell #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $ <eq:angular-cancellation>]

]
] <thm:angular>

The assertion is pointwise in the integer $ell$. It makes no claim uniform in a growing angular parameter. We prove the additional analytic interfaces and then verify their use in the prime decomposition and sharp-cutoff argument.

=== 8.1 Hecke characters with a fixed infinity type <hecke-characters-with-a-fixed-infinity-type>

For an ideal $frak(a)$ prime to $3$, define $Theta_ell \( frak(a) \) = theta_ell \( a \)$, where $a$ is its primary generator. Products of primary generators are primary, so $Theta_ell$ is multiplicative. If $alpha$ is any generator prime to $3$ and $u \( alpha \)$ is the unit making $u \( alpha \) alpha$ primary, then

$ Theta_ell \( \( alpha \) \) = u \( alpha \)^ell \( alpha \/ \| alpha \| \)^ell . $

The unit factor depends only on $alpha med mod med 3$. Thus $Theta_ell$ is a unitary Hecke character of angular order $ell$, with finite conductor dividing $\( 3 \)$. Its nonzero infinity type prevents it from being principal when $ell eq.not 0$. Multiplying by a finite-order cubic character changes no angular order. If $chi$ has finite conductor $frak(f)_chi$, the primitive character $Psi$ inducing $chi Theta_ell$ has conductor dividing $"lcm" \( frak(f)_chi \, \( 3 \) \)$; in particular, $D = N frak(f)_Psi lt.eq 9 N frak(f)_chi$.

#thm([Lemma 8.2.])[
  (Fixed-infinity Hecke inputs).  #emph[Put $k = \| ell \| \/ 2$. The complete primitive $L$-function has completion 
#[#set math.equation(numbering: n => "(8.3)")
 $ Lambda \( z \, Psi \) = (frac(sqrt(3 D), 2 pi))^z Gamma \( z + k \) L \( z \, Psi \) \, #h(2em) Lambda \( z \, Psi \) = epsilon.alt_Psi Lambda \( 1 - z \, overline(Psi) \) \, quad \| epsilon.alt_Psi \| = 1 . $ <eq:angular-hecke-fe>]

 If $ell eq.not 0$, or if $ell = 0$ and $chi$ is nonprincipal cubic, the completed function is entire of order one. In these cases, for every fixed $A \, M > 0$, 
#[#set math.equation(numbering: n => "(8.4)")
 $ sum_(N frak(p) lt.eq x) Psi \( frak(p) \) log N frak(p) lt.double_(ell \, A \, M) x \( log x \)^(- M) \, #h(2em) N frak(f)_chi lt.eq \( log x \)^A . $ <eq:angular-prime-sw>]

 Ramified primes have character value zero. Removing additional Euler factors is permitted with their explicit finite-prime error.]
] <lem:angular-hecke>

#proof[
  Rajan [14] Section 1, pp. 281–283 gives the unitary completion, contragredient functional equation and entire-order-one assertion. There is one complex place, field discriminant $3$, angular parameter $ell$ and no imaginary norm parameter. Its gamma factor and conductor factor give exactly (8.3). The dual angular order is $- ell$. A nonzero angular component cannot be removed by multiplying by a finite character or an imaginary norm power: both are trivial on the connected archimedean unit circle, whereas its $ell$th angular character is nontrivial for $ell eq.not 0$. Hence $Psi$ is not principal or norm-equivalent to a real quadratic character when $ell eq.not 0$. For $ell = 0$, a nonprincipal cubic character is nonreal. There is therefore no exceptional real zero in either case.
  For clarity we give the uniformity deduction for (8.4). Apply the published [9] Theorem 1.2, which explicitly restates the prime-number estimate of [8] Theorem 5.13. Viewed over rational primes, $L \( z \, Psi \)$ has degree $m = 2$ and local parameters of modulus at most one. In particular its logarithmic-derivative coefficients satisfy $\| a \( p^j \) \| lt.eq 2$, and the required second-moment hypothesis follows from $sum_(n lt.eq x) \| a \( n \) \|^2 Lambda \( n \)^2 lt.eq 4 x \( log x \)^2$. Gamma duplication gives conductor $q = 3 D$, parameters $mu_1 = k$, $mu_2 = k + 1$, and analytic conductor $frak(C) = 3 D \( k + 3 \) \( k + 4 \)$. Absolute convergence is supplied by the Euler product, and the functional-equation hypothesis by (8.3). The zero-free-region hypothesis is Rajan’s Proposition 1; the same conductor and infinity-parameter dependence is recorded in [1] Lemma 2.1. The absence of an exceptional character just proved permits the bound
  $ x #scale(x: 120%, y: 120%)[\(] log \( x frak(C) \) #scale(x: 120%, y: 120%)[\)]^4 exp #h(-0.16667em) (- frac(c log x, log frak(C) + sqrt(log x))) + O \( sqrt(x) \) . $
  This is $O_(ell \, A \, M) \( x log^(- M) x \)$ for every $M$ in the stated conductor range. Removing higher prime-ideal powers from the logarithmic derivative costs $O \( sqrt(x) log^2 x \)$ and proves (8.4). ◻
]

Partial summation removes the logarithmic prime weight and permits a norm twist $\( N frak(p) \)^(i t)$ of logarithmic height, at cost $O \( 1 + \| t \| \)$ absorbed in the freely chosen saving. The same argument permits smooth norm weights and interval restrictions. We always apply (8.3) to the complete primitive ideal sum. In particular, if the primitive character is unramified above $3$, its omitted Euler factor is first restored; the value at that prime is its actual Hecke value, not a chosen element phase.

=== 8.2 The angular Voronoi formula and Type I estimates <the-angular-voronoi-formula-and-type-i-estimates>

We use the all-integer-index form of [2] Propositions 5.2–5.3. For primary squarefree $r$, put $R = N r$ and define

$ cal(C)_(r \, ell) \( V \; W \) = sum_(d \, u\
\( d \, r \) = 1) \| d \| G \( r u \) theta_ell \( r u d^3 \) W (frac(N \( u d^3 \), V)) . $

In the notation and normalization of Theorem 6, the exact formula is

#[#set math.equation(numbering: n => "(8.5)")
 $ cal(C)_(r \, ell) \( V \; W \) =  & bold(1)_(ell = 0) A_0 cal(M) W \( 5 \/ 6 \) V^(5 \/ 6) frac(phi \( r \), R^(7 \/ 6))\
 & + frac(R^(1 \/ 2) theta_(3 ell) \( r \), 3^(7 \/ 2) \( 2 pi \)^2) sum_(nu eq.not 0 \, med d\
\( d \, r \) = 1) frac(a_r \( nu \) b_r \( nu \) theta_(- ell) \( d^3 nu \), N nu thin \( N d \)^(5 \/ 2)) thin caron(W)_ell (frac(\( 2 pi \)^4 N \( d^3 nu \) V, R^2)) \, $ <eq:angular-voronoi>]

where the support and absolute coefficient bounds are exactly those in that theorem, and

$ caron(W)_ell \( v \) = frac(1, 2 pi i) integral_(\( - sigma \)) v^z Q_ell \( z \) cal(M) W \( z \) thin d z \, #h(2em) Q_ell \( z \) = frac(Gamma \( 5 \/ 6 + \| ell \| \/ 2 - z \) Gamma \( 7 \/ 6 + \| ell \| \/ 2 - z \), Gamma \( z + \| ell \| \/ 2 - 1 \/ 6 \) Gamma \( z + \| ell \| \/ 2 + 1 \/ 6 \)) . $

Here $0 < sigma < 1 \/ 10000$ suffices. To check the phases, multiply [2] Equation (5.80) by $G \( r \) theta_ell \( r \)$. The outside angular factor becomes $theta_ell \( r \) \( macron(r) \/ r \)^(- ell) = theta_(3 ell) \( r \)$. The coefficient formula (5.79), with the theta index $lambda^(- 3) nu$, supplies the displayed dual phase and the same absolute bounds. The main-term indicator removes any angular phase from the residue.

On $"Re" z = - sigma$, Stirling’s formula gives $\| Q_ell \( z \) \| lt.double_(ell \, sigma) \( 1 + \| Im z \| \)^(2 + 4 sigma)$. Consequently the absolute-convergence argument in Theorem 6 proves

#[#set math.equation(numbering: n => "(8.6)")
 $ cal(C)_(r \, ell) \( V \; W \) = bold(1)_(ell = 0) A_0 cal(M) W \( 5 \/ 6 \) V^(5 \/ 6) frac(phi \( r \), R^(7 \/ 6)) + O_(ell \, epsilon.alt) \( X^epsilon.alt R^(1 \/ 2) \) $ <eq:angular-completed-low>]

under its same polynomial scale bounds, fixed compact support and logarithmic derivative bounds.

The estimate at large heights requires more than the absence of an angular residue. We first bound the completed sum: when its norm length is short, an ordinary mean value suffices; otherwise the Voronoi formula bounds its dual frequency range. This supplies the angular replacement for the radial metaplectic mean-square input.

#thm([Lemma 8.3.])[
  (Completed angular sums at large heights).  #emph[Let $r$ be primary and squarefree, put $R = N r$, and let $W$ have fixed compact support in $\( 0 \, oo \)$ and uniformly bounded derivatives. For fixed $ell$, define 
$ cal(C)_(r \, ell \, t) \( V \; W \) = sum_(d \, u\
\( d \, r \) = 1) \| d \| G \( r u \) theta_ell \( r u d^3 \) N \( u d^3 \)^(i t) W (frac(N \( u d^3 \), V)) . $

 Suppose $T gt.eq 2$, $V gt.double 1$, and $R \, V \, T$ are bounded by fixed powers of $X$. Write 
$ M_(r \, ell \, t) \( V \; W \) = bold(1)_(ell = 0) A_0 cal(M) W \( 5 \/ 6 + i t \) V^(5 \/ 6 + i t) frac(phi \( r \), R^(7 \/ 6)) . $

 Then 
#[#set math.equation(numbering: n => "(8.7)")
 $ integral_(\| t \| asymp T) \| cal(C)_(r \, ell \, t) \( V \; W \) - M_(r \, ell \, t) \( V \; W \) \| frac(d t, T) lt.double_(ell \, epsilon.alt) X^epsilon.alt sqrt(V) thin R^(1 \/ 4) sqrt(T) . $ <eq:angular-completed-height>]

]
] <lem:angular-completed-height>

#proof[
  If $V lt.eq sqrt(R) thin T^2$, collect equal rational norms of $u d^3$. Divisor multiplicities bound the squared coefficient sum by
  $ X^epsilon.alt sum_d N d thin \# { u : N \( u d^3 \) asymp V } lt.double X^epsilon.alt V sum_d \( N d \)^(- 2) lt.double X^epsilon.alt V . $
  The ordinary mean-value inequality bounds the mean absolute size of the full sum by $X^epsilon.alt sqrt(V) sqrt(1 + V \/ T)$, which is at most the right side of (8.7). The possible main term is $O_D \( V^(5 \/ 6) R^(- 1 \/ 6) T^(- D) \)$. Its ratio to the claimed bound is at most $R^(- 1 \/ 4) T^(1 \/ 6 - D) lt.eq 1$ for $D gt.eq 1$, by the current inequality $V lt.eq sqrt(R) thin T^2$. Thus the pole-subtracted claim also holds in this branch.
  Suppose now $V > sqrt(R) thin T^2$. In the angular transform use $W \( x \) x^(i t)$ and the outside scalar $V^(i t)$; its Mellin factor is $cal(M) W \( z + i t \)$. On $"Re" z = - A$, the gamma quotient grows as $\( 1 + \| Im z \| \)^(2 + 4 A)$ for fixed $ell \, A$. For any sufficiently small fixed $delta > 0$, truncate at
  $ N \( d^3 nu \) lt.eq I_max = X^delta R^2 T^4 \/ V . $
  This cutoff uses the dyadic height $T$ and is independent of $t$. The omitted tail is smaller than any prescribed negative power of $X$ by taking $A$ sufficiently large. Indeed the transform contributes the power $\( R^2 T^4 \/ \( V N \( d^3 nu \) \) \)^A$; the extra $T^2$ and the absolutely summed coefficients are absorbed by $X^(- delta A)$ after all polynomial scale bounds are fixed. Rapid decay in the translated Mellin variable controls its remaining tail. Partition the retained finite sum into norm dyads $I$, so
  $ I lt.double X^delta R^(3 \/ 2) T^2 . $
  More explicitly, put $D_0 = R^2 T^4 \/ V$. The absolutely summed coefficients with the additional weight $N \( d^3 nu \)^(- sigma)$ cost $O_(sigma \, eta) \( R^eta \)$. For $A > sigma$ the discarded part is therefore $O_(ell \, A \, sigma \, eta) \( R^(1 \/ 2 + eta) T^2 D_0^sigma X^(- delta \( A - sigma \)) \)$. All factors preceding the negative power have fixed polynomial bounds, justifying the stated choice of $A$.
  Move each finite transform to $"Re" z = 1 \/ 2$. Its first numerator pole has real part $5 \/ 6 + \| ell \| \/ 2 > 1 \/ 2$, and
  $ \| Q_ell \( 1 \/ 2 + i y \) \| = 1 . $
  Translating the imaginary variable makes the weight $cal(M) W \( 1 \/ 2 + i v \)$ and the norm exponent $i \( v - t \)$. The gamma quotient and conductor phase are scalars for the whole frequency polynomial. Minkowski’s inequality thus uses a common rapidly decreasing $L^1$ majorant independent of $t$. On this line the absolute coefficient, before summing frequencies, is a fixed constant times
  $ sqrt(V) thin R^(- 1 \/ 2) frac(\| a_r \( nu \) b_r \( nu \) \|, N d sqrt(N nu)) . $
  Write the dual support as $nu = lambda^j zeta h y \( h' \)^3$ and fix $d \, j \, zeta \, h \, h'$. Put $D_d = N d$, $E = N h$, $P' = N h'$, and $g = N \( \( lambda nu \, r \) \) lt.eq min \( R \, E P' \)$. The free squarefree variable has norm length $Y' lt.double I \/ \( D_d^3 3^j E \( P' \)^3 \)$. The coefficient bounds and the ordinary mean value, after extracting $sqrt(V)$, give
  $ lt.double_(ell \, epsilon.alt) X^epsilon.alt R^(- 1 \/ 2) frac(3^(- j \/ 6) g, D_d P' sqrt(E)) (1 + sqrt(Y' \/ T)) . $
  Here the free coefficients have size $O \( \( N y \)^(- 1 \/ 2) \)$; collecting equal norms costs only divisor factors. The endpoint $j = - 1$ changes constants. For the first part use $g lt.eq sqrt(R E P')$. The $j$ sum is geometric, the $d$ sum is logarithmic, the $h$ choices cost at most $tau \( r \)$, and $sum_(h' divides r^oo) \( N h' \)^(- 1 \/ 2) lt.double_epsilon.alt R^epsilon.alt$. Its total is $O \( X^epsilon.alt \)$. For the second part use $g lt.eq E P'$; after substituting $Y'$ its total is at most
  $ X^epsilon.alt sqrt(frac(I, R T)) sum_(d \, j \, h \, h') frac(3^(- 2 j \/ 3), D_d^(5 \/ 2) \( P' \)^(3 \/ 2)) lt.double X^epsilon.alt sqrt(frac(I, R T)) lt.double X^epsilon.alt R^(1 \/ 4) sqrt(T) . $
  The sum over $h$ is charged by a divisor bound; the other displayed sums converge or cost $R^epsilon.alt$. Reselecting the small losses proves (8.7). ◻
]

#thm([Proposition 8.4.])[
  (Angular Type I estimates).  #emph[Suppose $R U asymp X$, $1 lt.eq R lt.double X^.51$, and $\( a_r \)$ is divisor-bounded on $N r asymp R$. If $W_r$ has common fixed compact support in $\( 0 \, oo \)$ and each fixed derivative is bounded by a fixed logarithmic power uniformly in $r$, then 
#[#set math.equation(numbering: n => "(8.8)")
 $ sum_r a_r sum_u cal(D)_ell \( r u \) W_r \( N u \/ U \) lt.double_ell X^(5 \/ 6 - 1 \/ 100) . $ <eq:angular-typeI-low>]

 For the high-height assertion suppose instead that the derivative bounds are fixed independently of $X$. For $2 lt.eq T lt.double X^(1 \/ 6 + rho)$ and every fixed $D > 0$, 
#[#set math.equation(numbering: n => "(8.9)")
 $ integral_(\| t \| asymp T) sum_r \| a_r \| lr(|sum_u G_ell \( r u \) \( N u \)^(i t) W_r \( N u \/ U \)|) frac(d t, T) lt.double_(ell \, epsilon.alt)  & X^(1 \/ 2 + epsilon.alt) R^(3 \/ 4) T^(1 \/ 2)\
 & + bold(1)_(ell = 0) O_D \( X^(5 \/ 6) L^C T^(- D) \) \, $ <eq:angular-typeI-high>]

 where $rho$ is the fixed parameter of (7.3) and $C$ depends only on the coefficient bounds.]
] <prop:angular-typeI>

#proof[
  Nonsquarefree levels vanish. For squarefree $r$ the exact inverse completion is
  #[#set math.equation(numbering: n => "(8.10)")
   $ sum_u G_ell \( r u \) W_r \( N u \/ U \) = sum_(\( c \, r \) = 1) mu \( c \) \| c \| theta_(3 ell) \( c \) cal(C)_(r \, ell) \( U \/ \( N c \)^3 \; W_r \) . $ <eq:angular-inversion>]
  Indeed, after $e = c d$, the angular factor is $theta_ell \( r u e^3 \)$ and the divisor coefficient is $\| e \| sum_(c divides e) mu \( c \)$. This is zero unless $e = 1$. In particular, the sign of the angular index on $c$ is positive.
  For low heights take the cutoffs of Proposition 8: $C_(*) = X^.13$ for $R lt.eq X^.40$ and $C_(*) = X^.02$ otherwise. The short errors from (8.6) total $O_(ell \, epsilon.alt) \( X^epsilon.alt R^(3 \/ 2) C_(*)^(3 \/ 2) \) lt.double X^(.795 + epsilon.alt)$. When $ell = 0$ the main term and its tail are exactly those already computed there. When $ell eq.not 0$ the Voronoi main term is absent. The model is small in this case for a separate lattice reason. For a fixed nonzero integer $ell$,
  #[#set math.equation(numbering: n => "(8.11)")
   $ sum_(\( u \, r \) = 1) mu^2 \( u \) theta_ell \( u \) W \( N u \/ U \) lt.double_(ell \, epsilon.alt) X^epsilon.alt sqrt(U) . $ <eq:angular-lattice>]
  To see this, a smooth annular function $theta_ell \( z \) W \( N z \/ Y \)$ has zero area integral and lattice discrepancy $O_ell \( L^C \( 1 + sqrt(Y) \) \)$, by comparison on fundamental cells and integration of its gradient. Square-divisor and coprimality inversion give $u = c^2 d v$, with $\( c \, r \) = 1$ and $d divides r$. Rotation contributes only $theta_ell \( c^2 d \)$. For $N c lt.double sqrt(U)$, the constant errors cost $O \( sqrt(U) thin tau \( r \) \)$; the radius errors cost at most $O \( sqrt(U) log U \)$ times a divisor factor of $r$. Terms whose scaled support contains no nonzero lattice point vanish. This proves (8.11). Only the area integral vanishes exactly, not the discrete angular sum.
  Apply this estimate to $x^(- 1 \/ 6) W_r \( x \)$. After the outer sum, the model error is
  $ O_(ell \, epsilon.alt) \( X^epsilon.alt R^(5 \/ 6) U^(1 \/ 3) \) lt.double X^(.589 + epsilon.alt) . $
  For the long completion tail, combining $c \, d$ into $e$ leaves $theta_(3 ell) \( e \) theta_ell \( r \) theta_ell \( u \)$ as independent modulus-one coefficient factors. The same counting bound $X^(1 + epsilon.alt) E^(- 3 \/ 2)$ and the same cubic-sieve bound
  $ X^(1 \/ 2 + epsilon.alt) (R + U \/ E^3 + \( X \/ E^3 \)^(2 \/ 3))^(1 \/ 2) $
  therefore apply on $N e asymp E$. The first gives exponent $.805$ in the small-$R$ branch; in the other branch the three exponents are $.755$, $.77$, and $5 \/ 6 - .02$. These, the short errors, and the radial main-term tail when $ell = 0$ prove (8.8).
  For high heights, let $b_0$ be a common upper endpoint of the supports of $W_r$. A nonempty completed sum has $N c lt.eq \( b_0 U \)^(1 \/ 3)$ and hence $V = U \/ \( N c \)^3 gt.eq 1 \/ b_0$. We may therefore apply Lemma 25 inside the inverse completion. With the norm twist its coefficient is $mu \( c \) \| c \| theta_(3 ell) \( c \) \( N c \)^(3 i t)$. At $V = U \/ \( N c \)^3$ its error is $X^epsilon.alt sqrt(U) thin \( N c \)^(- 1) R^(1 \/ 4) sqrt(T)$. Only $N c lt.double U^(1 \/ 3)$ can contribute, so this sum is logarithmic. The main term is absent for $ell eq.not 0$. For $ell = 0$ it is bounded by $O_D \( U^(5 \/ 6) R^(- 1 \/ 6) T^(- D) \)$ after inversion: the Mellin factor has arbitrary height decay and the $c$ sum has exponent $2$. Finally, summing $\| a_r \|$ gives the error $X^(1 \/ 2 + epsilon.alt) R^(3 \/ 4) sqrt(T)$ and the stated pole bound. This proves (8.9). ◻
]

=== 8.3 Smooth duality and the exceptional moments <smooth-duality-and-the-exceptional-moments>

Call $beta_ell \( b \) = Theta_ell \( b \) beta_0 \( b \)$ an angular prime convolution if $beta_0$ is exactly an admissible convolution in (4.1). Its independent radial prime weights, squarefree restriction, lower prime bound, bounded number of factors and derivative hypotheses are all retained.

#thm([Proposition 8.5.])[
  (Fixed-angular exceptional moments).  #emph[Proposition 10 holds with $beta$ replaced by $beta_ell$. The constants $delta \, eta$ and the implied constant may additionally depend on the fixed integer $ell$.]
] <prop:angular-dual>

#proof[
  We first prove the version of Lemma 11 needed for a full smooth factor. Let $Psi$ be the primitive nonprincipal character inducing $chi Theta_ell$ in the dominant-full-sum reduction, where $chi$ is finite-order cubic, including its fixed local factors. There is no additional imaginary norm parameter: all norm oscillation is the explicit factor $\( N frak(n) \)^(i t)$. Mellin inversion gives
  $ sum_(frak(n)) Psi \( frak(n) \) \( N frak(n) \)^(i t) W \( N frak(n) \/ Z \) = frac(1, 2 pi i) integral cal(M) W \( z \) Z^z L \( z - i t \, Psi \) thin d z . $
  The sum is over all integral ideals. Move to $"Re" z = - A$ and apply (8.3). For fixed $k = \| ell \| \/ 2$, the quotient $Gamma \( 1 - z + i t + k \) \/ Gamma \( z - i t + k \)$ grows with degree $1 + 2 A$ in $1 + \| Im z - t \|$. Absolute convergence on this line therefore allows truncation into dual norm dyads
  #[#set math.equation(numbering: n => "(8.12)")
   $ J lt.double_(ell \, epsilon.alt) Y^epsilon.alt D \( 1 + \| t \| \)^2 \/ Z \, $ <eq:angular-smooth-cutoff>]
  with an arbitrarily small power tail. Within each row average fix $Z \, t \, W$ and the local and Euler-divisor case, as in the radial Mellin reduction. Choose one cutoff using the largest permitted conductor and the same smooth dyadic partition for every row. This ensures that neither a row-dependent cutoff nor a varying norm shift enters the coefficients.
  Move each retained finite dyad to $"Re" z = 1 \/ 2$. The first numerator gamma pole has real part $1 + k$, so none is crossed. Writing $z = 1 \/ 2 + i tau$ and $C_D = sqrt(3 D) \/ \( 2 pi \)$, the row-dependent factor is
  $ epsilon.alt_Psi C_D^(2 i \( t - tau \)) frac(Gamma \( 1 \/ 2 + k - i \( tau - t \) \), Gamma \( 1 \/ 2 + k + i \( tau - t \) \)) . $
  It has modulus one. The dyad amplitude is $sqrt(Z \/ J)$, its character is $overline(Psi)$, and $\| cal(M) W \( 1 \/ 2 + i tau \) \|$ supplies a common rapidly decreasing $L^1$ majorant independent of conductor and height. Its mass is $O \( Y^epsilon.alt \)$ under the stipulated logarithmic derivative bounds. Minkowski’s inequality introduces only the common additional norm shift $tau$. On primary dual arguments the angular multiplier is the common coefficient $Theta_(- ell)$.
  The local factors require some care. Fix the small twists and the finitely many conductor possibilities above $3$ as in the dominant-full-sum argument of Section 4. Remove the missing Euler factors before applying the primitive equation. When the primitive character is unramified at $lambda$, split its dual $lambda$ powers and use $overline(Psi) \( lambda \)^j$. For each fixed $j$ this is a row scalar of modulus at most one; on the remaining argument the angular coefficient is common. It need not equal the raw element phase $theta_(- ell) \( lambda \)^j$. The same finite exclusions and subpower divisor costs as in the radial proof suffice. For $ell eq.not 0$ nonprincipality follows from the infinity type; for $ell = 0$ it follows from the surviving large-prime part of the row conductor used there.
  We now check the entire moment argument. Repeated-prime and prime-power discrepancies have unchanged support and absolute divisor bounds. Thus both discrepancy estimates of Section 4 apply. If $T_ell f \( n \) = Theta_ell \( n \) f \( n \)$, multiplicativity gives the exact identity $T_ell \( f * g \) = \( T_ell f \) * \( T_ell g \)$. In particular the short convolution identity used there becomes
  $ T_ell Lambda = #scale(x: 120%, y: 120%)[\(] 2 T_ell m - \( T_ell m \) * \( T_ell m \) * \( T_ell upright(bold(1)) \) #scale(x: 120%, y: 120%)[\)] * T_ell \( log N \) . $
  All truncation ranges and norm dyads are unchanged. In a product of factors, including repeated copies, the merged coefficient is multiplied by $Theta_ell$ of the product argument. The angular order is not multiplied by the number of factors. The resulting coefficients are still common to all cubic-character rows and divisor-bounded.
  If a length exponent tends to one, the corresponding full smooth factor is treated by (8.12). The bound $\| t \| lt.eq Y^.36$, with the internal allowance $Y^.37$, yields the same dual length $J lt.eq Y^(.74 + o \( 1 \))$ and second-moment exponents $2.16$ in the first configuration and $2 \/ 3 + 2 \( 1 \/ 3 + .37 \)$ in the second. Both are strictly below $7 \/ 3$. Thus this case is removed exactly with a power gap. Every remaining sieve is applied to the finite cubic row character with $Theta_ell$ in its arbitrary common coefficients.
  With full smooth factors excluded, every limiting length exponent is strictly less than one. The remaining moment argument in the proof of Proposition 10 applies to the twisted polynomials: their coefficients are common to all rows and divisor-bounded, and these properties survive the fixed products and repetitions used there. The large-value inequality (4.6) therefore holds unchanged for a set of $Y^(r + o \( 1 \))$ rows. In the second configuration the same ordinary-sieve argument, repeating one positive factor, gives $r lt.eq max \( 4 \/ 3 \, z \) - 2 z \/ 3 < 2 \/ 3$, with $1 < z < 2$, and the required contradiction.
  In the first configuration the multiplicity inequality (4.7), in the notation of that proof, is still
  $ r lt.eq 2 / 3 - 2 sum_i k_i \( v_i - 5 a_i \/ 6 \) \, #h(2em) 1 / 2 lt.eq sum_i k_i a_i lt.eq 2 . $
  The radial multiplicity comparison thus produces a polynomial of length $Z = Y^(z + o \( 1 \))$, with $4 \/ 3 < z < 2$, whose values are $Y^(5 z \/ 6 + o \( 1 \))$ on $Y^(2 \/ 3 - o \( 1 \))$ distinct rows. The Gram matrix of Lemma 12 is unchanged: $Theta_ell$ belongs to the common coefficient vector, and cancels against its conjugate in every row product. The radial weight stays radial. Writing $R$ for the number of these rows, after the same division by $Z R$ the left exponent is $2 z \/ 3$, whereas the diagonal and off-diagonal exponents are
  $ z - 2 / 3 \, #h(2em) frac(z + max \( 1 \, 2 - 2 z \/ 3 \) - 2 \/ 3, 2) . $
  Their gaps are $\( 2 - z \) \/ 3$ and, respectively, $\( 3 z - 4 \) \/ 6$ for $z lt.eq 3 \/ 2$ or $\( z - 1 \) \/ 6$ for $z gt.eq 3 \/ 2$. Each is positive. Choosing the small-power losses after the fixed multiplicity gives the same contradiction. Keep $ell$ fixed in the uniform-neighborhood argument at the end of that proof. A sequence of shrinking neighborhoods and savings would again have a convergent subsequence of length and value exponents; the selected multiplicity and losses are fixed before taking the limit. The contradiction therefore gives the required fixed $delta \, eta > 0$. ◻
]

=== 8.4 Twisted sequence conditions and corrected dispersion <twisted-sequence-conditions-and-corrected-dispersion>

The condition (SW) in Section 5 must be checked for the twisted sequence itself. It is not an abstract consequence of (SW) for an arbitrary untwisted sequence. For the actual decomposition coefficients we have the following.

#thm([Lemma 8.6.])[
  (The angular sequence condition).  #emph[Every nonsparse ordinary coefficient $beta_0$ constructed in Proposition 15 satisfies (SW) after replacement by $beta_ell = Theta_ell beta_0$.]
] <lem:angular-sw>

#proof[
  Repeat the largest-prime selection of Lemma 19. Discard the part whose prime factors all have norm at most $exp \( sqrt(log X) \)$ by its absolute Rankin bound. For the rest, fix all factors except a largest prime $pi$, of dyadic norm length $P gt.eq exp \( sqrt(log X) \)$, starting this dyadic subdivision at that threshold. Their angular factor is a scalar. The remaining prime sum is tested against $chi \( pi \) Theta_ell \( pi \)$, with $chi$ nonprincipal cubic of logarithmic conductor, a logarithmic norm height, and the same smooth weights and norm intervals from the stopping rule. Since $\( log X \)^C lt.eq \( log P \)^(2 C)$, the conductor is within Lemma 24. If $ell eq.not 0$ the infinity type prevents principality; if $ell = 0$ the nonprincipal cubic condition does so. Partial summation supplies arbitrary logarithmic saving uniformly in the remaining norm intervals and heights. The polynomial-size exclusion integer deletes only $O \( log X \)$ possible primes. This costs a logarithmic power per fixed complement, harmless since $P gt.eq exp \( sqrt(log X) \)$. Choose the prime saving after the fixed coefficient multiplicities, norm-height powers and desired saving. Summing the complementary factors then gives precisely the bound in (SW). ◻
]

#thm([Proposition 8.7.])[
  (Angular dispersion and bilinear estimates).  #emph[The estimates of Proposition 13 hold for $beta_ell$, assuming (SW) for $beta_ell$ wherever it was required. For $B > X^.40$, the stipulated structured class is exactly the angular prime-convolution class above. The conclusions of Propositions 20 and 21 consequently hold with the kernel multiplied by $theta_ell \( a b \)$ and with all their other hypotheses retained. The absolute small-$B$ parameter $gamma$ is unchanged; other constants may depend on fixed $ell$.]
] <prop:angular-dispersion>

#proof[
  Keep $W_A \( a \)$ radial and put
  $ F_(ell \, u) \( a \) = sum_b beta_ell \( b \) \( N b \)^(i u) G \( b \) overline(chi_b \( a \)) \, #h(2em) S_ell \( u \) = sum_b beta_ell \( b \) \( N b \)^(i u - 1 \/ 6) . $
  In every opened pair, the extra factor is $Theta_ell \( b_1 \) overline(Theta_ell \( b_2 \))$ in the coefficients. At $b_i = f l n_i$ the common factor cancels, leaving the separate twists on $n_1 \, n_2$. Poisson summation and its plane transform still act on a radial weight. The diagonal, large-gcd removal, transform tails and all general-coefficient sieves and height means therefore have their original bounds.
  At the two exceptional large-conductor configurations the length argument still forces $f = l = 1$, $B = X^(1 \/ 2 + o \( 1 \))$, small extra twists and exclusions, and the internal height at most $B^.36$. Proposition 27 supplies their saving. At small nonprincipal conductor use (SW) for $beta_ell$ itself. When $B lt.eq X^.40$ the exceptional configurations remain excluded by the original absolute length gaps. Thus the power-width derivative bounds, sharp norm-cell restrictions and unrestricted translated height in that range retain the same $gamma$, independently of $ell$.
  The cube frequencies give the main term
  #[#set math.equation(numbering: n => "(8.13)")
   $ c_(*)^2 \| S_ell \( u \) \|^2 sum_a mu^2 \( a \) W_A \( a \) \( N a \)^(- 1 \/ 3) . $ <eq:angular-cube-main>]
  This expression need not vanish for $ell eq.not 0$. Its cancellation uses the corrected square, as in the radial argument. Indeed the mixed term before multiplication by $overline(S_ell \( u \))$ is
  $ sum_(a \, b) beta_ell \( b \) \( N b \)^(i u) W_A \( a \) \( N a \)^(- 1 \/ 6) G \( a b \) . $
  Here the angular factor is only in the arbitrary outer $b$-coefficient. The inner $a$-weight is radial, so the original Proposition 8 gives
  $ c_(*) sum_(a \, b) beta_ell \( b \) \( N b \)^(i u - 1 \/ 6) mu^2 \( a b \) W_A \( a \) \( N a \)^(- 1 \/ 3) + O #scale(x: 120%, y: 120%)[\(] A^(- 1 \/ 6) X^(5 \/ 6 - eta) #scale(x: 120%, y: 120%)[\)] . $
  After multiplication by $\| S_ell \( u \) \| lt.double B^(5 \/ 6) L^(O \( 1 \))$, the error is $O \( cal(Q) X^(- eta) L^(O \( 1 \)) \)$. Roughness and the unchanged absolute coefficient moments remove cross-coprimality at the original logarithmic cost. The positive square, mixed term and model square thus have the same main term (8.13) with coefficients $1 \, - 2 \, 1$. This proves the corrected dispersion bound.
  In the bilinear sum use $alpha_ell \( a \) = Theta_ell \( a \) alpha_0 \( a \)$ and $beta_ell \( b \)$. The first phase disappears under Cauchy, and its coefficient norm is unchanged. Restoring the model gives exactly $theta_ell \( a b \) c_(*) mu^2 \( a b \) N \( a b \)^(- 1 \/ 6)$. All cross-coprimality errors use absolute values. In particular, the three-prime transition still has saving $L^(- 3 \/ 2)$.
  For the integrated estimate, at large $B$ the diagonal remains $A sqrt(B) lt.double X^.80$ and the other term has arbitrary logarithmic saving. At small $B$ partition both norm variables into the same $O \( J \)$ cells. Their coefficient norms $a_i \, b_j$ are unchanged. Near pairs give $X^(5 \/ 6) L^(O \( 1 \)) H^(- 1 \/ 6) J^(- 1 \/ 2)$ as in (7.6); all absolute errors sum to $X^(5 \/ 6) L^(O \( 1 \)) J^(3 \/ 2) epsilon_J^(1 \/ 2)$ as in (7.7). For far pairs, integration by parts differentiates the height cutoff. The angular phases stay in the coefficients, and the common Mellin shifts remain independent of the averaging height. Thus the factor $\( J \/ T \)^q$ and the unrestricted-shift use of dispersion are preserved. With $J = L^(D')$ or $X^gamma$ the same positive gaps prove the integrated estimate. ◻
]

=== 8.5 The exact decomposition and sharp cutoff <the-exact-decomposition-and-sharp-cutoff>

We finally verify that these interfaces prove Theorem 23. The identities of Section 6 apply to both squarefree-supported kernels $G_ell$ and $cal(D)_ell$. The prime detector, distinguished tuples and semiprime subtraction are scalar identities. Every stopping predicate depends on norms alone. For a fixed stopping bin and its counts, multiplicativity allocates the phase to independent coefficients $Theta_ell \( a \) alpha \( a \)$ and $Theta_ell \( b \) beta \( b \)$; the binomial weight is unchanged. The permitted overlaps are still annihilated by the separate squarefree restriction on each kernel. There is no new coupled cutoff or height dependence in the coefficients.

No-stop terms have an angular inner variable and use Proposition 26. Every sparse support count, absolute coefficient moment, Rankin bound and general-coefficient cubic-sieve application is unchanged. For $B > X^.40$ the coefficient is precisely $Theta_ell beta_0$ with the original independently smooth prime weights; Proposition 27 therefore applies. Lemma 28 proves the required sequence condition. The number of pieces, transition indices and sparse remainders is exactly the one already counted.

Fix $ell$ first. Choose the absolute small-$B$ $gamma$, then $kappa \, rho$ as in (7.3), then $xi$ and the fixed tuple complexity. Subsequent neighborhood sizes, logarithmic savings and constants may depend on $ell$. They are chosen in the order of Section 7. There is no dependence returning from an angular exceptional moment to the absolute $gamma$.

#proof[
  Apply Lemma 22 to the prime coefficients with their angular factors and $T_max = X^(1 \/ 6 + rho)$. Equal-norm collection has the same absolute divisor bound, so the truncation error is $O_epsilon.alt \( X^epsilon.alt \( 1 + X \/ T_max \) \)$ and is $o \( X^(5 \/ 6) \/ log X \)$ for $epsilon.alt < rho$. At low heights the exact decomposition just verified, the angular Type I comparison and the angular bilinear comparison give the same arbitrary logarithmic savings. The three-prime transition contributes $O_ell \( X^(5 \/ 6) L^(- 3 \/ 2) \( 1 + log L \)^C \)$, which is also little-oh at the required scale. Sparse terms retain their power savings.
  At high heights first bound the undecomposed angular prime model. If $d_(ell \, n)$ is its coefficient after collecting equal norms, then $sum_n \| d_(ell \, n) \|^2 lt.double X^(2 \/ 3) L^(O \( 1 \))$ by absolute divisor multiplicity. The ordinary mean value therefore gives the same $T^(- 1 \/ 2)$ saving used in Section 7. This step does not use angular prime cancellation. For the Gauss-sum term the integrated bilinear estimate is Proposition 29. The high-height Type I estimate gives the same two endpoint powers, $.805 + epsilon.alt$ and $5 \/ 6 - 3 kappa \/ 8 + rho \/ 2 + epsilon.alt$. Choose $epsilon.alt$ below the two fixed gaps to $5 \/ 6$. Its pole term is absent unless $ell = 0$, when its arbitrary height decay is the original one. The two-cell and far-pair savings proved above pay for the same polynomial number of pieces and the $O \( L \)$ height dyads. Hence the dyadic prime comparison (7.12) holds with $theta_ell \( pi \)$ inserted. Geometric dyadic summation gives (8.1).
  For $ell eq.not 0$, take $chi$ principal in Lemma 24 and remove the prime logarithm by partial summation. Thus $P_ell \( y \) = sum_(N pi lt.eq y) theta_ell \( pi \) lt.double_(ell \, M) y \( log y \)^(- M)$ for every fixed $M$. Abel summation now gives
  $ sum_(N pi lt.eq X) theta_ell \( pi \) \( N pi \)^(- 1 \/ 6) = X^(- 1 \/ 6) P_ell \( X \) + 1 / 6 integral_2^X P_ell \( y \) y^(- 7 \/ 6) thin d y = o_ell \( X^(5 \/ 6) \/ log X \) . $
  The lower endpoint contributes only a bounded term. Combining this with (8.1) proves (8.2). ◻
]

For $ell = 0$ the model is the radial one and retains coefficient $\( 6 \/ 5 \) c_(*)$. Inert primes still have total size $O \( sqrt(X) \)$. The rational half-sum consequence (1.5) is unchanged. For $ell eq.not 0$ a conjugate pair instead contributes $2 "Re" \( theta_ell \( pi \) G \( pi \) \)$; no identification with the untwisted rational Kummer summand is asserted.

=== 8.6 Fixed powers of the Gauss-sum values <fixed-powers-of-the-gauss-sum-values>

The angular result also determines the fixed power moments whose exponents are not divisible by three. In the normalization (1.1), the cubic Gauss-sum identity [2] Equation (1.8) gives

$ G \( pi \)^3 = - frac(pi, \| pi \|) = - theta_1 \( pi \) \, #h(2em) \| G \( pi \) \| = 1 . $

Consequently, for every fixed integer $k$ with $3 divides.not k$,

#[#set math.equation(numbering: n => "(8.14)")
 $ sum_(N pi lt.eq X\
pi equiv 1 med \( mod med 3 \) med upright("prime")) G \( pi \)^k = bold(1)_(k in { - 1 \, 1 }) 6 / 5 c_(*) frac(X^(5 \/ 6), log X) + o_k #h(-0.16667em) (frac(X^(5 \/ 6), log X)) . $ <eq:gauss-power-cancellation>]

Indeed, for $k = 3 m + 1$ and $k = 3 m - 1$, respectively,

$ G \( pi \)^(3 m + 1) = \( - 1 \)^m theta_m \( pi \) G \( pi \) \, #h(2em) G \( pi \)^(3 m - 1) = \( - 1 \)^m overline(theta_(- m) \( pi \) G \( pi \)) . $

For $m eq.not 0$, Theorem 23 gives cancellation; for $m = 0$, Theorem 1 and its complex conjugate give the same real main term. Negative powers are well-defined because $\| G \( pi \) \| = 1$.

Thus (8.14) proves the fixed-power cases $3 divides.not k$, $\| k \| > 1$, of the complementary conjecture in [2] Equation (1.9). For a nonzero multiple $k = 3 m$, the same identity instead gives $G \( pi \)^k = \( - 1 \)^m theta_m \( pi \)$. The Hecke prime estimates used here do not bound these prime-angle sums at the stronger scale $X^(5 \/ 6) \/ log X$, so those cases remain outside the conclusion.

#heading(level: 1)[References]
#bibitem([1])[E. Chen, P. S. Park and A. A. Swaminathan, #emph[Linnik's theorem for Sato--Tate laws on elliptic curves with complex multiplication], Research in Number Theory #strong[1] (2015), article 28. #link("https://doi.org/10.1007/s40993-015-0028-0"). Numbered references use arXiv:1506.09170v3, #link("https://arxiv.org/abs/1506.09170v3").]
#bibitem([2])[A. Dunn and M. Radziwiłł, #emph[Bias in cubic Gauss sums: Patterson's conjecture], Annals of Mathematics #strong[200] (2024), no.~3, 967--1057. #link("https://doi.org/10.4007/annals.2024.200.3.3"). All numbered references to this paper use arXiv:2109.07463v3, May 14, 2024, #link("https://arxiv.org/abs/2109.07463v3").]
#bibitem([3])[P. Gao and L. Zhao, #emph[The large sieve with power moduli in imaginary quadratic number fields], International Journal of Number Theory #strong[18] (2022), no.~8, 1713--1733. #link("https://doi.org/10.1142/S1793042122500877"). The equation (1.2) locator refers to arXiv:2101.00811v2, #link("https://arxiv.org/abs/2101.00811v2").]
#bibitem([4])[G. Harcos, #emph[The Bombieri--Halász--Montgomery inequality], undated note, Theorem~1, equation~(1). #link("https://www.renyi.hu/~gharcos/bombieri-halasz-montgomery.pdf").]
#bibitem([5])[D. R. Heath-Brown, #emph[Kummer's conjecture for cubic Gauss sums], Israel Journal of Mathematics #strong[120] (2000), 97--124. #link("https://doi.org/10.1007/s11856-000-1273-y"). Numbered references use the #link("https://www.researchgate.net/publication/254847691")[author's manuscript].]
#bibitem([6])[D. R. Heath-Brown and S. J. Patterson, #emph[The distribution of Kummer sums at prime arguments], Journal für die reine und angewandte Mathematik #strong[310] (1979), 111--130. #link("https://doi.org/10.1515/crll.1979.310.111").]
#bibitem([7])[M. N. Huxley, #emph[The large sieve inequality for algebraic number fields], Mathematika #strong[15] (1968), no.~2, 178--187. #link("https://doi.org/10.1112/S0025579300002540").]
#bibitem([8])[H. Iwaniec and E. Kowalski, #emph[Analytic Number Theory], American Mathematical Society Colloquium Publications, vol.~53, American Mathematical Society, Providence, RI, 2004. #link("https://doi.org/10.1090/coll/053").]
#bibitem([9])[I. Kaneko and J. Thorner, #emph[Highly uniform prime number theorems], Annales de l'Institut Fourier #strong[75] (2025), no.~5, 1901--1923. #link("https://doi.org/10.5802/aif.3698").]
#bibitem([10])[E. E. Kummer, #emph[De residuis cubicis disquisitiones nonnullae analyticae], Journal für die reine und angewandte Mathematik #strong[32] (1846), 341--359. #link("https://doi.org/10.1515/crll.1846.32.341").]
#bibitem([11])[H. L. Montgomery and R. C. Vaughan, #emph[Hilbert's inequality], Journal of the London Mathematical Society (2) #strong[8] (1974), 73--82. #link("https://doi.org/10.1112/jlms/s2-8.1.73").]
#bibitem([12])[S. J. Patterson, #emph[A cubic analogue of the theta series], Journal für die reine und angewandte Mathematik #strong[296] (1977), 125--161. #link("https://doi.org/10.1515/crll.1977.296.125").]
#bibitem([13])[S. J. Patterson, #emph[On the distribution of Kummer sums], Journal für die reine und angewandte Mathematik #strong[303/304] (1978), 126--143. #link("https://doi.org/10.1515/crll.1978.303-304.126").]
#bibitem([14])[C. S. Rajan, #emph[Distribution of values of Hecke characters of infinite order], Acta Arithmetica #strong[85] (1998), no.~3, 279--291. #link("https://doi.org/10.4064/aa-85-3-279-291").]
#bibitem([15])[J. Thorner and A. Zaman, #emph[A unified and improved Chebotarev density theorem], Algebra & Number Theory #strong[13] (2019), no.~5, 1039--1068. #link("https://doi.org/10.2140/ant.2019.13.1039").]
#bibitem([16])[D. Wan, #emph[Exponential sums over finite fields], Journal of Systems Science and Complexity #strong[34] (2021), 1225--1278. #link("https://doi.org/10.1007/s11424-021-0066-8").]
#bibitem([17])[M. Watkins, #emph[Computing with Hecke Grössencharacters], Publications mathématiques de Besançon. Algèbre et théorie des nombres (2011), 119--135. #link("https://doi.org/10.5802/pmb.a-138").]
#bibitem([18])[A. Yoshimoto, #emph[On the cubic theta function], Nagoya Mathematical Journal #strong[105] (1987), 153--167. #link("https://doi.org/10.1017/S0027763000000817").]


