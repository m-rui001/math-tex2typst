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

#align(center)[#text(size: 16pt, weight: "bold")[Talagrand's discrete-convexity conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $\[ N \] = { 1 \, dots.h \, N }$, and let $mu_p$ be the probability measure on $2^(\[ N \])$ under which each coordinate is present independently with probability $p in \( 0 \, 1 \)$. For a family $cal(D) subset.eq 2^(\[ N \])$ and an integer $k gt.eq 1$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ E_k \( cal(D) \) = { S subset.eq \[ N \] : S subset.eq.not D_1 union dots.h.c union D_k upright(" for all ") D_1 \, dots.h \, D_k in cal(D) #scale(x: 120%, y: 120%)[}] . $ <eq:exceptional-definition>]

The members in a tuple may repeat and need not be disjoint.

A family $cal(G) subset.eq 2^(\[ N \])$ #emph[covers] a family $cal(A)$ if every $S in cal(A)$ contains some $I in cal(G)$. For $rho in \( 0 \, 1 \)$, write

$ c_rho \( cal(G) \) = sum_(I in cal(G)) rho^(\| I \|) . $

We say that $cal(A)$ is #emph[$p$-small] if it has a cover $cal(G)$ with $c_p \( cal(G) \) lt.eq 1 \/ 2$. Since $mu_p { S : I subset.eq S } = p^(\| I \|)$, such a cover witnesses $mu_p \( cal(A) \) lt.eq 1 \/ 2$ by a union bound.

The name reflects the analogy with Talagrand’s Gaussian convexity question [11] Conjecture 2.1: can a bounded number of sums of a compact balanced set of sufficiently large Gaussian measure contain a convex set of Gaussian measure at least $1 \/ 2$, uniformly in the dimension? Here balanced means closed under multiplication by scalars of absolute value at most one. In the discrete problem, unions replace sums, and containment covers describe the exceptional sets. Talagrand formulated the discrete-convexity conjecture in [11] Conjecture 7.1: a fixed number of members of a sufficiently likely family should cover every set outside a $p$-small exceptional family. The same original-density formulation appears as Research Problem 13.3.2 in [12], whose Proposition 13.3.3 explains its connection to positive selector processes. We prove this conjecture.

#thm([Theorem 1.1.])[
  #emph[Set $k = 2^75$. For every integer $N gt.eq 1$, every $p in \( 0 \, 1 \)$, and every family $cal(D) subset.eq 2^(\[ N \])$, 
$ mu_p \( cal(D) \) gt.eq 1 - 1 / k quad arrow.r.double quad E_k \( cal(D) \) upright(" is ") p upright("-small") . $

]
] <thm:main>

The constant is independent of $N$, $p$, and $cal(D)$. The family $cal(D)$ is arbitrary; no monotonicity is assumed.

===== 1.1 Positive selectors. <positive-selectors.>

The connection to positive selector processes [11] Section 7 gives a concrete consequence of the theorem, recovering the positive-selector conclusion proved by Park and Pham [10] Theorem 1.2. For a nonempty family $T subset.eq \[ 0 \, oo \)^N$, define

$ phi.alt \( S \) = sup_(t in T) sum_(i in S) t_i \, #h(2em) M = bb(E)_(mu_p) phi.alt \, $

and suppose $0 < M < oo$. Then ${ S : phi.alt \( S \) gt.eq k^2 M }$ is $p$-small for $k = 2^75$. Indeed, Markov’s inequality gives $mu_p { D : phi.alt \( D \) < k M } gt.eq 1 - 1 \/ k$. Nonnegativity of the coordinates makes $phi.alt$ monotone and subadditive under unions, so a set with $phi.alt \( S \) gt.eq k^2 M$ cannot be contained in the union of $k$ such $D$’s. Theorem 1 supplies its cover. Thus the large-value event has explicit containment witnesses, beyond the small probability already supplied by Markov’s inequality.

===== 1.2 Related developments. <related-developments.>

Hua, Song, and Tudose resolve Talagrand’s Gaussian convexity problem and derive a discrete conclusion with three unions and covering density $p^C$, for a universal constant $C$, when the starting family is sufficiently likely [5] Corollaries 1.3–1.4. Ascoli, He, Park, and Talagrand give a threshold reformulation of discrete convexity and prove cases for several graph-containment properties [1] Proposition 1.5 and Theorems 1.10–1.13.

There is also a fractional version of smallness: instead of selecting generators, one assigns nonnegative coefficients $a_I$ satisfying

