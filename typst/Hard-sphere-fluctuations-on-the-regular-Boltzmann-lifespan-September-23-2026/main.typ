#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Hard-sphere-fluctuations-on-the-regular-Boltzmann-lifespan-September-23-2026]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction and statement of the theorem <sec:introduction>

The Boltzmann equation describes the leading empirical distribution of a dilute gas. The next-order question asks whether the small correlations created by deterministic collisions produce Gaussian fluctuations, and which equation governs their covariance. We prove that the finite-dimensional fluctuation law persists throughout an assumed regular kinetic interval, without an equilibrium or small-data hypothesis.

Lanford’s derivation of the Boltzmann equation established the kinetic limit for short times #cite(label("Lanford1975")). The next-order problem has a separate history. Van Beijeren, Lanford, Lebowitz and Spohn derived short-time equilibrium fluctuation covariances governed by the linearized Boltzmann equation #cite(label("vanBeijerenLanfordLebowitzSpohn1980")), and Spohn established the nonequilibrium second-moment limit #cite(label("Spohn1981")). These covariance results identify the candidate fluctuation dynamics; a Gaussian limit also requires control of higher-order correlations.

Pulvirenti and Simonella developed short-time quantitative correlation-error estimates and a cumulant-type reorganization of collision histories #cite(label("PulvirentiSimonella2017")). Bodineau, Gallagher, Saint-Raymond and Simonella developed the short-time nonequilibrium fluctuation theory #cite(label("BGSS2020")) #cite(label("BGSS2023")), including convergence of the fluctuation process. Their connected-cumulant analysis identifies the Gaussian collision noise and uses exact microscopic centering. Their direct cluster expansion on physical trajectories #cite(label("BGSSCluster2022")) provides a complementary representation of the short-time statistical dynamics. At equilibrium, they obtained long-time covariance convergence #cite(label("BGSSCorrelations2023")) and then the full Gaussian fluctuation limit #cite(label("BGSS2024")), using the invariant measure. The BGSS fluctuation theorems concern a spatially periodic gas; the present setting is the whole space, with integrable initial data. Our conclusion extends the time interval away from equilibrium but concerns finite-dimensional laws, rather than process convergence.

Deng, Hani and Ma extended the hard-sphere kinetic derivation through each prescribed interval on which the regular Boltzmann solution exists with the required bounds #cite(label("DHM2025")). They also identify long-time nonequilibrium fluctuations as a further application of their approach #cite(label("DHM2025")) Section 1.4.3. The theorem below establishes the finite-dimensional nonequilibrium fluctuation statement on that regular kinetic lifespan. Its proof retains their layered collision histories and supplies the sharper connected estimates and centering transfer required at the fluctuation scale. It does not assert global regularity for the Boltzmann equation or a path-space tightness theorem.

=== 1.1 Kinetic equation and normalization <kinetic-equation-and-normalization>

Phase space is $bb(R)_x^3 times bb(R)_v^3$, and $z = \( x \, v \)$. For $beta > 0$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ parallel g parallel_(upright("Bol") \, beta) := sum_(a in bb(Z)^3) sup_(\| x - a \| lt.eq 1\
v in bb(R)^3) e^(beta \| v \|^2) \| g \( x \, v \) \| . $ <eq:bol-norm>]

The collision convention is

#[#set math.equation(numbering: n => "(1.2)")
 $ B \( v - v_(*) \, omega \) & = \[ \( v - v_(*) \) dot.op omega \]_(+) \, &  & omega in bb(S)^2 \,\
v' & = v - \[ \( v - v_(*) \) dot.op omega \] omega \, & v'_(*) & = v_(*) + \[ \( v - v_(*) \) dot.op omega \] omega . $ <eq:collision-kernel>]

Here $upright(d) omega$ is the usual unnormalized surface measure, and $\[ a \]_(+) = max { a \, 0 }$. With all densities in the collision integral evaluated at the same $x$, set

#[#set math.equation(numbering: n => "(1.3)")
 $ \( partial_t + v dot.op nabla_x \) f = Q \( f \, f \) \, #h(2em) Q \( f \, f \) = integral_(bb(R)^3 times bb(S)^2) B \( v - v_(*) \, omega \) \( f' f'_(*) - f f_(*) \) thin upright(d) v_(*) thin upright(d) omega . $ <eq:boltzmann>]

#prodef([Assumption 1.1.])[
  The function $f_0 gt.eq 0$ is a smooth probability density and, for some $beta > 0$,
  #[#set math.equation(numbering: n => "(1.4)")
   $ parallel f_0 parallel_(upright("Bol") \, 2 beta) + parallel nabla_x f_0 parallel_(upright("Bol") \, 2 beta) < oo . $ <eq:initial-bol-bounds>]
  There is a nonnegative classical solution $f$ of (1.3) with initial datum $f_0$ on a prescribed finite interval $\[ 0 \, T \]$, $T > 0$, such that
  #[#set math.equation(numbering: n => "(1.5)")
   $ M := sup_(0 lt.eq t lt.eq T) sup_(x \, v) e^(2 beta \| v \|^2) f \( t \, x \, v \) < oo . $ <eq:kinetic-gaussian>]
] <ass:kinetic>

=== 1.2 Microscopic law and fluctuation field <microscopic-law-and-fluctuation-field>

For sphere diameter $epsilon.alt > 0$, let $mu = epsilon.alt^(- 2)$, and write

$ cal(D)_N^epsilon.alt = { \( z_1 \, dots.h \, z_N \) : \| x_i - x_j \| > epsilon.alt upright(" for ") i eq.not j } . $

The initial probability law, including $N = 0$, is

#[#set math.equation(numbering: n => "(1.6)")
 $ bb(P)_epsilon.alt \( N \, upright(d) Z_N \) = cal(Z)_epsilon.alt^(- 1) frac(mu^N, N !) upright(bold(1))_(cal(D)_N^epsilon.alt) \( Z_N \) product_(i = 1)^N f_0 \( z_i \) thin upright(d) z_i . $ <eq:grand-canonical>]

The normalizing constant satisfies $1 lt.eq cal(Z)_epsilon.alt lt.eq e^mu$. Conditional on the initial configuration, particles move by free flight and deterministic elastic hard-sphere collisions. The almost-everywhere definition of that flow is given by #cite(label("DHM2025")) Proposition 1.2; its exceptional set has zero probability under the initial law. There is no random collision rule or resampling.

For real $phi.alt in C_c^oo \( bb(R)^6 \)$, set

#[#set math.equation(numbering: n => "(1.7)")
 $ pi_t^epsilon.alt \( phi.alt \) = mu^(- 1) sum_(i = 1)^N phi.alt \( z_i \( t \) \) \, #h(2em) zeta_t^epsilon.alt \( phi.alt \) = sqrt(mu) thin \[ pi_t^epsilon.alt \( phi.alt \) - bb(E)_epsilon.alt pi_t^epsilon.alt \( phi.alt \) \] . $ <eq:empirical-fluctuation>]

The expectation in (1.7) is exact. A law-of-large-numbers approximation to it need not be accurate on this scale; even the first excluded-volume correction at time zero can survive after multiplication by $sqrt(mu)$.

For an unmarked test $phi.alt$, use the pair difference

$ Delta phi.alt = phi.alt \( x \, v' \) + phi.alt \( x \, v'_(*) \) - phi.alt \( x \, v \) - phi.alt \( x \, v_(*) \) . $

The limiting weak drift and collision covariance are

#[#set math.equation(numbering: n => "(1.8)")
 $ \( A_t phi.alt \) \( x \, v \) & = v dot.op nabla_x phi.alt \( x \, v \) + integral_(bb(R)^3 times bb(S)^2) B \( v - v_(*) \, omega \) f_t \( x \, v_(*) \) Delta phi.alt thin upright(d) v_(*) thin upright(d) omega \,\
C_t \( phi.alt \, psi \) & = 1 / 2 integral_(bb(R)^3 times bb(R)^3 times bb(R)^3 times bb(S)^2) B \( v - v_(*) \, omega \) f_t \( x \, v \) f_t \( x \, v_(*) \) Delta phi.alt thin Delta psi thin upright(d) x thin upright(d) v thin upright(d) v_(*) thin upright(d) omega . $ <eq:drift>]

#thm([Theorem 1.2.])[
  (Finite-dimensional fluctuation limit).  #emph[Under 1, the centered Gaussian generalized field $zeta$ with weak equation 
#[#set math.equation(numbering: n => "(1.9)")
 $ upright(d) zeta_t \( phi.alt \) = zeta_t \( A_t phi.alt \) thin upright(d) t + upright(d) W_t \( phi.alt \) $ <eq:fluctuating-equation>]

 is well defined by its backward mild form on a scale of tests with small Gaussian growth. Its initial field is independent of $W$, and 
#[#set math.equation(numbering: n => "(1.10)")
 $ bb(E) \[ zeta_0 \( phi.alt \) zeta_0 \( psi \) \] & = integral_(bb(R)^6) f_0 phi.alt psi thin upright(d) z \,\
bb(E) \[ W_t \( phi.alt \) W_s \( psi \) \] & = integral_0^(t and s) C_r \( phi.alt \, psi \) thin upright(d) r . $ <eq:initial-covariance>]

 The Gaussian noise $W$ has independent increments. For every integer $m gt.eq 1$, fixed times $t_1 \, dots.h \, t_m in \[ 0 \, T \]$, and real tests $phi.alt_1 \, dots.h \, phi.alt_m in C_c^oo \( bb(R)^6 \)$, 
#[#set math.equation(numbering: n => "(1.11)")
 $ #scale(x: 120%, y: 120%)[\(] zeta_(t_1)^epsilon.alt \( phi.alt_1 \) \, dots.h \, zeta_(t_m)^epsilon.alt \( phi.alt_m \) #scale(x: 120%, y: 120%)[\)] quad arrow.r.double quad #scale(x: 120%, y: 120%)[\(] zeta_(t_1) \( phi.alt_1 \) \, dots.h \, zeta_(t_m) \( phi.alt_m \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( epsilon.alt arrow.b 0 \) . $ <eq:main-convergence>]

]
] <thm:main>

The initial covariance in (1.10) has no subtraction of $\( integral f_0 phi.alt \) \( integral f_0 psi \)$: the particle count in (1.6) is random. The equivalent backward covariance formula and the precise construction of the Gaussian field are given in 7.

There is also a concrete distinction between microscopic and kinetic centering. Put $𝜚_0 \( x \) = integral f_0 \( x \, v \) thin upright(d) v$. The initial ensemble calculation in 3 gives

$ lim_(epsilon.alt arrow.r 0) sqrt(mu) (bb(E) pi_0^epsilon.alt \( phi.alt \) - integral f_0 phi.alt) = - frac(4 pi, 3) integral f_0 \( x \, v \) phi.alt \( x \, v \) 𝜚_0 \( x \) thin upright(d) x thin upright(d) v . $

Thus exclusion changes the mean at exactly the fluctuation scale, even though its contribution to the limiting initial covariance vanishes. Centering by the Boltzmann density alone would generally introduce a nonzero deterministic shift already at time zero.

=== 1.3 Proof structure and new estimates <proof-structure-and-new-estimates>

The proof retains the layered collision-history framework of #cite(label("DHM2025")); its operational inputs and their hypotheses are stated in 10. The connected graph bounds also use the classical tree-graph partition scheme of Penrose #cite(label("Penrose1967")); we include its proof for the initial ensemble. The fluctuation argument needs two improvements beyond coarse decorrelation.

First, factorial cumulant measures on $h$ observed particle histories must be controlled at the sharp scale $mu^(1 - h)$. We obtain an exact component expansion that keeps finitely many observation records and preserves factorial cancellation. After coarse bounds remove histories of large complexity, chronological relative translations give one $epsilon.alt^2$ factor for every merger. Initial excluded-volume links gain an additional $epsilon.alt$, while a first redundant contact disappears on each finite tree. A summable bound, uniform in the permitted history sizes, justifies the passage from these finite histories to the full expansion. This is 22.

The surviving signed trees determine both one-particle means and the connected two-particle contribution. Adding the diagonal term produces (1.8). Higher ordinary cumulants vanish after central-limit scaling. A mark that accumulates observations along each particle reduces every fixed multitime linear combination to this same calculation. These steps first establish the Gaussian limit on the restarted, truncated dynamics, without using a comparison with the true flow.

Second, the modified dynamics must approximate the true process strongly enough to transfer its exact centering. We prove $bb(P)_epsilon.alt \( upright("any discrepancy before ") T \) = O \( epsilon.alt^(1 + eta) \)$ for some $eta > 0$, in 32. A primitive pair of close collisions has a direct space–time–velocity gain. In the complementary case a fixed number of improved local estimates dominates the free-component costs. Joint energy and causal time-order bounds sum the ordinary collision parameters without a logarithmic loss at every vertex. These integration arguments apply to constrained histories without assigning an independent Maxwellian to each cut variable.

Finally, this discrepancy estimate and fixed moments of $N \/ mu$ transfer the limit and its exact centering to (1.7). A probability of discrepancy tending only to zero would suffice for uncentered weak comparison, but not for this comparison of expectations on the fluctuation scale.

2 treats the initial ensemble and constructs the Gaussian target. 3 states the layered-history definitions and imported estimates, and 4 proves the marked component expansion. 5 derives the sharp connected bounds and tree limits, and 6 identifies the covariance and proves Gaussian convergence for the truncated dynamics. 7 then proves the discrepancy bound. 8 transfers the exact centering and completes the theorem for the true hard-sphere dynamics.

== 2 The initial ensemble and the Gaussian target <sec:initial-target>

This section proves two facts independently of the dynamical expansion: the initial fluctuation theorem, and well-posedness of the Gaussian law appearing in 2. It also records the initial correlation bounds used in the expansion.

=== 2.1 Initial factorial measures and connected graphs <initial-factorial-measures-and-connected-graphs>

Let $F_(h \, 0)^epsilon.alt$ be the density of the ordered factorial measure divided by $mu^h$. Thus, for a nonnegative measurable $Phi$,

#[#set math.equation(numbering: n => "(2.1)")
 $ integral F_(h \, 0)^epsilon.alt \( Z_h \) Phi \( Z_h \) thin upright(d) Z_h = mu^(- h) bb(E) sum_(i_1 \, dots.h \, i_h upright(" distinct")) Phi \( z_(i_1) \, dots.h \, z_(i_h) \) . $ <eq:initial-factorial-definition>]

Write $\[ h \] = { 1 \, dots.h \, h }$, let $cal(P) \( V \)$ denote the set of partitions of a finite set $V$, and set $Z_B = \( z_j \)_(j in B)$. The normalized factorial cumulant densities, also called connected densities, $c_(h \, 0)^epsilon.alt$ are defined by

#[#set math.equation(numbering: n => "(2.2)")
 $ F_(h \, 0)^epsilon.alt \( Z_h \) = sum_(pi in cal(P) \( \[ h \] \)) product_(B in pi) c_(\| B \| \, 0)^epsilon.alt \( Z_B \) . $ <eq:initial-partition-definition>]

In particular, $g_0 = c_(1 \, 0)^epsilon.alt = F_(1 \, 0)^epsilon.alt$. Set

$ 𝜚_0 \( x \) = integral_(bb(R)^3) f_0 \( x \, v \) thin upright(d) v \, #h(2em) b_epsilon.alt = frac(4 pi, 3) parallel 𝜚_0 parallel_oo epsilon.alt^3 \, #h(2em) d_epsilon.alt = mu b_epsilon.alt . $

The initial assumptions imply that $𝜚_0$ and its spatial gradient are bounded, and $d_epsilon.alt = O \( epsilon.alt \)$. We write $\( N \)_p = N \( N - 1 \) dots.h.c \( N - p + 1 \)$ for the falling factorial, with $\( N \)_0 = 1$.

#thm([Proposition 2.1.])[
  (Initial ensemble).  #emph[For all sufficiently small $epsilon.alt$, the following assertions hold.]
  + #emph[The factorial densities satisfy 
#[#set math.equation(numbering: n => "(2.3)")
 $ 0 lt.eq F_(h \, 0)^epsilon.alt lt.eq product_(j = 1)^h f_0 \( z_j \) \, #h(2em) \( 1 - C epsilon.alt \) f_0 lt.eq g_0 lt.eq f_0 . $ <eq:initial-factorial-upper>]

 Consequently $parallel g_0 - f_0 parallel_(upright("Bol") \, 2 beta) = O \( epsilon.alt \)$ and, for every fixed integer $p gt.eq 1$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E) \( N \)_p lt.eq mu^p \, #h(2em) sup_(0 < epsilon.alt lt.eq epsilon.alt_0) bb(E) \( N \/ mu \)^p < oo . $ <eq:initial-N-moments>]

]
  + #emph[With $upsilon = 1 \/ 81$, for every $h gt.eq 2$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ \| c_(h \, 0)^epsilon.alt \( Z_h \) \| lt.eq \( C h \)^(C h) product_(j = 1)^h f_0 \( z_j \) sum_(cal(T) upright(" tree on ") \[ h \]) product_({ i \, j } in cal(T)) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(\| x_i - x_j \| lt.eq epsilon.alt) + epsilon.alt^upsilon #scale(x: 120%, y: 120%)[\)] . $ <eq:initial-coarse-links>]

 Here $C$ and the upper bound on $epsilon.alt$ are independent of $h$. For fixed $h gt.eq 2$ and $D > 0$ there is $C_(D \, h) < oo$ such that 
#[#set math.equation(numbering: n => "(2.6)")
 $ \| c_(h \, 0)^epsilon.alt \( Z_h \) \| lt.eq C_(D \, h) product_(j = 1)^h f_0 \( z_j \) sum_(cal(T) upright(" tree on ") \[ h \]) product_({ i \, j } in cal(T)) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(\| x_i - x_j \| lt.eq C_(D \, h) epsilon.alt) + epsilon.alt^D #scale(x: 120%, y: 120%)[\)] . $ <eq:initial-sharp-links>]

 Moreover, 
#[#set math.equation(numbering: n => "(2.7)")
 $ parallel c_(h \, 0)^epsilon.alt parallel_(L^1) lt.eq C_h epsilon.alt^(3 \( h - 1 \)) #h(2em) \( h gt.eq 2 \) . $ <eq:initial-integrated-cumulants>]

]
  + #emph[For every finite list of bounded real tests, the exact-centered initial fluctuations converge jointly to a centered Gaussian vector with covariance $integral f_0 phi.alt psi$. For a smooth compactly supported real test $phi.alt$, one also has 
#[#set math.equation(numbering: n => "(2.8)")
 $ lim_(epsilon.alt arrow.r 0) sqrt(mu) (bb(E) pi_0^epsilon.alt \( phi.alt \) - integral f_0 phi.alt) = - frac(4 pi, 3) integral_(bb(R)^6) f_0 \( x \, v \) phi.alt \( x \, v \) 𝜚_0 \( x \) thin upright(d) x thin upright(d) v . $ <eq:initial-centering-shift>]

]
] <prop:initial>

#proof[
  For fixed $Z_h$, let $cal(Z)_epsilon.alt \[ Z_h \]$ be the partition function of the remaining particles with their usual mutual exclusion and with the additional restriction that they avoid all the balls $B \( x_j \, epsilon.alt \)$. Directly from the ensemble,
  #[#set math.equation(numbering: n => "(2.9)")
   $ F_(h \, 0)^epsilon.alt \( Z_h \) = upright(bold(1))_(cal(D)_h^epsilon.alt) \( Z_h \) product_(j = 1)^h f_0 \( z_j \) frac(cal(Z)_epsilon.alt \[ Z_h \], cal(Z)_epsilon.alt) . $ <eq:initial-insertion>]
  The ratio is at most one, proving the factorial upper bound. When $h = 1$, it is the probability under the original ensemble that the ball $B \( x_1 \, epsilon.alt \)$ contains no particle center. The factorial upper bound with one particle and the union bound show that this probability is at least $1 - mu b_epsilon.alt$. This proves (2.3). Integrating the factorial upper bound gives the first part of (2.4); expressing $N^p$ as a finite positive linear combination of $\( N \)_j$, $j lt.eq p$, gives its second part.
  We give the connected expansion and its convergence explicitly. Write $chi_(i j) = upright(bold(1))_(\| x_i - x_j \| lt.eq epsilon.alt)$ and set
  $ cal(U)_1 = 1 \, #h(2em) cal(U)_n \( Z_n \) = sum_(H upright(" connected on ") \[ n \]) product_({ i \, j } in H) \( - chi_(i j) \) quad \( n gt.eq 2 \) . $
  The Penrose partition scheme #cite(label("Penrose1967")), in the form proved in #cite(label("BGSS2023")) Proposition 2.3.3, gives the following tree bound.
  #[#set math.equation(numbering: n => "(2.10)")
   $ \| cal(U)_n \( Z_n \) \| lt.eq sum_(cal(T) upright(" tree on ") \[ n \]) product_({ i \, j } in cal(T)) chi_(i j) . $ <eq:initial-tree-inequality>]
  To see this, root a connected labelled graph at vertex $1$, assign its graph-distance levels, and choose the least-labelled neighbor in the preceding level as the parent of each other vertex. For a fixed resulting tree $cal(T)$, the graphs that give this tree form the interval $cal(T) subset H subset R \( cal(T) \)$. Here $R \( cal(T) \)$ contains all same-level edges and every edge from a vertex to a preceding-level vertex whose label is at least the label of its chosen parent. No other edge is permitted. Summing this interval yields
  $ product_(e in cal(T)) \( - chi_e \) product_(e in R \( cal(T) \) \\ cal(T)) \( 1 - chi_e \) . $
  These intervals partition all connected graphs, and every factor in the second product lies in $\[ 0 \, 1 \]$, proving (2.10).
  Integrating a tree successively from its leaves, and keeping one free vertex, gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ integral f_0^(⊗ n) \| cal(U)_n \| lt.eq n^(n - 2) b_epsilon.alt^(n - 1) #h(2em) \( n gt.eq 2 \) . $ <eq:initial-unrooted-tree-integral>]
  For a bounded measurable activity multiplier $a$, the formal connected-graph identity is therefore an absolutely convergent identity whenever $e mu b_epsilon.alt parallel a parallel_oo < 1$:
  #[#set math.equation(numbering: n => "(2.12)")
   $ log cal(Z)_epsilon.alt \[ a \] = sum_(n gt.eq 1) frac(mu^n, n !) integral cal(U)_n \( Z_n \) product_(j = 1)^n f_0 \( z_j \) a \( z_j \) thin upright(d) Z_n . $ <eq:initial-log-partition>]
  For completeness, first multiply the activity by a complex scalar $w$. The identity follows coefficient by coefficient near $w = 0$ from the finite exponential formula for connected components. The tree bound makes the right side absolutely convergent on the stated disk, so exponentiation and analytic continuation prove the identity there. This also fixes the branch of the logarithm. The same bounds justify every fixed number of derivatives in bounded source multipliers.
  Apply (2.12) to $a = 1 + u$. The logarithm of $bb(E) product_i \( 1 + u \( z_i \) \)$ has coefficients $mu^h c_(h \, 0)^epsilon.alt \/ h !$ by (2.2). Differentiating the absolutely convergent series gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ c_(h \, 0)^epsilon.alt \( Z_h \) = product_(j = 1)^h f_0 \( z_j \) sum_(n gt.eq 0) frac(mu^n, n !) integral f_0^(⊗ n) \( Z_(h + 1 : h + n) \) cal(U)_(h + n) \( Z_(h + n) \) thin upright(d) Z_(h + 1 : h + n) . $ <eq:initial-rooted-mayer>]
  We next give bounds uniform in the number $h$ of fixed roots. From any tree on the $h + n$ vertices, delete $h - 1$ edges so that each remaining component contains exactly one fixed root. Such a deletion is obtained by repeatedly cutting an edge on a path between two roots. Dropping the deleted constraints and integrating the auxiliary leaves then costs at most $b_epsilon.alt^n$. For $n gt.eq 1$,
  #[#set math.equation(numbering: n => "(2.14)")
   $ frac(\( h + n \)^(h + n - 2), n !) lt.eq \( e h \)^h e^(2 n) . $ <eq:initial-rooted-count>]
  Indeed, $n ! gt.eq \( n \/ e \)^n$, $\( 1 + h \/ n \)^n lt.eq e^h$, and $\( h + n \)^h lt.eq h^h e^n$. The $n = 0$ count is also bounded by $\( C h \)^(C h)$. It follows that (2.13) is absolutely convergent for $epsilon.alt lt.eq epsilon.alt_0$, with this $epsilon.alt_0$ independent of $h$.
  Let $q$ be the number of connected components of the graph on the fixed roots with edges $\| x_i - x_j \| lt.eq epsilon.alt$. If $q gt.eq 2$, every contributing full tree must attach each such component to an auxiliary vertex. An auxiliary vertex can be adjacent to at most $27$ different root components: choose one adjacent root from each; their mutual distances exceed $epsilon.alt$, and their disjoint balls of radius $epsilon.alt \/ 2$ lie in a ball of radius $3 epsilon.alt \/ 2$. Thus a contributing tree with $n$ auxiliary vertices has $q lt.eq 27 n$. Using (2.14) and $d_epsilon.alt = O \( epsilon.alt \)$, we obtain
  $ frac(\| c_(h \, 0)^epsilon.alt \( Z_h \) \|, product_j f_0 \( z_j \)) lt.eq \( C h \)^(C h) epsilon.alt^(q \/ 27) lt.eq \( C h \)^(C h) epsilon.alt^(\( q - 1 \) \/ 81) #h(2em) \( q gt.eq 2 \) \, $
  with the quotient interpreted through (2.13) when some $f_0 \( z_j \) = 0$. For $q = 1$ the same argument without the restriction on $n$ gives $\( C h \)^(C h)$. There exists a tree of the roots using edges inside each of the $q$ components and exactly $q - 1$ edges between components. Its product in (2.5) is at least $epsilon.alt^(\( q - 1 \) \/ 81)$. This proves the coarse link estimate.
  For fixed $h \, D$, truncate (2.13) at an integer $n_0$ with $n_0 + 1 gt.eq D \( h - 1 \)$. Its tail is bounded by
  $ C_(D \, h) epsilon.alt^(D \( h - 1 \)) product_j f_0 \( z_j \) . $
  In any contributing term with $n lt.eq n_0$, all fixed roots are connected by paths of at most $h + n_0 - 1$ links of length at most $epsilon.alt$. Thus their diameter is at most $\( h + n_0 \) epsilon.alt$. On that set the tree sum in (2.6) is at least one when $C_(D \, h)$ is chosen large enough; everywhere it is at least $epsilon.alt^(D \( h - 1 \))$. This proves (2.6). Integrating all roots in (2.13) and using (2.11) instead gives
  $ parallel c_(h \, 0)^epsilon.alt parallel_1 lt.eq b_epsilon.alt^(h - 1) sum_(n gt.eq 0) frac(\( h + n \)^(h + n - 2), n !) d_epsilon.alt^n lt.eq C_h epsilon.alt^(3 \( h - 1 \)) \, $
  as asserted.
  For a real random variable $X$ with exponential moments near the origin, write
  $ kappa_k \( X \) = frac(upright(d)^k, upright(d) u^k) log bb(E) e^(u X)\|_(u = 0) \, #h(2em) k gt.eq 1 \, $
  for its ordinary cumulants. To prove the initial central limit theorem, let $phi.alt$ be bounded and real and put $S_phi.alt = sum_i phi.alt \( z_i \)$. Substitute $a \( z \) = e^(u phi.alt \( z \))$ into (2.12) and differentiate $k$ times at $u = 0$. The resulting ordinary cumulant is
  $ kappa_k \( S_phi.alt \) = sum_(n gt.eq 1) frac(mu^n, n !) integral f_0^(⊗ n) cal(U)_n (sum_(j = 1)^n phi.alt \( z_j \))^k . $
  For each fixed $k$, (2.11) gives
  #[#set math.equation(numbering: n => "(2.15)")
   $ kappa_k \( S_phi.alt \) = mu integral f_0 phi.alt^k + O_(k \, phi.alt) \( mu epsilon.alt \) . $ <eq:initial-ordinary-cumulants>]
  In fact the absolute error is bounded by $mu parallel phi.alt parallel_oo^k sum_(n gt.eq 2) n^(n + k - 2) d_epsilon.alt^(n - 1) \/ n !$, which is $O_(k \, phi.alt) \( mu epsilon.alt \)$. After exact centering and division by $sqrt(mu)$, the second cumulant tends to $integral f_0 phi.alt^2$ and every higher cumulant tends to zero. The moment–cumulant identity gives every Gaussian moment. To see directly that this implies scalar convergence, compare the characteristic functions of the normalized variable and the Gaussian with variance $sigma^2 = integral f_0 phi.alt^2$, using their Taylor polynomials of degree $2 n - 1$. After taking $limsup_(epsilon.alt arrow.r 0)$, the sum of their two remainder bounds is at most $2 \| u \|^(2 n) sigma^(2 n) \/ \( 2^n n ! \)$, which tends to zero for each real $u$. Applying scalar convergence to each linear combination of the tests gives joint convergence. This argument also includes zero variance.
  Finally, the $n = 1$ auxiliary term of (2.13) with $h = 1$ gives, uniformly in $z$,
  $ g_0 \( z \) = f_0 \( z \) [1 - mu integral_(\| x - x_(*) \| lt.eq epsilon.alt) 𝜚_0 \( x_(*) \) thin upright(d) x_(*) + O \( epsilon.alt^2 \)] . $
  The bounded gradient of $𝜚_0$ implies
  $ integral_(\| x - x_(*) \| lt.eq epsilon.alt) 𝜚_0 \( x_(*) \) thin upright(d) x_(*) = frac(4 pi, 3) epsilon.alt^3 𝜚_0 \( x \) + O \( epsilon.alt^4 \) . $
  Since $sqrt(mu) = epsilon.alt^(- 1)$, integration against $phi.alt$ proves (2.8). ◻
]

