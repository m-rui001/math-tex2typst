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

#align(center)[#text(size: 16pt, weight: "bold")[BKT universality for height and planar spin fields]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction and statements <main:introduction>

Two-dimensional height and planar spin models have phases in which fluctuations remain visible at every scale. The expected large-scale description is a Gaussian free field for heights and an imaginary exponential of a Gaussian free field for planar spins. In each case, an effective parameter derived from the lattice interaction governs the Gaussian covariance. The Berezinskii–Kosterlitz–Thouless (BKT) picture predicts a universal critical value after the model’s natural normalization, although the parameter varies throughout the critical phase. Establishing a field limit in a perturbative regime and identifying that endpoint for the original lattice model are separate problems. This paper addresses both for discrete Gaussian heights, and proves the full spin-field limit for the ordinary XY and Villain models at sufficiently low fixed temperature.

=== 1.1 Height model and its physical threshold <height-model-and-its-physical-threshold>

An #emph[admissible interaction] is a finite set $J subset bb(Z)^2 \\ { 0 }$ invariant under every rotation and reflection of the square and containing $J_(upright("nn")) = { \( 1 \, 0 \) \, \( - 1 \, 0 \) \, \( 0 \, 1 \) \, \( 0 \, - 1 \) }$. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ \( Delta_J u \) \( x \) = frac(1, \| J \|) sum_(y in J) #scale(x: 120%, y: 120%)[\(] u \( x + y \) - u \( x \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) v_J^2 = frac(1, 2 \| J \|) sum_(y in J) y_1^2 . $ <main:laplacian>]

The height variable takes values in $2 pi bb(Z)$ and $beta > 0$ is its #emph[temperature]. For $Q_R = \[ - R \, R \]^2 ∩ bb(Z)^2$ let $mu_(J \, beta \, R)^0$ be the law with heights zero outside $Q_R$ and weight

#[#set math.equation(numbering: n => "(1.2)")
 $ exp {- frac(1, 4 beta \| J \|) sum_(x in bb(Z)^2) sum_(y in J) \( sigma_(x + y) - sigma_x \)^2} . $ <main:zero-law>]

Both orientations of each edge occur in the sum. The threshold is

#[#set math.equation(numbering: n => "(1.3)")
 $ beta_(upright(c)) \( J \) = inf {beta > 0 : sup_(R gt.eq 1) bb(E)_(mu_(J \, beta \, R)^0) sigma_0^2 = oo} . $ <main:physical-threshold>]

For $n = L^N$ write $Lambda_N = \( bb(Z) \/ n bb(Z) \)^2$. The torus law is

#[#set math.equation(numbering: n => "(1.4)")
 $ bb(P)_(J \, beta \, N) \( sigma \) = 1 / Z exp {- frac(\( sigma \, - Delta_J sigma \), 2 beta)} \, #h(2em) sigma in \( 2 pi bb(Z) \)^(Lambda_N) \, quad sigma_0 = 0 \, $ <main:torus-law>]

where $\( u \, v \) = sum_x u_x v_x$ and steps are taken modulo $n$. Pinning chooses a representative of the global height shift. Set $macron(sigma) = n^(- 2) sum_x sigma_x$ and

#[#set math.equation(numbering: n => "(1.5)")
 $ H_N = n^(- 2) sum_(x in Lambda_N) \( sigma_x - macron(sigma) \) delta_(x \/ n) . $ <main:height-field>]

On the unit torus $bb(T)^2 = bb(R)^2 \/ bb(Z)^2$, let $Phi_(bb(T))$ be the mean-zero real Gaussian free field with covariance $\( - Delta_(bb(T)) \)^(- 1)$, where $Delta_(bb(T))$ is the Euclidean Laplacian. Pairings of continuum functions use Lebesgue measure.

#thm([Theorem 1.1.])[
  (Height universality through the roughening threshold).  #emph[For every admissible $J$, the threshold in Equation (1.3) satisfies $0 < beta_(upright(c)) \( J \) < oo$. The supremum there is finite when $0 < beta < beta_(upright(c)) \( J \)$ and infinite when $beta gt.eq beta_(upright(c)) \( J \)$, including equality.]
  #emph[There are an integer $L = L \( J \) gt.eq 2$ and a unique positive function $beta_(upright("eff")) \( J \, beta \)$, defined for $beta gt.eq beta_(upright(c)) \( J \)$, such that along the full sequence $N arrow.r oo$ 
#[#set math.equation(numbering: n => "(1.6)")
 $ H_N med arrow.r.double med sqrt(frac(beta_(upright("eff")) \( J \, beta \), v_J^2)) thin Phi_(bb(T)) quad upright("in ") H^(- 3) \( bb(T)^2 \) . $ <main:height-limit>]

 For every smooth real mean-zero $f$, 
#[#set math.equation(numbering: n => "(1.7)")
 $ lim_(N arrow.r oo) log bb(E) e^(H_N \( f \)) = frac(beta_(upright("eff")) \( J \, beta \), 2 v_J^2) \( f \, \( - Delta_(bb(T)) \)^(- 1) f \) . $ <main:height-laplace>]

 Furthermore, 
#[#set math.equation(numbering: n => "(1.8)")
 $ beta_(upright("eff")) \( J \, beta_(upright(c)) \( J \) \) & = 8 pi v_J^2 \,\
lim_(beta arrow.b beta_(upright(c)) \( J \)) frac(beta_(upright("eff")) \( J \, beta \) - beta_(upright("eff")) \( J \, beta_(upright(c)) \( J \) \), beta - beta_(upright(c)) \( J \)) & = + oo . $ <main:height-endpoint>]

 The function $beta_(upright("eff")) \( J \, dot.op \)$ is differentiable on $\( beta_(upright(c)) \( J \) \, oo \)$, and for some $c_J > 0$, 
#[#set math.equation(numbering: n => "(1.9)")
 $ beta_(upright("eff")) \( J \, beta \) = beta + O_J \( e^(- c_J beta) \) #h(2em) \( beta arrow.r oo \) . $ <main:height-high-temperature>]

 For $J_rho = { x in bb(Z)^2 \\ { 0 } : \| x \|_oo lt.eq rho }$, 
#[#set math.equation(numbering: n => "(1.10)")
 $ frac(beta_(upright(c)) \( J_rho \), 8 pi v_(J_rho)^2) arrow.r 1 #h(2em) \( rho arrow.r oo \) . $ <main:height-spread>]

 In particular $v_(J_(upright("nn")))^2 = 1 \/ 4$ and the nearest-neighbor effective temperature at roughening is $2 pi$.]
] <main:heights>

===== 1.1.1 Other torus sizes and the localized phase. <other-torus-sizes-and-the-localized-phase.>

The internal transfer theorem gives a stronger torus statement than the geometric-sequence assertion in Theorem 1. Fix an admissible $J$ and any $k = beta \/ v_J^2 > 0$, and let $a \( k \) gt.eq 0$ be the structural covariance coefficient constructed in Section 2. Replace $n = L^N$ in the torus law and mean-subtracted field above by any increasing sequence of integer side lengths. Theorem 17 proves convergence in $H^(- 3) \( bb(T)^2 \)$ to the mean-zero GFF of covariance $a \( k \) \( - Delta_(bb(T)) \)^(- 1)$, together with convergence of the Laplace transforms of smooth mean-zero tests. When $a \( k \) = 0$, the limit is the zero distribution. On the positive branch, $beta_(upright("eff")) \( J \, beta \) = v_J^2 a \( k \)$, so the same coefficient governs every such sequence. Corollary 18 identifies this branch with physical roughness; below $beta_(upright(c)) \( J \)$, the zero limit expresses the disappearance of macroscopic height fluctuations at this normalization. The proof of the transfer theorem works directly with arbitrary lattice sizes. On its zero branch the covariance upper bound alone suffices, while the positive branch also uses the Dirichlet lower bound. This stronger result is established before the endpoint analysis and retains the mean subtraction in Equation (1.5).

=== 1.2 Ordinary planar spin models and the Wick convention <main:spin-models>

Here $b > 0$ is #emph[inverse temperature]. Set $D = \( - 1 \, 1 \)^2$ and $D_n = \[ - 1 \, 1 \]^2 ∩ n^(- 1) bb(Z)^2$, for every integer $n gt.eq 1$. Boundary vertices have a coordinate equal to $- 1$ or $1$ and their angles are fixed to zero. Each interior angle lies in $bb(R) \/ \( 2 pi bb(Z) \)$. Write $E_n$ for the unordered nearest-neighbor pairs in $D_n$, including edges incident to its fixed boundary. With respect to product Haar measure on the interior angles, the two probability densities are proportional to

#[#set math.equation(numbering: n => "(1.11)")
 $ upright("XY:") quad & product_({ x \, y } in E_n) e^(b cos \( theta_x - theta_y \)) \,\
upright("Villain:") quad & product_({ x \, y } in E_n) sum_(m in bb(Z)) e^(- b \( theta_x - theta_y + 2 pi m \)^2 \/ 2) . $ <main:xy-law>]

Every edge occurs once. Let $cal(L)_n$ be the unscaled graph Laplacian on the interior, with zero boundary values:

#[#set math.equation(numbering: n => "(1.12)")
 $ \( cal(L)_n u \) \( x \) = sum_(y in D_n : thin \| y - x \| = 1 \/ n) \( u \( x \) - u \( y \) \) \, #h(2em) G_n = cal(L)_n^(- 1) . $ <main:spin-green>]

In particular no factor $n^2$ is included in $cal(L)_n$.

Let $Phi_D$ be the zero-Dirichlet GFF with covariance $\( - Delta_D \)^(- 1)$; its local covariance singularity is $\( 2 pi \)^(- 1) log \| z - w \|^(- 1)$. For $K > 1 \/ \( 4 pi \)$ define the complex random distribution

#[#set math.equation(numbering: n => "(1.13)")
 $ V_(K \, D) = lim_(epsilon.alt arrow.b 0) exp {frac(i Phi_(D \, epsilon.alt), sqrt(K)) + frac(bb(E) Phi_(D \, epsilon.alt)^(thin 2), 2 K)} \, $ <main:chaos>]

where $Phi_(D \, epsilon.alt)$ is the circle average and the limit is tested against smooth functions of compact support in $D$. The proof below also constructs this limit; see #cite(label("JunnilaSaksmanWebb2020"), form: "prose") for the general imaginary-chaos theory. The full variance occurs in Equation (1.13), including the finite spatial part of the Dirichlet Green function. Consequently $bb(E) V_(K \, D) \( f \) = integral_D f$.

#thm([Theorem 1.2.])[
  (Full low-temperature spin-field limits).  #emph[For each $M in { upright("Villain") \, upright("XY") }$ there are a finite $b_0 \( M \) > 0$ and functions $K_M \( b \) > 1 \/ \( 4 pi \)$ and $A_M \( b \) > 0$, defined for all $b gt.eq b_0 \( M \)$, with $K_M \( b \) \/ b arrow.r 1$ as $b arrow.r oo$, such that 
#[#set math.equation(numbering: n => "(1.14)")
 $ S_(M \, b \, n) := n^(- 2) sum_(x in D_n^compose) A_M \( b \) e^(G_n \( x \, x \) \/ \( 2 K_M \( b \) \)) e^(i theta_x) delta_x med arrow.r.double med V_(K_M \( b \) \, D) $ <main:spin-limit>]

 along the full sequence of integers $n arrow.r oo$, with tightness and convergence in $H_(upright("loc"))^(- 3) \( D \)$. For every finite collection of complex smooth compactly supported test functions, their smeared fields converge jointly, including real and imaginary parts. The coefficients $K_M \( b \)$ and $A_M \( b \)$ are independent of the test functions, the insertion locations, and $n$.]
] <main:spins>

===== 1.2.1 All mixed smeared moments. <all-mixed-smeared-moments.>

For each model, the proof gives more than joint weak convergence. Fix any $b gt.eq b_0 \( M \)$ in the asserted range and any finite list $f_1 \, dots.h \, f_r in C_c^oo \( D \; bb(C) \)$, with the same zero boundary angles and normalization as in Theorem 2. Every mixed moment of the variables $S_(M \, b \, n) \( f_j \)$ and their complex conjugates converges to the corresponding moment of $V_(K_M \( b \) \, D) \( f_j \)$ and its conjugate. Equivalently, expectations of every fixed polynomial in these variables and their conjugates converge. Thus the result also controls integrated multipoint correlations of arbitrary fixed order. The lower bound $b_0 \( M \)$ is chosen once, independently of that order; the temperature remains fixed as all integers $n arrow.r oo$.

Weak convergence alone does not control these unbounded polynomial observables. Theorem 45, applied in both Theorems 47 and 68, supplies the additional control. Away from collisions, the separated signed multipoint limits pass to integrals by Riemann summation. Near collisions, positivity, an integrable two-point bound, and Lee–Yang moment bounds make the omitted contribution vanish, including repeated lattice sites. The uniform bounds on higher smear moments give uniform integrability of each fixed polynomial. The Lee–Yang control of their growth with moment order also makes the joint limiting law determined by its moments. This is the step that connects pointwise correlation information to both full field convergence and convergence of its smeared moments.

#thm([Theorem 1.3.])[
  (Villain coefficient bridge).  #emph[The choices in Theorem 2 can be made so that $pi^2 b gt.eq beta_(upright(c)) \( J_(upright("nn")) \)$ throughout the asserted Villain range and 
#[#set math.equation(numbering: n => "(1.15)")
 $ K_(upright("Villain")) \( b \) = frac(beta_(upright("eff")) \( J_(upright("nn")) \, pi^2 b \), pi^2) . $ <main:bridge-equality>]

]
] <main:bridge>

The spin theorems concern sufficiently large fixed inverse temperatures. They assert neither a spin-field limit at the BKT endpoint nor equality of the two models’ effective coefficients at the same bare $b$. The bare conversion in Equation (1.15) is useful for checking constants: Fourier duality gives integer heights $h$ with weight $exp { - sum_e \( nabla_e h \)^2 \/ \( 2 b \) }$; setting $sigma = 2 pi h$ in Equation (1.4), with $- Delta_(J_(upright("nn"))) = cal(L) \/ 4$, gives $beta = pi^2 b$. The effective conversion requires the source and disorder calculations in Section 5.

In these conventions, the nearest-neighbor height endpoint $beta_(upright("eff")) \( J_(upright("nn")) \, beta_(upright(c)) \) = 2 pi$ gives $beta_(upright("eff")) \( J_(upright("nn")) \, beta_(upright(c)) \) \/ pi^2 = 2 \/ pi$, the dimensionless stiffness value in the Nelson–Kosterlitz prediction #cite(label("NelsonKosterlitz1977")). This arithmetic identifies the normalization correspondence. The height theorem reaches the physical roughening threshold, whereas Theorem 3 identifies the spin coefficient only in its stated sufficiently-low-temperature range. Extending that bridge and the spin-field limit to a spin transition would require additional results.

=== 1.3 Normalizations and order of limits <normalizations-and-order-of-limits>

Table 1 collects the conversions used throughout the proof. Table 2 specifies the theorem-level limiting procedures; in particular the spin inverse temperature is held fixed while the lattice spacing tends to zero. The auxiliary choices for annular transfer, physical entry, and endpoint response are given with their constructions in Sections 3, 9, and 10, respectively.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Convention and conversion
]),
  table.cell(rowspan: 1, colspan: 1)[Height law
], table.cell(rowspan: 1, colspan: 1)[$sigma in 2 pi bb(Z)$; temperature $beta$; precision $\( - Delta_J \) \/ beta = A_0 \/ k$, where $A_0 = - Delta_J \/ v_J^2$ and $k = beta \/ v_J^2$; $k_c = beta_(upright(c)) \( J \) \/ v_J^2$.
],
  table.cell(rowspan: 1, colspan: 1)[Height limit
], table.cell(rowspan: 1, colspan: 1)[Covariance $a \( k \) \( - Delta \)^(- 1)$ with $beta_(upright("eff")) = v_J^2 a \( k \)$; $a \( k_c \) = 8 pi$ and $beta_(upright("eff")) \( J \, beta_(upright(c)) \) = 8 pi v_J^2$.
],
  table.cell(rowspan: 1, colspan: 1)[Nearest neighbors
], table.cell(rowspan: 1, colspan: 1)[$v_(J_(upright("nn")))^2 = 1 \/ 4$, $- Delta_(J_(upright("nn"))) = cal(L) \/ 4$, and the endpoint $beta_(upright("eff")) \( J_(upright("nn")) \, beta_(upright(c)) \) = 2 pi$.
],
  table.cell(rowspan: 1, colspan: 1)[Spin law
], table.cell(rowspan: 1, colspan: 1)[Inverse temperature $b$; each unordered edge counted once; boundary angle zero; $G_n = cal(L)_n^(- 1)$ with no $n^2$ factor.
],
  table.cell(rowspan: 1, colspan: 1)[Wick field
], table.cell(rowspan: 1, colspan: 1)[$"Cov" \( Phi_D \) = \( - Delta_D \)^(- 1)$, logarithmic coefficient $1 \/ \( 2 pi \)$; exponent $i Phi_D \/ sqrt(K)$; normalization uses the full variance, so $bb(E) V_(K \, D) = 1$.
],
  table.cell(rowspan: 1, colspan: 1)[Villain bridge
], table.cell(rowspan: 1, colspan: 1)[Dual $h in bb(Z)$, energy $sum_e \( nabla_e h \)^2 \/ \( 2 b \)$; $sigma = 2 pi h$, $beta = pi^2 b$, and $K_(upright("Villain")) \( b \) = beta_(upright("eff")) \( J_(upright("nn")) \, pi^2 b \) \/ pi^2$.
],
  table.cell(rowspan: 1, colspan: 1)[XY coefficient
], table.cell(rowspan: 1, colspan: 1)[$K_(upright("XY")) \( b \)$ is obtained from the XY construction in Section 7; $K_M \( b \) \/ b arrow.r 1$ for each model.
],
)
]],
  caption: [Table 1: Normalization dictionary. Temperature and inverse temperature have different roles in the two lattice descriptions. ],
)

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Argument
], table.cell(rowspan: 1, colspan: 1)[Quantifiers and order
]),
  table.cell(rowspan: 1, colspan: 1)[Height field
], table.cell(rowspan: 1, colspan: 1)[Fix $J$, then $L = L \( J \)$ and $beta gt.eq beta_(upright(c)) \( J \)$; let $N arrow.r oo$ along every $n = L^N$. The pinned representative is mean-subtracted before testing.
],
  table.cell(rowspan: 1, colspan: 1)[Height endpoint
], table.cell(rowspan: 1, colspan: 1)[Define $beta_(upright("eff"))$ by the field limit first; then let $beta arrow.b beta_(upright(c)) \( J \)$ from above. The spread-out limit $rho arrow.r oo$ concerns the thresholds of the distinct $J_rho$.
],
  table.cell(rowspan: 1, colspan: 1)[Spin field
], table.cell(rowspan: 1, colspan: 1)[Fix $M$ and any $b gt.eq b_0 \( M \)$; let every integer $n arrow.r oo$. Circle regularization $epsilon.alt arrow.b 0$ defines the continuum target locally inside $D$.
],
)
]],
  caption: [Table 2: Limits in the main results. The finite Gaussian comparison statements themselves require no thermodynamic limit. ],
)

=== 1.4 Context and earlier work <context-and-earlier-work>

The physical picture originates with Berezinskii and Kosterlitz–Thouless. In a low-temperature quadratic approximation, Berezinskii derived Gaussian multipoint formulas and algebraic spin correlations with a temperature-dependent exponent #cite(label("Berezinskii1971")). Kosterlitz and Thouless separated smooth angular fluctuations, or spin waves, from vortices in an approximate description of the planar model #cite(label("KosterlitzThouless1973")). A vortex is a defect around which the spin angle has nonzero integer winding. In their BKT scenario, oppositely charged vortices remain paired at low temperature, while spin waves produce a critical phase with a continuously varying decay exponent. Heating allows vortex pairs to separate; large-distance screening by the unbound vortices destroys the algebraic behavior.

Kosterlitz’s recursion analysis follows the coupled evolution of vortex activity and stiffness under changes of scale #cite(label("Kosterlitz1974")). Here activity measures the weight of vortex defects, and stiffness measures the response to a slowly varying twist of the angle field. Bound pairs can change this response, so the coefficient visible at large distances is renormalized. Nelson and Kosterlitz predicted the universal limit $2 \/ pi$ for the dimensionless renormalized stiffness from the low-temperature side, and expected it to vanish above the transition #cite(label("NelsonKosterlitz1977")).

Fröhlich and Spencer established the transition for several two-dimensional lattice models, including the planar rotator and Villain models #cite(label("FrohlichSpencer1981")). Their multiscale expansion organizes neutral collections of charges and controls their cumulative effect. A detailed modern account for the discrete Gaussian and Villain cases is given by Kharash and Peled #cite(label("KharashPeled2017")). These phase bounds leave the limiting field and its effective coefficient unidentified.

Dimock and Hurd controlled the infrared renormalisation flow for the sine-Gordon model with a fixed ultraviolet cutoff, for each fixed coefficient above $8 pi$ in their normalization and sufficiently small activity, with estimates uniform in torus volume #cite(label("DimockHurd2000")). Falco constructed a critical renormalisation trajectory at small activity for the lattice Coulomb gas and obtained critical two-point asymptotics for fractional charges, including logarithmic corrections #cite(label("Falco2012")) #cite(label("Falco2013")). Using this approach at the physical threshold of a fixed lattice model requires a controlled passage from microscopic data to a dilute effective system. This matching problem already appears in the discussion of #cite(label("KosterlitzThouless1973"), form: "prose").

For discrete Gaussian heights, Bauerschmidt, Park, and Rodriguez smooth the microscopic law to exponentially small activity and prove the macroscopic torus Gaussian limit at sufficiently high temperature #cite(label("BPR2024I")). They also developed infinite-volume and mesoscopic scaling limits in #cite(label("BPR2024II"), form: "prose"). Park subsequently proved high-temperature central limit theorems for microscopic multipoint observables #cite(label("Park2025Multipoint")). Conjecture 1.3 of #cite(label("BPR2024I"), form: "prose") predicts the torus Gaussian limit through a critical temperature for sufficiently spread-out $J_rho$, together with the endpoint value, infinite right slope, differentiability above the transition, and spread-out asymptotics. The discussion following that conjecture also predicts the fixed-interaction conclusions for every finite range. Theorem 1 states these conclusions for every admissible $J$, including nearest neighbors, with the critical temperature identified by Equation (1.3).

The structural side of the argument also draws on a substantial probabilistic literature. Regev and Stephens-Davidowitz proved the finite lattice Gaussian inequalities used below #cite(label("RSD2017")). Aizenman, Harel, Peled, and Shapiro applied Gaussian monotonicity, graph surgery, and level-set methods to depinning and the dual spin phase #cite(label("AizenmanHarelPeledShapiro2022")). Lammers and Ott developed absolute-value correlation inequalities and delocalisation methods #cite(label("LammersOtt2024")). For a broader class of nearest-neighbor square-lattice potentials, Lammers’ dichotomy theory proves a logarithmic variance lower bound with a universal positive coefficient throughout the delocalized phase and shows that the delocalized set is closed in the specified potential topology #cite(label("LammersDichotomy")). The global depinning and dichotomy arguments in these works use planar structure. Our admissible finite-range graphs can be nonplanar, and the structural proofs below cover them directly. Recent critical results for hierarchical discrete Gaussian and related models #cite(label("BiskupHuang2025")) and Gaussian field limits for six-vertex heights #cite(label("DuminilCopinKozlowskiLammersManolescu2026")) concern different interactions and further illustrate the range of height universality.

Villain introduced a periodic Gaussian edge weight as an approximation to the planar cosine model. The Villain duality and the analysis of José, Kadanoff, Kirkpatrick, and Nelson make the Gaussian and vortex components explicit #cite(label("Villain1975")) #cite(label("JoseKadanoffKirkpatrickNelson1977")). The continuum field in our limit is imaginary Gaussian multiplicative chaos. Lacoin, Rhodes, and Vargas construct the purely imaginary case for planar Gaussian free fields within their theory of complex chaos #cite(label("LacoinRhodesVargas2015")); Junnila, Saksman, and Webb develop a general construction and moment and regularity results #cite(label("JunnilaSaksmanWebb2020")). The latter work also proves that suitably normalized critical XOR-Ising spin smears with plus boundary conditions on bounded simply connected planar domains converge to smears of a conformally weighted real part of imaginary chaos. Garban and Sepúlveda stated and sketched a joint limit of the zero-boundary discrete GFF and its Wick exponential on a square, and discussed the expected Villain connection #cite(label("GarbanSepulveda2024")) Proposition 6.3 and the discussion preceding Conjecture 3. Theorem 2 proves the full field statement for both ordinary lattice spin models at sufficiently large fixed inverse temperature. This is distinct from the interface conjecture in that work. Newman and Wu’s angular-gradient theorem uses a temperature that tends to zero with the mesh #cite(label("NewmanWu2018")); here the inverse temperature remains fixed. We derive the smear moment estimates from the finite-graph Lee–Yang theorems recalled by Newman and Wu, including their detailed Villain proof, together with the scalar product representation stated there #cite(label("NewmanWu2019")).

=== 1.5 Proof organization and the new estimates <proof-organization-and-the-new-estimates>

We first construct a structural height coefficient $a \( k \)$ with

#[#set math.equation(numbering: n => "(1.16)")
 $ k = beta \/ v_J^2 \, #h(2em) beta_(upright("eff")) \( J \, beta \) = v_J^2 a \( k \) . $ <main:coefficient-convention>]

Section 2 uses finite lattice Gaussian comparisons, free rectangular boxes, and folded tests to yield Gaussian limits and the alternative $a = 0$ or $a gt.eq 8 pi$. Section 3 uses an annular exploration to transfer the positive-coefficient limit to Dirichlet domains, tori, and domains with pins, and to identify positivity of $a$ with physical roughness. The uniform estimates here must survive exploration conditioning and pin events of small probability.

The local analytic calculus is developed in Section 4. It keeps neutral, charged, boundary, and marked terms in distinct estimates and supplies finite-range covariances and regulators with explicit reserve. Both spin constructions need local corrections that remain controlled under repeated Gaussian integration, including near inserted spins. For Villain, Section 5 uses exact duality to initialize this expansion at the ordinary microscopic model. For XY, the cosine interaction requires an additional estimate: Section 6 represents it exactly and follows the microscopic factors through successive integrations and local subtractions. The estimates distinguish a live Gaussian history from completed scalar calculations, whose evaluated sizes multiply in later operations. Taylor remainders are separated into fixed smooth directions and linear field functionals, called atoms. Estimates for these atoms control the additional Gaussian sources. A bound on the evaluated history, together with separate charge estimates, supplies sizes that compose through the local maps. Section 7 then chooses the three reference quadratic coefficients so that the corrections decay. An exact Hessian identity and a finite-dimensional degree argument keep that choice inside the parameter region where the history estimates hold.

In either spin model, marked estimates give all separated fundamental spin correlations and a common insertion amplitude. The full field law then follows from a uniform two-point bound, Lee–Yang moment bounds, collision estimates, and Sobolev tightness. These steps retain the full Green diagonal in Equation (1.14).

For heights near their physical endpoint, the weak-activity maps of Section 8 require physical initial data: one must first enter their domain from an arbitrary fixed finite-range model. Section 9 compares noisy block averages of the original heights with Gaussian observations. It gives an exact local expansion of this density comparison, with activity as small as the maps require whenever $a \( k \) > 0$. Mixed pinned domains and complex Gaussian lattice comparisons supply control in the required analytic norm. Physical terminal observables select the admissible small trajectory in Section 10. Openness of the supermarginal branch identifies the endpoint value; the marginal trajectory and its response then give the infinite slope. Figure 1 records which arguments must precede this last identification.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite comparisons#linebreak()structural coefficient#linebreak() Section~2]]])])
  content((4.4, 0), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Annular transfer#linebreak()and mixed pins#linebreak() Section~3]]])])
  content((8.8, 0), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Local height entry#linebreak() Section~9]]])])
  content((0, -2.5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Covariances, regulators#linebreak()local partition calculus#linebreak() Section~4]]])])
  content((4.4, -2.5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weak height maps#linebreak()physical diagnostics#linebreak() Sections~8, 10]]])])
  content((8.8, -2.5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Height endpoint#linebreak()and infinite slope#linebreak() Section~10]]])])
  content((0, -5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Villain duality#linebreak()and XY histories#linebreak() Sections~5, 6]]])])
  content((4.4, -5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Tuned flows#linebreak()marked correlations#linebreak() Sections~5, 7]]])])
  content((8.8, -5), [#box(width: 3.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Full spin-field laws#linebreak()and Villain bridge#linebreak() Sections~5, 7]]])])
  line((1.976, 0), (2.424, 0), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.376, 0), (6.824, 0), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.524, -0.725), (5.676, -1.775), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1.976, -2.5), (2.424, -2.5), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.376, -2.5), (6.824, -2.5), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -3.225), (0, -4.275), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((1.976, -5), (2.424, -5), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.376, -5), (6.824, -5), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((4.4, -0.725), (4.4, -1.775), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: Dependencies among the main arguments. The upper route identifies the physical height endpoint; the lower route controls spin insertions and then their full distribution. Arrows show dependencies, not reading order: the local entry construction is presented after the weak maps whose parameters it accepts, and supplies their physical initial data for the endpoint argument. The Villain bridge also uses the high-temperature height result of Section 8, and the endpoint odd-sector argument returns directly to the structural face ratio in Section 2. ],
) <main:dependencies>

== 2 Finite comparisons and the structural height coefficient <st:section>

The output of this section is a coefficient $a \( k \)$ determined by Gaussian limits on free rectangles. Finite lattice comparisons also give the gap $a \( k \) = 0$ or $a \( k \) gt.eq 8 pi$, and localization on the zero branch. Section 3 will relate this coefficient to the physical roughness threshold and to the field on other domains.

Throughout this section $J$ has the hypotheses in the introduction, $v = v_J$,

#[#set math.equation(numbering: n => "(2.1)")
 $ A_0 = - Delta_J \/ v^2 \, #h(2em) k = beta \/ v^2 \, #h(2em) h = sigma in 2 pi bb(Z) . $ <st:normalization>]

An unoriented interaction edge has conductance $c = \( \| J \| v^2 \)^(- 1)$; parallel edges are counted with their multiplicities. Thus $\( g \, A_0 g \) = sum_e c \( nabla_e g \)^2$, and the Fourier symbol of $A_0$ is $\| p \|^2 + O_J \( \| p \|^4 \)$. Write $R_J = max_(z in J) \| z \|_oo$. For a finite rectangle $B$ retain only edges whose two endpoints belong to $B$, and denote the resulting Laplacian and its inverse on constants’ orthogonal complement by $A_B$ and $G_B = A_B^(+)$. A free height law is the probability law modulo common translations by $2 pi bb(Z)$, with weight $exp { - \( h \, A_B h \) \/ \( 2 k \) }$. Pinning one vertex is one choice of representative. All pairings on a finite graph are counting-measure pairings.

Here is a useful convention concerning errors. An edge representation $X = sum_e w_e nabla_e h$ has #emph[flow cost] $sum_e w_e^2 \/ c$. For a zero-sum vertex profile $f$,

#[#set math.equation(numbering: n => "(2.2)")
 $ \( f \, G_B f \) = min_("div" w = f) sum_e w_e^2 \/ c . $ <st:flow>]

Indeed the minimizer is $w = c nabla G_B f$; its difference from every other admissible flow is orthogonal to gradients in the scalar product $sum_e w_e w'_e \/ c$. In particular a test of flow cost $delta$ has variance at most $k delta$ and all its exponential moments have the corresponding Gaussian bound, by Lemma 4. Nearest-neighbor edges, which are present by hypothesis, may always be used to construct trial flows.

=== 2.1 Finite lattice Gaussian inequalities <finite-lattice-gaussian-inequalities>

We start from the lattice inequalities of #cite(label("RSD2017"), form: "prose") Theorem 2.1, Corollary 3.2, and Propositions 3.3 and 4.2 and derive the comparison and limiting forms used below, including proofs to specify the directions. For applications of these inequalities to integer-height depinning and graph surgery, see #cite(label("AizenmanHarelPeledShapiro2022"), form: "prose").

#thm([Lemma 2.1.])[
  (Finite Gaussian comparisons).  #emph[Let $cal(L)$ be a lattice in a finite-dimensional Euclidean space $E$, let $V = "span" cal(L)$, and let $P_V$ be orthogonal projection onto $V$. Suppose $T gt.eq 0$ is symmetric and $T_V = P_V T \|_V$ is positive definite. For $x in E$ set $w_T \( x \) = sum_(u in cal(L) + x) exp { - \( u \, T u \) \/ 2 }$. Then 
#[#set math.equation(numbering: n => "(2.3)")
 $ w_T \( 0 \)^2 w_T \( x + y \) w_T \( x - y \) gt.eq w_T \( x \)^2 w_T \( y \)^2 . $ <st:lattice-inequality>]

 The covariance of the Gaussian on $cal(L) + x$ is at least that on $cal(L)$ at the same precision, in positive-semidefinite order; the same lower bound holds after a real linear tilt of the shifted law. For each fixed ambient displacement $x$, the ratio $w_(T + t B) \( x \) \/ w_(T + t B) \( 0 \)$ is nonincreasing in $t gt.eq 0$ whenever $B gt.eq 0$. For the centered Gaussian $H$ on $cal(L)$, every real linear test $X = \( ell \, H \)$ satisfies 
#[#set math.equation(numbering: n => "(2.4)")
 $ 1 / 2 "Var" \( X \) lt.eq log bb(E) e^X lt.eq 1 / 2 \( ell_V \, T_V^(- 1) ell_V \) \, #h(2em) ell_V = P_V ell . $ <st:mgf-sandwich>]

 Centered variances and real moment generating functions decrease when precision increases. For any two real linear tests, 
#[#set math.equation(numbering: n => "(2.5)")
 $ kappa \( X \, X \, Y \, Y \) = bb(E) X^2 Y^2 - bb(E) X^2 bb(E) Y^2 - 2 \( bb(E) X Y \)^2 gt.eq 0 . $ <st:paired-cumulant>]

 The centered characteristic function is strictly positive, and its logarithm has Hessian everywhere at least its Hessian at zero. These centered conclusions apply after added centered pins or equalities. For free graphs they apply to real tests annihilating every released constant. The centered characteristic function is strictly positive for characters invariant under every released translation, and its logarithmic Hessian comparison holds along directions annihilating those constants. The probability of a specified collection of centered lattice equalities increases under a positive-semidefinite increase of precision.]
] <st:finite-gaussian>

#proof[
  For $d in cal(L) \/ 2 cal(L)$ put $z_d \( s \) = sum_(u in d + 2 cal(L)) e^(- \( u + s \, T \( u + s \) \) \/ 4)$. Coercivity on $V$ makes these sums and their derivatives locally uniformly convergent for ambient shifts. The bijection $\( u \, v \) mapsto \( u + v \, u - v \)$ gives
  $ w_T \( x \) w_T \( y \) = sum_d z_d \( x + y \) z_d \( x - y \) \, #h(2em) sum_d z_d \( s \)^2 = w_T \( 0 \) w_T \( s \) . $
  Cauchy–Schwarz proves Equation (2.3). Taking logarithms and differentiating twice in $y$ at zero gives $D^2 log w_T \( x \) gt.eq D^2 log w_T \( 0 \)$. Direct differentiation of the sum gives $D^2 log w_T \( x \) = - T + T "Cov"_x \( H \) T$. Both covariances are supported on $V$. Restricting the Hessian inequality to directions in $V$ and inverting $T_V$ there proves covariance minimality.
  For $x_T = T_V^(- 1) P_V T x$ and $u in V$, completion of the square gives
  $ \( u + x \, T \( u + x \) \) = \( u + x_T \, T_V \( u + x_T \) \) + c_T \( x \) \, #h(2em) c_T \( x \) = \( x \, T x \) - \( x_T \, T_V x_T \) gt.eq 0 . $
  For fixed $x$ and $T_t = T + t B$, $B gt.eq 0$, differentiation in the ambient space gives
  $ frac(d, d t) log frac(w_(T_t) \( x \), w_(T_t) \( 0 \)) = - 1 / 2 "tr" #scale(x: 120%, y: 120%)[\[] B \( "Cov"_x \( H \) - "Cov"_0 \( H \) + bb(E)_x H ⊗ bb(E)_x H \) #scale(x: 120%, y: 120%)[\]] lt.eq 0 . $
  This derivative keeps the ambient displacement fixed and includes the $T_t$-dependence of both $x_(T_t)$ and the normal scalar $c_(T_t) \( x \)$. A real tilt by $ell$ changes the effective displacement on $V$ to $x_T - T_V^(- 1) ell_V$. Its covariance therefore still dominates the centered covariance. For the centered law, integrating the Hessian of its logarithmic moment generating function on the segment from $0$ to $ell$ proves the first inequality in Equation (2.4); symmetry makes the first derivative at zero vanish. Differentiating this logarithmic moment generating function with respect to $T_t$ gives the same nonpositive expression with the tilted covariance and mean. Differentiating the resulting centered comparison twice at zero proves the variance comparison. The second derivative at $s = 0$ of $"Var"_(s Y) \( X \) gt.eq "Var"_0 \( X \)$ proves Equation (2.5).
  Let $cal(L)^(*)$ be the dual lattice in $V$. Poisson summation on $V$ gives
  $ w_T \( x \) = e^(- c_T \( x \) \/ 2) C_(T_V) sum_(q in cal(L)^(*)) e^(- 2 pi^2 \( q \, T_V^(- 1) q \)) e^(2 pi i \( q \, x_T \)) lt.eq w_T \( 0 \) . $
  Completion of the square now proves the upper bound in Equation (2.4). For the centered characteristic function, the same summation gives the strictly positive formula
  $ bb(E) e^(i \( ell \, H \)) = frac(sum_(q in cal(L)^(*)) e^(- 1 / 2 \( 2 pi q - ell_V \, T_V^(- 1) \( 2 pi q - ell_V \) \)), sum_(q in cal(L)^(*)) e^(- 2 pi^2 \( q \, T_V^(- 1) q \))) > 0 . $
  It is a shifted-to-centered partition ratio on the dual lattice. Equation (2.3) there proves the assertion about its logarithmic Hessian.
  A collection of centered equalities selects $cal(L)_E = cal(L) ∩ ⋂_j ker ell_j$, a lattice in its span. The restricted precision is coercive, so the preceding argument applies directly to its conditional centered law. In particular the displayed dual sum proves strict characteristic positivity there. This law is also the dominated limit of the additional precisions $t sum_j ell_j ⊗ ell_j$, $t arrow.t oo$, which transfers the centered comparisons with the original law.
  For a free graph choose one representative $h_(x_0) = 0$ on each connected component. Its representative lattice has a span on which the massless graph precision is coercive. The same dual formula directly proves strict characteristic positivity on that centered law, and hence for its translation-invariant characters. To compare a graph with a cut graph, first add $eta "Id"$. On a connected component choose representatives $h_(x_0) = 0$ and sum its common translation $2 pi j$. Completion of the square shows that this sum, divided by $\( 2 pi eta \| B \| \)^(- 1 \/ 2)$, tends to a constant independent of the representative and is uniformly bounded for $0 < eta lt.eq eta_0$. The remaining representative weight is bounded by a constant times its massless weight and converges pointwise to it. Dominated convergence, also after any fixed real tilt annihilating constants, transfers the comparison inequalities. The same argument applies to bounded observations invariant under common $2 pi$ translations, a fact used below for phases. Finally, for an equality event $E$, differentiate its probability along $T + t B$ before taking any infinite-penalty limit. Its logarithmic derivative is $1 / 2 "tr" B \( "Cov" \( H \) - "Cov" \( H divides E \) \) gt.eq 0$ by the just-proved centered pin comparison; both means vanish by inversion symmetry. This proves the last assertion, and dominated limits give its free-graph versions whenever the event is invariant under the released translations. ◻
]

For later use, a consequence of the last Hessian assertion is worth recording. Let $phi.alt$ be the centered characteristic function in Lemma 4, let $s$ be a base profile, and let $Y$ have bare variance at most $V$. On a free graph take $s$ with integer total on each released component and $Y$ with zero total on each. Then

#[#set math.equation(numbering: n => "(2.6)")
 $ sqrt(- log phi.alt \( s + t Y \)) lt.eq sqrt(- log phi.alt \( s \)) + \| t \| sqrt(V \/ 2) . $ <st:coefficient-transfer>]

To prove this, set $f \( t \) = log phi.alt \( s + t Y \) lt.eq 0$. The inequality $f'' gt.eq - V$ and the upper bound $f lt.eq 0$, applied at the maximum of $f \( t \) + f' \( t \) u - V u^2 \/ 2$, imply $\| f' \|^2 lt.eq - 2 V f$. Integration, or regularization at zeros of $- f$, gives Equation (2.6). In particular, a positive lower bound transfers between profiles at bounded bare distance in either direction.

=== 2.2 Saturation on free rectangles <saturation-on-free-rectangles>

Let $B_m = { 0 \, dots.h \, m - 1 }^2$, $g_m \( x \) = x_1 \/ m$, and

#[#set math.equation(numbering: n => "(2.7)")
 $ a_m \( k \) = "Var"_(B_m \, k) \( h \, A_(B_m) g_m \) . $ <st:am>]

The energy $\( g_m \, A_(B_m) g_m \)$ tends to one, by square symmetry and the definition of $v$. Thus $0 lt.eq a_m lt.eq k + o \( 1 \)$.

#thm([Theorem 2.2.])[
  (All free-rectangle limits).  #emph[There is a number $a = a \( k \) in \[ 0 \, k \]$ such that $a_m \( k \) arrow.r a$. Let $B_n$ be discrete axis rectangles at mesh $n^(- 1)$ whose endpoints converge to those of a fixed nondegenerate rectangle $B$. For every finite collection of smooth shifts $g$ on a neighborhood of $overline(B)$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ log bb(E)_(B_n \, k) exp { \( h \, A_(B_n) g \( dot.op \/ n \) \) } arrow.r a / 2 integral_B \| nabla g \|^2 . $ <st:rectangle-laplace>]

 The corresponding tests converge jointly to centered Gaussian variables with covariance $a integral_B nabla g dot.op nabla g'$; all joint moments converge. For zero-total profiles $f_n$ whose scaled piecewise constant densities $n^2 f_n$ converge in $L^2 \( B \)$ to a bounded piecewise continuous $f$ of integral zero, the corresponding assertion is 
#[#set math.equation(numbering: n => "(2.9)")
 $ log bb(E)_(B_n \, k) e^(\( h \, f_n \)) arrow.r a / 2 \( f \, \( - Delta_(B \, N) \)^(- 1) f \)_(L^2 \( B \)) . $ <st:rectangle-smear>]

 Here the inverse Neumann Laplacian is on integral-zero functions. These statements hold along every such sequence of rectangles and jointly for mixed finite lists of the displayed tests.]
] <st:free-rectangle-limit>

#proof[
  We give separately the cutting, folding, and distributional steps.
  #emph[Cutting and the existence of $a$.] Cut a square of side $M$ into $m$-squares and strips of width less than $m$. In its affine observation $x_1 \/ M$, the squared cost of omitted seam and strip flows is at most $C_J \( m^(- 1) + m \/ M \)$: there are at most $C_J \( M^2 \/ m + m M \)$ affected edges and each coefficient is at most $C_J \/ M$. On the remaining squares the observation is $m \/ M$ times the cell observation. Cutting increases variance, and the cut components are independent. The triangle inequality in $L^2$ consequently gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ sqrt(a_M) lt.eq sqrt(a_m) + C_J sqrt(k) \( m^(- 1) + m \/ M \)^(1 \/ 2) . $ <st:cut-am>]
  First let $M arrow.r oo$, then take $m arrow.r oo$ along a liminf subsequence. This proves convergence. Notice also that each $a_m \( k \)$ is continuous for $k > 0$, by locally uniform convergence of its defining Gaussian sums, and Equation (2.10) is uniform when $k$ ranges over a compact subset of $\( 0 \, oo \)$. In particular $sqrt(a \( k \)) lt.eq sqrt(a_m \( k \)) + C_J sqrt(k \/ m)$. Square symmetries make the covariance matrix of the two affine tests scalar. Cutting a rectangle into small squares proves the affine upper bound $a integral_B \| nabla g \|^2$. For its reverse, let $m_1 \( n \) \, m_2 \( n \)$ be the rectangle’s side counts and set $V_n \( p \) = "Var"_(B_n) \( h \, A_(B_n) \( p dot.op x \/ n \) \)$. Tile a square of side $M$, divisible by both side counts, with copies of this rectangle. The normalized affine test $p dot.op x \/ M$ restricts on each cell to $n \/ M$ times the cell test, up to an irrelevant constant. There are $M^2 \/ \( m_1 \( n \) m_2 \( n \) \)$ cells. Cutting and the seam-flow estimate, followed by $M arrow.r oo$ at this fixed $n$, give
  $ sqrt(a) thin \| p \| lt.eq n / sqrt(m_1 \( n \) m_2 \( n \)) sqrt(V_n \( p \)) + C_(J \, k \, p) / sqrt(min \( m_1 \( n \) \, m_2 \( n \) \)) . $
  Since $m_1 \( n \) m_2 \( n \) \/ n^2 arrow.r \| B \|$, this proves $liminf_n V_n \( p \) gt.eq a \| p \|^2 \| B \|$ along every admissible rectangle sequence. Together with the cutting upper bound it gives
  $ lim_n "Var"_(B_n) \( h \, A_(B_n) g \) = a integral_B \| nabla g \|^2 $
  for every affine $g$ and every such sequence.
  Cutting into cells of small fixed macroscopic diameter and replacing $nabla g$ by constants proves, for smooth or continuous piecewise smooth $g$ with bounded piece derivatives and polygonal interfaces,
  #[#set math.equation(numbering: n => "(2.11)")
   $ limsup_n "Var" \( h \, A_(B_n) g \) lt.eq a integral_B \| nabla g \|^2 . $ <st:upper-energy>]
  At a fixed partition the omitted edge count is $O \( n \)$ and coefficients are $O \( n^(- 1) \)$, so their cost tends to zero. In cell interiors the error cost is bounded by the $L^2$ modulus of continuity of the gradient, which tends to zero as the partition is refined. The identical proof applies to partial gradient observations restricted to polygonal pieces.
  Call a shift $g$ saturated on $B$ if, for every admissible sequence of discrete rectangles $B_n$ converging to $B$,
  $ lim_(n arrow.r oo) "Var"_(B_n) \( h \, A_(B_n) g \( dot.op \/ n \) \) = a integral_B \| nabla g \|^2 . $
  For a partial gradient observation use the same full-limit definition with the energy integral over its retained region.
  This class is linear. Fix a finite list of saturated shifts and any admissible rectangle sequence. From any subsequence one can extract a further subsequence on which their covariance matrix converges, by the bare bounds. If $C$ is that limiting matrix and $E_(i j) = a integral_B nabla g_i dot.op nabla g_j$, then Equation (2.11), applied to every real linear combination, gives $E - C gt.eq 0$. Full convergence for each $g_i$ gives $\( E - C \)_(i i) = 0$ on this same subsequence. A positive-semidefinite matrix with zero diagonal has all its entries zero. Thus $C = E$. Since this applies to every initial subsequence, the covariance matrices converge along the original sequence. In particular every finite linear combination is saturated.
  Saturation on a larger rectangle passes to an enclosed rectangle. Partition the complement into finitely many rectangles, indexed together with the inner rectangle by $i = 0 \, dots.h \, r$, and write $E_i = integral_(B_i) \| nabla g \|^2$. Vanishing seam-flow errors and cutting give
  $ V_(upright("outer") \, n) lt.eq sum_(i = 0)^r V_(i \, n) + o \( 1 \) . $
  The outer variance converges to $a sum_i E_i$, while $limsup_n V_(i \, n) lt.eq a E_i$ for every piece. Consequently
  $ liminf_n V_(0 \, n) gt.eq a sum_i E_i - sum_(i = 1)^r limsup_n V_(i \, n) gt.eq a E_0 . $
  Together with the upper bound this is full convergence on the inner rectangle, on every admissible sequence. Strict enlargements suffice; compatible rounding of the partition changes only vanishing-cost flows.
  The class is also closed under gradient-energy approximation. If $g_j$ are saturated and $parallel nabla \( g_j - g \) parallel_(L^2 \( B \)) arrow.r 0$, with convergence of the corresponding discrete difference energies, then the bare bound and the triangle inequality for standard deviations give
  $ limsup_n lr(|sqrt("Var" \( h \, A_(B_n) g \)) - sqrt(a) thin parallel nabla g parallel_(L^2 \( B \))|) lt.eq \( sqrt(k) + sqrt(a) \) parallel nabla \( g - g_j \) parallel_(L^2 \( B \)) . $
  Letting $j arrow.r oo$ proves full convergence for $g$. The same argument shows that an observation changed by a flow of cost tending to zero retains its full variance limit. These statements apply to the fixed smooth and continuous piecewise smooth shifts used below, whose discrete energies converge by Riemann summation.
  #emph[The fold.] We justify the FKG correlation input #cite(label("FKG1971")) directly. A quadratic attractive height law has the lattice condition $p \( u and v \) p \( u or v \) gt.eq p \( u \) p \( v \)$, since it holds edge by edge for $e^(- c \( h_x - h_y \)^2 \/ \( 2 k \))$. On a finite height box this condition implies association by induction in the number of vertices. Conditional laws in one fewer coordinate satisfy the same condition. Between two values of the last coordinate the likelihood ratio of their conditional laws is increasing. The induction hypothesis applied to that ratio proves that the conditional expectation of every increasing function increases. The conditional covariance decomposition and the one-variable identity $"Cov" \( F \( Z \) \, G \( Z \) \) = 1 / 2 bb(E) \[ \( F \( Z \) - F \( Z' \) \) \( G \( Z \) - G \( Z' \) \) \] gt.eq 0$ complete the induction. Letting the box grow proves association in our proper finite Gaussian law. This argument also proves association after conditioning any set of vertices.
  Suppose a rectangle and its discrete graph are invariant under reflection across a site axis or diagonal. Pin a site of the reflection line and condition its entire height trace. The conditional law remains invariant under reflection and associated, including interactions crossing the line. For a saturated shift odd about that line up to a constant, let $X_(+)$ and $X_(-)$ be its observations on edges internal to the two open sides. Then $X_(-)$ is the reflected negative of $X_(+)$ and their sum differs from the full observation by a vanishing-cost flow. If $X_(+)$ can be changed by such a flow to have nonnegative off-line vertex coefficients, conditional association gives a nonpositive conditional covariance with $X_(-)$. Their conditional means are negatives, so the unconditional covariance is also nonpositive. Write $V_(plus.minus \, n) = "Var" \( X_plus.minus \)$ and $E_plus.minus = integral_(B ∩ { plus.minus upright(" side") }) \| nabla g \|^2$. The vanishing-cost modifications give $"Cov" \( X_(+) \, X_(-) \) lt.eq o \( 1 \)$, and the full observation differs from $X_(+) + X_(-)$ by a vanishing-cost flow. Its full variance convergence therefore gives
  $ a \( E_(+) + E_(-) \) = lim_n V_(upright("full") \, n) lt.eq liminf_n \( V_(+ \, n) + V_(- \, n) \) . $
  More directly, $V_(+ \, n) gt.eq V_(upright("full") \, n) - V_(- \, n) - o \( 1 \)$, so the separate upper bound gives
  $ liminf_n V_(+ \, n) gt.eq a \( E_(+) + E_(-) \) - limsup_n V_(- \, n) gt.eq a E_(+) . $
  The same argument applies to the minus side. With $limsup_n V_(plus.minus \, n) lt.eq a E_plus.minus$, both partial variances converge along the full sequence. The folded-shift observation differs from its partial observation by a vanishing-cost flow, so it too has the required full variance limit.
  Here are the required coefficient checks and error bounds. For an axis fold of $g = x_1$, pair each step $\( z_1 \, z_2 \)$ with $\( - z_1 \, z_2 \)$. The coefficients of $A_(B_(+)) g$ vanish away from the two normal-face strips, are nonpositive in the strip adjacent to the cut, and nonnegative at the outer normal face. Tangential boundaries preserve this cancellation. Move every cut-strip coefficient to the conditioned line along at most $R_J + 1$ nearest-neighbor edges. There are $O \( n \)$ coefficients of size $O \( n^(- 1) \)$, and the paths have bounded overlap, giving cost $O \( n^(- 1) \)$. Thus $\( x_1 - t \)_(+)$ is saturated after coherent rounding of the reflection line and restriction from an enclosing symmetric rectangle. Finite linear combinations and gradient approximation give every smooth function of either coordinate.
  For the diagonal fold put $Y = y + t$ and use an enclosing square $p lt.eq x \, Y lt.eq q$. Take $g = F \( x \) - F \( Y \)$ with $F''' < 0$ and $F' \( p \) \, F' \( q \) > 0$ on a slightly larger interval. In the interior of $x > Y$, $A_B g gt.eq 0$: the symmetric second differences of $F$ decrease with their center, and the step lists in the two coordinates coincide. At the outer face $x = q$ the missing-step contribution has leading term a positive constant times $F' \( q \) \/ n$; at $Y = p$ it has leading term a positive constant times $F' \( p \) \/ n$. The tangential first-order terms cancel in pairs. Uniform strict endpoint positivity absorbs the $O \( n^(- 2) \)$ remainder. More precisely, in integer coordinates $P lt.eq i \, j lt.eq Q$, the exceptional sets can be taken as $D = { 0 < i - j lt.eq 2 R_J }$ and $K = { Q - i lt.eq R_J \, med j - P lt.eq R_J }$. Outside $D$ neither the lower $i$-face nor the upper $j$-face truncates a step; outside $K$ the other two faces cannot both truncate. This proves the stated sign everywhere outside $D union K$. Move all coefficients in $D union K$ horizontally from $\( i \, j \)$ to $\( j \, j \)$ on the line. There are $O \( n \)$ short paths of length at most $2 R_J$ and $O \( 1 \)$ paths of length $O \( n \)$, with bounded overlap. Their coefficients have size $O \( n^(- 1) \)$. If the overlap is $M$, their cost is at most $\( M \/ c \) sum_v d \( v \)^2 \| P_v \| = O \( n^(- 1) \)$. Define the opposite-side modification by reflected negative, so the line terms cancel exactly. The fold criterion proves saturation of
  #[#set math.equation(numbering: n => "(2.12)")
   $ \( F \( x \) - F \( y + t \) \) upright(bold(1))_({ x > y + t }) . $ <st:diagonal-fold>]
  Every smooth $F$ on the fixed interval is a difference of two functions with the strict properties just used: add a sufficiently large fixed cubic with negative third derivative, and then a sufficiently large positive linear function. Thus Equation (2.12) is saturated for arbitrary smooth $F$.
  For clarity, coherent rounding preserves these full limits. Choose $t_n = r_n \/ n$ with $r_n = "round" \( n t \)$, and enclose the target rectangle in the exactly symmetric lattice square $P_n lt.eq i lt.eq Q_n$, $P_n - r_n lt.eq j lt.eq Q_n - r_n$. Its reflection is $\( i \, j \) mapsto \( j + r_n \, i - r_n \)$, and its scaled endpoints can be chosen to converge. The odd seed $F \( x \) - F \( y + t_n \)$ differs from the fixed saturated seed $F \( x \) - F \( y + t \)$ by discrete gradient energy $O \( \| t_n - t \|^2 \)$. For the folded functions $f_(t_n) \, f_t$ of Equation (2.12), the squared difference energy is at most $C \( \| t_n - t \| + n^(- 1) + \| t_n - t \|^2 \)$. Indeed the strip between their diagonals, enlarged by $R_J \/ n$, meets $O \( n^2 \| t_n - t \| + n \)$ edges, each carrying an $O \( n^(- 1) \)$ difference increment; away from it, smooth derivative differences are $O \( \| t_n - t \| \)$. Axis hinges satisfy the same estimate. Thus the fold and restriction limits transfer to each fixed target shift along every admissible rectangle sequence by the vanishing-cost perturbation bound.
  To see that these folds suffice, extend a smooth target $g$ slightly and choose a smooth family $F_t$ of compact support in $t$, on all relevant parameters, satisfying $F'_t \( x \) = - g_(x y) \( x \, x - t \)$. Differentiating the integral of Equation (2.12) gives
  $ partial_x partial_y integral \( F_t \( x \) - F_t \( y + t \) \) upright(bold(1))_({ x > y + t }) thin d t = - F'_(x - y) \( x \) = g_(x y) \( x \, y \) . $
  The residual is a sum of two univariate functions. Riemann sums of this integral converge in gradient $L^2$: translations of the bounded piecewise smooth gradients are continuous in $L^2$, including across the moving diagonal. The bare bound then transfers saturation to $g$.
  #emph[Laplace transforms and smears.] The lower bound in Equation (2.8) follows from saturation and Equation (2.4). For the upper bound, cut into cells of side comparable to a small fixed $r$. For fixed $r$, the discarded-flow observation $E_n$ has bare variance tending to zero. Hölder with exponents $p > 1$ and $p \/ \( p - 1 \)$ removes $E_n$ at a cost tending to zero. Precision comparison bounds the remaining log transform by the sum of independent cell log transforms with argument $p$. Each cell variable has bare variance $O \( r^2 \)$, so its subGaussian bound gives
  $ log bb(E) e^(p X) = 1 / 2 p^2 "Var" X + O_p \( r^3 \) \, $
  uniformly in the fine mesh. For example Taylor’s integral remainder is bounded by $C_p bb(E) \[ \| X \|^3 e^(p \| X \|) \] = O_p \( r^3 \)$ using the Gaussian tail. There are $O \( r^(- 2) \)$ cells. Apply Equation (2.11), let $n arrow.r oo$, then $r arrow.b 0$, then $p arrow.b 1$. This proves the matching upper bound. Apply it to arbitrary linear combinations to obtain the joint law; the uniform exponential bounds give convergence of moments.
  Finally nearest-neighbor Poincaré gives $parallel u - macron(u) parallel_2^2 lt.eq C_B n^2 \( u \, A_(B_n) u \)$. Consequently the bare variance of a density error is bounded by its scaled $L^2$ norm squared. Approximate $f$ by finitely many nonconstant Neumann cosines of the rectangle, and use their smooth inverse-Laplacian shifts. For a Neumann shift, $n^2 A_(B_n) g$ converges in density $L^2$ to $- Delta g$: interior errors vanish by Taylor expansion; boundary coefficients are $O \( n^(- 2) \)$ because the normal derivative vanishes and tangential steps cancel. At corners both derivatives vanish. The $O \( n \)$ boundary-layer sites have vanishing scaled area, so their bounded scaled errors disappear. Use the actual discrete rectangle endpoints in this approximation and then let them converge. Poincaré and bare domination complete the density approximation and prove Equation (2.9) and its joint version. ◻
]

A face probability can also be used in the zero-total smear conclusions. Replacing it by a uniform strip of width $r$ costs at most $C_J r + O \( n^(- 1) \)$: send each row’s mass normally over distance at most $r n$ with currents $O \( n^(- 1) \)$. Apply Theorem 5 at fixed $r$ and then let $r arrow.b 0$. In particular, differences of face and volume probabilities have bounded bare cost, and have variance tending to zero when $a = 0$.

=== 2.3 Neutral charges and the fractional mean <neutral-charges-and-the-fractional-mean>

For a free graph, $w_B \( s \) = bb(E) e^(i \( h \, s \))$ is well defined independently of the representative whenever $sum_x s_x in bb(Z)$. Pin a vertex $o$ and apply Poisson summation in the remaining $2 pi bb(Z)$ coordinates. Extending a residual profile by its opposite sum at $o$ identifies its quadratic form with the free inverse-Laplacian form. The result is the exact identity

#[#set math.equation(numbering: n => "(2.13)")
 $ w_B \( s \) = frac(sum_(q in bb(Z)^B : thin sum q = sum s) e^(- k / 2 \( q - s \, G_B \( q - s \) \)), sum_(q in bb(Z)^B : thin sum q = 0) e^(- k / 2 \( q \, G_B q \))) in \( 0 \, 1 \] . $ <st:poisson-charge>]

There is no $2 pi$ in the dual energy, because the height spacing is $2 pi$. Let $nu_B$ be the centered neutral charge law in the denominator. Twice differentiating Equation (2.13) at $s = 0$ in directions $A_B g \, A_B g'$ gives

#[#set math.equation(numbering: n => "(2.14)")
 $ "Cov"_(nu_B) \( \( q \, g \) \, \( q \, g' \) \) = k^(- 1) \( g \, A_B g' \) - k^(- 2) "Cov"_B \( \( h \, A_B g \) \, \( h \, A_B g' \) \) . $ <st:dual-covariance>]

At an arbitrary integer-total profile, one differentiation gives

#[#set math.equation(numbering: n => "(2.15)")
 $ partial_(A_B g) log w_B \( s \) = k \( g \, bb(E)_s \( q - s \) \) . $ <st:dual-mean>]

The dual Gaussian comparison implies that the Hessian of $log w_B$ in neutral directions is at least its centered Hessian, namely minus the height covariance. Equation (2.6) applies here.

We will also use the following replica identity, with no limiting assumption. For two independent centered height copies let $S = h_1 + h_2$ and $D = h_1 - h_2$. Condition on their common parity class modulo $4 pi bb(Z)$ after pinning. Then $S \, D$ are conditionally independent and identically distributed, each with half the original precision. For linear tests $i \, j$, put $V_(i j) = bb(E) \[ S_i S_j divides upright("parity") \]$. Expansion of the two independent copies gives

#[#set math.equation(numbering: n => "(2.16)")
 $ bb(E) V_(i j) = 2 "Cov" \( h_i \, h_j \) \, #h(2em) "Cov" \( V_(i j) \, V_(r s) \) = 2 kappa \( h_i \, h_j \, h_r \, h_s \) . $ <st:replica-covariance>]

Indeed $bb(E) \[ V_(i j) V_(r s) \] = bb(E) \[ S_i S_j D_r D_s \]$ by conditional independence; the terms with an odd number of factors from either copy vanish, and the remaining terms are $2 bb(E) \[ h_i h_j h_r h_s \] + 2 C_(i j) C_(r s) - 2 C_(i r) C_(j s) - 2 C_(i s) C_(j r)$. Subtract $4 C_(i j) C_(r s)$.

#thm([Theorem 2.3.])[
  (Uniform fractional mean).  #emph[Suppose $a \( k \) > 0$, and let $u_m$ be the uniform probability on $B_m$. Then $\( h \, u_m \)$ modulo $2 pi$ converges to uniform measure on the circle, independently of the Gaussian observations in Theorem 5 on a square. More generally, for every fixed $l in bb(Z) \\ { 0 }$ and every sequence of zero-total profiles $t_m$ of uniformly bounded bare inverse energy, 
#[#set math.equation(numbering: n => "(2.17)")
 $ w_(B_m) \( l u_m + t_m \) arrow.r 0 . $ <st:vanishing-phase>]

]
] <st:fractional-mean>

#proof[
  Write $g_m = \( x_1 - \( m - 1 \) \/ 2 \) \/ m$, $X = \( h \, A_B g_m \)$, and $Y = \( h \, rho - u_m \)$, where $rho$ is the uniform right-face probability. The flow bound makes $Y$ uniformly subGaussian. Reflection changes $X$ to $- X$ and exchanges right and left faces, so
  #[#set math.equation(numbering: n => "(2.18)")
   $ "Cov" \( X \, Y \) arrow.r a \/ 2 . $ <st:face-covariance>]
  Here is a discrete verification of the normalization. The profile $A_B g_m$ is supported in fixed-width side layers. Except in boundedly many corner sites, its right-layer row sums are constant, its left-layer row sums are their negatives, and all other sums vanish, by pairing steps. Transport these coefficients to their respective faces along bounded paths; the cost is $O \( m^(- 1) \)$. Corner discrepancies of size $O \( m^(- 1) \)$ can be routed along $O \( m \)$ paths, at cost $O \( m^(- 1) \)$. Thus $A_B g_m - t_m \( rho_R - rho_L \)$ has vanishing flow cost. Pairing with $g_m$ and using $\( g_m \, A_B g_m \) arrow.r 1$ gives $t_m arrow.r 1$. This proves Equation (2.18).
  Fix $l eq.not 0$ and suppose along a subsequence $w_B \( l u_m \) arrow.r r > 0$. Uniform subGaussian bounds on $X \, Y$ allow a further subsequence on which
  $ F_m \( t \, u \) = bb(E) exp { i l \( h \, u_m \) + i t X + i u Y } $
  converges locally uniformly with all derivatives on $bb(C)^2$. This follows from the uniform bound $\| F_m \( t \, u \) \| lt.eq bb(E) e^(\| Im t \| \| X \| + \| Im u \| \| Y \|)$, Cauchy’s formula, and a diagonal Arzelà–Ascoli argument. The limit $F$ is real and nonnegative on $bb(R)^2$ by Equation (2.13).
  The Gaussian limit and moment convergence of $X$ imply $"Var" \( V_(X X) \) = 2 kappa \( X \, X \, X \, X \) arrow.r 0$. The fourth moments of $Y$ are bounded, so $"Var" \( V_(Y Y) \)$ is bounded. By Equation (2.16),
  $ "Var" \( V_(X Y) \) = 2 kappa \( X \, X \, Y \, Y \) = "Cov" \( V_(X X) \, V_(Y Y) \) arrow.r 0 . $
  Multiply $V_(X X)$ or $V_(X Y)$ by the conditional characteristic function of $D$ with phase $l macron(D) + t D_X + u D_Y$. Its modulus is at most one, so the concentration just proved and conditional independence permit replacement of $V_(i j)$ by $2 C_(i j)$. Direct expansion in the two original copies gives
  $ bb(E) \[ S_i S_j e^(i \( l macron(D) + t D_X + u D_Y \)) \] = - 2 \( F_m F_(m \, i j) - F_(m \, i) F_(m \, j) \) . $
  Since $bb(E) e^(i \( l macron(D) + t D_X + u D_Y \)) = F_m^2$, it follows wherever $F > 0$ that $\( log F \)_(t t) = - a$ and $\( log F \)_(t u) = - a \/ 2$. At $\( 0 \, 0 \)$ reflection gives $F_t = 0$. Analytic continuation yields
  #[#set math.equation(numbering: n => "(2.19)")
   $ F \( t \, u \) = F \( 0 \, u \) exp { - a t^2 \/ 2 - a t u \/ 2 } . $ <st:phase-transform>]
  Equation (2.6) ensures $F \( 0 \, l \) > 0$, because the bare cost of $l Y$ is bounded.
  Now join two horizontally adjacent $m$-squares to form a free rectangle, and use its centered neutral charge law. For a charge $q$, let $Q$ be its left total, the right total being $- Q$. Use the following trial quadratic form: in each cell route the residual $q - Q_B rho_B$ with its minimizing internal flow, where $rho_B$ is its seam-face probability; route $Q$ uniformly across the $m$ nearest-neighbor seam edges; add the penalty $Q^2$. The resulting form is
  $ k sum_(B = L \, R) \( q_B - Q_B rho_B \, G_B \( q_B - Q_B rho_B \) \) + D_m Q^2 \, #h(2em) D_m = 1 + k \/ \( c m \) . $
  It dominates the actual precision form $k \( q \, G q \)$ by Equation (2.2). Conditional on $Q$, the trial cells are independent shifted neutral lattice Gaussians, whose affine variances dominate the centered ones. By Equation (2.14) and saturation, their sum tends to $2 \( k - a \) \/ k^2$, exactly the actual variance of the global affine test $x_1 \/ m$ on the two-cell rectangle. Precision comparison gives the opposite upper bound for the trial total variance. Thus the variance, over $Q$, of its conditional affine mean tends to zero.
  The sector weights, after common normalization, are $e^(- D_m Q^2 \/ 2) w_L \( Q rho_L \) w_R \( - Q rho_R \)$. Their normalizing sum is at most $sum_Q e^(- Q^2 \/ 2)$ and the $Q = 0$ term is one. The $Q = l$ term stays positive by Equation (2.6). In that sector Equation (2.15) and Equation (2.19) give $k \( g \, bb(E) \[ q - l rho \] \) arrow.r - a l \/ 2$ in the left cell. Reflection and charge reversal give the same residual pairing in the right cell. The two seam-face contributions to the global affine mean differ by only $O \( m^(- 1) \)$. Its $Q = l$ conditional mean therefore tends to $- a l \/ k eq.not 0$, whereas the $Q = 0$ conditional mean is zero. This contradicts the vanishing sector-mean variance. Thus $w_B \( l u_m \) arrow.r 0$.
  If Equation (2.17) failed, its positive lower bound would transfer to $l u_m$ by Equation (2.6), which is impossible. Joint convergence with the Gaussian observations follows by Fourier polynomials on the circle and joint characteristic functions; tightness on the circle and the already proved Gaussian tightness make this convergence of the full joint law. Exponential bounds extend the joint assertion to moments of the Gaussian coordinates. ◻
]

=== 2.4 The charge gap and a uniform critical-scale ratio <the-charge-gap-and-a-uniform-critical-scale-ratio>

Let $rho_(B \, e)$ be uniform probability on face $e$ of a square, and set $macron(rho)_B = 1 / 4 sum_e rho_(B \, e)$ and $z_m = w_(B_m) \( macron(rho)_(B_m) \) > 0$.

#thm([Lemma 2.4.])[
  (Face ratio with a common constant).  #emph[Fix $J \, k$. Suppose every fixed nonzero integer-total bounded face profile has characteristic coefficient tending to zero as the square side tends to infinity. This hypothesis holds if $a \( k \) > 0$. There are constants $c_(*) = c_(*) \( J \, k \) > 0$ and an integer $G_0$, independent of $G$, such that for #emph[every fixed integer] $G gt.eq G_0$, 
#[#set math.equation(numbering: n => "(2.20)")
 $ liminf_(m arrow.r oo) z_(G m) / z_m gt.eq c_(*) G^(thin 2 - a \( k \) \/ \( 4 pi \)) . $ <st:face-ratio>]

 The fine-size threshold implicit in this liminf may depend on $G$. At $a \( k \) = 8 pi$, the same positive lower bound $c_(*)$ therefore holds for arbitrarily large fixed $G$.]
] <st:critical-face-ratio>

#proof[
  Tile the $G m$-square into $G^2$ cells $B_i$. The restriction of the large square’s face probability to $B_i$ has total $xi_i$ and equals the sum of its exterior-face probabilities with coefficient $1 \/ \( 4 G \)$ per exterior face. Thus $xi$ is supported on boundary cells, $sum_i xi_i = 1$, and $sum_i xi_i^2 lt.eq C \/ G$. For a neutral real profile $r$, let $Q_i = sum_(B_i) r$ and choose a linear map from $Q$ to an antisymmetric nearest-neighbor coarse flow $F$ satisfying $"div" F = Q$ and zero exterior flux. The quadratic form
  #[#set math.equation(numbering: n => "(2.21)")
   $ cal(T)_m \( r \) =  & k sum_i (r_i - sum_e F_(i e) rho_(i \, e) \, G_(B_i) (r_i - sum_e F_(i e) rho_(i \, e)))\
 & + frac(k, c m) sum_(chevron.l i \, j chevron.r) F_(i j)^2 + sum_i Q_i^2 $ <st:trial-precision>]
  is at least $k \( r \, G_(B_(G m)) r \)$: use the internal minimizing flows and send each coarse flux uniformly across the $m$ nearest-neighbor seam edges. The last term is an extra positive penalty. The internal and seam edges are disjoint, so their costs add. The form is positive definite on the neutral space because zero cost forces $Q = 0$ and then $r = 0$.
  In the numerator of Equation (2.13) take $r = q - macron(rho)_(B_(G m))$; in the denominator take $r = q$. Precision monotonicity of a shifted-to-centered ratio shows that replacement by $cal(T)_m$ gives a lower bound for $z_(G m)$. Sum this new partition function by integer cell totals $n_i = sum_(B_i) q$. Then $Q = n - xi$ in the numerator and $Q = n$ in the denominator. Divide both sums by the product of the cells’ centered neutral partition functions. Their internal factors become $product_i w_(B_i) \( s_i \)$, where
  $ s_i = sum_e H_(i e) rho_(i \, e) \, #h(2em) H_(i e) = cases(delim: "{", F_(i e) \, & upright("internal face") \,, 1 \/ \( 4 G \) \, & upright("exterior face in the numerator") \,, 0 \, & upright("exterior face in the denominator") .) $
  In the denominator exterior $H$ is zero. In either case $sum_e H_(i e) = n_i$. All these factors lie in $\( 0 \, 1 \]$. The penalty $exp \( - 1 / 2 sum_i Q_i^2 \)$ is summable over the finite-rank integer sector lattice, uniformly in $m$. Thus dominated convergence is valid at every fixed $G$. Each nonzero denominator sector contains a nonzero integer-total face profile and tends to zero by hypothesis. The zero sector equals one, so the normalized denominator tends to one.
  Keep numerator sectors $n = e_(i_0)$ with $i_0$ at distance at least $G \/ 4$ from the boundary. Write $Y_i = s_i - n_i macron(rho)_(B_i)$. The logarithmic Hessian bound for $w$ gives
  #[#set math.equation(numbering: n => "(2.22)")
   $ product_i w_(B_i) \( s_i \) gt.eq z_m exp {- 1 / 2 sum_i "Var"_(B_i) \( h \, Y_i \)} . $ <st:face-product>]
  For the linear term at zero, inversion symmetry suffices. On the total-one hyperplane put $Psi_B \( H \) = log w_B \( sum_e H_e rho_(B \, e) \)$, where $sum_e H_e = 1$. Equation (2.13) makes this function smooth there, and square symmetry makes its differential at $H_0 = \( 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \, 1 \/ 4 \)$ invariant under the square group. Every tangent vector with zero coordinate sum has group average zero, so this differential vanishes on it. The face coefficients of each $Y_i$ have zero sum, and $n = e_(i_0)$ uses only the base profiles zero and $macron(rho)_(B_i)$.
  Put $D_(i j) = \( H_(i \, + j) - H_(i \, - j) \) \/ 2$ and $S_(i j) = H_(i \, + j) + H_(i \, - j)$. Reflection in each coordinate splits $Y_i$ into two odd face differences and an even remainder. These three pieces have zero mutual covariance by symmetry. The odd differences have limiting variance $a$ and zero cross covariance, as in Equation (2.18); the even remainder has a bounded bare variance times $sum_j S_(i j)^2$, by the face-to-strip flow estimate. Consequently, for fixed $G$ and fixed face coefficients,
  #[#set math.equation(numbering: n => "(2.23)")
   $ limsup_m sum_i "Var" \( h \, Y_i \) lt.eq a sum_(i \, j) D_(i j)^2 + C_(J \, k) sum_(i \, j) S_(i j)^2 . $ <st:face-energy-bound>]
  We construct one coarse flow for each retained sector with bounds uniform in $G \, i_0$. In the continuum square of side $G$, let $x_0$ be the center of cell $i_0$. There is a vector field with divergence $delta_(x_0)$ and constant outer normal flux $1 \/ \( 4 G \)$, of the form
  #[#set math.equation(numbering: n => "(2.24)")
   $ V \( x \) = frac(x - x_0, 2 pi \| x - x_0 \|^2) + E \( x \) \, #h(2em) \| E \( x \) \| lt.eq C \/ G \, quad \| nabla E \( x \) \| lt.eq C \/ G^2 . $ <st:radial-flow>]
  For completeness, subtract the expanding field $\( x - x_(upright("center")) \) \/ \( 2 G^2 \)$, which has divergence $G^(- 2)$ and the desired boundary flux. Solve the resulting zero-Neumann problem by even reflection to the torus of side $2 G$. After rescaling to a fixed torus, subtract cutoff logarithms around its finitely many reflected poles. Their mutual separations and distances from the original boundary are bounded below, uniformly for $x_0 \/ G$ in the central square. The remainder solves a smooth mean-zero Poisson equation with uniformly bounded derivatives. Its Fourier series has coefficients $hat(f) \( p \) \/ \| p \|^2$; repeated integration by parts gives summability after any fixed number of differentiations. This proves the smooth bounds in Equation (2.24), including up to the reflected boundary. Adding back the expanding field proves the assertion.
  Integrate $V$ over the faces of each continuum unit cell, with outward sign, to define $H$. It has divergence $e_(i_0)$ and the prescribed exterior flux. The central faces have bounded fluxes. Off the central cell,
  $ \| S_(i j) \| lt.eq C \( 1 + \| i - i_0 \| \)^(- 2) + C \/ G^2 \, #h(2em) D_(i j) = V_j \( i \) + O \( \( 1 + \| i - i_0 \| \)^(- 2) + G^(- 2) \) . $
  Hence
  #[#set math.equation(numbering: n => "(2.25)")
   $ sum_(i \, j) S_(i j)^2 lt.eq C \, #h(2em) sum_(i \, j) D_(i j)^2 lt.eq frac(1, 2 pi) log G + C . $ <st:radial-cost>]
  The coefficient follows by integrating the squared radial field: $integral_1^(C G) \( 4 pi^2 r^2 \)^(- 1) 2 pi r thin d r = \( 2 pi \)^(- 1) log G + O \( 1 \)$. The comparison of the sum and integral has summable derivative error. The cross term with $E$ is $O \( G^(- 1) sum_(r lt.eq C G) 1 \) = O \( 1 \)$, and $sum \| E \|^2 = O \( 1 \)$. All constants are uniform for the retained cells. The internal part $F$ has divergence $e_(i_0) - xi$. These vectors, for central $i_0$, are linearly independent because their central coordinates are distinct and $xi$ is supported at the boundary. Prescribe the linear flow map on them by this construction and extend it to a basis of the neutral coarse space, using any path flow on the remaining basis vectors. Thus a single quadratic form (2.21) serves all retained sectors; separate nonlinear choices of precision have not been made.
  For these sectors the penalty $parallel e_(i_0) - xi parallel_2^2$ is bounded by a common constant. The crossing cost tends to zero as $m arrow.r oo$ for each fixed $G$. Equations (2.22)–(2.25) therefore give at least $c z_m G^(- a \/ \( 4 pi \))$ from each sector in the liminf of the ratio. There are at least $c' G^2$ retained sectors. Division by the denominator, which tends to one, proves Equation (2.20), with one positive constant for all $G gt.eq G_0$. ◻
]

#thm([Corollary 2.5.])[
  (Exact forbidden range).  #emph[For every admissible $J$ and $k > 0$, 
#[#set math.equation(numbering: n => "(2.26)")
 $ a \( k \) = 0 quad upright("or") quad 8 pi lt.eq a \( k \) lt.eq k . $ <st:gap>]

]
] <st:charge-gap>

#proof[
  If $0 < a < 8 pi$, Theorem 6 gives the hypothesis of Lemma 7. Choose a fixed $G$ so large that its right side exceeds two. The definition of liminf then gives $z_(G m) gt.eq 3 / 2 z_m$ for all sufficiently large $m$. Iteration along $m \, G m \, G^2 m \, dots.h$ contradicts $0 < z_m lt.eq 1$. The upper bound $a lt.eq k$ was proved in Theorem 5. ◻
]

=== 2.5 Localization when the structural coefficient vanishes <localization-when-the-structural-coefficient-vanishes>

#thm([Proposition 2.6.])[
  (Zero coefficient implies localization).  #emph[If $a \( k \) = 0$, there is a finite constant $C_(J \, k)$ such that 
#[#set math.equation(numbering: n => "(2.27)")
 $ sup_(R gt.eq 1) bb(E)_(mu_(J \, v^2 k \, R)^0) h_0^2 lt.eq C_(J \, k) . $ <st:localized-criterion>]

 Moreover, there is a fixed integer $m gt.eq 1$ for which centered height laws on every sufficiently large square torus of side divisible by $m$ satisfy $sup_(x \, y) bb(E) \( h_x - h_y \)^2 lt.eq C_(J \, k \, m)$.]
] <st:zero-localization>

#proof[
  #emph[Good phases at arbitrarily large scales.] Some nonzero mean Fourier coefficient stays positive along a subsequence. Otherwise $w_(B_m) \( j u_m \) arrow.r 0$ for all $j eq.not 0$. Every fixed face profile of integer total $j$ differs from $j u_m$ by a test of variance tending to zero, by the face extension of Theorem 5 at $a = 0$. The inequality $\| bb(E) e^(i U) - bb(E) e^(i V) \| lt.eq sqrt(bb(E) \( U - V \)^2)$ would then give the hypothesis of Lemma 7 with $a = 0$, whose growth contradiction is impossible. Hence along a subsequence, extracted diagonally over $j$,
  $ w_(B_m) \( j u_m \) arrow.r r_j = r_(- j) gt.eq 0 \, #h(2em) r_0 = 1 \, #h(2em) r_l > 0 quad upright("for some ") l gt.eq 1 . $
  Use Equation (2.21) on a $G m$-square, now with shift $l u_(G m)$ instead of the face probability. Cell totals are $Q_i = n_i - l \/ G^2$ in numerator sectors, with $sum_i n_i = l$, and $Q_i = n_i$ in denominator sectors. For each fixed $G$ and sector, the crossing cost vanishes as $m arrow.r oo$. The internal shifted profile differs from $n_i u_m$ by a fixed linear combination of face and volume probabilities of total zero, so its coefficient tends to $r_(n_i)$. The quadratic penalty gives summable domination of the sector sums, exactly as in Lemma 7. Therefore, with $b \( j \) = r_j e^(- j^2 \/ 2)$,
  #[#set math.equation(numbering: n => "(2.28)")
   $ liminf_m w_(B_(G m)) \( l u_(G m) \) gt.eq e^(l^2 \/ \( 2 G^2 \)) frac(b^(* G^2) \( l \), b^(* G^2) \( 0 \)) . $ <st:phase-amplification>]
  The ratio on the right tends to one as $G arrow.r oo$. Here is a direct local limit argument. Normalize $b$ to a probability $p$. It is even, has exponential tails, positive mass at zero, and positive variance since $p \( l \) > 0$. Let $d bb(Z)$ be its support subgroup; then $l in d bb(Z)$. Its characteristic function $psi$ has modulus less than one away from the finitely many points $2 pi j \/ d$ in a period: equality in the triangle inequality, together with $p \( 0 \) > 0$, requires all support phases to equal one. Near each such point, $psi \( t \) = 1 - 1 / 2 sigma^2 \( t - t_0 \)^2 + O \( \| t - t_0 \|^4 \)$. Fourier inversion of $psi \( t \)^N e^(- i l t)$, splitting into fixed small neighborhoods of these points and their complement, gives $p^(* N) \( l \) = d \( 2 pi N sigma^2 \)^(- 1 \/ 2) \( 1 + o \( 1 \) \)$, and the same formula at zero. The complement is exponentially small, and the neighborhood calculation uses $u = sqrt(N) \( t - t_0 \)$ with a Gaussian dominating bound. This proves the ratio claim. Choose $G$ first and then arbitrarily large members $m$ of the subsequence in Equation (2.28). We obtain arbitrarily large scales at which $w \( l u \)$ is arbitrarily close to one.
  #emph[A joint phase bound.] Fix $0 < d_0 < pi \/ 10$. Tile a torus by $m$-squares, with averages $macron(h)_i$. For any $epsilon.alt > 0$ we can choose one of the preceding good scales so that, for every collection $I$ of distinct cells,
  #[#set math.equation(numbering: n => "(2.29)")
   $ bb(P) { "dist" \( l macron(h)_i \, 2 pi bb(Z) \) gt.eq d_0 upright(" for all ") i in I } lt.eq epsilon.alt^(\| I \|) \, $ <st:phase-bad>]
  uniformly in the number of torus cells. We provide the comparison that makes this a joint, rather than single-cell, assertion. Add independent $N \( 0 \, s^2 \)$ noises to the phases and wrap them modulo $2 pi$. Let $p_T \( y \)$ be the resulting joint density. Expanding the wrapped normal introduces integers $j_i$ and the quadratic costs $sum_i \( y_i + 2 pi j_i - l macron(h)_i \)^2 \/ \( 2 s^2 \)$. Together with the height energy these are a lattice Gaussian on the height and $j$ coordinates, shifted only in the $j$ coordinates. Add a small centered height mass to make it positive definite. Increasing the height precision from the cut free cells to the torus therefore decreases $p_T \( y \) \/ p_T \( 0 \)$ by Lemma 4. Let the mass decrease to zero using the translation-invariant clause of that lemma. This yields
  $ frac(p_T \( y \), p_T \( 0 \)) lt.eq product_(i in I) frac(p_i \( y_i \), p_i \( 0 \)) . $
  The wrapped-noise supremum bounds $p_T \( 0 \) lt.eq \( C \/ s \)^(\| I \|)$. Fourier positivity in Equation (2.13) bounds $p_i \( 0 \) gt.eq \( 2 pi \)^(- 1)$. At a good scale the free-cell phase is within any fixed small distance of zero with probability arbitrarily close to one: use $bb(E) cos \( l macron(h) \) = w \( l u \)$ and $1 - cos x gt.eq 1 - cos delta$ when $"dist" \( x \, 2 pi bb(Z) \) gt.eq delta$. Thus, for the noisy free-cell phase,
  $ bb(P) { "dist" \( l macron(h) + Z \, 2 pi bb(Z) \) gt.eq d_0 \/ 2 } lt.eq C e^(- c d_0^2 \/ s^2) + delta_m \, #h(2em) delta_m arrow.r 0 $
  along increasingly good scales. Integrate the density-ratio bound over the product of these bad sets. Conditional on original phases which are all bad at threshold $d_0$, the independent noises retain badness at threshold $d_0 \/ 2$ with probability at least $bb(P) \( \| Z \| lt.eq d_0 \/ 2 \)^(\| I \|)$. Hence the left side of Equation (2.29) is at most
  $ [frac(C, s bb(P) \( \| Z \| lt.eq d_0 \/ 2 \)) #scale(x: 120%, y: 120%)[\(] e^(- c d_0^2 \/ s^2) + delta_m #scale(x: 120%, y: 120%)[\)]]^(\| I \|) . $
  Choose $s$ small first, then a sufficiently good large scale. This proves Equation (2.29) with the stated uniformity.
  #emph[Neighbor differences and bad animals.] Declare a coarse cell bad if its phase is bad, or if its average differs from any axis-neighbor average by more than $d_0 \/ l$. For any list of $q$ pairs of neighboring cells with mutually disjoint end cells, precision comparison after cutting into pair rectangles gives, for each choice of signs $eta_j in { - 1 \, 1 }$,
  $ bb(E) exp {T sum_(j = 1)^q eta_j \( macron(h)_(i_j) - macron(h)_(i'_j) \)} lt.eq e^(q delta_m \( T \)) \, #h(2em) delta_m \( T \) arrow.r 0 . $
  The free pair difference is a zero-total bounded density test, so the limit follows from Equation (2.9) at $a = 0$; the bound is uniform in the pair’s location and orientation. Chernoff and the $2^q$ sign choices give a bound $\[ 2 e^(- T d_0 \/ l + delta_m \( T \)) \]^q$ for simultaneous failures. Choose $T$ large first and $m$ large afterward. This exponential base can thus be made as small as desired, simultaneously with Equation (2.29).
  For a prescribed sup-norm-connected set of $j$ coarse sites, assign each bad site one of its five failure types (phase or one of four directed neighbors). One type occurs at least $j \/ 5$ times. For an edge type, a greedy extraction gives at least $j \/ C_0$ mutually disjoint pairs, since each pair meets only a bounded number of pairs of the same type. For the phase type use Equation (2.29) directly. Union over the at most $5^j$ assignments. Taking the preceding bases sufficiently small proves, with $eta > 0$ arbitrarily small,
  #[#set math.equation(numbering: n => "(2.30)")
   $ bb(P) { upright("every site of a prescribed sup-connected size-") j upright(" set is bad") } lt.eq eta^j . $ <st:animal>]
  The number of such sets containing a specified root is at most $C_1^j$: a depth-first traversal of a spanning tree has at most $2 j$ steps, each with at most eight choices. We fix the scale so that $C_1 eta$ is smaller than a sufficiently small absolute constant. Good axis-neighbors have the same nearest integer label to $l macron(h) \/ \( 2 pi \)$, because the difference between their labels times $2 pi$ is at most $3 d_0 < 2 pi$.
  #emph[Uniform second moments from coarse connections.] Let the coarse torus side be $M$. For any two prescribed coarse cells and $1 lt.eq t lt.eq M \/ 200$, their radius-$C t$ neighborhoods are joined by a good nearest-neighbor path except on an event of probability
  #[#set math.equation(numbering: n => "(2.31)")
   $ C e^(- c_0 t) \, $ <st:connection-tail>]
  where $C \, c_0 > 0$ do not depend on $M$ or on the two cells. Here are the geometric and counting details. A missing good crossing of a coarse rectangle requires a sup-connected bad crossing in the perpendicular direction: take the boundary of the set reachable from the starting side by good nearest-neighbor paths and trace its separating boundary. Its length is at least the shorter rectangle side. For bounded aspect ratio, Equation (2.30) and the preceding rooted count bound its probability by $C s^2 e^(- c s)$ when the width is comparable to $s$. Four overlapping strip crossings produce a good circuit in a square annulus of radii $s \, 2 s$. Request such circuits around each prescribed cell for $s = t \, 2 t \, 4 t \, dots.h$ up to one scale $s_(*)$ comparable to $M \/ 100$. Join consecutive circuits by a crossing of a bounded-aspect rectangle whose ends are inside the smaller circuit and outside the larger. Connect the two largest circuits by a bounded number of circuits and crossing rectangles along a chain of centers spaced by at most $s_(*) \/ 4$. All these rectangles have lifts to planar rectangles of bounded aspect, so the same separation argument applies even on the torus. A union bound sums at most $C sum_(r gt.eq 0) \( 2^r t \)^2 e^(- c 2^r t)$, plus a bounded number of $M$-scale errors, and proves Equation (2.31) after adjusting constants. For $t$ comparable to $M \/ 200$ one uses the same construction with a single macroscopic scale.
  Write $A_i = macron(h)_i$. On successful connection there are good end cells $i' \, j'$ within distance $C t$ of the prescribed cells $i \, j$, and $\| A_(i') - A_(j') \| lt.eq 2 d_0 \/ l$ by label agreement. Let
  $ B_t = 2 d_0 \/ l + max_("dist" \( i \, i' \) lt.eq C t) \| A_i - A_(i') \| + max_("dist" \( j \, j' \) lt.eq C t) \| A_j - A_(j') \| . $
  Nearest-neighbor trial paths and the bare Gaussian estimate imply $bb(E) B_t^4 lt.eq C_m \( 1 + t \)^p$ for a fixed integer $p$ independent of $M$. Explicitly, connect any two vertices of cells at coarse distance at most $C t$ by a path of length at most $C m \( t + 1 \)$. Its flow cost is at most $C_J m \( t + 1 \)$; averaging such paths bounds the average-difference variance by that number. Its fourth moment is at most a constant times the square of that variance, by the subGaussian tail. There are $O \( \( 1 + t \)^2 \)$ possible end cells for each maximum, which proves a polynomial bound, for example with $p = 4$. The constants may depend on the now fixed $m$.
  Partition into the first successful integer value of $t$. For $t gt.eq 2$, that event is contained in failure at $t - 1$, whose probability is at most $C e^(- c_0 \( t - 1 \))$. Cauchy–Schwarz therefore gives
  $ bb(E) \( A_i - A_j \)^2 upright(bold(1))_({ upright("first success at ") t }) lt.eq C_m \( 1 + t \)^(p \/ 2) e^(- c_0 \( t - 1 \) \/ 2) . $
  The $t = 1$ term is bounded by the same moment bound without its exponential factor. Sum until the final macroscopic scale. On remaining failure, use a torus path of length $O \( m M \)$ to bound the fourth moment of $A_i - A_j$ by $C_m M^2$ and multiply by the square root of its exponentially small failure probability. This term is uniformly bounded. Thus $sup_(M \, i \, j) bb(E) \( A_i - A_j \)^2 < oo$ for large $M$. Within a fixed cell, the point-minus-average fourth moment is uniformly bounded by paths of length $O \( m \)$, so the same uniform second-moment bound holds for every pair of prescribed vertices. Finitely many smaller coarse tori can be absorbed into the constant.
  Finally embed any desired $Q_R$ and its $J$-interaction collar in a much larger torus with side divisible by $m$. Choose a vertex $y$ outside that collar and impose the centered equalities $h_z = h_y$ at every vertex outside $Q_R$. The conditional relative law on $Q_R$ is exactly the zero-exterior law at temperature $v^2 k$; no interaction wraps across the embedding. Centered equality comparison in Lemma 4 bounds $"Var" \( h_0 - h_y \)$ in this conditional law by its unconditioned torus variance. The latter has the bound just proved, independent of $R$. Symmetry centers the conditional variable and proves Equation (2.27). ◻
]

== 3 Annular comparison, the physical criterion, and mixed pins <an:section>

Throughout this section $J$ is fixed, $A_0 = - Delta_J \/ v_J^2$, $k = beta \/ v_J^2$, and $a = a \( k \)$ is the free-rectangle coefficient of Theorem 5. A bare variance means the variance of the real Gaussian with exactly the indicated quadratic form. All lattice pairings include the weights of the specified discrete smear; in particular a probability cell smear has coefficients equal to the reciprocal of its number of vertices. Constants may depend on $J \, k$ and the fixed continuum geometry. The limits in the annular argument will always be taken in the following order:

#[#set math.equation(numbering: n => "(3.1)")
 $ n arrow.r oo \, #h(2em) ell arrow.b 0 \, #h(2em) lambda arrow.r oo . $ <an:limit-order>]

Here $n^(- 1)$ is the lattice spacing, $ell$ the side of a mass cell, and $lambda$ its mass coefficient. An error that vanishes in the first two limits need not be uniform in $lambda$.

The first part transfers the free-rectangle Gaussian coefficient to Dirichlet domains and tori and identifies its positivity with physical roughness, in Theorem 17 and Corollary 18. The key step is Proposition 16, which makes the probability that an exterior exploration reaches the test field vanish in the stated order of limits. The mixed-domain results that follow prepare Section 9; their relative hard-pin comparisons remain useful when the pin events themselves have small probability.

=== 3.1 A confining band and a sigma-finite cable representation <a-confining-band-and-a-sigma-finite-cable-representation>

Let $F$ be a fixed free square, let $D subset.double F$ be another square, and let $g in C_c^oo \( D \)$. Choose a closed polygonal annular subband $K subset.double D \\ "supp" g$, of positive width, separating $"supp" g$ from $partial D$. Leave a positive gap on either side of $K$. Rational axis-parallel ring boundaries and lattice rounding give the required geometry. A regular partition of $K$ consists of axis rectangles $d$ with sides comparable to $ell$, with uniformly bounded aspect ratios. Write $\| d \|$ for their scaled counting areas and

#[#set math.equation(numbering: n => "(3.2)")
 $ W_(ell \, lambda) \( h \) = exp {- lambda / 2 sum_d \| d \| h_d^2} \, #h(2em) S = \( h \, u \) \, $ <an:band-weight>]

where $u$ is the uniform probability on $F_n$ and $h_d$ is the full cell average. In particular these averages are not projected to mean zero.

There is a convenient canonical normalization of the free, unpinned measure. Choose the representative $h^0$ with $h_(x_0)^0 = 0$ of each common-translation orbit, give these representatives their normalized free Gaussian-lattice probability, and sum over $h = h^0 + 2 pi m$, $m in bb(Z)$. Denote the resulting sigma-finite measure by $cal(P)_n$. Its definition is independent of the choice of $x_0$: changing the representative only relabels the translation sum on each orbit. Define the probability

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(P)_(n \, W) = hat(W) cal(P)_n \, #h(2em) hat(W) = frac(W, cal(P)_n \( W \)) . $ <an:band-probability>]

The denominator is finite and positive. For example, conditionally on the gradient representative, the band energy is a strictly positive quadratic function of $2 pi m$; completing that square proves finiteness of its translation sum, and Gaussian domination controls the remaining mean-free linear functional.

#thm([Lemma 3.1.])[
  (Band density and its limit).  #emph[Suppose $a > 0$. For each fixed $lambda > 0$ and $1 lt.eq p < oo$ there is $eta > 0$ such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ limsup_(ell arrow.b 0) limsup_(n arrow.r oo) cal(P)_n \( hat(W)^p e^(eta S^2) \) < oo . $ <an:density-moment>]

 In the first two limits in (3.1), any finite list of bounded piecewise continuous density smears under $cal(P)_(n \, W)$ converges, with all fixed moments, to the centered real Gaussian with Neumann precision 
#[#set math.equation(numbering: n => "(3.5)")
 $ T_lambda = frac(- Delta_F, a) + lambda 1_K . $ <an:band-precision>]

 At each fixed partition, write 
$ cal(T)_(ell \, lambda) \( v \, w \) = a^(- 1) integral_F nabla v dot.op nabla w + lambda sum_d \| d \| v_d w_d . $

 The fixed-partition conclusion also includes any fixed finite list of translation-invariant linear observations having uniformly bounded bare variances and joint free convergence, with the band averages, to specified continuous linear functionals on $H^1 \( F \)$. Their fixed-partition limiting covariance is given by $cal(T)_(ell \, lambda)^(- 1)$. For a fixed such list, its Laplace and fixed-moment limits are uniform when the coefficients of linear combinations range over a fixed compact set. In particular, for $X_n = \( h \, A_0 g_n \)$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ lim_(ell arrow.b 0) lim_(n arrow.r oo) "Var"_W X_n = a integral_F \| nabla g \|^2 . $ <an:band-saturation>]

 The limiting fourth moments in this last statement are bounded uniformly for $lambda gt.eq lambda_0 > 0$.]
] <an:band-density>

#proof[
  At a fixed partition, Theorem 5 and Theorem 6 give joint convergence of the mean-free observations and of $S$ modulo $2 pi$, with the latter uniform and independent. Summing translations consequently integrates the constant against $thin upright(d) c \/ \( 2 pi \)$. This assertion first holds for continuous compactly supported functions of the actual constant and a finite list of observations: periodize in the constant and use the stated joint convergence. To remove compact support, put $macron(h)_K = \| K \|^(- 1) sum_d \| d \| h_d$. Jensen’s Inequality gives $sum_d \| d \| h_d^2 gt.eq \| K \| macron(h)_K^2$, while $S - macron(h)_K$ is a mean-free smear of bounded bare variance. Summing the Gaussian translation tail and using Gaussian domination with a slightly smaller negative coefficient gives uniform integrability of every polynomial in the finitely many observations. The same argument allows a sufficiently small factor $e^(eta S^2)$. For an additional translation-invariant observation $X_n$ of uniformly bounded bare variance, the one-dimensional Gaussian translation sum also gives the direct bound
  $ sup_(h^0) sum_(m in bb(Z)) W \( h^0 + 2 pi m \) < oo $
  at each fixed partition and strength. Its weighted polynomial and exponential tails are therefore controlled by the free subGaussian tails of $X_n$. The band normalizer has a positive limit at these fixed parameters. This proves the asserted extension to such observations; the same bounds give equicontinuity in coefficients on compact sets.
  For uniformity as the partition is refined, do the constant integral first in the continuum. The remaining penalty is $q$ times a positive quadratic form in the mean-free Neumann field, for $W^q$. It is the squared $L^2 \( K \)$ norm of its cell projection with its $K$-average subtracted. Let $C_ell$ be the covariance operator of this projected field. The nonzero Neumann eigenvalues of a square are comparable to $m_1^2 + m_2^2$. Thus its inverse has square-summable eigenvalues, and
  #[#set math.equation(numbering: n => "(3.7)")
   $ sup_ell parallel C_ell parallel_(upright("HS")) < oo . $ <an:band-hs>]
  If $t_j$ are the eigenvalues of $lambda C_ell$, the determinant factor in $cal(P) \( W^p \) \/ cal(P) \( W \)^p$ has logarithm
  $ 1 / 2 sum_j { p log \( 1 + t_j \) - log \( 1 + p t_j \) } . $
  The linear terms cancel, and its absolute value is bounded by $C_p sum_j t_j^2$. The explicit one-dimensional constant integrals contribute bounded positive factors. This proves the bound without $e^(eta S^2)$. Neumann Poincaré’s Inequality and the control of the constant by $macron(h)_K$ give
  $ parallel v parallel_(L^2 \( F \))^2 lt.eq C_lambda (a^(- 1) parallel nabla v parallel_2^2 + lambda sum_d \| d \| v_d^2) $
  uniformly under refinement. The Gaussian covariance of $S$ under the $p$-weighted measure is therefore uniformly bounded. Its one-dimensional Gaussian exponential integral proves (3.4) after decreasing $eta$. The fixed partition lattice limit already proved transfers this bound in the iterated-limsup sense asserted.
  The cell projections converge strongly in $L^2 \( K \)$. The displayed coercivity and weak $H^1$ compactness show that the corresponding minimizers of $1 / 2 \( v \, T v \) - \( f \, v \)$ converge to those for $T_lambda$. Their energies converge as well, by using smooth approximants as recovery sequences. This proves convergence of the inverse quadratic forms and hence of the finite Gaussian laws. Uniform exponential moments just established permit moment convergence. Since $g$ vanishes near $K$ and $partial F$, $T_lambda \( a g \) = - Delta g$. This proves (3.6). Increasing $lambda$ decreases the continuum covariance, already finite at $lambda_0$, so also gives the final fourth-moment bound. ◻
]

The cable construction follows the metric-graph representation of Gaussian fields #cite(label("Lupu2016")) #cite(label("LupuWerner2018")) and the Brownian interpolation of the integer Gaussian field used by #cite(label("AizenmanHarelPeledShapiro2022"), form: "prose") Section 7 to prove their Proposition 7.1. We give the edge-kernel disintegration and stopping argument explicitly because the present unpinned measure is sigma-finite and the later band penalty changes the sign law.

For the cable representation, give every retained unoriented bond of conductance $c_e$ a unit-time independent Brownian bridge of variance parameter $k \/ c_e$, conditional on its endpoint heights. The unnormalized transition kernel is the edge weight times a constant independent of the endpoints. Call the bond open if the bridge does not hit zero. Given nonzero endpoints of the same sign, its open probability is $1 - exp \( - 2 c_e \| h_x h_y \| \/ k \)$; endpoints with different signs cannot be joined by an open bond. Splitting the bridge at the event of hitting zero shows that the closed-edge weight does not couple endpoint signs. Consequently, conditionally on vertex magnitudes and the open graph, the signs $sigma_C$ of its nonzero components are independent fair signs. Zero singletons may be given independent dummy signs. Let $omega = \( \| h \| \, upright("open") \)$ and write the height/open-state marginal as

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(P)_n \( thin upright(d) h \, thin upright(d) upright("open") \) & = nu_n \( thin upright(d) omega \) thin cal(R)_omega \( thin upright(d) sigma \) \,\
M_C \( f \) & = sum_(x in C) \| h_x \| f_x \, #h(2em) m_C = M_C \( u \) \, #h(2em) Q_s = sum_C m_C^2 . $ <an:sign-disintegration>]

This is a sigma-finite disintegration, rather than a probability measure on $omega$. It can be constructed directly by summing the finite sign configurations for every vector of magnitudes and every edge state, with their nonnegative weights. All calculations below are first made for nonnegative integrands, so Tonelli’s Theorem applies before any finiteness is asserted. To recover the full cable law, append the conditional bridge kernel $cal(K)_omega \( thin upright(d) upright("cables") divides sigma \)$, conditioned on these endpoint values and edge states. Thus the full law is $nu_n \( thin upright(d) omega \) cal(R)_omega \( thin upright(d) sigma \) cal(K)_omega \( thin upright(d) upright("cables") divides sigma \)$. The sign-resampling statements below concern the height/open-state marginal. Before any stopping argument, its cluster integrals are lifted to the full law by this kernel.

An exploration from a vertex reveals its value and reveals outgoing bridges only until the next vertex or their first zero. Continue at every newly reached vertex. The completed sigma-field records the visited values, traversed segments, and the first-zero times and locations on outgoing cut cables. It does not reveal the remaining segments. The Brownian stopping property factors each unobserved remainder as a transition kernel starting at zero. The conditional law of unvisited vertex heights is therefore a proper centered Gaussian-lattice probability with zero boundary on the visited set and conductances $c_e \/ t_e gt.eq c_e$ on cut remainders of length $t_e lt.eq 1$. Its unexplored sign clusters still have fair independent signs. A cluster sum can be disintegrated by declaring the least vertex of each cluster to be its root. The event that this root is least is measurable at completion. This counts every cluster once and justifies conditional estimates for nonnegative intrinsic costs depending only on that cluster’s vertex magnitudes and open states. These costs are measurable at completion, and their lifted integrals may be conditioned on the realized cable segments and zero times.

#thm([Lemma 3.2.])[
  (Path anchoring).  #emph[Fix $r > 0$. After the completed exploration of a cluster of scaled diameter at least $r$, the bare variance of the complement’s full-domain average, and of any fixed bounded density smear, is bounded by a constant $V_r$. If $ell < r \/ C$ and $cal(D)$ is any collection of mass cells touched by that exploration, then 
#[#set math.equation(numbering: n => "(3.9)")
 $ "Var"_(upright("bare")) (sum_(d in cal(D)) \| d \| b_d h_d^U) lt.eq C ell^2 sum_(d in cal(D)) \| d \| b_d^2 . $ <an:local-path-bound>]

 Here $U$ denotes unvisited vertices, and each average still uses the full cell denominator. The conclusion also holds when the starting set is the entire exterior of $D$ and the exploration follows all nonzero components meeting that set. If a cell of side $delta$ is visited by a path arriving from distance at least a fixed multiple of $delta$, its remaining probability average has bare variance at most $C$, independent of $delta$.]
] <an:path-poincare>

#proof[
  Extend any variation on the unvisited vertices by zero on visited vertices. On a visited-to-unvisited nearest-neighbor edge the posterior energy pays at least its original conductance times the squared difference of this extension. Thus the nearest-neighbor energy of the zero extension is bounded by a fixed multiple of the posterior energy. The constant depends on $J$, which contains the nearest-neighbor steps.
  In a fixed-factor enlargement of a touched $ell$-cell, stop a visited path when it has first traveled distance $c ell$ from its initial point in that cell. One coordinate projection spans $c' ell n$ levels. Its jumps are bounded by $max_(z in J) \| z \|$; there are therefore visited zeros on a fixed positive fraction of these lattice levels. Take a comparable enlarged rectangle with $N asymp ell n$ rows and columns. On each anchored row the one-dimensional telescoping estimate gives
  $ sum_(x upright(" in row")) v_x^2 lt.eq C N^2 sum_(e upright(" in row")) \( nabla_e v \)^2 . $
  Let $macron(v)$ be the mean on the rectangle. Since the anchored rows contain a fixed fraction of its vertices,
  $ N^2 macron(v)^2 lt.eq C sum_(x upright(" in anchored rows")) v_x^2 + C sum_x \( v_x - macron(v) \)^2 . $
  The ordinary rectangle Poincaré Inequality controls the second sum by $C N^2$ times the gradient energy. Combining the two estimates and dividing counting area by $n^2$ gives
  $ n^(- 2) sum_(x upright(" in cell")) v_x^2 lt.eq C ell^2 cal(E)_(upright("post")) \( v \; upright("enlarged cell") \) . $
  Enlargements have bounded overlap. Cauchy–Schwarz for $sum \| d \| b_d v_d$ and the variational formula for inverse quadratic forms prove (3.9). With one fixed $r$-sized anchored rectangle, the global Poincaré Inequality controls the mean and energy on the whole connected square, proving the $V_r$ assertion. For an observation cell use the same proof at scale $delta$: its normalized density has squared $L^2$ norm $O \( delta^(- 2) \)$, canceling the $delta^2$ in the local estimate. For exterior exploration, the filled exterior supplies visited zeros for the extension, and any path entering a touched interior cell supplies the required segment. No planarity of the $J$-bond graph is used. ◻
]

=== 3.2 Cluster-mass tails, sign resampling, and tilt errors <cluster-mass-tails-sign-resampling-and-tilt-errors>

To use the exploration, we must control the cluster masses under the band weight and the errors caused by resampling signs or changing the posterior mean. The next estimates provide these controls before the reach argument compares the explored field with a centered pinned law.

For a mean-zero smear $f$ write $parallel f parallel_(upright("bare"))^2 = k \( f \, A_(0 \, F)^(+) f \)$, and for arbitrary $f$ put $f^0 = f - u sum_x f_x$. The following bounds include the sigma-finite normalization needed in the exploration argument.

#thm([Lemma 3.3.])[
  (Finite bins and reinsertion).  #emph[For $t gt.eq 1$ and every fixed integer $p gt.eq 1$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ nu_n \( Q_s lt.eq 4 t^2 \) & lt.eq C \( 1 + t \) \,\
integral_(Q_s lt.eq 4 t^2) (sum_C M_C \( f \)^2)^p thin upright(d) nu_n & lt.eq C_p \( 1 + t \) (t lr(|sum_x f_x|) + parallel f^0 parallel_(upright("bare")))^(2 p) . $ <an:bin-moments>]

 For mean-zero $f$, its squared-mass root also satisfies 
#[#set math.equation(numbering: n => "(3.11)")
 $ nu_n (Q_s lt.eq 4 t^2 \, sum_C M_C \( f \)^2 gt.eq z^2) lt.eq C \( 1 + t \) exp (- frac(c z^2, parallel f parallel_(upright("bare"))^2)) . $ <an:bin-tail>]

 After exposing any cluster $C$ of diameter at least $r$, let $Q_U$ be the sum of squared complement cluster masses with the original full-domain normalization. For $0 < delta lt.eq \( 4 V_r \)^(- 1)$, 
#[#set math.equation(numbering: n => "(3.12)")
 $ bb(E) \( e^(delta Q_U) divides cal(F)_C \) lt.eq 3 . $ <an:conditional-square-tail>]

 Consequently, for every nonnegative intrinsic completed-cluster cost $I \( C \)$ depending only on its vertex magnitudes and open states, and $t gt.eq t_0 \( r \)$, 
#[#set math.equation(numbering: n => "(3.13)")
 $ integral sum_(C : "diam" C gt.eq r) I \( C \) upright(bold(1))_(m_C lt.eq 2 t) thin upright(d) nu_n lt.eq 2 integral upright(bold(1))_(Q_s lt.eq 8 t^2) sum_(C : "diam" C gt.eq r) I \( C \) upright(bold(1))_(m_C lt.eq 2 t) thin upright(d) nu_n . $ <an:reinsertion-bound>]

 All these bounds are uniform in sufficiently fine meshes.]
] <an:reinsertion>

#proof[
  Given signless data, $bb(E)_sigma S^2 = Q_s$. Chebyshev’s Inequality gives $bb(P)_sigma \( \| S \| lt.eq C t \) gt.eq 1 - 4 \/ C^2$ on the bin. For $Y = \( h \, f \)$, the Rademacher fourth-moment bound $bb(E)_sigma Y^4 lt.eq 3 \( bb(E)_sigma Y^2 \)^2$ and Paley–Zygmund give fixed positive probability that $\| Y \| gt.eq c \( sum_C M_C \( f \)^2 \)^(1 \/ 2)$. Choose $C$ so the two events intersect with a fixed positive probability. On each gradient orbit the number of translations satisfying $\| S \| lt.eq C t$ is at most $C' \( 1 + t \)$. A mean-zero $Y$ is translation invariant and has the ordinary Gaussian upper tail by Lemma 4. This proves (3.11) and the first bound. For general $f$ use $Y = \( h \, f^0 \) + S sum f$ on the same intersection, integrate the tail, and obtain (3.10). Vanishing bare norm is interpreted by continuity; then the corresponding mean-zero functional vanishes identically.
  Let $S_U$ be the signed complement mean. Lemma 11 and bare domination give $bb(E) \( e^(z S_U) divides cal(F)_C \) lt.eq e^(V_r z^2 \/ 2)$. Condition on the signless complement and use Jensen: $Q_U^p lt.eq bb(E)_sigma \| S_U \|^(2 p)$. Integrating the subGaussian tail yields
  $ bb(E) \( Q_U^p divides cal(F)_C \) lt.eq 2 \( 2 V_r \)^p p ! . $
  Expansion of the exponential proves $bb(E) \( e^(delta Q_U) divides cal(F)_C \) lt.eq \( 1 + 2 delta V_r \) \/ \( 1 - 2 delta V_r \) lt.eq 3$. For large enough $t_0 \( r \)$ this implies $bb(P) \( Q_U lt.eq 4 t^2 divides cal(F)_C \) gt.eq 1 \/ 2$. Since $m_C^2 lt.eq 4 t^2$, this event gives $Q_s lt.eq 8 t^2$. Multiply by $I \( C \) upright(bold(1))_(m_C lt.eq 2 t)$, apply conditional expectation, and sum using the least-root disintegration. The argument applies to extended nonnegative integrals, so does not presuppose the finiteness it proves. ◻
]

#thm([Lemma 3.4.])[
  (Damped tails and weighted moments).  #emph[For every $eta > 0$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ cal(P)_n (e^(- eta S^2) upright(bold(1))_(t^2 < Q_s lt.eq 4 t^2)) lt.eq C_eta e^(- c_eta t^2) #h(2em) \( t gt.eq 1 \) . $ <an:damped-tail>]

 If $a > 0$, then at fixed $lambda$ all fixed moments under $cal(P)_(n \, W)$ of squared cluster-mass sums and of signlessly selected partial signed sums are bounded in the first two limits. In particular, with $D_ell^2 = 1 + log \( 1 \/ ell \)$ and any mass cell $d$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E)_W (sum_C M_C \( d \)^2)^p + bb(E)_W \| d_(*) \|^(2 p) lt.eq C_(p \, lambda) D_ell^(2 p) \, $ <an:cell-moments>]

 where $d_(*)$ is any signed partial contribution selected from signless data, with nonnegative coefficients bounded by the full cell smear. Fixed observation cells obey the same statement with a fixed constant in place of $D_ell$.]
] <an:weighted-moments>

#proof[
  Choose a small fixed diameter threshold $r$ and a finite family of separated probability box smears $p_j$ such that every cluster of diameter less than $r$ misses at least one box. If these small clusters contribute at least $t^2 \/ 2$ to $Q_s$, assign each one a missed box. For that box $M_C \( p_j - u \) = - m_C$, so for some $j$ its mean-zero squared-mass sum is at least $c t^2$. Equation (3.11) bounds this part of the bin by $C \( 1 + t \) e^(- c t^2)$, even without the damping factor.
  Otherwise the macroscopic clusters give the pointwise majorant
  $ upright(bold(1))_(t^2 < Q_s lt.eq 4 t^2) lt.eq sum_(C : "diam" C gt.eq r) frac(2 m_C^2, t^2) upright(bold(1))_(m_C lt.eq 2 t) upright(bold(1))_(Q_s > t^2) . $
  Expose each $C$. Write $S = sigma_C m_C + S_U$. If $m_C gt.eq t \/ 2$, the events $\| S_U \| lt.eq m_C \/ 2$ and its complement give
  $ bb(E) \( e^(- eta S^2) divides cal(F)_C \) lt.eq e^(- eta m_C^2 \/ 4) + bb(P) \( \| S_U \| > m_C \/ 2 divides cal(F)_C \) lt.eq C e^(- c t^2) . $
  If $m_C < t \/ 2$, the condition $Q_s > t^2$ implies $Q_U > 3 t^2 \/ 4$, whose conditional probability has the same bound by (3.12). The remaining intrinsic sum $sum \( m_C^2 \/ t^2 \) upright(bold(1))_(m_C lt.eq 2 t)$ is finite after (3.13); indeed on its reinserted bin its pointwise value is bounded by a constant and the bin has mass $O \( 1 + t \)$. Absorbing this factor proves (3.14).
  To transfer moments, let $H$ be a squared-mass root or a selected signed sum, and let $A_t$ be a dyadic bin for $Q_s$. Conditional Khintchine bounds followed by (3.10) give $cal(P)_n \( \| H \|^(2 p) upright(bold(1))_(A_t) \) lt.eq P_p \( t \) D^(2 p)$, for a polynomial $P_p$ and the appropriate bare-cost scale $D$. Hölder’s Inequality with exponents $4 \, 4 \, 2$ gives
  $ cal(P)_n \( hat(W) \| H \|^p upright(bold(1))_(A_t) \) & lt.eq cal(P)_n \( hat(W)^4 e^(eta S^2) \)^(1 \/ 4) cal(P)_n \( e^(- eta S^2) upright(bold(1))_(A_t) \)^(1 \/ 4) cal(P)_n \( \| H \|^(2 p) upright(bold(1))_(A_t) \)^(1 \/ 2) . $
  The exponential factors cancel exactly in this application. Equations (3.4) and (3.14) make the dyadic sum finite and its tail uniformly small. The lowest bin is handled directly by (3.10).
  For completeness, the bare variance of $h_d - S$ is $O \( 1 + log \( 1 \/ ell \) \)$. Cut and compare to a fixed containing square using nearest-neighbor edges. In its discrete Neumann cosine basis the rescaled coefficients of a probability $ell$-cell smear are bounded. Summing inverse eigenvalues up to frequency $ell^(- 1)$ costs $C log \( 1 \/ ell \)$. Above that frequency, Parseval and the bound $parallel d - u parallel_2^2 = O \( ell^(- 2) \)$ give a bounded remainder. This proves (3.15). The same argument works with an independent auxiliary fair-sign sample: exchanging the old and new samples preserves the base measure, so the density moment estimate is unchanged. ◻
]

#thm([Lemma 3.5.])[
  (Asymptotically fair macroscopic signs).  #emph[Suppose $a > 0$, and fix $r > 0$ and $lambda > 0$. In the height/open-state marginal, jointly replacing the signs of all clusters of diameter at least $r$ by fresh independent fair signs changes the band law by a total variation error tending to zero as $n arrow.r oo$ and then $ell arrow.b 0$. The contribution of clusters of diameter below $r$ to any fixed bounded density smear tends to zero in every fixed moment when $r arrow.b 0$ after these two limits. For nonnegative such smears $f \, p$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ limsup_(ell arrow.b 0) limsup_(n arrow.r oo) bb(E)_W sum_(C : "diam" C gt.eq r) M_C \( f \) M_C \( p \) lt.eq \( f \, T_lambda^(- 1) p \) . $ <an:cross-cluster>]

 All fixed moments of $sum_("diam" C gt.eq r) M_C \( f \)^2$ have limiting upper bounds uniform for $lambda gt.eq lambda_0 > 0$.]
] <an:resampling>

#proof[
  On $Q_s lt.eq t^2$, expand the difference of the two quadratic mass energies in the original and resampled signs. Orthogonality of Rademacher monomials bounds its squared base integral by
  #[#set math.equation(numbering: n => "(3.17)")
   $ C lambda^2 integral upright(bold(1))_(Q_s lt.eq t^2) sum_(C : "diam" C gt.eq r) sum_(C' eq.not C) (sum_d \| d \| M_C \( d \) M_(C') \( d \))^2 thin upright(d) nu_n . $ <an:resampling-square>]
  Expose $C$, retain the intrinsic condition $m_C lt.eq t$, and drop the complement truncation. The inner sum, after its fair signs are averaged, is the conditional second moment of $sum_d \| d \| M_C \( d \) h_d^U$. Equation (3.9) bounds it by $C ell^2 sum_d \| d \| M_C \( d \)^2$. Reinsert $Q_s lt.eq C \( 1 + t^2 \)$ using Lemma 12, and then use (3.10). The result is
  #[#set math.equation(numbering: n => "(3.18)")
   $ cal(P)_n (upright(bold(1))_(Q_s lt.eq t^2) \| log W \( sigma' \) - log W \( sigma \) \|^2) lt.eq C_(lambda \, t \, r) ell^2 D_ell^2 + o_n \( 1 \) . $ <an:resampling-rate>]
  The bin has finite base mass. Equation (3.4) gives uniform $L^p$ bounds for both normalized densities there. Split where the logarithmic difference is larger than a fixed $delta$; on that set use Hölder and (3.18), and on its complement use $\| e^x - e^y \| lt.eq \( e^delta - 1 \) \( e^x + e^y \)$. First take the two mesh limits, then $delta arrow.b 0$. Lemma 13 removes the bin cutoff. This proves total variation convergence, also against functions with the moment bounds of that lemma.
  Partition $F$ into $r$-cells. A cluster of diameter below $r$ meets only a bounded number of neighboring cells. For a bounded density $f$, Cauchy–Schwarz over those cells bounds its squared mass contribution by $C parallel f parallel_oo^2 r^4$ times the sum of the cell squared-mass contributions. There are $O \( r^(- 2) \)$ cells. Equation (3.10) consequently gives, on a fixed bin, signed second moment at most $C_t parallel f parallel_oo^2 r^2 \( 1 + log \( 1 \/ r \) \)$. Higher fixed moments are bounded there. Interpolation, the Hölder transfer in Lemma 13, and its tail truncation prove the asserted vanishing in moments.
  Resample signs first at a threshold smaller than $r$. The fair second moment of the macroscopic signed contributions is their squared-mass sum, and all terms for nonnegative smears are nonnegative. Remove the still smaller clusters by the preceding bound and apply Lemma 10 to the full smears. This proves (3.16). Jensen in the signs gives $\( sum M_C \( f \)^2 \)^p lt.eq bb(E)_sigma \| sum sigma_C M_C \( f \) \|^(2 p)$; the same resampling and small-cluster argument bounds its limit by the Gaussian $2 p$-moment. The covariance decreases with $lambda$ and is finite at $lambda_0$, giving the stated uniformity. ◻
]

#thm([Lemma 3.6.])[
  (Finite tilt and size-bias inequalities).  #emph[Let $mu$ be any proper centered Gaussian-lattice probability.Suppose the bare variances of real linear tests $L \, X$ are at most $epsilon^2 \, V$, respectively, where $epsilon gt.eq 0$ and $V > 0$, and put $thin upright(d) mu_L = e^L thin upright(d) mu \/ mu \( e^L \)$. Then, for every $z gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.19)")
 $ \| bb(E)_L X \| & lt.eq 2 sqrt(V) thin epsilon \,\
mu_L { \| X \| gt.eq sqrt(V) \( 2 epsilon + z \) } & lt.eq 2 e^(- z^2 \/ 2) \,\
\| bb(E)_L X^2 - bb(E) X^2 \| + \| "Var"_L X - "Var" X \| & lt.eq C V epsilon \( 1 + epsilon \) . $ <an:tilt-bounds>]

 The mean and second-moment/variance estimates also hold for $V = 0$, when $X = 0$ almost surely; the displayed closed-tail inequality is asserted only for $V > 0$. For every inversion-symmetric event $E$ of positive probability, 
#[#set math.equation(numbering: n => "(3.20)")
 $ mu_L \( E \) gt.eq e^(- epsilon^2 \/ 2) mu \( E \) . $ <an:relative-tilt>]

 For any two real linear tests $X \, Y$ under $mu$, 
#[#set math.equation(numbering: n => "(3.21)")
 $ bb(E) \[ X^2 \| Y \| \] gt.eq bb(E) X^2 thin bb(E) \| Y \| . $ <an:size-bias>]

]
] <an:tilt>

#proof[
  Symmetry and bare domination give $1 lt.eq mu \( e^L \)$ and $mu \( e^(L + t X) \) lt.eq exp \( \( epsilon + \| t \| sqrt(V) \)^2 \/ 2 \)$. Convexity applied at $t = plus.minus epsilon \/ sqrt(V)$ proves the mean bound; if $epsilon = 0$, then $L = 0$ almost surely and the mean bound follows from centeredness. For $V > 0$ and $z gt.eq 0$, Chernoff with this same bound proves the displayed tail. The case $V = 0$ gives $X = 0$ almost surely and hence the non-tail estimates directly. If $epsilon lt.eq 1$, then
  $ mu \( \( e^L - 1 \)^2 \) lt.eq e^(2 epsilon^2) - 1 lt.eq C epsilon^2 . $
  Cauchy–Schwarz, the bare fourth-moment bound, and the denominator at least one give the second-moment error $C V epsilon$. Subtracting the squared mean gives the variance error. For $epsilon gt.eq 1$ the tail bound controls the two second moments by $C V \( 1 + epsilon \)^2$, which proves (3.19). Conditional symmetry on $E$ gives $mu \( e^L divides E \) = mu \( cosh L divides E \) gt.eq 1$, proving (3.20).
  For the final assertion let $phi.alt \( t \) = bb(E) cos \( t Y \) > 0$. The minimal log Hessian of the positive characteristic function from Lemma 4, applied in the $X$ direction at frequency $t Y$, gives
  $ bb(E) \[ X^2 cos \( t Y \) \] lt.eq bb(E) X^2 thin phi.alt \( t \) - frac(\( bb(E) \[ X sin \( t Y \) \] \)^2, phi.alt \( t \)) . $
  Subtract from the equality at $t = 0$ and integrate the weaker inequality against $2 thin upright(d) t \/ \( pi t^2 \)$ on $\( 0 \, oo \)$. The identity $\| y \| = \( 2 \/ pi \) integral_0^oo \( 1 - cos t y \) t^(- 2) thin upright(d) t$ and Tonelli prove (3.21). The bias $\| Y \|$ preserves inversion symmetry, so its mean for $X$ is zero. ◻
]

When an exploration is performed under the band law, write $h_d = d_(*) + h_d^U$. Relative to the centered posterior with the restricted band quadratic form, the remaining tilt is $L = - lambda sum_d \| d \| d_(*) h_d^U$. Equation (3.9) gives

#[#set math.equation(numbering: n => "(3.22)")
 $ epsilon^2 lt.eq C lambda^2 ell^2 sum_d \| d \| d_(*)^2 . $ <an:exterior-tilt>]

For a single exposed macroscopic cluster define $epsilon_C$ by the same bound with $\| d_(*) \| = M_C \( d \)$. Put $E_2 = sum_("diam" C gt.eq r) epsilon_C^2$. If $a > 0$, Equation (3.15) and weighted Jensen give, for each fixed $p$ and $lambda$,

#[#set math.equation(numbering: n => "(3.23)")
 $ bb(E)_W epsilon^(2 p) + bb(E)_W E_2^p lt.eq C_(p \, lambda \, r) ell^(2 p) D_ell^(2 p) + o_n \( 1 \) . $ <an:tilt-moments>]

For two fixed observation cells $B \, i$, write $Q_B = sum_("diam" C gt.eq r) M_C \( B \)^2$ and define $Q_i$ likewise. The exact summation bound needed below is

#[#set math.equation(numbering: n => "(3.24)")
 $ & sum_("diam" C gt.eq r) M_C \( B \) epsilon_C \( 1 + epsilon_C \) \( 1 + M_C \( i \) \)\
 & #h(1cm)  lt.eq sqrt(Q_B) \( 1 + sqrt(Q_i) \) \( sqrt(E_2) + E_2 \) . $ <an:summed-tilt>]

Indeed use Cauchy–Schwarz for the sum of $M_C \( B \) epsilon_C$, and bound $sup_C epsilon_C$ and $sup_C M_C \( i \)$ by the square roots of their respective squared sums. For $a > 0$, Hölder and the moment bounds show that the expectation in (3.24) is $O_(lambda \, r) \( ell D_ell + ell^2 D_ell^2 \)$ in the mesh limit. There is no factor counting microscopic clusters.

=== 3.3 Stopping the exploration and transferring the field <stopping-the-exploration-and-transferring-the-field>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({rect((-2.1, -2.1), (2.1, 2.1), fill: rgb("#e6e6ff"), stroke: none); line((2.1, 2.1), (-1.505, -1.505)); rect((-1.505, -1.505), (1.505, 1.505), fill: rgb("#e6e6ff"), stroke: none)}, fill: rgb("#e6e6ff"), fill-rule: "even-odd", stroke: none)
  rect((-2.8, -2.8), (2.8, 2.8), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-2.555, -2.555), (2.555, 2.555), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-2.1, -2.1), (2.1, 2.1), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((-1.505, -1.505), (1.505, 1.505), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((-2.324, -2.324), (2.324, 2.324), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  rect((-1.274, -1.274), (1.274, 1.274), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  rect((-0.56, -0.42), (0.56, 0.42), fill: rgb("#e6e6e6"), stroke: none)
  content((0, 0), [$"supp" g$])
  content((2.94, 2.765), [$partial F$], anchor: "west", padding: 0.1176cm)
  content((2.94, 2.31), [$partial D$], anchor: "west", padding: 0.1176cm)
  line((2.87, 2.31), (2.555, 2.555), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.94, 1.645), [outer covering $i$], anchor: "west", padding: 0.1176cm)
  line((2.87, 1.645), (2.324, 1.645), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  content((2.94, 0.91), [mass subband $K$], anchor: "west", padding: 0.1176cm)
  line((2.87, 0.91), (1.82, 0.91), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.94, 0.175), [inner covering $B$], anchor: "west", padding: 0.1176cm)
  line((2.87, 0.175), (1.274, 0.175), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  line((-2.695, 0.21), (-2.31, 0.245), (-1.89, 0.07), (-1.54, 0.315), (-1.274, 0.28), stroke: (paint: rgb("#b20000"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
})],
  caption: [Figure 2: The annular comparison, schematically. The coverings are finite unions of small cells around the dashed rings. They have positive clearance from the mass subband, the test support, and $partial D$. An exploration reaching the test support from $F \\ D$ must pass both coverings. The drawing does not restrict the finite-range paths to nearest-neighbor paths. ],
) <an:band-figure>

#thm([Proposition 3.7.])[
  (Vanishing reach).  #emph[Suppose $a > 0$. Under the band law, explore all components meeting $F_n \\ D_n$. The probability that any visited vertex is in a fixed neighborhood of $"supp" g$ tends to zero in (3.1). The same conclusion holds for an exploration starting from a fixed positive-area region on one side of a separating positive-width band and reaching a fixed closed region on its other side, provided the closure of the starting region and the target have fixed positive clearance from the band. The two gaps admit the mass-free covering families used below, with all clearances fixed before the lattice and band limits.]
] <an:reach>

#proof[
  Choose finite coverings by small observation squares $B$ of an inner ring and by squares $i$ of an outer ring, leaving the clearances shown in Figure 2. Use slightly overlapping enlarged squares so every path crossing the rings hits the coverings also after lattice rounding. The maximum scaled jump tends to zero, so a path from the starting set to the target must meet both coverings, in order.
  Let $C_0$ be the uniform bare variance bound for the remaining average in a cell reached by a path from afar, from Lemma 11. The cell radii can be chosen so small that their continuum prior variances under $T_lambda^(- 1)$ are at least $C_0 + 2 c_0$ for some $c_0 > 0$, uniformly over $lambda > 0$. To see this directly, center a truncated logarithm at the cell and cut it off inside a fixed surrounding ball disjoint from the mass. Its mean over a radius-$delta$ cell is $c log \( 1 \/ delta \) + O \( 1 \)$, while its gradient energy is $c' log \( 1 \/ delta \) + O \( 1 \)$. The inverse variational principle therefore makes the cell-average variance grow at least as $c'' a log \( 1 \/ delta \)$. This trial pays no mass term. Fix the coverings at this point. Lemma 10 gives the same strict deficit $c_0$ for fine $ell \, n$ at each fixed $lambda$.
  Write the average at $B$ after exterior exploration as $h_B = e_B + u_B$, its exposed and unexposed contributions. On omitting the linear tilt, the conditional form is obtained from the prior form by zero-pinning visited vertices and tightening the cable remainders. The partial average $u_B$ is precisely the original full test after those zero pins. Thus its centered variance $w_B$ is at most the full prior variance $v_B$ by Lemma 4, and on a visit to $B$ it is at most $v_B - c_0$ by the local bound. Equations (3.19) and (3.23) show that restoring the tilt changes the conditional second moment, and the cross term with $e_B$, by $o \( 1 \)$ after averaging. The needed moments of $e_B$ follow from Lemma 13. The prior identity $bb(E) h_B^2 = v_B$ consequently implies
  $ c_0 bb(P)_W \( B upright(" reached") \) lt.eq bb(E)_W e_B^2 + o \( 1 \) . $
  Every cluster contributing to $e_B$ is macroscopic, with a threshold fixed by its distance from the starting set. Sign resampling, including the same signless selection of exterior clusters, converts its second moment to the squared-mass sum:
  #[#set math.equation(numbering: n => "(3.25)")
   $ c_0 bb(P)_W \( B upright(" reached") \) lt.eq bb(E)_W sum_(C upright(" meeting the starting set")) M_C \( B \)^2 + o \( 1 \) . $ <an:exterior-deficit>]
  A second deficit bounds this right side. For each $x in B$ with $bb(E)_W \| h_x \| > 0$, bias the prior by $\| h_x \|$ and explore only the cluster of $x$. Its pre-exploration variance for $h_i$ is at least $v_i$ by (3.21). The bias is measurable at completed exploration and hence cancels from the conditional law of the complement. Its centered remaining variance is at most $v_i$, and is at most $v_i - c_0$ if the cluster visits $i$. Its exposed average has absolute value $M_(C \( x \)) \( i \)$. Apply total second moment in this biased law, multiply by $bb(E)_W \| h_x \|$ and the averaging weight of $x$ in $B$, and sum in $x$. The terms without a visit or a tilt cancel in the comparison with $v_i$. Clusters causing a tilt must reach the mass cells, and clusters contributing at $i$ must reach $i$; both are macroscopic because all three regions have positive separation. Their remaining errors are bounded by a constant times the expectation in (3.24), which tends to zero. A point with $bb(E)_W \| h_x \| = 0$ contributes zero directly. The result is the exact weighted deficit
  #[#set math.equation(numbering: n => "(3.26)")
   $ c_0 bb(E)_W sum_(C : C ∩ i eq.not diameter) M_C \( B \) lt.eq bb(E)_W sum_C M_C \( B \) M_C \( i \)^2 + o \( 1 \) . $ <an:biased-deficit>]
  In particular no estimate on an unsigned sum over all microscopic clusters has been used.
  The inverse forms $T_lambda^(- 1)$ decrease as $lambda arrow.r oo$ to the form inverse with every function zero almost everywhere on $K$. Indeed bounded energies give weak $H^1$ compactness and $integral_K v^2 arrow.r 0$; the variational principle gives both the limit and recovery by functions already zero there. This hard band separates the inner and outer regions, so its inverse has zero cross quadratic form for smears on opposite sides. Equation (3.16) therefore makes $bb(E) sum_C M_C \( B \) M_C \( i \)$ tend to zero after (3.1). Truncate first at $max_C M_C \( i \) lt.eq M$. On this event the right side of (3.26) is at most $M$ times this vanishing cross sum. Its tail tends to zero uniformly as $M arrow.r oo$:
  $ sum_C M_C \( B \) M_C \( i \)^2 lt.eq sqrt(Q_B) thin Q_i \, $
  and Lemma 14 gives arbitrarily high uniform moments after the first two limits. Thus $bb(E) sum_(C ∩ i eq.not diameter) M_C \( B \) arrow.r 0$.
  Every exterior-connected cluster meeting $B$ must visit some outer covering cell $i$. On $max_C M_C \( B \) lt.eq M$ its contribution to (3.25) is at most $M$ times the sum of the just estimated first-mass quantities. The remaining tail is again controlled by the uniform moments of $Q_B$. Send $M arrow.r oo$ after the three limits. Each $B$ is reached with probability tending to zero, and their finite cover gives the assertion. The proof for a different starting region only replaces the filled exterior by that region; the path anchoring and the two separated coverings have exactly the same hypotheses. ◻
]

#thm([Theorem 3.8.])[
  (Dirichlet and torus transfer).  #emph[For $a \( k \) > 0$, the centered, unprojected zero-Dirichlet height law on every fixed square converges, in smooth density observations and their Laplace transforms, to the real zero-Dirichlet GFF of covariance $a \( k \) \( - Delta_D \)^(- 1)$. For growing square tori, at every $k > 0$ the mean-subtracted height field converges to the mean-zero torus GFF with covariance $a \( k \) \( - Delta_(bb(T)^2) \)^(- 1)$, where $a = 0$ denotes the zero distribution. Convergence holds along every sequence of increasing integer side lengths and in $H^(- 3) \( bb(T)^2 \)$. For smooth mean-zero $f$, 
#[#set math.equation(numbering: n => "(3.27)")
 $ lim_(n arrow.r oo) log bb(E) e^(H_n \( f \)) = frac(a \( k \), 2) \( f \, \( - Delta_(bb(T)^2) \)^(- 1) f \) . $ <an:torus-laplace>]

 On the positive branch the uniquely determined temperature coefficient in Equation (1.16) is 
#[#set math.equation(numbering: n => "(3.28)")
 $ beta_(upright("eff")) \( J \, beta \) = v_J^2 a \( beta \/ v_J^2 \) . $ <an:effective-temperature>]

]
] <an:dirichlet-torus>

#proof[
  Consider $X_n = \( h \, A_0 g_n \)$ in the free square with the band. On the success event of Proposition 16, the exposed contribution to $X_n$ is zero. Its centered conditional variance is at most its massless zero-Dirichlet variance in $D_n$: the centered posterior has zeros on the whole exterior, possibly further pins and tightened edges, and the remaining positive band precision. Drop the latter extra conditions using Lemma 4. The linear-tilt error vanishes by (3.19) and (3.23). On failure, Cauchy–Schwarz bounds $bb(E)_W \[ X_n^2 upright(bold(1))_(upright("failure")) \]$ by its fourth-moment root times the square root of the failure probability. Lemma 10 bounds this fourth moment uniformly after the first two limits and toward the last limit. Hence (3.6) implies
  #[#set math.equation(numbering: n => "(3.29)")
   $ liminf_(n arrow.r oo) "Var"_D \( h \, A_0 g_n \) gt.eq a integral_D \| nabla g \|^2 . $ <an:dirichlet-lower>]
  This is valid along every subsequence of lattice sizes: one uses that subsequence in the band argument before the other limits. Free-square cutting gives the opposite bound, with the same gradient energy, for the zero-Dirichlet law. Its logarithmic moment generating function has the covariance quadratic lower bound of Lemma 4. The matching upper bound follows by cutting into cells of relative side $r$, Taylor-expanding their centered subGaussian logarithmic moment generating functions to second order, and summing the $O \( r^3 \)$ remainder over $O \( r^(- 2) \)$ cells, as in Theorem 5. Discarded edge flows have vanishing bare cost before cutting. Thus it has the asserted Gaussian limit for compactly supported shifts.
  To pass to density tests, use the deterministic inverse-form liminf and recovery argument given later in the proof of Lemma 21, with the zero condition imposed on every face of this square. That part of the proof uses only nearest-neighbor compactness, finite differences, and smooth recovery; it does not use the height transfer proved here. For the area-weighted samples $f_n$ of a smooth density, let $A_(0 \, D_n)$ denote the zero-exterior Dirichlet operator. Its inverse quadratic form therefore converges to $\( f \, \( - Delta_D \)^(- 1) f \)$. Put $v = \( - Delta_D \)^(- 1) f$ and choose $g_j in C_c^oo \( D \)$ converging to $v$ in $H_0^1 \( D \)$. The inverse variational identity gives, at each fixed $j$,
  $ lim_(n arrow.r oo) \( f_n - A_(0 \, D_n) g_(j \, n) \, A_(0 \, D_n)^(- 1) \( f_n - A_(0 \, D_n) g_(j \, n) \) \) = integral_D \| nabla \( v - g_j \) \|^2 . $
  Here the cross pairing and the sampled shift energy converge by finite differences; the inverse term is the deterministic limit just cited. Letting $j arrow.r oo$ makes the bare error vanish, so Gaussian domination transfers the Laplace limits. This proves the full density-test statement and joint convergence by real linear combinations. In this argument the band constant was integrated, rather than fixed; the resulting Dirichlet law is consequently unprojected.
  For a torus shift supported in a small square chart, impose the equalities that all heights outside that square have one common value. They can be imposed by diverging positive quadratic penalties. Modulo the additive lattice constant, the resulting law is the zero-Dirichlet square law. The observable annihilates constants, so comparison gives the same lower bound (3.29). Free-cell cutting gives the upper bound $a integral \| nabla g \|^2$ for every smooth torus shift. The limiting difference between this upper quadratic form and the actual covariance is positive semidefinite on each finite list, on every convergent subsequence. A vector at which it vanishes belongs to its null space. Each chart-supported shift has full variance convergence by the liminf and limsup bounds just proved. A finite partition of unity writes an arbitrary smooth torus shift as a finite sum of such shifts. On every covariance-convergent subsequence, all their defect diagonal entries therefore vanish simultaneously. Positive semidefiniteness annihilates their span, and the arbitrariness of the initial subsequence proves full variance convergence for the sum. For $a = 0$ the upper bound alone gives saturation. The same small-cell upper bound and Hessian lower bound give the Gaussian Laplace limit for these shifts.
  Given mean-zero $f$, solve $- Delta g = f$ on the torus with zero mean. On samples, $A_0 g_n$ differs from the area-weighted sample $n^(- 2) f_n$, with its sampled mean subtracted, by a density error tending to zero in scaled $L^2$. This follows from the quadratic symbol of $A_0$ and smooth finite differences. The discrete Poincaré Inequality and bare domination control the error in every exponential moment with a fixed argument. This proves (3.27) and all joint smooth projections.
  Finally consider the Fourier coefficient at $m in bb(Z)^2$ of $H_n$. If $m$ is zero modulo $n$, mean subtraction makes the coefficient zero. Otherwise replace $m$ by its representative $tilde(m)$ with coordinates of magnitude at most $n \/ 2$. The nearest-neighbor lower bound on the symbol gives its bare second moment at most $C k \/ \| tilde(m) \|^2 lt.eq C k$, uniformly in $n \, m$. Consequently
  $ sup_n bb(E) parallel H_n parallel_(H^(- 2) \( bb(T)^2 \))^2 lt.eq C k sum_(m in bb(Z)^2) \( 1 + \| m \|^2 \)^(- 2) < oo . $
  Compact embedding into $H^(- 3)$ gives tightness; the smooth joint projections identify every limit and hence the full sequence. A nonzero smooth test identifies $a$ uniquely. Restoring the normalization in Equation (1.16) proves (3.28). ◻
]

#thm([Corollary 3.9.])[
  (The physical roughness criterion).  #emph[For every fixed $J$ and $k > 0$, 
#[#set math.equation(numbering: n => "(3.30)")
 $ a \( k \) > 0 quad arrow.l.r.double quad sup_(R gt.eq 1) bb(E)_(mu_(J \, v_J^2 k \, R)^0) h_0^2 = oo . $ <an:physical-equivalence>]

]
] <an:physical-criterion>

#proof[
  When $a = 0$, Proposition 9 gives the uniform zero-boundary point-variance bound. Conversely suppose the supremum on the right were finite, say at most $C_0$. For any vertex $x$ of any zero-boundary square, translate that square by $- x$ and enlarge to a centered square. Relaxing the additional zero pins increases variance, so $bb(E) h_x^2 lt.eq C_0$. Cauchy–Schwarz then gives $"Var" \( h \, f \) lt.eq C_0 \( sum_x \| f_x \| \)^2$ for every smear.
  Choose a compactly supported logarithmic pole in an interior disk, smoothed at radius $delta$. More explicitly, let it equal $log \( 1 \/ \| z \| \)$ on $2 delta lt.eq \| z \| lt.eq r_0$, smooth it radially to a constant at $\| z \| lt.eq delta$, and multiply by a fixed cutoff supported strictly inside the square. Its gradient energy grows as $2 pi log \( 1 \/ delta \) + O \( 1 \)$, while $integral \| Delta g_delta \|$ stays bounded: the inner radial Laplacian has bounded total mass, and the outer cutoff is fixed. At each fixed $delta$, finite differences give a uniform bound on $sum_x \| \( A_0 g_(delta \, n) \)_x \|$ as $n arrow.r oo$. Equation (3.29) would therefore bound $a integral \| nabla g_delta \|^2$ by a constant independent of $delta$. This is impossible if $a > 0$. ◻
]

#thm([Proposition 3.10.])[
  (Order and one-sided regularity of the coefficient).  #emph[The function $a : \( 0 \, oo \) arrow.r \[ 0 \, oo \)$ is nondecreasing, upper semicontinuous, and bounded above by $k$. It is strictly increasing on its positive set. More precisely, if $k_2 > k_1$ and $a \( k_1 \) > 0$, then 
#[#set math.equation(numbering: n => "(3.31)")
 $ frac(1, a \( k_2 \)) lt.eq frac(1, a \( k_1 \)) + 1 / k_2 - 1 / k_1 . $ <an:strict-growth>]

 If its positive set is nonempty, it equals $\[ k_c \, oo \)$ for some $k_c gt.eq 8 pi$, and the physical critical temperature is $beta_(upright(c)) \( J \) = v_J^2 k_c$. In particular the endpoint is rough.]
] <an:coefficient-regularity>

#proof[
  Finite precision comparison proves monotonicity and the bare bound $a lt.eq k$. The affine cutting estimate used to define $a$ gives, for each fixed cell size $m$,
  $ sqrt(a \( k \)) lt.eq sqrt(a_m \( k \)) + C sqrt(k \/ m) \, $
  with harmless vanishing normalization errors if the finite affine energy is not exactly one. The constants are uniform for $k$ in compact subintervals of $\( 0 \, oo \)$. Each finite-cell quantity is continuous in $k$, by absolute Gaussian summation, and $a_m \( k \) arrow.r a \( k \)$. Taking the upper limit as $k' arrow.r k$ and then $m arrow.r oo$ proves upper semicontinuity.
  For strict growth let $A_b$ be a free-cell Laplacian and let $g$ be a nonconstant affine shift. Work modulo constants, put $X = \( h \, A_b g \)$, $E_g = \( g \, A_b g \)$, and $U \( k \) = "Var" X \/ E_g > 0$. Differentiation of its finite Gaussian sum gives
  $ U' \( k \) = frac("Cov" \( X^2 \, \( h \, A_b h \) \), 2 k^2 E_g) . $
  Diagonalize the positive form $A_b$ on the mean-free space. The paired fourth-cumulant positivity of Lemma 4 bounds the numerator below by $2 \( q \, A_b q \)$, where $q = "Cov" \( h \, X \)$. Since $\( q \, A_b g \) = "Var" X$, Cauchy–Schwarz in the $A_b$-energy gives $\( q \, A_b q \) gt.eq \( "Var" X \)^2 \/ E_g$. Thus $U' gt.eq U^2 \/ k^2$. Integrating the derivative of $1 \/ U$ and passing to growing affine cells proves (3.31). Its right side is positive since $a \( k_1 \) lt.eq k_1$, and is strictly smaller than $1 \/ a \( k_1 \)$, proving strict increase.
  The gap in Corollary 8 is $a in { 0 } union \[ 8 pi \, oo \)$. Monotonicity makes a nonempty positive set an upper interval. At its infimum, upper semicontinuity and the gap force a positive value; $a lt.eq k$ implies $k_c gt.eq 8 pi$. Corollary 18 identifies this same infimum with the stated physical criterion and includes its endpoint. Nonemptiness and the exact endpoint value, differentiability above it, and the infinite endpoint slope are established in the later weak-height and endpoint arguments; none of those conclusions is assumed here. ◻
]

=== 3.4 Fixed mixed domains and the high law <fixed-mixed-domains-and-the-high-law>

We now fix $k_h$ with $a_h = a \( k_h \) > 0$. The results in this subsection are at this one input temperature; they assert no uniform scaling theorem at nearby temperatures. Lengths are measured in observation-cell units. On the lattice an observation cell has side $s$, with $s arrow.r oo$ along dyadic integers, and $B_s$ takes its uniform height average. A fixed continuum cell has side one, and $B$ takes its integral average.

#prodef([Definition 3.11.])[
  (Permitted mixed geometry).  Start with axis-parallel squares of a fixed dyadic side $R$. Remove from each corner the part of the square of side $R \/ 2$ centered at that grid vertex, and declare the latter squares to be separate tiles. Thus no tile vertex involves more than three tiles, and every pair of tiles meeting there also shares a nondegenerate face. Take finite unions of these tiles, possibly clipped along the $R \/ 4$ grid by boxes. Tiles may be isolated by removing every bond between them and other tiles. All exterior boundaries are free. Components are formed by face connections; boundary point contacts do not join them. Round all faces on observation-cell boundaries and retain only the prescribed internal $J$-bonds. Each component before hard pinning is a bounded Lipschitz union of squares with no opposite-only junction. Hard pins are finite unions of tiles or boxes on the indicated subdivision grid. The energy space is always that of the component before pinning, with functions zero almost everywhere on the pinned boxes.
] <an:geometry>

Figure 3 shows the tile partition and its three-tile junctions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0.58, 0), (1.74, 0), (1.74, 0.58), (2.32, 0.58), (2.32, 1.74), (1.74, 1.74), (1.74, 2.32), (0.58, 2.32), (0.58, 1.74), (0, 1.74), (0, 0.58), (0.58, 0.58), close: true, fill: rgb("#f7f7f7"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  line((0.58, 2.32), (1.74, 2.32), (1.74, 2.9), (2.32, 2.9), (2.32, 4.06), (1.74, 4.06), (1.74, 4.64), (0.58, 4.64), (0.58, 4.06), (0, 4.06), (0, 2.9), (0.58, 2.9), close: true, fill: rgb("#f7f7f7"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  line((2.9, 0), (4.06, 0), (4.06, 0.58), (4.64, 0.58), (4.64, 1.74), (4.06, 1.74), (4.06, 2.32), (2.9, 2.32), (2.9, 1.74), (2.32, 1.74), (2.32, 0.58), (2.9, 0.58), close: true, fill: rgb("#f7f7f7"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  line((2.9, 2.32), (4.06, 2.32), (4.06, 2.9), (4.64, 2.9), (4.64, 4.06), (4.06, 4.06), (4.06, 4.64), (2.9, 4.64), (2.9, 4.06), (2.32, 4.06), (2.32, 2.9), (2.9, 2.9), close: true, fill: rgb("#f7f7f7"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  rect((-0.58, -0.58), (0.58, 0.58), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((0, 0), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((-0.58, 1.74), (0.58, 2.9), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((0, 2.32), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((-0.58, 4.06), (0.58, 5.22), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((0, 4.64), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((1.74, -0.58), (2.9, 0.58), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((2.32, 0), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((1.74, 1.74), (2.9, 2.9), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((2.32, 2.32), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((1.74, 4.06), (2.9, 5.22), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((2.32, 4.64), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((4.06, -0.58), (5.22, 0.58), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((4.64, 0), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((4.06, 1.74), (5.22, 2.9), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((4.64, 2.32), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  rect((4.06, 4.06), (5.22, 5.22), fill: rgb("#e8e8ff"), stroke: (paint: rgb("#404040"), thickness: 0.55pt, join: "miter", miter-limit: 10))
  circle((4.64, 4.64), radius: 0.02293, fill: rgb("#8c8c8c"), stroke: none)
  line((1.74, 2.9), (2.9, 2.9), (2.32, 2.9), (2.32, 4.06), stroke: (thickness: 1.05pt, miter-limit: 10))
  circle((2.32, 2.9), radius: 0.05292, fill: black, stroke: none)
  content((2.32, 2.9), [#text(size: 9pt)[$q$]], anchor: "south-east", padding: 0.07056cm)
  content((1.16, 3.48), [#text(size: 9pt)[$A$]])
  content((3.48, 3.48), [#text(size: 9pt)[$B$]])
  content((2.32, 2.581), [#text(size: 9pt)[$C$]])
  line((0, 4.698), (0, 5.684), (2.32, 4.698), (2.32, 5.684), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  line((0, 5.51), (2.32, 5.51), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", length: 0.13cm, fill: black), end: (symbol: ")>", length: 0.13cm, fill: black)))
  content((1.16, 5.51), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
  line((1.74, 2.117), (2.9, 2.117), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", length: 0.13cm, fill: black), end: (symbol: ")>", length: 0.13cm, fill: black)))
  content((2.32, 2.117), [#text(size: 9pt)[$R"/"2$]], anchor: "north", padding: 0.07056cm)
  line((0, -0.058), (0, -1.044), (0.58, -0.058), (0.58, -1.044), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.899), (0.58, -0.899), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", length: 0.13cm, fill: black), end: (symbol: ")>", length: 0.13cm, fill: black)))
  content((0.29, -0.899), [#text(size: 9pt)[$R"/"4$]], anchor: "north", padding: 0.07056cm)
})],
  caption: [Figure 3: Permitted mixed tiles in Definition 20. Each original $R$-square loses its four $R \/ 4$-square corners to distinct $R \/ 2$-squares centered at the original grid vertices (dots); four trimmed originals and their vertex tiles are shown. The $R \/ 4$ tick marks the subdivision scale. At $q$, the three incident tiles $A \, B \, C$ share the three bold boundary segments pairwise; only two tiles meet at a corner of $C$. Later components are formed by retained face/bond connections; point contacts alone do not join components. ],
) <an:mixed-geometry-figure>

The proofs also apply to any fixed finite list of domains with these geometric properties, including the rectangular strips used below. In particular, touching boundary points never glue two components through a set of zero continuum capacity. For the deterministic form arguments this includes fixed finite face-connected unions of rectangular pieces with bounded lattice rounding, provided retained faces have the local bounded routes used below and neither point-only nor opposite-only contacts glue components.

On a fixed such open graph $U_s$, let $A_(0 \, U_s)$ retain just its prescribed bonds. For real observation values $y$ put

#[#set math.equation(numbering: n => "(3.32)")
 $ Z_U \( y \; k \) & = sum_(h in \( 2 pi bb(Z) \)^(U_s)) exp {- frac(\( h \, A_(0 \, U_s) h \), 2 k) - 1 / 2 parallel B_s h - y parallel^2} \,\
E_U \( y \; a' \) & = min_v {frac(\( v \, A_(0 \, U_s) v \), a') + parallel B_s v - y parallel^2} . $ <an:high-partition>]

An indicated hard pin imposes $h = 0$, or $v = 0$, throughout the specified set. Translation sums are included in (3.32); the observation mass controls every component’s constant mode. Write $P_U$ for the centered high law $y = 0 \, k = k_h$. In the continuum, the comparison high precision at $a' = a_h$ is the coercive form

#[#set math.equation(numbering: n => "(3.33)")
 $ cal(T)_U \( v \, w \) = a_h^(- 1) integral_U nabla v dot.op nabla w + sum_(d subset U) \( B v \)_d \( B w \)_d quad upright("on ") H^1 \( U \) . $ <an:continuum-high-form>]

Impose the specified zero conditions when pins are present. Superscript $upright("cg")$ denotes this continuum Gaussian comparison. Without pins, $E_U$ annihilates constants on each component.

#thm([Lemma 3.12.])[
  (Form and free-component limits).  #emph[On every fixed geometry of Definition 20, the discrete real-Gaussian forms converge to their continuum forms, with their stated free and zero-region boundary conditions. Inverse quadratic forms converge for bounded piecewise continuous density tests on coercive components. On a massless free component the test must have zero total, separately on every released component. Energy approximation is valid for shifts and trace-preserving combinations. The massless free height law at $k_h$, modulo its constant, has covariance $a_h$ times the Neumann inverse form and Gaussian Laplace limits on every component. Its fractional mean is uniform modulo $2 pi$, independently of any fixed list of mean-free observations.]
] <an:forms>

#proof[
  For smooth functions on a neighborhood of the closure, the discrete energies converge to $integral \| nabla v \|^2$: the symbol of $A_0$ has quadratic part $\| p \|^2$, internal Riemann sums converge, and the number of edges within a fixed lattice distance of the finitely many faces and corners is $O \( s \)$, each with squared smooth difference $O \( s^(- 2) \)$. Nearest-neighbor edges control the $H^1$ norm of piecewise affine interpolants on each constituent square, modulo a componentwise constant. Conversely all fixed-range differences are bounded by a fixed multiple of nearest-neighbor energy on local face-connected patches: a retained jump can be replaced by a nearest-neighbor route of bounded lattice length in one of the finitely many local square-sector patterns. There are no opposite-only contacts. Thus bounded energies give weak $H^1$ compactness on the squares, strong $L^2$ compactness, and matching traces across retained faces. The difference quotients for each step pass weakly to their directional derivatives. Their sum and the lattice symmetries give the continuum liminf energy with its exact coefficient.
  Here is the density statement with pins and corners. First truncate an $H^1$ function to bounded magnitude; this decreases gradient energy and preserves every zero region. Around each polygon vertex use a cutoff which is zero within radius $delta^2$, one outside radius $delta$, and linear in $log r$ between. Its squared gradient integral is $O \( 1 \/ \| log delta \| \)$. For a bounded function this removes all vertices at vanishing energy and $L^2$ cost. Away from them, a pinned straight face is treated by the zero-trace $H^1$ approximation on a half-rectangle, extending by zero into the pin before mollification. On a free face use even local extension and mollification. Interior patches are mollified directly. A finite partition of unity combines these approximations. They show that restrictions of smooth ambient functions are dense without pins, and functions smooth away from vertices and vanishing in a neighborhood of the pinned region are dense with pins. Sampling these functions gives recovery sequences. Observation-cell averages are continuous under strong $L^2$ convergence. The same liminf and recovery proof applies to a square with zero trace on every face, using zero extension on each face; this is the deterministic $H_0^1$ inverse-form assertion used in Theorem 17. Neumann Poincaré and cell masses, or a fixed positive-area hard pin, control constants. Minimizing the coercive forms minus a linear density source now proves inverse convergence by the liminf and recovery statements. The same reasoning, modulo constants, treats zero-total densities in an unpinned component.
  For the height law, enclose the component in a larger free square. For a smooth ambient shift, separate its gradient observation into the retained pieces on the component and on the finitely many remaining polygonal pieces. The omitted seam flows have vanishing bare squared cost by their $O \( s \)$ number and $O \( s^(- 1) \)$ coefficients. Cutting increases covariances; the resulting independent component variances each have the continuum gradient upper bound, by further subdivision into squares. Their sum already attains that bound in the enclosing free square by Theorem 5. Write $U_i$ for the retained pieces and $V_(i \, s)$ for their partial gradient-observation variances. For each component $i$, subtract the limsup upper bounds for the other finitely many pieces from the full limiting enclosing-square variance. The cutting inequality gives $liminf_s V_(i \, s) gt.eq a_h integral_(U_i) \| nabla g \|^2$. Together with its upper bound this proves full variance convergence on that component, along every admissible mesh sequence. The density of ambient shifts just proved and bare error bounds give full variance convergence on its full $H^1$ energy space. Cutting into small cells and the second-order logarithmic moment expansion used in Theorem 17 give the Gaussian Laplace limits. The form approximation transfers them to the stated density observations.
  Finally consider a character with nonzero integer total charge on one component, including fixed mean-free observations if desired. Extend its source by zero to the enclosing square. The dual shifted-ratio precision comparison from Lemma 4 bounds its positive characteristic function in the cut component by that in the uncut square. This can first be done with a tiny positive mass, then passed to the translation-modulo law because its total is an integer. Approximation by bounded-density profiles is justified by the bare norm bounds. The enclosing character tends to zero by Theorem 6. The same argument with joint mean-free sources, or Fourier approximation of a bounded function of those sources, proves independence of the uniform fractional mean. Distinct free components were independent from the outset. ◻
]

For finite observation penalties below, fix a finite vector $cal(O)_s h$ of cell averages or bounded piecewise continuous density smears covered by the preceding joint limits, with uniformly bounded bare covariance after constants are removed. An admitted quadratic penalty is

$ exp { - 1 / 2 \( cal(O)_s h - z \)^T Q \( cal(O)_s h - z \) } \, #h(2em) Q gt.eq 0 . $

The observation family is fixed through the mesh limit. Its center and coefficient matrix may range over a fixed compact set. Each observation lies in one pre-pin component, and $Q$ has no entries coupling different components. If a component constant is free, the induced quadratic form on the vector of released constants must have a common positive lower bound. Thus every such penalty confines all released constants.

#thm([Proposition 3.13.])[
  (Mixed-boundary height scaling).  #emph[On a fixed permitted component meeting a nonempty positive-area pin region, the centered massless height law at $k_h$ has the full Gaussian Laplace and moment limits with covariance $a_h$ times the mixed inverse: zero on that entire region and free on the other walls. This includes bounded piecewise continuous smears and energy-approximable shifts. Adding an admitted finite observation penalty gives the corresponding Gaussian limit, also for components without hard pins when translations are summed. The limits are uniform over the fixed compact coefficient and center sets just specified.]
] <an:mixed-scaling>

#proof[
  It suffices first to use a smooth shift $g$ vanishing on a neighborhood of the pin $p$, but allowed to reach the outer free walls. Choose a subband of positive width between $p$ and $"supp" g$, separated by positive gaps from both. It may follow level strips of sup distance to the whole pin region, clipped to the component. Select levels on a sufficiently fine fixed rectangular grid, then subdivide into mass cells. All clearances are fixed before the fine lattice limit. Where the pin has several components, use the union of these strips and retain those connected pieces through which a path to the support is possible.
  Start with the component unpinned, put the band weight on it, and explore from the entire pin region. Lemma 21 supplies the free Gaussian and fractional-mean inputs to Lemma 10. Its Hilbert–Schmidt bound follows by cutting the domain into finitely many squares: their $H^1$-to-$L^2$ inclusions have fourth-power summable singular values, which bounds the square of the Neumann inverse after the component constant is removed. The band controls that constant as before.
  We verify the local hypotheses of the exploration lemmas at free walls and junctions. A fixed-factor enlargement of a touched small cell within the component is a connected patch of a bounded number of comparable rectangles, joined by straight faces of comparable length. Its Poincaré constant is $C ell^2$: apply the rectangle inequalities and bound the differences of their means across the common faces by the same gradient energy. Truncate a visiting path when it spans a comparable cell distance. Some coordinate then spans $c ell s$ levels. Bounded jumps and the bounded number of local rectangles put a positive fraction of anchored rows or columns into one of these rectangles. The one-dimensional estimate in Lemma 11 anchors its mean; the patch Poincaré Inequality anchors the remaining rectangles. At a corner use all adjacent sectors of the same component. The no-opposite-only convention ensures that a retained jump lies in a sector or crosses between sectors joined through retained faces. A filled starting pin region itself supplies the initial zero extension for variations. Thus the same local inequality (3.9) holds, and a fixed macroscopic path anchors the whole component. Small-cell mean-free bare variance still costs $C \( 1 + log \( 1 \/ ell \) \)$: compare first to a containing fixed square patch using its Neumann modes, and then use the component Poincaré Inequality to compare means.
  The two coverings can be made of subdivisions reaching the free walls. A logarithmic trial restricted from the plane to a straight or sector patch has cell average and gradient energy proportional to $log \( 1 \/ delta \)$, with positive geometric constants; it therefore gives the large pre-exposure variance required in Proposition 16. The anchored post-exposure bound is independent of the cell radius. For the size-bias step take the starting covering on the test side, with the other covering on the pin side; both are away from the mass. Every nonzero tilt or exposed contribution between them again requires a macroscopic cluster. All of Lemmas 12–15 and both deficits (3.25), (3.26) therefore apply with the same limit order. The hard-band inverse separates the sides, so reach of the support has vanishing probability.
  The weak Laplacian source of $g$ is the energy functional $F_g \( v \) = integral_U nabla g dot.op nabla v$, including its free-face contributions. Its discrete observation $X_s = \( h \, A_(0 \, U_s) g_s \)$ is translation invariant and has bounded bare variance
  $ "Var"_(upright("bare")) X_s lt.eq k_h \( g_s \, A_(0 \, U_s) g_s \) = O \( 1 \) . $
  At each fixed band partition and strength, include $X_s$ in the joint free-component limit from Lemma 21. The translation-sum bound in the proof of Lemma 10 and this bare bound give uniform integrability of every fixed power of $X_s$ under the normalized band law. Since every mass-cell average of $g$ is zero, the continuum projected band form on $U$,
  $ cal(T)_(ell \, lambda) \( v \, w \) = a_h^(- 1) integral_U nabla v dot.op nabla w + lambda sum_d \| d \| v_d w_d \, $
  satisfies
  $ cal(T)_(ell \, lambda) \( a_h g \, v \) = F_g \( v \) . $
  Consequently, at every fixed $ell \, lambda$,
  $ lim_(s arrow.r oo) bb(E)_W X_s^2 = a_h integral_U \| nabla g \|^2 \, #h(2em) lim_(s arrow.r oo) bb(E)_W X_s^4 = 3 (a_h integral_U \| nabla g \|^2)^2 . $
  The fourth-moment limit is independent of $ell \, lambda$. On successful exploration the centered posterior has at least the desired pin, so its variance is at most the massless mixed variance. Equation (3.23) controls the tilt errors. On failure, Cauchy–Schwarz bounds the second moment by $\( bb(E)_W X_s^4 \)^(1 \/ 2) bb(P)_W \( upright("failure") \)^(1 \/ 2)$. The displayed fourth-moment limit and vanishing reach make this term vanish in the prescribed order, with no finite-mesh uniformity in $lambda$ required. Run this comparison on any lattice subsequence and then take the stated band limits. It gives the liminf lower bound $a_h integral \| nabla g \|^2$ for the actual hard-pin variance. Free cutting gives the matching limsup, hence full variance convergence. Free cutting also gives the upper logarithmic moment bound, and minimal Hessian gives the matching lower logarithmic moment bound. The pinned density and form approximation of Lemma 21 extends these conclusions to the asserted tests.
  An admitted finite observation penalty can now be integrated against these joint massless limits. In a pinned component bare Gaussian bounds give uniform integrability for polynomial and fixed exponential insertions. In free components use the independent uniform fractional means and their translation sums. The common lower bound on the quadratic form of the released constants gives a uniform finite-dimensional Gaussian theta bound on these sums, as in Lemma 10. On a fixed compact coefficient and center set the limiting normalizers are continuous and bounded away from zero. The same tail bounds give equicontinuity of the integrals there. This proves the last assertion and its stated compact-set uniformity. ◻
]

=== 3.5 Separated Gaussian pins and localization <separated-gaussian-pins-and-localization>

For disjoint positive-area box regions $H \, p subset U$ at strictly positive separation, define under the unpinned centered high law

#[#set math.equation(numbering: n => "(3.34)")
 $ D_U \( H \, p \) = log frac(P_U \( h_H = 0 divides h_p = 0 \), P_U \( h_H = 0 \)) . $ <an:pin-interaction-definition>]

An empty contribution in a component is zero. Each hard pin means all microscopic heights in that region vanish. Precision monotonicity gives $D_U gt.eq 0$, by first imposing the pins as diverging positive quadratic penalties. The individual pin probabilities need not have finite or positive continuum limits; only their interaction will be compared.

#thm([Proposition 3.14.])[
  (Gaussian pin determinant and locality).  #emph[All assertions in this proposition are for real Gaussians. The discrete limits allow every integer sequence $s arrow.r oo$ satisfying the bounded lattice rounding and retained-route assumptions above. The gradient coefficient may be any fixed $a_(upright(g)) > 0$, independently of the height input $k_h$: for unit-cell mass replace $cal(T)_U$ by 
$ cal(T)_(U \, a_(upright(g))) \( v \, w \) = a_(upright(g))^(- 1) integral_U nabla v dot.op nabla w + sum_(d subset U) \( B v \)_d \( B w \)_d . $

 At $a_(upright(g)) = a_h$ this is (3.33). Let $cal(E)_U$ be the Hilbert space with inner product $cal(T)_(U \, a_(upright(g)))$. Set 
$ V_p = { v in cal(E)_U : v = 0 upright(" a.e. on ") p }^perp \, #h(2em) V_H = { v in cal(E)_U : v = 0 upright(" a.e. on ") H }^perp \, $

 and denote the orthogonal projections by $Pi_p \, Pi_H$. Then $C = Pi_H \|_(V_p)$ is Hilbert–Schmidt and $parallel C parallel < 1$. The finite interaction is 
#[#set math.equation(numbering: n => "(3.35)")
 $ D_U^(upright("cg")) \( H \, p \) = - 1 / 2 log det #scale(x: 120%, y: 120%)[\(] "Id" - C^(*) C #scale(x: 120%, y: 120%)[\)] = - 1 / 2 log det #scale(x: 120%, y: 120%)[\(] "Id" - Pi_p Pi_H Pi_p \|_(V_p) #scale(x: 120%, y: 120%)[\)] . $ <an:pin-determinant>]

 The full-pin interactions for the corresponding discrete real Gaussians converge to (3.35) as $s arrow.r oo$; for real Gaussians the interaction is the logarithm of the corresponding density ratio at zero.]
  #emph[The same Hilbert–Schmidt property, norm gap, determinant formula, full discrete pin limit, and exhaustion by finite smooth pin-density probes hold for the modified energy space with form 
$ a_(upright(g))^(- 1) integral_U nabla v dot.op nabla w + \( cal(O) v \)^T Q \( cal(O) w \) \, #h(2em) Q gt.eq 0 \, $

 where $cal(O)$ is a fixed finite family of box averages or bounded piecewise continuous density smears, each supported in one pre-pin component, and $Q$ has no entries coupling different components. The fixed penalty is coercive on the whole released component-constant subspace. The rank, coefficients, geometry, and separated positive-area pin regions remain fixed through the mesh limit. This includes each fixed confining band partition and strength. It also applies to the fixed face-connected rectangular-piece geometries described after Definition 20, with the same pre-pin energy space.]
  #emph[For the locality assertions below, the mass cells may also be axis-parallel rectangles whose side lengths lie in a fixed interval $\[ c_0 \, C_0 \] subset \( 0 \, oo \)$ and whose aspect ratios are bounded. Here $\( B v \)_d = \| d \|^(- 1) integral_d v$, $B_s$ takes the corresponding discrete uniform averages, and every cell has the squared-average mass with coefficient one. These bounds include any fixed finite normalized shape list and its bounded lattice rounding. For this local cell mass, harmonic extension and inverse-form sources have energy tails bounded by $C e^(- c r)$ at distance $r$ from their supports. Cross-projection Hilbert–Schmidt norms satisfy the same decay up to a polynomial factor in the number of relevant cells, with a fixed positive lower bound on the pin clearance for the two restrictions. Consequently $D_U^(upright("cg")) \( H \, p \) lt.eq C e^(- c r)$ up to such a factor when their separation is $r$ and their volumes are polynomial in $r$.]
  #emph[For this local cell mass let $T_(U \, a')$ be the operator of $cal(T)_(U \, a')$ and write $sans(E)_(U \, a') = "Id" - B T_(U \, a')^(- 1) B^(*)$ for the matrix of (3.32), with its discrete analogue using $B_s$. Its off-diagonal entries decay exponentially. If bonds at a core are cut, the change of this matrix decays exponentially as either observation index recedes from the core. Computing this change in an open patch whose guard has width $r$ makes an error bounded by 
#[#set math.equation(numbering: n => "(3.36)")
 $ C e^(- c r - c "dist" \( i \, j \)) $ <an:local-energy-error>]

 in cell entries, after local differences are extended by zero. All the preceding locality constants, including the tail and cross-projection bounds, are uniform when $a'$ ranges over a fixed compact interval in $\( 0 \, oo \)$ and on the permitted cell ensembles with the stated uniform shape bounds and uniform polynomial ball volumes in the cell graph. The compared topologies use the same $a'$. Patch boundaries follow cell faces and the guard width is measured in the common inclusion cell graph. The discrete locality estimates also hold on finite periodic identifications satisfying the same cell and retained-route assumptions and polynomial ball-volume bounds. Distances are then measured in the quotient inclusion graph, and the guard width is the distance to the bonds actually cut to form the patch. The patch is a union of intact cells with all crossing bonds cut; an opened periodic seam counts as part of its boundary. A patch equal to the whole component with its periodic bonds retained has zero proxy error. Without hard pins these change and error forms have zero row sum on each underlying component. Thus an entry bound with prefactor $delta$ and exponential distance decay bounds their quadratic forms by 
#[#set math.equation(numbering: n => "(3.37)")
 $ C delta sum_({ i \, j } upright(" neighboring cells in the region")) \( y_i - y_j \)^2 . $ <an:row-sum-gradient>]

 For hard-wall changes one instead retains the entry bounds on $y_i y_j$, with decay from the walls.]
] <an:gaussian-localization>

#proof[
  For the local cell form, Poincaré on each permitted rectangle and the upper and lower area bounds give the uniform norm equivalence
  #[#set math.equation(numbering: n => "(3.38)")
   $ c (parallel v parallel_2^2 + parallel nabla v parallel_2^2) lt.eq cal(T)_U \( v \, v \) lt.eq C (parallel v parallel_2^2 + parallel nabla v parallel_2^2) . $ <an:high-coercivity>]
  The discrete version follows from the same cell inequality, nearest-neighbor domination, and the bounded routes for retained $J$-bonds. The proof applies at any fixed positive gradient coefficient. More quantitatively, if $a' in I = \[ a_(-) \, a_(+) \] subset.double \( 0 \, oo \)$, then
  $ min { 1 \, a_h \/ a_(+) } cal(T)_(U \, a_h) lt.eq cal(T)_(U \, a') lt.eq max { 1 \, a_h \/ a_(-) } cal(T)_(U \, a_h) . $
  Thus the coercivity, cutoff absorption, and layer-contraction constants below can be chosen uniformly on $I$, in the continuum and on the discrete graphs. In the local estimates below, $cal(T)_U$ denotes the chosen local cell form, with its coefficient held fixed while topologies are compared. Each vector in $V_p$ minimizes energy subject to its values on $p$; it is therefore weakly harmonic for its specified form off $p$.
  We give the local estimates behind compactness and locality. Let $v$ be harmonic away from a source region. Test its equation by $chi^2 v$, with a Lipschitz cutoff supported away from the source. Expanding the gradient term and applying $2 \| a b \| lt.eq epsilon a^2 + epsilon^(- 1) b^2$ absorbs half the gradient term and bounds the rest by the $L^2$ mass on the cutoff layer. The average penalty in a cell wholly inside the constant part of the cutoff is nonnegative. Cells meeting its transition are contained in a bounded enlargement of the layer, and their average cross terms are bounded by that layer’s $L^2$ mass. Thus
  $ cal(T)_U \( v \, v \; upright("inner patch") \) lt.eq C parallel v parallel_(L^2 \( upright("enlarged patch") \))^2 $
  whenever the inner patch is separated from sources by a fixed positive margin. Here local energy includes entire cells, and enlarging by finitely many cell layers absorbs the average terms. This proof uses no integration boundary term, so is valid up to free walls. Discrete differences obey the same expansion, with cutoff differences $O \( s^(- 1) \)$ and a fixed enlargement by the interaction range.
  Using instead a cutoff which retains $v$ near its source and removes its distant tail, harmonic minimality and (3.38) imply
  $ cal(T)_U \( v \, v \; "dist" gt.eq r + c_1 \) lt.eq C cal(T)_U \( v \, v \; r lt.eq "dist" lt.eq r + c_1 \) . $
  Equivalently each extra layer reduces the remaining tail by a factor at most $C \/ \( 1 + C \) < 1$. Iteration proves exponential energy and $L^2$ decay. A source in one observation cell obeys the same bound outside that cell. Distances may be measured in the retained face-cell graph. For estimates on changing topologies they may also be measured in the uncut inclusion-region graph: a retained path can only become longer on removing bonds, while a distance cutoff in the inclusion graph still has uniformly bounded differences on retained bonds. Polynomial ball volumes control the number of layer cells. These cutoff estimates use only the local cell and route bounds and the graph distance, so they hold on a finite periodic identification with the quotient inclusion distance as well.
  To obtain a trace estimate, cut a bounded patch into its rectangular mass cells. The inclusion from broken cell $H^1$ into $L^2$ has singular values bounded by $C j^(- 1 \/ 2)$, with the appropriate cell-count factor, by the Neumann cosine eigenvalues on each rectangle and the uniform side-length bounds. The same bound holds uniformly on discrete rectangles: the nearest-edge cosine eigenvalues control all frequencies up to the finite lattice cutoff. Apply this inclusion on a first patch, the harmonic interior bound on a smaller patch, a second such inclusion, and then another interior bound. The singular-value product inequality $s_(2 j - 1) \( A B \) lt.eq s_j \( A \) s_j \( B \)$ gives
  #[#set math.equation(numbering: n => "(3.39)")
   $ s_j \( upright("restriction of harmonic extension") \) lt.eq C j^(- 1) . $ <an:singular-tail>]
  This is Hilbert–Schmidt, with uniformly vanishing squared singular-value tails. Leave an additional distance margin before these two restrictions; the exponential operator bound already proved then multiplies the Hilbert–Schmidt bound. Projection onto $V_H$ is unchanged when a function is multiplied by a cutoff equal to one near $H$, since their difference vanishes on $H$. The estimates therefore apply to the cross projections. For a fixed finite observation penalty on a fixed domain, Poincaré and control of the released constants still give coercivity with fixed constants. If a pin gap is smaller than a cell, or an observation crosses a cutoff patch, retain the finitely many involved averages as extra coordinates $F \( v \) in bb(R)^m$ in the interior estimate:
  $ parallel v parallel_(H^1 \( upright("inner") \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel v parallel_(L^2 \( upright("outer") \)) + \| F \( v \) \| #scale(x: 120%, y: 120%)[\)] . $
  The same estimate holds discretely. Each augmented inclusion $H^1 xor bb(R)^m arrow.r L^2 xor bb(R)^m$ has $s_(j + m) lt.eq C j^(- 1 \/ 2)$. The two restrictions therefore give $s_(2 j + O \( m \)) lt.eq C j^(- 1)$, which is the same square-summable tail after a fixed index shift. This proves compactness and (3.39) for the modified fixed form. Its constants may depend on that penalty; no exponential uniformity as a band rank or strength increases is asserted.
  The intersection $V_p ∩ V_H$ is zero. In fact choose a smooth cutoff equal to one on $p$ and zero near $H$. It decomposes any $H^1$ test into a function vanishing on $p$ and a function vanishing on $H$. A vector in both orthogonal complements is orthogonal to every test, hence zero. Compactness of $C$ then gives $parallel C parallel < 1$: equality would have an attaining unit vector whose two projections are both isometries, placing it in the intersection. For the local cell masses with the stated fixed positive pin clearance, the cutoff can be chosen with uniformly bounded multiplier norm $parallel chi v parallel_(cal(E)_U) lt.eq M parallel v parallel_(cal(E)_U)$, by the uniform local coercivity. For a unit $v in V_p$, $v - chi v$ vanishes on $p$ and $chi v$ vanishes on $H$, so
  $ 1 = chevron.l v \, chi v chevron.r_(cal(E)_U) = chevron.l \( "Id" - Pi_H \) v \, chi v chevron.r_(cal(E)_U) lt.eq M parallel \( "Id" - Pi_H \) v parallel_(cal(E)_U) . $
  Thus $parallel C parallel^2 lt.eq 1 - M^(- 2)$ uniformly. The determinant formula proved below and the Hilbert–Schmidt bound then give
  $ D_U^(upright("cg")) \( H \, p \) lt.eq frac(parallel C parallel_(upright("HS"))^2, 2 \( 1 - parallel C parallel^2 \)) lt.eq M^2 / 2 parallel C parallel_(upright("HS"))^2 \, $
  which supplies the uniform determinant prefactor in the local cell estimates. For a fixed nonlocal penalty the preceding pointwise gap and penalty-dependent constants suffice. For finite lists of pin observations the Gaussian Schur formula gives $- 1 / 2 log det \( "Id" - C^(*) C \)$. Exhausting the observation subspaces by smooth density probes gives (3.35), since $C^(*) C$ is trace class and has norm below one. Densities in $p$ are total for $V_p$: orthogonality to all their representers means the tested energy function is zero a.e. on $p$. The analogous statement holds for $H$. This totality and Schur-formula exhaustion are in the specified energy space, so the same argument gives the displayed determinant for every modified fixed form in the statement.
  We spell out why lattice refinement loses no trace. Lemma 21 gives convergence of the Gram matrices of every fixed finite list of density representers and of their pinned projections. A sequence of unit-energy discrete vectors harmonic off $p$ has weakly convergent interpolants; testing on the dense shifts from that lemma shows that its weak limit is harmonic off $p$. Conversely, projecting a fixed representer onto $V_p$ converges strongly in energy, by convergence of its variational minimum and norm. If such a bounded sequence has weak limit zero, compact $L^2$ convergence and the interior estimate make its energy near $H$ tend to zero. For a fixed observation penalty the finitely many averages converge too, so cause no exception. The cutoff observation just used then gives norm convergence to zero of its projection onto $V_H$. It follows by contradiction that residual cross projections outside a growing finite probe list have uniformly small operator norm in the lattice limit. Equation (3.39) makes their Hilbert–Schmidt norms uniformly small as well: first retain finitely many singular directions and use the operator bound there, then sum the uniform $j^(- 2)$ tail. Thus the cross products converge in trace norm and are eventually bounded in norm by a fixed number less than one. The Fredholm logarithm, given by $- log det \( "Id" - K \) = sum_(m gt.eq 1) "tr" \( K^m \) \/ m$, converges. This proves the full discrete Gaussian determinant limit. The exponential Hilbert–Schmidt estimate proves the claimed decay of the determinant when the separation is large; for bounded separation its fixed geometry bound suffices.
  It remains to verify the local cell statements about $sans(E)_(U \, a')$. Minimizing (3.32) gives $v_y = T_(U \, a')^(- 1) B^(*) y$ and $E_U \( y \; a' \) = y^T \( "Id" - B T_(U \, a')^(- 1) B^(*) \) y$. The source-tail estimate applied to $y = e_i$ gives exponential off-diagonal entries. Restoring bonds adds a positive form, so the change of the minimum energy is positive semidefinite. If the added bonds are at a core, use as a competitor the old minimizer cut to zero in a neighborhood of that core. Its energy excess over the old minimum is exactly the squared norm of the correction in the old form, since the old minimizer is stationary. The correction is supported near the core and has energy bounded by the tail estimate. There is no new cross-bond energy because it vanishes on both ends of every restored bond. This bounds diagonal changes by $C e^(- c "dist" \( i \, upright("core") \))$; positive-form Cauchy–Schwarz bounds their entries by the geometric mean of diagonal bounds. Let $D_(upright("full"))$ and $D_(upright("patch"))$ be the full and open-patch core changes, extending the latter by zero. If the patch retains the whole component and all its ambient bonds, they agree. Otherwise the core estimate bounds their difference by $C e^(- c \( d_i + d_j \))$, where $d_i$ is the distance from index $i$ to the core. When both indices lie in the patch, cutting its boundary is a direct sum because the mass is cell-local. The same difference is then a difference of two boundary changes and is bounded by $C e^(- c \( b_i + b_j \))$, where $b_i$ is the distance to that boundary. The guard gives $d_i + b_i gt.eq r - O \( 1 \)$, so the minimum of the two bounds has a factor $e^(- c r)$. If an index is outside the patch, the patch entry is zero and that index has core distance at least $r - O \( 1 \)$, giving the same factor from the core bound. Independently, the full and patch energy matrices have the off-diagonal spatial decay just proved. Taking a geometric mean with that bound and weakening $c$ proves (3.36) for every entry. Retaining another fraction of the core bound permits summation over cores with polynomial cell counts.
  Without hard pins a componentwise constant $y$ has zero minimum energy; symmetry therefore gives zero row sums for the matrices and their differences. A symmetric zero-row-sum matrix $F$ obeys
  $ y^T F y = - 1 / 2 sum_(i \, j) F_(i j) \( y_i - y_j \)^2 . $
  For each pair choose a shortest nearest-cell path in the inclusion region. Its length times the sum of squared differences along it bounds $\( y_i - y_j \)^2$. Pairs of length $l$ using a given edge have both endpoints in its $l$-ball, whose volume is polynomial. Summing the exponential entry bound over $l$ proves (3.37); no separate flow-congestion assertion is needed. At junctions bounded microscopic jumps can be shadowed by face-cell paths with bounded excess length, precisely because opposite-only contacts are excluded. For hard-wall changes the constant need not lie in the null space, so one uses the proven magnitude bounds directly. ◻
]

#thm([Proposition 3.15.])[
  (Full hard-pin comparison).  #emph[For every fixed geometry and separated box regions $H \, p$ as above, at $k = k_h$, 
#[#set math.equation(numbering: n => "(3.40)")
 $ D_U \( H \, p \) arrow.r D_U^(upright("cg")) \( H \, p \) #h(2em) \( s arrow.r oo \) . $ <an:full-pin-limit>]

 The baseline on both sides has unit-cell observation mass, free exterior walls, and no other hard pins.]
] <an:pin-interaction>

#proof[
  It suffices to treat one component meeting both regions. Place a band $K$ between them with positive clearances, and replace the unit-cell mass by $W_(ell \, lambda)$. Denote the resulting interaction by $D_W$. For a pin set $Q in { diameter \, H \, p \, H union p }$, let $Z_(M \, Q)$ be its partition sum with mass penalty $M$, where $M = U$ denotes the unit-cell mass and $M = W$ the band mass. Direct cancellation gives the exact identity
  #[#set math.equation(numbering: n => "(3.41)")
   $ D_U - D_W = log Z_(U \, H union p) / Z_(W \, H union p) + log Z_(U \, diameter) / Z_(W \, diameter) - log Z_(U \, H) / Z_(W \, H) - log Z_(U \, p) / Z_(W \, p) . $ <an:four-mass-ratios>]
  Each ratio is a change between two fixed finite-rank confining penalties on the same massless domain. For $Q eq.not diameter$, it is the ratio of their expectations in the normalized massless mixed law. For $Q = diameter$, use the sigma-finite per-translation-orbit normalization. Its common massless factor cancels inside this ratio. Proposition 22 and Lemma 21 show that, at fixed band partition and strength, every ratio has precisely its Gaussian limit. No normalization belonging to two different pin sets has been compared. By Proposition 23, the corresponding Gaussian identity can be written with the full continuum determinants. Consequently
  #[#set math.equation(numbering: n => "(3.42)")
   $ D_U - D_W arrow.r D_U^(upright("cg")) - D_W^(upright("cg")) quad upright("at each fixed ") ell \, lambda . $ <an:interaction-difference>]
  To remove the band, explore all clusters meeting $p$ under its unpinned band law $mu$. On the success event $cal(S)$ that $H$ is untouched, the centered posterior $mu_(0 \, cal(F))$ has zero pins throughout the visited set, tightened outgoing cable remainders, and the restricted centered band mass. It is obtained from $mu \( thin dot.op divides h_p = 0 \)$ by further zero pins and increased precision. Its probability of the untouched pin $h_H = 0$ is therefore at least $mu \( h_H = 0 divides h_p = 0 \)$. The actual posterior has the linear tilt from the exposed cell averages, with bare variance at most $epsilon^2$ in (3.22). The event $h_H = 0$ is inversion symmetric, so (3.20) gives the relative bound
  $ mu \( h_H = 0 divides cal(F) \) gt.eq e^(- epsilon^2 \/ 2) mu \( h_H = 0 divides h_p = 0 \) quad upright("on ") cal(S) . $
  Averaging, for every $delta > 0$,
  #[#set math.equation(numbering: n => "(3.43)")
   $ e^(- D_W) gt.eq bb(E)_W \[ upright(bold(1))_(cal(S)) e^(- epsilon^2 \/ 2) \] gt.eq e^(- delta \/ 2) bb(P)_W \( cal(S) ∩ { epsilon^2 lt.eq delta } \) . $ <an:relative-pin-bound>]
  The mixed-domain verification in Proposition 22 permits Proposition 16 and (3.23) here. First the tilt vanishes at each fixed $lambda$; then the reach probability vanishes as $lambda$ increases. Since $D_W gt.eq 0$, sending $delta arrow.b 0$ proves that $D_W arrow.r 0$ in the three prescribed limits. This is a relative bound, independent of how small either microscopic pin probability is.
  The same conclusion holds for $D_W^(upright("cg"))$. A direct way to avoid separate divergent determinants for an infinitely strong local mass is to run the proof on real Gaussian lattices with coefficient $a_h$. Their translation integral is Lebesgue measure, all free and mixed form limits follow from Lemma 21, and the cable-sign, path, tail, and tilt proofs are unchanged. Replace each pin probability by its joint density at zero. Its centered density increases under added precision. The tilt ratio at zero obeys (3.20), since the conditional centered Gaussian on that pin still has a symmetric linear tilt. To justify averaging posterior densities, first average probabilities of small boxes around zero on $cal(S)$, divide by their volumes, and use Fatou and the continuous Gaussian densities. This proves (3.43) for densities. Proposition 23 passes their full-pin interactions to the continuum at every fixed band partition. Thus $D_W^(upright("cg")) arrow.r 0$ as well. Combining these two vanishing statements with (3.42) proves (3.40): take a lattice limsup at fixed $ell \, lambda$, then refine the band, and finally increase its strength. ◻
]

=== 3.6 Conditional pin data and changes of topology <conditional-pin-data-and-changes-of-topology>

The phrase “convergence at random pin data” requires a precise interpretation because no pointwise trace of the continuum GFF is available. Fix an increasing total list of smooth density observations inside $p$. A lattice random variable depending on $h_p$ converges in the finite-observation approximation sense if, for each error tolerance, it can be approximated in probability by a function of a sufficiently long fixed list of these observations, with that function converging to its Gaussian counterpart; the error then tends to zero as the list is increased after the lattice limit. This definition also specifies joint convergence of any finite number of such quantities.

#thm([Proposition 3.16.])[
  (Conditional convergence and pin ratios).  #emph[In the centered high law on a fixed permitted geometry, for every fixed finite list of real linear cell or bounded piecewise continuous density smears $X$ with their sampled profiles, the conditional expectations $bb(E) \( e^X divides h_p \)$ converge in probability in the finite-observation approximation sense to their Gaussian conditional values. The same holds jointly for conditional weak laws on fixed finite lists. Define 
#[#set math.equation(numbering: n => "(3.44)")
 $ r_H \( b \) = frac(P_U \( h_H = 0 divides h_p = b \), P_U \( h_H = 0 divides h_p = 0 \)) . $ <an:conditional-pin-ratio>]

 Then 
#[#set math.equation(numbering: n => "(3.45)")
 $ 0 < r_H \( b \) lt.eq 1 \, #h(2em) bb(E) r_H = e^(- D_U \( H \, p \)) \, $ <an:pin-ratio-mean>]

 and $r_H$ converges in the same approximation sense to the Gaussian ratio $r_H^(upright("cg"))$, which is strictly positive almost surely. The expectation identity in Equation (3.45) is for the centered high law. The convergence assertions persist under a real exponential tilt $T_s = sum_j t_j X_(j \, s)$ from a fixed finite list of such observations, or energy-approximable observations with the same joint full and hard-pinned Laplace and moment limits together with the pin probes. The chosen list must have uniformly bounded bare covariance. The coefficients $t_j$ may range over a fixed compact set. The limit is the corresponding tilted Gaussian conditional law. When the centered ratio $r_H$ is evaluated at tilted random pin data its pointwise bounds remain valid, but its expectation need not remain $e^(- D_U \( H \, p \))$.]
  #emph[If restoring bonds supported inside $H$ changes the centered high law from $mu$ to $nu$, and $Q_Delta \( h \) = exp \( - \( h \, Delta h \) \/ 2 \)$ is their positive quadratic penalty, set 
#[#set math.equation(numbering: n => "(3.46)")
 $ r_Delta \( b \) = frac(bb(E)_mu \( Q_Delta divides h_p = b \), bb(E)_mu \( Q_Delta divides h_p = 0 \)) . $ <an:restoration-ratio>]

 Then 
#[#set math.equation(numbering: n => "(3.47)")
 $ r_H lt.eq r_Delta lt.eq 1 \, #h(2em) frac(thin upright(d) nu_p, thin upright(d) mu_p) = frac(r_Delta, bb(E)_mu r_Delta) \, #h(2em) r_H lt.eq frac(thin upright(d) nu_p, thin upright(d) mu_p) lt.eq e^(D_U \( H \, p \)) . $ <an:topology-density>]

 Consequently events about the pin data whose probabilities tend to zero can be transferred in both directions between these cut and restored topologies with identical exterior. All assertions concern fixed domains and fixed finite lists; they do not assert convergence uniformly at arbitrarily prescribed microscopic pin values.]
] <an:conditional-pins>

#proof[
  Let $X_s$ be one real smear, $b = h_p$, and put
  $ m_s \( b \) = bb(E) \( X_s divides b \) \, #h(2em) v_(p \, s) = "Var" \( X_s divides h_p = 0 \) . $
  Denote its full and pinned Gaussian limiting variances by $v$ and $v_p$. Conditioning on $b$ gives an affine Gaussian-lattice law with the same quadratic part as the centered $p = 0$ law, including when the affine shift has components normal to the remaining lattice span. Minimal covariance in Lemma 4, also after a further real tilt $t X_s$, gives
  #[#set math.equation(numbering: n => "(3.48)")
   $ "Var" \( X_s divides b \; upright(" tilt ") t X_s \) gt.eq v_(p \, s) . $ <an:conditional-variance-lower>]
  Let $Z_s^(\( N \))$ be the first $N$ pin smears and let $L_s^(\( N \))$ be their linear combination using the limiting Gaussian regression coefficients for $X$. Redundant directions may be removed, or the inverse Gram matrix taken on its range. Conditional expectation and variance decomposition give the exact bound
  #[#set math.equation(numbering: n => "(3.49)")
   $ bb(E) \| m_s - L_s^(\( N \)) \|^2 & = bb(E) \| X_s - L_s^(\( N \)) \|^2 - bb(E) "Var" \( X_s divides b \)\
 & lt.eq bb(E) \| X_s - L_s^(\( N \)) \|^2 - v_(p \, s) . $ <an:regression-saturation>]
  The full and pinned Gaussian limits are given by Proposition 22. If $f$ is the energy representer of $X$ and $P_N$ projects onto the first $N$ pin representers, the limiting right side is $parallel \( Pi_p - P_N \) f parallel_(cal(E)_U)^2$. It tends to zero by totality of the pin density probes. Thus $m_s$ is approximated in $L^2$ by finite Gaussian linear predictions, and its limiting law is Gaussian of variance $v - v_p$.
  Integrating (3.48) twice in $t$ yields
  #[#set math.equation(numbering: n => "(3.50)")
   $ Y_s \( b \) := bb(E) \( e^(X_s) divides b \) gt.eq exp { m_s \( b \) + v_(p \, s) \/ 2 } . $ <an:conditional-exp-lower>]
  Both sides have limiting expectation $e^(v \/ 2)$. For the right side this follows from the just proved prediction convergence and uniform exponential integrability: Jensen gives $bb(E) e^(q m_s) lt.eq bb(E) e^(q X_s)$, whose bare Gaussian bound is uniform for each fixed $q$. For the left side it is the full Laplace limit. Their nonnegative difference therefore tends to zero in $L^1$. This proves the conditional exponential assertion for $X$, and for every real linear combination of a fixed finite list. To obtain conditional weak laws, take a countable dense set of those linear combinations. From any subsequence one can extract a subsequence on which their probability errors tend to zero almost surely. Conditional exponential moment bounds make the finite-dimensional laws tight, and their Laplace transforms identify the Gaussian conditional law. Approximation by bounded continuous functions then gives the asserted conditional weak convergence, including conditional expectations of fixed smooth quadratic penalties.
  For completeness, describe the Gaussian pin ratio explicitly. Let $s_j$ be the singular values of $C = Pi_H \|_(V_p)$ from Proposition 23. In canonical coordinates the pin observations are standard Gaussian $xi_j$ on $p$, and their correlated standard coordinates on $H$, say $eta_j$, satisfy
  $ eta_j divides xi_j med tilde.op N \( s_j xi_j \, 1 - s_j^2 \) . $
  The ratio of the conditional density at zero to its centered conditional value is consequently
  #[#set math.equation(numbering: n => "(3.51)")
   $ r_H^(upright("cg")) = exp {- 1 / 2 sum_j frac(s_j^2, 1 - s_j^2) xi_j^2} . $ <an:gaussian-ratio>]
  This is the limit of finite-probe density ratios, rather than a separate density for a full continuum pin. The exponent is finite almost surely because
  $ sum_j frac(s_j^2, 1 - s_j^2) lt.eq frac(parallel C parallel_(upright("HS"))^2, 1 - parallel C parallel^2) < oo . $
  It is therefore strictly positive, and Gaussian integration gives
  #[#set math.equation(numbering: n => "(3.52)")
   $ bb(E) r_H^(upright("cg")) = product_j sqrt(1 - s_j^2) = e^(- D_U^(upright("cg")) \( H \, p \)) . $ <an:gaussian-ratio-mean>]
  At finite lattice spacing, prescribing $b$ identifies an affine copy of the zero-$p$ lattice. Apply the shifted-to-centered ratio comparison while increasing the quadratic precision on $H$. It shows that every normalized conditional penalty ratio lies at most one and decreases when that penalty is increased. A sufficiently large multiple of the full coordinate-square penalty on $H$ dominates any fixed smooth positive penalty there. Taking this multiple to infinity yields $0 < r_H lt.eq 1$. Integrating its definition immediately gives (3.45).
  Choose increasing finite smooth penalties $Q_N$ exhausting the pin on $H$: successively include a total list of density probes and increase their positive strengths. Define
  $ R_(N \, s) \( b \) = frac(bb(E) \( Q_N divides h_p = b \), bb(E) \( Q_N divides h_p = 0 \)) . $
  The preceding ordering gives $r_(H \, s) lt.eq R_(N \, s) lt.eq 1$. For fixed $N$, conditional weak convergence and the hard-$p = 0$ limit identify $R_(N \, s)$ with its Gaussian counterpart. Moreover
  #[#set math.equation(numbering: n => "(3.53)")
   $ bb(E) \( R_(N \, s) - r_(H \, s) \) = bb(E) R_(N \, s) - e^(- D_(U \, s)) . $ <an:penalty-pin-gap>]
  The full interaction limit (3.40) and the cross-projection trace approximation in Proposition 23 make the right side tend to zero as $N arrow.r oo$ after $s arrow.r oo$. Indeed the corresponding Gaussian expectations decrease to (3.52), by finite Gaussian conditioning and the convergent determinant. Markov’s Inequality in (3.53) proves the claimed approximation in probability for the full ratio. In particular its strictly positive Gaussian limit implies
  #[#set math.equation(numbering: n => "(3.54)")
   $ lim_(epsilon arrow.b 0) limsup_(s arrow.r oo) bb(P) \( r_(H \, s) lt.eq epsilon \) = 0 . $ <an:pin-ratio-away-zero>]
  A tilt from the admitted fixed observation list has a uniformly bounded $L^q$ density for every fixed finite $q$: its normalizing denominator is at least one and the uniform bare covariance bound controls the numerator’s moments. The bound is uniform when its coefficients range over a fixed compact set. Hölder therefore transfers every convergence-in-probability statement just proved to these tilted laws. For a convergent sequence of coefficients in that compact set, the difference of the corresponding tests has bare variance tending to zero. Gaussian domination and uniform exponential integrability make the centered conditional numerators and denominators differ in $L^1$ by $o \( 1 \)$. Their joint convergence and the strictly positive Gaussian denominator give convergence of the tilted ratios in probability. A subsequence argument therefore gives the stated compact-coefficient uniformity. The same argument applies to fixed finite lists of data and admitted penalties. For a fixed real linear tilt $T$, conditional exponential moments under the tilted law are
  $ bb(E)_T \( e^X divides h_p \) = frac(bb(E) \( e^(X + T) divides h_p \), bb(E) \( e^T divides h_p \)) . $
  Apply the joint convergence already proved to numerator and denominator; the Gaussian denominator is strictly positive. This proves the tilted conditional assertion. The centered mean identity was used before this change of measure in Equation (3.53); neither that identity nor the centered density bound in Equation (3.47) is asserted unchanged after tilting.
  Finally, the restored-bond penalty is supported inside $H$, so the same shifted-ratio comparison puts $r_Delta$ between $r_H$ and one. Bayes’ formula on the $p$-marginal gives
  $ frac(thin upright(d) nu_p, thin upright(d) mu_p) \( b \) = frac(bb(E)_mu \( Q_Delta divides b \), bb(E)_mu Q_Delta) = frac(r_Delta \( b \), bb(E)_mu r_Delta) . $
  The denominator lies in $\[ e^(- D_U) \, 1 \]$, proving (3.47). For an event $A_s$ about $p$-data, the upper density bound transfers $mu_p \( A_s \) arrow.r 0$ to $nu_p \( A_s \) arrow.r 0$, since $D_U$ has a finite limit. Conversely, for every $epsilon > 0$,
  $ mu_p \( A_s \) lt.eq mu_p \( r_H lt.eq epsilon \) + epsilon^(- 1) nu_p \( A_s \) . $
  Use (3.54) after taking the lattice limit. This proves the reverse centered transfer. If the pin data are then evaluated under an admitted observation tilt $T$, the tilted pin marginal in either topology has density
  $ g_T \( b \) = frac(bb(E) \( e^T divides h_p = b \), bb(E) e^T) $
  relative to that topology’s centered pin marginal. Conditional Jensen and the same bare bound give a uniform $L^q$ bound for $g_T$. Thus one first transfers a centered pin-data event by (3.47) and (3.54), and then applies Hölder separately in each topology. This completes the conditional interfaces without changing the centered density comparison. ◻
]

== 4 Finite-range integration and local partition algebra <rg:section>

The common task is to turn a local activity expansion into an exact expansion on coarser blocks, with bounds uniform in volume. The later spin and height sections supply their own initial activities to these operations.

This section fixes the analytic conventions used by the spin and height constructions. A field is real before analytic continuation. Counting measure is used on vertices and on unoriented edges. On the nearest-neighbor lattice let $partial$ be the edge gradient and $cal(L) = partial^(*) partial$. Constants are averaged uniformly modulo a specified period $omega$, separately from the centered Gaussian integral. Consequently an independent Gaussian constant can be added at any integration step without changing a periodic partition integral. Bounds below are uniform in the volume. Constants can depend on fixed geometric parameters, but a constant asserted independent of $L$ is chosen before the block ratio $L$.

Finite-range Gaussian decompositions were developed by Brydges, Guadagni, and Mitter #cite(label("BrydgesGuadagniMitter2004")) and, for Green forms under a finite-propagation hypothesis, by Bauerschmidt #cite(label("Bauerschmidt2013")). The analytic polymer and extraction framework follows the line of Brydges–Yau and subsequent renormalisation constructions #cite(label("BrydgesYau1990")) #cite(label("Brydges2009")) #cite(label("BPR2024I")). We give the polynomial kernels and every estimate needed here, including the boundary versions, analytic norms, and regulator reserve.

=== 4.1 Polynomial covariances and their boundary versions <polynomial-covariances-and-their-boundary-versions>

#thm([Lemma 4.1.])[
  (Finite-range decomposition).  #emph[Set $p = 32$, $gamma = 1 \/ 16$, and assume $\| s \| lt.eq 1 \/ 4$. For integral $t gt.eq 1$ define the polynomial 
$ Q_t \( cos z \) = (frac(sin \( t z \/ 2 \), t sin \( z \/ 2 \)))^(2 p) . $

 Let $L$ be a power of two, $S = L m$, and $m$ a power of $L$. The operator with multiplier 
#[#set math.equation(numbering: n => "(4.1)")
 $ Gamma_m \( lambda \) = frac(1 - gamma lambda, \( 1 + s \) lambda) { Q_m \( 1 - lambda \/ 16 \) - Q_S \( 1 - lambda \/ 16 \) } $ <rg:shell>]

 is positive semidefinite on the plane, the square torus, and the free square of cells. It has range at most $2 p S$. The quotient at zero is its polynomial continuation. Together with independent variance $gamma \/ \( 1 + s \)$ and the terminal covariance 
#[#set math.equation(numbering: n => "(4.2)")
 $ Gamma_(*) \( lambda \) = frac(\( 1 - gamma lambda \) Q_(m_(*)) \( 1 - lambda \/ 16 \), \( 1 + s \) lambda) \, #h(2em) lambda > 0 \, $ <rg:terminal-kernel>]

 the shells with upper scale at most $m_(*)$ sum to $\( 1 + s \)^(- 1) cal(L)^(- 1)$ on nonconstant modes. Here $D_0 gt.eq 2$ is fixed sufficiently large. In a square of side $M > D_0$, let $m_(*)$ be the largest nonnegative power of $L$ strictly below $M \/ D_0$. For $M lt.eq D_0$, set $m_(*) = 1$ and use no shells. Since $Q_1 = 1$, the latter convention gives the same decomposition; for $M = 1$ there are no nonconstant modes. The constant mode of the terminal covariance can be set to zero.]
  #emph[For the plane shells and the finite-volume shells included above, 
#[#set math.equation(numbering: n => "(4.3)")
 $ \| Gamma_m \( x \, y \) \| & lt.eq C (1 + log^(+) frac(S, m + "dist" \( x \, y \))) \, & Gamma_m \( x \, x \) & gt.eq c log L \,\
parallel Gamma_m parallel_(2 arrow.r 2) & lt.eq C S^2 \, & parallel nabla^r Gamma_m^(1 \/ 2) parallel_(2 arrow.r 2)^2 & lt.eq C_r m^(- 2 \( r - 1 \)) \, quad 1 lt.eq r lt.eq 6 . $ <rg:kernel-pointwise>]

 For mixed differences in the two kernel arguments of total order $r = \| a \| + \| c \|$, with the reflected difference conventions at a free side, 
$ \| nabla_x^a nabla_y^c Gamma_m \( x \, y \) \| lt.eq C_r #scale(x: 120%, y: 120%)[\(] m + "dist" \( x \, y \) #scale(x: 120%, y: 120%)[\)]^(- r) \, #h(2em) 1 lt.eq r lt.eq 12 . $

 In particular $bb(E) \| nabla^r zeta \( x \) \|^2 lt.eq C_r m^(- 2 r)$ for $1 lt.eq r lt.eq 6$ when $zeta$ has covariance $Gamma_m$. These positive-order diagonal and operator estimates also hold for $Gamma_(*)$ at scale $m_(*)$, with constants independent of $D_0 \, L$ when $M gt.eq 2 m_(*)$, as the stopping convention guarantees for $M gt.eq 2$. For $M = 1$ all positive differences vanish.]
] <rg:kernels>

#proof[
  The square of the Dirichlet sum is a polynomial in $cos z$ of degree $t - 1$, so $Q_t$ has degree $p \( t - 1 \)$. For $t$ integral,
  $ Q_(2 t) \( cos z \) = Q_t \( cos z \) cos^(2 p) \( t z \/ 2 \) lt.eq Q_t \( cos z \) . $
  Iteration proves positivity of every difference in (4.1). Since $Q_t \( 1 \) = 1$, division by $lambda$ is removable, and multiplication by $1 - gamma lambda$ leaves degree at most $p \( S - 1 \)$. The spectrum of $cal(L)$ lies in $\[ 0 \, 8 \]$, where $1 - gamma lambda gt.eq 1 \/ 2$. A polynomial of degree $d$ in a nearest-neighbor operator has range at most $d$. This proves positivity and the stated, slightly enlarged, range. Telescoping proves the decomposition, including the empty shell sum when $m_(*) = 1$ because $Q_1 = 1$. Its continuation at zero is positive since
  $ Q_t \( 1 - lambda \/ 16 \) = 1 - frac(t^2 - 1, 3) lambda + O \( lambda^2 \) . $
  Write a shell as the sum of its binary pieces $H_t$, $t = m \, 2 m \, dots.h \, S \/ 2$. On the Fourier square the nearest-neighbor symbol is $lambda \( xi \) = 4 sum_(i = 1)^2 sin^2 \( xi_i \/ 2 \) asymp \| xi \|^2$. For $0 lt.eq lambda lt.eq 8$, the identity just used and $\| sin u \| lt.eq min \( 1 \, \| u \| \)$ give
  #[#set math.equation(numbering: n => "(4.4)")
   $ 0 lt.eq H_t \( lambda \) lt.eq C min { t^2 \, lambda^(- 1) min \( 1 \, \( t sqrt(lambda) \)^(- 2 p) \) } . $ <rg:binary-symbol>]
  Indeed the difference factor $1 - cos^(2 p) \( t z \/ 2 \)$ is at most $C t^2 z^2$, whereas $Q_t \( cos z \) lt.eq C min \( 1 \, \( t z \)^(- 2 p) \)$; here $z asymp sqrt(lambda)$. A difference of order $r$ has Fourier multiplier at most $C_r \| xi \|^r$. Integrating (4.4) in polar coordinates, split at $\| xi \| = t^(- 1)$, gives
  $ integral \| xi \|^r H_t \( lambda \( xi \) \) thin frac(thin upright(d) xi, \( 2 pi \)^2) lt.eq C_r t^(- r) \, #h(2em) 0 lt.eq r lt.eq 12 . $
  The corresponding normalized Fourier sums obey the same inequality whenever $t lt.eq M \/ D_0$: divide the frequency square into annuli of width $M^(- 1)$ and use that their number of points is bounded by a constant times their area times $M^2$, with the zero-frequency contribution $O \( t^2 \/ M^2 \)$. Taking suprema instead of integrals gives $sup_xi \| xi \|^(2 r) H_t lt.eq C_r t^(2 - 2 r)$. For the full shell and $r = 1$, use directly $lambda Gamma_m lt.eq C$; for $r > 1$ the binary bounds form a geometric series. For $r = 0$ their operator bounds sum to $C S^2$. Their kernels vanish beyond distance $2 p t + O \( r \)$, so only $t gt.eq c "dist" \( x \, y \)$ can contribute. Counting these dyadic scales proves the logarithmic bound and summing $t^(- r)$ proves the positive-order bounds.
  Even reflection of the cell coordinates across $- 1 \/ 2$ and $M - 1 \/ 2$ identifies the free operator with the even subspace of the $2 M$ torus operator. Its kernel is the sum of the four reflected images in two dimensions. Since the range is less than a fixed small fraction of $M$, at most a fixed number of periodic images enter the preceding estimates. The reflected difference conventions are the ones in those estimates. Orthogonal restriction, with the reflection multiplicity in the counting norm, also proves the operator estimates.
  For completeness, the lower bound is not inferred from positivity of image terms. Choose a small fixed $a > 0$. Whenever both coordinates of the Fourier frequency are between $a \/ t$ and $4 a \/ t$, the binary multiplier is at least $c_a t^2$. This follows by the expansion at zero of $Q_t - Q_(2 t)$, uniformly on the indicated compact annulus after decreasing $a$. In the plane the annulus has area at least $c_a t^(- 2)$. On the torus it has at least $c_a \( M \/ t \)^2$ points for $D_0$ sufficiently large. In the free cosine basis the factors at cell coordinate $i$ are $cos \( pi u \( i + 1 \/ 2 \) \/ M \)$. Pair each index $u$ in a subinterval $\[ a M \/ t \, 2 a M \/ t \]$ with $2 u$. The elementary inequality
  $ cos^2 theta + cos^2 \( 2 theta \) gt.eq 7 \/ 16 $
  ensures a uniform lower bound on each pair, and each frequency has bounded pairing multiplicity. Taking the product of the two one-dimensional sums proves $H_t \( x \, x \) gt.eq c$ also at a corner. There are $log_2 L$ binary pieces, proving the diagonal assertion.
  For the terminal remainder use $lambda^(- 1) Q_(m_(*)) lt.eq C lambda^(- 1) min { 1 \, \( m_(*) sqrt(lambda) \)^(- 2 p) }$. A positive-order diagonal integral is finite at zero and bounded by $C_r m_(*)^(- 2 r)$; the discrete sum has the same bound uniformly for $M gt.eq 2 m_(*)$: there are at most $C \( M \/ m_(*) \)^2$ modes in the disk $\| xi \| lt.eq m_(*)^(- 1)$, and the remaining annuli form a convergent power sum. The operator bounds follow from the same multiplier with $lambda gt.eq c M^(- 2)$. Reflection gives the free version. For $M = 1$ there are no nonconstant modes. No estimate on the value of the terminal constant mode is needed. ◻
]

#thm([Lemma 4.2.])[
  (Killed Green function).  #emph[For the nearest-neighbor killed Laplacian of the spin square, let $G_n$ be its inverse and put $M = 2 n$. In lattice units, for interior vertices and differences interpreted by odd reflection across the zero sides, 
#[#set math.equation(numbering: n => "(4.5)")
 $ 0 lt.eq G_n \( x \, y \) & lt.eq C (1 + log^(+) frac(M, 1 + \| x - y \|)) \,\
\| nabla_x^r G_n \( x \, y \) \| & lt.eq C_r \( 1 + \| x - y \| \)^(- r) \, #h(2em) 1 lt.eq r lt.eq 6 . $ <rg:green-value>]

 After identifying vertices with their positions in $\( - 1 \, 1 \)^2$, $G_n \( x \, y \)$ converges locally uniformly off the diagonal to the continuum Dirichlet Green kernel. Positive-order differences, observed in lattice coordinates a bounded distance from a source whose distance from the walls tends to infinity, converge to their infinite-lattice values. These conclusions apply to rotated gradients and to their local stream lifts, with even reflection of the lift at a free side.]
] <rg:green>

#proof[
  Use the decomposition of Lemma 26 with the factors $\( 1 - gamma lambda \) \/ \( 1 + s \)$ omitted. Odd reflection gives its Dirichlet version. Sum binary pieces up to a scale comparable to $M$ and keep the smoothed positive-spectrum remainder. A piece of scale $t$ has differences bounded by $C_r t^(- r)$ and vanishes when $t < c \| x - y \|$, apart from reflected images whose distances are no smaller than the direct distance. Summing proves (4.5) and (4.5); nonnegativity follows independently from the maximum principle. The terminal remainder has differences $O \( M^(- r) \)$ and value $O \( 1 \)$, since the smallest Dirichlet eigenvalue is at least $c M^(- 2)$.
  For the local lattice limit, all fixed-scale pieces eventually coincide with the plane pieces by finite range. The tail of a derivative of positive order is bounded by $C sum_(t gt.eq T) t^(- r) lt.eq C_r T^(- r)$. Taking the volume limit and then $T arrow.r oo$ proves convergence. For the continuum limit, the discrete sine modes converge to the continuum sine modes: on every fixed mode $n^2 lambda_n$ converges to its continuum eigenvalue. If $f \, g$ are smooth and compactly supported in the interior, repeated summation by parts against those sine modes bounds their discrete coefficients by $C_q \( 1 + \| k \| \)^(- q)$, uniformly in $n$, for every fixed $q$. The eigenvalue inequality $n^2 lambda_n \( k \) gt.eq c \| k \|^2$ then permits dominated summation, identifying the distributional limit of the kernels with $\( - Delta_D \)^(- 1)$. Equation (4.5), multiplied by $n$ for first differences on compact subsets away from the diagonal, gives equicontinuity; (4.5) gives boundedness there. Distributional identification therefore upgrades to local uniform convergence. Rotating an odd-reflected potential gradient makes its normal component odd and its tangential component even. Its curl vanishes away from source plaquettes; path integration there supplies an even-reflected local lift with the asserted difference estimates. ◻
]

An activity records a local correction to a Gaussian reference on a connected collection of blocks. The analytic norms control field derivatives, while the Gaussian regulator permits controlled growth at large fields. The localization bounds treat neutral, charged, and restricted terms separately, and Proposition 33 combines the resulting local operations into an exact partition map.

=== 4.2 Blocks, analytic norms, and the Gaussian regulator <blocks-analytic-norms-and-the-gaussian-regulator>

Fix $r_0 = 4 p + 20$ and $R = r_0 + 8$, increasing both when a model has a larger finite interaction range. A polymer is a finite set of blocks connected by steps of sup block-index length at most $R$. Its size $\| X \|$ is its number of blocks. At scale $m$ the plane blocks have side $m$. In finite volume the grid levels are the retained activity levels of the construction in use, each with $m = 1$ or $m < M \/ D_0$ for its fixed sufficiently large clearance $D_0$. A coarse grid at $S = L m$ is present only when $S$ is retained. On a torus of side $M$, require $m divides M$ at every retained level and use full blocks of side $m$ with one common origin for the nested grids. This divisibility is a condition for the block calculus; the spectral decomposition of Lemma 26 does not require it. For free cells $\[ 0 \, M \)^2$, choose one fixed integral translate of all the nested grids. On each axis retain the cuts in that translate of $m bb(Z)$ whose distance from both endpoints is at least $m$. At $m = 1$ this gives unit intervals. At every other retained level, the clearance ensures that end intervals have lengths in $\[ m \, 2 m \)$ and other intervals have length $m$. Coarser cuts are fine cuts, so this defines nested partitions. Distances on a torus are periodic. For a retained pair $m \, S$, the closure $macron(X)$ is the union of the coarse blocks meeting $X$.

#thm([Lemma 4.3.])[
  (Geometry and counting).  #emph[There are constants $C_0 \, n_0$ and a lower bound for $L$, depending only on the fixed connection radii, such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ \| macron(X) \| lt.eq C_0 \( 1 + R \| X \| \/ L \) \, #h(2em) \| macron(X) \| lt.eq \| X \| \, $ <rg:closure>]

 $macron(X)$ is $r_0$-connected, and $\| X \| > n_0$ implies $\| macron(X) \| lt.eq \| X \| \/ 2$. If $\| X \| lt.eq n_0$, the index diameter of $macron(X)$ is at most one. The number of size-$n$ fine polymers containing a fixed fine block is at most $C_R^n$. For a fixed coarse root, configurations of $j$ mutually compatible fine polymers, with total fine size $n$ and $r_0$-connected union of closures containing that root, number at most 
#[#set math.equation(numbering: n => "(4.7)")
 $ C^n \( C L^2 \)^(2 j) . $ <rg:family-count>]

 These statements hold for the irregular end blocks with the same constants.]
] <rg:geometry>

#proof[
  Choose a spanning tree of the fine block graph of $X$ and traverse it in both directions. Its traversal has fewer than $2 \| X \|$ steps, each of spatial length at most $C R m$. Break it after each accumulated length $S \/ 4$. A resulting piece has diameter at most $S \/ 2$ and meets a bounded number of coarse rectangles because every coarse side is at least $S$. This proves the first inequality in (4.6); the second follows from nesting. Successive fine blocks in the traversal meet coarse blocks at index distance at most $1 + C R \/ L$, which is less than $r_0$ for large $L$. Take $n_0 > 4 C_0$ and then $L > 4 C_0 R$. The half-size assertion follows. Increase $L$ further so $C R n_0 m < S \/ 2$. A coordinate interval of this length cannot meet three consecutive coarse intervals, proving the diameter assertion.
  A canonical depth-first traversal records a rooted animal by a word of length at most $2 n$ in a fixed alphabet of allowed fine steps, giving the first count. To encode a family, join its $j$ fine components by a tree using pairs of blocks whose containing coarse blocks have distance at most $r_0$. Each joining displacement has length at most $C L$ in fine block indices and hence has at most $C L^2$ choices. Traverse fine component trees and the joining tree together. A word specifying step types, component boundaries, and traversal returns has at most $C^n$ choices; the long steps are traversed at most $2 \( j - 1 \)$ times. The first fine root has at most $C L^2$ positions in the specified coarse block. This gives (4.7), with one unused factor. All estimates use only the lower and upper bounds $m \, 2 m$ on side lengths and therefore include end blocks. In the finite-volume decomposition above, whenever a shell is used its upper scale is at most $m_(*) < M \/ D_0$ with $D_0$ larger than the fixed neighborhood radii, so every small neighborhood used here unwraps on a torus. ◻
]

Let $D_m \( X \)$ consist of the sites in $X$ and all blocks at index distance at most two. Activities have field support in $X$ with one lattice step of collar; a fixed larger microscopic collar is permissible if it is at most a fixed small fraction of $m$. Write $D = D_m \( X \)$ and define

#[#set math.equation(numbering: n => "(4.8)")
 $ g_D \( phi.alt \) & = 1 / 2 sum_(v in D) sum_(e = plus.minus e_i) \| nabla_e phi.alt \( v \) \|^2 \,\
P_m \( D \, phi.alt \) & = m sum_({ v \, w } in partial D) \| phi.alt \( v \) - phi.alt \( w \) \|^2 \,\
T_m \( D \, phi.alt \) & = sum_(B subset D) m^4 max_(v in B \, thin \| a \| = 2) \| nabla^a phi.alt \( v \) \|^2 \,\
U_m \( X \, phi.alt \) & = g_D \( phi.alt \) + delta P_m \( D \, phi.alt \) + T_m \( D \, phi.alt \) \, #h(2em) W_m^kappa \( X \, phi.alt \) = e^(kappa U_m \( X \, phi.alt \)) . $ <rg:reg-def>]

Here $partial D$ consists of edges with exactly one endpoint in $D$. Difference stencils based in a block may leave it; they remain inside its fixed stencil neighborhood. At a free wall the field is extended evenly, so the crossing first difference is zero.

For a direction $f$ put

$ parallel f parallel_(m \, D) = max_(v in D) { \| f \( v \) \| \, m \| nabla f \( v \) \| \, m^2 \| nabla^2 f \( v \) \| } . $

With $h_0$ fixed, define the analytic point norm and activity norm by

#[#set math.equation(numbering: n => "(4.9)")
 $ \| F \|_(m \, X \, phi.alt) & = sum_(a gt.eq 0) frac(h_0^a, a !) sup_(parallel f_i parallel_(m \, D_m \( X \)) lt.eq 1) \| D^a F \( phi.alt \) \[ f_1 \, dots.h \, f_a \] \| \,\
parallel F parallel_(m \, A \, kappa) & = sup_(X \, phi.alt) frac(A^(\| X \|) \| F \( X \) \|_(m \, X \, phi.alt), W_m^kappa \( X \, phi.alt \)) . $ <rg:analytic-norm>]

Derivatives are real directional derivatives with locally convergent analytic extensions. The derivative sum bounds translation by a complex direction of norm less than $h_0$. Leibniz’s formula gives the point-norm product inequality, since the binomial coefficient cancels the factorials. Restriction of a coarse test direction to an included fine collar has norm at most one.

#thm([Lemma 4.4.])[
  (Regulator stability with an unchanged bulk coefficient).  #emph[There are choices in the order 
#[#set math.equation(numbering: n => "(4.10)")
 $ delta > 0 med upright("small") \, #h(2em) kappa > 0 med upright("small depending on ") delta \, #h(2em) L med upright("large") \, $ <rg:choice-order>]

 independent of the volume, for which 
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) W_m^kappa \( X \, phi.alt + zeta \) lt.eq 2^(\| X \|) W_S^kappa \( Y \, phi.alt \) \, #h(2em) macron(X) subset Y \, $ <rg:reg-stability>]

 when $zeta$ has covariance $Gamma_m$. Connectivity is unnecessary. The estimate holds also with $2 kappa$ in place of $kappa$. For a connected $X$ with $\| X \| lt.eq n_0$, the right side may instead be $2^(\| X \|) W_S^(kappa \/ 2) \( macron(X) \, phi.alt \)$. At a fixed scale $X subset X'$ implies $U_m \( X \, phi.alt \) lt.eq U_m \( X' \, phi.alt \)$. Products on families whose collars are separated beyond the fluctuation range satisfy the corresponding estimate for the union. At the terminal scale, 
#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E) W_(m_(*))^kappa \( X \, zeta_(*) \) lt.eq C^(\| X \|) $ <rg:terminal-reg>]

 for sufficiently small $kappa$, with fixed-volume-independent $C$.]
] <rg:regulator>

#proof[
  We first record the elementary estimates underlying the claim. If $B$ is any rectangle of side lengths in $\[ m \, 2 m \]$ and $a$ is a first difference based on its stencil neighborhood, averaging along coordinate paths gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ m sum_(v in F) \| a \( v \) \|^2 & lt.eq C sum_(v in B) \| a \( v \) \|^2 + C m^4 max_B \| nabla a \|^2 \,\
m^2 max_B \| a \|^2 & lt.eq C sum_(v in B) \| a \( v \) \|^2 + C m^4 max_B \| nabla a \|^2 \, $ <rg:trace>]
  where $F$ is one face, including an adjacent stencil face. To verify these inequalities, compare $a \( v \)$ with $a \( w \)$ along a path of at most $4 m + 4$ unit steps; its difference is at most $C m max \| nabla a \|$. Square the comparison and average over all $w in B$. For (4.13), sum over its at most $2 m$ face sites and multiply by $m$. All reflected versions follow by applying the same comparison to the even extension.
  Put $D' = D_S \( Y \)$ and $E = D' \\ D$. The collars and nesting imply $D subset D'$. Counting at most $C L^2$ fine blocks in each coarse block gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ T_m \( D \) & lt.eq C L^(- 2) T_S \( D' \) \,\
P_m \( D \) & lt.eq L^(- 1) P_S \( D' \) + C g_E + C L^(- 2) T_S \( D' \) . $ <rg:det-comparison>]
  For the second inequality an old boundary face that survives on $partial D'$ keeps the same edge increments with coefficient $m \/ S$. Every other old face abuts a fine block in $E$. Apply (4.13) to that block, basing a crossing increment at its outside endpoint. Each block is charged on at most four faces. The first term is bounded by $C g_E$, and the second sums as in the first line. The same argument for two sets at the same scale charges disappearing faces to the added blocks; their $g$ and $T$ increments absorb $delta$ times this cost when $delta C lt.eq 1$. This proves monotonicity, including a nonconnected added region.
  The pure-fluctuation estimate is uniform in $L$. The one-dimensional inequality
  $ \| u \( i \) \| lt.eq 1 / q sum_(j = 1)^q \| u \( j \) \| + sum_(j = 1)^(q - 1) \| u \( j + 1 \) - u \( j \) \| $
  on an interval of length $q asymp m$, applied in each coordinate and followed by Cauchy–Schwarz, yields the two-dimensional discrete Sobolev bound
  $ max_B \| u \|^2 lt.eq C sum_(a in { 0 \, 1 }^2) m^(2 \| a \| - 2) sum_(v in B^(+)) \| nabla^a u \( v \) \|^2 . $
  Here $B^(+)$ adds only the fixed difference stencils and has bounded overlap as $B$ varies. Apply it to $u = m nabla zeta$ and $u = m^2 nabla^2 zeta$. It bounds $U_m \( X \, zeta \)$ by a fixed multiple of the squared Euclidean norm of the stacked Gaussian vector
  $ Z = \( m^(j - 1) nabla^j zeta \( v \) : 1 lt.eq j lt.eq 4 \, med v in D^(+) \) . $
  The operator norm of its covariance is at most $C$ by (4.3); its trace is at most $C \| X \|$ because each diagonal entry is $O \( m^(- 2) \)$ and $\| D^(+) \| lt.eq C m^2 \| X \|$. If its eigenvalues are $lambda_i$, then
  $ bb(E) e^(a \| Z \|^2) = product_i \( 1 - 2 a lambda_i \)^(- 1 \/ 2) lt.eq exp { 2 a sum_i lambda_i } \, #h(2em) 2 a max_i lambda_i lt.eq 1 \/ 2 . $
  Thus $bb(E) e^(a U_m \( X \, zeta \)) lt.eq e^(C a \| X \|)$ for all sufficiently small $a$. Its exponential cost can be made less than $2^(c \| X \|)$ with any fixed $c > 0$. The terminal positive-difference bounds prove (4.12) by this same calculation.
  It remains essential to treat the bulk cross term without a squared triangle inequality. For an edge $e = { v \, w }$ set $a_H \( e \) = \( upright(bold(1))_H \( v \) + upright(bold(1))_H \( w \) \) \/ 2$, and put
  $ B_H \( phi.alt \, zeta \) = sum_e a_H \( e \) partial phi.alt \( e \) partial zeta \( e \) \, #h(2em) g_H \( phi.alt + zeta \) = g_H \( phi.alt \) + 2 B_H \( phi.alt \, zeta \) + g_H \( zeta \) . $
  The gradient operator bound gives $"Var" B_E lt.eq C g_E \( phi.alt \)$. Summation by parts on $D'$, orienting crossing edges from $v in D'$ to $w in.not D'$ and setting $h_e = phi.alt \( v \) - phi.alt \( w \)$, gives the exact identity
  #[#set math.equation(numbering: n => "(4.15)")
   $ partial^(*) a_(D') partial phi.alt = upright(bold(1))_(D') cal(L) phi.alt - 1 / 2 sum_(e in partial D') h_e \( delta_v + delta_w \) . $ <rg:ibp>]
  For the first term, $parallel Gamma_m parallel lt.eq C S^2$ and the pointwise second-difference bound show
  $ "Var" chevron.l upright(bold(1))_(D') cal(L) phi.alt \, zeta chevron.r lt.eq C S^2 sum_(D') \| cal(L) phi.alt \|^2 lt.eq C T_S \( D' \, phi.alt \) . $
  For the boundary term, the absolute covariance row sum over all crossing endpoints is at most $C S$. Indeed finite range leaves only a bounded number of nearby coarse faces, each of length $O \( S \)$, and on one face
  $ sum_(j = 0)^(C S) (1 + log^(+) frac(S, m + j)) lt.eq C S \; $
  the estimate follows either by integration of $log \( S \/ t \)$ or by summing dyadic intervals. Irregular sides have length at most $2 S$ and reflected images have bounded multiplicity. The matrix row-sum inequality therefore bounds that variance by $C S sum_(partial D') h_e^2 = C P_S \( D' \)$. Since $B_D = B_(D') - B_E$, we have proved
  #[#set math.equation(numbering: n => "(4.16)")
   $ "Var" B_D lt.eq C { g_E + P_S \( D' \) + T_S \( D' \) } . $ <rg:cross-variance>]
  Use the squared triangle inequality only on $P_m \, T_m$. Cauchy–Schwarz, followed by the exact Gaussian moment of $B_D$, bounds $bb(E) e^(kappa U_m \( phi.alt + zeta \))$ by
  $ \( bb(E) e^(4 kappa U_m \( zeta \)) \)^(1 \/ 2) exp { kappa g_D + 2 kappa delta P_m + 2 kappa T_m + 4 kappa^2 "Var" B_D } . $
  Subtract the desired exponent $kappa \( g_(D') + delta P_S + T_S \)$. By (4.14) and (4.16) its coefficients are bounded above by
  $ kappa \( - 1 + 2 C delta + 4 C kappa \) thin g_E \, quad kappa \( 2 delta \/ L + 4 C kappa - delta \) thin P_S \, quad kappa \( C \( 1 + delta \) L^(- 2) + 4 C kappa - 1 \) thin T_S . $
  Choose $delta$ so $2 C delta < 1 \/ 4$, then $kappa$ so all $8 C kappa$ terms fit within a quarter of the corresponding reserves, then $L$ large. The same choices with reserve cover $2 kappa$. Decrease $kappa$ further to make the fluctuation prefactor at most $2^(\| X \|)$. This proves (4.11) with coefficient exactly $kappa$ on the bulk energy.
  For small connected $X$, its fine collar contains at most a fixed number of fine blocks and lies inside a fixed number of coarse blocks. Equation (4.13) at side $S$ gives
  $ g_D + P_m \( D \) + T_m \( D \) lt.eq C L^(- 2) { g_(D') + T_S \( D' \) } . $
  Now a squared triangle inequality is harmless for every term: the deterministic coefficient is $O \( L^(- 2) \)$. The pure fluctuation bound proves the claimed half-exponent estimate for large $L$. Finally, separated collars make the involved Gaussian subvectors independent by finite range; sums of their energies are the energy of the union, and hence their product estimates follow. For same-scale regrouping only disjoint collars and monotonicity are needed, not Gaussian independence. ◻
]

=== 4.3 Neutral, charged, and restricted localizations <rg:localization-section>

In this subsection $X$ is connected and $\| X \| lt.eq n_0$, $Y = macron(X)$, and $F$ obeys

#[#set math.equation(numbering: n => "(4.17)")
 $ \| F \|_(m \, X \, phi.alt) lt.eq u W_m^kappa \( X \, phi.alt \) . $ <rg:local-input>]

It is periodic under a common translation of period $omega$, and $alpha = 2 pi \/ omega$. Its charge-$q$ projection is

$ F_q \( phi.alt \) = 1 / omega integral_0^omega e^(- i q alpha t) F \( phi.alt + t \) thin thin upright(d) t . $

The regulator is constant invariant; consequently every $F_q$ satisfies (4.17), and $F_q \( phi.alt + t \) = e^(i q alpha t) F_q \( phi.alt \)$. Let $H = bb(E) F_0 \( phi.alt + zeta \)$.

#thm([Lemma 4.5.])[
  (Neutral localization).  #emph[Suppose the kernels satisfy Lemma 26 and the regulator satisfies Lemma 29. If $F$ is even and $X$ lies in the bulk full-block grid, put 
$ c_X = H \( 0 \) \, #h(2em) ell_i \( v \) = \( v_i - v_(0 \, i) \) \/ m \, #h(2em) D_(i j)^X = D^2 H \( 0 \) \[ ell_i \, ell_j \] . $

 For a fine block $B in X$ define 
#[#set math.equation(numbering: n => "(4.18)")
 $ "Loc"_(X \, B) H \( phi.alt \) & = frac(1, \| X \|) [c_X + frac(1, 2 m^2) sum_(v in B) "ave"_(epsilon.alt in { plus.minus 1 }^2) p \( v \, epsilon.alt \)^T D^X p \( v \, epsilon.alt \)] \,\
p_i \( v \, epsilon.alt \) & = m epsilon.alt_i nabla_(epsilon.alt_i e_i) phi.alt \( v \) . $ <rg:quadratic-localization>]

 Then $\| c_X \| + parallel D^X parallel lt.eq C u$ and 
#[#set math.equation(numbering: n => "(4.19)")
 $ lr(|H - sum_(B in X) "Loc"_(X \, B) H|)_(S \, Y \, phi.alt) lt.eq C u L^(- 3) W_S^kappa \( Y \, phi.alt \) . $ <rg:neutral-gain>]

 If only constants $c_X \/ \| X \|$ are subtracted, the right side is instead $C u L^(- 2) W_S^kappa$ when $F$ is even, and $C u L^(- 1) W_S^kappa$ without evenness. Constant localization applies equally on irregular end blocks. For a translation- and square-covariant bulk family, the sum of the quadratic pieces at each block is exactly $d e_B \/ 2$, where $e_B = g_B$ and $\| d \| lt.eq C epsilon$ when $u = A^(- \| X \|) epsilon$ and $A$ is sufficiently large.]
] <rg:localization>

#proof[
  Constant invariance permits replacing $phi.alt$ on the fine collar by $phi.alt - phi.alt \( v_0 \)$. Equation (4.13) on the enclosing coarse blocks and paths of length at most $C m$ imply
  #[#set math.equation(numbering: n => "(4.20)")
   $ parallel phi.alt - phi.alt \( v_0 \) parallel_(m \, D_m \( X \)) & lt.eq C L^(- 1) sqrt(U_S \( Y \, phi.alt \)) \,\
parallel f - f \( v_0 \) parallel_(m \, D_m \( X \)) & lt.eq C \/ L \, #h(2em) parallel f parallel_(S \, D_S \( Y \)) lt.eq 1 . $ <rg:fine-radius>]
  The paths and their stencils lie in the coarse collar. For the second differences use $m^2 \| nabla^2 phi.alt \| lt.eq C L^(- 2) sqrt(T_S)$, which is stronger than needed. The constants depend on $R \, n_0$, already fixed before $L$.
  We spell out why the derivative sum and arbitrarily large real fields are compatible with Taylor expansion. At a real interpolated field $t \( phi.alt - phi.alt \( v_0 \) \)$, convolution and the small-polymer part of Lemma 29 bound the input analytic derivative sum by
  $ C u exp { \( kappa \/ 2 \) t^2 U_S \( Y \, phi.alt \) } . $
  After an output derivative, only the nonconstant part of its direction enters $H$. All these directions together use at most $C h_0 \/ L < h_0 \/ 2$ of the fine analytic radius. The remaining radius bounds the fixed number $r$ of Taylor derivatives by $C_r h_0^(- r)$. Taylor’s formula with its integral remainder and (4.20) therefore bounds the output derivative sum of an order-$r$ remainder by
  #[#set math.equation(numbering: n => "(4.21)")
   $ C_r u L^(- r) \( 1 + sqrt(U_S \( Y \, phi.alt \)) \)^r e^(kappa U_S \( Y \, phi.alt \) \/ 2) lt.eq C_(r \, kappa) u L^(- r) W_S^kappa \( Y \, phi.alt \) . $ <rg:taylor-bound>]
  The last inequality is the finite supremum of $\( 1 + sqrt(t) \)^r e^(- kappa t \/ 2)$ over $t gt.eq 0$. This argument justifies the derivative sums by their nonnegative absolute majorants. Evenness removes the linear Taylor term. Thus constant subtraction gives order two in the even case and order one otherwise.
  For quadratic localization, Taylor expansion to order two leaves the order-three bound (4.21). For each $v in B$ and $epsilon.alt$, replace the field modulo constants by the affine function with coordinate slopes $epsilon.alt_i nabla_(epsilon.alt_i e_i) phi.alt \( v \)$. The error in fine test norm is at most $C L^(- 2) sqrt(U_S)$, by summing second differences along coordinate paths. On output directions its norm is at most $C L^(- 2)$. The difference between the two quadratic forms contains one such error and one factor of size $C L^(- 1) \( 1 + sqrt(U_S) \)$, or two errors. Applying the same radius allocation and exponent slack gives $C u L^(- 3) W_S^kappa$. Every full fine block has $m^2$ sites; averaging those affine quadratic forms over $v \, epsilon.alt$ and then over $B in X$ gives exactly (4.18). At zero field the derivative bound and $parallel ell_i parallel_(m \, D_m \( X \)) lt.eq C$ prove $\| c_X \| + parallel D^X parallel lt.eq C u$.
  Finally define $D_B = sum_(X in.rev B) D^X \/ \| X \|$. Translation covariance makes it independent of $B$; reflection changes the sign of each off-diagonal entry, and a quarter-turn interchanges the diagonal entries. Hence $D_B = d "Id"$. Direct substitution, retaining both signs of each lattice direction, yields
  $ frac(1, 2 m^2) sum_(v in B) "ave"_epsilon.alt p^T \( d "Id" \) p = d / 4 sum_(v in B) sum_(e = plus.minus e_i) \( nabla_e phi.alt \( v \) \)^2 = d / 2 e_B \( phi.alt \) . $
  The rooted animal count in Lemma 28 bounds $\| d \|$ by $C epsilon sum_(n lt.eq n_0) \( C_R \/ A \)^n lt.eq C epsilon$. Quadratic localization was asserted only for full bulk blocks; no replacement of an end-block volume by $m^2$ has been made. ◻
]

#thm([Lemma 4.6.])[
  (Charged contraction).  #emph[There are choices of $h_0$, then $L$, then a lower bound $alpha_0$, such that for $alpha gt.eq alpha_0$ the sum of all nonzero charges satisfies 
#[#set math.equation(numbering: n => "(4.22)")
 $ sum_(q eq.not 0) \| bb(E) F_q \( phi.alt + zeta \) \|_(S \, Y \, phi.alt) lt.eq C u L^(- 4) W_S^kappa \( Y \, phi.alt \) . $ <rg:charge-gain>]

 The same argument with shift amplitude $a > 0$ has charge gain 
#[#set math.equation(numbering: n => "(4.23)")
 $ exp { - \( a \| q \| alpha - a^2 \/ 2 \) Gamma_m \( v_0 \, v_0 \) + h_0 \| q \| alpha } \, $ <rg:general-charge-gain>]

 provided $h_0$ is larger than a fixed constant times $a$. It applies whenever this gain is summable. Fundamental-charge localization at marginal frequency requires a separate subtraction and is not included in (4.22).]
] <rg:charged>

#proof[
  Set $w \( v \) = Gamma_m \( v \, v_0 \)$, $w_0 = w \( v_0 \)$. The binary positive-order kernel estimates and $"diam" D_m \( X \) lt.eq C m$ imply
  $ parallel w - w_0 parallel_(m \, D_m \( X \)) lt.eq C \, $
  uniformly in $L$. The Gaussian shift identity, with $tau = "sgn" \( q \)$, is
  #[#set math.equation(numbering: n => "(4.24)")
   $ bb(E) F_q \( phi.alt + zeta \) = e^(a^2 w_0 \/ 2) bb(E) [e^(- i a tau zeta \( v_0 \)) F_q \( phi.alt + zeta + i a tau w \)] . $ <rg:imaginary-shift>]
  The shift $i a tau w_0$ is constant and contributes $e^(- a \| q \| alpha w_0)$. Its nonconstant remainder has fine norm at most $C a$. A coarse direction is its anchor value, of absolute value at most one, plus a nonconstant part of fine norm at most $C \/ L$. The first contributes $\| q \| alpha$ per derivative; summing it gives $e^(h_0 \| q \| alpha)$. Choose $h_0 > 4 C a$ and $L$ so large that the imaginary remainder and all residual directions consume less than $h_0$. The fine derivative sum then bounds their full contribution by the input norm at the real field $phi.alt + zeta$. Lemma 29 gives (4.23) times $C u W_S^(kappa \/ 2)$.
  For rigor in (4.24), use the Gaussian eigen-coordinates with positive eigenvalues. Their exact real Cameron–Martin identity is $bb(E) F_q \( phi.alt + zeta \) = bb(E) \[ e^(- z zeta \( v_0 \) - z^2 w_0 \/ 2) F_q \( phi.alt + zeta + z w \) \]$ for real $z$. Both sides continue analytically in the scalar shift in a neighborhood containing the segment $\[ 0 \, i a tau \]$: the constant character handles its constant part and the stated radius bound handles its residual part. A slightly larger Gaussian regulator parameter bounds the integrands and their differentiated series along this compact segment. Dominated continuation proves the identity. Null covariance directions do not enter $w$ and cause no change.
  Take $a = 1$. The diagonal lower bound $w_0 gt.eq c log L$ allows first choosing $L$ so $w_0 gt.eq 2 h_0 + 2$ and then $alpha_0$ so
  $ \( alpha \| q \| - 1 \/ 2 \) w_0 - h_0 alpha \| q \| gt.eq 4 log L + c' alpha \( \| q \| - 1 \) log L . $
  The resulting geometric series over $\| q \| gt.eq 1$ proves (4.22). Fourier projection and inversion are valid for values and each derivative because periodic analyticity gives exponentially decaying Fourier coefficients on every compact real-field neighborhood. The obtained summable output-norm majorant permits summing the full analytic derivative series as well. ◻
]

#thm([Corollary 4.7.])[
  (Placement factors).  #emph[For small linear terms at a prescribed coarse block the number of fine placements is at most $C L^2$. For terms whose fine support is within a fixed number of fine blocks of a specified straight side it is at most $C L$, and for terms within a fixed number of fine blocks of one of a fixed number $k$ of marked points it is at most $C k$. Thus the neutral bulk, even wall, and unrestricted marked remainders of Lemma 30, after summing placements, are bounded respectively by 
$ C L^(- 1) epsilon \, #h(2em) C L^(- 1) epsilon \, #h(2em) C k L^(- 1) epsilon $

 in output activity norm, apart from large polymers and nonlinear terms. A bulk term whose fluctuation neighborhood touches a wall can always be bounded without subtraction by $C_(L \, A) epsilon$ and used as forcing.]
] <rg:restricted-localization>

#proof[
  A small support contains at most $n_0$ blocks, with boundedly many shapes at its anchor. A coarse rectangle has at most $C L^2$ fine anchors; its fixed-width boundary strip has at most $C L$; a fixed-width neighborhood of a point has at most $C$. End rectangles have side between $S$ and $2 S$, leaving these counts unchanged. Since $\| macron(X) \| lt.eq \| X \|$, the activity weight ratio is at most one. Multiply the counts by $L^(- 3) \, L^(- 2) \, L^(- 1)$, respectively. The last assertion follows directly from convolution, the regulator bound, and the finite number $C_(L \, A)$ of small supports and assigned pieces. It invokes no bulk cancellation across a physical wall. ◻
]

=== 4.4 Exact integration, relocation, and constant extraction <exact-integration-relocation-and-constant-extraction>

For a finite block grid $cal(B)_m$, define the subset partition functional

#[#set math.equation(numbering: n => "(4.25)")
 $ cal(Z)_m \( K \; phi.alt \) = sum_(V subset cal(B)_m) product_(X in "Comp"_R \( V \)) K \( X \, phi.alt \) \, $ <rg:partition>]

with empty product one. Equivalently sum over collections of nonempty $R$-connected polymers whose mutual index distances exceed $R$. This is a finite algebraic sum; no logarithm or infinite-volume partition function is required to define the local map.

#thm([Proposition 4.8.])[
  (Exact local partition map).  #emph[Under the locality, finite-range, and norm hypotheses already specified, shell integration, localizations on small linear inputs, and extraction of their designated field-independent coefficients define activities $K'$ and numbers $a_b$, one at each coarse block, satisfying the exact identity 
#[#set math.equation(numbering: n => "(4.26)")
 $ bb(E) cal(Z)_m \( K \; phi.alt + zeta \) = product_(b in cal(B)_S) \( 1 + a_b \) cal(Z)_S \( K' \; phi.alt \) . $ <rg:exact-map>]

 The map preserves the period, locality, and every symmetry respected by the designated localizations. To first order, $K'$ is the sum of the subtracted small expectations, the unchanged large expectations, and the nonconstant parts assigned to coarse singletons. When singleton polynomials are measured separately, write 
$ K \( X \) = K_(upright("reg")) \( X \) + upright(bold(1))_(X = { B }) sum_(nu in I) t_(B \, nu) P_(m \, B)^nu \, #h(2em) \| P_(m \, B)^nu \|_(m \, { B } \, phi.alt) lt.eq C_(upright("pol")) W_m^kappa \( { B } \, phi.alt \) . $

 Here $I$ is fixed and finite, and the $P_(m \, B)^nu$ form a fixed family of local polynomials, independent of the activity inputs, with the prescribed collar and period. The displayed point-norm bound is uniform in $nu$, the retained scale, the block, and the finite volume. Suppose 
$ parallel K_(upright("reg")) parallel_(m \, A \, kappa) + sup_B sum_(nu in I) \| t_(B \, nu) \| lt.eq epsilon . $

 If a fixed scalar representation retains $K_(upright("reg")) = sum_mu K_(upright("reg"))^mu$ as separate components, replace $parallel K_(upright("reg")) parallel_(m \, A \, kappa)$ in this bound by $sum_mu parallel K_(upright("reg"))^mu parallel_(m \, A \, kappa)$, and include every separately retained coefficient occurrence in the absolute coefficient sum. With external parameters fixed, all designated localization and scalar extraction maps are fixed complex-linear maps of this measured input vector. Let $F_(Y \, b)$ be the complete singleton piece assigned from the small linear inputs with original closure $Y$ to $b in Y$, retaining $Y$ as its exclusion label, and let $a_b$ be the sum of the designated field-independent scalar contributions from these same local $Y arrow.r b$ inputs. Each assigned piece has the prescribed target collar and period. For every complex input vector obeying the displayed bound, require 
$ sup_b {sum_(Y in.rev b) sup_phi.alt frac(\| F_(Y \, b) \|_(S \, { b } \, phi.alt), W_S^kappa \( { b } \, phi.alt \)) + \| a_b \|} lt.eq C_(L \, A) epsilon \, $

 uniformly in retained scales and finite volumes. Then on a sufficiently small ball 
#[#set math.equation(numbering: n => "(4.27)")
 $ parallel K' - K'_(upright("lin")) parallel_(S \, A \, kappa) lt.eq C_(L \, A) epsilon^2 . $ <rg:nonlinear-map>]

 This is a complex analytic map of its activity inputs, with the corresponding convergent Taylor series and derivative bounds. The assertion is not analyticity in the frequency convention $alpha$.]
  #emph[The same finite algebra and spatial enumeration apply to a separately specified representation under the same locality, finite-range, and exclusion hypotheses, with fixed complex-linear designated maps, provided its input size includes every retained component and it supplies the corresponding bounds for compatible-family products, Gaussian integration, complete assigned singleton pieces, and scalars in its normalized size. The point-norm and complex analyticity assertions above are statements about the scalar representation.]
  #emph[After $L$ has been fixed, taking $A$ sufficiently large makes the contribution from large linear inputs an arbitrarily small multiple of their norm. The small linear estimates are those of Lemmas 30, 31 and Corollary 32. All constants and smallness radii are uniform in finite volumes. For the terminal assertion, separately assume that the retained activity grid at scale $m_(*)$ satisfies the grid conditions above and $M \/ m_(*) lt.eq D_0 L$; its block count is then at most $C \( D_0 L \)^2$. The spectral decomposition and terminal estimates retain their own stated domains.]
] <rg:partition-map>

#proof[
  We give the algebra before bounding it. For a configuration of compatible fine polymers take the union of their coarse closures and its $r_0$-connected components. Fine fields belonging to different such components have mutual distance greater than the shell range: the support collar uses only a fixed number of lattice steps and $r_0 > 4 p + 10$. Their Gaussian subvectors are independent. For each temporary component $Y$ sum the expectations of products of all compatible fine families with closure union exactly $Y$; call this sum $tilde(K) \( Y \)$. Independence proves that the integrated partition functional is precisely the temporary-radius partition expansion in these $tilde(K)$. Its linear term is $sum_(macron(X) = Y) bb(E) K \( X \)$.
  Apply the fixed designated localization to each small linear summand, using Lemma 30 for the ordinary choice. Collect pieces assigned to a coarse block $b in Y$ as $F_(Y \, b)$. Write identically
  $ tilde(K) \( Y \) = (tilde(K) \( Y \) - sum_(b in Y) F_(Y \, b)) + sum_(b in Y) F_(Y \, b) . $
  Expand this choice independently in every temporary configuration. A residual retains support $Y$; a chosen piece receives support ${ b }$, while its original exclusion information $Y$ is retained. Group the union of these new supports into its $R$-connected components. This factorizes even with the retained exclusions. Indeed a support that shrinks came from a small linear input and has index diameter at most one. If two original supports violate a temporary exclusion, their new supports have distance at most $r_0 + 2 < R$. They therefore belong to the same final component. There is no exclusion constraint between distinct final components. Within a component it is retained in the defining finite sum. Denote the resulting final-radius activities by $H \( Y \)$.
  Let $a_b$ be the sum of the designated field-independent coefficients assigned at $b$. Assume $\| a_b \| < 1 \/ 2$ and put $d_b = \( 1 + a_b \)^(- 1) - 1$. Multiply the partition expansion with activities $H$ by $product_b \( 1 + d_b \)$. View a chosen $d_b$ as a constant decoration that may overlap an occupied old block. Group the occupied union again by radius $R$. Since the scalar multiplier is exactly $product_b \( 1 + a_b \)^(- 1)$, this defines $K'$ and proves (4.26). At first order $d_b = - a_b$, so precisely the designated constants cancel. A translated gradient polynomial can have a nonzero value at zero field; if that value is not designated for extraction, the algebra keeps it in $K'$. This observation will matter for defects.
  We next justify the norm bounds, including uniformity of the sums. Initially use the stronger output weight $4 A$. Expand each singleton input into its part measured by the activity norm and its separately measured polynomial parts. After summing the absolute bounds of any separately retained regular components, an ordinary input has point norm at most $epsilon A^(- \| X \|) W_m^kappa$. After summing $nu$, a separately measured polynomial singleton has point norm at most $C_(upright("pol")) sum_nu \| t_(B \, nu) \| W_m^kappa lt.eq \( C_A epsilon \) A^(- 1) W_m^kappa$, with $C_A = A C_(upright("pol"))$. For $P = e_B \/ 2$, the uniform local bound follows from $e_B = g_B lt.eq U_m$ and the bounds $C sqrt(U_m)$ and $C$ on its first and second derivatives in unit test directions; the regulator absorbs these terms. Compatible fine polymers have disjoint collars. The product inequality and Lemma 29 give, for a family of total size $n$ and $j$ components, of which $j_(upright("pol"))$ are separately measured polynomial singletons after summing their indices, a bound
  $ epsilon^j C_A^(j_(upright("pol"))) \( 2 \/ A \)^n W_S^kappa \( Y \) . $
  For each large component $X_i$, (4.6) gives $\| macron(X)_i \| lt.eq \| X_i \| \/ 2$, whereas every component obeys $\| macron(X)_i \| lt.eq \| X_i \|$. Hence multiplication by $\( 4 A \)^(\| Y \|)$ costs at most a product with factor $8^(\| X_i \|) A^(- \| X_i \| \/ 2)$ on a large component and $8^(\| X_i \|)$ on a small one. Use (4.7). For fixed $L$ the sum over the size of each large component is bounded by
  $ sum_(n > n_0) \( C A^(- 1 \/ 2) \)^n \, $
  and tends to zero as $A arrow.r oo$. The sum over each small component has at most $n_0$ terms and a finite cost depending on the geometry, with the additional fixed $C_A$ cost only for separately measured singletons. Large components retain their original weight gain. The long-jump factor $\( C L^2 \)^(2 j)$ is a fixed factor per component. Thus all families with $j gt.eq 2$ sum to at most
  $ sum_(j gt.eq 2) \( C_(L \, A) epsilon \)^j lt.eq C_(L \, A) epsilon^2 $
  when $epsilon < \( 2 C_(L \, A) \)^(- 1)$. The $j = 1$ terms are bounded linearly, and the large ones can be made an arbitrarily small linear multiple by increasing $A$. Bounding the rooted sum over all output supports is stronger than the required supremum over one output support, so this argument proves the claimed norm estimate without a volume factor.
  For the ordinary localization, $\| c_X \| + parallel D^X parallel lt.eq C u$ and the normalized formula (4.18) give the required complete singleton bound: its value is at most $C u \( 1 + U_S \)$, and its first two derivatives in unit coarse directions are at most $C u sqrt(U_S)$ and $C u$. The regulator absorbs these terms. The finite small-support count then verifies the stated rooted assignment and scalar bound; for other designated maps use that bound directly. In the relocation estimate keep each $F_(Y \, b)$ as one atom carrying its original label $Y$, with support $Y$ for its subtraction and ${ b }$ for its assignment. Its fine summands remain combined. A small $Y$ has index diameter at most one, so its possible labels at a fixed $b$ and the weight change between these two supports have a fixed $C_(L \, A)$ cost; regulator monotonicity handles the support change. Distinct temporary objects have distance greater than $r_0$, and shrinking a small label by at most one block leaves their assigned collars disjoint. Count a final connected family by the previous tree of fine objects with one added coarse vertex for each such atom. An added vertex has only a fixed number of label choices, and its tree attachments have at most $C L^2$ fine positions or a fixed number of coarse positions. Marking attachment positions costs only an exponential factor in the old fine size and the number of added atoms. The rooted assignment bound supplies $C_(L \, A) epsilon$ per added vertex. Thus the same exponential family estimate applies, with large objects retaining their original weight gain. The bound at weight $4 A$ remains available after relocation, and terms involving at least two objects are bounded by the same geometric series starting at degree two. The subtraction and designated singleton insertion are complex-linear, so all other changes so far are included in (4.27).
  For clarity, the last decoration sum can be bounded directly without discarding overlaps. Fix a final support $Y$ and its old occupied set $V subset Y$. The old components are determined by $V$. Decorations are compulsory on $Y \\ V$ and optional on $V$. Put $d_(*) = sup_b \| d_b \| lt.eq C_(L \, A) epsilon$. Monotonicity of the regulator and disjointness of old collars imply that the absolute sum for this $V$ is at most its old activity coefficient times
  $ d_(*)^(\| Y \\ V \|) \( 1 + d_(*) \)^(\| V \|) W_S^kappa \( Y \) . $
  The old weight $4 A$, compared with the final weight $A$, supplies $4^(- \| V \|)$; optional overlaps cost at most $2^(\| V \|)$. The holes supply $\( A d_(*) \)^(\| Y \\ V \|)$. Thus the subset sum is bounded by
  $ sum_(V subset Y) 2^(- \| V \|) \( A d_(*) \)^(\| Y \\ V \|) = \( 1 \/ 2 + A d_(*) \)^(\| Y \|) lt.eq \( 5 \/ 8 \)^(\| Y \|) $
  when $A d_(*) lt.eq 1 \/ 8$, leaving an exponential reserve. A term with an old activity and a hole contains at least one factor $epsilon$ from each. If there are no holes, the nonempty-overlap sum is bounded by $\| Y \| d_(*) \( 1 + d_(*) \)^(\| Y \|)$; the exponential reserve absorbs $\| Y \|$. Pure decorations on a support of at least two blocks are degree at least two; on a singleton, $d_b = - a_b + O \( a_b^2 \)$. These bounds give the stated quadratic estimate at the last step.
  The designated maps are bounded complex-linear maps of the measured input vector. All remaining operations are sums of bounded multilinear maps and the absolutely convergent scalar inverse series for $1 + a_b$. Their absolute bounds on a slightly larger input ball imply convergence of the complex Taylor series and its termwise derivatives on the smaller ball. Symmetry and periodicity are preserved by the explicit operations. Locality is preserved because every field used by an output object is inside its output support and fixed collar; its numerical coefficients can depend on predecessor data only in a fixed larger neighborhood. Iteration expands that neighborhood by the geometric sum of earlier scale lengths, bounded by a constant times the present scale. Choosing $D_0$ larger than this constant ensures exact plane/torus agreement on unwrapped neighborhoods through the stopping scale. Finally, under the hypothesis on the terminal activity grid, $M \/ m_(*) lt.eq D_0 L$ bounds the number of terminal blocks. When the terminal covariance also satisfies (4.12), that estimate controls their final Gaussian integrations. Under these terminal hypotheses, if every terminal activity norm tends to zero, then its finite subset expansion tends to one after the designated scalar factors have been removed. ◻
]

The parameter order used below is now explicit: fix interaction and connection ranges and $n_0$; choose $delta$, then $kappa$ (with the required exponent and Hölder reserves); choose $h_0$ large enough for the specified imaginary translations; choose $L$ large enough for the geometric and small-support gains; choose $A$ large enough for large supports; finally choose the activity ball small enough for the inverse series and nonlinear estimates. A large-frequency construction chooses its frequency lower bound after $h_0 \, L$. An entry construction using an additional regulator must prove its Gaussian composition and determinant bounds before applying Proposition 33.

== 5 The ordinary Villain model and transfer to a full spin field <vi:section>

Throughout this section $b$ is spin inverse temperature. All graph gradients and their adjoints use counting measure, with one term for each unoriented edge after an orientation has been chosen. We use the norms, local partition maps, and finite range decomposition of Section 4. The letter $K$ without a subscript denotes the coefficient in the Gaussian factor for spin correlations; polymer activities are denoted by $cal(K)_j$. In the coefficients $K_M$ and $A_M$ of Theorem 2, we abbreviate the model subscript $upright("Villain")$ to $upright(V)$.

The Fourier and Poisson duality used here goes back to Villain and to the planar-model analysis of José, Kadanoff, Kirkpatrick, and Nelson #cite(label("Villain1975")) #cite(label("JoseKadanoffKirkpatrickNelson1977")). We retain the full finite-volume current and boundary conventions, since they determine the coefficient bridge and insertion normalization.

=== 5.1 Exact current duality and the compensation parameter <exact-current-duality-and-the-compensation-parameter>

#thm([Lemma 5.1.])[
  (Fused boundary and integral duality).  #emph[Let $D_n$ be the spin square defined in Section 1.2, and set $M = 2 n$. Fuse its boundary vertices to a single vertex $frak(p)$ and delete its perimeter edges. The resulting planar multigraph has dual the free square grid of $M^2$ cells. Write $d \, d'$ for primal and dual gradients, and $cal(R)$ for a signed rotation identifying crossing edges. Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ ker d^(*) = cal(R) "im" d' \, #h(2em) ker d^(*) ∩ bb(Z)^E = cal(R) d' bb(Z)^(M^2) \, $ <vi:hodge>]

 where divergences on the primal graph are tested off $frak(p)$, and dual heights in either expression are taken modulo constants. If $l = sum_(i = 1)^k 𝜍_i delta_(x_i)$, with $x_i in D_n^compose$ and $𝜍_i in { - 1 \, 1 }$, then there are a real dual stream $a$ and a dual connection $eta$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ J & = - d G_n l \, & u^0 & = J + cal(R) d' a in bb(Z)^E \, & d^(*) u^0 & = - l \,\
omega & = b^(- 1 \/ 2) \, & alpha & = 2 pi sqrt(b) \, & theta.alt & = - a \/ sqrt(b) \, #h(2em) eta = cal(R)^(- 1) J \/ sqrt(b) . $ <vi:current>]

 The connection satisfies 
#[#set math.equation(numbering: n => "(5.3)")
 $ d' ""^(*) eta = 0 \, #h(2em) eta - d' theta.alt in omega bb(Z)^(E') \, #h(2em) lr(bar.v.double eta bar.v.double)^2 = \( l \, G_n l \) \/ b . $ <vi:connection>]

 For the ordinary Villain measure with boundary spin zero, 
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) e^(i \( l \, theta \)) = e^(- \( l \, G_n l \) \/ \( 2 b \)) frac(Z \( theta.alt \), Z \( 0 \)) . $ <vi:exact-duality>]

 Here $Z \( theta.alt \)$ is the Gaussian integral of energy $lr(bar.v.double d' psi bar.v.double)^2 \/ 2$, with its common constant averaged uniformly modulo $omega$, against the normalized comb 
#[#set math.equation(numbering: n => "(5.5)")
 $ product_v frak(c)_omega \( psi_v + theta.alt_v \) \, #h(2em) frak(c)_omega \( t \) = omega sum_(h in bb(Z)) delta \( t - omega h \) = sum_(q in bb(Z)) e^(i q alpha t) . $ <vi:comb>]

 The integral in this statement is a Gaussian lattice sum; it need not be interpreted as an ordinary function before its first convolution.]
] <vi:duality>

#proof[
  Perimeter edges contribute constants because both endpoint angles are zero. Contracting the perimeter in the sphere and discarding the final redundant edge leaves $M^2$ faces, indexed by the cells. Each surviving primal edge separates two cells, including the edges ending at the fused pin, so the dual has precisely the free square adjacency.
  For a divergence-free current $u$, the rotated edge increments $cal(R)^(- 1) u$ have zero sum around every elementary dual plaquette: this sum is the primal divergence at the corresponding interior vertex. The free dual grid is simply connected. Integrating these increments from a base cell gives a stream $h$, unique modulo constants. Integral increments give integral $h$ after fixing its value at the base cell. Conversely rotated gradients have zero primal divergence. This proves both identities, including their integral assertion. In particular, there are no additional harmonic currents in this calculation. One can also transpose this statement: the integer curl map on primal edge cochains is onto the integer cell charges subject to its single total constraint, and its kernel consists of integer primal gradients with the pin fixed. Surjectivity follows by routing charges along a dual tree; exactness of the kernel follows by integrating along primal paths. These integral statements apply to the multigraph, including parallel edges.
  The Fourier coefficient at $u in bb(Z)$ of $sum_m e^(- b \( t + 2 pi m \)^2 \/ 2)$ is a positive constant, independent of $u$, times $e^(- u^2 \/ \( 2 b \))$. Integrating each interior angle in the product of these Fourier series enforces $d^(*) u = - l$. The source need not have total zero: its compensating divergence occurs at $frak(p)$. An integer solution $u^0$ exists by routing each signed source along a path to the pin. Since $d^(*) J = - l$, the first part of the lemma gives $u^0 - J = cal(R) d' a$. All integral solutions are exactly $J + cal(R) d' \( a + h \)$, $h$ integral modulo constants. Discrete summation by parts gives
  $ \( J \, cal(R) d' f \) = 0 \, #h(2em) lr(bar.v.double  bar.v.double) J^2 = \( l \, G_n l \) \, $
  because a rotated dual gradient has zero interior divergence and the primal potential $G_n l$ vanishes at the pin. Consequently its energy splits orthogonally. Setting $psi = \( h + a \) \/ sqrt(b)$ gives exactly the comb constraint $psi + theta.alt in omega bb(Z)$ and proves (5.4). Gaussian determinants and the constant Jacobian of the quotient by common height translations cancel between numerator and denominator. Finally $cal(R)^(- 1) d G_n l$ is co-closed on the free dual graph, and $eta - d' theta.alt = cal(R)^(- 1) u^0 \/ sqrt(b)$; these observations give (5.3). ◻
]

For a torus of side $M = L^N$, use the ordinary periodic height graph and write $partial$ for its gradient, $cal(L) = partial^(*) partial$, and $G$ for the inverse on mean-zero functions. On a free dual square use the same notation. In both cases the mean-zero Gaussian is supplemented by a uniform common constant in $bb(R) \/ omega bb(Z)$. On the torus, $Z \( 0 \)$ is the integer height measure with energy $lr(bar.v.double partial h bar.v.double)^2 \/ \( 2 b \)$, modulo constant heights. Its representative pinned at the origin has exactly the law in Equation (1.4) under

#[#set math.equation(numbering: n => "(5.6)")
 $ sigma = 2 pi h = 2 pi sqrt(b) thin psi \, #h(2em) beta = pi^2 b \, #h(2em) v_(upright("nn"))^2 = 1 / 4 . $ <vi:bare-conversion>]

For $\| s \|$ small replace the covariance $G$ by $G \/ \( 1 + s \)$ and put $+ s lr(bar.v.double partial psi bar.v.double)^2 \/ 2$ in the interaction. Since $partial^(*) eta = 0$, this interaction can equally be written

$ s / 2 lr(bar.v.double partial psi + eta bar.v.double)^2 - s / 2 lr(bar.v.double eta bar.v.double)^2 . $

Let $Z_s \( theta.alt \, eta \)$ denote the partition integral with covariance $G \/ \( 1 + s \)$, the comb in (5.5), and interaction $+ s lr(bar.v.double partial psi + eta bar.v.double)^2 \/ 2$. The covariance change introduces only a common determinant factor. Thus the following identity is exact:

#[#set math.equation(numbering: n => "(5.7)")
 $ bb(E) e^(i \( l \, theta \)) = exp #h(-0.16667em) {- frac(1 + s, 2 b) \( l \, G_n l \)} cal(R)_(n \, b) \( l \) \, #h(2em) cal(R)_(n \, b) \( l \) = frac(Z_s \( theta.alt \, eta \), Z_s \( 0 \, 0 \)) . $ <vi:compensated-duality>]

In particular the coefficient in this Gaussian factor is

#[#set math.equation(numbering: n => "(5.8)")
 $ K = frac(b, 1 + s) . $ <vi:stiffness>]

The positive sign of the compensating gradient interaction is essential in these identities.

#thm([Lemma 5.2.])[
  (Source lifts).  #emph[Away from the primal plaquettes carrying $l$, the connection $eta$ is locally an exact real gradient. If an axis rectangle enlarged by a fixed collar contains no source, the restriction of $theta.alt$ modulo $omega$ has a real lift $lambda$ there with $partial lambda = eta$. For $0 lt.eq r lt.eq 5$, in lattice units, 
#[#set math.equation(numbering: n => "(5.9)")
 $ \| nabla^r eta \( v \) \| lt.eq C_r b^(- 1 \/ 2) sum_(i = 1)^k \( 1 + "dist" \( v \, x_i \) \)^(- 1 - r) . $ <vi:lift-bound>]

 The assertion includes the reflected stencils at a free wall. For one source whose distance from the walls tends to infinity, its connection in any fixed neighborhood converges to the corresponding infinite-plane connection, independently of its macroscopic position.]
] <vi:source-lifts>

#proof[
  The circulation of $cal(R)^(- 1) J$ around a dual plaquette is a signed primal divergence of $J$ and therefore vanishes off $l$. Integrating around paths in a source-free rectangle gives the lift; the congruence in (5.3) makes its values agree with $theta.alt$ up to a single phase offset and integer multiples of $omega$. A rectangle clipped to the square remains simply connected. At its boundary the odd extension of the Dirichlet potential makes the rotated normal increment odd and the tangential increment even, giving the free-wall extension of this lift. The derivative estimates and local convergence now follow by applying Lemma 27 to $J = - sum_i 𝜍_i d G_n \( dot.op \, x_i \)$. In the local limit all fixed finite range pieces agree with their plane versions, and the tails of each positive-order derivative are summable. A different common phase offset does not affect either the gradients or neutral projections. ◻
]

=== 5.2 Convolving the unsmoothed microscopic comb <convolving-the-unsmoothed-microscopic-comb>

Set $d_0 = gamma \/ \( 1 + s \)$, where $gamma = 1 \/ 16$ is the first independent Gaussian variance in Lemma 26. All references to polymer norms below mean the analytic derivative norm with the indicated weight and regulator from Section 4. In particular its derivative radius $h_0$ is fixed before $b$ tends to infinity.

#thm([Proposition 5.3.])[
  (Microscopic initialization).  #emph[After this first convolution and extraction of identical scalar factors in twisted and untwisted volumes, the plane activities have the form 
#[#set math.equation(numbering: n => "(5.10)")
 $ cal(K)_0^b \( X \, phi.alt \) = upright(bold(1))_(X = { B }) s / 2 e_B \( phi.alt \) + cal(P)_0 \( X \, phi.alt \) \, #h(2em) lr(bar.v.double cal(P)_0 bar.v.double) lt.eq C \( s^2 + z \) \, quad z = e^(- c b) . $ <vi:initial-bulk>]

 Here $e_B$ is the gradient energy on the sites of the block, with the orientation average used in Lemma 30. Finite free or periodic grids have full initial norm at most $C \( \| s \| + z \)$. For each fixed $C_eta < oo$, the same bound holds for twists with $sup \| eta \| lt.eq C_eta$, with $C$ allowed to depend on $C_eta$. In an unchanged interior neighborhood the untwisted activities are the plane activities. In every neighborhood with a common lift $lambda$ of the twist, the twisted activities equal the corresponding untwisted activities evaluated at $phi.alt + lambda$.]
] <vi:initialization>

#proof[
  For each residual real field $phi.alt$ condition independent $N \( 0 \, d_0 \)$ variables $xi_v$ to satisfy $xi_v + phi.alt_v + theta.alt_v in omega bb(Z)$. Their conditional probabilities are their Gaussian densities on the translated lattice, divided by the corresponding lattice sum. The independent convolution of the normalized comb at $v$ is
  #[#set math.equation(numbering: n => "(5.11)")
   $ w_v = w \( phi.alt_v + theta.alt_v \) \, #h(2em) w \( t \) = sum_(q in bb(Z)) e^(- q^2 alpha^2 d_0 \/ 2) e^(i q alpha t) . $ <vi:one-site>]
  This is an equality of a Gaussian convolution with a positive atomic measure, so it does not require a smooth microscopic sine potential.
  Assign to $v$ half of each incident oriented squared gradient of $phi.alt + xi$ plus $eta$ and call the resulting local expression $E_v$. Then $sum_v E_v = lr(bar.v.double partial \( phi.alt + xi \) + eta bar.v.double)^2$. Expanding the product of
  #[#set math.equation(numbering: n => "(5.12)")
   $ 1 + F_v = w_v e^(s E_v \/ 2) $ <vi:initial-factor>]
  into occupied site subsets, and taking conditional expectations, gives activities on their radius-$R$ components. The conditional variables remain independent. Energies involve only nearest neighbors, so components at distance greater than $R$ use disjoint variable sets and factor exactly. Extract the initial singleton constants by the exact decoration operation of Proposition 33, using
  #[#set math.equation(numbering: n => "(5.13)")
   $ c_v^0 = s / 2 bb(E) e_v^0 \( xi \) \, $ <vi:initial-constant>]
  where this expectation is unconditioned and $e_v^0$ has the same energy allocation. The extracted factors $1 + c_v^0$ are identical in the two partition integrals even at a wall.
  Here are uniform estimates that justify these operations and the claimed norm. The analytic derivative sums of $w - 1$, $w^(- 1) - 1$, and of the conditional first and second moment errors relative to $N \( 0 \, d_0 \)$ are $O \( e^(- c b) \)$. Indeed a nonzero Fourier mode and its analytic derivatives are bounded by
  $ C \( 1 + \| q \| alpha \)^a e^(- q^2 alpha^2 d_0 \/ 2 + h_1 \| q \| alpha) \, $
  where $a$ is fixed for polynomial insertions and $h_1 > h_0$ is a fixed radius reserve. Their sum is $O \( e^(- c b) \)$ uniformly for small $s$. The conditional normalization is bounded away from zero, and its inverse has the same estimate by its convergent geometric series.
  For the remaining derivative sums, fix all constrained lattice indices. Then $phi.alt_v + xi_v = omega h_v - theta.alt_v$, so $E_v$ is independent of $phi.alt$ in that summand. A derivative consequently falls on Gaussian densities or conditional normalizations. The absolute derivative sum of a density at $xi$ is bounded by that density times
  $ exp { h_1 \| xi \| \/ d_0 + h_1^2 \/ \( 2 d_0 \) } . $
  This follows by expanding the exponential generating function of the Hermite derivatives and replacing its coefficients by their absolute values. Uniformly over translated lattices of mesh $omega lt.eq 1$, their Gaussian sums, multiplied by $omega$, are bounded when one inserts this factor and $e^(epsilon.alt xi^2)$ for any sufficiently small fixed $epsilon.alt > 0$. To see the uniformity, cover the line by its mesh intervals, compare the Gaussian envelope on each interval with its integral over that interval and its two neighbors, and sum; the bounded number of intervals around the maximum contributes a bounded amount.
  Now expand $F_v$ as $\( w_v - 1 \) + w_v \( e^(s E_v \/ 2) - 1 \)$. Each occupied site costs $C \( z + \| s \| \)$, using $\| e^y - 1 \| lt.eq \| y \| e^(\| y \|)$. Each Gaussian variable appears in a bounded number of local energies. The preceding square exponential bounds absorb its factors, while the remaining field polynomials and their small quadratic exponent are absorbed by $W_1^kappa \( X \, phi.alt \)$. Since $\| s \|$ can be made arbitrarily small, this works for any subsequently fixed positive regulator exponent. The result before decorations is
  $ \| cal(K)_0 \( X \) \|_(1 \, X \, phi.alt) lt.eq \[ C \( z + \| s \| \) \]^(\| X \|) W_1^kappa \( X \, phi.alt \) . $
  The same argument with $\| e^y - 1 - y \| lt.eq 1 / 2 \| y \|^2 e^(\| y \|)$ bounds a singleton Taylor remainder by $C s^2 W_1^kappa$. Conditional first and second moments then give
  $ bb(E)_(upright("cond")) E_v = e_v \( phi.alt \) + bb(E) e_v^0 \( xi \) + O \( z \) W_1^kappa $
  in the untwisted bulk norm. Its scalar term is removed by (5.13), leaving exactly $s e_B \/ 2$ at first order. All multi-factor and decoration errors are quadratic by the explicitly convergent expansion in Proposition 33. Starting that expansion at a larger fixed site weight absorbs its decoration cost and proves (5.10). The fixed bound $C_eta$ adds only a constant depending on $C_eta$ per touched site to these estimates. Finally, when $eta = partial lambda$ and $lambda equiv theta.alt med \( mod med omega \)$, both the constrained Gaussian lattice sum and its energy become their untwisted versions at $phi.alt + lambda$. The extracted constants were chosen independently of the twist. This proves the last two assertions as exact identities, not asymptotic estimates. ◻
]

=== 5.3 Bulk shooting, free walls, and the height coefficient <bulk-shooting-free-walls-and-the-height-coefficient>

Fix the geometric connection radii, the small-component threshold, and a clearance $H$ much larger than these constants and the covariance range constant. Choose $D_0$ much larger than $H$. Choose the regulator parameters $delta$, then $kappa$, small enough for both $kappa$ and $2 kappa$; choose $h_0$ large, then the power of two $L$ large. Finally choose the defect and untwisted weights $A_D \, A_U$, with $A_U \/ A_D$ large. Only after these choices is $b$ taken sufficiently large. Thus constants depending on these choices are fixed, and the smallness conditions for microscopic initialization and the uniform decaying recurrences are achieved by increasing a single lower bound on $b$.

#thm([Proposition 5.4.])[
  (Scalar tuning).  #emph[There exist $b_0 < oo$, $rho in \( 0 \, 1 \)$, and, for each $b gt.eq b_0$, a choice $s = s \( b \) = O \( e^(- c b) \)$ independent of the domain, sources, and translation of the block hierarchy, such that the plane activities obey 
#[#set math.equation(numbering: n => "(5.14)")
 $ cal(K)_j^b \( X \) = upright(bold(1))_(X = { B }) t_j / 2 e_B + cal(P)_j \( X \) \, #h(2em) u_j := \| t_j \| + lr(bar.v.double cal(P)_j bar.v.double)_(kappa \, A_U \, j) lt.eq C z rho^j . $ <vi:bulk-decay>]

]
] <vi:bulk-tuning>

#proof[
  Start with $t_0 = s$ and Proposition 36. On small inputs from $cal(P)_j$ use neutral quadratic localization and charged contraction. For the singleton $t_j e_B \/ 2$, assign its entire Gaussian expectation, including its scalar part and its unchanged gradient part, to its coarse singleton. The scalar part is bounded by the positive-derivative estimates in Lemma 26. The maps commute with translations by full blocks and with square rotations and reflections. Lemma 30 therefore makes the sum of the assigned Hessians a scalar matrix, constant over the full coarse block; the sum of its nonconstant pieces is exactly $t_(j + 1) e_(B') \/ 2$. Consequently the exact map has
  #[#set math.equation(numbering: n => "(5.15)")
   $ t_(j + 1) & = t_j + sigma_j \( cal(P)_j \) \, & \| sigma_j \( cal(P)_j \) \| & lt.eq C lr(bar.v.double cal(P)_j bar.v.double) \,\
lr(bar.v.double cal(P)_(j + 1) bar.v.double) & lt.eq theta lr(bar.v.double cal(P)_j bar.v.double) + C_(L \, A_U) \( \| t_j \| + lr(bar.v.double cal(P)_j bar.v.double) \)^2 . $ <vi:scalar-map>]
  Here $theta > 0$ is as small as desired. Indeed there are $O \( L^2 \)$ small fine inputs per output, and their neutral and charged remainders are $O \( L^(- 3) \)$ and $O \( L^(- 4) \)$, respectively. Large inputs have an arbitrarily small weight gain. The separately assigned gradient input has zero subtracted linear remainder, and all remaining operations cost the quadratic term in (5.15) by Proposition 33.
  Choose $theta < rho < 1$, let $epsilon = C_1 z$, and take fixed $T \, C_1$ large. For $s in \[ - T epsilon \, T epsilon \]$, as long as $\| t_j \| lt.eq T epsilon rho^j$, induction in (5.15) gives $lr(bar.v.double cal(P)_j bar.v.double) lt.eq 2 epsilon rho^j$. At $j = 0$ this follows from $C \( s^2 + z \) lt.eq 2 epsilon$ for sufficiently small $z$. For the induction step, choose $z$ so small that
  $ 2 theta epsilon rho^j + C_(L \, A_U) \( T + 2 \)^2 epsilon^2 rho^(2 j) lt.eq 2 epsilon rho^(j + 1) . $
  At either boundary $t_j = plus.minus T epsilon rho^j$ of its envelope, (5.15) gives
  $ plus.minus t_(j + 1) gt.eq \( T - 2 C \) epsilon rho^j > T epsilon rho^(j + 1) \, $
  provided $T \( 1 - rho \) > 2 C$. Thus a boundary hit is followed by a strict exit on the same side.
  The finite prefix of the map is continuous in $s$ while these bounds hold. This assertion requires only continuity at each fixed support and each fixed derivative, rather than continuity in a stronger completed norm. For a fixed support there are finitely many fine supports in a step; the Gaussian variables can be coupled by rescaling as $s$ varies. The analytic norm and regulator bounds, with their parameter reserve, dominate the relevant expectations, and dominated convergence applies inductively, also at converging real backgrounds and directions. The Hessian coefficient is a finite local sum and is therefore continuous. The bound permits computing one additional step at an envelope boundary.
  Classify a parameter by the side of its first eventual exit. These two classes are disjoint and relatively open: a strict exit persists by finite-prefix continuity, while an equality at a first hit forces a strict exit one step later and has the same property. They contain the two respective endpoints of the interval. They cannot cover a connected interval. A parameter in their complement remains in every envelope, which proves (5.14). Translating all plane blocks conjugates exactly the local maps and their scalar coefficients, so the same chosen parameter works for every translated hierarchy. ◻
]

#thm([Proposition 5.5.])[
  (Walls and arbitrary integer side lengths).  #emph[On each free square of side $M = 2 n$, for every integer $n$, and on each periodic square of side $L^N$, the untwisted activities are exact copies of the tuned plane activities wherever the required local neighborhoods miss the walls or unwrap on the torus. If $w_j$ is their full norm on the remaining supports, then for some $rho < rho_1 < 1$, 
#[#set math.equation(numbering: n => "(5.16)")
 $ w_j lt.eq C z rho_1^j . $ <vi:wall-decay>]

 After the scalar factors of the local maps have been extracted, the terminal partition average tends to one as $M arrow.r oo$.]
] <vi:walls>

#proof[
  Use the nested cuts of Lemma 28: a free end block has side length between $m$ and $2 m$, and every retained cut lies at least $m$ from the ends. No divisibility of $M$ is needed. Use the stopping convention of Lemma 26: for $M > D_0$, stop at the largest nonnegative power $m_(*)$ of $L$ strictly below $M \/ D_0$; for $M lt.eq D_0$, put $m_(*) = 1$ and integrate no shells. In all cases $M \/ m_(*) lt.eq D_0 L$, so the number of terminal blocks is bounded by a constant depending on $D_0 \, L$, and $m_(*) arrow.r oo$ along every integer $M arrow.r oo$. Whenever $m_(*) = 1$, the only activity level is the initialized level, and the asserted norm bound is its $j = 0$ bound. Bounds on physical ratios in these finitely many boxes are obtained directly from their positive exact finite partition sums.
  Call a support bulk-good when its sites lie at distance greater than $H m$ from free walls. On the torus require that it fit in coordinate arcs leaving gaps greater than $H m$ in both periods. All other supports are wall supports. Localize small bulk-good inputs using exactly the plane pieces, even if the shell being integrated could itself reach a wall from that input. For small wall inputs subtract only the neutral constant of the full activity, with no gradient localization. The resulting maps remain exact by Proposition 33.
  For a bulk-good output every contributing fine support, the one-step neighborhood of every assigned piece, and each singleton normalization lies in the output neighborhood with the clearance used in its definition. The source support of a shell path lies within $2 p S$. Taking $H$ larger than these range and assignment constants makes these fine data bulk-good and makes their kernels identical to the plane kernels. Connectivity and exclusions also agree. Induction proves the exact copy assertion. For a torus, the gaps provide a common lift of each connected neighborhood; block-period translations preserve the plane prescriptions, so the same assertion holds across a chosen cut.
  Small wall supports in a fixed coarse output can lie only in a strip of bounded fine width next to a physical wall. There are $O \( L \)$ such placements. Each activity is even under field negation, and constant localization therefore leaves $O \( L^(- 2) \)$ by Lemma 30; its charged part has the stronger charged gain. There are no small wrapping inputs before the stopping scale on the torus. Large inputs gain by weight. Good linear inputs that can feed a wall output are bounded in full by $C_(L \, A_U) u_j$, including their assigned gradient pieces; no cancellation of these pieces on a wall output is asserted. The nonlinear estimate in Proposition 33 gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ w_(j + 1) lt.eq theta w_j + C_(L \, A_U) u_j + C_(L \, A_U) \( u_j + w_j \)^2 . $ <vi:wall-map>]
  Initialization gives $w_0 = O \( z \)$ because $s = O \( z \)$. Substituting (5.14) and iterating the geometric convolution in (5.17), with $z$ small, proves (5.16) for any fixed $rho_1 > max \( rho \, theta \)$ sufficiently below one. At the terminal scale only boundedly many blocks remain. Every nonempty term of their finite polymer partition has at least one activity whose norm tends to zero. Lemma 29 and the terminal part of Lemma 26 bound its Gaussian expectation uniformly. The empty term equals one, proving the last assertion. ◻
]

#thm([Proposition 5.6.])[
  (Identification with the height coefficient).  #emph[For all sufficiently large $b$, the parameter tuned in Proposition 37 satisfies 
#[#set math.equation(numbering: n => "(5.18)")
 $ beta_(upright("eff")) \( J_(upright("nn")) \, pi^2 b \) = frac(pi^2 b, 1 + s \( b \)) \, #h(2em) K_(upright(V)) \( b \) = frac(beta_(upright("eff")) \( J_(upright("nn")) \, pi^2 b \), pi^2) . $ <vi:effective-bridge>]

 The first identity is obtained from the same bulk map as the spin-source estimates below.]
] <vi:height-bridge>

#proof[
  First increase the lower bound on $b$ so that Corollary 75, applied with $J = J_(upright("nn"))$ and $k = beta \/ v_(upright("nn"))^2 = 4 pi^2 b$, gives $a \( k \) > 0$. Thus the hypothesis of Theorem 17 holds at the bare height temperature $beta = pi^2 b$, independently of the Villain calculation below. The physical roughness criterion in Corollary 18 places this input in the rough regime; we may further increase the lower bound to lie strictly above its finite threshold.
  Let $f$ be a smooth real mean-zero test on the unit torus. Set
  $ f_M \( v \) = 2 pi sqrt(b) thin M^(- 2) (f \( v \/ M \) - M^(- 2) sum_w f \( w \/ M \)) . $
  Then $\( f_M \, psi \)$ is precisely the test of the centered field $sigma = 2 pi sqrt(b) thin psi$. Gaussian translation, after the initial convolution (or first against a bounded smooth comb regularization), gives the Laplace prefactor
  #[#set math.equation(numbering: n => "(5.19)")
   $ exp { \( f_M \, G f_M \) \/ \( 2 \( 1 + s \) \) } $ <vi:height-prefactor>]
  and translates the entire interaction and comb by $chi = G f_M \/ \( 1 + s \)$. Every exact partition identity with its fixed subtractions is an identity as a function of background field. Therefore the same scalar factors may be used, and the source ratio is the ratio of terminal averages with backgrounds $phi.alt + chi$ and $phi.alt$.
  Fourier series and the rapid decay of the coefficients of $f$ show that $M \| nabla chi \|$ and $M^2 \| nabla^2 chi \|$ are uniformly bounded. For example the discrete inverse multiplier divided by $M^2$ tends on each nonzero fixed mode $r$ to $\( 4 pi^2 \| r \|^2 \)^(- 1)$, and repeated summation by parts bounds the sampled source coefficients by $C_a \( 1 + \| r \| \)^(- a)$ uniformly up to the lattice cutoff. Multiplication by one or two scaled differences leaves an absolutely summable series. The terminal regulator evaluated at $phi.alt + chi$ thus has bounded expectation, using its positive-order Gaussian bounds and a small parameter reserve. The decaying terminal activities in Proposition 38 make both terminal averages tend to one. All manipulations with combs are legitimate by the initial positive Gaussian lattice sums and the domination in Proposition 36.
  The same Fourier calculation in (5.19) gives
  $ log bb(E) e^(H_N \( f \)) arrow.r frac(2 pi^2 b, 1 + s) \( f \, \( - Delta_(bb(T)) \)^(- 1) f \) . $
  Thus its covariance coefficient is $4 pi^2 b \/ \( 1 + s \)$. The coefficient in Equation (1.6) is $beta_(upright("eff")) \/ v_(upright("nn"))^2 = 4 beta_(upright("eff"))$ by (5.6); uniqueness of the torus coefficient in Theorem 17 gives (5.18), using the positivity established before this calculation. This comparison uses no inference from smooth height convergence to a spin observable; those observables are treated through (5.7) next. ◻
]

=== 5.4 Marked plaquettes and one spin amplitude <marked-plaquettes-and-one-spin-amplitude>

For a source configuration write $k$ for its number of signed unit marks, counting multiplicity. A support at scale $m$ is shift-good if the rectangle spanned by its sites, enlarged by $H m$, misses all marks. Otherwise it is a defect support. These classifications may overlap the wall classification. The norm on defect supports uses $\( 2 kappa \, A_D \)$; untwisted norms continue to use $\( kappa \, A_U \)$.

#thm([Proposition 5.7.])[
  (Translated copies and defect flow).  #emph[There is a choice of exact twisted maps with the following properties. On every shift-good support the twisted activity is exactly the untwisted activity at the local lifted translate. For $k lt.eq 2$ at every scale, or for arbitrary fixed $k$ with source separations at least $epsilon.alt M$ at scales 
#[#set math.equation(numbering: n => "(5.20)")
 $ S = L m lt.eq c epsilon.alt M \/ \( k + 1 \) \, $ <vi:early-scale>]

 the full defect norm $v_j$ satisfies 
#[#set math.equation(numbering: n => "(5.21)")
 $ v_(j + 1) lt.eq theta v_j + C \( u_j + w_j \) + C \( u_j + w_j + v_j \)^2 \, #h(2em) v_j lt.eq C z rho_2^j \, quad rho_1 < rho_2 < 1 . $ <vi:defect-map>]

 The constants in the decaying regime are independent of $k$ under (5.20). For each fixed $k \, epsilon.alt$, the remaining bounded number of scales preserve an $o \( 1 \)$ bound as $M arrow.r oo$. Consequently, after extracting the designated scalar factors, the twisted terminal partition average tends to one uniformly for separated interior configurations.]
] <vi:marked-flow>

#proof[
  Use the initial activities in Proposition 36. For small shift-good inputs use exactly the pieces of untwisted localization, evaluated at their common lift. Designate for extraction exactly the same scalar coefficients as in the untwisted map. In particular the value of a translated gradient polynomial at zero background is retained inside that polynomial; it is not added to the designated scalar. For a small defect input use only the neutral constant localization in the original, untranslated field variable. These prescriptions are permitted exact splittings in Proposition 33.
  The translated-copy assertion follows by induction. If an output is shift-good, every fine input, assigned piece, and singleton normalization entering it fits in its enlarged rectangle. Clearance provides a common source-free lift throughout that rectangle. The induction hypothesis then translates all products and Gaussian convolutions by the same field, and the identical pieces and designated constants preserve the equality. A defect output requires no lift on its entire support. In particular a gradient piece from a good input is translated on the fine block where it was assigned; moving its support label to a coarse singleton does not evaluate a singular lift at a source core. All activities remain periodic under a uniform background shift by $omega$.
  The estimates for translations can be stated directly in the regulators. On the collar of a good input, (5.9) bounds $m \| nabla lambda \|$ and $m^2 \| nabla^2 lambda \|$ by a constant. For $k lt.eq 2$ this is uniform without separation. Under (5.20), put $d = epsilon.alt M$. At each collar site $v$, at most one mark has distance strictly less than $d \/ 2$ from $v$; every other mark has distance at least $d \/ 2$. The collar is at distance at least $\( H - C \) m$ from every mark. Hence, pointwise at $v$,
  $ m^(r + 1) \| nabla^r eta \( v \) \| lt.eq C_r b^(- 1 \/ 2) [(frac(m, 1 + \( H - C \) m))^(r + 1) + k (m / d)^(r + 1)] \, #h(2em) r = 0 \, 1 . $
  Since $m lt.eq c d \/ \[ L \( k + 1 \) \]$, the right side is bounded independently of $k$. At the initial scale $m = 1$, the same division into one nearest mark and the remaining marks, with the nearest contribution bounded by one without a clearance assumption, gives the fixed bound on $sup \| eta \|$ required by initialization. Using $partial lambda = eta$ and summing the pointwise bounds over the collar gives
  $ U_m \( X \, phi.alt + lambda \) lt.eq 2 U_m \( X \, phi.alt \) + C \| X \| . $
  The weight reserve $A_U \/ A_D$ absorbs $e^(C kappa \| X \|)$ and the regulator exponent doubles. Common values of the lift cause no loss since the norm is a supremum over real backgrounds; only its derivatives enter the regulator. Assigned gradient pieces on a good fine block are bounded on their coarse singleton by the same estimate: $m eta$ is bounded there, and the coarse field gradients and analytic test gradients have their prescribed bounds. Hence all linear forcing from good inputs is bounded by $C \( u_j + w_j \)$, including pieces that reach a defect output.
  Small defect inputs within a specified coarse output have only $O \( 1 \)$ possible fine placements per nearby mark, because they have bounded fine diameter and their enlarged hull reaches a mark. In the regime under consideration at most two marks are locally relevant; counting multiplicity covers a repeated pair. Field-negation symmetry can fail for a twisted input. Its neutral constant subtraction nevertheless gains $L^(- 1)$ by Lemma 30; $O \( 1 \)$ placements make this a contraction. The charged contraction of Lemma 31 and the large-polymer weight gain treat the other linear terms. Products, relocations, and decorations have the quadratic bound of Proposition 33, now using its allowed exponent $2 kappa$. This proves the first inequality of (5.21). Initialization uses $sup \| eta \| lt.eq C$ from Lemma 35. Iterating with (5.14) and (5.16), and decreasing $z$ if needed, proves the second inequality.
  For fixed $k \, epsilon.alt$, failure of (5.20) occurs only once $m$ is a fixed positive fraction of $M$, up to a factor depending on $k \, epsilon.alt \, L$. For sufficiently large $M$, let $j_e$ be the last activity index in the decaying regime. It satisfies $j_e gt.eq log_L M - C_(k \, epsilon.alt)$, so the entering activity norms are at most $C_(k \, epsilon.alt) z M^(log_L rho_2) = o \( 1 \)$ at the already fixed $b$. There are only boundedly many later scales and boundedly many blocks at their start. Crude versions of the same finite sums and Gaussian estimates have constants and positive smallness radii allowed to depend on $k \, epsilon.alt$. The entering $o \( 1 \)$ eventually lies inside each such radius, and every remaining map has no term independent of the activities, so finitely many maps send $o \( 1 \)$ to $o \( 1 \)$. On good inputs the scaled lift derivatives are bounded by a $k$-dependent constant, and all weight losses occur on boundedly many blocks. The terminal Gaussian regulator estimate proves the stated convergence of the terminal average. Here $k$ is fixed before $M arrow.r oo$; no increase of $b_0$ with that fixed order is needed. ◻
]

#thm([Proposition 5.8.])[
  (A location-independent amplitude).  #emph[For the single parameter $s \( b \)$ chosen in Proposition 37, there is $c \( b \) in \( 0 \, oo \)$ such that for every fixed $k$ and every sequence of signed unit sources tending to distinct interior points, 
#[#set math.equation(numbering: n => "(5.22)")
 $ cal(R)_(n \, b) #h(-0.16667em) (sum_(i = 1)^k 𝜍_i delta_(x_i)) arrow.r c \( b \)^k . $ <vi:ratio-limit>]

 The limit is uniform on separated compact configurations. For $k lt.eq 2$ the ratios are bounded above and below by positive constants uniformly in the locations, signs, coincidences, and sufficiently large $n$. Moreover $\| log c \( b \) \| lt.eq C z$.]
] <vi:amplitude>

#proof[
  Let $a_(j \, B')^(upright("tw"))$ and $a_(j \, B')^(upright(u))$ be the designated constants of one exact map. Their differences can only come from small defect inputs. On good inputs they were designated to be identical, including when a translated gradient piece has a nonzero value at zero. There are boundedly many relevant fine supports near each mark, and their norms in the decaying regime give
  #[#set math.equation(numbering: n => "(5.23)")
   $ sum_(B') \| a_(j \, B')^(upright("tw")) - a_(j \, B')^(upright(u)) \| lt.eq C k z rho_2^j . $ <vi:constant-tail>]
  All individual constants are real and uniformly small. Thus $1 + a_(j \, B') > 0$ and $\| log \( 1 + a \) - log \( 1 + a' \) \| lt.eq 2 \| a - a' \|$ for the values occurring here. The initial constants agree exactly. The exact partition identities therefore give
  #[#set math.equation(numbering: n => "(5.24)")
   $ log cal(R)_(n \, b) \( l \) = sum_(j \, B') log frac(1 + a_(j \, B')^(upright("tw")), 1 + a_(j \, B')^(upright(u))) + log T_(n \, b)^(upright("tw")) / T_(n \, b)^(upright(u)) \, $ <vi:ratio-product>]
  where the two terminal factors tend to one. The logarithmic tail in the sum is bounded by $C k z rho_2^J$ beyond depth $J$ in the decaying regime. The bounded number of late steps for a separated configuration contributes $o \( 1 \)$. For $k lt.eq 2$ there are no such late steps, and the terminal factors stay bounded above and below uniformly for large $n$. Finitely many smaller boxes can be included by their positive exact partition sums. This proves the uniform ratio bounds.
  For a single interior mark, translate all nested cuts by its lattice location. This changes neither the physical ratio nor the tuned scalar parameter. At every fixed depth the scalar differences in (5.24) are calculated in a bounded neighborhood of that mark, in fixed relative block positions. Eventually the kernels there equal the plane kernels. Lemma 35 makes their increments tend to those of the isolated plane source. Their phases modulo $omega$ tend to the corresponding isolated phases up to a common phase offset. Such an offset translates the background argument; neutral constant projection is invariant under this translation, and the designated good constants were already fixed. Thus it does not alter a scalar difference. Negating the source and the field also leaves these constants unchanged. Continuity of each fixed local map in its finitely many phases and increments follows by the Gaussian lattice-sum domination in Proposition 36 and the finite-depth dominated-convergence argument in Proposition 37. Each fixed-depth log increment therefore tends to a value independent of source location and sign. The summable tail (5.23) defines a finite real sum $log c \( b \)$, with $\| log c \( b \) \| lt.eq C z$.
  To treat $k$ separated marks, use one hierarchy for their joint problem and for each of the $k$ corresponding single-mark problems. At any fixed depth their scalar-difference neighborhoods are disjoint for large $n$. Near one mark the contributions of the other marks to the connection tend to zero by (5.9); their remaining common phase offsets have no effect on the neutral constants. The local calculations consequently approach those of its single-mark problem. The position of a mark relative to all cuts through a fixed depth has only finitely many possibilities. Passing over these possibilities gives uniformity without selecting a subsequence. The physical single-mark ratio has the limit $c \( b \)$ regardless of the hierarchy, as just proved using translated cuts. More explicitly, for a single unit source $l = 𝜍 delta_x$, let $S_J^(cal(H))$ be the scalar log sum through depth $J$ in a hierarchy $cal(H)$, continuing its exact single-mark maps gives
  $ lr(|log cal(R)_(n \, b) \( l \) - S_J^(cal(H))|) lt.eq C z rho_2^J + o_n \( 1 \) $
  uniformly in the cuts under consideration. The full physical ratio is exactly independent of $cal(H)$; the finite-depth sums need not agree. Its limit from the mark-anchored hierarchy therefore places every residue-class limit of $S_J^(cal(H))$ within $C z rho_2^J$ of $log c \( b \)$. Finally let the fixed depth tend to infinity in (5.23). The terminal and late-step errors vanish, yielding (5.22) and its uniformity. ◻
]

#thm([Corollary 5.9.])[
  (Normalized correlations).  #emph[Put $K = K_(upright(V)) \( b \) = b \/ \( 1 + s \( b \) \)$ and $A_(upright(V)) \( b \) = c \( b \)^(- 1)$, and write 
$ Z_(n \, x) = A_(upright(V)) \( b \) e^(G_n \( x \, x \) \/ \( 2 K \)) e^(i theta_x) \, #h(2em) Z_(n \, x)^(\( + \)) = Z_(n \, x) \, quad Z_(n \, x)^(\( - \)) = overline(Z_(n \, x)) . $

 For distinct limiting interior locations and any signs, 
#[#set math.equation(numbering: n => "(5.25)")
 $ bb(E) product_(i = 1)^k Z_(n \, x_i)^(\( 𝜍_i \)) arrow.r exp #h(-0.16667em) {- 1 / K sum_(i < j) 𝜍_i 𝜍_j G_D \( x_i \, x_j \)} . $ <vi:multipoint>]

 All signed lattice expectations in this display are nonnegative. For some $Q < 2$ and every compact interior set, uniformly in $n \, x \, y$ there, 
#[#set math.equation(numbering: n => "(5.26)")
 $ 0 lt.eq bb(E) Z_(n \, x)^(\( 𝜍 \)) Z_(n \, y)^(\( tau \)) lt.eq C \( \| x - y \| + n^(- 1) \)^(- Q) . $ <vi:two-point>]

 These conclusions hold along the full sequence of integers $n$.]
] <vi:correlations>

#proof[
  Insert (5.22) into (5.7). The exact identity
  $ \( l \, G_n l \) = sum_i G_n \( x_i \, x_i \) + 2 sum_(i < j) 𝜍_i 𝜍_j G_n \( x_i \, x_j \) $
  holds for a list of unit sources, including repeated sites when the list is retained with multiplicity. Its self-energies cancel the full diagonal multipliers, leaving the off-diagonal expression. The factors $A_(upright(V))^k$ cancel $c \( b \)^k$, and the off-diagonal convergence in Lemma 27 proves (5.25). In particular no finite spatial part of the Dirichlet diagonal has been discarded.
  The original current sums have positive coefficients, so every signed expectation is nonnegative. The maximum principle gives $G_n \( x \, y \) gt.eq 0$. For two unit sources, Proposition 41 bounds the remaining ratio without separation. The logarithmic estimate in Lemma 27 then bounds the worst sign choice by $C exp { G_n \( x \, y \) \/ K }$ and hence by the right-hand side of (5.26), with $Q = C_0 \/ K$. Increasing the fixed lower bound on $b$ makes $Q < 2$, since $s = O \( e^(- c b) \)$ and $K \/ b arrow.r 1$. For repeated opposite sources this also bounds $A_(upright(V))^2 e^(G_n \( x \, x \) \/ K)$, so the diagonal case is included. The arbitrary-side construction of Proposition 38, together with the finite-residue comparison in Proposition 41, establishes the assertion about the full sequence. ◻
]

=== 5.5 From spin correlations to the full complex field <from-spin-correlations-to-the-full-complex-field>

This subsection isolates the probabilistic argument used for both spin models. All test functions have compact support in $D = \( - 1 \, 1 \)^2$. Write $D_n = \[ - 1 \, 1 \]^2 ∩ n^(- 1) bb(Z)^2$ and let $D_n^compose$ be its interior vertices. Here $G_n$ is the inverse of the killed, unscaled nearest-neighbor graph Laplacian, with zero values on the boundary; there is no factor $n^2$ in this graph Laplacian. For a complex distribution $T$, write $T^(+) \( f \) = T \( f \)$ and $T^(-) \( f \) = overline(T \( overline(f) \))$; thus the test function is not conjugated when the sign of the field is changed.

The plane-rotator Lee–Yang theorem has its origins in Dunlop–Newman and Lieb–Sokal #cite(label("DunlopNewman1975")) #cite(label("LiebSokal1981")). The precise finite-graph XY and Villain statements used below are those of Newman–Wu. They attribute an earlier Villain Lee–Yang result to Fröhlich–Spencer #cite(label("FrohlichSpencerCoulomb1981")) and Bellissard, and give the detailed finite-graph proof used here #cite(label("NewmanWu2019")).

#thm([Lemma 5.10.])[
  (Lee–Yang absolute moment bound).  #emph[Consider a finite ferromagnetic XY model, or a finite Villain model with positive edge parameters, with all boundary angles fixed to zero. For arbitrary deterministic numbers $lambda_x gt.eq 0$, put $W = sum_x lambda_x e^(i theta_x)$ and $v = bb(E) \| W \|^2$. There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(5.27)")
 $ parallel W parallel_(L^p) lt.eq C sqrt(p) thin v^(1 \/ 2) \, #h(2em) p gt.eq 2 . $ <vi:ly-absolute>]

 Moreover, for every list of vertices, allowing repetitions, and every list $sigma_i in { - 1 \, 1 }$, 
#[#set math.equation(numbering: n => "(5.28)")
 $ bb(E) exp (i sum_(i = 1)^m sigma_i theta_(x_i)) gt.eq 0 . $ <vi:positive-spin-moments>]

]
] <vi:lee-yang>

#proof[
  Let $U$ be an independent uniform angle and rotate every spin, including all boundary spins, by $U$. The resulting boundary angle is common and uniform. Conditional on that angle, subtracting it gives precisely the original fixed-boundary measure. Put $X = "Re" \( e^(i U) W \)$. The Lee–Yang Theorems for finite XY and Villain graphs, including this boundary convention and nonnegative vertex weights, assert that $bb(E) e^(z X)$ has only imaginary zeros #cite(label("NewmanWu2019")) Theorems 1 and 3, Remark 5. For the square used here, the theorem can be applied before boundary fusion: attach a single new vertex of observable weight zero to every original boundary vertex, and let these added ferromagnetic couplings tend to infinity. The approximating graphs are simple, and their limit is exactly the common uniformly rotated boundary law in Remark 5. Thus no multigraph convention is needed after fusion. The variable $X$ is symmetric and bounded, so it satisfies the exponential square-integrability hypothesis of #cite(label("NewmanWu2019"), form: "prose") Proposition 13. That proposition gives
  $ bb(E) e^(z X) = e^(B z^2) product_j \( 1 + z^2 \/ y_j^2 \) \, #h(2em) B gt.eq 0 \, quad sum_j y_j^(- 2) < oo \, #h(2em) B + sum_j y_j^(- 2) = 1 / 2 bb(E) X^2 . $
  For real $t$, the inequality $1 + u lt.eq e^u$ therefore implies
  #[#set math.equation(numbering: n => "(5.29)")
   $ bb(E) e^(t X) lt.eq exp (1 / 2 t^2 bb(E) X^2) = exp \( t^2 v \/ 4 \) . $ <vi:ly-subgaussian>]
  The equality uses uniform rotation, which gives $bb(E) X = 0$ and $bb(E) X^2 = v \/ 2$. The same statement applies to $Y = "Im" \( e^(i U) W \)$, since its law equals that of $X$. When $v > 0$, Chernoff’s Inequality and $\| e^(i U) W \|^2 = X^2 + Y^2$ give
  $ bb(P) { \| W \| > r } lt.eq 4 exp \( - r^2 \/ \( 2 v \) \) \, #h(2em) r > 0 . $
  Integrating $p r^(p - 1)$ times this bound proves (5.27). If $v = 0$, then $W = 0$ almost surely and the conclusion is immediate. The rotation has not changed $\| W \|$. In particular, the estimate concerns the original fixed-boundary field, even though the scalar Lee–Yang Theorem was applied after rotation.
  For positivity, orient the edges arbitrarily and expand each edge kernel in its absolutely convergent Fourier series. For XY, its coefficients are
  $ I_k \( b \) = sum_(r = 0)^oo frac(\( b \/ 2 \)^(2 r + \| k \|), r ! \( r + \| k \| \) !) gt.eq 0 . $
  They are strictly positive when $b > 0$; at $b = 0$, $I_0 \( 0 \) = 1$ and $I_k \( 0 \) = 0$ for $k eq.not 0$. For Villain they are a common positive constant times $exp \( - k^2 \/ \( 2 b \) \)$. These formulas also apply edge by edge when the parameters vary. Integration of the interior angles restricts the integer edge currents to the divergence prescribed by the inserted integer charges. The fixed boundary angles contribute the factor one and impose no further constraint there. Every surviving summand is nonnegative. The denominator is positive, proving (5.28); repeated vertices merely add their charges. ◻
]

#thm([Lemma 5.11.])[
  (Circle Wick field and all mixed moments).  #emph[Let $K > 1 \/ \( 4 pi \)$ and let $Phi_D$ be the zero-Dirichlet GFF with covariance $G_D = \( - Delta_D \)^(- 1)$. For circles contained in $D$, define 
$ V_epsilon \( x \) = exp {frac(i Phi_(D \, epsilon) \( x \), sqrt(K)) + frac(bb(E) Phi_(D \, epsilon) \( x \)^2, 2 K)} . $

 There is a complex random distribution $V_(K \, D)$ such that $V_epsilon \( f \) arrow.r V_(K \, D) \( f \)$ in every finite $L^p$ for every $f in C_c^oo \( D \; bb(C) \)$. The convergence also holds in local mean-square $H^(- 2)$ and hence in probability in $H_(upright("loc"))^(- 3) \( D \)$. For $m gt.eq 1$, $sigma_i in { - 1 \, 1 }$, and $f_i in C_c^oo \( D \; bb(C) \)$, 
#[#set math.equation(numbering: n => "(5.30)")
 $ bb(E) product_(i = 1)^m V_(K \, D)^(sigma_i) \( f_i \) = integral_(D^m) product_(i = 1)^m f_i \( x_i \) exp {- 1 / K sum_(i < j) sigma_i sigma_j G_D \( x_i \, x_j \)} product_(i = 1)^m thin upright(d) x_i . $ <vi:continuum-moments>]

 The integral is absolutely convergent. In particular, $bb(E) V_(K \, D) \( f \) = integral_D f \( x \) thin upright(d) x$.]
] <vi:circle-chaos>

#proof[
  Fix a compact set $E subset.double D$ containing all supports, and choose $0 < rho < 1$ so that the closed $2 rho$-neighborhood of $E$ is contained in $D$. On that neighborhood the fundamental-solution decomposition is
  $ G_D \( u \, v \) = frac(1, 2 pi) log frac(1, \| u - v \|) + R_D \( u \, v \) \, $
  where $R_D$ is smooth, in particular bounded, also across $u = v$. Write $q = \( 2 pi K \)^(- 1) < 2$. For $a \, b lt.eq rho$, let $C_(a \, b) \( x \, y \)$ denote the covariance of the two circle averages of $Phi_D \/ sqrt(K)$. We first prove the uniform estimate
  #[#set math.equation(numbering: n => "(5.31)")
   $ C_(a \, b) \( x \, y \) = q log frac(1, max { \| x - y \| \, a \, b }) + O_(E \, K) \( 1 \) . $ <vi:circle-covariance>]
  This includes coincident centers and equal or unequal radii. Indeed, if $r = \| x - y \|$ and $M = max { r \, a \, b }$, the double circle average of the logarithm of the distance is
  $ L_(a \, b) \( r \) = frac(1, 2 pi) integral_0^(2 pi) log max { a \, \| r + b e^(i t) \| } thin upright(d) t . $
  This follows by first averaging over the circle of radius $a$ and using $frac(1, 2 pi) integral log \| z - a e^(i t) \| thin upright(d) t = log max { \| z \| \, a }$. Pointwise comparison gives $L_(a \, b) \( r \) lt.eq log \( 2 M \)$. If $a = M$, its integrand is at least $log M$. Otherwise its average is at least the average of $log \| r + b e^(i t) \|$, which is $log max { r \, b } = log M$. Thus $log M lt.eq L_(a \, b) \( r \) lt.eq log M + log 2$. The bounded remainder gives (5.31). The logarithmic integrals in this calculation are finite, so it also justifies the covariance of every circle average used here.
  Gaussian integration, with the full diagonal variance subtracted from the characteristic exponent, gives for arbitrary radii $epsilon_1 \, dots.h \, epsilon_m lt.eq rho$
  #[#set math.equation(numbering: n => "(5.32)")
   $ bb(E) product_(i = 1)^m V_(epsilon_i)^(sigma_i) \( x_i \) = exp {- sum_(i < j) sigma_i sigma_j C_(epsilon_i \, epsilon_j) \( x_i \, x_j \)} . $ <vi:circle-mixed-kernel>]
  Here the pointwise superscript means complex conjugation for sign $- 1$. For distinct centers and $m gt.eq 2$, set
  $ d_i = min { rho \, min_(j eq.not i) \| x_i - x_j \| } \, #h(2em) r_i = max { epsilon_i \, d_i \/ 4 } . $
  The enlarged circles remain in $D$. For $i eq.not j$, both $d_i \/ 4$ and $d_j \/ 4$ are at most $\| x_i - x_j \| \/ 4$, whence
  $ max { \| x_i - x_j \| \, r_i \, r_j } = max { \| x_i - x_j \| \, epsilon_i \, epsilon_j } . $
  Equation (5.31) shows that replacing the radii by $r_i$ changes each off-diagonal covariance by a bounded amount. The covariance matrix $C^r$ of the enlarged circle averages is positive semidefinite. Therefore
  $ - sum_(i < j) sigma_i sigma_j C_(i j)^r = 1 / 2 sum_i C_(i i)^r - 1 / 2 sum_(i \, j) sigma_i sigma_j C_(i j)^r lt.eq 1 / 2 sum_i C_(i i)^r . $
  Since $C_(i i)^r lt.eq q log \( 4 \/ d_i \) + C_(E \, K)$, we have the domination
  #[#set math.equation(numbering: n => "(5.33)")
   $ 0 < bb(E) product_i V_(epsilon_i)^(sigma_i) \( x_i \) lt.eq C_(E \, K \, m) product_i d_i^(- q \/ 2) . $ <vi:circle-dominating-function>]
  For $m = 1$, the expectation is exactly one. The constants in (5.33) are independent of every radius, which is essential when two different regularizations are compared.
  Here is an explicit proof that the dominating function is integrable. Put $a = q \/ 2 < 1$. Each factor satisfies
  $ d_i^(- a) lt.eq rho^(- a) + sum_(j eq.not i) \| x_i - x_j \|^(- a) . $
  Expanding the product gives finitely many directed graphs on ${ 1 \, dots.h \, m }$, each vertex having at most one outgoing edge and no self-edge. An edge $i arrow.r j$ contributes $\| x_i - x_j \|^(- a)$. Every component is a tree or a tree attached to a single directed cycle. Integrate vertices with no incoming edge first. Such a vertex has at most one remaining incident edge, and
  $ sup_(y in E) integral_E \| x - y \|^(- s) thin upright(d) x < oo \, #h(2em) 0 lt.eq s < 2 \, $
  by polar integration over a fixed disk containing all differences $E - E$. This removes all attached trees at a uniform cost. A two-vertex directed cycle contributes $\| x - y \|^(- 2 a)$, which is integrable because $2 a = q < 2$. On a cycle with at least three vertices, integrate one vertex using
  $ integral_E \| x - y \|^(- a) \| x - z \|^(- a) thin upright(d) x lt.eq (integral_E \| x - y \|^(- 2 a) thin upright(d) x)^(1 \/ 2) (integral_E \| x - z \|^(- 2 a) thin upright(d) x)^(1 \/ 2) lt.eq C_(E \, a) . $
  The remaining graph is a path and can be integrated from its ends. Isolated vertices contribute $\| E \|$. This proves integrability of every term of the expansion, including all simultaneous collision configurations.
  At distinct centers, the covariances in (5.32) tend to $G_D \( x_i \, x_j \) \/ K$ as all radii vanish, without any constraint on their relative rates. Dominated convergence now gives convergence of all integrated mixed kernels. In particular, the second mixed kernel with radii $epsilon \, delta$ shows that $V_epsilon \( f \)$ is Cauchy in $L^2$. Uniform bounds on the even absolute moments follow by applying (5.33) with $m$ positive and $m$ negative signs and bounding the test functions by their suprema. The $L^2$ limit and these bounds imply convergence in every finite $L^p$: for a given $p$, use a uniform even moment of order strictly larger than $p$ and uniform integrability. Hölder’s Inequality then passes every mixed product to the limit and proves (5.30).
  For completeness, the limits form a random distribution. Embed the square in a larger flat torus and let $e_nu$, $nu in bb(Z)^2$, be its normalized Fourier basis. For $chi in C_c^oo \( D \)$, the second-kernel bound gives
  $ sup_(epsilon \, nu) bb(E) \| V_epsilon \( chi e_nu \) \|^2 < oo . $
  Each coefficient is Cauchy in $L^2$ and $sum_(nu in bb(Z)^2) \( 1 + \| nu \|^2 \)^(- 2) < oo$. Dominated convergence in this series proves that $chi V_epsilon$ is Cauchy in $L^2 \( Omega \; H^(- 2) \)$. On a countable nested family of cutoffs these limits are compatible, because multiplication by a fixed smooth cutoff is continuous on $H^(- 2)$. They define $V_(K \, D) in H_(upright("loc"))^(- 2) \( D \)$ almost surely, with the claimed local convergence. In particular this construction uses the circle averages and the complete Dirichlet variance specified in the statement, including its finite spatial part. ◻
]

#thm([Theorem 5.12.])[
  (Transfer from signed correlations to the full spin field).  #emph[Fix one of the ordinary nearest-neighbor XY or Villain models on $D_n$, at a fixed positive inverse temperature, with zero boundary angles. Suppose there are constants $K > 1 \/ \( 4 pi \)$ and $A > 0$, independent of $n$, with the following properties. Put 
$ a_n \( x \) = A exp { G_n \( x \, x \) \/ \( 2 K \) } \, #h(2em) U_n^sigma \( x \) = a_n \( x \) e^(i sigma theta_x) \, #h(2em) S_n^sigma \( f \) = n^(- 2) sum_(x in D_n^compose) f \( x \) U_n^sigma \( x \) . $

]
  + #emph[For every $m gt.eq 1$, every signs $sigma_i in { - 1 \, 1 }$, every $E subset.double D$, and every $delta > 0$, uniformly for $x_i in E ∩ D_n^compose$ with $\| x_i - x_j \| gt.eq delta$ for $i eq.not j$, 
#[#set math.equation(numbering: n => "(5.34)")
 $ bb(E) product_(i = 1)^m U_n^(sigma_i) \( x_i \) - exp {- 1 / K sum_(i < j) sigma_i sigma_j G_D \( x_i \, x_j \)} arrow.r 0 . $ <vi:transfer-separated>]

]
  + #emph[There is $Q in \[ 0 \, 2 \)$ such that, for every $E subset.double D$, some $C_E < oo$ satisfies 
#[#set math.equation(numbering: n => "(5.35)")
 $ 0 lt.eq bb(E) \[ U_n^sigma \( x \) U_n^tau \( y \) \] lt.eq C_E \( \| x - y \| + n^(- 1) \)^(- Q) $ <vi:transfer-two-point>]

 for all $n$, all $x \, y in E ∩ D_n^compose$, including $x = y$, and all $sigma \, tau in { - 1 \, 1 }$.]
  #emph[Then 
$ S_n^(+) med arrow.r.double med V_(K \, D) quad upright("in ") H_(upright("loc"))^(- 3) \( D \) $

 along the full sequence of integers $n$. All finite collections of complex smeared fields converge jointly, and every mixed moment of such a collection converges to (5.30).]
] <vi:field-transfer>

#proof[
  All signed products of the $U_n$ have nonnegative expectations by Lemma 43, since their deterministic multipliers are positive. We first record consequences of (5.35). If $B$ is a square of side $d lt.eq 1$ in a fixed compact interior set, then
  #[#set math.equation(numbering: n => "(5.36)")
   $ bb(E) \| S_n^(+) \( 1_B \) \|^2 lt.eq C_E \( d + n^(- 1) \)^(4 - Q) . $ <vi:box-second-moment>]
  To verify this including the lattice diagonal, fix $x in B ∩ D_n$. The number of lattice points $y$ with $j \/ n lt.eq \| x - y \| < \( j + 1 \) \/ n$ is at most $C \( j + 1 \)$. Writing $h = n^(- 1)$, summation up to $C \( d \/ h + 1 \)$ gives
  $ h^2 sum_(y in B ∩ D_n) \( \| x - y \| + h \)^(- Q) lt.eq C h^(2 - Q) sum_(j lt.eq C \( d \/ h + 1 \)) \( j + 1 \)^(1 - Q) lt.eq C \( d + h \)^(2 - Q) . $
  There are at most $C \( d \/ h + 1 \)^2$ possible $x$, which proves (5.36). The same summation on any fixed compact set gives a uniform second-moment bound for its indicator smear. For arbitrary complex weights supported there, positivity and the two-point bound imply
  #[#set math.equation(numbering: n => "(5.37)")
   $ bb(E) \| S_n^(+) \( f \) \|^2 lt.eq C_E parallel f parallel_oo^2 . $ <vi:test-second-moment>]
  Lemma 43 applies to $S_n^(+) \( w \)$ for every nonnegative weight function $w$, since $n^(- 2) a_n \( x \) w \( x \) gt.eq 0$. Decompose a complex $f$ as
  $ f = \( "Re" f \)_(+) - \( "Re" f \)_(-) + i \( "Im" f \)_(+) - i \( "Im" f \)_(-) . $
  Each of the four weights is nonnegative and at most $parallel f parallel_oo$. Minkowski’s Inequality, (5.27), and (5.37) give
  #[#set math.equation(numbering: n => "(5.38)")
   $ parallel S_n^(+) \( f \) parallel_(L^p) lt.eq C_E sqrt(p) thin parallel f parallel_oo \, #h(2em) p gt.eq 2 \, $ <vi:test-all-moments>]
  uniformly in $n$. This estimate applies to bounded weights, so indicators used in the collision argument cause no smoothness issue.
  Fix $m gt.eq 2$, signs $sigma_i$, and test functions $f_i$ supported in $E subset.double D$. Expand the mixed moment as a lattice sum. For a specified pair of indices $i \, j$, consider the part where $\| x_i - x_j \| < d$. A grid of squares of side $d$, enlarged by a fixed factor, provides at most $C_E d^(- 2)$ squares $B$ containing every such pair. For $d$ small these enlarged squares lie in a fixed larger compact $E' subset.double D$. Nonnegativity of every signed correlation and $\| f_i \| lt.eq parallel f_i parallel_oo$ show that the absolute value of this part is at most a fixed test-function factor times
  $ sum_B bb(E) [S_n^(sigma_i) \( 1_B \) S_n^(sigma_j) \( 1_B \) product_(r eq.not i \, j) S_n^(sigma_r) \( 1_(E') \)] . $
  The expectations in this display are nonnegative; their absolute values are bounded by the expectations of the products of absolute values. Hölder with $m$ equal exponents and Lemma 43 give for each square
  $ lr(|bb(E) [S_n^(sigma_i) \( 1_B \) S_n^(sigma_j) \( 1_B \) product_(r eq.not i \, j) S_n^(sigma_r) \( 1_(E') \)]|) lt.eq C_(E' \, m) bb(E) \| S_n^(+) \( 1_B \) \|^2 lt.eq C_(E' \, m) \( d + n^(- 1) \)^(4 - Q) . $
  Indeed, each of the two box factors has $L^m$ norm at most a constant times its $L^2$ norm, and all other factors have uniformly bounded $L^m$ norm. Consequently the contribution from all collision pairs obeys
  #[#set math.equation(numbering: n => "(5.39)")
   $ limsup_(n arrow.r oo) \| upright("collision contribution at distance ") d \| lt.eq C_(E \, m \, f_1 \, dots.h \, f_m) d^(2 - Q) arrow.r 0 . $ <vi:collision-removal>]
  This includes repeated lattice sites and every combination of signs; it does not assume a correlation inequality for absolute values of individual spins.
  On configurations with mutual distances at least $d$, use (5.34). Its uniformity and boundedness show that the lattice sums converge to the corresponding integrals of the continuous separated-point kernel. One can use a smooth cutoff which vanishes when a pair is within $d$ and is one when all pairs are at least $2 d$ apart; its Riemann sums converge directly. The omitted lattice contribution tends to zero by (5.39). The omitted continuum contribution tends to zero by the integrable domination in Lemma 44. Letting $d arrow.b 0$ proves convergence of the mixed moment to (5.30). For $m = 1$, uniformity in (5.34) on the support and ordinary Riemann summation give the assertion without a collision step.
  These moment limits identify the joint laws. For any finite list $f_1 \, dots.h \, f_k$, each real linear combination $Z_n$ of the real and imaginary parts of the $S_n^(+) \( f_j \)$ satisfies $parallel Z_n parallel_(L^p) lt.eq C sqrt(p)$ by (5.38). Thus, for every $t < oo$,
  $ sup_n bb(E) e^(t \| Z_n \|) < oo \; $
  this follows by expanding the exponential, since $\( C t sqrt(p) \)^p \/ p !$ is summable in integer $p$. Every even moment of the corresponding linear combination $Z$ of the $V_(K \, D) \( f_j \)$ is the limit of the lattice moments just proved. The same moment bound and the same exponential-series argument give $bb(E) e^(t \| Z \|) < oo$. Its characteristic function is therefore determined by its moments, by absolute convergence of the exponential series. The finite-dimensional lattice laws are tight by their second moments. Along any weakly convergent subsequence, the uniform moment bounds make every polynomial uniformly integrable; hence its limit has the continuum mixed moments. Every real projection of that limit has the characteristic function of $Z$. The Cramér–Wold Criterion identifies the vector law with that of $\( V_(K \, D) \( f_1 \) \, dots.h \, V_(K \, D) \( f_k \) \)$. All subsequential limits agree, giving full-sequence joint convergence of both real and imaginary parts.
  Finally choose a larger flat torus containing $D$, and a nested sequence of smooth cutoffs $chi_j$ exhausting $D$, with $chi_(j + 1) = 1$ on a neighborhood of $"supp" chi_j$. Equation (5.37) gives, uniformly in $n$ and the Fourier index $nu$,
  $ bb(E) \| S_n^(+) \( chi_j e_nu \) \|^2 lt.eq C_j . $
  Therefore
  #[#set math.equation(numbering: n => "(5.40)")
   $ sup_n bb(E) parallel chi_j S_n^(+) parallel_(H^(- 2))^2 lt.eq C_j sum_(nu in bb(Z)^2) \( 1 + \| nu \|^2 \)^(- 2) < oo . $ <vi:local-sobolev-bound>]
  The embedding $H^(- 2) arrow.r.hook H^(- 3)$ on the torus is compact: truncate the Fourier series and use that the ratio of the two squared weights is $\( 1 + \| nu \|^2 \)^(- 1) arrow.r 0$. For any $eta > 0$, choose bounds $R_j$ so that the sum of the Markov bounds $C'_j \/ R_j^2$ from (5.40) is below $eta$. The simultaneous constraints $parallel chi_j T parallel_(H^(- 2)) lt.eq R_j$ have relatively compact closure in $H_(upright("loc"))^(- 3) \( D \)$, by this compact embedding and a diagonal subsequence argument. Compatibility of cutoff limits follows from continuity of multiplication by the cutoffs, so the resulting local limits are distributions. This proves tightness in $H_(upright("loc"))^(- 3) \( D \)$. The already identified test-function laws identify every subsequential limit in that space: a countable dense family of smooth compactly supported tests separates distributions and generates its Borel sigma-field. Hence the full sequence converges to $V_(K \, D)$ there. ◻
]

#prodef([Remark 5.13.])[
  (Exact analytic interface for the two models).  The hypotheses of Theorem 45 can be checked directly from the marked-source output, without an additional field-limit input. Suppose the output for either model has the form
  $ bb(E) e^(i sum_i sigma_i theta_(x_i)) = exp { - \( ell \, G_n ell \) \/ \( 2 K \) } thin R_n \( ell \) \, #h(2em) ell = sum_i sigma_i delta_(x_i) \, $
  where, for every fixed separated list of $m$ unit marks, $R_n \( ell \) arrow.r c^m$ uniformly on separated compact sets, with one $c in \( 0 \, oo \)$ independent of signs and locations. Assume also that $R_n \( ell \) lt.eq C_E$ for one or two marks, including repeated locations. Take $A = c^(- 1)$. Multiplication by all prescribed diagonal factors gives the exact identity
  #[#set math.equation(numbering: n => "(5.41)")
   $ bb(E) product_i U_n^(sigma_i) \( x_i \) = A^m R_n \( ell \) exp {- 1 / K sum_(i < j) sigma_i sigma_j G_n \( x_i \, x_j \)} . $ <vi:diagonal-cancellation>]
  It holds also at repeated locations, by expanding $\( ell \, G_n ell \)$ before cancelling the individual diagonal terms. Off the diagonal, convergence of the lattice Green kernel to $G_D$ gives (5.34). The usual form of the required Green estimates is
  $ 0 lt.eq G_n \( x \, y \) lt.eq C_E + C_G log_(+) frac(1, \| x - y \| + n^(- 1)) \, #h(2em) x \, y in E ∩ D_n^compose \, $
  where $log_(+) t = max { log t \, 0 }$ and $C_G$ is independent of the spin inverse temperature. Together with the two-mark bound and (5.41), this gives (5.35) with $Q = C_G \/ K$, after modifying $C_E$ for distances greater than one. Thus increasing the fixed lower bound on inverse temperature so that $K > C_G \/ 2$ makes $Q < 2$. No estimates for coincident charges of arbitrarily large order are required: positivity, Lee–Yang, and the two-mark estimate handle those collisions in the proof of the theorem. Sequential convergence for every convergent separated configuration also suffices for the uniform separated hypothesis: otherwise a sequence of violations has a convergent subsequence in the compact separated configuration space, contradicting that sequential assertion. The argument consequently applies to both ordinary models once their respective marked-source estimates have been established, with their own fixed $K$ and $A$ and with every integer lattice size $n$.
] <vi:transfer-interface>

#thm([Theorem 5.14.])[
  (Low-temperature Villain field).  #emph[There is $b_0 \( upright(V) \) < oo$ such that for every $b gt.eq b_0 \( upright(V) \)$ the ordinary Villain model with zero boundary angles satisfies 
$ n^(- 2) sum_(x in D_n^compose) A_(upright(V)) \( b \) exp { G_n \( x \, x \) \/ \( 2 K_(upright(V)) \( b \) \) } e^(i theta_x) delta_x med arrow.r.double med V_(K_(upright(V)) \( b \) \, D) quad upright("in ") H_(upright("loc"))^(- 3) \( D \) $

 along all integers $n arrow.r oo$, with joint convergence of every finite collection of complex smears and convergence of all their mixed moments. Here 
$ A_(upright(V)) \( b \) = c \( b \)^(- 1) > 0 \, #h(2em) K_(upright(V)) \( b \) = frac(b, 1 + s \( b \)) = frac(beta_(upright("eff")) \( J_(upright("nn")) \, pi^2 b \), pi^2) \, #h(2em) frac(K_(upright(V)) \( b \), b) arrow.r 1 . $

 The lower bound can be chosen so that $K_(upright(V)) \( b \) > 1 \/ \( 4 pi \)$ and $pi^2 b gt.eq beta_(upright(c)) \( J_(upright("nn")) \)$ for every such $b$.]
] <vi:villain-spin>

#proof[
  The exact microscopic measure, without an added-noise or small-activity replacement, was initialized in Proposition 36. Propositions 37 and 41 give the same $s \( b \)$ and $c \( b \)$ for all domains, locations, and signed unit observables. Corollary 42 verifies both hypotheses of Theorem 45, and $s = O \( e^(- c b) \)$ permits the fixed lower bound on $b$ required there. Applying that theorem proves the field and moment conclusions. Proposition 39 supplies the effective-coefficient identity with the height law, with the same $s$. ◻
]

== 6 The ordinary XY model: mixed Gaussian histories <xyh:section>

This section constructs the expansion used for the ordinary cosine interaction. The sizes constructed below are sizes of specified integral representations. Their defining estimate concerns an evaluated history, and does not assert a pointwise absolute bound at every value of an unintegrated complex field. This distinction is necessary because the compensating gradient interaction has positive sign.

The aim is the composable activity calculus of Proposition 62, used by the recurrence in Section 7. The branch identity supplies the microscopic factors, and the local operations assemble them into the selected histories of Definition 56. The support and atom estimates, the evaluated-history bound of Lemma 60, and the separate charge payments of Lemma 61 together give the small costs and single-input gains in that calculus.

The Fourier and vortex representations belong to the duality framework of #cite(label("JoseKadanoffKirkpatrickNelson1977"), form: "prose"). The Gaussian-smoothed branch decomposition and the evaluated-history bounds below supply the additional estimates for the cosine interaction.

=== 6.1 An exact branch representation <an-exact-branch-representation>

Use lattice units, fuse the boundary of the spin square to one vertex, and delete the pinned perimeter edges, as in Lemma 34. Each deleted edge has weight $e^(b cos 0) = e^b$, or one after the normalization by $e^(- b)$ used below, so this deletes only a source-independent factor. Let $d$ and $partial$ be the primal and dual incidence operators, and let $cal(R)$ be the signed crossing identification, with the orientations of Lemma 34. Inner products count every edge once. Put

$ G = \( partial^(*) partial \)^(- 1) \, #h(2em) P_L = partial G partial^(*) \, #h(2em) P_T = I - P_L \, #h(2em) frak(p) = 2 pi sqrt(b) \, $

where the inverse is on dual scalars of mean zero. Thus $P_T = cal(R)^(- 1) d G_n d^(*) \( cal(R)^(- 1) \)^(*)$. Fix a sufficiently small number $upsilon > 0$, independent of $b$, and define

$ h_b \( x \) = integral_(- pi sqrt(b))^(pi sqrt(b)) frac(e^(- \( x - t \)^2 \/ \( 2 upsilon^2 \)), sqrt(2 pi) upsilon) thin d t \, #h(2em) f_b \( z \) = h_b \( z \) e^(z^2 \/ 2 + b \( cos \( z \/ sqrt(b) \) - 1 \)) \, #h(2em) F_b = f_b - 1 . $

Both functions in the last display are entire. The intervals translated by $frak(p) bb(Z)$ partition the real line, up to their endpoints, so $sum_(m in bb(Z)) h_b \( x + frak(p) m \) = 1$. Consequently

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(m in bb(Z)) e^(- \( x + frak(p) m \)^2 \/ 2) f_b \( x + frak(p) m \) = e^(b \( cos \( x \/ sqrt(b) \) - 1 \)) . $ <xyh:periodization>]

In particular smoothing the branch cutoff has made no change to the spin law.

#thm([Lemma 6.1.])[
  (Bounds for the branch factor).  #emph[There are $b_1 \, C < oo$ and $kappa_0 < 1 \/ 2$ such that, for $b gt.eq b_1$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ \| F_b \( x + i y \) \| lt.eq C / b exp { kappa_0 x^2 + C y^2 e^(\| y \| \/ sqrt(b)) } \, #h(2em) \( log f_b \)'' \( x \) gt.eq - C quad \( x \, y in bb(R) \) . $ <xyh:primitive-bound>]

]
] <xyh:branch-bounds>

#proof[
  On the central interval, $1 - cos \( x \/ sqrt(b) \) gt.eq c x^2 \/ b$. On a fixed slightly larger interval the same inequality holds with a smaller $c > 0$. Outside that interval the Gaussian tail of $h_b$ gives the bound $h_b \( x \) e^(b \( cos \( x \/ sqrt(b) \) - 1 \)) lt.eq C e^(- c x^2)$, after choosing $upsilon$ small. This proves the bound globally on the real line. Directly from the integral defining $h_b$, $\| h_b \( x + i y \) \| lt.eq e^(y^2 \/ \( 2 upsilon^2 \)) h_b \( x \)$; also $b \| cos \( x \/ sqrt(b) \) \| \( cosh \( y \/ sqrt(b) \) - 1 \) lt.eq C y^2 e^(\| y \| \/ sqrt(b))$. Hence $\| f_b \( x + i y \) \| lt.eq C e^(\( 1 \/ 2 - c \) x^2 + C y^2 e^(\| y \| \/ sqrt(b)))$.
  To obtain the factor $b^(- 1)$, on $\| x \| lt.eq sqrt(b)$ write $f_b - 1$ as $\( h_b - 1 \) e^(z^2 \/ 2 + b \( cos \( z \/ sqrt(b) \) - 1 \))$ plus $e^(z^2 \/ 2 + b \( cos \( z \/ sqrt(b) \) - 1 \)) - 1$. The first term uses the exponentially small cutoff error, with the same imaginary bound. Taylor’s formula with integral remainder bounds the exponent in the second by $C b^(- 1) \( \| x \| + \| y \| \)^4 e^(\| y \| \/ sqrt(b))$. The inequality $\| e^u - 1 \| lt.eq \| u \| max \( 1 \, e^(Re u) \)$ and the previously proved real Gaussian margin absorb the $x$ polynomial into a fixed increase of its square coefficient; the $y$ polynomial is absorbed into $C e^(C y^2 e^(\| y \| \/ sqrt(b)))$. On $\| x \| > sqrt(b)$, the global bound and $b lt.eq C e^(c x^2 \/ 2)$ give the same result. These increases leave $kappa_0 < 1 \/ 2$. Finally differentiation under the positive real integral shows
  $ \( log h_b \)'' \( x \) = - upsilon^(- 2) + upsilon^(- 4) "Var"_x \( t \) gt.eq - upsilon^(- 2) . $
  Adding the second derivative $1 - cos \( x \/ sqrt(b) \) gt.eq 0$ of the other exponent proves the Hessian bound. ◻
]

#thm([Proposition 6.2.])[
  (Unwrapping and sources).  #emph[Up to a positive source-independent constant, the XY partition function is 
#[#set math.equation(numbering: n => "(6.3)")
 $ sum_(q in bb(Z)^(upright("dual"))\
sum q = 0) e^(- parallel V_q parallel^2 \/ 2) thin bb(E)_(X tilde.op N \( 0 \, P_T \)) product_e f_b \( \( X + V_q \)_e \) \, #h(2em) V_q = frak(p) partial G q . $ <xyh:positive-ensemble>]

 For an integral source $l$ on primal vertices, choose an integral current $d G_n l + cal(R) partial a$ of divergence $l$, and set 
$ theta.alt = a \/ sqrt(b) \, #h(2em) eta = - cal(R)^(- 1) d G_n l \/ sqrt(b) . $

 The numerator for $bb(E) e^(i \( l \, theta \))$ is the same sum with insertion 
#[#set math.equation(numbering: n => "(6.4)")
 $ e^(- i \( X \, eta \) + i frak(p) \( q \, theta.alt \)) . $ <xyh:physical-insertion>]

 In particular $partial^(*) eta = 0$ and $parallel eta parallel^2 = \( l \, G_n l \) \/ b$.]
] <xyh:branch>

#proof[
  Apply Equation (6.1) on each edge, with $x = sqrt(b) thin d theta$. For a branch integer $m$, put $w = cal(R)^(- 1) sqrt(b) \( d theta + 2 pi m \)$. Its divergence is $partial^(*) w = frak(p) q$ for an integral mean-zero $q$. The incidence matrix of a connected graph maps integral edges onto integral mean-zero vertex arrays: a rooted spanning tree gives a solution by assigning to each parent edge the sum of charges below it. Thus every such $q$ occurs. Two integral branch solutions with the same $q$ differ by an integral primal gradient after crossing. To verify this last claim, integrate their increments along primal paths; zero sums around dual plaquettes make the result path independent, and fixing its value at the fused vertex makes it integral and unique. Summing over these gradients unwraps the angular fundamental domain to the complete transverse real space. Its Jacobian is constant, independent of $q$ and of the source. Orthogonal decomposition gives $w = X + V_q$, with $X in "ran" P_T$; its Gaussian square splits into $parallel X parallel^2 + parallel V_q parallel^2$.
  In the angular insertion the continuous lift gives $- i \( X \, eta \)$. Changing that lift by the gradient part of $2 pi m$ contributes $- 2 pi \( d G_n l \, m \) = 2 pi \( q \, a \)$ modulo $2 pi$, because the selected total current is integral. This is exactly the second factor in Equation (6.4). Orthogonality and the definition of $G_n$ give the last two assertions. All sums converge on a finite graph by the real Gaussian branch bound in Lemma 48. ◻
]

=== 6.2 Compensation and the Gaussian prescription <compensation-and-the-gaussian-prescription>

Write $p = partial psi$ and use the parameter notation

$ mu = 1 + s_11 \, #h(2em) d_c = 1 + s_12 \, #h(2em) s = s_22 \, #h(2em) U \( w \, p \) = 1 / 2 sum_e \( s_11 w_e^2 + 2 i s_12 w_e p_e + s p_e^2 \) . $

The compensation parameters $\( s_11 \, s_12 \, s_22 \)$ lie in a fixed sufficiently small neighborhood of zero and satisfy

#[#set math.equation(numbering: n => "(6.5)")
 $ s gt.eq d_(*) s_12^2 \, #h(2em) d_(*) > 0 upright(" fixed") . $ <xyh:permitted-parameters>]

Before compensation the inverse covariance is $mu$ on transverse $w$ and

#[#set math.equation(numbering: n => "(6.6)")
 $ mat(delim: "(", mu, i d_c; i d_c, s) $ <xyh:inverse-pair>]

on longitudinal pairs $\( w \, p \)$. Scalars $psi$ also have a uniform common constant of period $b^(- 1 \/ 2)$. The vertex factors are $sum_(q_v in bb(Z)) e^(i frak(p) q_v psi_v)$; this common constant enforces $sum q_v = 0$.

#thm([Proposition 6.3.])[
  (Exact compensation and spin offsets).  #emph[The normalized integral with inverse covariance Equation (6.6), vertex factors, edge factors $f_b \( w \)$, and factor $e^(U \( w \, p \))$ equals Equation (6.3) up to one source-independent determinant normalization. If in the interaction one replaces 
#[#set math.equation(numbering: n => "(6.7)")
 $ p mapsto p + eta \, quad psi mapsto psi + theta.alt \, quad w mapsto w - i d_c eta \/ mu \, $ <xyh:offsets>]

 including this last replacement in $f_b$, the integral is the physical inserted partition function multiplied by 
#[#set math.equation(numbering: n => "(6.8)")
 $ exp { \( s + d_c^2 \/ mu \) parallel eta parallel^2 \/ 2 } . $ <xyh:spin-prefactor>]

 These identities have the finite-dimensional limiting interpretation specified in the proof, including at $s = 0$.]
] <xyh:compensation>

#proof[
  At first take $s > 0$, finitely many Fourier indices, and multiply every compensating quadratic by a number $lambda < 1$. Integration then uses the ordinary complex Gaussian density whose real precision on $w \, p$ is positive. Normalize its Gaussian integral by its determinant, continuously from real positive diagonal precision. The mixed off-diagonal entries are purely imaginary, so this prescription is unambiguous. On restoring the full compensation its formal exponent becomes $- parallel w parallel^2 \/ 2 - i \( w \, p \)$. Integrating a fixed neutral Fourier charge by Gaussian completion gives real mean $V_q$ and covariance $P_T$ for $w$; the remaining charge factor is $e^(- parallel V_q parallel^2 \/ 2)$. The matrix calculation is also obtained by first integrating $p$ at $lambda < 1$ and letting $lambda arrow.t 1$; the covariance tends to the stated positive semidefinite matrix. The determinant ratio is independent of $q$.
  For the offset identity put $w' = w - i d_c eta \/ mu$ in the full compensated exponent. Expansion gives exactly
  $ - 1 / 2 parallel w' parallel^2 - i \( w' \, p \) - i \( w' \, eta \) + 1 / 2 \( s + d_c^2 \/ mu \) parallel eta parallel^2 . $
  Every additional linear term involving $p$ vanishes since $\( p \, eta \) = 0$. The vertex shift supplies $e^(i frak(p) \( q \, theta.alt \))$. The contour translation in $w$ is allowed at every fixed regularization by the strict real Gaussian margin of Equation (6.2); for an entire integrand the vertical sides of a translating rectangle have integrals tending to zero.
  For completeness the uniform domination needed here, and in subsequent local calculations, is proved in Lemma 60 and Proposition 62: at fixed depth it retains $e^(- c b sum q_v^2)$ after any fixed deterministic contour shifts and permits $lambda arrow.t 1$ and Fourier truncation removal. The use of that estimate is noncircular: its proof starts with the same strict, finite regularizations and only uses their finite Gaussian completion identities. It proves domination before asserting the present limiting identities. At $s = 0$, Equation (6.5) forces $s_12 = 0$; take a limit from the permitted region. Source-independent determinants cancel in every partition ratio. Thus no positive joint probability law for $\( w \, psi \)$ is being assumed at a degenerate endpoint. ◻
]

=== 6.3 Kernels and normalized smooth tests <kernels-and-normalized-smooth-tests>

The finite grids, their reflections, and block geometry are those in Lemmas 26, 27, and 28. We modify only the low-pass polynomial in order to allow increasing differentiability. Let $p_0 = 32$, and, for dyadic $d$, put

$ P_d \( cos t \) = (frac(sin \( d t \/ 2 \), d sin \( t \/ 2 \)))^(2 p_0) \, #h(2em) Q_r = product_(2 lt.eq d lt.eq r\
d upright(" dyadic")) P_d \, #h(2em) Q_1 = 1 . $

The arguments of these polynomials are $1 - lambda \/ 16$, where $lambda$ is the graph-Laplacian eigenvalue. After the first piece $gamma I$, $gamma = 1 \/ 16$, the binary scalar pieces have multipliers

#[#set math.equation(numbering: n => "(6.9)")
 $ hat(Gamma)_r \( lambda \) = \( 1 - gamma lambda \) frac(Q_r - Q_(2 r), lambda) . $ <xyh:binary-multiplier>]

Use the same prescription on dual free and primal Dirichlet scalars, writing $Gamma_r^(upright("pr"))$ for the latter. The terminal positive remainder is split, for estimates, into binary pieces through a size comparable to the domain and a final remainder. On the auxiliary torus include the two independent harmonic transverse directions in this last remainder. Harmless scalar constant variances may also be added there.

#thm([Lemma 6.4.])[
  (High-order kernel estimates).  #emph[There are constants $C \, C_0 \, c > 0$, independent of the shell ratio $L$, such that, at binary scale $r$ and for every difference order $j$, 
#[#set math.equation(numbering: n => "(6.10)")
 $ \| nabla^j Gamma_r \( x \, y \) \| & lt.eq C e^(C_0 j^2) r^(- j) \, & parallel nabla^j Gamma_r^(1 \/ 2) parallel_(2 arrow.r 2) & lt.eq C e^(C_0 j^2) r^(1 - j) quad \( j gt.eq 1 \) . $ <xyh:high-derivatives>]

 The kernel has range $C r + O \( j \)$. These bounds hold for the reflected kernels and for the last remainder on nonconstant modes, with $r$ comparable to the domain size. A shell from $m$ to $L m$ has diagonal at least $c log L$ on the free grid, plane, or torus, and its positive-order differences on a region of diameter $O \( m \)$ obey the bounds obtained by summing Equation (6.10).]
  #emph[Set $D_r = partial Gamma_r^(1 \/ 2)$ and $B_r = cal(R)^(- 1) d \( Gamma_r^(upright("pr")) \)^(1 \/ 2)$. Including first and last pieces and the stipulated harmonic directions, 
#[#set math.equation(numbering: n => "(6.11)")
 $ E_r = B_r B_r^(*) + D_r D_r^(*) succ.curly.eq 0 \, quad sum_r E_r = I \, quad E_(gt.eq S) := I - sum_(r < S) E_r upright(" has range ") C S . $ <xyh:white-resolution>]

]
] <xyh:kernels>

#proof[
  Each $P_d$ is a nonnegative polynomial at most one on the spectrum, of degree $p_0 \( d - 1 \)$. Thus $Q_r - Q_(2 r) = Q_r \( 1 - P_(2 r) \) gt.eq 0$ and its zero at $lambda = 0$ makes Equation (6.9) a polynomial of degree $O \( r \)$. This proves positivity and range. On the Fourier square $lambda asymp \| xi \|^2$, and the product over dyadic $d$ gives
  $ \| hat(Gamma)_r \( xi \) \| lt.eq C min { r^2 \, med \| xi \|^(- 2) e^(- c \( log^(+) \( r \| xi \| \) \)^2) } . $
  Indeed for $d \| xi \| gt.eq 1$ the factor is bounded by $C \( d \| xi \| \)^(- 2 p_0)$, whose logarithms sum to a negative quadratic in $log \( r \| xi \| \)$; for $r \| xi \| lt.eq 1$ use $1 - P_(2 r) lt.eq C r^2 \| xi \|^2$. Multiplication by $\| xi \|^j$ and integration in two dimensions reduces the pointwise estimate to $r^(- j) integral_1^oo t^(j - 1) e^(- c \( log t \)^2) thin d t$, bounded by $C e^(C_0 j^2) r^(- j)$ by completing the square. Taking a supremum instead of an integral proves the square-root operator estimate. Discrete Fourier sums give the same bounds on finite periodic extensions. Reflection has only a fixed number of images within range at scales below the domain; the terminal Fourier sum gives the remaining cases. For $j lt.eq 8 + ceil.l log \( 2 + r \) ceil.r$, the stencil extension is still $O \( r \)$.
  On a small annular frequency band $a \/ r lt.eq \| xi \| lt.eq 4 a \/ r$, the earlier product is bounded below since its relative errors sum as $sum_(d lt.eq r) d^2 \| xi \|^2 lt.eq C a^2$; the last difference is bounded below by $c_a r^2$. Each binary piece consequently contributes a positive constant to its diagonal. For reflected cosine eigenfunctions, pair a frequency index $u$ with $2 u$ inside a slightly wider band: at least one of their squared cosines is bounded below at every site. Apply this in both coordinates. The terminal clearance ensures enough frequencies per band. Summing the binary scales proves the diagonal assertion.
  The scalar pieces telescope to $G$ and $G_n$, respectively. Applying gradients yields $P_L + P_T = I$; on a torus the harmonic addition supplies the missing two directions. Finally $E_(gt.eq S)$ is the identity minus a finite sum of polynomial kernels of total range $C S$. ◻
]

The same binary summation proves the high-order version of the Green bounds used for local lifts:

#[#set math.equation(numbering: n => "(6.12)")
 $ \| nabla_x^j G_n \( x \, y \) \| lt.eq C e^(C_0 j^2) \( 1 + "dist" \( x \, y \) \)^(- j) \, #h(2em) j gt.eq 1 . $ <xyh:green-high>]

Indeed pieces of size smaller than a fixed multiple of the distance vanish, except for the difference-stencil enlargement; the remaining geometric sum of $r^(- j)$ gives the bound. When the stencil length is comparable to the distance, its extra factor $j^j$ is absorbed by $e^(C_0 j^2)$. The box-scale last piece has the same bound. Differentiating $eta$ and integrating it on a source-free local region yields the corresponding test bounds for local lifts with these high-order constants. Reflections use the oriented parities of the primal and dual kernels. This extends the fixed-order bounds of Lemma 35 to every order needed here.

At scale $m$ let $j \( m \) = 8 + ceil.l log \( 2 + m \) ceil.r$. A normalized scalar test on a specified region and fixed collar satisfies

#[#set math.equation(numbering: n => "(6.13)")
 $ \| m^j nabla^j u \| lt.eq e^(K_0 j^2) quad \( 0 lt.eq j lt.eq j \( m \) \) \; $ <xyh:test-class>]

a normalized edge test satisfies the same inequalities for $m w$. Here $K_0$ is fixed larger than all high-order kernel constants. Functions are defined on the entire extended grid, but only the stated local bounds are imposed; derivatives at walls use reflection. A scalar atom born at $m$ is a linear functional supported in a fixed multiple of an $m$-box, annihilating constants, and bounded by one on these scalar tests. An edge atom uses the edge test convention, without constant annihilation. Multiplication by any fixed constant merely changes the universal atom bound. For a real charge array $k$ on $X$, write

$ h_m \( k \; X \) = sup_(u upright(" satisfying ") upright("(6.13)")) \| \( k \, u \) \| \, $

using a fixed expanded neighborhood of $X$. Coarse tests restrict to fine tests. If $X$ is small, subtraction of a constant gives

#[#set math.equation(numbering: n => "(6.14)")
 $ h_(L m) \( k \; overline(X) \) lt.eq h_m \( k \; X \) \, #h(2em) h_(L m) \( k \; overline(X) \) lt.eq \| sum k \| + \( C \/ L \) h_m \( k \; X \) . $ <xyh:test-coarsening>]

The second inequality follows by joining each site to an anchor with a path of length $O \( m \)$, and applying the positive-order test inequalities.

The next four lemmas prepare the estimates for a sequence of local integrations and Taylor subtractions. One term selected from this expansion records which microscopic factors were used, which components merged, and which Taylor directions were chosen. Its precise record, the selected history of Definition 56, is a rooted forest: microscopic factors are leaves, and operations join or end their field dependence. A Taylor subtraction on one component introduces atoms; evaluating a scalar coefficient ends the old field dependence. The forest rules will be specified after the analytic estimates, then used to check their overlap and scale-weight hypotheses separately on each coupled live root.

First we separate a coarse Taylor argument into fixed normalized fine directions and linear coarse coefficients. Lemma 52 gives small absolute coefficient sums for this separation. Those sums will supply the powers of $L^(- 1)$ in the local Taylor gains; the atoms remain as field-dependent factors to be controlled by the subsequent lemmas.

#thm([Lemma 6.5.])[
  (Smooth directional decomposition).  #emph[Let $S = L m$, and restrict a coarse field $z = \( w \, psi \)$ to the prescribed neighborhood of a small fine activity, with its fine collar. Modulo a scalar constant, this restriction is a finite sum of fixed normalized fine test directions multiplied by bounded $S$-atom evaluations, with total absolute numerical coefficient weight at most $C \/ L$. The bulk error after subtracting a constant oriented edge field and an affine scalar field has such a representation with total weight at most $C \/ L^2$. The constants hold for all sufficiently large $L$ and for the specified reflected and unwrapped periodic regions.]
] <xyh:fourier>

#proof[
  Use the test convention in Equation (6.13), and put
  $ W \( t \) = sup_(j in bb(N)_0) t^j e^(- K_0 j^2) . $
  Choose a periodic lattice box of side $T asymp S$ containing the fine region and its collar. A cutoff $chi$ equals one there, is supported in the prescribed coarse neighborhood, and satisfies
  $ \| nabla^k chi \| lt.eq C^(k + 1) \( k ! \)^3 S^(- k) . $
  Such a cutoff is obtained by sampling a fixed compact Gevrey bump after rescaling by $S$. For scalar fields expand $f = chi \( psi - psi \( v_0 \) \)$, and for edge fields expand $f = S chi w$. Write $c_ell \( f \)$ for normalized discrete Fourier coefficients and $r_ell = 1 + \| ell \|$, using representatives with $\| ell_i \| lt.eq T \/ 2$.
  The cutoff preserves the derivative allowance at the cost of an exponential factor in the order. Indeed, a Leibniz term with $k$ derivatives on the cutoff has, relative to $e^(K_0 j^2)$, the factor
  $ \( k ! \)^3 e^(K_0 \( j - k \)^2 - K_0 j^2) lt.eq \( k ! \)^3 e^(- K_0 k^2) lt.eq C_(K_0) . $
  Summing the Leibniz terms, including harmless lattice shifts, gives $S^j \| nabla^j f \| lt.eq C^(j + 1) e^(K_0 j^2)$ for $0 lt.eq j lt.eq j \( S \)$ on normalized coarse tests. Summation by parts in a coordinate with maximal $\| ell_i \|$ gives
  $ \| c_ell \( f \) \| lt.eq C C_1^j r_ell^(- j) e^(K_0 j^2) \, #h(2em) 0 lt.eq j lt.eq j \( S \) . $
  For sufficiently small fixed $c > 0$,
  $ A_ell \( z \) = W \( c r_ell \) c_ell \( f \) $
  is therefore a bounded coarse atom. Scalar coefficients annihilate constants because of the anchor subtraction. The finite derivative budget suffices: a maximizing index for $W \( t \)$ can be chosen at most $J$ whenever $log t lt.eq K_0 \( 2 J + 1 \)$; this holds for $t = c r_ell$, $\| ell \| lt.eq C T$, and $J = j \( S \)$.
  Let $e_ell$ denote a Fourier mode. On the fine region the scalar mode $e_ell - e_ell \( v_0 \)$ has fine test norm at most
  $ C L^(- 1) r_ell W \( C r_ell \/ L \) . $
  Subtracting its discrete affine interpolant gives the bound
  $ C L^(- 2) r_ell^2 W \( C r_ell \/ L \) . $
  At orders zero and one this is discrete Taylor’s formula; at orders at least two the two frequency factors are already present. For edges the Fourier mode carries the factor $S^(- 1)$, and the corresponding polynomial powers of $r_ell$ are zero and one. The cutoff equals one at every site needed for the anchor and its difference stencils, so these are exact identities for the specified restrictions and affine errors.
  For every fixed positive integer $N$, shifting the integer in the supremum defining $W$ gives
  $ W \( t \) gt.eq e^(- K_0 N^2) t^N W \( t e^(- 2 K_0 N) \) . $
  If $L gt.eq \( C \/ c \) e^(2 K_0 N)$, then
  $ frac(W \( C r \/ L \), W \( c r \)) lt.eq e^(K_0 N^2) \( c r \)^(- N) . $
  Choose $N > P + 2$, where $P lt.eq 2$ is the polynomial power above. Thus
  $ sum_(ell in bb(Z)^2) r_ell^P frac(W \( C r_ell \/ L \), W \( c r_ell \)) lt.eq C . $
  Normalize the fine modes by their displayed bounds and absorb their remaining factors into the numerical coefficients. This proves the two asserted coefficient sums. Real and imaginary parts may be separated at a fixed additional cost. Near a wall perform the expansion on the reflected extension and average the modes over the finitely many nearby reflections, with their prescribed scalar or oriented-edge signs. Choose $chi = 1$ also on the required image regions. The identities and normalized bounds persist. The periodic boxes under consideration unwrap with the stated clearance, so the same construction applies there. ◻
]

We next control the Gaussian source created by a collection of atoms. The required estimate must cover every future gradient tail and every point in an atom’s neighborhood, uniformly in how many scales remain. The two suprema in the following lemma express exactly these choices.

#thm([Lemma 6.6.])[
  (Non-tangential square estimate).  #emph[For a stacked coordinate vector $g = \( g_r \)_r$, put $T_u g = sum_(r gt.eq u) nabla Gamma_r^(1 \/ 2) g_r$, with binary scale indices including the first and terminal pieces. For each fixed aperture $A$ and each $q gt.eq 0$, 
$ ∥sup_u sup_(\| y - x \| lt.eq A u) u^q \| nabla^q T_u g \( y \) \|∥_2 lt.eq C e^(C \( q + 1 \)^2) (sum_r parallel g_r parallel_2^2)^(1 \/ 2) . $

 The same conclusion holds for the primal rotated gradient and for their finite direct sums. By increasing $K_0$ once, the sum of these maxima with weights $e^(- K_0 q^2)$ has the same square bound. All constants are uniform in depth and shell grouping, and the conclusions include the reflected, periodic, and terminal pieces.]
] <xyh:maximal>

#proof[
  Write $cal(D)_r = nabla Gamma_r^(1 \/ 2)$. The multiplier bounds in Equations (6.9) and (6.10) imply
  $ \| d_r \( xi \) \| lt.eq C min { r \| xi \| \, e^(- c \( log^(+) \( r \| xi \| \) \)^2) } . $
  Here $\| xi \|$ may equivalently be replaced by the square root of the lattice Laplacian symbol. On nonconstant terminal modes the same bound holds because the terminal scale is comparable to the box side. The white resolution, Equation (6.11), or Fourier Cauchy–Schwarz gives, for $F = sum_r cal(D)_r g_r$,
  $ parallel F parallel_2^2 lt.eq C sum_r parallel g_r parallel_2^2 . $
  Set $R_u = T_u g - Q_u F$. The term from scale $r$ has multiplier $\( 1 - Q_u \) d_r$ for $r gt.eq u$, and $- Q_u d_r$ for $r < u$. For every $q gt.eq 0$,
  $ parallel \( u nabla \)^q R_(u \, r) parallel_(2 arrow.r 2) lt.eq C e^(C \( q + 1 \)^2) min \( r \/ u \, u \/ r \) . $
  For $r < u$, put $t = u \| xi \|$. The multiplier is bounded by $C \( r \/ u \) t^(q + 1) e^(- c \( log^(+) t \)^2)$. For $r gt.eq u$, put $t = r \| xi \|$ and $rho = u \/ r$. Use $\| 1 - Q_u \| lt.eq C min { 1 \, \( rho t \)^2 }$ and
  $ \( rho t \)^q min { 1 \, \( rho t \)^2 } lt.eq rho^(q + 1) t^(q + 1) . $
  The supremum of a fixed power of $t$ times the logarithmic Gaussian decay costs at most $C e^(C \( q + 1 \)^2)$. Young’s Inequality on binary scale indices consequently gives
  $ sum_u parallel \( u nabla \)^q R_u parallel_2^2 lt.eq C e^(C \( q + 1 \)^2) sum_r parallel g_r parallel_2^2 . $
  For $q gt.eq 1$ the same estimate holds directly for $T_u g$, because only $r gt.eq u$ occurs and the derivative gives the summable gain $\( u \/ r \)^q$.
  The scaled lattice Sobolev estimate in two dimensions is
  $ sup_(\| y - x \| lt.eq A u) \| H \( y \) \|^2 lt.eq C sum_(k = 0)^2 u^(2 k - 2) sum_(\| z - x \| lt.eq B u) \| nabla^k H \( z \) \|^2 . $
  To obtain it, apply a cutoff on the larger box and use Fourier Cauchy–Schwarz with weight $\( 1 + u^2 \| xi \|^2 \)^2$; the inverse-weight sum is $O \( u^(- 2) \)$. Summing the displayed estimate over $x$ and then over $u$ proves the non-tangential bounds for $R_u$ and the positive-order tails. At order zero the remaining term satisfies
  $ sup_(\| y - x \| lt.eq A u) \| Q_u F \( y \) \| lt.eq C M \( \| F \| \) \( x \) \, $
  where $M$ is the lattice averaging maximal operator: $Q_u$ has range $O \( u \)$ and kernel size $C u^(- 2)$. The square bound for $M$ follows from the cube covering inequality and layer-cake integration. These arguments prove the asserted bounds. Their constants grow at most as $C e^(C \( q + 1 \)^2)$; summing with $e^(- K_0 q^2)$ is legitimate for sufficiently large fixed $K_0$.
  Reflection reduces the finite wall problem to periodic extensions with the required signs and a fixed volume multiplicity. The same Fourier and local estimates hold there, counting norms per period. The last remainder has the stated box-scale estimates. Harmonic constants, where present, have zero approximation error since $Q_u 1 = 1$, zero positive differences, and a square bound from the white resolution. This also covers the finite direct sums in the statement. A grouped shell is obtained by restricting the binary tail indices and by taking its corresponding coordinate direct sum, which does not enlarge these estimates. ◻
]

Writing a sum of atom evaluations as a linear functional of the stacked Gaussian coordinates produces a coefficient vector, the combined source $I$ below. The square estimate bounds its norm and the maximal gradient tails produced by its scalar-coordinate part. Here the assumptions on birth-box overlap and scale weights are explicit; their validity for each generated live root is checked in Lemma 57 and the attenuation description that follows it.

#thm([Lemma 6.7.])[
  (Atom source bounds).  #emph[Consider $n_a$ normalized scalar or edge atoms, with a fixed bound on the overlap multiplicity of their comparable birth boxes at each birth size. Couple each atom only to field pieces at or after its birth. Its scale coefficients may depend on the atom and have uniformly bounded magnitude and total variation. The resulting combined source on the stacked unmixed coordinates satisfies 
$ parallel I parallel_2^2 lt.eq C n_a . $

 This holds on both coordinate components and their direct sum. For its scalar-coordinate component, the output tails $v^(gt.eq u) = sum_(r gt.eq u) D_r I_r$ satisfy 
$ ∥sup_u sup_(\| y - x \| lt.eq A u) \| v^(gt.eq u) \( y \) \|∥_2^2 lt.eq C n_a . $

]
] <xyh:atoms>

#proof[
  Let $cal(M) g$ be the derivative-weighted maximal function in Lemma 53. A scalar atom born at size $h$ may subtract the future scalar field’s anchor value. A lattice path bounds the zeroth order by $C h$ times its gradient maximum; the higher test orders are controlled by the corresponding terms in $cal(M)$. An edge atom obeys the same bound because its test normalization contains the extra factor $h$. Thus either atom acts on future fields with absolute value at most
  $ C h inf_(x in B) cal(M) g \( x \) \, $
  where $B$ is its comparable birth box and the fixed aperture is large enough to contain the required collar. For each atom Abel summation writes a weighted future sum exactly as
  $ sum_(r gt.eq h) a_r F_r = a_h T_h + sum_(r > h) \( a_r - a_(r^(-)) \) T_r . $
  The sum of coefficient magnitudes is uniformly bounded by the assumed magnitude and total variation, so the preceding atom bound persists. All tails here start at a size at least the atom birth.
  For the family of birth boxes put
  $ rho \( x \) = sum_alpha h_alpha^(- 1) 1_(B_alpha) \( x \) . $
  Bounded overlap and geometric summation over dyadic sizes give
  $ parallel rho parallel_oo lt.eq C \, #h(2em) rho \( x \)^2 lt.eq C sum_alpha h_alpha^(- 2) 1_(B_alpha) \( x \) \, #h(2em) parallel rho parallel_2^2 lt.eq C n_a . $
  For the middle inequality compare both sides to the inverse square of the smallest occupied size at $x$. Since $\| B_alpha \| asymp h_alpha^2$, duality and Lemma 53 give
  $ \| chevron.l I \, g chevron.r \| & lt.eq C sum_alpha h_alpha inf_(B_alpha) cal(M) g lt.eq C sum_x rho \( x \) cal(M) g \( x \)\
 & lt.eq C sqrt(n_a) (sum_r parallel g_r parallel_2^2)^(1 \/ 2) . $
  This proves the source bound on all stated components. Apply Lemma 53 once more, now to the scalar-coordinate source itself, to obtain the output square bound. The proof uses the finite extensions and terminal estimates already included in that lemma, so it applies to all the stated geometries. ◻
]

The source square bound pays the quadratic costs of Gaussian completion. The branch bound in Equation (6.2) also contains exponential growth in the imaginary argument. We therefore need all moments of the resulting output fields. The next lemma uses their spatial decay and the John–Nirenberg estimate to obtain the moment growth used later in Equation (6.25).

#thm([Lemma 6.8.])[
  (All moments of atom outputs).  #emph[Under the hypotheses of Lemma 54, let $v \( x \) = sum_r b_r \( x \) D_r I_r \( x \)$, where at each output point the coefficients $b_r \( x \)$ have uniformly bounded magnitude and total variation in scale. They need not have spatial regularity. Then 
#[#set math.equation(numbering: n => "(6.15)")
 $ sum_x \| v \( x \) \|^p lt.eq n_a \( C p \)^p \, #h(2em) p gt.eq 2 . $ <xyh:atom-moments>]

 The sum is over the physical lattice, or over one period in a periodic extension, with the fixed reflection multiplicity absorbed into $C$. The constants are uniform in depth and shell grouping.]
] <xyh:moment-bound>

#proof[
  First omit the output coefficients and write $f = sum_alpha f_alpha$ for the full output. Keep the allowed atom-dependent input coefficients. Testing a binary covariance derivative kernel at $r gt.eq max \( h_alpha \, u \)$ against its atom gives $C h_alpha r^(- 2 - j)$ for $j = 0 \, 1$. For scalar atoms subtract a kernel constant before testing; for edge atoms the second covariance derivative and edge normalization give exactly the same bound. The high derivative bounds in Equation (6.10) are absorbed by the test weights, using $K_0$ as fixed above. The kernel vanishes unless its range reaches the atom box. Summing over binary pieces, and using the uniform bound on the input coefficients, yields
  #[#set math.equation(numbering: n => "(6.16)")
   $ \| nabla^j f_alpha^(gt.eq u) \( x \) \| lt.eq frac(C h_alpha, \( h_alpha + u + "dist" \( x \, B_alpha \) \)^(2 + j)) \, #h(2em) j = 0 \, 1 . $ <xyh:single-atom-tail>]
  The terminal piece satisfies the same estimate at box scale.
  Let $Q$ have side $u gt.eq 1$. Call an atom near if $h_alpha lt.eq C_0 u$ and its birth box is within $C_0 u$ of $Q$; all others are far. Choose $C_0$ greater than the range and cone constants. The number of near atoms at size $h$ is at most $C \( u \/ h \)^2$, and their total number is at most $C u^2$. Lemma 54, applied just to this subfamily and then to the full output operator, gives
  $ frac(1, \| Q \|) sum_Q \| f_(upright("near")) \| lt.eq C . $
  Equation (6.16) bounds their tail from $u$ pointwise on $Q$ by
  $ sum_(alpha med upright("near")) frac(C h_alpha, \( h_alpha + u \)^2) lt.eq C sum_(h lt.eq C_0 u\
h med upright("dyadic")) h^(- 1) lt.eq C . $
  On $Q$ the full output of each far atom equals its tail from $u$: its birth size is larger, or finite range excludes all smaller pieces. The variation of all far outputs across $Q$ is at most
  $ C sum_alpha frac(u h_alpha, \( u + h_alpha + "dist" \( Q \, B_alpha \) \)^3) lt.eq C sum_(h med upright("dyadic")) frac(u, h \( u + h \)) lt.eq C . $
  For the middle bound, bounded overlap at size $h$ compares the spatial sum with $h^(- 2)$ times the integral of the kernel; that integral is $O \( \( u + h \)^(- 1) \)$. Small sizes contribute $C sum_(h lt.eq u) h^(- 1)$ and large ones $C sum_(h > u) u h^(- 2)$, both bounded. It follows that
  $ frac(1, \| Q \|) sum_Q \| f - f_Q \| lt.eq C \, #h(2em) \| f^(gt.eq u) \( y \) - f_Q \| lt.eq C quad \( y in Q \) . $
  In particular $f$ has uniformly bounded BMO norm and, with a fixed enlargement of $Q$ for the cone,
  $ T_(*) I := sup_u sup_(\| y - x \| lt.eq A u) \| f^(gt.eq u) \( y \) \| lt.eq C M \( \| f \| \) + C . $
  The same kernel estimates bound unit-scale neighbor differences. Thus the piecewise-constant extension has bounded ordinary cube BMO norm, including cubes smaller than a lattice cell.
  Here is the needed exponential BMO estimate, in the form of the John–Nirenberg Inequality #cite(label("JohnNirenberg1961")). In a cube $Q$, stop on maximal dyadic subcubes where the average of $\| f - f_Q \|$ exceeds twice the uniform BMO bound. Their total volume is at most $\| Q \| \/ 2$. Their averages differ from $f_Q$ by a fixed multiple of that bound, because their parents did not stop. Repeat inside each selected cube with its own average. After $k$ generations the selected union has volume at most $2^(- k) \| Q \|$; outside it, $\| f - f_Q \| lt.eq C \( k + 1 \)$. Consequently
  $ \| { x in Q : \| f \( x \) - f_Q \| > t } \| lt.eq C \| Q \| e^(- c t) . $
  This argument applies componentwise to real and imaginary parts.
  Select maximal averaging cubes of $\| f \|$ above a sufficiently large fixed level. By Lemma 54 and the square maximal inequality their total volume is $O \( n_a \)$. The averages on these cubes are uniformly bounded, since their parents are below the chosen level. Outside their union $\| f \|$ is below that level. Applying the preceding exponential estimate on the selected cubes therefore gives
  $ \| { x : \| f \( x \) \| > t } \| lt.eq C n_a e^(- c t) \, #h(2em) t gt.eq C . $
  Below this fixed level use $parallel f parallel_2^2 lt.eq C n_a$ instead. Layer-cake integration gives
  $ sum_x \| f \( x \) \|^p lt.eq n_a \( C p \)^p \, #h(2em) p gt.eq 2 . $
  For completeness the $L^p$ maximal bounds used here need no endpoint hypothesis: the cube covering inequality applied to $\| f \| 1_({ \| f \| > t \/ 2 })$ bounds $\| { M \| f \| > t } \|$ by $C t^(- 1) sum_(\| f \| > t \/ 2) \| f \|$; integration gives a constant uniformly bounded in operator norm for $p gt.eq 2$.
  The additive constant in the comparison of $T_(*) I$ with $M \( \| f \| \)$ is not summed over the whole plane. On ${ T_(*) I lt.eq C_1 }$ use $\( T_(*) I \)^p lt.eq C_1^(p - 2) \( T_(*) I \)^2$ and the separate square bound in Lemma 54. On its complement choose $C_1$ large enough that $T_(*) I lt.eq C M \( \| f \| \)$ and use the $L^p$ maximal inequality. This proves $sum_x \( T_(*) I \)^p lt.eq n_a \( C p \)^p$. Finally Abel summation at each output point bounds the requested weighted output by $C T_(*) I$, proving Equation (6.15).
  In finite reflected or periodic geometries, perform the argument on the prescribed extensions and count volume per period. Bounded overlap implies that the number of atoms per period is at most a constant times its volume; the square estimate therefore bounds the whole-period average by a fixed constant. Choose the stopping level above it. All stopping cubes then have the stated parent bound, and the same proof gives the required exponential tail with prefactor $C n_a$. The final box-scale remainder is included in Equation (6.16); harmonic constants, if present, have no variation and obey their square bound. Thus neither the finite endpoint nor reflection changes any constant in the conclusion. ◻
]

=== 6.4 The precise class of generated histories <the-precise-class-of-generated-histories>

We now specify the expansion records described above. The point of the rules is to ensure that repeated local operations preserve the support separation and bounded overlap required by the atom estimates. They also determine which microscopic charges remain coupled to future Gaussian fields, information needed for the separate charge budget.

Use the connected-activity algebra of Proposition 33 with field $z = \( w \, psi \)$. Shift sectors refer to uniform translations of $psi$ with $w$ fixed, and evenness to simultaneous negation. For an $m$-block $B$ write

#[#set math.equation(numbering: n => "(6.17)")
 $ cal(E)_B \( t \) = 1 / 2 sum_e upright("wt")_B \( e \) { t_11 w_e^2 + 2 i t_12 w_e \( partial psi \)_e + t_22 \( partial psi \)_e^2 } \, $ <xyh:tensor>]

where the endpoint weights assign half of each incident edge to its block. A tensor primitive is this polynomial with an already determined numerical coefficient. Its Gaussian expectation is the same polynomial plus a constant; assign the whole polynomial to the coarse singleton and only the contracted numerical constant to the scalar normalizer. The background translate of a gradient polynomial is never part of that normalizer.

On a small bulk support the neutral even remainder is localized by its constant and quadratic Taylor coefficients. Evaluate the Hessian on scalar affine directions with slopes $m^(- 1)$ and on constant oriented edge directions of size $m^(- 1)$. Contract with $\( m w \( v \) \, m nabla psi \( v \) \)$, average the choices of signed orientation, and then average the anchors in the fine blocks. This is an exact prescription. Translation and square symmetries make the summed coefficients a tensor of the form Equation (6.17). Complex conjugation on real fields changes $psi$ to $- psi$, so its three parameters are real. At an even wall subtract the neutral constant; at a defect subtract the neutral constant without an evenness assumption. Good-class copies use the same prescriptions on neighborhoods where the kernels agree. Local source translations act on both fields according to Equation (6.7) and on a local lift for the scalar.

At the microscopic start expand by selecting nonzero vertex charges, edge factors $F_b$, and quadratic factors $e^(U_e) - 1$. Use the exact identity

#[#set math.equation(numbering: n => "(6.18)")
 $ e^(U_e) - 1 = U_e + integral_0^1 \( 1 - tau \) U_e^2 e^(tau U_e) thin d tau . $ <xyh:quadratic-remainder>]

Both endpoints belong to an edge factor’s support. After the first independent piece and temporary grouping, relocate the complete linear $U_e$ expectation with half endpoint weights, keeping its original exclusion. Its contraction is a designated scalar independent of the source offsets; the remaining shifted polynomial is retained as a polynomial. The initial bulk tensor is $t_0 = \( s_11 \, s_12 \, s_22 \)$.

#prodef([Definition 6.9.])[
  (A selected history).  First truncate the microscopic charge indices and use strict compensation as in Proposition 50. Expand every finite sum, Taylor integral, Fourier direction choice, vertex/orientation average, and Cauchy contour, and fix one term. Cut its dependency graph at every scalar coefficient evaluation. The resulting record is a rooted forest of separately completed Gaussian roots and at most one live Gaussian root. The forest is understood by occurrences: if the same evaluated coefficient is used twice, its completed calculation has two separate copies when displayed. A live root is a maximal Gaussian calculation not yet completed to a scalar. Its shell variables and any future field pieces are represented on one coupled ambient stack. Its events stay in that root until completion, even if a current attenuation becomes zero. A completed root has already been evaluated to a number and is never put on that stack again. The leaves of a live root are selected microscopic factors, new polynomial primitives, and opaque occurrences of previously completed numerical coefficients. Its internal vertices are the following operations:
  + A convolution of a compatible family of fine components with one shell, followed by temporary reblocking. A term with two or more inputs has no Taylor interpolation at that step.
  + A small linear, single-input localization remainder. Its integral Taylor formula evaluates its one child at $rho z$, $0 lt.eq rho lt.eq 1$, with the same real $rho$ in both fields. Each Taylor direction is first expanded using Lemma 52; its atom value is kept as a separate factor and its normalized child direction is fixed before Cauchy differentiation.
  + A scalar coefficient calculation, which completes its child root. An assigned constant or polynomial then uses an opaque occurrence of that evaluated number as a coefficient. The polynomial’s new linear factors start in the new live root and have no microscopic leaves or atoms of the completed root attached to them.
  + A product of distinct temporary objects obeying their original exclusions, regrouped by final connectivity, or a product with scalar normalizer decorations. Splitting off a free singleton tensor is a choice of a summand, not a duplication of its previous history.
  A leaf is called live if its dependence on future Gaussian fields remains in the selected term. The numbers $N_h \, n_F \, n_(upright("ch"))$ and the list of original charges of a root refer only to that root. Here $N_h$ counts its microscopic leaves and actual polynomial, Taylor, and probe events; fixed-degree contour representations add a bounded number of events per operation. A product that joins live components joins them into one live root, using the common-stack construction below. A product with an opaque coefficient occurrence adds no live Gaussian coordinate or atom.
  The coefficient dependencies are acyclic because a coefficient is used only after its evaluation. Completed numbers may be combined numerically before a new primitive is formed; this uses the resulting number and does not revive any of their Gaussian roots. If a completed coefficient $a$ is used $m$ times, there are $m$ opaque occurrences. Expanding those occurrences for bookkeeping gives $m$ separately completed copies, not one coupled root. In particular an inverse-normalizer term $a^m$ has the product of $m$ completed-root bounds. Every overlap, source-square, and charge-payment assertion below is per live root; after final evaluation it applies to each completed root separately. The weight for the full forest is their recursive product, as specified in Proposition 62.
] <xyh:history-definition>

Cauchy’s formula here is an identity for a derivative of one shifted copy of its child, not a product of copies. For example, after writing $z = sum_ell c_ell A_ell \( z \) u_ell$ on the needed region, a Taylor argument contributes $c_ell A_ell \( z \)$ and $D_(u_ell) H \( rho z \)$ in a selected term. Only the fixed $u_ell$ enters the Cauchy shift of $H$. An atom factor can itself be written as the contour derivative of $e^(t A_ell \( z \))$ on a fixed circle. A later Taylor operation applies the same rule to the resulting product. Consequently it adds deterministic probes and real attenuations; it never multiplies an original charge by a complex interpolation parameter. An original phase charge on a Gaussian field remains real.

Figure 4 separates three operations and records what happens to their live microscopic ancestry.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (5.08, 5.55), fill: rgb("#fafafa"), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  rect((5.36, 0), (10.44, 5.55), fill: rgb("#fafafa"), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  rect((10.72, 0), (15.8, 5.55), fill: rgb("#fafafa"), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((2.54, 5.27), [#text(size: 8pt)[\(a\) Single-input Taylor]])
  content((2.54, 4.45), [#box(width: 4.562cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$c_ ell A_ ell (z)#h(0.1667em) D_(u_ ell )H( rho z)$#linebreak() new atom $A_ ell (z)$#linebreak() or its contour probe]]])])
  content((2.54, 1.16), [#box(width: 4.282cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[one live child $H(z)$#linebreak() microscopic leaves on $X$]]])])
  line((2.54, 1.62), (2.54, 3.823), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  content((2.54, 2.721), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$rho z=( rho w, rho psi )$#linebreak() same real $rho in [0,1]$ in both fields]]])])
  content((2.54, 0.3), [#box(width: 4.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Cauchy: $H( rho z+t u_ ell )$ once.#linebreak()Support: $X subset.eq X'$.]]])])
  content((7.9, 5.27), [#text(size: 8pt)[\(b\) Two-input merger]])
  content((7.9, 4.45), [#box(width: 4.282cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[merged live history#linebreak() support $X'$]]])])
  content((7.9, 2.81), [#box(width: 4.282cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[one shared current shell#linebreak() convolution#linebreak() temporary reblocking#linebreak() no Taylor at this vertex]]])])
  content((6.68, 1.12), [#box(width: 1.892cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_1$#linebreak() on $X_1$]]])])
  content((9.12, 1.12), [#box(width: 1.892cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_2$#linebreak() on $X_2$]]])])
  line((6.68, 1.529), (7.089, 2.189), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  line((9.12, 1.529), (8.711, 2.189), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  line((7.9, 3.431), (7.9, 4.034), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  content((7.9, 0.57), [#text(size: 8pt)[compatible inputs]])
  content((7.9, 0.2), [#text(size: 8pt)[$X_1 union X_2 subset.eq X'$]])
  content((13.26, 5.27), [#text(size: 8pt)[\(c\) Coefficient detachment]])
  content((13.26, 4.45), [#box(width: 4.562cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[new polynomial primitive#linebreak() $"aL"_1(z)L_2(z)$#linebreak() fresh linear factors $L_1,L_2$]]])])
  content((13.26, 2.74), [#box(width: 4.002cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[scalar evaluation: $a$#linebreak() old child history ends]]])])
  content((13.26, 1.16), [#box(width: 4.282cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[old child $H_( upright(o) "ld")$#linebreak() microscopic leaves#linebreak() and older atoms]]])])
  line((13.26, 1.734), (13.26, 2.288), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  line((13.26, 3.192), (13.26, 3.819), stroke: (paint: rgb("#4d4d4d"), thickness: 0.55pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.1411cm, fill: rgb("#4d4d4d"))))
  content((13.26, 3.506), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 7pt)[number only]]])], anchor: "west")
  content((13.26, 0.25), [#box(width: 4.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[No old leaves attached to $L_1,L_2$.]]])])
})],
  caption: [Figure 4: Selected history operations from Definition 56 and Lemma 57. These are separate schematic rules; panel (a) shows one selected Taylor direction factor. Solid arrows carry live field dependence up to its termination; the dashed arrow carries only an evaluated number. Live microscopic supports only enlarge or unite, Cauchy differentiation uses one shifted child, and detachment ends the old microscopic and atom ancestry before new polynomial factors are formed. ],
) <xyh:history-figure>

#thm([Lemma 6.10.])[
  (Supports, collars, and overlap).  #emph[Each live Gaussian root of Definition 56 has the following uniform properties. They also apply when that root is completed. No assertion combines atom boxes or source squares of distinct completed roots in the same forest.]
  + #emph[A support carrying microscopic leaves or atoms of the live root never shrinks: it is replaced only by coarse closure or a union. No selected microscopic factor of the same type occurs twice in one live root.]
  + #emph[All fields in the live root can be represented on one ambient stack of shell coordinates. Individual atom representations require a fixed collar, whose width in current block units is bounded independently of depth and $L$.]
  + #emph[Atom boxes have bounded overlap at each birth scale, uniformly in $L$ and history depth. The same holds for the fine-scale probe boxes of one step.]
  + #emph[If a Taylor operation after the shell ending at $S$ changes the attenuation on one group of live microscopic leaves, then groups having different relative changes have zero cross entries in the restricted white tail $E_(gt.eq S)$.]
  #emph[All assertions apply to an early-stopped root, reflected grids, and the auxiliary torus.]
] <xyh:history>

#proof[
  Initially each selected vertex factor appears once at its vertex, and each selected edge factor of a specified type appears once and contains its two endpoints. Convolution takes closures, a residual keeps the full temporary support, and products take unions. The only shrinking operation is coefficient detachment in Definition 56(iii), where the old Gaussian root, including its atoms, has ended. A new polynomial begins with its own support and atoms. Scalar decorations introduce no field, and choosing a summand or one contour derivative does not copy a microscopic factor. This proves (a) inductively within each root. A tilt factor and an $F_b$ factor may use the same physical edge; the no-repetition assertion is separate for each type, as required below.
  For (d), fix a Taylor change at scale $S$. Its child is a single input, so all live leaves in that child receive the same relative factor. For any other leaf with a different factor, follow the branches to their first product ancestor. If that product is formed at this regrouping, they were distinct temporary objects and their original supports have distance greater than $r_0 S$. If it occurs later, the two unshrunk ancestors are distinct compatible fine components, or distinct temporary objects at that later step. Their distance is therefore greater than the corresponding fixed radius times a scale at least $S$. There is no case of differently changed live branches inside the same temporary Taylor input: that input was linear. By (a), later closure cannot have hidden an earlier nearby leaf. Choose $r_0$ larger than the range constant in Equation (6.11). Its white tail then has the asserted zero cross blocks. Unchanged leaves count as a group with relative multiplier one.
  Here is the collar induction needed for (b). If a newly emitted atom uses $c_0$ birth-block widths and all inherited dependence uses $c_(*)$ old-block widths, the new dependence is contained in $c_0 + c_(*) \/ L + c_(upright("st"))$ current-block widths, with a fixed stencil allowance $c_(upright("st"))$. Fix $c_(*) = 2 \( c_0 + c_(upright("st")) \) + 1$; the required induction inequality then holds for every $L gt.eq 2$. Let $c_(upright("ker"))$ bound the relevant kernel range in current block units. The small-closure conclusion of Lemma 28 makes a support relocation at most one current block, so fix $c_(upright("move")) = 1$ for that conclusion. Choose the temporary radius $r_0 > 2 c_(*) + c_(upright("ker")) + 4$ and the compatibility radius $R > r_0 + 2 c_(upright("move")) + 4$, increasing them if necessary for earlier kernel ranges. The small-support threshold in Lemma 28 uses these fixed radii, and $L$ is then taken large enough for its small-closure conclusion. The resulting fine small-support diameter is fixed before this last choice of $L$, so the Fourier cutoff uses a fixed number of coarse blocks. These separations are the locality hypotheses used in the factorization proof of Proposition 33, with the present block collars in place of its smaller microscopic collar. Before compatible inputs meet, all their already integrated shells then have zero cross covariance, including their atom dependence. The current shell at a multiple-input convolution is shared from the outset. Before products of temporary objects, use their stronger temporary separation. Gaussian characteristic functions factor when these cross blocks vanish; Fourier uniqueness proves factorization for the finite complex Gaussian measures of the strict regularization. The limiting factorization follows after the endpoint bounds below. This proves the common-stack induction. When a finite-grid good piece is copied from the plane, only equality of the restricted covariances is needed; the chosen square roots need not be identical.
  For (c), a selected Taylor term emits only its fixed number of direction atoms at the upper birth scale, and only a single-input temporary object emits them. Distinct batches in one final history are separated at that birth scale by the same first-product-ancestor argument. In particular an upper block may contain $O \( L^2 \)$ fine inputs, but its multiple-input convolution emits no new Taylor atoms: the old atoms retain their old birth scales. A tensor is a normalized vertex/orientation sum; a selected summand contains only its two linear factors, not a pair at every vertex. The same observation applies to a localized quadratic assignment. Products of these primitives have fine compatibility or temporary separation. At a fixed scale there are only finitely many such types. If a coefficient calculation ends, its older atoms end with it and are not stacked on its newly assigned polynomial. Repeated opaque occurrences of that coefficient add no atoms to the new root; if expanded, each copy is checked on its own completed stack. At the microscopic scale the list of primitive types and polynomial degrees is fixed. This proves the bounded overlap without an $L^2$ loss. Probes have the same ancestry and a fixed number per node. Reflections, periodic distance, and the terminal harmonic piece do not alter any of these support arguments. ◻
]

For one shell introduce coordinates $x = \( x_T \, x_L \) \, y$ with inverse covariance

$ mat(delim: "(", mu I, i d_c J; i d_c J^t, s I) \, #h(2em) J y = \( 0 \, y \) \, $

and fields $w_r = B_r x_T + D_r x_L$, $psi_r = Gamma_r^(1 \/ 2) y$, $p_r = D_r y$. Use the same letter $J$ for the orthogonal embedding on the complete stack. Each microscopic leaf and each atom has attenuation one at birth; passing a Taylor node multiplies its future coupling in both fields by the same number in $\[ 0 \, 1 \]$. It may eventually terminate. Thus these scale weights have uniformly bounded variation.

#thm([Lemma 6.11.])[
  (Contraction of the attenuated stack).  #emph[Fix one live Gaussian root. On its distinct microscopic tilt edges, let $R_w x \, R_p y$ be the attenuated edge and gradient totals. On the distinct $F_b$ edges let $R_F x$ be its edge total. Then 
#[#set math.equation(numbering: n => "(6.19)")
 $ parallel R_w parallel lt.eq 1 \, #h(2em) parallel R_p parallel lt.eq 1 \, #h(2em) parallel R_F parallel lt.eq 1 \, #h(2em) R_w J = R_p . $ <xyh:contracting-maps>]

]
] <xyh:contraction>

#proof[
  Restrict the white kernels to the distinct edges under consideration and write $A_r$ for their diagonal attenuations. The row covariance is $sum_r A_r E_r A_r$. If the history stops early, add the missing positive tail with the last attenuation. Remove changes in reverse chronological order. After all later changes have been removed, a change at $S$ leaves a tail $P Q E_(gt.eq S) Q P$, where $P$ records all earlier factors and $Q$ the new relative factors. By Lemma 57(d), the restricted tail is block diagonal between groups on which $Q$ differs. On each block $Q = q I$ with $0 lt.eq q lt.eq 1$, whence $Q E_(gt.eq S) Q prec.curly.eq E_(gt.eq S)$. Congruence by $P$ preserves this order, even when $P$ varies within a block. Removing every change leaves $sum_r E_r = I$. This proves the $R_w$ and $R_F$ bounds. Replacing $D_r D_r^(*)$ by $E_r$ proves the $R_p$ bound. Finally the same attenuation in both fields gives $R_w J = R_p$ row by row. Deterministic probe and twist backgrounds do not change these linear maps. ◻
]

=== 6.5 Finite Gaussian completion and endpoint bounds <finite-gaussian-completion-and-endpoint-bounds>

#thm([Lemma 6.12.])[
  (Mixed completion and its Cameron bound).  #emph[Fix one live Gaussian root. After incorporating its microscopic quadratic tilts, let $Theta$ be their diagonal matrix of strengths in $\[ 0 \, 1 \]$. The stacked inverse covariance has blocks 
#[#set math.equation(numbering: n => "(6.20)")
 $ mat(delim: "(", M, i H; i H^t, S_0) \, #h(2em) upright("where")\
M & = mu I - s_11 R_w^t Theta R_w \,\
H & = d_c J - s_12 R_w^t Theta R_p \,\
S_0 & = s \( I - R_p^t Theta R_p \) succ.curly.eq 0 . $ <xyh:completed-precision>]

 Its Gaussian reweighting determinant has modulus at most $e^(C N_h)$. Define 
#[#set math.equation(numbering: n => "(6.21)")
 $ D = \( S_0 + H^t M^(- 1) H \)^(- 1) \, quad C' = M^(- 1) H D \, quad V = M^(- 1) - C' D^(- 1) \( C' \)^t succ.curly.eq 0 . $ <xyh:completion-matrices>]

 Then $M \, D$ are uniformly close to the identity. A source $e^(i \( Y \, y \))$ contributes $e^(- \( Y \, D Y \) \/ 2)$, and the remaining $x$ integral is a real Gaussian with covariance $V$ evaluated at mean $C' Y$. If $I = Im Y$, the imaginary evaluation shift $i C' I$ may be replaced by $i J I$ at cost at most $e^(C parallel I parallel^2)$, leaving the remaining real Gaussian estimate unchanged.]
] <xyh:mixed>

#proof[
  Equation (6.20) follows by substituting the linear maps of Lemma 58 into the quadratic tilts. Those contraction bounds imply $M = I + O \( \| s_bullet \| \)$ and $H = J + O \( \| s_bullet \| \)$, while $0 prec.curly.eq S_0 prec.curly.eq s I$. The Schur complement is therefore positive and close to $I$. The perturbation of the untilted inverse covariance has rank at most a fixed multiple of the number of tilt leaves. The untilted covariance has bounded operator norm, including as $s arrow.b 0$; its product with the precision perturbation is small in operator norm. Thus the determinant ratio is a product of at most $C N_h$ numbers of modulus in a fixed neighborhood of one. This proves its bound independently of the number of unused Gaussian coordinates.
  For $S_0 > 0$, integration in $y$ or direct block inversion gives covariance
  $ mat(delim: "(", V, - i C'; - i \( C' \)^t, D) . $
  Its characteristic function with a $y$ source proves the asserted mean and exponential factor. Positivity of $V$ is the Schur-complement identity $V^(- 1) = M + H S_0^(- 1) H^t$; limits prove the positive semidefinite case.
  Let $A = I - R_p^t Theta R_p$, $Delta = C' - J$. Using $R_w J = R_p$ gives
  $ H^t Delta & = \( I - S_0 D \) - \( d_c I - s_12 R_p^t Theta R_p \)\
 & = - A \( s D + s_12 I \) . $
  For nonsingular $A$ and $s > 0$ the Cameron square satisfies
  $ Delta^t V^(- 1) Delta = Delta^t M Delta + \( s D + s_12 I \)^t A \( s D + s_12 I \) \/ s prec.curly.eq C I \, $
  since $s_12^2 \/ s lt.eq d_(*)^(- 1)$. The same inequality holds on the supported space by approximation when $A$ is singular. At $s = 0$ one has $s_12 = 0$ and $H^t Delta = 0$, which is exactly the required range condition for the possibly singular $V$.
  Translate the real Gaussian variable by $i Delta I$. Its density changes by a phase of modulus one and the factor $exp \( parallel Delta I parallel_(V^(- 1))^2 \/ 2 \) lt.eq e^(C parallel I parallel^2)$. The remaining evaluation shift is $i J I$. The entire-function translation is justified first with positive covariance and strict compensation by Equation (6.2), then by the same Gaussian majorant on the supported limiting space. Linear $x$-source factors can be left in the integrand during this translation; their extra deterministic factor is bounded by Cauchy–Schwarz using their source norm. No unrestricted imaginary Gaussian is substituted into $F_b$. ◻
]

We next specify the deterministic decorations retained inside a live-root integral. A polynomial contour has fixed radius and its atom factor has the form $e^(t \[ A \( Z \) + d_A \])$, where $Z$ is its attenuated variable field. The deterministic value $d_A$ is part of this exponential. Likewise, deterministic offsets remain in the arguments of $F_b$ and of the microscopic quadratic tilts. These decorations are not structural numerical coefficients, even after the contour variables have been fixed. Only the following rules introduce them: the fixed Cauchy probes in a selected Taylor calculation; the intrinsic microscopic offsets in Equation (6.7); and one good-support transport defined below. They cannot contain an arbitrary numerical multiplier.

Every retained event of a live root carries at most one physical source decoration. Each root also has a tag state. The unmarked construction omits the physical-source record, so its roots start untagged. A present intrinsic physical-source record tags its root at birth even when all its numerical offsets vanish. A good-support transport is defined only on an untagged root and makes it tagged. The empty root stays untagged. A representation is untagged when every selected live root is untagged. A product root is tagged if any input root is tagged, and Taylor operations never clear that state, even when a current attenuation becomes zero. The transport leaves every opaque completed coefficient occurrence untouched. Subsequent convolution and Taylor operations carry existing physical decorations without applying that transport again; new Taylor atoms are outside the differentiated child and do not receive its same-step probe. Completion ends all the root’s decorations and its tag state. A new polynomial primitive with a completed numerical coefficient starts with new atoms and its own untagged state.

For the early class there is a fixed constant $C_(upright("tag"))$ such that the total deterministic offset at each selected microscopic edge and $\| d_A \|$ at each atom are at most $C_(upright("tag"))$. Physical scalar phase decorations are real, so their exponentials have modulus one. The constant is uniform for at most two signed sources, and for the early part of each fixed separated source configuration specified below. This class also includes the accumulated Cauchy probe decorations. Their uniform bound follows directly from the birth normalization. If $A$ was born at $h$ and $u$ is a later normalized probe at scale $m gt.eq h$, then

$ \| A \( u \) \| lt.eq C h \/ m . $

For scalar atoms subtract the probe’s anchor value and use constant annihilation; for edge atoms use the extra factor $h$ in the test norm. There are a fixed number of probes per passing scale, and $sum_(m gt.eq h \, med m \/ h upright(" a power of ") L) h \/ m lt.eq \( 1 - L^(- 1) \)^(- 1)$. At microscopic edges the corresponding sum is bounded by $C sum_(m gt.eq 1) m^(- 1)$ over the geometric scales. Thus these rules give the asserted fixed bounds. The exception is a probe paired with an original charge phase. At a Taylor node with current charge array $k$ this contributes at most

#[#set math.equation(numbering: n => "(6.22)")
 $ exp { C h_m \( k \; X \) } . $ <xyh:phase-probe-cost>]

These factors are retained separately and paid in Lemma 61.

Here are the bounds for the physical decorations. On a good support write $Lambda = \( Lambda_w \, Lambda_psi \)$, where $Lambda_w = - i d_c eta \/ mu$ and the real local lift satisfies $partial Lambda_psi = eta$ and agrees with $theta.alt$ modulo its period. Let $A$ be an atom born at $h$, and let $cal(C)_A$ be its fixed expanded birth collar. Write $v^flat$ for the physical representative of $v$ under the prescribed wall reflections, with $v^flat = v$ on the physical grid. At every point $v in cal(C)_A$, the high-order source bound is

$ \| nabla^j eta \( v \) \| lt.eq C e^(C_0 \( j + 1 \)^2) b^(- 1 \/ 2) sum_i \( 1 + "dist" \( v^flat \, x_i \) \)^(- 1 - j) . $

This is a pointwise bound on the collar; it does not choose one source as nearest throughout that collar. Put $d_i \( A \) = inf_(v in cal(C)_A) "dist" \( v^flat \, x_i \)$. When the collar has good clearance, the test normalization and the bound just displayed give

$ \| A \( Lambda \) \| lt.eq C b^(- 1 \/ 2) sum_i frac(h, 1 + d_i \( A \)) . $

For a scalar atom, its zeroth order is a path of length $C h$ times the gradient bound; its order-$j$ contribution from source $i$ is bounded by $C b^(- 1 \/ 2) e^(- \( K_0 - C_0 \) j^2) \( h \/ \( 1 + d_i \( A \) \) \)^j$. For an edge atom the same calculation uses $h^(j + 1) nabla^j eta$. The good clearance bounds $h \/ \( 1 + d_i \( A \) \)$ by a fixed constant, so the higher orders are absorbed by the test weights. In particular, suppose the current support has clearance $H m$ and its inherited collars extend at most $c_(upright("col")) m$ from its hull, with $H > c_(upright("col"))$. Then $d_i \( A \) gt.eq \( H - c_(upright("col")) \) m$. For one or two sources the bound for an old atom of birth size $h lt.eq m$ is therefore $C h \/ m$.

For $k_(upright("src"))$ sources at mutual distance at least $epsilon.alt M_(upright("box"))$, call an atom early when its own birth size obeys

#[#set math.equation(numbering: n => "(6.23)")
 $ L h lt.eq c epsilon.alt M_(upright("box")) \/ \( 1 + k_(upright("src")) \) . $ <xyh:early-source-scales>]

Choose $c$ so the birth collar has diameter less than $epsilon.alt M_(upright("box")) \/ 4$. At each folded point of that collar at most one source is within $epsilon.alt M_(upright("box")) \/ 3$; the identity of that source may vary with the point. Good clearance bounds its contribution by $C$, and the other sources contribute at most $C k_(upright("src")) h \/ \( epsilon.alt M_(upright("box")) \)$. Taking the pointwise supremum therefore gives

$ \| A \( Lambda \) \| lt.eq C (1 + frac(k_(upright("src")) h, epsilon.alt M_(upright("box")))) lt.eq C $

for every early atom. This still applies if its first transport occurs on a later good support, because it tests the lift on $cal(C)_A$. At a microscopic edge the same pointwise argument uses $\( 1 + "dist" \( v^flat \, x_i \) \)^(- 1) lt.eq 1$ for the possible near source. It gives a uniform intrinsic offset for at most two sources at every volume and for each fixed separated configuration in all sufficiently large volumes. No local scalar lift is imposed in a defect core; its intrinsic scalar phases remain real.

For clarity, transport acts on a selected untagged live root by substituting $z + Lambda$ for its current field argument, and acts as the identity on an empty root. Call it an admissible early transport when every induced offset satisfies the fixed early bounds above; in the separated-source case this is invoked only when all its atom birth sizes are early. Write an old atom’s factor as $e^(t \[ A \( Z_(<) + tau_A z \) + d_A \])$, where $Z_(<)$ contains its earlier shell fields and $tau_A in \[ 0 \, 1 \]$ is its current coupling. The factor becomes

$ e^(t \[ A \( Z_(<) + tau_A z \) + d_A + tau_A A \( Lambda \) \]) . $

The new bounded term stays in the decorated endpoint integrand. It is not factored into the structural numerical coefficient. The analogous rule adds the attenuated physical offsets at original microscopic leaves and a real phase at original charges. A later defect Taylor substitution $z mapsto rho z + t' u$ changes this atom factor to $e^(t \[ A \( Z_(<) + tau_A rho z \) + d_A + tau_A A \( Lambda \) + tau_A t' A \( u \) \])$. The physical tag stays fixed, the future coupling is multiplied by the real $rho$, and the new probe increment is covered by the summable $h \/ m$ bound above. This proves closure of the early decoration class under subsequent local operations.

The remaining birth sizes satisfy $h > c epsilon.alt M_(upright("box")) \/ \[ L \( 1 + k_(upright("src")) \) \]$. In a finite box, bounded overlap gives at most $C \( M_(upright("box")) \/ h \)^2$ atoms of each such size in one live root, including the fixed reflection multiplicity. There are only $O_(k_(upright("src")) \, epsilon.alt) \( 1 \)$ such scales. Hence their total number is at most $C_(k_(upright("src")) \, epsilon.alt \, L)$, independently of the earlier depth. Good clearance still gives $\| A \( Lambda \) \| lt.eq C k_(upright("src"))$ for each such event. For these late events only, factor the possibly large deterministic term $e^(t tau_A A \( Lambda \))$ into an explicitly recorded late numerical factor. The variable source remains $t A \( Z \)$ with the original fixed contour radius. The product of the late factors is bounded by a constant depending on the fixed configuration per live root. It does not change any earlier event weight. Opaque completed coefficients are not transported, and no singular lift is imposed on a new defect-core tensor.

Finally a fixed-radius polynomial contour produces a bounded linear Gaussian atom. Within one live root Lemma 57 supplies the overlap hypothesis of Lemma 54, so all their source squares sum to at most $C N_h$. Completing a decorated microscopic tilt produces sources $R_w^t Theta a$ or $R_p^t Theta a$ with bounded coefficients at each selected edge. Lemma 58 gives the same square bound, or these sources may be regarded as edge atoms born at size one. The deterministic early atom decorations have modulus at most $e^(C N_h)$ after all fixed-radius contours, while physical phase decorations have modulus one. These are uniform endpoint bounds for the specified decoration class, not changes of its structural coefficients.

#thm([Lemma 6.13.])[
  (Estimate for an evaluated history).  #emph[Fix one live Gaussian root with an admissible early decoration record as defined above. Let $n_F$ be its number of original $F_b$ leaves, and let $Y_o$ be its real original charge source on its shell stack. Keep all admissible early decorations inside the endpoint integral. Omit only its structural numerical coefficient, its opaque completed coefficient occurrences, its explicitly extracted late numerical factors, and the phase-probe factors in Equation (6.22). Then the resulting fully evaluated integral $cal(I)_h^(\( 0 \))$ obeys 
#[#set math.equation(numbering: n => "(6.24)")
 $ \| cal(I)_h^(\( 0 \)) \| lt.eq b^(- n_F) exp { C N_h - c parallel Y_o parallel^2 } . $ <xyh:endpoint-bound>]

 The same bound holds for normalized fixed-order directional derivatives, with their bounded number of contour events included in $N_h$. Constants are uniform over the admissible early decoration class, strict regularizations, the permitted small parameters, depth, and domain. The omitted late numerical factors have the separate fixed-configuration bound proved after Equation (6.23). Each other completed root in the forest satisfies its own copy of this estimate.]
] <xyh:endpoint-estimate>

#proof[
  The fixed-radius atom contours and the bound $\| d_A \| lt.eq C_(upright("tag"))$ give $product_A \| e^(t_A d_A) \| lt.eq e^(C N_h)$ within this endpoint integral. Physical scalar phases have modulus one. The decorated microscopic edge offsets are uniformly bounded. These facts use exactly the admissible decoration rules and do not move any early factor into the structural coefficient.
  On a shell acting on current phase charges $k$, the original source is $Gamma_r^(1 \/ 2) k$ in the $y$ coordinates. It is real because all previous charge attenuations were real. Write $Y = Y_o + Y_a$; the preceding source estimates give $parallel Y_a parallel^2 lt.eq C N_h$, and every linear $x$ source has the same bound. Lemma 59 reduces the imaginary evaluations at $F_b$ leaves to the attenuated outputs of $J I$, $I = Im Y_a$, together with bounded deterministic offsets. By Lemma 55, their values $v_e$ obey $sum_e \| v_e \|^p lt.eq N_h \( C p \)^p$, $p gt.eq 2$. Consequently
  #[#set math.equation(numbering: n => "(6.25)")
   $ sum_e \| v_e \|^2 e^(\| v_e \| \/ sqrt(b)) & lt.eq N_h sum_(k gt.eq 0) frac(C^(k + 2) \( k + 2 \)^(k + 2), k ! thin b^(k \/ 2)) lt.eq C N_h $ <xyh:imaginary-payment>]
  for all sufficiently large fixed $b$. The ratio $\( k + 2 \)^(k + 2) \/ k !$ is bounded by an exponential in $k$ times a fixed polynomial, so the displayed series converges. Bounded offsets add at most $C$ per leaf. Thus the imaginary growth term in Equation (6.2) costs $e^(C N_h)$.
  Choose $kappa_1$ strictly between $kappa_0$ and $1 \/ 2$. Small parameter size and Lemma 58 give a fixed $nu > 0$ such that
  #[#set math.equation(numbering: n => "(6.26)")
   $ 2 kappa_1 R_F { V + C' D^(- 1) \( C' \)^t } R_F^t = 2 kappa_1 R_F M^(- 1) R_F^t prec.curly.eq \( 1 - nu \) I . $ <xyh:gaussian-slack>]
  For a real Gaussian $xi$ of covariance $Sigma = R_F V R_F^t$, completing the square in $bb(E) e^(kappa_1 parallel xi + R_F C' Y_o parallel^2)$ gives determinant $det \( I - 2 kappa_1 Sigma \)^(- 1 \/ 2)$, at most $e^(C n_F)$. Its shifted-mean exponent is $kappa_1 chevron.l R_F C' Y_o \, \( I - 2 kappa_1 Sigma \)^(- 1) R_F C' Y_o chevron.r$. Equation (6.26), or its Schur complement, bounds this by $\( 1 - nu \) \( Y_o \, D Y_o \) \/ 2$ after decreasing $nu$ if necessary. It therefore leaves a fixed part of the charge exponential $e^(- \( Y_o \, D Y_o \) \/ 2)$ unspent.
  Means from $Y_a$ and deterministic offsets have square $O \( N_h \)$ on the evaluation edges. The difference $kappa_1 - kappa_0$ absorbs them with $e^(C N_h)$, using $2 \| u v \| lt.eq delta u^2 + delta^(- 1) v^2$. The same inequality absorbs cross terms in $- Re \( Y \, D Y \) \/ 2$, and linear real Gaussian sources, with an arbitrarily small additional fraction of the retained charge square. Their source squares are $O \( N_h \)$; Gaussian integration or a small Hölder enlargement gives $e^(C N_h)$. Since $D$ is uniformly positive, the remaining suppression is $e^(- c parallel Y_o parallel^2)$. Each branch factor contributes the separate $b^(- 1)$ in Equation (6.2). Polynomial derivatives use their fixed circles and add only a bounded number of source atoms. This proves Equation (6.24) in strict regularization, with all constants independent of that regularization. ◻
]

=== 6.6 Charge budgets and a composable positive size <charge-budgets-and-a-composable-positive-size>

#thm([Lemma 6.14.])[
  (Simultaneous charge payment).  #emph[There are fixed choices of sufficiently large $L \, b_0$ and a constant $c' > 0$ such that all phase-probe costs in one generated live root, a specified bounded final smooth-test cost, and a factor $L^(- 4)$ at every small charged linear step can be included simultaneously in Equation (6.24). Writing $cal(I)_h$ for the integral with those phase-probe factors restored, this leaves 
#[#set math.equation(numbering: n => "(6.27)")
 $ \| cal(I)_h \| lt.eq C^(N_h) b^(- n_F) L^(- 4 n_(upright("ch"))) exp { - c' b sum_v q_v^2 } $ <xyh:paid-bound>]

 apart from its structural numerical coefficient, opaque completed coefficient occurrences, and explicitly extracted late factors. Here $q_v$ are the original nonzero integral charge leaves of this root and $n_(upright("ch"))$ counts only its indicated single-input charged steps. The admissible early decorations remain inside the evaluated integral.]
] <xyh:budget>

#proof[
  Fix one selected live root, rather than the sum of its alternatives or the forest of its separately completed coefficient dependencies. At a charge-carrying node let $H = h_m \( k \; X \)$ be the incoming test budget. At a merger budgets add subadditively by test restriction and the triangle inequality. Reblocking without localization is nonincreasing by Equation (6.14). At a neutral Taylor node its real attenuation $rho in \[ 0 \, 1 \]$ gives
  $ H_(upright("out")) lt.eq rho \( C \/ L \) H \, #h(2em) H - H_(upright("out")) gt.eq \( 1 - C \/ L \) H . $
  Thus a fixed multiple of this decrease pays Equation (6.22). At termination the remaining budget is consumed, which also permits bounded final test directions.
  For a charged small linear node put $Q = sum k eq.not 0$, $q = \| Q \|$, $ell = log L$, and let $Gamma$ be its shell. Choose an anchor $v$ in its support. Lemma 51, summing its positive-order binary bounds, shows that $Gamma \( dot.op \, v \) - Gamma \( v \, v \)$ on the local support and collar is a fixed multiple of a fine test. Consequently
  $ d := Gamma \( v \, v \) gt.eq c_0 ell \, #h(2em) \| \( k \, Gamma e_v \) - Q d \| lt.eq C_1 H . $
  Fix $epsilon.alt = c_0 \/ \( 2 C_1 \)$ when $C_1 > 0$. If $H lt.eq epsilon.alt q ell$, positive-semidefinite Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ \( k \, Gamma k \) gt.eq frac(\| \( k \, Gamma e_v \) \|^2, d) gt.eq frac(q^2 d, 4) gt.eq c q^2 ell . $ <xyh:energy-alternative>]
  If $C_1 = 0$ this conclusion holds without a case split. Otherwise, for $H > epsilon.alt q ell$, Equation (6.14) and choices $C \/ L lt.eq 1 \/ 2$, $ell gt.eq 4 \/ epsilon.alt$ give
  #[#set math.equation(numbering: n => "(6.29)")
   $ H - H_(upright("out")) gt.eq \( 1 - C \/ L \) H - q gt.eq H \/ 4 gt.eq \( epsilon.alt \/ 4 \) q ell . $ <xyh:potential-alternative>]
  At all other nodes the first inequality in Equation (6.14) is retained; thus no negative budget decrease is hidden in this dichotomy.
  The sum of child budgets minus the parent budget is a nonnegative potential loss at every node. Summing these losses over this live root, including the final retained budget, gives at most its original leaf budget
  #[#set math.equation(numbering: n => "(6.30)")
   $ H_(upright("leaf")) lt.eq C frak(p) sum_v \| q_v \| . $ <xyh:initial-budget>]
  Only neutral total charges are multiplied by a Taylor attenuation. Mergers add totals, so every nonzero sector total remains in $frak(p) bb(Z)$, even though individual entries inside a neutral branch may cease to be integral multiples. Hence $q gt.eq frak(p)$ at every recorded charged node. A fixed potential multiplier pays both neutral probes and $4 ell$ at each node of Equation (6.29), once $b$ is large.
  The alternative using shell energy requires a separate account. At the shell of a recorded charged step, its temporary branch was a single input. Every other live charge group in the eventual combined live root is either another temporarily separated object at this step or first joins at a later product ancestor. Lemma 57(a),(d), with the scalar shell range included in the radius choice, gives zero cross-covariance between that charged branch and every other such group on this shell. Thus its scalar energy splits off exactly, with a nonnegative remaining square. Two selected branches at that shell are mutually separated as well. Different recursion levels use disjoint shell coordinates. A later Taylor attenuation changes future fields only, so it does not alter a payment on an already integrated shell. Writing $cal(E)$ for the sum of the selected energies and $E_0$ for the first-piece square, we have
  #[#set math.equation(numbering: n => "(6.31)")
   $ E_0 = gamma frak(p)^2 sum_v q_v^2 \, #h(2em) E_0 + cal(E) lt.eq parallel Y_o parallel^2 . $ <xyh:disjoint-reserves>]
  This is a separation statement about generated single-input histories; positivity alone would not allow one to split arbitrary charge squares.
  Let $c$ be the constant in Equation (6.24). Choose a fixed multiplier $D'_0$ large enough for all potential payments and the specified final normalized tests. Since $\| q_v \| lt.eq q_v^2$ for nonzero integers, increasing $b$ yields
  $ D'_0 H_(upright("leaf")) lt.eq \( c \/ 4 \) E_0 . $
  Equations (6.28) and $q gt.eq frak(p)$ similarly give $4 ell N_E lt.eq \( c \/ 4 \) cal(E)$, where $N_E$ counts the energy-paid steps. These fixed allocations use disjoint portions of Equation (6.31); a fixed positive fraction of $E_0$ and of the full source square remains. It supplies the microscopic Gaussian in Equation (6.27). Detached scalar calculations have their own completed integrals and are absent from this live source square. Reusing an evaluated scalar multiplies its established bound once per opaque occurrence; it does not reinsert any charge leaf or shell reserve. If the occurrences are expanded, apply this proof separately to each completed root and multiply the resulting bounds. No joint overlap or charge-square assertion across those roots is used. ◻
]

#thm([Proposition 6.15.])[
  (The exact XY activity calculus).  #emph[Fix the covariance construction and the local partition map above. Choose the fixed support and collar clearances, small-support threshold, and $K_0$ first; then choose sufficiently large dyadic $L$, the polymer weight as in Proposition 33, a sufficiently small parameter neighborhood, and finally sufficiently large $b$. Within Equation (6.5) the original XY integrals admit positive representation sizes with all the following properties. Write $sans(s)_X \( cal(R) \)$ for the size of a specified representation on $X$, and $parallel cal(R) parallel_A = sup_X A^(\| X \|) sans(s)_X \( cal(R) \)$.]
  + #emph[An $F_b$ leaf costs $C \/ b$; a nonzero charge $q$ costs $C e^(- c b q^2)$, summable over $q eq.not 0$; the linear microscopic compensation costs $C \| s_bullet \|$, and its nonlinear remainder costs $C \| s_bullet \|^2$. A full-block tensor costs $C \| t \|$, and a localized polynomial costs a constant times its coefficient on normalized $m$-scale directions.]
  + #emph[Convolving a compatible product multiplies its input sizes, up to a fixed factor per input. Temporary exclusions, relocation, scalar normalizer decorations, and separation into a singleton tensor and remainder are exact. The animal and placement sums obey Proposition 33; hence all multiple-input and normalizer corrections are quadratic in the input sizes.]
  + #emph[For a small single neutral linear input of size $u$, localization has normalized coefficients at most $C u$ and remainder size $C L^(- 3) u$ in the even bulk after constant and quadratic subtraction, $C L^(- 2) u$ at an even wall after constant subtraction, and $C L^(- 1) u$ at a defect after constant subtraction. Each small charged single-input step has size at most $C L^(- 4) u$. Constants in these local gains do not grow with sufficiently large $L$.]
  + #emph[Sizes bound terminated evaluations and fixed-order Cauchy derivatives with bounded smooth normalized backgrounds. In finitely many normalized source directions the evaluated expressions are jointly holomorphic on fixed bounded polydiscs, with the corresponding Cauchy bounds after adding their finitely many probe events. They apply to copied good pieces, their one-time translations to defects, and the intrinsic offsets of Equation (6.7). For fixed separated sources, the lower bound on $b$ is independent of their number; only the boundedly many late numerical event costs may depend on the fixed source configuration. If $T_Lambda$ is an admissible early transport of an untagged representation, then for any $A_U gt.eq A_D > 0$, before support relocation 
$ sans(s)_X \( T_Lambda cal(R) \) = sans(s)_X \( cal(R) \) \, #h(2em) A_D^(\| X \|) sans(s)_X \( T_Lambda cal(R) \) lt.eq \( A_D \/ A_U \)^(\| X \|) parallel cal(R) parallel_(A_U) . $

 The transport leaves every opaque completed coefficient occurrence unchanged and is not defined on an already tagged live root.]
  + #emph[Every finite-depth activity, assigned coefficient, and normalized partition identity is continuous in the permitted parameters, including at $s = d_(*) s_12^2$ and at $s = 0$, as long as its scalar normalizers are nonzero. The statement holds on the plane at finite support, on finite reflected grids, and on auxiliary tori with terminal transverse harmonic directions. The bulk tensor and its local recursion are the same in all these settings wherever the calculation has the required clearance.]
] <xyh:calculus>

#proof[
  For a specified representation write each selected term in the form
  $ c_h \( alpha \) thin ell_h \( alpha \) (product_(nu = 1)^(m_h) a_(h \, nu)) cal(I)_h \( z \; upright(bold(d))_h \, alpha \) . $
  Here $h$ is its unique live root, or the empty root with integral one. The variables $alpha$ range over the compact Taylor and contour parameter spaces with their positive product measure. The structural coefficient $c_h$ contains the displayed parameter powers, finite averaging coefficients, Fourier/Taylor direction weights, and contour kernel factors. The factor $ell_h$ is only the explicitly extracted late numerical product defined above, and equals one when there are no such events. The $a_(h \, nu)$ are opaque occurrences of previously completed coefficients. The admissible early record $upright(bold(d))_h$ and the generated phase-probe factors paid by Lemma 61 stay inside $cal(I)_h$ and are not part of $c_h$ or $ell_h$.
  Give the live root the weight
  #[#set math.equation(numbering: n => "(6.32)")
   $ W \( h \) = C_(*)^(N_h) thin b^(- n_F) exp { - c_(*) b sum_v q_v^2 } thin L^(- 4 n_(upright("ch"))) \, $ <xyh:representation-weight>]
  with $W = 1$ for the empty root. All counts and charges in this display belong only to $h$. If $a$ has a chosen completed representation, let $sans(m) \( a \)$ be the bound supplied by this same rule at its earlier evaluation, on the source domain where the size will be used. A size at one fixed source point may instead use the exact modulus $\| a \|$ there. For a uniform estimate or a later Cauchy formula on a source polydisc, $sans(m) \( a \)$ must be a completed size uniform on that polydisc, or another proved bound for the supremum of $\| a \|$ there; a modulus at one point does not suffice. Equivalently one may differentiate $a$ in its separately completed root and use that derivative’s completed size. These choices also apply when completed numbers are combined before forming a new primitive. In particular each source-independent component of the full unmarked tensor may use $sans(m) \( t_(a b \, j) \) = \| t_(a b \, j) \| lt.eq \| t_j \|_oo$ after its evaluated increments have been summed, preserving their cancellation. This choice asserts no derivative bound in the real reference parameters; only their continuity is used in (v). The acyclic coefficient dependence makes this a finite-depth recursive definition. Set
  $ sans(s)_X \( cal(R) \) = sum_h integral \| c_h \( alpha \) \| thin \| ell_h \( alpha \) \| (product_(nu = 1)^(m_h) sans(m) \( a_(h \, nu) \)) W \( h \) thin d alpha . $
  Choose $C_(*)$ sufficiently large and $c_(*) > 0$ sufficiently small from the bounds in Lemmas 60 and 61, which are uniform over the admissible early records and sufficiently large $L$. Induction over coefficient evaluations then gives $\| a \| lt.eq sans(m) \( a \)$ and makes this size a positive majorant of every endpoint forest. No arbitrary numerical factor can be hidden in the endpoint integral because its admissible records have the specified generation rules and bounds.
  The primitive bounds in (i) follow directly: polynomial contours contribute a fixed number of atoms, and Equation (6.18) has two explicit powers of $s_bullet$ and only a bounded tilt strength in its exponential. A full tensor has normalized vertex averages: each selected summand has two normalized atoms and coefficient $O \( \| t \| \)$.
  When compatible live roots are concatenated, their live leaf lists and actual event lists are disjoint. The common-stack construction joins them into one live root, while their structural and late numerical factors multiply and their lists of opaque coefficient occurrences concatenate. At the final endpoint apply Equation (6.27) once to the concatenated live root, whose geometric properties were proved in Lemma 57. Thus no fresh $C^(N_h)$ is charged each time an old root is convolved. Each opaque numerical coefficient is already bounded at its own endpoint. In particular an inverse-normalizer term $a_B^m$ has size $sans(m) \( a_B \)^m$, and its absolute series is at most $sans(m) \( a_B \) \/ \( 1 - sans(m) \( a_B \) \)$ when $sans(m) \( a_B \) < 1$. If these occurrences are expanded, they are $m$ separately completed roots and their endpoint weights multiply; no common atom-overlap estimate is applied to them. This proves the product rule. The purely spatial enumeration in Proposition 33 uses precisely these multiplicative sizes: nonlinear inputs carry at least two factors, large supports use the polymer weight gain, and the inverse scalar decorations use their absolutely convergent small scalar series. It does not require a pointwise norm at arbitrary remaining fields. This proves (ii).
  For (iii) Taylor’s integral formula of order $a$ contributes $a$ direction arguments and a fixed number of contour events. Apply the exact $C L^(- 1)$ directional decomposition of Lemma 52 to each argument before using Cauchy’s formula. This gives $C L^(- a)$ in the positive coefficient sum. The evenness assumption makes the linear term vanish when $a = 2$ or $3$. In the bulk, the quadratic Taylor term has two arguments; replacing one by its affine approximation costs $C L^(- 2)$ and the other $C L^(- 1)$, so the two-factor difference has $C L^(- 3)$. The affine polynomial itself is the assigned tensor prescription of Equation (6.17). Its normalized coefficient is a terminated history with bounded probes, hence costs $C u$ by Lemma 61. Scalar extraction is the same statement with zero Taylor arguments. The charged gain is exactly the recorded factor in Equation (6.32). Multi-input terms receive no such Taylor or charged gain, consistently with both the grammar and the quadratic counting rule.
  For (iv), apply $T_Lambda$ only to an untagged live root in the displayed representation, and as the identity to an empty root, using the same source domain and completed coefficient bounds. The transport rule changes $upright(bold(d))_h$ inside $cal(I)_h$ and leaves $c_h \, ell_h$, every $sans(m) \( a_(h \, nu) \)$, and the event list defining $W \( h \)$ unchanged. Its own-birth bound proves that the new record is admissible. The equality of representation sizes in (iv) is therefore termwise in their defining nonnegative sums, before any support relocation; multiplying by $A_D^(\| X \|)$ gives the displayed comparison with the $A_U$ norm. In particular no factor per old event is charged to a support weight. The endpoint bound for the transported integrand is available because Lemma 60 was proved uniformly over these records. This is a comparison of the same chosen representations, not merely a comparison of their endpoint values. At finite strict regularization the factor-by-factor substitution is an exact representation of the translated activity. The uniform majorants used below pass this identity to the limiting evaluated expressions on the bounded background domains used here.
  The derivative claims in (iv) follow from the derivative version of Lemma 60 and the final-test allowance in Lemma 61. A Cauchy derivative in a remaining field direction acts on $cal(I)_h$ with every opaque scalar occurrence fixed. A derivative in a source parameter on which an opaque scalar depends instead uses its uniform polydisc bound in the preceding definition, or differentiates that scalar within its separately completed root. Thus cutting a root never discards a source-parameter derivative. The summable later-probe calculation proves that a tagged root stays in the admissible class under further defect operations. At late birth sizes only the separate factor $ell_h$ changes; its bounded number of events gives a fixed-configuration factor per live root. It does not change an earlier event weight or an opaque completed coefficient size. Thus the inverse-temperature threshold remains independent of the fixed correlation order.
  Finally fix a finite calculation depth and a finite geometry. All its support choices and discrete Fourier direction decompositions are finite; compact Taylor and contour parameters can be fixed independently of a small parameter variation. Only the microscopic integral charge indices remain unbounded. Before removing regularizations, all identities are ordinary integrated identities of entire functions with strict real-density integrability: the $x$ growth is below its Gaussian threshold by Equation (6.2), the real $y$ precision is positive with strict compensation, and the mixed terms are imaginary on real coordinates except for controlled lower-degree sources. Lemma 59 proves the integrated formulas and Lemmas 60–61 give bounds uniform as compensation becomes full. At fixed geometry the completion before the Cameron estimate is also continuous: its real covariance $V$ may become singular, but positive Gaussian measures converge to the measure on its supported space, and its complex shifts are bounded for fixed contour choices. The retained real-charge Gaussian square dominates the remaining fixed-background costs, which grow only exponentially linearly in the charge magnitudes. Thus dominated convergence removes charge truncation and strict compensation at this fixed depth. The same majorants hold uniformly on each smaller source polydisc, so integrating Cauchy formulas proves holomorphy and convergence of source derivatives. It also passes real parameter continuity to the limit. Scalar division is continuous whenever its normalizer stays away from zero, as ensured in the small-activity map. Plane calculations at finite depth use an auxiliary large torus whose preterminal covariance entries agree on all required supports, so the same reasoning applies there. This proves (v) and completes the limiting justification promised in Proposition 50. ◻
]

== 7 The XY flow, admissible tuning, and spin-field limit <xyf:section>

We apply the representation calculus of Proposition 62 to the ordinary nearest-neighbor XY model. Throughout this section, $b$ denotes spin inverse temperature,

$ mu = 1 + s_11 \, #h(2em) d_c = 1 + s_12 \, #h(2em) s = s_22 \, #h(2em) s gt.eq d_(*) s_12^2 . $

The constant $d_(*) > 0$ will be chosen below. The interaction includes the compensating factor $e^(+ U \( w \, p \))$, with

$ U \( w \, p \) = 1 / 2 sum_e #scale(x: 120%, y: 120%)[\(] s_11 w_e^2 + 2 i s_12 w_e p_e + s_22 p_e^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) p = partial psi . $

The covariance prescription and the regularized interpretation at $s = s_12 = 0$ are those of Proposition 50. In particular, the prescription is not integration against a positive joint law of $\( w \, psi \)$. Positivity will be used only for the completely restored vortex/transverse ensemble of Proposition 49.

=== 7.1 The exact recurrence <the-exact-recurrence>

For a full block $B$, write

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(E)_B \( t \) = 1 / 2 sum_e upright("wt")_B \( e \) #scale(x: 120%, y: 120%)[\(] t_11 w_e^2 + 2 i t_12 w_e \( partial psi \)_e + t_22 \( partial psi \)_e^2 #scale(x: 120%, y: 120%)[\)] . $ <xyf:tensor>]

Here $upright("wt")_B$ assigns half of an edge to each endpoint in $B$. Thus the weights sum to one when the blocks partition the whole grid. The tensor norm is the maximum of the three coefficient absolute values. The size of a remainder is the supremum over its supports of $A^(\| X \|)$ times its positive representation size. Representation size means the recursive sum in Proposition 62, with each term weighted by its live-root weight and the product of its opaque completed coefficient sizes; it is not a pointwise supremum over future complex Gaussian fields.

We record precisely which parts of that proposition enter the flow. They hold uniformly in the number of integrated scales and in the finite-grid size. A microscopic $F_b$ factor has size $C \/ b$, a nonzero charge has a summable bound $e^(- c b q^2)$, and the nonlinear part of a microscopic compensation factor has size $C \| s_bullet \|^2$. A tensor singleton has size $C \| t \|$. Concatenating compatible histories multiplies their sizes, up to a fixed constant per input. On a small #emph[linear] input, neutral localization gives the following gains:

$ upright("class") & upright("subtracted polynomial") & upright("remainder gain")\
upright("bulk, even") & upright("constant and quadratic") & C L^(- 3)\
upright("wall, even") & upright("constant") & C L^(- 2)\
upright("defect") & upright("neutral constant") & C L^(- 1) . $

Every small charged linear input instead has gain $C L^(- 4)$. The extracted coefficients, in normalized fine-scale directions, are bounded by $C$ times the input size. The same history estimates bound terminal evaluations and fixed smooth-source derivatives. Finally, local identities are exact, their finite-depth values are continuous in the admissible parameters including the degenerate boundary, and their field arguments are analytic in the source neighborhoods used below.

#thm([Proposition 7.1.])[
  (Bulk recurrence).  #emph[For every sufficiently small fixed $theta > 0$, the geometric parameters, then $L$, and then $A$ can be chosen so that the exact bulk activities have the decomposition 
$ K_j \( X \) = upright(bold(1))_(X = { B }) cal(E)_B \( t_j \) + cal(P)_j \( X \) \, #h(2em) t_0 = \( s_11 \, s_12 \, s_22 \) . $

 If $r_j$ is their remainder size, then, while the quantities on the right are small, 
#[#set math.equation(numbering: n => "(7.2)")
 $ \| t_(j + 1) - t_j \|_oo & lt.eq C r_j \,\
r_(j + 1) & lt.eq theta r_j + C_(L \, A) \( \| t_j \|_oo + r_j \)^2 \,\
r_0 & lt.eq C_(L \, A) #scale(x: 120%, y: 120%)[\(] b^(- 1) + \| t_0 \|_oo^2 #scale(x: 120%, y: 120%)[\)] . $ <xyf:increment>]

 At every fixed depth these coefficients and the needed fixed field derivatives are continuous on the set where the preceding bounds are retained. The recurrence also holds, with the same bulk tensors, on an auxiliary torus of side $F L^j$, through scale $L^j$, if the fixed integer $F$ is sufficiently large.]
] <xyf:recurrence>

#proof[
  Use the temporary-component, relocation, and constant-decoration identities of Proposition 33. They are algebraic identities for local activities, used with the enlarged fixed separation radii proved in Lemma 57. Their hypotheses here are finite shell range, the retained temporary exclusions, one-step locality of assigned pieces, and multiplicative bounds for compatible inputs. Finite range follows from Lemma 51; the history construction supplies the other hypotheses, including the fact that evaluated coefficients are scalar factors and do not retain their extinct microscopic leaves.
  For completeness, the relevant counts are as follows. The maximum fine-block count $n_0$ of a small component and the connectivity radius are fixed before $L$. The number of small animals containing a specified fine block is therefore a constant. A coarse block has $O \( L^2 \)$ fine blocks, giving at most $C L^2$ small linear inputs per coarse output. Their neutral and charged contributions have total operator bound
  #[#set math.equation(numbering: n => "(7.3)")
   $ C L^2 \( L^(- 3) + L^(- 4) \) lt.eq C \/ L . $ <xyf:bulkcount>]
  In the neutral bulk quadratic remainder, replace each argument by its affine approximation. The two-factor difference is the sum of one term with the first argument replaced and one with the second replaced. The error direction has size $C \/ L^2$ and the other direction size $C \/ L$, so each term has size $C \/ L^3$. The first-order term vanishes because the full neutral projection is even under $\( w \, psi \) mapsto \( - w \, - psi \)$. This explains the gain used in (7.3) without assigning a Taylor gain to a nonlinear convolution.
  For a large input, the closure estimate leaves an exponential weight gain at least $A^(- \| X \| \/ 2)$, after the fixed per-input history cost. Taking $A$ large after $L$ makes the sum of its linear contributions as small as prescribed. To check nonlinear terms, root a compatible family at a specified output block. If it has $q$ fine components and a total of $v$ fine blocks, a depth-first traversal of the fine animals and a tree connecting their closures gives at most
  $ C^v \( C L^2 \)^(2 q) $
  choices. The long jumps of that tree have range $C L$ in fine-block units. For large components the weight gain sums these choices; the total size of the small components is at most $q n_0$. Thus all terms with $q gt.eq 2$ sum to $C_(L \, A) \( \| t_j \| + r_j \)^2$. Use a temporary output weight $4 A$ before the constant-decoration step. If $a_B$ is the assigned constant, then $\| a_B \| lt.eq C_(L \, A) \( \| t_j \| + r_j \)$ and
  $ d_B = \( 1 + a_B \)^(- 1) - 1 = - a_B + O \( a_B^2 \) . $
  Overlapping a decoration with an old occupied site costs at most two choices, paid by the extra weight. A decoration at a hole supplies a factor $\| d_B \|$. The subset sum converges when $A sup_B \| d_B \| < 1 \/ 8$. Every term containing an old component and a decoration is quadratic; pure decorations are quadratic apart from the displayed cancelling linear singleton. Relocated multiple-object terms are also quadratic, because their original temporary exclusions are retained. These counts prove the stated nonlinear bound.
  The entire expectation of a tensor singleton is assigned to the coarse singleton. Its nonconstant part is exactly the same quadratic form; its covariance contraction is a bounded constant. At any specified #emph[fine] block only a bounded number of small supports contribute quadratic coefficients, each bounded by $C r_j$. Averaging over orientation signs and anchors and summing all fine blocks in a full coarse block preserves translation and square symmetries. Hence the sum is precisely $cal(E)_B \( t_(j + 1) - t_j \)$, with coefficient bound $C r_j$. There is no factor $L^2$ in this coefficient: the sum over fine sites is the edge sum already present in (7.1). Complex conjugation combined with $psi mapsto - psi$ makes the three extracted parameters real. This proves (7.2) and (7.2).
  At the first independent piece, the linear compensation factors give the stated tensor and their designated covariance constants. The remaining single primitives cost $C \/ b$, $sum_(q eq.not 0) e^(- c b q^2)$, or $C \| t_0 \|^2$. Each edge has two endpoints and only finitely many choices of primitive type. The same animal and decoration counts therefore give (7.2).
  All these identities may first be performed with a finite Fourier cutoff and strict covariance regularization. At a fixed depth there are finitely many geometric choices for each coefficient. The charge sums retain Gaussian domination; the contour and Taylor parameters range over compact sets. The completed finite-dimensional integrals are continuous, including singular real Gaussian covariances, and the scalar denominators stay away from zero. The domination in Proposition 62 consequently permits removing the regularizations and taking parameter limits in each of these exact identities. It also permits fixed smooth-source Cauchy derivatives. This proves the asserted continuity without a positivity assumption on the mixed Gaussian pair.
  For the torus take $F$ larger than the fixed support, kernel, and assignment clearances. Every small input through the indicated scale has an unambiguous lift to the plane, with its required neighborhood; a winding input is large. The local tensor assignments are therefore identical to the plane assignments. Large winding inputs obey the large-support weight estimate. The transverse harmonic directions are added at the terminal integration, as prescribed in Lemma 51, and do not change any earlier local map. ◻
]

=== 7.2 The lower-face diagnostic <the-lower-face-diagnostic>

The restriction $s gt.eq d_(*) s_12^2$ is essential to the history bounds, so a three-dimensional shooting argument must respect it. We derive the required boundary information from a positive finite ensemble. On the auxiliary torus let

$ upright(d) nu \( q \, X \) = Z^(- 1) e^(- parallel V_q parallel^2 \/ 2) product_e f_b \( \( X + V_q \)_e \) thin upright(d) gamma_(P_T) \( X \) \, quad V_q = 2 pi sqrt(b) thin partial G q \, quad sum_v q_v = 0 . $

Here $P_T$ includes the harmonic transverse directions. This is a positive probability measure. It is used only as the diagnostic ensemble; no identification with a periodic XY spin law is required.

Choose a real torus function $phi$ for which $g = partial phi$ has norm one and is a lowest nonconstant frequency mode. For side $M$, one may normalize a sine wave: $parallel phi parallel_oo lt.eq C$ and $parallel nabla^r phi parallel_oo lt.eq C_r M^(- r)$. Put

$ a = s \/ d_c \, #h(2em) B_c = d_c + mu a \, #h(2em) w_(upright("ext")) = \( lambda + i a tau \) g \, #h(2em) psi_(upright("ext")) = tau phi . $

Let $Z \( lambda \, tau \)$ be the fully integrated compensated partition function evaluated at these external fields, with the same scalar normalization as $Z \( 0 \, 0 \)$. Denote the Hessian at zero of $log \[ Z \( lambda \, tau \) \/ Z \( 0 \, 0 \) \]$ by $H$.

#thm([Lemma 7.2.])[
  (Exact diagnostic Hessian).  #emph[Write $w = X + V_q$, $V_g = \( V_q \, g \)$, $f \( w \) = product_e f_b \( w_e \)$, and 
$ O = \( mu - d_c \) V_g + d_c partial_g log f \( w \) . $

 Then 
#[#set math.equation(numbering: n => "(7.4)")
 $ H_(tau tau) & = s + mu a^2 - B_c^2 "Var"_nu \( V_g \) \,\
H_(lambda tau) \/ i & = B_c #scale(x: 120%, y: 120%)[\(] s_12 + "Cov"_nu \( O \, V_g \) #scale(x: 120%, y: 120%)[\)] \,\
H_(lambda lambda) & = - mu - d_c^2 + 2 mu d_c + d_c^2 bb(E)_nu partial_g^2 log f \( w \) + "Var"_nu \( O \) . $ <xyf:htt>]

 If $\| H_(lambda lambda) \| lt.eq 1$ and the parameters lie in a fixed sufficiently small neighborhood of zero, then $"Var"_nu \( O \) lt.eq C$, with $C$ independent of the torus size and $b$ in the asserted low-temperature range. Consequently, if additionally $\| H_(lambda tau) \| lt.eq C_1 delta$, then 
#[#set math.equation(numbering: n => "(7.5)")
 $ "Var"_nu \( V_g \) gt.eq c_0 \( \| s_12 \| - C_2 delta \)_(+)^2 . $ <xyf:variance>]

]
] <xyf:hessian>

#proof[
  Translate the full fields before undoing the compensation. The longitudinal vortex argument becomes $V_q + d_c lambda g$: the $tau$-terms cancel because $s - d_c a = 0$. The linear source on $w$ is $\( mu lambda + i B_c tau \) g$, the source on $p$ is $i d_c lambda g$, and the direct translation factor is
  $ exp { - mu lambda^2 \/ 2 - i B_c lambda tau + \( s + mu a^2 \) tau^2 \/ 2 } . $
  The constant scalar mode enforces $sum q_v = 0$. At each such charge configuration the $p$-source gives the further factor $exp { - d_c lambda V_g - d_c^2 lambda^2 \/ 2 }$. Since $\( X \, g \) = 0$, the linear $w$-source is evaluated at $V_g + d_c lambda$. Combining these factors gives the exact ratio
  #[#set math.equation(numbering: n => "(7.6)")
   $ frac(Z \( lambda \, tau \), Z \( 0 \, 0 \)) & = exp #h(-0.16667em) {frac(- mu - d_c^2 + 2 mu d_c, 2) lambda^2 + i B_c \( d_c - 1 \) lambda tau + frac(s + mu a^2, 2) tau^2}\
 & quad times bb(E)_nu [e^(\( \( mu - d_c \) lambda + i B_c tau \) V_g) frac(f \( w + d_c lambda g \), f \( w \))] . $ <xyf:exactratio>]
  The identity first holds in the strict regularizations and then passes to the prescribed finite-graph limit by Proposition 50. Real positivity of $f$ makes the displayed logarithmic derivatives well defined. Differentiating (7.6) proves all three Hessian identities; in particular the direct mixed term is $i B_c \( d_c - 1 \) = i B_c s_12$.
  The branch estimate in Lemma 48 gives $\( log f_b \)'' gt.eq - C_f$. As $sum_e g_e^2 = 1$,
  $ partial_g^2 log f \( w \) = sum_e g_e^2 \( log f_b \)'' \( w_e \) gt.eq - C_f . $
  Rearranging (7.4), and bounding its deterministic terms, gives $"Var"_nu \( O \) lt.eq C$. Because $B_c$ stays bounded away from zero, (7.4) yields $\| "Cov"_nu \( O \, V_g \) \| gt.eq \( \| s_12 \| - C_2 delta \)_(+) .$ Cauchy–Schwarz for the positive measure $nu$ now gives (7.5). ◻
]

#thm([Proposition 7.3.])[
  (Admissible infinite trajectory).  #emph[For all sufficiently large $b$, there is a choice 
$ \| s_11 \| + \| s_12 \| + s_22 = O \( b^(- 1) \) \, #h(2em) s_22 gt.eq d_(*) s_12^2 \, $

 for which the exact bulk flow satisfies 
#[#set math.equation(numbering: n => "(7.7)")
 $ \| t_j \|_oo lt.eq T epsilon rho^j \, #h(2em) r_j lt.eq 2 epsilon rho^j \, #h(2em) epsilon = C_(*) \/ b \, quad 0 < theta < rho < 1 . $ <xyf:survivor>]

 The constants and the lower bound on $b$ do not depend on a correlation order or a finite-volume cutoff.]
] <xyf:shooting>

#proof[
  First choose $d_(*)$ small using the universal variance constant in Lemma 64. That constant requires only $\| H_(lambda lambda) \| lt.eq 1$ and a fixed small parameter neighborhood; it does not require a decay estimate or a choice of $T$. Fix the history geometry and a sufficiently small $theta > 0$. Choose $L$ large enough for the bulk, wall, and defect small-input contraction counts in Propositions 63 and 66. Next choose the defect weight $A_D$ sufficiently large for the large-input contraction and decoration estimates, and then choose the untwisted weight $A_U$ sufficiently large, with $A_U \/ A_D$ large enough for the support and assignment counts accompanying the same-representation transport comparison in Proposition 66. In the bulk recurrence and in this shooting argument set $A = A_U$. Both weights are now fixed and will not be enlarged after a survivor is chosen. The estimates requiring these choices depend only on the history geometry and the uniform one- or two-source bounds, also valid in the separated many-source decaying regime; they do not depend on a correlation order or on the eventual surviving parameters. Fix $rho in \( theta \, 1 \)$, and fix $rho < rho_1 < rho_2 < 1$ for the forced recurrences, together with the diagnostic torus factor $F$. All recurrence, translation, and terminal constants below are evaluated at these fixed choices. Choose $C_(*)$ to dominate the microscopic $b^(- 1)$ constant. Choose $T$ large afterwards, and finally choose the lower bound on $b$ large enough for the bulk shooting estimates and the wall and defect smallness conditions with these same weights.
  Let $h = T epsilon$, $delta_j = h rho^j$, and use the parameter domain
  #[#set math.equation(numbering: n => "(7.8)")
   $ P_h = { \( s_11 \, s_12 \, s \) : \| s_11 \| \, \| s_12 \| lt.eq h \, med d_(*) s_12^2 lt.eq s lt.eq h } . $ <xyf:parameterdomain>]
  It is a closed topological ball when $d_(*) h < 1$. Its lower face is the graph $s = d_(*) s_12^2$. If $\| t_i \|_oo lt.eq delta_i$ through step $j - 1$, induction in (7.2) gives $r_j lt.eq 2 epsilon rho^j$: it suffices that
  $ C_(L \, A) \( T + 2 \)^2 epsilon lt.eq 2 \( rho - theta \) \, $
  and (7.2) gives the initial inequality by increasing $b$. At a coordinate equality $\| t_(j \, alpha) \| = delta_j$, the increment estimate gives
  $ \| t_(j + 1 \, alpha) \| gt.eq delta_j - 2 C epsilon rho^j > delta_(j + 1) $
  on the same signed side, provided $T \( 1 - rho \) > 2 C$. This strict crossing will control boundary contacts of the exit map.
  We next exclude an exit through the positive $22$-face for a parameter on the lower face of $P_h$. Suppose the trajectory has stayed inside through step $j - 1$, and at step $j$ has $t_(22 \, j) gt.eq delta_j$. The increment bound implies $\| t_j \|_oo lt.eq M_0 delta_j$, with fixed $M_0$, and the remainder bound still holds at step $j$. There is no such event at $j = 0$, since $d_(*) h^2 < h$.
  Perform the calculation on the auxiliary torus of side $F L^j$. After removing its designated constants there are at most $C_F$ terminal blocks. The terminal expression is its tensor contribution plus an error whose smooth-source derivatives of order at most two are bounded by $C_F \( r_j + \| t_j \|^2 \)$. Indeed a single tensor expectation has its unmodified external-field quadratic and a field-independent covariance constant; every other linear input is a remainder, and every multi-input term has at least two tensor/remainder factors. The terminal history estimate bounds their integrals and Cauchy derivatives on fixed small circles in $\( lambda \, tau \)$. The normalized zero-source partition is $1 + O_F \( \| t_j \| + r_j \)$, so logarithmic differentiation has the same error bound. The chosen sine mode obeys all the required box-scale test bounds uniformly in $j$. On the fixed complex $\( lambda \, tau \)$-polydisc, its scalar background, including the constant value on each terminal block, contributes at most $exp { C h_(L^j) \( k \; X \) }$ for the current charge array $k$ on a terminal support $X$. This cost is paid by the final normalized-test allowance in Lemma 61; the test class defining $h_m$ includes its zeroth-order bound and does not quotient out constants. The finitely many terminal test events only change $C_F$, which is fixed before $T$. The uniform majorants on smaller source polydiscs in Proposition 62(iv)–(v) justify the Cauchy derivatives also at the degenerate endpoint $s = 0$. Consequently
  #[#set math.equation(numbering: n => "(7.9)")
   $ H_(lambda lambda) & = t_(11 \, j) + O_F \( r_j + \| t_j \|^2 \) \,\
H_(lambda tau) \/ i & = t_(12 \, j) + a t_(11 \, j) + O_F \( r_j + \| t_j \|^2 \) \,\
H_(tau tau) & = t_(22 \, j) - 2 a t_(12 \, j) - a^2 t_(11 \, j) + O_F \( r_j + \| t_j \|^2 \) . $ <xyf:terminalhessian>]
  All constants here are independent of $T$.
  For small $h$, the first line ensures $\| H_(lambda lambda) \| lt.eq 1$; the second gives $\| H_(lambda tau) \| lt.eq C delta_j$. Equations (7.4) and (7.5) therefore imply, on the lower face,
  #[#set math.equation(numbering: n => "(7.10)")
   $ H_(tau tau) lt.eq d_(*) s_12^2 + C d_(*)^2 s_12^4 - c_1 \( \| s_12 \| - C_2 delta_j \)_(+)^2 lt.eq C_3 delta_j^2 . $ <xyf:bottomupper>]
  For the last inequality use $\( x - y \)_(+)^2 gt.eq x^2 \/ 2 - y^2$, choose $d_(*) < c_1 \/ 4$, and then make $h$ small enough to absorb the fourth-order term. On the other hand, $\| a \| lt.eq C h$ and the last line of (7.9) imply
  $ H_(tau tau) gt.eq delta_j - C h delta_j - C_F #scale(x: 120%, y: 120%)[\(] 2 delta_j \/ T + M_0^2 delta_j^2 #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 2 delta_j . $
  Choose $T$ sufficiently large, then $h$ sufficiently small. This contradicts (7.10). These choices are not circular: the variance bound preceded $d_(*)$, and the terminal constant $C_F$ was fixed before $T$.
  Here is the topological conclusion, including boundary intersections. Put $x_j = t_j \/ delta_j$, and interpolate consecutive $x_j$’s linearly in a time variable. If no infinite survivor exists, every parameter has a first contact with the boundary of the cube $Q = \[ - 1 \, 1 \]^3$. Denote that point by $E \( s_bullet \)$. This defines a continuous map $P_h arrow.r partial Q$, as follows. Put $D_j = { s_bullet : x_i \( s_bullet \) in Q upright(" for ") i < j }$. Finite-recursion continuity on these relative domains makes the $D_j$ nested compact sets. If their intersection is empty, then $D_N = diameter$ for some finite $N$. Let $n$ be the first index at which $x_n in.not Q$. Strict crossing implies that every $x_i$, $i < n - 1$, is in the interior; the first-contact point lies on the final segment, possibly at its initial endpoint. Along any convergent parameter sequence, pass to a subsequence with the same $n$ and with convergent first-contact interpolation fractions. Closedness of $D_n$ and relative continuity give convergence of both segment endpoints. Their limiting interpolated point lies on $partial Q$. There can be no earlier boundary contact: an equality at an earlier integer time would force the next endpoint outside $Q$, contrary to membership in $D_n$. If the final segment starts on the boundary, strict outward crossing makes that initial point its unique boundary point; otherwise it starts in the interior and again has a unique boundary point. This also covers a final endpoint exactly on the boundary. Thus every subsequential limit is the first-contact point at the limiting parameter, proving continuity including at corners.
  On the top and on either vertical face of $P_h$, the initial point already belongs to $partial Q$, so $E \( s_bullet \) = s_bullet \/ h$. The lower-face exclusion just proved implies that its first-contact image avoids the relative interior of the top cube face. Indeed a contact there would require the next discrete endpoint to have $t_(22 \, j) gt.eq delta_j$, while every earlier endpoint was retained. At the intersections with a vertical face the initial image lies on that vertical face; it is never in the relative interior of the top face.
  The boundary map $E \|_(partial P_h)$ has degree one. For example, the point $\( 0 \, 0 \, 1 \)$ has exactly the preimage $\( 0 \, 0 \, h \)$, in the relative interior of the top parameter face; in a neighborhood there the boundary map is the orientation-preserving map $\( s_11 \, s_12 \) mapsto \( s_11 \/ h \, s_12 \/ h \)$. There are no preimages on the lower or vertical faces. But any map from the ball $P_h$ to the sphere $partial Q$ restricts to a null-homotopic boundary map, by contracting the ball to a point, and has boundary degree zero. This contradiction proves the existence of a survivor. Fix one such parameter choice for each $b$. ◻
]

=== 7.3 Walls, sources, and the single amplitude <walls-sources-and-the-single-amplitude>

The block construction is available for every integer side length, including partial terminal blocks, as in Lemma 28. Fix the surviving bulk parameters, independently of the finite grid and of translations of the nested cuts. Write $u_j = \| t_j \|_oo + r_j lt.eq C epsilon rho^j$. Use the weights $A_U = A$ and $A_D$ fixed before shooting in Proposition 65. The bulk and untwisted wall sizes are measured at $A_U$, and the source-defect sizes at $A_D$. The same-representation comparison of Proposition 62 handles bounded early translations before relocation. The fixed ratio $A_U \/ A_D$ pays only the accompanying support and assignment counts.

#thm([Proposition 7.4.])[
  (Forced recurrences).  #emph[For untwisted wall activities let $w_j$ denote their full size. For twisted defect activities let $v_j$ denote their full size. There are fixed $rho < rho_1 < rho_2 < 1$ such that 
#[#set math.equation(numbering: n => "(7.11)")
 $ w_(j + 1) & lt.eq theta w_j + C u_j + C \( u_j + w_j \)^2 \, & w_j & lt.eq C epsilon rho_1^j \,\
v_(j + 1) & lt.eq theta v_j + C \( u_j + w_j \) + C \( u_j + w_j + v_j \)^2 \, & v_j & lt.eq C epsilon rho_2^j . $ <xyf:wallrec>]

 The defect statements hold at all scales for at most two unit signed sources, including coincident sources. For $k$ fixed sources separated by at least $epsilon.alt_0 n$ in lattice units, they hold through scales $L^(j + 1) lt.eq c epsilon.alt_0 n \/ \( k + 1 \)$. The constants in these decaying recurrences and the required lower bound on $b$ are independent of $k$. The subsequent bounded number of steps preserve an $o \( 1 \)$ activity bound as $n arrow.r oo$, with constants allowed to depend on the fixed configuration and $k$.]
] <xyf:forced>

#proof[
  Let $c_(upright("loc"))$ bound, in current coarse-block units, every assignment, normalization-provenance, and collar neighborhood used by one local map. This includes inherited coefficient provenance: its earlier radii sum geometrically in current units, as in the proof of Proposition 33. Let $C_X$ bound the diameter of a small input in fine-block units. The fixed geometric choices include $H > c_(upright("loc"))$ and $\( H - c_(upright("loc")) \) L > H + C_X$, as well as the kernel clearances. Thus a good output’s enlarged hull contains all the support and scalar-normalizer provenance needed to compute it, with a clearance margin.
  An untwisted support is bulk-good if its required neighborhood has distance greater than $H m$ from the physical walls. On a torus require coordinate gaps of that size so the neighborhood unwraps. The remaining supports are wall supports. Copy the bulk localization on small good inputs. On small wall inputs subtract only their neutral constant; the full untwisted activity is even. To determine a good output, every contributing fine support and every assigned piece lies in its coarse sites or within the fixed one-step assignment neighborhood. The clearance ensures that all these supports are good and that the shell covariance agrees with the bulk covariance there. Connectivity tests, temporary exclusions, and singleton normalizations then agree as well. This proves equality with the bulk on good outputs by induction, including the normalization step.
  At a fixed coarse wall output, a small wall input must lie in a strip of bounded fine-block width along a side. There are $O \( L \)$ such positions and only a fixed number of small animals at each position. Corner positions are already included in this count. Thus even neutral wall remainders cost $C L dot.op L^(- 2)$, and charged ones cost $C L dot.op L^(- 4)$. Small torus-winding supports are absent in the regime where the torus clearance is used. Large inputs contract by the weight as before. A good input contributing to a bad output is bounded crudely by $C u_j$, including any assigned tensor polynomial; it is not required to cancel there. The product and decoration counts in the proof of Proposition 63 give the quadratic term. The initial size is $w_0 lt.eq C epsilon$, which proves the first recursion.
  For a spin source array $l = sum_(r = 1)^k 𝜍_r delta_(x_r)$, $𝜍_r in { 1 \, - 1 }$, use the exact connection of Proposition 50. Its offsets are
  $ eta = - cal(R)^(- 1) d G_n l \/ sqrt(b) \, #h(2em) theta.alt = a_l \/ sqrt(b) \, #h(2em) \( w \, p \, psi \) mapsto \( w - i d_c eta \/ mu \, p + eta \, psi + theta.alt \) . $
  The symbol $a_l$ here denotes the connection lift, not the scalar $a = s \/ d_c$ in the diagnostic. A support is shift-good if its rectangular hull enlarged by $H m$ misses every marked source. On that hull, clipped to the physical square when necessary, the connection has a common lift modulo its period; the reflected extensions obey the same identity on the stencil neighborhoods. Let $cal(R)_j^(upright("un")) \( X \)$ be the chosen untwisted representation; each selected live root is untagged. On a good support represent the full twisted activity by $T_Lambda cal(R)_j^(upright("un")) \( X \)$, where $Lambda = \( - i d_c eta \/ mu \, Lambda_psi \)$ and $partial Lambda_psi = eta$ on its enlarged hull.
  The first independent-piece integration, temporary grouping, and relocation of the full linear $U_e$ expectation construct $K_0$ before good and defect outputs are classified. The initial field collar and retained exclusion provenance lie within a fixed number of unit blocks of each output support, covered by the chosen $H$. On an initial good output the exact microscopic substitution with the common lift commutes with this finite algebra. The designated contraction scalars are source independent, while the whole shifted polynomial remains in the activity. Thus $K_0^(upright("tw")) \( X \, z \) = K_0^(upright("un")) \( X \, z + Lambda \)$ there, and we choose its representation afresh as $T_Lambda cal(R)_0^(upright("un")) \( X \)$. Initial defect outputs retain their intrinsic tagged representations, including shifted $U_e$ polynomials. The no-return induction below begins at these classified $K_0$ outputs and applies only to subsequent $m arrow.r L m$ maps.
  For localization on small good inputs copy the untwisted pieces and retain their #emph[untwisted] designated constants. In particular no background value of a translated tensor is reassigned as a scalar constant. On small defect inputs subtract only the neutral constant.
  Every support and normalization neighborhood contributing to a good output fits within its enlarged hull with a clearance margin. More explicitly, if $Y$ is good at $S = L m$, every contributing fine predecessor $X$, including a predecessor of a scalar normalizer, obeys
  $ "dist" \( x_i \, "Hull" X \) > \( H - c_(upright("loc")) \) S - C_X m > H m $
  for each mark $x_i$; residual predecessors have the stronger bound because their closures lie in $Y$. Thus all fine inputs are good and admit the same lift. Using the exact fine activity identities with this common lift, substitution commutes with the convolution, product, and assignment identities. This proves the good-output identity inductively, including every designated scalar normalizer and its provenance. After proving that identity at each still-good output $Y$, choose its representation afresh as $T_(Lambda_Y) cal(R)_(j + 1)^(upright("un")) \( Y \)$. Thus the transport is applied to an untagged root; the previously assembled tagged representation of that good output is discarded. This is a choice of a representation of the same exact activity.
  At a defect output retain, in each selected term, its concatenated live root with its existing tags and its separately completed coefficient occurrences. No lift is chosen on that output and no further $T_Lambda$ is applied to that root. An assigned piece originating at a good fine block is transported only at that fine block, before relocation, even if its target coarse singleton is a defect. Its opaque untwisted coefficient is unchanged. The following no-return property justifies this rule. If a fine support $X$ is defective, some mark has distance at most $H m$ from its hull. A residual output contains $macron(X)$, so it is defective at $S = L m$. A singleton receiving a small defect coefficient belongs to $macron(X)$ and meets $X$; its distance from that mark is at most $\( H + C_X \) m$. Any output whose assignment or normalization neighborhood uses that singleton is within a further $c_(upright("loc")) S$. The chosen inequality $\( H - c_(upright("loc")) \) L > H + C_X$ makes such an output defective as well. This includes a defect-specific scalar inverse decoration: it is an opaque number supported at its singleton, and every later use retains that support or the stated normalization provenance. Defect localization emits only a neutral constant, so it cannot create a relocated live polynomial elsewhere. A good-origin polynomial first landing in a defect then follows the residual rule. Consequently no tagged defect ancestry, including its scalar-normalizer provenance, re-enters a good output.
  The derivative bounds for the connection give bounded scaled positive derivatives at every point of a good fine collar for one or two sources. In the separated $k$-source regime, at each folded collar point at most one source is within $epsilon.alt_0 n \/ 3$; the identity of this source may vary with the point. The others contribute at most $C k m \/ \( epsilon.alt_0 n \)$ in the scaled bound. The own-birth estimate after Equation (6.23) applies to every old atom, since its birth size $h lt.eq m$ obeys the same early inequality. Choosing $c$ small therefore puts the transport of each good input in the admissible early class.
  Apply the explicit comparator in Proposition 62(iv) to that input before relocation:
  $ A_D^(\| X \|) sans(s)_X \( T_Lambda cal(R)_j^(upright("un")) \) = A_D^(\| X \|) sans(s)_X \( cal(R)_j^(upright("un")) \) lt.eq \( A_D \/ A_U \)^(\| X \|) parallel cal(R)_j^(upright("un")) parallel_(A_U) . $
  Its structural coefficient, every opaque completed coefficient size, and the live event weight are identical on the two sides. All bounded early contour translations remain inside the endpoint integrand. The fixed ratio $A_U \/ A_D$ is used only in the subsequent spatial enumeration of support and assignment choices. The product bounds apply to concatenated live roots and multiply the sizes of completed scalar occurrences separately. This gives good-input forcing $C \( u_j + w_j \)$, including assigned polynomials on their original good fine blocks, without a cost for every old event at each scale.
  A small defect input has bounded fine diameter and an enlarged hull meeting a mark. There are only $O \( 1 \)$ such fine supports per mark in a coarse output. In the indicated separated regime the number of relevant marks in this local calculation is bounded; for at most two sources it is bounded at every scale. Consequently the neutral and charged linear costs are $C \( L^(- 1) + L^(- 4) \)$. Large defect inputs contract by the weight. The product counts give the second recursion; the microscopic offset bounds give $v_0 lt.eq C epsilon$.
  To solve the recurrences, take the initial sizes sufficiently small that each quadratic term can absorb a fixed small multiple of the unknown wall or defect size into a contraction coefficient strictly less than $rho$. Iterating the resulting linear inequalities and summing their geometric convolutions gives the displayed $C epsilon rho_1^j$ and $C epsilon rho_2^j$ bounds. Equivalently, substitution of these bounds into the two recurrences proves them inductively after choosing their constants and then increasing $b$.
  For a fixed separated configuration, the last scale in the decaying regime is proportional to $n$. There are only $O_(k \, epsilon.alt_0) \( 1 \)$ remaining scales, on grids with $O_(k \, epsilon.alt_0) \( 1 \)$ blocks. The entering activities tend to zero. The finite remaining maps and terminal integrals have finite bounds by the history calculus with the actual source offsets; their constants may depend on $k \, epsilon.alt_0 \, b$. Each new term has at least one entering activity, so finitely many applications of these bounds preserve $o \( 1 \)$. In each live root, the number of atoms whose own birth sizes are late is bounded by $C_(k \, epsilon.alt_0 \, L)$, as proved after Equation (6.23). Only their explicitly recorded late numerical product may change by a fixed-configuration factor. Early decorations stay in the uniform endpoint class, and opaque completed coefficient occurrences are not transported. Thus neither the original charge and $F_b$ weights nor the microscopic lower bound on $b$ is increased with $k$. ◻
]

Let $R_n \( l \)$ be the twisted-to-untwisted ratio of the remaining compensated partition functions, without the deterministic Gaussian source factor. The exact identity of Proposition 50 reads

#[#set math.equation(numbering: n => "(7.12)")
 $ bb(E)_(upright("XY") \, b \, n) e^(i sum_x l_x theta_x) = exp {- frac(s + d_c^2 \/ mu, 2 b) \( l \, G_n l \)} R_n \( l \) . $ <xyf:spinfactor>]

#thm([Proposition 7.5.])[
  (A universal spatial amplitude).  #emph[There is $c_b in \( 0 \, oo \)$, depending only on $b$ and the fixed surviving parameters, such that, for each fixed $k$ and every convergent configuration of distinct interior continuum locations, 
#[#set math.equation(numbering: n => "(7.13)")
 $ R_n #h(-0.16667em) (sum_(r = 1)^k 𝜍_r delta_(x_(r \, n))) arrow.r c_b^k . $ <xyf:amplitudelimit>]

 The same $c_b$ works for both signs, every interior position, every integer sequence $n arrow.r oo$, and every choice of nested cuts. The ratios for at most two sources are bounded uniformly without a separation condition.]
] <xyf:amplitude>

#proof[
  After extracting the designated constants at each step, the terminal normalized integrals in both problems tend to one. There are boundedly many terminal blocks, and Proposition 66 and the terminal history estimate bound every nonempty activity contribution by $o \( 1 \)$. The same reasoning includes the bounded number of late steps for a fixed separated configuration.
  Write $1 + a_(j \, B)^(upright("tw"))$ and $1 + a_(j \, B)^(upright("un"))$ for the extracted factors. They are real: on real background fields complex conjugation combined with $w mapsto - w$ preserves the compensated integral and its local rules, including the real connection offsets. Their distance from one is small in the decaying regime, so they are positive. The microscopic designated constants are identical in the two problems. At subsequent scales a difference arises only from a small defect input. The bounded number of such inputs per source, the extracted-coefficient estimate, and Proposition 66 imply
  #[#set math.equation(numbering: n => "(7.14)")
   $ sum_B lr(|log \( 1 + a_(j \, B)^(upright("tw")) \) - log \( 1 + a_(j \, B)^(upright("un")) \)|) lt.eq C k epsilon rho_2^j . $ <xyf:logtail>]
  This follows from $\| log \( 1 + x \) - log \( 1 + y \) \| lt.eq 2 \| x - y \|$ for the small real coefficients in question. In a separated configuration the bounded late contributions are $o \( 1 \)$. For two sources the estimate holds throughout. The terminal history bound then gives a uniform ratio bound for all sufficiently large grids. The finitely many remaining grid sizes are covered by enlarging that bound; their positive partition functions are finite and their source locations form finite sets.
  For a single signed mark remaining macroscopically interior, translate the nested cuts by its lattice position. This translation does not change the bulk parameters or the exact physical ratio. At any fixed depth all constants that differ between the two problems are computed within a fixed lattice neighborhood of the mark. In this neighborhood, as the distance to the boundary tends to infinity, the grids and kernels are eventually the plane ones. The connection increments converge to the isolated plane connection. Its phase values modulo the period converge up to one common phase. A common phase translates the activity argument in the scalar field; neutral constant extraction is invariant under that translation, and the good-input lift rule preserves the invariance at every step. The finite-depth continuity of the history integrals therefore proves convergence of each local constant difference. Simultaneous negation of the fields and the connection proves that these limits are unchanged by reversing the source sign. They are also independent of the macroscopic source position, because the fixed-depth limiting grid and increments are the same.
  The sum of these isolated differences is absolutely convergent by (7.14). Define its exponential to be $c_b$. It is finite and strictly positive. The terminal ratio tends to one, so it is also the limit of the exact single-source physical remaining ratio. In particular its value is independent of cuts, although cuts were translated to compute that limit.
  For several separated sources, compare with the individual single-source problems on the #emph[same] hierarchy. At each fixed depth the neighborhoods supporting differing constants around distinct marks are disjoint for large $n$. The other sources’ connection increments tend to zero in each neighborhood; their phase contribution is a common phase to leading order and thus does not affect neutral constants. Finite-depth continuity makes the local differences converge to the corresponding single-source differences. A mark has only finitely many positions modulo the cuts at a fixed depth, so this comparison is uniform in those positions. First sum through a fixed depth, then use (7.14) to send that depth to infinity. The result is $k log c_b$, proving (7.13) with no subsequence or location-dependent adjustment. ◻
]

=== 7.4 The full complex spin field <the-full-complex-spin-field>

#thm([Theorem 7.6.])[
  (Low-temperature XY field).  #emph[There is $b_0 \( upright("XY") \) < oo$ such that for every fixed $b gt.eq b_0 \( upright("XY") \)$, the choices 
#[#set math.equation(numbering: n => "(7.15)")
 $ K_(upright("XY")) \( b \) = frac(b, s + d_c^2 \/ mu) \, #h(2em) A_(upright("XY")) \( b \) = c_b^(- 1) $ <xyf:stiffness>]

 satisfy $K_(upright("XY")) \( b \) > 1 \/ \( 4 pi \)$, $A_(upright("XY")) \( b \) > 0$, and $K_(upright("XY")) \( b \) \/ b arrow.r 1$. Along every integer sequence $n arrow.r oo$, 
$ n^(- 2) sum_(x in D_n^compose) A_(upright("XY")) \( b \) e^(G_n \( x \, x \) \/ \( 2 K_(upright("XY")) \( b \) \)) e^(i theta_x) delta_x med arrow.r.double med V_(K_(upright("XY")) \( b \) \, D) $

 in $H_(upright("loc"))^(- 3) \( D \)$, and jointly on any finite collection of complex smooth compactly supported test functions. The limit uses the full Dirichlet-variance Wick convention.]
] <xyf:spin>

#proof[
  By Proposition 65, $s + d_c^2 \/ mu = 1 + O \( b^(- 1) \) > 0$. This proves the stated asymptotic for the coefficient $K_(upright("XY")) \( b \)$ and, on increasing $b_0$, the required lower bound. Let $K = K_(upright("XY")) \( b \)$, $A = c_b^(- 1)$, and write $Z_n \( x \) = A e^(G_n \( x \, x \) \/ \( 2 K \)) e^(i theta_x)$. For signed factors let $Z_n \( x \)^(\[ + \]) = Z_n \( x \)$ and $Z_n \( x \)^(\[ - \]) = overline(Z_n \( x \))$. Equation (7.12) gives the exact cancellation
  #[#set math.equation(numbering: n => "(7.16)")
   $ bb(E) product_(r = 1)^k Z_n \( x_r \)^(\[ 𝜍_r \]) = A^k R_n #h(-0.16667em) (sum_r 𝜍_r delta_(x_r)) exp {- 1 / K sum_(r < t) 𝜍_r 𝜍_t G_n \( x_r \, x_t \)} . $ <xyf:wickcancel>]
  In particular every self-energy, including its finite position-dependent Dirichlet part, cancels. By Proposition 67 and the lattice Green convergence in Lemma 27, at separated convergent interior points this tends to
  $ exp {- 1 / K sum_(r < t) 𝜍_r 𝜍_t G_D \( z_r \, z_t \)} . $
  These are precisely the separated signed moments of the full-variance Wick exponential. Convergence along every convergent separated configuration sequence is uniform on separated compact configuration sets: otherwise compactness would supply a convergent sequence on which the error stayed bounded away from zero.
  We check the remaining hypotheses of Theorem 45. The two-source ratio bound and the Green estimates give, uniformly in all lattice points of a fixed interior compact set,
  #[#set math.equation(numbering: n => "(7.17)")
   $ 0 lt.eq bb(E) \[ Z_n \( x \) overline(Z_n \( y \)) \] lt.eq C \( \| x - y \| + n^(- 1) \)^(- Q) \, #h(2em) Q < 2 . $ <xyf:twopoint>]
  One may take $Q = C_G \/ K < 2$, where $C_G$ is the constant in the discrete logarithmic Green bound, by increasing the lower bound on $b$ once. Repeated locations are included: their diagonal Green factor is bounded by the same estimate. The same-sign two-point expression is bounded above by a constant since $G_n gt.eq 0$.
  All signed-spin expectations are nonnegative. Indeed the Fourier coefficients of $e^(b cos theta)$ are nonnegative: expand $exp \( \( b \/ 2 \) e^(i theta) \) exp \( \( b \/ 2 \) e^(- i theta) \)$ and group equal powers. Haar integration at interior vertices selects currents with the required integer divergence. Every surviving current has nonnegative weight, and the pinned boundary supplies the remaining divergence. The positive deterministic multipliers in $Z_n$ preserve this property.
  Finally fuse all fixed boundary vertices into one pin vertex and give that vertex an independent uniform angle, rotating every spin by the same angle. The resulting measure is the finite free ferromagnetic plane-rotator measure, with nonnegative edge couplings, and this rotation preserves the modulus of each nonnegative weighted complex smear. The Lee–Yang estimate in Lemma 43 therefore applies to its real and imaginary projections and gives the absolute-smear moment bounds needed in Theorem 45. Its public theorem hypotheses are finite graph, nonnegative couplings, and nonnegative smear weights; all are satisfied here. General complex test functions are handled by splitting real and imaginary parts into nonnegative parts, as in that theorem.
  Thus the hypotheses of the transfer theorem are all available: separated signed multipoint limits for every fixed order, the unrestricted integrable two-point bound (7.17), positivity of every signed moment, and the rotated Lee–Yang moment bound. That theorem controls collisions, proves moment determinacy, and gives local negative-Sobolev tightness. It yields the claimed full complex law and joint smeared convergence. The large fixed $b_0$ was chosen in the bulk and the at-most-two-source estimates; Proposition 66 supplies every higher fixed order at this same $b$. The arbitrary-size hierarchy and the cut-independent amplitude prove the assertion for all integers $n$, rather than only a geometric subsequence. ◻
]

== 8 The weak-activity height recursion <wh:section>

This section constructs the height recursion on tori and proves its consequences when a microscopic smallness estimate is available. Its local maps also apply to a small activity supplied at a later scale. The two assertions have different hypotheses: the microscopic construction below applies to a fixed interaction at sufficiently large temperature, or to a sufficiently spread-out interaction at a prescribed coefficient greater than $8 pi$. For a general fixed interaction near its physical transition, the small initial activity will instead be supplied by Theorem 77.

Write

#[#set math.equation(numbering: n => "(8.1)")
 $ Q = - Delta_J \, #h(2em) A_0 = Q \/ v^2 \, #h(2em) v = v_J \, #h(2em) k = beta \/ v^2 \, #h(2em) k_0 = 8 pi . $ <wh:conventions>]

Write $a \( k \) = a_J \( k \)$ for the structural coefficient of Theorem 5. We denote the held-fixed reference coefficient by $a'$ and put $alpha = sqrt(a')$. Thus $a'$ is a proposed output coefficient, whereas $k$ is the physical input parameter. On nonconstant modes use covariance $A_0^(- 1)$, and integrate the constant mode uniformly over $\[ 0 \, 2 pi \/ alpha \)$. Insert the normalized comb $sum_(q in bb(Z)) e^(i q alpha phi.alt_x)$ at every vertex and the interaction

#[#set math.equation(numbering: n => "(8.2)")
 $ exp { s \( phi.alt \, A_0 phi.alt \) \/ 2 } \, #h(2em) s = 1 - a' \/ k . $ <wh:compensation>]

The resulting measure, with $sigma = alpha phi.alt$, is exactly the height measure modulo constants: its quadratic exponent is $- \( 1 - s \) \( phi.alt \, A_0 phi.alt \) \/ 2 = - \( sigma \, A_0 sigma \) \/ \( 2 k \)$. Comb identities can first be read with positive Fourier approximate identities and then passed to the limit after the independent Gaussian integration below. All convolutions are independent of $k$ when $a'$ is held fixed.

For a block $B$ of side $m$ set

#[#set math.equation(numbering: n => "(8.3)")
 $ e_B^0 \( phi.alt \) = frac(1, 2 \| J \| v^2) sum_(x in B) sum_(y in J) \( phi.alt_(x + y) - phi.alt_x \)^2 \, #h(2em) c_B^alpha \( phi.alt \) = m^(- 2) sum_(x in B) cos \( alpha phi.alt_x \) . $ <wh:singletons>]

In particular $sum_B e_B^0 = \( phi.alt \, A_0 phi.alt \)$, including the displayed factor $1 \/ 2$ accounting for the two orientations of an edge.

The weak-coupling analysis is related to the sine-Gordon contraction of Dimock–Hurd #cite(label("DimockHurd2000")) and the discrete Gaussian maps of Bauerschmidt–Park–Rodriguez #cite(label("BPR2024I")). The present map, its complex activity analyticity, and its near-marginal second-order coefficients are proved below with the norms used here. Their later application to a fixed rough lattice model also requires the physical entry theorem of Section 9.

=== 8.1 Finite-range kernels and the ultraviolet preparation <finite-range-kernels-and-the-ultraviolet-preparation>

We first give the estimates uniformly for $J_rho = { x in bb(Z)^2 \\ { 0 } : \| x \|_oo lt.eq rho }$. Let $d_rho$ be the largest power of two not exceeding the integer $rho$, and set $gamma = 3 \/ 5$. Write $N_rho = \( 2 rho + 1 \)^2$ and

$ b_rho \( t \) = frac(sin \( \( 2 rho + 1 \) t \/ 2 \), \( 2 rho + 1 \) sin \( t \/ 2 \)) . $

The exact symbols are

#[#set math.equation(numbering: n => "(8.4)")
 $ Q \( xi \) = frac(N_rho, N_rho - 1) { 1 - b_rho \( xi_1 \) b_rho \( xi_2 \) } \, #h(2em) v^2 = frac(N_rho rho \( rho + 1 \), 6 \( N_rho - 1 \)) . $ <wh:spread-symbol>]

On $\[ - pi \, pi \]$ one has $\| b_rho \( t \) \| lt.eq 1$ and $\| b_rho \( t \) \| lt.eq pi \/ \( \( 2 rho + 1 \) \| t \| \)$. Where $b_rho$ is negative, $\| t \| gt.eq 2 pi \/ \( 2 rho + 1 \)$, so $b_rho gt.eq - 1 \/ 2$. Consequently $0 lt.eq gamma Q lt.eq 1 - c$ for all sufficiently large $rho$. Taylor expansion in a fixed $rho xi$ window, and the preceding bound outside a sufficiently large such window, give

#[#set math.equation(numbering: n => "(8.5)")
 $ v^2 asymp rho^2 \, #h(2em) Q \( xi \) asymp min { rho^2 \| xi \|^2 \, 1 } \, #h(2em) Q \( xi \) = v^2 \| xi \|^2 { 1 + O \( rho^2 \| xi \|^2 \) } . $ <wh:ellipticity>]

For the lower bound in the remaining compact annulus, any subsequential limit is the product of two sinc functions; its value is strictly less than one away from the origin. This proves a uniform positive lower bound there and completes the ellipticity argument.

Fix a sufficiently large power of two $L$, and let $m_0$ be the first power of $L$ at least $rho^B$, where the absolute exponent $B$ is chosen after the finite list of difference estimates below. Define

$ P_t \( cos z \) = (frac(sin \( t z \/ 2 \), t sin \( z \/ 2 \)))^64 \, #h(2em) sans(P)_t = P_t \( 1 - Q \/ 16 \) . $

First take independent normals of variance $gamma v^2$; then take

#[#set math.equation(numbering: n => "(8.6)")
 $ C_(upright("uv")) = frac(v^2 \( 1 - gamma Q \), Q) \( 1 - sans(P)_(m_0 \/ d_rho) \) \, #h(2em) Gamma_m = frac(v^2 \( 1 - gamma Q \), Q) \( sans(P)_(m \/ d_rho) - sans(P)_(L m \/ d_rho) \) \, quad m = m_0 L^j . $ <wh:covariances>]

On the torus of side $n = L^N > D_0 m_0$, let $m_(*)$ be the largest member of ${ m_0 L^j : j gt.eq 0 }$ strictly below $n \/ D_0$. This set contains $m_0$. Use shells whose upper side is at most $m_(*)$; when $m_(*) = m_0$ there are no long shells. The remaining nonconstant covariance is $v^2 \( 1 - gamma Q \) sans(P)_(m_(*) \/ d_rho) \/ Q$; retain the independent uniform mean. Here $D_0$ is fixed after all support radii have been fixed.

#thm([Lemma 8.1.])[
  (Kernel bounds).  #emph[The two kernels in Equation (8.6) are positive semidefinite polynomial kernels, of ranges at most $C m_0$ and $C L m$, respectively. For the long-wave shells $Gamma_m$ with $m gt.eq m_0$, and their binary pieces at the corresponding lower scales, the pointwise and positive-order operator bounds of Lemma 26 hold uniformly in sufficiently large $rho$, using ordinary nearest-axis differences. The positive-order diagonal and operator bounds also hold for the final smoothed remainder at its stopping scale. Consequently Lemma 29 applies to these shell and terminal integrations.]
  #emph[The ultraviolet covariance is controlled separately by 
#[#set math.equation(numbering: n => "(8.7)")
 $ 0 lt.eq A_0^(1 \/ 2) C_(upright("uv")) A_0^(1 \/ 2) = \( 1 - gamma Q \) \( 1 - sans(P)_(m_0 \/ d_rho) \) lt.eq "Id" . $ <wh:uv-energy>]

 No scale-$m_0$ nearest-axis derivative or whole-regulator averaging bound is asserted for $C_(upright("uv"))$.]
  #emph[For each fixed admissible scale ratio $R$, the rescaled plane shell from lower side $m$ to upper side $R m$, and its scaled differences through order eight, converge to the corresponding derivatives of 
#[#set math.equation(numbering: n => "(8.8)")
 $ hat(G)_R \( eta \) = frac(P_u \( eta \) - P_u \( R eta \), \| eta \|^2) \, #h(2em) P_u \( eta \) = (frac(sin \( u \| eta \| \), u \| eta \|))^64 \, #h(2em) u = frac(v, d_rho sqrt(32)) . $ <wh:continuum-symbol>]

 The parameter $u$ ranges over a compact subinterval of $\( 0 \, oo \)$. The errors have bounds $C \( rho^C \/ m \)^c$, summable over the starting scales and tending to zero as $rho arrow.r oo$. In particular, on the plane, for bounded $alpha$, 
#[#set math.equation(numbering: n => "(8.9)")
 $ lambda_j := L^2 e^(- alpha^2 Gamma_(m_0 L^j) \( 0 \, 0 \) \/ 2) = lambda \( 1 + epsilon.alt_j \) \, #h(2em) lambda = L^(2 - a' \/ \( 4 pi \)) \, #h(2em) sum_(j gt.eq 0) \| epsilon.alt_j \| = o \( 1 \) . $ <wh:eigenvalue>]

 The ultraviolet diagonal obeys 
#[#set math.equation(numbering: n => "(8.10)")
 $ D_(upright("uv")) := gamma v^2 + C_(upright("uv")) \( 0 \, 0 \) = v^2 \( 1 + o \( 1 \) \) . $ <wh:uv-diagonal>]

 For an arbitrary fixed admissible $J$ the shell and terminal long-wave assertions hold with constants depending on $J$, a sufficiently small $gamma > 0$, and a sufficiently large starting scale. In that version the summable errors tend to zero as the starting scale tends to infinity; neither Equation (8.10) nor $gamma > 1 \/ 2$ is asserted.]
  #emph[For the physical entry construction there is a second, fixed-$J$ family. With integral $M$ and the same polynomials $sans(P)_M$, set 
$ C_(< M)^(upright("en")) = v^2 / Q \( 1 - sans(P)_M \) \, #h(2em) Gamma_M^(upright("en")) = v^2 / Q \( sans(P)_M - sans(P)_(L M) \) . $

 These are positive semidefinite polynomial kernels of ranges at most $C_J M$ and $C_J L M$, respectively, and $0 lt.eq A_0^(1 \/ 2) C_(< M)^(upright("en")) A_0^(1 \/ 2) = 1 - sans(P)_M lt.eq "Id"$. For $M$ sufficiently large, the plane shells and the torus shells whose upper side $L M$ is below $n \/ D_0$, with $D_0$ sufficiently large depending on $J$, satisfy 
$ \| Gamma_M^(upright("en")) \( x \, y \) \| & lt.eq C_J (1 + log^(+) frac(L M, M + "dist" \( x \, y \))) \, #h(2em) Gamma_M^(upright("en")) \( x \, x \) gt.eq c_J log L \,\
\| nabla_x^a nabla_y^c Gamma_M^(upright("en")) \( x \, y \) \| & lt.eq C_(J \, r) \( M + "dist" \( x \, y \) \)^(- r) \, #h(2em) r = \| a \| + \| c \| \, quad 1 lt.eq r lt.eq 12 \,\
parallel Gamma_M^(upright("en")) parallel_(2 arrow.r 2) & lt.eq C_J \( L M \)^2 \, #h(2em) parallel nabla^r \( Gamma_M^(upright("en")) \)^(1 \/ 2) parallel_(2 arrow.r 2)^2 lt.eq C_(J \, r) M^(- 2 \( r - 1 \)) \, #h(2em) 1 lt.eq r lt.eq 6 . $

 Here the constants are chosen before $L$. In particular the positive-order diagonal bounds of Lemma 26 hold. For the mean-free terminal covariance $Gamma_(*)^(upright("en")) = v^2 sans(P)_(M_(*)) \/ Q$ on a torus of side $n gt.eq 2 M_(*)$, those diagonal and positive-order operator bounds hold at scale $M_(*)$, with constants independent of $n \/ M_(*)$ and $L$. Its undifferentiated diagonal satisfies $0 lt.eq Gamma_(*)^(upright("en")) \( x \, x \) lt.eq C_J \( 1 + log \( n \/ M_(*) \) \)$.]
  #emph[At fixed $J \, L$, the continuum shell for this family has $upsilon_(upright("en")) = v \/ sqrt(32)$ in place of $u$ in Equation (8.8). Writing it as $G_(L \, upsilon_(upright("en")))$, for $r = \| a \| + \| c \| lt.eq 8$ one has 
$ sup_(x \, y in bb(Z)^2) lr(|M^r nabla_x^a nabla_y^c Gamma_M^(upright("en")) \( x \, y \) - partial_X^a partial_Y^c G_(L \, upsilon_(upright("en"))) \( X - Y \)\|_(X = x \/ M \, thin Y = y \/ M)|) lt.eq C_(J \, L) M^(- 1 \/ 2) . $

 For a compact interval $I subset.double \( 0 \, oo \)$ of reference coefficients, the actual fundamental multipliers for a sufficiently large start $m$ are therefore 
$ delta_j^(upright("en")) = Gamma_(m L^j)^(upright("en")) \( 0 \, 0 \) - frac(log L, 2 pi) \, #h(2em) lambda_j^(upright("en")) = L^2 e^(- a' Gamma_(m L^j)^(upright("en")) \( 0 \, 0 \) \/ 2) = lambda \( 1 + epsilon.alt_j^(upright("en")) \) \,\
epsilon.alt_j^(upright("en")) = e^(- a' delta_j^(upright("en")) \/ 2) - 1 \, #h(2em) sum_(j gt.eq 0) \| epsilon.alt_j^(upright("en")) \| lt.eq frac(C_(I \, J \, L) m^(- 1 \/ 2), 1 - L^(- 1 \/ 2)) quad \( a' in I \) . $

 The shell diagonals and these multipliers are identical on a retained torus and the plane. This entry-family assertion is only for fixed $J$; no uniformity as the interaction range tends to infinity is asserted.]
] <wh:kernels>

#proof[
  For integer scale ratios the elementary identity
  $ P_(L t) \( cos z \) = P_t \( cos z \) (frac(sin \( L t z \/ 2 \), L sin \( t z \/ 2 \)))^64 lt.eq P_t \( cos z \) $
  holds, with values at removable singularities defined by continuity. The degree of $P_t$ is $32 \( t - 1 \)$, and $P_t \( 1 - q \/ 16 \) = 1 - \( t^2 - 1 \) q \/ 3 + O \( q^2 \)$. Thus the quotients by $Q$ are polynomials with nonnegative spectral values, also at zero. A polynomial of degree $d$ in $Q$ has range at most $d rho$ in sup distance, proving the range bounds. Moreover, $0 lt.eq 1 - gamma Q lt.eq "Id"$ and $0 lt.eq sans(P)_t lt.eq "Id"$ on the spectrum. Multiplication by $A_0^(1 \/ 2)$ on both sides of the ultraviolet multiplier proves Equation (8.7); both sides of its equality vanish on the constant mode.
  For a long-wave shell $Gamma_m$, split it into its binary pieces. In $\| xi \| lt.eq c \/ rho$, the angle $z = arccos \( 1 - Q \( xi \) \/ 16 \)$ satisfies $\( m \/ d_rho \) z asymp m \| xi \|$, and the binary covariance multiplier is bounded by
  $ C min { m^2 \, \| xi \|^(- 2) \( m \| xi \| \)^(- 64) } . $
  Outside this region it is bounded by $C rho^2 \( rho \/ m \)^64$. Multiplying by the required nearest-difference symbols and integrating gives, for a binary piece at side $m$, $\| nabla^r Gamma \| lt.eq C_r m^(- r)$ for every required $r lt.eq 12$. The high-frequency integral has an extra factor $rho^66 m^(- 64)$; increasing $B$ absorbs this factor after each of the finitely many rescalings. Spectral supremum estimates give $parallel Gamma_m parallel lt.eq C \( L m \)^2$ and $parallel nabla^r Gamma_m^(1 \/ 2) parallel^2 lt.eq C_r m^(- 2 \( r - 1 \))$ for $1 lt.eq r lt.eq 6$. For the terminal remainder use the same low- and high-frequency multiplier bounds, with $sans(P)_(m_(*) \/ d_rho)$ in place of the shell difference. Positive-order spectral suprema and the normalized torus Fourier sum split at $\| xi \| = m_(*)^(- 1)$ give the operator and diagonal bounds at scale $m_(*)$ whenever $n gt.eq 2 m_(*)$. In the low region the radial annulus count gives $C_r m_(*)^(- 2 r)$ for the diagonal of $r$ differences, $1 lt.eq r lt.eq 6$; in the high region the same factor $rho^66 m_(*)^(- 64)$ is absorbed by the choice of $B$. These constants do not require an upper bound for $n \/ m_(*)$. Summing the binary pointwise estimates and using their ranges gives the logarithmic kernel bound and the positive-order mixed-distance bounds. A fixed low-frequency annulus in each binary piece gives its strictly positive diagonal lower bound. The Fourier sums have enough frequencies in those annuli by the choice of $D_0$. These are precisely the kernel hypotheses used in Lemmas 29 and 31.
  For convergence of these shells, put $eta = m xi$ and divide the integral at $\| eta \| = \( m \/ rho \)^epsilon$, with a fixed sufficiently small $epsilon > 0$. The tail just estimated is a negative power of $m \/ rho$, even after eight scaled differences. In the inner region,
  $ frac(m, 2 d_rho) arccos \( 1 - Q \( eta \/ m \) \/ 16 \) = u \| eta \| { 1 + O \( \( rho \| eta \| \/ m \)^2 \) } . $
  Taylor expansion of the sine ratios and of the difference multipliers therefore has a power-small integrated error. All quotients are regular at zero, so no additional infrared truncation is required. On the diagonal the continuum integral is
  $ G_L \( 0 \) = frac(1, 2 pi) integral_0^oo \( P_u \( r \) - P_u \( L r \) \) frac(thin upright(d) r, r) = frac(log L, 2 pi) . $
  The last identity follows by integrating from $delta$ to $T$, changing variables in the second term, and sending $delta arrow.b 0$ and $T arrow.t oo$, using $P_u \( 0 \) = 1$ and its decay. This proves Equation (8.9) with geometric summability.
  The multiplier for $D_(upright("uv")) \/ v^2$ tends to one almost everywhere as $rho arrow.r oo$. Outside $\| xi \| < c \/ rho$ it is uniformly bounded. Inside that disk, the bound $C min { m_0^2 \/ rho^2 \, 1 \/ \( rho^2 \| xi \|^2 \) }$ has integral at most $C rho^(- 2) \( 1 + log m_0 \)$. Dominated convergence outside, followed by this vanishing inside contribution, proves Equation (8.10). Range makes the ultraviolet entries identical on all sufficiently large tori.
  For fixed $J$, let $d$ be the largest power of two not exceeding its sup range, and use $m \/ d$ in the polynomial indices. Square symmetry gives $Q \( xi \) = v^2 \| xi \|^2 + O_J \( \| xi \|^4 \)$; inclusion of the nearest neighbors implies that zero is its only Fourier zero. Choose $gamma sup Q < 1$ and repeat the shell and terminal arguments with the fixed range in place of $rho$. The polynomial positivity, range, and ultraviolet energy bound follow directly as before. This proves the fixed-$J$ assertions for the first family.
  We give the estimates for the entry family with its literal, unrescaled polynomial indices. On the Fourier square, $Q \( xi \) asymp_J \| xi \|^2$. For $z = arccos \( 1 - Q \( xi \) \/ 16 \)$ one has exactly $sin \( z \/ 2 \) = sqrt(Q \( xi \) \/ 32)$. The elementary sine bound and the binary identity give
  $ 0 lt.eq sans(P)_t \( xi \) & lt.eq C min { 1 \, \( t sqrt(Q \( xi \)) \)^(- 64) } \,\
D_t \( xi \) := sans(P)_t - sans(P)_(2 t) & = sans(P)_t { 1 - cos^64 \( t z \/ 2 \) }\
 & lt.eq C min { t^2 Q \( xi \) \, thin min \( 1 \, \( t sqrt(Q \( xi \)) \)^(- 64) \) } . $
  Consequently the binary covariance $Delta_t = v^2 D_t \/ Q$ is bounded by $C_J min { t^2 \, \| xi \|^(- 2) min \( 1 \, \( t \| xi \| \)^(- 64) \) }$. It is a polynomial of degree $O \( t \)$, so its range is $C_J t$. Multiplication by the nearest-axis difference symbols and radial integration, split at $\| xi \| = t^(- 1)$, prove $\| nabla_x^a nabla_y^c Delta_t \( x \, y \) \| lt.eq C_(J \, r) t^(- r)$ for $0 lt.eq r = \| a \| + \| c \| lt.eq 12$. Spectral suprema similarly give $parallel nabla^r Delta_t^(1 \/ 2) parallel^2 lt.eq C_(J \, r) t^(2 - 2 r)$ for $0 lt.eq r lt.eq 6$. Summing over the binary sides $t = M \, 2 M \, dots.h \, L M \/ 2$ proves the operator bound at order zero and at orders $2 lt.eq r lt.eq 6$; at order one use directly $\| xi \|^2 v^2 \( sans(P)_M - sans(P)_(L M) \) \/ Q lt.eq C_J$. At positive pointwise order, a piece can contribute only when $t gt.eq c_J "dist" \( x \, y \)$, up to the fixed difference stencil. The geometric sum of $t^(- r)$ then gives $C_(J \, r) \( M + "dist" \( x \, y \) \)^(- r)$, and the same counting at order zero gives the displayed logarithm. On a fixed annulus $c_J \/ t lt.eq \| xi \| lt.eq C_J \/ t$ with its constants sufficiently small, $sans(P)_t$ is bounded below and $1 - cos^64 \( t z \/ 2 \) gt.eq c_J t^2 Q$ for all large $t$. Its integral gives a positive constant to each binary diagonal. This proves the lower bound. Choosing $D_0$ larger than twice the polynomial range constant, enlarged for the fixed difference stencils, makes each retained torus kernel the periodization of its plane kernel with at most one contributing image, and makes its diagonal identical to the plane diagonal. Thus all these bounds hold on the retained tori as stated.
  For the terminal covariance, its nonconstant multiplier is bounded by
  $ C_J \| xi \|^(- 2) min { 1 \, \( M_(*) \| xi \| \)^(- 64) } . $
  Its spectral supremum after $2 r$ differences proves the positive-order operator bound. Splitting the normalized torus Fourier sum at $\| xi \| = M_(*)^(- 1)$ proves the positive-order diagonal bound: the number of modes in every radial dyadic annulus is bounded by its area times $C n^2$, with the same bound for the innermost disk when $n gt.eq 2 M_(*)$. For $1 lt.eq r lt.eq 6$ the resulting sum is at most $C_(J \, r) M_(*)^(- 2 r)$. This argument has no dependence on an upper bound for $n \/ M_(*)$. At order zero the annuli between the smallest nonzero frequency and $M_(*)^(- 1)$ each contribute at most $C_J$, and there are $O \( 1 + log \( n \/ M_(*) \) \)$ of them; the higher-frequency sum is bounded. This proves the stated terminal value-diagonal bound. Polynomial division at zero proves positivity, range, and the asserted energy inequality for $C_(< M)^(upright("en"))$.
  For the stated rate of continuum convergence put $eta = M xi$ and use
  $ Q \( eta \/ M \) = v^2 \| eta \|^2 \/ M^2 + O_J \( \| eta \|^4 \/ M^4 \) \, #h(2em) M / 2 z \( eta \/ M \) = upsilon_(upright("en")) \| eta \| { 1 + O_J \( \| eta \|^2 \/ M^2 \) } . $
  The rescaled multiplier is $v^2 \( sans(P)_M - sans(P)_(L M) \) \/ \( M^2 Q \)$. On $\| eta \| lt.eq M^(1 \/ 100)$, write each sine ratio as $\[ z \/ \( 2 sin \( z \/ 2 \) \) \]^64 \[ sin \( t z \/ 2 \) \/ \( t z \/ 2 \) \]^64$. Taylor’s formula, the preceding two expansions, and the bounds $\| \( sin r \/ r \)^64 \| lt.eq C \( 1 + r \)^(- 64)$ and $\| \( \( sin r \/ r \)^64 \)' \| lt.eq C \( 1 + r \)^(- 64)$ for $r gt.eq 1$ give an error bounded by $C_(J \, L) M^(- 2) \( 1 + \| eta \| \)^(- 60)$ after division by $\| eta \|^2$. At zero the difference of the two sine ratios vanishes quadratically, so this bound extends across the removable quotient. The product of $r$ scaled difference symbols differs from the corresponding derivative symbol by at most $C_r M^(- 1) \| eta \|^(r + 1)$ on this region. These errors are integrable through $r = 8$. On the complementary region both covariance multipliers, times a symbol of order $r$, have integral bounded by
  $ C_(J \, L) integral_(M^(1 \/ 100))^oo t^(r - 65) thin thin upright(d) t lt.eq C_(J \, L) M^(- \( 64 - r \) \/ 100) \; $
  the same estimate bounds the part outside the rescaled Fourier square for the continuum kernel. For $r lt.eq 8$ this is $O \( M^(- 1 \/ 2) \)$. Fourier inversion proves the stated uniform scaled-difference estimate. Its diagonal case and $G_(L \, upsilon_(upright("en"))) \( 0 \) = log L \/ \( 2 pi \)$ give $\| delta_j^(upright("en")) \| lt.eq C_(J \, L) \( m L^j \)^(- 1 \/ 2)$. The mean-value bound for $e^(- a' delta \/ 2)$, uniformly on $I$, now proves the displayed summable estimate. The fixed parameter $upsilon_(upright("en"))$ can leave every compact interval when $J$ varies, which is why this second argument is not a spread-out estimate. ◻
]

We use the block geometry, analytic point norm, and exponential regulator of Lemmas 28 and 29; the activity-weight base is denoted by $A$, to distinguish it from $A_0$. Activities have a collar of width $rho$ rather than one nearest-neighbor step. Since $rho lt.double m_0$, enlarging the fixed connection radii contains these collars without changing the counting or regulator proofs. Activities are real, even, periodic under common translations by $2 pi \/ alpha$, and covariant under block translations and square symmetries. Bulk norm parameters can be chosen independently of sufficiently large $rho$.

#thm([Proposition 8.2.])[
  (Microscopic smallness).  #emph[For $a'$ in a fixed compact interval containing $k_0$ or lying above it, the two ultraviolet integrations have the exact block representation 
#[#set math.equation(numbering: n => "(8.11)")
 $ K_0 \( X \) = upright(bold(1))_(X = { B }) { s e_B^0 \/ 2 + z_0 c_B^alpha } + cal(R)_0 \( X \) \, #h(2em) z_0 = 2 m_0^2 e^(- a' D_(upright("uv")) \/ 2) . $ <wh:initial-activity>]

 For spread-out $J_rho$, choose $1 \/ 2 < gamma' < gamma$ and put $delta_0 = e^(- gamma' a' v^2 \/ 2)$. For exponentially small $s$, 
#[#set math.equation(numbering: n => "(8.12)")
 $ parallel cal(R)_0 parallel lt.eq C rho^C \( \| s \| + delta_0 \)^2 \, #h(2em) parallel partial_s cal(R)_0 parallel lt.eq C rho^C \( \| s \| + delta_0 \) . $ <wh:uv-sharp>]

 Thus, uniformly on $\| s \| lt.eq C' z_0$, these bounds are $o \( z_0 \)$ and $o \( 1 \)$, respectively. Uniformly towards unbounded $a'$, it suffices to use the weaker bounds $C rho^C \( s^2 + delta_0 \)$ and $C rho^C \( \| s \| + delta_0 \)$, and the designated cosine may be absorbed in the remainder. For fixed $J$ these weaker bounds hold with $C_J$ and any fixed $0 < gamma' < gamma$ when $a'$ is sufficiently large.]
] <wh:uv>

#proof[
  Write the first Gaussian field as $eta + zeta$, where $"Cov" \( eta \) = gamma v^2 "Id"$ and $"Cov" \( zeta \) = C_(upright("uv"))$. Conditioning each $eta_x$ on the comb gives the periodic density
  $ w \( t \) = sum_(q in bb(Z)) e^(- q^2 a' gamma v^2 \/ 2) e^(i q alpha t) . $
  Expand in occupied site factors $w \( phi.alt_x + zeta_x \) - 1$ and in occupied oriented-edge factors
  $ e^(s E_ell \( phi.alt + zeta + eta \) \/ 2) - 1 \, #h(2em) E_(\( x \, y \)) \( psi \) = frac(\( psi_(x + y) - psi_x \)^2, 2 \| J \| v^2) . $
  Assign an edge to the block of its base vertex and group all occupied factors by the enlarged block connectivity. Gaussian range and the retained collars give exact factorization between separated components. This is the initial instance of the algebra in Proposition 33.
  Here are estimates justifying the expansion and its derivatives. An occupied site costs $delta_0$ in the analytic point norm; its Fourier derivatives introduce powers of $alpha \| q \|$ and factors $e^(h_0 alpha \| q \|)$, absorbed by the gap $gamma - gamma'$. An occupied edge costs $C \| s \|$, using $\| e^(s E \/ 2) - 1 \| lt.eq C \| s \| \( 1 + E \) e^(c E)$ for a fixed arbitrarily small $c$. For conditional derivatives one differentiates the shifted Gaussian density while keeping the constrained lattice value fixed. At the at most twice as many touched endpoints as occupied edges, the resulting weights are bounded by
  $ C exp { h_0 \| eta_x \| \/ \( gamma v^2 \) + h_0^2 \/ \( 2 gamma v^2 \) } . $
  The conditional normalizer and its inverse have the same estimates, since $w = 1 + O \( delta_0 \)$ uniformly in its argument. These bounds are uniform also for the first two conditional moments, with polynomial factors absorbed by the same exponential slack.
  The field energy from a selected set of edges is bounded by a constant times the regulator gradient energy on their collars. Indeed, resolve each $y$ into an axis path of length at most $C \| y \|$ and apply Cauchy–Schwarz along the path. Summing its translates and then its coefficient $1 \/ \( \| J \| v^2 \)$ uses $sum_(y in J) \| y \|^2 = 4 \| J \| v^2$, and gives a bounded constant. For the $zeta$ energy, put $c = \( \| J \| v^2 \)^(- 1)$ and let $sans(B)$ have one row per oriented interaction edge, with $\( sans(B) psi \)_ell = sqrt(c \/ 2) thin nabla_ell psi$. Both edge orientations are included, so $sans(B)^(*) sans(B) = A_0$ and $E_ell \( psi \) = \| \( sans(B) psi \)_ell \|^2$. For a selected edge set $S$, let $sans(B)_S$ be the row restriction and $T_S = sans(B)_S C_(upright("uv")) sans(B)_S^(*)$. Equation (8.7) implies
  $ parallel sans(B) C_(upright("uv"))^(1 \/ 2) parallel^2 = parallel C_(upright("uv"))^(1 \/ 2) A_0 C_(upright("uv"))^(1 \/ 2) parallel lt.eq 1 \, #h(2em) 0 lt.eq T_S lt.eq "Id" \, #h(2em) "tr" T_S lt.eq \| S \| . $
  Gaussian diagonalization therefore gives, for $0 lt.eq tau < 1 \/ 2$,
  #[#set math.equation(numbering: n => "(8.13)")
   $ bb(E) exp {tau sum_(ell in S) E_ell \( zeta \)} = det \( "Id" - 2 tau T_S \)^(- 1 \/ 2) lt.eq exp {frac(tau \| S \|, 1 - 2 tau)} . $ <wh:uv-edge-moment>]
  Here $- log \( 1 - x \) lt.eq x \/ \( 1 - x \)$ bounds each eigenvalue term. Polynomial occupation factors are absorbed by
  $ product_(ell in S) \( 1 + E_ell \) lt.eq C_epsilon^(\| S \|) exp {epsilon sum_(ell in S) E_ell} \, $
  with a fixed reserve below the exponent $1 \/ 2$. Use $E_ell \( phi.alt + zeta + eta \) lt.eq 3 E_ell \( phi.alt \) + 3 E_ell \( zeta \) + 3 E_ell \( eta \)$. The background part is placed directly in the output regulator by the deterministic path estimate; only the selected edge energies of $zeta$ are integrated using Equation (8.13). In particular Lemma 29 is not applied to $C_(upright("uv"))$. For the independent field, each touched vertex is incident to at most $2 \| J \|$ oriented edges, and hence
  $ sum_(ell in S) E_ell \( eta \) lt.eq 2 / v^2 sum_(x upright(" touched")) eta_x^2 . $
  There are at most $2 \| S \|$ touched vertices. Shifted-lattice Gaussian sums with the displayed derivative weights and this sufficiently small quadratic growth are bounded by $C$ per touched vertex, including their normalizers. Combining these facts bounds a term with $r$ occupations by the product of its site and edge costs, times $C^r W_(m_0)^kappa$.
  On one edge, replacing its conditional expectation by the unconditioned linear term costs $C rho^C \( s^2 + \| s \| delta_0 \)$. The unconditioned expectation is exactly $s E_ell \( phi.alt \) \/ 2$ plus a constant. Extract the sum of these constants by the constant-decoration identity of Proposition 33; its nonconstant linear part is $s e_B^0 \/ 2$. A single site’s fundamental Fourier terms, after the $zeta$ integration, have coefficient $2 e^(- a' D_(upright("uv")) \/ 2)$. Summing sites in $B$ gives $z_0 c_B^alpha$. All its higher harmonics cost at least $C delta_0^2$ in the compact-$a'$ regime.
  For a prescribed connected support the local choices for $r$ occupations are bounded by $\( C m_0^2 \| J \| \)^(C r)$, by encoding the counts in each block and the sites and edges for each occupation. At least one occupation is required for every occupied block. Since $m_0$ is polynomial in $rho$, this pays any fixed prescribed initial activity weight. Summing the absolutely convergent expansion with at least two occupations, and the single-occupation errors just identified, proves Equation (8.12). Differentiating the edge factors proves the asserted derivative bound by the identical occupation sum with one power of $\| s \|$ removed. The weaker bounds follow by putting all site occupations, including the fundamental one, in the remainder. For fixed $J$ all counting factors are fixed, so the same proof gives its asserted version. Finally, since $gamma' > 1 \/ 2$ and $D_(upright("uv")) = v^2 \( 1 + o \( 1 \) \)$, the exponent in $delta_0^2 \/ z_0$ is strictly negative for large $rho$; polynomial factors do not affect the stated $o \( z_0 \)$ conclusion. ◻
]

=== 8.2 The exact local map <the-exact-local-map>

At scale $m = m_(upright("start")) L^j$, use either the first shell family with $m_(upright("start")) = m_0$, or the fixed-$J$ entry family with any sufficiently large integral $m_(upright("start"))$. Write $lambda_j$ for its exact fundamental multiplier, namely $lambda_j^(upright("en"))$ in the entry case. Split off the two singleton interactions $t e_B^0 \/ 2 + z c_B^alpha$ and denote the measured remainder by $R$. Assign their complete Gaussian expectations to the containing coarse singleton, extracting the constant part of the gradient expectation. The surviving coefficients are exactly $t$ and $lambda_j z$. For small remainder supports localize the neutral part to constants and $e_B^0 \/ 2$, and its fundamental charged part to $c_B^alpha$. All these are linear operations on the activity being localized.

We spell out the two modifications of the localizations in Lemma 30. If $D^X$ is the Hessian on affine fields in the standard axes, for each $y in J$ take the orthonormal frame $\( y \, R_(pi \/ 2) y \) \/ \| y \|$. In this frame use the two differences with steps $y \, R_(pi \/ 2) y$, multiply by $m \/ \| y \|$, transform the resulting vector back to the standard axes, and average the resulting quadratic forms with weights $\| y \|^2 \/ \( 4 \| J \| v^2 \)$. Average both orientations as in Lemma 30. These weights sum to one. Axis-path Taylor bounds with nearest second differences control the affine replacement error by the same $L^(- 3)$ estimate, since $\| y \| lt.double m$. The prescription commutes with reflections as well as rotations; a reflection interchanges the frame orientations. After summing over $X$ at a fixed block, square symmetry makes its Hessian $d "Id"$. For such a Hessian the assigned expression is exactly

$ & frac(1, 2 m^2) sum_(x in B) sum_(y in J) frac(\| y \|^2, 4 \| J \| v^2) thin d frac(m^2, \| y \|^2) { \( partial_y phi.alt_x \)^2 + \( partial_(R_(pi \/ 2) y) phi.alt_x \)^2 } = d / 2 e_B^0 \( phi.alt \) . $

Thus the localization preserves the actual long-range energy, including its allocation to fine and coarse blocks.

For a fundamental projection on a small support $X$, evaluate the Gaussian expectation on constant fields; divide the coefficient by $\| X \|$ and assign it times $c_B^alpha$ to each $B in X$. Evenness cancels the sine coefficients. For $sqrt(k_0) lt.eq alpha lt.eq 2 sqrt(k_0)$, perform the charged contour shift of Lemma 31 with $i "sgn" \( q \) alpha Gamma_m \( dot.op \, v_0 \)$. The density cost and constant character together give

#[#set math.equation(numbering: n => "(8.14)")
 $ exp { - alpha^2 \( \| q \| - 1 \/ 2 \) Gamma_m \( 0 \, 0 \) } . $ <wh:charge-shift>]

Positive-order kernel bounds show that the nonconstant covariance column has bounded fine test norm independently of $L$. Choose $h_0$ large enough to contain this residual with strict radius reserve. The coarse constant derivative factors $e^(h_0 alpha \| q \|)$ are then paid by Equation (8.14) for $L$ large. Every $\| q \| gt.eq 2$ has spare powers of $L$. For $\| q \| = 1$ the gain is exactly $lambda_j L^(- 2)$, where $lambda_j$ is the fundamental multiplier of the chosen shell family. It is at most $C L^(- 2)$ on a fixed one-sided interval $k_0 lt.eq a' lt.eq k_0 + delta_(upright("ref"))$ with $0 < delta_(upright("ref")) < 3 k_0$ fixed and sufficiently small, once the summable diagonal errors are small. Factoring its character at an anchor in $B$, subtraction of the constant-background coefficient leaves a first Taylor difference. On the small support its nonconstant argument and each coarse direction have fine test size $C L^(- 1) \( 1 + sqrt(U_(L m)) \)$ and $C L^(- 1)$, respectively. The unused analytic radius and the small-support regulator slack absorb this fixed polynomial, giving the further factor $L^(- 1)$. Averaging the anchor over $B$ proves the claimed localization with $c_B^alpha$. By Lemma 69 the diagonal error is arbitrarily small by taking $rho$ large, or by increasing the starting scale at fixed $J$.

#thm([Proposition 8.3.])[
  (Weak local maps).  #emph[Choose the regulator parameters and $h_0$ first, then $L$ sufficiently large, and then $A$ sufficiently large depending on $L$. On a fixed small activity ball the exact partition algebra induces analytic maps 
#[#set math.equation(numbering: n => "(8.15)")
 $ vec(t_(+), z_(+), R_(+)) = vec(t + P_j^t R, lambda_j z + P_j^z R, C_j R) + cal(N)_j \( t \, z \, R \) \, quad parallel C_j parallel lt.eq theta < 1 \, quad parallel P_j^t parallel + parallel P_j^z parallel lt.eq C_(L \, A) \, $ <wh:triangular>]

 where $theta$ can be chosen arbitrarily small and 
#[#set math.equation(numbering: n => "(8.16)")
 $ parallel cal(N)_j \( t \, z \, R \) parallel lt.eq C_(L \, A) \( \| t \| + \| z \| + parallel R parallel \)^2 . $ <wh:nonlinear>]

 The same ball has uniform analytic Taylor coefficient and differentiated estimates at fixed $a'$. These assertions hold on a fixed one-sided reference interval $k_0 lt.eq a' lt.eq k_0 + delta_(upright("ref"))$, uniformly in sufficiently spread-out $J_rho$ for the first kernel family. For every fixed $J$, they hold at a sufficiently large starting scale for either the first family or the entry family of Lemma 69.]
  #emph[On a compact subinterval of $a' > k_0$, one may omit the cosine coordinate and leave every charged activity in the remainder. Choose $L$ depending on the gap from $k_0$; then the corresponding map has the same assertions with its $z$ row deleted. For $a' gt.eq 4 k_0$ there is also such a map with a charged contraction uniform in $a'$.]
  #emph[The scalar coefficients obtained on the plane are exactly the torus coefficients through the stopping scale. Torus remainders and their activity derivatives obey the same estimates. Each fixed-support finite recursion and each finite scalar projection is continuous in the parameters while its preceding activities remain in the small ball. This last assertion does not assert norm analyticity under variation of $alpha$.]
] <wh:map>

#proof[
  The preceding neutral and fundamental subtractions give $C L^(- 3)$ in point norm before support counting. There are $O \( L^2 \)$ small fine supports above a prescribed coarse block, with weight ratios bounded independently of $L \, A$. Thus these subtracted linear terms have norm at most $C \/ L$. Large supports have the closure-size gain of Lemma 28, which makes their linear contribution arbitrarily small by increasing $A$ after $L$. The extracted scalar projections are bounded by $C_(L \, A)$. This proves the triangular linear part and $parallel C_j parallel lt.eq theta$.
  Apply Proposition 33 with the enlarged collars. Temporary connectivity contains the covariance range, so convolution factorizes; all exclusions on an original support are retained when a localized piece is relocated to a singleton. Only small supports shrink, and their coarse diameter is at most one; hence separated final components carry no remaining mutual exclusion. Constant decorations are removed by their convergent inverse series. The counting and product estimates in that proposition bound every term with at least two inputs by $C_(L \, A) \( \| t \| + \| z \| + parallel R parallel \)^2$. They also converge absolutely for complex activities in the same real-field norm. Bounded multilinear sums and the constant inverse series prove analyticity and the differentiated bounds, without an appeal to analytic dependence on the period.
  If $a' > k_0$ stays in a compact interval, the fundamental charged estimate before counting is $C L^(- a' \/ \( 4 pi \))$. Its product with the $O \( L^2 \)$ small-support count is uniformly small once $L$ is chosen for the positive gap, so fundamental localization is unnecessary. For $alpha gt.eq 2 sqrt(k_0)$ use a contour shift of the fixed size $2 sqrt(k_0)$. Its gain is $exp { - \[ 2 sqrt(k_0) alpha \| q \| - 2 k_0 \] Gamma_m \( 0 \, 0 \) }$. The coefficient is already at least $2 k_0$ for $\| q \| = 1$ and increases linearly with $alpha \| q \|$. Taking $L$ large pays the output constant derivative factors uniformly and leaves at least $L^(- 4)$ in point norm. This proves both no-cosine variants.
  A small output support depends on predecessor data within a fixed number of its blocks: convolution uses a fixed enlargement, relocations originate only from small supports, and normalization adds singleton decorations. Iterating these dependencies contributes a geometric sum of smaller physical radii, bounded by a fixed multiple of the current scale. With $D_0$ larger than this multiple, the needed covariance entries and activities unwrap identically to the plane. Large torus supports retain the closure-size contraction and need not be identified with plane supports. Applying the same norm estimates inductively proves the torus assertion, and applying their differentiated forms proves its derivative assertion. At fixed depth, absolute expansions or dominated Gaussian integrals with regulator reserve give continuity in all parameters of every fixed local coefficient. Uniform geometric tails then give continuity of the scalar projection series used below. ◻
]

=== 8.3 Balancing and the quadratic coefficients <balancing-and-the-quadratic-coefficients>

Let $0 lt.eq mu = 1 - lambda lt.eq mu_0$, with $mu_0$ small enough that $lambda > theta$. In this subsection $lambda_j$ denotes the exact multiplier of the chosen family: Equation (8.9) for the first family, and $lambda_j^(upright("en"))$ for the entry family. The operators $C_j \, P_j^t \, P_j^z$ are likewise those of that family’s map. Define

$ ell_j = product_(h gt.eq j) lambda_h / lambda \, #h(2em) C_(h : j) = C_(h - 1) dots.h.c C_j quad \( h > j \) \, #h(2em) C_(j : j) = "Id" . $

The corresponding summable diagonal estimate makes the product convergent and $ell_j = 1 + o \( 1 \)$ uniformly. Set

#[#set math.equation(numbering: n => "(8.17)")
 $ T & = t + sum_(h gt.eq j) P_h^t C_(h : j) R \,\
Z & = ell_j z + sum_(h gt.eq j) lambda^(- \( h + 1 - j \)) ell_(h + 1) P_h^z C_(h : j) R . $ <wh:T-balance>]

Both series converge in operator norm, since their tails are bounded by $C theta^r$ and $C \( theta \/ lambda \)^r$. The identities $ell_(j + 1) lambda_j = lambda ell_j$ and cancellation of the first term in each series show directly that the linear part is $\( T \, Z \, R \) mapsto \( T \, lambda Z \, C_j R \)$.

#thm([Proposition 8.4.])[
  (Balanced map).  #emph[On a fixed small norm ball the maps in these coordinates have the form 
#[#set math.equation(numbering: n => "(8.18)")
 $ T_(+) & = T + b_j^(t t) T^2 + b_j^(z z) Z^2 + E_(1 \, j) \,\
Z_(+) & = \( 1 - mu \) Z + b_j^(t z) T Z + E_(2 \, j) \,\
R_(+) & = C_j R + O \( \( \| T \| + \| Z \| + parallel R parallel \)^2 \) \,\
\| E_(i \, j) \| & lt.eq C { \( \| T \| + \| Z \| \)^3 + \( \| T \| + \| Z \| \) parallel R parallel + parallel R parallel^2 } . $ <wh:balanced-equations>]

 All errors are analytic in the activity coordinates with the corresponding Taylor and derivative estimates. Under half-period translation the scalar coordinates have parities $T mapsto T$ and $Z mapsto - Z$; this accounts for all displayed quadratic monomials on pure scalar inputs.]
] <wh:balanced-map>

#proof[
  The linear changes in Equations (8.17) and (8.17), together with their inverses, are uniformly bounded on the product space. Apply them to the analytic expansion in Proposition 71, keep the quadratic terms containing only $T \, Z$, and place every term with a factor $R$ in the displayed error. The quadratic terms in $R_(+)$ have the same bound by the inverse coordinate change. Translation by $pi \/ alpha$ commutes with convolution, reblocking, and localization, preserves energy, and changes the sign of the fundamental cosine. The projection series commute with this involution as well. Its even and odd scalar parities exclude $T Z$ from the first equation and $T^2 \, Z^2$ from the second. Cauchy estimates on a smaller fixed ball give all claimed differentiated bounds. ◻
]

#thm([Proposition 8.5.])[
  (The secular quadratic terms).  #emph[In the continuum limit at $a' = k_0$, the balanced coefficients are independent of the scale and satisfy 
#[#set math.equation(numbering: n => "(8.19)")
 $ b^(t t) = 0 \, #h(2em) b^(t z) = - b < 0 \, #h(2em) b^(z z) = - H < 0 . $ <wh:coefficient-signs>]

 The positive numbers $b \, H$ stay in compact subintervals of $\( 0 \, oo \)$ as $u$ ranges over the compact interval in Lemma 69. Consequently, given $epsilon > 0$, one can first take $mu_0$ small and then $rho$ large so that, uniformly in $j$, $\| b_j^(t t) \| lt.eq epsilon$ and $- b_j^(t z) \, - b_j^(z z)$ lie in fixed compact positive intervals. For every fixed $J$ the same conclusion follows by making the starting scale sufficiently large. At that fixed $J$ the coefficients converge to their continuum limits as $j arrow.r oo$ when $a' = k_0$.]
  #emph[For the fixed-$J$ entry family, use its own multipliers $lambda_j^(upright("en"))$ and its own projection operators in the same balanced coordinates. Its critical continuum coefficients are 
$ b_(upright("en"))^(t t) = 0 \, #h(2em) b_(upright("en"))^(t z) = - b_(upright("en")) \, #h(2em) b_(upright("en"))^(z z) = - H_(upright("en")) \,\
b_(upright("en")) = 2 log L \, #h(2em) H_(upright("en")) = frac(8 pi dot.op pi, 4) e^(8 pi c_(upsilon_(upright("en")))) log L > 0 \,\
upsilon_(upright("en")) = v / sqrt(32) . $

 At this fixed $J$, the corresponding discrete coefficients converge to these limits at criticality and have the stated positive bounds on a sufficiently small one-sided reference interval once $m$ is large. If $d$ is the largest power of two not exceeding the sup range of $J$, then $u_(upright("wh")) = v \/ \( d sqrt(32) \)$ is the width of the first fixed-$J$ family at the same block ratio, and $H_(upright("en")) = d^4 H_(upright("wh"))$, whereas $b_(upright("en")) = b_(upright("wh"))$. These entry-family bounds are not uniform in a varying $J$.]
] <wh:quadratic-coefficients>

#proof[
  We first justify the limiting calculation, and only then calculate its coefficients. A quadratic coefficient in the balanced map is the quadratic image of its two singleton inputs followed by the linear projection series. Truncating those series at depth $r$ costs at most $C theta^r$ (or $C \( theta \/ lambda \)^r$). At any fixed depth there are finitely many connected block configurations: quadratic images of pure singleton inputs have bounded size, and each step has bounded range in the rescaled block coordinates. Each coefficient is thus a finite volume-normalized sum of Gaussian polynomial/character expectations and their Taylor projections on constant or affine backgrounds. Lemma 69 gives convergence of every covariance and derivative entering these expectations. The rescaled difference in direction $y$, divided by $\| y \|$, converges to its directional derivative; the weighted sum of its squares converges to $integral_B \| nabla phi.alt \|^2$. The frame prescription has the same limit even before its Hessian is scalar, because two frame derivatives transformed back to the axes recover the entire usual gradient. Spatial Riemann sums and Gaussian moment formulas therefore give convergence at finite depth. Uniform geometric tails permit sending $r arrow.r oo$ afterwards. This proves existence of the limiting quadratic map. Its kernels are related by dilation, so its coefficients are independent of scale, and $ell_j = lambda = 1$ at marginality.
  To identify the coefficients, start at side one with the exponential interaction of $t e_B^0 \/ 2 + z c_B^alpha$ and iterate $r$ shells, with $M = L^r$. At order one its remainder is zero, and its order-two initial remainder is bounded independently of $r$. At order two the marginal increments add, while $R_(j + 1)^(\( 2 \)) = C_j R_j^(\( 2 \)) + O \( 1 \)$ keeps the remainder coefficients uniformly bounded. Thus the final scalar quadratic coefficients are $r$ times the unknown coefficients in Equation (8.19), up to bounded errors. The unbalanced coordinates have the same leading terms because their difference from the balanced coordinates is a bounded projection of $R^(\( 2 \))$. This argument is a finite-order calculation in the exact block algebra; no infinite-volume interacting measure is assumed to exist for nonzero formal $t \, z$.
  Two diagnostics read these scalar terms. The first is the fundamental cosine coefficient of the connected log density per output block on a constant background. The second is its neutral Hessian in $g_1$ on the affine background $theta + g dot.op x \/ M$, after averaging $theta$ over one period. Here connected log density means only its Taylor polynomial through degree two, computed in a large box and then per output block with boundary terms removed. At fixed $r$ all its kernels have bounded range. The linear singleton terms read $z$ and $t$ exactly; the linear remainder terms are bounded by the activity norm. The degree-two connected terms of the unchanged first-order singleton inputs are also bounded in output block units. An affine derivative may be anchored in its cluster because of the neutral phase average, and the resulting fixed powers of its diameter are summable against its exponential support weight. Therefore each diagnostic differs from its output scalar coefficient by $O \( 1 \)$, uniformly in $r$. Extracted constants disappear from both diagnostics. These facts justify reading the secular coefficients from the original Gaussian integral rather than from its block representation.
  That integral uses the covariance $G_M$ in Equation (8.8), with $G_M \( 0 \) = log M \/ \( 2 pi \)$. In the $t^2$ contribution to the neutral gradient Hessian, a background gradient can occur only in a linear gradient fluctuation. Its covariance integrates to a derivative integral of $G_M$, hence to zero. Boundary terms vanish on taking the per-block limit because this kernel has finite range. There is no $t^2$ secular term.
  For the mixed term, Gaussian differentiation gives
  $ & "Cov" (1 / 2 \| nabla zeta \( x \) \|^2 \, cos \( alpha \( theta + zeta \( y \) \) \))\
 & #h(20mm)  = - alpha^2 / 2 \| nabla G_M \( x - y \) \|^2 e^(- alpha^2 G_M \( 0 \) \/ 2) cos \( alpha theta \) . $
  The output block area therefore makes the mixed diagnostic
  #[#set math.equation(numbering: n => "(8.20)")
   $ - alpha^2 / 2 M^2 e^(- alpha^2 G_M \( 0 \) \/ 2) integral_(bb(R)^2) \| nabla G_M \( x \) \|^2 thin upright(d) x . $ <wh:mixed-diagnostic>]
  Parseval and radial integration show
  $ integral \| nabla G_M \|^2 = frac(1, 2 pi) integral_0^oo \( P_u \( r \) - P_u \( M r \) \)^2 frac(thin upright(d) r, r) = frac(log M, 2 pi) + O \( 1 \) . $
  For example, subtract the indicator of $\[ M^(- 1) \, 1 \]$ in this last integral; near each endpoint its error is integrable uniformly by $P_u \( r \) = 1 + O \( r^2 \)$ and $P_u \( r \) = O \( r^(- 64) \)$. At $alpha^2 = 8 pi$, $M^2 e^(- alpha^2 G_M \( 0 \) \/ 2) = 1$. Dividing Equation (8.20) by $r = log M \/ log L$ gives
  #[#set math.equation(numbering: n => "(8.21)")
   $ b = frac(alpha^2, 4 pi) log L = 2 log L > 0 . $ <wh:b-value>]
  For the $z^2$ term, averaging the phase in the connected product of two cosines gives
  $ 1 / 2 e^(- alpha^2 G_M \( 0 \)) \( e^(alpha^2 G_M \( x - y \)) - 1 \) cos #scale(x: 120%, y: 120%)[\(] alpha g dot.op \( x - y \) \/ M #scale(x: 120%, y: 120%)[\)] . $
  The second-cumulant factor $1 \/ 2$ and two derivatives in $g_1$, with output area $M^2$ cancelling the affine scaling, give
  #[#set math.equation(numbering: n => "(8.22)")
   $ - alpha^2 / 4 e^(- alpha^2 G_M \( 0 \)) integral_(bb(R)^2) x_1^2 \( e^(alpha^2 G_M \( x \)) - 1 \) thin upright(d) x . $ <wh:neutral-diagnostic>]
  We verify its logarithmic asymptotics, including its sign. Put
  $ F_u \( x \) = integral_(bb(R)^2) frac(1 - cos \( eta dot.op x \), \| eta \|^2) P_u \( eta \) frac(thin upright(d) eta, \( 2 pi \)^2) . $
  Radial integration gives $F_u \( x \) = \( 2 pi \)^(- 1) log \| x \| + d_u + o \( 1 \)$ as $\| x \| arrow.r oo$, uniformly for $u$ in a compact interval. One direct proof replaces $P_u$ by the indicator of a unit radial disk: their difference is integrable in $thin upright(d) r \/ r$ because it is $O \( r^2 \)$ at zero and decays at infinity. In the disk term the circle character average at argument $t$ is $O \( t^(- 1 \/ 2) \)$. This bound follows by excluding arcs of size $t^(- 1 \/ 2)$ about its two stationary angles and integrating by parts on the remaining arcs. Its radial integral therefore has a convergent constant after subtraction of $log \| x \|$. The same proof yields $F_u \( x \) = \( 2 pi \)^(- 1) log \( 1 + \| x \| \) + O \( 1 \)$ globally.
  Since $G_M \( x \) = G_M \( 0 \) - F_u \( x \) + F_u \( x \/ M \)$, writing $c_u = - d_u$ gives
  #[#set math.equation(numbering: n => "(8.23)")
   $ G_M \( x \) = frac(1, 2 pi) log frac(M, \| x \|) + c_u + o \( 1 \) quad \( 1 lt.double \| x \| lt.double M \) \, #h(2em) G_M \( x \) lt.eq frac(1, 2 pi) log^(+) frac(M, 1 + \| x \|) + C . $ <wh:intermediate-log>]
  For completeness the finite range and logarithmic error also have an elementary radial representation. The function $sin \( u \| eta \| \) \/ \( u \| eta \| \)$ is the characteristic function of the planar projection of the uniform probability measure on the sphere of radius $u$ in $bb(R)^3$: rotate $eta$ to an axis and integrate the uniform axial coordinate on $\[ - u \, u \]$. Thus $P_u$ is the Fourier transform of its $64$-fold convolution, a radial probability density $q_u$ supported in the disk of radius $R_u = 64 u$. It is bounded and smooth to every order used here, as follows from the integrability of $\| eta \|^r P_u \( eta \)$ for these orders. The fundamental-solution identity $Delta log \| x \| = 2 pi delta_0$ gives
  $ F_u \( x \) = frac(1, 2 pi) integral q_u \( y \) { log \| x - y \| - log \| y \| } thin upright(d) y . $
  Both sides vanish at zero and have Laplacian $q_u$; the radial harmonic difference is therefore zero. Angular averaging of the logarithm is $log max { \| x \| \, \| y \| }$, by its mean-value identity inside or outside the corresponding circle. Consequently $F_u \( x \) = \( 2 pi \)^(- 1) log \| x \| - c_u$ exactly for $\| x \| gt.eq R_u$, where $c_u = \( 2 pi \)^(- 1) integral q_u \( y \) log \| y \| thin upright(d) y$. The scaling $q_u \( y \) = u^(- 2) q_1 \( y \/ u \)$ also proves $c_u = c_1 + \( log u \) \/ \( 2 pi \)$. The formula for $G_M$ now shows $G_M \( x \) = 0$ for $\| x \| gt.eq M R_u$, confirming the claimed range without inferring pointwise positivity from spectral positivity. At $alpha^2 = 8 pi$, the integrand in Equation (8.22) has prefactor $M^(- 4)$. On intermediate logarithmic shells its radial part is $e^(8 pi c_u) thin upright(d) \| x \| \/ \| x \|$, and $integral_0^(2 pi) cos^2 theta.alt thin upright(d) theta.alt = pi$. The regions $\| x \| lt.eq R_u$ and the $- 1$ term contribute $O \( 1 \)$, uniformly on compact $u$ intervals. On $R_u lt.eq \| x \| lt.eq M R_u$ the exact formula for $F_u$ makes the exponential part of the radial integral
  $ pi e^(8 pi c_u) integral_(R_u)^(M R_u) e^(8 pi F_u \( r \/ M \)) frac(thin upright(d) r, r) = pi e^(8 pi c_u) log M + O \( 1 \) . $
  Indeed $F_u \( t \) = O \( t^2 \)$ near zero, and after $t = r \/ M$ the integral of $\( e^(8 pi F_u \( t \)) - 1 \) \/ t$ is bounded on $\[ 0 \, R_u \]$. It follows that
  #[#set math.equation(numbering: n => "(8.24)")
   $ H = frac(alpha^2 pi, 4) e^(8 pi c_u) log L > 0 . $ <wh:H-value>]
  The continuity and boundedness of $c_u$ on the compact $u$ interval make this positivity uniform. The finite-depth convergence proved at the start, first uniformly in small $mu$ and then in the summable lattice error, now proves all discrete assertions of the proposition. This computes both signs directly in the compensated positive-gradient convention of Equation (8.2).
  For the entry family, the fixed-depth Gaussian expectations at the start of the proof converge by its order-eight scaled-difference bound, and the same geometric projection tails are uniform once its own diagonal errors are small. The localizations and normalized singleton inputs are unchanged: in particular $c_B^alpha = M^(- 2) sum_(x in B) cos \( alpha phi.alt_x \)$ converges to the unit-block cosine integral in both families. The limiting calculation therefore uses $G_(M \, upsilon_(upright("en")))$ in the two diagnostics. Equations (8.21) and (8.24) give precisely $b_(upright("en"))$ and $H_(upright("en"))$ displayed above. The identity $c_u = c_1 + \( log u \) \/ \( 2 pi \)$ gives $e^(8 pi \( c_(upsilon_(upright("en"))) - c_(u_(upright("wh"))) \)) = d^4$. No coordinate factor changes this number: the balanced factor $ell_j$ tends to one at criticality in either continuum limit. ◻
]

=== 8.4 Shooting away from marginality <shooting-away-from-marginality>

#thm([Proposition 8.6.])[
  (A vanishing-activity shot).  #emph[In each of the following regimes there is a choice of the input $s$ in Equation (8.2) for which all interaction activities tend to zero exponentially in scale:]
  + #emph[$J = J_rho$, a prescribed fixed $a' > k_0$, and $rho$ sufficiently large;]
  + #emph[an arbitrary fixed admissible $J$ and $a'$ sufficiently large.]
  #emph[The shot satisfies $\| s \| lt.eq C x_(*)$, where $x_(*)$ is exponentially small in $a' v^2$ in (i), and $x_(*) lt.eq C_J e^(- c_J a')$ in (ii). At the input $k = a' \/ \( 1 - s \)$ its actual structural coefficient is exactly $a'$.]
] <wh:gapped-shooting>

#proof[
  Use the no-cosine map of Proposition 71. In (i) take $L$ for the gap $a' - k_0$ and then $rho$ large; in (ii) use its uniform high-frequency contraction. Balance $t$ by Equation (8.17), now with no $Z$ coordinate. The recursion is
  $ T_(j + 1) = T_j + O \( \( \| T_j \| + parallel R_j parallel \)^2 \) \, #h(2em) R_(j + 1) = C_j R_j + O \( \( \| T_j \| + parallel R_j parallel \)^2 \) . $
  Proposition 70, after allowing exponent slack, supplies $parallel R_0 parallel lt.eq C x_(*)$ and $T_0 = s + O \( x_(*) \)$ on $\| s \| lt.eq C' x_(*)$. The constant in the last $O \( x_(*) \)$ can be made independent of any fixed $C'$: the dependence on $s$ outside its linear term is at most $C \( s^2 + \| s \| delta_0 \)$ and hence is $o \( x_(*) \)$ on every such interval.
  Choose $theta < theta_3 < 1$ and a fixed large envelope constant $D$. While
  #[#set math.equation(numbering: n => "(8.25)")
   $ \| T_j \| lt.eq D x_(*) theta_3^j $ <wh:shoot-envelope>]
  holds, the remainder recursion and geometric summation imply $parallel R_j parallel lt.eq D_R x_(*) theta_3^j$ for a fixed $D_R$: its forced contribution is bounded by $C x_(*)^2 sum_(h < j) theta^(j - 1 - h) theta_3^(2 h)$, which is at most $C' x_(*)^2 theta_3^j$. This estimate also propagates torus remainders through their stopping scales. Choose $C'$ so that the two endpoints $s = plus.minus C' x_(*)$ start outside the two opposite sides of Equation (8.25).
  If equality first occurs at scale $j$, then $\| T_(j + 1) - T_j \| lt.eq C x_(*)^2 theta_3^(2 j)$, whereas the envelope decreases by $D \( 1 - theta_3 \) x_(*) theta_3^j$. For small enough $x_(*)$ the next iterate exits strictly on the same side. A strict exit persists under a sufficiently small change of $s$ by finite-time continuity. Thus the sets of parameters eventually exiting on the positive and on the negative side are disjoint relatively open sets; when equality occurs its strict next exit gives the same openness. Both sets are nonempty. If there were no survivor, they would disconnect the shooting interval, which is impossible. The maps can be evaluated for the one extra step at an exit because the whole enlarged envelope lies in their fixed small domain. A survivor obeys Equation (8.25) and the remainder estimate at all scales, proving decay of every activity.
  It remains to identify the shot with the physical coefficient. For a smooth mean-zero continuum test $f$, let $f_n$ be its sampled lattice source including the area $n^(- 2)$ and discrete mean subtraction. Completing the Gaussian square in the original comb integral gives the prefactor $exp { \( f_n \, A_0^(- 1) f_n \) \/ 2 }$ for the $phi.alt$ field and the ratio of the full interaction integrals at the translated background $F_n = A_0^(- 1) f_n$ and at zero. This translation includes the constraint itself before ultraviolet integration. Therefore all field-independent constants extracted at every scale cancel exactly in the ratio. At $m_(*)$ there are boundedly many blocks. The terminal field obeys the regulator estimates with reserve; $F_n$ and its first two scaled differences are uniformly bounded by discrete Fourier summation of the smooth sampled source. The activity decay thus makes each of the two terminal interaction averages tend to one, by the finite block expansion and dominated Gaussian integration. Finally,
  $ \( f_n \, A_0^(- 1) f_n \) arrow.r \( f \, \( - Delta_(bb(T)) \)^(- 1) f \)_(L^2 \( bb(T)^2 \)) $
  by the quadratic symbol at zero and the rapid Fourier decay of $f$. Since $sigma = sqrt(a') phi.alt$, the height Laplace limit has coefficient $a'$. We next prove positivity of the structural coefficient at this input using only its unconditional free-rectangle upper bound, before using the positive-coefficient transfer theorem.
  Fix a nonzero smooth real mean-zero $f$ and let $g = \( - Delta_(bb(T)^2) \)^(- 1) f$, with zero mean. Write $g_n$ for its sample and $"Var"_(bb(T)_n)$ for variance in the physical height law on the torus of side $n$. For a fixed integer $q gt.eq 2$, partition a fundamental square into $q^2$ axis rectangles by rounding the cuts $i n \/ q$, $0 lt.eq i lt.eq q$, and delete every interaction edge joining different rectangles or crossing the fundamental-square seam. For all sufficiently large $n$, these are free rectangles of side comparable to $n \/ q$. Define
  $ X_n = \( sigma \, A_0 g_n \) \, #h(2em) X_n^(upright("cut")) = sum_(B upright(" in the partition")) \( sigma \|_B \, A_B g_n \|_B \) . $
  There are at most $C_(J \, q) n$ deleted edges, and periodic smoothness gives $\| nabla_e g_n \| lt.eq C_(J \, g) \/ n$ on all of them, including the wraparound edges. The difference $X_n - X_n^(upright("cut"))$ is represented by these edge flows with weights $c_e nabla_e g_n$, so its flow cost in Equation (2.2) is at most $C_(J \, q \, g) \/ n$. Lemma 4 therefore gives
  #[#set math.equation(numbering: n => "(8.26)")
   $ "Var"_(bb(T)_n) \( X_n - X_n^(upright("cut")) \) lt.eq C_(J \, q \, g) k \/ n . $ <wh:seam-error>]
  Each summand in $X_n^(upright("cut"))$ annihilates the constant on its rectangle. Deleting the crossing precisions and releasing the rectangle constants are thus permissible in the free-graph comparison of Lemma 4. Under the cut law the rectangle representatives are independent, and hence
  $ "Var"_(bb(T)_n) \( X_n^(upright("cut")) \) lt.eq sum_B "Var"_(B \, k) \( sigma \, A_B g_n \|_B \) . $
  For this fixed finite partition, apply the unconditional Equation (2.11) along $n = L^N arrow.r oo$ to each sequence of rectangles. Their rounded endpoints converge to the indicated continuum endpoints. The $L^2$ triangle inequality and Equation (8.26) give
  $ sqrt("Var"_(bb(T)_n) X_n) lt.eq {sum_B "Var"_(B \, k) \( sigma \, A_B g_n \|_B \)}^(1 \/ 2) + C_(J \, q \, g) sqrt(k \/ n) \, $
  and therefore
  #[#set math.equation(numbering: n => "(8.27)")
   $ limsup_(N arrow.r oo) "Var"_(bb(T)_(L^N)) \( sigma \, A_0 g_(L^N) \) lt.eq a \( k \) sum_B integral_B \| nabla g \|^2 = a \( k \) \( f \, \( - Delta_(bb(T)^2) \)^(- 1) f \) . $ <wh:unconditional-torus-upper>]
  No positivity assumption on $a \( k \)$ enters this comparison, and no limit in $q$ is required.
  To replace the gradient observation by the density source used in the shot, put $e_n = f_n - A_0 g_n$. The quadratic symbol and smooth finite differences imply $n^(- 2) sum_x \| n^2 e_n \( x \) \|^2 arrow.r 0$, with $sum_x e_n \( x \) = 0$. The torus Poincaré bound from the nearest-neighbor edges gives
  $ "Var"_(bb(T)_n) \( sigma \, e_n \) lt.eq k \( e_n \, A_0^(+) e_n \) lt.eq C_J k n^2 sum_x \| e_n \( x \) \|^2 arrow.r 0 . $
  Thus Equation (8.27) holds with $f_n$ in place of $A_0 g_n$. Bare Gaussian domination for every fixed real multiple of $f_n$ gives uniform exponential moments; the shot’s Laplace limit consequently gives convergence of its second moments. Its limiting variance is $a' \( f \, \( - Delta_(bb(T)^2) \)^(- 1) f \)$. The energy of the chosen nonzero $f$ is positive, so Equation (8.27) implies $a \( k \) gt.eq a' > 0$. Theorem 17 now applies on the positive branch and identifies the same torus Laplace limit with coefficient $a \( k \)$. Uniqueness on this one nonzero test proves $a \( k \) = a'$, as claimed. ◻
]

#thm([Corollary 8.7.])[
  (Every sufficiently high input).  #emph[For every admissible fixed $J$, the positive-coefficient regime is nonempty and its physical onset is finite. Moreover, 
#[#set math.equation(numbering: n => "(8.28)")
 $ a \( k \) = k + O_J \( e^(- c_J k) \) \, #h(2em) beta_(upright("eff")) \( J \, beta \) = beta + O_J \( e^(- c'_J beta) \) quad \( k \, beta arrow.r oo \) . $ <wh:normalization>]

]
] <wh:high-temperature>

#proof[
  For each sufficiently large $a'$, Proposition 74 gives an input $k \( a' \)$ with $a \( k \( a' \) \) = a'$ and $\| k \( a' \) - a' \| lt.eq C_J e^(- c_J a')$, after absorbing the factor $a'$ into a smaller exponent. This already proves nonemptiness and finite onset by the equivalence of positive coefficient and physical roughness in Corollary 18. To cover every high input $k$, choose $delta_k = e^(- c_J k \/ 2)$ and shoot at $a'_(-) = k - delta_k$ and $a'_(+) = k + delta_k$. For large $k$ the shot errors are less than $delta_k \/ 2$, so $k \( a'_(-) \) < k < k \( a'_(+) \)$. The monotonicity in Proposition 19 gives $k - delta_k lt.eq a \( k \) lt.eq k + delta_k$. This proves the first assertion of Equation (8.28). Substitute $k = beta \/ v^2$ and $beta_(upright("eff")) = v^2 a \( k \)$ to obtain the second. ◻
]

#thm([Corollary 8.8.])[
  (Spread-out onset).  #emph[For the spread-out family, 
$ frac(beta_(upright(c)) \( J_rho \), 8 pi v_(J_rho)^2) arrow.r 1 . $

]
] <wh:spread-out>

#proof[
  Corollary 8 and Corollary 18 give $k_c \( J_rho \) = beta_(upright(c)) \( J_rho \) \/ v_(J_rho)^2 gt.eq 8 pi$. For every fixed $a' > 8 pi$, regime (i) of Proposition 74 gives a rough input $k \( a' \, rho \) = a' + o \( 1 \)$. Hence $limsup_(rho arrow.r oo) k_c \( J_rho \) lt.eq a'$. Letting this fixed $a'$ decrease to $8 pi$ proves the result. The block factor may depend on $a' - 8 pi$ in this argument; the limit is taken in $rho$ before decreasing $a'$, so that dependence does not affect the squeeze. ◻
]

== 9 Entry from a positive Gaussian coefficient <en:section>

Fix an admissible finite interaction set $J$. We use $A_0 = - Delta_J \/ v_J^2$, $k = beta \/ v_J^2$, and the structural coefficient $a \( k \)$. In this section $k_h$ is fixed and $a_h = a \( k_h \) > 0$. In particular $a_h gt.eq 8 pi$. The input temperature $k$ and the reference coefficient $a'$ will vary near $k_h$ and $a_h$, respectively; $alpha = sqrt(a')$. A derivative in $k$ always holds $a'$ fixed. Fix a compact interval $I subset.double \( 0 \, oo \)$ with $a_h in "int" I$, and take $a' in I$ in all comparison-energy estimates below. The results on mixed domains that are used below are Propositions 22, 24, 25, and 23. The microscopic scaling hypotheses are imposed only at $k_h$. The pure real-Gaussian locality bounds in Proposition 23 are uniform on $I$; each comparison of topologies uses the same $a'$.

=== 9.1 Statement and the observation identity <statement-and-the-observation-identity>

For a dyadic integer $s$, let $B_s$ average over the disjoint square cells of side $s$, and introduce the observations

#[#set math.equation(numbering: n => "(9.1)")
 $ Y = B_s h + eta \, #h(2em) eta tilde.op N \( 0 \, I \) . $ <en:observation>]

The noises are independent of $h$. Work modulo common translations by $2 pi$, with the common mean in one period. The comparison observation is $B_s alpha psi + eta$, where the mean-free covariance of $psi$ is $A_0^(+)$ and its common mean is uniform modulo $2 pi \/ alpha$. Both conventions give ordinary Gaussian formulas on tests annihilating constants. On a finite torus the observation density of the height model is proportional to $Z_(upright("full")) \( y \; k \)$, in the notation of Section 9.2 below and of Proposition 22. Its Gaussian comparison density is proportional to $exp \( - E_(upright("full")) \( y \) \/ 2 \)$. Thus its exact Radon–Nikodym derivative is

#[#set math.equation(numbering: n => "(9.2)")
 $ frac(Z_(upright("full")) \( y \; k \) e^(E_(upright("full")) \( y \) \/ 2), integral Z_(upright("full")) \( z \; k \) e^(E_(upright("full")) \( z \) \/ 2) thin d gamma_(a' \, s) \( z \)) . $ <en:exact-density>]

This identity introduces observations of the original heights; it does not change their interaction.

Here and below the block supports, point norm, and ordinary regulator $W_u^kappa$ have the definitions of Lemmas 28 and 29. Enlarging their fixed collars to contain the finite range of $J$ is understood. We will multiply this regulator by a nonnegative quadratic factor $e^(V_j)$, defined in Equation (9.13). Write

#[#set math.equation(numbering: n => "(9.3)")
 $ parallel F parallel_(u \, A \, V) = sup_(X \, psi) A^(\| X \|) frac(\| F \( X \) \|_(u \, X \, psi), W_u^kappa \( X \, psi \) e^(V_j \( X \, psi \))) \, #h(2em) u = m L^j . $ <en:norm>]

The point norm includes the full analytic derivative sum at radius $h_0$; it is not a norm restricted to bounded fields.

#thm([Theorem 9.1.])[
  (Local entry at every positive coefficient).  #emph[Fix $J \, k_h \, a_h$ as above. Fix admissible parameters for the small-activity maps of Proposition 71, including their block factor $L$, activity weights $A$, and analytic radius $h_0$, with the regulator choices allowed by Lemma 78. For every $epsilon.alt > 0$ there are a fixed dyadic integer $q$, an arbitrarily large dyadic $R$, $P = R^5$, a dyadic $s$, and a neighborhood $cal(U) subset \( 0 \, oo \) times "int" I$ of $\( k_h \, a_h \)$, such that the following assertions hold at $m = q R s$.]
  #emph[On the plane there are real, even, square-covariant local activities $K_m \( X \; k \, a' \)$, invariant under translations of the block grids and under common field translation by $2 pi \/ alpha$, with 
#[#set math.equation(numbering: n => "(9.4)")
 $ parallel K_m \( k \, a' \) parallel_(m \, A \, V) lt.eq epsilon.alt quad \( \( k \, a' \) in cal(U) \) . $ <en:small>]

 Their subset expansion on every dyadic torus fitting the hierarchy and with side $n gt.eq s P$ is an exact representation of Equation (9.2), after integrating the observation noise and the Gaussian covariance below side $m$, up to a field-independent factor that cancels upon normalization. The torus activities obey the same estimate. A support whose padded neighborhood unwraps has exactly its plane activity. This copying property persists under the local maps up to their specified stopping scale. Here fitting means that $n \/ s$ is a multiple of $q R$, the torus uses the same grid origin, and $n \/ \( m L^j \)$ is an integer for every retained coarse grid.]
  #emph[On a smaller neighborhood the activities are analytic in $k$ at fixed $a'$. For every integer $r gt.eq 0$ there is $C_r < oo$ such that 
#[#set math.equation(numbering: n => "(9.5)")
 $ parallel partial_k^r K_m \( k \, a' \) parallel_(m \, A \, V) lt.eq C_r epsilon.alt . $ <en:derivatives>]

 The constants may depend on $s \, R \, J \, k_h$ and the chosen neighborhoods. Finite-support evaluations, their field derivatives, and scalar localization projections are continuous in $a'$.]
  #emph[The choices are made in the following order: the downstream norm parameters and the imaginary field strip widths are fixed first; then $R$ and $P$; then a finite large-field threshold; then $s$; and finally $cal(U)$. No uniform scaling assertion at temperatures other than $k_h$ is part of either the hypotheses or the proof.]
] <en:entry>

One may start the split map with $t = z = 0$ and $cal(R) = K_m$. Its first localization, or its balanced coordinates, consequently has size $O \( epsilon.alt \)$. The entry estimates hold on the full positive neighborhood $cal(U)$. The near-critical split continuation is used on its subset with $k_0 lt.eq a' lt.eq k_0 + delta_(upright("ref"))$, the one-sided interval of Proposition 71. When $a_h = 8 pi$, this includes the nearby warmer true references used in the endpoint argument. On a compact reference interval strictly above $8 pi$ one may instead use the gapped continuation.

The remaining subsections prove Theorem 77. The isolation expansion in Section 9.2 produces local differences controlled on bounded real observations by the mixed-pin results; the observation-energy regulator of Lemma 78 and the real pattern estimates then control large observations. Gaussian averaging, complex comparison, and analytic interpolation upgrade these bounds to the full norm in Equation (9.3), and connected pattern sums complete the construction.

=== 9.2 A finite, covariant isolation expansion <en:patches>

Use the tiles specified in Proposition 22 and shown in Figure 3: in units of $s$ cells start with the square grid of side $R$, remove the square of side $R \/ 2$ centered at each vertex from its incident squares, and declare each removed square a tile as well. The retained parts of the original squares and these vertex squares partition the cells. Cuts are placed between site layers. Thus every junction has at most three incident tiles and every pair meeting there also shares a segment. The mixed-domain results apply to unions of these tiles, to graphs with selected tiles isolated by deletion of all their exterior $J$-bonds, and to their $R \/ 4$-aligned box clippings. Components are defined before any hard pins, and point contacts do not identify components.

Here is a completely finite ordering of the bond deletions. Color tile centers by their tile type and the square-symmetry orbit of their coordinates modulo a dyadic period $q$, in units of $R$. Within each color, group centers into proximity components, with proximity radius $100$ initially. Choose $q$ greater than $16$ times this radius and increase both fixed constants if collars require it. Each group contains at most eight centers: a shortest path repeating a residue label has at most eight steps, hence displacement less than $q$; it must therefore repeat the same center. Removing such a repetition leaves at most the eight distinct orbit labels. Distinct groups of one color have disjoint enlarged neighborhoods. Order the finitely many colors once and for all. An event isolates every member of its group, also from the other members, counting a bond only if it is still present.

For each group its core contains the tiles at center distance at most $1$ from a member; its open patch contains those at distance at most $5$; its guard contains the patch tiles at distance at least $3$. All distances here are sup distances in units of $R$. For sufficiently large $s$, every changed bond is inside the core and the guard separates the core from the exterior. When a guard itself is tested as a pin, use the enlarged patch through distance $12$, with outer guard starting at distance $10$. These constants may be enlarged a fixed number of times. In all subsequent uses the proximity radius is enlarged first so that simultaneous marked interiors are separated. Grid origins are chosen at elementary-square centers; square symmetries and block translations preserve all these rules.

For an event $i$, let $o$ and $c$ be its current open patch before and after deletion of its designated bonds. Put

#[#set math.equation(numbering: n => "(9.6)")
 $ B_i \( y \) = C_i exp { - 1 / 2 \( E_o \( y \) - E_c \( y \) \) } \, #h(2em) C_i = frac(Z_o \( 0 \; k_h \), Z_c \( 0 \; k_h \)) . $ <en:replacement>]

The energies use the current $a'$, whereas the scalar constants always use $k_h$. In the height sum replace the old bond weight by $B_i$ times the cut weight plus their difference. Selecting the difference marks the event. After a mark skip every subsequent event with a member within distance $30$ of that marked group, increasing this constant with the collars if necessary. All events in a group are skipped together. Events in one color are processed simultaneously.

This defines an exact binary expansion: at each considered event the two summands add to the original integrand. A later considered patch does not meet an earlier marked core or guard, so its replacement is independent of which of the two signed terms in that earlier difference is being evaluated. Marked interiors have no mutual bonds. Once all batches have been processed, any undeleted cross-tile bond has an endpoint in a fixed halo of a mark. Conversely every difference from the path with no marks is confined to such halos. These facts follow directly from the skip distance and the bounded number of batches; the necessary halo radius is a fixed constant in $R$ units.

Let $B_i^(\( 0 \))$ denote the factors along the path with no marks. Divide the full expansion by

#[#set math.equation(numbering: n => "(9.7)")
 $ product_i B_i^(\( 0 \)) \( y \) product_b Z_b \( 0 \; k_h \) e^(- E_b \( y \) \/ 2) . $ <en:base>]

Here $b$ runs through the isolated tiles. A halo of a mark retains its whole signed height sum and every affected replacement factor. Outside all halos, expand each remaining factor as $1 + F_b$, where

#[#set math.equation(numbering: n => "(9.8)")
 $ F_b \( y \) = frac(Z_b \( y \; k \) e^(E_b \( y \) \/ 2), Z_b \( 0 \; k_h \)) - 1 . $ <en:tile-error>]

Selecting $F_b$ is called selecting an additional tile. All factors whose rules and inputs are identical to the path with no marks cancel exactly; in particular no comparison of centered normalizers over the unaffected volume is made.

Let $E_0$ be the quadratic energy in Equation (9.7). Work first on the plane. To compare a whole batch, telescope its events one at a time in a finite exhaustion. The intermediate topologies are permitted by the real-Gaussian locality statement of Proposition 23, uniformly for $a' in I$. The enlarged patches of distinct groups in that color are disjoint, so the open-patch proxy of an event is the one in the simultaneous rule. Its true-minus-proxy error retains exponential decay both from its core and in the separation of the two observation indices, as well as the guard factor $e^(- c R)$. Summing over the event locations is finite with this retained decay. The same estimates pass from the finite exhaustion to the whole batch. Summing the finitely many batches gives a matrix $M$ for $E_(upright("full")) - E_0$ with zero row sums and

#[#set math.equation(numbering: n => "(9.9)")
 $ \| M_(x y) \| lt.eq C e^(- c R - c \| x - y \|) . $ <en:link-matrix>]

Cell indices are used here. The constants are uniform on $I$.

We verify the exact image formula on the allowed tori. Every no-mark batch endpoint is invariant under translations by $q R$ cells. Put $N = n \/ s$. When $N$ is a multiple of $q R$ and the grid origins agree, this pattern descends to the torus. Every group and proxy patch has diameter at most a fixed multiple of $R$; after $R$ is large, $N gt.eq P = R^5$ makes projection injective on each such patch. For any no-mark batch endpoint $tau$, its plane observation precision is

$ T_(tau \, a') = A_(0 \, tau) \/ a' + B_s^(*) B_s . $

Cell Poincaré and the unit squared-average mass give coercivity, uniformly for $a' in I$, and the source-tail bound in Proposition 23 gives exponential cell decay to the inverse column with source $B_s^(*) e_y$, where $e_y$ is the unit cell vector. The sum of its translates with $y$ replaced by $y + z$, $z in N bb(Z)^2$, is locally absolutely convergent. Applying the finite-range precision termwise gives the periodized source. Uniqueness from the same coercivity on the torus identifies this sum with its torus inverse column. Thus for the comparison-energy matrices $sans(E)_tau = "Id" - B_s T_(tau \, a')^(- 1) B_s^(*)$,

$ sans(E)_tau^(\( n \)) \( x \, y \) = sum_(z in N bb(Z)^2) sans(E)_tau^(\( oo \)) \( x \, y + z \) . $

The proxy matrices, extended by zero outside their patches, have finite support. Their torus copies are likewise the sums over the corresponding event lifts, because those patches unwrap with the same phase. Subtracting the before-and-after energy matrices and these proxies proves $M_(x y)^(\( n \)) = sum_(z in N bb(Z)^2) M_(x \, y + z)^(\( oo \))$. This uses only the periodic batch endpoints; the intermediate topologies in the preceding finite telescope need not be periodic. Write the zero-row-sum quadratic form as a sum of weighted $\( y_x - y_(y + z) \)^2$, retaining each image displacement $z$ separately, and expand

#[#set math.equation(numbering: n => "(9.10)")
 $ e^(\( E_(upright("full")) - E_0 \) \/ 2) = product_(\( x \, y \, z \)) { 1 + ell_(x y \, z) \( y \) } . $ <en:links>]

The definition of $ell$ is the exponential of the corresponding quadratic summand minus one. Its absolute estimates have cost $C e^(- c \( R + d \))$, where $d$ is the full displacement in cell units, times a small positive quadratic cost along a path connecting its endpoints. Indeed $\| e^t - 1 \| lt.eq \| t \| e^(\| t \|)$ and $\( y_x - y_(y + z) \)^2 lt.eq d sum_(e upright(" on path")) \( nabla_e y \)^2$; polynomial factors in $d$ can be absorbed by weakening $c$. Include both coordinate-order paths to preserve square symmetry. The sum of all reserved path costs is exponentially small per edge, because the number of possible endpoints within path length $d$ is polynomial in $d$. Equation (9.10) is absolutely convergent at a fixed finite-torus field. Its integrated absolute convergence will also follow from Equation (9.27) below.

Cover every mark and selected tile by its required tile halo, padded also for the estimates below. Cover a link by its complete path, including its winding if it projects to a torus. Take all $m$-blocks met by these covers. Apply the polynomial positivity and range argument for the fixed-$J$ entry family in Lemma 69. Since $A_0 = Q \/ v_J^2$, the covariance

#[#set math.equation(numbering: n => "(9.11)")
 $ C_(< m) = C_(< m)^(upright("en")) = A_0^(- 1) \( 1 - sans(P)_m \) $ <en:entry-covariance>]

is $v_J^2 \( 1 - sans(P)_m \) \/ Q$, where $sans(P)_m = P_m \( 1 - Q \/ 16 \)$ and $Q = - Delta_J$. The numerator vanishes at $Q = 0$, so the quotient has polynomial continuation there. Its spectral values are nonnegative because $0 lt.eq sans(P)_m lt.eq 1$, and its degree is $O \( m \)$, giving range $O_J \( m \)$. Continue it by the literal shells $Gamma_u = Gamma_u^(upright("en")) = A_0^(- 1) \( sans(P)_u - sans(P)_(L u) \)$, $u = m L^j$. After the shells with upper side at most a chosen $m_(*) = m L^h$, $h gt.eq 0$, the remaining mean-free covariance is $Gamma_(*)^(upright("en")) = A_0^(- 1) sans(P)_(m_(*))$, together with the uniform common mean. Its positive-order terminal bounds are asserted when $n gt.eq 2 m_(*)$; the activity construction separately uses the fitting grids and their specified stopping clearance. Their sum on nonconstant modes is exactly $A_0^(- 1)$. Polynomial constant-mode continuations are included in the independent high integrations and are absorbed by the uniform mean. Increasing $s$ makes $m$ exceed the fixed-$J$ starting scale in Lemma 69. For an allowed split continuation its exact multiplier is $lambda_j^(upright("en"))$, and its balanced factor is $ell_j = product_(h gt.eq j) \( lambda_h^(upright("en")) \/ lambda \)$; all projection operators in the balance sums are those of these entry shells. The entry-family diagonal estimate proves convergence of this product. Average each pattern over $eta$ and $zeta_(< m)$ in $y = B_s alpha \( psi + zeta_(< m) \) + eta$. Choose the fixed connectivity radius to contain the covariance range and all activity collars. The union of covers then has connected components whose field factors, choices, and Gaussian integrations factor. Grouping these components gives exactly the subset algebra of Proposition 33. In particular it retains all exclusion rules of the original marked expansion. Winding links retain their large supports. Every operation on an unwrapped padded support is therefore identical on plane and torus, which proves the claimed locality once the following norm estimates have been established.

=== 9.3 The observation-energy regulator <the-observation-energy-regulator>

Choose, with strict margins,

#[#set math.equation(numbering: n => "(9.12)")
 $ max \( 0 \, 1 - a_h \/ k_h \) < h_1 < h_(*) < 1 \/ p_2 \, #h(2em) 1 < p_1 < p_2 . $ <en:reserve>]

These choices are possible because $a_h \/ k_h > 0$. Reduce the allowed parameter neighborhood so that its bare large-field coefficient remains strictly below $h_1$. For $u = m L^j$ and the enlarged site set $D = D_u \( X \)$ let $E_D$ be the open observation energy, with all internal $J$-bonds and whole $s$-cells. Define

#[#set math.equation(numbering: n => "(9.13)")
 $ V_j \( X \, psi \) = 1 / 2 sup_(zeta \, e) {h_(*) E_D #scale(x: 120%, y: 120%)[\(] B_s alpha \( psi + zeta \) + e #scale(x: 120%, y: 120%)[\)] - p_1^(- 1) \( parallel zeta parallel_(< u)^2 + parallel e parallel^2 \)} . $ <en:variational>]

The norm $parallel zeta parallel_(< u)$ is the Cameron norm of all Gaussian pieces strictly below $u$, and $e$ has the unit-noise Cameron norm. A singular covariance means its Gaussian Hilbert space; thus no inverse is taken on a null space. Only restrictions to $D$ matter.

#thm([Lemma 9.2.])[
  (Regulator composition).  #emph[The supremum in Equation (9.13) is finite. Uniformly in scale and volume, 
#[#set math.equation(numbering: n => "(9.14)")
 $ 0 lt.eq V_j \( X \, psi \) lt.eq C E_D \( B_s alpha psi \) lt.eq C chevron.l psi \, A_(0 \, D) psi chevron.r . $ <en:regulator-energy>]

 It is monotone on support enlargement and adds on compatible separated supports. Shell averaging satisfies the regulator estimates of Lemma 29 with $W^kappa$ replaced by $W^kappa e^(V_j)$, and with a fixed $C^(\| X \|)$ in place of the former fixed per-block constant. For a small input polymer the half-exponent reserve in $W$ is preserved. The same assertion holds for terminal integration. Consequently the localization, charge estimates, and exact partition map of Lemmas 30, 31 and Propositions 33, 71 retain their stated contractions and analytic nonlinear bounds after this modification.]
] <en:regulator>

#proof[
  Write $E_D \( y \) = chevron.l y \, M y chevron.r$, and let $L$ map the Gaussian Hilbert coordinates $xi$ of $\( zeta \, e \)$ to $B_s alpha zeta + e$ on $D$. The fundamental bound is
  #[#set math.equation(numbering: n => "(9.15)")
   $ parallel M^(1 \/ 2) L parallel lt.eq 1 . $ <en:energy-contraction>]
  For the uncut full observation covariance it is the defining inverse covariance identity. Restriction to an open set only lowers the minimized energy: use the actual restricted field as trial function. Equivalently, the field portion follows from $A_0^(1 \/ 2) C_(< u) A_0^(1 \/ 2) lt.eq I$, and the observation minimization also permits its actual noise. The same proof includes any future Gaussian pieces. Constants are killed by the energy, including on the torus.
  Put $H = h_(*) M$ and $Q = L^(*) H L$. Equation (9.15) and $p_1 h_(*) < 1$ imply
  #[#set math.equation(numbering: n => "(9.16)")
   $ 2 V_j = chevron.l f \, H f chevron.r + chevron.l L^(*) H f \, \( p_1^(- 1) I - Q \)^(- 1) L^(*) H f chevron.r \, #h(2em) f = B_s alpha psi . $ <en:optimized-form>]
  This proves finiteness, positivity, and the first bound in Equation (9.14). The second follows by trying $alpha psi$ with zero noise in the minimization defining $E_D$. Increasing $D$ increases the minimized energy; taking the same full Gaussian Hilbert coordinates proves monotonicity of the supremum. For separated compatible sets the accumulated covariance has finite range inside their fixed collars; their coordinates and energies split, proving additivity.
  For composition let $z$ be standard coordinates for the next shell and $T z = B_s alpha zeta_(Gamma_u)$. Completing its Gaussian square gives the identity
  #[#set math.equation(numbering: n => "(9.17)")
   $ (bb(E)_z e^(p_1 V_j \( f + T z \)))^(1 \/ p_1) & = det \( I - p_1 T^(*) H_j T \)^(- 1 \/ \( 2 p_1 \)) exp {1 / 2 sup_z \[ 2 V_j \( f + T z \) - p_1^(- 1) parallel z parallel^2 \]} \, $ <en:sup-composition>]
  where $H_j$ is the quadratic matrix in Equation (9.16). The supremum on the right is exactly the supremum defining the next $V$, since it combines the old coordinates and the shell coordinates with the same Cameron penalty. Enlarging the support only increases it. Applying Equation (9.15) to both coordinate sets shows that the determinant has a strict stability margin depending only on Equation (9.12).
  For a positive matrix $F$ with $parallel F parallel lt.eq 1 - delta$, $- log det \( I - F \) lt.eq delta^(- 1) "tr" F$. The trace needed here is at most a constant times
  $ bb(E) E_D \( B_s alpha zeta_(Gamma_u) \) lt.eq bb(E) chevron.l zeta_(Gamma_u) \, A_(0 \, D) zeta_(Gamma_u) chevron.r lt.eq C \| X \| . $
  The last inequality is precisely the positive-order difference bound for the shell kernels; the factors $u^(- 2)$ cancel the number of sites in each block. Its constant is independent of the microscopic cell size and of sufficiently large $L$. The terminal covariance satisfies the same bound. No determinant over all microscopic height variables is introduced by this argument.
  Apply Hölder with exponents $p_1$ and $p_1 \/ \( p_1 - 1 \)$ to the two regulators. Choose $kappa$ small enough for the latter power and for the analytic reserve required by Lemma 29. Its proof then gives $W_(L u)^(kappa \/ 2)$ for a small polymer after the shell $u arrow.r L u$, while Equation (9.17) transports the factor $e^V$ without increasing its coefficient. Since $V_j \( t psi \) = t^2 V_j \( psi \)$ for $0 lt.eq t lt.eq 1$ and constants do not affect it, all Taylor interpolation arguments in Lemma 30 keep this factor bounded by its output value. The remaining polynomial losses are absorbed by the half-exponent reserve in $W$. Imaginary charge shifts use only bounded nonconstant directions, whose internal energy is $O \( \| X \| \)$; their costs follow from the same reserve and completion. Thus the linear powers of $L^(- 1)$ are unchanged. The extra fixed $C^(\| X \|)$ is paid by the same large-component weight gain, choosing $L$ and $A$ as in the toolkit. Product, decoration, and regrouping estimates use monotonicity and additivity just proved, so their quadratic nonlinear bounds also hold. ◻
]

=== 9.4 Centered accounting and the real pattern estimate <centered-accounting-and-the-real-pattern-estimate>

Fix a pattern with $j_1$ marks, $j_2$ additional selected tiles, and selected links of lengths $d_ell$. All fixed factors below can depend on the already chosen norms. In a marked patch, prescribe its guard heights $b_i^p$ and denote the two interior kernels by $K_o \, K_c$. Define

#[#set math.equation(numbering: n => "(9.18)")
 $ delta_i \( y \, b_i^p \) = frac(\| K_o \( y \, b_i^p \) - B_i \( y \) K_c \( y \, b_i^p \) \|, K_o \( y \, b_i^p \) + B_i \( y \) K_c \( y \, b_i^p \)) lt.eq 1 . $ <en:delta>]

Factors depending only on the guard or its exterior cancel in this ratio. Given all guards the different marked interiors have no direct coupling. Therefore taking absolute values of their product of differences gives the sum of the $2^(j_1)$ positive topologies, with the factors $B_i$ on cut choices, times the expectation of $product_i delta_i$ in each topology. This is an exact conditional integration followed by an inequality; it requires no independence of the random guards.

#thm([Lemma 9.3.])[
  (Local normalization accounting).  #emph[Let $G$ be any one of these positive topologies in a padded halo containing all its affected tiles and interacting components. After division by Equation (9.7), its contribution, apart from the additional tile and link factors, is at most 
#[#set math.equation(numbering: n => "(9.19)")
 $ e^(C j_1 + C e^(- c R) cal(E) \( y \)) e^(E_G \( y \) \/ 2) frac(Z_G \( y \; k \), Z_G \( 0 \; k \)) bb(E)_(G \, y \; k) product_i delta_i \( y \, b_i^p \) . $ <en:normalization-bound>]

 The energy $cal(E)$ is a sum of squared nearest-cell differences inside a fixed padded halo of the marks. Both its size in tiles and the number of charged centered normalizers are $O \( j_1 \)$, uniformly in the containing torus.]
] <en:normalization>

#proof[
  Write $pi$ for the pattern together with a choice of its positive topology. After all common factors have canceled, let $cal(A)$ be the affected halo tiles and let $cal(I)_pi \, cal(I)_0$ be the remaining proxy events on this path and the no-mark path. The set $cal(I)_pi$ includes every surviving unmarked replacement and the factor $B_i$ on every marked cut choice. Write $Delta E_i = E_(o_i) - E_(c_i)$, so that $B_i = C_i e^(- Delta E_i \/ 2)$. The notation $Z_G \, E_G$ includes the product and sum over all components of $G$, respectively. Define
  $ cal(Q)_G^(upright("all")) \( y \) = e^(E_G \( y \) \/ 2) frac(Z_G \( y \; k \), Z_G \( 0 \; k \)) bb(E)_(G \, y \; k) product_(i med upright("marked")) delta_i . $
  Apart from the separately selected tile factors and links, this positive topology’s contribution to the majorant after division by Equation (9.7) is exactly
  $ frac(product_(i in cal(I)_pi) B_i^pi \( y \), product_(i in cal(I)_0) B_i^0 \( y \)) frac(Z_G \( y \; k \) bb(E)_(G \, y \; k) product_(i med upright("marked")) delta_i, product_(b in cal(A)) \[ Z_b \( 0 \; k_h \) e^(- E_b \( y \) \/ 2) \]) = sans(C)_(pi \, G) \( k \) e^(sans(Q)_(pi \, G) \( y \) \/ 2) cal(Q)_G^(upright("all")) \( y \) \, $
  where
  $ sans(C)_(pi \, G) \( k \) & = frac(Z_G \( 0 \; k \) product_(i in cal(I)_pi) C_i^pi, product_(i in cal(I)_0) C_i^0 product_(b in cal(A)) Z_b \( 0 \; k_h \)) \,\
sans(Q)_(pi \, G) & = sum_(b in cal(A)) E_b - E_G - sum_(i in cal(I)_pi) Delta E_i^pi + sum_(i in cal(I)_0) Delta E_i^0 . $
  Thus every external proxy factor is in $sans(C)_(pi \, G)$ and $sans(Q)_(pi \, G)$; the defining $B_i$ inside each $delta_i$ remains there. The two telescopes below bound these two prefactors.
  At $y = 0$, a true restoration ratio for a positive bond form supported on a core is sandwiched between its open-patch ratio and its ratio with the outer guard pinned. To see the direction, interpolate the bond precision: the derivative of the logarithm of the centered partition ratio is the negative centered expectation of the added quadratic form. Added exterior precision or centered pins decrease this expectation by Lemma 4. The guard-pinned ratio is independent of the exterior. The logarithmic gap between these two ratios is bounded by $D \( H \, p \)$, where $H$ is the union of core tiles and $p$ is the guard: increasing core precision as far as a full core pin can only increase the guard pin probability further. By Proposition 24 and the localization estimate, this gap is bounded and at $k_h$ differs from its exponentially small Gaussian counterpart by an arbitrarily small amount for large $s$. Fixed-patch continuity permits Equation (9.6) to keep its constants at $k_h$ when $k$ is nearby.
  To count only local errors, take the union of tiles within distance $S_0$ of all marks, with $S_0$ larger than all skip and dependence radii, and telescope on its enlargement through distance $2 S_0$. Perform separately the ordinary sequence ending at $G$ and the sequence ending at the topology with no marks. Count every event touching this enlarged union, including events clipped at its artificial boundary; there are $O \( j_1 \)$ of them. At a clipped event use the open-patch proxy clipped in exactly the same way on both paths. The two paths are identical near the artificial boundary, so these proxy factors cancel in their quotient. Their final tile integrals also cancel off the affected halo. The remaining true/proxy ratios are bounded by the centered comparison just proved, one per event. The only $k$ versus $k_h$ isolated-tile constants are those in the affected halo; they cost a bounded factor per tile. This gives $sans(C)_(pi \, G) \( k \) lt.eq e^(C j_1)$ and excludes any extensive normalization loss.
  Apply the identical double telescoping to the Gaussian energies. Proposition 23 bounds each local-versus-true error matrix by an exponentially small prefactor, with decay in both cell separation and distance from that event’s core. Each matrix has zero row sums on its unpinned components. Express it in pair differences and assign shortest face-cell paths inside the padded union. The absence of opposite-only junctions makes these paths available. A path of length $d$ using a fixed edge has endpoints within its $d$-ball; polynomial ball growth and exponential decay bound the total charge on that edge. Summing event locations retains $\| sans(Q)_(pi \, G) \( y \) \| \/ 2 lt.eq C e^(- c R) cal(E) \( y \)$, with a weaker $c$. On a small torus the same argument is performed on the torus itself; the number of halo tiles is still $O \( j_1 \)$, and image paths are charged with their full lengths. This proves Equation (9.19). ◻
]

Cut $G$ into boxes of side $P = R^5$ in cell units, with cuts on a translate of the $R$ grid. Delete every bond crossing a cut, even when it wraps between two copies of the same box. Retain a mark only if its guard and the larger separating patches used for testing that guard lie deep inside one box. Averaging over the finitely many translates loses at most $C \( R \/ P \) j_1$ marks. The Gaussian energy increase in undoing the cuts, averaged over the same translates, is at most $C \( R \/ P \) cal(E) \( y \)$. Indeed the cut-error matrices decay exponentially away from the cut seams; assign their pair differences to paths and then average the probability that the seam is near a path edge. This probability is $O \( R \/ P \)$. Applying Markov’s Inequality to the two nonnegative averaged quantities chooses a translate retaining, for large $R$, at least $j_1 \/ 2$ marks while paying the stated energy with a changed constant. All these choices remain inside the original padded covers. More precisely, a “box” in this argument is the clipping $G ∩ Q$ by a translated $P$-square $Q$, component by component, not the full square $Q$. No cells outside the already chosen padded halo are added. The underlying cells of a clip retain their face adjacency before the topology’s bond deletions; $cal(E)_(upright("box"))$ denotes the sum of squared differences over these adjacent cells. Selected isolated tiles use the same convention on their existing halos. These are permitted rectangular clippings of the mixed geometry. Each contains at most $C P^2$ observation cells, and all their energies are supported in the original $D_m \( X \)$. A halo has diameter $O \( R \)$ and therefore meets only a bounded number of $P$-squares. Consequently the number of occupied clipped boxes is at most $C \( j_1 + j_2 \)$. A clipping with no mark halo or selected tile contributes the exact factor one and is not counted. Selected links are estimated on their own paths and do not create extra boxes.

There is also an exact comparison of the non-Gaussian terms across these box cuts. Write $J_G \( y \, b \; k \)$ for the joint unnormalized density of the continuous observations and all retained prescribed guards. The shifted-versus-centered comparison of Lemma 4 gives

#[#set math.equation(numbering: n => "(9.20)")
 $ frac(J_G \( y \, b \; k \), J_G \( 0 \, 0 \; k \)) lt.eq frac(J_(G^(upright("cut"))) \( y \, b \; k \), J_(G^(upright("cut"))) \( 0 \, 0 \; k \)) . $ <en:shifted-box>]

It applies to the affine lattice of heights and Gaussian noise with these prescribed observations: restoring the cut bonds adds a positive quadratic form independent of the prescribed values. Continuous observation coordinates cause no change: fixing them embeds the height lattice as $\( h \, y - B_s h \)$ in height-plus-noise space. Prescribed guards restrict this to an affine sublattice. The parity proof in Lemma 4 uses only sums and differences of lattice points, and therefore also proves the shifted ratio comparison for this lower-rank lattice, including a shift normal to its span. Thus no density approximation at a rare guard event is used.

Let $S$ be the event that all retained guards vanish, let $delta \( b \) = product_(i med upright("retained")) delta_i \( y \, b_i^p \)$, and let $P_(tau \, 0 \; k)$ be the unpinned centered high law in topology $tau$. Dropping the unretained factors using $delta_i lt.eq 1$ replaces $cal(Q)_G^(upright("all"))$ by the no-smaller factor $cal(Q)_G$ below. The factor to which the comparison is applied is exactly

$ cal(Q)_G \( y \) & = e^(E_G \( y \) \/ 2) frac(sum_b J_G \( y \, b \; k \) delta \( b \), Z_G \( 0 \; k \))\
 & = e^(E_G \( y \) \/ 2) frac(Z_G \( y \; k \), Z_G \( 0 \; k \)) bb(E)_(G \, y \; k) delta \( b \) . $

Since $J_tau \( 0 \, 0 \; k \) \/ Z_tau \( 0 \; k \) = P_(tau \, 0 \; k) \( S \)$, summing Equation (9.20) gives

$ cal(Q)_G \( y \) lt.eq e^(\( E_G - E_(G^(upright("cut"))) \) \( y \) \/ 2) frac(P_(G \, 0 \; k) \( S \), P_(G^(upright("cut")) \, 0 \; k) \( S \)) cal(Q)_(G^(upright("cut"))) \( y \) . $

Cutting all crossing bonds factors the last quantity over the translated $P$-squares that meet $G$. For each square let $frak(b)$ be its entire clipped union of pieces of $G$, grouping all current-topology components in that square in one factor. Retention puts every retained mark’s complete guard and testing data in one such $frak(b)$. Thus

$ cal(Q)_(G^(upright("cut"))) \( y \) = product_(frak(b)) [e^(E_(frak(b)) \( y_(frak(b)) \) \/ 2) frac(Z_(frak(b)) \( y_(frak(b)) \; k \), Z_(frak(b)) \( 0 \; k \)) bb(E)_(frak(b) \, y_(frak(b)) \; k) product_(i in frak(b)) delta_i \( y \, b_i^p \)] . $

Every denominator here is the centered, unpinned $Z_(frak(b)) \( 0 \; k \)$. The expectation is under the unpinned tilted high law of that box, with its guard data jointly random.

For the remaining centered factor, enumerate the retained guards $p_i$, write $q_i$ for the outer guard of the enlarged testing patch, and put $S_(i - 1) = ⋂_(r < i) { h_(p_r) = 0 }$. The skip and retention distances place both the cut seams and all previous $p_r$ outside this enlarged patch. Inside it the two current topologies therefore have the same open graph $U_i$. Its centered law before either displayed pin has no hard pins. Deleting exterior precision gives the lower bound below; adding the centered outer pin gives the upper bound, because that pin then separates the exterior. Thus for $tau = G \, G^(upright("cut"))$,

$ P_(U_i \, 0 \; k) \( h_(p_i) = 0 \) lt.eq P_(tau \, 0 \; k) \( h_(p_i) = 0 divides S_(i - 1) \) lt.eq P_(U_i \, 0 \; k) \( h_(p_i) = 0 divides h_(q_i) = 0 \) . $

The log ratio of the two outer terms is $D_(U_i \, k) \( p_i \, q_i \)$, the interaction in Equation (3.34) for this unpinned local law at $k$. Consequently

$ frac(P_(G \, 0 \; k) \( S \), P_(G^(upright("cut")) \, 0 \; k) \( S \)) lt.eq product_i frac(P_(U_i \, 0 \; k) \( h_(p_i) = 0 divides h_(q_i) = 0 \), P_(U_i \, 0 \; k) \( h_(p_i) = 0 \)) = e^(sum_i D_(U_i \, k) \( p_i \, q_i \)) lt.eq e^(C j_1) . $

For the last bound Proposition 24 is applied at $k_h$ to these unpinned local graphs, and Proposition 23 bounds their limits. After $s$ is fixed, finite-graph continuity gives the same bound for nearby $k$. Combining this with the chosen seam-energy bound therefore bounds Equation (9.19) by the displayed product of centered-normalized box expressions and

#[#set math.equation(numbering: n => "(9.21)")
 $ e^(C j_1 + C \( R \/ P \) cal(E) \( y \)) . $ <en:seam-cost>]

Conditional kernels at a retained mark are unchanged because its guard still separates it from the box exterior.

#thm([Lemma 9.4.])[
  (Good-box gain).  #emph[Fix any finite threshold $U$. At $\( k_h \, a_h \)$, after $s$ is sufficiently large, and then throughout a sufficiently small parameter neighborhood, each box expression just obtained satisfies 
#[#set math.equation(numbering: n => "(9.22)")
 $ C exp { - c R j_(upright("deep")) + R^(- 12) cal(E)_(upright("box")) \( y \) } $ <en:good-box-bound>]

 whenever $cal(E)_(upright("box")) \( y \) lt.eq U^2$. Here $j_(upright("deep"))$ is its number of retained marks. The positive constants $c \, C$ can be chosen before $U$ and $s$. An additional isolated selected tile has the same small factor $e^(- c R)$ in its bounded-gradient region.]
] <en:good-box>

#proof[
  Translate each connected underlying component by a common height period so that one observed cell value lies in $\[ - pi \, pi \]$. The ratios in question are exactly invariant under this simultaneous translation of heights and observations. Paths in a box bound every remaining $\| y_x \|$ by a polynomial in $P$ times $1 + sqrt(cal(E)_(upright("box")) \( y \))$: a spanning tree in each connected clipped component has at most $C P^2$ cells and gives such paths without any convexity assumption. Thus the stipulated gradient bound leaves a compact set of observation vectors. There are finitely many box geometries, positive topologies, mark choices, and translations at fixed $R \, P$.
  In the Gaussian limit the centered-normalized partition factor $e^(E_G \( y \) \/ 2) Z_G \( y \; k_h \) \/ Z_G \( 0 \; k_h \)$ tends to one. For a deep mark, decompose the log ratio in Equation (9.18) into its centered $y = b = 0$ value, the change in its conditional centered normalization as the guard changes from zero to $b$, and the conditional log Laplace change due to $y$, minus its comparison-energy change. The first term is $O \( e^(- c R) \)$ by Propositions 24 and 23. The second is between $log r_H \( b \)$ and zero by Proposition 25, with $H$ containing the restored bonds.
  For the quantitative limiting bounds let $u_c$ be the cut Gaussian harmonic prediction of the guard data, and let $chi_H$ equal one near $H$ with support disjoint from the guard. The localization lemma gives, for every $r gt.eq 2$,
  #[#set math.equation(numbering: n => "(9.23)")
   $ parallel parallel chi_H u_c parallel_T parallel_(L^r) lt.eq C sqrt(r) thin "poly" \( P \) e^(- c R) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(cal(E)_(upright("box")) \( y \)) #scale(x: 120%, y: 120%)[\)] . $ <en:prediction>]
  Here $T$ is the continuum gradient-plus-unit-cell-observation form. The bound holds when the data have either topology’s centered law: restoring bonds decreases their covariance. In the energy Hilbert space with norm $parallel dot.op parallel_T$, write the centered random prediction as $sans(A) g$, where $g$ denotes standard Gaussian energy coordinates. The localized prediction map satisfies $parallel sans(A) parallel_(upright("HS")) lt.eq C "poly" \( P \) e^(- c R)$ by Proposition 23. This normalization includes the coefficient $1 \/ a_h$ in $T$; $g$ has identity covariance in these energy coordinates. Diagonalize $sans(A) sans(A)^(*)$, with eigenvalues $lambda_i gt.eq 0$. Minkowski’s Inequality in $L^(r \/ 2)$ and the standard real Gaussian moment bound give
  $ parallel parallel sans(A) g parallel_T parallel_(L^r)^(thin 2) = parallel sum_i lambda_i g_i^2 parallel_(L^(r \/ 2)) lt.eq sum_i lambda_i parallel g_i parallel_(L^r)^(thin 2) lt.eq C r thin "tr" \( sans(A) sans(A)^(*) \) . $
  Prove this first for finite projections; the Hilbert–Schmidt bound and monotone convergence give the same estimate for the full prediction. Covariance ordering only decreases the trace for restored data. A tilt by $y$ adds a deterministic prediction $mu_y$. The localized operator bound and the period recentering already used on the box give
  $ parallel mu_y parallel_T lt.eq C "poly" \( P \) e^(- c R) parallel y parallel_2 lt.eq C "poly" \( P \) e^(- c R) #scale(x: 120%, y: 120%)[\(] 1 + sqrt(cal(E)_(upright("box")) \( y \)) #scale(x: 120%, y: 120%)[\)] \, $
  enlarging the fixed polynomial if necessary. The triangle inequality proves Equation (9.23) with the displayed $sqrt(r)$ dependence. Its constant and polynomial degree are independent of $r$, so the subsequent choice $r = O \( j_(upright("deep")) \)$ has only polynomial moment losses.
  The negative log Gaussian full-core pin ratio is at most $parallel chi_H u_c parallel_T^2 \/ 2$: this cutoff corrects the conditional mean to zero on $H$ without changing its guard values. The linear-in-data part of the conditional Laplace discrepancy is bounded by $C parallel y parallel parallel chi_H u_c parallel_T$. To verify this also when restoring bonds glues two free faces, first prescribe a finite list of smooth guard probes. The cut and restored predictions minimize the same cut energy on nested admissible spaces. Subtracting $chi_H u_c$ from the cut minimizer leaves all guard probes unchanged and makes it admissible in the restored, trace-matching subspace. Orthogonal projection then bounds the difference of minimizers by $parallel chi_H u_c parallel_T$. The conditional quadratic parts differ from the open-patch comparison in Equation (9.6) by at most $C e^(- c R) parallel y parallel^2$, again by guarded localization. All these arguments use finite-energy predictions, so they never prescribe pointwise values of a continuum rough Gaussian trace.
  To transfer these estimates to the microscopic guards, first work under the centered high laws and use finite smooth guard lists and finite smooth core penalties. Proposition 25 gives the joint conditional convergence for each topology in its own centered law. Increasing the probe lists and the core penalty approximates the full pin ratio there: the centered identity $bb(E) r_H = e^(- D \( H \, p \))$ and Proposition 24 close the approximation error, and the Gaussian ratio is strictly positive almost surely.
  For a cut centered law $mu$ and a restored centered law $nu$ with identical exterior, let $A_s$ be any failure event about their common guard data. Equations (3.47) and (3.54) give
  $ nu_p \( A_s \) lt.eq e^(D_U \( H \, p \)) mu_p \( A_s \) \, #h(2em) mu_p \( A_s \) lt.eq mu_p \( r_H lt.eq epsilon \) + epsilon^(- 1) nu_p \( A_s \) . $
  The interactions have finite limits. Taking $s arrow.r oo$ and then $epsilon arrow.b 0$ transfers vanishing failure probabilities in both directions. Thus both topologies’ conditional approximations hold jointly when their guard data are sampled under either centered law.
  Only after this centered transfer, change the sampling law separately in each topology $tau$. For a fixed observation vector $y$,
  $ frac(thin upright(d) P_(tau \, y \; k_h), thin upright(d) P_(tau \, 0 \; k_h)) \( h \) = frac(e^(\( B_s h \, y \)), bb(E)_(tau \, 0 \; k_h) e^(\( B_s h \, y \))) . $
  At fixed $R \, P \, U$ these are tilts by a fixed finite list of cell observations with bounded bare covariance and coefficients in a compact set. The displayed densities have a common $L^q$ bound for every fixed finite $q$, by the density moment estimate in Proposition 25. Hölder in each topology therefore transfers the centered failure bounds to its own tilted law. There are only finitely many topologies and required moment orders at these fixed parameters, so the choices are common to all of them. On exceptional data use $delta_i lt.eq 1$. Consequently bounded moments of $delta_i$ have the Gaussian upper bounds derived from Equation (9.23); no uniform claim for arbitrary prescribed microscopic guards is needed.
  Use $\| \( x - 1 \) \/ \( x + 1 \) \| lt.eq \| log x \|$ for $x > 0$. Hölder over the $j_(upright("deep")) lt.eq "poly" \( P \)$ retained marks gives their product a factor $e^(- c R j_(upright("deep")))$, with polynomial losses in $P$, the moment order, and $1 + cal(E)_(upright("box"))$. For clarity, if a per-mark bound has the form $e^(- c_0 R) P^C j^C \( 1 + cal(E) \)^C$, maximize $\( 1 + cal(E) \)^(C j) e^(- R^(- 12) cal(E))$ to obtain a factor $\[ C \( 1 + j R^12 \)^C \]^j$. Its logarithm is $O \( j log R \)$ because $j lt.eq "poly" \( P \)$, and is absorbed by $c_0 R j \/ 2$. This proves Equation (9.22) in the limiting Gaussian calculation with slack.
  The same argument works along every convergent sequence in the compact set of translated observation vectors, using uniform exponential integrability of the finite probes. A subsequence contradiction therefore makes the bound uniform there for sufficiently large $s$. All finitely many box calculations are then continuous in $k \, a'$; their strict slack gives a common neighborhood. This last continuity is on fixed finite microscopic graphs. It invokes no scaling theorem away from $k_h$. Equation (9.8) is handled by the free mixed-domain convergence in exactly its own finite tile: its normalized ratio tends to one uniformly on the same compact sets, so its error can be made smaller than $e^(- c R)$. ◻
]

In a box outside this gradient threshold discard its $delta_i$’s. Completing the square and centered Gaussian domination give

#[#set math.equation(numbering: n => "(9.24)")
 $ e^(E_(G_b) \( y \) \/ 2) frac(Z_(G_b) \( y \; k \), Z_(G_b) \( 0 \; k \)) lt.eq exp {1 / 2 max \( 0 \, 1 - a' \/ k \) E_(G_b) \( y \)} . $ <en:bad-box>]

Indeed the bare comparison observation covariance with coefficient $k$ is bounded by $max \( 1 \, k \/ a' \)$ times the reference covariance; inverting on the complement of the constant mode gives the stated energy coefficient. Constants cancel on that mode. Fixed centered normalization ratios at nearby parameters cost a bounded factor per active tile. For a bad selected isolated tile, the bound for $\| F_b \|$ follows by adding one to Equation (9.24). Group these tiles also into boxes of side at most $P$.

On every bad box insert the upper bound

#[#set math.equation(numbering: n => "(9.25)")
 $ 1 lt.eq exp { epsilon_1 \( cal(E)_b \( y \) - U_(upright("big"))^2 \) } \, $ <en:threshold>]

where $epsilon_1 > 0$ is fixed sufficiently small. Differences are always those on the underlying uncut cells, even if the current topology has fewer bonds. Choices of good and bad boxes cost only an exponential per active tile. The real estimate now consists of the mark and tile gains in the good boxes, the tiny seam cost $C \( R \/ P \) cal(E)$, the link costs in Equation (9.10), and the broad quadratic costs in bad boxes with the negative constants from Equation (9.25).

=== 9.5 Averaging without a microscopic volume loss <averaging-without-a-microscopic-volume-loss>

Let $X$ be the padded $m$-block cover of the pattern and $D = D_m \( X \)$. All its positive quadratic costs are bounded by $h_1 E_D \/ 2$ once $R$ is large and $epsilon_1$ is small. Here are the two required form comparisons. First, the sum of cut-box minimized energies is at most $E_D$: restrict any trial field in the latter minimization to the boxes and discard crossing bonds. Second, on two neighboring observation cells, cell Poincaré and the observation penalty give

$ \| y_x - y_(x') \|^2 lt.eq C [sum_(z in { x \, x' }) \| \( B_s v \)_z - y_z \|^2 + \( v \, A_(0 \, D) v \) \/ a' upright(" on these cells")] . $

Sum this inequality over the good-box edges with coefficient $R^(- 12)$, and over the localized seam and path edges with their coefficients. Their multiplicities are bounded: the boxes are disjoint clippings and the selected-tile halos have fixed overlap, while the seam and path bounds were proved above. Minimizing over $v$ gives $sum_(upright("good")) R^(- 12) cal(E)_(upright("box")) lt.eq C R^(- 12) E_D$ and bounds the seam and path total by another small multiple of $E_D$. Equation (9.12) supplies strict room beyond the broad coefficient in Equation (9.24).

Gaussian completion bounds the resulting background quadratic by $V_0$ in Equation (9.13). The determinant actually integrated is estimated with its localized costs rather than with the larger form $h_1 E_D$. Its covariance contraction has a strict margin from one. Its trace is bounded by

#[#set math.equation(numbering: n => "(9.26)")
 $ C "poly" \( P \) N_(upright("bad")) + C R^(- 12) P^2 N_(upright("good")) + C \( R \/ P \) R^2 \( j_1 + j_2 \) + C sum_ell e^(- c \( R + d_ell \)) "poly" \( d_ell \) . $ <en:trace-entry>]

Here $N_(upright("bad"))$ and $N_(upright("good"))$ count occupied clipped boxes, not all boxes in the containing torus. For the first term the rank is the number of observed cells in the bad boxes, at most $C P^2$ per box, and the covariance contraction bound controls every eigenvalue. For the good-box term, every adjacent-cell difference of $B_s alpha zeta_(< m) + eta$ has variance bounded by a constant independent of $s \, m$: the height part is bounded by the nearest-cell flow comparison and the two independent noise variables have variance two. There are at most $C P^2$ such differences per clipping. Multiplication by the allowance $R^(- 12)$ therefore gives $C R^(- 12) P^2$ per occupied good box. This accounts for the whole observation rank; it uses no cancellation of its noise coordinates. For the seam and link terms sum their localized coefficients against the same adjacent-cell variance bound. There are $O \( R^2 \)$ cells per halo item. The strict covariance margin converts this trace estimate into the corresponding logarithmic determinant bound.

Thus Equation (9.26) is independent of $s$: the determinant never counts the microscopic height dimension. Since $P = R^5$ and $N_(upright("good")) lt.eq C \( j_1 + j_2 \)$, both the good-box allowance and the seam term are $O \( R^(- 2) \) \( j_1 + j_2 \)$, absorbed by the real per-item gain. This is the reason for choosing the allowance $R^(- 12)$ in Lemma 80. Its polynomial maximization cost is still only $O \( j_(upright("deep")) log R \)$, so that lemma’s constants remain independent of the later threshold and of $s$.

A bad box contains at most a polynomial number of marks and tile items. Its loss of their gains is at most a polynomial in $P \, R$ in the logarithm. Choose the finite $U_(upright("big"))$ so that $epsilon_1 U_(upright("big"))^2$ exceeds this loss, the first term of Equation (9.26), and all per-box combinatorial costs, leaving a further factor $e^(- c R)$ per item. Only after this choice apply Lemma 80 to choose $s$. The finite choice of optimized cut translate does not create a random determinant: replace the pointwise optimum by a sum over its at most polynomially many translates. For a nonempty configuration this polynomial is absorbed by the per-item exponential gain. The all-empty configuration has no cut choice or cost.

We obtain for the Gaussian-averaged pattern $F_pi$ the real estimate

#[#set math.equation(numbering: n => "(9.27)")
 $ \| F_pi \( psi \) \| lt.eq C^(j_1 + j_2) exp { - c R \( j_1 + j_2 \) } product_ell C e^(- c \( R + d_ell \)) W_m^(kappa_0) \( X \, psi \) e^(V_0 \( X \, psi \)) \, $ <en:averaged-pattern>]

with $kappa_0 < kappa$ and fixed reserve in both quadratic estimates. The optional $W^(kappa_0)$ records the small reserved path and direction costs. Completion also permits replacing the background by $psi + x f$, for a real direction of scaled point norm at most one, at extra cost

#[#set math.equation(numbering: n => "(9.28)")
 $ e^(C x^2 \| X \|) . $ <en:real-translate>]

To see the bound with the regulator still evaluated at $psi$, use the strict gap $h_1 < h_(*)$ and Cauchy–Schwarz in the optimized quadratic form. The excess on the direction is bounded by $C chevron.l f \, A_(0 \, D) f chevron.r lt.eq C \| X \|$, since its first differences are $O \( m^(- 1) \)$ and there are $O \( m^2 \| X \| \)$ sites. The bounded-range corner and collar bonds change only this fixed constant. This reserve is also why a translate does not consume the final regulator.

Equation (9.27) proves absolute integrated convergence for the link expansion. For a finite torus first sum the finite positive topologies for each microscopic height configuration, then perform the Gaussian integrations just bounded, and finally sum links. Tonelli for absolute values and the resulting summability justify all exchanges in the signed identity.

=== 9.6 Complex fields, analytic directions, and input derivatives <complex-fields-analytic-directions-and-input-derivatives>

A separate bound on imaginary directions is necessary because taking absolute values inside each conditionally oscillating guard kernel would lose the cancellation in its Gaussian energy. We give the finite theta identity that avoids that loss. For a positive definite precision $T$ on the unpinned height coordinates set

$ w \( t \) = sum_(h in Lambda) e^(- chevron.l \, chevron.r h T h \/ 2 + chevron.l \, chevron.r h t) \, #h(2em) w_c \( t \) = sum_(p in Lambda + c \/ 2) e^(- chevron.l \, chevron.r p T p + chevron.l \, chevron.r p t) \, quad c in Lambda \/ 2 Lambda . $

Sum and difference of the two lattice variables give, for real $x \, z$,

#[#set math.equation(numbering: n => "(9.29)")
 $ w \( x \) w \( i z \) = sum_c \| w_c \( x + i z \) \|^2 \, #h(2em) w \( 0 \) w \( x + i z \) = sum_c w_c \( x + i z \)^2 . $ <en:theta-parity>]

The cosets are invariant under sign reversal, which explains the second equality. The triangle inequality proves $\| w \( x + i z \) \| w \( 0 \) lt.eq w \( x \) w \( i z \)$. Since $Z \( y \) = e^(- parallel y parallel^2 \/ 2) w \( B_s^(*) y \)$, including its Gaussian prefactors gives the useful form

#[#set math.equation(numbering: n => "(9.30)")
 $ frac(\| Z \( y + i v \; k \) \|, Z \( y \; k \)) lt.eq frac(Z \( i v \; k \), Z \( 0 \; k \)) . $ <en:complex-comparison>]

Every free component’s constant is controlled by the observation mass. Hard-pinned subspaces use their own lattice, so the identity applies there too; a vanishing auxiliary mass also deals with any redundant semidefinite presentation.

The centered imaginary ratio equals $e^(parallel v parallel^2 \/ 2) bb(E) e^(i chevron.l B_s h \, v chevron.r)$, whose characteristic factor is positive. Centered zero pinning increases this characteristic function. In detail, condition on the pinned coordinates; the remaining law is a real tilt of the centered pinned Gaussian lattice. Equation (9.30) bounds its characteristic modulus by that of the centered pinned law. Average the conditional characteristic functions and use positivity of the centered full characteristic function. This proves the claimed direction without taking absolute values of individual lattice Fourier summands.

For an imaginary observation direction $v$ of any prescribed fixed supremum, expand each microscopic difference into its positive topologies, discarding difference rarity for the moment but retaining the link gains. Apply Equation (9.30) to each whole integrated topology. Pin whole strips of width $R \/ 4$ along translates of the $P$-box cuts. These thick walls separate the region into bounded boxes. Bonds can then be cut through the middles of the zero strips, since every deleted endpoint is already zero. All strips are intersected with the same active halo; neither walls nor auxiliary boxes enlarge its support. Thus each pre-pin component is a permitted rectangular clipping, exactly as required for Proposition 22.

On these fixed pinned boxes that lemma gives the Gaussian imaginary ratio, uniformly for bounded $v$, with arbitrarily small multiplicative error per box after $s$ is large. It remains true nearby by finite-graph continuity. The additional Gaussian pin energy over the unpinned energy is, after averaging wall translates, at most

#[#set math.equation(numbering: n => "(9.31)")
 $ C parallel v parallel_oo^2 \( R \/ P \) thin \# { upright("active cells") } . $ <en:imaginary-wall>]

For this bound use the massive-form localization away from each wall; near it use the uniform observation-energy bound. The proportion of near-wall cells is $O \( R \/ P \)$ and the decaying tails have the same average. There is no zero-row-sum requirement here because $v$ is bounded. The optimizing wall translate need not equal the translate used for the real estimate.

The Gaussian shape factors in Equation (9.7) cancel this Gaussian imaginary ratio: for a quadratic $E$, $Re E \( y + i v \) = E \( y \) - E \( v \)$. The double telescoping in Lemma 79 bounds the remaining shape discrepancies by exponentially small localized costs. For the real part of each positive topology we use the following separate consequence of the good-box proof, with no $delta_i$ factors:

$ e^(E_(G_b) \( y \) \/ 2) frac(Z_(G_b) \( y \; k \), Z_(G_b) \( 0 \; k \)) lt.eq 2 exp { R^(- 12) cal(E)_b \( y \) } #h(2em) \( cal(E)_b \( y \) lt.eq U_(upright("big"))^2 \) . $

At $\( k_h \, a_h \)$ its left side tends uniformly to one on the compact set of recentered observations, by the same fixed mixed-domain convergence. Choose $s$ so that it is at most $3 \/ 2$ for every one of the finitely many positive topologies. Finite-graph continuity then makes it at most $2$ on one parameter neighborhood. Thus the displayed numerical constant is independent of $R \, P$ and the threshold; only the required $s$ and neighborhood depend on these earlier choices. This establishes the estimate without deleting factors from an inequality that contained $product_i delta_i$. For bad boxes use Equation (9.24) and the same threshold penalty. Hence the real-part determinants are precisely the localized determinants already bounded. In particular the good-box allowance still costs at most $C R^(- 12) P^2 N_(upright("good")) lt.eq C R^(- 2) \( j_1 + j_2 \)$, even though no mark gain is used on this strip boundary. Bad-box determinants are paid by their threshold penalties as before, and empty boxes remain exact identities. Thus this cost belongs to the $o \( R \)$ term below. Links at complex arguments retain their tiny path costs directly. For a fixed strip height $H$ we have therefore proved the second bound

#[#set math.equation(numbering: n => "(9.32)")
 $ \| F_pi \( psi + \( x + i y \) f \) \| lt.eq  & exp { o \( R \) \( j_1 + j_2 \) + C_H \( 1 + x^2 \) \| X \| } product_ell C e^(- c \( R + d_ell \))\
 & #h(5mm)  dot.op W_m^kappa \( X \, psi \) e^(V_0 \( X \, psi \)) \, #h(2em) \| y \| lt.eq H . $ <en:strip-rough>]

Here $H$ is fixed before $R$; the $o \( R \)$ includes Equation (9.31), since each halo has $O \( R^2 \)$ cells and $R^3 \/ P = R^(- 2)$. On each fixed finite calculation analyticity follows from Gaussian domination with quadratic reserve. The same domination and the absolute link sum prove analyticity after averaging.

Choose a desired radius $r_0 > 4 e h_0$ and then $H > 4 r_0$. For fixed real $psi \, f$, apply the three-lines theorem on each of the strips $0 lt.eq plus.minus Im z lt.eq H$ to $F_pi \( psi + z f \) e^(- D z^2 \| X \|)$, with $D > C_H$. Equation (9.28) bounds its real boundary and Equation (9.32) its other boundary. On $\| z \| lt.eq r_0$ the real-boundary harmonic weight is at least $3 \/ 4$. Consequently the gain $e^(- c R \( j_1 + j_2 \))$ survives with a smaller $c$; the damping and its removal cost only $e^(C_(r_0 \, H) \| X \|)$. Moreover

#[#set math.equation(numbering: n => "(9.33)")
 $ \| X \| lt.eq C \( j_1 + j_2 \) + C sum_ell \( 1 + d_ell \/ R \) \, $ <en:cover-size>]

so these losses are absorbed by the item and link gains after increasing $R$. We have recovered Equation (9.27), with weaker constants, on the complex directional disk of radius $r_0$.

Cauchy’s Inequality bounds the diagonal $r$th derivative by $r ! r_0^(- r)$ times this bound. Real polarization bounds the multilinear derivative by a further factor $r^r \/ r !$. Thus its contribution to the point norm is at most $\( h_0 \/ r_0 \)^r r^r \/ r !$ times the pattern bound, and the sum over $r$ converges because $r_0 > 4 e h_0$. This proves the full analytic point norm estimate, including independent real directions in each slot.

For input derivatives, fix the already chosen $s \, R$. Every scalar denominator in the unsummed expansion is independent of $k$, by Equation (9.6) and Equation (9.7). On a sufficiently small complex $k$-disk about $k_h$, absolute values of the height weights are bounded by weights at a nearby real precision. Discarding the imaginary-direction cancellation and using broad bare quadratic completion on every active tile now costs at most $e^(C_(s \, R) \( j_1 + j_2 \))$ per pattern. This constant is finite: there are finitely many microscopic sites per active halo, their centered moments are bounded under the observation mass, and the local normalization accounting compares only these halos. The quadratic stability margin and exponential link decay persist on a smaller disk.

On its real diameter we already have the small complex-field estimate. Apply the two-constants principle separately to the upper and lower half-disks, after the same field-translation damping. On a concentric disk of relative radius $rho$ the harmonic measure of the circular boundary is $O \( rho \)$. Choose $rho$ so small that its contribution $O \( rho C_(s \, R) \)$ is less than a fixed fraction of the remaining $c R$ per item. The pattern estimate is then still exponentially small on that complex $k$-neighborhood. Cauchy’s Inequality there proves Equation (9.5); for example one may take constants bounded by $r ! rho_k^(- r)$ times a fixed factor on an inner disk. This interpolation is performed on each local pattern integral, not on a volume-dependent total partition function. Finally, varying $a'$ changes finite Gaussian integrals, the quadratic forms, and the common frequency continuously. The same absolute estimates with reserve give dominated convergence on each fixed support, for each field derivative and scalar projection. This proves the stated continuity in $a'$ without asserting differentiability of a norm whose period changes.

=== 9.7 Connected pattern sums and completion of entry <connected-pattern-sums-and-completion-of-entry>

After the preceding estimates assign a positive weight $w \( I \)$ to each halo item and link, including all its analytic and geometric constants. For a fixed $m$-block $B$, their placement sums obey

#[#set math.equation(numbering: n => "(9.34)")
 $ sup_B sum_(I : thin "cover" \( I \) upright(" meets the
 connection neighborhood of ") B) w \( I \) \( 2 A \)^(\| "cover" \( I \) \|) e^(\| "cover" \( I \) \|) lt.eq e^(- c R) = : eta_R . $ <en:placement>]

Indeed a halo has bounded block diameter and only polynomially many cell-root and event labels in a fixed $m$-block. A link of length $d$ uses at most $C \( 1 + d \/ R \)$ blocks. Its endpoints and path descriptions have polynomially many choices at each fixed length; allowing translations and cover attachments adds at most an exponential in $1 + d \/ R$. These factors, the weight $\( 2 A \)^(\| "cover" \|)$, and the displayed extra exponential are absorbed by $e^(- c \( R + d \))$. All counted cells are observation cells; their count is independent of $s$. Repeated roots use subsets of their finite local labels, bounded by the corresponding product of $1 + w \( I \)$.

Here is a direct connected-sum bound. Root a connected collection of items at an item meeting a specified block, and choose a canonical spanning tree of the item adjacency graph. A child can attach to any block of its parent’s cover. At bounded depth let the sum of all possible descendant trees attached at a fixed block be $T$. The unordered-child sum is bounded by its exponential generating bound, so for a parent cover $S$ it is at most $e^(\| S \| T)$. Starting with depth zero and using Equation (9.34), induction gives $T lt.eq eta_R < 1$ at every depth: the factor $e^(\| S \|)$ reserved there pays all descendants. Monotone convergence bounds the sum of all finite trees. Canonically assigning each actual collection to one tree only decreases this positive overcount. The factor $2^(\| S \|)$ in Equation (9.34) pays the choices of occupied covered blocks and regrouping into the subset convention. Therefore the connected pattern sum at weight $A$ is at most $C eta_R$ in the norm of Equation (9.3). The same encoding works for projected torus covers rooted at actual blocks; a winding item’s full cover and length have already been charged.

Choose $R$ large enough that $C eta_R lt.eq epsilon.alt$, and then make the choices of threshold, $s$, and parameter neighborhood in the order stated in Theorem 77. The expansion in Equations (9.6)–(9.10) is exact, the integrated sums are absolutely convergent, and grouping separated components is exactly the partition algebra. This proves Equation (9.4) and its torus version. Equation (9.34) with the parameter derivative costs proves the differentiated bounds after the same possible reduction of the neighborhood.

For completeness, inserting a bounded function of $Y$ in Equation (9.2) preserves the exact observation identity before high-mode averaging; all local expansions are identities in its integrand. Subsequent smooth-source tests are implemented by their Gaussian translations, with the same normalized denominator. Thus the entry does not assume that a height observable already equals an observable of the auxiliary Gaussian field. Its purpose is the exact local interaction representation to which those translations and the terminal diagnostics apply. Finally, shell range and padded supports imply plane copying through the stopping scale by Proposition 71; large noncopying torus supports have the same weight-gain estimates. Lemma 78 supplies all regulator hypotheses for continuing that map. This completes the proof of Theorem 77.

== 10 The endpoint and the response of the effective coefficient <ep:section>

Throughout this section $J$ is fixed, $v = v_J$, $A_0 = - Delta_J \/ v^2$, and $k = beta \/ v^2$. Write $a \( k \)$ for the coefficient constructed in Sections 2 and 3, and put $k_c = beta_c \( J \) \/ v^2$. Corollary 18, Proposition 19, and Corollary 75 give

$ 0 < k_c < oo \, #h(2em) { k : a \( k \) > 0 } = \[ k_c \, oo \) \, #h(2em) a \( k \) in { 0 } union \[ 8 pi \, oo \) . $

On its positive set $a$ is strictly increasing and right continuous. Right continuity here follows also directly by combining monotonicity with upper semicontinuity. We shall prove $a \( k_c \) = 8 pi$, differentiability on $\( k_c \, oo \)$, and an infinite right derivative and right difference quotient at $k_c$.

A reference coefficient, denoted throughout by $a'$, is held fixed when differentiating in $k$. In particular a prime on $a'$ is part of its name, not a derivative. We write $frac(d, d k) a \( k \)$ for the derivative of the physical coefficient. Set $alpha = sqrt(a')$ and $lambda = L^(2 - a' \/ \( 4 pi \))$.

The critical small-activity Coulomb-gas trajectory constructed by Falco #cite(label("Falco2012")) is a rigorous predecessor of the marginal flow analysis. Here the preceding entry theorem and the physical terminal diagnostics identify which trajectory is selected by the original fixed-range height model. The finite-volume response then connects that trajectory to the endpoint slope.

=== 10.1 Physical terminal diagnostics <physical-terminal-diagnostics>

Fix $k_h$ with $a_h = a \( k_h \) > 0$. Choose the downstream norm parameters in Proposition 71 and Theorem 77 first. The entry construction then chooses $R$, $P = R^5$, a finite large-field threshold, and $s$, in this order, before the parameter neighborhood, and starts the long maps at $m = q R s$. We use the observation $Y = B_s h + eta$ of Theorem 77, where the noises have variance one. All choices are fixed on a sufficiently small neighborhood of $\( k_h \, a_h \)$. Near $8 pi$ retain the gradient and fundamental coordinates $\( t \, z \)$ on the allowed one-sided interval $8 pi lt.eq a' lt.eq 8 pi + delta_(upright("ref"))$; on a compact reference interval strictly above $8 pi$ choose $L$ for its gap and retain only $t$. All these continuations use the fixed-$J$ entry shells $Gamma_u^(upright("en"))$ and their exact multipliers $lambda_j^(upright("en"))$ from Lemma 69.

Choose a sufficiently large fixed dyadic integer $D$ and use actual tori of sides

#[#set math.equation(numbering: n => "(10.1)")
 $ n_j = D m_j \, #h(2em) m_j = L^j m . $ <ep:stop-sizes>]

The choice of $D$ exceeds the causal neighborhoods in Proposition 71. Consequently all singleton coefficients through the stop at $m_j$ agree exactly with the plane coefficients. These sides satisfy the entry divisibility condition, since $n_j \/ s = D q R L^j$ is a multiple of $q R$ with the chosen grid origin. The torus remainder need not agree with the plane remainder: noncopying supports are estimated by the same contraction. Winding links keep their full covers, as in Theorem 77, so they cannot change a singleton in a padded unwrapped neighborhood. When $n_j < s P$, only the plane steps are used. Their number is at most $J_R = max { 0 \, ceil.l log_L \( R^4 \/ \( D q \) \) ceil.r }$, independently of $s$. Equation (9.34) gives an entry norm at most $C e^(- c R)$, so the bounded plane map amplifies it by at most $C_0^(J_R) = R^(O \( 1 \))$; increasing $R$ keeps all these steps small. For each valid stopping size $n_j gt.eq s P$, its own exact torus history starts at $m$ and runs through all steps up to $j$. No identity on a smaller invalid torus is needed.

Let $f$ be the real first horizontal cosine on the unit torus and let $f_n$ be its cell-center samples, weighted by the cell area. Put

$ X_n = \( Y \, f_n \) \, #h(2em) g = \( f \, \( - Delta_(bb(T)) \)^(- 1) f \) > 0 . $

The height component is $\( h \, B_s^(*) f_n \)$. Its difference from the ordinary sampled smooth test has bare inverse-energy norm tending to zero as $s \/ n arrow.r 0$. Also $"Var" \( eta \, f_n \) = O \( \( s \/ n \)^2 \)$. The field and Laplace conclusions of Theorem 17 therefore apply to $X_n$, including convergence of every fixed moment.

For a real source $w$ near zero, Gaussian completion translates the observation argument of the entire interaction by its reference covariance applied to $w f_n$. This translate equals $B_s alpha F$ for a microscopic cosine $F$: translation and reflection symmetry make the translated cell function a cosine, and the average of a microscopic sampled cosine is that cell cosine times a nonzero scalar. The scalar is uniformly bounded at the sizes (10.1). Its energy satisfies

#[#set math.equation(numbering: n => "(10.2)")
 $ \( F \, A_0 F \) = a' w^2 g + o \( 1 \) quad \( s \/ n arrow.r 0 \) . $ <ep:F-energy>]

All its scaled derivatives needed in the point norm are bounded. Field-independent extracted constants cancel in the ratio.

Write $cal(R)_j^(upright("tor"))$ for the stopped torus remainder and $nu_j = \| t_j \| + \| z_j \| + parallel cal(R)_j^(upright("tor")) parallel$, omitting $z$ in the one-coordinate scheme. Terminal integration has only $D^2$ blocks, and its regulators integrate with reserve by Lemma 78. Expanding the exact terminal partition ratio at zero activity gives

#[#set math.equation(numbering: n => "(10.3)")
 $ log bb(E) e^(w X_(n_j)) - log bb(E)_(a') e^(w X_(n_j)) = 1 / 2 t_j \( F \, A_0 F \) + O #scale(x: 120%, y: 120%)[\(] parallel cal(R)_j^(upright("tor")) parallel + nu_j^2 #scale(x: 120%, y: 120%)[\)] . $ <ep:gradient-diagnostic>]

The bound is uniform for $w$ in a fixed complex disk; thus it also holds after taking any fixed number of source derivatives. The constant mean integral kills the linear fundamental term.

A second diagnostic detects that term. Write $chi_n = e^(i macron(Y))$, where $macron(Y)$ is the spatial mean modulo $2 pi$. Let $zeta_(upright("high") \, j)$ be the sum of the polynomial Gaussian pieces integrated through side $m_j$, including their constant-mode continuations, and define the variance in phase units by

$ tau_(upright("av")) = "Var" #scale(x: 120%, y: 120%)[\(] alpha thin overline(B_s zeta_(upright("high") \, j)) + macron(eta) #scale(x: 120%, y: 120%)[\)] . $

Here $macron(eta)$ is the spatial mean of the observation noise. This high mean is independent of all mean-free Gaussian variables and of their source tilt. Its variance is bounded: a polynomial piece with upper side $u lt.eq m_j$ contributes $O \( u^2 \/ n_j^2 \)$, the sum over such sides is geometric, and $"Var" macron(eta) = \( s \/ n_j \)^2$.

Let $cal(Z)_j$ be the stopped subset expansion with its common field-independent factors removed. Let $C$ be uniform on $\[ 0 \, 2 pi \/ alpha \)$, let $zeta_(* \, j)$ have the remaining mean-free terminal covariance, and let $F_j \( w \)$ be the field translate above at side $n_j$. Put

$ c_(n_j \, a') & = \( f_(n_j) \, \[ I + a' B_s A_0^(+) B_s^(*) \] f_(n_j) \) \,\
cal(I)_j \( w \) & = bb(E)_(C \, zeta_(* \, j)) cal(Z)_j \( C + zeta_(* \, j) + F_j \( w \) \) \,\
cal(N)_j \( w \) & = bb(E)_(C \, zeta_(* \, j)) #scale(x: 120%, y: 120%)[\[] e^(i alpha C) cal(Z)_j \( C + zeta_(* \, j) + F_j \( w \) \) #scale(x: 120%, y: 120%)[\]] . $

Gaussian completion and the uniform mean integral give the exact normalized mixed identity

$ e^(- c_(n_j \, a') w^2 \/ 2) bb(E) \[ chi_(n_j) e^(w X_(n_j)) \] - bb(E) chi_(n_j) = e^(tau_(upright("av")) \/ 2) frac(cal(N)_j \( w \) - cal(N)_j \( 0 \), cal(I)_j \( 0 \)) . $

Indeed absorbing the integrated high mean into $C$ leaves the physical character unchanged, whereas inserting $e^(i alpha C)$ before that change contributes the Gaussian characteristic $e^(- tau_(upright("av")) \/ 2)$. This proves the positive sign in the displayed prefactor. The source annihilates constants, so it does not change that argument. The denominator is the common zero-source normalizer; also $c_(n_j \, a') arrow.r a' g$ as $s \/ n_j arrow.r 0$.

At zero activity $cal(I)_j \( 0 \) = 1$, and on the small ball it is $1 + O \( nu_j \)$. In $cal(N)_j \( w \) - cal(N)_j \( 0 \)$ the constant and linear gradient terms vanish under the mean character. Exact integration of the linear cosine term therefore makes the preceding mixed functional $z_j M_j \( w \) + O \( parallel cal(R)_j^(upright("tor")) parallel + nu_j^2 \)$, where

#[#set math.equation(numbering: n => "(10.4)")
 $ M_j \( w \) = D^2 / 2 e^(tau_(upright("av")) \/ 2 - alpha^2 D_(upright("tail") \, j) \/ 2) "ave"_x #scale(x: 120%, y: 120%)[\(] e^(- i alpha F_j \( w \; x \)) - 1 #scale(x: 120%, y: 120%)[\)] . $ <ep:phase-multiplier>]

Here $D_(upright("tail") \, j)$ is the diagonal variance of the remaining mean-free Gaussian field. The entry terminal bound gives $D_(upright("tail") \, j) lt.eq C_J \( 1 + log D \)$, so it is uniformly bounded. For a fixed small nonzero real $w$, the average in (10.4) tends to a strictly negative number: the spatial cosine has zero mean and a strictly positive second moment. In particular $\| M_j \( w \) \| gt.eq c_w > 0$ for all sufficiently small $s \/ n_j$. The error in this mixed diagnostic is again $O \( parallel cal(R)_j^(upright("tor")) parallel + nu_j^2 \)$. These estimates, including their input derivatives at fixed $a'$, follow by the analytic terminal expansion, rather than by differentiating a limiting measure.

#thm([Lemma 10.1.])[
  (Phase factorization at a true reference).  #emph[At $\( k \, a' \) = \( k_h \, a_h \)$, 
$ bb(E) #scale(x: 120%, y: 120%)[\[] chi_n e^(w X_n) #scale(x: 120%, y: 120%)[\]] - bb(E) \[ chi_n \] exp \( a_h g w^2 \/ 2 \) arrow.r 0 $

 locally uniformly for complex $w$. The conclusion does not assert that $bb(E) chi_n$ has a nonzero limit or that the torus mean is asymptotically uniform.]
] <ep:phase-factorization>

#proof[
  We give the replica argument, since Gaussian convergence of $X_n$ alone would not imply this assertion. First remove the independent observation noise; its nonconstant test variance tends to zero, and its mean characteristic is a bounded deterministic multiplier. Take two independent pinned lattice fields $h^(\( 1 \)) \, h^(\( 2 \))$. The sum and difference are conditionally independent, with the same centered law, when their common coordinatewise parity class is fixed. This is the elementary change of variables $\( h^(\( 1 \)) \, h^(\( 2 \)) \) mapsto \( h^(\( 1 \)) + h^(\( 2 \)) \, h^(\( 1 \)) - h^(\( 2 \)) \)$: the quadratic energy splits and the two fields belong to the same coset of twice the height lattice.
  Let $V$ be the conditional second moment of the cosine test of the sum field. Expansion in the independent original copies gives
  $ bb(E) V = 2 "Var" X_n \, #h(2em) "Var" V = 2 #scale(x: 120%, y: 120%)[\(] bb(E) X_n^4 - 3 \( bb(E) X_n^2 \)^2 #scale(x: 120%, y: 120%)[\)] . $
  The last expression tends to zero by Gaussian fourth-moment convergence. Multiplication by a bounded character of the difference field therefore replaces $V$ by its mean with error tending to zero. Define
  $ F_n \( t \) = bb(E) e^(i macron(h) + i t X_n) . $
  The corresponding product expectation of the squared sum test and the difference character is $- 2 \( F_n F''_n - \( F'_n \)^2 \)$. More explicitly, for complex $t$,
  $ - 2 \( F_n F''_n - \( F'_n \)^2 \) = 2 "Var" \( X_n \) F_n^2 + bb(E) \[ \( V - 2 "Var" \( X_n \) \) e^(i macron(D) + i t X_n \( D \)) \] . $
  If $bb(E) e^(t X_n) lt.eq e^(B_0 t^2 \/ 2)$ for real $t$, the last expectation has modulus at most $sqrt(2 kappa_4 \( X_n \)) e^(2 B_0 \( "Im" t \)^2)$ by Cauchy–Schwarz. Consequently every locally uniform subsequential limit $F$ satisfies
  #[#set math.equation(numbering: n => "(10.5)")
   $ F F'' - \( F' \)^2 = - a_h g F^2 . $ <ep:replica-ode>]
  Bare domination supplies locally uniform bounds on the entire functions and all their fixed derivatives. The real transforms are nonnegative by the Gaussian-lattice Fourier representation. If $F$ is not identically zero, solve $\( log F \)'' = - a_h g$ on any positive interval. Analytic continuation then makes $F$ an exponential quadratic everywhere; in particular it has no isolated zero. Reflection or translation by half a cosine wavelength changes $X_n$ to $- X_n$ without changing $macron(h)$, so $F' \( 0 \) = 0$. Thus $F \( t \) = F \( 0 \) e^(- a_h g t^2 \/ 2)$. The identically zero limit has the same factorization. Analytic continuation to $t = - i w$ gives the stated Laplace version. Every subsequence has only limits of this form, which proves the assertion for the original sequence. ◻
]

#thm([Proposition 10.2.])[
  (No exit and vanishing at true references).  #emph[For every sufficiently small prescribed tube radius $rho > 0$, the entry choices can be made so that the true-reference plane trajectory stays in this tube at every step and tends to zero. The stopped torus remainders also tend to zero. If $a \( k_c \) = 8 pi$, the same entry choices keep all true-reference trajectories $\( k \, a \( k \) \)$, $k in \[ k_c \, k_c + delta \)$, in that tube for some $delta > 0$. Each of these trajectories tends to zero; uniform convergence in $k$ is not asserted here.]
] <ep:no-exit>

#proof[
  At the true reference both diagnostics tend to zero: Equation (10.3) uses the structural Laplace limit, and the mixed diagnostic uses Lemma 81. Their discrepancies can be made uniformly small for $n gt.eq s P$ by choosing $P$ large first and then $s$ sufficiently large. The block-profile error and the noise variance are $O \( \( s \/ n \)^2 \) lt.eq O \( P^(- 2) \)$, which explains this order. Before the first candidate exit, the separate torus recursion gives
  $ parallel cal(R)_j^(upright("tor")) parallel lt.eq C theta^j epsilon + C rho^2 $
  with the same earlier plane singleton inputs. At the candidate exit the new activities are still in a fixed multiple of the tube by the bounded map estimates. The nonzero two diagnostic multipliers therefore give $\| t_j \| + \| z_j \| lt.eq C \( delta_(upright("diag")) + epsilon + rho^2 \)$. Choose $rho$ first, with $C rho lt.double 1$, and then $delta_(upright("diag")) + epsilon lt.double rho$. This excludes the exit. The initial plane steps corresponding to sizes below $s P$ were controlled just after Equation (10.1).
  For convergence let $q$ be the limsup of the plane activity size. Contraction bounds the limsup of its remainder, and separately that of the stopped torus remainder, by $C q^2$. Taking limsups in the two diagnostics gives $q lt.eq C' q^2$. The tube is chosen smaller than $1 \/ C'$, so $q = 0$.
  For the final assertion, right continuity gives $a \( k \) arrow.b 8 pi$ as $k arrow.b k_c$. Fix a slightly larger input $k_1 > k_c$. Finite-volume Gaussian comparisons sandwich the mean-free Laplace functions for $k_c lt.eq k lt.eq k_1$ between those at the two endpoints. Their limiting Gaussian coefficients approach the same value as $k_1 arrow.b k_c$. Entire-function bounds turn this into uniform smallness of the requisite second and fourth moment discrepancies. The replica calculation in Lemma 81 then gives the mixed discrepancy uniformly as well: otherwise a violating sequence has an entire subsequential limit obeying (10.5), which is impossible. Choose the auxiliary bracket endpoint $k_1$ sufficiently close to $k_c$ first, then a common large-scale cutoff for the two fixed endpoint laws and entry scales with $s P$ above that cutoff. Finally shrink the actual input neighborhood to $\[ k_c \, k_c + delta \] subset.eq \[ k_c \, k_1 \]$ as required by entry. The preceding first-exit argument now holds throughout this right neighborhood. For each fixed input its limiting discrepancy is zero, so the individual limsup argument still proves convergence. ◻
]

=== 10.2 Exact Gaussian curves and positive response <exact-gaussian-curves-and-positive-response>

#thm([Lemma 10.3.])[
  (Removing all pure gradient drift).  #emph[Fix $J$, an allowed compact interval of reference coefficients, and admissible long-map parameters, including $L \, A \, h_0 \, kappa$, the regulator margins $h_(*) \, p_1 \, p_2$ when $e^V$ is used, and the terminal clearance $D$. There is a sufficiently large starting scale $m_min$ and a disk $\| d \| < d_0$ such that, at every entry scale $m gt.eq m_min$ and every reference in that interval, the long maps have exact Gaussian trajectories satisfying 
$ T_j^g \( d \) = d + O \( d^2 \) \, #h(2em) Z_j^g \( d \) = 0 \, #h(2em) cal(R)_j^g \( d \) = O \( d^2 \) . $

 The bounds are uniform in the step, the entry scale, and the reference, and analytic in $d$. The maps $T_j^g$ have analytic inverses on a common smaller disk. In particular both disks can be chosen before the physical entry scale and its observation-cell size are selected. In the coordinates 
#[#set math.equation(numbering: n => "(10.6)")
 $ u_j = \( T_j^g \)^(- 1) \( T_j \) \, #h(2em) B_j = cal(R)_j - cal(R)_j^g \( u_j \) \, $ <ep:normal-coordinates>]

 the exact pure Gaussian trajectory is $\( u \, 0 \, 0 \)$ at every step. Its first coordinate is unchanged, so there is no nonlinear forcing depending only on $u$.]
] <ep:gaussian-curves>

#proof[
  At side $m$ initialize with the exponential of $d sum_B e_B^0 \/ 2$, with no height-lattice factor. Expand it by the same occupied-block algebra. The singleton linear term is $d e_B^0 \/ 2$ and the remainder is $O \( d^2 \)$ in any prescribed fixed activity weight, since the small exponential energy is absorbed by the regulator reserve. We check that this assertion is uniform in the starting scale. A direction of scaled point norm one has $e_B^0 \( f \) lt.eq C_J$: there are $O \( m^2 \)$ sites in a block and each fixed-range difference is $O_J \( m^(- 1) \)$. Polarization gives $\| D e_B^0 \( phi.alt \) \[ f \] \| lt.eq C_J sqrt(U_m)$ and $\| D^2 e_B^0 \[ f \, g \] \| lt.eq C_J$; all higher derivatives vanish. The analytic derivative sum of a sufficiently small energy exponential is therefore absorbed by a fixed part of $W_m^kappa$, uniformly for $m gt.eq m_min$. The occupied-block expansion with the fixed weight $A$ has bounds $\( C_A \| d \| \)^(\| X \|)$ and, after removing its linear singleton, $C_A \| d \|^2$. The optional factor $e^V gt.eq 1$ only improves this initialization. Common-shift invariance keeps every charged coordinate zero.
  Direct Gaussian completion bounds all terminal logarithmic ratios under the smooth shift $F$ by $C \| d \|$, uniformly in the stopping scale. Indeed the tail covariance contracts the kinetic energy, and the relevant inverse $\( I - d C^(1 \/ 2) A_0 C^(1 \/ 2) \)^(- 1)$ is uniformly bounded on a fixed complex disk; determinants cancel from the ratio. The kinetic contraction is the form inequality $0 lt.eq C^(1 \/ 2) A_0 C^(1 \/ 2) lt.eq I$ for the remaining covariance, so its resolvent norm is at most $\( 1 - \| d \| \)^(- 1)$. The selected kinetic energy has shell and terminal expectation at most $C \| X \|$, uniformly in the starting scale, by the positive-order kernel estimates and Equation (9.15). Thus the terminal analytic estimates use the same regulator reserve at every such scale.
  Take diagnostic tori of side $n = D m L^j$ with the fixed $D$ chosen large enough for locality. The first Fourier mode used in the gradient diagnostic has energy bounded above and below uniformly in $m \, j$. Indeed its symbol converges to the continuum symbol for $m gt.eq m_min$, and its $s$-cell averaging multiplier is bounded away from zero when $s \/ n lt.eq 1 \/ D$ (here $s lt.eq m$). The independent observation-noise contribution is uniformly bounded as well. No lower restriction $n gt.eq s P$ is needed for this Gaussian initialization, because there are no entry sewing operations. The gradient diagnostic consequently gives, before a first exit from a fixed small tube, a bound $C \| d \| + C parallel cal(R)_j^(upright("tor")) parallel + C rho^2$ on its scalar coordinate, with constants independent of $m \, s \, j$. Contraction bounds the remainder by $C \| d \|^2 + C rho^2$ there. Choose the tube radius first and then the common $d_0$ sufficiently small. The same first-exit argument works for complex $d$, using absolute values of the analytic diagnostic, and excludes an exit on that disk. More quantitatively, on each parameter disk $\| d \| lt.eq delta lt.eq d_0$ take the tube radius $rho = M delta$, with $M$ fixed larger than the diagnostic constant. For sufficiently small common $d_0$ the same estimates exclude exit from that tube. This gives a uniform $O \( delta \)$ trajectory bound, and contraction improves the remainder to $O \( delta^2 \)$. Applying the conclusion with $delta = \| d \|$ gives the stated pointwise bounds. The derivative at $d = 0$ is exactly the unchanged gradient singleton, so the uniform analytic bounds give $T_j^g = d + O \( d^2 \)$, with a uniform derivative bound for the error. Taking $d_0$ smaller makes $\| \( T_j^g \)' \( d \) - 1 \| < 1 \/ 2$. The quantitative analytic inverse theorem gives the common inverse disk. Exactness of the Gaussian integrations shows that the trajectory with initial parameter $d$ maps to the trajectory with that same parameter at the next step. This proves the last assertion. Finally $\( cal(R)_j^g \)' \( 0 \) = 0$, so the contracted linear remainder map is unchanged by (10.6). ◻
]

#thm([Lemma 10.4.])[
  (Finite-volume response inequality).  #emph[For a pinned periodic height law with precision $A_0 \/ k$, let $C$ denote its covariance. For every real $f_0$ annihilating constants, 
#[#set math.equation(numbering: n => "(10.7)")
 $ frac(partial, partial k) "Var" \( h \, f_0 \) gt.eq frac(\( C f_0 \, A_0 C f_0 \), k^2) gt.eq frac("Var" \( h \, f_0 \)^2, k^2 \( f_0 \, A_0^(+) f_0 \)) . $ <ep:response-bound>]

 In particular, if $U_n = "Var" \( X_n \) \/ g$ at an input with $a \( k \) > 0$, then 
#[#set math.equation(numbering: n => "(10.8)")
 $ liminf_(n arrow.r oo) U'_n \( k \) gt.eq a \( k \)^2 \/ k^2 > 0 . $ <ep:positive-physical-response>]

 The same strictly positive lower bound, weakened by a fixed factor, holds uniformly on a sufficiently small neighborhood where the limiting variance is bounded below.]
] <ep:finite-response>

#proof[
  Differentiate the absolutely convergent pinned lattice sum:
  $ partial_k "Var" \( h \, f_0 \) = frac(1, 2 k^2) "Cov" #scale(x: 120%, y: 120%)[\(] \( h \, f_0 \)^2 \, \( h \, A_0 h \) #scale(x: 120%, y: 120%)[\)] . $
  Express the positive form $A_0$ as a sum of squares of real linear forms $ell_r$. The paired fourth-cumulant inequality in Lemma 4 gives
  $ "Cov" #scale(x: 120%, y: 120%)[\(] \( h \, f_0 \)^2 \, ell_r \( h \)^2 #scale(x: 120%, y: 120%)[\)] gt.eq 2 "Cov" #scale(x: 120%, y: 120%)[\(] \( h \, f_0 \) \, ell_r \( h \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Summing gives the first inequality in (10.7). On the quotient by constants, Cauchy–Schwarz gives $\( f_0 \, C f_0 \)^2 lt.eq \( f_0 \, A_0^(+) f_0 \) \( C f_0 \, A_0 C f_0 \)$; pinning selects a representative and changes neither side.
  Take $f_0 = B_s^(*) f_n$. Its bare Green form tends to $g$. The observation-noise variance is independent of $k$ and tends to zero, while the height variance tends to $a \( k \) g$. Division by $g$ proves (10.8). The neighborhood version follows from a positive lower variance bound and continuity of $k$ and of the fixed bare denominator. ◻
]

#thm([Proposition 10.5.])[
  (Openness and differentiability above $8 pi$).  #emph[If $a \( k_h \) > 8 pi$, then $k_h$ has an open neighborhood on which $a > 8 pi$ and $a$ is continuously differentiable. Consequently 
#[#set math.equation(numbering: n => "(10.9)")
 $ a \( k_c \) = 8 pi . $ <ep:endpoint-value>]

]
] <ep:supermarginal>

#proof[
  Use the gapped scheme without $Z$ and the coordinates of Lemma 83. Analyticity, exact vanishing on $B = 0$, and the diagonal balanced linearization give
  #[#set math.equation(numbering: n => "(10.10)")
   $ parallel B_(+) parallel & lt.eq \[ theta + C \( \| u \| + parallel B parallel \) \] parallel B parallel \,\
\| u_(+) - u \| & lt.eq C \( \| u \| + parallel B parallel \) parallel B parallel . $ <ep:gapped-B>]
  On a smaller tube the first factor is at most $theta' < 1$. These inequalities keep nearby entry data in the tube, make $B$ decay geometrically, and give a uniformly convergent limit $u_oo \( k \, a' \)$. For fixed $a'$ it is analytic in $k$ on a complex neighborhood. The convergence of its $k$ derivatives follows by Cauchy’s formula on a smaller disk.
  The scalar limit is jointly continuous in the real parameters. To verify the point concerning changing frequency, truncate the sole gradient balance sum in Equation (8.17) after $M$ terms. Its remaining operator norm is $O \( theta^M \)$, uniformly on the chosen compact reference interval in $\( 8 pi \, oo \)$; this scheme has no $Z$ balance sum. Every retained scalar evaluation is a finite-support integral or a finite Taylor projection. Absolute expansions and Gaussian domination with reserve give its continuity under varying $a'$. First take the parameter limit at fixed $M$, then $M arrow.r oo$. The tail of (10.10) is uniformly summable. The same argument, with Cauchy’s formula in $k$, proves continuity of $partial_k u_oo$. No norm continuity of periodic activities as their period varies is used.
  At $\( k_h \, a_h \)$, Proposition 82 gives $u_oo = 0$. Terminal differentiation at a zero gives
  #[#set math.equation(numbering: n => "(10.11)")
   $ U'_(n_j) \( k \) arrow.r a' partial_k u_oo \( k \, a' \) . $ <ep:gapped-response>]
  Here $U_n$ is the physical variance defined in Lemma 84, with the same $s$, $f_n$, and sequence $n_j$ throughout the neighborhood. To check (10.11), undo the balance and Gaussian curve changes: the gradient singleton derivative tends to $partial_k u_oo$, and the remainder derivatives tend to zero by differentiated contraction. The torus remainder has its own differentiated contraction with these same singleton inputs and also tends to zero. Differentiating (10.3) twice in $w$ and once in $k$ leaves $a' partial_k u_oo$ by (10.2). All discarded terms converge uniformly on compact subsets of the zero set. This argument computes the derivative of the actual finite-volume observable and does not differentiate a reference-dependent substitute. Equation (10.8) implies $partial_k u_oo \( k_h \, a_h \) > 0$.
  Choose $k_(-) < k_h < k_(+)$ so close that $u_oo \( k_(-) \, a_h \) < 0$ and $u_oo \( k_(+) \, a_h \) > 0$, with $partial_k u_oo > c > 0$ on the intervening neighborhood. Joint continuity preserves this bracket for every reference $a'$ in an open interval about $a_h$. The Intermediate Value Theorem supplies a unique zero $k = k \( a' \)$ there. At this zero the terminal activities vanish and the physical variance tends to $a' g$; the structural limit identifies $a \( k \( a' \) \) = a'$. Structural strict increase makes this assignment unique even outside the chosen bracket. Uniqueness and compactness show that $k \( a' \)$ is continuous; it is strictly increasing, and hence its image contains an open interval about $k_h$.
  Use one fixed entry construction and one fixed sequence of physical functions $U_n$ on a compact subinterval of that image. At each input evaluate its derivative using the appropriate reference $a' = a \( k \)$, held fixed during that evaluation. Uniform convergence in (10.11), continuity of the zero assignment, and continuity of its right-hand side imply uniform convergence of $U'_n$ to a continuous function. The variances themselves converge to $a \( k \)$ uniformly there: each $U_n$ is nondecreasing by Lemma 84, and pointwise convergence to the continuous $a$ becomes uniform by squeezing between the values on a finite grid whose successive $a$ values differ by an arbitrarily small amount. The Fundamental Theorem of Calculus, applied before the limit and then passed under the uniform bound, proves that $a$ is continuously differentiable, with derivative $a \( k \) partial_k u_oo \( k \, a \( k \) \)$.
  If $a \( k_c \) > 8 pi$, the zero interval just obtained would contain inputs below $k_c$ with positive coefficient. This contradicts Corollary 18. The positive-coefficient gap therefore forces (10.9). Strict increase gives $a \( k \) > 8 pi$ for every $k > k_c$, so the differentiability conclusion applies throughout that interval. ◻
]

=== 10.3 Critical state estimates <critical-state-estimates>

The endpoint value and differentiability above it are now established. To prove the infinite slope, we first need the decay rate of the actual critical trajectory. The free-face estimate from Section 2 will rule out exponential decay of its odd part; the local map will then determine its slower decay.

Initialize the two-coordinate maps at the actual onset, with the fixed entry choices of Proposition 82, and allow true references $a' = a \( k \)$ for $k gt.eq k_c$ sufficiently close. The entry-family balanced coordinates of Equations (8.17)–(8.17) separate the two scalar directions from the contracted remainder. Equation (10.6) then parametrizes the exact Gaussian curves by $u$ and measures the remainder relative to those curves by $B$, leaving the fundamental coordinate $Z$ unchanged. A common translation by $pi \/ alpha$ splits the remainder as $B = B_e + B_o$ into its even and odd parts. This convention can be reversed once, changing the sign of the fundamental coordinate, without affecting the physical field.

#thm([Lemma 10.6.])[
  (The parity-resolved map).  #emph[There are $theta_1 < 1$, a fixed small tube, and a constant $C$ such that, uniformly in that tube and for the stated references, 
#[#set math.equation(numbering: n => "(10.12)")
 $ u_(+) - u =  & - H_j Z^2 + O #scale(x: 120%, y: 120%)[\(] \( \| u \| + Z^2 \) \( Z^2 + parallel B_e parallel \) + parallel B_e parallel^2 + parallel B_o parallel \( \| Z \| + parallel B_o parallel \) #scale(x: 120%, y: 120%)[\)] \,\
Z_(+) - lambda Z =  & - b_j u Z + O #scale(x: 120%, y: 120%)[\(] \( u^2 + Z^2 + parallel B_e parallel \) \| Z \| + \( \| u \| + Z^2 + parallel B_e parallel + parallel B_o parallel^2 \) parallel B_o parallel #scale(x: 120%, y: 120%)[\)] \,\
parallel B_(e \, +) parallel lt.eq  & theta_1 parallel B_e parallel + C \( \| Z \| + parallel B_o parallel \)^2 \,\
parallel B_(o \, +) parallel lt.eq  & theta_1 parallel B_o parallel + C \( \| u \| + Z^2 + parallel B_e parallel \) \| Z \| . $ <ep:u-map>]

 The remainders have the differentiated Taylor bounds implied by these orders. Here $H_j = - b_(j \, upright("en"))^(z z)$ and $b_j = - b_(j \, upright("en"))^(t z)$ are the coefficients of the actual entry-family balanced map. They are uniformly bounded above and bounded below by positive constants. At the onset, 
$ H_j arrow.r H := H_(upright("en")) = frac(8 pi dot.op pi, 4) e^(8 pi c_(v \/ sqrt(32))) log L > 0 \, #h(2em) b_j arrow.r b := b_(upright("en")) = 2 log L > 0 . $

 All occurrences of $H \, b$ and bounds for $H_j \, b_j$ in the remaining endpoint argument refer to this entry family.]
] <ep:parity-map>

#proof[
  The linear balanced map is diagonal on $\( T \, Z \)$ and contracted on the remainder. Lemma 83 removes every term that survives on $Z = B = 0$. Half-period symmetry makes the first coordinate even and the second odd. Their surviving quadratic terms are $- H_j Z^2$ and $- b_j u Z$, with the entry-family signs and limits in Proposition 73. Indeed the change is $T = T_j^g \( u \) = u + O \( u^2 \)$ and $cal(R) = B + cal(R)_j^g \( u \) = B + O \( u^2 \)$, with both corrections depending only on $u$ and with $Z$ unchanged. The balanced linear scalar map has no remainder forcing. Substitution to quadratic order can therefore change only the pure $u^2$ coefficient in the first scalar equation; it preserves the coefficients of $Z^2$ and $u Z$. The even remainder is forced at lowest order by two odd factors. The odd remainder has no linear fundamental forcing by the diagonalization and is forced by $u Z$ and higher orders. Terms linear in a remainder, with a small coefficient, are absorbed by increasing the contraction constant from $theta$ to $theta_1 < 1$; small quadratic terms involving $B_o$ in its own equation are absorbed there as well. Taylor expansion on a smaller analytic ball now gives exactly (10.12)–(10.12). Cauchy’s formula gives the corresponding differentiated bounds. The estimates remain valid with the entry regulator by Lemma 78. ◻
]

#thm([Lemma 10.7.])[
  (The odd sector is not exponentially small).  #emph[At $k = k_c$, the pair $\( Z_j \, B_(o \, j) \)$ does not satisfy $\| Z_j \| + parallel B_(o \, j) parallel lt.eq C theta.alt^j$ for any $theta.alt < 1$.]
] <ep:odd-nonexponential>

#proof[
  Let $z_n^(upright("face"))$ be the positive characteristic ratio of the averaged four-face probability profile on a free square of side $n$. The critical coefficient is $8 pi$, so Lemma 7 gives a common $c_0 > 0$ such that, for every fixed sufficiently large $G = L^r$,
  $ liminf_(n arrow.r oo) z_(G n)^(upright("face")) \/ z_n^(upright("face")) gt.eq c_0 . $
  Replace $c_0$ by a smaller number in $\( 0 \, 1 \)$. For each fixed $r$, the inequality with $c_0 \/ 2$ holds beyond a threshold that may depend on $r$. Iterating separately on the $r$ residue classes of the index $j$ in (10.1) gives
  $ limsup_(j arrow.r oo) frac(- log z_(n_j)^(upright("face")), j) lt.eq frac(log \( 2 \/ c_0 \), r) . $
  Since $r$ is arbitrary and $z_n^(upright("face")) lt.eq 1$, $- log z_(n_j)^(upright("face")) = o \( j \)$.
  We spell out the change from a face profile to a uniform profile. Their difference has uniformly bounded bare energy. Along that direction write $ell \( t \) = log w \( rho + t q \)$. The logarithmic Hessian comparison of Lemma 4 gives $ell'' gt.eq - M$ for a fixed $M$, and $ell lt.eq 0$. Thus $0 gt.eq ell \( 0 \) + t ell' \( 0 \) - M t^2 \/ 2$ for every real $t$, so $\| ell' \( 0 \) \| lt.eq sqrt(2 M \| ell \( 0 \) \|)$. Integrating the Hessian bound from $0$ to $1$ gives
  $ ell \( 1 \) gt.eq ell \( 0 \) - sqrt(2 M \| ell \( 0 \) \|) - M \/ 2 . $
  It follows that the uniform-profile characteristic also has negative logarithm $o \( j \)$. Restoring the periodic bonds increases this characteristic ratio by precision comparison. The independent mean observation noise contributes the positive factor $e^(- "Var" \( macron(eta) \) \/ 2)$, whose logarithm is bounded. Therefore
  #[#set math.equation(numbering: n => "(10.13)")
   $ - log bb(E) e^(i macron(Y)_(n_j)) = o \( j \) . $ <ep:phase-lower>]
  If the plane odd sector decayed exponentially, the linear balance relation and the contracted torus odd recursion would make its unbalanced fundamental singleton and stopped torus odd remainder exponentially small as well. To see the latter without identifying the two remainders, iterate its contraction: it is bounded by an exponentially decaying initial term plus a convolution of a fixed geometric kernel with the exponentially small plane odd forcing. In the terminal integral for $e^(i macron(Y))$, every nonzero term contains an odd factor, since the common-mean integral otherwise vanishes. Absolute terminal bounds on the remaining factors would then give $\| bb(E) e^(i macron(Y)_(n_j)) \| lt.eq C theta.alt_1^j$ for some $theta.alt_1 < 1$, contrary to (10.13). ◻
]

#thm([Lemma 10.8.])[
  (The compulsory state strip).  #emph[At $k_c$, after a finite step and a choice of the half-period convention, 
$ Z_j > 0 \, quad parallel B_(o \, j) parallel lt.eq epsilon Z_j \, quad parallel B_(e \, j) parallel lt.eq C_e Z_j^2 . $

 The first two remainder inequalities persist in a sufficiently small tube, also for sufficiently small $mu = 1 - lambda gt.eq 0$. Any trajectory in these cones which tends to zero satisfies 
#[#set math.equation(numbering: n => "(10.14)")
 $ c_(-) frac(Z_j^2, mu + Z_j) < u_j < c_(+) frac(Z_j^2, mu + Z_j) \, #h(2em) parallel B_j parallel = O \( Z_j^2 \) $ <ep:strip>]

 after a further transient, with fixed $0 < c_(-) < c_(+)$. At $k_c$ in particular, 
#[#set math.equation(numbering: n => "(10.15)")
 $ Z_j asymp j^(- 1) \, #h(2em) sum_j Z_j = oo \, #h(2em) u_j / Z_j arrow.r sqrt(H \/ b) . $ <ep:critical-state-asymptotics>]

 The strip in (10.14) is a necessary condition for convergence to zero; its boundaries are not asserted to be forward invariant.]
] <ep:state-strip>

#proof[
  Fix $epsilon > 0$ small. When $parallel B_o parallel lt.eq epsilon \| Z \|$, Equation (10.12) gives $\| Z_(+) \| gt.eq \( 1 - o \( 1 \) \) \| Z \|$ at criticality, with preserved sign, whereas (10.12) gives $parallel B_(o \, +) parallel lt.eq theta_1 epsilon \| Z \| + o \( \| Z \| \)$. Thus this cone is invariant in a small tube, and its ratio tends to zero. If the cone is never reached on a tail, $\| Z \| < epsilon^(- 1) parallel B_o parallel$ there; Equation (10.12) gives $parallel B_(o \, +) parallel lt.eq \( theta_1 + C delta \/ epsilon \) parallel B_o parallel$ when the tube has radius $delta$. Choosing $theta_1 + C delta \/ epsilon < 1$, and using $\| Z \| < epsilon^(- 1) parallel B_o parallel$ at each later step of this alternative, contracts the whole odd pair geometrically. This contradicts Lemma 87. The odd pair cannot become zero, for then it would stay zero. Reverse the convention if necessary to make $Z$ positive.
  Its step ratio now tends to one. Iterating (10.12) against this slowly varying sequence gives $parallel B_e parallel lt.eq C_e Z^2$: choose a number $r < 1$ with $r^2 > theta_1$, then eventually $Z_(+) gt.eq r Z$, and sum the geometric convolution of $Z_i^2$. The homogeneous term is negligible since $log Z_j = o \( j \)$. Taking $C_e$ larger makes this even cone invariant whenever the step ratio remains close to one; this applies uniformly for small $mu$ and a small tube.
  Within these cones, making $epsilon$ and the tube smaller, (10.12)–(10.12) have the form
  #[#set math.equation(numbering: n => "(10.16)")
   $ u_(+) - u = - tilde(H)_j Z^2 \, #h(2em) Z_(+) \/ Z = 1 - mu - tilde(b)_j u + O \( Z^2 \) \, $ <ep:reduced-state>]
  where $0 < h_(-) lt.eq tilde(H)_j lt.eq h_(+)$ and $0 < b_(-) lt.eq tilde(b)_j lt.eq b_(+)$. A trajectory converging to zero therefore has $u_j = sum_(i gt.eq j) tilde(H)_i Z_i^2 > 0$.
  For $c > 0$ put $f_c \( Z \) = c Z^2 \/ \( mu + Z \)$. For a step with $u = f_c \( Z \)$, the Mean Value Theorem, (10.16), and $f'_c \( Z \) = c Z \( 2 mu + Z \) \/ \( mu + Z \)^2$ show that
  #[#set math.equation(numbering: n => "(10.17)")
   $ frac(f_c \( Z \) - f_c \( Z_(+) \), Z^2) = c frac(2 mu + Z, mu + Z) [frac(mu, mu + Z) + tilde(b)_j c frac(Z^2, \( mu + Z \)^2)] + o \( 1 \) \, $ <ep:barrier-decrement>]
  uniformly for fixed $c$ in the small tube. The error is uniform also when $mu \/ Z$ tends to zero or infinity. The prefactor $\( 2 mu + Z \) \/ \( mu + Z \)$ lies in $\[ 1 \, 2 \]$. If $c = c_(-)$ is sufficiently small, the right side is less than $h_(-) \/ 2$; if $c = c_(+)$ is sufficiently large, it exceeds $2 h_(+)$. For the latter assertion write $r = mu \/ \( mu + Z \)$: the bracket is $r + tilde(b)_j c \( 1 - r \)^2$, whose minimum yields a positive lower bound after multiplication by large $c$. The choice of tube is made after fixing $c_plus.minus$.
  The gap estimates on the exterior regions use the uniform coefficient bounds, rather than monotonicity of the effective coefficients. Write $Z_(+) = Z \( 1 - q \)$, where $q = mu + tilde(b)_j u + e_j$ and $\| e_j \| lt.eq C_0 Z^2$, and shrink the tube so $\| q \| lt.eq 1 \/ 2$. If $0 < u lt.eq f_(c_(-)) \( Z \)$, then for $q < 0$ the barrier decrement is negative, whereas for $q gt.eq 0$ convexity gives
  $ frac(f_(c_(-)) \( Z \) - f_(c_(-)) \( Z_(+) \), Z^2) lt.eq 2 c_(-) \( 1 + b_(+) c_(-) \) + 2 C_0 c_(-) Z lt.eq h_(-) \/ 2 . $
  Here choose $c_(-)$ so that the first term is at most $h_(-) \/ 4$, and then the tube so the second is at most $h_(-) \/ 4$. Thus the lower gap decreases by at least $h_(-) Z^2 \/ 2$ throughout that exterior region.
  For the upper region choose $c_(+)$ so large that $min { c_(+) \/ 4 \, b_(-) c_(+)^2 \/ 16 } gt.eq 2 h_(+)$, and then the tube so $C_0 \( mu + Z \) lt.eq b_(-) c_(+) \/ 2$. If $u gt.eq f_(c_(+)) \( Z \)$, then $q gt.eq mu + \( b_(-) \/ 2 \) u > 0$. The identity $f'_c \( y \) \/ y = c \( 2 mu + y \) \/ \( mu + y \)^2$ shows that $f'_c \( y \) gt.eq \( y \/ Z \) f'_c \( Z \)$ for $0 < y lt.eq Z$. Since $Z_(+) gt.eq Z \/ 2$, the Mean Value Theorem gives, with $r = mu \/ \( mu + Z \)$,
  $ frac(f_(c_(+)) \( Z \) - f_(c_(+)) \( Z_(+) \), Z^2) gt.eq c_(+) / 2 [r + frac(b_(-) c_(+), 2) \( 1 - r \)^2] gt.eq min { c_(+) \/ 4 \, b_(-) c_(+)^2 \/ 16 } gt.eq 2 h_(+) . $
  Hence the upper gap increases by at least $h_(+) Z^2$ throughout its exterior region.
  A trajectory converging to zero has $u > 0$ at every such step. Starting on either barrier therefore gives a strictly signed gap at the next step, and the corresponding exterior gap inequality keeps that gap bounded away from zero afterwards. This contradicts $u \, Z arrow.r 0$. The strict inequalities in Equation (10.14) follow. This argument does not assert forward invariance of the strip.
  In particular $u lt.eq C Z$. Equation (10.12) now has forcing $O \( Z^2 \)$, and its geometric convolution, using the step ratio close to one, gives $parallel B_o parallel = O \( Z^2 \)$ after a transient. At $mu = 0$ the strip gives $u asymp Z$, so (10.16) gives $c Z lt.eq 1 - Z_(+) \/ Z lt.eq C Z$. Hence $1 \/ Z_(+) - 1 \/ Z$ is between two positive constants eventually, which proves $Z_j asymp j^(- 1)$ and divergence of its sum. Since the remainders are $O \( Z^2 \)$ and the coefficients converge, $x_j = u_j \/ Z_j$ satisfies
  $ x_(j + 1) - x_j = \( b x_j^2 - H + o \( 1 \) \) Z_j . $
  It lies between two positive constants by the strip. For any $delta > 0$, once the error is small, at or above $sqrt(H \/ b) + delta$ its increment is at least $c_delta Z_j$ and cannot cross that level downwards. Divergence of $sum Z_j$ would force violation of the upper bound. Below $sqrt(H \/ b) - delta$ the reverse argument violates the positive lower bound. Consequently $x_j$ tends to $sqrt(H \/ b)$. ◻
]

=== 10.4 Critical derivative growth <critical-derivative-growth>

The critical state estimate gives $Z_j asymp j^(- 1)$, so its cumulative effect over scales is not summable. We now differentiate the finite maps to determine how this affects the response to the physical input. The finite-volume response inequality will select the growing derivative direction and its sign.

Let

$ p_j = partial_k u_j \, #h(2em) d_j = partial_k Z_j \, #h(2em) r_j = partial_k B_j $

with $a'$ held fixed at each input. These derivatives exist at each finite step by Theorem 77 and the analytic maps. They are not derivatives along the curve $k mapsto \( k \, a \( k \) \)$.

#thm([Lemma 10.9.])[
  (Stable or growing derivative).  #emph[At the critical input the derivative either tends to zero in all coordinates, or its scalar part aligns with the unstable eigenspace of 
#[#set math.equation(numbering: n => "(10.18)")
 $ M = mat(delim: "(", 0, - 2 H; - b, - sqrt(b H)) . $ <ep:critical-matrix>]

 The second alternative actually occurs. More precisely, eventually 
#[#set math.equation(numbering: n => "(10.19)")
 $ p_j > 0 \, #h(2em) p_j arrow.r oo \, #h(2em) d_j / p_j arrow.r - 1 / 2 sqrt(b \/ H) \, #h(2em) parallel r_j parallel = o \( p_j \) . $ <ep:critical-response-sign>]

]
] <ep:derivative-dichotomy>

#proof[
  Differentiate the map in Lemma 86. Equation (10.15) and $parallel B parallel = O \( Z^2 \)$ give
  #[#set math.equation(numbering: n => "(10.20)")
   $ binom(p_(+), d_(+)) & = #scale(x: 120%, y: 120%)[\[] I + Z \( M + o \( 1 \) \) #scale(x: 120%, y: 120%)[\]] binom(p, d) + O \( Z parallel r parallel \) \,\
parallel r_(+) parallel & lt.eq theta_2 parallel r parallel + C Z \( \| p \| + \| d \| \) \, #h(2em) theta_2 < 1 . $ <ep:critical-derivative>]
  In particular there is no derivative of $lambda$ here.
  Put $d_0 = sqrt(b H)$. The eigenvalues of $M$ are $d_0$ and $- 2 d_0$, with an unstable eigenvector $\( 1 \, - 1 / 2 sqrt(b \/ H) \)$. In scalar eigenvector coordinates write $xi$ for the unstable component and $w$ for the stable one. Choose $C_1$ large and set $y = max \( \| w \| \, C_1 parallel r parallel \)$. For any prescribed small $epsilon > 0$, the cone $y lt.eq epsilon \| xi \|$ is invariant on a sufficiently late tail. Indeed the stable scalar component has multiplier $1 - 2 d_0 Z + o \( Z \)$, the unstable component has multiplier $1 + d_0 Z + o \( Z \)$, and the $r$ contribution to either scalar is at most $C Z y \/ C_1$. Choose $C_1$ so this coefficient is smaller than $d_0 \/ 10$, then take the tail perturbation smaller than a fixed multiple of $epsilon d_0$. The $r$ component contracts by $theta_2$ with forcing $O \( Z \| xi \| \)$; taking the tail still later makes it satisfy the same strict cone inequality. Inside the cone $\| xi_(+) \| gt.eq \( 1 + d_0 Z \/ 2 \) \| xi \|$.
  If the cone is never entered on this tail, $\| xi \| lt.eq y \/ epsilon$. The stable estimate, after the above choice of $C_1$ and a sufficiently small tail perturbation, and the fast remainder estimate give $y_(+) lt.eq \( 1 - c Z \) y$ as long as this alternative persists. For the remainder part use $theta_2 y + C Z y \/ epsilon lt.eq \( 1 - c Z \) y$ at sufficiently small $Z$. Thus $y arrow.r 0$ and $xi arrow.r 0$, since $sum Z = oo$. If the cone is entered, it remains entered and $\| xi \|$ diverges. Applying the same comparison with arbitrarily small prescribed $epsilon$ shows $y \/ \| xi \| arrow.r 0$. This proves the dichotomy and alignment.
  We now use the physical response to select its alternative and sign. Undoing the coordinate changes gives $t'_j = p_j + O \( u_j p_j \) + O \( parallel r_j parallel \)$; analogous bounds hold for the fundamental derivative. A stopped torus remainder derivative satisfies, separately from the plane remainder,
  #[#set math.equation(numbering: n => "(10.21)")
   $ parallel partial_k cal(R)_j^(upright("tor")) parallel lt.eq C theta_2^(j - j_0) + C sum_(i = j_0)^(j - 1) theta_2^(j - 1 - i) delta_i \( \| t'_i \| + \| z'_i \| \) \, #h(2em) delta_i arrow.r 0 . $ <ep:torus-derivative-convolution>]
  The update of the unbalanced remainder has no linear forcing from a singleton. Its differentiated forcing therefore has the coefficient $O \( \| t_i \| + \| z_i \| + parallel cal(R)_i^(upright("tor")) parallel \)$, which tends to zero by the state contraction. This proves (10.21), with the bounded initial segment absorbed into its first term.
  If all derivatives tended to zero, the convolution would tend to zero and terminal differentiation would give $U'_(n_j) \( k_c \) arrow.r 0$, contradicting (10.8). In the growing alternative the cone bounds the magnitude of every earlier scalar derivative on the growing tail by a fixed multiple of its current magnitude. Split the convolution into a fixed initial segment and a tail on which $delta_i$ is arbitrarily small. It follows that its right side is $o \( \| p_j \| \)$. The same holds for the plane remainder. Differentiating the terminal logarithmic ratio twice in the source and once in $k$ consequently gives
  #[#set math.equation(numbering: n => "(10.22)")
   $ U'_(n_j) \( k_c \) = a \( k_c \) p_j + o \( \| p_j \| \) . $ <ep:critical-terminal-response>]
  Linear odd terms vanish in this mean-free diagnostic. The positive lower bound in (10.8) forces the sign in (10.22) to be positive. The unstable eigenvector then gives exactly (10.19). ◻
]

#thm([Lemma 10.10.])[
  (Entering the cones at nearby references).  #emph[Fix $M_(*)$ large and $eta_(*) > 0$ small with strict inequalities $eta_(*) < 1 / 2 sqrt(b \/ H) < M_(*)$, and fix any $eta_1 > 0$. A single sufficiently late finite step can be chosen so that, for every sufficiently close warmer true reference, the state enters the cones of Lemma 88 and the derivative satisfies 
$ p > 0 \, #h(2em) - M_(*) < d \/ p < - eta_(*) < 0 \, #h(2em) parallel r parallel < eta_1 p . $

 The scalar inequalities in (10.14) and a bound $parallel B parallel lt.eq C_B Z^2$ hold from this step onward, with $C_B$ depending only on the coarse state estimates, independently of the chosen step, prescribed tube, and warmer reference. The step can also be required to lie in any prescribed sufficiently small state tube. This conclusion uses no continuity in the full activity norm as $a'$ varies.]
] <ep:parameter-continuity>

#proof[
  For every fixed step the scalar coordinates and their held-reference $k$ derivatives converge to their critical values as $k arrow.b k_c$. Here is the precise continuity argument. The initial finite-support integrals are continuous in $\( k \, a' \)$: at the fixed entry mesh the massive energy matrices have uniform coercivity, and all link sums have uniformly summable truncations. A finite number of convolutions and local projections can be tested on fixed fields and directions, including the constant, affine, and Gaussian arguments of the localization rules. Gaussian domination with the reserve in the $W e^V$ regulator passes the limit in each such integral. For any fixed depth there is a locally uniform Cauchy disk in $k$, so the same statement holds for its input derivatives. The radius is allowed to depend on that finite depth. Truncate the two balance sums in Equations (8.17) and (8.17). Here the reference interval is chosen with $lambda gt.eq lambda_(*) := 1 - mu_0 > theta$, so their remaining operator norms are respectively $O \( theta^M \)$ and $O \( \( theta \/ lambda_(*) \)^M \)$, uniformly on that interval. Remove these tails after taking the parameter limit at fixed $M$. The analytic inverse Gaussian coordinates preserve scalar continuity. These operations prove the asserted finite-step scalar continuity without comparing functions of different periods in a norm.
  For the remainder norms use upper limits at each fixed step. They are initially bounded, including their input derivatives, by the uniform entry estimates. Their upper limits obey (10.12)–(10.12) along the limiting critical scalar trajectory. Contraction first gives an odd bound $O \( Z \)$; substituting that bound gives an even bound $O \( Z^2 \)$, and substituting $u = O \( Z \)$ and that even bound gives the odd bound $O \( Z^2 \)$. The homogeneous terms vanish relative to these powers because the critical scalar sequence varies only on the $1 \/ j$ scale. The coarse choice of $C_e$ can be made with a strict margin over the eventual even upper-limit ratio, since both bounds use the same geometric contraction. Retain that fixed choice.
  For the derivative upper limits, (10.20) gives a geometric convolution forced by $C Z \( \| p \| + \| d \| \)$ along the critical trajectory. Its ratio to the growing critical $p$ tends to zero, by the same split into a fixed initial history and a late history as in (10.21).
  The quadratic remainder constant can also be fixed independently of the selected step. Let $q_0 in \( sqrt(theta_1) \, 1 \)$ be a fixed lower bound for $Z_(+) \/ Z$ in the persistent remainder cones of the coarse tube and reference range, as in the proof of Lemma 88. Each nearby true-reference trajectory stays in that tube and tends to zero by Proposition 82. Applied to any tail in the cones, the exterior-gap argument proving (10.14) therefore gives $0 < u < c_(+) Z$ at every step of that tail. The even cone and (10.12) consequently give
  $ parallel B_(o \, +) parallel lt.eq theta_1 parallel B_o parallel + F Z^2 $
  with $F$ fixed by the coarse state estimates. The preceding upper-limit convolution also gives a fixed eventual bound $D_o$ for $limsup_(k arrow.b k_c) parallel B_(o \, j) \( k \) parallel \/ Z_j \( k_c \)^2$. Choose $C_o$ larger than both $D_o$ and $F \/ \( q_0^2 - theta_1 \)$, with strict margins. Then $theta_1 C_o + F < q_0^2 C_o$, so the displayed recursion preserves $parallel B_o parallel lt.eq C_o Z^2$. Together with the even cone this gives the fixed constant $C_B = C_e + C_o$.
  Now choose a finite step so late that all state and derivative inequalities, including the fixed quadratic remainder bound, have strict margins there and the state lies in the prescribed small tube. Finite-step scalar continuity and the remainder upper-limit bounds preserve those margins for $k > k_c$ sufficiently close. The invariant remainder cones persist, the scalar strip applies to their convergent tails, and the fixed quadratic bound just proved persists at every later step. ◻
]

=== 10.5 The warmer crossover and the infinite endpoint slope <the-warmer-crossover-and-the-infinite-endpoint-slope>

The preceding growth concerns derivatives at the critical input. To identify the slope of the limiting coefficient, we must also follow nearby warmer trajectories through their eventual decay. We first take their terminal-volume limit at each fixed input, then let that input decrease to $k_c$. The crossover estimate below shows that the growth accumulated before decay persists in this order of limits.

#thm([Proposition 10.11.])[
  (Divergent response from the warmer side).  #emph[As $k arrow.b k_c$, 
#[#set math.equation(numbering: n => "(10.23)")
 $ frac(d, d k) a \( k \) arrow.r + oo \, #h(2em) frac(a \( k \) - a \( k_c \), k - k_c) arrow.r + oo . $ <ep:infinite-derivative>]

]
] <ep:infinite-response>

#proof[
  The fixed late entry step from Lemma 90 will be chosen after the constants below. For a warmer reference put $mu = 1 - L^(2 - a \( k \) \/ \( 4 pi \)) > 0$, held fixed in each input differentiation. Work first in the fixed coarse tube of the preceding state argument. For a convergent tail in its persistent remainder cones, the reduced state equation and scalar strip give, uniformly in this tube,
  #[#set math.equation(numbering: n => "(10.24)")
   $ c \( mu + Z \) lt.eq 1 - Z_(+) \/ Z lt.eq C \( mu + Z \) . $ <ep:crossover-state>]
  Indeed
  $ frac(mu + Z^2 \/ \( mu + Z \), mu + Z) = 1 - frac(Z, mu + Z) + (frac(Z, mu + Z))^2 in \[ 3 \/ 4 \, 1 \] . $
  The $O \( Z^2 \)$ error in (10.16) is absorbed by the earlier small choice of the coarse tube. That choice and the reference range also make the right side of (10.24) less than $1 \/ 2$, so $Z$ decreases along the whole tail.
  Use the equivalent state size $sigma = \| u \| + \| Z \| + parallel B_e parallel + parallel B_o parallel$ for the tubes, and write the fixed coarse tube as $sigma < rho_(upright(c))$. The persistent remainder cones and the upper scalar strip imply, at every step after cone entry,
  $ sigma_j lt.eq \( 1 + c_(+) + epsilon + C_e rho_(upright(c)) \) Z_j = : K Z_j lt.eq K Z_(j_0) lt.eq K sigma_(j_0) \, #h(2em) j gt.eq j_0 . $
  Here $K$ depends only on the coarse state estimates, not on the late step or the smaller derivative tube chosen below. This tail bound uses no differentiated estimate. At any chosen fixed late step, scalar continuity makes the initial $Z$ bounded above and bounded below by positive constants uniformly as $k arrow.b k_c$.
  We record the derivative comparison with its parameter order. Fix positive bounds $H_plus.minus \, b_plus.minus$ for the entry-family coefficients. Choose $M_(*) > 1 / 2 sqrt(b \/ H)$ large and then $eta > 0$ small so that the two broad endpoint signs verified below have strict margins. While $Z gt.eq mu$, the state strip gives $mu + b_j u lt.eq C_(*) Z$ for a fixed $C_(*)$. Next choose $eta_(*) > 0$ so small that
  $ eta_(*) < 1 / 2 sqrt(b \/ H) \, #h(2em) 2 H_(+) eta_(*)^2 + C_(*) eta_(*) < b_(-) \/ 2 . $
  Choose $epsilon_1 > 0$ after these constants, small compared with all the strict endpoint margins and with $H_(-) eta_(*)$. Then choose the remainder ratio $eta_1 > 0$ and the state tube sufficiently small that the differentiated Taylor errors below have size $O \( epsilon_1 Z \)$ and the strict remainder contraction preserves $parallel r parallel lt.eq eta_1 p$. In particular, its radius $rho_(upright(d)) lt.eq rho_(upright(c))$ in the state size $sigma$ is chosen after $eta_1$, using the fixed $C_B$ from Lemma 90. Apply that lemma with the smaller entry radius $rho_(upright(d)) \/ \( 2 K \)$. It supplies a single late entry step with $sigma_(j_0) < rho_(upright(d)) \/ \( 2 K \)$, and the preceding tail bound gives $sigma_j < rho_(upright(d)) \/ 2$ for every $j gt.eq j_0$. Thus the differentiated estimates apply throughout the tail. Shrink the warmer neighborhood so that its initial $Z$ also exceeds $mu$. Put $x = d \/ p$. In the cone
  $ - M_(*) lt.eq x lt.eq eta \, #h(2em) p > 0 \, #h(2em) parallel r parallel lt.eq eta_1 p \, $
  the differentiated maps give
  #[#set math.equation(numbering: n => "(10.25)")
   $ p_(+) \/ p & = 1 - 2 H_j Z x + O \( epsilon_1 Z \) \,\
d_(+) \/ p & = \( 1 - mu - b_j u \) x - b_j Z + O \( epsilon_1 Z \) \, $ <ep:warm-p>]
  with the just chosen $epsilon_1$. Terms involving $B = O \( Z^2 \)$ and higher scalar orders are included in that error; those involving $r$ are bounded by $C Z eta_1$. Equation (10.20) remains valid.
  The unperturbed ratio map in (10.25)–(10.25) is increasing on this fixed interval: its derivative has positive numerator $1 - mu - b_j u - 2 H_j b_j Z^2$ and a positive squared denominator. At an endpoint $x$ its increment has numerator
  #[#set math.equation(numbering: n => "(10.26)")
   $ 2 H_j Z x^2 - \( mu + b_j u \) x - b_j Z . $ <ep:ratio-numerator>]
  At $x = - M_(*)$ this is positive by at least $c Z$ if $M_(*)$ is large; at $x = eta$ it is negative by at least $c Z$ if $eta$ is small. These strict signs absorb the errors in (10.25)–(10.25). The denominator stays positive in the small tube. The remainder inequality, its strict contraction, and small $Z$ preserve $parallel r parallel lt.eq eta_1 p$. Thus the full derivative cone is invariant.
  While $Z gt.eq mu$, the upper boundary can be replaced by the already chosen $x = - eta_(*)$: Equation (10.26) there is at most $Z \( 2 H_(+) eta_(*)^2 + C_(*) eta_(*) - b_(-) \) < - b_(-) Z \/ 2$. The critical entry value lies strictly below this boundary by Lemma 90. The choice of $epsilon_1$ preserves this sign and makes $2 H_(-) eta_(*) - O \( epsilon_1 \) > 0$. Consequently throughout this first stage,
  #[#set math.equation(numbering: n => "(10.27)")
   $ p_(+) gt.eq \( 1 + c Z \) p . $ <ep:pre-crossover-growth>]
  Let $j_times$ be the first index with $Z < mu$. It is finite by (10.24). Before that index the relative decrement is comparable to $Z$. Taking logarithms in (10.24) therefore gives
  $ sum_(j_0 lt.eq j < j_times) Z_j gt.eq c log \( Z_(j_0) \/ mu \) - C arrow.r oo . $
  The last step crosses $mu$ by a ratio bounded below by $1 \/ 2$, which accounts for the fixed additive constant. The initial $p_(j_0)$ stays bounded below positively. Equation (10.27) implies $p_(j_times) arrow.r oo$ as $mu arrow.b 0$.
  After crossover, (10.24) gives $Z_(j + 1) lt.eq \( 1 - c mu \) Z_j$, and hence
  #[#set math.equation(numbering: n => "(10.28)")
   $ sum_(j gt.eq j_times) Z_j lt.eq Z_(j_times) \/ \( c mu \) lt.eq C . $ <ep:post-crossover-sum>]
  The larger invariant ratio cone gives $p_(+) \/ p gt.eq 1 - C Z$, so the possible decrease of $p$ on this entire tail is at most a fixed multiplicative factor. For each fixed $mu > 0$, $\| p_(+) \/ p - 1 \| lt.eq C Z$ and summability imply the existence of a finite positive limit $p_oo$. The equation for $d$ has a multiplier tending to $1 - mu < 1$ and a forcing tending to zero; the contracted remainder equation has the same property. Thus
  #[#set math.equation(numbering: n => "(10.29)")
   $ p_j arrow.r p_oo > 0 \, #h(2em) d_j arrow.r 0 \, #h(2em) r_j arrow.r 0 \, #h(2em) p_oo arrow.r oo quad \( mu arrow.b 0 \) . $ <ep:warm-limits>]
  For the last limit combine the divergent pre-crossover gain with (10.28).
  On compact subintervals of $k > k_c$ sufficiently close to $k_c$, the parameter $mu$ is bounded away from zero and is continuous by Proposition 85. All tail estimates just used are then uniform. Undoing the coordinates and applying the differentiated terminal diagnostic, including the separate torus convolution estimate, yields
  $ U'_(n_j) \( k \) arrow.r a \( k \) p_oo \( k \) $
  uniformly on those compact subintervals. This uses the physical functions $U_(n_j)$ of the current entry construction. Each is continuously differentiable and nondecreasing in $k$ by Lemma 84, and the structural limit gives $U_(n_j) \( k \) arrow.r a \( k \)$ pointwise. On a compact warmer interval, $a$ is continuous by Proposition 85. A finite grid on which its successive increments are arbitrarily small, together with monotonicity of each $U_(n_j)$, therefore makes this convergence uniform. Write $v \( k \) = a \( k \) p_oo \( k \)$. The displayed uniform derivative convergence makes $v$ continuous, as the uniform limit of the finite continuous derivatives. Applying the Fundamental Theorem of Calculus to this same sequence and passing to the limit gives
  $ a \( y \) - a \( x \) = integral_x^y v \( k \) thin thin upright(d) k $
  for every $x < y$ in the compact interval. Thus $frac(d, d k) a \( k \) = v \( k \)$ there, and (10.29) proves the first limit in (10.23). Finally $a$ is right continuous at $k_c$ and differentiable on its right. For any $M > 0$, the derivative exceeds $M$ on a sufficiently short right interval. Apply the Mean Value Theorem on $\[ k_c \, k \]$ to obtain $\( a \( k \) - a \( k_c \) \) \/ \( k - k_c \) gt.eq M$ there. Since $M$ is arbitrary, the second limit follows. ◻
]

#thm([Corollary 10.12.])[
  (Completion of the height assertions).  #emph[For every admissible finite-range $J$, the uniquely determined effective temperature is 
$ beta_(upright("eff")) \( J \, beta \) = v_J^2 a \( beta \/ v_J^2 \) \, #h(2em) beta gt.eq beta_(upright(c)) \( J \) . $

 It has the field, Laplace-functional, and tightness conclusions in Theorem 1, is differentiable for $beta > beta_(upright(c)) \( J \)$, and satisfies 
$ beta_(upright("eff")) \( J \, beta_(upright(c)) \( J \) \) = 8 pi v_J^2 \, #h(2em) lim_(beta arrow.b beta_(upright(c)) \( J \)) frac(beta_(upright("eff")) \( J \, beta \) - beta_(upright("eff")) \( J \, beta_(upright(c)) \( J \) \), beta - beta_(upright(c)) \( J \)) = + oo . $

 Its high-temperature normalization and spread-out onset are 
$ beta_(upright("eff")) \( J \, beta \) = beta + O_J \( e^(- c_J beta) \) \, #h(2em) frac(beta_(upright(c)) \( J_rho \), 8 pi v_(J_rho)^2) arrow.r 1 . $

 For nearest neighbors the endpoint value is $2 pi$.]
] <ep:height-conclusion>

#proof[
  The physical criterion, including the endpoint, is Corollary 18. Its torus coefficient and full Laplace and distributional limits are Theorem 17; a single nonzero mean-free test determines that coefficient uniquely. Those structural limits hold along all growing square sides, so they apply to every sequence $n = L^N$, with for example $L = 2$, independently of the larger auxiliary factor used in the endpoint maps. Equation (10.9) and Propositions 85 and 91 give the endpoint and regularity statements. The change of variables $k = beta \/ v_J^2$ cancels the two factors $v_J^2$ in the derivative and in the difference quotient. Corollaries 75 and 76 supply the last two asymptotics with exactly this normalization. Finally $v_(J_(upright("nn")))^2 = 1 \/ 4$, so $8 pi v_(J_(upright("nn")))^2 = 2 pi$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
