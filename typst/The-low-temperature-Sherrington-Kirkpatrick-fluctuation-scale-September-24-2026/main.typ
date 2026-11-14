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

#align(center)[#text(size: 16pt, weight: "bold")[The low-temperature Sherrington--Kirkpatrick \
fluctuation scale]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $\( g_(i j) \)_(1 lt.eq i < j lt.eq n)$ be independent standard Gaussian random variables.
  For a fixed inverse temperature $beta > 1$, define

$ H_n \( sigma \) = beta / sqrt(n) sum_(1 lt.eq i < j lt.eq n) g_(i j) sigma_i sigma_j \, wide Z_n =
  2^(- n) sum_(sigma in { - 1 \, 1 }^n) e^(H_n \( sigma \)) \, wide F_n = log Z_n . $

The normalization of the spin sum changes $F_n$ by a deterministic constant and therefore has no effect on
  centered fluctuations.

#thm([Theorem 1.1.])[
  #emph[For every fixed $1 < beta < oo$,
$ "sd" \( F_n \) = n^(1 \/ 6 + o \( 1 \)) \, wide "Var" \( F_n \) = n^(1 \/ 3 + o \( 1 \)) . $

 More explicitly, for every $eta > 0$ there is $n_0 \( beta \, eta \)$ such that
$ n^(1 \/ 6 - eta) lt.eq "sd" \( F_n \) lt.eq n^(1 \/ 6 + eta) wide \( n gt.eq n_0 \( beta \, eta \) \) . $

 Moreover, for every $eta > 0$,
$ bb(P) #h(-0.16667em) (n^(1 \/ 6 - eta) lt.eq \| F_n - bb(E) F_n \| lt.eq n^(1 \/ 6 + eta)) arrow.r 1 . $

]
] <thm:main>

For the free-energy density $F_n \/ n$, the standard-deviation and typical-magnitude exponents are $- 5 \/ 6$,
  and the variance exponent is $- 5 \/ 3$. Multiplication by the fixed physical factor $-
  1 \/ beta$ has no effect on these exponents. Theorem 1 concerns power exponents;
  it gives neither a limiting law nor a nonzero constant prefactor.
  The temperature is fixed throughout, with no uniform conclusion as $beta$ approaches $1$ or infinity.

=== 1.1 History and significance <history-and-significance>

The Sherrington–Kirkpatrick model #cite(label("SK1975")) separates two questions:
  the limiting free energy and its fluctuations between disorder samples.
  Parisi introduced the hierarchy of order parameters underlying the variational prediction for the first
  #cite(label("Parisi1979")). Guerra and Toninelli #cite(label("GuerraToninelli2002")) established the
  thermodynamic limit by Gaussian interpolation, and Guerra’s variational bound #cite(label("Guerra2003")) and
  Talagrand’s matching result #cite(label("Talagrand2006")) identified its Parisi value.
  Panchenko subsequently established the formula for general mixed $p$-spin models,
  including odd interactions #cite(label("Panchenko2014")).
  These results determine the leading extensive term; the fluctuations studied here occur on a smaller scale.

The prediction of that scale has a separate history. Kondor’s replica expansion near the critical temperature
  #cite(label("Kondor1983")) is the starting point of the calculation described by Parisi and Rizzo
  #cite(label("ParisiRizzo2008")) #cite(label("ParisiRizzo2009")).
  Crisanti, Paladin, Sommers, and Vulpiani #cite(label("CPSV1992")) predicted a scale $n^(- 5 \/ 6)$ for the
  physical free energy per spin in the low-temperature, zero-field phase.
  At fixed $beta$, this corresponds to $n^(1 \/ 6)$ for the log partition function.
  Parisi and Rizzo developed the associated rare-deviation calculation through the low-temperature phase.
  Inferring typical fluctuations from that calculation requires an additional matching assumption,
  discussed in #cite(label("ParisiRizzo2009")) Section VI. Theorem 1 establishes the predicted one-sixth exponent
  with arbitrarily small power slack, for every fixed finite $beta > 1$.

At fixed high temperature $0 < beta < 1$, order-one Gaussian fluctuations go back to Aizenman, Lebowitz,
  and Ruelle #cite(label("AizenmanLebowitzRuelle1987")). Chatterjee’s work on disorder chaos and
  superconcentration #cite(label("Chatterjee2009")) Theorem 1.5 gives $"Var" \( F_n \) = O_beta \( n \/ log n \)$,
  and his later lower-bound method proves constant-scale nonconcentration
  #cite(label("Chatterjee2019LowerBounds")) Theorem 2.4. Chen and Lam obtained a critical-temperature variance
  upper bound of order $\( log n \)^2$ #cite(label("ChenLam2019Critical")).
  At the critical point, Du and Huang subsequently proved variance $1 / 6 log n +
  O \( 1 \)$ and a Gaussian limit #cite(label("DuHuang2026Critical")) Theorem 1.3.
  Critical-window limit theorems concern temperatures approaching the transition
  #cite(label("ChengLiuShaoXu2026CriticalWindow")).

For the fixed low-temperature regime considered here, Aronow and Lopatto #cite(label("AL2026")) Theorem 1.4 prove,
  for all sufficiently large $n$,

$ c_beta n^(4 \/ 15) lt.eq "Var" \( F_n \) lt.eq C_beta n^(7 \/ 15) . $

Their positive-transform and deviation estimates are a direct antecedent of the present argument.

The structure of the scalar Parisi minimizer is also essential.
  Auffinger and Chen established origin-support and regularity properties
  #cite(label("AuffingerChenProperties2015")), and proved uniqueness through a stochastic-control representation
  #cite(label("AuffingerChenUniqueness2015")). Jagannath and Tobasco developed variational support and
  self-consistency conditions #cite(label("JagannathTobasco2017")).
  After Zhou’s interval-support result near the critical temperature #cite(label("Zhou2025")),
  Lopatto #cite(label("Lopatto2026")) Theorem 1.1 established interval support $\[ 0 \, q_beta \]$ and the
  corresponding density structure at every fixed $beta > 1$.
  We use this theorem together with the support self-consistency in #cite(label("Lopatto2026")) Lemma 2.2.
  The strictly positive initial density needed here is then derived from scalar diffusion identities and a strict
  fourth-derivative estimate in Section 5.

=== 1.2 Proof strategy and method ancestry <proof-strategy-and-method-ancestry>

Set $T = beta^2$. We work with the completed covariance

$ bb(E) \[ H_n^c \( sigma \) H_n^c \( tau \) \] = frac(n T, 2) R \( sigma \, tau \)^2 \, wide
  R \( sigma \, tau \) = frac(sigma dot.op tau, n) . $

Here $H_n^c = H_n + D$, where $D$ is an independent common Gaussian of variance $T \/ 2$, and $F_n^c = F_n + D$.
  This completion gives the displayed quadratic covariance; the added noise is removed in the final step.

The quantitative target is a positive Laplace window for $log bb(E) exp {
  s \( F_n^c - bb(E) F_n^c \) }$ when $s$ exceeds $n^(- 1 \/ 6)$ by an arbitrarily small fixed power of $n$
  (Proposition 59). To compare these transforms, we reveal Gaussian covariance in stages and integrate a stage at
  mass $u$ by the operation $X mapsto u^(- 1) log bb(E) e^(u X)$, with expectation at $u = 0$.
  Nondecreasing paths specify the cumulative interaction and external-field covariance.
  Copies of the spin system can share selected stages of this revelation;
  their prescribed common prefixes form the finite trees used in the proof.

This hierarchical framework belongs to the lineage of Parisi recursion,
  Ruelle’s cascades #cite(label("Ruelle1987")), and Gaussian interpolation #cite(label("GuerraToninelli2002"))
  #cite(label("Guerra2003")). The cavity variational principle of Aizenman, Sims,
  and Starr #cite(label("AizenmanSimsStarr2003")) is a further antecedent for comparisons that remove or add
  sites. We construct the finite positive transition laws used here directly.

The closest analytic predecessor is Aronow and Lopatto’s combination of a pinned Brascamp–Lieb variance estimate,
  optimized covariance interpolation, and positive moments #cite(label("AL2026")) Propositions 2.2–2.3 and
  Section 3. The extensions proved here concern paired interaction and field clocks, local comparisons,
  fixed higher moments, and grouped replica tests at the fluctuation scale.
  The continuous inverse-Hessian inequality is due to Brascamp and Lieb #cite(label("BL1976")).
  Its application after pinning one terminal spin configuration is proved in Section 2;
  the resulting moment estimate is for the full unconditioned planted path, not for an arbitrary fixed prefix.

A global replacement of both hierarchical pressures by their scalar Parisi limits loses too much at this scale.
  Instead, Section 3 optimizes short covariance comparisons over a nondecreasing overlap quantile.
  The resulting error consists of overlap variance and the mismatch between that quantile and the mean overlap.
  Under comparability of mass and overlap above the scale being tested,
  projection and pinned moment estimates make these errors small in every fixed moment at selected split levels.
  The polynomial saving can be chosen independently of that fixed moment order.

Section 4 turns these estimates into a scalar description of the mean overlap.
  Removing one spin produces a susceptibility correction that is too large under an absolute term-by-term bound.
  Additional test replicas give a finite system of identities whose iteration cancels that correction.
  For a block already containing observed replicas, the signed attachment contributions are summed before absolute
  values are taken. The number of test factors and the iteration depth remain fixed as $n$ grows.
  This gives the cubic one-site closure of Proposition 29, including the uniform version needed for moving split
  locations.

Section 5 uses that closure and the comparison’s first variation to determine its small-mass profile.
  A limiting scalar equation and a nonnegative variational potential exclude gaps in the rescaled overlap
  distribution, forcing a positive linear profile. The estimates hold in both mass and overlap coordinates,
  so an interval of negligible mass cannot conceal a gap of appreciable overlap length.
  The same section identifies macroscopic limits with the unique Parisi minimizer;
  its control proof follows the strict-convexity method of Auffinger and Chen
  #cite(label("AuffingerChenUniqueness2015")).

The local arguments assume regularity above the scale being tested.
  Section 6 removes this assumption by finite propagation. A failure is examined at a scale with a regular outer
  region. Sufficient comparison strength there already contradicts the direct profile result.
  In the remaining case, a stronger local comparison is constructed.
  If its error bound holds, agreement with the original comparison yields the same contradiction; if it fails,
  the next comparison has an error budget larger by a fixed power of $n$.
  A fixed number of repetitions exhausts the admissible range. Figure 1 records this alternative.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Selected bad parent scale#linebreak()Regular outer region]]])])
  content((7.1, 0), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Admissible child#linebreak()Stronger local comparison]]])])
  content((0, -3), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Child error bound holds#linebreak() Agreement with parent#linebreak() Small scale: outer regularity,#linebreak()then the direct profile#linebreak() Macroscopic scale: Parisi profile#linebreak() Contradiction at the parent scale]]])])
  content((7.1, -3), [#box(width: 5.903cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Child error bound fails#linebreak() Select a strength and minimizer#linebreak()with a bad child profile#linebreak() Larger error-budget parameter]]])])
  line((2.951, 0), (4.149, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((4.149, -0.525), (2.951, -1.35), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.1, -0.525), (7.1, -1.35), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((10.05, -3), (10.65, -3), (10.65, 1.2), (0, 1.2), (0, 0.525), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((5.325, 1.2), [#text(size: 9pt)[Repeat at the selected child strength]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: A selected bad parent scale has a regular outer region. The diagram concerns the remaining weak-strength case; a direct profile test already excludes sufficient local strength. Child-error success gives agreement. At a scale tending to zero, this supplies child outer regularity for the small-scale direct test; at a macroscopic scale, the Parisi profile applies instead. Either profile contradicts the parent failure (Lemma 52). Child-error failure selects a strength and minimizer, and then the next bad scale. Each child raises the error-budget parameter by a fixed power of system size. The covariance budget preserves admissibility, while this growth exhausts the allowed error range after a fixed number of steps (Proposition 53). This propagation is separate from the local finite-degree cavity recursion. ],
) <fig:proof-order>

Finally, Section 7 applies the resulting comparisons to obtain the positive Laplace window.
  A positive transform alone does not control variance or typical magnitude.
  Following the exponential augmentation argument of #cite(label("AL2026")) Proposition 5.1,
  we add an independent rate-one exponential variable to $F_n^c$.
  Gauge symmetry and Prékopa’s marginal theorem #cite(label("Prekopa1973")) give a log-concave density.
  Its moment and small-ball bounds convert the Laplace window into the standard-deviation and typical-magnitude
  assertions. Removing the added exponential and Gaussian variables completes the proof.

=== 1.3 Conventions <conventions>

All constants may depend on the fixed $T$. Small auxiliary exponents are chosen first and held fixed as $n arrow.r
  oo$. Assertions along test sequences permit passage to subsequences, but never an $n$-dependent iteration depth.
  We write $A lt.tilde B$ for an inequality with a constant independent of $n$,
  and $A asymp B$ when both inequalities hold. Dependence on a fixed moment order is indicated by a subscript.
  A polynomial saving means a factor $n^(- c)$ for some fixed $c > 0$;
  logarithmic losses are absorbed only after this saving has been established.

== 2 Gaussian hierarchies and their calculus <sec:foundations>

We construct the probability spaces and calculus for the next two sections.
  Pressure differentiation turns covariance perturbations into overlap errors in Section 3;
  moments on one planted path control those errors, and the finite-tree calculus organizes the fixed-degree cavity
  expansions of Section 4. Throughout this section $n$ is a positive integer and the prior on ${ - 1 \,
  1 }^n$ is uniform. All expectations include both the Gaussian variables and the indicated spin draws.
  The normalized planted law and its deterministic-weight variance estimate follow the framework of
  #cite(label("AL2026")) Section 2 and Proposition 2.2. We prove the higher-moment and finite-tree extensions
  needed here.

=== 2.1 Finite hierarchies and conditional covariances <finite-hierarchies-and-conditional-covariances>

Put $y \( sigma \) = sigma \/ sqrt(n)$ and $R \( sigma \, tau \) = y \( sigma \) dot.op y \( tau \)$.
  The two feature maps

$ phi.alt_b \( sigma \) = frac(sigma sigma^(sans(T)), sqrt(2 n)) \, wide phi.alt_h \( sigma \) = sigma $

take values in Euclidean spaces of dimensions $n^2$ and $n$, respectively.
  Their inner products are $n R^2 \/ 2$ and $n R$, and their squared norms are $n \/ 2$ and $n$.
  The use of all ordered spin products is harmless and makes the covariance realization immediate.

For the moment let $b \, h$ be nonnegative nondecreasing step functions on $\( 0 \, 1 \)$. Choose a common partition

$ 0 = m_0 < m_1 < dots.h.c < m_L < m_(L + 1) = 1 \, wide b \( u \) = b_j \, quad h \( u \) =
  h_j quad \( m_j lt.eq u < m_(j + 1) \) . $

Set $b_(- 1) = h_(- 1) = 0$. Write $Z_j$ for independent feature-space Gaussian vectors having coordinate
  variances $b_j - b_(j - 1)$ in the first feature space and $h_j - h_(j - 1)$ in the second.
  Zero variances are permitted. For a combined external field $z = \( z_b \, z_h \)$ define

$ F_L \( z \) = log (2^(- n) sum_sigma e^(z_b dot.op phi.alt_b \( sigma \) + z_h dot.op phi.alt_h \( sigma \))) \,
  wide F_(j - 1) \( z \) = 1 / m_j log upright(bold(E)) e^(m_j F_j \( z + Z_j \)) quad \( j = L \, dots.h \, 1 \) \, $

and $F_(- 1) \( 0 \) = upright(bold(E)) F_0 \( Z_0 \)$. Thus the operation at mass zero is expectation. Set

$ f_n \( b \, h \) = 1 / n F_(- 1) \( 0 \) - b_L / 4 - h_L / 2 . $

Common linear spin sources may be included in every terminal partition function.
  A source coupled to $y$, used only for differentiation and then set to zero, will be called a normalized spin source.

The associated planted law is constructed forwards. Draw $Z_0$ from its Gaussian law.
  Conditional on $G_(j - 1) = sum_(i < j) Z_i$, draw $Z_j$ with density

$ exp { m_j \[ F_j \( G_(j - 1) + Z_j \) - F_(j - 1) \( G_(j - 1) \) \] } $

relative to its Gaussian law. Finally draw $sigma$ from the Gibbs law in the field $G_L$.
  These are normalized transition kernels. At a specified split,
  replicas share the prefix and then use conditionally independent copies of all subsequent transitions.
  A finite deterministic tree of such splits defines a probability law,
  even when some split masses coincide or some covariance increments vanish.
  At a jump we specify whether the split is before or after the increment.
  Repeated empty steps allow these conventions to be recorded in a common partition.

Let $cal(F)_u$ be the prefix sigma-field after the revelation specified at $u$.
  For $m_j lt.eq u < m_(j + 1)$ it includes $G_j$. Define

$ X_u = upright(bold(E)) \[ y divides cal(F)_u \] \, wide C_u =
  upright(bold(E)) \[ y y^(sans(T)) divides cal(F)_u \] - X_u X_u^(sans(T)) \,\
S_u = upright(bold(E)) \| X_u \|^2 \, wide B_u = upright(bold(E)) parallel
  upright(bold(E)) \[ y y^(sans(T)) divides cal(F)_u \] #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 \,
  wide D_u^2 = B_u - S_u^2 \,\
L_u = y dot.op X_u - 1 / 2 \| X_u \|^2 . $

Here and below conditional expectation given a prefix means conditioning on its entire sigma-field.

#thm([Lemma 2.1.])[
  (Source derivatives).  #emph[The gradient of a continuation in a source coupled to a bounded feature $phi.alt$
    is the conditional mean of $phi.alt$. Its Hessian is the sum of the remaining conditional martingale
    covariance increments, weighted by the mass of each transition, with mass $1$ for the final spin draw.
    In particular, the Hessian $H_u$ in a normalized spin source satisfies
$ u C_u prec.curly.eq H_u prec.curly.eq C_u . $

 If $y_1 \, y_2$ are independent continuations from the prefix at $u$, then
$ upright(bold(E)) \( y_1 dot.op y_2 \) = S_u \, wide upright(bold(E)) \( y_1 dot.op y_2 \)^2 = B_u \, $

 and hence $D_u$ is the standard deviation of this overlap. Moreover,
$ D_u^2 = "Var" \( \| X_u \|^2 \) + 2 upright(bold(E)) \[ X_u^(sans(T)) C_u X_u \] + upright(bold(E)) "tr" C_u^2 . $

]
] <lem:found-source>

#proof[
  For $cal(T)_m F = m^(- 1) log upright(bold(E)) e^(m F)$, differentiation in any external source gives
  $ nabla cal(T)_m F = upright(bold(E))_m nabla F \, wide nabla^2 cal(T)_m F = upright(bold(E))_m nabla^2 F +
    m "Cov"_m \( nabla F \) \, $
  where $upright(bold(E))_m$ is the normalized tilted expectation.
    At the terminal spin sum the same formulas hold with mass $1$ and gradient $phi.alt$.
    Iteration proves the claimed Hessian representation. More explicitly, if $M_j =
    upright(bold(E)) \[ phi.alt divides cal(F)_(m_j) \]$ and $C_L^phi.alt =
    "Cov" \( phi.alt divides cal(F)_(m_L) \)$, the Hessian at the prefix indexed by $j$ is
  $ upright(bold(E))
    [C_L^phi.alt + sum_(k = j + 1)^L m_k \( M_k - M_(k - 1) \) \( M_k - M_(k - 1) \)^(sans(T)) thin mid(bar.v)
    thin cal(F)_(m_j)] . $
  The same expression without the mass factors is the conditional covariance of $phi.alt$.
    All remaining masses belong to $\[ u \, 1 \]$. This proves the matrix inequalities.
    Conditional independence proves the two overlap identities.
    Finally expand $parallel C_u + X_u X_u^(sans(T)) parallel_(upright("HS"))^2$ and subtract $S_u^2$. ◻
]

=== 2.2 Pressure derivatives and the pinned moment estimate <pressure-derivatives-and-the-pinned-moment-estimate>

The three estimates needed later can be collected as follows.
  In the first line, $d b \( u \) \, d h \( u \)$ are variations in a parameter indexing paths;
  they are not Stieltjes increments in $u$. In the second line $r$ increases along the planted path.
  Its derivative is taken on absolutely continuous parts. At a jump of the pair of clocks,
  fix the joint filling $\( b_(-) + t Delta b \, h_(-) + t Delta h \)$, $0 lt.eq t lt.eq 1$,
  at the jump’s constant mass. All intermediate revelations refer to this chosen filling.
  The pressure and susceptibility estimates allow a common deterministic source.
  The moment estimate is at zero deterministic external field,
  under the full unconditioned law of one planted path and its terminal spin configuration.
  For every deterministic $k in L^2 \( 0 \, 1 \)$ and $2 lt.eq p < oo$,

#[#set math.equation(numbering: n => "(1)")
 $ d f_n & = - 1 / 4 integral_0^1 B_u thin d b \( u \) thin d u - 1 / 2 integral_0^1 S_u thin d h \( u \) thin d u \,\
partial_r S_u & gt.eq n thin partial_r h thin upright(bold(E)) "tr" H_u^2 \,\
∥integral_0^1 \( L_u - upright(bold(E)) L_u \) k_u thin d u∥_p^2 & lt.eq
  c_p ∥integral_0^1 k_u^2 W_u thin d u∥_(p \/ 2) \, wide W_u = \( y - X_u \)^(sans(T)) H_u \( y - X_u \) \,\
 & #h(99.6264pt)  upright(bold(E)) W_u = upright(bold(E)) "tr" \( H_u C_u \) . $ <eq:1>]

One may take $c_2 = 1$ and $c_p lt.eq 1 + p^2 \/ 3$.

#thm([Lemma 2.2.])[
  (Gaussian pressure differentiation).  #emph[The first two lines of (1) hold for finite hierarchies,
    including degenerate Gaussian increments by continuity. In addition,
    for any common external source and any two admissible step paths,
$ \| f_n \( b \, h \) - f_n \( tilde(b) \, tilde(h) \) \| lt.eq 1 / 4 parallel b - tilde(b) parallel_(L^1) + 1 /
  2 parallel h - tilde(h) parallel_(L^1) . $

 The bound is uniform in the source when the same self correction is used.]
] <lem:found-pressure>

#proof[
  Consider first one feature map $phi.alt$ of constant squared norm $q$ and its cumulative covariance clock $c_j$.
    Let $A_j = upright(bold(E)) \| upright(bold(E)) \[ phi.alt divides cal(F)_(m_j) \] \|^2$.
    Gaussian heat differentiation of the increment $c_k - c_(k - 1)$,
    followed by the tilted chain rule through all earlier transitions, gives
  $ frac(partial F_(- 1) \( 0 \), partial \( c_k - c_(k - 1) \)) = 1 / 2 upright(bold(E)) { "tr" H_k^phi.alt +
    m_k \| M_k \|^2 } . $
  For $k = 0$ the second term is zero. The martingale decomposition in Lemma 2 gives the explicit telescoping sum
  $ upright(bold(E)) "tr" H_k^phi.alt = q - A_L + sum_(j = k + 1)^L m_j \( A_j - A_(j - 1) \) \, $
  so the last derivative equals
  $ q / 2 - 1 / 2 sum_(j = k)^L \( m_(j + 1) - m_j \) A_j . $
  Subtract $q c_L \/ 2$ from $F_(- 1) \( 0 \)$. On writing $d \( c_k - c_(k - 1) \) = d c_k - d c_(k - 1)$,
    the derivative becomes $- 1 / 2 sum_j \( m_(j + 1) - m_j \) A_j thin d c_j$.
    For the matrix feature $A_j = n B_(m_j) \/ 2$; for the field feature $A_j = n S_(m_j)$.
    Dividing by $n$ proves the pressure formula. All spin bounds used here remain true with an external source.
    Since $0 lt.eq S \, B lt.eq 1$, integration along the convex segment joining two monotone paths proves the
    asserted Lipschitz bound.
  To prove the second line, fill one Gaussian increment continuously at its fixed mass $m$.
    Its continuation solves the backwards heat equation with nonlinearity $m \| nabla F \|^2 \/ 2$.
    Under the normalized planted transition the driving Gaussian process acquires drift $m nabla F$.
    Differentiating the backwards equation cancels this drift in the stochastic differential of the source
    gradient. Thus $X$ is a martingale throughout the filled increment.
    Its diffusion coefficient against the spin field of clock $h$ is $sqrt(n) H$,
    since the actual field couples to $sqrt(n) y$. The independent matrix field contributes another positive
    semidefinite quadratic variation. Itô’s formula therefore gives
  $ d upright(bold(E)) \| X \|^2 = n upright(bold(E)) "tr" H^2 thin d h +
    upright(bold(E)) parallel J_b parallel_(upright("HS"))^2 thin d b \, $
  where $J_b$ is the mixed Hessian for the matrix feature and normalized spin source.
    The last term is nonnegative. Concatenation proves the claim along the path and through filled jumps.
    The heat differentiations may first be made with positive variances and then passed to zero variance by
    dominated convergence of the finite Gaussian integrals. ◻
]

#thm([Lemma 2.3.])[
  (Pinned moments for one planted path).  #emph[At zero normalized spin source and with no other deterministic
    external field, the last two lines of (1) hold with $c_2 = 1$ and $c_p lt.eq 1 + p^2 \/ 3$.
    All these moments concern one planted path and its terminal spin, with the full, unconditioned prefix law.]
] <lem:found-moments>

#proof[
  Write all independent Gaussian increments as linear images of a standard Gaussian vector $xi$.
    Multiply their normalized transition densities and the terminal Gibbs density,
    and then condition on the entire terminal configuration $sigma in { - 1 \, 1 }^n$.
    Terms at neighboring levels cancel. Up to an additive constant,
    the negative logarithm of the resulting density of $xi$ is
  $ U_sigma \( xi \) = 1 / 2 \| xi \|^2 - ell_sigma \( xi \) + sum_(j = 0)^L \( m_(j + 1) - m_j \) F_j \( G_j \) \, $
  where $ell_sigma$ is linear. Each continuation is convex, by Lemma 2.
    If $A_u$ is its Hessian in the underlying drivers, then
  $ Q := nabla^2 U_sigma = I + integral_0^1 A_u thin d u succ.curly.eq I . $
  Use a virtual normalized spin source $lambda$. The joint Hessian of the continuation in $\( xi \, lambda \)$ has
    blocks
  $ mat(delim: "(", A_u, B_u^(upright("mix")); \( B_u^(upright("mix")) \)^(sans(T)), H_u) succ.curly.eq 0 . $
  With the spin fixed, the driver gradient of $L_u$ is $g_u = B_u^(upright("mix")) \( y - X_u \)$.
    Positivity of this block matrix implies, for every driver direction $v$,
  $ \| v dot.op g_u \|^2 lt.eq \( v^(sans(T)) A_u v \) W_u . $
  Put $G = integral_0^1 k_u g_u thin d u$ and $J = integral_0^1 k_u^2 W_u thin d u$. Cauchy–Schwarz in $u$ gives
  $ \| v dot.op G \|^2 lt.eq (integral_0^1 v^(sans(T)) A_u v thin d u) J lt.eq \( v^(sans(T)) Q v \) J . $
  Taking $v = Q^(- 1) G$ proves $G^(sans(T)) Q^(- 1) G lt.eq J$.
  The classical Brascamp–Lieb variance inequality #cite(label("BL1976")) Theorem 4.1 applies to this
    finite-dimensional density: $U_sigma$ is smooth, its Hessian is bounded below by $I$,
    and it has Gaussian tails after a linear tilt. All required derivatives have at most the integrable growth
    allowed by this density; alternatively, one can first use smooth compactly supported approximations.
    It yields the conditional variance bound by $upright(bold(E)) \[ J divides sigma \]$.
  There is no change of centering on removing the pin. For $eta in { - 1 \, 1 }^n$, the transformation
  $ sigma_i mapsto eta_i sigma_i \, quad \( Z_h \)_i mapsto eta_i \( Z_h \)_i \,
    quad \( Z_b \)_(i j) mapsto eta_i eta_j \( Z_b \)_(i j) $
  is orthogonal in each Gaussian feature space, preserves the hierarchy, and sends $X$ to $eta X$.
    Consequently it preserves $L_u$ and $W_u$. This group acts transitively on terminal spins.
    The conditional law of $integral k_u L_u thin d u$, as well as that of $J$,
    is therefore independent of the pinned spin. In particular its conditional mean is its unconditional mean.
    Brascamp–Lieb proves the assertion for $p = 2$ with $c_2 = 1$.
  Here is an explicit extension to all real $p > 2$. Set $A =
    integral k_u \( L_u - upright(bold(E)) L_u \) thin d u$. Apply the same variance inequality to $\|
    A \|^(p \/ 2)$, using smooth regularizations at zero when necessary. Hölder’s inequality gives
  $ parallel A parallel_p^p lt.eq parallel A parallel_(p \/ 2)^p + p^2 /
    4 parallel A parallel_p^(p - 2) parallel J parallel_(p \/ 2) . $
  If $2 < p lt.eq 4$, the first term is bounded using $parallel A parallel_(p \/ 2) lt.eq parallel A parallel_2$.
    For $p > 4$ use the previously established bound at exponent $p \/ 2$ and $parallel J parallel_(p \/ 4) lt.eq
    parallel J parallel_(p \/ 2)$. If $parallel J parallel_(p \/ 2) = 0$, the variance bound already gives $A =
    0$. Otherwise put $t = parallel A parallel_p^2 \/ parallel J parallel_(p \/ 2)$ and $alpha = p \/ 2$. Then
  $ t^alpha lt.eq d^alpha + \( p^2 \/ 4 \) t^(alpha - 1) \, wide d = 1 med \( p lt.eq 4 \) \, quad d =
    c_(p \/ 2) med \( p > 4 \) . $
  This implies $t lt.eq d + p^2 \/ 4$: for $t gt.eq d$ divide by $t^(alpha - 1)$,
    and for $t < d$ the claim is immediate. Induction down the finite sequence $p \, p \/ 2 \, p \/ 4 \,
    dots.h$ now gives $c_p lt.eq 1 + p^2 \/ 3$. Finally, conditioning on the prefix gives $upright(bold(E)) W_u =
    upright(bold(E)) "tr" \( H_u C_u \)$. All integrals are justified first for bounded $k$ and then by $L^2$
    approximation; $\| X \| lt.eq 1$ and $0 prec.curly.eq H prec.curly.eq C prec.curly.eq I$ suffice for this passage. ◻
]

#prodef([Remark 2.4.])[
  For each fixed enlarged tree, first marginalize the other branches and apply Lemma 4 to the resulting
    single-path law. Then combine its moment bounds by unconditional Hölder under the positive tree law,
    and finally integrate the signed topology measure. The lemma is not applied after spin-dependent reweighting
    or conditioning on a fixed prefix; no joint-spin pinned inequality is used.
] <rem:found-single-pin>

=== 2.3 Signed replica sums at real masses <signed-replica-sums-at-real-masses>

The following convention permits covariance differentiation without any integer-replica or analytic-continuation
  assumption. An observed tree has a fixed finite set of labeled leaves, deterministic split masses,
  and specified revelation sides. A new summation label is allowed to coincide with an old leaf,
  to follow it for a time and then branch, or to branch at an existing fork.
  The corresponding expectations are always ordinary normalized planted expectations.
  Only the coefficients with which they are summed may be signed.

#thm([Proposition 2.5.])[
  (Covariance differentiation).  #emph[Let $K_theta \( u \; sigma \, tau \)$ be an affine family of cumulative
    Gaussian covariance kernels of a finite hierarchy. Assume that the independent increment covariances are
    positive semidefinite throughout the parameter interval. Let $V =
    partial_theta K_theta$ and let $P$ be a fixed bounded spin test on a fixed observed split tree. Then
#[#set math.equation(numbering: n => "(2)")
 $ frac(d, d theta) nu_theta \[ P \] = 1 / 2 sum_(c \, d) nu_theta \[ P V_(c d) \] . $ <eq:2>]

 The signed sum includes coincidences with old labels and between $c \, d$.
   For distinct labels, $V_(c d)$ is evaluated at their common revelation;
   on the diagonal it is evaluated at the terminal covariance.
   The exact weights are the real-power weights described in the proof.
   A constant diagonal contribution, independent of the summation label, sums to zero.
   Conditional means in $P$ can be represented by independent additional replicas at their specified prefixes
   before this formula is applied.]
] <prop:found-replica>

#proof[
  It is enough to prove the formula for a finite hierarchy with positive masses and nondegenerate increments;
    degenerate cases follow by one-sided limits. At a node with incoming mass $a$ and next child mass $b$,
    let $I$ denote the next child integral. Without observations the expression at this node is $I^(a \/ b)$.
    If $k$ distinguished children are prescribed, normalization of the planted transitions gives precisely
  $ I^(a \/ b - k) product_(i = 1)^k I_i \, $
  where $I_i$ is the corresponding tested child integral. A general spin test is a finite linear combination of
    products of single-slot tests, so this identity also determines its expectation by linearity.
    This finite expansion is used only for the identity, not to estimate its norm.
  Gaussian differentiation at one covariance increment supplies two derivative slots and a factor $1 \/ 2$.
    Above that increment ordinary chain rules propagate the integral derivative;
    below it product and power rules allocate the two field derivatives.
    A hit on an existing child has multiplicity one. If $h$ distinct new children are used,
    the power-rule coefficient is $\( a \/ b - k \)^(underline(h))$.
    Each new child integral carries its incoming factor $b$, so its effective coefficient is the polynomial
  $ b^h \( a \/ b - k \)^(underline(h)) = product_(j = 0)^(h - 1) #scale(x: 120%, y: 120%)[\(] a - \( k + j \) b
    #scale(x: 120%, y: 120%)[\)] . $
  This identity holds for the actual real masses. In particular it has no division by a small mass.
    A double hit in the same child is retained as such. The final spin summation is the same product calculation
    with child mass $1$.
  More explicitly, give every derivative slot a distinct label in a finite set $S$, even when directions agree,
    and write $D_A = product_(s in A) D_s$, $D_diameter = 1$, and $alpha = a \/ b - k$. The labeled product rule is
  $ D_S #h(-0.16667em) (I^alpha product_(i = 1)^k I_i) = sum_(\( S_1 \, dots.h \, S_k \, pi \))
    alpha^(underline(\| pi \|)) I^(alpha - \| pi \|) product_(B in pi) D_B I product_(i = 1)^k D_(S_i) I_i . $
  Here the $S_i$ are disjoint subsets assigned to existing children,
    and $pi$ is an unordered partition of their complement in $S$ into nonempty blocks, one per new child.
    Thus no additional $\| pi \| !$ occurs. Factoring the incoming $b$ from every new-child derivative gives the
    polynomial coefficients above; zero masses use these polynomial coefficients and the one-sided limits of the
    normalized child laws. Recursing with these labeled partitions proves equality of each final labeled-topology
    coefficient for every order of allocating the slots, before any spin expectation is evaluated.
    Coincident labels occupy one terminal node. Consequently allocation order may be changed with any bounded
    function of the final topology carried along, before taking absolute variation.
  For completeness, at the root perform the calculation on $e^(a_0 F_(upright("root")))
    nu \[ P \]$ with an auxiliary incoming power $a_0$. Set $a_0 = 0$ after differentiation.
    The derivative of the prefactor then vanishes and the normalized expectation remains.
    This is an algebraic identity in derivatives of positive real powers;
    there is no inference from values at integer masses. Summing the changes of independent covariance increments
    assigns to a pair the change accumulated along exactly its shared prefix, which is $V_(c d)$. This proves (2).
  The one-label sum at the root has total weight $a_0 = 0$, as can also be seen directly in Lemma 7.
    Hence a constant diagonal term multiplied by an old-label test sums to zero.
    A common source differentiation uses one derivative slot in the identical calculation.
    Auxiliary leaves representing conditional means may be marginalized at any point because all their transitions
    are normalized. ◻
]

#thm([Lemma 2.6.])[
  (Attachment measures and row sums).  #emph[Fix an enclosing block of mass $a in \[ 0 \, 1 \]$ containing $r
    gt.eq 1$ observed leaves. After grouping placements which induce the same extended tree,
    one free summation label has the following signed attachment measure:]
  + #emph[weight $+ 1$ for coincidence with each observed leaf;]
  + #emph[measure $- d m$ on every occupied open edge, parameterized by its increasing mass coordinate;]
  + #emph[weight $\( 1 - d_v \) u_v$ at an observed fork of mass $u_v$ with $d_v$ occupied children,
    including an initial fork if present.]
  #emph[The total signed mass is $a$ and the total variation is $2 r - a lt.eq 2 r$.
    For an empty block the first label has weight $a$. Consequently, adjoining $k$ labels to a tree with $r gt.eq
    1$ old labels has total variation at most
$ 2^k r \( r + 1 \) dots.h.c \( r + k - 1 \) . $

 Adjoining $k gt.eq 1$ labels in a previously empty block has variation at most $a thin 2^(k - 1) \( k - 1 \) !$.
   These bounds are independent of the mass partition. A free row whose summand is independent of the detailed
   attachment inside a block of mass $u$ collapses exactly to $u$ times that summand.]
] <lem:found-attachment>

#proof[
  At a node of mass $a'$ having $d$ occupied children of next mass $b'$,
    the coefficient of a previously unoccupied child is $a' - d b'$, by the one-slot real-power rule.
    If $d = 1$, consecutive refinements telescope to the negative of the length of the occupied edge.
    When several occupied children first separate at $u_v$, write the coefficient as its edge part plus
    $\( 1 - d_v \) u_v$. At a terminal singleton the existing-label hit has coefficient $1$.
    These are exactly the three listed contributions.
  To compute their sum, let the occupied edge lengths be $ell_e$.
    Summing endpoint differences over the finite tree gives
  $ sum_e ell_e + sum_v \( d_v - 1 \) u_v = r - a . $
  Indeed each terminal contributes $1$, the initial point contributes $- a$,
    and at a fork the endpoint contributions equal $- \( d_v - 1 \) u_v$.
    All contributions except the $r$ coincidences are nonpositive.
    Their signed sum is $a$, and their total absolute sum is $r + \( r - a \)$.
    If there is no occupied child, the one-slot coefficient is simply $a$.
    Insert further labels sequentially and apply the variation bound to the enlarged occupied tree.
    The row-sum assertion follows before taking absolute values from the total signed mass calculation.
    Empty covariance steps merely subdivide edges and change none of these identities. ◻
]

#prodef([Remark 2.7.])[
  (What a small mass does and does not imply).  The first entry into an empty block of mass $u$ costs a factor
    $u$. Likewise departures on an initial interval of length $u$ have total variation at most a constant,
    depending on the old leaf count, times $u$. Subsequent fixed numbers of allocations retain this factor by
    Lemma 7. However, the coefficient $a - k b$ need not be $O \( a \)$ if $b gt.double a$.
    A small enclosing mass alone does not supply a factor to every ungrouped term.
    For two slots in an empty block, the two different-child coefficient is $a \( a - b \)$ and the same-child
    contribution on a constant test is $a b$. Their signed total is $a^2$,
    whereas their absolute sum need only be $O \( a \)$. All small-mass savings below use an actual first entry or
    an exact row collapse.
]

