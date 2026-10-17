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

#align(center)[#text(size: 16pt, weight: "bold")[A quadratic bound for Jacobsthal's function]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

For a positive integer $n$, let $j \( n \)$ be the least positive integer $m$ such that every interval of $m$ consecutive integers contains an integer coprime to $n$. Write $omega \( n \)$ for the number of distinct prime divisors of $n$, with $omega \( 1 \) = 0$, and put

$ h \( k \) = sup_(n gt.eq 1\
omega \( n \) lt.eq k) j \( n \) \, #h(2em) k gt.eq 1 . $

The starting point of the interval is arbitrary, and replacing $n$ by the product of its distinct prime divisors does not change $j \( n \)$. Thus $h \( k \) - 1$ is the greatest length of an interval that can be covered by the divisibility classes of at most $k$ primes.

Jacobsthal studied this function in a series of papers beginning in 1960 #cite(label("Jacobsthal1960")). Erdős subsequently recorded Jacobsthal’s question whether $h \( k \) lt.double k^2$ #cite(label("Erdos1962")) p. 163, equations (1) and (3). In Erdős’s notation, $C \( k \) + 1$ is the maximum of $j \( n \)$ over integers with exactly $k$ distinct prime divisors. This equals our $h \( k \)$: adjoining prime divisors cannot decrease $j \( n \)$. We prove the following bound, which gives an affirmative answer and a further iterated-logarithmic saving.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C > 0$ such that 
$ h \( k \) lt.eq C frac(k^2, \( log log \( 3 k \) \)^2) #h(2em) upright("for every integer ") k gt.eq 1 . $

]
] <thm:main>

All logarithms are natural. In particular the theorem gives a uniform quadratic bound for arbitrary sets of prime divisors, with no restriction on their sizes or on the interval’s translation.

=== Historical context and related work <historical-context-and-related-work>

The development of the upper bound is closely tied to sieve theory. Erdős observed that Brun’s method gives $h \( k \) lt.double k^(C_0)$ for some absolute exponent $C_0$ #cite(label("Erdos1962")) p. 163. Iwaniec’s work on the error term in the linear sieve gave an estimate of order $k^2 log^2 k$ when the prime divisors are the first $k$ primes #cite(label("Iwaniec1971")); this primorial case is distinguished explicitly in #cite(label("Vaughan1977")) p. 329 and #cite(label("Iwaniec1978")) pp. 225–226. Vaughan then proved the uniform estimate

$ j \( n \) lt.double omega \( n \)^2 #scale(x: 120%, y: 120%)[\(] log \( 2 omega \( n \) \) #scale(x: 120%, y: 120%)[\)]^4 #h(2em) \( n > 1 \) $

#cite(label("Vaughan1977")) Theorem, p. 329. Iwaniec’s shifted-sieve argument removed two logarithmic factors and established $h \( k \) lt.double k^2 log^2 k$ for arbitrary prime sets #cite(label("Iwaniec1978")) Theorem and Corollary, p. 226. Theorem 1 improves this bound and, in particular, reaches the quadratic scale asked for by Jacobsthal.

Vaughan explained the exponent $2$ through the one-dimensional sieve’s restriction to moduli near the square root of the interval length #cite(label("Vaughan1977")) p. 329. In the usual linear-sieve notation this appears as the vanishing of the lower function $f$ at sieve parameter $2$. Our proof also reaches this limiting parameter. It keeps a boundary contribution that disappears from the leading linear-sieve term, and then controls the discrepancy between this reference calculation and the actual prescribed classes. The latter comparison requires the inverse estimate and the stopped counts developed below; positivity of the reference calculation alone does not give a lower bound for the original sieve.

A separate question concerns which prime sets give the largest gap. Let $p_k$ denote the $k$th prime and $P_k = product_(i = 1)^k p_i$. Jacobsthal suggested that $j \( P_k \) = h \( k \)$ for every $k$. Hajdu and Saradha proved equality for $k lt.eq 23$, but found

$ j \( P_24 \) = 234 < 236 = h \( 24 \) $

#cite(label("HajduSaradha2012")) Theorem 1.2. Thus the primorial extremality conjecture is distinct from the quadratic-bound question, and a theorem only about $j \( P_k \)$ does not settle the uniform problem. The computational literature reflects this distinction. Costello and Watts obtained recursive lower bounds for the minimum number of integers coprime to $P_k$ in an interval, and used them to compute upper bounds for $j \( P_k \)$ #cite(label("CostelloWatts2015")) Theorem 4.4 and Section 5. Ziller computed the maximum over arbitrary prime sets through $43$ prime factors #cite(label("Ziller2019")) Section 3. These finite computations concern explicit values, whereas the constant in Theorem 1 is not made explicit.

Primorials nevertheless give the strongest lower bounds relevant to the order of $h \( k \)$. They arise from constructions of long covered intervals, which also produce large gaps between consecutive primes. Erdős’s account already places Rankin’s lower-bound construction beside Brun’s polynomial upper bound #cite(label("Erdos1962")) p. 163, equation (2). The later construction of Ford, Green, Konyagin, Maynard and Tao gives

#[#set math.equation(numbering: n => "(1.1)")
 $ j \( P_k \) gt.double k \( log k \)^2 frac(log log log k, log log k) #h(2em) \( k arrow.r oo \) $ <eq:historical-lower-bound>]

#cite(label("FGKMT2018")) Section 1.1. Indeed, their covered-interval bound at prime cutoff $x$ is

$ gt.double x log x thin log log log x \/ log log x \; $

take $x = p_k$ and use $p_k tilde.op k log k$. Since $j \( P_k \) lt.eq h \( k \)$, this supplies a lower bound for the uniform maximum as well. It is an existence construction and does not assert the same lower bound for every integer with $k$ prime divisors. The gap between (1.1) and our upper bound remains substantial. Vaughan suggested the stronger possible estimate $j \( n \) lt.double_epsilon omega \( n \)^(1 + epsilon)$ for $n > 1$ and each fixed $epsilon > 0$ #cite(label("Vaughan1977")) p. 329.

=== A quantitative covering estimate <a-quantitative-covering-estimate>

The proof works with one prescribed residue class at each prime below a size cutoff. This is another form of the same covering problem: for a finite prime set, the Chinese remainder theorem supplies an integer $b$ with $b equiv a_p med \( mod med p \)$ at every prime in the set, and

$ n equiv.not a_p med \( mod med p \) med upright("for every such ") p quad arrow.l.r.double quad gcd (n - b \, product p) = 1 . $

This equivalence explains why arbitrary classes and arbitrary translations occur together; see also #cite(label("HajduSaradha2012")) Lemma 2.1.

For sufficiently large real $z$, set

#[#set math.equation(numbering: n => "(1.2)")
 $ L = log z \, #h(2em) Y = ⌊z^2 / L^2⌋ \, #h(2em) w = frac(L, \( log L \)^2) \, #h(2em) B = frac(L, log w) \,\
V_0 = product_(p lt.eq w) (1 - 1 / p) . $ <eq:parameters>]

Products indexed by a letter explicitly called prime always range over primes. The two cutoffs separate the small primes, which are sieved inside arithmetic progressions, from the primes in $\( w \, z \]$, which index the expansion used in the proof. The quantity $B$ is the logarithmic size of the upper cutoff in base $w$.

#thm([Theorem 1.2.])[
  #emph[There are absolute constants $c > 0$ and $z_0$ with the following property. For every real $z gt.eq z_0$ and every choice of a residue class $a_p med \( mod med p \)$ for each prime $p lt.eq z$, 
#[#set math.equation(numbering: n => "(1.3)")
 $ \# { 1 lt.eq n lt.eq Y : n equiv.not a_p med \( mod med p \) upright(" for every ") p lt.eq z } gt.eq c frac(Y V_0, B^2) . $ <eq:main-survivors>]

]
] <thm:survivors>

Mertens’ theorem identifies the size of this lower bound:

#[#set math.equation(numbering: n => "(1.4)")
 $ frac(Y V_0, B^2) tilde.op e^(- gamma) frac(Y log w, L^2) . $ <eq:survivor-scale>]

The number of survivors, rather than positivity alone, permits the passage from a prime cutoff to a bound in terms of the number of prime divisors. For sufficiently large $k$, if $n$ has at most $k$ distinct prime divisors, apply Theorem 2 at a cutoff $z = A_0 k log k \/ log log k$, where $A_0$ is a sufficiently large fixed constant. A progression upper sieve bounds the total number of these survivors removed by the remaining divisor primes $q > z$ by $O \( k \( 1 + X \/ log X \) \)$, where $X = Y \/ z$. The lower bound in (1.4) dominates this loss for that choice of $A_0$, while $Y asymp k^2 \/ \( log log k \)^2$. Section 11 gives the comparison with constants and handles the bounded range of $k$.

The quantitative estimate also relates to the interval-sieve quantity studied by Banks, Ford and Tao #cite(label("BanksFordTao2023")) Sections 1.3–1.4. They minimize the survivor count over all choices of forbidden classes at primes up to $\( y \/ log y \)^(1 \/ 2)$ in an interval of length $y$. At that cutoff a classical lower sieve gives a bound of order $y log log y \/ \( log y \)^2$. Theorem 2 retains this order of magnitude at the larger cutoff $z asymp sqrt(Y) log Y$. The classes here are arbitrary; no random choice of the forbidden classes is assumed in this theorem.

=== Outline of the argument <outline-of-the-argument>

The proof has two parts: a reference calculation for a decreasing-prime expansion, and a comparison with the actual residue classes. Section 3 partitions discarded integers by the least prime at which they hit a forbidden class. Iteration gives tuples of strictly decreasing primes. At even depths the expansion is a lower bound, and at odd depths it is an upper bound. An admission rule limits the progressions retained in this expansion so that each is long enough for an absolute upper sieve. Replacing its small-prime count by progression coordinate length times $V_0$ defines the reference tree.

The leading reference term is governed by the classical linear-sieve functions $f \, F$ #cite(label("MontgomeryVaughanII")) Section 21.2.2, with the root tending to the critical parameter $2$. The lower exponent cutoff leaves a boundary contribution on the smaller scale $B^(- 2)$. Each prime path has weight equal to the reciprocal product of its primes. Replacing reciprocal-prime sums by harmonic integrals $d x \/ x$ gives a continuous reference process. To evaluate the boundary contribution, Section 4 uses derivative weights of $f \, F$ to normalize its transitions to a probability kernel. Its regeneration cycles give limiting occupation measures, which Section 5 transfers to prime tuples. Section 6 then evaluates the boundary contribution and bounds the losses imposed by the admission rule. A positive margin remains after these losses and the negative contribution from the root’s small displacement below parameter $2$.

The actual small-prime counts agree with their reference values in long progressions, by the fundamental lemma of sieve theory. At a short progression, a large relative discrepancy must already be visible along one of the last few edges of its path. Section 7 places these paths in boxes in which selected prime factors vary independently. An inverse estimate in Section 8 shows that many discrepant edges force alignment with one of finitely many rationals $A \/ D$: a prime $p$ aligns when $D a_p equiv A med \( mod med p \)$.

The inverse step is related to the principle that modular concentration forces algebraic structure, developed by Helfgott and Venkatesh and by Walsh #cite(label("HelfgottVenkatesh2009")) #cite(label("Walsh2012")). Our argument uses partial incidence constraints in a single prime bin and obtains a rational list fixed for the whole box. It combines polynomial interpolation with Jarník’s convex-arc lattice-point argument #cite(label("Jarnik1926")) and the pair-counting principle of Gallagher’s larger sieve #cite(label("Gallagher1971")). Variance estimates in Section 9 then show that a rational can account for many discrepant endpoints only when its effective modulus and intercept are small. The pair-moment calculation is a truncated form of mean singular-series averaging #cite(label("Gallagher1976")); the paper proves the required uniformity and stability under the changes of measure used here.

For the endpoints remaining after this argument, many earlier prime factors align with the same rational. Section 10 stops their branches at suitable even nodes. The stop rule depends on prime bins in a way that permits one aligned prime to vary over a large subset of its bin. Averaging over that prime gives more exact survivors than the reference subtree requires. A marked-renewal argument shows that all but an arbitrarily small amount of the exceptional path mass reaches one of these stops.

The comparison identity (3.7) joins these parts. Proposition 22 supplies a positive reference term; the inverse and variance estimates leave only the endpoints of Corollary 33; and Propositions 38 and 39 supply the stopped comparison and its coverage. Section 11 bounds the total remaining discrepancy, proves Theorem 2, and deduces Theorem 1.

=== Conventions <conventions>

The constants in the proof are absolute after the explicitly stated parameters have been chosen. They need not be effective. Whenever a bin width $xi$ occurs, it is fixed before $z$ tends to infinity. Constants independent of sufficiently small fixed $xi$ do not assert uniformity for a width $xi \( z \)$ tending to zero. This order matters in the rational-list and stopping arguments.

We use $phi$ for Euler’s totient, $tau$ for the divisor function, $"rad" \( m \)$ for the product of the distinct prime divisors of $m$, and $macron(u)$ for a multiplicative inverse in a displayed modulus. All rationals $A \/ D$ used for alignment are reduced, with $D > 0$.

== 2 Sieve and prime-distribution inputs <sec:inputs>

We state the forms of the classical estimates used in the proof. Appendix 13 supplies elementary proofs of the Buchstab normalization, the required additive large-sieve bound and the plane-curve intersection estimate, and derives the progression upper bound from the fundamental lemma. The inverse and stopping arguments in the later sections are proved directly.

#thm([Lemma 2.1.])[
  (Fundamental lemma of the sieve).  #emph[Let $cal(P)$ be any subset of the primes at most $v$. Suppose that intersection counts for bad conditions indexed by squarefree products $l$ of primes in $cal(P)$ have the form 
$ X g \( l \) + r_l \, $

 where $g$ is multiplicative and 
$ 0 lt.eq g \( p \) lt.eq 2 / p \, #h(2em) g \( p \) < 1 \, #h(2em) g \( 2 \) lt.eq 1 / 2 quad upright("if ") 2 in cal(P) . $

 There are absolute constants $c \, C > 0$ and $s_0$ such that for $s gt.eq s_0$ the count avoiding all the bad conditions is 
#[#set math.equation(numbering: n => "(2.1)")
 $ X product_(p in cal(P)) \( 1 - g \( p \) \) #scale(x: 120%, y: 120%)[\(] 1 + O \( e^(- c s) \) #scale(x: 120%, y: 120%)[\)] + O #h(-0.16667em) (sum_(l lt.eq v^s\
l upright(" squarefree")\
p divides l arrow.r.double p in cal(P)) tau \( l \)^C \| r_l \|) . $ <eq:fundamental-input>]

 The same statement holds for nonnegative weighted counts. A local condition that makes the sifted set empty may instead be removed from consideration as an exactly empty case.]
] <lem:fundamental>

This is a standard dimension-two form of the fundamental lemma; see #cite(label("Sofos2023")) Lemma 2.8, p. S137, which records the stronger remainder sum without divisor weights and attributes the result to #cite(label("FriedlanderIwaniec2010")) Corollary 6.10. To check the uniform dimension condition here, put $g \( p \) = 0$ outside $cal(P)$. For $p gt.eq 3$,

$ \( 1 - 2 \/ p \)^(- 1) = \( 1 - 1 \/ p \)^(- 2) #scale(x: 120%, y: 120%)[\(] 1 + O \( p^(- 2) \) #scale(x: 120%, y: 120%)[\)] . $

Mertens’ theorem therefore gives

$ product_(u lt.eq p < v) \( 1 - g \( p \) \)^(- 1) lt.eq K (frac(log v, log u))^2 #h(2em) \( 2 lt.eq u < v \) $

with an absolute $K$. The factor at 2 is at most 2. The sieve weights depend only on intersections of the bad conditions, so their use is not restricted to literal divisibility conditions.

#thm([Lemma 2.2.])[
  (Prime-distribution estimates).  #emph[The following estimates will be used, with absolute constants unless fixed subscripts indicate a dependence.]
  + #emph[There is $c > 0$ such that 
$ pi \( v \) = "li" \( v \) + O #h(-0.16667em) (frac(v, log v) e^(- c sqrt(log v))) \, #h(2em) product_(p lt.eq v) \( 1 - 1 \/ p \) = frac(e^(- gamma), log v) #scale(x: 120%, y: 120%)[\(] 1 + O \( e^(- c sqrt(log v)) \) #scale(x: 120%, y: 120%)[\)] . $

 Decreasing $c$ absorbs harmless powers of $log v$.]
  + #emph[For every fixed $A \, M > 0$, uniformly for $q lt.eq \( log v \)^A$ and $\( a \, q \) = 1$, 
$ pi \( v \; q \, a \) = frac("li" \( v \), phi \( q \)) + O_(A \, M) #h(-0.16667em) (frac(v, \( log v \)^M)) . $

 The implied constants may be ineffective.]
  + #emph[For $\( a \, q \) = 1$ and $H \/ q$ exceeding a suitable absolute constant, 
$ \# { x < p lt.eq x + H : p equiv a med \( mod med q \) } lt.double frac(H, phi \( q \) log \( H \/ q \)) . $

]
  + #emph[Uniformly for $v^(9 \/ 10) lt.eq H lt.eq v$ as $v arrow.r oo$, 
$ \# { v - H < p lt.eq v } gt.eq \( 1 - o \( 1 \) \) frac(H, log v) . $

]
] <lem:prime-inputs>

Part (i) is the classical zero-free-region PNT together with its Mertens product consequence; see #cite(label("IwaniecKowalski2004")), and the stronger explicit PNT error in #cite(label("FioriKadiriSwidinsky2023")). Parts (ii) and (iii) are Siegel–Walfisz and Brun–Titchmarsh; see the explicit statements in #cite(label("GranvilleSoundararajan")) p. 75 and #cite(label("GranvilleSoundararajan2014")) Theorem 1.4.4, p. 39, respectively. Lemma 45 derives the order bound in part (iii) from the stated sieve input and Mertens’ formula. Part (iv) follows from the short-interval PNT of Huxley, for example in Heath-Brown’s proof #cite(label("HeathBrown1982")) Theorem, p. 1365. To see that a fixed-exponent version suffices, tile an interval of length at least $v^(9 \/ 10)$ by intervals ending at $x$ of length $x^(4 \/ 5)$. Stop before the final incomplete tile or before $x < v^(1 \/ 2)$. The lost total length is $O \( v^(4 \/ 5) + v^(1 \/ 2) \) = o \( H \)$. All remaining endpoints tend to infinity uniformly, so the fixed-exponent theorem sums over the tiles. Prime powers contribute a negligible amount, and $log p lt.eq log v$ gives the stated prime-count lower bound.

We also use the additive large sieve in the following standard form: for distinct reduced fractions with denominators at most $Q$, and coefficients supported on $J$ consecutive integers,

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(q lt.eq Q) med sum_(a med mod med q\
\( a \, q \) = 1) lr(|sum_j b_j e \( a j \/ q \)|)^2 lt.double \( J + Q^2 \) sum_j \| b_j \|^2 \, #h(2em) e \( t \) = e^(2 pi i t) . $ <eq:large-sieve-input>]

See #cite(label("MontgomeryVaughan1973")) and #cite(label("VaughanLargeSieve")) Theorem 3. Lemma 43 proves the order bound needed here.

For the complete Kloosterman sum

$ "Kl" \( h \, k \; N \) = sum_(u med mod med N\
\( u \, N \) = 1) e #h(-0.16667em) (frac(h u + k macron(u), N)) $

we use

#[#set math.equation(numbering: n => "(2.3)")
 $ \| "Kl" \( h \, k \; N \) \| lt.double tau \( N \) \( h \, k \, N \)^(1 \/ 2) N^(1 \/ 2) . $ <eq:kloosterman-input>]

This holds for arbitrary positive moduli, including prime powers, and for noncoprime or zero frequencies; see #cite(label("Lichtman2022")) Lemma 7.1 and #cite(label("IwaniecKowalski2004")) Corollary 11.12, p. 280. The gcd factor in (2.3) will be retained in all completions.

The probability input is the nonarithmetic iid key renewal theorem: if positive iid increments have finite positive mean $mu$, renewal measure $U$, and $H$ is directly Riemann integrable, then

#[#set math.equation(numbering: n => "(2.4)")
 $ \( U * H \) \( v \) arrow.r 1 / mu integral_(bb(R)) H \( u \) thin d u . $ <eq:renewal-input>]

We apply the usual half-line theorem after translating tests that vanish on a left half-line; see #cite(label("Serfozo2009")) Section 2.7, Theorem 35. The regeneration, finite-mean, nonarithmetic and direct-integrability hypotheses needed here are proved in Section 4. There we also use the classical Buchstab limit $omega_(upright("Bu")) \( s \) arrow.r e^(- gamma)$, with its independent local proof in Lemma 42; see also #cite(label("MontgomeryVaughanIII")) Section 28.9, p. 236.

=== 2.1 Small-prime counts in a progression <small-prime-counts-in-a-progression>

#thm([Lemma 2.3.])[
  #emph[Let one forbidden class be given at every prime $p lt.eq u$, where $u arrow.r oo$. Count the points in a progression segment whose coordinate interval has real length $J$, and whose step is coprime to every prime $p lt.eq u$. Put $V_(upright("sm")) \( u \) = product_(p lt.eq u) \( 1 - 1 \/ p \)$. For each fixed $eta > 0$, uniformly when $J gt.eq u^eta$, its sifted count $N$ satisfies 
#[#set math.equation(numbering: n => "(2.5)")
 $ N lt.double_eta J V_(upright("sm")) \( u \) . $ <eq:small-upper>]

 There are absolute $c_1 \, C_1 > 0$ and a sufficiently large fixed $v_0$ such that, writing $v = log_u J$, uniformly for $v gt.eq v_0$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ lr(|frac(N, J V_(upright("sm")) \( u \)) - 1|) lt.eq C_1 e^(- c_1 v) . $ <eq:small-relative>]

 All estimates are independent of the progression’s initial point, step and forbidden classes.]
] <lem:small-sieve>

#proof[
  For any squarefree $l$ supported on the small primes, the simultaneous bad conditions specify one class of the progression coordinate modulo $l$. Their count is $J \/ l + O \( 1 \)$, with an absolute error independent of the step and the classes. Apply Lemma 3 at level $J^(1 \/ 2)$. Its sieve parameter is $v \/ 2$, and the remainder sum is
  $ lt.double J^(1 \/ 2) \( 1 + log J \)^(C_2) $
  for an absolute fixed $C_2$. After division by $J V_(upright("sm")) \( u \)$, this is
  $ lt.double J^(- 1 \/ 2) \( 1 + log J \)^(C_2) log u . $
  For all sufficiently large $u$ this is at most $e^(- c_1 v)$ uniformly for $v gt.eq v_0$, on decreasing $c_1$ and increasing $v_0$ if necessary. The relative fundamental-lemma error has the same form. This proves (2.6).
  For (2.5), sieve only by primes at most $u^theta$, where $0 < theta < 1$ is fixed sufficiently small in terms of $eta$. At level $J^(1 \/ 2)$ the sieve parameter is at least $eta \/ \( 2 theta \)$ and can therefore be made larger than $s_0$. The upper fundamental lemma gives
  $ N lt.double J V_(upright("sm")) \( u^theta \) + J^(1 \/ 2) \( 1 + log J \)^(C_2) lt.double_eta J V_(upright("sm")) \( u \) \, $
  using Mertens and $J gt.eq u^eta$. The same calculation covers either endpoint convention and nonintegral $J$, since each intersection still has an $O \( 1 \)$ endpoint error. ◻
]

We will repeatedly apply (2.5) to short difference pieces created by freezing an interval length. If $xi > 0$ is fixed and the coordinate length of such a piece is comparable to $xi J$, with $xi J gt.eq u^eta$, its cost is $O_eta \( xi J V_(upright("sm")) \( u \) \)$. The constant does not depend on $xi$; the threshold from which the length inequality holds may depend on that fixed width. The same observation applies to a specified residue subsequence of the piece.

== 3 The decreasing-prime tree <sec:tree>

Fix the residue classes in Theorem 2, and use (1.2). Set

$ a_star.op = 1 / 100 \, #h(2em) x \( p \) = frac(log p, log w) . $

Thus $x \( p \)$ measures a prime’s exponent in base $w$, and $1 < x \( p \) lt.eq B$ for $p in \( w \, z \]$. A node is a finite tuple of strictly decreasing primes in $\( w \, z \]$. Its product is denoted by $d$, with $d = 1$ for the empty tuple. Put

#[#set math.equation(numbering: n => "(3.1)")
 $ J_d = Y / d \, #h(2em) r_d = log_w J_d - a_star.op + 2 \, #h(2em) mu_d = J_d V_0 . $ <eq:tree-state>]

At the root, $r_0 = 2 B - a_star.op + o \( 1 \)$ and the cutoff is $b = B$. At a nonempty node, the cutoff is $b = x \( p_(upright("last")) \)$, and the available primes satisfy $w < p < p_(upright("last"))$. The root cutoff includes $p = z$ when $z$ is prime. All subsequent cutoffs are strict.

Let $N_d$ count integers $1 lt.eq n lt.eq Y$ that hit every prescribed class at the prime factors of $d$ and avoid every prescribed class at the primes at most $w$. Let $S_d \( b \)$ impose, in addition, avoidance at all available primes above $w$ up to the cutoff. In particular, the survivor count in Theorem 2 is $S_1 \( B \)$. The simultaneous hits give one class modulo $d$, so Lemma 5 applies in its progression coordinates.

Partition the integers counted by $N_d$ but not by $S_d \( b \)$ according to their smallest bad available prime. This gives the exact identity

#[#set math.equation(numbering: n => "(3.2)")
 $ S_d \( b \) = N_d - sum_(p upright(" available")) S_(d p) \( x \( p \) \) . $ <eq:tree-identity>]

Although the partition uses the smallest bad prime, iteration produces decreasing prime tuples because the child count avoids all smaller available primes.

Nodes of even length are called lower nodes, and nodes of odd length are called upper nodes. From a lower node include every available child. From an upper node include a child with exponent $x = x \( p \)$ exactly when

#[#set math.equation(numbering: n => "(3.3)")
 $ r - x gt.eq cal(H) \( x \) \, #h(2em) cal(H) \( x \) = max \( 2 x \, x + 2 \) \, $ <eq:admission>]

where $r$ is the parent’s gap. Other children are omitted.

#thm([Lemma 3.1.])[
  #emph[The alternating sum of the $N_d$ over all included nodes is a lower bound for $S_1 \( B \)$. More generally, one may stop at any prefix-free collection of included lower nodes, use their exact counts $S_d \( b \)$, and expand only the other nodes. The resulting expression is still a lower bound for $S_1 \( B \)$. Every included node satisfies $J_d gt.eq w^(a_star.op)$.]
] <lem:tree-lower-bound>

#proof[
  The tree is finite because all factors are distinct primes at most $z$. Work upward from its leaves. At a lower node, replacing each child by an upper bound in (3.2) gives a lower bound. At an upper node, omitting nonnegative child counts and replacing the retained children by lower bounds gives an upper bound. This proves the sign assertion by induction. An exact count at a lower node is an admissible lower bound there; prefix-freeness ensures that its descendants are not expanded as well.
  At a nonroot lower node, admission gives $r gt.eq 2 b$ and $r gt.eq b + 2$. Every child exponent satisfies $1 < x lt.eq b$, so its gap is at least 2. At the root, $r_0 - B = B - a_star.op + o \( 1 \) > 2$ for large $z$, giving the same conclusion for every first child. Included lower nodes also have gap exceeding 2 by their admission rule. Hence all included nodes have $log_w J_d = r_d - 2 + a_star.op gt.eq a_star.op$. ◻
]

Figure 1 separates the admission decision at an upper node from the later choice of lower stops.

#figure(
  [(154,98) (77,89)
  (0,0)
  Expanded lower node $d$ every available child is included
  (77,79)(0,-1)15 (81,71)(0,0)\[l\]$p$ (77,54)
  (0,0)
  Included upper node $d p$ test each prospective lower child
  (69,45)(-4,-1)43 (77,44)(0,-1)12 (85,45)(4,-1)43 (46,37)(0,0)$q$ (81,38)(0,0)\[l\]$q'$ (110,37)(0,0)$u$ (26,19)
  (0,0)
  Included lower node $d p q$ chosen stop: retain $S_(d p q) \( x \( q \) \)$ exactly
  (77,19)
  (0,0)
  Included lower node $d p q'$ continue its lower-bound expansion
  (105,9.5)
  (46,19)
  Prospective child $d p u$ omitted by the admission rule
  (51,3)(0,0)$q \, q'$ satisfy (3.3) (128,3)(0,0)$u$ fails (3.3)],
  caption: [Figure 1: Admission and stopping have different roles. Only selected branches are drawn, with $q \, q' \, u < p$. At the upper node, admission is the test $r_(d p) - x \( v \) gt.eq cal(H) \( x \( v \) \)$ for the prospective prime $v$. The omitted child $d p u$ does not belong to the included tree. The admitted child $d p q$ is shown as a member of a separately chosen, prefix-free set of lower stops; its descendants are replaced by its exact survivor count. Other included lower nodes continue to expand. The specific stop rule is given in Section 10. ],
) <fig:admission-and-stopping>

In particular, uniformly at included nodes,

#[#set math.equation(numbering: n => "(3.4)")
 $ N_d / mu_d lt.double_(a_star.op) 1 \, #h(2em) lr(|N_d / mu_d - 1|) lt.double e^(- c_1 log_w J_d) quad upright("when ") log_w J_d gt.eq v_0 . $ <eq:tree-small-counts>]

The absolute upper bound remains valid on the slightly enlarged progressions with $J_d gt.eq w^(a_star.op \/ 2)$ that will arise in boxes.

=== 3.1 The reference tree <the-reference-tree>

Replace $N_d$ by $mu_d$ in the unstopped tree. Divide a subtree value by its own $mu_d$, and denote the result by $P_(upright(e)) \( r \, b \)$ or $P_(upright(o)) \( r \, b \)$ according to parity. Dependence on $w$ and on the endpoint convention is left implicit. Since $mu_(d p) = mu_d \/ p$, the recursions are

#[#set math.equation(numbering: n => "(3.5)")
 $ P_(upright(e)) \( r \, b \) & = 1 - sum_(p upright(" available")) 1 / p P_(upright(o)) \( r - x \( p \) \, x \( p \) \) \,\
P_(upright(o)) \( r \, b \) & = 1 - sum_(p upright(" available")\
r - x \( p \) gt.eq cal(H) \( x \( p \) \)) 1 / p P_(upright(e)) \( r - x \( p \) \, x \( p \) \) . $ <eq:reference-tree>]

The reference value at the root is $Y V_0 P_(upright(e)) \( r_0 \, B \)$. Auxiliary starting states used below follow the same recursions on their declared domains; no actual forbidden classes are needed to define them.

A path’s #emph[harmonic weight] is the reciprocal product of its chosen primes. Dropping all admission restrictions shows that the sum of the weights of all decreasing-prime prefixes is

#[#set math.equation(numbering: n => "(3.6)")
 $ product_(w < p lt.eq z) (1 + 1 / p) lt.double B . $ <eq:total-prefix-mass>]

Indeed $log \( 1 + 1 \/ p \) = 1 \/ p + O \( p^(- 2) \)$, and the reciprocal-prime sum is $log B + O \( 1 \)$.

We also use #emph[standard] paths: these keep only the admission condition $r - x gt.eq 2 x$ at an upper node. They contain all paths of the original tree and agree with it whenever the next exponent is at least 2. The continuous harmonic model replaces reciprocal-prime sums by $d x \/ x$, with decreasing real exponents. It will be studied first, then compared with the actual prime paths.

=== 3.2 Comparison after stopping <comparison-after-stopping>

For later use, the comparison identity can be recorded explicitly. Let $cal(T)$ be the retained expanded nodes of a stopped tree, excluding the stop nodes, and let $cal(S)$ be its prefix-free set of lower stops. If $L_(upright("stop"))$ is its lower-bound value, then

#[#set math.equation(numbering: n => "(3.7)")
 $ L_(upright("stop")) - Y V_0 P_(upright(e)) \( r_0 \, B \) =  & sum_(d in cal(T)) \( - 1 \)^(omega \( d \)) \( N_d - mu_d \)\
 & + sum_(d in cal(S)) #scale(x: 120%, y: 120%)[\(] S_d \( b_d \) - mu_d P_(upright(e)) \( r_d \, b_d \) #scale(x: 120%, y: 120%)[\)] . $ <eq:stopped-comparison-identity>]

Here a node is identified by its decreasing tuple, equivalently by its squarefree product. To verify the identity, expand the full reference tree down to the same stops; at each stop its remaining subtree is exactly $mu_d P_(upright(e)) \( r_d \, b_d \)$. Thus a positive reference margin, a small sum of retained absolute errors, and an aggregate nonnegative stopped difference will prove Theorem 2.

== 4 Delay functions and the continuous path process <sec:functions>

We first analyze the continuous model in which a prime exponent is chosen with harmonic measure $d x \/ x$. The linear-sieve functions provide its benchmark, and their derivatives will convert harmonic path weights into probability weights. We then use regeneration to evaluate compact-endpoint sums at scale $B^(- 2)$ and to control their tails. These are the estimates needed to propagate the reference tree’s boundary discrepancy.

=== 4.1 Future integrals for the sieve functions <future-integrals-for-the-sieve-functions>

We use the classical lower and upper linear-sieve functions; see #cite(label("MontgomeryVaughanII")) Section 21.2.2. The future-integral and path representations needed below are developed here.

Write $A = 2 e^gamma$. Define the continuous delay functions $f \, F$ by

$ f \( s \) = 0 quad \( 0 lt.eq s lt.eq 2 \) \, #h(2em) s F \( s \) = A quad \( 1 lt.eq s lt.eq 3 \) \, $

and

$ \( s f \( s \) \)' = F \( s - 1 \) quad \( s > 2 \) \, #h(2em) \( s F \( s \) \)' = f \( s - 1 \) quad \( s > 3 \) . $

These prescriptions determine the functions successively on intervals of length one. We shall also use $F \( s \) = A \/ s$ on $0.95 lt.eq s < 1$. Only at a starting lower state, and when defining its derivative weight, we continue $f$ below $2$ by

#[#set math.equation(numbering: n => "(4.1)")
 $ f_(upright("ext")) \( s \) = frac(A log \( s - 1 \), s) #h(2em) \( 1.98 lt.eq s < 2 \) . $ <eq:functions-starting-extension>]

This is the same expression as the ordinary $f$ on $2 lt.eq s lt.eq 4$. An omitted lower child of ratio less than $2$ always has benchmark $f = 0$; the continuation (4.1) is not used at such a child.

Put $f_(upright(e)) = f$ and $f_(upright(o)) = F$. The continuous benchmark at a state of type $i$, gap $r$, and cutoff $b$ is $f_i \( r \/ b \) \/ b$. For fixed $r$, the delay equations give

#[#set math.equation(numbering: n => "(4.2)")
 $ frac(d, d b) (frac(f_i \( r \/ b \), b)) = - frac(f_(i') \( r \/ b - 1 \), b^2) \, $ <eq:functions-benchmark-cutoff>]

where $i'$ is the opposite type. On the right, the value at an omitted lower child is defined to be zero, including when its formal ratio is negative. On the ordinary ranges the identity holds for $r \/ b > 2$ at a lower state and $r \/ b > 1$ at an upper state. At an upper state the right side is zero when $r \/ b - 1 lt.eq 2$, exactly as required for an omitted lower child. Integrating with respect to the cutoff therefore gives the standard continuous tree recurrence above exponent $2$, with the boundary value at cutoff $2$ left to be specified. The explicit starting extensions satisfy the same identity in the interiors of their ranges, with one-sided derivatives at the endpoints; the extension of $f$ is used at the parent lower state, never at an omitted child.

The root lies at $r_0 \/ B = 2 - a_star.op \/ B + o \( B^(- 1) \)$, where the ordinary lower-sieve function vanishes. Its continued benchmark is

$ frac(f_(upright("ext")) \( r_0 \/ B \), B) = - a_star.op e^gamma B^(- 2) + o \( B^(- 2) \) \, $

since $f'_(upright("ext")) \( 2 \) = e^gamma$. Thus a positive reference margin must come from the finite boundary, after its discrepancy has been propagated through all larger exponents. To evaluate that contribution, we will use the positive derivative weights of $f \, F$ to normalize the harmonic transitions. The first step is to establish positivity and decay in a form that justifies this change of measure.

Let $rho$ be the Dickman function, determined by

$ rho \( u \) = 1 quad \( 0 lt.eq u lt.eq 1 \) \, #h(2em) u rho' \( u \) = - rho \( u - 1 \) quad \( u > 1 \) . $

For the unextended functions put

$ a \( s \) = 1 - f \( s \) quad \( s gt.eq 0 \) \, #h(2em) c \( s \) = F \( s \) - 1 quad \( s gt.eq 1 \) \, #h(2em) c_0 \( s \) = frac(A rho \( s - 1 \), s) quad \( s gt.eq 1 \) . $

#thm([Lemma 4.1.])[
  (Future integrals).  #emph[The functions $a \, c$ are positive and satisfy, with absolute comparison constants, 
#[#set math.equation(numbering: n => "(4.3)")
 $ a \( s \) + c \( s \) & = c_0 \( s \) \, & a \( s \) & asymp c_0 \( s \) \, & c \( s \) & asymp c_0 \( s \) #h(2em) \( s gt.eq 1 \) \,\
s a \( s \) & = integral_(s - 1)^oo c \( t \) thin d t &  & \( s gt.eq 2 \) \,\
s c \( s \) & = integral_(s - 1)^oo a \( t \) thin d t &  & \( s gt.eq 1 \) . $ <eq:functions-deficits>]

 For $u gt.eq 2$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ frac(1, 4 u^2) lt.eq frac(rho \( u \), rho \( u - 1 \)) lt.eq 1 / u . $ <eq:functions-dickman-ratio>]

 Moreover, for each fixed $lambda > 0$, there is $U_lambda$ such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ - frac(rho' \( u \), rho \( u \)) gt.eq lambda #h(2em) \( u gt.eq U_lambda \) . $ <eq:functions-dickman-logderivative>]

]
] <lem:future-integrals>

