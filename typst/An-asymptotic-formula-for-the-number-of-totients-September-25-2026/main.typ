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

#align(center)[#text(size: 16pt, weight: "bold")[An asymptotic formula for the number of totients]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Euler’s totient function $phi \( n \)$ counts the integers in ${ 1 \, dots.h \, n }$ that are relatively prime to $n$. We write

$ cal(V) = { phi \( n \) : n gt.eq 1 } \, #h(2em) V \( x \) = \# { v in cal(V) : v lt.eq x } . $

Counting distinct values requires more than counting integers with a prescribed factorization: different integers can have the same totient. This distinction is decisive in an asymptotic formula for $V \( x \)$.

Throughout the paper logarithms are natural, and $log_j$ denotes the $j$-fold iterated logarithm.

===== 1.1 The counting problem. <the-counting-problem.>

Since $phi \( p \) = p - 1$ for primes $p$, the prime number theorem gives $V \( x \) gt.eq pi \( x + 1 \) tilde.op x \/ log x$. Pillai proved that the totient values have density zero #cite(label("Pillai1929")). Erdős used the normal number of prime factors of $p - 1$ to sharpen the upper bound to $V \( x \) lt.double_epsilon x \/ \( log x \)^(1 - epsilon)$ for every $epsilon > 0$ #cite(label("Erdos1935")) Section 2. His later count of distinct values $phi \( p r \)$ with $p \, r$ prime and $p r lt.eq x$ gives the lower bound $\( 1 + o \( 1 \) \) x log_2 x \/ log x$ #cite(label("Erdos1945")) pp. 542–543. Erdős and Hall obtained a much larger factor $exp { a \( log_3 x \)^2 }$ for every $0 < a < 1 \/ log 16$ #cite(label("ErdosHall1976")) pp. 1–3. Pomerance brought the upper bound onto the same logarithmic scale #cite(label("Pomerance1986")) Equation (1.4). Maier and Pomerance then determined the leading constant #cite(label("MaierPomerance1988")) Section 1:

$ V \( x \) = frac(x, log x) exp { \( C_0 + o \( 1 \) \) \( log_3 x \)^2 } \, #h(2em) C_0 = 0.8178146 dots.h . $

In 1998, Ford refined this to an estimate with only a bounded multiplicative uncertainty #cite(label("FordTotients2013")) Theorem 1:

#[#set math.equation(numbering: n => "(1.1)")
 $ V \( x \) = frac(x, log x) exp mat(delim: "{", #none, C_0 \( log_3 x - log_4 x \)^2 + D_0 log_3 x; #none, #h(11.9552pt)  - \( D_0 + 1 / 2 - 2 C_0 \) log_4 x + O \( 1 \)) \, $ <eq:classical-order>]

where $D_0 = 2.1769687 dots.h$; both constants are specified in the notation of Section 2 below. Ford also described the typical prime factorizations of preimages #cite(label("FordTotients2013")) Theorems 10 and 16, which supply the structural starting point of our proof. All numbered references to his distribution paper use the revised arXiv version of 14 July 2013.

===== 1.2 Fixed dilation. <fixed-dilation.>

Erdős and Hall asked whether

$ frac(V \( c x \), V \( x \)) arrow.r c #h(2em) \( c > 1 upright(" fixed") \) $

in the final paragraph of #cite(label("ErdosHall1976")) p. 3. Erdős repeated the question in #cite(label("Erdos1979")) p. 80. Ford proved that $V \( c x \) - V \( x \) asymp_c V \( x \)$ for every fixed $c > 1$ #cite(label("FordTotients2013")) Theorem 4. This controls the number of values in a fixed multiplicative interval, but neither it nor (1.1) determines the limiting ratio.

We obtain an explicit asymptotic equivalent and prove the fixed-scale limit, thereby answering this question of Erdős and Hall positively. The coefficient in the equivalent retains finite arithmetic information. It is defined in Section 2 by bounded prime and integer sums, inclusion–exclusion, and a uniformly convergent limit; its definition does not use $V$.

===== 1.3 The source of the coefficient. <the-source-of-the-coefficient.>

Order the prime factors of a typical preimage from largest to smallest, and separate a long prefix from a shorter tail. Ford’s normal-structure estimates put the double logarithms of the large primes in a simplex. Most of that simplex can be counted by volume. Near its last coordinates the primes remain discrete, however, and several tail factorizations may give the same totient. We retain these tails exactly and take the volume of the union of the regions that they permit. Inclusion–exclusion of this finite union produces the arithmetic coefficient.

Erdős’s semiprime argument already controls collisions between products of shifted primes #cite(label("Erdos1945")) Lemma 1. The quantitative shifted-prime normality and layered comparison used here were developed by Maier and Pomerance #cite(label("MaierPomerance1988")) Sections 2–3 and Ford #cite(label("FordTotients2013")) Section 5. Here the comparison is proved under the hypotheses needed for the long prefix, with explicit costs for recovering the tuple data inside the residual factors. The resulting control of all ordered prefix collisions, combined with the exact finite-tail union, converts the volume into a count of distinct values. Counting the largest prime with common endpoint parameters first gives regular variation. Identifying the resulting mass with the arithmetic coefficient then gives the explicit equivalent. The errors are uniform in the phase; neither conclusion assumes continuity of the coefficient.

The prefix uniqueness used here is not uniqueness of the entire preimage: different arithmetic tails may still give the same value. A separate result on extreme complete fibers gives, for every fixed $epsilon > 0$, infinitely many positive integers $v$ with $\# { n gt.eq 1 : phi \( n \) = v } > v^(1 - epsilon)$ #cite(label("OpenAITotientFibers2026")) Theorem 1.1. That result concerns large individual fibers, rather than the asymptotic number of distinct values, and is not an input to the present proof.

===== 1.4 Least preimages. <least-preimages.>

For $v in cal(V)$, let

$ ell \( v \) = min { n gt.eq 1 : phi \( n \) = v } . $

For each fixed positive integer $k$, the same passage of Erdős #cite(label("Erdos1979")) p. 80 asks about the number of values $v lt.eq x$ for which $k x < ell \( v \) lt.eq \( k + 1 \) x$. Section 7 gives a weighted asymptotic and proves that this count has order $V \( x \)$ precisely when some totient $d$ satisfies $ell \( d \) > k d$; otherwise the count vanishes identically. The positive alternative holds for $k = 1 \, 2$. We do not determine which other integers $k$ satisfy this seed condition. In particular, the separate question whether $ell \( d \) \/ d$ is unbounded, posed in #cite(label("Erdos1995")) Section I.9, remains unresolved here.

== 2 The explicit main term <sec:statements>

We first give the counting scale and the main theorem, then construct its arithmetic coefficient. Definitions involving $x$ are used only for sufficiently large $x$.

=== 2.1 The scale <the-scale>

For $j gt.eq 1$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ a_j = \( j + 1 \) log \( j + 1 \) - j log j - 1 = integral_j^(j + 1) log t thin upright(d) t . $ <eq:aj>]

These numbers are positive. The increasing function $sum_(j gt.eq 1) a_j z^j$ goes from zero to infinity on $0 < z < 1$, so there is a unique $rho in \( 0 \, 1 \)$ such that

$ sum_(j gt.eq 1) a_j rho^j = 1 . $

These coefficients and this root occur in Maier and Pomerance’s asymptotic estimate #cite(label("MaierPomerance1988")) Section 1. Define

#[#set math.equation(numbering: n => "(2.2)")
 $ lambda = log \( 1 \/ rho \) \, #h(2em) gamma = (sum_(j gt.eq 1) j a_j rho^j)^(- 1) \, #h(2em) g_0 = 1 \, quad g_j = sum_(d = 1)^j a_d g_(j - d) . $ <eq:renewal>]

Our $gamma$ is the constant denoted by $lambda$ in Ford’s recurrence estimates #cite(label("FordTotients2013")) Section 3. Set

$ C_0 = frac(1, 2 lambda) \, #h(2em) D_0 = frac(1 + log \( lambda \/ gamma \), lambda) - 1 / 2 \; $

these are the constants in the classical estimate (1.1). For the scale used in our theorem, put

#[#set math.equation(numbering: n => "(2.3)")
 $ B = log_2 x \, #h(2em) m = ⌊frac(log B - log_2 B, lambda)⌋ \, #h(2em) theta = frac(log B - log_2 B, lambda) - m \, $ <eq:scales>]

so that $0 lt.eq theta < 1$, and write

#[#set math.equation(numbering: n => "(2.4)")
 $ G_j = frac(B^j, j ! product_(i = 1)^j g_i) quad \( 0 lt.eq j lt.eq m \) \, #h(2em) G_0 = 1 . $ <eq:Gj>]

The factor $x G_m \/ log x$ is Ford’s counting scale. The following theorem resolves its bounded multiplicative uncertainty by an explicitly constructed function of the phase $theta$.

#thm([Theorem 2.1.])[
  #emph[For sufficiently large positive integers $H$, there are nonnegative functions $A_H \( 1 \; dot.op \) : \[ 0 \, 1 \) arrow.r bb(R)$, given by the finite arithmetic formula (2.8) below, which converge uniformly as $H arrow.r oo$ to a function $A \( 1 \; dot.op \)$ satisfying 
$ 0 < inf_(0 lt.eq s < 1) A \( 1 \; s \) lt.eq sup_(0 lt.eq s < 1) A \( 1 \; s \) < oo . $

 With the parameters (2.2)–(2.4), 
$ V \( x \) tilde.op frac(x, log x) thin G_m A \( 1 \; theta \) . $

 Moreover, for every fixed real $c > 0$, 
$ frac(V \( c x \), V \( x \)) arrow.r c . $

]
] <thm:main>

The first argument of $A$ records a weight; the main theorem uses the constant weight $1$. Its arithmetic construction below does not use $V$. The fixed-scale conclusion has a separate mechanism: it compares the same representation count at two endpoints. No regularity of $s mapsto A \( 1 \; s \)$ is asserted or needed.

=== 2.2 The arithmetic coefficient <subsec:coefficient>

The tail index runs in the opposite direction from the ordered prime index. In the proof we write a preimage as $p_0 p_1 dots.h.c p_L a$, with the primes decreasing, and use two cuts

$ R = m - H \, #h(2em) L = m - P \, #h(2em) P = floor.l log log H floor.r . $

The long prefix ends at $p_R$, whereas the exact arithmetic tail contains $p_(R + 1) \, dots.h \, p_L$ and $a$. Thus the notation below is $Q_h = p_(m - h)$: its indices run from $P$ to $H - 1$, and $Q_P$ is the smallest retained prime. For fixed $H$, these tail primes are bounded independently of $x$. We first let $x$ tend to infinity with $H$ fixed, and only afterwards let $H$ tend to infinity. The following definition uses the phase $s$ directly, without reference to $x$.

Fix $s in \[ 0 \, 1 \)$ and put $alpha_s = lambda upright(e)^(lambda s)$. Let $H$ be a sufficiently large positive integer and $P = floor.l log log H floor.r$. A #emph[tail witness] is a choice

$ eta = \( \( Q_h \)_(P lt.eq h < H) \, a \) $

of primes $Q_h$ and a positive integer $a$ with the following properties. Writing $v_h = log_2 Q_h$, we require

#[#set math.equation(numbering: n => "(2.5)")
 $ 0.9 alpha_s h rho^(- h) & lt.eq v_h lt.eq 1.1 alpha_s h rho^(- h) &  & \( P lt.eq h < H \) \,\
sum_(l = P)^(h - 1) a_(h - l) v_l & lt.eq \( 1 + 10^(- 4) upright(e)^(- h \/ 40) \) v_h &  & \( P lt.eq h < H \) \,\
P^(+) \( a \) & lt.eq Q_P \, #h(2em) log a lt.eq exp \( 2 alpha_s P rho^(- P) \) . $ <eq:tail-bands>]

Here $P^(+) \( a \)$ is the largest prime factor of $a$, with $P^(+) \( 1 \) = 1$; an empty sum is zero. Associate to $eta$ the integer

$ w \( eta \) = a product_(h = P)^(H - 1) Q_h . $

For $d in cal(V)$, let $cal(W)_(H \, s) \( d \)$ be the set of tail witnesses for which $phi \( w \( eta \) \) = d$. For $h gt.eq H$, define

#[#set math.equation(numbering: n => "(2.6)")
 $ D \( h \, eta \) = sum_(l = P)^(H - 1) a_(h - l) v_l . $ <eq:tail-D>]

The set of all possible witnesses, even as $s$ varies, is finite for each fixed $H$: $alpha_s$ lies between $lambda$ and $lambda \/ rho$, and every prime and integer in (2.5) is consequently bounded in terms of $H$. Also $D \( h \, eta \) = O_H \( log \( h + 1 \) \)$. Thus the series used below converges absolutely, uniformly over this finite set and over $s$.

A tail totient must contribute once even when it has several witnesses. The union that enforces this can be described by independent exponential random variables $E_h$ of mean one, indexed by $h gt.eq H$. For each witness put

#[#set math.equation(numbering: n => "(2.7)")
 $ cal(E)_eta = ⋂_(h gt.eq H) {E_h gt.eq gamma / alpha_s rho^h D \( h \, eta \)} . $ <eq:tail-events>]

For a function $f : \[ 1 \, oo \) arrow.r \[ 0 \, 1 \]$, the coefficient is

$ A_H \( f \; s \) = rho^(H \( H - 1 \) \/ 2) (gamma / alpha_s)^H sum_(d in cal(V)\
cal(W)_(H \, s) \( d \) eq.not diameter) frac(f \( ell \( d \) \/ d \), d) thin Pr (union.big_(eta in cal(W)_(H \, s) \( d \)) cal(E)_eta) . $

An intersection of events requires each $E_h$ to exceed the largest of the corresponding thresholds. Independence and absolute convergence of their sum therefore turn finite inclusion–exclusion into the explicit expression

#[#set math.equation(numbering: n => "(2.8)")
 $ A_H \( f \; s \) =  & rho^(H \( H - 1 \) \/ 2) (gamma / alpha_s)^H sum_(d in cal(V)\
cal(W)_(H \, s) \( d \) eq.not diameter) frac(f \( ell \( d \) \/ d \), d)\
 & quad times sum_(diameter eq.not T subset.eq cal(W)_(H \, s) \( d \)) \( - 1 \)^(\| T \| - 1) exp {- gamma / alpha_s sum_(h = H)^oo rho^h max_(eta in T) D \( h \, eta \)} . $ <eq:AH>]

For $f = 1$, the factor involving $ell$ is simply $1$: no least-preimage search is part of the main coefficient. For other weights, any witness with totient $d$ supplies the finite search bound $ell \( d \) lt.eq w \( eta \)$. The probability expression also shows directly that $A_H \( f \; s \) gt.eq 0$. Section 6 identifies these probabilities with limiting normalized prefix volumes: $1 \/ d$ comes from counting the largest prime, and the prefactor is the limiting ratio of the prefix volume to $G_m$.

When the limit exists, write

$ A \( f \; s \) = lim_(H arrow.r oo) A_H \( f \; s \) . $

Each approximant uses finite arithmetic data and an absolutely convergent series, not an unspecified counting constant. Theorem 1 justifies the limit for $f = 1$; the next result does so for the weights needed to count least preimages. Convergence for arbitrary $f$ is not required.

=== 2.3 Least-preimage intervals <least-preimage-intervals>

For a positive integer $k$, define

#[#set math.equation(numbering: n => "(2.9)")
 $ N_k \( x \) & = \# { v in cal(V) : v lt.eq x \, med k x < ell \( v \) lt.eq \( k + 1 \) x } \,\
f_k \( r \) & = min { 1 \, \( k + 1 \) \/ r } - min { 1 \, k \/ r } . $ <eq:fk>]

The function $f_k$ is nonnegative and bounded by $1$.

#thm([Theorem 2.2.])[
  #emph[For each fixed positive integer $k$, the functions $A_H \( f_k \; s \)$ converge uniformly for $0 lt.eq s < 1$, and 
$ N_k \( x \) = frac(x, log x) thin G_m #scale(x: 120%, y: 120%)[\(] A \( f_k \; theta \) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $

 There are two possibilities.]
  + #emph[If some $d in cal(V)$ satisfies $ell \( d \) > k d$, then 
$ inf_(0 lt.eq s < 1) A \( f_k \; s \) > 0 \, #h(2em) N_k \( x \) tilde.op frac(x, log x) thin G_m A \( f_k \; theta \) asymp_k V \( x \) . $

]
  + #emph[If no such $d$ exists, then $N_k \( x \) = 0$ for every $x > 0$, and $A \( f_k \; s \) = 0$ for every $s in \[ 0 \, 1 \)$.]
  #emph[The first alternative holds for $k = 1 \, 2$.]
] <thm:companion>

This theorem does not determine which other integers $k$ satisfy the first alternative. Whether the first alternative holds for every positive integer $k$ is equivalent to the unboundedness of $ell \( d \) \/ d$; the weighted formula does not settle this question.

=== 2.4 Proof strategy <proof-strategy>

