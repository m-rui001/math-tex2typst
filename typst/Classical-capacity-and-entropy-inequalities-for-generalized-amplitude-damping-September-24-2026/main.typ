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

#align(center)[#text(size: 16pt, weight: "bold")[Classical capacity and entropy inequalities \
for generalized amplitude damping]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Amplitude damping models a qubit that loses an excitation to its surroundings. At nonzero stationary excited-state population, transitions in both directions are possible; generalized amplitude damping describes this relaxation together with the decay of coherence. We determine how much classical information can be transmitted through repeated, independent uses of this channel when a sender may encode each message into an arbitrary state of the entire input block. We also determine how its one-shot and regularized classical capacities behave when it is used in parallel with an arbitrary finite-dimensional partner channel.

This permission is essential. Although a channel acts independently at each site, an input signal can be entangled across sites, and the receiver can measure the outputs collectively. The pure-signal coding theorem of Hausladen, Jozsa, Schumacher, Westmoreland, and Wootters [8] established the role of collective decoding. The mixed-signal coding theorems of Holevo and Schumacher–Westmoreland [10,16], applied to arbitrary input blocks, express the unassisted classical capacity as a regularization of the Holevo information over arbitrarily long blocks. Optimizing a single use gives an achievable rate, but does not by itself rule out an advantage from entangled signals. General Holevo additivity fails [7], so removing regularization requires an argument specific to the channel.

For ordinary amplitude damping, Bennett, Shor, Smolin, and Thapliyal [2] preprint, Section III B, Eq. (89) described the one-parameter optimization over two equiprobable pure signals with opposite phases. Giovannetti and Fazio [6] Section III A, Eqs. (42)–(43) explicitly derived the optimized one-use expression and its attaining ensemble. Leditzky, Kaur, Datta, and Wilde [15] identified its unrestricted classical capacity as an open problem in their 2018 study of approximate additivity. The geometry of two-signal qubit optimizers was developed by Cortese [4] Section 7.1 and Berry [3]. Hou and Fang [11] characterized the generalized channel’s one-use Holevo optimum and evaluated the resulting scalar optimization numerically. Khatri, Sharma, and Wilde [12] Section VI placed that characterization alongside upper bounds on the unrestricted capacity. More recently, Fang [5] Theorem 1 derived a close converse bound throughout the generalized family; that bound leaves a gap from the one-use value in general.

Tang, Zhu, Bai, and Wang [18] Corollary 5.1, Lemma 5.2, and Theorem 5.5 established Holevo and classical-capacity additivity with arbitrary finite-dimensional partners for qubit channels admitting a pure output, including ordinary amplitude damping. Their triangular block entropy inequality [18] Theorem 4.2 is the zero-block estimate recalled below. At positive damping and strictly interior thermal occupation, the generalized channel has no pure output, so that channel criterion does not apply. We extend the triangular estimate to the thermal block structure by a convex mixture that preserves its scalar entropy term. Both zero-block factorizations in this mixture have the same scalar contribution; entropy concavity therefore preserves the lower bound needed for the thermal channel.

Some parameter regimes already have exact capacity formulas from broader additivity theorems. King’s theorem for unital qubit channels [13] applies at stationary occupation $1 \/ 2$, and Shor’s entanglement-breaking theorem [17] applies in the corresponding region of the generalized family; see [12] Section VI for that specialization. Those theorems permit an arbitrary partner channel. The entropy argument below covers every parameter pair. Its rectangular form also gives additivity of one-shot Holevo capacity and minimum output entropy with every finite-dimensional partner, and regularization gives additivity of unassisted classical capacity for the same pair.

=== 1.1 Definitions and result <definitions-and-result>

All vector spaces are finite dimensional, and a star denotes the adjoint. Write $cal(B) \( cal(H) \)$ for the algebra of linear operators on a complex Hilbert space $cal(H)$. For a positive semidefinite matrix, not necessarily normalized, write

$ cal(S) \( P \) = - "Tr" \( P ln P \) \, #h(2em) 0 ln 0 = 0 . $

Thus $cal(S)$ is entropy in nats on states. Write

$ H \( q_1 \, dots.h \, q_m \) = - sum_i q_i ln q_i \, #h(2em) h \( q \) = - q ln q - \( 1 - q \) ln \( 1 - q \) $

for the entropy of a probability vector and the binary entropy, respectively. The determinant entropy function is

#[#set math.equation(numbering: n => "(1.1)")
 $ g \( u \) = h #h(-0.16667em) (frac(1 + sqrt(1 - 4 u), 2)) \, #h(2em) 0 lt.eq u lt.eq 1 / 4 . $ <eq:g>]

A two-by-two state of determinant $u$ has entropy $g \( u \)$, by its characteristic polynomial.

For $gamma \, nu in \[ 0 \, 1 \]$, define the generalized amplitude-damping channel by

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(A)_(gamma \, nu) mat(delim: "(", 1 - q, z; overline(z), q) = mat(delim: "(", 1 - t, sqrt(1 - gamma) thin z; sqrt(1 - gamma) thin overline(z), t) \, #h(2em) t = \( 1 - gamma \) q + gamma nu . $ <eq:channel>]

The input is a state when $0 lt.eq q lt.eq 1$ and $\| z \|^2 lt.eq q \( 1 - q \)$. Here $nu$ is the stationary excited-state population; this explicit convention fixes any possible ambiguity in thermal parameters.

We measure Holevo information and capacity in #emph[bits]:

#[#set math.equation(numbering: n => "(1.3)")
 $ chi \( cal(N) \) = frac(1, ln 2) sup_({ q_a \, rho_a }) {cal(S) #h(-0.16667em) (sum_a q_a cal(N) \( rho_a \)) - sum_a q_a cal(S) #scale(x: 120%, y: 120%)[\(] cal(N) \( rho_a \) #scale(x: 120%, y: 120%)[\)]} . $ <eq:holevo>]

The supremum runs over all finite ensembles of input states, with $q_a gt.eq 0$ and $sum_a q_a = 1$. For a tensor-power channel, the states are unrestricted on the entire input space. An $n$-use classical code assigns a state on the full input space to each of its $M_n$ equiprobable messages and uses one measurement on all $n$ outputs. The unassisted classical capacity $C \( cal(N) \)$ is the supremum of rates $R$ for which such codes have average decoding error tending to zero and $liminf_(n arrow.r oo) n^(- 1) log_2 M_n gt.eq R$. There is no preshared entanglement or feedback. The channel is memoryless, so its $n$-use action is $cal(N)^(⊗ n)$. The coding theorem gives

#[#set math.equation(numbering: n => "(1.4)")
 $ C \( cal(N) \) = sup_(n gt.eq 1) 1 / n chi \( cal(N)^(⊗ n) \) . $ <eq:regularization>]

Indeed, the mixed-signal coding theorem [10,16] applies to any fixed finite ensemble of block inputs, treating each block as one letter. It achieves rates below the ensemble’s Holevo information per physical channel use; see [10] preprint, Section 2, Eq. (5) for the finite-alphabet statement. Conversely, the Holevo bound and Fano’s inequality applied to the uniform output ensemble of any $n$-use code with average error $epsilon.alt_n$ give

$ \( 1 - epsilon.alt_n \) log_2 M_n lt.eq chi \( cal(N)^(⊗ n) \) + frac(h \( epsilon.alt_n \), ln 2) . $

The normalized asymptotic limit equals the supremum in (1.4): if $a_n = chi \( cal(N)^(⊗ n) \)$, product ensembles give $a_(m + n) gt.eq a_m + a_n$, and $0 lt.eq a_n lt.eq n log_2 d_(upright("out"))$, where $d_(upright("out"))$ is the output dimension. For fixed $k$, writing $n = q k + r$ gives $a_n gt.eq q a_k$; taking a lower limit and then the supremum over $k$ proves the assertion. This coding result supplies the operational interpretation of the entropy optimization below.

For a finite-dimensional channel, define its minimum output entropy in #emph[nats] by

#[#set math.equation(numbering: n => "(1.5)")
 $ S_min \( cal(N) \) = min_rho cal(S) #scale(x: 120%, y: 120%)[\(] cal(N) \( rho \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:min-output>]

where $rho$ ranges over all input density matrices. The minimum exists because the input state space is compact and entropy is continuous in finite dimensions.

#thm([Theorem 1.1.])[
  #emph[For all $gamma \, nu in \[ 0 \, 1 \]$ and every integer $n gt.eq 1$, 
#[#set math.equation(numbering: n => "(1.6)")
 $ chi \( cal(A)_(gamma \, nu)^(⊗ n) \) = n chi \( cal(A)_(gamma \, nu) \) = frac(n, ln 2) max_(0 lt.eq p lt.eq 1) { h \( \( 1 - gamma \) p + gamma nu \) - g \( v_(gamma \, nu) \( p \) \) } \, $ <eq:main>]

 where 
#[#set math.equation(numbering: n => "(1.7)")
 $ v_(gamma \, nu) \( p \) = gamma nu \( 1 - nu \) + gamma \( 1 - gamma \) \( p - nu \)^2 . $ <eq:v-main>]

 In particular, $C \( cal(A)_(gamma \, nu) \) = chi \( cal(A)_(gamma \, nu) \)$. If $p$ maximizes (1.6), independent products of the two equiprobable signals 
#[#set math.equation(numbering: n => "(1.8)")
 $ phi.alt_plus.minus = sqrt(1 - p) thin \| 0 chevron.r med plus.minus sqrt(p) thin \| 1 chevron.r $ <eq:pair>]

 attain the Holevo information at every block length.]
] <thm:main>

The tensor-power upper bound includes all entangled block signals; a product ensemble attains it. Equation (1.4) turns this finite-block optimum into an asymptotic reliable rate with collective decoding.

The rectangular thermal inequality developed below gives the following stronger consequence.

#thm([Corollary 1.2.])[
  (Additivity with a finite-dimensional partner).  #emph[Let $gamma \, nu in \[ 0 \, 1 \]$, put $cal(A) = cal(A)_(gamma \, nu)$, and let $cal(N) : cal(B) \( cal(H)_(upright("in")) \) arrow.r cal(B) \( cal(H)_(upright("out")) \)$ be completely positive and trace preserving, where $cal(H)_(upright("in"))$ and $cal(H)_(upright("out"))$ are nonzero finite-dimensional complex Hilbert spaces. Then 