#proof[
  The delay equation gives the integral identity
  #[#set math.equation(numbering: n => "(4.6)")
   $ u rho \( u \) = integral_(u - 1)^u rho \( v \) thin d v #h(2em) \( u gt.eq 1 \) . $ <eq:functions-dickman-integral>]
  For example, both sides agree at $u = 1$, and their derivatives agree where the delay equation applies. The identity and the delay equation give positivity and monotonicity: a first zero of $rho$ would contradict the positive integral of its immediately preceding values. Monotonicity gives the upper bound in (4.4). Integrating first over the lower half of each of two unit intervals gives
  $ rho \( u \) gt.eq frac(rho \( u - 1 / 2 \), 2 u) gt.eq frac(rho \( u - 1 \), 4 u \( u - 1 / 2 \)) gt.eq frac(rho \( u - 1 \), 4 u^2) . $
  The upper ratio bound also shows that $rho$ tends to zero faster than any exponential.
  The negative logarithmic derivative is at least $1$. If it is at least $lambda$ on a tail, then, on a later tail,
  $ integral_(u - 1)^u rho \( v \) thin d v lt.eq rho \( u - 1 \) frac(1 - e^(- lambda), lambda) . $
  Equation (4.6) consequently improves the lower bound to $lambda \/ \( 1 - e^(- lambda) \)$. Iteration tends to infinity, since this map is strictly larger than its argument and has no finite positive fixed point. This proves (4.5).
  Directly from the delay equations and the initial conditions,
  #[#set math.equation(numbering: n => "(4.7)")
   $ F \( s \) - f \( s \) = c_0 \( s \) \, #h(2em) F \( s \) + f \( s \) = A omega_(upright("Bu")) \( s \) #h(2em) \( s gt.eq 1 \) . $ <eq:functions-gap-sum>]
  Here the continuous Buchstab function is determined by $s omega_(upright("Bu")) \( s \) = 1$ on $\[ 1 \, 2 \]$ and $\( s omega_(upright("Bu")) \( s \) \)' = omega_(upright("Bu")) \( s - 1 \)$ above $2$; its limit is stated in Section 2. For the first equality, the equation for $s \( F - f \)$ is the negative delay equation for $A rho \( s - 1 \)$; for the second, it is the Buchstab equation with initial value $A \/ s$. We next prove the individual positivity and future integrals; these do not follow merely by taking the difference in (4.7).
  To prove these properties, we use an auxiliary absorbing chain. This chain establishes positivity of the deficits; the harmonic-path chain will instead be defined from the derivative weights below. For $s gt.eq 2$, give the auxiliary chain transition density
  #[#set math.equation(numbering: n => "(4.8)")
   $ frac(c_0 \( t \), s c_0 \( s \)) thin upright(bold(1))_({ t gt.eq s - 1 }) thin d t \, $ <eq:functions-auxiliary-kernel>]
  and absorb it on reaching $\[ 1 \, 2 \)$. Its normalization is
  $ integral_(s - 1)^oo c_0 \( t \) thin d t = A integral_(s - 2)^oo frac(rho \( v \), v + 1) thin d v = A rho \( s - 1 \) = s c_0 \( s \) . $
  The integration at infinity is justified by the decay already proved. The excess of the next state above $s - 1$ has tail
  $ frac(rho \( s - 1 + h \), rho \( s - 1 \)) #h(2em) \( h gt.eq 0 \) . $
  For large $s$, (4.5) bounds this tail by $e^(- lambda h)$, with $lambda$ as large as desired. For $lambda > 1$, therefore,
  $ bb(E) \( e^(s_(upright("next"))) divides s \) lt.eq e^(s - 1) frac(lambda, lambda - 1) . $
  Taking $lambda = 2$ makes this a strict contraction of $V \( s \) = e^s$, with factor $2 \/ e < 1$, outside a fixed compact. Stopped drift implies almost sure return to that compact. From any state in the compact, successive draws in $\[ s - 1 \, s - 1 + 1 \/ 4 \]$ reach $\[ 1 \, 2 \)$ within a bounded number of steps, with probability bounded below independently of the initial state in the compact. The densities in these intervals have a positive compact lower bound. Repeating the attempt after each return proves almost sure absorption.
  Alternate labels $a \, c$ at every draw. At the terminal state $t$ assign fractions $1 \/ c_0 \( t \)$ and $1 - 1 \/ c_0 \( t \)$ to the two labels, respectively. Since $c_0 \( t \) = A \/ t$ on $\[ 1 \, 2 \)$, both terminal fractions lie in a fixed compact subinterval of $\( 0 \, 1 \)$. The expected terminal fraction, multiplied by $c_0 \( s \)$, defines positive functions $a^compose \( s \) \, c^compose \( s \)$ with
  $ a^compose + c^compose = c_0 \, #h(2em) a^compose \, c^compose asymp c_0 \, $
  and terminal values $a^compose = 1 \, med c^compose = c_0 - 1$ on $\[ 1 \, 2 \)$. The first-step equations give
  $ s a^compose \( s \) = integral_(s - 1)^oo c^compose \( t \) thin d t \, #h(2em) s c^compose \( s \) = integral_(s - 1)^oo a^compose \( t \) thin d t #h(2em) \( s gt.eq 2 \) . $
  In particular these functions are continuous from the right at $2$.
  Set $U = \( 2 + c^compose - a^compose \) \/ A$. The last two equations imply $\( s U \( s \) \)' = U \( s - 1 \)$ above $2$, in integrated form, while $s U \( s \) = 1$ on $\[ 1 \, 2 \)$. Also $U \( s \) arrow.r 2 \/ A = e^(- gamma)$, because $a^compose \, c^compose$ are bounded by $c_0$. There can be no jump at $2$ relative to the continuous Buchstab solution. Indeed, a jump $delta$ in $s U \( s \)$ there would give a difference $delta H \( s \)$, where $H \( s \) = 1 \/ s$ on $\[ 2 \, 3 \]$ and $\( s H \( s \) \)' = H \( s - 1 \)$ thereafter. The bound $H gt.eq 1 \/ 3$ on $\[ 2 \, 3 \]$ persists by induction: if it holds up to an integer $n gt.eq 3$, then for $n lt.eq s lt.eq n + 1$,
  $ s H \( s \) = n H \( n \) + integral_n^s H \( v - 1 \) thin d v gt.eq n \/ 3 + \( s - n \) \/ 3 . $
  For either sign of $delta eq.not 0$, this contradicts $U \( s \) - omega_(upright("Bu")) \( s \) arrow.r 0$, using the independently proved Buchstab limit in Lemma 42. Thus $U = omega_(upright("Bu"))$. Together with $a^compose + c^compose = c_0$ and (4.7), this identifies $a^compose = a \, med c^compose = c$, proving (4.3) and both future integrals for $s gt.eq 2$.
  Finally $c \( s \) = A \/ s - 1$ and $a = 1$ below $2$. The equation at $s = 2$ gives $integral_1^oo a = A - 2$; hence for $1 lt.eq s lt.eq 2$,
  $ integral_(s - 1)^oo a \( t \) thin d t = 2 - s + A - 2 = A - s = s c \( s \) . $
  This proves the remaining range of (4.3). ◻
]

=== 4.2 Derivative weights and change of measure <derivative-weights-and-change-of-measure>

The deficits are now positive and have the required decay. We use derivatives of the sieve functions to normalize the harmonic transitions of the standard tree.

Define

$ phi.alt_(upright(e)) \( s \) = s^2 f' \( s \) quad \( s gt.eq 2 \) \, #h(2em) phi.alt_(upright(o)) \( s \) = - s^2 F' \( s \) quad \( s gt.eq 0.95 \) . $

At $s = 2$ use the right derivative, and on $1.98 lt.eq s < 2$ use the derivative of (4.1). The state weight will be $phi.alt_i \( r \/ b \) \/ r^2$; its reciprocal at the endpoint is the factor that appears when we convert a probability estimate back to harmonic weight. For paths from the root, this gives the scale $B^(- 2)$ when the endpoint gap and ratio remain in fixed compact ranges. Put

$ W_0 \( t \) = frac(t + 1, t^2) \, #h(2em) m_(upright(e)) \( s \) = s - 1 \, #h(2em) m_(upright(o)) \( s \) = max \( 2 \, s - 1 \) . $

#thm([Lemma 4.2.])[
  (Derivative weights).  #emph[The derivative weights are positive and nonincreasing on their indicated ranges. If $i'$ denotes the type opposite to $i$, then 
#[#set math.equation(numbering: n => "(4.9)")
 $ phi.alt_i \( s \) = integral_(m_i \( s \))^oo W_0 \( t \) phi.alt_(i') \( t \) thin d t . $ <eq:functions-derivative-integrals>]

 This holds also on the specified starting extensions. On a tail, 
#[#set math.equation(numbering: n => "(4.10)")
 $ phi.alt_(upright(e)) \( s \) asymp rho \( s - 2 \) \, #h(2em) phi.alt_(upright(o)) \( s \) asymp rho \( s - 2 \) . $ <eq:functions-phi-dickman>]

 There are absolute constants $C \, q$ such that the absolute logarithmic derivatives, where they exist, and the ratios $phi.alt_(i') \( m_i \( s \) \) \/ phi.alt_i \( s \)$ are at most $C \( 1 + s \)^q$. In particular, for $u \, v lt.eq S$ in the indicated domain of the same weight, with $S gt.eq 3$, 
$ \| log phi.alt_i \( u \) - log phi.alt_i \( v \) \| lt.eq C \( 1 + S \)^q \| u - v \| . $

 For each fixed $lambda > 0$, the negative logarithmic derivatives of both weights are at least $lambda$ on a sufficiently remote tail.]
] <lem:derivative-weights>

#proof[
  On the ordinary ranges the delay equations give
  #[#set math.equation(numbering: n => "(4.11)")
   $ phi.alt_(upright(e)) \( s \) = s #scale(x: 120%, y: 120%)[\(] a \( s \) + c \( s - 1 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) phi.alt_(upright(o)) \( s \) = s #scale(x: 120%, y: 120%)[\(] c \( s \) + a \( s - 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:functions-phi-deficits>]
  The second expression uses $a = 1$ on $\[ 0 \, 1 \]$. On the extensions, the explicit formulas are
  $ phi.alt_(upright(e)) \( s \) = A (frac(s, s - 1) - log \( s - 1 \)) \, #h(2em) phi.alt_(upright(o)) \( s \) = A quad \( 0.95 lt.eq s lt.eq 3 \) . $
  These formulas and Lemma 7 prove positivity. Differentiation gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ phi.alt'_(upright(e)) \( s \) & = - frac(s, \( s - 1 \)^2) phi.alt_(upright(o)) \( s - 1 \) &  & \( s gt.eq 1.98 \) \,\
phi.alt'_(upright(o)) \( s \) & = - frac(s, \( s - 1 \)^2) phi.alt_(upright(e)) \( s - 1 \) &  & \( s > 3 \) \, $ <eq:functions-phi-e-derivative>]
  at points of differentiability; the odd weight is constant below $3$. Equation (4.11) and (4.3) give (4.10), and in particular both weights vanish at infinity. Integrating (4.12) and (4.12) backwards from infinity gives (4.9). For the even extension, the lower endpoint lies below $1$, where the explicitly constant odd weight gives exactly the displayed continuation. For odd $s lt.eq 3$, the lower endpoint is $2$, so the integral is constant, as required.
  On a tail, (4.4) and (4.10) give
  $ frac(phi.alt_(i') \( s - 1 \), phi.alt_i \( s \)) = O \( s^2 \) . $
  The derivative formulas then bound the absolute logarithmic derivatives by a polynomial (in fact $O \( s \)$ on a tail). On the remaining compact ranges the explicit positive functions and their piecewise derivatives give fixed bounds. The weights are locally absolutely continuous by (4.9); integrating the logarithmic derivative gives the stated Lipschitz bound. Finally the same comparison gives a positive constant times
  $ frac(rho \( s - 3 \), s rho \( s - 2 \)) = frac(s - 2, s) (- frac(rho' \( s - 2 \), rho \( s - 2 \))) $
  as a lower bound for either negative logarithmic derivative on a tail. Apply (4.5). ◻
]

A #emph[standard] path replaces the admission condition (3.3) by $r - x gt.eq 2 x$ at an upper node. Thus it contains every path in the original tree, and the two rules agree for $x gt.eq 2$. At a state of type $i$, gap $r$, cutoff $b$, and ratio $s = r \/ b$, make a draw $t$ with probability density

#[#set math.equation(numbering: n => "(4.13)")
 $ K_i \( s \, d t \) = frac(W_0 \( t \) phi.alt_(i') \( t \), phi.alt_i \( s \)) upright(bold(1))_({ t gt.eq m_i \( s \) }) thin d t . $ <eq:tilted-kernel>]

Lemma 8 proves that this is a probability kernel. The next exponent, gap, and ratio are

$ x = frac(r, t + 1) \, #h(2em) r' = frac(r t, t + 1) \, #h(2em) s' = t . $

The lower support endpoint ensures $x lt.eq b$, and the upper-to-lower transition also satisfies $s' gt.eq 2$. Put $g \( t \) = log \( 1 + 1 \/ t \)$, so $r' = r e^(- g \( t \))$.

The harmonic transition $d x \/ x$, after reversing orientation in $t = r \/ x - 1$, is $d t \/ \( t + 1 \)$. Dividing this by (4.13) gives

$ frac(t^2, \( t + 1 \)^2) frac(phi.alt_i \( s \), phi.alt_(i') \( t \)) = (r' / r)^2 frac(phi.alt_i \( s \), phi.alt_(i') \( t \)) . $

Consequently, for every finite prefix,

#[#set math.equation(numbering: n => "(4.14)")
 $ upright("original harmonic weight") = upright("probability weight") thin (r_(upright("end")) / r_(upright("in")))^2 frac(phi.alt_(i_(upright("in"))) \( s_(upright("in")) \), phi.alt_(i_(upright("end"))) \( s_(upright("end")) \)) . $ <eq:path-weight>]

For a nonempty prefix its last exponent is $x = r_(upright("end")) \/ s_(upright("end"))$. Since successive cutoffs are nonincreasing, restriction of all exponents to $x > ell$ is equivalent to the single arrival condition

#[#set math.equation(numbering: n => "(4.15)")
 $ s_(upright("end")) < r_(upright("end")) \/ ell . $ <eq:functions-arrival-cutoff>]

In the rest of this section, starts are of even type with

#[#set math.equation(numbering: n => "(4.16)")
 $ s_(upright("in")) in \[ 1.99 \, 2.3 \] . $ <eq:functions-start-range>]

Let $\( i_n \, s_n \)$ be the resulting infinite sequence, $n = 0 \, 1 \, dots.h$, and put

$ T_0 = 0 \, #h(2em) T_n = sum_(j = 1)^n g \( s_j \) \, #h(2em) r_n = r_(upright("in")) e^(- T_n) \, #h(2em) x_n = r_n \/ s_n quad \( n gt.eq 1 \) . $

After two steps the state spaces are ${ upright(e) } times \[ 2 \, oo \)$ and ${ upright(o) } times \[ 1 \, oo \)$. Only the first odd state can lie below $1$.

=== 4.3 Regeneration and invariant occupation <regeneration-and-invariant-occupation>

Call an odd state with $s lt.eq 3$ a regenerating state; regeneration is viewed as occurring just before its next draw. Its outgoing law is independent of $s$, since $phi.alt_(upright(o)) \( s \) = A$ and $m_(upright(o)) \( s \) = 2$.

#thm([Lemma 4.3.])[
  (Regeneration).  #emph[The time to first regeneration has an exponential moment uniformly over (4.16). The cycles strictly after one regeneration through the next inclusive are iid. Their lengths $tau$ have a finite exponential moment. Their total log decrements 
$ G = sum_(j = 1)^tau g \( s_j \) $

 are positive, nonarithmetic, and have a finite exponential moment for some positive parameter. In particular $0 < bb(E) G < oo$. Each complete cycle satisfies $G gt.eq g \( 3 \) = log \( 4 \/ 3 \)$.]
] <lem:regeneration>

#proof[
  For sufficiently large current $s$, the excess of the next state over $s - 1$ has tail
  $ bb(P) \( s_(upright("next")) gt.eq s - 1 + h divides i \, s \) = frac(phi.alt_i \( s + h \), phi.alt_i \( s \)) #h(2em) \( h gt.eq 0 \) . $
  Here the support minimum is $s - 1$ for either type, and the identity follows from (4.9). Lemma 8 makes this tail at most $e^(- lambda h)$, with any fixed large $lambda$, outside a sufficiently large compact. Thus $V \( i \, s \) = e^s$ satisfies
  $ bb(E) \( V \( i_(upright("next")) \, s_(upright("next")) \) divides i \, s \) lt.eq kappa V \( i \, s \) + C \, #h(2em) kappa < 1 \, $
  and the constant term can be omitted outside a larger compact. On the compact, finiteness and uniform boundedness of the expectation follow from the superexponential tails of the weights.
  Choose a compact set $C_0$ and $alpha > 1$ such that $bb(E) \( V_(upright("next")) divides i \, s \) lt.eq V \( i \, s \) \/ alpha$ outside $C_0$. Stopping the nonnegative supermartingale $alpha^(n and sigma) V \( i_(n and sigma) \, s_(n and sigma) \)$, where $sigma$ is the first entrance to $C_0$, gives
  $ bb(E)_(i \, s) alpha^sigma lt.eq V \( i \, s \) $
  for starts outside $C_0$, by Fatou’s lemma. In particular the entrance time is almost surely finite.
  From $C_0$ there are an integer $m$ and a probability $p > 0$ such that regeneration is reached within $m$ steps with probability at least $p$, uniformly in the starting state. To see this, whenever $s > 3$ choose the next state in the interval of width $1 \/ 4$ immediately above its support minimum; this lowers the state by at least $3 \/ 4$. An even state with $s lt.eq 3$ then draws into the regenerating odd range on the same choice. All prescribed intervals lie in a fixed compact and have uniformly positive transition probabilities.
  Run such an $m$-step attempt, and on failure wait for the next entrance to $C_0$ before retrying. Let $D$ be the duration of one failed attempt together with this return. The stopped estimate and the uniform bound on the $V$-moment after the $m$ attempted steps show that, for some $alpha_1 > 1$,
  $ sup_(\( i \, s \) in C_0) bb(E)_(i \, s) \[ alpha_1^D upright(bold(1))_({ upright("failure") }) \] < oo . $
  For $0 < theta < 1$, Hölder’s inequality bounds the same expression with $alpha_1^theta$ by
  $ (sup_(C_0) bb(E) \[ alpha_1^D upright(bold(1))_({ upright("failure") }) \])^theta \( 1 - p \)^(1 - theta) . $
  For sufficiently small $theta > 0$ this is less than $1$. Summing over successive failed attempts proves an exponential moment for the hitting time of regeneration from $C_0$, and then from (4.16). The same reasoning applies to a return after a regenerating start: its outgoing common draw has a bounded $V$-moment.
  The common outgoing law proves independence and identical distribution of the complete cycles. During a cycle all odd states are at least $1$, and all even states are at least $2$, so each $g \( s_j \) lt.eq log 2$. Thus the exponential moment of $tau$ supplies an exponential moment of $G$ for a sufficiently small parameter. The terminal odd state lies in $\[ 1 \, 3 \]$, so its last decrement alone is at least $g \( 3 \) > 0$.
  For nonarithmeticity, consider a two-step return whose even state $t$ lies in a fixed subinterval of $\( 2 \, 3 \)$ and whose next odd state $u$ lies strictly between $t - 1$ and $3$. There is a two-dimensional region of such pairs on which the joint density is positive. On that region $G = g \( t \) + g \( u \)$ varies continuously and has a nonzero derivative in $u$. Its distribution therefore has a nonzero absolutely continuous component, and cannot be supported on an arithmetic lattice. ◻
]

#thm([Lemma 4.4.])[
  (Invariant densities and cycle occupation).  #emph[On the ordinary even and odd state spaces, respectively, the finite raw invariant densities are 
#[#set math.equation(numbering: n => "(4.17)")
 $ pi_(upright(e)) \( s \) = phi.alt_(upright(e)) \( s \) quad \( s gt.eq 2 \) \, #h(2em) pi_(upright(o)) \( s \) = \( 1 - s^(- 2) \) phi.alt_(upright(o)) \( s \) quad \( s gt.eq 1 \) . $ <eq:functions-invariant-densities>]

 Put 
$ beta = integral_1^3 pi_(upright(o)) \( s \) thin d s = frac(4 A, 3) . $

 For every nonnegative measurable state function $Q$, 
#[#set math.equation(numbering: n => "(4.18)")
 $ bb(E) sum_(j = 1)^tau Q \( i_j \, s_j \) = 1 / beta sum_i integral Q \( i \, s \) pi_i \( s \) thin d s . $ <eq:functions-cycle-occupation>]

 In particular, if 
$ M_g = sum_i integral pi_i \( s \) g \( s \) thin d s \, $

 then $bb(E) G = M_g \/ beta$, and 
#[#set math.equation(numbering: n => "(4.19)")
 $ 0 < M_g lt.eq 4 e^gamma . $ <eq:mg-bound>]

]
] <lem:invariant>

#proof[
  For a new even state $t gt.eq 2$, cancellation of the old derivative weight in the incoming integral gives
  $ integral_1^(t + 1) \( 1 - s^(- 2) \) thin d s = frac(t^2, t + 1) . $
  Multiplication by $W_0 \( t \) phi.alt_(upright(e)) \( t \)$ yields $pi_(upright(e)) \( t \)$. For a new odd state $t gt.eq 1$, the corresponding integral is $integral_2^(t + 1) d s = t - 1$, which yields $\( 1 - t^(- 2) \) phi.alt_(upright(o)) \( t \)$. These identities prove invariance. Finiteness follows from (4.10). On $\[ 1 \, 3 \]$, $phi.alt_(upright(o)) = A$, so $beta = A \[ s + s^(- 1) \]_1^3 = 4 A \/ 3$.
  For completeness, normalize the raw measure to a stationary probability measure $mu = pi \/ M$, where $M = sum_i integral pi_i$. Start the chain with law $mu$. For a bounded measurable state function $Q$, partition $Q \( i_n \, s_n \)$ according to the last regenerating time strictly before $n$. If it is $n - k$, $1 lt.eq k lt.eq n$, the common outgoing law shows that this term has expectation
  $ mu \( upright("regenerating states") \) thin bb(E) \[ Q \( i_k \, s_k \) upright(bold(1))_({ tau gt.eq k }) \] \, $
  where the expectation on the right starts just after a regeneration. The remaining event is that there was no regenerating time among $0 \, dots.h \, n - 1$; its probability tends to zero by Lemma 9 and dominated convergence over $mu$. Stationarity and then $n arrow.r oo$ give
  $ mu \( Q \) = beta / M bb(E) sum_(j = 1)^tau Q \( i_j \, s_j \) . $
  This proves (4.18) for bounded nonnegative $Q$, and truncation proves it in general. The argument does not require an aperiodic discrete-time chain; the alternating types cause no difficulty.
  Since $g \( s \) lt.eq 1 \/ s$, (4.11) gives
  $ M_g lt.eq integral_2^oo a \( s \) thin d s + 2 integral_1^oo c \( s \) thin d s + integral_0^oo a \( s \) thin d s . $
  The future integrals at $s = 2$ give $integral_1^oo c = 2$ and $integral_1^oo a = A - 2$. As $a = 1$ on $\[ 0 \, 2 \]$, the three displayed contributions are $A - 3 \, med 4 \, med A - 1$. Their sum is $2 A = 4 e^gamma$. Strict positivity is immediate from the positive even density and $g > 0$. Taking $Q \( i \, s \) = g \( s \)$ in (4.18) identifies $bb(E) G$. ◻
]

=== 4.4 Renewal limits and uniform band estimates <renewal-limits-and-uniform-band-estimates>

We use tests in the log-gap coordinate $u = log r$. An admissible compact test $F_i \( u \, s \)$ is bounded and continuous on the extended state ranges, with support in a fixed compact rectangle in $\( u \, s \)$. We also permit multiplication by indicators of fixed intervals in $u$ or $s$, and by $upright(bold(1))_({ s < e^u \/ ell })$, where $ell = 1$ or $2$. At the lower state endpoints one may first make a continuous one-sided extension to the extended range and then apply the indicator. Finite linear combinations of these tests are permitted. In particular, a continuous bounded test supported in a compact positive $r$-window and restricted by $s < r \/ ell$ is covered: the restriction itself bounds $s$.

#thm([Proposition 4.5.])[
  (Compact occupation limit).  #emph[For an admissible compact test and starts satisfying (4.16), 
#[#set math.equation(numbering: n => "(4.20)")
 $ lim_(v arrow.r oo) bb(E)_(s_(upright("in"))) sum_(n gt.eq 0) F_(i_n) \( v - T_n \, s_n \) = 1 / M_g sum_i integral_(bb(R)) integral F_i \( u \, s \) pi_i \( s \) thin d s thin d u . $ <eq:functions-occupation-limit>]

 The convergence is uniform in $s_(upright("in")) in \[ 1.99 \, 2.3 \]$. The state integrals on the right use the ordinary invariant ranges in (4.17).]
] <prop:occupation>

#proof[
  First start immediately before the outgoing draw of a regeneration, and exclude that starting state from the sum. Write a complete cycle as $\( i_j \, s_j \)_(1 lt.eq j lt.eq tau)$, and set $S_j = sum_(k = 1)^j g \( s_k \)$ within the cycle. Its response to the test is
  #[#set math.equation(numbering: n => "(4.21)")
   $ H_0 \( v \) = bb(E) sum_(j = 1)^tau F_(i_j) \( v - S_j \, s_j \) . $ <eq:functions-cycle-test>]
  If the log-gap support of the test is contained in $\[ a \, b \]$, then $H_0 \( v \) = 0$ for $v < a$, since $S_j gt.eq 0$. Also $S_j lt.eq j log 2$, so for $v > b$,
  $ \| H_0 \( v \) \| lt.eq parallel F parallel_oo bb(E) #h(-0.16667em) [tau thin upright(bold(1))_({ tau gt.eq \( v - b \) \/ log 2 })] . $
  The exponential moment in Lemma 9 gives an exponentially decreasing upper bound as $v arrow.r oo$.
  The function $H_0$ is continuous, including for the permitted indicator tests. To verify this, condition on the history before the $j$-th draw and on the event $j lt.eq tau$, which is determined before that draw. The next state $t = s_j$ has a density. Writing $D = e^(v - S_(j - 1)) > 0$, its gap is
  $ e^(v - S_j) = frac(D t, t + 1) . $
  Equality at a fixed positive gap edge therefore specifies at most one value of $t$; equality at a fixed state edge does likewise. For the arrival boundary,
  $ t = e^(v - S_j) \/ ell quad arrow.l.r.double quad t + 1 = D \/ ell . $
  Thus each boundary has conditional probability zero. For any fixed number of cycle steps dominated convergence gives continuity. The remaining steps are uniformly bounded in expectation by $parallel F parallel_oo bb(E) \[ tau upright(bold(1))_({ tau > N }) \]$, which tends to zero. This proves continuity of $H_0$. Continuity, the vanishing left tail, and the exponential right envelope show that $H_0$ is directly Riemann integrable.
  Let $U_G$ be the renewal measure of successive complete-cycle decrements, including the boundary at zero:
  $ U_G = sum_(k gt.eq 0) cal(L) \( G_1 + dots.h.c + G_k \) . $
  The expectation of the complete future test from a regeneration is
  #[#set math.equation(numbering: n => "(4.22)")
   $ R_F \( v \) = integral_(\[ 0 \, oo \)) H_0 \( v - y \) thin U_G \( d y \) . $ <eq:functions-renewal-convolution>]
  By Lemma 9, $G$ is nonarithmetic and has finite positive mean. The key renewal theorem (2.4) therefore gives
  $ R_F \( v \) arrow.r frac(1, bb(E) G) integral_(bb(R)) H_0 \( u \) thin d u . $
  Fubini is justified by the bounded test, its compact log-gap support, and $bb(E) tau < oo$. Translating the log-gap integral within each cycle and applying (4.18) gives
  $ integral_(bb(R)) H_0 \( u \) thin d u = bb(E) sum_(j = 1)^tau integral_(bb(R)) F_(i_j) \( u \, s_j \) thin d u = 1 / beta sum_i integral #h(-0.16667em) #h(-0.16667em) integral F_i \( u \, s \) pi_i \( s \) thin d s thin d u . $
  Since $bb(E) G = M_g \/ beta$, this is the limit in (4.20).
  We record a boundedness fact needed to restore the initial segment. Every complete cycle has decrement at least $g \( 3 \) > 0$. Consequently any interval of fixed length contains a bounded number of cycle boundaries on each sample path, and
  #[#set math.equation(numbering: n => "(4.23)")
   $ sup_(y in bb(R)) U_G \( \[ y \, y + h \] \) lt.eq 1 + ⌊frac(h, g \( 3 \))⌋ #h(2em) \( h > 0 \) . $ <eq:functions-renewal-band>]
  The compact bound and the exponential envelope for $H_0$, summed over unit intervals, show from (4.22) that $sup_v \| R_F \( v \) \| < oo$.
  Now let $tau_0$ be the first regenerating time from an allowed even start, and $D_0 = T_(tau_0)$. All initial per-step decrements are bounded by $c_(*) = log \( 1 + 1 \/ 0.98 \)$. Lemma 9 gives a uniform exponential moment for $tau_0$, hence a uniformly tight, indeed exponentially bounded, family of $D_0$’s. The portion of the test through time $tau_0$ tends to zero uniformly as $v arrow.r oo$: a contribution requires $c_(*) tau_0 gt.eq v - b$, and its absolute size is at most $parallel F parallel_oo \( tau_0 + 1 \)$. Conditional on the initial history, the future after that state has expectation $R_F \( v - D_0 \)$. It is the same function $R_F$ for every history, because the outgoing regenerating law is common. For a fixed $M$, convergence of $R_F \( y \)$ as $y arrow.r oo$ is uniform over $y = v - d \, med 0 lt.eq d lt.eq M$. Uniform tightness of $D_0$ and boundedness of $R_F$ then give the claimed uniform limit. ◻
]

#thm([Lemma 4.6.])[
  (Uniform band bounds).  #emph[For every fixed $h > 0$ there is $C_h < oo$ with the following properties. For any nonnegative measurable state function $Q$ and any $v in bb(R)$, a regenerating start satisfies 
#[#set math.equation(numbering: n => "(4.24)")
 $ bb(E) sum_(n gt.eq 1) Q \( i_n \, s_n \) upright(bold(1))_({ T_n in \[ v \, v + h \] }) lt.eq C_h sum_i integral Q \( i \, s \) pi_i \( s \) thin d s . $ <eq:functions-band-from-regeneration>]

 From an even start in (4.16), the same bound holds for the sum over $n gt.eq 2$, uniformly in the starting ratio. The density of the first odd state is at most 
$ C thin upright(bold(1))_({ s gt.eq 0.98 }) phi.alt_(upright(o)) \( s \) . $

 In particular, uniformly in $r_(upright("in")) > 0$, $R > 0$, and $ell in { 1 \, 2 }$, 
#[#set math.equation(numbering: n => "(4.25)")
 $ bb(E) sum_(n gt.eq 1) frac(upright(bold(1))_({ R lt.eq r_n lt.eq e R \, med s_n < r_n \/ ell }), phi.alt_(i_n) \( s_n \)) lt.double R + 1 . $ <eq:functions-inverse-phi-band>]

 Including the starting state in the last sum changes its bound by at most an absolute constant.]
] <lem:band-bounds>

#proof[
  For a regenerating start, condition on the internal states and decrements of one fresh cycle. Its beginning is a renewal boundary independent of that cycle. Tonelli’s theorem gives
  $ bb(E) sum_(n gt.eq 1) Q \( i_n \, s_n \) upright(bold(1))_({ T_n in \[ v \, v + h \] }) = bb(E) sum_(j = 1)^tau Q \( i_j \, s_j \) U_G \( \[ v - S_j \, v + h - S_j \] \) . $
  Apply (4.23) and then (4.18). This argument permits arbitrary nonnegative $Q$: it never assumes independence of a state’s value and its internal decrement.
  We next compare the initial even start to regeneration. If its ratio is $s_0$, the density after two draws, on $t gt.eq 2$, is
  #[#set math.equation(numbering: n => "(4.26)")
   $ p_(s_0 \, 2) \( t \) = frac(W_0 \( t \) phi.alt_(upright(e)) \( t \), phi.alt_(upright(e)) \( s_0 \)) integral_(s_0 - 1)^(t + 1) W_0 \( u \) thin d u . $ <eq:functions-two-step-density>]
  Starting at regeneration, the density after three draws is
  #[#set math.equation(numbering: n => "(4.27)")
   $ p_(upright("reg") \, 3) \( t \) = frac(W_0 \( t \) phi.alt_(upright(e)) \( t \), A) integral_1^(t + 1) W_0 \( u \) integral_2^(u + 1) W_0 \( y \) thin d y thin d u #h(2em) \( t gt.eq 2 \) . $ <eq:functions-three-step-density>]
  These formulas follow by canceling the intermediate derivative weights in the successive kernels. For $u gt.eq 2$, the inner integral in (4.27) is at least $integral_2^3 W_0 \( y \) thin d y > 0$. Since $t + 1 gt.eq 3$, it follows that
  $ integral_1^(t + 1) W_0 \( u \) integral_2^(u + 1) W_0 \( y \) thin d y thin d u gt.double integral_2^(t + 1) W_0 \( u \) thin d u gt.double integral_(s_0 - 1)^(t + 1) W_0 \( u \) thin d u \, $
  uniformly for $s_0 in \[ 1.99 \, 2.3 \]$. The last comparison uses the bounded integral over $\[ 0.99 \, 2 \]$ and the positive lower bound for $integral_2^(t + 1) W_0$. The starting denominator $phi.alt_(upright(e)) \( s_0 \)$ also has a positive compact lower bound. Thus
  #[#set math.equation(numbering: n => "(4.28)")
   $ p_(s_0 \, 2) \( t \) lt.eq C p_(upright("reg") \, 3) \( t \) #h(2em) \( t gt.eq 2 \) . $ <eq:functions-initial-density-domination>]
  To use this marginal comparison, the correlated elapsed decrement must be removed explicitly. Let $I = \[ v \, v + h \]$, $C_2 = 2 c_(*)$, and $C_3 = 3 log 2$. The initial two decrements sum to at most $C_2$, so an event in $I$ at time $n gt.eq 2$ has, measured from state $2$, a future decrement in
  $ I_2 = \[ v - C_2 \, v + h \] . $
  Condition on that state, discard the initial decrement by this enlargement, and apply (4.28). For a path started at regeneration, its first three decrements sum to at most $C_3$; a future decrement in $I_2$ measured from state $3$ therefore gives a total decrement in
  $ \[ v - C_2 \, v + h + C_3 \] . $
  The resulting expectation is bounded by a constant times the regenerating occupation sum in this enlarged band, which is covered by (4.24). This proves the bound from even starts, including their state at time $2$, without imposing independence on the initial state and elapsed decrement.
  At step $1$, the density is
  $ frac(W_0 \( s \) phi.alt_(upright(o)) \( s \), phi.alt_(upright(e)) \( s_0 \)) upright(bold(1))_({ s gt.eq s_0 - 1 }) . $
  Both $W_0 \( s \)$ for $s gt.eq 0.99$ and $1 \/ phi.alt_(upright(e)) \( s_0 \)$ on the allowed starts are bounded. This proves the asserted first-step estimate.
  The condition $R lt.eq r_n lt.eq e R$ is a band of length $1$ in $T_n$. For $n gt.eq 2$, use the preceding result with
  $ Q \( i \, s \) = frac(upright(bold(1))_({ s < e R \/ ell }), phi.alt_i \( s \)) . $
  The ratios of invariant to derivative densities are $1$ for the even states and $1 - s^(- 2) lt.eq 1$ for the odd states. Their integrals up to $e R \/ ell$ are $O \( R + 1 \)$. The first-step density gives the same bound by direct integration. Finally $phi.alt_(upright(e)) \( s_0 \)$ has a positive compact lower bound, so the starting state’s possible contribution is $O \( 1 \)$. ◻
]

#prodef([Remark 4.7.])[
  Two consequences explain the later weight scales. At an arrival with $x_n > ell$ and $r_n lt.eq K$, (4.15) confines the state to a fixed compact with a positive lower endpoint. Hence $r_n^2 \/ phi.alt_(i_n) \( s_n \)$ is bounded. Moreover, each such transition decreases the gap by more than $ell$; there are only $O_K \( 1 \)$ such compact arrivals on one path. Formula (4.14) therefore bounds the total original harmonic weight of compact prefixes by $O_K \( r_(upright("in"))^(- 2) \)$. If the counted prefixes can occur only on an event $cal(A)$ of the tilted path, the bound is $O_K \( r_(upright("in"))^(- 2) \) bb(P) \( cal(A) \)$.
  Retain the restriction $x_n > ell$, equivalently $s_n < r_n \/ ell$, in the following tail estimate. After multiplication by $r_(upright("in"))^2 \/ phi.alt_(upright(e)) \( s_(upright("in")) \)$, a reward $e^(- c r)$ in original harmonic weight is $r^2 e^(- c r) \/ phi.alt_i \( s \)$ in tilted weight. Summing (4.25) over the bands $\[ R \, e R \]$, $R gt.eq K$, gives a convergent upper bound whose tail tends to zero as $K arrow.r oo$, uniformly in the allowed starts. These statements also cover a fixed bounded factor in the reward.
] <rem:functions-compact-weight>

=== 4.5 Visits in a prescribed even-state window <visits-in-a-prescribed-even-state-window>

#thm([Lemma 4.8.])[
  (Marked visits).  #emph[Fix $b_0 > 0$ and $epsilon > 0$. There is a constant $C_epsilon > 10$, independent of $b_0$, such that, whenever $b_1 gt.eq C_epsilon b_0$ is fixed, the following event has probability at least $1 - epsilon - o \( 1 \)$ as $r_(upright("in")) arrow.r oo$, uniformly in (4.16). At a regenerating odd state with pre-draw gap in $\[ 10 b_0 \, b_1 \]$, the next draw is an even arrival satisfying 
$ s in \[ 2.08 \, 2.14 \] \, #h(2em) x in \[ 2 b_0 \, b_1 \/ 2 \] . $

 The proof yields the smaller ratio interval $\[ 2.09 \, 2.13 \]$; thus the stated ratio window has positive slack. The arriving gap exceeds $6 b_0$, so, if $6 b_0 > K$, such a visit precedes every subsequent arrival of gap at most $K$.]
] <lem:marked-visits>

