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

#align(center)[#text(size: 16pt, weight: "bold")[All-temperature pressure for orthogonally invariant Ising spin glasses]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The eigenvalues of an interaction matrix describe its quadratic form on Euclidean space, but an Ising spin system samples that form only on the vertices of a cube. Randomizing the eigenvectors by Haar orthogonal conjugation leads to the problem of determining the thermodynamic pressure from the limiting spectral distribution. We solve this problem for every fixed temperature when the limiting spectral law is compactly supported and there are no asymptotic outliers. The formula retains the hierarchy of replica overlaps familiar from the Sherrington–Kirkpatrick model, while the spectral law enters through its edge-extended $R$-transform. The rigorous pressure formulas in [5,12,11] impose high-temperature conditions.

=== 1.1 The model and the spectral transform <the-model-and-the-spectral-transform>

Let $Lambda_N = "diag" \( lambda_(1 \, N) \, dots.h \, lambda_(N \, N) \)$ be deterministic, and let $U_N$ be Haar distributed on the orthogonal group $O \( N \)$. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ P_N = 1 / N log [2^(- N) sum_(sigma in { - 1 \, 1 }^N) exp {1 / 2 sigma^(sans(T)) U_N^(sans(T)) Lambda_N U_N sigma}] . $ <eq:pressure>]

Temperature and coupling normalization are absorbed into $Lambda_N$. Our spin prior is uniform probability, not counting measure.

Write $mu_N = N^(- 1) sum_i delta_(lambda_(i \, N))$. Throughout the main theorem, $mu$ is a compactly supported probability measure on $bb(R)$, with support edges $lambda_(-) lt.eq lambda_(+)$, and

#[#set math.equation(numbering: n => "(1.2)")
 $ mu_N arrow.r.double mu \, #h(2em) liminf_(N arrow.r oo) min_i lambda_(i \, N) gt.eq lambda_(-) \, #h(2em) limsup_(N arrow.r oo) max_i lambda_(i \, N) lt.eq lambda_(+) . $ <eq:spectral-assumptions>]

Weak convergence then forces convergence of both extreme eigenvalues to the corresponding edges. No density or nonzero-variance assumption is imposed on $mu$.

For $x > 0$, let $b \( x \) > lambda_(+)$ be the unique solution, when it exists, of

#[#set math.equation(numbering: n => "(1.3)")
 $ integral frac(mu \( d lambda \), b \( x \) - lambda) = x . $ <eq:resolvent>]

If there is no such solution, put $b \( x \) = lambda_(+)$. Define the edge-extended $R$-transform by

#[#set math.equation(numbering: n => "(1.4)")
 $ R \( x \) = b \( x \) - 1 / x quad \( x > 0 \) \, #h(2em) R \( 0 \) = integral lambda thin mu \( d lambda \) . $ <eq:R>]

Only $0 lt.eq x lt.eq 1$ is needed in the final formula. The extension at the upper spectral edge is part of the definition; it is not an analytic continuation beyond the inverse-transform range.

=== 1.2 The variational functional <the-variational-functional>

For spin configurations $sigma \, tau in { - 1 \, 1 }^N$, their overlap is $Q \( sigma \, tau \) = N^(- 1) sigma dot.op tau$. Let $cal(P)$ be the nondecreasing measurable functions $p : \( 0 \, 1 \) arrow.r \[ 0 \, 1 \]$, identified up to null sets. These are the trial overlap quantiles. The nonnegative laws used in the proof come from subsequential limits after small perturbations that leave the limiting pressure unchanged. For $p in cal(P)$, put

#[#set math.equation(numbering: n => "(1.5)")
 $ D_p \( r \) = 1 - r - integral_0^1 \( p \( s \) - r \)_(+) thin d s \, #h(2em) 0 lt.eq r lt.eq 1 . $ <eq:D>]

This function is nonnegative and Lipschitz. Its value at $r = 1$ is zero.

The one-site part of the formula is defined by a finite Gaussian recursion. Its auxiliary paths specify hierarchical Gaussian covariance levels. Let $cal(H)$ consist of the nonnegative nondecreasing finite step functions on $\( 0 \, 1 \)$. Describe $h in cal(H)$ by $k$ consecutive intervals of lengths $w_i > 0$ and values $h_i$, for $0 lt.eq i < k$, and set

$ zeta_i = sum_(l < i) w_l \, #h(2em) zeta_k = 1 \, #h(2em) h_(- 1) = 0 . $

For $a \, v gt.eq 0$ and a function $f : bb(R) arrow.r bb(R)$, write

$ \( T_(a \, v) f \) \( z \) = cases(delim: "{", a^(- 1) log bb(E) exp { a f \( z + sqrt(v) thin g \) } \, & a > 0 \,, bb(E) f \( z + sqrt(v) thin g \) \, & a = 0 \,) #h(2em) g tilde.op N \( 0 \, 1 \) . $

Starting from $F_(k - 1) \( z \) = log cosh z$, define successively

#[#set math.equation(numbering: n => "(1.6)")
 $ F_(i - 1) = T_(zeta_i \, h_i - h_(i - 1)) F_i quad \( i = k - 1 \, dots.h \, 0 \) \, #h(2em) ell \( h \) = F_(- 1) \( 0 \) - h_(k - 1) / 2 . $ <eq:field-recursion>]

Subdividing intervals on which $h$ is constant does not change the value. For $p in cal(P)$ and $0 lt.eq t lt.eq 1$, set

#[#set math.equation(numbering: n => "(1.7)")
 $ S \( p \) & = sup_(h in cal(H)) {ell \( h \) + 1 / 2 integral_0^1 p \( s \) h \( s \) thin d s} \,\
G_t \( p \) & = 1 / 2 integral_0^1 t R \( t D_p \( r \) \) thin d r \, #h(2em) G_0 \( p \) = 0 . $ <eq:S>]

The supremum is interpreted in the extended real sense. Both $S$ and the class of admissible fields are independent of the spectral measure.

#thm([Theorem 1.1.])[
  (Limiting pressure).  #emph[Let $Lambda_N$ be deterministic real diagonal matrices whose empirical spectral measures converge weakly to a compactly supported probability law $mu$. Assume that their smallest and largest eigenvalues converge to the respective edges of $"supp" mu$. Let $U_N$ be Haar distributed on $O \( N \)$, and define $P_N$ using the uniform spin probability in Equation (1.1). With $S$ and $G_1$ as in Equations (1.7)–(1.7), 
#[#set math.equation(numbering: n => "(1.8)")
 $ lim_(N arrow.r oo) bb(E) P_N = lim_(N arrow.r oo) P_N = cal(F) \( mu \) := inf_(p in cal(P)) { S \( p \) + G_1 \( p \) } \, $ <eq:variational>]

 where the second limit holds almost surely. No independence of the matrices $U_N$ across dimensions is required.]
] <thm:main>

Counting-measure pressure is $cal(F) \( mu \) + log 2$. If the diagonal terms of the quadratic interaction are removed, subtract $1 / 2 integral lambda thin mu \( d lambda \)$. Physical free energy at inverse temperature $beta > 0$ is minus the corresponding pressure divided by $beta$. The order of the infimum and supremum in Equation (1.8) is essential; our proof does not exchange them. Random spectra, zero temperature, and external fields are treated in Sections 7 and 8.

A concrete consequence concerns Gaussian-pattern Hopfield interactions. Let $G_N$ be an $m_N$-by-$N$ matrix of independent standard Gaussian entries, with $m_N = floor.l alpha N floor.r$ and $alpha > 0$. The interaction $c G_N^(sans(T)) G_N \/ N$ is covered for every fixed $c in bb(R)$. The subsequent zero-temperature limits for the two signs of $c$ determine the limiting maximum and minimum of $N^(- 1) parallel G_N sigma parallel_2$ over $sigma in { - 1 \, 1 }^N$. Thus the pressure formula also determines a Gaussian operator norm and the minimum length of a signed sum of Gaussian columns; see Corollary 33.

=== 1.3 Context <context>

For the Sherrington–Kirkpatrick model [27], Parisi introduced a hierarchical order parameter [25]. Guerra established the associated variational upper bound for the pressure [15], and Talagrand proved the matching formula [28]. The random-overlap-structure variational principle of Aizenman, Sims, and Starr provides a complementary cavity framework [1].

Replica analyses of the random orthogonal model and more general orthogonally invariant Ising interactions developed spectral representations and replica-symmetric and one-step replica-symmetry-breaking free-energy predictions [19,9]. Bereyhi, Müller, and Schulz-Baldes developed formal finite-step replica-symmetry-breaking formulas for rotationally invariant quadratic optimization [4] Equations (114)–(115) and Appendix D. Bhattacharya and Sen proved the zero-field pressure formula in a high-temperature regime [5] Theorem 1.2. Fan and Wu established a replica-symmetric formula with external fields at sufficiently high temperature [12] Theorem 1.3, and Fan, Misiakiewicz, Wang, and Wen obtained an explicit high-temperature criterion for a constant external field through dynamical mean-field analysis [11] Corollary 2.8. The rank-one spherical-integral theorem of Guionnet and Maïda explains the spectral-edge extension in Equation (1.4) [16] Theorem 1.6 in the cited arXiv version. It determines an annealed spherical integral, rather than the quenched Ising pressure. Theorem 1 treats every fixed temperature under Equation (1.2).

=== 1.4 Proof strategy <proof-strategy>

For the proof, first take a finite spectral alphabet $mu = sum_(a = 1)^m rho_a delta_(lambda_a)$ with $rho_a > 0$. Replicas $sigma^1 \, sigma^2 \, dots.h$ are conditionally independent samples from the Gibbs probability at fixed disorder. If $x^l = U sigma^l$ denotes a replica in spectral coordinates, set

#[#set math.equation(numbering: n => "(1.9)")
 $ A_(l j)^a = 1 / N sum_(i upright(" in group ") a) x_i^l x_i^j \, #h(2em) Q_(l j) = sum_a A_(l j)^a = 1 / N sigma^l dot.op sigma^j . $ <eq:overlaps>]

An expectation $bb(E)$ includes disorder; angle brackets denote sampling at fixed disorder. The small perturbations make subsequential limits of these arrays satisfy the identities originating with Ghirlanda and Guerra [13]. Ultrametricity and synchronization [23,24] then express all the spectral overlaps through simultaneous nondecreasing quantiles. Haar rotation identities determine each group path, including its diagonal, from the total-overlap quantile $p$. In particular, they express the interaction energy as a functional of $p$.

The upper comparison fixes a trial quantile $q$ and adds independent hierarchical Gaussian fields with covariance path $h$ to the spin Hamiltonian, averages over the associated cascade, and subtracts $N h \( 1 - \) \/ 2$ from the exponent. With the interaction multiplied by $t$, the expected pressure at $t = 0$, before the small perturbations, is the one-site functional $ell \( h \)$. Ruelle’s cascade construction [26] and the marking calculus of Bolthausen and Sznitman [6] give this reduction. If the proposed upper bound fails, minimizing a comparison with the enriched pressure produces a limiting overlap quantile $p$ whose upper-tail integrals dominate those of $q$. The spectral interaction energy decreases in this order. The derivative in $t$ then contradicts minimality. The trial $q$ is fixed throughout, so this argument keeps the field supremum inside the overlap infimum.

For the lower comparison, we couple systems of sizes $N$ and $N + n$ while retaining the base interaction. The coupling selects uniform directions inside its eigenspaces; their spin projections become Gaussian marks. The cavity factor has both quadratic and linear terms in these marks. Its expected logarithm supplies the lower comparison for the increment of the expected log partition function. A quadratic Gaussian change of measure evaluates the limiting cavity expression on finite-step approximations $macron(p)$ of the limiting overlap quantile $p$. Per added spin, the result is

$ ell \( h_(macron(p)) \) + 1 / 2 integral_0^1 macron(p) \( s \) h_(macron(p)) \( s \) thin d s + G_1 \( macron(p) \) \, #h(2em) h_(macron(p)) \( s \) = integral_0^(macron(p) \( s \)) R' \( D_(macron(p)) \( r \) \) thin d r . $

Here the finite spectral alphabet makes $R$ smooth, and $h_(macron(p)) in cal(H)$. The $L^1$ continuity of $ell$ permits passage to the limiting quantile. To recover the supremum over fields, cavity-spin tests and site symmetry identify the limiting conditional two-spin products with $p$. The supporting inequality for covariance-level concavity then makes the limiting cavity expression equal to $S \( p \) + G_1 \( p \)$.

For zero field, Auffinger and Chen proved concavity under a common scaling of the covariance levels [2] Theorem 1; Ho proves concavity in the full covariance path [17] Theorem 1.8. The cascade weights are fixed in these concavity statements. We include a direct proof of the latter property and its supporting inequality. The spectral-overlap identities and the coupled finite-dimensional correction are the model-specific steps in this cavity framework [1].

Finally, comparison of spectral multiplicities and continuity of the edge-extended transform remove the finite-alphabet restriction; Haar concentration gives almost-sure convergence. The magnetic extension requires an additional argument: prescribe the mean spin within each field group, prove covariance concavity for the constrained one-site functional, and approximate it by large constrained blocks before optimizing the prescribed magnetizations.

Sections 2 and 3 establish the array and field tools. Section 4 derives and solves the spectral overlap identities. Sections 5 and 6 prove the two pressure bounds, and Section 7 completes the main theorem and its random-spectrum and Gaussian-pattern consequences. Section 8 proves the external-field extension.

== 2 Overlap arrays and cascade calculus <sec:arrays>

The rotation and cavity arguments use limits of several overlap arrays at once. This section shows that the Ghirlanda–Guerra identities reduce these limits to ordered scalar quantiles, and gives the Gaussian integration rules for their finite-step approximations. We include proofs of the structural facts needed below; they are instances of the ultrametricity and synchronization theory developed in [23,24]. The cascade construction and its marking calculus are closely related to [6].

=== 2.1 The Ghirlanda–Guerra identities <the-ghirlandaguerra-identities>

The identity below originates in the auxiliary-interaction argument of Ghirlanda and Guerra [13] §3, equation (28). Here its conditioning includes the joint collection of overlap components.

A Gram array is a symmetric array $\( R_(l j) \)_(l \, j gt.eq 1)$ whose finite principal submatrices are positive semidefinite. It is weakly exchangeable if its law is invariant under finite permutations of its indices. For a finite vector $upright(bold(R)) = \( R^1 \, dots.h \, R^m \)$ of such arrays, let $cal(F)_n$ be the sigma-field generated by all its entries with indices at most $n$. We say that $upright(bold(R))$ satisfies the joint Ghirlanda–Guerra identities if, for every $n gt.eq 2$ and every bounded measurable $f$,

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E) \[ f \( upright(bold(R))_(1 \, n + 1) \) divides cal(F)_n \] = 1 / n bb(E) f \( upright(bold(R))_12 \) + 1 / n sum_(l = 2)^n f \( upright(bold(R))_(1 l) \) . $ <arr:gg>]

The identities with any other distinguished index follow by exchangeability. In all applications the arrays are bounded and each diagonal is a deterministic constant.

The following invariance identity is the ingredient that turns (2.1) into a geometric description of an array. It is the array form of the invariance formula in [23] Theorem 2 in the cited arXiv version.

#thm([Lemma 2.1.])[
  #emph[Let $R$ be a bounded symmetric weakly exchangeable array satisfying (2.1). Fix $n gt.eq 2$ and bounded measurable functions $f_1 \, dots.h \, f_n$. Define 
$ H_l = sum_(i = 1)^n f_i \( R_(i l) \) \, #h(2em) H'_j = H_j - f_j \( R_(j j) \) + bb(E) f_j \( R_12 \) quad \( 1 lt.eq j lt.eq n \) . $

 For real $t$, let $Z \( t \)$ be the limiting empirical mean of $e^(t H_l)$ over $l > n$. Then, for every bounded $cal(F)_n$-measurable $Phi$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) Phi = bb(E) [frac(Phi exp \( t sum_(j = 1)^n H'_j \), Z \( t \)^n)] . $ <arr:invariance-eq>]

]
] <arr:invariance>

#proof[
  An empirical mean of bounded exchangeable variables is Cauchy in $L^2$: in its second-moment calculation all cross terms with distinct indices coincide, and the contribution from equal indices tends to zero. Applying this observation to the powers of $H_l$ constructs their empirical means simultaneously. The uniformly convergent exponential series then defines $Z \( t \)$ and agrees with the empirical mean of $e^(t H_l)$. In particular, if $\| H_l \| lt.eq C$, then $e^(- C \| t \|) lt.eq Z \( t \) lt.eq e^(C \| t \|)$.
  Write $phi \( t \)$ for the right-hand side of (2.2). Differentiating a denominator can be represented by averaging over one further replica. Iterating this operation gives
  $ phi^(\( d \)) \( t \) = bb(E) [frac(Phi exp #scale(x: 120%, y: 120%)[\(] t sum_(l lt.eq n) H'_l + t sum_(n < l lt.eq n + d) H_l #scale(x: 120%, y: 120%)[\)], Z \( t \)^(n + d)) product_(j = n)^(n + d - 1) (sum_(l lt.eq n) H'_l + sum_(n < l lt.eq j) H_l - j H_(j + 1))] . $
  To justify the replacement by a new replica, average over indices beyond all those already present. The empirical means are unchanged by finite permutations of these indices, and boundedness permits passage to their $L^2$ limits.
  At $t = 0$, condition on the first $n + d - 1$ replicas. For each $i lt.eq n$, Equation (2.1) computes the conditional mean of $f_i \( R_(i \, n + d) \)$. Summing those identities makes the last factor in the product have conditional mean zero. Thus $phi^(\( d \)) \( 0 \) = 0$ for $d gt.eq 1$.
  This derivative argument determines the identity for all real $t$. Indeed, near a fixed real $t_0$,
  $ \| Z \( t_0 + z \) - Z \( t_0 \) \| lt.eq Z \( t_0 \) \( e^(C \| z \|) - 1 \) . $
  Consequently the denominator is uniformly nonzero in a complex neighborhood of $t_0$, and the expected ratio is analytic there by boundedness. The vanishing derivatives prove constancy near zero; overlapping such neighborhoods extends constancy along the real axis. ◻
]

The following duplication principle follows the invariance method of [23] Theorem 4 in the cited arXiv version.

#thm([Lemma 2.2.])[
  (Duplication).  #emph[Let $R$ satisfy the hypotheses of Lemma 2. Suppose an event $cal(A)$ of positive probability prescribes open tolerances for the off-diagonal entries among $n gt.eq 2$ replicas. Assume that its requirements on the pairs $\( i \, n \)$, $i < n$, are intervals $I_i subset \( - oo \, u \)$. Then 
$ bb(P) #scale(x: 120%, y: 120%)[\(] cal(A) \, med R_(i \, n + 1) in I_i med \( i < n \) \, med R_(n \, n + 1) < u #scale(x: 120%, y: 120%)[\)] > 0 . $

]
] <arr:duplication>

#proof[
  Let $W$ be the empirical future frequency of ${ R_(i l) in I_i upright(" for all ") i < n }$, and let $V$ be that of ${ R_(n l) gt.eq u }$. If the asserted probability were zero, then $V gt.eq W$ almost surely on $cal(A)$. Apply Lemma 2 with $f_n = upright(bold(1))_(\[ u \, oo \))$, all other $f_i = 0$, and $Phi = upright(bold(1))_(cal(A))$. Put $q = bb(P) \( R_12 gt.eq u \)$. On $cal(A)$ the numerator contributed by the $H'_j$ is $e^(t q)$. For $t > 0$, therefore,
  $ bb(P) \( cal(A) \) lt.eq e^(t q) bb(E) frac(upright(bold(1))_(cal(A)), \( 1 + \( e^t - 1 \) W \)^n) lt.eq e^(t q) bb(E) frac(W, \( 1 + \( e^t - 1 \) W \)^n) . $
  For the second inequality, discard the requirements among the first $n - 1$ replicas and exchange replica $n$ with a future index. The variable $W$ only tests overlaps against the first $n - 1$ replicas and is unchanged by that exchange, so the empirical mean of the remaining indicator is $W$.
  The positive-probability event $cal(A)$ implies $q < 1$. For $n gt.eq 2$,
  $ sup_(0 lt.eq w lt.eq 1) frac(w, \( 1 + \( e^t - 1 \) w \)^n) lt.eq frac(\( n - 1 \)^(n - 1), n^n \( e^t - 1 \)) . $
  The preceding upper bound consequently tends to zero as $t arrow.r oo$, contradicting $bb(P) \( cal(A) \) > 0$. ◻
]

#thm([Proposition 2.3.])[
  (Structure of joint overlap arrays).  #emph[Let $upright(bold(R)) = \( R^1 \, dots.h \, R^m \)$ be bounded, jointly weakly exchangeable Gram arrays with deterministic diagonals, satisfying (2.1). Each scalar component has nonnegative off-diagonal entries and is ultrametric: 
$ R_23^a gt.eq min \( R_12^a \, R_13^a \) quad upright("almost surely") . $

 The support of the law of $upright(bold(R))_12$ is ordered coordinatewise. Hence this law has a representation by simultaneous nondecreasing quantiles $p_a : \( 0 \, 1 \) arrow.r bb(R)_(+)$. If $Q = sum_a R^a$ and $p$ is its off-diagonal quantile, then $p = sum_a p_a$, and every $p_a$ is a measurable function of $p$. In particular, each $p_a$ is constant almost everywhere on every interval on which $p$ is constant.]
] <arr:structure>

#proof[
  We first prove the scalar assertions. If $r = bb(P) \( R_12 < - epsilon.alt \) > 0$, then, on an event where every distinct overlap among $n$ replicas is below $- epsilon.alt$, Equation (2.1) gives
  $ bb(P) \( R_(i \, n + 1) gt.eq - epsilon.alt divides cal(F)_n \) = frac(1 - r, n) quad \( 1 lt.eq i lt.eq n \) . $
  A union bound leaves conditional probability at least $r$ that all new overlaps are below $- epsilon.alt$. Starting with two replicas, we obtain arbitrarily large such lists with positive probability. If the diagonal is bounded by $D$, a Gram representation $R_(i j) = v_i dot.op v_j$ of one list would give
  $ 0 lt.eq lr(|sum_(i = 1)^n v_i|)^2 lt.eq n D - epsilon.alt n \( n - 1 \) \, $
  which is impossible for large $n$. Thus the off-diagonal entries are nonnegative.
  For ultrametricity, we use the barycenter contradiction of [23] Section 3. Suppose ultrametricity fails. By permuting indices there is a support triple with
  $ R_12 = a gt.eq b = R_13 > c = R_23 . $
  Apply Lemma 3 repeatedly to copies of replicas 1 and 2. For any prescribed finite size and arbitrarily small tolerances, this produces two sets of replicas whose cross overlaps are close to $a$, whose internal off-diagonal overlaps are at most $a + epsilon.alt$, and whose overlaps with replica 3 are close respectively to $b$ and $c$. Here is the tolerance choice underlying this iteration. At each step choose a support point in the current positive-probability matching event, and choose the duplication threshold slightly larger than all overlaps of the replica being copied. Allocate a total increase less than $epsilon.alt$ among the finitely many steps. The requirements against the other set and replica 3 remain in their original small intervals.
  Let $macron(v)_1 \, macron(v)_2$ be the barycenters of Gram vectors for sets of size $M$. Their squared norms are at most $a + epsilon.alt + D \/ M$, and their mutual inner product is at least $a - epsilon.alt$. It follows that $\| macron(v)_1 - macron(v)_2 \|^2 lt.eq 4 epsilon.alt + 2 D \/ M$. Their inner products with the vector for replica 3, however, differ by a number arbitrarily close to $b - c > 0$. First take $M$ large and then the tolerances small to contradict Cauchy–Schwarz. This proves scalar ultrametricity.
  For synchronization, we use the coordinate-and-sum argument of [24] Section 4, Lemma 2. Each component and each sum of two components is again a Gram array satisfying the scalar identities. Suppose two points in the support of the joint pair law have strictly crossed coordinates $a$ and $b$. The independent-law term in Equation (2.1), with $n = 2$, gives positive probability of observing these two points in arbitrarily small neighborhoods on pairs 12 and 13. Ultrametricity in each component forces the corresponding coordinate on pair 23 to equal the smaller of the two coordinates. The sum of coordinates $a$ and $b$ on pair 23 is then strictly below its values on both pairs 12 and 13, contrary to ultrametricity for that sum. The support is therefore ordered.
  An ordered compact support has at most one point with any prescribed sum of its coordinates. Its coordinates are nondecreasing functions of that sum; in fact each is 1-Lipschitz on the set of possible sums. Applying these functions to the quantile of $Q_12$ supplies the simultaneous quantiles and all the stated conclusions. ◻
]

=== 2.2 Finite cascades and hierarchical marks <finite-cascades-and-hierarchical-marks>

We use Ruelle’s Poisson cascade construction [26]. The conditional marking argument follows the Poisson-rescaling calculus of Bolthausen and Sznitman [6] Appendix, Proposition A.2; the proof below states the fractional-moment conditions needed for the possibly unbounded marks used here.

Proposition 4 identifies the order of the overlaps. We now construct the finite-step arrays and describe how their marks change under a Gibbs weight. This calculation will apply both to Gaussian linear fields and to the quadratic Gaussian factors in the cavity argument.

Fix the interval weights $w_0 \, dots.h \, w_(k - 1) > 0$ and endpoints $0 = zeta_0 < zeta_1 < dots.h.c < zeta_k = 1$. At every vertex at depth $i - 1$, place an independent Poisson point process $\( v_(alpha r) \)_(r gt.eq 1)$ on $\( 0 \, oo \)$ with intensity $zeta_i v^(- 1 - zeta_i) thin d v$, for $1 lt.eq i lt.eq k - 1$. The mass of a leaf $alpha in bb(N)^(k - 1)$ is the product of the points on its path. Let $T$ be the sum of these masses and let $nu_alpha$ be the masses divided by $T$. When $k = 1$, there is one leaf of mass one and $T = 1$. We refer to $\( nu_alpha \)$ as the finite Ruelle probability cascade with these parameters.

For independently sampled leaves, let $L_(l j)$ be the depth of their last common vertex, with $L_(l j) = k - 1$ when their leaf labels agree. A step overlap quantile with values $q_i$ on the intervals of lengths $w_i$ is represented by $R_(l j) = q_(L_(l j))$ for $l eq.not j$; Lemma 6 proves the required pair probabilities and GG identities. The replica diagonal is prescribed separately. In particular, two distinct replicas may choose the same leaf and have overlap $q_(k - 1)$ even when their self-overlap is larger.

We record why the normalization is legitimate. For $0 < zeta < 1$, the sum of a Poisson process of intensity $zeta v^(- 1 - zeta) d v$, multiplied by independent positive marks $V$ with $bb(E) V^zeta < oo$, has Laplace transform

$ exp { - c_zeta bb(E) \[ V^zeta \] s^zeta } \, #h(2em) s gt.eq 0 \, $

by direct integration of $1 - e^(- s v V)$. It is finite and strictly positive almost surely. Integrating this Laplace transform, or its complement, against powers of $s$ gives every negative moment and every positive moment of order below $zeta$. In particular its logarithm has finite second moment. Starting at the deepest level and proceeding upwards, the strict inequalities between the $zeta_i$ give all required fractional moments. Thus $0 < T < oo$ almost surely and $bb(E) \| log T \|^2 < oo$.

The Poisson facts just used require no additional construction theorem: on a set of finite intensity, draw a Poisson number of independent points with normalized intensity. Summing its exponential series gives the Laplace formula and the mapping and independent-mark rules. Increasing finite-intensity restrictions proves the same rules for the processes above.

#thm([Proposition 2.4.])[
  (Marked cascade recursion).  #emph[Give the root a random mark $eta_0$. Conditional on ancestor marks, give each child at level $i$ a mark with probability kernel $K_i \( d eta_i divides eta_0 \, dots.h \, eta_(i - 1) \)$, independently for distinct children, for $1 lt.eq i lt.eq k - 1$. All marks are independent of the Poisson processes conditional on their ancestors. One may also integrate a residual mark $eta_k$ at each leaf, with kernel $K_k$, afresh on every visit to that leaf.]
  #emph[For a measurable payoff $X \( eta_0 \, dots.h \, eta_k \)$ define 
$ X_(k - 1) = log integral e^X thin d K_k \, #h(2em) X_(i - 1) = 1 / zeta_i log integral e^(zeta_i X_i) thin d K_i quad \( i = k - 1 \, dots.h \, 1 \) . $

 Here $X = - oo$ is allowed on excluded residual states, so the leaf integral can impose a hard constraint without renormalizing its prior; the integral itself must be strictly positive and finite. If there is no residual mark, set $X_(k - 1) = X$ instead. Assume that all these quantities are finite real numbers almost surely under the original path law, and that $bb(E) \| X_0 \| < oo$. Then 
#[#set math.equation(numbering: n => "(2.3)")
 $ bb(E) log sum_alpha nu_alpha e^(X_(k - 1) \( alpha \)) = bb(E) X_0 . $ <arr:rpc-log>]

 After tilting the leaf masses by $e^(X_(k - 1))$, the unmarked cascade has its original law up to tree relabeling. Conditional on the branching of sampled leaves, their marks use the kernels 
#[#set math.equation(numbering: n => "(2.4)")
 $ d tilde(K)_i = e^(zeta_i \( X_i - X_(i - 1) \)) thin d K_i quad \( 1 lt.eq i lt.eq k - 1 \) \, #h(2em) d tilde(K)_k = e^(X - X_(k - 1)) thin d K_k . $ <arr:rpc-kernels>]

 The root mark keeps its original law: the Gibbs probability is normalized for each fixed root mark, and the outer expectation still averages that mark under its original distribution. Different branches use conditionally independent marks, and separate visits use independent residual marks even when their leaf labels coincide. These assertions hold for every bounded measurable test of the sampled branching and marks.]
] <arr:rpc>