$ sum_(I subset.eq S) a_I gt.eq 1 quad \( S in cal(A) \) \, #h(2em) sum_(I subset.eq \[ N \]) p^(\| I \|) a_I lt.eq 1 / 2 . $

Talagrand introduced this relaxation alongside integral smallness [11] Sections 6 and 7. Li resolves the fractional discrete-convexity problem through a quantitative obstruction to probability measures whose containment probabilities are bounded by $p^(\| I \|)$ [6] Theorem 1.9. Combining fractional information with rounding, Park obtains an integral cover of $E_2 \( cal(D) \)$ at density

$ frac(p, C max { 1 \, log log \( 1 \/ p \) }) $

whenever $mu_p \( cal(D) \) > 1 \/ 2$, for a universal $C$ [9] Corollary 3.5. Combining Li’s result with the companion constant-factor rounding theorem gives the following two-union tradeoff.

#thm([Corollary 1.2.])[
  (Two unions at constant density loss).  #emph[There is a universal constant $C gt.eq 1$ such that, for every integer $N gt.eq 1$, every $p in \( 0 \, 1 \)$, and every family $cal(D) subset.eq 2^(\[ N \])$, 
$ mu_p \( cal(D) \) > 1 / 2 quad arrow.r.double quad E_2 \( cal(D) \) upright(" is ") \( p \/ C \) upright("-small") . $

]
] <cor:two-union>

#proof[
  If $E_2 \( cal(D) \) = diameter$, the empty cover suffices. Otherwise it is a nonempty proper increasing family: $cal(D) eq.not diameter$, so $diameter in.not E_2 \( cal(D) \)$, and the defining obstruction is preserved by taking supersets. By Li’s result [6] Corollary 3.1 in Park’s fractional-cover formulation [9] Theorem 3.4, this family has a fractional cover of cost at most $1 \/ 2$ at $r = p \/ 2$. Capping each coefficient at one preserves coverage and does not increase cost. The companion expectation-threshold theorem [8] Theorem 1.1 then gives an integral cover of cost at most $1 \/ 2$ at $r \/ \( 25 dot.op 512^4 \)$. Thus $C = 50 dot.op 512^4$ suffices. ◻
]

Theorem 1 retains the original cost parameter $p$ while allowing a larger universal number of unions.

===== 1.3 Proof strategy and method. <proof-strategy-and-method.>

The main task is to turn the obstruction to covering a set by unions into an inexpensive family of integral generators. We first work at a fixed fraction of the density. An orthogonal expansion gives nonnegative weights on subsets with a global bound on their weighted sum. A signed product on an array of 32 rows turns the failure of a union cover into a lower bound on the sixteenth powers of those same weights. Its column factor vanishes when all rows miss that coordinate, so the identity follows from pointwise vanishing. The two-row version is Li’s signed kernel after multiplication by the Bernoulli masses [6] Section 2. This method has antecedents in the signed product operators and biased Fourier analysis of Friedgut [4] Section 2.2 and Ellis, Filmus, and Friedgut [2] Sections 2.2 and 4.1.

Large individual weights give cheap generators directly. If a set contains none of these generators, the higher-power bound forces it to contain many subsets of one size and comparable weight. An elementary covering lemma handles each such class: it selects subsets of large weighted degree, independently samples unions of pairs of the remaining edges, and adds the residual configurations. Weighted-degree control bounds the cost of extending a tuple, while a long tuple must avoid quadratically many independent pair choices to survive. Random unions also enter the covering constructions of Fischer and Person [3] Sections 1.1 and 2; the lemma here is proved in full.

Section 2 establishes this covering lemma, and Section 3 uses it with the signed identity to cover $E_32 \( cal(F) \)$ at density $q \/ 2^70$ whenever $mu_q \( cal(F) \) gt.eq 1 \/ 2$. The final step, in Section 4, recovers the original density. We couple dependent rows so that each entire row has the original Bernoulli product law and their union has an exactly prescribed larger density. The probability that all rows belong to the starting family is controlled by a union bound. This exact coupling is what permits arbitrary families and returns the covering cost to $p$.

== 2 An elementary covering lemma <sec:covering>

We seek an inexpensive cover of all sets containing many edges of a uniform family with bounded total cost. The construction first selects subsets lying in many edges. The remaining edges then have controlled extension cost, while pair sampling makes long tuples unlikely to survive uncovered: they must avoid quadratically many independent choices. Unions of sampled edges also appear in the covering constructions of Fischer and Person [3] Sections 1.1 and 2; the argument below is self-contained.

