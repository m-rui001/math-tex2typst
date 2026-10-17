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

#align(center)[#text(size: 16pt, weight: "bold")[Asymptotically minimal maxima of real Littlewood polynomials]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Write $bb(T) = bb(R) \/ bb(Z)$ and $upright(e) \( t \) = exp \( 2 pi i t \)$. All tori carry probability Haar measure. A Littlewood polynomial of length $N$ is a polynomial

$ P \( z \) = sum_(k = 0)^(N - 1) epsilon_k z^k \, #h(2em) epsilon_k in { - 1 \, 1 } . $

Its maximum modulus is $∥P∥_oo = max_(t in bb(T)) \| P \( upright(e) \( t \) \) \|$. Define

$ m_N = min_(epsilon_0 \, dots.h \, epsilon_(N - 1) in { - 1 \, 1 }) 1 / sqrt(N) ∥sum_(k = 0)^(N - 1) epsilon_k z^k∥_oo . $

Orthogonality gives $∥P∥_2^2 = N$, so $m_N gt.eq 1$. The real-sign analogue of Erdős’s fixed-gap question asks whether $m_N$ is eventually bounded below by $1 + c$ for some absolute $c > 0$. Erdős’s original question allowed complex unimodular coefficients and was refuted in that class by Kahane; the restriction to real signs is the question addressed here #cite(label("Erdos1957")) Problem 22; see also #cite(label("Kahane1980")) and #cite(label("HaymanLingham2018")) Problems 4.13 and 4.31.

#thm([Theorem 1.1.])[
  #emph[For Littlewood polynomials with real coefficients, 
$ lim_(N arrow.r oo) m_N = 1 . $

 Equivalently, for every $eta > 0$ there is $N_0$ such that for every integer $N gt.eq N_0$ there are signs $epsilon_0 \, dots.h \, epsilon_(N - 1)$ with 
$ max_(\| z \| = 1) lr(|sum_(k = 0)^(N - 1) epsilon_k z^k|) lt.eq \( 1 + eta \) sqrt(N) . $

]
] <thm:main>

The theorem concerns every sufficiently large length, rather than a subsequence. It gives no uniform lower bound for $\| P \( z \) \|$ and hence does not assert two-sided uniform ultraflatness. The choices in the proof are existential; no useful convergence rate or efficient signing algorithm is asserted.

=== 1.1 Context and comparison <context-and-comparison>

The Shapiro–Rudin construction, obtained earlier by Shapiro and independently by Rudin, gives real-sign polynomials with maximum $O \( sqrt(N) \)$; at dyadic lengths its paired identity gives an upper bound $sqrt(2 N)$ #cite(label("Rudin1959")) Theorem I and its proof. Balister proved the all-length bound $sqrt(6 N - 2) - 1$ for its initial segments #cite(label("Balister2019")) Theorem 1. A different problem asks for upper and lower bounds by fixed positive multiples of $sqrt(N)$ throughout the circle. Such two-sided flat Littlewood polynomials were constructed by Balister, Bollobás, Morris, Sahasrabudhe and Tiba, whose proof combines the Shapiro–Rudin construction with discrepancy theory #cite(label("BalisterEtAl2020")). These results control the scale of the maximum, but do not make the upper constant tend to one.

The coefficient class matters. Complex coefficients of modulus one allow ultraflat constructions. Littlewood used quadratic phases near this Parseval scale, Kahane obtained ultraflatness, and Bombieri and Bourgain gave quantitative constructions #cite(label("Littlewood1966")) #cite(label("Kahane1980")) #cite(label("BombieriBourgain2009")). The smoothed quadratic phases and Poisson summation used in #cite(label("BombieriBourgain2009")) Sections 2 and 7 are analytic predecessors of the sampling argument below. Their bounded-to-unimodular correction also develops a method of Körner #cite(label("BombieriBourgain2009")) Section 8. The present proof must instead preserve real coefficients and round them to signs. The distinction between the unimodular and real-sign questions is also explicit in #cite(label("HaymanLingham2018")) Problem 4.31. Georgiev, Gómez-Serrano, Tao and Wagner recently used AlphaEvolve to search for the same real-sign minimum at degrees up to $100$; their computations do not give an asymptotic theorem #cite(label("GeorgievEtAl2025")) Section 6.13.

There can still be a growing additive gap above Parseval’s bound. Erdélyi proved that every Littlewood polynomial of length $N$ satisfies #cite(label("Erdelyi2026")) Theorem 2.1

$ ∥P∥_oo^2 gt.eq N + frac(\( N - 1 \)^(1 \/ 3), 38) . $

The extra term divided by $N$ tends to zero, so this is compatible with Theorem 1.

The theorem implies flatness in every fixed finite $L^p$ modulus sense. This conflicts with nonflatness claims in preprints of el Abdalaoui #cite(label("ElAbdalaoui2017")) #cite(label("ElAbdalaoui2025")) #cite(label("ElAbdalaoui2025Generalization")). Section 7 proves the implication with our normalization. Appendix 9 examines specific issues in the contrary arguments.

=== 1.2 Merit factors and a symbolic spectral consequence <merit-factors-and-a-symbolic-spectral-consequence>

For a binary word $A = \( a_0 \, dots.h \, a_(N - 1) \) in { - 1 \, 1 }^N$ of length $N gt.eq 2$, define its aperiodic sidelobe autocorrelations and merit factor by

$ C_u \( A \) = sum_(j = 0)^(N - 1 - u) a_j a_(j + u) quad \( 1 lt.eq u < N \) \, #h(2em) F \( A \) = frac(N^2, 2 sum_(u = 1)^(N - 1) C_u \( A \)^2) . $

This is the standard merit-factor normalization #cite(label("DownarowiczLacroix1998")) Definition 2 and Lemma 0; see also #cite(label("JedwabKatzSchmidt2013")) Introduction for its fourth-moment formulation. The conjectured boundedness of $F \( A \)$ over all such words is called Turyn’s conjecture, equivalently Erdős’s $L^4$-norm conjecture, in #cite(label("DownarowiczLacroix1998")) p. 3 of the author manuscript. For comparison, Jedwab, Katz and Schmidt constructed families with limiting merit factor $6.342061 dots.h$, improving the previous proven value $6$, by modifying and extending Legendre sequences #cite(label("JedwabKatzSchmidt2013")) Theorem 1.1 and Corollary 3.2. Section 8 disproves this boundedness in the stronger all-length form: the largest merit factor at length $N$ tends to infinity as $N$ tends to infinity through all integers.

Downarowicz and Lacroix also relate this question to binary Morse shifts, the discrete-time symbolic systems generated by iterated products of binary words. Their theorem converts unbounded binary merit factors into a uniquely ergodic binary Morse shift with simple spectrum whose zero-coordinate spectral measure is absolutely continuous with an $L^2$ density #cite(label("DownarowiczLacroix1998")) Theorem 2 and its proof. Section 8 gives the precise spectral statement and its deduction from Theorem 1.

=== 1.3 Proof overview <proof-overview>

We first allow real coefficients $X_(N \, k) in \[ - 1 \, 1 \]$. Their defect from being signs is measured by

$ mu \( X_N \) = 1 / 2 sum_(k = 0)^(N - 1) \( 1 - \| X_(N \, k) \| \) . $

The construction makes the normalized Fourier maximum close to one while keeping $N^(- 1) sum_k X_(N \, k)^2$ close to one. The latter condition makes $mu \( X_N \) \/ N$ small. A discrepancy argument then replaces the coefficients by signs, with an error controlled by this small defect. Section 2 states both intermediate results precisely and gives the deduction of the theorem.

To build the relaxed coefficients, we use a real trigonometric polynomial $F$ on an auxiliary torus whose absolute value is at most one and whose mean-square mass is nearly one. Each Fourier mode of $F$ is assigned a nonzero quadratic curvature. A stationary-phase calculation shows that sampling such a mode on a block spreads its Fourier contribution over an interval whose width is proportional to that curvature. There are two requirements: distinct modes and blocks must have disjoint intervals, and each individual contribution must have size at most approximately $sqrt(N)$.

Section 3 supplies the interval packing, even when the integer frequency vectors have linear relations. It uses a randomly constructed finite-field hypergraph and the Pippenger–Spencer coloring theorem, in the near-perfect-packing lineage of Frankl and Rödl #cite(label("FranklRodl1985")) #cite(label("PippengerSpencer1989")) #cite(label("AlonYuster2005")). Section 4 adjusts the Fourier coefficients of $F$ by quadratic oscillations in extra variables so that their sizes match the available widths. Section 5 samples the resulting fixed polynomial on disjoint blocks. At each angle at most one stationary contribution remains, whereas orthogonality in the sampling limit recovers nearly full mean-square mass.

Finally, Section 6 proves the defect-sensitive rounding bound. We use the partial-coloring method of Beck and Spencer #cite(label("Beck1981")) #cite(label("Spencer1985")), in the arbitrary-vector form verified through Lovett–Meka’s theorem #cite(label("LovettMeka2015")). A dyadic rounding procedure keeps the defect mass from increasing, which makes its total loss $o \( sqrt(N) \)$ as the target error decreases. All auxiliary dimensions, frequencies, primes, blocks and smooth cutoffs are fixed before $N$ tends to infinity.

== 2 Reduction to approximation and rounding <sec:reduction>

For a vector $X = \( X_0 \, dots.h \, X_(N - 1) \) in \[ - 1 \, 1 \]^N$, write

$ Q_X \( t \) = sum_(k = 0)^(N - 1) X_k upright(e) \( k t \) \, #h(2em) mu \( X \) = 1 / 2 sum_(k = 0)^(N - 1) \( 1 - \| X_k \| \) . $

The first proposition constructs vectors with small Fourier maximum and nearly maximal energy. Its proof occupies Sections 3–5.

#thm([Proposition 2.1.])[
  (Almost-sign approximation).  #emph[For every $0 < delta < 1 \/ 20$, there are vectors $X_N = \( X_(N \, 0) \, dots.h \, X_(N \, N - 1) \) in \[ - 1 \, 1 \]^N$, one for each integer $N gt.eq 1$, such that 
#[#set math.equation(numbering: n => "(1)")
 $ limsup_(N arrow.r oo) ∥Q_(X_N)∥_oo / sqrt(N) & lt.eq K_delta \, & K_delta & = sqrt(frac(\( 1 + delta \)^3, 1 - delta)) \,\
liminf_(N arrow.r oo) 1 / N sum_(k = 0)^(N - 1) X_(N \, k)^2 & gt.eq 1 - 7 delta . $ <eq:almost-maximum>]

]
] <prop:almost-signs>

The next lemma converts an arbitrary relaxed vector to signs. Its constant does not depend on the vector or its length. We prove it in Section 6.

#thm([Lemma 2.2.])[
  (Rounding with a small defect).  #emph[There is an absolute constant $C$ such that for every $N gt.eq 1$ and every $X in \[ - 1 \, 1 \]^N$, some signs $epsilon_0 \, dots.h \, epsilon_(N - 1)$ satisfy 
#[#set math.equation(numbering: n => "(2)")
 $ max_(t in bb(T)) lr(|sum_(k = 0)^(N - 1) \( epsilon_k - X_k \) upright(e) \( k t \)|) lt.eq C (1 + sqrt(mu \( X \) log frac(80 N, mu \( X \)))) . $ <eq:defect-rounding>]

 The square-root term is defined to be zero when $mu \( X \) = 0$; in that case $X$ already has sign entries and the left side may be zero.]
] <lem:rounding>