#proof[
  Multiply each point on an edge to level $i$ by $e^(X_i - X_(i - 1))$. Conditional on earlier marks,
  $ integral e^(zeta_i \( X_i - X_(i - 1) \)) thin d K_i = 1 . $
  Poisson mapping therefore preserves the point intensity and changes the conditional mark law to $tilde(K)_i$. Applying this observation recursively, and ordering the transformed child points at each vertex, gives an ordinary unmarked cascade independent of the root mark. The transformed child marks have the kernels in (2.4); transformed unmarked descendant processes are independent of their ancestor marks. Positivity and finiteness of the edge-kernel densities ensure that the almost-sure finiteness assumptions remain valid under these kernels.
  Let $T_(upright("new"))$ denote the sum of the products of transformed edge points. The multipliers telescope along every path, giving the almost sure identity
  #[#set math.equation(numbering: n => "(2.5)")
   $ log sum_alpha nu_alpha e^(X_(k - 1) \( alpha \)) = X_0 + log T_(upright("new")) - log T . $ <arr:rpc-total>]
  Conditional on the root, both totals have the original law of $T$. Thus their log difference has conditional mean zero and conditional second moment at most $4 bb(E) \| log T \|^2$. This proves (2.3), including integrability. In particular no unconditional first moment of $e^X$ is required.
  The same mapping proves the sampled-mark assertion. Relabeling is performed separately among children of each vertex, so it preserves ancestors and common levels. The residual integration contributes $e^(X_(k - 1))$ to a leaf mass; conditional residual sampling after the tilt has density $e^(X - X_(k - 1))$. Independent integration on separate visits gives precisely the last assertion. ◻
]

#thm([Lemma 2.5.])[
  #emph[For the common levels $L_(l j)$ of independently sampled cascade leaves, 
$ bb(P) \( L_12 = i \) = w_i quad \( 0 lt.eq i lt.eq k - 1 \) \, $

 and the common-level array satisfies the Ghirlanda–Guerra identities. Any bounded symmetric weakly exchangeable scalar ultrametric array satisfying those identities is uniquely determined in law by its off-diagonal distribution and its fixed diagonal. Consequently a nondecreasing finite-valued rounding of its off-diagonal entries, with the fixed diagonal retained separately, has the cascade law prescribed by its rounded quantile.]
] <arr:rpc-gg>

#proof[
  Attach independent standard Gaussian marks to the vertices at level $i gt.eq 1$, and tilt by $e^(c g \( alpha \))$, where $g \( alpha \)$ is the mark on the path to $alpha$ and $c eq.not 0$. By Proposition 5, the unmarked branching law is unchanged and the marks are shifted by $c zeta_i$. Their covariance before tilting is $upright(bold(1))_({ L_(l j) gt.eq i })$. Gaussian integration by parts against a bounded test $Phi$ of the common levels of $n$ replicas gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ zeta_i bb(E) Phi = bb(E) [Phi (1 + sum_(j = 2)^n upright(bold(1))_({ L_(1 j) gt.eq i }) - n upright(bold(1))_({ L_(1 \, n + 1) gt.eq i }))] . $ <arr:rpc-gg-eq>]
  For this calculation one can first retain finitely many leaves; Gaussian exponential moments and Jensen’s inequality for inverse partition factors justify passage to the full probability prior. At $n = 1$, Equation (2.6) gives $bb(P) \( L_12 gt.eq i \) = 1 - zeta_i$. For general $n$, it gives the Ghirlanda–Guerra identity for each threshold, and hence for every function of the finite set of levels.
  For uniqueness, first consider an array with finitely many possible off-diagonal values. At any one of its thresholds, ultrametricity makes the relation of being above the threshold an equivalence relation on the sampled indices. If its pair probability is $1 - zeta$, the conditional probability that the next sample joins an existing class $C$ is
  $ frac(1 - zeta + \| C \| - 1, n) = frac(\| C \| - zeta, n) \, $
  by applying the identities to a representative of $C$. The classes at different thresholds are nested. These joining probabilities, and their differences for nested classes, determine the distribution of the whole next row of overlaps. Induction on the sample size gives uniqueness. General bounded off-diagonal distributions follow by nondecreasing finite-valued roundings and convergence on each finite array. Equal rounded values may first be merged into a single level. ◻
]

=== 2.3 Gaussian marks and passage through finite replicas <gaussian-marks-and-passage-through-finite-replicas>

For a cascade with levels $0 \, dots.h \, k - 1$, let $C_0 \, dots.h \, C_(k - 1) \, C_(upright(d))$ be symmetric matrices such that

$ 0 lt.eq C_0 lt.eq C_1 lt.eq dots.h.c lt.eq C_(k - 1) lt.eq C_(upright(d)) $

in positive semidefinite order. A centered Gaussian vector with covariance $C_i$ between replicas of common level $i$, and diagonal $C_(upright(d))$, is obtained by independent increments along the tree: the common root increment has covariance $C_0$, and the increment at level $i gt.eq 1$ has covariance $C_i - C_(i - 1)$. The remaining covariance $C_(upright(d)) - C_(k - 1)$ is a residual integrated independently on every sampled visit. This construction also covers singular covariance matrices and tied levels.

#thm([Lemma 2.6.])[
  (Finite-replica continuity).  #emph[For a sequence of random probability priors, draw conditionally independent replicas and form their overlap arrays. Suppose the finite-dimensional laws of these bounded overlap arrays and their Gaussian covariance arrays converge jointly, and the covariance diagonals are uniformly bounded. Conditional on these arrays, let the additional marks be centered Gaussian vectors with those covariances. Then their joint finite-replica laws converge. Moreover, the following quantities pass to the limit whenever the factors and tests are bounded continuous functions of the corresponding finite-replica data:]
  + #emph[the expected logarithm of a one-replica Gibbs integral of a factor $f$ satisfying $0 < delta lt.eq f lt.eq M < oo$;]
  + #emph[any bounded finite-replica test under reweighting by such a factor.]
  #emph[The same conclusion holds for finite-step cascade approximations whose overlap and covariance arrays converge in this sense.]
] <arr:finite-replica>

#proof[
  Finite-dimensional centered Gaussian laws depend continuously on their covariance matrices, including at singular matrices. Conditional integration followed by the assumed convergence proves the first claim.
  Write $Z = chevron.l f chevron.r$ for the original Gibbs integral. It belongs to $\[ delta \, M \]$. Uniformly approximate $log Z$, or $Z^(- n)$ for an $n$-replica reweighted test, by a polynomial on this interval. Each power of $Z$ is an integral over additional independent Gibbs replicas. The Gaussian marks on these extra replicas are evaluations of the #emph[same] field, so their correlations are exactly those of the joint covariance array. Every resulting term is a bounded finite-replica expectation and converges by the first claim. The uniform polynomial errors can then be sent to zero. ◻
]

In particular, to approximate a quantile $p$ one may round its values by nondecreasing finite-valued maps converging uniformly to the identity. Lemma 6 identifies the rounded array with a finite cascade. Gaussian covariance paths may be approximated at the same time provided their increments and diagonal excess remain positive semidefinite and the covariances converge. A covariance path that is a function of $p$ must be rounded consistently on its plateaus. Unbounded factors require additional truncation estimates; Lemma 7 does not assert convergence of their untruncated moments.

#thm([Lemma 2.7.])[
  (Gaussian differentiation).  #emph[Let $pi$ be a probability prior, possibly random. Conditional on the prior and its other disorder, let $X_t \( sigma \)$ be a centered Gaussian field with differentiable covariance $C_t \( sigma \, tau \)$, and let $V_t \( sigma \)$ be a differentiable deterministic exponent. Assume, on each compact parameter interval, uniform bounds on $C_t \( sigma \, sigma \)$, $\| dot(C)_t \( sigma \, tau \) \|$, $\| V_t \( sigma \) \|$, and $\| dot(V)_t \( sigma \) \|$, and uniform continuity in $t$ of the derivatives. Then 
#[#set math.equation(numbering: n => "(2.7)")
 $ frac(d, d t) bb(E) log integral e^(X_t + V_t) thin d pi = 1 / 2 bb(E) chevron.l dot(C)_t \( 1 \, 1 \) - dot(C)_t \( 1 \, 2 \) chevron.r_t + bb(E) chevron.l dot(V)_t \( 1 \) chevron.r_t . $ <arr:gaussian-pressure>]

 For a bounded test $Phi$ of $n$ replicas with no explicit dependence on these Gaussian variables or on $t$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ lr(|frac(d, d t) bb(E) chevron.l Phi chevron.r_t|) lt.eq parallel Phi parallel_oo (2 n \( n + 1 \) parallel dot(C)_t parallel_oo + 2 n parallel dot(V)_t parallel_oo) . $ <arr:gaussian-test>]

 These formulas apply to the finite cascades above, including at one-sided parameter endpoints by integration and continuity.]
] <arr:gaussian-calculus>

#proof[
  For a finite prior, differentiate the Gibbs ratios and integrate by parts in the Gaussian coefficients. The logarithm gives (2.7). The covariance part for an $n$-replica test is one half the expectation of $Phi$ times
  $ sum_(l \, m lt.eq n) dot(C)_t \( l \, m \) - 2 n sum_(l lt.eq n) dot(C)_t \( l \, n + 1 \) + n \( n + 1 \) dot(C)_t \( n + 1 \, n + 2 \) - n dot(C)_t \( n + 1 \, n + 1 \) . $
  The deterministic part inserts $sum_(l lt.eq n) dot(V)_t \( l \) - n dot(V)_t \( n + 1 \)$. Taking absolute values proves the stated bound.
  For a general probability prior, approximate its integral by finite empirical samples, or by finite subsets whose prior mass tends to one. At a fixed system size and on a bounded parameter interval, a uniform variance bound for $X_t$ and a bound for $V_t$ give all required polynomial-exponential moments. Inverse partition factors are controlled by Jensen’s inequality:
  $ (integral e^(X_t + V_t) thin d pi)^(- r) lt.eq integral e^(- r \( X_t + V_t \)) thin d pi #h(2em) \( r > 0 \) . $
  Hölder’s inequality gives the same control for products occurring in the differentiated ratios. These bounds justify passage to the limit in the integrated formulas, and then differentiation wherever the covariance derivatives are continuous. The integrated identities also give the asserted endpoint statements. ◻
]

== 3 Concavity of the Ising field functional <sec:field>

The lower bound will identify a field whose conditional two-spin products equal the overlap quantile. To turn that identity into the supremum defining $S$, we need concavity of $ell$ in its covariance levels. We prove this property with the cascade weights held fixed. We also establish continuity under refinement and describe exactly which overlap quantiles have finite $S$.

=== 3.1 Conditional magnetizations and covariance derivatives <conditional-magnetizations-and-covariance-derivatives>

Fix weights $w_i > 0$, endpoints $zeta_i$, and covariance levels $0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1)$. Put $v_i = h_i - h_(i - 1)$, with $h_(- 1) = 0$, and let $gamma_v$ denote the centered Gaussian law of variance $v$, including the point mass at zero when $v = 0$. Recall the Gaussian operators $T_(zeta \, v)$ in the definition of $ell$. Let $F_(k - 1) \( z \) = log cosh z$ and $F_(i - 1) = T_(zeta_i \, v_i) F_i$. Each $F_i$ is even, convex, smooth, and 1-Lipschitz. Evenness follows by reflection; convexity follows from Hölder’s inequality for the logarithmic expectation, and ordinary expectation when $zeta = 0$; the Lipschitz bound is preserved by either operator.

The tilted position chain has $Z_(- 1) = 0$ and transitions

#[#set math.equation(numbering: n => "(3.1)")
 $ bb(P) \( Z_i in d y divides Z_(i - 1) = z \) = e^(zeta_i \( F_i \( y \) - F_(i - 1) \( z \) \)) thin gamma_(v_i) \( d \( y - z \) \) . $ <fld:kernel>]

At $i = 0$ the exponential factor is one. Set $m_i = F'_i$ and

#[#set math.equation(numbering: n => "(3.2)")
 $ B_i \( h \) = bb(E) \[ m_i \( Z_i \)^2 \] . $ <fld:B>]

The chain in (3.1) is precisely the sampled-mark chain of Proposition 5 for the single-site Ising weight.

#thm([Proposition 3.1.])[
  #emph[The variables $m_i \( Z_i \)$ are the conditional means of $tanh Z_(k - 1)$ along the tilted chain. In particular, $0 lt.eq B_0 \( h \) lt.eq dots.h.c lt.eq B_(k - 1) \( h \) lt.eq 1$, and $B_i$ is the expected product of two Ising spins whose fields have common level $i$. For fixed weights, covariance differentiation gives 
#[#set math.equation(numbering: n => "(3.3)")
 $ d ell \( h \) = - 1 / 2 sum_(i = 0)^(k - 1) w_i B_i \( h \) thin d h_i . $ <fld:gradient>]

 The formula holds on the strict cone $0 < h_0 < dots.h.c < h_(k - 1)$ and, by continuity, for one-sided derivatives along line segments in the closed cone. Subdividing an interval on which $h$ is constant leaves $ell$ unchanged and repeats its value of $B$ on the resulting intervals.]
] <fld:derivative>

#proof[
  Differentiating $T_(zeta_i \, v_i) F_i$ in its starting position gives
  $ m_(i - 1) \( z \) = bb(E) \[ m_i \( Z_i \) divides Z_(i - 1) = z \] . $
  At the terminal level $m_(k - 1) = tanh$. Thus these conditional means form a martingale, and conditional Jensen proves the monotonicity of their second moments. If two sampled paths separate immediately after level $i$, their future marks and final spins are conditionally independent given the common history. Their conditional product is $m_i \( Z_i \)^2$. Proposition 5 then proves the asserted two-spin interpretation, including equal leaves at the last level.
  Apply Lemma 8 to the single-site cascade partition function with energy $z \( alpha \) sigma$, uniform prior on $sigma in { - 1 \, 1 }$, and covariance $bb(E) \[ z \( alpha \) z \( alpha' \) \] = h_(L \( alpha \, alpha' \))$. The diagonal is $h_(k - 1)$. Its derivative cancels the derivative of the subtraction $h_(k - 1) \/ 2$. The pair contribution at level $i$ is $B_i$, and that level has probability $w_i$ after the tilt by Proposition 5. This proves (3.3).
  All tilted Gaussian integrals and their conditional means depend continuously on the variances, also when some vanish. This follows by Gaussian coupling and dominated convergence: the payoffs have at most linear growth, their derivatives are bounded, and their exponential weights have locally uniform Gaussian moments. This proves the boundary statement. If an increment is zero, the adjacent positions and backward functions coincide. The corresponding conditional means and their squares therefore coincide as well, proving refinement consistency. ◻
]

=== 3.2 Two monotonicity properties <two-monotonicity-properties>

The variables $h_i$ are cumulative covariance levels. Increasing $h_j$ increases $v_j$ and, unless $j = k - 1$, decreases $v_(j + 1)$; thus the mixed derivatives compare coupled changes of increments. The next two comparisons control these derivatives and the response of $B_i$ to scaling all covariance levels. Together they determine the sign of the whole Hessian.

We first record a property of even Gaussian tilts. For $v > 0$, an even weight $e^(zeta F \( y \))$, and an absolute parent position $z gt.eq 0$, the density of the absolute child position $u gt.eq 0$ is proportional to

#[#set math.equation(numbering: n => "(3.4)")
 $ e^(- u^2 \/ \( 2 v \)) cosh \( z u \/ v \) e^(zeta F \( u \)) . $ <fld:folded>]

For $z_2 gt.eq z_1 gt.eq 0$, the likelihood ratio of the two densities is increasing in $u$, since

$ frac(d, d u) log frac(cosh \( z_2 u \/ v \), cosh \( z_1 u \/ v \)) = frac(z_2 tanh \( z_2 u \/ v \) - z_1 tanh \( z_1 u \/ v \), v) gt.eq 0 . $

Consequently the absolute-position transition is stochastically increasing in the absolute parent. Moreover, changing the even payoff by a function nondecreasing, respectively nonincreasing, on $\[ 0 \, oo \)$ increases, respectively decreases, that transition in stochastic order. These assertions follow directly by integrating an increasing test against the ordered likelihood ratios.

#thm([Lemma 3.2.])[
  #emph[On the strict covariance cone, for every $i < j$, 
$ partial_(h_j) B_i \( h \) lt.eq 0 . $

]
] <fld:mixed>

#proof[
  All derivatives below exist by differentiating smooth Gaussian convolutions; on compact subsets of the strict cone, linear growth of the payoffs gives locally uniform bounds for this differentiation. For $l < j$, covariance differentiation of the backward recursion gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ partial_(h_j) F_l \( z \) = c_j - w_j / 2 bb(E) \[ m_j \( Z_j \)^2 divides Z_l = z \] \, $ <fld:backward-derivative>]
  where $c_j$ is independent of $z$ and vanishes unless $j = k - 1$. To verify the identity, increase the variance entering level $j$ and decrease the variance entering level $j + 1$. The two Gaussian generators insert respectively $\( F''_j + zeta_j m_j^2 \) \/ 2$ and $\( F''_j + zeta_(j + 1) m_j^2 \) \/ 2$, propagated by the same conditional expectations. Their difference is $- w_j m_j^2 \/ 2$. At the last level, $F''_(k - 1) + m_(k - 1)^2 = 1$ gives the additional constant $1 \/ 2$. Propagation through the earlier operators gives (3.5).
  The function $m_j$ is odd and nondecreasing, so $m_j^2$ is even and nondecreasing in absolute position. By (3.4), its conditional expectation on the right-hand side of (3.5) has the same property. Thus $partial_(h_j) F_l$ is nonincreasing on $\[ 0 \, oo \)$, up to its irrelevant constant. In particular, increasing $h_j$ decreases $m_i \( z \)$ for each $z gt.eq 0$ when $i < j$.
  This change also decreases the sampled absolute positions up to level $i$. Indeed, their Gaussian variances are unchanged, and the change in every backward tilt $F_l$, $l lt.eq i$, is nonincreasing in absolute position by the identity just proved. The likelihood-ratio comparison following (3.4), applied successively to the transitions, gives this stochastic decrease. The root transition is unchanged because $zeta_0 = 0$. Combining the pointwise decrease of $m_i \( z \)^2$ with the stochastic decrease of $\| Z_i \|$ proves the claim. ◻
]

The scaling comparison below is closely related to the monotonicity of squared conditional magnetizations in Auffinger and Chen’s proof of raywise concavity [2] Theorem 1 and its proof.

#thm([Lemma 3.3.])[
  #emph[For each fixed monotone covariance vector $h$, $B_i \( c h \)$ is nondecreasing in $c > 0$. On the strict cone, therefore, 
#[#set math.equation(numbering: n => "(3.6)")
 $ sum_j h_j partial_(h_j) B_i \( h \) gt.eq 0 . $ <fld:radial-derivative>]

]
] <fld:radial>

#proof[
  Use the original Gaussian increments of variances $v_i$, and replace the terminal payoff by $g_c \( z \) = log cosh \( sqrt(c) thin z \)$. Write $F_i^(\( c \))$ for these backward values. This is the same recursion as at covariance $c h$, in the original position units:
  $ F_i^(\( c \)) \( z \) = F_i^(c h) \( sqrt(c) thin z \) . $
  For $c_2 gt.eq c_1 > 0$, the difference $g_(c_2) - g_(c_1)$ is even and nondecreasing on $\[ 0 \, oo \)$. This property propagates through every backward operator. For a positive exponent, the difference of the two backward values can be written
  $ 1 / zeta log bb(E)_(c_1 \, z) e^(zeta \( F^(\( c_2 \)) - F^(\( c_1 \)) \) \( Y \)) \, $
  where the expectation is in the transition tilted by the lower-$c$ payoff. For exponent zero it is the ordinary expectation of the difference. In either case (3.4) shows that the result is nondecreasing in the absolute starting position. It is even by reflection. Hence the tilted absolute-position chain is stochastically increasing with $c$.
  It remains to compare conditional spin means, rather than derivatives in the rescaled position. Define
  $ a_i^(\( c \)) \( z \) = bb(E)_c \[ tanh \( sqrt(c) thin Z_(k - 1) \) divides Z_i = z \] . $
  We prove backwards that these functions are odd and, on $z gt.eq 0$, nonnegative and nondecreasing both in $z$ and in $c$. This is true at the terminal level. Conditional on the absolute value $u$ of a child with parent $z gt.eq 0$, the mean sign of the child is $tanh \( z u \/ v \)$: the even tilt cancels in the ratio of its positive and negative densities. The backward conditional mean is thus the integral of
  $ a_(i + 1)^(\( c \)) \( u \) tanh \( z u \/ v \) $
  against the folded tilted transition. Its factors are nonnegative and nondecreasing in $u$, while the transition is increasing in $z$ and $c$. The induction follows, with zero increments obtained by continuity.
  Finally, $a_i^(\( c \)) \( z \) = m_i^(c h) \( sqrt(c) thin z \)$. These are precisely the physical conditional spin means, without an additional scaling factor. Combining their pointwise increase with that of the sampled absolute positions shows that $bb(E)_c \[ a_i^(\( c \)) \( Z_i \)^2 \] = B_i \( c h \)$ increases with $c$. Differentiating at $c = 1$ gives (3.6). ◻
]

=== 3.3 Concavity, continuity, and the domain of $S$ <concavity-continuity-and-the-domain-of-s>

#thm([Theorem 3.4.])[
  #emph[For fixed interval weights, $ell$ is concave on the closed cone of nonnegative nondecreasing covariance levels. For any two such step paths $h \, v$, represented on a common subdivision, 
#[#set math.equation(numbering: n => "(3.7)")
 $ ell \( v \) lt.eq ell \( h \) - 1 / 2 integral_0^1 B_h \( s \) \( v \( s \) - h \( s \) \) thin d s \, $ <fld:tangent>]

 where $B_h$ is the step path with values $B_i \( h \)$. Furthermore, 
#[#set math.equation(numbering: n => "(3.8)")
 $ \| ell \( h \) - ell \( v \) \| lt.eq 1 / 2 parallel h - v parallel_(L^1 \( 0 \, 1 \)) . $ <fld:lipschitz>]

 Thus $ell$ has a unique Lipschitz extension to bounded nonnegative nondecreasing paths, independent of the step approximations used.]
] <fld:concavity>

#proof[
  On the strict cone put $M_(i j) = w_i partial_(h_j) B_i$. Equation (3.3) shows that $M$ is symmetric and equals $- 2$ times the Hessian of $ell$. Lemma 10 and symmetry give $M_(i j) lt.eq 0$ for $i eq.not j$. Let $D = "diag" \( h_0 \, dots.h \, h_(k - 1) \)$. By Lemma 11, every row sum of $D M D$ is nonnegative:
  $ sum_j \( D M D \)_(i j) = h_i w_i sum_j h_j partial_(h_j) B_i gt.eq 0 . $
  If a symmetric matrix $A$ has nonpositive off-diagonal entries and row sums $r_i gt.eq 0$, then
  $ x^(sans(T)) A x = sum_i r_i x_i^2 + sum_(i < j) \( - A_(i j) \) \( x_i - x_j \)^2 gt.eq 0 . $
  Applying this identity to $D M D$, and using invertibility of $D$ on the strict cone, proves that $M$ is positive semidefinite. Hence the Hessian of $ell$ is negative semidefinite.
  Integrating along line segments gives concavity and the supporting inequality in the strict cone. Approximate boundary covariance vectors by strict ones and use the continuity in Proposition 9 to obtain (3.7) on the closed cone. If $h$ and $v$ initially use different intervals, put both on their common subdivision. Refinement consistency makes this operation harmless. Finally, integrate (3.3) along the segment from $h$ to $v$ and use $0 lt.eq B_i lt.eq 1$ to prove (3.8). Monotone step paths are dense in the bounded monotone paths in $L^1$, proving the extension. ◻
]

The sign in (3.7) is the one needed in the cavity argument: if a limiting field satisfies $B_h = p$, that field maximizes $ell \( v \) + 1 / 2 integral p v$ over admissible $v$.

In Ho’s normalization [17] Theorem 1.8, $ell \( h \) = - psi \( h \/ 2 \)$. Thus his covariance-path theorem gives the zero-field concavity above. Both conventions use the terminal function $log cosh$, so no additive $log 2$ term occurs. The preceding proof also gives the supporting inequality and endpoint statements in the form used below.

The functional $S$ is finite except at the single extremal quantile $p = 1$. A quantitative bound will also clarify the trial domain in the upper comparison.

#thm([Lemma 3.5.])[
  #emph[For $p in cal(P)$, put $d = integral_0^1 \( 1 - p \( s \) \) thin d s$. If $d > 0$, then 
#[#set math.equation(numbering: n => "(3.9)")
 $ 0 lt.eq S \( p \) lt.eq \( d^(- 1) - 1 \) log 2 . $ <fld:domain-bound>]

 If $d = 0$, so that $p = 1$ almost everywhere, then $S \( p \) = + oo$. Moreover $S$ is increasing in the pointwise order on quantiles.]
] <fld:domain>

#proof[
  The zero field gives $S \( p \) gt.eq 0$, and monotonicity follows because every admissible field is nonnegative. Suppose $0 < d lt.eq 1$, and define
  $ g_d \( z \) = 1 / d log \( 2 cosh \( d z \) \) - log 2 . $
  Then $g_d gt.eq log cosh$: with $r = 1 \/ d gt.eq 1$, the inequality $\( a + b \)^r gt.eq a^r + b^r$ applied to $a = e^(d z)$ and $b = e^(- d z)$ gives this assertion. For $0 lt.eq zeta lt.eq 1$ and $v gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ T_(zeta \, v) g_d lt.eq g_d + 1 / 2 max \( zeta \, d \) v . $ <fld:majorant>]
  Indeed, if $zeta gt.eq d$, apply Minkowski’s inequality with exponent $r = zeta \/ d gt.eq 1$ to $e^(d z + d G) + e^(- d z - d G)$, where $G tilde.op gamma_v$. The $L^r$ norm of either exponential gains the factor $e^(r d^2 v \/ 2)$, proving the bound $zeta v \/ 2$. If $0 < zeta lt.eq d$, Jensen’s inequality for the concave power $zeta \/ d$ gives the bound $d v \/ 2$. At $zeta = 0$, apply Jensen directly to the logarithm to obtain the same bound.
  Iterate (3.10) through the field recursion. Since $g_d \( 0 \) = \( d^(- 1) - 1 \) log 2$, this yields
  $ ell \( h \) lt.eq \( d^(- 1) - 1 \) log 2 - 1 / 2 sum_i \( 1 - max \( zeta_i \, d \) \) \( h_i - h_(i - 1) \) = \( d^(- 1) - 1 \) log 2 - 1 / 2 integral_d^1 h \( s \) thin d s . $
  For any nonnegative nondecreasing $h$,
  $ integral_0^1 \( 1 - p \( s \) \) h \( s \) thin d s gt.eq integral_0^d h \( s \) thin d s . $
  To see this, the density $1 - p$ lies in $\[ 0 \, 1 \]$ and has mass $d$; among all such densities the integral against an increasing function is minimized by $upright(bold(1))_(\( 0 \, d \))$. For $d = 1$ the assertion is immediate. For $0 < d < 1$, subtract this indicator and then subtract the constant $h \( d \)$ from the integrand: the resulting product is nonnegative on both sides of $d$. Combining the last two displays gives (3.9) after taking the supremum over $h$.
  Finally, for $p = 1$ take the constant field $h \( s \) = H$. Its recursion is ordinary expectation at the root, and
  $ ell \( h \) + 1 / 2 integral_0^1 h \( s \) thin d s = bb(E) log cosh \( sqrt(H) thin G \) gt.eq sqrt(H) thin bb(E) \| G \| - log 2 arrow.r oo \, $
  where $G$ is standard Gaussian. This proves the last case. ◻
]

== 4 Perturbations and spectral rotation identities <sec:rotation>

We now determine the overlap in each spectral subspace from the total overlap. Two ingredients enter: a small perturbation makes subsequential overlap laws satisfy the Ghirlanda–Guerra identities, and differentiation under Haar rotations then gives equations for the individual spectral overlaps. We prove these statements for a general deterministic spin prior, since the same identities will also be needed on magnetization slices.

=== 4.1 Enrichment and perturbations <enrichment-and-perturbations>

Throughout this section, the spectral alphabet $lambda_1 \, dots.h \, lambda_m$ is fixed and bounded. Write $I_(a \, N)$ for the spectral coordinates assigned to group $a$, and suppose that $rho_(a \, N) = \| I_(a \, N) \| \/ N$ tends to $rho_a > 0$. The prior $nu_N$ is any deterministic probability measure on ${ - 1 \, 1 }^N$, independent of the Haar matrix $U$ and held fixed as the parameters in this section vary. A finite nonzero positive measure is also allowed after normalization: its logarithmic mass is a deterministic addition to the log partition function. In particular, neither permutation symmetry of the prior nor full support on the cube is assumed.

Fix a step partition with interval lengths $w_i > 0$, $0 lt.eq i < k$, and cascade exponents $zeta_i = sum_(l < i) w_l$. Let $\( v_alpha \)$ be the associated cascade weights. Write $c \( alpha \, alpha' \) in { 0 \, dots.h \, k - 1 }$ for the common level of two leaves, including $k - 1$ for equal leaves, and define

$ T_(alpha alpha') = frac(c \( alpha \, alpha' \), k) . $

This is a Gram kernel, with diagonal $\( k - 1 \) \/ k$. For $0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1)$, let $z_i \( alpha \)$, $1 lt.eq i lt.eq N$, be independent hierarchical Gaussian fields with covariance

$ bb(E) z_i \( alpha \) z_j \( alpha' \) = upright(bold(1))_({ i = j }) h_(c \( alpha \, alpha' \)) . $

They are independent of $U$ and of the cascade weights. The enriched Hamiltonian, before the small perturbations, is

$ t / 2 sigma^(sans(T)) U^(sans(T)) Lambda_N U sigma + sum_(i = 1)^N z_i \( alpha \) sigma_i - N / 2 h_(k - 1) \, #h(2em) 0 lt.eq t lt.eq 1 . $

For the uniform cube prior and $t = 0$, its expected pressure is $ell \( h \)$, by factorization in the backward recursion. The unenriched model is the case $k = 1$, $h_0 = 0$.