#proof[
  Mark a complete regeneration cycle if its first draw lies in $\[ 2.09 \, 2.13 \]$. The common outgoing kernel gives a fixed probability
  $ p = 1 / A integral_2.09^2.13 W_0 \( t \) phi.alt_(upright(e)) \( t \) thin d t in \( 0 \, 1 \) . $
  The complete cycle objects, consisting of their state sequences and their decrements, are iid. Consequently the spacings $W$ between successive marked cycle beginnings are iid: each consists of one cycle conditioned on being marked, followed by a geometric number of cycles conditioned on being unmarked. More explicitly, the number $N$ of intervening unmarked cycles has $bb(P) \( N = m \) = \( 1 - p \)^m p$, $m gt.eq 0$; conditional on these marks, the cycle objects are independent with their respective conditional laws. The next marked cycle is excluded from the preceding spacing and begins the next such block. This proves independence of the spacings, even though a mark depends on its own cycle. It also gives
  $ bb(E) W = bb(E) \( G divides upright("marked") \) + frac(1 - p, p) bb(E) \( G divides upright("unmarked") \) = frac(bb(E) G, p) < oo . $
  Furthermore $W gt.eq g \( 3 \) > 0$.
  From an allowed initial start, the delay $D$ to the first marked beginning consists of the initial segment to regeneration and a geometric number of unmarked complete cycles. The first segment has uniformly bounded mean by Lemma 9; the latter sum has finite mean by the preceding conditional-cycle description. Thus $D$ is uniformly tight over the allowed initial states. The spacings after that beginning are independent of the delay.
  We give the required wide-interval bound using only $bb(E) W < oo$. Let $U_W$ be the renewal measure for the marked spacings, with an initial renewal at zero. The lower bound on $W$ gives a uniform bound $C$ for its mass in any interval of length one. For $q gt.eq 0$, if there is no marked renewal in $\[ q \, q + H \]$, some renewal at or before $q$ has its next spacing overshoot $q + H$. Independence of a renewal time and its next spacing therefore gives
  $ bb(P) \( upright("no renewal in ") \[ q \, q + H \] \) lt.eq integral_(\[ 0 \, q \]) bb(P) \( W > q + H - t \) thin U_W \( d t \) lt.eq C sum_(j gt.eq 0) bb(P) \( W > H + j \) . $
  Changing one endpoint in the unit-interval partition only changes the harmless absolute constant or shifts $H$ by $1$. The last quantity tends to zero as $H arrow.r oo$, since $W$ has finite mean. It is uniform in $q$. For the delayed process, condition on $D lt.eq v$ and apply the same bound with $q = v - D$. The additional error $bb(P) \( D > v \)$ tends uniformly to zero as $v arrow.r oo$.
  Apply this with
  $ v = log \( r_(upright("in")) \/ b_1 \) \, #h(2em) H = log #scale(x: 120%, y: 120%)[\(] b_1 \/ \( 10 b_0 \) #scale(x: 120%, y: 120%)[\)] . $
  Choose $H$ sufficiently large in terms of $epsilon$, equivalently choose $b_1 \/ b_0$ sufficiently large, and then let $r_(upright("in")) arrow.r oo$. A marked beginning in this log-decrement interval has pre-draw gap $r in \[ 10 b_0 \, b_1 \]$. For its marked draw $t in \[ 2.09 \, 2.13 \]$,
  $ frac(10 b_0, 3.13) lt.eq x = frac(r, t + 1) lt.eq b_1 / 3.09 . $
  This lies inside $\[ 2 b_0 \, b_1 \/ 2 \]$, and the arriving ratio is $t$. The new gap satisfies
  $ r' = frac(r t, t + 1) gt.eq 10 b_0 2.09 / 3.09 > 6 b_0 . $
  Gaps strictly decrease along the path, so the last assertion follows. ◻
]

== 5 Passage from harmonic paths to primes <sec:prime-paths>

We now transfer the path estimates to actual primes. Throughout this section, a #emph[standard prime path] starts at a lower state with cutoff $B$ and gap $r_(upright("st")) = s_(upright("st")) B$, where $s_(upright("st")) in \[ 1.99 \, 2.3 \]$. Its primes decrease strictly after the first step. At the first step the upper endpoint is included; all subsequent upper endpoints are excluded. The next exponent is required to exceed $ell$, where $ell in { 1 \, 2 }$. A lower state includes every available child, and an upper state includes precisely the children for which $r - x gt.eq 2 x$. Thus these paths contain the paths admitted by (3.3), and agree with them above exponent $2$.

For a prefix $frak(p) = \( p_1 \, dots.h \, p_m \)$ write

$ h \( frak(p) \) = product_(j = 1)^m 1 / p_j \, #h(2em) r \( frak(p) \) = r_(upright("st")) - sum_(j = 1)^m x \( p_j \) \, #h(2em) s \( frak(p) \) = frac(r \( frak(p) \), x \( p_m \)) . $

The empty prefix has weight $1$. Sums over prefixes below include all allowed lengths, and therefore count a path once at each of its visited states. At a nonempty prefix, $x \( p_m \) > ell$ is equivalent to $s \( frak(p) \) < r \( frak(p) \) \/ ell$.

We use the elementary consequences of (1.2)

#[#set math.equation(numbering: n => "(5.1)")
 $ log w tilde.op log B \, #h(2em) S = \( log B \)^2 \, #h(2em) N = O \( S log B \) = O \( \( log B \)^3 \) . $ <eq:prime-scales>]

In particular, every fixed power of $S$ and $N$ is smaller than $exp \( c sqrt(log w) \)$ for every fixed $c > 0$, eventually.

#thm([Lemma 5.1.])[
  (Harmonic prime measure).  #emph[There are absolute positive constants $C \, c$ such that, on any exponent interval with lower endpoint $u gt.eq 1 \/ 2$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(x \( p \) med upright(i n med t h e med i n t e r v a l)) 1 / p = integral_(upright("interval")) frac(d x, x) + O \( E \( u \) \) \, #h(2em) E \( u \) = C exp \( - c sqrt(u log w) \) . $ <eq:prime-harmonic>]

 The error is uniform in the upper endpoint and in either endpoint convention. In particular, the total weight of all decreasing prime prefixes with exponents in $\( ell \, B \]$, with no admission restrictions, is $O \( B \)$.]
] <lem:prime-harmonic>

#proof[
  Apply partial summation to the prime number theorem in Lemma 4, between $w^u$ and the upper endpoint. The main term is $integral d t \/ \( t log t \) = integral d x \/ x$. The integrated error, including its lower-endpoint term, is bounded by a constant times $exp \( - c sqrt(log \( w^u \)) \)$, after reducing $c$. The bound remains valid if the upper endpoint is sent to infinity in the error integral. A change of endpoint convention contributes at most one reciprocal prime, which is absorbed by $E \( u \)$. Finally,
  $ sum_(frak(p)) h \( frak(p) \) = product_(w^ell < p lt.eq w^B) \( 1 + 1 \/ p \) lt.eq exp (sum_(w^ell < p lt.eq w^B) 1 / p) lt.double B . $
  Deleting an endpoint prime or imposing admission restrictions can only decrease this sum. ◻
]

#thm([Lemma 5.2.])[
  (Removal of high states).  #emph[Fix $K > 0$ and $A > 0$. The total original harmonic weight of prefixes ending at gap at most $K$ and having some earlier or terminal ratio greater than $S$ is $O_(K \, A) \( B^(- A) \)$. More generally, for any fixed $c' > 0$, the sum of $h \( frak(p) \) exp \( - c' r \( frak(p) \) \)$ over prefixes having such a high state is $O_(A \, c') \( B^(- A) \)$. Both conclusions also hold in the continuous harmonic model, uniformly in the starting ratios under consideration.]
] <lem:high-states>

#proof[
  Suppose a prefix reaches a state of gap $R$, cutoff $b$, and ratio $R \/ b > S$. Every subsequent factor has exponent at most $b$. Reducing the gap below $R \/ 2$ therefore requires at least $S \/ 2$ additional factors. If $T = log B + O \( 1 \)$ is an upper bound for the remaining harmonic intensity, the sum of weights of these continuations is at most
  $ sum_(j gt.eq S \/ 2) frac(T^j, j !) . $
  Since $S = \( log B \)^2$, this tail is smaller than every fixed negative power of $B$, even after multiplication by $B$. To sum over all possible high ancestors, use Lemma 15: their total prefix weight is $O \( B \)$. This argument is an upper bound even when it counts a terminal prefix more than once.
  At a high ancestor $R > S b > S ell$. Thus a prefix ending at fixed gap $K$ must reduce this gap by more than half for all sufficiently large $B$. For the weighted assertion, prefixes which do not do so have terminal gap greater than $S ell \/ 2$, and their reward is $O \( exp \( - c' S ell \/ 2 \) \)$. Their total unweighted prefix mass is $O \( B \)$, so they too contribute less than every $B^(- A)$. In the continuous model, the ordered integrals of length $j$ are bounded by $T^j \/ j !$, and their total is $e^T lt.double B$; the proof is unchanged. ◻
]

For the rest of the discrete approximation, retain only states of ratio at most $S$. There are at most $N = C S log B$ arrived-at states, with a fixed sufficiently large $C$. Indeed a transition to ratio $t lt.eq S$ decreases $log r$ by $g \( t \) = log \( 1 + 1 \/ t \) gt.double 1 \/ S$. Moreover the gap at a retained nonempty state is bounded below by $0.99 ell$, and the starting gap is $O \( B \)$. This also proves the same deterministic horizon for a continuous path up to its first exit from these conditions.

#thm([Proposition 5.3.])[
  (Coupling the tilted paths).  #emph[Choose sufficiently small absolute positive constants in the following order. For a permitted prime child of a state of type $i$, ratio $s$, and gap $r$, put $t = r \/ x \( p \) - 1$ and give that child mass 
#[#set math.equation(numbering: n => "(5.3)")
 $ q \( p divides r \, s \, i \) = 1 / p (frac(t + 1, t))^2 frac(phi.alt_(i') \( t \), phi.alt_i \( s \)) . $ <eq:prime-tilt>]

 Only children with $x \( p \) > ell$ and $t lt.eq S$ are retained. For $epsilon.alt_w = exp \( - c_2 sqrt(log w) \)$ their total mass is at most $1 + epsilon.alt_w$. Dividing by $1 + epsilon.alt_w$ and assigning the remaining mass to a cemetery state defines a killed Markov chain.]
  #emph[This chain can be coupled with the continuous chain (4.13), killed at the first draw with $x lt.eq ell$ or $t > S$, so that the probability of failure is at most $exp \( - c_3 sqrt(log w) \)$. On success the chains have the same number of arrived-at states and matching exits. At corresponding states, 
#[#set math.equation(numbering: n => "(5.4)")
 $ \| s - tilde(s) \| lt.eq h \, #h(2em) lr(|log r / tilde(r)|) lt.eq C N h \, #h(2em) h = frac(1, ceil.l exp \( c_4 sqrt(log w) \) ceil.r) . $ <eq:prime-coupling-errors>]

 All statements are uniform in $s_(upright("st")) in \[ 1.99 \, 2.3 \]$ and in the endpoint conventions stated above. For a length-$m$ retained prefix, if $bb(P)_w \( frak(p) \)$ denotes its probability in the killed chain, then the exact weight identity is 
#[#set math.equation(numbering: n => "(5.5)")
 $ h \( frak(p) \) = bb(P)_w \( frak(p) \) \( 1 + epsilon.alt_w \)^m (frac(r \( frak(p) \), r_(upright("st"))))^2 frac(phi.alt_(upright(e)) \( s_(upright("st")) \), phi.alt_i \( s \( frak(p) \) \)) \, #h(2em) \( 1 + epsilon.alt_w \)^m = 1 + o \( 1 \) . $ <eq:prime-weight>]

]
] <prop:prime-coupling>

#proof[
  Under $t = r \/ x - 1$ we have $\| d x \/ x \| = d t \/ \( t + 1 \)$. Multiplying by the non-prime part of (5.3) gives $W_0 \( t \) phi.alt_(i') \( t \) \/ phi.alt_i \( s \)$, exactly the continuous transition density. Also $r_(upright("child")) \/ r = t \/ \( t + 1 \)$, so multiplication over a prefix telescopes and proves (5.5). The last assertion there follows from $m lt.eq N$ and (5.1).
  Partition the ratio axis into bins $\[ j h \, \( j + 1 \) h \)$. For a bin meeting the allowed next range, temporarily extend it to the full bin when seeking an upper bound. Its corresponding $x$-interval has logarithmic width comparable to $h \/ \( t + 1 \)$ and lower endpoint at least $ell \/ 2$, for sufficiently large $w$. Lemma 8 bounds logarithmic derivatives of the weights and backward opposite weight ratios by fixed polynomials in $S$. Therefore a full interior bin has discrete mass equal to its continuous mass with relative error
  #[#set math.equation(numbering: n => "(5.6)")
   $ O ("poly" \( S \) (h + frac(E \( 1 \/ 2 \), h))) . $ <eq:prime-bin-error>]
  Here the first term controls variation across the bin, and the second is (5.2) divided by its harmonic main mass. The density itself is bounded by $"poly" \( S \)$ on any bin meeting the support. There are only a bounded number of partial support bins, each with mass at most $"poly" \( S \) h$. The fixed even-child boundary $2$ is a mesh endpoint. Summing the interior relative errors and the partial bin upper bounds proves that the total mass is at most $1 + epsilon.alt_w$, after choosing $c_4$ and then $c_2$ sufficiently small.
  Suppose the chains have been matched through the previous draw. Their lower support endpoints are $s - 1$ or $max \( 2 \, s - 1 \)$, and consequently differ by at most $h$. The upper endpoint imposed by $x > ell$ is $r \/ ell - 1$. It needs comparison only when it is at most $S$, up to a mesh error; in that case $r = O \( S + 1 \)$, and its discrepancy is at most $O \( \( S + 1 \) N h \)$. Thus a large starting gap does not enter this support error. Ratios of the two density denominators are $1 + O \( "poly" \( S \) h \)$. The total mass in mismatched or partial bins, together with the total variation distance between full bin labels and the discrepancy in exit probabilities after normalization, is at most $exp \( - c' sqrt(log w) \)$.
  Maximally couple these bin labels and the cemetery label at each step. Inside a matched nonexit bin the two next ratios differ by at most $h$. Since $g' \( t \) = - 1 \/ \( t \( t + 1 \) \)$ is bounded on the used ranges, each matched step changes the logarithmic-gap discrepancy by $O \( h \)$. Iteration up to $N$ steps gives (5.4); a union bound and (5.1) give the stated failure probability. Single endpoint primes have already been included in the uniform estimate (5.2). The initial lower ratios slightly below $2$ are covered by the extended derivative-weight identities in Lemma 8. ◻
]

The total variation coupling by itself is insufficient for rewards containing $1 \/ phi.alt_i \( s \)$ far out in the ratio tail. The following pointwise majorants supply the required additional control.

#thm([Lemma 5.4.])[
  (Discrete marginal majorants).  #emph[For the killed chain of Proposition 17, the probability of a nonexit bin with left endpoint $t$ at step $2 lt.eq n lt.eq N$ is bounded, with an absolute constant, by 
#[#set math.equation(numbering: n => "(5.7)")
 $ cases(delim: "{", C h phi.alt_(upright(e)) \( t \) \, & n med upright("even") \,, C h phi.alt_(upright(o)) \( t \) #scale(x: 120%, y: 120%)[\(] 1 - t^(- 2) + 3 h W_0 \( t \) #scale(x: 120%, y: 120%)[\)] \, & n med upright("odd") .) $ <eq:prime-marginals>]

 At step $1$ the bound is $C h W_0 \( t \) phi.alt_(upright(o)) \( t \)$, on the slightly extended range $t gt.eq 0.98$. The constants are uniform in the starting ratios and in $w$ sufficiently large.]
] <lem:discrete-marginals>

#proof[
  The bin argument in the preceding proof gives the conditional upper bound
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( 1 + delta_w \) h W_0 \( t \) frac(phi.alt_(i') \( t \), phi.alt_i \( s \)) \, #h(2em) delta_w = exp \( - c' sqrt(log w) \) \, $ <eq:prime-conditional-bin>]
  for every feasible child bin. Division by $1 + epsilon.alt_w$ cannot increase it. The first-step assertion follows because the starting denominator is bounded away from zero. At the second step, canceling the intermediate derivative weight leaves an incoming sum bounded by
  $ C sum_(s_(upright("st")) - 1 lt.eq u lt.eq t + 1 + h) h W_0 \( u \) lt.double log \( t + 2 \) . $
  Since $t gt.eq 2$ and $W_0 \( t \) log \( t + 2 \)$ is bounded, this proves the even majorant at step $2$.
  For the induction, replacing a weight at an actual state by its value at the bin’s left endpoint costs a relative $1 + O \( "poly" \( S \) h \)$. Given the even majorant, the incoming bins for an odd child of left endpoint $t$ start at $2$ and end at most at $t + 1 + h$. Their total mesh length is at most $t - 1 + 3 h$. Multiplication by $W_0 \( t \)$ gives
  $ W_0 \( t \) \( t - 1 + 3 h \) = 1 - t^(- 2) + 3 h W_0 \( t \) \, $
  as required. In the reverse direction, the incoming odd bins start at $1$; their bracket sums satisfy
  $ sum_(1 lt.eq u lt.eq t + 1 + h) h #scale(x: 120%, y: 120%)[\(] 1 - u^(- 2) + 3 h W_0 \( u \) #scale(x: 120%, y: 120%)[\)] & lt.eq integral_1^(t + 1) \( 1 - u^(- 2) \) thin d u + O \( h log \( t + 2 \) \)\
 & = frac(t^2, t + 1) + O \( h log \( t + 2 \) \) . $
  The new factor $W_0 \( t \)$ cancels the leading expression, and the error is $O \( h \)$ for $t gt.eq 2$. The points $1$ and $2$ are mesh aligned, and the $3 h W_0$ term covers the endpoint mesh interval where the stationary odd factor vanishes. Each iteration enlarges the constant by at most $1 + O \( delta_w + "poly" \( S \) h \)$. Its product over $N$ steps is $1 + o \( 1 \)$ by (5.1), completing the proof. ◻
]

#thm([Proposition 5.5.])[
  (Prime occupation estimates).  #emph[The following assertions hold uniformly for $s_(upright("st")) in \[ 1.99 \, 2.3 \]$ and $ell in { 1 \, 2 }$.]
  + #emph[For fixed $K$, the original harmonic mass of prefixes with terminal gap at most $K$ is $O_K \( B^(- 2) \)$.]
  + #emph[Consider any selection of such compact-ending prefixes whose low-state histories imply an event $cal(A)$ in the killed prime chain. Their total weight is at most 
#[#set math.equation(numbering: n => "(5.9)")
 $ C_K B^(- 2) bb(P)_w \( cal(A) \) + O_(K \, A) \( B^(- A) \) $ <eq:prime-compact-event>]

 for every fixed $A > 0$. One may take $cal(A)$ to be the event that at least one selected compact prefix occurs.]
  + #emph[For every fixed $c' > 0$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ lim_(K arrow.r oo) limsup_(w arrow.r oo) B^2 sum_(frak(p) med upright("standard")\
r \( frak(p) \) > K) h \( frak(p) \) e^(- c' r \( frak(p) \)) = 0 . $ <eq:prime-tail>]

 The same compact and tail assertions hold for continuous original harmonic weights.]
  + #emph[Let $H_i \( r \, s \)$ be bounded continuous functions supported in a fixed compact positive gap interval and a fixed compact ratio interval. Fixed interval boundaries and the indicator $s < r \/ ell$ are also permitted, with one-sided continuous extension before imposing that indicator, as in Proposition 11. Then 
#[#set math.equation(numbering: n => "(5.11)")
 $ & frac(r_(upright("st"))^2, phi.alt_(upright(e)) \( s_(upright("st")) \)) sum_(frak(p)) h \( frak(p) \) H_(i \( frak(p) \)) \( r \( frak(p) \) \, s \( frak(p) \) \)\
 & #h(8mm)  arrow.r 1 / M_g sum_(i in { upright(e) \, upright(o) }) integral_0^oo integral frac(r^2 pi_i \( s \), phi.alt_i \( s \)) H_i \( r \, s \) upright(bold(1))_(s < r \/ ell) thin d s thin frac(d r, r) \, $ <eq:prime-occupation>]

 where the inner domains are $s gt.eq 2$ for $i = upright(e)$ and $s gt.eq 1$ for $i = upright(o)$. The convergence is uniform in the starting ratios.]
] <prop:prime-occupation>

#proof[
  Remove high-state histories by Lemma 16. On a remaining compact-ending prefix, $s < r \/ ell$ bounds the terminal ratio in a fixed compact set. The positive weights $phi.alt_i$ are bounded away from zero there, so (5.5) is at most $C_K B^(- 2) bb(P)_w \( frak(p) \)$. A path has at most $C_K$ visits with gap at most $K$, since each exponent exceeds $ell$ and thus each step decreases the gap by more than $ell$. Summing proves (i) and (5.9). This also explains why a history exception costs its tilted probability times $B^(- 2)$, rather than its probability times the unrestricted original mass $O \( B \)$.
  For (iii), the scaled reward after the change of measure is at most
  #[#set math.equation(numbering: n => "(5.12)")
   $ C frac(r^2 e^(- c' r), phi.alt_i \( s \)) . $ <eq:prime-scaled-reward>]
  Put $K_B = C' log log B$. At a step covered by Lemma 18, sum first over ratio bins. Since $r > ell s$ and $ell gt.eq 1$, cancellation of $phi.alt_i$ bounds the expected reward from $r > K_B$ by a constant times
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_(t = j h gt.eq 0.97) h sup_(u gt.eq max \( t \, K_B \)) u^2 e^(- c' u) lt.double \( 1 + K_B \)^3 e^(- c' K_B) . $ <eq:prime-far-tail>]
  Increasing $C'$ makes this $o \( N^(- 1) \)$. The first-step majorant gives the same bound, because $W_0$ is bounded on its extended range. The empty prefix contributes $O \( B^2 e^(- c'' B) \)$.
  On $K < r lt.eq K_B$, the Dickman lower bounds in Lemma 8 bound (5.12) by $exp \( O \( K_B log \( K_B + 2 \) \) \)$. Even after multiplication by $N$, the coupling failure contribution is negligible, since
  $ log N + O \( K_B log \( K_B + 2 \) \) = o \( sqrt(log w) \) . $
  On a successful coupling, the reward is bounded by
  $ C frac(tilde(r)^2 e^(- c' tilde(r) \/ 2), phi.alt_i \( tilde(s) \)) \, #h(2em) tilde(r) > K \/ 2 \, quad tilde(s) < tilde(r) \/ ell . $
  Here the indicator follows from matching the nonexit arrivals, and the comparison of weights follows from their logarithmic derivative bounds and (5.4). On a band $R lt.eq tilde(r) lt.eq e R$, Lemma 12 bounds the expected sum after cancellation of $phi.alt_i$ by $O \( R + 1 \)$. Thus this band contributes at most $C \( R + 1 \) R^2 e^(- c' R \/ 2)$. Summing the geometric sequence of bands above $K \/ 2$ proves (5.10). High-state histories were already negligible by Lemma 16. The continuous proof uses the same band bound directly, along with the continuous version of that lemma.
  Finally, for (iv) use (5.5) with the compact test $r^2 H_i \( r \, s \) \/ phi.alt_i \( s \)$. The correcting factor is uniformly $1 + o \( 1 \)$, and the number of compact-gap visits is bounded. Coupling therefore transfers this test by uniform continuity. Boundary indicators cause no difficulty: the limiting continuous occupation measure gives zero mass to their boundaries, and continuous upper and lower approximations suffice. Continuous removal of high states is harmless as well. For example, the drift estimate in Lemma 9 gives a uniformly bounded exponential moment of the ratio at each step, so a union bound up to the low-state horizon gives $O \( N e^(- S) \) = o \( 1 \)$ for reaching a high state before exit. Alternatively one can use the continuous original-weight conclusion of Lemma 16 on compacts. Apply Proposition 11 to the transferred test and use its uniformity in the starting state. This gives (5.11) and completes the proof. ◻
]

== 6 Evaluation of the reference tree <sec:reference>

We now evaluate the boundary contribution left open by the continuous benchmark in Section 4. Above exponent $2$, the reference tree follows the standard admission rule. At cutoff $2$, its remaining finite polynomial differs from the linear-sieve benchmark. The occupation estimates of Section 5 transport this boundary discrepancy to the root, where it contributes at scale $B^(- 2)$.

The sign requires a separate calculation. We first compare with the full product over the boundary exponents, whose signed contribution can be evaluated exactly. The stronger admission rule below exponent $2$ omits lower children and reduces this contribution. Expanding at the first omitted child will bound the loss and leave enough positive mass to overcome the root’s negative benchmark. The resulting lower bound is Proposition 22. We also obtain a local reference estimate for the later stopped-subtree comparison.

We begin by replacing the continuous factor $1 \/ b$ in the benchmark by the corresponding prime product and controlling the resulting quadrature error. After this error is removed, only the cutoff-$2$ discrepancy remains to be evaluated.

For an available cutoff $b$, let $V \( b \)$ be the product of $1 - 1 \/ p$ over the available primes greater than $w$. The root cutoff includes its upper endpoint, whereas a cutoff at a previously chosen prime excludes that prime. Write $V_x$ for the latter product when the new prime has exponent $x$. The auxiliary cutoff $2$ includes the boundary primes $w < p lt.eq w^2$. Mertens’ theorem and Lemma 15 give

#[#set math.equation(numbering: n => "(6.1)")
 $ V \( b \) = C_w / b #scale(x: 120%, y: 120%)[\(] 1 + O \( E \( b \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) C_w = frac(e^(- gamma), log w thin V_0) arrow.r 1 quad \( b gt.eq 2 \) . $ <eq:ref-product>]

The formula is uniform in these endpoint conventions: excluding an endpoint prime changes the product by $1 + O \( 1 \/ p \)$, an error absorbed by $E \( b \)$.

With $f_(upright(e)) = f$ and $f_(upright(o)) = F$ as before, benchmark a state by $V \( b \) f_i \( r \/ b \)$. The extension of $f$ below $2$ is used only at a starting lower state, as in Section 4. An omitted lower child always has benchmark zero, including when its formal ratio is below the domain of the ordinary sieve functions.

=== 6.1 The quadrature error above the boundary <the-quadrature-error-above-the-boundary>

Define $g_i = f_i - 1$, with the starting extension just described, and set $g_(upright(e)) \( t \) = - 1$ whenever the prospective lower child is omitted. At a state with cutoff $b > 2$, subtracting constants by the identity

$ V \( b \) = V \( 2 \) - sum_(2 < x \( p \) lt.eq b) V_(x \( p \)) / p $

(with the actual upper endpoint convention) gives the residual

#[#set math.equation(numbering: n => "(6.2)")
 $ R_i^(\( w \)) \( r \, b \) = V \( 2 \) g_i \( r \/ 2 \) - V \( b \) g_i \( r \/ b \) - sum_(2 < x \( p \) lt.eq b) V_(x \( p \)) / p g_(i') \( r \/ x \( p \) - 1 \) . $ <eq:ref-residual>]

The sum here includes the omitted children with their deviation $- 1$; they are not included in any subsequent path propagation. This convention accounts exactly for the constants of the omitted terms.

The continuous analogue of (6.2), obtained by replacing $V$ by $C_w$ divided by its exponent and the prime measure by $d x \/ x$, is zero. Subtracting the constant part from (4.2), with the same starting extension and zero benchmark at omitted children, gives

#[#set math.equation(numbering: n => "(6.3)")
 $ frac(d, d b) (frac(g_i \( r \/ b \), b)) = - frac(g_(i') \( r \/ b - 1 \), b^2) . $ <eq:ref-differentiation>]

Integrating this identity from $2$ to $b$ proves the cancellation.

#thm([Lemma 6.1.])[
  (Summed quadrature residual).  #emph[Along the standard prime paths with $x > 2$ from the root, 
#[#set math.equation(numbering: n => "(6.4)")
 $ sum_(frak(p)) h \( frak(p) \) lr(|R_(i \( frak(p) \))^(\( w \)) \( r \( frak(p) \) \, b \( frak(p) \) \)|) = o \( B^(- 2) \) . $ <eq:ref-residual-sum>]

 The same assertion is uniform for lower starting ratios in $\[ 1.99 \, 2.3 \]$ and starting cutoffs $B$ tending to infinity with the parameters of (1.2).]
] <lem:ref-residual>

#proof[
  The absolute next deviation in (6.2) is nondecreasing as a function of $x$. Thus partial summation on an exponent interval with lower endpoint $u gt.eq 2$ bounds the error in replacing
  $ sum 1 / p frac(g_(i') \( r \/ x \( p \) - 1 \), x \( p \)) quad upright("by") quad integral frac(g_(i') \( r \/ x - 1 \), x^2) thin d x $
  by $O \( E \( u \) D \/ u \)$, where $D$ is the maximum absolute next deviation on that interval. To justify the variation bound despite the additional factor $1 \/ x$, use the product-variation inequality: the total variation is at most a constant times $D \/ u$. By (6.1), replacing the products introduces endpoint errors of the same kind and a sum error at most $O \( \( log B \) E \( u \) D \)$. These estimates apply to subintervals as well, and their continuous contributions cancel by (6.3).
  At a state of ratio $s$, all the absolute parent, boundary, and next deviations under discussion are $O \( phi.alt_i \( s \) \)$. For example,
  $ a \( s \) lt.eq phi.alt_(upright(e)) \( s \) \/ s \, #h(2em) c \( s - 1 \) lt.eq phi.alt_(upright(e)) \( s \) \/ s \, $
  and the analogous inequalities follow from $phi.alt_(upright(o)) \( s \) = s \( c \( s \) + a \( s - 1 \) \)$ on its normal range. Monotonicity bounds the later arguments by these earliest ones. The bounded extensions at the initial states obey the same inequalities with an absolute constant. An omitted lower deviation is just $1$ in absolute value, which occurs where the relevant upper derivative weight is bounded away from zero.
  First restrict to histories with all ratios at most $S = \( log B \)^2$. If $b lt.eq \( log B \)^4$, then $r lt.eq \( log B \)^6$, and the preceding partial summation bounds imply, for some fixed $C$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ frac(r^2 \| R_i^(\( w \)) \( r \, b \) \|, phi.alt_i \( s \)) lt.double \( log B \)^C E \( 2 \) . $ <eq:ref-small-cutoff-error>]
  This is smaller than every negative power of $log B$.
  If $b > \( log B \)^4$, split the exponent interval at $sqrt(b)$. Above this point $E \( sqrt(b) \)$ is smaller than every $B^(- A)$: indeed $sqrt(sqrt(b) log w) gt.double \( log B \)^(3 \/ 2)$. Below it every relevant next ratio is at least $s sqrt(b) - 1$, and the boundary ratio is at least $s sqrt(b)$. The Dickman bounds from Lemma 8, together with the backward-ratio bounds there, show that these deviations divided by $phi.alt_i \( s \)$ are smaller than every $B^(- A)$, uniformly for $s lt.eq S$. One can see the uniformity by comparing the arguments to $s$: their separation is at least a constant times $\( log B \)^2$, while the derivative weights have exponentially decreasing ratios beyond any fixed compact set. Any fixed polynomial losses are absorbed. Since $r = O \( B \)$ along a path, the same assertion holds after multiplication by $r^2$.
  Apply (5.5) and sum over at most $N = O \( \( log B \)^3 \)$ steps. The starting factor $phi.alt_(upright(e)) \( s_(upright("st")) \) \/ r_(upright("st"))^2$ is $O \( B^(- 2) \)$, and (6.5) and its large-cutoff counterpart show that the low-state contribution to (6.4) is $o \( B^(- 2) \)$.
  It remains to bound histories having a ratio above $S$. The crude bound for every residual is $O \( log B \)$, since all deviations in its definition are bounded and the total harmonic prime sum is $O \( log B \)$. We claim the sharper bound
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| R_i^(\( w \)) \( r \, b \) \| = O_A \( B^(- A) \) #h(2em) \( r gt.eq S \/ 2 \) $ <eq:ref-high-gap-error>]
  without a ratio restriction. In the preceding error estimates split instead at $Q = \( log B \) sqrt(log log B)$. For $x gt.eq Q$, the PNT saving has exponent at least a constant times $\( log B \) \( log log B \)^(1 \/ 4)$, and hence beats every $B^(- A)$. For $x lt.eq Q$, each relevant argument $r \/ x$ or $r \/ x - 1$ is at least a constant times $log B \/ sqrt(log log B)$. The Dickman bound $rho \( v \) lt.eq exp \( - v log v + O \( v \) \)$ makes its deviation smaller than every $B^(- A)$. The endpoint errors fall into the same alternatives. This proves (6.6).
  The total prefix weight is $O \( B \)$, so (6.6) deals with the high-history prefixes whose terminal gaps are at least $S \/ 2$. A high ancestor on the $x > 2$ tree has gap greater than $2 S$. Any remaining prefix with terminal gap below $S \/ 2$ has reduced that ancestor’s gap by more than half. The factorial-tail argument in Lemma 16, multiplied by the crude $O \( log B \)$ residual bound, deals with those prefixes. This completes the proof. ◻
]

=== 6.2 The boundary anomaly <the-boundary-anomaly>

For the actual discrete reference tree at cutoff $2$, put

#[#set math.equation(numbering: n => "(6.7)")
 $ delta_i^(\( w \)) \( r \) = P_i \( r \, 2 \) - V \( 2 \) f_i \( r \/ 2 \) \, #h(2em) r gt.eq 4 med \( i = upright(e) \) \, quad r gt.eq 2 med \( i = upright(o) \) . $ <eq:ref-anomaly>]

These domains contain every state reached when iterating the root recurrence only through exponents $x > 2$. A possible first upper state arising from a starting ratio below $2$ still has gap tending to infinity, so it causes no exception.

Let $Q_i \( r \, b \)$ denote the continuous reference polynomial, obtained from the same admission rule by replacing prime sums by ordered integrals in $d x \/ x$, with exponents above $1$. On the displayed domains define

#[#set math.equation(numbering: n => "(6.8)")
 $ delta_i \( r \) = Q_i \( r \, 2 \) - 1 / 2 f_i \( r \/ 2 \) . $ <eq:ref-cont-anomaly>]

#thm([Lemma 6.2.])[
  (Boundary convergence and decay).  #emph[On every fixed compact subset of their respective domains, $delta_i^(\( w \))$ converges uniformly to the continuous function $delta_i$. Uniformly for sufficiently large $w$, 
#[#set math.equation(numbering: n => "(6.9)")
 $ \| delta_i^(\( w \)) \( r \) \| + \| delta_i \( r \) \| lt.double exp \( - c r log \( r + 2 \) \) . $ <eq:ref-anomaly-decay>]

]
] <lem:ref-anomaly>

#proof[
  On a fixed compact gap interval the admitted polynomial has bounded length, because every exponent exceeds $1$. For each such length, Lemma 15 gives convergence of the ordered prime sum to its harmonic integral. Ties, moving upper endpoints, and admission equalities are confined to sets of continuous measure zero. The same argument works along any convergent sequence of gap parameters. The continuous integrals depend continuously on those parameters by dominated convergence, so compactness yields uniform convergence. Also $V \( 2 \) arrow.r 1 \/ 2$ by (6.1).
  For decay, compare the cutoff polynomial with the full product $V \( 2 \)$. At a first omitted lower leaf after $m$ boundary exponents, all of which are at most $2$, the failure of admission requires $m > \( r - 4 \) \/ 2$. The total discrepancy is bounded by the sum of the weights of such first omissions times their exact subsequent survivor product, which is at most $1$. Thus it is bounded by
  $ sum_(m > \( r - 4 \) \/ 2) frac(T_2^m, m !) \, #h(2em) T_2 = sum_(w < p lt.eq w^2) 1 / p = log 2 + o \( 1 \) . $
  This is $O \( exp \( - c r log \( r + 2 \) \) \)$. The continuous full product is $exp \( - integral_1^2 d x \/ x \) = 1 \/ 2$, and its first-omission decomposition has the same bound. Finally the benchmark deviations $a \( r \/ 2 \)$ and $c \( r \/ 2 \)$ have the required decay by Lemma 7. Combining these comparisons proves (6.9). ◻
]

Iterate the difference between the reference recurrence and its benchmark only through $x > 2$. At every visited state, including the root, insert its anomaly (6.7) and its residual (6.2); propagate an insertion with the original prefix weight and sign $\( - 1 \)^m$ at depth $m$. More explicitly, subtracting the benchmark from the recurrence gives its cutoff-$2$ anomaly minus the child differences, plus the residual; repeated substitution gives

#[#set math.equation(numbering: n => "(6.10)")
 $ P_(upright(e)) \( r_0 \, B \) = V \( B \) f_(upright("ext")) \( r_0 \/ B \) + cal(D)_w + o \( B^(- 2) \) \, #h(2em) cal(D)_w = sum_(frak(p)) \( - 1 \)^(\| frak(p) \|) h \( frak(p) \) delta_(i \( frak(p) \))^(\( w \)) \( r \( frak(p) \) \) \, $ <eq:ref-root-decomposition>]

where Lemma 20 bounds the residual sum absolutely.

Compact convergence in Lemma 21, the compact occupation limit in Proposition 19, and its exponentially weighted tail estimate justify passing to the limit in $cal(D)_w$. The limiting stationary densities are $pi_(upright(e)) \( t \) = phi.alt_(upright(e)) \( t \)$ and $pi_(upright(o)) \( t \) = \( 1 - t^(- 2) \) phi.alt_(upright(o)) \( t \)$, and the arrived-at cutoff restriction is $t < r \/ 2$. Moreover

$ frac(B^2 phi.alt_(upright(e)) \( r_0 \/ B \), r_0^2) arrow.r frac(phi.alt_(upright(e)) \( 2 \), 4) = e^gamma . $

Consequently

#[#set math.equation(numbering: n => "(6.11)")
 $ lim_(w arrow.r oo) frac(B^2 cal(D)_w, e^gamma) = 1 / M_g { & integral_4^oo r^2 delta_(upright(e)) \( r \) integral_2^(r \/ 2) d t thin frac(d r, r)\
- & integral_2^oo r^2 delta_(upright(o)) \( r \) integral_1^(r \/ 2) \( 1 - t^(- 2) \) thin d t thin frac(d r, r) #scale(x: 240%, y: 240%)[}] . $ <eq:ref-correction-limit>]

=== 6.3 The signed correction integral <the-signed-correction-integral>

Set $y = r \/ 2 - 1$ and define

$ l \( y \) = 2 Q_(upright(e)) \( 2 y + 2 \, 2 \) quad \( y gt.eq 1 \) \, #h(2em) u \( y \) = 2 Q_(upright(o)) \( 2 y + 2 \, 2 \) quad \( y gt.eq 0 \) . $

The even inner integral in (6.11) is $y - 1$; the odd inner integral is $y^2 \/ \( y + 1 \)$. Since $r thin d r = 4 \( y + 1 \) thin d y$, that limit is $2 I \/ M_g$, where

#[#set math.equation(numbering: n => "(6.12)")
 $ I = integral_1^oo \( y^2 - 1 \) #scale(x: 120%, y: 120%)[\(] l \( y \) - f \( y + 1 \) #scale(x: 120%, y: 120%)[\)] thin d y - integral_0^oo y^2 #scale(x: 120%, y: 120%)[\(] u \( y \) - F \( y + 1 \) #scale(x: 120%, y: 120%)[\)] thin d y . $ <eq:ref-I>]

All these integrals converge absolutely by (6.9).

To determine the sign of $I$, compare the boundary polynomials with the full survivor product over exponents in $\[ 1 \, 2 \]$. That product is $1 \/ 2$, so this comparison replaces both $l$ and $u$ by $1$. Denote the resulting integral by $I_(upright("full"))$. As $a = 1$ up to $2$ and $a + c = c_0$, it equals

#[#set math.equation(numbering: n => "(6.13)")
 $ 2 e^gamma integral_0^oo frac(y^2 rho \( y \), y + 1) thin d y - 1 / 3 - integral_2^oo a \( t \) thin d t = 8 / 3 . $ <eq:ref-Ifull>]

