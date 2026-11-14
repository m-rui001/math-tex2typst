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

#align(center)[#text(size: 16pt, weight: "bold")[The Poisson--Dirichlet law for prime predecessors]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

The prime factors of a typical integer, viewed on a logarithmic scale, form a random partition of unit mass.
  We prove that the same limiting partition occurs for the predecessor of a uniformly chosen prime.

For a prime $p gt.eq 3$, list the prime factors of $p - 1$, with multiplicity, in decreasing order,

$ q_1 \( p \) gt.eq q_2 \( p \) gt.eq dots.h.c \, $

and put $q_j \( p \) = 1$ after the list is exhausted. Define

$ V_j \( p \) = frac(log q_j \( p \), log \( p - 1 \)) . $

Then $V_j \( p \) gt.eq 0$ and $sum_j V_j \( p \) = 1$.

Let $U_1 \, U_2 \, dots.h$ be independent uniform random variables on $\( 0 \, 1 \)$, and form the stick fragments

#[#set math.equation(numbering: n => "(1.1)")
 $ B_1 = 1 - U_1 \, wide B_j = (product_(i < j) U_i) \( 1 - U_j \) quad \( j gt.eq 2 \) . $ <eq:stick-breaking>]

Their decreasing rearrangement $\( L_1 \, L_2 \, dots.h \)$ has the Poisson–Dirichlet distribution with parameter
  one, denoted $"PD" \( 1 \)$. Write $pi \( x \)$ for the number of primes at most $x$.

#thm([Theorem 1.1.])[
  #emph[For every fixed $k gt.eq 1$ and every bounded continuous function $F : \[ 0 \, 1 \]^k arrow.r bb(R)$,
#[#set math.equation(numbering: n => "(1.2)")
 $ lim_(x arrow.r oo) frac(1, pi \( x \) - 1) sum_(3 lt.eq p lt.eq x\
p upright(" prime")) F #scale(x: 120%, y: 120%)[\(] V_1 \( p \) \, dots.h \,
  V_k \( p \) #scale(x: 120%, y: 120%)[\)] = bb(E) F \( L_1 \, dots.h \, L_k \) . $ <eq:main-law>]

 The limit holds through all real $x$ and uses ordinary equal weighting of the primes.]
] <thm:main>

Theorem 1 resolves positively the conjecture of Ford, Konyagin and Luca #cite(label("FordKonyaginLuca2010"))
  Section 6, Conjecture 5. Their formulation uses the same multiplicity convention, normalization,
  and ordinary counting distribution on primes. The assertion includes all finite joint distributions,
  strengthening the largest-factor prediction alone.

===== 1.1 History and significance. <history-and-significance.>

For ordinary uniformly sampled integers, the largest-factor law begins with Dickman #cite(label("Dickman")) and
  the smooth-number estimates of de Bruijn #cite(label("deBruijn1951")).
  Billingsley proved the joint limiting law of the ordered large prime divisors #cite(label("Billingsley")).
  Donnelly and Grimmett #cite(label("DonnellyGrimmett")) Theorem 1 and Corollaries 2–3 gave a size-biased
  treatment, including multiplicities, leading directly to the stick-breaking and Poisson–Dirichlet descriptions.
  Arratia, Kochman and Miller #cite(label("ArratiaKochmanMiller2014")) express this identification through the
  joint intensities of distinct factor tuples. Our final passage from interior factor statistics to ranked factors
  uses the same size-biased approach; that passage is proved explicitly in Section 8.

The shifted-prime problem has a different arithmetic difficulty:
  requiring a product of large primes to divide $p - 1$ places $p$ in a progression with that product as modulus.
  Standard distribution estimates give useful information for products below a fixed power of $x$,
  whereas the full factor partition involves products throughout the range below $x$.
  The smoothness question arose in Erdős’s work on Euler’s function #cite(label("Erdos1935"))
  #cite(label("Erdos1956")), and Pomerance #cite(label("Pomerance1980")) developed its connection with large
  totient fibers. Baker and Harman #cite(label("BakerHarman1998")) Theorem 1 and Lichtman
  #cite(label("Lichtman2022")) Theorem 1.1 obtained lower bounds of the form $x \/ \( log x \)^C$ for primes with
  smooth predecessors, at thresholds $x^0.2961$ for $p lt.eq x$ and $x^0.2844$ for $x < p lt.eq 2 x$, respectively.

For shifted primes, Granville states the conjectural asymptotic #cite(label("Granville")) Section 5.3, Equation (5.1)

#[#set math.equation(numbering: n => "(1.3)")
 $ \# { p lt.eq x : P^(+) \( p - 1 \) lt.eq x^(1 \/ u) } tilde.op pi \( x \) rho \( u \)
   wide \( u gt.eq 1 upright(" fixed") \) \, $ <eq:shifted-dickman>]

where $P^(+) \( n \)$ is the largest prime factor, with $P^(+) \( 1 \) = 1$,
  and the Dickman function is determined by $rho \( u \) = 1$ for $0 lt.eq u lt.eq 1$ and $u rho' \( u \) +
  rho \( u - 1 \) = 0$ for $u > 1$. Theorem 1 resolves this fixed-$u$ conjecture positively and proves the
  complete joint limiting law. The use of $x$ rather than $p - 1$ in the threshold in (1.3) causes no change:
  restrict first to $epsilon x < p lt.eq x$, where $log \( p - 1 \) \/ log x arrow.r 1$ uniformly,
  and then let $epsilon arrow.b 0$. The largest part of $"PD" \( 1 \)$ has the continuous Dickman distribution,
  by the ordinary-integer limit in #cite(label("DonnellyGrimmett")) Section 1 and the smooth-number asymptotic in
  #cite(label("Granville")) Section 1, Equation (1.1); hence the corresponding threshold sandwich applies.

The closest general distribution theorem is due to Bharadwaj and Rodgers #cite(label("BharadwajRodgers2026"))
  Theorem 7. Their Poisson–Dirichlet theorem applies to nonnegative sequences satisfying their regularity and
  congruence-uniformity hypotheses, with level of distribution one.
  For shifted primes this gives the full law under the Elliott–Halberstam conjecture,
  as anticipated in #cite(label("FordKonyaginLuca2010")) Section 6.
  Unconditionally, #cite(label("BharadwajRodgers2026")) Proposition 2 and Lemma 8 give level one half and the
  corresponding factor correlations for tests supported where the sum of the logarithmic coordinates is less than
  one half. Our extraction reaches every compact subset of the open simplex with coordinate sum less than one,
  and the final probability argument controls its boundary.
  All smoothness parameters in (1.3) remain fixed as $x$ grows.

There is also strong recent information about the small prime divisors of shifted primes.
  Ford #cite(label("Ford2025")) proves a total-variation approximation for their valuations on subpower ranges;
  Gorodetsky #cite(label("Gorodetsky2026")) obtains such approximations within a general sieve model.
  The large-factor law studied here concerns the logarithmic mass carried by prime factors of polynomial size.

Ford, Konyagin and Luca formulated their conjecture in studying prime chains and Pratt trees.
  Theorem 1 supplies the factorization law at the root of their probabilistic model;
  the recursive independence assumptions used for later generations are additional hypotheses.
  Smooth predecessors also underlie the Carmichael-number construction of Alford,
  Granville and Pomerance #cite(label("AlfordGranvillePomerance1994")),
  together with a separate progression-distribution input.

The companion article #emph[Weighted dilation graphs, smooth shifted primes and totient
  fibers] #cite(label("SmoothShifted")) Theorem 1.2, denoted S, proves that,
  for every fixed positive smoothness exponent, there are $x^(1 - o \( 1 \))$ primes in its stated interval with
  smooth predecessors. Such a lower bound does not imply a positive limiting proportion, much less (1.2).
  We use S’s dilation-graph operator theorems in a different extraction argument.
  Section 6 states their precise contracts and verifies the new endpoint hypotheses.
  The long-prime polynomial and logarithmic-phase estimates needed in both analytic branches are proved in
  Appendix 9; Section 2 records the ranges in which we use them.

===== 1.2 The new analytic step. <the-new-analytic-step.>

The main new estimate is Theorem 8: a marked Type II estimate in which only the predecessor side carries divisor
  marks, namely weights recording selected small prime divisors.
  It permits a prime factor on the other side to be replaced by a rough integer,
  free of primes below a prescribed cutoff, with its local density.
  Cauchy’s inequality, applied after dividing out one tuple of marks,
  leads to a small-determinant relation between primitive lattice vectors.
  We average its long signed moments using a root-residue formula and an exact memory expansion.
  The memory records a prime across gaps between its uses, so its divisibility probability is charged only once.

The root coordinates are restricted by quantitative separation conditions.
  These give both a balanced lattice box for fresh-label minor arcs and a separation rule for retrieving
  remembered labels. Global distinctness is then restored by grouping equalities between newly drawn prime labels
  according to their rank, the number of independent equality constraints.
  High ranks supply many small point-probability factors, whereas low ranks alter only a vanishing fraction of the
  signed edge contractions. The resulting estimate has arbitrarily strong fixed logarithmic precision,
  with a number of marking bands independent of their particular fixed exponents.

The signed-moment method has precedents in divisibility graphs.
  Helfgott and Radziwiłł center prime-divisibility weights by subtracting $1 \/
  p$ and analyze high traces through prime-labelled walks #cite(label("HelfgottRadziwill2021")) Sections 1.3,
  1.5 and 5. Their proposed composite shifts #cite(label("HelfgottRadziwill2021")) Section 9.1 are developed by
  Pilatte using products of primes and a non-backtracking trace estimate #cite(label("Pilatte2026"))
  Definition 3.2 and Proposition 5.3. Recurring prime labels create dependencies in these walk expansions.
  Here the state contains active prime lists and a primitive lattice vector.
  At each prime $p$, root averaging gives a uniform projective line,
  so a specified line has probability $1 \/ \( p + 1 \)$. The memory preserves that line across gaps between
  active runs. Sections 3–4 develop this determinant geometry and prove the exact memory identity;
  Section 5 supplies the complementary major-term estimate.

===== 1.3 From marked correlations to the full law. <from-marked-correlations-to-the-full-law.>

The second estimate, Theorem 16, uses marks on both endpoints.
  We apply the general graph inputs of S to a centered long-prime divisor statistic and prove the required new
  endpoint Fourier estimates. A small mark restricts difficult frequencies to a sparse set;
  a long-prime polynomial controls the positive tuple term there, and a finite divisor model controls the constant term.

A first-moment presieve and the one-sided estimate replace all prime slots of the composite terms by rough slots.
  Successful marking groups then bring these composite terms within the two-sided estimate.
  Averaging over disjoint fixed marking arrays removes the marks from the prime average.
  This proves interior factorial-moment asymptotics for ordinary prime dyads.

Finally, sequential size-biased sampling turns the interior factorial measures into probability densities of total
  mass one. This excludes escape to the boundary and yields the stick fragments in (1.1).
  The expected undrawn mass controls sorting, and a finite dyadic decomposition gives all real upper endpoints.
  We provide this probability argument explicitly, since restricted-support moment formulas alone are not the
  statement of Theorem 1. Figure 1 summarizes the dependence of these steps.
  The two-sided endpoint analysis is in Section 6, the prime extraction and removal of marks in Section 7,
  and the probability argument in Section 8.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Determinant graph and signed memory#linebreak()Sections~3--4]]])])
  content((6.603, 0), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Dilation-graph inputs and endpoint estimates#linebreak()Section~6]]])])
  content((0, -1.83), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[One-sided marked correlation#linebreak()Theorem~3.1]]])])
  content((6.603, -1.83), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Two-sided marked correlation#linebreak()Theorem~6.1]]])])
  content((3.301, -3.96), [#box(width: 9.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Presieve, replacement of prime slots, and averaging of marks#linebreak()Interior factorial moments: Theorem~7.1]]])])
  content((3.301, -5.79), [#box(width: 9.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Size-biased sampling, full mass, and decreasing rearrangement#linebreak()Poisson--Dirichlet limit: Theorem~1.1]]])])
  line((0, -0.515), (0, -1.315), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((0, -0.915), [#text(size: 7pt)[major-term estimate#linebreak()Section~5]], anchor: "west", padding: 0.1176cm)
  line((6.603, -0.515), (6.603, -1.315), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -2.345), (-1.375, -3.445), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((6.603, -2.345), (7.978, -3.445), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.301, -4.475), (3.301, -5.275), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The proof has two analytic inputs. The one-sided estimate replaces prime slots in composite terms by rough slots. Successful marking brings the resulting centered statistic under the two-sided estimate. Averaging the fixed marks then gives interior moments; the probability argument recovers the full law. Appendix 9 supplies the long-prime and logarithmic-phase estimates used in the analytic branches. ],
) <fig:proof-map>

== 2 Conventions and analytic inputs <sec:inputs>

Throughout the proof $x$ is a real parameter tending to infinity, and

$ L = log x \, wide W = exp \( L^0.24 \) \, wide V \( W \) = product_(p lt.eq W) (1 - 1 / p) \, wide
  upright(e) \( t \) = exp \( 2 pi i t \) . $

A positive integer is #emph[rough] if none of its prime factors is at most $W$; we set $P^(-) \( 1 \) = oo$.
  Prime variables in explicitly indicated prime sums range only over primes.
  The functions $tau \( n \)$ and $tau_j \( n \)$ count divisors and ordered factorizations into $j$ positive
  integers, respectively. Dirichlet characters are zero on nonunits.
  We use $n asymp H$ for a fixed bounded enlargement of $\[ H \, 2 H \]$.

Every unspecified exponent of $L$ is fixed before $x$ tends to infinity.
  Constants may depend on previously fixed data. Whenever an exponent must be independent of a marking parameter,
  this is stated explicitly. The number of determinant pads in Sections 3–5 grows slowly with $L$;
  the padding parameter in Section 6 is instead a sufficiently large fixed integer. These are separate constructions.

We use the dilation-graph and ideal-kernel theorems of the companion #emph[Weighted dilation graphs,
  smooth shifted primes and totient fibers] #cite(label("SmoothShifted")), denoted S.
  Its complete text accompanies this article. Section 6 states the exact operator contracts and verifies their
  endpoint hypotheses. The long-prime and logarithmic-phase estimates stated below are proved in Appendix 9.
  Our presieving cutoff is always the $W$ defined above; it is not S’s cutoff $exp \( sqrt(log x) \)$.

=== 2.1 Prime estimates and mean squares <prime-estimates-and-mean-squares>

#thm([Lemma 2.1.])[
  (Prime estimates).  #emph[The prime number theorem holds with an error smaller than every fixed negative power
    of the logarithm. In particular, as $y arrow.r oo$,
$ sum_(p lt.eq y) 1 / p = log log y + c_M + o \( 1 \) \, wide
  product_(p lt.eq y) (1 - 1 / p) tilde.op frac(e^(- gamma_E), log y) \, $

 where $c_M$ and $gamma_E$ are constants. For fixed $A \, C > 0$,
   uniformly for $r lt.eq \( log y \)^C$ and $\( a \, r \) = 1$,
$ \# { p lt.eq y : p equiv a med \( mod med r \) } = frac("Li" \( y \), phi \( r \)) +
  O_(A \, C) #h(-0.16667em) (frac(y, \( log y \)^A)) . $

 The constants need not be effective.]
] <lem:prime-estimates>

These classical estimates follow from the quantitative prime number theorem, Siegel–Walfisz,
  and Mertens’ theorems; see #cite(label("TaoSW")) Corollary 39 and Exercises 40,
  64 and #cite(label("TaoMertens")) Theorems 15, 26. The harmonic asymptotic also follows by partial summation of
  the prime number theorem. Thus, for every fixed $a > 0$,

#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(exp \( L^a \) lt.eq p lt.eq exp \( 2 L^a \)) 1 / p = log 2 + o \( 1 \) . $ <eq:band-mass>]

We use prime asymptotics only on fixed positive-power ranges or on intervals for which taking differences of the
  stated estimates gives the required absolute error.

For the classical, stronger coefficient-independent mean-value theorem,
  see #cite(label("MontgomeryVaughan1974")) Theorem 2 and Corollary 3. We prove the weaker bounds needed here directly.

#thm([Lemma 2.2.])[
  (Divisor moments and Dirichlet mean squares).  #emph[For every fixed nonnegative integer $k$ there is $C_k$ such that
$ sum_(n lt.eq Y) tau \( n \)^k lt.double_k Y \( log \( 2 Y \) \)^(C_k) \, wide
  sum_(n lt.eq Y) frac(tau \( n \)^k, n) lt.double_k \( log \( 2 Y \) \)^(C_k) . $

 Let $P \( t \) = sum_(n lt.eq Y) c_n n^(i t)$. On every real interval $I$ of length $T gt.eq 0$,
#[#set math.equation(numbering: n => "(2.2)")
 $ integral_I \| P \( t \) \|^2 thin upright(d) t & lt.double \( T + Y log \( 2 Y \) \) sum_n \| c_n \|^2 \,\
sum_(t in cal(T)) \| P \( t \) \|^2 & lt.double \( T + 1 + Y log \( 2 Y \) \) \( log \( 2 Y \) \)^2 sum_n \|
  c_n \|^2 \, $ <eq:dirichlet-mean>]

 whenever $cal(T) subset I$ has mutual spacing at least one.
   The constants in these two inequalities are absolute and do not depend on how the coefficients were formed.]
] <lem:moment-bounds>

#proof[
  Unique factorization and positivity bound the harmonic divisor sum by
  $ product_(p lt.eq Y) sum_(a gt.eq 0) frac(\( a + 1 \)^k, p^a) =
    product_(p lt.eq Y) (1 + 2^k / p + O_k \( p^(- 2) \)) lt.double_k \( log \( 2 Y \) \)^(C_k) . $
  Multiplication by $Y$ gives the counting bound. For the continuous mean square, expand the square and integrate.
    The diagonal is $T sum_n \| c_n \|^2$. For $m eq.not n$, the integral has absolute value at most $2 \/ \|
    log \( n \/ m \) \| lt.double Y \/ \| n - m \|$. The inequality $2 \| c_n c_m \| lt.eq \| c_n \|^2 + \|
    c_m \|^2$ and the harmonic sum over $\| n - m \|$ give (2.2).
    On the unit interval centered at each point of $cal(T)$, the one-dimensional Sobolev inequality bounds $\|
    P \( t \) \|^2$ by a constant times the integral of $\| P \|^2 + \| P' \|^2$.
    These intervals have bounded overlap and lie in an interval of length $T + 1$.
    Apply the continuous estimate to $P$ and $P'$, whose coefficients are $i \( log n \) c_n$, to obtain (2.2). ◻
]

The coefficient-independent formulation in (2.2)–(2.2) is important:
  later a small-prime polynomial is raised to a growing power,
  whose coefficient norm is bounded separately by a factorial estimate.
  Fixed divisor moments alone are not applied at that growing order.

=== 2.2 Prime polynomials and logarithmic phases <prime-polynomials-and-logarithmic-phases>

#thm([Lemma 2.3.])[
  (Long prime polynomial).  #emph[Fix $0 < tau < eta < 1$ and $C \, A > 0$.
    There is $B_0 = B_0 \( tau \, eta \, C \, A \)$ such that, uniformly for
$ x^tau / 2 lt.eq N lt.eq x^eta \, wide q lt.eq L^C \, wide L^(B_0) lt.eq \| t \| lt.eq x^2 \, $

 every Dirichlet character $chi$ modulo $q$ and every interval $I subset \[ N \, 2 N \]$ satisfy
#[#set math.equation(numbering: n => "(2.3)")
 $ lr(|sum_(p in I) chi \( p \) p^(- 1 + i t)|) lt.double_(tau \, eta \, C \, A) L^(- A) . $ <eq:long-prime>]

]
] <lem:long-prime>

The complete proof is Lemma 23 in Appendix 9, with exactly the displayed ranges.
  Partial summation converts the reciprocal weight in (2.3) to normalization by $N$ on a dyadic interval.

#thm([Lemma 2.4.])[
  (Logarithmic phases on progressions).  #emph[Fix $C > 0$.
    There is an absolute constant $C_3 > 0$ such that, for sufficiently large $x$ in terms of $C$,
    the following holds uniformly:
$ exp #h(-0.16667em) (frac(L, \( log L \)^2)) lt.eq N lt.eq 2 x^5 \, quad q lt.eq L^C \, quad
  exp #h(-0.16667em) (frac(L, 2 \( log L \)^2)) lt.eq \| t \| lt.eq 4 x^3 . $

 For every residue $a med \( mod med q \)$ and every interval $I subset \[ N \, 2 N \]$,
#[#set math.equation(numbering: n => "(2.4)")
 $ lr(|sum_(n in I\
n equiv a med \( mod med q \)) n^(i t)|) lt.double N / q exp #h(-0.16667em) (- frac(L, \( log L \)^(C_3))) .
  $ <eq:log-phase>]

]
] <lem:log-phase>

The proof is Lemma 27 in Appendix 9. The estimate applies to arbitrary residue classes, not only units.
  At lower frequencies we use the elementary sum–integral comparison on a progression.
  For $N gt.eq x^delta$, $q lt.eq L^C$ and $1 lt.eq \| t \| lt.eq exp \( L \/ \( log L \)^2 \)$, it gives

#[#set math.equation(numbering: n => "(2.5)")
 $ q / N lr(|sum_(n in I\
n equiv a med \( mod med q \)) n^(i t)|) lt.double frac(1, \| t \|) + x^(- c_delta) \, $ <eq:moderate-phase>]

after decreasing $c_delta > 0$ if necessary. Indeed the integral is $O \( N \/ \( q \| t \| \) \)$,
  and the endpoint/total-variation error is $O \( 1 + \| t \| \)$.
  The same estimate holds after partial summation against a smooth factor with fixed logarithmic derivative costs,
  with those costs included in the implied logarithmic power.

=== 2.3 Elementary rough counts <elementary-rough-counts>

#thm([Lemma 2.5.])[
  (Rough integers in long intervals).  #emph[Fix $delta > 0$, $C > 0$, $0 < a < 1$ and $A > 0$.
    Suppose $x^delta lt.eq H lt.eq x^C$ and $I subset \[ H \, 2 H \]$ is an interval. Then
#[#set math.equation(numbering: n => "(2.6)")
 $ \# { n in I : P^(-) \( n \) > W } = V \( W \) \| I \| + O \( H L^(- A) \) . $ <eq:rough-count>]

 If $d lt.eq exp \( L^a \)$ and every prime divisor of $d$ exceeds $W$, then for every residue $b med \( mod med d \)$,
#[#set math.equation(numbering: n => "(2.7)")
 $ \# { n in I : n equiv b med \( mod med d \) \, med P^(-) \( n \) > W } = frac(V \( W \) \| I \|, d) +
   O #h(-0.16667em) (H / d L^(- A)) . $ <eq:rough-off-sieve-progression>]

 For every character $chi$ modulo $q lt.eq L^C$,
#[#set math.equation(numbering: n => "(2.8)")
 $ sum_(n in I\
P^(-) \( n \) > W) chi \( n \) = upright(bold(1))_(chi upright(" principal")) V \( W \) \| I \| +
  O \( H L^(- A) \) . $ <eq:rough-character>]

 All statements are uniform in the indicated intervals and residues.]
] <lem:rough-counts>

#proof[
  Use consecutive even and odd Bonferroni truncations for the events $p divides n$, $p lt.eq W$,
    at depths $h$ and $h + 1$, with $h asymp C_A log L$. Their divisors are at most
  $ W^(h + 1) = exp #scale(x: 120%, y: 120%)[\(] O_A \( L^0.24 log L \) #scale(x: 120%, y: 120%)[\)] = x^(o \( 1 \)) . $
  The number of divisor terms and their total absolute integer coefficient mass are also $x^(o \( 1 \))$.
    Counting each progression by its length divided by the modulus costs at most one per term.
    Writing $S_W = sum_(p lt.eq W) 1 \/ p = O \( log L \)$, the difference of the two model bounds is at most
  $ frac(S_W^(h + 1), \( h + 1 \) !) \, $
  which is smaller than any prescribed power of $L^(- 1)$ on choosing the fixed constant $C_A$ sufficiently large.
    The full model product is $V \( W \)$.
  For (2.7), each sieve divisor is coprime to $d$, so the Chinese remainder theorem gives main term $\|
    I \| \/ \( d e \)$ for the divisor $e$. The same omitted-degree bound is multiplied by $H \/ d$.
    The total endpoint error remains $x^(o \( 1 \))$, which is smaller than $\( H \/ d \) L^(- A)$, since $d =
    x^(o \( 1 \))$ and $H gt.eq x^delta$. This proves both counting formulas.
  For (2.8), first count a fixed unit residue class modulo $q$.
    Primes dividing $q$ are automatically absent; the model density in that progression is
  $ 1 / q product_(p lt.eq W\
p divides.not q) (1 - 1 / p) = frac(V \( W \), phi \( q \)) . $
  The endpoint and Bonferroni errors have arbitrary logarithmic precision, uniformly for $q lt.eq L^C$.
    Sum with the character over the unit residue classes, choosing the precision first to absorb their number.
    Character orthogonality gives the displayed answer. ◻
]

=== 2.4 A sieve for nonnegative weighted objects <a-sieve-for-nonnegative-weighted-objects>

#thm([Lemma 2.6.])[
  (Block sieve).  #emph[Consider finitely many objects with nonnegative weights and a bad condition at each of
    some designated primes $p lt.eq z$. Suppose that the total weight on which all conditions indexed by the
    primes dividing a squarefree $d$ hold is
$ X g \( d \) + r \( d \) \, $

 including $d = 1$, where $X gt.eq 0$, $g$ is multiplicative, and fixed $eta_0 > 0 \, C_0$ satisfy
$ 0 lt.eq g \( p \) lt.eq 1 - eta_0 \, wide sum_(w < p lt.eq w^2) g \( p \) lt.eq C_0 quad \( w > 1 \) . $

 For every sufficiently large even integer $h$, the weight avoiding all designated bad conditions is
#[#set math.equation(numbering: n => "(2.9)")
 $ X product_(p lt.eq z) \( 1 - g \( p \) \) #scale(x: 120%, y: 120%)[\(] 1 +
   O \( e^(- h) \) #scale(x: 120%, y: 120%)[\)] + O #h(-0.16667em) (sum_(d lt.eq z^(4 h + 2)\
d upright(" squarefree")) \| r \( d \) \|) . $ <eq:block-sieve>]

 Products and sums use only designated primes. Constants depend only on the density bounds and are uniform in $h$.
   For $h = 2$, an upper bound holds with a fixed constant times the main term and the same remainder sum.]
] <lem:block-sieve>

This is the block sieve of S #cite(label("SmoothShifted")) Lemma 2.9.
  Its upper and lower polynomials have coefficients of absolute value at most one,
  supported on squarefree $d lt.eq z^(4 h + 2)$; the upper polynomial is nonnegative.
  We will supply all needed remainder estimates for our particular weights.
  No assertion detecting primes from congruence information alone is included in this input.

== 3 A determinant estimate with marks on one side <det:section>

The first correlation estimate removes prime conditions from factors of the unmarked endpoint.
  Throughout this section and the next two sections, put

#[#set math.equation(numbering: n => "(3.1)")
 $ L = log x \, wide W = exp \( L^0.24 \) \, wide V \( W \) =
   product_(p lt.eq W) \( 1 - p^(- 1) \) . $ <det:parameters>]

An integer is #emph[rough] if it has no prime factor at most $W$.
  Fix disjoint groups consisting of all the primes in the bands

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(P)_i = { p : exp \( L^(a_i) \) lt.eq p lt.eq exp \( 2 L^(a_i) \) } \, wide
   0.1 < a_1 < dots.h.c < a_K < 0.2 . $ <det:bands>]

Here $K$ and the $a_i$ are fixed before $x$ tends to infinity. Write

#[#set math.equation(numbering: n => "(3.3)")
 $ V_i & = sum_(p in cal(P)_i) 1 / p \, & mu_i \( p \) & = frac(1, p V_i) \,\
omega_i \( h \) & = sum_(p in cal(P)_i) upright(bold(1))_(p divides h) \, & omega \( h \) & =
  sum_(i = 1)^K omega_i \( h \) . $ <det:marks>]

Lemma 2 and partial summation give $V_i = log 2 + o \( 1 \)$. For a fixed $q in \( 0 \, 1 \)$, the marked weight is

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(W) \( h \) = q^(omega \( h \) - K) product_(i = 1)^K frac(omega_i \( h \), V_i) . $ <det:weight>]

The weight is zero if some group supplies no divisor, and is bounded by a constant depending only on $K \, q$.
  Indeed, $q^(j - 1) j$ is bounded for positive integers $j$.

#thm([Theorem 3.1.])[
  (One-sided marked Type II estimate).  #emph[Fix $delta \, C \, D_(*) > 0$ and $q in \( 0 \, 1 \)$.
    Suppose $H_m \, H_n gt.eq x^delta$ and $X = H_m H_n asymp x$.
    Let $F$ satisfy $\| F \( h \) \| lt.eq 1$ and $F \( p h \) = F \( h \)$ for every prime in the groups (3.2).
    Let $alpha_m$ be supported on an arbitrary interval in $\[ H_m \, 2 H_m \]$, where it has the value
$ alpha_m =
  m^(i v)
  (upright(bold(1))_(m upright(" prime")) - frac(upright(bold(1))_(m upright(" rough")), V \( W \) log m)) \,
  wide \| v \| lt.eq L^C . $

 Let $beta_n$ be supported on rough integers in $\[ H_n \, 2 H_n \]$, with $\| beta_n \| lt.eq L^C$.
   If $K$ is sufficiently large in terms of $delta \, C \, D_(*) \, q$, then
#[#set math.equation(numbering: n => "(3.5)")
 $ lr(|sum_(m \, n) alpha_m beta_n F \( m n - 1 \) cal(W) \( m n - 1 \)|) lt.double X L^(- D_(*)) . $ <eq:type-II>]

 The required lower bound on $K$ is independent of the particular $a_i$.
   The implicit constant and the threshold for $x$ may depend on all the fixed parameters, including the $a_i$.]
] <thm:type-II>

We first give the reduction and geometric construction. The signed moment estimate is proved in Proposition 12;
  Proposition 13 estimates the resulting major term and completes the proof of the theorem.
  Exponents denoted $O_C \( 1 \)$ below can be chosen independently of $K$.
  A factor depending on a fixed $K$ is harmless, but a loss $L^(c K)$ would not be harmless at the final choice of
  $K$; we keep this distinction explicit.

=== 3.1 Cauchy’s inequality and the normalization of the square <cauchys-inequality-and-the-normalization-of-the-square>

Expand the product of the $omega_i$ by selecting one prime from each group, and denote their product by $b_0$.
  For $m n - 1 = b_0 h$, invariance gives $F \( m n - 1 \) = F \( h \)$.
  Except when some selected prime has square dividing $m n - 1$, one also has $omega \( h \) =
  omega \( m n - 1 \) - K$. The replacement of the original damping by $q^(omega \( h \))$ costs

#[#set math.equation(numbering: n => "(3.6)")
 $ O_A \( X L^(- A) \) wide upright("for every fixed ") A > 0 . $ <det:squareful-error>]

To verify this, the sum over labels of either nonnegative weight is $O_(K \, q) \( 1 \)$:
  removing $K$ distinct prime factors can lower $omega$ by at most $K$, so the new weight is at most the old one.
  For fixed $m$ and a group prime $p$, the congruence $m n equiv
  1 med \( mod med p^2 \)$ either has no solution or specifies one residue class of $n$.
  Since $H_n gt.eq x^delta gt.double p^2$, its count is $O \( H_n \/ p^2 \)$.
  Finally $sum_(i \, p in cal(P)_i) p^(- 2) lt.double_K exp \( - L^0.1 \)$.
  The coefficient bounds absorb only a fixed power of $L$, proving (3.6).

Choose a real smooth dyadic partition with factors $eta \( b_0 \/ Y \)$,
  where $eta$ is supported in $\[ 1 \, 4 \]$ and has bounded derivatives. There are $O_K \( L \)$ relevant $Y$, and

#[#set math.equation(numbering: n => "(3.7)")
 $ c L^0.1 lt.eq log Y lt.eq C_K L^0.2 . $ <det:Y-range>]

For a fixed factor of this partition the sum becomes

$ sum_(h lt.double X \/ Y) F \( h \) q^(omega \( h \)) sum_(m n - 1 = b_0 h\
b_0 = product_i p_i \, med p_i in cal(P)_i) (product_i V_i^(- 1)) eta \( b_0 \/ Y \) alpha_m beta_n . $

Cauchy’s inequality bounds its square by $O \( X \/ Y \)$ times the nonnegative expanded square

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(Q)_Y =  & (product_i V_i^(- 2)) sum_(a \, b \, m \, n \, r \, s\
m n - 1 = a h \, med r s - 1 = b h upright(" for some ") h) eta \( a \/ Y \) eta \( b \/ Y \) alpha_m
  overline(alpha_r) beta_n overline(beta_s) . $ <det:cauchy-square>]

Both $a$ and $b$ select one prime per group. In particular,
  proving $cal(Q)_Y lt.double X Y L^(- D_1)$ for arbitrarily large fixed $D_1$ is sufficient;
  the required $D_1$ depends on $C \, D_(*)$ but not on $K$.

We may first discard pairs $a \, b$ sharing a label. The elementary bound used here, uniform for $l asymp Y$, is

#[#set math.equation(numbering: n => "(3.9)")
 $ sum_(h lt.double X \/ Y) tau \( 1 + l h \)^2 lt.double \( X \/ Y \) L^3 . $ <det:progression-divisors>]

Indeed, $tau \( n \)^2 lt.eq tau_4 \( n \)$. In an ordered four-factor decomposition of an integer at most
  $O \( X \)$, deleting a largest factor leaves a product $d lt.double X^(3 \/ 4)$.
  There are at most $4 tau_3 \( d \)$ choices for the three retained factors and their positions.
  If $d divides 1 + l h$, then $\( d \, l \) = 1$, and $h$ lies in one progression modulo $d$.
  Consequently the left side of (3.9) is at most a constant times

$ sum_(d lt.double X^(3 \/ 4)) tau_3 \( d \) (frac(X, Y d) + 1) lt.double X / Y L^3 + X^(3 \/ 4) L^2 lt.double X /
  Y L^3 . $

These divisor estimates also follow from Lemma 3. For fixed $a \, b$,
  Cauchy’s inequality and (3.9) bound the absolute $h$-sum of the two representation counts by $\( X \/ Y \)
  L^(O_C \( 1 \))$. The number of pairs sharing a prime is

$ lt.double Y^2 sum_(i \, p in cal(P)_i) p^(- 2) lt.double_K Y^2 exp \( - L^0.1 \) \; $

here the number of integers in $\[ Y \, 4 Y \]$ divisible by $p$ is $O \( Y \/ p \)$.
  Thus the discarded part is $O_A \( X Y L^(- A) \)$.

For the remaining pairs $\( a \, b \) = 1$. Their two equations in (3.8) are equivalent to

#[#set math.equation(numbering: n => "(3.10)")
 $ t = b m n - a r s = b - a . $ <det:equation>]

In fact, the displayed equality gives $a divides m n - 1$ and $b divides r s - 1$,
  and the quotients agree and are positive.

Fix a real compactly supported smooth $psi$, equal to one on $\[ - 4 \, 4 \]$.
  For a fixed exponent $A_0 > 0$, let $frak(M)$ be the union, on $bb(R) \/ bb(Z)$, of the arcs

$ lr(|theta - h / k|) lt.eq frac(2 L^(A_0), Y) \, wide 1 lt.eq k lt.eq L^(A_0) \, quad \( h \, k \) = 1 . $

They are disjoint for large $x$. The replacement for (3.10) is

#[#set math.equation(numbering: n => "(3.11)")
 $ cal(H)_(frak(M)) \( t \; a \, b \) = psi \( t \/ Y \) integral_(frak(M)) upright(e)
   #scale(x: 120%, y: 120%)[\(] theta \( t - b + a \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta .
   $ <eq:det-major>]

In the ultimate major sum $a \, b$ need not be disjoint. The signed error in this replacement is controlled by the
  lift constructed next.

=== 3.2 Physical states, good positions, and endpoint vectors <physical-states-good-positions-and-endpoint-vectors>

Use the growing parameters

#[#set math.equation(numbering: n => "(3.12)")
 $ J = floor.l L^0.01 floor.r \, quad M = J + 1 \, quad R = ceil.l L^0.5 \/ 2 ceil.r \, quad N =
   2 R . $ <det:moment-parameters>]

An auxiliary list has $J$ primes per group; its product is denoted by $D$.
  Partition all possible $D$ into ordinary dyads $\[ d_0 \, 2 d_0 \)$.
  There are $O_K \( L \)$ such dyads and $log \( 2 d_0 \) lt.eq C_K L^0.21$. Fix one and put

#[#set math.equation(numbering: n => "(3.13)")
 $ H = d_0 Y \, wide U = H H_m \, wide V = H_n \, wide Omega = \[ U \, 16 U \] times \[ V \, 2 V \] .
   $ <det:physical-box>]

A #emph[physical state] is a primitive integer vector $P = \( P_1 \, P_2 \) in
  Omega$ together with an ordered list $bold(p)_i = \( p_(i \, 1) \, dots.h \, p_(i \, M) \)$ of distinct primes
  from $cal(P)_i$ for each $i$, all dividing $P_1$. Let $cal(H)$ be the Hilbert space on these states with measure