Two parts of the argument ensure that this construction counts values once. First, outside an exceptional set, #emph[every] preimage has the required form. Second, collisions between different long prefixes have negligible total multiplicity. For the latter we use the layered shifted-prime method of Maier and Pomerance #cite(label("MaierPomerance1988")) Section 3, in the form developed by Ford, and adapt his comparison #cite(label("FordTotients2013")) Lemma 5.1 to a different set of hypotheses, proving the necessary uniform bound in Section 4. The number of layers grows, but each sieve application concerns only two or three linear forms. The comparison and the subsequent control of tuple multiplicities are the ingredients that turn a volume estimate into an asymptotic for distinct values.

The end of the continuous prefix and the end of the retained prime list are different cuts. Their separation makes the exceptional-set estimates small enough to absorb the smooth tail. Section 3 obtains the required preimages directly from Ford’s Theorems 10 and 16 and develops the volume estimates. Section 5 proves prefix uniqueness and transfers tuple counts to distinct values. Section 6 counts the largest prime using common endpoint parameters, obtaining fixed dilation before identifying the arithmetic limit. Finally, Section 7 weights that prime count to locate least preimages and proves the positive and zero alternatives.

== 3 Extracting a long prime prefix <sec:extraction>

Our first task is to represent almost every totient by a long prime prefix and a bounded arithmetic tail. The exceptional set must be small in a stronger sense: outside it, #emph[every] preimage must have the required form. Later we shall count distinct prefix–tail tuples, and remove tuples that fail the conditions needed to compare two representations.

Throughout this section $H$ is a sufficiently large fixed integer, $P = floor.l log log H floor.r$, and

#[#set math.equation(numbering: n => "(3.1)")
 $ R = m - H \, #h(2em) L = m - P . $ <eq:cuts>]

We first let $x arrow.r oo$, and then let $H arrow.r oo$. Write $h_i = m - i$ and

$ alpha = frac(B rho^m, m) \, #h(2em) b_i = alpha h_i rho^(- h_i) \, #h(2em) tilde(b)_i = alpha_theta h_i rho^(- h_i) \, #h(2em) xi_i = 1 + 10^(- 4) upright(e)^(- h_i \/ 40) . $

In particular $b_0 = B$. The definitions in (2.3) give

#[#set math.equation(numbering: n => "(3.2)")
 $ alpha / alpha_theta = frac(log B, lambda m) = 1 + frac(lambda theta + log log B, lambda m) = 1 + O (frac(log m, m)) . $ <eq:alpha-comparison>]

Thus $alpha$ and $alpha_theta$ stay in a fixed compact subinterval of $\( 0 \, oo \)$, uniformly in the phase. We shall only need the coarse bounds

#[#set math.equation(numbering: n => "(3.3)")
 $ 0.54 < rho < 0.545 \, $ <eq:rho-bounds>]

which follow from the numerical value recorded in #cite(label("FordTotients2013")) (1.4). They imply $lambda < 1$, $18 < 30 lambda < 20$, and $1.1 rho < 0.6$. Together with (3.2), these inequalities justify the fixed constants $0.61$ and $0.62$ used below. We use

$ K_H = exp \( C P rho^(- P) \) = H^(o \( 1 \)) \, $

where the absolute constant $C$ may be enlarged from one upper bound to the next. The last equality follows from $lambda = log \( 1 \/ rho \) < 1$. The notation $epsilon_H$ denotes a positive quantity tending to zero with $H$, and $o_(x \; H) \( 1 \)$ denotes a quantity tending to zero as $x arrow.r oo$ for fixed $H$. All such estimates below are uniform in the phase.

=== 3.1 Structure estimates from Ford <structure-estimates-from-ford>

Ford’s order estimate and fundamental-simplex estimates give

#[#set math.equation(numbering: n => "(3.4)")
 $ V \( x \) asymp frac(x, log x) G_m \, $ <eq:ford-scale>]

and his recurrence estimate gives

#[#set math.equation(numbering: n => "(3.5)")
 $ g_j = gamma rho^(- j) + O \( 1 \) \, #h(2em) g_j asymp rho^(- j) . $ <eq:g-asymptotic>]

See #cite(label("FordTotients2013")) Theorem 1, Lemmas 3.4 and 3.7, and Corollary 3.5. Ford denotes our constant $gamma$ by $lambda$. In particular, for $0 lt.eq j lt.eq m$,

#[#set math.equation(numbering: n => "(3.6)")
 $ G_j / G_m = product_(i = j + 1)^m frac(i g_i, B) lt.eq C^(m - j) rho^(\( m - j \) \( m - j - 1 \) \/ 2) lt.double 1 . $ <eq:G-uniform>]

We shall use two quantitative structure results of Ford. Order the prime factors of a preimage $n$ with repetitions as $p_0 gt.eq p_1 gt.eq dots.h.c$. For each fixed $0 < eta lt.eq 1 \/ 8$, his Theorem 10, together with the missing-prime exception in Theorem 16, implies

#[#set math.equation(numbering: n => "(3.7)")
 $ \# {v lt.eq x : v in cal(V) \, med upright("some preimage has")\
\| log_2 p_i \/ b_i - 1 \| > eta upright(" for some ") 1 lt.eq i lt.eq m - P} lt.double_eta V \( x \) upright(e)^(- c_eta P) . $ <eq:ford-bands>]

Here and below a missing indicated prime is a failure of the condition. For completeness, the summation giving (3.7) is short. For $i lt.eq 3 eta m$, Theorem 10(b) contributes at most $C m upright(e)^(- eta m \/ 13) V \( x \)$. For $i > 3 eta m$, Theorem 10(a) contributes at most

$ C V \( x \) frac(i, eta m) exp {- frac(eta^2 m \( m - i \), 4 i)} lt.eq frac(C V \( x \), eta) upright(e)^(- eta^2 \( m - i \) \/ 4) . $

Summing over $m - i gt.eq P$ proves the assertion for sufficiently large $x$ when the indicated primes exist. A missing $p_L$ is included in the $O \( V \( x \) upright(e)^(- P^2 \/ 4) \)$ exceptional set of Theorem 16, which is absorbed in the displayed bound. The convention preceding Ford’s Theorem 10 counts values with #emph[some] failing preimage; hence the complement of this set controls every preimage.

Ford’s Theorem 16, with its parameter $Psi = P$, states that all but $O \( V \( x \) upright(e)^(- P^2 \/ 4) \)$ values have every preimage satisfying

#[#set math.equation(numbering: n => "(3.8)")
 $ log_2 p_L > 2 \, #h(2em) sum_(r = i + 1)^L a_(r - i) u_r lt.eq xi_i u_i quad \( 0 lt.eq i < L \) \, #h(2em) u_0 = B \, quad u_i = log_2 p_i med \( i gt.eq 1 \) . $ <eq:ford-simplex>]

Its final adjacent-coordinate inequality has coefficient $1$ in place of $a_1 < 1$; weakening that inequality gives (3.8).

Write $Omega \( n \, U \, T \)$ for the number of prime factors of $n$ belonging to $\( U \, T \]$, counted with multiplicity, and put $Omega \( n \) = Omega \( n \, 1 \, n \)$, including $Omega \( 1 \) = 0$.

#prodef([Definition 3.1.])[
  For $S gt.eq upright(e)^(upright(e))$, a prime $p$ is $S$-normal if
  $ Omega \( p - 1 \, 1 \, S \) lt.eq 2 log_2 S $
  and, for every $S lt.eq U < T lt.eq p - 1$,
  $ lr(|Omega \( p - 1 \, U \, T \) - \( log_2 T - log_2 U \)|) < sqrt(log_2 S thin log_2 T) . $
] <def:normal>

We use Definition 1 in the 2013 revision #cite(label("FordTotients2013")). Its Lemma 2.6 gives, uniformly for $z gt.eq 3$,

#[#set math.equation(numbering: n => "(3.9)")
 $ \# { p lt.eq z : p upright(" is not ") S upright("-normal") } lt.double frac(z, log z) \( log_2 z \)^5 \( log S \)^(- 1 \/ 6) . $ <eq:normal-primes>]

The function $Omega$ in these statements counts prime factors with multiplicity.

=== 3.2 Basic witnesses and the coverage target <basic-witnesses-and-the-coverage-target>

We now specify the representations that these structure estimates will provide. The simplex notation records the inequalities on their prime coordinates; the bounds on the last factor will make the arithmetic tail finite for fixed $H$.

For integers $1 lt.eq j lt.eq m$, $u_0 = B$, and $beta_i gt.eq 1$ for $0 lt.eq i < j$, put $beta_j = 1$ and define the simplex

$ S_j \( bold(beta) \) = {\( u_1 \, dots.h \, u_j \) : s_i := beta_i u_i - sum_(r = i + 1)^j a_(r - i) u_r gt.eq 0 quad \( 0 lt.eq i lt.eq j \)} . $

The terminal inequality is $u_j gt.eq 0$. For $j = 0$, the simplex consists of the empty tuple and has volume $G_0 = 1$.

#prodef([Definition 3.2.])[
  A #emph[basic witness] is a choice of primes $p_0 \, dots.h \, p_L$ and an integer $a gt.eq 1$ satisfying
  #[#set math.equation(numbering: n => "(3.10)")
   $ p_0 gt.eq x^0.9 \, #h(2em) 0.9 tilde(b)_i lt.eq log_2 p_i lt.eq 1.1 tilde(b)_i quad \( 1 lt.eq i lt.eq L \) \,\
\( u_1 \, dots.h \, u_L \) in S_L \( bold(xi) \) \, #h(2em) P^(+) \( a \) lt.eq p_L \, #h(2em) log a lt.eq exp \( 2 tilde(b)_L \) . $ <eq:basic>]
  Here $u_0 = B$, and $u_i = log_2 p_i$ for $i gt.eq 1$.
] <def:basic>

For our parameter range the prime bands are disjoint and decreasing; also $p_0 > p_1$. Thus the displayed prime prefix is strictly decreasing. Repetitions of $p_L$ inside $a$ are allowed.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0.4, 0.45), [#text(size: 9pt)[$p_0$]])
  content((3.2, 0.45), [#text(size: 9pt)[$p_1#h(0.3333em) dots.h#h(0.3333em) p_R$]])
  content((8, 0.45), [#text(size: 9pt)[$p_(R+1)#h(0.3333em) dots.h#h(0.3333em) p_L$]])
  content((11.5, 0.45), [#text(size: 9pt)[$a$]])
  line((5.55, -0.1), (5.55, 1.05), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((10.45, -0.1), (10.45, 1.05), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((5.55, 1.05), [#text(size: 9pt)[$R=m-H$]], anchor: "south", padding: 0.1176cm)
  content((10.45, 1.05), [#text(size: 9pt)[$L=m-P$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.1), (5.2, -0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.9, -0.1), (11.9, -0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.6, -0.35), [#text(size: 9pt)[prefix]], anchor: "north", padding: 0.1176cm)
  content((8.9, -0.35), [#text(size: 9pt)[finite arithmetic tail]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two cuts in a basic witness. We count $p_0$ by the prime number theorem and approximate the $p_1 \, dots.h \, p_R$ coordinates by volume. The later primes and the smooth integer $a$ remain discrete. ],
) <fig:two-cuts>

#thm([Proposition 3.3.])[
  #emph[There is a set $E_x subset.eq cal(V) ∩ \[ 1 \, x \]$ with 
$ \| E_x \| lt.eq { epsilon_H + o_(x \; H) \( 1 \) } V \( x \) $

 such that every preimage of every $v in \( cal(V) ∩ \[ 1 \, x \] \) \\ E_x$ is $p_0 dots.h.c p_L a$ for a basic witness. One may take 
$ epsilon_H lt.double upright(e)^(- c P) + K_H exp { - exp \( c P rho^(- P) \) } . $

 For every basic witness, putting $w = p_(R + 1) dots.h.c p_L a$, we have 
#[#set math.equation(numbering: n => "(3.11)")
 $ p_1 dots.h.c p_L a lt.eq exp \( \( log x \)^0.8 \) \,\
log w lt.eq H exp \( 0.62 b_R \) + exp \( 2 tilde(b)_L \) \, #h(2em) w < p_R . $ <eq:cofactor-size>]

 In particular $w$ is bounded in terms of $H$ alone, uniformly in the phase.]
] <prop:basic>

We prove the proposition after the volume and smooth-cofactor estimates below. Those estimates also prepare a second task: we shall retain the shortened data $\( p_0 \, dots.h \, p_R \, phi \( w \) \)$, then delete those that fail the strict inequalities and normality conditions needed for the collision argument. Coverage concerns #emph[values]; this later deletion must count the distinct shortened tuples, including all tuples that represent the same value.

=== 3.3 Simplex volume and concentration <simplex-volume-and-concentration>

The coordinate scaling follows Ford’s fundamental-simplex method #cite(label("FordTotients2013")) Lemma 3.2 and Corollary 3.3. Our last adjacent coefficient is $a_1$ rather than $1$, so the exact volume is slightly different from his; we derive it from the slacks below. The recurrence estimate (3.5) is Ford’s Lemma 3.7; his Remark 1 credits its streamlined proof to Lau’s solution of a recurrence problem #cite(label("FordLau2000")).

The next estimates turn sums over the allowed prime coordinates into simplex volumes. We also bound the mass near a coordinate boundary or a simplex face, so that removing these regions has a controlled cost.

#thm([Lemma 3.4.])[
  #emph[Let $1 lt.eq j lt.eq m$. The true simplex $S_j \( bold(1) \)$ has volume $G_j$. Under its uniform volume measure the variables $W_i = g_i s_i \/ B$ are uniform on ${ W_i gt.eq 0 : sum_(i = 0)^j W_i = 1 }$. Moreover, 
$ "Vol" S_j \( bold(beta) \) lt.eq G_j product_(r < j) beta_r^(j - r) . $

 Within $S_j \( bold(beta) \)$, a specified slack $s_t$ in an interval of length $D$ occupies at most a fraction $j g_t D \/ B$ of the volume. A specified coordinate $u_t$, $1 lt.eq t lt.eq j$, in such an interval occupies at most $j g_t beta_t D \/ B$.]
] <lem:simplex>

#proof[
  For the true simplex the triangular inversion is
  $ u_i = sum_(t = i)^j g_(t - i) s_t \, #h(2em) B = sum_(t = 0)^j g_t s_t . $
  The transformation from $u_1 \, dots.h \, u_j$ to $s_1 \, dots.h \, s_j$ has determinant $1$. This proves the volume and distribution statements.
  Set $K_i = product_(r < i) beta_r$, $K_0 = 1$. The map $u_i mapsto u_i \/ K_i$ sends $S_j \( bold(beta) \)$ into $S_j \( bold(1) \)$, because $K_r gt.eq beta_i K_i$ when $r > i$. Its inverse Jacobian is $product_(r < j) beta_r^(j - r)$.
  For the slice estimates, define $gamma'_0 = 1$ and $gamma'_t = beta_t^(- 1) sum_(i < t) gamma'_i a_(t - i)$. Then $0 < gamma'_t lt.eq g_t$ and
  $ sum_(t = 0)^j gamma'_t s_t = beta_0 B . $
  The marginal density of $s_t$, under the uniform measure on this simplex, is at most $j gamma'_t \/ \( beta_0 B \)$. For the coordinate assertion, fix all other positive-index slacks. The coordinate $u_t$ is affine in $s_t$ with slope $1 \/ beta_t$. Integrating first in this fiber and bounding by the full projection volume gives the additional factor $beta_t$. ◻
]

The following concentration estimate will be used in Section 6 to remove the prefix bands after replacing prime sums by volumes. Write $z_(+) = max { z \, 0 }$.

#thm([Lemma 3.5.])[
  #emph[Fix $eta > 0$. There are constants $C_eta \, c_eta > 0$ such that, if $Q$ is an integer with $0 lt.eq Q < m$, $j = m - Q$, $1 lt.eq i lt.eq j$, and $h_i gt.eq C_eta \( Q + 1 \)$, then uniform volume measure on $S_j \( bold(1) \)$ satisfies 
$ Pr \( \| u_i \/ b_i - 1 \| > eta \) lt.eq C_eta upright(e)^(- c_eta h_i) . $

 Also, for $T gt.eq 0$, 
$ Pr \( u_j gt.eq T \) = \( 1 - g_j T \/ B \)_(+)^j lt.eq upright(e)^(- j g_j T \/ B) . $

]
] <lem:concentration>

#proof[
  By (3.5) and Lemma 6,
  $ frac(u_i, B rho^i) = sum_(t = i)^j \( 1 + O \( rho^(t - i) \) \) W_t . $
  Represent $W_t = E_t \/ sum_(r = 0)^j E_r$, where the $E_t$ are independent mean-one exponential variables. The main numerator has $j - i + 1 = h_i - Q + 1$ terms, and
  $ frac(\( j - i + 1 \) \/ \( j + 1 \), h_i \/ m) = 1 + O \( \( Q + 1 \) \/ h_i \) . $
  Exponential moment bounds give exponentially small probabilities for a fixed relative deviation of either the numerator or the denominator. The error numerator is bounded in absolute value by $C sum_(r gt.eq 0) rho^r E_(i + r)$; this sum has a uniformly bounded exponential moment, since $product_(r gt.eq 0) \( 1 - z rho^r \)^(- 1) < oo$ for $0 < z < 1$. Once $h_i gt.eq C_eta \( Q + 1 \)$, these three bounds give the first assertion. The second is the exact marginal tail of $W_j$. ◻
]

=== 3.4 Prime boxes and smooth cofactors <prime-boxes-and-smooth-cofactors>

The use of reciprocal prime sums and enlarged coordinate boxes follows Ford’s Lemma 3.1 and the thickening arguments of his Section 3 #cite(label("FordTotients2013")). We record the quantitative bounds for our simplexes, including the boundary errors needed for the tail unions.

We use unit boxes in the coordinates $log_2 p_i$. Mertens’ theorem gives

#[#set math.equation(numbering: n => "(3.12)")
 $ sum_(b lt.eq log_2 p < b + 1) frac(1, p - 1) = 1 + O \( upright(e)^(- b) \) #h(2em) \( b gt.eq 2 \) . $ <eq:mertens-box>]

The replacement of $1 \/ p$ by $1 \/ \( p - 1 \)$ changes the sum by $O \( exp \( - exp b \) \)$. When the lower endpoints grow geometrically backwards through the coordinates, multiplying (3.12) costs only a bounded factor; if their sum of errors is small, it is the relative product error.

#thm([Lemma 3.6.])[
  #emph[Let $0 lt.eq j lt.eq L$. Sum over primes $p_1 \, dots.h \, p_j$ whose coordinates satisfy 
$ 0.9 tilde(b)_i lt.eq u_i lt.eq 1.1 tilde(b)_i \, #h(2em) \( u_1 \, dots.h \, u_j \) in S_j \( bold(xi) \) . $

 Then 
#[#set math.equation(numbering: n => "(3.13)")
 $ sum_(p_1 \, dots.h \, p_j) product_(i = 1)^j frac(1, p_i - 1) lt.double G_m . $ <eq:projected-mass>]

 Every unit box meeting this region lies in $S_j \( bold(beta) \)$, where, with a sufficiently large absolute constant, 
#[#set math.equation(numbering: n => "(3.14)")
 $ beta_t = 1 + C #scale(x: 120%, y: 120%)[\(] upright(e)^(- h_t \/ 40) + h_t^2 rho^(h_t) #scale(x: 120%, y: 120%)[\)] quad \( 0 lt.eq t < j \) \, #h(2em) beta_j = 1 . $ <eq:box-enlargement>]

 This enlargement has bounded volume cost. Its coordinate scaling factors through $R$ differ from $1$ by $O \( upright(e)^(- H \/ 40) + H^2 rho^H \)$.]
  #emph[There is also the following shell estimate in $L$ coordinates. Fix $A > 0$. Among unit boxes meeting the displayed region, retain those with a point satisfying, for some $i lt.eq R$, at least one of these conditions:]
  + #emph[$i gt.eq 1$ and $u_i$ is within $A$ of a coarse band endpoint;]
  + #emph[the absolute value of $xi_i u_i - sum_(r = i + 1)^L a_(r - i) u_r$ is at most $A h_i^2$;]
  + #emph[$sum_(r = i + 1)^L a_(r - i) u_r gt.eq \( 1 - h_i^(- 4) \) u_i$.]
  #emph[The total volume of these boxes, and their total reciprocal-prime weight, is 
#[#set math.equation(numbering: n => "(3.15)")
 $ O_A \( H^(- 2) G_m \) . $ <eq:boundary-mass>]

 The same estimate holds when any subset of coordinates uses reciprocal-prime measure and the others use Lebesgue measure. For conditions (i)–(ii) alone, or for the region lost by replacing the prefix coefficients $xi_i$, $0 lt.eq i lt.eq R$, with $1$, the stronger bound is 
$ O_A (G_m sum_(h gt.eq H) \( h upright(e)^(- h \/ 40) + h^3 rho^h \)) . $

]
] <lem:boxes>

#proof[
  The band lower bounds are $u_t gt.double h_t rho^(- h_t)$. Changing each coordinate by at most $1$ changes inequality $t$ by $O \( h_t^2 \)$. These errors are absorbed by (3.14), including at $t = 0$, where $u_0 = B$ is fixed. The logarithm of its Jacobian upper bound is at most
  $ C sum_(h gt.eq P) h #scale(x: 120%, y: 120%)[\(] upright(e)^(- h \/ 40) + h^2 rho^h #scale(x: 120%, y: 120%)[\)] lt.double 1 . $
  Lemma 6, (3.6), and (3.12) prove (3.13). The coordinate scaling factor is $product_(t < i) beta_t$, without the Jacobian exponents; summing for $h_t > h_i gt.eq H$ proves its stated bound.
  For the shells put $h = h_i$. Throughout a box meeting the bands, $u_i lt.double b_i$. Conditions (ii) and (iii), together with the unit perturbations, put the enlarged slack in an interval starting at zero of length at most
  $ C_A { b_i \( h^(- 4) + upright(e)^(- h \/ 40) \) + h^3 } . $
  Here the $h^3$ term includes $h^2 rho^h u_i = O \( h^3 \)$. Since $L g_i \/ B lt.double rho^h$, Lemma 6 bounds the relative volume by
  $ C_A \( h^(- 3) + h upright(e)^(- h \/ 40) + h^3 rho^h \) . $
  Condition (i), after expanding its interval by $2$, costs only $O_A \( rho^h \)$. Sum these estimates over $h gt.eq H$, and use the bounded enlargement cost. The prime-weight assertion follows again from (3.12). For the stronger assertion, omit $h^(- 4)$ from the slack interval. Changing $xi_i$ to $1$, for $i lt.eq R$, only removes points whose old slack is between $0$ and $\( xi_i - 1 \) u_i$, which obey the same bound. Finally every full unit box has uniformly bounded mass when an arbitrary subset of its coordinates uses reciprocal-prime measure: multiply the factors in (3.12) for precisely that subset. This proves the mixed-measure assertion as well. ◻
]