#prodef([Remark 2.2.])[
  The shift in (2.8) is generally nonzero. The exact microscopic centering in 2 is therefore essential even at the initial time. On the other hand, (2.7) gives $mu parallel c_(2 \, 0)^epsilon.alt parallel_1 = O \( epsilon.alt \)$, so the limiting initial covariance has only the same-particle contribution, $integral f_0 phi.alt psi$.
]

=== 2.2 Velocity moments and the backward propagator <velocity-moments-and-the-backward-propagator>

Write $M = sup_(t lt.eq T \, x \, v) e^(2 beta \| v \|^2) f_t \( x \, v \)$. We first record the global integrability needed for the noise form; it does not follow from a spatially uniform bound alone.

#thm([Lemma 2.3.])[
  (Global weighted integrability).  #emph[For every $0 < q < 2 beta$, 
#[#set math.equation(numbering: n => "(2.16)")
 $ sup_(0 lt.eq t lt.eq T) integral_(bb(R)^6) f_t \( x \, v \) e^(q \| v \|^2) thin upright(d) x thin upright(d) v < oo . $ <eq:target-velocity-moments>]

]
] <lem:target-moments>

#proof[
  Let $Q^(+)$ denote the positive gain part of $Q$, and define $P_t g = Q^(+) \( g \, f_t \)$, keeping the second factor fixed. Write $sans(T)_t g \( x \, v \) = g \( x - t v \, v \)$ for density transport, and
  $ \( cal(V) g \)_t = integral_0^t sans(T)_(t - s) P_s g_s thin upright(d) s . $
  Positivity and the transport Duhamel formula imply
  #[#set math.equation(numbering: n => "(2.17)")
   $ f_t lt.eq sum_(j = 0)^(n - 1) \( cal(V)^j sans(T)_dot.op f_0 \)_t + \( cal(V)^n f \)_t . $ <eq:gain-series-majorant>]
  We remove the remainder without presupposing spatial integrability. On the Gaussian decay spaces $Y_a = { g : parallel g parallel_(Y_a) = sup e^(a \| v \|^2) \| g \( x \, v \) \| < oo }$, energy conservation at a collision gives, for $0 < b < a lt.eq 2 beta$,
  $ \| P_t g \( x \, v \) \| lt.eq C M parallel g parallel_(Y_a) \( 1 + \| v \| \) e^(- a \| v \|^2) \, #h(2em) parallel P_t g parallel_(Y_b) lt.eq C M #scale(x: 120%, y: 120%)[\(] 1 + \( a - b \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] parallel g parallel_(Y_a) . $
  Constants are uniform when $b$ is bounded away from zero. Distribute the exponent interval from $beta$ to $beta \/ 2$ equally among the $n$ factors in the remainder. Transport preserves these norms and the time simplex has volume $T^n \/ n !$, so
  $ sup_(t lt.eq T) parallel \( cal(V)^n f \)_t parallel_(Y_(beta \/ 2)) lt.eq M frac(\( C T \)^n, n !) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(2 n \/ beta) #scale(x: 120%, y: 120%)[\)]^n arrow.r 0 . $
  Thus $f$ is bounded pointwise by the full positive gain series.
  Let $X_q = L^1 \( e^(q \| v \|^2) upright(d) x upright(d) v \)$. The pre/postcollision substitution, followed by energy conservation and the bound on $f_t$, gives
  $ parallel P_t g parallel_(X_q) lt.eq C M integral \| g \( x \, v \) \| \( 1 + \| v \| \) e^(q \| v \|^2) thin upright(d) x thin upright(d) v lt.eq C M #scale(x: 120%, y: 120%)[\(] 1 + delta^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] parallel g parallel_(X_(q + delta)) \, $
  uniformly for exponents in a compact subinterval of $\( 0 \, 2 beta \)$. For example, in the first inequality use $e^(q \| v' \|^2) lt.eq e^(q \| v \|^2 + q \| v_(*) \|^2)$ and integrate the second factor against its Gaussian bound. The initial Bol norm implies $f_0 in X_(q_0)$ for every $q_0 < 2 beta$. Given $q < q_0$, distribute $q_0 - q$ among the factors of the positive gain series. The same convergent bound with $n^(n \/ 2) \/ n !$ proves that its $X_q$ norm is uniformly finite for $t lt.eq T$. Integrating the pointwise majorant proves (2.16). ◻
]

For $a gt.eq 0$ define the Banach test spaces

#[#set math.equation(numbering: n => "(2.18)")
 $ E_a^0 = { h in C \( bb(R)^6 \) : e^(- a \| v \|^2) h \( x \, v \) in C_0 \( bb(R)^6 \) } \, #h(2em) parallel h parallel_a = sup e^(- a \| v \|^2) \| h \( x \, v \) \| . $ <eq:target-test-spaces>]

Smooth compactly supported tests are dense in each $E_a^0$. Let $K_t = A_t - v dot.op nabla_x$ and let $sans(S)_u h \( x \, v \) = h \( x + u v \, v \)$ denote free transport of tests.

#thm([Lemma 2.4.])[
  (Backward evolution).  #emph[For $0 lt.eq a < b < 2 beta$ and $0 lt.eq r lt.eq t lt.eq T$, there is a bounded backward propagator $U \( r \, t \) : E_a^0 arrow.r E_b^0$. It solves 
#[#set math.equation(numbering: n => "(2.19)")
 $ U \( r \, t \) h = sans(S)_(t - r) h + integral_r^t sans(S)_(s - r) K_s U \( s \, t \) h thin upright(d) s \, $ <eq:target-backward-mild>]

 has the composition law with intermediate exponents, and is the unique mild propagator in these scales. For $phi.alt in C_c^oo$, 
#[#set math.equation(numbering: n => "(2.20)")
 $ U \( r \, t \) phi.alt - phi.alt = integral_r^t U \( r \, s \) A_s phi.alt thin upright(d) s . $ <eq:target-upper-end-identity>]

]
] <lem:target-propagator>

#proof[
  For $a$ in a compact subinterval of $\[ 0 \, 2 beta \)$, energy conservation and the Gaussian bound give
  #[#set math.equation(numbering: n => "(2.21)")
   $ \| K_t h \( x \, v \) \| lt.eq C M parallel h parallel_a \( 1 + \| v \| \) e^(a \| v \|^2) \, #h(2em) parallel K_t h parallel_b lt.eq C M #scale(x: 120%, y: 120%)[\(] 1 + \( b - a \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] parallel h parallel_a . $ <eq:target-K-estimate>]
  Indeed $\| Delta_h \| lt.eq 4 parallel h parallel_a e^(a \( \| v \|^2 + \| v_(*) \|^2 \))$ and $integral B \( v - v_(*) \, omega \) upright(d) omega = pi \| v - v_(*) \|$. The operator also maps $E_a^0$ into $E_b^0$. To check the spatial tail, replace $parallel h parallel_a$ in the first bound by $eta_h \( x \) = sup_v e^(- a \| v \|^2) \| h \( x \, v \) \|$, which tends to zero as $\| x \| arrow.r oo$. The exponent loss controls the velocity tail. Classical continuity of $f$, local dominated convergence, and these tail bounds show that $t mapsto K_t h$ is continuous in $E_b^0$. Free transport is a strongly continuous isometry on each $E_a^0$.
  Iterate (2.19). Giving each of the $n$ collision factors the exponent allowance $\( b - a \) \/ n$ bounds the $n$th time-ordered term by
  #[#set math.equation(numbering: n => "(2.22)")
   $ frac(\( C M \( t - r \) \)^n, n !) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(n \/ \( b - a \)) #scale(x: 120%, y: 120%)[\)]^n parallel h parallel_a . $ <eq:target-Dyson-bound>]
  The series converges for every finite $T$. Its terms are Bochner integrals on the stated spaces. Splitting a time-ordered simplex at an intermediate time proves composition; the same estimate applied to an iterated homogeneous remainder proves uniqueness, leaving a positive exponent allowance between its two endpoint spaces.
  For a compactly supported smooth $phi.alt$, the function $A_s phi.alt$ has compact spatial support, grows at most linearly in $\| v \|$, and is continuous in $s$ in every $E_a^0$ with $a > 0$. Differentiate the series at its upper endpoint $t$. Differentiating its final transport factor gives $U \( r \, t \) \( v dot.op nabla_x phi.alt \)$, and the upper faces of the simplices give $U \( r \, t \) K_t phi.alt$. Both differentiated series converge with the bound (2.22), using a small extra exponent allowance for $K_t phi.alt$. Hence $partial_t U \( r \, t \) phi.alt = U \( r \, t \) A_t phi.alt$, which proves (2.20). ◻
]

=== 2.3 Construction and uniqueness of the Gaussian field <construction-and-uniqueness-of-the-gaussian-field>

The backward covariance formulation below also appears in the short-time fluctuation theory of #cite(label("BGSS2023")) Section 6.1. Here the preceding moment and propagator estimates construct the Gaussian field on the full prescribed regular interval $\[ 0 \, T \]$.

#thm([Proposition 2.5.])[
  (Gaussian target).  #emph[The fluctuation equation in 2 has a centered Gaussian solution on the test scales $E_a^0$, $0 lt.eq a < beta$. It is a continuous linear map from each such test space to $L^2$ of its probability space, uniformly on $\[ 0 \, T \]$. Its covariance is 
#[#set math.equation(numbering: n => "(2.23)")
 $ bb(E) \[ zeta_t \( phi.alt \) zeta_s \( psi \) \] =  & integral f_0 \( z \) thin U \( 0 \, t \) phi.alt \( z \) thin U \( 0 \, s \) psi \( z \) thin upright(d) z\
 & + integral_0^(min \( s \, t \)) C_r #scale(x: 120%, y: 120%)[\(] U \( r \, t \) phi.alt \, U \( r \, s \) psi #scale(x: 120%, y: 120%)[\)] thin upright(d) r . $ <eq:target-covariance>]

 It is unique in the class of solutions extending to these scales with uniformly bounded second-moment operator norms. In particular, the law required in 2 is well defined.]
] <prop:gaussian-target>

#proof[
  For $b < beta$, energy conservation and 5 give
  #[#set math.equation(numbering: n => "(2.24)")
   $ \| C_t \( h \, k \) \| lt.eq C M parallel h parallel_b parallel k parallel_b integral f_t \( x \, v \) \( 1 + \| v \| \) e^(2 b \| v \|^2) thin upright(d) x thin upright(d) v lt.eq C_b parallel h parallel_b parallel k parallel_b . $ <eq:target-source-bound>]
  Choose the moment exponent slightly above $2 b$ to absorb the factor $1 + \| v \|$. The initial quadratic form has the corresponding bound.
  Let $I_0$ and $I$ be independent isonormal Gaussian maps on, respectively, $L^2 \( f_0 upright(d) z \)$ and $L^2 \( nu \)$, where
  $ upright(d) nu = 1 / 2 B \( v - v_(*) \, omega \) f_r \( x \, v \) f_r \( x \, v_(*) \) thin upright(d) r thin upright(d) x thin upright(d) v thin upright(d) v_(*) thin upright(d) omega . $
  Such maps can be constructed by choosing orthonormal bases and independent standard normal coefficients; their defining series converge in $L^2$. Define
  #[#set math.equation(numbering: n => "(2.25)")
   $ zeta_t \( h \) = I_0 #scale(x: 120%, y: 120%)[\(] U \( 0 \, t \) h #scale(x: 120%, y: 120%)[\)] + I #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(r lt.eq t) Delta_(U \( r \, t \) h) #scale(x: 120%, y: 120%)[\)] \, #h(2em) W_t \( h \) = I #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(r lt.eq t) Delta_h #scale(x: 120%, y: 120%)[\)] . $ <eq:target-isonormal-formula>]
  For $h in E_a^0$, propagate to any exponent $b in \( a \, beta \)$ and apply (2.24). This proves that the maps are well defined and that
  #[#set math.equation(numbering: n => "(2.26)")
   $ sup_(t lt.eq T) parallel zeta_t \( h \) parallel_(L^2 \( Omega \)) lt.eq C_a parallel h parallel_a . $ <eq:target-field-bound>]
  They are jointly Gaussian and linear, and their covariance is (2.23). Orthogonality of disjoint time intervals in $L^2 \( nu \)$ gives the independent increments of $W$; independence of $I_0$ and $I$ gives the stated initial independence.
  We verify the weak equation, including the possibly unbounded drift test. For $phi.alt in C_c^oo$, use (2.20) and the boundedness of the two isonormal maps to interchange them with Bochner integrals. All the triangular kernels involved have finite squared norm by (2.24). One obtains
  $ integral_0^t zeta_s \( A_s phi.alt \) thin upright(d) s =  & I_0 #scale(x: 120%, y: 120%)[\(] U \( 0 \, t \) phi.alt - phi.alt #scale(x: 120%, y: 120%)[\)]\
 & + I #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(r lt.eq t) Delta_(U \( r \, t \) phi.alt - phi.alt) #scale(x: 120%, y: 120%)[\)] . $
  Together with (2.25), this is precisely
  $ zeta_t \( phi.alt \) = zeta_0 \( phi.alt \) + integral_0^t zeta_s \( A_s phi.alt \) thin upright(d) s + W_t \( phi.alt \) . $
  For uniqueness, work on the probability space of any candidate solution. Construct the backward mild field there from its own initial field and noise: the deterministic integrals are mean-square limits of compact tests and time-step functions, with the bounds just proved. Subtract this field from the candidate and call the difference $D_t$. It has zero initial field and noise. Its compact-test weak equation and uniform second-moment bound give mean-square continuity. Riemann sums then permit the time-dependent tests $sans(S)_(t - s) phi.alt$, whose supports lie in one compact set for $0 lt.eq s lt.eq t$. They give the transport mild identity
  $ D_t \( phi.alt \) = integral_0^t D_s #scale(x: 120%, y: 120%)[\(] K_s sans(S)_(t - s) phi.alt #scale(x: 120%, y: 120%)[\)] thin upright(d) s . $
  It extends by density and (2.21) to exponent scales with a positive allowance. For $0 lt.eq a < b < beta$, iteration $n$ times and (2.26) bound its $L^2$ norm by
  $ C_b parallel phi.alt parallel_a frac(\( C T \)^n, n !) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(n \/ \( b - a \)) #scale(x: 120%, y: 120%)[\)]^n arrow.r 0 . $
  This proves uniqueness in the stated class and therefore uniqueness in law of the constructed Gaussian solution.
  This construction is a Gaussian generalized field in the explicit mean-square test-space sense of (2.26); it does not assert membership in the Banach dual of $E_a^0$ sample by sample. If desired, its restriction to $C_c^oo \( bb(R)^6 \)$ has a random distribution version. One direct construction expands locally in Fourier functions multiplied by a compact cutoff. Their variances are uniformly bounded by (2.26) with $a = 0$; the expected squared local $H^(- s)$ norm is therefore finite for $s > 3$. A countable exhaustion by cubes yields consistent local distributions. No path-space assertion is needed here. ◻
]

== 3 Layered histories and the analytic inputs <sec:dhm-inputs>

We use the version of Deng–Hani–Ma dated 18 July 2025, #cite(label("DHM2025")). All source page and equation numbers in this section refer to that version. Its diagram estimates concern positive geometric integrals. They do not assert a fluctuation theorem or the sharp connected estimate proved below.

=== 3.1 Parameters and the restarted dynamics <parameters-and-the-restarted-dynamics>

Fix $upsilon = 3^(- 4) = 1 \/ 81$. The constant $Gamma$, which bounds collision excess in one collision cluster, is chosen as a sufficiently large dimensional constant before the number of slabs $L$. Put $tau = T \/ L$, and, with harmless integer roundings, set

#[#set math.equation(numbering: n => "(3.1)")
 $ A_L = \| log epsilon.alt \| \, #h(2em) Lambda_i = A_i^30 \, #h(2em) A_(i - 1) = Lambda_i^30 . $ <eq:dhm-cutoffs>]

For the analytic induction use

#[#set math.equation(numbering: n => "(3.2)")
 $ beta_i = #scale(x: 180%, y: 180%)[\(] 1 - frac(i, 10 L) #scale(x: 180%, y: 180%)[\)] beta / 2 \, #h(2em) tilde(beta)_i = frac(beta_(i - 1) + beta_i, 2) \, #h(2em) theta_i = #scale(x: 180%, y: 180%)[\(] 1 - frac(i, 10 L) #scale(x: 180%, y: 180%)[\)] 3^(- 11) . $ <eq:dhm-exponents>]

Constants denoted by $C$ in an exponential factor $C^b$ can be chosen independently of $L$; constants $C_(*)$, and positive constants $c_(*)$, can depend on $L$ and the kinetic bounds. All are independent of $epsilon.alt$. No moment-order threshold is used in choosing $Gamma \, L$.

The restarted truncated dynamics is defined on all configurations, with overlaps permitted. Within slab $i$, start the collision prehistory anew. At each incoming contact, accept the elastic collision precisely when adding that contact to the existing collision graph leaves its component with at most $Lambda_i$ particle labels and excess at most $Gamma$. Otherwise both particles continue straight. A contact inside one existing component increases its excess by one; a contact between different components merges them and adds their excesses. Here, for a graph with $b$ edges, $n$ vertices, and $k$ components, its excess is $r = b - n + k$, counting repeated edges with multiplicity. The caps bound the number of accepted collisions in a finite system; between accepted collisions the motion consists of finitely many straight segments. Incoming contacts, rather than exits from an overlap, determine the rule. Binary changes of variables exclude the null sets of grazing contacts, simultaneous contacts, and branch ties. This is the rule of #cite(label("DHM2025")) Definition 4.3, Equation (4.2). Almost-everywhere existence, the cluster caps, and mass preservation are #cite(label("DHM2025")) Proposition 4.5. Restarting is part of our definition; the capped evolution with a prehistory retained is not a semigroup. We call the evolution obtained by concatenating these restarted slab dynamics the pasted dynamics.

#thm([Lemma 3.1.])[
  (Kinetic envelopes).  #emph[Under 1, 
#[#set math.equation(numbering: n => "(3.3)")
 $ sup_(0 lt.eq t lt.eq T) #scale(x: 120%, y: 120%)[\(] parallel f_t parallel_(upright("Bol") \, beta) + parallel nabla_x f_t parallel_(upright("Bol") \, beta) #scale(x: 120%, y: 120%)[\)] < oo . $ <eq:kinetic-bol-propagated>]

]
] <lem:kinetic-envelopes>

#proof[
  Apply #cite(label("DHM2025")) Proposition A.1 with decreasing Gaussian exponent $beta_(*) \( t \) = 2 beta - beta t \/ T$. The weighted uniform hypothesis follows from (1.5), and its two initial summable spatial norms are (1.4). Since $beta_(*) \( t \) gt.eq beta$, its conclusion implies (3.3). This is the same application as #cite(label("DHM2025")) Equation (1.29). ◻
]

=== 3.2 Histories, roots, and normalization <histories-roots-and-normalization>

#prodef([Definition 3.2.])[
  (Layered C/O history).  A history consists of finitely many oriented particle lines and binary atoms, with an order on the atoms along every line. Each atom has two incoming and two outgoing half-edges, paired into two serial particle lines. A C-atom applies elastic scattering, and an O-atom records an incoming encounter with straight continuation. A line segment between atoms is a bond. Segments with only one incident atom are ends. A line with no atom is a single empty end; it is integrated unless its state is fixed, just like any other end. Atoms belong to specified slabs; the order along every line must be consistent with those slabs. Lines can begin or end at slab interfaces. Their beginnings carry one-particle input functions. Certain top lines, with distinct prescribed labels, are roots. The remaining particle names are immaterial: histories are identified under relabelings preserving the roots, the serial pairing, the C/O types, and the line orders. Integrals use the factorial weights obtained from ordered particle labels, as specified in 4.
  In a slab, the C-clusters are the components formed using only C-atoms. The cluster graph has those clusters as vertices and the O-atoms as edges. Its components are called layer components. Isolated rooted lines are included. Let $H_i$ be the roots of slab $i$: the lines continued into the part of the history above that slab, or the designated roots if it is the highest slab. Let $H_0$ be the lines incident to at least one initial link. Initial links join pairs of lines born at zero and carry the positive weight
  #[#set math.equation(numbering: n => "(3.4)")
   $ ell_epsilon.alt \( x \, x' \) = upright(bold(1))_({ \| x - x' \| lt.eq epsilon.alt }) + epsilon.alt^upsilon upright(bold(1))_({ \| x - x' \| > epsilon.alt }) . $ <eq:dhm-initial-link>]
  An admissible dependent history satisfies:
  + $\| H_i \| lt.eq A_i$; every C-cluster has at most $Lambda_i$ particle lines and excess at most $Gamma$; every layer component contains fewer than $Lambda_i$ C-clusters.
  + The cluster graph in each slab is a forest, and every layer component contains a root of that slab. Every unrooted line is connected in that slab to a rooted line.
  + The initial links form a forest.
  + For $i gt.eq 2$, each line in $H_i$ is connected within slab $i$ to a different line in $H_i$, connected there to a line in $H_(i - 1)$, or itself belongs to $H_(i - 1)$. For $i = 1$, replace $H_(i - 1)$ by $H_0$.
  Connection within a slab means intersection with the same component of its atom graph; the last alternative in (iv) covers a straight line with no atom there. These are the conditions of #cite(label("DHM2025")) Definition 3.20(1). Writing $cal(M)_i$ for the history restricted to slab $i$, its complexity is
  #[#set math.equation(numbering: n => "(3.5)")
   $ rho = \| H_0 \| + sum_i #scale(x: 120%, y: 120%)[\(] \| H_i \| + r \( cal(M)_i \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:dhm-complexity>]
  where $r \( cal(M)_i \)$ is its total cycle excess. Since the O-graph is a forest, this equals the sum of the C-cluster excesses. The total number of atoms is denoted by $b$.
] <def:dhm-history>

Here is an explicit integral convention, also needed after cutting a history. Give each edge $e$ a vector $z_e = \( x_e \, v_e \)$, where its physical position at time $t$ is $X_e \( t \) = x_e + t v_e$. Give atom $a$ a time $t_a$. Its two incoming edges are $1 \, 2$, its serial outgoing edges $1' \, 2'$. On its contact surface put $u = v_1 - v_2$, $omega = \( X_1 \( t_a \) - X_2 \( t_a \) \) \/ epsilon.alt$, and $frak(b) = \[ - u dot.op omega \]_(+)$. Define

#[#set math.equation(numbering: n => "(3.6)")
 $ Delta_a^(upright(C)) & = delta \( \| X_1 \( t_a \) - X_2 \( t_a \) \| - epsilon.alt \) frak(b) product_(j = 1)^2 delta \( X_(j') \( t_a \) - X_j \( t_a \) \) delta \( v_(1') - v_1 + \( u dot.op omega \) omega \) delta \( v_(2') - v_2 - \( u dot.op omega \) omega \) \,\
Delta_a^(upright(O)) & = delta \( \| X_1 \( t_a \) - X_2 \( t_a \) \| - epsilon.alt \) frak(b) product_(j = 1)^2 delta \( x_(j') - x_j \) delta \( v_(j') - v_j \) . $ <eq:atom-C>]

Vector deltas in these formulas are three-dimensional. Reversing $omega$ converts the incoming convention to (1.2); surface measure is unnormalized. For a cut history some ends are fixed. If $E_(*)$ consists of all bonds and nonfixed ends, set

#[#set math.equation(numbering: n => "(3.7)")
 $ I_M \( Q \) \( z_(upright("fixed")) \) := mu^(\| E_(*) \| - 2 b) integral_(cal(D)_M) integral Q \( z_E \, t_M \) product_(a in M) Delta_a product_(e in E_(*)) upright(d) z_e product_(a in M) upright(d) t_a . $ <eq:edge-integral>]

The domain $cal(D)_M$ imposes the assigned slab on each time and strictly increasing times along every particle line. These positive measures can equivalently be defined by the incoming surface change of variables, so the displayed deltas are a notation for the corresponding coarea measures. The kernel $Q$ contains the birth factors evaluated at physical positions, the initial-link factors, and any further history indicators. All statements below allow such indicators.

For a full history, $\| E \| - 2 b = n$, the number of particle lines. If there are $h$ designated roots, its normalized positive integral is

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(J)_M \( Q \) = mu^(- h) I_M \( Q \) . $ <eq:normalized-history>]

Thus every birth has activity $mu$, every root has normalization $mu^(- 1)$, and every contact surface supplies a factor $epsilon.alt^2$. This is #cite(label("DHM2025")) Proposition 7.5, Equation (7.7). To keep a root endpoint $\( x \, v \)$ at time $t$ unintegrated, turn its top end into a fixed end and evaluate at $\( x - t v \, v \)$. This removes the root activity factor from (3.7); its resulting density has the normalization of (3.8).

=== 3.3 The imported analytic package <the-imported-analytic-package>

The one-slab class $cal(T)_i$ consists of connected histories with one top root, the size, excess, and forest conditions (i)–(ii), and no continuation or initial-link requirement. In particular, $cal(T)_i$ can have order $Lambda_i^2$ lines. Let $cal(T)_i^(upright("err"))$ be the histories obtained by inserting one additional O-atom in such a history, with a compatible position in each of the two line orders. The leading signed sum contains every one-root particle-line tree of total size $< Lambda_i \/ 3$, with its C/O choices and sign $\( - 1 \)^(\# upright(O))$, once with the factorial weight coming from particle labels. It does not impose the absence of additional encounters.

#thm([Theorem 3.3.])[
  (DHM analytic package).  #emph[Assume 1, the parameter hierarchy (3.1)–(3.2), and a common bound on the Gaussian Bol norms of all birth inputs. For sufficiently large fixed $L$ and sufficiently small $epsilon.alt$, the following hold.]
  + #emph[For admissible dependent histories with prescribed labeled roots, fixed $b$, and complexity $rho$, the sum of their normalized positive integrals is at most 
#[#set math.equation(numbering: n => "(3.9)")
 $ C^b tau^(b \/ 10) epsilon.alt^(c_(*) rho) \| log epsilon.alt \|^(C_(*) rho) . $ <eq:dhm-coarse>]

 The sum includes the graph enumeration and the admissible indicator restrictions; a bounded observable multiplier costs its supremum. The birth inputs need not equal the approximate density constructed in the source, but must satisfy its common Gaussian Bol envelope.]
  + #emph[Suppose the independent input $g$ in slab $i$ satisfies 
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel g - f_(\( i - 1 \) tau) parallel_(upright("Bol") \, beta_(i - 1)) lt.eq epsilon.alt^(theta_(i - 1)) . $ <eq:dhm-input-closeness>]

 Let $sans(T)_i^epsilon.alt \[ g \]$ be the leading signed sum just defined. Then 