#[#set math.equation(numbering: n => "(3.14)")
 $ thin upright(d) sigma \( P \, bold(p) \) = product_(i = 1)^K V_i^(- M) quad
   upright("times counting measure") . $ <det:state-measure>]

Averaging independently over permutations of each list defines an orthogonal projection $cal(S)$ on $cal(H)$.

We now specify the row operation before symmetrization. Copy slots $1 \, dots.h \,
  J$ in every group from source to target; their product is $D$. The product of the source’s last slots is $b$.
  The target’s last slots are new labels with product $a$. Each new slot is summed with weight $V_i^(- 1)$;
  target positions are summed with counting measure. The labels shared across the edge are exactly the copied
  slots. Thus all unshared labels are distinct from one another and from every shared label,
  including across the two endpoints. This restriction will be called the #emph[cross-edge ban].
  Require $D in \[ d_0 \, 2 d_0 \)$ and $t = det \( P \, Q \) \/ D in bb(Z)$, and use the multiplier

#[#set math.equation(numbering: n => "(3.15)")
 $ cal(K) \( P \, Q \; D \, a \, b \) =  & d_0 / D eta \( b \/ Y \) eta \( a \/ Y \) psi \( t \/ Y \)\
 & times {upright(bold(1))_(t = b - a) - integral_(frak(M)) upright(e) #scale(x: 120%, y: 120%)[\(]
   theta \( t - b + a \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta}\
 & times q^(\( omega \( P_1 \) - K M \) \/ 2 + \( omega \( Q_1 \) - K M \) \/ 2) . $ <eq:det-kernel>]

Let $cal(T)$ be this row operation. All sums are finite. The adjoint reverses the row rule and conjugates its
  multiplier. Indeed, the joint measure of the two lists in an edge pairing is $product_i
  V_i^(- \( M + 1 \))$ in either direction: one factor $V_i^(- M)$ comes from (3.14),
  and one $V_i^(- 1)$ from the new slot.

After slot symmetrization, the copied products $D$ range over all choices obtained by omitting one prime from each
  full list and lying in the chosen pad dyad $\[ d_0 \, 2 d_0 \)$.
  Each of the $M^K$ omission tuples has weight $M^(- K)$ under the source symmetrization.

We next restrict the positions at which this row operation is used.
  The first restriction will keep the lattice determined by the shared labels from becoming too thin.
  The second separates phases associated with the omission choices;
  in the repeated-prime argument it will leave at most one compatible omission tuple.

For a primitive $P$, complete it to an integral matrix of determinant one,
  and let $r_P$ be the first coordinate of the second column divided by $P_1$, considered modulo one.
  Changing the completion adds an integer, so $r_P$ is well defined.
  A position with its full unordered lists is #emph[good] if the following hold.

+ For every $D in \[ d_0 \, 2 d_0 \)$ obtained by omitting one label per group, there is no integer $1 lt.eq
  l lt.eq Y^0.2$ such that $parallel l D r_P parallel_(bb(R) \/ bb(Z)) lt.eq Y^(- 0.7)$.
+ Let $I$ be any nonempty subset of the groups and $i_(*) = max I$.
  Draw one fresh prime in each group outside $I$, independently according to $mu_i$,
  and let $T_f$ be their product. Except for a set of these draws of probability at most
  $exp \( - 1 / 4 L^(a_(i_(*))) \)$, the points $D Z T_f r_P$ corresponding to all distinct integers $D
  Z$ are pairwise separated in circle distance by $100 exp \( - L^(a_(i_(*))) \)$.
  Here $D$ ranges over the omission products just described,
  and $Z$ selects one prime from each group in $I \\ { i_(*) }$.

Let $cal(G)$ be the projection onto good states. The definition is symmetric in the ordered slots,
  so $cal(G)$ commutes with $cal(S)$. We use the restricted, symmetrized operator

$ cal(A) = cal(G) cal(S) cal(T) cal(S) cal(G) . $

The first test is used in the lattice construction leading to (4.26);
  the second is used to prove the unique omission choice in the argument following (4.35).

#thm([Lemma 3.2.])[
  #emph[For any fixed lists, the set of $r in bb(R) \/ bb(Z)$ failing goodness has Lebesgue measure at most
    $exp \( - c L^0.1 \)$, for some $c > 0$ and all sufficiently large $x$.]
] <det:good-state>

#proof[
  There are at most $M^K$ omission products. The union bound for the first test is at most $2 M^K Y^(- 0.5)$,
    which has the required size by (3.7). For the second test fix $I \, T_f$. The number of trial integers $D Z$ is
  $ M^K product_(i in I \\ { i_(*) }) \| cal(P)_i \| = exp #scale(x: 120%, y: 120%)[\(] o \( L^(a_(i_(*))) \)
    #scale(x: 120%, y: 120%)[\)] . $
  For distinct $D Z \, D' Z'$, the integer $\( D Z - D' Z' \) T_f$ is nonzero.
    Multiplication by this integer preserves uniform measure on the circle.
    The measure on which this pair violates the required separation is therefore at most $200
    exp \( - L^(a_(i_(*))) \)$. Summing over pairs and then averaging over $T_f$ gives
    $exp \( - L^(a_(i_(*))) + o \( L^(a_(i_(*))) \) \)$. Markov’s inequality at the threshold
    $exp \( - 1 / 4 L^(a_(i_(*))) \)$ gives $exp \( - 3 / 4 L^(a_(i_(*))) + o \( L^(a_(i_(*))) \) \)$ for the
    exceptional set of $r$. There are only $2^K - 1$ possible $I$. ◻
]

We record precisely the vectors that recover the Cauchy square.
  At an endpoint require the complete part of $P_1$ supported on the group primes to be squarefree,
  with exactly $M$ primes from each group. Denote that part by $G \( P_1 \)$. Put

#[#set math.equation(numbering: n => "(3.16)")
 $ overline(f \( P \)) = alpha_(P_1 \/ G \( P_1 \)) overline(beta_(P_2)) \, wide g \( P \) =
   overline(alpha_(P_1 \/ G \( P_1 \))) beta_(P_2) \, $ <det:endpoints>]

and set these vectors to zero when the stated conditions or the coefficient supports fail.
  The vectors are constant on lists. In an edge contributing to their pairing, the coordinates are

#[#set math.equation(numbering: n => "(3.17)")
 $ P = \( D b m \, s \) \, wide Q = \( D a r \, n \) \, wide det \( P \, Q \) \/ D = b m n - a r s . $ <det:lift>]

No new restriction is imposed on the original coefficients:
  every $m \, r \, n \, s$ with nonzero coefficient is rough, and every group prime is below $W$.
  The damping in (3.15) equals one at these endpoints.

Their norms have the uniform bounds

#[#set math.equation(numbering: n => "(3.18)")
 $ parallel f parallel \, parallel g parallel lt.double \( U V \)^(1 \/ 2) L^(O_C \( 1 \)) \, wide sup \| f \| +
   sup \| g \| lt.double L^(O_C \( 1 \)) . $ <det:endpoint-norms>]

For example, at a fixed ordered list with product $G$, the number of possible positions is $O \( U V \/ G \)$,
  since $G = x^(o \( 1 \)) lt.double U$. Summing its reciprocal product with the state normalization gives

$ product_i V_i^(- M) sum_(p_(i \, 1) \, dots.h \, p_(i \, M) in cal(P)_i\
upright("distinct in each group")) product_(i \, j) 1 / p_(i \, j) lt.eq 1 . $

This proves (3.18) without a logarithmic exponent depending on $K$ or $J$.

Conversely, positions in (3.17) on the support of (3.15) are automatically primitive.
  A prime dividing both $D b m$ and $s$ cannot divide $D b$, by roughness.
  It would therefore divide $m \, s$ and be larger than $W$. It then divides $t = b m n - a r s$.
  The cutoff gives $\| t \| lt.double Y < W$, so $t = 0$. But $b m n = a r s$ is impossible:
  any prime in $b$ divides none of $a \, r \, s$. The same proof applies to $Q$.
  The ranges in (3.17) lie in (3.13) because $D in \[ d_0 \, 2 d_0 \)$ and $a \, b in \[ Y \, 4 Y \]$.

=== 3.3 From the moment to endpoint pairings <from-the-moment-to-endpoint-pairings>

For a primitive $P in Omega$, let $upright(bold(u))_P$ be one on every list at $P$ and zero at other positions.
  These vectors are not normalized. The estimate proved in Proposition 12 is, for any prescribed $E_0 > 0$,

#[#set math.equation(numbering: n => "(3.19)")
 $ frac(1, U V) sum_(P in Omega upright(" primitive")) chevron.l upright(bold(u))_P \, \( cal(A) cal(A)^(*) \)^R
   upright(bold(u))_P chevron.r lt.eq L^(- E_0 N) . $ <eq:det-moment>]

First $A_0$ and then $K$ are chosen sufficiently large; thresholds in absolute errors may subsequently depend on
  the fixed group exponents. We prove here the consequence

#[#set math.equation(numbering: n => "(3.20)")
 $ \| chevron.l f \, cal(A) g chevron.r \| lt.double U V L^(- E_0 + O_C \( 1 \)) . $ <eq:det-pairing>]

Partition positions into half-open intervals of the slope $P_2 \/ P_1$ of length $H \/ U^2$.
  A nonzero edge has $\| det \( P \, Q \) \| lt.double H$, so only a bounded number of neighboring intervals can
  interact. Each interval contains $O \( H \)$ primitive positions. To see this, choose a primitive pivot in it.
  Its determinant with any other position in the interval is an integer of size $O \( H \)$.
  With that determinant fixed, all integer solutions differ by integral multiples of the pivot;
  the first coordinate ranges over $\[ U \, 16 U \]$, permitting $O \( 1 \)$ multiples.

Let $f_j$ be $f$ restricted to one interval, and $g_j$ the restriction of $g$ to its interacting neighbors.
  Set $B_0 = cal(A) cal(A)^(*)$ and

$ d_j = sum_(P upright(" in interval ") j) chevron.l upright(bold(u))_P \, B_0^R upright(bold(u))_P chevron.r . $

The matrix $C_(P Q)^(\( j \)) = chevron.l upright(bold(u))_P \,
  B_0^R upright(bold(u))_Q chevron.r$ is positive semidefinite on the ordinary coefficient space.
  Its largest eigenvalue is at most its trace $d_j$, irrespective of the norms or orthogonality of the testing
  vectors. Since $f_j = sum_P f \( P \) upright(bold(u))_P$, this gives

#[#set math.equation(numbering: n => "(3.21)")
 $ chevron.l f_j \, B_0^R f_j chevron.r lt.eq d_j sum_P \| f \( P \) \|^2 lt.double H sup \| f \|^2 d_j .
   $ <det:compression>]

Spectral Hölder for the positive operator $B_0$, followed by Cauchy’s inequality, now gives

$ \| chevron.l f_j \, cal(A) g_j chevron.r \| lt.eq parallel g_j parallel thin parallel f_j parallel^(1 - 1 \/ R)
  #scale(x: 120%, y: 120%)[\(] C H sup \| f \|^2 d_j #scale(x: 120%, y: 120%)[\)]^(1 \/ \( 2 R \)) . $

Hölder’s inequality in $j$, with exponents $2 \, 2 R \/ \( R - 1 \) \, 2 R$, and bounded overlap of the $g_j$ imply

$ \| chevron.l f \, cal(A) g chevron.r \| lt.double parallel g parallel thin parallel f
  parallel^(1 - 1 \/ R) \( C H sup \| f \|^2 \)^(1 \/ \( 2 R \)) (sum_j d_j)^(1 \/ \( 2 R \)) . $

By (3.7) and (3.13), $log H = O_K \( L^0.21 \)$, so $H^(1 \/ N) = O \( 1 \)$.
  Equations (3.19) and (3.18) prove (3.20). This argument uses the unnormalized trace in (3.19);
  no normalization by the number of lists has been introduced.

=== 3.4 Uniform residues at a primitive root <uniform-residues-at-a-primitive-root>

The root average in (3.19) will be replaced by independent projective residue lines.
  We give an elementary count that works even when the two coordinate scales are comparable.
  For a primitive $\( u \, v \)$ in $Omega$ there is a unique completion

#[#set math.equation(numbering: n => "(3.22)")
 $ g = mat(delim: "(", u, c; v, d) \, wide u d - v c = 1 \, wide 0 lt.eq c < u . quad upright("Put ") r =
   c \/ u . $ <det:root-matrix>]

#thm([Lemma 3.3.])[
  (Root residues).  #emph[There is $c_delta > 0$ such that the following holds.
    Let $S$ be squarefree with $S lt.eq exp \( C_K L^0.98 \)$,
    and prescribe $g_0 in upright("SL")_2 \( bb(Z) \/ S bb(Z) \)$.
    If $I_1 \, I_2 \, I_3$ are intervals in $\[ 1 \, 16 \] \, \[ 1 \, 2 \] \, \[ 0 \, 1 \]$, respectively,
    the number of primitive roots satisfying
$ u \/ U in I_1 \, wide v \/ V in I_2 \, wide r in I_3 \, wide g equiv g_0 med \( mod med S \) $

 is
#[#set math.equation(numbering: n => "(3.23)")
 $ frac(U V thin \| I_1 \| \| I_2 \| \| I_3 \|, zeta \( 2 \) \| upright("SL")_2 \( bb(Z) \/ S bb(Z) \) \|) +
   O \( U V x^(- c_delta) \) . $ <det:root-residue-count>]

 The error is uniform in the intervals and in $g_0$.]
] <lem:root-residue>

#proof[
  We first prove the elementary exponential-sum estimate needed for the count. For $m gt.eq 1$ put
  $ K_m \( h \, k \) = sum_(y in \( bb(Z) \/ m bb(Z) \)^times) upright(e) (frac(h y + k y^(- 1), m)) . $
  Orthogonality shows that $sum_(h \, k med mod med m) \| K_m \( h \, k \) \|^4 = m^2 T_m$,
    where $T_m$ counts unit quadruples $\( y_1 \, y_2 \, z_1 \, z_2 \)$ with equal sums and equal inverse sums.
    The first relation determines $z_2 = y_1 + y_2 - z_1$. After multiplying the inverse-sum relation by the
    product of the four units, one obtains
  $ m divides \( y_1 + y_2 \) \( z_1 - y_1 \) \( z_1 - y_2 \) . $
  The map from the three free residues to these three linear forms has determinant of absolute value two,
    and its kernel modulo $m$ has size at most two. Distribute, prime by prime,
    the valuation of $m$ among the three factors. There are $tau_3 \( m \)$ distributions $d_1 d_2 d_3 = m$;
    for each, the number of triples of forms with the prescribed divisibilities is $m^3 \/ \( d_1 d_2 d_3 \) =
    m^2$. Consequently $T_m lt.eq 2 m^2 tau_3 \( m \)$.
  The value of $K_m \( h \, k \)$ is constant on the unit-scaling orbit $\( h \, k \)
    mapsto \( h s \, k s^(- 1) \)$. If $g = \( h \, k \, m \)$, its stabilizer consists of the units $s equiv
    1 med \( mod med m \/ g \)$, so the orbit has $phi \( m \/ g \) gt.eq \( m \/ g \) m^(- o \( 1 \))$ elements.
    Dividing the fourth moment bound by this orbit size gives
  #[#set math.equation(numbering: n => "(3.24)")
   $ \| K_m \( h \, k \) \| lt.double m^(3 \/ 4 + o \( 1 \)) \( h \, k \, m \)^(1 \/ 4) . $ <det:weak-kloosterman>]
  Only the elementary bounds $tau_3 \( m \) = m^(o \( 1 \))$ and $phi \( m \) gt.eq m^(1 - o \( 1 \))$ enter here;
    both follow by separating the finitely many small primes from the remaining prime factors.
  Suppose first $U lt.eq V$. Write the entries of the prescribed matrix as $u_0 \, c_0 \, v_0 \, d'_0$;
    the prime on $d'_0$ distinguishes it from the pad scale. Fix $u equiv u_0 med \( mod med S \)$.
    Modulo $m_0 = u S$, the required pairs $\( c \, v \)$ satisfy
  #[#set math.equation(numbering: n => "(3.25)")
   $ c equiv c_0 med \( mod med S \) \, quad v equiv v_0 med \( mod med S \) \, quad c v equiv u d'_0 -
     1 med \( mod med u S \) . $ <det:fixed-u-congruences>]
  There are exactly
  #[#set math.equation(numbering: n => "(3.26)")
   $ M \( u \) = u product_(p divides u\
p divides.not S) \( 1 - p^(- 1) \) $ <det:fixed-u-mass>]
  such pairs. Indeed, the admissible $c$ must be coprime to $u$.
    At primes common to $u \, S$ this is forced by $u_0 d'_0 - c_0 v_0 = 1$ modulo $S$;
    at other primes the indicated Euler factors count the admissible $c$ in its progression.
    For any such $c$, writing $v = v_0 + S j$ reduces the last congruence to a linear congruence modulo $u$ with
    invertible coefficient $c$, and hence determines exactly one $j med \( mod med u \)$.
  These $M \( u \)$ pairs have discrepancy
  #[#set math.equation(numbering: n => "(3.27)")
   $ O \( u^0.99 S^2 \) $ <det:modular-discrepancy>]
  for rectangles in the torus $\( c \/ \( u S \) \, v \/ \( u S \) \)$. Here are details of the uniformity in $S$.
    Put $S_1 = product_(p divides \( S \, u \)) p$ and $S_2 = S \/ S_1$.
    The Chinese remainder theorem fixes $\( c \, v \)$ modulo $S_2$ and leaves an inverse graph modulo $m_1 =
    u S_1$. Write $a' = u d'_0 - 1$ and $gamma = S_2^(- 1) med \( mod med m_1 \)$; both are units modulo $m_1$.
    On the inverse graph $c v = a'$ the condition $c equiv c_0 med \( mod med S_1 \)$ already forces $v equiv
    v_0 med \( mod med S_1 \)$, since $c_0$ is a unit there. Additive orthogonality thus gives the Fourier sum,
    up to a constant of absolute value one, as
  #[#set math.equation(numbering: n => "(3.28)")
   $ 1 / S_1 sum_(j med mod med S_1) upright(e) \( - j c_0 \/ S_1 \) K_(m_1) \( gamma h + j u \, gamma k a' \) .
     $ <det:CRT-Fourier>]
  For $0 < max \( \| h \| \, \| k \| \) lt.eq u^0.02$,
  $ \( gamma h + j u \, gamma k a' \, m_1 \) lt.eq S_1 \( h \, k \, u \) lt.eq S_1 u^0.02 . $
  Using the exponent $3 \/ 4 + 1 \/ 200$ in (3.24), each nonzero sum (3.28) is therefore $O \( u^0.76 S^2 \)$.
  For completeness, sandwich each interval indicator between smooth upper and lower functions obtained by
    enlarging or contracting the interval by $2 u^(- 0.01)$ and convolving with a probability bump of width
    $u^(- 0.01)$. Their zeroth coefficients differ from the interval length by $O \( u^(- 0.01) \)$.
    Their Fourier coefficients are bounded. There are $O \( u^0.04 \)$ retained frequency pairs,
    whose total cost is $O \( u^0.80 S^2 \)$. For explicit control of the tail, if $Delta = u^(- 0.01)$ and $T_1 =
    u^0.02$, ten integrations by parts give a double Fourier tail outside $max \( \| h \| \, \| k \| \) lt.eq
    T_1$ bounded by $O \( Delta^(- 11) T_1^(- 9) \) = O \( u^(- 0.07) \)$.
    The trivial bound $M \( u \) lt.eq u$ makes its contribution $O \( u^0.93 \)$.
    The error from the zeroth coefficient is $O \( u^0.99 \)$. This proves (3.27).
  The $c$ interval has length $u \| I_3 \|$, and the $v$ interval has length $V \| I_2 \|$.
    If the latter passes through several periods of length $u S$, apply the rectangle count to each;
    the number of pieces is $O \( V \/ u + 1 \)$. Equations (3.26)–(3.27) give the fixed-$u$ main term
  $ frac(V \| I_2 \| \| I_3 \|, S^2) product_(p divides u\
p divides.not S) \( 1 - p^(- 1) \) $
  and error $O \( \( V \/ u + 1 \) u^0.99 S^2 \)$. For $u asymp
    U$ the sum of these errors is $O \( U V U^(- 0.01) S^2 \)$.
  It remains to average the Euler factor in the progression of $u$.
    Expanding it as $sum_(l divides u \, \( l \, S \) = 1) mu \( l \) \/ l$ gives
  $ sum_(u \/ U in I_1\
u equiv u_0 med \( S \)) product_(p divides u\
p divides.not S) \( 1 - p^(- 1) \) = frac(U \| I_1 \|, S) sum_(\( l \, S \) = 1) frac(mu \( l \), l^2) +
  O \( log \( 2 U \) \) . $
  The tail beyond $16 U$ contributes $O \( 1 \/ S \)$ and is covered by the error.
    The series equals $zeta \( 2 \)^(- 1) product_(p divides S) \( 1 - p^(- 2) \)^(- 1)$.
    Counting first columns and their completions over each field shows
  #[#set math.equation(numbering: n => "(3.29)")
   $ \| upright("SL")_2 \( bb(Z) \/ S bb(Z) \) \| = S^3 product_(p divides S) \( 1 - p^(- 2) \) . $ <det:SL-order>]
  This proves the stated main term. Since $U gt.eq x^delta$ and $S^2 = x^(o \( 1 \))$,
    all the errors admit a saving $x^(- c_delta)$; for example, $c_delta = delta \/ 1000$ is sufficient.
  If $V < U$, fix $v$ instead and apply the same argument to the congruence $u d equiv 1 +
    v c_0 med \( mod med v S \)$, with the roles of the coordinates reversed and determinant sign reversed.
    Use $d \/ v$ as the third coordinate. For $u \, v > 1$ both $c \/ u$ and $d \/ v$ belong to $\[ 0 \, 1 \)$, and
  $ d / v - c / u = frac(1, u v) . $
  Enlarging and contracting the prescribed interval by $O \( \( U V \)^(- 1) \)$ changes its main mass by
    $O \( 1 \)$ and its count by the already available discrepancy. The same formula follows. ◻
]

=== 3.5 Independent residue lines and the archimedean error budget <independent-residue-lines-and-the-archimedean-error-budget>

Expand (3.19) as a path with $N$ edges, returning to its initial position but with no return condition on the
  lists. In the basis (3.22), each position is $g z$ with primitive $z in bb(Z)^2$,
  and the initial and final vectors are $e_1 = \( 1 \, 0 \)$. Put $tau \( z \) = z_1 + r z_2$.
  The cutoff and the physical box imply

#[#set math.equation(numbering: n => "(3.30)")
 $ \| z_2 \| lt.double N H \, wide \| z_1 \| lt.double N H \, wide tau \( z \) asymp 1 . $ <det:tube>]

Indeed, one edge changes slope by $O \( H \/ U^2 \)$; summing at most $N$ changes gives $z_2 =
  det \( \( u \, v \) \, g z \) = O \( N H \)$. Also $\( g z \)_1 = u tau \( z \) asymp U$,
  which proves the remaining claims. For a group prime $p$,
  the condition $p divides \( g z \)_1$ means that the projective line $\[ z \]_p$ equals the kernel line of the
  first row of $g$ modulo $p$.

#thm([Lemma 3.4.])[
  (Replacement of the root average).  #emph[In the normalized path expansion of (3.19),
    one may replace the root average by
$ frac(1, zeta \( 2 \)) integral_(\[ 1 \, 16 \] times \[ 1 \, 2 \] times \[ 0 \, 1 \]) thin
  upright(d) \( u \/ U \) thin thin upright(d) \( v \/ V \) thin thin upright(d) r $

 and by independent uniformly distributed lines in $bb(P)^1 \( bb(F)_p \)$ for all the group primes.
   The real matrix at an archimedean root is
$ g \( u \, v \, r \) = mat(delim: "(", u, u r; v, v r + 1 \/ u) . $

 All box and good-state conditions are retained. The total error is $O_A \( L^(- A N) \)$ for every fixed $A > 0$.
   The same assertion, with polynomial logarithmic coefficient bounds,
   holds for one edge and for failure of either endpoint’s goodness.]
] <det:root-replacement>

#proof[
  We specify both the combinatorial and the archimedean budgets.
    There are $exp \( O_K \( L^0.73 \) \)$ choices for paths $z$ satisfying the size bounds in (3.30),
    labels of all visits, and slot permutations. For example,
    the logarithm of the number of position paths is $O \( N log \( N H \) \) = O_K \( L^0.71 \)$;
    the label choices have logarithm at most $O_K \( N M L^0.2 \) = O_K \( L^0.71 \)$;
    and the permutations cost $O_K \( N M log M \)$. These also bound the total absolute coefficients after
    dropping congruences and bounded damping. The product of the primes active anywhere on a path has logarithm
    $O_K \( L^0.72 \)$.
  Keep the exact factors of the primes active at some visit.
    At the other primes the joint damping can be written $1 - X_p$, where $0 lt.eq X_p lt.eq 1$.
    Here the damping exponent at an endpoint is $q_j = sqrt(q)$ and at an interior visit is $q_j = q$.
    In the independent-line model,
  $ sum_p bb(E) X_p lt.eq sum_p sum_(j = 0)^N frac(1 - q_j, p + 1) lt.double_K N + 1 . $
  Upper and lower Bonferroni polynomials of consecutive degrees near $T =
    ceil.l L^0.76 ceil.r$ sandwich $product_p \( 1 - X_p \)$ pointwise. Their expected difference is at most
  $ frac(\( C_K \( N + 1 \) \)^T, T !) = exp #scale(x: 120%, y: 120%)[\(] -
    Omega \( L^0.76 log L \) #scale(x: 120%, y: 120%)[\)] . $
  The product inequality is ordinary inclusion–exclusion, applied to numbers in $\[ 0 \, 1 \]$;
    it requires no independence for the pointwise sandwich. Independence between different residue lines is used
    only to estimate its gap. This gap absorbs the $exp \( O_K \( L^0.73 \) \)$ path and coefficient budget.
  Each monomial in the truncated expressions requires residues at the active primes and at most $T$ further
    primes. Its squarefree modulus satisfies $log S = O_K \( L^0.96 \)$, and hence lies in the range of Lemma 10.
    The total number of monomials, prime choices, and residue matrices is $exp \( o \( L \) \)$.
    The uniform distribution on $upright("SL")_2 \( bb(Z) \/ S bb(Z) \)$ factors over the primes by the Chinese
    remainder theorem. At each prime its first row is uniform among nonzero rows,
    and its kernel is uniform among the $p + 1$ projective lines.
    This is exactly the asserted independent model, with primitive-root density $1 \/ zeta \( 2 \)$.
  We next make the archimedean conditions compatible with interval counts.
    Choose an integral complement $w$ to each primitive $z$, with $det \( z \, w \) =
    1$ and $\| w \| lt.double 1 + \| z \|$. The ratio for the position $g z$ is
  #[#set math.equation(numbering: n => "(3.31)")
   $ r_(g z) = frac(tau \( w \), tau \( z \)) med \( mod med 1 \) . $ <det:transported-ratio>]
  On $tau \( z \) asymp 1$ its derivative in $r$ is $1 \/ tau \( z \)^2$.
    The good tests are therefore constant except at $exp \( o \( L \) \)$ values of $r$:
    enumerate every product and fresh draw in the tests, every pair of distinct integers $D Z$,
    and the integer translates in each circle inequality. All their numbers and sizes are $exp \( o \( L \) \)$.
    The exceptional-probability condition in the second good test is also constant between these endpoints,
    because it is a finite weighted sum of such indicators.
  The physical coordinates are
  #[#set math.equation(numbering: n => "(3.32)")
   $ \( g z \)_1 = u tau \( z \) \, wide \( g z \)_2 = v tau \( z \) + z_2 \/ u . $ <det:transported-position>]
  The normalized box faces consequently have derivatives bounded by $exp \( o \( L \) \)$.
    Near a first-coordinate face the derivative in $u \/ U$ is bounded below,
    and near a second-coordinate face the derivative in $v \/ V$ is bounded below, because $tau \( z \) asymp 1$.
    One may first exclude $tau \( z \)$ near zero, which is incompatible with the first-coordinate box condition.
    Thus the union of cubes meeting any face or good-test boundary has volume at most
    $x^(- epsilon.alt_delta + o \( 1 \))$ on a grid of side $x^(- epsilon.alt_delta)$ in $\( u \/ U \, v \/ V \, r \)$.
  Choose the grid exponent only after the saving in Lemma 10; concretely take $epsilon.alt_delta = c_delta \/ 8$.
    The grid has $O \( x^(3 epsilon.alt_delta) \)$ cubes, not a subpower number.
    Summing all root-count errors, including the $exp \( o \( L \) \)$ discrete choices, costs at most
  #[#set math.equation(numbering: n => "(3.33)")
   $ U V x^(- c_delta + 3 epsilon.alt_delta + o \( 1 \)) = U V x^(- 5 c_delta \/ 8 + o \( 1 \)) .
     $ <det:grid-discrepancy>]
  The main mass of boundary cubes is at most
  #[#set math.equation(numbering: n => "(3.34)")
   $ U V x^(- epsilon.alt_delta + o \( 1 \)) = U V x^(- c_delta \/ 8 + o \( 1 \)) . $ <det:grid-boundary>]
  Their discrepancy is already included in (3.33). On each remaining cube all archimedean indicator conditions are
    fixed. The edge factors in (3.15) depend, after fixing labels,
    on $det \( z \, z' \) \/ D$ and hence do not vary with the root;
    the finite residue factors have already been handled. This proves the replacement with a fixed-power error
    after normalization. Such an error is $O_A \( L^(- A N) \)$, since $N asymp L^0.5$.
    The one-edge versions have smaller enumeration budgets and use the same proof. ◻
]

It remains to bound the signed independent-line path expansion.
  The next section keeps the precise correlations caused by a prime that leaves an active list and later returns,
  proves (3.19), and then removes the good-state projections and the auxiliary pads.
  This yields the replacement of (3.8) by (3.11) with error $O_A \( X Y L^(- A) \)$.

== 4 Signed memory and the determinant moment <mem:section>

We retain the notation, physical state space, good-state tests, and operator $cal(A)$ of the preceding section.
  In particular, the number $J = floor.l L^.01 floor.r$ of pads per group grows with $x$, $M = J + 1$, and $N =
  2 R asymp L^.5$. All constants depending on the fixed number $K$ of groups are allowed to affect the threshold
  for $x$. We will explicitly distinguish those constants from powers of $L$.

#thm([Proposition 4.1.])[
  (The minor-arc moment).  #emph[For every fixed $E_0 > 0$,
    one can choose $A_0$ sufficiently large and then $K$ sufficiently large, in terms of $E_0 \,
    q$ and the fixed parameters of Theorem 8, so that the operator with the good-state projections satisfies
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(1, U V) sum_(P in Omega\
P med upright("primitive")) chevron.l upright(bold(u))_P \, \( cal(A) cal(A)^(*) \)^R upright(bold(u))_P chevron.r
  lt.eq L^(- E_0 N) . $ <mem:moment-bound>]

 The choices of $A_0 \, K$ do not depend on the particular fixed band exponents $a_1 < dots.h.c < a_K$;
   the threshold for $x$ may depend on them. Consequently, for any prescribed fixed $A > 0$,
   the determinant indicator in the expanded square of the preceding section can be replaced by (3.11),
   with error $O_A \( X Y L^(- A) \)$. In the resulting major term the disjointness restriction on the two
   unshared products $a \, b$ can be omitted. Equivalently, with the notation of (3.8) and (5.1),
#[#set math.equation(numbering: n => "(4.2)")
 $ lr(|cal(Q)_Y - cal(Q)_Y^(upright("maj"))|) lt.double_A X Y L^(- A) . $ <mem:replacement-interface>]

 The precision needed in the pairing estimate (3.20) for this consequence is independent of $K$.]
] <prop:minor-moment>

The proof constructs operators which remember a prime between two of its uses.
  The construction has a resemblance to the lifespan expansion in #cite(label("SmoothShifted")) Section 3;
  the primewise identity and every operator estimate needed here are proved below for the determinant graph.

=== 4.1 The exact primewise identity <the-exact-primewise-identity>

Apply Lemma 11 to the expansion of the left side of (4.1).
  We work for now at a fixed archimedean root and with independent uniform kernel lines at the group primes.
  Write the path as $z_0 \, dots.h \, z_N$, where $z_0 = z_N = e_1$;
  all the $z_j$ are primitive and satisfy the tube and box conditions of (3.30). Put