#proof[
  Fix $0 < delta < 1 \/ 20$ and choose the family from Proposition 2. For all sufficiently large $N$, (1) gives
  $ 1 / N sum_k X_(N \, k)^2 gt.eq 1 - 8 delta . $
  Since $1 - \| x \| lt.eq 1 - x^2$ for $\| x \| lt.eq 1$, it follows that $mu \( X_N \) lt.eq 4 delta N$. The function $u mapsto u log \( 80 N \/ u \)$ is increasing on $0 < u lt.eq N \/ 2$. Applying Lemma 3 and then (1), we obtain
  $ limsup_(N arrow.r oo) m_N lt.eq K_delta + 2 C sqrt(delta log \( 20 \/ delta \)) . $
  First the limit in $N$ was taken with every auxiliary choice depending on $delta$ fixed. Now let $delta arrow.b 0$. The right side tends to one, and the lower bound $m_N gt.eq 1$ follows from Parseval. This proves the limit through all positive integer lengths. ◻
]

== 3 Packing signed intervals <sec:packing>

The sampling construction will divide the coefficient positions into $H$ blocks, each of normalized length $1 \/ H$. To explain the packing required, consider one mode with coefficient $c in bb(C)$, a smooth cutoff $0 lt.eq chi lt.eq 1$ supported strictly inside its block, linear frequency $eta in bb(R)$, and nonzero quadratic curvature $lambda in bb(R)$ with $\| lambda \| \/ H < 1$. On a block centered at $x_(*)$ its phase, with $x = k \/ N$, is

$ N (lambda / 2 \( x - x_(*) \)^2 + \( t + eta \) x) . $

After allowing for integer frequencies in Poisson summation, a stationary point in the cutoff support can occur only when $- t$ belongs to the circle interval centered at $eta med \( mod med 1 \)$ of width $\| lambda \| \/ H$. With the mode and cutoff fixed, quadratic stationary phase gives the asymptotic bound $\| c \| \/ sqrt(\| lambda \|)$ for its contribution divided by $sqrt(N)$. We therefore reserve total width $\| lambda \|$ across the $H$ blocks for this mode, while each block has the same peak bound. Section 5 will make these estimates uniform in $t$. For a real auxiliary polynomial, opposite Fourier modes produce opposite centers and equal widths, so both intervals must be reserved.

We now prove the geometric statement needed to separate all these stationary intervals. Their centers must be values of specified integer linear forms at one common point for each block. We allow relations among three or more forms; the only independence assumption concerns pairs of forms.

For $eta in bb(T)$ and $0 < ell < 1$, write

$ I \( eta \, ell \) = { eta + x med \( mod med 1 \) : - ell \/ 2 lt.eq x lt.eq ell \/ 2 } $

for the closed interval with center $eta$ and length $ell$.

#thm([Lemma 3.1.])[
  (Signed interval packing).  #emph[Let $m gt.eq 1$ and $r gt.eq 2$ be integers, and let $a_1 \, dots.h \, a_r in bb(Z)^m \\ { 0 }$ be pairwise nonparallel. If $w_1 \, dots.h \, w_r > 0$ satisfy $2 sum_i w_i < 1$, there exist an integer $H gt.eq 1$ and points $theta_1 \, dots.h \, theta_H in bb(T)^m$ such that the $2 r H$ closed intervals 
$ I #scale(x: 120%, y: 120%)[\(] sigma a_i dot.op theta_h \, w_i \/ H #scale(x: 120%, y: 120%)[\)] \, #h(2em) 1 lt.eq i lt.eq r \, quad 1 lt.eq h lt.eq H \, quad sigma in { - 1 \, 1 } \, $

 are pairwise disjoint.]
] <lem:signed-packing>

We will use the following form of the Pippenger–Spencer edge-coloring theorem #cite(label("PippengerSpencer1989")); the quantified statement below is #cite(label("AlonYuster2005")) Lemma 2.1. A hypergraph here is finite and has distinct edges, each an $r$-element subset of its vertex set. Its degree $d \( v \)$ counts edges containing $v$, and its codegree $d \( u \, v \)$ counts edges containing both distinct vertices $u \, v$. An edge coloring partitions the edges into matchings, where a matching is a collection of pairwise disjoint edges.

#thm([Theorem 3.2.])[
  (Pippenger–Spencer).  #emph[For each integer $r gt.eq 2$ and each $gamma > 0$, there exists $beta > 0$ with the following property. If an $r$-uniform hypergraph satisfies, for some $t > 0$, 
$ \( 1 - beta \) t < d \( v \) < \( 1 + beta \) t quad upright("for every vertex ") v \, #h(2em) d \( u \, v \) < beta t quad upright("for ") u eq.not v \, $

 then its edges can be partitioned into at most $\( 1 + gamma \) t$ matchings.]
] <thm:packing-edge-coloring>

In particular, for fixed $r$, degrees $\( 1 + o \( 1 \) \) D$ and maximum codegree $o \( D \)$ give an edge coloring with $\( 1 + o \( 1 \) \) D$ colors. We construct such a hypergraph whose vertices are small disjoint slots in a half-circle. An edge records one compatible center of each type. A large matching will provide many compatible choices without reusing any slot.

#proof[
  All constants implicit in asymptotic estimates may depend on the fixed forms and the fixed slot lengths chosen next. The sole parameter tending to infinity in this proof will be a prime $q$.
  ===== 3.1 Slot lengths and finite-field ranks. <slot-lengths-and-finite-field-ranks.>
  Choose positive proportions $alpha_i > 2 w_i$ with $sum_i alpha_i = 1$. Approximating $T alpha_i$ by positive odd integers as $T arrow.r oo$ gives fixed odd integers $L_i$ such that, with $L = sum_i L_i$,
  #[#set math.equation(numbering: n => "(3)")
   $ w_i < frac(L_i, 2 L) #h(2em) \( 1 lt.eq i lt.eq r \) . $ <eq:packing-width-slack>]
  Let $b$ be the rank over $bb(Q)$ of the matrix whose rows are the $a_i$. Then $b gt.eq 2$. For every sufficiently large prime $q$, the full matrix has rank $b$ over $bb(F)_q$, and each pair of rows has rank two. Indeed, it suffices to exclude the prime divisors of a nonzero $b$-by-$b$ minor and of one nonzero two-by-two minor for each pair. Fix such a prime for the following construction.
  ===== 3.2 Random slots and oriented centers. <random-slots-and-oriented-centers.>
  Put $n = \( q - 1 \) \/ 2$, $R = floor.l sqrt(q) floor.r$, and $U_q = { 1 \, dots.h \, n }$. For $s in bb(F)_q$, let $\| s \|_q$ be the absolute value of its representative in $\[ - n \, n \]$. Partition $U_q$ into consecutive chunks of $R$ sites, with a possible final shorter chunk. There are $K = ceil.l n \/ R ceil.r$ chunks.
  Consider a periodic partition of the integers into consecutive slots: each period has one slot of type $i$, consisting of $L_i$ consecutive sites, for each $i = 1 \, dots.h \, r$. Independently in each chunk, translate this pattern by a uniform residue modulo $L$, and keep only slots entirely contained in that chunk. A kept slot is a vertex of its type. Its middle site $c$ is an integer because $L_i$ is odd. Give it an oriented center $s = c$ or $s = - c$ in $bb(F)_q$, with equal probabilities, independently for all kept slots. The random data in different chunks are independent.
  A chunk of length $u$ contains $u \/ L + O \( 1 \)$ kept slots of each type, uniformly in its shift. Thus in every realization the number of vertices of each type is
  #[#set math.equation(numbering: n => "(4)")
   $ n / L + O \( K \) = frac(q, 2 L) + O \( q \/ R + 1 \) . $ <eq:packing-vertex-count>]
  This estimate includes the last short chunk. Call a site interior if its distance from both endpoints of its chunk is at least $L$. For any nonzero $u in bb(F)_q$ whose folded site $\| u \|_q$ is interior, the probability that $u$ is the oriented center of a vertex of a specified type $j$ is exactly
  #[#set math.equation(numbering: n => "(5)")
   $ p = frac(1, 2 L) . $ <eq:packing-center-probability>]
  There is exactly one shift modulo $L$ placing a type-$j$ middle site there; the resulting slot is fully contained in the chunk, and its orientation has the required sign with probability $1 \/ 2$.
  ===== 3.3 Compatible tuples form a simple hypergraph. <compatible-tuples-form-a-simple-hypergraph.>
  An edge is a tuple of one vertex of each type, with oriented centers $s_1 \, dots.h \, s_r$, for which the equations
  $ a_i dot.op y = s_i #h(2em) \( 1 lt.eq i lt.eq r \) $
  have a solution $y in bb(F)_q^m$. We keep one edge per tuple, regardless of the number of solutions. Every compatible tuple has exactly $q^(m - b)$ solutions, the size of the kernel of the rank-$b$ evaluation map. This constructs a simple $r$-uniform hypergraph.
  Write $C_j \( u \)$ for the indicator that $u$ is the oriented center of a type-$j$ vertex. For nonzero $s$, define the random variable
  $ Z_(i \, s) = 1 / q^(m - 1) sum_(y in bb(F)_q^m\
a_i dot.op y = s) product_(j eq.not i) C_j \( a_j dot.op y \) . $
  When the vertex of type $i$ with center $s$ exists, its degree is exactly
  #[#set math.equation(numbering: n => "(6)")
   $ d \( i \, s \) = q^(b - 1) Z_(i \, s) . $ <eq:packing-degree>]
  This follows by dividing the number $q^(m - 1) Z_(i \, s)$ of generating vectors by $q^(m - b)$. Likewise, two fixed evaluations of different types leave $q^(m - 2)$ possible vectors, so their codegree is at most
  #[#set math.equation(numbering: n => "(7)")
   $ q^(b - 2) . $ <eq:packing-codegree>]
  Two vertices of the same type have codegree zero.
  We next show that nearly all vertices have nearly the same degree. Although evaluations of several forms may be dependent, their folded sites usually belong to different chunks. The independent chunk choices then supply the first and second moments we need.
  ===== 3.4 Exceptional centers and the moment estimates. <exceptional-centers-and-the-moment-estimates.>
  For a fixed type $i$, let $E_i$ contain those nonzero $s in bb(F)_q$ for which there exist $j < l$, both different from $i$, and a relation
  #[#set math.equation(numbering: n => "(8)")
   $ a_j + a_l = c a_i quad upright("or") quad a_j - a_l = c a_i \, #h(2em) \| c s \|_q lt.eq R . $ <eq:packing-exceptional-relation>]
  Any such relation has a unique nonzero $c$: if $c = 0$, the two forms $a_j \, a_l$ would be parallel over $bb(F)_q$. For each relation, multiplication by $c$ is a bijection, so at most $2 R + 1$ residues are excluded. There are at most $2 binom(r - 1, 2)$ relations, giving
  #[#set math.equation(numbering: n => "(9)")
   $ \| E_i \| = O \( R \) . $ <eq:packing-exception-count>]
  Fix a nonzero $s in.not E_i$, and sample $y$ uniformly on the affine fiber $a_i dot.op y = s$. Each other evaluation $a_j dot.op y$ is uniform on $bb(F)_q$, by pairwise rank two. Let $Q_s$ be the chunk containing $\| s \|_q$. At most $2 L K$ positive sites are noninterior; this bound also covers a short final chunk with no interior sites. Including their negatives, zero, and the residues folding into $Q_s$, the probability that a specified evaluation fails to fold into an interior site outside $Q_s$ is at most
  $ tau_q = frac(1 + 4 L K + 2 R, q) = O \( q^(- 1 \/ 2) \) . $
  If two residues fold into one chunk, the difference of their folded sites has absolute value at most $R$. Consequently at least one of their sum and difference has folded absolute value at most $R$. For $a_j dot.op y$ and $a_l dot.op y$, each of these signed combinations is either uniform on $bb(F)_q$ under $a_i dot.op y = s$, or is the constant $c s$ from a relation in (8). The latter case cannot cause a collision because $s in.not E_i$; the former has probability at most $\( 2 R + 1 \) \/ q$. Thus the $r - 1$ evaluations fold into distinct interior chunks different from $Q_s$, except on an $O \( q^(- 1 \/ 2) \)$ fraction of the fiber.
  For the second moment, take two independent uniform vectors $y \, y'$ from the same fiber. The preceding bounds apply within each copy. Across copies, $a_j dot.op y$ and $a_l dot.op y'$ are independent uniform residues for any $j \, l eq.not i$, including $j = l$; their sum and difference are therefore uniform. A union bound shows that the combined list of $2 \( r - 1 \)$ evaluations also occupies distinct interior chunks outside $Q_s$, apart from a fraction $O \( q^(- 1 \/ 2) \)$. More explicitly, for either $u = 1$ or $u = 2$ independent fiber samples, the failure fraction is at most
  #[#set math.equation(numbering: n => "(10)")
   $ u \( r - 1 \) tau_q + 2 binom(u \( r - 1 \), 2) frac(2 R + 1, q) = O \( q^(- 1 \/ 2) \) . $ <eq:packing-good-tuples>]
  This bound uses no joint independence among the forms in one copy.
  Let $V_(i \, s)$ be the event $C_i \( s \) = 1$, and condition on it whenever it has positive probability. The event depends only on random data in $Q_s$. Each tuple counted as good in (10) uses distinct other chunks, where the required center hits are independent and each has probability $p$. The good-tuple condition itself depends only on the fiber vectors, not on the slot choices. Averaging over those vectors, and bounding the contribution of bad tuples between zero and one, gives
  #[#set math.equation(numbering: n => "(11)")
   $ bb(E) \[ Z_(i \, s) divides V_(i \, s) \] & = p^(r - 1) + O \( q^(- 1 \/ 2) \) \,\