#[#set math.equation(numbering: n => "(3.11)")
 $ parallel sans(T)_i^epsilon.alt \[ g \] - f_(i tau) parallel_(upright("Bol") \, beta_i) lt.eq 1 / 2 epsilon.alt^(theta_i) . $ <eq:dhm-signed-trees>]

 In the fixed-top-endpoint norm $upright("Bol") \, tilde(beta)_i$, the summed absolute contributions of cyclic members of $cal(T)_i$, members of $cal(T)_i^(upright("err"))$, and tree members of $cal(T)_i$ with at least $Lambda_i \/ 3$ lines are $o \( epsilon.alt^(theta_i) \)$. Fixed powers of the cutoffs, arising from a bounded number of selected edge positions, can be included. A fixed exponential factor per atom can also be included by choosing $L$ sufficiently large.]
  #emph[Part (b) also holds uniformly when the final slab stops at any $0 lt.eq sigma lt.eq tau$. With the same cutoffs and exponent budgets, write $sans(T)_(i \, sigma)^epsilon.alt$ for its signed tree sum. Then 
#[#set math.equation(numbering: n => "(3.12)")
 $ sup_(0 lt.eq sigma lt.eq tau) parallel sans(T)_(i \, sigma)^epsilon.alt \[ g \] - f_(\( i - 1 \) tau + sigma) parallel_(upright("Bol") \, beta_i) lt.eq 1 / 2 epsilon.alt^(theta_i) \, $ <eq:dhm-partial-slab>]

 and the positive error classes obey the same full-$tau$ upper majorants uniformly in $sigma$. At $sigma = 0$ the map is the identity and its contact error classes vanish. The assertion in (b) is about the specified complete signed tree sum and positive error classes. Identifying a different one-root operator with that sum up to those errors requires a separate combinatorial argument.]
] <thm:dhm-package>

#proof[
  #emph[Source statements and the envelope adaptations.] For (a), #cite(label("DHM2025")) Proposition 7.2 counts the root-labeled unlabeled histories by $C^b \| log epsilon.alt \|^(C_(*) rho)$. #cite(label("DHM2025")) Proposition 9.7, Equation (9.51) retains a positive geometric gain proportional to $rho$. After the regular cutting operations, #cite(label("DHM2025")) Equation (9.53) bounds each full edge integral by
  $ tau^(b \/ 9) epsilon.alt^(- 2 h + 2 upsilon \/ 5 + c_(*) rho) \| log epsilon.alt \|^(C_(*) rho) . $
  Multiplication by $mu^(- h) = epsilon.alt^(2 h)$ cancels the negative root power. Incorporating the counting and the cutting alternatives, weakening $1 \/ 9$ to $1 \/ 10$, and discarding the extra positive power gives (3.9). These are the estimates in the proof of #cite(label("DHM2025")) Proposition 6.2, Section 9.2, rather than just its final displayed conclusion.
  The only use there of a birth density is the decomposition in #cite(label("DHM2025")) Equations (9.58)–(9.63): write its absolute value as a sum of spatially localized Gaussian envelopes, whose coefficients have bounded sum. Indeed, from (1.1) choose a summable sequence $\( m_a \)$ bounding the weighted supremum on the unit balls; the bounded overlap of those balls gives a decomposition dominated by $C sum_a m_a upright(bold(1))_(\| x - a \| lt.eq 1) e^(- beta' \| v \|^2)$, at any permitted exponent $beta' > 0$. Apply the positive source estimates to each product of such envelopes and sum their coefficients. This proves the stated extension to arbitrary bounded inputs, including absolute values of signed inputs. Multipliers between zero and one are kept in the support throughout, or dropped only when a positive upper bound is being taken.
  For (b), the one-root integral is a function of a fixed endpoint by #cite(label("DHM2025")) Equation (14.2). The C/O involution of #cite(label("DHM2025")) Proposition 14.2 cancels the noncausal trees in the complete signed sum. The remaining causal trees satisfy the Gaussian Bol estimate #cite(label("DHM2025")) Proposition 14.3, Equation (14.8). The comparison to the short-time Boltzmann expansion, using 8, is the proof of #cite(label("DHM2025")) Proposition 6.1, Section 14. To replace its preceding input by $g$, expand each birth factor as $f_(\( i - 1 \) tau) + \( g - f_(\( i - 1 \) tau) \)$. Each residual factor gains $epsilon.alt^(theta_(i - 1))$ by (3.10); the source multilinear tree bound sums all choices. Since $theta_(i - 1) > theta_i$, the residual and the finite-diameter comparison errors are $o \( epsilon.alt^(theta_i) \)$, proving (3.11) for small $epsilon.alt$.
  For the positive subleading terms the explicit source bound is #cite(label("DHM2025")) Equation (14.28), in $upright("Bol") \, tilde(beta)_i$, with a time power per atom and gain $epsilon.alt^(upsilon \/ 3 + c_(*) rho)$ in the cyclic and extra-encounter cases. Points 1–2 of Section 14.3 retain the Gaussian weight at the fixed root and the spatial Bol sum; Point 4 regularizes an O-atom adjacent to that fixed root without altering its integral. Thus this is stronger than an integrated mass estimate. The tree-tail branch of Point 5 uses only that the atom number is of cutoff order; replacing $Lambda_i$ by $Lambda_i \/ 3$ leaves an exponentially small tail. Graph enumeration, the bounded number of selected-edge choices, and fixed exponential factors are absorbed by the time power after taking $L$ large. This proves (b) with the asserted norm and size range. For the partial-slab assertion, restrict every contact time to $\( \( i - 1 \) tau \, \( i - 1 \) tau + sigma \)$. After translating the slab to start at zero, the fixed top end is evaluated at $\( x - sigma v \, v \)$. Repeat the root Gaussian and spatial localization argument of #cite(label("DHM2025")) Section 14.3, Points 1–2 at this endpoint: all spatial shifts have duration at most $tau$, and the same Gaussian exponent margin remains available. The resulting fixed-root Bol bounds are therefore uniform for $sigma lt.eq tau$. Positivity enlarges the contact-time domain only with the intercept held fixed; the preceding localization supplies the bound in the physical endpoint norm. The signed tree involution preserves this restriction, and the Boltzmann expansion and its finite-diameter comparison use the same shortened time domain. Their upper estimates retain the original $tau$ bound, uniformly in $sigma$, so the preceding argument proves (3.12) with unchanged budgets. When $sigma = 0$, only the zero-atom tree remains, giving $g$; (3.10) and $theta_(i - 1) > theta_i$ give the claimed bound there too. ◻
]

#thm([Lemma 3.4.])[
  (Coarse boundary modifications).  #emph[The following modifications of the positive coarse bound are allowed.]
  + #emph[If continuation condition (iv) is omitted in the top slab with $h$ roots, the bound may lose $epsilon.alt^(- C_(*) h)$.]
  + #emph[A connected pure-C terminal component with at most $3 Lambda_i$ lines and excess at most $2 Gamma$, meeting a continuation below but having no designated top root, can be treated by adding one artificial root at cost $mu$.]
  + #emph[A fixed number $q$ of specified lines, continued to zero, can be supplied with initial-link continuations by adding $q$ dummy straight root lines at cost at most $epsilon.alt^(- q upsilon)$, provided the root cutoffs have the corresponding fixed slack.]
  #emph[Bounded records carried by these lines can be kept in the integral.]
] <lem:dhm-dummies>

#proof[
  For (i), use the error version of the cutting inequality in #cite(label("DHM2025")) Equation (9.51), retaining its deficit proportional to $h$. This is an adaptation of the source proof: its formal error class also requires a large terminal component. The finale of #cite(label("DHM2025")) Section 13.5, p. 169 treats the missing top continuation in two cases. When $rho$ is at most a fixed multiple of $C_(*) h$, the source’s UP cutting algorithm produces at most $h$ elementary pieces carrying a free-component activity cost, called bad pieces in that proof. The permitted root deficit pays for them. For larger $rho$, the same cutting argument as for dependent histories applies; the continuation condition used in its layer selection concerns a strictly lower layer, where that condition is still available. Thus the cutting inequality with its deficit does not require a large terminal component. The subsequent positive integrations give the loss $epsilon.alt^(- C_(*) h)$ in #cite(label("DHM2025")) Equation (9.82). Terminal size is used only later, when the time tail absorbs that deficit. Keeping the deficit gives precisely (i).
  For (ii), choose one line of the terminal component as root. Its normalization multiplies the original integral by $mu^(- 1)$; multiplication by $mu$ restores it. The stated enlarged terminal class must be split into two cases for the source application. If the component has at most $Lambda_i$ lines and excess at most $Gamma$, its root and the stated lower continuation make it an ordinary admissible dependent history. If either cutoff is exceeded, it belongs to the enlarged terminal class in #cite(label("DHM2025")) Definition 3.20(4), and the same root operation is #cite(label("DHM2025")) Equation (15.4). A sum over the choice of line costs a cutoff polynomial.
  For (iii), take any fixed nonnegative $q_0$ with $integral q_0 thin upright(d) z = 1$ and finite Gaussian Bol norm. For every $x$,
  $ integral q_0 \( x' \, v' \) ell_epsilon.alt \( x \, x' \) thin upright(d) x' upright(d) v' gt.eq epsilon.alt^upsilon . $
  Insert this integral once for each required continuation. The activity $mu$ of a dummy input cancels its additional root factor $mu^(- 1)$. Its straight line satisfies continuation in every slab, and the new links are pendant edges, preserving the initial forest. The positive kernel inequality proves the claimed cost independently of whether $f_0$ vanishes anywhere. The envelope extension in 10 permits $q_0$ as the dummy input. Added roots and the finitely many existing roots used for their records fit the prescribed slack. No record is changed by this multiplication. ◻
]

== 4 A componentwise expansion with particle records <sec:cluster-expansion>

This section supplies the algebra to which the estimates of 10 will be applied. In particular, the connected coefficients used below are the factorial cumulants of the pasted process, up to explicitly controlled variation errors. They are not a factorization assumption at an intermediate time. The expansion of incompatibilities between autonomously evolved physical trajectory clusters follows the viewpoint of #cite(label("BGSSCluster2022")). Here the construction must also retain the restarted dynamical caps and the observation records; these additions are treated explicitly below.

Put

#[#set math.equation(numbering: n => "(4.1)")
 $ M_i = floor.l Lambda_i \/ 2 floor.r . $ <eq:cluster-threshold>]

We take $epsilon.alt$ small enough that $M_i gt.eq 2$ for every $i$. The particle cap $Lambda_i$ and collision-excess cap $Gamma$ belong to the dynamics. The cluster-number cap $M_i$ belongs only to the expansion. All the operators defined below are defined at every finite root order. The bounds $A_i$ will be imposed only when estimating these operators.

=== 4.1 Autonomous clusters and a finite forest identity <autonomous-clusters-and-a-finite-forest-identity>

Fix one slab, temporarily suppress its index, and let $V$ be a finite labelled particle set. A particle state may carry previously observed test values, or their running sum, as extra coordinates called records; the acceptance rule uses only positions, velocities, and the collision prehistory on this slab. For $C subset.eq V$, write $Psi_C$ for the autonomous truncated evolution of the particles in $C$, including any prescribed observation updates. Let $kappa_C$ be the indicator that its accepted collision graph on the slab is connected. Singletons have $kappa_C = 1$; a set with more than $Lambda$ particles has $kappa_C = 0$.

For disjoint $C \, D$, let $a \( C \, D \)$ indicate that their autonomous histories have an incoming cross-contact that would be accepted with their respective prefix collision prehistories. Put $chi \( C \, D \) = 1 - a \( C \, D \)$. These are indicators, rather than numbers of contacts. All equalities concerning histories below are on the common full-measure set where the finite subsystem evolutions are defined. Taking the union of the exceptional sets over all subsystems of a fixed finite configuration does not change this convention.

#thm([Lemma 4.1.])[
  (Autonomous partition).  #emph[For a finite set $V$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(cal(C) in cal(P) \( V \)) product_(C in cal(C)) kappa_C product_({ C \, D } subset.eq cal(C)) chi \( C \, D \) = 1 . $ <eq:autonomous-partition>]

 Here $cal(P) \( V \)$ denotes the partitions of $V$. If $S subset.eq V$ is a root set and $H$ tests the root histories, then 
#[#set math.equation(numbering: n => "(4.3)")
 $ H \( Psi_V \|_S \) = sum_(cal(C) in cal(P) \( V \)) product_(C in cal(C)) kappa_C product_({ C \, D } subset.eq cal(C)) chi \( C \, D \) H \( Psi_(cal(C)) \|_S \) \, $ <eq:autonomous-observation>]

 where $Psi_(cal(C))$ is the juxtaposition of the autonomous histories.]
] <lem:autonomous-partition>

#proof[
  The collision components of the full truncated history give one summand equal to one. Its restrictions to those components are autonomous: no accepted collision joins different components, and the rule at an internal contact depends only on the prefix component involved there. Conversely, suppose the factors in a summand equal one. Juxtapose the corresponding autonomous histories and examine their incoming contacts in chronological order. The internal accepted contacts obey the full rule. Every cross-contact fails that rule by $chi \( C \, D \) = 1$. Thus the juxtaposed history obeys the full truncated dynamics. Uniqueness identifies it with the full history and identifies its collision components with $cal(C)$. This proves both assertions. Rejected contacts are not inserted in a prefix collision graph in this argument. ◻
]

The following lemma is purely finite algebra. Its vertices will be autonomous clusters, not particles.

#thm([Lemma 4.2.])[
  (Rooted forest stopping).  #emph[Let $W$ be a finite vertex set, let $R subset.eq W$ be nonempty, and attach $a_e in { 0 \, 1 }$ to each unordered pair of vertices. Fix $M gt.eq 2$ and set 
#[#set math.equation(numbering: n => "(4.4)")
 $ u \( B \) = sum_(G upright(" connected")\
V \( G \) = B) product_(e in E \( G \)) \( - a_e \) \, #h(2em) u \( { w } \) = 1 . $ <eq:ursell-block>]

 There is a finite signed remainder $cal(R)$ such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ product_(e subset.eq W) \( 1 - a_e \) & = sum_(I : thin R subset.eq I subset.eq W) sum_(cal(B) in cal(P) \( I \)\
B ∩ R eq.not diameter \, med \| B \| < M med \( B in cal(B) \)) product_(B in cal(B)) u \( B \) product_(e subset.eq W \\ I) \( 1 - a_e \) + cal(R) . $ <eq:finite-rooted-identity>]

 Its absolute value is bounded by a sum of rooted forests. Each forest in this bound has exactly one component with $M lt.eq \| B \| lt.eq 2 M - 2$; its other components have fewer than $M$ vertices. All these components meet $R$. Vertices outside the forest retain their full mutual compatibility product. The coefficient of each selected forest in this domination is at most one. Moreover, 
#[#set math.equation(numbering: n => "(4.6)")
 $ \| u \( B \) \| lt.eq sum_(T upright(" spanning tree on ") B) product_(e in E \( T \)) a_e . $ <eq:ursell-tree-bound>]

]
] <lem:rooted-forest>

#proof[
  Choose a total order on pairs. Start with the empty selected forest and all pair factors unprocessed. At each step choose the first unprocessed pair joining distinct forest components, at least one of which meets $R$. Expand its factor as $1 - a_e$. The positive branch removes the factor; the negative branch selects $e$ and merges the two components. Never expand a factor internal to a current forest component. Stop a branch as soon as a component reaches $M$ vertices. If there is no eligible pair, complete the branch.
  A selected edge always joins two distinct components. Hence selected edges form a forest, and every nontrivial selected component is rooted. An unrooted vertex cannot join another unrooted vertex. At a stop, both components just merged had fewer than $M$ vertices, which gives the stated size range and shows that there is exactly one large component. The selected forest determines its branch: replay the deterministic rule, choosing the negative branch precisely on its edges. This proves the multiplicity assertion.
  For a completed branch, expand the retained internal factors. Each full graph thereby produced has a unique exploration branch, obtained by replaying the same rule and selecting precisely those eligible edges present in the graph. Its components meeting $R$ are precisely the reached components of the branch. Grouping by these components gives the products of (4.4); the remaining vertices retain their compatibility product. If all these components have size less than $M$, this replay cannot stop prematurely. This proves the main term in (4.5). In particular, after grouping, priorities involving vertices outside a block do not affect its coefficient $u \( B \)$.
  For a stopped branch, take absolute values and drop every unused factor except those internal to unreached vertices. All dropped factors are in $\[ 0 \, 1 \]$. The branch multiplicity just proved gives the asserted forest bound.
  For completeness, the ordinary tree inequality can be seen without a stopping rule. Fix a total edge order on $B$ and associate to each connected graph its unique minimum spanning tree. For a tree $T$, let $Q \( T \)$ be the set of additional edges whose order is later than every edge on the corresponding $T$-path. The graphs with minimum spanning tree $T$ are exactly $T subset.eq G subset.eq T union Q \( T \)$. Therefore
  #[#set math.equation(numbering: n => "(4.7)")
   $ u \( B \) = \( - 1 \)^(\| B \| - 1) sum_T product_(e in T) a_e product_(e in Q \( T \)) \( 1 - a_e \) . $ <eq:penrose-block>]
  Dropping the second product proves (4.6). ◻
]

=== 4.2 An exact one-slab operator on factorial measures <an-exact-one-slab-operator-on-factorial-measures>

Write $F_s$ for ordered factorial measures normalized by $mu^s$. States can include records on a specified subset of the $s$ labels. One convenient convention for their unmarked definition uses symmetric Janossy measures $p_n$:

#[#set math.equation(numbering: n => "(4.8)")
 $ sum_(n gt.eq 0) frac(p_n \( E^n \), n !) = 1 \, #h(2em) F_s = mu^(- s) sum_(n gt.eq s) frac(1, \( n - s \) !) \( "pr"_(\[ s \]) \)_(\#) p_n . $ <eq:janossy-factorial>]

Thus $p_n \/ n !$ is the law restricted to $N = n$. This notation does not impose a density assumption.

For $S = \[ s \]$ and $V = \[ s + j \]$, define the signed root-output kernel

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(K)_(S \, V) \( X \, upright(d) X'_S \) = sum_(cal(C) in cal(P) \( V \)) product_(C in cal(C)) kappa_C \( X \) sum_(cal(B) in cal(P) \( cal(C) \)\
\( union.big_(C in B) C \) ∩ S eq.not diameter \, med \| B \| < M) product_(B in cal(B)) u \( B \; X \) thin delta_(Psi_(cal(C)) \( X \) \|_S) \( upright(d) X'_S \) . $ <eq:retained-kernel>]

The inner restrictions apply to every $B in cal(B)$; its cardinality counts clusters. The incompatibilities in $u$ are those of the fixed autonomous histories. The retained operator is

#[#set math.equation(numbering: n => "(4.10)")
 $ \( cal(L)_s F \) \( upright(d) X'_S \) = sum_(j = 0)^(s \( M - 1 \) Lambda - s) frac(mu^j, j !) integral F_(s + j) \( upright(d) X_V \) thin cal(K)_(S \, V) \( X \, upright(d) X'_S \) . $ <eq:retained-operator>]

An empty summation restriction in these formulas gives zero. There are at most $s$ retained blocks, so the indicated bound on $j$ follows from the component caps.

For the stopped kernel, $V$ consists only of reached particle labels; outside labels have already been designated as spectators. Let $frak(F)_S^(upright("stop")) \( cal(C) \)$ be the forests spanning the entire vertex set $cal(C)$ such that every forest component contains a cluster meeting $S$, exactly one component has between $M$ and $2 M - 2$ cluster vertices, and every other component has fewer than $M$ cluster vertices. In particular, an unrooted isolated cluster is not allowed. Define $cal(K)_(S \, V)^(upright("stop"))$ by replacing the inner block sum and its product of $u \( B \; X \)$ in (4.9) with

$ sum_(F in frak(F)_S^(upright("stop")) \( cal(C) \)) product_(e in E \( F \)) a_e \( X \) . $

Keep $product_C kappa_C$ and the same root-output map. The mutual compatibility factors of the spectator clusters are summed using (4.2) in the proof below; they are not omitted from the finite stopped-branch identity. Define $cal(E)_s F$ as in (4.10), with this kernel and the larger upper bound

#[#set math.equation(numbering: n => "(4.11)")
 $ j lt.eq \( s + 1 \) \( M - 1 \) Lambda - s . $ <eq:stopped-input-order>]

#thm([Lemma 4.3.])[
  (One-slab identity and variation remainder).  #emph[For a positive input point-process law, let $F'$ be its factorial hierarchy after the truncated slab. If its factorial measures up to the order in (4.11) are finite, then 
#[#set math.equation(numbering: n => "(4.12)")
 $ F'_s = cal(L)_s F + R_s \, #h(2em) \| R_s \| lt.eq cal(E)_s F . $ <eq:one-slab-exact>]

 The same statements hold with prescribed records on root labels. The positive expression $cal(E)_s F$ is a domination of $R_s$, not an assertion that the signed remainder has this local kernel.]
] <lem:one-slab-expansion>

#proof[
  Apply (4.3) and 13 inside (4.8). For a completed branch, fix the reached particle labels $V supset S$, of size $s + j$. The cluster partitions on the unreached labels sum to one by (4.2), pointwise before integration against $p_n$. No independence of the input is used. Choosing the reached labels gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ frac(1, \( n - s \) !) binom(n - s, j) = frac(1, j ! \( n - s - j \) !) . $ <eq:fresh-label-factorial>]
  Summing the remaining labels gives $mu^(s + j) F_(s + j)$; the output normalization $mu^(- s)$ leaves exactly $mu^j \/ j !$.
  For the stopped terms, retain the mutual compatibility of unreached clusters and discard the other unused factors and the branch-selection restrictions. Positivity of the input and the multiplicity bound give $\| R_s \( H \) \| lt.eq \( cal(E)_s F \) \( \| H \| \)$ for every bounded measurable $H$. The same spectator summation and (4.13) apply. There are at most $s$ rooted components, only one of which has up to $2 M - 2$ clusters. Their total number of clusters is at most $\( s + 1 \) \( M - 1 \)$, proving (4.11).
  These bounds also justify the Janossy summations: the dominating expression involves only finitely many finite factorial measures. Finally, the spectator cancellation and compatibility factors do not use records, and root-output maps carry them without alteration except for the prescribed updates. This proves the record version. ◻
]

For a finite signed measure $nu$, write $parallel nu parallel_(upright("TV")) = \| nu \| \( upright("whole space") \)$ for its total variation norm. We will also use a deliberately crude operator bound. If $Delta$ is a signed family of input measures, then, uniformly in the record choices,

#[#set math.equation(numbering: n => "(4.14)")
 $ parallel cal(L)_(i \, s) Delta parallel_(upright("TV")) + parallel cal(E)_(i \, s) \| Delta \| parallel_(upright("TV")) lt.eq e^(C_(*) A_i Lambda_i^2 log \( 1 \/ epsilon.alt \)) max_(q lt.eq A_(i - 1) \/ 2) parallel Delta_q parallel_(upright("TV")) \, #h(2em) s lt.eq A_i \/ 2 . $ <eq:crude-operator>]

Indeed every relevant $q$ is at most $\( s + 1 \) Lambda_i^2 \/ 2$, which is less than $A_(i - 1) \/ 2$ for small $epsilon.alt$. There are at most $q^q$ particle partitions and $q^q$ cluster partitions; the spanning-tree or forest sum is at most $q^(2 q)$. Their kernels are pushforwards multiplied by indicators. The activity is at most $mu^q$ and there are at most $A_i Lambda_i^2$ values of $q$. Taking logarithms proves (4.14). This estimate concerns variation only; it asserts no Gaussian weight for a general input error.

=== 4.3 The one-root map and its Boltzmann approximation <the-one-root-map-and-its-boltzmann-approximation>

Let $g_0$ be the exact normalized initial intensity from 3. Define the unmarked one-root measures recursively by

#[#set math.equation(numbering: n => "(4.15)")
 $ g_i = cal(U)_i \( g_(i - 1) \) \, #h(2em) cal(U)_i \( g \) := cal(L)_(i \, 1) #scale(x: 120%, y: 120%)[\(] \( g^(⊗ q) \)_(q gt.eq 0) #scale(x: 120%, y: 120%)[\)] . $ <eq:one-root-definition>]

The definition is finite and makes sense first as a signed measure. It uses the entire retained one-root block in (4.9); there is no extra cutoff depending on the number of observations.

We spell out the comparison needed to apply the one-root part of 10. A particle-line molecule below includes the ordering of contacts along each line and a C or O flag at each contact. Write $n$ for its number of particle lines and $r$ for its cycle excess. The signed unrestricted tree operator uses sign $\( - 1 \)^(\# upright(O))$, the usual hard-sphere incoming contact measure, and the original $mu^(n - 1) \/ \( n - 1 \) !$ labelled normalization. It prescribes the displayed contacts and ignores all other contacts.

#thm([Lemma 4.4.])[
  (Modified one-root bridge).  #emph[The difference between $cal(U)_i \( g \)$ and the signed unrestricted one-root particle-tree sum with $n < Lambda_i \/ 3$ is dominated, after replacing inputs by $\| g \|$, by the following positive history integrals:]
  + #emph[retained one-root molecules with $r gt.eq 1$;]
  + #emph[retained one-root molecules with $n gt.eq Lambda_i \/ 3$;]
  + #emph[the small unrestricted trees with one additional incoming O contact inserted between a pair of their flight segments.]
  #emph[The first two families are subsets of the DHM one-root graph class. The third is its additional-overlap error class. Coefficients in these dominations have at most a fixed power of the cutoffs. The leading tree coefficient is exactly $\( - 1 \)^(\# upright(O))$, with the labelled factorial just stated.]
] <lem:one-root-bridge>

#proof[
  Apply (4.7) to the single retained block. Refine each autonomous C-cluster according to its complete ordered accepted collision history. Its internal indicator is at most the indicator requiring those prescribed C contacts. Every chosen cluster-tree edge requires the existence of a prospective accepted incoming encounter between two isolated histories. Each history has finitely many flight segments: a cluster of $q$ particles has at most $q - 1 + Gamma$ accepted collisions. A fixed pair of straight segments has at most one incoming contact. Partition the encounter event by the first admissible segment pair in a fixed order. This writes it as a sum of disjoint encounter indicators, each with an additional factor in $\[ 0 \, 1 \]$. Ordering the resulting contacts along particle lines gives particle-line molecules. All indicators not requiring the displayed encounters can be kept as an additional weight between zero and one.
  The C clusters and the selected O forest determine the connected retained block. Its sign is $\( - 1 \)^(\# upright(O))$. Its global cycle excess is the sum of the C-cluster excesses. Thus all cyclic terms and all terms with $n gt.eq Lambda_i \/ 3$ have the first two dominations. Their cluster counts are below $M_i < Lambda_i$, and their C-cluster caps are the original $Lambda_i \, Gamma$, so they belong to the indicated DHM class.
  Consider a remaining tree molecule. Every prescribed C component is a tree on fewer than $Lambda_i \/ 3$ particles. At every prescribed contact its acceptance test is below both thresholds. If there are no other incoming encounters on this prescribed history, its autonomous C-clusters are exactly the displayed ones, every chosen O contact is the unique contact selected on that cluster pair, and every unused factor in (4.7) equals one. The added weight is therefore one. Consequently a discrepancy from the unrestricted tree is supported on a further incoming encounter.
  This last assertion also covers an internal history that fails the autonomous-cluster indicator: take the first undesignated accepted contact. Until that contact the autonomous and prescribed histories coincide, so the prescribed history has the required additional incoming encounter. The same argument applies to a discarded unused compatibility factor or to a nonfirst choice of a cluster-pair contact. Inserting an O atom at that encounter changes no velocity and hence does not change the prescribed output map. It supplies a positive dominating history integral. There are at most a fixed power of $n$ segment-pair choices and order insertions, which is a fixed cutoff power.
  Conversely, every small unrestricted particle tree is admitted by the retained block rule when it has no further encounters: its C components have size at most $n$, their excess is zero, and there are at most $n < M_i$ clusters. The C flags determine those clusters and the O flags their spanning tree. The contact ordering determines the segment placements. Thus it occurs with precisely the displayed sign, without an omitted symmetry factor. Equivalently, keep all fresh particle labels throughout the argument: all the refinements partition indicators and leave $1 \/ \( n - 1 \) !$ unchanged. This proves the lemma. ◻
]