#[#set math.equation(numbering: n => "(4.3)")
 $ q_j = cases(delim: "{", sqrt(q) \, & j = 0 \, N \,, q \, & 0 < j < N \,) wide eta'_j = 1 - q_j \, wide b'_p =
   1 - frac(sum_(j = 0)^N eta'_j, p + 1) \, wide nu_i \( p \) =
   frac(1, V_i \( p + 1 \) b'_p) quad \( p in cal(P)_i \) . $ <mem:baseline>]

Thus $b'_p > 0$ for large $x$. With $p_min = min union.big_i cal(P)_i$, we have

#[#set math.equation(numbering: n => "(4.4)")
 $ frac(nu_i \( p \), mu_i \( p \)) = 1 + O #h(-0.16667em) (frac(N + 1, p)) \, wide s_i :=
   sum_(p in cal(P)_i) nu_i \( p \) = 1 + O #h(-0.16667em) (frac(N + 1, p_min)) \, wide
   sup_(i \, p) nu_i \( p \) lt.eq C_K e^(- L^.1) . $ <mem:measure-masses>]

The estimates are uniform in the path. Here and below $C_K$ can also depend on $q$ and on fixed smooth cutoffs.

For one prime $p$, let $A_p$ be its set of active visits, namely the visits where $p$ occurs in the active list.
  For a line $ell in bb(P)^1 \( bb(F)_p \)$ set $H_j \( ell \) = upright(bold(1))_(ell = \[ z_j \]_p)$.
  Before active-list normalizations, its factor in the independent-line expectation is exactly

#[#set math.equation(numbering: n => "(4.5)")
 $ frac(1, p + 1) sum_(ell in bb(P)^1 \( bb(F)_p \)) product_(j in A_p) H_j \( ell \)
   product_(j in.not A_p) \( 1 - eta'_j H_j \( ell \) \) . $ <mem:prime-factor>]

Indeed the physical damping charges $q_j$ precisely when the prime divides the first coordinate at visit $j$
  without belonging to its active list.

First suppose $A_p = diameter$. Expand the product in (4.5). The empty and singleton subsets contribute $b'_p$.
  In every larger subset fix its first and last indices $a < c$; the sum over all choices of internal indices gives

#[#set math.equation(numbering: n => "(4.6)")
 $ b'_p + frac(1, p + 1) sum_(0 lt.eq a < c lt.eq N) eta'_a eta'_c thin
   upright(bold(1))_(\[ z_a \]_p = \[ z_c \]_p) product_(a < j < c) #scale(x: 120%, y: 120%)[\(] 1 -
   eta'_j upright(bold(1))_(\[ z_j \]_p = \[ z_a \]_p) #scale(x: 120%, y: 120%)[\)] . $ <mem:orphan-identity>]

After division by $b'_p$, a summand is a lifespan beginning with a ghost at $a$ and ending with a ghost at $c$.
  It has one factor $\( \( p + 1 \) b'_p \)^(- 1)$, one factor $- eta'_j$ at each endpoint,
  and a factor $q_j$ at each strictly internal visit that hits its line. There is no lifespan with just one ghost:
  all singleton terms have already been included in the baseline.

Next suppose $A_p eq.not diameter$. If its active lines disagree, the factor is zero.
  Otherwise let $ell$ be their common line and put $a = min A_p$, $c = max A_p$.
  This line is chosen with probability $1 \/ \( p + 1 \)$. The inactive visits between $a$ and $c$ retain their
  damping factors. The products outside this interval have the exact identities

#[#set math.equation(numbering: n => "(4.7)")
 $ product_(j < a) \( 1 - eta'_j H_j \( ell \) \) & = 1 - sum_(h < a) eta'_h H_h \( ell \)
   product_(h < j < a) \( 1 - eta'_j H_j \( ell \) \) \,\
product_(j > c) \( 1 - eta'_j H_j \( ell \) \) & = 1 - sum_(h > c) eta'_h H_h \( ell \)
  product_(c < j < h) \( 1 - eta'_j H_j \( ell \) \) . $ <mem:prefix>]

These follow by telescoping a finite product, in opposite orders at the two ends.
  They attach either no ghost or one ghost extension to each end of the active interval.
  Every inactive internal hit then pays $q_j$, and each chosen ghost endpoint pays $- eta'_j$.

Extract $product_p b'_p lt.eq 1$ over all group primes. Equations (4.6)–(4.7) show that every term of the
  expansion assigns at most one lifespan to each prime. All active visits and ghost endpoints of a lifespan must
  have the same line. Its probability $1 \/ \( p + 1 \)$, together with division by $b'_p$,
  contributes the factor $\( \( p + 1 \) b'_p \)^(- 1)$ exactly once.
  The remaining factors are the damping at inactive internal visits and the active-list normalization.
  An #emph[active run] is a maximal interval of consecutive active visits.
  The ban in the physical edge ensures that a prime active at two consecutive visits is continued in a shared
  slot. Thus a lifespan in group $i$ with $r$ active runs has factor

#[#set math.equation(numbering: n => "(4.8)")
 $ frac(V_i^(- r), \( p + 1 \) b'_p) $ <mem:run-charge>]

before its ghost signs and internal damping. The power of $V_i^(- 1)$ counts active runs;
  the line probability is paid only once.

A lifespan retains its prime and line while the prime is outside the active list;
  call such a retained prime #emph[pending]. At a strictly internal inactive visit it is a hit if $\[ z_j \]_p$
  equals that line, and a miss otherwise. The prime keeps the same line across both kinds of visit.
  Figure 2 shows how one lifespan can join two active runs across a pending hit and a pending miss.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (11.48, 0), stroke: (paint: rgb("#737373"), thickness: 0.8pt, miter-limit: 10))
  line((1.64, 0), (3.28, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((0, 0.23), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  content((1.64, 0.23), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((3.28, 0.23), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((4.92, 0.23), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  content((6.56, 0.23), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  content((8.2, 0.23), [#text(size: 9pt)[$5$]], anchor: "south", padding: 0.1176cm)
  content((9.84, 0.23), [#text(size: 9pt)[$6$]], anchor: "south", padding: 0.1176cm)
  content((11.48, 0.23), [#text(size: 9pt)[$7$]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.05, fill: rgb("#d9d9d9"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  circle((1.64, 0), radius: 0.1197, fill: rgb("#bfbfff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.28, 0), radius: 0.1197, fill: rgb("#bfbfff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((4.92, 0), radius: 0.1197, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  circle((6.56, 0), radius: 0.1197, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((8.2, 0), radius: 0.1197, fill: rgb("#bfbfff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((9.84, 0), radius: 0.1197, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  circle((11.48, 0), radius: 0.05, fill: rgb("#d9d9d9"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((0, -0.22), [#text(size: 7pt)[ghost#linebreak()birth]], anchor: "north", padding: 0.1176cm)
  content((1.64, -0.22), [#text(size: 7pt)[active]], anchor: "north", padding: 0.1176cm)
  content((3.28, -0.22), [#text(size: 7pt)[active]], anchor: "north", padding: 0.1176cm)
  content((4.92, -0.22), [#text(size: 7pt)[pending#linebreak()hit]], anchor: "north", padding: 0.1176cm)
  content((6.56, -0.22), [#text(size: 7pt)[pending#linebreak()miss]], anchor: "north", padding: 0.1176cm)
  content((8.2, -0.22), [#text(size: 7pt)[active]], anchor: "north", padding: 0.1176cm)
  content((9.84, -0.22), [#text(size: 7pt)[pending#linebreak()hit]], anchor: "north", padding: 0.1176cm)
  content((11.48, -0.22), [#text(size: 7pt)[ghost#linebreak()death]], anchor: "north", padding: 0.1176cm)
  line((1.525, -0.88), (3.395, -0.88), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.46, -1.056), [#text(size: 7pt)[first active run]], anchor: "north", padding: 0.1176cm)
  content((8.2, -0.95), [#text(size: 7pt)[second active run]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: A schematic lifespan of a prime from group $i$. All active visits and both ghost endpoints have its common line; the pending visit at $4$ misses that line. The line contributes $1 \/ \( p + 1 \)$ once. After extracting $b'_p$, the ghost signs, pending-hit damping, and active-run normalizations give the weight $eta'_0 eta'_7 q_3 q_6 V_i^(- 2) \/ \( \( p + 1 \) b'_p \)$. The two powers of $V_i^(- 1)$ count active runs, not active visits. ],
) <fig:lifespan>

=== 4.2 The symmetric memory space and its operations <the-symmetric-memory-space-and-its-operations>

We realize the preceding expansion by storing each pending prime together with its line.
  A later active run retrieves that stored pair, instead of paying for a new line.
  The following measures and transfer factors are chosen to reproduce (4.8).

Let $cal(Z)$ be the finite set of primitive integer vectors in the tube which satisfy the fixed-root box
  condition; it has counting measure. An active list is an ordered $M$-tuple in each group,
  endowed with measure $⨂_i nu_i^(⊗ M)$. The underlying list space allows repetitions.
  Distinctness within physical lists and the other local restrictions will be imposed in the operators.

A memory particle in group $i$ consists of a prime and an anchor,

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(X)_i = { \( p \, ell \) : p in cal(P)_i \, med ell in bb(P)^1 \( bb(F)_p \) } \, wide
   lambda_i \( p \, ell \) = nu_i \( p \) . $ <mem:particle-space>]

The line coordinate has counting measure, not uniform probability measure.
  In particular, anchoring a particle at $\[ z \]_p$ leaves the prime measure $nu_i \( p \)$,
  without another factor $1 \/ \( p + 1 \)$. A particle #emph[hits] $z$ when its anchor equals $\[ z \]_p$.

For a vector of memory sizes $bold(k) = \( k_1 \, dots.h \, k_K \)$,
  use symmetric functions of the $k_i$ particles in each group and the measure $lambda_i^(⊗ k_i) \/ k_i !$.
  The Hilbert space is

#[#set math.equation(numbering: n => "(4.10)")
 $ cal(H) = ell^2 \( cal(Z) \) ⊗ L^2 #h(-0.16667em) (⨂_i nu_i^(⊗ M)) ⊗ ⨂_(i = 1)^K
   (xor.big_(k_i gt.eq 0) L_(upright("sym"))^2 #h(-0.16667em) (cal(X)_i^(k_i) \, frac(lambda_i^(⊗ k_i), k_i !))) .
   $ <mem:hilbert-space>]

Products and sums of the operators below use the row convention:
  the input state is fixed, choices leading to output states are summed,
  and the resulting operator acts on a test function at the output.
  Let $upright(bold(b))$ be one when $z = e_1$ and memory is empty, and zero otherwise;
  it is independent of the active lists. By (4.4),

#[#set math.equation(numbering: n => "(4.11)")
 $ ∥upright(bold(b))∥^2 = product_i s_i^M = exp #h(-0.16667em) (O_K #h(-0.16667em) (frac(M \( N + 1 \), p_min))) =
   1 + o \( 1 \) . $ <mem:boundary-norm>]

Fix once and for all

#[#set math.equation(numbering: n => "(4.12)")
 $ 0 < rho < 1 \, wide rho^2 > sqrt(q) . $ <mem:rho>]

The ghost operation $cal(G)_j$ leaves the position and active list unchanged.
  Independently in each group it first chooses a subset of the indexed pending particles which hit the current
  position and deletes them, paying $- eta'_j \/ rho$ per deletion. Each surviving hit pays $q_j \/ rho^2$.
  It then appends an ordered batch of $l gt.eq 0$ primes, integrated with measure $nu_i^(⊗ l) \/ l !$,
  anchored at the current lines, and with coefficient $\( - eta'_j V_i \/ rho \)^l$.
  The divisor $l !$ makes the batch an unordered birth set when the primes are distinct;
  the ordered integral will also be useful after that restriction is removed.

The edge $cal(E)_j$ retains the geometric multiplier in (3.15),
  or its adjoint according to the alternating physical path,
  but removes its $omega$-damping and its active divisibility tests.
  It replaces target unshared counting and normalization by the following operations between the same endpoint
  slot symmetrizations.

+ Pay $rho$ for every old pending particle which hits the source $z$.
  Choose a subset of the unshared source slots to store in memory, anchored at $\[ z \]_p$,
  and drop the other unshared source slots. Copy the shared $J$ slots in each group.
+ Choose a target position $z'$ and its unshared label in each group.
  A subset of these slots is filled by promoting indexed old particles which hit $z'$,
  removing them from memory and paying $1 \/ V_i$ per promotion in group $i$.
  Particles just stored on this edge cannot be promoted on the same edge.
  Every other unshared target slot is filled by an independent $nu_i$ draw.
+ Pay $rho$ for every particle remaining in memory which hits $z'$, including newly stored particles.
  Impose the physical endpoint list restrictions, the cross-edge ban, the pad dyad,
  all good-state tests and geometric cutoffs, using the actual source and target label products.

Positions are always summed with counting measure. Since the real root matrix has determinant one,
  its edge determinant is $det \( z \, z' \)$.

For the moment impose also that all #emph[performed births] have globally distinct prime values.
  Births comprise initial active entries, fresh target entries, and ghost creations.
  This is a restriction on the fully expanded history, and is not claimed to be a local projection on $cal(H)$.
  Then the independent-line path sum, divided by its extracted baseline, is exactly

#[#set math.equation(numbering: n => "(4.13)")
 $ chevron.l upright(bold(b)) \, cal(G)_0 cal(E)_0 cal(G)_1 dots.h.c cal(E)_(N - 1) cal(G)_N upright(bold(b))
   chevron.r \, wide upright("with global birth distinctness imposed.") $ <mem:operator-history>]

Here equality refers to the choice-by-choice expansion of the right side.
  To verify it, a shared prime continues with the same line:
  $p divides D$ implies $det \( z \, z' \) = 0 med \( mod med p \)$,
  and primitivity implies $\[ z \]_p = \[ z' \]_p$. A prime leaving activity either terminates there or is stored.
  If it is used again, global birth distinctness forces its promotion from that stored particle.
  Ghost creations and deletions are exactly the optional endpoints of (4.6)–(4.7).

At an internal pending hit, the incoming edge, ghost survival, and outgoing edge give

#[#set math.equation(numbering: n => "(4.14)")
 $ rho thin \( q_j \/ rho^2 \) thin rho = q_j . $ <mem:rho-cancellation>]

At a ghost birth the creation coefficient and outgoing hit factor give $- eta'_j V_i$;
  at termination the incoming hit factor and deletion give $- eta'_j$.
  There are no unmatched factors at $0 \, N$, because memory starts and ends empty.
  An active birth has measure $nu_i \( p \) = \( \( p + 1 \) b'_p \)^(- 1) V_i^(- 1)$,
  a ghost birth has prime measure $V_i nu_i \( p \) = \( \( p + 1 \) b'_p \)^(- 1)$ after this cancellation,
  and each promotion pays $V_i^(- 1)$. These are exactly the factors in (4.8):
  each new active run contributes $V_i^(- 1)$, while the lifespan has only one line-probability factor.
  Conversely a compatible primewise lifespan determines all these choices:
  store on leaving any nonfinal active run, promote on entering the next,
  and create or terminate at its specified ghost endpoints.
  The factorial birth integral counts its unordered ghost birth set once.
  This proves the identity, including primes which leave and later re-enter activity.

=== 4.3 Truncation and adjoints <truncation-and-adjoints>

Let $B = ceil.l L^2 ceil.r$ and let $Pi_B$ restrict total memory size to at most $B$.
  We may insert $Pi_B$ before and after every operation in (4.13), with error

#[#set math.equation(numbering: n => "(4.15)")
 $ O_A \( L^(- A N) \) wide upright("for every fixed ") A > 0 . $ <mem:truncation-error>]

This assertion is made while births are still globally distinct. There are at most $K N$ stores in a history.
  A history reaching memory size greater than $B$ has therefore had at least $B - K N$ ghost births.
  Insert a factor two at each ghost birth in an absolute majorant.
  For a prime active somewhere, there are at most $\( N + 2 \)^2$ possible ghost endpoint pairs.
  There are $O_K \( M + N \)$ such primes along a fixed active path.
  For a never-active prime, fixing its earlier ghost endpoint and summing its possible later endpoints costs
  $O_q \( 1 \)$: successive later endpoints with the required line acquire successive internal factors at most
  $sqrt(q) < 1$. Summing the earlier endpoint gives a total $O_q \( \( N + 1 \) \/ p \)$ for the absolute
  ghost-only contribution, including the inserted factor two.
  Consequently the product of all never-active prime costs is $exp \( O_K \( N + 1 \) \)$.

The extracted baseline and its reciprocal have logarithms $O_K \( N + 1 \)$,
  by (4.3) and the bounded reciprocal prime sums. The path and label enumeration used in the root replacement
  costs $exp \( O_K \( L^.73 \) \)$; multiplying by the active endpoint choices and the preceding absolute costs
  gives, with room to spare, $exp \( O_K \( L^.74 \) \)$. Removing the inserted factors on the omitted histories
  gives the upper bound

$ 2^(- B + K N) exp \( O_K \( L^.74 \) \) \, $

which proves (4.15).

We next omit global birth distinctness and work on $cal(H)_B = Pi_B cal(H)$.
  The resulting signed norm estimates apply only to the unrestricted history;
  we will restore distinctness by an exact expansion in equality constraints.
  Repeated pending values are now permitted. All deletion and promotion choices remain choices of indices,
  so that the following adjoint identities hold also in their presence.

Suppose $a$ particles are deleted from a memory list of size $k + a$.
  For an unordered ghost deletion batch its indexed choices and the factorial memory measure give

#[#set math.equation(numbering: n => "(4.16)")
 $ frac(binom(k + a, a), \( k + a \) !) = frac(1, k ! a !) . $ <mem:ghost-factorial>]

Its anchors are forced by the hit condition, leaving exactly the $nu_i$ integrations.
  A fresh ghost batch has the same factorial integral. Interchanging the deleted and appended batches therefore
  gives the adjoint ghost operation: its deletion coefficient is $-
  eta'_j V_i \/ rho$ and its creation coefficient is $- eta'_j \/ rho$;
  the surviving-hit multiplier stays $q_j \/ rho^2$.

For retrieval into $a$ prescribed ordered active slots the corresponding identity is

#[#set math.equation(numbering: n => "(4.17)")
 $ frac(binom(k + a, a) a !, \( k + a \) !) = frac(1, k !) . $ <mem:edge-factorial>]

The retrieved anchors again force one line and leave $nu_i$ prime integrations.
  Newly stored particles get those same prime measures from their source active entries.
  Thus at two fixed positions the joint measure of all source and target active entries and all memory coordinates
  is unchanged on exchanging stores and promotions. The factor $1 \/
  V_i$ on a forward promotion stays on that transfer, becoming a reversed store factor; this is a bounded factor.
  The two endpoint $rho$ factors exchange roles. Summing over the two positions preserves the equality because
  their measure is counting measure. Slot symmetrizations are self-adjoint averages,
  and all endpoint and edge restrictions transpose with the kernel.
  These observations prove the adjoint rules even when list restrictions depend jointly on both positions.

For later use, a local choice multiplier of modulus at most one may be inserted provided it is equivariant under
  simultaneous permutations of the old memory coordinates and the selected deletion or promotion indices.
  The indexed choice sum then preserves symmetry in the old particles.
  In a ghost birth integral, a multiplier depending on the ordered fresh batch is averaged over permutations of
  that batch when acting on symmetric test functions. This leaves the integral unchanged,
  keeps its modulus at most one, and retains the factor $1 \/ l !$.
  These modified operations therefore act on the same symmetric spaces.
  In both adjoint directions they are dominated in absolute value by the positive kernels obtained by summing the
  absolute values of the unmodified operation-choice coefficients.
  An arbitrary multiplier depending on an old particle’s index alone need not preserve symmetry and is not allowed here.

=== 4.4 Absolute bounds for ghosts and edges <absolute-bounds-for-ghosts-and-edges>

Call an edge #emph[clean] if it stores and promotes no particle, and #emph[dirty] otherwise.
  A clean edge draws all unshared target labels freshly, and its signed minor-arc kernel will give cancellation.
  For a dirty edge the good-state tests instead make an absolute row or column sum small.
  We first bound the ghosts and record crude edge bounds, then prove these two kinds of small edge estimate.

For a state with total pending size $k_(upright("tot"))$ use the positive Schur weight

#[#set math.equation(numbering: n => "(4.18)")
 $ w = v_0^(k_(upright("tot"))) \, $ <mem:schur-weight>]

where $v_0$ is a sufficiently large fixed constant. A weighted row bound $R$ means that the absolute row sum
  against output weight is at most $R$ times input weight; the analogous bound for the adjoint is the weighted
  column bound $C$. Weighted Schur gives norm at most $sqrt(R C)$.
  Restrictions by $Pi_B$ can only decrease these absolute sums.

In one group with $h$ pending hits, the ghost row bound, divided by the input weight, is

#[#set math.equation(numbering: n => "(4.19)")
 $ exp #h(-0.16667em) (frac(v_0 eta'_j V_i s_i, rho)) (q_j / rho^2 + frac(eta'_j, rho v_0))^h . $ <mem:ghost-row>]

The exponential sums fresh births; the power sums deletion or survival of each old hit. The adjoint bound is

#[#set math.equation(numbering: n => "(4.20)")
 $ exp #h(-0.16667em) (frac(v_0 eta'_j s_i, rho)) (q_j / rho^2 + frac(eta'_j V_i, rho v_0))^h . $ <mem:ghost-column>]

Since $q_j lt.eq sqrt(q) < rho^2$ and the $V_i$ are bounded above and below,
  one fixed $v_0$ makes both parentheses at most one, for all $i \, j$ and large $x$.
  Multiplication over the fixed groups proves

#[#set math.equation(numbering: n => "(4.21)")
 $ ∥cal(G)_j∥_(cal(H)_B arrow.r cal(H)_B) lt.eq C_K \, $ <mem:ghost-norm>]

with the same absolute row and column bounds under the bounded choice modifications just described.

For the crude edge bounds fix the source $z$ and choose an integral complement $w_z$ with $det \( z \, w_z \) =
  1$. Write

#[#set math.equation(numbering: n => "(4.22)")
 $ z' = j_1 w_z + h z \, wide j_1 = det \( z \, z' \) \, wide lr(|h + j_1 frac(tau \( w_z \), tau \( z \))|) lt.eq
   16 . $ <mem:neighbor>]

The last inequality follows from $tau \( z' \) \/ tau \( z \)$ lying in the fixed box range.
  Enlarging its absolute constant would have no effect on any argument below.
  For fixed source, labels, and determinant $j_1$, this permits $O \( 1 \)$ targets.
  In the raw determinant part $j_1 = D \( b - a \)$ is fixed.
  In the comparison part $j_1 = D t$ has $O \( Y \)$ possibilities, and its multiplier is at most

#[#set math.equation(numbering: n => "(4.23)")
 $ C lr(|frak(M)|) lt.double L^(3 A_0) / Y . $ <mem:major-absolute>]

The masses of all fresh label draws are bounded by $C_K$. There are at most $C_K B^K$ indexed promotion choices.
  Store subsets, Schur weight ratios and $V_i$ factors cost $C_K$.
  Source and target symmetrizations are probability averages.
  Using the adjoint calculation for columns, we obtain a constant $C = C \( K \, A_0 \, q \)$ such that

#[#set math.equation(numbering: n => "(4.24)")
 $ R \( cal(E)_j \) \, med C \( cal(E)_j \) lt.eq C_K B^K \( 1 + L^(3 A_0) \) lt.eq L^C . $ <mem:edge-crude>]

This holds for arbitrary multipliers of modulus at most one on the choices.
  It also holds after fixing any or all fresh prime values, with their measures left outside the bound.
  This uniformity will preserve the cost of a forced prime atom in the birth-distinctness argument.

=== 4.5 The lattice box and the clean signed norm <the-lattice-box-and-the-clean-signed-norm>

We first extract a geometric consequence of the first good-state test.
  Partition $cal(Z)$ by intervals of length $H = d_0 Y$ for $z_2 \/ tau \( z \)$. The identity

$ frac(z'_2, tau \( z' \)) - frac(z_2, tau \( z \)) = frac(det \( z \, z' \), tau \( z \) tau \( z' \)) $

shows that an edge connects only cells whose indices differ by a bounded amount.
  At fixed shared list, hence fixed squarefree product $D$,
  partition further by the tuple $\( \[ z \]_p \)_(p divides D)$. An edge preserves this tuple.
  The resulting operator is a sum over a bounded number of cell-index shifts of direct sums of blocks.
  It suffices to bound each block uniformly.

Choose a relevant good source $z$ in one such pair of cells and a complement $w_z$ as in (4.22).
  All vectors in either cell with the specified line tuple belong to the lattice

$ Lambda = bb(Z) z + bb(Z) D w_z . $

Indeed, on writing a vector as $h z + j w_z$, equality of the projective lines modulo every $p divides
  D$ implies $p divides j$; squarefreeness gives $D divides j$. Its coordinates $\( h \, l \)$ in this lattice satisfy

#[#set math.equation(numbering: n => "(4.25)")
 $ \| l \| lt.double Y \, wide \| h + l alpha \| lt.double 1 \, wide alpha =
   D frac(tau \( w_z \), tau \( z \)) . $ <mem:sheared-box>]

The $l$ bound follows from the cell separation and $D asymp d_0$; the other follows from the box condition.

The image of this integer lattice under $\( h \, l \) mapsto \( h + l alpha \, l \/ Y \)$ has covolume $1 \/ Y$.
  Let $lambda$ be the length of its shortest nonzero vector.
  If $lambda < Y^(- .8)$, its second coordinate gives $0 < \| l \| < Y^.2$,
  and its first gives $parallel l alpha parallel < Y^(- .8) < Y^(- .7)$; $l =
  0$ is impossible for a nonzero vector this short. This contradicts the first good-state test,
  since $tau \( w_z \) \/ tau \( z \)$ is a lift of $r_(g z)$. Thus $lambda gt.eq Y^(- .8)$.
  Dirichlet’s elementary pigeonhole approximation, using denominators at most $ceil.l sqrt(Y) ceil.r$,
  gives $lambda lt.double Y^(- .5)$.

A shortest vector is primitive in the lattice, so complete it to a basis.
  Subtract a multiple of the first vector from the second to make its parallel component at most $lambda \/ 2$.
  Its perpendicular component is $1 \/ \( Y lambda \)$; since $lambda^2 lt.double 1 \/ Y$,
  its length is $O \( 1 \/ \( Y lambda \) \)$. Inverting this basis on the bounded region in (4.25) puts all
  relevant vectors in a centered coordinate box with side parameters $O \( 1 \/ lambda \)$ and $O \( Y lambda \)$.
  Choose its orientation positively. Enlarging constants, the box has parameters $A' \, B'$ satisfying

#[#set math.equation(numbering: n => "(4.26)")
 $ A' B' lt.double Y \, wide Y^.1 lt.eq A' \, B' lt.eq Y^.9 . $ <mem:lattice-shape>]

The change of integer basis has determinant one, so that $det \( z \, z' \) \/
  D$ is the ordinary determinant of their new integer coordinates.
  This proof applies unchanged for a continuous root: the tested quantity $r_(g z)$ is still $tau \( w_z \) \/
  tau \( z \) med mod med 1$.

For a clean edge, before the slot symmetrizations, condition on the shared list and all pending particles.
  They are unchanged by the central operation. Its remaining pending-hit factors are diagonal contractions at the
  two endpoints. We may omit the extra cross-edge ban at a norm cost smaller than any power of $L^(- 1)$.
  In fact, keeping distinctness of each full active list, a forbidden coincidence requires one of the fresh labels
  to equal a fixed source label, costing at most $C_K M sup_(i \, p) nu_i \( p \)$.
  After the labels are fixed, (4.22) and (4.23) give an absolute row bound $C_K L^(3 A_0)$;
  the same argument for the adjoint gives the column bound. Equation (4.4) proves the claimed negligible norm cost.

Inside a lattice block, the unshared ordered list, containing one prime from each disjoint band,
  is uniquely determined by its product $b$. Its measure is

#[#set math.equation(numbering: n => "(4.27)")
 $ m \( b \) = product_(i = 1)^K nu_i \( p_i \) lt.eq C_K / Y quad
   upright("when ") eta \( b \/ Y \) eq.not 0 . $ <mem:product-mass>]

Conjugation from $L^2 \( m \)$ to counting measure inserts $sqrt(m \( b \) m \( a \))$.
  Consequently the clean norm is at most $C_K$ times the norm of the following operator on the integer box in
  (4.26) and an unrestricted integer product variable:

#[#set math.equation(numbering: n => "(4.28)")
 $ 1 / Y psi #h(-0.16667em) (frac(det \( bold(h) \, bold(l) \), Y)) integral_(bb(T) \\ frak(M)) upright(e)
   #h(-0.16667em) (theta \( det \( bold(h) \, bold(l) \) - b + a \)) thin thin upright(d) theta . $ <mem:clean-kernel>]

Here $bb(T) = bb(R) \/ bb(Z)$. Extending the product variable means composing with extension by zero and
  restriction. All actual product supports, full-list restrictions, goodness tests, cutoff factors,
  and the bounded square-root factors from (4.27) are endpoint diagonal multipliers.
  The factor $d_0 \/ D$ is bounded. Thus none of these operations increases the bound except by $C_K$.
  We use the transposed conjugate kernel on a reversed edge.

Fourier transformation in the unrestricted integer product variable diagonalizes its convolution:
  for each $theta in bb(T) \\ frak(M)$ the fiber is the determinant exponential matrix with its smooth cutoff,
  divided by $Y$. If $hat(psi) \( u \) = integral_(bb(R)) psi \( t \) upright(e) \( - u t \) thin thin upright(d)
  t$, then

#[#set math.equation(numbering: n => "(4.29)")
 $ psi #h(-0.16667em) (frac(det \( bold(h) \, bold(l) \), Y)) upright(e) #scale(x: 120%, y: 120%)[\(] theta
   det \( bold(h) \, bold(l) \) #scale(x: 120%, y: 120%)[\)] =
   integral_(bb(R)) hat(psi) \( u \) upright(e) #scale(x: 120%, y: 120%)[\(] \( theta + u \/ Y \)
   det \( bold(h) \, bold(l) \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) u . $ <mem:cutoff-fourier>]

The density $hat(psi)$ decreases faster than any inverse power.

For $\| u \| lt.eq L^(A_0) \/ 2$, put $theta.alt = theta + u \/ Y$.
  Dirichlet approximation with $Q = ceil.l Y \/ L^(A_0) ceil.r$ gives a reduced $c \/ d$ such that

#[#set math.equation(numbering: n => "(4.30)")
 $ L^(A_0) < d lt.eq Q \, wide lr(|theta.alt - c / d|) lt.eq frac(1, d Q) lt.eq 1 / d^2 . $ <mem:dirichlet-minor>]

Indeed $d lt.eq L^(A_0)$ would put $theta$ within $3 / 2 L^(A_0) \/ Y$ of a rational of allowed denominator,
  contrary to the definition of $frak(M)$ with radius $2 L^(A_0) \/ Y$.

For completeness, let $T_(A' \, B') \( theta.alt \)$ have entries $upright(e) \( theta.alt h k \)$ for integer $\|
  h \| lt.double A'$, $\| k \| lt.double B'$. Its Gram matrix and the geometric-sum estimate give

#[#set math.equation(numbering: n => "(4.31)")
 $ ∥T_(A' \, B') \( theta.alt \)∥^2 lt.double sum_(\| h \| lt.double A') min #h(-0.16667em)
   (B' \, frac(1, parallel h theta.alt parallel)) lt.double \( A' \/ d + 1 \) #scale(x: 120%, y: 120%)[\(] B' +
   d log \( 2 d \) #scale(x: 120%, y: 120%)[\)] . $ <mem:bilinear-gram>]

In the term $h = 0$ the minimum is interpreted as $B'$. To justify the last inequality,
  split the $h$ interval into blocks of length at most $d \/ 2$.
  For two different indices in a block, reduction of $c \/ d$ and the error in (4.30) separate their fractional
  parts by at least $1 \/ \( 2 d \)$. Ordering their distances to the nearest integer bounds each block by
  $O \( B' + d sum_(1 lt.eq j lt.eq d) j^(- 1) \)$.

Up to a permutation of columns, the determinant matrix $upright(e) \( theta.alt \( h_1 l_2 - h_2 l_1 \) \)$ is the
  tensor product of $T_(A' \, B') \( theta.alt \)$ and its transposed conjugate.
  Its norm is therefore the squared norm in (4.31). After division by $Y$, (4.26) implies the bound

#[#set math.equation(numbering: n => "(4.32)")
 $ ∥\( upright(e) \( theta.alt det \( bold(h) \, bold(l) \) \) \)∥ / Y lt.double 1 / d + Y^(- .1) log \( 2 Y \) +
   frac(d log \( 2 d \), Y) lt.double_K L^(.2 - A_0) + Y^(- .1) log \( 2 Y \) . $ <mem:minor-decay>]

For the complementary Fourier tail in (4.29), the trivial matrix norm is $O \( A' B' \) = O \( Y \)$,
  so rapid decay of $hat(psi)$ gives any required negative power of $L$.
  Combining the direct sums of cell blocks and the endpoint symmetrizations, we conclude that,
  for any fixed $G > 0$, choosing $A_0$ sufficiently large in terms of $G$ gives

#[#set math.equation(numbering: n => "(4.33)")
 $ ∥cal(E)_j^(upright("clean"))∥ lt.eq L^(- G) $ <mem:clean-bound>]

for large $x$, with an arbitrarily fixed margin in the exponent.
  Constants depending on the later fixed value of $K$ are absorbed by that margin and the threshold for $x$.

=== 4.6 Dirty raw edges: the two Schur sides <dirty-raw-edges-the-two-schur-sides>

Fix the set $S$ of stored groups and the set $I$ of promoted groups. There are at most $4^K$ choices, a constant.
  All store and promotion coefficients and the ratio of Schur weights cost $C_K$.

If $I = diameter$, the weighted raw row bound is $C_K$, independently of $B$.
  For each source omission tuple, sample the fresh target label in every group and use (4.22) with its fixed
  determinant. There are no pending-index choices. The source symmetrization averages the omission tuples and thus
  does not multiply their number. This argument allows arbitrary $S$.

Suppose $I eq.not diameter$ and put $i_(*) = max I$. Fix the source state and sample the fresh target labels in
  the groups outside $I$, with product $T_f$. Their product law $nu$ is boundedly comparable to the law $mu$ in
  the second good-state test, by (4.4). Outside an exceptional mass $C_K exp \( - 1 / 4 L^(a_(i_(*))) \)$,
  that test supplies its asserted phase separation. Fix one old index for promotion in group $i_(*)$;
  there are at most $B$ such indices, and write its prime and anchor as $\( p_(*) \, ell_(*) \)$.
  Let $Z$ be the product of the other promoted numeric primes and let $P_(upright("full"))$ be the product of the
  complete source active list. The raw determinant equation is

#[#set math.equation(numbering: n => "(4.34)")
 $ j_1 = P_(upright("full")) - D p_(*) Z T_f . $ <mem:dirty-determinant>]

The ban excludes $p_(*)$ from the entire source list. Thus $j_1 equiv
  P_(upright("full")) eq.not 0 med \( mod med p_(*) \)$, independently of the omission tuple and of $Z$.

In (4.22) the line condition $\[ j_1 w_z + h z \]_(p_(*)) =
  ell_(*)$ is either impossible or fixes a single residue $h = h_(*) med \( mod med p_(*) \)$.
  To see uniqueness, in the basis $\( z \, w_z \)$ the second coordinate $j_1$ is nonzero modulo $p_(*)$;
  therefore its projective line determines the first coordinate uniquely.
  This residue depends on the fixed index and $P_(upright("full"))$, but not on $D \, Z$.
  Substitution in (4.22), using the real lift $r_z^(*) = tau \( w_z \) \/ tau \( z \)$, yields

#[#set math.equation(numbering: n => "(4.35)")
 $ ∥D Z T_f r_z^(*) - frac(P_(upright("full")) r_z^(*) + h_(*), p_(*))∥ lt.eq 16 / p_(*) . $ <mem:anchor-congruence>]

The phase separation is $100 e^(- L^(a_(i_(*))))$, whereas the diameter of the interval in (4.35) is at most
  $32 \/ p_(*) lt.eq 32 e^(- L^(a_(i_(*))))$. Hence at most one distinct integer $D Z$ is possible.

This also determines $D$ and $Z$ separately. All prime factors of $D$ are source labels and all prime factors of
  $Z$ are excluded from the source list by the ban. Their prime factorizations therefore separate unambiguously.
  Because the source list is distinct, $D$ determines which single label was omitted in every group.
  Under source symmetrization this one numeric omission tuple has mass exactly $M^(- K)$.
  It is an average over tuples, including over their internal orders, rather than an unnormalized sum.
  The disjoint prime bands also make $Z$ determine each other promoted numeric prime.

The labels now fix $j_1$, so there are $O \( 1 \)$ target positions.
  At any one of them, multiplicities among the remaining promoted indices are absorbed by the outgoing pending
  damping. If a group has $h$ old particles hitting that target,
  the choice of one eligible index and the damping of all other old hits cost at most

#[#set math.equation(numbering: n => "(4.36)")
 $ h rho^(h - 1) lt.eq sup_(n gt.eq 1) n rho^(n - 1) < oo . $ <mem:index-damping>]

This remains true for repeated numeric values and repeated anchors.
  Additional newly stored hits only decrease the factor. Applying this in each of the other promoted groups costs
  $C_K$. For the exceptional fresh draws use the crude $B^K$ count and (4.22). We obtain the weighted raw row bound

#[#set math.equation(numbering: n => "(4.37)")
 $ epsilon_K = C_K (B / M^K + B^K e^(- c L^.1)) wide \( I eq.not diameter \) . $ <mem:epsilon>]

Reversal exchanges $S$ and $I$ by (4.17), changes only bounded $V_i$ factors,
  and retains both good-state tests and the ban. Its raw determinant equation, with the reversed sign,
  again has source full product minus $D$ times the target unshared product.
  The preceding argument therefore gives the following complete table. Every entry includes the fixed $C_K$ factors.

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stored groups $S$
], table.cell(rowspan: 1, colspan: 1)[Promoted groups $I$
], table.cell(rowspan: 1, colspan: 1)[Weighted row
], table.cell(rowspan: 1, colspan: 1)[Weighted column
]),
  table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[$C_K$
], table.cell(rowspan: 1, colspan: 1)[$C_K$
],
  table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$epsilon_K$
], table.cell(rowspan: 1, colspan: 1)[$C_K$
],
  table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[$C_K$
], table.cell(rowspan: 1, colspan: 1)[$epsilon_K$
],
  table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$epsilon_K$
], table.cell(rowspan: 1, colspan: 1)[$epsilon_K$
],
)
]

The first row is only an absolute estimate; its signed estimate is (4.33).
  Once $K$ is large enough that $epsilon_K lt.eq 1$, weighted Schur bounds the sum of the three dirty raw cases by

#[#set math.equation(numbering: n => "(4.38)")
 $ C_K sqrt(epsilon_K) lt.eq C_K L^(1 - .005 K + o \( 1 \)) + O_A \( L^(- A) \) quad
   upright("for every fixed ") A . $ <mem:raw-dirty-norm>]

The bounded entry opposite a small Schur entry is essential here: it contains no factor $B^K$.
  Thus making $.005 K$ larger than a prescribed constant purchases that constant in log decay.
  All remaining $K$-dependence in this estimate is a fixed multiplicative constant.

=== 4.7 Dirty comparison edges <dirty-comparison-edges>

Use the supremum (4.23), discarding its dependence on the target unshared labels.
  Fix a source omission tuple, hence $D$, and suppose $I eq.not diameter$.
  A promoted old index with prime $p$ requires one specified projective line at the target.
  By the ban, $p divides.not D$. The lattice basis used to obtain (4.26) has determinant $D$ in the original
  integer coordinates and is therefore invertible modulo $p$.
  The prescribed line is consequently one nonzero homogeneous linear congruence in the two box coordinates.

For a box of sides $A' \, B'$, the number of solutions of such a congruence is

#[#set math.equation(numbering: n => "(4.39)")
 $ O #h(-0.16667em) (frac(A' B', p) + max \( A' \, B' \)) lt.double Y (1 / p + frac(1, min \( A' \, B' \))) .
   $ <mem:line-count>]

If the coefficient of the shorter coordinate is nonzero, fix the other coordinate and count its solutions in that
  shorter interval. If that coefficient vanishes, the congruence restricts the longer coordinate instead;
  the same displayed upper bound follows. We have included vectors divisible by $p$ in this count,
  which only increases it.

For each source only a bounded number of neighboring cell blocks occurs.
  Take the union over at most $B$ old indices in one promoted group.
  The other index choices can be bounded by $B^(K - 1)$, or by (4.36).
  Sum the fresh prime masses and the source omission average. Equations (4.23), (4.26), and (4.39) give a row bound

#[#set math.equation(numbering: n => "(4.40)")
 $ zeta_K := C_K L^(3 A_0) B^K (p_min^(- 1) + Y^(- .1)) \, wide zeta_K = O_A \( L^(- A) \) quad
   upright("for every fixed ") A . $ <mem:comparison-small>]

All parameters $K \, A_0$ are fixed in the last assertion. The opposite Schur side is at most $L^C$ by (4.24).
  For a store-only piece apply the same argument to the adjoint;
  with both stores and promotions it applies to both sides. For clarity the comparison counterpart of the dirty table is

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stored groups $S$
], table.cell(rowspan: 1, colspan: 1)[Promoted groups $I$
], table.cell(rowspan: 1, colspan: 1)[Weighted row
], table.cell(rowspan: 1, colspan: 1)[Weighted column
]),
  table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$zeta_K$
], table.cell(rowspan: 1, colspan: 1)[$L^C$
],
  table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$diameter$
], table.cell(rowspan: 1, colspan: 1)[$L^C$
], table.cell(rowspan: 1, colspan: 1)[$zeta_K$
],
  table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[nonempty
], table.cell(rowspan: 1, colspan: 1)[$zeta_K$
], table.cell(rowspan: 1, colspan: 1)[$zeta_K$
],
)
]

Weighted Schur makes every dirty comparison piece smaller than every fixed negative power of $L$.

Choose $G > E_0 + 3$. First choose $A_0$ so that the clean argument gives more than $G$ powers of decay,
  and then choose $K$ so that $.005 K > G + 2$. Combining the clean, dirty raw, and dirty comparison estimates,
  with their fixed finite sums, proves

#[#set math.equation(numbering: n => "(4.41)")
 $ ∥cal(E)_j∥_(cal(H)_B arrow.r cal(H)_B) lt.eq L^(- G) $ <mem:signed-edge>]

before global birth distinctness is restored. If desired all strict inequalities here can be enlarged by one to
  absorb the constants. The crude exponent $C \( K \, A_0 \, q \)$ in (4.24) has not entered the choice needed in
  (4.38).

=== 4.8 Restoring global birth distinctness <restoring-global-birth-distinctness>

The contractions just proved did not require globally distinct births. We now restore that condition exactly.
  A union bound over one repeated prime would not suffice against the absolute cost of a long path;
  we instead separate equality constraints by their rank.

Allocate a finite ordered set $cal(B)$ of potential birth addresses as follows:
  the $K M$ initial slots; the $K$ canonical target slots at each edge, before its final symmetrization;
  and $B$ ordered fresh-batch indices per group at each ghost operation.
  The truncation ensures that a ghost batch has length at most $B$.
  Each address has a local #emph[performed flag]: at an edge it is performed exactly if that slot is filled
  freshly, and in a ghost batch exactly if its index does not exceed the batch length.
  Initial addresses are always performed. Thus

#[#set math.equation(numbering: n => "(4.42)")
 $ Q_(upright("birth")) := lr(|cal(B)|) lt.eq K M + K N + K \( N + 1 \) B = L^(O \( 1 \)) . $ <mem:address-count>]

Order these addresses chronologically, with a fixed order within each operation.

Let $cal(C)$ be a collection of disjoint nonsingleton subsets of $cal(B)$.
  For each block $C in cal(C)$ require that every address is performed and that their prime values are equal.
  Denote this event by $E_C$. Then the exact distinctness indicator is

#[#set math.equation(numbering: n => "(4.43)")
 $ upright(bold(1))_(upright("distinct performed birth values")) =
   sum_(cal(C)) product_(C in cal(C)) \( - 1 \)^(\| C \| - 1) \( \| C \| - 1 \) ! product_(C in cal(C))
   upright(bold(1))_(E_C) . $ <mem:partition-identity>]

One proof expands the right side as the sum of signs of all permutations of the performed addresses which preserve
  their values: a nontrivial cycle on $C$ has sign $\( - 1 \)^(\| C \| - 1)$ and there are $\( \| C \| - 1 \) !$
  such cycles. In each equal-value class of size at least two the signs of permutations sum to zero,
  and for a singleton they sum to one. Unperformed addresses cannot occur in a nontrivial cycle,
  which is exactly enforced by the flags.

Define the rank

#[#set math.equation(numbering: n => "(4.44)")
 $ r \( cal(C) \) = sum_(C in cal(C)) \( \| C \| - 1 \) . $ <mem:rank-definition>]