#[#set math.equation(numbering: n => "(1.9)")
 $ chi \( cal(A) ⊗ cal(N) \) & = chi \( cal(A) \) + chi \( cal(N) \) \,\
S_min \( cal(A) ⊗ cal(N) \) & = S_min \( cal(A) \) + S_min \( cal(N) \) \,\
C \( cal(A) ⊗ cal(N) \) & = C \( cal(A) \) + C \( cal(N) \) . $ <eq:partner-holevo>]

 Here $chi$ is the unconstrained one-shot Holevo capacity in (1.3), and $C$ is the regularized unassisted classical capacity in (1.4).]
] <cor:partner-additivity>

The partner retains its full regularization: $C \( cal(N) \)$ can differ from $chi \( cal(N) \)$.

=== 1.2 Proof strategy <proof-strategy>

For a pure one-qubit input with excitation probability $p$, the output determinant is $v_(gamma \, nu) \( p \)$ and its entropy is $e \( p \) := g \( v_(gamma \, nu) \( p \) \)$. The central estimate extends this exact one-site value to every pure $n$-qubit input $psi$:

#[#set math.equation(numbering: n => "(1.10)")
 $ cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)_(gamma \, nu)^(⊗ n) \( \| psi chevron.r chevron.l psi \| \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_(j = 1)^n e \( p_j \) \, $ <eq:roadmap>]

where $p_j$ is the probability of outcome $1$ at site $j$ in the computational basis. A bound only on the unconstrained minimum output entropy would lose these populations and would not suffice for the Holevo optimization.

To prove (1.10), split the input according to its first qubit: $psi = sqrt(1 - p_1) \| 0 chevron.r ⊗ psi_0 + sqrt(p_1) \| 1 chevron.r ⊗ psi_1$. The normalized conditional vectors $psi_0 \, psi_1$ can be nonorthogonal and can remain entangled on the other sites. For the channel on those sites choose a Kraus representation $cal(N) \( P \) = sum_J L_J P L_J^(*)$. Define column $J$ of $X$ as $L_J psi_0$ and column $J$ of $Y$ as $L_J psi_1$. Their Gram products are the two branch outputs, and $X Y^(*)$ is the image of the cross operator between the branches. The thermal block inequality gives

$ cal(S) \( upright("full output") \) gt.eq e \( p_1 \) + \( 1 - p_1 \) cal(S) \( X X^(*) \) + p_1 cal(S) \( Y Y^(*) \) . $

This one-step application does not require $cal(N)$ to be a damping tensor power: its Kraus columns may have any finite rectangular shape. For a damping tensor power, convexity of $e$ combines the conditional populations into the original site populations, and iteration gives (1.10) without restricting the input vector.

The matrix proof leading to this recursion is developed in Section 2, Section 3. For a zero-block factor $M = mat(delim: "(", A, B; C, 0)$, with squared Hilbert–Schmidt masses $x = "Tr" \( A A^(*) \)$, $y = "Tr" \( B B^(*) \)$, $z = "Tr" \( C C^(*) \)$ summing to one, the entropy contribution beyond the weighted block entropies is at least $g \( y z \)$. We express the entropy deficit as an integral of log-determinant differences. Joint convexity permits simultaneous averaging over coordinate signs; this reduces the estimate to a concave scalar deficit. Zero padding preserves the result for rectangular blocks, which are required by the Kraus construction. The thermal extension uses two such factorizations whose products of corner masses agree, so the same $g$ term survives their convex mixture.

Finally, for an ensemble with mean populations $overline(p)_j$, the entropy of the ensemble-average output is at most $sum_j h \( \( 1 - gamma \) overline(p)_j + gamma nu \)$, by the diagonal-entropy bound in the computational basis and classical subadditivity. Entropy concavity and convexity of $e$ first extend (1.10) to mixed inputs. Averaging this bound and using convexity of $e$ bounds the average of the individual output entropies from below by $sum_j e \( overline(p)_j \)$. The difference gives the upper bound in 1; products of the phase pair (1.8) attain it. For an arbitrary partner, the branch outputs form an ensemble whose mean is the second output marginal. The entropy of the mean full output is at most the binary entropy of its first output population plus the entropy of that same marginal. Subtraction leaves one scalar damping objective plus at most $\( ln 2 \) chi \( cal(N) \)$. The minimum-output equality follows from the same one-step estimate, and the capacity equality follows by iterating against $cal(N)^(⊗ n)$ before regularizing. 4 proves the recursion and population convexity, 5 carries out the ensemble optimization, and 6 derives the arbitrary-partner consequences. 7 records the ordinary, unital, and endpoint formulas. 8 gives direct Hessian proofs of the scalar concavity and log-determinant convexity, providing an independent analytic route to the same zero-block estimate.

== 2 An entropy inequality with one zero block <sec:block>

Our first objective is to separate the entropy produced by the block pattern from the entropies within its three nonzero entries. The rectangular formulation is needed because a channel output and its Kraus index space can have different dimensions. The following is the case of the triangular block entropy inequality of Tang, Zhu, Bai, and Wang [18] Theorem 4.2 in which all blocks have the same rectangular shape, after permuting block rows. We give a direct proof in the form needed for the thermal extension.

#thm([Theorem 2.1.])[
  #emph[Let $A \, B \, C in bb(C)^(d times e)$, and put 
$ M = mat(delim: "(", A, B; C, 0) \, #h(2em) x = "Tr" \( A A^(*) \) \, quad y = "Tr" \( B B^(*) \) \, quad z = "Tr" \( C C^(*) \) . $

 If $x + y + z = 1$, then 
#[#set math.equation(numbering: n => "(2.1)")
 $ cal(S) \( M M^(*) \) gt.eq x cal(S) \( A A^(*) \/ x \) + y cal(S) \( B B^(*) \/ y \) + z cal(S) \( C C^(*) \/ z \) + g \( y z \) \, $ <eq:block>]

 where each term with zero weight is omitted.]
] <thm:block>

The scalar matrix $mat(delim: "(", sqrt(x), sqrt(y); sqrt(z), 0)$ has squared singular values with sum $1$ and product $y z$. The term $g \( y z \)$ is their entropy. To separate this contribution from the entropies inside the three blocks, write the entropy deficit as

$ Delta = cal(S) \( A A^(*) \) + cal(S) \( B B^(*) \) + cal(S) \( C C^(*) \) - cal(S) \( M M^(*) \) . $

Since $cal(S) \( A A^(*) \) = x cal(S) \( A A^(*) \/ x \) - x ln x$ for $x > 0$, and similarly for the other blocks, the theorem is equivalent to

$ Delta lt.eq H \( x \, y \, z \) - g \( y z \) . $

We will express $Delta$ as an integral of log-determinant differences. Joint convexity then permits averaging over coordinate signs, and homogeneous scalar concavity combines the resulting coordinates. This integral and averaging route is also used in [18] Appendix A.2–A.4.

Block norm compression provides a related perspective. King [14] Theorem 1 compared the Schatten norm of a positive two-by-two block matrix with the norm of the scalar matrix of block norms. Audenaert [1] Conjecture 1 studied the corresponding comparison for arbitrary two-row block matrices and proved several special cases. The entropy argument below allows noncommuting blocks and does not require the general norm-compression conjecture.

=== 2.1 From entropy to log determinants <from-entropy-to-log-determinants>

The direct sum of the three individual Gram matrices and the full Gram matrix have equal trace. The following identity converts their entropy difference into an integral, including when their dimensions or ranks differ.

#thm([Lemma 2.2.])[
  #emph[If $U \, V gt.eq 0$ have equal trace, with possibly different sizes, then 
#[#set math.equation(numbering: n => "(2.2)")
 $ cal(S) \( U \) - cal(S) \( V \) = integral_0^oo #scale(x: 120%, y: 120%)[\[] ln det \( I + r U \) - ln det \( I + r V \) #scale(x: 120%, y: 120%)[\]] frac(thin upright(d) r, r^2) . $ <eq:block-entropy-integral>]

 The integral converges absolutely.]
] <lem:integral>

#proof[
  Let $f \( r \)$ denote the bracket. Equal trace gives $f \( r \) = O \( r^2 \)$ at zero, while $f \( r \) = O \( ln r \)$ at infinity. Hence the integral converges absolutely and $f \( r \) \/ r$ vanishes at both endpoints. Integration by parts reduces it to $integral_0^oo f' \( r \) thin upright(d) r \/ r$. If $a_i$ and $b_j$ are the positive eigenvalues of $U$ and $V$, then
  $ frac(f' \( r \), r) = sum_i frac(a_i, r \( 1 + r a_i \)) - sum_j frac(b_j, r \( 1 + r b_j \)) . $
  A primitive of the term for $a > 0$ is $a ln #scale(x: 120%, y: 120%)[\(] r \/ \( 1 + r a \) #scale(x: 120%, y: 120%)[\)]$. In the signed sum, its lower endpoint limit is zero because the coefficients of $ln r$ cancel by equal trace. Its upper endpoint contribution is $- a ln a$. Taking their difference gives $cal(S) \( U \) - cal(S) \( V \)$. Zero eigenvalues contribute nothing. ◻
]

=== 2.2 Joint convexity by a contraction <joint-convexity-by-a-contraction>

The log-determinant function used in the averaging step is the following. Its joint convexity follows by specialization and continuity from Hiai’s trace-function theorem [9] preprint, Theorem 5.2. We give a direct proof: the contraction argument is the specialization of [18] Lemma A.1 to a two-by-two block matrix.

#thm([Lemma 2.3.])[
  #emph[For each fixed $Z in bb(C)^(N times N)$, the function 
#[#set math.equation(numbering: n => "(2.3)")
 $ G_Z \( D \, E \) = ln det \( D + Z E^(- 1) Z^(*) \) - ln det D \, #h(2em) D \, E > 0 \, $ <eq:block-G>]

 is jointly convex on pairs of positive definite Hermitian matrices.]
] <lem:logdet>