#thm([Lemma 2.8.])[
  (Densities of split levels).  #emph[Fix a finite observed tree with at most $q$ leaves and allocate at most $k$
    new labels. Apart from coincidences and atoms at specified old forks or cuts,
    the split mass of any specified pair involving a new label has a Lebesgue density with total variation bounded
    by a constant $C_(q \, k)$. The same statement holds when some old fork masses are themselves integrated
    against a measure of bounded density, with the resulting bound multiplied by that density bound.
    These assertions concern the signed attachment measure and its variation,
    not the size of a spin observable at a pointwise split level.]
] <lem:found-split-density>

#proof[
  Allocate the specified pair before the other new labels, using equality of the underlying finite product
    derivatives to reorder the allocations. If one label is old,
    its non-atomic separation from the new label occurs on an occupied edge and has density of absolute value $1$;
    there are at most a number of edges depending on $q$. Old forks give precisely the listed atoms.
    If both labels are new, first place one of them. A fork created by a placement on an edge already has a
    bounded mass density. The second label either separates on an edge, attaches at an old fork,
    or attaches at this newly created fork. The last coefficient is bounded by the number of occupied children,
    because its mass is at most $1$. It therefore preserves the density bound in that variable.
    Coincidences are kept separate. All remaining allocations have bounded total variation by Lemma 7.
    Integration over an old fork variable with bounded density is the same argument followed by Fubini.
    The reordering was an exact identity before any absolute values were taken,
    so it introduces no cancellation assumption in the final variation estimate. ◻
]

#thm([Lemma 2.9.])[
  (Uniform Taylor bounds).  #emph[Under the hypotheses of Proposition 6,
    suppose $P$ uses at most $q$ labels and $\| V \( u \; sigma \, tau \) \| lt.eq M$.
    For each fixed integer $j gt.eq 1$ there is $C_(q \, j) < oo$, independent of the number of covariance steps,
    such that
$ lr(|frac(d^j, d theta^j) nu_theta \[ P \]|) lt.eq C_(q \, j) M^j parallel P parallel_oo . $

 More precisely the derivative is an integral over a signed measure of extended trees with uniformly bounded total
   variation, of expectations of $P$ times $j$ covariance insertions, with the factor $2^(- j)$.
   Hölder’s inequality can therefore be applied to these integrands under their genuine probability laws.
   If $P gt.eq 0$, then
$ lr(|frac(d, d theta) nu_theta \[ P \]|) lt.eq C_(q \, 1) M nu_theta \[ P \] \, $

 and hence
$ e^(- C_(q \, 1) M \| theta - theta' \|) nu_(theta') \[ P \] lt.eq nu_theta \[ P \] lt.eq
  e^(C_(q \, 1) M \| theta - theta' \|) nu_(theta') \[ P \] . $

 The assertions require that the test, including any scalar centers in it, be fixed during the interpolation.
   For parameter-dependent tests the ordinary product-rule derivatives must also be included.]
] <lem:found-taylor>

#proof[
  Iterate (2). Affineness makes every covariance insertion fixed,
    so the $j$th derivative has $2 j$ additional labels and $j$ insertions.
    Lemma 7 bounds the variation of the resulting measure by a constant depending only on $q \, j$.
    This proves the first two assertions, including Taylor’s integral remainder.
    For a nonnegative old-label test, each extended law has the same old-label marginal.
    Consequently $nu_theta \[ \| P V_(c d) \| \] lt.eq M nu_theta \[ P \]$ for every attachment,
    giving the differential inequality. Integrating it, or using the integral form of Grönwall’s inequality when
    the expectation vanishes, proves the comparison. ◻
]

#thm([Corollary 2.10.])[
  (Source derivative bounds).  #emph[For fixed $n$, every derivative order of a continuation in bounded feature
    directions has a bound independent of the mass partition,
    uniform over the external source and the admissible bounded covariance clocks.
    The bound depends only on the order and the suprema of the feature directions.]
] <cor:found-source-bounds>

#proof[
  The first derivative is the conditional feature mean. Differentiate it with the one-slot version of
    Proposition 6, and repeat. Every additional derivative introduces one bounded feature and one summation label.
    Lemma 7 bounds each successive attachment measure. A continuation beginning at a prescribed prefix is treated
    as a rooted hierarchy by adjoining empty earlier steps; its prefix is a deterministic external source.
    This makes the same argument applicable without any lower bound on its first mass. ◻
]

=== 2.4 Cut truncations and conditional couplings <cut-truncations-and-conditional-couplings>

We record the precise finite-tree facts needed when a free row is replaced by a row truncated at a cut.
  A detailed attachment of a new label $r$ is truncated at $t$ as follows.
  If it already departs from the old tree before $t$, nothing is changed.
  Otherwise retain its old ancestor through the prescribed revelation at $t$ and then draw its continuation
  independently of the old descendants. Thus deeper placements in the same occupied block at $t$ give the same
  truncated law. The old-label marginal is always unchanged.

#thm([Lemma 2.11.])[
  (Variation of a cut layer).  #emph[Fix an old tree with at most $q$ leaves in a block of mass $U$,
    and a free row label $r$ in that block. Let $U lt.eq v lt.eq w lt.eq min \( 2 v \, 1 \)$.
    The difference of its signed row tests truncated at $w$ and at $v$ can,
    after exact grouping of the deeper placements, be written as a signed combination of pairs of planted laws
    with total coefficient variation at most $C_q v$. In each pair the old-label tree is the same,
    and only the coupling of $r$ to one occupied descendant subtree after the revelation at $v$ differs.
    One may take $C_q = 12 q$.]
  #emph[The statement remains true when the row is multiplied by a bounded coefficient depending on the fixed old
    topology, multiplied into the bound by its supremum. For the exact collapse of deeper placements this
    coefficient, and all scalar centers in the row test, must be independent of $r$’s detailed attachment beyond
    the truncation cut. Allocation-order symmetry carries the full topology coefficient with it;
    it does not establish the independence required for a free-row collapse.
    At each recursion generation, freeze the previously generated topology, its coefficients,
    and earlier scalar centers before introducing fresh slots.
    A current coefficient depending on the row’s deeper placement must remain explicit until eliminated or
    estimated. Only after this row calculation may the enlarged topology be frozen for the next generation.]
] <lem:found-cut-truncation>

#proof[
  Contributions departing before $v$ are identical and cancel.
    There are at most $q$ occupied subblocks at either cut. Inside an occupied subblock at $w$,
    every deeper placement gives the same $w$-truncated expectation, so its signed sum is exactly $w$ by Lemma 7.
    These collapsed tails have total absolute coefficient at most $q w lt.eq 2 q v$.
    Departures on edges between $v$ and $w$ have total length at most $q \( w - v \) lt.eq q v$.
    Fork atoms in this layer have total absolute weight at most $w sum \( d_v - 1 \) lt.eq 2 q v$.
    Treat forks lying exactly on a cut with the chosen revelation side; the same estimate covers them.
    Each of these grouped contributions is the difference between retaining its indicated coupling after $v$ and
    making $r$ independent at $v$; the old marginal is preserved in both laws.
    Counting the two terms of these pairs gives at most $10 q v$,
    and $12 q v$ allows terminal coincidences with either cut convention.
    A terminal coincidence can occur in the layer only if $w = 1$, in which case $v gt.eq
    1 \/ 2$ and its unit weight is covered by the same bound.
    Before that layer it is already included in a collapsed tail.
    The asserted restriction on coefficients is exactly what is needed for the identical-expectation grouping,
    and no further independence from the old tree is used. ◻
]

#thm([Lemma 2.12.])[
  (Centered coupling difference).  #emph[Consider either pair of laws in Lemma 12.
    Let $cal(G)$ be the sigma-field generated by their complete common prefix through the prescribed revelation at
    $v$, the realizations of all old branches outside the affected descendant subtree after $v$,
    and the deterministic old topology. No information from the continuation of $r$ or from the affected old
    subtree after $v$ is included in $cal(G)$. Let $F$ be a function of $r$ and this exterior information,
    and let $P$ be a function of the old subtree and the exterior information.
    The two laws have the same conditional marginal law of $F$ given $cal(G)$ and the same conditional marginal
    law of $P$ given $cal(G)$. Write their common conditional means as $macron(F) \, macron(P)$.
    Their difference therefore obeys
$ \( upright(bold(E))_1 - upright(bold(E))_0 \) \[ F P \] = \( upright(bold(E))_1 - upright(bold(E))_0 \) \[ \(
  F - macron(F) \) \( P - macron(P) \) \] . $

 If $p^(- 1) + p' ""^(- 1) = 1$, its absolute value is at most
$ sum_(i = 0)^1 parallel F - macron(F) parallel_(L^p \( upright(bold(P))_i \)) parallel P -
  macron(P) parallel_(L^(p') \( upright(bold(P))_i \)) . $

 Each centered norm is at most the corresponding norm of the difference from an independent resampling with the
   same conditional marginal given $cal(G)$. Consequently uniform resampling bounds $A_v \,
   B_v$ for these two factors give a bound $2 C_q v A_v B_v$ for the full cut layer.]
] <lem:found-coupling>

#proof[
  Normalize and integrate every branch not retained in the conditioning.
    Normalization of the transition kernels preserves the old subtree law.
    It also gives the same single-continuation marginal for $r$, whether $r$ follows an old branch for longer,
    coincides with an old terminal label, or is made independent immediately after $v$.
    Conditional on $cal(G)$, the exterior information can change the distribution of the shared prefix but not the
    normalized future kernels in the affected subtree. This proves the two marginal assertions.
    Expand $F P = \( F - macron(F) \) \( P - macron(P) \) + macron(F) P + macron(P) F - macron(F) macron(P)$;
    the last three terms have equal expectations under the two laws.
    Hölder’s inequality gives the displayed bound after averaging over $cal(G)$.
    If $F'$ is an independent conditional copy, then $F - macron(F) =
    upright(bold(E)) \[ F - F' divides F \, cal(G) \]$, so Jensen’s inequality gives the resampling bound;
    the argument for $P$ is identical. Finally integrate against the coefficient measure of Lemma 12.
    Conditional bounds uniform in the realized prefix are not needed:
    bounds in the displayed unconditional $L^p$ norms suffice. ◻
]

#thm([Lemma 2.13.])[
  (Boundary tests).  #emph[Fix a cut $U$ and its old descendant blocks.
    Let $P$ be a polynomial of fixed degree in overlaps between different blocks, centered by fixed scalars,
    and in products of such overlaps with fresh auxiliary leaves split at specified cuts.
    Assume that each overlap involving an affected old subtree has its other endpoint outside that subtree.
    Bounded coefficients may depend on the entire fixed old topology.
    All scalar centers may be expectations on an earlier tree,
    provided they are held fixed during the current row interpolation.]
  #emph[On resampling the affected subtree while retaining its prefix,
    only the overlap factors crossing its boundary vary. If each such factor has a resampling-difference bound in
    the required finite $L^p$ norm, and the other factors have their required finite moment bounds,
    then $P$ has the bound obtained by the product rule, with a constant depending only on its degree,
    number of monomials, and coefficient bound. In particular this property is preserved by multiplying the
    current target test by centered overlaps to fresh auxiliary leaves,
    and by introducing a fresh target block joined to an earlier target by one overlap.
    Earlier target blocks may have several incident boundary overlaps.]
] <lem:found-boundary-tests>

#proof[
  For a monomial use the exact identity
  $ product_(i = 1)^d A_i - product_(i = 1)^d A'_i = sum_(j = 1)^d \( A_j - A'_j \) product_(i < j) A_i
    product_(i > j) A'_i . $
  Factors supported in the exterior have $A_j = A'_j$. A fixed scalar center also cancels from $A_j - A'_j$.
    Apply Hölder’s inequality to each remaining term, at exponents whose reciprocal sum is the reciprocal of the
    desired exponent. Sum over the fixed finite collection of monomials.
    This proves the norm transfer without any assertion that internal overlaps are concentrated.
    The two stated operations introduce edges between the current target and another block;
    they create no edge with both endpoints in a single descendant block.
    The same argument therefore remains applicable after each operation.
    The coefficient and centering restrictions ensure that no unrecorded difference term is introduced. ◻
]

=== 2.5 Passage to bounded monotone paths <passage-to-bounded-monotone-paths>

#thm([Proposition 2.14.])[
  (Path limits).  #emph[The preceding construction and estimates extend to bounded nonnegative nondecreasing paths
    $b \, h$ by step approximation. The limit is independent of the approximations,
    provided the terminal clocks converge and the before/after clocks at every specified cut converge to the
    specified values. Planted expectations of bounded spin tests on a fixed finite split tree with cuts before or
    after jumps, fixed-order source derivatives, the signed calculus,
    and the mass-integrated pressure and moment formulas have these limits.
    The susceptibility inequality holds on the continuous parts,
    with nonnegative total increments of $S$ at jumps. For intermediate cuts and the separate clock contributions
    inside a filled jump, use approximations retaining the prescribed joint filling;
    no independence from the choice of that filling is asserted.
    All constants in the finite-tree variation and Taylor bounds are unchanged.]
] <prop:found-limits>

#proof[
  We give the details with $n$ fixed; no quantitative estimate uniform in $n$ is inferred from this approximation
    argument. A bounded monotone function has only countably many discontinuities.
    Choose step approximations converging at its continuity points and retaining each required side of the
    finitely many specified cuts. They converge in $L^1$, and their endpoint clocks can be chosen to converge as
    well. Lemma 3 makes the self-corrected root values a Cauchy sequence, uniformly over every common external source.
  The same calculation applies to a continuation beginning at a fixed cut $u$.
    Its future increment clocks are the cumulative clocks above $u$ minus their specified values at that cut.
    Heat differentiation and summation by parts give the same interior integral,
    together with an initial boundary term. The latter is bounded by a constant depending on $n$ times the
    difference of the two clocks at $u$, because all feature means have norm at most their feature bound.
    Thus continuation values converge uniformly in the external source whenever the clocks at the cut converge;
    the bound consists of their $L^1$ differences above $u$, their initial clock differences,
    and their terminal self corrections. This also proves uniqueness of these limits.
  Corollary 11 bounds all source derivatives uniformly over the approximations.
    Uniform convergence of values and the bound on the next derivative imply convergence of any fixed derivative
    by finite differences: approximate a derivative by a fixed small difference quotient,
    pass to the limit in the quotient, and then let its step tend to zero.
    Iterating this argument proves the claim for mixed derivatives as well.
    In particular the limiting gradient and Hessian are the conditional mean and weighted covariance limits.
  To verify convergence of the probability laws, use independent standard Brownian drivers for the finitely many
    features on each branch of the fixed observed tree. Evaluate them at the deterministic $b \, h$ clocks.
    Continuity of Brownian paths gives convergence at every cut whose clocks converge,
    including its prescribed side. Multiplication of normalized transition densities telescopes on each edge
    exactly as in the pinned calculation: the logarithm of the joint density is a finite sum of endpoint and fork
    continuation terms and terminal Hamiltonians, minus integrals of continuations along the edges in the mass
    coordinate. The coefficients of endpoint terms are bounded in terms of the number of observed leaves.
  Here is a uniform integrable bound for this density. For fixed $n$ and bounded clocks,
    terminal log partition functions are Lipschitz in the feature source with fixed constant.
    The same is true of continuations by the first derivative formula.
    Their values at source zero are nonnegative and bounded by the annealed value,
    which is at most $n \( b \( 1 - \) \/ 4 + h \( 1 - \) \/ 2 \)$.
    It follows that the absolute value of the telescoped log density is at most
  $ C_(n \, q) (1 + sum_(upright("branches and features")) sup_(0 lt.eq t lt.eq M) \| B_t \|) \, $
  where $M$ bounds all clocks and $q$ is the fixed leaf count.
    The exponential of this expression is integrable for a finite collection of Brownian motions.
    Continuation convergence and dominated convergence in the mass integrals therefore give almost sure
    convergence of the densities and convergence in $L^1$. The same domination,
    together with the source derivative bounds, applies to the differentiated observables under consideration.
    This proves convergence of positive planted expectations and their fixed-order source versions.
  The attachment measure consists of finitely many fork and coincidence atoms and Lebesgue measures on finitely
    many occupied edges, with uniform total variation. At a Lebesgue placement,
    the clocks converge outside a countable exceptional set. At an existing fork they converge on the specified
    side by construction. Dominated convergence and Lemma 7 therefore pass every fixed finite sequence of signed
    allocations to the limit. The same argument on an affine interpolation segment passes fixed-order
    differentiation and Taylor’s integral remainder, since their variation bounds are uniform.
    Exact permutation and row-sum identities survive because they held before passage to the limit.
  Finally $\| L_u \| lt.eq 3 \/ 2$ and $0 lt.eq W_u lt.eq 4$.
    Thus the moment estimate passes first for bounded deterministic weights and then for all $L^2$ weights.
    For the clock identity, choose refinements that retain the prescribed joint filling of every jump whose total
    clock size exceeds a cutoff, and then let the cutoff decrease to zero.
    After the finitely many retained jumps are separated, remove the remaining jumps temporarily.
    Their total clock size tends to zero; the continuation and source-derivative estimates above control this
    perturbation. The resulting clocks are continuous on each interval between retained jumps,
    so their monotonicity gives uniform clock convergence there.
    These estimates and Brownian continuity give convergence of the quadratic-variation integrands,
    including within the vanishing increments of the refinements, and hence of their Stieltjes integrals.
    The uniform integrand bounds control the direct contribution of the omitted jumps as well.
    At each retained jump the prescribed joint filling fixes the separate clock integrals.
    Their sum is the total nonnegative increment of $S$, independently of the filling.
    Discarding this increment gives the susceptibility inequality on the continuous portions.
    This proves the stated clock assertions without claiming that the separate jump contributions are independent
    of their joint filling. ◻
]

Henceforth all path quantities refer to these limits. The signed sums are integrals of ordinary finite-tree
  expectations against the attachment measures above. In particular all subsequent fixed-order Taylor estimates
  have constants independent of how finely a path is approximated.

== 3 Optimized short comparisons <sec:comparisons>

This section proves local estimates for a constrained comparison,
  including an error estimate conditional on regularity outside the scale being tested.
  The regularity assumption is stated each time it is used.
  The later propagation argument establishes it by a finite sequence of further comparisons;
  none of the estimates below assumes the conclusion of that argument.
  The construction uses the optimized interpolation and pinned-field averaging framework of #cite(label("AL2026"))
  Proposition 2.3 and Section 3, with the local strength profile and the scale-dependent constraints retained
  throughout.

=== 3.1 Parameters and the constrained comparison <parameters-and-the-constrained-comparison>

Fix a sufficiently small constant $m > 0$ and put $delta = m \/ 10000$.
  All asymptotic statements concern $n arrow.r oo$ with these constants fixed.
  The temperature, bounds on the total clocks, and fixed comparability constants may enter implicit constants.
  A polynomial saving means a factor $n^(- c)$ for some fixed $c > 0$.
  Such a saving, unless otherwise specified, is independent of each fixed moment order;
  the multiplicative constant and the threshold in $n$ may depend on that order.
  Factors denoted by $n^(o \( 1 \))$ can be bounded by $C_epsilon.alt n^epsilon.alt$ for any fixed $epsilon.alt >
  0$. We choose $epsilon.alt$ after the positive power margins in an estimate have been fixed.
  The estimates hold along arbitrary sequences of parameters satisfying the stated assumptions,
  and hence also along subsequences. We write $o_(upright("poly")) \( A \)$ for a quantity bounded in absolute
  value by $C n^(- c) A$ for some fixed $c > 0$. A bound $Y = O_p \( A \)$ means $parallel Y parallel_(L^p) lt.eq
  C_p A$ at each fixed moment order under discussion.

A comparison call has parameters

#[#set math.equation(numbering: n => "(3)")
 $ n^(- 2 \/ 3 + m) d lt.tilde E lt.eq n^(- 1 \/ 2) d^2 \, wide a = frac(sqrt(n) E, d) \, wide u_(*) =
   frac(1, n E) \, wide 0 < d = O \( 1 \) . $ <eq:3>]

The parameter $E$ sets the comparison-error budget, up to the fixed power slack used below.
  The maximal covariance-removal strength is $d^2$; at that strength the profile in (6) changes scale near radius
  $d$. The quantity $a$ is the corresponding lower direct-test scale,
  while $u_(*)$ controls the smallest-mass constraints. In particular $d gt.eq a gt.tilde n^(- 1 \/ 6 + m)$.
  The working interval of masses is $\[ u_0 \, 1 \]$, where either $u_0 = 0$ or $u_0 = o \( a \)$;
  changes made by this call vanish below $u_0$. Its endpoint clocks are denoted by $b_0 \, h_0$.
  They are uniformly bounded and nondecreasing on the working interval.
  For the subsequent profile argument the endpoint hypothesis is

#[#set math.equation(numbering: n => "(4)")
 $ b_0 \( u \) = T + o \( z^2 \) \, wide h_0 \( u \) = o \( z^3 \) quad upright("when ") u asymp z \, quad
   a lt.tilde z lt.eq 1 . $ <eq:4>]

This formulation is sequential: it holds on every such test sequence,
  with any fixed comparability constants and with masses in the open working interval.
  In particular it implies uniform little-oh estimates on each fixed compact scaled mass band,
  by choosing a violating point if uniformity were to fail.

Choose $r_min = 0$ in the all-mass case. In the case $u_0 > 0$ we may fix any $0 lt.eq r_min lt.eq
  u_(*) \/ M \( u_0 \)$. The optimization variable is an increasing onto quantile $r : \[ u_0 \, 1 \]
  arrow.r \[ r_min \, 1 \]$. Its inverse $alpha$ satisfies $alpha \( r_min \) = u_0$, $alpha \( 1 \) = 1$, and

#[#set math.equation(numbering: n => "(5)")
 $ k \( r \) lt.eq alpha' \( r \) lt.eq M \( alpha \( r \) \) \, wide k \( r \) =
   frac(n^delta u_(*)^2, \( r + n^(2 delta) u_(*) \)^2) \,\
M \( u \) = n^delta [frac(u + u_(*), L) + d^3 / E \( u + u_(*) \)^2] \, wide L = min (u_(*) \, a^3 / d^2) . $ <eq:5>]

These are almost-everywhere constraints on Lipschitz functions, with a strictly positive floor.
  The inverse is therefore Lipschitz at fixed $n$ as well. The parameters in (5), including $r_min$,
  remain fixed when the strength is varied.

Fix once and for all a smooth function $f > 0$ that equals $1$ in a neighborhood of $0$,
  is comparable to $\( 1 + log t \) \/ t$ for large $t$, and whose logarithmic slope is nondecreasing from $0$ to
  $1$. We require $1 - p gt.tilde \[ 1 + log \( 1 + t \) \]^(- 1)$ for that slope.
  Such a function is obtained by choosing a smooth nondecreasing slope that is zero near zero and equals
  $1 - \( 1 + log t \)^(- 1)$ for all sufficiently large $t$, and then integrating its logarithmic derivative. Set

#[#set math.equation(numbering: n => "(6)")
 $ e \( r \) & = lambda f \( lambda r \/ d^3 \) \, wide 0 lt.eq lambda lt.eq d^2 \,\
cal(F)_lambda \( r \) & = f_n #scale(x: 120%, y: 120%)[\(] b_0 - e \( r \) \, h_0 +
  e \( r \) r #scale(x: 120%, y: 120%)[\)] + 1 / 4 integral_(u_0)^1 e \( r \( u \) \) r \( u \)^2 thin d u \, wide
  cal(M)_lambda = min_r cal(F)_lambda \( r \) . $ <eq:6>]

Here and below $e \( r \)$ in a clock denotes composition with $r \( u \)$,
  and the changes in (6) are zero below $u_0$. We write $p \( r \) = - r e' \( r \) \/ e \( r \)$.
  Thus $0 lt.eq p < 1$, $partial_(log lambda) e = \( 1 - p \) e$, and $\( r e \)' = \( 1 - p \) e gt.eq 0$.
  Consequently the comparison preserves monotonicity inside the working interval.
  A call at a fixed strength is admissible when the changed clocks in (6) are nonnegative and nondecreasing for
  every quantile in (5), including across the boundary $u_0$.
  An admissible sweep requires this for every strength in the sweep, including zero.
  The endpoints used later will satisfy these conditions. A bare endpoint may instead have a field discontinuity
  at $u_0$ that is repaired only at a fixed positive strength.
  In that case the local estimates concern the changed paths at that strength;
  the bare pressure and a sweep from zero are not used.

#thm([Lemma 3.1.])[
  (Existence and the optimized envelope).  #emph[For all sufficiently large $n$,
    the class (5) is nonempty and compact in the uniform topology of inverse quantiles.
    The minimum in (6) is attained. For an admissible sweep, $cal(M)_lambda$ is locally Lipschitz and
    nondecreasing in $lambda$, equals the endpoint pressure at $lambda = 0$,
    and is an upper bound for that pressure. At almost every positive strength its upper derivative per unit $log
    lambda$ is bounded, at any minimizer at that strength, by
#[#set math.equation(numbering: n => "(7)")
 $ 1 / 4 integral_(u_0)^1 e \( r \( u \) \) #scale(x: 120%, y: 120%)[\[] D_u^2 + \( S_u - r \( u \) \)^2
   #scale(x: 120%, y: 120%)[\]] thin d u . $ <eq:7>]

 All moments in this formula are for the changed clocks in (6).]
] <comp:envelope>

#proof[
  We have $k lt.eq n^(- 3 delta)$ and $M gt.eq n^delta$, while
  $ integral_0^1 k \( r \) thin d r lt.eq n^(- delta) u_(*) = o \( 1 \) \, wide
    integral_(u_0)^1 frac(d u, M \( u \)) lt.eq n^(- delta) L log frac(1 + u_(*), u_0 + u_(*)) = o \( 1 \) . $
  The floor alone does not reach the prescribed terminal mass.
    The cap flow reaches it before the prescribed terminal radius.
    Interpolating controls in $alpha' = k + w \( M \( alpha \) - k \)$, $0 lt.eq w lt.eq 1$,
    gives a feasible endpoint by continuity of the scalar flow; equivalently,
    interpolate the travel time until the cap flow reaches mass $1$.
    At fixed $n$ the derivatives are uniformly bounded by $max_(\[ u_0 \, 1 \]) M$.
    Uniform limits preserve both differential inequalities in their integrated form,
    so Arzelà–Ascoli gives compactness. The positive floor preserves invertibility.
    Continuity of the pressure follows from the bounded variation formula (1); this proves attainment.
  For a fixed quantile, interpolate the amount of covariance removed from $0$ to $e$.
    The derivative of the pressure plus the corresponding penalty is the integral of $\[ B - 2 r S + r^2 \] \/
    4$ times the nonnegative strength increment. Since $B = S^2 + D^2$, it is nonnegative.
    This proves the upper-bound assertion and monotonicity, including after minimizing.
    At positive strength use an old minimizer as a competitor for a positive increment of strength.
    The same differentiation and $partial_(log lambda) e = \( 1 - p \) e lt.eq e$ give (7).
    Bounded spin moments give local Lipschitz continuity of the objective uniformly over the compact admissible
    class, and hence of its minimum. Integration of its almost-everywhere derivative is therefore legitimate.
    The whole interval $0 lt.eq lambda lt.eq n^(- 10)$ costs $O \( n^(- 10) \)$. ◻
]

#prodef([Definition 3.2.])[
  (Outer regularity).  A minimizer has a regular outer region above $x$ if, for fixed positive constants $c \,
    C \, C_0$, one has $c u lt.eq r \( u \) lt.eq C u$ whenever $u gt.eq C_0 x$.
    Enlarging the cutoff by a fixed factor gives the equivalent comparison $alpha \( r \) asymp
    r$ in radius coordinates. The constants are independent of $n$.
    No bound on a pointwise path derivative is part of this definition.
] <comp:outer-regularity>

The eventual regularity assertion concerns every test scale

#[#set math.equation(numbering: n => "(8)")
 $ n^delta frac(sqrt(n) E, sqrt(lambda)) lt.eq x lt.eq 1 . $ <eq:8>]

It will be proved after the profile analysis, by propagation from larger scales.
  In the present section it is a target range, not an assumption already established at every minimizer.
  Write $A_lambda = n^delta sqrt(n) E \/ sqrt(lambda)$. If $x gt.eq A_lambda$,
  then $x gt.tilde a$ and $e \( x \) x^2 gt.tilde n^delta n E^2$:
  indeed $sqrt(lambda) sqrt(n) E lt.eq d^3$, so the argument of $f$ at $A_lambda$ is at most $n^delta$,
  and $r e \( r \)$ increases. Our local estimates require only $x gt.tilde a$ and $e \( x \) x^2 gt.tilde n E^2$,
  together with outer regularity when $x = o \( 1 \)$.

=== 3.2 First-variation geometry <first-variation-geometry>

Define

$ G \( r \) = e \( r \) [\( 2 - p \( r \) \) r - 2 \( 1 - p \( r \) \) S_r - p \( r \) B_r \/ r] \, $

with the final term interpreted as zero in the neighborhood where $p = 0$.
  Subscripts $r$ here mean revelation at mass $alpha \( r \)$.

#thm([Lemma 3.3.])[
  (Contact, cap, and floor).  #emph[At a minimizer there is a continuous absolutely continuous potential $H$ such
    that $H' = J G$ for a strictly positive factor $J$, $alpha' = M \( alpha \)$ on ${ H < 0 }$, and $alpha' =
    k$ on ${ H > 0 }$. On a band where $alpha + u_(*)$ varies by a bounded factor,
    $J$ has bounded distortion after normalization at one endpoint. On the contact set ${ H = 0 }$, almost everywhere,
#[#set math.equation(numbering: n => "(9)")
 $ G = 0 \, wide S' lt.tilde n^(o \( 1 \)) \, wide S lt.eq r . $ <eq:9>]

 On an open cap component ${ H < 0 }$ of radius length $ell$,
#[#set math.equation(numbering: n => "(10)")
 $ Delta S lt.tilde n^(o \( 1 \)) \( ell + r_min upright(bold(1))_(upright("initial")) \) \, wide S lt.eq r + ell \,\
\| S - r \|^2 lt.tilde n^(o \( 1 \)) [D^2 + ell^2 + r_min^2 upright(bold(1))_(upright("initial"))] . $ <eq:10>]

 Here $Delta S$ is the increase through the interior of the component. On contact, $\( S - r \)^2 lt.tilde D^2$.
   Every cap has $ell lt.tilde n^(- delta) L log n$; if it is contained in a comparable mass band $u asymp v
   gt.double u_(*)$, then $v ell lt.tilde n^(- delta) E \/ d^3$.
   A noninitial cap on which $p = 0$ throughout satisfies $\| S - r \| lt.eq ell$.
   The total floor mass is at most $n^(- delta) u_(*)$.]
] <comp:geometry>

#proof[
  Differentiating the objective with respect to its forward quantile gives $1 /
    4 integral G thin Delta r thin d u$. The inverse variation is therefore $- 1 /
    4 integral G thin Delta alpha thin d r$. Write $alpha' = k + w \( M \( alpha \) - k \)$ with $0 lt.eq w lt.eq
    1$. Its linearized equation has fundamental factor
  $ J \( r \) = exp (integral_(r_min)^r w \( t \) M' \( alpha \( t \) \) thin d t) . $
  Terminal preservation says $integral \( M - k \) Delta w \/ J = 0$.
    Integrating the first variation in the opposite order gives a box-constrained linear functional with this one
    linear constraint. A scalar multiplier gives a function with derivative $J G$,
    which must be nonpositive where $w = 1$ and nonnegative where $w = 0$.
    Both signs of correcting endpoint variation exist: a feasible path cannot be the pure floor or pure cap,
    as their travel times above show. Thus the multiplier can equally be obtained by adding a correcting variation
    and taking one-sided limits. This proves the asserted rule.
    Directional derivatives follow by the segment variation formula;
    the fixed-$n$ inverse functions have dominated difference quotients. Values at jumps affect no integrals. Moreover
  $ frac(M' \( u \), M \( u \)) lt.eq frac(2, u + u_(*)) \, wide w M lt.eq alpha' \, $
  which proves bounded distortion of $J$ on the stated bands.
  The bracket in $G$ decreases with $p$, since its $p$ derivative is $- \[ \( r - S \)^2 + D^2 \] \/ r$.
    At a noninitial left cap endpoint its limiting value is nonpositive,
    and at the right endpoint it is nonnegative. At radius $1$ the latter remains true because $S \, B lt.eq 1$.
    The right inequality implies $S lt.eq r$ there and $p B lt.eq 2 r^2$.
    Use the right-end slope parameter at both endpoints. If their radii are comparable,
    subtraction of the inequalities, monotonicity of $B$, and $p B lt.eq
    2 r_(upright("right"))^2$ give $2 \( 1 - p \) Delta S lt.eq C ell$.
    If the radii are not comparable, $S lt.eq r_(upright("right")) lt.tilde ell$ suffices.
    At an initial component use $S gt.eq 0$, introducing only $r_min$.
    Since $\( 1 - p \)^(- 1) = O \( log n \)$ on the polynomial scales under consideration,
    this proves the first line of (10).
  For the mismatch bound, the case $S > r$ follows from the right endpoint.
    In a noninitial component with comparable endpoint radii, the left inequality and monotonicity,
    followed by replacement of its radius by the current radius, give
  $ \( r - S \) [\( 2 - p \) + p S \/ r] lt.eq C ell + p D^2 \/ r . $
  When $S < r$, this gives $r - S lt.eq C \( ell + D^2 \/ r \)$; splitting into $D gt.eq
    r$ and $D < r$ proves the squared estimate. Noncomparable and initial components are covered by their length
    and wall terms. The same calculation at $G = 0$ proves $S lt.eq
    r$ and $\( S - r \)^2 lt.tilde D^2$ on contact. At density points of the zero set,
    difference quotients between adjacent zero-set points yield $S' lt.tilde \( 1 - p \)^(- 1)$:
    the derivatives of $B$ and $p$ have favorable signs, and $p B \/ r^2 lt.eq 2$ there. This proves (9).
    The exceptional contact set has zero radius length and, since $alpha$ is Lipschitz at fixed $n$, zero mass.
  On a cap, $d r = d u \/ M \( u \)$, so the two length bounds follow respectively from the two positive terms of
    $M$. If $p = 0$, the endpoint signs say $S_(upright("left")) gt.eq
    r_(upright("left"))$ and $S_(upright("right")) lt.eq r_(upright("right"))$,
    proving the sharper mismatch statement. Finally, floor mass is bounded by $integral_0^1 k \( r \) thin d r
    lt.eq n^(- delta) u_(*)$. ◻
]

=== 3.3 Projection estimates and the raw-moment bootstrap <projection-estimates-and-the-raw-moment-bootstrap>

Assume for now that $x = o \( 1 \)$, $x gt.tilde a$, $e \( x \) x^2 gt.tilde n E^2$,
  and the minimizer has a regular outer region above $x$. After a fixed enlargement of the cutoff,
  all bands below are regular in both coordinates. On the working interval $partial_r \[ h \( alpha \( r \) \) \]
  gt.eq e \( r \) \/ O \( log n \)$. Hereafter $partial_r h$ denotes this derivative of the clock pulled back to
  radius coordinates. At regular scales $r asymp u asymp v$,

#[#set math.equation(numbering: n => "(11)")
 $ u_(*) lt.double x \, wide M \( O \( v \) \) lt.double \( n E v \)^2 lt.tilde n e \( v \) v^4 \, wide
   n^(- 1 \/ 6) lt.double x . $ <eq:11>]

Every strict gain in this display is polynomial. Indeed

$ u_(*) / a lt.tilde n^(- 3 m) \, wide frac(u_(*)^2 d^2, a^4) lt.tilde n^(- 6 m) \, wide
  frac(d^3, n^2 E^3) lt.tilde n^(- 3 m) . $

For $v gt.tilde a$, dividing $M \( O \( v \) \)$ by $\( n E v \)^2$ bounds the ratio by $C
  n^delta$ times the sum of these three quantities. The comparison with $n e \( v \)
  v^4$ follows because $e \( r \) r^2$ increases. Monotonicity and the outer bounds also show that if one of $u \,
  r$ is $O \( x \)$, the other is $O \( x \)$.

#thm([Proposition 3.4.])[
  (Raw moments).  #emph[For every fixed $p gt.eq 2$, throughout the path, including masses below the working interval,
#[#set math.equation(numbering: n => "(12)")
 $ parallel X_u parallel_p lt.tilde_p sqrt(u + x) \, wide parallel R_(upright(s p l i t med a t) med u) parallel_p
   lt.tilde_p u + x . $ <eq:12>]

 The bounds also hold at intermediate clock revelations, with their specified mass.
   The norm of a random vector is its Euclidean norm inside the $L^p$ norm.]
] <comp:raw-moments>

We first establish a projection estimate that will also be used later.

#thm([Lemma 3.5.])[
  (Projection after a field-clock interval).  #emph[Let $V$ be a vector determined by outside branches and by data
    at or before their fork with a branch $b$. Conditional on this data,
    the future of $b$ has its usual planted law. Suppose a field-clock interval after the fork has length $D_h$,
    with mass at least $v_(-) > 0$ throughout. For even fixed $p gt.eq 2$,
    the part of $V dot.op y_b$ left after projection at the end of the interval satisfies
#[#set math.equation(numbering: n => "(13)")
 $ parallel V dot.op \( y_b - X_(b \, upright("end")) \) parallel_p lt.eq
   C_p \( log n \)^2 frac(parallel V parallel_p, v_(-) sqrt(n D_h)) . $ <eq:13>]

 Here the masses and clock lengths used in the estimate are bounded below by inverse powers of $n$.
   Differences of two later projections satisfy the same estimate up to a constant.]
] <comp:projection>

#proof[
  Condition on the outside data so that $V$ is fixed for the branch calculation.
    Put $Y = V dot.op y_b$ and $Y_t = V dot.op X_(b \, t)$. In field-clock time,
    the spin Brownian driver has planted drift $t sqrt(n) X_(b \, t)$.
    This follows on each filled increment from the normalized exponential tilt and its logarithmic gradient;
    subdivision gives the Brownian formulation. Gaussian differentiation of the telescoping planted density gives,
    for a subinterval $I$ and $P = \( Y - Y_(upright("start")) \)^(p - 1)$,
  $ bb(E) [P integral_I V dot.op \( d G - t sqrt(n) X_(b \, t) thin d h \( t \) \)] =
    sqrt(n) integral_I bb(E) [P {t \( Y - Y_t \) + integral_t^1 \( Y - Y_z \) thin d z}] d h \( t \) . $
  The terminal tilt contributes $Y$; the subsequent continuation terms and the subtracted innovation drift
    contribute $- integral_t^1 Y_z thin d z - t Y_t$. Prefix-dependent parts of the test are fixed before the
    subinterval, so no derivative of $V$ or $Y_(upright("start"))$ is taken.
    This identity is first an ordinary finite Gaussian integration by parts and then passes to filled clocks by
    the path approximation already established.
  For $z$ after the subinterval’s start, conditional centering gives
  $ bb(E) \[ P \( Y - Y_z \) \] =
    bb(E)
    [#scale(x: 120%, y: 120%)[\(] \( Y - Y_(upright("start")) \)^(p - 1) - \( Y_z - Y_(upright("start")) \)^(p -
    1) #scale(x: 120%, y: 120%)[\)] \( Y - Y_z \)] gt.eq c_p bb(E) \| Y - Y_z \|^p . $
  This is the uniform monotonicity inequality for the odd power $p - 1$.
    Also $parallel Y - Y_(upright("end")) parallel_p lt.eq 2 parallel Y - Y_t parallel_p$ for earlier $t$.
    The innovation on the left, divided by $sqrt(h \( I \))$, has norm at most $C_p parallel V parallel_p$.
    Hölder’s inequality therefore gives the recursion
  $ parallel Y - Y_(upright("end")) parallel_p^p lt.eq frac(C_p parallel V parallel_p, v_(-) sqrt(n h \( I \)))
    parallel Y - Y_(upright("start")) parallel_p^(p - 1) . $
  Divide the given clock into $N = ceil.l \( log n \)^2 ceil.r$ equal pieces. The coefficient is
  $ frac(C_p sqrt(N) parallel V parallel_p, v_(-) sqrt(n D_h)) . $
  Iteration raises the ratio of the initial bound $2 parallel V
    parallel_p$ to this coefficient to the power $\( 1 - 1 \/ p \)^N$.
    If the ratio is larger than one it is at most a fixed power of $n$, so its final power tends to one.
    If it is smaller than one the assertion is already immediate.
    This proves (13), with its harmless logarithmic allowance.
    Conditional Jensen proves the assertion for later projections. ◻
]