bb(E) \[ Z_(i \, s)^2 divides V_(i \, s) \] & = p^(2 \( r - 1 \)) + O \( q^(- 1 \/ 2) \) . $ <eq:packing-first-moment>]
  The expectations are over the random slots and orientations. The second identity follows by expanding the square as the average over the independent pair $y \, y'$. Both error bounds are uniform in nonexceptional $s$. The conditioned vertex itself need not be interior: avoiding its entire chunk makes that unnecessary.
  ===== 3.5 Deleting the few vertices of atypical degree. <deleting-the-few-vertices-of-atypical-degree.>
  Set $D_q = p^(r - 1) q^(b - 1)$ and $epsilon_q = q^(- 1 \/ 8)$. Equations (11)–(11) imply
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( Z_(i \, s) - p^(r - 1) \)^2 divides V_(i \, s) #scale(x: 120%, y: 120%)[\]] = O \( q^(- 1 \/ 2) \) . $
  By Chebyshev’s inequality and (6), a nonexceptional present vertex has degree outside $\[ \( 1 - epsilon_q \) D_q \, \( 1 + epsilon_q \) D_q \]$ with conditional probability $O \( q^(- 1 \/ 4) \)$. Summing over the at most $r \( q - 1 \)$ candidate centers gives an expected $O \( q^(3 \/ 4) \)$ such vertices. The vertices with centers in some $E_i$ number $O \( q^(1 \/ 2) \)$ in every realization. Markov’s inequality therefore provides a realization with at most $q^(7 \/ 8)$ vertices in these two classes, for all sufficiently large $q$.
  Delete these vertices and all incident edges. By (7), any remaining vertex loses at most
  $ q^(7 \/ 8) q^(b - 2) = O \( q^(- 1 \/ 8) D_q \) $
  edges. Hence every remaining degree is $\( 1 + O \( q^(- 1 \/ 8) \) \) D_q$, and the maximum codegree remains at most $q^(b - 2) = o \( D_q \)$. By (4), each type still has $\( 1 + o \( 1 \) \) q \/ \( 2 L \)$ vertices.
  ===== 3.6 A matching supplies the centers. <a-matching-supplies-the-centers.>
  We have obtained a hypergraph to which Theorem 5 applies. If it has $v_q$ vertices, degree summation gives
  $ \| E \| = 1 / r sum_v d \( v \) = \( 1 + o \( 1 \) \) frac(v_q D_q, r) . $
  An edge coloring into $\( 1 + o \( 1 \) \) D_q$ matchings therefore has a color class with at least $\( 1 - o \( 1 \) \) v_q \/ r = \( 1 - o \( 1 \) \) q \/ \( 2 L \)$ edges. A matching has no more edges than the number of vertices of any one type. We have consequently found a matching of size
  #[#set math.equation(numbering: n => "(12)")
   $ H = \( 1 + o \( 1 \) \) frac(q, 2 L) . $ <eq:packing-matching-size>]
  For each of its edges choose a generating vector $y_h in bb(F)_q^m$. Using integer representatives of its coordinates, set $theta_h = y_h \/ q med \( mod med bb(Z)^m \)$. Then $a_i dot.op theta_h$ is the oriented center of the corresponding slot divided by $q$, modulo one.
  It remains to check the geometry, including endpoints. A slot of type $i$ with sites $t \, dots.h \, t + L_i - 1$ corresponds to the real interval
  $ J = [frac(t - 1 \/ 2, q) \, frac(t + L_i - 1 \/ 2, q)] . $
  Its length is $L_i \/ q$, and its center is the middle site divided by $q$. The positive slots lie in $\[ 1 \/ \( 2 q \) \, 1 \/ 2 \]$ and have disjoint interiors. Their reflections modulo one lie in $\[ 1 \/ 2 \, 1 - 1 \/ \( 2 q \) \]$ and also have disjoint interiors. Neighboring slots may share an endpoint, and a slot may meet its reflection at $1 \/ 2$, but none of these intersections reaches their interiors.
  By (3) and (12), a sufficiently large prime gives $w_i \/ H < L_i \/ q$ for every $i$. The desired closed interval at each signed center is therefore contained strictly inside its slot or reflected slot. Both signs use this same pair of slots, irrespective of the chosen orientation. The matching uses distinct vertices, so all these containing slot interiors are disjoint. This proves the required disjointness of the closed intervals, including at $1 \/ 2$ and across zero on the circle. ◻
]

The prime, the matching size $H$, and the points $theta_h$ have now served only to establish the finite packing. In applications we choose them once, after the forms and widths are fixed; they impose no restriction on a later sampling length.

== 4 Spreading Fourier coefficients <sec:spreading>

We next construct a real function which has almost unit modulus in mean square and whose Fourier coefficients fit within a total spectral width less than one. The coefficient assigned to a width $w$ must have size at most approximately $sqrt(w)$: this is the normalization of the quadratic integral in Lemma 7. Additional torus variables let us distribute each coefficient among many frequencies while controlling both their number and their sizes.

For a trigonometric polynomial $F$ on $bb(T)^m$, write

$ hat(F) \( a \) = integral_(bb(T)^m) F \( x \) upright(e) \( - a dot.op x \) thin d x \, #h(2em) a in bb(Z)^m . $

A finite set is a #emph[containing Fourier support] if every coefficient outside it vanishes; coefficients inside it are allowed to vanish as well. All norms and integrals on tori use probability Haar measure.

#thm([Proposition 4.1.])[
  (An auxiliary polynomial with controlled widths).  #emph[For every $0 < delta < 1 \/ 20$, there exist integers $m gt.eq 1$ and $r gt.eq 2$, nonzero vectors $a_1 \, dots.h \, a_r in bb(Z)^m$, a real-valued trigonometric polynomial $F$ on $bb(T)^m$, and a vector $v in bb(R)^m$ with the following properties. No two of the vectors $a_i$ are parallel, and 
$ cal(A) = { a_1 \, - a_1 \, dots.h \, a_r \, - a_r } $

 is a containing Fourier support of $F$. Moreover, 
#[#set math.equation(numbering: n => "(13)")
 $ ∥F∥_oo lt.eq 1 \, #h(2em) ∥F∥_2 gt.eq 1 - 3 delta . $ <eq:auxiliary-norms>]

 Writing $lambda_a = a dot.op v$ for $a in cal(A)$, we have 
#[#set math.equation(numbering: n => "(14)")
 $ lambda_a eq.not 0 \, #h(2em) sum_(a in cal(A)) \| lambda_a \| < 1 \, #h(2em) frac(\| hat(F) \( a \) \|, sqrt(\| lambda_a \|)) lt.eq K_delta \, #h(2em) K_delta = sqrt(frac(\( 1 + delta \)^3, 1 - delta)) . $ <eq:auxiliary-widths>]

 All these objects depend on $delta$ alone.]
] <prop:auxiliary>

The construction starts with a polynomial of almost unit mean square. Quadratic oscillations in new variables spread its coefficients; finite Fourier truncation then gives the required polynomial. We first record the uniform quadratic estimate used to control the spread coefficients. The quadratic Fourier-inversion identity behind this estimate also appears in #cite(label("BombieriBourgain2009")) Section 2, Equation (2.2). We give the fixed-cutoff form, uniform in the linear frequency.

#thm([Lemma 4.2.])[
  (Uniform quadratic integration).  #emph[Let $g in C_c^oo \( bb(R) \)$ and let $beta in bb(R) \\ { 0 }$ be fixed. As $T arrow.r oo$ through positive real values, 
#[#set math.equation(numbering: n => "(15)")
 $ integral_(bb(R)) g \( x \) upright(e) \( T beta x^2 \/ 2 - u x \) thin d x =  & frac(upright(e) \( "sgn" \( beta \) \/ 8 - u^2 \/ \( 2 T beta \) \), sqrt(T \| beta \|))\
 & #h(2em) dot.op (g (frac(u, T beta)) + O_(g \, beta) \( T^(- 1) \)) \, $ <eq:uniform-quadratic>]

 uniformly for every real $u$.]
] <lem:quadratic>