Here are the identities giving the last equality. The Dickman integral equation holds in the form $y rho \( y \) = integral_(max \( 0 \, y - 1 \))^y rho \( t \) thin d t$ also below $1$. Integration and Fubini give $integral_0^oo y rho \( y \) thin d y = integral_0^oo rho \( y \) thin d y$. The differential equation gives $integral_0^oo rho \( y \) \/ \( y + 1 \) thin d y = - integral_1^oo rho' \( t \) thin d t = 1$. Thus the decomposition $y^2 \/ \( y + 1 \) = y - 1 + 1 \/ \( y + 1 \)$ makes the first integral in (6.13) equal to $2 e^gamma$. Finally Lemma 7, at $s = 1$ in the identity for $c$, gives $integral_0^oo a = 2 e^gamma - 1$; subtracting the interval $\[ 0 \, 2 \]$ gives $integral_2^oo a = 2 e^gamma - 3$.

The actual boundary rule can only reduce this full-product contribution: a first omitted lower leaf removes a positive term for a lower start and a negative term for an upper start. We quantify the resulting loss by recording the first omission. Consider ordered boundary exponents

$ 2 gt.eq x_1 gt.eq dots.h.c gt.eq x_m gt.eq 1 \, #h(2em) A_m = sum_(j = 1)^m x_j + x_m \, #h(2em) A' = cases(delim: "{", 0 \, & m = 1 \,, 2 \, & m = 2 \,, A_(m - 2) \, & m gt.eq 3 .) $

For boundary exponents the stronger admission rule is $r_(upright("child")) gt.eq x + 2$. Starting at gap $2 y + 2$, this says $2 y gt.eq A_m$ at a prospective lower child. The thresholds increase within each parity: for $m gt.eq 3$ their difference is $x_(m - 1) + 2 x_m - x_(m - 2) > 0$ on $\[ 1 \, 2 \]$, and $A_2 > 2$. Consequently the first omitted child occurs at even $m$ for a lower start, and at odd $m$ for an upper start, exactly when

#[#set math.equation(numbering: n => "(6.14)")
 $ A' \/ 2 lt.eq y < A_m \/ 2 . $ <eq:ref-omission-window>]

The exceptional value $A' = 2$ for $m = 2$ expresses the lower-start domain $y gt.eq 1$; $A' = 0$ for $m = 1$ expresses the upper-start domain $y gt.eq 0$.

After this first omitted leaf, the exact full survivor product over smaller boundary exponents is $1 \/ x_m$. This follows either by the product identity or by the absolutely convergent full inclusion– exclusion series with harmonic intensity $log x_m$. Omitting a positive even-depth term lowers the lower polynomial; omitting a negative odd-depth term raises the upper polynomial. These signs, the factor $2$ in $l \, u$, and integration over (6.14) give

#[#set math.equation(numbering: n => "(6.15)")
 $ I_(upright("full")) - I = 2 sum_(m gt.eq 1) integral_(2 gt.eq x_1 gt.eq dots.h.c gt.eq x_m gt.eq 1) 1 / x_m {frac(A_m^3 - \( A' \)^3, 24) - upright(bold(1))_(2 divides m) frac(A_m - A', 2)} product_(j = 1)^m frac(d x_j, x_j) . $ <eq:ref-loss-series>]

Every term is nonnegative: its expression in braces is the integral of $y^2$ or $y^2 - 1$ on its allowed window. The bounds below also establish convergence, so the first-omission summations and integrals are justified by Tonelli’s theorem.

Write $L_m$ for the $m$th term of (6.15) and $lambda = log 2$. The first term is $L_1 = integral_1^2 \( 2 x \/ 3 \) thin d x = 1$. For completeness we evaluate the next two terms by explicit one-dimensional reductions. Integrating $x_1$ first in the $m = 2$ term gives

#[#set math.equation(numbering: n => "(6.16)")
 $ L_2 = integral_1^2 { & - frac(23 t, 18) + 2 + 2 / t - frac(16, 9 t^2)\
 & + (frac(2 t, 3) - 2 / t + frac(4, 3 t^2)) log 2 / t #scale(x: 240%, y: 240%)[}] thin d t = - 35 / 36 - lambda^2 + 3 lambda . $ <eq:ref-L2-reduction>]

Indeed the original integrand in this case is

$ frac(1, x_1 x_2^2) {frac(\( x_1 + 2 x_2 \)^3 - 8, 12) - \( x_1 + 2 x_2 - 2 \)} . $

For $m = 3$, the original integrand is

$ frac(\( x_1 + x_2 + 2 x_3 \)^3 - 8 x_1^3, 12 x_1 x_2 x_3^2) . $

Integrating $x_1$ from $x_2$ to $2$ and then $x_2$ from $x_3$ to $2$ yields

#[#set math.equation(numbering: n => "(6.17)")
 $ L_3 = integral_1^2 { & t / 3 log^2 2 / t + (- frac(23 t, 18) + 2 + 1 / t - frac(14, 9 t^2)) log 2 / t\
 & + frac(119 t, 216) - 9 / 4 + frac(3, 2 t) + frac(43, 27 t^2) #scale(x: 240%, y: 240%)[}] thin d t = 623 / 432 - 19 / 12 lambda + 1 / 3 lambda^2 . $ <eq:ref-L3-reduction>]

These equalities involve only elementary antiderivatives. For an explicit check of the last integrations, put $J_(j \, k) = integral_1^2 t^(j - 1) log^k \( 2 \/ t \) thin d t$. The needed values are

$ j & 2 & 1 & 0 & - 1\
J_(j \, 0) & 3 \/ 2 & 1 & lambda & 1 \/ 2\
J_(j \, 1) & 3 \/ 4 - lambda \/ 2 & 1 - lambda & lambda^2 \/ 2 & lambda - 1 \/ 2 #h(2em) J_(2 \, 2) = 3 / 4 - lambda / 2 - lambda^2 / 2 . $

Substitution in (6.16) and (6.17) proves the displayed formulas exactly.

For $m gt.eq 4$, ordering gives

$ A_m - A' = x_(m - 1) + 2 x_m - x_(m - 2) lt.eq 2 x_m \, #h(2em) A_m lt.eq \( m + 1 \) overline(x) \, #h(2em) overline(x) = 1 / m sum_(j = 1)^m x_j . $

Since $A_m^3 - \( A' \)^3 lt.eq 3 A_m^2 \( A_m - A' \)$, and dropping the negative even term only increases the answer, the integrand including the factor $2 \/ x_m$ is at most $A_m^2 \/ 2$. This last upper bound can be replaced by the symmetric function $\( m + 1 \)^2 overline(x)^(thin 2) \/ 2$. Under the probability measure $d x \/ \( lambda x \)$ on $\[ 1 \, 2 \]$,

$ bb(E) x = lambda^(- 1) \, #h(2em) bb(E) x^2 = frac(3, 2 lambda) \, #h(2em) bb(E) overline(x)^(thin 2) = lambda^(- 2) + 1 / m (frac(3, 2 lambda) - lambda^(- 2)) . $

Integration over the ordered region divides a symmetric integral by $m !$. We obtain the rigorous tail bound

#[#set math.equation(numbering: n => "(6.18)")
 $ sum_(m gt.eq 4) L_m lt.eq 1 / 2 sum_(m gt.eq 4) \( m + 1 \)^2 frac(lambda^m, m !) {lambda^(- 2) + 1 / m (frac(3, 2 lambda) - lambda^(- 2))} < 0.34 . $ <eq:ref-loss-tail>]

Here is a coarse numerical verification with strict rational margins. From $0.69 < lambda < 0.70$, the expression in braces for $m gt.eq 4$ is at most $3 \/ \( 4 \( 0.69 \)^2 \) + 3 \/ \( 8 \( 0.69 \) \) < 2.14$. Also

$ sum_(m gt.eq 4) \( m + 1 \)^2 frac(\( 0.70 \)^m, m !) = e^0.70 #scale(x: 120%, y: 120%)[\(] \( 0.70 \)^2 + 3 \( 0.70 \) + 1 #scale(x: 120%, y: 120%)[\)] - 1 - 4 \( 0.70 \) - 9 / 2 \( 0.70 \)^2 - 8 / 3 \( 0.70 \)^3 < 0.313 . $

For example, $e^0.70 < 2.014$, obtained by summing its Taylor series and bounding the remaining positive tail geometrically, already gives the last strict inequality. Their product with $1 \/ 2$ is less than $0.34$. The exact expressions above also give $L_2 < 0.66$ and $L_3 < 0.52$ on $0.69 < lambda < 0.70$. Therefore

#[#set math.equation(numbering: n => "(6.19)")
 $ I > 8 / 3 - 1 - 0.66 - 0.52 - 0.34 > 0.14 . $ <eq:ref-I-positive>]

#thm([Proposition 6.3.])[
  (Positive reference margin).  #emph[At the root of the reference tree, 
#[#set math.equation(numbering: n => "(6.20)")
 $ frac(B^2 P_(upright(e)) \( r_0 \, B \), e^gamma) arrow.r - a_star.op + frac(2 I, M_g) > 0.02 . $ <eq:ref-margin>]

 In particular, there is an absolute $c_L > 0$ such that $B^2 P_(upright(e)) \( r_0 \, B \) gt.eq c_L$ for all sufficiently large $z$.]
] <prop:reference-margin>

#proof[
  The parameter definitions imply
  $ r_0 = 2 B - a_star.op + 2 - frac(2 log L, log w) + o \( 1 \) = 2 B - a_star.op + o \( 1 \) . $
  Since $f'_(upright("ext")) \( 2 \) = e^gamma$, (6.1) gives
  $ frac(B^2 V \( B \) f_(upright("ext")) \( r_0 \/ B \), e^gamma) arrow.r - a_star.op . $
  Equations (6.10), (6.11), and (6.12) give the limit in (6.20). Finally $M_g lt.eq 4 e^gamma$ by (4.19). The elementary bound $gamma lt.eq sum_(j = 1)^6 j^(- 1) - log 6 < 0.66$ implies $e^gamma < 1.95$. Together with $a_star.op = 0.01$ and (6.19), this yields
  $ - a_star.op + frac(2 I, M_g) > - 0.01 + frac(0.28, 4 \( 1.95 \)) > 0.02 . $
  The eventual positive constant $c_L$ follows. ◻
]

#prodef([Remark 6.4.])[
  (A sharper bound for the correction integral).  The same analytic majorant gives $I > 0.2229793730$ using rational arithmetic. To record the bound explicitly, put
  $ b = 693147180559946 / 10^15 \, #h(2em) J \( t \) = 517 / 432 - frac(17 t, 12) + frac(2 t^2, 3) \, $
  $ t_m \( t \) = frac(\( m + 1 \)^2, 2 m !) [(1 - 1 / m) t^(m - 2) + frac(3, 2 m) t^(m - 1)] . $
  The expansion $log 2 = 2 sum_(j gt.eq 0) \( \( 2 j + 1 \) 3^(2 j + 1) \)^(- 1)$ shows that $0.69 < lambda = log 2 < b$: after $j = 15$ the remainder is at most $2 \/ \( 33 dot.op 3^33 \( 1 - 1 \/ 9 \) \)$. The exact formulas for $L_2 \, L_3$ and the tail majorant (6.18) give $I gt.eq J \( lambda \) - sum_(m gt.eq 4) t_m \( lambda \)$. Each $t_m$ is increasing, whereas $J$ is decreasing on $\[ 0.69 \, b \]$. For $m gt.eq 13$,
  $ frac(t_(m + 1) \( b \), t_m \( b \)) lt.eq b frac(\( m + 2 \)^2, \( m + 1 \)^3) lt.eq frac(225 b, 2744) < 1 . $
  Indeed the remaining factor in $t_m \( b \)$ is $1 + \( 3 b \/ 2 - 1 \) \/ m$, which decreases with $m$. Summing the geometric remainder and evaluating the finite rational expression therefore yields
  $ I > J \( b \) - sum_(m = 4)^12 t_m \( b \) - frac(t_13 \( b \), 1 - 225 b \/ 2744) > 222979373 / 10^9 . $
] <rem:ref-sharper-margin>

=== 6.4 A uniform local comparison <a-uniform-local-comparison>

The stopped-node argument needs a different consequence of the same boundary analysis. Its ratios lie slightly above $2$, and its cutoffs lie in a large but fixed window. We need a uniform upper comparison with $f \( r \/ b \)$ there, rather than the signed root limit. The following estimate permits the cutoff window to be chosen before the prime limit; its $O \( 1 \/ b \)$ constant is independent of that window.

#thm([Lemma 6.5.])[
  (Local reference estimate).  #emph[For the continuous reference polynomial, 
#[#set math.equation(numbering: n => "(6.21)")
 $ Q_(upright(e)) \( r \, b \) = frac(f \( r \/ b \), b) + O \( b^(- 2) \) #h(2em) (b arrow.r oo \, quad 2 lt.eq r \/ b lt.eq 2.22) \, $ <eq:ref-local-cont>]

 uniformly in the displayed ratios. On every fixed cutoff window $\[ b_0 \, b_1 \]$ with $b_0$ sufficiently large, the corresponding discrete estimate is 
#[#set math.equation(numbering: n => "(6.22)")
 $ frac(P_(upright(e)) \( r \, b \), V \( b \)) = f \( r \/ b \) + O \( 1 \/ b \) + o_(w arrow.r oo) \( 1 \) \, #h(2em) b in \[ b_0 \, b_1 \] \, quad 2 lt.eq r \/ b lt.eq 2.22 . $ <eq:ref-local-prime>]

 The constant in $O \( 1 \/ b \)$ is absolute, the last convergence is uniform on the fixed window, and either prime endpoint convention is allowed.]
] <lem:local-reference>

#proof[
  In the continuous model the benchmark is $f \( r \/ b \) \/ b$ and the quadrature residual is identically zero by (6.3). Its correction is the sum of the boundary anomalies $delta_i$ along the standard paths above $2$, with parity signs. The continuous version of (4.14) supplies the starting factor $phi.alt_(upright(e)) \( r \/ b \) \/ r^2 lt.double b^(- 2)$, uniformly for $r \/ b in \[ 2 \, 2.22 \]$. The expected sum of the absolute remaining reward $R^2 \| delta_i \( R \) \| \/ phi.alt_i \( s \)$ is bounded uniformly in the start. To verify this, use bounded compact-gap visits on a fixed compact range and, outside it, sum the unit logarithmic gap bands from Lemma 12. After canceling $phi.alt_i$, a band $R lt.eq r' lt.eq e R$ costs at most a fixed polynomial in $R$ times $exp \( - c R log \( R + 2 \) \)$, by (6.9); the resulting series converges. The empty prefix and the explicitly bounded first step satisfy the same estimate. This proves (6.21).
  For fixed $b in \[ b_0 \, b_1 \]$ and the indicated ratios, the starting gap is bounded and the ordered reference polynomial has uniformly bounded length. Lemma 15 therefore gives uniform convergence of the discrete polynomial to $Q_(upright(e))$: along any convergent parameter sequence, tie, cutoff, and admission boundaries have continuous measure zero, and dominated convergence applies to each bounded-length integral. Compactness makes this uniform on the whole window. Endpoint inclusion or exclusion makes no difference to the limit. Finally (6.1) gives $V \( b \) arrow.r 1 \/ b$ uniformly there. Divide the continuous estimate by $1 \/ b$, and transfer it to the primes, to obtain (6.22). ◻
]

== 7 Compact errors and independent prime boxes <sec:boxes>

The approximation of the original tree by its reference tree is already adequate at nodes with large gap. At a node with bounded gap, however, a large relative error in the small-prime sieve need not be impossible. We first locate a recent edge on which such an error is visible, and then place the relevant tuples in boxes of independently varying primes. The width of the boxes will be chosen last; all constants used to sum their measures must therefore be independent of that width.

For a tuple $d = p_1 dots.h.c p_m$, always written with $p_1 > dots.h.c > p_m > w$, write

$ x_j = x \( p_j \) \, #h(2em) r_j = r_0 - sum_(i = 1)^j x_i \, #h(2em) v_j = log_w J_(p_1 dots.h.c p_j) = r_j + a_star.op - 2 . $

An endpoint means a tuple, together with its length, in the included tree of Section 3. Its prefixes are the preceding tuples on the same branch. For a nonempty tuple its strict cutoff is $b_d = x_m$; the root has the weak cutoff $B$. For a family $cal(A)$ of endpoints, put

#[#set math.equation(numbering: n => "(7.1)")
 $ frak(m) \( cal(A) \) = sum_(d in cal(A)) 1 / d . $ <eq:boxes-harmonic-measure>]

Different lengths are counted separately. This is the natural measure because $mu_d = Y V_0 \/ d$.

Here is the error accounting that the construction will serve. Let $cal(S)$ be any prefix-free collection of included lower nodes at which the original tree is stopped, and let $cal(T)$ be its retained nonstopped nodes. Expanding the reference tree only as far as these stops and then using the original tree identity gives

#[#set math.equation(numbering: n => "(7.2)")
 $ S_1 \( B \) med & gt.eq Y V_0 P_(upright(e)) \( r_0 \, B \) + sum_(d in cal(S)) #scale(x: 120%, y: 120%)[\(] S_d \( b_d \) - mu_d P_(upright(e)) \( r_d \, b_d \) #scale(x: 120%, y: 120%)[\)] - sum_(d in cal(T)) \| N_d - mu_d \| . $ <eq:boxes-error-ledger>]

All stopped nodes have even length, so their exact-subtree corrections have a positive sign. By Lemma 5 and the exponentially weighted tail estimate in Proposition 19,

#[#set math.equation(numbering: n => "(7.3)")
 $ lim_(K arrow.r oo) limsup_(z arrow.r oo) frac(B^2, Y V_0) sum_(d upright(" included")\
r_d > K) \| N_d - mu_d \| = 0 . $ <eq:boxes-large-gap-error>]

Also, for each fixed $K$,

#[#set math.equation(numbering: n => "(7.4)")
 $ sum_(d upright(" included") \, med r_d lt.eq K\
\| N_d \/ mu_d - 1 \| lt.eq epsilon) \| N_d - mu_d \| lt.eq C_K epsilon thin frac(Y V_0, B^2) . $ <eq:boxes-small-error>]

These estimates are over the full included tree, so they remain valid after any stops have been imposed. We must control the remaining compact endpoints, at which the relative error exceeds $epsilon$. At all included endpoints Lemma 5 also gives $\| N_d \/ mu_d - 1 \| lt.double_(a_star.op) 1$. Thus discarding a family $cal(A)$ of compact endpoints costs $O_(a_star.op) \( Y V_0 frak(m) \( cal(A) \) \)$ in (7.2).

=== 7.1 A recent witnessing edge <a-recent-witnessing-edge>

#thm([Lemma 7.1.])[
  (Witnessing edge).  #emph[Fix $K$ and $0 < epsilon < 1$. One can choose a fixed $K_(*) > K + 10$ such that, with 
$ H_e = ceil.l 2 K_(*) + 10 ceil.r \, #h(2em) delta = frac(epsilon, 4 H_e) \, $

 the following holds for all sufficiently large $z$, uniformly in the prescribed residue classes. If an included endpoint $d$ has $r_d lt.eq K$ and $\| N_d \/ mu_d - 1 \| > epsilon$, then one of its last $H_e$ edges, with parent $d'$ and child prime $u$, satisfies 
#[#set math.equation(numbering: n => "(7.5)")
 $ lr(|N_(d' u) - N_(d') / u|) > delta mu_(d') / u \, #h(2em) x \( u \) \, med log_w J_(d') lt.eq 2 K_(*) + 3 \, #h(2em) log_w J_(d' u) gt.eq a_star.op . $ <eq:boxes-witness>]

]
] <lem:edge-witness>

#proof[
  Choose $K_(*)$ so that Lemma 5 gives $\| N_e \/ mu_e - 1 \| < epsilon \/ 2$ whenever $log_w J_e gt.eq K_(*)$. Along the given branch the numbers $v_j$ decrease strictly, by more than one at each step. Let $i$ be the first index for which $v_i < K_(*)$. This index exists because $r_d lt.eq K$, and it is not the first index: $v_1 gt.eq log_w Y - B arrow.r oo$.
  Every nonroot included lower node of cutoff $b$ has both $r gt.eq 2 b$ and $r gt.eq b + 2$, by (3.3). Its odd child of exponent $x lt.eq b$ consequently has $r_(upright("child")) gt.eq x$ and $r_(upright("child")) gt.eq 2$. An included even child has $r_(upright("child")) gt.eq cal(H) \( x \) gt.eq 2 x$. Thus at the crossing index $i$, regardless of its parity,
  $ x_i lt.eq r_i = v_i + 2 - a_star.op < K_(*) + 2 \, #h(2em) v_(i - 1) = v_i + x_i < 2 K_(*) + 2 . $
  All included nodes have $v_j gt.eq a_star.op$. It follows that there are fewer than $H_e$ edges from the crossing parent to $d$, and each of them has parent $v lt.eq 2 K_(*) + 3$, exponent at most $2 K_(*) + 3$, and child $v gt.eq a_star.op$.
  Put $e_e = N_e \/ mu_e - 1$. For each edge of prime $u$,
  $ e_(d' u) - e_(d') = frac(N_(d' u) - N_(d') \/ u, mu_(d') \/ u) . $
  The error at the crossing parent has absolute value less than $epsilon \/ 2$, whereas the final error has absolute value greater than $epsilon$. Telescoping and the triangle inequality show that one of the fewer than $H_e$ differences has absolute value greater than $epsilon \/ \( 2 H_e \) > delta$. ◻
]

=== 7.2 Bins, boxes, and regular endpoints <bins-boxes-and-regular-endpoints>

Fix for the moment $0 < xi < 1$. Partition $\( w \, z \]$ into right-closed bins of equal logarithmic width, using

$ n_(upright("bin")) = ⌈frac(log \( z \/ w \), log \( 1 + xi \))⌉ quad upright("bins") \, #h(2em) h = frac(log \( z \/ w \), n_(upright("bin")) log w) $

for their width in the exponent coordinate $x = log_w p$. Thus $h asymp xi \/ log w$ for fixed $xi$, and the ratio of the upper and lower endpoints of a bin is at most $1 + xi$. A bin with lower endpoint $U$ has

#[#set math.equation(numbering: n => "(7.6)")
 $ n \( U \) asymp frac(xi U, log U) $ <eq:boxes-bin-count>]

primes, uniformly for $w lt.eq U < z$, once $z$ is sufficiently large depending on the fixed $xi$. This follows from Lemma 4; the same conclusion holds for the last bin because its logarithmic width equals that of the others. The bin’s representative exponent is its right endpoint in exponent coordinates.

A full box fixes a length and the ordered bin labels of all its positions. If a bin appears $m_j$ times, choose any $m_j$ distinct primes in that bin and put them in decreasing order. Choices in different bins are independent. Give each resulting tuple weight $1 \/ d$, and write $frak(m) \( cal(B) \)$ for the sum of these weights over a full box $cal(B)$. Equivalently, the probability measure obtained by dividing by $frak(m) \( cal(B) \)$ is a product, over its used bins, of the reciprocal-product measures on the chosen subsets. A position has multiplicity one if its bin is used just once in the whole box.

A #emph[search bin] is a bin whose lower exponent endpoint is at least $w^(1 \/ 4)$. We use the fixed constant $alpha_max = 1 \/ 100$. For a constant $alpha_min > 0$ to be chosen below, a bin wholly contained in $\[ alpha_min B \, alpha_max B \]$ in exponent coordinates will be called an isolated-bin candidate. When at least one such bin is used, designate the first such position as the #emph[isolated position]; its prime will be denoted by $p$.

#thm([Proposition 7.2.])[
  (Regular boxes).  #emph[Fix $K$ and $K_(*) > K + 10$. For every $theta.alt > 0$ there are fixed constants $C_(upright("len"))$ and $alpha_min > 0$, followed by constants $xi_0 > 0$ and $C_(upright("th")) < oo$, with the following properties. They are chosen before $z$ tends to infinity, and $C_(upright("th"))$ is independent of $0 < xi lt.eq xi_0$. Put 
#[#set math.equation(numbering: n => "(7.7)")
 $ Delta = 2 C_(upright("len")) xi . $ <eq:boxes-delta>]

 For each fixed $0 < xi lt.eq xi_0$ and sufficiently large $z$, there is a family $cal(G)$ of regular included endpoints with $r_d lt.eq K$ such that 
#[#set math.equation(numbering: n => "(7.8)")
 $ frak(m) #scale(x: 120%, y: 120%)[\(] { d upright(" included") : r_d lt.eq K } \\ cal(G) #scale(x: 120%, y: 120%)[\)] lt.eq frac(theta.alt + C_(upright("th")) Delta + o_xi \( 1 \), B^2) . $ <eq:boxes-exception>]

 The term $o_xi \( 1 \)$ tends to zero after all fixed parameters, including $xi$, have been chosen. The statement is uniform in the prescribed residue classes. The regular endpoints and their covering full boxes have these additional properties.]
  + #emph[Every regular endpoint has length at most $C_(upright("len")) log B$ and has an isolated position. Every used search bin, including its isolated bin, has multiplicity one. Every position satisfying 
$ x_j lt.eq 2 K_(*) + 3 \, #h(2em) r_(j - 1) lt.eq 2 K_(*) + 5 $

 also has multiplicity one. The isolated position precedes every edge supplied by Lemma 25.]
  + #emph[For every nonempty even prefix of a regular endpoint, 
#[#set math.equation(numbering: n => "(7.9)")
 $ r_j - cal(H) \( x_j \) > 10 Delta . $ <eq:boxes-threshold-clearance>]

 Moving prime choices anywhere within their fixed bins changes any prefix gap by at most $Delta$, and changes a threshold expression $r_j - cal(H) \( x_j \)$ by at most $Delta + 2 h$. In particular the representative gaps and exponents of every regular box satisfy 
#[#set math.equation(numbering: n => "(7.10)")
 $ r_j^(upright("rep")) gt.eq cal(H) \( x_j^(upright("rep")) \) + 3 Delta quad upright("at every nonempty even prefix") . $ <eq:boxes-representative-safety>]

]
  + #emph[Let $frak(B)$ be the distinct full boxes containing at least one regular endpoint. There is a constant $C_K^(upright("box"))$, depending only on a fixed enlargement of the endpoint compact range and the allowed starting ratios, such that 
#[#set math.equation(numbering: n => "(7.11)")
 $ sum_(cal(B) in frak(B)) frak(m) \( cal(B) \) lt.eq C_K^(upright("box")) / B^2 . $ <eq:boxes-expanded-mass>]

 In particular this constant is independent of $xi$, $theta.alt$, and the total number of boxes. Every tuple in these boxes is a standard path from initial gap $r_0 + 1$, ends at gap at most $K + 2$ for that starting gap, and has its actual final $log_w J gt.eq 3 a_star.op \/ 4$.]
  + #emph[In a regular box, declare an edge a candidate if it is among the last $H_e = ceil.l 2 K_(*) + 10 ceil.r$ positions, is after the isolated position, has multiplicity one, and can satisfy the size bounds in (7.5) for some tuple in the box. There are at most $H_e$ candidates, and every witness for a regular endpoint is among them. Throughout the whole box of each candidate, writing its parent as $d' = p q$ and its prime as $u$, one has 
#[#set math.equation(numbering: n => "(7.12)")
 $ log_w frac(Y, p q) lt.eq 2 K_(*) + 4 \, #h(2em) log_w frac(Y, p q u) gt.eq frac(3 a_star.op, 4) . $ <eq:boxes-candidate-slack>]

 The bins for $p$ and $u$ have lower endpoints $R$ and $U$ satisfying 
#[#set math.equation(numbering: n => "(7.13)")
 $ z^(alpha_min) lt.eq R lt.eq z^(alpha_max) \, #h(2em) w lt.eq U lt.eq w^(2 K_(*) + 4) . $ <eq:boxes-prime-ranges>]

 The choices of $p$, $q$, $u$, and the descendants after this edge are independent under the full-box measure. All their prime factors are disjoint. If $S_q$ is the product of the bin upper endpoints for the factors of $q$, with their specified multiplicities, then 
#[#set math.equation(numbering: n => "(7.14)")
 $ 1 lt.eq S_q / q lt.eq \( 1 + xi \)^(C_(upright("len")) log B) . $ <eq:boxes-sq>]

]
  + #emph[Every regular box has at least $c_7 log w$ search positions, for an absolute $c_7 > 0$ and sufficiently large $z$. These positions have distinct bins. All its nonsearch positions follow all its search positions.]
] <prop:regular-boxes>

#proof[
  We first establish the exclusions leading to (7.8). The compact-history estimate in Proposition 19 permits each geometric exception to be estimated in the tilted prime chain, at a cost at most $C_K B^(- 2)$ times its occurrence probability. Histories with a ratio exceeding $S_(*) = \( log B \)^2$ cost $O_A \( B^(- A) \)$ in the original measure, by Lemma 16. On the remaining histories, Proposition 17 compares the prime chain with the continuous chain up to
  $ N_(*) = O \( \( log B \)^3 \) $
  steps. Its failure probability tends to zero, and its matched states satisfy $\| s - tilde(s) \| lt.eq h_0$ and $\| log \( r \/ tilde(r) \) \| lt.double N_(*) h_0$, with $h_0$ smaller than every fixed negative power of $log B$. These errors remain negligible in all polynomially many opportunities below. We work with the continuous comparison where useful, retaining the indicated slack when returning to prime paths.
  ===== 7.2.1 Length. <length.>
  The iid regeneration cycles from Lemma 9 have finite mean length and positive finite mean log decrement. Their exponential moments imply finite variances, so Chebyshev’s inequality applied to the iid cycle sums gives their respective weak laws. Inverting the positive mean decrement and bounding the last incomplete cycle then gives a positive limiting log decrement per step in probability. Indeed, the largest length among $O \( log B \)$ cycles is $o \( log B \)$ in probability by the exponential moment. The initial segment is uniformly tight for the allowed starting ratios. Choose a fixed $C_(upright("len"))$ larger than twice the reciprocal of this speed. The probability that more than $C_(upright("len")) log B$ steps occur before the accumulated decrement exceeds $log r_0 + O \( 1 \)$ tends to zero. An included compact endpoint has $r_d gt.eq 2$, so its accumulated decrement is at most that quantity. The coupling transfers this conclusion. The excluded harmonic mass is $o \( B^(- 2) \)$.
  ===== 7.2.2 An isolated position. <an-isolated-position.>
  Put $theta = alpha_max \/ 4$. A path from the initial gap to a fixed compact must cross below $theta B$. After the first step, each transition of a standard path leaves at least half of the old gap: an even parent has next exponent at most half its gap, and an odd parent with an admitted even child has next exponent at most one third of its gap. The first step cannot itself make this crossing when $z$ is large. Thus the crossing arrival has
  $ .4 theta B lt.eq r lt.eq theta B . $
  Consider the slightly enlarged gap band $\[ .3 theta B \, 1.1 theta B \]$. By Lemma 12, the probability of any arrived-at state in this band with ratio $s > T$ tends to zero uniformly in $B$ as $T arrow.r oo$. Indeed the expected count is bounded by a constant times the tail integrals of the invariant densities, together with the corresponding first-step density; all these tails tend to zero.
  Choose $T$ so that this probability costs less than $theta.alt \/ 2$ in units of $B^(- 2)$. At the crossing arrival with $s lt.eq T$, its last exponent is $x = r \/ s$, so
  $ frac(.4 theta, T) B lt.eq x lt.eq theta B . $
  Choose $0 < alpha_min < .2 theta \/ T$. The entire bin of this factor then lies in $\[ alpha_min B \, alpha_max B \]$ for large $z$, also after the coupling errors. Designate the first such used bin. Since $alpha_min B arrow.r oo$, its position precedes every possible witnessing edge of Lemma 25. Also $alpha_min B > w^(1 \/ 4) + h$ eventually, so its bin is a search bin.
  ===== 7.2.3 Repeated search bins. <repeated-search-bins.>
  If two positions have the same bin label, some two adjacent positions have that label. Write $x'$ for the earlier exponent, $x$ for the next one, $s = r \/ x'$ for the ratio at their parent, and $t = r \/ x - 1$ for the next ratio. Then
  #[#set math.equation(numbering: n => "(7.15)")
   $ 0 lt.eq t - \( s - 1 \) = r (1 / x - 1 / x') lt.eq frac(s h, x) . $ <eq:boxes-repeat-width>]
  For a search bin, $x gt.eq w^(1 \/ 4)$. On low-state histories, the continuous comparison must therefore draw into a neighborhood of its lower support endpoint of width at most
  $ O (\( S_(*) + 1 \) (h / w^(1 \/ 4) + N_(*) h_0)) . $
  The densities of the kernels in (4.13) on such pieces are bounded by a polynomial in $S_(*)$, as proved in the prime-coupling argument. Summing this conditional probability over at most $N_(*)$ draws gives $o \( 1 \)$. Here every polynomial in $log B$ is negligible compared with $w^(1 \/ 4)$, and the same polynomials times $h_0$ tend to zero. We discard all these repeats.
  ===== 7.2.4 Repeated bins at a possible terminal edge. <repeated-bins-at-a-possible-terminal-edge.>
  Next discard any repetition involving a position with $x_j lt.eq 2 K_(*) + 3$ and $r_(j - 1) lt.eq 2 K_(*) + 5$. It suffices to compare with an adjacent position in the same bin. If that neighbor is the preceding position, the comparing draw is the edge at $j$; if it is the following position, the comparing draw is at $j + 1$. In either case the parent gap is already in a fixed compact. Since all used exponents exceed 1, its ratios and those of the comparing draw are bounded in terms of $K_(*)$. Formula (7.15) now gives a width $O_(K_(*)) \( h \)$, enlarged under coupling to $O_(K_(*)) \( h + N_(*) h_0 \)$. Only boundedly many draws can have parent gap in this compact before cutoff exit, because each such step decreases the gap by more than 1. The kernel densities are bounded there. The probability of this exception is consequently $o_xi \( 1 \)$. This verifies all multiplicity assertions in part (i), and every witness has the required singleton bin because its parent $r lt.eq 2 K_(*) + 5$.
  ===== 7.2.5 Near-threshold even prefixes. <near-threshold-even-prefixes.>
  Discard paths having a nonempty even prefix for which $0 lt.eq r_j - cal(H) \( x_j \) lt.eq 10 Delta$. This event is estimated before imposing the length restriction, so it suffices to bound its probability by $O \( Delta \) + o \( 1 \)$. At its preceding odd state, let the gap be $R$ and the next ratio be $t$. Then $x = R \/ \( t + 1 \)$ and $r_j = R t \/ \( t + 1 \)$. If $x gt.eq 2$,
  $ r_j - cal(H) \( x \) = frac(R \( t - 2 \), t + 1) \, $
  so the allowed ratios lie within $O \( Delta \/ R \)$ of 2. If $1 < x lt.eq 2$,
  $ r_j - cal(H) \( x \) = frac(R \( t - 1 \), t + 1) - 2 . $
  For small $Delta$ this confines $t$ to a fixed neighborhood of $\[ 2 \, 3 \]$, and differentiation in $t$ again gives a derivative comparable to $R$. The allowed width is $O \( Delta \/ R \)$ in this case as well. Both descriptions are valid with one-sided endpoints when the two branches meet at $x = 2$.
  At any such draw the preceding ratio is at most $t + 1$, and hence is bounded by an absolute constant. The kernel density is therefore bounded. In a unit band of $log R$, the number of preceding states having this bounded ratio is deterministically bounded: each such arrived-at state has a log decrement $g \( s \) = log \( 1 + 1 \/ s \)$ bounded below by a positive constant. Thus the conditional widths sum over the bands to
  $ O (Delta sum_(j gt.eq 0) e^(- j)) = O \( Delta \) \, $
  since all possible parent gaps are bounded away from zero. Coupling enlarges each ratio width by $O \( N_(*) h_0 \)$; summing over the $O \( log B \)$ relevant bands gives $o \( 1 \)$. This proves the claimed near-threshold probability bound.
  Combining the exclusions with the compact-history bound proves (7.8), after increasing $C_(upright("th"))$ and using the spare part of $theta.alt$ to absorb any fixed adjustable probability costs. All density, band, and compact-history constants were fixed independently of $xi$.
  ===== 7.2.6 Movement and representative safety. <movement-and-representative-safety.>
  For a tuple of the retained length,
  $ m h lt.eq C_(upright("len")) log B thin frac(log \( 1 + xi \), log w) lt.eq 2 C_(upright("len")) xi = Delta $
  for sufficiently large $z$, since $log B \/ log w arrow.r 1$. This bounds the movement of every prefix gap. The function $cal(H)$ is 2-Lipschitz, proving the threshold movement bound in part (ii). Choose $xi_0$ small enough that
  #[#set math.equation(numbering: n => "(7.16)")
   $ Delta < min { a_star.op \/ 4 \, 1 \/ 4 } quad upright("and") quad Delta + 2 h < 1 $ <eq:boxes-width-requirements>]
  for all sufficiently large $z$. Since also $h = o_xi \( Delta \)$, the clearance in (7.9) leaves more than $3 Delta$ at every representative even prefix. This proves (7.10). In particular these representative checks depend only on the labels of the box.
  ===== 7.2.7 The measure of the full-box enlargement. <the-measure-of-the-full-box-enlargement.>
  Take a box containing an original regular endpoint, and let an arbitrary tuple in that full box be given. At every even prefix the original tuple satisfies $r_j gt.eq cal(H) \( x_j \) gt.eq 2 x_j$. Movement to the new tuple can lose at most $Delta + 2 h$ in the expression $r_j - 2 x_j$. Increasing the initial gap from $r_0$ to $r_0 + 1$ therefore makes every even prefix a valid standard admission. The odd steps impose no extra standard admission test. The endpoint gap for this shifted start is at most $K + Delta + 1 < K + 2$.
  The actual, unshifted endpoint has $v gt.eq a_star.op - Delta gt.eq 3 a_star.op \/ 4$. Thus all enlargements also retain the positive length margin needed later for interval freezing.
  Distinct boxes of a given length have disjoint tuple sets. Although different lengths are counted in the sum of box measures, Proposition 19 bounds precisely the sum of original weights over all standard endpoints in a fixed compact. Apply it from $r_0 + 1$ with ending gap at most $K + 2$. This start has ratio in $\[ 1.99 \, 2.3 \]$ for large $z$, just as required by that proposition. We obtain (7.11) with a constant depending only on this fixed compact and the starting range. No counting factor for the boxes occurs, and this constant is independent of their width or their defining regularity parameters.
  ===== 7.2.8 Candidate edges and independence. <candidate-edges-and-independence.>
  Every witness of a regular endpoint is among its last $H_e$ positions, lies after its isolated position, and has a singleton bin, by the preceding arguments. Hence it is a candidate. If a candidate can satisfy the witness size bounds at one tuple, the gap movement at another tuple is at most $Delta$. The first requirement in (7.16) and $Delta < 1$ give (7.12). The corresponding exponent movement is at most $h < 1$, giving the range for $U$ in (7.13); the range for $R$ follows from the definition of the isolated position.
  Both the isolated bin and the candidate bin have multiplicity one. Moreover, because the labels are ordered and the candidate bin occurs only once, no bin can contain both a factor before that edge and a factor after it. Removing the isolated factor from the parent therefore partitions the remaining choices into disjoint sets of bins for $q$, for $u$, and for its descendants. Their normalized measures are independent by the product description of a full box. They are also independent of the isolated prime. Sorting and distinctness within any other bin do not change this conclusion. Inequality (7.14) follows by multiplying the ratio bound $1 + xi$ at every factor of $q$.
  ===== 7.2.9 The number of search positions. <the-number-of-search-positions.>
  The total exponent contributed by nonsearch positions is at most
  #[#set math.equation(numbering: n => "(7.17)")
   $ C_(upright("len")) log B thin \( w^(1 \/ 4) + h \) = o \( w^(1 \/ 2) \) . $ <eq:boxes-nonsearch-sum>]
  They all occur after the search positions, by decreasing bin order. In one regular tuple in the box, let $m_s$ be the number of search positions. Immediately after its last search factor the gap is at most $K + o \( w^(1 \/ 2) \) lt.eq w^(1 \/ 2)$ for large $z$. Each standard transition retains at least one third of its preceding gap, including the first step for sufficiently large $z$. Since $r_0 gt.eq B$ eventually, this implies
  $ 3^(- m_s) B lt.eq w^(1 \/ 2) \, #h(2em) m_s gt.eq frac(log B - 1 / 2 log w, log 3) . $
  Now $log B \/ log w arrow.r 1$, so the last expression is at least $c_7 log w$ for an absolute positive $c_7$, for example $c_7 = 1 \/ 10$, once $z$ is sufficiently large. The search labels are fixed throughout the full box, and their multiplicities are one. This proves part (v) and completes the proposition. ◻
]