Enumerate the monomial kernels $kappa_j$ in $\( A^1 \, dots.h \, A^m \, T \)$, with nonnegative integer degrees and degree at most $C \( 1 + j \)$. The constant kernel may be omitted. These are Gram kernels, bounded by one in absolute value. Conditional on $U$, take independent centered Gaussian fields $Y_j$ with covariance $kappa_j$, independent of the cascade weights and the linear enrichment. One concrete realization uses coefficient tensors applied to

$ ⨂_(a = 1)^m (frac(\( U sigma \)_(I_(a \, N)), sqrt(N)))^(⊗ r_a) $

for the spin part of a monomial. For a factor $T^r$, use independent copies of that tensor at the tree levels with variances given by the increments of $\( i \/ k \)^r$. If $r = 0$, a single common tensor suffices. Thus these fields can be chosen smooth in $U$, and their child marks are conditionally independent given the preceding levels.

The perturbation has two tasks. A term linear in the projected diagonal overlaps makes those overlaps concentrate, and Gaussian monomial terms enforce joint GG identities. We choose their strengths so that both perturbations are negligible for the pressure, while pressure concentration still controls the overlap fluctuations.

Set $e_N = N^(- 1 \/ 16)$. For parameters $u_j \, v_a in \[ 1 \, 2 \]$, add

#[#set math.equation(numbering: n => "(4.1)")
 $ V_N \( sigma \, alpha \) = N e_N sum_(a = 1)^m v_a A_11^a \( sigma \) + sqrt(N) e_N sum_(j lt.eq N) 2^(- j) u_j Y_j \( sigma \, alpha \) $ <rot:perturbation>]

to the Hamiltonian. Denote the resulting random pressure by $P_N^(upright("enr")) \( t \, h \, u \, v \)$. Gibbs brackets include the spin and cascade label, and $bb(E)$ averages all disorder. Direct comparison for the first term and Gaussian comparison for the second give, uniformly in the displayed parameters,

#[#set math.equation(numbering: n => "(4.2)")
 $ lr(|bb(E) P_N^(upright("enr")) - bb(E) P_N^(upright("enr") \, 0)|) lt.eq C e_N . $ <rot:small-pressure>]

Here the superscript $0$ denotes omission of $V_N$, with the same prior and enrichment.

Conditional on $U$ and the common data, the spin partition integral at a leaf is a positive hierarchical mark. Proposition 5 therefore applies to this integral, including (4.1). In particular,

#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) chevron.l upright(bold(1))_({ c \( alpha^1 \, alpha^2 \) = i }) chevron.r = w_i . $ <rot:level-law>]

This is an identity after disorder averaging; no assertion about the level probabilities in an individual realization is needed.

=== 4.2 Concentration and overlap identities <concentration-and-overlap-identities>

The group Poincaré estimate is classical; Haar concentration on the special orthogonal group is part of the curvature approach of Gromov–Milman and Bakry–Émery [14,3]. We prove the estimate needed here and account for the two components of the orthogonal group.

#thm([Lemma 4.1.])[
  (Concentration).  #emph[For the preceding models, fix the cascade partition and a bound on $h_(k - 1)$. There is a constant independent of $N$, of the deterministic prior, and of the remaining parameters in their stated ranges such that 
#[#set math.equation(numbering: n => "(4.4)")
 $ "Var" \( P_N^(upright("enr")) \) lt.eq C / N . $ <rot:variance>]

 The same assertion holds on any fixed slightly enlarged bounded interval for the perturbation parameters. For the pressure of the original Haar model, without Gaussian enrichment or perturbations, 
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) \| P_N - bb(E) P_N \|^4 lt.eq C / N^2 . $ <rot:fourth>]

 The constants are independent of deterministic weights in the spin prior.]
] <rot:concentration>

#proof[
  We first record the elementary gradient estimates used below. For standard Gaussian data $g$,
  $ "Var" f \( g \) lt.eq bb(E) \| nabla f \( g \) \|^2 . $
  For completeness, differentiate $bb(E) f \( g \) f \( r g + sqrt(1 - r^2) g' \)$ in $0 < r < 1$; Gaussian integration by parts gives the corresponding scalar product of gradients, bounded by $bb(E) \| nabla f \( g \) \|^2$, and integration in $r$ proves the inequality. Approximation extends it from smooth bounded functions to Lipschitz functions. Applied to $f \( g \/ \| g \| \)$, radial independence yields the sphere bound
  $ "Var"_(bb(S)^(d - 1)) f lt.eq frac(1, d - 2) bb(E) \| nabla_(bb(S)^(d - 1)) f \|^2 \, #h(2em) d > 2 . $
  One may cut off at $g = 0$ before passing to this formula.
  Here is a corresponding bound on $S O \( d \)$. Let its Dirichlet form be the expected sum of squares of the derivatives generated by column-plane rotations, and let $C_d$ be a Poincare constant for that form. Conditional on a column, the fiber is $S O \( d - 1 \)$. Its conditional variance is bounded using the pairs that do not involve that column. Moving the column in a unit tangent direction transports the entire fiber by a rotation; Jensen’s inequality bounds the squared gradient of the conditional mean by the conditional sum of squares of the derivatives involving that column. Apply the sphere bound to the conditional mean and average over the choice of column. Each pair appears in $d - 2$ fibers and involves two columns, so
  $ C_d lt.eq (1 - 2 / d) C_(d - 1) + frac(2, d \( d - 2 \)) \, #h(2em) d > 2 . $
  The circle has a finite Poincare constant. Multiplication by $d \( d - 1 \)$ in this recurrence gives $C_d = O \( d^(- 1) \)$. The Dirichlet form of a Frobenius-Lipschitz function is bounded by a fixed multiple of its squared Lipschitz constant.
  Conditional on $U$, apply the backward marked-cascade recursion to $Z_N = exp \( N P_N^(upright("enr")) \)$. Proposition 5 gives
  $ log Z_N = cal(R)_N \( g_0 \) + log S' - log S \, $
  where $g_0$ denotes the common Gaussian marks, $cal(R)_N$ is the root recursion value, and $S \, S'$ are unnormalized cascade totals with the same conditional law. For the fixed cascade partition, their log variances are bounded, also conditional on $U \, g_0$. In particular the conditional second moment of $log S' - log S$ is bounded uniformly. The root recursion is $C sqrt(N)$-Lipschitz in the common standard Gaussian coefficients. Indeed each exponent has that coefficient-norm bound: the spin norm is $sqrt(N)$, the field heights are bounded, and the squared perturbation coefficients sum to $O \( N e_N^2 \)$. Integration and log-exponential integration preserve a common Lipschitz bound. The Gaussian inequality thus bounds the conditional variance of the normalized log partition by $C \/ N$.
  It remains to control its conditional mean as a function of $U$. For deterministic quadratic terms the normalized exponent is uniformly Lipschitz in Frobenius distance, since $\| sigma \| = sqrt(N)$. For the Gaussian terms, compare conditional covariances. Each projected overlap is uniformly Lipschitz in $U$; the degrees of the monomials grow at most linearly, and $sum_j \( 1 + j \) 4^(- j) < oo$. Gaussian comparison, divided by $N$, therefore gives a uniform Lipschitz bound on $bb(E) \[ P_N^(upright("enr")) divides U \]$. The linear enrichment is independent of $U$. This conditional mean depends only on the spectral projectors, so multiplication of one spectral row by $- 1$ shows that it has the same law on both components of $O \( N \)$. The group inequality and conditional variance decomposition prove (4.4).
  Without the added Gaussian fields, $P_N$ itself is uniformly Lipschitz in $U$ and depends only on those projectors. Write $F = P_N - bb(E) P_N$. Applying the group inequality first to $F$ and then to $F^2$ gives
  $ bb(E) F^2 lt.eq C \/ N \, #h(2em) "Var" \( F^2 \) lt.eq \( C \/ N \) bb(E) F^2 lt.eq C \/ N^2 . $
  Since $bb(E) F^4 = "Var" \( F^2 \) + \( bb(E) F^2 \)^2$, this proves (4.5). Smoothing by small group translates justifies these applications for Lipschitz functions. All estimates used only the common spin norm and normalization of the prior. ◻
]

We next specify both ways in which the perturbation parameters will be chosen. For the upper bound they are deterministic minimizers of an expected objective. For the lower bound they are averaged, and we retain parameter sets on which every subsequential limit has the required overlap identities.

#thm([Proposition 4.2.])[
  (Perturbations enforcing GG).  #emph[Use (4.1), and fix the finite cascade partition and a compact range of the other parameters. The following two procedures give limiting arrays with deterministic diagonals and joint Ghirlanda–Guerra identities for $\( A^1 \, dots.h \, A^m \, T \)$.]
  + #emph[Choose a deterministic minimum of 
$ - bb(E) P_N^(upright("enr")) \( t \, h \, u \, v \) + J_N \( t \, h \) + Pi_N \( u \, v \) \, #h(2em) Pi_N = sum_(j lt.eq N) 2^(- j) \( u_j - 3 \/ 2 \)^2 + sum_a \( v_a - 3 \/ 2 \)^2 \, $

 over any compact set of the other parameters and $\( u \, v \) in \[ 1 \, 2 \]^(N + m)$; here $J_N$ is independent of $u \, v$. Every subsequential overlap limit at these minima, after a further subsequence for the diagonal means, has the stated properties.]
  + #emph[Fix any deterministic sequence of the other parameters and integrate over product uniform probability $eta$ on $Theta = \[ 1 \, 2 \]^(bb(N)) times \[ 1 \, 2 \]^m$, ignoring $u_j$ for $j > N$. There are measurable sets $cal(G)_N subset Theta$ with $eta \( cal(G)_N \) arrow.r 1$ such that every sequence $theta_N in cal(G)_N$ has the same properties at each subsequential overlap limit, after selecting convergent diagonal means.]
  #emph[These assertions hold for every deterministic prior described above. They remain valid when $t = t_N$ and the bounded enrichment parameters vary with $N$.]
] <rot:gg>

#proof[
  Let $g_N = bb(E) P_N^(upright("enr"))$. For each fixed perturbation coordinate $d$, convexity of the log partition makes $P_N^(upright("enr"))$ and $g_N$ convex in $d$. Expected first derivatives are uniformly bounded on a slightly enlarged interval. More precisely, direct differentiation gives an $O \( e_N \)$ bound for a $v_a$-derivative, and Gaussian integration by parts gives $O_j \( e_N^2 \)$ for a fixed $u_j$-derivative.
  In the first procedure, comparison with the centered choice of one coordinate shows that each fixed coordinate lies in the interior for all large $N$. At a minimum, its first derivative matches the penalty derivative. Comparison with the choices $d + s$ and $d - s$ therefore gives
  $ 0 lt.eq g_N \( d + s \) - g_N \( d \) - s g'_N \( d \) lt.eq C_d s^2 $
  and the analogous negative-increment estimate, whenever the increments remain in the interval. In particular $0 lt.eq g''_N \( d \) lt.eq C_d$. Convex secants for the random function, followed by Lemma 14, imply
  $ bb(E) \| partial_d P_N^(upright("enr")) - partial_d g_N \| lt.eq C_d (s + N^(- 1 \/ 2) / s) . $
  With $s = N^(- 1 \/ 4)$, the right side is $O_d \( N^(- 1 \/ 4) \) = o \( e_N^2 \)$. The parameter minimum is deterministic, so the uniform pointwise variance estimate applies without conditioning on the disorder.
  For the second procedure, integrate the same convex-secant inequalities in $d$. The integral of $g'_N \( d + s \) - g'_N \( d - s \)$ is $O_d \( s \)$, by the endpoint bounds on the expected first derivatives on the enlarged interval. Thus
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral_Theta bb(E) \| partial_d P_N^(upright("enr")) - partial_d g_N \| thin d eta = O_d \( N^(- 1 \/ 4) \) . $ <rot:derivative-fluctuation>]
  Convexity and the same endpoint bounds also give $integral_Theta g''_N \( d \) thin d eta lt.eq C_d$.
  These estimates control both thermal and disorder fluctuations. For a group coordinate,
  $ partial_(v_a) P_N^(upright("enr")) = e_N chevron.l A_11^a chevron.r \, #h(2em) partial_(v_a)^2 g_N = N e_N^2 bb(E) "Var"_(chevron.l dot.op chevron.r) \( A_11^a \) . $
  Consequently the mean absolute disorder fluctuation of $chevron.l A_11^a chevron.r$ is $O \( N^(- 3 \/ 16) \)$, and its mean absolute thermal fluctuation is $O \( N^(- 7 \/ 16) \)$. Here and below these bounds hold at a minimum in the first procedure and after integration in the second. At the minima, select a convergent subsequence of the deterministic means $d_(a \, N) = bb(E) chevron.l A_11^a chevron.r$. For the averaged procedure, the means are first kept as functions $d_(a \, N) \( theta \)$; select their limits only after choosing a sequence $theta_N in cal(G)_N$ as below. In either procedure the resulting subsequence satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) chevron.l \| A_11^a - d_a \| chevron.r arrow.r 0 \, #h(2em) d_a gt.eq 0 \, quad sum_a d_a = 1 . $ <rot:fixed-diagonals>]
  For the Gaussian coordinate,
  $ partial_(u_j) P_N^(upright("enr")) = frac(e_N 2^(- j), sqrt(N)) chevron.l Y_j chevron.r \, #h(2em) partial_(u_j)^2 g_N = e_N^2 4^(- j) bb(E) "Var"_(chevron.l dot.op chevron.r) \( Y_j \) . $
  Its mean absolute disorder and thermal fluctuations are respectively $O_j \( N^(5 \/ 16) \)$ and $O_j \( N^(1 \/ 16) \)$. Since $sqrt(N) e_N = N^(7 \/ 16)$, this proves
  #[#set math.equation(numbering: n => "(4.8)")
   $ bb(E) chevron.l \| Y_j - bb(E) chevron.l Y_j chevron.r \| chevron.r = o_j \( sqrt(N) e_N \) . $ <rot:field-fluctuation>]
  In the integrated case, the centers in these estimates are always the expectations at the fixed parameter $theta$. Markov’s inequality, followed by a diagonal choice over the finitely many group coordinates and the countably many fixed indices $j$, produces measurable sets $cal(G)_N$ on which all these normalized fluctuation errors tend to zero uniformly. Their probabilities tend to one. This proves the required assertion for every sequence chosen from the sets, rather than only almost every fixed parameter.
  Finally, let $Phi$ be a bounded continuous overlap test on $n$ replicas. Conditional Gaussian integration by parts gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ bb(E) chevron.l Y_j \( 1 \) Phi chevron.r =  & sqrt(N) e_N 2^(- j) u_j bb(E) ⟨Phi (sum_(l = 1)^n kappa_j \( 1 \, l \) - n kappa_j \( 1 \, n + 1 \))⟩ . $ <rot:gg-ibp>]
  Compare this with its one-replica version multiplied by $bb(E) chevron.l Phi chevron.r$, use (4.8), and then use the deterministic diagonal limits (4.7). Every subsequential limit satisfies GG for each monomial $kappa_j$. Polynomials are dense in the continuous functions on the compact overlap state space, so these identities give joint GG for the entire vector. The array structure results of Section 2 now apply. ◻
]

All Gaussian differentiations above may first be performed after restricting the cascade prior to finitely many leaves of total mass tending to one. At each $N$, the variances of the additive Gaussian fields are bounded. Jensen’s inequality on the normalized prior bounds moments of inverse Gaussian partition factors, while Gaussian exponential moments bound the differentiated numerators. These bounds justify passage from the finite restrictions, also at tied or zero enrichment levels by one-sided limits.

=== 4.3 Identities from Haar rotations <identities-from-haar-rotations>

The preceding proposition supplies the deterministic diagonals needed to close the rotation equations. We next derive those equations without any symmetry assumption on the spin prior.

#thm([Proposition 4.3.])[
  (Spectral Ward identities).  #emph[Consider a subsequential overlap limit supplied by Proposition 15, and suppose $t_N arrow.r t in \[ 0 \, 1 \]$. For distinct group indices $a \, b$, and every bounded continuous $Phi : \[ - 1 \, 1 \] arrow.r bb(R)$, 
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(E) #h(-0.16667em) [Phi \( Q_12 \) \( rho_b A_12^a - rho_a A_12^b \)] =  & t \( lambda_a - lambda_b \) bb(E) #h(-0.16667em) [Phi \( Q_12 \) \( d_a A_12^b + A_12^a d_b - 2 A_13^a A_23^b \)] \,\
rho_b d_a - rho_a d_b =  & t \( lambda_a - lambda_b \) (d_a d_b - bb(E) \[ A_12^a A_12^b \]) . $ <rot:ward-off>]

 The assertion includes equal eigenvalues in distinct groups.]
] <rot:ward>

#proof[
  Choose row indices $i in I_(a \, N)$, $j in I_(b \, N)$, and differentiate under the plane rotation $x'_i = x_j \, med x'_j = - x_i$. Apply this derivative to $chevron.l x_i^1 x_j^2 Phi \( Q_12 \) chevron.r$, keeping the Gaussian coefficient tensors and the independent linear enrichment fixed. The Haar-averaged derivative is zero. The total overlap $Q_12$ is rotation invariant, so no derivative hits $Phi$. Summing the coordinate derivative over $i \, j$ and dividing by $N^2$ gives
  $ rho_(a \, N) A_12^b - rho_(b \, N) A_12^a . $
  The derivative of the main Hamiltonian is $t_N \( lambda_a - lambda_b \) x_i x_j$. The two-replica Gibbs-ratio derivative thus contributes
  $ t_N \( lambda_a - lambda_b \) (A_11^a A_12^b + A_12^a A_22^b - 2 A_13^a A_23^b) . $
  We check that the remaining terms disappear at the required scale. The deterministic perturbation derivative has coefficient $2 e_N \( v_a - v_b \)$ multiplying $x_i x_j$, and its normalized contribution is $O \( e_N \)$. For a Gaussian perturbation derivative, integrate by parts in its coefficient tensor, conditionally on $U$ and the cascade. Pairing with the Gibbs exponent supplies coefficient $N e_N^2 4^(- j) u_j^2$. Each one-endpoint derivative of its covariance is a sum of at most $C \( 1 + j \)$ terms consisting of bounded overlap factors times
  $ frac(x_j^u x_i^v, N) quad upright("or") quad frac(x_i^u x_j^v, N) . $
  Multiplication by $x_i^1 x_j^2$, summation over $i \, j$, and division by $N^2$ contract these coordinates into products of normalized projected inner products, whose absolute values are at most one. The total error is bounded by
  $ C e_N^2 sum_(j gt.eq 1) \( 1 + j \) 4^(- j) = O \( e_N^2 \) . $
  The independent linear enrichment contributes nothing. Finite cascade restrictions justify the differentiations as above. Pass to the limit and use the deterministic diagonals to obtain (4.10).
  The same calculation with $x_i^1 x_j^1$ and a one-replica Gibbs integral gives (4.10). In this calculation the exponent derivative is still $t_N \( lambda_a - lambda_b \) x_i x_j$, and the Gibbs derivative has one subtraction replica. This accounts for the coefficient without an additional factor of two. ◻
]

=== 4.4 Products of replica paths <products-of-replica-paths>

The product and symbol below are familiar from Parisi-matrix algebra and the replica Fourier transform; see Mézard–Parisi [20] Appendix II and Müller–Pankov [21] Appendix E. We derive the corresponding product directly from synchronized overlap identities, including atoms and jumps. Our immediate aim is to regard the diagonal and conditional off-diagonal expressions in the Ward identities as one product of paths, and then turn that product into ordinary multiplication by taking symbols.

By joint GG and synchronization, the group off-diagonal overlaps have simultaneous nondecreasing quantiles $p_a$, with $sum_a p_a = p$. In particular each $p_a$ is constant on every plateau of $p$. We encode a diagonal and an off-diagonal path by $L = \( d \, l \)$, and define its symbol by

#[#set math.equation(numbering: n => "(4.11)")
 $ hat(L) \( s \) = d - s l \( s \) - integral_s^1 l \( u \) thin d u \, #h(2em) 0 < s < 1 . $ <rot:symbol>]

We choose right-continuous versions where appropriate. The symbol alone does not determine a path: replacing $\( d \, l \)$ by $\( d + c \, l + c \)$ leaves it unchanged. We therefore retain the root value $l \( 0 + \)$ as well. For the total overlap,

$ hat(Q) \( s \) = 1 - s p \( s \) - integral_s^1 p \( u \) thin d u = D_p \( p \( s \) \) . $

#thm([Lemma 4.4.])[
  (Replica product).  #emph[For the synchronized paths $L_a = \( d_a \, p_a \)$ and $L_b = \( d_b \, p_b \)$, the diagonal and conditional off-diagonal expressions on the right of (4.10) and (4.10), respectively, form a path $L_a star.op L_b$ with diagonal 
$ d_a d_b - integral_0^1 p_a \( u \) p_b \( u \) thin d u $

 and off-diagonal 
#[#set math.equation(numbering: n => "(4.12)")
 $ hat(L)_a \( s \) p_b \( s \) + p_a \( s \) hat(L)_b \( s \) + s p_a \( s \) p_b \( s \) - integral_0^s p_a \( u \) p_b \( u \) thin d u . $ <rot:product-path>]

 Its symbol and root are 
$ accent(L_a star.op L_b, ̂) & = hat(L)_a thin hat(L)_b \,\
\( L_a star.op L_b \) \( 0 + \) & = hat(L)_a \( 0 + \) p_b \( 0 + \) + p_a \( 0 + \) hat(L)_b \( 0 + \) . $

]
] <rot:product>

#proof[
  Conditional on $Q_12 = q$, GG gives the marginal of $Q_13$ as one half of the law of $Q_12$ plus one half of $delta_q$. Ultrametricity forces $Q_13 = Q_23$ below $q$, and forces the other overlap to equal $q$ when one exceeds $q$. To include atoms explicitly, suppose the quantile equals $q$ on $\( alpha \, beta \)$. Write $a_(*)$ and $b_(*)$ for the constant values of $p_a$ and $p_b$ on that interval. The preceding conditional laws give
  $ 2 bb(E) \[ A_13^a A_23^b divides Q_12 = q \] =  & integral_0^alpha p_a \( u \) p_b \( u \) thin d u + b_(*) integral_beta^1 p_a \( u \) thin d u + a_(*) integral_beta^1 p_b \( u \) thin d u\
 & + \( 2 beta - alpha \) a_(*) b_(*) . $
  This is exactly the expression subtracted from $d_a p_b + p_a d_b$ in (4.12), evaluated as $s arrow.t beta$. Formula (4.12) is constant across the plateau. The same disintegration with $alpha = beta$ gives the formula at non-atomic values, for almost every conditioning value.
  For the algebraic claims, the Stieltjes identity
  $ d hat(L) = - s thin d l $
  follows from (4.11). If $c$ denotes (4.12), its jump at a common discontinuity $v$ is
  $ Delta c = hat(L)_a \( v - \) Delta p_b + \( Delta p_a \) hat(L)_b \( v + \) . $
  Its continuous Stieltjes part obeys the corresponding product rule. Thus $d accent(L_a star.op L_b, ̂) = d \( hat(L)_a hat(L)_b \)$. At $1 -$, subtracting the off-diagonal from the diagonal gives $\( d_a - p_a \( 1 - \) \) \( d_b - p_b \( 1 - \) \)$, the required endpoint product. The symbols consequently agree everywhere up to the choice of versions. Taking $s arrow.b 0$ in (4.12) gives the root formula. ◻
]

=== 4.5 Reconstruction in each spectral group <reconstruction-in-each-spectral-group>

Let $b_t \( x \)$ be the inverse resolvent for the finite law $sum_a rho_a delta_(t lambda_a)$, and set

#[#set math.equation(numbering: n => "(4.13)")
 $ f_a \( x \) = frac(rho_a, b_t \( x \) - t lambda_a) quad \( x > 0 \) \, #h(2em) f_a \( 0 \) = 0 . $ <rot:f>]

For a finite alphabet of positive proportions, $b_t \( x \) > max_a t lambda_a$ for $x > 0$. The functions $f_a$ are smooth jointly in $x \, t$, including $x = 0$: near zero, apply the inverse function theorem with $1 \/ b_t$ as the inverse variable. Moreover

#[#set math.equation(numbering: n => "(4.14)")
 $ f'_a \( x \) = frac(rho_a \/ \( b_t \( x \) - t lambda_a \)^2, sum_b rho_b \/ \( b_t \( x \) - t lambda_b \)^2) \, #h(2em) f'_a \( 0 \) = rho_a \, #h(2em) sum_a f'_a \( x \) = 1 . $ <rot:f-derivative>]

#thm([Proposition 4.5.])[
  (Projected-overlap paths).  #emph[Under the hypotheses of Proposition 16, let $p$ be the quantile of the total overlap. Then the entire group path is determined by $p$: 
#[#set math.equation(numbering: n => "(4.15)")
 $ p_a \( s \) = integral_0^(p \( s \)) f'_a \( D_p \( r \) \) thin d r \, #h(2em) d_a = integral_0^1 f'_a \( D_p \( r \) \) thin d r . $ <rot:full-paths>]

 These formulas hold at $t = 0$, for repeated eigenvalues, and when $D_p \( p \( s \) \) = 0$. More generally, for a smooth scalar or matrix function $f$ on $\[ 0 \, 1 \]$, the path 
#[#set math.equation(numbering: n => "(4.16)")
 $ l_f \( s \) = integral_0^(p \( s \)) f' \( D_p \( r \) \) thin d r \, #h(2em) d_f = f \( 0 \) + integral_0^1 f' \( D_p \( r \) \) thin d r $ <rot:function-path>]

 has symbol $f \( D_p \( p \( s \) \) \)$ and root $p \( 0 + \) f' \( D_p \( p \( 0 + \) \) \)$. Symbol and root uniquely determine a bounded-variation path.]
] <rot:paths>

#proof[
  By Lemma 17, the two Ward identities combine into
  $ rho_b L_a - rho_a L_b = t \( lambda_a - lambda_b \) \( L_a star.op L_b \) . $
  Set $alpha_a = hat(L)_a \( s \)$ and $x = sum_a alpha_a$. GG positivity and Gram bounds give $0 lt.eq p_a \( s \) lt.eq d_a$, so $alpha_a gt.eq 0$, and $x = D_p \( p \( s \) \)$. If $x > 0$, every $alpha_a$ is positive: a zero component paired with a positive component would give $- rho_a alpha_b = 0$. Dividing the symbol equations therefore gives a common number
  $ rho_a / alpha_a + t lambda_a = b quad upright("for every ") a . $
  The positive sum constraint is the resolvent equation for $b_t \( x \)$. Hence $alpha_a = f_a \( x \)$. If $x = 0$, all the symbols are zero, which is the same conclusion.
  At the root, put $r_a = p_a \( 0 + \)$, $p_0 = sum_a r_a$, and $x = D_p \( p_0 \)$. The root equations are
  $ rho_b r_a - rho_a r_b = t \( lambda_a - lambda_b \) #scale(x: 120%, y: 120%)[\(] f_a \( x \) r_b + r_a f_b \( x \) #scale(x: 120%, y: 120%)[\)] . $
  For $x > 0$, substitution of (4.13) shows that
  $ frac(\( b_t \( x \) - t lambda_a \)^2, rho_a) thin r_a $
  is independent of $a$. The sum constraint and (4.14) give $r_a = p_0 f'_a \( x \)$. For $x = 0$, the root equations directly give $rho_b r_a = rho_a r_b$, and therefore $r_a = rho_a p_0 = p_0 f'_a \( 0 \)$.
  It remains to recover the paths, including their diagonals, from these data. Let $F_p \( r \) = \| { s : p \( s \) lt.eq r } \|$. Then $D'_p \( r \) = - F_p \( r \)$ almost everywhere and $D_p \( 1 \) = 0$. For the path in (4.16), Fubini’s theorem gives
  $ hat(L)_f \( s \) & = f \( 0 \) + integral_(p \( s \))^1 F_p \( r \) f' \( D_p \( r \) \) thin d r\
 & = f \( D_p \( p \( s \) \) \) . $
  Since $D_p$ is constant on $\[ 0 \, p_0 \]$, its root is $p_0 f' \( D_p \( p_0 \) \)$. Finally, equal symbols imply equal Stieltjes derivatives of the off-diagonal paths on every $\[ epsilon.alt \, 1 \)$, because $d hat(L) = - s thin d l$. The paths differ by a constant, fixed by the root, and the symbol then fixes the diagonal. This also treats jumps accumulating at zero. Applying this calculation to $f_a$ proves (4.15).
  No step divided by an eigenvalue difference. At $t = 0$, $f_a \( x \) = rho_a x$, so $p_a = rho_a p$ and $d_a = rho_a$. Tied eigenvalues similarly give proportional paths in the tied groups. If $p equiv 1$, then $D_p equiv 0$ and $p_a = d_a = rho_a$, also covered by the formulas. ◻
]

For later Gaussian marks, the diagonal excess in group $a$ is

$ d_a - p_a \( 1 - \) = integral_(p \( 1 - \))^1 f'_a \( D_p \( r \) \) thin d r gt.eq 0 . $

After division by $rho_a$, the corresponding function in (4.16) is $H_a \( x \) = \( b_t \( x \) - t lambda_a \)^(- 1)$, with $H_a \( 0 \) = 0$. Its derivative is bounded by $1 \/ rho_a$. Thus the group formulas give uniformly bounded Gaussian covariances for all trial paths, with zero residual variance when the top overlap is one.

== 5 The upper comparison <sec:upper>

We prove the upper bound in Theorem 1 for a finite spectral law $mu = sum_(a = 1)^m rho_a delta_(lambda_a)$, with every $rho_a > 0$. The spectral counts may be any deterministic sequence whose proportions converge to these masses. The rotation identities express the limiting energy through the total-overlap quantile. We first identify an order in which this energy is monotone, then obtain that order by minimizing an enriched pressure against a fixed trial.