#thm([Lemma 2.1.])[
  #emph[Let $X$ be a finite set, let $0 < rho < 1$, and let $r \, h$ be integers with $1 lt.eq r lt.eq h$ and $h gt.eq 64$. Suppose that $cal(H) subset.eq binom(X, r)$ satisfies 
$ \| cal(H) \| rho^r lt.eq 2^(h + 1) . $

 Then the family 
$ {S subset.eq X : \| { e in cal(H) : e subset.eq S } \| gt.eq 2^(12 h)} $

 has a cover $cal(G) subset.eq 2^X$ with 
$ c_rho \( cal(G) \) lt.eq 3 dot.op 2^(- h) . $

]
] <lem:covering>

#proof[
  Put
  $ m = 2^(12 h) \, #h(2em) T = 2^(4 h) \, #h(2em) pi = 2^(- 8 h) . $
  For $I subset.eq X$ with $\| I \| lt.eq r$, define its weighted degree by
  $ d \( I \) = \| { e in cal(H) : I subset.eq e } \| rho^(r - \| I \|) . $
  #emph[Large weighted degrees.] Begin with the generators
  $ cal(C)_0 = { I subset.eq X : \| I \| lt.eq r \, med d \( I \) > T } . $
  Counting the subsets of each edge gives
  $ sum_(I subset.eq X\
\| I \| lt.eq r) d \( I \) rho^(\| I \|) = 2^r \| cal(H) \| rho^r . $
  Consequently,
  #[#set math.equation(numbering: n => "(2.1)")
   $ c_rho \( cal(C)_0 \) lt.eq T^(- 1) 2^r \| cal(H) \| rho^r lt.eq 2^(r + 1 - 3 h) lt.eq 2^(1 - 2 h) . $ <eq:covering-initial-cost>]
  Call an edge #emph[regular] if it contains no member of $cal(C)_0$, and let $cal(H)'$ be the family of regular edges. In particular,
  $ I subset.eq e in cal(H)' quad arrow.r.double quad d \( I \) lt.eq T . $
  We will use this regularity in the following form. Given $B subset.eq X$, group the edges $e in cal(H)'$ according to $I = e ∩ B$. Each nonempty group contributes
  $ sum_(e in cal(H)'\
e ∩ B = I) rho^(\| e \\ B \|) = \| { e in cal(H)' : e ∩ B = I } \| rho^(r - \| I \|) lt.eq d \( I \) lt.eq T . $
  It follows that
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_(e in cal(H)') rho^(\| e \\ B \|) lt.eq T sum_(i = 0)^r binom(\| B \|, i) . $ <eq:covering-extension>]
  #emph[Sampled pairs.] Independently for each ordered pair $\( e \, e' \) in \( cal(H)' \)^2$, including the diagonal pairs, sample that pair with probability $pi$. Let $cal(C)_1$ consist of the unions of the sampled pairs. Applying (2.2) with $B = e$, so that $\| B \| = r$, yields
  $ sum_(e' in cal(H)') rho^(\| e' \\ e \|) lt.eq 2^r T . $
  Thus
  #[#set math.equation(numbering: n => "(2.3)")
   $ bb(E) \[ c_rho \( cal(C)_1 \) \] & lt.eq pi sum_(e \, e' in cal(H)') rho^(\| e union e' \|)\
 & lt.eq pi \| cal(H)' \| rho^r 2^r T lt.eq 2^(r + 1 - 3 h) lt.eq 2^(1 - 2 h) . $ <eq:covering-pair-cost>]
  The first inequality counts unions with multiplicity. Distinct ordered pairs remain independent sampling indices even when their unions coincide.
  #emph[Residual generators.] For every ordered tuple $\( e_1 \, dots.h \, e_m \)$ of distinct regular edges, add $e_1 union dots.h.c union e_m$ to $cal(C)_2$ if none of the pairs $\( e_i \, e_j \)$, $1 lt.eq i \, j lt.eq m$, was sampled. Then
  $ cal(G) = cal(C)_0 union cal(C)_1 union cal(C)_2 $
  covers the target family for every sampling outcome. Indeed, a target set $S$ containing no generator from $cal(C)_0$ contains at least $m$ distinct regular edges. Choose $m$ of them. If a pair among these edges was sampled, its union is a member of $cal(C)_1$ contained in $S$; otherwise their full union belongs to $cal(C)_2$.
  It remains to bound the expected cost of $cal(C)_2$. For $0 lt.eq t lt.eq m$, let
  $ W_t = sum_(\( e_1 \, dots.h \, e_t \) in \( cal(H)' \)^t\
e_1 \, dots.h \, e_t med upright("distinct")) rho^(\| e_1 union dots.h.c union e_t \|) \, #h(2em) W_0 = 1 . $
  For a prefix of length $t < m$, its union $B$ has size at most $r t lt.eq r m$. The elementary inequality
  $ sum_(i = 0)^r binom(\| B \|, i) lt.eq \( 1 + \| B \| \)^r lt.eq \( 1 + r m \)^r $
  can be seen by ordering $B$, listing the members of each subset of size at most $r$, and padding the list to length $r$ with a new symbol. Since $rho^(\| B union e \|) = rho^(\| B \|) rho^(\| e \\ B \|)$, (2.2) bounds the total weight of extensions of this prefix by
  $ rho^(\| B \|) thin T \( 1 + r m \)^r . $
  Allowing all regular edges as possible extensions only increases this bound. Summing over prefixes and iterating gives
  $ W_(t + 1) lt.eq T \( 1 + r m \)^r W_t \, #h(2em) W_m lt.eq \[ T \( 1 + r m \)^r \]^m . $
  The $m^2$ ordered pair indices associated with a tuple of distinct edges are all distinct. Hence the probability that this tuple contributes a residual generator is exactly
  $ \( 1 - pi \)^(m^2) lt.eq e^(- pi m^2) lt.eq 2^(- pi m^2) . $
  Linearity of expectation, again counting generators with multiplicity, therefore gives
  $ bb(E) \[ c_rho \( cal(C)_2 \) \] lt.eq \[ T \( 1 + r m \)^r \]^m thin 2^(- pi m^2) . $
  To make this at most $2^(- m)$, it is enough that
  $ log_2 T + r log_2 \( 1 + r m \) + 1 lt.eq pi m . $
  The choice of $m$ makes $pi m = 2^(4 h)$, while the left side is bounded by a quadratic function of $h$. Indeed,
  $ 1 + r m lt.eq \( h + 1 \) 2^(12 h) lt.eq 2^(13 h) \, #h(2em) 4 h + 13 r h + 1 lt.eq 18 h^2 lt.eq 18 dot.op 2^(2 h) lt.eq 2^(4 h) = pi m . $
  Here we used $r lt.eq h$, $h + 1 lt.eq 2^h$, and $h gt.eq 64$. It follows that
  #[#set math.equation(numbering: n => "(2.4)")
   $ bb(E) \[ c_rho \( cal(C)_2 \) \] lt.eq 2^(\( 4 h + 13 r h \) m - pi m^2) lt.eq 2^(- m) . $ <eq:covering-residual-cost>]
  Combining (2.1), (2.3), and (2.4), we obtain
  $ bb(E) \[ c_rho \( cal(G) \) \] lt.eq 2^(2 - 2 h) + 2^(- m) lt.eq 3 dot.op 2^(- h) . $
  All families and sampling indices are finite, so some outcome has cost at most its expectation. Since every outcome supplies a cover, this proves the lemma. ◻
]

== 3 Weights for exceptional sets <sec:weights>

The next proposition supplies a cover at a fixed fraction of the original density. Its proof combines an orthogonal expansion with a signed measure on arrays of sets. The expansion bounds the total weight, while the signed measure forces a large sum of high powers on every exceptional set. Lemma 3 then converts these two bounds into a cover.

#thm([Proposition 3.1.])[
  #emph[Let $L = 2^70$. For every integer $N gt.eq 1$, every $q in \( 0 \, 1 \)$, and every $cal(F) subset.eq 2^(\[ N \])$ satisfying $mu_q \( cal(F) \) gt.eq 1 \/ 2$, the family $E_32 \( cal(F) \)$ is $\( q \/ L \)$-small.]
] <prop:half-density>

#proof[
  Identify subsets of $\[ N \]$ with their indicator vectors and write $f = upright(bold(1))_(cal(F))$. For $U subset.eq \[ N \]$, define
  #[#set math.equation(numbering: n => "(3.1)")
   $ b \( U \) = \( 1 - q \)^(\| U \|) sum_(z in { 0 \, 1 }^U) \( - 1 \)^(sum_(i in U) z_i) bb(E) \[ f \( z \, Y \) \] \, #h(2em) w \( U \) = b \( U \)^2 \, $ <eq:weights-definition>]
  where $Y$ has independent Bernoulli-$q$ coordinates on $\[ N \] \\ U$. In particular, $b \( diameter \) = mu_q \( cal(F) \)$.
  We will compare a global bound on the weights with a lower bound on their sixteenth powers over subsets of each exceptional set. In a bin where $w \( U \) lt.eq 2^(- h)$, fewer than $2^(12 h)$ terms contribute at most $2^(- 4 h)$ to the sum of sixteenth powers. This is the gap exploited by Lemma 3.
  ===== 3.1 The global weight bound. <the-global-weight-bound.>
  We use the standard biased Fourier basis [7] Section 8.4, with its normalization made explicit here. Under the product law $mu_q$, the functions
  $ chi_U \( x \) = frac(product_(i in U) \( q - x_i \), \[ q \( 1 - q \) \]^(\| U \| \/ 2)) \, #h(2em) U subset.eq \[ N \] \, $
  are orthonormal: each standardized coordinate has mean zero and variance one, and the coordinates are independent. Since $0 < q < 1$, the measure has full support; these $2^N$ orthonormal functions form a basis of the $2^N$-dimensional space of real functions on the cube. Set $hat(f) \( U \) = bb(E) \[ f \( X \) chi_U \( X \) \]$ for $X tilde.op mu_q$. For a Bernoulli-$q$ bit $X_i$ and $z_i in { 0 \, 1 }$,
  $ bb(P) \( X_i = z_i \) \( q - z_i \) = q \( 1 - q \) \( - 1 \)^(z_i) . $
  Summing over the coordinates in $U$ therefore gives
  $ hat(f) \( U \) = \[ q \( 1 - q \) \]^(\| U \| \/ 2) sum_(z in { 0 \, 1 }^U) \( - 1 \)^(sum_(i in U) z_i) bb(E) \[ f \( z \, Y \) \] = (frac(q, 1 - q))^(\| U \| \/ 2) b \( U \) . $
  Consequently, Parseval’s identity yields
  #[#set math.equation(numbering: n => "(3.2)")
   $ sum_(U subset.eq \[ N \]) q^(\| U \|) w \( U \) & = sum_(U subset.eq \[ N \]) \( 1 - q \)^(\| U \|) hat(f) \( U \)^2\
 & lt.eq sum_(U subset.eq \[ N \]) hat(f) \( U \)^2 = bb(E) \[ f \( X \)^2 \] = mu_q \( cal(F) \) lt.eq 1 . $ <eq:global-weight-bound>]
  This calculation holds for all $q in \( 0 \, 1 \)$.
  ===== 3.2 A bound on every exceptional set. <a-bound-on-every-exceptional-set.>
  Fix $S in E_32 \( cal(F) \)$. We claim that
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(diameter eq.not U subset.eq S) w \( U \)^16 gt.eq 2^(- 32) . $ <eq:exceptional-weight-bound>]
  Consider an array of bits with $32$ rows and $N$ columns. For a column $y in { 0 \, 1 }^32$, let
  $ P \( y \) = product_(j = 1)^32 q^(y_j) \( 1 - q \)^(1 - y_j) . $
  For columns in $S$, we want a correction that cancels the all-zero column and factors across rows. A suitably scaled parity term has both properties. Give each column outside $S$ the mass function $P$, and give each column in $S$ the signed mass function
  $ R \( y \) = P \( y \) - \( 1 - q \)^32 \( - 1 \)^(sum_(j = 1)^32 y_j) . $
  With two rows, this is precisely Li’s signed kernel after multiplying by the Bernoulli masses [6] Section 2. Park also notes the extension of Li’s argument to an even number of unions [9] Corollary 3.5, footnote 3. Here the higher powers obtained from 32 rows are combined with Lemma 3 to obtain a fixed density loss. The signed-operator approach to forbidden configurations and its biased Fourier basis have earlier forms in [4] Section 2.2 and [2] Section 4.1. Let $nu_S$ be the product of these column masses. Since $R \( 0 \, dots.h \, 0 \) = 0$, every array with nonzero $nu_S$-weight has a $1$ in each column of $S$. The sets represented by its rows therefore have union containing $S$. By the definition of $E_32 \( cal(F) \)$, these rows cannot all lie in $cal(F)$. Writing $x_j$ for row $j$, we obtain
  $ sum_(x in { 0 \, 1 }^(32 times N)) nu_S \( x \) product_(j = 1)^32 f \( x_j \) = 0 . $
  This uses pointwise vanishing of the product on the support of $nu_S$; nonnegativity of the signed masses is unnecessary.
  Expand the column products, and let $U subset.eq S$ be the columns in which the subtracted term is chosen. After taking out $\( - 1 \)^(\| U \|)$, the correction contributes
  $ \( 1 - q \)^(32 \| U \|) product_(j = 1)^32 \( - 1 \)^(sum_(i in U) x_(j i)) . $
  All coordinates outside $U$ retain their Bernoulli product masses. Thus the sum factors over rows. In each row the factor is precisely $b \( U \)$ from (3.1), because the power $\( 1 - q \)^(32 \| U \|)$ distributes as $\( 1 - q \)^(\| U \|)$ to each row. It follows that
  #[#set math.equation(numbering: n => "(3.4)")
   $ 0 = sum_(U subset.eq S) \( - 1 \)^(\| U \|) b \( U \)^32 . $ <eq:signed-identity>]
  All products and sums here are finite. Isolating the empty term and using the triangle inequality gives
  $ 2^(- 32) lt.eq b \( diameter \)^32 lt.eq sum_(diameter eq.not U subset.eq S) \| b \( U \) \|^32 = sum_(diameter eq.not U subset.eq S) w \( U \)^16 \, $
  which proves (3.3).
  ===== 3.3 Constructing the cover. <constructing-the-cover.>
  Set $rho = q \/ L$. First include all sets in
  $ cal(G)_0 = { U subset.eq \[ N \] : U eq.not diameter \, med w \( U \) gt.eq 2^(- 64 \| U \|) } $
  as generators. For $U in cal(G)_0$ with $r = \| U \| gt.eq 1$,
  $ rho^r = q^r 2^(- 70 r) lt.eq 2^(- 6 r) q^r w \( U \) lt.eq 2^(- 6) q^r w \( U \) . $
  Hence (3.2) gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ c_rho \( cal(G)_0 \) lt.eq 2^(- 6) . $ <eq:outright-cost>]
  Partition the remaining nonempty sets of positive weight into families
  $ cal(H)_(r \, h) = { U subset.eq \[ N \] : \| U \| = r \, med U in.not cal(G)_0 \, quad 2^(- \( h + 1 \)) < w \( U \) lt.eq 2^(- h) #scale(x: 120%, y: 120%)[}] \, $
  where $r gt.eq 1$ and $h$ is an integer. Every such set belongs to exactly one bin, and every occupied bin has $h gt.eq 64 r$. Indeed, its weights are strictly below $2^(- 64 r)$; a weight equal to that threshold was included in $cal(G)_0$. By (3.2),
  $ \| cal(H)_(r \, h) \| q^r 2^(- \( h + 1 \)) < sum_(U in cal(H)_(r \, h)) q^r w \( U \) lt.eq 1 $
  for each occupied bin. In particular,
  $ \| cal(H)_(r \, h) \| rho^r lt.eq 2^(h + 1) . $
  Since $h gt.eq 64 r gt.eq 64$, all the hypotheses of Lemma 3 hold. Choose a cover $cal(G)_(r \, h)$ of the sets containing at least $2^(12 h)$ members of $cal(H)_(r \, h)$, with
  $ c_rho \( cal(G)_(r \, h) \) lt.eq 3 dot.op 2^(- h) . $
  There are only finitely many occupied bins, because the ground set is finite. We may therefore choose these covers simultaneously and form
  $ cal(G) = cal(G)_0 union union.big_(cal(H)_(r \, h) eq.not diameter) cal(G)_(r \, h) . $
  Removing any repeated generators can only decrease its cost. The geometric sum
  #[#set math.equation(numbering: n => "(3.6)")
   $ 3 sum_(r gt.eq 1) sum_(h gt.eq 64 r) 2^(- h) = frac(6, 2^64 - 1) < 1 / 4 $ <eq:bin-cost-sum>]
  and (3.5) imply
  $ c_rho \( cal(G) \) lt.eq 1 / 64 + frac(6, 2^64 - 1) < 1 / 2 . $
  It remains to show that $cal(G)$ covers $E_32 \( cal(F) \)$. Suppose that $S subset.eq \[ N \]$ contains no member of $cal(G)$. It contains no member of $cal(G)_0$ and fewer than $2^(12 h)$ members of each bin $cal(H)_(r \, h)$. Zero weights contribute nothing, so
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(diameter eq.not U subset.eq S) w \( U \)^16 & lt.eq sum_(r gt.eq 1) sum_(h gt.eq 64 r) 2^(12 h) 2^(- 16 h)\
 & = frac(16, 15 \( 2^256 - 1 \)) < 2^(- 32) . $ <eq:bin-power-sum>]
  By (3.3), such an $S$ cannot belong to $E_32 \( cal(F) \)$. Thus $cal(G)$ is the required cover. ◻
]