#proof[
  Set
  $ cal(D) = mat(delim: "(", D, 0; 0, E) \, #h(2em) cal(C) = mat(delim: "(", D, Z; - Z^(*), E) . $
  The block determinant identity gives
  $ det cal(C) = det E det \( D + Z E^(- 1) Z^(*) \) > 0 \, #h(2em) G_Z \( D \, E \) = ln det cal(C) - ln det cal(D) . $
  Although $cal(C)$ is not generally Hermitian, its determinant is positive and its logarithm here is the real logarithm. Along an affine line in $\( D \, E \)$, let $cal(H)$ be the derivative of $cal(D)$, which is also the derivative of $cal(C)$. The determinant derivative formula gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ G''_Z = "Tr" \( cal(D)^(- 1) cal(H) cal(D)^(- 1) cal(H) \) - "Tr" \( cal(C)^(- 1) cal(H) cal(C)^(- 1) cal(H) \) . $ <eq:alt-second>]
  At the point under consideration put
  $ L = cal(D)^(- 1 \/ 2) cal(H) cal(D)^(- 1 \/ 2) \, #h(2em) K = cal(D)^(- 1 \/ 2) \( cal(C) - cal(D) \) cal(D)^(- 1 \/ 2) . $
  Then $L = L^(*)$ and $K^(*) = - K$. Consequently $parallel \( I + K \) v parallel_2^2 = parallel v parallel_2^2 + parallel K v parallel_2^2$ for every vector $v$, and $R = \( I + K \)^(- 1)$ exists with operator norm at most one. Cyclicity of trace rewrites (2.4) as
  $ G''_Z = parallel L parallel_(upright("HS"))^2 - "Tr" \( \( R L \)^2 \) . $
  The last trace is real because both log determinants along the line are real. For any complex matrix $B$, entrywise Cauchy–Schwarz gives $\| "Tr" \( B^2 \) \| = \| sum_(i \, j) B_(i j) B_(j i) \| lt.eq parallel B parallel_(upright("HS"))^2$. Therefore
  $ "Tr" \( \( R L \)^2 \) lt.eq \| "Tr" \( \( R L \)^2 \) \| lt.eq parallel R L parallel_(upright("HS"))^2 lt.eq parallel L parallel_(upright("HS"))^2 . $
  Every second directional derivative is thus nonnegative. The positive definite domain is convex, so $G_Z$ is convex along each line segment, as required. ◻
]

=== 2.3 The scalar deficit and its homogeneity <the-scalar-deficit-and-its-homogeneity>

We next use the same convexity to control the scalar entropy deficits that sign averaging will produce. For $x \, y \, z gt.eq 0$, define

#[#set math.equation(numbering: n => "(2.5)")
 $ m & = x + y + z \, #h(2em) lambda_plus.minus = frac(m plus.minus sqrt(m^2 - 4 y z), 2) \,\
F \( x \, y \, z \) & = - x ln x - y ln y - z ln z + lambda_(+) ln lambda_(+) + lambda_(-) ln lambda_(-) . $ <eq:block-lambda>]

Here $m^2 gt.eq 4 y z$, and $lambda_plus.minus$ are nonnegative with sum $m$ and product $y z$. Thus $F$ is continuous on the nonnegative octant, with the usual convention at zero. On the probability simplex it is exactly the deficit in our target: $F \( x \, y \, z \) = H \( x \, y \, z \) - g \( y z \)$.

#thm([Lemma 2.4.])[
  #emph[The function $F$ is positively homogeneous of degree one and concave on the probability simplex. For every finite collection of nonnegative triples, 
#[#set math.equation(numbering: n => "(2.6)")
 $ sum_i F \( x_i \, y_i \, z_i \) lt.eq F #h(-0.16667em) (sum_i x_i \, sum_i y_i \, sum_i z_i) . $ <eq:block-superadditive>]

]
] <lem:scalar>

#proof[
  The nonnegative entries in the two lists $\( x \, y \, z \)$ and $\( lambda_(+) \, lambda_(-) \)$ have the same sum. Applying 4 to the corresponding diagonal matrices gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ F \( x \, y \, z \) & = integral_0^oo ln frac(\( 1 + r x \) \( 1 + r y \) \( 1 + r z \), \( 1 + r lambda_(+) \) \( 1 + r lambda_(-) \)) frac(thin upright(d) r, r^2)\
 & = integral_0^oo [ln \( 1 + r x \) - ln #h(-0.16667em) (1 + frac(r x, \( 1 + r y \) \( 1 + r z \)))] frac(thin upright(d) r, r^2) . $ <eq:scalar-deficit-integral>]
  The second equality uses $\( 1 + r lambda_(+) \) \( 1 + r lambda_(-) \) = 1 + r \( x + y + z \) + r^2 y z$; the integral is absolutely convergent by the lemma. For $x = 1$ its bracket is
  $ ln \( 1 + r \) - G_(sqrt(r)) \( 1 + r y \, 1 + r z \) . $
  By 5, this is concave in $\( y \, z \)$ for every $r > 0$. Integrating the concavity inequality shows that $F \( 1 \, dot.op \, dot.op \)$ is concave on the nonnegative quadrant.
  Under scaling of $\( x \, y \, z \)$ by a positive constant, both $lambda_plus.minus$ scale by the same constant. Their sum is $m$, so the logarithms of the scaling constant cancel in (2.5). This proves homogeneity, including scale zero by continuity. For a nonempty collection with all $x_i > 0$, set $x = sum_i x_i$. Homogeneity and the preceding concavity now give
  $ sum_i F \( x_i \, y_i \, z_i \) & = x sum_i x_i / x F \( 1 \, y_i \/ x_i \, z_i \/ x_i \)\
 & lt.eq x F #h(-0.16667em) (1 \, frac(sum_i y_i, x) \, frac(sum_i z_i, x)) = F #h(-0.16667em) (x \, sum_i y_i \, sum_i z_i) . $
  For a collection containing zero first coordinates, replace every $x_i$ by $x_i + epsilon$, apply this inequality, and let $epsilon arrow.b 0$. Continuity of $F$ gives (2.6), even when every $x_i = 0$. The empty collection gives zero on both sides. Finally, applying superadditivity to the two triples $theta a$ and $\( 1 - theta \) b$ and using homogeneity gives $F \( theta a + \( 1 - theta \) b \) gt.eq theta F \( a \) + \( 1 - theta \) F \( b \)$ for nonnegative triples $a \, b$ and $0 lt.eq theta lt.eq 1$. In particular, $F$ is concave on the probability simplex. ◻
]

=== 2.4 Sign averaging and the block estimate <sign-averaging-and-the-block-estimate>

The two convexity consequences are now in place. The Schur complement will put the matrix deficit into the form involving $G_Z$; averaging over signs will replace its matrix arguments by diagonal entries; and 6 will combine the resulting scalar deficits.

#proof[
  First suppose that all three blocks are square of size $N$, and temporarily allow arbitrary nonnegative masses $x \, y \, z$. The matrices
  $ U = A A^(*) xor B B^(*) xor C C^(*) \, #h(2em) V = M M^(*) $
  have equal trace. For $r > 0$, put $D = I + r B B^(*)$ and $E = I + r C^(*) C$. The Schur complement of $I + r C C^(*)$ in $I + r M M^(*)$ yields
  #[#set math.equation(numbering: n => "(2.8)")
   $ det \( I + r M M^(*) \) = det \( I + r C C^(*) \) det \( D + r A E^(- 1) A^(*) \) \, $ <eq:block-schur>]
  where $I - r C^(*) \( I + r C C^(*) \)^(- 1) C = \( I + r C^(*) C \)^(- 1)$. Consequently the integrand bracket in (2.2) is
  #[#set math.equation(numbering: n => "(2.9)")
   $ ln det \( I + r A A^(*) \) - G_(sqrt(r) A) \( D \, E \) . $ <eq:block-integrand>]
  Choose a singular-value decomposition $A = U_A Sigma V_A^(*)$. Replacing $\( A \, B \, C \)$ by $\( Sigma \, U_A^(*) B \, C V_A \)$ amounts to multiplying $M$ on the left and right by block-diagonal unitaries; all entropies and masses are preserved. In these coordinates write
  $ A = "diag" \( sqrt(x_1) \, dots.h \, sqrt(x_N) \) \, #h(2em) y_i = \( B B^(*) \)_(i i) \, #h(2em) z_i = \( C^(*) C \)_(i i) . $
  These entries are nonnegative and satisfy $sum_i \( x_i \, y_i \, z_i \) = \( x \, y \, z \)$. For each $epsilon in { - 1 \, 1 }^N$, let $S_epsilon = "diag" \( epsilon_1 \, dots.h \, epsilon_N \)$. Because $S_epsilon A S_epsilon = A$,
  $ G_(sqrt(r) A) \( S_epsilon D S_epsilon \, S_epsilon E S_epsilon \) = G_(sqrt(r) A) \( D \, E \) . $
  Averaging simultaneously over all signs removes the off-diagonal entries of both arguments. Joint convexity from 5 therefore gives
  $ G_(sqrt(r) A) \( D \, E \) gt.eq G_(sqrt(r) A) #scale(x: 120%, y: 120%)[\(] "diag" \( 1 + r y_i \) \, "diag" \( 1 + r z_i \) #scale(x: 120%, y: 120%)[\)] . $
  Because $G$ is subtracted in (2.9), that bracket is bounded above by
  #[#set math.equation(numbering: n => "(2.10)")
   $ & sum_i [ln \( 1 + r x_i \) - ln #h(-0.16667em) (1 + frac(r x_i, \( 1 + r y_i \) \( 1 + r z_i \)))]\
 & #h(12mm)  = sum_i ln frac(\( 1 + r x_i \) \( 1 + r y_i \) \( 1 + r z_i \), 1 + r \( x_i + y_i + z_i \) + r^2 y_i z_i) . $ <eq:block-scalar-integrands>]
  By (2.7), each summand integrates against $thin upright(d) r \/ r^2$ to $F \( x_i \, y_i \, z_i \)$, and these finitely many integrals converge absolutely. Integrating the inequality and applying 6 proves
  #[#set math.equation(numbering: n => "(2.11)")
   $ cal(S) \( A A^(*) \) + cal(S) \( B B^(*) \) + cal(S) \( C C^(*) \) - cal(S) \( M M^(*) \) lt.eq sum_i F \( x_i \, y_i \, z_i \) lt.eq F \( x \, y \, z \) . $ <eq:block-unnormalized>]
  When $x + y + z = 1$, the last expression is $H \( x \, y \, z \) - g \( y z \)$. For $x > 0$, $cal(S) \( A A^(*) \) = x cal(S) \( A A^(*) \/ x \) - x ln x$, and the same identity holds for the other two blocks. Substitution gives (2.1). If a mass vanishes, the corresponding block is zero, and its contribution is zero. Thus the proof includes every boundary case; all inverses used above are of positive definite matrices even when $A \, B \, C$ are singular.
  Finally, for $d times e$ blocks let $N = max \( d \, e \)$ and choose the coordinate isometries $J : bb(C)^d arrow.r bb(C)^N$ and $K : bb(C)^e arrow.r bb(C)^N$. Replace each block $A$ by $J A K^(*)$, and likewise for $B \, C$. The resulting square block matrix is $\( J xor J \) M \( K xor K \)^(*)$, so this operation only adds zero singular values to $M$ and to each block. All masses and entropies in (2.1) are unchanged. The square case therefore proves the rectangular case as well. ◻
]