A rank-$r$ collection involves at most $2 r$ addresses. Its total absolute coefficient mass,
  summed over all collections of that rank, is at most

#[#set math.equation(numbering: n => "(4.45)")
 $ Q_(upright("birth"))^(2 r) = L^(O \( r \)) . $ <mem:rank-coefficients>]

Indeed the coefficients count permutations with that cycle rank,
  and each such permutation has a fixed canonical decomposition into $r$ transpositions.
  Its ordered list of transpositions, drawn from at most $Q_(upright("birth"))^2$ possibilities,
  determines the permutation.

We first bound a fixed system of equality constraints absolutely.
  In each block choose its earliest address as pivot, and condition chronologically on the entire earlier history
  and all known pivot values. Each nonpivot performed birth must draw one prescribed prime.
  By (4.4) this costs an atom at most

#[#set math.equation(numbering: n => "(4.46)")
 $ Delta := sup_(i \, p) nu_i \( p \) lt.eq C_K e^(- L^.1) . $ <mem:atom>]

If its prescribed value belongs to a wrong group, the term is zero.
  No later endpoint conditioning is imposed in this absolute bound:
  we drop the final return requirement and use weighted row iteration.
  Thus dependence of intermediate positions on the earlier pivot values cannot change the atom cost.

Here is the precise uniform estimate justifying that iteration.
  For an edge with $s$ prescribed nonpivot fresh values, fix all fresh values first.
  The possible target positions still number $O \( 1 \)$ in the raw part or $O \( Y \)$ in the comparison part.
  The latter count is compensated by (4.23). Consequently its weighted absolute row is at most

#[#set math.equation(numbering: n => "(4.47)")
 $ C_K B^K \( 1 + L^(3 A_0) \) Delta^s \, $ <mem:edge-atoms>]

uniformly in the input state and all fixed values. The remaining fresh values have bounded total mass,
  and all local restrictions may be discarded for this upper bound.

For a ghost in group $i$, set $c_i = v_0 eta'_j V_i \/ rho$.
  If $s$ specified ordered coordinates of its new batch are prescribed, its birth row sum is at most

#[#set math.equation(numbering: n => "(4.48)")
 $ sum_(l gt.eq s) frac(c_i^l Delta^s s_i^(l - s), l !) lt.eq \( c_i Delta \)^s exp \( c_i s_i \) . $ <mem:ghost-atoms>]

The actual requirement that the batch reaches its largest named index can only reduce this sum.
  Within a batch the earlier pivot coordinates are integrated before the prescribed later ones,
  which gives the same estimate. Deletion and survival have weighted factor at most one by (4.19).
  Anchors add no factor $p + 1$, as their measure is counting measure.
  Initial slots have the same single-atom estimate. Thus for each fixed rank-$r$ constraint system,
  the absolute boundary contribution is at most

#[#set math.equation(numbering: n => "(4.49)")
 $ L^(C \( N + 1 \)) \( C_K e^(- L^.1) \)^r \, $ <mem:rank-absolute>]

for a fixed $C = C \( K \, A_0 \, q \)$. The boundary weight is one because memory is empty;
  after dropping return, its terminal indicator is at most the positive Schur weight,
  so the chronological row bounds apply.

Choose, after $C$ is fixed,

#[#set math.equation(numbering: n => "(4.50)")
 $ r_0 = ⌈C' frac(N log L, L^.1)⌉ \, $ <mem:rank-cutoff>]

with $C'$ sufficiently large. Combining (4.45) and (4.49), and using $log Q_(upright("birth")) = O \( log L \)$,
  bounds all ranks $r gt.eq r_0$ by

#[#set math.equation(numbering: n => "(4.51)")
 $ L^(C \( N + 1 \)) sum_(r gt.eq r_0) #scale(x: 120%, y: 120%)[\(] C_K Q_(upright("birth"))^2 e^(- L^.1)
   #scale(x: 120%, y: 120%)[\)]^r lt.eq L^(- \( E_0 + 2 \) N) . $ <mem:high-rank>]

The series is geometric for large $x$. For example its ratio is at most $e^(- L^.1 \/ 2)$,
  so choosing $C' \/ 2 > C + E_0 + 3$ suffices after enlarging the threshold for $x$.

For ranks $r < r_0$, use signed contraction on most edges.
  If $C = { a_0 \, a_1 \, dots.h \, a_s }$ is one block, with earliest address $a_0$,
  write its equality event by ordinary circle orthogonality as

#[#set math.equation(numbering: n => "(4.52)")
 $ upright(bold(1))_(E_C) = (product_(a in C) upright(bold(1))_(a med upright("performed"))) integral_(bb(T)^s)
   product_(h = 1)^s upright(e) #scale(x: 120%, y: 120%)[\(] theta_h \( p_(a_h) - p_(a_0) \)
   #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta_1 dots.h.c thin upright(d) theta_s . $ <mem:local-phases>]

When an address is unperformed the integrand is interpreted as zero; no value is assigned to an unperformed birth.
  After the circle variables are fixed, every phase is attached only to the operation where its prime was created.
  In particular the pivot receives the single local multiplier $upright(e) \( - p_(a_0) sum_h theta_h \)$.
  Its value need not be remembered through later operations.
  Flags are local choice restrictions of modulus at most one.
  An edge flag tests whether its slot is freshly drawn rather than promoted;
  it does not distinguish old promotion indices. A ghost flag tests whether its fresh batch reaches the specified
  address. Thus these flags and birth-value phases satisfy the old-memory equivariance condition stated after
  (4.17). For fixed circle variables, backward induction through the later operations gives a symmetric
  continuation function. Averaging the ghost-batch multiplier over its new coordinates consequently leaves the
  full integral unchanged, without increasing its absolute kernel, changing its factor $1 \/ l !$,
  or modifying any later operation.

It follows that a rank-$r$ system modifies at most $2 r$ operations, and hence at most $2 r$ edges.
  Initial phases change $upright(bold(b))$ by a bounded multiplier and preserve (4.11).
  Every ghost, modified or not, has norm at most $C_K$; a modified edge has norm at most $L^C$ by (4.24);
  all other edges retain (4.41). For each fixed set of phases the boundary matrix element is therefore at most

#[#set math.equation(numbering: n => "(4.53)")
 $ C_K^(N + 1) ∥upright(bold(b))∥^2 L^(- G \( N - 2 r \)) L^(2 C r) . $ <mem:low-rank-term>]

Integration of phases does not increase this bound. As $r_0 \/ N = O \( log L \/ L^.1 \) = o \( 1 \)$,
  summing (4.53) with (4.45) gives

#[#set math.equation(numbering: n => "(4.54)")
 $ sum_(r < r_0) Q_(upright("birth"))^(2 r) C_K^(N + 1) ∥upright(bold(b))∥^2 L^(- G \( N - 2 r \) + 2 C r) lt.eq
   L^(\( - G + o \( 1 \) \) N) . $ <mem:low-rank>]

This remains true even though $C$ depends on $K$: $K$ was fixed before letting $x$ grow,
  and its crude exponent is paid on only $o \( N \)$ edges.

Equations (4.51) and (4.54) bound (4.13) with exact global birth distinctness,
  uniformly in all archimedean root variables. Multiply back the baseline, whose modulus is at most one.
  The root integral has bounded mass. The error (4.15) and the root-replacement error are $O_A \( L^(- A N) \)$
  for arbitrary fixed $A$. Because $G > E_0 + 3$, these margins absorb all constants and prove (4.1).
  The passage from this moment to (3.20) was proved in the preceding section.

=== 4.9 Removing goodness and stripping the pads <removing-goodness-and-stripping-the-pads>

We complete the second assertion of Proposition 12. First remove the good-state projections from the endpoint
  pairing. The part where the source is bad, and separately the part where the target is bad,
  may be majorized absolutely; bound the endpoint coefficients by their log-power suprema.
  Apply the single-edge version of the root replacement. In the independent-line model,
  a shared prime requires the same line at both positions, or contributes zero.
  Every distinct prime in the union of the two active lists is charged exactly once by $1 \/ \( p + 1 \)$.
  The ban makes the union consist of $M + 1$ distinct primes per group.
  Its list normalization is $V_i^(- \( M + 1 \))$, so summing these probabilities over ordered union lists is at most

#[#set math.equation(numbering: n => "(4.55)")
 $ product_(i = 1)^K (sum_(p in cal(P)_i) frac(1, V_i \( p + 1 \)))^(M + 1) lt.eq 1 . $ <mem:one-edge-label-mass>]

We have dropped any incompatibilities for an upper bound.
  Damping is also at most one on the physical states and may be discarded.

For fixed labels, (4.22) counts $O \( 1 \)$ raw targets; the comparison target count is $O \( Y \)$ and is
  compensated by (4.23). For every fixed source list, the set of root ratios failing either good-state test has
  measure $O \( e^(- c L^.1) \)$ by Lemma 9. This estimate is uniform in the other root coordinates.
  The preceding target counts hold for every ratio, so they may be integrated over that bad set.
  Reversal proves the identical assertion for failure of target goodness.
  Equation (4.55) then gives the normalized pairing error

#[#set math.equation(numbering: n => "(4.56)")
 $ O #h(-0.16667em) (U V L^(C_1 + 3 A_0) e^(- c L^.1)) + O_A \( U V L^(- A) \) \, $ <mem:goodness-error>]

where $C_1$ comes from the endpoint suprema. The root-replacement error can here be made smaller than every log
  power by its single-edge estimate; this also handles the indicators of goodness failure.
  Therefore removing the projections costs $O_A \( U V L^(- A) \)$ for every fixed $A$.

The endpoint vectors are invariant under permutations of their lists.
  Hence the two slot symmetrizations disappear when the pairing is expanded.
  Write the ordered pads as $p_(i \, 1) \, dots.h \, p_(i \, J)$ in group $i$, with total product $D$.
  The remaining source and target slots have products $b$ and $a$.
  The common state normalization and the fresh-target normalization are $product_i V_i^(- \( J + 2 \))$.
  Divide the pairing for the dyad $d_0$ by $d_0$. Its scalar multiplier becomes $1 \/ D$,
  and the exact measure identity is

#[#set math.equation(numbering: n => "(4.57)")
 $ 1 / D product_(i = 1)^K V_i^(- \( J + 2 \)) = (product_(i = 1)^K product_(h = 1)^J mu_i \( p_(i \, h) \))
   product_(i = 1)^K V_i^(- 2) . $ <mem:pad-measure>]

Thus the pads are independent ordered harmonic draws, and the remaining factors are exactly the two unshared-list
  normalizations in the expanded square. There is no factorial or $M$-dependent normalization left over:
  the pads occupy prescribed ordered shared slots and the unshared label occupies its prescribed remaining slot.

The change of variables is $P = \( D b m \, s \)$, $Q = \( D a r \, n \)$, so $det \( P \, Q \) \/ D = b m n -
  a r s$. The support and roughness properties of the endpoint vectors give the original coefficients and make the
  physical damping equal to one. Primitivity and the box conditions are automatic on their nonzero support,
  as established in the preceding section. On summing the ordinary pad dyads every ordered pad tuple occurs once.
  Therefore, apart from the pad collision restrictions, (4.57) gives exactly the signed difference between the
  determinant condition and $cal(H)_(frak(M))$ in the expanded square.

For fixed disjoint unshared products $a \, b$, independent pad draws violate pad distinctness or the ban with
  probability at most

#[#set math.equation(numbering: n => "(4.58)")
 $ C_K M^2 sup_(i \, p) mu_i \( p \) lt.double_K M^2 e^(- L^.1) . $ <mem:pad-collisions>]

This follows by a union bound over pairs of pad addresses and over coincidences with the two fixed unshared primes
  in each group; for two independent draws their equality probability is at most the largest atom.
  To remove this probability loss from a signed sum, we need absolute bounds for each of its two parts.

The absolute raw expanded square is

#[#set math.equation(numbering: n => "(4.59)")
 $ lt.double_K X Y L^(C_2) \, $ <mem:raw-absolute-square>]

with $C_2$ depending on the coefficient bounds and fixed divisor moments, independently of $K$.
  Indeed for each pair $a \, b$ its original $h$ representation has $h lt.double X \/
  Y$ and contributes at most a log-power coefficient bound times $sum_(h lt.double X \/ Y) tau \( 1 + a h \)
  tau \( 1 + b h \)$. Cauchy and the divisor moment estimate from the preceding section bound this by
  $\( X \/ Y \) L^(C_2)$. There are $O \( Y^2 \)$ possible numeric products $a \, b$,
  and their normalization costs only $C_K$.

For the absolute comparison sum, fix $a \, b asymp Y$. If $k = m n$ and $l = r s$, the cutoff imposes

$ \| b k - a l \| lt.double Y \, wide k \, l lt.double X . $

For each $k$ there are $O \( 1 \)$ choices of $l$, and conversely, because $a \, b asymp Y$.
  Thus Cauchy on this bounded-degree relation and the ordinary divisor second moment give

#[#set math.equation(numbering: n => "(4.60)")
 $ sum_(k \, l lt.double X\
\| b k - a l \| lt.double Y) tau \( k \) tau \( l \) lt.double sum_(k lt.double X) tau \( k \)^2 lt.double X
  L^(C_3) . $ <mem:comparison-representations>]

The endpoint coefficients cost a fixed log power, and (4.23) contributes $O \( L^(3 A_0) \/ Y \)$.
  Summing the $O \( Y^2 \)$ possible $a \, b$ proves

#[#set math.equation(numbering: n => "(4.61)")
 $ lt.double_K X Y L^(C_4 + 3 A_0) \, $ <mem:comparison-absolute-square>]

where $C_3 \, C_4$ are again independent of $K$. Multiplying (4.59) and (4.61) by (4.58) gives
  $O_A \( X Y L^(- A) \)$ for every fixed $A$. This strips all pads.

The comparison estimate also allows the two unshared products to have a common prime.
  The number of pairs $a \, b asymp Y$ sharing any group prime is at most

#[#set math.equation(numbering: n => "(4.62)")
 $ C_K Y^2 sum_(p in union.big_i cal(P)_i) 1 / p^2 lt.double_K Y^2 e^(- L^.1) . $ <mem:unshared-collisions>]

For fixed $p$ there are at most $O \( Y \/ p \)$ possible numeric products divisible by $p$,
  and each product determines its prime list. Apply (4.60) to each such pair and then (4.23);
  their total is again smaller than $X Y$ times every fixed negative log power.

Finally, if $C_5$ denotes the log-power loss in (3.20), its endpoint calculation gives $C_5$ depending only on the
  fixed coefficient bounds, independently of $K$. Since $U V = d_0 Y X$,
  division by $d_0$ bounds each pad dyad by $X Y L^(- E_0 + C_5)$. There are $O_K \( L \)$ pad dyads, so their sum is

#[#set math.equation(numbering: n => "(4.63)")
 $ O_K \( X Y L^(- E_0 + C_5 + 1) \) + O_A \( X Y L^(- A) \) . $ <mem:final-replacement>]

Given a desired replacement precision $A$, choose $E_0 > A + C_5 + 2$ first, then choose $A_0$, then $K$ as above.
  All exponentially small errors have already been bounded after these parameters are fixed and impose no further
  condition on $E_0$. This proves the replacement assertion of Proposition 12 and leaves the unrestricted major
  term for the next section.

== 5 The major term of the determinant estimate <sec:major-arcs>

We retain the notation of Theorem 8, in particular $X = H_m H_n asymp x$ and $W = exp \( L^0.24 \)$.
  The exponent $A_0$ defining $frak(M)$ is fixed throughout this section.
  Constants may depend on $K$ and on its fixed prime bands;
  the powers of $L$ used before choosing $K$ will not depend on $K$.

#thm([Proposition 5.1.])[
  (The determinant major term).  #emph[For every fixed $D > 0$, the unrestricted major sum
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(Q)_Y^(upright("maj")) =  & (product_(i = 1)^K V_i^(- 2)) sum_(a \, b \, m \, n \, r \, s) eta \( a \/ Y \)
   eta \( b \/ Y \) alpha_m overline(alpha_r) beta_n overline(beta_s) thin
   cal(H)_(frak(M)) \( b m n - a r s \; a \, b \) $ <maj:sum>]

 satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ \| cal(Q)_Y^(upright("maj")) \| lt.double_D X Y L^(- D) . $ <maj:bound>]

 Here $a \, b$ run independently over products of one prime from each $cal(P)_i$, with no disjointness condition,
   and $cal(H)_(frak(M))$ denotes the kernel in (3.11). The estimate is uniform in the coefficient intervals,
   in $\| v \| lt.eq L^C$, and in the admissible scale $Y$.]
] <prop:major-term>

The major-arc decomposition will separate three factors: the centered prime-minus-rough coefficient $alpha$,
  the arbitrary rough coefficient $beta$, and the product of small prime labels.
  Uniform cancellation of the first factor alone does not control an integral over a frequency range of length
  comparable to $X$. We isolate one small prime label. Where its polynomial is small,
  a mean-square bound for the product of the two long polynomials suffices; where it is large,
  the frequencies are sparse enough to control the energy of the $beta$ polynomial.
  The next two lemmas supply the uniform cancellation and the sparse-frequency bound, respectively.
  All characters below are extended by zero away from the units.

#thm([Lemma 5.2.])[
  (The long coefficient).  #emph[Fix $A_0 \, B \, A > 0$. For every character $chi$ of modulus at most $L^(A_0)$, put
#[#set math.equation(numbering: n => "(5.3)")
 $ M_alpha \( t \) = 1 / H_m sum_m alpha_m chi \( m \) m^(i t) . $ <maj:M-definition>]

 Then, uniformly for $\| t \| lt.eq 2 X L^B$,
#[#set math.equation(numbering: n => "(5.4)")
 $ \| M_alpha \( t \) \| lt.double_A L^(- A) . $ <maj:M-uniform>]

 The assertion also holds with conjugated coefficients and characters.]
] <maj:long-coefficient>

#proof[
  Write $u = t + v$ and let $I subset \[ H_m \, 2 H_m \]$ be the coefficient interval.
    We give the approximation of rough numbers explicitly. Set $cal(P) \( W \) = { p : p lt.eq W }$ and $S_W =
    sum_(p lt.eq W) p^(- 1) = 0.24 log L + O \( 1 \)$. For an integer $r asymp c log L$, define
  $ T_r \( m \) = sum_(d divides m thin \, med d med upright("squarefree")\
p divides d arrow.r.double p lt.eq W thin \, med \# { p : p divides d } lt.eq r) mu \( d \) . $
  The two consecutive Bonferroni truncations bracket $upright(bold(1))_(P^(-) \( m \) > W)$.
    Their difference is supported on products of $r + 1$ distinct primes.
    Consequently, on every subinterval $I' subset I$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(m in I') \| upright(bold(1))_(P^(-) \( m \) > W) -
     T_r \( m \) \| lt.double H_m frac(S_W^(r + 1), \( r + 1 \) !) + W^(r + 1) \, $ <maj:rough-truncation>]
  where changing $r$ by one, if necessary, is harmless. This follows by summing $upright(bold(1))_(d divides m)$
    over the first omitted degree, using $\# { m in I' : d divides m } = \| I' \| \/ d + O \( 1 \)$.
    Since $r ! gt.eq \( r \/ e \)^r$, choosing $c$ sufficiently large makes the first term $O \( H_m L^(- D') \)$
    for any prescribed fixed $D'$. The second is $x^(o \( 1 \))$, since $r log W = O \( L^0.24 log L \)$.
    Moreover, the absolute reciprocal coefficient mass of every truncation satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ sum_(d upright(" used")) 1 / d lt.eq product_(p lt.eq W) \( 1 + p^(- 1) \) lt.double L^0.24 .
     $ <maj:rough-reciprocal>]
  In particular, increasing the depth to improve the error does not increase the exponent in this bound.
  First consider large $\| u \|$. For each surviving divisor $d$ with $\( d \, k \) = 1$,
    where $k$ is the character modulus, write $m = d z$ and split $z$ into residues modulo $k$.
    Its scale is $N' = H_m \/ d = x^(Omega \( 1 \))$. For $1 lt.eq \| u \| lt.eq T_(*) =
    exp \( L \/ \( log L \)^2 \)$, summation against an integral on a progression gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(z in J subset \[ N' \, 2 N' \]\
z equiv a med \( mod med k \)) z^(i u) = 1 / k integral_J y^(i u) thin thin upright(d) y + O \( 1 + \| u \| \) \,
  wide lr(|integral_J y^(i u) thin thin upright(d) y|) lt.double frac(N', \| u \|) . $ <maj:phase-elementary>]
  Indeed the total variation of $y^(i u)$ on this dyad is $O \( \| u \| \)$;
    the integral formula follows by evaluating $y^(1 + i u) \/ \( 1 + i u \)$ at the endpoints.
    The error, after summing the at most $k$ residues and all $d lt.eq W^r$,
    is $x^(- c_delta)$ after division by $H_m$, uniformly up to $T_(*)$.
    At $T_(*) lt.eq \| u \| < x^2$, apply Lemma 5: its lower scale condition holds because $N' gt.eq
    x^(delta \/ 2)$ for sufficiently large $x$, and its lower frequency condition is weaker than $\| u \| gt.eq
    T_(*)$. Together with (5.6), these bounds and partial summation for $1 \/ log m$ imply
  #[#set math.equation(numbering: n => "(5.8)")
   $ lr(|frac(1, H_m V \( W \)) sum_(m in I\
P^(-) \( m \) > W) frac(chi \( m \) m^(i u), log m)|) lt.double  & L^(- D') +
  cases(delim: "{", L^(C_0) \( \| u \|^(- 1) + x^(- c_delta) \) \, & 1 lt.eq \| u \| lt.eq T_(*) \,, L^(C_0)
  exp \( - L \/ \( log L \)^(C_3) \) \, & T_(*) lt.eq \| u \| < x^2 .) $ <maj:rough-high>]
  Here $C_0$ is fixed after $A_0 \, delta$; it need not grow with the chosen Bonferroni depth.
    The factor $1 \/ V \( W \) lt.double L^0.24$ and the bounded variation of $1 \/ log m$ have been included in $C_0$.
  For the prime part, choose fixed $0 < tau < delta$ and $1 - delta < eta < 1$.
    The scale conditions imply $x^tau \/ 2 lt.eq H_m lt.eq x^eta$ for large $x$.
    Lemma 4, followed by partial summation to replace $p^(- 1)$ by $H_m^(- 1)$,
    gives an arbitrary negative power of $L$ when $L^(B'_0) lt.eq \| u \| lt.eq x^2$.
    Choose $B_2 > C + 2$ sufficiently large after $A \, A_0 \, B$ and the exponent $C_0$.
    Then $L^(B_2) lt.eq \| t \| lt.eq 2 X L^B$ implies $\| u \| asymp \| t \|$, $\| u \| gt.eq L^(B'_0)$,
    and $\| u \| < x^2$. The prime estimate and (5.8) prove (5.4) on this range.
  It remains to treat $\| t \| lt.eq L^(B_2)$, hence $\| u \| lt.eq 2 L^(B_2)$.
    Choose the counting precision $D'$ after $B_2$. Lemma 6 gives, on every subinterval,
  #[#set math.equation(numbering: n => "(5.9)")
   $ sum_(m in I') chi \( m \) upright(bold(1))_(P^(-) \( m \) > W) =
     upright(bold(1))_(chi med upright("principal")) V \( W \) \| I' \| +
     O \( H_m L^(- D') \) . $ <maj:rough-low-count>]
  The principal character equals one on rough numbers because all primes dividing $k$ are at most $W$;
    for nonprincipal characters the count has zero main term by complete-period cancellation.
    For primes, Lemma 2 and character orthogonality give, to any prescribed precision,
  $ sum_(p in I') chi \( p \) = upright(bold(1))_(chi med upright("principal")) integral_(I')
    frac(thin upright(d) y, log y) + O \( H_m L^(- D') \) . $
  Partial summation introduces at most a fixed power of $L$ on this low-frequency range.
    Dividing the rough main term by $V \( W \) log y$ produces exactly $thin upright(d) y \/ log y$;
    its twisted main term therefore cancels the prime main term. Increasing $D'$ gives (5.4).
    Complex conjugation changes only the signs of the real frequencies and the character, so the proof is unchanged. ◻
]

#thm([Lemma 5.3.])[
  (A small prime factor and sparse frequencies).  #emph[Let $P$ satisfy $c L^0.1 lt.eq log P lt.eq C_1 L^0.2$,
    and let $cal(P)$ be any set of primes in $\[ P \, 2 P \]$. For any real $xi$ and any character $chi$, put
$ P_s \( t \) = P^(- 1) sum_(p in cal(P)) chi \( p \) p^(i \( t + xi \)) . $

 Let $N_beta \( t \) = H_n^(- 1) sum_n beta_n chi_n \( n \) n^(i t)$, with $\| beta_n \| lt.eq
   L^C$ on $\[ H_n \, 2 H_n \]$ and $x^delta lt.eq H_n lt.double x$.
   For every fixed $B \, A_s > 0$, the unit intervals meeting
$ { t : \| t \| lt.eq 2 X L^B \, med \| P_s \( t \) \| > L^(- A_s) } $

 form a family $cal(I)$ satisfying
#[#set math.equation(numbering: n => "(5.10)")
 $ \| cal(I) \| lt.eq exp \( O \( L^0.91 \) \) \, wide sum_(I in cal(I)) sup_(t in I) \| N_beta \( t \) \|^2
   lt.double L^(2 C + 1) . $ <maj:sparse-count>]

 Both assertions are uniform in $xi$ and in the prime set.]
] <maj:sparse-frequency>

#proof[
  Put $Z = 4 X L^B$ and $j = floor.l log Z \/ log \( 2 P \) floor.r$.
    Write $P_s \( t \)^j = sum_(n lt.eq \( 2 P \)^j) c_n n^(i t)$.
    For each product $n$, unique factorization bounds the number of ordered prime tuples producing it by $j !$. Hence
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_n \| c_n \|^2 lt.eq j ! P^(- 2 j) \| cal(P) \|^j lt.eq j ! \( C_2 \/ P \)^j . $ <maj:factorial-norm>]
  This is a coefficient estimate for the actual growing degree $j$; no fixed-divisor-moment constant is used for it.
  Choose an exceeding point from each member of $cal(I)$, and split these points into three classes according to
    the integer left endpoint modulo three. Each class is separated by at least one.
    The separated mean-square estimate of Lemma 3, whose constant is independent of the coefficients, gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| cal(I) \| lt.double Z L^(O \( 1 \)) L^(2 A_s j) j ! \( C_2 \/ P \)^j . $ <maj:exception-count-calculation>]
  Since $log Z - j log P lt.double log P + j$ and $j lt.double L^0.9$, the logarithm of its right-hand side is at most
  $ O \( log P + j log \( j + 1 \) + A_s j log L + log L \) = O \( L^0.9 log L + L^0.2 \) = O \( L^0.91 \) . $
  The factor $p^(i xi)$ affects no coefficient absolute value, so this estimate is uniform for all real $xi$.
  For the second assertion choose a maximizing point $t_I$ on the closure of each unit interval,
    and again use three separated classes. In one class consider the evaluation matrix on the full integer
    interval $\[ H_n \, 2 H_n \]$. Its Gram entries are
  $ G_(I \, J) = sum_(H_n lt.eq n lt.eq 2 H_n) n^(i \( t_I - t_J \)) . $
  Set $T_(*) = exp \( L \/ \( log L \)^2 \)$. The diagonal is $O \( H_n \)$.
    For $1 lt.eq \| Delta \| lt.eq T_(*)$, (5.7) with modulus one gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ H_n^(- 1) \| G_(I \, J) \| lt.double \| Delta \|^(- 1) + x^(- c_delta) . $ <maj:Gram-near>]
  For $T_(*) < \| Delta \| lt.eq 4 X L^B + 2 < 4 x^3$, Lemma 5 gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ H_n^(- 1) \| G_(I \, J) \| lt.double exp \( - L \/ \( log L \)^(C_3) \) . $ <maj:Gram-far>]
  All its scale hypotheses hold because $H_n gt.eq x^delta$ and $H_n lt.double x$.
    Separation implies that the sum of $1 \/ \| Delta \|$ in any row is $O \( log \( 2 Z \) \) = O \( L \)$.
    The other row sums tend to zero, since
  $ \| cal(I) \| x^(- c_delta) = o \( 1 \) \, wide \| cal(I) \| exp \( - L \/ \( log L \)^(C_3) \) = o \( 1 \) . $
  Thus the absolute Gram row sums are $O \( H_n L \)$, and the same is true of its operator norm.
    The coefficient vector of $N_beta$ has squared norm $O \( L^(2 C) \/ H_n \)$.
    Applying the Gram bound and adding the three classes proves (5.10). ◻
]