#prodef([Remark 7.3.])[
  Proposition 26 separates the adjustable exceptions from the final width choice. After $K$ and $K_(*)$ are fixed, one first chooses $theta.alt$, $C_(upright("len"))$, and $alpha_min$. The bounds for full-box mass and for compact history events are then fixed independently of $xi$. Consequently a later statement failing on a fraction at most $sigma$ of each full candidate box costs at most
  $ sigma H_e sum_(cal(B) in frak(B)) frak(m) \( cal(B) \) lt.eq sigma H_e C_K^(upright("box")) B^(- 2) . $
  This remains true if the number of boxes grows with $z$ or $xi$. For a singleton bin, count fractions and harmonic fractions differ by a factor at most $1 + xi lt.eq 2$, so bounds conditional on all other factors and measured against all primes in that bin have the same summed interpretation. Finally $xi$ may be chosen sufficiently small to make $C_(upright("th")) Delta$ and all required movement errors small. The prime-count asymptotics are only used after this fixed choice, so their eventual thresholds may depend on $xi$ without changing the constant order.
] <rem:boxes-order-and-sums>

== 8 An inverse estimate for a witnessing edge <sec:inverse>

The exceptional compact nodes will be controlled by varying the isolated prime in a regular box. The first step identifies the only obstruction to this variation: a positive proportion of the relevant primes must share a rational intercept. The use of modular concentration to obtain algebraic structure is related to the inverse-sieve methods of #cite(label("HelfgottVenkatesh2009")) #cite(label("Walsh2012")). More specifically, the small-height polynomial and prime-product strategy is related to Walsh’s algebraicity method #cite(label("Walsh2014")) Section 3. The partial-incidence modular-line form needed in a prime bin, including its uniformity across the independent boxes, is proved here rather than invoked from that work.

#prodef([Definition 8.1.])[
  A prime $p$ #emph[aligns] with a reduced rational $A \/ D$, where $A in bb(Z)$, $D in bb(N)$, and $gcd \( A \, D \) = 1$, if
  $ D a_p equiv A med \( mod med p \) . $
  This condition implies $p divides.not D$. For a squarefree product $q$ of primes carrying prescribed classes, write
  $ q_E \( A \/ D \) = product_(ell divides q\
ell upright(" does not align with ") A \/ D) ell . $
]

Throughout this section put

#[#set math.equation(numbering: n => "(8.1)")
 $ cal(Z) = exp #h(-0.16667em) (frac(L, log L)) . $ <eq:inverse-z>]

As usual, all parameters other than $z$ are fixed before taking a limit in $z$. In particular, a statement valid for every sufficiently small fixed $xi > 0$ allows its eventual lower threshold on $z$ to depend on $xi$.

Fix one candidate edge in a full regular box from 26. Write its parent as $p q$, with $p$ the isolated prime, and denote its edge prime by $u$. Let $cal(P) \, cal(U)$ be their respective prime bins, let $R \, U$ be the lower endpoints of these bins, and put

$ n_p = \# cal(P) \, #h(2em) n_u = \# cal(U) . $

Both bins are right-closed and have upper-to-lower endpoint ratio at most $1 + xi$. Their logarithmic widths are comparable to $xi$; hence, for each fixed $xi > 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ n_p asymp frac(xi R, log R) \, #h(2em) n_u asymp frac(xi U, log U) . $ <eq:inverse-bin-counts>]

The constants here can be chosen uniformly for $0 < xi lt.eq 1$, once $z$ is sufficiently large depending on $xi$.

Let $cal(Q)$ be the set of possible products $q$. Such a product uniquely determines its sorted prime choices. Denote by $S_q$ the product of the upper endpoints of its specified bins, with the prescribed multiplicities; $S_q$ is therefore fixed for the box. The hypotheses supplied by 26 include

#[#set math.equation(numbering: n => "(8.3)")
 $ & z^(alpha_min) lt.eq R lt.eq z^(alpha_max) \, #h(2em) alpha_max = 1 / 100 \, #h(2em) w lt.eq U lt.eq w^(2 K_(*) + 4) \,\
 & log_w frac(Y, p q) lt.eq 2 K_(*) + 4 \, #h(2em) log_w frac(Y, p q u) gt.eq frac(3 a_star.op, 4) \,\
 & 1 lt.eq S_q / q lt.eq \( 1 + xi \)^(C_(upright("len")) log B) . $ <eq:inverse-box-ranges>]

The bins of $p$ and $u$ each have multiplicity one in the full box. Thus the choices of $p \, q \, u$, and all descendants after the edge are independent in the full box, and $p \, u$ divide none of the other products involved. In particular,

$ gcd \( p \, q \) = gcd \( p q \, u \) = 1 . $

Writing $alpha = log R \/ L$, the parent-length bounds imply

#[#set math.equation(numbering: n => "(8.4)")
 $ q = z^(thin 2 - alpha + o \( 1 \)) \, #h(2em) S_q = z^(thin 2 - alpha + o \( 1 \)) \, #h(2em) alpha_min lt.eq alpha lt.eq alpha_max . $ <eq:inverse-q-size>]

All the $o \( 1 \)$’s in this section are uniform over boxes satisfying these fixed-parameter bounds, for each permitted fixed $xi$.

The normalized #emph[harmonic measure] on the box assigns mass proportional to the reciprocal of the product of its chosen primes. On $p \, q \, u$ this is the product measure with respective weights $1 \/ p \, 1 \/ q \, 1 \/ u$. Descendant choices may be integrated out whenever an event depends only on $p \, q \, u$.

#thm([Proposition 8.2.])[
  (Inverse estimate for an edge).  #emph[Fix the parameters in (8.3)– (8.3), the witnessing threshold $delta > 0$, and $0 < sigma < 1$. There are constants $c_p > 0$, a list-size bound $F < oo$, and $xi_(upright("inv")) > 0$, independent of the eventual choice of fixed $0 < xi lt.eq xi_(upright("inv"))$, with the following property for all sufficiently large $z$.]
  #emph[The full candidate box has a list $cal(A)$ of at most $F$ reduced rationals $A \/ D$ satisfying 
#[#set math.equation(numbering: n => "(8.5)")
 $ D lt.eq R cal(Z)^10 \, #h(2em) \| A \| lt.eq S_q R cal(Z)^10 \, #h(2em) \# { p in cal(P) : p upright(" aligns with ") A \/ D } gt.eq c_p n_p . $ <eq:inverse-list>]

 Outside a set of normalized harmonic box measure at most $sigma$, every occurrence of 
#[#set math.equation(numbering: n => "(8.6)")
 $ lr(|N_(p q u) - N_(p q) / u|) > delta thin frac(Y V_0, p q u) $ <eq:inverse-bad-edge>]

 has a rational $A \/ D in cal(A)$ for which 
#[#set math.equation(numbering: n => "(8.7)")
 $ p upright(" aligns with ") A \/ D \, #h(2em) D q_E \( A \/ D \) lt.eq R cal(Z)^10 . $ <eq:inverse-structure>]

 The exceptional measure is relative to the whole box, rather than to the subset on which (8.6) holds.]
] <prop:inverse>

The proof fixes the whole-box rational list before arguing by contradiction. If too many bad edges fail (8.7), sampling their frozen residue tests produces many parent pairs but few permissible slopes. An integer polynomial with small coefficient height then vanishes on the corresponding integer points. The lemma below bounds the contribution of its nonlinear components. A remaining rational line has an intercept in the fixed list, forcing most selected pairs on that line to satisfy (8.7) after all.

The lattice-point estimate below combines algebraic decomposition with Jarník’s convex-arc argument #cite(label("Jarnik1926")) Sections 1–2. We give the proof with explicit degree dependence because the degree grows with the prime bin. The coefficient-independent intersection bound used in its proof is established in Lemma 44.

#thm([Lemma 8.3.])[
  (Degree-uniform nonlinear lattice-point bound).  #emph[Let $P in bb(R) \[ X_1 \, X_2 \]$ be nonzero and of degree at most $D_0 gt.eq 1$, and let $S gt.eq 1$. The number of lattice points in $\[ 0 \, S \]^2$ lying on at least one nonlinear irreducible component of $P = 0$, with irreducibility taken over $bb(C)$, is 
$ O #h(-0.16667em) (D_0^4 \( 1 + S^(2 \/ 3) \)) . $

 The implied constant is absolute, independently of the coefficients of $P$. No bound is asserted for points lying only on line components.]
] <lem:nonlinear-points>

#proof[
  Consider first one nonlinear irreducible factor $Q$ of degree $d$. If $Q$ is not proportional to a real polynomial, $Q$ and its coefficientwise conjugate are distinct irreducible polynomials. Every real zero of $Q$ is a common zero, so Bézout’s theorem gives at most $d^2$ such points.
  Suppose instead that $Q$ has been scaled to have real coefficients. Neither $Q_(X_1)$ nor $Q_(X_2)$ vanishes identically: otherwise irreducibility over $bb(C)$ would force $Q$ to be linear. Their degrees are smaller than $d$, so their intersections with $Q = 0$ give $O \( d^2 \)$ points in total. These include all singularities and all horizontal or vertical tangencies. There are also $O \( d \)$ intersections with the boundary of the square.
  On a smooth graph $X_2 = f \( X_1 \)$ with $Q_(X_2) eq.not 0$, the second derivative vanishes precisely when
  #[#set math.equation(numbering: n => "(8.8)")
   $ cal(I)_Q = Q_(X_1 X_1) Q_(X_2)^(thin 2) - 2 Q_(X_1 X_2) Q_(X_1) Q_(X_2) + Q_(X_2 X_2) Q_(X_1)^(thin 2) = 0 . $ <eq:inverse-inflection>]
  Indeed $f'' = - cal(I)_Q \/ Q_(X_2)^3$ on the graph. If $Q divides.not cal(I)_Q$, Bézout’s theorem adds $O \( d^2 \)$ inflection points, because $deg cal(I)_Q lt.eq 3 d - 4$. If $Q divides cal(I)_Q$, any nonspecial interior smooth graph arc has $f'' = 0$ throughout and therefore lies on a line. Vanishing on that arc would make the line a factor of $Q$, a contradiction. Thus in this latter case all real points in the square are already among the critical or boundary points counted above.
  In the remaining case, mark the abscissae of all critical, boundary, and inflection points, together with $0 \, S$. There are $O \( d^2 \)$ marked abscissae. Between consecutive marked abscissae the interior real zero set is a union of at most $d$ smooth graphs extending across that open interval. To justify extension, the implicit function theorem applies because $Q_(X_2) eq.not 0$; continuation cannot end inside the interval without a critical point or an intersection with the boundary. The bound $d$ follows from the degree of a vertical fiber. Each graph is monotone, and its derivative is strictly monotone, because neither $Q_(X_1)$ nor $cal(I)_Q$ vanishes on it.
  Consider the lattice points of one such graph, ordered by increasing abscissa. Consecutive difference vectors have positive integer first coordinate and distinct slopes, by strict convexity or strict concavity. They are therefore distinct integer vectors. Their total $ell^1$-length is at most $2 S$, since both graph coordinates are monotone and range over intervals of length at most $S$. There are $O \( T^2 \)$ integer vectors of $ell^1$-length at most $T$. Consequently $m$ distinct such vectors have total length $gt.double m^(3 \/ 2)$: take $T$ to be a sufficiently small fixed multiple of $m^(1 \/ 2)$, so that at least half of the vectors have length greater than $T$. It follows that this graph contains $O \( 1 + S^(2 \/ 3) \)$ lattice points.
  The marked vertical fibers contain at most $d$ points each, since an identically vanishing fiber would give a vertical line factor of $Q$. Summing over the $O \( d^3 \)$ graphs and the marked fibers proves the bound $O \( d^3 \( 1 + S^(2 \/ 3) \) \)$ for this component. Finally, sum over the distinct nonlinear factors of $P$. Their degrees sum to at most $D_0$, so the asserted, slightly looser, bound with $D_0^4$ follows. ◻
]

#proof[
  #strong[The fixed whole-box list.] To make the order of choices explicit, choose an integer $h_1$ such that
  $ frac(a_star.op h_1, 2) > 12 \, $
  and set
  #[#set math.equation(numbering: n => "(8.9)")
   $ beta = sigma / 16 \, #h(2em) gamma_(upright("inc")) = beta / 2 (beta / 4)^(h_1) \, #h(2em) c_5 = gamma_(upright("inc")) / 8 \, #h(2em) c_p = gamma_(upright("inc")) / 32 . $ <eq:inverse-fixed-constants>]
  These constants are fixed before $xi$ is chosen and before any failure set, cell, or sample is selected. For each candidate box let $cal(A)$ be the set of #emph[all] reduced rationals satisfying (8.5). This is a finite set by the height restrictions.
  If two distinct list rationals $A_1 \/ D_1 \, A_2 \/ D_2$ align at a prime, that prime divides the nonzero determinant $A_1 D_2 - A_2 D_1$. Its absolute value is at most
  $ 2 S_q R^2 cal(Z)^20 = z^(thin 2 + alpha + o \( 1 \)) . $
  Every prime of $cal(P)$ is at least $z^(alpha_min)$. Thus two distinct rationals have at most $C_(alpha_min)$ common aligning primes, with a fixed constant independent of $xi$. If $M = \# cal(A)$, and $m_p$ counts the list rationals aligning at $p$, Cauchy’s inequality gives
  $ M^2 c_p^2 n_p lt.eq sum_(p in cal(P)) m_p^2 lt.eq M n_p + C_(alpha_min) M \( M - 1 \) . $
  Once $n_p gt.eq 2 C_(alpha_min) \/ c_p^2$, this implies
  $ M lt.eq 2 / c_p^2 . $
  We may therefore take $F = ceil.l 2 \/ c_p^2 ceil.r$. This bound is independent of $xi$; the threshold on $z$ may depend on $xi$ through $n_p$.
  Call a pair $\( p \, q \)$ #emph[structured] if (8.7) holds for some member of this fixed whole-box list. A triple $\( p \, q \, u \)$ is called #emph[bad] if its parent pair is nonstructured and (8.6) holds. Assume, towards a contradiction, that bad triples occupy more than a $sigma$ fraction of the full harmonic box measure. Descendants can now be integrated out.
  #strong[From bad triples to sampled incidences.] We will select a fixed number of edge primes so that many nonstructured parent pairs satisfy all their frozen residue tests, while the total number of permitted slopes over the isolated primes is small. First we restrict $q$ to a sufficiently large cell. For $q in cal(Q)$, let $b_q in \[ 1 \, q \] ∩ bb(Z)$ be its Chinese remainder theorem (CRT) representative for the prescribed hits. Put
  $ M_0 = product_(t lt.eq w) t \, $
  where the product is over primes. By the prime number theorem,
  $ log M_0 = O \( w \) = O #h(-0.16667em) (frac(L, \( log L \)^2)) = o \( log cal(Z) \) . $
  In particular $M_0^2 = cal(Z)^(o \( 1 \))$. Partition $cal(Q)$ into cells by a value interval of ratio at most $1 + xi$, and by the pair $\( q \, b_q \) med mod med M_0$. By (8.3) the number of value intervals needed is $O \( C_(upright("len")) log B + 1 \)$, so the total number of cells is $cal(Z)^(o \( 1 \))$.
  We record the cardinality bound
  #[#set math.equation(numbering: n => "(8.10)")
   $ \# cal(Q) gt.eq S_q / cal(Z)^(o \( 1 \)) . $ <eq:inverse-many-q>]
  Indeed, a bin with upper endpoint $P_j$ and multiplicity $m_j$ contains $gt.double_xi P_j \/ log P_j$ primes. Even in the smallest bin this number is much larger than $C_(upright("len")) log B$, for fixed $xi > 0$ and large $z$. If $n_j$ is its prime count and $k = sum_j m_j lt.eq C_(upright("len")) log B = O \( log L \)$, then
  $ product_j binom(n_j, m_j) gt.eq product_j frac(\( n_j \/ 2 \)^(m_j), m_j !) gt.eq S_q exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] - O_xi \( \( log L \)^2 \) #scale(x: 120%, y: 120%)[\)] . $
  The first inequality holds once $n_j gt.eq 2 m_j$. In the second, the losses from $log P_j$, fixed bin-width constants, and the factorials have total logarithm $O_xi \( \( log L \)^2 \)$. Unique factorization identifies these choices with distinct $q$’s. Since $\( log L \)^2 = o \( log cal(Z) \)$, this proves (8.10).
  Discard cells containing fewer than $S_q \/ cal(Z)$ points. They contain at most $S_q cal(Z)^(- 1 + o \( 1 \))$ points in total. The weights $1 \/ q$ vary globally by at most $\( 1 + xi \)^k = cal(Z)^(o \( 1 \))$, so their total normalized harmonic mass is $cal(Z)^(- 1 + o \( 1 \)) = o \( 1 \)$. For sufficiently large $z$, a retained initial cell $cal(C)$ therefore has conditional harmonic density of bad triples at least $sigma \/ 2$, and
  #[#set math.equation(numbering: n => "(8.11)")
   $ \# cal(C) gt.eq S_q \/ cal(Z) . $ <eq:inverse-cell-size>]
  Within $cal(P) \, cal(C) \, cal(U)$ each reciprocal weight varies by a factor at most $1 + xi$. As long as $xi lt.eq 1$, converting their product measure to uniform counting costs at most $\( 1 + xi \)^3 lt.eq 8$. The count density of bad triples in $cal(P) times cal(C) times cal(U)$ is consequently at least $beta = sigma \/ 16$, with $beta$ fixed in (8.9).
  #emph[Freezing the parent interval.] We now place the small-prime count on an interval that is fixed as $q$ varies within $cal(C)$. For fixed $p in cal(P)$ and $q in cal(C)$, put
  #[#set math.equation(numbering: n => "(8.12)")
   $ s_p \( q \) = \( a_p - b_q \) overline(q) med \( mod med p \) \, #h(2em) 0 lt.eq s_p \( q \) < p . $ <eq:inverse-s>]
  The parent hit progression is
  $ n = b_q + q \( s_p \( q \) + p j \) \, #h(2em) j gt.eq 0 . $
  The initial hit belongs to $\[ 1 \, p q \]$, so the condition $j gt.eq 0$ indexes exactly the positive hits. The allowed $j$’s form an initial interval of integers whose length is $Y \/ \( p q \) + O \( 1 \)$.
  If the value range of $cal(C)$ is contained in $\[ Q_(-) \, Q_(+) \]$, with $Q_(+) \/ Q_(-) lt.eq 1 + xi$, choose a common initial integer interval $I_p$ of length
  $ J = J_p = ⌊frac(Y, p Q_(+))⌋ . $
  Its symmetric difference with the actual interval has length $O \( xi J + 1 \)$. The classes to avoid at primes $t lt.eq w$ on $I_p$ depend only on $p$, the fixed cell residues, and the value $v = s_p \( q \) med mod med M_0$. This uses the invertibility of $p q$ at every such prime. For each possible $v$, let $m = m_(p \, v)$ count the survivors on $I_p$ for that pattern, and let $m_(e \, u) = m_(p \, v \; e \, u)$ count those with $j equiv e med \( mod med u \)$.
  The upper bounds in 5 give, uniformly in the patterns,
  #[#set math.equation(numbering: n => "(8.13)")
   $ m lt.double J V_0 . $ <eq:inverse-m-upper>]
  They also show that replacing intervals changes the survivor count by $O \( xi J V_0 \)$, and the count in any specified $j$-class modulo $u$ by $O \( xi J V_0 \/ u \)$. For the latter assertion, enclose the difference subsequence in an interval of length comparable to $xi J \/ u$. By (8.3), for fixed $xi > 0$ this length is eventually much larger than $w^(a_star.op \/ 2)$; the corresponding progression step $p q u$ is a unit at every prime at most $w$. The same reasoning applies to the unconditioned difference interval. The upper-sieve constants are independent of fixed $xi$, although the threshold at which these lengths suffice may depend on $xi$.
  The edge hit selects the class
  #[#set math.equation(numbering: n => "(8.14)")
   $ e_u = e_u \( p \, q \) = \( a_u - b_q - q s_p \( q \) \) overline(p q) med \( mod med u \) . $ <eq:inverse-edge-class>]
  Choose $xi_(upright("inv")) lt.eq 1$ sufficiently small, depending on $delta$ and the fixed upper-sieve constants. The preceding replacement estimates show that (8.6) implies
  #[#set math.equation(numbering: n => "(8.15)")
   $ \| m_(e_u \, u) - m \/ u \| > delta' frac(J V_0, u) \, $ <eq:inverse-frozen-deviation>]
  for a fixed $delta' > 0$. For example, after decreasing $xi_(upright("inv"))$ the choice $delta' = delta \/ 4$ suffices. Define $E_(p \, u) \( v \)$ to be the set of residues $e med mod med u$ satisfying (8.15). These sets depend on $p$, the initial cell, and $v$, and no independence in those variables is asserted.
  #emph[The large-sieve saving.] We bound the average proportion of residues passing an exceptional test. For fixed $p \, v$, let $cal(S) subset I_p$ be the surviving sequence, so $\# cal(S) = m$, and put
  $ S \( theta \) = sum_(j in cal(S)) exp \( 2 pi i j theta \) . $
  Additive orthogonality gives the exact identity
  #[#set math.equation(numbering: n => "(8.16)")
   $ u sum_(e med mod med u) \( m_(e \, u) - m \/ u \)^2 = sum_(a = 1)^(u - 1) \| S \( a \/ u \) \|^2 . $ <eq:inverse-orthogonality>]
  For prime $u$, all fractions $a \/ u$ on the right are reduced. Fractions belonging to distinct such primes are distinct, and the whole family is separated modulo one by at least $\( \( 1 + xi \) U \)^(- 2) gt.eq \( 4 U^2 \)^(- 1)$. Lemma 43 therefore gives
  $ sum_(u in cal(U)) u sum_(e med mod med u) \( m_(e \, u) - m \/ u \)^2 lt.double \( J + U^2 \) m \; $
  see #cite(label("MontgomeryVaughan1973")) #cite(label("VaughanLargeSieve")). No condition other than interval support is imposed on the sequence $cal(S)$. Each exceptional residue contributes more than $\( delta' J V_0 \)^2 \/ u$ to the corresponding left side. Using (8.13), we obtain
  #[#set math.equation(numbering: n => "(8.17)")
   $ 1 / n_u sum_(u in cal(U)) frac(\| E_(p \, u) \( v \) \|, u) & lt.double frac(\( J + U^2 \) m, n_u \( J V_0 \)^2)\
 & lt.double_xi \( log w \)^2 (1 / U + U / J) lt.eq w^(- a_star.op \/ 2) . $ <eq:inverse-large-sieve>]
  For the last inequality, $log U = O_(K_(*)) \( log w \)$, $V_0 asymp 1 \/ log w$, $U gt.eq w$, and $J \/ U gt.double w^(3 a_star.op \/ 4)$. The fixed factor depending on $xi$, as well as the logarithmic factors, is absorbed between the exponents $3 a_star.op \/ 4$ and $a_star.op \/ 2$ by taking $z$ large. This proves (8.17) uniformly in $p \, v$ and the chosen cell, in exactly the fixed-$xi$ sense required here.
  #emph[Selecting the sampled relation.] For $\( p \, q \) in cal(P) times cal(C)$, let $f \( p \, q \)$ be the fraction of $u in cal(U)$ for which $\( p \, q \, u \)$ is bad. Its uniform count average is at least $beta$. At least a $beta \/ 2$ fraction of pairs therefore have $f \( p \, q \) gt.eq beta \/ 2$: the complementary bound follows at once from $0 lt.eq f lt.eq 1$.
  Sample an ordered $h_1$-tuple of distinct primes $upright(bold(u)) = \( u_1 \, dots.h \, u_(h_1) \)$ uniformly from $cal(U)$. For this sample define the pair relation
  $ cal(I)_(upright(bold(u))) = { \( p \, q \) in cal(P) times cal(C) : & med \( p \, q \) upright(" is nonstructured, and")\
 & med e_(u_i) \( p \, q \) in E_(p \, u_i) \( s_p \( q \) med mod med M_0 \) upright(" for every ") 1 lt.eq i lt.eq h_1 #scale(x: 120%, y: 120%)[}] \, $
  and put $I \( upright(bold(u)) \) = \# cal(I)_(upright(bold(u))) \/ \( n_p \# cal(C) \)$. Members of $cal(I)_(upright(bold(u)))$ will be called #emph[sampled incidences]. By (8.15), a pair for which every sampled triple is bad belongs to $cal(I)_(upright(bold(u)))$. This implication suffices for the lower bound on its expected density. Once $n_u gt.eq 4 h_1 \/ beta$, each pair with $f \( p \, q \) gt.eq beta \/ 2$ has probability at least $\( beta \/ 4 \)^(h_1)$ that all sampled primes witness (8.6). Consequently
  #[#set math.equation(numbering: n => "(8.18)")
   $ bb(E) I \( upright(bold(u)) \) gt.eq beta / 2 (beta / 4)^(h_1) = gamma_(upright("inc")) . $ <eq:inverse-incidence-expectation>]
  Write $W = product_(i = 1)^(h_1) u_i$ and refine $cal(C)$ by fixing $\( q \, b_q \) med mod med W$. For any such refinement $cal(C)'$, and fixed $p$, let $cal(T)_p \( cal(C)' \) subset \[ 0 \, p \) ∩ bb(Z)$ consist of those integers $s$ satisfying all the sampled tests, using $v = s med mod med M_0$. For a fixed $v$, (8.14) is an invertible affine function of $s med mod med u_i$, with coefficient $- overline(p) med mod med u_i$. Its other coefficients are fixed by the refinement. Thus it restricts $s med mod med u_i$ to exactly $\| E_(p \, u_i) \( v \) \|$ residues. CRT, applied also to $s equiv v med \( mod med M_0 \)$, gives
  #[#set math.equation(numbering: n => "(8.19)")
   $ \| cal(T)_p \( cal(C)' \) \| & lt.eq K_p \( upright(bold(u)) \) \,\
K_p \( upright(bold(u)) \) & := p / M_0 sum_(v med mod med M_0) product_(i = 1)^(h_1) frac(\| E_(p \, u_i) \( v \) \|, u_i) + M_0 W . $ <eq:inverse-crt-slopes>]
  Indeed, for each $v$ the number of allowed residues modulo $M_0 W$ is $product_i \| E_(p \, u_i) \( v \) \|$; an interval of length $p$ contains at most $p \/ \( M_0 W \) + 1$ integers in each residue. Summing the rounding terms over $v$ gives at most $M_0 W$. All CRT factors are coprime, and every sampled $u_i$ is coprime to $p q$ by the singleton-bin hypotheses. Crucially, the upper bound $K_p \( upright(bold(u)) \)$ is independent of the refinement centers.
  For any numbers $0 lt.eq t_u lt.eq 1$, their product averaged over distinct ordered $h_1$-tuples is at most
  $ frac(n_u^(h_1), \( n_u \)_(h_1)) (1 / n_u sum_(u in cal(U)) t_u)^(h_1) \, #h(2em) \( n_u \)_(h_1) = n_u \( n_u - 1 \) dots.h.c \( n_u - h_1 + 1 \) . $
  The prefactor tends to one since $h_1$ is fixed. Applying (8.17) for each $p \, v$ in (8.19) yields
  #[#set math.equation(numbering: n => "(8.20)")
   $ bb(E) frac(K_p \( upright(bold(u)) \), p) lt.eq 2 w^(- a_star.op h_1 \/ 2) + z^(- c') $ <eq:inverse-slopes-expectation>]
  for some fixed $c' > 0$. Here $M_0 W = z^(o \( 1 \))$, since $h_1$ and the edge-bin exponent range are fixed, whereas $p gt.eq z^(alpha_min)$. Since $p \/ R lt.eq 1 + xi lt.eq 2$, the same estimates imply
  $ bb(E) (frac(1, n_p R) sum_(p in cal(P)) K_p \( upright(bold(u)) \)) lt.double w^(- a_star.op h_1 \/ 2) + z^(- c') = o \( L^(- 6) \) . $
  The last step uses $w = L \/ \( log L \)^2$ and $a_star.op h_1 \/ 2 > 12$. By Markov’s inequality, the probability that $sum_p K_p > n_p R \/ L^6$ is $o \( 1 \)$. As $0 lt.eq I \( upright(bold(u)) \) lt.eq 1$, removing those samples changes the expectation in (8.18) by $o \( 1 \)$. Hence there exists a sample for which
  #[#set math.equation(numbering: n => "(8.21)")
   $ I \( upright(bold(u)) \) gt.eq gamma_(upright("inc")) \/ 2 \, #h(2em) sum_(p in cal(P)) K_p \( upright(bold(u)) \) lt.eq frac(n_p R, L^6) . $ <eq:inverse-good-sample>]
  Fix this sample and abbreviate its bounds by $K_p$.
  There are at most $W^2 = w^(O \( 1 \)) = cal(Z)^(o \( 1 \))$ refined cells. Discard those with fewer than $S_q \/ cal(Z)^3$ points. Relative to $cal(C)$, whose size satisfies (8.11), their total count fraction is at most $W^2 \/ cal(Z)^2 = o \( 1 \)$. Thus some remaining refinement $cal(C)'$ satisfies
  #[#set math.equation(numbering: n => "(8.22)")
   $ \# cal(C)' gt.eq S_q \/ cal(Z)^3 $ <eq:inverse-refined-size>]
  and satisfies
  $ frac(\# #scale(x: 120%, y: 120%)[\(] cal(I)_(upright(bold(u))) ∩ \( cal(P) times cal(C)' \) #scale(x: 120%, y: 120%)[\)], n_p \# cal(C)') gt.eq gamma_(upright("inc")) / 4 . $
  At least a $gamma_(upright("inc")) \/ 8 = c_5$ fraction of its $q$-points consequently have at least $c_5 n_p$ primes $p$ with $\( p \, q \) in cal(I)_(upright(bold(u)))$. Call these points #emph[rich], and let $cal(X)$ be their set of integer points $\( q \, b_q \)$. We have therefore fixed a sample, a refinement $cal(C)'$, and slope sets $cal(T)_p \( cal(C)' \)$ with $\# cal(T)_p \( cal(C)' \) lt.eq K_p$. For large $z$, their bounds are
  #[#set math.equation(numbering: n => "(8.23)")
   $ \| cal(X) \| gt.eq S_q / cal(Z)^4 \,\
\# { p in cal(P) : \( p \, q \) in cal(I)_(upright(bold(u))) } gt.eq c_5 n_p quad #scale(x: 120%, y: 120%)[\(] \( q \, b_q \) in cal(X) #scale(x: 120%, y: 120%)[\)] \,\
sum_(p in cal(P)) K_p lt.eq frac(n_p R, L^6) . $ <eq:inverse-rich-points>]
  The point-count bound follows from (8.22); the slope sum is (8.21). Every sampled incidence with $q in cal(C)'$ uses the slope $s_p \( q \) in cal(T)_p \( cal(C)' \)$. The constants in these bounds are precisely those fixed in (8.9), without choosing them after the list or after the failure set.
  #strong[Algebraic concentration and the fixed list.] We will find a rational line containing many rich points and show that its intercept belongs to $cal(A)$. Almost all sampled incidences on that line will then be structured, giving the contradiction. First the small slope sum lets us construct a common polynomial equation for the rich points. Put
  $ D_0 = ⌊R / L^2⌋ \, #h(2em) N_0 = binom(D_0 + 2, 2) . $
  We construct a nonzero integer polynomial $P \( X_1 \, X_2 \)$ of total degree at most $D_0$ that modulo each $p in cal(P)$ vanishes identically on every line
  $ X_2 = a_p - s X_1 \, #h(2em) s in cal(T)_p \( cal(C)' \) . $
  The coefficients of the polynomial after substitution in a line give at most $D_0 + 1$ homogeneous congruences. The lattice of coefficient vectors in $bb(Z)^(N_0)$ satisfying all these congruences consequently has index at most
  $ product_(p in cal(P)) p^(\( D_0 + 1 \) \| cal(T)_p \( cal(C)' \) \|) lt.eq exp #h(-0.16667em) (\( D_0 + 1 \) sum_(p in cal(P)) K_p log p) . $
  Dependencies among congruences can only decrease this index. Applying the pigeonhole principle to a box of coefficient vectors, and taking the difference of two vectors in the same lattice coset, gives a nonzero $P$ with maximum absolute coefficient $H_P$ satisfying
  #[#set math.equation(numbering: n => "(8.24)")
   $ log \( 2 H_P \) lt.double 1 + 1 / D_0 sum_(p in cal(P)) K_p log p = O \( R \/ L^4 \) = o \( R \) . $ <eq:inverse-polynomial-height>]
  For the final equality use (8.21), $n_p lt.double R \/ log R$, and $log p asymp log R$. More explicitly, a coefficient box with more vectors than the lattice index has two in the same coset; taking side length equal to the ceiling of the index to the power $1 \/ N_0$ proves the stated height bound.
  All the points $\( q \, b_q \)$ under consideration lie in $\[ 0 \, S_q \]^2$. If $P \( q \, b_q \) eq.not 0$, then
  #[#set math.equation(numbering: n => "(8.25)")
   $ log \| P \( q \, b_q \) \| lt.eq log N_0 + log H_P + D_0 log max \( 1 \, S_q \) = O \( R \/ L \) = o \( R \) . $ <eq:inverse-polynomial-value>]
  At a rich point the integer $P \( q \, b_q \)$ is divisible by every prime of its at least $c_5 n_p$ distinct sampled incidences. Their product has logarithm at least
  $ c_5 n_p log R gt.double_(xi \, c_5) R . $
  For each fixed $xi > 0$, this contradicts (8.25) unless $P \( q \, b_q \) = 0$. Every point of $cal(X)$ therefore lies on the zero set of $P$.
  #emph[Extraction of a rational line.] By 30, the number of points of $cal(X)$ on nonlinear irreducible components is at most
  $ O #h(-0.16667em) (D_0^4 \( 1 + S_q^(2 \/ 3) \)) = o \( S_q \/ cal(Z)^4 \) . $
  To check this uniformly, the principal ratio is bounded by
  $ R^4 S_q^(- 1 \/ 3) cal(Z)^4 = z^(\( 13 alpha - 2 \) \/ 3 + o \( 1 \)) = o \( 1 \) \, $
  using $alpha lt.eq 1 \/ 100$; the term without $S_q^(2 \/ 3)$ is smaller. There are at most $D_0$ line components. Discard any line containing fewer than
  $ N_min = frac(S_q, R cal(Z)^6) $
  selected rich points. All discarded lines together contain at most
  $ D_0 N_min lt.eq frac(S_q, L^2 cal(Z)^6) = o \( S_q \/ cal(Z)^4 \) $
  such points. Vertical lines have at most one selected point because $q$ uniquely determines $b_q$, and $N_min arrow.r oo$. A line not proportional to a real line likewise has at most one real point. Thus a remaining nonvertical real line contains $N gt.eq N_min$ selected rich points.
  Two distinct lattice points on this line give it a rational slope. It can be written
  #[#set math.equation(numbering: n => "(8.26)")
   $ D' b_q = A' q + B' \, #h(2em) D' > 0 \, quad gcd \( A' \, D' \) = 1 \, quad A' \, B' \, D' in bb(Z) . $ <eq:inverse-rich-line>]
  For its lattice points, consecutive distinct $q$’s differ by an integer multiple of $D'$. Their $b_q$’s differ by the corresponding multiple of $A'$. Their coordinate ranges are at most $S_q$, so
  #[#set math.equation(numbering: n => "(8.27)")
   $ D' \, \| A' \| lt.double S_q / N lt.double R cal(Z)^6 \, #h(2em) \| B' \| lt.double S_q R cal(Z)^6 . $ <eq:inverse-line-heights>]
  The assertion for $A'$ also holds for a horizontal line, when $A' = 0 \, D' = 1$.
  Reduce the intercept $B' \/ D'$ to $A \/ D$, putting
  $ g = gcd \( B' \, D' \) \, #h(2em) D' = g D \, #h(2em) B' = g A . $
  Reduction of (8.26) modulo $g$ gives $g divides A' q$, and $gcd \( A' \, g \) = 1$; hence
  #[#set math.equation(numbering: n => "(8.28)")
   $ g divides q quad upright("at every selected point of the line") . $ <eq:inverse-g-divides>]
  If a prime $ell divides q$ does not divide $g$, division of (8.26) by $g$ modulo $ell$ gives
  $ D b_q equiv A med \( mod med ell \) . $
  Because $b_q equiv a_ell med \( mod med ell \)$, the prime $ell$ aligns with the intercept. This congruence also implies $ell divides.not D$, since $gcd \( A \, D \) = 1$. All nonaligned prime factors of $q$ therefore divide $g$. As $q$ is squarefree and $g divides q$, their product divides $g$, and
  #[#set math.equation(numbering: n => "(8.29)")
   $ D q_E \( A \/ D \) lt.eq D g = D' lt.double R cal(Z)^6 . $ <eq:inverse-line-structure>]
  Neither $D$ nor $D'$ has been assumed squarefree. In particular, primes common to $D$ and $g$ cause no difficulty in (8.29). The height bounds in (8.5) follow from (8.27) with ample room in the additional $cal(Z)^4$ factors. It remains to establish the alignment-count condition for this intercept.
  #emph[The intercept belongs to the list.] We use the pair-counting principle of Gallagher’s larger sieve #cite(label("Gallagher1971")); see #cite(label("HelfgottVenkatesh2009")) Section 2 for the difference-product argument. Ignore the isolated-bin primes dividing $D'$. There are at most
  $ frac(log D', log R) = O \( 1 \) $
  of them by (8.27). Let $cal(P)_(upright("un"))$ consist of the other primes of $cal(P)$ that do not align with $A \/ D = B' \/ D'$. For $p in cal(P)_(upright("un"))$, substitution of the line equation into the incidence equation gives
  $ \( A' \/ D' + s \) q equiv a_p - B' \/ D' med \( mod med p \) \, #h(2em) s in cal(T)_p \( cal(C)' \) . $
  The right side is nonzero because $p$ is unaligned. Each allowed $s$ therefore admits either no solution or exactly one class of $q med mod med p$. Thus those of the $N$ selected points on the line that satisfy the sampled constraints for $p$ occupy at most $K_p$ classes of $q med mod med p$. Let their number be $N_p$, and let $n_(p \, c)$ denote the numbers in these occupied classes. Here $N_p$ counts all tested points on the line, so it dominates the number of pairs $\( p \, q \) in cal(I)_(upright(bold(u)))$ there; the latter pairs also require the parent to be nonstructured.
  For two distinct selected points, $q_1 - q_2 eq.not 0$ and $\| q_1 - q_2 \| lt.eq S_q$. The number of isolated-bin primes dividing this difference is at most
  $ frac(log S_q, log R) = O_(alpha_min) \( 1 \) . $
  Counting ordered equal-class pairs, with the diagonal separated, therefore gives
  $ sum_(p in cal(P)_(upright("un"))) sum_c n_(p \, c)^2 lt.eq C_(alpha_min) N^2 + sum_(p in cal(P)_(upright("un"))) N_p . $
  Cauchy’s inequality, first over all occupied classes and primes, yields
  #[#set math.equation(numbering: n => "(8.30)")
   $ (sum_(p in cal(P)_(upright("un"))) N_p)^2 lt.eq (sum_(p in cal(P)) K_p) (C_(alpha_min) N^2 + sum_(p in cal(P)_(upright("un"))) N_p) . $ <eq:inverse-collisions>]
  Use $sum_p N_p lt.eq n_p N$, the good-sample bound, and $N gt.eq S_q \/ \( R cal(Z)^6 \)$. After division by $n_p^2 N^2$, the right side of (8.30) is
  #[#set math.equation(numbering: n => "(8.31)")
   $ O #h(-0.16667em) (frac(R, n_p L^6) + frac(R, N L^6)) = O_xi \( L^(- 5) \) + o \( 1 \) = o \( 1 \) . $ <eq:inverse-collision-normalization>]
  For the first term use (8.2) and $log R lt.eq L$; for the second use $R^2 cal(Z)^6 \/ S_q = z^(3 alpha - 2 + o \( 1 \)) = o \( 1 \)$. Thus unaligned primes supply only $o \( n_p N \)$ tested pairs on the line, and hence at most this many sampled incidences.
  Each of its $N$ selected points has at least $c_5 n_p$ sampled incidences by (8.23). The ignored divisors of $D'$ supply at most $O \( N \)$. The remaining incidences force at least $\( c_5 - o \( 1 \) \) n_p$ primes of $cal(P)$ to align with the intercept. Since $c_p = c_5 \/ 4$, it satisfies the last condition in (8.5), and hence $A \/ D in cal(A)$. At every selected point of this line, (8.29) implies the required bound $D q_E \( A \/ D \) lt.eq R cal(Z)^10$ for large $z$. Every tested pair on the line whose isolated prime aligns is therefore structured. Since all members of $cal(I)_(upright(bold(u)))$ are nonstructured, the sampled incidences must consequently come from the unaligned primes or the $O \( 1 \)$ ignored primes; those contribute only $o \( n_p N \) + O \( N \)$, contradicting their lower bound $c_5 n_p N$.
  This contradiction proves the exceptional-fraction assertion. The constants in (8.9) and the list bound were fixed before $xi$. Only interval freezing required an upper restriction $xi lt.eq xi_(upright("inv"))$; all losses that depend on a fixed positive $xi$, including prime counts, polynomial divisibility, and (8.31), are absorbed by taking $z$ sufficiently large afterwards. This completes the prescribed order of choices. ◻
]