=== 2.5 A scalar convexity fact for the channel application <a-scalar-convexity-fact-for-the-channel-application>

The scalar deficit estimate completes the zero-block theorem. The later channel argument also needs a different property of the same entropy function: its convexity as a function of the square root of the determinant. We record it separately.

#thm([Lemma 2.5.])[
  #emph[The function $s mapsto g \( s^2 \)$ is nondecreasing and convex on $\[ 0 \, 1 \/ 2 \]$. Consequently, $g$ is nondecreasing on $\[ 0 \, 1 \/ 4 \]$.]
] <lem:binary-spectrum>

#proof[
  For $0 < u < 1 \/ 4$, put
  $ t = sqrt(1 - 4 u) \, #h(2em) L = frac("atanh" t, t) \, #h(2em) "atanh" t = 1 / 2 ln frac(1 + t, 1 - t) . $
  Differentiating the definition of $g$ gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ g' \( u \) = 2 L \, #h(2em) g'' \( u \) = frac(4 L - 1 \/ u, t^2) \, #h(2em) u g'' \( u \) + 1 / 2 g' \( u \) = frac(L - 1, t^2) gt.eq 0 . $ <eq:g-derivatives>]
  The last inequality follows from $"atanh" t gt.eq t$, since $\( "atanh" t \)' = \( 1 - t^2 \)^(- 1) gt.eq 1$ and both functions vanish at zero. For $0 < s < 1 \/ 2$, these identities give
  $ frac(upright(d), upright(d) s) g \( s^2 \) = 2 s g' \( s^2 \) gt.eq 0 \, #h(2em) frac(upright(d)^2, upright(d) s^2) g \( s^2 \) = 4 (s^2 g'' \( s^2 \) + 1 / 2 g' \( s^2 \)) gt.eq 0 . $
  Continuity supplies both conclusions at the endpoints; no boundary derivatives are required. Since $u mapsto sqrt(u)$ is nondecreasing, $g \( u \) = g \( \( sqrt(u) \)^2 \)$ is nondecreasing as well. ◻
]

The function $kappa mapsto g \( kappa^2 \/ 4 \) \/ ln 2$ is the entropy–concurrence function of Wootters [19] Eq. (8). Its monotonicity and convexity are the scalar properties just proved. We use these properties, rather than any additivity statement about entanglement of formation.

== 3 A thermal block entropy inequality <sec:thermal>

The zero-block theorem does not apply directly when thermal excitation and decay both occur. We will express the resulting state as a convex mixture of two states to which it does apply, preserving the same scalar entropy term in each. We first recall two elementary entropy facts, including their proofs to fix the directions of the inequalities used below. For a state $P$,

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(S) \( P \) lt.eq H \( "diag" P \) . $ <eq:diagonal>]

Indeed, its diagonal is obtained from its eigenvalue vector by the doubly stochastic matrix of squared absolute unitary entries. Concavity of $- s ln s$, applied row by row and then summed, gives (3.1). Entropy is also concave on states:

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(S) #h(-0.16667em) (sum_i w_i P_i) gt.eq sum_i w_i cal(S) \( P_i \) . $ <eq:concavity>]

To see this, choose a basis diagonalizing the mixture, apply classical entropy concavity in that basis, and then use (3.1) on each $P_i$.

The next result is the extension needed for thermal channels.

#thm([Theorem 3.1.])[
  #emph[Let $X \, Y$ be complex matrices of the same rectangular shape with $"Tr" \( X X^(*) \) = "Tr" \( Y Y^(*) \) = 1$. Suppose $alpha \, beta \, eta \, delta gt.eq 0$ sum to one and 
#[#set math.equation(numbering: n => "(3.3)")
 $ alpha delta - beta eta = K^2 \, #h(2em) K gt.eq 0 . $ <eq:thermal-condition>]

 Set 
#[#set math.equation(numbering: n => "(3.4)")
 $ T = mat(delim: "(", alpha X X^(*) + beta Y Y^(*), K X Y^(*); K Y X^(*), eta X X^(*) + delta Y Y^(*)) \, #h(2em) U_0 = alpha + beta \, quad U_1 = eta + delta \, $ <eq:thermal-state>]

 and $u = U_0 U_1 - K^2$. Then $T$ is a state, $0 lt.eq u lt.eq 1 \/ 4$, and 
#[#set math.equation(numbering: n => "(3.5)")
 $ cal(S) \( T \) gt.eq \( alpha + eta \) cal(S) \( X X^(*) \) + \( beta + delta \) cal(S) \( Y Y^(*) \) + g \( u \) . $ <eq:thermal-bound>]

]
] <thm:thermal>

#proof[
  The coefficient identity gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ u = beta U_1 + eta U_0 . $ <eq:thermal-u>]
  It follows that $0 lt.eq u lt.eq U_0 U_1 lt.eq 1 \/ 4$.
  Suppose first that $u > 0$, so $U_0 \, U_1 > 0$. To construct the mixture, keep $X \, Y \, K$ and the row sums $U_0 \, U_1$ fixed. Writing $alpha = U_0 - beta$ and $delta = U_1 - eta$, the coefficient condition (3.3) becomes the line equation $U_1 beta + U_0 eta = u$. Its nonnegative solutions form the segment joining $\( beta \, eta \) = \( u \/ U_1 \, 0 \)$ and $\( 0 \, u \/ U_0 \)$. At either endpoint one coefficient vanishes, permitting a zero-block Gram factorization. The fixed row sums and cross coefficient retain the same value of $u$. These endpoints and the weights expressing the original coefficients as their convex mixture are
  #[#set math.equation(numbering: n => "(3.7)")
   $ i & alpha_i & beta_i & eta_i & delta_i & w_i\
1 & K^2 \/ U_1 & u \/ U_1 & 0 & U_1 & beta U_1 \/ u\
2 & U_0 & 0 & u \/ U_0 & K^2 \/ U_0 & eta U_0 \/ u $ <eq:thermal-table>]
  Both coefficient sets are nonnegative and have the original row sums $U_0 \, U_1$, since $K^2 + u = U_0 U_1$. Each therefore sums to one and satisfies $alpha_i delta_i = K^2$. Moreover, $w_1 + w_2 = 1$ by (3.6), and
  $ sum_i w_i beta_i = beta \, #h(2em) sum_i w_i eta_i = eta . $
  The fixed row sums then recover $alpha$ and $delta$ as well.
  Let $T_i$ denote (3.4) with the $i$th coefficient set. Both $T_i$ have cross block $K X Y^(*)$, so $T = w_1 T_1 + w_2 T_2$. They have Gram factorizations
  #[#set math.equation(numbering: n => "(3.8)")
   $ M_1 & = mat(delim: "(", sqrt(alpha_1) X, sqrt(beta_1) Y; sqrt(delta_1) Y, 0) \,\
M_2 & = mat(delim: "(", sqrt(alpha_2) X, 0; sqrt(delta_2) Y, sqrt(eta_2) X) \, #h(2em) T_i = M_i M_i^(*) . $ <eq:thermal-factors>]
  In particular, $T_i$ and $T$ are positive semidefinite of trace one. Apply 3 to $M_1$ and to $M_2$ after swapping its two block rows. The swap is unitary on the output space and preserves entropy. The respective products of the off-corner block masses are
  $ beta_1 delta_1 = u \, #h(2em) eta_2 alpha_2 = u . $
  Thus #emph[the same] scalar term occurs in both inequalities:
  $ cal(S) \( T_i \) gt.eq \( alpha_i + eta_i \) cal(S) \( X X^(*) \) + \( beta_i + delta_i \) cal(S) \( Y Y^(*) \) + g \( u \) . $
  Concavity (3.2) and recovery of the original coefficients now give (3.5). Zero weights in (3.7) do not change this argument.
  It remains to consider $u = 0$. If a row sum vanishes, all its nonnegative coefficients vanish and $K = 0$. The other diagonal block is a convex mixture of $X X^(*)$ and $Y Y^(*)$, so positivity, normalization, and (3.5) follow from (3.2) and $g \( 0 \) = 0$. If both row sums are positive, (3.6) forces $beta = eta = 0$, and $K = sqrt(alpha delta)$. Then the first factorization in (3.8), with coefficients $\( alpha \, 0 \, 0 \, delta \)$, applies directly. It proves positivity and reduces (3.5) to 3 with a zero block mass. These cases exhaust the possibilities. ◻
]

#prodef([Remark 3.2.])[
  No orthogonality condition on $X \, Y$ and no commutativity of their Gram products is used. The bound is sharp when $X = Y$: in that case $T = mat(delim: "(", U_0, K; K, U_1) ⊗ X X^(*)$, whose entropy is $g \( u \) + cal(S) \( X X^(*) \)$.
] <rem:thermal-sharp>

== 4 From the thermal inequality to channel outputs <sec:output>

We first turn the thermal matrix inequality into an entropy bound for $cal(A)_(gamma \, nu) ⊗ cal(N)$, with any finite-dimensional partner channel $cal(N)$. Its two matrices will encode the outputs of conditional input branches; a common Kraus index will preserve their cross operator. We then iterate this bound for repeated damping uses, retaining the input population at every site.