#proof[
  #emph[Integrated susceptibility bound.] Fix an integer $l gt.eq 1$ and let
  $ Q = max (1 \, sup_u frac(parallel X_u parallel_(4 l), sqrt(x + u))) \, $
  including intermediate revelations and the final spin. This is finite at each fixed $n$.
    We first bound the integrated weight in (1) on a small regular band of mass and radius comparable to $v$.
    Uniformly on a bounded enlargement of this band, choose $rho$ so that
  #[#set math.equation(numbering: n => "(14)")
   $ M \( O \( v \) \) rho lt.eq n^(- c) \, wide n e \( v \) v^4 rho gt.eq n^c $ <eq:14>]
  for a fixed $c > 0$ independent of $l$. For example take the geometric mean between the reciprocal scales;
    (11) gives the required room, and $rho = o \( 1 \)$.
  We give the layer estimate first on a finite filled hierarchy,
    appending the terminal spin as a martingale step of mass $1$.
    In this paragraph parentheses denote radius coordinates: $X \( s \) = X_(alpha \( s \))$, $cal(F) \( s \) =
    cal(F)_(alpha \( s \))$, and likewise $H \( s \) \, W \( s \)$; write $X \( dagger \) = y$ and $bb(E)_s =
    bb(E) \[ thin dot.op divides cal(F) \( s \) \]$. Enclose the band in a radius interval
    $I = \[ r_(-) \, r_(+) \]$, with $r_plus.minus asymp v$ and $r_(+) < r_c \/ 2$ for a fixed small $r_c > 0$.
    Its fixed enlargement is regular. Put
  $ sans(A)_v = M \( C v \) \, quad sans(B)_v = n e \( v \) v^4 \, quad
    rho = \( sans(A)_v sans(B)_v \)^(- 1 \/ 2) \, quad eta = rho v . $
  By (11), with $kappa = 3 m - delta > 0$, $sans(A)_v \/ sans(B)_v lt.tilde n^(- kappa)$;
    hence $sans(A)_v rho = \( sans(B)_v rho \)^(- 1) lt.tilde n^(- kappa \/ 2)$, as required in (14).
    Also $sans(A)_v gt.eq n^delta$, so $rho = o \( 1 \)$.
  For each $s in I$, fork an independent continuation $b$ from the original branch $a$.
    On both branches use cuts $t_0 = s$, $t_1 = s + eta$, $t_2 = 2 s$,
    then doubled radii up to the first $t_J in \[ r_c \, 2 r_c \)$, and $t_(J + 1) = dagger$.
    Set $Delta_i^a = X^a \( t_(i + 1) \) - X^a \( t_i \)$, and similarly for $b$.
    There are $K = J + 1 = O \( log n \)$ layers. With $w_0 = w_1 = s$, $w_i = t_i$ for $2 lt.eq i < J$,
    and $w_J = 1$, their largest masses $mu_i$ satisfy $mu_i lt.tilde w_i$ and $parallel Delta_i^(a \, b)
    parallel_(4 l) lt.tilde_l Q sqrt(w_i)$. For elementary martingale increments $d_nu^b$ after the fork,
    conditional orthogonality gives the indexed positive-semidefinite bound
  $ H \( s \) = bb(E)_s sum_(nu upright(" after ") s) m_nu d_nu^b \( d_nu^b \)^(sans(T)) prec.curly.eq
    sum_(j = 0)^J mu_j bb(E)_s \[ Delta_j^b \( Delta_j^b \)^(sans(T)) \] . $
  Indeed cross terms between distinct elementary increments in each block have zero conditional expectation.
    Since $y^a - X \( s \) = sum_i Delta_i^a$, scalar Cauchy–Schwarz yields
  $ W \( s \) lt.eq K sum_(i \, j = 0)^J mu_j thin bb(E)_b \[ \( Delta_i^a dot.op Delta_j^b \)^2 divides a \] . $
  Here conditioning on $a$ includes the common prefix; no coupling of the auxiliary branches for different $s$ is
    needed.
  For $\( i \, j \) eq.not \( 0 \, 0 \)$ choose the branch carrying layer $k = max \( i \, j \)$,
    taking either branch on a tie. Condition on the entire opposite branch and use its increment as the exterior
    anchor in Lemma 20. The clock preceding the selected layer is
  $ \[ s \, s + eta \] quad \( k = 1 \) \, wide \[ 3 t_k \/ 4 \, t_k \] quad \( 2 lt.eq k lt.eq J \) . $
  Its masses are bounded below by $c w_k$, also for the terminal layer because $t_J asymp 1$.
    The field-clock length is at least $c rho v e \( v \) \/ log n$:
    for $k = 1$ this follows from $partial_r h gt.tilde e \( r \) \/ log n$, and for $k gt.eq
    2$ from the same bound and monotonicity of $r e \( r \)$, with no factor $rho$ needed.
    All these scales are bounded below by inverse powers of $n$.
    The opposite increment has norm at most $C_l Q sqrt(w_k)$, even when its endpoint is later than the fork,
    since it belongs to an independent branch. Equation (13) and conditional Jensen for later projections therefore give
  $ mu_j parallel Delta_i^a dot.op Delta_j^b parallel_(2 l)^2 lt.eq frac(C_l \( log n \)^5 Q^2, rho n v e \( v \)) . $
  Conditional Jensen also bounds the $L^l$ norm of the corresponding conditional square by this squared $L^(2 l)$
    norm. Integrating over physical mass $O \( v \)$ and summing the $K^2$ pairs, including the factor $K$ above,
    bounds their total by $C_l \( log n \)^8 Q^2 v^4 \/ \( sans(B)_v rho \)$.
  For $\( i \, j \) = \( 0 \, 0 \)$ put $q_s = bb(E)_s \| X \( s + eta \) - X \( s \) \|^2$ and $Z =
    sup_(r_(-) lt.eq t lt.eq r_(+) + eta) \| X \( t \) \|$ on the original path.
    The integrand is at most $C v Z^2 q_s$; changing coordinates costs only $d u lt.eq sans(A)_v thin d s$.
    Doob’s inequality gives $parallel Z^2 parallel_(2 l) lt.eq C_l Q^2 v$.
    To estimate the remaining integral, for $xi in \[ 0 \, eta \)$ let $r_j = r_(-) + xi + j eta$,
    retaining precisely the $N = N \( xi \)$ starting points in $I$ and their last endpoint $r_N lt.eq r_(+) + eta$. Set
  $ U_j = \| X \( r_j \) \|^2 \, quad A_0 = 0 \, quad A_(j + 1) = A_j + q_(r_j) \, wide q_(r_j) =
    bb(E) \[ U_(j + 1) - U_j divides cal(F) \( r_j \) \] . $
  Thus $A_(j + 1)$ is $cal(F) \( r_j \)$-measurable. For $p = 2 l$, $A_N^p lt.eq
    p sum_j A_(j + 1)^(p - 1) q_(r_j)$, and the exact identity
  $ sum_(j = 0)^(N - 1) A_(j + 1)^(p - 1) \( U_(j + 1) - U_j \) =  & A_N^(p - 1) U_N - A_1^(p - 1) U_0\
 & - sum_(j = 1)^(N - 1) \( A_(j + 1)^(p - 1) - A_j^(p - 1) \) U_j\
lt.eq  & A_N^(p - 1) U_N $
  gives $bb(E) A_N^p lt.eq p bb(E) \[ A_N^(p - 1) U_N \]$. Consequently $parallel A_N parallel_(2 l) lt.eq
    2 l parallel U_N parallel_(2 l) lt.eq C_l Q^2 v$, independently of the grid cardinality. The shifted-grid identity
  $ integral_I q_s thin d s = integral_0^eta sum_(j = 0)^(N \( xi \) - 1) q_(r_(-) + xi + j eta) thin d xi $
  and Minkowski give $parallel integral_I q_s thin d s parallel_(2 l) lt.eq C_l eta Q^2 v$.
    Hölder therefore bounds the integrated first-pair term by $C_l v sans(A)_v \( Q^2 v \) \( eta Q^2 v \) =
    C_l rho sans(A)_v Q^4 v^4$.
  Combining the pairs, including their logarithmic multiplicities, gives
  $ ∥integral_(upright("band")) W_u thin d u∥_l lt.eq C_l \( log n \)^8
    [sans(A)_v rho Q^4 + \( sans(B)_v rho \)^(- 1) Q^2] v^4 . $
  All estimates use moments at most $4 l$. Include deterministic jumps and intermediate cuts in the finite
    hierarchy. An after-revelation endpoint assigns its jump to the preceding block;
    a before-revelation endpoint assigns it to the following block.
    Equivalently insert both ordered nodes, counting the jump exactly once.
    The constants are independent of the mesh and grid cardinality,
    so the established bounded-path approximation passes to filled clocks at fixed $n$;
    the countable set of jump radii does not affect the radius integral.
    Absorbing logarithms, for example with $c' = kappa \/ 4$, proves
  #[#set math.equation(numbering: n => "(15)")
   $ ∥integral_(upright("band")) W_u thin d u∥_l lt.tilde_l n^(- c') \( Q^4 + Q^2 \) v^4 \, $ <eq:15>]
  where $c' > 0$ is independent of $l$. The argument also bounds integrals over subsets, since $W gt.eq 0$.
  #emph[Closing the moment estimate.] For a regular small mass $u$,
    choose a future window of mass comparable to $u$ at radii comparable to $u$.
    Its means satisfy $bb(E) L_j = S_j \/ 2 lt.eq C u$. Indeed this follows on nonfloor points from Lemma 18;
    the floor has total mass $o \( u \)$, so monotonicity permits looking ahead to a nonfloor point.
    For $j gt.eq u$, $2 bb(E)_u L_j = bb(E)_u \| X_j \|^2 gt.eq \| X_u \|^2$.
    Apply (1) and (15) to the normalized window average. Conditional Jensen yields
  $ parallel \| X_u \|^2 parallel_(2 l) lt.eq C u + C_l n^(- c'') Q^2 u . $
  For smaller masses, including $u < u_0$, choose a deterministic future regular cut $t asymp x$.
    The identity $X_u = bb(E) \[ X_t divides cal(F)_u \]$ and conditional Jensen give
  $ parallel X_u parallel_(4 l)^2 lt.eq parallel X_t parallel_(4 l)^2 lt.eq C x + C_l n^(- c'') Q^2 x . $
  Macroscopic masses are bounded directly by $\| X \| lt.eq 1$.
    Taking the supremum gives $Q^2 lt.eq C_l + C_l n^(- c'') Q^2$, which closes for all sufficiently large $n$.
    This proves the first bound of (12) for exponents divisible by four, and hence for every fixed exponent.
    It also removes $Q$ from (15).
  #emph[The two-leaf overlap.] If $u + x$ is bounded below, the overlap bound is immediate from $\| R \| lt.eq 1$.
    Otherwise choose a regular radius $q = C \( u + x \)$, with $C$ fixed and sufficiently large that
    $\[ q \/ 2 \, q \]$ is regular and lies after the fork. Outer comparability and monotonicity permit this
    choice even when $u < u_0$. Write $X^a \( q \) = X_(alpha \( q \))^a$ and similarly for branch $b$.
    The projected inner product has norm $parallel X^a \( q \) dot.op X^b \( q \) parallel_p =
    O_p \( q \)$ by the bound just proved.
  Decompose each leaf into its projection at $q$ and subsequent doubling layers,
    ending with the terminal spin as in the susceptibility estimate.
    Every product other than the two initial projections contains a later layer of scale $w gt.eq q$.
    An innovation interval before that layer has mass at least $c w$ and field-clock length at least $c e \( w \)
    w \/ log n$. The opposite branch supplies an exterior anchor of norm $O_p \( sqrt(w) \)$.
    Lemma 20, now without a mass weight, bounds the product by $C_p \( log n \)^C \/ sqrt(n e \( w \) w^2)$.
    Since $e \( w \) w^2$ increases, summing the logarithmically many layer pairs gives
  $ parallel R - X^a \( q \) dot.op X^b \( q \) parallel_p lt.eq frac(C_p \( log n \)^C, sqrt(n e \( q \) q^2)) =
    q thin frac(C_p \( log n \)^C, sqrt(n e \( q \) q^4)) = o_(upright("poly")) \( q \) \, $
  where (11) supplies the last saving. This proves the second bound in (12).
    All innovation intervals lie in the regular region, including when the original fork is below the working
    interval. ◻
]

#thm([Lemma 3.6.])[
  (Postprojection changes).  #emph[Suppose two leaves share only through a mass at most a fixed multiple of $x_1$,
    where $x_1 gt.eq x$. If a projection or resampling is made after a regular radius $v gt.eq C x_1$,
    with comparable intervals fitting after the fork and before that projection,
    the change in their inner product caused by changing one endpoint has norm
#[#set math.equation(numbering: n => "(16)")
 $ frac(C_p \( log n \)^C, sqrt(n e \( v \) v^2)) $ <eq:16>]

 in every fixed $L^p$. For an already projected anchor of norm $O_p \( sqrt(x_1) \)$,
   the bound gains a factor $sqrt(x_1 \/ v)$.]
] <comp:resampling>

#proof[
  Use the synchronized two-branch layer decomposition in the last part of the preceding proof.
    Every term involving the changed endpoint contains an increment after its projection.
    At the later layer of scale $w$, the projection estimate gives $C_p \( log n \)^C \/ sqrt(n e \( w \) w^2)$.
    Monotonicity of $w e \( w \)$ controls the sum from its first scale $v$, up to logarithms.
    For a fixed projected anchor replace its raw $sqrt(w)$ bound in (13) by $sqrt(x_1)$.
    Conditional Jensen covers replacement by conditional projection,
    and two such replacements cover independent resampling. ◻
]

=== 3.4 A split with uniform bounds in every fixed moment <a-split-with-uniform-bounds-in-every-fixed-moment>

#thm([Lemma 3.7.])[
  (Good split).  #emph[Suppose a regular band of mass and radius of order $v gt.eq
    C x$ contains a mass interval of length comparable to $v$ on which $S asymp v$.
    There are constants $c_1 \, c_2 > 0$, independent of each fixed moment order,
    and a deterministic window of mass length $n^(- c_1) v$ with the following properties.
    Its fixed-factor enlargement has $S$ oscillation at most $n^(- c_1 \/ 2) v$,
    and for every deterministic split in a fixed central fraction of the window,
#[#set math.equation(numbering: n => "(17)")
 $ parallel R_(*) - S_(*) parallel_p lt.eq C_p n^(- c_2) v $ <eq:17>]

 for all fixed $p gt.eq 2$. The window may be selected before the moment orders or any later fixed recursion depth
   are chosen. The constant $c_1$ may be any sufficiently small positive constant.]
] <comp:good-split>

#proof[
  Write $theta = n^(- c_1)$, $eta = n^(- c_1 \/ 2)$. Among order $theta^(- 1)$ disjoint buffered windows of mass
    length comparable to $theta v$, at most order $eta^(- 1)$ have $S$ oscillation larger than $eta v$,
    because the total increase is $O \( v \)$. Choose one of the remaining windows.
    This is a deterministic selection involving only $S$. Fix past and future buffers of length comparable to
    $theta v$ surrounding a central region.
  After the raw bootstrap, (15) takes the form $parallel integral W thin d u parallel_q lt.eq
    C_q n^(- gamma) v^4$ for a $gamma > 0$ independent of fixed $q$.
    Positivity of $W$ and (1) give, for the normalized $L$ average $A_J$ over either buffer,
  $ parallel A_J - bb(E) A_J parallel_p lt.eq C_p n^(- gamma \/ 2 + c_1) v = : C_p zeta v . $
  Let $t$ be a deterministic cut in the central region. The exact conditional identities give
  $ 2 bb(E)_t A_(-) lt.eq \| X_t \|^2 lt.eq 2 bb(E)_t A_(+) \, wide \| X_t \|^2 - 2 bb(E)_t A_(-) =
    "avg"_(s in J_(-)) \| X_t - X_s \|^2 gt.eq 0 . $
  Since $2 bb(E) A_plus.minus$ differs from $S_t$ by at most $eta v$, conditional contraction implies
  $ parallel \| X_t \|^2 - S_t parallel_p + ∥"avg"_(s in J_(-)) \| X_t - X_s \|^2∥_p lt.eq C_p \( eta + zeta \) v . $
  For two central cuts $t \, t'$ on the same branch, average the triangle-square inequality through the common
    past buffer to obtain
  $ parallel X_t - X_(t') parallel_(2 p) lt.eq C_p \( eta + zeta \)^(1 \/ 2) sqrt(v) . $
  These estimates hold uniformly over deterministic cuts, including cuts inside filled increments.
    No supremum over random cuts is asserted. Let $a_0 = min \( c_1 \/ 2 \, gamma \/ 2 - c_1 \) > 0$.
  Take the allowed star cuts in a smaller central fraction and project the two branches at a later central cut
    separated by a fixed fraction of $theta v$. This leaves a field clock at least $c theta e \( v \)
    v \/ \[ M \( O \( v \) \) log n \]$ after every allowed fork.
    For an outside anchor of norm $O_p \( sqrt(v) \)$, (13) bounds the residual by
  $ C_p \( log n \)^C frac(sqrt(M \( O \( v \) \)), sqrt(n theta e \( v \)) thin v) =
    C_p \( log n \)^C v sqrt(frac(M \( O \( v \) \), n theta e \( v \) v^4)) . $
  Decompose both leaves into the central projection and later layers.
    The first later layers still have norm $O_p \( sqrt(v) \)$, so the displayed short clock applies.
    For subsequent dyads use Lemma 21; the later scales only improve its bound.
    Thus the same bound, up to logarithms, controls the difference between $R_(*)$ and the inner product of the
    two central projections. This two-branch decomposition is necessary:
    using a terminal spin of norm one as the first anchor would lose a factor $sqrt(v)$.
  By (11), $M \( O \( v \) \) \/ \( n e \( v \) v^4 \) lt.eq
    C n^(- kappa)$ for some $kappa > 0$ independent of the moment order.
    The preceding projection distance estimates and Hölder give an error at most $C_p n^(- a_0 \/ 2)
    v$ between the two central projections’ inner product and $\| X_(*) \|^2$.
    Their square-norm concentration supplies the remaining centering. Choose $c_1$ sufficiently small.
    For example any sufficiently small $c_2 < 1 / 4 min \( c_1 \, gamma - 2 c_1 \, kappa - c_1 \)$ works after
    absorbing logarithms. If extra fixed buffers cost a fixed power of $theta$,
    replace the last $c_1$ by that fixed multiple when making the choice. All choices are independent of fixed $p$. ◻
]

#prodef([Remark 3.8.])[
  (Fixed-degree tree tests).  The estimate (17) needs no additional simultaneous-concentration version when used
    in a fixed-degree tree test. In every positive planted law for a deterministic enlarged tree,
    pruning all other branches leaves the ordinary two-leaf marginal of an edge splitting at $*$.
    A projection factor is a conditional average of such an edge.
    Apply (17) to these marginals and conditional Jensen to projection factors, then use Hölder.
    The finite-label counting rule (2) gives total variation bounded by a constant depending only on the number of
    added labels, not on a minimum mass or the mesh. Consequently a signed integral with $k$ new centered star
    factors and a bounded remaining insertion is at most $C_k
    p_0 \( n^(- c_2) v \)^k$ when the old test has raw scale $p_0$.
    If a later calculation divides by $v^k$, these factors cancel exactly.
    The deterministic window above can therefore be chosen first, then a fixed depth $k$,
    and then the finitely many moment orders required by Hölder.
    This statement concerns actual-path marginals; it makes no claim about redefining conditional means along a
    one-row interpolation.
] <comp:good-split-trees>

=== 3.5 Integrated overlap bounds and the conditional error <integrated-overlap-bounds-and-the-conditional-error>

The estimates in this subsection are evaluated at a minimizer of (6).
  Whenever a small scale $x$ is mentioned, outer regularity above $x$ is an explicit hypothesis,
  as are $x gt.tilde a$ and $e \( x \) x^2 gt.tilde n E^2$.

#thm([Proposition 3.9.])[
  (Local second moments).  #emph[On every regular outer dyad of mass $u asymp
    v$ beyond a sufficiently large fixed multiple of $x$, for every sufficiently small fixed $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(18)")
 $ ("avg"_(u asymp v) D_u^2)^(1 \/ 2) lt.tilde_epsilon.alt n^epsilon.alt
   [\( n e \( v \) v \)^(- 1 \/ 3) + \( n e \( v \) v^2 \)^(- 1 \/ 2) + \( n^(- delta) E \/ d^3 \)^(1 \/ 2) +
   n^(delta \/ 2) u_(*)] . $ <eq:18>]

 Fixed enlargements of a dyad are permitted in this assertion.]
  #emph[For a small direct test impose additionally $e \( x \) gt.tilde x^2$, and set $W =
    max \( x \, sqrt(e \( x \)) \)$. Then $W lt.tilde d$ and $e \( v \) gt.tilde W^2$ for $v = O \( W \)$.
    On regular dyads of scale at least a fixed multiple of $W$,
    including comparable dyads at $W$ that lie in the regular region,
    the right side of (18) is polynomially smaller than $x^2 \/ W$.
    Between $C x$ and $O \( W \)$ it is polynomially smaller than $x^2 \/ \( W^2 v \)^(1 \/ 3)$. Moreover
#[#set math.equation(numbering: n => "(19)")
 $ integral_0^(C W) D_u thin d u = o \( x^2 \) \, wide D = o \( x \) . $ <eq:19>]

 The integral is truncated at mass $1$, and $C$ may be any fixed constant.
   The second assertion means normalized mean-square convergence on every compact band $r lt.eq C x$, $c x lt.eq
   u lt.eq C x$, both in mass and in radius:
$ x^(- 3) integral_({ r lt.eq C x \, thin c x lt.eq u lt.eq C x }) D^2 thin d u arrow.r 0 \, wide
  x^(- 3) integral_({ r lt.eq C x \, thin c x lt.eq alpha \( r \) lt.eq C x }) D^2 thin d r arrow.r 0 . $

 If $W = o \( 1 \)$, there is a split $*$ in a regular band of scale $W$ with $S_(*) asymp W$, satisfying (17),
   and with $D_(*)$ polynomially smaller than $x^2 \/ W$. It can be chosen above any fixed multiple of $x$.]
] <comp:direct-moments>

#thm([Proposition 3.10.])[
  (Conditional comparison error).  #emph[Let $lambda gt.eq n^(- 10)$ and $A = A_lambda =
    n^delta sqrt(n) E \/ sqrt(lambda)$. If $A = o \( 1 \)$, assume that a minimizer has a regular outer region
    above $A$. Then its integral (7) is at most $n^(10 delta) E$ for all sufficiently large $n$.
    If $A$ stays bounded below by a positive constant, the same conclusion holds without a regularity hypothesis.]
  #emph[Consequently, if these hypotheses hold along an admissible sweep from zero to any strength at most $d^2$,
    then $0 lt.eq cal(M)_lambda - f_n \( b_0 \, h_0 \) lt.eq n^(20 delta) E$.
    The fixed-strength assertions apply also to the wall variant,
    whereas this last conclusion requires an admissible sweep.]
] <comp:conditional-error>

We prove both propositions by an averaging estimate that retains cap components as complete sampling units.
  This avoids replacing a whole-cap trace estimate by a pointwise one.
  The two-sided level averaging argument is a local form of the quantitative Parisi comparison technique in
  #cite(label("AL2026")) Lemma 3.3.

#thm([Lemma 3.11.])[
  (Trace bounds on sampling units).  #emph[Consider a group at comparable masses $u asymp
    v$ of total mass at most $C v$, and suppose the radii and the raw overlap moments in that group are bounded at
    scale $y_0$. Away from the floor, take as units complete cap components with comparable endpoint masses,
    and mass elements of the contact set. Let $e_g$ be a lower bound on $e$ in the group.
    If a cap has no initial-wall loss, then within each unit
#[#set math.equation(numbering: n => "(20)")
 $ "avg"_(upright("unit")) bb(E) "tr" H_u^2 lt.tilde frac(n^(o \( 1 \)), n e_g) . $ <eq:20>]

 On contact this holds pointwise almost everywhere. In particular the unit averages of $bb(E) "tr"
   C_u^2$ and $bb(E) W_u$ are at most $n^(o \( 1 \)) \/ \( n e_g v^2 \)$ and $n^(o \( 1 \)) \/ \( n e_g v \)$,
   respectively.]
] <comp:unit-trace>

#proof[
  In radius coordinates (1) gives $d S \/ d r gt.eq n partial_r h bb(E) "tr" H^2$ on continuous parts,
    with nonnegative contributions through jumps. On contact apply (9).
    On a cap of radius length $ell$, integrate and use $Delta S lt.eq n^(o \( 1 \)) ell$.
    The density $M \( u \)$ varies by at most a constant factor within a unit with comparable endpoint masses,
    and its mass is comparable to $M \( u \) ell$. Multiplication by this density and division by unit mass give
    (20). The inequalities $H gt.eq u C$ imply $"tr" C^2 lt.eq u^(- 2) "tr" H^2$ and $"tr" H C lt.eq
    u^(- 1) "tr" H^2$, proving the last claims. These trace comparisons follow directly by taking traces against
    positive semidefinite matrices, without a commutativity assumption. ◻
]

#thm([Lemma 3.12.])[
  (Two-sided level averaging).  #emph[In the setting of Lemma 26,
    let $ell_0$ be a common polynomial-scale upper bound for cap widths,
    including a possible wall term when it is covered by the trace estimate.
    Suppose on the group, for every fixed $p$, the raw bounds are $parallel X parallel_p lt.eq
    C_p sqrt(y_0)$ and $parallel R parallel_p lt.eq C_p y_0$.
    Then, up to a factor $n^(O \( epsilon.alt' \))$ for any fixed $epsilon.alt' > 0$,
    and an edge error $O \( k_0 n^(- 10) \)$,
#[#set math.equation(numbering: n => "(21)")
 $ integral_(upright("group")) D_u^2 thin d u lt.tilde v
   [\( y_0 \/ k_0 \)^2 + y_0 ell_0 + ell_0^2 + frac(k_0 + 1, n e_g v^2)] \, wide 1 lt.eq k_0 lt.eq n^2 . $ <eq:21>]

 In particular the first and last variable terms may be replaced by
   $C \[ \( y_0 \/ \( n e_g v^2 \) \)^(2 \/ 3) + 1 \/ \( n e_g v^2 \) \]$.]
] <comp:bracket>

#proof[
  We give the sampling construction explicitly. Order the units in radius,
    and assign a cap unit of physical mass $mu$ an effective interval of length $mu$.
    At every effective position in that interval, sample its physical point uniformly in the cap’s normalized
    mass. When taking a side average, use the physical average on that cap,
    weighted by the fraction of its effective interval that the side occupies.
    Contact elements retain their physical order. For a finite-cap approximation,
    retain each included cap as a whole sampling unit and keep the contact part as a separate integral;
    omitted cap mass tends to zero before taking the limit in $n$, and floor mass is treated separately.
    All auxiliary samples choose locations on the same planted path and use its same terminal spin.
    The effective measure has exactly the original mass. Physical samples within a cap may be taken independently,
    even for partial effective intervals. Side averages themselves are deterministic weighted averages of the
    random variables $L_u$, not random weights.
  Bin units according to their end value of $S$, into at most $k_0$ successive height intervals of width $C y_0 \/
    k_0$. A cap stays in one bin; by (10), its internal variation of $S$ is at most $n^(o \( 1 \)) ell_0$.
    Within each bin discard effective strips of length $n^(- 10)$ at both ends from the set of evaluation
    positions only. For each remaining effective position $i$,
    both side averages use the entire portion of the bin on the corresponding side,
    including the discarded endpoint strips; thus both available side lengths are at least $n^(- 10)$.
    Their deterministic means differ from $bb(E) L_i = S_i \/ 2$ by at most $C \( y_0 \/ k_0 + n^(o \( 1 \)) ell_0 \)$.
  If one side has length $m_1$, its physical weight on a unit of mass $mu$ is $q \/ \( m_1 mu \)$, where $0 lt.eq
    q lt.eq mu$ is the effective mass of that unit included in the side.
    By (1) and the last assertion of Lemma 26, its variance is at most
  $ frac(n^(o \( 1 \)), n e_g v thin m_1^2) sum_(upright("units")) q^2 / mu lt.eq
    frac(n^(o \( 1 \)), n e_g v thin m_1) . $
  The corresponding integral formula applies on contact. Integrating over $i$ costs $O \( k_0 log n \)$ from the
    reciprocal side length.
  We next compare $L_i$ to its side averages. For physically ordered points $j > i$,
  $ L_j - L_i = \( y - X_j \) dot.op \( X_j - X_i \) + 1 / 2 \| X_j - X_i \|^2 . $
  The first term has second moment at most
  $ \( bb(E) "tr" C_j^2 \)^(1 \/ 2) \[ S_j - S_i + C \( D_i + D_j \) \] . $
  Indeed the conditional covariance at $j$ bounds its square by
    $bb(E) \[ \( X_j - X_i \)^(sans(T)) C_j \( X_j - X_i \) \]$ and then Cauchy–Schwarz applies. The identity
  $ D_u^2 = "Var" \| X_u \|^2 + 2 bb(E) X_u^(sans(T)) C_u X_u + bb(E) "tr" C_u^2 $
  bounds the $L^2$ deviations of $\| X_u \|^2$ and of $X_i dot.op X_j =
    bb(E)_j \( X_i dot.op y \)$ by the indicated $D$ terms. This proves the displayed estimate for $bb(E) \| X_j -
    X_i \|^4$ needed in the Cauchy–Schwarz step.
  For the upper deviation of $L_i$, use the right side: the quadratic term has favorable sign.
    For its lower deviation use the left side and the same identity with the larger physical index last.
    Different units are physically ordered. If two samples in the same cap have the reverse physical order,
    retain also the quadratic term. Since $bb(E) \| X_j - X_i \|^2 = \| S_j - S_i \| lt.eq n^(o \( 1 \)) ell_0$,
    interpolation with an arbitrarily high fixed raw moment gives
  $ bb(E) \| X_j - X_i \|^4 lt.eq C_(epsilon.alt') n^(epsilon.alt') y_0 ell_0 . $
  To see the power accounting, at moment $2 q$ the interpolation loss is at most
    $\( y_0 \/ ell_0 \)^(1 \/ \( q - 1 \))$ times logarithms.
    Both scales are bounded by fixed powers of $n$, so a sufficiently large fixed $q$ gives the stated
    $n^(epsilon.alt')$ loss. A polynomial upper bound $ell_0$ may be used even for a much shorter individual cap.
  Integrate the squared one-sided estimates and use Jensen for each side average.
    The side kernels have logarithmic marginal-density loss at either position:
    in effective coordinates this is the integral of the reciprocal available side length, cut off at $n^(- 10)$.
    A partial unit is spread uniformly across its physical mass.
    Consequently a trace term at either position is bounded by its whole-unit average in (20),
    with at most this logarithmic loss. This remains true when an ordering indicator is present,
    because it can be discarded in an upper bound for a nonnegative term.
  Put $I_D = integral D^2 thin d u$ and $tau_C = n^(o \( 1 \)) \/ \( n e_g v^2 \)$.
    The terms involving one $D$ and one square root of a trace are bounded by
    $n^(o \( 1 \)) \( I_D v tau_C \)^(1 \/ 2)$. Young’s inequality,
    with a sufficiently small inverse-logarithmic coefficient, absorbs the $I_D$ part.
    Terms involving the deterministic height difference are bounded by $n^(o \( 1 \))
    v \[ \( y_0 \/ k_0 \)^2 + ell_0^2 + tau_C \]$. The reverse-order quadratic term adds $n^(O \( epsilon.alt' \))
    v y_0 ell_0$. The side-average variances add $n^(o \( 1 \)) k_0 \/ \( n e_g v \)$. Finally
  $ D^2 lt.eq 4 "Var" L + bb(E) "tr" C^2 \, $
  because $"Var" L = bb(E) X^(sans(T)) C X + 1 / 4 "Var" \| X \|^2$.
    This proves (21), including the discarded-strip error by bounded spin observables.
    Optimizing the integer $k_0$ proves the last assertion: use $k_0$ comparable to
    $\( y_0^2 n e_g v^2 \)^(1 \/ 3)$ when this exceeds one, and otherwise use one.
    In the applications $y_0$ may always be capped by a fixed constant, so this choice is below $n^2$. ◻
]

===== 3.5.1 Broad cap units and the initial wall. <broad-cap-units-and-the-initial-wall.>

We record the modifications needed outside comparable cap components.
  Slice a cap that crosses a large mass ratio into pieces of mass comparable to $v$, at $u asymp v$,
  discarding mass $O \( u_(*) \)$ near zero if necessary. At any dyad there are only a bounded number of such
  broad components: they are ordered disjoint intervals crossing one of its bounding mass levels.
  Integrating the clock inequality over the whole cap bounds the trace in a slice at the cost

$ frac(M \( O \( v \) \), v) #scale(x: 120%, y: 120%)[\(] n^(- delta) L log n +
  r_min upright(bold(1))_(upright("initial")) #scale(x: 120%, y: 120%)[\)] lt.eq n^(o \( 1 \)) \( 1 + v \/ u_(*) \) . $

For the length term, use $d^3 L u_(*) \/ E lt.eq sqrt(n) E \/ d^2 lt.eq 1$; for the wall term use $r_min lt.eq
  u_(*) \/ M \( u_0 \)$ and $M \( v \) \/ M \( u_0 \) lt.eq C \[ \( v + u_(*) \) \/ \( u_0 + u_(*) \) \]^2$.
  Average the observable $L_u$ over the whole slice, without height bins.
  Its mean shift is at most $n^(o \( 1 \)) L$, with $L$ the deterministic scale in (5),
  because all points remain in the original cap. The unordered comparison just proved therefore yields (21)
  without its first term, with $ell_0 = n^(o \( 1 \)) L$, and with the final term replaced by

$ frac(n^(o \( 1 \)) \( 1 + v \/ u_(*) \), n e_g v^2) . $

For an initial cap with comparable endpoint masses, either its mass is less than $u_(*)$,
  in which case we discard it, or $M \( O \( v \) \) r_min lt.tilde u_(*) lt.tilde v$,
  which gives the ordinary unit bound. These alternatives cover all wall losses.

#proof[
  In a regular outer band, complete cap units have comparable endpoint masses:
    their radius widths are $o \( x \)$ and both coordinates are comparable to $v$.
    Assign each unit to a dyad with a fixed enlargement. Use $y_0 = C v$, $e_g asymp e \( v \)$,
    and $v ell_0 lt.tilde n^(- delta) E \/ d^3$ in (21). The two optimized variable terms become
    $\( n e \( v \) v \)^(- 2 \/ 3)$ and $\( n e \( v \) v^2 \)^(- 1)$ after normalization by the band mass.
    Since $ell_0 = o \( v \)$, its squared term is absorbed by $v ell_0$.
    Floor mass in this band is at most $C v k \( c v \)$, and raw moments bound its normalized contribution by $C
    k \( c v \) v^2$. As $v gt.double n^(2 delta) u_(*)$, its square root is at most $C n^(delta \/ 2) u_(*)$.
    Choose the interpolation loss small relative to the specified $epsilon.alt$ and absorb logarithms.
    This proves (18). ◻
]

#proof[
  First treat regular dyads with $v gt.tilde A$ when $A = o \( 1 \)$.
    Multiply the squared bounds underlying (18) by $C e \( v \) v$, and include the mismatch using (9)–(10).
    The four resulting contributions are bounded, up to arbitrarily small power losses, by
  $ n^(- 2 \/ 3) \( e \( v \) v \)^(1 \/ 3) \, wide frac(1, n v) \, wide n^(- delta) frac(e \( v \) v, d^3) E \,
    wide n^delta e \( v \) v u_(*)^2 . $
  Here $e \( v \) v lt.eq C d^3 log n$. Thus the first is at most $n^(- m + o \( 1 \)) E$,
    the second is at most $E$ because $v gt.double u_(*)$, the third is at most $n^(- delta + o \( 1 \)) E$,
    and the last divided by $E$ is at most $n^(delta + o \( 1 \)) d^3 \/ \( n^2 E^3 \) lt.tilde
    n^(- 3 m + delta + o \( 1 \))$. The extra squared cap-width mismatch is smaller than the cap term.
  The remaining region has $r \, u = O \( A \)$, $e lt.eq lambda$, and $e_g gt.tilde n^(- delta) lambda$.
    The last assertion follows from $lambda A \/ d^3 lt.eq n^delta$.
    Its raw moment scale can be taken as $y_0 = C min \( A \, 1 \) lt.eq C A$.
    If $A$ is bounded below, this uses only the trivial moment bounds and covers the whole interval without an
    outer-regularity assumption. Discard mass $O \( u_(*) \)$ near zero and the floor of total mass
    $O \( u_(*) \)$; their entire error is at most
  $ C lambda A^2 u_(*) = C n^(2 delta) E . $
  On the remaining comparable mass units apply (21), with $ell_0 lt.eq n^(o \( 1 \)) L$.
    For $v gt.tilde u_(*)$ the variable terms, multiplied by $lambda v$, are bounded by
  $ C n^(4 delta \/ 3 + o \( 1 \)) E + C n^(delta + o \( 1 \)) E \, $
  using $lambda A^2 = n^(1 + 2 delta) E^2$ and $e_g gt.tilde n^(- delta) lambda$.
    The mismatch costs are at most $n^(o \( 1 \)) lambda v A L lt.eq n^(2 delta + o \( 1 \)) E$,
    since $v lt.tilde A$ and $L lt.eq u_(*)$. Broad units use the preceding paragraph;
    their trace term costs at most $n^(delta + o \( 1 \)) \( 1 + v \/ u_(*) \) \/ \( n v \) lt.tilde
    n^(delta + o \( 1 \)) E$. Initial-wall terms were either discarded at the same cost or included in that trace
    estimate and in (10).
  There are $O \( log n \)$ dyads. Cap units crossing the division between inner and outer regions can be included
    by a fixed enlargement of the inner region; all estimates above tolerate that change.
    Choose $epsilon.alt'$ in (21) sufficiently small compared with $delta$, and absorb the logarithmic losses.
    The whole integral (7) is at most $n^(10 delta) E$. Lemma 16 then permits integration over an interval of
    logarithmic strength of length $O \( log n \)$, with the negligible initial interval treated directly.
    This proves the $n^(20 delta) E$ assertion under its explicitly stated sweep hypotheses. ◻
]

