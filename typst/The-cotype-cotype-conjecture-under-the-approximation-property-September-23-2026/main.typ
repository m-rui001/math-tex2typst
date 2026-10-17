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

#align(center)[#text(size: 16pt, weight: "bold")[The cotype--cotype conjecture \
under the approximation property]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 The characterization <sec:introduction>

The cotype–cotype problem asks whether finite Rademacher cotype of a Banach space and its dual forces $K$-convexity. Without an approximation hypothesis the assertion is false. We prove the characterization under the ordinary approximation property.

All spaces in this paper are real, and $X^(*)$ denotes the continuous dual of $X$. Recall that $X$ has the #emph[approximation property] (AP) if, for every compact set $M subset X$ and every $delta > 0$, there is a bounded finite-rank linear map $S : X arrow.r X$ such that

$ sup_(x in M) parallel S x - x parallel < delta . $

The norms of these maps need not have a common bound. The #emph[bounded approximation property] (BAP) requires, in addition, a constant $lambda < oo$ such that all the maps needed for these approximations can be chosen with $parallel S parallel lt.eq lambda$.

For $2 lt.eq q < oo$, let $C_q \( Y \)$ be the least constant such that

$ (sum_(i = 1)^s parallel y_i parallel^q)^(1 \/ q) lt.eq C_q \( Y \) (bb(E)_epsilon ∥sum_(i = 1)^s epsilon_i y_i∥^2)^(1 \/ 2) $

for every finite family in $Y$, where the $epsilon_i$ are independent uniform signs. The space $Y$ has #emph[finite Rademacher cotype] if $C_q \( Y \) < oo$ for some finite $q$.

The #emph[Rademacher projection] on $X$-valued functions on a sign cube retains their first-order coefficients:

$ \( cal(R)_s f \) \( epsilon \) = sum_(i = 1)^s epsilon_i thin bb(E)_eta \[ eta_i f \( eta \) \] . $

Write

$ K \( X \) = sup_(s gt.eq 1) parallel cal(R)_s : L_2 \( { - 1 \, 1 }^s \; X \) arrow.r L_2 \( { - 1 \, 1 }^s \; X \) parallel . $

Here $L_2$ uses uniform probability measure. By definition, $X$ is #emph[$K$-convex] when $K \( X \) < oo$.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a nonzero real Banach space with the ordinary approximation property. Then $X$ is $K$-convex if and only if 
$ C_q \( X \) < oo quad upright("and") quad C_r \( X^(*) \) < oo #h(2em) upright("for some ") q \, r in \[ 2 \, oo \) . $

 The exponents $q$ and $r$ may differ. The forward implication holds for every real Banach space, without an approximation hypothesis.]
] <thm:main>

A space $X$ has #emph[Rademacher type $p$], $1 < p lt.eq 2$, if for some $D < oo$,

$ (bb(E)_epsilon ∥sum_i epsilon_i x_i∥^2)^(1 \/ 2) lt.eq D (sum_i parallel x_i parallel^p)^(1 \/ p) $

for all finite families. We say that $X$ contains the $ell_1^s$’s uniformly if the isomorphism distortions of such copies inside $X$ are bounded independently of $s$.

The classical theorems of Maurey–Pisier and Pisier [7,12] identify $K$-convexity with nontrivial type:

#[#set math.equation(numbering: n => "(1.1)")
 $ K \( X \) < oo & med arrow.l.r.double med X upright(" has Rademacher type ") p upright(" for some ") p > 1\
 & med arrow.l.r.double med X upright(" does not contain the ") ell_1^s upright("’s uniformly") . $ <eq:classical-characterization>]

These equivalences require no approximation hypothesis; precise formulations are [15] Theorem 4.40(i) and [10] Theorem 1.5. The finite-cube definition above agrees with the infinite-product definition in [10] Definition 1.1, by density of functions depending on finitely many coordinates.

The characterization is uniform when the cotype data are fixed. Its finite-dimensional form also supplies a class of convex bodies for which ordinary metric-entropy duality has dimension-free constants. For an origin-symmetric convex body $B subset bb(R)^n$, write $X_B$ for $bb(R)^n$ with unit ball $B$, and $B^compose$ for its polar. Here a convex body is compact with nonempty interior, and $N \( S \, T \)$ is the least number of translates of $T$ needed to cover $S$.

#thm([Corollary 1.2.])[
  (Uniform cotype bounds and entropy duality).  #emph[Fix $q \, r in \[ 2 \, oo \)$ and $C \, D in \[ 1 \, oo \)$. There is a finite constant $kappa = kappa \( q \, r \, C \, D \)$ such that every nonzero real Banach space $X$ with AP and 
$ C_q \( X \) lt.eq C \, #h(2em) C_r \( X^(*) \) lt.eq D $

 satisfies $K \( X \) lt.eq kappa$. Consequently there are $a \, b gt.eq 1$, depending only on $q \, r \, C \, D$, such that for every $n gt.eq 1$, all origin-symmetric convex bodies $K \, L subset bb(R)^n$, and every $t > 0$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ 1 / b log N \( L^compose \, a t K^compose \) lt.eq log N \( K \, t L \) lt.eq b log N \( L^compose \, a^(- 1) t K^compose \) \, $ <eq:cotype-entropy-duality>]

 provided either $X_K$ or $X_L$ satisfies the displayed primal and dual cotype bounds.]
] <cor:uniform-cotype-entropy>

The constants are existential; no bound on the AP approximants is required. The entropy conclusion uses the bounded-$K$ duality theorem of Artstein–Milman–Szarek–Tomczak-Jaegermann [1] Theorem 5, in the covering-number form of [8] Theorem 1.1 and Section 2. We prove the corollary at the end of Section 5.

=== 1.1 History and scope <history-and-scope>

Type and cotype express the geometry of a Banach space through the size of random signed sums. Their relation to uniform finite-dimensional subspaces was developed by Maurey and Pisier [7]. Elementary duality passes a type estimate to a cotype estimate on the dual, but recovering type from cotype requires further information. Maurey and Pisier introduced $K$-convexity as the setting for this duality question; Pisier’s holomorphic-semigroup theorem subsequently identified it with nontrivial type [7,10,12]. The question here asks whether finite cotype on both sides, together with approximation, already puts the space in that setting.

Approximation assumptions have played a substantial role in these questions. Enflo’s counterexample showed that a separable reflexive Banach space can fail AP [3]. A Schauder basis gives uniformly bounded finite-rank approximations, but the converse implications in the hierarchy

$ upright("Schauder basis") med arrow.r.double med upright("BAP") med arrow.r.double med upright("AP") $

fail: Figiel and Johnson separated AP from BAP [4] p. 199, and Szarek constructed a superreflexive space with BAP but no Schauder basis [17] Theorem 1.1. Thus an argument using ordinary AP must accommodate approximants whose norms have no common bound.

For cotype two on both sides, Pisier established the stronger conclusion that an AP space is isomorphic to a Hilbert space [9] Corollaries 2.9 and 2.16. His subsequent work proved $K$-convexity under a restriction on the cotype exponents, first with a basis or a dense increasing family of uniformly complemented finite-dimensional subspaces, and then with BAP [11] Theorem 1, Remarks 2 and 9. He asked whether the exponent restriction could be removed [11] Remark 2(iii). Szarek and Tomczak-Jaegermann discuss this question as the #emph[cotype–cotype conjecture] in connection with uniformly complemented finite-dimensional subspaces [18]. Gupta, Misra, and Ray state the BAP formulation in [6] Conjecture 1.5. Theorem 1 proves the characterization for all finite cotype exponents under ordinary AP.

The assertion with no approximation hypothesis is false. Pisier’s construction embeds every cotype-two space into a space whose primal and dual both have cotype two [13] Theorem 3.2. Starting with $ell_1$ therefore gives a space which is not $K$-convex; these examples fail AP [13] Remark 3.6.

Another application concerns a uniform tensor estimate. Given a sequence $cal(E) = \( E_n \)$ with $dim E_n = n$, one asks whether every map $A : E_m arrow.r E_n^(*)$, tensored with the identity of $F$, is bounded from the injective tensor norm to the projective tensor norm by one constant times $parallel A parallel$, independently of $m \, n \, A$. This is the Grothendieck-pair condition, stated formally in Section 6. Gupta–Misra–Ray prove that it forces finite cotype of $F$ and $F^(*)$, and record Pisier’s conjecture that for infinite-dimensional BAP spaces $F$ the estimate then also holds with $ell_2$ in place of $F$ [6] Definition 1.2, Theorem 1.3 and Conjecture 1.4. Their deduction through complemented Euclidean subspaces [6] Corollary 4.8, combined with Theorem 1, gives this conclusion under ordinary AP. This uniform operator estimate differs from Grothendieck’s original injective/projective tensor-product conjecture, disproved in [13], and from the GT-pairs of [16] Section 6.

Rademacher and Walsh expansions connect probabilistic moment estimates with Banach-space geometry. Kahane’s inequality compares moments of vector-valued Rademacher sums [15] Theorem 8.1; Borell extended moment comparison to Banach-valued Walsh polynomials of bounded degree [2]. The moment lifts below combine the Rademacher comparison with quotient duality and Hahn–Banach. The scalar coefficient lemma uses an additional feature of Fourier indices: their rank over $bb(F)_2$, which determines the number of independent Walsh factors.

=== 1.2 The mechanism of the proof <the-mechanism-of-the-proof>

The proof has two parts. First, we establish a uniform decay estimate for the normalized Walsh transforms of finite-rank operators $T : G arrow.r F$: apply $T$ to a vector family and then multiply by the matrix $\( 2^(- n) \( - 1 \)^(u dot.op v) \)_(u \, v in bb(F)_2^n)$, with the dot product computed modulo two and probability-normalized $L_2$ norms. Cotype estimates for $G^(*)$ and $F$ at one sufficiently large, fixed tuple length suffice. The decay estimate, relative to $parallel T parallel$, is independent of the operator rank and of the spaces; Theorem 9 states the precise result.