=== 4.1 The one-qubit entropy and its convexity <the-one-qubit-entropy-and-its-convexity>

Fix $gamma \, nu in \[ 0 \, 1 \]$ and abbreviate $cal(A) = cal(A)_(gamma \, nu)$. Put

#[#set math.equation(numbering: n => "(4.1)")
 $ k = sqrt(1 - gamma) \, #h(2em) b = gamma \( 1 - nu \) \, #h(2em) c = gamma nu \, #h(2em) a = 1 - c \, #h(2em) d = 1 - b . $ <eq:coefficients>]

Then

#[#set math.equation(numbering: n => "(4.2)")
 $ a + c = b + d = 1 \, #h(2em) a d - b c = k^2 . $ <eq:coefficient-identities>]

The population transition matrix is $mat(delim: "(", a, b; c, d)$ and the coherence multiplier is $k$. A Kraus representation is

#[#set math.equation(numbering: n => "(4.3)")
 $ L_0 & = sqrt(1 - nu) thin "diag" \( 1 \, k \) \, & L_1 & = sqrt(b) thin \| 0 chevron.r chevron.l 1 \| \,\
L_2 & = sqrt(nu) thin "diag" \( k \, 1 \) \, & L_3 & = sqrt(c) thin \| 1 chevron.r chevron.l 0 \| . $ <eq:kraus>]

Direct multiplication gives $cal(A) \( P \) = sum_(i = 0)^3 L_i P L_i^(*)$ and $sum_(i = 0)^3 L_i^(*) L_i = I$, including all parameter endpoints.

For $p in \[ 0 \, 1 \]$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ v \( p \) & = \( a \( 1 - p \) + b p \) \( c \( 1 - p \) + d p \) - k^2 p \( 1 - p \)\
 & = a c \( 1 - p \)^2 + b d p^2 + 2 b c p \( 1 - p \) \, #h(2em) e \( p \) = g \( v \( p \) \) . $ <eq:single-entropy>]

Any pure qubit state of excitation probability $p$ has coherence modulus $sqrt(p \( 1 - p \))$. Hence $v \( p \)$ is its output determinant and $e \( p \)$ its output entropy. In particular, $v \( p \) in \[ 0 \, 1 \/ 4 \]$. Expanding (4.1) in (4.4) gives (1.7). If $gamma > 0$ and $0 < nu < 1$, then $v \( p \) gt.eq gamma nu \( 1 - nu \) > 0$ for every $p$. Every pure input therefore has a positive definite output. A mixed input is a convex combination of pure inputs, so its output is positive definite as well. Thus these thermal parameters lie outside the pure-output class treated by Tang, Zhu, Bai, and Wang [18] Corollary 5.1 and Lemma 5.2.

#thm([Lemma 4.1.])[
  #emph[For every $gamma \, nu in \[ 0 \, 1 \]$, the function $p mapsto g \( gamma nu \( 1 - nu \) + gamma \( 1 - gamma \) \( p - nu \)^2 \)$ is convex on $\[ 0 \, 1 \]$.]
] <lem:e-convex>

#proof[
  The completed-square formula (1.7) gives
  $ sqrt(v \( p \)) = ∥vec(sqrt(gamma nu \( 1 - nu \)), sqrt(gamma \( 1 - gamma \)) thin \( p - nu \))∥_2 . $
  This is a convex function of $p$, being the norm of an affine vector, even when either coefficient vanishes. By 7, $s mapsto g \( s^2 \)$ is nondecreasing and convex on $\[ 0 \, 1 \/ 2 \]$, which contains the range of $sqrt(v)$. A nondecreasing convex function of a convex function is convex: apply the inner convexity, then monotonicity, then the outer convexity. This proves the assertion, with no parameter exclusions. ◻
]

=== 4.2 A single damping use with an arbitrary partner <a-single-damping-use-with-an-arbitrary-partner>

The following estimate is the channel form of 8. Its scalar term is the pure one-qubit entropy $e \( p \)$, and the remaining terms are the output entropies of the two conditional branches.

#thm([Lemma 4.2.])[
  #emph[Let $gamma \, nu in \[ 0 \, 1 \]$, put $cal(A) = cal(A)_(gamma \, nu)$ and $e \( p \) = g \( v_(gamma \, nu) \( p \) \)$, and let $cal(N) : cal(B) \( cal(H)_(upright("in")) \) arrow.r cal(B) \( cal(H)_(upright("out")) \)$ be completely positive and trace preserving on nonzero finite-dimensional complex Hilbert spaces. For a unit vector $psi in bb(C)^2 ⊗ cal(H)_(upright("in"))$, write 
$ psi = sqrt(1 - p) thin \| 0 chevron.r ⊗ psi_0 + sqrt(p) thin \| 1 chevron.r ⊗ psi_1 \, #h(2em) 0 lt.eq p lt.eq 1 \, $

 where each $psi_i$ is a unit vector and a zero-weight branch may be chosen arbitrarily. Then 
#[#set math.equation(numbering: n => "(4.5)")
 $ cal(S) #scale(x: 120%, y: 120%)[\(] \( cal(A) ⊗ cal(N) \) \( \| psi chevron.r chevron.l psi \| \) #scale(x: 120%, y: 120%)[\)] & gt.eq e \( p \) + \( 1 - p \) cal(S) #scale(x: 120%, y: 120%)[\(] cal(N) \( \| psi_0 chevron.r chevron.l psi_0 \| \) #scale(x: 120%, y: 120%)[\)]\
 & quad + p cal(S) #scale(x: 120%, y: 120%)[\(] cal(N) \( \| psi_1 chevron.r chevron.l psi_1 \| \) #scale(x: 120%, y: 120%)[\)] . $ <eq:partner-branch>]

]
] <lem:partner-branch>

#proof[
  Choose a finite Kraus representation
  $ cal(N) \( P \) = sum_(ell = 1)^r V_ell P V_ell^(*) \, #h(2em) sum_(ell = 1)^r V_ell^(*) V_ell = I . $
  Here $V_ell : cal(H)_(upright("in")) arrow.r cal(H)_(upright("out"))$. Complete positivity in finite dimensions gives such a finite family; the last identity is trace preservation. If $d_(upright("out")) = dim cal(H)_(upright("out"))$, form $X \, Y in bb(C)^(d_(upright("out")) times r)$ by giving their $ell$th columns the values $V_ell psi_0$ and $V_ell psi_1$, respectively. The common column index gives the three Gram identities and normalizations
  #[#set math.equation(numbering: n => "(4.6)")
   $ X X^(*) & = cal(N) \( \| psi_0 chevron.r chevron.l psi_0 \| \) \, #h(2em) Y Y^(*) = cal(N) \( \| psi_1 chevron.r chevron.l psi_1 \| \) \,\
X Y^(*) & = cal(N) \( \| psi_0 chevron.r chevron.l psi_1 \| \) \, #h(2em) "Tr" \( X X^(*) \) = "Tr" \( Y Y^(*) \) = 1 . $ <eq:partner-grams>]
  No equality between $d_(upright("out"))$, $r$, and the input dimension is required, and the branch vectors need not be orthogonal.
  Set $x = 1 - p$ and $y = p$, and use $a \, b \, c \, d \, k$ from (4.1). Applying the two channels to the branch decomposition gives
  $ \( cal(A) ⊗ cal(N) \) \( \| psi chevron.r chevron.l psi \| \) = mat(delim: "(", a x X X^(*) + b y Y Y^(*), k sqrt(x y) thin X Y^(*); k sqrt(x y) thin Y X^(*), c x X X^(*) + d y Y Y^(*)) . $
  This is (3.4) with
  #[#set math.equation(numbering: n => "(4.7)")
   $ alpha = a x \, quad beta = b y \, quad eta = c x \, quad delta = d y \, #h(2em) K = k sqrt(x y) . $ <eq:channel-substitution>]
  The coefficients are nonnegative, sum to one, and satisfy $alpha delta - beta eta = \( a d - b c \) x y = K^2$. Their column sums are $alpha + eta = x$ and $beta + delta = y$. Moreover, their scalar parameter is
  $ u = \( a x + b y \) \( c x + d y \) - k^2 x y = v \( p \) . $
  Thus 8 applies to the arbitrary rectangular matrices $X \, Y$ and gives (4.5). The theorem includes $u = 0$, and the zero-weight branch terms vanish, so this argument includes $p = 0 \, 1$ and every boundary value of $gamma \, nu$. ◻
]

=== 4.3 Iteration over a block <iteration-over-a-block>

We now take the partner to be the channel on the remaining qubits. Convexity of $e$ will combine the conditional populations at each later site into that site’s original population.

#thm([Proposition 4.3.])[
  #emph[For every $gamma \, nu in \[ 0 \, 1 \]$, put $cal(A) = cal(A)_(gamma \, nu)$ and $e \( p \) = g \( v_(gamma \, nu) \( p \) \)$. For every integer $n gt.eq 1$ and every unit vector $psi$ on $n$ qubits, let $p_j$ be the probability of outcome $1$ at site $j$ in the computational basis. Then 
#[#set math.equation(numbering: n => "(4.8)")
 $ cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)^(⊗ n) \( \| psi chevron.r chevron.l psi \| \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_(j = 1)^n e \( p_j \) . $ <eq:pure-bound>]

]
] <prop:pure-bound>