#thm([Lemma 5.1.])[
  (Energy and tail order).  #emph[For $t in \[ 0 \, 1 \]$ and $p in cal(P)$, define 
$ F_t \( x \) = x R \( t x \) \, #h(2em) cal(E)_t \( p \) = 1 / 2 integral_0^1 F'_t \( D_p \( r \) \) thin d r . $

 At a limit satisfying Proposition 18, $cal(E)_t \( p \)$ is the expected interaction energy per spin with coefficient $Lambda_N$, before multiplication by $t$. The function $F_t$ is convex on $\[ 0 \, 1 \]$. In particular, 
#[#set math.equation(numbering: n => "(5.1)")
 $ integral_s^1 p \( u \) thin d u gt.eq integral_s^1 q \( u \) thin d u quad \( 0 lt.eq s lt.eq 1 \) quad arrow.r.double quad cal(E)_t \( p \) lt.eq cal(E)_t \( q \) . $ <up:tail-order>]

 Moreover, 
#[#set math.equation(numbering: n => "(5.2)")
 $ integral_0^t cal(E)_u \( q \) thin d u = G_t \( q \) = 1 / 2 integral_0^1 t R \( t D_q \( r \) \) thin d r . $ <up:primitive>]

 Writing $L = max_a \| lambda_a \|$, one has $\| cal(E)_t \( p \) \| lt.eq L \/ 2$.]
] <up:energy>

#proof[
  Let $b_t$ and $f_a$ be the resolvent functions for the spectrum $t lambda_a$, as in Proposition 18. That proposition gives
  $ 1 / 2 sum_a lambda_a d_a = 1 / 2 integral_0^1 sum_a lambda_a f'_a \( D_p \( r \) \) thin d r . $
  For $t > 0$, the identity $b_t \( x \) = t b \( t x \)$ implies
  $ sum_a lambda_a f_a \( x \) = frac(x b_t \( x \) - 1, t) = x R \( t x \) = F_t \( x \) . $
  The same identity holds by continuity at $t = 0$ and at $x = 0$. This proves the energy formula.
  For $t > 0$ and $x > 0$, set
  $ M_j = sum_a frac(rho_a, \( b_t \( x \) - t lambda_a \)^j) . $
  The resolvent equation says $M_1 = x$, and differentiation yields
  $ b'_t \( x \) = - 1 / M_2 \, #h(2em) b''_t \( x \) = frac(2 M_3, M_2^3) \, #h(2em) \( x b_t \( x \) \)'' = frac(2 \( M_1 M_3 - M_2^2 \), M_2^3) gt.eq 0 . $
  The inequality is Cauchy–Schwarz. Smooth extension at zero proves convexity on the closed interval; at $t = 0$, $F_0$ is linear. Also $f'_a gt.eq 0$ and $sum_a f'_a = 1$, so the displayed energy is an average of numbers in $\[ - L \/ 2 \, L \/ 2 \]$.
  For a nondecreasing quantile, its positive-part integral can be recovered from upper tails:
  $ integral_0^1 \( p \( u \) - r \)_(+) thin d u = max_(0 lt.eq s lt.eq 1) {integral_s^1 p \( u \) thin d u - \( 1 - s \) r} . $
  The hypothesis of (5.1) therefore gives $D_p lt.eq D_q$. Since $F'_t$ is nondecreasing, the energy order follows. Finally,
  $ frac(partial, partial t) #scale(x: 120%, y: 120%)[\[] t R \( t x \) #scale(x: 120%, y: 120%)[\]] = R \( t x \) + t x R' \( t x \) = F'_t \( x \) . $
  Integration in $t$ proves (5.2), including its endpoint at zero. ◻
]

#thm([Proposition 5.2.])[
  (Finite-spectrum upper bound).  #emph[Suppose the deterministic eigenvalues belong to a fixed finite set ${ lambda_1 \, dots.h \, lambda_m }$, and their proportions converge to $rho_a > 0$. Then 
$ limsup_(N arrow.r oo) bb(E) P_N lt.eq inf_(p in cal(P)) { S \( p \) + G_1 \( p \) } . $

]
] <up:bound>

#proof[
  Fix a finite step trial $q$ with values strictly below one. Denote its interval weights by $w_i > 0$, its values by $q_i$, and its left endpoints by $zeta_i$, for $0 lt.eq i < k$. By Lemma 13, $S \( q \) < oo$. Use the cascade on these intervals to form the enriched, perturbed pressure $P_N^(upright("enr")) \( t \, h \, upright(bold(u)) \, upright(bold(v)) \)$ of Section 4. Its linear field has covariance levels $h_i$, and the exponent includes the subtraction $- N h_(k - 1) \/ 2$.
  Suppose that the upper bound $S \( q \) + G_1 \( q \)$ fails along a subsequence. Choose $delta > 0$ small enough that, on this subsequence, the objective
  #[#set math.equation(numbering: n => "(5.3)")
   $ cal(J)_N \( t \, h \, upright(bold(u)) \, upright(bold(v)) \) =  & - bb(E) P_N^(upright("enr")) \( t \, h \, upright(bold(u)) \, upright(bold(v)) \) - 1 / 2 integral_0^1 q \( s \) h \( s \) thin d s\
 & + S \( q \) + G_t \( q \) + t delta + Pi_N \( upright(bold(u)) \, upright(bold(v)) \) . $ <up:objective>]
  has value at most $- eta$, for some fixed $eta > 0$, at $t = 1$, $h = 0$, and all perturbation parameters equal to $3 \/ 2$. Here
  $ Pi_N \( upright(bold(u)) \, upright(bold(v)) \) = sum_(j lt.eq N) 2^(- j) \( u_j - 3 \/ 2 \)^2 + sum_a \( v_a - 3 \/ 2 \)^2 . $
  This follows from the $O \( e_N \)$ perturbation comparison. Minimize $cal(J)_N$ on
  $ 0 lt.eq t lt.eq 1 \, #h(2em) 0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1) lt.eq H \, #h(2em) upright(bold(u)) in \[ 1 \, 2 \]^N \, quad upright(bold(v)) in \[ 1 \, 2 \]^m \, $
  where the fixed cap $H$ will be chosen below. Gaussian and direct comparison make the objective continuous, so a minimum exists.
  At a negative minimum, increasing the field in nonnegative monotone directions will force the limiting overlap quantile to have upper tails at least as large as those of $q$. Lemma 19 will then order their energies. A feasible decrease in $t$ gives the opposite energy inequality, with the strict margin $delta$. To make these two variations available, we first exclude $t = 0$ and the field cap. At $t = 0$, the unperturbed enriched pressure is exactly $ell \( h \)$. The definition of $S \( q \)$ and the uniform perturbation bound give
  #[#set math.equation(numbering: n => "(5.4)")
   $ cal(J)_N \( 0 \, h \, upright(bold(u)) \, upright(bold(v)) \) gt.eq - C e_N . $ <up:zero-time>]
  In fact the minimizing values of $t$ stay away from zero. For fixed other parameters, Lemma 19 and the spin norm bound give
  $ lr(|partial_t cal(J)_N|) lt.eq L + delta . $
  Comparing a minimum of value at most $- eta$ with (5.4), while retaining its other parameters, yields $t_N gt.eq eta \/ \[ 2 \( L + delta \) \]$ for all sufficiently large $N$.
  For the field cap, the recursion and $log cosh z lt.eq \| z \|$ give
  #[#set math.equation(numbering: n => "(5.5)")
   $ ell \( h \) lt.eq - 1 / 2 sum_i w_i h_i + sqrt(frac(2 h_0, pi)) + C_q . $ <up:cap-estimate>]
  Indeed a Gaussian increment of variance $v$ at positive exponent $zeta_i$ sends $\| z \|$ to a function bounded by $\| z \| + zeta_i v \/ 2 + \( log 2 \) \/ zeta_i$. Iterate over the positive levels and take ordinary expectation at the root. The identity $sum_i zeta_i \( h_i - h_(i - 1) \) = h_(k - 1) - sum_i w_i h_i$ then proves (5.5); when $k = 1$, the sum of positive-level constants is empty.
  The interaction changes the normalized log partition by at most $L \/ 2$, so
  $ bb(E) P_N^(upright("enr")) \( t \, h \, upright(bold(u)) \, upright(bold(v)) \) lt.eq ell \( h \) + L \/ 2 + C e_N . $
  Put $epsilon.alt = 1 - max_i q_i > 0$. Since $S \( q \) gt.eq 0$, $G_t \( q \) gt.eq - L \/ 2$, and the penalty is nonnegative, (5.5) implies, on $h_(k - 1) = H$,
  $ cal(J)_N gt.eq frac(epsilon.alt w_(k - 1), 2) H - sqrt(frac(2 H, pi)) - C_q - L - C e_N . $
  Choose $H$ large enough to make this positive for large $N$. Thus every minimum under consideration has $h_(k - 1) < H$. The partition of the trial is fixed throughout this choice; no uniformity in its number of intervals is required.
  At these minima, Proposition 15 applies to the deterministic minimizing perturbation parameters. Pass to a subsequence so that $t$ and the overlap arrays converge, and let $p$ be the limiting quantile of $Q_12$. The resulting array satisfies joint GG for the projected overlaps and the cascade level $T$. The cascade marking identity preserves the level probabilities $w_i$. Proposition 4 therefore represents $Q_12$ and $T_12$ by nondecreasing quantiles on the same unit interval. The quantile $p$ need not be constant on the trial intervals.
  We now use the field coordinates of the minimum to order the upper tails of $p$ and $q$. Let $g$ be any nonnegative nondecreasing step function on the fixed trial intervals, with values $g_i$, and define $gamma_g \( i \/ k \) = g_i$ on the cascade levels. A small increase of $h$ in direction $g$ is feasible, even if some levels are zero or tied, because the upper cap is inactive. The covariance derivative of the linear field is $N Q_12 gamma_g \( T_12 \)$. Its diagonal term is canceled by the subtraction $- N h_(k - 1) \/ 2$, so minimality gives
  $ 0 lt.eq D_g cal(J)_N = 1 / 2 bb(E) chevron.l Q_12 gamma_g \( T_12 \) chevron.r - 1 / 2 integral_0^1 q \( s \) g \( s \) thin d s . $
  By synchronized quantiles, the limit of the first expectation is $integral_0^1 p \( s \) g \( s \) thin d s$. Hence
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_0^1 p \( s \) g \( s \) thin d s gt.eq integral_0^1 q \( s \) g \( s \) thin d s . $ <up:contact-order>]
  Choose $g$ to be each upper-tail indicator of the partition. This proves the tail inequalities at its endpoints. The function $s mapsto integral_s^1 p$ is concave, because $p$ is nondecreasing, and therefore lies above its chords. The corresponding tail integral of $q$ is affine on each trial interval. The endpoint inequalities consequently hold at every $s in \[ 0 \, 1 \]$. Lemma 19 now yields $cal(E)_t \( p \) lt.eq cal(E)_t \( q \)$.
  It remains to vary $t$ at the same minimum. A move to the left is feasible, including when $t_N = 1$, so $partial_t cal(J)_N lt.eq 0$. Proposition 18 and Lemma 19 identify the limit of this derivative as
  $ - cal(E)_t \( p \) + cal(E)_t \( q \) + delta gt.eq delta > 0 . $
  This contradiction proves the upper bound for the fixed step trial $q$.
  Finally, given any $p in cal(P)$ with $S \( p \) < oo$, round its values down to finite steps $q_n$ such that $q_n lt.eq p$, $max q_n < 1$, and $parallel q_n - p parallel_oo arrow.r 0$. Nonnegativity of every admissible field gives $S \( q_n \) lt.eq S \( p \)$, while
  $ parallel D_(q_n) - D_p parallel_oo lt.eq parallel q_n - p parallel_1 $
  and continuity of $R$ give $G_1 \( q_n \) arrow.r G_1 \( p \)$. The step-trial bounds therefore imply
  $ limsup_(N arrow.r oo) bb(E) P_N lt.eq S \( p \) + G_1 \( p \) . $
  Trials with infinite $S \( p \)$ impose no further restriction, and taking the infimum proves the proposition. ◻
]

The field supremum remains inside the trial infimum: the contact argument fixes $q$ before introducing its finite-dimensional minimum. Section 6 supplies the matching lower bound, and Section 7 passes from finite alphabets to the spectral laws of Theorem 1.

== 6 The cavity lower bound <sec:cavity>

The cavity comparison belongs to the variational approach of Aizenman, Sims, and Starr [1]. Here the reservoir and added coordinates are coupled through fresh directions in the spectral eigenspaces; the rotation and quadratic-tilt identities required by this coupling are derived below.

We now prove the lower bound for a finite spectral alphabet with positive rational proportions. We compare systems of sizes $N$ and $N + n$, where $n$ is fixed and $s_a := n rho_a$ is integral for every $a$. The comparison must retain the base interaction: its eigenspaces contain the fresh directions that become Gaussian cavity variables. After evaluating the resulting change of measure, site symmetry will identify its field as a maximizer in the definition of $S$.

Fix a progression of dimensions with step $n$ and group counts satisfying

#[#set math.equation(numbering: n => "(6.1)")
 $ k_a \( N + n \) = k_a \( N \) + s_a \, #h(2em) frac(k_a \( N \), N) arrow.r rho_a . $ <cav:counts>]

All limits and uniform bounds in this section concern sufficiently large dimensions on this progression, with the alphabet, its proportions, and $n$ fixed. We use the unenriched perturbations of Section 4 at $t = 1$. Write $theta = \( u \, v \)$ for their parameters, $eta$ for the product uniform probability on their parameter space, and

$ Z_N^theta = upright("the perturbed partition function") \, #h(2em) cal(F)_N \( theta \) = bb(E) log Z_N^theta . $

The cube prior in $Z_N^theta$ remains its uniform probability. Proposition 15 supplies measurable sets $cal(G)_N$ with $eta \( cal(G)_N \) arrow.r 1$ such that every sequence $theta_N in cal(G)_N$ has, after extraction, joint GG limits with fixed spectral diagonals. We first bound the increments at any such sequence, and average over parameters only at the end.

=== 6.1 A coupling that preserves the base law <a-coupling-that-preserves-the-base-law>

Let $E : bb(R)^n arrow.r bb(R)^(N + n)$ embed the last $n$ coordinates, and let $P_a^(+)$ be the full spectral projectors. Define

$ M_a = E^(sans(T)) P_a^(+) E \, #h(2em) d = \( m - 1 \) n . $

The matrices $M_a$ converge in probability to $rho_a I_n$, and are positive definite almost surely for all sufficiently large dimensions. The first assertion follows from rotational symmetry and concentration; the second follows, for example, by representing a uniform frame with independent Gaussians. Throughout, zero-dimensional complementary spaces have the usual empty-matrix conventions.

#thm([Lemma 6.1.])[
  (Coupled interaction and fresh frames).  #emph[There is a coupling of the full interaction of size $N + n$ and an interaction of size $N$ with the spectral counts in (6.1) with the following properties. There are $d$ orthonormal special axes in the first $N$ coordinates and matrices 
#[#set math.equation(numbering: n => "(6.2)")
 $ mat(delim: "(", A_N, L_N; L_N^(sans(T)), C_N) arrow.r mat(delim: "(", A, L; L^(sans(T)), C) quad upright("in probability") \, #h(2em) C = #scale(x: 180%, y: 180%)[\(] sum_a rho_a lambda_a #scale(x: 180%, y: 180%)[\)] I_n \, $ <cav:blocks>]

 where $A_N \, A$ act on $bb(R)^d$. Fix a diagonal matrix $A_0$ with $n - s_a$ copies of $lambda_a$. If $y in bb(R)^d$ is the projection of a base spin $sigma$ onto the special axes, then adjoining $epsilon in { - 1 \, 1 }^n$ changes the main exponent by 
#[#set math.equation(numbering: n => "(6.3)")
 $ log W_N \( y \, epsilon \) = 1 / 2 y^(sans(T)) \( A_N - A_0 \) y + y^(sans(T)) L_N epsilon + 1 / 2 epsilon^(sans(T)) C_N epsilon . $ <cav:factor>]

 Conditional on the base spectral projectors, the special axes assigned to group $a$ form a uniform orthonormal $\( n - s_a \)$-frame in that group. They may be taken independent of the base perturbations given those projectors. For finitely many base replicas, their projection variables converge jointly with any overlap limit to centered Gaussian marks, independent across the axes conditional on the overlap array, with covariance $A_(l j)^a \/ rho_a$ for an axis assigned to group $a$. Moreover, for every fixed $q > 0$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ sup_(N \, theta) bb(E) chevron.l \| y \|^q chevron.r_(N \, theta) < oo . $ <cav:base-moments>]

 Here the brackets denote the base Gibbs probability and the expectation also includes the special frames.]
] <cav:coupling>

#proof[
  The mutually orthogonal spaces $"ran" \( P_a^(+) E \)$ have orthonormal coordinate maps $P_a^(+) E M_a^(- 1 \/ 2)$. In their direct sum, the cavity coordinate map is the vertical stack $\( M_a^(1 \/ 2) \)_a$. Its columns are orthonormal because $sum_a M_a = I_n$. Complete these columns to an orthonormal basis, with the complement first, using a rule continuous near the limiting stack $\( sqrt(rho_a) I_n \)_a$. One may project a fixed limiting complementary frame and orthonormalize it. In these coordinates the interaction is the left matrix of (6.2). Its limit is a conjugate of $xor.big_a lambda_a I_n$, with cavity column blocks $sqrt(rho_a) I_n$. This proves (6.2).
  The complement to the cavity coordinates in this direct sum lies in the first $N$ coordinates and has dimension $d$; its chosen basis gives the special axes. All other eigenvectors also lie in the first $N$ coordinates, with multiplicities $k_a \( N + n \) - n$. Retain them and assign $A_0$ to the special axes. The resulting base multiplicity is
  $ k_a \( N + n \) - n + \( n - s_a \) = k_a \( N + n \) - s_a = k_a \( N \) . $
  The geometric decomposition is thus
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(R)^(N + n) = underbrace(xor.big_a cal(R)_a, dim = N - d) xor underbrace(cal(V)_N, dim = d) xor underbrace(E bb(R)^n, dim = n) \, #h(2em) cal(R)_a = "ran" P_a^(+) ∩ ker E^(sans(T)) . $ <cav:decomposition>]
  The base interaction agrees with the full interaction on the first summand and uses $A_0$ on $cal(V)_N$. Subtracting the two quadratic forms gives (6.3).
  Conditional on $\( M_a \)_a$, rotations of the first $N$ coordinates act transitively on the remaining frame and subspace data. Their conditional law is therefore the invariant probability on this orbit. In particular the base interaction has its Haar law, independently of $\( M_a \)_a$. After conditioning further on the base projectors, the remaining freedom is the product of the rotations within their eigenspaces. The selected axes consequently have the asserted uniform frame law. Generate the base perturbations independently conditional on the projectors, using their prescribed Gaussian kernels. This preserves that conditional frame law; no full-system Gaussian coefficient realization is inherited by the base.
  For a uniform unit vector in a group of dimension $k_a \( N \)$, its projections on fixed replicas have covariance
  $ frac(\( sigma^l \)^(sans(T)) P_a sigma^j, k_a \( N \)) = frac(N, k_a \( N \)) A_(l j)^a . $
  Generate the fixed number of selected vectors by independent Gaussian vectors divided by $sqrt(k_a \( N \))$, then orthonormalize them. Their Gram matrix tends to the identity. Before orthonormalization the replica projections are already jointly Gaussian with the displayed covariances, which are uniformly bounded. The Gram correction thus does not change the limit. The sphere moment formula, or Gaussian radial independence, gives every fixed moment uniformly, since $parallel P_a sigma parallel lt.eq sqrt(N)$ and $k_a \( N \) \/ N$ stays bounded below. This proves (6.4) for any base Gibbs probability that is independent of the selected frames conditional on the projectors. ◻
]