== 4 Returning to the original density <sec:density>

We now remove the factor $L$ in Proposition 4. The useful coupling makes each row a product sample, while arranging its dependence with the other rows so that their union has a larger prescribed density.

#proof[
  Set $L = 2^70$ and $k = 32 L = 2^75$, and suppose that $mu_p \( cal(D) \) gt.eq 1 - 1 \/ k$. In particular, $cal(D)$ is nonempty. We construct $L$ random sets $R_1 \, dots.h \, R_L$, each with law $mu_p$. For any such construction the union bound gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ bb(P) \( R_j in cal(D) upright(" for all ") 1 lt.eq j lt.eq L \) gt.eq 1 - sum_(j = 1)^L bb(P) \( R_j in.not cal(D) \) gt.eq 1 - L / k = 31 / 32 . $ <eq:all-good-rows>]
  Independence between rows is not required.
  #emph[Case 1: $L p < 1$.] For each coordinate $i$, independently across coordinates, choose a label $J_i in { 0 \, 1 \, dots.h \, L }$ with
  $ bb(P) \( J_i = 0 \) = 1 - L p \, #h(2em) bb(P) \( J_i = j \) = p quad \( 1 lt.eq j lt.eq L \) . $
  Put $R_j = { i : J_i = j }$. For a fixed row $j$, its membership indicators are independent Bernoulli variables of parameter $p$, so $R_j$ has law $mu_p$. The union $R = R_1 union dots.h.c union R_L$ has law $mu_q$, where $q = L p in \( 0 \, 1 \)$: a coordinate belongs to $R$ precisely when its label is nonzero. Figure 1 illustrates the construction with three rows.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.1414, 0.3586), (0.1414, 0.6414), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.1414, 0.8586), (0.1414, 1.141), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.1414, 1.359), (0.1414, 1.641), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.509, 0.3586), (1.791, 0.6414), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.509, 0.8586), (1.791, 1.141), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.159, 0.3586), (3.441, 0.6414), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.159, 1.359), (3.441, 1.641), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.809, 0.8586), (5.091, 1.141), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.809, 1.359), (5.091, 1.641), [#set text(hyphenate: false); #align(center + horizon)[0]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.509, 1.359), (1.791, 1.641), [#set text(hyphenate: false); #align(center + horizon)[#text(fill: rgb("#ffffff"))[1]]], frame: "circle", fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.159, 0.8586), (3.441, 1.141), [#set text(hyphenate: false); #align(center + horizon)[#text(fill: rgb("#ffffff"))[1]]], frame: "circle", fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.809, 0.3586), (5.091, 0.6414), [#set text(hyphenate: false); #align(center + horizon)[#text(fill: rgb("#ffffff"))[1]]], frame: "circle", fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 2.05), [$J_i=0$])
  content((1.65, 2.05), [$J_i=1$])
  content((3.3, 2.05), [$J_i=2$])
  content((4.95, 2.05), [$J_i=3$])
  content((0, -0.05), [$1-3p$])
  content((1.65, -0.05), [$p$])
  content((3.3, -0.05), [$p$])
  content((4.95, -0.05), [$p$])
  content((-0.66, 1.5), [row 1], anchor: "east", padding: 0.1176cm)
  content((-0.66, 1), [row 2], anchor: "east", padding: 0.1176cm)
  content((-0.66, 0.5), [row 3], anchor: "east", padding: 0.1176cm)
  content((-0.66, -0.05), [probability], anchor: "east", padding: 0.1176cm)
})],
    caption: [Figure 1: One coordinate of the sparse coupling, illustrated with three rows and $3 p < 1$. Each row contains this coordinate with probability $p$; the union contains it with probability $3 p$. Making these choices independently across coordinates gives the required product laws. ],
  ) <fig:coupling>
  Define
  $ cal(F) = { D_1 union dots.h.c union D_L : D_1 \, dots.h \, D_L in cal(D) } . $
  On the event in (4.1), the union $R$ belongs to $cal(F)$. Hence
  $ mu_q \( cal(F) \) = bb(P) \( R in cal(F) \) gt.eq 31 / 32 gt.eq 1 / 2 . $
  Grouping a tuple of $32 L$ members of $cal(D)$ into 32 groups of size $L$, or conversely expanding 32 members of $cal(F)$, shows that the possible unions agree exactly. Thus
  $ E_32 \( cal(F) \) = E_(32 L) \( cal(D) \) = E_k \( cal(D) \) . $
  Proposition 4 makes this family $\( q \/ L \)$-small. Since $q \/ L = p$, this is the required conclusion.
  #emph[Case 2: $L p gt.eq 1$.] Set
  $ t = frac(p - 1 \/ L, 1 - 1 \/ L) in \[ 0 \, 1 \) . $
  At each coordinate $i$, choose a mandatory row uniformly among the $L$ rows. Include $i$ in that row, and, conditional on this choice, include it independently in each other row with probability $t$. Make these choices independently across coordinates. For each fixed row $j$,
  $ bb(P) \( i in R_j \) = 1 / L + (1 - 1 / L) t = p \, $
  and the coordinates of $R_j$ are independent. Thus each $R_j$ again has law $mu_p$, while the union of all rows is $\[ N \]$ in every outcome.
  By (4.1), some outcome has all $L$ rows in $cal(D)$. These rows cover $\[ N \]$. Repeating the resulting tuple 32 times gives exactly $k$ members of $cal(D)$ with full union. Consequently $E_k \( cal(D) \) = diameter$, which is covered at cost zero by the empty family. This construction also covers the boundary $L p = 1$, when $t = 0$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Ruben Ascoli, Xiaoyu He, Jinyoung Park, and Michel Talagrand, #emph[A reformulation of the discrete Convexity Conjecture via $k$-thresholds], arXiv:2608.11183v1, 2026. #link("https://arxiv.org/abs/2608.11183v1")[arXiv:2608.11183v1].]