#proof[
  The additional condition $e \( x \) gt.tilde x^2$ implies $x lt.tilde d$ and $W lt.tilde d$.
    Since $lambda lt.eq d^2$, the argument of $f$ at a radius of order $W$ is bounded,
    and $e \( v \) gt.tilde W^2$ there. Above $W$, $e \( v \) v gt.tilde W^3$.
    The first two terms in (18), divided by $x^2 \/ W$ on such dyads,
    are bounded by $C n^(- 1 \/ 3) \/ x^2$ and $C n^(- 1 \/ 2) \/ x^3$;
    both have a polynomial saving since $x gt.tilde n^(- 1 \/ 6 + m)$. The cap term divided by $a^2 \/ d$ is bounded by
  $ C sqrt(n^(- delta) frac(d^3, n^2 E^3)) \, $
  and the floor term has ratio at most $C n^(delta \/ 2) d^3 \/ \( n^2 E^3 \)$.
    These also have polynomial savings. Since $x^2 \/ W gt.tilde a^2 \/ d$,
    they prove the claimed high-band bound. Between $C x$ and $O \( W \)$ use $e \( v \) gt.tilde W^2$.
    Dividing the first two terms by $x^2 \/ \( W^2 v \)^(1 \/ 3)$ gives respectively $C n^(- 1 \/ 3) \/
    x^2$ and at most $C n^(- 1 \/ 2) \/ x^3$; the remaining terms are handled by the same comparison with $a^2 \/
    d$. Take $epsilon.alt$ smaller than these margins. The savings are uniform over the dyads of a sequence with
    fixed comparability constants.
  We next prove the mass version of the second assertion in (19).
    On $c x lt.eq u lt.eq C x$, $r lt.eq C x$, use the ordinary or broad-unit estimates with $y_0 = C x$,
    $v asymp x$, and $e_g asymp e \( x \)$. Units extending towards zero can always be sliced as above. Since
  $ n e_g x^4 gt.tilde \( x \/ u_(*) \)^2 arrow.r oo $
  polynomially, both optimized variable terms in (21) are $o \( x^2 \)$ after normalization by mass.
    The broad trace loss is also harmless:
  $ frac(1 + x \/ u_(*), n e_g x^4) lt.tilde \( u_(*) \/ x \)^2 + u_(*) \/ x = o \( 1 \) . $
  The cap and wall scales satisfy $ell_0 \/ x + r_min \/ x lt.eq n^(- delta + o \( 1 \)) L \/ x = o \( 1 \)$.
    The floor’s raw contribution is $o \( x^3 \)$ because its mass is $O \( u_(*) \) = o \( x \)$.
    This proves the asserted mass mean square.
  For the radius conclusion a direct argument is needed; one cannot discard a radius interval because it carries
    little physical mass. Let $I_0 = { r lt.eq C x : c x lt.eq alpha \( r \) lt.eq C x }$,
    an interval up to endpoints. Raw moments give $S \, D lt.eq C_1 x$ and $parallel L parallel_p lt.eq
    C_p x$ there. The total increase of $S$ is $O \( x \)$, so (1), with $partial_r h gt.eq e_g \/ O \( log n \)$, gives
  $ integral_(I_0) bb(E) "tr" H^2 thin d r lt.eq frac(n^(o \( 1 \)) x, n e_g) \, wide
    x^(- 1) integral_(I_0) bb(E) "tr" C^2 thin d r lt.eq frac(n^(o \( 1 \)), n e_g x^2) . $
  For any radius subinterval $I subset I_0$, apply the last line of (1) with deterministic mass weight
    $upright(bold(1))_I \( r \( u \) \) \/ \( x alpha' \( r \( u \) \) \)$.
    It is legitimate at fixed $n$ because the floor is strictly positive.
    Since $bb(E) W lt.eq bb(E) "tr" H^2 \/ \( c x \)$,
  $ "Var" (x^(- 1) integral_I L thin d r) lt.eq C x^(- 2) integral_I frac(bb(E) W, alpha') thin d r lt.eq
    frac(n^(o \( 1 \)), n e_g x^2 k \( C x \)) = o \( x^2 \) . $
  Only one reciprocal density is paid: one power cancels against $d u = alpha' d r$.
    More explicitly, $n^(2 delta) u_(*) lt.double x$ and $k \( C x \) gt.tilde n^delta u_(*)^2 \/ x^2$,
    so the last variance divided by $x^2$ is at most
  $ C n^(1 - delta + o \( 1 \)) frac(E^2, e_g x^2) lt.eq n^(- delta + o \( 1 \)) . $
  This remains true on a subinterval that lies entirely on the floor.
    Also $x^(- 3) integral bb(E) "tr" C^2 thin d r = o \( 1 \)$ by the preceding trace bound.
  Partition $I_0$ into at most $k_0$ occupied intervals by deterministic $S$ heights,
    each of span $O \( x \/ k_0 \)$. Remove strips of radius length $tau x$ at both ends of each interval.
    Their contribution to $x^(- 3) integral D^2 thin d r$ is $O \( k_0 tau \)$ by raw moments.
    Every remaining point has left and right side averages of radius length at least $tau x$.
    For fixed $k_0 \, tau$ their variances are uniformly $o \( x^2 \)$ by the direct radius bound,
    and their means differ from $bb(E) L_i$ by $O \( x \/ k_0 \)$.
    The ordered identity used in Lemma 27 has the favorable quadratic sign on the two sides.
    Its remaining first term has square at most $C x \( bb(E) "tr" C_j^2 \)^(1 \/ 2)$,
    or the analogous quantity at $i$, using the raw fourth moment of the projection increment.
    The side kernels have size at most $1 \/ \( tau x \)$. Their integrated error is $o \( x^3 \)$ by
    Cauchy–Schwarz and the integrated trace bound. Consequently
  $ limsup_(n arrow.r oo) x^(- 3) integral_(I_0) D^2 thin d r lt.eq C \( k_0^(- 2) + k_0 tau \) . $
  Here $k_0 \, tau$ are fixed before the limit in $n$. Choose $k_0$ arbitrarily large,
    then $tau$ sufficiently small depending on it. This proves the radius part of (19),
    including virtual splits on floor intervals.
  To prove the first assertion of (19), the dyads between $C x$ and $C W$ contribute at most
  $ o \( x^2 \) W^(- 2 \/ 3) integral_x^(C W) v^(- 1 \/ 3) thin d v = o \( x^2 \) . $
  The savings used here are polynomial and uniform, so logarithmic dyadic losses are harmless.
    On $\[ epsilon x \, C x \]$, for fixed $epsilon > 0$, the mass mean-square assertion and Cauchy–Schwarz give
    $o \( x^2 \)$. On $\[ 0 \, epsilon x \]$ the raw overlap bound gives at most $C epsilon x^2$.
    First let $n arrow.r oo$ and then $epsilon arrow.b 0$. Mass omitted from the optimization costs only
    $O \( x u_0 \) = o \( x^2 \)$; the raw bound there was proved by projection from the regular region.
  Finally suppose $W = o \( 1 \)$. In a regular band at a sufficiently large fixed multiple of $W$,
    (18) and the mismatch estimates give $\| S - r \| = o \( W \)$ in normalized mass measure off the floor;
    cap widths are $o \( W \)$ and floor mass is negligible. Monotonicity then supplies a subinterval of mass
    comparable to $W$ on which $S asymp W$. Apply Lemma 22. The averaged $D$ bound on this band has a polynomial
    saving relative to $x^2 \/ W$. Choose $c_1$ smaller than the corresponding polynomial measure-saving exponent.
    Chebyshev’s inequality then makes the set failing a still polynomially saved $D$ bound smaller than the
    central good window. Select a point outside that set. The all-moment estimate holds at every deterministic
    point in the window, so this extra selection preserves (17) without choosing a moment-dependent window.
    Increasing the fixed multiple of $W$ places the split above any prescribed fixed multiple of $x$. ◻
]

#prodef([Remark 3.13.])[
  (Logical use of the estimates).  Propositions 24 and 25 have used only the path identities,
    the constrained first variation, and their stated outer-region hypothesis.
    In particular, no global comparison error has been assumed to obtain (19) or the good split.
    The one-site calculation uses these estimates to identify the possible direct-test profiles.
    The finite propagation argument then establishes outer regularity throughout (8);
    only at that point is the sweep conclusion of Proposition 25 invoked without an unproved regularity premise.
] <comp:dependency>

== 4 The one-site comparison and susceptibility calibration <sec:cavity>

We prove the local scalar closure used below. The removal of one site belongs to the cavity framework of
  #cite(label("AizenmanSimsStarr2003")); here its quantitative remainder is controlled by a finite family of test
  replicas and a susceptibility calibration. All estimates in this section concern a minimizer of the changed
  paths (6) in a direct test. We assume outer regularity above a fixed multiple of $x$, and

$ x gt.tilde a \, wide e \( x \) x^2 gt.tilde n E^2 \, wide e \( x \) gt.tilde x^2 . $

These are the hypotheses for the direct-test consequences of (18). In particular,

$ W = max { x \, sqrt(e \( x \)) } \, wide x lt.eq W lt.tilde d \, wide x arrow.r 0 . $

We also assume the endpoint hypothesis (4) throughout the regular outer region.
  More explicitly, let $C_(upright("reg"))$ be a fixed outer-regularity threshold.
  Along every sequence of masses $u$ in the open working interval with $u gt.eq C_(upright("reg")) x$, we assume

$ b_0 \( u \) = T + o \( u^2 \) \, wide h_0 \( u \) = o \( u^3 \) . $

The little-oh estimates are uniform on fixed comparable mass bands, in the sequential sense specified after (4).
  In particular they hold on the regular calibration bands of scale $W$ used below.
  No instance of (4) is imposed at a target or omitted lower cut below this regular region.

Constants may depend on the fixed temperature, fixed outer comparability constants,
  and the fixed number of test factors, but not on the number of steps in a step approximation.
  An estimate for an integrated replica tree means an estimate after integration against the total variation of
  its deterministic attachment measure. It does not assert pointwise concentration at every high split.

Write $b \, h$ for the changed paths and put $K = h + b S$. The path $K$ is nonnegative and nondecreasing.
  Denote by $Gamma \( K_i \)$ the second conditional-magnetization moment at cut $i$ of the scalar Ising recursion
  with the entire covariance path $K$. This notation retains dependence on the entire path,
  not merely on the number $K_i$.

#thm([Proposition 4.1.])[
  (Uniform one-site closure).  #emph[Fix $0 < c < C < oo$. At a target cut $i$ satisfying $r_i lt.eq
    C x$ and $c x lt.eq u_i lt.eq C x$, along every sequence with $D_i = o \( x \)$,
#[#set math.equation(numbering: n => "(22)")
 $ S_i = Gamma \( K_i \) + o \( x^3 \) . $ <eq:22>]

 The bound is $O \( x^3 \)$, uniformly over these targets, if $D_i = O \( x \)$.
   More precisely, for a fixed direct-test sequence there are $eta_n arrow.r 0$, $C_0 < oo$, and $theta.alt > 0$,
   independent of the target in this band, such that
$ frac(\| S_i - Gamma \( K_i \) \|, x^3) lt.eq C_0 { eta_n + \( D_i \/ x \)^theta.alt } . $

 When $W = O \( x \)$, the $O \( x^3 \)$ assertion also holds at every omitted lower cut,
   without a lower bound on its mass and without (4) at that cut.
   On the bands in (19), the error in (22), divided by $x^3$, tends to zero in normalized $L^1$,
   in both mass and radius coordinates.]
] <prop:cavity-closure>

The two scales in this statement play different roles. At the target scale $x$,
  the comparison gives integrated control of overlap errors,
  but this alone does not control the susceptibility correction left by removing one site.
  When $W = o \( 1 \)$, a regular split of scale $W$ has a centered overlap that is polynomially small in every
  fixed moment. We test the one-site identity at that split and use each new test factor to gain another such
  saving. A fixed number of tests then controls the susceptibility correction.
  A second mean identity at scale $x$ transfers this control to the target cut.
  When $W$ stays bounded below, the integrated overlap bound controls the correction directly.

=== 4.1 The calibration scale and its test factors <the-calibration-scale-and-its-test-factors>

We record the preceding estimates that will be used. At every fixed moment order the raw bounds (12) hold.
  For $W = o \( 1 \)$, choose a good cut $*$ of scale $W$, and a continuity cut of mass $U asymp
  W$ at a sufficiently large fixed multiple of that scale. Both are regular,
  with a regular innovation interval between them. The good cut can be chosen above any prescribed fixed multiple
  of $x$. Equations (17)–(19) give

$ S_(*) asymp W \, wide D_(*) lt.eq n^(- kappa) x^2 / W \, wide parallel R_(*) - S_(*) parallel_p lt.eq
  C_p n^(- c_2) W \, wide integral_0^(C_1 W) D_u thin d u = o \( x^2 \) . $

The exponent $c_2 > 0$ is independent of each fixed $p$; $kappa >
  0$ can be decreased after finitely many fixed-order Hölder estimates.
  At a noncoincident high error split, integrated with a bounded split density above $U$,
  (18) gives a polynomially saved $x^2 \/ W$ bound in $L^2$. The same bound holds at $*$.
  Deleted-coordinate overlaps satisfy these statements with an additional $1 \/ n$.

A block is a set of leaves sharing through the cut of mass $U$. A boundary edge joins distinct such blocks.
  If its low split is at most a fixed multiple of $x$, or is $*$,
  changing an endpoint by continuation resampling after a regular cut of scale $v gt.eq U$ costs, by (16),

$ C_p n^(- kappa) z_v \, wide z_v = frac(x^3, W^(3 \/ 2) sqrt(v)) . $

For a projected edge anchored by $X_(*)$ the bound is

$ C_p n^(- kappa) frac(x^3, W v) . $

Indeed, (13), on an innovation interval before the high cut and after the low fork,
  bounds this projection by $C_p \( log n \)^C sqrt(W) \/ sqrt(n e \( v \) v^3)$.
  Use $e \( v \) v gt.tilde W^3$ and $n^(- 1 \/ 2) lt.double x^3$.
  For an unprojected boundary edge use the synchronized two-branch decomposition in (16).
  These estimates hold for the rest-only system below: its external-field clock is unchanged,
  and its raw moments transfer by Lemma 31.

Throughout, $nu$ denotes normalized planted expectation for the actual changed path on the prescribed replica
  tree. For a noncoincident pair of leaves $c \, d$, let $j \( c \, d \)$ be its prescribed shared revelation cut,
  including the specified side at a jump, and write

$ Delta_(c d) = R_(c d) - S_(j \( c \, d \)) \, wide b_(c d) = b_(j \( c \, d \)) \, wide K_(c d) =
  K_(j \( c \, d \)) . $

All centers $S_j$ are those of the actual changed path and remain fixed during row interpolation.
  Coincident-label contributions retain the terminal and diagonal conventions of (2).

#prodef([Definition 4.2.])[
  (Admissible tests).  A test of degree at most $N$ is a finite linear combination of products of centered
    boundary overlaps and their conditional projections, with these specifications.
    Increase $N$, if necessary, so that it also bounds the number of leaves after the fresh-replica representation
    of the projections. All low splits are $*$, except for at most one initial edge at a cut $i$.
    The distinguished target $a$ is unique in its block among the observed test leaves. Its dependence is a power of
  $ Y_a = X_(*) dot.op y_a - S_(*) $
  times at most one incoming boundary edge from an outside leaf. Other factors do not involve $a$.
    The second target $b$, when an identity is tested, is fresh at $*$ and absent from the test.
  An old block may contain several high relatives. Its internal relationships occur only in deterministic scalar
    coefficients and the prescribed tree topology; no overlap factor is internal to a cut block.
    High relationships between old leaves are integrated with finite-label attachment measures.
    Their bounded scalar coefficients, and constants obtained by expectations of earlier tests,
    are fixed during a subsequent row interpolation. For a monomial,
    its natural scale is the product of $W$ for each star factor and $x$ for the possible initial factor,
    including factors placed in a separate expectation. For a linear combination,
    $p_0$ is the sum of these scales multiplied by the absolute bounds on their scalar coefficients.
    The degree and the number of leaves are fixed independently of $n$;
    all tests generated below have these bounds controlled by the initial degree and recursion depth.
] <def:cavity-tests>

Represent projection powers by conditionally independent fresh teeth at their prescribed low split.
  Tests therefore become spin-only tests before interpolation.
  Every assertion below is for a fixed $N$, with constants allowed to depend on $N$.

#thm([Lemma 4.3.])[
  (Bounded row changes).  #emph[Along a segment of admissible changes of one Gaussian row with uniformly bounded
    covariance kernels, expectations of nonnegative spin-only tests on at most $N$ leaves change by at most a
    factor $C_N$, independently of the step partition. The raw moment bounds and the actual-path centered-overlap
    bounds above therefore hold throughout such a segment with this factor.]
] <lem:cavity-row-change>

#proof[
  Apply (2). The row kernel is bounded and the total variation of its two added-label measure is bounded in terms
    of $N$. Marginalizing the new leaves leaves the original test, so $\| partial_t nu_t \[ A \] \| lt.eq
    C_N nu_t \[ A \]$. Grönwall in both directions proves the assertion.
    Centering constants are those of the actual path and are fixed.
    When the row is scalar, its recursion factors from the rest-spin recursion.
    The latter retains all original external-field increments on the remaining coordinates.
    The proofs of (13) and (16) use these increments and raw moments, so apply to this rest-only law.
    No identification of interpolated and actual conditional means is needed. ◻
]

=== 4.2 Attachment cancellation with observed high subtrees <attachment-cancellation-with-observed-high-subtrees>

The signed differentiation rule is summed before taking absolute values.
  We specify its cancellation inside an observed block.

#thm([Lemma 4.4.])[
  (Truncation inside an observed block).  #emph[Fix an old tree with at most $N$ leaves in a block of mass $U$.
    Deterministic scalar coefficients may depend on all its old split values and earlier test expectations,
    but not on a new leaf $c$’s deeper placement. Replace $c$, after an occupied prefix of mass $v$,
    by an independent continuation from that prefix. The signed sum of deeper placements having this same
    truncated value is $v$ times that value. The telescoping difference between truncations at adjacent comparable
    scales $v \, 2 v$ has total variation at most $C_N v$. The final layer may include coincidences.]
] <lem:cavity-truncation>

#proof[
  The exact collapse is Lemma 7, and the layer estimate is Lemma 12.
    Their coefficient restriction holds because the old topology and earlier test expectations are fixed before
    $c$ is introduced. For two old leaves splitting at $v_B$ inside a block of mass $U$, for example, the total is
  $ 2 - 2 \( 1 - v_B \) - v_B - \( v_B - U \) = U . $
  Here $- v_B$ is the old-fork atom. For coincident leaves the corresponding identity is $1 - \( 1 - U \) = U$.
    These are signed identities; replacing the coefficients by their absolute values before this grouping would
    lose the factor $U$. ◻
]

#thm([Lemma 4.5.])[
  (Boundary covariance estimate).  #emph[Let $F_c$ be a product of two factors of the form $h_j + b_j R_(c d)$,
    where $d$ is exterior to the block of $c$ and their low split satisfies $j = j \( c \, d \) in { i \, * }$;
    one exterior endpoint may be conditionally projected. Let $P$ be admissible.
    If no overlap edge of $P$ is internal to the old block in which $c$ is allocated,
    the placement sum after subtracting the fresh-at-cut baseline is $o \( W x^2 p_0 \)$, uniformly at fixed degree.]
] <lem:cavity-boundary>

#proof[
  Apply Lemma 13 to each grouped layer of Lemma 32. Its conditioning consists of the complete prefix of the
    affected occupied subblock and all branches that have already departed.
    The new leaf supplies $F_c$; the affected old subtree supplies $P$.
    The other endpoints of the two factors in $F_c$, and of every varying edge in $P$, lie outside that subtree.
    Before an old fork we retain both old children; after it the other child belongs to the exterior.
    The normalized transition kernels therefore give exactly the two conditional marginals required by the
    coupling lemma, including for coincidence. Its centered product estimate applies after averaging the prefix.
  Lemma 14, the resampling estimates above, and the raw moments now give
  $ parallel F_c - F'_c parallel_p lt.eq C_(N \, p) n^(- kappa) W z_v \, wide parallel P - P' parallel_p lt.eq
    C_(N \, p) n^(- kappa) \( z_v \/ x \) p_0 . $
  The second bound uses the smallest factor scale $x$; star factors give the stronger denominator $W$.
    Lemma 32 bounds each layer by a polynomially saved multiple of
  $ v \( W z_v \) \( p_0 z_v \/ x \) = p_0 x^5 \/ W^2 lt.eq p_0 W x^2 . $
  There are $O \( log n \)$ layers on these polynomial scales. Their number is absorbed by the saving.
    This argument is uniform in the old topology and its split values,
    so bounded-variation integration preserves the estimate. ◻
]

=== 4.3 The row expansion <subsec:cavity-row-expansion>

Distinguish one coordinate $k_0$ with spin $s$, so $s_c = sigma_(k_0)^c$,
  and normalize deleted overlaps by the full size $n$:

$ R_(c d)^(-) = 1 / n sum_(k eq.not k_0) sigma_k^c sigma_k^d = R_(c d) - frac(s_c s_d, n) . $

Its row covariance between distinct leaves $c \, d$ at shared cut $j = j \( c \, d \)$ is

$ s_c s_d Q_(c d) \, quad Q_(c d) = h_j + b_j R_(c d)^(-) \, quad Q_(c d) - K_j = b_j Delta_(c d)^(-) \, quad
  Delta_(c d)^(-) = R_(c d)^(-) - S_j . $

All centers remain those of the actual path. Replacing a deleted overlap by the full overlap in a degree-$N$ test
  costs $C_N p_0 \/ \( n x \)$. Permutation symmetry then replaces a distinguished-site factor by its overlap
  average at the actual model with the same error. These are harmless since

$ \( n x \)^(- 1) = o \( x^3 \) \, wide \( n x \)^(- 1) = o \( W x^2 \) \, $

using $n x^4 arrow.r oo$ and $W gt.eq x$. Common diagonal row noise cancels by (2).

First suppose $W = o \( 1 \)$. Below $U$ multiply the row covariance by $l in \[ 0 \, 1 \]$,
  moving missing revelation to $U$. Before this operation mix the scalar row $K$ with the actual row $Q$,
  in fraction $t$. Write $nu_(l \, t)$ for the resulting admissible law.
  For each $l in \[ 0 \, 1 \]$, let $nu_l^s$ be the scalar-site marginal of $nu_(l \, 0)$.
  Its cumulative clock is $l K_u$ below $U$ and $K_u$ above $U$,
  with the missing revelation supplied at mass $U$ and the specified revelation sides retained.
  Write $nu^s = nu_0^s$; the law $nu_1^s$ uses the full scalar path $K$.
  Unadorned $nu$ is the actual changed-path expectation, recovered as $nu_(1 \, 1)$.
  On every fixed replica tree, the scalar-site and remaining-coordinate recursions factor at $t = 0$.
  At $l = 0$ the site has independent flip symmetries in its cut blocks.
  At $l = t = 0$ it is an independent scalar recursion. For noncoincident scalar leaves sharing to $v
  in \( U \, 1 \)$, write $gamma \( v \) = nu^s \[ s_a s_c \]$, retaining the specified side at a jump;
  for coincidence, $gamma_(a a) = 1$. All free-label sums use the signed attachment measures of (2) and Lemma 7,
  with the displayed restrictions on coincidences. For the block $A$ of $a$, put

$ gamma_(a c) = nu^s \[ s_a s_c \] \, wide chi = sum_(c in A) gamma_(a c) . $

The scalar row sum is independent of other observed labels.
  It is the scalar continuation Hessian at zero incoming field before the relocated increment at $U$,
  with that increment included in the continuation:

$ chi = 1 - integral_U^1 gamma \( v \) thin d v \, wide 0 < c_0 lt.eq chi lt.eq C_0 . $

Its lower bound follows from expected terminal thermal variance,
  since total scalar clock and planted drift are bounded. For distinct $a \, c$ sharing to high mass $v$,
  $gamma_(a c) lt.eq C v$: the clock is $O \( v \)$, the magnetization martingale starts at zero,
  and its spatial derivatives are bounded.

Define the linear insertion operators

#[#set math.equation(numbering: n => "(23)")
 $ G_(a c) & = 1 / 2 sum_(e \, f in A\
e eq.not f) { nu^s \[ s_a s_c s_e s_f \] - gamma_(a c) gamma_(e f) } b_(e f) Delta_(e f) \,\
M_a & = sum_(c in A) G_(a c) . $ <eq:23>]

These are interpreted inside a test pairing and planted expectation, as signed insertions.
  In particular $nu \[ M_a \] = 0$, because each noncoincident actual-path centered overlap has zero marginal
  expectation.

The test family permits two operations: adding a projected star factor at the current target,
  and choosing a fresh target joined by a star edge to a high relative of the former target.
  The next lemma verifies that both operations preserve the boundary structure needed in Lemma 33.

#thm([Lemma 4.6.])[
  (Closure of the test family).  #emph[Centering an admissible test,
    multiplying by a projected star factor at its target, or passing to a fresh target and multiplying by one
    centered star edge to a summed high relative in the former target block preserves Definition 30 at a larger
    finite degree. New coefficients and attachment measures are bounded in terms of the resulting degree.]
] <lem:cavity-family>

#proof[
  Regard cut blocks as vertices and overlap factors as edges. Each edge joins different vertices.
    A projection adds fresh teeth at $*$, hence boundary edges.
    A switch adds an edge from a new vertex to a high relative in the former target vertex.
    It adds no overlap edge between that relative and the former target:
    their relation enters only through a deterministic scalar coefficient and the old topology.
    The new target is unique in its block and absent from previous factors.
    Centering replaces monomials by earlier expectations, independent of subsequent leaf placements.
  Two switches from $Delta_(a o)$, for example, give
  $ \( Delta_(a o) Delta_(b c) - nu \[ Delta_(a o) Delta_(b c) \] \) Delta_(d e) $
  with old scalar coefficient $gamma_(a c) gamma_(b e)$. In the block containing $b \,
    e$ the varying edges are $b c \, d e$; there is no $b e$ overlap factor.
    Before their old fork resample $b \, e$ jointly, retaining the fork.
    Test variation is $O_p \( x W z_v \)$, at most $O_p \( p_0 z_v \/ x \)$.
    The coefficients are fixed by the old topology, so Lemma 32 applies.
    Induction gives the same graph property for every fixed number of switches.
    Finite-label total-variation and split-density bounds from (2) depend on this degree,
    not the mesh or the least mass. ◻
]

#thm([Lemma 4.7.])[
  (Finite-degree row identity).  #emph[Let $a \, b$ split at $*$, with $b$ fresh,
    and let $P$ be admissible of degree $N$. Let $A$ and $B'$ be the blocks at the current cut $U$ containing $a$
    and $b$, respectively. Then
#[#set math.equation(numbering: n => "(24)")
 $ nu \[ R_(a b) P \] =  & Gamma \( K_(*) \) nu \[ P \] + b_(*) sum_(c in A \, d in B') gamma_(a c) gamma_(b d)
   nu \[ Delta_(c d) P \]\
 & +
   sum_(c in A \, d in B')
   nu \[ P \( G_(a c) gamma_(b d) + gamma_(a c) G_(b d) \) \( K_(*) + b_(*) Delta_(c d) \) \] +
   cal(R)_N \( P \) . $ <eq:24>]

 At fixed degree, uniformly over initial targets $i$ in the band of Proposition 29, the remainder satisfies
$ \| cal(R)_N \( P \) \| lt.eq C_N W x^2 p_0 { eta_(N \, n) + \( D_i \/ x \)^(theta.alt_N) } \, wide
  eta_(N \, n) arrow.r 0 \, quad theta.alt_N > 0 \, $

 where the $D_i$ term is absent without an initial factor.
   Consequently $cal(R)_N \( P \) = o \( W x^2 p_0 \)$ for star-only tests and along every moving initial target
   with $D_i = o \( x \)$.]
] <lem:cavity-row-identity>

#proof[
  We first control the third remainder in the low revelation parameter.
    For the first and second low coefficients we then freeze the actual low kernel $Q$ while expanding only the
    high law; this is a separate expansion from the mixed derivative with its varying kernel $L_t$.
    It isolates the retained linear correction in (24) and a second-order term passing through a third block.
    The latter is treated separately for an unobserved and an observed block.
    First delete the distinguished site from every test. Let $cal(I)_mu \[ J \; V_1 \, dots.h \, V_k \]$ denote
    $k$ signed covariance insertions, including $2^(- k)$ from (2). Kernels include site spins. Write
  $ delta_(c d) = b_j Delta_(c d)^(-) \, quad L_t = \( s_c s_d \( K_j + t delta_(c d) \) \)_(upright("low")) \,
    quad E_l = \( s_c s_d delta_(c d) \)_(upright("high")) + l \( s_c s_d delta_(c d) \)_(upright("low")) . $
  Here low means distinct cut blocks. Set
  $ F \( l \, t \) = nu_(l \, t) \[ s_a s_b P \] - g \( l \) nu_(l \, t) \[ P \] \, wide g \( l \) =
    nu_l^s \[ s_a s_b \] . $
  In particular, $g \( 1 \) = Gamma \( K_(*) \)$ for the full scalar path.
    Then $F \( 0 \, t \) = F \( l \, 0 \) = 0$. Since the low covariance is $l \( K + t delta \)$,
    the exact differentiation rule, for an integer $k gt.eq 0$, is
  $ partial_t partial_l^k nu_(l \, t) \[ J \] = cal(I)_(nu_(l \, t)) \[ J \; E_l \, L_t^(⊗ k) \] +
    k cal(I)_(nu_(l \, t)) \[ J \; delta_(upright("low")) \, L_t^(⊗ \( k - 1 \)) \] \, $
  the second term being absent for $k = 0$.
  #emph[Third low remainder.] The third low Taylor remainder in $F \( 1 \, 1 \)$ is
  $ 1 / 2 integral_0^1 \( 1 - l \)^2 integral_0^1 F_(l l l t) \( l \, t \) thin d t thin d l . $
  Its product term uses the full Leibniz rule
  $ partial_t partial_l^3 \( g nu \[ P \] \) = sum_(r = 0)^3 binom(3, r) g^(\( r \)) partial_t partial_l^(3 - r)
    nu \[ P \] . $
  Thus each measure-derivative term has one error and three low factors,
    and each mixed-covariance derivative has one low error and two low factors.
    A scalar $g^(\( r \)) = O_N \( W^r \)$ counts as $r$ low factors.
    The mixed terms have multiplicity $binom(3, r) \( 3 - r \)$, in addition to insertion normalizations.
  Allocate an error pair before allocating the other new labels.
    A noncoincident high error has a bounded split density, including old high splits after their old integration,
    and costs a polynomially saved $x^2 \/ W$. So does an error at $*$.
    A new low error has bounded split density and costs $integral_0^(C_1 W) D = o \( x^2 \)$.
    This order of allocation prevents a newly created fork from becoming a fixed atom.
    The only other old low atom is $i$.
  At $i$, an ordinary measure-side edge crossing a regular cut of scale $C
    x$ above $i$ and below $*$ costs $O_p \( x \)$. If there is none,
    turn off site revelation below this smaller cut. The $i$-error is odd in its two blocks; the target factor,
    if present, is even and other measure-side insertions remain inside blocks. The expectation vanishes.
    Restoring revelation by one derivative supplies an $O_p \( x \)$ edge.
    Scalar $g^(\( r \))$ factors cannot repair this parity. In particular the term $3 g''
    cal(I) \[ P \; delta_(upright("low")) \]$, which has no ordinary low edge in its measure, costs at most
  $ C_N W^2 x \( D_i + 1 \/ n \) p_0 lt.eq C_N W x \( D_i + 1 \/ n \) p_0 . $
  Every old-$i$ term therefore has the latter bound, up to fixed-moment interpolation of $D_i \/ x$.
    If $W = O \( x \)$, its two original low factors suffice. Diagonal errors vanish.
    This treats every Leibniz and mixed-covariance term of the third remainder.
  #emph[Expansion with the actual low kernel fixed.] For the first and second low coefficients,
    freeze the actual low kernel $Q$ while changing only the high law.
    Put $mu_t = nu_(0 \, t)$, $c_j = g^(\( j \)) \( 0 \)$, and
  $ A \( t \) & = cal(I)_(mu_t) \[ s_a s_b P \; Q_(upright("low")) \] - c_1 mu_t \[ P \] \,\
B \( t \) & = cal(I)_(mu_t) \[ s_a s_b P \; Q_(upright("low")) \, Q_(upright("low")) \] -
  2 c_1 cal(I)_(mu_t) \[ P \; Q_(upright("low")) \] - c_2 mu_t \[ P \] . $
  In particular $A \( t \) eq.not F_l \( 0 \, t \)$ in general. The exact decomposition is
  $ F \( 1 \, 1 \) =  & A \( 0 \) + A' \( 0 \) + 1 / 2 B \( 0 \) + integral_0^1 \( 1 - t \) A'' \( t \) thin d t +
    1 / 2 integral_0^1 B' \( t \) thin d t\
 & + 1 / 2 integral_0^1 \( 1 - l \)^2 integral_0^1 F_(l l l t) \( l \, t \) thin d t thin d l . $
  The $A''$ terms have two high errors and one low factor; the $B'$ terms have one high error and two low factors.
    Their bounds are respectively
  $ C_N n^(- kappa) W \( x^2 \/ W \)^2 p_0 lt.eq C_N n^(- kappa) W x^2 p_0 \, wide
    C_N n^(- kappa) W^2 \( x^2 \/ W \) p_0 . $
  For two saved $L^2$ errors use Hölder exponents just above 2, interpolating with bounded moments;
    the polynomial saving pays the fixed loss. A lone low error uses Cauchy–Schwarz and raw higher moments,
    requiring no rate for its little-oh.
  #emph[The retained first-order terms.] Parity restricts the low edge in $A \( 0 \)$ to $c in A \, d in B'$,
    and $c_1 = chi^2 K_(*)$. Define
  $ C \( t \) = b_(*) sum_(c in A \, d in B') gamma_(a c) gamma_(b d) mu_t \[ Delta_(c d)^(-) P \] . $
  Then $A \( 0 \) = C \( 0 \)$. Subtracting $C' \( 0 \)$ from $A' \( 0 \)$ leaves the high insertion coefficient
  $ nu^s \[ s_a s_c s_b s_d s_e s_f \] - gamma_(a c) gamma_(b d) gamma_(e f) $
  times $Q_(c d) P$. Scalar independence cancels it unless the high edge lies in $A$ or $B'$.
    There it is $\( G_(a c) gamma_(b d) + gamma_(a c) G_(b d) \) Q_(c d)$.
    Replacing $C \( 0 \) + C' \( 0 \)$ by $C \( 1 \)$ adds two high errors and a low factor.
    Restoring the rest-only measure in the connected insertion adds one further high error.
    Both have the $A''$ bound above.
  Restoring full low revelation in $C \( 1 \)$, the first derivative at zero vanishes by block parity;
    the second costs $C_N D_(*) W^2 p_0 = o \( W x^2 p_0 \)$.
    For the connected high insertion an absolute first derivative costs one high error and two low factors,
    covered by the $B'$ bound. These are the actual-measure terms in (24).
  #emph[The second low coefficient.] It remains to bound $B \( 0 \) \/ 2$.
    Its single-low insertion vanishes by parity. Two low edges paired with $s_a s_b$ must form a path $A - D -
    B'$ through a third block $D$. Two edge orders and two orientations per edge,
    times $1 \/ 4$ from the insertions, give exactly the coefficient 2.
    The scalar $c_2$ cancels this same sum with $Q Q$ replaced by $K K$. The Taylor factor $1 \/ 2$ leaves exactly
  $ sum_(D eq.not A \, B') med sum_(f in A \, med c \, e in D\
d in B') gamma_(a f) gamma_(c e) gamma_(d b) mu_0 \[ P { Q_(f c) Q_(e d) - K_(f c) K_(e d) } \] . $
  This includes $c = e$, $f = a$, and $d = b$; none is a diagonal low edge.
  #emph[Unobserved third block.] If $D$ is unobserved, its first entry leaves the old tree below $U$,
    with bounded departure density or old-fork coefficient $O \( W \)$. Use $Q Q - K K = delta Q + K delta$.
    A varying low error costs $o \( x^2 \)$ after integration, while the other factor costs $W$.
    At $*$ the costs are $o_(upright("poly")) \( x^2 \/ W \)$, $W$, and the entry coefficient $O \( W \)$.
    If an edge splits at $i$, both do; the product difference is $O \( x^2 \( D_i \/ x \)^(theta.alt_N) \)$,
    before entry. A departure along a terminal trunk between $*$ and $U$ has one varying split and the other fixed
    at $*$, covered by the same bounds. These exhaust a new third block’s locations relative to the target pair.
  #emph[Observed third block.] If $D$ is observed, its two exterior splits are both $*$ or both $i$.
    Average the fresh endpoint $d$ to its projection at $*$, and sum its scalar row to $chi$.
    This remains valid in the latter case. Evaluate the factor depending on $e$ at $c$.
    For distinct $c \, e$ at high split $v$, its error is a saved $x^3 \/ \( W v \)$.
    The factor $gamma_(c e) lt.eq C v$ pays this denominator, including at old high atoms;
    the other low factor costs at most $W$. The result is $o \( x^3 p_0 \) lt.eq o \( W x^2 p_0 \)$.
    At coincidence the error is zero. The resulting rest observable is independent of $e$’s deeper placement,
    so its scalar row sums to $chi$.
  Only unweighted allocation of $c$ in $D$ remains. Its fresh-at-cut baseline gains $U$.
    The baseline product difference is $O \( W D_(*) \) = o \( x^2 \)$ at $*$,
    or $O \( x^2 \( D_i \/ x \)^(theta.alt_N) \)$ at $i$. Restoring deeper attachment is precisely Lemma 33.
    By Lemma 34 its hypotheses hold also for several old high relatives and earlier centering constants.
  For completeness the exhaustive remainder ledger, with $p_0$ suppressed, is
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Class
], table.cell(rowspan: 1, colspan: 1)[Factors
], table.cell(rowspan: 1, colspan: 1)[Bound
]),
  table.cell(rowspan: 1, colspan: 1)[Third low: measure derivative
], table.cell(rowspan: 1, colspan: 1)[one error, three low factors
], table.cell(rowspan: 1, colspan: 1)[$o \( W x^2 \) + O \( W x D_i \)$
],
  table.cell(rowspan: 1, colspan: 1)[Third low: mixed covariance
], table.cell(rowspan: 1, colspan: 1)[one low error, two low factors
], table.cell(rowspan: 1, colspan: 1)[$o \( W x^2 \) + O \( W x D_i \)$
],
  table.cell(rowspan: 1, colspan: 1)[First high remainder and high restoration
], table.cell(rowspan: 1, colspan: 1)[two high errors, one low factor
], table.cell(rowspan: 1, colspan: 1)[$o_(upright("poly")) \( x^4 \/ W \)$
],
  table.cell(rowspan: 1, colspan: 1)[Second high remainder and connected low restoration
], table.cell(rowspan: 1, colspan: 1)[one high error, two low factors
], table.cell(rowspan: 1, colspan: 1)[$o_(upright("poly")) \( W x^2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Centered first low restoration
], table.cell(rowspan: 1, colspan: 1)[star error, two low factors
], table.cell(rowspan: 1, colspan: 1)[$O \( D_(*) W^2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Scalar-high second, new third block
], table.cell(rowspan: 1, colspan: 1)[centered product; departure or entry
], table.cell(rowspan: 1, colspan: 1)[$o \( W x^2 \) + O \( W x^2 \( D_i \/ x \)^(theta.alt_N) \)$
],
  table.cell(rowspan: 1, colspan: 1)[Scalar-high second, old third block
], table.cell(rowspan: 1, colspan: 1)[row reduction, baseline, covariance
], table.cell(rowspan: 1, colspan: 1)[$o \( W x^2 \) + O \( W x^2 \( D_i \/ x \)^(theta.alt_N) \)$
],
)
]
  All derivatives occur in the exact decompositions above. Allocating an error pair first gives only diagonal
    errors, old low atoms, integrated old high splits, or new splits of bounded density.
    Remaining allocations have bounded total variation at fixed degree.
    Interpolate $Delta_i \/ x$ between its $L^2$ norm and bounded higher moments if a higher Hölder exponent is
    required. The finitely many resulting positive exponents have a positive minimum $theta.alt_N$,
    proving the claimed uniform modulus. Finally restore deleted overlaps and use permutation symmetry. ◻
]