#thm([Proposition 4.5.])[
  (Independent factors).  #emph[The measures $g_i$ have Gaussian Bol-bounded density representatives. With the exponents $beta_i \, theta_i$ of 10, for sufficiently small $epsilon.alt$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ parallel g_i - f_(i tau) parallel_(upright("Bol") \, beta_i) lt.eq epsilon.alt^(theta_i) \, #h(2em) sup_(0 lt.eq i lt.eq L) parallel g_i parallel_(upright("Bol") \, beta_i) lt.eq C . $ <eq:one-root-convergence>]

 The same estimates hold for the one-root map run through any portion $sigma in \[ 0 \, tau \]$ of slab $i$, with target $f_(\( i - 1 \) tau + sigma)$ and exponent $beta_i$.]
] <prop:one-root>

#proof[
  3 gives $parallel g_0 - f_0 parallel_(upright("Bol") \, beta_0) lt.eq C epsilon.alt$, which satisfies the initial smallness hypothesis for $theta_0 < 1$. Suppose the assertion holds at the preceding interface. Apply 15. The fixed-endpoint part of 10 bounds its three error families, including their cutoff-polynomial coefficients, by $o \( epsilon.alt^(theta_i) \)$ in $upright("Bol") \, beta_i$. That same part compares the signed small-tree sum with $f_(i tau)$, under the preceding $upright("Bol") \, beta_(i - 1)$ error hypothesis, with the remaining margin in $epsilon.alt^(theta_i)$. This proves the first estimate by induction; the uniform Bol bound follows from the Bol bound for $f$.
  This use is a fixed-endpoint Bol estimate, not an inference from an integrated $L^1$ estimate. The source representation underlying the one-root item of 10 fixes the root endpoint before integrating the other lines. It therefore also provides the asserted density representatives and preserves the summable spatial cell norm. Restricting all contact times to a partial slab gives the uniform partial-slab version of that item. The same bridge and induction then apply for every $sigma lt.eq tau$. ◻
]

=== 4.4 Marked retained hierarchies and exact resummation <marked-retained-hierarchies-and-exact-resummation>

Fix a finite list of observation pulses. For estimates, let $m$ be a fixed bound on both the number of pulses and the number of labels carrying records. For a particle label $a$, a record is the sum of its requested test values at pulses already passed. Only labels whose records are required carry this extra coordinate. Thus all record coordinates lie in one fixed bounded interval. For a root set $S$ and $R subset.eq S$, let $F_(i \, S)^R$ be the pasted factorial measure at interface $i$, with record coordinates on $R$. The operators $cal(L)_i$ act on these measures by appending the slab observations on those same labels. Compatibility is independent of the records.

Define the retained hierarchy by the finite composition

#[#set math.equation(numbering: n => "(4.17)")
 $ hat(F)_i^R = cal(L)_i cal(L)_(i - 1) dots.h.c cal(L)_1 F_0^R . $ <eq:retained-hierarchy>]

For a fixed output order, each factor uses only finitely many previous orders, so this definition needs no convergence of a series in the number of layers or particles. The initial hierarchy is expanded by 3 into its exact factorial cumulant blocks. Initial observation pulses, if any, act by the separate one-particle update maps on these blocks.

#thm([Lemma 4.6.])[
  (Resummation with specified records).  #emph[The retained hierarchy admits an exact finite expansion 
#[#set math.equation(numbering: n => "(4.18)")
 $ hat(F)_(i \, S)^R = sum_(H : thin R subset.eq H subset.eq S) E_(i \, H)^R ⊗ g_i^(⊗ \( S \\ H \)) . $ <eq:dependent-subsets>]

 The coefficients can be represented by layered diagrams with the following rule. Every retained block in slab $i$ contains a root from the interface above it. A block is retained in $E_(i \, H)^R$ if it contains at least two such roots, or it meets a dependent input label from the interface below. All other blocks sum to the independent factor $g_i$ on their unique root. Every record-bearing line continues to time zero. Forgetting any record commutes with (4.17); at the diagram level it is effected by resumming the newly unmarked one-root histories.]
] <lem:marked-regrouping>

#proof[
  At time zero expand the factorial hierarchy into exact initial cumulant blocks. Put in $H$ every label in a nontrivial block and every label in $R$. An unmarked singleton contributes $g_0$ on the complement. A marked singleton remains in $H$ and carries its deterministic initial record. This proves the initial case.
  Insert the preceding-interface expansion into (4.10). Let $H_(-)$ be its dependent input set. Separate the blocks that have one new root and are disjoint from $H_(-)$. Their inputs are independent $g_(i - 1)$ factors; summing each such block is exactly (4.15). Since $R subset.eq H_(-)$, these blocks carry no required record. Keep all the other blocks and call their new root set $H$. This gives (4.18) and the stated rule. Each required record label lies in $H_(-)$ at every step, so its own particle line is continued through all interfaces.
  Fresh labels assigned to different blocks are disjoint and distributed with their multinomial coefficients. Identity (4.13) therefore permits the separate sums used here. All sums are finite; no conditional convergence or factorization of the actual input law is involved.
  Finally, forgetting records commutes with each root-output kernel in (4.9), because its weight uses only the unmarked histories. It also commutes with the initial one-particle updates. Thus it commutes with their composition. In the regrouped expression, the blocks freed from the requirement of carrying a record are summed using the same one-root definition. This proves the asserted diagram interpretation of projection. ◻
]

All nontrivial initial cumulant blocks are regarded as connections when speaking of a global component. For estimates, each is bounded by its initial spanning trees from 3. More explicitly, a block on $k$ labels is dominated by the product of its $f_0$ factors, $\( C k \)^(C k)$, and a sum of root trees with the edge kernel from (3.4):

#[#set math.equation(numbering: n => "(4.19)")
 $ ell_epsilon.alt \( x \, x' \) = upright(bold(1))_(\| x - x' \| lt.eq epsilon.alt) + epsilon.alt^upsilon upright(bold(1))_(\| x - x' \| > epsilon.alt) \, #h(2em) upsilon = 1 \/ 81 . $ <eq:initial-kernel-expansion>]

One can use this piecewise version of the kernel in the initial bound: it follows directly from the root-proximity-component proof in 3. For bounded $k$, its sharper version has kernel $upright(bold(1))_(\| x - x' \| lt.eq C_(D \, k) epsilon.alt) + epsilon.alt^D$ for any fixed $D$. These are dominations of the exact initial blocks. An artificial link used to estimate a marked line is not an initial cumulant connection.

#thm([Lemma 4.7.])[
  (Labels and connected components).  #emph[The retained expansion factors over its global components. If $D_(i \, B)^R$ is the sum of its diagrams connected on the designated roots $B$, then 
#[#set math.equation(numbering: n => "(4.20)")
 $ hat(F)_(i \, S)^R = sum_(pi in cal(P) \( S \)) ⨂_(B in pi) D_(i \, B)^(R ∩ B) . $ <eq:component-exponential-formula>]

 Consequently factorial-cumulant inversion of the retained hierarchy keeps exactly its connected diagrams. This assertion is unchanged by the resummations into $g_i$.]
  #emph[At fixed root order $h = \| S \|$ and bounded DHM complexity $rho lt.eq K$, let $n_i$ denote the number of particle lines in slab $i$, and $j_i$ its fresh input labels. The labelled denominator is $product_i j_i !$, where 
#[#set math.equation(numbering: n => "(4.21)")
 $ n_i - j_i = O_(K \, h \, m \, L) \( 1 \) \, #h(2em) product_i frac(1, j_i !) lt.eq frac(\( 1 + sum_i n_i \)^(C_(K \, h \, m \, L)), product_i n_i !) . $ <eq:bounded-crossing-factorials>]

 Apart from the choices of ordinary contact pairs and their order, all distinguished-label, gluing, initial-block, and record-placement multiplicities are bounded by a fixed polynomial in total size times $C^b$, where $b$ is the atom count and the exponential base $C$ does not depend on $K$ or the moment order. In the coarse regime the same choices cost a power of the cutoffs with exponent $O \( rho \)$, in addition to the exponential atom factor.]
] <lem:diagram-labels>

#proof[
  First expand each $g_i$ using its finite definition all the way to time zero, only for this algebraic argument. Each slab block and each initial cumulant block has a weight depending only on its labels. The restrictions on its size and excess are componentwise. Every global component contains a designated root, since each slab block meets a root in the interface above it. On distributing $j$ fresh labels among component sizes $j_1 \, dots.h \, j_q$, the coefficient is
  $ frac(1, j !) frac(j !, j_1 ! dots.h.c j_q !) = product_(a = 1)^q frac(1, j_a !) . $
  All integrations and all remaining restrictions consequently factor. Grouping the components proves (4.20). Ordinary finite partition inversion gives its cumulant assertion. A one-root resummation contracts a history attached to the rest through one particle line at its top. It cannot split or merge global components, so the same assertion holds after those resummations.
  For the counting statement, the only labels in a slab that are not fresh are the designated roots or labels continued through an interface. Their number is bounded when $rho$ and the observation list are fixed, proving the first assertion in (4.21); the second follows from $n ! \/ \( n - d \) ! lt.eq n^d$. Choosing or matching boundedly many such labels costs a fixed power of total size. The same is true of the initial link vertices and the segments carrying a fixed list of observations. There are $2^b$ C/O flag choices. Once an ordered C/O graph is fixed, its C components determine the autonomous collision clusters and its selected O forest determines their blocks. There is no further arbitrary partition of all ordinary lines. The forest exploration has at most one branch per selected forest. Thus no additional factorial or order-dependent exponential base is introduced by these operations. At unbounded complexity the same argument bounds each distinguished choice by a power of the maximum slab size; its exponent is controlled by the crossing and initial-link counts. This is the stated cutoff power, consistent with the molecule count in 10. ◻
]

=== 4.5 Variation errors and removal of high complexity <variation-errors-and-removal-of-high-complexity>

The next estimates use the coarse, positive history-integral item of 10. There is no use of a comparison between the true and pasted dynamics in this subsection.

#thm([Lemma 4.8.])[
  (Stopped variation errors).  #emph[Choose $L$ sufficiently large in terms of the fixed data and $Gamma$. For any fixed bound on the number of recorded labels, there are $c_i > 0$ such that 
#[#set math.equation(numbering: n => "(4.22)")
 $ parallel F_(i \, S)^R - hat(F)_(i \, S)^R parallel_(upright("TV")) lt.eq e^(- c_i Lambda_i) \, #h(2em) \| S \| lt.eq A_i \/ 2 . $ <eq:retained-variation-error>]

 The constants may decrease with $i$ and the fixed record bound. The statement is uniform for a partial final slab. No velocity weight is claimed for this error.]
] <lem:stopped-variation>

#proof[
  Write $Delta_i = F_i - hat(F)_i$. By 14,
  #[#set math.equation(numbering: n => "(4.23)")
   $ Delta_i = R_i + cal(L)_i Delta_(i - 1) \, #h(2em) \| R_i \| lt.eq cal(E)_i F_(i - 1) . $ <eq:variation-recursion>]
  The initial difference is zero. In the positive stopped bound substitute $F_(i - 1) = hat(F)_(i - 1) + Delta_(i - 1)$, take absolute values, and expand the retained part as in 17. Use the initial tree domination and 16. Refining autonomous histories into C graphs and selecting one incoming contact for every incompatibility gives exactly the positive C/O histories of the coarse package, with their previous-interface continuations. The only top-slab difference is a stopped component with between $M_i$ and $2 M_i - 2 < Lambda_i$ clusters. Hence the same coarse family contains it, and its atom count is at least $M_i - 1$.
  Here are the bookkeeping losses in this application. The independent inputs from the lower-layer expansion have already been resummed into $g_(i - 1)$ (and earlier $g$’s). We do not resum any component of the positive stopped forest in the top slab. Every top component that fails the continuation condition is covered by the retained root-deficit bound in 11(i), at total cost $epsilon.alt^(- C_(*) \| S \|)$. To satisfy the bottom continuation condition on a required record line that has no physical initial link, use 11. Equivalently, add an independent, unit-mass, positive Gaussian Bol input on a straight line continued from zero to the top, and connect it to that line by (4.19). Since this kernel is at least $epsilon.alt^upsilon$, insertion costs at most $epsilon.alt^(- upsilon)$; the new activity and top-root normalization cancel. Only boundedly many such lines are needed. The $A_i \/ 2$ slack accommodates them. They are used only in this upper bound.
  The remaining label and initial-block factors are the cutoff powers in 18. The coarse bound therefore gives, after summing complexities and atoms,
  #[#set math.equation(numbering: n => "(4.24)")
   $ parallel cal(E)_i hat(F)_(i - 1) parallel_(upright("TV")) lt.eq epsilon.alt^(- C_(*) \| S \| - C_m) sum_(b gt.eq M_i - 1) \( C tau^(c_0) \)^b sum_(rho gt.eq 0) \| log epsilon.alt \|^(C_(*) rho) epsilon.alt^(c_(*) rho) lt.eq e^(- c Lambda_i) . $ <eq:stopped-coarse-estimate>]
  In this display $c_0 \, c_(*) > 0$ are the fixed coarse exponents; absorbed constants can depend on $L$ and the fixed observation list. Choose $L$ so that $C tau^(c_0) < 1$. For small $epsilon.alt$ the complexity series is geometric. Finally $Lambda_i = A_i^30$ and $A_i gt.eq \| log epsilon.alt \|$ imply $A_i log \( 1 \/ epsilon.alt \) = o \( Lambda_i \)$, so the displayed top losses are absorbed in the exponential size gain.
  All input orders are at most $\( \| S \| + 1 \) Lambda_i^2 \/ 2 < A_(i - 1) \/ 2$. The terms involving $Delta_(i - 1)$, both in the stopped bound and in (4.23), are bounded by (4.14). The induction hypothesis and
  $ A_i Lambda_i^2 log \( 1 \/ epsilon.alt \) = o \( Lambda_(i - 1) \) \, #h(2em) A_(i - 1) = Lambda_i^30 \, $
  absorb these terms into an error smaller than $e^(- c Lambda_i)$. This proves the induction. Restricting all times in the last slab to a subinterval preserves every upper bound just used, proving the partial-slab assertion. ◻
]

#thm([Theorem 4.9.])[
  (Marked component expansion).  #emph[Choose $Gamma$ and then $L$ as above. These choices are independent of the moment order and the fixed observation list. On this single pasted dynamics the following statements hold.]
  + #emph[The factorial hierarchy with any fixed finite list of records has the finite componentwise expansion (4.17), with the variation error (4.22). Its independent inputs are the $g_i$ in 16; its label weights, continuations, and record projections are those of Lemma 4.6, Lemma 4.7.]
  + #emph[At each fixed final order $h$, the actual normalized marked factorial cumulant $c_h^epsilon.alt$ is the sum of retained globally connected diagrams, plus an error of total variation at most $C_h e^(- c Lambda_L)$. A nontrivial initial cumulant block is part of this connectivity. Dummy links are not.]
  + #emph[For any fixed accuracy power $P$, one can choose a constant $K$ after the observation list and $h$ such that all remaining retained diagrams with $rho > K$ have summed absolute variation at most $epsilon.alt^P$. At $rho lt.eq K$ the original fresh-label factorials satisfy (4.21). Neither increasing $K$ nor increasing a fixed moment order changes the exponential base per ordinary atom in the preceding estimates.]
] <thm:marked-expansion>

#proof[
  The first assertion combines the preceding propositions and lemmas. For the second, apply factorial-cumulant inversion to the actual and retained hierarchies. Formula (4.20) gives precisely the connected sum for the latter. Every term in the difference of the two finite partition polynomials has a factor $Delta_(L \, B)$. The actual normalized factorial measures have mass at most one: initially this follows from the insertion bound in 3, and the dynamics preserves $N$. The retained measures therefore have variation at most $1 + e^(- c Lambda_L)$ at fixed orders by 19. This proves the stated cumulant error.
  For the third assertion use the coarse bound on each resummed core, with the same fixed record and top-root losses used in (4.24). Independent top singleton factors are bounded by 16. For sufficiently small $epsilon.alt$, $\| log epsilon.alt \|^(C_(*) rho) epsilon.alt^(c_(*) rho) lt.eq epsilon.alt^(c_(*) rho \/ 2)$. After summing the geometric atom factor, the sum with $rho > K$ is at most
  $ C_(h \, m) epsilon.alt^(- C_(*) h - C_m) epsilon.alt^(c_(*) K \/ 2) . $
  Increase $K$ to make this at most $epsilon.alt^P$. Adding the boundedly many dummy lines changes the complexity by a fixed amount and is absorbed by the same choice. Remove these artificial lines before applying any low-complexity asymptotics.
  All root-order and observation choices in this reasoning occur in the cutoff powers of the complexity estimate or in the fixed polynomial factors of (4.21). The exponential atom bases come from the fixed graph-counting and Bol bounds, with $Gamma$ fixed first. Thus the required choice of $L$ is independent of each subsequently fixed order. This completes the proof. ◻
]

=== 4.6 Terminal witnesses without observed roots <terminal-witnesses-without-observed-roots>

The comparison with true dynamics in 7 requires a positive version of the expansion with a connected final collision witness instead of observed outputs. We record that consequence now; like the marked expansion, it requires no bound on the cutoff probability.

#thm([Corollary 4.10.])[
  (Terminal-witness expansion).  #emph[In slab $i$, let a terminal witness be a connected true C history on $n lt.eq 3 Lambda_i$ incoming labels, of excess at most $2 Gamma$, stopped at a contact time in that slab. It may carry arbitrary further nonnegative realizability restrictions. Sum its indicator with the full activity normalization 
#[#set math.equation(numbering: n => "(4.25)")
 $ sum_n frac(mu^n, n !) integral F_(i - 1 \, n) \( upright(d) Z_n \) thin upright(bold(1))_(upright("terminal witness")) \( Z_n \) . $ <eq:terminal-witness-functional>]

 For the terminal classes in 11(ii), this expression has the preceding retained layer expansion, with independent $g$ inputs and initial blocks. All lower C/O components attach through particle lines to the terminal witness. The preceding variation error is smaller than every fixed power of $epsilon.alt$. After the artificial-top-root normalization cost $mu$, the coarse part with $rho > K$ can also be made smaller than any assigned power by choosing $K$ sufficiently large. The remaining low-complexity witness integrals retain their realizability restrictions.]
] <cor:terminal-witness>

#proof[
  Here $n lt.eq 3 Lambda_i < A_(i - 1) \/ 2$ for small $epsilon.alt$, so substitute the preceding-interface expansion from 20 in (4.25). Every lower slab component contains a root leading to the slab above, and the final set of those lines enters the connected witness. This proves the attachment assertion before discarding any initial link. The contribution of the preceding variation error is bounded by
  $ sum_(n lt.eq 3 Lambda_i) frac(mu^n, n !) e^(- c Lambda_(i - 1)) lt.eq e^(C Lambda_i log \( 1 \/ epsilon.alt \) - c Lambda_(i - 1)) \, $
  which has the claimed smallness. Arbitrary witness restrictions are indicators and are kept in the positive integrals. Designating an artificial top root places the remaining diagrams in the stated terminal-error class when there is a dependent continuation below; removing its normalization costs $mu$. If there is no such continuation, the diagram has only its terminal slab with independent inputs, and its complexity is at most $1 + 2 Gamma$. The same geometric complexity summation as in the proof of 20, with this additional fixed power, proves the last assertion. For $i = 1$ there is no preceding variation error; the identical argument starts directly from the initial cumulant expansion. Nothing here compares true and pasted evolutions. ◻
]

== 5 Sharp bounds and the limiting tree measures <sec:sharp-asymptotics>

This section proves the estimate at the fluctuation scale. The estimates imported from #cite(label("DHM2025")) are used through 20 only to remove large complexity and expansion remainders. The sharper estimate for the diagrams that remain is proved below by a change of relative translations. Sharp connected cumulants and minimal-tree limits are central to the short-time fluctuation theory of #cite(label("BGSS2023")). The present section must establish the uniform bounds and summability needed on the full regular kinetic interval.

=== 5.1 Conventions and the assertion <conventions-and-the-assertion>

Fix a finite list of observation times and bounded continuous observation functions. When observations are accumulated in a mark, its update is $y mapsto y + phi.alt_j \( x \, v \)$, so that $\| y \| lt.eq M$, with $M$ independent of the number of particles. More generally, one may retain a finite list of phase points along each designated trajectory. A record is retained only along a line on which it is required. Forgetting part of a record means pushing the corresponding measure forward under its coordinate projection. This operation commutes with the finite hierarchy before the independent factors are regrouped, by 20.

Let $c_h^epsilon.alt$ denote the ordered, normalized factorial cumulant measure of the pasted process, including these records on its $h$ designated particles. Thus $c_1^epsilon.alt$ is its one-particle measure, and the normalization of an $h$-particle factorial measure is $mu^(- h)$. Constants with a subscript $K$ below may depend on a fixed upper bound $K$ for complexity, on the fixed observations, and on $L$. The constant in an exponential factor $C^n$ will not depend on $K$.

The independent factors supplied by 16 satisfy, for some $b > 0$ and $B_0 < oo$,

#[#set math.equation(numbering: n => "(5.1)")
 $ sup_(0 < epsilon.alt lt.eq epsilon.alt_0 \, thin i) parallel g_i parallel_(upright("Bol") \, b) lt.eq B_0 \, #h(2em) parallel g_i - f_(i tau) parallel_(upright("Bol") \, b) arrow.r 0 . $ <eq:sharp-input-bounds>]

We decrease $b$ a fixed number of times when reserving Gaussian weights. This does not change the choice of the microscopic dynamics.

#thm([Theorem 5.1.])[
  (Sharp connected bounds).  #emph[Choose the parameters $Gamma \, L$ as in 20, increasing $L$, if necessary, by an amount depending only on the uniform bounds for the Boltzmann solution and on $T$. This one choice works for every fixed factorial order and every fixed bounded observation list. For each fixed $h$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ parallel c_h^epsilon.alt parallel_(upright("TV")) lt.eq C_h mu^(1 - h) . $ <eq:sharp-full-cumulant>]

 For $h = 1 \, 2$, the measures $mu^(h - 1) c_h^epsilon.alt$ converge against bounded continuous record tests to the signed sums of the retained global trees with trivial initial cumulants. At a contact their weight is the incoming flux $\[ \( v - v_(*) \) dot.op omega \]_(+) thin upright(d) t thin upright(d) omega$; a scattering contact has sign $+ 1$, and a non-scattering contact has sign $- 1$. The independent birth factors are $f_(i tau)$.]
  #emph[The sums of the absolute retained diagram measures, after multiplication by $mu^(h - 1)$, are bounded uniformly with a sufficiently small Gaussian weight in their designated endpoint velocities. The same bound holds for the limiting tree measures, and for the Gaussian weights in finitely many retained record velocities after decreasing the exponent. Among the retained connected diagrams, the sum of the absolute measures having a nontrivial initial cumulant or a global cycle is $o \( mu^(1 - h) \)$. The assertions about Gaussian weights concern retained diagrams and their limits; no weighted estimate for a microscopic expansion remainder is asserted.]
] <thm:sharp-cumulants>

Here and below a global tree is a tree on the particle lines, with a contact as an edge. Continuing one physical line through an interface does not create a new vertex. Different particles newly integrated at an interface have different vertices. This convention is essential for counting both translations and activity factors.

=== 5.2 The finite graph and its numerical data <the-finite-graph-and-its-numerical-data>

Work first with a term of complexity at most $K$ in the finite expansion. Replace each initial cumulant by its bound from 3, in the form

#[#set math.equation(numbering: n => "(5.3)")
 $ C_K sum_(cal(L) upright(" a forest")) product_(\( p \, q \) in cal(L)) (upright(bold(1))_(\| x_p \( 0 \) - x_q \( 0 \) \| lt.eq R_(K \, D) epsilon.alt) + epsilon.alt^D) product_p f_0 \( z_p \( 0 \) \) . $ <eq:sharp-initial-link>]

Only the bounded set of vertices belonging to a nontrivial initial cumulant occurs in $cal(L)$. This replacement is used for absolute bounds, not to assign a sign to an initial link. Expand the parentheses and, initially, suppose all chosen links are physical, namely the indicator terms.

Let $m$ be the number of distinct particle lines, $c$ the number of global components, $p$ the number of physical initial links, and $e_i$ the number of contacts in slab $i$. The initial link graph is a forest. Start with its components and then examine contacts in time order. A contact is a #emph[merger] if its two lines belong to different components immediately before that contact; otherwise call it redundant. Write $a_i$ for the number of mergers in slab $i$, and $r$ for the number of redundant contacts. The elementary forest identities are

#[#set math.equation(numbering: n => "(5.4)")
 $ sum_i a_i = m - c - p \, #h(2em) r = sum_i e_i + p - m + c . $ <eq:sharp-merger-count>]

The second expression is the global cycle excess.

Let $n_i$ be the number of particle lines present in slab $i$, including lines with no contact there, and let $q$ be the sum of the numbers of lines crossing slab interfaces. Then

#[#set math.equation(numbering: n => "(5.5)")
 $ sum_i n_i = m + q \, #h(2em) sum_i \( n_i - a_i \) = q + c + p . $ <eq:sharp-line-count>]

The merger edges in any single slab form a forest on its $n_i$ lines, so $a_i lt.eq n_i$. All of $q \, p \, c \, r$, and hence $n_i - a_i$, are bounded in terms of $K$. To see the assertion for $r$ directly from the layer complexity, glue the layer graphs along their interface lines: the total cycle excess can increase by at most the number of gluings. The layer excesses and these gluings are included in $rho$. Each layer component meets a layer root, so the number of its components is bounded as well. Erasing a bounded number of initial links changes these assertions only by a bounded amount.

There is one independent input velocity and one input position for each of the $m$ birth lines. A continued line has neither a new position variable nor a new velocity variable. The cancellation of activity factors at interfaces, in the normalized factorial expansion, leaves the factor

#[#set math.equation(numbering: n => "(5.6)")
 $ mu^(m - h) . $ <eq:sharp-activity>]

In particular, the birth at an interface of a line supplied by $g_i$ is an independent phase variable, whereas the passage through that interface of a recorded line is a continuation of its old variable.

=== 5.3 Changing the relative translations <changing-the-relative-translations>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.2121, -0.2121), (0.2121, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[$a$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((1.388, 0.7879), (1.812, 1.212), [#set text(hyphenate: false); #align(center + horizon)[$b$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((2.988, 0.7879), (3.412, 1.212), [#set text(hyphenate: false); #align(center + horizon)[$c$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  content((4.588, -0.2121), (5.012, 0.2121), [#set text(hyphenate: false); #align(center + horizon)[$d$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.4pt, miter-limit: 10))
  line((0.2604, 0.1627), (1.34, 0.8373), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.8, 0.5), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$t_1$]]])], anchor: "south-east")
  line((1.907, 1), (2.893, 1), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.4, 1), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$t_3$]]])], anchor: "south")
  line((3.46, 0.8373), (4.54, 0.1627), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4, 0.5), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$t_2$]]])], anchor: "south-west")
  bezier((0, 0), (4.8, 0), (1.71, -0.7614), (3.09, -0.7614), stroke: (paint: rgb("#184069"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((2.4, -0.5711), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$t_4$: redundant]]])], anchor: "north")
  content((6.1, 0.95), [#text(size: 9pt)[$t_1:#h(0.3333em) \{a\} union \{b\} arrow.r.long \{a,b\}$#linebreak() $t_2:#h(0.3333em) \{c\} union \{d\} arrow.r.long \{c,d\}$#linebreak() $t_3:#h(0.3333em) \{a,b\} union \{c,d\} arrow.r.long \{a,b,c,d\}$]], anchor: "west", padding: 0.1176cm)
  content((2.4, -1.25), [#text(size: 9pt)[$t_1<t_2<t_3<t_4$]])
})],
  caption: [Figure 1: Chronological connectivity for four particle lines. Each solid contact joins two previously separate components and fixes one relative translation, with the incoming-flux Jacobian $epsilon.alt^2 B thin upright(d) t thin upright(d) omega$. The dashed contact is internal to the already joined component. Its relative position is fixed, so it contributes a constraint rather than a new translation variable. Later common translations cannot change that constraint. Edges depict the contact graph, not physical trajectories. ],
) <fig:chronological-mergers>

The distinction between a new merger and a redundant contact is illustrated in 1. It refers to the chronological connected components of the contact graph, not to spatial proximity at an unspecified time.