#proof[
  For $n = 1$ there is equality by (4.4). Suppose the claim holds for $n - 1$ and write an arbitrary pure input as
  #[#set math.equation(numbering: n => "(4.9)")
   $ psi = sqrt(x) thin \| 0 chevron.r ⊗ psi_0 + sqrt(y) thin \| 1 chevron.r ⊗ psi_1 \, #h(2em) x = 1 - p_1 \, quad y = p_1 . $ <eq:branch-decomposition>]
  The branch vectors are normalized but need not be orthogonal. For a zero-weight branch choose any unit vector. The decomposition is valid for every input vector, and each conditional vector may be entangled across the remaining sites.
  Apply 11 with $cal(N) = cal(A)^(⊗ \( n - 1 \))$, and write $sigma_i = cal(A)^(⊗ \( n - 1 \)) \( \| psi_i chevron.r chevron.l psi_i \| \)$ for the two branch outputs. The lemma gives the explicit recursion
  #[#set math.equation(numbering: n => "(4.10)")
   $ cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)^(⊗ n) \( \| psi chevron.r chevron.l psi \| \) #scale(x: 120%, y: 120%)[\)] gt.eq e \( p_1 \) + x cal(S) \( sigma_0 \) + y cal(S) \( sigma_1 \) . $ <eq:recursion>]
  Apply the induction hypothesis to both pure branch inputs. If $p_(j \| i)$ is the excitation probability of site $j > 1$ in $psi_i$, then
  $ p_j = x p_(j \| 0) + y p_(j \| 1) . $
  This identity follows from $chevron.l 0 \| 1 chevron.r = 0$ on the first site; it does not require $psi_0 perp psi_1$. By 10,
  $ x cal(S) \( sigma_0 \) + y cal(S) \( sigma_1 \) gt.eq sum_(j = 2)^n #scale(x: 120%, y: 120%)[\(] x e \( p_(j \| 0) \) + y e \( p_(j \| 1) \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_(j = 2)^n e \( p_j \) . $
  Together with (4.10), this proves the induction step. All terms from zero-weight branches have zero coefficient, so the argument also includes $p_1 = 0 \, 1$. ◻
]

The same population bound holds for mixed inputs. This form will let us bound every signal in a Holevo ensemble directly.

#thm([Corollary 4.4.])[
  #emph[For every $gamma \, nu in \[ 0 \, 1 \]$, integer $n gt.eq 1$, and density matrix $rho$ on $\( bb(C)^2 \)^(⊗ n)$, let $p_j$ be its excitation probability at site $j$. Then 
$ cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)_(gamma \, nu)^(⊗ n) \( rho \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_(j = 1)^n g \( v_(gamma \, nu) \( p_j \) \) . $

]
] <cor:mixed-bound>

#proof[
  Take a finite pure-state decomposition $rho = sum_a q_a \| psi_a chevron.r chevron.l psi_a \|$, and let $p_(a \, j)$ be the corresponding populations. Entropy concavity, 12, and convexity from 10 give
  $ cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)^(⊗ n) \( rho \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_a q_a sum_j e \( p_(a \, j) \) gt.eq sum_j e #h(-0.16667em) (sum_a q_a p_(a \, j)) = sum_j e \( p_j \) . $
  ◻
]

== 5 The ensemble bound and its attainment <sec:holevo>

We now turn the population-dependent entropy bound into the full Holevo assertion. This step is essential: an unconstrained minimum-output-entropy bound alone would not give the result.

#proof[
  Fix any finite ensemble ${ q_a \, rho_a }$ for $n$ uses. Each $rho_a$ is an arbitrary density matrix on all $n$ input qubits and may be mixed or entangled across sites. Put
  $ p_(a \, j) = upright("excitation probability at site ") j upright(" in ") rho_a \, #h(2em) overline(p)_j = sum_a q_a p_(a \, j) . $
  The mixed-input bound in 13 and the convexity of $e$ from 10 give
  #[#set math.equation(numbering: n => "(5.1)")
   $ sum_a q_a cal(S) #scale(x: 120%, y: 120%)[\(] cal(A)^(⊗ n) \( rho_a \) #scale(x: 120%, y: 120%)[\)] gt.eq sum_(j = 1)^n sum_a q_a e \( p_(a \, j) \) gt.eq sum_(j = 1)^n e \( overline(p)_j \) . $ <eq:ensemble-lower>]
  Let $overline(sigma) = sum_a q_a cal(A)^(⊗ n) \( rho_a \)$. By (3.1), its entropy is at most the Shannon entropy of its joint computational-basis output distribution. The marginal probability of outcome $1$ at site $j$ is $t_j = \( 1 - gamma \) overline(p)_j + gamma nu$: the other channel factors are trace preserving, so the reduced output is the one-site channel applied to the reduced input. For any joint distribution, the chain rule and concavity give
  $ H \( Z_1 \, dots.h \, Z_n \) = sum_(j = 1)^n H \( Z_j divides Z_1 \, dots.h \, Z_(j - 1) \) lt.eq sum_(j = 1)^n H \( Z_j \) . $
  Here the chain rule follows by factoring each nonzero joint probability into conditional probabilities, and each average conditional entropy is at most its marginal entropy by concavity. Consequently
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(S) \( overline(sigma) \) lt.eq sum_(j = 1)^n h \( \( 1 - gamma \) overline(p)_j + gamma nu \) . $ <eq:ensemble-upper>]
  Subtracting (5.1) from (5.2) and taking the supremum over ensembles yields
  #[#set math.equation(numbering: n => "(5.3)")
   $ \( ln 2 \) chi \( cal(A)^(⊗ n) \) lt.eq n max_(0 lt.eq p lt.eq 1) { h \( \( 1 - gamma \) p + gamma nu \) - e \( p \) } . $ <eq:holevo-upper>]
  For the matching lower bound, the continuous objective attains its maximum on $\[ 0 \, 1 \]$. Choose any maximizer $p$ and use the equiprobable pair (1.8). Their individual output entropies equal $e \( p \)$; their opposite coherences cancel in the average output, which is diagonal with excited-state population $\( 1 - gamma \) p + gamma nu$. Hence this ensemble attains the right-hand one-use objective exactly for every $nu$.
  On $n$ uses take the $2^n$ products of these vectors, with equal probabilities $2^(- n)$. Each individual output and their average are tensor products. Entropy is additive on such products by their product eigenvalues, so the resulting finite ensemble attains $n$ times the one-use objective. At $p = 0$ or $1$, repeated labels can simply be merged. This attains (5.3) at every $n$. Substitution of (4.4) and (1.7) proves (1.6), and (1.4) gives the capacity statement. ◻
]

== 6 Additivity with a finite-dimensional partner <sec:partners>

The branch estimate in 11 applies to every finite-dimensional partner. We now use it to prove the three assertions of 2. For the Holevo bound, the key point is that the conditional partner outputs form an ensemble whose mean is exactly the partner marginal of the mean full output.

#proof[
  For the Holevo upper bound, it suffices to consider pure-state ensembles. Every mixed input has a finite spectral decomposition. Refining each signal into its pure components leaves the mean output unchanged and, by entropy concavity (3.2), does not increase the mean individual output entropy. Thus refinement cannot decrease Holevo information; see also Schumacher–Westmoreland [16]. The refined pure inputs may still be entangled between the two factors.
  Fix a finite ensemble ${ q_a \, \| psi_a chevron.r chevron.l psi_a \| }$ of such inputs. For each signal use the decomposition in Lemma 11, with population $p_a$ and branch vectors $psi_(a \, 0) \, psi_(a \, 1)$. Put
  $ overline(p) = sum_a q_a p_a \, #h(2em) w_(a \, 0) = q_a \( 1 - p_a \) \, #h(2em) w_(a \, 1) = q_a p_a \,\
tau_(a \, i) = cal(N) \( \| psi_(a \, i) chevron.r chevron.l psi_(a \, i) \| \) . $
  Here and below $i in { 0 \, 1 }$. The nonnegative weights $w_(a \, i)$ sum to one. If $overline(rho) = sum_a q_a \| psi_a chevron.r chevron.l psi_a \|$ and $overline(rho)_B$ is its partial trace over the first input qubit, then
  #[#set math.equation(numbering: n => "(6.1)")
   $ overline(rho)_B & = sum_(a \, i) w_(a \, i) \| psi_(a \, i) chevron.r chevron.l psi_(a \, i) \| \,\