#thm([Lemma 3.7.])[
  #emph[Uniformly for $Y gt.eq exp \( exp 2 \)$ and $Z gt.eq 0$, 
$ sum_(P^(+) \( a \) lt.eq Y) frac(a^(1 \/ log Y), phi \( a \)) lt.double log Y \, #h(2em) sum_(P^(+) \( a \) lt.eq Y\
log a > Z) frac(1, phi \( a \)) lt.double \( log Y \) exp \( - Z \/ log Y \) . $

 In particular, with $Y = exp exp \( 1.1 tilde(b)_L \)$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ sum_(P^(+) \( a \) lt.eq Y) frac(1, phi \( a \)) lt.eq K_H \, #h(2em) sum_(P^(+) \( a \) lt.eq Y\
log a > exp \( 2 tilde(b)_L \)) frac(1, phi \( a \)) lt.eq K_H exp { - exp \( c P rho^(- P) \) } . $ <eq:smooth-cost>]

]
] <lem:smooth-tail>

#proof[
  Put $sigma = 1 \/ log Y$. The Euler factor is
  $ 1 + frac(p^sigma, \( p - 1 \) \( 1 - p^(sigma - 1) \)) \, $
  whose logarithm is $p^(- 1 + sigma) + O \( p^(- 2 + 2 sigma) \)$, uniformly in this range of $sigma$. Partial summation gives $sum_(p lt.eq Y) \( p^(- 1 + sigma) - p^(- 1) \) = O \( 1 \)$; hence the product is $O \( log Y \)$. Rankin’s inequality gives the tail bound. For the last assertion the exponent is
  $ 1.1 tilde(b)_L - exp \( 0.9 tilde(b)_L \) \, $
  and $tilde(b)_L asymp P rho^(- P)$. ◻
]

Combining Lemmas 8 and 9, the shell estimates remain valid after summing a smooth cofactor with weight $1 \/ phi \( a \)$, at a cost of at most $K_H$. In particular their weighted mass is bounded by

#[#set math.equation(numbering: n => "(3.17)")
 $ C K_H G_m {H^(- 2) + sum_(h gt.eq H) \( h upright(e)^(- h \/ 40) + h^3 rho^h \)} . $ <eq:weighted-boundary>]

The $H^(- 2)$ term is needed only for condition (iii).

=== 3.5 Coverage of the values <coverage-of-the-values>

#proof[
  Take $eta = 0.04$ in (3.7). By (3.2), its complementary bands imply the coarse bands in (3.10). Apply (3.8) as well. Both conclusions hold for all preimages outside the union of their exceptional sets.
  We may also remove $v lt.eq x^0.95$ and $Omega \( v \) > 5 B$, at a cost $o \( V \( x \) \)$. For the latter, the elementary reciprocal moment bound with $z = 1.9 < 2$ gives
  $ \# { v lt.eq x : Omega \( v \) > 5 B } lt.eq z^(- 5 B) x sum_(r lt.eq x) z^(Omega \( r \)) / r lt.double x exp \( \( z - 5 log z \) B \) = o \( x \/ log x \) . $
  The Euler product bounds the reciprocal sum by $O \( \( log x \)^z \)$, and $z - 5 log z < - 1$. For every preimage, $Omega \( n \) lt.eq Omega \( phi \( n \) \) + 1 lt.eq 6 B$. The $p_1$ band gives $log p_1 lt.eq \( log x \)^0.61$, so
  $ log p_0 gt.eq 0.95 log x - 6 B \( log x \)^0.61 > 0.9 log x . $
  It remains to impose the size restriction on $a$. For any preimage failing it, fix $p_1 \, dots.h \, p_L \, a$. The prime $p_0$ is distinct from the others and from the factors of $a$. Supermultiplicativity of $phi$ gives
  $ phi \( p_0 dots.h.c p_L a \) gt.eq \( p_0 - 1 \) phi \( a \) product_(i = 1)^L \( p_i - 1 \) . $
  The prime number theorem upper bound therefore gives at most
  $ frac(C x, log x) thin frac(1, phi \( a \) product_(i = 1)^L \( p_i - 1 \)) $
  choices of $p_0$; if the interval is nonempty its upper endpoint is at least $x^0.9$. Sum the prefix by Lemma 8, and the cofactor by Lemma 9. This bounds all failing preimages, and therefore all values having at least one such preimage. It proves the exceptional-value assertion.
  Finally $b_(i + 1) \/ b_i = \( 1 - 1 \/ h_i \) rho$. The bands and (3.2) imply that the largest double logarithm after index $R$ is at most $0.62 b_R$. There are $H - P lt.eq H$ such primes, proving the second line of (3.11). Its right-hand side is smaller than $exp \( 0.89 b_R \) < log p_R$ for large $H$, then large $x$. For the first line use the $p_1$ bound and $L lt.double log B$, while the $a$ bound depends only on $H$. ◻
]

=== 3.6 Tuples and their discarded part <tuples-and-their-discarded-part>

For $t = x$ or $t = x \/ c$, where $c > 1$ is fixed, keep all parameters formed from $x$. Let $cal(T) \( t \)$ be the set of distinct tuples

$ tau = \( p_0 \, dots.h \, p_R \, d \) $

admitting at least one basic witness with

$ d = phi \( w \) \, #h(2em) w = p_(R + 1) dots.h.c p_L a \, #h(2em) d product_(i = 0)^R \( p_i - 1 \) lt.eq t . $

Each tuple represents a totient, because $w < p_R$ makes its tail coprime to its prefix. Several witnesses may give the same tuple; $cal(T) \( t \)$ counts that tuple once.

We next remove tuples for which the comparison argument might fail. For each $0 lt.eq i lt.eq R$, put $h = h_i$ and

$ J_i = ceil.l 30 log h ceil.r \, #h(2em) S_i = exp exp \( b_i^(1 \/ 3) \) \, #h(2em) z_i = exp exp \( 0.7 b_(i + J_i) \) \, $

and, for a basic witness, put

$ D_i = phi \( p_(i + J_i + 1) dots.h.c p_L a \) . $

For large $H$ these indices exist: $J_i < h_i \/ 2$ and $i + J_i < L$. We call a tuple good if #emph[every] basic witness giving it satisfies, for every $0 lt.eq i lt.eq R$,

#[#set math.equation(numbering: n => "(3.18)")
 $ sum_(r = i + 1)^L a_(r - i) u_r lt.eq \( 1 - h_i^(- 4) \) u_i \,\
p_i \, dots.h \, p_(i + J_i) upright(" are ") S_i upright("-normal") \,\
\( p_i - 1 \) dots.h.c \( p_(i + J_i) - 1 \) upright(" is squarefree on primes exceeding ") z_i \,\
Omega \( D_i \) lt.eq b_i \/ h_i^8 . $ <eq:good-conditions>]

As before, the first condition uses $u_0 = B$. Denote the good tuples by $cal(G) \( t \)$, and put $cal(D) \( t \) = cal(T) \( t \) \\ cal(G) \( t \)$.

#thm([Proposition 3.8.])[
  #emph[For $t = x$ and $t = x \/ c$, with the same $x$-dependent parameters, 
$ \| cal(D) \( t \) \| lt.eq { epsilon_H + o_(x \; H) \( 1 \) } frac(x G_m, log x) . $

 One may take $epsilon_H lt.double K_H H^(- 2)$. For all the witnesses in (3.18) we also have 
#[#set math.equation(numbering: n => "(3.19)")
 $ P^(+) \( D_i \) < z_i \, #h(2em) S_i < z_i \, #h(2em) c h_i^(- 20) lt.eq b_(i + J_i) \/ b_i lt.eq C h_i^(- 18) . $ <eq:tail-cutoffs>]

]
] <prop:discard>

#proof[
  The last comparison follows from
  $ b_(i + J_i) / b_i = \( 1 - J_i \/ h_i \) rho^(J_i) \, #h(2em) 18 < 30 log \( 1 \/ rho \) < 20 . $
  It gives $S_i < z_i$. The next prime band has upper endpoint, in double logarithms, less than $0.7 b_(i + J_i)$; all remaining primes, including those in $a$, are smaller. Taking totients cannot introduce a prime above this bound. This proves (3.19).
  A bad tuple has at least one failing full witness. We bound the number of these witnesses; this is an upper bound for the number of bad tuples, regardless of witness multiplicity. The prime-count upper bound for $p_0$ contributes $C x \/ log x$, with the product of reciprocal factors for all other variables. The smooth $a$-sum contributes at most $K_H$. Failure of the first condition in (3.18) is covered by Lemma 8, condition (iii). Its contribution is therefore $O \( K_H H^(- 2) x G_m \/ log x \)$.
  For the other conditions fix $i$, write $h = h_i$, $b = b_i$, and $J = J_i$. If $i gt.eq 1$, the reciprocal sum for the common initial segment $p_1 \, dots.h \, p_(i - 1)$ is $O \( G_m \)$, by (3.13). All of $p_i \, dots.h \, p_L$ are at most $exp exp \( 1.2 b \)$. Their unrestricted reciprocal sums together cost $exp \( C h^2 \)$, since there are at most $h$ variables and $log b = O \( h \)$. For $i = 0$, omit $p_0$ from these reciprocal sums and use the same estimate at $b = B$.
  Partial summation of (3.9) gives
  $ sum_(p lt.eq exp exp \( 1.2 b \)\
p med upright("not") med S_i upright("-normal")) frac(1, p - 1) lt.double \( 1 + b \)^6 upright(e)^(- b^(1 \/ 3) \/ 6) lt.eq upright(e)^(- c b^(1 \/ 3)) . $
  For a failure involving $p_0$, apply (3.9) directly to its counting interval; its upper endpoint has logarithm comparable with $log x$. The normality failures thus contribute, relative to $x G_m \/ log x$, at most
  #[#set math.equation(numbering: n => "(3.20)")
   $ K_H sum_(h gt.eq H) exp \( C h^2 - c b \( h \)^(1 \/ 3) \) \, #h(2em) b \( h \) = alpha h rho^(- h) . $ <eq:normal-discard>]
  Polynomial factors from choosing an index are included in $C h^2$.
  A square of a prime $q > z_i$ in the shifted-prime product either divides one shift twice or divides two different shifts. For $ell = 1 \, 2$ and $Z gt.eq 2$, the elementary estimate
  $ sum_(p lt.eq Z\
q^ell divides p - 1) frac(1, p - 1) lt.eq frac(1 + log Z, q^ell) $
  follows by summing over all positive multiples of $q^ell$. If the shift is $p_0 - 1 lt.eq T$, its integer count is at most $floor.l T \/ q^ell floor.r lt.eq T \/ q^ell$. Relative to prime counting this loses at most $log x = upright(e)^b$ when $i = 0$. Both types of square therefore cost $q^(- 2)$, up to $exp \( C b + C h^2 \)$. Summing over $q > z_i$, their total relative contribution is at most
  #[#set math.equation(numbering: n => "(3.21)")
   $ K_H sum_(h gt.eq H) exp { C h^2 + C b \( h \) - exp \( c b \( h \) h^(- 20) \) } . $ <eq:square-discard>]
  Finally $Omega \( phi \( a \) \) lt.double log a lt.eq upright(e)^(2 tilde(b)_L) = H^(o \( 1 \))$, whereas $b_i \/ h_i^8$ is exponentially large in $h_i gt.eq H$. In the identity for $D_i$, overlap between $a$ and the displayed primes can occur only at $p_L$. That overlap changes the sum of factor counts by $1 - Omega \( p_L - 1 \) lt.eq 0$. Failure of the last condition in (3.18) therefore forces some $i + J < j lt.eq L$ to satisfy $Omega \( p_j - 1 \) > b_i \/ \( 2 h^9 \)$. The Euler product gives
  $ sum_(n lt.eq Z) frac(\( 3 \/ 2 \)^(Omega \( n \)), n) lt.double \( log Z \)^(3 \/ 2) . $
  Using the band bound for $p_j$, this exceptional reciprocal sum is at most
  $ exp \( C b_(i + J) - c b_i \/ h^9 \) lt.eq exp \( - c' b_i \/ h^9 \) \, $
  because $b_(i + J) lt.double b_i h^(- 18)$. The resulting relative contribution is at most
  #[#set math.equation(numbering: n => "(3.22)")
   $ K_H sum_(h gt.eq H) exp \( C h^2 - c b \( h \) \/ h^9 \) . $ <eq:omega-discard>]
  Each sum in (3.20)–(3.22) decreases faster than every inverse power of $H$, uniformly for $alpha$ in its compact range. Together with the thin-slack bound, this proves the proposition. Replacing the endpoint $x$ by $x \/ c$ only decreases the witness sets, so the same bound holds with unchanged parameters. ◻
]