A fixed finite-rank operator already has a Walsh bound obtained by factoring through a Hilbert space, but its constant depends on the operator. To remove that dependence, we show that a slowly decreasing Walsh norm forces another substantial norm at nearly twice the dimension. A moment lift represents a tuple $\( x_i \)$ by a bounded sign-indexed family $\( P_epsilon \)$ with $bb(E)_epsilon epsilon_i P_epsilon = a x_i$, where $a > 0$ is controlled by cotype. Such lifts and finite-group averaging turn the slow decrease into bounded scalar functions with prescribed row and column moments. Their Fourier expansion is indexed by binary matrices and must contain an index of rank at least two over $bb(F)_2$. Such an index produces two independent Walsh factors. Iteration would then contradict the Hilbert-space bound for the same fixed operator. This proves uniform decay.

Second, we transfer that decay to the identity on $X$ using only AP. For each finite-dimensional $E subset X$, we construct a compact map $J : G arrow.r X$ of uniformly bounded norm and a contraction $iota : E arrow.r G$ with $J iota x = x$. The dual of $G$ has a controlled moment estimate (Lemma 11). The construction uses moment lifts in $X$, rather than assuming that the quotient $E^(*)$ inherits the cotype of $X^(*)$. AP gives finite-rank composites $S_j J$ converging to $J$ in operator norm. Uniform Walsh decay passes to $J$, and then to every finite Walsh input in $X$. Uniform copies of $ell_1^s$ would contradict that decay.

Section 2 introduces Walsh norms and the moment lifts. Section 3 proves the scalar coefficient lemma, and Section 4 turns it into uniform operator decay. Section 5 constructs the compact domains and proves Theorem 1 and Corollary 2. Section 6 gives the tensor-norm consequence.

== 2 Walsh transforms and moment lifts <sec:preliminaries>

We first introduce the operator norms that measure Walsh decay, then derive the moment lifts needed to compare those norms at different dimensions. Throughout, Banach spaces are real. All unspecified averages on finite sets are uniform, and distinct averaging variables are independent. The notation $B_Y$ means the closed unit ball of $Y$. For a finite probability space $Omega$, the space $L_p \( Omega \; Y \)$ has its probability-normalized norm. By contrast, $ell_2^m \( Y \)$ has norm $\( sum_(i = 1)^m parallel y_i parallel^2 \)^(1 \/ 2)$. Duality on finite probability spaces uses the expectation pairing; in particular,

$ L_2 \( Omega \; Y \)^(*) = L_2 \( Omega \; Y^(*) \) \,\
L_1 \( Omega \; Y \)^(*) = L_oo \( Omega \; Y^(*) \) \, #h(2em) L_oo \( Omega \; Y \)^(*) = L_1 \( Omega \; Y^(*) \) . $

=== 2.1 Walsh norms <walsh-norms>

Let $V_n = bb(F)_2^n$, with its standard dot pairing, and put $chi \( u \, v \) = \( - 1 \)^(u dot.op v)$. For $T : G arrow.r F$, define

$ \( W_n^T x \) \( v \) = bb(E)_(u in V_n) chi \( u \, v \) T x \( u \) \, #h(2em) w_n \( T \) = parallel W_n^T : L_2 \( V_n \; G \) arrow.r L_2 \( V_n \; F \) parallel . $

We allow $n = 0$, so $w_0 \( T \) = parallel T parallel$. Finite-sum duality gives the equivalent formula, with $x_u in G$ and $y_v in F^(*)$,

#[#set math.equation(numbering: n => "(2.1)")
 $ w_n \( T \) = sup lr(|bb(E)_(u \, v in V_n) chi \( u \, v \) y_v \( T x_u \)|) \, #h(2em) bb(E)_u parallel x_u parallel^2 lt.eq 1 \, quad bb(E)_v parallel y_v parallel^2 lt.eq 1 . $ <eq:walsh-bilinear>]

#thm([Lemma 2.1.])[
  (Basic Walsh estimates).  #emph[For every bounded $T : G arrow.r F$:]
  + #emph[$2^(- n \/ 2) parallel T parallel lt.eq w_n \( T \) lt.eq parallel T parallel$, and $w_n \( T \)$ is nonincreasing in $n$.]
  + #emph[If $T_Omega : L_2 \( Omega \; G \) arrow.r L_2 \( Omega \; F \)$ acts pointwise as $T$, where $Omega$ is finite, then $w_n \( T_Omega \) = w_n \( T \)$.]
  + #emph[If $T$ has finite rank, there is $D_T < oo$ such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ w_n \( T \) lt.eq D_T 2^(- n \/ 2) #h(2em) \( n gt.eq 0 \) . $ <eq:rank-dependent-decay>]

]
  #emph[Moreover, for $A \, B : G arrow.r F$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ \| w_n \( A \) - w_n \( B \) \| lt.eq parallel A - B parallel . $ <eq:walsh-continuity>]

]
] <lem:walsh-basic>

#proof[
  The upper bound follows from the triangle inequality and Cauchy–Schwarz; the lower bound follows by taking input supported at one $u$, scaled by $2^(n \/ 2)$. On $V_(n + j) = V_n xor V_j$, first apply $W_n^T$ in the first coordinate and then the normalized Walsh transform with the identity of $F$ in the second coordinate. The latter has norm at most $1$. Averaging the squared estimates in the unused coordinates proves monotonicity. Interchanging finite $L_2$ coordinates proves (ii), with constant functions on $Omega$ giving the reverse inequality. For (iii), factor a finite-rank $T$ as $G arrow.r H arrow.r F$, with $H$ a finite-dimensional Hilbert space. Orthogonality of the Walsh matrix gives $parallel W_n^(upright("Id")_H) parallel = 2^(- n \/ 2)$, proving (iii). Finally, $W_n^A - W_n^B = W_n^(A - B)$, so the upper bound in (i) and the reverse triangle inequality prove (2.3). ◻
]

=== 2.2 Fixed-length cotype estimates <fixed-length-cotype-estimates>

Define $c_m \( Y \)$ to be the least constant in

#[#set math.equation(numbering: n => "(2.4)")
 $ (sum_(i = 1)^m parallel y_i parallel^2)^(1 \/ 2) lt.eq c_m \( Y \) (bb(E)_epsilon ∥sum_(i = 1)^m epsilon_i y_i∥^2)^(1 \/ 2) . $ <eq:fixed-cotype>]

Thus, if $Y$ has cotype $q$ with constant $C_q \( Y \)$, then

#[#set math.equation(numbering: n => "(2.5)")
 $ c_m \( Y \) lt.eq C_q \( Y \) m^(1 \/ 2 - 1 \/ q) . $ <eq:fixed-from-cotype>]

Squaring (2.4) and averaging proves

#[#set math.equation(numbering: n => "(2.6)")
 $ c_m \( L_2 \( Omega \; Y \) \) lt.eq c_m \( Y \) . $ <eq:cotype-amplification>]

The same observation applies to duals of these finite $L_2$ sums.

The following estimate is the $L_1$-to-$L_2$ case of Kahane’s inequality; see [15] Theorem 8.1. We include a stopping-time proof with an explicit, sufficient constant so that the subsequent moment lifts are self-contained.

#thm([Lemma 2.2.])[
  (Moment comparison).  #emph[For every finite Rademacher sum $S = sum_(i = 1)^m epsilon_i z_i$ in a Banach space, 
#[#set math.equation(numbering: n => "(2.7)")
 $ \( bb(E) parallel S parallel^2 \)^(1 \/ 2) lt.eq L thin bb(E) parallel S parallel \, #h(2em) L = 24 . $ <eq:kahane>]

]
] <lem:kahane>

#proof[
  Put $M = bb(E) parallel S parallel$ and $b = max_i parallel z_i parallel$. Since $z_i = bb(E) \( epsilon_i S \)$, we have $b lt.eq M$. The case $M = 0$ is immediate.
  Let $S_j = sum_(i lt.eq j) epsilon_i z_i$, and stop at the first $j$ with $parallel S_j parallel > u$. Conditional on a stopped prefix $z$, the remaining sum is symmetric; at least one of $parallel z + h parallel$ and $parallel z - h parallel$ exceeds $u$. Hence
  $ bb(P) \( upright("a stop occurs") \) lt.eq 2 bb(P) \( parallel S parallel > u \) . $
  For any fixed $j$, symmetry of the independent prefix similarly gives
  $ bb(P) (∥sum_(i > j) epsilon_i z_i∥ > v) lt.eq 2 bb(P) \( parallel S parallel > v \) . $
  At the first stop, $parallel S_j parallel lt.eq u + b$. Decomposing according to its time and using independence of the remaining sum therefore yields
  $ bb(P) \( parallel S parallel > u + b + v \) lt.eq 4 bb(P) \( parallel S parallel > u \) bb(P) \( parallel S parallel > v \) . $
  Take $u = 8 M$. Markov’s inequality and $b lt.eq M$ imply
  $ bb(P) \( parallel S parallel > 9 M + v \) lt.eq 1 / 2 bb(P) \( parallel S parallel > v \) . $
  Thus $bb(P) \( parallel S parallel > 9 j M \) lt.eq 2^(- j)$ for $j gt.eq 0$, and integration over consecutive intervals of length $9 M$ gives
  $ bb(E) parallel S parallel^2 lt.eq 81 M^2 sum_(j gt.eq 0) \( 2 j + 1 \) 2^(- j) = 486 M^2 < 24^2 M^2 . $
  ◻
]

We will repeatedly use a simple consequence of quotient duality. If a bounded surjection $U : A arrow.r B$ satisfies $parallel U^(*) b^(*) parallel gt.eq D^(- 1) parallel b^(*) parallel$, then

#[#set math.equation(numbering: n => "(2.8)")
 $ inf_(U a = b) parallel a parallel lt.eq D parallel b parallel . $ <eq:quotient-lift>]