overline(tau) := sum_(a \, i) w_(a \, i) tau_(a \, i) & = cal(N) \( overline(rho)_B \) = "Tr"_(bb(C)^2) #scale(x: 120%, y: 120%)[\(] \( cal(A) ⊗ cal(N) \) \( overline(rho) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:partner-marginal>]
  The cross terms disappear in the first identity because $chevron.l 0 \| 1 chevron.r = 0$, regardless of any overlap between the branch vectors. The last identity uses trace preservation of $cal(A)$. Thus the branch ensemble for $cal(N)$ has exactly the second marginal of the mean full output.
  Write $sigma_a = \( cal(A) ⊗ cal(N) \) \( \| psi_a chevron.r chevron.l psi_a \| \)$ and $overline(sigma) = sum_a q_a sigma_a$. The first output marginal has excited-state population $t \( overline(p) \) = \( 1 - gamma \) overline(p) + gamma nu$; here trace preservation of $cal(N)$ identifies that marginal with $cal(A)$ applied to the first input marginal. Apply the diagonal-entropy bound (3.1) in the product of the first output’s computational basis and an eigenbasis of $overline(tau)$. The resulting joint distribution has marginals $\( 1 - t \( overline(p) \) \, t \( overline(p) \) \)$ and the eigenvalue distribution of $overline(tau)$. Classical subadditivity, as proved in 5, gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ cal(S) \( overline(sigma) \) lt.eq h \( t \( overline(p) \) \) + cal(S) \( overline(tau) \) . $ <eq:partner-mean-upper>]
  On the other hand, Lemma 11 and the convexity in Lemma 10 imply
  #[#set math.equation(numbering: n => "(6.3)")
   $ sum_a q_a cal(S) \( sigma_a \) & gt.eq sum_a q_a e \( p_a \) + sum_(a \, i) w_(a \, i) cal(S) \( tau_(a \, i) \)\
 & gt.eq e \( overline(p) \) + sum_(a \, i) w_(a \, i) cal(S) \( tau_(a \, i) \) . $ <eq:partner-ensemble-lower>]
  Subtracting (6.3) from (6.2) yields
  $ cal(S) \( overline(sigma) \) - sum_a q_a cal(S) \( sigma_a \) & lt.eq h \( t \( overline(p) \) \) - e \( overline(p) \)\
 & quad + cal(S) \( overline(tau) \) - sum_(a \, i) w_(a \, i) cal(S) \( tau_(a \, i) \)\
 & lt.eq \( ln 2 \) #scale(x: 120%, y: 120%)[\(] chi \( cal(A) \) + chi \( cal(N) \) #scale(x: 120%, y: 120%)[\)] . $
  For the last line, the one-use case of 1 bounds the scalar term, and (1.3) bounds the Holevo information of the branch ensemble, whose mean is (6.1). Taking the supremum proves the upper bound in (1.9). For the reverse bound, take the phase-pair ensemble attaining $chi \( cal(A) \)$ and, for each $epsilon > 0$, a finite ensemble with Holevo information greater than $chi \( cal(N) \) - epsilon$. Their product ensemble has the sum of their Holevo informations, because both the mean outputs and individual outputs are tensor products. Taking the supremum proves (1.9).
  For minimum output entropy, concavity (3.2) shows that some pure input attains the minimum of any finite-dimensional channel: a pure-state decomposition cannot have every component output entropy larger than that of the mixed input. For $cal(A)$, the pure qubit calculation (4.4) therefore gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ S_min \( cal(A) \) = min_(0 lt.eq p lt.eq 1) e \( p \) = g #scale(x: 120%, y: 120%)[\(] gamma nu \( 1 - nu \) #scale(x: 120%, y: 120%)[\)] . $ <eq:minimum-output-value>]
  Indeed, the completed square in (1.7) is minimized at $p = nu$, and 7 implies that $g$ is nondecreasing. Any pure qubit state with that population attains the minimum, including at the parameter endpoints. The right-hand side of (4.5) is at least $S_min \( cal(A) \) + S_min \( cal(N) \)$. Hence the same is true of every output entropy of every pure input for $cal(A) ⊗ cal(N)$, and concavity extends the lower bound to mixed inputs. Tensoring minimizing input states for the two factors gives the reverse inequality, since entropy is additive on product states. This proves (1.9).
  Finally, a permutation of tensor factors identifies $\( cal(A) ⊗ cal(N) \)^(⊗ n)$ with $cal(A)^(⊗ n) ⊗ cal(N)^(⊗ n)$ up to input and output unitaries, which do not change $chi$. Repeated application of (1.9) gives, for every integer $n gt.eq 1$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ chi #scale(x: 120%, y: 120%)[\(] \( cal(A) ⊗ cal(N) \)^(⊗ n) #scale(x: 120%, y: 120%)[\)] = n chi \( cal(A) \) + chi \( cal(N)^(⊗ n) \) . $ <eq:partner-blocks>]
  At each step the partner is a tensor product of the remaining copies of $cal(A)$ with $cal(N)^(⊗ n)$, hence is again finite dimensional and completely positive trace preserving. Applying (1.4) to (6.5) gives
  $ C \( cal(A) ⊗ cal(N) \) = chi \( cal(A) \) + sup_(n gt.eq 1) 1 / n chi \( cal(N)^(⊗ n) \) = C \( cal(A) \) + C \( cal(N) \) \, $
  where the last equality uses $C \( cal(A) \) = chi \( cal(A) \)$ from 1. This proves (1.9). In particular, no restriction has been placed on entanglement among the inputs to the partner’s copies in (6.5). ◻
]

== 7 Ordinary damping, the unital case, and endpoints <sec:special>

The population convention makes several special cases transparent. Throughout this section, capacities and Holevo information are in bits, while $h$ and $g$ remain in nats.

Tang, Zhu, Bai, and Wang [18] Corollary 5.1 and Theorem 5.5 established the ordinary-damping capacity and its additivity with arbitrary finite-dimensional partners. The following specialization recovers their capacity formula in the present parameters.

#thm([Corollary 7.1.])[
  (Ordinary amplitude damping).  #emph[For $gamma in \[ 0 \, 1 \]$, let $cal(A)_gamma$ be the qubit channel with Kraus operators 
$ K_0 = "diag" \( 1 \, sqrt(1 - gamma) \) \, #h(2em) K_1 = sqrt(gamma) thin \| 0 chevron.r chevron.l 1 \| . $

 For every integer $n gt.eq 1$, 
$ chi \( cal(A)_gamma^(⊗ n) \) = n C \( cal(A)_gamma \) = frac(n, ln 2) max_(0 lt.eq p lt.eq 1) { h \( \( 1 - gamma \) p \) - g \( gamma \( 1 - gamma \) p^2 \) } . $

]
] <cor:ordinary>

#proof[
  The Kraus operators give (1.2) with $nu = 0$. The conclusion follows from 1 after this substitution. ◻
]

The scalar maximum and the opposite-phase attaining ensemble agree with Giovannetti–Fazio [6] Section III A, Eqs. (42)–(43), whose transmissivity is $1 - gamma$ in our convention. That one-use optimization becomes the unrestricted classical capacity through the finite-power identity.

Let $sans(X) = mat(delim: "(", 0, 1; 1, 0)$. Direct substitution in (1.2) gives

$ cal(A)_(gamma \, 1 - nu) \( rho \) = sans(X) cal(A)_(gamma \, nu) \( sans(X) rho sans(X) \) sans(X) . $

Unitary conjugations preserve the Holevo optimization, so the capacity is invariant under $nu mapsto 1 - nu$. In particular, $nu = 1$ has the ordinary-channel capacity as well, with the signal population replaced by $1 - p$.

The next formula also follows from King’s general unital-qubit theorem [13]. We recover it directly from the present scalar optimization.

#thm([Corollary 7.2.])[
  (Unital midpoint).  #emph[For every $gamma in \[ 0 \, 1 \]$, 
$ C \( cal(A)_(gamma \, 1 \/ 2) \) = 1 - frac(1, ln 2) g \( gamma \/ 4 \) = 1 - frac(1, ln 2) h #h(-0.16667em) (frac(1 + sqrt(1 - gamma), 2)) . $

 The pair $\( \| 0 chevron.r plus.minus \| 1 chevron.r \) \/ sqrt(2)$ attains the one-use Holevo information, and its independent products attain every finite-power Holevo optimum.]
] <cor:unital>

#proof[
  Write the one-use objective in nats as
  $ f \( p \) = h \( \( 1 - gamma \) p + gamma \/ 2 \) - g #scale(x: 120%, y: 120%)[\(] gamma \/ 4 + gamma \( 1 - gamma \) \( p - 1 \/ 2 \)^2 #scale(x: 120%, y: 120%)[\)] . $
  It is concave: its first term is concave, and its second term is the negative of the convex function in 10. Also $f \( 1 - p \) = f \( p \)$, using $h \( 1 - t \) = h \( t \)$. Thus $f \( 1 \/ 2 \) gt.eq \( f \( p \) + f \( 1 - p \) \) \/ 2 = f \( p \)$. Evaluating the maximum at $p = 1 \/ 2$ and using 1 proves the formulas and the attainment claim. ◻
]

At $gamma = 0$, the channel is the identity, $v_(gamma \, nu) = 0$, and the capacity is one bit per use. At $gamma = 1$, it replaces every input by $"diag" \( 1 - nu \, nu \)$, so its capacity is zero: the two terms in the objective both equal $h \( nu \)$. These conclusions include all four corners of the parameter square.

== 8 Alternative Hessian proofs <sec:alternative>

The main proof obtains scalar concavity and matrix log-determinant convexity from the same contraction argument. Here we give direct Hessian proofs of the two analytic statements. They provide an alternative route to Lemma 2.4, Lemma 2.3; the entropy integral, Schur complement, sign averaging, and rectangular embedding in 2 are unchanged.

=== 8.1 The Hessian of the scalar deficit <the-hessian-of-the-scalar-deficit>

Recall the function $F$ from (2.5). Its homogeneity follows by the scaling cancellation already proved in 6. We verify concavity directly on the probability simplex, where $F \( x \, y \, z \) = H \( x \, y \, z \) - g \( y z \)$, using the derivatives (2.12). For $0 < u < 1 \/ 4$, write $t = sqrt(1 - 4 u)$ and $L = "atanh" \( t \) \/ t$.

#proof[
  #emph[Alternative proof of 6.] In the simplex interior, set $x = 1 - y - z$ and $u = y z$. The negative Hessian of $F \( 1 - y - z \, y \, z \)$ is
  $ J = mat(delim: "(", 1 / y + 1 / x + z^2 g'' \( u \), 1 / x + g' \( u \) + u g'' \( u \); 1 / x + g' \( u \) + u g'' \( u \), 1 / z + 1 / x + y^2 g'' \( u \)) . $
  Expanding its determinant and substituting (2.12) and $x + y + z = 1$ yields
  #[#set math.equation(numbering: n => "(8.1)")
   $ det J & = frac(1, x u) + frac(y + z - 4 u, x) g'' \( u \) - 2 / x g' \( u \) - g' \( u \)^2 - 2 u g' \( u \) g'' \( u \)\
 & = frac(1 - 4 u L^2, u t^2) > 0 . $ <eq:block-scalar-determinant>]
  Indeed, for $0 < t < 1$,
  $ "atanh" t < t / sqrt(1 - t^2) \, $
  as both sides vanish at zero and their derivatives are respectively $\( 1 - t^2 \)^(- 1)$ and $\( 1 - t^2 \)^(- 3 \/ 2)$. Since $4 u = 1 - t^2$, this proves the strict inequality in (8.1). Furthermore,
  $ mat(delim: "(", y, z) J vec(y, z) = frac(y + z, x) + 4 u (u g'' \( u \) + 1 / 2 g' \( u \)) > 0 . $
  A real symmetric $2 times 2$ matrix with positive determinant has eigenvalues of the same sign; this positive quadratic form forces both to be positive. Hence $F$ is concave in the simplex interior, and continuity extends concavity to the closed simplex.
  To prove (2.6), omit zero triples and put $m_i = x_i + y_i + z_i$, $m = sum_i m_i$. For $m > 0$, homogeneity and simplex concavity give
  $ sum_i F \( x_i \, y_i \, z_i \) = m sum_i m_i / m F #h(-0.16667em) (x_i / m_i \, y_i / m_i \, z_i / m_i) lt.eq F #h(-0.16667em) (sum_i x_i \, sum_i y_i \, sum_i z_i) . $
  If $m = 0$, all terms vanish. ◻
]

=== 8.2 The Hessian of the log-determinant difference <the-hessian-of-the-log-determinant-difference>

The contraction proof avoids choosing singular-vector coordinates. The following calculation instead diagonalizes the fixed matrix and expresses the second derivative as a sum of nonnegative squares. It proves 5 directly for the same domain, including singular $Z$.