The two cuts have now served different purposes. The cut at $L$ keeps the smooth-cofactor cost at $K_H = H^(o \( 1 \))$; the earlier cut at $R$ supplies the summable $H^(- 2)$ loss and the much stronger savings in the remaining discards. Proposition 5 controls exceptional #emph[values], while Proposition 10 controls exceptional #emph[tuples]. Neither yet asserts uniqueness of a representation. That is the purpose of the comparison and collision arguments that follow.

== 4 Comparing products of shifted primes <sec:layers>

We next bound the number of ways that two ordered lists of primes can give the same product of their shifts. The largest prime factors of the shifts lie in separated intervals. We expose the factors one interval at a time, starting with the smallest interval. At each stage only two or three simultaneous prime conditions are needed. This keeps the constants uniform when the number of intervals grows.

The layer decomposition and the comparison of dual factorizations go back to Maier and Pomerance #cite(label("MaierPomerance1988")) Section 3 and were developed further in Ford’s proof of Lemma 5.1 #cite(label("FordTotients2013")). We prove the version needed here, including its dependence on the number of layers. In particular, we assume squarefreeness of the whole product above the last cutoff; squarefreeness of each individual shift would not suffice for our factor-allocation estimate.

=== 4.1 A uniform sieve for two or three forms <a-uniform-sieve-for-two-or-three-forms>

#thm([Lemma 4.1.])[
  #emph[There are absolute constants $C$ and $y_0$ with the following property. Let $y gt.eq y_0$, put $B_y = log_2 y$, and let $1 lt.eq A \, A' lt.eq y$ be integers. Consider either the two forms 
$ n \, quad A n + 1 \, $

 or the three forms 
$ n \, quad A n + 1 \, quad A' n + 1 \, #h(2em) A eq.not A' . $

 Write $k = 2$ or $3$, respectively, and let $cal(P)$ be the set of positive integers at which all the indicated forms are prime. Then, uniformly for $X gt.eq 3$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ \# \( cal(P) ∩ \[ 1 \, X \] \) lt.eq C frac(X B_y^k, \( log X \)^k) . $ <eq:sieve-count>]

 Moreover, uniformly for $3 lt.eq U lt.eq Y$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(n in cal(P)\
U lt.eq n lt.eq Y) 1 / n lt.eq C frac(B_y^k, \( log U \)^(k - 1)) . $ <eq:sieve-reciprocal>]

 The coefficients need not be bounded in terms of $X$ or $U$.]
] <lem:sieve>

#proof[
  For primitive, distinct, admissible integral linear forms $a_j n + b_j$ with positive leading coefficients and nonzero determinant $Delta$ as defined below, Ford’s uniform upper sieve #cite(label("FordSieve2023")) Theorem 2.5 gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ \# { 1 lt.eq n lt.eq X : a_j n + b_j upright(" prime for every ") j } lt.double_k frac(X, \( log X \)^k) (frac(Delta, phi \( Delta \)))^k \,\
Delta = lr(|product_j a_j product_(j < l) \( a_j b_l - a_l b_j \)|) . $ <eq:sieve-determinant>]
  Here admissibility means that no prime divides the product of the forms for every integer input; the implied constant depends only on $k$, including when the coefficients vary. For our forms, primitivity is automatic, and the determinants are $A$ and $A A' \( A - A' \)$, up to sign. They are nonzero and have absolute value at most $y^3$.
  If our forms are inadmissible, an offending prime is at most $k$, since each primitive linear form has at most one root modulo that prime. At every simultaneous-prime input one of the forms must equal this prime. Each such equality has at most one solution, so there are at most $k$ inputs. Their contribution is absorbed in (4.1).
  For admissible forms, the elementary estimate
  $ frac(d, phi \( d \)) lt.double log_2 \( d + 10 \) #h(2em) \( d gt.eq 1 \) $
  and (4.3) prove (4.1). To recall its uniformity, split the product over prime divisors of $d$ at $log \( d + 10 \)$. Mertens’ product estimate bounds the first part by $O \( log_2 \( d + 10 \) \)$. For the remaining part, use $sum_(p divides d) log p lt.eq log d$ to bound the sum of reciprocal prime divisors, giving a bounded factor. Since $k$ takes only the values $2$ and $3$, all constants are absolute.
  Finally, partial summation of (4.1), with the coefficients fixed, gives
  $ sum_(n in cal(P)\
U lt.eq n lt.eq Y) 1 / n lt.double B_y^k (frac(1, \( log Y \)^k) + integral_U^Y frac(thin upright(d) t, t \( log t \)^k)) lt.double frac(B_y^k, \( log U \)^(k - 1)) . $
  This also includes a possible prime at the lower endpoint. ◻
]

=== 4.2 The comparison estimate <the-comparison-estimate>

For a positive integer $n$ and a real number $Z$, its part supported above $Z$ means $product_(p^a parallel n \, med p > Z) p^a$. We use $S$-normality as defined in Definition 3.

The key term in the bound below is the exponent of $log y$. In its application, a strict simplex inequality makes the weighted cutoff sum plus its error smaller than $1$ by a controlled amount. The exponent is consequently smaller than $- 1$; that extra saving absorbs the other factors, even after recovering the tuple data hidden in the smooth remainder. We need an estimate for ordered pairs with multiplicity: a bound only on the number of values admitting a collision would not control how many tuples lie over those values.

#thm([Proposition 4.2.])[
  #emph[There are absolute constants $C$ and $y_0$ such that the following holds. Let $y gt.eq y_0$, put $B_y = log_2 y$, and let $b$ be an integer with $1 lt.eq b lt.eq B_y$. Suppose that real cutoffs satisfy 
$ Y_0 = y \, #h(2em) upright(e)^(upright(e)) lt.eq S lt.eq Y_b \, #h(2em) Y_(j + 1) < U_j < Y_j quad \( 0 lt.eq j < b \) . $

 Put 
$ nu_j = frac(log_2 Y_j, B_y) quad \( 0 lt.eq j lt.eq b \) \, #h(2em) mu_j = frac(log_2 U_j, B_y) quad \( 0 lt.eq j < b \) \, #h(2em) delta = sqrt(frac(log_2 S, B_y)) . $

 Fix a positive integer $D$ with $P^(+) \( D \) lt.eq Y_b$ and a real $r gt.eq 1$. Let $N$ count the ordered tuples 
$ \( p_0 \, dots.h \, p_(b - 1) \, q_0 \, dots.h \, q_(b - 1) \, D' \) $

 in which $D'$ is a positive integer and the following conditions hold:]
  + #emph[The $p_j \, q_j$ are $S$-normal primes, $p_j eq.not q_j$, and 
$ U_j lt.eq P^(+) \( p_j - 1 \) \, P^(+) \( q_j - 1 \) lt.eq Y_j #h(2em) \( 0 lt.eq j < b \) . $

]
  + #emph[$P^(+) \( D' \) lt.eq Y_b$ and 
$ D product_(j = 0)^(b - 1) \( p_j - 1 \) = D' product_(j = 0)^(b - 1) \( q_j - 1 \) lt.eq y / r . $

]
  + #emph[The common product in (ii) is squarefree on primes greater than $Y_b$.]
  + #emph[The part of $p_0 - 1$ supported above $Y_1$ exceeds $sqrt(y)$.]
  #emph[Then 
#[#set math.equation(numbering: n => "(4.4)")
 $ N lt.eq  & frac(y, r D) \( C B_y^6 \)^b \( b + 1 \)^(Omega \( D \)) \( log Y_b \)^(1 + 3 b log \( b \( b + 1 \) \))\
 & quad times \( log y \)^(- 2 + sum_(j = 1)^(b - 1) a_j nu_j + E_b) \, $ <eq:comparison>]

 where 
#[#set math.equation(numbering: n => "(4.5)")
 $ E_b = 2 sum_(j = 1)^(b - 1) \( nu_j - mu_j \) + delta sum_(i = 2)^b \( i log i + i \) . $ <eq:comparison-error>]

 Here $a_j$ is as defined in (2.1). Empty sums are zero; in particular, when $b = 1$ the cutoff in (iv) is $Y_1 = Y_b$.]
] <prop:comparison>