Figure 1 summarizes the shared spectral spaces and the two interactions on the special coordinates.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((6.85, 5.3), (6.85, 5.45), (15.5, 5.45), (15.5, 5.3), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((11.18, 6.15), [#box(width: 8.441cm, inset: 0.07056cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$ xor.big_a "ran" (P_a^+E)$#linebreak()$m$ spectral subspaces of dimension $n$]]])])
  rect((1.25, 4.05), (6.15, 5.1), fill: rgb("#f5f5f5"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((3.7, 4.575), [#text(size: 9pt)[$ xor.big_a cal(R)_a$#linebreak()dimension $N-d$]])
  rect((6.85, 4.05), (11.4, 5.1), fill: rgb("#f0f0ff"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((9.125, 4.575), [#text(size: 9pt)[special complement $cal(V)_N$#linebreak()$d=(m-1)n$]])
  rect((11.4, 4.05), (15.5, 5.1), fill: rgb("#fff4e8"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((13.45, 4.575), [#text(size: 9pt)[cavity $E bb(R)^n$#linebreak()dimension $n$]])
  content((1.02, 2.9), [#text(size: 9pt)[Full]], anchor: "east", padding: 0.07056cm)
  rect((1.25, 2), (6.15, 3.8), fill: rgb("#f5f5f5"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((3.7, 2.9), [#text(size: 9pt)[$lambda_a$ on $cal(R)_a$#linebreak() $dim cal(R)_a=k_a(N+n)-n$]])
  content((6.5, 2.9), [#text(size: 9pt)[$plus.o$]])
  rect((6.85, 2.75), (11.4, 3.8), fill: rgb("#f0f0ff"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  rect((11.4, 2.75), (15.5, 3.8), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  rect((6.85, 2), (11.4, 2.75), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  rect((11.4, 2), (15.5, 2.75), fill: rgb("#fff4e8"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((9.125, 3.275), [#text(size: 9pt)[$A_N$]])
  content((13.45, 3.275), [#text(size: 9pt)[$L_N$]])
  content((9.125, 2.375), [#text(size: 9pt)[$L_N^( sans(T) )$]])
  content((13.45, 2.375), [#text(size: 9pt)[$C_N$]])
  content((3.7, 1.75), [#text(size: 8pt)[retained without change]])
  content((1.02, 0.85), [#text(size: 9pt)[Base]], anchor: "east", padding: 0.07056cm)
  rect((1.25, 0.2), (6.15, 1.5), fill: rgb("#f5f5f5"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((3.7, 0.85), [#text(size: 9pt)[$lambda_a$ on $cal(R)_a$]])
  content((6.5, 0.85), [#text(size: 9pt)[$plus.o$]])
  rect((6.85, 0.2), (11.4, 1.5), fill: rgb("#f0f0ff"), stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10))
  content((9.125, 0.85), [#text(size: 9pt)[$ A_0= xor.big_a lambda_a I_(n-s_a)$]])
  content((13.45, 0.85), [#text(size: 9pt)[adjoined spins#linebreak()$epsilon in \{-1,1\}^n$]])
})],
  caption: [Figure 1: The coupled cavity decomposition, with schematic block widths. The full and base interactions agree on the remaining spectral spaces $cal(R)_a$. The span of the $m$ spectral images of the cavity coordinates splits into the special complement and the cavity itself; the full interaction on this span has each eigenvalue $lambda_a$ with multiplicity $n$. Assigning $A_0$ to the special complement gives the prescribed base multiplicities. When $m = 1$, the special complement is absent. Conditional on the base spectral projectors, the $n - s_a$ special axes assigned to group $a$ form a uniform orthonormal frame. The base perturbations are generated independently of these frames conditional on those projectors. ],
) <fig:cavity-decomposition>

=== 6.2 Perturbations and bounded Gibbs tests <perturbations-and-bounded-gibbs-tests>

The logarithmic comparison will give a lower bound involving one field in the supremum defining $S$. The cavity-spin tests will show that this field is maximizing.

In averages containing $epsilon$, use its independent uniform probability on the cavity cube. Write $chevron.l dot.op chevron.r_0$ for this probability times the perturbed base Gibbs probability. All expectations below include the coupled spectral data and the special frames. Let $W$ denote (6.3) with the limiting matrices.

#thm([Lemma 6.2.])[
  (Finite-size comparison).  #emph[There are deterministic $delta_N arrow.b 0$, uniform over the perturbation parameters, such that 
#[#set math.equation(numbering: n => "(6.6)")
 $ cal(F)_(N + n) \( theta \) - cal(F)_N \( theta \) gt.eq bb(E) log chevron.l W_N \( y \, epsilon \) e^(- delta_N \( 1 + \| y \|^2 \)) chevron.r_0 . $ <cav:increment-comparison>]

 The right-hand side is bounded below uniformly in $N$ and $theta$. In addition, any bounded continuous test of the two-replica total overlap and the cavity spins in the full system can be evaluated, up to an error that vanishes first as $N arrow.r oo$ and then as $B arrow.r oo$, using the base probability reweighted by $W_N upright(bold(1))_({ \| y \| lt.eq B })$ and the base total overlap.]
] <cav:comparison>

#proof[
  We condition first on all coupled spectral data. Outside the special/cavity coordinates the full and base projectors coincide. Their overlap difference, including the change of dimension divisor, is bounded on two configurations by
  #[#set math.equation(numbering: n => "(6.7)")
   $ C_n / N #scale(x: 120%, y: 120%)[\(] 1 + \| y^1 \|^2 + \| y^2 \|^2 #scale(x: 120%, y: 120%)[\)] . $ <cav:overlap-error>]
  Multiplying by $N e_N$ for the deterministic perturbations or by $N e_N^2$ for their Gaussian covariances gives a vanishing coefficient. The changes in these amplitudes for a bounded jump of dimensions also tend to zero. The omitted Gaussian kernels and their derivatives remain summable with the geometric weights. Thus the deterministic perturbation difference is bounded by $o \( 1 \) \( 1 + \| y \|^2 \)$, and the covariance difference by $o \( 1 \) \( 1 + \| y^1 \|^2 + \| y^2 \|^2 \)$, uniformly in the parameters.
  To see the sign of the comparison, put $g \( sigma \) = 1 + \| y \|^2$. Let $D_0 \, D_(+)$ be the deterministic base and full perturbations on $\( sigma \, epsilon \)$, and let $cal(C)_0 \, cal(C)_(+)$ be the corresponding Gaussian perturbation covariance kernels, conditional on the coupled spectral data. The preceding estimates give deterministic $a_N \, b_N arrow.r 0$, uniform in the parameters and spectral data, such that
  $ \| D_(+) - D_0 \| lt.eq a_N g \, #h(2em) \| \( cal(C)_(+) - cal(C)_0 \) \( 1 \, 2 \) \| lt.eq b_N \( g \( sigma^1 \) + g \( sigma^2 \) \) . $
  Choose independent centered Gaussian fields $X_0 \, X_(+)$ with these conditional covariances. Keep the full main interaction fixed and add the interpolating perturbation
  $ \( 1 - tau \) D_0 + tau D_(+) + sqrt(1 - tau) thin X_0 + sqrt(tau) thin X_(+) - \( 1 - tau \) delta_N g \, #h(2em) 0 lt.eq tau lt.eq 1 . $
  Write $Z_tau$ and $chevron.l dot.op chevron.r_tau^(upright("int"))$ for its partition function and Gibbs probability. The diagonal and pair terms in Lemma 8 are each bounded below by $- b_N bb(E) chevron.l g chevron.r_tau^(upright("int"))$. Consequently
  $ frac(d, d tau) bb(E) log Z_tau gt.eq \( delta_N - a_N - 2 b_N \) bb(E) chevron.l g chevron.r_tau^(upright("int")) gt.eq 0 $
  if $delta_N arrow.b 0$ is chosen to dominate $a_N + 2 b_N$. At $tau = 0$ the partition function is $Z_N^theta chevron.l W_N e^(- delta_N g) chevron.r_0$; at $tau = 1$ it is $Z_(N + n)^theta$. Integrating proves (6.6). The block matrices are uniformly bounded, so Jensen’s inequality bounds its right-hand side below by $- C bb(E) chevron.l 1 + \| y \|^2 chevron.r_0$. Lemma 21 gives the claimed uniform lower bound.
  For the test comparison, choose $c > 0$ smaller than every $rho_a$. The event $min_a lambda_min \( M_a \) < c$ has probability tending to zero and can be discarded in bounded tests. On its complement, the orthonormal coordinates of the projection onto $xor.big_a "ran" \( P_a^(+) E \)$ give
  $ \| y \|^2 + n = sum_a \| M_a^(- 1 \/ 2) E^(sans(T)) P_a^(+) sigma^(+) \|^2 lt.eq c^(- 1) sum_a \| E^(sans(T)) P_a^(+) sigma^(+) \|^2 \, #h(2em) sigma^(+) = \( sigma \, epsilon \) . $
  At each fixed parameter choice the full disorder law is invariant under site permutations. For each site $j$,
  $ bb(E) chevron.l \( P_a^(+) sigma^(+) \)_j^2 chevron.r_(+) = frac(1, N + n) bb(E) chevron.l parallel P_a^(+) sigma^(+) parallel^2 chevron.r_(+) lt.eq 1 . $
  Consequently
  #[#set math.equation(numbering: n => "(6.8)")
   $ limsup_(N arrow.r oo) bb(E) chevron.l upright(bold(1))_({ \| y \| > B }) chevron.r_(+) lt.eq C / B^2 . $ <cav:full-tail>]
  This use of symmetry precedes the restriction; no symmetry of the restricted Gibbs probability is needed. Nor is an inverse moment of $M_a$ required on the discarded event.
  For fixed $B$, the restriction $\| y \| lt.eq B$ is a fixed set once the spectral data have been conditioned on. It is nonempty for $B^2 > d$, since uniform base-spin sampling has mean squared projection $d$. The perturbation differences on that set are bounded by $O \( \( a_N + b_N \) \( 1 + B^2 \) \)$. Use the same interpolation without its penalty, normalizing the Gibbs probability on this fixed restriction at every $tau$. Lemma 8 bounds the change in the expected bounded Gibbs test by $O \( \( a_N + b_N \) \( 1 + B^2 \) \) = o \( 1 \)$ for fixed $B$. At the base endpoint its probability is precisely the base probability tilted by $W_N upright(bold(1))_({ \| y \| lt.eq B })$. Finally, $\| Q_12^(+) - Q_12 \| lt.eq 2 n \/ \( N + n \)$, so uniform continuity permits replacing the full total overlap by the base one. Equation (6.8) then removes the restriction in the stated order. ◻
]

=== 6.3 Gaussian limits with explicit cutoffs <gaussian-limits-with-explicit-cutoffs>

The finite-size comparison has not asserted convergence of an unbounded exponential factor. We now pass to overlap limits with cutoffs in place. The subsequent quadratic calculation will supply the uniform estimates needed to remove those cutoffs.

Take $theta_N in cal(G)_N$ and a subsequence with limiting total overlap quantile $p$. By Proposition 18, the Gaussian marks supplied by Lemma 21 have the covariance path associated with

#[#set math.equation(numbering: n => "(6.9)")
 $ H \( x \) = \( b \( x \) I_d - A_0 \)^(- 1) \, #h(2em) H \( 0 \) = 0 : $ <cav:H>]

their off-diagonal covariance at quantile coordinate $s$ and their diagonal covariance are, respectively,

#[#set math.equation(numbering: n => "(6.10)")
 $ integral_0^(p \( s \)) H' \( D_p \( r \) \) thin d r \, #h(2em) integral_0^1 H' \( D_p \( r \) \) thin d r . $ <cav:path-convention>]

Indeed each diagonal entry of $H$ is $f_a \/ rho_a$ for its assigned group. The derivative $H'$ is positive semidefinite, so these paths have nonnegative covariance increments and a nonnegative diagonal excess. If the top overlap equals one, that excess is zero.

Both the logarithmic increment and the cavity-spin tests must pass to these Gaussian marks. We keep separate cutoffs for the two quantities until we have controlled the marks under the full cavity reweighting.

Choose finite-valued nondecreasing maps converging uniformly to the identity on $\[ 0 \, 1 \]$, and let $macron(p)$ be the resulting value roundings of $p$. The rounded overlap arrays are exactly the finite cascades of Lemma 6. On each such cascade use Gaussian marks with (6.10) recalculated with $macron(p)$. The functions $H \, H'$ are smooth on $\[ 0 \, 1 \]$ for the present finite alphabet, and $D_(macron(p)) arrow.r D_p$ uniformly. The recalculated covariances therefore converge uniformly to the required ones. Finite-replica Gaussian laws converge, including all the overlap labels, by Lemma 7.

For the logarithmic lower bound, cap the factor in (6.6) above at $e^T$, with $T > 0$ fixed, and first replace the logarithm of its integral by the logarithm of that integral plus a floor $epsilon.alt > 0$. This is a bounded continuous function of a bounded integral. Polynomial approximation and extra replicas give its limit as $N arrow.r oo$, then its finite-cascade approximation as $macron(p) arrow.r p$. The vanishing penalty and (6.2) do not change that limit: they converge uniformly on compact sets of $y$, whose complements have vanishing probability by (6.4).

The floor can now be removed uniformly. If $Z_(N \, T)$ is the capped base integral, Jensen’s inequality and the bounded block matrices give

#[#set math.equation(numbering: n => "(6.11)")
 $ \( log Z_(N \, T) \)_(-) lt.eq C chevron.l 1 + \| y \|^2 chevron.r_0 \, #h(2em) sup_N bb(E) \[ \( log Z_(N \, T) \)_(-)^2 \] < oo . $ <cav:negative-log>]

The same bound holds for the limiting Gaussian calculations and all finite-cascade approximations. Splitting according as $- log Z_(N \, T)$ is larger than a fixed number, and then increasing that number, proves that adding the floor changes the expected logarithm by a quantity tending uniformly to zero as $epsilon.alt arrow.b 0$.

For the restricted tests, fix $B > 0$ and let $q_(N \, B) = chevron.l upright(bold(1))_({ \| y \| > B }) chevron.r_0$. The base moment bound and Markov’s inequality give

#[#set math.equation(numbering: n => "(6.12)")
 $ bb(P) \( q_(N \, B) > 1 \/ 2 \) lt.eq C / B^2 \, #h(2em) chevron.l W_N upright(bold(1))_({ \| y \| lt.eq B }) chevron.r_0 gt.eq 1 / 2 e^(- C \( 1 + B^2 \)) quad upright("if ") q_(N \, B) lt.eq 1 \/ 2 . $ <cav:normalizer>]

The same estimates hold in the finite cascades. Thus denominator powers in a bounded replica test may first be regularized, with an arbitrarily small error apart from $C \/ B^2$, and then approximated by polynomials using extra replicas. The sphere $\| y \| = B > 0$ has zero probability for a centered Gaussian law, even when its covariance is singular. This justifies the restricted finite-replica passage.

The order is now explicit. At fixed cap or radius and positive regularizer, take the base-system limit and then refine the finite rounding. Remove the regularizer using (6.11) or (6.12). It remains to remove the cap and the radius in the finite-cascade calculations with errors uniform in the rounding. This last step requires the actual quadratic transformation, to which we turn next.

=== 6.4 Quadratic Gaussian reweighting <quadratic-gaussian-reweighting>

The quadratic part of the cavity factor changes the covariance of its Gaussian marks. The following lemma computes that change while keeping track of the expected logarithm of the normalizing factor. In particular, the matrices in the quadratic factor need not commute.

#thm([Lemma 6.3.])[
  (Quadratic tilt of a Gaussian cascade).  #emph[Let $mu = sum_(a = 1)^m rho_a delta_(lambda_a)$, where $rho_a > 0$ and $sum_a rho_a = 1$, and put $lambda_(+) = max_a lambda_a$. For $0 < x lt.eq 1$, let $b \( x \) > lambda_(+)$ be the solution of $sum_a rho_a \/ \( b \( x \) - lambda_a \) = x$. Let $A_0 \, A$ be symmetric $d times d$ matrices whose eigenvalues are at most $lambda_(+)$, and define 
#[#set math.equation(numbering: n => "(6.13)")
 $ K = A - A_0 \, #h(2em) H \( x \) = \( b \( x \) "Id" - A_0 \)^(- 1) quad \( x > 0 \) \, #h(2em) H \( 0 \) = 0 . $ <cav:q-def>]

 Let $p in cal(P)$ be constant with value $p_i$ on intervals of lengths $w_i > 0$, for $0 lt.eq i < k$, where $0 lt.eq p_0 lt.eq dots.h.c lt.eq p_(k - 1) lt.eq 1$ and $sum_i w_i = 1$. Set $zeta_i = sum_(j < i) w_j$, so that $zeta_0 = 0$ and $zeta_k = 1$.]
  #emph[On the corresponding Ruelle probability cascade, construct the marks from centered Gaussian increments independent of one another and of the unmarked cascade, with off-diagonal covariance path and diagonal covariance 
#[#set math.equation(numbering: n => "(6.14)")
 $ Q_H \( s \) = integral_0^(p \( s \)) H' \( D_p \( r \) \) thin d r \, #h(2em) V_H = integral_0^1 H' \( D_p \( r \) \) thin d r . $ <cav:q-path>]

 Here the covariance shared by two sampled paths whose last common level is $i$ is $Q_H \( s \)$ for $s$ in interval $i$. Any diagonal excess is an independent Gaussian residual, integrated separately at each visit to a leaf. More explicitly, write $v_alpha$ for the cascade weights and $y_alpha$ for the sum of the common and branching Gaussian increments. If $gamma_Sigma$ denotes the centered Gaussian probability measure with covariance $Sigma$, set 
$ Z_K = sum_alpha v_alpha integral exp (1 / 2 \( y_alpha + z \)^(sans(T)) K \( y_alpha + z \)) gamma_(V_H - Q_H \( 1 - \)) \( d z \) . $

 Then $Z_K$ is positive and finite almost surely, its logarithm is integrable, and 
#[#set math.equation(numbering: n => "(6.15)")
 $ bb(E) log Z_K = - 1 / 2 integral_0^1 frac(d, d x) log det \( "Id" - H \( x \) K \)\|_(x = D_p \( r \)) thin d r . $ <cav:q-log>]

]
  #emph[After normalizing this quadratic tilt and relabeling the tree, the cascade weights have their original law. The terminal marks can be represented by independent Gaussian increments, independent of the unmarked cascade, with the covariance convention (6.14) using 
#[#set math.equation(numbering: n => "(6.16)")
 $ tilde(H) \( x \) = \( "Id" - H \( x \) K \)^(- 1) H \( x \) = \( b \( x \) "Id" - A \)^(- 1) quad \( x > 0 \) \, #h(2em) tilde(H) \( 0 \) = 0 $ <cav:q-transform>]

 in place of $H$. This representation includes the tilted residual draws and hence applies to joint sampling of any finite number of terminal marks. The derivatives and integrands at zero in these formulas mean their smooth limits. For $d = 0$, determinants equal one and all Gaussian marks are the unique vector in $bb(R)^0$.]
] <cav:quadratic>

#proof[
  We first verify the conditional Gaussian integrals needed by the cascade change of measure. We then compute the normalizing constants and the covariances under its tilted kernels. The case $d = 0$ is immediate, so assume $d gt.eq 1$.
  The finite alphabet makes $b \( x \)$ well defined above $lambda_(+)$. Writing $u = 1 \/ b$ near $x = 0$ changes its defining equation to $x = sum_a rho_a u \/ \( 1 - lambda_a u \)$, whose derivative in $u$ at zero is one. Consequently $H$ and $tilde(H)$ extend smoothly to zero, with $H' \( 0 \) = tilde(H)' \( 0 \) = "Id"$. For positive $x$, put $M_2 \( x \) = sum_a rho_a \/ \( b \( x \) - lambda_a \)^2$. Differentiation gives $b' \( x \) = - 1 \/ M_2 \( x \)$ and $H' \( x \) = M_2 \( x \)^(- 1) \( b \( x \) "Id" - A_0 \)^(- 2) succ.curly.eq 0$. In particular, all covariance increments in (6.14) are well defined and positive semidefinite.
  Append $p_k = 1$ and put $p_(- 1) = 0$. For $0 lt.eq i lt.eq k$, define
  #[#set math.equation(numbering: n => "(6.17)")
   $ Sigma_i = integral_(p_(i - 1))^(p_i) H' \( D_p \( r \) \) thin d r \, #h(2em) H_i = H \( D_p \( p_i \) \) \, #h(2em) J_i = \( "Id" - H_i K \)^(- 1) \, #h(2em) K_i = K J_i . $ <cav:q-increments>]
  The inverse defining $J_i$ exists: at positive arguments, $H_i^(- 1) - K = b \( D_p \( p_i \) \) "Id" - A succ 0$, and at zero $H_i = 0$. Also $K_i = \( "Id" - K H_i \)^(- 1) K$ is symmetric. The increment $Sigma_0$ is common to all leaves, increments $Sigma_i$ for $1 lt.eq i < k$ are attached independently to the edges at level $i$, and $Sigma_k$ is the residual. Since $D_p$ has slope $- zeta_i$ on $\( p_(i - 1) \, p_i \)$ for $i > 0$, while it is constant on $\( 0 \, p_0 \)$, we have
  #[#set math.equation(numbering: n => "(6.18)")
   $ H_k = 0 \, #h(2em) H_(i - 1) - H_i = zeta_i Sigma_i quad \( 1 lt.eq i lt.eq k \) \, #h(2em) Sigma_0 = p_0 H' \( D_p \( p_0 \) \) . $ <cav:q-levels>]
  These identities also hold when some adjacent overlap values coincide.
  For $i > 0$, write $Delta_i = zeta_i Sigma_i$. The matrix ordering in the following identity will be important:
  #[#set math.equation(numbering: n => "(6.19)")
   $ "Id" - Delta_i K_i = \( "Id" - H_(i - 1) K \) J_i \, #h(2em) det \( "Id" - Delta_i K_i \) = frac(det \( "Id" - H_(i - 1) K \), det \( "Id" - H_i K \)) . $ <cav:q-factor>]
  The symmetric Gaussian precision matrix satisfies
  #[#set math.equation(numbering: n => "(6.20)")
   $ "Id" - zeta_i Sigma_i^(1 \/ 2) K_i Sigma_i^(1 \/ 2) succ 0 . $ <cav:q-precision>]
  To prove this, replace $Delta_i$ in (6.19) by $t Delta_i$, $0 lt.eq t lt.eq 1$, and set $S_t = H_i + t Delta_i$. If $H_(i - 1) = 0$, then $Sigma_i = 0$ and the claim is immediate. Otherwise $H_(i - 1) succ 0$, and each nonzero $S_t$ is positive definite and at most $H_(i - 1)$. Thus
  $ S_t^(- 1) - K succ.curly.eq H_(i - 1)^(- 1) - K succ 0 . $
  It follows that $det \( "Id" - S_t K \) eq.not 0$; this is also true when $S_t = 0$. By (6.19) and the identity $det \( "Id" - B C \) = det \( "Id" - C B \)$, the symmetric matrix in (6.20), with $zeta_i$ replaced by $t zeta_i$, never has a zero eigenvalue. At $t = 0$ it is the identity, proving (6.20) by continuity.
  For a vector $u in bb(R)^d$, completion of the square now gives the finite integral
  #[#set math.equation(numbering: n => "(6.21)")
   $ 1 / zeta_i log integral exp (zeta_i / 2 \( u + z \)^(sans(T)) K_i \( u + z \)) gamma_(Sigma_i) \( d z \) = - frac(1, 2 zeta_i) log det \( "Id" - Delta_i K_i \) + 1 / 2 u^(sans(T)) K_(i - 1) u . $ <cav:q-gaussian-integral>]
  Indeed, if $T_i = \( "Id" - Delta_i K_i \)^(- 1)$, then (6.19) implies $J_i T_i = J_(i - 1)$ and hence $K_i T_i = K_(i - 1)$. Formula (6.21) also holds for singular $Sigma_i$, by writing $z = Sigma_i^(1 \/ 2) g$ with $g$ a standard Gaussian vector.
  Starting at $K_k = K$, backward integration therefore produces the quadratic coefficients $K_i$ of (6.17). For $1 lt.eq i < k$, (6.21) verifies exactly the conditional fractional exponential moment of exponent $zeta_i$ required by the marked-cascade change of measure in Proposition 5. The residual step $i = k$ uses exponent $zeta_k = 1$ and verifies its ordinary exponential moment. The root uses exponent zero, namely ordinary expectation of the backward value; its quadratic contribution is $"Tr" \( Sigma_0 K_0 \) \/ 2$. Since a Gaussian quadratic polynomial is integrable, no exponential moment of the root quadratic term is needed. The same recursion and Proposition 5, conditional on the root mark, show that $Z_K$ is positive and finite almost surely. Their logarithmic integrability assertion applies because the Gaussian integrals above have finite constants and the root value is a quadratic polynomial in a finite-dimensional Gaussian vector. Thus
  #[#set math.equation(numbering: n => "(6.22)")
   $ bb(E) log Z_K = 1 / 2 "Tr" \( Sigma_0 K_0 \) - sum_(i = 1)^k frac(1, 2 zeta_i) log frac(det \( "Id" - H_(i - 1) K \), det \( "Id" - H_i K \)) . $ <cav:q-constants>]
  Set $f \( x \) = log det \( "Id" - H \( x \) K \)$. Its derivative is $f' \( x \) = - "Tr" \( H' \( x \) K \( "Id" - H \( x \) K \)^(- 1) \)$. On $\( 0 \, p_0 \)$ this identifies the root term in (6.22) with $- 1 / 2 integral_0^(p_0) f' \( D_p \( r \) \) thin d r$. On every subsequent interval, the change of variable $D'_p \( r \) = - zeta_i$ identifies its determinant term with the corresponding integral. Summing proves (6.15).
  It remains to identify the terminal marks under the quadratic tilt. The marked-cascade rule leaves the root law unchanged and gives, at step $i > 0$, the Gaussian kernel obtained by multiplying the density of $z tilde.op gamma_(Sigma_i)$ by $exp \( zeta_i \( u + z \)^(sans(T)) K_i \( u + z \) \/ 2 \)$ and normalizing. If $Y_(i - 1) = u$ is the running sum before this step, square completion gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ bb(E) \[ Y_i divides Y_(i - 1) \] = T_i Y_(i - 1) \, #h(2em) "Cov" \( Y_i divides Y_(i - 1) \) = T_i Sigma_i \, #h(2em) T_i = \( "Id" - Delta_i K_i \)^(- 1) . $ <cav:q-kernels>]
  The covariance is symmetric and positive semidefinite, since it equals
  $ Sigma_i^(1 \/ 2) \( "Id" - zeta_i Sigma_i^(1 \/ 2) K_i Sigma_i^(1 \/ 2) \)^(- 1) Sigma_i^(1 \/ 2) . $
  The conditional covariance is independent of the preceding value, and the kernels on distinct child edges are conditionally independent.
  Rescale the running sums by $U_i = J_i Y_i$. Because $J_i T_i = J_(i - 1)$, the process $U_i$ has centered independent innovations on the tree. Their covariances, and that of the common root, are respectively
  #[#set math.equation(numbering: n => "(6.24)")
   $ "Cov" \( U_i - U_(i - 1) \) = J_(i - 1) Sigma_i J_i^(sans(T)) quad \( i > 0 \) \, #h(2em) "Cov" \( U_0 \) = J_0 Sigma_0 J_0^(sans(T)) . $ <cav:q-innovations>]
  For symmetric matrices $B \, C$ for which the indicated inverses exist, the map $F \( B \) = \( "Id" - B K \)^(- 1) B$ satisfies
  #[#set math.equation(numbering: n => "(6.25)")
   $ F \( B \) - F \( C \) = \( "Id" - B K \)^(- 1) \( B - C \) \( "Id" - K C \)^(- 1) . $ <cav:q-resolvent-difference>]
  This follows by multiplying on the left by $"Id" - B K$ and on the right by $"Id" - K C$. Applying it to $B = H_(i - 1)$ and $C = H_i$ in (6.24) shows that the covariance at step $i > 0$ is
  $ frac(tilde(H) \( D_p \( p_(i - 1) \) \) - tilde(H) \( D_p \( p_i \) \), zeta_i) = integral_(p_(i - 1))^(p_i) tilde(H)' \( D_p \( r \) \) thin d r . $
  Here (6.16) follows directly from $H \( x \)^(- 1) - K = b \( x \) "Id" - A$ at positive $x$. Differentiating (6.25) along $H \( x \)$ also gives
  #[#set math.equation(numbering: n => "(6.26)")
   $ tilde(H)' \( x \) = J \( x \) H' \( x \) J \( x \)^(sans(T)) \, #h(2em) J \( x \) = \( "Id" - H \( x \) K \)^(- 1) \, $ <cav:q-root-covariance>]
  so the root covariance in (6.24) is $p_0 tilde(H)' \( D_p \( p_0 \) \)$, as required. Since $J_k = "Id"$, the final sum $U_k$ equals the original terminal mark $Y_k$. The cascade change of measure gives the original unmarked cascade law independently of these Gaussian innovations, completing the claimed representation.
  All the endpoint cases are included. If $p_(k - 1) = 1$, then $Sigma_k = 0$ and the residual step makes no change. If $p = 1$ everywhere, then $D_p = 0$, $J_i = "Id"$, and $Sigma_0 = "Id"$; the sole quadratic contribution is the ordinary root expectation $"Tr" \( K \) \/ 2$. Equal adjacent overlap values simply give zero increments in the same formulas. ◻
]

=== 6.5 Removing cutoffs and evaluating the increment <removing-cutoffs-and-evaluating-the-increment>

Apply Lemma 23 to the matrices supplied by Lemma 21. The eigenvalues of $A$ and $A_0$ are at most $lambda_(+)$: $A$ is a compression of $xor.big_a lambda_a I_n$, and $A_0$ has the specified spectral alphabet. The lemma therefore applies to every finite rounding $macron(p)$. Its joint Gaussian representation will bound the two-replica moment arising from the remaining linear tilt. That bound removes both cutoffs uniformly in the rounding, after which we compute the increment and the spin tests.

For a finite step quantile $q$, denote the cascade prior with the Gaussian covariance convention (6.10), including the independent residual and uniform cavity spins, by $chevron.l dot.op chevron.r_q$. Write $chevron.l dot.op chevron.r_(q \, W)$ for its normalized tilt by $W \( y \, epsilon \)$.

#thm([Lemma 6.4.])[
  (Uniform removal of cutoffs).  #emph[For the fixed finite alphabet and fixed $n$, and every $r > 0$, 
#[#set math.equation(numbering: n => "(6.27)")
 $ sup_(q med upright(f i n i t e med s t e p)) bb(E) chevron.l \| y \|^r chevron.r_(q \, W) < oo . $ <cav:tilted-moments>]

 Consequently the error in the expected logarithm from replacing $W$ by $min \( W \, e^T \)$ tends uniformly to zero as $T arrow.r oo$. The error in a bounded replica test from restricting to $\| y \| lt.eq B$ tends uniformly to zero as $B arrow.r oo$, with any fixed bounded convention if the restricted normalizer is zero.]
] <cav:cutoffs>

#proof[
  First perform only the quadratic tilt. By Lemma 23, the terminal marks then have a Gaussian cascade representation associated with $tilde(H) \( x \) = \( b \( x \) I_d - A \)^(- 1)$. Its diagonal covariance is
  $ integral_0^1 tilde(H)' \( D_q \( r \) \) thin d r \, $
  whose norm is bounded by $sup_(0 lt.eq x lt.eq 1) parallel tilde(H)' \( x \) parallel$. This is finite for the fixed alphabet, independently of the number of steps and their weights. Indeed $b \( x \) > lambda_(+)$ for $x > 0$, and the inverse has the smooth extension at zero already proved in the lemma.
  Let $chevron.l dot.op chevron.r_(q \, K)$ denote the normalized quadratic tilt, still including the uniform cavity-spin probability. The remaining exponent is
  $ V \( y \, epsilon \) = y^(sans(T)) L epsilon + 1 / 2 epsilon^(sans(T)) C epsilon . $
  For each realization, Jensen’s inequality gives $chevron.l e^V chevron.r_(q \, K)^(- 1) lt.eq chevron.l e^(- V) chevron.r_(q \, K)$. Taking two replicas therefore gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ bb(E) chevron.l \| y \|^r chevron.r_(q \, W) lt.eq bb(E) chevron.l \| y^1 \|^r e^(V \( y^1 \, epsilon^1 \) - V \( y^2 \, epsilon^2 \)) chevron.r_(q \, K) . $ <cav:linear-moment-bound>]
  Conditional on their branching, the two marks on the right are centered joint Gaussians with uniformly bounded covariance. The spin coefficients range over a fixed finite set. Gaussian polynomial-exponential moments thus bound the right side uniformly, proving (6.27). This argument includes the residual draws as part of the probability prior. Jensen’s inequality and the same exponential-linear moments also show that the remaining logarithmic normalizer is integrable.
  Put $g_T = \( log W - T \)_(+)$. Since $min \( W \, e^T \) = W e^(- g_T)$,
  $ 0 lt.eq log chevron.l W chevron.r_q - log chevron.l min \( W \, e^T \) chevron.r_q lt.eq chevron.l g_T chevron.r_(q \, W) . $
  The bound $\| log W \| lt.eq C \( 1 + \| y \|^2 \)$ and (6.27) make its expectation tend uniformly to zero. Restriction of an $l$-replica bounded test changes its expectation by at most a constant times $l chevron.l upright(bold(1))_({ \| y \| > B }) chevron.r_(q \, W)$. Markov’s inequality and (6.27) prove the second assertion, including the event where the restricted normalizer is zero. ◻
]

For $p in cal(P)$, define

#[#set math.equation(numbering: n => "(6.29)")
 $ h_p \( s \) = integral_0^(p \( s \)) R' \( D_p \( r \) \) thin d r . $ <cav:field-path>]

This is a bounded nonnegative nondecreasing path. For $x > 0$,

$ R' \( x \) = 1 / x^2 - frac(1, M_2 \( x \)) gt.eq 0 \, #h(2em) M_2 \( x \) = sum_a frac(rho_a, \( b \( x \) - lambda_a \)^2) gt.eq x^2 \, $

and the derivative has its smooth nonnegative limit at zero. If $p$ is a finite step quantile, then $h_p in cal(H)$.

#thm([Proposition 6.5.])[
  (Evaluation of the cavity factor).  #emph[For every finite step quantile $p$, the cascade factor constructed above satisfies 
#[#set math.equation(numbering: n => "(6.30)")
 $ 1 / n bb(E) log chevron.l W chevron.r_p = ell \( h_p \) + 1 / 2 integral_0^1 p \( s \) h_p \( s \) thin d s + G_1 \( p \) . $ <cav:evaluated>]

 For a fixed cavity site $j$ and a bounded continuous function $phi.alt$, the same tilted calculation satisfies 
#[#set math.equation(numbering: n => "(6.31)")
 $ bb(E) chevron.l phi.alt \( Q_12 \) epsilon_j^1 epsilon_j^2 chevron.r_(p \, W) = integral_0^1 phi.alt \( p \( s \) \) B_(h_p) \( s \) thin d s \, $ <cav:spin-test>]

 where $Q_12$ is the common-level value prescribed by $p$ and $B_(h_p)$ is the conditional two-spin product from Proposition 9. The common-level distribution itself is unchanged by the tilt.]
] <cav:evaluation>

#proof[
  Compression of the resolvent of the limiting block matrix onto the cavity coordinates gives, for $b = b \( x \)$,
  #[#set math.equation(numbering: n => "(6.32)")
   $ #scale(x: 120%, y: 120%)[\(] b I_n - C - L^(sans(T)) \( b I_d - A \)^(- 1) L #scale(x: 120%, y: 120%)[\)]^(- 1) = sum_a frac(rho_a I_n, b - lambda_a) = x I_n . $ <cav:compression>]
  The whole block has eigenvalue $lambda_a$ with multiplicity $n$. Its Schur determinant and the multiplicities in $A_0$ give
  #[#set math.equation(numbering: n => "(6.33)")
   $ C + L^(sans(T)) tilde(H) \( x \) L & = R \( x \) I_n \,\
log det \( I_d - H \( x \) K \) & = log frac(det \( b I_d - A \), det \( b I_d - A_0 \))\
 & = n (log x + sum_a rho_a log \( b - lambda_a \)) . $ <cav:scalar-field>]
  To see the multiplicities explicitly, $det \( b I_d - A \) = x^n product_a \( b - lambda_a \)^n$ whereas $det \( b I_d - A_0 \) = product_a \( b - lambda_a \)^(n - s_a)$. Differentiating (6.33) and using $sum_a rho_a \/ \( b - lambda_a \) = x$ yields
  #[#set math.equation(numbering: n => "(6.34)")
   $ 1 / n frac(d, d x) log det \( I_d - H \( x \) K \) = 1 / x + x b' \( x \) = x R' \( x \) . $ <cav:determinant-derivative>]
  Differentiating (6.33) gives
  $ L^(sans(T)) tilde(H)' \( x \) L = R' \( x \) I_n . $
  Thus, after the quadratic transformation, the field $L^(sans(T)) y$ has independent coordinates with common-level covariance path $h_p$. Its diagonal covariance is $v I_n$, where
  $ v = integral_0^1 R' \( D_p \( r \) \) thin d r . $
  Writing $h_(*) = h_p \( 1 - \)$, the independent residual has covariance $\( v - h_(*) \) I_n$. Since every cavity spin has squared norm $n$, integrating this residual and the deterministic cavity term $C = R \( 0 \) I_n$ contributes $n \[ R \( 0 \) + v - h_(*) \] \/ 2$ to the logarithm. The remaining spin sum is $product_(j = 1)^n cosh z_j$ for the nonresidual field $z$. Its logarithm is additive over coordinates, so the Gaussian backward recursion and its tilted kernels factor over those coordinates. This recursion contributes $n \[ ell \( h_p \) + h_(*) \/ 2 \]$. Lemma 23 and (6.34) therefore give
  #[#set math.equation(numbering: n => "(6.35)")
   $ 1 / n bb(E) log chevron.l W chevron.r_p = ell \( h_p \) + 1 / 2 [R \( 0 \) + integral_0^1 \( 1 - D_p \( r \) \) R' \( D_p \( r \) \) thin d r] . $ <cav:before-parts>]
  All three contributions include the root interval; the independent residual was integrated at exponent one.
  Fubini’s theorem and the definition of $D_p$ give
  $ integral_0^1 p \( s \) h_p \( s \) thin d s = integral_0^1 R' \( D_p \( r \) \) integral_({ s : p \( s \) > r }) p \( s \) thin d s thin d r \, $
  and, almost everywhere in $r$,
  $ 1 - D_p \( r \) - integral_({ s : p \( s \) > r }) p \( s \) thin d s = - r D'_p \( r \) . $
  Subtracting the pairing with $h_p$ from the bracket in (6.35) thus gives
  $ R \( 0 \) - integral_0^1 r thin d R \( D_p \( r \) \) = integral_0^1 R \( D_p \( r \) \) thin d r = 2 G_1 \( p \) \, $
  where $D_p \( 1 \) = 0$ supplies the endpoint at one. This proves (6.30).
  Both the quadratic transformation and the remaining spin tilt use the marked-cascade rule of Proposition 5. Its tree relabeling preserves all common-level values, and leaves their law unchanged. The scalar residual correction is independent of the spins. Conditional on a common level, the remaining single-coordinate two-spin product is exactly $B_(h_p)$ from the Ising recursion; the independent coordinates factor through its tilted kernels. This proves (6.31) and the last assertion. ◻
]

We can now finish the passage from finite size to the evaluated increment. For a good parameter sequence with limiting quantile $p$, the capped comparison, finite-replica approximation, and Lemma 24 imply

#[#set math.equation(numbering: n => "(6.36)")
 $ liminf_(N arrow.r oo) frac(cal(F)_(N + n) \( theta_N \) - cal(F)_N \( theta_N \), n) gt.eq ell \( h_p \) + 1 / 2 integral_0^1 p \( s \) h_p \( s \) thin d s + G_1 \( p \) . $ <cav:preliminary-lower>]

Here $ell \( h_p \)$ uses the bounded-path extension of Theorem 12. Indeed uniform rounding gives $h_(macron(p)) arrow.r h_p$ uniformly, so the right side of (6.30) converges by the $L^1$ continuity of $ell$. At each fixed logarithmic cap the limiting lower bound is the capped finite-cascade value; its difference from the uncapped value tends uniformly to zero by Lemma 24. This verifies (6.36) in the cutoff order already specified, without untruncated moment convergence at finite system size.

=== 6.6 The maximizing field and the lower bound <the-maximizing-field-and-the-lower-bound>

The expression in (6.36) contains one field, whereas the proposed answer contains a supremum over fields. To obtain the required inequality, we must prove that this particular field maximizes that supremum. The information comes from cavity-spin tests, not from the logarithmic comparison alone.

#thm([Proposition 6.6.])[
  (Cavity self-consistency).  #emph[Let $p$ be a limiting total-overlap quantile along any sequence $theta_N in cal(G)_N$ used in (6.36). For value roundings $macron(p) arrow.r p$ as above, 
#[#set math.equation(numbering: n => "(6.37)")
 $ B_(h_(macron(p))) arrow.r p quad upright("in ") L^1 \( 0 \, 1 \) . $ <cav:B-limit>]

 Consequently 
#[#set math.equation(numbering: n => "(6.38)")
 $ S \( p \) = ell \( h_p \) + 1 / 2 integral_0^1 p \( s \) h_p \( s \) thin d s . $ <cav:supremum>]

 Thus $h_p$ attains the field supremum in the bounded-path completion.]
] <cav:self-consistency>

#proof[
  For any fixed cavity site $j$, site permutation symmetry of the full model gives, for every bounded continuous $phi.alt$,
  $ bb(E) chevron.l phi.alt \( Q_12^(+) \) epsilon_j^1 epsilon_j^2 chevron.r_(+) = bb(E) chevron.l phi.alt \( Q_12^(+) \) Q_12^(+) chevron.r_(+) . $
  Apply the restricted test comparison of Lemma 22, pass through the bounded finite-replica calculations, and then remove the restriction using Lemma 24. Proposition 25 and preservation of the common-level law give
  #[#set math.equation(numbering: n => "(6.39)")
   $ lim_(macron(p) arrow.r p) integral_0^1 phi.alt \( macron(p) \( s \) \) #scale(x: 120%, y: 120%)[\(] B_(h_(macron(p))) \( s \) - macron(p) \( s \) #scale(x: 120%, y: 120%)[\)] thin d s = 0 . $ <cav:test-identity>]
  No GG property of the full system was used here: the base parameters are good, while site symmetry holds for the full model at every fixed parameter choice.
  The functions $B_(h_(macron(p)))$ are nondecreasing and take values in $\[ 0 \, 1 \]$, so they are relatively compact in $L^1$. We explain why any subsequential limit $B$ is a measurable function of $p$; this is needed to infer equality from (6.39). Since each rounding is a function of the values of $p$, it is constant on every plateau of $p$. The corresponding field levels are tied there. Their zero increments give identical conditional positions and magnetizations, so $B_(h_(macron(p)))$ is also constant there, by Proposition 9. An $L^1$ limit preserves this property on every positive-length plateau. There are only countably many such intervals. Outside their interiors and their null set of endpoints, the generalized inverse of the nondecreasing function $p$ recovers the quantile coordinate. Thus $B$ is measurable with respect to $p$ almost everywhere, including when $p$ has a singular-continuous part.
  Passing to the limit in (6.39) shows that the signed pushforward of $\( B - p \) thin d s$ under $p$ vanishes, since continuous tests determine finite measures on $\[ 0 \, 1 \]$. The established measurability then gives $B = p$ almost everywhere. Every subsequential limit is the same, proving (6.37).
  For any fixed $v in cal(H)$, take common refinements of its intervals and those of $h_(macron(p))$. The supporting inequality from Theorem 12, including tied levels, is
  $ ell \( v \) lt.eq ell \( h_(macron(p)) \) - 1 / 2 integral_0^1 B_(h_(macron(p))) \( s \) \( v \( s \) - h_(macron(p)) \( s \) \) thin d s . $
  Letting $macron(p) arrow.r p$ proves that the supremum defining $S \( p \)$ is at most the right side of (6.38). Conversely, $h_(macron(p)) in cal(H)$, and their values in the definition of $S \( p \)$, with $p$ fixed in the pairing, converge to that same expression. This proves (6.38). ◻
]

#thm([Proposition 6.7.])[
  (Finite-alphabet lower bound).  #emph[Let $mu = sum_(a = 1)^m rho_a delta_(lambda_a)$ have positive rational proportions. Fix $n$ with $n rho_a in bb(N)$ for every $a$, and a progression of dimensions and spectral counts satisfying (6.1). Along this progression, the unperturbed pressure satisfies 
$ liminf_(N arrow.r oo) bb(E) P_N gt.eq inf_(p in cal(P)) { S \( p \) + G_1 \( p \) } . $

]
] <cav:lower>

#proof[
  Put $cal(V) = inf_(p in cal(P)) { S \( p \) + G_1 \( p \) }$. This is finite: $S gt.eq 0$, $G_1$ is bounded, and the zero trial has finite $S$ by Lemma 13. Every sequence of good base parameters has a subsequence with the overlap limits used above. Equations (6.36) and (6.38) therefore imply
  $ liminf_(N arrow.r oo) inf_(theta in cal(G)_N) #scale(x: 120%, y: 120%)[\(] cal(F)_(N + n) \( theta \) - cal(F)_N \( theta \) #scale(x: 120%, y: 120%)[\)] gt.eq n cal(V) . $
  Indeed any failure would select a sequence of parameters whose subsequential overlap limit contradicts the two equations.
  Lemma 22 gives a uniform lower bound for the increments also outside $cal(G)_N$. Since $eta \( cal(G)_N \) arrow.r 1$, integration over the common parameter space yields
  $ liminf_(N arrow.r oo) integral #scale(x: 120%, y: 120%)[\(] cal(F)_(N + n) \( theta \) - cal(F)_N \( theta \) #scale(x: 120%, y: 120%)[\)] thin eta \( d theta \) gt.eq n cal(V) . $
  The parameter space includes the whole infinite sequence, with the size-$N$ partition function ignoring later coordinates. Hence these integrated increments telescope exactly along the progression. Dividing their sum by the terminal dimension proves the lower bound for the parameter-averaged perturbed pressure. The perturbations change the expected log partition by $O \( N e_N \) = o \( N \)$, uniformly in parameters, so the same bound holds for $bb(E) P_N$. ◻
]

The fixed-$n$ comparison is now complete. Its constants may depend on the finite alphabet and on $n$; no uniformity across later spectral approximations was used. Section 7 will combine this bound with the upper bound and remove the rational-count and finite-alphabet restrictions.

== 7 General spectral distributions <sec:general>

The upper and lower bounds now determine the pressure for finite spectral alphabets with rational proportions along the progressions used in the cavity argument. We first remove these arithmetic restrictions, and then approximate an arbitrary compactly supported spectral law. In this section, subscripts in $R_nu$ and $G_(t \, nu)$ specify the spectral law; $cal(F) \( nu \)$ denotes the variational value in (1.8) with that law. The functions $S$ and $D_p$ do not depend on the spectral law.

=== 7.1 Continuity of the spectral term <continuity-of-the-spectral-term>

The transform can reach the upper support edge, so its continuity must include that branch of the definition. The following statement needs no regularity of the measure near the edge.

#thm([Lemma 7.1.])[
  #emph[Let $nu_j$ and $nu$ be probability measures supported in a common interval $\[ - K \, K \]$. Suppose that $nu_j$ converges weakly to $nu$ and that 
$ e_j := max "supp" nu_j arrow.r e := max "supp" nu . $

 Define $b_(nu_j)$ and $R_(nu_j)$ by the edge convention of Theorem 1, and likewise for $nu$. Then 
#[#set math.equation(numbering: n => "(7.1)")
 $ sup_(0 lt.eq x lt.eq 1) \| R_(nu_j) \( x \) - R_nu \( x \) \| arrow.r 0 . $ <gen:R-uniform>]

 Consequently, 
#[#set math.equation(numbering: n => "(7.2)")
 $ \| cal(F) \( nu_j \) - cal(F) \( nu \) \| lt.eq 1 / 2 sup_(0 lt.eq x lt.eq 1) \| R_(nu_j) \( x \) - R_nu \( x \) \| arrow.r 0 . $ <gen:variational-continuity>]

]
] <gen:R-continuity>

#proof[
  For a measure $tau$ with upper support edge $e_tau$, put
  $ H_tau \( z \) = integral frac(tau \( d lambda \), z - lambda) \, #h(2em) z > e_tau . $
  This function is continuous and strictly decreasing. Thus $b_tau \( x \) > e_tau$ exactly when $x < H_tau \( e_tau + \)$, and in that case $H_tau \( b_tau \( x \) \) = x$. In the remaining case $b_tau \( x \) = e_tau$. In both cases,
  #[#set math.equation(numbering: n => "(7.3)")
   $ e_tau lt.eq b_tau \( x \) lt.eq e_tau + x^(- 1) \, #h(2em) - K lt.eq R_tau \( x \) lt.eq K . $ <gen:b-bounds>]
  The first upper bound follows from $H_tau \( z \) lt.eq \( z - e_tau \)^(- 1)$. The lower bound on $R_tau$ follows from $H_tau \( z \) gt.eq \( z + K \)^(- 1)$, using the edge limit of this inequality when the transform is capped.
  We first work away from zero. Let $x_j arrow.r x > 0$ and pass to a subsequence on which $b_(nu_j) \( x_j \) arrow.r b_(*)$. The bounds (7.3) imply that such subsequences exist and that $b_(*) gt.eq e$. If $b_(*) > e$, the defining equations are uncapped for large $j$. Weak convergence, with their arguments uniformly separated from the supports, gives
  $ H_nu \( b_(*) \) = x . $
  Hence $b_(*) = b_nu \( x \)$. If $b_(*) = e$ but $b_nu \( x \) > e$, choose $c in \( e \, b_nu \( x \) \)$. Then $H_nu \( c \) > x$, so $H_(nu_j) \( c \) > x_j$ for large $j$. Strict monotonicity, including the definition of the capped branch, forces $b_(nu_j) \( x_j \) > c$, a contradiction. These two cases prove
  $ b_(nu_j) \( x_j \) arrow.r b_nu \( x \) . $
  The same argument with the measure fixed proves continuity of $b_nu$ on $\( 0 \, 1 \]$. A compactness argument now gives uniform convergence of $R_(nu_j)$ on every $\[ epsilon \, 1 \]$.
  Near zero the convergence is uniform for a different reason. If $K = 0$ there is nothing to prove. For $K > 0$ and $x < \( 4 K \)^(- 1)$, the transform cannot be capped, since $H_tau \( e_tau + \) gt.eq \( 2 K \)^(- 1)$. Write $b_tau \( x \) = x^(- 1) + R_tau \( x \)$ in its defining equation. The bound $\| R_tau \| lt.eq K$ permits the uniform expansion
  $ 1 = integral frac(tau \( d lambda \), 1 + x \( R_tau \( x \) - lambda \)) = 1 - x (R_tau \( x \) - integral lambda thin tau \( d lambda \)) + O \( K^2 x^2 \) . $
  Therefore
  #[#set math.equation(numbering: n => "(7.4)")
   $ R_tau \( x \) = integral lambda thin tau \( d lambda \) + O \( K^2 x \) \, $ <gen:R-at-zero>]
  with a constant independent of $tau$. Weak convergence on the common bounded interval implies convergence of the means. Combining (7.4) with the convergence away from zero proves (7.1).
  Finally, $0 lt.eq D_p \( r \) lt.eq 1$ for every admissible $p$ and $r$, and hence
  $ sup_(p in cal(P)) \| G_(1 \, nu_j) \( p \) - G_(1 \, nu) \( p \) \| lt.eq 1 / 2 parallel R_(nu_j) - R_nu parallel_oo . $
  Taking infima after adding the common functional $S$ proves (7.2). These infima are finite: $S gt.eq 0$ and $S \( 0 \) = 0$ by Lemma 13, whereas the transforms are bounded by (7.3). ◻
]

=== 7.2 Spectral multiplicities and approximation <spectral-multiplicities-and-approximation>

For two diagonal spectra of the same size, using the same orthogonal matrix gives the elementary comparison

#[#set math.equation(numbering: n => "(7.5)")
 $ \| P_N \( Lambda \, U \) - P_N \( tilde(Lambda) \, U \) \| lt.eq 1 / 2 parallel Lambda - tilde(Lambda) parallel_(upright("op")) . $ <gen:operator-comparison>]

It follows by comparing each spin energy and using $\| sigma \|^2 = N$. The same argument gives monotonicity under coordinatewise increase of the eigenvalues and the exact shift identity

#[#set math.equation(numbering: n => "(7.6)")
 $ P_N \( Lambda + c "Id" \, U \) = P_N \( Lambda \, U \) + c / 2 . $ <gen:scalar-shift>]