#proof[
  #emph[Alternative proof of 5.] At any point $\( D_0 \, E_0 \)$, use the fixed congruences
  $ D = D_0^(1 \/ 2) tilde(D) D_0^(1 \/ 2) \, #h(2em) E = E_0^(1 \/ 2) tilde(E) E_0^(1 \/ 2) \, #h(2em) W = D_0^(- 1 \/ 2) Z E_0^(- 1 \/ 2) . $
  The determinant factors cancel to give $G_Z \( D \, E \) = G_W \( tilde(D) \, tilde(E) \)$. These invertible linear changes preserve affine lines. Independent unitary changes in the two spaces then put $W$ in singular-value form $Y = "diag" \( v_1 \, dots.h \, v_N \)$ with $v_i gt.eq 0$. It therefore suffices to prove nonnegativity of the second derivative at $\( I \, I \)$ for this $Y$ and arbitrary Hermitian directions $P \, Q$.
  Set $R = \( I + Y Y^(*) \)^(- 1)$ and $N_0 = P - Y Q Y^(*)$. Using $\( I + s Q \)^(- 1) = I - s Q + s^2 Q^2 + O \( s^3 \)$ gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ frac(upright(d)^2, upright(d) s^2) G_Y \( I + s P \, I + s Q \)\|_(s = 0) = "Tr" #scale(x: 120%, y: 120%)[\(] P^2 + 2 R Y Q^2 Y^(*) - R N_0 R N_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:block-G-hessian>]
  For completeness, the log-determinant expansion used here is
  $ ln det \( H + s K + s^2 L_0 \) = ln det H + s "Tr" \( H^(- 1) K \) + s^2 ("Tr" \( H^(- 1) L_0 \) - 1 / 2 "Tr" \( H^(- 1) K H^(- 1) K \)) + O \( s^3 \) \, $
  for $H > 0$ and Hermitian $K \, L_0$. It follows by factoring $H^(1 \/ 2)$ and applying the scalar logarithm expansion to the eigenvalues of the resulting Hermitian increment. No commutativity is assumed.
  Write $r_i = \( 1 + v_i^2 \)^(- 1)$ and $c_i = v_i \/ \( 1 + v_i^2 \)$. Expanding the trace in (8.2) in entries gives
  $ sum_(i \, j) #scale(x: 120%, y: 120%)[\[] & \( 1 - r_i r_j \) \| P_(i j) \|^2 + { 2 \( 1 - r_i \) - \( 1 - r_i \) \( 1 - r_j \) } \| Q_(i j) \|^2\
 & #h(34mm)  + 2 c_i c_j "Re" \( P_(i j) overline(Q_(i j)) \) #scale(x: 120%, y: 120%)[\]] . $
  Since $Q$ is Hermitian, $\| Q_(i j) \|^2 = \| Q_(j i) \|^2$. Pairing the $\( i \, j \)$ and $\( j \, i \)$ terms replaces their coefficient by
  $ 1 / 2 #scale(x: 120%, y: 120%)[\[] 2 \( 1 - r_i \) + 2 \( 1 - r_j \) - 2 \( 1 - r_i \) \( 1 - r_j \) #scale(x: 120%, y: 120%)[\]] = 1 - r_i r_j . $
  This identity also holds when $i = j$. Completing the square therefore rewrites the second derivative as
  #[#set math.equation(numbering: n => "(8.3)")
   $ sum_(i \, j) [\( 1 - r_i r_j - c_i c_j \) \( \| P_(i j) \|^2 + \| Q_(i j) \|^2 \) + c_i c_j \| P_(i j) + Q_(i j) \|^2] . $ <eq:block-G-squares>]
  Every coefficient is nonnegative: $c_i c_j gt.eq 0$, and
  $ 1 - r_i r_j - c_i c_j = frac(\( v_i - v_j \)^2 + v_i v_j + v_i^2 v_j^2, \( 1 + v_i^2 \) \( 1 + v_j^2 \)) gt.eq 0 . $
  Thus the second derivative is nonnegative in every Hermitian direction at every positive definite pair. The domain is convex, so the asserted joint convexity follows along each line segment. ◻
]

#heading(level: 1)[References]
#bibitem([1])[K.~M.~R. Audenaert, "On a norm compression inequality for $2 times N$ partitioned block matrices," #emph[Linear Algebra and its Applications] #strong[428], 781--795 (2008). doi: #link("https://doi.org/10.1016/j.laa.2007.08.007")[`10.1016/j.laa.2007.08.007`].]
#bibitem([2])[C.~H. Bennett, P.~W. Shor, J.~A. Smolin, and A.~V. Thapliyal, "Entanglement-assisted capacity of a quantum channel and the reverse Shannon theorem," #emph[IEEE Transactions on Information Theory] #strong[48]\(10), 2637--2655 (2002). doi: #link("https://doi.org/10.1109/TIT.2002.802612")[`10.1109/TIT.2002.802612`]. Preprint: arXiv:#link("https://arxiv.org/abs/quant-ph/0106052v2")[quant-ph/0106052v2].]
#bibitem([3])[D.~W. Berry, "Qubit channels that achieve capacity with two states," #emph[Physical Review A] #strong[71], 032334 (2005). doi: #link("https://doi.org/10.1103/PhysRevA.71.032334")[`10.1103/PhysRevA.71.032334`].]
#bibitem([4])[J. Cortese, #emph[Relative entropy and single qubit Holevo--Schumacher--Westmoreland channel capacity], arXiv:#link("https://arxiv.org/abs/quant-ph/0207128")[quant-ph/0207128] (2002).]
#bibitem([5])[K. Fang, #emph[A pretty-tight converse on the classical capacity of generalized amplitude-damping channels], arXiv:#link("https://arxiv.org/abs/2609.14621v1")[2609.14621v1] (2026).]
#bibitem([6])[V. Giovannetti and R. Fazio, "Information-capacity description of spin-chain correlations," #emph[Physical Review A] #strong[71], 032314 (2005). doi: #link("https://doi.org/10.1103/PhysRevA.71.032314")[`10.1103/PhysRevA.71.032314`].]
#bibitem([7])[M.~B. Hastings, "Superadditivity of communication capacity using entangled inputs," #emph[Nature Physics] #strong[5], 255--257 (2009). doi: #link("https://doi.org/10.1038/nphys1224")[`10.1038/nphys1224`].]
#bibitem([8])[P. Hausladen, R. Jozsa, B. Schumacher, M. Westmoreland, and W.~K. Wootters, "Classical information capacity of a quantum channel," #emph[Physical Review A] #strong[54], 1869--1876 (1996). doi: #link("https://doi.org/10.1103/PhysRevA.54.1869")[`10.1103/PhysRevA.54.1869`].]
#bibitem([9])[F. Hiai, "Concavity of certain matrix trace and norm functions.~II," #emph[Linear Algebra and its Applications] #strong[496], 193--220 (2016). doi: #link("https://doi.org/10.1016/j.laa.2015.12.032")[`10.1016/j.laa.2015.12.032`]. Preprint: arXiv:#link("https://arxiv.org/abs/1507.00853v3")[1507.00853v3].]
#bibitem([10])[A.~S. Holevo, "The capacity of the quantum channel with general signal states," #emph[IEEE Transactions on Information Theory] #strong[44]\(1), 269--273 (1998). doi: #link("https://doi.org/10.1109/18.651037")[`10.1109/18.651037`]. Preprint: arXiv:#link("https://arxiv.org/abs/quant-ph/9611023v1")[quant-ph/9611023v1].]
#bibitem([11])[L.-Z. Hou and M.-F. Fang, "The Holevo capacity of a generalized amplitude-damping channel," #emph[Chinese Physics] #strong[16]\(7), 1843--1847 (2007). doi: #link("https://doi.org/10.1088/1009-1963/16/7/006")[`10.1088/1009-1963/16/7/006`].]
#bibitem([12])[S. Khatri, K. Sharma, and M.~M. Wilde, "Information-theoretic aspects of the generalized amplitude-damping channel," #emph[Physical Review A] #strong[102], 012401 (2020). doi: #link("https://doi.org/10.1103/PhysRevA.102.012401")[`10.1103/PhysRevA.102.012401`].]
#bibitem([13])[C. King, "Additivity for unital qubit channels," #emph[Journal of Mathematical Physics] #strong[43], 4641--4653 (2002). doi: #link("https://doi.org/10.1063/1.1500791")[`10.1063/1.1500791`].]
#bibitem([14])[C. King, "Inequalities for trace norms of $2 times 2$ block matrices," #emph[Communications in Mathematical Physics] #strong[242], 531--545 (2003). doi: #link("https://doi.org/10.1007/s00220-003-0955-9")[`10.1007/s00220-003-0955-9`].]
#bibitem([15])[F. Leditzky, E. Kaur, N. Datta, and M.~M. Wilde, "Approaches for approximate additivity of the Holevo information of quantum channels," #emph[Physical Review A] #strong[97], 012332 (2018). doi: #link("https://doi.org/10.1103/PhysRevA.97.012332")[`10.1103/PhysRevA.97.012332`].]
#bibitem([16])[B. Schumacher and M.~D. Westmoreland, "Sending classical information via noisy quantum channels," #emph[Physical Review A] #strong[56]\(1), 131--138 (1997). doi: #link("https://doi.org/10.1103/PhysRevA.56.131")[`10.1103/PhysRevA.56.131`].]
#bibitem([17])[P.~W. Shor, "Additivity of the classical capacity of entanglement-breaking quantum channels," #emph[Journal of Mathematical Physics] #strong[43], 4334--4340 (2002). doi: #link("https://doi.org/10.1063/1.1498000")[`10.1063/1.1498000`].]
#bibitem([18])[Z. Tang, C. Zhu, G. Bai, and X. Wang, #emph[Classical capacity and entanglement cost of the amplitude damping channel], arXiv:#link("https://arxiv.org/abs/2609.28592v1")[2609.28592v1] (2026).]
#bibitem([19])[W.~K. Wootters, "Entanglement of formation of an arbitrary state of two qubits," #emph[Physical Review Letters] #strong[80], 2245--2248 (1998). doi: #link("https://doi.org/10.1103/PhysRevLett.80.2245")[`10.1103/PhysRevLett.80.2245`].]