#proof[
  For large $x$ the arcs are disjoint: distinct reduced rationals of denominator at most $L^(A_0)$ are at distance
    at least $L^(- 2 A_0)$, whereas their radii are $2 L^(A_0) \/ Y$ and $Y gt.eq exp \( c L^0.1 \)$.
    On an arc write $theta = h \/ k + lambda \/ Y$, with $\| lambda \| lt.eq
    2 L^(A_0)$ and $thin upright(d) theta = thin upright(d) lambda \/ Y$.
    Every variable in (5.1) is a unit modulo $k$: the group primes and all prime factors of the rough variables
    exceed $k$. The function
  $ \( a \, b \, m \, n \, r \, s \) mapsto upright(e) #scale(x: 120%, y: 120%)[\(]
    h \( b m n - a r s - b + a \) \/ k #scale(x: 120%, y: 120%)[\)] $
  on $\( \( bb(Z) \/ k bb(Z) \)^times \)^6$ has an exact Fourier expansion in products of six multiplicative
    characters. Each Fourier coefficient has absolute value at most one,
    so their total absolute mass is at most $phi \( k \)^6 lt.eq k^6$. There are $O \( L^(2 A_0) \)$ arcs.
    It is therefore enough to estimate each separated character term, uniformly in $lambda$,
    with arbitrarily large logarithmic saving.
  Set $w = b m n \/ \( Y X \)$ and $w' = a r s \/ \( Y X \)$.
    Both lie in a fixed compact subinterval of $\( 0 \, oo \)$.
    Apart from the factors $upright(e) \( - lambda b \/ Y \) upright(e) \( lambda a \/ Y \)$,
    the remaining common kernel is
  $ psi_lambda \( X \( w - w' \) \) \, wide psi_lambda \( y \) = psi \( y \) upright(e) \( lambda y \) . $
  Here is the Mellin separation with its normalization. In coordinates $z = log w'$ and $zeta =
    X log \( w \/ w' \)$, it is
  $ psi_lambda #scale(x: 120%, y: 120%)[\(] X e^z \( e^(zeta \/ X) - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Insert fixed smooth cutoffs equal to one on the possible values of $w \, w'$.
    The resulting function is supported on a fixed compact set of $\( zeta \, z \)$:
    the support of $psi$ forces $\| zeta \| lt.double 1$. Its derivatives of order $r +
    s$ are $O_(r \, s) \( L^(B_0 \( r + s \)) \)$ for some fixed $B_0$ chosen after $A_0$.
    Fourier inversion, with inverse kernel $e^(i \( v zeta + s' z \))$, and the change of variable $t =
    X v$ consequently give the exact identity
  #[#set math.equation(numbering: n => "(5.15)")
   $ psi_lambda \( X \( w - w' \) \) = 1 / X integral.double_(bb(R)^2) F_lambda \( t \/ X \, s' \)
     w^(i t) \( w' \)^(i \( s' - t \)) thin thin upright(d) t thin thin upright(d) s' $ <maj:Mellin-separation>]
  on the coefficient support. Repeated integration by parts yields, for every fixed integer $j gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| F_lambda \( v \, s' \) \|
     lt.double_j \( 1 + \| v \| \/ L^(B_0) \)^(- j) \( 1 + \| s' \| \/ L^(B_0) \)^(- j) . $ <maj:transform-decay>]
  Define the normalized endpoint polynomials
  #[#set math.equation(numbering: n => "(5.17)")
   $ B_lambda \( t \) & = 1 / Y sum_b eta \( b \/ Y \) upright(e) \( - lambda b \/ Y \) (product_i V_i^(- 1))
     chi_b \( b \) b^(i t) \,\
N_beta \( t \) & = 1 / H_n sum_n beta_n chi_n \( n \) n^(i t) \, wide Q \( t \) =
  B_lambda \( t \) M_alpha \( t \) N_beta \( t \) . $ <maj:polynomials>]
  The other endpoint gives a polynomial $Q'$ of the same type with conjugations and sign changes.
    Each unnormalized endpoint sum is $Y X$ times its polynomial.
    Combining these two factors with the $X^(- 1)$ in (5.15) and the arc measure $Y^(- 1)$ gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ \( Y X \)^2 dot.op X^(- 1) dot.op Y^(- 1) = X Y . $ <maj:XY-normalization>]
  The additional factor $\( Y X \)^(- i s')$ has absolute value one.
    Thus, after division by $X Y$, the separated expression is an integral of $F_lambda \( t \/ X \, s' \)
    Q \( t \) Q' \( s' - t \)$, followed by the $lambda$ integral.
  The bound $\| B_lambda \( t \) \| lt.double 1$ follows directly from $b asymp Y$ and
  $ sum_b 1 / b product_i V_i^(- 1) lt.eq product_i (V_i^(- 1) sum_(p in cal(P)_i) p^(- 1)) = 1 . $
  The coefficient of index $u = m n$ in $M_alpha N_beta$ is $O \( L^C tau \( u \) \/ X \)$ and is supported on $u
    asymp X$. Lemma 3 therefore gives a squared coefficient norm $O \( L^(C_4) \/ X \)$ and,
    on every real interval $I$ of length $Z gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral_I \| M_alpha \( t \) N_beta \( t \) \|^2 thin thin upright(d) t lt.double L^(C_4) \( 1 + Z \/ X \) .
     $ <maj:product-mean>]
  The fixed exponent $C_4$ depends only on the original coefficient bounds.
    The estimate is uniform in translates of $I$, by twisting the coefficients,
    and also bounds the mean square of $Q$ and $Q'$.
  Fix $B_1 > B_0 + 1$. Equations (5.16) and (5.19) permit us, to arbitrary logarithmic precision, to restrict to
  #[#set math.equation(numbering: n => "(5.20)")
   $ \| s' \| lt.eq L^(B_1) \, wide \| t \| lt.eq X L^(B_1) . $ <maj:retained-rectangle>]
  For completeness, on a dyadic $t$ interval of length $Z$,
    Cauchy’s inequality bounds the integral of $\| Q \( t \) Q' \( s' - t \) \|$ by $L^(C_4) \( 1 + Z \/ X \)$,
    uniformly in $s'$. For $Z gt.eq X L^(B_1)$ multiply this by $\( 1 + Z \/ \( X L^(B_0) \) \)^(- j)$ and sum the
    geometric tail. For the $s'$ tail, the full weighted $t$ integral is $O \( L^(C_4 + B_0 + 1) \)$,
    uniformly in $s'$, and
  $ integral_(\| s' \| > L^(B_1)) \( 1 + \| s' \| \/ L^(B_0) \)^(- j) thin thin upright(d) s' lt.double_j
    L^(B_0 - \( B_1 - B_0 \) \( j - 1 \)) . $
  Taking $j$ large makes both errors as small as required, including the character and arc costs.
    This argument also covers translated frequencies $s' - t$ without a pointwise tail assumption.
  On (5.20), Cauchy’s inequality in $t$ reduces the claim to proving, for every prescribed $A' > 0$,
  #[#set math.equation(numbering: n => "(5.21)")
   $ integral_(\| t \| lt.eq 2 X L^(B_1)) \| B_lambda \( t \) M_alpha \( t \) N_beta \( t \) \|^2 thin thin
     upright(d) t lt.double_(A') L^(- A') . $ <maj:energy>]
  Indeed the retained $s'$ integral has length $2 L^(B_1)$ and all remaining character and $lambda$ costs are
    fixed powers of $L$.
  Write $b = p b'$ with $p in cal(P)_1$ and split this prime band into $O \( L \)$ ordinary dyads
    $\[ P \, 2 P \)$. The cutoff on $b$ permits restriction to $Y \/ \( 2 P \) lt.eq b' lt.eq 4 Y \/ P$.
    Mellin inversion of $f_lambda \( y \) = eta \( y \) upright(e) \( - lambda y \)$ gives
  $ f_lambda \( y \) = integral_(bb(R)) hat(f)_lambda \( xi \) y^(i xi) thin thin upright(d) xi \, wide
    integral_(bb(R)) \| hat(f)_lambda \( xi \) \| thin thin upright(d) xi lt.double L^(C_5) \, $
  where $C_5$ is fixed after $A_0$. This last bound follows, for example,
    by twice integrating by parts outside $\| xi \| lt.eq 1$;
    the first two derivatives of $f_lambda \( e^z \)$ have fixed compact support and size
    $O \( \( 1 + \| lambda \| \)^2 \)$. The remaining factor
  $ Q_(b') \( u \) = P / Y sum_(Y \/ \( 2 P \) lt.eq b' lt.eq 4 Y \/ P) (product_(i = 2)^K V_i^(- 1))
    chi_b \( b' \) \( b' \)^(i u) $
  has absolute value $O \( 1 \)$ by its reciprocal coefficient mass.
    Precisely, the dyad contribution to $B_lambda \( t \)$ is
  $ V_1^(- 1) integral_(bb(R)) hat(f)_lambda \( xi \) Y^(- i xi)
    (P^(- 1) sum_(p in cal(P)_1 ∩ \[ P \, 2 P \)) chi_b \( p \) p^(i \( t + xi \))) Q_(b') \( t + xi \) thin thin
    upright(d) xi . $
  Minkowski’s integral inequality shows that it suffices to prove
  #[#set math.equation(numbering: n => "(5.22)")
   $ integral_(\| t \| lt.eq 2 X L^(B_1)) \| P_s \( t \) M_alpha \( t \) N_beta \( t \) \|^2 thin thin upright(d)
     t lt.double L^(- A'') $ <maj:isolated-energy>]
  with arbitrary fixed $A''$, uniformly in every real shift $xi$.
    The $O \( L \)$ dyads and the Mellin $L^1$ norm are then paid by increasing $A''$.
    In particular there is no unaccounted Fourier tail in this factor separation.
  On $\| P_s \( t \) \| lt.eq L^(- A_s)$, Equation (5.19) bounds (5.22) by $O \( L^(- 2 A_s + C_4 + B_1) \)$.
    Choose $A_s$ large after $A''$. On the remaining set use the unit intervals of Lemma 15.
    We have $\| P_s \( t \) \| lt.double 1$, and Lemma 14 gives $\| M_alpha \( t \) \| lt.double
    L^(- A)$ everywhere in the retained range, including its low frequencies. Therefore its contribution is
  $ lt.double L^(- 2 A) sum_(I in cal(I)) sup_(t in I) \| N_beta \( t \) \|^2 lt.double L^(- 2 A + 2 C + 1) . $
  Taking $A$ sufficiently large proves (5.22), then (5.21), and finally (5.2). ◻
]

#proof[
  #emph[Completion of Theorem 8.] Fix the requested precision $D_(*)$ and choose the expanded-square precision
    $D_1$ sufficiently large in terms of $D_(*)$ and the original coefficient bound $C$.
    These choices precede $K$. The squarefree-label and coincident-label errors from the Cauchy reduction are
    smaller than every fixed logarithmic power. Proposition 12,
    including its restoration of good states and harmonic pads,
    replaces the remaining determinant equality by (3.11) with error $O \( X Y L^(- D_1) \)$.
  To record the parameter order, first choose $E_0$ after $D_1 \, C$, then the arc exponent $A_0$,
    and finally $K$, as in that proposition. For a pad dyad, division of its pairing bound by $d_0$ uses $U V =
    d_0 Y X$ and gives $X Y L^(- E_0 + O_C \( 1 \))$. There are $O_K \( L \)$ pad dyads;
    thus $E_0$ can absorb this loss with an exponent independent of $K$.
    Constants involving the now fixed $K$ and its band exponents only affect the threshold for $x$.
    The analytic accuracies in Proposition 13 are chosen last, after $A_0$.
    That proposition bounds the unrestricted major term by $O \( X Y L^(- D_1) \)$.
  Consequently the Cauchy square in each $Y$ dyad is $O \( X Y L^(- D_1) \)$.
    Multiplication by its Cauchy factor $O \( X \/ Y \)$ and taking square roots gives $O \( X L^(- D_1 \/ 2) \)$
    for that dyad. The $O_K \( L \)$ dyads of $Y$, and all preceding fixed coefficient losses,
    are absorbed by the original choice of $D_1$. This proves (3.5),
    with $K$ depending on the stated fixed data and not on the particular exponents $a_i$. ◻
]

== 6 Two-sided marked correlations <sec:correlations>

We now allow marks on both endpoints of the shift. The integer $J$ used in this section is sufficiently large and
  #emph[fixed] as $x arrow.r oo$; it is different from the growing determinant parameter in the preceding
  sections. Likewise the active damping parameter $q_0$ below need not equal the parameter $q$ in the fixed-band
  weight $cal(W)$.

Retain the fixed $K$ bands defining $cal(W)$. Independently choose pairwise disjoint active groups $cal(P)_g$,
  indexed by $cal(S) union.sq cal(B)$, such that, for fixed positive constants $c_0 \, C_0 \, v_(-) \, v_(+)$,

#[#set math.equation(numbering: n => "(6.1)")
 $ c_0 log L lt.eq \| cal(S) \| \, \| cal(B) \| lt.eq C_0 log L \, wide v_(-) lt.eq V_g :=
   sum_(p in cal(P)_g) p^(- 1) lt.eq v_(+) \,\
cal(P)_g subset \[ exp \( L^.27 \) \, exp \( L^.36 \) \] quad \( g in cal(S) \) \, wide
  cal(P)_g subset \[ exp \( L^.39 \) \, exp \( L^.46 \) \] quad \( g in cal(B) \) . $ <cor:groups>]

Every big group is the set of all primes in an interval. Write $cal(P) = union.big_g cal(P)_g$,
  $s_P = \| cal(S) \| + \| cal(B) \|$, and define

$ n_(*) := product_(p in.not cal(P)) p^(v_p \( n \)) \, wide omega_g \( n \) :=
  sum_(p in cal(P)_g) upright(bold(1))_(p divides n) \, wide omega_P \( n \) := sum_g omega_g \( n \) \, wide
  mu_g \( p \) := frac(1, V_g p) . $

Thus $n_(*)$ removes the entire active part, including its multiplicities.
  For a vector $upright(bold(t)) = \( t_g \)$ of nonnegative integers,
  a represented list at $n$ consists of $t_g$ ordered distinct prime divisors of $n$ from each group.
  For a function $upright(bold(b))$ of these lists put

#[#set math.equation(numbering: n => "(6.2)")
 $ W_(upright(bold(t)))^(upright(bold(b))) \( n \) := q_0^(omega_P \( n \) - sum_g t_g) product_g V_g^(- t_g)
   sum_(upright("represented lists at ") n) upright(bold(b)) \( upright(bold(p)) \) \, wide
   0 < q_0 < 1 . $ <cor:marked-weight>]

The weight is zero if no list exists. Write $W_(upright(bold(t)))$ when $upright(bold(b)) = 1$, and $W_1 =
  W_(\( 1 \, dots.h \, 1 \))$. For every fixed $m'$,

#[#set math.equation(numbering: n => "(6.3)")
 $ \| W_(upright(bold(t)))^(upright(bold(b))) \( n \) \| lt.eq W_(upright(bold(t))) \( n \) lt.eq
   L^(C \( m' \)) quad #scale(x: 120%, y: 120%)[\(] t_g lt.eq m' \, med \| upright(bold(b)) \| lt.eq
   1 #scale(x: 120%, y: 120%)[\)] . $ <cor:marked-bound>]

Write $\( u \)_t = u \( u - 1 \) dots.h.c \( u - t + 1 \)$, with $\( u \)_0 = 1$.
  Indeed, each factor $q_0^(u - t) \( u \)_t \/ V_g^t$, for $u gt.eq t$,
  is bounded by a constant depending only on $m' \, q_0 \, v_(-)$, and there are $O \( log L \)$ factors.

#thm([Theorem 6.1.])[
  (Two-sided correlation).  #emph[Fix $d gt.eq 1$, $epsilon > 0$, and intervals $I_1 \, dots.h \,
    I_d$ whose lower endpoints are at least $x^epsilon$ and whose upper endpoints have product at most
    $x^(1 - epsilon)$. Let $upright(bold(l)) = \( l_1 \, dots.h \, l_d \)$ run over ordered tuples of distinct
    primes with $l_i in I_i$, and put
#[#set math.equation(numbering: n => "(6.4)")
 $ l := l_1 dots.h.c l_d \, wide C_x := sum_(upright(bold(l))) 1 / l \, wide F_x \( n \) :=
   cal(W) \( n \) (sum_(upright(bold(l))) upright(bold(1))_(l divides n) - C_x) . $ <cor:centered-core>]

 Suppose $G \( n \) = G \( n_(*) \)$ and $\| G \( n \) \| lt.eq L^C tau \( n_(*) \)^C$, for fixed $C$.
   For every fixed smooth compactly supported $Psi : \( 0 \, oo \) arrow.r bb(C)$ and every fixed $A > 0$,
#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(w gt.eq 1) frac(Psi \( w \/ x \), w) F_x \( w \) G \( w + 1 \) W_1 \( w \) W_1 \( w + 1 \) lt.double_A
   L^(- A) . $ <eq:two-sided>]

 The constants and sufficiently-large-$x$ threshold may depend on all the fixed data,
   including the fixed inert bands, but the estimate is uniform over the active groups and slot intervals
   satisfying the stated bounds. The slots have no joint restriction other than distinctness.]
] <thm:two-sided>

The harmonic prime estimates give $C_x = O_epsilon \( 1 \)$.
  On every fixed positive-power range for $n$, there are only $O_epsilon \( 1 \)$ prime divisors in the slot
  ranges. Since $cal(W)$ is bounded for fixed $K \, q$, $F_x$ is bounded there.
  Also $F_x \( p n \) = F_x \( n \)$ for every active prime $p$:
  the active groups are disjoint both from the inert bands and from the long-prime slots.
  These two facts will give the stronger endpoint hypotheses required by the graph argument.

The proof has two stages. First, the graph inputs from S give arbitrary logarithmic savings for a signed
  combination of correlations. After common prime labels have been divided out of both endpoints, one term,
  called the raw term, is the unit-shift correlation in (6.5);
  the other terms have shifts that are products of independently sampled big-group primes.
  We call these other terms the comparison correlations. We then bound each comparison separately,
  using the centered first endpoint, and recover the unit-shift term by subtraction.
  We state the graph inputs with their exact measures before making this reduction.
  The new endpoint estimates begin once the comparison correlations have been identified.

=== 6.1 The exact graph inputs <the-exact-graph-inputs>

For clarity we state the general graph contracts, rather than using a correlation theorem with more restrictive
  endpoint hypotheses. In this subsection only, replace $.27 \, .36 \, .39 \, .46$ in (6.1) by arbitrary fixed
  $0 < a < b < c < d_0 < .47$, and fix an integer $ell gt.eq 1$.
  Extend the divisibility definitions to all $n in bb(Z)$, with every group prime dividing zero.
  Put $M = J + ell$. A pattern $nu$ chooses sets

$ C_g subset { 1 \, dots.h \, J } \, wide C_g = diameter med \( g in cal(S) \) \, wide \| C_g \| lt.eq
  m_0 med \( g in cal(B) \) \, wide t_g = ell + \| C_g \| . $

In each of the first $J$ slots outside $C_g$, the source and target lists have the same prime label.
  The product of these shared labels is $D_R$. In each slot of $C_g$ take an independent auxiliary label of law
  $mu_g$; their product is $D_C$. The dilation $D = D_R D_C$ therefore contains $J$ labels from each group,
  counted with multiplicity. A coefficient $K_nu$ may depend only on the ordered big-group source lists,
  target lists, and auxiliary free labels.

The physical Hilbert space consists of states $\( n \, upright(bold(p)) \)$ with $n in
  bb(Z)$ and $M$ ordered distinct divisors from every group.
  Each state has mass $product_g V_g^(- M)$, with counting measure in $n$.
  Fix an integer $k$ with $0 < \| k \| lt.eq L^(C_2)$. A row operation samples the auxiliary labels, sets $n' =
  n + k D$, and retains the shared labels while summing over physical target lists with coefficient $product_g
  V_g^(- t_g)$. Every auxiliary free label is forbidden from both endpoint lists;
  auxiliary labels may coincide with one another. The row multiplier is

#[#set math.equation(numbering: n => "(6.6)")
 $ K_nu D^(i zeta) q_0^(\( omega_P \( n \) - M s_P \) \/ 2) q_0^(\( omega_P \( n' \) - M s_P \) \/ 2) .
   $ <cor:physical-multiplier>]

Add the patterns and average independent permutations of the $M$ slots in every group at both ends.
  This defines $cal(A)_zeta$. In particular, the joint measure of the two lists in group $g$ is $V_g^(- M - t_g)$
  in either direction. A row operator integrates the target function and returns a function at the source.

The ideal Hilbert space is

$ cal(H)_(upright("id")) = L^2 (product_(g in cal(B)) cal(P)_g^M \, ⨂_(g in cal(B)) mu_g^(⊗ M)) . $

Repetitions are allowed here. Retain the shared coordinates and sample the unshared target and auxiliary
  coordinates independently. If $D_(cal(B))$ is the big-group part of $D$,
  use multiplier $K_nu D_(cal(B))^(i zeta) upright(e) \( Theta D_(cal(B)) \)$.
  The sum, symmetrized at both ends, is $cal(T)_zeta \( Theta \)$.

#thm([Proposition 6.2.])[
  (General graph transference input).  #emph[Assume $sum_nu sup \| K_nu \| lt.eq L^(C_1)$, where $m_0 \,
    C_1$ are fixed independently of $J$. For every fixed $E > 0$ there is $E_(upright("id")) > 0$,
    depending only on $E$ and the fixed group data, such that
$ sup_(Theta in bb(R)) parallel cal(T)_zeta \( Theta \) parallel_(2 arrow.r 2) lt.eq L^(- E_(upright("id"))) $

 has the following consequence for all sufficiently large fixed $J$.
   Let $I = \[ X \, 2 X \)$, with $x^gamma lt.eq X lt.eq x^(1 \/ gamma)$ for fixed $gamma > 0$.
   If $f$ is supported on positions in $I$, is independent of the chosen marks, and satisfies
$ sup \| f \| lt.eq exp \( O \( sqrt(L) \) \) \, wide parallel f parallel \, parallel g parallel lt.eq
  X^(1 \/ 2) L^(C_3) \, $

 then
#[#set math.equation(numbering: n => "(6.7)")
 $ \| chevron.l f \, cal(A)_zeta g chevron.r \| lt.double X L^(- E + 2 C_3) . $ <cor:transferred-pairing>]

 The lower bound on $J$ may also depend on $m_0 \, C_1$. The threshold for $x$ may depend on $J \, C_2 \, gamma$.
   No further restriction on $zeta$ is imposed beyond the ideal norm hypothesis.
   Taking absolute values of the individual transition coefficients gives row and column sums at most
   $L^(C_(upright("abs")))$, where $C_(upright("abs"))$ is independent of $J$.]
] <prop:graph-transfer>

This is the combination of the local transference theorem, endpoint pairing corollary,
  and physical Schur bound of S #cite(label("SmoothShifted")) Theorem 3.5, Corollary 3.11, and Lemma 3.4.
  Its parameter $q$ is our $q_0$; its laws, physical state masses, two-sided symmetrization,
  and ban on free endpoint labels are exactly those defined above.
  In the absolute bound, if a target has $y gt.eq M$ divisors in a group, its unshared list sum is bounded by

$ sup_(z gt.eq 0) V_g^(- t_g) \( z + t_g \)_(t_g) q_0^(z \/ 2) = O_(m_0 \, ell) \( 1 \) . $

The source damping is at most one. Products over $O \( log L \)$ groups and the pattern mass give the asserted
  exponent independent of $J$; the symmetric joint normalization gives the column bound as well.

#thm([Proposition 6.3.])[
  (Residual ideal family input).  #emph[For every $E_(upright("id")) > 0$ and fixed $C_4 gt.eq 0$,
    there are fixed $m_0 \, J_0 \, C_1$ such that, for each fixed $J gt.eq J_0$,
    a family consisting of the raw pattern $C_g = diameter$, $K_0 = 1$, and signed comparison patterns satisfies
#[#set math.equation(numbering: n => "(6.8)")
 $ sum_nu sup \| K_nu \| lt.eq L^(C_1) \, wide sup_(Theta in bb(R)\
\| zeta \| lt.eq L^(C_4)) parallel cal(T)_zeta \( Theta \) parallel_(2 arrow.r 2) lt.eq
  L^(- E_(upright("id"))) . $ <cor:ideal-bound>]

 The family is independent of $Theta \, zeta$; its defining parameters are independent of $J$.]
  #emph[Split the big groups into two blocks. Every comparison frees nonempty sets of probes $A \,
    B$ in the respective blocks, with coefficient
#[#set math.equation(numbering: n => "(6.9)")
 $ - \( - 1 \)^(\| A \| + \| B \|) cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) . $ <cor:comparison-kernel>]

 Here $D_A \, D_B$ are the free products, $X_A$ is the corresponding target-mark product,
   and $X_B$ the corresponding source-mark product. No shared or final $ell$ label enters these kernels.
   For a nonempty slot set $Lambda$ with at most $m_0$ slots in each group,
#[#set math.equation(numbering: n => "(6.10)")
 $ cal(K)_Lambda \( D \, X \) = sum_(j : nu_(Lambda j) gt.eq xi)
   frac(upright(bold(1))_(log D in I_j) upright(bold(1))_(log X in I_j), nu_(Lambda j)) sum_(chi upright(" primitive")\
"cond" \( chi \) lt.eq Q) overline(chi \( D \)) chi \( X \) \, wide
  I_j = \[ j h \, \( j + 1 \) h \) . $ <cor:cell-kernel>]

 The number $nu_(Lambda j)$ is the cell probability for the independent slot laws.
   The parameters $Q \, h^(- 1) \, xi^(- 1)$ are fixed powers of $L$, with $h lt.eq 1$.
   There are at most $Q^2$ characters and $O_(m_0) \( 1 + L^(d_0) log L \/ h \)$ nonempty cells, and
$ sup \| cal(K)_Lambda \| lt.eq Q^2 xi^(- 1) \, wide sup_X bb(E)_D \| cal(K)_Lambda \( D \, X \) \| lt.eq Q^2 . $

 More precisely, for any prescribed fixed $A_0 > 0$, the parameters may be chosen, independently of $J$,
   so that for arbitrary $L^2$ tuple tests $f \( X_B \) \, g \( X_A \)$ and all $theta in bb(R)$,
   $\| zeta \| lt.eq L^(C_4)$,
#[#set math.equation(numbering: n => "(6.11)")
 $ \| bb(E) thin overline(f \( X_B \)) g \( X_A \) #scale(x: 120%, y: 120%)[\[] & \( X_A X_B \)^(i zeta)
   upright(e) \( theta X_A X_B \)\
 & - cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) \( D_A D_B \)^(i zeta) upright(e) \( theta D_A D_B \)
   #scale(x: 120%, y: 120%)[\]] \| lt.eq L^(- A_0) parallel f parallel_2 parallel g parallel_2 .
   $ <cor:comparison-contract>]

 The four label tuples in this expectation are independent; the tests need not depend only on their products.
   Expanding the two kernels, including all patterns, has total coefficient mass and number of terms bounded by
   fixed powers of $L$.]
] <prop:ideal-family>

This is S #cite(label("SmoothShifted")) Theorem 4.1 and Lemma 4.3.
  The kernels in (6.10) are two global cell and character expansions;
  there is not a separate character expansion for every group.
  We use these two imported propositions with $ell = k = 1$ and the exponents in (6.1).

=== 6.2 Endpoint bounds and removal of shared labels <endpoint-bounds-and-removal-of-shared-labels>

On a physical state $omega_P \( n \) gt.eq M s_P$. Use endpoint vectors with values $overline(F_x \( n \))$ and
  $G \( n' \)$, respectively, and with one extra half-damping factor at each endpoint.
  The conjugation compensates for that in the Hilbert-space pairing.
  These extra factors are at most one and are independent of the lists.
  For a fixed ordered physical list with squarefree product $P$, $n_(*) divides n \/ P$.
  The divisor moment bound of Lemma 3 gives

$ sum_(n asymp X\
P divides n) \| G \( n \) \|^2 lt.eq L^(2 C) sum_(v lt.double X \/ P) tau \( v \)^(2 C) lt.double \( X \/ P \)
  L^(C_(*)) . $

The same statement holds for $F_x$, which is bounded. Here $P lt.eq exp \( O_J \( L^.46 log L \) \) =
  x^(o \( 1 \))$, and the normalized list sum satisfies

#[#set math.equation(numbering: n => "(6.12)")
 $ product_g V_g^(- M) sum_(upright("physical lists")) 1 / P lt.eq
   product_g (sum_(p in cal(P)_g) frac(1, V_g p))^M = 1 . $ <cor:list-norm>]

Consequently both endpoint norms on an enlarged dyad are at most $X^(1 \/ 2) L^(C_3)$,
  where $C_3$ is independent of $J$ and $m_0$. The first vector has bounded supremum.
  It is essential here to keep $q_0^(\( omega_P \( n \) - M s_P \) \/ 2) lt.eq 1$ intact;
  separating its two powers would introduce an unnecessary exponent depending on $J$.

Insert $Psi \( n \/ \( x D \) \) \/ n$ into the physical edge pairing.
  Its support has $n asymp n' asymp x D = x^(1 + o \( 1 \))$.
  Partition $n$ into $O \( L \)$ dyads $\[ X \, 2 X \)$, restricting $n'$ to fixed enlargements.
  Let $phi.alt \( u \) = Psi \( e^u \)$ and use the convention $hat(phi.alt) \( zeta \) =
  integral phi.alt \( u \) e^(- i zeta u) thin thin upright(d) u$. Then

#[#set math.equation(numbering: n => "(6.13)")
 $ Psi (frac(n, x D)) = frac(1, 2 pi) integral_(bb(R)) hat(phi.alt) \( zeta \) \( n \/ x \)^(i zeta) D^(- i zeta)
   thin thin upright(d) zeta . $ <cor:insertion-separation>]

Put $X \/ n$ into the first vector and $1 \/ X$ outside. The endpoint bounds just proved are unchanged.
  Fix the cutoff $\| zeta \| lt.eq L$ now, so $C_4 = 1$ suffices in Proposition 18.

The choices have the following order. After the desired saving $A$ and the original data, fix $C_3$,
  then a transfer saving $E$ large enough to cover $A$, $2 C_3$, and the fixed dyadic costs.
  Choose $E_(upright("id"))$ from Proposition 17, obtain $m_0 \, J_0 \, C_1$ from Proposition 18,
  and finally choose a fixed $J$ satisfying both lower bounds.
  For the tail of (6.13), the absolute Schur estimate and the endpoint norms cost at most a fixed power of $L$. Since

$ integral_(\| zeta \| > L) \| hat(phi.alt) \( zeta \) \| thin thin upright(d) zeta lt.double_N L^(- N) $

for every fixed $N$, its differentiation order can be chosen after the family is fixed.
  The cutoff exponent does not have to change. Thus the total residual edge pairing is $O_A \( L^(- A) \)$,
  with as much extra fixed saving as will be needed below.

For a single pattern put $n = D_R w$, $n' = D_R w'$. The shift becomes $w' = w + D_C$.
  Away from shared-label collisions,

#[#set math.equation(numbering: n => "(6.14)")
 $ omega_g \( D_R w \) - M = omega_g \( w \) - t_g \, wide V_g^(- M - t_g) =
   V_g^(- \( M - t_g \)) V_g^(- 2 t_g) \, wide 1 / n = frac(1, D_R w) . $ <cor:stripping-normalization>]

The factor $D_R^(- 1)$ changes each shared sum into its probability law $mu_g$,
  and the remaining list factors and damping are exactly $W_(upright(bold(t))) \( w \)
  W_(upright(bold(t))) \( w' \)$. The endpoint cores are invariant under these labels.
  The comparison coefficients involve no shared labels. Consequently the stripped expression is

#[#set math.equation(numbering: n => "(6.15)")
 $ bb(E)_(D_C) sum_(w gt.eq 1) frac(Psi \( w \/ \( x D_C \) \), w) F_x \( w \) G \( w + D_C \)
   W_(upright(bold(t))) \( w \) W_(upright(bold(t))) \( w + D_C \)
   bb(E)_(upright(bold(p)) \( w \) \, upright(bold(p)) \( w + D_C \)) K_nu \, $ <cor:stripped>]

where the last expectation is uniform on each endpoint’s ordered unshared lists.
  The independent permutations have total mass one and only rename the ordered slots,
  so they introduce no factorial factor.

We justify restoring all the restrictions suppressed in this formula.
  There are $O_J \( log L \)$ shared or free slots. Every group atom has size $O \( exp \( - L^.27 \) \)$.
  Conditional on $w \, w'$ and the free labels, the harmonic mass of a shared/shared coincidence,
  a shared/free coincidence, or a shared prime dividing $w w'$ is therefore

#[#set math.equation(numbering: n => "(6.16)")
 $ O_J #scale(x: 120%, y: 120%)[\(] L^(C_J) exp \( - L^.27 \) #scale(x: 120%, y: 120%)[\)] . $ <cor:shared-collision>]

For the last assertion use that an integer of size $x^(O \( 1 \))$ has at most $O \( L \)$ distinct prime factors.
  On actual overlap exceptions the unshared labels still divide $w \, w'$.
  Changing the damping loses at most $q_0^(- 2 M s_P) = L^(O \( J \))$.
  The marked bounds and Cauchy with fixed divisor moments on the translated dyads bound the remaining harmonic sum
  by a fixed log power. Thus (6.16) also controls these actual exceptions.

If a free prime occurs in either unshared endpoint list, it divides $D_C$ and one of $w \, w + D_C$, hence both.
  It is at least $exp \( L^.39 \)$. On $w asymp x D_C$ the count of its multiples is $O \( x D_C \/ p \)$;
  Cauchy and a fixed higher divisor moment bound the corresponding weighted harmonic mass by $L^(O \( 1 \))
  p^(- 1 \/ 2)$. Summing over the $O_(m_0) \( log L \)$ free slots costs $L^(O \( 1 \)) exp \( - c L^.39 \)$.
  This also restores any coincidence between the two unshared endpoint lists,
  since such a label must divide their difference $D_C$. All errors remain smaller than every negative log power
  after the fixed pattern cost. They are incurred after $J$ is fixed and do not change the exponent $C_3$ used in
  transference. For the raw pattern, $D_C = 1$ and $t_g = 1$, so (6.15) is precisely the left side of (6.5).

The transferred estimate therefore controls the desired correlation plus the signed comparison correlations
  (6.15). It remains to bound the latter separately. Their shifts contain two nonempty products of free big-group
  labels; these products will give a bilinear Fourier multiplier.
  All cancellation required at an endpoint will come from the centered function $F_x$.

=== 6.3 Comparison multipliers and local energy <comparison-multipliers-and-local-energy>

Expand the two kernels in (6.9). Their contract supplies only a fixed log-power total cost.
  In each term the two nonempty free products are independent and lie in log cells of width at most one,
  say $D_A asymp U_1$, $D_B asymp U_2$. Put

#[#set math.equation(numbering: n => "(6.17)")
 $ H' = U_1 U_2 \, wide Y = x H' \, wide U_i gt.eq exp \( L^.39 - O \( 1 \) \) \, wide H' lt.eq
   exp \( O_(m_0) \( L^.46 log L \) \) . $ <cor:comparison-scales>]

The cell and character expansion factors into separate bounded tests on the two free tuples and on each endpoint’s
  big marks. Insert fixed smooth cutoffs at scale $Y$ at both endpoints.
  Fourier inversion in logarithmic size separates $Psi \( w \/ \( x D_A D_B \) \) \/ w$ as in (6.13).
  After a factor $1 \/ Y$, it is enough to estimate combinations of

#[#set math.equation(numbering: n => "(6.18)")
 $ bb(E) thin b_1 \( D_A \) b_2 \( D_B \) sum_w cal(U) \( w \) cal(V) \( w + D_A D_B \) \, wide \| b_i \| lt.eq
   1 . $ <cor:comparison-sum>]

Tuple tests may be used in place of product tests; conditioning on the product produces the notation here.
  The endpoint sequences have smooth cutoffs at $Y$, fixed log-power twists,
  and the form of their respective invariant cores times $W_(upright(bold(t)))^(upright(bold(b)))$,
  with $\| upright(bold(b)) \| lt.eq 1$ depending only on big marks. Fixed divisor moments give

#[#set math.equation(numbering: n => "(6.19)")
 $ sum_w \| cal(U) \( w \) \|^2 + sum_w \| cal(V) \( w \) \|^2 lt.double Y L^(C_5) . $ <cor:endpoint-squares>]

These estimates also bound the separated Fourier tails absolutely:
  on any translated time interval, the corresponding collapsed Dirichlet polynomials obey the coefficient
  mean-square estimate. Smooth Fourier decay can therefore give any required precision.
  All exponents chosen from now on may depend on the fixed ideal family.

The additive multiplier for (6.18) is

$ frak(m) \( theta \) := bb(E) thin b_1 \( D_A \) b_2 \( D_B \) upright(e) \( theta D_A D_B \) \,
  wide \| frak(m) \( theta \) \| lt.eq 1 . $

The product probability of a tuple using $k_g lt.eq m_0$ slots per group is, by unique factorization,

$ rho \( u \) = 1 / u product_g frac(k_g !, V_g^(k_g) product_p a_p !) lt.eq L^(C_7) / u . $

Since its total mass is at most one, each collapsed sequence on $u asymp
  U_i$ has squared coefficient norm at most $L^(C_7) \/ U_i$.
  The elementary bilinear Fourier estimate (Cauchy followed by the spacing estimate for $parallel theta u
  parallel^(- 1)$) consequently gives, if $\( h \, r \) = 1$ and $\| theta - h \/ r \| lt.eq r^(- 2)$,

#[#set math.equation(numbering: n => "(6.20)")
 $ \| frak(m) \( theta \) \| lt.double L^(C_7)
   (frac(\( U_1 \/ r + 1 \) \( U_2 + r log \( 2 r \) \), H'))^(1 \/ 2) . $ <cor:bilinear-multiplier>]

For completeness, Cauchy in the variable on the interval of length $O \( U_2 \)$, expansion,
  and the geometric-sum bound give an unnormalized square at most

$ parallel a parallel_2^2 parallel b parallel_2^2
  (U_2 + sum_(1 lt.eq v lt.double U_1) min { U_2 \, parallel theta v parallel_(bb(R) \/ bb(Z))^(- 1) }) . $

For $r gt.eq 2$, split the $v$-range into $O \( 1 + U_1 \/ r \)$ blocks of diameter at most $r \/ 2$.
  Distinct points in one block have residues $theta v$ separated by at least $1 \/ \( 2 r \)$, because $\| theta -
  h \/ r \| lt.eq r^(- 2)$. The sum in a block is at most $O \( U_2 + r log \( 2 r \) \)$.
  The case $r = 1$ is immediate from the trivial bound $U_2$ on each summand.
  This proves (6.20) with the two coefficient norms above.

Given any required saving, choose $C_6$ sufficiently large and set

#[#set math.equation(numbering: n => "(6.21)")
 $ H = H' \/ L^(C_6) \, wide frak(M)_H = union.big_(k lt.eq L^(C_6)\
\( h \, k \) = 1) { theta : \| theta - h \/ k \| lt.eq H^(- 1) } . $ <cor:major-arcs>]

Dirichlet approximation with denominator bound $floor.l H' \/ L^(C_6 - 1) floor.r$ gives a fraction $h \/
  r$ with $\| theta - h \/ r \| lt.eq r^(- 2)$. If $r lt.eq L^(C_6)$, this places $theta$ in $frak(M)_H$.
  Otherwise $L^(C_6) < r lt.double H' \/ L^(C_6 - 1)$, and the expression under the square root in (6.20) is bounded by

$ 1 / r + frac(log \( 2 r \), U_2) + 1 / U_1 + frac(r log \( 2 r \), H') . $

The middle terms save every log power by (6.17), and the other terms give any desired fixed saving by increasing
  $C_6$. Thus $frak(m)$ is arbitrarily log-power small off $frak(M)_H$.

Use the Fourier convention $hat(a) \( theta \) = sum_w a_w upright(e) \( theta w \)$.
  Parseval and (6.19) handle the complement of $frak(M)_H$.
  On its $O \( L^(2 C_6) \)$ arcs, Cauchy and the global energy of $cal(V)$ reduce the problem to

#[#set math.equation(numbering: n => "(6.22)")
 $ integral_(\| beta \| lt.eq H^(- 1)) \| hat(cal(U)) \( h \/ k + beta \) \|^2 thin thin upright(d) beta
   lt.double_(A') Y L^(- A') $ <cor:arc-energy-target>]

for every fixed $A'$. The scale conversion we need is as follows.

#thm([Lemma 6.4.])[
  (Local Mellin energy).  #emph[Let $a_w$ be supported on $w asymp Y$, where $Y = x^(1 + o \( 1 \))$,
    and suppose $H = x^(o \( 1 \)) arrow.r oo$. For every fixed integer $j gt.eq 1$,
#[#set math.equation(numbering: n => "(6.23)")
 $ integral_(\| beta \| lt.eq H^(- 1)) \| hat(a) \( beta \) \|^2 thin thin upright(d) beta lt.double_j 1 /
   Y integral_(bb(R)) \( 1 + H \| t \| \/ Y \)^(- j) lr(|sum_w a_w w^(i t)|)^2 thin thin upright(d) t +
   (H / Y)^2 sum_w \| a_w \|^2 . $ <cor:local-mellin>]

]
] <lem:local-mellin>

#proof[
  Choose a smooth bump $K$ of integral one, supported close enough to zero that its additive Fourier transform has
    modulus at least $1 \/ 2$ on $\[ - 1 \, 1 \]$. Plancherel gives
  $ integral_(\| beta \| lt.eq H^(- 1)) \| hat(a) \( beta \) \|^2 thin thin upright(d) beta lt.double H^(- 2)
    integral_(bb(R)) lr(|sum_w a_w K \( \( w - v \) \/ H \)|)^2 thin thin upright(d) v . $
  Only $v asymp Y$ contributes. On the union of the relevant supports,
    replace $K \( \( w - v \) \/ H \)$ by $K \( v log \( w \/ v \) \/ H \)$:
    their arguments differ by $O \( H \/ Y \)$. Cauchy over the $O \( H \)$ available $w$,
    and integration over the $O \( H \)$ centers for each $w$,
    give normalized squared error $O \( \( H \/ Y \)^2 sum \| a_w \|^2 \)$.
  Write $v = Y e^u$, $h_0 = H \/ Y$, and $P_a \( t \) = sum_w a_w w^(i t)$. Fourier inversion for the new kernel reads
  $ sum_w a_w K \( v log \( w \/ v \) \/ H \) = frac(h_0, 2 pi) integral_(bb(R)) e^(- u)
    hat(K) \( h_0 e^(- u) t \/ \( 2 pi \) \) v^(- i t) P_a \( t \) thin thin upright(d) t . $
  Insert a fixed smooth cutoff in $u$ for $v asymp Y$. Two integrations by parts in $u$ and the Schwartz bounds
    for $hat(K)$ bound the Fourier transform of this amplitude by
    $C_j \( 1 + \| s \| \)^(- 2) \( 1 + h_0 \| t \| \)^(- j)$.
    Expand in $s$, apply Minkowski and Plancherel in $u$, and use $thin upright(d) v lt.double Y thin thin
    upright(d) u$. The outside normalization is $H^(- 2) Y h_0^2 = Y^(- 1)$. Increasing the decay order proves (6.23). ◻
]