To change multiplicities, however, a small operator-norm error is not available. The next bound uses rotational symmetry inside each eigenspace.

#thm([Lemma 7.2.])[
  #emph[Fix distinct real numbers $lambda_1 \, dots.h \, lambda_m$, and let $L = max_a lambda_a - min_a lambda_a$. Let $k_a$ and $tilde(k)_a$ be positive integers whose sums are both $N$. For diagonal matrices $Lambda$ and $tilde(Lambda)$ with these multiplicities, 
#[#set math.equation(numbering: n => "(7.7)")
 $ lr(|bb(E) P_N \( Lambda \, U \) - bb(E) P_N \( tilde(Lambda) \, U \)|) lt.eq L / 2 max_a frac(\| k_a - tilde(k)_a \|, min \( k_a \, tilde(k)_a \)) . $ <gen:count-comparison>]

 The same inequality holds for any fixed spin prior on the cube, including a prior with deterministic external fields.]
] <gen:counts>

#proof[
  Arrange the two diagonal matrices so that, for each $a$, $min \( k_a \, tilde(k)_a \)$ axes retain the value $lambda_a$. Haar invariance makes this rearrangement immaterial. Set $Delta = tilde(Lambda) - Lambda$ and
  $ f \( s \) = bb(E) P_N \( Lambda + s Delta \, U \) \, #h(2em) 0 lt.eq s lt.eq 1 . $
  Convexity of the log partition function gives $f' \( 0 \) lt.eq f \( 1 \) - f \( 0 \) lt.eq f' \( 1 \)$. At either endpoint,
  $ f' \( s \) = frac(1, 2 N) bb(E) ⟨sum_i Delta_(i i) x_i^2⟩_s \, #h(2em) x = U sigma . $
  Within a group of equal endpoint eigenvalues, the expected squared projections are equal on all axes. Indeed, rotating the corresponding rows of $U$ preserves both its Haar law and the spin Hamiltonian; the spin prior is unaffected. If a group has $q_a$ axes and $c_a$ changed axes, its changed axes therefore carry the fraction $c_a \/ q_a$ of the group’s expected squared spin norm. Since $\| Delta_(i i) \| lt.eq L$ and the total squared norm is $N$,
  $ \| f' \( s \) \| lt.eq L / 2 max_a c_a / q_a \, #h(2em) s in { 0 \, 1 } . $
  At the first endpoint $c_a = \( k_a - tilde(k)_a \)_(+)$, and at the second $c_a = \( tilde(k)_a - k_a \)_(+)$. The endpoint bounds prove (7.7). ◻
]

#thm([Proposition 7.3.])[
  #emph[Let $Lambda_N$ be deterministic diagonal matrices. Suppose that their empirical measures converge weakly to a compactly supported probability measure $mu$, and write $a = min "supp" mu$ and $b = max "supp" mu$. Assume 
$ liminf_(N arrow.r oo) lambda_min \( Lambda_N \) gt.eq a \, #h(2em) limsup_(N arrow.r oo) lambda_max \( Lambda_N \) lt.eq b . $

 Then $bb(E) P_N arrow.r cal(F) \( mu \)$.]
] <gen:approximation>

#proof[
  We first finish the finite-alphabet case. Suppose that $mu = sum_(a = 1)^m rho_a delta_(lambda_a)$ with all $rho_a > 0$ rational. Choose $n$ so that $s_a = n rho_a$ are integers. For each residue $r in { 0 \, dots.h \, n - 1 }$, choose nonnegative integers $c_a^r$ with sum $r$, and at dimension $N = k n + r$ use multiplicities
  $ k_a \( N \) = k s_a + c_a^r . $
  They increase by $s_a$ when $N$ increases by $n$, and are positive for all sufficiently large $N$. Proposition 20 and Proposition 27 give convergence to $cal(F) \( mu \)$ on each progression. There are finitely many residues, so these canonically chosen multiplicities give convergence on the full sequence of dimensions.
  Now allow arbitrary positive proportions $rho_a$ and arbitrary multiplicities $k_a \( N \)$ with $k_a \( N \) \/ N arrow.r rho_a$. Approximate $rho$ by positive rational probability vectors $tau$, and let $tilde(k)_a \( N \) \/ N arrow.r tau_a$ be the canonical counts just constructed. Lemma 29 gives
  $ & limsup_(N arrow.r oo) lr(|bb(E) P_N \( Lambda_N \, U \) - cal(F) (sum_a tau_a delta_(lambda_a))|)\
 & #h(25mm)  lt.eq L / 2 max_a frac(\| rho_a - tau_a \|, min \( rho_a \, tau_a \)) . $
  The right side tends to zero as $tau arrow.r rho$. Lemma 28 applies to these laws because their support is the same fixed alphabet. This proves the assertion for every finite alphabet with positive limiting proportions.
  We next construct finite alphabets for the general measure. If $a = b$, then $R_(delta_a) = a$ and $cal(F) \( delta_a \) = a \/ 2$ because $S gt.eq 0$ and $S \( 0 \) = 0$; the assertion follows directly from (7.5). Hence suppose $a < b$, and put
  $ eta_N = max { \( a - lambda_min \( Lambda_N \) \)_(+) \, \( lambda_max \( Lambda_N \) - b \)_(+) } . $
  Then $eta_N arrow.r 0$, and clipping the eigenvalues to $\[ a \, b \]$ changes the pressure by at most $eta_N \/ 2$. The clipped empirical measures still converge weakly to $mu$.
  Fix $delta > 0$. Partition $\[ a \, b \]$ into finitely many intervals of length at most $delta$, with all interior endpoints of zero $mu$-mass. Use half-open intervals to assign endpoints uniquely, including $a$ and $b$ in the first and last intervals. For each positive-mass interval $I_j$, choose $r_j in I_j ∩ "supp" mu$, and put
  $ nu_delta = sum_(j : thin mu \( I_j \) > 0) mu \( I_j \) delta_(r_j) . $
  The smallest and largest representatives satisfy
  $ a lt.eq r_min lt.eq a + delta \, #h(2em) b - delta lt.eq r_max lt.eq b \, $
  because every neighborhood of a support edge has positive mass.
  In a positive-mass interval, replace each clipped eigenvalue by its representative. In all zero-mass intervals together, replace the eigenvalues by $r_min$ to form $Lambda_N^(-)$, and by $r_max$ to form $Lambda_N^(+)$. Each zero-mass interval is a continuity set for the clipped measures relative to $\[ a \, b \]$, so the fraction of eigenvalues in their finite union tends to zero. Both modified spectra therefore have limiting law $nu_delta$, with only positive limiting groups. Moreover, coordinatewise,
  $ Lambda_N^(-) - \( delta + eta_N \) "Id" lt.eq Lambda_N lt.eq Lambda_N^(+) + \( delta + eta_N \) "Id" . $
  Monotonicity and (7.6), followed by the finite-alphabet result, yield
  #[#set math.equation(numbering: n => "(7.8)")
   $ cal(F) \( nu_delta \) - delta / 2 lt.eq liminf_N bb(E) P_N lt.eq limsup_N bb(E) P_N lt.eq cal(F) \( nu_delta \) + delta / 2 . $ <gen:bin-squeeze>]
  Thus no estimate involving the fraction changed inside a vanishing group is needed.
  As $delta arrow.b 0$, the laws $nu_delta$ converge weakly to $mu$ and their upper support edges converge to $b$. Lemma 28 gives $cal(F) \( nu_delta \) arrow.r cal(F) \( mu \)$, and (7.8) completes the proof. The thermodynamic limit was taken for each fixed finite alphabet before its refinement. No derivative bound on the finite-alphabet transforms is required uniformly over those refinements. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Proposition 30 supplies convergence of the expected pressures. The spectral hypotheses also imply $parallel Lambda_N parallel_(upright("op")) lt.eq K$ for all sufficiently large $N$, for some finite $K$. Comparing the quadratic forms for two orthogonal matrices shows that $P_N \( Lambda_N \, U \)$ is $K$-Lipschitz in the Frobenius distance, independently of the number of distinct eigenvalues. The fourth-moment argument in Lemma 14 therefore gives
  $ bb(E) \| P_N - bb(E) P_N \|^4 lt.eq C_K / N^2 . $
  For every $epsilon > 0$, Markov’s inequality makes the probabilities of $\| P_N - bb(E) P_N \| > epsilon$ summable. Borel–Cantelli, first for positive rational $epsilon$, proves $P_N - bb(E) P_N arrow.r 0$ almost surely. This argument needs no independence between the orthogonal matrices at different dimensions. ◻
]

The pressure limit now also gives consequences for random spectra and maximum energies. We derive these first, then apply them to Gaussian-pattern interactions.

=== 7.3 Random spectra and zero temperature <random-spectra-and-zero-temperature>

#thm([Proposition 7.4.])[
  #emph[Let $J_N$ be random real symmetric matrices whose conditional law, given their eigenvalues, is the orthogonal orbit measure. Let $mu$ be a fixed compactly supported probability measure. If the empirical spectral measures converge weakly to $mu$ in probability and the two edge excesses in Proposition 30 tend to zero in probability, then $P_N arrow.r cal(F) \( mu \)$ in probability. If these spectral hypotheses hold almost surely, the pressure convergence holds almost surely. In either case, if the random variables $P_N$ are uniformly integrable, then $bb(E) P_N arrow.r cal(F) \( mu \)$. A sufficient condition for this last hypothesis is uniform integrability of $parallel J_N parallel_(upright("op"))$, in particular a uniform deterministic bound on these norms.]
] <gen:random>

#proof[
  Let $f_N \( Lambda \)$ be the Haar expectation of the pressure with deterministic eigenvalues $Lambda$. The integral against the conditional orbit law is therefore the finite quantity $f_N \( Lambda_N \)$. This is used as a conditional orbit integral, without any assumption of global integrability. Equivalently, all conditional calculations below may first be restricted to ${ parallel Lambda_N parallel_(upright("op")) lt.eq K }$, on which $\| P_N \| lt.eq K \/ 2$. Under the almost-sure spectral hypotheses, Proposition 30 applies to each spectral sequence in the event of convergence and yields $f_N \( Lambda_N \) arrow.r cal(F) \( mu \)$ almost surely. Under the in-probability hypotheses, every subsequence has a further subsequence on which all the spectral hypotheses hold almost surely. Here weak convergence can be expressed by a metric on probability measures, so only finitely many convergence-in-probability assertions are involved. The same deterministic result on this further subsequence proves $f_N \( Lambda_N \) arrow.r cal(F) \( mu \)$ in probability.
  For each fixed $K$, conditional concentration gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| P_N - f_N \( Lambda_N \) \| > epsilon \, parallel Lambda_N parallel_(upright("op")) lt.eq K #scale(x: 120%, y: 120%)[\)] lt.eq frac(C_K, epsilon^4 N^2) . $ <gen:localized-concentration>]
  The spectral hypotheses in probability imply that the norm bound holds with probability tending to one for a sufficiently large fixed $K$. This proves convergence of the fluctuations in probability. Under the almost-sure hypotheses the spectra are eventually bounded almost surely. Apply Borel–Cantelli to (7.9) for integer $K$ and positive rational $epsilon$ to obtain almost-sure convergence of the fluctuations as well.
  Uniform integrability and convergence in probability imply convergence of expectations. Finally, $\| P_N \| lt.eq parallel J_N parallel_(upright("op")) \/ 2$, which proves the sufficient condition. ◻
]

#thm([Corollary 7.5.])[
  #emph[Let $J_N = U_N^(sans(T)) Lambda_N U_N$ satisfy the deterministic spectral hypotheses of Theorem 1, with limiting law $mu$. Define its maximum energy per spin by 
$ M_N = frac(1, 2 N) max_(sigma in { - 1 \, 1 }^N) sigma^(sans(T)) J_N sigma . $

 For $beta > 0$, let $mu_beta$ be the image of $mu$ under $lambda mapsto beta lambda$. Then, almost surely and in expectation, 
#[#set math.equation(numbering: n => "(7.10)")
 $ M_N arrow.r lim_(beta arrow.r oo) frac(cal(F) \( mu_beta \), beta) . $ <gen:ground-state-formula>]

 In particular, the limit on the right exists.]
] <gen:ground-state>

#proof[
  Write $P_N \( beta \)$ for the pressure with spectrum $beta Lambda_N$. The uniform probability on the cube gives, for every $N$ and $beta > 0$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ frac(P_N \( beta \), beta) lt.eq M_N lt.eq frac(P_N \( beta \), beta) + frac(log 2, beta) . $ <gen:maximum-squeeze>]
  Theorem 1 applies at each positive integer $beta$. Intersecting these countably many probability-one events, the difference between the limit superior and limit inferior of $M_N$ is at most $log 2 \/ beta$ for every such integer. Thus $M_N$ converges almost surely. Moreover, its limit belongs to each deterministic interval
  $ [frac(cal(F) \( mu_beta \), beta) \, frac(cal(F) \( mu_beta \), beta) + frac(log 2, beta)] \, #h(2em) beta in bb(N) \, $
  so it is a deterministic number $M$. The eventual deterministic bound on $parallel J_N parallel_(upright("op"))$ also gives convergence in expectation. For any real $beta > 0$, take expectations and then $N arrow.r oo$ in (7.11). It follows that
  $ 0 lt.eq M - frac(cal(F) \( mu_beta \), beta) lt.eq frac(log 2, beta) \, $
  which proves (7.10) without a uniform positive-temperature estimate. ◻
]

=== 7.4 Gaussian-pattern Wishart interactions <gaussian-pattern-wishart-interactions>

Fix $alpha > 0$, put $m_N = floor.l alpha N floor.r$, and let $G_N$ be an $m_N$-by-$N$ matrix of independent standard real Gaussian variables. For $c in bb(R)$, define

#[#set math.equation(numbering: n => "(7.12)")
 $ p_N \( c \) = 1 / N log [2^(- N) sum_(sigma in { - 1 \, 1 }^N) exp {frac(c, 2 N) parallel G_N sigma parallel_2^2}] . $ <gen:wishart-pressure>]

This is the Gaussian-pattern Hopfield pressure for $J_N = c G_N^(sans(T)) G_N \/ N$, with uniform spin probability and the full quadratic form, including its diagonal self-interactions.

Let $a_alpha = \( 1 - sqrt(alpha) \)^2$, $b_alpha = \( 1 + sqrt(alpha) \)^2$, and set

#[#set math.equation(numbering: n => "(7.13)")
 $ mu_alpha = \( 1 - alpha \)_(+) delta_0 + frac(sqrt(\( b_alpha - x \) \( x - a_alpha \)), 2 pi x) upright(bold(1))_(\[ a_alpha \, b_alpha \]) \( x \) thin d x \,\
mu_(alpha \, c) = \( x mapsto c x \)_(\#) mu_alpha . $ <gen:wishart-law>]

The displayed density is understood almost everywhere.

#thm([Corollary 7.6.])[
  (Gaussian patterns).  #emph[For every fixed $c in bb(R)$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ p_N \( c \) arrow.r cal(F) \( mu_(alpha \, c) \) $ <gen:wishart-limit>]

 in probability and in $L^1$, and hence in expectation. The subsequent zero-temperature limits 
#[#set math.equation(numbering: n => "(7.15)")
 $ e_plus.minus \( alpha \) := lim_(beta arrow.r oo) frac(cal(F) \( mu_(alpha \, plus.minus beta) \), beta) $ <gen:wishart-zero-temperature>]

 exist, with $e_(+) \( alpha \) gt.eq 0$ and $e_(-) \( alpha \) lt.eq 0$. If $g_(N \, 1) \, dots.h \, g_(N \, N) in bb(R)^(m_N)$ are the columns of $G_N$, then 
#[#set math.equation(numbering: n => "(7.16)")
 $ frac(parallel G_N parallel_(oo arrow.r 2), N) & = frac(parallel G_N^(sans(T)) parallel_(2 arrow.r 1), N) arrow.r sqrt(2 e_(+) \( alpha \)) \,\
1 / N min_(sigma in { - 1 \, 1 }^N) ∥sum_(i = 1)^N sigma_i g_(N \, i)∥_2 & arrow.r sqrt(- 2 e_(-) \( alpha \)) . $ <gen:gaussian-max-norm>]

 Both limits hold in probability and in $L^1$. The operator norms are from $ell_oo^N$ to $ell_2^(m_N)$ and from $ell_2^(m_N)$ to $ell_1^N$, respectively.]
] <gen:wishart>

#proof[
  Put $W_N = G_N^(sans(T)) G_N \/ N$ and $alpha_N = m_N \/ N$. For every $Q in O \( N \)$, the matrices $G_N Q$ and $G_N$ have the same law. Haar averaging this identity against any bounded function of the ordered eigenvalues shows that the conditional law of $c W_N$ is its orthogonal orbit law, including when the zero eigenvalue is repeated.
  The Marchenko–Pastur theorem [18] Theorem 1 and the examples on pp. 459 and 461 gives weak convergence in probability of the empirical law of $W_N$ to $mu_alpha$. To check the edges, let $s_min^(+) \( G_N \)$ be the smallest positive singular value. For $m_N gt.eq 1$ and $t > 0$, the Gaussian singular-value bounds [10] Theorem II.13, after scaling and transposing when necessary, give
  $ bb(P) (frac(s_max \( G_N \), sqrt(N)) > 1 + sqrt(alpha_N) + t) & lt.eq e^(- N t^2 \/ 2) \,\