Indeed, $A \/ ker U$ is isomorphic to $B$, and its quotient norm at $b$ is

$ sup_(parallel U^(*) b^(*) parallel lt.eq 1) \| chevron.l b \, b^(*) chevron.r \| . $

In each application below surjectivity has an explicit bounded right inverse, so the quotient identification is immediate.

#thm([Lemma 2.3.])[
  (Bounded moment lifts).  #emph[Suppose 
$ c_m \( G^(*) \) lt.eq D_g \, #h(2em) c_m \( F \) lt.eq D_f \, #h(2em) D_g \, D_f gt.eq 1 . $

 Set 
#[#set math.equation(numbering: n => "(2.9)")
 $ a = frac(1, 2 L D_g sqrt(m)) \, #h(2em) b = frac(1, 2 L D_f sqrt(m)) . $ <eq:lift-parameters>]

 Then:]
  + #emph[For $x_1 \, dots.h \, x_m in B_G$, there are $P_epsilon in B_G$ such that 
$ bb(E)_epsilon epsilon_i P_epsilon = a x_i quad \( 1 lt.eq i lt.eq m \) . $

]
  + #emph[For $y_1 \, dots.h \, y_m in B_(F^(*))$, there are $Z_delta in B_(F^(*))$ such that 
$ bb(E)_delta delta_j Z_delta = b y_j quad \( 1 lt.eq j lt.eq m \) . $

]
  #emph[The same conclusions, with the same constants, hold after replacing $G \, F$ by finite $L_2$ sums of their copies.]
] <lem:lifts>

#proof[
  The moment map
  $ U : L_oo \( { - 1 \, 1 }^m \; G \) arrow.r ell_2^m \( G \) \, #h(2em) U P = \( bb(E)_epsilon epsilon_i P_epsilon \)_(i = 1)^m \, $
  is onto: a right inverse is $\( x_i \) mapsto sum_i epsilon_i x_i$. Its adjoint sends $\( z_i^(*) \)$ to $sum_i epsilon_i z_i^(*)$. By Lemma 4 and (2.4),
  $ parallel U^(*) \( z_i^(*) \) parallel_(L_1 \( G^(*) \)) gt.eq \( L D_g \)^(- 1) (sum_i parallel z_i^(*) parallel^2)^(1 \/ 2) . $
  Equation (2.8) bounds the infimal lift norm of $\( a x_i \)$ by $L D_g a sqrt(m) = 1 \/ 2$. A lift of norm at most $1$ therefore exists, proving (i).
  For (ii), the map
  $ V : ell_2^m \( F \) arrow.r L_1 \( { - 1 \, 1 }^m \; F \) \, #h(2em) V \( w_j \) = sum_j delta_j w_j \, $
  satisfies $parallel V w parallel_(L_1) gt.eq \( L D_f \)^(- 1) parallel w parallel_(ell_2^m \( F \))$. The functional
  $ V w mapsto b sum_j y_j \( w_j \) $
  has norm at most $b sqrt(m) thin L D_f = 1 \/ 2$ on its range. Hahn–Banach extends it to $L_1 \( F \)$ with the same norm. Representing the extension in $L_oo \( F^(*) \)$ gives $Z$ and the stated moments. The amplification assertion follows from (2.6) and finite-sum duality. ◻
]

== 3 A scalar Fourier-coefficient lemma <sec:coefficient>

For a function on a sign cube, write

$ cal(O) h \( z \) = frac(h \( z \) - h \( - z \), 2) \, $

where $- z$ negates every coordinate. We call $h$ odd if $cal(O) h = h$. Fourier coefficients always use uniform measure. For an $m times m$ sign matrix $S$ and a binary matrix $P in { 0 \, 1 }^(m times m)$, put

$ S^P = product_(i \, j) S_(i j)^(P_(i j)) \, #h(2em) hat(h) \( P \) = bb(E)_S h \( S \) S^P . $

For vector cubes we use binary indices $p in { 0 \, 1 }^m$; $\| p \|$ denotes the number of ones and $e_i$ the $i$-th unit vector. The notation $sigma S$ multiplies row $i$ by $sigma_i$, and $S tau$ multiplies column $j$ by $tau_j$. We denote row $i$ and column $j$ by $S_(i \, :)$ and $S_(: \, j)$, respectively. All ranks in this section are over $bb(F)_2$.

The point of the binary rank is the identity

$ product_(i \, j) chi \( u_i \, v_j \)^(P_(i j)) = \( - 1 \)^(sum_(i \, j) P_(i j) u_i dot.op v_j) \, #h(2em) u_i \, v_j in bb(F)_2^n . $

An index of rank $k$ yields $k$ independent bilinear terms after binary changes of variables. In Section 4, this will turn a nonzero coefficient into a Walsh pairing in $k$ times as many coordinates. We therefore need a coefficient whose index has rank at least two.

For example, take $S_(i j) = chi \( u_i \, v_j \)$ for $1 lt.eq i \, j lt.eq 3$. The two indices with an odd number of ones

$ P_1 = underbrace(mat(delim: "(", 1, 1, 1; 1, 1, 1; 1, 1, 1), upright("binary rank ") 1) \, #h(2em) S^(P_1) = chi \( u_1 + u_2 + u_3 \, v_1 + v_2 + v_3 \) \,\
P_2 = underbrace(mat(delim: "(", 1, 1, 0; 0, 1, 0; 0, 0, 0), upright("binary rank ") 2) \, #h(2em) S^(P_2) = chi \( u_1 \, v_1 + v_2 \) chi \( u_2 \, v_2 \) $

yield one and two Walsh factors, respectively: $v_1 + v_2$ and $v_2$ vary independently.

Rank-one indices have rectangular support. The next lemma rules out an expansion supported only on odd rectangles when both families of prescribed moments are large enough.

#thm([Lemma 3.1.])[
  (A coefficient of rank at least two).  #emph[Let $M_0 = 4$, and suppose that 
$ 4 lt.eq d = ceil.l 2 log_2 m ceil.r < m . $

 Let $a \, b > 0$, put $A = m a$, $B = m b$, and assume 
#[#set math.equation(numbering: n => "(3.1)")
 $ min \( A \, B \) gt.eq 20 M_0 d \( d + 1 \)^2 . $ <eq:large-parameters>]

 There is $c_(*) > 0$, depending only on $m \, a \, b$, with the following property. Suppose that 
$ Psi : { - 1 \, 1 }^(m times m) arrow.r bb(R) \, #h(2em) f \, g : { - 1 \, 1 }^m arrow.r bb(R) $

 are odd, have sup norms at most $M_0$, and satisfy 
#[#set math.equation(numbering: n => "(3.2)")
 $ hat(f) \( e_i \) = a \, #h(2em) hat(g) \( e_j \) = b $ <eq:scalar-first>]

 together with the projection identities 
#[#set math.equation(numbering: n => "(3.3)")
 $ bb(E)_sigma sigma_i Psi \( sigma S \) & = a thin g \( S_(i \, :) \) \,\
bb(E)_tau tau_j Psi \( S tau \) & = b thin f \( S_(: \, j) \) $ <eq:scalar-projections>]

 for all $i \, j \, S$. Then 
$ \| hat(Psi) \( P \) \| gt.eq c_(*) $

 for some binary matrix $P$ of rank at least two.]
] <lem:coefficient>

#proof[
  We first reduce the uniform lower bound to a nonvanishing assertion. If every index in the Fourier support of $Psi$ had rank at most one, a damped polynomial would encode their rectangular supports. Its prescribed mixed derivative will contradict a bound obtained by splitting it into two parts, each of low degree in one variable.
  The admissible triples $\( Psi \, f \, g \)$ form a compact set in a finite-dimensional space. The maximum of $\| hat(Psi) \( P \) \|$ over $"rank" P gt.eq 2$ is continuous. It therefore suffices to show that this maximum never vanishes. If the admissible set is empty, any positive $c_(*)$ will do.
  Suppose, to the contrary, that the Fourier support of $Psi$ has rank at most one. Oddness eliminates indices with an even number of ones. Every remaining index has a unique form $P = p h^t$ with $p \, h eq.not 0$, and both $k = \| p \|$ and $l = \| h \|$ are odd. Let
  $ C_(k l) = sum_(\| p \| = k\
\| h \| = l) hat(Psi) \( p h^t \) . $
  Parseval’s identity and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(3.4)")
   $ \| C_(k l) \| lt.eq M_0 sqrt(binom(m, k) binom(m, l)) . $ <eq:Ckl-bound>]
  To suppress rectangles that are large in both directions, consider the damped polynomial
  $ H \( s \, u \) = sum_(1 lt.eq k \, l lt.eq m\
k \, l med upright("odd")) C_(k l) s^k u^l 2^(- k l) . $
  It has sup norm at most $M_0$ on $\[ - 1 \, 1 \]^2$. To see this, take independent signs $D_i \, E_j \, R_(i j)$ with means $s \, u \, 1 \/ 2$, respectively, and set $S_(i j) = D_i E_j R_(i j)$. For an odd rectangle $p h^t$,
  $ bb(E) S^(p h^t) = s^(\| p \|) u^(\| h \|) 2^(- \| p \| \| h \|) \, $
  so $H \( s \, u \) = bb(E) Psi \( S \)$.
  Delete from $H$ the terms with both $k > d$ and $l > d$, obtaining $H_0$. If $k \, l > d$, then
  $ \( k + l \) log_2 m lt.eq k l \, #h(2em) k l \/ 2 gt.eq k + l . $
  Using (3.4), the deleted part is bounded in sup norm by
  $ M_0 sum_(k \, l > d) m^(\( k + l \) \/ 2) 2^(- k l) lt.eq M_0 sum_(k \, l > d) 2^(- k l \/ 2) lt.eq M_0 sum_(k \, l > d) 2^(- k - l) lt.eq M_0 . $
  Consequently $parallel H_0 parallel_oo lt.eq 2 M_0$.
  For an odd rectangle $p h^t$, the vectors of row and column parities are $p$ and $h$. Comparing Fourier coefficients in (3.3) therefore gives
  $ C_(1 l) = m a sum_(\| h \| = l) hat(g) \( h \) \, #h(2em) C_(k 1) = m b sum_(\| p \| = k) hat(f) \( p \) . $
  The deletion defining $H_0$ does not affect terms with $k = 1$ or $l = 1$. Hence
  #[#set math.equation(numbering: n => "(3.5)")
   $ partial_s H_0 \( 0 \, u \) & = A sum_h hat(g) \( h \) \( u \/ 2 \)^(\| h \|) \,\