=== 4.4 Projected replacements and the longitudinal insertion <projected-replacements-and-the-longitudinal-insertion>

Write $cal(L) \( P \, a \) = nu \[ P M_a \]$. The replacements needed to close (24) are justified next.

#thm([Lemma 4.8.])[
  (Projected replacements).  #emph[After averaging the fresh partner block,
$ sum_(c in A) gamma_(a c) nu \[ Y_c P \] = chi nu \[ Y_a P \] + o \( W x^2 p_0 \) . $

 In the centered part multiplying $G_(a c)$, $Y_c$ can likewise be replaced by $Y_a$,
   with error $o \( W x^2 p_0 \)$. In the part multiplying $G_(b d)$, interchanging $b \,
   d$ and summing that block gives exactly $sum_c gamma_(a c) cal(L) \( P Delta_(b c) \, b \)$.
   The uniform target modulus of Lemma 35 applies.]
] <lem:cavity-replacements>

#proof[
  The partner operation is exact: its entire block is fresh, $P$ does not use its leaves,
    and its attachment measure is invariant under exchanging root and summed leaf.
    Fresh-block averaging is exact as well. Since $a$ is unique in its observed block, symmetry gives
  $ sum_c gamma_(a c) nu \[ \( Y_c - Y_a \) P_a \] = 1 / 2 sum_c gamma_(a c)
    nu \[ \( Y_c - Y_a \) \( P_a - P_c \) \] . $
  The diagonal vanishes. At a distinct split of scale $v$, the allocation has total variation $O \( v \)$ per
    dyad, and $gamma_(a c) = O \( v \)$. The projected difference costs a saved $x^3 \/ \( W v \)$.
  For the test difference, fix its deterministic replica tree and write the factors not involving $a \, c$ as $H$.
    Let $o$ be the exterior endpoint of an incoming edge, whose split from the target trunk is $j in { i \, * }$,
    and put $s_j = x$ or $W$, respectively. Set
  $ cal(F) = cal(F)_(*)^a \, $
  where $cal(F)_(*)^a$ is the sigma-field generated by the complete planted prefix on the target trunk through
    $*$, including its common initial field. No exterior continuation after its departure from this trunk,
    no exterior terminal spin, and no target innovation after $*$ is included in $cal(F)$.
    In particular $X_(*)$ is $cal(F)$-measurable.
  All leaves used by $H$ lie outside the current target block and leave its trunk by $*$.
    The product of normalized planted transition kernels therefore makes their joint continuation,
    together with $y_o$, independent of the joint future of $a \, c$, conditional on $cal(F)$.
    Average this entire exterior joint law and define
  $ V = upright(bold(E)) \[ H y_o divides cal(F) \] \, wide A =
    upright(bold(E)) \[ y_o y_o^(sans(T)) divides cal(F) \] . $
  The projection powers at $a \, c$ are kept outside this average.
    Explicitly, for any integrable scalar function $Z$ of their continuations and of $cal(F)$,
  $ nu \[ Z H thin \( y_a - y_c \) dot.op y_o \] = nu \[ Z thin \( y_a - y_c \) dot.op V \] . $
  This identity applies with $Z$ containing $Y_a - Y_c$ and the projection powers produced by telescoping $P_a - P_c$.
  If $j = *$, the unweighted marginal of $y_o$ conditional on $cal(F)$ is its ordinary continuation from that
    prefix. If $j = i < *$, the extra target-trunk revelation between $i$ and $*$ is independent of the exterior
    continuation given $cal(F)_i^a$, so the same marginal is the ordinary continuation from $i$.
    Consequently, for two independent copies $o \, o'$ of this conditional marginal,
  $ parallel A parallel_(upright("op")) lt.eq parallel A parallel_(upright("HS")) =
    #scale(x: 120%, y: 120%)[\(] upright(bold(E)) \[ R_(o o')^2 divides cal(F) \]
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, $
  and their unconditional overlap has the split-$j$ marginal. Directional conditional Cauchy–Schwarz gives
  $ parallel V parallel^2 lt.eq upright(bold(E)) \[ H^2 divides cal(F) \] thin parallel A parallel_(upright("op")) . $
  Thus conditional Jensen and Hölder imply, for fixed $p gt.eq 2$,
  $ parallel V parallel_p lt.eq parallel H parallel_(2 p) parallel R_j parallel_p^(1 \/ 2) lt.eq C_p p_H sqrt(s_j) \, $
  where $p_H$ is the raw scale of $H$. Correlations among $H$ and the exterior spin are permitted;
    none of their terminal observations have been conditioned upon.
  The vector $V$ is measurable before the regular innovation interval,
    which is chosen after $*$ and before the high split of $a \, c$.
    Their common projection at the interval’s end cancels in $V dot.op \( y_a - y_c \)$,
    so (13) applies to its two residuals with this fixed anchor.
    Apply that estimate before Hölder with the remaining target projection powers;
    those powers are neither part of the anchor nor conditioned upon.
    Terms where a projection power changes instead use the raw incoming-edge bound and telescope the powers of
    $Y$. Together these operations bound the test difference, in units of $p_0$, by a saved
  $ 1 / v (x^3 / W^2 + x^(5 \/ 2) / W^(3 \/ 2)) . $
  The first term covers projection powers and star incoming edges; the second covers an incoming $i$ edge.
    Multiplying by the projected difference and the two factors $v$ gives, per dyad,
  $ n^(- kappa) p_0 (x^6 / W^3 + x^(11 \/ 2) / W^(5 \/ 2)) lt.eq C n^(- kappa) p_0 W x^2 . $
  The saving absorbs the logarithmic number of dyads.
  For the $G_(a c)$ replacement one projection estimate suffices.
    Allocate $c$ first; its $O \( v \)$ weight cancels the denominator in $x^3 \/ \( W v \)$.
    The high centered error in $G$ adds a saved $x^2 \/ W$. If its split equals that of $a \, c$,
    use (18) over this same dyad; otherwise allocate that error pair next and use Lemma 9.
    Reordering these allocations retains the full scalar topology coefficient,
    by the labeled product rule in Proposition 6; that coefficient is bounded here and is not collapsed as a free
    row. The result is a saved $p_0 x^5 \/ W^2 lt.eq p_0 W x^2$. All bounds are uniform in the target band. ◻
]

Apply (24) with $P^compose = P - nu \[ P \]$. Constants against $M$ alone vanish, so the replacements give

#[#set math.equation(numbering: n => "(25)")
 $ \( 1 - b_(*) chi^2 \) nu \[ Y_a P^compose \] =  & chi K_(*) { cal(L) \( P \, a \) + cal(L) \( P \, b \) }\
 & + b_(*) {chi cal(L) \( P^compose Y_a \, a \) + sum_c gamma_(a c) cal(L) \( P^compose Delta_(b c) \, b \)} +
   cal(E) \( P \; a \, b \) . $ <eq:25>]

Here the row identity and projected replacements give

$ \| cal(E) \( P \; a \, b \) \| lt.eq C_N W x^2 p_0 { eta_(N \, n) + \( D_i \/ x \)^(theta.alt_N) } \, $

with $eta_(N \, n) arrow.r 0$, $theta.alt_N > 0$, and no $D_i$ term for star-only tests.
  After switching to $b$, its single incoming edge is from $c$ in the former target block, as required by Lemma 34.

#thm([Lemma 4.9.])[
  (Finite-depth longitudinal cancellation).  #emph[Put $J_0 = T chi^2 - 1$.
    Every admissible fixed-degree test satisfies, uniformly over initial targets $i$ in the band of Proposition 29,
$ \| cal(L) \( P \, a \) \| lt.eq C x^2 p_0 { eta_n + \( D_i \/ x \)^theta.alt + eta_n \| J_0 \| \/ W^2 } \, wide
  eta_n arrow.r 0 \, quad theta.alt > 0 . $

 The $D_i$ term is absent for star-only tests. Consequently,
   for such tests and along moving initial targets with $D_i = o \( x \)$,
#[#set math.equation(numbering: n => "(26)")
 $ cal(L) \( P \, a \) = o #scale(x: 120%, y: 120%)[\(] x^2 p_0 \( 1 + \| J_0 \| \/ W^2 \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:26>]

]
] <lem:cavity-recursion>

#proof[
  Equations (4) and (6) give
  $ b_(*) = T + O \( W^2 \) \, wide K_(*) = T S_(*) + O \( W^3 \) \, wide chi K_(*) asymp W . $
  The good-split bound and raw higher moments yield
  $ frac(\| \( 1 - b_(*) chi^2 \) nu \[ Y_a P^compose \] \|, chi K_(*)) lt.eq
    eta_n x^2 p_0 \( 1 + \| J_0 \| \/ W^2 \) . $
  Any fixed interpolation loss in the polynomial $D_(*)$ saving is included in $eta_n$.
    To display one generation of the recursion, put
  $ cal(C) \( P \; a \, b \) = b_(*) / K_(*) cal(L) \( P^compose Y_a \, a \) +
    frac(b_(*), chi K_(*)) sum_c gamma_(a c) cal(L) \( P^compose Delta_(b c) \, b \) . $
  After division by $chi K_(*)$, Equation (25) reads
  $ cal(L) \( P \, a \) + cal(L) \( P \, b \) = epsilon \( P \; a \, b \) - cal(C) \( P \; a \, b \) \, $
  where, uniformly over the allowed target band,
  $ \| epsilon \( P \; a \, b \) \| lt.eq C_N x^2 p_0 { eta_n + \( D_i \/ x \)^theta.alt + eta_n \| J_0 \| \/ W^2 } . $
  The target term is absent for star-only tests. Every term in $cal(C)$ adds one star factor,
    with coefficient $O \( 1 \/ W \)$.
  Now choose two fresh roots $u \, v$ at $*$, neither in $P$.
    Pruning the unused fresh root preserves the normalized planted law;
    relabeling therefore identifies each of $cal(L) \( P \, u \)$ and $cal(L) \( P \, v \)$ with
    $cal(L) \( P \, b \)$. Apply the same identity to $u \, v$,
    and subtract half of it from the identity for $a \, b$. This gives
  $ cal(L) \( P \, a \) = epsilon \( P \; a \, b \) - 1 / 2 epsilon \( P \; u \, v \) - cal(C) \( P \; a \, b \) +
    1 / 2 cal(C) \( P \; u \, v \) . $
  Every insertion on the right now has one more star factor than the insertion on the left.
    This is the recursion we iterate.
  Fix a depth $k$, independent of $n$. At depth $j$ the natural scale is $p_0 W^j$,
    and accumulated coefficients are at most $C_j W^(- j)$. Lemma 34 ensures admissibility after every switch,
    even with old high subtrees. Ancestor coefficients are fixed during each new interpolation.
    Row weights have total variation bounded in terms of $j \, N$. Thus intermediate errors are bounded by
  $ C_(k \, N) x^2 p_0 { eta_(k \, N \, n) + \( D_i \/ x \)^(theta.alt_(k \, N)) +
    eta_(k \, N \, n) \| J_0 \| \/ W^2 } . $
  There are finitely many such errors.
  At a terminal node there are exactly $k$ new marked star factors, centered overlaps or projections.
    Hölder at its required fixed order and marginalization identify each with a star pair;
    (17) bounds each by $C_k n^(- c_2) W$, with $c_2$ independent of that order. Initial factors use raw scales.
    The high insertion has bounded fixed moments and finite-label total variation.
    Including the $W^(- k)$ normalization, the terminal bound is $C_(k \, N) p_0 n^(- k c_2)$.
    Centering can send marked factors into earlier separate expectations;
    applying this argument to each expectation preserves their total number $k$.
    Choose $k$ fixed with $k c_2 > 1 \/ 3$. Since $x gt.eq n^(- 1 \/ 6 + m)$,
    the terminal bound is $o \( x^2 p_0 \)$. Only then fix the degrees and Hölder orders.
    Summing the finite recursion proves the lemma. ◻
]

#thm([Lemma 4.10.])[
  (Susceptibility calibration).  #emph[One has $J_0 = O \( W^2 \)$. Therefore
#[#set math.equation(numbering: n => "(27)")
 $ cal(L) \( P \, a \) = o \( x^2 p_0 \) $ <eq:27>]

 for admissible tests along moving targets with $D_i = o \( x \)$, and uniformly
$ \| cal(L) \( P \, a \) \| lt.eq C x^2 p_0 { eta_n + \( D_i \/ x \)^theta.alt } . $

]
] <lem:cavity-calibration>

#proof[
  Use (24) with $P = 1$. The linear centered term and the constant $K_(*)$ parts of the high corrections vanish by
    marginalization. By Lemma 36, remaining terms are insertions against one star factor.
    Equation (26) with $p_0 = W$ bounds them by $o \( W x^2 \( 1 + \| J_0 \| \/ W^2 \) \)$.
  The scalar low expansion is $Gamma \( K_(*) \) = chi^2 K_(*) + O \( W^3 \)$.
    Its second coefficient is a two-edge path through a third block.
    With no other observations the block is unobserved, gaining $O \( W \)$,
    and its two deterministic low factors are $O \( W^2 \)$. The third derivative is $O \( W^3 \)$ by bounded
    finite-label variation. Consequently
  $ S_(*) = chi^2 T S_(*) + O \( W^3 \) + o \( W x^2 \( 1 + \| J_0 \| \/ W^2 \) \) . $
  Divide by $S_(*) asymp W$ to obtain
  $ \| J_0 \| lt.eq C W^2 + eta_n x^2 + eta_n \| J_0 \| x^2 \/ W^2 . $
  Since $x lt.eq W$, absorb the last term. Lemma 37 now gives (27) and its uniform version. ◻
]

=== 4.5 Return to the target cut <return-to-the-target-cut>

#proof[
  Choose a regular continuity cut $U_x asymp C_2 x$ above the entire fixed target band.
    Repeat the mean expansion of Lemma 35 with split $i$ and $P = 1$, also allowing $W$ bounded below.
    The scalar-law and block conventions in this repetition use $U_x$ in place of $U$.
    All low factors cost $O_p \( x \)$. Above $U_x$, the dyadic bounds in (18) are polynomially smaller than $x$.
    Indeed, on the intermediate dyads and the high dyads, respectively,
  $ frac(x^2, \( W^2 v \)^(1 \/ 3)) lt.tilde x quad \( v gt.eq C_2 x \, med W gt.eq x \) \, wide x^2 / W lt.eq x . $
  These are bounds after split integration; no pointwise high-split estimate is needed.
    A third-remainder atom at $i$ costs $O \( x^2 D_i \)$; an integrated low error costs $x integral_0^(C_2 x) D =
    o \( x^3 \)$. High Taylor remainders cost two saved high errors times $x$,
    or one saved high error times $x^2$, and hence are $o \( x^3 \)$.
    The centered first-coefficient low restoration has zero first derivative and second cost $O \( x^2 D_i \)$.
    At second low order every third block is unobserved; its departure density or $O \( x \)$ entry coefficient
    gives the same product difference bounds. This exhausts the earlier ledger at scale $x$, with remainder
  $ C x^3 { eta_n + \( D_i \/ x \)^theta.alt } . $
  The linear centered term and deterministic high means vanish.
    In the remaining $G_(a c)$ term exchange $a \, c$ in the sum and average the opposite fresh branch.
    Let $M_a^(\( x \)) \, chi_x$ denote the insertion and scalar row at $U_x$, and $Y_a^(\( i \)) =
    X_i dot.op y_a - S_i$. The partner term is identical. The surviving form is therefore
  $ S_i - Gamma \( K_i \) = 2 b_i chi_x thin nu \[ Y_a^(\( i \)) M_a^(\( x \)) \] + upright("remainder") . $
  No test depending on $a$ preceded this mean expansion, so this exchange is exact.
  If $W$ is bounded below along a subsequence, (18)–(19) give $integral_(U_x)^1 D_u thin d u = o \( x^2 \)$:
    up to $C_3 x$ use (19), from $C_3 x$ to a fixed multiple of $W$ use the intermediate dyadic bound of (18),
    and above use its high-band bound. Take $C_3$ sufficiently large and fixed.
    Allocate the error pair first, relative only to $a$ in its block, giving a bounded density.
    The insertion costs $O \( x \) integral D = o \( x^3 \)$.
  If $W = o \( 1 \)$, choose the calibration cut $U$ above $U_x$,
    adjusting its fixed multiple also when $W asymp x$. Remove error edges splitting between the cuts at cost
  $ C x integral_(U_x)^U D_u thin d u = o \( x^3 \) . $
  For remaining edges replace the scalar connected kernel at $U_x$ by the one with revelation off up to $U$.
    Each bounded-spin scalar moment changes by $O \( W \)$: its covariance change below $U$ is $O \( W \)$,
    and (2) has bounded finite-label variation. The insertion error is at most
  $ C x W integral_U^1 D_u thin d u = o \( x^3 \) $
  by the saved $x^2 \/ W$ high bound. No arbitrary high-atom estimate is needed:
    allocate the error pair first relative to the sole old root $a$ in this block,
    and then allocate the summed leaf $c$.
  For the new kernel, independent block flips force $c$ into $a$’s calibration block.
    The error endpoints share a block because their split is above $U$.
    If it is different from the block of $a \, c$, the connected scalar covariance vanishes.
    Thus the remaining operator is exactly $M_a$ of (23). The test $Y_a^(\( i \))$ belongs to our family by its
    fresh-tooth representation and has one initial factor of scale $x$.
    Equation (27) proves $nu \[ Y_a^(\( i \)) M_a \] = o \( x^3 \)$, with its uniform target modulus.
  Cuts and integrated estimates are chosen once for the full fixed target band.
    After fixing the recursion depth only finitely many Hölder orders are used.
    Target dependence is a finite collection of positive powers of $D_i \/ x$;
    their minimum is a common $theta.alt > 0$. All remaining errors give a common $eta_n arrow.r 0$.
  For omitted lower cuts suppose $W = O \( x \)$, hence $W asymp x$,
    and choose all regular cuts at the required fixed multiples of $x$, uniformly in the omitted target.
    First perform the star-only calibration: it gives
  $ J_0 = O \( x^2 \) \, wide chi K_(*) asymp x \, $
  using (4) only in the regular calibration region. At every omitted $i$,
    the global raw bounds and conditional Jensen give
  $ parallel R_i parallel_p + \| S_i \| + D_i + parallel Y_a^(\( i \)) parallel_p lt.eq C_p x \, wide
    parallel X_i parallel_p lt.eq C_p sqrt(x) . $
  Monotonicity from the regular region also gives $h_i \, K_i lt.eq C x$.
  Enlarge the admissible tests by allowing their one initial edge to split at any omitted $i$,
    retaining its natural scale $x$. The row-identity proof remains uniform for this class:
    an old-$i$ error costs at most $C_N x^2 \( D_i + 1 \/ n \) p_0$;
    an integrated low error costs $C_N x p_0 integral_0^(C x) \( D_u + 1 \/ n \) thin d u$.
    The observed-third-block baseline at $i$ has product difference $O_p \( x^2 \)$ and gains a cut mass
    $O \( x \)$. The other remainder classes retain their previous bounds.
    Thus the remainder in (24) is $O_N \( x^3 p_0 \)$. All projection and resampling intervals lie in the regular
    region at masses at least $C x$. For an initial incoming edge the weighted-anchor bound uses only its
    split-$i$ raw moments and is $O_p \( p_H sqrt(x) \)$. Its projection denominator is the regular innovation
    mass, never $u_i$. Finite-label attachment variation is bounded independently of $u_i$;
    zero splits follow by the same degenerate-tree conventions and continuity.
  Use (25) with this enlarged class, after the star-only calibration, and divide by $chi K_(*) asymp x$.
    Its left side and remainder are $O_N \( x^2 p_0 \)$. The two-fresh-root equation removes the same-degree
    nuisance as before. At depth $j$, the test scale is $p_0 x^j$ and the accumulated coefficient is at most $C_j
    x^(- j)$, so each intermediate error is $O_j \( x^2 p_0 \)$.
    The $k$ marked star factors bound terminal terms by $C_k p_0 n^(- k c_2)$,
    also when centering places some marks in separate expectations.
    Choose fixed $k c_2 > 1 \/ 3$; then $n^(- k c_2) = o \( x^2 \)$. The finite recursion proves
  $ \| cal(L) \( P \, a \) \| lt.eq C_N x^2 p_0 . $
  In particular $P = Y_a^(\( i \))$ has scale $x$, so $\| nu \[ Y_a^(\( i \)) M_a \] \| lt.eq C x^3$.
    The preceding cutoff and scalar-kernel changes still cost $o \( x^3 \)$, uniformly in $i$.
    The target mean identity therefore gives
  $ S_i - Gamma \( K_i \) = 2 b_i chi_x thin nu \[ Y_a^(\( i \)) M_a \] + O \( x^3 \) = O \( x^3 \) \, $
  since $b_i \, chi_x$ are bounded. Here $K_i = h_i + b_i S_i$ is always the actual changed clock:
    it is never replaced by $T S_i$, so no term $\( b_i - T \) S_i$ occurs.
    No endpoint hypothesis is used at the omitted cut. Finally, if the omitted mass is $u_0 = o \( x \)$,
    its contribution to the integrated $D$ bound is at most $C x u_0 = o \( x^2 \)$.
  Finally let $d mu_n = d u \/ x$ on a mass band of (19), or $d mu_n = d r \/ x$ on its radius band,
    restricted in each case to the indicated set. These measures have uniformly bounded total mass.
    Equation (19) and the raw bound imply
  $ integral \( D_i \/ x \)^2 thin d mu_n \( i \) arrow.r 0 \, wide D_i \/ x lt.eq C . $
  Decrease $theta.alt$ to at most 2. Jensen gives
  $ integral frac(\| S_i - Gamma \( K_i \) \|, x^3) thin d mu_n \( i \) lt.eq C eta_n +
    C (integral \( D_i \/ x \)^2 thin d mu_n \( i \))^(theta.alt \/ 2) arrow.r 0 . $
  This proves both normalized $L^1$ claims. ◻
]

== 5 Profile rigidity <sec:profile>

We prove the two profile statements needed for propagation.
  At scales tending to zero, the one-site closure and the comparison’s first variation force a linear rescaled
  overlap quantile. At scales bounded away from zero, the optimizer converges to the scalar Parisi minimizer.
  The latter gives the macroscopic starting profile; the former controls the smaller scales reached by propagation.

Throughout this section, $T > 1$ is fixed. All sequences have $n arrow.r oo$,
  and the constants in the hypotheses are fixed before this limit is taken.
  The paths to which a pressure or a planted expectation is applied are nonnegative and nondecreasing.
  A bare endpoint may be used merely to parameterize an admissible comparison on its working mass interval;
  no pressure at an inadmissible bare endpoint is used below.

We first consider a small direct test. More precisely, the data satisfy (3)–(5), the path $r =
  r_n$ minimizes (6) at a specified positive strength, and $x = x_n arrow.r 0$ satisfies

$ x gt.tilde a \, wide e \( x \) x^2 gt.tilde n E^2 \, wide e \( x \) gt.tilde x^2 . $

There are fixed constants $C_0 \, c_0 \, C_1 > 0$ such that

$ c_0 u lt.eq r \( u \) lt.eq C_1 u wide \( C_0 x lt.eq u < 1 \) . $

The omitted mass, if present, is $u_0 = o \( x \)$, and the initial radius obeys (5).
  Total matrix and field clocks are bounded by fixed constants.
  These are precisely the direct-test hypotheses of Proposition 24. In particular, they imply $x = O \( d \)$.
  Write $b = b_0 - e \( r \)$, $h = h_0 + e \( r \) r$ on the working interval and retain the specified changed
  paths below it. Put

$ K_u = h_u + b_u S_u . $

This is a nonnegative nondecreasing scalar covariance path.

#thm([Theorem 5.1.])[
  (Rigidity at a small test scale).  #emph[Under the preceding hypotheses,
    every sequence has a subsequence on which, for some $kappa$,
#[#set math.equation(numbering: n => "(28)")
 $ frac(r \( x v \), x) arrow.r v / kappa quad upright("locally uniformly for ") v in \( 0 \, oo \) \, wide
   0 < c lt.eq kappa lt.eq C < oo . $ <eq:28>]

 The bounds on $kappa$ depend only on $T$ and the total-clock bounds.
   The same conclusion holds for a comparison with an omitted lower group,
   provided its changed paths and the constrained competitors used in the first variation are admissible.]
] <prof:direct-profile>

=== 5.1 The closure estimates in both coordinates <the-closure-estimates-in-both-coordinates>

Physical mass $u$ parametrizes the planted splits, whereas overlap radius $r$ parametrizes the inverse quantile
  $alpha$ and its first variation. We will take limits in both coordinates:
  a floor interval can have negligible mass and nonnegligible radius length,
  so only the radius estimates can detect a possible gap there.
  We first collect the needed consequences of (19) and (22). For fixed $0 < c < C < oo$, let

$ I_n \( c \, C \) = { r : 0 lt.eq r lt.eq C x \, med c x lt.eq alpha \( r \) lt.eq C x } . $

At endpoints either fixed side convention may be used. We write $S \( r \)$, $D \( r \)$,
  and $K \( r \)$ for the quantities at the corresponding split.

#thm([Lemma 5.2.])[
  (Closure in mass and radius).  #emph[On each such band,
$ 1 / x^3 integral_(I_n \( c \, C \)) D \( r \)^2 thin d r arrow.r 0 . $

 The analogous statement holds with physical mass in place of radius. Moreover, with
$ rho_n \( i \) = frac(S_i - Gamma_n \( K_i \), x^3) \, $

 there is a uniform bound $\| rho_n \( i \) \| lt.eq C_(c \, C)$ on the band, and
$ 1 / x integral_(I_n \( c \, C \)) \| rho_n \( r \) \| thin d r arrow.r 0 . $

 The corresponding normalized mass integral also tends to zero.
   The uniform bound includes arbitrary moving split locations in the specified bands;
   along any such sequence with $D_i = o \( x \)$, $rho_n \( i \)$ tends to zero.]
] <prof:coordinate-closure>

#proof[
  The concentration assertions are (19); their radius version is a direct estimate,
    rather than a change of variables in a mass estimate. For clarity,
    the estimate that pays the inverse-density loss is
  $ frac("Var" \( x^(- 1) integral_I L thin d r \), x^2) lt.tilde frac(n^(o \( 1 \)), n e \( x \) x^4 k \( C x \))
    lt.tilde frac(n^(1 - delta + o \( 1 \)) E^2, e \( x \) x^2) lt.tilde n^(- delta + o \( 1 \)) $
  for radius subintervals of the band. Here one applies (1) with mass weight
    $upright(bold(1))_I \( r \( u \) \) \/ \( x alpha' \( r \( u \) \) \)$, and uses the clock inequality,
    $H_u gt.eq c x C_u$, and $k \( C x \) gt.tilde n^delta u_(*)^2 \/ x^2$.
    The ordered side-average argument in Proposition 24 converts this estimate and the integrated trace estimate
    to the asserted radius mean-square bound. Thus the conclusion remains valid even when $alpha' =
    k$ throughout most of the radius interval.
  The raw bounds (12) give $D_i = O \( x \)$ uniformly here.
    Proposition 29 supplies a fixed $theta.alt > 0$ and $eta_n arrow.r 0$ such that
  $ \| rho_n \( i \) \| lt.eq C { eta_n + \( D_i \/ x \)^theta.alt } $
  at every split in the band. This gives the uniform bound on $rho_n$, including moving splits.
    For either normalized measure $d u \/ x$ or $d r \/ x$, the band has bounded measure and $D \/
    x$ tends to zero in $L^2$ while remaining uniformly bounded.
    Hölder’s inequality therefore makes the integral of $\( D \/ x \)^theta.alt$ tend to zero.
    The displayed modulus proves both asserted $L^1$ limits, including the radius limit on floor intervals. ◻
]

=== 5.2 Scalar derivatives and rescaled compactness <scalar-derivatives-and-rescaled-compactness>

Fix a full scalar covariance path $K = \( K_u \)$. Write $Gamma \( k \)$ for its scalar moment curve at covariance
  value $k$; differentiation in $k$ holds that path, and hence its mass profile in scalar time, fixed.
  The subscript $n$ records the full path of the $n$th system. In scalar time $q = k \/ T$, put

$ alpha_K \( q \) = \| { u in \( 0 \, 1 \) : K_u \/ T lt.eq q } \| . $

A jump of $K$ is filled with its constant mass, and an initial empty clock is filled with mass zero.
  The scalar continuation $V$ and its optimal diffusion satisfy

$ V_q = - T / 2 #scale(x: 120%, y: 120%)[\(] V_(z z) + alpha_K \( q \) V_z^2 #scale(x: 120%, y: 120%)[\)] \, wide
  d Z_q = T alpha_K \( q \) V_z \( q \, Z_q \) thin d q + sqrt(T) thin d B_q \, wide Z_0 = 0 . $

The terminal function is $log cosh z$. Adding a terminal mass-one clock changes $V$ only by a constant in $z$ and
  does not change its positive-order spatial derivatives. We use

$ hat(Gamma) \( q \) = Gamma \( T q \) = bb(E) V_z \( q \, Z_q \)^2 . $

The moment identities below are the SK specialization of #cite(label("AuffingerChenProperties2015"))
  Proposition 3; see also #cite(label("JagannathTobasco2017")) Lemma 8.4.
  We give their diffusion derivation together with the uniform fourth-derivative bound needed for the limiting slope.

#thm([Lemma 5.3.])[
  (Scalar derivatives and strict curvature).  #emph[For scalar clocks with a fixed bound on total variance,
    positive-order spatial derivatives of every fixed order are uniformly bounded.
    They are absolutely continuous in scalar time, with uniformly bounded almost-everywhere time derivatives of
    each fixed spatial order. The function $V$ is even in $z$, $V_(z z) > 0$, and
$ hat(Gamma)' \( q \) = T bb(E) V_(z z) \( q \, Z_q \)^2 \, wide hat(Gamma)'' \( q \) =
  T^2 bb(E) #scale(x: 120%, y: 120%)[\[] V_(z z z) \( q \, Z_q \)^2 -
  2 alpha_K \( q \) V_(z z) \( q \, Z_q \)^3 #scale(x: 120%, y: 120%)[\]] $

 for almost every $q$. There are constants $c \, C > 0$, depending only on $T$ and the total-clock bound, such that
$ c lt.eq V_(z z) \( 0 \, 0 \) lt.eq C \, wide c lt.eq - V_(z z z z) \( 0 \, 0 \) lt.eq C . $

]
] <prof:scalar-derivatives>

#proof[
  Corollary 11, applied to one Ising spin, gives the spatial derivative bounds independently of the partition.
    The finite-step formulas pass to general clocks by Proposition 15.
    The PDE expresses the time derivatives in terms of bounded spatial derivatives and $0 lt.eq alpha_K lt.eq 1$.
    Convexity and evenness are preserved by every scalar Gaussian continuation.
  Itô’s formula gives
  $ d V_z \( q \, Z_q \) = sqrt(T) thin V_(z z) \( q \, Z_q \) thin d B_q \, $
  and
  $ d V_(z z) \( q \, Z_q \) = - T alpha_K \( q \) V_(z z) \( q \, Z_q \)^2 thin d q +
    sqrt(T) thin V_(z z z) \( q \, Z_q \) thin d B_q . $
  Taking expectations of the squares proves the two displayed derivative identities.
    Absolute continuity is sufficient for these applications of Itô’s formula;
    alternatively one first works with step clocks and passes to the limit using the stated derivative bounds.
  For the strict lower bounds, let $Q$ be terminal scalar time.
    Differentiating the equation once more shows that $w = V_(z z)$ solves a linear backward equation with drift
    $T alpha_K V_z$, potential $T alpha_K w$, and terminal value $"sech"^2 z$.
    Since the drift is uniformly bounded and the potential is nonnegative,
    its Feynman–Kac representation bounds $w \( 0 \, 0 \)$ below by a positive constant uniformly for bounded $Q$.
    One can see the uniformity directly by restricting the terminal diffusion to a fixed bounded interval,
    which has uniformly positive probability.
  Set $v = V_(z z z)$. It satisfies the linear equation
  $ v_q + T / 2 v_(z z) + T alpha_K V_z v_z + 3 T alpha_K V_(z z) v = 0 . $
  On $z > 0$, the drift and potential are nonnegative, $v \( q \, 0 \) = 0$, and the terminal value is $-
    2 tanh z thin "sech"^2 z < 0$. Use the killed-diffusion representation on the positive half-line.
    For $Q$ in a fixed compact subinterval of $\( 0 \, oo \)$ and small initial $z > 0$, the event that $z +
    sqrt(T) B$ stays positive and ends in a fixed interval $\[ a \, b \]
    subset \( 0 \, oo \)$ has probability at least $c_1 z$, by the reflected Gaussian kernel.
    On this event the diffusion with nonnegative bounded drift also survives,
    and its terminal value lies in $\[ a \, b + T Q \]$. Its negative terminal datum is therefore bounded away
    from zero in absolute value, while the Feynman–Kac weight is at least one.
    Hence $- v \( 0 \, z \) gt.eq c_2 z$, and division by $z$ gives $- V_(z z z z) \( 0 \, 0 \) gt.eq c_2$.
    If $Q$ tends to zero, the bounded time derivative and $V_(z z z z) \( Q \, 0 \) = -
    2$ give the same conclusion. Upper bounds follow from the spatial derivative bounds. ◻
]

We next compare the overlap radius with scalar time $q = K \/ T$.
  At the test scale their distributions have the same limit.
  The scalar second derivative then has size $x$ on clocks of size $x$;
  two integrations produce the cubic defect below once its linear term has been calibrated at a positive outer split.

#thm([Lemma 5.4.])[
  (Scalar compactness at the test scale).  #emph[Under the hypotheses of Theorem 39, pass to a subsequence.
    There is a locally finite measure $nu$ on $\[ 0 \, oo \)$, with cumulative function $U \( t \) =
    nu \( \[ 0 \, t \] \)$, such that the rescaled distributions of $r$ and of $K \/
    T$ both converge locally weakly to $nu$. For sufficiently large $t$,
    $U \( t \)$ is bounded above and below by fixed positive multiples of $t$. Further subselection gives
#[#set math.equation(numbering: n => "(29)")
 $ g_n \( t \) = frac(Gamma_n \( T x t \) - x t, x^3) arrow.r g \( t \) quad
   upright("in ") C_(upright("loc"))^1 \( \[ 0 \, oo \) \) \,\
g \( 0 \) = 0 \, wide g'' \( t \) = A t - B U \( t \) quad upright("for almost every ") t \, wide A \,
  B > 0 . $ <eq:29>]

 The function $g$ vanishes on $"supp" nu$. The constants $A \,
   B$ have positive lower bounds and finite upper bounds depending only on $T$ and the total-clock bound.]
] <prof:scalar-compactness>