bb(P) (frac(s_min^(+) \( G_N \), sqrt(N)) < \| 1 - sqrt(alpha_N) \| - t) & lt.eq e^(- N t^2 \/ 2) . $
  Together with positive limiting mass near each continuous spectral edge, these bounds give $lambda_max \( W_N \) arrow.r b_alpha$ in probability. The lower edge is $0$ for $alpha lt.eq 1$ and $a_alpha$ for $alpha > 1$. For $alpha < 1$, $W_N$ has $N - m_N$ zero eigenvalues almost surely for all large $N$; at $alpha = 1$, nonnegativity and limiting mass near zero give the lower-edge limit; for $alpha > 1$, the second bound and limiting mass near $a_alpha$ give that limit. Thus both edge excesses vanish. Scaling by a fixed $c$ preserves this conclusion, reversing the edges when $c < 0$; the case $c = 0$ is immediate.
  Since $alpha_N lt.eq alpha$, integrating the first singular-value bound gives
  $ sup_N bb(E) parallel W_N parallel_(upright("op"))^2 = sup_N bb(E) (frac(s_max \( G_N \), sqrt(N)))^4 < oo . $
  The finitely many possible cases $m_N = 0$ are zero matrices. Hence $parallel c W_N parallel_(upright("op"))$ and $p_N \( c \)$ are uniformly integrable for each fixed $c$. Proposition 31 gives convergence in probability, and uniform integrability upgrades it to $L^1$.
  For $epsilon in { + 1 \, - 1 }$, put
  $ H_N^epsilon = frac(1, 2 N) max_(sigma in { - 1 \, 1 }^N) sigma^(sans(T)) \( epsilon W_N \) sigma \, #h(2em) A_beta^epsilon = frac(cal(F) \( mu_(alpha \, epsilon beta) \), beta) . $
  The same maximum squeeze as in (7.11) holds pointwise:
  $ frac(p_N \( epsilon beta \), beta) lt.eq H_N^epsilon lt.eq frac(p_N \( epsilon beta \), beta) + frac(log 2, beta) . $
  Also $\| H_N^epsilon \| lt.eq parallel W_N parallel_(upright("op")) \/ 2$, so these energies are uniformly integrable. Taking expectations and then $N arrow.r oo$ at each fixed $beta > 0$ gives
  $ A_beta^epsilon lt.eq liminf_N bb(E) H_N^epsilon lt.eq limsup_N bb(E) H_N^epsilon lt.eq A_beta^epsilon + frac(log 2, beta) . $
  The expectations are bounded, and the gap between their limit superior and limit inferior is at most $log 2 \/ beta$ for every $beta > 0$. They therefore have a common limit $e_epsilon \( alpha \)$, and the same bounds give
  $ 0 lt.eq e_epsilon \( alpha \) - A_beta^epsilon lt.eq frac(log 2, beta) \, $
  which proves (7.15). Given any error tolerance, choose one sufficiently large fixed $beta$ and use (7.14) in the pointwise squeeze. This proves $H_N^epsilon arrow.r e_epsilon \( alpha \)$ in probability; uniform integrability gives convergence in $L^1$.
  Dualizing the Euclidean norm and maximizing a linear functional over the cube gives
  $ parallel G_N parallel_(oo arrow.r 2) = parallel G_N^(sans(T)) parallel_(2 arrow.r 1) = max_(sigma in { - 1 \, 1 }^N) parallel G_N sigma parallel_2 . $
  Consequently,
  $ H_N^(+) = frac(parallel G_N parallel_(oo arrow.r 2)^2, 2 N^2) \, #h(2em) H_N^(-) = - frac(1, 2 N^2) min_(sigma in { - 1 \, 1 }^N) parallel G_N sigma parallel_2^2 . $
  The signs of $e_(+)$ and $e_(-)$ follow from these identities. Since $G_N sigma = sum_i sigma_i g_(N \, i)$, the $L^1$ convergence of the energies and the inequality $\| sqrt(x) - sqrt(y) \| lt.eq sqrt(\| x - y \|)$ for $x \, y gt.eq 0$ give (7.16)–(7.16). ◻
]

For comparison, the finite partition expression in the companion Ising-perceptron manuscript with $f_c \( z \) = c z^2 \/ 2$ is exactly (7.12). For a standard Gaussian $Z$, $bb(E) \| f_c \( Z \) \| = \| c \| \/ 2$, while $bb(E) e^(f_c \( Z \)) = \( 1 - c \)^(- 1 \/ 2)$ for $c < 1$ and is infinite for $c gt.eq 1$. Its integrable-activation theorem [22] Theorem 8.3 therefore applies precisely when $c < 1$ in this quadratic family. Uniqueness of the expected-pressure limit gives the equality of variational values

$ cal(F) \( mu_(alpha \, c) \) = cal(P)_(f_c) \( alpha \) \, #h(2em) c < 1 . $

This compares values, not the functionals pointwise; the companion functional is not invoked for $c gt.eq 1$.

=== 7.5 Why weak convergence on an unbounded support is insufficient <why-weak-convergence-on-an-unbounded-support-is-insufficient>

The bounded-edge hypothesis cannot be replaced by the assertion that all eigenvalues lie in the support of a possibly unbounded limiting law. We give an explicit sequence for which that weaker condition holds but the pressure has no limit.

Let $mu$ have density $e^lambda upright(bold(1))_({ lambda lt.eq 0 })$. For every $N$, its midpoint quantiles are

$ q_(N \, j) = log frac(j - 1 \/ 2, N) \, #h(2em) 1 lt.eq j lt.eq N . $

Their empirical measures converge weakly to $mu$. At even $N$ use these eigenvalues. At odd $N$ replace $q_(N \, 1)$ by $- e^(N^2)$ and leave the other eigenvalues unchanged. Changing one eigenvalue does not affect weak convergence, and every eigenvalue still belongs to $"supp" mu = \( - oo \, 0 \]$.

At even sizes, convexity of $- log u$ gives the midpoint bound

$ 1 / N sum_(j = 1)^N \( - q_(N \, j) \) lt.eq integral_0^1 - log u thin d u = 1 . $

Jensen’s inequality for the uniform spin measure, whose mean quadratic energy is $"Tr" Lambda_N \/ 2$, therefore yields

#[#set math.equation(numbering: n => "(7.17)")
 $ - 1 / 2 lt.eq frac("Tr" Lambda_N, 2 N) lt.eq P_N lt.eq 0 . $ <gen:even-counterexample>]

At odd sizes, let $v_N$ be the unit eigenvector corresponding to $- e^(N^2)$. For each fixed spin vector $sigma$, Haar invariance implies that $v_N dot.op sigma$ has the distribution of $sqrt(N)$ times the first coordinate of a uniform point on the unit sphere in $bb(R)^N$. For $N gt.eq 3$ its density on a fixed neighborhood of zero is bounded by an absolute constant. Indeed, that density is

$ frac(Gamma \( N \/ 2 \), sqrt(pi N) thin Gamma \( \( N - 1 \) \/ 2 \)) (1 - t^2 / N)^(\( N - 3 \) \/ 2) \, #h(2em) \| t \| < sqrt(N) \, $

whose prefactor is bounded. A union bound over the cube gives

$ bb(P) (min_(sigma in { - 1 \, 1 }^N) \| v_N dot.op sigma \| < e^(- 2 N)) lt.eq C 2^N e^(- 2 N) . $

This is summable. Almost surely, for all sufficiently large odd $N$, every spin vector therefore has energy at most $- 1 / 2 e^(N^2 - 4 N)$, since all remaining eigenvalues are nonpositive. Consequently,

#[#set math.equation(numbering: n => "(7.18)")
 $ P_N lt.eq - frac(e^(N^2 - 4 N), 2 N) arrow.r - oo #h(2em) upright("along odd ") N . $ <gen:odd-counterexample>]

The bounds (7.17) and (7.18) prove the claimed failure of convergence. No independence between dimensions is used here either.

== 8 Extension to an external magnetic field <sec:magnetic>

We now add a deterministic external field. This is a separate extension of Theorem 1. Its proof uses magnetization constraints: the single-site functional is concave in covariance levels after prescribing the mean spin, and a product of large constrained blocks supplies the corresponding cavity lower bound.

For a deterministic vector $c^(\( N \)) = \( c_1^(\( N \)) \, dots.h \, c_N^(\( N \)) \) in bb(R)^N$, write

#[#set math.equation(numbering: n => "(8.1)")
 $ P_N \( c^(\( N \)) \) = 1 / N log [2^(- N) sum_(sigma in { - 1 \, 1 }^N) exp {1 / 2 sigma^(sans(T)) U^(sans(T)) Lambda_N U sigma + sum_(r = 1)^N c_r^(\( N \)) sigma_r}] . $ <mag:pressure>]

For $b in bb(R)$, let $ell_b^(upright("can")) \( h \)$ denote the single-site functional defined earlier, with initial position $b$ in place of zero; the subtraction $h_(k - 1) \/ 2$ is unchanged. For $s in \( - 1 \, 1 \)$ define

#[#set math.equation(numbering: n => "(8.2)")
 $ ell^(\[ s \]) \( h \) = inf_(b in bb(R)) { ell_b^(upright("can")) \( h \) - b s } . $ <mag:constrained-functional>]

The bias $b$ is optimized to prescribe the mean spin $s$; the physical external field will contribute its linear term separately in the pressure formula. This single-site concave conjugate is used in generalized TAP theory [8] §2.3, equations (2.21)–(2.23). Optimization over a conventional order parameter outside the Parisi order parameter also appears in Gaussian vector-spin formulas [7] Theorem 1.1. The covariance-level concavity and the constrained-block comparison needed for the present spectral model are proved in this section.

Given positive rational numbers $gamma_1 \, dots.h \, gamma_J$ with sum one and $upright(bold(m)) = \( m_1 \, dots.h \, m_J \) in \( \( - 1 \, 1 \) ∩ bb(Q) \)^J$, put

#[#set math.equation(numbering: n => "(8.3)")
 $ ell^(\[ upright(bold(m)) \]) \( h \) = sum_(j = 1)^J gamma_j ell^(\[ m_j \]) \( h \) \, #h(2em) S_(upright(bold(m))) \( p \) = sup_(h in cal(H)) {ell^(\[ upright(bold(m)) \]) \( h \) + 1 / 2 integral_0^1 p \( s \) h \( s \) thin d s} . $ <mag:Sm>]

The same covariance path $h$ is used in every field group.

For probability laws $nu \, tilde(nu)$ on $bb(R)$ with finite absolute first moments, write

$ W_1 \( nu \, tilde(nu) \) = inf_pi integral_(bb(R)^2) \| x - y \| thin pi \( d x \, d y \) \, $

where the infimum is over probability laws $pi$ with marginals $nu$ and $tilde(nu)$.

#thm([Theorem 8.1.])[
  (Magnetic-field extension).  #emph[Assume the deterministic spectral hypotheses of Theorem 1, with limiting compactly supported law $mu$. Suppose first that the field values belong to a fixed finite alphabet $c_1 \, dots.h \, c_J in bb(R)$, and that the proportion of sites with value $c_j$ tends to a positive rational number $gamma_j$. Then $P_N \( c^(\( N \)) \)$ converges in expectation and almost surely to 
#[#set math.equation(numbering: n => "(8.4)")
 $ cal(F)_mu (sum_(j = 1)^J gamma_j delta_(c_j)) = sup_(upright(bold(m)) in \( \( - 1 \, 1 \) ∩ bb(Q) \)^J) {sum_(j = 1)^J gamma_j c_j m_j + inf_(p in cal(P)) #scale(x: 120%, y: 120%)[\[] S_(upright(bold(m))) \( p \) + G_1 \( p \) #scale(x: 120%, y: 120%)[\]]} . $ <mag:finite-formula>]

 More generally, suppose the empirical field laws converge in the first-moment transport metric $W_1$ to a probability law $nu$ on $bb(R)$ with finite absolute first moment. Then the same modes of convergence hold, with limit $cal(F)_mu \( nu \)$, where 
#[#set math.equation(numbering: n => "(8.5)")
 $ cal(F)_mu \( nu \) = lim_(q arrow.r oo) cal(F)_mu \( nu_q \) $ <mag:W1-formula>]

 for any finite-support laws $nu_q$ with positive rational masses such that $W_1 \( nu_q \, nu \) arrow.r 0$. This limit exists and is independent of the approximating sequence.]
] <mag:theorem>

#prodef([Remark 8.2.])[
  (Conditional random spectral and field data).  Let the spectrum and the field vector both be random. Conditional jointly on these data, assume that the interaction has the Haar orbit law with the prescribed spectrum. Let $mu$ be a fixed compactly supported spectral law and $nu$ a fixed field law with finite absolute first moment. If the spectral hypotheses of Equation (1.2) and convergence of the empirical field laws to $nu$ in $W_1$ hold in probability, then $P_N \( c^(\( N \)) \) arrow.r cal(F)_mu \( nu \)$ in probability. If both data convergences hold almost surely, the pressure convergence also holds almost surely. In either case, uniform integrability of the pressures implies convergence of their expectations.
  Indeed, condition on both data sets and apply the deterministic theorem along convergent data sequences. The subsequence argument and localized fourth-moment concentration in Proposition 31 apply unchanged, since the Haar Lipschitz constant is independent of the external field. The conditional Haar hypothesis remains essential when the fields and the interaction are dependent.
] <mag:random-data>

=== 8.1 Concavity at prescribed magnetization <concavity-at-prescribed-magnetization>

We first prove the concavity needed to optimize the cavity expression. All level derivatives in this subsection keep the interval weights $w_i$ fixed. For a fixed bias $b$, let $Z_i$ be the tilted Gaussian position chain, starting before the root increment at $b$, and let $F_i$ be its unshifted backward functions. Define

$ cal(B)_i \( h \, b \) = bb(E) #scale(x: 120%, y: 120%)[\[] F'_i \( Z_i \)^2 #scale(x: 120%, y: 120%)[\]] . $

The terminal conditional mean spin is $tanh Z_(k - 1)$, and its successive conditional means are $F'_i \( Z_i \)$. Consequently these squared-mean expectations are nonnegative and nondecreasing in $i$.

#thm([Proposition 8.3.])[
  #emph[Fix $s in \( - 1 \, 1 \)$ and positive interval weights $w_0 \, dots.h \, w_(k - 1)$. The function $ell^(\[ s \])$ is concave on $0 lt.eq h_0 lt.eq dots.h.c lt.eq h_(k - 1) < oo$. Its minimizing bias $b_s \( h \)$ in (8.2) is unique. On strict level data, set 
$ B_i \( h \, s \) = cal(B)_i \( h \, b_s \( h \) \) . $

 Then 
#[#set math.equation(numbering: n => "(8.6)")
 $ partial_(h_i) ell^(\[ s \]) \( h \) = - w_i / 2 B_i \( h \, s \) . $ <mag:envelope-derivative>]

 The associated supporting inequalities extend to boundary level data and are unchanged by subdivision of intervals with tied covariance levels. The function is $1 \/ 2$-Lipschitz in the $L^1$ distance between bounded nonnegative nondecreasing paths.]
] <mag:concavity>

#proof[
  Let $f_h \( b \) = ell_b^(upright("can")) \( h \) + h_(k - 1) \/ 2$ be the unshifted initial backward value. Gaussian convolution and differentiation of the log-exponential operators show that $f_h$ is smooth and strictly convex: its second derivative is a positive tilted average of the terminal second derivative, plus nonnegative conditional-variance terms. Moreover, with $H = h_(k - 1)$,
  #[#set math.equation(numbering: n => "(8.7)")
   $ log cosh b lt.eq f_h \( b \) lt.eq log cosh b + H \/ 2 . $ <mag:bias-bounds>]
  For the lower bound, compare every backward operator with ordinary expectation and use convexity of $log cosh$. For the upper bound, compare with exponent one throughout and use $bb(E) cosh \( b + sqrt(H) Z \) = e^(H \/ 2) cosh b$. Convex difference quotients in (8.7) imply that $f'_h \( b \) arrow.r plus.minus 1$ as $b arrow.r plus.minus oo$, uniformly for $H$ in a bounded set. Thus $f'_h \( b_s \( h \) \) = s$ determines a unique bias, bounded uniformly over paths of bounded height for each fixed interior $s$.
  Gaussian differentiation, as in Proposition 9, gives $partial_(h_i) ell_b^(upright("can")) = - w_i cal(B)_i \( h \, b \) \/ 2$. The envelope rule proves (8.6). In the remainder of the proof $s$ is held fixed, so derivatives of $B_i \( h \, s \)$ include the change in $b_s \( h \)$. We use the mean spin as spatial coordinate, so that the varying bias is represented by the fixed initial coordinate $s$. We will prove that $partial_(h_l) B_i lt.eq 0$ for $l > i$ and $sum_l h_l partial_(h_l) B_i gt.eq 0$, then apply the Hessian argument of Theorem 12.
  Set $T = h_(k - 1)$ and let $zeta \( v \) = zeta_i$ for $h_(i - 1) < v < h_i$. The continuous-time version of the unshifted backward recursion solves, on each such interval,
  $ F_v + 1 / 2 F_(z z) + 1 / 2 zeta \( v \) F_z^2 = 0 \, #h(2em) F \( T \, z \) = log cosh z . $
  For the radial comparison we also need $alpha > 0$. Let $F^alpha$ solve the same recursion with terminal value $alpha^(- 1) log cosh \( alpha z \)$ and coefficient $alpha zeta \( v \)$ in place of $zeta \( v \)$. Write
  $ u = F_z^alpha \( v \, z \) \, #h(2em) a \( v \, u \) = F_(z z)^alpha \( v \, z \( v \, u \) \) \, #h(2em) - 1 < u < 1 . $
  Strict convexity gives the inverse $z \( v \, u \)$. With $L = partial_v + 1 / 2 partial_(z z) + alpha zeta F_z^alpha partial_z$, differentiation gives $L \( F_z^alpha \) = 0$ and $L \( F_(z z)^alpha \) = - alpha zeta \( F_(z z)^alpha \)^2$. The chain rule in inverse coordinates therefore yields
  #[#set math.equation(numbering: n => "(8.8)")
   $ a_v + 1 / 2 a^2 a_(u u) = - alpha zeta \( v \) a^2 \, #h(2em) a \( T \, u \) = alpha \( 1 - u^2 \) . $ <mag:inverse-PDE>]
  Likewise, continuation of a payoff by the tilted transition kernels satisfies
  #[#set math.equation(numbering: n => "(8.9)")
   $ H_v + 1 / 2 a^2 H_(u u) = 0 . $ <mag:continuation-PDE>]
  In particular, if $H_i$ has terminal condition $H_i \( h_i \, u \) = u^2$, then $B_i \( h \, s \) = H_i \( 0 \, s \)$ at $alpha = 1$.
  We record the boundary regularity that permits comparison on the closed interval $\[ - 1 \, 1 \]$. For fixed strict level data and $alpha > 0$, the backward functions have, as $z arrow.r + oo$, expansions to every prescribed finite order of the form
  #[#set math.equation(numbering: n => "(8.10)")
   $ F^alpha \( v \, z \) = z + C \( v \) + c_1 \( v \) e^(- 2 alpha z) + dots.h.c + c_M \( v \) e^(- 2 M alpha z) + O \( e^(- 2 \( M + 1 \) alpha z) \) \, #h(2em) c_1 \( v \) > 0 . $ <mag:asymptotic>]
  The expansions hold with any fixed finite number of differentiated remainders, uniformly on the closed time intervals between successive levels. To verify this, start from the expansion of the terminal $alpha^(- 1) log cosh \( alpha z \)$. An ordinary Gaussian backward step integrates each exponential term. In a positive-exponent step, first factor the linear exponential, expand the remaining exponential, integrate term by term against the Gaussian with the resulting shifted mean, and take the logarithm. The leading correction is multiplied by a strictly positive Gaussian exponential moment. Remainders satisfy the same bounds: on bounded or negative arguments an exponential bound of the indicated order dominates their linear or exponential growth, and Gaussian exponential moments are finite. The argument applies after differentiating any fixed finite number of times. Coefficients are continuous in time, and the positive leading coefficient is bounded away from zero for the fixed data under consideration.
  Tilted continuations of $\( F_z^alpha \)^2$ obey the same finite expansion property, by taking ratios of the corresponding Gaussian integrals. Since $1 - u = 2 alpha c_1 \( v \) e^(- 2 alpha z) + O \( e^(- 4 alpha z) \)$, inverting this expansion gives bounded spatial derivatives through order four for $a$ and the functions $H_i$ on $\[ - 1 \, 1 \]$. Reflection treats the other endpoint. In particular,
  $ a \( v \, u \) = 2 alpha \( 1 - u \) + O \( \( 1 - u \)^2 \) quad \( u arrow.r 1 \) \, #h(2em) a \( v \, u \) = 2 alpha \( 1 + u \) + O \( \( 1 + u \)^2 \) quad \( u arrow.r - 1 \) . $
  Thus $a$ vanishes at both endpoints, as does $\( a^2 \)_u$. The equations give the required one-sided time derivatives at the finitely many level boundaries.
  We next prove two monotonicities. First, every $H_i$ is convex in $u$. Indeed $W = H_(i \, u u)$ satisfies
  $ W_v + 1 / 2 \( a^2 W \)_(u u) = 0 \, #h(2em) W \( h_i \, u \) = 2 . $
  Expanded as a linear equation, its coefficients are bounded; the diffusion and first-derivative coefficients vanish at the endpoints. Backward comparison preserves nonnegativity. The same comparison in (8.9) shows that increasing a nonnegative coefficient $a$ pointwise increases $H_i$, because its second spatial derivative is nonnegative. These comparison assertions also follow directly by reversing time, multiplying a proposed difference by a sufficiently decaying exponential, and excluding a first negative minimum; the bounded zeroth-order terms are absorbed by the exponential. This argument applies interval by interval in time, including the degenerate endpoints.
  At $alpha = 1$, fix $l > i$. The covariance derivative calculation for the backward field value, at any $v lt.eq h_i$, reads
  $ partial_(h_l) F \( v \, z \) = upright("a constant independent of ") z - w_l / 2 H_l \( v \, F_z \( v \, z \) \) . $
  For a variation $delta F$, differentiation at fixed inverse coordinate gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ delta a = delta F_(z z) - F_(z z z) / F_(z z) delta F_z = a^2 partial_(u u) #scale(x: 120%, y: 120%)[\[] delta F \( v \, z \( v \, u \) \) #scale(x: 120%, y: 120%)[\]] . $ <mag:inverse-variation>]
  Convexity of $H_l$ therefore implies $partial_(h_l) a lt.eq 0$ through time $h_i$. Applying the preceding continuation comparison at the fixed initial coordinate $s$ proves
  #[#set math.equation(numbering: n => "(8.12)")
   $ partial_(h_l) B_i \( h \, s \) lt.eq 0 #h(2em) \( l > i \) . $ <mag:off-diagonal>]
  For the second monotonicity, $a$ increases with $alpha$. To see the sign explicitly, reverse time in (8.8), write $A_1 \, A_2$ for the solutions with $alpha_1 < alpha_2$, and set $D = A_2 - A_1$. Then
  $ D_t = 1 / 2 A_2^2 D_(u u) + c D + \( alpha_2 - alpha_1 \) zeta A_1^2 \, #h(2em) c = \( A_2 + A_1 \) (1 / 2 A_(1 \, u u) + alpha_2 zeta) . $
  The coefficient $c$ is bounded, the initial difference is $\( alpha_2 - alpha_1 \) \( 1 - u^2 \) gt.eq 0$, and the boundary difference is zero. Comparison proves $D gt.eq 0$. Position and time rescaling give the identity
  $ F_h^alpha \( v \, z \) = alpha^(- 1) F_(alpha^2 h)^1 \( alpha^2 v \, alpha z \) \, $
  with the level intervals rescaled on the right. The corresponding initial biases satisfy $b_s^alpha \( h \) = alpha^(- 1) b_s^1 \( alpha^2 h \)$. It follows that increasing $alpha$ increases $B_i \( alpha^2 h \, s \)$, whence
  #[#set math.equation(numbering: n => "(8.13)")
   $ sum_l h_l partial_(h_l) B_i \( h \, s \) gt.eq 0 . $ <mag:radial>]
  Finally, the matrix $M_(i l) = w_i partial_(h_l) B_i$ is symmetric by (8.6). Equations (8.12) and (8.13) show that $"diag" \( h \) M "diag" \( h \)$ has nonpositive off-diagonal entries and nonnegative row sums. For a symmetric matrix with these properties its quadratic form is a sum of nonnegative weighted squares of coordinate differences and nonnegative diagonal terms. Thus $M$ is positive semidefinite on strict level data, proving concavity. Continuity extends the supporting inequalities to the boundary. Tied levels introduce no new conditional mean and simply repeat the same $B_i$. The bound $0 lt.eq B_i lt.eq 1$ in (8.6), followed by common refinement, gives the $L^1$ Lipschitz assertion. ◻
]

We shall use the weighted mean

$ B_i^(*) \( h \) = sum_(j = 1)^J gamma_j B_i \( h \, m_j \) . $

Proposition 36 gives the supporting derivative $- w_i B_i^(*) \( h \) \/ 2$ for $ell^(\[ upright(bold(m)) \])$.

=== 8.2 Upper bounds on magnetization slices <upper-bounds-on-magnetization-slices>

We first work with a finite spectral alphabet of positive rational proportions, along the count progressions used in the cavity construction. We also arrange periodic field proportions $gamma_j$, with bounded remainder sites. The final subsection removes these restrictions. Fix an interior rational vector $upright(bold(m))$. Let $cal(I)_(j \, N)$ be the sites in field group $j$ and put $N_j = \| cal(I)_(j \, N) \|$. For all sufficiently large $N$, choose integers $0 lt.eq k_(j \, N) lt.eq N_j$ such that $2 k_(j \, N) \/ N_j - 1 arrow.r m_j$; for example, take the nearest integer to $N_j \( 1 + m_j \) \/ 2$. Define the exact slice

$ cal(S)_N \( upright(bold(m)) \) = {sigma in { - 1 \, 1 }^N : \# { r in cal(I)_(j \, N) : sigma_r = 1 } = k_(j \, N) upright(" for every ") j} . $

Retain its original cube mass $2^(- N) upright(bold(1))_(cal(S)_N \( upright(bold(m)) \))$.

The concentration, perturbation, and rotation identities of Section 4 apply to this prior: after normalizing its nonzero mass, it is a deterministic probability on cube spins independent of the Haar frame. The logarithm of its mass is kept in the pressure. At interpolation time zero, insert an arbitrary bias $b_j$ on field group $j$. This adds a constant on the slice. Relaxing the slice constraint then bounds its expected enriched pressure by

$ sum_j gamma_j ell_(b_j)^(upright("can")) \( h \) - sum_j gamma_j b_j m_j + o \( 1 \) . $

Minimizing in the biases gives $ell^(\[ upright(bold(m)) \]) \( h \) + o \( 1 \)$, uniformly on fixed-step compact field sets. Uniformity follows from the bounded-bias conclusion of (8.7) and the vanishing rounding errors in the group proportions and magnetizations.

The contact comparison of Section 5 now gives

#[#set math.equation(numbering: n => "(8.14)")
 $ limsup_(N arrow.r oo) bb(E) P_(N \, cal(S)_N \( upright(bold(m)) \)) \( 0 \) lt.eq inf_(p in cal(P)) { S_(upright(bold(m))) \( p \) + G_1 \( p \) } . $ <mag:slice-upper>]

Here $P_(N \, cal(S)) \( 0 \)$ denotes the pressure with the original cube mass restricted to $cal(S)$ and with no external field. We specify the changes in that comparison. For a step trial $q$ of maximum less than one, choosing bias zero in (8.2) and testing $h = 0$ in (8.3) give

$ - log 2 lt.eq S_(upright(bold(m))) \( q \) lt.eq S \( q \) < oo \, $

where finiteness follows from Lemma 13. Replace $S \( q \)$ in the minimizing objective by $S_(upright(bold(m))) \( q \)$. The time-zero bound just proved excludes that endpoint. Relaxing the slice without any bias gives the same large-height estimate as before, with at most an additional $log 2$ in its constant lower bound, so the field cap is excluded as well. The field derivative at a minimum still gives the tail inequalities between the Gibbs quantile $p$ and $q$; the rotation identities still give the energy comparison, excluding a minimum at positive time. These are precisely the three conclusions used in the contact argument. The small perturbation changes the pressure by $O \( e_N \)$ also for the normalized slice prior. Rounding an arbitrary $p$ downward cannot increase $S_(upright(bold(m))) \( p \)$, and changes $G_1 \( p \)$ continuously, proving (8.14) for the full trial class.

It remains to justify the supremum over rational interior slices in the full partition function. If two prescribed sets of positive-spin counts differ by at most $delta N$, map every configuration of the first slice to the second by flipping at most that many spins. For a uniformly bounded interaction matrix $J_N = U^(sans(T)) Lambda_N U$,

$ frac(1, 2 N) lr(|sigma^(sans(T)) J_N sigma - tau^(sans(T)) J_N tau|) lt.eq C sqrt(delta) . $

Indeed $parallel sigma - tau parallel lt.eq 2 sqrt(delta N)$ and $parallel sigma + tau parallel lt.eq 2 sqrt(N)$. Every image has at most the size of a Hamming ball of radius $delta N$ preimages. Applying maps in both directions shows that the two restricted normalized log partitions differ by at most $C sqrt(delta) + sans(h) \( delta \) + o_N \( 1 \)$ for small $delta$, where $sans(h) \( x \) = - x log x - \( 1 - x \) log \( 1 - x \)$. The external-field contributions differ by at most $2 max_j \| c_j \| delta$.