#thm([Lemma 5.2.])[
  (Chronological merger coordinates).  #emph[Fix a finite line graph, the C/O choices, the chronological order, and which contacts are redundant in that order. Away from nontransversal contacts and simultaneous events, its history integral has coordinates consisting of the birth velocities, one absolute translation for each global component, a vector in a ball of radius $R_(K \, D) epsilon.alt$ for each physical initial merger, and $\( t \, omega \) in bb(R) times S^2$ for each dynamic merger. The positional Jacobian at a dynamic merger is 
#[#set math.equation(numbering: n => "(5.7)")
 $ epsilon.alt^2 \[ \( v - v_(*) \) dot.op omega \]_(+) thin upright(d) t thin upright(d) omega . $ <eq:sharp-jacobian>]

 A specified redundant contact has no free continuous parameter and requires no extra Jacobian. The coordinate map has multiplicity at most one on each prescribed incoming straight-segment branch.]
] <lem:sharp-merger-coordinates>

#proof[
  Choose the birth velocities first. Initially every line has an independent translation of its free affine trajectory. An initial forest link determines the difference between the translations of its two groups by a vector in the stated ball. Orient the forest toward one representative per group. The changes from individual translations to representatives and these differences have determinant one.
  Proceed in increasing contact time. Inductively, the histories within each group have been constructed, including all velocity changes before the next merger, and are known up to a common translation of that group. For a merger between groups with translations $X$ and $X_(*)$, the contact condition on the indicated straight segments is
  $ X - X_(*) = - d \( t \) - epsilon.alt omega \, $
  where $d \( t \)$ is the known relative displacement with the translations removed, and $omega$ is opposite to the outward geometric relative normal. Thus incoming contact has $\( v - v_(*) \) dot.op omega > 0$, as in (1.2). On these segments $dot(d) \( t \) = v - v_(*)$. The determinant of the map from time and surface coordinates on $S^2$ to $X - X_(*)$ is $epsilon.alt^2 \| \( v - v_(*) \) dot.op omega \|$. The incoming convention selects the sign in (5.7). A scattering contact applies the elastic velocity reflection; an O contact retains the velocities. The two groups now have one common free translation.
  If the next specified contact is redundant, its relative displacement and velocities on the indicated segments are already fixed. A straight relative trajectory has at most one incoming intersection with the sphere of radius $epsilon.alt$. More precisely, for its relative flight $r \( t \) = d + t u$ on the common segment interval $I$,
  $ integral_I delta \( \| r \( t \) \| - epsilon.alt \) \[ - u dot.op r \( t \) \/ epsilon.alt \]_(+) thin upright(d) t = upright(bold(1))_({ upright("an incoming intersection occurs in ") I }) . $
  At a transversal incoming crossing, the flux cancels the absolute derivative of $\| r \( t \) \| - epsilon.alt$. The outgoing delta factors then make the prescribed C or O substitution. Thus its time and normal, when the prescribed intersection exists, are determined. If it does not exist, the branch has weight zero. This includes segments starting inside the sphere: their outgoing exit is not an incoming intersection. Subsequent translations of the entire group leave this test and its resulting velocity reflection unchanged.
  Every step therefore uses only coordinates fixed at earlier steps. Its derivatives with respect to those earlier coordinates may be nonzero, but the full determinant is triangular and is the product of the displayed diagonal determinants. There is no new unknown relative translation at a redundant step. Contacts at different birth interfaces are treated identically: the affine origins of the new lines differ, but the derivative of their current displacement is still their current velocity. At the end retain one representative translation per global component. On an incoming transversal branch the reverse construction recovers every relative translation, so the multiplicity is one.
  For a finite graph the excluded segment boundaries, equality of two specified times, and zero incoming flux have measure zero in merger coordinates unless they belong to a redundant-contact requirement. Such a requirement is retained as an indicator; no change of variables is performed at it. Equivalently, one may first work on compact subsets of the transversal branches and then exhaust them. This also justifies the formula for nonnegative history integrals without smooth densities. ◻
]

Multiplying (5.6) by the merger Jacobians and the physical link volumes gives

#[#set math.equation(numbering: n => "(5.8)")
 $ mu^(m - h) epsilon.alt^(2 \( m - c - p \)) epsilon.alt^(3 p) = mu^(c - h) epsilon.alt^p . $ <eq:sharp-scaling>]

All history acceptance indicators can be retained during the coordinate change. For an upper bound they can subsequently be dropped, except that a redundant scattering is used to determine the velocities of its specified branch when it occurs. Dropping the requirement of its occurrence is understood as extending the resulting integrand by zero off that branch, not as assigning an arbitrary additional velocity.

For a connected diagram $c = 1$. A nontrivial physical initial block has $p gt.eq 1$, and thus gains at least one factor $epsilon.alt$. If a term in (5.3) instead uses a tail factor, erase that link. Erasing at most $K$ links increases the number of components by at most $K$, and the extra activity cost in (5.8) is at most $epsilon.alt^(- 2 K)$. Choosing $D > 2 K + M$ makes the terms with at least one such tail $O \( epsilon.alt^M mu^(1 - h) \)$. Here $M$ is arbitrary and is chosen after the required moment order. The constants in a physical link radius and the forest count involve only boundedly many links.

=== 5.4 Factorials and a summable majorant <factorials-and-a-summable-majorant>

#thm([Lemma 5.3.])[
  (The fresh-label factorials).  #emph[For diagrams of complexity at most $K$, the absolute sum with slab sizes $\( n_1 \, dots.h \, n_L \)$ is bounded by a sum over chronologically ordered merger pair lists with denominator $product_i n_i !$, multiplied by 
#[#set math.equation(numbering: n => "(5.9)")
 $ C_K \( 1 + n \)^(d_K) C^(sum_i a_i) \, #h(2em) n = sum_i n_i \, $ <eq:sharp-polynomial-count>]

 where the base $C$ does not depend on $K$. The merger pairs themselves are not counted in (5.9).]
] <lem:sharp-factorials>

#proof[
  In slab $i$, let $s_i$ be the number of labels arriving as roots from above, including the final designated roots in the highest slab. The finite factorial expansion integrates $j_i = n_i - s_i$ new labels with coefficient $1 \/ j_i !$. Since $s_i lt.eq K$,
  $ frac(1, j_i !) = frac(n_i !, \( n_i - s_i \) !) frac(1, n_i !) lt.eq frac(\( 1 + n_i \)^(s_i), n_i !) . $
  The choices of continued labels, dependent subsets, and labels in initial links all involve boundedly many labels; their number is a fixed power of $1 + n$.
  The rooted compatibility expansion in 20 represents each connected cluster coefficient by spanning forests. Its deterministic exploration gives at most one branch per selected forest. After selecting an incoming encounter for each chosen forest edge, the C components are exactly the isolated collision clusters; the O forest specifies their blocks. Consequently these partitions are recovered from the C/O graph and do not furnish a further partition factor. The retained unexpanded independent factors and the continued labels specify the lower-slab attachment. This is also why taking a tree bound for a compatibility coefficient does not remove the fresh-label denominator.
  There are at most $r lt.eq C_K$ redundant contacts. Their ordered pair labels cost at most $\( 1 + n \)^(2 r)$, and inserting them among the merger contacts costs at most $\( 1 + n + r \)^r$. Initial forests and the choices of the bounded exceptional labels have the same polynomial form. Each ordinary contact has at most two C/O flags, which gives an absolute exponential base. A chronological order already determines the order of contacts on every line; it has no separate permutation factor. These observations give (5.9). The bounded exceptional counts alter $C_K \, d_K$, not the base multiplying each ordinary merger. ◻
]

#thm([Lemma 5.4.])[
  (Uniform summability).  #emph[For fixed $K$, the sum of the absolute connected diagram measures with slab sizes $\( n_i \)$, after removal of the factor $mu^(1 - h)$, is bounded by 
#[#set math.equation(numbering: n => "(5.10)")
 $ C_K \( 1 + n \)^(d_K) \( C tau sqrt(L) \)^n . $ <eq:sharp-summable>]

 The same bound, with the appropriate factor $mu^(c - h)$, holds after a bounded number of initial links are erased. It also holds after prescribing the absolute spatial position of one observation in each component, or after inserting a sufficiently small Gaussian weight in the designated velocities.]
] <lem:sharp-summability>

#proof[
  We give the energy and time estimates jointly, to avoid putting a separate logarithmic velocity loss at each vertex. Let $E_0 = sum_(p = 1)^m \| v_p^(upright("birth")) \|^2$. Elastic collisions conserve the energy of each colliding pair, O contacts do not change it, and a line ending at an interface discards its energy. Introducing a birth adds the energy already included in $E_0$. Hence the sum of squared velocities of all lines active at any time is at most $E_0$.
  On the bin $E_0 in \[ P \/ 2 \, P \]$, with the bin $E_0 < 1$ included by using $P = 1$, the one-step sum of incoming speed factors over all choices of a merger pair in slab $i$ satisfies
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(p < q) \| v_p - v_q \| lt.eq \( n_i - 1 \) sum_p \| v_p \| lt.eq n_i^(3 \/ 2) sqrt(P) . $ <eq:sharp-pair-flux>]
  This estimate is applied to a discrete tree of successive pair choices at fixed merger times, normals, and birth velocities. At a node, all earlier velocities and all intervening specified redundant contacts are already determined by 23. The sum of the weights of its children is bounded by (5.11); an unrealizable child contributes zero. Induction over that discrete tree bounds the sum of the products of fluxes by
  #[#set math.equation(numbering: n => "(5.12)")
   $ product_i \( n_i^(3 \/ 2) sqrt(P) \)^(a_i) . $ <eq:sharp-pair-products>]
  Integrating the normals adds $C^(sum_i a_i)$. The merger times are globally ordered within each slab, even if some redundant times are inserted between them. Dropping further constraints leaves time volume at most $product_i tau^(a_i) \/ a_i !$.
  There remains a common translation for each component. For any fixed birth velocities and merger coordinates, write the spatial arguments of its inputs as $X + d_p$. Integrate one chosen input in $X$ and use the spatial supremum of every other input. The Bol norms in (5.1) give a factor at most $C^m exp \( - b E_0 \)$. This bound is independent of the displacements $d_p$, which can be large. To prescribe an observation position instead, solve $X = x - d_(upright("obs"))$ and use a spatial supremum for every input. The Jacobian is one and the same Gaussian bound holds uniformly in $x$.
  We spell out the velocity-volume step. By reserving half of the Gaussian suppression, for a suitable $b_1 > 0$,
  $ upright(bold(1))_(E_0 in \[ P \/ 2 \, P \]) e^(- 2 b_1 E_0) lt.eq e^(- b_1 P \/ 2) e^(- b_1 E_0) . $
  The integral of the last factor over the $3 m$ birth velocity coordinates is $\( pi \/ b_1 \)^(3 m \/ 2)$. On the lowest bin $E_0 < 1$, omit the dyadic suppression factor and use $P^(a \/ 2) = 1$; integrating the reserved Gaussian still costs only $C^m$. Thus no uncounted power of the energy-bin volume remains. If $a = sum_i a_i$, summing the dyadic energy bins yields
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_(P = 1 \, 2 \, 4 \, dots.h) e^(- b_1 P \/ 2) P^(a \/ 2) lt.eq C^(a + 1) \( 1 + a \)^(a \/ 2) . $ <eq:sharp-energy-sum>]
  For example, comparison with the integral of $e^(- b_1 u \/ 4) \( 1 + u \)^(a \/ 2)$ proves this by the gamma integral and Stirling’s inequality. Its constant depends on $b_1$, not on $K$.
  Combining these estimates with 24, the remaining quantity is bounded by a fixed polynomial in $1 + n$ times
  #[#set math.equation(numbering: n => "(5.14)")
   $ C^(n + a) tau^a \( 1 + a \)^(a \/ 2) product_i frac(n_i^(3 a_i \/ 2), a_i ! n_i !) . $ <eq:sharp-before-stirling>]
  Set $delta_i = n_i - a_i$. By (5.5), $delta_i gt.eq 0$ and $sum_i delta_i lt.eq C_K$. The inequalities $n_i ! \/ a_i ! lt.eq \( 1 + n_i \)^(delta_i)$ and $n_i ! gt.eq \( n_i \/ e \)^(n_i)$ imply
  $ frac(n_i^(3 a_i \/ 2), a_i ! n_i !) lt.eq e^(2 n_i) \( 1 + n_i \)^(delta_i) n_i^(- n_i \/ 2) \, $
  where zero counts contribute one. Also $tau^a lt.eq tau^n max \( 1 \, tau^(- 1) \)^(C_K)$, and $\( 1 + a \)^(a \/ 2) lt.eq C \( 1 + n \)^(C_K) n^(n \/ 2)$, after adjusting the bounded-size cases. Finally convexity of $u log u$ gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ product_i n_i^(n_i) gt.eq \( n \/ L \)^n . $ <eq:sharp-layer-entropy>]
  Substitution in (5.14) proves (5.10).
  At a fixed time the sum of squared designated velocities is at most $E_0$. At $q_0$ record times their total is at most $q_0 E_0$. A weight with exponent smaller than $b_1 \/ \( 2 max \( 1 \, q_0 \) \)$ can therefore be absorbed in the Gaussian factor reserved above. This proves the weighted assertions. The exponent is chosen so that the fraction of birth Gaussian reserved for all record times together is fixed; the exponential base therefore does not grow with the number of observations. The powers supplied by initial physical links and erased links are those already computed in (5.8) and do not affect the summation argument. ◻
]

Since $tau = T \/ L$, the base in (5.10) is $C T \/ sqrt(L)$. Increase $L$ once so it is less than one. The number of vectors $\( n_i \)$ of total size $n$ is a polynomial in $n$, since $L$ is fixed. Thus (5.10) proves uniform summability and uniform vanishing of the size tails for every fixed $K$. Polynomial degrees may grow with the factorial order; this never requires another enlargement of $L$.

=== 5.5 The extra-contact null sets <the-extra-contact-null-sets>

We next prove the qualitative geometric fact needed for cycles. Only a fixed finite graph is considered in this subsection. All birth velocities, contact times, merger directions, and one free translation per component are its independent parameters. They carry a measure absolutely continuous with respect to the product of Lebesgue measure and surface measure. An assertion concerning lines within the same connected component is invariant under its common translation and remains valid when one observation position in that component is fixed as in 25. No conditioning on additional positions or velocities is used in the null-set argument.

#thm([Lemma 5.5.])[
  (No extra contact for a limiting tree).  #emph[Consider a finite chronological forest with no physical initial links, with a prescribed C/O choice on each edge, on its incoming merger branches. Outside a null set of its merger parameters the following hold.]
  + #emph[All specified contacts occur at distinct times away from interfaces and observation times and are transversal.]
  + #emph[Before the first redundant contact, the demand for such a contact is false for all sufficiently small $epsilon.alt$.]
  + #emph[On a full tree, an additional contact not in the prescribed list, including a contact preceding the prescribed joining of its two groups, is absent for all sufficiently small $epsilon.alt$.]
  #emph[In (ii), the independent parameters used are those of the forest prefix; arbitrary remaining merger parameters may be appended. In (iii), an outgoing crossing following an O contact is not an additional contact, because only incoming crossings are counted.]
] <lem:sharp-no-extra>

#proof[
  For clarity first set $epsilon.alt = 0$ in the formal trajectories. At each prescribed C contact the velocities are transformed by the linear reflection of the pair velocity in its contact direction; at an O contact they are unchanged. Every segment velocity is therefore polynomial in the birth velocities and in the coordinates of the sphere directions. A segment displacement is polynomial also in the prescribed times. The parameters lie on the connected real analytic manifold given by the product of their Euclidean spaces, the spheres, and an open time simplex. Consequently a polynomial expression that is not identically zero has a null zero set. It is legitimate to use grazing or ineffective reflections to test nonidentity: the reflection formulas extend analytically to those parameters, although the physical flux there may vanish.
  There are finitely many pairs of lines and finitely many pairs of their straight segments. On a common time interval write their relative displacement as $d + t u$. A coincidence on this interval requires
  #[#set math.equation(numbering: n => "(5.16)")
   $ d times u = 0 . $ <eq:sharp-collinearity>]
  We check the only cases in which this condition could be forced. If the two lines belong to different forest components, variation of their free relative translation disproves the identity (5.16) immediately. The assertions used for the first redundant contact and for a connected full tree concern lines in the same component, as treated next.
  Suppose first that the lines are not neighbors in the prescribed tree. Make all reflections ineffective. If the unique joining path is $p_0 \, p_1 \, dots.h \, p_k$, $k gt.eq 2$, with its edge contact times $s_1 \, dots.h \, s_k$, then solving the contact equations gives the endpoint displacement as a sum of terms $\( v_(p_(j - 1)) - v_(p_j) \) s_j$, plus the endpoint free-flight term. For $1 lt.eq j < k$, the independent velocity $v_(p_j)$ occurs with coefficient $s_(j + 1) - s_j$, up to an immaterial common sign. These two times are distinct. Set the endpoint relative velocity nonzero and vary this intermediate velocity in a direction not parallel to it. This disproves the identity (5.16). Branches off the path and birth interfaces do not alter this test: ineffective reflections leave their velocities unchanged, and birth times only alter the affine origins solved for by the contact equations.
  Suppose next that the two lines are neighbors and have their prescribed meeting at time $a$. On segments after $a$, if neither endpoint has subsequently changed velocity, their flight is the single separating relative flight from that meeting. It cannot give a second incoming crossing, either at zero diameter or at positive diameter. This includes an O contact: its relative flight passes through the sphere and exits once, but does not enter it a second time without a velocity change.
  If an endpoint has a subsequent scattering at time $b$, take the first effective such scattering in testing nonidentity and make all other reflections ineffective. Its third particle is distinct from the original pair, since another edge between that pair would form a cycle. With all other reflections ineffective, this third particle’s current velocity equals its independent birth velocity, even if it has a prescribed earlier history. One can choose this velocity and the scattering normal so that the relative velocities of the original pair before and after $b$ are two nonparallel vectors $u_1 \, u_2$. Their displacement on the later segments then contains
  $ \( b - a \) u_1 + \( t - b \) u_2 . $
  Its cross product with $u_2$ is nonzero, since $b eq.not a$. For an explicit choice, keep the untouched endpoint at velocity zero, take the other endpoint’s velocities to be $e_1$ before and $e_2$ after the scattering, and use a third-particle velocity $- e_1$ with normal $\( e_1 - e_2 \) \/ sqrt(2)$. The equal-mass reflection gives the stated outgoing endpoint velocity. This again disproves (5.16). For a segment before the neighboring pair’s prescribed meeting, choose an intervening scattering time $b < a$ with the same change from $e_1$ to $e_2$. Before $b$, the relative displacement required to meet at $a$ is
  $ \( t - b \) e_1 - \( a - b \) e_2 \, $
  which is not parallel to the segment relative velocity $e_1$. With no intervening reflection the earlier relative flight has only its prescribed incoming crossing. This proves the earlier-segment case without any condition on time-reversed feasibility.
  These arguments use the entire tree and therefore also exclude an unintended earlier contact between groups whose relative translation is fixed only by a later prescribed merger. For a first required redundant contact, they need only the joining tree in the prefix: the two lines are already in the same group, and all their relative parameters are fixed there. Adding parameters belonging to the rest of the graph preserves a null exceptional set by Fubini’s theorem.
  Zero relative velocities and grazing prescribed contacts have null parameter sets. Indeed the incoming relative velocity at a merger is the difference of velocities from two disjoint previous groups; it is not an identically zero linear function of their independent birth velocities. The normal is a free sphere parameter. Specified time coincidences, including equality with an interface or an observation time, have null time measure. A third line at a prescribed vertex has no forced coincidence: at least one of its paths to the two incident lines is a nonneighbor path, to which the intermediate-velocity argument applies. Endpoints of line lifetimes at interfaces are treated by the same finite-segment test. We discard this finite union of null sets.
  It remains to justify that an absent zero-diameter coincidence excludes positive-diameter contacts, particularly contacts converging to a prescribed vertex. For fixed merger times, directions, and birth velocities the formal tree velocities do not depend on $epsilon.alt$. Write each line as $x_p \( t \) = X_p + Y_p \( t \)$, with $Y_p$ determined by its velocities. The edge equation is
  $ X_p - X_q = - epsilon.alt omega_(p q) - Y_p \( s_(p q) \) + Y_q \( s_(p q) \) . $
  Solving these equations along the forest shows that, after fixing its representative translations,
  #[#set math.equation(numbering: n => "(5.17)")
   $ x_p^epsilon.alt \( t \) = x_p^0 \( t \) + epsilon.alt d_p \, $ <eq:sharp-uniform-tree-convergence>]
  where each $d_p$ is a fixed finite sum of merger normals. Thus convergence is uniform on every active line interval.
  Away from small neighborhoods of the finitely many prescribed vertices, every pair of closed straight-segment pieces either has a strictly positive minimal separation or is the already treated separating flight of a neighboring pair. For sufficiently small diameter no new contact can occur there. Near a prescribed vertex, a different pair would require an additional zero-offset pair coincidence, already excluded by the finite-segment argument. This includes a third-particle coincidence at that vertex and a disjoint pair coinciding elsewhere at the same time. The incident pair has no other velocity change in a sufficiently small fixed neighborhood, because all event times are distinct. It has only the one prescribed incoming crossing on that neighborhood. In particular two incoming crossings cannot collapse onto that vertex. The same compactness argument applies to interfaces and observation times. This proves (ii) and (iii), including contacts whose times vary with $epsilon.alt$. ◻
]

For a graph containing a cycle, keep its first redundant-contact indicator. All preceding contacts form a forest, and the relative trajectory tested by this indicator is determined by that forest prefix. No later redundant-contact velocity update enters this test. By 26 it tends to zero for almost every choice of the independent parameters preceding that contact. After a finite size truncation, velocities and representative translations can first be truncated as well. On those compact sets the integrands after 23 have an integrable bound, obtained either directly from the finitely many speed factors or from the proof of 25. One can extend an unrealizable branch by zero. Dominated convergence therefore makes the scaled absolute integral tend to zero. The velocity and spatial truncations are then removed by the Gaussian bounds and the uniform spatial tightness supplied by the Bol-norm convergence in (5.1), and finally the size truncation is removed using (5.10). This order of limits needs no rate uniform in the number of vertices. Together with (5.8), it proves the asserted little-o for cycles and nontrivial initial cumulants.

=== 5.6 Tree convergence and spatial disintegration <tree-convergence-and-spatial-disintegration>

For a fixed tree all its prescribed C-clusters and O blocks are below their cutoffs once $epsilon.alt$ is small. By 26, almost every set of merger parameters has only the prescribed incoming contacts for all sufficiently small $epsilon.alt$. Thus all history acceptance restrictions then hold, and counting a selected encounter instead of its existence changes nothing. The connected compatibility coefficient on this configuration is exactly its tree sign $\( - 1 \)^(\# O)$. There is no nontrivial initial link. The changes of relative translations therefore leave precisely the fluxes in 22, after multiplication by $mu^(h - 1)$.

Replacing each $g_i$ by $f_(i tau)$ in a fixed-size term is justified by a telescoping product and (5.1). The proof of 25, with one of the factors replaced by its Bol-norm difference, gives convergence to zero for that difference. For these continuous limiting inputs, (5.17) and the absence of contacts at observation times give convergence of every bounded continuous record test. The remaining dominated convergence in spatial translations can be checked first on bounded velocities and bounded size. On that set the relevant input displacements are bounded; the summable cell envelopes in the Bol norm control the spatial tails uniformly. Then use 25 to remove the truncations. This defines the limiting signed tree measures.

#thm([Lemma 5.6.])[
  (Spatial traces of tree measures).  #emph[Let $cal(T)$ be any of the absolutely summable tree measures just constructed, and designate a line and a time at which its position is required. It has a version of the disintegration 
#[#set math.equation(numbering: n => "(5.18)")
 $ cal(T) = upright(d) x thin cal(T)_x $ <eq:sharp-disintegration>]

 with respect to that position. For a sufficiently small $alpha > 0$, the Gaussian-weighted variation of $cal(T)_x$ is bounded uniformly in $x$; its integral over $x$ is finite. For every bounded continuous test of the other coordinates, and also for continuous tests of smaller Gaussian growth, $x mapsto cal(T)_x \( Phi \)$ is continuous.]
  #emph[If two separate tree components are joined at their designated positions, the product of their conditional measures at a common position, integrated against incoming flux, is an absolutely defined measure. It is the result of imposing the joining position in the merger coordinates. Equivalently it is obtained by a smooth approximate identity for equality of the two positions. These facts apply to the marked one-root and connected two-root tree measures and their record projections.]
] <lem:sharp-spatial-traces>

#proof[
  For a finite tree choose its free representative translation to be the position $x$ of the designated observation. Every birth position is then $x + d_p$, and every recorded position has the same form, with displacements independent of $x$. The derivative in the representative translation is the identity. This constructs (5.18) as an actual integral formula, not just as an almost-everywhere equivalence class. The fixed-position and integrated versions of 25 give both asserted variation bounds.
  After truncation in size and velocity, the integrand against a continuous record test is continuous in $x$, by continuity of the limiting inputs and the observation updates. It has the same integrable majorant uniformly for $x$ in a compact set. The velocity tails and the graph-size tails converge uniformly in $x$, by the fixed-position estimate. This proves the stated continuity. Gaussian growth in the test is handled by reserving a slightly stronger Gaussian weight first.
  Let the designated variables in two different components have positions $x \, x_(*)$. Their joint integral before joining uses two independent translations and the product measure. Setting $x_(*) = x$ gives the claimed conditional product. The bound $B \( v - v_(*) \, omega \) lt.eq \| v \| + \| v_(*) \|$, with a slight Gaussian exponent loss, makes its variation finite: use the uniform conditional bound for one component and the integrated bound for the other. The same estimate dominates a compactly supported smooth approximate identity in $x - x_(*)$, uniformly in its width. On bounded velocity sets conditional weak continuity implies convergence of the product measures against continuous tests; products of continuous single-component tests suffice first, and their finite sums approximate a continuous test on each compact set. The Gaussian and spatial variation bounds then remove the compact truncations. This proves the approximate-identity characterization and its agreement with merger coordinates. Forgetting records commutes with every displayed integral. ◻
]

=== 5.7 Completeness and splitting of the retained trees <completeness-and-splitting-of-the-retained-trees>

The preceding size limit was taken with bounded complexity. It is necessary to verify that a fixed sufficiently large complexity cutoff includes every leading tree allowed by the regrouping rule, even though it may have arbitrarily many ordinary vertices.

#thm([Lemma 5.7.])[
  (Completeness of the tree class).  #emph[For fixed designated roots, fixed required records, and fixed $L$, all global trees with trivial initial cumulants in the retained expansion after the one-root regrouping of 17 have complexity at most a fixed constant $K_0$. This bound is independent of their number of ordinary contact vertices. Undoing and reapplying an unmarked one-root regrouping preserves their weights and their record projections.]
] <lem:sharp-tree-completeness>

#proof[
  We first prove that an unmarked dependent one-root component cannot be a tree with trivial initial cumulants. In its highest occupied slab, a one-root component has a single connected block. If all lower inputs of this block are independent, it is precisely a term in the definition of $g_i$, and is regrouped into that independent factor. If a connected lower dependent component attaches to the block through two lines, the upper connection between these lines and their lower connection form a global cycle. For a global tree, every lower dependent component therefore attaches through at most one line. At least one such component must exist for the upper one to remain dependent. Following it downward repeats the same argument on a smaller number of slabs. At time zero there is no dependent singleton, and a dependent nonsingleton requires a nontrivial initial cumulant. This contradiction proves the claim by downward induction. Required records are the only reason to expand an otherwise independent singleton history further.
  Now cut a global forest at an interface and contract each of its upper components to a vertex. Suppose there are $u$ such vertices. A lower connected component with $k gt.eq 2$ attachments cannot touch the same upper component twice, since that creates a cycle. The bipartite incidence graph of these lower components and the upper vertices is a forest. If there are $v$ lower vertices of degree at least two and $d$ incidence edges, then $d lt.eq u + v - 1$ in each nonempty connected part, while $2 v lt.eq d$. In particular
  #[#set math.equation(numbering: n => "(5.19)")
   $ d lt.eq 2 u . $ <eq:sharp-crossing-bound>]
  A lower component attached at a single line either is absorbed into an independent input, by the first paragraph, or continues a required record. The latter contribute at most the fixed number of recorded lines at that interface. Empty continued lines are included in this count.
  Starting with the fixed number of final roots and iterating (5.19) through $L$ slabs therefore bounds the total number of interface roots and recorded singleton continuations. There are no cycle or initial-link contributions to complexity in a leading tree. This gives $K_0$. The argument applies separately to disconnected expressions and to projections with fewer required records.
  Regrouping an unmarked one-root component is the defining finite sum for its independent factor, with its original fresh-label coefficient. Its components attach at one line only. Thus undoing it neither changes a connection between different remaining components nor introduces a constraint between them. The exact finite identity in 20 shows that forgetting records and regrouping commute before a limit. Absolute summability from 25 gives the same identity for the limiting trees. Their weights and projections are therefore preserved. ◻
]