Apply the lemma to $a_w = cal(U) \( w \) upright(e) \( h w \/ k \)$. The additive error is negligible by (6.19).
  The Dirichlet mean-square bound in Lemma 3 gives, on every dyadic time interval of length $R$,

$ Y^(- 2) integral_(R lt.eq \| t \| lt.eq 2 R) \| P_a \( t \) \|^2 thin thin upright(d) t lt.double
  L^(C_5 + 1) \( 1 + R \/ Y \) . $

For $T_0 = L Y \/ H$, the tail in (6.23) is thus at most

$ Y L^(C_5 + 1) sum_(r gt.eq 0) \( 2^r L \)^(- j) \( 1 + 2^r L \/ H \) \, $

which is as small as required on choosing $j$ last. It remains to prove, for every fixed $A' > 0$,

#[#set math.equation(numbering: n => "(6.24)")
 $ integral_(\| t \| lt.eq T_0) lr(|Y^(- 1) sum_w cal(U) \( w \) upright(e) \( h w \/ k \) w^(i t)|)^2 thin thin
   upright(d) t lt.double_(A') L^(- A') \, wide T_0 = frac(L Y, H) = x L^(C_6 + 1) . $ <cor:SM>]

Notice that the first term in (6.23) is $Y$ times the integral in (6.24), as required by (6.22).

We now prove this one endpoint estimate. At low Mellin frequencies,
  a finite divisor model makes the centering in $F_x$ cancel the main term.
  At high frequencies, one small-prime mark supplies a polynomial that is small outside a sparse set of times.
  On that sparse set we treat the positive tuple sum and its subtracted constant separately:
  the tuple sum has a long-prime factor, whereas the constant term requires cancellation on the divisor
  progressions of the finite model.

=== 6.4 A divisor model and low Mellin frequencies <a-divisor-model-and-low-mellin-frequencies>

#thm([Lemma 6.5.])[
  (Truncated divisor model).  #emph[Let $H_(upright("marks")) \( n \) =
    cal(W) \( n \) W_(upright(bold(t)))^(upright(bold(b))) \( n \)$, where $0 lt.eq t_g lt.eq
    m'$ for fixed $m'$ and $\| upright(bold(b)) \| lt.eq 1$. In particular, zero values of $t_g$ are allowed;
    these occur when a small mark is removed below. There is a divisor sum
#[#set math.equation(numbering: n => "(6.25)")
 $ H_0 \( n \) = sum_(d' divides n) A_(d') \, wide d' lt.eq exp \( O \( L^.47 \) \) \, wide
   sum_(d') frac(\| A_(d') \|, d') lt.eq L^(C_8) \, $ <cor:divisor-model>]

 whose prime divisors all belong to the active or inert groups, such that, on every positive integer dyad $n asymp R$,
#[#set math.equation(numbering: n => "(6.26)")
 $ sum_(n asymp R) \| H_(upright("marks")) \( n \) - H_0 \( n \) \|^2 lt.double_N R L^(- N) $ <cor:model-error>]

 for every fixed $N$. The assertion is uniform in the bounded tuple test $upright(bold(b))$,
   with no regularity assumption on that test.]
] <lem:divisor-model>

#proof[
  Expand both weights into their represented lists. The inert list has one prime per band,
    and the active list has $t_g$ per group. For a fixed represented list,
    the damping is exactly the product of $q$ or $q_0$ over the remaining distinct group primes that divide $n$.
    Expand this product as
  $ product_(p upright(" not represented")) \( 1 - \( 1 - q_p \) upright(bold(1))_(p divides n) \) \, wide
    q_p in { q \, q_0 } \, $
  and truncate after $h_0 = floor.l L^.01 floor.r$ additional primes.
    All represented primes are distinct within their groups, and the additional primes are disjoint from them.
    Each resulting divisor has at most $O_(m') \( log L \) + K + h_0$ prime factors,
    all at most $exp \( L^.46 \)$. This proves the support assertion in (6.25).
  In the reciprocal coefficient sum the normalized represented lists have total mass at most one,
    by their harmonic definitions. The additional subset sums are at most
  $ product_(p upright(" in all groups")) \( 1 + \( 1 - q_p \) \/ p \) lt.eq exp \( O \( log L \) \) = L^(O \( 1 \)) . $
  This proves the coefficient bound, even after absolute values.
  Let $omega_(upright("tot"))$ count hits in all active and inert groups.
    For fixed list sizes, their normalized counts are at most $L^(C_9) 2^(omega_(upright("tot")))$:
    use $\( u \)_t = t ! binom(u, t) lt.eq t ! 2^u$ in each group.
    The discarded binomial expansion is at most $2^(omega_(upright("tot")))
    upright(bold(1))_(omega_(upright("tot")) gt.eq h_0)$. Hence the absolute pointwise error is bounded by
    $L^(C_9) 4^(omega_(upright("tot"))) upright(bold(1))_(omega_(upright("tot")) gt.eq h_0)$.
    For any fixed $B > 1$, expanding $B^(omega_(upright("tot")))$ into squarefree divisors and counting their
    multiples gives
  #[#set math.equation(numbering: n => "(6.27)")
   $ sum_(n asymp R) B^(omega_(upright("tot")) \( n \)) lt.double R
     product_(p upright(" in all groups")) \( 1 + \( B - 1 \) \/ p \) lt.double R L^(C \( B \)) . $ <cor:omega-moment>]
  Indeed only divisors at most a constant times $R$ can occur,
    and each has $O \( R \/ d \)$ multiples in the dyad. Since $16^u upright(bold(1))_(u gt.eq h_0) lt.eq
    2^(- h_0) 32^u$, the square of the error has total at most $R L^(O \( 1 \)) 2^(- h_0)$.
    This proves (6.26) for every fixed $N$. ◻
]

Write the first endpoint as

#[#set math.equation(numbering: n => "(6.28)")
 $ cal(U) \( w \) = psi_1 \( w \/ Y \) w^(i sigma) (sum_(upright(bold(l))) upright(bold(1))_(l divides w) - C_x)
   H_(upright("marks")) \( w \) \, $ <cor:U-form>]

where $psi_1$ has fixed compact support and its rescaled derivatives, as well as $\| sigma \|$,
  have fixed log-power bounds. For every fixed $B' > 0$, we claim uniformly for $\| t \| lt.eq
  L^(B')$ that the normalized sum in (6.24) saves any prescribed log power.

In a tuple term put $w = l n$. All long primes lie outside the marked groups, so $H_(upright("marks")) \( l n \) =
  H_(upright("marks")) \( n \)$. Apply Lemma 20 on the scales $Y \/
  l$ and $Y$ in the tuple and constant terms respectively. Cauchy and (6.26) make the total normalized error at
  most $L^(- N) \( 1 + sum_(upright(bold(l))) 1 \/ l \)$, after renaming $N$.
  For a fixed divisor $d'$, all primes in $l d'$ exceed $k$ for large $x$, so $gcd \( l d' \, k \) = 1$.
  Smooth sum–integral comparison on the progressions modulo $k$ gives

#[#set math.equation(numbering: n => "(6.29)")
 $ & 1 / Y sum_(v gt.eq 1) psi_1 \( l d' v \/ Y \) \( l d' v \)^(i \( t + sigma \)) upright(e) \( h l d' v \/ k \)\
 & quad = frac(1, l d') (1 / k sum_(a med mod med k) upright(e) \( h a \/ k \)) integral_0^oo
   psi_1 \( z \) \( Y z \)^(i \( t + sigma \)) thin thin upright(d) z +
   O \( Y^(- 1) L^(C \( B' \)) \) . $ <cor:low-main-term>]

The sum has scale $Y \/ \( l d' \) gt.eq x^(epsilon - o \( 1 \))$.
  The error follows by summing the endpoint and total-variation errors over $k$ residue classes;
  all derivative and modulus costs are fixed log powers. Moreover

$ sum_(upright(bold(l))) 1 lt.eq x^(1 - epsilon) C_x \, wide sum_(d') \| A_(d') \| lt.eq
  exp \( O \( L^.47 \) \) L^(C_8) = x^(o \( 1 \)) . $

The summed errors in (6.29) are therefore $O \( x^(- epsilon + o \( 1 \)) \)$, since $Y gt.eq x^(1 - o \( 1 \))$.
  The main term depends on $l$ only through $1 \/ l$. Its tuple sum is exactly $C_x$ times the main term for the
  subtracted constant. They cancel, including the complete residue average.
  Choosing $N$ after $B'$ proves (6.24) on every fixed log-power time interval.

=== 6.5 High frequencies: factorization and exceptional times <high-frequencies-factorization-and-exceptional-times>

Choose a small group $g_s$. It has $t_(g_s) = 1$ in every comparison,
  and the tuple test depends only on big marks. Except when a prime of this group divides $w$ twice,

#[#set math.equation(numbering: n => "(6.30)")
 $ W_(upright(bold(t)))^(upright(bold(b))) \( w \) = 1 / V_(g_s) sum_(p_s divides w\
p_s in cal(P)_(g_s)) W_(upright(bold(t)) - upright(bold(e))_(g_s))^(upright(bold(b))) \( w \/ p_s \) .
  $ <cor:extract-small>]

This follows directly by removing the represented small prime; the remaining damping exponent is unchanged.
  Both sides are bounded by fixed log powers. The square exceptions have relative count at most $L^(O \( 1 \))
  exp \( - L^.27 \)$ on the relevant dyads. In the positive tuple part we may also allow repeated slot primes:
  the extra terms have a square of a prime at least $x^epsilon$ dividing $w$,
  a relative count $O \( x^(- epsilon) \)$. Slot multiplicities at each $w asymp Y$ remain bounded.
  Lemma 3, applied to these coefficient errors, makes their normalized integrated square over $\| t \| lt.eq
  T_0$ smaller than every negative log power. Indeed their squared coefficient norm is at most $Y
  L^(O \( 1 \)) \( exp \( - L^.27 \) + x^(- epsilon) \)$, and $T_0 \/ Y = L \/ H = o \( 1 \)$.

In the tuple part factor $w = p_s p_l u$, where $p_l = l_1$ lies in the first long-prime slot.
  After allowing repeated slots the coefficient on $u$ is exactly

#[#set math.equation(numbering: n => "(6.31)")
 $ W_(upright(bold(t)) - upright(bold(e))_(g_s))^(upright(bold(b))) \( u \) cal(W) \( u \)
   sum_(l_2 \, dots.h \, l_d) upright(bold(1))_(l_2 dots.h.c l_d divides u) . $ <cor:u-coefficient>]

For $d = 1$ the final factor is one. This is bounded by a fixed log power times a fixed divisor power.
  In the constant part write $w = p_s n$; its coefficient is just the remaining marked weight times $cal(W) \( n \)$.

Separate the rational phase by residue classes modulo $k$.
  In the tuple part, $p_s \, p_l$ are units modulo $k$; on fixed classes for $p_s$ and $u$,
  expand the remaining test in characters of $p_l$ by orthogonality on the units.
  In the constant part fix classes for $p_s \, n$. Both operations have polynomial-in-$k$ total cost and do not
  require $u$ or $n$ to be units. Divide all factors into dyads and Fourier-separate the smooth product cutoff in
  logarithmic size. There are only a fixed log-power number of boxes.
  Their factor scales have product comparable to $Y$, and every collapsed coefficient sequence of normalized scale
  $R$ has

#[#set math.equation(numbering: n => "(6.32)")
 $ sum_(v asymp R) \| c_v \|^2 lt.double L^(C_11) \/ R \, $ <cor:collapsed-coefficients>]

by fixed divisor moments. This applies also to the uncut product of all factors,
  so Dirichlet mean squares uniformly on translated time intervals justify discarding the Fourier tails with
  arbitrary log saving. Retain only shifts of fixed log-power size.
  Enlarge the low-time exponent $B'$ beyond these shifts and any later prime thresholds.
  The low-time argument already proved is available for this enlarged $B'$.
  At the remaining times all retained shifts of $t$ are comparable in magnitude to $t$.

It remains to treat products of normalized polynomials at a common time, with $L^(B') lt.eq \| t \| lt.eq 2 T_0$.
  In every such product there is a small-prime factor

#[#set math.equation(numbering: n => "(6.33)")
 $ P_s \( t \) = P^(- 1) sum_(p_s asymp P\
p_s in cal(P)_(g_s)) b_s \( p_s \) p_s^(i t) \, wide c L^.27 lt.eq log P lt.eq L^.36 \, wide \| b_s \| lt.eq
  L^(C_12) . $ <cor:small-polynomial>]

The coefficients include residue restrictions and retained twists.
  In the tuple part the remaining factors are a long-prime polynomial $P_l \( t \)$ and a polynomial $R \( t \)$
  at scales $N_l$ and

#[#set math.equation(numbering: n => "(6.34)")
 $ R_0 asymp Y \/ \( P N_l \) gt.eq x^(epsilon - o \( 1 \)) . $ <cor:remaining-scale>]

In the constant part the remaining polynomial $N \( t \)$ has scale $R_0 asymp Y \/ P$.

The threshold split and exceptional-frequency treatment follow the Matomäki–Radziwiłł strategy;
  see #cite(label("MatomakiRadziwill2017")) §2.1 and Lemmas 8–9 of arXiv v4.
  The residual-scale sparse Gram estimate below is adapted here using Appendix A,
  while the factorial coefficient estimate retains the Soundararajan credit stated at its use.

On the set $\| P_s \( t \) \| lt.eq L^(- A_s)$, collapse all remaining factors. Their scale is $Y \/ P$, and

#[#set math.equation(numbering: n => "(6.35)")
 $ frac(Y \/ P, 2 T_0) = frac(H, 2 L P) arrow.r oo \, $ <cor:length-dominates-time>]

because $H gt.eq exp \( 2 L^.39 - O \( log L \) \)$ and $P lt.eq exp \( L^.36 \)$.
  Equations (6.32) and the mean-square bound give a fixed log-power integrated square for this collapsed
  polynomial. Taking $A_s$ sufficiently large handles this part.

Let $cal(J)$ be the integer unit intervals meeting ${ \| t \| lt.eq 2 T_0 : \| P_s \( t \) \| > L^(- A_s) }$. Then

#[#set math.equation(numbering: n => "(6.36)")
 $ \| cal(J) \| lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( L^.36 + L^.73 log L \) #scale(x: 120%, y: 120%)[\)]
   lt.eq exp \( O \( L^.9 \) \) . $ <cor:exceptional-count>]

For this step we use the factorial prime-polynomial coefficient estimate,
  as in #cite(label("Soundararajan2009")) Lemma 3 and its proof,
  together with a coefficient-independent mean square. Put $Z = 8 T_0 + 8$ and $j_0 =
  floor.l log Z \/ log \( 2 P \) floor.r$. Unique factorization gives squared coefficient norm for $P_s^(j_0)$ at most

$ j_0 ! (P^(- 2) sum_(p_s asymp P) \| b_s \( p_s \) \|^2)^(j_0) lt.eq j_0 ! \( L^(C_13) \/ P \)^(j_0) . $

Select a point exceeding the threshold from each occupied interval,
  and split their integer indices modulo three to get separated sets.
  The indices of this powered polynomial are at most $Z$. The separated-point mean-square bound of Lemma 3
  therefore gives

$ \| cal(J) \| lt.double Z L^(O \( 1 \)) j_0 ! \( L^(C_13 + 2 A_s) \/ P \)^(j_0) . $

Since $Z P^(- j_0) lt.eq 2 P thin 2^(j_0)$ and $j_0 = O \( L^.73 \)$, taking logarithms proves (6.36).

We will also use the following sparse bound for any normalized polynomial $R \( t \) =
  sum_(n asymp R_0) c_n n^(i t)$ with $x^(epsilon \/ 2) lt.eq R_0 lt.eq x^2$ and $sum \| c_n \|^2 lt.eq
  L^(C_14) \/ R_0$:

#[#set math.equation(numbering: n => "(6.37)")
 $ sum_(I in cal(J)) sup_(t in I) \| R \( t \) \|^2 lt.double L^(C_15) . $ <cor:sparse-bound>]

Choose maximizing points and again split into three separated classes.
  For $1 lt.eq \| Delta \| lt.eq T_(upright("mod")) := exp \( L \/ \( log L \)^2 \)$,
  sum–integral comparison on the full integer dyad gives

$ R_0^(- 1) lr(|sum_(n asymp R_0) n^(i Delta)|) lt.double \| Delta \|^(- 1) + x^(- c_epsilon) . $

For larger differences, Lemma 5 gives $O \( exp \( - L \/ \( log L \)^(C_16) \) \)$ instead. Its hypotheses hold:
  $R_0 gt.eq x^(epsilon \/ 2) > exp \( L \/ \( log L \)^2 \)$, all relevant scales are at most $2 x^5$,
  and the differences are between $T_(upright("mod"))$ and $4 T_0 + O \( 1 \) < 4 x^3$.
  The Gram matrix of the vectors $\( n^(i t_i) \)_(n asymp R_0)$ consequently has absolute row sum

$ lt.double R_0 (1 + log \( 2 T_0 \) + \| cal(J) \| { x^(- c_epsilon) + exp \( - L \/ \( log L \)^(C_16) \) })
  lt.double R_0 L . $

Here separation bounds the reciprocal-difference sum by $O \( log T_0 \)$, and (6.36) absorbs both small errors.
  The Gram operator bound multiplied by $sum \| c_n \|^2$ proves (6.37).

=== 6.6 The tuple and constant contributions at high times <the-tuple-and-constant-contributions-at-high-times>

In the tuple term the long-prime polynomial is, after partial summation,
  a normalized prime sum with a character modulo $k$ and a fixed log-power twist.
  Its dyad lies between $x^epsilon \/ 2$ and $x^(1 - epsilon)$.
  Choose fixed $0 < tau < epsilon$ and $1 - epsilon < eta < 1$ to apply Lemma 4. For any prescribed $A_l$, it gives

#[#set math.equation(numbering: n => "(6.38)")
 $ \| P_l \( t \) \| lt.double L^(- A_l) quad \( L^(B') lt.eq \| t \| lt.eq 2 T_0 \) \, $ <cor:long-prime-saving>]

after increasing $B'$ beyond its threshold and all retained shifts. The upper frequencies are $< x^2$.
  The remaining coefficient (6.31) has scale (6.34) and obeys (6.32), so (6.37) applies.
  The small polynomial has absolute bound $L^(O \( 1 \))$. Hence on the exceptional intervals the integrated
  square of $P_s P_l R$ is

$ lt.double L^(O \( 1 \) - 2 A_l) sum_(I in cal(J)) sup_(t in I) \| R \( t \) \|^2 \, $

which has arbitrary log saving on choosing $A_l$ large enough.
  Together with the ordinary-time estimate this handles the tuple part.

For the constant part set $R_0 asymp Y \/ P$, and apply Lemma 20 to the remaining marked coefficient at this
  scale. Keep its residue-class restriction separately. If $E \( n \)$ is the coefficient error,
  then for every fixed $N$, $sum_(n asymp R_0) \| E \( n \) \|^2 lt.double R_0 L^(- N)$.
  The mean-square bound on the #emph[entire] retained time interval gives

#[#set math.equation(numbering: n => "(6.39)")
 $ integral_(\| t \| lt.eq 2 T_0) lr(|R_0^(- 1) sum_(n asymp R_0) E \( n \) n^(i t)|)^2 thin thin upright(d) t &
   lt.double L^(- N) (T_0 / R_0 + log R_0)\
 & lt.double L^(- N) (frac(L P, H) + O \( L \)) . $ <cor:constant-model-error>]

By (6.35), $L P \/ H = o \( 1 \)$. Thus the known small-prime suprema and all fixed decomposition costs can be
  paid by choosing $N$ last. In particular the model error is controlled before restricting to the exceptional times.

For the truncated model, a divisor $d'$ leaves a progression modulo $k$ at scale $R' = R_0 \/ d'$.
  Its normalization in $N \( t \)$ is $A_(d') \/ d'$ times normalization at $R'$.
  Since $d' lt.eq exp \( O \( L^.47 \) \)$, one has $R' = x^(1 - o \( 1 \))$.
  The divisor is a unit modulo $k$, so the original residue restriction becomes a single residue restriction at
  this scale. For $L^(B') lt.eq \| t \| lt.eq T_(upright("mod"))$,
  comparison with the integral of the logarithmic phase gives

#[#set math.equation(numbering: n => "(6.40)")
 $ \| N_0 \( t \) \| lt.double L^(C_17) #scale(x: 120%, y: 120%)[\(] \| t \|^(- 1) +
   x^(- c') #scale(x: 120%, y: 120%)[\)] . $ <cor:constant-medium>]

Indeed the normalized integral over a dyad is $O \( 1 \/ \| t \| \)$ and the progression endpoint and variation
  error is $O \( L^(O \( 1 \)) \( 1 + \| t \| \) \/ R' \) = O \( x^(- c') \)$;
  sum using $sum \| A_(d') \| \/ d' lt.eq L^(C_8)$. Retained twists may either be incorporated in $t$ or absorbed
  by increasing $B'$. The square of (6.40) is integrable with

#[#set math.equation(numbering: n => "(6.41)")
 $ integral_(L^(B') lt.eq \| t \| lt.eq T_(upright("mod"))) \| N_0 \( t \) \|^2 thin thin upright(d) t lt.double
   L^(2 C_17 - B') + x^(- c'') . $ <cor:constant-medium-integral>]

This has arbitrary log saving after enlarging $B'$, even after the small-prime absolute bound.
  We used square integration of $1 \/ \| t \|$, not a pointwise log saving multiplied by the full interval length.

For $T_(upright("mod")) < \| t \| lt.eq 2 T_0$, apply Lemma 5 to each such progression.
  Its modulus is at most $L^(C_6)$, its scale is $x^(1 - o \( 1 \))$, and, including retained shifts,
  its frequency is at least $1 / 2 T_(upright("mod")) > exp \( L \/ \( 2 \( log L \)^2 \) \)$ and at most
  $x^(1 + o \( 1 \)) < 4 x^3$. After summing the reciprocal divisor coefficients this yields

#[#set math.equation(numbering: n => "(6.42)")
 $ \| N_0 \( t \) \| lt.double L^(C_18) exp \( - L \/ \( log L \)^(C_19) \) . $ <cor:constant-high>]

We now integrate only on the exceptional unit intervals. By (6.36) and the small-prime absolute bound,
  their total contribution is at most

$ L^(O \( 1 \)) exp #scale(x: 120%, y: 120%)[\(] O \( L^.9 \) -
  2 L \/ \( log L \)^(C_19) #scale(x: 120%, y: 120%)[\)] \, $

which saves every fixed log power. No length-dominated mean-square estimate was required on an individual divisor
  progression: $R'$ may be smaller than $T_0$, and the bounds (6.40)–(6.42) are pointwise.
  Equations (6.39), (6.41), and (6.42) complete the constant-term estimate.

We have proved (6.24) to every fixed log precision. The local Mellin inequality gives (6.22);
  the comparison multiplier estimate and Parseval then bound each term in (6.18), divided by $Y$,
  by an arbitrarily large negative log power. Choose that precision after the known fixed kernel, dyad, arc,
  and separation costs. Their total is therefore negligible.
  Subtracting these comparison terms from the residual pairing leaves its raw pattern,
  already identified with (6.5). This proves Theorem 16.

== 7 Extraction of the prime statistic <ext:section>

Fix $d gt.eq 1$ and $epsilon > 0$. For each $i lt.eq d$, let $cal(I)_i$ be an interval of primes with lower
  endpoint at least $x^epsilon$, and suppose that the product of the upper endpoints is at most $x^(1 - epsilon)$.
  Define

#[#set math.equation(numbering: n => "(7.1)")
 $ f_x \( u \) = sum_(ell_i in cal(I)_i\
ell_1 \, dots.h \, ell_d upright(" distinct")) upright(bold(1))_(ell_1 dots.h.c ell_d divides u) \, wide C_x =
  sum_(ell_i in cal(I)_i\
ell_1 \, dots.h \, ell_d upright(" distinct")) frac(1, ell_1 dots.h.c ell_d) . $ <ext:statistic>]

Lemma 2 gives $C_x = O_(d \, epsilon) \( 1 \)$. On any fixed range $u asymp x$,
  the same bound holds for $f_x \( u \)$: there are only $O_epsilon \( 1 \)$ prime divisors of $u$ exceeding
  $x^epsilon$. All cutoffs below are supported in a fixed compact subset of $\( 0 \, oo \)$.

#thm([Theorem 7.1.])[
  (Interior prime statistic).  #emph[For every nonnegative $Phi in C_c^oo \( \( 0 \, oo \) \)$,
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(p upright(" prime")) Phi \( \( p - 1 \) \/ x \) #scale(x: 120%, y: 120%)[\(] f_x \( p - 1 \) -
   C_x #scale(x: 120%, y: 120%)[\)] = o \( x \/ log x \) . $ <eq:interior>]

 The limit holds through all real $x arrow.r oo$ for the slot intervals just described.]
] <thm:interior>

Throughout the proof write $L = log x$, $W = exp \( L^.24 \)$, and $V \( W \) =
  product_(p lt.eq W) \( 1 - 1 \/ p \)$. Fix $q \, q_0 in \( 0 \, 1 \)$, for example $q = q_0 = 1 \/ 2$.
  A #emph[marking array] will mean $K$ disjoint bands from Theorem 8, with their weight

#[#set math.equation(numbering: n => "(7.3)")
 $ cal(W) \( u \) = product_(i = 1)^K q^(omega_i \( u \) - 1) frac(omega_i \( u \), V_i) \, wide V_i =
   sum_(p in cal(P)_i) 1 / p . $ <ext:array-weight>]

Each band consists of all primes between $exp \( L^(a_i) \)$ and $exp \( 2 L^(a_i) \)$, with $.1 < a_i < .2$.
  The number $K$ and the exponents are fixed in each limit.
  Since $V_i = log 2 + o \( 1 \)$ and $sup_(n gt.eq 0) n q^(n - 1) < oo$,
  these weights are bounded by a constant depending only on $K \, q$, for large $x$.

Presieving $u + 1$ leaves both primes and composites in the average of $cal(W) \( u \) \( f_x \( u \) - C_x \)$.
  We will show that the composite contribution is negligible in two stages.
  The one-sided estimate first replaces its prime factors by rough variables;
  additional divisor marks then allow the two-sided estimate to bound the resulting centered sum.
  This isolates a prime average carrying $cal(W)$. Finally,
  a mean-square bound for averages of disjoint marking arrays removes that weight.

=== 7.1 Progressions and the independent divisor model <progressions-and-the-independent-divisor-model>

For finitely many disjoint arrays, define the independent divisor model by replacing every
  $upright(bold(1))_(p divides u)$ at a band prime with an independent Bernoulli variable of mean $1 \/ p$.
  For a function $H$ of these indicators write $M_x \( H \)$ for its expectation in this model.
  In particular put $m_(cal(W)) = M_x \( cal(W) \)$. There are constants $0 < c_K < C_K < oo$ such that

#[#set math.equation(numbering: n => "(7.4)")
 $ c_K lt.eq m_(cal(W)) lt.eq C_K \, wide M_x \( cal(W)^2 \) lt.eq C_K . $ <ext:model-bounds>]

For the lower bound, in each band the event of exactly one hit has probability $product_p \( 1 - 1 \/ p \) sum_p
  1 \/ \( p - 1 \)$, bounded below since the reciprocal sum tends to $log 2$ and the largest $1 \/
  p$ tends to zero. The weights have a fixed positive value on the event of one hit per band.
  Independence between bands proves the lower bound; boundedness proves the other two assertions.
  These constants can be chosen independently of the particular fixed exponents.

#thm([Lemma 7.2.])[
  (Summed progression remainder).  #emph[Choose $0 < c_0 < epsilon \/ 2$.
    Let $H$ be a weight from a fixed finite collection of disjoint arrays,
    a product of two such weights (allowing a repeated array), a constant,
    or a bounded linear combination of these functions. Then, for every fixed $A > 0$,
#[#set math.equation(numbering: n => "(7.5)")
 $ sum_(r lt.eq x^(c_0)) lr(|sum_(u gt.eq 1\
r divides u + 1) Phi \( u \/ x \) f_x \( u \) H \( u \) - x /
  r (integral_0^oo Phi \( t \) thin thin upright(d) t) C_x M_x \( H \)|) & lt.double_A x L^(- A) . $ <ext:progression>]

 The same assertion holds with $f_x \, C_x$ replaced by $1 \, 1$.
   The constants may depend on the fixed arrays and on the bounded coefficients in the linear combination.]
] <lem:progressions>

#proof[
  We give the expansion including the repeated-array case needed later.
    It suffices to treat one product of weights. In any band $g$ which occurs, let $a_g in { 1 \,
    2 }$ be its multiplicity in the product. Its factor is
  $ V_g^(- a_g) q^(a_g \( omega_g \( u \) - 1 \)) omega_g \( u \)^(a_g) . $
  Expand $omega_g^(a_g)$ as the sum over ordered $a_g$-tuples of divisor primes, permitting coincidences.
    For a chosen tuple let $S_g$ be its set of distinct primes.
    On the event $S_g divides u$, where this notation means that every prime in $S_g$ divides $u$, the contribution is
  #[#set math.equation(numbering: n => "(7.6)")
   $ V_g^(- a_g) q^(a_g \( \| S_g \| - 1 \)) upright(bold(1))_(S_g divides u) product_(p in cal(P)_g \\ S_g)
     #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - q^(a_g) \) upright(bold(1))_(p divides u)
     #scale(x: 120%, y: 120%)[\)] . $ <ext:represented-union>]
  Thus repetitions change the damping to $q^2$ on the unrepresented primes.
    For instance, the reciprocal mass of the represented unions when $a_g = 2$ is exactly
  $ V_g^(- 2) {V_g + q^2 (V_g^2 - sum_(p in cal(P)_g) p^(- 2))} \, $
  and is bounded. For $a_g = 1$ that mass is one. Multiplying over the fixed number of bands shows that all
    represented unions have total reciprocal mass $O \( 1 \)$,
    with their nonnegative coefficients and their multiplicities included.
  Expand the remaining product in (7.6) through degree $h_0 = floor.l L^.01 floor.r$ in the unrepresented primes.
    Bonferroni inequalities, valid for factors $1 - t_p$ with $0 lt.eq t_p lt.eq 1$,
    bound the error in absolute value by the nonnegative term of degree $h_0 + 1$.
    If $C_(*)$ bounds the sum of the reciprocal masses of all bands involved,
    the total reciprocal coefficient mass at degree $t$ is at most a fixed constant times $C_(*)^t \/ t !$.
    Hence the truncated expansion has reciprocal coefficient mass $O \( 1 \)$ and its error envelope has
    reciprocal mass at most
  #[#set math.equation(numbering: n => "(7.7)")
   $ O (frac(C_(*)^(h_0 + 1), \( h_0 + 1 \) !)) = O_A \( L^(- A) \) quad
     upright("for every fixed ") A . $ <ext:bonferroni-tail>]
  Every divisor in the truncation or the error envelope satisfies
  #[#set math.equation(numbering: n => "(7.8)")
   $ d' lt.eq exp #scale(x: 120%, y: 120%)[\(] O_K \( \( h_0 + 1 \) L^.2 \) #scale(x: 120%, y: 120%)[\)] lt.eq
     exp \( O_K \( L^.22 \) \) = x^(o \( 1 \)) . $ <ext:model-divisor-size>]
  It follows also that the ordinary absolute coefficient mass is $x^(o \( 1 \))$:
    multiply its reciprocal mass by the largest divisor. All these facts hold as well for the constant function.
  Fix an ordered long-prime tuple, put $ell = product_i ell_i$, and write $u = ell y$.
    Every band prime is coprime to $ell$. Moreover, every $ell_i > x^(c_0)$, so $\( ell \, r \) = 1$ for $r lt.eq
    x^(c_0)$. The congruence $r divides ell y + 1$ therefore fixes one reduced residue class of $y$ modulo $r$.
    For a divisor $d'$ of band primes the additional condition $d' divides y$ is impossible if $\( d' \, r \) >
    1$. Otherwise the Chinese remainder theorem and smooth summation in one progression give
  #[#set math.equation(numbering: n => "(7.9)")
   $ sum_(y gt.eq 1\
ell y equiv - 1 med \( r \)\
d' divides y) Phi \( ell y \/ x \) = frac(x, ell r d') integral_0^oo Phi \( t \) thin thin upright(d) t +
  O_Phi \( 1 \) . $ <ext:crt-count>]
  The error follows, for example, by comparing each sampling interval with its integral and using the bounded
    total variation of $Phi$. It is uniform in $ell \, r \, d'$.
  Inserting the expansion into (7.9) recovers the model in which the band primes dividing $r$ are forced absent.
    The same calculation for the positive Bonferroni envelope bounds the truncation error by (7.7) times
    $x \/ \( ell r \)$, plus $x^(o \( 1 \))$ in rounding errors.
    There are at most $d ! thin x^(1 - epsilon)$ ordered long-prime tuples,
    since a squarefree product determines at most $d !$ orders.
    Consequently the sum of all rounding errors over tuples and $r lt.eq x^(c_0)$ is
  #[#set math.equation(numbering: n => "(7.10)")
   $ O \( x^(1 - epsilon + c_0 + o \( 1 \)) \) = O \( x^(1 - epsilon \/ 3) \) \, $ <ext:rounding-sum>]
  after increasing the threshold for $x$. When $f_x = 1$, use $ell =
    1$ and the stronger bound $x^(c_0 + o \( 1 \))$ instead. The principal Bonferroni errors sum to at most
    $O \( x C_x L C_(*)^(h_0 + 1) \/ \( h_0 + 1 \) ! \)$ and save every fixed log power.
  Finally, coupling the forced-absence model to the unconditional one and using the boundedness of $H$ bounds
    their mean difference by
  $ O (sum_(p divides r\
p upright(" in the arrays")) 1 / p) lt.double L exp \( - L^.1 \) . $
  Its contribution after summing $1 \/ ell$ and $1 \/ r$ is smaller than every $x L^(- A)$.
    This proves (7.5); bounded linear combinations follow by the triangle inequality. ◻
]

=== 7.2 Presieving and replacement of composite prime slots <presieving-and-replacement-of-composite-prime-slots>

Fix a large even integer $h$, and set

#[#set math.equation(numbering: n => "(7.11)")
 $ gamma = frac(c_0, 4 h + 3) \, wide z = x^gamma . $ <ext:sieve-parameters>]

Apply the block sieve, Lemma 7, to the bad conditions $r' divides u + 1$ at primes $r' lt.eq z$,
  with density $g \( r' \) = 1 \/ r'$. Use separately the two nonnegative weights $Phi \( u \/ x \) cal(W) \( u \)
  f_x \( u \)$ and $Phi \( u \/ x \) cal(W) \( u \)$. The density is at most $1 \/ 2$,
  and its reciprocal mass in every block $\( b \, b^2 \]$ is bounded by an absolute constant by Lemma 2.
  The sieve remainder is bounded by the sum in Lemma 22, because

#[#set math.equation(numbering: n => "(7.12)")
 $ z^(4 h + 2) = x^(c_0 \( 4 h + 2 \) \/ \( 4 h + 3 \)) < x^(c_0) . $ <ext:sieve-level>]

Subtract the second sieve formula times $C_x$ from the first.
  Their main terms cancel, while each relative sieve error is $O \( e^(- h) \)$.
  Since the main terms both contain $m_(cal(W))$ and $product_(r' lt.eq z) \( 1 - 1 \/ r' \) asymp
  1 \/ \( gamma L \)$, we obtain

#[#set math.equation(numbering: n => "(7.13)")
 $ limsup_(x arrow.r oo) frac(L, x m_(cal(W))) lr(|sum_(u gt.eq 1\
P^(-) \( u + 1 \) > z) Phi \( u \/ x \) cal(W) \( u \) \( f_x \( u \) - C_x \)|) lt.double e^(- h) /
  gamma . $ <ext:presift>]

The implied constant depends on the slot and cutoff data but is independent of $K \, h$ and of the fixed array.
  The progression remainders may have constants depending on these choices; their normalized limits are zero.
  In particular, no reciprocal of a rare-mark mean occurs in the surviving error in (7.13).

For integers in this sum that are composite, write their ordered prime factorization as $u + 1 =
  p_1 dots.h.c p_j$, with $p_i > z$. For large $x$, $2 lt.eq j lt.eq 2 \/ gamma$.
  Integers divisible by $p^2$ for a prime $p > z$ number

$ lt.double sum_(p > z) x / p^2 lt.double x \/ z . $

The weights and the possible ordered factorization counts are bounded for fixed $gamma \, d \, K$.
  We may therefore discard these integers at error $o \( x \/ L \)$, count the others with weight $1 \/ j !$,
  and restore repeated factors when convenient at the same cost. For each fixed $j$ we will prove

#[#set math.equation(numbering: n => "(7.14)")
 $ sum_(p_1 \, dots.h \, p_j > z) Phi \( \( p_1 dots.h.c p_j - 1 \) \/ x \) cal(W) \( p_1 dots.h.c p_j - 1 \)
   #scale(x: 120%, y: 120%)[\(] f_x \( p_1 dots.h.c p_j - 1 \) - C_x #scale(x: 120%, y: 120%)[\)] =
   o \( x \/ L \) . $ <ext:composite-vanishing>]