partial_u H_0 \( s \, 0 \) & = B sum_p hat(f) \( p \) \( s \/ 2 \)^(\| p \|) \,\
partial_s partial_u H_0 \( 0 \, 0 \) & = A B \/ 2 . $ <eq:H-derivatives>]
  Independent signs of common mean $u \/ 2$, or $s \/ 2$, show that the first two expressions have sup norms at most $A M_0$ and $B M_0$.
  Every retained monomial has low degree in at least one variable. We separate these two possibilities with controlled sup norms. Expand $H_0$ in the Chebyshev basis $T_j \( s \)$, defined by $T_j \( cos theta \) = cos \( j theta \)$. Let $H_1$ retain the terms with $j lt.eq d$, and set $H_2 = H_0 - H_1$. Then
  #[#set math.equation(numbering: n => "(3.6)")
   $ deg_s H_1 lt.eq d \, #h(2em) deg_u H_2 lt.eq d . $ <eq:separate-degrees>]
  Indeed, every monomial of $H_0$ has $s$-degree at most $d$ or $u$-degree at most $d$, and truncation in the Chebyshev basis annihilates every monomial of the former kind in $H_2$.
  Each Chebyshev coefficient of a polynomial on $\[ - 1 \, 1 \]$ is bounded by twice its sup norm, by cosine orthogonality. Since $\| T_j \| lt.eq 1$,
  $ parallel H_1 parallel_oo lt.eq 4 M_0 \( d + 1 \) \, #h(2em) parallel H_2 parallel_oo lt.eq 6 M_0 \( d + 1 \) . $
  Also, $\| T'_j \( 0 \) \| lt.eq j$, so every polynomial $Q$ of degree at most $d$ satisfies
  #[#set math.equation(numbering: n => "(3.7)")
   $ \| Q' \( 0 \) \| lt.eq d \( d + 1 \) parallel Q parallel_oo . $ <eq:derivative-bound>]
  First apply (3.7) in $s$ to $H_1$, and in $u$ to $H_2$. Then (3.5) implies
  $ parallel partial_s H_2 \( 0 \, dot.op \) parallel_oo & lt.eq A M_0 + 4 M_0 d \( d + 1 \)^2 \,\
parallel partial_u H_1 \( dot.op \, 0 \) parallel_oo & lt.eq B M_0 + 6 M_0 d \( d + 1 \)^2 . $
  By (3.6), these are polynomials of degree at most $d$ in their displayed variables. Applying (3.7) once more and adding yields
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| partial_s partial_u H_0 \( 0 \, 0 \) \| lt.eq M_0 d \( d + 1 \) #scale(x: 120%, y: 120%)[\(] A + B + 10 d \( d + 1 \)^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:mixed-upper>]
  On the other hand, (3.1) gives
  $ frac(A B, 2) gt.eq 5 M_0 d \( d + 1 \)^2 \( A + B \) \, #h(2em) 10 d \( d + 1 \)^2 lt.eq frac(A + B, 4 M_0) . $
  Since $5 \( d + 1 \) > 1 + 1 \/ \( 4 M_0 \)$, these inequalities contradict (3.5) and (3.8). ◻
]

== 4 Uniform Walsh decay for finite-rank operators <sec:walsh>

=== 4.1 Dimension growth <dimension-growth>

We now show that a slow decrease of Walsh norms forces a large Walsh norm at almost twice the original index. The proof uses the scalar coefficient lemma to find several independent Walsh factors inside a single pairing. To make that lemma applicable, we first arrange that our pairings depend only on their matrices of signs. The initial Walsh test is indexed by vectors, whereas the scalar lemma concerns arbitrary sign matrices; the frame construction below removes the extra dependence on the vectors.

An ordered linearly independent tuple in $V_n$ will be called a #emph[frame]. We identify covectors with vectors through the dot pairing. Independence is required separately on the two sides.

#thm([Lemma 4.1.])[
  (Pairs of frames).  #emph[The action 
$ \( U \, V \) mapsto \( H U \, H^(- t) V \) \, #h(2em) H in upright("GL") \( n \, bb(F)_2 \) \, $

 is transitive on pairs of frames of fixed lengths with a prescribed matrix of pairings $\( u_i dot.op v_j \)$. Every binary $r times s$ matrix is such a pairing matrix if $n gt.eq r + s$.]
] <lem:frames>

#proof[
  Consider two pairs $\( U \, V \)$, $\( U' \, V' \)$ with the same pairing matrix. The covector frames define surjections $pi \, pi' : V_n arrow.r bb(F)_2^s$. The isomorphism $u_i mapsto u'_i$ between the primal spans respects evaluation, and hence maps $"span" \( U \) ∩ ker pi$ onto $"span" \( U' \) ∩ ker pi'$. Extend this restriction to an isomorphism between the two kernels. Together with the map on the primal spans, it defines an isomorphism
  $ "span" \( U \) + ker pi arrow.r "span" \( U' \) + ker pi' $
  satisfying $pi' H = pi$. Complete it to an invertible map of $V_n$ by choosing matching lifts of a basis complementary to the common evaluation image $pi \( "span" \( U \) \) = pi' \( "span" \( U' \) \)$. Then $H U = U'$ and $pi' H = pi$, the latter being equivalent to $H^(- t) V = V'$. For feasibility in dimension $r + s$, given a matrix $D$, take $u_i = \( e_i \, 0 \)$ and $v_j = \( D_(: \, j) \, e_j \)$. ◻
]

#thm([Lemma 4.2.])[
  (Growth from a slow decrease).  #emph[Fix an integer $m gt.eq 1$ and constants $D_g \, D_f gt.eq 1$. Suppose that $m$ and the parameters $a \, b$ in (2.9) satisfy the hypotheses of Lemma 6. There is $c_1 in \( 0 \, 1 \/ 2 \]$, depending only on these parameters, such that the following holds. If 
$ c_m \( G^(*) \) lt.eq D_g \, #h(2em) c_m \( F \) lt.eq D_f \, #h(2em) 0 eq.not T : G arrow.r F \, $

 and $n > 4 m$ satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ w_(n - 2 m) \( T \) lt.eq 2 w_n \( T \) \, $ <eq:slow-decrease>]

 then 
#[#set math.equation(numbering: n => "(4.2)")
 $ w_(2 \( n - 2 m \)) \( T \) gt.eq c_1 w_n \( T \) . $ <eq:growth>]

 The operator $T$ need not have finite rank.]
] <lem:growth>

#proof[
  Put $n' = n - 2 m$. We will turn a Walsh test at index $n$ into bounded scalar functions satisfying Lemma 6. A coefficient of binary rank $k gt.eq 2$ will then give a Walsh test at index $k n'$.
  #emph[Step 1: realize the Walsh signs exactly and equivariantly.] Choose families $p_u in G$, $q_v in F^(*)$ admissible in (2.1), changing a sign if necessary, such that
  $ gamma = bb(E)_(u \, v) chi \( u \, v \) q_v \( T p_u \) gt.eq w_n \( T \) \/ 2 > 0 . $
  Amplify $T$ over $V_n times V_n$, and define
  $ x'_u \( alpha \, beta \) = \( - 1 \)^(u dot.op beta + alpha dot.op beta) p_(u + alpha) \, #h(2em) y'_v \( alpha \, beta \) = \( - 1 \)^(alpha dot.op v) q_(v + beta) . $
  Uniform translation shows that every $x'_u$ and $y'_v$ has norm at most one in the corresponding finite $L_2$ space. Writing $T'$ for the amplified operator, we obtain
  $ y'_v \( T' x'_u \) = gamma chi \( u \, v \) . $
  Indeed, the pairing includes expectation over $alpha \, beta$, and its phase is
  $ u dot.op beta + alpha dot.op beta + alpha dot.op v = \( u + alpha \) dot.op \( v + beta \) + u dot.op v . $
  Amplify once more over $cal(G) = upright("GL") \( n \, bb(F)_2 \)$, obtaining $tilde(T) : tilde(G) arrow.r tilde(F)$, and set
  $ x_u \( R \) = x'_(R u) \, #h(2em) y_v \( R \) = y'_(R^(- t) v) . $
  For the bilinear form $B \( x \, y \) = y \( tilde(T) x \)$, this gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ x_u in B_(tilde(G)) \, quad y_v in B_(tilde(F)^(*)) \, #h(2em) B \( x_u \, y_v \) = gamma chi \( u \, v \) . $ <eq:exact-pairing>]
  Use the same right translations $Lambda \( H \) z \( R \) = z \( R H \)$ on the domain and target dual. They are isometries, preserve $B$ under simultaneous translation, and satisfy
  $ Lambda \( H \) x_u = x_(H u) \, #h(2em) Lambda \( H \) y_v = y_(H^(- t) v) \, #h(2em) Lambda \( H_1 \) Lambda \( H_2 \) = Lambda \( H_1 H_2 \) . $
  The orders follow directly from $\( R H \)^(- t) = R^(- t) H^(- t)$. By Lemma 3, $w_j \( tilde(T) \) = w_j \( T \)$ for every $j$. Equation (2.6) also preserves the bounds $D_g \, D_f$, so the moment lifts remain available with the same $a \, b$.
  #emph[Step 2: lift frames while preserving the symmetry.] For every primal $m$-frame $U = \( u_i \)_(i = 1)^m$, choose $P_(U \, epsilon) in B_(tilde(G))$ with
  $ bb(E)_epsilon epsilon_i P_(U \, epsilon) = a x_(u_i) . $
  We can make these choices equivariant. For one reference frame, take the lifts from Lemma 5 and average each of them over its stabilizer under $Lambda$. The prescribed moments are fixed by this stabilizer, and the averaged lifts are stabilizer-invariant. Transport them to any other frame by $Lambda \( H \)$. Two transporters differ on the right by a stabilizer element, so the result is well-defined and equivariant.
  The same construction for covector frames, using the action $H^(- t)$, gives $Z_(V \, delta) in B_(tilde(F)^(*))$ with
  $ bb(E)_delta delta_j Z_(V \, delta) = b y_(v_j) . $
  The two systems of lifts can be chosen independently. Their equivariance, invariance of $B$, and Lemma 7 show that the following pairings depend only on the displayed sign patterns and lift labels:
  #[#set math.equation(numbering: n => "(4.4)")
   $ Phi \( S \, epsilon \, delta \) & = B \( P_(U \, epsilon) \, Z_(V \, delta) \) \, & S_(i j) & = chi \( u_i \, v_j \) \,\