#proof[
  We first describe the layers and the weighted summation that combines them. We then count the top layer, estimate a general lower layer, and finally sum over the small prime factors.
  ===== 4.2.1 The layer configurations. <the-layer-configurations.>
  For $0 lt.eq i lt.eq b$ and $0 lt.eq j < b$, let
  $ s_(i \, j) = product_(p^a parallel p_j - 1\
p lt.eq Y_i) p^a \, #h(2em) s'_(i \, j) = product_(p^a parallel q_j - 1\
p lt.eq Y_i) p^a . $
  Restricting the equality in condition (ii) to primes at most $Y_i$ gives the common product
  $ s_i^(\#) = D product_(j = 0)^(b - 1) s_(i \, j) = D' product_(j = 0)^(b - 1) s'_(i \, j) . $
  For $1 lt.eq i lt.eq b$, put
  $ t_(i \, j) = s_(i - 1 \, j) / s_(i \, j) \, #h(2em) t'_(i \, j) = s'_(i - 1 \, j) / s'_(i \, j) \, #h(2em) t_i^(\#) = s_(i - 1)^(\#) / s_i^(\#) . $
  Each $t_i^(\#)$ is squarefree and supported on $\( Y_i \, Y_(i - 1) \]$. For $j gt.eq i$ the factors $t_(i \, j)$ and $t'_(i \, j)$ equal $1$, so
  #[#set math.equation(numbering: n => "(4.6)")
   $ t_i^(\#) = product_(j = 0)^(i - 1) t_(i \, j) = product_(j = 0)^(i - 1) t'_(i \, j) . $ <eq:layer-two-allocations>]
  Thus a layer consists of two allocations of the same squarefree integer among $i$ labeled slots.
  Let $cal(C)_i$ be the set of configurations
  $ sigma_i = \( D' \, s_(i \, 0) \, dots.h \, s_(i \, b - 1) \, s'_(i \, 0) \, dots.h \, s'_(i \, b - 1) \) $
  arising from tuples counted by $N$. Restriction of prime factors maps $cal(C)_(i - 1)$ into $cal(C)_i$; the two allocations in (4.6) determine each extension uniquely. Reconstructing a tuple from its small prime factors runs from $cal(C)_b$ back to $cal(C)_0$; the weighted count below sums in the opposite direction, starting with the top layer. The original tuples are in bijection with $cal(C)_0$, since $p_j = s_(0 \, j) + 1$ and $q_j = s'_(0 \, j) + 1$. For $i gt.eq 2$ we will bound, uniformly in $sigma_i$, the reciprocal extension sum
  $ sum_(sigma_(i - 1) in cal(C)_(i - 1)\
sigma_(i - 1) upright(" restricts to ") sigma_i) 1 / t_i^(\#) . $
  This is the appropriate weight because $1 \/ s_(i - 1)^(\#) = 1 \/ \( s_i^(\#) t_i^(\#) \)$.
  Every configuration considered here extends to a genuine solution. In particular, its partial common product is at most $y \/ r$, each shift is at most $y$, and every fixed or conditional coefficient used below is at most $y$. When enlarging a sum for an upper bound, we retain any necessary restriction on a conditional coefficient until the corresponding sieve estimate has been applied.
  ===== 4.2.2 The top layer. <the-top-layer.>
  Only the zeroth shift can have a prime factor greater than $Y_1$. Consequently $t_1^(\#)$ is the same part of $p_0 - 1$ and $q_0 - 1$, and $t_1^(\#) > sqrt(y)$. Normality, applied with endpoint $p_0 - 1$, gives
  $ Omega \( p_0 - 1 \) lt.eq B_y + log_2 S + sqrt(B_y log_2 S) lt.eq 3 B_y . $
  Write $t_1^(\#) = t' Q$, with $Q = P^(+) \( t_1^(\#) \)$. The weaker bound $Omega \( t_1^(\#) \) lt.eq 4 B_y$ already gives
  $ Q gt.eq y^(1 \/ \( 8 B_y \)) . $
  After $sigma_1$ and $t'$ are fixed, the completed primes have the forms $A Q + 1 \, A' Q + 1$. Their inequality implies $A eq.not A'$, which is exactly the nonzero determinant condition for the three-form sieve. With
  $ X = frac(y, r s_1^(\#) t') \, $
  a nonempty extension has $X gt.eq Q gt.eq y^(1 \/ \( 8 B_y \))$. Lemma 11 therefore bounds the number of $Q$ by
  $ lt.double frac(X B_y^3, \( log X \)^3) lt.double frac(y, r s_1^(\#) t') frac(B_y^6, \( log y \)^3) . $
  The integer $t'$ is squarefree and supported on $\( Y_1 \, y \]$. Mertens’ estimate gives
  $ sum_(t') 1 / t' lt.eq product_(Y_1 < p lt.eq y) (1 + 1 / p) lt.double frac(log y, log Y_1) . $
  It follows that, for each $sigma_1$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ \# { sigma_0 upright(" restricting to ") sigma_1 } lt.eq C B_y^6 frac(y, r s_1^(\#)) \( log y \)^(- 2 - nu_1) . $ <eq:top-layer>]
  ===== 4.2.3 The prime conditions in an intermediate layer. <the-prime-conditions-in-an-intermediate-layer.>
  Fix $2 lt.eq i lt.eq b$ and $sigma_i$. The last slot, of index $i - 1$, is complete after this layer. Let $Q_1 \, Q_2$ be its largest prime factors on the two sides; both lie in $\[ U_(i - 1) \, Y_(i - 1) \]$.
  Suppose first that $Q_1 = Q_2 = Q$. Remove the unique occurrence of $Q$ from $t_i^(\#)$, and call the result $t$. For fixed allocations of $t$, the completed primes are $A Q + 1 \, A' Q + 1$ with $A eq.not A'$. Lemma 11 gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ sum_Q 1 / Q lt.double frac(B_y^3, \( log U_(i - 1) \)^2) . $ <eq:shared-layer-prime>]
  Now suppose $Q_1 eq.not Q_2$ and remove both, obtaining $t$. In addition to its two allocations, fix the position of $Q_1$ on the second side and of $Q_2$ on the first side. There are at most $i^2$ choices. If neither prime lies in the opposite last slot, the two completed prime conditions are $A Q_1 + 1$ and $A' Q_2 + 1$; two applications of (4.2) with $k = 2$ give
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_(Q_1 \, Q_2) frac(1, Q_1 Q_2) lt.double frac(B_y^4, \( log U_(i - 1) \)^2) . $ <eq:distinct-layer-primes>]
  If $Q_2$ lies in the last slot on the first side, then $Q_2 < Q_1$. The prime $Q_1$ cannot lie in the last slot on the second side, whose largest prime is $Q_2$. The completed prime conditions are now $A Q_2 Q_1 + 1$ and $A' Q_2 + 1$. First sum over $Q_1$ conditional on $Q_2$, using the forms $Q_1 \, A Q_2 Q_1 + 1$. Feasibility ensures $A Q_2 lt.eq y$, so the inner reciprocal sum is uniformly $O \( B_y^2 \/ log U_(i - 1) \)$. Only after this estimate do we enlarge the range of $Q_2$ and apply the two-form bound to $Q_2 \, A' Q_2 + 1$. This proves (4.9) again. The reversed incidence is treated by reversing the order of summation. Both incidences cannot occur simultaneously, as they would imply both $Q_1 < Q_2$ and $Q_2 < Q_1$.
  ===== 4.2.4 Counting the allocations. <counting-the-allocations.>
  Put $Delta_i = nu_(i - 1) - nu_i$. Normality bounds the number of prime factors of an individual shift in $\( Y_i \, Y_(i - 1) \]$ by $\( Delta_i + delta \) B_y$. Indeed, if the shift ends before $Y_(i - 1)$, apply normality only up to its endpoint; if it ends before $Y_i$, the count is zero. In either case the error is at most $sqrt(log_2 S thin B_y) = delta B_y$. Only $i$ shifts contribute to this layer, and removing the distinguished primes decreases the count. Thus
  $ Omega \( t \) lt.eq I_i := i \( Delta_i + delta \) B_y . $
  Since $t$ is squarefree, each of its prime factors chooses one of $i$ slots on each side, giving at most $i^(2 Omega \( t \))$ dual allocations. Write
  $ M_i = sum_(Y_i < p lt.eq Y_(i - 1)) 1 / p . $
  Mertens’ estimate gives $M_i lt.eq Delta_i B_y + O \( 1 \)$, uniformly in the cutoffs. Since $delta B_y gt.eq sqrt(B_y)$, increasing the absolute threshold $y_0$ ensures $M_i lt.eq \( Delta_i + delta \) B_y$. Hence
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_t i^(2 Omega \( t \)) / t & lt.eq sum_(n lt.eq I_i) frac(\( i^2 M_i \)^n, n !) lt.eq i^(I_i) exp \( i M_i \)\
 & lt.eq exp #scale(x: 120%, y: 120%)[\(] \( i log i + i \) \( Delta_i + delta \) B_y #scale(x: 120%, y: 120%)[\)] . $ <eq:allocation-entropy>]
  The middle inequality follows by writing $i^(2 n) = i^n i^n$, using $i^n lt.eq i^(I_i)$, and extending the remaining exponential series. It is valid without any lower bound on $Delta_i \/ delta$.
  Combining (4.8), (4.9), and (4.10), and using $i lt.eq b lt.eq B_y$ to absorb the $i^2$ position choices, gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ sum_(sigma_(i - 1) upright(" restricting")\
upright("to ") sigma_i) 1 / t_i^(\#) lt.eq C B_y^6 \( log y \)^(- 2 mu_(i - 1) + \( i log i + i \) \( nu_(i - 1) - nu_i + delta \)) . $ <eq:intermediate-layer>]
  The squarefree hypothesis was used both to remove a single occurrence of each distinguished prime and to obtain the factorial denominator in (4.10).
  ===== 4.2.5 Multiplying the layer estimates. <multiplying-the-layer-estimates.>
  Starting from (4.7), sum over $cal(C)_1$. For each subsequent layer use the exact weighted identity
  $ sum_(sigma_(i - 1) in cal(C)_(i - 1)) 1 / s_(i - 1)^(\#) = sum_(sigma_i in cal(C)_i) 1 / s_i^(\#) sum_(sigma_(i - 1) upright(" restricting to ") sigma_i) 1 / t_i^(\#) . $
  All bounds in (4.11) are uniform in the lower configuration. Their constants therefore multiply to at most $C^b B_y^(6 b)$. If $c_i = i log i + i$, so that $c_1 = 1$, the power of $log y$ accumulated in this procedure is
  $ & - 2 - nu_1 + sum_(i = 2)^b { - 2 mu_(i - 1) + c_i \( nu_(i - 1) - nu_i + delta \) }\
 & #h(2em) = - 2 + sum_(j = 1)^(b - 1) a_j nu_j + 2 sum_(j = 1)^(b - 1) \( nu_j - mu_j \) + delta sum_(i = 2)^b c_i - c_b nu_b . $
  Here $c_(j + 1) - c_j - 2 = a_j$, including $j = 1$. The identity also holds for $b = 1$. Discard the nonpositive final term $- c_b nu_b$. It remains to bound $sum_(sigma_b in cal(C)_b) 1 \/ s_b^(\#)$.
  ===== 4.2.6 The smooth parts and repeated factors. <the-smooth-parts-and-repeated-factors.>
  Write $s = s_b^(\#) \/ D$ and $L_b = log_2 Y_b$. For a fixed $s$, its allocation among the $b$ left slots has at most $b^(Omega \( s \))$ possibilities. The allocation of $s D$ among the $b$ right slots and the additional slot $D'$ has at most $\( b + 1 \)^(Omega \( s D \))$ possibilities. These bounds allow prime powers: assigning labeled copies of a repeated prime to slots overcounts every possible distribution of its exponent.
  Each left shift has largest prime factor above $Y_b$. Its number of prime factors at most $Y_b$ is bounded by normality as follows:
  $ Omega \( p_j - 1 \, 1 \, Y_b \) lt.eq 2 log_2 S + \( L_b - log_2 S \) + sqrt(L_b log_2 S) lt.eq 3 L_b . $
  If $S = Y_b$, the first normality inequality alone gives the same bound. Thus $Omega \( s \) lt.eq 3 b L_b$. The ordinary smooth-number Euler product, including all powers, now gives
  $ sum_(sigma_b in cal(C)_b) 1 / s_b^(\#) & lt.eq frac(\( b + 1 \)^(Omega \( D \)), D) \[ b \( b + 1 \) \]^(3 b L_b) sum_(P^(+) \( s \) lt.eq Y_b) 1 / s\
 & = frac(\( b + 1 \)^(Omega \( D \)), D) \[ b \( b + 1 \) \]^(3 b L_b) product_(p lt.eq Y_b) (1 - 1 / p)^(- 1)\
 & lt.double frac(\( b + 1 \)^(Omega \( D \)), D) \( log Y_b \)^(1 + 3 b log \( b \( b + 1 \) \)) . $
  No squarefreeness is assumed below $Y_b$. Combining this estimate with the layer bounds proves (4.4), after increasing the absolute constant $C$. ◻
]

#prodef([Remark 4.3.])[
  The explicit error in (4.5) satisfies
  $ E_b = 2 sum_(j = 1)^(b - 1) \( nu_j - mu_j \) + O #scale(x: 120%, y: 120%)[\(] delta b^2 log \( 2 b \) #scale(x: 120%, y: 120%)[\)] \, $
  and the smooth-factor exponent is $O \( b log \( 2 b \) \)$. Thus all dependence on a growing $b$ is displayed in (4.4). No restriction such as $r lt.eq y^(1 \/ 10)$ or $D lt.eq y^(1 \/ 100)$ is needed: the large top part supplies the lower bound for the actual sieve endpoint.
] <rem:comparison-uniformity>

== 5 Uniqueness of the continuous prefix <sec:collisions>

We now pass from representations to distinct totient values. We retain the tuple sets $cal(T) \( t \)$, $cal(G) \( t \)$ and $cal(D) \( t \)$ of Section 3: the first consists of the distinct tuples $\( p_0 \, dots.h \, p_R \, d \)$ admitting a basic witness, the second consists of those for which every basic witness satisfies (3.18), and $cal(D) \( t \) = cal(T) \( t \) \\ cal(G) \( t \)$. Their value map is

$ F \( p_0 \, dots.h \, p_R \, d \) = d product_(j = 0)^R \( p_j - 1 \) . $

The tail preimages of $d$ are not part of a tuple. This distinction is essential: we shall prove that almost every value has one such tuple, while allowing several tail preimages.

=== 5.1 Counting pairs with the same value <counting-pairs-with-the-same-value>

The alignment of largest factors and cancellation follow the argument around (5.34)–(5.37) in Ford’s Section 5 #cite(label("FordTotients2013")). Here we count all ordered pairs of distinct tuples, including the data inside both residual factors. We first cancel the common prefix and align the large factors in the remaining shifts. After applying the comparison estimate, we recover the tuple coordinates inside the residual factors and then restore the common prefix.

#thm([Proposition 5.1.])[
  (Prefix collisions).  #emph[Fix $c > 1$, and form all parameters from $x$, with $H$ fixed before $x$ tends to infinity. For $t = x$ or $t = x \/ c$, let 
$ K \( t \) = \# { \( tau \, sigma \) in cal(G) \( t \)^2 : tau eq.not sigma \, med F \( tau \) = F \( sigma \) } . $

 There is a quantity $epsilon.alt_H arrow.r 0$, independent of the phase, such that 
$ K \( t \) lt.eq #scale(x: 120%, y: 120%)[\(] epsilon.alt_H + o_(x \; H) \( 1 \) #scale(x: 120%, y: 120%)[\)] frac(x G_m, log x) . $

 The pairs counted here are ordered pairs of distinct tuples.]
] <prop:collisions>

#proof[
  Choose one basic witness for each tuple under consideration. All choices satisfy (3.18), by the definition of $cal(G) \( t \)$. If two distinct tuples have the same value, some displayed prime differs: equality of all the primes $p_0 \, dots.h \, p_R$ would also force equality of $d$. Let $i$ be the first unequal prime index, and write $q_j$ for the primes in the other witness. Put
  $ h = m - i \, #h(2em) J = ceil.l 30 log h ceil.r \, #h(2em) z = z_i = exp exp \( 0.7 b_(i + J) \) \, #h(2em) S = S_i = exp exp \( b_i^(1 \/ 3) \) . $
  Thus $h gt.eq H$. The residual integers in the good conditions are
  $ D_i = phi \( p_(i + J + 1) dots.h.c p_L a \) \, #h(2em) D'_i = phi \( q_(i + J + 1) dots.h.c q_L a' \) . $
  Canceling the common prefix leaves the identity
  #[#set math.equation(numbering: n => "(5.1)")
   $ v^(\( i \)) = D_i product_(j = 0)^J \( p_(i + j) - 1 \) = D'_i product_(j = 0)^J \( q_(i + j) - 1 \) . $ <eq:suffix-identity>]
  We will apply Proposition 12 to this identity. First we verify its size and interval hypotheses; then we count all ways in which its solutions can give tuple pairs.
  ===== 5.1.1 Sizes of the suffix and its layers. <sizes-of-the-suffix-and-its-layers.>
  For sufficiently large $H$, uniformly for $h gt.eq H$,
  #[#set math.equation(numbering: n => "(5.2)")
   $ b_i asymp h rho^(- h) \, #h(2em) log b_i = O \( h \) \, #h(2em) c_1 h^(- 20) lt.eq b_(i + J) / b_i = \( 1 - J \/ h \) rho^J lt.eq C_1 h^(- 18) . $ <eq:collision-scales>]
  Indeed $30 lambda$ lies strictly between $18$ and $20$; the ceiling in $J$ changes only constant factors. In particular $J < h \/ 2$ and $i + J < L$. The constants in this proof are independent of $H \, x \, i$ and the phase, once $H$ and then $x$ are sufficiently large.
  For $i = 0$ set $y = x$. For $i gt.eq 1$ place $v^(\( i \))$ in a dyadic interval $\( y \/ 2 \, y \]$. The coarse bands in (3.10) imply that the logarithm of the preimage suffix after $p_i$ is at most
  $ h exp \( 0.62 b_i \) + exp \( 2 tilde(b)_L \) . $
  To see the first term, use $1.1 tilde(b)_(i + 1) < 0.62 b_i$ for large $x$, and bound the number of displayed factors by $h$. The bound for $a$ gives the second term. These quantities are negligible compared with $log p_i gt.eq exp \( 0.88 b_i \)$. Consequently, writing $B_y = log_2 y$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ p_i \, q_i gt.eq y^0.9 \, #h(2em) 0.88 b_i lt.eq B_y lt.eq 1.12 b_i \, #h(2em) u_i lt.eq B_y + O \( 1 \) . $ <eq:suffix-sizes>]
  For $i = 0$ the first inequality is part of the basic witness conditions, and $B_y = b_0 = u_0 = B$ by convention.
  Our target is a bound of the form
  $ frac(y, log y) exp \( - kappa B_y \/ h^4 \) $
  for the suffix pairs, with an absolute $kappa > 0$. The strict simplex slack will supply the exponential saving. Since $B_y asymp b_i$, this saving can absorb the $exp \( O \( b_i log h \/ h^8 \) \)$ cost of recovering tuple coordinates inside $D_i$ and $D'_i$.
  Let
  $ delta = sqrt(log_2 S \/ B_y) asymp b_i^(- 1 \/ 3) . $
  It follows from (5.2) that $S < z$ and $J delta = o \( h^(- 20) \)$. Normality gives $Omega \( p_(i + j) - 1 \) \, Omega \( q_(i + j) - 1 \) lt.eq 4 B_y$ for $0 lt.eq j lt.eq J$. For example, split the prime factors at $S$, apply the two normality conditions, and use $p_(i + j) - 1 lt.eq v^(\( i \)) lt.eq y$. If
  $ A_j = P^(+) \( p_(i + j) - 1 \) \, #h(2em) A'_j = P^(+) \( q_(i + j) - 1 \) \, $
  then
  #[#set math.equation(numbering: n => "(5.4)")
   $ log_2 A_j = u_(i + j) + O \( log b_i \) \, #h(2em) log_2 A'_j = log_2 q_(i + j) + O \( log b_i \) . $ <eq:largest-factor-band>]
  This follows from $\( p_(i + j) - 1 \) lt.eq A_j^(Omega \( p_(i + j) - 1 \))$ and the reverse bound $A_j lt.eq p_(i + j) - 1$. When $i = j = 0$, the convention $u_0 = B$ causes only an $O \( 1 \)$ difference from $log_2 p_0$, since $x^0.9 lt.eq p_0 lt.eq x + 1$.
  The bands in (5.4) are disjoint and decrease with $j$. Their smallest separation is a constant multiple of $b_i h^(- 20)$, which dominates the error $O \( log b_i \)$. All the $A_j \, A'_j$ exceed $z$, whereas
  $ P^(+) \( D_i \) \, P^(+) \( D'_i \) < z . $
  For the latter assertion, every prime in the residual preimage is at most $p_(i + J + 1)$ or $q_(i + J + 1)$, and $1.1 tilde(b)_(i + J + 1) < 0.7 b_(i + J)$; taking a totient cannot increase the largest prime factor. Repetitions of the last prime in $a$ or $a'$ do not affect this conclusion.
  ===== 5.1.2 Aligning the largest factors on the two sides. <aligning-the-largest-factors-on-the-two-sides.>
  We claim that
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| log_2 A_j - log_2 A'_j \| lt.eq \( 2 j + 1 \) delta B_y #h(2em) \( 0 lt.eq j lt.eq J \) . $ <eq:factor-alignment>]
  Suppose, for example, that $A_j > A'_j$, and put $e = \( log_2 A_j - log_2 A'_j \) \/ B_y$. On the first side of (5.1), each of its first $j + 1$ shifts contributes at least $\( e - delta \) B_y$ prime factors, with multiplicity, to $\( A'_j \, A_j \]$. On the other side only its first $j$ shifts can contribute, each at most $\( e + delta \) B_y$. The later shifts have smaller largest factors, and both residual integers are $z$-smooth. The lower endpoint exceeds $S$, so normality applies. Equality of the two sides therefore gives
  $ \( j + 1 \) \( e - delta \) lt.eq j \( e + delta \) \, $
  which proves (5.5). Interchanging the sides handles the other order.
  Cancel any equal primes among the two lists in (5.1), and let $r$ be the product of their shifts. The disjoint prime bands show that equality is possible only at the same original index. The index $i$ survives, since $p_i eq.not q_i$. Let $b lt.eq J + 1 lt.eq B_y$ be the length of the remaining lists. Their corresponding primes are unequal, as required by Proposition 12.
  Set $Y_b = z$, $Y_0 = y$ and $log_2 U_0 = 0.8 B_y$. At each remaining positive index, choose an interval on a $delta$-grid in normalized double logarithms which contains the corresponding pair from (5.5). Its width is $O \( J delta \)$. The intervals remain strictly separated, because $J delta = o \( h^(- 20) \)$. Each lies below height $0.8$, by (5.3) and the upper bound $u_(i + 1) lt.eq 0.62 b_i$. At index zero, (5.3) and (5.4) give largest factors above height $0.9$. Thus all the ordered-cutoff hypotheses of Proposition 12 hold. If $b = 1$, there are no positive indices to grid and $Y_1 = z$.
  The part of $p_i - 1$ supported on primes at most $Y_1$ has logarithm at most $4 B_y log Y_1 lt.eq 4 B_y exp \( 0.8 B_y \)$. Since $p_i gt.eq y^0.9$, the complementary part exceeds $sqrt(y)$ for large $H$. The whole common product is squarefree above $Y_b$, by the good conditions; canceling the equal shifts preserves this property. This verifies the last two hypotheses of Proposition 12.
  Apply that proposition to the remaining lists with $D = D_i$, $D' = D'_i$ and the factor $r$ just canceled; their common product is at most $y \/ r$. Write $nu_k = log_2 Y_k \/ B_y$ and $mu_k = log_2 U_k \/ B_y$ for the normalized interval endpoints.
  Write $j_1 < dots.h.c < j_(b - 1)$ for the surviving positive original indices. Since $j_k gt.eq k$ and $a_k lt.eq a_(j_k)$, the grid intervals and the strict slack condition in (3.18) give
  #[#set math.equation(numbering: n => "(5.6)")
   $ sum_(k = 1)^(b - 1) a_k nu_k & lt.eq 1 / B_y sum_(j = 1)^J a_j u_(i + j) + O \( J^2 log \( 2 J \) delta \)\
 & lt.eq 1 - h^(- 4) + O \( B_y^(- 1) + J^2 log \( 2 J \) delta \) . $ <eq:collision-slack>]
  Here $a_j$ is increasing and $sum_(j lt.eq J) a_j = O \( J log \( 2 J \) \)$. The grid widths and the explicit $delta$ term in (4.4) contribute another $O \( J^2 log \( 2 J \) delta \) = o \( h^(- 4) \)$ to its exponent of $log y$. Thus, for some absolute $kappa > 0$, its logarithmic factor is at most
  $ \( log y \)^(- 1 - kappa h^(- 4)) = frac(1, log y) exp \( - kappa B_y \/ h^4 \) . $
  It remains to show that the other factors and the recovery of tuple coordinates use only a smaller part of this saving.
  ===== 5.1.3 Recovering tuples and summing the remaining choices. <recovering-tuples-and-summing-the-remaining-choices.>
  The comparison estimate counts its displayed primes and its residual integer $D'_i$. We must also account for the tuple data forgotten inside $D_i \, D'_i$. If $R lt.eq i + J$, all displayed tuple primes are already determined. Their tail totient is
  $ d = D_i product_(j = R + 1)^(i + J) \( p_j - 1 \) \, $
  and similarly on the other side, with an empty product when $R = i + J$. If $R > i + J$, the missing tuple data give an ordered factorization
  #[#set math.equation(numbering: n => "(5.7)")
   $ D_i = d product_(j = i + J + 1)^R \( p_j - 1 \) . $ <eq:residual-factorization>]
  There are at most $\( h + 1 \)^(Omega \( D_i \))$ such factorizations. Indeed, for any integer $n$, assigning its $Omega \( n \)$ prime occurrences to $k$ labeled slots bounds the number of ordered multiplicative factorizations into $k$ factors by $k^(Omega \( n \))$. Once a factor $p_j - 1$ is fixed, $p_j$ is fixed as well. This argument also covers repeated prime factors. Consequently the two missing tails cost at most
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( h + 1 \)^(Omega \( D_i \) + Omega \( D'_i \)) lt.eq exp { 2 b_i log \( h + 1 \) \/ h^8 } . $ <eq:tuple-recovery-cost>]
  The factorizations in (5.7) are exact: the primes up to $R$ are distinct and the remaining preimage tail is smaller than $p_R$, by (3.11). All repetitions inside that tail are kept in its totient $d$.
  We now sum the comparison bound over the canceled primes, the grids, and $D_i$. The canceled index sets contribute at most $2^(J + 1)$. Each canceled prime has reciprocal shift sum $O \( b_i \)$ by Mertens’ theorem. The number of grid choices is at most $\( C \/ delta \)^(2 \( J + 1 \))$. Thus their total cost, including the factors $\( C B_y^6 \)^b$ in (4.4), is $exp \( O \( h^2 \) \)$. For the residual integer, the finite Euler product gives
  $ sum_(P^(+) \( D \) lt.eq z) 1 / D lt.double log z . $
  Before enlarging this sum we use the good-condition bounds $Omega \( D_i \) \, Omega \( D'_i \) lt.eq b_i \/ h^8$ in both (5.8) and the factor $\( b + 1 \)^(Omega \( D_i \))$ of the comparison estimate.
  The logarithm of all the remaining costs, apart from the factor $y \/ \( log y \)$ and the saving from (5.6), is at most
  #[#set math.equation(numbering: n => "(5.9)")
   $ O \( h^2 \) + O (frac(b_i log h, h^8)) + O (frac(b_i log h log log \( 3 h \), h^18)) = o (b_i / h^4) . $ <eq:collision-costs>]
  The last term uses $log_2 z lt.double b_i h^(- 18)$ to bound the factor $\( log Y_b \)^(1 + 3 b log \( b \( b + 1 \) \))$ in (4.4), as well as the sum over $D_i$. All little-oh estimates here are uniform for $h gt.eq H$ as $H arrow.r oo$, because $b_i asymp h rho^(- h)$. We have therefore obtained, for some absolute $c_2 > 0$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ \# { upright("ordered suffix tuple pairs with ") y \/ 2 < v^(\( i \)) lt.eq y } lt.double frac(y, log y) exp { - c_2 B_y \/ h^4 } . $ <eq:suffix-pair-count>]
  For $i = 0$ the same expression bounds all the pairs with first unequal index zero, using $y = x$. Choosing one witness for each tuple has not introduced multiplicity into the desired count: comparison data and the factorizations just counted determine each ordered pair of tuples.
  ===== 5.1.4 Summing suffixes and restoring the common prefix. <summing-suffixes-and-restoring-the-common-prefix.>
  For $i gt.eq 1$ the required sum over suffix pairs is weighted by $1 \/ v^(\( i \))$. A dyadic interval in (5.10) contributes at most
  $ frac(C, log y) exp { - c_2 log_2 y \/ h^4 } . $
  Writing the dyadic endpoints as $y = 2^n$, and comparing the sum with an integral, gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(upright("suffix pairs")) 1 / v^(\( i \)) & lt.double sum_(log \( n log 2 \) gt.eq 0.88 b_i - O \( 1 \)) frac(exp { - c_2 log \( n log 2 \) \/ h^4 }, n log 2)\
 & lt.double integral_(0.88 b_i - O \( 1 \))^oo exp \( - c_2 u \/ h^4 \) thin thin upright(d) u lt.double h^4 exp \( - c_3 b_i \/ h^4 \) . $ <eq:dyadic-suffix-mass>]
  In this change of variable, $u = log \( n log 2 \)$, the factor $1 \/ log y$ exactly compensates for the density of dyadic endpoints. In particular, no factor of order $exp \( b_i \)$ is lost.
  For fixed suffix data and common primes $p_1 \, dots.h \, p_(i - 1)$, the number of possible $p_0$ is at most
  $ frac(C x, log x) thin frac(1, v^(\( i \)) product_(j = 1)^(i - 1) \( p_j - 1 \)) . $
  Indeed the upper endpoint for $p_0$ is $1 + x \/ \( v^(\( i \)) product_(j = 1)^(i - 1) \( p_j - 1 \) \)$; if the range is nonempty, its restriction $p_0 gt.eq x^0.9$ makes its logarithm comparable to $log x$, so the prime number theorem gives this upper bound. The projected-prefix estimate (3.13) and (5.11) now show that the contribution for this $i$ is at most
  $ frac(C x G_m, log x) thin h^4 exp \( - c_3 b_i \/ h^4 \) . $
  This also applies to the empty projected prefix when $i = 1$. Summing over $h gt.eq H$ yields the convergent tail
  $ C sum_(h gt.eq H) h^4 exp { - c_4 rho^(- h) \/ h^3 } arrow.r 0 . $
  For $i = 0$, (5.10) gives $O \( \( x \/ log x \) exp { - c_2 B \/ m^4 } \)$, which is $o \( x G_m \/ log x \)$. This proves the proposition, uniformly for both endpoints $t$. ◻
]

=== 5.2 From tuples to values and least preimages <from-tuples-to-values-and-least-preimages>

The following elementary lemma keeps track of exceptional tuples as well as exceptional values. This is needed because a small set of values could otherwise carry many representations.

#thm([Lemma 5.2.])[
  (Finite-map counting).  #emph[Let $T$ and $W$ be finite sets, let $F : T arrow.r W$, and write $T = G union.sq D$. Suppose that every element of $W \\ E$ is in $F \( T \)$, where $E subset W$. For $w in W$ put $r_w = \| G ∩ F^(- 1) \( w \) \|$, and let 
$ K = sum_(w in W) r_w \( r_w - 1 \) . $

 Then 
$ - \| E \| lt.eq \| T \| - \| W \| lt.eq \| D \| + K \/ 2 . $

 Moreover, with $E^(*) = E union F \( D \) union { w : r_w gt.eq 2 }$, one has 
$ \| E^(*) \| lt.eq \| E \| + \| D \| + K \/ 2 \, #h(2em) \| F^(- 1) \( E^(*) \) \| lt.eq \| E \| + 2 \| D \| + K . $

 The restriction of $F$ to $T \\ F^(- 1) \( E^(*) \)$ is a bijection onto $W \\ E^(*)$.]
] <lem:finite-map>

#proof[
  Coverage gives the lower bound. For every positive integer $r$, $r - 1 lt.eq r \( r - 1 \) \/ 2$, and hence
  $ \| G \| - \| F \( G \) \| lt.eq K \/ 2 . $
  Adding the at most $\| D \|$ remaining elements proves the upper bound. There are at most $K \/ 2$ fibers with $r_w gt.eq 2$, which proves the bound for $\| E^(*) \|$. Also
  $ sum_(w in E^(*)) r_w lt.eq \| E^(*) \| + K \/ 2 \, $
  by $r lt.eq 1 + r \( r - 1 \) \/ 2$ for integers $r gt.eq 0$. Adding the elements of $D$ proves the second bound. Outside $E^(*)$ coverage, absence of discarded elements, and $r_w lt.eq 1$ give exactly one preimage under $F$. ◻
]

#thm([Proposition 5.3.])[
  (A common prefix for all preimages).  #emph[For $t = x$ or $t = x \/ c$, with the same parameters formed from $x$, 
#[#set math.equation(numbering: n => "(5.12)")
 $ \| thin \| cal(T) \( t \) \| - V \( t \) thin #scale(x: 120%, y: 120%)[\|] lt.eq #scale(x: 120%, y: 120%)[\(] epsilon.alt_H + o_(x \; H) \( 1 \) #scale(x: 120%, y: 120%)[\)] frac(x G_m, log x) \, #h(2em) epsilon.alt_H arrow.r 0 . $ <eq:tuple-cardinality>]

 There is a set $E^(*) \( t \) subset cal(V) ∩ \[ 1 \, t \]$ for which both $\| E^(*) \( t \) \|$ and the number of tuples in $cal(T) \( t \)$ with values in $E^(*) \( t \)$ are at most $\( epsilon.alt_H + o_(x \; H) \( 1 \) \) x G_m \/ log x$, after enlarging $epsilon.alt_H$. For every $v in \( cal(V) ∩ \[ 1 \, t \] \) \\ E^(*) \( t \)$ there is a unique tuple $\( p_0 \, dots.h \, p_R \, d \) in cal(T) \( t \)$ of value $v$, and every preimage of $v$ has this prefix and a remaining factor of totient $d$. In particular, 
#[#set math.equation(numbering: n => "(5.13)")
 $ ell \( v \) = p_0 dots.h.c p_R ell \( d \) . $ <eq:least-factorization>]

]
] <prop:unique-prefix>

#proof[
  Apply Lemma 15 with $T = cal(T) \( t \)$, $G = cal(G) \( t \)$, $D = cal(D) \( t \)$ and $W = cal(V) ∩ \[ 1 \, t \]$. Let $E$ be the exceptional values in Proposition 5, restricted to $\[ 1 \, t \]$. Every preimage of each $v in.not E$ is basic, so it induces an element of $T$. The size of $E$ is negligible on the scale $x G_m \/ log x$, by (3.4); Proposition 10 gives the same bound for $\| D \|$, and Proposition 14 gives it for $K$. The counting conclusions therefore follow from the lemma.
  Fix $v in.not E^(*) \( t \)$. Every preimage is basic and so induces a tuple in $T$. It cannot induce a tuple in $D$, since $v in.not F \( D \)$. The remaining tuple is unique. Thus, writing $Q = p_0 dots.h.c p_R$, every preimage of $v$ has the form $Q z$, where $phi \( z \) = d$. It follows that every such preimage is at least $Q ell \( d \)$.
  For the reverse inequality choose one basic witness with tail $w$. The deterministic size bound (3.11) gives $ell \( d \) lt.eq w < p_R$. The prefix primes are distinct, so $gcd \( Q \, ell \( d \) \) = 1$ and
  $ phi \( Q ell \( d \) \) = phi \( Q \) phi \( ell \( d \) \) = d product_(j = 0)^R \( p_j - 1 \) = v . $
  Hence $ell \( v \) lt.eq Q ell \( d \)$, proving (5.13). ◻
]

The universal quantifier on preimages in Proposition 5 is used only after the counting argument, to obtain the common-prefix statement and (5.13). A single basic preimage would give the upper bound for $ell \( v \)$ but would not give the reverse inequality.

== 6 The arithmetic coefficient and the limiting formula <sec:limits>

The preceding sections reduce the count of values to distinct tuples with a common long prime prefix. We now sum over the largest prime and replace the remaining prefix by a volume. The shorter tail stays discrete: its different witnesses are combined by a union before taking that volume. Throughout this section, $H$ is fixed first, $x$ tends to infinity next, and $H$ tends to infinity last. In particular, $P = floor.l log log H floor.r$, $R = m - H$, and $L = m - P$ always refer to the two cuts in (3.1).

=== 6.1 Summing over the largest prime <summing-over-the-largest-prime>

Let $cal(D)_H \( x \)$ be the set of distinct data $\( d \, p_1 \, dots.h \, p_R \)$ for which there are primes $p_(R + 1) \, dots.h \, p_L$ and a positive integer $a$ satisfying the basic conditions (3.10) with $p_0$ omitted, and

$ d = phi \( w \) \, #h(2em) w = p_(R + 1) dots.h.c p_L a . $

The convention $u_0 = B$ is retained in these conditions. Thus the inequality with index zero is a condition on the displayed data and their witness, independent of the eventual choice of $p_0$. For any function $f : \[ 1 \, oo \) arrow.r \[ 0 \, 1 \]$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ M_f \( x \; H \) = sum_(\( d \, p_1 \, dots.h \, p_R \) in cal(D)_H \( x \)) frac(f \( ell \( d \) \/ d \), d product_(i = 1)^R \( p_i - 1 \)) . $ <eq:mass>]

Each datum is included once, regardless of its number of witnesses. The function $f = 1$ makes the least-preimage ratio irrelevant to this definition.

We use $K_H = exp \( C P rho^(- P) \) = H^(o \( 1 \))$, allowing the absolute constant $C$ to increase in upper bounds. Summing over witnesses, the totient inequality

#[#set math.equation(numbering: n => "(6.2)")
 $ frac(1, phi \( p_(R + 1) dots.h.c p_L a \)) lt.eq frac(1, phi \( a \)) product_(i = R + 1)^L frac(1, p_i - 1) $ <eq:tail-reciprocal-majorant>]

and Lemma 8 give

#[#set math.equation(numbering: n => "(6.3)")
 $ 0 lt.eq M_f \( x \; H \) lt.eq M_1 \( x \; H \) lt.double K_H G_m . $ <eq:mass-upper>]

Indeed, the reciprocal sum for the full $L$ prime coordinates is $O \( G_m \)$ by (3.13), while the unrestricted reciprocal sum for the allowed smooth cofactor is $O \( K_H \)$ by (3.16). The inequality in (6.2), rather than an equality, also covers the possibility that $p_L$ divides $a$.

#thm([Proposition 6.1.])[
  (The unweighted prime sum).  #emph[For each fixed $c > 1$, both $t = x$ and $t = x \/ c$ satisfy 
#[#set math.equation(numbering: n => "(6.4)")
 $ V \( t \) = frac(t, log x) #scale(x: 120%, y: 120%)[\(] M_1 \( x \; H \) + E_H \( t \; x \) G_m #scale(x: 120%, y: 120%)[\)] \, #h(2em) lim_(H arrow.r oo) limsup_(x arrow.r oo) max_(t in { x \, x \/ c }) \| E_H \( t \; x \) \| = 0 . $ <eq:mass-count>]

 All parameters in the two formulas are formed from the same $x$.]
] <prop:mass>

#proof[
  For fixed data in $cal(D)_H \( x \)$ put
  $ D = d product_(i = 1)^R \( p_i - 1 \) . $
  Since $d lt.eq w$, the deterministic bound (3.11) implies
  $ 1 lt.eq D lt.eq p_1 dots.h.c p_L a lt.eq exp \( \( log x \)^0.8 \) . $
  The possible largest primes are precisely $x^0.9 lt.eq p_0 lt.eq 1 + t \/ D$. The remaining prime factors are smaller than $x^0.9$ for large $x$, so this choice introduces neither a repeated prefix prime nor another ordering condition. The endpoints $t \/ D$ lie uniformly in $\[ x^(1 - o \( 1 \)) \/ c \, x \]$. The prime number theorem, with $log \( t \/ D \) = log x + o \( log x \)$ uniformly, therefore gives
  $ \# { p_0 : x^0.9 lt.eq p_0 lt.eq 1 + t \/ D } = frac(t, D log x) #scale(x: 120%, y: 120%)[\(] 1 + o_(x arrow.r oo \; H \, c) \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The lower cutoff costs a relative $O \( x^(- 0.1 + o \( 1 \)) \)$, uniformly in the data. Summing this formula and using (6.3) counts $cal(T) \( t \)$ with main term $t M_1 \/ log x$ and error $o_(x arrow.r oo \; H \, c) \( x G_m \/ log x \)$. Proposition 16 replaces $\# cal(T) \( t \)$ by $V \( t \)$ with an error whose normalized iterated limit is zero. Since $t$ is either $x$ or $x \/ c$, this proves (6.4). ◻
]