Choose a finite arbitrarily fine net of rational interior magnetizations, also approximating the endpoint values $plus.minus 1$. There are at most $\( N + 1 \)^J$ slices, so summing their partition functions adds only $J log \( N + 1 \) \/ N$. The preceding deterministic comparison reduces their maximum to the finite net. Concentration from Lemma 14 applies to every member of that net. Equation (8.14), followed by refinement of the net, therefore proves the upper bound in (8.4), in expectation and almost surely.

=== 8.3 A product of constrained blocks <a-product-of-constrained-blocks>

For the lower bound, fix $upright(bold(m))$ as above and choose an integer $n$ such that $n gamma_j$, $n gamma_j \( 1 + m_j \) \/ 2$, and $n rho_a$ are all integers. Integers $n$ with these properties have unbounded multiples. Partition the regular sites into blocks of size $n$, with the same field group composition in each block. In every block prescribe magnetization $m_j$ separately in group $j$. Freeze any bounded number of remainder sites. This gives a product of nonempty finite slices; retain the original cube mass throughout.

For this fixed $n$, add one block at a time using the coupling of Section 6. The spectral coupling, fresh within-group frames, perturbation comparison, and quadratic Gaussian transformation are unchanged. Their base-replica moment bounds use only independence of the fresh frames and $parallel sigma parallel^2 = N$, so they apply to the present prior. For clarity, the two uses of full-model site symmetry have the following replacements.

First, each position within a regular block is exchangeable with the same position in every other regular block. If there are $K$ such blocks, the expected square of a spectral projection at any fixed regular position is at most $\( N + n \) \/ K$. For fixed $n$ this is bounded uniformly in $N$, and the finite number of cavity coordinates consequently has the projection tightness required for the restricted Gibbs tests. Second, averaging a cavity spin product over its $n$ positions, against a bounded test of the total overlap, equals the analogous average over all regular sites. The difference from the full total overlap is bounded by twice the fraction of remainder sites. These observations give exactly the tightness and overlap-test identities used in Lemma 22 and Proposition 26.

If a restricted spin integral is empty for some frame data, assign zero to its bounded Gibbs test. The full tilted mass outside the restriction bounds the error of this convention. On the base side, the same moment bounds make the probability of a nearly empty restricted mass small, and denominator regularization proceeds as in Lemma 22. For logarithms, Jensen now includes the logarithm of the positive cavity-slice mass, a constant depending on the fixed $n$. Thus the uniform lower bound for increments and all cap-removal steps remain valid. No estimate uniform in $n$ is required at this point.

Let $cal(C)_n subset { - 1 \, 1 }^n$ be the constrained cavity block. Define $ell^(\( n \)) \( h \)$ by the same backward Gaussian recursion as $ell$, now with $n$ independent coordinate increments and terminal payoff

$ log (2^(- n) sum_(epsilon in cal(C)_n) e^(z dot.op epsilon)) . $

Subtract $n h_(k - 1) \/ 2$ and divide the resulting initial value by $n$. Let $B_i^(\( n \)) \( h \)$ be the mean over the $n$ coordinates of the expected squared conditional spin means at level $i$. It is a nonnegative nondecreasing sequence in $\[ 0 \, 1 \]$, and Gaussian differentiation gives $d ell^(\( n \)) = - 1 / 2 sum_i w_i B_i^(\( n \)) d h_i$. For each fixed $n$, the cavity-spin tests will match these block conditional products to the limiting overlap quantile. We then let the block size grow. Uniform approximation of both $ell^(\( n \))$ and $B^(\( n \))$ by $ell^(\[ upright(bold(m)) \])$ and $B^(*)$ will allow the supporting inequality of Proposition 36 to control the field supremum. Thus concavity is used for $ell^(\[ upright(bold(m)) \])$ after the block replacement; concavity of $ell^(\( n \))$ is not required.

For a limiting base quantile $p$, take the finite monotone roundings $macron(p)$ used in Section 6, and set

#[#set math.equation(numbering: n => "(8.15)")
 $ h_(macron(p)) \( s \) = integral_0^(macron(p) \( s \)) R' \( D_(macron(p)) \( r \) \) thin d r . $ <mag:hp>]

The evaluation in Proposition 25 gives the cavity expression per added spin

#[#set math.equation(numbering: n => "(8.16)")
 $ ell^(\( n \)) \( h_(macron(p)) \) + 1 / 2 integral_0^1 macron(p) \( s \) h_(macron(p)) \( s \) thin d s + G_1 \( macron(p) \) . $ <mag:block-cavity>]

The determinant term is unchanged. The residual covariance and the matrix $C$ on the cavity coordinates are scalar, so their contributions depend only on $parallel epsilon parallel^2 = n$ and remain constant on the slice.

At every parameter sequence for which the averaged perturbation estimates of Section 4 vanish, a subsequential base overlap limit exists. The cap argument gives a lower bound for the liminf increment by the limit of (8.16). The bounded Gibbs tests and the cavity-site average proved above give, for every continuous $phi.alt$,

$ lim_(macron(p) arrow.r p) integral_0^1 phi.alt \( macron(p) \( s \) \) #scale(x: 120%, y: 120%)[\(] B_(h_(macron(p)))^(\( n \)) \( s \) - macron(p) \( s \) #scale(x: 120%, y: 120%)[\)] thin d s = 0 . $

As in Proposition 26, monotonicity gives compactness of the $B^(\( n \))$ paths. A limiting path is constant on each plateau of $p$, since equal covariance levels repeat conditional means. It is therefore a function of $p$, and the test identity forces

#[#set math.equation(numbering: n => "(8.17)")
 $ B_(h_(macron(p)))^(\( n \)) arrow.r p quad upright("in ") L^1 . $ <mag:block-consistency>]

Gaussian comparison also gives the $L^1$ continuity needed for the limit of (8.16). These statements take $N arrow.r oo$ and then remove caps and refine the finite quantiles, with $n$ fixed.

The remaining task is to replace the block functional by the constrained single-site functional. Its proof must be uniform in the number of cascade levels, because the roundings of $p$ can have arbitrarily many steps.

#thm([Lemma 8.4.])[
  (Uniform replacement of a constrained block).  #emph[Fix an interior rational $upright(bold(m))$, positive rational proportions $gamma_j$, and a height bound $H < oo$. Along integers $n$ for which the block constraints are attainable, 
#[#set math.equation(numbering: n => "(8.18)")
 $ sup_(h in cal(H)\
parallel h parallel_oo lt.eq H) \| ell^(\( n \)) \( h \) - ell^(\[ upright(bold(m)) \]) \( h \) \| arrow.r 0 \, #h(2em) sup_(h in cal(H)\
parallel h parallel_oo lt.eq H) max_i \| B_i^(\( n \)) \( h \) - B_i^(*) \( h \) \| arrow.r 0 . $ <mag:replacement-estimates>]

 The estimates are uniform in the number of steps and their positive weights.]
] <mag:replacement>

#proof[
  For a given path $h$, insert the minimizing bias $b_j = b_(m_j) \( h \)$ in every coordinate of group $j$. These biases are bounded uniformly by (8.7). Consider two unnormalized $n$-coordinate recursions: the canonical one with all $2^n$ spins, and the constrained one with $cal(C)_n$. Both use these same biases. Denote the backward values just after level $i$ by $U_i$ and $V_i$, respectively, and put $Delta_i = U_i - V_i gt.eq 0$. The canonical values add over coordinates, so its tilted kernels factor over sites. Write
  $ L_n = U_(- 1) \( 0 \) - V_(- 1) \( 0 \) = n #scale(x: 120%, y: 120%)[\(] ell^(\[ upright(bold(m)) \]) \( h \) - ell^(\( n \)) \( h \) #scale(x: 120%, y: 120%)[\)] . $
  We first prove $L_n = o \( n \)$ uniformly over the permitted paths, which gives the first estimate. The same loss will bound the relative entropy of two sampled paths; independent-site concentration under the canonical law will then give the second estimate. At the root, $L_n = bb(E) Delta_0$. At a positive-exponent step the canonical transition kernel, denoted by $K_i^(upright("can"))$, gives
  $ Delta_(i - 1) = - 1 / zeta_i log bb(E)_(K_i^(upright("can"))) e^(- zeta_i Delta_i) lt.eq bb(E)_(K_i^(upright("can"))) Delta_i . $
  Iteration proves
  #[#set math.equation(numbering: n => "(8.19)")
   $ 0 lt.eq L_n lt.eq bb(E)_(upright("can")) Delta_(k - 1) . $ <mag:root-leaf-loss>]
  We bound the terminal loss without a factor depending on the number of steps. If a one-coordinate canonical increment $g$ has Gaussian variance $v$, its conditional tilted density is proportional to $exp { zeta F \( z + g \) }$, where $F$ is $1$-Lipschitz and $0 lt.eq zeta lt.eq 1$. Gaussian shifting gives, for every $t in bb(R)$,
  #[#set math.equation(numbering: n => "(8.20)")
   $ bb(E)_(upright("tilt")) e^(t g) = e^(t^2 v \/ 2) frac(bb(E) e^(zeta F \( z + g + t v \)), bb(E) e^(zeta F \( z + g \))) lt.eq e^(t^2 v \/ 2 + \| t \| v) . $ <mag:increment-mgf>]
  For the root increment the sharper ordinary Gaussian bound holds. Successive conditioning in (8.20) bounds the exponential moments of each terminal field using only total variance $H$ and the bounded initial bias. Thus, for the vector $z$ of terminal fields including their biases,
  #[#set math.equation(numbering: n => "(8.21)")
   $ bb(E)_(upright("can")) parallel z parallel^2 lt.eq C_H n \, $ <mag:field-moment>]
  uniformly in the depth and the step weights.
  Under the averaged canonical path kernels and final spin draws, the sites are independent and their means are $m_j$ in group $j$; this is exactly the bias equation $f'_h \( b_j \) = m_j$. Map each spin vector $epsilon$ deterministically to a nearest vector $hat(epsilon) in cal(C)_n$. If $D$ is the number of flipped coordinates, the binomial variance estimate in each group gives $bb(E)_(upright("can")) D lt.eq C sqrt(n)$. At fixed fields, use the pushforward of the canonical Gibbs spin law as a trial law for the constrained log partition. The finite-space log-sum variational identity then bounds the terminal loss by the expected exponent loss plus the entropy loss. Averaging the former and using (8.21),
  $ bb(E) \| z dot.op \( epsilon - hat(epsilon) \) #scale(x: 120%, y: 120%)[\|] lt.eq \( bb(E) parallel z parallel^2 \)^(1 \/ 2) \( 4 bb(E) D \)^(1 \/ 2) lt.eq C_H n^(3 \/ 4) . $
  The original spin vector is determined by its image and its flip mask. Therefore its entropy loss is at most the entropy of that mask, and subadditivity and concavity of binary entropy give the averaged bound $n sans(h) \( bb(E) D \/ n \) lt.eq C sqrt(n) log \( n + 1 \)$. Together with (8.19), this proves
  #[#set math.equation(numbering: n => "(8.22)")
   $ 0 lt.eq L_n lt.eq C_H #scale(x: 120%, y: 120%)[\(] n^(3 \/ 4) + sqrt(n) log \( n + 1 \) #scale(x: 120%, y: 120%)[\)] = o \( n \) . $ <mag:loss-rate>]
  This establishes the first assertion of (8.18).
  To compare the two-spin products, compare the path-mark and terminal-spin laws under the constrained and canonical kernels. The logarithm of the ratio of their level-$i$ densities is $zeta_i \( Delta_(i - 1) - Delta_i \)$ for $i > 0$. The root mark law is unchanged. On allowed terminal spins, the final log-density ratio is $Delta_(k - 1)$. Hence the chain rule for conditional relative entropies, with weight $1 \/ zeta_i$ at level $i > 0$ and weight one for the final spin draw, telescopes to $L_n$:
  #[#set math.equation(numbering: n => "(8.23)")
   $ sum_(i = 1)^(k - 1) 1 / zeta_i bb(E)_(upright("con")) "KL" \( K_i^(upright("con")) bar.v.double K_i^(upright("can")) \) + bb(E)_(upright("con")) "KL" \( K_(upright("spin"))^(upright("con")) bar.v.double K_(upright("spin"))^(upright("can")) \) = L_n . $ <mag:weighted-entropy>]
  Here each conditional entropy is evaluated at the same past, with the outer expectation taken under the constrained past law. Every term is nonnegative. Since $zeta_i lt.eq 1$, the ordinary relative entropy of the full one-path laws is at most $L_n$. This bound remains valid for arbitrarily small positive $zeta_i$; no lower bound on the step weights or their cumulative sums is used.
  Condition now on a specified common level $i$ of two sampled cascade leaves. The transformed cascade law and the mark representation of Proposition 5 show that each path has the same one-path marginal; its kernels are shared before the split and independent afterwards. The conditional relative entropies of the shared kernels are counted once and those after the split, including terminal spin draws, at most twice. Thus the joint two-path relative entropy is at most $2 L_n$. In the canonical law, sites are independent even conditional on this branching information: the backward values add over sites and each kernel factors over their coordinates. The average two-spin product therefore has mean $B_i^(*) \( h \)$, and the elementary exponential-moment bound for independent variables in $\[ - 1 \, 1 \]$ yields
  $ bb(P)_(upright("can")) {lr(|1 / n sum_(r = 1)^n epsilon_r^1 epsilon_r^2 - B_i^(*) \( h \)|) > eta} lt.eq 2 e^(- n eta^2 \/ 2) . $
  The constants do not depend on the branching level or the depth. For any event $A$ and probability laws $nu \, pi$,
  $ "KL" \( nu bar.v.double pi \) gt.eq nu \( A \) log frac(1, pi \( A \)) - log 2 \, $
  as follows by mapping to the two events $A \, A^c$ and expanding binary relative entropy. Apply this with the constrained and canonical two-path laws. Equations (8.22) and (8.23) imply that every fixed positive deviation has constrained probability tending to zero uniformly in $i$ and $h$. The average spin product is bounded by one, so its expectation converges uniformly to $B_i^(*) \( h \)$. Its constrained expectation is $B_i^(\( n \)) \( h \)$, which proves the second assertion. ◻
]

=== 8.4 Completing the lower bound and the approximations <completing-the-lower-bound-and-the-approximations>

For the fixed finite spectral alphabet, $R'$ is bounded on $\[ 0 \, 1 \]$. The fields in (8.15) consequently have a common height bound $H$ independent of $p$ and its rounding. Fix a height $A < oo$ for a test field $v in cal(H)$. By Proposition 36 and Lemma 37, after a common refinement of step intervals,

#[#set math.equation(numbering: n => "(8.24)")
 $ ell^(\[ upright(bold(m)) \]) \( v \) lt.eq ell^(\( n \)) \( h_(macron(p)) \) - 1 / 2 integral_0^1 B_(h_(macron(p)))^(\( n \)) \( s \) \( v \( s \) - h_(macron(p)) \( s \) \) thin d s + epsilon.alt_n \( H \, A \) \, #h(2em) epsilon.alt_n \( H \, A \) arrow.r 0 . $ <mag:block-tangent>]

The error is uniform over $parallel v parallel_oo lt.eq A$, the finite roundings, and their depths. Equal covariance levels simply repeat conditional products. Taking $macron(p) arrow.r p$ in (8.24) and using (8.17) shows that the liminf cavity increment per spin is at least

#[#set math.equation(numbering: n => "(8.25)")
 $ a_A - epsilon.alt_n \( H \, A \) \, #h(2em) a_A = inf_(p in cal(P)) {G_1 \( p \) + sup_(v in cal(H)\
parallel v parallel_oo lt.eq A) [ell^(\[ upright(bold(m)) \]) \( v \) + 1 / 2 integral_0^1 p \( s \) v \( s \) thin d s]} . $ <mag:truncated-infimum>]

This bound no longer depends on the limiting base array. The parameter sets supplied by the averaged perturbation estimates have probability tending to one. The uniform Jensen lower bound on the remaining increments, with $n$ fixed, allows parameter averaging; telescoping along every progression of step $n$ then gives the same lower pressure bound for the product of constrained blocks. Perturbations change its unnormalized expected log partition by $o \( N \)$, just as for the cube.

Restoring the field adds $sum_j gamma_j c_j m_j + o \( 1 \)$ per spin on these configurations. They form a subset of the original cube, so for each fixed $A$ we may first send $N arrow.r oo$ at fixed admissible $n$, with the cap and rounding limits already taken in the cavity calculation, and then send $n arrow.r oo$ along admissible multiples. Equation (8.25) gives

$ liminf_(N arrow.r oo) bb(E) P_N \( c^(\( N \)) \) gt.eq sum_j gamma_j c_j m_j + a_A . $

Finally,

#[#set math.equation(numbering: n => "(8.26)")
 $ a_A arrow.t inf_(p in cal(P)) { G_1 \( p \) + S_(upright(bold(m))) \( p \) } #h(2em) \( A arrow.r oo \) . $ <mag:height-limit>]

To justify the order of optimization, choose approximate minimizers $p_A$ along a sequence of heights tending to infinity. The set of nondecreasing functions valued in $\[ 0 \, 1 \]$ is compact in $L^1$, so a subsequence converges to $p$. The functional $G_1$ is continuous there. Every fixed finite-step field $v$ is eventually allowed in the truncated supremum, and $integral p_A v arrow.r integral p v$. Thus the limiting truncated value is at least $G_1 \( p \) + ell^(\[ upright(bold(m)) \]) \( v \) + 1 / 2 integral p v$ for every $v$. Taking the supremum proves the lower inequality in (8.26); the reverse inequality follows from truncation. The values are finite above, for example by testing $p = 0$, and bounded below by testing $v = 0$. This completes the lower bound for each rational interior $upright(bold(m))$. Taking its supremum proves (8.4) under the finite rational spectral restrictions.

We remove those restrictions before passing to general fields. The count comparison and the spectral bins in Section 7 apply with the external field present: rotations within a repeated-eigenvalue group leave the interaction unchanged, so the same averaged projection bounds hold. On the formula side only $G_1$ depends on the spectral law, and its uniform difference is bounded by half the uniform difference of the corresponding $R$ functions. Hence all the infima and the outer supremum are stable under the spectral approximations. This proves the finite-field formula for the compact spectral law of the theorem. Likewise, finite field counts converging to $gamma_j$ can be replaced, after a coordinate permutation, by periodic rational counts with bounded remainder and $o \( N \)$ changed sites. The mean absolute field change tends to zero. Haar permutation invariance identifies the expected pressures before and after the permutation.

For arbitrary deterministic vectors $c \, d in bb(R)^N$, direct comparison of the exponents gives

#[#set math.equation(numbering: n => "(8.27)")
 $ \| P_N \( c \) - P_N \( d \) \| lt.eq 1 / N sum_(r = 1)^N \| c_r - d_r \| . $ <mag:field-Lipschitz>]

For expected pressures we may permute coordinates first. On the line, matching sorted vectors realizes the minimum mean absolute difference, which is the $W_1$ distance between their equal-weight empirical laws. Applying (8.27) to finite-field sequences and taking their proven limits shows that $cal(F)_mu$ is $1$-Lipschitz on finite-support laws with rational masses. Such laws are dense among probability laws of finite first moment: truncate the tails, use a finite continuity mesh, and approximate its masses by rationals. The Lipschitz bound proves existence and independence of the limit in (8.5). For a field sequence with empirical laws $nu_N arrow.r nu$ in $W_1$, fix such an approximation $nu_q$ and choose $N$-site field vectors with values in $"supp" nu_q$ and proportions converging to its masses. Their empirical laws then converge to $nu_q$ in $W_1$. Matching the sorted vectors in (8.27) and taking their proven finite-field limits gives

$ limsup_(N arrow.r oo) \| bb(E) P_N \( c^(\( N \)) \) - cal(F)_mu \( nu_q \) #scale(x: 120%, y: 120%)[\|] lt.eq W_1 \( nu \, nu_q \) . $

Letting $q arrow.r oo$ proves convergence of the expected pressure to $cal(F)_mu \( nu \)$.

Finally, the Haar Lipschitz constant of the normalized pressure is independent of the deterministic external field. The fourth-moment concentration estimate of Lemma 14 and Borel–Cantelli therefore upgrade all these expected limits to almost-sure limits. This proves Theorem 34.

#heading(level: 1)[References]
#bibitem([1])[M. Aizenman, R. Sims and S. L. Starr, #link("https://doi.org/10.1103/PhysRevB.68.214403")[Extended variational principle for the Sherrington--Kirkpatrick spin-glass model], #emph[Physical Review B] #strong[68] (2003), 214403. #link("https://arxiv.org/abs/cond-mat/0306386v1")[arXiv:cond-mat/0306386v1].]
#bibitem([2])[Antonio Auffinger and Wei-Kuo Chen. The Legendre structure of the Parisi formula. #emph[Communications in Mathematical Physics], 348(3):751--770, 2016. #link("https://doi.org/10.1007/s00220-016-2673-0")[doi:10.1007/s00220-016-2673-0]. #link("https://arxiv.org/abs/1510.03414v2")[arXiv:1510.03414v2].]
#bibitem([3])[Dominique Bakry and Michel Émery. Diffusions hypercontractives. #emph[Séminaire de Probabilités XIX], Lecture Notes in Mathematics 1123, Springer, 1985, pp.~177--206. #link("https://www.numdam.org/item/SPS_1985__19__177_0/")[Original article in the NUMDAM archive].]
#bibitem([4])[Ali Bereyhi, Ralf R. Müller, and Hermann Schulz-Baldes. Statistical mechanics of MAP estimation: General replica ansatz. Preprint, 2016. #link("https://arxiv.org/abs/1612.01980v1")[arXiv:1612.01980v1].]
#bibitem([5])[Bhaswar B. Bhattacharya and Subhabrata Sen. High temperature asymptotics of orthogonal mean-field spin glasses. #emph[Journal of Statistical Physics], 162(1):63--80, 2016. #link("https://doi.org/10.1007/s10955-015-1406-7")[doi:10.1007/s10955-015-1406-7]. #link("https://arxiv.org/abs/1507.05067v2")[arXiv:1507.05067v2].]
#bibitem([6])[Erwin Bolthausen and Alain-Sol Sznitman. On Ruelle's probability cascades and an abstract cavity method. #emph[Communications in Mathematical Physics], 197(2):247--276, 1998. #link("https://doi.org/10.1007/s002200050450")[doi:10.1007/s002200050450].]
#bibitem([7])[Hong-Bin Chen. Free energy in spin glass models with conventional order. #emph[Journal of Statistical Physics], 191:49, 2024. #link("https://doi.org/10.1007/s10955-024-03266-z")[doi:10.1007/s10955-024-03266-z]. #link("https://arxiv.org/abs/2401.10223v2")[arXiv:2401.10223v2].]
#bibitem([8])[Wei-Kuo Chen, Dmitry Panchenko, and Eliran Subag. Generalized TAP free energy. #emph[Communications on Pure and Applied Mathematics], 76(7):1329--1415, 2023. #link("https://doi.org/10.1002/cpa.22040")[doi:10.1002/cpa.22040]. #link("https://arxiv.org/abs/1812.05066v3")[arXiv:1812.05066v3].]
#bibitem([9])[R. Cherrier, David S. Dean, and Alexandre Lefèvre. Role of the interaction matrix in mean-field spin glass models. #emph[Physical Review E], 67:046112, 2003. #link("https://doi.org/10.1103/PhysRevE.67.046112")[doi:10.1103/PhysRevE.67.046112]. #link("https://arxiv.org/abs/cond-mat/0211695v1")[arXiv:cond-mat/0211695v1].]
#bibitem([10])[Kenneth R. Davidson and Stanisław J. Szarek. Local operator theory, random matrices and Banach spaces. In W. B. Johnson and J. Lindenstrauss, editors, #emph[Handbook of the Geometry of Banach Spaces], volume 1, pages 317--366. Elsevier Science, 2001. #link("https://doi.org/10.1016/S1874-5849(01)80010-3")[doi:10.1016/S1874-5849(01)80010-3]. #link("https://case.edu/artsci/math/szarek/TeX/DavSzaHB.pdf")[Author preprint].]
#bibitem([11])[Zhou Fan, Theodor Misiakiewicz, Leda Wang, and Garrett G. Wen. Dynamical mean-field limit and replica-symmetric free energy for the orthogonally-invariant SK model. Preprint, 2026. #link("https://arxiv.org/abs/2607.10102v2")[arXiv:2607.10102v2].]
#bibitem([12])[Zhou Fan and Yihong Wu. The replica-symmetric free energy for Ising spin glasses with orthogonally invariant couplings. #emph[Probability Theory and Related Fields], 190:1--77, 2024. #link("https://doi.org/10.1007/s00440-024-01309-w")[doi:10.1007/s00440-024-01309-w]. #link("https://arxiv.org/abs/2105.02797v3")[arXiv:2105.02797v3].]
#bibitem([13])[Stefano Ghirlanda and Francesco Guerra. General properties of overlap probability distributions in disordered spin systems. Towards Parisi ultrametricity. #emph[Journal of Physics A: Mathematical and General], 31(46):9149--9155, 1998. #link("https://doi.org/10.1088/0305-4470/31/46/006")[doi:10.1088/0305-4470/31/46/006]. #link("https://arxiv.org/abs/cond-mat/9807333v1")[arXiv:cond-mat/9807333v1].]
#bibitem([14])[Mikhail Gromov and Vitali D. Milman. A topological application of the isoperimetric inequality. #emph[American Journal of Mathematics], 105(4):843--854, 1983. #link("https://doi.org/10.2307/2374298")[doi:10.2307/2374298].]
#bibitem([15])[Francesco Guerra. Broken replica symmetry bounds in the mean field spin glass model. #emph[Communications in Mathematical Physics], 233(1):1--12, 2003. #link("https://doi.org/10.1007/s00220-002-0773-5")[doi:10.1007/s00220-002-0773-5]. #link("https://arxiv.org/abs/cond-mat/0205123v1")[arXiv:cond-mat/0205123v1].]
#bibitem([16])[Alice Guionnet and Mylène Maïda. A Fourier view on the $R$-transform and related asymptotics of spherical integrals. #emph[Journal of Functional Analysis], 222(2):435--490, 2005. #link("https://doi.org/10.1016/j.jfa.2004.09.015")[doi:10.1016/j.jfa.2004.09.015]. #link("https://arxiv.org/abs/math/0406121v3")[arXiv:math/0406121v3].]
#bibitem([17])[Fu-Hsuan Ho. A concavity theorem for the Parisi PDE. Preprint, 2026. #link("https://arxiv.org/abs/2606.15432v1")[arXiv:2606.15432v1].]
#bibitem([18])[V. A. Marchenko and L. A. Pastur. Distribution of eigenvalues for some sets of random matrices. #emph[Mathematics of the USSR-Sbornik], 1(4):457--483, 1967. #link("https://doi.org/10.1070/SM1967v001n04ABEH001994")[doi:10.1070/SM1967v001n04ABEH001994]. #link("https://www.mathnet.ru/eng/sm4101")[English article in Math-Net.Ru].]
#bibitem([19])[Enzo Marinari, Giorgio Parisi, and Felix Ritort. Replica field theory for deterministic models. II. A non-random spin glass with glassy behaviour. #emph[Journal of Physics A: Mathematical and General], 27(23):7647--7668, 1994. #link("https://doi.org/10.1088/0305-4470/27/23/011")[doi:10.1088/0305-4470/27/23/011]. #link("https://arxiv.org/abs/cond-mat/9406074v1")[arXiv:cond-mat/9406074v1].]
#bibitem([20])[Marc Mézard and Giorgio Parisi. #link("https://www.marcmezard.fr/wp-content/uploads/2019/01/91_MP_JDPI.pdf")[Replica field theory for random manifolds]. #emph[Journal de Physique I], 1(6):809--836, 1991.]
#bibitem([21])[M. Müller and S. Pankov. Mean-field theory for the three-dimensional Coulomb glass. #emph[Physical Review B], 75:144201, 2007. #link("https://doi.org/10.1103/PhysRevB.75.144201")[doi:10.1103/PhysRevB.75.144201]. #link("https://users.ictp.it/~markusm/Papers/EG_PRB.pdf")[Author-hosted published article].]
#bibitem([22])[OpenAI. The free energy of the Ising random perceptron. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-free-energy-of-the-Ising-random-perceptron-September-24-2026/The-free-energy-of-the-Ising-random-perceptron-September-24-2026.pdf")[OAI:The-free-energy-of-the-Ising-random-perceptron-September-24-2026], 2026.]
#bibitem([23])[Dmitry Panchenko. The Parisi ultrametricity conjecture. #emph[Annals of Mathematics (2)], 177(1):383--393, 2013. #link("https://doi.org/10.4007/annals.2013.177.1.8")[doi:10.4007/annals.2013.177.1.8]. #link("https://arxiv.org/abs/1112.1003v2")[arXiv:1112.1003v2].]
#bibitem([24])[Dmitry Panchenko. The free energy in a multi-species Sherrington--Kirkpatrick model. #emph[Annals of Probability], 43(6):3494--3513, 2015. #link("https://doi.org/10.1214/14-AOP967")[doi:10.1214/14-AOP967]. #link("https://arxiv.org/abs/1310.6679v2")[arXiv:1310.6679v2].]
#bibitem([25])[G. Parisi, #link("https://doi.org/10.1103/PhysRevLett.43.1754")[Infinite number of order parameters for spin-glasses], #emph[Physical Review Letters] #strong[43] (1979), 1754--1756.]
#bibitem([26])[David Ruelle. A mathematical reformulation of Derrida's REM and GREM. #emph[Communications in Mathematical Physics], 108(2):225--239, 1987. #link("https://doi.org/10.1007/BF01210613")[doi:10.1007/BF01210613].]
#bibitem([27])[David Sherrington and Scott Kirkpatrick. Solvable model of a spin-glass. #emph[Physical Review Letters], 35(26):1792--1796, 1975. #link("https://doi.org/10.1103/PhysRevLett.35.1792")[doi:10.1103/PhysRevLett.35.1792].]
#bibitem([28])[Michel Talagrand. The Parisi formula. #emph[Annals of Mathematics (2)], 163(1):221--263, 2006. #link("https://doi.org/10.4007/annals.2006.163.221")[doi:10.4007/annals.2006.163.221].]