phi.alt \( s \, epsilon \) & = B \( P_(U \, epsilon) \, y_v \) \, & s_i & = chi \( u_i \, v \) \, quad v eq.not 0 \,\
psi \( t \, delta \) & = B \( x_u \, Z_(V \, delta) \) \, & t_j & = chi \( u \, v_j \) \, quad u eq.not 0 . $ <eq:three-functions>]
  All patterns are feasible since $n > 4 m$. The moment identities and (4.3) give
  #[#set math.equation(numbering: n => "(4.5)")
   $ bb(E)_epsilon epsilon_i Phi \( S \, epsilon \, delta \) & = a psi \( S_(i \, :) \, delta \) \, & bb(E)_delta delta_j Phi \( S \, epsilon \, delta \) & = b phi.alt \( S_(: \, j) \, epsilon \) \,\
bb(E)_epsilon epsilon_i phi.alt \( s \, epsilon \) & = a gamma s_i \, & bb(E)_delta delta_j psi \( t \, delta \) & = b gamma t_j . $ <eq:three-moments>]
  #emph[Step 3: control the odd parts on a smaller Walsh cube.] We need a bound that remains useful after division by $gamma$. For every fixed choice of lift labels, we claim that
  #[#set math.equation(numbering: n => "(4.6)")
   $ parallel cal(O)_S Phi \( dot.op \, epsilon \, delta \) parallel_oo \, quad parallel cal(O)_s phi.alt \( dot.op \, epsilon \) parallel_oo \, quad parallel cal(O)_t psi \( dot.op \, delta \) parallel_oo lt.eq w_(n') \( T \) . $ <eq:odd-bounds>]
  Decompose $V_n = V_(n') xor bb(F)_2^m xor bb(F)_2^m$, and fix a sign matrix $S_0 = \( \( - 1 \)^(D_(i j)) \)$. For $u \, v in V_(n')$, take the primal frame
  $ U \( u \)_i = \( u \, e_i \, 0 \) $
  and the two covector frames
  $ V^(+) \( v \)_j = \( v \, D_(: \, j) \, e_j \) \, #h(2em) V^(-) \( v \)_j = \( v \, D_(: \, j) + upright(bold(1)) \, e_j \) \, $
  where $upright(bold(1)) in bb(F)_2^m$ is the all-ones vector. The tags $e_i \, e_j$ ensure independence for every $u \, v$. Their sign matrices are $chi \( u \, v \) S_0$ and $- chi \( u \, v \) S_0$, so
  $ B (P_(U \( u \) \, epsilon) \, frac(Z_(V^(+) \( v \) \, delta) - Z_(V^(-) \( v \) \, delta), 2)) = chi \( u \, v \) \( cal(O)_S Phi \) \( S_0 \, epsilon \, delta \) . $
  Both vector families lie in their respective unit balls, and each depends only on its own Walsh index. Testing (2.1) at $n'$, and using amplification invariance, proves the first bound.
  For $phi.alt$, retain $U \( u \)$ and use the nonzero covectors $\( v \, h \, e_1 \)$, $\( v \, h + upright(bold(1)) \, e_1 \)$, where $s_i = \( - 1 \)^(h_i)$. Half the difference of the corresponding $y$’s gives the same calculation. For $psi$, use the covector frame $\( v \, 0 \, e_j \)$ and half the difference of the primal vectors at $\( u \, e_1 \, h \)$, $\( u \, e_1 \, h + upright(bold(1)) \)$. Their pairings are $chi \( u \, v \) \( - 1 \)^(h_j)$ and its negative. The $e_1$ tags keep the singleton vectors nonzero. This proves (4.6).
  #emph[Step 4: find a Fourier coefficient of binary rank at least two.] Define
  #[#set math.equation(numbering: n => "(4.7)")
   $ f \( s \) & = gamma^(- 1) cal(O)_s bb(E)_epsilon phi.alt \( epsilon s \, epsilon \) \,\
g \( t \) & = gamma^(- 1) cal(O)_t bb(E)_delta psi \( delta t \, delta \) \,\
Psi \( S \) & = gamma^(- 1) cal(O)_S bb(E)_(epsilon \, delta) Phi \( epsilon S delta \, epsilon \, delta \) . $ <eq:normalized-functions>]
  These functions are odd, and the slow-decrease hypothesis gives
  $ max \( parallel f parallel_oo \, parallel g parallel_oo \, parallel Psi parallel_oo \) lt.eq w_(n - 2 m) \( T \) \/ gamma lt.eq 4 . $
  Changing variables $s' = epsilon s$ in the first coefficient and using (4.5), we obtain
  $ hat(f) \( e_i \) = gamma^(- 1) bb(E)_(s' \, epsilon) s'_i epsilon_i phi.alt \( s' \, epsilon \) = a . $
  The odd projection leaves this coefficient unchanged. Likewise, $hat(g) \( e_j \) = b$.
  We next check the row and column projections required by Lemma 6. A first row projection is unchanged by applying global odd projection, since
  $ bb(E)_sigma sigma_i h \( - sigma S \) = - bb(E)_sigma sigma_i h \( sigma S \) . $
  Substitute $xi = epsilon sigma$; then $xi \, epsilon \, delta$ are still independent uniform sign vectors. By (4.5),
  $ gamma bb(E)_sigma sigma_i Psi \( sigma S \) & = bb(E)_(xi \, epsilon \, delta) xi_i epsilon_i Phi \( xi S delta \, epsilon \, delta \)\
 & = a thin bb(E)_(xi \, delta) xi_i psi \( xi_i \( delta S_(i \, :) \) \, delta \)\
 & = a thin bb(E)_delta frac(psi \( delta S_(i \, :) \, delta \) - psi \( - delta S_(i \, :) \, delta \), 2)\
 & = a gamma thin g \( S_(i \, :) \) . $
  Interchanging rows and columns, and simultaneously $\( a \, epsilon \, phi.alt \)$ with $\( b \, delta \, psi \)$, gives $bb(E)_tau tau_j Psi \( S tau \) = b f \( S_(: \, j) \)$. Thus all hypotheses of Lemma 6 hold, with the fixed parameters $m \, a \, b$.
  Choose a binary matrix $P$ of rank $k gt.eq 2$ with $\| hat(Psi) \( P \) \| gt.eq c_(*)$. Since $Psi$ is odd and this coefficient is nonzero, the total number of ones in $P$ is odd. Its coefficient is therefore unchanged when the odd projection is removed from (4.7). Writing $Phi_(epsilon \, delta) \( S \) = Phi \( S \, epsilon \, delta \)$, row and column sign multiplication gives the exact identity
  $ gamma hat(Psi) \( P \) = bb(E)_(epsilon \, delta) [(product_(i \, j) \( epsilon_i delta_j \)^(P_(i j))) hat(Phi_(epsilon \, delta)) \( P \)] . $
  For some fixed $epsilon \, delta$, therefore, $h = Phi_(epsilon \, delta)$ satisfies
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| hat(h) \( P \) \| gt.eq c_(*) gamma . $ <eq:h-coefficient>]
  No oddness assertion about this individual function $h$ is needed.
  #emph[Step 5: extract the independent Walsh factors.] Keep $P \, epsilon \, delta$ fixed. For arbitrary tuples $\( u'_i \)_(i = 1)^m$, $\( v'_j \)_(j = 1)^m$ in $V_(n')$, set
  $ U_i = \( u'_i \, e_i \, 0 \) \, #h(2em) V \( D \)_j = \( v'_j \, D_(: \, j) \, e_j \) \, $
  where $D$ ranges over binary $m times m$ matrices. The tagged tuples are frames even if the original tuples have repeated or zero entries. The Fourier coefficient formula gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ B (P_(U \, epsilon) \, bb(E)_D \( - 1 \)^(chevron.l P \, D chevron.r) Z_(V \( D \) \, delta)) = hat(h) \( P \) \( - 1 \)^(sum_(i \, j) P_(i j) u'_i dot.op v'_j) \, $ <eq:coefficient-extraction>]
  where $chevron.l P \, D chevron.r = sum_(i \, j) P_(i j) D_(i j)$ is computed modulo two. Indeed, translate the uniform matrix $D$ by $\( u'_i dot.op v'_j \)_(i j)$ in the defining Fourier average. Both vectors in (4.9) have norm at most one. The first depends only on the $u'$-tuple, and the second only on the $v'$-tuple.
  Since $"rank"_(bb(F)_2) P = k$, choose binary $m times k$ matrices $I \, J$ with $I^t P J = upright("Id")_k$. For $zeta \, eta in \( V_(n') \)^k$, substitute
  $ u'_i = sum_(ell = 1)^k I_(i ell) zeta_ell \, #h(2em) v'_j = sum_(ell = 1)^k J_(j ell) eta_ell . $
  The exponent in (4.9) becomes $sum_(ell = 1)^k zeta_ell dot.op eta_ell$. We have thus obtained a Walsh test on $V_(k n')$, of amplitude $hat(h) \( P \)$, with separate unit-ball families on its two sides. Monotonicity and amplification invariance now yield
  $ w_(2 n') \( T \) gt.eq w_(k n') \( T \) = w_(k n') \( tilde(T) \) gt.eq \| hat(h) \( P \) \| gt.eq \( c_(*) \/ 2 \) w_n \( T \) . $
  Taking $c_1 = min \( 1 \/ 2 \, c_(*) \/ 2 \)$ proves the lemma. ◻
]

=== 4.2 Uniform decay <uniform-decay>

The growth lemma turns a sufficiently late slow decrease into an infinite sequence of slow decreases for the same operator. For a finite-rank operator, this would contradict its Hilbert-space bound. This is the only point at which finite rank is used.

#thm([Theorem 4.3.])[
  (Uniform finite-rank decay).  #emph[Fix $m \, D_g \, D_f$ satisfying the assumptions of Lemma 8. There is an integer $n_0$, depending only on these parameters, such that every finite-rank $T : G arrow.r F$ with $c_m \( G^(*) \) lt.eq D_g$ and $c_m \( F \) lt.eq D_f$ satisfies 
#[#set math.equation(numbering: n => "(4.10)")
 $ w_n \( T \) lt.eq 1 / 2 w_(n - 2 m) \( T \) #h(2em) \( n gt.eq n_0 \) . $ <eq:uniform-drop>]

 In particular there are numbers $rho_N arrow.r 0$, independent of $G \, F \, T$, such that 
#[#set math.equation(numbering: n => "(4.11)")
 $ w_N \( T \) lt.eq rho_N parallel T parallel . $ <eq:uniform-decay>]

 Both bounds also hold for every $T : G arrow.r F$ that is an operator-norm limit of finite-rank maps, under the same moment hypotheses on $G^(*)$ and $F$.]
] <thm:uniform-decay>