#thm([Lemma 5.8.])[
  (Last-contact products).  #emph[In the leading tree sums, deleting a last contact of the highest slab that meets a designated root splits its global tree into the product of the two component tree measures, with the incident lines designated before that contact. Their product at the collision position is the conditional product in 27. Conversely, joining such two disjoint component histories at that contact gives exactly the corresponding retained tree, with its original factorial weight. Record portions not used by a test are projected out. These operations are valid for bounded continuous record tests and, with a smaller exponent, for tests of Gaussian velocity growth.]
] <lem:sharp-tree-splitting>

#proof[
  Temporarily expand all independent factors in the highest slab by their one-root definitions for that slab, retaining their lower inputs in the canonical regrouped form. Bound the total number of lines in each resulting limiting tree by $N$. For sufficiently small $epsilon.alt$, every particle cap $Lambda_i$ and retained cluster cap $M_i$ exceeds $N$. The convergence already proved therefore supplies every such leading tree with its original factorial weight. We perform the following finite algebra on this limiting tree class, preserving the inherited bound on the combined size after a split. This is not a claim that arbitrary finite-$epsilon.alt$ capped classes are closed under joining.
  Deleting an edge of a global tree makes exactly two components. Each contains one incident line of the deleted contact, which is now designated. If a component in the highest slab loses its old designated root, it contains the newly designated incident line or another original root. Thus it still satisfies the rooted-block rule. All lower attachments are unchanged. They can be put in the canonical retained form by the singleton regrouping of 28.
  Conversely, the two components are disjoint before joining. Adding their incident edge creates a tree, and its highest block meets the original root. The inverse singleton regroupings restore precisely its retained representation. This is a bijection at the level of the temporarily expanded labelled trees. In particular it is not a factorization of the actual particle law at an interface.
  For the coefficients, choosing an additional incident particle among $j$ fresh labels changes $1 \/ j !$ into $1 \/ \( j - 1 \) !$. If the remaining fresh labels are divided into sets of sizes $j_1 \, j_2$, their distribution contributes the binomial coefficient satisfying
  $ binom(j_1 + j_2, j_1) frac(1, \( j_1 + j_2 \) !) = frac(1, j_1 ! j_2 !) . $
  Apply this identity in each slab. A contact between two already designated particles uses their single unordered pair; it has no fresh-label factor. The sign of the deleted contact is its C/O sign, and all other signs multiply over the two components. This proves the coefficient assertion.
  The finite identities retain the combined-size restriction just specified. Letting $N$ increase removes that restriction and passes the sums through the deletion and joining integrals by Lemma 5.4, Lemma 5.6. The uniform conditional Gaussian bound controls the velocity flux introduced by the join, with a fixed exponent loss. Record projection commutes with the finite hierarchy and with the one-root regrouping, as established above. Hence a temporarily designated partner for which no past record appears in the integrand requires only the projected component measure. Approximation locally uniformly with a stricter Gaussian exponent extends the identity to the stated test class. ◻
]

#proof[
  We first justify weighted control of the retained high-complexity tail. Choose the common birth exponent $b > 0$ in (5.1) independently of $L$, and choose $L$ large enough for the coarse package with the fixed smaller exponent $3 b \/ 4$ as well. For a fixed observation list let $J$ be the number of designated endpoint and record velocity slots. On every original retained history, conservation of energy gives
  $ sum_(upright("these slots")) \| v \|^2 lt.eq J E_0 . $
  Choose the weight exponent $alpha > 0$ with $alpha J lt.eq b \/ 4$. Its Gaussian weight is dominated by $e^(b E_0 \/ 4)$, which can be absorbed by replacing every absolute birth input $\| g_i \( x \, v \) \|$ or $f_0 \( x \, v \)$ by that input times $e^(b \| v \|^2 \/ 4)$. The resulting inputs have a common $upright("Bol") \, 3 b \/ 4$ bound. The positive coarse estimate in 10(a) requires this envelope, not closeness to the Boltzmann solution. Apply it to the tilted inputs, with the same initial-link and fixed-record bounds used in 20. Dummy inputs, if used for that bound, may be tilted too; their additional birth energy only enlarges the majorant. The same geometric complexity sum makes the weighted retained tail smaller than any assigned power of $epsilon.alt$, after choosing $K$ for the fixed order and accuracy. The Gaussian fraction reserved here is fixed, so its atom base does not depend on $J \, h \, K$. Only the observable weight exponent decreases with the record list. This argument concerns retained diagrams, not a microscopic expansion remainder.
  Use 20 with an accuracy $epsilon.alt^M$ where $M > 2 \( h - 1 \)$, and with a complexity cutoff large enough both for that accuracy and for 28. The expansion error and the high-complexity tail are negligible after multiplication by $mu^(h - 1)$. They need only their unweighted variation bound, because the observation tests here are bounded.
  For the remaining connected diagrams, (5.8) and 25 prove the uniform bound at scale $mu^(1 - h)$. Physical initial links gain $epsilon.alt$; nonphysical initial tails gain any assigned power after choosing $D$ as above. Cycles are negligible by 26, finite-size dominated convergence, and the uniform size tails. The diagrams that remain are the complete class of leading trees, by 28. Their fluxes, signs, input limits, and continuous record tests were evaluated above. The same summable majorant proves the asserted Gaussian variation bounds for their retained sums and their limits. In particular it gives the one-root and two-root limits needed in the next section. All exponential bases used in this proof are independent of $K$ and of the fixed order $h$; dependence on those quantities occurs only in front constants and polynomial degrees. Thus the choice of $Gamma \, L$ remains the single choice made before the moment order was specified. ◻
]

== 6 Identification of the covariance and the Gaussian limit <sec:gaussian-limit>

Fix a finite observation list and absorb the coefficients of any desired real linear combination into its tests $phi.alt_j$. We first prove the Gaussian limit for the single pasted dynamics supplied by Theorem 4.9, Theorem 5.1. Its parameters $Gamma \, L$ do not depend on the observation list or a moment order; only auxiliary complexity and initial-tail truncations in the expansion may depend on the requested order and accuracy. The quantitative comparison with the true flow is proved in 7, and 8 then transfers the exact centering.

=== 6.1 Records and the limiting one- and two-root measures <records-and-the-limiting-one--and-two-root-measures>

Give every particle a scalar mark, initially $y = 0$, and at time $t_j$ perform the update

#[#set math.equation(numbering: n => "(6.1)")
 $ \( x \, v \, y \) mapsto Theta_j \( x \, v \, y \) = \( x \, v \, y + phi.alt_j \( x \, v \) \) . $ <eq:limit-mark-update>]

Collisions preserve the mark of each individual particle. If several observations have the same time, their updates may equivalently be combined. Write

$ M_(upright("obs")) = sum_j parallel phi.alt_j parallel_oo \, #h(2em) xi = \( x \, v \, y \) \, #h(2em) \| y \| lt.eq M_(upright("obs")) . $

The construction is only a record of the deterministic trajectories. It introduces no additional randomness. On either dynamics,

#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(i = 1)^N y_i \( T \) = sum_j sum_(i = 1)^N phi.alt_j \( z_i \( t_j \) \) . $ <eq:limit-record-identity>]

Use superscript $epsilon.alt$ for the normalized factorial cumulants of the pasted marked process. For every observation-free time, and with the appropriate one-sided convention at an update, 22 provides limits

#[#set math.equation(numbering: n => "(6.3)")
 $ c_1^epsilon.alt arrow.r F_t \, #h(2em) mu c_2^epsilon.alt arrow.r J_t . $ <eq:limit-F-J>]

Here $F_t$ is a one-root measure and $J_t$ is a symmetric signed two-root measure. The convergence is against bounded continuous tests of the records, and the limiting tree measures have the Gaussian variation bounds in 22. Before the updates at time zero, 3 gives

#[#set math.equation(numbering: n => "(6.4)")
 $ F_0 = f_0 \( x \, v \) thin upright(d) x thin upright(d) v thin delta_0 \( upright(d) y \) \, #h(2em) J_0 = 0 . $ <eq:limit-initial-F-J>]

Indeed $mu parallel c_(2 \, 0)^epsilon.alt parallel_1 = O \( epsilon.alt \)$.

Forgetting records in the finite marked hierarchy commutes with its one-root regroupings. By Theorem 4.9, Proposition 4.5, Lemma 5.7, the $\( x \, v \)$ marginal of $F_t$ is $f_t \( x \, v \) thin upright(d) x thin upright(d) v$. This statement applies also inside a slab: the one-root block map on a partial slab has the approximation (3.12), with its contact times restricted to that partial slab. The unmarked dependent one-root tree terms vanish by 28, so the remaining marginal is precisely that one-root Boltzmann expansion.

Since the first measure in (6.3) is positive, $F_t$ is positive. Its disintegration supplied by 27 is written

#[#set math.equation(numbering: n => "(6.5)")
 $ F_t = upright(d) x thin F_t \( x \, upright(d) v thin upright(d) y \) . $ <eq:limit-F-disintegration>]

Its unmarked marginal equals $f_t \( x \, v \) thin upright(d) v$ at every $x$, in the weak continuous version of that disintegration. In fact equality holds for almost every $x$ by the equality of the global marginals, and both sides are weakly continuous in $x$. The same reasoning allows a positive version of the conditional measure.

We specify the collision products that occur below. If a factor is $F_t$, or $J_t$ with one root position designated, use its conditional measure at that position from 27. Multiply two such separate component measures at their common position, and integrate that position against $upright(d) x$. Include the incoming flux $B \( v - v_(*) \, omega \) thin upright(d) omega$ when the incident variables collide. These are absolutely defined products. A uniform conditional Gaussian bound for one component, the integrated Gaussian bound for the other, and $B lt.eq \| v \| + \| v_(*) \|$ give an integrable majorant. Equivalently, one can first replace equality of the two positions by a smooth approximate identity and then take its width to zero. This characterization and weak continuity fix the version of the product. We use no pointwise product of unspecified almost-everywhere disintegrations.

=== 6.2 Last-contact evolution <last-contact-evolution>

At a collision write

$ xi = \( x \, v \, y \) \, quad xi_(*) = \( x \, v_(*) \, y_(*) \) \, quad xi' = \( x \, v' \, y \) \, quad xi'_(*) = \( x \, v'_(*) \, y_(*) \) . $

For a marked test $Phi$, set

$ Delta Phi = Phi \( xi' \) + Phi \( xi'_(*) \) - Phi \( xi \) - Phi \( xi_(*) \) \, #h(2em) D Phi = v dot.op nabla_x Phi \, $

and define

#[#set math.equation(numbering: n => "(6.6)")
 $ \( H_t Phi \) \( xi \) = integral_(bb(R)^3 times \[ - M_(upright("obs")) \, M_(upright("obs")) \] times S^2) B \( v - v_(*) \, omega \) Delta Phi thin F_t \( x \, upright(d) v_(*) thin upright(d) y_(*) \) thin upright(d) omega . $ <eq:limit-marked-H>]

In the next formulas, $integral B F F_(*) \( dots.h.c \)$ denotes the simultaneous position integral formed from (6.5), including $upright(d) x thin upright(d) omega$.

#thm([Proposition 6.1.])[
  (Evolution of the marked tree laws).  #emph[Between observation updates the limiting measures satisfy 
#[#set math.equation(numbering: n => "(6.7)")
 $ partial_t F_t \( Phi \) & = F_t \( D Phi \) + 1 / 2 integral B F_t F_(t \, *) Delta Phi \,\
partial_t J_t \( Phi ⊗ Psi \) & = J_t #scale(x: 120%, y: 120%)[\(] \( D + H_t \) Phi ⊗ Psi + Phi ⊗ \( D + H_t \) Psi #scale(x: 120%, y: 120%)[\)]\
 & quad + integral B F_t F_(t \, *) #scale(x: 120%, y: 120%)[\(] Phi \( xi' \) Psi \( xi'_(*) \) - Phi \( xi \) Psi \( xi_(*) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:limit-F-evolution>]

 The identities hold in transport mild form, and hence in weak differential form for smooth tests for which the displayed integrals exist. At an update $t_j$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ F_(t_j +) = \( Theta_j \)_(\#) F_(t_j -) \, #h(2em) J_(t_j +) = \( Theta_j ⊗ Theta_j \)_(\#) J_(t_j -) . $ <eq:limit-pushforwards>]

]
] <prop:tree-evolution>

#proof[
  We derive the identities from the tree integrals, after the limit, rather than taking a microscopic contact trace. Start with smooth bounded marked tests, bounded on the allowed mark interval. Expand the independent one-root factors of the highest slab by their definition for that slab, retaining the canonical lower inputs, and then truncate the resulting trees to finitely many vertices and bounded total birth energy. The size restriction thus includes the newly exposed lines, as in 29. Away from the finitely many observation times, the test at the upper endpoint depends on current root phase points and already accumulated marks.
  Vary that upper endpoint, or equivalently integrate in the time of the last contact of the highest slab. The scattering and non-scattering choices at a last contact that meets no tested root cancel: no later contact or update uses either line, so their tests are unchanged, while the two choices have the same incoming flux and opposite signs. The change when a tested root is incident is its scattered value minus its free value. Deleting that last edge splits a global tree into two components. By 29, these are exactly the two component measures before contact, multiplied at the common position in the sense just specified. This lemma also supplies the inverse joining operation and its fresh-label coefficients. At a finite total-size truncation, the pair of component histories retains the inherited restriction on their combined size. The unrestricted product of the two component measures appears only after absolute summability removes that auxiliary restriction.
  For clarity, the root and label counts can be checked as follows.
  + With one original root, its partner has been chosen from the fresh labels; selecting it changes $1 \/ j !$ into $1 \/ \( j - 1 \) !$. Dividing the remaining labels between the two component trees uses
    $ frac(1, \( j_1 + j_2 \) !) binom(j_1 + j_2, j_1) = frac(1, j_1 ! j_2 !) $
    in each slab. Thus the contact contribution is $integral B F F_(*) \( Phi \( xi' \) - Phi \( xi \) \)$. Particle interchange, including $omega mapsto - omega$, symmetrizes this into the collision term in (6.7).
  + With two original roots, a contact between the original pair is one unordered pair and introduces no fresh-label factor. Deleting it gives two one-root means. Its action on the product test is precisely the last integral in (6.7). There is no factor $1 \/ 2$ in this unsymmetrized expression for the two designated roots.
  + Suppose the contact is on the first original root and a new partner. The second original root lies in one of the two components obtained by deleting the contact. If it lies with the first root, the contribution is $J$ on that component and $F$ on the partner component, with change $Phi \( xi' \) - Phi \( xi \)$. If it lies with the new partner, interchange the two incident variables; the $J$ component then carries the change of the test on the other incident line, $Phi \( xi'_(*) \) - Phi \( xi_(*) \)$. Adding the two placements gives $J \( H_t Phi ⊗ Psi \)$. The same argument at the second original root gives $J \( Phi ⊗ H_t Psi \)$.
  If the temporarily designated new partner has no record in one of these integrands, its component is simply projected on the needed variables. Conversely, when its mark occurs after an interchange, the full recorded component is used. The projection identity in Theorem 4.9, Lemma 5.7, Lemma 5.8 identifies these as projections of the same $F \, J$; it does not postulate factorization of the microscopic law at an interface.
  Free flight gives the $D$ terms. One can formulate the calculation without differentiating a sum: for an interval $\[ a \, t \]$ contained in one slab and containing no update, freely transport the final test from $t$ to the last-contact time $s$. The no-contact term is the measure at $a$, tested against this free transport, and the last-contact terms are the integrals of the expressions above over $a < s < t$. For $J$ use free transport in both test slots. These are exactly the transport mild versions of (6.7) and (6.7).
  The finite re-expansion, deletion, and joining were bijections of labelled trees with their factorial weights. Passing to the full sums and the unbounded velocity domain is justified by Lemma 5.4, Lemma 5.6, Lemma 5.8. In particular the last-contact products are integrable in time and space with a fixed Gaussian exponent allowance. The same bounds justify locally uniform approximation of continuous tests with smaller Gaussian growth. They also extend the identities to bounded tests such as $y$, by cutting off space and velocity first and using the integrated variation bounds.
  At a slab interface with no contact at its endpoint, the empty upper slab has the input hierarchy as its no-contact term. The finite marked expansion has this identity before regrouping, and the absolutely convergent tree sums preserve it. Hence there is no jump at an artificial interface, and the mild identities concatenate across all slabs. Actual observation updates are the deterministic pushforwards of the finite marked hierarchy; bounded continuous record convergence gives (6.8). ◻
]

=== 6.3 Collision normalization and the covariance source <collision-normalization-and-the-covariance-source>

The pre/postcollision substitution, combined with $omega mapsto - omega$, preserves $B \( v - v_(*) \, omega \) thin upright(d) v thin upright(d) v_(*) thin upright(d) omega$. Particle interchange preserves it with the same change of normal. Consequently the normalization in (1.3) gives

#[#set math.equation(numbering: n => "(6.9)")
 $ integral Q \( f \, f \) phi.alt = 1 / 2 integral B f f_(*) Delta phi.alt \, #h(2em) integral \[ Q \( g \, f \) + Q \( f \, g \) \] phi.alt = integral g thin K_t phi.alt $ <eq:limit-weak-normalization>]

when the background is $f = f_t$. Thus the collision part of the linearized weak drift has no extra factor $1 \/ 2$.

Restore the same-particle term by defining

#[#set math.equation(numbering: n => "(6.10)")
 $ G_t \( Phi \, Psi \) = J_t \( Phi ⊗ Psi \) + F_t \( Phi Psi \) . $ <eq:limit-G-definition>]

Then 30 gives

#[#set math.equation(numbering: n => "(6.11)")
 $ partial_t G_t \( Phi \, Psi \) =  & G_t \( \( D + H_t \) Phi \, Psi \) + G_t \( Phi \, \( D + H_t \) Psi \)\
 & + 1 / 2 integral B F_t F_(t \, *) Delta Phi thin Delta Psi . $ <eq:limit-G-evolution>]

Here is a direct verification of the coefficient and sign of its source. Write $P = Phi + Phi_(*)$ and $R = Psi + Psi_(*)$. The collision change of the diagonal products from the $F$ equation, plus the source in the $J$ equation, symmetrized by particle interchange, is

$ 1 / 2 integral B F F_(*) thin Delta \( P R \) . $

The diagonal contributions in the two $H_t$ drift terms are

$ 1 / 2 integral B F F_(*) #scale(x: 120%, y: 120%)[\(] R Delta P + P Delta R #scale(x: 120%, y: 120%)[\)] . $

Their difference is the last term of (6.11), because $Delta \( P R \) = R Delta P + P Delta R + Delta P thin Delta R$. This uses neither detailed balance nor an equilibrium identity. The source is positive semidefinite, since $F_t$ is positive. At time zero, before updates,

#[#set math.equation(numbering: n => "(6.12)")
 $ G_0 \( Phi \, Psi \) = integral f_0 \( z \) Phi \( z \, 0 \) Psi \( z \, 0 \) thin upright(d) z \, $ <eq:limit-G-initial>]

and at an update $G$ pushes forward in its two test slots.

=== 6.4 Backward pulses and all observation times <backward-pulses-and-all-observation-times>

We only need (6.11) on the spaces

$ cal(V)_a = { thin Phi \( x \, v \, y \) = c thin y + h \( x \, v \) : c in bb(R) \, med h in E_a^0 thin } \, #h(2em) parallel Phi parallel_(cal(V)_a) = \| c \| + parallel h parallel_a . $

Let $alpha > 0$ be a common exponent in the integrated and conditional Gaussian variation bounds for $F \, J$. Choose $0 < a < b < beta$ with $2 b < alpha$, leaving a positive exponent margin for the collision flux. The factor two also controls the diagonal term $F_t \( h k \)$, where both tests use the same velocity. The mark is constant on each particle between updates, and its pair sum is conserved at a collision. The pointwise marginal statement following (6.5) therefore implies

#[#set math.equation(numbering: n => "(6.13)")
 $ \( D + H_t \) \( c thin y + h \) = A_t h \, #h(2em) 1 / 2 integral B F_t F_(t \, *) Delta \( c thin y + h \) Delta \( d thin y + k \) = C_t \( h \, k \) . $ <eq:limit-restricted-drift>]

At the pulse $t_j$, backward substitution changes $c thin y + h$ to $c thin y + h + c phi.alt_j$.

We justify using the backward propagator in this possibly nonsmooth test class. The Gaussian variation bounds for $F \, J$ make $G_t$ a uniformly bounded bilinear form on $cal(V)_b$. Its transport mild identity extends from the smooth tests in 30 by local uniform approximation with a small Gaussian exponent allowance. On the unmarked parts its collision operator is $K_t$, so the scale estimate (2.21) applies. Iterating the bilinear mild identity amounts to choosing one of the two slots for each collision factor. An $n$-fold remainder is bounded by a constant times

$ frac(\( C T \)^n, n !) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(n \/ delta) #scale(x: 120%, y: 120%)[\)]^n $

for the fixed total exponent allowance $delta = b - a > 0$; the $2^n$ slot choices are included in $C^n$. It tends to zero. The source iterations have the same summable bound. Thus dual propagation of (6.11) is justified by its convergent mild series. In particular it needs no spatial or velocity differentiability of $U \( r \, t \) phi.alt$.

Starting with the test $y$ after the final observation, the backward test at a time $r$ away from the pulses is $y + h_r$, where

#[#set math.equation(numbering: n => "(6.14)")
 $ h_r = sum_(j : t_j gt.eq r) U \( r \, t_j \) phi.alt_j . $ <eq:limit-backward-pulse-test>]

The same convention at $r = 0$ includes observations made at time zero. The exact values assigned at positive pulse times do not change a time integral. Combining the preceding dual propagation, the initial value (6.12), and the pulse substitutions gives

#[#set math.equation(numbering: n => "(6.15)")
 $ G_T \( y \, y \) = integral f_0 h_0^2 + integral_0^T C_r \( h_r \, h_r \) thin upright(d) r . $ <eq:limit-variance-formula>]

After the last pulse the unmarked backward part is zero, so one may equally use the last observation time in place of $T$.

By the explicit Gaussian construction (2.25), the random variable $sum_j zeta_(t_j) \( phi.alt_j \)$ is

$ I_0 \( h_0 \) + I \( Delta h_r \) . $

Its variance is precisely (6.15). This identifies correlations between different observation times, as well as observations made repeatedly on the same particle.

=== 6.5 Ordinary cumulants and Gaussian convergence <ordinary-cumulants-and-gaussian-convergence>

#thm([Proposition 6.2.])[
  (Gaussian limit on the pasted dynamics).  #emph[For the single pasted dynamics fixed above and every fixed observation list, 
$ frac(sum_i y_i \( T \) - bb(E) sum_i y_i \( T \), sqrt(mu)) med arrow.r.double med sum_j zeta_(t_j) \( phi.alt_j \) . $

 All centered moments of the scalar random variable on the left converge to the corresponding Gaussian moments.]
] <prop:cumulant-clt>

#proof[
  Put $S^epsilon.alt = sum_i y_i \( T \)$. The bound $\| S^epsilon.alt \| lt.eq M_(upright("obs")) N$ and the partition function imply that $S^epsilon.alt$ has exponential moments for each fixed $epsilon.alt$. For the normalized factorial cumulants at the final marked time, the exact factorial-to-ordinary identity is
  #[#set math.equation(numbering: n => "(6.16)")
   $ kappa_k \( S^epsilon.alt \) = sum_(pi in cal(P) \( \[ k \] \)) mu^(\| pi \|) integral c_(\| pi \|)^epsilon.alt \( upright(d) xi_1 dots.h.c upright(d) xi_(\| pi \|) \) product_(B in pi) y_B^(\| B \|) . $ <eq:limit-factorial-ordinary>]
  Here one associates the blocks of $pi$, in any fixed canonical order, with the distinct particle slots in the integral. For a direct derivation, write $exp \( lambda S^epsilon.alt \) = product_i \[ 1 + \( exp \( lambda y_i \) - 1 \) \]$, insert the factorial generating series, and take its logarithm. Each factor $exp \( lambda y \) - 1$ must receive a nonempty set of the $k$ differentiations at zero. Distributing those sets gives exactly the partitions in (6.16); their ordering cancels the factorial denominator of the factorial series. This is also a finite formal identity through degree $k$, so no uniform radius of convergence in $epsilon.alt$ is being assumed.
  All the powers of $y$ in (6.16) are bounded on the common mark interval; they can be extended to bounded continuous functions on the full mark line. By 22, every term on its right is $O_k \( mu \)$. For the centered normalized variable
  $ X^epsilon.alt = \( S^epsilon.alt - bb(E) S^epsilon.alt \) \/ sqrt(mu) $
  the first cumulant is zero. The second is
  $ kappa_2 \( X^epsilon.alt \) = c_1^epsilon.alt \( y^2 \) + mu c_2^epsilon.alt \( y ⊗ y \) arrow.r F_T \( y^2 \) + J_T \( y ⊗ y \) = G_T \( y \, y \) . $
  For $k > 2$,
  #[#set math.equation(numbering: n => "(6.17)")
   $ kappa_k \( X^epsilon.alt \) = O_k \( mu^(1 - k \/ 2) \) arrow.r 0 . $ <eq:limit-higher-cumulants>]
  The statement that these estimates hold on one dynamics is material: the bases determining $Gamma \, L$ in Theorem 4.9, Theorem 5.1 are independent of the fixed factorial order. Choosing a larger auxiliary complexity threshold or a larger $D$ only changes the error representation used to prove (6.17); it does not change the random variable $X^epsilon.alt$.
  The finite moment–cumulant identities now give every centered Gaussian moment with variance $sigma^2 = G_T \( y \, y \)$. Here the usual Gaussian moment-determinacy argument can be made explicit. Truncate the characteristic functions of $X^epsilon.alt$ and of a centered Gaussian $Z$ with variance $sigma^2$ at degree $2 n - 1$. Taylor’s integral remainder on the real axis is bounded by $\| u x \|^(2 n) \/ \( 2 n \) !$, so moment convergence gives
  $ limsup_(epsilon.alt arrow.r 0) lr(|bb(E) e^(i u X^epsilon.alt) - bb(E) e^(i u Z)|) lt.eq frac(2 \| u \|^(2 n) bb(E) Z^(2 n), \( 2 n \) !) = frac(2 \| u \|^(2 n) sigma^(2 n), 2^n n !) . $
  Letting $n arrow.r oo$ proves characteristic-function convergence for every real $u$, including when $sigma = 0$. It implies the asserted weak convergence, with variance identified by (6.15). ◻
]

The Gaussian limit is now established for the pasted dynamics. To obtain the same law for the true hard-sphere flow, it remains to compare not only their observations but also their exact expectations. The next section proves a discrepancy probability smaller than the $epsilon.alt$ scale; 8 combines that estimate with the initial particle-number moments.

== 7 The probability of a dynamical cutoff <sec:cutoff>

The Gaussian limit proved in 31 concerns the pasted dynamics. To pass to the true dynamics, we couple both systems using the same initial configuration. Mere convergence of the discrepancy probability to zero would transfer uncentered observations, but need not control their exact expectations on the scale $mu^(- 1 \/ 2) = epsilon.alt$. The stronger bound below supplies this control in 44. It concerns the unobserved particle system; all dynamical parameters are chosen independently of an observation list or a moment order.