The common mass in Proposition 17 already gives the fixed-scaling conclusion. Its proof does not require identifying that mass with the arithmetic coefficient.

#thm([Corollary 6.2.])[
  (Fixed scaling).  #emph[For every fixed real $c > 0$, 
$ frac(V \( c x \), V \( x \)) arrow.r c . $

]
] <cor:fixed-scaling>

#proof[
  First let $c > 1$. Apply Proposition 17 at $t = x$ and $t = x \/ c$, using the same $M_1 \( x \; H \)$ and $G_m \( x \)$. Subtracting gives
  $ frac(\( V \( x \) - c V \( x \/ c \) \) log x, x G_m) = E_H \( x \; x \) - E_H \( x \/ c \; x \) . $
  Ford’s estimate (3.4) supplies a positive constant $c_(-)$ with $V \( x \) log x \/ \( x G_m \) gt.eq c_(-)$ for large $x$. Consequently
  $ limsup_(x arrow.r oo) lr(|1 - frac(c V \( x \/ c \), V \( x \))|) lt.eq 1 / c_(-) limsup_(x arrow.r oo) #scale(x: 120%, y: 120%)[\(] \| E_H \( x \; x \) \| + \| E_H \( x \/ c \; x \) \| #scale(x: 120%, y: 120%)[\)] . $
  Let $H$ tend to infinity and then replace $x$ by $c x$ to obtain the assertion. This also covers arguments at which $m \( x \)$ and $m \( x \/ c \)$ differ: the latter integer never enters the comparison. Neither continuity of the phase coefficient nor matching values at the ends of the phase interval is required.
  The case $c = 1$ is immediate. If $0 < c < 1$, apply the result just proved to the multiplier $1 \/ c > 1$ and the argument $y = c x$; taking reciprocals gives the stated limit. ◻
]