#proof[
  Let $c_1$ be given by Lemma 8. Choose an integer $K > log_2 \( 1 \/ c_1 \)$, and put
  $ n_0 = 4 m \( K + 2 \) + 2 . $
  Fix a nonzero finite-rank $T$, and suppose that (4.1) holds at some $n gt.eq n_0$. The growth lemma gives
  $ w_(2 n - 4 m) \( T \) gt.eq c_1 w_n \( T \) . $
  By monotonicity, the same lower bound holds throughout $\[ n \, 2 n - 4 m \]$.
  Set $a_n = ceil.l 3 n \/ 2 ceil.r$. The $K$ consecutive blocks
  $ \[ a_n + 2 m \( j - 1 \) \, thin a_n + 2 m j \] #h(2em) \( 1 lt.eq j lt.eq K \) $
  fit in this interval, since $2 n - a_n = floor.l n \/ 2 floor.r gt.eq 2 m K + 4 m + 1$. Their endpoint ratios telescope:
  $ product_(j = 1)^K frac(w_(a_n + 2 m \( j - 1 \)) \( T \), w_(a_n + 2 m j) \( T \)) = frac(w_(a_n) \( T \), w_(a_n + 2 m K) \( T \)) lt.eq 1 / c_1 . $
  Since $2^K > 1 \/ c_1$, one right endpoint $t$ satisfies
  $ w_(t - 2 m) \( T \) lt.eq 2 w_t \( T \) \, #h(2em) t gt.eq 3 n \/ 2 \, #h(2em) w_t \( T \) gt.eq c_1 w_n \( T \) . $
  We can repeat the argument at $t$. Every application of the growth lemma returns an inequality for the original $T$; its auxiliary amplifications are discarded. We therefore obtain indices $n_j gt.eq \( 3 \/ 2 \)^j n$ with $w_(n_j) \( T \) gt.eq c_1^j w_n \( T \) > 0$. The rank-dependent estimate (2.2), for this one fixed operator, implies
  $ 0 < w_n \( T \) lt.eq D_T c_1^(- j) 2^(- n_j \/ 2) arrow.r 0 \, $
  a contradiction. Thus (4.1) is impossible for $n gt.eq n_0$, proving the strict form of (4.10) for nonzero finite-rank $T$. The zero operator satisfies the asserted weak inequality.
  Iteration proves (4.11); for example, take
  $ rho_N = cases(delim: "{", 1 \, & N < n_0 \,, 2^(- floor.l \( N - n_0 \) \/ \( 2 m \) floor.r) \, & N gt.eq n_0 .) $
  Finally, if finite-rank maps $T_j$ converge in operator norm to $T$, then (2.3) gives $w_s \( T_j \) arrow.r w_s \( T \)$ for every $s$, while $parallel T_j parallel arrow.r parallel T parallel$. Passing to the limit proves both estimates for $T$. ◻
]

#prodef([Remark 4.4.])[
  The constant $D_T$ may depend on the operator rank. It is used only to rule out an infinite sequence of slowly decreasing indices for one fixed operator; the resulting $n_0$ and $rho_N$ depend only on the fixed moment parameters. The binary ranks of Fourier indices in Lemmas 6 and 8 play a different role: they count the independent Walsh factors extracted from a coefficient.
]

== 5 Compact factorization and the approximation property <sec:approximation>

We now transfer Walsh decay to the identity of $X$. The approximation property will let us apply Theorem 9 to compact maps into $X$. We therefore factor the inclusion of each finite-dimensional $E subset X$ through a compact map whose domain dual has a controlled moment estimate. Using $E$ itself as the domain would not suffice: the quotient $E^(*)$ of $X^(*)$ need not inherit the cotype estimate of $X^(*)$. Instead, we enlarge $E$ to retain the moment lifts available in $X$, and use decreasing weights to obtain compactness.

#thm([Lemma 5.1.])[
  (A compact domain with controlled dual moments).  #emph[Let $m gt.eq 1$ be an integer, let $Delta gt.eq 1$, and let $X$ be a Banach space with $c_m \( X^(*) \) lt.eq Delta$. For every nonzero finite-dimensional subspace $E subset X$, there exist a Banach space $G$, an injective compact operator $J : G arrow.r X$, and a contraction $iota : E arrow.r G$, such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ J iota x = x quad \( x in E \) \, #h(2em) parallel J parallel lt.eq 2 \, #h(2em) c_m \( G^(*) \) lt.eq 12 Delta . $ <eq:compact-domain>]

]
] <lem:compact-domain>

#proof[
  #emph[Finite-dimensional enlargements.] We construct nested finite-dimensional subspaces
  $ E = E_0 subset E_1 subset E_2 subset dots.h.c subset X $
  such that each $z = \( z_i \)_(i = 1)^m in ell_2^m \( E_l \)$ has a lift $H_l : { - 1 \, 1 }^m arrow.r E_(l + 1)$ satisfying
  #[#set math.equation(numbering: n => "(5.2)")
   $ bb(E)_epsilon epsilon_i H_l \( epsilon \) = z_i \, #h(2em) parallel H_l parallel_(L_2 \( E_(l + 1) \)) lt.eq 3 Delta parallel z parallel_(ell_2^m \( E_l \)) . $ <eq:finite-level-lift>]
  First take moments in the whole space $X$. The map
  $ U : L_2 \( { - 1 \, 1 }^m \; X \) arrow.r ell_2^m \( X \) \, #h(2em) U H = \( bb(E)_epsilon epsilon_i H \( epsilon \) \)_i \, $
  has the bounded right inverse $\( z_i \) mapsto sum_i epsilon_i z_i$, and
  $ parallel U^(*) \( theta_i \) parallel_(L_2 \( X^(*) \)) = (bb(E)_epsilon ∥sum_i epsilon_i theta_i∥^2)^(1 \/ 2) gt.eq Delta^(- 1) parallel \( theta_i \) parallel_(ell_2^m \( X^(*) \)) . $
  By (2.8), the infimal lift norm of a unit tuple is at most $Delta$, so a lift of norm below $2 Delta$ exists. Take a finite $eta$-net on the unit sphere of $ell_2^m \( E_l \)$, where $0 < eta lt.eq min \( 1 \/ 2 \, Delta \/ sqrt(m) \)$, and choose such a lift for each net point. Let $E_(l + 1)$ be the span of $E_l$ and all the values of these finitely many lifts.
  For any unit tuple $z in ell_2^m \( E_l \)$, choose a net point $v$ with $parallel z - v parallel_(ell_2^m \( X \)) lt.eq eta$. Add $sum_i epsilon_i \( z_i - v_i \)$ to its lift. This corrects the moments exactly and adds at most
  $ ∥sum_i epsilon_i \( z_i - v_i \)∥_(L_2 \( X \)) lt.eq sqrt(m) thin parallel z - v parallel_(ell_2^m \( X \)) lt.eq Delta $
  to the norm. This proves (5.2) for unit tuples; scaling and the zero lift cover the other cases.
  #emph[The compact map.] Put
  $ cal(H) = (xor.big_(l = 0)^oo E_l)_(ell_2) \, #h(2em) j : cal(H) arrow.r X \, #h(2em) j \( z \) = sum_(l gt.eq 0) 2^(- l) z_l . $
  Cauchy–Schwarz proves absolute convergence of the series and gives
  $ parallel j parallel lt.eq (sum_(l gt.eq 0) 4^(- l))^(1 \/ 2) < 2 . $
  The same estimate on the tails shows that the finite-rank truncations converge in operator norm. Thus $j$ is compact. Let $G = cal(H) \/ ker j$, with quotient map $Q$, and define $J$ by $J Q = j$. The kernel is closed, so $G$ is Banach; the quotient norm gives $parallel J parallel lt.eq parallel j parallel < 2$, and $J$ is injective. Every element of $B_G$ has a representative in $2 B_(cal(H))$. Hence $J \( B_G \) subset j \( 2 B_(cal(H)) \)$ is relatively compact, which proves compactness of $J$. Finally, $iota \( x \) = Q \( x \, 0 \, 0 \, dots.h \)$ is a contraction and $J iota x = x$. The finite-rank truncations of $j$ need not annihilate $ker j$, so they need not induce operators on $G$. Thus this compactness argument does not itself approximate $J$ by finite-rank maps; that passage will use the approximation property of $X$.
  #emph[Dual moments from the weighted shift.] The nesting of the $E_l$’s makes
  $ R : cal(H) arrow.r cal(H) \, #h(2em) R \( z_0 \, z_1 \, dots.h \) = \( 0 \, 2 z_0 \, 2 z_1 \, dots.h \) $
  a bounded map. The factor $2$ compensates for the next dyadic weight, so $j R = j$ and therefore $Q R = Q$. This identity lets us assemble the finite-level lifts into exact moment lifts in $G$.
  For $g_1 \, dots.h \, g_m in G$, choose representatives $z^i = \( z_l^i \)_l in cal(H)$ with $Q z^i = g_i$ and $parallel z^i parallel lt.eq 2 parallel g_i parallel$, taking $z^i = 0$ when $g_i = 0$. Use (5.2) on each tuple $\( z_l^i \)_i$, and set
  $ tilde(H) \( epsilon \) = \( 0 \, 2 H_0 \( epsilon \) \, 2 H_1 \( epsilon \) \, dots.h \) . $
  Summing squared estimates yields
  $ parallel tilde(H) parallel_(L_2 \( cal(H) \)) lt.eq 6 Delta (sum_i parallel z^i parallel^2)^(1 \/ 2) lt.eq 12 Delta (sum_i parallel g_i parallel^2)^(1 \/ 2) . $
  Every atom of the sign cube has positive mass, so this estimate also shows that $tilde(H) \( epsilon \) in cal(H)$ for every $epsilon$. Its $i$-th moment is $R z^i$. Since $Q R = Q$,
  $ bb(E)_epsilon epsilon_i Q tilde(H) \( epsilon \) = Q R z^i = Q z^i = g_i . $
  For $theta_1 \, dots.h \, theta_m in G^(*)$, it follows that
  $ lr(|sum_i theta_i \( g_i \)|) & = lr(|bb(E)_epsilon ⟨Q tilde(H) \( epsilon \) \, sum_i epsilon_i theta_i⟩|)\
 & lt.eq 12 Delta (sum_i parallel g_i parallel^2)^(1 \/ 2) (bb(E)_epsilon ∥sum_i epsilon_i theta_i∥^2)^(1 \/ 2) . $
  Taking the supremum over $sum_i parallel g_i parallel^2 lt.eq 1$ gives $c_m \( G^(*) \) lt.eq 12 Delta$ by finite $ell_2$ duality. ◻
]