== 9 Variance after the inverse estimate <sec:variance>

The inverse estimate leaves a fixed finite list of rational alignments in each candidate box. Fix one rational and every endpoint factor except the isolated prime. We average over the whole isolated bin by temporarily imposing the aligned hit class at each prime; at the primes that actually align, this gives the original hit progression. We show that a positive fraction of these progressions can have large small-prime sieve errors only when two arithmetic parameters of the family are small. One controls the nonaligned factors; the other controls the translation of the progression after the aligned factors are removed. The auxiliary probability models used below are explicit dominating measures; we do not assume that the residue classes selected by the actual primes are independent.

=== 9.1 Arithmetic coordinates <arithmetic-coordinates>

Fix a candidate box from 26, and write $cal(P)$ for its isolated prime bin, $R$ for the lower endpoint of that bin, and $n_p = \# cal(P)$. Thus

$ z^(alpha_min) lt.eq R lt.eq z^(alpha_max) \, #h(2em) n_p asymp frac(xi R, log R) . $

The constants in comparisons of this form can be taken independent of sufficiently small fixed $xi$; the threshold on $z$ may depend on $xi$. Fix all prime choices in a final compact endpoint except the isolated $p in cal(P)$, and write

$ d = p q_f . $

Fix also one reduced rational $A \/ D$, $D > 0$, from the candidate list in 29. All of $q_f \, A \, D$ remain fixed as $p$ varies. As before, let $q_(f \, E)$ be the product of the nonaligned prime factors of $q_f$, and put $q_(f \, A) = q_f \/ q_(f \, E)$.

If the structured-parent conclusion of 29 holds, the product of the candidate edge and the later factors is at most a fixed power of $w$, by the candidate parent-gap bound. Hence, for large $z$,

#[#set math.equation(numbering: n => "(9.1)")
 $ H := D q_(f \, E) lt.eq R cal(Z)^11 \, #h(2em) \| A \| lt.eq S_q R cal(Z)^10 . $ <eq:variance-structure-size>]

Here $q$ is the product of the other factors at the candidate parent, $S_q$ is the corresponding product of bin upper endpoints, and

$ q_f gt.eq q \, #h(2em) S_q \/ q lt.eq cal(Z)^(o \( 1 \)) . $

The additional factor $cal(Z)$ in the bound for $H$ absorbs any fixed power of $w$.

Let $b in \[ 1 \, q_f \]$ be the integer CRT representative of the hit conditions at the primes of $q_f$, and define

#[#set math.equation(numbering: n => "(9.2)")
 $ C_0 = frac(D b - A, q_(f \, A)) \, #h(2em) T = max (H \, frac(\| C_0 \|, R)) . $ <eq:variance-effective>]

The numerator is divisible by every aligned factor of $q_f$, so $C_0$ is an integer. To see the role of these parameters, write the hit progression at $q_f$ as $n = b + q_f v$. Then

$ D n - A = q_(f \, A) \( C_0 + H v \) . $

Thus removing the aligned factors leaves an arithmetic progression of step $H$ and initial value $C_0$. Alignment at the isolated prime will require this remaining value to be divisible by $p$. The scale $T$ measures both its step and the size of its initial value after division by a prime in the bin $p asymp R$.

We also have

#[#set math.equation(numbering: n => "(9.3)")
 $ \( C_0 \, H \) = 1 . $ <eq:variance-unit>]

Indeed, $q_(f \, A)$ is coprime to $D q_(f \, E)$. At a prime $t divides D$, reducedness gives $D b - A equiv - A equiv.not 0 med \( mod med t \)$; at a prime $t divides q_(f \, E)$ not dividing $D$, nonalignment gives $D b - A equiv D a_t - A equiv.not 0 med \( mod med t \)$. This also covers common prime divisors of $D$ and $q_(f \, E)$. Prime powers in $D$ cause no further restriction. In particular, $C_0 = 0$ can occur only when $H = 1$. The height bound gives

$ frac(\| C_0 \|, R H) = frac(\| D b - A \|, R D q_f) lt.eq 1 / R + frac(\| A \|, R D q_f) lt.eq 1 / R + S_q / q cal(Z)^10 \, $

and therefore

#[#set math.equation(numbering: n => "(9.4)")
 $ T \/ H lt.eq cal(Z)^12 $ <eq:variance-effective-ratio>]

for sufficiently large $z$.

For any $p in cal(P)$ not dividing $H$, temporarily impose the aligned class at $p$, whether or not its actual prescribed class aligns. Since $p divides.not q_f$, the additional hit condition is $C_0 + H v equiv 0 med \( mod med p \)$. There is a unique $k in { 0 \, dots.h \, p - 1 }$ satisfying this congruence, and all its solutions have the form $v = k + p j$. Define

$ m_0 = frac(C_0 + H k, p) . $

Equivalently, $m_0$ is the unique integer satisfying

#[#set math.equation(numbering: n => "(9.5)")
 $ m_0 in \[ C_0 \/ p \, C_0 \/ p + H \) \, #h(2em) p m_0 equiv C_0 med \( mod med H \) . $ <eq:variance-m-coordinate>]

The interval has length $H$, and the congruence fixes one residue modulo $H$, which also verifies uniqueness in these coordinates. The resulting simultaneous hit progression is exactly

#[#set math.equation(numbering: n => "(9.6)")
 $ n = b + q_f \( k + p j \) \, #h(2em) j gt.eq 0 \, #h(2em) D n - A = p q_(f \, A) \( m_0 + H j \) . $ <eq:variance-progression>]

Its initial representative belongs to $\[ 1 \, p q_f \]$, so the allowable $j$’s in $1 lt.eq n lt.eq Y$ form an initial integer interval of length $Y \/ \( p q_f \) + O \( 1 \)$.

An included endpoint has $J_d gt.eq w^(a_star.op)$. The within-box movement of $log_w J_d$ is at most $Delta$, by 26. Taking $Delta < a_star.op \/ 4$, every endpoint choice in the full box therefore has $J_d gt.eq w^(3 a_star.op \/ 4)$. Set

$ J = ⌊frac(Y, \( 1 + xi \) R q_f)⌋ \, #h(2em) cal(J) = { 0 \, dots.h \, J - 1 } . $

Since $p lt.eq \( 1 + xi \) R$ and the initial representative lies in $\[ 1 \, p q_f \]$, this interval is contained in every allowed $j$-interval. Its cardinality satisfies

#[#set math.equation(numbering: n => "(9.7)")
 $ J asymp frac(Y, R q_f) \, #h(2em) J gt.eq w^(a_star.op \/ 2 + delta_0) \, $ <eq:variance-common-interval>]

where, for example, one can take $delta_0 = a_star.op \/ 8$ for large $z$. The symmetric difference has length $O \( xi J + 1 \)$. An enclosing progression piece of length comparable to $xi J$ has, by 5, at most $O \( xi J V_0 \)$ small-prime survivors. For fixed $xi > 0$, its length eventually exceeds $w^(a_star.op \/ 2)$; this is why the slack in (9.7) is retained. The constant in this survivor bound is independent of sufficiently small fixed $xi$, although the eventual threshold may depend on it. The reference count changes by $O \( xi J V_0 \)$ as well. Consequently, when $xi$ is small relative to a fixed $epsilon > 0$, it suffices to control

#[#set math.equation(numbering: n => "(9.8)")
 $ lr(|S - J V_0|) > epsilon / 2 J V_0 \, $ <eq:variance-bad-common>]

where $S$ counts the small-prime survivors on $cal(J)$.

For a prime $t lt.eq w$, the avoidance condition on $cal(J)$ is

#[#set math.equation(numbering: n => "(9.9)")
 $ cases(delim: "{", p q_(f \, A) \( m_0 + H j \) equiv.not D a_t - A med \( mod med t \) \, & t divides.not H \,, k + p j equiv.not \( a_t - b \) overline(q_f) med \( mod med t \) \, & t divides H .) $ <eq:variance-avoidance>]

In the first line $t divides.not D$, so multiplication by $D$ is reversible. In the second line $q_f$ is invertible modulo $t$. All factors of $q_f$ exceed $w$; hence the primes $t lt.eq w$ dividing $H$ are precisely the small primes dividing $D$. Put

#[#set math.equation(numbering: n => "(9.10)")
 $ T_0 = product_(t lt.eq w\
t divides H) t \, #h(2em) T_1 = product_(t lt.eq w\
t divides.not H) t . $ <eq:variance-small-products>]

Thus $\( T_1 \, H T_0 \) = 1$, every prime of $T_0$ divides $H$, and

#[#set math.equation(numbering: n => "(9.11)")
 $ T_0 T_1 = exp \( O \( w \) \) = R^(o \( 1 \)) . $ <eq:variance-pattern-size>]

=== 9.2 Variance of independent classes <variance-of-independent-classes>

The next second-moment argument is a truncated, two-point form of mean-one singular-series averaging; compare Gallagher #cite(label("Gallagher1976")) equation (3) and Section 2. We include the proof to establish the uniform range of interval lengths and the stability under changes of measure needed below.

#thm([Lemma 9.1.])[
  #emph[Choose, independently at each prime $t lt.eq w$, one uniformly distributed forbidden residue class. Let $S$ count the integers in an interval $cal(J)$ of cardinality $J$ that avoid all these classes. For every fixed $delta > 0$, uniformly for $J gt.eq w^delta$, 
$ bb(E) S = J V_0 \, #h(2em) bb(E) \( S - J V_0 \)^2 = o \( \( J V_0 \)^2 \) quad \( w arrow.r oo \) . $

 The assertion has the following stable version. Let $mu$ be a finite positive measure carrying indicators $I_j$, $j in cal(J)$, and let $S = sum_j I_j$. Suppose, with an absolute fixed implied constant, 
$ mu \( Omega \) = 1 + O \( zeta \) \, #h(2em) integral I_j thin d mu = V_0 \( 1 + O \( zeta \) \) \, $

 and, for distinct $i \, j$, the joint probability has the upper bound 
$ integral I_i I_j thin d mu lt.eq \( 1 + O \( zeta \) \) thin bb(P)_(upright("ind")) \( I_i = I_j = 1 \) . $

 Here $bb(P)_(upright("ind"))$ denotes the independent forbidden-class model in the first part of the lemma. A zero probability on the right requires exact zero on the left. For $0 lt.eq zeta lt.eq 1 \/ 2$, 
$ integral \( S - J V_0 \)^2 thin d mu lt.double #scale(x: 120%, y: 120%)[\(] zeta + o \( 1 \) #scale(x: 120%, y: 120%)[\)] \( J V_0 \)^2 \, $

 uniformly in the same range of $J$.]
] <lem:random-variance>

#proof[
  The single-point survival probability is $V_0$. For a nonzero spacing $h$, the pair probability divided by $V_0^2$ equals
  #[#set math.equation(numbering: n => "(9.12)")
   $ 2 upright(bold(1))_(2 divides h) product_(2 < t lt.eq w) (1 - frac(1, \( t - 1 \)^2)) product_(2 < t lt.eq w\
t divides h) (1 + frac(1, t - 2)) . $ <eq:variance-pair-factor>]
  At $t divides h$ the two positions have one forbidden residue between them; at $t divides.not h$ they have two. This proves the formula, including the parity factor.
  Expand the last product in (9.12) over odd squarefree $l$, with coefficients
  $ lambda_l = product_(t divides l) frac(1, t - 2) . $
  For each fixed $l$, the triangular average of $2 upright(bold(1))_(2 l divides h)$ is
  $ sum_(1 lt.eq h < J) frac(2 \( J - h \), J^2) thin 2 upright(bold(1))_(2 l divides h) arrow.r 1 / l . $
  The same average is $O \( 1 \/ l \)$ for every $l \, J$. Moreover,
  $ sum_(l gt.eq 1\
l med upright(o d d med a n d med s q u a r e f r e e)) lambda_l / l = product_(t > 2) (1 + frac(1, t \( t - 2 \))) < oo . $
  Dominated convergence applies even though the available primes increase with $w$. The limiting triangular average of (9.12) is 1, because
  $ product_(t > 2) (1 - frac(1, \( t - 1 \)^2)) product_(t > 2) (1 + frac(1, t \( t - 2 \))) = 1 . $
  The convergence is uniform for $J gt.eq w^delta$: first truncate the convergent divisor series at fixed $l$, and then use $J arrow.r oo$ uniformly in this range. The diagonal contribution to $bb(E) S^2 \/ \( J V_0 \)^2$ is $1 \/ \( J V_0 \) = o \( 1 \)$, by Mertens’ theorem. This proves the independent-model assertion.
  For the stable version, sum the assumed pair upper bounds and the single-point bounds to obtain
  $ integral S^2 thin d mu lt.eq \( 1 + O \( zeta \) + o \( 1 \) \) \( J V_0 \)^2 . $
  Use also the lower bound for $integral S thin d mu$ and the upper bound for $mu \( Omega \)$ in the identity
  $ integral \( S - J V_0 \)^2 thin d mu = integral S^2 thin d mu - 2 J V_0 integral S thin d mu + \( J V_0 \)^2 mu \( Omega \) . $
  This gives the stated result without normalizing $mu$. ◻
]

=== 9.3 The effective-size alternative <the-effective-size-alternative>

#thm([Proposition 9.2.])[
  #emph[Fix the compact-box parameters, the inverse-estimate parameters and a relative-error threshold $epsilon > 0$. For every fixed $sigma_2 > 0$ there is a fixed sufficiently large $C_s$, independent of sufficiently small fixed $xi$, with the following property. For every candidate box, every choice of its factors other than the isolated prime, and every rational on its fixed candidate list for which (9.1) holds, suppose 
$ T > w^(C_s) . $

 For sufficiently large $z$, fewer than $sigma_2 n_p$ primes $p in cal(P)$ both align to $A \/ D$ and satisfy 
$ \| N_(p q_f) \/ mu_(p q_f) - 1 \| > epsilon . $

 The estimate is uniform in the box, the fixed prime choices, the rational and the forbidden classes. The threshold on $z$ may depend on fixed $xi$. The fraction is measured against all primes of $cal(P)$.]
] <prop:structured-variance>

#proof[
  It is enough to impose the aligned hit at every $p$ hypothetically and bound (9.8). The primes dividing $H$ may be discarded: there are $O \( 1 \)$ of them in $cal(P)$, since $H lt.eq R cal(Z)^11$, and their fraction tends to zero. For $H lt.eq R^(4 \/ 5)$, Brun–Titchmarsh controls each residue pattern after we fix $m_0$: the possible primes lie in a progression of modulus $H T_0 T_1$. The condition that $T$ is large then gives a long enough interval in $m_0$ for its small-prime conditions to have the required first and second moments. For larger $H$, we instead count integer pairs $\( p \, m_0 \)$ on a modular hyperbola and then sieve the $p$-coordinate. This gives domination by the uniform distribution on all small-prime patterns. In both ranges the target is a small exceptional fraction among all primes of the isolated bin.
  ===== 9.3.1 The range $H lt.eq R^(4 \/ 5)$. <the-range-hle-r45.>
  As $p$ varies in $cal(P)$, the coordinate $m_0$ lies in an enclosing interval $cal(I)$ of length
  #[#set math.equation(numbering: n => "(9.13)")
   $ Y_1 asymp H + xi \| C_0 \| \/ R \, #h(2em) \( m_0 \, H \) = 1 . $ <eq:variance-small-rectangle>]
  For a fixed $m_0$, possible $p$’s lie in an interval of length at most a constant times
  $ X_1 = min (xi R \, frac(R^2 H, \| C_0 \|)) \, $
  using the first entry if $C_0 = 0$. Indeed, $C_0 \/ p$ must lie in an interval of length $H$, while its derivative has magnitude comparable to $\| C_0 \| \/ R^2$ on the bin. This argument is unchanged when $C_0$ is negative. Writing $c = \| C_0 \| \/ R$, the two cases $c lt.eq H \/ xi$ and $c > H \/ xi$ give
  #[#set math.equation(numbering: n => "(9.14)")
   $ X_1 Y_1 lt.double xi R H \, #h(2em) Y_1 gt.double xi T \, #h(2em) X_1 gt.eq R \/ cal(Z)^(O \( 1 \)) . $ <eq:variance-small-area>]
  The last inequality follows from (9.4); fixed factors depending on $xi$ are harmless here.
  Specify a unit pattern for $p med mod med T_1$ and an arbitrary pattern for $k med mod med T_0$. Together with fixed $m_0$, these conditions specify one unit class for $p$ modulo $H T_0 T_1$: the condition at $H T_0$ is
  $ p m_0 equiv C_0 + H k med \( mod med H T_0 \) . $
  Both $m_0$ and the right side are units modulo $H T_0$, and $T_1$ is coprime to this modulus. In particular,
  $ phi \( H T_0 T_1 \) = phi \( H \) T_0 phi \( T_1 \) . $
  Since $H T_0 T_1 lt.eq R^(4 \/ 5 + o \( 1 \))$ and $X_1 = R^(1 - o \( 1 \))$, Brun–Titchmarsh, in the form of 4, bounds the number of primes for each such choice by
  #[#set math.equation(numbering: n => "(9.15)")
   $ lt.double frac(X_1, log R thin phi \( H \) T_0 phi \( T_1 \)) . $ <eq:variance-bt>]
  We may enclose a shorter actual interval by one of the displayed upper-bound length before applying the theorem.
  Define a positive measure on choices consisting of an integer $m in cal(I)$, $\( m \, H \) = 1$, a unit $p$-pattern modulo $T_1$, and an arbitrary $k$-pattern modulo $T_0$, as follows:
  #[#set math.equation(numbering: n => "(9.16)")
   $ upright("weight of each ") m = frac(H, phi \( H \) Y_1) \, quad p med mod med T_1 upright(" and ") k med mod med T_0 upright(" independent and uniform") . $ <eq:variance-small-measure>]
  The number of the latter patterns is $T_0 phi \( T_1 \)$. Dividing (9.15) by $n_p gt.double xi R \/ log R$, and using (9.14), shows that the fraction of actual primes whose associated choices lie in any event is at most a fixed absolute constant times the measure of that event. This constant is independent of sufficiently small fixed $xi$. Each actual prime has one associated $m_0$, so this upper count introduces no missing multiplicity.
  We verify the hypotheses of the stable part of 31 for the measure (9.16). Take one or two fixed $j$’s and let $nu_t in { 1 \, 2 }$ be the number of their distinct residues modulo $t$. At $t divides T_0$, reducing the congruence for $p$ modulo $t$ shows that $p med mod med t$ is already determined by $m$, independently of the lift $k med mod med t$. Uniform $k med mod med t$ in the second line of (9.9) therefore gives exactly the joint factor $1 - nu_t \/ t$.
  At primes $t divides T_1$, condition on the unit pattern $p med mod med T_1$. The first line of (9.9), as a condition on $m$, excludes exactly $nu_t$ residue classes, since $H$ is invertible there. For a squarefree product $l$ of these primes, counting the intersection of its bad classes together with $\( m \, H \) = 1$ gives
  #[#set math.equation(numbering: n => "(9.17)")
   $ Y_1 frac(phi \( H \), H) product_(t divides l) nu_t / t + O (tau \( H \) product_(t divides l) nu_t) . $ <eq:variance-small-intersections>]
  To see this, expand the coprimality condition over squarefree divisors of $H$. Each chosen combination of classes modulo $l$ combines with each divisor condition by CRT, because $\( l \, H \) = 1$; the interval count has error $O \( 1 \)$. This gives both the main term and the error in (9.17).
  Fix a small $zeta > 0$. Apply 3 at level $w^(A_1)$, first choosing the fixed $A_1$ large enough that its fundamental-lemma error is smaller than a prescribed constant times $zeta$. If a local product is zero, the conditions are exactly empty and need no sieve estimate. Otherwise the possible prime 2 has density at most $1 \/ 2$, and all other densities are at most $2 \/ t$, as required. For some fixed $M > 0$, chosen after $A_1$, the remainder sum is $O \( tau \( H \) w^M \)$. Since $H lt.double Y_1$, the elementary divisor and totient bounds give
  $ tau \( H \) frac(H, phi \( H \)) lt.double Y_1^(1 \/ 4) . $
  Every nonzero surviving product is $gt.double \( log w \)^(- 2)$. Thus the relative remainder is bounded by a constant times
  $ frac(tau \( H \) H, Y_1 phi \( H \)) w^M \( log w \)^2 & lt.double Y_1^(- 3 \/ 4) w^M \( log w \)^2\
 & lt.double_xi w^(M - 3 C_s \/ 4) \( log w \)^2 = o \( 1 \) \, $
  because $Y_1 gt.double xi T > xi w^(C_s)$ and we may choose $C_s > 2 M + 10$. Thus $A_1$, then $M$, then $C_s$ are fixed before the eventual choice of $xi$. These estimates are uniform in the pattern, the positions, the interval location and $H$; a fixed small $xi$ changes only the threshold on $z$.
  After multiplication by the normalization in (9.16), the single-point and pair probabilities thus equal their independent-model values with relative error $O \( zeta \) + o \( 1 \)$, whenever those values are nonzero. Factors at $T_0$ are exact. The total mass is $1 + o \( 1 \)$, either by the same argument with no bad classes or by the elementary count
  $ \# { m in cal(I) : \( m \, H \) = 1 } = Y_1 phi \( H \) \/ H + O \( tau \( H \) \) . $
  The stable variance lemma and Chebyshev’s inequality show that the measure of (9.8) is $O_epsilon \( zeta \) + o \( 1 \)$. Choose $zeta$ sufficiently small in terms of $sigma_2 \, epsilon$ and the domination constant. This proves the desired prime fraction bound in the first range.
  ===== 9.3.2 The range $R^(4 \/ 5) < H lt.eq R cal(Z)^11$. <the-range-r45hle-rmathcal-z11.>
  Partition $cal(P)$’s real bin into equal-length blocks so that the variation of $C_0 \/ p$ in each block is at most $H$. By (9.4), this requires at most $cal(Z)^(O \( 1 \)) = R^(o \( 1 \))$ blocks. For a block of length $X$, the possible $m_0$’s lie in an interval of length $Y_2 lt.eq 3 H$. We upper count all pairs in this rectangle with a full small-prime pattern
  #[#set math.equation(numbering: n => "(9.18)")
   $ p equiv p_0 med \( mod med T_0 \) \, quad k equiv k_0 med \( mod med T_0 \) \, #h(2em) p equiv p_1 med \( mod med T_1 \) \, quad m_0 equiv m_1 med \( mod med T_1 \) \, $ <eq:variance-full-pattern>]
  where $p_0 \, p_1$ are units and $k_0 \, m_1$ are arbitrary. The number of such patterns is
  #[#set math.equation(numbering: n => "(9.19)")
   $ M_(upright("pat")) = T_0 phi \( T_0 \) T_1 phi \( T_1 \) = R^(o \( 1 \)) . $ <eq:variance-pattern-count>]
  Set $N = H T_0$. The hyperbola congruence on this rectangle is
  $ p m_0 equiv C_0 + H k_0 med \( mod med N \) . $
  Its right side is a unit by (9.3).
  For any squarefree $l lt.eq R^(1 \/ 10)$ coprime to $H T_1$, the completion lemma proved in the appendix, 40, gives the count with $l divides p$ as
  #[#set math.equation(numbering: n => "(9.20)")
   $ frac(X Y_2 phi \( N \), l T_1^2 N^2 phi \( T_0 \)) + O \( R^(7 \/ 10 + o \( 1 \)) \) . $ <eq:variance-hyperbola-count>]
  This is uniform in the block, its location, the pattern and $l$. For clarity about the exponent, the lemma’s explicit error is bounded by
  $ N^(1 \/ 2 + o \( 1 \)) T_0^(1 \/ 2) (1 + X / N + Y_2 / N) . $
  Since $R^(4 \/ 5) < N lt.eq R^(1 + o \( 1 \))$, $X lt.double R$, $Y_2 lt.eq 3 H lt.eq 3 N$, and $T_0 = R^(o \( 1 \))$, this is in fact $O \( R^(3 \/ 5 + o \( 1 \)) \)$. We use the weaker error in (9.20) to leave slack in subsequent sums.
  Sieve the $p$-coordinate of this nonnegative sequence of pairs for an upper bound on primes. Exclude primes at most $R^(c_6)$ not dividing $H T_1$, where fixed $c_6 > 0$ is sufficiently small, and use level $R^(1 \/ 10)$ in 3. The intersection density supplied by (9.20) is $1 \/ l$. The primes dividing $H T_1$ are already excluded from the $p$-coordinate by the unit conditions. The main sieve product is at most
  #[#set math.equation(numbering: n => "(9.21)")
   $ lt.double frac(1, log R) frac(H, phi \( H \)) frac(T_1, phi \( T_1 \)) . $ <eq:variance-large-sieve-product>]
  Including factors of $H$ larger than the sieve cutoff only increases this upper bound. The fundamental-lemma parameter is $\( 1 \/ 10 \) \/ c_6$, so a fixed small choice of $c_6$ suffices.
  The weighted sum of the errors in (9.20) over $l lt.eq R^(1 \/ 10)$ is $R^(4 \/ 5 + o \( 1 \))$, and in particular is $O \( R^(9 \/ 10) \)$ for large $z$. Because every prime of $T_0$ divides $H$, $phi \( N \) = phi \( H \) T_0$. Multiplying the main term at $l = 1$ by (9.21) and using $Y_2 lt.eq 3 H$ therefore gives, for each pattern and block,
  #[#set math.equation(numbering: n => "(9.22)")
   $ lt.double frac(X, log R thin T_0 phi \( T_0 \) T_1 phi \( T_1 \)) + O \( R^(9 \/ 10) \) . $ <eq:variance-pattern-primes>]
  There are $R^(o \( 1 \))$ blocks and $R^(o \( 1 \))$ patterns, so all error terms together are
  $ R^(9 \/ 10 + o \( 1 \)) = o \( n_p \) . $
  Here division by $n_p asymp xi R \/ log R$ is harmless for each fixed $xi > 0$. Summing the main term over the blocks uses $sum X asymp xi R$. Thus the fraction of actual primes associated to any set of bad full patterns is bounded by a fixed constant times its fraction among all $M_(upright("pat"))$ patterns, plus $o \( 1 \)$. The bound counts pairs, which is sufficient: every actual prime has exactly one $m_0$ from (9.5).
  Under independent uniform choices in (9.18), the forbidden $j$-classes in (9.9) are exactly independent and uniform. Conditional on the unit patterns, use uniform $k_0 med mod med t$ at each $t divides T_0$; at the other primes use uniform $m_1 med mod med t$. The coefficients of these variables are units. CRT supplies independence across the primes. The event (9.8) depends only on this full pattern and on the already fixed $cal(J) \, q_f \, A \, D \, b$. By 31, its uniform-pattern fraction is $o \( 1 \)$. The domination just proved gives the required prime fraction bound in the second range.
  Finally, the first range chose $zeta$, then $A_1$, then $C_s$; the second range needs no further increase of $C_s$. These choices are independent of sufficiently small fixed $xi$. Choose $xi$ small enough for the earlier interval freezing and then let $z$ tend to infinity. This proves all asserted uniformities. ◻
]

=== 9.4 Hard endpoints and global eligibility <hard-endpoints-and-global-eligibility>

#thm([Corollary 9.3.])[
  #emph[Fix the compact range and $epsilon > 0$. For every prescribed positive $rho$, the inverse exception parameter and then the variance exception parameter can be chosen so that, for a fixed $C_s$ independent of sufficiently small fixed $xi$, the following holds for all sufficiently large $z$. Consider the actual included regular compact endpoints covered by the full boxes of 26. Except for a set of these endpoints of total harmonic mass at most $rho B^(- 2)$, every such bad endpoint 
$ \| N_d \/ mu_d - 1 \| > epsilon $

 has a witnessing candidate and a rational on that candidate’s fixed list for which the parent is structured, the isolated prime aligns, and 
#[#set math.equation(numbering: n => "(9.23)")
 $ D q_(f \, E) lt.eq w^(C_s) \, #h(2em) \| C_0 \| \/ R lt.eq w^(C_s) . $ <eq:variance-hard>]

 For each such endpoint all its prime factors with exponent $x \( t \) > C_s$ align to this same rational, including the isolated prime. The rational satisfies the global bounds 
#[#set math.equation(numbering: n => "(9.24)")
 $ D lt.eq w^(C_s) \, #h(2em) \| A \| lt.eq Y w^(C_s + 2) . $ <eq:variance-global-height>]

 The enlarged full boxes are used only to dominate measure: the assertion concerns the actual included endpoints, rather than every tuple in those enlarged boxes. The exceptional mass can be bounded before choosing $xi$; only the eventual threshold on $z$ is allowed to depend on fixed $xi$.]
] <cor:hard-endpoints>

#proof[
  Every actual included bad endpoint under consideration has a witness from the bounded candidate set, by Lemma 7.1, Proposition 7.2. For each candidate, 29 costs at most a prescribed $sigma$ fraction of its full harmonic box and supplies a fixed list of at most $F$ rationals. Both $F$ and the list definition are independent of the choice of the isolated prime.
  To apply 32, fix all the other prime choices and one rational on this list. Then $H \, C_0 \, T$ are fixed as $p$ varies. If the structured-parent condition is possible in this slice, (9.1) holds throughout the fixed slice. When $T > w^(C_s)$, the proposition bounds all bad aligning $p$’s, and hence also those that supply the particular witness. Since the isolated bin has multiplicity one, its prime choice is independent of all the other bin choices in full-box measure. The weights $1 \/ p$ vary by a bounded factor within this bin, uniformly for sufficiently small $xi$. Therefore the count bound $sigma_2 n_p$ converts to at most $C sigma_2$ of its harmonic measure, with fixed $C$.
  Union over the list and over the at most $H_e$ candidates bounds the discarded fraction of each full box by
  $ H_e \( sigma + C F sigma_2 \) . $
  The total enlarged-box mass is at most $C'_K B^(- 2)$, where $C'_K$ is independent of sufficiently small $xi$, by 26. First choose $sigma$ sufficiently small; this fixes $F$. Then choose $sigma_2$ sufficiently small in terms of $F$ and $rho$, and finally choose $C_s$ from 32. This makes the discarded mass at most $rho B^(- 2)$, without multiplying by the number of boxes. For every remaining bad endpoint, some structured rational has $T lt.eq w^(C_s)$, which is (9.23).
  The bound on $H$ controls the nonaligned factors. Each nonaligned prime factor of $q_f$ divides $q_(f \, E) lt.eq w^(C_s)$, so it is at most $w^(C_s)$. The isolated prime already aligns by the structured-parent conclusion; its exponent tends to infinity, and in particular exceeds $C_s$. This proves the alignment assertion. The bound on $\| C_0 \| \/ R$ controls the numerator of the rational on a scale common to all boxes. We have $b lt.eq q_f$, $q_(f \, A) lt.eq q_f$, $R lt.eq p$, and $p q_f = d lt.eq Y$, since these are included endpoints with $J_d > 1$. Consequently,
  $ \| A \| lt.eq D q_f + \| C_0 \| q_(f \, A) lt.eq w^(C_s) q_f \( 1 + R \) lt.eq 2 Y w^(C_s) . $
  This implies the second inequality of (9.24) for large $z$; the first follows directly from (9.23). ◻
]

== 10 Stops for endpoints with small effective size <sec:stops>

The inverse and variance estimates leave compact endpoints whose large prime factors all align to a rational of small effective size. We now stop the tree earlier on such branches. At these stops we compare the exact survivor counts with their reference subtrees after averaging over one large prime. All prime cutoffs at a nonempty node in this section are strict: if its last prime is $P$, the local survivor count avoids the forbidden classes at the primes $t < P$.

Fix the exponent $C_s$ supplied by 33. The parameters of the regular boxes, including $C_(upright("len"))$, are also regarded as fixed. The bin width $xi$ will be chosen sufficiently small only after the other fixed parameters of this section. As before, let $h asymp xi \/ log w$ be the exponent width of a bin and put

$ Delta = 2 C_(upright("len")) xi . $

The representative of a bin is its right endpoint in exponent coordinates. By 26, the movement of any prefix gap within a box of length at most $C_(upright("len")) log B$ is at most $Delta$, for sufficiently large $z$.

=== 10.1 Owners, tags, and a stopping rule <owners-tags-and-a-stopping-rule>

#prodef([Definition 10.1.])[
  A reduced rational $A \/ D$, with $D > 0$, is #emph[eligible] if
  #[#set math.equation(numbering: n => "(10.1)")
   $ D lt.eq w^(C_s) \, #h(2em) \| A \| lt.eq Y w^(C_s + 2) . $ <eq:stops-eligible>]
  Fix a constant $eta > 0$, to be bounded by an absolute constant below. A search bin has an #emph[owner] if some eligible rational aligns to at least a $1 - eta$ fraction of its primes, by prime count. The owner is that rational. Along a descending-prime path, its #emph[tag prime] is the first search-bin factor that aligns to the owner of its bin, if such a factor occurs. Its #emph[tag rational] is this owner and is retained for the rest of the path.
] <def:stops-owner>

The owner is unique for all sufficiently large $z$, provided $eta < 1 \/ 2$. Indeed, if $A_1 \/ D_1 eq.not A_2 \/ D_2$ are eligible, every prime aligning to both divides the nonzero integer $A_1 D_2 - A_2 D_1$, whose absolute value is at most

$ 2 Y w^(2 C_s + 2) = z^(2 + o \( 1 \)) . $

Consequently, in a bin with lower prime endpoint $R$, their common aligning primes number at most

#[#set math.equation(numbering: n => "(10.2)")
 $ O (frac(L, log R) + 1) . $ <eq:stops-overlap>]

For a search bin, $log R gt.eq w^(1 \/ 4) log w$, while its prime count is $asymp xi R \/ log R$. The bound in (10.2) is a uniformly negligible fraction of this count. Two subsets of relative size at least $1 - eta$ would have an intersection of relative size at least $1 - 2 eta$, proving uniqueness. Also, every prime of a search bin eventually exceeds every eligible denominator.

Choose fixed constants $b_0 \, b_1$ with $b_1 > b_0$, taking $b_0$ sufficiently large compared with $C_s + 1$. Further conditions on these constants will be stated below. For a prefix with bin representatives $x_1^(upright("rep")) \, dots.h \, x_j^(upright("rep"))$, write