#proof[
  Use the real-line Fourier transform $hat(g) \( xi \) = integral_(bb(R)) g \( x \) upright(e) \( - xi x \) thin d x$, and put $x_0 = u \/ \( T beta \)$. Completing the square reduces the integral to
  $ upright(e) (- frac(u^2, 2 T beta)) integral_(bb(R)) g \( x_0 + y \) upright(e) \( T beta y^2 \/ 2 \) thin d y . $
  Insert the damping factor $exp \( - pi rho y^2 \)$ with $rho > 0$, and use Fourier inversion on $g \( x_0 + y \)$. The resulting double integral is absolutely integrable. The inner Gaussian integral is
  $ integral_(bb(R)) exp #scale(x: 120%, y: 120%)[\(] - pi \( rho - i T beta \) y^2 + 2 pi i xi y #scale(x: 120%, y: 120%)[\)] thin d y = \( rho - i T beta \)^(- 1 \/ 2) exp (- frac(pi xi^2, rho - i T beta)) . $
  Here the square root is the branch analytic in the right half-plane and positive on the positive real axis. As $rho arrow.b 0$,
  $ \( rho - i T beta \)^(- 1 \/ 2) arrow.r frac(upright(e) \( "sgn" \( beta \) \/ 8 \), sqrt(T \| beta \|)) \, #h(2em) exp (- frac(pi xi^2, rho - i T beta)) arrow.r upright(e) (- frac(xi^2, 2 T beta)) . $
  The modulus of the exponential multiplier is at most one, and $\| \( rho - i T beta \)^(- 1 \/ 2) \| lt.eq \( T \| beta \| \)^(- 1 \/ 2)$. Since $hat(g)$ is Schwartz, dominated convergence applies on the Fourier side. On the original side it applies with dominating function $\| g \( x_0 + y \) \|$. We obtain the exact identity
  #[#set math.equation(numbering: n => "(16)")
   $ integral_(bb(R)) g \( x \) upright(e) \( T beta x^2 \/ 2 - u x \) thin d x =  & frac(upright(e) \( "sgn" \( beta \) \/ 8 - u^2 \/ \( 2 T beta \) \), sqrt(T \| beta \|))\
 & #h(2em) dot.op integral_(bb(R)) hat(g) \( xi \) upright(e) \( xi x_0 \) upright(e) (- frac(xi^2, 2 T beta)) d xi . $ <eq:quadratic-exact>]
  The difference of the last integral from $g \( x_0 \)$ has absolute value at most
  $ frac(pi, T \| beta \|) integral_(bb(R)) xi^2 \| hat(g) \( xi \) \| thin d xi . $
  This bound is independent of $x_0$, proving the required uniformity. ◻
]

#proof[
  Fix $delta$. The choices below are successive: once a parameter has been chosen, it stays fixed while later parameters vary.
  ===== 4.1 A polynomial of almost unit mean square. <a-polynomial-of-almost-unit-mean-square.>
  Starting with $p_0 = 0$, introduce one new torus coordinate at each step and define
  #[#set math.equation(numbering: n => "(17)")
   $ p_j \( y_1 \, dots.h \, y_j \) = p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \) + frac(1 - p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \)^2, 2) cos \( 2 pi y_j \) . $ <eq:binary-recursion>]
  For $\| z \| lt.eq 1$, $\( 1 - z^2 \) \/ 2 = \( 1 - \| z \| \) \( 1 + \| z \| \) \/ 2 lt.eq 1 - \| z \|$. Thus $\| p_j \| lt.eq 1$ pointwise. Integrating first in $y_j$ shows that $p_j$ has mean zero. If $M_j = integral_(bb(T)^j) p_j^2$, integration of the square in the new variable gives
  #[#set math.equation(numbering: n => "(18)")
   $ M_j = M_(j - 1) + 1 / 8 integral_(bb(T)^(j - 1)) \( 1 - p_(j - 1)^2 \)^2 gt.eq M_(j - 1) + 1 / 8 \( 1 - M_(j - 1) \)^2 . $ <eq:binary-energy>]
  Hence $M_j arrow.t 1$: a limit below one would make the increments bounded below by a positive constant. Choose $d gt.eq 2$ so that $M_d gt.eq 1 - delta$.
  Let $cal(S) subset bb(Z)^d$ be the Fourier support of $p_d$, consisting of the frequencies with nonzero coefficients, and put $c_s = hat(p)_d \( s \)$. Every vector in $cal(S)$ has last nonzero coordinate equal to $1$ or $- 1$. Indeed, the old term in (17) keeps the previous frequencies with new coordinate zero, whereas every frequency in the new term has new coordinate $1$ or $- 1$. The two terms cannot cancel each other. There is no constant frequency because the mean is zero.
  If two such vectors are parallel, comparing their last nonzero coordinates shows that they are equal or negatives. Let $s_1 \, dots.h \, s_D$ be those with positive last nonzero coordinate. They are pairwise nonparallel and $cal(S) = { plus.minus s_1 \, dots.h \, plus.minus s_D }$. There are at least two: the coefficient at the first coordinate vector in $p_1$ is nonzero, and the coefficient at the second coordinate vector in $p_2$ is $\( 1 - M_1 \) \/ 4 = 7 \/ 32 > 0$; both persist in later steps.
  We have obtained the mean-square mass needed in (13). It remains to distribute its Fourier coefficients so that the total width and the coefficient-to-width ratios in (14) are both controlled.
  ===== 4.2 Choosing the quadratic curvatures. <choosing-the-quadratic-curvatures.>
  Choose $gamma in bb(R)^d$ outside the finite union of hyperplanes $s^perp$, $s in cal(S)$, and define $rho_s = \| s dot.op gamma \| > 0$. We will choose vectors $b_1 \, dots.h \, b_D in bb(R)^d$ so that the products
  $ Delta_s = product_(j = 1)^D \| s dot.op b_j \| $
  are approximately a common multiple of $\| c_s \|^2 \/ rho_s$. These products will determine both the number and the sizes of the spread coefficients.
  For each $j$, choose $b_j^0 in s_j^perp$ which is not orthogonal to any $s_l$ with $l eq.not j$. This is possible because each such orthogonality condition cuts out a proper subspace of $s_j^perp$, and a finite union of proper subspaces cannot cover that space. Choose $b_j^1$ satisfying
  $ s_j dot.op b_j^1 = frac(\| c_(s_j) \|^2, rho_(s_j) product_(l eq.not j) \| s_j dot.op b_l^0 \|) > 0 \, $
  and set $b_j = b_j^0 + tau b_j^1$ for a positive parameter $tau$. Every denominator is nonzero by the choices just made. For $s = s_j$,
  $ Delta_(s_j) / tau = \( s_j dot.op b_j^1 \) product_(l eq.not j) \| s_j dot.op b_l^0 + tau s_j dot.op b_l^1 \| arrow.r frac(\| c_(s_j) \|^2, rho_(s_j)) #h(2em) \( tau arrow.b 0 \) . $
  The same limit holds for $- s_j$. Fix a sufficiently small $tau > 0$ so that, simultaneously for all $s in cal(S)$,
  #[#set math.equation(numbering: n => "(19)")
   $ \( 1 - delta \) frac(tau \| c_s \|^2, rho_s) lt.eq Delta_s lt.eq \( 1 + delta \) frac(tau \| c_s \|^2, rho_s) . $ <eq:determinant-tuning>]
  In particular, every curvature $beta_(s \, j) := s dot.op b_j$ is nonzero. All these curvatures are fixed from now on; no lower bound uniform in $delta$ is needed.
  ===== 4.3 Spreading the coefficients. <spreading-the-coefficients.>
  Choose $g in C_c^oo \( \( - 1 \/ 2 \, 1 \/ 2 \) \)$ with $0 lt.eq g lt.eq 1$ and
  $ (integral_(bb(R)) g \( x \)^2 thin d x)^D gt.eq 1 - delta . $
  For a large positive real parameter $B$, and $z in \[ - 1 \/ 2 \, 1 \/ 2 \]^D$, define
  #[#set math.equation(numbering: n => "(20)")
   $ G \( y \, z \) = (product_(j = 1)^D g \( z_j \)) p_d (y + B / 2 sum_(j = 1)^D b_j z_j^2) \, #h(2em) y in bb(T)^d . $ <eq:spread-function>]
  The cutoff makes this function vanish near every boundary face in $z$, so it extends to a smooth real function on $bb(T)^(d + D)$. Translation invariance in $y$ gives
  #[#set math.equation(numbering: n => "(21)")
   $ ∥G∥_oo lt.eq 1 \, #h(2em) ∥G∥_2^2 = M_d (integral g^2)^D gt.eq \( 1 - delta \)^2 . $ <eq:spread-norms>]
  Fourier integration first in $y$ shows that the only possible frequencies are $\( s \, u \)$ with $s in cal(S)$ and $u in bb(Z)^D$, and
  #[#set math.equation(numbering: n => "(22)")
   $ hat(G) \( s \, u \) = c_s product_(j = 1)^D I_(s \, j) \( u_j \) \, #h(2em) I_(s \, j) \( w \) = integral_(bb(R)) g \( x \) upright(e) \( B beta_(s \, j) x^2 \/ 2 - w x \) thin d x . $ <eq:spread-coefficients>]
  Lemma 7 and $0 lt.eq g lt.eq 1$ imply
  $ \| I_(s \, j) \( w \) \| lt.eq frac(1 + O \( B^(- 1) \), sqrt(B \| beta_(s \, j) \|)) $
  uniformly for every real $w$. The constants may depend on the already fixed curvatures and cutoff. Since there are only finitely many pairs $\( s \, j \)$, for all sufficiently large $B$ we have
  #[#set math.equation(numbering: n => "(23)")
   $ \| hat(G) \( s \, u \) \| lt.eq \( 1 + delta \) frac(\| c_s \|, sqrt(B^D Delta_s)) #h(2em) \( s in cal(S) \, med u in bb(Z)^D \) . $ <eq:spread-coefficient-bound>]
  The stationary points for these integrals suggest keeping the boxes
  $ cal(U)_s = {u in bb(Z)^D : \| u_j \| lt.eq frac(B \| beta_(s \, j) \|, 2) upright(" for every ") j} . $
  Their cardinalities satisfy
  #[#set math.equation(numbering: n => "(24)")
   $ \| cal(U)_s \| & = product_(j = 1)^D (2 ⌊frac(B \| beta_(s \, j) \|, 2)⌋ + 1)\
 & lt.eq B^D Delta_s product_(j = 1)^D (1 + frac(1, B \| beta_(s \, j) \|)) lt.eq \( 1 + delta \) B^D Delta_s $ <eq:spread-box-count>]
  for all sufficiently large $B$. Thus the product $Delta_s$ controls the number of retained frequencies as well as their coefficient bound.
  ===== 4.4 A summable bound outside the boxes. <a-summable-bound-outside-the-boxes.>
  We need uniform approximation after truncation, so the additive error in Lemma 7 cannot simply be summed over the whole lattice. Instead, outside the boxes the phase has no stationary point near the amplitude support.
  Choose $alpha < 1 \/ 2$ with $"supp" g subset \[ - alpha \, alpha \]$. For a fixed $beta eq.not 0$, if $\| w \| > B \| beta \| \/ 2$, then
  #[#set math.equation(numbering: n => "(25)")
   $ \| B beta x - w \| gt.eq \| w \| - B \| beta \| alpha gt.eq c_(alpha \, beta) \( B + \| w \| \) #h(2em) \( x in "supp" g \) \, $ <eq:offbox-derivative>]
  with $c_(alpha \, beta) > 0$. Indeed, the middle expression is at least $\( 1 - 2 alpha \) \| w \|$, while $B < 2 \| w \| \/ \| beta \|$. Integrate by parts $l$ times using
  $ frac(1, 2 pi i \( B beta x - w \)) frac(d, d x) upright(e) \( B beta x^2 \/ 2 - w x \) = upright(e) \( B beta x^2 \/ 2 - w x \) . $
  There are no boundary terms. Each term after these integrations contains a bounded derivative of $g$ and a factor bounded by $C_l B^h \( B + \| w \| \)^(- l - h)$ for some $0 lt.eq h lt.eq l$. Hence
  #[#set math.equation(numbering: n => "(26)")
   $ lr(|integral_(bb(R)) g \( x \) upright(e) \( B beta x^2 \/ 2 - w x \) thin d x|) lt.eq C_l \( B + \| w \| \)^(- l) #h(2em) (\| w \| > frac(B \| beta \|, 2)) . $ <eq:offbox-bound>]
  For integer $w$ the sum of this bound outside the one-dimensional box is $O \( B^(1 - l) \)$ when $l > 1$. The full sum over integer $w$ is $O \( B \)$: inside there are $O \( B \)$ terms, each at most $∥g∥_(L^1 \( bb(R) \))$, and the outside sum is bounded by (26).
  The complement of $cal(U)_s$ is contained in the union of the $D$ coordinate complements. Consequently
  #[#set math.equation(numbering: n => "(27)")
   $ sum_(u in.not cal(U)_s) \| hat(G) \( s \, u \) \| & lt.eq \| c_s \| sum_(j = 1)^D (sum_(\| u_j \| > B \| beta_(s \, j) \| \/ 2) \| I_(s \, j) \( u_j \) \|) product_(h eq.not j) (sum_(u_h in bb(Z)) \| I_(s \, h) \( u_h \) \|)\
 & = O \( B^(D - l) \) . $ <eq:spread-tail>]
  Fix an integer $l > D$. Summing over the finite set $cal(S)$ shows that the total discarded coefficient mass tends to zero. The Fourier series is absolutely convergent, so this mass also bounds the uniform truncation error.
  ===== 4.5 Truncation and the final budgets. <truncation-and-the-final-budgets.>
  Fix one $B$ large enough for (23), (24), and a truncation error at most $delta$ in (27). Define
  $ T_B \( y \, z \) = sum_(s in cal(S)) sum_(u in cal(U)_s) hat(G) \( s \, u \) upright(e) \( s dot.op y + u dot.op z \) \, #h(2em) F = frac(T_B, 1 + delta) . $
  The boxes satisfy $cal(U)_(- s) = cal(U)_s = - cal(U)_s$. Since $G$ is real, the retained coefficients have conjugate symmetry, and $F$ is real. By (21) and the uniform error,
  $ ∥F∥_oo lt.eq 1 \, #h(2em) ∥F∥_2 gt.eq frac(1 - 2 delta, 1 + delta) gt.eq 1 - 3 delta . $
  Set $m = d + D$ and take the containing support
  $ cal(A) = { \( s \, u \) : s in cal(S) \, med u in cal(U)_s } . $
  Its vectors are nonzero. If two are parallel, projection onto the first $d$ coordinates forces the proportionality factor to be $1$ or $- 1$; the full vectors must then be equal or negatives. Thus one representative from each signed pair gives nonparallel vectors $a_1 \, dots.h \, a_r$. Every box contains zero, so $r gt.eq D gt.eq 2$. Some of the corresponding Fourier coefficients can vanish; the containing support and all estimates remain valid in that case.
  Finally choose
  $ v = (frac(gamma, tau B^D \( 1 + delta \)^3) \, 0) in bb(R)^(d + D) . $
  For $a = \( s \, u \) in cal(A)$,
  $ \| lambda_a \| = \| a dot.op v \| = frac(rho_s, tau B^D \( 1 + delta \)^3) > 0 . $
  Using (24) and (19), with both signs already included in $cal(S)$, gives
  $ sum_(a in cal(A)) \| lambda_a \| & = sum_(s in cal(S)) \| cal(U)_s \| frac(rho_s, tau B^D \( 1 + delta \)^3)\
 & lt.eq frac(1, tau \( 1 + delta \)^2) sum_(s in cal(S)) Delta_s rho_s lt.eq frac(1, 1 + delta) sum_(s in cal(S)) \| c_s \|^2 = frac(M_d, 1 + delta) < 1 . $
  The coefficient bound (23), divided by $1 + delta$, also gives
  $ frac(\| hat(F) \( a \) \|^2, \| lambda_a \|) lt.eq frac(\| c_s \|^2 tau \( 1 + delta \)^3, Delta_s rho_s) lt.eq frac(\( 1 + delta \)^3, 1 - delta) = K_delta^2 . $
  These are all the assertions of the proposition. ◻
]