=== 6.2 A finite tail and a continuous prefix <a-finite-tail-and-a-continuous-prefix>

The phase-dependent witness set in (2.8) changes with the phase, but for fixed $H$ all its members belong to one finite set. This observation will permit uniform limits without any continuity assumption.

#thm([Lemma 6.3.])[
  (Uniformly finite tail data).  #emph[For each sufficiently large fixed $H$, the union of all $cal(W)_(H \, s) \( d \)$, over $0 lt.eq s < 1$ and all $d$, is finite. All its prime and integer coordinates, and all its totient values, have explicit bounds depending only on $H$. Uniformly over these data, 
#[#set math.equation(numbering: n => "(6.5)")
 $ 0 lt.eq D \( h \, eta \) lt.double_H log \( 2 h \) #h(2em) \( h gt.eq H \) . $ <eq:tail-D-bound>]

]
] <lem:finite-tail-data>

#proof[
  Write $a_(*) = lambda \/ rho$, so that $lambda lt.eq alpha_s < a_(*)$. Let
  $ q_H = ⌈exp exp \( 1.1 a_(*) H rho^(- H) \)⌉ \, #h(2em) A_H^(*) = ⌈exp exp \( 2 a_(*) P rho^(- P) \)⌉ . $
  Every witness belongs to the finite set ${ 1 \, dots.h \, q_H }^(H - P) times { 1 \, dots.h \, A_H^(*) }$. Its corresponding integer $w$ and totient $d$ satisfy $d lt.eq w lt.eq A_H^(*) q_H^(H - P)$. These bounds do not involve $x$ or $s$. Finally, $a_j = integral_j^(j + 1) log t thin thin upright(d) t lt.eq log \( j + 1 \)$, so the definition (2.6) and the bounded tail coordinates give (6.5). ◻
]

For $s = theta \( x \)$ and $eta in cal(W)_(H \, s) \( d \)$, define the region $cal(K)_eta subset bb(R)^R$ by $u_0 = B$ and

#[#set math.equation(numbering: n => "(6.6)")
 $ u_i - sum_(r = i + 1)^R a_(r - i) u_r gt.eq D \( m - i \, eta \) #h(2em) \( 0 lt.eq i lt.eq R \) . $ <eq:prefix-region>]

These inequalities imply $u_i gt.eq 0$. The coordinates $u_i$ here are real; the coarse prime bands have been removed. We write $"Vol"_R$ for $R$-dimensional Lebesgue measure.

#thm([Lemma 6.4.])[
  (The volume of the witness union).  #emph[There are numbers $delta_H arrow.r 0$ such that, uniformly for $f : \[ 1 \, oo \) arrow.r \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(6.7)")
 $ limsup_(x arrow.r oo) lr(|frac(M_f \( x \; H \), G_m) - 1 / G_m sum_(d : cal(W)_(H \, theta) \( d \) eq.not diameter) frac(f \( ell \( d \) \/ d \), d) "Vol"_R union.big_(eta in cal(W)_(H \, theta) \( d \)) cal(K)_eta|) lt.eq delta_H . $ <eq:mass-volume>]

 Moreover, for every nonempty finite $T subset.eq cal(W)_(H \, theta) \( d \)$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ "Vol"_R ⋂_(eta in T) cal(K)_eta = G_R (1 - 1 / B sum_(h = H)^m g_(m - h) max_(eta in T) D \( h \, eta \))_(+)^R . $ <eq:intersection-volume>]

 Here $z_(+) = max \( z \, 0 \)$.]
] <lem:tail-volume>

#proof[
  An intersection imposes the largest of the witness thresholds at each slack coordinate.
  ===== 6.2.1 Intersection volumes. <intersection-volumes.>
  Set $C_i = max_(eta in T) D \( m - i \, eta \)$ and introduce the prefix slacks
  $ t_i = u_i - sum_(r = i + 1)^R a_(r - i) u_r #h(2em) \( 0 lt.eq i lt.eq R \) . $
  Lemma 6 gives $sum_(i = 0)^R g_i t_i = B$, and the substitution from $\( u_1 \, dots.h \, u_R \)$ to $\( t_1 \, dots.h \, t_R \)$ has determinant one. The intersection is $t_i gt.eq C_i$ for every $i$, including $i = 0$. Translation by $C_i$ leaves a simplex of available size $B - sum_i g_i C_i$. Its volume is
  $ frac(\( B - sum_(i = 0)^R g_i C_i \)_(+)^R, R ! product_(i = 1)^R g_i) \, $
  which proves (6.8) after putting $h = m - i$. It remains to compare the volume of the union with the prime mass.
  ===== 6.2.2 From primes to volume. <from-primes-to-volume.>
  Identify $Q_h = p_(m - h)$ for $P lt.eq h < H$. These are exactly the primes with indices $R + 1 \, dots.h \, L$. For fixed tail witness $eta$, the original prefix conditions are its coarse bands together with
  #[#set math.equation(numbering: n => "(6.9)")
   $ xi_i u_i - sum_(r = i + 1)^R a_(r - i) u_r gt.eq D \( m - i \, eta \) #h(2em) \( 0 lt.eq i lt.eq R \) . $ <eq:perturbed-prefix-region>]
  Taking the union over $eta in cal(W)_(H \, theta) \( d \)$ is essential: a prime prefix with several witnesses contributes just once to (6.1).
  First replace the reciprocal prime sum by the volume of this union with its bands and its $xi_i$. In a unit box wholly contained in the union, the product of the prime reciprocal sums differs from its volume by a relative $O \( sum_(i = 1)^R e^(- c b_i) \) = O \( e^(- c' b_R) \)$, by Lemma 8. The geometric growth of $b_i$ as $i$ decreases makes this estimate independent of $R$. Both the total mass and the total volume before this replacement are $O \( K_H G_m \)$, by summing over witnesses as in (6.2).
  If a unit box meets the union without being contained in it, choose a witness whose region meets the box. That witness’s region does not contain the box. Consequently the box lies in a shell at a prefix band endpoint, or within $O \( h_i^2 \)$ of equality in one of (6.9). For an upper bound, sum these shells over witnesses using (6.2). Thicken the discrete tail coordinates into unit boxes as well and sum $1 \/ phi \( a \)$ at a cost $O \( K_H \)$. The resulting full $L$-coordinate boxes are covered by the shell bounds of Lemma 8 and Proposition 10. Their contribution is $o_H \( 1 \) G_m$. More explicitly, the slice coefficient for an index with $h = m - i$ is $L g_i \/ B lt.double rho^h$. Summing the shell bounds therefore costs at most
  $ O #h(-0.16667em) (K_H sum_(h gt.eq H) \( h e^(- h \/ 40) + h^3 rho^h \)) G_m . $
  The broader $O \( K_H H^(- 2) \) G_m$ shell estimate in Proposition 10 also suffices.
  ===== 6.2.3 Removing the slack perturbation. <removing-the-slack-perturbation.>
  Replace $xi_i$ by $1$ for $i lt.eq R$, retaining the bands. The removed region lies in a shell of thickness $O \( e^(- h_i \/ 40) b_i \)$, with the same box-thickening errors. Its normalized contribution is at most
  $ O #h(-0.16667em) (K_H sum_(h gt.eq H) \( h e^(- h \/ 40) + h^3 rho^h \)) = o_H \( 1 \) . $
  Both shell estimates are valid for the union because upper bounds may sum over witnesses, while $0 lt.eq f lt.eq 1$.
  ===== 6.2.4 Removing the prefix bands. <removing-the-prefix-bands.>
  For every point satisfying the now unperturbed prefix inequalities, recurrence iteration gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ u_i gt.eq g_(R + 1 - i) v_(H - 1) gt.double H rho^(- h_i) #h(2em) \( 0 lt.eq i lt.eq R \) \, $ <eq:unbanded-prefix-lower>]
  where $v_(H - 1) = log_2 Q_(H - 1)$. To see this, retain the contribution of the first tail coordinate in each prefix inequality, discard the other nonnegative tail contributions, and apply the recurrence for $g$. The tail band for $v_(H - 1)$ and (3.5) give the displayed lower bound. Thickening the $H - P$ tail coordinates changes inequality $i$ by $O \( H log \( h_i + 1 \) \)$. The enlargement term $C h_i^2 rho^(h_i) u_i$ is at least a constant times $C H h_i^2$, so it absorbs this error. Together with the retained tail bands, this places the full region inside the enlarged simplex of Lemma 8.
  To sum these regions without a factor for the number of witnesses, use (6.2) and first fix $a$. Partition the tail coordinates into half-open unit boxes $cal(C) = product_(h = P)^(H - 1) cal(C)_h$. Let $cal(U)_(cal(C))$ be the union of $cal(K)_eta$ over all allowed witnesses $eta = \( \( Q_h \) \, a \)$ with $\( log_2 Q_h \)_h in cal(C)$. Let $E$ be the set of prefix points violating at least one removed band. Aggregating the reciprocal weights within a box gives
  $ & sum_(eta = \( \( Q_h \) \, a \) upright(" allowed")\
\( log_2 Q_h \)_h in cal(C)) frac("Vol"_R \( cal(K)_eta ∩ E \), product_h \( Q_h - 1 \))\
 & quad lt.eq (product_(h = P)^(H - 1) sum_(log_2 q in cal(C)_h) frac(1, q - 1)) "Vol"_R \( cal(U)_(cal(C)) ∩ E \)\
 & quad lt.double "Vol"_L #scale(x: 120%, y: 120%)[\(] \( cal(U)_(cal(C)) ∩ E \) times cal(C) #scale(x: 120%, y: 120%)[\)] . $
  The sums over $q$ are over primes. The product is $O \( 1 \)$ uniformly in the number of tail coordinates, by (3.12) and their geometrically growing lower endpoints. Here $R + \( H - P \) = L$ and $cal(C)$ has unit volume. By the preceding enlargement argument, every set on the right lies in the same enlarged $L$-simplex. Since the tail boxes are disjoint, summing their volumes counts a subset of that simplex once. Finally, summing $1 \/ phi \( a \)$ over the common smooth envelope costs $O \( K_H \)$. All these bounds hold at each phase; they do not compare witness sets at nearby phases.
  Scale that enlarged simplex into the true $L$-coordinate simplex. Its Jacobian cost is bounded, and its coordinate scaling factors through index $R$ are
  $ 1 + O #h(-0.16667em) (sum_(h gt.eq H) \( e^(- h \/ 40) + h^2 rho^h \)) = 1 + o_H \( 1 \) . $
  For large $H$, and then large $x$, a violation of a removed $\[ 0.9 tilde(b)_i \, 1.1 tilde(b)_i \]$ band therefore becomes a violation of the $\[ 0.95 b_i \, 1.05 b_i \]$ band in the true simplex. Lemma 7 applies with dimension $L = m - P$, since $h_i gt.eq H$ and $P \/ H arrow.r 0$. Summing its bounds gives $O \( e^(- c H) \)$ of the simplex volume. After the smooth-cofactor factor, the additional volume is at most $O \( K_H e^(- c H) \) G_m = o_H \( 1 \) G_m$. This proves (6.7). All constants used in these estimates are uniform in $theta$, since $lambda lt.eq alpha_theta < lambda \/ rho$ and $alpha \/ alpha_theta = 1 + o_(x arrow.r oo \; H) \( 1 \)$. ◻
]

=== 6.3 The arithmetic approximation <the-arithmetic-approximation>

#thm([Proposition 6.5.])[
  (Approximation by the finite coefficient).  #emph[There are numbers $epsilon_H arrow.r 0$ such that, for every $f : \[ 1 \, oo \) arrow.r \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(6.11)")
 $ limsup_(x arrow.r oo) lr(|frac(M_f \( x \; H \), G_m) - A_H \( f \; theta \( x \) \)|) lt.eq epsilon_H . $ <eq:uniform-approximation>]

 The bound is independent of $f$ and of phase. Each $A_H \( f \; s \)$ is a finite sum involving values of $f$ at explicitly bounded rational arguments and absolutely convergent series in its exponential weights, and $A_H \( f \; s \) gt.eq 0$.]
] <prop:tail-limit>

#proof[
  Apply finite inclusion–exclusion to the union in (6.7), and then use (6.8). For a nonempty subset $T$ of witnesses, write
  $ C_T \( h \) = max_(eta in T) D \( h \, eta \) \, #h(2em) S_T = sum_(h = H)^oo rho^h C_T \( h \) \, #h(2em) q_(m \, T) = 1 / B sum_(h = H)^m g_(m - h) C_T \( h \) . $
  The series for $S_T$ converges absolutely by (6.5). The finite universe in Lemma 19 gives a uniform bound on the number of possible witnesses and their subsets for fixed $H$; it also makes all the following estimates uniform in phase, even when membership in a witness set changes.
  Using $B = alpha m rho^(- m)$ and (3.5), we obtain
  $ q_(m \, T) & = frac(gamma, alpha m) sum_(h = H)^m rho^h C_T \( h \) + O_H #h(-0.16667em) (frac(m log \( 2 m \), B))\
 & = frac(gamma, alpha m) S_T + o_(x arrow.r oo \; H) \( m^(- 1) \) . $
  The omitted geometric tail is $O_H \( rho^m log \( 2 m \) \)$. In particular, $q_(m \, T) = O_H \( 1 \/ m \)$, and hence
  $ \( 1 - q_(m \, T) \)_(+)^(m - H) = exp #h(-0.16667em) (- gamma / alpha_theta S_T) + o_(x arrow.r oo \; H) \( 1 \) . $
  Here we used the uniform scale relation $alpha \/ alpha_theta = 1 + O \( log m \/ m \)$ and $\( m - H \) q_(m \, T)^2 = O_H \( 1 \/ m \)$. The prefactor satisfies
  #[#set math.equation(numbering: n => "(6.12)")
   $ G_(m - H) / G_m = product_(l = 0)^(H - 1) frac(\( m - l \) g_(m - l), B) = (gamma / alpha_theta)^H rho^(H \( H - 1 \) \/ 2) + o_(x arrow.r oo \; H) \( 1 \) . $ <eq:volume-prefactor-limit>]
  There are only boundedly many terms for fixed $H$. Thus the inclusion–exclusion expression differs from $A_H \( f \; theta \( x \) \)$ in (2.8) by $o_(x arrow.r oo \; H) \( 1 \)$, uniformly in phase; no witness multiplicity has been introduced. Together with Lemma 20, this proves (6.11).
  Nonnegativity follows from the finite-union probability interpretation in (2.7): both the union probabilities and the outer weights are nonnegative. ◻
]

=== 6.4 Uniform convergence and the asymptotic equivalent <uniform-convergence-and-the-asymptotic-equivalent>

The preceding approximation holds for every bounded nonnegative weight. Convergence as $H$ grows requires a comparison quantity that does not depend on $H$. For $f = 1$ this quantity is the normalized count of totients. Section 7 will supply a different comparison quantity for each $f_k$.

#thm([Lemma 6.6.])[
  (Convergence from a common comparison).  #emph[Fix $f : \[ 1 \, oo \) arrow.r \[ 0 \, 1 \]$. Suppose a real function $C_f \( x \)$, independent of $H$, and numbers $eta_H arrow.r 0$ satisfy 
#[#set math.equation(numbering: n => "(6.13)")
 $ limsup_(x arrow.r oo) lr(|C_f \( x \) - frac(M_f \( x \; H \), G_m)|) lt.eq eta_H . $ <eq:common-comparison>]

 Then $A_H \( f \; s \)$ converges uniformly for $0 lt.eq s < 1$ to the limit $A \( f \; s \)$ defined in Section 2, and 
#[#set math.equation(numbering: n => "(6.14)")
 $ C_f \( x \) = A \( f \; theta \( x \) \) + o \( 1 \) . $ <eq:comparison-limit>]

 If additionally $c_(-) lt.eq C_f \( x \) lt.eq c_(+)$ for all sufficiently large $x$, then $c_(-) lt.eq A \( f \; s \) lt.eq c_(+)$ for every $s in \[ 0 \, 1 \)$.]
] <lem:coefficient-convergence>

#proof[
  By Proposition 21,
  $ limsup_(x arrow.r oo) \| C_f \( x \) - A_H \( f \; theta \( x \) \) \| lt.eq zeta_H \, #h(2em) zeta_H = eta_H + epsilon_H arrow.r 0 . $
  Every phase occurs at arbitrarily large real arguments. Indeed,
  $ psi \( B \) = frac(log B - log log B, lambda) $
  is continuous and strictly increasing for $B > e$, and tends to infinity. For any $s in \[ 0 \, 1 \)$ solve $psi \( B_n \) = n + s$ and put $x_n = exp \( exp B_n \)$. Then $m \( x_n \) = n$ and $theta \( x_n \) = s$ exactly. Comparing indices $H$ and $K$ along this same sequence gives
  $ \| A_H \( f \; s \) - A_K \( f \; s \) \| lt.eq zeta_H + zeta_K . $
  This bound is independent of $s$, so the functions form a uniformly Cauchy sequence. In particular, $sup_s \| A_H \( f \; s \) - A \( f \; s \) \| lt.eq zeta_H$. Combining this inequality with the preceding limsup bound and then sending $H$ to infinity proves (6.14). If $C_f$ lies between $c_(-)$ and $c_(+)$, apply those bounds on each exact-phase sequence and let $H$ grow to obtain the asserted bounds for $A$. No continuity in the phase was used. ◻
]