We now complete the proof of the main theorem.

#proof[
  First suppose $K \( X \) < oo$. On each finite cube, the adjoint of the Rademacher projection on $L_2 \( X \)$ is the corresponding projection on $L_2 \( X^(*) \)$. Therefore $K \( X^(*) \) = K \( X \)$. By the classical characterization recalled in the introduction, both $X$ and $X^(*)$ have type strictly greater than one.
  If a space $Y$ has type $p > 1$, with constant $D$, then $Y^(*)$ has cotype $p' = p \/ \( p - 1 \)$. Indeed, for finite tuples $y_i in Y$, $y_i^(*) in Y^(*)$,
  $ lr(|sum_i y_i^(*) \( y_i \)|) & = lr(|bb(E)_epsilon ⟨sum_i epsilon_i y_i \, sum_i epsilon_i y_i^(*)⟩|)\
 & lt.eq D (sum_i parallel y_i parallel^p)^(1 \/ p) (bb(E)_epsilon ∥sum_i epsilon_i y_i^(*)∥^2)^(1 \/ 2) . $
  Taking the supremum over the unit ball of $ell_p^m \( Y \)$ proves the claim. Apply it to $Y = X$ and $Y = X^(*)$, and restrict the resulting cotype inequality on $X^(* *)$ to $X$. This direction does not use the approximation property.
  Conversely, suppose that $X$ has the approximation property and
  $ C_q \( X \) lt.eq C_F \, #h(2em) C_r \( X^(*) \) lt.eq C_Y $
  for finite $q \, r gt.eq 2$ and finite constants $C_F \, C_Y gt.eq 1$. For an integer $m$, set
  $ D_f = C_F m^(1 \/ 2 - 1 \/ q) \, #h(2em) Delta = C_Y m^(1 \/ 2 - 1 \/ r) \, #h(2em) D_g = 12 Delta . $
  The parameters in (2.9) then satisfy
  $ m a = frac(m^(1 \/ r), 24 L C_Y) \, #h(2em) m b = frac(m^(1 \/ q), 2 L C_F) . $
  These positive powers of $m$ eventually exceed any fixed multiple of $\( log m \)^3$. Choose $m$ once so that the hypotheses of Lemma 6 hold, and fix the decay sequence $rho_N$ given by Theorem 9 for $m \, D_g \, D_f$. All these parameters are independent of the finite-dimensional subspaces and approximating operators chosen below.
  We first show that
  #[#set math.equation(numbering: n => "(5.3)")
   $ w_N \( upright("Id")_X \) lt.eq 2 rho_N #h(2em) \( N gt.eq 0 \) . $ <eq:identity-walsh-decay>]
  For a nonzero finite-dimensional $E subset X$, choose $J : G arrow.r X$ and $iota : E arrow.r G$ by Lemma 11. Apply the approximation property to the compact set $M = overline(J \( B_G \))$. For every $j gt.eq 1$, it supplies a bounded finite-rank map $S_j : X arrow.r X$ such that
  $ parallel S_j J - J parallel lt.eq sup_(x in M) parallel S_j x - x parallel < 1 \/ j . $
  Thus $J$ is an operator-norm limit of finite-rank maps from $G$ to $X$. Since $c_m \( G^(*) \) lt.eq D_g$ and $c_m \( X \) lt.eq D_f$, the norm-limit assertion of Theorem 9 gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ w_N \( J \) lt.eq rho_N parallel J parallel lt.eq 2 rho_N . $ <eq:compact-walsh-decay>]
  Only the composites $S_j J$ converge in operator norm; no common bound on $parallel S_j parallel$ is required.
  Now fix any input $x = \( x_u \)_(u in V_N) in L_2 \( V_N \; X \)$. If $x = 0$, there is nothing to prove. Otherwise take $E = "span" { x_u : u in V_N }$ and choose the corresponding $J \, iota$. The family $z_u = iota \( x_u \)$ satisfies $parallel z parallel_(L_2 \( G \)) lt.eq parallel x parallel_(L_2 \( X \))$ and $J z_u = x_u$. Consequently,
  $ parallel W_N^(upright("Id")_X) x parallel_(L_2 \( X \)) = parallel W_N^J z parallel_(L_2 \( X \)) lt.eq 2 rho_N parallel x parallel_(L_2 \( X \)) \, $
  which proves (5.3).
  If $K \( X \) = oo$, the characterization (1.1) supplies $lambda gt.eq 1$ such that, for every $N gt.eq 1$, there are $x_u in B_X$, $u in V_N$, with
  $ ∥sum_(u in V_N) alpha_u x_u∥ gt.eq lambda^(- 1) sum_(u in V_N) \| alpha_u \| $
  for all real coefficients. These vectors form an input of $L_2$ norm at most one, while every Walsh output satisfies
  $ parallel \( W_N^(upright("Id")_X) x \) \( v \) parallel = ∥2^(- N) sum_(u in V_N) chi \( u \, v \) x_u∥ gt.eq lambda^(- 1) . $
  Thus $w_N \( upright("Id")_X \) gt.eq lambda^(- 1)$ for every $N$, contradicting (5.3) and $rho_N arrow.r 0$. This proves $K \( X \) < oo$. ◻
]

#proof[
  If no uniform $kappa$ existed, choose spaces $X_j$ with the stated fixed cotype bounds and AP, but $K \( X_j \) arrow.r oo$, and set
  $ Z = (xor.big_(j gt.eq 1) X_j)_(ell_2) . $
  Finite-coordinate truncations converge uniformly on each compact subset of $Z$. Approximating its finitely many compact coordinate images by finite-rank maps therefore proves AP for $Z$; no uniform bound on the norms of those maps is needed. Moreover, $Z^(*) = \( xor.big_(j gt.eq 1) X_j^(*) \)_(ell_2)$ isometrically. For any finite tuple $z_i = \( z_(i j) \)_j$ in $Z$, Minkowski’s inequality in $ell_(q \/ 2)$ and the coordinate cotype bounds give
  $ (sum_i parallel z_i parallel_Z^q)^(2 \/ q) lt.eq sum_j (sum_i parallel z_(i j) parallel^q)^(2 \/ q) lt.eq C^2 bb(E)_epsilon ∥sum_i epsilon_i z_i∥_Z^2 . $
  Thus $C_q \( Z \) lt.eq C$, and the same argument on the dual gives $C_r \( Z^(*) \) lt.eq D$. Theorem 1 implies $K \( Z \) < oo$. Restriction of each finite-cube Rademacher projection to a coordinate summand gives $K \( X_j \) lt.eq K \( Z \)$, a contradiction.
  For the entropy assertion, finite-dimensional gauge spaces have AP, so the first assertion bounds their $K$-constants by $kappa$. The bounded-$K$ entropy-duality theorem of Artstein–Milman–Szarek–Tomczak-Jaegermann [1] Theorem 5, in the covering-number formulation of [8] Theorem 1.1, equation (1.6), and Section 2, has constants $a \, b gt.eq 1$ depending only on an upper bound for the $K$-convexity constant of either gauge space. Polarity identifies $X_(B^compose) = X_B^(*)$, and the finite-cube adjoint identity used above gives $K \( X_B^(*) \) = K \( X_B \)$. Thus the same bound is available for the polar bodies in the reverse inequality. Also, $X_(t L)$ is linearly isometric to $X_L$. Apply the covering theorem to $K \, t L$. Since $\( t L \)^compose = t^(- 1) L^compose$ and $N \( t^(- 1) L^compose \, c K^compose \) = N \( L^compose \, c t K^compose \)$ for $c > 0$, both inequalities in (1.2) follow for every $t > 0$, with constants depending only on $kappa$. ◻
]