The strict signed width bound means that $w_i = \| lambda_(a_i) \|$ satisfies $2 sum_i w_i < 1$, exactly the input required by Lemma 4. The polynomial $F$, its support, and its velocity $v$ are now fixed. In the next section they will be sampled along quadratic phases while only the length $N$ tends to infinity.

== 5 Sampling the auxiliary polynomial <sec:sampling>

We now prove Proposition 2. The auxiliary polynomial from Proposition 6 has nearly full mean-square mass, and each Fourier coefficient has a prescribed admissible width. We pack those widths, then sample the polynomial along quadratic paths on consecutive blocks. The packing allows only one stationary contribution at any angle; the distinct packed centers also preserve the mean-square mass when some curvatures coincide.

=== 5.1 A uniform estimate for quadratic sums <a-uniform-estimate-for-quadratic-sums>

Bombieri and Bourgain #cite(label("BombieriBourgain2009")) Section 7 use Poisson summation to evaluate smoothed quadratic phases in their unimodular construction. The next lemma isolates the uniformity needed here for the maximum over the whole circle. Its data are fixed while the integer $N$ tends to infinity.

#thm([Lemma 5.1.])[
  #emph[Let $chi in C_c^oo \( bb(R) \)$, let $x_(*) in bb(R)$ and $lambda in bb(R) \\ { 0 }$, and let $J subset bb(R)$ be compact. For $b in J$ and $ell in bb(Z)$, put 
$ x_(b \, ell) = x_(*) + frac(ell - b, lambda) \, #h(2em) omega_(b \, ell) = \( b - ell \) x_(*) - frac(\( b - ell \)^2, 2 lambda) . $

 As $N$ tends to infinity through positive integers, uniformly for $b in J$, 
#[#set math.equation(numbering: n => "(28)")
 $ & 1 / sqrt(N) sum_(k in bb(Z)) chi \( k \/ N \) upright(e) #h(-0.16667em) (b k + frac(N lambda, 2) \( k \/ N - x_(*) \)^2)\
 & #h(2em) = 1 / sqrt(\| lambda \|) sum_(ell in bb(Z)) chi \( x_(b \, ell) \) upright(e) #h(-0.16667em) (frac("sgn" lambda, 8) + N omega_(b \, ell)) + O \( N^(- 1) \) . $ <eq:sampling-poisson>]

 The sum on the right has only finitely many nonzero terms, lying in one fixed finite set of indices for all $b in J$. The error constant depends only on the fixed data $chi \, x_(*) \, lambda \, J$.]
] <lem:sampling-poisson>

#proof[
  For $b in J$ and $ell in bb(Z)$, define
  $ phi.alt_(b \, ell) \( x \) = lambda / 2 \( x - x_(*) \)^2 + \( b - ell \) x . $
  Poisson summation, with the change of variable $k \/ N$, gives
  #[#set math.equation(numbering: n => "(29)")
   $ & 1 / sqrt(N) sum_(k in bb(Z)) chi \( k \/ N \) upright(e) #h(-0.16667em) (b k + frac(N lambda, 2) \( k \/ N - x_(*) \)^2)\
 & #h(35mm)  = sqrt(N) sum_(ell in bb(Z)) integral_(bb(R)) chi \( x \) upright(e) #h(-0.16667em) (N phi.alt_(b \, ell) \( x \)) thin d x . $ <eq:sampling-poisson-identity>]
  Here the factor $N$ from Poisson summation combines with the original factor $N^(- 1 \/ 2)$ to give $sqrt(N)$.
  Choose a fixed integer $L$ so large that, for $\| ell \| > L$,
  $ \| phi.alt'_(b \, ell) \( x \) \| = \| lambda \( x - x_(*) \) + b - ell \| gt.eq \| ell \| \/ 2 $
  on $"supp" chi$, uniformly in $b in J$. Since the amplitude is compactly supported, two integrations by parts have no boundary terms and yield
  $ integral chi thin upright(e) \( N phi.alt_(b \, ell) \) = frac(1, \( 2 pi i N \)^2) integral {frac(chi'', \( phi.alt'_(b \, ell) \)^2) - frac(3 lambda chi', \( phi.alt'_(b \, ell) \)^3) + frac(3 lambda^2 chi, \( phi.alt'_(b \, ell) \)^4)} upright(e) \( N phi.alt_(b \, ell) \) . $
  These integrals are $O \( N^(- 2) \| ell \|^(- 2) \)$. Their total contribution to (29) is therefore $O \( N^(- 3 \/ 2) \)$, uniformly in $b$. This summable estimate handles the infinite tail before any stationary-phase errors are added.
  For the finitely many indices $\| ell \| lt.eq L$, expand the phase as
  $ N phi.alt_(b \, ell) \( x \) = frac(N lambda x^2, 2) - N \( ell - b + lambda x_(*) \) x + frac(N lambda x_(*)^2, 2) . $
  Apply Lemma 7 with $T = N$, curvature $lambda$, and $u = N \( ell - b + lambda x_(*) \)$. Its stationary point is $x_(b \, ell)$, and $phi.alt_(b \, ell) \( x_(b \, ell) \) = omega_(b \, ell)$. After multiplication by $sqrt(N)$, it gives the corresponding term in (28) with error $O \( N^(- 1) \)$, uniformly in $b$. Increasing $L$ if necessary ensures $chi \( x_(b \, ell) \) = 0$ whenever $\| ell \| > L$ and $b in J$. Summing the finitely many remaining errors proves the lemma. ◻
]

=== 5.2 Fixed blocks and separated stationary contributions <fixed-blocks-and-separated-stationary-contributions>

#proof[
  Fix $0 < delta < 1 \/ 20$. Proposition 6 supplies a real trigonometric polynomial on $bb(T)^m$,
  $ F \( y \) = sum_(a in cal(A)) c_a upright(e) \( a dot.op y \) \, #h(2em) c_a = hat(F) \( a \) \, #h(2em) cal(A) = { plus.minus a_i : 1 lt.eq i lt.eq r } \, $
  and a vector $v in bb(R)^m$. The representatives $a_i$ are nonzero and pairwise nonparallel. Write $lambda_a = a dot.op v$. The properties needed here are
  #[#set math.equation(numbering: n => "(30)")
   $ ∥F∥_oo lt.eq 1 \, #h(2em) ∥F∥_2 gt.eq 1 - 3 delta \, #h(2em) lambda_a eq.not 0 \, #h(2em) sum_(a in cal(A)) \| lambda_a \| < 1 \,\