#proof[
  #emph[The limiting mass distribution.] Give a Borel radius set $J$ rescaled mass $x^(- 1) \| { u > u_0 :
    r \( u \) \/ x in J } \|$. Its cumulative function differs from $alpha \( x t \) \/ x$ by at most $u_0 \/ x =
    o \( 1 \)$. Outer comparability bounds its mass on each compact set and bounds its cumulative function above
    and below by multiples of $t$ for sufficiently large $t$. Helly selection gives a locally finite weak limit $nu$.
  We next compare the scalar clock. The total floor mass is bounded by $integral k \( r \) thin d r = o \( x \)$.
    On a positive compact mass band, outer comparability and monotonicity give $r = O \( x \)$,
    while cap widths and the initial wall are $o \( x \)$. Since $x = O \( d \)$ and $lambda lt.eq d^2$,
    the taper argument $lambda r \/ d^3$ is bounded on these bands, including their cap endpoints.
    Thus $1 - p$ has a fixed positive lower bound. The proof of Lemma 18 then gives (10) with a fixed constant in
    place of $n^(o \( 1 \))$ on these bands. Together with (9) and the mass estimate in (19), this proves $S - r =
    o \( x \)$ in normalized mass measure off a negligible set.
    Since $b_0 - T = o \( x^2 \)$, $h_0 = o \( x^3 \)$, and $S = O \( x \)$ there,
  $ K \/ T - r = \( 1 - e \/ T \) \( S - r \) + \( \( b_0 - T \) S + h_0 \) \/ T = o \( x \) $
  in the same measure. Mass below $epsilon x$ contributes at most $epsilon$ to the rescaled measure.
    Monotonicity and an outer regular point at a sufficiently large fixed multiple of $x$ prevent mass above a
    sufficiently large multiple of $x$ from contributing to a fixed compact clock interval.
    Letting $epsilon arrow.b 0$ proves the same local weak limit for $K \/ \( T x \)$,
    including possible atoms at zero. In particular $alpha_K \( x t \) \/
    x$ is locally bounded and converges to $U \( t \)$ at its continuity points.
  #emph[The second derivative of the scalar defect.] Write $a_(2 \, n) =
    V_(n \, z z) \( 0 \, 0 \)$ and $a_(4 \, n) = V_(n \, z z z z) \( 0 \, 0 \)$.
    Select convergent subsequences of these two numbers. On compact $t$-intervals the diffusion has
  $ frac(bb(E) Z_(x t)^2, x) arrow.r T t \, wide bb(E) \| Z_(x t) \|^(2 j) = O_j \( x^j \) . $
  These statements follow from bounded drift, or directly from its bound $T alpha_K \| V_z \| lt.eq
    C x \| Z \|$ on the relevant clocks. Oddness and the derivative bounds give
  $ frac(bb(E) V_(n \, z z z) \( x t \, Z_(x t) \)^2, x) arrow.r T a_4^2 t \, wide
    bb(E) V_(n \, z z) \( x t \, Z_(x t) \)^3 arrow.r a_2^3 . $
  For example, $V_(n \, z z z) \( q \, z \) = a_(4 \, n) z +
    O \( q \| z \| + \| z \|^3 \)$ uniformly on bounded $z$-intervals,
    and the moment bounds control the complement. By Lemma 41,
  $ g''_n \( t \) & = frac(hat(Gamma)''_n \( x t \), x)\
 & =
   T^2
   [frac(bb(E) V_(n \, z z z) \( x t \, Z_(x t) \)^2, x) - 2 frac(alpha_K \( x t \), x) bb(E) V_(n \, z z) \( x
   t \, Z_(x t) \)^3] . $
  These second derivatives are locally bounded and converge almost everywhere, and in local $L^1$, to
  $ A t - B U \( t \) \, wide A = T^3 a_4^2 \, wide B = 2 T^2 a_2^3 . $
  Both coefficients have the asserted strict bounds.
  #emph[Calibration of the linear term.] It remains to bound $g'_n \( 0 \)$;
    a bound on $g''_n$ alone would leave this coefficient undetermined.
    Choose a nonfloor split in an outer band with $u \, r asymp x$ and $D = o \( x \)$,
    using the mass version of (19). Its scalar clock $K \/ \( T x \)$ is bounded above and below by positive
    constants. If $e \( x \) \/ x^2$ is bounded, then $e \( 0 \) =
    O \( x^2 \)$ on these compact radius bands and $\( S - K \/ T \) \/ x^3 = O \( 1 \)$.
    If $e \( x \) \/ x^2 arrow.r oo$, then $x \/ d arrow.r 0$ and $e = lambda$, $p =
    0$ exactly on every compact radius band. On contact $S = r$; on a cap,
  $ \| S - r \| lt.eq ell + r_min upright(bold(1))_(upright("initial")) \, wide
    frac(lambda \( ell + r_min \), x^3) lt.tilde n^(- delta) log n thin lambda / d^2 (a / x)^3 = o \( 1 \) . $
  Here we used $L lt.eq a^3 \/ d^2$, the cap-width bound, and $r_min lt.eq n^(- delta) L$.
    Thus the same scalar value is bounded also in this regime. Closure (22) bounds $g_n$ at this positive clock.
    As $g_n \( 0 \) = 0$ and $g''_n$ is locally bounded, it bounds $g'_n \( 0 \)$.
    Subsequence selection and integration of $g''_n$ prove (29).
  #emph[Zeros on the support.] The same argument at almost every selected mass point gives $g =
    0$ on the support of $nu$. More explicitly, in the bounded-strength regime $e \( S - r \) =
    o \( x^3 \)$ on the full-measure selections above; in the constant-profile regime the displayed cap estimate
    gives this conclusion. The bare-clock error is $o \( x^3 \)$,
    and Lemma 40 supplies little-oh closure at such points. Therefore $g_n \( K \/ \( T x \) \) arrow.r
    0$ on full normalized-mass selections. Every positive support point can be approached by these selections from
    neighborhoods carrying positive limiting mass, including an approximating atom.
    Local uniform convergence of $g_n$ then gives $g = 0$ there. At zero use $g \( 0 \) = 0$. ◻
]

#thm([Lemma 5.5.])[
  (Uniform scalar linearization).  #emph[For each fixed $C < oo$, under the small direct-test hypotheses,
$ sup_(0 lt.eq K lt.eq C x) \| Gamma_n \( K \) - K \/ T \| = O \( x^3 \) \, wide Gamma'_(n \, K) \( 0 \) =
  T^(- 1) + O \( x^2 \) . $

 Only the portion of this clock interval present in the scalar continuation is needed;
   for all sufficiently large $n$ it contains every displayed fixed multiple of $x$.
   The assertion is uniform along arbitrary admissible sequences with the stated fixed bounds.
   It allows an omitted mass $u_0 = o \( x \)$ and requires no version of (4) on that omitted group.]
] <prof:low-clock-linearization>

#proof[
  Choose the outer calibration band in the preceding proof beyond the fixed target interval.
    At its selected split, $K_c asymp x$ and $K_c > C x$. Monotonicity gives $alpha_K \( q \) =
    O \( x \)$ for every smaller clock; the omitted mass contributes only $o \( x \)$.
    The second-derivative identity then gives $hat(Gamma)'' \( q \) = O \( x \)$ for $q = O \( x \)$.
    The positive-clock calibration gives $Gamma \( K_c \) - K_c \/ T = O \( x^3 \)$, and $Gamma \( 0 \) = 0$.
    Taylor integration therefore yields the derivative estimate and the uniform bound down to zero,
    including clock gaps. Equivalently, they follow from the uniform local bounds on $g_n$ and $g'_n$ in the
    preceding proof. If uniformity along the allowed sequences failed,
    selecting the violating sequence and repeating that proof would be a contradiction.
    No lower-group stationarity or lower-group closure is used here. ◻
]

=== 5.3 Virtual gaps and limiting potentials <virtual-gaps-and-limiting-potentials>

The scalar defect $g$ now vanishes on the support of $nu$.
  To show that the support has no gaps, we use the first variation at radii that may carry no limiting mass.
  This is where the radius form of the closure estimate is needed.

#thm([Lemma 5.6.])[
  (Stationarity on virtual radius intervals).  #emph[Let $l = inf "supp" nu$.
    On compact radius intervals $t > l$, subselection gives a monotone limit $s \( t \) =
    lim S \( x t \) \/ x$ almost everywhere. The normalized stationarity quantity $G \( x t \) \/
    x^3$ is uniformly bounded on each such interval and converges strongly in $L^1$ to a function $F$.
    There are two cases. If $e \( x \) \/ x^2 arrow.r oo$, then
$ s \( t \) = t \, wide F \( t \) = - 2 T g \( t \) . $

 Otherwise, after subselection, $e \( x t \) \/ x^2 arrow.r
   h_1 \( t \) > 0$ and the logarithmic slopes converge locally; then
$ g \( s \( t \) \) = frac(h_1 \( t \), T) \( s \( t \) - t \) \, $

 and $F \( t \)$ has the sign of $t - s \( t \)$, with equality precisely when $t = s \( t \)$.]
  #emph[If $\( a_1 \, a_2 \)$ is a gap in $"supp" nu$ with endpoints in that support and positive cumulative mass
    on the gap, there is a nonnegative Lipschitz function $cal(H)$ on $\[ a_1 \, a_2 \]$ with zero endpoint values
    such that
$ cal(H)' \( t \) = j \( t \) F \( t \) quad upright("almost everywhere") \, wide 0 < c lt.eq j \( t \) lt.eq C . $

 In the bounded-strength case, $s \( t \) in \[ a_1 \, a_2 \]$ almost everywhere on the gap.]
] <prof:virtual-potential>

#proof[
  On each compact interval above $l$, masses $alpha \( x t \)$ lie between fixed positive multiples of $x$.
    The raw estimates give $S = O \( x \)$, $B = O \( x^2 \)$, and $K = O \( x \)$ there.
    Helly selection supplies $s$. Introduce the bare-clock remainder
  $ zeta_n \( r \) = frac(\( b_0 \( alpha \( r \) \) - T \) S \( r \) + h_0 \( alpha \( r \) \), x^3) . $
  By (4), it is uniformly $o \( 1 \)$ on these compact mass bands. The exact closure identity is
  $ frac(e \( r \) \( S \( r \) - r \), T x^3) = g_n #h(-0.16667em) (frac(K \( r \), T x)) + rho_n \( r \) +
    frac(zeta_n \( r \), T) . $
  In particular the closure error is additive in this identity.
    Lemma 40 gives both its uniform bound and its strong radius $L^1$ convergence to zero.
  If $e \( x \) \/ x^2 arrow.r oo$, then $lambda r \/ d^3 lt.eq C x \/ d arrow.r 0$ on a compact radius band.
    Thus $e = lambda$ and $p = 0$ exactly there. The last identity and the boundedness of $g_n$ imply
  $ sup frac(\| S - r \|, x) lt.tilde x^2 / e arrow.r 0 \, wide frac(K \( r \), T x) - r / x arrow.r 0 $
  uniformly on the band. Therefore $G = 2 e \( r - S \)$ is uniformly of order $x^3$ and $G \( x t \) \/ x^3
    arrow.r - 2 T g \( t \)$ strongly in $L^1$.
  In the other case, the fixed smooth strength profile has a locally convergent subsequence with positive limit
    $h_1$; the same is true of its logarithmic slope. Now $e = O \( x^2 \)$, so $K \/ \( T x \) - S \/ x arrow.r
    0$. Pass to the limit in the exact closure identity to obtain the displayed equation for $g \( s \)$.
    Since $B = S^2 + D^2$ and the radius version of (19) makes $D^2 \/ x^2$ tend to zero in $L^1$,
    the limit of $G \/ x^3$ is
  $ F \( t \) =
    h_1 \( t \) (\( 2 - p \( t \) \) t - 2 \( 1 - p \( t \) \) s \( t \) - p \( t \) frac(s \( t \)^2, t)) . $
  The bracket factors as
  $ \( t - s \( t \) \) (2 - p \( t \) + p \( t \) frac(s \( t \), t)) \, $
  and its second factor is positive. Raw bounds give a uniform bound on $G \/
    x^3$ on compact positive radius intervals. If a band extends to zero, $p =
    0$ on a fixed scaled neighborhood of zero because $x = O \( d \)$ and $lambda lt.eq d^2$;
    this removes the apparent $1 \/ t$ singularity.
  We construct the potential, including its endpoint values.
    On any band with masses comparable to $x$, normalize the first-variation factor $J$ at one reference radius.
    Its distortion is bounded above and below: indeed
  $ integral w M' \( alpha \) thin d r lt.eq integral frac(M' \( alpha \), M \( alpha \)) alpha' thin d r lt.eq
    2 log frac(alpha_(upright("right")) + u_(*), alpha_(upright("left")) + u_(*)) . $
  Thus $J \/ J_(upright("ref"))$ has a weak-star convergent subsequence in $L^oo$ with limit $j$ bounded above and
    below by positive constants. Normalize the potential by $x^4 J_(upright("ref"))$.
    Its derivative in scaled radius is $\( J \/ J_(upright("ref")) \) G \/ x^3$, which is uniformly bounded.
    Strong $L^1$ convergence of $G \/ x^3$ identifies the derivative of every uniform potential limit as $j F$.
  A support point is approached by nonfloor mass points, since a neighborhood with positive limiting rescaled mass
    cannot consist of the $o \( x \)$ total floor mass. At contact the potential is zero.
    At a point in a negative cap its right zero lies at radius distance $o \( x \)$;
    the derivative bound makes the normalized potential there $o \( 1 \)$.
    Outer comparability bounds the masses above by $C x$ after a fixed enlargement of the band.
    If the point is the first support point and begins a gap, it must be an atom.
    Choose the reference points inside its approximating atom after a fixed positive amount of rescaled mass has
    accumulated. The mass is then bounded below by $c x$ all the way from that reference to the interior of the
    gap; no estimate on smaller masses is needed. The normalized potentials are controlled on intervals starting
    at these moving reference points. Their uniform Lipschitz bound extends the limit to the atom with endpoint
    value zero. This also covers an atom at radius zero, without requiring a bound at the exact prelimit radius zero.
  These reference points both bound the additive constant of the normalized potential and pin its limiting
    endpoint values to zero. Negative cap components have radius width $o \( x \)$,
    so their negative excursions disappear under the same Lipschitz bound. The limit is therefore nonnegative.
    This uses small floor mass only to select a reference point inside positive support mass,
    never to discard a floor interval in radius.
  Finally, in the bounded-strength case, monotonicity bounds the virtual values of $S \/
    x$ between active mass selections approaching the two support endpoints.
    At those selections $S - r = o \( x \)$. Consequently $a_1 lt.eq s \( t \) lt.eq a_2$ on the gap, as claimed. ◻
]

#proof[
  We show that the limiting support is all of $\[ 0 \, oo \)$.
    On a bounded gap, the variational potential forces both endpoint slopes of $g$ to be nonpositive,
    while its scalar equation forces their sum to be positive.
    Consider such a nontrivial gap $\( a_1 \, a_2 \)$ with positive cumulative mass.
    We claim $g' \( a_1 \) lt.eq 0$ and $g' \( a_2 \) lt.eq 0$.
    If $g' \( a_1 \) > 0$, then $g > 0$ immediately to the right of $a_1$.
    In the diverging-strength case this makes $F < 0$ there, contrary to $cal(H) gt.eq 0$ and $cal(H) \( a_1 \) =
    0$. In the bounded-strength case the closure equation excludes $s = a_1$ for $t > a_1$.
    If $s$ is close to $a_1$, the inequality $g \( s \) > 0$ forces $s > t$; if $s$ is farther from $a_1$,
    it is again greater than $t$ for all sufficiently nearby $t$.
    Thus $F < 0$ almost everywhere immediately to the right, giving the same contradiction.
    If $g' \( a_2 \) > 0$, the analogous argument on the left gives $F > 0$ there, which contradicts $cal(H) gt.eq
    0$ and $cal(H) \( a_2 \) = 0$.
  On the gap, $U$ is constant, $g \( a_1 \) = g \( a_2 \) = 0$, and $g'' \( t \) = A t - upright("constant")$.
    Direct integration gives
  $ g' \( a_1 \) + g' \( a_2 \) = A / 6 \( a_2 - a_1 \)^2 > 0 \, $
  a contradiction. The support is unbounded because $U \( t \) asymp t$ for large $t$.
    Hence, with $l = inf "supp" nu$, it has no gaps on $\( l \, oo \)$.
    There $g = 0$, so (29) implies $U \( t \) = \( A \/ B \) t$,
    first almost everywhere and then everywhere by right continuity.
    If $l > 0$, then $g \( l \) = g' \( l \) = 0$ and $g'' \( t \) = A t$ for $0 < t < l$.
    These imply $g \( 0 \) = A l^3 \/ 3 > 0$, a contradiction.
    Thus $l = 0$ and $U \( t \) = kappa t$, where $kappa = A \/ B$.
  This cumulative function is continuous and strictly increasing.
    Local weak convergence of the rescaled measures therefore implies convergence of their inverse quantiles at
    every positive mass, and monotonicity makes this convergence locally uniform.
    The strict bounds on $A \, B$ give the bounds on $kappa$. This proves (28). ◻
]

=== 5.4 The macroscopic variational limit <the-macroscopic-variational-limit>

The preceding theorem handles scales tending to zero. For the macroscopic starting point of propagation we also
  need to identify the optimizer when the test scale stays bounded away from zero.
  We first pass an optimized interpolation to its scalar limit, then identify that limit’s minimizer.

Let $f_(upright("spin")) \( K \) = f_n \( 0 \, K \)$. Independence across sites makes this quantity independent of
  $n$. Its normalization includes the field self-correction $- K \( 1 - \) \/ 2$.
  A quantile in this subsection means a nondecreasing measurable function from $\( 0 \, 1 \)$ to $\[ 0 \, 1 \]$;
  it need not be onto or strictly increasing.

#thm([Lemma 5.7.])[
  (Macroscopic optimized interpolation).  #emph[Let $b \, h$ be bounded nonnegative nondecreasing paths,
    with $b \( u \) gt.eq b_(*) > 0$. Then
$ lim_(n arrow.r oo) f_n \( b \, h \) = min_z {f_(upright("spin")) \( h + b z \) + 1 /
  4 integral_0^1 b \( u \) z \( u \)^2 thin d u} . $

 The conclusion also holds for uniformly bounded paths $b_n \, h_n$ converging to $b \, h$ in $L^1 \( 0 \, 1 \)$,
   provided every actual path is admissible. No continuity of the limiting paths is required.]
] <prof:macro-variational>

#proof[
  Write $eta_n = n^(- 1 \/ 8)$ and $Q_n = n^(1 \/ 8)$, and first minimize over onto quantiles whose inverse
    $alpha : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ satisfies
  $ eta_n lt.eq alpha' lt.eq Q_n \, wide alpha \( 0 \) = 0 \, quad alpha \( 1 \) = 1 . $
  This is a nonempty compact class of inverse paths at fixed $n$. For $0 lt.eq t lt.eq 1$, put
  $ Phi_n \( t \) = min_z {f_n \( \( 1 - t \) b \, h + t b z \) + t / 4 integral_0^1 b z^2 thin d u} . $
  All the interpolated paths are admissible. The first identity in (1) and the envelope argument of Lemma 16 give
    local Lipschitz continuity and, at almost every $t$, the derivative formula at a minimizing path,
  $ 0 lt.eq Phi'_n \( t \) = 1 / 4 integral_0^1 b #scale(x: 120%, y: 120%)[\[] D^2 + \( S - z \)^2
    #scale(x: 120%, y: 120%)[\]] thin d u . $
  An upper bound by the right side would also suffice. All these derivatives are bounded uniformly in $n \, t$.
  For $t > 0$, first variation in the quantile has bracket $t b \( u \) \( r - S \) \/ 2$, where $r = z \( u \)$.
    The inverse-density constraints are now constant. The proof of Lemma 18 gives a potential with derivative a
    positive constant times $b \( u \) \( r - S \)$: the inverse density equals $Q_n$ on its negative components
    and $eta_n$ on its positive components. On its zero set $S = r$ almost everywhere.
    A negative component has radius width at most $Q_n^(- 1)$, since its mass is at most one.
    Its endpoint signs and monotonicity of $S$ place $S \( r \)$ between its radius endpoints.
    This also holds for an initial or final negative component, using $0 lt.eq S lt.eq
    1$ at the exterior endpoint. Consequently
  $ integral_0^1 \( S - z \)^2 thin d u lt.eq Q_n^(- 2) + eta_n . $
  Indeed the total mass on the floor is at most $eta_n$, and off the floor the pointwise error is at most $Q_n^(- 1)$.
  We give a concentration argument uniform over these minimizers for $t$ bounded away from zero.
    In radius coordinates the field clock satisfies $partial_r \( h + t b z \) gt.eq
    t b_(*)$ in the sense of measures; the matrix clock is also nondecreasing.
    The second identity in (1), with nonnegative jump contributions discarded, yields
  $ integral_0^1 bb(E) "tr" H_r^2 thin d r lt.eq frac(1, n t b_(*)) \, wide
    integral_0^1 bb(E) "tr" H_u^2 thin d u lt.eq frac(Q_n, n t b_(*)) . $
  Fix $epsilon > 0$. Since $H_u gt.eq u C_u$, the trace and Brascamp–Lieb bounds in (1) imply
  $ integral_epsilon^1 bb(E) "tr" C_u^2 thin d u lt.eq frac(Q_n, n t b_(*) epsilon^2) \, wide
    "Var" (integral_I L_u thin d u) lt.eq frac(C Q_n, n t b_(*) epsilon) $
  for every interval $I subset \[ epsilon \, 1 \]$. For the second bound use $bb(E) W_u =
    bb(E) "tr" \( H_u C_u \) lt.eq u^(- 1) bb(E) "tr" H_u^2$.
  Here are the details converting interval concentration to pointwise concentration in integrated mass.
    Partition $\[ epsilon \, 1 \]$ into at most $1 + ceil.l Delta^(- 1)
    ceil.r$ intervals on which the nondecreasing deterministic function $S$ varies by at most $Delta$,
    allowing empty intervals. Remove a strip of mass $rho$ at each end of each interval,
    and discard any interval shorter than $2 rho$. The discarded mass is at most $C rho \( 1 + Delta^(- 1) \)$.
    At a retained mass $u$, both $I_(-) = \[ u - rho \, u \]$ and $I_(+) = \[ u \, u + rho \]$ lie in the same
    interval. The martingale property of $X$ gives, for $v lt.eq u lt.eq w$,
  $ bb(E)_u L_v = frac(\| X_u \|^2, 2) - frac(\| X_u - X_v \|^2, 2) lt.eq frac(\| X_u \|^2, 2) lt.eq
    frac(bb(E)_u \| X_w \|^2, 2) = bb(E)_u L_w . $
  After averaging over $I_(-)$ and $I_(+)$ and subtracting $S_u \/ 2$,
    conditional Jensen’s inequality and the interval variance bound give
  $ parallel \| X_u \|^2 - S_u #scale(x: 120%, y: 120%)[parallel]_2 lt.eq C Delta + C /
    rho (frac(Q_n, n t b_(*) epsilon))^(1 \/ 2) . $
  On discarded masses use $0 lt.eq \| X_u \|^2 \, S_u lt.eq 1$.
    Thus, first letting $n arrow.r oo$ for fixed $t gt.eq epsilon \, Delta \, rho$,
    then $rho arrow.b 0$ and $Delta arrow.b 0$, proves
  $ sup_(t in \[ epsilon \, 1 \]) integral_epsilon^1 "Var" \( \| X_u \|^2 \) thin d u arrow.r 0 . $
  This order of limits is legitimate because every bound above is uniform over the minimizing paths and over $t
    gt.eq epsilon$. The identity
  $ D_u^2 = "Var" \( \| X_u \|^2 \) + bb(E) "tr" C_u^2 + 2 bb(E) X_u^(sans(T)) C_u X_u $
  and $bb(E) X_u^(sans(T)) C_u X_u lt.eq \( bb(E) "tr" C_u^2 \)^(1 \/ 2)$ now show that the same integrated
    convergence holds for $D^2$. Masses $u < epsilon$ and interpolation times $t <
    epsilon$ cost $O \( epsilon \)$. Sending $epsilon arrow.b
    0$ in the integrated envelope bound proves $Phi_n \( 1 \) - Phi_n \( 0 \) arrow.r 0$.
  At $t = 0$ the value is $f_n \( b \, h \)$, independently of $z$.
    At $t = 1$ it is exactly the scalar objective in the statement, restricted to the inverse-density class.
    Every probability distribution on $\[ 0 \, 1 \]$ can be approximated weakly by smooth strictly positive
    densities bounded above and below; their quantiles converge in $L^1$.
    Each such approximating density belongs to the constrained class for all sufficiently large $n$.
    Conversely, monotone quantiles form a compact set in $L^1$. The variation formula gives
  $ \| f_n \( b \, h \) - f_n \( tilde(b) \, tilde(h) \) \| lt.eq 1 / 4 parallel b - tilde(b) parallel_1 + 1 /
    2 parallel h - tilde(h) parallel_1 $
  between any two admissible pairs, uniformly in $n$; the same bound holds for $f_(upright("spin"))$.
    These continuity bounds pass both the constrained minima and the varying endpoint paths to their limits.
    They also prove attainment of the scalar minimum. ◻
]

=== 5.5 The scalar minimizer and its initial slope <the-scalar-minimizer-and-its-initial-slope>

For a quantile $q$ let $alpha$ be its distribution function,
  and let $V_alpha$ solve the scalar PDE with total time one and terminal value $log cosh z$.
  Integration of a terminal mass-one clock and the layer-cake identity give, respectively,

$ f_(upright("spin")) \( T q \) = V_alpha \( 0 \, 0 \) - T / 2 \, wide integral_0^1 q \( u \)^2 thin d u = 1 -
  2 integral_0^1 s alpha \( s \) thin d s . $

Consequently

$ f_(upright("spin")) \( T q \) + T / 4 integral_0^1 q \( u \)^2 thin d u = V_alpha \( 0 \, 0 \) - T /
  2 integral_0^1 s alpha \( s \) thin d s - T / 4 . $

Thus our scalar objective has the same minimizing distributions as the usual zero-field SK Parisi functional at
  $beta = sqrt(T)$.

#thm([Lemma 5.8.])[
  (Uniqueness and initial density).  #emph[The scalar variational problem has a unique minimizing distribution,
    denoted by $alpha_T$, and a unique quantile up to null sets, denoted by $q_T$.
    There is a constant $kappa_T > 0$ such that
$ alpha_T \( s \) = kappa_T s + o \( s \) quad \( s arrow.b 0 \) . $

 Its quantile is continuous at every mass in $\( 0 \, 1 \)$ and satisfies $c_T u lt.eq q_T \( u \) lt.eq C_T u$ there.]
] <prof:scalar-minimizer>

#proof[
  Existence follows from compactness and the continuity just proved.
    We include the uniqueness argument to specify the needed form,
    using the stochastic-control and strict-convexity method of #cite(label("AuffingerChenUniqueness2015"))
    Theorems 2–3. The scalar control representation is
  $ V_alpha \( 0 \, 0 \) =
    sup_(\| m \| lt.eq 1) bb(E)
    [log cosh (sqrt(T) B_1 + T integral_0^1 alpha \( s \) m_s thin d s) - T / 2 integral_0^1 alpha \( s \) m_s^2
    thin d s] \, $
  where controls are progressively measurable. To verify it,
    apply Itô’s formula to $V_alpha \( t \, Z_t \)$ for $d Z_t = T alpha \( t \) m_t thin d t +
    sqrt(T) thin d B_t$. The resulting difference between the initial PDE value and the displayed payoff is $T /
    2 bb(E) integral alpha \( t \) \( m_t - V_(alpha \, z) \( t \, Z_t \) \)^2 thin d t$.
    It vanishes for the bounded feedback control $m_t = V_(alpha \, z) \( t \, Z_t \)$.
  Suppose $alpha_1$ and $alpha_2$ differ on a set of positive Lebesgue measure.
    Use the optimal control $m$ for their midpoint $macron(alpha)$ in all three functionals.
    For this control, $m_0 = 0$ by symmetry and
  $ d m_t = sqrt(T) thin V_(macron(alpha) \, z z) \( t \, Z_t \) thin d B_t \, wide
    V_(macron(alpha) \, z z) \( t \, Z_t \) > 0 . $
  With $a = alpha_1 - alpha_2$, stochastic Fubini gives
  $ integral_0^1 a \( t \) m_t thin d t = sqrt(T) integral_0^1 (integral_s^1 a \( t \) thin d t)
    V_(macron(alpha) \, z z) \( s \, Z_s \) thin d B_s . $
  Its second moment is strictly positive by Itô isometry: a vanishing continuous primitive would imply $a =
    0$ almost everywhere. Consequently the terminal arguments for $alpha_1$ and $alpha_2$ differ with positive
    probability. Strict convexity of $log cosh$ makes the midpoint payoff strictly smaller than the average of the
    two payoffs for this control, which are bounded by the corresponding optimal values.
    The integral penalty in the Parisi functional is linear in $alpha$.
    Strict convexity of the full functional therefore proves uniqueness.
    Distribution functions equal almost everywhere describe the same probability measure on $\[ 0 \, 1 \]$.
  Lopatto’s support theorem #cite(label("Lopatto2026")) Theorem 1.1 states that, at zero field and $T =
    beta^2 > 1$, the minimizing measure has support $\[ 0 \, q_beta \]$ with $q_beta > 0$, no atom at zero,
    and a smooth density near zero. Its scalar martingale satisfies $hat(Gamma) \( s \) =
    s$ on that support by #cite(label("Lopatto2026")) Lemma 2.2, equation (2.3).
    We now compute the initial density and prove its positivity.
    Since $hat(Gamma)'' \( s \) = 0$ for $0 < s < q_beta$, Lemma 41 gives, for sufficiently small positive $s$,
  $ alpha_T \( s \) = frac(bb(E) V_(z z z) \( s \, Z_s \)^2, 2 bb(E) V_(z z) \( s \, Z_s \)^3) . $
  Since $alpha_T \( s \) arrow.r 0$, the diffusion has $bb(E) Z_s^2 = T s +
    o \( s \)$ and moments of order $2 j$ of order $s^j$. Oddness, the uniform spatial derivative bounds,
    and bounded time derivatives imply
  $ bb(E) V_(z z z) \( s \, Z_s \)^2 = T V_(z z z z) \( 0 \, 0 \)^2 s + o \( s \) \, wide
    bb(E) V_(z z) \( s \, Z_s \)^3 arrow.r V_(z z) \( 0 \, 0 \)^3 . $
  The strict bounds in Lemma 41 yield
  $ kappa_T = frac(T V_(z z z z) \( 0 \, 0 \)^2, 2 V_(z z) \( 0 \, 0 \)^3) > 0 . $
  Thus $q_T \( u \) tilde.op u \/ kappa_T$ at zero. Full interval support makes the distribution strictly
    increasing on its support and hence makes the quantile continuous on $\( 0 \, 1 \)$,
    even if the measure has atoms. Away from zero, monotonicity, positivity, and $q_T lt.eq
    1$ extend the two-sided comparison with $u$ to the entire open mass interval. ◻
]

#thm([Proposition 5.9.])[
  (Rigidity at macroscopic scales).  #emph[Consider minimizers in (6) satisfying the endpoint and constraint
    hypotheses (3)–(5). Suppose $x gt.eq c > 0$, $e \( x \) \/ x^2 gt.eq c > 0$, and $d^2 lt.eq T -
    c$ along the sequence. Then
$ r_n arrow.r q_T quad upright("in ") L^1 \( 0 \, 1 \) quad upright("and locally uniformly on ") \( 0 \, 1 \) . $

 An omitted mass $u_0 = o \( a \)$ and its specified admissible changed paths are allowed,
   provided the changed paths of the minimizing sequence and the smooth competitors used in the proof are
   admissible. In particular all macroscopic quantile limits are bounded above and below by fixed positive
   multiples of mass.]
] <prof:macro-profile>

#proof[
  Pass to a subsequence on which $lambda_n \, d_n$ converge.
    The assumed positive strength bounds force both limiting parameters to be positive.
    Consequently $e_n$ converges uniformly on $\[ 0 \, 1 \]$ to a continuous strictly positive function $e$,
    with $T - e gt.eq c$. The endpoint hypothesis (4) implies $b_0 arrow.r T$ and $h_0 arrow.r
    0$ in $L^1$ on the working masses. Indeed $a = O \( 1 \)$,
    so each fixed positive mass satisfies $a lt.tilde u$ with a fixed constant;
    boundedness then gives dominated convergence. The omitted mass tends to zero and cannot affect these limits.
  The constraints approximate every limiting quantile: their floor is at most $n^(- 3 delta)$ and their cap is at
    least $n^delta$. First approximate a desired distribution by a fixed smooth density bounded above and below;
    its slight affine adjustment to the endpoints $\( r_min \, u_0 \)$ satisfies the constraints for all
    sufficiently large $n$. Here $r_min arrow.r 0$ by (5). The same construction supplies competitors on the
    working interval. All changed paths used by the optimization and these competitors are admissible by hypothesis.
  Extract an $L^1$ limit $r$ of the minimizing quantiles. The uniform pressure continuity bound in Lemma 45 and
    that lemma’s variational limit, applied to the actual changed paths,
    identify the limiting minimization as the joint minimum in quantiles $r \, z$ of
  $ f_(upright("spin")) #scale(x: 120%, y: 120%)[\(] e \( r \) r + \( T - e \( r \) \) z
    #scale(x: 120%, y: 120%)[\)] + 1 / 4 integral_0^1 #scale(x: 120%, y: 120%)[\[] e \( r \)
    r^2 + \( T - e \( r \) \) z^2 #scale(x: 120%, y: 120%)[\]] thin d u . $
  This reasoning applies both to the selected minimizing sequence and to every approximating competitor,
    so it identifies a minimum and its minimizers, not just an upper bound.
    It never evaluates a possibly inadmissible bare endpoint.
  Set
  $ q = frac(e \( r \) r + \( T - e \( r \) \) z, T) . $
  This is a $\[ 0 \, 1 \]$-valued quantile: $r e \( r \)$ is nondecreasing, $T -
    e \( r \)$ is nonnegative and nondecreasing, and $z$ is nonnegative and nondecreasing. Completing the square gives
  $ e \( r \) r^2 + \( T - e \( r \) \) z^2 = T q^2 + frac(e \( r \) \( T - e \( r \) \), T) \( r - z \)^2 . $
  The joint objective is therefore at least the ordinary scalar minimum. Equality is attained by $r = z = q_T$.
    The coefficient of $\( r - z \)^2$ is bounded below positively, so every minimizing pair has $r = z =
    q$ almost everywhere. Lemma 46 forces this quantile to be $q_T$.
  Every subsequential limit is thus $q_T$, proving $L^1$ convergence of the full sequence.
    Its continuity at each interior mass and monotonicity of the approximating quantiles give local uniform
    convergence. The artificial endpoint condition $r_n \( 1 \) =
    1$ is irrelevant for this conclusion on the open mass interval. ◻
]

== 6 Propagation of regularity and the comparison error <sec:regularity>

We now remove the outer regularity hypothesis from the short comparisons.
  Throughout this section, $T > 1$ and a sufficiently small $m > 0$ are fixed, and $delta = m \/ 10000$.
  All limits are taken as $n arrow.r oo$ with these parameters fixed.
  Constants may depend on $T \, m$, on fixed bounds for the total covariance clocks,
  and on the finite recursion depth specified below. No assertion in this section is uniform for a varying choice
  $m = m \( n \)$.

The two inputs are profile rigidity and the conditional comparison error.
  Under the data conditions (3)–(5), an optimizer with an outer regular region above a small scale $x$ satisfies
  the direct profile conclusion of 39, provided

$ x gt.tilde a \, wide e \( x \) x^2 gt.tilde n E^2 \, wide e \( x \) gt.tilde x^2 . $

At macroscopic scales the corresponding conclusion is 47.
  The possible slopes in the small scale limit (28) have fixed positive upper and lower bounds;
  the macroscopic limiting quantile has the same kind of bounds relative to mass.
  These bounds depend only on $T$ and the uniform total clock bounds.
  Proposition 25 bounds the upper derivative per unit $log lambda$ in Lemma 16 by $n^(10 delta) E$ for $lambda
  gt.eq n^(- 10)$ if the optimizer has an outer regular region above

$ A \( lambda \) = n^delta frac(sqrt(n) E, sqrt(lambda)) . $

If $A \( lambda \)$ is bounded below by a positive constant,
  that error bound does not require a profile hypothesis. The omitted initial interval is allowed in each of these
  statements.

The propagation follows a hypothetical failure. At a selected bad parent scale the parent has a regular outer
  region. Sufficient local strength is excluded by a direct profile test.
  In the remaining case, a successful child error estimate would give agreement with the parent.
  When $x arrow.r 0$, this supplies the child’s outer regularity for the direct profile test;
  when $x$ stays bounded below, the macroscopic direct result applies.
  In either case the child profile transfers back and contradicts the parent failure.
  Thus the child error must fail; that failure selects a strength and minimizer with a new bad profile.
  The construction below raises $E$ by at least $n^(delta \/ 4)$ at each stage,
  while the data confine $E_j$ between fixed stage-dependent multiples of $n^(- 5 \/ 6 + 2 m)$ and $n^(- 1 \/ 2)$.
  A depth fixed before $n arrow.r oo$ therefore suffices. The earlier finite-degree recursion of Lemma 37 has
  already been completed.

=== 6.1 Admissible families and child data <admissible-families-and-child-data>

#prodef([Definition 6.1.])[
  (Admissible comparison families).  The working mass interval is $I = \[ u_0 \, 1 \]$, where either $u_0 =
    0$ or $u_0 = o \( a \)$. For a feasible quantile $r$ satisfying (5), write
  $ P_r = #scale(x: 120%, y: 120%)[\(] b_0 - e \( r \) upright(bold(1))_I \, h_0 +
    e \( r \) r upright(bold(1))_I #scale(x: 120%, y: 120%)[\)] \, wide cal(P)_e \( r \) = 1 /
    4 integral_I e \( r \) r^2 thin d u . $
  An ordinary comparison family has an admissible bare endpoint $\( b_0 \, h_0 \)$ and admissible changed paths
    $P_r$ for every feasible $r$ and $0 lt.eq lambda lt.eq d^2$.
    Its minimized value is $cal(V) \( lambda \) = min_r { f_n \( P_r \) + cal(P)_e \( r \) }$.
    A fixed strength family requires admissibility of every $P_r$ only at the indicated positive strength.
    Its bare coefficients need not themselves define an admissible covariance path.
    Adding a term independent of $r$ does not change the minimizers or the profile conclusions.
    The notation $cal(V) \( lambda \)$ always denotes the displayed value without such an added term;
    all error bounds and strength derivatives refer to this value.
    Thus a term that depends on $lambda$ must be subtracted at each strength before those bounds are applied.
    We require $d^2 lt.eq T - rho$ for some fixed $rho in \( 0 \, T \)$.
    The child coefficient $c_0$ introduced below is always chosen with $c_0^2 lt.eq T - rho$,
    so this hypothesis persists in descendants.
  The recursive comparisons below obey one of two covariance conditions.
    Either they act on all masses with a fixed positive lower bound on the bare matrix covariance,
    or they act only on $I$, with a fixed positive matrix covariance on $I$ and a fixed positive matrix gap at
    $u_0$. A high-only family may be followed by all-mass families when the already changed endpoint has a fixed
    positive matrix lower bound. Once that change is made, all later descendants act on all masses.
    High-only descendants have lower quantile endpoint zero. Only the initial family may require a positive wall
    $r_min$ as in (5). At the initial stage the selected covariance alternative must have a fixed margin after the
    initial comparison as well. For example, an all-mass bare matrix lower bound $T \/ 2$ and $d^2 lt.eq
    T \/ 4$ give such a margin. In the high-only case the analogous requirement is a fixed residual high
    covariance and high-to-low gap. Alternatively, a fixed global lower bound after the initial high-only
    comparison allows the immediate change to all-mass descendants.
] <reg:families>

The fixed positive bounds in this definition concern the initial available covariance.
  We will spend less than half of each such bound along the entire finite chain.
  Since $e$ is decreasing and $r e \( r \)$ is increasing, a comparison preserves monotonicity inside its working
  interval. The lower bound or the gap pays for matrix nonnegativity and the matrix jump at its left endpoint.
  A high-only descendant adds zero field at that endpoint, so it preserves the field boundary inequality already
  present in its bare endpoint.

#thm([Lemma 6.2.])[
  (Data for a child comparison).  #emph[Suppose a parent comparison has data (3)–(5) and an optimizing quantile
    with an outer regular region above $x$, where
$ A \( lambda \) lt.eq x lt.eq 1 \, wide e \( x \) = o \( x^2 \) . $

 Fix $c_0 > 0$, independent of $n$, and set