Let

#[#set math.equation(numbering: n => "(7.15)")
 $ kappa \( m \) = frac(1, V \( W \) log m) quad \( m gt.eq 2 \) \, wide a \( m \) =
   upright(bold(1))_(m > z) upright(bold(1))_(P^(-) \( m \) > W) kappa \( m \) . $ <ext:proxy-weight>]

Set $kappa \( 1 \) = 0$; values at one are always excluded by the positive-power threshold tests.
  We first replace every prime variable in (7.14) by this coefficient.
  Telescope one variable $m$ at a time and write $n$ for the product of the other $j - 1$ variables.
  Dyadically decompose $m \, n$ on the support of $Phi \( \( m n - 1 \) \/ x \)$.
  There are $O \( L^2 \)$ boxes, with $H_m H_n asymp x$, and both scales are at least a fixed positive power of
  $x$. The restriction $m > z$ only shortens its dyadic interval, as permitted in Theorem 8.
  The companion coefficient $beta_n$ is supported on $W$-rough integers and is a fixed convolution of prime
  indicators and proxy coefficients. It is bounded by $L^(C_j) tau_(j - 1) \( n \)$ for a fixed exponent $C_j$.

The divisor moment bound in Lemma 3 permits truncation of $beta_n$ at $L^B$, for a sufficiently large fixed $B$,
  with an arbitrarily large log saving in its $ell^1$ norm. More explicitly, for any fixed integer $t > 1$,

$ sum_(n asymp H_n) \| beta_n \| upright(bold(1))_(\| beta_n \| > L^B) lt.eq
  L^(- B \( t - 1 \)) sum_(n asymp H_n) \| beta_n \|^t lt.double H_n L^(C_(j \, t) - B \( t - 1 \)) . $

Multiplying by the number and maximum size of the $m$ coefficients and by the bounded endpoint factor shows that
  the discarded terms are $O \( x L^(- A) \)$ for any prescribed $A$, on taking $B$ large enough.
  This truncation does not change rough support.

Replacing $Phi \( \( m n - 1 \) \/ x \)$ by $Phi \( m n \/ x \)$ costs $O \( x^(- 1) \)$ per coefficient,
  hence only a fixed log power in the whole sum; it is negligible compared with $x \/ L$.
  Fourier inversion of the smooth function in $log \( m n \/ x \)$ separates the two variables into factors
  $m^(i v)$ and $n^(i v)$, with a rapidly decreasing Fourier density.
  Its tails may be discarded past a fixed log power, with any desired saving, using the same coefficient bounds.
  On the remaining frequencies the discrepancy in the $m$ slot is exactly the one in Theorem 8.

To meet its invariance hypothesis globally, clip $f_x \( u \) -
  C_x$ to a fixed interval containing all its values on the support under consideration,
  and divide by a fixed bound so that its modulus is at most one.
  Every long-slot prime lies outside the array bands, so $f_x \( p u \) = f_x \( u \)$ for each band prime $p$;
  clipping preserves this identity. Thus the Type II theorem applies with $F$ equal to this normalized clipped
  function. Choose its log-saving target after all the fixed dyadic, Fourier, and truncation losses.
  We then choose $K$ sufficiently large for that target, simultaneously for all $2 lt.eq j lt.eq 2 \/ gamma$.
  This choice is made after $h \, gamma$, and is independent of the particular fixed band exponents.
  Telescoping all slots gives

#[#set math.equation(numbering: n => "(7.16)")
 $ & sum_(p_1 \, dots.h \, p_j > z) Phi \( \( p_1 dots.h.c p_j - 1 \) \/ x \)
   cal(W) \( p_1 dots.h.c p_j - 1 \) \( f_x \( p_1 dots.h.c p_j - 1 \) - C_x \)\
 & quad = sum_(m_1 \, dots.h \, m_j) Phi \( \( m_1 dots.h.c m_j - 1 \) \/ x \)
   cal(W) \( m_1 dots.h.c m_j - 1 \) \( f_x \( m_1 dots.h.c m_j - 1 \) - C_x \) product_(i = 1)^j a \( m_i \) +
   o \( x \/ L \) . $ <ext:proxy-replacement>]

=== 7.3 Removing candidate prime parts <removing-candidate-prime-parts>

Fix $j$ in the preceding finite range. Construct candidate small groups from all primes in consecutive bands
  $\[ exp \( y \) \, exp \( 2 y \) \)$, starting at $y = L^.28$ and doubling $y$ while $2 y lt.eq L^.35$.
  Construct candidate big groups in the same way, from $y = L^.40$ while $2 y lt.eq L^.45$.
  There are between positive constant multiples of $log L$ groups of each kind.
  They are disjoint, their reciprocal sums $V_g$ are bounded above and below by positive constants,
  and they lie in the allowed small and big ranges of Theorem 16. The big groups are full prime intervals.
  All candidate primes exceed $W$.

We will group factorizations that differ only in the allocation of candidate primes among their $j$ factors.
  Their coefficients must agree, so we first remove all candidate prime parts from the threshold and logarithm in
  $a \( m \)$. For any integer $m$, let $macron(m)$ be obtained by removing the entire prime-power parts belonging
  to all candidate groups. Replace $a \( m \)$ by

#[#set math.equation(numbering: n => "(7.17)")
 $ tilde(a) \( m \) = upright(bold(1))_(P^(-) \( m \) > W) upright(bold(1))_(macron(m) > x^gamma)
   kappa \( macron(m) \) . $ <ext:stripped-coefficient>]

We show that this changes the right-hand side of (7.16) by $o \( x \/ L \)$ in absolute value.
  In particular, the estimate will remain valid before any cancellation is used.

For these error estimates, decompose tuples into full product dyads $m_i asymp H_i$,
  with $product_i H_i asymp x$ and $H_i gt.eq x^gamma \/ 2$. There are $O \( L^(j - 1) \)$ such boxes.
  By Lemma 6, the number of $W$-rough integers in each dyad is $O \( H_i V \( W \) \)$.
  On an unconditioned integer dyad,

#[#set math.equation(numbering: n => "(7.18)")
 $ sum_(m asymp H_i) log \( m \/ macron(m) \) & lt.eq sum_(p upright(" candidate"))
   sum_(a gt.eq 1) \( log p \) ⌊frac(2 H_i, p^a)⌋ lt.double H_i sum_(p lt.eq exp \( L^.45 \)) frac(log p, p - 1)
   lt.double H_i L^.45 . $ <ext:removed-log-mean>]

Thus the number with $log \( m \/ macron(m) \) > L^.9$ is $O \( H_i L^(- .45) \)$.
  On the support of either coefficient in the comparison its size is $O \( \( L V \( W \) \)^(- 1) \)$.
  Taking the bad count in one coordinate and the rough counts in all others bounds the bad-tuple mass in a box by

#[#set math.equation(numbering: n => "(7.19)")
 $ O (x / L^j frac(L^(- .45), V \( W \))) = O \( x L^(- j - .21) \) \, $ <ext:large-removal-error>]

since $V \( W \) asymp L^(- .24)$. After summing boxes this is $O \( x L^(- 1 - .21) \)$.

For the other tuples, a change in the threshold test requires $gamma L < log m_i lt.eq gamma L +
  L^.9$ for at least one coordinate. There are $O \( L^.9 L^(j - 2) \)$ product dyads meeting such a strip,
  because $j gt.eq 2$. Their positive mass is $O \( x \/ L^j \)$ per box, so the total is $O \( x L^(- 1.1) \)$.
  Away from those strips the supports coincide, and

$ frac(kappa \( macron(m)_i \), kappa \( m_i \)) = frac(log m_i, log macron(m)_i) = 1 + O_gamma \( L^(- .1) \) . $

The total positive tuple mass is $O \( x \/ L \)$, by the same rough counts and box count.
  Together with the boundedness of $cal(W) \( f_x - C_x \)$ this proves the required absolute $o \( x \/ L \)$ error.

=== 7.4 Many successes before the signed expansion <many-successes-before-the-signed-expansion>

Write $v = m_1 dots.h.c m_j$ and $u = v - 1$. For each candidate group $g$,
  independently conditional on the tuple, toss a coin whose success probability is

#[#set math.equation(numbering: n => "(7.20)")
 $ s_g \( u \, v \) =
   c_1 q_0^(omega_g \( u \) - 1) frac(omega_g \( u \), V_g) \( q_0 \/ j \)^(omega_g \( v \) - 1)
   frac(omega_g \( v \), V_g) . $ <ext:success-probability>]

The constant $c_1 > 0$ is fixed sufficiently small, depending on $j \, q_0$ and the bounds for $V_g$,
  that these probabilities are at most one. The factors with no hit are interpreted as zero.
  The division by $j$ in the product-side damping anticipates the $j$ possible allocations of each candidate prime
  among the factors when the candidate part of $v$ is squarefree.
  Summing those allocations will recover the $q_0$ damping of the two-sided estimate.
  We claim that for some fixed $c_2 > 0$, outcomes with fewer than $c_2 log
  L$ successes in either family have total positive weighted mass $o \( x \/ L \)$ under the coefficient
  $product_i tilde(a) \( m_i \)$.

We prove the uniformity needed for this claim on full rough product dyads.
  Select each $m_i$ independently and uniformly among $W$-rough integers in its full dyad.
  For any fixed number of distinct candidate primes, their product $Q$ satisfies $log Q = O \( L^.45 \)$.
  Each prescribed residue class modulo $Q$ is relatively equidistributed among these rough integers,
  with error $o \( 1 \)$ uniformly in the classes, primes, and dyads.
  To verify this, apply Bonferroni to divisibility by primes $p lt.eq W$ at depth $D log L$,
  where $D$ is a sufficiently large fixed constant. The reciprocal sum of those primes is $O \( log L \)$,
  so taking $D$ large makes the omitted reciprocal mass smaller than any prescribed log power times $V \( W \)$.
  The moduli in the retained terms are at most

$ Q W^(O \( log L \)) = exp \( O \( L^.45 + L^.24 log L \) \) = x^(o \( 1 \)) . $

Since every factor dyad has positive-power length, CRT counting errors divided by its expected class count tend to
  zero uniformly. Normalizing by the similarly evaluated total rough count proves the assertion,
  with arbitrary fixed logarithmic precision if needed.

In the independent residue model, for a candidate prime $p$ the events $p divides u$ and $p divides
  v$ are disjoint, with probabilities

#[#set math.equation(numbering: n => "(7.21)")
 $ a_p = frac(\( p - 1 \)^(j - 1), p^j) \, wide b_p = 1 - \( 1 - 1 \/ p \)^j \, $ <ext:prime-event-probabilities>]

respectively. For the first formula all residues must be nonzero, and the first $j - 1$ determine the last.
  For the second, at least one of the $j$ residues must be zero. Distinct primes are independent in this model.
  In each group, $sum_p a_p = V_g + o \( 1 \)$ and $sum_p b_p = j V_g + o \( 1 \)$,
  while the largest individual probability tends to zero. Summing the uniform residue estimates proves convergence
  of every fixed joint factorial moment of the two hit counts, for any one or two groups,
  uniformly over their choices and over product dyads. These moments are bounded by $C^r$ at total order $r$,
  with $C$ depending only on the fixed $j$ and the reciprocal group bounds.

Here is why fixed moments suffice for the bounded probabilities in (7.20), without any growing-moment assumption.
  First cut each of the at most four counts at a fixed bound $a$.
  The bounded first moments give tail probability $O \( 1 \/ a \)$ uniformly.
  For exact counts below this bound, list the required hits and impose the absence of further hits by Bonferroni.
  At a fixed depth $b$, the limit superior of the remainder is at most $C_a C^b \/ b !$,
  by the corresponding factorial moment estimate. Take $x arrow.r oo$, then $b arrow.r oo$, and then $a arrow.r
  oo$. It follows that the expectations of the bounded one-group tests and their two-group products agree with the
  model up to a uniform $o \( 1 \)$.

Explicitly, for a count vector $N = \( N_1 \, dots.h \, N_r \)$ and a fixed target $k$,
  list the $k_i$ required hits of each type. Conditional on $N gt.eq k$ coordinatewise,
  inclusion–exclusion for no other hit is the alternating binomial sum in $N_(upright("tot")) - \| k \|$,
  multiplied by $product_i binom(N_i, k_i)$. The first omitted term at depth $b$ is bounded by

$ frac(\( N_(upright("tot")) \)_(\| k \| + b + 1), \( b + 1 \) ! product_i k_i !) \, $

where $\( n \)_r = n \( n - 1 \) dots.h.c \( n - r + 1 \)$.
  Its expected limit superior is at most $C^(\| k \| + b + 1) \/ \( \( b + 1 \) ! product_i k_i ! \)$.
  This supplies the stated uniform remainder for every exact count used after the fixed truncation.

In the model, the probability of exactly one hit of each type in a group is bounded below. Indeed it equals

$ product_(p in g) \( 1 - a_p - b_p \) sum_(p eq.not q upright(" in ") g) frac(a_p, 1 - a_p - b_p)
  frac(b_q, 1 - a_q - b_q) \, $

whose product and sum are bounded below using the displayed reciprocal bounds and the vanishing largest atom.
  On this event the conditional success probability is $c_1 \/ V_g^2$, also bounded below.
  Distinct groups are independent in the model. Therefore, if $I_g$ denotes the actual coin indicator,
  there are $beta > 0$ and $epsilon.alt_x arrow.r 0$, uniform in the dyads and groups, such that

#[#set math.equation(numbering: n => "(7.22)")
 $ bb(E) I_g gt.eq beta \, wide \| "Cov" \( I_g \, I_(g') \) \| lt.eq
   epsilon.alt_x quad \( g eq.not g' \) . $ <ext:success-covariance>]

Conditional independence of the coins identifies the second quantity with the covariance of their success
  probabilities. For a family of $N asymp log L$ groups, Chebyshev gives

#[#set math.equation(numbering: n => "(7.23)")
 $ bb(P) (sum_g I_g < beta N \/ 2) lt.eq frac(4, beta^2 N) + frac(4 epsilon.alt_x, beta^2) =
   o \( 1 \) . $ <ext:success-chebyshev>]

Only two families occur. Notice that a uniform $o \( 1 \)$ covariance suffices;
  no rate relative to $1 \/ log L$ is required.

Finally transfer this full-dyad probability to the actual weighted tuples.
  A rough product box contains $O \( x V \( W \)^j \)$ tuples,
  and $product_i tilde(a) \( m_i \) lt.double \( L V \( W \) \)^(- j)$ on its support.
  Thus its failure mass is $o \( x \/ L^j \)$ uniformly. There are $O \( L^(j - 1) \)$ boxes,
  proving the claimed $o \( x \/ L \)$ total. The bounded factor $Phi \( u \/ x \)
  cal(W) \( u \) \( f_x \( u \) - C_x \)$ does not alter this conclusion.
  We discard these failed outcomes now, while their weights form a nonnegative probability partition.

=== 7.5 Allocation and the two-sided correlation <allocation-and-the-two-sided-correlation>

Let $cal(C)$ be the full candidate set of groups. The coin partition is

$ 1 = sum_(S subset.eq cal(C)) product_(g in S) s_g product_(g in.not S) \( 1 - s_g \) . $

Retain only $S$ containing at least $c_2 log L$ groups of each kind, at the error just proved.
  Now expand the failure factors in each retained term. Each expanded term has the form

#[#set math.equation(numbering: n => "(7.24)")
 $ plus.minus product_(g in P) s_g \, wide P = S union T \, quad T subset.eq cal(C) \\ S . $ <ext:active-term>]

There are at most $3^(\| cal(C) \|) = L^(O \( 1 \))$ terms; their coefficients, including $c_1^(\| P \|)$,
  have fixed log-power bounds. Every active set $P$ has between fixed positive multiples of $log
  L$ groups of each kind and satisfies all the active-group hypotheses of Theorem 16.
  This expansion is performed after the failed mass has been removed,
  so it never multiplies the preceding qualitative $o \( x \/ L \)$ error.

For a fixed active set let $s_P = \| P \|$, let $v_(*)$ be obtained from $v$ by removing the entire parts of its
  active primes, and use $W_(1 \, q_0)$ to denote the active one-mark weight with damping $q_0$.
  We may first restrict to $v$ not divisible by the square of any candidate prime.
  Such square exceptions have integer count

#[#set math.equation(numbering: n => "(7.25)")
 $ O (x sum_(p upright(" candidate")) p^(- 2)) lt.double x exp \( - c L^.28 \) . $ <ext:candidate-square-count>]

Their weighted tuple sums remain negligible after all fixed log-power losses.
  Indeed the number of ordered factor tuples of $v$ is at most $tau_j \( v \)$;
  Cauchy–Schwarz and a fixed divisor moment bound give an exponential saving in a power of $L$ for sums of any
  fixed divisor power over this exceptional set. All active marked factors are bounded by fixed log powers,
  because there are $O \( log L \)$ groups with exponential damping in each.
  The same argument will allow these exceptions to be restored at the end of the calculation.

Define the core

#[#set math.equation(numbering: n => "(7.26)")
 $ G_P \( v \) = sum_(e_1 dots.h.c e_j = v_(*)) product_(i = 1)^j
   [upright(bold(1))_(P^(-) \( e_i \) > W) upright(bold(1))_(macron(e)_i > x^gamma) kappa \( macron(e)_i \)] .
   $ <ext:allocation-core>]

Here the bar still removes #emph[all] candidate prime parts, including the inactive ones.
  This definition implies $G_P \( v \) = G_P \( v_(*) \)$ and

#[#set math.equation(numbering: n => "(7.27)")
 $ \| G_P \( v \) \| lt.eq \( C \/ \( L V \( W \) \) \)^j tau_j \( v_(*) \) lt.eq
   L^(C_j) tau \( v_(*) \)^(C_j) . $ <ext:core-bound>]

The second bound follows from the elementary inequality $tau_j \( n \) lt.eq tau \( n \)^(j - 1)$,
  obtained prime by prime.

Off the square exceptions, fix a factorization $e_1 dots.h.c e_j = v_(*)$.
  Every active prime dividing $v$ can be assigned independently to any of the $j$ slots.
  These are all the original factorizations with that stripped factorization,
  and all have the same coefficient in (7.17): active primes exceed $W$ and the tests and logarithms depend only
  on the bars. Thus there are $j^(omega_P \( v \))$ equal contributions. The exact identity

#[#set math.equation(numbering: n => "(7.28)")
 $ j^(omega_P \( v \)) \( q_0 \/ j \)^(omega_P \( v \) - s_P) =
   j^(s_P) q_0^(omega_P \( v \) - s_P) $ <ext:allocation-identity>]

shows that summing the $v$-side factor in (7.24) over factorizations gives

$ j^(s_P) W_(1 \, q_0) \( v \) G_P \( v \) . $

This is an identity of weights, including the mark factors $product_g omega_g \( v \) \/ V_g$.

Restoring the square exceptions by (7.25) and its divisor-moment bound, each expanded term is,
  up to a negligible error, a constant of fixed log-power size times

#[#set math.equation(numbering: n => "(7.29)")
 $ sum_(u gt.eq 1) Phi \( u \/ x \) cal(W) \( u \) \( f_x \( u \) - C_x \) W_(1 \, q_0) \( u \)
   W_(1 \, q_0) \( u + 1 \) G_P \( u + 1 \) . $ <ext:correlation-to-use>]

Take $Psi \( y \) = y Phi \( y \)$. Since $Phi \( u \/ x \) = x Psi \( u \/ x \) \/ u$,
  Theorem 16 bounds (7.29) by $O_A \( x L^(- A) \)$ for every fixed $A$.
  Its invariant core hypothesis is exactly (7.26), and its growth hypothesis is (7.27).
  Its other endpoint is exactly $F_x \( u \) = cal(W) \( u \) \( f_x \( u \) - C_x \)$.
  Choose $A$ after the fixed costs from $3^(\| cal(C) \|)$, $j^(s_P)$, and the coefficients.
  They are all absorbed. Summing the expanded terms and adding back the earlier, unamplified,
  discarded masses proves that the proxy sum in (7.16) is $o \( x \/ L \)$. This proves (7.14).

=== 7.6 Removal of the small-band marks <removal-of-the-small-band-marks>

Subtract the composite contribution from (7.13). All primes in the support exceed $z$ for large $x$, and we have proved

#[#set math.equation(numbering: n => "(7.30)")
 $ limsup_(x arrow.r oo) L /
   x
   lr(|sum_(p upright(" prime")) Phi \( \( p - 1 \) \/ x \) frac(cal(W) \( p - 1 \), m_(cal(W))) \( f_x \( p -
   1 \) - C_x \)|) lt.double e^(- h) \/ gamma . $ <ext:weighted-primes>]

The constant here remains independent of $K \, h$.

Fix this $h$ and its sufficient fixed $K$. For any finite $b gt.eq 1$ choose $b$ disjoint arrays,
  each with $K$ distinct exponents, using distinct exponents across all arrays inside $\( .1 \, .2 \)$.
  This is possible for every finite $b$, and the Type II choice of $K$ applies to every one of them.
  Write $cal(W)_a \, m_a$ for their weights and model means, and set

#[#set math.equation(numbering: n => "(7.31)")
 $ Z_b \( u \) = (1 / b sum_(a = 1)^b frac(cal(W)_a \( u \), m_a) - 1)^2 . $ <ext:deweight-square>]

Disjoint arrays are independent in the divisor model. Their normalized weights have mean one and uniformly bounded
  second moments by (7.4). Hence

#[#set math.equation(numbering: n => "(7.32)")
 $ M_x \( Z_b \) = 1 / b^2 sum_(a = 1)^b "Var"_M \( cal(W)_a \/ m_a \) lt.eq C_K \/ b . $ <ext:deweight-model>]

The square and all its cross terms lie within Lemma 22, whose coefficient bounds are uniform for these normalized
  weights when $b \, K$ are fixed.

Apply the nonnegative upper bound of the block sieve at the fixed depth $h' = 2$, with $z' = x^(c_0 \/ 20)$,
  to the weight $Phi \( u \/ x \) Z_b \( u \)$. Its remainder range is

$ \( z' \)^(4 h' + 2) = x^(c_0 \/ 2) < x^(c_0) \, $

so Lemma 22 without tuple factors applies. Every prime $u + 1$ in the support exceeds $z'$.
  The sieve main term is bounded by a fixed constant times $x M_x \( Z_b \) \/ log z'$,
  and its remainder is $o \( x \/ L \)$. It follows that

#[#set math.equation(numbering: n => "(7.33)")
 $ limsup_(x arrow.r oo) L / x sum_(p upright(" prime")) Phi \( \( p - 1 \) \/ x \) Z_b \( p - 1 \) lt.double
   C_K \/ b . $ <ext:prime-deweight-square>]

The implied constant here depends on the fixed $c_0$ and cutoff, but not on $b \, K$;
  the latter dependence is recorded in $C_K$.

Average (7.30) over the $b$ arrays. By Cauchy–Schwarz, the difference between this averaged weighted sum and the
  unweighted sum is at most

$ & (sum_p Phi \( \( p - 1 \) \/ x \) Z_b \( p - 1 \))^(1 \/ 2)\
 & #h(12mm)  dot.op (sum_p Phi \( \( p - 1 \) \/ x \) \( f_x \( p - 1 \) - C_x \)^2)^(1 \/ 2) . $

The second factor is $O \( \( x \/ L \)^(1 \/ 2) \)$ by the boundedness of $f_x -
  C_x$ and the prime number theorem. We conclude that

#[#set math.equation(numbering: n => "(7.34)")
 $ limsup_(x arrow.r oo) L / x lr(|sum_p Phi \( \( p - 1 \) \/ x \) \( f_x \( p - 1 \) - C_x \)|) lt.eq
   C e^(- h) / gamma + C sqrt(C_K \/ b) . $ <ext:final-limsup>]

All constants in the preceding remainder estimates were allowed to depend on the finite $b$;
  they have disappeared in this real $x$ limit. First let $b$ be arbitrarily large with $h \, K$ fixed.
  Then let the even integer $h$ be arbitrarily large, choosing its new sufficient fixed $K$ each time.
  Since $gamma^(- 1) = \( 4 h + 3 \) \/ c_0$, the surviving bound tends to zero. This proves Theorem 21.

In particular, the order of choices is: fix the interior data and $c_0$; fix $h$,
  then $gamma$ and the finitely many composite lengths; choose the Type II precision and $K$;
  fix finitely many disjoint exponent arrays; take the limit in real $x$; then remove the arrays by $b arrow.r
  oo$ and the sieve error by $h arrow.r oo$. No number of arrays grows with $x$ in an application of either
  correlation theorem or the progression lemma.

== 8 From interior statistics to the full law <pd:section>

We now pass from Theorem 21 to ordinary prime averages of every finite collection of ranked factors.
  The argument also shows why no additional assertion about very small factors or the boundary of a simplex is
  needed. The probability argument uses the size-biased viewpoint of Donnelly and
  Grimmett #cite(label("DonnellyGrimmett")) Section 2 and the factorial-measure characterization of Arratia,
  Kochman and Miller #cite(label("ArratiaKochmanMiller2014")) Lemma 2 and Section 3.3.
  We give the passage, including boundary control and sorting, in full.

=== 8.1 Factorial measures in the open simplex <factorial-measures-in-the-open-simplex>

Choose a prime $p$ uniformly from $x < p lt.eq 2 x$, and regard the prime factors of $p - 1$,
  with their multiplicities, as distinct labelled balls. A ball corresponding to a prime $q$ has mass

$ t = frac(log q, log \( p - 1 \)) . $

The masses of all the balls sum to one. For $d gt.eq 1$, let $mu_(x \, d)$ be the expected counting measure of
  ordered $d$-tuples of distinct balls, mapped to their masses.
  Distinct balls may correspond to the same numerical prime. Set

#[#set math.equation(numbering: n => "(8.1)")
 $ cal(D)_d = {\( t_1 \, dots.h \, t_d \) : t_i > 0 \, quad sum_(i = 1)^d t_i < 1} . $ <pd:open-simplex>]

We first prove the local convergence

#[#set math.equation(numbering: n => "(8.2)")
 $ integral_(cal(D)_d) phi thin thin upright(d) mu_(x \, d) arrow.r
   integral_(cal(D)_d) phi \( t \) product_(i = 1)^d frac(thin upright(d) t_i, t_i) wide
   #scale(x: 120%, y: 120%)[\(] phi in C_c \( cal(D)_d \) #scale(x: 120%, y: 120%)[\)] . $ <pd:factorial-convergence>]

Start with a rectangle

#[#set math.equation(numbering: n => "(8.3)")
 $ R = product_(i = 1)^d \( a_i \, b_i \] \, wide 0 < a_i < b_i \, wide sum_i b_i < 1 . $ <pd:admissible-rectangle>]

Use in Theorem 21 the prime slots $x^(a_i) < ell_i lt.eq x^(b_i)$.
  They satisfy its hypotheses for a fixed positive $epsilon$. The reciprocal sum over distinct numerical primes obeys

#[#set math.equation(numbering: n => "(8.4)")
 $ C_x = sum_(ell_i upright(" in their slots")\
ell_i upright(" distinct")) frac(1, ell_1 dots.h.c ell_d) arrow.r product_(i = 1)^d log b_i /
  a_i . $ <pd:rectangle-main-term>]

Indeed, Lemma 2 gives the limit in each slot. Terms with a coincidence in two slots have total reciprocal mass
  $O \( sum_(q gt.eq x^(min a_i)) q^(- 2) \) = o \( 1 \)$, times bounded reciprocal sums from the other slots.

To remove the smooth cutoff in Theorem 21, approximate the indicator of the prime dyad from above and below by
  fixed smooth functions of $\( p - 1 \) \/ x$. The tuple count is bounded by a constant depending on $d$ and $min
  a_i$, because an integer of size $O \( x \)$ has at most $O \( 1 \/ min a_i \)$ prime factors exceeding
  $x^(min a_i)$. The prime number theorem bounds the contribution of endpoint strips of relative width $eta$ by
  $O \( eta x \/ log x \) + o \( x \/ log x \)$. First let real $x$ tend to infinity with the cutoffs fixed,
  and then let $eta$ decrease to zero. Since $pi \( 2 x \) - pi \( x \) tilde.op x \/ log x$,
  this proves the rectangle formula with masses initially normalized by $log x$.

The required denominator is $log \( p - 1 \)$. Uniformly on the dyad,

#[#set math.equation(numbering: n => "(8.5)")
 $ frac(log \( p - 1 \), log x) = 1 + O (frac(1, log x)) . $ <pd:denominator>]

For fixed sufficiently small $eta > 0$, a rectangle with endpoints $a_i + eta \, b_i -
  eta$ on the $log x$ scale is therefore contained in the test in (8.3) on the exact scale;
  the latter is contained in the rectangle with endpoints $a_i - eta \, b_i + eta$.
  Choose $eta$ small enough that all endpoints stay positive and the enlarged upper endpoints still sum to less
  than one. Apply the preceding rectangle limits, then let $eta$ decrease to zero.
  This proves the same formula with the exact denominator, still for distinct numerical primes.

The distinction between numerical primes and labelled balls is negligible locally.
  If every tested coordinate is at least $a > 0$, a difference requires $q^2 divides p - 1$ for some $q gt.eq
  x^(a \/ 2)$, for all sufficiently large $x$. The number of possible integers $p - 1$ in the dyad is at most

#[#set math.equation(numbering: n => "(8.6)")
 $ sum_(q gt.eq x^(a \/ 2)) ⌊frac(2 x, q^2)⌋ lt.double x^(1 - a \/ 2) . $ <pd:square-exceptions>]

Here and below a sum over primes may be bounded by the corresponding sum over integers.
  Each such integer contributes at most a constant number of tested tuples:
  there are at most $1 \/ a$ balls of mass at least $a$. Division by $pi \( 2 x \) -
  pi \( x \)$ makes (8.6) negligible. We have proved

#[#set math.equation(numbering: n => "(8.7)")
 $ mu_(x \, d) \( R \) arrow.r product_i log \( b_i \/ a_i \) =
   integral_R product_i frac(thin upright(d) t_i, t_i) . $ <pd:rectangle-limit>]

For completeness, these restricted rectangles determine all the local limits claimed in (8.2).
  A compact set in $cal(D)_d$ has all coordinates at least some $a > 0$ and its coordinate sum at most $1 - a$,
  after decreasing $a$ if necessary. Its $mu_(x \, d)$-mass is bounded uniformly by $a^(- d)$,
  since the underlying masses sum to one. A sufficiently fine rectangular grid on a slightly larger compact set
  consists of boxes with positive lower endpoints and upper endpoints summing to less than one.
  Apply (8.7) to these finitely many boxes. Upper and lower step approximations to a continuous function have an
  error bounded by its modulus of continuity times the uniformly bounded local mass.
  Refining the fixed grid after taking the $x$-limit proves (8.2).
  This argument uses no bound for the total factorial mass near zero.

=== 8.2 Size-biased sampling and the boundary <size-biased-sampling-and-the-boundary>

Given the balls, sample them successively without replacement,
  choosing at each step a remaining ball with probability equal to its mass divided by the total remaining mass.
  Write $T_(x \, i)$ for the mass selected at step $i$, and set all subsequent values to zero after the finite
  collection is exhausted. Let $nu_(x \, d)$ be the law of $\( T_(x \, 1) \, dots.h \, T_(x \, d) \)$ on
  $\[ 0 \, 1 \]^d$. For an ordered tuple lying in $cal(D)_d$,
  its conditional probability of being the first $d$ draws is

#[#set math.equation(numbering: n => "(8.8)")
 $ w_d \( t \) = product_(i = 1)^d frac(t_i, 1 - t_1 - dots.h.c - t_(i - 1)) . $ <pd:size-bias-weight>]

Consequently, for $phi in C_c \( cal(D)_d \)$,

$ integral phi thin thin upright(d) nu_(x \, d) = integral phi w_d thin thin upright(d) mu_(x \, d) . $

The function $w_d$ is continuous and bounded on every compact subset of $cal(D)_d$,
  so (8.2) gives the limiting interior density

#[#set math.equation(numbering: n => "(8.9)")
 $ h_d \( t \) = product_(i = 1)^d \( 1 - t_1 - dots.h.c - t_(i - 1) \)^(- 1) . $ <pd:size-bias-density>]

This density has total mass one, as can be checked directly. Put

#[#set math.equation(numbering: n => "(8.10)")
 $ A_i = frac(t_i, 1 - t_1 - dots.h.c - t_(i - 1)) \, wide t_i =
   A_i product_(r < i) \( 1 - A_r \) . $ <pd:triangular-map>]

These formulas give inverse bijections between $cal(D)_d$ and $\( 0 \, 1 \)^d$.
  The inverse map is triangular and its Jacobian is

$ product_(i = 1)^d product_(r < i) \( 1 - A_r \) = product_(i = 1)^d \( 1 - t_1 - dots.h.c - t_(i - 1) \) . $

It follows that $h_d \( t \) thin thin upright(d) t = thin upright(d) A_1 dots.h.c thin upright(d) A_d$. In particular,

#[#set math.equation(numbering: n => "(8.11)")
 $ integral_(cal(D)_d) h_d \( t \) thin thin upright(d) t = 1 . $ <pd:total-mass>]

Taking $U_i = 1 - A_i$ identifies this measure with the first $d$ stick fragments
  $B_i = \( product_(r < i) U_r \) \( 1 - U_i \)$ in Theorem 1,
  where the $U_i$ are independent uniform random variables.

Equation (8.11) also excludes any escaped boundary mass. Given $eta > 0$, choose $0 lt.eq chi lt.eq
  1$ in $C_c \( cal(D)_d \)$ with $integral chi h_d > 1 - eta$.
  Interior convergence yields $integral chi thin thin upright(d) nu_(x \, d) > 1 - 2 eta$ for large $x$.
  Thus at most $2 eta$ of the probability lies outside $"supp" chi$.
  This includes all boundary faces, exhaustion events, and configurations with padded zeros.
  For any continuous $H$ on $\[ 0 \, 1 \]^d$, apply interior convergence to $chi H$;
  the integrals of $\( 1 - chi \) H$ under the two probability measures have total absolute value at most $3
  eta ∥H∥_oo$ in the limit superior. Letting $eta$ decrease to zero proves

#[#set math.equation(numbering: n => "(8.12)")
 $ \( T_(x \, 1) \, dots.h \, T_(x \, d) \) med arrow.r.double med \( B_1 \, dots.h \, B_d \) quad
   upright("on ") \[ 0 \, 1 \]^d . $ <pd:draw-convergence>]

=== 8.3 Sorting and ordinary prime averages <sorting-and-ordinary-prime-averages>

Let

$ R_(x \, d) = 1 - sum_(i = 1)^d T_(x \, i) \, wide R_d = 1 - sum_(i = 1)^d B_i = product_(i = 1)^d U_i . $

By (8.12),

#[#set math.equation(numbering: n => "(8.13)")
 $ bb(E) R_(x \, d) arrow.r bb(E) R_d = 2^(- d) . $ <pd:unseen-mass>]

The decreasing sequence $R_d$ has a limit whose expectation is zero, by monotone convergence applied to $1 - R_d$.
  Hence $sum_(i gt.eq 1) B_i = 1$ almost surely. Its decreasing rearrangement is therefore well-defined and has
  total mass one.

For a finite or summable nonnegative collection with total mass one, let $V_i$ be its decreasing rearrangement.
  Sort any selected $d$ members and pad the resulting list with zeros, writing $S_(d \, i)$.
  If the unselected mass is $r$, then

#[#set math.equation(numbering: n => "(8.14)")
 $ 0 lt.eq V_i - S_(d \, i) lt.eq r wide \( i gt.eq 1 \) . $ <pd:sorting-bound>]

The first inequality follows because removing members cannot increase any order statistic.
  To see the second, if $V_i > r$, every member at least $V_i$ must have been selected,
  since each unselected member is at most $r$. Thus $S_(d \, i) = V_i$ in that case.
  If $V_i lt.eq r$, the asserted bound is immediate.

Fix the target dimension $k$ and a bounded continuous function $F : \[ 0 \, 1 \]^k arrow.r bb(R)$.
  Let $omega_F \( eta \)$ be its modulus of continuity for the maximum norm.
  Applying (8.14) and Markov’s inequality gives

#[#set math.equation(numbering: n => "(8.15)")
 $ lr(|bb(E) F \( V_1 \, dots.h \, V_k \) - bb(E) F \( S_(d \, 1) \, dots.h \, S_(d \, k) \)|) lt.eq
   omega_F \( eta \) + 2 ∥F∥_oo frac(bb(E) r, eta) . $ <pd:sorting-test-bound>]

For fixed $d$, sorting $d$ coordinates and padding is a continuous map; for example,
  each order statistic is a finite maximum of finite minima.
  Equation (8.12) therefore gives convergence of the finite sorting test.
  Apply (8.15) both to the factor balls and to the stick fragments.
  First let real $x$ tend to infinity, use (8.13), then let $d$ tend to infinity for fixed $eta$,
  and finally let $eta$ decrease to zero. We obtain

#[#set math.equation(numbering: n => "(8.16)")
 $ frac(1, pi \( 2 x \) - pi \( x \)) sum_(x < p lt.eq 2 x) F \( V_1 \( p \) \, dots.h \, V_k \( p \) \) arrow.r
   bb(E) F \( L_1 \, dots.h \, L_k \) . $ <pd:dyad-law>]

Every step used limits through all real $x$.