#thm([Proposition 7.1.])[
  (Accuracy of the pasted dynamics).  #emph[There is a sufficiently large dimensional integer $Gamma_0$ with the following property. Fix $Gamma gt.eq Gamma_0$. There is $L_0 = L_0 \( Gamma \, f_0 \, f \, T \, beta \)$ such that, for any fixed $L gt.eq L_0$, the true dynamics and the pasted dynamics of 20, coupled using the same initial configuration, satisfy 
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P) { upright("the two trajectories differ at some time in ") \[ 0 \, T \] } lt.eq C epsilon.alt^(1 + eta) $ <eq:cutoff-probability>]

 for all sufficiently small $epsilon.alt$, where one may take $eta = 1 \/ 20$. Here the size cutoffs are the $A_i \, Lambda_i$ of 10, and $C$ and the upper bound on $epsilon.alt$ may depend on the displayed fixed parameters.]
] <prop:cutoff>

We distinguish the geometric cycle excess $r \( M \)$ of a graph from its multislab complexity $rho \( M \)$. A graph with $b$ binary-contact vertices, $n$ particle lines, and $c$ connected components has

#[#set math.equation(numbering: n => "(7.2)")
 $ r \( M \) = b - n + c $ <eq:cutoff-euler>]

when each line has at least one vertex. Equivalently, regarding contacts as vertices and intervening particle segments as bonds, $r \( M \) = \# { upright("bonds") } - b + c$. The graph’s directed order is the order generated by increasing time on each particle line. Orders on disjoint lines need not be comparable. All graph integrals below have the activity normalization of 20.

=== 7.1 Terminal witnesses and the reduction to bounded complexity <terminal-witnesses-and-the-reduction-to-bounded-complexity>

Suppose the two systems first disagree at an incoming contact in slab $i$. Immediately before this contact the systems agree. If two collision components are about to merge, each has size at most $Lambda_i$ and excess at most $Gamma$. Their union, including the new contact, has size at most $2 Lambda_i$ and excess at most $2 Gamma$. If the contact is internal, the size does not change and the new excess is at most $Gamma + 1 lt.eq 2 Gamma$. Thus the first disagreement has a witness consisting of a connected, realizable hard-sphere collision history $M_(upright("top"))$, stopped at this contact, satisfying

#[#set math.equation(numbering: n => "(7.3)")
 $ n \( M_(upright("top")) \) lt.eq 2 Lambda_i \, #h(2em) r \( M_(upright("top")) \) lt.eq 2 Gamma \, #h(2em) n \( M_(upright("top")) \) > Lambda_i med upright("or") med r \( M_(upright("top")) \) > Gamma . $ <eq:cutoff-witness>]

After the stopping contact its lines may simply be extended without further prescribed contacts. In particular the stopping time need not be a slab endpoint.

For every initial configuration the indicator of a first disagreement is bounded by the number of these witnesses. For a specified $n$-particle witness, the factorial integral at the previous interface has coefficient $mu^n \/ n !$; it has no prescribed top root and no additional factor $mu^(- 1)$. Removing conditions involving particles outside the witness only increases this positive bound. Apply 21. This expands the preceding pasted factorial measure with its exact activity and factorial coefficients. Every lower component is attached to the terminal history through particle lines. The internal realizability restriction on $M_(upright("top"))$ remains imposed. Remainders are smaller than any fixed power of $epsilon.alt$.

Choose a fixed complexity threshold $K$, after $L$ has been fixed. By Corollary 4.10, Theorem 3.3, the sum of the positive majorants with $rho > K$, including the activity cost of an artificial top root when required, is $O \( epsilon.alt^3 \)$ if $K$ is large enough. The terms left to estimate therefore have

#[#set math.equation(numbering: n => "(7.4)")
 $ rho lt.eq K . $ <eq:cutoff-low-complexity>]

Their numbers of interface crossings, initial-link vertices, and within-slab cycles are bounded. Their total geometric cycle excess is bounded as well. We may discard initial-link restrictions in these positive majorants; the remaining trajectory attachments to the terminal component persist.

It remains to bound these low-complexity witnesses. We first localize their birth energy, then find enough local geometric gains in the terminal collision component, and finally sum its ordinary contacts together with the attached lower histories.

=== 7.2 Energy localization <energy-localization>

The improved local estimates will be used only on bounded velocity regions. We first remove very high birth energy by a crude forward integration, without using those estimates.

#thm([Lemma 7.2.])[
  (Removal of very high birth energy).  #emph[For the positive graph majorants in (7.4), there is a fixed power $H_(*)$ such that restricting the total birth energy $P = sum_(j upright(" a birth")) \| v_j \|^2$ to 
$ P lt.eq P_epsilon.alt := \( 1 + \| log epsilon.alt \| \)^(H_(*)) $

 changes their sum by $O \( epsilon.alt^M \)$ for every fixed $M$.]
] <lem:cutoff-energy-tail>

#proof[
  All atom and birth counts are bounded by a fixed power $B_epsilon.alt = \( 1 + \| log epsilon.alt \| \)^H$, by the layer cutoffs and (7.4). A crude count of all graphs, time orders, and coefficient choices in this finite range is at most $exp \( C_(*) B_epsilon.alt^2 log \( 2 + B_epsilon.alt \) \)$. For example, label all births, list at most $B_epsilon.alt$ ordered contacts by their two labels and C/O type, and then list their slabs and interface gluings. Discarding factorial denominators and allowing all such lists gives this upper bound. Bounded complexity initial coefficients cost at most an additional fixed power of $B_epsilon.alt$.
  The two-incoming-flight identity requires no velocity localization. Indeed, for fixed relative intercept $x$ and velocity $v$, a transversal root of $\| x + t v \| = epsilon.alt$ has derivative $v dot.op \( x + t v \) \/ epsilon.alt$. Thus
  $ integral delta \( \| x + t v \| - epsilon.alt \) \[ - v dot.op \( x + t v \) \/ epsilon.alt \]_(+) thin upright(d) t lt.eq 1 : $
  a straight flight has at most one incoming crossing of a ball, and the flux cancels the scalar coarea Jacobian. The outgoing-position and outgoing-velocity delta factors then make a deterministic substitution with unit mass. Zero-speed and grazing cases carry no transversal incoming flux; use the same almost-everywhere convention, or exhaust the strictly transversal set. This proves the unrestricted incoming-contact bound directly, before localization.
  For a fixed fully ordered graph, let $h_j$ be the absolute input at birth $j$: it is either $\| g_(i_j) \|$ or an $f_0$ factor from an initial cumulant bound. Both have the common Gaussian envelope from Proposition 4.5, Assumption 1.1. Integrate the original coarea measure forward, starting with all birth phase points. At each contact its two incoming affine lines have already been determined. The unrestricted identity just proved integrates the contact time and outgoing variables to an indicator at most one and a deterministic update. Births at later interfaces are inserted at their assigned times; they can equivalently be integrated in advance and held inactive until then. Thus, after dropping all encounter restrictions and initial links, a graph with $n$ births has mass at most
  $ mu^n integral product_(j = 1)^n h_j \( x_j \, v_j \) upright(bold(1))_({ sum_j \| v_j \|^2 > P_epsilon.alt }) product_j upright(d) x_j thin upright(d) v_j lt.eq mu^n C^n e^(- c P_epsilon.alt) . $
  The last inequality uses half of the uniform birth Gaussian for the energy tail and integrates the other half. This forward bound is an estimate of the original positive measure, so it involves no local recollision gain. Summing the crude finite count, and using $n lt.eq B_epsilon.alt$, gives an upper bound
  $ exp { C_(*) B_epsilon.alt^2 log \( 2 + B_epsilon.alt \) + 2 B_epsilon.alt \| log epsilon.alt \| - c P_epsilon.alt } . $
  Choose $H_(*) > 2 H + 2$. The result is smaller than every fixed power of $epsilon.alt$. ◻
]

=== 7.3 Conditional local kernels and admissible cuts <conditional-local-kernels-and-admissible-cuts>

A #emph[cut] exposes a set of contact variables. Its shared lines become fixed phase-space data for the unexposed graph: each specifies a velocity and an affine free-flight position. A later piece is integrated conditional on all variables exposed earlier in the cut order. The available degree of an atom is its number of nonfixed edges, counting internal bonds at each endpoint and counting free ends.

A history is regular if at every O-atom each fixed end is serial with a free end; that serial fixed/free pair is called a simple pair. A full history is regular. A one-atom piece of type ${ 2 }$ has two nonfixed ends; its two fixed ends are on the same time side if it is C, and are nonserial if it is O. Types ${ 3 }$ and ${ 4 }$ have respectively one and zero fixed ends. A ${ 33 }$ piece consists of two atoms joined by one bond, each of degree three. It is type A if one atom can be cut as a type ${ 3 }$ singleton and the other thereby becomes an allowed ${ 2 }$ piece; it is type B otherwise. A ${ 44 }$ piece has two degree-four atoms joined by one bond. These conventions are #cite(label("DHM2025")) Definitions 8.2 and 8.11.

Cutting a pure-C set as free makes each crossing bond a free end of the cut piece and a fixed end of the complement. At O-atoms, the serial intercepts are equal, so the operation must preserve that equality. Take each maximal serial segment whose internal atoms are O. Break its bonds, reconnect its atoms belonging to the cut set in their order, and supply free ends at its first and last cut atoms whenever the segment continues outside the set. On the complement side, the extreme remaining incidence receives the corresponding fixed end, while an intermediate O-atom receives a simple pair. Every duplicated fixed value equals the original intercept on that segment. This is the regular cutting operation of #cite(label("DHM2025")) Definition 8.3.

The associated kernels compose exactly: if $A$ is cut first as free, then

#[#set math.equation(numbering: n => "(7.5)")
 $ I_M = I_A compose I_(M \\ A) \, $ <eq:cut-composition>]

with the repeated boundary variables identified as above. Thus the variables of an earlier cut piece are exterior variables and are held fixed while the later kernel is estimated. This includes any external time or position used in a later support restriction. Equality (7.5) is #cite(label("DHM2025")) Proposition 8.14; it also follows by integrating the serial delta functions in (3.6). Splitting into finitely many indicator cases is permitted. Deleting an O-atom means integrating out its incoming encounter count and dropping the resulting indicator bounded by one, as in #cite(label("DHM2025")) Proposition 8.13.

#thm([Lemma 7.3.])[
  (Conditional elementary bounds).  #emph[Consider the positive kernel (3.7) of a regular piece, with its fixed ends prescribed. Suppose the support has $\| v_e \| lt.eq \| log epsilon.alt \|^(C_(*))$, and each $x_e$ lies in a prescribed ball of radius $\| log epsilon.alt \|^(C_(*))$. The centers of those balls and all exterior variables may be arbitrary. Then:]
  + #emph[A ${ 2 }$ piece has kernel mass at most one. For a ${ 3 }$ piece the kernel is parameterized by 
#[#set math.equation(numbering: n => "(7.6)")
 $ upright(d) t thin upright(d) omega thin upright(d) w thin \| \( v - w \) dot.op omega \| \, $ <eq:local-three-parameters>]

 with $\( t \, omega \, w \) in bb(R) times S^2 times bb(R)^3$ and the appropriate incoming hemisphere. Here $v$ is the fixed-end velocity. If that end is outgoing, use the inverse elastic parametrization. All other states are determined by these parameters and the fixed end. A ${ 4 }$ piece has in addition the measure $mu thin upright(d) x thin upright(d) v$. Consequently their masses are respectively bounded by $\| log epsilon.alt \|^(C_(*))$ and $mu \| log epsilon.alt \|^(C_(*))$. A neutral type-A ${ 33 }$ bound is obtained by a ${ 3 }$ integration followed by a ${ 2 }$ integration.]
  + #emph[A ${ 3 }$ piece gains $epsilon.alt^upsilon$ over its neutral bound if its support satisfies any one of 
#[#set math.equation(numbering: n => "(7.7)")
 $ \| t - t_(*) \| & lt.eq epsilon.alt^upsilon \, #h(2em) \| v_e - v_(e') \| lt.eq epsilon.alt^upsilon \,\
\| x_e - x_(*) \| & lt.eq epsilon.alt^(1 - upsilon) \, #h(2em) \| x_e - x_(e') \| lt.eq epsilon.alt^(1 - upsilon) . $ <eq:good-three-conditions>]

 The two-edge conditions require distinct edges and, for O-atoms, exclude serial pairs. In the external-position condition $e$ cannot be the fixed edge, or, for an O-atom, its serial free edge. The quantities $t_(*) \, x_(*)$ are fixed exterior parameters. The bound is uniform in their values.]
  + #emph[For a type-B ${ 33 }$ piece, both atoms are C. Suppose $\| t_1 - t_2 \| gt.eq epsilon.alt^upsilon$, and at each of its atoms every pair of distinct incident edges satisfies $\| v_e - v_(e') \| gt.eq epsilon.alt^upsilon$. Its kernel mass is at most $epsilon.alt^upsilon \| log epsilon.alt \|^(C_(*))$, uniformly in its two fixed ends.]
  #emph[In all three assertions, multiplying by an arbitrary bounded function on the stated support costs its supremum. There is no assumption that a fixed-end velocity has an independent Gaussian distribution.]
] <lem:dhm-local>

#proof[
  Part (i) is the incoming coarea formula #cite(label("DHM2025")) Proposition 9.1, Equations (9.1)–(9.6); the two-end kernel counts at most one incoming crossing between the two fixed flights. The powers of $mu$ also follow directly from (3.7). The type-A assertion follows from (7.5) and its defining cut. Part (ii) is #cite(label("DHM2025")) Proposition 9.2(1), Equations (9.14)–(9.15), with precisely the restrictions on distinct and serial edges written there. Part (iii) is #cite(label("DHM2025")) Proposition 9.3(2), Equation (9.23); its range $0 < upsilon < 1 \/ \( 6 d \)$ contains $1 \/ 81$ for $d = 3$. The estimates are bounds for a positive kernel with a supremum over all fixed ends, which gives the last assertion and permits their successive conditional use. ◻
]

#prodef([Remark 7.4.])[
  One may first move the ordinary $upright(d) t thin upright(d) omega thin upright(d) w$ variables in (7.6) outside later kernels and then apply 34 with them fixed. This is an application of Tonelli’s theorem to the positive coarea integrals and (7.5); all support restrictions must remain until the projected ordinary-parameter domain has been estimated. The source uses exactly this order in #cite(label("DHM2025")) Equations (9.66) and (9.74). The local estimates do not control the volume of that projected domain. We will bound it using the common birth energy and causal time order in Lemma 7.10, Lemma 7.11, after proving the extraction statement in 40.
] <rem:conditional-extraction>

A #emph[uniformly good] singleton or type-B pair will mean one of the restricted kernels in 34 with conditional mass $epsilon.alt^upsilon \| log epsilon.alt \|^(C_(*))$. All its gain-producing restrictions are part of that kernel; they are not discarded later. In particular, the phrase uniformly good includes the full velocity and time nondegeneracy hypotheses required for a type-B pair. It does not mean merely that a pair has two distinct velocities.

The following is the precise operational part of the cutting algorithms that we import. It contains no improved probability estimate.

#thm([Proposition 7.5.])[
  (Pure-collision cutting alternatives, imported).  #emph[Let $M$ be a connected, full, realizable graph containing only scattering contacts. Full means that all its end variables are integrated. Define a transversal set $A subset M$ to be a set for which $M \\ A = A^(-) union.sq A^(+)$, with no directed bond from $A^(+)$ to $A union A^(-)$, or from $A$ to $A^(-)$. Let $X_0 \( A \)$ consist of vertices outside $A$ with two bonds to $A$, and let $X \( A \)$ be the closure obtained by repeatedly adding vertices with two bonds to the set already grown. The following statements hold; in parts (ii)–(iv), $A$ is assumed to be connected.]
  + #emph[ There is a chain of connected transversal sets $A_1 \, dots.h \, A_m = M$, with $A_1$ a tree, such that $X_0 \( A_j \) eq.not diameter$ for $j < m$, 
$ A_j union X \( A_j \) subset A_(j + 1) \, #h(2em) r \( A_(j + 1) \) = r \( A_j union X \( A_j \) \) \, #h(2em) r \( A_(j + 1) \) - r \( A_j \) lt.eq 10 \| X \( A_j \) \| . $

 The intermediate growth from $A_j union X \( A_j \)$ to $A_(j + 1)$ adds one bond at each new vertex. For any $D$ transitions in this chain there is a cutting sequence of all of $M$ with one type ${ 4 }$, no type ${ 44 }$ or type-B pair, and at least $D$ type-A pairs.]
  + #emph[ One can choose $A^plus.minus$ such that each component of $A^(+)$ is attached to $A$. The two parts $X^plus.minus \( A \) = X \( A \) ∩ A^plus.minus$ are equivalently obtained by adding vertices with two predecessors, or two successors, in the grown set. They are convex along particle lines. If $m_plus.minus$ is the number of bonds from $A$ to $X^plus.minus \( A \)$, then 
$ \| X^plus.minus \( A \) \| lt.eq G \( m_plus.minus \) \, #h(2em) G \( q \) = \( 2 q + 1 \) binom(q, 2) \( 32 q^(3 \/ 2) \)^(q^2) quad \( q gt.eq 2 \) . $

 The harmless values $G \( 0 \) \, G \( 1 \)$ may be replaced by one.]
  + #emph[ Put $z = \| X_0^plus.minus \( A \) \|$ and $a = r \( A \)$. There is a cutting sequence of $M$ having one type ${ 4 }$, no type ${ 44 }$ or type-B pair, and at least $z \/ 2 - a - 1$ type-A pairs.]
  + #emph[ For this same choice of side there is a finite Borel partition of the contact-parameter domain, with a subcase-dependent integer $y gt.eq 0$, and the following two available sequences in each subcase:]
    - #emph[a sequence with one type ${ 4 }$, no type ${ 44 }$ or type-B pair, and at least $y \/ 10 - 3 \( a + 1 \)$ uniformly good singletons;]
    - #emph[a sequence with no type ${ 44 }$, at most $S = a + z + y$ type ${ 4 }$ singletons, all type-B pairs uniformly good, and at least 
$ frac(m_plus.minus - 10^5 S, 10) $

 type-A or type-B pairs in total.]
  #emph[The singleton and pair types not counted for a gain have the neutral kernels described above. On graphs of polylogarithmic size and bounded excess the indicated partitions and operation sequences have at most $C^b \| log epsilon.alt \|^(C_(*))$ subcases. The exponential base $C$ depends on dimensional choices, not on $L$. The required local restrictions at each uniformly good piece involve its own variables and data exposed earlier in the cutting order.]
] <prop:cutoff-import>

#proof[
  #emph[Source identification.] The transversal definition and closure properties are #cite(label("DHM2025")) Definition 15.3 and Proposition 15.4. The chain and its transition cutting sequence are the construction in the proof of #cite(label("DHM2025")) Proposition 15.1, case (1). The displayed bound $G$, including its realizability hypothesis, is #cite(label("DHM2025")) Proposition 15.2; for $X^plus.minus \( A \)$ its entering boundary consists of the stated connection bonds. That proposition uses the hard-sphere collision bound of Burago, Ferleger and Kononenko #cite(label("BuragoFerlegerKononenko1998")), adapted to extended dynamics in #cite(label("DHM2025")) Appendix A. Part Proposition 7.5 is #cite(label("DHM2025")) Proposition 15.6. The two sequences in Proposition 7.5 are #cite(label("DHM2025")) Proposition 15.10, (15.7)–(15.8). We deliberately weaken the first count in (15.7) when retaining only good singletons. Its proof has at most $r \( A \)$ type-two or type-A pieces inside $A$, covering at most $2 r \( A \)$ vertices, and one free seed. The remaining weakly degenerate vertices or later-cut members of weak pairs give good singletons. Discarding these exceptional vertices and weakening the count gives the stated $y \/ 10 - 3 \( r \( A \) + 1 \)$. For the second sequence, the type-B pairs lie in the remaining part of $A$, after the weakly degenerate atoms and weak pairs have been removed. Both the time separation and all the velocity separations required by 34(iii) therefore hold there. The integer $y$ is the size of the set $Y_1$ in that proposition’s parameter partition. Thus its name and internal classification are unnecessary for the operational statement here. The uniform local estimates and conditioning convention are 34. We use none of the final exponents in DHM’s truncation-error proposition. ◻
]

We also record a simple neutral completion argument; it will be useful both after a seed cut and below a terminal component.

#thm([Lemma 7.6.])[
  (Neutral completion).  #emph[Suppose an exposed set is order-convex in the directed contact graph. Every remaining component touching this set can be cut using only type ${ 2 }$ and type ${ 3 }$ singletons. The same conclusion holds with given top ends in place of the exposed set. Scattering and nonscattering contacts are both allowed.]
] <lem:cutoff-neutral>

#proof[
  If a remaining vertex is a successor of the exposed set, choose one minimal among the unexposed successors. It is adjacent to the exposed set, and adding it preserves order convexity. Every fixed incident edge is on its incoming side: fixed edges on both sides would place this vertex between two already exposed vertices. There are one or two such edges. If no unexposed successor is available, choose dually a maximal unexposed predecessor. It has one or two fixed outgoing edges. Continue until the components touching the exposed set are exhausted. Adjacency guarantees that one of these choices is available whenever such a component remains. The local formulas for both permitted singleton types apply, including to a nonscattering contact. Given top ends can be regarded as fictitious exposed vertices later than all contacts on their lines. For this argument one may use literal cuts in the uncontracted four-edge coarea representation (3.6)–(3.7). Tonelli’s theorem identifies each split bond variable with the given boundary value of the next piece. The activity exponents add because a split bond is replaced by one integrated free end and one fixed end. The final singleton pieces are regular: their fixed ends are on the same time side, so no two of them are serial. We do not assert that every intermediate complement of these literal cuts is regular under the serial-segment cutting convention described above. ◻
]

=== 7.4 A strengthened estimate for adjacent scattering contacts <a-strengthened-estimate-for-adjacent-scattering-contacts>

Write $R gt.eq 2$ for a polylogarithmic bound on velocities and on the radii of the localized position sets. The centers of the position sets may be arbitrary. Powers of $R$ below may change from line to line. The time interval has length at most $T$. A pair of adjacent contacts with one bond is called #emph[primitive] if there is no other directed chain between them. This condition makes the pair order-convex. A double bond between two consecutive scattering contacts would require the same pair of freely separating spheres to collide again without an intervening velocity change. Such a history is impossible. We therefore need only single-bond pairs in a realizable graph.

#thm([Lemma 7.7.])[
  (Local adjacent-pair estimates).  #emph[Consider every possible choice $e_1 \, e_2$ of the two prospective fixed edges of a type-A pair, with $t_1 \, t_2$ the corresponding contact times. Call that choice strongly close if 
#[#set math.equation(numbering: n => "(7.8)")
 $ \| t_2 - t_1 \| lt.eq epsilon.alt^(9 \/ 10) \, #h(2em) \| v_(e_2) - v_(e_1) \| lt.eq epsilon.alt^(4 \/ 5) . $ <eq:cutoff-close>]

 Then:]
  + #emph[a primitive pair satisfying (7.8), cut freely as one piece, has mass at most 
#[#set math.equation(numbering: n => "(7.9)")
 $ C R^C mu epsilon.alt^(9 \/ 10 + 3 \( 4 \/ 5 \)) = C R^C epsilon.alt^(13 \/ 10) \; $ <eq:cutoff-free-pair>]

]
  + #emph[in the absence of every strongly close primitive pair, each type-A pair used by a cutting sequence has conditional mass at most $C R^C epsilon.alt^(1 \/ 20)$, or may be split into a neutral type-two piece and a singleton with this same improved bound.]
  #emph[The conditional bounds are uniform in the previously exposed lines and times.]
] <lem:cutoff-pair>

#proof[
  Reverse time within the local calculation if necessary. In the type-A arrangement the second contact has both outgoing edges available, and its fixed incoming edge is not the shared bond. Integrate the first contact as a type-three singleton and the second as a type-two singleton. The free first-contact parameters are $\( t_1 \, omega \, w \)$. Denote the two given velocities by $u \, v$, and the intervening bond velocity by $z$.
  For the free pair in (i), use the two-contact tree parameters: one free collision position, the two velocities at the first contact, the new incident velocity at the second contact, two normals, and two times. The activity prefactor is $mu$. Elastic reversal preserves velocity Lebesgue measure and the flux, so this parametrization also covers a prospective fixed edge chosen on the outgoing side of the first contact. Conditional on the first contact, the second given velocity is the independent incident velocity of the third particle. Its permitted set in (7.8) has volume $C epsilon.alt^(12 \/ 5)$; the second time has interval length at most $2 epsilon.alt^(9 \/ 10)$. All remaining localized volumes and fluxes cost at most $C R^C$. This proves (7.9). By primitivity, 37 finishes the rest of the connected graph without another free singleton.
  For (ii), first suppose $t_2 - t_1 > epsilon.alt^(9 \/ 10)$. Let $q_1 \( t \)$, $q_2 \( t \)$ be the positions on the given affine lines. The two contact equations imply
  #[#set math.equation(numbering: n => "(7.10)")
   $ \( t_2 - t_1 \) \( z - v \) = q_2 \( t_1 \) - q_1 \( t_1 \) + O \( epsilon.alt \) . $ <eq:cutoff-aiming>]
  The $O \( epsilon.alt \)$ error includes both contact offsets and is uniform in the normals. At fixed $t_1$, the vector $z - v$ consequently lies within distance $C epsilon.alt^(1 \/ 10)$ of the line $bb(R) \( q_2 \( t_1 \) - q_1 \( t_1 \) \)$. If this displacement is zero it instead lies in a ball of that radius, which is a stronger restriction.
  Put $h = C epsilon.alt^(1 \/ 10)$. Depending on which edge is fixed at the first contact, the bond velocity is one of
  $ w \, #h(2em) P_(omega^perp) w + \( u dot.op omega \) omega \, #h(2em) u + s omega \, quad s = \( w - u \) dot.op omega \, $
  up to signs that do not change these estimates. For the first map, the preimage of an $h$-tube has three-dimensional volume at most $C R^C h^2$. For the second, a plane intersects a bounded part of the tube in area at most $C R^C h$, and the unused longitudinal coordinate costs only $C R$. For the third, integrating the two tangential coordinates of $w$ costs $C R^2$, while the image of $upright(d) s thin upright(d) omega$ has density at most $C \| z - u \|^(- 2)$. Inside $\| z - u \| lt.eq sqrt(h)$ its mass is at most $C sqrt(h)$. Outside that ball, the density is at most $C h^(- 1)$ and the tube volume is at most $C R h^2$. Thus its total mass is at most $C R^C sqrt(h)$. These bounds, with the first flux bounded by $C R$ and the type-two kernel by one, give $C R^C epsilon.alt^(1 \/ 20)$.
  Next suppose $t_2 - t_1 lt.eq epsilon.alt^(9 \/ 10)$ and $\| u - v \| > epsilon.alt^(4 \/ 5)$. Equation (7.10) gives
  $ \| q_2 \( t_1 \) - q_1 \( t_1 \) \| lt.eq C R epsilon.alt^(9 \/ 10) . $
  The difference of the given affine lines has velocity $v - u$; the set of such $t_1$ is an interval of length at most $C R epsilon.alt^(1 \/ 10)$. Integrating this restricted first time, and bounding all other local factors by $C R^C$, gives a stronger estimate.
  Finally suppose (7.8) holds. The pair is then nonprimitive. Choose another directed chain between its vertices. At least one intermediate vertex of this chain has already been cut. Indeed, if all were still uncut, the first vertex would have two uncut outgoing bonds and the second two uncut incoming bonds. Their fixed edges would be on the opposite outer sides, which is precisely not the type-A arrangement. A time $t_(*)$ strictly between $t_1 \, t_2$ is therefore part of the previously exposed data. The first free collision time lies within $epsilon.alt^(9 \/ 10)$ of $t_(*)$. Cutting the pair into a type-three and a type-two singleton gives the claimed estimate. There are only polynomially many choices of such intermediate vertices in a fixed graph; a deterministic choice suffices. ◻
]

In the sequel fix the dimensional number

#[#set math.equation(numbering: n => "(7.11)")
 $ delta = 1 / 2 min { upsilon \, 1 \/ 20 } > 0 . $ <eq:cutoff-delta>]

Every retained local gain, whether from 38 or 34, is therefore at least a factor $epsilon.alt^delta$, apart from a fixed polylogarithmic factor.

=== 7.5 Accumulating a fixed amount of gain <accumulating-a-fixed-amount-of-gain>