#bibitem([2])[David Ellis, Yuval Filmus, and Ehud Friedgut, #emph[Triangle-intersecting families of graphs], Journal of the European Mathematical Society #strong[14] (2012), no.~3, 841--885. #link("https://doi.org/10.4171/JEMS/320")[doi:10.4171/JEMS/320].]
#bibitem([3])[Thomas Fischer and Yury Person, #emph[Further remarks on fractional vs. expectation thresholds], arXiv:2505.21782v1, 2025. #link("https://doi.org/10.48550/arXiv.2505.21782")[doi:10.48550/arXiv.2505.21782].]
#bibitem([4])[Ehud Friedgut, #emph[On the measure of intersecting families, uniqueness and stability], Combinatorica #strong[28] (2008), no.~5, 503--528. #link("https://doi.org/10.1007/s00493-008-2318-9")[doi:10.1007/s00493-008-2318-9].]
#bibitem([5])[Dongming (Merrick) Hua, Antoine Song, and Stefan Tudose, #emph[On Talagrand's Convexity Conjecture], arXiv:2605.10908v2, 2026. #link("https://arxiv.org/abs/2605.10908v2")[arXiv:2605.10908v2].]
#bibitem([6])[Chen Li, #emph[On $p$-spread measures], arXiv:2609.08967v1, 2026. #link("https://arxiv.org/abs/2609.08967v1")[arXiv:2609.08967v1].]
#bibitem([7])[Ryan O'Donnell, #emph[Analysis of Boolean Functions], Cambridge University Press, Cambridge, 2014. Author's corrected text, 2021: #link("https://arxiv.org/abs/2105.10386v1")[arXiv:2105.10386v1].]
#bibitem([8])[OpenAI, #emph[Integral and fractional expectation thresholds are equivalent], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026/paper.pdf")[OAI:Integral-and-fractional-expectation-thresholds-are-equivalent-September-23-2026], 2026.]
#bibitem([9])[Jinyoung Park, #emph[A dimension-free comparison between expectation thresholds and fractional expectation thresholds], arXiv:2609.14681v1, 2026. #link("https://arxiv.org/abs/2609.14681v1")[arXiv:2609.14681v1].]
#bibitem([10])[Jinyoung Park and Huy Tuan Pham, #emph[On a conjecture of Talagrand on selector processes and a consequence on positive empirical processes], Annals of Mathematics #strong[199] (2024), no.~3, 1293--1321. #link("https://doi.org/10.4007/annals.2024.199.3.6")[doi:10.4007/annals.2024.199.3.6].]
#bibitem([11])[Michel Talagrand, #emph[Are many small sets explicitly small?], Proceedings of the Forty-Second ACM Symposium on Theory of Computing, ACM, New York, 2010, 13--36. #link("https://doi.org/10.1145/1806689.1806693")[doi:10.1145/1806689.1806693].]
#bibitem([12])[Michel Talagrand, #emph[Upper and Lower Bounds for Stochastic Processes: Decomposition Theorems], 2nd ed., Ergebnisse der Mathematik und ihrer Grenzgebiete, 3.~Folge, vol.~60, Springer, Cham, 2021. #link("https://doi.org/10.1007/978-3-030-82595-9")[doi:10.1007/978-3-030-82595-9].]