#proof[
  #emph[Completion of the proof of Theorem 1.] For a real upper endpoint $X$, fix an integer $J_0 gt.eq
    1$ and partition $\( X \/ 2^(J_0) \, X \]$ into the $J_0$ dyads $\( X \/ 2^j \, X \/ 2^(j - 1) \]$.
    Each dyad scale tends to infinity with $X$, so (8.16), applied a finite number of times,
    shows that the weighted sum over these dyads has the asserted limiting average.
    The discarded primes below $X \/ 2^(J_0)$ have proportion
  $ frac(pi \( X \/ 2^(J_0) \), pi \( X \) - 1) = 2^(- J_0) + o \( 1 \) $
  by the prime number theorem. Their effect on the discrepancy from the limiting expectation is at most
    $2 ∥F∥_oo \( 2^(- J_0) + o \( 1 \) \)$. Take $X arrow.r oo$, then $J_0 arrow.r oo$.
    Removing the prime $2$ changes the normalization and sum by $o \( 1 \)$.
    This proves the statement for ordinary equal weighting of $3 lt.eq p lt.eq
    X$ and for every real upper endpoint tending to infinity. ◻
]

== 9 Prime polynomials and logarithmic phases <lp:section>

This appendix proves the two estimates used in Section 2:
  cancellation in prime polynomials up to height $x^2$, and cancellation of logarithmic phases in arithmetic
  progressions. We retain the quantitative dependence on the degree in the classical Vinogradov mean-value
  iteration; compare Stechkin #cite(label("Stechkin1975")) and Ford #cite(label("Ford2002")) discussion preceding
  Theorem 3. The logarithmic-phase method and its application to zero-free regions are classical;
  stronger estimates are available in #cite(label("Ford2002")) Theorem 2 and Corollary 2A and
  #cite(label("Khale2024")) Theorem 1.1. The weaker forms below suffice and will be proved in full.
  Throughout this appendix, $L = log x$ and $T = log L$.

#thm([Lemma 9.1.])[
  (Long prime polynomial).  #emph[Fix $0 < tau < eta < 1$, $C > 0$, and $A > 0$.
    There is a constant $B_0 = B_0 \( tau \, eta \, C \, A \)$ such that, uniformly for
$ x^tau / 2 lt.eq N lt.eq x^eta \, wide q lt.eq L^C \, wide L^(B_0) lt.eq \| t \| lt.eq x^2 \, $

 every Dirichlet character $chi$ modulo $q$ and every interval $I subset \[ N \, 2 N \]$ satisfy
#[#set math.equation(numbering: n => "(9.1)")
 $ lr(|sum_(p in I) chi \( p \) p^(- 1 + i t)|) lt.double_(tau \, eta \, C \, A) L^(- A) . $ <lp:prime-estimate>]

]
] <lp:prime-polynomial>

The proof proceeds from a quantitative power-sum estimate to cancellation for a logarithmic phase,
  then to a high-height zero-free strip, and finally to primes by Mellin inversion.

=== 9.1 Elementary estimates and quantitative power sums <elementary-estimates-and-quantitative-power-sums>

We use two elementary estimates before the mean-value iteration.
  The first is an immediate consequence of the prime number theorem already recorded in Lemma 2.

#thm([Lemma 9.2.])[
  (Primes for the congruence iteration).  #emph[There is an absolute constant $A_1 > 0$ such that,
    for every integer $k gt.eq 2$ and every real $y gt.eq A_1 k^6$,
    the interval $\[ y \, 2 y \]$ contains at least $2 k^3 + 5$ primes, all greater than $k$.]
] <lp:pre-primes>

#proof[
  The prime number theorem gives an absolute $y_0$ such that $\[ y \, 2 y \]$ contains at least
    $y \/ \( 2 log y \)$ primes for $y gt.eq y_0$. For a sufficiently large absolute $A_1$,
    this lower bound exceeds $2 k^3 + 5$ whenever $y gt.eq A_1 k^6$, uniformly for $k gt.eq 2$.
    Increasing $A_1$ also ensures $y > k$. ◻
]

#thm([Lemma 9.3.])[
  (Monotone first derivative estimate).  #emph[Let $f$ be real-valued and continuously differentiable on an
    interval. Suppose $f'$ is monotone and takes values in $\[ j + lambda \, j + 1 - lambda \]$ for an integer $j$
    and $0 < lambda lt.eq 1 \/ 2$. Then, on every subinterval,
$ lr(|sum_n upright(e) \( f \( n \) \)|) lt.double lambda^(- 1) \, $

 where the sum is over the integers in that subinterval and the implied constant is absolute.]
] <lp:pre-derivatives>

#proof[
  The assertion is immediate for at most one integer. Otherwise write $z_n =
    upright(e) \( f \( n \) \)$ and $delta_n = f \( n + 1 \) - f \( n \) =
    integral_n^(n + 1) f' \( u \) thin d u$ between consecutive summation indices.
    The numbers $delta_n$ are monotone and lie in $\[ j + lambda \, j + 1 - lambda \]$. Put
  $ w_n = \( upright(e) \( delta_n \) - 1 \)^(- 1) = - 1 / 2 - i / 2 cot \( pi delta_n \) . $
  Then $z_n = w_n \( z_(n + 1) - z_n \)$. Summation by parts bounds the sum, including its final term, by $1 +
    2 sup_n \| w_n \| + sum_n \| w_(n + 1) - w_n \|$. The supremum is $O \( lambda^(- 1) \)$.
    Since the cotangent is real and monotone on the indicated interval modulo integers,
    the variation has the same bound. ◻
]

We first establish a power-sum estimate with sufficient uniformity in its degree.
  For integers $k gt.eq 2$, $s gt.eq 1$, and $M gt.eq 1$, let $J_(s \, k) \( M \)$ count the solutions of

$ sum_(i = 1)^s u_i^j = sum_(i = 1)^s v_i^j quad \( 1 lt.eq j lt.eq k \) \, wide 1 lt.eq u_i \, v_i lt.eq M . $

Writing $K = k \( k + 1 \) \/ 2$ and

$ f \( bold(alpha) \) = sum_(n = 1)^M upright(e) #h(-0.16667em) (sum_(j = 1)^k alpha_j n^j) \, $

orthogonality gives $J_(s \, k) \( M \) = integral_(\[ 0 \, 1 \]^k) \| f \( bold(alpha) \) \|^(2 s) thin d bold(alpha)$.

The argument uses the classical Vinogradov mean-value method in Linnik’s $p$-adic form;
  see Wooley #cite(label("Wooley2012")) Section 2, pp. 1583–1585 for an exposition.
  We derive the required degree-uniform quantitative estimate below,
  without invoking the modern efficient-congruencing theorem of that paper.

#thm([Lemma 9.4.])[
  (A quantitative power-sum bound).  #emph[There are absolute constants $C_1 \, C_2 > 0$ such that,
    for every integer $k gt.eq 2$, some integer $s$ with $k lt.eq s lt.eq C_1 k^4$ satisfies
#[#set math.equation(numbering: n => "(9.2)")
 $ J_(s \, k) \( M \) lt.eq exp \( C_1 k^(C_2) \) M^(2 s - K + 1 \/ 100) wide \( M gt.eq 1 \) . $ <lp:mean-value-bound>]

]
] <lp:mean-value>

#proof[
  We iterate estimates
  #[#set math.equation(numbering: n => "(9.3)")
   $ J_(s \, k) \( M \) lt.eq C_s M^(E_s) \, wide E_s = 2 s - K + epsilon.alt_s \, $ <lp:inductive-bound>]
  starting with $s = k$, $C_k = 1$, and $epsilon.alt_k = K$.
    The iteration sends $s$ to $s + k$ and $epsilon.alt_s$ to $\( 1 - 1 \/ k \) epsilon.alt_s$.
  Choose a sufficiently large absolute constant $A_1$. If $M^(1 \/ k) < A_1 k^6$,
    then $log M lt.double k log \( 2 k \)$, and the trivial bound $J_(u \, k) \( M \) lt.eq M^(2 u)$ costs at most
  #[#set math.equation(numbering: n => "(9.4)")
   $ M^K lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( k^3 log \( 2 k \) \) #scale(x: 120%, y: 120%)[\)]
     $ <lp:small-M-cost>]
  relative to every proposed estimate with exponent $2 u - K + epsilon.alt$, $epsilon.alt gt.eq 0$.
    Thus it suffices to treat $M^(1 \/ k) gt.eq A_1 k^6$. Lemma 24, after enlarging $A_1$,
    supplies a fixed list of $2 k^3 + 5$ primes $r$ in $\[ M^(1 \/ k) \, 2 M^(1 \/ k) \]$, all greater than $k$.
  At moment $s + k$, call a tuple degenerate if it has fewer than $k$ distinct coordinates.
    There are at most $k^(s + k) M^(k - 1)$ such tuples. If $G$ is their exponential sum,
    its contribution on one side of the equations is at most
  $ integral_(\[ 0 \, 1 \]^k) \| G \| thin \| f \|^(s + k) lt.eq k^(s + k) M^(k - 1) J_(s + k \, k) \( M \)^(1 \/ 2) . $
  The contribution with a degenerate tuple on either side is therefore at most twice this quantity.
  For a nondegenerate solution, select $k$ distinct coordinates on each side and permute them to the first $k$
    positions. This costs at most $\( s + k \)^(2 k)$. The product of the two Vandermonde products is a nonzero
    integer of absolute value at most $M^(k \( k - 1 \))$. Fewer than $k^2 \( k - 1 \) +
    1$ primes of size at least $M^(1 \/ k)$ can divide it. Hence some prime $r$ in our list makes these first $k$
    coordinates distinct modulo $r$ on each side.
  For such a prime put
  $ F_r \( bold(alpha) \) = sum_(1 lt.eq z_1 \, dots.h \, z_k lt.eq M\
z_i equiv.not z_j med \( mod med r \) med \( i eq.not j \)) upright(e) #h(-0.16667em)
  (sum_(j = 1)^k alpha_j sum_(i = 1)^k z_i^j) . $
  The relevant number of solutions is bounded by
  $ \( s + k \)^(2 k) sum_r integral_(\[ 0 \, 1 \]^k) \| F_r \|^2 \| f \|^(2 s) . $
  The integrands are nonnegative. Write $f = sum_(a med mod med r) f_a$, where $f_a$ is restricted to $n equiv
    a med \( mod med r \)$. Hölder’s inequality gives
  $ \| f \|^(2 s) lt.eq r^(2 s - 1) sum_(a med mod med r) \| f_a \|^(2 s) . $
  Fix $a$. In the system counted by $integral \| F_r \|^2 \| f_a \|^(2 s)$, translate all variables by $- a$.
    Translation preserves the equations for the first $k$ powers by the binomial formula.
    The remaining $s$ variables on either side are multiples of $r$, so the first lists $bold(z) \, bold(z)'$ obey
  #[#set math.equation(numbering: n => "(9.5)")
   $ sum_(i = 1)^k z_i^j equiv sum_(i = 1)^k \( z'_i \)^j med \( mod med r^j \) wide \( 1 lt.eq j lt.eq k \) .
     $ <lp:power-congruences>]
  There are at most $M^k$ choices for the first list. For each such list,
    there are at most $k ! r^(K - k)$ choices for the second.
    To see this, lift the prescribed $j$th sum modulo $r^j$ to a residue modulo $r^k$.
    The number of choices for all lifts is $product_(j = 1)^k r^(k - j) = r^(K - k)$.
    For each full vector of sums modulo $r^k$, Newton’s identities determine the multiset of roots modulo $r$,
    since $r > k$. There are at most $k !$ orderings. The Jacobian of the power sums has determinant
  $ k ! product_(i < j) \( z'_j - z'_i \) \, $
  up to sign, and is invertible modulo $r$. Each ordering therefore lifts uniquely from modulus $r$ to modulus
    $r^k$: at each stage the next digits are the unique solution of the corresponding linear system modulo $r$.
    Finally, an interval of $M$ integers contains at most one representative of any residue modulo $r^k$,
    because $M lt.eq r^k$.
  After both first lists are fixed, divide the remaining variables by $r$.
    They range over a common interval of at most $ceil.l M \/ r
    ceil.r$ integers and have prescribed differences of power sums.
    Translation to an initial interval changes only these prescribed differences.
    The count is a Fourier coefficient of the nonnegative function $\| f \|^(2 s)$ at that shorter length,
    and consequently is at most $J_(s \, k) \( ceil.l M \/ r ceil.r \)$.
    Summing over $a$ accounts for the final factor $r$, and gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ J_(s + k \, k) \( M \) & lt.eq 2 k^(s + k) M^(k - 1) J_(s + k \, k) \( M \)^(1 \/ 2)\
 & quad + \( s + k \)^(2 k) \( 2 k^3 + 5 \) k ! max_r r^(2 s + K - k) M^k J_(s \, k) \( ceil.l M \/ r ceil.r \) .
   $ <lp:recurrence-count>]
  Insert (9.3). Since $E_s gt.eq 0$, rounding costs at most $2^(E_s)$, and the exponent of $r$ becomes
  $ 2 s + K - k - E_s = k^2 - epsilon.alt_s gt.eq 0 . $
  Replacing $r$ by at most $2 M^(1 \/ k)$ therefore gives the exponent
  $ k + E_s + frac(k^2 - epsilon.alt_s, k) = 2 \( s + k \) - K + \( 1 - 1 \/ k \) epsilon.alt_s . $
  The inequality $J lt.eq a sqrt(J) + b$ implies $J lt.eq 2 a^2 + 2 b$.
    The exponent $2 k - 2$ from $a^2$ is admissible: the target exponent starts at $2 k$,
    and at each step its increase is $2 k - epsilon.alt_s \/ k gt.eq 2 k - K \/ k > 0$.
    Thus the asserted iteration holds. Its constants can be chosen with
  $ log C_(s + k) lt.eq log \( 1 + C_s \) + O #h(-0.16667em)
    (\( s + k \) log \( 2 k \) + k log \( s + k \) + k^3 log \( 2 k \)) \, $
  including (9.4).
  After $O \( k log \( 2 k \) \)$ steps, $epsilon.alt_s = K \( 1 - 1 \/ k \)^(\( s - k \) \/ k) lt.eq 1 \/ 100$.
    Then $s = O \( k^2 log \( 2 k \) \) lt.eq C_1 k^4$, and summing the displayed costs gives $log C_s lt.eq
    C_1 k^(C_2)$ for absolute constants. Increasing the exponent from $epsilon.alt_s$ to $1 \/ 100$ proves the Lemma. ◻
]

=== 9.2 Logarithmic phases on progressions <logarithmic-phases-on-progressions>

The quantitative moment bound now gives cancellation for a logarithmic phase even when the Taylor degree grows
  with $x$. This step yields the second estimate from Section 2 and will also control Dirichlet series near the
  line of absolute convergence.

#thm([Lemma 9.5.])[
  (A logarithmic phase on progressions).  #emph[Fix $C > 0$.
    There is an absolute constant $C_3 > 0$ such that, for sufficiently large $x$ in terms of $C$,
    the following holds uniformly:
$ exp \( L \/ T^2 \) lt.eq N' lt.eq 2 x^5 \, wide q lt.eq L^C \, wide
  exp \( L \/ \( 2 T^2 \) \) lt.eq \| v \| lt.eq 4 x^3 . $

 For every residue $a med \( mod med q \)$ and every interval $I subset \[ N' \, 2 N' \]$,
#[#set math.equation(numbering: n => "(9.7)")
 $ lr(|sum_(n in I\
n equiv a med \( mod med q \)) n^(i v)|) lt.double N' / q exp \( - L \/ T^(C_3) \) . $ <lp:progression-estimate>]

]
] <lp:log-phase>

#proof[
  Put $H = N' \/ q$ and $y = log \| v \| \/ log H$. Then
  #[#set math.equation(numbering: n => "(9.8)")
   $ log H gt.eq L \/ T^2 - C T gt.double L \/ T^2 \, wide y lt.double T^2 . $ <lp:phase-scales>]
  Writing $n = q \( b + a \/ q \)$, with $0 lt.eq a < q$, reduces the sum, up to a factor of modulus one,
    to $sum_(b in cal(I)) \( b + a \/ q \)^(i v)$, where $cal(I)$ is an interval of integers and $H lt.eq b +
    a \/ q lt.eq 2 H$.
  If $y < 4 \/ 5$, the derivative of $v log \( b + a \/ q \) \/ \( 2 pi \)$ is monotone,
    has magnitude comparable to $\| v \| \/ H$, and has magnitude less than $1 \/ 2$.
    The monotone first derivative estimate in Lemma 25 therefore bounds the sum by $O \( H \/ \| v \| \)$.
    The lower bound on $\| v \|$ makes this smaller than (9.7).
  Suppose now that $y gt.eq 4 \/ 5$. Set
  $ M = floor.l H^(3 \/ 4) floor.r \, wide k = ceil.l 4 y + 8 ceil.r . $
  Averaging the sum over forward shifts $1 lt.eq h lt.eq M$ changes it by $O \( M \)$:
    a shift changes an interval at only $O \( h \)$ endpoints. For $b in cal(I)$, Taylor expansion gives
  $ frac(v, 2 pi) log \( b + h + a \/ q \) = frac(v, 2 pi) log \( b + a \/ q \) +
    sum_(j = 1)^k alpha_j \( b \) h^j + O \( H^(- 2) \) \, wide alpha_j \( b \) =
    frac(\( - 1 \)^(j - 1) v, 2 pi j \( b + a \/ q \)^j) . $
  Indeed the remainder is $O \( \| v \| \( M \/ H \)^(k + 1) \) = O \( H^(y - \( k + 1 \) \/ 4) \) =
    O \( H^(- 9 \/ 4) \)$, uniformly even as $k$ grows. Thus, with
  $ S \( bold(alpha) \) = sum_(h = 1)^M upright(e) #h(-0.16667em) (sum_(j = 1)^k alpha_j h^j) \, $
  the original sum is bounded by
  #[#set math.equation(numbering: n => "(9.9)")
   $ 1 / M sum_(b in cal(I)) \| S \( bold(alpha) \( b \) \) \| + O \( M + H^(- 1) \) . $ <lp:shifted-phase>]
  Partition the coefficient torus $\[ 0 \, 1 \)^k$ into boxes with side length $M^(- j)$ in coordinate $j$.
    Each box contains at most
  #[#set math.equation(numbering: n => "(9.10)")
   $ exp \( O \( k \) \) H^(4 \/ 5) $ <lp:occupancy>]
  of the vectors $bold(alpha) \( b \) med \( mod med 1 \)$.
    For this it suffices to use the coordinate $j = ceil.l y + 3 \/ 20 ceil.r$, which lies between $1$ and $k$.
    Before reduction modulo one, this coordinate has magnitude $O \( H^(- 3 \/ 20) \)$, is monotone,
    and has derivative of magnitude at least
  $ frac(\| v \|, 2 pi \( 2 H \)^(j + 1)) gt.eq exp \( - O \( k \) \) H^(y - j - 1) . $
  A coordinate interval of length $M^(- j)$ on the torus pulls back to at most two intervals in $b$.
    Their total length is at most $exp \( O \( k \) \) H^(1 + j \/ 4 - y)$.
    Here the floor in $M$ costs $exp \( O \( k \) \)$, while
  $ y - j / 4 gt.eq frac(3 y, 4) - 23 / 80 gt.eq 5 / 16 > 1 / 5 . $
  Counting integer points proves (9.10).
  Let $s$ be supplied by Lemma 26. We also need the following bound for suprema over boxes $Q$:
  #[#set math.equation(numbering: n => "(9.11)")
   $ sum_Q sup_(bold(alpha) in Q) \| S \( bold(alpha) \) \|^(2 s) lt.eq
     exp \( O \( s k + k \) \) M^K J_(s \, k) \( M \) . $ <lp:box-supremum>]
  To prove it, rescale each box to $\[ 0 \, 1 \]^k$. Iterating the one-dimensional fundamental theorem of calculus
    gives, for any smooth function $F$ on that cube,
  $ sup \| F \| lt.eq sum_(bold(epsilon.alt) in { 0 \, 1 }^k) integral_(\[ 0 \, 1 \]^k) \|
    partial^(bold(epsilon.alt)) F \| . $
  Hölder’s inequality bounds the $2 s$th power of the right-hand side by $2^(k \( 2 s - 1 \))$ times the sum of
    the corresponding $2 s$th moments. For the rescaled $S$, every mixed derivative has coefficients bounded in
    modulus by $\( 2 pi \)^k$: each differentiation in coordinate $j$ introduces the factor $2 pi i h^j \/ M^j$.
    On summing over the boxes, change of variables contributes $M^K$.
    Orthogonality then bounds the full-torus moment of every such derivative by $\( 2 pi \)^(2 s k)
    J_(s \, k) \( M \)$. This proves (9.11), with constants controlled at the growing degree.
  Apply Hölder’s inequality to the sum in (9.9), and use (9.10), (9.11), and (9.2).
    Since $\| cal(I) \| lt.double H$, the result is
  #[#set math.equation(numbering: n => "(9.12)")
   $ 1 / M sum_(b in cal(I)) \| S \( bold(alpha) \( b \) \) \| lt.double H
     (exp \( O \( k^(C_4) \) \) H^(- 1 \/ 5) M^(1 \/ 100))^(1 \/ \( 2 s \)) $ <lp:phase-final-bound>]
  for an absolute constant $C_4$. We have $k lt.double T^2$ and $s lt.double T^8$, whereas
  $ - 1 / 5 log H + 1 / 100 log M lt.eq - 77 / 400 log H . $
  Every fixed power of $T$ is $o \( L \/ T^2 \)$. Thus the right-hand side of (9.12) is at most $H
    exp \( - c_1 L \/ T^10 \)$ for some absolute $c_1 > 0$, once $x$ is sufficiently large.
    The errors in (9.9) are smaller. Increasing a fixed exponent $C_3 > 10$ absorbs $c_1$ and proves the Lemma. ◻
]

=== 9.3 A zero-free strip from the phase estimate <a-zero-free-strip-from-the-phase-estimate>

We next convert progression cancellation into a bound for a Dirichlet $L$-function near $"Re" s = 1$.
  A local logarithmic-derivative formula and the classical positive trigonometric polynomial then exclude zeros in
  the narrower strip needed for Mellin inversion.

We write $D \( s \, chi \)$ for the Dirichlet $L$-function, to distinguish it from $L = log x$.
  Characters need not be primitive. Periodicity gives $sum_(n lt.eq u) chi \( n \) = c_chi u + O \( q \)$,
  where $c_chi = q^(- 1) sum_(a med mod med q) chi \( a \)$.
  Partial summation therefore continues $D \( s \, chi \)$ meromorphically to $"Re" s > 0$,
  with only the possible simple pole at $s = 1$, and gives, for $sigma =
  "Re" s$ in a fixed compact subinterval of $\( 0 \, oo \)$,

#[#set math.equation(numbering: n => "(9.13)")
 $ D \( s \, chi \) = sum_(n lt.eq Y) frac(chi \( n \), n^s) + frac(c_chi Y^(1 - s), s - 1) +
   O #scale(x: 120%, y: 120%)[\(] q \( 1 + \| s \| \) Y^(- sigma) #scale(x: 120%, y: 120%)[\)] . $ <lp:L-tail>]

#thm([Lemma 9.6.])[
  (A bound near the line $"Re" s = 1$).  #emph[Fix $C > 0$ and put $r_(*) = T^4 \/ L$. Uniformly for $q lt.eq L^C$,
#[#set math.equation(numbering: n => "(9.14)")
 $ log \| D \( sigma + i v \, chi \) \| lt.double_C T^2 quad
   (\| sigma - 1 \| lt.eq 10 r_(*) \, quad 1 / 2 lt.eq \| v \| lt.eq 3 x^3) . $ <lp:L-upper-bound>]

]
] <lp:L-upper>

#proof[
  First suppose $\| v \| lt.eq exp \( L \/ \( 2 T^2 \) \)$, and use $Y = exp \( 2 L \/ T^2 \)$ in (9.13).
    Absolute summation gives
  $ sum_(n lt.eq Y) n^(- sigma) lt.double \( 1 + log Y \) max \( 1 \, Y^(1 - sigma) \) lt.eq exp \( O \( T^2 \) \) . $
  Since $\| s - 1 \| gt.eq 1 \/ 2$, the pole term has the same bound. The error is at most
  $ exp (- frac(3 L, 2 T^2) + O \( T^2 + C T \)) \, $
  and hence is negligible.
  For $exp \( L \/ \( 2 T^2 \) \) < \| v \| lt.eq 3 x^3$, take $Y = x^5$.
    The terms with $n lt.eq exp \( L \/ T^2 \)$ again contribute $exp \( O \( T^2 \) \)$ in absolute value.
    On a dyadic interval above this threshold, sum (9.7), with phase $- v$, over the residue classes modulo $q$,
    including their character coefficients. The factors $q$ and $1 \/ q$ cancel.
    Partial summation with $n^(- sigma)$ bounds that dyad by
  $ exp \( - L \/ T^(C_3) \) exp \( O \( T^4 \) \) . $
  There are $O \( L \)$ dyads, and the same bound applies to a final partial dyad.
    Their total is negligible, since $L \/ T^(C_3)$ exceeds every fixed power of $T$.
    Finally, the pole term and remainder in (9.13) are bounded respectively by
  $ exp (- frac(L, 2 T^2) + O \( T^4 \)) \, wide exp #scale(x: 120%, y: 120%)[\(] - 2 L +
    O \( T^4 + C T \) #scale(x: 120%, y: 120%)[\)] . $
  This proves (9.14). ◻
]

#thm([Lemma 9.7.])[
  (Local logarithmic derivative).  #emph[Fix $C > 0$, let $q lt.eq L^C$, and put $s_0 = 1 + r_(*) + i v$,
    where $1 lt.eq \| v \| lt.eq 5 / 2 x^3$. There is a radius $R$ with $4 r_(*) lt.eq R lt.eq 5 r_(*)$,
    with no zero on its boundary, for which
#[#set math.equation(numbering: n => "(9.15)")
 $ D' / D \( s \, chi \) = sum_(\| rho - s_0 \| < R) frac(1, s - rho) +
   O_C \( T^2 \/ r_(*) \) wide \( \| s - s_0 \| lt.eq 2 r_(*) \) \, $ <lp:local-log-derivative-formula>]

 away from zeros. The sum counts zeros with multiplicity and has $O_C \( T^2 \)$ terms.]
] <lp:local-log-derivative>

#proof[
  For large $x$, the disk $\| s - s_0 \| lt.eq 8 r_(*)$ avoids the possible pole at $s =
    1$ and lies in the region of Lemma 28. At its center the Euler product gives
  $ \| D \( s_0 \, chi \) \| gt.eq product_p \( 1 + p^(- 1 - r_(*)) \)^(- 1) =
    frac(zeta \( 2 + 2 r_(*) \), zeta \( 1 + r_(*) \)) gt.double r_(*) . $
  Thus $log \| D \( s_0 \, chi \) \| gt.eq - O \( T \)$. Jensen’s formula,
    using the radius $8 r_(*)$ and the upper bound $O_C \( T^2 \)$,
    shows that the disk of radius $5 r_(*)$ contains $O_C \( T^2 \)$ zeros.
    Choose $R in \[ 4 r_(*) \, 5 r_(*) \]$ so that none lies on its boundary.
  Use centered coordinates $z = s - s_0$, and write $a = rho - s_0$ for each zero in $\| z \| < R$.
    Divide $D \( s_0 + z \, chi \)$ by the disk Blaschke factors
  $ B_a \( z \) = frac(R \( z - a \), R^2 - overline(a) z) \, $
  repeated with multiplicity. The quotient $G$ is holomorphic and nonvanishing on the closed disk,
    and has the same boundary modulus as $D$. Maximum modulus gives $log \| G \| lt.eq
    M_0$ throughout the disk for some $M_0 = O_C \( T^2 \)$. Since $\| B_a \( 0 \) \| < 1$,
    $log \| G \( 0 \) \| gt.eq - O \( T \)$.
  Let $h$ be an analytic logarithm of $G$. The positive harmonic function $M_0 -
    "Re" h$ has value $O_C \( T^2 \)$ at the center. The Poisson formula,
    or its derivative together with Harnack’s inequality on concentric disks, gives
  $ \| h' \( z \) \| lt.double_C T^2 \/ r_(*) wide \( \| z \| lt.eq 2 r_(*) \) . $
  Restoring the factors uses
  $ B'_a / B_a \( z \) = frac(1, z - a) + frac(overline(a), R^2 - overline(a) z) . $
  The second term is $O \( 1 \/ r_(*) \)$ on $\| z \| lt.eq 2 r_(*)$, uniformly in $\| a \| < R$.
    There are $O_C \( T^2 \)$ such terms, giving exactly (9.15). ◻
]

#thm([Lemma 9.8.])[
  (A zero-free strip at large height).  #emph[For each fixed $C > 0$ there is $c =
    c \( C \) > 0$ such that every character of modulus at most $L^C$ has no zero in
#[#set math.equation(numbering: n => "(9.16)")
 $ "Re" s gt.eq 1 - c T^2 \/ L \, wide 1 lt.eq \| "Im" s \| lt.eq x^3 . $ <lp:zero-free-region>]

 Moreover,
#[#set math.equation(numbering: n => "(9.17)")
 $ lr(|D' / D \( s \, chi \)|) lt.double_C L quad
   (1 - frac(c T^2, 2 L) lt.eq "Re" s lt.eq 1 + 1 / L \, quad 2 lt.eq \| "Im" s \| lt.eq x^3 / 2) .
   $ <lp:log-derivative-bound>]

]
] <lp:zero-free>

#proof[
  For $sigma > 1$, the Euler products and the inequality $3 + 4 cos theta + cos \( 2 theta \) =
    2 \( 1 + cos theta \)^2 gt.eq 0$ give
  #[#set math.equation(numbering: n => "(9.18)")
   $ 0 lt.eq - 3 zeta' / zeta \( sigma \) - 4 "Re" D' / D \( sigma + i v \, chi \) - "Re" D' /
     D \( sigma + 2 i v \, chi^2 \) . $ <lp:trigonometric-positivity>]
  Indeed this follows term by term in the absolutely convergent prime-power expansions;
    primes dividing the modulus contribute only the positive zeta term.
    Also $- zeta' \/ zeta \( sigma \) = 1 \/ \( sigma - 1 \) + O \( 1 \)$ near $1$.
  Suppose $rho = beta + i v$ were a zero in (9.16), and set $sigma = 1 + 20 c T^2 \/ L$.
    Apply Lemma 29 at heights $v$ and $2 v$. The evaluation points lie in the respective inner disks,
    and $rho$ lies in the first zero sum, because $T^2 \/ L = o \( r_(*) \)$.
    No zero has real part greater than $1$, by the absolutely convergent Euler product.
    All terms in the zero sums therefore contribute nonpositively to the negative real logarithmic derivatives.
    Retaining the term at $rho$, and using $0 < sigma - beta lt.eq 21 c T^2 \/ L$,
    bounds the right-hand side of (9.18) by
  $ (frac(3, 20 c) - frac(4, 21 c) + O_C \( 1 \)) L / T^2 = (- frac(17, 420 c) + O_C \( 1 \)) L / T^2 . $
  Here the errors are $O_C \( T^2 \/ r_(*) \) = O_C \( L \/ T^2 \)$.
    Choosing a sufficiently small fixed $c > 0$ gives a contradiction.
  For $s$ in the region of (9.17), apply the local formula centered at $1 + r_(*) + i "Im" s$.
    Every zero in its sum has absolute imaginary part between $1$ and $x^3$, since $2 lt.eq \| "Im" s \| lt.eq
    x^3 \/ 2$ and $r_(*) = o \( 1 \)$. By (9.16), its horizontal distance from $s$ is at least $c
    T^2 \/ \( 2 L \)$. The $O_C \( T^2 \)$ zero terms and the local error therefore total $O_C \( L \)$,
    proving (9.17). ◻
]

=== 9.4 Mellin inversion and the prime polynomial <mellin-inversion-and-the-prime-polynomial>

The zero-free strip permits a short contour shift while keeping the imaginary part away from zero.
  Smoothing the interval first makes the horizontal edges and discarded Mellin tails uniformly negligible.

#proof[
  We first establish the analogous bound with the von Mangoldt weight. Let $delta = L^(- A - 4)$.
    Smooth the indicator of $I \/ N subset \[ 1 \, 2 \]$ by convolution with a nonnegative smooth kernel of width
    $delta$. This gives $0 lt.eq g lt.eq 1$, supported in $\[ 1 \/ 2 \, 3 \]$,
    whose difference from the indicator is supported within $O \( delta \)$ of its endpoints,
    and with $parallel g^(\( j \)) parallel_oo lt.double_j delta^(- j)$.
    The construction also applies when $I$ is shorter than $delta N$.
    Since $Lambda \( n \) lt.eq log n$, the error in replacing the interval by $g \( n \/ N \)$ is
  #[#set math.equation(numbering: n => "(9.19)")
   $ O #h(-0.16667em) (\( delta N + 1 \) frac(log \( 3 N \), N)) = O \( L^(- A - 2) \) \, $ <lp:smoothing-error>]
  uniformly in $I$.
  Define the Mellin transform by
  $ hat(g) \( z \) = integral_0^oo g \( w \) w^z thin frac(d w, w) . $
  On every fixed bounded real-part strip, integration by parts gives
  #[#set math.equation(numbering: n => "(9.20)")
   $ \| hat(g) \( u + i v \) \| lt.double_j L^(\( j + 1 \) \( A + 5 \)) \( 1 + \| v \| \)^(- j) . $ <lp:mellin-decay>]
  Also $\| hat(g) \( u + i v \) \| lt.double 1$ there, by absolute integration.
    Mellin inversion and the absolutely convergent logarithmic derivative on $"Re" z = 1 \/ L$ yield
  #[#set math.equation(numbering: n => "(9.21)")
   $ sum_n Lambda \( n \) chi \( n \) n^(- 1 + i t) g \( n \/ N \) =
     frac(1, 2 pi i) integral_(1 \/ L - i oo)^(1 \/ L + i oo) hat(g) \( z \) N^z
     (- D' / D \( 1 - i t + z \, chi \)) d z . $ <lp:mellin-inversion>]
  On this full line, absolute convergence gives
  $ lr(|D' / D \( 1 + 1 \/ L + i u \, chi \)|) lt.eq sum_n frac(Lambda \( n \), n^(1 + 1 \/ L)) = - zeta' /
    zeta \( 1 + 1 \/ L \) lt.double L \, $
  at every height $u$.
  Choose a fixed $C_5 > A + 6$ and put $H_0 = L^(C_5)$. Then choose a fixed integration-by-parts order $j$ large
    enough that (9.20) makes the two tails with $\| "Im" z \| > H_0$ in (9.21) $O \( L^(- A - 2) \)$.
    Explicitly their bound is
  $ O_j #h(-0.16667em) (L^(1 + \( j + 1 \) \( A + 5 \)) H_0^(1 - j)) \, $
  since $N^(1 \/ L) lt.double 1$. Fix $B_0 > C_5 + 2$. For $L^(B_0) lt.eq \| t \| lt.eq x^2$,
    every point in the rectangle
  $ - frac(c T^2, 2 L) lt.eq "Re" z lt.eq 1 / L \, wide \| "Im" z \| lt.eq H_0 $
  has
  #[#set math.equation(numbering: n => "(9.22)")
   $ 2 lt.eq \| - t + "Im" z \| lt.eq x^2 + H_0 < x^3 / 2 $ <lp:contour-heights>]
  for large $x$. Thus Lemma 30 applies throughout the rectangle.
    There are no zeros or poles of the logarithmic derivative inside it; in particular,
    the possible principal-character pole at $z = i t$ is outside it.
  Shift the truncated contour to $"Re" z = - c T^2 \/ \( 2 L \)$.
    The horizontal edges are $O \( L^(- A - 2) \)$, by (9.17) and (9.20),
    increasing the already fixed order $j$ if necessary. On the new vertical segment,
  $ \| N^z \| = exp (- frac(c T^2 log N, 2 L)) lt.double exp \( - c tau T^2 \/ 2 \) . $
  Its remaining factors and length cost at most a fixed power of $L$.
    Since $exp \( - c tau T^2 \/ 2 \)$ is smaller than every prescribed fixed power of $L^(- 1)$,
    the shifted integral is $O \( L^(- A - 2) \)$. Together with (9.19), this proves,
    uniformly for all subintervals $I subset \[ N \, 2 N \]$,
  #[#set math.equation(numbering: n => "(9.23)")
   $ sum_(n in I) Lambda \( n \) chi \( n \) n^(- 1 + i t) lt.double L^(- A - 2) . $ <lp:mangoldt-estimate>]
  Prime powers of exponent at least two contribute in absolute value at most
    $O \( N^(- 1 \/ 2) \( log \( 3 N \) \)^2 \)$: there are $O \( sqrt(N) log \( 3 N \) \)$ possible bases and
    exponents with $N lt.eq p^a lt.eq 2 N$, and every summand has size $O \( log \( 3 N \) \/ N \)$.
    This is smaller than every fixed power of $L^(- 1)$ in the present range.
    Removing them from (9.23) gives the same uniform bound for $sum_(p in I) \( log p \) chi \( p \)
    p^(- 1 + i t)$. Finally, partial summation against $1 \/ log u$,
    whose value and total variation on $\[ N \, 2 N \]$ are $O_tau \( 1 \/ L \)$,
    removes the logarithmic weight and proves (9.1). ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