== 6 The conjecture on Grothendieck pairs <sec:grothendieck>

We now apply the characterization to the Grothendieck-pair conjecture. The deduction through complemented Euclidean subspaces is the one in [6] Corollary 4.8; the main theorem allows ordinary AP here. For an algebraic tensor $t in E ⊗ F$, recall the injective and projective norms

$ parallel t parallel_epsilon = sup_(x^(*) in B_(E^(*))\
y^(*) in B_(F^(*))) \| \( x^(*) ⊗ y^(*) \) \( t \) \| \, #h(2em) parallel t parallel_pi = inf_(t = sum_i x_i ⊗ y_i) sum_i parallel x_i parallel parallel y_i parallel . $

Their completions are denoted by $E hat(⊗)_epsilon F$ and $E hat(⊗)_pi F$. Both norms satisfy the metric mapping property: tensoring bounded maps multiplies the norm by at most the product of their operator norms. This follows directly from the two definitions.

Let $cal(E) = \( E_n \)_(n gt.eq 1)$ be a sequence of real Banach spaces with $dim E_n = n$. Following [6] Definition 1.2, call $\( cal(E) \, F \)$ a #emph[Grothendieck pair] if there is $C < oo$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ parallel A ⊗ upright("Id")_F : E_m hat(⊗)_epsilon F arrow.r E_n^(*) hat(⊗)_pi F parallel lt.eq C parallel A parallel $ <eq:grothendieck-pair>]

for all $m \, n gt.eq 1$ and every $A : E_m arrow.r E_n^(*)$. The existence of the bounded extension in (6.1) is part of the condition.

#thm([Corollary 6.1.])[
  #emph[If $\( cal(E) \, F \)$ is a Grothendieck pair and $F$ is infinite-dimensional with the approximation property, then $\( cal(E) \, ell_2 \)$ is a Grothendieck pair. In particular, Pisier’s conjecture [6] Conjecture 1.4 holds, with the approximation property in place of the bounded approximation property.]
] <cor:grothendieck>

#proof[
  By Gupta–Misra–Ray [6] Theorem 1.3, the pair condition implies finite cotype of $F$ and $F^(*)$. Thus Theorem 1 makes $F$ $K$-convex.
  We use the complemented Euclidean subspace theorem of Figiel–Tomczak-Jaegermann [5], in the formulation [14] Theorem 4: for an infinite-dimensional $K$-convex space $F$, there is $D < oo$ such that for every $d gt.eq 1$ there are bounded maps
  $ U_d : ell_2^d arrow.r F \, #h(2em) V_d : F arrow.r ell_2^d \, #h(2em) V_d U_d = upright("Id")_(ell_2^d) \, #h(2em) parallel U_d parallel parallel V_d parallel lt.eq D . $
  By the metric mapping property and the factorization
  $ A ⊗ upright("Id")_(ell_2^d) = \( upright("Id")_(E_n^(*)) ⊗ V_d \) \( A ⊗ upright("Id")_F \) \( upright("Id")_(E_m) ⊗ U_d \) \, $
  the corresponding tensor operator with $ell_2^d$ in place of $F$ has norm at most $C D parallel A parallel$, uniformly in $d \, m \, n \, A$.
  Every algebraic tensor in $E_m ⊗ ell_2$ has its second coordinates in a finite-dimensional Hilbert subspace $H subset ell_2$. The inclusion of $H$ and the orthogonal projection onto $H$ both have norm one. The metric mapping property therefore shows that both tensor norms on tensors supported in $H$ agree with the corresponding norms computed in $ell_2$. The uniform estimate for finite-dimensional Hilbert spaces consequently holds on $E_m ⊗ ell_2$, and extends to its injective completion. This is (6.1) for $ell_2$, with constant $C D$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S. Artstein, V. Milman, S. J. Szarek, and N. Tomczak-Jaegermann, On convexified packing and entropy duality, #emph[Geom. Funct. Anal.] #strong[14] (2004), no.~5, 1134--1141. #link("https://doi.org/10.1007/s00039-004-0486-3")[doi:10.1007/s00039-004-0486-3]. #link("https://arxiv.org/abs/math/0407238v1")[arXiv:math/0407238v1]\; numbered locators refer to this version.]
#bibitem([2])[C. Borell, On the integrability of Banach space valued Walsh polynomials, #emph[Séminaire de probabilités], #strong[13] (1979), 1--3. #link("https://www.numdam.org/item/SPS_1979__13__1_0/")[Numdam].]
#bibitem([3])[P. Enflo, A counterexample to the approximation problem in Banach spaces, #emph[Acta Math.] #strong[130] (1973), 309--317. #link("https://doi.org/10.1007/BF02392270")[doi:10.1007/BF02392270].]
#bibitem([4])[T. Figiel and W. B. Johnson, The approximation property does not imply the bounded approximation property, #emph[Proc. Amer. Math. Soc.] #strong[41] (1973), no.~1, 197--200. #link("https://doi.org/10.1090/S0002-9939-1973-0341032-5")[doi:10.1090/S0002-9939-1973-0341032-5].]
#bibitem([5])[T. Figiel and N. Tomczak-Jaegermann, Projections onto Hilbertian subspaces of Banach spaces, #emph[Israel J. Math.] #strong[33] (1979), no.~2, 155--171. #link("https://doi.org/10.1007/BF02760556")[doi:10.1007/BF02760556].]
#bibitem([6])[R. Gupta, G. Misra, and S. K. Ray, #emph[On variants of the Grothendieck inequality and estimates on tensor product norms], 12 August 2025. #link("https://arxiv.org/abs/2305.13270v2")[arXiv:2305.13270v2].]
#bibitem([7])[B. Maurey and G. Pisier, Séries de variables aléatoires vectorielles indépendantes et propriétés géométriques des espaces de Banach, #emph[Studia Math.] #strong[58] (1976), 45--90. #link("https://doi.org/10.4064/sm-58-1-45-90")[doi:10.4064/sm-58-1-45-90].]
#bibitem([8])[E. Milman, A remark on two duality relations, #emph[Integral Equations Operator Theory] #strong[57] (2007), no.~2, 217--228. #link("https://doi.org/10.1007/s00020-006-1479-4")[doi:10.1007/s00020-006-1479-4]. #link("https://arxiv.org/abs/math/0603461v2")[arXiv:math/0603461v2]\; numbered locators refer to this version.]
#bibitem([9])[G. Pisier, Un théorème sur les opérateurs linéaires entre espaces de Banach qui se factorisent par un espace de Hilbert, #emph[Ann. Sci. École Norm. Sup.] (4) #strong[13] (1980), 23--43. #link("https://doi.org/10.24033/asens.1376")[doi:10.24033/asens.1376].]
#bibitem([10])[G. Pisier, Semi-groupes holomorphes et $K$-convexité, #emph[Séminaire d'analyse fonctionnelle, École Polytechnique], 1980--1981, exposé II, 1--30. #link("https://www.numdam.org/item/SAF_1980-1981____A2_0/")[Numdam].]
#bibitem([11])[G. Pisier, Semi-groupes holomorphes et $K$-convexité (suite), #emph[Séminaire d'analyse fonctionnelle, École Polytechnique], 1980--1981, exposé VII, 1--9. #link("https://www.numdam.org/item/SAF_1980-1981____A7_0/")[Numdam].]
#bibitem([12])[G. Pisier, Holomorphic semi-groups and the geometry of Banach spaces, #emph[Ann. of Math.] (2) #strong[115] (1982), no.~2, 375--392. #link("https://doi.org/10.2307/1971396")[doi:10.2307/1971396].]
#bibitem([13])[G. Pisier, Counterexamples to a conjecture of Grothendieck, #emph[Acta Math.] #strong[151] (1983), 181--208. #link("https://doi.org/10.1007/BF02393206")[doi:10.1007/BF02393206].]
#bibitem([14])[G. Pisier, Finite rank projections on Banach spaces and a conjecture of Grothendieck, in #emph[Proceedings of the International Congress of Mathematicians (Warsaw, 1983)], Vol.~2, PWN, Warsaw, 1984, 1027--1039. #link("https://www.imj-prg.fr/wp-content/uploads/2020/prix/pisier1983.pdf")[Text].]
#bibitem([15])[G. Pisier, #emph[Martingales in Banach Spaces (in connection with Type and Cotype)], IHP course notes, version of 9 February 2011. #link("https://webusers.imj-prg.fr/~gilles.pisier/ihp-pisier.pdf")[Author's text].]
#bibitem([16])[G. Pisier, Grothendieck's theorem, past and present, #emph[Bull. Amer. Math. Soc.] (N.S.) #strong[49] (2012), no.~2, 237--323. #link("https://doi.org/10.1090/S0273-0979-2011-01348-9")[doi:10.1090/S0273-0979-2011-01348-9].]
#bibitem([17])[S. J. Szarek, A Banach space without a basis which has the bounded approximation property, #emph[Acta Math.] #strong[159] (1987), 81--98. #link("https://doi.org/10.1007/BF02392555")[doi:10.1007/BF02392555].]
#bibitem([18])[S. J. Szarek and N. Tomczak-Jaegermann, On the nontrivial projection problem, #emph[Adv. Math.] #strong[221] (2009), no.~2, 331--342. #link("https://doi.org/10.1016/j.aim.2008.12.004")[doi:10.1016/j.aim.2008.12.004].]