$ r_j^(upright("rep")) = r_0 - sum_(i = 1)^j x_i^(upright("rep")) . $

#prodef([Definition 10.2.])[
  An included, nonempty, even node is a #emph[stop] if it is the first node along its branch satisfying all the following conditions:
  + Its length is at most $C_(upright("len")) log B$. Its tag has been attained, the tag bin has multiplicity one in this prefix, and every prime of the prefix aligns to its tag rational.
  + Every nonempty even prefix ending at position $j$ satisfies
    #[#set math.equation(numbering: n => "(10.3)")
     $ r_j^(upright("rep")) gt.eq cal(H) \( x_j^(upright("rep")) \) + 3 Delta . $ <eq:stops-safety>]
  + At the present node, its last representative exponent and representative ratio satisfy
    #[#set math.equation(numbering: n => "(10.4)")
     $ b_0 lt.eq x_j^(upright("rep")) lt.eq b_1 \, #h(2em) 2.06 lt.eq r_j^(upright("rep")) \/ x_j^(upright("rep")) lt.eq 2.16 . $ <eq:stops-window>]
  The empty root is not subjected to (10.3).
] <def:stops-rule>

This is a prefix-free choice of lower nodes. The rule applies to the entire included tree; the inverse and variance exceptions classify endpoints but do not restrict this rule. The representative safety condition ensures that varying prime choices inside their bins, while preserving multiplicities and distinctness, preserves admission of all even prefixes by (3.3). One may see this directly from the right-endpoint convention: the actual gap is at least the representative gap and the actual last exponent is at most its representative. Alternatively, the movement bound and the $2$-Lipschitz property of $cal(H)$ give the same conclusion with room to spare. Odd children of lower nodes require no admission test.

For sufficiently small fixed $xi$, every stop has actual last exponent $b$ and actual ratio satisfying

#[#set math.equation(numbering: n => "(10.5)")
 $ b_0 - o \( 1 \) lt.eq b lt.eq b_1 \, #h(2em) 2.04 lt.eq r_d \/ b lt.eq 2.18 . $ <eq:stops-actual-window>]

Here and throughout this section, the eventual bounds may depend on all the fixed constants, including $xi$. The tag prime lies in a search bin, whose exponent tends to infinity. Thus it is different from the last prime $P = w^b$ at every stop, once $z$ is sufficiently large.

=== 10.2 The average over a large prime bin <the-average-over-a-large-prime-bin>

At a stop, we will fix all prime factors except the tag prime. The arithmetic estimate below first lets that prime range over its whole bin, imposing the aligned hit class even where the actual class does not align. Its lower average and absolute individual upper bound will then permit removal of the small nonaligning subset.

For a prime $P$, write

$ V_(upright("all")) \( P \) = product_(t < P) (1 - 1 / t) \, $

where $t$ ranges over primes.

#thm([Lemma 10.3.])[
  (Average for an aligned progression family).  #emph[Fix $C_s$. Take $b_0$ sufficiently large in terms of $C_s$, and let $b_1 > b_0$ be fixed. For every sufficiently small fixed $xi > 0$, the following holds for all sufficiently large $z$. Let $A \/ D$ be eligible in the sense of (10.1), let $P = w^b$ be a prime with $b in \[ b_0 - 1 \, b_1 \]$, and let $q'$ be a squarefree product of primes at most $z$ whose least prime factor is $P$ and all of whose prime factors align to $A \/ D$. Let $cal(P)$ be a search bin, none of whose primes divides $q'$. Suppose that, for every $p in cal(P)$, 
#[#set math.equation(numbering: n => "(10.6)")
 $ J_p = frac(Y, p q') \, #h(2em) 2.03 lt.eq log_P J_p lt.eq 2.19 . $ <eq:stops-length-exponents>]

 Define $T_p$ to count the integers $1 lt.eq n lt.eq Y$ satisfying $D n equiv A med \( mod med p q' \)$ and avoiding the prescribed classes at every prime $t < P$. Then 
#[#set math.equation(numbering: n => "(10.7)")
 $ sum_(p in cal(P)) T_p gt.eq .39 V_(upright("all")) \( P \) sum_(p in cal(P)) J_p . $ <eq:stops-all-primes-lower>]

 There is also an absolute constant $C_U$, independent of $C_s \, b_0 \, b_1$ and of sufficiently small fixed $xi$, such that 
#[#set math.equation(numbering: n => "(10.8)")
 $ T_p lt.eq C_U J_p V_(upright("all")) \( P \) #h(2em) \( p in cal(P) \) . $ <eq:stops-individual-upper>]

 Both estimates are uniform in the eligible rational, the bin, the product $q'$, and the prescribed residue classes.]
] <lem:stops-aligned-average>

The lower-bound proof writes $D n - A = p q' m$ and counts integers $m = plus.minus d_0 ell'$ with $d_0 lt.eq P^.95$ and $ell' > P$ prime. The prime factors of $d_0$ are chosen among the nonaligned primes less than $P$ that do not divide $D$. For such a prime $t$, divisibility of $d_0$ by $t$ makes the avoidance condition automatic; otherwise one of the $t - 1$ unit classes for the varying prime is forbidden. We isolate the resulting estimate before proving the arithmetic lemma. For any subset $E$ of the primes less than $P$, put

#[#set math.equation(numbering: n => "(10.9)")
 $ W_E \( d_0 \) = product_(t in E\
t divides.not d_0) (1 - frac(1, t - 1)) . $ <eq:stops-euler-weight>]

The next lemma is uniform in $E$, including when $2 in E$.

#thm([Lemma 10.4.])[
  #emph[Uniformly over all subsets $E$ of the primes less than $P$, 
#[#set math.equation(numbering: n => "(10.10)")
 $ sum_(d_0 lt.eq P^.95\
t divides d_0 arrow.r.double t in E) frac(W_E \( d_0 \), d_0) gt.eq e^(- gamma) \( .94 - o \( 1 \) \) . $ <eq:stops-euler-lower>]

]
] <lem:stops-euler-probability>

#proof[
  For $t in E$, let $V_t$ be independent nonnegative integer-valued random variables with probabilities
  $ bb(P) \( V_t = 0 \) = frac(t - 2, t - 1) \, #h(2em) bb(P) \( V_t = j \) = t^(- j) quad \( j gt.eq 1 \) . $
  These masses sum to one, and the probability that $product_(t in E) t^(V_t) = d_0$ is exactly $W_E \( d_0 \) \/ d_0$. This interpretation includes $t = 2$: the mass at zero is then zero and $sum_(j gt.eq 1) 2^(- j) = 1$. In particular the zero factors in (10.9) cause no exception to the probability interpretation.
  Let $U_t$ instead have the ordinary geometric probabilities $bb(P) \( U_t = j \) = \( 1 - 1 \/ t \) t^(- j)$ for $j gt.eq 0$. For $j gt.eq 1$,
  $ bb(P) \( V_t gt.eq j \) = frac(t^(1 - j), t - 1) gt.eq t^(- j) = bb(P) \( U_t gt.eq j \) . $
  Couple $U_t \, V_t$ monotonically, independently over $t$. Their mean difference is
  $ bb(E) \( V_t - U_t \) = frac(t, \( t - 1 \)^2) - frac(1, t - 1) = frac(1, \( t - 1 \)^2) . $
  It follows that the excess log-product $Z_E = sum_(t in E) \( V_t - U_t \) log t$ has uniformly bounded mean, since $sum_t log t \/ \( t - 1 \)^2 < oo$. Extend the independent ordinary variables to all primes $t < P$. Then
  $ product_(t in E) t^(U_t) lt.eq product_(t < P) t^(U_t) . $
  The latter product has mass $V_(upright("all")) \( P \) \/ n$ at every integer $n$ composed of primes below $P$. Every $n lt.eq P^.94$ has this property, so
  $ bb(P) (product_(t < P) t^(U_t) lt.eq P^.94) = V_(upright("all")) \( P \) sum_(n lt.eq P^.94) 1 / n = e^(- gamma) \( .94 + o \( 1 \) \) . $
  By Markov’s inequality, $bb(P) \( Z_E > .01 log P \) = O \( 1 \/ log P \)$, uniformly in $E$. Outside this exception the preceding event implies $product_(t in E) t^(V_t) lt.eq P^.95$. Subtracting the exceptional probability proves (10.10); no independence between these last two events is required. ◻
]

#proof[
  Every prime in the search bin eventually exceeds both $D$ and $P$. The alignment of the prime factors of $q'$ implies $\( D \, q' \) = 1$; hence $\( D \, p q' \) = 1$ for every $p in cal(P)$. The hypothetical hit condition and integrality of $n$ are therefore equivalent to
  #[#set math.equation(numbering: n => "(10.11)")
   $ D n - A = p q' m \, #h(2em) 1 lt.eq frac(A + p q' m, D) lt.eq Y \, #h(2em) p q' m equiv - A med \( mod med D \) . $ <eq:stops-m-coordinate>]
  We count a subfamily of these integers in which $m$ has one prime factor exceeding $P$. Averaging over $p$ then imposes the remaining avoidance conditions.
  ===== 10.2.1 A common interval for the auxiliary integer. <a-common-interval-for-the-auxiliary-integer.>
  Partition $cal(P)$ into $ceil.l w^(2 C_s + 10) ceil.r$ equal-length subbins in prime coordinates. In one such subbin let $R'$ be its lower endpoint, let $V$ be its length, and put
  $ J^compose = frac(Y, R' q') \, #h(2em) s^compose = log_P J^compose . $
  Uniformly over these subbins,
  #[#set math.equation(numbering: n => "(10.12)")
   $ V / R' asymp xi w^(- 2 C_s - 10) \, #h(2em) J_p = J^compose \( 1 + o \( 1 \) \) . $ <eq:stops-subbin-size>]
  Let $I$ be the intersection, over the real values of $p$ in the subbin, of the real $m$-intervals specified by the middle condition in (10.11). The endpoints of one such interval are
  $ frac(D - A, p q') \, #h(2em) frac(D Y - A, p q') . $
  Relative to $D J^compose$, the variation of either endpoint is at most
  $ O (xi w^(- 2 C_s - 10) (1 + frac(\| A \|, D Y))) = o \( 1 \) \, $
  by (10.1). Consequently
  #[#set math.equation(numbering: n => "(10.13)")
   $ \| I \| = \( 1 - o \( 1 \) \) D J^compose . $ <eq:stops-common-interval>]
  The height of this interval satisfies
  $ sup_(m in I) \| m \| lt.eq \( D + \| A \| \/ Y \) J^compose \( 1 + o \( 1 \) \) lt.eq P^(s^compose + .02) \, $
  provided $b_0$ is sufficiently large in terms of $C_s$. Indeed the extra factor is bounded by a constant times $w^(C_s + 2)$, which is absorbed by $P^.02$ after such a choice. All these statements are uniform in the aligned progression family, its eligible rational, and the subbin.
  Among primes $t < P$, distinguish those aligning to $A \/ D$ from those not aligning. Let $E$ be the set of nonaligned primes $t < P$ that do not divide $D$. We count only integers of the form
  #[#set math.equation(numbering: n => "(10.14)")
   $ m = plus.minus d_0 ell' \, #h(2em) d_0 lt.eq P^.95 \, #h(2em) t divides d_0 arrow.r.double t in E \, #h(2em) ell' > P med upright("prime") \, $ <eq:stops-factorization>]
  with $m in I$. Such a representation is unique: its factor $d_0$ is less than $P$, while the distinguished prime factor is greater than $P$. Furthermore, $\( m \, D \) = 1$, since $d_0$ has no prime factor dividing $D$, and $D < P < ell'$. If $t < P$ aligns to $A \/ D$, then $t$ divides neither $d_0$ nor $ell'$, so $t divides.not m$, exactly as required to avoid the class at this aligned prime.
  For each permitted $d_0$, the number of integers (10.14) in $I$, counting both signs, is at least
  #[#set math.equation(numbering: n => "(10.15)")
   $ \( 1 - o \( 1 \) \) frac(\| I \|, d_0 \( s^compose + .02 \) log P) . $ <eq:stops-prime-factor-count>]
  Here the error tends to zero uniformly in $d_0$, $E$, and all the other data. To prove this, split $I$ into its positive and negative absolute-value pieces. Remove $\| m \| < P^(- .02) \| I \|$, and discard any remaining sign piece shorter than $P^(- .02) \| I \|$. The total removed length is $O \( P^(- .02) \| I \| \)$. After division by $d_0$, every retained interval has lower endpoint at least
  $ frac(P^(- .02) \| I \|, d_0) gt.eq \( 1 - o \( 1 \) \) D P^(s^compose - .97) > P^1.04 \, $
  using (10.6) and (10.13). Its length divided by its upper endpoint is at least $\( 1 - o \( 1 \) \) D P^(- .04)$, and hence at least $P^(- .05)$. If its upper endpoint is $v$, then $v > P^1.04$ implies
  $ v P^(- .05) gt.eq v^(9 \/ 10) . $
  The uniform short-interval prime number theorem in 4 therefore applies. Every upper endpoint has logarithm at most $\( s^compose + .02 \) log P$. Summing the resulting lower bounds for the retained sign pieces proves (10.15). In particular their prime factors automatically exceed $P$.
  ===== 10.2.2 Sieving the varying prime. <sieving-the-varying-prime.>
  Fix one of the integers $m$ just counted. The last congruence in (10.11) prescribes a single unit class for $p$ modulo $D$. This uses $\( A \, D \) = \( q' m \, D \) = 1$. For each prime $t divides D$, increasing $p$ by $D$ changes the integer $n$ by $q' m$, which is a unit modulo $t$. Thus avoiding $a_t$ removes exactly one of the $t$ lifts of this base class modulo $D t$. Taken together, the remaining classes modulo
  $ Q = D "rad" \( D \) $
  form a set $cal(A)$ of $phi \( "rad" \( D \) \)$ unit classes. Since $phi \( Q \) = phi \( D \) "rad" \( D \)$, their proportion among all unit classes modulo $Q$ is exactly
  #[#set math.equation(numbering: n => "(10.16)")
   $ frac(\| cal(A) \|, phi \( Q \)) = 1 / D . $ <eq:stops-lift-fraction>]
  For $D = 1$ this means the single unrestricted class and the same formula holds.
  For $t in E$, avoiding the original class is equivalent to
  $ p q' m equiv.not D a_t - A med \( mod med t \) \, $
  with nonzero right side. If $t divides d_0$, this is automatic. If $t divides.not d_0$, then $m$ is a unit modulo $t$ because $ell' > P$, and exactly one nonzero $p$-class modulo $t$ is forbidden. Thus the product of the remaining survival factors is $W_E \( d_0 \)$ from (10.9). Let $N_(cal(I))$ be the number of primes in the present subbin $cal(I)$. We claim that for any fixed $gamma_1 > 0$, for all sufficiently large $z$,
  #[#set math.equation(numbering: n => "(10.17)")
   $ \# { p in cal(I) : med p med upright("gives a local survivor for this ") m } gt.eq \( 1 - gamma_1 \) N_(cal(I)) / D W_E \( d_0 \) \, $ <eq:stops-tag-prime-count>]
  uniformly in all the data. If the product vanishes, the claim is trivial. In every other case, the restricted primes are at least $3$; their sieve densities $g \( t \) = 1 \/ \( t - 1 \)$ satisfy the hypotheses of 3.
  Here are the required progression and remainder bounds. Choose a fixed $A_2$ large enough, in terms of $gamma_1$, to make the relative fundamental-lemma error small, and use sieve level $S = P^(A_2)$. For a squarefree intersection modulus $l lt.eq S$ on the restricted primes and one class in $cal(A)$, the forbidden conditions specify a single reduced class modulo $Q l$, since $\( l \, Q \) = 1$. Siegel–Walfisz from 4 gives its count as
  $ frac("li" \( R' + V \) - "li" \( R' \), phi \( Q \) phi \( l \)) + O_(M_2) (frac(R', \( log R' \)^(M_2))) . $
  The exponent $M_2$ can be any sufficiently large fixed constant. To check the modulus range, observe that
  #[#set math.equation(numbering: n => "(10.18)")
   $ Q lt.eq w^(2 C_s) \, #h(2em) \| cal(A) \| lt.eq w^(C_s) \, #h(2em) S lt.eq w^(b_1 A_2) \, #h(2em) log R' gt.eq w^(1 \/ 4) log w . $ <eq:stops-sw-size-bounds>]
  Thus $Q l$, the level, and the lift count are each bounded by fixed powers of $log R'$. The main term, for each base class, has the required multiplicative intersection density $1 \/ phi \( l \) = product_(t divides l) 1 \/ \( t - 1 \)$.
  For completeness, let $C$ be the fixed divisor-weight exponent in the remainder of 3. Summing over lifts and using the crude bound $sum_(l lt.eq S) tau \( l \)^C lt.double S^(C + 1)$, the total remainder is at most
  $ O_(M_2) (\| cal(A) \| S^(C + 1) frac(R', \( log R' \)^(M_2))) . $
  In a nonzero case, uniformly over subsets of restricted primes,
  $ W_E \( d_0 \) gt.double frac(1, log P) . $
  Indeed the product over all $3 lt.eq t < P$ is of this order, by Mertens’ theorem and the convergent positive product in the identity
  $ 1 - frac(1, t - 1) = (1 - 1 / t) (1 - frac(1, \( t - 1 \)^2)) . $
  Also $N_(cal(I)) asymp V \/ log R'$, uniformly by the same prime number theorem, or by Siegel–Walfisz with modulus one. Write $kappa = 2 C_s + 10$. The ratio of the displayed remainder to $\( N_(cal(I)) \/ D \) W_E \( d_0 \)$ is consequently at most
  $ O_(M_2 \, xi) (frac(D \| cal(A) \| w^kappa S^(C + 1) log P, \( log R' \)^(M_2 - 1))) lt.double_(M_2 \, xi) frac(w^(4 C_s + 10 + \( C + 1 \) b_1 A_2) log P, \( log R' \)^(M_2 - 1)) = o \( 1 \) $
  on taking $M_2$ sufficiently large in terms of the fixed constants. This also justifies subtracting the two endpoint estimates for the short subbin. The logarithmic-integral main term can be replaced by $N_(cal(I))$ with relative error $o \( 1 \)$. Finally use (10.16), and take the fundamental-lemma relative error sufficiently small compared with $gamma_1$. This proves (10.17). Its error bound is uniform in $m$; large values of $m$ change only reduced residue classes.
  ===== 10.2.3 Summing the lower bound and bounding an individual count. <summing-the-lower-bound-and-bounding-an-individual-count.>
  For each $d_0$, first count the integers $m$ using (10.15), and for each such $m$ count its admissible varying primes using (10.17). A pair $\( p \, m \)$ determines a unique integer $n$ by (10.11). Unique factorization in (10.14) prevents duplicate counting for fixed $p$. Hence 37 and (10.13) give, in one subbin,
  $ sum_(p in cal(I)) T_p gt.eq \( 1 - gamma_1 - o \( 1 \) \) frac(N_(cal(I)) J^compose, \( s^compose + .02 \) log P) e^(- gamma) \( .94 - o \( 1 \) \) . $
  Mertens’ theorem gives $V_(upright("all")) \( P \) tilde.op e^(- gamma) \/ log P$. We have $s^compose + .02 lt.eq 2.22$ eventually, and
  $ .94 / 2.22 > .423 . $
  Choose $gamma_1$ as a sufficiently small absolute constant; for example $gamma_1 = .05$ leaves a limiting coefficient greater than $.402$. Since $J_p = J^compose \( 1 + o \( 1 \) \)$ uniformly within a subbin, summing over all subbins proves (10.7). All relative errors used here are uniform, so the growing number of subbins and the number of pairs $\( d_0 \, m \)$ do not accumulate additional errors.
  For the upper bound, the hit conditions give one ordinary progression of step $p q'$ and coordinate length $J_p + O \( 1 \)$. Every sieve prime below $P$ is coprime to this step. Apply the upper form of 3 using primes up to $P^theta$, for a sufficiently small fixed absolute $theta > 0$, and a level such as $P^(1 \/ 2)$. The relative sieve parameter is a sufficiently large absolute constant; the summed $O \( 1 \)$ intersection remainders are $P^(1 \/ 2 + o \( 1 \))$, whereas $J_p gt.eq P^2$. Mertens’ theorem gives
  $ product_(t < P^theta) \( 1 - 1 \/ t \) lt.double_theta V_(upright("all")) \( P \) . $
  This proves (10.8) with an absolute $C_U$, independent of $C_s \, b_0 \, b_1$ and of sufficiently small $xi$. ◻
]

=== 10.3 Comparison at the actual stops <comparison-at-the-actual-stops>

The preceding lemma averages over every prime in a bin. To apply it to actual stops, we must show that fixing the other prime factors leaves the entire owner-aligning subset available. This is the role of the representative tests in the stop rule.

#thm([Proposition 10.5.])[
  (Comparison at stops).  #emph[There is an absolute constant $eta_0 > 0$ with the following property. Fix $C_s$ and the regular-box parameters. Take $0 < eta lt.eq eta_0$, then take $b_0$ sufficiently large in terms of $C_s$, and take any fixed $b_1 > b_0$. For all sufficiently small fixed $xi > 0$ and all sufficiently large $z$, the stops of 35 satisfy 
#[#set math.equation(numbering: n => "(10.19)")
 $ sum_(d med upright("stopped")) S_d \( x \( P_d \) \) gt.eq sum_(d med upright("stopped")) mu_d P_(upright(e)) \( r_d \, x \( P_d \) \) \, $ <eq:stops-comparison>]

 where $P_d$ denotes the last prime of the tuple and both cutoffs are strict below $P_d$.]
] <prop:stopped-comparison>

#proof[
  We first explain exactly which prime is averaged. Partition the stopped nodes by their ordered bin labels, their tag position, and all prime choices other than the tag prime $p$. In a nonempty group, let $A \/ D$ be the owner of its tag bin. Then $p$ ranges over the entire subset of that bin aligning to $A \/ D$.
  To justify this assertion, replace $p$ by any other aligning prime in the bin. All earlier choices remain fixed, so no earlier tag appears. At the designated position the new prime aligns to the same owner; hence the tag position and tag rational remain unchanged. Every subsequent all-prefix alignment test has the same truth value, since the other primes are fixed and the replacement aligns. The representative tests, lengths, and bin multiplicities depend only on the labels. Admission is preserved by (10.3), and the tag-bin multiplicity one prevents a change in prime ordering or a collision with another factor. These observations apply to each earlier prefix as well, so no earlier stop is introduced. This proves the assertion about the entire aligning subset.
  In this group put $q' = d \/ p$. The last prime $P$ is a factor of $q'$ and is fixed. All primes of $q'$ are at least $P$, and they align to $A \/ D$. First allow #emph[all] primes $p$ in the tag bin, assigning to $p$ the hypothetical hit class aligned to $A \/ D$. These hypothetical choices need not be actual stops; their local counts are auxiliary. Let $cal(P)$ denote this tag bin, and use the hypothetical counts $T_p$ of 36. On its aligning subset, $T_p = S_(p q') \( x \( P \) \)$.
  For all choices of $p$ in the tag bin, put $b = x \( P \)$ and use the gap $r_(p q') = log_w \( Y \/ \( p q' \) \) - a_star.op + 2$. Thus
  $ log_P J_p = r_(p q') / b + frac(a_star.op - 2, b) . $
  The bin labels and representative safety tests are fixed, so the movement bound applies also to these hypothetical choices. By (10.5), after enlarging $b_0$ if necessary, all of them satisfy (10.6). The search bin is disjoint from the prime factors of $q'$ because the tag bin has multiplicity one. All hypotheses of 36 therefore hold.
  For sufficiently large $z$, the actual cutoff lies in the fixed interval $\[ b_0 - 1 \, b_1 \]$. Applying 24 on this interval, together with the product identity $V_(upright("all")) \( P \) = V_0 V \( b \)$, gives
  $ frac(mu_(p q') P_(upright(e)) \( r_(p q') \, b \), J_p V_(upright("all")) \( P \)) lt.eq f \( r_(p q') \/ b \) + O \( 1 \/ b \) + o \( 1 \) . $
  The constants are uniform for the fixed enlarged window $\[ b_0 - 1 \, b_1 \]$ and for the ratio window in (10.5). On that ratio window, the near-$2$ formula and monotonicity of $f$ give
  $ f \( r_(p q') \/ b \) lt.eq f \( 2.18 \) < frac(2 \( 1.95 \) \( .166 \), 2.18) < .30 . $
  Here $e^gamma < 1.95$ follows, for example, from $gamma lt.eq sum_(j = 1)^6 j^(- 1) - log 6 < .66$, and $log \( 1.18 \) < .166$ follows from $log \( 1 + u \) lt.eq u - u^2 \/ 2 + u^3 \/ 3$ at $u = .18$. Thus first choosing $b_0$ large and subsequently taking $z$ large gives
  #[#set math.equation(numbering: n => "(10.20)")
   $ mu_(p q') P_(upright(e)) \( r_(p q') \, b \) lt.eq .33 J_p V_(upright("all")) \( P \) $ <eq:stops-reference-upper>]
  uniformly over the group and over its hypothetical choices.
  Apply (10.7) to the full tag bin. Let $cal(G)$ be the aligning subset in the tag bin. Its complement contains at most an $eta$ fraction of the bin primes. Since the $J_p$’s vary by at most $1 + xi$ within the whole bin, for $xi lt.eq 1$ we have
  $ sum_(p in.not cal(G)) T_p lt.eq 2 C_U eta V_(upright("all")) \( P \) sum_(p med upright(i n med b i n)) J_p . $
  Fix an absolute $eta_0 < 1 \/ 2$ so small that $2 C_U eta_0 < .05$. For $0 < eta lt.eq eta_0$, subtracting this bound from (10.7) and using (10.20) gives
  $ sum_(p in cal(G)) S_(p q') \( x \( P \) \) & = sum_(p in cal(G)) T_p\
 & gt.eq .34 V_(upright("all")) \( P \) sum_(p med upright(i n med b i n)) J_p\
 & gt.eq sum_(p in cal(G)) mu_(p q') P_(upright(e)) \( r_(p q') \, b \) . $
  The last inequality uses $.34 > .33$ and positivity of $J_p$; it does not require a distribution hypothesis for the survivors inside the owner subset. Every stopped node belongs to exactly one of the groups considered. Summing the group inequalities proves 38. ◻
]

=== 10.4 Almost every hard endpoint lies below a stop <almost-every-hard-endpoint-lies-below-a-stop>

We next explain why the same stops capture all but an arbitrarily small scaled harmonic mass of the hard compact endpoints. In what follows, the harmonic mass of a family of tuples is $sum_d 1 \/ d$.

#thm([Proposition 10.6.])[
  (Stopping hard endpoints).  #emph[Fix a compact gap bound $K$, the regular-box parameters, the bounded candidate lists from 29, and the exponent $C_s$ from 33. Fix $0 < eta lt.eq eta_0$ as in 38. For every $delta > 0$, take $b_0$ sufficiently large in terms of $C_s$ and $K$, then take $b_1 \/ b_0$ sufficiently large in terms of the desired error, and finally take $xi$ sufficiently small. For these fixed choices, the regular included hard endpoints with $r_d lt.eq K$ having no stopped prefix have harmonic mass at most 
#[#set math.equation(numbering: n => "(10.21)")
 $ \( delta + o \( 1 \) \) B^(- 2) . $ <eq:stops-hard-mass>]

 The eventual $o \( 1 \)$ may depend on all the fixed choices. In particular, $b_1$ and $xi$ are fixed before $z$ tends to infinity.]
] <prop:hard-stopping>

#proof[
  For a hard endpoint, 33 gives a rational on one of its candidate lists that satisfies (10.1) and aligns to every path factor of exponent greater than $C_s$. We need two facts about this path: its tag must be this rational, and it must have an earlier even visit in the stop window. We establish the tag statement in the full-box product measure, and the visit statement in the unconditioned path process. Their exceptional masses will then be added.
  ===== 10.4.1 Identifying the tag. <identifying-the-tag.>
  Except for $o \( B^(- 2) \)$ mass, the path acquires this same rational as its tag during its search positions, as we now show.
  Fix one regular full candidate box and one eligible rational $A \/ D$ on its list. Each of its search bins has multiplicity one, and 26 supplies at least $c_7 log w$ such bins. For clarity, the count follows because all nonsearch factors together decrease the gap by at most
  $ C_(upright("len")) log B thin \( w^(1 \/ 4) + h \) = o \( w^(1 \/ 2) \) . $
  The search factors come first and must therefore decrease the gap from $r_0 asymp B asymp w log w$ to at most $w^(1 \/ 2)$. A standard transition decreases the gap by at most a bounded multiplicative factor, including at the initial extended start. At least a constant multiple of $log w$ search factors is necessary.
  At a hard endpoint for the chosen rational, all these search primes align to it. If none of their bins is near-full for this rational, each of the bins has more than an $eta$ fraction of nonaligning primes by count. For primes in $\[ R \, \( 1 + xi \) R \]$, this is a harmonic fraction at least $eta \/ \( 1 + xi \)$. The search choices are independent in the full product box, so the fraction of its harmonic measure with all those alignments is at most
  $ (1 - frac(eta, 1 + xi))^(c_7 log w) = o \( 1 \) . $
  This bounds the relevant hard event in the full box without asserting independence after conditioning on hardness.
  Otherwise some visited search bin is near-full for this rational, which is therefore its owner. The hard endpoint’s choice in this bin aligns to its owner, so a tag has been acquired by that position. If the first tag is a different rational, the prime at the earlier tag position aligns both to $A \/ D$ and to the distinct eligible owner of that bin. By (10.2), its possible choices form a uniformly negligible fraction, even after summation over $C_(upright("len")) log B$ positions. Indeed in a search bin this fraction is at most a constant, depending on fixed $xi$, times
  $ frac(L + log R, R) \, $
  and $R gt.eq exp \( w^(1 \/ 4) log w \)$.
  There are at most the fixed list bound times the fixed candidate count such rational choices per box. The union of the preceding exceptions therefore costs $o \( 1 \)$ of the full candidate-box harmonic measure. The total mass of the enlarged boxes is $O_K \( B^(- 2) \)$, independently of sufficiently small $xi$, by 26. Summing over the boundedly many candidates gives a total $o \( B^(- 2) \)$ exception. Outside it, a hard endpoint has the correct tag by the end of its search positions.
  ===== 10.4.2 Finding an even visit before the compact endpoint. <finding-an-even-visit-before-the-compact-endpoint.>
  Apply 14 to the continuous standard path. For any prescribed probability error $epsilon_1 > 0$, with $b_0$ fixed, choosing $b_1 \/ b_0$ sufficiently large ensures, uniformly from the allowed starting ratios as the initial gap tends to infinity, an even arrival with ratio in $\[ 2.08 \, 2.14 \]$ and last exponent in $\[ 2 b_0 \, b_1 \/ 2 \]$, except with probability at most $epsilon_1 + o \( 1 \)$. The proof of that lemma marks the first draw from an odd regeneration when its ratio lies in $\[ 2.09 \, 2.13 \]$, using a pre-draw gap in $\[ 10 b_0 \, b_1 \]$. In particular the arrival has the stronger interior margins
  #[#set math.equation(numbering: n => "(10.22)")
   $ frac(10 b_0, 3.13) lt.eq x lt.eq b_1 / 3.09 \, #h(2em) 2.09 lt.eq s lt.eq 2.13 . $ <eq:stops-marked-slack>]
  The choice of $b_1$ depends on the probability budget and fixed $b_0$, not on $z$ or on $xi$.
  Use 17 for standard prime paths with lower exponent cutoff $1$. Actual included paths are a subset of these standard paths; their rules agree above exponent $2$. High-ratio histories ending in the fixed compact window have negligible scaled mass by 16. On the remaining histories the coupling matches states and exits, with a failure probability tending to zero. The interior margins in (10.22) therefore give the asserted slightly wider visit windows on matched prime paths.
  This visit lies in the segment being compared whenever the matched prime history ends in the compact window. In fact its arrival gap is at least a fixed multiple of $b_0$. Taking $b_0$ sufficiently large relative to $K$, that gap exceeds the matched compact endpoint gap. Since gaps decrease along the path, a raw continuous marked visit cannot occur after this endpoint. Matching exits puts the visit before any cutoff exit as well. Thus the coupling cannot lose the needed visit merely by stopping the compared segment at the compact endpoint.
  The compact-history event estimate in 19 now bounds the harmonic mass of compact endpoints missing such a visit by
  $ C_K \( epsilon_1 + o \( 1 \) \) B^(- 2) + o \( B^(- 2) \) \, $
  where $C_K$ depends on the fixed compact window and the starting bounds, not on the later bin width. Choose $epsilon_1$ sufficiently small in terms of $delta \/ C_K$, and choose $b_1$ accordingly.
  ===== 10.4.3 Verifying the stop conditions. <verifying-the-stop-conditions.>
  Consider a regular hard endpoint with the correct tag and with this even visit. Every factor up to the visit has exponent at least the visit’s last exponent, which exceeds $C_s$ by the choice of $b_0$. Hence all these factors align to its tag rational. Its search positions have already passed: their lower exponents are at least $w^(1 \/ 4)$, whereas the visit exponent is bounded by fixed $b_1$. The tag is therefore attained by the visit, and its bin has multiplicity one. The visit-prefix length is at most the regular endpoint length $C_(upright("len")) log B$.
  By regularity, every earlier nonempty even prefix, including the visit, has actual margin greater than $10 Delta$ in the admission test. The representative movement is at most $Delta$, and changing the last exponent changes $cal(H)$ by at most $2 h$. For sufficiently large $z$, the representative margin is consequently at least $10 Delta - Delta - 2 h > 3 Delta$. Thus (10.3) holds. Finally the ratio and exponent slack in the visit windows, the prefix movement bound, and a sufficiently small fixed $xi$ imply (10.4). All stop conditions hold at this visit. The branch has therefore stopped there or earlier.
  Combining the $o \( B^(- 2) \)$ incorrect-tag exception with the arbitrarily small missing-visit mass proves (10.21). ◻
]

The order of choices in these two propositions is worth making explicit. The constant $C_U$ in (10.8) is absolute, so the owner threshold $eta$ can be fixed before either stop-window endpoint. The choice of $b_0$ absorbs $C_s$, the local reference error, the interval-height margin, and the compact gap range. Only the ratio $b_1 \/ b_0$ must then be enlarged to make the marked-visit error as small as desired. Afterwards $xi$ is chosen for representative movements and all earlier freezing conditions. Every progression modulus and prime-sieve level used here remains a fixed power of $log R'$ for these choices, however large the fixed $b_1$ is. The corresponding asymptotic thresholds may therefore wait until this final fixed $xi$ has been chosen.

== 11 Completion of the proof <sec:assembly>

We now combine the estimates, keeping the order of constants explicit. This first proves Theorem 2; the deduction of Theorem 1 then uses only an upper sieve.

=== 11.1 The error budget <the-error-budget>

#proof[
  By Proposition 22, there is an absolute $c_L > 0$ such that
  #[#set math.equation(numbering: n => "(11.1)")
   $ P_(upright(e)) \( r_0 \, B \) gt.eq c_L / B^2 $ <eq:assembly-reference>]
  for all sufficiently large $z$. Let $C_(upright("abs"))$ be an absolute constant such that
  $ lr(|N_d \/ mu_d - 1|) lt.eq C_(upright("abs")) $
  at every included node; this follows from (3.4).
  For nodes with large gap, the relative error in (3.4) is $O \( e^(- c r_d) \)$ after a fixed lower threshold on $r_d$. The tail estimate in Proposition 19 permits us to choose a fixed $K$ so large that
  #[#set math.equation(numbering: n => "(11.2)")
   $ sum_(d upright(" included")\
r_d > K) \| N_d - mu_d \| lt.eq c_L / 8 frac(Y V_0, B^2) $ <eq:assembly-tail>]
  eventually. Standard paths contain the included paths, so the nonnegative tail estimate applies. This choice depends only on the fixed reference margin and the absolute small-prime error constants.
  The same proposition gives a constant $C_K$ for the total harmonic mass of nodes with $r_d lt.eq K$. Choose $epsilon > 0$ such that $epsilon C_K < c_L \/ 8$. The compact nodes with relative error at most $epsilon$ then contribute at most
  #[#set math.equation(numbering: n => "(11.3)")
   $ sum_(d upright(" included")\
r_d lt.eq K\
\| N_d \/ mu_d - 1 \| lt.eq epsilon) \| N_d - mu_d \| lt.eq c_L / 8 frac(Y V_0, B^2) . $ <eq:assembly-good-compact>]
  It remains to deal with compact nodes having relative error greater than $epsilon$. Fix a target $beta > 0$ so small that
  #[#set math.equation(numbering: n => "(11.4)")
   $ C_(upright("abs")) beta < c_L / 8 . $ <eq:assembly-beta>]
  We claim that the stopped tree can be chosen so that the retained bad compact nodes have total harmonic mass at most $beta \/ B^2$. The following choices give this claim without requiring any constant to be chosen again at an earlier stage.
  First use Lemma 25 to fix a larger threshold $K_(*)$, a positive edge-discrepancy threshold, and a fixed maximum number $H_e$ of candidate positions. Choose the adjustable regularity exceptions in Proposition 26 small enough to cost less than a prescribed small fraction of $beta \/ B^2$. This fixes the path-length bound and the isolated-prime interval. For the moment leave the exception for near-threshold even prefixes to the eventual choice of bin width.
  The enlarged regular boxes have total harmonic mass at most $C'_K \/ B^2$, with $C'_K$ independent of sufficiently small fixed $xi$. Choose the exception fraction $sigma$ in Proposition 29 sufficiently small that
  $ H_e C'_K sigma $
  is less than another prescribed small fraction of $beta$. The inverse proposition now fixes a positive alignment fraction and a list bound $F$, independently of the eventual sufficiently small fixed width. Each list is attached to its entire candidate box.
  Next choose the variance exception fraction in Proposition 32 small enough relative to $H_e$, $C'_K$, $F$ and $beta$. A prime-count fraction in the isolated bin converts to a harmonic fraction at a bounded absolute cost. After this conversion and the finite unions over candidates and list elements, the total variance exception costs another prescribed small fraction of $beta \/ B^2$. The variance proposition fixes a constant $C_s$. Corollary 33 then shows that all remaining bad compact endpoints have a hard rational satisfying the global eligibility bounds and alignment of every factor with exponent greater than $C_s$.
  Choose the absolute owner threshold $eta$ required by Proposition 38. Choose $b_0$ sufficiently large in terms of $C_s$ and $K$ and for the local reference and prime estimates in that proposition. Finally choose $b_1 \/ b_0$ sufficiently large that Proposition 39 bounds the hard endpoints that remain outside stopped subtrees by the remaining allocated small fraction of $beta \/ B^2$. This uses the marked-visit estimate with a prescribed failure probability, as well as the vanishing owner and wrong-tag exceptions for the fixed candidate lists.
  All constants except the bin width have now been fixed. Choose a fixed $xi > 0$ sufficiently small for the interval-freezing errors, candidate-size slack, representative stopping margins and all earlier small-width requirements. In particular, the near-threshold exception, of cost $O \( Delta \) + o \( 1 \)$ in the compact-history probability measure with $Delta = 2 C_(upright("len")) xi$, can be made as small as the error budget requires. Then take $z$ sufficiently large for every preceding fixed choice. Asymptotic bounds whose thresholds depend on $xi$ are used only at this final stage.
  The sum of all these finitely many allocated costs is at most $beta \/ B^2$, proving the claim. More explicitly, after removing the regularity exceptions, every retained bad endpoint has a witnessing edge. Outside the inverse exceptions it has an alignment in the fixed list. Outside the variance exceptions it is hard. Outside the hard-stopping exceptions it lies in a stopped subtree and is therefore not retained. This exhausts the cases. Fractional exceptions are summed using $H_e C'_K \/ B^2$, not the number of boxes.
  The claim and (11.4) show that retained bad compact nodes contribute at most $\( c_L \/ 8 \) Y V_0 \/ B^2$ in absolute error. Together with (11.2) and (11.3), this gives
  #[#set math.equation(numbering: n => "(11.5)")
   $ sum_(d in cal(T)) \| N_d - mu_d \| lt.eq frac(3 c_L, 8) frac(Y V_0, B^2) $ <eq:assembly-retained>]
  for the retained expanded nodes of the chosen stopped tree. Proposition 38 gives
  $ sum_(d in cal(S)) #scale(x: 120%, y: 120%)[\(] S_d \( b_d \) - mu_d P_(upright(e)) \( r_d \, b_d \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Apply (3.7), Lemma 6 and (11.1). We obtain
  $ S_1 \( B \) gt.eq (1 - 3 / 8) c_L frac(Y V_0, B^2) gt.eq c_L / 2 frac(Y V_0, B^2) . $
  Every constant is independent of the prescribed residue classes. This proves Theorem 2. ◻
]