$ d' = c_0 x \, wide E' = min { n^(- 1 \/ 2) d' ""^2 \, n^(- 100 delta) e \( x \) x^3
  #scale(x: 120%, y: 120%)[}] \, wide a' = frac(sqrt(n) E', d') . $

 Then, for all sufficiently large $n$, the child data satisfy (3), with the same $m$, and
$ E' gt.eq n^(delta \/ 4) E \, wide a' gt.eq a . $

 The changed parent path, used as the child’s bare endpoint, satisfies (4) at all its required test scales.
   An omitted mass interval of length $u_0 = o \( a \)$ remains $o \( a' \)$.]
] <reg:child-data>

The two upper bounds defining $E'$ serve different purposes.
  The ceiling $n^(- 1 \/ 2) d' ""^2$ keeps the child in the parameter range (3).
  The other bound makes a successful child error negligible compared with the cost $e \( x \)
  x^3$ of a parent–child separation. The proof shows that both bounds still permit $E'$ to be larger than $E$ by a
  fixed power of $n$.

#proof[
  The data conditions imply, with fixed implicit constants,
  $ d gt.eq a gt.tilde n^(- 1 \/ 6 + m) \, wide E gt.tilde n^(- 5 \/ 6 + 2 m) \, wide n E a gt.tilde n^(3 m) . $
  The strength profile obeys $e \( t \) gt.tilde min \( lambda \, d^3 \/ t \)$, while $t e \( t \)$ is increasing.
    Since $x gt.eq A \( lambda \)$ and $sqrt(lambda) sqrt(n) E lt.eq d^3$,
  $ x gt.eq n^delta a \, wide e \( x \) x^2 gt.tilde min \( lambda x^2 \, d^3 x \) gt.tilde n^(1 + delta) E^2 . $
  These estimates are valid whether $x$ tends to zero or is macroscopic.
  Put $E'_(upright(c)) = n^(- 1 \/ 2) c_0^2 x^2$ and $E'_(upright(s)) = n^(- 100 delta) e \( x \) x^3$.
    For the lower bound in (3), separately for the two candidate values, we have
  $ frac(E'_(upright(c)), n^(- 2 \/ 3 + m) d') = c_0 n^(1 \/ 6 - m) x gt.tilde c_0 n^delta \, wide
    frac(E'_(upright(s)), n^(- 2 \/ 3 + m) d') gt.tilde c_0^(- 1) n^(3 m - 99 delta) . $
  Both tend to infinity; the required upper bound holds by definition. The same calculation gives
  $ E'_(upright(s)) / E gt.tilde n^(1 - 99 delta) E x gt.tilde n^(3 m - 99 delta) . $
  Because $e \( x \) = o \( x^2 \)$, the preceding lower bound on $e \( x \)
    x^2$ also gives $x^4 \/ \( n^(1 + delta) E^2 \) arrow.r oo$. Consequently
  $ E'_(upright(c)) / E = c_0^2 frac(x^2, sqrt(n) E) gt.double n^(delta \/ 2) . $
  Taking the smaller candidate proves $E' \/ E gt.eq n^(delta \/ 4)$ eventually.
    In the ceiling case $a' = c_0 x gt.eq a$ eventually. In the other case,
  $ a' / a = c_0^(- 1) n^(- 100 delta) frac(e \( x \) x^2 d, E) gt.tilde c_0^(- 1) n^(1 - 99 delta) E d gt.tilde
    n^(3 m - 99 delta) \, $
  which proves the asserted cutoff inheritance.
  It remains to check the actual covariance perturbations in (4).
    The parent outer bound and monotonicity give $r \( u \) = O \( y \)$ when $u asymp y gt.tilde x$,
    and $r \( u \) = O \( x \)$ when $u = O \( x \)$. Also $e \( 0 \) = o \( x^2 \)$.
    Indeed, along any subsequence on which $d \/ x arrow.r 0$ this follows from $e \( 0 \) lt.eq d^2$;
    if $d \/ x$ stays bounded below, the argument $lambda x \/ d^3 lt.eq x \/ d$ of $f$ stays bounded,
    so $e \( 0 \) asymp e \( x \) = o \( x^2 \)$. Thus at every scale $y gt.tilde
    x$ the new matrix change is $o \( y^2 \)$ and the new field change is $o \( y^3 \)$.
  Consider now a test sequence $a' lt.tilde y lt.double x$. This can only occur in the nonceiling case. Here
  $ frac(a' ""^3, e \( x \) x) = c_0^(- 3) n^(3 \/ 2 - 300 delta) e \( x \)^2 x^5 gt.tilde n^(7 \/ 2 - 300 delta)
    E^4 x gt.tilde n^(9 m - 300 delta) . $
  In particular the ratio has a polynomial divergence. If $lambda x \/ d^3$ stays bounded,
    $e \( 0 \) asymp e \( x \)$ and, for $r lt.eq C x$,
  $ e \( r \) lt.eq O \( e \( x \) \) = o \( a' ""^2 \) \, wide r e \( r \) lt.eq O \( e \( x \) x \) =
    o \( a' ""^3 \) . $
  The first conclusion uses also $a' lt.eq d' = c_0 x$. Otherwise $e \( x \) x gt.tilde d^3$,
    and the global profile bounds give
  $ e \( r \) lt.eq d^2 = o \( a' ""^2 \) \, wide r e \( r \) lt.tilde d^3 log n = o \( a' ""^3 \) . $
  The polynomial divergence absorbs the logarithm. These two subsequence alternatives prove the required little-oh
    estimates at every $y gt.tilde a'$. The old bare endpoint already satisfies (4) there, since $a' gt.eq a$.
    The omitted interval assertion is immediate. The same reasoning applies after a change from high-only to
    all-mass comparisons: positive comparable test masses at the new cutoff still lie above the original omitted
    interval. ◻
]

=== 6.2 Admissible movement and successful children <admissible-movement-and-successful-children>

To compare the parent minimizer with the child’s, we move the parent only part of the way toward the child.
  The next lemma measures the gain from any feasible such movement.
  The barrier construction then produces a movement without violating the quantile constraints.

#thm([Lemma 6.3.])[
  (Movement using admissible paths).  #emph[Let $r$ minimize the parent objective at a fixed positive strength,
    and let a child comparison act on $J supset.eq I$. Denote its final profile by
$ cal(D) \( z \) = d' ""^2 f \( z \/ d' \) \, $

 and its final minimizing quantile by $z$. Suppose its error bound is successful, so the admissible doubly changed path
$ Q = #scale(x: 120%, y: 120%)[\(] P_(r \, b) - cal(D) \( z \) upright(bold(1))_J \, P_(r \, h) +
  cal(D) \( z \) z upright(bold(1))_J #scale(x: 120%, y: 120%)[\)] $

 satisfies
$ f_n \( Q \) + 1 / 4 integral_J cal(D) \( z \) z^2 thin d u lt.eq f_n \( P_r \) + upright("err") . $

 Let $hat(r)$ be a feasible parent trial, equal to $r$ outside the common working region,
   and suppose at every moved point
$ hat(r) = r + omega \( z - r \) \, wide 0 lt.eq omega < frac(cal(D) \( z \), e \( r \) + cal(D) \( z \)) . $

 If its changed path $P_(hat(r))$ is admissible, then
$ integral_I e \( r \) omega \( z - r \)^2 thin d u lt.eq 4 thin upright("err") . $

 This conclusion does not require an admissible bare parent endpoint or a parent error bound.]
] <reg:admissible-movement>

#proof[
  Write $e = e \( r \)$, $hat(e) = e \( hat(r) \)$ and $D = cal(D) \( z \)$ in this proof only, and set
  $ a = e upright(bold(1))_I + D upright(bold(1))_J - hat(e) upright(bold(1))_I \, wide c =
    e r upright(bold(1))_I + D z upright(bold(1))_J - hat(e) hat(r) upright(bold(1))_I . $
  At a moved point the log-slope bound $0 lt.eq - r e' \/ e lt.eq 1$ implies $hat(e) lt.eq e \/ \( 1 - omega \)$.
    This follows from monotonicity when $hat(r) gt.eq r$, and otherwise from $hat(r) gt.eq \( 1 - omega \)
    r$ and the monotonicity of $t e \( t \)$. Hence $a > 0$ there.
    At unmoved points of $J$, $a = D$ and $c = D z$; outside $J$, $a = c = 0$.
  The ratio needed below is integrable even if $a$ approaches zero.
    Indeed put $A = e + D$, $mu = D \/ A$, and $Delta = z - r$ at a moved point. The preceding bound gives
  $ a gt.eq frac(A \( mu - omega \), 1 - omega) \, wide c / a = r + (omega + frac(A \( mu - omega \), a)) Delta . $
  The coefficient of $Delta$ lies in $\[ omega \, 1 \]$, so $c \/ a$ lies between $hat(r)$ and $z$,
    both in $\[ 0 \, 1 \]$. Thus $c^2 \/ a lt.eq a lt.eq e + D$.
    At unmoved points of $J$ the ratio is $D z^2$, and outside $J$ it is zero.
    These bounds also cover radius zero and require no uniform lower bound on $a$.
  The convex segment from $Q$ to $P_(hat(r))$ consists of admissible covariance paths.
    Its pointwise variation is $\( a \, - c \)$; the variation itself need not be monotone.
    By (1) and $B gt.eq S^2$, at every point of that segment,
  $ - a / 4 B + c / 2 S lt.eq frac(c^2, 4 a) . $
  With the ratio interpreted as zero when $a = c = 0$, integration gives
  $ f_n \( P_(hat(r)) \) lt.eq f_n \( Q \) + 1 / 4 integral c^2 / a thin d u . $
  Combining this with parent minimality and the displayed child bound proves
  $ integral [e r^2 upright(bold(1))_I + D z^2 upright(bold(1))_J - hat(e) hat(r)^2 upright(bold(1))_I - c^2 / a]
    d u lt.eq 4 thin upright("err") . $
  Any fixed low-group penalty has canceled. At every unmoved point of $J$ the integrand is zero,
    including points below $u_0$ when $J = \[ 0 \, 1 \]$. At a moved point its value is
  $ {frac(e D, e + D) - frac(hat(e) \( e + D \), e + D - hat(e)) (omega - frac(D, e + D))^2} \( r - z \)^2 . $
  The expression in braces decreases as $hat(e)$ increases.
    Substitution of its upper bound $e \/ \( 1 - omega \)$ reduces it exactly to $e omega$, proving the assertion.
    Only the three admissible paths $P_r \, Q \, P_(hat(r))$ have been evaluated. ◻
]

#thm([Lemma 6.4.])[
  (Feasible barriers).  #emph[In the setting of Lemma 49, let $y gt.tilde x$.
    Suppose, on an interval of mass length comparable to $y$ at masses comparable to $y$,
    the parent and child quantiles are separated by two fixed thresholds whose distance is comparable to $y$.
    Assume $r lt.eq C y$ there, but impose no upper bound on $z \/ y$.
    There is a feasible parent movement as in Lemma 50 for which
$ integral e \( r \) omega \( z - r \)^2 thin d u gt.eq c min { e \( y \) \, cal(D) \( y \) } y^3 . $

 Constants may depend on the separation thresholds and on the fixed comparability constants.]
] <reg:barriers>

#proof[
  In forward coordinates the constraints (5) read
  $ l \( u \) lt.eq r' \( u \) lt.eq frac(1, k \( r \( u \) \)) \, wide l \( u \) = frac(1, M \( u \)) . $
  Their forced lengths satisfy
  $ integral_(u_0)^1 l \( u \) thin d u lt.eq n^(- delta) L log frac(1 + u_(*), u_0 + u_(*)) = o \( x \) \, wide
    integral_0^1 k \( t \) thin d t lt.eq n^(- delta) u_(*) = o \( x \) . $
  Also $l lt.eq n^(- delta)$, $k lt.eq n^(- 3 delta)$, and $r_min lt.eq n^(- delta) u_(*) = o \( x \)$.
    The estimates follow directly from (5) and $u_(*) \/ a lt.tilde n^(- 3 m)$.
    We may shorten the separation interval by a fixed proportion to leave room for ramps and strict threshold
    inequalities. Put
  $ t_y = min { 1 \, cal(D) \( y \) \/ e \( y \) } . $
  First suppose $z$ is above the upper threshold and $r$ below the lower threshold.
    Starting from $r_min$, construct a barrier $w$ with slope $l$ until an early portion of the separation
    interval. On that portion give it a fixed sufficiently large slope to reach an intermediate threshold,
    and thereafter slope $l$ again. The ramp needs only a fixed small fraction of the interval,
    since its rise is $O \( y \)$. Its fixed slope is eventually less than $n^(3 delta)$ and greater than $l$.
    The $o \( x \)$ total forced rise leaves $w < 1$ and keeps a fixed distance of order $y$ between $w$ and $z$
    wherever $w > r$. Before the ramp the minimum slope condition gives $w lt.eq r$; after it,
    monotonicity of $z$ preserves the separation. Outer regularity shows that clipping can occur only at masses
    $O \( y \)$.
  Let $v = max \( r \, w \)$ and set $hat(r) = \( 1 - t \) r + t v$, where $t =
    eta t_y$ and $eta > 0$ is a sufficiently small fixed constant. Both endpoints of the quantile are unchanged.
    The lower slope bound is preserved. Where clipping occurs, $v' = w' lt.eq n^(3 delta) lt.eq 1 \/ k \( r \)$; hence
  $ hat(r)' lt.eq frac(1, k \( r \)) lt.eq frac(1, k \( hat(r) \)) . $
  Thus the upper bound is preserved as well.
  We verify the movement fraction even if $z \/ y$ is unbounded.
    At clipped points $r < w lt.eq C_1 y$ and $z - w gt.eq c_1 y$, so $z - r gt.eq c_2 z$.
    Monotonicity of $t cal(D) \( t \)$ and the fixed-scale bounds for $cal(D)$ give
  $ cal(D) \( z \) \( z - r \) gt.eq c_3 y cal(D) \( y \) \, wide cal(D) \( z \) lt.eq C_2 cal(D) \( y \) . $
  If $y \/ x arrow.r oo$, outer regularity gives $r asymp y$ at the clipped masses, and $e \( r \) lt.eq
    C_3 e \( y \)$. Therefore the largest allowed absolute displacement is bounded below by
  $ frac(cal(D) \( z \) \( z - r \), cal(D) \( z \) + e \( r \)) gt.eq c_4 y t_y . $
  If instead $y asymp x$, then $e \( r \) lt.eq e \( 0 \) = o \( x^2 \)$ and $cal(D) \( y \) asymp x^2$.
    The same bound holds, with $t_y = 1$ eventually, without a lower bound on $r \/ y$.
    Every sequence has a subsequence in one of these two cases.
    Choosing $eta$ small makes the movement strictly admissible.
    On a remaining interval of length $c y$, both $v - r$ and $z - r$ are at least $c y$, and $e \( r \) gt.eq
    c e \( y \)$. Since $omega \( z - r \) = hat(r) - r = t \( v - r \)$,
    the gain there is at least $c e \( y \) t_y y^3$.
  For a downward separation, start an upper barrier $w$ at an intermediate positive threshold plus the accumulated
    slope $l$. Keep that slope until a late portion of the separation interval.
    There let $w' = 1 \/ k \( w \)$ until $w$ meets
  $ U \( u \) = 1 - integral_u^1 l \( v \) thin d v \, $
  and follow $U$ thereafter. Every feasible $r$ satisfies $r lt.eq U$. The ramp takes $o \( x \)$ mass:
    while $w < U$, the speed of $U$ is at most $n^(- delta)$ and that of $w$ is at least $n^(3 delta)$,
    so its length is bounded by twice $integral_0^1 k = o \( x \)$ for large $n$.
    Place this entire ramp inside the reserved late portion of the separation interval; its length is $o \( x \) =
    o \( y \)$, so it fits there. Where $v = min \( r \, w \)$ differs from $r$,
    both $v$ and $r$ lie in $\[ c y \, C y \]$, while $z$ is a fixed distance below $v$.
    The assertion before the separation interval follows from monotonicity of $z$;
    the barrier is no longer active after its ramp. It agrees with $r$ at the two endpoints, because $r_min =
    o \( x \)$ and $r lt.eq U$.
  Set $psi \( q \) = integral_0^q k \( t \) thin d t$ and now interpolate by
  $ psi \( hat(r) \) = \( 1 - t \) psi \( r \) + t psi \( v \) \, wide t = eta t_y . $
  Both $r$ and $v$ satisfy the two slope bounds. Therefore
  $ k \( hat(r) \) hat(r)' = \( 1 - t \) k \( r \) r' + t k \( v \) v' lt.eq 1 . $
  For the other bound write $k \( q \) = A_0 \/ \( q + B_0 \)^2$, with $A_0 = n^delta u_(*)^2$ and $B_0 =
    n^(2 delta) u_(*)$. Then
  $ k #scale(x: 120%, y: 120%)[\(] psi^(- 1) \( s \) #scale(x: 120%, y: 120%)[\)] = 1 / A_0 (A_0 / B_0 - s)^2 $
  is convex. Jensen’s inequality gives
  $ k \( hat(r) \) hat(r)' gt.eq l { \( 1 - t \) k \( r \) + t k \( v \) } gt.eq l k \( hat(r) \) . $
  This proves feasibility. On the clipping region the radii are comparable to $y$,
    so the distortion between the interpolation fraction in $psi$ and the fraction in radius is bounded above and
    below by fixed constants. Here $e \( r \) asymp e \( y \)$ and $cal(D) \( z \) gt.tilde cal(D) \( y \)$,
    since $z lt.eq C y$. Taking $eta$ smaller if necessary gives the required strict movement fraction.
    On an interval of length $c y$, the radius displacement is at least $c t_y y$, and $r - z gt.eq c y$.
    The same gain bound follows.
  Both constructions preserve the parent’s lower wall. Hence their changed paths are admissible in every family of
    Definition 48. All moved masses lie above both lower working boundaries, since $u_0 = o \( a \) lt.eq o \( x \)$. ◻
]

#thm([Lemma 6.5.])[
  (A successful child error excludes a parent failure).  #emph[In Lemma 49,
    suppose the child’s final error is at most $n^(20 delta) E'$.
    If $x arrow.r 0$, every sequence has a subsequence on which the parent quantile satisfies (28),
    with the bounds on $kappa$ stated there. If $x$ stays bounded below by a positive constant,
    it converges locally uniformly on $\( 0 \, 1 \)$ to the Parisi quantile $q_T$.]
] <reg:successful-child>

#proof[
  First, on every test scale $y gt.tilde x$, the parent and final child quantiles agree to $o \( y \)$ in
    normalized mass measure on compact positive mass bands of scale $y$.
    At macroscopic scales take bands inside $\( 0 \, 1 \)$. If this failed,
    monotone subsequence compactness (truncating $z \/ y$ first if necessary) would produce an interval of length
    comparable to $y$ on which the quantiles are separated by fixed thresholds of distance comparable to $y$.
    The parent outer bound and monotonicity give $r lt.eq C y$ there. Thus Lemmas 50 and 51 imply
  $ c min { e \( y \) \, cal(D) \( y \) } y^3 lt.eq 4 n^(20 delta) E' . $
  Both radius times strength profiles are increasing. Moreover $cal(D) \( x \) =
    c_0^2 f \( 1 \/ c_0 \) x^2 asymp x^2$ and $e \( x \) = o \( x^2 \)$. Consequently, for every $y gt.tilde x$,
  $ min { e \( y \) \, cal(D) \( y \) } y^3 gt.tilde e \( x \) x^3 \, wide n^(20 delta) E' lt.eq
    n^(- 80 delta) e \( x \) x^3 \, $
  a contradiction. For $y \/ x$ bounded below by a fixed number smaller than one,
    the same inequalities follow from the fixed-scale profile bounds;
    thus the conclusion includes any fixed positive multiple of $x$.
  The child’s numerical direct-test conditions now hold at $x$:
  $ a' lt.eq c_0 x \, wide n E' ""^2 lt.eq c_0^4 x^4 lt.tilde cal(D) \( x \) x^2 \, wide cal(D) \( x \) asymp x^2 . $
  Its changed paths and feasible competitors are admissible, and $d' ""^2 lt.eq T - rho$ by Definition 48.
  Suppose $x arrow.r 0$. This agreement gives the child a regular outer region above $x$, with fixed,
    possibly enlarged constants. Indeed, a violation at masses whose ratio to $x$ tends to infinity gives,
    by monotonicity and a neighboring interval of comparable masses,
    a threshold separation from the parent’s regular outer profile.
    A violation at bounded multiples is included by enlarging the lower cutoff of that outer region.
    39 therefore applies to the child, giving (28). Agreement in measure and monotonicity transfer this limit to
    the parent at every positive scaled mass: bracket a point by nearby continuity points of the strictly
    increasing linear limit and then shrink the bracket. If $x$ stays bounded below,
    apply 47 to the child instead and use the same agreement.
    Near mass one, fixed loose comparison bounds follow from monotonicity and $r lt.eq 1$. This proves the assertion. ◻
]

=== 6.3 Finite propagation and the field wall <finite-propagation-and-the-field-wall>

#thm([Proposition 6.6.])[
  (Finite propagation).  #emph[For every sequence of comparison families in Definition 48 with data (3)–(5),
    there are fixed positive constants $c < C$ such that every minimizing quantile at a positive strength $0 <
    lambda lt.eq d^2$ satisfies
$ c u lt.eq r \( u \) lt.eq C u wide (n^delta frac(sqrt(n) E, sqrt(lambda)) lt.eq u lt.eq 1) $

 for all sufficiently large $n$ along that sequence. For ordinary admissible bare endpoints,
   the entire comparison satisfies
$ 0 lt.eq cal(V) \( lambda \) - f_n \( b_0 \, h_0 \) lt.eq n^(20 delta) E \, wide 0 lt.eq lambda lt.eq d^2 . $

 For a fixed strength family only the profile assertion is made;
   its proof uses error estimates exclusively for admissible child endpoints.]
] <reg:finite-propagation>

#proof[
  #emph[Fix the bounds and recursion depth.] Enlarge the initial total-clock bounds by one to allow for descendant
    field additions. Use these enlarged bounds when choosing the constants in the limiting profiles.
    Choose $c \, C$ strictly outside the bounds of all the limiting profiles described at the start of this
    section, with additional room near mass one. Fix
  $ N = ⌈10 / delta⌉ . $
  Before taking $n arrow.r oo$, choose $c_0 > 0$ small enough that $N c_0^2 < 1$ and $N
    c_0^2$ is less than half each initial fixed residual matrix lower bound or gap.
    It may also be decreased to meet the fixed bounds needed in the direct tests, including $c_0^2 lt.eq T - rho$.
    Every child has $d' = c_0 x lt.eq c_0$, and hence $d' ""^2 lt.eq T - rho$.
    The sum of all further matrix removals along a chain of length $N$ is therefore at most $N c_0^2$.
    All field additions are increasing and have total size at most $N c_0^2$.
    Thus the total clock bounds and the covariance alternatives of Definition 48 persist along this chain.
    In particular every child endpoint, every feasible child path, and every segment used in Lemma 50 are admissible.
  #emph[A failed parent profile forces a failed child error.] Assume first that the profile assertion fails along
    a sequence. At its selected strength choose an offending mass $x gt.eq
    A \( lambda \)$ within a factor two of the supremum of all offending masses.
    There are no offending masses above $2 x$, so the path has a regular outer region above $x$.
    The numerical direct-test conditions $x gt.tilde a$ and $e \( x \) x^2 gt.tilde n E^2$ follow from (8).
    If $e \( x \) \/ x^2$ has a positive lower bound along a subsequence, Theorem 39 or Proposition 47,
    according to the scale, immediately contradicts the choice of the loose constants $c \, C$.
    After subselection the only remaining case is $e \( x \) \/ x^2 arrow.r 0$.
    Lemma 49 constructs a child from the changed parent endpoint.
    If its error estimate were successful, Lemma 52 would again contradict the parent violation.
    Hence a profile failure forces a child error failure.
  #emph[A failed error selects the next profile failure.] Every such child has an admissible bare endpoint.
    If all its minimizers at all relevant strengths had the asserted profile,
    Proposition 25 and the optimized envelope of Lemma 16 would give
  $ cal(V) \( d' ""^2 \) - f_n \( b'_0 \, h'_0 \) lt.eq O \( log n \) n^(10 delta) E' +
    O \( n^(- 10) \) < n^(20 delta) E' $
  eventually. Strengths below $n^(- 10)$ contribute $O \( n^(- 10) \)$ by bounded overlaps;
    when $A \( lambda \)$ is macroscopic the conditional error bound is unconditional.
    The derivative bound uses an old minimizer for positive increments,
    or equivalently the Lipschitz envelope inequality, and needs no monotone selection of minimizers.
    It follows that a child error failure selects a strength and a minimizing quantile with a profile failure.
    The same argument applies if the initial failure was an error failure at an ordinary endpoint.
    The lower bound in the proposition is the nonnegative segment interpolation in (6).
  #emph[The error parameter cannot grow for the whole fixed chain.] We may therefore repeat the construction:
    each bad profile forces a bad error for a valid child; that bad error selects the next bad profile.
    Lemma 49 preserves all asymptotic endpoint hypotheses and multiplies $E$ by at least $n^(delta \/ 4)$ at each
    stage. All choices of constants have already been made. At most $N$ successive subsequence extractions are
    involved, so the eventual inequalities can be imposed together.
    On the other hand (3), at every stage, confines the error parameter to
  $ c_j n^(- 5 \/ 6 + 2 m) lt.eq E_j lt.eq C_j n^(- 1 \/ 2) \, $
  where $c_j \, C_j$ are fixed constants for that stage. A chain of $N$ increases would imply $E_N gt.eq
    n^(N delta \/ 4) E_0$, contradicting these bounds since $N delta \/ 4 gt.eq 5 \/ 2 > 1 \/ 3 - 2 m$.
    This proves both assertions.
  For a fixed strength root, the argument begins directly with its bad profile. There is no root sweep.
    Its first child starts from the admissible changed path $P_r$,
    and every subsequent error sweep has an admissible bare endpoint.
    Lemma 50 shows explicitly that no bare root pressure is needed. ◻
]

#thm([Corollary 6.7.])[
  (Uniformity for the field wall).  #emph[Let the parent have data (3)–(5) and work on $\[ s \, 1 \]$, with $s =
    o \( a \)$, at final strength $e \( q \) = d^2 f \( q \/ d \)$ and lower wall $0 < r_min lt.eq
    u_(*) \/ M \( s \)$. Suppose $d = o \( 1 \)$ and $d^2 = o \( epsilon \)$.
    For $0 < epsilon lt.eq T$ and $0 lt.eq theta lt.eq 1$, put
$ c_L = 1 / 2 min \( epsilon \, T - epsilon \) \, wide r_0 = frac(d^2 r_min, 2 epsilon) \, $

 and take increasing $0 lt.eq phi lt.eq 1$ on $\[ 0 \, s \]$. The bare algebraic coefficients are
$ b_0 = T - \( epsilon + theta c_L \) upright(bold(1))_(u < s) \, wide h_0 =
  theta c_L r_0 phi \( u \) upright(bold(1))_(u < s) . $

 The profile conclusion of Proposition 53 holds uniformly along arbitrary sequences of these wall parameters,
   including $theta arrow.r 0$ and $T - epsilon arrow.r 0$.]
] <reg:wall-uniformity>

#proof[
  The low matrix covariance is nonnegative because $c_L lt.eq \( T - epsilon \) \/ 2$.
    At the high boundary, $e \( r_min \) = d^2$ for large $n$, since $r_min \/ d arrow.r 0$. The low field is at most
  $ c_L r_0 lt.eq 1 / 4 d^2 r_min \, $
  whereas the high field is at least $d^2 r_min$. The high matrix gap is at least $epsilon - d^2 > 0$.
    Thus every changed parent trial is an admissible path. The low penalty, if included,
    is independent of the high quantile and cancels in Lemma 50.
  If $epsilon < T \/ 4$, the low matrix covariance is greater than $5 T \/ 8$;
    for large $n$ the high covariance has a fixed positive lower bound as well.
    We therefore use all-mass descendants. If $epsilon gt.eq T \/ 4$, the high-to-low gap is at least $T \/ 4 -
    d^2$, so we use high-only descendants with zero wall. Choose the recursion budget as a fixed small fraction of
    $T$. These alternatives remain valid even when the low covariance tends to zero,
    since in that case descendants leave it unchanged. Above $s$ the original bare coefficients are exactly $T \,
    0$; (4) is therefore uniform there. Lemma 49 preserves it in every descendant, and $s = o \( a' \)$ persists.
  Any failure of uniformity would yield a sequence of wall parameters and, after subselection,
    one of these two fixed-margin alternatives. Proposition 53 excludes that sequence.
    Only changed paths are used, even when the displayed bare field has a downward jump at $s$. ◻
]

== 7 Positive Laplace comparisons and fluctuations <sec:fluctuations>

Throughout this section, $T = beta^2 > 1$ is fixed. We use the uniform spin prior and write

$ H_n^(upright("off")) \( sigma \) = beta / sqrt(n) sum_(i < j) g_(i j) sigma_i sigma_j \, wide F_n =
  log (2^(- n) sum_(sigma in { - 1 \, 1 }^n) e^(H_n^(upright("off")) \( sigma \))) . $

Let $D$ be an independent centered Gaussian of variance $T \/ 2$, and put $F_n^c = F_n + D$. Indeed,

$ bb(E) H_n^(upright("off")) \( sigma \) H_n^(upright("off")) \( tau \) = frac(n T, 2) R \( sigma \, tau \)^2 -
  T / 2 \, $

so the completed Hamiltonian has covariance $n T R^2 \/ 2$, as required by the definition of $f_n$.
  Completion changes the variance by exactly $T \/ 2$, and independence gives the exact centered-transform correction

$ log bb(E) e^(t \( F_n^c - bb(E) F_n^c \)) = log bb(E) e^(t \( F_n - bb(E) F_n \)) + frac(T t^2, 4) . $

Changing the uniform prior to the counting measure adds the deterministic constant $n log
  2$ and has no effect on centered fluctuations.

Fix a constant $m$ with $0 < m < 1 \/ 300$, and set $delta = m \/ 10000$.
  All assertions below hold for sufficiently large $n$, with constants and thresholds allowed to depend on $T$ and
  $m$. The order of choices is important: $m$ is fixed before $n$ tends to infinity. Define

$ s = n^(- 1 \/ 6 + 5 m) \, wide p \( epsilon \) = f_n \( T - epsilon upright(bold(1))_({ u < s }) \, 0 \) \, wide
  0 lt.eq epsilon lt.eq T . $

The endpoint with $epsilon = 0$ integrates all matrix disorder at mass zero, whereas the endpoint with $epsilon =
  T$ integrates it at mass $s$. The self correction is $T \/ 4$ at both endpoints. Consequently

$ p \( 0 \) = 1 / n bb(E) F_n^c - T / 4 \, wide p \( T \) = frac(1, n s) log bb(E) e^(s F_n^c) - T / 4 \, wide
  K_n \( s \) := log bb(E) e^(s \( F_n^c - bb(E) F_n^c \)) = n s thin \[ p \( T \) - p \( 0 \) \] . $

Our goal is the window in Proposition 59: $c_(T \, m) n^(20 m) lt.eq K_n \( s \) lt.eq C_(T \, m) n^(100 m)$.
  The lower and upper comparisons below establish its two bounds.

Moreover, (1) gives

$ 0 lt.eq p' \( epsilon \) = 1 / 4 integral_0^s B_u thin d u lt.eq s / 4 $

at differentiability points, and the integrated inequality holds on every interval. In particular, $p$ is increasing.

=== 7.1 A chord inequality and the lower comparison <a-chord-inequality-and-the-lower-comparison>

We first record the form of the interpolation bound used throughout this section.
  Its hypotheses concern its two endpoint paths; a pointwise difference of two admissible clocks need not itself
  be an increasing clock.

#thm([Lemma 7.1.])[
  (Chord comparison).  #emph[Suppose $\( b \, h \)$ and $\( b + a \, h - c \)$ are bounded admissible paths,
    $a gt.eq 0$, and $c = 0$ wherever $a = 0$. If $c^2 \/ a$ is integrable,
    with the quotient set to zero where $a = c = 0$, then
$ f_n \( b + a \, h - c \) lt.eq f_n \( b \, h \) + 1 / 4 integral_0^1 frac(c \( u \)^2, a \( u \)) thin d u . $

]
] <fl:chord>

#proof[
  The segment $\( b + t a \, h - t c \)$ consists of admissible paths. By (1), its derivative is
  $ - 1 / 4 integral a B thin d u + 1 / 2 integral c S thin d u lt.eq 1 /
    4 integral \( - a S^2 + 2 c S \) thin d u lt.eq 1 / 4 integral c^2 / a thin d u \, $
  where $B gt.eq S^2$ and completion of the square give the two inequalities. Integration proves the result.
    The integrated variation identity (1), established by step approximation,
    applies to the bounded segments used here. ◻
]

Take $epsilon = n^(- 1 \/ 3)$ and apply the short comparison (6) to the endpoint defining $p \( epsilon \)$,
  on all masses, with

$ d = s \, wide E = n^(- 2 \/ 3 + 2 m) d = n^(- 5 \/ 6 + 7 m) . $

Here $a = sqrt(n) E \/ d = n^(- 1 \/ 6 + 2 m)$ and $epsilon = o \( a^2 \)$, so (3) and (4) hold.
  All matrix paths stay uniformly positive. The final-strength profile has

$ e \( r \) = d^2 f \( r \/ d \) \, wide n^delta frac(sqrt(n) E, d) = n^(- 1 \/ 6 + 2 m + delta) = o \( s \) . $

Thus (8), supplied by Proposition 53, gives $r asymp s$ on $s \/ 2 lt.eq u lt.eq s$ at a minimizing final path.
  In particular $e \( r \) asymp s^2 gt.double epsilon$ there.

Write $P$ for this changed path and $cal(P)_e = integral e r^2 \/ 4$ for its penalty. The comparison error gives

$ f_n \( P \) + cal(P)_e lt.eq p \( epsilon \) + n^(20 delta) E . $

Lemma 55, with residual matrix covariance $e + epsilon upright(bold(1))_({ u < s })$ and residual field $e r$,
  bounds $p \( 0 \)$ above by the same changed pressure plus the corresponding chord penalty. Subtraction yields

#[#set math.equation(numbering: n => "(30)")
 $ p \( epsilon \) - p \( 0 \) & gt.eq 1 / 4 integral_0^s frac(epsilon e \( r \), e \( r \) + epsilon) thin r^2
   thin d u - n^(20 delta) E\
 & gt.eq c_(T \, m) epsilon s^3 . $ <eq:30>]

For the last step, the integral over $\[ s \/ 2 \, s \]$ is bounded below by a constant times $epsilon s^3 =
  n^(- 5 \/ 6 + 15 m)$, whereas the error is $n^(- 5 \/ 6 + 7 m + 20 delta)$. Hence

$ K_n \( s \) gt.eq n s \[ p \( epsilon \) - p \( 0 \) \] gt.eq c_(T \, m) n^(20 m) . $

=== 7.2 The initial upper comparison <the-initial-upper-comparison>

Set

$ d_H = n^(- 1 \/ 6 + 15 m) \, wide d_N = n^(- 1 \/ 6 + 25 m) \, wide epsilon_0 = d_H d_N = n^(- 1 \/ 3 + 40 m) . $

Apply the all-mass short comparison to $p \( 0 \)$ with $d = d_N$ and $E = n^(- 2 \/ 3 + 2 m) d_N$.
  At final strength, (8) and monotonicity give $r lt.eq C d_N$ below mass $s$.
  The fixed profile $f$ is positive on bounded intervals, so $e \( r \) gt.eq c d_N^2$ there.
  Since $epsilon_0 \/ d_N^2 = n^(- 10 m)$, the residual matrix covariance $e -
  epsilon_0 upright(bold(1))_({ u < s })$ is positive for large $n$. Lemma 55 therefore gives

$ p \( epsilon_0 \) - p \( 0 \) & lt.eq 1 / 4 integral_0^s frac(epsilon_0 e \( r \), e \( r \) - epsilon_0) thin
  r^2 thin d u + n^(20 delta) E\
 & lt.eq C s epsilon_0 d_N^2 + n^(20 delta) E lt.eq C_(T \, m) #scale(x: 120%, y: 120%)[\(] n^(- 5 \/ 6 + 95 m) +
   n^(- 5 \/ 6 + 27 m + 20 delta) #scale(x: 120%, y: 120%)[\)] . $

Only larger gaps in $epsilon$ remain.

=== 7.3 High comparisons with a low-field wall <high-comparisons-with-a-low-field-wall>

Fix $epsilon in \[ epsilon_0 \, T \)$ and put

$ q = 1 / 4 min \( epsilon \, T - epsilon \) \, wide c_L = 2 q \, wide d = d_H \, wide E = n^(- 2 \/ 3 + 10 m) d . $

The high comparison acts on $A = \[ s \, 1 \]$. Use the constraints (5), with

$ u_(*) = \( n E \)^(- 1) \, wide r_min = frac(u_(*), 2 M \( s \)) \, wide r_0 = frac(d^2 r_min, 2 epsilon) . $

Its final strength is $e \( r \) = d^2 f \( r \/ d \)$. To specify the low field, let $tau = n^(- 10)$ and choose

$ psi \( u \) = frac(log \( \( s + tau \) \/ \( s - u + tau \) \), log \( \( s + tau \) \/ tau \)) \, wide 0 lt.eq
  u lt.eq s . $

Thus $psi \( 0 \) = 0$, $psi \( s \) = 1$, $psi$ is increasing, and

$ psi' \( u \) gt.eq frac(c, \( s - u \) log n) quad upright("when ") s - u gt.eq tau . $

For $0 lt.eq theta lt.eq 1$, minimize over the high quantile $r$ the functional

$ J_theta \( r \) =  & f_n #scale(x: 120%, y: 120%)[\(] T - epsilon upright(bold(1))_({ u < s }) -
  theta c_L upright(bold(1))_({ u < s }) - e \( r \) upright(bold(1))_A \,
  thin theta c_L r_0 psi upright(bold(1))_({ u < s }) + e \( r \) r upright(bold(1))_A #scale(x: 120%, y: 120%)[\)]\
 & + 1 / 4 integral_A e \( r \) r^2 thin d u + frac(theta c_L, 4) integral_0^s r_0^2 psi \( u \)^2 thin d u . $

Write $J_theta^(*)$ for its minimum. All references below to $S \, B \, D \,
  K$ for this functional refer to an actual minimizing changed path, not to the unmodified low-field coefficients.

#thm([Lemma 7.2.])[
  (Admissibility and the unswept wall profile).  #emph[For all sufficiently large $n$,
    uniformly in $epsilon in \[ epsilon_0 \, T \)$ and $theta in \[ 0 \, 1 \]$,
    every path in the definition of $J_theta$ is admissible. Its minimizing high quantiles have the regular outer
    profile (8); in particular they are regular above scale $d$.
    In using this profile assertion, no pressure is evaluated at the bare low-field path with its high comparison
    removed.]
] <fl:wall-profile>

#proof[
  Direct substitution in (5) gives
  $ a = n^(- 1 \/ 6 + 10 m) \, quad u_(*) = L = n^(- 1 \/ 6 - 25 m) \, quad M \( s \) asymp n^(30 m + delta) \,
    quad r_min asymp n^(- 1 \/ 6 - 55 m - delta) . $
  In particular, $s = o \( a \)$, $d^2 = o \( epsilon_0 \)$, and $r_min \/ d arrow.r 0$.
    Since $f = 1$ near zero, the initial high field is exactly $d^2 r_min$. On the low group the field is at most
  $ c_L r_0 lt.eq epsilon / 2 frac(d^2 r_min, 2 epsilon) = frac(d^2 r_min, 4) . $
  There is therefore no downward field jump at $s$. Both field paths are increasing on their own intervals.
    The low matrix coefficient is at least $\( T - epsilon \) \/ 2 gt.eq 0$,
    and its gap to the high coefficient at the wall is $epsilon + theta c_L - d^2 > 0$.
    The high matrix path is increasing because $e$ decreases.
  These are the wall data of Corollary 54, with $phi = psi$.
    Total clocks are uniformly bounded, and $d^2 < T \/ 2$ for large $n$.
    The fixed covariance margin required there is also uniform:
    when $epsilon < T \/ 4$, the low covariance is at least $5 T \/ 8$ and the high covariance is at least $T -
    d^2$; when $epsilon gt.eq T \/ 4$, the high-to-low gap is at least $T \/ 4 - d^2$.
    These are respectively the all-mass and high-only alternatives in the corollary.
    Above $s$, the bare coefficients are exactly $T \, 0$, so (4) holds uniformly.
  The low penalty in $J_theta$ is independent of the high quantile.
    It therefore leaves its minimizers unchanged and cancels in the movement inequality used by the corollary.
    Applying the corollary at this fixed positive strength gives the profile uniformly along all wall-parameter
    sequences, including $theta arrow.r 0$ and $T - epsilon arrow.r 0$,
    without evaluating the bare low-field pressure or sweeping the root from zero strength.
    Here its final-strength cutoff is
  $ A_(d^2) = n^delta a = n^(- 1 \/ 6 + 10 m + delta) = o \( d \) . $
  Thus the resulting outer regularity applies at scale $d$, as claimed. ◻
]