#proof[
  Set
  $ C_1 \( x \) = frac(V \( x \) log x, x G_m) . $
  Proposition 17 with $t = x$ supplies (6.13). Lemma 22 therefore proves uniform existence of $A \( 1 \; s \)$ and $C_1 \( x \) = A \( 1 \; theta \( x \) \) + o \( 1 \)$. Ford’s two-sided estimate (3.4) supplies positive absolute constants $c_(-) \, c_(+)$ bounding $C_1$. The same lemma gives
  $ 0 < c_(-) lt.eq A \( 1 \; s \) lt.eq c_(+) < oo #h(2em) \( 0 lt.eq s < 1 \) . $
  The additive approximation is consequently equivalent to
  $ V \( x \) tilde.op frac(x, log x) G_m A \( 1 \; theta \( x \) \) . $
  The coefficient in this formula was defined by the finite arithmetic expressions (2.8); the count $V$ has been used to establish their convergence and bounds, not to define them.
  Corollary 18 supplies the remaining assertion of the theorem for every $c > 0$. ◻
]

== 7 Least preimages <sec:companion>

We now prove Theorem 2. The prime that dominates a basic representation also determines the interval in which its least preimage lies. Counting that prime first gives the weight $f_k$. The resulting approximation is additive; a separate argument will show when its coefficient is bounded away from zero.

Throughout this section, $k gt.eq 1$ is a fixed integer. The mass $M_f \( x \; H \)$ is defined in (6.1); its summands correspond to distinct data $\( d \, p_1 \, dots.h \, p_R \)$, regardless of how many basic witnesses yield the same data. Write

$ f_k \( r \) = cases(delim: "{", 0 \, & 1 lt.eq r lt.eq k \,, 1 - k \/ r \, & k < r < k + 1 \,, 1 \/ r \, & r gt.eq k + 1 .) $

Thus $0 lt.eq f_k lt.eq 1 \/ \( k + 1 \)$, and $f_k \( r \) > 0$ exactly when $r > k$. Equivalently, $f_k \( r \)$ is the length of

$ { t in \[ 0 \, 1 \] : k < r t lt.eq k + 1 } . $

It is therefore the permitted fraction of the normalized value interval when the least-preimage ratio is fixed at $r$.

=== 7.1 Counting the interval for the largest prime <counting-the-interval-for-the-largest-prime>

#thm([Lemma 7.1.])[
  #emph[For each sufficiently large fixed $H$, as $x$ tends to infinity, 
#[#set math.equation(numbering: n => "(7.1)")
 $ lr(|N_k \( x \) - frac(x, log x) M_(f_k) \( x \; H \)|) lt.eq #scale(x: 120%, y: 120%)[\(] epsilon.alt_(H \, k) + o_(x arrow.r oo \; H \, k) \( 1 \) #scale(x: 120%, y: 120%)[\)] frac(x G_m, log x) \, $ <eq:weighted-mass>]

 where $epsilon.alt_(H \, k) gt.eq 0$ tends to zero as $H arrow.r oo$.]
] <lem:weighted-endpoint>

#proof[
  Proposition 16 allows us, with an error of $\( epsilon.alt_H + o_(x arrow.r oo \; H) \( 1 \) \) x G_m \/ log x$, to count tuples $\( p_0 \, dots.h \, p_R \, d \)$ satisfying
  $ \( p_0 - 1 \) dots.h.c \( p_R - 1 \) d lt.eq x \, #h(2em) k x < p_0 dots.h.c p_R ell \( d \) lt.eq \( k + 1 \) x . $
  Both the exceptional values and the tuples above them are controlled there. This use of the least-preimage identity requires that every preimage have the same prefix. The identity would not follow from the existence of a single basic witness.
  Fix the remaining data $\( d \, p_1 \, dots.h \, p_R \)$, and put
  $ D = d product_(i = 1)^R \( p_i - 1 \) \, #h(2em) A = ell \( d \) product_(i = 1)^R p_i \, #h(2em) r = frac(ell \( d \), d) \, #h(2em) q = product_(i = 1)^R (1 - 1 / p_i) . $
  Here $r gt.eq 1$. Set $T = x \/ D$ and $U = x \/ A = T q \/ r$. The admissible largest primes satisfy exactly
  #[#set math.equation(numbering: n => "(7.2)")
   $ p_0 gt.eq x^0.9 \, #h(2em) k U < p_0 lt.eq min { T + 1 \, \( k + 1 \) U } . $ <eq:largest-prime-interval>]
  Once the lower bound for $p_0$ holds, the basic-witness restrictions on the remaining data do not change with $p_0$; recall that their zeroth simplex coordinate is $B$.
  Ignoring the lower cutoff and replacing $T + 1$ by $T$, the interval has length
  $ min { T \, \( k + 1 \) U } - min { T \, k U } = T f_k \( r \/ q \) . $
  The replacement changes its length by at most one. Moreover, $z mapsto f_k \( 1 \/ z \)$ is $\( k + 1 \)$-Lipschitz on $\[ 0 \, 1 \]$, where its value at zero is zero. Consequently
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| f_k \( r \/ q \) - f_k \( r \) \| lt.eq frac(\( k + 1 \) \( 1 - q \), r) lt.eq \( k + 1 \) sum_(i = 1)^R 1 / p_i . $ <eq:weight-perturbation>]
  For fixed $H$, the deterministic size bounds in (3.11) give $T = x^(1 - o \( 1 \))$ uniformly in the remaining data. The tail has a witness $w$ bounded in terms of $H$ only, so $ell \( d \) lt.eq w$ bounds $r$ in terms of $H$. The prime bands bound $q$ away from zero. Hence $U = x^(1 - o \( 1 \))$ uniformly as well, and $k U > x^0.9$ for all sufficiently large $x$. The lower cutoff in (7.2) is then inactive.
  Apply the prime number theorem at its two endpoints, taking the positive part of the difference if the interval is empty. Each nonzero endpoint is $x^(1 - o \( 1 \))$, and each is $O_k \( T \)$. Thus this gives, uniformly in the remaining data,
  $ \# { p_0 upright(" satisfying ") upright("(7.2)") } = frac(T, log x) (f_k \( r \) + O_k (sum_(i = 1)^R 1 / p_i) + o_(x arrow.r oo \; H \, k) \( 1 \)) . $
  The shift by one is included in the last error. This is an additive estimate relative to $T \/ log x$, obtained from the ordinary prime number theorem; no relative estimate on a short prime interval is required.
  The geometric separation of the bands implies
  $ sup sum_(i = 1)^R 1 / p_i lt.double exp \( - c H rho^(- H) \) . $
  Indeed $b_(i - 1) \/ b_i gt.eq rho^(- 1)$, and $p_i gt.eq exp exp \( c b_i \)$; the resulting reciprocal series is bounded by a constant times its smallest-scale bound. In particular, this estimate is uniform in the growing number $R$ of primes. Since $M_1 lt.double K_H G_m$ and $K_H = H^(o \( 1 \))$, summing the displayed prime count gives an error bounded by
  $ (O_k #scale(x: 120%, y: 120%)[\(] K_H exp \( - c H rho^(- H) \) #scale(x: 120%, y: 120%)[\)] + o_(x arrow.r oo \; H \, k) \( 1 \)) frac(x G_m, log x) . $
  Together with the tuple-to-value error this proves (7.1). ◻
]

The additive form is necessary at this stage. For example, when $r = k$ and $q < 1$, one has $f_k \( r \) = 0$ but $f_k \( r \/ q \) > 0$. Inequality (7.3) controls this boundary without asserting a relative approximation to a zero term.

Apply Lemma 22 with the function

$ C_(f_k) \( x \) = frac(N_k \( x \) log x, x G_m) \, $

which is independent of $H$. Lemma 23 provides its required comparison with $M_(f_k) \/ G_m$. We obtain the uniform convergence of $A_H \( f_k \; s \)$ on $0 lt.eq s < 1$ and

#[#set math.equation(numbering: n => "(7.4)")
 $ N_k \( x \) = frac(x G_m, log x) #scale(x: 120%, y: 120%)[\(] A \( f_k \; theta \) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:companion-additive>]

It remains to distinguish a coefficient bounded away from zero from an identically zero count.

=== 7.2 Seed propagation and bounded ratios <seed-propagation-and-bounded-ratios>

The positivity argument needs two distinct facts. A seed with $ell \( d \) \/ d > k$ must produce a positive proportion of values whose ratios stay away from $k$. These ratios must also remain bounded on a positive proportion of values, since $f_k \( r \) arrow.r 0$ as $r arrow.r oo$. The next two lemmas supply these facts.

Preservation of a complete inverse fiber under multiplication by a prime already appears in Erdős’s proof of Theorem 4 #cite(label("Erdos1958")). Ford’s construction gives such preservation on a positive proportion of the distinct-totient scale. A later simultaneous two-seed form appears in Pollack, Pomerance and Treviño #cite(label("PPT2013")) Lemma 4.1, again using Ford’s construction. We use the following single-seed consequence of Ford’s proof.

#thm([Lemma 7.2.])[
  (Ford’s inverse-fiber propagation).  #emph[Fix a totient $d$, and write $phi^(- 1) \( d \) = { d_1 \, dots.h \, d_kappa }$. There are constants $eta_d > 0$ and $x_d$ such that, for every $x gt.eq x_d$, at least $eta_d V \( x \)$ distinct totients $v lt.eq x$ have the form 
$ v = d phi \( b \) \, #h(2em) phi^(- 1) \( v \) = { b d_1 \, dots.h \, b d_kappa } $

 for some positive integer $b$. In particular, these values satisfy $ell \( v \) \/ v gt.eq ell \( d \) \/ d$.]
] <lem:fiber-propagation>

#proof[
  Use the construction in the proof of Theorem 2 of #cite(label("FordTotients2013")) Section 5, pp. 24–26, Equations (5.10)–(5.19). For the fixed seed $d$, Ford constructs a set $cal(B)$ and excludes at most half its members. For each remaining $b$, every preimage of $d phi \( b \)$ is one of the products $b d_i$. The paragraph following Equation (5.18) also proves that these members give distinct totients. The concluding bound on p. 26 is $\| cal(B) \| \/ 2 gt.double_epsilon d^(- 1 - epsilon) V \( x \)$ for sufficiently large $x$. This full-fiber conclusion is recorded explicitly in #cite(label("FordTotients2013")) Section 7.3, p. 39. Finally,
  $ frac(ell \( v \), v) = frac(b, phi \( b \)) frac(ell \( d \), d) gt.eq frac(ell \( d \), d) . $
  ◻
]

We also need to keep these ratios in a bounded interval. This follows from the existence of a bounded arithmetic tail and does not require uniqueness of the prefix.

#thm([Lemma 7.3.])[
  #emph[For every $epsilon > 0$, there are $C < oo$ and $x_0$ such that 
$ \# { v in cal(V) : v lt.eq x \, med ell \( v \) \/ v > C } lt.eq epsilon V \( x \) #h(2em) \( x gt.eq x_0 \) . $

]
] <lem:ratio-tightness>

#proof[
  Choose one sufficiently large fixed cut $H_0$ in Proposition 5, so that its exceptional set has at most $epsilon V \( x \)$ members for all sufficiently large $x$. Every remaining value has a basic witness $n = p_0 dots.h.c p_(R_0) w$, where $R_0 = m - H_0$, $w < p_(R_0)$, and $w$ is bounded in terms of $H_0$ only. The prefix primes are distinct, and their bands give a uniform bound for $product_(i = 0)^(R_0) p_i \/ \( p_i - 1 \)$. Therefore
  $ frac(ell \( v \), v) lt.eq frac(n, phi \( n \)) = frac(w, phi \( w \)) product_(i = 0)^(R_0) frac(p_i, p_i - 1) lt.eq C \( H_0 \) . $
  The last bound is independent of $x$, as required. ◻
]

=== 7.3 The positive and zero alternatives <the-positive-and-zero-alternatives>

Suppose first that there is a totient $d_(*)$ with $ell \( d_(*) \) > k d_(*)$. Choose $delta > 0$ such that $ell \( d_(*) \) \/ d_(*) > k + 2 delta$. Lemma 24 gives a fixed $eta > 0$ such that at least $eta V \( x \)$ values satisfy $ell \( v \) \/ v > k + 2 delta$ for every sufficiently large $x$. Apply Lemma 25 with $epsilon = eta \/ 4$. It supplies a fixed $C$ for which at least $3 eta V \( x \) \/ 4$ values satisfy

#[#set math.equation(numbering: n => "(7.5)")
 $ k + 2 delta < frac(ell \( v \), v) lt.eq C . $ <eq:bounded-positive-ratios>]

The numbers $eta \, delta \, C$ are fixed before the cut $H$ is allowed to grow.

For every sufficiently large $H$, and then sufficiently large $x$, Proposition 16 removes at most $eta V \( x \) \/ 4$ of these values. For each remaining value its unique tuple satisfies

$ frac(ell \( v \), v) = frac(ell \( d \), d) product_(i = 0)^R frac(p_i, p_i - 1) . $

The product is $1 + O \( epsilon.alt_H \) + o_(x arrow.r oo \; H) \( 1 \)$, uniformly in the tuple. Increasing $H$ and then $x$, we may bound it by $\( k + 2 delta \) \/ \( k + delta \)$. Thus at least $eta V \( x \) \/ 2$ distinct tuples have their tail ratio in the fixed interval

$ I = \[ k + delta \, C \] . $

Let $M_(upright(bold(1))_I)$ denote the mass (6.1) with weight $upright(bold(1))_I \( r \)$. The ordinary prime number theorem, counting all admissible largest primes for data whose tail ratio lies in $I$, bounds the number of such tuples above by

$ #scale(x: 120%, y: 120%)[\(] 1 + o_(x arrow.r oo \; H) \( 1 \) #scale(x: 120%, y: 120%)[\)] frac(x, log x) M_(upright(bold(1))_I) \( x \; H \) . $

Comparison with $eta V \( x \) \/ 2$, followed by (3.4), gives

$ M_(upright(bold(1))_I) \( x \; H \) gt.eq c_1 G_m $

for all sufficiently large $H$ and then sufficiently large $x$, where $c_1 > 0$ is independent of $H$. Since

$ inf_(r in I) f_k \( r \) gt.eq min {frac(delta, k + delta) \, 1 / C} > 0 \, $

we conclude that

#[#set math.equation(numbering: n => "(7.6)")
 $ M_(f_k) \( x \; H \) gt.eq c_2 G_m $ <eq:weighted-mass-positive>]

with $c_2 > 0$ independent of sufficiently large $H$.

We transfer this lower bound first to the normalized count $C_(f_k) \( x \) = N_k \( x \) log x \/ \( x G_m \)$, which does not depend on $H$. Fix a sufficiently large $H$ such that the error $epsilon.alt_(H \, k)$ in (7.1) is less than $c_2 \/ 4$, and then take $x$ large enough that its remaining error is less than $c_2 \/ 4$. Equations (7.1) and (7.6) give $C_(f_k) \( x \) gt.eq c_2 \/ 2$ for every sufficiently large $x$. This count is also bounded above, since $N_k \( x \) lt.eq V \( x \)$ and (3.4) holds. The bounds clause of Lemma 22 therefore gives

$ inf_(0 lt.eq s < 1) A \( f_k \; s \) gt.eq c_2 \/ 2 > 0 . $

Therefore the additive formula (7.4) is multiplicative in this case. Its positive lower bound, the inequality $N_k \( x \) lt.eq V \( x \)$, and (3.4) give $N_k \( x \) asymp_k V \( x \)$.

If instead $ell \( d \) lt.eq k d$ for every totient $d$, then $ell \( v \) lt.eq k v lt.eq k x$ for every $v lt.eq x$. Hence $N_k \( x \) = 0$ for every $x$. Every weight $f_k \( ell \( d \) \/ d \)$ in the finite arithmetic formula is also zero, so $A_H \( f_k \; s \) = A \( f_k \; s \) = 0$. This proves the dichotomy in Theorem 2. Its final assertion is established next.

#prodef([Remark 7.4.])[
  The positive alternative occurs for $k = 1$ and $k = 2$. Ford gives $d = 2^18 dot.op 257$ as a totient all of whose preimages are divisible by $8$ #cite(label("FordTotients2013")) Section 7.3, p. 39. Each such preimage $n$ is even and has an odd prime factor: a power of $2$ would have a power of $2$ as its totient. Thus $n \/ phi \( n \) = product_(p divides n) p \/ \( p - 1 \) > 2$, and $ell \( d \) > 2 d$.
  We do not determine all integers $k$ for which the positive alternative occurs. Its occurrence for every integer $k gt.eq 1$ is equivalent to the unboundedness of $ell \( d \) \/ d$ over totients $d$. Neither that unboundedness nor the complete classification of $k$ is established here.
] <rem:least-preimage-scope>


#bibliography("refs.bib", style: "ieee", title: [References])