=== 11.2 Removing the remaining divisor primes <removing-the-remaining-divisor-primes>

The factor $log w$ in the survivor estimate allows a cutoff smaller than $k log k$. We choose it so that the loss from the at most $k$ remaining divisor primes is a fixed fraction of the surviving count.

#proof[
  By Theorem 2 and Mertens’ formula, there is an absolute $c_0 > 0$ such that, for every sufficiently large real $z$, every assignment of one forbidden class at each prime $p lt.eq z$ leaves at least
  #[#set math.equation(numbering: n => "(11.6)")
   $ c_0 frac(Y log w, L^2) $ <eq:assembly-survivor-lower>]
  integers in $\[ 1 \, Y \]$. Indeed, $V_0 \/ B^2 tilde.op e^(- gamma) log w \/ L^2$.
  Let $k$ be sufficiently large, put $ell = log k$ and $M = log log k$, and take
  #[#set math.equation(numbering: n => "(11.7)")
   $ z = A_0 frac(k log k, log log k) \, $ <eq:assembly-jacobsthal-cutoff>]
  where the absolute constant $A_0 > 1$ will be fixed below, before $k$ tends to infinity. With the parameters of (1.2),
  #[#set math.equation(numbering: n => "(11.8)")
   $ L tilde.op ell \, #h(2em) log w tilde.op M \, #h(2em) Y tilde.op A_0^2 k^2 / M^2 \, #h(2em) X := Y / z tilde.op A_0 frac(k, ell M) \, #h(2em) log X tilde.op ell . $ <eq:assembly-jacobsthal-scales>]
  In particular $z arrow.r oo$ and $X arrow.r oo$ for every such fixed $A_0$.
  Let $n$ be any positive integer with $omega \( n \) lt.eq k$, and let the given interval of $Y$ consecutive integers begin at an arbitrary integer $a$. Represent its integers as $a + j - 1$, $1 lt.eq j lt.eq Y$. For each prime $p divides n$ with $p lt.eq z$, prescribe the forbidden class
  $ j equiv 1 - a med \( mod med p \) . $
  At the other primes $p lt.eq z$, prescribe any class. The estimate (11.6) counts integers that avoid every divisor prime at most $z$, together with these additional restrictions.
  Fix a prime divisor $q > z$ of $n$. Its divisibility class has at most $1 + Y \/ q lt.eq 1 + X$ representatives in the coordinate interval. Enclose them in a progression segment whose coordinate length is $ceil.l X ceil.r + 2$. Fix a sufficiently small absolute $theta > 0$ and sieve this segment by primes at most $X^theta$. This cutoff is below $z$ for large $k$, the step $q$ is invertible modulo every sieve prime, and the integers already counted in (11.6) avoid its prescribed class there. Lemma 5 and Mertens’ formula therefore give
  #[#set math.equation(numbering: n => "(11.9)")
   $ \# { upright("these survivors divisible by ") q } lt.eq C_1 (1 + frac(X, log X)) $ <eq:large-prime-deletion>]
  for an absolute $C_1$, uniform in $q$, $A_0$, the classes, and the translation once the displayed length conditions hold. More explicitly, the enclosing coordinate length is comparable to $X$ and at least $\( X^theta \)^(1 \/ \( 2 theta \))$ for large $X$, so the fixed exponent upper bound in Lemma 5 applies. Enclosing a shorter or empty progression only increases the count; in particular the argument also covers $q > Y$.
  There are at most $k$ such further divisor primes. For each fixed $A_0$, (11.8) gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ frac(k \( 1 + X \/ log X \), Y log w \/ L^2) = 1 / A_0 + o \( 1 \) . $ <eq:all-large-deletions>]
  For the second term in the numerator, the quotient is $k L^2 \/ \( z log X log w \) arrow.r 1 \/ A_0$; the term $k$ is negligible since $Y log w \/ L^2 asymp_(A_0) k^2 \/ \( ell^2 M \)$. Choose once and for all $A_0 > 2 C_1 \/ c_0$. Equations (11.9) and (11.10) then show that fewer than the number in (11.6) are removed, for all sufficiently large $k$. At least one integer in the original interval is therefore coprime to $n$.
  This argument is uniform in the prime divisors of $n$ and in every integer $a$, including negative starting points and intervals containing zero. Prime multiplicities do not enter. The length estimate in (11.8), with $A_0$ now absolute, gives
  $ h \( k \) lt.double frac(k^2, \( log log k \)^2) lt.double frac(k^2, \( log log \( 3 k \) \)^2) $
  for all sufficiently large $k$, since $log log \( 3 k \) \/ log log k arrow.r 1$.
  To include the remaining finitely many values of $k$, suppose $n$ has $r lt.eq k$ distinct prime divisors. Inclusion–exclusion gives at least
  $ m product_(p divides n) (1 - 1 / p) - 2^r gt.eq frac(m, k + 1) - 2^k $
  coprime integers in every interval of $m$ consecutive integers. For the product bound, order the distinct primes as $p_1 < dots.h.c < p_r$ and use $p_j gt.eq j + 1$ to obtain $product_(j = 1)^r \( 1 - 1 \/ p_j \) gt.eq 1 \/ \( r + 1 \)$. This also covers $r = 0$ with the empty product equal to one. The integer $m_k = \( k + 1 \) 2^k + 1$ consequently bounds $h \( k \)$ for each remaining $k$. The maximum of
  $ frac(m_k \( log log \( 3 k \) \)^2, k^2) $
  over this finite set, together with the constant already obtained for large $k$, supplies one absolute constant $C$ such that $h \( k \) lt.eq C k^2 \/ \( log log \( 3 k \) \)^2$ for every integer $k gt.eq 1$. ◻
]

== 12 A modular hyperbola count with residue restrictions <sec:hyperbola>

The large-modulus case of Proposition 32 requires a rectangle count with a congruence restriction on the unit coordinate of a modular hyperbola. We give the completion argument with an explicit error, retaining multiplicities when an interval is longer than the modulus.

#thm([Lemma 12.1.])[
  (Completion with a unit residue restriction).  #emph[Let $H \, T_0 \, T_1$ be positive integers such that $H gt.eq 2$, $T_0$ is squarefree, every prime divisor of $T_0$ divides $H$, and $\( T_1 \, H T_0 \) = 1$. Put $N = H T_0$. Let $C_0 in bb(Z)$ satisfy $\( C_0 \, H \) = 1$, and prescribe the residue pattern 
#[#set math.equation(numbering: n => "(12.1)")
 $ p_0 in \( bb(Z) \/ T_0 bb(Z) \)^times \, #h(2em) k_0 in bb(Z) \/ T_0 bb(Z) \, #h(2em) p_1 in \( bb(Z) \/ T_1 bb(Z) \)^times \, #h(2em) m_1 in bb(Z) \/ T_1 bb(Z) . $ <eq:hyperbola-pattern>]

 The residue classes modulo $1$ have their usual unique interpretation. Let $I \, J$ be bounded real intervals of lengths $X \, Y_2 gt.eq 0$, with either endpoint independently included or excluded. For a positive integer $l$ with $\( l \, H T_1 \) = 1$, let $C_l$ be the number of integer pairs $\( p \, m \)$ satisfying 
#[#set math.equation(numbering: n => "(12.2)")
 $ p in I \, #h(2em) m in J \, #h(2em) l divides p \,\
p equiv p_0 med \( mod med T_0 \) \, #h(2em) p equiv p_1 med \( mod med T_1 \) \, #h(2em) m equiv m_1 med \( mod med T_1 \) \,\
p m equiv C_0 + H k_0 med \( mod med N \) . $ <eq:hyperbola-counted-set>]

 Here $p$ is an integer variable, without a primality condition. Uniformly in all these data, 
#[#set math.equation(numbering: n => "(12.3)")
 $ C_l = frac(X Y_2 phi \( N \), l T_1^2 N^2 phi \( T_0 \)) + O (tau \( N \)^2 log^2 \( 2 N \) sqrt(N T_0) (1 + frac(X, l N) + Y_2 / N)) \, $ <eq:hyperbola-explicit-count>]

 with an absolute implied constant.]
  #emph[In particular, suppose that $R arrow.r oo$ and the data range uniformly over families satisfying 
#[#set math.equation(numbering: n => "(12.4)")
 $ R^(4 \/ 5) < H lt.eq R cal(Z)^11 \, #h(2em) X lt.double R \, #h(2em) Y_2 lt.eq 3 H \, #h(2em) cal(Z) \, T_0 \, T_1 = R^(o \( 1 \)) . $ <eq:hyperbola-application-range>]

 Then, uniformly over all the patterns and intervals above and all squarefree $l lt.eq R^(1 \/ 10)$ with $\( l \, H T_1 \) = 1$, 
#[#set math.equation(numbering: n => "(12.5)")
 $ C_l = frac(X Y_2 phi \( N \), l T_1^2 N^2 phi \( T_0 \)) + O #scale(x: 120%, y: 120%)[\(] R^(3 \/ 5 + o \( 1 \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:hyperbola-application-count>]

 Thus the same assertion holds with error $O \( R^(7 \/ 10 + o \( 1 \)) \)$. Uniformity in the last two assertions means that the upper bounds represented by $R^(o \( 1 \))$ in (12.4) hold uniformly over the family; equivalently, for every $delta > 0$ the error in (12.5) is $O_delta \( R^(3 \/ 5 + delta) \)$ for sufficiently large $R$ in that family. No lower bound for $X \/ l$ is required.]
] <lem:hyperbola>

#proof[
  Write $e_n \( t \) = exp \( 2 pi i t \/ n \)$. We use the classical complete Kloosterman estimate, in the form recorded in #cite(label("Lichtman2022")) Lemma 7.1:
  #[#set math.equation(numbering: n => "(12.6)")
   $ "Kl" \( a \, b \; n \) := sum_(u med mod med n\
\( u \, n \) = 1) e_n \( a u + b macron(u) \) \, #h(2em) \| "Kl" \( a \, b \; n \) \| lt.double tau \( n \) n^(1 \/ 2) \( a \, b \, n \)^(1 \/ 2) . $ <eq:hyperbola-weil>]
  This bound permits arbitrary composite $n$ and arbitrary integer frequencies, including zero frequencies. The inverse $macron(u)$ is taken modulo $n$.
  ===== 12.1 Changing the first coordinate. <changing-the-first-coordinate.>
  Choose a representative of $k_0$ and put $c = C_0 + H k_0$ modulo $N$. The integers $H$ and $N$ have the same prime support. Since $\( C_0 \, H \) = 1$, it follows that $\( c \, N \) = 1$. The hypothesis on $l$ also implies $\( l \, N T_1 \) = 1$. On setting $p = l v$, define
  $ U = X \/ l \, #h(2em) V = Y_2 \, #h(2em) c' = c macron(l) med \( mod med N \) \,\
a_0 = p_0 macron(l) med \( mod med T_0 \) \, #h(2em) a_1 = p_1 macron(l) med \( mod med T_1 \) . $
  Every inverse here is taken in its indicated modulus. The interval $I_l = { x \/ l : x in I }$ has length $U$ and the induced endpoint conventions. The pairs now satisfy
  $ v in I_l \, quad v equiv a_1 med \( mod med T_1 \) \, #h(2em) m in J \, quad m equiv m_1 med \( mod med T_1 \) \,\
v equiv a_0 med \( mod med T_0 \) \, #h(2em) v m equiv c' med \( mod med N \) . $
  In particular $v$ and $m$ are automatically units modulo $N$.
  ===== 12.2 Fourier weights and their divisor-weighted sums. <fourier-weights-and-their-divisor-weighted-sums.>
  For $h \, k med mod med N$, define the unnormalized weights
  #[#set math.equation(numbering: n => "(12.7)")
   $ A \( h \) = sum_(v in I_l ∩ bb(Z)\
v equiv a_1 med \( T_1 \)) e_N \( - h v \) \, #h(2em) B \( k \) = sum_(m in J ∩ bb(Z)\
m equiv m_1 med \( T_1 \)) e_N \( - k m \) . $ <eq:hyperbola-fourier-weights>]
  These are sums over the integers in the progressions, so a residue modulo $N$ is counted with its full multiplicity. They therefore apply unchanged when $U$ or $V$ exceeds $N$. Counting the progressions gives
  #[#set math.equation(numbering: n => "(12.8)")
   $ A \( 0 \) = U \/ T_1 + O \( 1 \) \, #h(2em) B \( 0 \) = V \/ T_1 + O \( 1 \) . $ <eq:hyperbola-zero-weights>]
  For a nonzero residue $h med mod med N$, let $\| h \|_N = min_(j in bb(Z)) \| h + j N \|$. A geometric-progression sum, with ratio $e_N \( - h T_1 \) eq.not 1$, gives
  #[#set math.equation(numbering: n => "(12.9)")
   $ \| A \( h \) \| \, med \| B \( h \) \| lt.double frac(N, \| h T_1 \|_N) #h(2em) \( h equiv.not 0 med \( mod med N \) \) . $ <eq:hyperbola-geometric>]
  The right side is independent of the number of complete periods and of the locations of the intervals.
  Multiplication by $T_1$ permutes the nonzero residues modulo $N$ and preserves their greatest common divisors with $N$. Thus
  #[#set math.equation(numbering: n => "(12.10)")
   $ sum_(h eq.not 0 med \( N \)) frac(\( h \, N \)^(1 \/ 2), \| h T_1 \|_N) & = sum_(r eq.not 0 med \( N \)) frac(\( r \, N \)^(1 \/ 2), \| r \|_N)\
 & lt.eq sum_(d divides N) d^(1 \/ 2) sum_(r eq.not 0 med \( N \)\
d divides r) frac(1, \| r \|_N)\
 & lt.double log \( 2 N \) sum_(d divides N) d^(- 1 \/ 2) lt.eq tau \( N \) log \( 2 N \) . $ <eq:hyperbola-gcd-sum>]
  Indeed the inner sum is at most $2 d^(- 1) sum_(1 lt.eq j lt.eq N \/ \( 2 d \)) j^(- 1)$, with a harmless possible overcount of the midpoint. Without the gcd weight the corresponding sum is $O \( log \( 2 N \) \)$. In conjunction with (12.9), this proves
  #[#set math.equation(numbering: n => "(12.11)")
   $ sum_(h eq.not 0 med \( N \)) \| A \( h \) \| lt.double N log \( 2 N \) \, #h(2em) sum_(h eq.not 0 med \( N \)) \| A \( h \) \| \( h \, N \)^(1 \/ 2) lt.double N tau \( N \) log \( 2 N \) \, $ <eq:hyperbola-fourier-sums>]
  and the identical estimates with $B$ in place of $A$.
  ===== 12.3 Completion with the unit restriction. <completion-with-the-unit-restriction.>
  Define
  $ S \( h \, k \) = sum_(u med mod med N\
\( u \, N \) = 1\
u equiv a_0 med \( T_0 \)) e_N \( h u + k c' macron(u) \) . $
  Fourier inversion, with the multiplicities in (12.7), gives the exact identity
  #[#set math.equation(numbering: n => "(12.12)")
   $ C_l = 1 / N^2 sum_(h \, k med mod med N) A \( h \) B \( k \) S \( h \, k \) . $ <eq:hyperbola-completion-identity>]
  For example, summing $A \( h \) e_N \( h u \) \/ N$ over $h$ counts all allowed integers $v equiv u med \( mod med N \)$, which verifies the normalization directly.
  Orthogonality modulo $T_0$ also gives the exact formula
  #[#set math.equation(numbering: n => "(12.13)")
   $ S \( h \, k \) = 1 / T_0 sum_(j med mod med T_0) e_(T_0) \( - j a_0 \) "Kl" \( h + j H \, k c' \; N \) . $ <eq:hyperbola-restricted-sum>]
  The average over $j$ does not cost a factor $T_0$ in the following absolute bounds. When $k eq.not 0 med \( mod med N \)$, the fact that $\( c' \, N \) = 1$ and (12.6) give
  #[#set math.equation(numbering: n => "(12.14)")
   $ \| S \( h \, k \) \| lt.double tau \( N \) sqrt(N) thin \( k \, N \)^(1 \/ 2) \, #h(2em) k eq.not 0 med \( mod med N \) \, $ <eq:hyperbola-second-nonzero>]
  uniformly also when $h = 0$. For $h eq.not 0$ and $k = 0$, observe that
  #[#set math.equation(numbering: n => "(12.15)")
   $ \( h + j H \, N \) lt.eq T_0 \( h \, N \) . $ <eq:hyperbola-shifted-gcd>]
  In fact any common divisor of $h + j H$ and $N$ divides $T_0 h$, because $T_0 H = N$, and $\( T_0 h \, N \) lt.eq T_0 \( h \, N \)$. Consequently
  #[#set math.equation(numbering: n => "(12.16)")
   $ \| S \( h \, 0 \) \| lt.double tau \( N \) sqrt(N T_0) thin \( h \, N \)^(1 \/ 2) \, #h(2em) h eq.not 0 med \( mod med N \) . $ <eq:hyperbola-first-nonzero>]
  If a shift $h + j H$ vanishes modulo $N$, it is still covered by (12.15); no shifted zero frequency is omitted. No squarefreeness of $H$ or $N$ has been used.
  At the two original zero frequencies,
  #[#set math.equation(numbering: n => "(12.17)")
   $ S \( 0 \, 0 \) = frac(phi \( N \), phi \( T_0 \)) \, #h(2em) phi \( N \) = T_0 phi \( H \) . $ <eq:hyperbola-complete-zero>]
  For the first equality, reduction from the units modulo $N$ onto the units modulo $T_0$ is surjective with equal fibers. Explicitly, if $t^a$ exactly divides $H$ and $t divides T_0$, then the local modulus in $N$ is $t^(a + 1)$, and every unit modulo $t$ has $t^a$ unit lifts. At a prime of $H$ outside $T_0$ there is no prescribed local class. The Chinese remainder theorem proves the first equality. The same prime-power calculation gives the second.
  ===== 12.4 The four frequency cases. <the-four-frequency-cases.>
  The contribution of $h = k = 0$ to (12.12) is
  #[#set math.equation(numbering: n => "(12.18)")
   $ frac(A \( 0 \) B \( 0 \) phi \( N \), N^2 phi \( T_0 \)) = frac(U V phi \( N \), T_1^2 N^2 phi \( T_0 \)) + O (frac(U + V + 1, N)) \, $ <eq:hyperbola-main-term>]
  where (12.8) handles every endpoint convention. This is the stated main term since $U V = X Y_2 \/ l$.
  For $h eq.not 0$, $k eq.not 0$, use (12.14) and (12.11). The total absolute contribution is
  $ lt.double frac(tau \( N \) sqrt(N), N^2) #scale(x: 120%, y: 120%)[\(] N log \( 2 N \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] N tau \( N \) log \( 2 N \) #scale(x: 120%, y: 120%)[\)] = tau \( N \)^2 sqrt(N) log^2 \( 2 N \) . $
  For $h = 0$, $k eq.not 0$, the same argument with the zero weight retained gives
  $ lt.double A \( 0 \) tau \( N \)^2 N^(- 1 \/ 2) log \( 2 N \) . $
  For $h eq.not 0$, $k = 0$, instead use (12.16); this contribution is
  $ lt.double B \( 0 \) tau \( N \)^2 T_0^(1 \/ 2) N^(- 1 \/ 2) log \( 2 N \) . $
  Finally, $A \( 0 \) lt.double U \/ T_1 + 1$ and $B \( 0 \) lt.double V \/ T_1 + 1$. These three estimates and the rounding term in (12.18) are all bounded by the error displayed in (12.3). This proves the general assertion, with an absolute implied constant.
  ===== 12.5 The size range needed in the variance argument. <the-size-range-needed-in-the-variance-argument.>
  Under (12.4),
  $ R^(4 \/ 5) < N lt.eq R^(1 + o \( 1 \)) \, #h(2em) Y_2 lt.eq 3 N . $
  The elementary divisor bound $tau \( N \) = N^(o \( 1 \))$ and $T_0 = R^(o \( 1 \))$ turn the explicit error into
  $ R^(o \( 1 \)) (sqrt(N) + frac(X \/ l, sqrt(N)) + Y_2 / sqrt(N)) lt.double R^(1 \/ 2 + o \( 1 \)) + R^(3 \/ 5 + o \( 1 \)) = R^(3 \/ 5 + o \( 1 \)) . $
  The estimate uses only $l gt.eq 1$, and is therefore uniform throughout the asserted sieve range. It also holds for shorter blocks and for arbitrarily translated intervals. This proves (12.5) and completes the proof. ◻
]

#prodef([Remark 12.2.])[
  In the application, $R gt.eq z^(alpha_min)$ with fixed $alpha_min > 0$, $cal(Z) = exp \( L \/ log L \)$, and
  $ T_0 = product_(t lt.eq w\
t divides H) t \, #h(2em) T_1 = product_(t lt.eq w\
t divides.not H) t . $
  Then $log \( T_0 T_1 \) = O \( w \) = o \( log R \)$ and $log cal(Z) = o \( log R \)$, uniformly in the isolated bin. Thus the uniform family conditions in (12.4) follow from the parameters of the main argument. A fixed bin-width parameter may affect the point at which these asymptotics apply, but it does not enter the absolute constant in (12.3).
] <rem:hyperbola-small-patterns>

== 13 Elementary forms of four auxiliary estimates <sec:elementary-inputs>

We give the versions of four classical estimates needed in the proof. The Buchstab normalization follows directly from its delay equation; the large-sieve and plane-curve bounds need only elementary integration and elimination. The progression upper bound is a consequence of Lemma 3 and Mertens’ product formula. In particular, the last argument retains the fundamental lemma as an input.

=== 13.1 The continuous Buchstab normalization <the-continuous-buchstab-normalization>

The normalization used in Lemma 7 is the classical one; see #cite(label("MontgomeryVaughanIII")) Section 28.9, p. 236. The following proof uses only the continuous delay equation, independently of the positivity argument for the sieve functions.

#thm([Lemma 13.1.])[
  #emph[Let $omega : \[ 1 \, oo \) arrow.r bb(R)$ be the continuous function determined by 
$ u omega \( u \) = 1 quad \( 1 lt.eq u lt.eq 2 \) \, #h(2em) \( u omega \( u \) \)' = omega \( u - 1 \) quad \( u > 2 \) . $

 Then $omega \( u \) arrow.r e^(- gamma)$ as $u arrow.r oo$, where $gamma = lim_(n arrow.r oo) \( H_n - log n \)$ and $H_n = sum_(j = 1)^n 1 \/ j$.]
] <lem:elementary-buchstab>

#proof[
  Successive integration on unit intervals constructs a unique positive continuous function, locally absolutely continuous and with bounded one-sided derivatives on each such interval. For $u > 2$ its equation gives, almost everywhere,
  #[#set math.equation(numbering: n => "(13.1)")
   $ u omega' \( u \) = omega \( u - 1 \) - omega \( u \) = - integral_(u - 1)^u omega' \( v \) thin d v . $ <eq:elementary-buchstab-derivative>]
  Put $M_n = upright("ess") thin s u p_(n < u < n + 1) \| omega' \( u \) \|$. These quantities are finite by the construction, and $M_1 lt.eq 1$. For every integer $n gt.eq 2$, (13.1) implies
  $ M_n lt.eq 1 / n max \( M_(n - 1) \, M_n \) . $
  If $M_n > M_(n - 1)$ this inequality forces $M_n = 0$, a contradiction; otherwise it gives $M_n lt.eq M_(n - 1) \/ n$. Thus $M_n lt.eq 1 \/ n !$. In particular $omega'$ is integrable on $\[ 1 \, oo \)$, so $omega$ is bounded and has a finite limit, say $ell$.
  It remains to determine $ell$. For $t > 0$ define
  $ W \( t \) = integral_1^oo omega \( u \) e^(- t u) thin d u . $
  Boundedness justifies differentiation and integration by parts. The derivative of $u omega \( u \)$ is zero on $\( 1 \, 2 \)$; integrating it on $\[ 1 \, oo \)$, including the boundary value at $1$, gives
  $ - e^(- t) - t W' \( t \) = integral_2^oo omega \( u - 1 \) e^(- t u) thin d u = e^(- t) W \( t \) . $
  Since $W \( t \) arrow.r 0$ as $t arrow.r oo$, solving this differential equation yields
  #[#set math.equation(numbering: n => "(13.2)")
   $ 1 + W \( t \) = exp #h(-0.16667em) (integral_t^oo e^(- s) / s thin d s) . $ <eq:elementary-buchstab-transform>]
  The constant in this formula can be evaluated without a Tauberian argument. Integration by parts shows that
  $ integral_t^oo e^(- s) / s thin d s + log t = \( 1 - e^(- t) \) log t + integral_t^oo e^(- s) log s thin d s . $
  Moreover,
  #[#set math.equation(numbering: n => "(13.3)")
   $ integral_0^oo e^(- s) log s thin d s = - gamma . $ <eq:elementary-euler-integral>]
  For an elementary verification, substitution $s = n v$ and integration of the geometric sum give
  $ integral_0^n \( 1 - s \/ n \)^n log s thin d s = frac(n, n + 1) #scale(x: 120%, y: 120%)[\(] log n - H_(n + 1) #scale(x: 120%, y: 120%)[\)] . $
  Indeed,
  $ integral_0^1 \( 1 - v \)^n log v thin d v = - frac(1, n + 1) integral_0^1 frac(1 - \( 1 - v \)^(n + 1), v) thin d v = - frac(H_(n + 1), n + 1) . $
  The integrands in the first identity, extended by zero for $s > n$, are bounded in absolute value by $e^(- s) \| log s \|$. Dominated convergence proves (13.3). Consequently (13.2) gives $t W \( t \) arrow.r e^(- gamma)$ as $t arrow.b 0$. On the other hand, substituting $v = t u$ and using bounded convergence gives
  $ t W \( t \) = integral_t^oo omega \( v \/ t \) e^(- v) thin d v arrow.r ell . $
  This identifies $ell = e^(- gamma)$. ◻
]

This derivation supplies precisely the independently normalized limit needed to rule out a jump at $2$ in the proof of Lemma 7. It makes no use of the auxiliary Markov chain or of the future-integral identities proved there.

=== 13.2 The additive large sieve at the required order <the-additive-large-sieve-at-the-required-order>

The sharp large sieve is due to Montgomery and Vaughan #cite(label("MontgomeryVaughan1973")); see also #cite(label("VaughanLargeSieve")). The following separated-arcs argument gives the order of (2.2) that is used in the inverse estimate.

#thm([Lemma 13.2.])[
  #emph[Let $x_1 \, dots.h \, x_R in bb(R) \/ bb(Z)$ have pairwise circular distance at least $delta$, where $0 < delta lt.eq 1$. Let $J gt.eq 1$ be an integer. If complex coefficients $b_j$ are supported on $J$ consecutive integers, then 
$ sum_(r = 1)^R lr(|sum_j b_j e \( j x_r \)|)^2 lt.double \( J + delta^(- 1) \) sum_j \| b_j \|^2 $

 with an absolute implied constant. Hence (2.2) holds for every real $Q gt.eq 1$.]
] <lem:elementary-large-sieve>

#proof[
  Shifting the frequencies multiplies their sum by a complex number of modulus one. We may therefore write $T \( x \) = sum_(j = 0)^(J - 1) b_j e \( j x \)$ and $f \( x \) = \| T \( x \) \|^2$. Let $I_r$ be the arc of length $delta$ centred at $x_r$. Their interiors are disjoint. For $t in I_r$, the fundamental theorem of calculus along that arc gives
  $ f \( x_r \) lt.eq f \( t \) + integral_(I_r) \| f' \( x \) \| thin d x . $
  Average over $t in I_r$ and sum over $r$ to obtain
  $ sum_r f \( x_r \) lt.eq delta^(- 1) integral_0^1 \| T \( x \) \|^2 thin d x + integral_0^1 \| f' \( x \) \| thin d x . $
  Since $\| f' \| lt.eq 2 \| T' \| \| T \|$, Cauchy–Schwarz and Parseval give
  $ integral_0^1 \| f' \( x \) \| thin d x lt.eq 2 parallel T' parallel_2 parallel T parallel_2 lt.eq 4 pi \( J - 1 \) sum_(j = 0)^(J - 1) \| b_j \|^2 . $
  This proves the asserted estimate. Distinct reduced fractions modulo one with denominators at most $Q$ have circular distance at least $Q^(- 2)$: subtracting two such fractions, or subtracting an integer from their difference, leaves a nonzero integer numerator over the product of their denominators. Apply the estimate with $delta = Q^(- 2)$. When there is just one fraction, the same arc argument applies directly. ◻
]

=== 13.3 A degree-uniform plane-curve intersection bound <a-degree-uniform-plane-curve-intersection-bound>

The appeals to Bézout’s theorem in Lemma 30 require a bound uniform in both degrees and coefficients. Here is the needed affine form, proved by the elementary resultant argument. Only distinct points are counted; multiplicities are unnecessary.

#thm([Lemma 13.3.])[
  #emph[Let $F \, G in bb(C) \[ X \, Y \]$ be nonzero polynomials of respective total degrees $m \, n gt.eq 1$, with no common nonconstant factor. Then they have at most $m n$ common zeros in $bb(C)^2$.]
] <lem:elementary-bezout>

#proof[
  First choose linear coordinates in which the coefficients of $Y^m$ in $F$ and $Y^n$ in $G$ are nonzero constants. Such coordinates exist: choose the direction of the $Y$-axis outside the zeros of the two highest homogeneous parts. Each part excludes only finitely many directions in the projective line. Scaling the polynomials makes these leading coefficients one.
  Put $K = bb(C) \( X \)$. The two polynomials are coprime in $K \[ Y \]$. Indeed, clearing denominators in a common factor and removing common factors of its coefficients would give a common polynomial factor in $bb(C) \[ X \, Y \]$. This is the elementary Gauss lemma: the product of two polynomials whose coefficients have no common divisor again has coefficients with no common divisor, as follows by reduction modulo any irreducible divisor in $bb(C) \[ X \]$.
  Consider the linear map over $K$
  #[#set math.equation(numbering: n => "(13.4)")
   $ \( A \, B \) mapsto A F + B G \, #h(2em) deg_Y A < n \, quad deg_Y B < m \, $ <eq:elementary-sylvester-map>]
  with target the polynomials of $Y$-degree less than $m + n$. It is injective: from $A F = - B G$ and coprimality, $F$ divides $B$, forcing $B = 0$ and then $A = 0$. Its matrix in monomial bases is the Sylvester matrix. Its determinant $R \( X \)$ is a nonzero polynomial. If $\( x \, y \)$ is a common zero, every polynomial in the image of the specialized map at $X = x$ vanishes at $Y = y$. That image is a proper subspace, so $R \( x \) = 0$. There are finitely many such $x$, and each fiber contains finitely many points because $F \( x \, Y \)$ is monic of degree $m$. Thus the common zero set is finite.
  Now choose linear coordinates once more so that the $X$-coordinates of those finitely many points are distinct and both leading coefficients in $Y$ remain nonzero constants. The first condition excludes the finitely many directions joining pairs of common zeros; the second excludes the directions on which either highest homogeneous part vanishes. A direction satisfying both exists. Repeat the construction of $R$ in these coordinates.
  We claim that $deg R lt.eq m n$. Write
  $ F = sum_(k = 0)^m f_k \( X \) Y^k \, #h(2em) G = sum_(k = 0)^n g_k \( X \) Y^k \, #h(2em) deg f_k lt.eq m - k \, quad deg g_k lt.eq n - k . $
  View the rows of the Sylvester matrix as the coefficients of $Y^i F$ for $0 lt.eq i < n$ and $Y^j G$ for $0 lt.eq j < m$; label its columns by $Y^k$, $0 lt.eq k < m + n$. An entry from row $Y^i F$ and column $Y^k$ has degree at most $m + i - k$; an entry from row $Y^j G$ has degree at most $n + j - k$. Every nonzero term of the determinant uses each row and column once, so its degree is at most
  $ sum_(i = 0)^(n - 1) \( m + i \) + sum_(j = 0)^(m - 1) \( n + j \) - sum_(k = 0)^(m + n - 1) k = m n . $
  Every common zero gives a distinct root of the nonzero polynomial $R$. This proves the bound. ◻
]

For clarity, the coprimality conditions in Lemma 30 can now be checked directly. An irreducible factor $Q$ of degree $d gt.eq 2$ that is not proportional to a real polynomial is coprime to its coefficientwise conjugate. Both partial derivatives of $Q$ are nonzero: independence of one variable would force an irreducible polynomial over $bb(C)$ to be linear. Their smaller degrees make them coprime to $Q$, giving at most $d \( d - 1 \)$ intersections for each derivative; a nonzero constant derivative has no common zeros with $Q$. The same lemma applies to the inflection polynomial (8.8) when it is nonzero and not divisible by $Q$, since its degree is at most $3 d - 4$; a nonzero constant inflection polynomial has no zeros. If it is divisible by $Q$, every nonspecial smooth real graph arc has second derivative zero and lies on a line. Restricting $Q$ to that line would then give a univariate polynomial vanishing on an interval, hence identically; the line would be a factor of $Q$. This excludes such an arc and is exactly the alternative used in that proof.

=== 13.4 An order bound for primes in a progression <an-order-bound-for-primes-in-a-progression>

Brun–Titchmarsh gives a sharper constant than we need; see #cite(label("GranvilleSoundararajan2014")) Theorem 1.4.4. We derive the order bound in Lemma 4(iii) from the fundamental lemma, in the form recorded in #cite(label("Sofos2023")) Lemma 2.8, and Mertens’ formula. Working in progression coordinates keeps the remainder independent of the modulus.

#thm([Lemma 13.4.])[
  #emph[There are absolute constants $C \, J_0 > 0$ such that, for every integer $q gt.eq 1$, every integer $a$ with $\( a \, q \) = 1$, and every real $x$ and $H > 0$ with $J = H \/ q gt.eq J_0$, 
$ \# { x < p lt.eq x + H : p equiv a med \( mod med q \) } lt.eq C frac(H, phi \( q \) log \( H \/ q \)) . $

]
] <lem:elementary-brun-titchmarsh>

#proof[
  Write the progression as $a + q j$, with $j$ in the real interval
  $ \( x - a \) \/ q < j lt.eq \( x + H - a \) \/ q $
  of length $J$. Fix an absolute $s gt.eq s_0$ sufficiently large that $theta = 1 \/ \( 2 s \) < 1 \/ 2$, and put $v = J^theta$ and $D = J^(1 \/ 2) = v^s$. For every prime $p lt.eq v$ not dividing $q$, divisibility of $a + q j$ by $p$ specifies exactly one forbidden class of $j$ modulo $p$. For a squarefree product $l$ of these primes, the Chinese remainder theorem therefore gives the intersection count
  $ J \/ l + O \( 1 \) \, $
  with an absolute error independent of $x \, a \, q \, l$. Apply Lemma 3 with $X = J$ and $g \( p \) = 1 \/ p$ on this prime set. If $N$ counts the surviving coordinates, it gives
  #[#set math.equation(numbering: n => "(13.5)")
   $ N lt.double J product_(p lt.eq v\
p divides.not q) \( 1 - 1 \/ p \) + D \( 1 + log D \)^(C_2) $ <eq:elementary-bt-sieve>]
  for an absolute constant $C_2$. To justify the remainder explicitly, let $C_1$ be the divisor-weight exponent in (2.1) and choose an integer $k gt.eq 2^(C_1)$. On squarefree $l$, $tau \( l \)^(C_1) lt.eq tau_k \( l \)$, where $tau_k \( l \)$ counts ordered factorizations of $l$ into $k$ positive integers. Summing by the first $k - 1$ factors gives
  $ sum_(l lt.eq D) tau_k \( l \) lt.eq D (sum_(d lt.eq D) 1 / d)^(k - 1) lt.eq D \( 1 + log D \)^(k - 1) . $
  In particular, the remainder in (13.5) has no dependence on $q$.
  Mertens’ formula gives, for large $J$,
  $ product_(p lt.eq v\
p divides.not q) \( 1 - 1 \/ p \) = product_(p lt.eq v) \( 1 - 1 \/ p \) product_(p divides q\
p lt.eq v) \( 1 - 1 \/ p \)^(- 1) lt.double frac(1, log v) frac(q, phi \( q \)) lt.double frac(1, log J) frac(q, phi \( q \)) . $
  Every prime in the progression that exceeds $v$ is among the survivors. The primes at most $v$ contribute at most $v$ further points, regardless of $q$. Thus the desired prime count is at most
  $ N + v lt.double frac(J q, phi \( q \) log J) + J^(1 \/ 2) \( 1 + log J \)^(C_2) + J^theta . $
  The last two terms are $O \( J \/ log J \)$ for all sufficiently large $J$, uniformly in $q$. Since $q \/ phi \( q \) gt.eq 1$, they are absorbed by the first term. Substituting $J = H \/ q$ completes the proof. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