#thm([Lemma 7.3.])[
  (Suppression of the low-group mean).  #emph[For every minimizing changed path in Lemma 56,
    uniformly over its low-group splits,
#[#set math.equation(numbering: n => "(31)")
 $ S_u = K_u / T + O \( d^3 \) \, wide S_u lt.eq frac(C d^3, epsilon) = : a_L \, wide K_u = h_u + b_u S_u \, quad
   0 lt.eq u < s . $ <eq:31>]

 The constants are uniform in the wall parameters.]
] <fl:low-mean>

#proof[
  At scale $x = d$, the final strength satisfies $e \( d \) asymp d^2$, so $W asymp d$.
    The cutoff just proved supplies outer regularity there, and the other direct-test inequalities follow from
  $ d \/ a = n^(5 m) \, wide frac(n E^2, e \( d \) d^2) asymp n^(- 10 m) . $
  Also $n e \( d \) d^4 asymp n^(90 m) arrow.r oo$. Projection from a regular high band and (12) give $K_u =
    O \( d \)$ and $D_u = O \( d \)$ on the omitted low group.
    The omitted-group big-O version of (22) therefore gives $S_u = Gamma \( K_u \) + O \( d^3 \)$.
    Its hypotheses require an admissible changed path and an omitted mass $s = o \( d \)$;
    they do not require (4) at the omitted splits.
  Choose a fixed $C$ containing all low-group clocks in $\[ 0 \, C d \]$.
    Lemma 43, applied at $x = d$ with omitted mass $u_0 = s = o \( d \)$, gives
  $ sup_(0 lt.eq K lt.eq C d) \| Gamma \( K \) - K \/ T \| = O \( d^3 \) $
  uniformly in the wall parameters. Its high-clock calibration covers this interval down to zero,
    including clock gaps, and requires no version of (4) on the omitted group.
    Combining this bound with the preceding omitted-group cavity estimate proves the first assertion of (31).
  On the low group, $b_u = T - epsilon - theta c_L$ and $0 lt.eq h_u lt.eq d^2 r_min \/ 4 = O \( d^3 \)$. Therefore
  $ \( epsilon + theta c_L \) S_u = h_u + O \( d^3 \) lt.eq C d^3 \, $
  which proves the second assertion. Uniformity follows either from the uniform constants just used or by applying
    the same argument to an arbitrary sequence of wall parameters and low splits. ◻
]

=== 7.4 The low-field sweep and the upper Laplace bound <the-low-field-sweep-and-the-upper-laplace-bound>

#thm([Lemma 7.4.])[
  (Cost of a wall sweep).  #emph[With the preceding choices, uniformly in $epsilon_0 lt.eq epsilon < T$,
$ J_1^(*) - J_0^(*) lt.eq C [c_L s \( a_L^2 + r_0^2 \) + frac(a_L \( log n \)^3, n r_0 s) + n^(- 10)] . $

 Consequently,
$ p \( epsilon + q \) - p \( epsilon \) lt.eq n^(20 delta) E +
  C [s d^6 / epsilon_0 + frac(d, n s r_min) \( log n \)^3 + n^(- 10)] . $

]
] <fl:wall-cost>

#proof[
  We first take $theta gt.eq tau = n^(- 10)$. For the dyadic values $v = s \/ 2 \, s \/ 4 \, dots.h$ with $v gt.eq
    4 tau$, put
  $ I_v^(-) = \[ s - v \, s - v \/ 2 \] \, wide I_v^(+) = \[ s - v \/ 2 \, s - v \/ 4 \] . $
  The intervals $I_v^(-)$ cover $\[ s \/ 2 \, s \)$ except for a terminal strip of length at most $4 tau$.
    Each $I_v^(+)$ lies after $I_v^(-)$, has length $v \/ 4$, and stays at distance at least $tau$ from $s$.
    On either interval, the field derivative is at least $c theta c_L r_0 \/ \( v log n \)$.
    Integrating the susceptibility inequality in (1) and using (31) gives
  $ integral_J bb(E) "tr" H_u^2 thin d u lt.eq frac(C a_L v log n, n theta c_L r_0) . $
  Here $J$ is either $I_v^(-)$ or $I_v^(+)$. Since $H_u gt.eq u C_u$ and $u gt.eq s \/ 2$ on both, it also gives
  $ integral_J bb(E) "tr" C_u^2 thin d u lt.eq frac(C a_L v log n, n theta c_L r_0 s^2) . $
  For $u in I_v^(-)$, average the single-path observable over $I_v^(+)$:
  $ overline(L)_v = frac(1, \| I_v^(+) \|) integral_(I_v^(+)) L_j thin d j \, wide \| X_u \|^2 lt.eq
    2 bb(E)_u overline(L)_v . $
  Indeed $2 bb(E)_u L_j = bb(E)_u \| X_j \|^2 gt.eq \| X_u \|^2$ for $j gt.eq u$.
    Moreover $bb(E) overline(L)_v lt.eq a_L \/ 2$. Apply the pinned moment inequality in (1) with $p =
    2$ and the deterministic weight $k_j = \| I_v^(+) \|^(- 1) upright(bold(1))_(I_v^(+)) \( j \)$. Since
  $ bb(E) W_j = bb(E) "tr" \( H_j C_j \) lt.eq 2 / s bb(E) "tr" H_j^2 \, $
  the variance under the full planted law satisfies
  $ "Var" \( overline(L)_v \) lt.eq frac(1, \| I_v^(+) \|^2) integral_(I_v^(+)) bb(E) W_j thin d j lt.eq
    frac(C a_L log n, n theta c_L r_0 s v) . $
  Conditional Jensen is used only after this unconditional estimate:
  $ bb(E) \| X_u \|^4 lt.eq 4 bb(E) overline(L)_v^2 lt.eq C a_L^2 + frac(C a_L log n, n theta c_L r_0 s v) . $
  Also
  $ B_u = bb(E) parallel X_u X_u^(sans(T)) + C_u parallel_(upright("HS"))^2 lt.eq 2 bb(E) \| X_u \|^4 +
    2 bb(E) "tr" C_u^2 . $
  On integrating over $I_v^(-)$, the fourth-moment error loses its factor $v^(- 1)$.
    The covariance term is no larger, because $v lt.eq s$:
  $ integral_(I_v^(-)) B_u thin d u lt.eq C v a_L^2 + frac(C a_L log n, n theta c_L r_0 s) . $
  Summing the $O \( log n \)$ dyads proves
  $ integral_(s \/ 2)^(s - C tau) B_u thin d u lt.eq C s a_L^2 + frac(C a_L \( log n \)^2, n theta c_L r_0 s) . $
  The omitted terminal strip has cost at most $C tau$, since $B_u lt.eq 1$.
    For $u < s \/ 2$, monotonicity gives $integral_0^(s \/ 2) B_u thin d u lt.eq
    2 integral_(s \/ 2)^(3 s \/ 4) B_u thin d u$. Hence the same bound, with a $C tau$ remainder,
    holds over the whole low group.
  The feasible high-quantile class is fixed, so the pressure Lipschitz bound makes $J_theta^(*)$ Lipschitz in
    $theta$. At an optimizing high quantile, the upper envelope derivative per unit $log theta$ is at most
  $ frac(theta c_L, 4) integral_0^s \[ D_u^2 + \( S_u - r_0 psi \( u \) \)^2 \] thin d u . $
  This is (7) for the low variation, with the high optimizer held fixed when taking an upper difference quotient.
    The estimate is uniform over all minimizers, so it also bounds the derivative of the minimum at almost every
    parameter. Dropping the nonpositive cross term and using $D_u^2 + S_u^2 = B_u$ bounds it by
  $ C theta c_L s \( a_L^2 + r_0^2 \) + frac(C a_L \( log n \)^2, n r_0 s) + C theta c_L tau . $
  Integration over $tau lt.eq theta lt.eq 1$ gives the claimed three-logarithm term.
    On $0 lt.eq theta lt.eq tau$ the trivial bounds on the overlap and the fixed low coefficient give total cost
    $C tau c_L s lt.eq C tau$. This proves the first assertion.
  At $theta = 0$, the high comparison begins from the admissible endpoint defining $p \( epsilon \)$ and can be
    swept from strength zero. Hence $J_0^(*) lt.eq p \( epsilon \) + n^(20 delta) E$.
    At $theta = 1$, the chord to $p \( epsilon + q \)$ has residual matrix covariance $e$ on the high group and
    $c_L - q = c_L \/ 2$ on the low group. Its residual field is $e r$ high and $c_L r_0 psi$ low.
    Relative to the penalties included in $J_1^(*)$, the excess chord cost is
  $ 1 / 4 integral_0^s (frac(c_L^2, c_L - q) - c_L) r_0^2 psi^2 thin d u = c_L /
    4 integral_0^s r_0^2 psi^2 thin d u lt.eq C s c_L r_0^2 . $
  Both endpoints and their connecting segment are admissible.
    Finally, $a_L = C d^3 \/ epsilon$, $c_L lt.eq epsilon \/ 2$, and $r_0 \/ a_L lt.eq C r_min \/ d arrow.r 0$.
    These imply
  $ c_L s \( a_L^2 + r_0^2 \) lt.eq C s d^6 \/ epsilon_0 \, wide a_L / r_0 lt.eq C d \/ r_min \, $
  and prove the second assertion. ◻
]

Here is the complete power ledger for these choices; constants and the indicated logarithms are suppressed in the table.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Power of $n$
]),
  table.cell(rowspan: 1, colspan: 1)[$epsilon s^3$ in the lower comparison
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 15 m$
],
  table.cell(rowspan: 1, colspan: 1)[Lower comparison error $n^(20 delta) E$
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 7 m + 20 delta$
],
  table.cell(rowspan: 1, colspan: 1)[Initial upper chord $s epsilon_0 d_N^2$
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 95 m$
],
  table.cell(rowspan: 1, colspan: 1)[Initial upper comparison error
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 27 m + 20 delta$
],
  table.cell(rowspan: 1, colspan: 1)[High comparison error $n^(20 delta) E$
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 25 m + 20 delta$
],
  table.cell(rowspan: 1, colspan: 1)[$s d^6 \/ epsilon_0$
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 55 m$
],
  table.cell(rowspan: 1, colspan: 1)[$d \/ \( n s r_min \)$
], table.cell(rowspan: 1, colspan: 1)[$- 5 \/ 6 + 65 m + delta$
],
)
]

For reference, the ceiling condition in (3) has respective ratios $E \/ \( n^(- 1 \/ 2) d^2 \) = n^(- 3 m) \,
  n^(- 23 m) \, n^(- 5 m)$ in the lower, initial upper, and high comparisons.
  Its lower condition follows from the respective factors $n^(2 m) \, n^(2 m) \,
  n^(10 m)$ in the choices of $E \/ d$. Thus none of these applications sits at an unverified endpoint of the
  allowable error range.

Starting at $epsilon_0$, iterate $epsilon mapsto epsilon + 1 / 4 min \( epsilon \, T - epsilon \)$ until $T -
  epsilon lt.eq n^(- 5)$. Before crossing $T \/ 2$, the current $epsilon$ grows by a factor $5 \/ 4$;
  subsequently its distance to $T$ decreases by a factor $3 \/ 4$.
  The number of steps is therefore $O_(T \, m) \( log n \)$.
  The last unswept interval costs at most $s n^(- 5) \/ 4$. The ledger and Lemma 58, uniformly at every step, imply

$ p \( T \) - p \( 0 \) lt.eq
  C_(T \, m)
  [n^(- 5 \/ 6 + 95 m) + n^(- 5 \/ 6 + 65 m + delta) \( log n \)^4 + n^(- 5 \/ 6 + 27 m + 20 delta) log n + n^(-
  5) s] . $

Every term after the first is smaller for each fixed $m > 0$ and sufficiently large $n$.
  We have proved the following moment window.

#thm([Proposition 7.5.])[
  (A positive Laplace window).  #emph[For every fixed $T > 1$ and $0 < m < 1 \/ 300$,
    there exist $c_(T \, m) > 0$, $C_(T \, m) < oo$, and $n_0 \( T \, m \)$ such that
$ c_(T \, m) n^(20 m) lt.eq log bb(E) exp { s \( F_n^c - bb(E) F_n^c \) } lt.eq C_(T \, m) n^(100 m) \, wide s =
  n^(- 1 \/ 6 + 5 m) \, $

 for all $n gt.eq n_0 \( T \, m \)$.]
] <fl:laplace-window>

=== 7.5 Exponential augmentation and one-dimensional estimates <exponential-augmentation-and-one-dimensional-estimates>

A positive moment by itself need not determine a variance:
  an exponentially rare positive deviation can dominate it,
  and a rare negative deviation can dominate the variance without enlarging that moment.
  The next structural property supplies the needed distributional control.
  It is the exponential augmentation underlying the positive moment method of #cite(label("AL2026"))
  Proposition 5.1; we give its proof in the present normalization.

#thm([Lemma 7.6.])[
  (Log-concave augmentation).  #emph[Let $cal(E)$ be an independent exponential variable of rate one.
    Then $G_n = F_n^c + cal(E)$ has a log-concave density. For $0 lt.eq t < 1$,
$ log bb(E) e^(t \( G_n - bb(E) G_n \)) = K_n \( t \) - t - log \( 1 - t \) \, wide "Var" G_n = "Var" F_n^c + 1 . $

]
] <fl:augmentation>

#proof[
  Represent all disorder, including the common Gaussian, by a standard Gaussian vector $g in bb(R)^N$.
    There are linear forms $a_sigma dot.op g$ such that
  $ F_n^c \( g \) = log (2^(- n) sum_sigma e^(a_sigma dot.op g)) . $
  For each $tau in { - 1 \, 1 }^n$, the orthogonal gauge transformation $g_(i j) mapsto tau_i tau_j g_(i j)$,
    leaving the common coordinate fixed, preserves both the Gaussian law and $F_n^c$.
    These transformations act transitively on the spin labels. The density of $G_n$ is
  $ q \( z \) = e^(- z) bb(E) [e^(F_n^c \( g \)) upright(bold(1))_({ F_n^c \( g \) lt.eq z })] . $
  Upon expanding $e^(F_n^c)$, gauge invariance shows that all terms have the same integral.
    Thus, for one fixed spin label $sigma_(*)$, $q$ is the marginal, up to a constant, of
  $ exp { - \| g \|^2 \/ 2 + a_(sigma_(*)) dot.op g - z } upright(bold(1))_({ F_n^c \( g \) lt.eq z }) . $
  The function $F_n^c$ is convex, being a logarithm of a sum of exponentials of linear functions.
    Its epigraph is convex, and the displayed integrand is therefore log-concave jointly in $\( g \, z \)$.
    It is integrable: integrating first in $z$ leaves a Gaussian density times
    $e^(a_(sigma_(*)) dot.op g - F_n^c \( g \)) lt.eq 2^n$. Prékopa’s marginal theorem #cite(label("Prekopa1973"))
    Theorems 6 and 8 implies that $q$ is log-concave. Independence and $bb(E) e^(t \( cal(E) - 1 \)) =
    e^(- t) \/ \( 1 - t \)$ give the two identities. ◻
]

#thm([Lemma 7.7.])[
  (Variance and concentration for a log-concave law).  #emph[Let $X$ be centered with a log-concave density and
    $sigma^2 = bb(E) X^2 > 0$. There are universal positive constants $c \, C$ such that
$ & bb(P) { \| X \| gt.eq t sigma } lt.eq 2 e^(- c t) quad \( t gt.eq 0 \) \,\
 & log bb(E) e^(t X) lt.eq C t^2 sigma^2 quad \( 0 lt.eq t sigma lt.eq c \) \,\
 & bb(P) { X gt.eq c sigma } gt.eq c \, wide log bb(E) e^(t X) gt.eq c t sigma + log c quad \( t gt.eq 0 \) \,\
 & sup_x f_X \( x \) lt.eq C \/ sigma . $

 The lower log-moment inequality is understood also when the moment is infinite.]
] <fl:one-dimensional>

#proof[
  The survival functions of $X$ and $- X$ are log-concave by Prékopa’s theorem.
    Chebyshev’s inequality bounds the survival probability at $- 2 sigma$ below by $3 \/ 4$,
    and that at $2 sigma$ above by $1 \/ 4$. Concavity of its logarithm and the secant slope between these two
    points give, for $t gt.eq 2$,
  $ bb(P) \( X gt.eq t sigma \) lt.eq sqrt(3) / 4 exp (- frac(log 3, 4) t) . $
  Apply the same argument to $- X$; the trivial bound for $t lt.eq
    2$ then gives the first assertion with $h = \( log 3 \) \/ 4$ in place of $c$. Integration of the tails yields
  $ bb(E) \| X \|^k lt.eq 2 k ! \( sigma \/ h \)^k \, wide k gt.eq 1 . $
  For $r = t sigma \/ h lt.eq 1 \/ 2$, the exponential series converges absolutely and, since $bb(E) X = 0$,
  $ log bb(E) e^(t X) lt.eq log (1 + 2 sum_(k gt.eq 2) r^k) lt.eq frac(2 r^2, 1 - r) lt.eq 4 r^2 . $
  The fourth-moment bound and Hölder’s inequality give
  $ bb(E) \| X \| gt.eq frac(\( bb(E) X^2 \)^(3 \/ 2), \( bb(E) X^4 \)^(1 \/ 2)) gt.eq c_1 sigma . $
  Centering implies $bb(E) X_(+) = bb(E) \| X \| \/ 2$, whereas $bb(E) X_(+)^2 lt.eq sigma^2$.
    The Paley–Zygmund inequality, or its elementary proof by Cauchy–Schwarz on the event ${ X_(+) gt.eq
    bb(E) X_(+) \/ 2 }$, now gives $bb(P) \( X gt.eq c_2 sigma \) gt.eq c_2$ for a universal $c_2 > 0$.
    Restricting the exponential moment to that event proves its lower bound.
  For the density estimate, write $M = sup f_X$ and choose a mode $x_0$.
    An integrable one-dimensional log-concave density has a finite positive maximum,
    with one-sided limits used at a support endpoint. On either side of the mode the density must fall to $M \/
    e$ within distance at most $e \/ M$, or reach the support endpoint:
    otherwise its integral on that side would exceed one. Concavity of the log density then bounds the tail beyond
    that point by its exponentially decreasing secant. Together with $f_X lt.eq M$ before that point, this gives
  $ f_X \( x_0 + y \) lt.eq e M exp \( - M \| y \| \/ e \) \, $
  with zero outside the support. Consequently
  $ sigma^2 lt.eq bb(E) \( X - x_0 \)^2 lt.eq 2 e M integral_0^oo y^2 e^(- M y \/ e) thin d y = frac(4 e^4, M^2) . $
  Rearranging proves $M lt.eq 2 e^2 \/ sigma$. ◻
]

=== 7.6 Conclusion with fixed power slack <conclusion-with-fixed-power-slack>

#proof[
  Let $sigma_n^2 = "Var" G_n$. For the fixed $m$ used in Proposition 59, $s arrow.r 0$.
    The exponential correction in Lemma 60 is $O \( s^2 \)$, and hence
  $ c_(T \, m) n^(20 m) lt.eq log bb(E) e^(s \( G_n - bb(E) G_n \)) lt.eq C_(T \, m) n^(100 m) $
  for sufficiently large $n$, after changing constants. If $s
    sigma_n$ were smaller than the universal small-tilt constant in Lemma 61,
    its upper quadratic bound would make this log moment uniformly bounded.
    The divergent lower bound therefore gives $s sigma_n gt.eq c$ eventually.
    Its positive-side mass bound, on the other hand, gives
  $ c s sigma_n + log c lt.eq log bb(E) e^(s \( G_n - bb(E) G_n \)) lt.eq C_(T \, m) n^(100 m) . $
  It follows that
  $ c_(T \, m) n^(1 \/ 6 - 5 m) lt.eq sigma_n lt.eq C_(T \, m) n^(1 \/ 6 + 95 m) . $
  Given any desired power slack $eta > 0$, first choose a fixed $m < min \( 1 \/ 300 \, eta \/ 200 \)$.
    The constants are absorbed by the remaining strict power slack as $n arrow.r oo$.
    Thus $sigma_n = n^(1 \/ 6 + o \( 1 \))$. Since
  $ "Var" G_n = "Var" F_n + T \/ 2 + 1 \, $
  the same standard-deviation exponent holds for $F_n$, and its variance is $n^(1 \/ 3 + o \( 1 \))$.
  We also prove the asserted typical magnitude. Let $X_n = G_n - bb(E) G_n$.
    The density estimate in Lemma 61 implies, for every $a > 0$,
  $ bb(P) \( \| X_n \| lt.eq a \) lt.eq 2 C a \/ sigma_n . $
  Using the standard-deviation bounds with any fixed slack smaller than $eta$, this tends to zero at $a =
    n^(1 \/ 6 - eta)$. Chebyshev’s inequality, or the exponential-tail bound of that lemma,
    shows that $bb(P) \( \| X_n \| gt.eq n^(1 \/ 6 + eta) \) arrow.r 0$.
    Hence the smoothed centered magnitude lies between these two powers with probability tending to one.
  To transfer this conclusion, write
  $ X_n = \( F_n - bb(E) F_n \) + N \, wide N = D + \( cal(E) - 1 \) \, wide bb(E) N^2 = T \/ 2 + 1 . $
  First suppose $0 < eta < 1 \/ 6$. At the lower threshold $a_n = n^(1 \/ 6 - eta)$, the event $\| F_n -
    bb(E) F_n \| lt.eq a_n$ is contained in ${ \| X_n \| lt.eq 2 a_n } union { \| N \| > a_n }$;
    both probabilities tend to zero. At the upper threshold $b_n = n^(1 \/ 6 + eta)$, the event $\| F_n -
    bb(E) F_n \| > b_n$ is contained in ${ \| X_n \| > b_n \/ 2 } union { \| N \| > b_n \/ 2 }$,
    again with vanishing probability. Fixed numerical factors are harmless because the standard-deviation
    estimates are available with arbitrarily smaller fixed slack.
    For larger $eta$, use inclusion from any smaller positive slack less than $1 \/ 6$.
    This proves the typical-magnitude assertion for every fixed $eta > 0$.
  Finally, division by $n$ changes the standard-deviation and typical magnitude exponents to $- 5 \/ 6$.
    The physical free-energy convention introduces the fixed nonzero factor $- 1 \/ beta$,
    and the counting spin prior introduces only a deterministic constant.
    These changes do not alter either conclusion. All constants and thresholds may depend on the fixed $T > 1$;
    no assertion uniform at either temperature endpoint is used or obtained. ◻
]

== Appendix: Companion interfaces <appendix-companion-interfaces>

#metadata(none)
#label("scale-law-interface")

This appendix records the scope of the estimates that can be used in the companion limiting-law article
  #cite(label("CompanionLaw2026")). References below are to the numbered statements of this paper.
  The finite-tree calculus, the asymptotic comparison results, and uses of their proofs have different hypotheses;
  these hypotheses remain in force under the normalizations described here.
  Every number of labels, polynomial degree, derivative order, moment order,
  and recursion depth is fixed before the system size tends to infinity.
  Constants and the threshold in the size may depend on these fixed choices.

===== 7.6.1 Fluctuation normalization. <fluctuation-normalization.>

In #cite(label("CompanionLaw2026")) Section 1, $s_n \( beta \)^2$ denotes the variance of the counting-prior,
  off-diagonal log partition function. That free energy equals $F_n + n log 2$ in the notation of this paper,
  so Theorem 1 gives exactly $s_n \( beta \) = n^(1 \/ 6 + o \( 1 \))$.
  For the completed variable used in hierarchical comparisons, $"Var" F_n^c = s_n \( beta \)^2 + T \/ 2$.
  The exponent theorem supplies neither a limiting law nor a variance prefactor;
  those are separate conclusions of the companion.

===== 7.6.2 Normalization and physical size. <normalization-and-physical-size.>

The hierarchy in Section 2 has physical size $n$, spin vector $y = sigma \/ sqrt(n)$, and terminal mass one.
  A hierarchy with mass interval $\[ 0 \, ell \]$, $1 lt.eq ell lt.eq 4$,
  and terminal continuation $ell^(- 1) log \( 2^(- n) sum_sigma e^(ell H \( sigma \)) \)$ is obtained by putting

$ u = v \/ ell \, wide tilde(b) \( u \) = ell^2 b \( ell u \) \, wide tilde(h) \( u \) = ell^2 h \( ell u \) \,
  wide tilde(F) = ell F . $

The positive normalized transition laws are the same after this change of variables.
  With self correction $- ell \[ b \( ell - \) \/ 4 + h \( ell - \) \/ 2 \]$,
  its pressure satisfies $f_n^(\[ 0 \, ell \]) \( b \, h \) = ell^(- 1) f_n \( tilde(b) \, tilde(h) \)$.
  Conditional means, covariances and overlaps are unchanged; the normalized-source Hessians satisfy $H_v =
  ell tilde(H)_(v \/ ell)$. Consequently $v C_v prec.curly.eq H_v prec.curly.eq ell C_v$,
  and the pressure formula retains the coefficients $- 1 \/ 4$ and $- 1 \/ 2$ when integrated in $d v$.
  Terminal coincidence weights in the signed calculus become $ell$, while edge and fork weights are $-
  d v$ and $- \( d - 1 \) v$.

An ambient dyadic parameter $N$ may be used when $N \/ 2 lt.eq n lt.eq 3 N$;
  this changes fixed power or logarithmic scale comparisons only by bounded factors.
  The physical $n$ remains in Gaussian covariances, overlap denominators and innovation estimates.
  On deleting $j$ fixed sites, keep the original denominator $n$ in the deleted overlap and keep all undeleted
  Gaussian covariances unchanged. If the retained system is instead written with its own size $p = n -
  j$ and overlap $R_p$, its matrix clock is $\( p \/ n \) b$ and its field clock is $h$.
  Replacing a deleted overlap by the full one costs at most $j \/ n$;
  derivatives and finite differences retain the associated weights and self corrections.
  A size stencil at fixed clocks uses the same named paths,
  cuts and external scale parameters in every stencil term.
  Comparability of $n$ and $N$ does not relax a direct-test cutoff or remove the fixed positive exponent slack in (3).

===== 7.6.3 Source and pressure calculus; the scope of pinned moments. <source-and-pressure-calculus-the-scope-of-pinned-moments.>

Lemma 2.1, Lemma 2.2, Corollary 2.10 give the source derivatives,
  pressure derivatives and fixed-order source bounds for the normalized positive hierarchies.
  A common deterministic source is permitted in the source and pressure statements.
  The spin moment inequality of 4, however, is used at zero deterministic external field,
  with deterministic weights, under the full unconditioned single-path planted law.
  Its centering is the expectation under that law. It is not a pinned inequality for an arbitrarily conditioned
  prefix or a spin-dependent reweighting of that marginal.

The same proof gives the following useful polynomial form.
  Let $P_u$ have a fixed degree and bounded deterministic coefficients, measurable in $u$,
  and let $k in L^2$ be deterministic. At zero deterministic field,

$ ∥integral k_u #scale(x: 120%, y: 120%)[\(] P_u \( L_u \) -
  upright(bold(E)) P_u \( L_u \) #scale(x: 120%, y: 120%)[\)] thin d u∥_p^2 lt.eq
  c_p ∥integral k_u^2 P'_u \( L_u \)^2 W_u thin d u∥_(p \/ 2) \, wide 2 lt.eq p < oo . $

Here $c_2 = 1$ and one may use the same constants $c_p lt.eq 1 + p^2 \/ 3$.
  Indeed, in the proof of 4, the driver gradient of $P_u \( L_u \)$ is $P'_u \( L_u \) g_u$.
  The positive block-Hessian argument therefore gives the same inverse-Hessian energy bound, with $J =
  integral k_u^2 P'_u \( L_u \)^2 W_u thin d u$. Coordinate gauge symmetry preserves both the observable and this
  energy and makes their conditional laws independent of the pinned spin.
  The same Brascamp–Lieb and real-moment argument applies. Boundedness of $L_u$ passes the result from bounded
  deterministic weights to $L^2$ weights. The preceding mass rescaling gives the identical formula on $\[ 0 \, ell \]$.

For a fixed positive enlarged tree, first marginalize all branches unused by a given single-path factor.
  Apply the single-path inequality to that full marginal; next combine the retained factors by unconditional
  Hölder inequalities under the positive tree law; and only then integrate against the total variation of the
  deterministic signed allocation measure. This is the order in Remark 2.4, Remark 3.8.
  Random factors on other branches are not substituted for deterministic weights in the single-path inequality.
  No joint-spin pinned log-concavity assertion is required by this procedure.

===== 7.6.4 Projection, resampling and the conditioning field. <projection-resampling-and-the-conditioning-field.>

20 applies when, conditional on the data determining the exterior anchor and the shared prefix,
  the selected branch retains its entire normalized planted future law.
  The anchor may use an independent outside continuation after the fork.
  It may not use an unrevealed variable from the selected continuation.
  After a field-clock interval of length $Delta h$, at masses at least $v > 0$, the mass-$ell$ normalization gives

$ parallel V dot.op \( y - X_(upright("end")) \) parallel_p lt.eq
  C_p frac(\( log n \)^2 parallel V parallel_p, v sqrt(n Delta h)) \, $

for fixed even $p$, with mass and length bounded below by fixed inverse powers of $n$.
  Conditional Jensen permits later projections; independent conditional resampling uses two such replacements.
  The proof also applies when total clocks grow by a fixed power of $log n$, as in the companion application.
  More generally, polynomially bounded field intervals leave the initial-to-innovation ratio in its moment
  iteration polynomially bounded. The normalized innovation estimate is unchanged.
  This extension concerns the projection estimate itself, not the asymptotic comparison theorem.

For 13, the conditioning field $cal(G)$ is #emph[exactly] the sigma-field generated by the complete common prefix
  through the specified revelation at the cut, the old-branch realizations outside the affected descendant subtree
  after that cut, and the deterministic old topology. It includes no information from the new row’s continuation
  or the affected old subtree after the cut. The two conditional marginals are then the same under the two laws.
  The centered-product estimate uses unconditional $L^p$ norms after averaging over this $cal(G)$;
  no bound uniform in the realized prefix is asserted. Preserving a conditional mean alone would not preserve the
  hypotheses of the projection or pinned-moment estimates.

===== 7.6.5 Signed allocations and fixed-size path limits. <signed-allocations-and-fixed-size-path-limits.>

Proposition 2.5, Lemma 2.6, Lemma 2.8, Lemma 2.9 and (2) concern ordinary positive tree laws integrated against
  signed deterministic coefficients. All fork atoms and terminal coincidences are retained.
  The bounds have no mesh or minimum-mass loss for a fixed number of labels.
  Allocation-order symmetry carries the complete topology coefficient.
  A row-sum cancellation is made only when the remaining integrand is independent of that row’s detailed
  placement. In a recursive calculation, freeze the previously generated topology,
  its coefficients and its scalar centers before introducing the next fresh row.
  The restrictions in Lemma 2.11, Lemma 2.13 remain part of the interface.

The Taylor and bounded-row-change estimates require a uniformly bounded covariance difference along a positive
  semidefinite interpolation, even when an individual clock is long.
  In a comparison of one matrix row with a scalar row at $K$,
  it is the row matrix coefficient and the difference $h - K$ that must obey the stated bounds.
  Clock-independent identities and fixed-size limits alone do not give a bounded-factor row transfer for an
  unbounded covariance change. If a test, its scalar centers or its deterministic weights vary with the
  interpolation, their product-rule derivatives must also be kept.

15 is a fixed-$n$ limit statement. Terminal clocks and the specified before/after clock values at each retained
  cut must converge. At a jump of the pair $\( b \, h \)$ use the fixed joint filling

$ \( b_(-) + t Delta b \, h_(-) + t Delta h \) \, wide 0 lt.eq t lt.eq 1 \, $

at the jump’s fixed mass. Intermediate cuts retain their paired clock values in this filling.
  Positive tree expectations at unfilled cuts, fixed-order source derivatives, signed allocations,
  and the mass-integrated pressure and moment formulas pass to the limit as specified in that proposition.
  The susceptibility inequality holds on continuous parts, with a nonnegative total increment of $S$ at each jump.
  To retain separate driver contributions or intermediate cuts inside a jump,
  the approximations must retain the chosen joint filling. The total increment of $S$ does not depend on this
  filling, but its two driver allocations need not agree for different fillings.
  No discretization rate uniform in the physical size is inferred.

===== 7.6.6 Finite-degree cavity calculations under changed constraints. <finite-degree-cavity-calculations-under-changed-constraints.>

The named proof modules in Section 4 use the quantitative analytic inputs listed there:
  raw moments, normalized-future projection and resampling,
  a deterministic good split with a saving independent of each fixed moment order,
  integrated high-split estimates with the required split densities,
  and the low-scale integrated and target errors. The scalar comparison uses the entire path $K = h + b S$,
  not only its value at the target. Bounded one-row changes preserve positive semidefiniteness and leave the other
  row covariances unchanged; the row transfer and deletion errors in 31 are paid at their actual scales.

Under these analytic inputs and the test-family restrictions of Definition 4.2, Lemma 4.6, the row identity,
  projected replacements and fixed-depth cancellation in Lemma 4.7, Lemma 4.8,
  Lemma 4.9 are available with their displayed remainders. In each generation the current scalar coefficients and
  centers stay fixed during its new interpolation. Observed-block rows, fork atoms,
  and factors with a coefficient depending on the current placement must be processed as in those proofs,
  before any allowed row collapse or absolute bound. Each terminal marked star factor contributes its saved fixed
  moment; one chooses a finite depth sufficient for the desired power margin,
  then fixes all resulting degrees and Hölder orders before taking $n arrow.r oo$.

Changing the inverse-density constraints does not by itself give the conclusion of Proposition 4.1,
  Theorem 5.1 for the new optimizer. Their proofs can be used after establishing, for that optimizer,
  attainment and admissibility, the appropriate first variation and feasible competitors,
  the analytic inputs just listed, and the required mass-#emph[and]-radius error estimates.
  In particular, small floor mass does not imply small floor radius,
  and a whole-cap trace estimate is not a pointwise cap estimate.
  The endpoint expansion used for susceptibility calibration is required on the regular calibration bands;
  no such expansion is silently imposed at an omitted lower target.
  These are proof obligations for a modified comparison, not consequences of having a similar objective.
  Likewise, a general finite cavity quotient on other physical paths must be derived from the positive covariance
  interpolation and finite Taylor calculus at those paths; it is not an unrestricted instance of the
  minimizing-path closure proposition.

===== 7.6.7 The finite-propagation output. <the-finite-propagation-output.>

53 is used with the actual family of 48, the taper in (6), and the constraints in (5).
  In particular, for a sufficiently small #emph[fixed] $m > 0$ and $delta = m \/ 10000$,

$ n^(- 2 \/ 3 + m) d lt.tilde E lt.eq n^(- 1 \/ 2) d^2 \, wide a = sqrt(n) E \/ d \, wide
  u_(*) = \( n E \)^(- 1) \, wide 0 < d = O \( 1 \) \, $

and the sequential endpoint condition is

$ b_0 \( u \) = T + o \( z^2 \) \, wide h_0 \( u \) = o \( z^3 \) quad \( u asymp z \, med a lt.tilde z lt.eq 1 \) . $

Total clocks and all fixed comparison constants are uniformly bounded; $d^2 lt.eq T - rho$ for a fixed $rho > 0$.
  All changed feasible paths are nonnegative and nondecreasing.
  The global matrix lower bound or the high-only matrix lower bound and boundary gap has a fixed positive margin
  after the initial change, available for the entire finite descendant chain.
  An omitted mass interval satisfies $u_0 = o \( a \)$, and its wall satisfies the stated constraint in (5).

Under these assumptions every minimizing quantile obeys

$ c u lt.eq r \( u \) lt.eq C u quad (n^delta sqrt(n) E \/ sqrt(lambda) lt.eq u lt.eq 1) \, wide 0 < lambda lt.eq
  d^2 . $

For an ordinary family with an admissible bare endpoint, its minimized excess lies between zero and $n^(20 delta)
  E$ throughout the sweep. For a fixed-strength family only the profile conclusion is asserted;
  an inadmissible bare root is not evaluated. Before finite propagation has supplied regularity,
  25 requires an outer regular region above $A_lambda$ when $A_lambda = o \( 1 \)$.
  Likewise a small direct test requires the outer regularity and all three local inequalities stated in 39.
  The propagation proof obtains the child’s outer region from successful-error agreement before applying that
  direct result.

===== 7.6.8 A common prelimit temperature. <a-common-prelimit-temperature.>

The same finite-propagation and direct-test conclusions hold sequentially if the endpoint condition uses $T_n
  arrow.r T_oo > 1$, with $T_n$ held fixed throughout the whole parent–child construction at size $n$,
  and with all the preceding fixed margins and bounds. Here is the required proof-level replacement.
  At the regular calibration cut retain

$ b_(*) = T_n + O \( W^2 \) \, wide K_(*) = T_n S_(*) + O \( W^3 \) \, wide J_0 = T_n chi^2 - 1 $

in (26)–(27). Division uses $chi K_(*) asymp W$ and the same absorption of the $eta_n \| J_0 \| \/ W^2$ term.
  No error $T_n - T_oo$ is introduced. In the scalar compactness and linearization arguments use time $K \/ T_n$,
  subtract $K \/ T_n$, and keep $\[ \( b_0 - T_n \) S + h_0 \] \/ x^3$ as the endpoint remainder.
  The derivative, strict-curvature and compactness bounds use a fixed compact neighborhood of $T_oo$ and the
  total-clock bounds. Only in the limiting equations is $T_n$ replaced by $T_oo$.

At a macroscopic direct test the endpoint convergence gives the limiting variational problem at $T_oo$;
  the scalar-minimizer result 46 is used at that one fixed temperature.
  The child-data estimates retain the same $T_n$ in each endpoint expansion,
  and covariance margins are chosen with room at the limiting temperature.
  The same fixed-depth contradiction therefore applies. This sequential extension requires no rate for $T_n -
  T_oo$, gives no uniform assertion as the limiting temperature approaches one,
  and permits neither growing degree nor an $n$-dependent recursion depth.

#bibliography("refs.bib", style: "ieee", title: [References])