#thm([Lemma 7.8.])[
  (Amplified pure-collision cut).  #emph[For a sufficiently large dimensional $Gamma_0$, every connected realizable full scattering graph with $Gamma < r \( M \) lt.eq 2 Gamma$, $Gamma gt.eq Gamma_0$, has a finite decomposition into cut sequences of the following form. Either it contains a freely cut pair estimated by (7.9) and no other activity loss, or its retained improved pieces and free singletons satisfy 
#[#set math.equation(numbering: n => "(7.12)")
 $ delta thin g - 2 s_4 gt.eq 6 \/ 5 . $ <eq:cutoff-gain-balance>]

 Here $g$ counts the retained improved pieces, and $s_4$ counts free singleton pieces. The number of subcases is at most $C^b \| log epsilon.alt \|^(C_(*))$. The number of pieces other than neutral type-three singletons is bounded in terms of $Gamma$ and the fixed choices.]
] <lem:cutoff-amplified>

#proof[
  First take the union over all strongly close primitive pairs and all prospective type-A fixed-edge choices. There are at most a constant times $b$ candidate bonds and a bounded number of edge choices per bond. A fixed priority partitions this union. Cut the selected pair freely and use 37. This is the first alternative. On the complement every type-A pair has the gain in 38.
  Here is an explicit finite hierarchy for the second alternative. Choose
  $ D = ceil.l 4 \/ delta ceil.r \, #h(2em) B = 100 \/ delta \, #h(2em) R_0 = \( 10^5 + 100 \/ delta \) \( 1 + 2 B \) \, #h(2em) kappa_1 = 2 \, $
  and choose increasing integers recursively so that
  $ kappa_(j + 1) > kappa_j + 40 { 1 + G \( ceil.l R_0 kappa_j ceil.r \) } \, #h(2em) 1 lt.eq j < D . $
  Use an increasing envelope of $G$ if needed at its two smallest arguments. Take $Gamma_0 gt.eq kappa_D$. All these choices precede $L$.
  Apply the transversal chain of 36. If it has at least $D$ transitions, its transition sequence has $g gt.eq D$, $s_4 = 1$, and $delta D - 2 gt.eq 2 > 6 \/ 5$. Otherwise the chain reaches $M$ in at most $D$ sets. Since $r \( A_1 \) = 0 < kappa_1$ and $r \( M \) > Gamma gt.eq kappa_D$, there is a first $j$ such that
  $ r \( A_j \) < kappa_j \, #h(2em) r \( A_(j + 1) \) gt.eq kappa_(j + 1) . $
  Put $A = A_j$. The growth bound shows that one of $X^plus.minus \( A \)$ has size greater than $G \( ceil.l R_0 kappa_j ceil.r \)$. Its number $m$ of connections to $A$ therefore satisfies $m > R_0 kappa_j$, by 36Proposition 7.5. The retained realizability of the witness is used at exactly this invocation of the collision-count bound.
  For the chosen side put $z = \| X_0^plus.minus \( A \) \|$, $a = r \( A \)$, and use the partition and integer $y$ of 36Proposition 7.5. If $z gt.eq B kappa_j$, use the transversal sequence:
  $ delta g - 2 s_4 gt.eq delta { \( B \/ 2 - 1 \) kappa_j - 1 } - 2 > 6 \/ 5 . $
  If $y gt.eq B kappa_j$, use its first main sequence:
  $ delta g - 2 s_4 gt.eq delta { \( B \/ 10 - 3 \) kappa_j - 3 } - 2 > 6 \/ 5 . $
  Otherwise $S = a + z + y lt.eq \( 1 + 2 B \) kappa_j$. In the second main sequence, every counted type-A or type-B pair has a gain. Hence
  $ delta g - 2 s_4 gt.eq delta / 10 \( m - 10^5 S \) - 2 S > 8 \( 1 + 2 B \) kappa_j > 6 \/ 5 . $
  If more uniformly good singletons are produced than needed, retain only the number of their gains needed for this inequality.
  For completeness, a degree count bounds the remaining exceptional pieces. Write $s_j$ for singleton counts and $p_33 \, p_44$ for pair counts. Counting each bond once, except that an internal pair bond contributes at both endpoints when available degrees are summed, gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ s_2 + p_33 = r \( M \) + s_4 + p_44 - 1 . $ <eq:cutoff-degree-count>]
  One way to verify this identity is to use $b = s_2 + s_3 + s_4 + 2 p_33 + 2 p_44$ and $n = b + 1 - r \( M \)$. The sum of available degrees is both
  $ 2 s_2 + 3 s_3 + 4 s_4 + 6 p_33 + 8 p_44 quad upright("and") quad 2 b + n + p_33 + p_44 . $
  This proves (7.13). The constructed $s_4$ is bounded, $r \( M \) lt.eq 2 Gamma$, and $p_44$ is zero except for the single primitive seed. Thus $s_2 \, p_33$ are bounded. Splitting a nonprimitive type-A pair as in 38 changes these counts by a bounded amount. The number of retained good singletons may also be bounded in terms of the same constants. The subcase count follows from 36 and the additional polynomial choices. ◻
]

=== 7.6 Simultaneous integration of the ordinary parameters <simultaneous-integration-of-the-ordinary-parameters>

The local powers must be retained without a logarithmic loss at each ordinary contact. We give the parameter argument in detail. In a cut sequence call every neutral type-three singleton #emph[ordinary]; all other pieces, including the retained good singletons, are #emph[exceptional]. Counting both vertices of an exceptional pair, their number is bounded by a constant depending on $K \, Gamma$. For the terminal part this follows from 39. Below it use 37. The identity (7.13) on the complete graph, or its version with the bounded number of crossing ends fixed, bounds the additional type-two pieces. Empty fixed lines require only deterministic substitution; any such lines can be included in the exceptional list. There is no full empty line, since every line is attached to the terminal component.

Let $q$ denote the number of ordinary atoms and $b$ the total number of atoms. Thus

#[#set math.equation(numbering: n => "(7.14)")
 $ q = b - O_K \( 1 \) . $ <eq:cutoff-ordinary-count>]

The constants in exponential factors below will not depend on $K$. Dependence on $K$ is allowed in prefactors and in fixed polynomial degrees.

We will bound the simultaneous velocity domain using total birth energy, and trade the causal time restrictions against the ordinary relative-speed factors. Both bounds concern the original feasible histories, before any remaining collision constraints are dropped.

#thm([Lemma 7.9.])[
  (Extraction of literal free parameters).  #emph[Consider a finite ordered composition of positive cut kernels. At an ordinary step its free variables are $theta.alt_j = \( t_j \, omega_j \, w_j \)$, with measure 
$ a_j thin upright(d) t_j thin upright(d) omega_j thin upright(d) w_j \, $

 followed by a deterministic update of the exposed data. Suppose every exceptional kernel $K_ell \( h \, upright(d) z \)$ has mass at most $H_ell$, uniformly in admissible data $h$ from earlier cuts. Include in that kernel every restriction needed for this bound, and set it to zero outside its admissibility domain.]
  #emph[Remove the factors $a_j$ from the ordinary measures, obtaining a positive measure $nu$. If $E$ is a set of complete histories and $cal(D)$ is a measurable set containing its projection onto the literal variables $theta.alt = \( theta.alt_1 \, dots.h \, theta.alt_q \)$, then 
#[#set math.equation(numbering: n => "(7.15)")
 $ nu \( E \) lt.eq (product_ell H_ell) integral_(cal(D)) product_(j = 1)^q upright(d) t_j thin upright(d) omega_j thin upright(d) w_j . $ <eq:cutoff-extraction>]

 The same assertion holds when the ordinary density after division by $a_j$ is merely bounded by one.]
] <lem:cutoff-extraction>

#proof[
  First put all ordinary variables in bounded boxes. Fix their entire vector $theta.alt$. Their deterministic updates still occur in their original positions in the cutting sequence. The exceptional kernels remain in their original order, with $theta.alt$ treated as exterior parameters. Integrating these kernels backwards from the last exceptional step bounds the resulting total mass by $product_ell H_ell$. Intervening deterministic substitutions have norm at most one on bounded functions. Nonnegative kernel Fubini therefore represents $nu$ as the product measure in $theta.alt$ times these remaining conditional kernels. Majorizing the indicator of $E$ by $upright(bold(1))_(cal(D)) \( theta.alt \)$ proves (7.15). Exhaustion removes the bounded boxes.
  In particular, this calculation does not condition an exceptional kernel on the global energy event. That event is retained until its ordinary projection is majorized. Fixing a future ordinary parameter does not alter any exceptional kernel or require an averaged estimate to become pointwise. Uniformity in the actual earlier-cut data is sufficient.
  There is also a rectangle formulation useful for the coarea measures. Restrict the ordinary relative speeds away from zero and bound their product on the original feasible support. After division by those speeds, an ordinary local kernel in a rectangle of its $\( t \, omega \, w \)$ coordinates has mass bounded by the rectangle’s product volume. In a product rectangle for all ordinary steps, successive conditional estimates give that volume times $product_ell H_ell$. Cover a compact containing set $cal(D)$ by finite unions of product rectangles with volume decreasing to its outer measure, using finitely many sphere charts. Summing the rectangle bounds and taking the infimum gives (7.15). The containing sets used below are compact and measurable. Finally let the speed restriction decrease to zero; a zero-speed incoming contact has zero flux. This proves the same statement directly by exhaustion of transversal coarea histories. ◻
]

The literal extraction in this lemma is the operator rearrangement in #cite(label("DHM2025")) Equations (9.66), (9.74)–(9.77). Its use with the following containing sets, rather than a separate velocity box at every ordinary vertex, is the additional estimate needed here.

#thm([Lemma 7.10.])[
  (A common velocity containing set).  #emph[Fix one original history graph and its ordinary normals. Suppose the sum of squared velocities at all its births is at most $P$, and suppose there are $s$ exceptional atoms, counting both atoms of a pair. For $q gt.eq 1$, the concatenated ordinary parameters $W = \( w_1 \, dots.h \, w_q \)$ lie in a set of volume at most 
#[#set math.equation(numbering: n => "(7.16)")
 $ C_s { \( 1 + P \) \( 1 + q \) }^(C s) (C sqrt(1 + P \/ q))^(3 q) . $ <eq:cutoff-ellipsoid>]

 The exponential base $C$ is absolute. The containing set depends on the ordinary normals and the graph but not on the numerical contact times or on the exceptional parameters. If $P \, q$ are bounded by fixed powers of $\| log epsilon.alt \|$, the prefactor is a fixed power of $\| log epsilon.alt \|$.]
] <lem:cutoff-ellipsoid>

#proof[
  Work on the original feasible histories, before dropping any collision constraints. Let $u$ be the vector of all birth velocities. At each exceptional atom replace its two outgoing velocities by independent additional inputs, and write $a$ for their concatenation. There are at most $6 s$ scalar coordinates in $a$. On the energy support each of its three-dimensional entries has norm at most $sqrt(P)$.
  Run the resulting velocity computation forward in the graph’s chronological order. Ordinary scattering applies an orthogonal matrix to two particle velocities; an ordinary nonscattering contact applies the identity. At an exceptional atom, erase the dependence of its two outgoing coordinates on $u$, and insert the prescribed values from $a$. Birth coordinates can be present from the start as inactive coordinates, and departed coordinates can be retained as inactive ones. The part depending linearly on $u$ is thus propagated by orthogonal matrices and coordinate projections. Its operator norm is at most one at every time.
  Every ordinary parameter $w_j$ is one of the physical edge velocities immediately before or after its contact. This includes a parameter on the outgoing side when the cut parametrization runs backwards. Consequently
  #[#set math.equation(numbering: n => "(7.17)")
   $ W = A \( omega \) u + d \( omega \, a \) \, #h(2em) parallel A \( omega \) parallel_(upright("HS"))^2 lt.eq 3 q . $ <eq:cutoff-forward-rows>]
  Repeated observation of one velocity does not require orthogonality between different rows; the stated sum of their squared norms is all that is used. These maps do not depend on numerical contact times. Different total extensions of the causal order produce the same maps, since incomparable contacts act on disjoint particle coordinates and commute.
  Take a Euclidean net of the possible $a$’s of mesh $c_s \( 1 + q \)^(- 1 \/ 2)$. It has cardinality at most $C_s { \( 1 + P \) \( 1 + q \) }^(C s)$. A change of size $zeta$ in this entire vector changes any one chronological velocity state by at most $sqrt(s) thin zeta$: propagate the reset errors and use Cauchy–Schwarz. Its effect on the $q$ observations is at most $C sqrt(q s) thin zeta$. Choose $c_s$ so that the simultaneous error is at most one. The allowed $W$’s are contained in the union, over net points $a_0$, of
  #[#set math.equation(numbering: n => "(7.18)")
   $ d \( omega \, a_0 \) + A \( omega \) B_(3 n) \( sqrt(P) \) + B_(3 q) \( 1 \) . $ <eq:cutoff-ellipsoid-set>]
  For $m = 3 q$ the Minkowski sum in (7.18) is contained in
  $ sqrt(2) thin \( P A A^(sans(T)) + upright("Id")_m \)^(1 \/ 2) B_m \( 1 \) . $
  Indeed its support function in direction $xi$ satisfies
  $ sqrt(P) \| A^(sans(T)) xi \| + \| xi \| lt.eq sqrt(2 \( P \| A^(sans(T)) xi \|^2 + \| xi \|^2 \)) . $
  Combine the trace bound in (7.17) with the arithmetic–geometric mean inequality for eigenvalues and the ball-volume estimate
  $ "vol" \( B_m \( 1 \) \) lt.eq \( C \/ sqrt(m) \)^m . $
  This gives
  $ 2^(m \/ 2) "vol" \( B_m \( 1 \) \) det \( upright("Id")_m + P A A^(sans(T)) \)^(1 \/ 2) lt.eq (C sqrt(\( 1 + P \) \/ q))^(3 q) lt.eq (C sqrt(1 + P \/ q))^(3 q) . $
  Sum over the net. The identity-matrix enlargement handles zero or small singular values without any inverse Jacobian. For varying normals, the sets in (7.18) form a finite union of continuous images of compact parameter sets. They provide a compact measurable containing set for use in 40. ◻
]

#thm([Lemma 7.11.])[
  (Time order and relative speeds).  #emph[In a slab containing $q_i$ ordinary atoms, retain the partial order induced on those atoms by the full original graph, including chains through exceptional atoms. Let $cal(T)_i$ be its time-order region in that slab. On the original support with total birth energy at most $P$, 
#[#set math.equation(numbering: n => "(7.19)")
 $ \| cal(T)_i \| thin sup product_(a upright(" ordinary in slab ") i) \| v_a - v_(* a) \| lt.eq frac(tau^(q_i) \( 2 q_i P \)^(q_i \/ 2), q_i !) . $ <eq:cutoff-time>]

 An empty slab contributes the factor one.]
] <lem:cutoff-time>

#proof[
  Let $e_i$ be the number of linear extensions of this partial order. Apart from equality hyperplanes, its time-order region is the disjoint union of $e_i$ simplexes, so $\| cal(T)_i \| = e_i tau^(q_i) \/ q_i !$.
  An antichain of ordinary vertices occupies disjoint incoming pairs on a common causal slice. To see this, place all strict ancestors of the antichain first in a total extension of the full graph. No two vertices in the antichain share a particle line. Their incoming states are present simultaneously on the resulting slice. Conservation at all original contacts, including exceptional contacts, bounds the sum of their pair energies by the total birth energy $P$. Retaining unborn and departed velocities as inactive coordinates makes the same argument valid in the presence of interfaces.
  For a fixed feasible velocity assignment write $a_v = \| v_v - v_(* v) \|$. Every antichain $cal(A)$ therefore satisfies
  $ sum_(v in cal(A)) a_v lt.eq sqrt(2 \| cal(A) \| P) lt.eq sqrt(2 q_i P) . $
  In the recursive enumeration of linear extensions, the available minimal vertices are an antichain at each step. Summing the products of their weights successively gives
  $ e_i product_v a_v lt.eq \( 2 q_i P \)^(q_i \/ 2) . $
  This bound holds for every feasible assignment, so also for the supremum of its product. Multiplication by $tau^(q_i) \/ q_i !$ proves (7.19). In particular, no assumption that the maximizing assignment is independent of the times is necessary. ◻
]

#thm([Lemma 7.12.])[
  (Summation with finitely many exceptional pieces).  #emph[Consider the positive low-complexity graph integrals obtained above. Suppose a cut sequence has $q = b - O_K \( 1 \)$ ordinary atoms and boundedly many exceptional pieces, whose conditional mass bounds have product $epsilon.alt^alpha \| log epsilon.alt \|^(C_(*))$. After summing spatial cells and energy bins in a polylogarithmic energy region, its integral is at most 
#[#set math.equation(numbering: n => "(7.20)")
 $ epsilon.alt^alpha \| log epsilon.alt \|^(C_(*)) \( C tau sqrt(L) \)^q . $ <eq:cutoff-sum>]

 The exponential base $C$ depends on the fixed kinetic envelopes and dimension, but not on $K \, L$.]
] <lem:cutoff-sum>

#proof[
  By Proposition 4.5, Lemma 3.1, choose $beta_(*) > 0$ and a common Gaussian Bol bound for all birth inputs, with $beta_(*)$ independent of $L$. For each birth factor use its spatial-cell decomposition
  $ \| g_i \( x \, v \) \| lt.eq C sum_(a in bb(Z)^3) m_(i \, a) upright(bold(1))_({ \| x - a \| lt.eq C }) e^(- beta_(*) \| v \|^2) \, #h(2em) sum_a m_(i \, a) lt.eq C . $
  The same form applies at time zero. Sum over the birth-cell indices at the end; their coefficients have total at most $C^n = C^(b + O_K \( 1 \))$.
  Decompose total birth energy into $\[ 0 \, 1 \]$ and the dyadic bins $\[ P \/ 2 \, P \]$, $P gt.eq 1$. On a bin, the Gaussian factors give $C^(b + O_K \( 1 \)) e^(- c P)$. Fixed birth cells and bounded energy localize each physical particle’s positions within a polynomially bounded distance of its birth cell over $\[ 0 \, T \]$. The same is true of its affine intercept. Thus each exceptional kernel has the position localization required by its stated uniform estimate, with an arbitrary but fixed cell-dependent center.
  For the ordinary steps use the relative speed rather than the smaller normal flux as $a_j$ in 40. Its quotient density is at most one. Pull out the product of the per-slab suprema in 42, on the original feasible support. Use the containing velocity sets of 41, and keep the full ordinary time orders. All gain-producing exceptional restrictions remain attached to their kernels. Other future restrictions may now be dropped when taking their uniform mass bounds. The ordinary sphere integration contributes $\( 4 pi \)^q$. After absorbing the bounded exceptional-net prefactor into the logarithmic power, the bin is bounded by
  $ epsilon.alt^alpha \| log epsilon.alt \|^(C_(*)) C^q e^(- c P) \( 1 + P \/ q \)^(3 q \/ 2) product_i frac(tau^(q_i) \( 2 q_i P \)^(q_i \/ 2), q_i !) . $
  When $q gt.eq 1$, Stirling’s inequality and convexity give
  $ q_i ! gt.eq \( q_i \/ e \)^(q_i) \, #h(2em) product_i q_i^(q_i) gt.eq \( q \/ L \)^q \, $
  with zero counts omitted. The last bound becomes
  #[#set math.equation(numbering: n => "(7.21)")
   $ epsilon.alt^alpha \| log epsilon.alt \|^(C_(*)) \( C tau sqrt(L) \)^q e^(- c P) \( P \/ q \)^(q \/ 2) \( 1 + P \/ q \)^(3 q \/ 2) . $ <eq:cutoff-energy-bin>]
  For $x = P \/ q$,
  $ sup_(x gt.eq 0) x^(1 \/ 2) \( 1 + x \)^(3 \/ 2) e^(- c x \/ 2) < oo . $
  Consequently the final three factors in (7.21) are bounded by $C^q e^(- c P \/ 2)$. Summing the dyadic bins costs only another absolute constant. The lowest bin is treated by the same bound with $P = 1$. If $q = 0$, integrate the bounded number of exceptional pieces directly; no time factor is asserted for them. This proves (7.20). ◻
]

=== 7.7 Summing the terminal witnesses <summing-the-terminal-witnesses>

#proof[
  Use the terminal witness reduction and choose $K$ as in (7.4). Apply 33. For the remaining graphs all velocities are polylogarithmically bounded. Decomposing the birth positions into cells as in 43 also gives the required local position regions: along each original particle line the physical travel distance is at most $T sqrt(P_epsilon.alt)$; its affine intercepts are within another $T sqrt(P_epsilon.alt)$. Their centers are fixed by the birth cells and may be arbitrary in the local estimates.
  First consider witnesses with $Gamma < r \( M_(upright("top")) \) lt.eq 2 Gamma$. Cut the terminal component freely and apply 39. The terminal atom set is order-convex: every lower atom lies in an earlier slab, while a directed path has increasing times. Straight continuations beyond the stopping contact add no atoms. Finish all lower components from their now fixed terminal data by 37. These lower components create no extra type-four singleton: by 21, each is attached to the terminal part through particle lines, without using initial links. The total cycle and crossing bounds give (7.14) for the entire cut sequence.
  In the primitive branch the product of exceptional masses is at most $epsilon.alt^(13 \/ 10) \| log epsilon.alt \|^(C_(*))$. In every other branch it is at most $epsilon.alt^(6 \/ 5) \| log epsilon.alt \|^(C_(*))$, by (7.12); a type-four singleton costs $mu = epsilon.alt^(- 2)$. The positions, exceptional variables, and intermediate-time choices only enlarge the fixed logarithmic exponent. Therefore 43 bounds either branch by
  $ epsilon.alt^(6 \/ 5) \| log epsilon.alt \|^(C_(*)) \( C tau sqrt(L) \)^(b - O_K \( 1 \)) . $
  We explain explicitly the uniformity needed to sum these bounds over graphs. For bounded $rho$, the unlabelled root and interface counting in Theorem 3.3, Corollary 4.10 costs $C_1^b$ times a fixed power of the cutoffs. The pure-collision cutting partitions have the same form by 36. The additional selected pairs, crossing labels, and initial coefficients have boundedly many choices of locations, and therefore cost only fixed-degree polynomials in the graph size. The exponential bases depend on $Gamma$ and the uniform kinetic envelopes; they do not depend on $K$ or $L$. The $K$-dependence is confined to the fixed polynomial and logarithmic exponents. To see explicitly why assigning slabs does not add a factor $L^b$, cut the bounded number of interface bonds and delete the bounded number of cycle bonds. The remaining atom forests have degree at most four. Ordered-tree encodings and the finite local C/O and serial-edge choices cost $C^b$; restoring bonds and marked ends costs $\( 1 + b \)^(O \( K + Gamma \))$. Each resulting component lies in one slab, so its slab choices cost only $L^(O \( K + Gamma + 1 \))$, a front constant. Equivalently, first choose the boundedly many occupied slab indices, then count the positive size compositions by $2^b$. Empty continued lines are bounded by the root and crossing counts. Choose $L$ so large that
  $ C_1 C tau sqrt(L) = C_1 C T \/ sqrt(L) < 1 \/ 2 . $
  The $O_K \( 1 \)$ missing ordinary factors contribute a constant depending on $K \, L$, and the geometric series in $b$ converges. The sum of this first class is
  #[#set math.equation(numbering: n => "(7.22)")
   $ O #scale(x: 120%, y: 120%)[\(] epsilon.alt^(6 \/ 5) \| log epsilon.alt \|^(C_(*)) #scale(x: 120%, y: 120%)[\)] . $ <eq:cutoff-cycle-sum>]
  For the other witnesses use $n \( M_(upright("top")) \) > Lambda_i$ and $r \( M_(upright("top")) \) lt.eq 2 Gamma$. Choose one terminal vertex as a free type-four seed and finish by 37; complete the lower part in the same manner. There is one activity loss $mu$, and no gain is required. Degree counting again leaves $b - O_K \( 1 \)$ ordinary vertices. Moreover $b gt.eq b \( M_(upright("top")) \) = n \( M_(upright("top")) \) - 1 + r \( M_(upright("top")) \) gt.eq Lambda_i - 1$. The same summation now gives
  $ C_(*) epsilon.alt^(- 2) \| log epsilon.alt \|^(C_(*)) sum_(b gt.eq Lambda_i - 1) 2^(- b) \, $
  which is smaller than every fixed power of $epsilon.alt$, since $Lambda_i gt.eq \| log epsilon.alt \|^30$.
  Finally sum over the finitely many slabs and add the coarse high-complexity, high-energy, and expansion remainders. For sufficiently small $epsilon.alt$, (7.22) is bounded by $C epsilon.alt^(1 + 1 \/ 20)$. This proves (7.1).
  The order of choices is worth recording. The local exponent $delta$ and the finite hierarchy in 39 fix $Gamma_0$ using only dimensional constants. Choose $Gamma$, then choose $L$ for the imported estimates and the common exponential base. Only afterwards choose the complexity threshold $K$, localization powers, and the sufficiently small upper bound on $epsilon.alt$. No observation number or moment order enters the first two choices. ◻
]

== 8 Exact centering and the hard-sphere fluctuation limit <sec:transfer>

The pasted Gaussian limit and the dynamical comparison have now been proved independently. Choose $Gamma$ large enough for Theorem 4.9, Proposition 7.1, and then fix $L$ large enough for those results and 22. Their thresholds depend only on the fixed kinetic data and $Gamma$, not on the observation list or moment order. Thus all three results apply to one pasted dynamics. The remaining step is to transfer its exact centering, since equality outside an event of small probability alone would not compare expectations at the fluctuation scale.

#thm([Lemma 8.1.])[
  (Exact-centering comparison).  #emph[Let the true and pasted dynamics start from the same initial ensemble. Under the cutoff estimate of 32, the expectation of any fixed bounded empirical observation list differs between the two dynamics by $o \( mu^(- 1 \/ 2) \)$. Consequently the corresponding exact-centered fluctuation vectors have the same weak limits.]
] <lem:center-transfer>

#proof[
  Let $cal(E)_epsilon.alt$ be the event that the two trajectories separate at some time in $\[ 0 \, T \]$. By 32, $bb(P) \( cal(E)_epsilon.alt \) = O \( epsilon.alt^(1 + eta) \)$ for some $eta > 0$. Both dynamics preserve $N$, and their observations coincide on its complement. For the scalar record sum, denoted by $S^(epsilon.alt \, upright("tr"))$ and $S^epsilon.alt$ on the two dynamics,
  $ \| S^(epsilon.alt \, upright("tr")) - S^epsilon.alt \| lt.eq 2 M_(upright("obs")) N upright(bold(1))_(cal(E)_epsilon.alt) . $
  Choose an integer $p > \( 1 + eta \) \/ eta$. By Hölder’s inequality and (2.4),
  #[#set math.equation(numbering: n => "(8.1)")
   $ frac(\| bb(E) S^(epsilon.alt \, upright("tr")) - bb(E) S^epsilon.alt \|, sqrt(mu)) & lt.eq 2 M_(upright("obs")) sqrt(mu) #scale(x: 120%, y: 120%)[\(] bb(E) \( N \/ mu \)^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) bb(P) \( cal(E)_epsilon.alt \)^(1 - 1 \/ p)\
 & lt.eq C_p thin epsilon.alt^(- 1 + \( 1 + eta \) \( 1 - 1 \/ p \)) arrow.r 0 . $ <eq:limit-center-estimate>]
  The uncentered sums divided by $sqrt(mu)$ differ only on an event whose probability tends to zero, so their difference tends to zero in probability. Equation (8.1) gives the same conclusion after subtracting their respective exact expectations. This argument applies to each component of a finite list, or directly to all its linear combinations. It requires no bound on high moments of the scaled fluctuation restricted to $cal(E)_epsilon.alt$. ◻
]

#proof[
  The Gaussian generalized field, its initial covariance, its noise normalization, and its well-posedness have been established in 7. Fix an arbitrary real linear combination of the finitely many empirical observations in the theorem, and use its coefficients in the mark updates (6.1). The exact identity (6.2), 31, and 44 give convergence of this linear combination, with the exact microscopic centering, to the corresponding linear combination of the Gaussian observations. Its variance is (6.15), hence is the variance specified by (2.23). Since this holds for every real choice of coefficients, the Cramér–Wold theorem proves (1.11). ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