frac(\| c_a \|, sqrt(\| lambda_a \|)) lt.eq K_delta quad \( a in cal(A) \) . $ <eq:sampling-auxiliary-budgets>]
  The set $cal(A)$ is a containing Fourier support; coefficients equal to zero are allowed.
  Apply Lemma 4 with $w_i = \| lambda_(a_i) \|$. Its strict width hypothesis holds because $2 sum_i w_i = sum_(a in cal(A)) \| lambda_a \| < 1$. We obtain an integer $H gt.eq 1$ and points $theta_h in bb(T)^m$ such that all the closed intervals
  #[#set math.equation(numbering: n => "(31)")
   $ I_(a \, h) = a dot.op theta_h + [- frac(\| lambda_a \|, 2 H) \, frac(\| lambda_a \|, 2 H)] med \( mod med 1 \) \, #h(2em) a in cal(A) \, quad 1 lt.eq h lt.eq H \, $ <eq:sampling-packed-intervals>]
  are pairwise disjoint. Each has length less than one.
  Put $x_h^(*) = \( h - 1 \/ 2 \) \/ H$. Choose smooth cutoffs
  $ chi_h in C_c^oo #h(-0.16667em) (\( h - 1 \) \/ H \, h \/ H) \, #h(2em) 0 lt.eq chi_h lt.eq 1 \, #h(2em) sum_(h = 1)^H integral_(bb(R)) chi_h \( x \)^2 thin d x gt.eq 1 - delta . $
  Such cutoffs can be chosen to equal one except in sufficiently small neighborhoods of the block endpoints. All data chosen so far, including the cutoffs, are now fixed independently of $N$.
  For every integer $N gt.eq 1$ and $0 lt.eq k < N$, define
  #[#set math.equation(numbering: n => "(32)")
   $ X_(N \, k) = sum_(h = 1)^H chi_h \( k \/ N \) F #h(-0.16667em) (k theta_h + N / 2 v \( k \/ N - x_h^(*) \)^2) . $ <eq:sampling-coefficients>]
  The expression does not depend on the choice of real lifts of $theta_h$. It is real, and at most one summand is nonzero, so $\| X_(N \, k) \| lt.eq 1$. As every cutoff is supported strictly inside $\( 0 \, 1 \)$, extending the sum over $k$ to all integers introduces no additional nonzero terms.
  ===== 5.2.1 The maximum on the whole circle. <the-maximum-on-the-whole-circle.>
  Expand $F$ in (32) and apply Lemma 8 with
  $ b = t + a dot.op theta_h \, #h(2em) lambda = lambda_a \, #h(2em) x_(*) = x_h^(*) \, #h(2em) chi = chi_h . $
  For fixed real lifts of the finitely many $theta_h$, all such $b$ lie in one compact interval as $t$ ranges over $\[ 0 \, 1 \]$. Thus every error is uniform in $t$. The leading term indexed by $\( a \, h \, ell \)$ contains
  #[#set math.equation(numbering: n => "(33)")
   $ chi_h #h(-0.16667em) (x_h^(*) + frac(ell - t - a dot.op theta_h, lambda_a)) . $ <eq:sampling-stationary-point>]
  For this factor to be nonzero, its argument must lie in the interior of the $h$th block. Hence
  $ \| ell - t - a dot.op theta_h \| < frac(\| lambda_a \|, 2 H) \, $
  which says that $- t med \( mod med 1 \)$ lies in $I_(a \, h)$, as illustrated in Figure 1.
  Disjointness of all intervals in (31) allows at most one pair $\( a \, h \)$. For that pair, their length being less than one allows at most one integer $ell$. The cutoffs vanish near block endpoints, so this argument also covers angles at the ends of the packed intervals.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -0.12), (0, 0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.05639), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((10, -0.12), (10, 0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10, -0.05639), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  rect((1, -0.1), (2.2, 0.1), fill: rgb("#d1d1ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((7.8, -0.1), (9, 0.1), fill: rgb("#d1d1ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((2.9, -0.1), (3.9, 0.1), fill: rgb("#d1e8d1"), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  rect((6.1, -0.1), (7.1, 0.1), fill: rgb("#d1e8d1"), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  rect((4.5, -0.1), (4.9, 0.1), fill: rgb("#ffdfbf"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  rect((5.1, -0.1), (5.5, 0.1), fill: rgb("#ffdfbf"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  content((1.6, 0.42), [#text(size: 9pt)[$a_1 dot.op theta_h$]])
  content((3.4, 0.42), [#text(size: 9pt)[$a_2 dot.op theta_h$]])
  content((4.7, -0.47), [#text(size: 9pt)[$a_3 dot.op theta_h$]])
  content((5.3, 0.42), [#text(size: 9pt)[$-a_3 dot.op theta_h$]])
  content((6.6, -0.47), [#text(size: 9pt)[$-a_2 dot.op theta_h$]])
  content((8.4, 0.42), [#text(size: 9pt)[$-a_1 dot.op theta_h$]])
  line((3.15, -1.02), (3.15, -0.16), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((3.15, -0.59), [#text(size: 9pt)[$-t$]], anchor: "north", padding: 0.1176cm)
  line((1, -0.65), (2.2, -0.65), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((1.6, -0.65), [#text(size: 9pt)[$| lambda_(a_1)|"/"H$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Schematic signed intervals for one block, drawn in a representative of $bb(T)$. Paired intervals have the same width and opposite centers. The construction packs the intervals for every block together. Only an interval containing $- t$ can give a nonzero stationary contribution at angle $t$; the diagram illustrates this condition, not a particular packing produced by the lemma. ],
  ) <fig:sampling-intervals>
  By (30), the modulus of the sole possible leading contribution, including its Fourier coefficient, is at most $K_delta$. Summing the errors over the fixed finite set of pairs $\( a \, h \)$ therefore gives
  #[#set math.equation(numbering: n => "(34)")
   $ 1 / sqrt(N) max_(t in bb(T)) lr(|sum_(k = 0)^(N - 1) X_(N \, k) upright(e) \( k t \)|) lt.eq K_delta + o \( 1 \) . $ <eq:sampling-uniform-maximum>]
  The error tends to zero uniformly in $t$, with all construction data held fixed. We have obtained the desired maximum bound; it remains to show that sampling retains the mean-square mass of $F$.
  ===== 5.2.2 The mean-square mass. <the-mean-square-mass.>
  The block supports are disjoint, so products from different blocks vanish. Within block $h$, a pair $a \, a' in cal(A)$ contributes the coefficient $c_a overline(c_(a'))$ times
  #[#set math.equation(numbering: n => "(35)")
   $ 1 / N sum_(k in bb(Z)) chi_h \( k \/ N \)^2 upright(e) #h(-0.16667em) (k beta + frac(N kappa, 2) \( k \/ N - x_h^(*) \)^2) \, quad beta = \( a - a' \) dot.op theta_h \, quad kappa = lambda_a - lambda_(a') . $ <eq:sampling-energy-term>]
  If $a = a'$, this is a Riemann sum with limit $integral chi_h^2$. If $kappa eq.not 0$, Lemma 8, now with amplitude $chi_h^2$, shows that the sum with normalization $N^(- 1 \/ 2)$ is bounded. The additional factor $N^(- 1 \/ 2)$ in (35) therefore makes this contribution tend to zero.
  The remaining case is $a eq.not a'$ and $kappa = 0$. It cannot be omitted: the coefficient-spreading construction deliberately produces repeated curvatures. The centers of $I_(a \, h)$ and $I_(a' \, h)$ are distinct modulo one, so $beta in.not bb(Z)$. Geometric summation gives
  $ lr(|sum_(k = u)^w upright(e) \( k beta \)|) lt.eq frac(2, \| 1 - upright(e) \( beta \) \|) #h(2em) \( u \, w in bb(Z) \, med u lt.eq w \) . $
  Writing $psi = chi_h^2$, summation by parts consequently bounds $sum_k psi \( k \/ N \) upright(e) \( k beta \)$ by a fixed constant times $∥psi∥_oo + integral \| psi' \|$. Indeed the discrete variation is at most $integral \| psi' \|$. Division by $N$ again makes (35) tend to zero.
  There are only finitely many pairs, so we may sum these limits. Parseval on the auxiliary torus gives
  #[#set math.equation(numbering: n => "(36)")
   $ lim_(N arrow.r oo) 1 / N sum_(k = 0)^(N - 1) X_(N \, k)^2 & = (sum_(h = 1)^H integral chi_h^2) sum_(a in cal(A)) \| c_a \|^2\
 & = (sum_(h = 1)^H integral chi_h^2) ∥F∥_2^2\
 & gt.eq \( 1 - delta \) \( 1 - 3 delta \)^2 = 1 - 7 delta + 15 delta^2 - 9 delta^3 gt.eq 1 - 7 delta . $ <eq:sampling-energy-limit>]
  Together with (34), this proves Proposition 2. Every integer $N$ was allowed throughout. In particular, neither the packing prime nor the number of blocks imposes a divisibility condition on $N$. ◻
]

== 6 Rounding with a small defect mass <sec:rounding>

We now prove Lemma 3. Its input is a real coefficient vector whose entries have absolute values close to one in total. We round this vector to signs while controlling its Fourier sum. The small total defect limits the number of coordinates that need attention at each scale. Spencer’s discrepancy method gives the required square-root cancellation #cite(label("Spencer1985")). Balister, Bollobás, Morris, Sahasrabudhe and Tiba #cite(label("BalisterEtAl2020")) Sections 4–5 apply partial coloring to round bounded Fourier coefficients to signs in their real Littlewood construction. Here we track the total defect to make the rounding loss small relative to $sqrt(N)$. To specify the real-matrix input precisely, we derive it from the arbitrary-vector partial-coloring theorem of Lovett and Meka #cite(label("LovettMeka2015")) Theorem 4 in the cited preprint version.

=== 6.1 A discrepancy bound for real matrices <a-discrepancy-bound-for-real-matrices>

#thm([Lemma 6.1.])[
  #emph[There is an absolute constant $C_0$ such that, for integers $1 lt.eq s lt.eq R$ and a real matrix $B in \[ - 1 \, 1 \]^(R times s)$, there is a vector $xi in { - 1 \, 1 }^s$ satisfying 
$ ∥B xi∥_oo lt.eq C_0 sqrt(s log \( 2 R \/ s \)) . $

]
] <lem:rounding-matrix>

#proof[
  We first state the partial-coloring input in its vector form. Given $v_1 \, dots.h \, v_R in bb(R)^u$, a starting point $x_0 in \[ - 1 \, 1 \]^u$, and nonnegative numbers $c_1 \, dots.h \, c_R$ such that
  $ sum_(i = 1)^R exp \( - c_i^2 \/ 16 \) lt.eq u \/ 16 \, $
  the theorem of Lovett and Meka gives, for every sufficiently small $eta > 0$, a point $x in \[ - 1 \, 1 \]^u$ with
  $ \| chevron.l v_i \, x - x_0 chevron.r \| lt.eq c_i ∥v_i∥_2 quad \( 1 lt.eq i lt.eq R \) \, #h(2em) \| x_k \| gt.eq 1 - eta quad upright("for at least ") u \/ 2 upright(" coordinates ") k . $
  Letting $eta$ tend to zero and taking a convergent subsequence gives a point with at least $ceil.l u \/ 2 ceil.r$ coordinates equal to signs and the same discrepancy bounds. Indeed, there are only finitely many choices of these coordinates, and all the displayed inequalities are closed under limits.
  Start at zero in $\[ - 1 \, 1 \]^s$. At a stage with $u$ coordinates not yet equal to signs, restrict the rows of $B$ to those coordinates, take their current values as $x_0$, and choose
  $ c_i = 4 sqrt(log \( 16 R \/ u \)) #h(2em) \( 1 lt.eq i lt.eq R \) . $
  The threshold sum is exactly $u \/ 16$, and every restricted row has Euclidean norm at most $sqrt(u)$. Thus this step changes each row sum by at most $4 sqrt(u log \( 16 R \/ u \))$ and fixes at least half the remaining coordinates. Leave the fixed coordinates unchanged and repeat. Zero rows impose no restriction. The process terminates with a sign vector.
  If $u_h$ is the number of remaining coordinates before step $h$, starting with $h = 0$, then $u_h lt.eq 2^(- h) s$. The function $u log \( 16 R \/ u \)$ is increasing for $0 < u lt.eq R$. With $L = log \( 16 R \/ s \) gt.eq log 16$, the sum of the row errors is therefore at most
  $ 4 sum_h sqrt(u_h log \( 16 R \/ u_h \)) & lt.eq 4 sqrt(s L) sum_(h = 0)^oo 2^(- h \/ 2) sqrt(1 + frac(h log 2, L))\
 & lt.eq 4 sqrt(s L) sum_(h = 0)^oo 2^(- h \/ 2) sqrt(1 + h \/ 4) . $
  The last series converges, and $log \( 16 R \/ s \) lt.eq 4 log \( 2 R \/ s \)$ for $s lt.eq R$. This proves the lemma with an absolute constant, including when $s = R$. ◻
]

=== 6.2 Dyadic rounding and the Fourier error <dyadic-rounding-and-the-fourier-error>

The discrepancy estimate will be applied to real and imaginary Fourier evaluations on a grid. At each dyadic scale we can reverse all the chosen signs without changing their discrepancy. This permits rounding without increasing the total defect mass, which is the source of the improved error bound.

#proof[
  Let $X = \( X_0 \, dots.h \, X_(N - 1) \) in \[ - 1 \, 1 \]^N$ and $mu = 1 / 2 sum_k \( 1 - \| X_k \| \)$. If $mu = 0$, every $X_k$ is already a sign, and we take $epsilon_k = X_k$. Suppose henceforth that $0 < mu lt.eq N \/ 2$. Set
  $ sigma_k = cases(delim: "{", 1 \, & X_k gt.eq 0 \,, - 1 \, & X_k < 0 \,) #h(2em) p_k = frac(1 - \| X_k \|, 2) . $
  Then $X_k = sigma_k \( 1 - 2 p_k \)$, $0 lt.eq p_k lt.eq 1 \/ 2$, and $sum_k p_k = mu$. In particular, this definition includes $X_k = 0$.
  Put $M = 20 N$ and $R = 2 M = 40 N$. For the grid points $t_ell = ell \/ M$, $0 lt.eq ell < M$, define the real $R times N$ matrix $A$ by
  $ A_(2 ell \, k) = sigma_k cos \( 2 pi k t_ell \) \, #h(2em) A_(2 ell + 1 \, k) = sigma_k sin \( 2 pi k t_ell \) quad \( 0 lt.eq k < N \) . $
  Its entries belong to $\[ - 1 \, 1 \]$, and every selection of its columns has at most $N lt.eq R$ columns.
  Choose an integer $J gt.eq 1$ with $N 2^(- J) lt.eq 1$, and first round down:
  $ p_k^(\( J \)) = 2^(- J) floor.l 2^J p_k floor.r . $
  This does not increase the mass, and
  #[#set math.equation(numbering: n => "(37)")
   $ ∥A \( p^(\( J \)) - p \)∥_oo lt.eq sum_k \| p_k^(\( J \)) - p_k \| lt.eq N 2^(- J) lt.eq 1 . $ <eq:rounding-initial>]
  We next construct $p^(\( j - 1 \))$ from $p^(\( j \))$, for $j = J \, J - 1 \, dots.h \, 1$, preserving the two properties
  $ p^(\( j \)) in \( \[ 0 \, 1 \] ∩ 2^(- j) bb(Z) \)^N \, #h(2em) sum_k p_k^(\( j \)) lt.eq mu . $
  Let $S_j$ be the set of coordinates for which $2^j p_k^(\( j \))$ is odd, and let $s_j = \| S_j \|$. If $s_j = 0$, no change is needed. Otherwise apply Lemma 9 to the columns indexed by $S_j$, obtaining signs $xi_k$. Replace all these signs by their negatives if necessary so that $sum_(k in S_j) xi_k lt.eq 0$, and define
  $ p_k^(\( j - 1 \)) = cases(delim: "{", p_k^(\( j \)) + 2^(- j) xi_k \, & k in S_j \,, p_k^(\( j \)) \, & k in.not S_j .) $
  An odd integer in $\[ 0 \, 2^j \]$ lies between $1$ and $2^j - 1$; adding either sign therefore gives an even integer still in $\[ 0 \, 2^j \]$. Thus the new vector belongs to $\( \[ 0 \, 1 \] ∩ 2^(- \( j - 1 \)) bb(Z) \)^N$. Its mass does not increase, and the simultaneous sign reversal has left the discrepancy unchanged. The step error is consequently at most
  #[#set math.equation(numbering: n => "(38)")
   $ ∥A \( p^(\( j - 1 \)) - p^(\( j \)) \)∥_oo lt.eq C_0 thin 2^(- j) sqrt(s_j log \( 80 N \/ s_j \)) #h(2em) \( s_j > 0 \) . $ <eq:rounding-step>]
  Every coordinate in $S_j$ is at least $2^(- j)$, so the mass bound gives
  $ s_j lt.eq min \( N \, 2^j mu \) . $
  This is where the total defect enters the estimate. Put $U_j = 2^j mu$ and $L_mu = log \( 80 N \/ mu \)$. The function $f \( s \) = s log \( 80 N \/ s \)$ is increasing on $\( 0 \, N \]$. If $U_j lt.eq N$, then
  $ f \( s_j \) lt.eq f \( U_j \) = U_j log \( 80 N \/ U_j \) lt.eq U_j L_mu . $
  If $U_j > N$, then, using $mu lt.eq N \/ 2$,
  $ f \( s_j \) lt.eq N log 80 lt.eq U_j L_mu . $
  These estimates apply at every nonempty stage. Summing (38) and (37) therefore gives, for $p' = p^(\( 0 \)) in { 0 \, 1 }^N$,
  #[#set math.equation(numbering: n => "(39)")
   $ ∥A \( p' - p \)∥_oo & lt.eq 1 + C_0 sqrt(mu L_mu) sum_(j = 1)^oo 2^(- j \/ 2)\
 & = 1 + frac(C_0, sqrt(2) - 1) sqrt(mu log \( 80 N \/ mu \)) . $ <eq:rounding-matrix-error>]
  Empty stages contribute zero, without invoking the discrepancy bound with no columns.
  Now set $epsilon_k = sigma_k \( 1 - 2 p'_k \) in { - 1 \, 1 }$ and define the error polynomial
  $ Q \( z \) = sum_(k = 0)^(N - 1) \( epsilon_k - X_k \) z^k = - 2 sum_(k = 0)^(N - 1) sigma_k \( p'_k - p_k \) z^k . $
  At a grid point, the real and imaginary parts of $- Q \/ 2$ are entries of $A \( p' - p \)$. Hence
  #[#set math.equation(numbering: n => "(40)")
   $ G := max_(0 lt.eq ell < M) \| Q \( upright(e) \( t_ell \) \) \| lt.eq 2 sqrt(2) thin ∥A \( p' - p \)∥_oo . $ <eq:rounding-grid>]
  It remains to pass from this grid bound to the whole circle. We apply this step only to $Q$, the rounding error.
  Write $S = max_(\| z \| = 1) \| Q \( z \) \|$. If $Q = 0$, there is nothing to prove. Otherwise let $d lt.eq N - 1$ be its degree. Applying the maximum principle to $Q$ on the unit disk and to the reversed polynomial $z^d Q \( 1 \/ z \)$ gives
  $ \| Q \( z \) \| lt.eq S max \( 1 \, \| z \|^d \) \, #h(2em) max_(\| z \| lt.eq 1 + 1 \/ N) \| Q \( z \) \| lt.eq exp \( 1 \) S . $
  Cauchy’s estimate on the disk of radius $1 \/ N$ centered at a point of the unit circle yields $\| Q' \( z \) \| lt.eq exp \( 1 \) N S$ there. Consequently
  $ lr(|frac(d, d t) Q \( upright(e) \( t \) \)|) lt.eq 2 pi exp \( 1 \) N S . $
  Every point of $bb(T)$ has circular distance at most $1 \/ \( 2 M \)$ from the grid. Integrating this derivative along the shorter arc gives
  $ S lt.eq G + frac(pi exp \( 1 \), 20) S \, #h(2em) S lt.eq frac(G, 1 - pi exp \( 1 \) \/ 20) . $
  The denominator is positive. Combining this inequality with (40) and (39) proves Lemma 3, with an absolute constant. The same argument covers $N = 1$, when the error polynomial is constant. ◻
]

== 7 Flatness for every finite exponent <sec:finite-flatness>

The maximum estimate and Parseval imply that normalized moduli converge to one in $L^p$ for every fixed $0 < p < oo$. The same fourth-moment calculation will give the merit-factor consequence in the next section.

#thm([Corollary 7.1.])[
  #emph[There are Littlewood polynomials $P_N$ of every length $N$ such that, for each fixed $0 < p < oo$, 
$ integral_(bb(T)) lr(|frac(\| P_N \( upright(e) \( t \) \) \|, sqrt(N)) - 1|)^p thin d t arrow.r 0 . $

]
] <cor:finite-flatness>

#proof[
  Choose a minimizing polynomial at each length; the finite set of sign vectors ensures that the minimum is attained. Put $f_N \( t \) = \| P_N \( upright(e) \( t \) \) \| \/ sqrt(N)$. Parseval and Theorem 1 give $integral f_N^2 = 1$ and $∥f_N∥_oo = 1 + o \( 1 \)$. Hence
  $ 1 lt.eq integral f_N^4 lt.eq ∥f_N∥_oo^2 integral f_N^2 = 1 + o \( 1 \) \, #h(2em) integral \( f_N^2 - 1 \)^2 arrow.r 0 . $
  For $u gt.eq 0$, $\| u - 1 \|^4 lt.eq \| u^2 - 1 \|^2$, so $integral \| f_N - 1 \|^4 arrow.r 0$. For $p lt.eq 4$, the probability-space integral inequality gives the assertion. For $p > 4$, use the eventual uniform bound on $\| f_N - 1 \|$ and the same fourth-moment convergence. ◻
]

== 8 Binary merit factors and Morse shifts <sec:merit-morse>

We now derive the autocorrelation and symbolic-dynamical consequences of the maximum estimate. For a binary word $A = \( a_0 \, dots.h \, a_(N - 1) \) in { - 1 \, 1 }^N$, recall

$ P_A \( z \) = sum_(j = 0)^(N - 1) a_j z^j \, #h(2em) C_u \( A \) = sum_(j = 0)^(N - 1 - u) a_j a_(j + u) quad \( 1 lt.eq u < N \) . $

For $N gt.eq 2$, its merit factor is $F \( A \) = N^2 \/ \( 2 sum_(u = 1)^(N - 1) C_u \( A \)^2 \)$. The denominator is positive, since $C_(N - 1) \( A \) = a_0 a_(N - 1) in { - 1 \, 1 }$. Expanding $\| P_A \|^2$ on the unit circle and applying Parseval with probability Haar measure gives

#[#set math.equation(numbering: n => "(41)")
 $ ∥P_A∥_4^4 = N^2 + 2 sum_(u = 1)^(N - 1) C_u \( A \)^2 \, #h(2em) F \( A \) = frac(N^2, ∥P_A∥_4^4 - N^2) . $ <eq:merit-parseval>]

In the notation of Downarowicz–Lacroix, $M_A = N^(- 2) sum_(u = 1)^(N - 1) C_u \( A \)^2$ and $F \( A \) = 1 \/ \( 2 M_A \)$ #cite(label("DownarowiczLacroix1998")) Definition 2 and Lemma 0.

#thm([Corollary 8.1.])[
  (All-length unbounded binary merit factors).  #emph[For $N gt.eq 2$, let 
$ cal(F)_N = max_(A in { - 1 \, 1 }^N) F \( A \) . $

 Then 
$ lim_(N arrow.r oo) cal(F)_N = + oo \, $

 where the limit runs through all integer lengths. Equivalently, one can choose a word $A_N in { - 1 \, 1 }^N$ for each $N gt.eq 2$ such that 
$ sum_(u = 1)^(N - 1) C_u \( A_N \)^2 = o \( N^2 \) . $

]
] <cor:merit>

#proof[
  Choose $A_N$ so that $P_(A_N)$ attains the minimum defining $m_N$. By (41), Parseval, and the elementary fourth-moment bound,
  $ 0 < frac(1, F \( A_N \)) = ∥P_(A_N)∥_4^4 / N^2 - 1 lt.eq frac(∥P_(A_N)∥_oo^2 ∥P_(A_N)∥_2^2, N^2) - 1 = m_N^2 - 1 arrow.r 0 . $
  The last limit is Theorem 1. Thus $F \( A_N \) arrow.r oo$ and $cal(F)_N gt.eq F \( A_N \)$ has the same conclusion. The equivalence with the autocorrelation formulation follows directly from the definition of $F \( A \)$. ◻
]

This corollary refutes the bounded-merit-factor conjecture while retaining the all-length quantifier of Theorem 1. It supplies no quantitative rate of divergence.

For completeness, we specify the symbolic class in the next consequence. For binary words $B$ and $C$ of lengths $b$ and $c$, respectively, their product is defined by

$ \( B times C \) \( s + b t \) = B \( s \) C \( t \) #h(2em) \( 0 lt.eq s < b \, med 0 lt.eq t < c \) . $

If each $B_j$ begins with $1$ and has length at least two, the products $B_1 times dots.h.c times B_j$ have a one-sided coordinatewise limit. This limit admits a two-sided extension with the same finite words #cite(label("DownarowiczLacroix1998")) Definition 3 and the following paragraph. The orbit closure $X subset { - 1 \, 1 }^(bb(Z))$ of such an extension, under $S x \( n \) = x \( n + 1 \)$, is a #emph[binary Morse shift]. This is the discrete-time system called a Morse flow in that paper. Simple spectrum means that the Koopman operator has a cyclic vector: the linear span of its integer iterates is dense in the underlying $L^2$ space.

#thm([Corollary 8.2.])[
  (Binary Morse spectral consequence).  #emph[There is a binary Morse shift $\( X \, S \)$ with a unique $S$-invariant Borel probability measure $mu$ for which the Koopman operator $U_S g = g compose S$ on $L^2 \( X \, mu \)$ has simple spectrum. For the zero-coordinate function $f \( x \) = x \( 0 \)$, let $sigma_f$ be the spectral measure characterized by 
$ hat(sigma_f) \( n \) := integral_(bb(T)) upright(e) \( n t \) thin d sigma_f \( t \) = integral_X f \( x \) f \( S^n x \) thin d mu \( x \) #h(2em) \( n in bb(Z) \) . $

 Then $d sigma_f = h thin d t$ for some $h in L^2 \( bb(T) \)$ with $h gt.eq 0$ almost everywhere and $integral_(bb(T)) h thin d t = 1$. In particular, the absolutely continuous spectral component is nonzero.]
] <cor:morse>

#proof[
  Corollary 11 supplies nontrivial finite binary words with arbitrarily large merit factors. The forward construction in #cite(label("DownarowiczLacroix1998")) Theorem 2 and its proof therefore gives a binary Morse shift with $sum_(n = 1)^oo \| hat(sigma_f) \( n \) \|^2 < oo$. Its defining words have frequencies of both signs tending to $1 \/ 2$; their Fact 1 gives unique ergodicity, and their Fact 2 gives simple spectrum for that invariant measure. Conjugate symmetry extends the square summability to $bb(Z)$. Fourier Plancherel and uniqueness of Fourier coefficients then give $sigma_f = h thin d t$ with $h in L^2 \( bb(T) \)$. Positivity of $sigma_f$ gives $h gt.eq 0$ almost everywhere, and $integral h thin d t = sigma_f \( bb(T) \) = ∥f∥_2^2 = 1$. ◻
]

Here simplicity concerns the full Koopman operator, whereas absolute continuity is asserted for the cyclic subspace generated by $f$; the remaining spectral type is not identified. A different realization is given in the companion manuscript #cite(label("OpenAIThreeTorus2026")) Theorem 1.1: it constructs a smooth volume-preserving diffeomorphism of $bb(T)^3$ whose Koopman operator has simple Lebesgue spectrum on the entire mean-zero $L^2$ space. The present consequence instead concerns the constrained class of binary Morse shifts.

== 9 Comparison with contrary flatness claims <sec:concentration>

Corollary 10 conflicts with several stated nonflatness results. We compare the precise versions listed in the bibliography and examine the proposed obstructions. This discussion is independent of the construction proving Theorem 1.

An earlier preprint of el Abdalaoui asserted nonexistence of square-$L^2$-flat real Littlewood sequences #cite(label("ElAbdalaoui2017")) Theorem 3.3. Its definition fixes both endpoint signs to $+ 1$ #cite(label("ElAbdalaoui2017")) Equation (2.1). Changing at most two endpoint signs of our length-$N$ polynomials costs at most $4 \/ sqrt(N)$ in normalized uniform norm. Their normalized maxima still tend to one, so the proof of Corollary 10 gives square-$L^2$ flatness with this convention as well.

=== 9.1 The concentration constant and a neighborhood of zero <the-concentration-constant-and-a-neighborhood-of-zero>

Theorem 1 of #cite(label("ElAbdalaoui2025")) claims that $L^2$-normalized real-sign polynomial sequences cannot be $L^(2 p)$-flat for integers $p > 1$. This conflicts with Corollary 10, even though our maximum estimate supplies no uniform lower bound. The final inference in the cited proof uses a concentration constant with a different quantifier order from the one needed there.

To see the distinction, let $cal(I)$ be the nonzero analytic idempotent trigonometric polynomials

$ I \( t \) = sum_(k in E_0) upright(e) \( k t \) \, #h(2em) diameter eq.not E_0 subset bb(Z)_(gt.eq 0) upright(" finite") . $

For $alpha > 0$ and a measurable set $E subset bb(T)$, define

$ B_alpha \( E \) = sup_(I in cal(I)) frac(integral_E \| I \( t \) \|^alpha thin d t, integral_(bb(T)) \| I \( t \) \|^alpha thin d t) . $

The concentration level of Bonami–Révész is #cite(label("BonamiRevesz2008")) Definitions 1–2

#[#set math.equation(numbering: n => "(42)")
 $ c_alpha = inf_(E upright(" symmetric, open")\
E eq.not diameter) B_alpha \( E \) . $ <eq:concentration-infimum>]

Indeed every number strictly smaller than the infimum is a concentration guarantee for each such $E$, and every uniform guarantee is no larger than the infimum. Thus an upper bound on $c_alpha$ does not give that upper bound on $B_alpha \( E \)$ for a prescribed $E$.

For completeness, the particular sets used in the contrary inference have optimal concentration equal to one. Suppose $E$ contains the neighborhood $\( - d \, d \)$ of zero, where $0 < d < 1 \/ 2$, and put $D_q \( t \) = sum_(k = 0)^(q - 1) upright(e) \( k t \)$. The geometric-series formula gives

$ \| D_q \( t \) \| lt.eq frac(1, sin \( pi d \)) quad \( t in.not E \) . $

For $\| t \| lt.eq 1 \/ \( 2 q \)$, the same formula and $sin x gt.eq 2 x \/ pi$ on $\[ 0 \, pi \/ 2 \]$ give $\| D_q \( t \) \| gt.eq 2 q \/ pi$. Consequently, for $alpha > 1$,

$ integral_(bb(T) \\ E) \| D_q \|^alpha & lt.eq sin \( pi d \)^(- alpha) \,\
integral_(bb(T)) \| D_q \|^alpha & gt.eq \( 2 \/ pi \)^alpha q^(alpha - 1) . $

Their ratio tends to zero, proving $B_alpha \( E \) = 1$. Bonami–Révész also explicitly distinguish full concentration at zero from the uniform concentration level #cite(label("BonamiRevesz2008")) Theorem 7 and Proposition 9.

Under its assumed flatness, Equation (27) of #cite(label("ElAbdalaoui2025")) gives concentration tending to one in each fixed neighborhood of zero. This is compatible with (42); it does not contradict the cited upper bound $c_(2 p) lt.eq 1 \/ 2$. Multiplicative normalization cancels in the ratio. Even restricting supports to ${ 0 \, dots.h \, q - 1 }$ with density tending to $1 \/ 2$ does not give the required cap: use $D_(floor.l q \/ 2 floor.r)$. This explains the failure of that specific concluding inference.

=== 9.2 A later weighted assertion <a-later-weighted-assertion>

A separate preprint #cite(label("ElAbdalaoui2025Generalization")) Theorem 1 asserts a nonflatness criterion for fixed real coefficients $a_j$ and unimodular multipliers. Its hypothesis is

#[#set math.equation(numbering: n => "(43)")
 $ sum_(j = 1)^n a_j^2 lt.eq K / n^2 sum_(j = 1)^n j^2 a_j^2 \, $ <eq:weighted-hypothesis>]

and its polynomial is normalized by $\( sum_(j = 1)^n a_j^2 \)^(1 \/ 2)$. Without any restriction preventing a dominant coefficient, this criterion is false.

Take $a_j = 2^(j^2)$ and all unimodular multipliers equal to one. Let $S_n = sum_(j = 1)^n a_j^2$. For $n gt.eq 2$,

$ frac(sum_(j < n) a_j^2, a_n^2) lt.eq \( n - 1 \) 2^(- 4 n + 2) lt.eq 1 . $

It follows, also at $n = 1$, that

$ S_n lt.eq 2 a_n^2 lt.eq 2 / n^2 sum_(j = 1)^n j^2 a_j^2 . $

Thus (43) holds with $K = 2$. On the other hand,

$ frac(sum_(j < n) a_j, a_n) lt.eq \( n - 1 \) 2^(- 2 n + 1) arrow.r 0 \, #h(2em) S_n / a_n^2 arrow.r 1 . $

Uniformly for $\| z \| = 1$, therefore,

$ lr(|frac(sum_(j = 1)^n a_j z^j, sqrt(S_n)) - z^n|) lt.eq frac(sum_(j < n) a_j, sqrt(S_n)) + lr(|a_n / sqrt(S_n) - 1|) arrow.r 0 . $

The normalized moduli converge uniformly to one. This example concerns weighted coefficients, not signs.

The proof of Corollary 3 in #cite(label("ElAbdalaoui2025Generalization")) displays a signed-modulus identity for values at $\| z \| = \| z' \| = 1$. Even reading its repeated second argument as the intended $z'$, the asserted form

$ \| P \( z \) - P \( z' \) \| = sigma \| P \( z \) \| + tau \| P \( z' \) \| \, #h(2em) sigma \, tau in { - 1 \, 1 } \, $

is false. For $P \( z \) = 1 + z$, $z = 1$ and $z' = i$, the left side is $sqrt(2)$, whereas no value $plus.minus 2 plus.minus sqrt(2)$ equals $sqrt(2)$. These observations identify defects in the proposed obstructions; the real-sign assertion of Theorem 1 rests on the construction and rounding proof above.


#bibliography("refs.bib", style: "ieee", title: [References])
