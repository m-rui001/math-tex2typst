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

#align(center)[#text(size: 16pt, weight: "bold")[Microscopic jamming in the negative spherical perceptron]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The problem and the proof architecture <sec:introduction>

=== 1.1 Background and contribution <background-and-contribution>

Jamming links the loss of feasibility in a system of random constraints to singular distributions of small positive gaps and weak forces. The negative-margin spherical perceptron is a particularly simple setting in which this connection can be studied: its variables lie on a sphere, its constraints are linear inequalities, and its feasible set is nonconvex. Franz and Parisi [9] identified this model with the jamming universality class of high-dimensional spheres. Their analysis predicted isostaticity, the balance between contact constraints and degrees of freedom, together with the gap and force exponents. Their equations use a continuum of replica-overlap levels, called full replica-symmetry breaking.

The scaling mechanism and numerical values have an earlier origin in the full replica-symmetry-breaking solution for hard spheres developed by Charbonneau, Kurchan, Parisi, Urbani and Zamponi [5]. Franz, Parisi, Sevelev, Urbani and Zamponi [10] subsequently analyzed the spherical perceptron on both sides of jamming. In particular, they derived the zero-temperature scaling from the unsatisfiable side, the contact atom and normalized force distribution, and the relation between the critical exponents by matching the scaling regimes. Parisi and Zamponi [21] gave a direct analytic proof of that relation within the scaling equations. Their argument assumes the existence of the full replica-symmetry-breaking profile and the convergence and matching of its scaling expansion. Constructing and selecting the microscopic limit is a separate problem.

The relation between gap and force exponents also has a mechanical stability antecedent. Wyart [23] derived a stability inequality for sphere packings and predicted its saturation at marginal stability. Lerner, Düring and Wyart [14] distinguished the extended rearrangements governed by that inequality from localized buckling, which obeys a different bound. The force exponent in the full replica-symmetry-breaking hard-sphere solution is the extended-mode exponent [5]. These mechanical arguments provide a conceptual comparison; the present proof derives its endpoint mass estimates from the microscopic equilibrium model.

The feasibility question also belongs to the older spherical storage-capacity problem, which asks how many random linear constraints admit a vector on a sphere. Gardner [11] and Gardner and Derrida [12] developed replica calculations for binary-pattern neural-network models; the latter identified instability of the replica-symmetric continuation at negative margins. For Gaussian constraints at a fixed negative margin, Stojnic [22] Section 2.3 proved a one-sided infeasibility bound. Montanari, Zhong and Zhou [16] Theorems 4.1–4.2 subsequently proved feasible and infeasible density regions whose bounds agree to leading order as the margin tends to $- oo$. These bounds do not establish a sharp threshold at margin $- 1$ or determine the microscopic gap and force laws studied here.

Here we establish the corresponding equilibrium statement directly for the random spherical model with quadratic penalty. The result includes a sharp feasibility threshold, the existence and identification of the ordered limiting gap and force laws, and their invariance under a fixed small independent Gaussian scale mixture in each pattern coordinate. It also identifies the critical susceptibility power and encloses the exponents with a finite certificate. The exponent values, relation, normalized force convention, and approach from the unsatisfiable side are thus consistent with the preceding physical predictions. The mathematical content is the passage from the microscopic model through these limits, including the selection and error bounds needed for the stated conclusions.

There are three linked difficulties. First, the spherical constraint prevents a direct convex-feasibility argument, while the quadratic penalty is unbounded. Second, vanishing energy alone does not imply exact satisfiability, and a weak critical limit need not preserve contact mass or force normalization. Third, writing down a stationary scaling profile does not show that the microscopic critical layer approaches it. The proof addresses these issues through a variational pressure formula and a separate feasibility repair, a convex Brownian martingale problem with endpoint control, and a contraction for all possible rescaled critical limits.

The pressure proof uses the interpolation scheme of Guerra [13] and the block-cavity organization of Aizenman, Sims and Starr [1], including its spherical implementation by Chen [8]. For the present row Hamiltonian, concavity of the row functional supplies the interpolation sign, while the lower bound requires a separate row expansion and identification of the empirical cavity covariance. Coordinate comparison uses the smooth-function form of Lindeberg replacement [6]; controlling spins concentrated on a few coordinates requires the additional entropy argument described below.

The hierarchical change-of-measure and cavity viewpoint follows the Ruelle probability-cascade framework of Bolthausen and Sznitman [3]. The Brownian formulation is related to the variational representation of Boué and Dupuis [4] and the stochastic-control treatment of the Parisi equation by Auffinger and Chen [2]. The passage from stochastic controls to a variational problem over Brownian martingales has a close precedent in Mourrat’s dual formulation of the Parisi functional [17]. The martingale representation and uniqueness results of Chen, Issa and Mourrat [7] further develop this approach for multi-species spin glasses. These works provide methodological precedents for the convex martingale problem used here. The present formulation requires a concave quadratic terminal penalty, nonnegative martingales with square-integrable terminal values, and control of a singular critical endpoint. The arguments below establish the corresponding identities, critical uniqueness, and scaling selection for the microscopic limits constructed here.

=== 1.2 Model and observables <model-and-observables>

Fix $alpha > 0$, let $M = floor.l alpha N floor.r$, and let $A$ be an $M times N$ matrix with independent entries. In empirical observables containing $M^(- 1)$, take $N$ large enough that $M gt.eq 1$. Initially the entries are standard normal. On

$ bb(S)_N = { x in bb(R)^N : parallel x parallel^2 = N } $

use normalized surface measure $sigma_N$. For $y = x \/ sqrt(N)$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ g_mu \( x \) = A_mu y \, #h(2em) h_mu \( x \) = 1 + g_mu \( x \) \, #h(2em) V \( z \) = 1 / 2 \( - 1 - z \)_(+)^2 \, #h(2em) H_N \( x \) = sum_(mu = 1)^M V \( g_mu \( x \) \) . $ <eq:intro-model>]

Here $z_(+) = max \( z \, 0 \)$ and $z_(-) = max \( - z \, 0 \)$. Since $parallel y parallel = 1$, the condition $H_N \( x \) = 0$ is exactly $A y gt.eq - upright(bold(1))$ componentwise, the spherical storage-capacity problem at margin $kappa = - 1$. The realization is satisfiable (SAT) if $H_N$ vanishes somewhere on $bb(S)_N$ and is unsatisfiable (UNSAT) otherwise. At inverse temperature $beta > 0$, write $chevron.l dot.op chevron.r_(N \, beta \, alpha)$ for integration against

$ frac(e^(- beta H_N \( x \)) thin sigma_N \( upright(d) x \), integral e^(- beta H_N \( x \)) thin sigma_N \( upright(d) x \)) . $

Disorder expectation is $bb(E)$; subscripts on the Gibbs brackets are omitted when unambiguous.

For $0 < delta < u$, put

#[#set math.equation(numbering: n => "(1.2)")
 $ G_(N \, beta \, alpha) \( delta \, u \) = bb(E) ⟨1 / M sum_(mu = 1)^M upright(bold(1)) { delta < h_mu \( x \) lt.eq u }⟩ . $ <eq:intro-gap-observable>]

Forces are defined on the violated constraints $C \( x \) = { mu : h_mu \( x \) < 0 }$. When this set is nonempty, let

$ overline(r) \( x \) = frac(1, \| C \( x \) \|) sum_(nu in C \( x \)) \( - h_nu \( x \) \) \, #h(2em) f_mu \( x \) = frac(- h_mu \( x \), overline(r) \( x \)) quad \( mu in C \( x \) \) \, $

and set

#[#set math.equation(numbering: n => "(1.3)")
 $ F_(N \, beta \, alpha) \( s \) = bb(E) ⟨frac(1, \| C \( x \) \|) sum_(mu in C \( x \)) upright(bold(1)) { f_mu \( x \) lt.eq s }⟩ \, #h(2em) s > 0 . $ <eq:intro-force-observable>]

The integrand is defined to be zero when $C \( x \) = diameter$.

All limits at jamming are taken from UNSAT in the order

#[#set math.equation(numbering: n => "(1.4)")
 $ lim_(alpha arrow.b alpha_c) med lim_(beta arrow.r oo) med lim_(N arrow.r oo) . $ <eq:intro-order>]

For gaps the lower cutoff is removed subsequently:

#[#set math.equation(numbering: n => "(1.5)")
 $ G_J \( u \) & = lim_(delta arrow.b 0) lim_(alpha arrow.b alpha_c) lim_(beta arrow.r oo) lim_(N arrow.r oo) G_(N \, beta \, alpha) \( delta \, u \) \,\
F_J \( s \) & = lim_(alpha arrow.b alpha_c) lim_(beta arrow.r oo) lim_(N arrow.r oo) F_(N \, beta \, alpha) \( s \) . $ <eq:intro-GJ>]

The limits $u arrow.b 0$ and $s arrow.b 0$ are taken last. This convention distinguishes positive gaps from contacts without assuming a limiting density.

The perturbations considered here have coordinate law

#[#set math.equation(numbering: n => "(1.6)")
 $ nu_epsilon = 1 / 2 cal(N) \( 0 \, 1 - epsilon \) + 1 / 2 cal(N) \( 0 \, 1 + epsilon \) \, #h(2em) 0 lt.eq epsilon < 1 \, $ <eq:intro-mixture>]

where the second argument is the variance. Coordinates and rows remain independent. This law is centered with variance one; for $epsilon > 0$ it is non-Gaussian, since its fourth moment is $3 \( 1 + epsilon^2 \)$.

=== 1.3 Main result <main-result>

#thm([Theorem 1.1.])[
  (Microscopic criticality and mixture universality).  #emph[There exist $alpha_c in \( 0 \, oo \)$ and $epsilon_0 in \( 0 \, 1 \)$ with the following properties for every fixed $epsilon in \[ 0 \, epsilon_0 \)$ and coordinate law $nu_epsilon$.]
  + #emph[The SAT probability tends to one at every fixed $alpha < alpha_c$ and to zero at every fixed $alpha > alpha_c$.]
  + #emph[All the ordered limits in (1.5)–(1.5) exist for their indicated positive arguments. They are independent of $epsilon$.]
  + #emph[$F_J$ is the cumulative distribution function on $\( 0 \, oo \)$ of a probability law of mean one. It has no atom at zero. There are exponents $gamma \, theta$ such that 
$ G_J \( u \) = u^(1 - gamma + o \( 1 \)) \, #h(2em) F_J \( s \) = s^(1 + theta + o \( 1 \)) \, $

 as the corresponding argument decreases to zero, and 
$ gamma = frac(1, 2 + theta) \, #h(2em) 0.4126930 < gamma < 0.4126934 \, #h(2em) 0.4231063 < theta < 0.4231088 . $

]
] <thm:main>

The limiting full gap law has a contact atom of mass $1 \/ alpha_c$ (Lemma 53). Multiplying this contact fraction by the constraint density gives one contact per degree of freedom in the ordered critical equilibrium limit. This is the isostaticity predicted for the model; it also identifies the conditioning mass used to normalize forces.

=== 1.4 The endpoint mechanism and the spectral characterization <subsec:intro-endpoint>

The two exponents arise from different fluctuation scales with the same small probability mass. The proof constructs a positive, nonincreasing susceptibility $chi : \[ 0 \, 1 \) arrow.r \( 0 \, 1 \]$, normalized by $chi \( 0 \) = 1$ and vanishing at the critical endpoint $t = 1$. Here $t$ is the variance time of the Brownian representation of the critical limit, rather than a microscopic dynamical time. Put

$ tau = 1 - t \, #h(2em) w \( t \) = integral_t^1 chi \( v \)^(- 2) thin upright(d) v . $

The remaining Brownian scales for gaps and residual forces are, respectively, $sqrt(tau)$ and $sqrt(w \( t \))$. Section 9 proves that $w \( t \) asymp tau \/ chi \( t \)^2$ and that the strictly positive masses up to these two scales are both comparable to $chi \( t \)$. Equivalently, for a fixed $c_f > 0$ accounting for mean force normalization,

$ G_J \( sqrt(tau) \) asymp chi \( t \) \, #h(2em) F_J \( c_f sqrt(w \( t \)) \) asymp chi \( t \) . $

Here $asymp$ denotes bounds in both directions by fixed positive constants, uniformly as $t arrow.t 1$. These statements concern cumulative masses and require no assumption of a limiting density.

If $chi \( 1 - tau \) = tau^(a + o \( 1 \))$ with $0 < a < 1 \/ 2$, the gap and force cutoffs have logarithmic powers $1 \/ 2$ and $\( 1 - 2 a \) \/ 2$, while their masses have power $a$. Their cumulative powers are therefore $2 a$ and $2 a \/ \( 1 - 2 a \)$. The remaining task is to prove that the susceptibility has such a power and to select $a$; a stationary scaling ansatz alone would not establish either assertion.

The selected value is characterized by a scalar boundary-value and spectral problem. For $a in \[ 0 \, 0.41 \]$, Section 10 constructs the unique stationary reference $M_a : bb(R) arrow.r bb(R)$ in the class $- 1 lt.eq M'_a lt.eq 0$, $M''_a > 0$, satisfying

#[#set math.equation(numbering: n => "(1.7)")
 $ 1 / 2 M''_a + (z / 2 + a M_a) M'_a + (a - 1 / 2) M_a = 0 \, $ <eq:intro-reference>]

with the bounds

$ phi.alt \( z \) - z Phi \( - z \) lt.eq M_a \( z \) lt.eq frac(phi.alt \( z \), Phi \( z \)) . $

Here $phi.alt$ and $Phi$ are the standard normal density and distribution function. Put $B_a \( z \) = z \/ 2 + a M_a \( z \)$ and let $lambda \( a \)$ be the lowest eigenvalue of the Friedrichs realization on $L^2 \( bb(R) \)$ of

#[#set math.equation(numbering: n => "(1.8)")
 $ cal(H)_a = - 1 / 2 frac(upright(d)^2, upright(d) z^2) + 1 / 2 #scale(x: 120%, y: 120%)[\(] B_a^2 + B'_a #scale(x: 120%, y: 120%)[\)] . $ <eq:intro-spectral>]

There is a unique root $a_(*)$ of $lambda \( a \) = a$ in

#[#set math.equation(numbering: n => "(1.9)")
 $ 0.2936533 < a_(*) < 0.2936535 . $ <eq:intro-root-bracket>]

The exponents in Theorem 1 are

#[#set math.equation(numbering: n => "(1.10)")
 $ gamma = 1 - 2 a_(*) \, #h(2em) theta = frac(2 a_(*), 1 - 2 a_(*)) - 1 . $ <eq:intro-exponents>]

The root enclosure and the contraction selecting it are proved with the finite certificate in Section 12 and Appendix 13.

=== 1.5 Architecture and conventions <architecture-and-conventions>

Sections 2–3 construct the hierarchical functionals and the concavity estimates used in the Gaussian pressure formula, where pressure means the expected logarithm of the partition function divided by $N$. The hierarchy describes the possible laws of the overlap $N^(- 1) x dot.op x'$ between replicas, meaning independent samples from a fixed-disorder Gibbs measure. The row functional records how adding one constraint changes the pressure; its concavity supplies the sign needed in the interpolation and cavity bounds of Section 4.

At fixed positive temperature, small row perturbations turn pressure information into an empirical row law. Adding $d psi$ to the single-row exponent $- beta V$ couples the pressure to the empirical average of a smooth compactly supported test $psi$. An upper bound that touches the pressure at $d = 0$ for both signs of $d$ pins down this average; a determining family of tests then identifies the row law. Section 5 compares that law with the coordinate-mixture model, including configurations whose mass is concentrated on a few coordinates. On a fixed density neighborhood of the threshold, the same sufficiently small fixed mixture is admissible at every fixed positive temperature, so the resulting identical functions pass through the prescribed later limits. For feasibility, Section 6 starts from subextensive minimum energy at a slightly higher density, deletes a fixed fraction of the rows, and repairs the remaining constraints exactly at the target density.

Sections 7 and 8 pass to zero temperature and then to the threshold. A susceptibility profile measures the response along the hierarchy; a nonnegative Brownian martingale represents the residual force. Joint convexity and a uniqueness argument on one Wiener space identify the critical profile. Strong endpoint convergence and small-cutoff estimates preserve the contact mass and normalized force law.

The final two stages address the critical singularity. Section 9 relates small-gap and small-force masses to the susceptibility and proves that its associated increasing order parameter has no constant interval sufficiently near the endpoint. Section 10 takes limits after translating logarithmic endpoint time. Every resulting solution is defined for all translated times and satisfies the same integral identities. Quantitative barriers first confine these solutions; a strict contraction then forces their susceptibility slope to be the selected scalar root. Section 12 certifies the finite inequalities used in that step. The principal outputs and their precise locations are:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Output
], table.cell(rowspan: 1, colspan: 1)[Proof location
]),
  table.cell(rowspan: 1, colspan: 1)[Gaussian variational pressure and touching upper bounds for both signs of a compact row perturbation
], table.cell(rowspan: 1, colspan: 1)[Proposition 20; (4.11)
],
  table.cell(rowspan: 1, colspan: 1)[Equality of the thermodynamic row laws, and of the gap and normalized-force observables, at each fixed positive temperature for sufficiently small mixtures
], table.cell(rowspan: 1, colspan: 1)[Proposition 24
],
  table.cell(rowspan: 1, colspan: 1)[Exact satisfiability below the common threshold, obtained by repairing a system with subextensive energy
], table.cell(rowspan: 1, colspan: 1)[Theorem 31
],
  table.cell(rowspan: 1, colspan: 1)[A unique normalized physical critical limit, strong convergence through the endpoint, and the prescribed ordered gap and force laws
], table.cell(rowspan: 1, colspan: 1)[Proposition 49, Proposition 52, Theorem 55
],
  table.cell(rowspan: 1, colspan: 1)[Two-sided endpoint mass estimates and full increase support near the endpoint
], table.cell(rowspan: 1, colspan: 1)[Proposition 61; Proposition 64
],
  table.cell(rowspan: 1, colspan: 1)[The selected susceptibility slope, from entire-limit rigidity and the finite certificate
], table.cell(rowspan: 1, colspan: 1)[Proposition 68; Section 12
],
  table.cell(rowspan: 1, colspan: 1)[The cumulative exponents and their exact relation
], table.cell(rowspan: 1, colspan: 1)[Section 11
],
)
]

The mixture argument identifies the fixed-temperature functions; Corollary 32 transfers each subsequent Gaussian limit in the prescribed order. Sections 10 and 12 form one computer-assisted argument: the former proves the analytic implications of the quantitative inequalities, including the required tail bounds, and the latter verifies their finite enclosures. The short completion in Section 11 then combines the endpoint mass estimates with the selected slope.

We use $C \, c$ for finite positive constants whose permitted dependencies are stated locally. The notation $f asymp g$ means two-sided bounds by such constants, uniform in the limit under discussion. Profiles are identified up to equality almost everywhere. A reference to a support concerns the support of the associated increasing measure, not the set where its cumulative distribution is positive.

The analytic prerequisites are Gaussian concentration and integration by parts, Brownian martingale representation, Brownian time change and reflection, Itô calculus, elementary parabolic comparison and interior regularity, the Dovbysh–Sudakov representation [19], the support-radius consequence of the Ghirlanda–Guerra identities [18], Panchenko’s ultrametricity theorem [20], and the Marchenko–Pastur limit [15]. Their precise uses are specified where they enter. All model-specific compactness, comparison, limiting, and numerical arguments are supplied below.

== 2 Hierarchical Gaussian functionals and spherical entropy <sec:hierarchy>

The pressure calculation separates the contribution of a new constraint from that of new spin coordinates. We construct the corresponding row and spherical functionals on a common Gaussian hierarchy. For the row functional we identify its derivative with respect to the covariance profile. For the spherical functional we compute its limit and the entropy conjugate $E \( q \)$ used in the pressure formula.

The common hierarchy is a random family of leaf weights, together with Gaussian marks shared by leaves having a common ancestor. We first prove its change-of-measure and sampling rules. These rules identify which marks remain independent after a row is inserted. The continuity lemma then passes these conclusions through limits of replica arrays under explicit moment bounds. Throughout, a profile specifies only off-diagonal covariances; the diagonal is a separate parameter. This distinction determines the independent terminal Gaussian noise in a row insertion.

The finite cascade and its reweighting are the objects of Bolthausen–Sznitman’s abstract cavity method [3]. We give the marking calculation explicitly, including the genealogy and independent terminal noise used in the row insertions below.

=== 2.1 Finite cascades and their change of measure <finite-cascades-and-their-change-of-measure>

Let $cal(Q)_Q$ be the set of nonnegative nondecreasing functions $q : \[ 0 \, 1 \) arrow.r \[ 0 \, Q \]$, identified up to Lebesgue-null sets. Write $q_(*) := "ess sup" q$. For a step profile, fix

$ 0 = m_(- 1) < m_0 < dots.h.c < m_k = 1 \, #h(2em) q \( s \) = q_j quad \( m_(j - 1) lt.eq s < m_j \) \, #h(2em) w_j := m_j - m_(j - 1) . $

Repeated values $q_j$ are allowed. A cascade of depth $k$ has leaves $tau = \( tau_1 \, dots.h \, tau_k \) in bb(N)^k$. At every vertex of depth $j - 1$, independently, place a Poisson point process on $\( 0 \, oo \)$ with intensity $m_(j - 1) s^(- 1 - m_(j - 1)) thin upright(d) s$; its points are the weights of the outgoing edges. Let $W_tau$ be the product of the edge weights on the path to $tau$, and set

$ T = sum_tau W_tau \, #h(2em) v_tau = W_tau \/ T . $

A depth-zero cascade consists of one leaf of weight one. The following facts also prove that the normalizing sum is finite and positive.

#thm([Lemma 2.1.])[
  (Stable sums and the cascade change of measure).  #emph[For a fixed finite cascade, $0 < T < oo$ almost surely and $bb(E) \| log T \|^2 < oo$. Attach marks to its vertices, independently of the Poisson processes, with conditionally independent and identically distributed child marks given the ancestral marks. A terminal function $X_tau$ of the path marks determines recursive functions by 
#[#set math.equation(numbering: n => "(2.1)")
 $ X_v = 1 / m_(j - 1) log bb(E) #scale(x: 120%, y: 120%)[\[] exp \( m_(j - 1) X_(v i) \) divides upright("marks up to ") v #scale(x: 120%, y: 120%)[\]] quad upright("at depth ") j - 1 . $ <eq:hier-mark-recursion>]

 Suppose these moments are finite and $bb(E) \| X_diameter \| < oo$. Reweighting the leaf probabilities by $e^(X_tau)$ preserves the law of their genealogy. Conditional on the transformed genealogy, the child-mark transition at depth $j$ is multiplied by 
#[#set math.equation(numbering: n => "(2.2)")
 $ exp { m_(j - 1) \( X_(v i) - X_v \) } . $ <eq:hier-child-tilt>]

 Root marks retain their original distribution. Moreover, 
#[#set math.equation(numbering: n => "(2.3)")
 $ bb(E) log sum_tau v_tau e^(X_tau) = bb(E) X_diameter . $ <eq:hier-root-expectation>]

 If the marks are independent families and $X_tau$ is the sum of one function of each family, both the recursion and the tilted path law factor over the families, including conditional on the genealogy of finitely many replicas.]
] <lem:hier-cascade-tilt>

#proof[
  For $0 < m < 1$, a Poisson sum $S = sum_i s_i Y_i$, with intensity $m s^(- 1 - m) thin upright(d) s$ and iid nonnegative marks satisfying $0 < bb(E) Y^m < oo$, has Laplace transform
  $ bb(E) e^(- t S) = exp { - Gamma \( 1 - m \) bb(E) \( Y^m \) t^m } . $
  Indeed, the Poisson Laplace functional reduces the exponent to $m bb(E) integral_0^oo \( 1 - e^(- t s Y) \) s^(- 1 - m) thin upright(d) s$; integration by parts evaluates this integral. The resulting positive stable random variable has finite positive moments of every order less than $m$ and finite negative moments of every order. The latter follows directly from $x^(- a) = Gamma \( a \)^(- 1) integral_0^oo t^(a - 1) e^(- t x) thin upright(d) t$; the former follows by applying the corresponding integral formula to $x^a$, $0 < a < m$. Consequently $bb(E) \| log S \|^2 < oo$. Starting at the last generation and using $m_0 < dots.h.c < m_(k - 1)$ proves these assertions for every subtree total, and hence for $T$.
  Here is the change of measure at one vertex. Write $mu \( upright(d) omega \)$ for the conditional law of a child mark and put $c \( omega \) = e^(X_(v i) - X_v)$. Under the map $\( s \, omega \) mapsto \( s c \( omega \) \, omega \)$, the marked intensity becomes
  $ m_(j - 1) s^(- 1 - m_(j - 1)) thin upright(d) s thin c \( omega \)^(m_(j - 1)) mu \( upright(d) omega \) . $
  The second factor is a probability measure by (2.1). Thus the transformed weights have their original Poisson law and are independent of marks with transition (2.2).
  We spell out why this yields independence of the #emph[entire] transformed weight array from the marked tree. At depth two, write the root mark as $B$, a child mark as $A_i$, and its descendant marks as $C_(i j)$. Let $s_i$ and $t_(i j)$ be the edge processes of exponents $m_0$ and $m_1$. Set
  $ X_1 \( B \, A \) = m_1^(- 1) log bb(E)_C e^(m_1 X_2 \( B \, A \, C \)) \, #h(2em) X_0 \( B \) = m_0^(- 1) log bb(E)_A e^(m_0 X_1 \( B \, A \)) . $
  The lower transformation $t'_(i j) = t_(i j) e^(X_2 \( B \, A_i \, C_(i j) \) - X_1 \( B \, A_i \))$ has, conditional on $\( B \, A_i \)$, the original unmarked Poisson law, denoted $cal(P)_(m_1)$, independently of child marks with tilted transition $K_1 \( upright(d) C divides B \, A_i \)$. In particular this law of the complete unmarked lower process is independent of $A_i$ and $B$. Before the upper transformation a decorated child therefore has law
  $ mu_0 \( upright(d) A divides B \) thin cal(P)_(m_1) \( upright(d) t' \) product_j K_1 \( upright(d) C_j divides B \, A \) . $
  The upper map $s'_i = s_i e^(X_1 \( B \, A_i \) - X_0 \( B \))$ replaces only $mu_0$ by its tilted transition $K_0$; it leaves $cal(P)_(m_1)$ unchanged. The marked-Poisson theorem makes the ordered $s'_i$ independent of these iid decorated children. Thus, after both reorderings, all the transformed weights are independent of the hierarchical marked tree, conditional on $B$. The same argument inducts upward for any depth: replace $cal(P)_(m_1)$ by the already transformed descendant weight-array law, which is independent of its ancestor mark. A sampled genealogy depends only on the complete weight array and independent sampling uniforms. This includes the descendant total masses used in selecting a child. Conditioning on that genealogy therefore does not tilt its marks again. Replicas sharing a vertex reuse the one mark already drawn there; no additional power depending on the number of replicas is introduced.
  Reordering preserves a bijection of leaves. Under that correspondence, products of the edge multipliers telescope:
  $ W'_tau = W_tau e^(X_tau - X_diameter) \, #h(2em) log sum_tau v_tau e^(X_tau) = X_diameter + log T' - log T . $
  Conditionally on root marks, $T'$ and $T$ have the same marginal law; they need not be independent. Their integrable logarithms therefore cancel in expectation. The root factor cancels in normalized leaf probabilities, so the root marks are not tilted. Finally, exponential moments of a sum of independent families factor at each recursion step, and so do the Radon–Nikodym factors in (2.2). This proves the last assertion. ◻
]

For clarity, the genealogy used here can be constructed without appealing to any unproved identification of an overlap array. We record its sampling rule.

#thm([Lemma 2.2.])[
  (Sampling a cascade and the continuous rank array).  #emph[For two independent samples from a depth-$k$ cascade, the probability that their leaves share exactly $j$ edges is $w_j$, $0 lt.eq j lt.eq k$; sharing $k$ edges includes selecting the same leaf. There exists a weakly exchangeable ultrametric array $\( U_(a b) \)_(a \, b gt.eq 1)$ with $U_(a a) = 1$ and $U_12$ uniform on $\[ 0 \, 1 \]$, such that every step-profile cascade covariance array has law 
$ C_(a a) = Q \, #h(2em) C_(a b) = q \( U_(a b) \) quad \( a eq.not b \) . $

 All the finite-dimensional laws of this rank array are determined by its nested partition sampling rule.]
] <lem:hier-rank-array>

#proof[
  We give the sampling computation, including the change caused by an ancestor. Let a Poisson process have intensity $c beta s^(- 1 - beta) thin upright(d) s$, $0 < beta < 1$, and total $S$. Change its law by $S^eta \/ bb(E) S^eta$, where $0 lt.eq eta < beta$. For a specified partition of $n$ sampled indices into $b$ blocks of sizes $n_1 \, dots.h \, n_b$, normalized Poisson weights give probability
  #[#set math.equation(numbering: n => "(2.4)")
   $ frac(product_(a = 1)^(b - 1) \( a beta - eta \), product_(a = 1)^(n - 1) \( a - eta \)) product_(i = 1)^b product_(a = 1)^(n_i - 1) \( a - beta \) . $ <eq:hier-eppf>]
  Empty products are one. To verify this, insert
  $ S^(eta - n) = frac(1, Gamma \( n - eta \)) integral_0^oo t^(n - eta - 1) e^(- t S) thin upright(d) t $
  into the expectation of the sum over distinct Poisson points. The Poisson factorial-moment formula gives one factor $c beta Gamma \( n_i - beta \) t^(beta - n_i)$ for each selected point and the Laplace factor $exp { - c Gamma \( 1 - beta \) t^beta }$. The remaining integral, after $v = c Gamma \( 1 - beta \) t^beta$, is a gamma integral. Dividing by
  $ bb(E) S^eta = \[ c Gamma \( 1 - beta \) \]^(eta \/ beta) frac(Gamma \( 1 - eta \/ beta \), Gamma \( 1 - eta \)) $
  (with value one at $eta = 0$) gives (2.4). Its ratios show that an existing block of size $l$ receives the next sample with probability $\( l - beta \) \/ \( n - eta \)$; a new block has probability $\( b beta - eta \) \/ \( n - eta \)$.
  At a cascade vertex, multiply each outgoing edge by the total mass of its child subtree. The Poisson mapping calculation in the preceding proof makes the resulting child masses a stable Poisson process and tilts the child subtree law by its total mass raised to the parent parameter. More explicitly, if the outgoing parameter is $beta$, the masses $r_i = s_i T_i$ are independent of child-subtree marks whose law is multiplied by $T_i^beta \/ bb(E) T_i^beta$. An incoming bias $\( sum_i r_i \)^eta$ changes only the mass process, so those child marks remain independent, also after conditioning on the choices of children. Thus (2.4) applies at the first level with $\( eta \, beta \) = \( 0 \, m_0 \)$ and, inside a selected parent at later levels, with $\( eta \, beta \) = \( m_(j - 2) \, m_(j - 1) \)$. For two samples the conditional joining probabilities are
  $ 1 - m_0 \, quad frac(1 - m_1, 1 - m_0) \, quad dots.h \, quad frac(1 - m_(k - 1), 1 - m_(k - 2)) . $
  Their products give probability $1 - m_(j - 1)$ of sharing the first $j$ edges. Taking differences proves the first assertion.
  More generally, multiply the conditional joining probabilities along the ancestral path to a cluster containing $l$ of the first $n$ samples at a level of parameter $m$. The denominators telescope, giving $\( l - m \) \/ n$. These probabilities, and differences between probabilities of joining a parent and joining its existing children, determine all ways the next sample can enter a finite nested partition. They also show that deleting intermediate levels leaves the same rule at the retained levels. Construct nested partitions at all dyadic parameters by these consistent finite-dimensional laws, taking the universal partition at parameter zero and the singleton partition at parameter one, and put $U_(a b) = sup { m : a \, b upright(" belong to the same cluster at level ") m }$. The rule gives $bb(P) \( U_12 gt.eq m \) = 1 - m$ at dyadic $m$, hence uniformly on $\[ 0 \, 1 \]$. Nesting gives ultrametricity. The predictive probabilities for a finite nested partition are differences of $\( l - m \) \/ n$, and hence its probability is continuous in the finitely many level parameters. Approximating arbitrary real levels by dyadic levels, and using that no $U_(a b)$ has an atom at a prescribed level, therefore recovers the same sampling law at every real level. Applying a step function $q$ now recovers the finite cascade covariance law. Set $q \( 1 \) = q_(*)$; nonnegative nondecreasing transforms of this nested array are positive semidefinite: for a step transform they are sums, with nonnegative coefficients, of block-indicator matrices, and the general case follows by limits. An additional nonnegative diagonal correction supplies any $Q gt.eq q_(*)$. ◻
]

=== 2.2 The row functional and tilted derivatives <the-row-functional-and-tilted-derivatives>

Attach independent centered Gaussian increments of variances $q_0 \, q_1 - q_0 \, dots.h \, q_k - q_(k - 1)$ to the common root and subsequent vertices, and denote their path sum by $z_tau$. Initially suppose $q_k = Q$ and that $u in C^2 \( bb(R) \)$ has bounded first and second derivatives. Define

$ Phi_u \( q \; Q \) = bb(E) log sum_tau v_tau e^(u \( z_tau \)) . $

When $q_k < Q$, replace $e^(u \( z \))$ at a leaf by $bb(E)_G e^(u \( z + sqrt(Q - q_k) thin G \))$, where $G tilde.op cal(N) \( 0 \, 1 \)$. This is the #emph[terminal convolution]; a residual Gaussian is drawn independently for each sampled replica, even if two replicas select the same leaf. We omit $Q$ when the diagonal has been fixed.

For a finite profile put

$ f_k \( z \) = log bb(E)_G e^(u \( z + sqrt(Q - q_k) thin G \)) \, #h(2em) f_(j - 1) \( z \) = 1 / m_(j - 1) log bb(E)_G e^(m_(j - 1) f_j \( z + sqrt(q_j - q_(j - 1)) thin G \)) . $

The terminal formula means $f_k = u$ when $q_k = Q$. Lemma 2 gives $Phi_u \( q \; Q \) = bb(E)_G f_0 \( sqrt(q_0) thin G \)$. Let $Z_j$ be the partial path sum under the tilted transitions (2.2), with the original Gaussian root law, and put $A_j = f'_j \( Z_j \)$. Differentiation under the Gaussian integrals gives

$ f'_(j - 1) \( z \) = bb(E)^(upright("tilt")) \[ f'_j \( Z_j \) divides Z_(j - 1) = z \] . $

Thus $\( A_j \)$ is a martingale. At the terminal convolution there is one further tilted transition, of parameter one, from $f'_k$ to $u'$.

To pass from finite cascades to arbitrary covariance profiles, we use the following continuity principle. Its hypotheses concern replica arrays, so no convergence of random measures in a chosen representation is needed.

#thm([Lemma 2.3.])[
  (Replica-array continuity under a Gaussian tilt).  #emph[Let $G_n$ be random probability measures. Suppose that the jointly sampled arrays of a finite list of uniformly bounded positive-semidefinite kernels, and any other bounded observables being retained, converge in law on every finite set of replicas. Conditional on these arrays, adjoin independent centered Gaussian fields with the prescribed kernels. Let $X_n$ be the evaluation of one fixed continuous function on the retained single-replica variables and those fields, and assume, for every fixed $a > 0$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ sup_n bb(E) G_n \( e^(a \| X_n \|) \) < oo . $ <eq:hier-exponential-moments>]

 Then the expectations of $log G_n \( e^(X_n) \)$, and the expectations of bounded continuous functions of finitely many replicas sampled from $e^(X_n) G_n \/ G_n \( e^(X_n) \)$, converge to the corresponding functionals of the limiting array. Independent auxiliary variables of a fixed law may be adjoined to each replica. The conclusion also holds for unbounded observables whose truncation errors vanish uniformly under the tilted law; in particular this follows for polynomial functions of the Gaussian fields under (2.5).]
] <lem:hier-array-continuity>

#proof[
  For a fixed number of replicas, the conditional characteristic function of the adjoined fields is $exp \( - t^(sans(T)) C t \/ 2 \)$. It is a bounded continuous function of the covariance matrix, including at singular matrices. Consequently the fields converge jointly with the arrays. The same argument with a product law adjoins the independent auxiliary variables.
  Put $W = e^X$, $W_L = \( W or L^(- 1) \) and L$, $Z = G \( W \)$, and $Z_L = G \( W_L \)$. For every fixed $r gt.eq 1$, Jensen’s inequality gives
  $ Z^(- r) lt.eq G \( e^(- r X) \) \, #h(2em) Z_L^(- r) lt.eq G \( W_L^(- r) \) lt.eq G \( 1 + e^(- r X) \) . $
  All these inverse moments are uniformly bounded in expectation. For arbitrary fixed $r gt.eq 1$ and $A > 0$, (2.5) and another application of Jensen give
  $ sup_n bb(E) \| Z - Z_L \|^r lt.eq sup_n bb(E) G \( \| W - W_L \|^r \) = O \( L^(- A) \) \, $
  after using a sufficiently large moment in (2.5). The elementary inequality $\| log a - log b \| lt.eq \| a - b \| \( a^(- 1) + b^(- 1) \)$ and Hölder’s inequality show that replacing $Z$ by $Z_L$ changes its expected logarithm by a quantity tending to zero uniformly in $n$.
  At fixed $L$, uniformly approximate $log z$ on $\[ L^(- 1) \, L \]$ by polynomials. Every expected polynomial of $G \( W_L \)$ is a finite linear combination of replica expectations, which converge by the first paragraph. This proves the assertion for logarithms. For an $r$-replica observable $B$, its tilted expectation is
  $ bb(E) frac(G_n^(⊗ r) \( B product_(i = 1)^r W_i \), Z^r) . $
  Replace the $W_i$ and $Z$ by their clipped versions. Hölder’s inequality, the inverse-moment bounds, and the displayed tail estimate make this error uniformly small for bounded $B$. At fixed $L$, approximate $z^(- r)$ on $\[ L^(- 1) \, L \]$ by polynomials and again use finitely many replicas. A further truncation proves the unbounded version whenever the stated uniform integrability holds. Polynomial Gaussian observables have moments of all orders uniformly, because the covariance kernels are bounded; Hölder’s inequality with (2.5) and the inverse-moment bound then supplies this uniform integrability. ◻
]

#thm([Lemma 2.4.])[
  (Derivative profile and Gaussian interpolation).  #emph[For a step profile define $D_q \( s \) = bb(E) A_j^2$ on $\[ m_(j - 1) \, m_j \)$. This is nonnegative and nondecreasing, satisfies $D_q lt.eq parallel u' parallel_oo^2$, and is constant across adjacent equal values of $q$. The diagonal quantity $D_(q \, d) := bb(E)^(upright("tilt")) u' \( Z \)^2$ is at least the final off-diagonal value. For two profiles with common diagonal $Q$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ frac(upright(d), upright(d) t) Phi_u \( \( 1 - t \) q + t r \; Q \) = - 1 / 2 integral_0^1 \( r - q \) \( s \) D_(\( 1 - t \) q + t r) \( s \) thin upright(d) s . $ <eq:src1>]

 For arbitrary $q \, r in cal(Q)_Q$ this identity holds for $0 < t < 1$ and as the appropriate one-sided derivative at the endpoints. Moreover, 
#[#set math.equation(numbering: n => "(2.7)")
 $ \| Phi_u \( q \; Q \) - Phi_u \( r \; Q \) \| lt.eq 1 / 2 parallel u' parallel_oo^2 parallel q - r parallel_1 \, #h(2em) q mapsto D_q upright(" is continuous into ") L^1 \[ 0 \, 1 \] . $ <eq:hier-row-continuity>]

 For a general profile, $D_q$ is constant almost everywhere on every interval on which $q$ is constant almost everywhere.]
] <lem:hier-row-interpolation>

#proof[
  We first prove the finite-profile identity, then use replica-array continuity to construct its extension and pass the derivative formula to the limit. The square of a bounded martingale is a submartingale. A zero-variance increment has identical incoming and outgoing derivative, proving all the monotonicity and plateau assertions. Given that two replicas share exactly $j$ levels, their later marks are independent under the tilted transitions. Their terminal derivatives therefore have product expectation $bb(E) A_j^2$. The shared path itself has the single-path tilted law, because transformed weights and marks are independent, also conditional on the genealogy.
  Put $q$ and $r$ on a common finite partition, first with no residual convolution. Gaussian covariance differentiation gives
  $ frac(upright(d), upright(d) t) Phi_u \( q_t \; Q \) = 1 / 2 bb(E) chevron.l \[ u'' \( z_1 \) + u' \( z_1 \)^2 \] dot(C)_11 - u' \( z_1 \) u' \( z_2 \) dot(C)_12 chevron.r_t . $
  The diagonal is fixed, so $dot(C)_11 = 0$; off the diagonal $dot(C)_12 = \( r - q \) \( U_12 \)$. Lemmas 2 and 3, followed by the conditional product calculation, give (2.6). Bounded derivatives justify Gaussian integration by parts; one may truncate the number of leaves and then pass by dominated convergence and the exponential moments of the Gaussian marks. Integrating the derivative proves the Lipschitz bound for finite profiles.
  Use the common rank array of Lemma 3. If bounded profiles $q_n arrow.r q$ in $L^1$, then $q_n \( U_(a b) \) arrow.r q \( U_(a b) \)$ in probability for every $a eq.not b$; a union bound handles any finite subarray. Keep diagonal $Q$ fixed. Since $u$ has at most linear growth, (2.5) holds uniformly for $X = u \( z \)$, as the base single-replica field has law $cal(N) \( 0 \, Q \)$. Lemma 4 therefore constructs the limiting functional and tilted replica expectations independently of the step approximation. If an approximating profile is raised to $Q$ on a last interval of length $epsilon$, its final recursion is
  $ frac(1, 1 - epsilon) log bb(E) e^(\( 1 - epsilon \) u \( z + sqrt(Q - q_k) thin G \)) . $
  As $epsilon arrow.b 0$ this is exactly the terminal convolution. The limiting covariance array has an independent residual Gaussian for each replica. This verifies both descriptions of the limit.
  The $D_(q_n)$ are bounded monotone functions and hence precompact in $L^1$. The two-replica identity can be tested against the full rank $U_12$: refine a step profile at the endpoints of any step test function, using zero Gaussian increments on the added levels inside each plateau. Lemma 2 preserves the entire refined genealogy, while the derivative martingale is unchanged across those zero increments. The finite shared-level calculation thus proves the identity for step test functions, and uniform approximation proves it for continuous ones. For each continuous $phi : \[ 0 \, 1 \] arrow.r bb(R)$, this identity and Lemma 4 give convergence of
  $ integral_0^1 phi \( s \) D_(q_n) \( s \) thin upright(d) s = bb(E) chevron.l phi \( U_12 \) u' \( z_1 \) u' \( z_2 \) chevron.r_(q_n) . $
  These limits identify every $L^1$ subsequential limit, proving convergence of $D_(q_n)$ and defining $D_q$. The same argument proves continuity for any convergent sequence of general profiles. On an interval where $q$ is constant, choose step approximations that have that value on every compact subinterval. Their derivative profiles are constant there, so the limit is constant almost everywhere there.
  Pass to the limit in the integrated finite-profile version of (2.6), using boundedness and $L^1$ continuity of $D$. For fixed $q \, r$, the resulting integrand is continuous in $t$. The fundamental theorem of calculus gives the claimed derivative, including one-sided endpoint derivatives, and completes the proof. ◻
]

The moment assumption in Lemma 4 is a hypothesis, not a consequence of convergence of overlaps. Above it follows from bounded slope and Gaussian exponential moments; the later cavity applications verify the same bound before inserting capped rows. Potentials with the negative quadratic tail of the perceptron are handled by the cap-removal estimates in Section 3.

=== 2.3 The spherical functional <the-spherical-functional>

Let $sigma_N$ be normalized surface measure on $bb(S)_N = { x in bb(R)^N : parallel x parallel^2 = N }$. Take independent Gaussian fields $z_i \( tau \)$, $1 lt.eq i lt.eq N$, each with off-diagonal profile $p$ and diagonal $p_d gt.eq p_(*)$. Define

$ S_N \( p \; p_d \) = 1 / N bb(E) log sum_tau v_tau integral_(bb(S)_N) e^(sum_(i = 1)^N x_i z_i \( tau \)) thin upright(d) sigma_N \( x \) \, #h(2em) cal(S)_N \( p \) = S_N \( p \; p_d \) - p_d / 2 . $

As above, a residual diagonal is integrated separately for each replica. It contributes $exp { N \( p_d - p_(*) \) \/ 2 }$ inside each spin integral, because $parallel x parallel^2 = N$. Thus $cal(S)_N$ does not depend on the diagonal convention. Gaussian interpolation, followed by the cascade change of measure for the spin-integrated marks, gives

#[#set math.equation(numbering: n => "(2.8)")
 $ \| cal(S)_N \( p \) - cal(S)_N \( tilde(p) \) \| lt.eq 1 / 2 parallel p - tilde(p) parallel_1 . $ <eq:hier-spin-lipschitz>]

Indeed the diagonal term is removed by $p_d \/ 2$ and the off-diagonal derivative is $- 1 / 2 bb(E) chevron.l R_12 \( tilde(p) - p \) \( U_12 \) chevron.r$, where $R_12 = N^(- 1) x^1 dot.op x^2$ and $\| R_12 \| lt.eq 1$. The tilted marginal law of $U_12$ remains uniform by Lemma 2. The lemma applies here because the entire vector of Gaussian increments can be taken as the mark at each vertex; no coordinate factorization is needed for this interpolation. For general bounded profiles, $cal(S)_N$ is defined by its unique $L^1$-continuous extension from step profiles, whose existence follows from (2.8). Lemma 4, applied at fixed $N$, identifies this extension with the Gaussian functional of the continuous rank array.

#thm([Proposition 2.5.])[
  (Explicit spherical entropy).  #emph[The limit $cal(S) \( p \) = lim_(N arrow.r oo) cal(S)_N \( p \)$ exists and is uniform over all nonnegative nondecreasing profiles bounded by any fixed constant. For a finite-step profile without residual diagonal, put 
$ Delta p_j = p_j - p_(j - 1) \, #h(2em) I = sum_(j = 1)^k m_(j - 1) Delta p_j \, #h(2em) lambda_j = b - sum_(i = j + 1)^k m_(i - 1) Delta p_i quad \( 0 lt.eq j lt.eq k \) . $

 Thus $lambda_k = b$, $lambda_0 = b - I$, and $lambda_(j - 1) = lambda_j - m_(j - 1) Delta p_j$. Define, for $b > I$, 
#[#set math.equation(numbering: n => "(2.9)")
 $ X \( b \) = - 1 / 2 log b + frac(p_0, 2 lambda_0) + sum_(j = 1)^k frac(1, 2 m_(j - 1)) log lambda_j / lambda_(j - 1) . $ <eq:hier-gaussian-spin>]

 There is exactly one $b > I$ satisfying 
#[#set math.equation(numbering: n => "(2.10)")
 $ - 2 X' \( b \) = 1 / b + p_0 / lambda_0^2 + sum_(j = 1)^k frac(p_j - p_(j - 1), lambda_j lambda_(j - 1)) = 1 . $ <eq:src2>]

 At this value of $b$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ cal(S) \( p \) = X \( b \) + b / 2 - 1 / 2 - p_k / 2 . $ <eq:hier-spherical-value>]

 If $p lt.eq B$, its saddle point satisfies $1 lt.eq b < 2 \( B + 1 \)$.]
] <prop:hier-spherical-limit>

#proof[
  The calculation has four steps. We evaluate a Gaussian spin integral, choose its quadratic multiplier so that one disorder-averaged spin has variance one, and compare the resulting typical shell with the sphere. The common Lipschitz bound then makes the limit uniform over bounded profiles.
  First replace the spherical integral by
  $ Z_N^(upright(G)) \( b \) = sum_tau v_tau integral_(bb(R)^N) exp { x dot.op z \( tau \) - b parallel x parallel^2 \/ 2 } frac(upright(d) x, \( 2 pi \)^(N \/ 2)) . $
  The terminal logarithm factors into a sum of $- 1 / 2 log b + z_i^2 \/ \( 2 b \)$. The elementary Gaussian integral
  $ 1 / m log bb(E) exp #h(-0.16667em) {m (c + frac(\( z + sqrt(d) thin G \)^2, 2 lambda))} = c + frac(1, 2 m) log frac(lambda, lambda - m d) + frac(z^2, 2 \( lambda - m d \)) $
  is valid when $lambda > m d$. Iterating it and averaging the root Gaussian gives (2.9), with $bb(E) log Z_N^(upright(G)) \( b \) = N X \( b \)$. The condition $b > I$ ensures every required Gaussian exponential moment is finite.
  Differentiate this explicit expression to get (2.10). Its left-hand side is strictly decreasing and continuous on $\( I \, oo \)$ and tends to zero at infinity. At $b arrow.b I$ it diverges: if $p_0 > 0$, use $p_0 \/ lambda_0^2$; otherwise use the summand corresponding to the first positive increment; if every $p_j = 0$, use $1 \/ b$. Hence the solution is unique. The equation also gives $b gt.eq 1$. If $p_k lt.eq B$, then $I lt.eq B$; at $b = 2 \( B + 1 \)$ its left-hand side is at most
  $ frac(1, 2 \( B + 1 \)) + frac(B, \( B + 2 \)^2) lt.eq 5 / 8 < 1 . $
  Thus the solution is below $2 \( B + 1 \)$.
  We now justify replacing the Gaussian spin integral by the sphere. For #emph[one] spin vector sampled from $Z_N^(upright(G)) \( b \)$ and then averaged over the disorder, the coordinates are iid. Indeed the terminal function is a sum of independent coordinate functions; Lemma 2 makes every path transition factor by coordinate, and the independent root Gaussian marks are not tilted. Conditional on the terminal fields, the spins are independent Gaussians of mean $z_i \/ b$ and variance $1 \/ b$. Integrating the factorized tilted path law therefore preserves independence and identical distribution. Their common law can be computed directly. Write $f_j \( z \) = c_j + z^2 \/ \( 2 lambda_j \)$ for the quadratic recursion. Completing the square in its tilted transition gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ Z_j divides Z_(j - 1) = z med tilde.op cal(N) #h(-0.16667em) (lambda_j / lambda_(j - 1) z \, frac(Delta p_j lambda_j, lambda_(j - 1))) . $ <eq:hier-spin-transition>]
  Consequently $Y_j = Z_j \/ lambda_j$ is a centered Gaussian martingale with independent increments of variances $Delta p_j \/ \( lambda_j lambda_(j - 1) \)$, starting with variance $p_0 \/ lambda_0^2$. The terminal spin is $Y_k$ plus an independent $cal(N) \( 0 \, 1 \/ b \)$ variable, so its variance is
  $ p_0 / lambda_0^2 + sum_(j = 1)^k frac(Delta p_j, lambda_j lambda_(j - 1)) + 1 / b = 1 $
  by (2.10). Thus the averaged single-vector law is exactly $cal(N) \( 0 \, I_N \)$. This assertion concerns a single disorder-averaged sample; it does not assert independence at fixed disorder or between replicas.
  Let $G_N^(upright(G))$ denote the $x$-marginal of the normalized Gibbs measure associated with the partition function $Z_N^(upright(G)) \( b \)$. Fix $0 < delta < 1$ and write $A_(N \, delta) = { \| parallel x parallel^2 \/ N - 1 \| lt.eq delta }$. The law of large numbers gives $bb(E) G_N^(upright(G)) \( A_(N \, delta)^c \) arrow.r 0$, and Markov’s inequality gives $G_N^(upright(G)) \( A_(N \, delta) \) arrow.r 1$ in disorder probability. To pass to logarithms, let $Z_(N \, delta)^(upright(G))$ be the integral restricted to this shell. Lemma 2 expresses $log Z_N^(upright(G))$ as an iid coordinate sum at the root plus a difference of two log total cascade masses. More explicitly the root shift is $sum_(i = 1)^N \[ c_0 + Z_(0 i)^2 \/ \( 2 lambda_0 \) \]$, where
  $ c_0 = - 1 / 2 log b + sum_(j = 1)^k frac(1, 2 m_(j - 1)) log lambda_j / lambda_(j - 1) . $
  At each vertex the edge multiplier has $m$th moment exactly one by (2.1), also when the marks comprise $N$ coordinates. Hence the transformed weight processes have exactly their original intensities. Conditionally on root marks, $T'$ has the same $N$-independent marginal law as $T$; all scale changes have been included in the root shift. Its quadratic Gaussian summands have fixed second moments, and Lemma 2 bounds the second moments of the two log masses. Therefore $bb(E) \| log Z_N^(upright(G)) \|^2 = O \( N^2 \)$, with a constant allowed to depend on the fixed step profile. The restricted logarithm has a deterministic lower bound $- C_(b \, delta) N$ for large $N$: at any radius the sphere average of $e^(x dot.op z)$ is at least one by Jensen’s inequality, and the Gaussian volume of the shell is at least $e^(- C_(b \, delta) N)$. Consequently
  $ 0 lt.eq 1 / N log Z_N^(upright(G)) / Z_(N \, delta)^(upright(G)) lt.eq 1 / N log Z_N^(upright(G)) + C_(b \, delta) $
  is uniformly integrable. The left side tends to zero in probability, so
  #[#set math.equation(numbering: n => "(2.13)")
   $ bb(E) log Z_(N \, delta)^(upright(G)) = N X \( b \) + o \( N \) . $ <eq:hier-shell-log>]
  For completeness the radial comparison includes the normalization of surface measure. With $x = r hat(x)$, $hat(x) in bb(S)_N$, polar coordinates give
  $ frac(upright(d) x, \( 2 pi \)^(N \/ 2)) = c_N r^(N - 1) thin upright(d) r thin upright(d) sigma_N \( hat(x) \) \, #h(2em) c_N = frac(2 \( N \/ 2 \)^(N \/ 2), Gamma \( N \/ 2 \)) \, #h(2em) 1 / N log c_N arrow.r 1 / 2 . $
  For every fixed field the sphere integral of $e^(r hat(x) dot.op z)$ is nondecreasing in $r gt.eq 0$, by symmetry and monotonicity of the hyperbolic cosine. On $sqrt(1 - delta) lt.eq r lt.eq sqrt(1 + delta)$, the logarithm of the remaining radial factor, divided by $N$, is $1 \/ 2 - b \/ 2 + O_b \( delta \) + o \( 1 \)$. Its integral over this interval has the same estimate. Sandwich the spin integral between the values at the two shell endpoints. Scaling a field by $r$ scales its covariance by $r^2$, and (2.8), including the diagonal correction, gives
  $ \| S_N \( r^2 p \; r^2 p_k \) - S_N \( p \; p_k \) \| lt.eq B \| r^2 - 1 \| . $
  Together with (2.13), the radial sandwich shows $S_N \( p \; p_k \) = X \( b \) + b \/ 2 - 1 \/ 2 + O_(b \, B) \( delta \) + o \( 1 \)$. First let $N arrow.r oo$, then $delta arrow.b 0$, to obtain (2.11).
  Finally, nonnegative nondecreasing profiles bounded by $B$ form a compact set in $L^1$, and finite-step profiles are dense in it. The common Lipschitz estimate (2.8) transfers convergence from a finite net of step profiles to uniform convergence on this compact set. This proves the proposition for general bounded profiles. ◻
]

=== 2.4 Concavity and the entropy conjugate <concavity-and-the-entropy-conjugate>

For a trial overlap $q$, the pressure calculation in Section 4 will couple the row functional to the spherical functional through $p_q = alpha D_q$. Its two bounds first lead to the expression

$ alpha Phi_u \( q \) + cal(S) \( p_q \) + 1 / 2 integral_0^1 q \( s \) p_q \( s \) thin upright(d) s . $

To identify the last two terms, we compute the spherical response. At a step profile $p$, the differential of $cal(S)$ is represented by $- r \/ 2$, where $r$ is a nondecreasing profile strictly below one. For general $p$ we construct a supergradient of this form. The inverse relation between $p$ and the selected $r$ will both prove concavity and identify when the last two terms equal the entropy conjugate $E \( q \)$.

For any nonnegative nondecreasing $v$ with $v_(*) < 1$, define its overlap distribution and integrated distribution by

$ m_v \( t \) = bb(P) \( v \( U \) lt.eq t \) \, #h(2em) chi_v \( t \) = integral_t^1 m_v \( a \) thin upright(d) a \, #h(2em) U tilde.op "Unif" \[ 0 \, 1 \] . $

The continuous form of the inverse map will be

#[#set math.equation(numbering: n => "(2.14)")
 $ cal(I) \( v \) \( s \) = integral_0^(v \( s \)) frac(upright(d) t, chi_v \( t \)^2) . $ <eq:press-continuous-inverse>]

Its denominator is positive on the integration range, since $chi_v \( t \) gt.eq 1 - v_(*)$ for $t lt.eq v_(*)$. The next proposition proves the inverse relation for the selected supergradient.

#thm([Proposition 2.6.])[
  (Concavity and supergradients).  #emph[The functional $cal(S)$ is concave on bounded nonnegative nondecreasing profiles. At a finite-step profile its differential is 
#[#set math.equation(numbering: n => "(2.15)")
 $ upright(d) cal(S) \( p \) = - 1 / 2 sum_(j = 0)^k w_j r_j thin upright(d) p_j \, quad r_j = p_0 / lambda_0^2 + sum_(i = 1)^j frac(p_i - p_(i - 1), lambda_i lambda_(i - 1)) \, quad r_k = 1 - 1 / b . $ <eq:hier-spin-gradient>]

 For every general bounded profile $p$ there exists a nonnegative nondecreasing profile $r$, with $r_(*) < 1$, such that 
#[#set math.equation(numbering: n => "(2.16)")
 $ cal(S) \( tilde(p) \) lt.eq cal(S) \( p \) - 1 / 2 integral_0^1 r \( s \) \( tilde(p) - p \) \( s \) thin upright(d) s $ <eq:hier-spin-tangent>]

 for every bounded nonnegative nondecreasing $tilde(p)$. The profile $r$ can be chosen so that $p = cal(I) \( r \)$ almost everywhere. If $p lt.eq B$, $r$ may be chosen with $r_(*) lt.eq 1 - \[ 2 \( B + 1 \) \]^(- 1)$.]
] <prop:hier-spin-concavity>

#proof[
  All the derivatives can first be taken with $p_0 > 0$ and strictly positive increments, and then extended to boundary points by continuity. Differentiate (2.9) and (2.11). The coefficient of $upright(d) b$ is $X' \( b \) + 1 \/ 2 = 0$ by (2.10). Substituting $upright(d) lambda_j = upright(d) b - sum_(i > j) m_(i - 1) \( upright(d) p_i - upright(d) p_(i - 1) \)$ and collecting coefficients of $upright(d) p_j$ gives (2.15). The last equality there is precisely (2.10).
  To check the Hessian sign without a sign convention ambiguity, invert this gradient map. Write $chi_j = 1 \/ lambda_j$. The differences of (2.15) and the recursion for $lambda$ give
  $ r_j - r_(j - 1) = Delta p_j chi_j chi_(j - 1) \, #h(2em) chi_(j - 1) - chi_j = m_(j - 1) \( r_j - r_(j - 1) \) \, #h(2em) chi_k = 1 - r_k . $
  Telescoping yields the inverse formulas
  #[#set math.equation(numbering: n => "(2.17)")
   $ chi_j & = 1 - m_j r_j - sum_(i > j) w_i r_i \,\
p_0 & = r_0 \/ chi_0^2 \, #h(2em) p_j - p_(j - 1) = frac(chi_j^(- 1) - chi_(j - 1)^(- 1), m_(j - 1)) = frac(r_j - r_(j - 1), chi_j chi_(j - 1)) . $ <eq:hier-inverse-gradient>]
  Conversely every $0 lt.eq r_0 lt.eq dots.h.c lt.eq r_k < 1$ gives positive $chi_j$ and a nonnegative nondecreasing $p$ by these formulas; putting $b = 1 \/ chi_k$ recovers (2.10). Thus they are genuine inverse relations.
  Here is the full quadratic-form calculation. Put
  $ T_j = sum_(i gt.eq j) w_i thin upright(d) r_i \, quad T_(k + 1) = 0 \, #h(2em) L_j = m_j thin upright(d) r_j + T_(j + 1) = - upright(d) chi_j \; #h(2em) L_0 = T_0 . $
  Differentiating (2.17) gives
  $ upright(d) p_0 = frac(upright(d) r_0, chi_0^2) + frac(2 r_0 T_0, chi_0^3) \, #h(2em) upright(d) \( Delta p_j \) = 1 / m_(j - 1) (L_j / chi_j^2 - L_(j - 1) / chi_(j - 1)^2) . $
  Insert these into $sum_j w_j upright(d) r_j upright(d) p_j = T_0 upright(d) p_0 + sum_(j gt.eq 1) T_j upright(d) \( Delta p_j \)$. Summation by parts gives exactly
  #[#set math.equation(numbering: n => "(2.18)")
   $ sum_(j = 0)^k w_j upright(d) r_j upright(d) p_j = frac(m_0 \( upright(d) r_0 \)^2 - T_1^2 \/ m_0, chi_0^2) + frac(2 r_0 T_0^2, chi_0^3) + sum_(j = 1)^k frac(w_j L_j^2, m_(j - 1) m_j chi_j^2) . $ <eq:hier-positive-form>]
  Since $chi_j lt.eq chi_0$, replace $chi_j^(- 2)$ in the last, nonnegative sum by $chi_0^(- 2)$. The identity
  $ frac(w_j L_j^2, m_(j - 1) m_j) = w_j \( upright(d) r_j \)^2 + T_j^2 / m_(j - 1) - T_(j + 1)^2 / m_j $
  then telescopes and proves
  #[#set math.equation(numbering: n => "(2.19)")
   $ sum_j w_j upright(d) r_j upright(d) p_j gt.eq 1 / chi_0^2 sum_j w_j \( upright(d) r_j \)^2 gt.eq 0 . $ <eq:hier-hessian-sign>]
  For $k = 0$ the same calculation has $m_0 = 1$ and empty sums. Along a line in $p$, (2.15) and (2.19) give $upright(d)^2 cal(S) lt.eq 0$. Continuity proves concavity on the boundary and, by step approximation, on the full domain.
  For general $p lt.eq B$, choose step profiles $p_n lt.eq B$ converging to $p$. Their gradients have nonnegative nondecreasing representatives $r_n$ and, by Proposition 6,
  $ \( r_n \)_(*) = 1 - 1 \/ b_n lt.eq 1 - \[ 2 \( B + 1 \) \]^(- 1) . $
  Pass to an $L^1$ convergent subsequence. The finite-step tangent inequality holds against every step competitor after refining to a common partition. Letting $n arrow.r oo$, and then approximating an arbitrary bounded competitor, gives (2.16). The displayed uniform bound passes to the limit.
  This same construction gives the asserted inverse relation. For a step profile $v$, $chi_v$ is constant below its lowest value and affine of slope $- m_(j - 1)$ between successive values. Integrating $chi_v^(- 2)$ therefore gives $v_0 \/ chi_0^2$ and increments $\( v_j - v_(j - 1) \) \/ \( chi_j chi_(j - 1) \)$. Thus the finite inverse formulas are exactly $p_n = cal(I) \( r_n \)$. To pass to the limit, Fubini gives
  #[#set math.equation(numbering: n => "(2.20)")
   $ chi_v \( t \) = 1 - t - integral_0^1 \( v \( s \) - t \)_(+) thin upright(d) s \, #h(2em) sup_t \| chi_v \( t \) - chi_(tilde(v)) \( t \) \| lt.eq parallel v - tilde(v) parallel_1 . $ <eq:hier-chi-quantile>]
  For $v \, tilde(v) lt.eq Q < 1$, their integrated distributions are at least $1 - Q$ on $\[ 0 \, Q \]$. Comparing the integrands and the upper integration limits in (2.14) gives
  $ parallel cal(I) \( v \) - cal(I) \( tilde(v) \) parallel_1 lt.eq C_Q parallel v - tilde(v) parallel_1 . $
  Consequently $p = cal(I) \( r \)$. This identifies the supergradient obtained from the step approximations; no assertion about uniqueness of all supergradients on the monotone cone is needed. ◻
]

#thm([Proposition 2.7.])[
  (Entropy conjugacy).  #emph[Let $q$ be nonnegative and nondecreasing with $q_(*) < 1$, and use $chi_q$ defined above. Then the following supremum is attained: 
#[#set math.equation(numbering: n => "(2.21)")
 $ E \( q \) & := sup_(p gt.eq 0 upright(" bounded")\
p upright(" nondecreasing")) {cal(S) \( p \) + 1 / 2 integral_0^1 q \( s \) p \( s \) thin upright(d) s}\
 & = 1 / 2 {log \( 1 - q_(*) \) + integral_0^(q_(*)) frac(upright(d) t, chi_q \( t \))} \, #h(2em) chi_q \( t \) = integral_t^1 m_q \( v \) thin upright(d) v . $ <eq:src3>]

 An optimizer may be chosen with $p_(*) lt.eq q_(*) \/ \( 1 - q_(*) \)^2$. Equivalently, 
#[#set math.equation(numbering: n => "(2.22)")
 $ E \( q \) = 1 / 2 integral_0^1 {frac(1, chi_q \( t \)) - frac(1, 1 - t)} thin upright(d) t \, $ <eq:hier-entropy-integral>]

 where the integrand is identically zero for $t > q_(*)$. For profiles $q \, tilde(q) lt.eq Q < 1$, 
#[#set math.equation(numbering: n => "(2.23)")
 $ \| E \( q \) - E \( tilde(q) \) \| lt.eq frac(Q, 2 \( 1 - Q \)^2) parallel q - tilde(q) parallel_1 . $ <eq:hier-entropy-continuity>]

]
] <prop:hier-entropy-conjugacy>

#proof[
  For a step profile $q$, set $r = q$ in (2.17) and obtain $p$. The tangent inequality in Proposition 7 gives, for every competitor $tilde(p)$,
  $ cal(S) \( tilde(p) \) + 1 / 2 integral q tilde(p) lt.eq cal(S) \( p \) + 1 / 2 integral q p \; $
  thus $p$ attains the supremum. In these inverse formulas $chi_j = chi_q \( q_j \)$, $b = 1 \/ \( 1 - q_k \)$, and
  $ p_0 = q_0 / chi_0^2 \, #h(2em) Delta p_j = frac(q_j - q_(j - 1), chi_j chi_(j - 1)) . $
  The algebra in the value can be made explicit. Abel summation and the inverse formulas give
  $ p_k - sum_j w_j q_j p_j & = p_0 chi_0 + sum_(j = 1)^k Delta p_j \( chi_(j - 1) + m_(j - 1) q_(j - 1) \)\
 & = q_0 / chi_0 + sum_(j = 1)^k (q_j / chi_j - q_(j - 1) / chi_(j - 1)) = q_k / chi_k = b - 1 . $
  Substitution into (2.9) and (2.11) therefore yields
  $ 2 E \( q \) = log \( 1 - q_k \) + q_0 / chi_0 + sum_(j = 1)^k 1 / m_(j - 1) log chi_(j - 1) / chi_j . $
  On $\[ 0 \, q_0 \]$, $chi_q = chi_0$; on each interval $\[ q_(j - 1) \, q_j \]$ it is affine of slope $- m_(j - 1)$. Integrating its reciprocal on these intervals gives exactly (2.21), also when an interval has zero length.
  For passage to general profiles, fix $Q < 1$ with $q lt.eq Q$ and approximate by step profiles $q_n lt.eq Q$ in $L^1$. Their inverse profiles satisfy
  $ \( p_n \)_(*) = frac(\( q_n \)_0, \( chi_n \)_0^2) + sum_j frac(\( q_n \)_j - \( q_n \)_(j - 1), \( chi_n \)_j \( chi_n \)_(j - 1)) lt.eq frac(Q, \( 1 - Q \)^2) \, $
  because every $chi_n gt.eq 1 - Q$. Compactness gives a subsequence $p_n arrow.r p$ in $L^1$. The finite-step tangent inequalities, first against step competitors and then against arbitrary bounded competitors, pass to the limit by the Lipschitz continuity of $cal(S)$ and the uniform bounds. They prove attainment for $q$ and show that its value is the limit of the finite-step values. This argument does not interchange an uncontrolled supremum with a limit.
  To identify the limiting expression, use (2.20). For $q lt.eq Q$, $chi_q \( t \) gt.eq 1 - Q$ on $\[ 0 \, Q \]$, and $chi_q \( t \) = 1 - t$ on $\[ Q \, 1 \]$. Consequently the right side of (2.22) is continuous under these approximations, with the explicit bound (2.23). It agrees with (2.21) because $integral_0^(q_(*)) \( 1 - t \)^(- 1) thin upright(d) t = - log \( 1 - q_(*) \)$. Approximating with $Q = q_(*)$ gives the stated optimizer bound; when $q_(*) = 0$, $p = 0$ suffices. This completes the proof. ◻
]

== 3 Concavity and stability of the row functional <sec:row-concavity>

The pressure argument needs three properties of the row functional at a fixed diagonal covariance $Q$. Ordinary concavity in the off-diagonal profile $q$ supplies the interpolation sign. Strict concavity makes the derivative profile $D_q$ strongly monotone; this will force a minimizing overlap to equal the spherical response constructed in the preceding section. Finally, concavity must persist under both signs of a small terminal perturbation, so that pressure bounds identify empirical row laws.

We first derive a Hessian identity for smooth profiles and terminals. For a concave terminal it is a sum of nonpositive terms. The hinge has enough curvature on one fixed interval to make the bound uniformly negative. We then control the change in that Hessian under a compact perturbation and remove the terminal and profile regularizations.

For the hinge terminal $u = - beta V$, two perturbation regimes are used below. Corollary 14 permits arbitrary $psi in C_c^oo \( bb(R) \)$ in $u + d psi$, with $\| d \|$ small at each fixed $beta$. Corollary 15 treats $- beta \[ V + w psi \( 1 + z \) \]$ with $psi in C_c^oo \( \( - oo \, 0 \) \)$; convexity of the loss gives an admissible $\| w \|$ independent of $beta$.

=== 3.1 The parabolic representation and its regularity <the-parabolic-representation-and-its-regularity>

Suppose initially that $q in C^oo \( \[ 0 \, 1 \] \)$, $q \( 0 \) = 0$, $q \( 1 \) = Q$, and $dot(q) > 0$. The Gaussian recursion defining the row functional is equivalent to

#[#set math.equation(numbering: n => "(3.1)")
 $ f_s = - frac(dot(q) \( s \), 2) #scale(x: 120%, y: 120%)[\(] f_(z z) + s f_z^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) f \( 1 \, z \) = u \( z \) \, #h(2em) Phi_u \( q \; Q \) = f \( 0 \, 0 \) . $ <eq:src4>]

Here and below a dot denotes differentiation in rank time $s$. In variance time $t = q \( s \)$, write $F \( t \, z \) = f \( q^(- 1) \( t \) \, z \)$ and $m \( t \) = q^(- 1) \( t \)$. The equation becomes

#[#set math.equation(numbering: n => "(3.2)")
 $ F_t = - 1 / 2 #scale(x: 120%, y: 120%)[\(] F_(z z) + m \( t \) F_z^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) F \( Q \, z \) = u \( z \) . $ <eq:conc-variance-pde>]

When $m$ is constant, equal to $a in \[ 0 \, 1 \]$, on an interval of length $T$, its backward solution operator is

$ cal(T)_(a \, T) v \( z \) = cases(delim: "{", a^(- 1) log bb(E) exp { a v \( z + sqrt(T) G \) } \, & a > 0 \,, bb(E) v \( z + sqrt(T) G \) \, & a = 0 \,) #h(2em) G tilde.op cal(N) \( 0 \, 1 \) . $

Consequently step functions $m$ reproduce exactly the finite Gaussian recursion, including its initial heat interval and terminal convolution.

We record the analytic class in which subsequent differentiations are made. Assume that $u$ is smooth, all its derivatives of order at least two are bounded, and, for fixed constants $A \, C gt.eq 0$, $B in bb(R)$, and $kappa gt.eq 0$,

#[#set math.equation(numbering: n => "(3.3)")
 $ - A \( 1 + z^2 \) lt.eq u \( z \) lt.eq B \, #h(2em) - C lt.eq u'' \( z \) lt.eq kappa \, #h(2em) kappa Q < 1 . $ <eq:conc-terminal-class>]

Constants in the following bounds depend only on these constants and $Q$, unless a dependence on a higher derivative of $u$ is explicitly indicated.

#thm([Lemma 3.1.])[
  (Parabolic bounds and differentiability).  #emph[Equation (3.2) has a unique solution of at most quadratic growth with a spatial derivative of at most linear growth. For continuous $m : \[ 0 \, Q \] arrow.r \[ 0 \, 1 \]$, the solution is classical and satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ - C lt.eq F_(z z) \( t \, z \) lt.eq frac(kappa, 1 - kappa \( Q - t \)) \, #h(2em) \| F_z \( t \, z \) \| lt.eq C_1 \( 1 + \| z \| \) . $ <eq:conc-parabolic-bounds>]

 For a fixed smooth terminal, each spatial derivative of order at least two is bounded. The corresponding bounds are uniform over $m in \[ 0 \, 1 \]$. For a smooth profile $q$ with $dot(q) > 0$ and a smooth direction $eta$ with $eta \( 0 \) = eta \( 1 \) = 0$, the solution of (3.1) is twice differentiable in the parameter $epsilon$ at $q + epsilon eta$.]
] <lem:conc-regularity>

#proof[
  #emph[Construction and curvature bounds.] For a step coefficient $m$, use the displayed Gaussian operators. Their integrals exist since $u$ is bounded above. Jensen’s inequality and iteration give
  $ - A \( 1 + z^2 + Q - t \) lt.eq F \( t \, z \) lt.eq B . $
  The differentiated equation, with $cal(D) = partial_t + 1 / 2 partial_(z z) + m F_z partial_z$, is
  $ cal(D) F_z = 0 \, #h(2em) cal(D) F_(z z) = - m F_(z z)^2 . $
  Backward parabolic comparison, or forward comparison after the change of time $tau = Q - t$, bounds the second derivative below by $- C$ and above by the solution of $K' = K^2$, $K \( 0 \) = kappa$. These comparisons can first be made for bounded-slope terminals and on bounded spatial intervals, with quadratic barriers, and then passed to expanding intervals. Here is an explicit bounded-slope approximation preserving the constants needed for that passage. Keep $u$ on $\[ - R \, R \]$. If $p = u' \( R \) lt.eq 0$, continue affinely to the right. If $p > 0$, continue with derivative $p - C \( z - R \)$ until that derivative reaches zero, and then continue constantly. The maximum of this continuation is $u \( R \) + p^2 \/ \( 2 C \) lt.eq B$: the inequality follows by applying $u \( R + h \) gt.eq u \( R \) + p h - C h^2 \/ 2$ at $h = p \/ C$ to the original terminal. On the left, continue affinely if $u' \( - R \) gt.eq 0$; otherwise continue with second derivative $- C$ until the derivative reaches zero, and then constantly. The same argument bounds its maximum by $B$. If $C = 0$, the original terminal is convex and bounded above, hence constant, so no continuation is needed. The resulting $C^(1 \, 1)$ function has curvature in $\[ - C \, kappa \]$ distributionally. Its value and derivative at zero agree with those of $u$, so the lower curvature bound supplies a common negative quadratic envelope on the whole line. Convolution with a compact nonnegative mollifier preserves both curvature bounds and the upper bound; let its width tend to zero as $R arrow.r oo$. The preceding quadratic barriers and Gaussian integrability now permit passage to the original terminal. The two-sided bound on $F$ near $z = 0$, together with the bound on $F_(z z)$, bounds $F_z \( t \, 0 \)$; integration of $F_(z z)$ then gives the linear-growth bound in (3.4).
  #emph[Higher spatial derivatives.] These estimates do not require bounds on derivatives of $m$. For example,
  $ cal(D) F_(z z z) = - 3 m F_(z z) F_(z z z) . $
  The diffusion representation bounds this derivative by $parallel u''' parallel_oo exp \( 3 K Q \)$, where $K$ bounds $\| F_(z z) \|$. Each further spatial differentiation gives a linear equation whose zeroth-order coefficient is bounded and whose source contains only already bounded derivatives. Induction gives the assertion.
  #emph[General coefficients.] Approximate a continuous $m$ uniformly by step functions. If $F$ and $F'$ are the two step solutions, their difference solves a linear backward equation with diffusion coefficient $1 \/ 2$, drift $m \( F_z + F'_z \) \/ 2$, and source $- \( m - m' \) \( F'_z \)^2 \/ 2$. Its drift is globally Lipschitz and has linear growth. The diffusion representation, with the terminal difference zero, gives on each compact spatial interval
  $ \| F - F' \| lt.eq C_R parallel m - m' parallel_oo . $
  The spatial derivative bounds and the equation give local compactness also for the derivatives. Thus the limit solves (3.2); the same difference equation proves uniqueness. This constructs the claimed classical solution and identifies it with the Gaussian recursion. The argument also works with step approximations of bounded measurable $m$, using convergence in measure and dominated convergence in the diffusion representation whenever needed below.
  #emph[Dependence on the covariance profile.] Work in rank time and keep $dot(q)$ positive in a neighborhood of the parameter under consideration. Subtracting two equations gives a linear equation with drift $dot(q)_epsilon s \( f_(epsilon \, z) + f_z \) \/ 2$ and source $- \( dot(q)_epsilon - dot(q) \) \( f_(z z) + s f_z^2 \) \/ 2$. Its diffusion representation and its spatially differentiated equations bound the difference and each fixed number of its spatial derivatives by $C parallel dot(q)_epsilon - dot(q) parallel_oo \( 1 + z^2 \)$. To see that differentiation does not increase this polynomial degree, keep the linear-growth drift in the transport operator: every spatial derivative of that drift of order at least one is bounded. The commutator terms are therefore bounded coefficients times derivatives already estimated, while the source and all its fixed-order spatial derivatives have at most quadratic growth. Induction and the diffusion moment bounds preserve the same quadratic envelope. The constant here may depend on the fixed profile and on finitely many terminal derivatives. Applying the same bounds to difference quotients, and then to the difference between those quotients and their linearized equations, proves first and second parameter differentiability. This also justifies differentiation under the diffusion expectations below. Indeed the diffusions have moments of every fixed order, and stopping at $\| Z \| = R$ followed by $R arrow.r oo$ removes all spatial localizations. ◻
]

=== 3.2 An exact Hessian identity <an-exact-hessian-identity>

Return to rank time. Put $a = f_z$, $b = f_(z z)$, and let $Z$ solve

#[#set math.equation(numbering: n => "(3.5)")
 $ upright(d) Z_s = sqrt(dot(q) \( s \)) thin upright(d) W_s + dot(q) \( s \) s a \( s \, Z_s \) thin upright(d) s \, #h(2em) Z_0 = 0 . $ <eq:conc-diffusion>]

Its generator, including the time derivative, is $cal(D) = partial_s + dot(q) partial_(z z) \/ 2 + dot(q) s a partial_z$. All unqualified expectations in the rest of this subsection evaluate the displayed functions along $Z_s$. Differentiation of (3.1) gives

$ cal(D) a = 0 \, #h(2em) cal(D) b = - dot(q) s b^2 \, #h(2em) U = b + s a^2 \, #h(2em) cal(D) U = a^2 . $

Thus $a \( s \, Z_s \)$ is precisely the derivative martingale of the tilted Gaussian recursion.

Let $v = partial_epsilon f_(q + epsilon eta) \|_(epsilon = 0)$ and $w = partial_epsilon^2 f_(q + epsilon eta) \|_(epsilon = 0)$. Their terminal values vanish, and

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(D) v & = - accent(eta U, ̇) \/ 2 \,\
cal(D) w & = - dot(eta) \( v_(z z) + 2 s a v_z \) - dot(q) s v_z^2 . $ <eq:conc-linearized>]

Since $eta$ vanishes at both endpoints, integration by parts in $bb(E) U \( s \, Z_s \)$ gives

$ v \( 0 \, 0 \) = 1 / 2 integral_0^1 dot(eta) \( s \) bb(E) U \( s \, Z_s \) thin upright(d) s = - 1 / 2 integral_0^1 eta \( s \) bb(E) a \( s \, Z_s \)^2 thin upright(d) s . $

This is the differential formula (2.6) in the smooth setting.

For the second derivative, the term $dot(eta)$ in the equation for $v$ would obscure the sign. Adding $eta U \/ 2$ cancels that term and leaves $cal(D) \( v + eta U \/ 2 \) = eta a^2 \/ 2$. The spatial derivative of this modified variation is the useful unknown in the Hessian identity.

#thm([Lemma 3.2.])[
  (Hessian identity).  #emph[Set $macron(v) = v + eta U \/ 2$ and $l = macron(v)_z$. Then 
#[#set math.equation(numbering: n => "(3.7)")
 $ w \( 0 \, 0 \) & = bb(E) integral_0^1 (dot(q) s l^2 - 2 eta a l - 1 / 2 eta^2 b^2) upright(d) s \,\
cal(D) l & = eta a b - dot(q) s b l \, #h(2em) l \( 1 \, dot.op \) = 0 . $ <eq:src5>]

]
] <lem:conc-hessian>

#proof[
  For $M g = g_(z z) + 2 s a g_z$, direct differentiation gives
  $ cal(D) \( M g \) = M \( cal(D) g \) + \( 2 a - dot(q) s U_z \) g_z . $
  Integrate the first term on the right side of the second equation in (3.6) by parts, using $frac(upright(d), upright(d) s) bb(E) M g \( s \, Z_s \) = bb(E) cal(D) \( M g \) \( s \, Z_s \)$. Substitute $v_z = l - eta U_z \/ 2$ and complete the square. Apart from $dot(q) s l^2 - 2 eta a l$, the remaining integrand is
  $ - 1 / 4 dot(q) s eta^2 U_z^2 + eta^2 a U_z + 1 / 2 eta dot(eta) thin M U . $
  The second identity
  $ cal(D) \( M U \) = 2 b^2 + 4 a U_z - dot(q) s U_z^2 $
  and one further integration by parts turn this integrand into $- eta^2 b^2 \/ 2$. There are no boundary terms because $eta \( 0 \) = eta \( 1 \) = 0$. Finally $cal(D) macron(v) = eta a^2 \/ 2$ and spatial differentiation, taking account of the derivative $dot(q) s b$ of the drift, give the equation for $l$. ◻
]

#thm([Proposition 3.3.])[
  (Concavity).  #emph[For every concave terminal in the class (3.3), $q mapsto Phi_u \( q \; Q \)$ is concave on smooth strictly increasing profiles. For every concave globally Lipschitz terminal, which need not be smooth or bounded above, and for the quadratic hinge $u = - beta V$, it is concave on the full convex set of nonnegative nondecreasing profiles bounded by $Q$.]
] <prop:conc-concavity>

#proof[
  First suppose $u'' lt.eq - rho < 0$. The stochastic flow in (3.5), started from $z$ at time $s$, has spatial Jacobian $J_(s \, r) = exp { integral_s^r dot(q) \( t \) t b \( t \, Z_t \) thin upright(d) t }$. Differentiating the martingale representation $a \( s \, z \) = bb(E)_(s \, z) u' \( Z_1 \)$ gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ b \( s \, z \) = bb(E)_(s \, z) [u'' \( Z_1 \) exp {integral_s^1 dot(q) \( t \) t b \( t \, Z_t \) thin upright(d) t}] . $ <eq:conc-curvature-flow>]
  Thus $k = - b$ is bounded and bounded away from zero. The product and quotient rules for $cal(D)$ give
  $ cal(D) \( l^2 \/ k \) = - 2 eta a l + dot(q) s l^2 + dot(q) / k \( l_z - l k_z \/ k \)^2 . $
  Since $l \( 1 \, dot.op \) = 0$, substitution into (3.7) yields the exact identity
  #[#set math.equation(numbering: n => "(3.9)")
   $ w \( 0 \, 0 \) =  & - frac(l \( 0 \, 0 \)^2, k \( 0 \, 0 \)) - bb(E) integral_0^1 dot(q) / k \( l_z - l k_z \/ k \)^2 thin upright(d) s\
 & - 1 / 2 integral_0^1 eta \( s \)^2 bb(E) b \( s \, Z_s \)^2 thin upright(d) s lt.eq 0 . $ <eq:conc-negative-squares>]
  For a merely concave $u$, apply this argument to $u - lambda z^2$ and let $lambda arrow.b 0$. The parabolic comparison and moment bounds in Lemma 9 give convergence on every smooth profile and its segments. Concavity passes to that limit. Finally approximate two arbitrary profiles and their segment together by smooth increasing profiles with the prescribed endpoint values. The $L^1$ continuity in (2.6) proves this extension for Lipschitz terminals already in the analytic class.
  To cover a general concave globally $L$-Lipschitz terminal, convolve it with a compact nonnegative mollifier of width $delta$. The resulting $u_delta$ is smooth and concave, has bounded derivatives of every order at least two, and satisfies $parallel u_delta - u parallel_oo lt.eq L delta$. For each $lambda > 0$, $u_delta - lambda z^2$ belongs to (3.3), so concavity holds for smooth profiles. Let $lambda arrow.b 0$ on each of the three profiles of a fixed chord. This limit needs no bound on $sup u_delta$ uniform in $lambda$. Indeed, for $0 < lambda lt.eq 1$, Jensen gives a common negative quadratic lower bound for the solutions, while $u_delta \( z \) - lambda z^2 lt.eq u_delta \( 0 \) + L \| z \|$ and $cal(T)_(a \, T) v lt.eq cal(T)_(1 \, T) v$ for $a in \[ 0 \, 1 \]$ give the upper bound
  $ F_(delta \, lambda) \( t \, z \) lt.eq u_delta \( 0 \) + L \| z \| + log bb(E) exp { L sqrt(Q) thin \| G \| } . $
  The curvature bounds, hence the linear-growth drift and its diffusion moments, are uniform for $lambda lt.eq 1$ at fixed $delta$. The linear equation comparing two such solutions therefore bounds their difference by $C_delta \| lambda - lambda' \| \( 1 + z^2 \)$. It identifies the limit with the Gaussian recursion for $u_delta$; alternatively the same conclusion follows by monotone convergence of its terminal weights, with the displayed upper and lower integrable bounds. Thus concavity holds for $u_delta$ on smooth profiles. Profile continuity from (2.6) extends it to all profiles, and the $1$-Lipschitz dependence of $Phi$ on the terminal uniform norm lets $delta arrow.b 0$. The quadratic hinge and its other required limits are treated below. ◻
]

=== 3.3 Strict concavity uniform over profiles <strict-concavity-uniform-over-profiles>

Fix $beta > 0$. Let $u_L$ be the function $- beta V$ on $\[ - L \, oo \)$, extended by its tangent line at $- L$ on $\( - oo \, - L \)$, where $L > 4$. Convolve with a nonnegative smooth mollifier of total mass one and support in $\[ - delta \, delta \]$, $0 < delta lt.eq 1 \/ 4$. Denote the resulting terminal by $u_(L \, delta)$. For the present argument one may also subtract $lambda z^2$, $0 < lambda lt.eq 1$. All these terminals have uniform quadratic-growth bounds, and

#[#set math.equation(numbering: n => "(3.10)")
 $ - beta - 2 lt.eq u'' lt.eq 0 \, #h(2em) integral_(bb(R)) \| u''' \( z \) \| thin upright(d) z lt.eq 2 beta \, #h(2em) u'' lt.eq - beta quad upright("on ") I = \[ - 3 \, - 2 \] . $ <eq:conc-base-bounds>]

The added quadratic is used only to justify division by $- b$; it will always be removed before an argument that requires a monotone terminal.

#thm([Lemma 3.4.])[
  (Diffusion density bounds).  #emph[Let $X$ solve $upright(d) X_t = upright(d) B_t + A \( t \, X_t \) upright(d) t$, with $\| partial_z A \| lt.eq K$ and $\| A \( t \, 0 \) \| lt.eq K$. Over an interval of length $T > 0$, its transition density is bounded above by $e^(K T) \/ sqrt(2 pi T)$. Moreover, when $X_0 = 0$, $Q in \[ 1 \/ 2 \, 2 \]$, and $K$ is fixed, the probability $bb(P) \( X_Q in I \)$ is bounded below by a positive constant depending only on $K$ and the nondegenerate bounded interval $I$.]
] <lem:conc-density>

#proof[
  Condition on the Brownian bridge and write the Brownian path over the interval as $sans(b)_t + \( t \/ T \) xi$, where $xi tilde.op cal(N) \( 0 \, T \)$ is independent of the bridge. The endpoint $X_T = cal(F) \( xi \)$ is an increasing function of $xi$. Differentiation of the integral equation gives
  $ cal(F)' \( xi \) = 1 / T integral_0^T exp {integral_r^T partial_z A \( v \, X_v \) thin upright(d) v} upright(d) r in \[ e^(- K T) \, e^(K T) \] . $
  The conditional change-of-variables formula proves the upper density bound, which remains true after averaging over the bridge. For the lower bound, restrict the bridge to an event on which its supremum is at most a fixed constant. Such an event has uniformly positive probability for $Q in \[ 1 \/ 2 \, 2 \]$, by Brownian scaling. Gronwall’s inequality then bounds $\| cal(F) \( 0 \) \|$ uniformly. The inverse image of $I$ is an interval of length at least $e^(- 2 K) \| I \|$ contained in a fixed bounded interval. Gaussian densities with variance $Q in \[ 1 \/ 2 \, 2 \]$ have a positive common lower bound there. Multiplication by the bridge-event probability proves the claim. ◻
]

#thm([Proposition 3.5.])[
  (Uniform strictness and stability).  #emph[There is $c_beta > 0$ such that, for every $Q in \[ 1 \/ 2 \, 2 \]$, every regularized base terminal just described, every smooth strictly increasing profile, and every smooth endpoint-zero direction, 
#[#set math.equation(numbering: n => "(3.11)")
 $ frac(upright(d)^2, upright(d) epsilon^2) Phi_u \( q + epsilon eta \; Q \) \|_(epsilon = 0) lt.eq - c_beta parallel eta parallel_2^2 . $ <eq:conc-strict-hessian>]

 For each $psi in C_c^oo \( bb(R) \)$ there is $d_0 = d_0 \( beta \, psi \) > 0$, independent of $L$, $delta$, $lambda$, $Q$, and the profile, such that (3.11) holds with $c_beta \/ 2$ for the terminal $u + d psi$ whenever $\| d \| lt.eq d_0$.]
] <prop:conc-stability>

#proof[
  In variance time the drift is $m \( t \) F_z \( t \, z \)$. Its Lipschitz and growth bounds are uniform by Lemma 9. Thus Lemma 12 gives $bb(P) \( Z_1 in I \) gt.eq p_beta > 0$, where $Z_1$ denotes the rank-time endpoint. From (3.8), the bound on $\| b \|$, and (3.10), for every $s$,
  $ bb(E) \[ - b \( s \, Z_s \) \] gt.eq beta e^(- K Q) bb(P) \( Z_1 in I \) gt.eq beta e^(- 2 K) p_beta . $
  Jensen’s inequality supplies a positive uniform lower bound on $bb(E) b \( s \, Z_s \)^2$. Equation (3.9) proves (3.11). The lower bound does not depend on $lambda$, so it survives $lambda arrow.b 0$.
  To prove stability, we compare slopes, then curvatures, then the modified variation $l$ under a common Brownian coupling. These three comparisons control every term in the Hessian identity. The curvature comparison uses the total variation of $u''$, so its constants remain uniform as the mollifier is removed.
  #emph[Slope comparison.] A tilde will denote the terminal $u + d psi$. Choose $\| d \|$ initially so that $\| d \| parallel psi'' parallel_oo < 1 \/ 4$; then its positive curvature bound is strictly less than $1 \/ \( 2 Q \)$ for $Q in \[ 1 \/ 2 \, 2 \]$, and all solution and drift bounds remain uniform. In this proof only, use variance-time notation $a = F_z$, $b = F_(z z)$ and its tilde analogue. At the same spatial point,
  $ tilde(cal(D)) \( tilde(a) - a \) = - m b \( tilde(a) - a \) \, #h(2em) \( tilde(a) - a \) \( Q \, dot.op \) = d psi' . $
  The diffusion representation implies
  #[#set math.equation(numbering: n => "(3.12)")
   $ sup_(t \, z) \| tilde(a) - a \| lt.eq C \| d \| . $ <eq:conc-slope-stability>]
  Couple both diffusions using the same Brownian motion. Starting from a common position at time $t$, Gronwall gives $\| tilde(X)_r - X_r \| lt.eq C \| d \| \( r - t \)$ for $t lt.eq r lt.eq Q$.
  #emph[Curvature comparison.] We use estimates that depend on the total variation of $u''$, and not on $parallel u''' parallel_oo$. The equation $cal(D) b_z = - 3 m b b_z$ and its diffusion representation give
  #[#set math.equation(numbering: n => "(3.13)")
   $ integral_(bb(R)) \| b_z \( t \, z \) \| thin upright(d) z lt.eq C \, #h(2em) sup_z \| b_z \( t \, z \) \| lt.eq C / sqrt(Q - t) quad \( t < Q \) . $ <eq:conc-curvature-bv>]
  For the first bound integrate the representation over starting positions; the pathwise spatial flow has Jacobian between $e^(- K Q)$ and $e^(K Q)$. For the second use the upper density bound of Lemma 12 and $integral \| u''' \| lt.eq 2 beta$.
  Compare the flow representations (3.8) for $b$ and $tilde(b)$, started from the same point at time $t$. The terminal perturbation contributes at most $C \| d \|$. For the displacement in the base terminal, use the elementary inequality
  $ \| u'' \( y \) - u'' \( x \) \| lt.eq integral_(x - h)^(x + h) \| u''' \( v \) \| thin upright(d) v #h(2em) \( \| y - x \| lt.eq h \) . $
  With $h = C \| d \| \( Q - t \)$ and the transition-density bound, its expectation is at most $C \| d \| sqrt(Q - t)$. The difference of the two exponential Jacobians is at most a constant times the integral of the difference of their curvatures along the paths. Putting $A \( t \) = sup_z \| tilde(b) \( t \, z \) - b \( t \, z \) \|$ and using (3.13) therefore gives
  $ A \( t \) lt.eq C \| d \| + C integral_t^Q (A \( r \) + frac(\| d \| \( r - t \), sqrt(Q - r))) upright(d) r . $
  The singularity is integrable, and backward Gronwall yields
  #[#set math.equation(numbering: n => "(3.14)")
   $ sup_(t \, z) \| tilde(b) \( t \, z \) - b \( t \, z \) \| lt.eq C \| d \| . $ <eq:conc-curvature-stability>]
  For paths coupled from the root, their displacement at variance time $t$ is at most $C \| d \| t$. The same elementary inequality, now applied to $b \( t \, dot.op \)$, and its total variation and the density bound at time $t$, give
  $ bb(E) \| b \( t \, tilde(X)_t \) - b \( t \, X_t \) \| lt.eq C \| d \| sqrt(t) . $
  At $t = 0$ the positional difference is zero. Combining this estimate with (3.14) and the uniform boundedness of both curvatures gives, for every fixed $p gt.eq 1$,
  #[#set math.equation(numbering: n => "(3.15)")
   $ sup_t parallel tilde(b) \( t \, tilde(X)_t \) - b \( t \, X_t \) parallel_(L^p) lt.eq C_p \| d \|^(1 \/ p) . $ <eq:conc-coupled-curvature>]
  The coupled slopes differ pointwise by $C \| d \|$ and have uniformly bounded moments of every fixed order.
  #emph[Comparison of the modified variations.] Return to rank time and write $a_s = a \( s \, Z_s \)$, $b_s = b \( s \, Z_s \)$ and $l_s = l \( s \, Z_s \)$. On the common Brownian filtration $cal(F)_s$, the second equation of (3.7) gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ l_s = - bb(E) [integral_s^1 eta \( r \) a_r b_r exp {integral_s^r dot(q) \( v \) v b_v thin upright(d) v} upright(d) r\| cal(F)_s] . $ <eq:conc-l-representation>]
  This same filtration is used for the tilde representation; no comparison of unrelated conditional laws is involved. Both exponential factors are uniformly bounded since $integral_0^1 dot(q) thin upright(d) s = Q lt.eq 2$. Conditional expectation is a contraction in $L^p$, so
  $ sup_s parallel l_s parallel_(L^p) + sup_s parallel tilde(l)_s parallel_(L^p) lt.eq C_p parallel eta parallel_1 . $
  Hölder’s inequality, (3.15) with $p = 4$, the slope estimates, and Minkowski’s inequality for the exponential integrals give
  #[#set math.equation(numbering: n => "(3.17)")
   $ sup_s parallel tilde(l)_s - l_s parallel_(L^2) lt.eq C \| d \|^(1 \/ 4) parallel eta parallel_1 . $ <eq:conc-l-stability>]
  For example, the difference of the exponential factors has $L^4$ norm at most $C integral_s^r dot(q) \( v \) parallel tilde(b)_v - b_v parallel_(L^4) upright(d) v lt.eq C \| d \|^(1 \/ 4)$; multiplying by $a_r b_r$, whose $L^4$ norm is bounded, proves the relevant $L^2$ bound.
  #emph[Hessian comparison.] Compare the three terms of (3.7). The $dot(q) s l^2$ term changes by at most $C \| d \|^(1 \/ 4) Q parallel eta parallel_1^2$; the $2 eta a l$ term by at most $C \| d \|^(1 \/ 4) parallel eta parallel_1^2$; and the $eta^2 b^2 \/ 2$ term by at most $C \| d \| parallel eta parallel_2^2$. Since $parallel eta parallel_1 lt.eq parallel eta parallel_2$,
  #[#set math.equation(numbering: n => "(3.18)")
   $ \| tilde(w) \( 0 \, 0 \) - w \( 0 \, 0 \) \| lt.eq C \| d \|^(1 \/ 4) parallel eta parallel_2^2 . $ <eq:conc-hessian-stability>]
  Choosing $d_0$ so that $C d_0^(1 \/ 4) lt.eq c_beta \/ 2$ proves the proposition. ◻
]

=== 3.4 Removing regularizations and general profiles <removing-regularizations-and-general-profiles>

We now pass the estimates to the terminals and profiles used in the pressure formula. The resulting statement is the row-functional input for both minimizer identification and compact row perturbations.

#thm([Corollary 3.6.])[
  (The uncapped row functional).  #emph[Fix $beta > 0$ and $psi in C_c^oo \( bb(R) \)$. There are constants $c_beta > 0$ and $d_0 = d_0 \( beta \, psi \) > 0$ such that, for $u_d = - beta V + d psi$, $\| d \| lt.eq d_0$, $Q in \[ 1 \/ 2 \, 2 \]$, and all $q \, r in cal(Q)_Q$, 
#[#set math.equation(numbering: n => "(3.19)")
 $ Phi_(u_d) \( \( 1 - t \) q + t r \; Q \) gt.eq \( 1 - t \) Phi_(u_d) \( q \; Q \) + t Phi_(u_d) \( r \; Q \) + c_beta / 4 t \( 1 - t \) parallel r - q parallel_2^2 \, #h(2em) 0 lt.eq t lt.eq 1 . $ <eq:conc-chord>]

 When $d = 0$, the last coefficient can be replaced by $c_beta \/ 2$. The derivative formula (2.6), including its one-sided endpoint interpretation, holds with the terminal $u_d$ and fixed diagonal $Q$. Its nonnegative nondecreasing derivative profile satisfies $sup_(q \, Q \, d) parallel D_q^(u_d) parallel_oo lt.eq C_(beta \, psi)$ in these ranges and depends continuously on $q$ in $L^1$ at fixed $Q \, d$. The functional values and derivative profiles are limits of those for $u_(L \, delta) + d psi$, uniformly over $q \, Q \, d$, with derivative convergence in $L^1 \( upright(d) s \)$. Here $delta arrow.b 0$ at each fixed cap before $L arrow.r oo$.]
] <cor:conc-hinge-stability>

#proof[
  The profile inequalities above are uniform in $dot(q)$: their constants use only $Q = integral dot(q)$. To approximate two arbitrary profiles $q \, r$, smooth their monotone extensions, add a small increasing linear function, and insert short ramps at $0$ and $1$ to impose the values $0 \, Q$. These approximations can be chosen to remain in $\[ 0 \, Q \]$ and converge in $L^1$, hence also in $L^2$; their convex combinations approximate the whole segment. For a fixed capped and mollified terminal, first let $lambda arrow.b 0$ on these smooth segments. Then (2.6) passes the strong concavity inequalities to all profiles. Integrating the Hessian bound gives (3.19) for each capped and mollified terminal, with coefficient $c_beta \/ 2$ in the unperturbed case and $c_beta \/ 4$ in the perturbed case.
  We justify the remaining terminal limits uniformly in the profile. If $mu$ is any probability measure on $bb(R)$, $w$ is nonnegative and increasing with $0 < integral w thin upright(d) mu < oo$, and $T$ is nonnegative and decreasing, then
  #[#set math.equation(numbering: n => "(3.20)")
   $ frac(integral T w thin upright(d) mu, integral w thin upright(d) mu) lt.eq integral T thin upright(d) mu . $ <eq:conc-monotone-tilt>]
  First take $T$ bounded. The covariance of $T$ and $w$ equals half the integral of $\( T \( x \) - T \( y \) \) \( w \( x \) - w \( y \) \)$ against $mu ⊗ mu$, and is nonpositive. Apply this to $T and K$ and let $K arrow.r oo$ to obtain the general case by monotone convergence. To apply this inequality, condition first on the cavity measure and the new Gaussian field, and let $mu$ be the pushforward of the cavity measure under that field. Insertion of an increasing terminal $u$ replaces $mu$ by its tilt with weight $w = e^u$. Only after applying the inequality do we average over the independent field and the cavity randomness. Before insertion, one sampled field value then has law $cal(N) \( 0 \, Q \)$, because its diagonal covariance is $Q$. For the RPC row functional the same construction includes any independent residual Gaussian in the base space. Adding $d psi$ increases the right side of (3.20) by at most the factor $exp \( 2 \| d \| parallel psi parallel_oo \)$.
  The tangent cap satisfies the exact identity
  $ 0 lt.eq u_L \( z \) + beta V \( z \) = beta / 2 \( z + L \)_(-)^2 . $
  Every terminal between $u_L$ and $- beta V$ is increasing. Interpolating between them and using (3.20) proves
  #[#set math.equation(numbering: n => "(3.21)")
   $ sup_q \| Phi_(u_L + d psi) \( q \; Q \) - Phi_(- beta V + d psi) \( q \; Q \) \| lt.eq e^(2 \| d \| parallel psi parallel_oo) bb(E) beta / 2 \( sqrt(Q) G + L \)_(-)^2 arrow.r 0 . $ <eq:conc-cap-limit>]
  The convergence is also uniform for $Q in \[ 1 \/ 2 \, 2 \]$. For each fixed $L$, mollification converges uniformly in terminal value, since $u_L$ is Lipschitz; the row functional is $1$-Lipschitz for the uniform norm on its terminal. Thus the limits are taken in the order $lambda arrow.b 0$, $delta arrow.b 0$, and $L arrow.r oo$. Equation (3.19), including its perturbed form, survives them.
  The derivative functional also converges uniformly in the profile. Here are the necessary uniform-integrability details. The derivatives of $u_L + d psi$ agree with that of $u_d$ outside $\( - oo \, - L \)$ and their absolute values there are bounded by a constant times $1 + \| z \|$. Equation (3.20), applied to higher negative-tail moments, bounds their tilted moments of every fixed order uniformly. Let $nu_L$ denote a row measure tilted by $u_L + d psi$ and let $nu$ be the corresponding uncapped measure. Both measures are defined on the same marked base space: the cascade leaf, its full Gaussian field, and an independent residual Gaussian integrated inside the terminal weight, when present. Include the common refined rank genealogy, inserting zero-variance levels as in Section 2, or its equivalent auxiliary rank variables. In a two-replica expectation the continuous rank is then a common measurable observable even when both replicas select the same leaf of the original finite cascade. Thus comparison of the full product measures also controls every bounded rank test. Their unnormalized density ratio is $e^(- beta V - u_L) lt.eq 1$ and equals one on $\[ - L \, oo \)$. If $epsilon_L = nu_L \( \( - oo \, - L \) \)$, normalization and the triangle inequality give
  $ parallel nu - nu_L parallel_(upright("TV") \, 1) lt.eq 4 epsilon_L \, $
  where $parallel dot.op parallel_(upright("TV") \, 1)$ is total variation without the factor $1 \/ 2$. The averaged right side tends to zero uniformly by (3.20). The same is true for two replicas. Test the product of the two terminal derivatives against any bounded function of rank, first truncating the derivatives and then using their uniform higher moments. The two-replica formula for $D_q$ therefore gives uniform $L^1 \( upright(d) s \)$ convergence of the capped derivative profiles to $D_q^(u_d)$. Mollification is handled similarly at each fixed cap. In particular $D_q^(u_d)$ is continuous in $q$ in $L^1$, by the corresponding capped assertion and this uniform approximation. Moreover its $L^oo$ norm is uniformly bounded: the derivative martingale and the terminal second-moment bound give $D_q^(u_d) \( s \) lt.eq bb(E)_(upright("tilted")) \( u'_d \)^2 lt.eq C_(beta \, psi)$. Thus the integrated derivative formula (2.6) and its one-sided derivative interpretation extend to $u_d$. ◻
]

For $u = - beta V$, write $p_q = alpha D_q$, $alpha > 0$. Adding the two tangent inequalities furnished by the unperturbed version of (3.19), and using the gradient $- D_q \/ 2$, proves

#[#set math.equation(numbering: n => "(3.22)")
 $ integral_0^1 \( r - q \) \( p_r - p_q \) thin upright(d) s gt.eq c_(alpha \, beta) parallel r - q parallel_2^2 \, #h(2em) c_(alpha \, beta) = 2 alpha c_beta > 0 . $ <eq:src6>]

All these assertions hold at the fixed diagonal $Q = 1$ used below; the uniform neighborhood $Q in \[ 1 \/ 2 \, 2 \]$ is available when varying a diagonal in a cavity calculation.

#thm([Corollary 3.7.])[
  (Convex perturbations of the loss).  #emph[Let 
$ W \( z \) = c V \( z \) + chi \( z \) \, #h(2em) c > 0 \, #h(2em) chi in C_c^oo \( \( - oo \, - 1 \) \) \, $

 and suppose that $W gt.eq 0$, $W' lt.eq 0$, and $W'' gt.eq 0$ distributionally. For every fixed $beta > 0$, the terminal $u = - beta W$ has a concave row functional on all profiles with fixed diagonal $Q in \[ 1 \/ 2 \, 2 \]$. The derivative formula (2.6), continuity of $D_q$ in $L^1$, and the uniform tangent-cap limits hold for this terminal. In particular, the Gaussian interpolation upper bound derived for smooth concave caps applies to $- beta W$ after removal of the cap.]
] <cor:conc-convex-loss>

#proof[
  The terminal is concave and increasing. Its derivative is Lipschitz, has at most linear growth, and vanishes on $\[ - 1 \, oo \)$. Choose $L$ so large that $- L < inf "supp" chi$, with the condition omitted when $chi = 0$, and extend $u$ tangentially below $- L$. The resulting terminal $u_L$ is concave, increasing, and globally Lipschitz. Proposition 11 applies after mollification and its removal. Because the cutoff lies below the entire support of $chi$, its error is exactly
  $ u_L \( z \) - u \( z \) = frac(beta c, 2) \( z + L \)_(-)^2 . $
  Every intermediate terminal is increasing, so (3.20) bounds the difference of the row functionals by $frac(beta c, 2) bb(E) \( sqrt(Q) G + L \)_(-)^2$, uniformly in the profile. The same comparison applies to a row insertion in the microscopic Gaussian model. The derivatives agree outside the cutoff region and are bounded by $C_(beta \, W) \( 1 + \| z \| \)$ within it. Higher Gaussian negative-tail moments and the marked-space total-variation comparison above prove uniform convergence of $D_q$ and its differential formula. This proves all assertions, including passage of the interpolation bound to the uncapped loss. ◻
]

If $psi in C_c^oo \( \( - oo \, 0 \) \)$ has support in $\[ - R \, - a \]$, $a > 0$, then $W_w \( z \) = V \( z \) + w psi \( 1 + z \)$ satisfies its assumptions for both signs of all sufficiently small #emph[fixed] $w$. For example it suffices to require

$ \| w \| parallel psi'' parallel_oo lt.eq 1 / 2 \, #h(2em) \| w \| parallel psi' parallel_oo lt.eq a / 2 \, #h(2em) \| w \| parallel psi parallel_oo lt.eq a^2 / 4 . $

On the perturbation support these inequalities give $W''_w gt.eq 1 \/ 2$, $W'_w lt.eq - a \/ 2$, and $W_w gt.eq a^2 \/ 4$; outside it the loss equals $V$. Hence the concavity assertion applies to $- beta W_w$ at every $beta$, without requiring $\| beta w \| lt.eq d_0$. The scaled loss $\( 1 + w \) V$, $w > - 1$, is covered by $chi = 0$, $c = 1 + w$.

== 4 The Gaussian pressure <sec:gaussian-pressure>

For each row terminal $u$ used below, define the finite-system Gaussian pressure by

$ P_N \( u \) = 1 / N bb(E) log integral_(bb(S)_N) exp {sum_(mu = 1)^M u \( g_mu \( x \) \)} sigma_N \( upright(d) x \) \, #h(2em) M = floor.l alpha N floor.r . $

Thus $P_N \( - beta V \)$ is the pressure of the model at inverse temperature $beta$.

We prove, for $alpha \, beta > 0$, the Gaussian pressure formula

$ lim_(N arrow.r oo) P_N \( - beta V \) = min_(q_(*) < 1) { alpha Phi_(- beta V) \( q \) + E \( q \) } . $

We first prove matching bounds for smooth caps of the row potential. The upper bound inserts one independent row into a limiting overlap array and uses concavity of its row functional. The lower bound adds a fixed number of spin coordinates. Their Gaussian fields have an empirical covariance built from row derivatives; deleting and reinserting two rows identifies that covariance and its fluctuations. These two arguments use the same cascade representation, established below from a vanishing perturbation and the Ghirlanda–Guerra identities. After removing the cap, the spin inverse relation turns the common row–spin expression into the displayed entropy formula.

Throughout this section a profile has diagonal $1$, unless another diagonal is explicitly specified. We write $chevron.l dot.op chevron.r$ for the Gibbs expectation of the system currently under consideration, and include all its randomness in $bb(E)$. The perturbation coefficients introduced below are held fixed inside $bb(E)$; their product-uniform average is denoted by $bb(E)_c$.

We first work with a smooth concave tangent cap $u$ having bounded first three derivatives and at most linear growth. The concentration and cavity arguments need only these regularity bounds. The interpolation upper bound additionally uses profile concavity from Section 3; it therefore also applies to the small terminal perturbations constructed there.

=== 4.1 Perturbations and overlap arrays <perturbations-and-overlap-arrays>

The perturbation will identify every subsequential overlap law needed in the bounds, without requiring convergence of the unperturbed overlap law. An overlap array is viewed as an element of the compact product space of its entries. Convergence of its law means convergence of every finite subarray. For spins $x^ell in sqrt(N) bb(S)^(N - 1)$ put $R_(ell ell') = N^(- 1) x^ell dot.op x^(ell')$. When a finite trial cascade is present, let $Q_(ell ell')$ be its covariance overlap, including $Q_(ell ell) = 1$.

#thm([Lemma 4.1.])[
  (A vanishing perturbation).  #emph[Fix $rho in \( 1 \/ 4 \, 1 \/ 2 \)$ and put $s_N = N^rho$. There is an independent centered Gaussian perturbation $H_N^(upright("pert"))$ with the following properties.]
  + #emph[Its addition changes the expected pressure by at most $C s_N^2 \/ N$.]
  + #emph[For the sphere-only system, every subsequential overlap-array limit obtained at almost every perturbation parameter satisfies the Ghirlanda–Guerra identities. With a finite trial cascade, the corresponding identities hold for every continuous function of the pair $\( R \, Q \)$: 
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) chevron.l f psi \( R_(1 \, n + 1) \, Q_(1 \, n + 1) \) chevron.r = 1 / n bb(E) chevron.l f chevron.r bb(E) chevron.l psi \( R_12 \, Q_12 \) chevron.r + 1 / n sum_(ell = 2)^n bb(E) chevron.l f psi \( R_(1 ell) \, Q_(1 ell) \) chevron.r . $ <eq:press-joint-gg>]

 Here $n gt.eq 2$ and $f$ is a bounded measurable function of the first $n$ joint overlaps. For the sphere-only system, omit $Q$.]
  + #emph[The extraction can be made simultaneously for any prescribed countable collection of systems with finitely many rows removed, and for almost every time in a bounded interpolation parameter interval.]
  #emph[In (ii)–(iii) the precise extraction convention is this: from any dimension subsequence one can first choose a further subsequence on which all the identity errors vanish for almost every coefficient vector, and then, for each such vector, take any further convergent array subsequence. No assertion is made that averaging limiting arrays over coefficient vectors preserves these identities.]
] <lem:press-gg>

#proof[
  Enumerate pairs $\( j \, lambda \)$, where $j gt.eq 1$ and $lambda$ belongs to a countable dense subset of $\[ 0 \, oo \)$ containing $0$. Let $h_(j \, lambda)$ be independent unit-variance Gaussian fields with covariance
  $ K_(j \, lambda) \( \( x \, tau \) \, \( x' \, tau' \) \) = (frac(R \( x \, x' \) + lambda Q \( tau \, tau' \), 1 + lambda))^j . $
  These are positive semidefinite kernels: $R + lambda Q$ is a Gram kernel and integer powers preserve positive semidefiniteness by the Schur product identity. The binomial expansion separates powers of $R$ and $Q$. Each power of $Q$ has nonnegative increments along the cascade, so the fields can be realized using independent child fields conditional on their ancestor fields. Choose positive weights $w_(j \, lambda)$ with $sum w_(j \, lambda)^2 j < oo$, and set
  $ H_N^(upright("pert")) = s_N sum_(j \, lambda) w_(j \, lambda) c_(j \, lambda) h_(j \, lambda) \, #h(2em) c_(j \, lambda) in \[ 1 \, 2 \] . $
  In the sphere-only construction use just covariance kernels $R^j$. The Gaussian covariance metric is continuous on each sphere, and the fields are taken in their separable versions. Gaussian interpolation bounds the pressure change by $C s_N^2 \/ N$.
  Here is the concentration estimate needed for the perturbation argument:
  #[#set math.equation(numbering: n => "(4.2)")
   $ bb(E) \| log Z - bb(E) log Z \| lt.eq C \( sqrt(N) + s_N \) . $ <eq:press-log-concentration>]
  Without a cascade, Gaussian concentration gives this directly. Indeed the gradient of $sum_(mu lt.eq M) u \( g_mu \( x \) \)$ with respect to the row entries has squared norm at most $M parallel u' parallel_oo^2$, uniformly on the sphere. Any linear Gaussian spin terms have squared reproducing-kernel norm $O \( N \)$, and the perturbation has squared norm $O \( s_N^2 \)$.
  For a fixed finite cascade apply Lemma 2 to the spin-integrated leaf partition marks. Conditional on shared root Gaussian fields, the log partition is a recursive root shift plus the difference of two log cascade masses. The latter have uniformly bounded second moments, with a constant depending on the fixed cascade. Recursive logarithmic moments preserve a uniform Lipschitz constant: if $\| F \( g \, z \) - F \( g' \, z \) \| lt.eq L parallel g - g' parallel$ for every child mark $z$, the same bound holds after applying $m^(- 1) log bb(E)_z e^(m F)$. Thus the root shift has Lipschitz constant $C \( sqrt(N) + s_N \)$ in its shared Gaussian fields. All child moments needed here are finite, by bounded slope and Gaussian moments; at fixed dimension one can also bound them by the supremum of the corresponding Gaussian sphere process. This proves (4.2), uniformly in interpolation time and after deletion of a fixed number of rows.
  For completeness we derive the identities rather than invoke a separate perturbation theorem. Fix one field $h$ with coefficient $s w c$, where $s = s_N$ and $w > 0$ is fixed, and put $F \( c \) = log Z \( c \)$. Then
  $ F' \( c \) = s w chevron.l h chevron.r \, #h(2em) F'' \( c \) = \( s w \)^2 chevron.l \( h - chevron.l h chevron.r \)^2 chevron.r . $
  Gaussian integration by parts gives
  $ bb(E) chevron.l h chevron.r = s w c thin bb(E) chevron.l K_11 - K_12 chevron.r . $
  Consequently integration over $c in \[ 1 \, 2 \]$ bounds the mean thermal variance of $h$ by a constant. The resulting integrated thermal absolute deviation is $O \( 1 \) = o \( s \)$.
  For the disorder deviation, the convex difference-quotient inequalities for $F$ and $bb(E) F$, at distance $d in \( 0 \, 1 \/ 4 \)$, give
  $ integral_1^2 bb(E) \| chevron.l h chevron.r - bb(E) chevron.l h chevron.r \| thin upright(d) c lt.eq C_w {frac(sqrt(N) + s, s d) + s d} . $
  To justify the second term, integrate the increments of the monotone function $\( bb(E) F \)'$ over the enlarged interval $\[ 1 - d \, 2 + d \]$; their total is at most $C_w d s^2$, before division by $s w$. The concentration bound applies on this enlarged interval as well. Taking $d = N^(1 \/ 4 - rho)$ makes the last display $o \( s \)$. In Gaussian integration by parts against a bounded replica test $f$, one may therefore replace $h \( x^1 \, tau^1 \)$ by its disorder mean at an error $o \( s \)$ after coefficient averaging. Division by $s w c$ gives a vanishing integrated absolute error in (4.1), first with $psi = K$.
  For each total degree $j$, the polynomials $\( R + lambda Q \)^j$ at $j + 1$ distinct values of $lambda$ span the homogeneous polynomials of degree $j$ in $\( R \, Q \)$. Polynomial approximation gives all continuous $psi$ and all continuous finite-array tests; a monotone-class argument gives measurable $f$. Choose countable determining families. The sum of their integrated errors, with summable weights, tends to zero. A subsequence with summable weighted errors has pointwise vanishing errors for almost every coefficient vector. Including interpolation time and a countable list of deleted-row systems in this extraction proves (iii). Compactness of the array space then gives the asserted limiting identities. ◻
]

The only general ultrametricity theorem used here is the following array formulation of Panchenko’s theorem [20] Theorem 1. A weakly exchangeable positive semidefinite random array with fixed diagonal, whose off-diagonal entries satisfy the Ghirlanda–Guerra identities for all bounded measurable pair tests, is almost surely ultrametric:

$ R_23 gt.eq min { R_12 \, R_13 } . $

The equivalent random-measure formulation concerns independent samples from a random probability measure on a separable Hilbert ball. Precisely, the Gram-array representation [19] Proposition 1 says that a weakly exchangeable positive semidefinite array with diagonal $1$ has a realization

$ R_(ell ell') = v^ell dot.op v^(ell') + upright(bold(1))_({ ell = ell' }) \( 1 - parallel v^ell parallel^2 \) \, $

where, conditional on a random probability measure on the unit Hilbert ball, the vectors $v^ell$ are independent samples from that measure. To account for the latent diagonals, let $q^dagger$ be the supremum of the one-overlap support. The directing measure is almost surely supported on $parallel v parallel^2 = q^dagger$; this is also [18] Theorem 2(a). Here is the short argument needed for this fact. If an overlap set $B$ has probability $c > 0$, GG implies that the probability of avoiding $B$ in all $n$ overlaps with replica $1$ equals $product_(j = 1)^n \( 1 - c \/ j \)$, which tends to zero. Conditional independent sampling then shows that almost every directing point has positive mass of partners with overlap in $B$. Apply this to $B = \( t \, q^dagger \]$, for every rational $t < q^dagger$. Since two directing points almost surely have inner product at most $q^dagger$, continuity and separability imply $parallel v parallel^2 lt.eq q^dagger$ throughout the support: a sufficiently small ball around a counterexample would give larger inner products with positive probability. Cauchy–Schwarz now excludes $parallel v parallel^2 < q^dagger$, since such a point could not have partners with overlaps arbitrarily close to $q^dagger$. Thus the latent diagonals are deterministic, and the random-measure GG identities follow from the array identities. Panchenko’s ultrametricity theorem applies. Adding a constant Gram kernel and rescaling allows this reasoning for any bounded fixed diagonal before positivity is known.

#thm([Lemma 4.2.])[
  (Synchronization and identification).  #emph[Suppose the joint array $\( R \, Q \)$ is a subsequential limit from Lemma 16. Then $R gt.eq 0$ off the diagonal. There are nonnegative nondecreasing profiles $r \, q$, on a common canonical rank array $\( U_(ell ell') \)$, such that 
$ \( R_(ell ell') \, Q_(ell ell') \) =^(upright("law")) \( r \( U_(ell ell') \) \, q \( U_(ell ell') \) \) \, #h(2em) ell eq.not ell' . $

 If the finite trial cascade has prescribed profile $q$, this is that same profile. In the sphere-only case the array is the RPC array determined by its one-overlap marginal.]
] <lem:press-sync>

#proof[
  Apply ultrametricity separately to $R$, $Q$, and $R + Q$, using (4.1). First, if $bb(P) \( R_12 lt.eq a \) = m > 0$ for some $a < 0$, ultrametricity makes $R_(i j) > a$ an equivalence relation on distinct replicas. On the event that $n$ sampled replicas occupy distinct classes, GG gives probability $\( 1 - m \) \/ n$ for the next replica to join any specified class. These joining events are disjoint, so the probability of avoiding them all is $m$. Induction gives positive probability of arbitrarily many pairwise overlaps at most $a$. Positive semidefiniteness forbids this, since on that event the sum of the entries of the $n times n$ Gram matrix is at most $n + n \( n - 1 \) a < 0$ for sufficiently large $n$.
  Let $mu$ be the law of $\( R_12 \, Q_12 \)$. If two points in its support were strictly incomparable coordinatewise, choose disjoint neighborhoods $A \, B$ with $R_A < R_B$ and $Q_A > Q_B$. GG with two old replicas gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] \( R_12 \, Q_12 \) in A \, \( R_13 \, Q_13 \) in B #scale(x: 120%, y: 120%)[\)] = 1 / 2 mu \( A \) mu \( B \) > 0 . $
  On this event scalar ultrametricity forces $R_23 = R_12$ and $Q_23 = Q_13$. Thus $R_23 + Q_23$ is strictly smaller than both $R_12 + Q_12$ and $R_13 + Q_13$, contradicting ultrametricity of the sum. The support of $mu$ is therefore a chain. Each coordinate is a nondecreasing function of the sum on that support, and the pair has comonotone quantiles.
  It remains to identify the whole array, since a pair marginal alone would otherwise be insufficient. At any threshold with lower mass $m$, GG says, conditional on the old array, that the new replica joins an existing ultrametric class containing $l$ old replicas with probability $\( l - m \) \/ n$. For finitely many thresholds, the classes form a nested partition. These joining probabilities, and their differences for a parent and its children, determine the distribution of the new branch. Induction in the number of replicas determines the law of the discretized array. By Lemma 3 it is exactly the finite RPC sampling law. Refining thresholds at continuity points identifies the full scalar array. Apply this to the sum and then to its two coordinate functions to obtain the common rank representation.
  Finally, at finite $N$ the cascade genealogy retains its prescribed law after the spin-integrated tilt: all Gaussian fields in the model, including the perturbation, have conditional child independence. This is precisely Lemma 2. Hence the limiting second marginal is the prescribed trial profile. ◻
]

#thm([Lemma 4.3.])[
  (Deleting and reinserting finitely many rows).  #emph[Consider any convergent deleted-row overlap-array subsequence satisfying the preceding lemmas. Reinsert finitely many independent Gaussian rows, with potentials of bounded slope and with covariances given by continuous functions of the available overlap kernels. Suppose those covariances are represented by nondecreasing profiles on the common rank array. Then:]
  + #emph[the entire common-rank genealogy retains its law after insertion;]
  + #emph[conditional on this genealogy, separate inserted row-mark families are independent and have their individually tilted RPC laws;]
  + #emph[for a row of covariance profile $C$, the conditional mean of the product of two terminal derivatives is $D_C \( U_12 \)$, with diagonal mean $D_(C \, d)$.]
  #emph[The conclusions include convergence of tilted polynomial-growth row observables whenever their requisite moments are uniformly integrable. In particular any convergent rowful array and any further limit with a fixed finite set of its rows removed have the same profile.]
] <lem:press-row-insertion>

#proof[
  Conditionally on the deleted-row Gibbs measure, the new row values sampled on finitely many replicas are centered Gaussian vectors with the displayed covariance arrays. They therefore converge jointly with the base arrays. For every fixed $a < oo$, their bounded-slope potentials obey $bb(E) chevron.l e^(a \| u \( g \) \|) chevron.r lt.eq C_a$ before insertion. The replica truncation argument of Lemma 4 consequently passes both the finite-row tilt and its observables to the limit. For a finite RPC, claims (i)–(iii) are the marking transformation and additive-mark factorization of Lemma 2, together with the derivative-martingale definition of $D_C$. In particular, the marking transformation makes the transformed weight tree independent of the separate row-mark families. Sampling replicas from those weights therefore preserves their conditional factorization given the genealogy. This is the depth-two calculation in the proof of Lemma 2, applied to the sum of the inserted-row potentials; it uses no independence between a stable total and its normalized jumps.
  For the passage to general profiles, retain the canonical rank array itself in the replica convergence, even on plateaus of the covariance profile. The following conditional-kernel version of the truncation argument makes the factorization passage precise. For a bounded continuous observable $F$ of the row marks at the first $n$ replicas, its conditional expectation given their ranks is approximated in $L^1$ of the fixed rank law by the finite-replica polynomial approximants to the truncated tilt numerator and denominator. The truncation error is uniform over bounded profiles, by the exponential moment bounds. At finite profile, invariance of the tilted rank marginal lets us interpret these approximants as conditional kernels relative to the same canonical rank law. A polynomial approximant uses a fixed finite number of additional replicas. Integrating its Gaussian marks gives a bounded function $K_j$ of all the ranks of those replicas. Under $C_j arrow.r C$ in $L^1$, the covariance entries converge almost surely along a subsequence; Gaussian covariance continuity and dominated convergence give $K_j arrow.r K$ in $L^1$ of the fixed rank law. Averaging the additional ranks conditional on the first $n$ ranks preserves this convergence, since
  $ parallel bb(E) \[ K_j - K divides \( U_(a b) \)_(a \, b lt.eq n) \] parallel_1 lt.eq parallel K_j - K parallel_1 . $
  The conditional law of those additional ranks is independent of the covariance profile. Thus the exact bounded conditional kernels converge in $L^1$. Products of such kernels also converge in $L^1$. The finite-profile factorization identities against any bounded cylinder test of the ranks therefore pass to the limit. A monotone-class argument extends them to the entire countable genealogy. This proves (i)–(iii) without presuming that conditional independence is closed under weak convergence.
  In particular, for two inserted rows $A \, B$ with profile $C_j$ and for any bounded cylinder test $H$ of the full rank array, the identity needed below is
  $ bb(E) chevron.l H a_A^1 a_A^2 a_B^1 a_B^2 chevron.r = bb(E) \[ H D_(C_j) \( U_12 \)^2 \] . $
  Its limit also follows directly from $D_(C_j) arrow.r D_C$ in $L^1$ and bounded slope. Single-replica analogues have constant right-hand factors. Polynomial observables follow by truncation and the same exponential moment bounds. The last assertion follows by first taking a joint subsequence of the rowful and deleted-row laws, then representing the former as the tilt of the latter. Claim (i) identifies their complete overlap-array laws. ◻
]

=== 4.2 The interpolation upper bound <the-interpolation-upper-bound>

The comparison follows Guerra’s interpolation scheme [13] §4: we connect the interacting system to a hierarchical trial system and control the sign of the overlap remainder. Here that sign follows from the row-profile concavity proved in Section 3. The synchronized cavity limits used for this nonlinear spherical model are proved here; the SK bound itself is not an input for the present model.

Fix a finite trial profile $q$ reaching diagonal $1$, and put $p = p_q = alpha D_q$, with diagonal $p_d = alpha D_(q \, d)$. Since $D_q$ is constant on plateaus of $q$, the off-diagonal field $p$ is a measurable function of the trial overlap $Q$ itself. Take independent fields $z_mu \( tau \)$, $z_i^p \( tau \)$, and $Y \( tau \)$ of covariance profiles $q$, $p$, and $q p$, respectively. On the product of sphere and cascade interpolate with exponent

#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(mu lt.eq M) u #scale(x: 120%, y: 120%)[\(] sqrt(t) thin g_mu \( x \) + sqrt(1 - t) thin z_mu \( tau \) #scale(x: 120%, y: 120%)[\)] + sqrt(1 - t) sum_(i = 1)^N x_i z_i^p \( tau \) + sqrt(t N) thin Y \( tau \) + H_N^(upright("pert")) . $ <eq:press-interpolating-exponent>]

Write $phi_N \( t \)$ for its normalized expected log partition, including coefficient averaging. For an individual row put $a_mu = u' \( sqrt(t) thin g_mu + sqrt(1 - t) thin z_mu \)$. Gaussian covariance differentiation cancels all diagonal terms and gives

#[#set math.equation(numbering: n => "(4.4)")
 $ phi'_N \( t \) = - frac(M, 2 N) bb(E)_c bb(E) chevron.l \( R_12 - Q_12 \) a_mu^1 a_mu^2 chevron.r + 1 / 2 bb(E)_c bb(E) chevron.l \( R_12 - Q_12 \) p \( U_12^tau \) chevron.r . $ <eq:press-interpolation-derivative>]

Here row exchangeability permits any fixed $mu$, and $U^tau$ denotes the trial cascade rank. The last term is the combined derivative of the linear spin and compensation fields: their covariance derivative is $N \( Q - R \) p$, and their diagonal derivatives cancel.

To control a subsequential limit at almost every $t$ and coefficient vector, remove row $mu$. Lemmas 16 and 17 give comonotone cavity profiles $\( r \, q \)$. The independent removed row has covariance profile $C = t r + \( 1 - t \) q$ and diagonal $1$. Lemma 18 identifies the derivative limit as

$ - alpha / 2 integral_0^1 \( r - q \) D_C thin upright(d) s + 1 / 2 integral_0^1 \( r - q \) p thin upright(d) s . $

Concavity of $Phi_u$ and (2.6) imply, for $t > 0$,

$ integral_0^1 \( r - q \) \( D_C - D_q \) thin upright(d) s gt.eq 0 . $

The limiting derivative is therefore nonpositive. For fixed bounded-slope $u$, (4.4) is uniformly bounded. Starting from any subsequence realizing the upper limit of the integrated derivative, use the almost-everywhere extraction in Lemma 16, and at each such parameter-time pair use compactness to examine every further array limit. Every resulting derivative limit is nonpositive. Reverse Fatou gives $limsup_N integral_0^1 phi'_N \( t \) thin upright(d) t lt.eq 0$.

After removing the negligible perturbation, the endpoint $t = 0$ separates into $M Phi_u \( q \) + N S_N \( p \)$ by additive-mark factorization. At $t = 1$ the physical sphere partition separates from the cascade compensation, whose expected logarithm is

$ N / 2 integral_0^1 s thin upright(d) \( q p \) \( s \) = N / 2 (p_d - integral_0^1 q p thin upright(d) s) . $

Thus, with $cal(S) = lim_N \( S_N - p_d \/ 2 \)$,

#[#set math.equation(numbering: n => "(4.5)")
 $ limsup_(N arrow.r oo) P_N \( u \) lt.eq cal(P)_u \( q \) := alpha Phi_u \( q \) + cal(S) \( p_q \) + 1 / 2 integral_0^1 q p_q thin upright(d) s . $ <eq:src7>]

Profile continuity extends this to every admissible $q$. The argument uses profile concavity rather than concavity of the terminal itself, so it also proves (4.5) for the small terminal perturbations of Section 3.

=== 4.3 Identification of the empirical cavity fields <identification-of-the-empirical-cavity-fields>

Adding a spin coordinate couples its fresh Gaussian column to the vector of row derivatives. Its conditional covariance between two replicas is therefore a row average, rather than their original spin overlap. The quadratic expansion also produces a scalar shift: the variance of the new columns gives a term $u''$, while normalization of the old projections gives $- g_mu u'$. We identify both quantities before comparing dimensions. In a sphere-only system write $a_mu \( x \) = u' \( g_mu \( x \) \)$ and

$ p_(ell ell')^N = 1 / N sum_(mu lt.eq M_N) a_mu \( x^ell \) a_mu \( x^(ell') \) \, #h(2em) b_N \( x \) = 1 / N sum_(mu lt.eq M_N) #scale(x: 120%, y: 120%)[\[] u'' \( g_mu \( x \) \) - g_mu \( x \) a_mu \( x \) #scale(x: 120%, y: 120%)[\]] . $

The two-row deletion argument below identifies the first quantity as a function of the limiting spin overlap and proves that the second has a deterministic limit under the joint disorder and replica law.

#thm([Lemma 4.4.])[
  (Empirical cavity coefficients).  #emph[Take a subsequence on which the base overlap array converges to profile $q$ and the GG errors for the base, one-row-deleted, and two-row-deleted systems vanish. In every joint array limit, 
#[#set math.equation(numbering: n => "(4.6)")
 $ p_(ell ell') & = alpha D_q \( U_(ell ell') \) \, &  & ell eq.not ell' \,\
p_d & = alpha D_(q \, d) \, #h(2em) b_N \( x^ell \) arrow.r b = - p_d + integral_0^1 q p_q thin upright(d) s . $ <eq:src8>]

 In particular, $bb(E) chevron.l \| b_N \( x^ell \) - b \|^2 chevron.r arrow.r 0$ along this subsequence.]
] <lem:press-empirical>

#proof[
  For a continuous function $F$ of one overlap, remove a specified row and reinsert it using Lemma 18. Row exchangeability gives
  $ lim_N bb(E) chevron.l p_12^N F \( R_12 \) chevron.r = alpha integral_0^1 D_q \( s \) F \( q \( s \) \) thin upright(d) s . $
  On expanding $\( p_12^N \)^2$, the terms with equal row indices have total size $O \( N^(- 1) \)$, since $u'$ is bounded. For the distinct indices, delete both rows and use conditional factorization of their tilted mark families. Hence
  $ lim_N bb(E) chevron.l \( p_12^N \)^2 chevron.r = alpha^2 integral_0^1 D_q \( s \)^2 thin upright(d) s . $
  The function $D_q$ is constant almost everywhere on each plateau of $q$. Thus there is a bounded Borel function $d_q$ such that $D_q \( s \) = d_q \( q \( s \) \)$ almost everywhere. Approximate $d_q$ in $L^2$ of the overlap marginal by continuous functions. The preceding two displays imply that any joint limit $p_12$ satisfies $bb(E) \( p_12 - alpha d_q \( R_12 \) \)^2 = 0$. Exchangeability gives all off-diagonal entries simultaneously.
  The same one-row and two-row calculation for the single-replica mark $a_mu \( x \)^2$ identifies the diagonal limit. With only one sampled replica there is no variable pair genealogy, so its conditional mean is the scalar $D_(q \, d)$. Apply the calculation also to $u'' \( g_mu \) - g_mu u' \( g_mu \)$. This observable has at most linear growth. Its moments after inserting one or two rows are uniformly bounded by reciprocal Jensen, Gaussian exponential moments, and bounded slope; this justifies truncation in the preceding argument and gives a deterministic $L^2$ limit for $b_N$.
  To compute that limit, Gaussian integration by parts in a single row gives
  $ bb(E) chevron.l g_mu u' \( g_mu \) chevron.r = bb(E) chevron.l u'' \( g_mu \) + u' \( g_mu \)^2 chevron.r - bb(E) chevron.l R_12 u' \( g_mu^1 \) u' \( g_mu^2 \) chevron.r . $
  Multiplication by $M_N \/ N$ and the already identified row limits give exactly $b = - p_d + integral q p_q$. All deletions and limits take place at a fixed admissible coefficient vector; there is no mixture-of-profiles step. ◻
]

=== 4.4 The dimension-increment lower bound <the-dimension-increment-lower-bound>

We compare systems of dimensions $N$ and $N + m$, using the block-cavity organization of Aizenman–Sims–Starr [1] Theorem 1(ii), equations (27)–(33) and its spherical implementation by Chen [8] Theorem 2.1. For this row Hamiltonian, the preceding lemma supplies the empirical covariance identification; the expansion below supplies the corresponding insertion and normalization terms. The spherical-shell comparison, nonlinear and fresh-row estimates, and telescoping argument without superadditivity are supplied locally below. Throughout the cavity expansion, $m$ and the shell width $delta$ are fixed while $N arrow.r oo$. The preceding lemma will identify the limiting insertion of these $m$ coordinates. Only after that limit do we let $m arrow.r oo$ to recover the spherical functional, and finally let $delta arrow.b 0$.

===== 4.4.1 Sphere coordinates and the cavity expansion. <sphere-coordinates-and-the-cavity-expansion.>

Let $A_N$ be the expected log partition including the sphere-only perturbation and the coefficient average. Fix a positive integer $m$, put $k = M_(N + m) - M_N = alpha m + O \( 1 \)$, and fix $delta in \( 0 \, 1 \)$. Use coordinates

$ X = (sqrt(frac(N + m - parallel epsilon parallel^2, N)) thin x \, epsilon) \, #h(2em) x in sqrt(N) bb(S)^(N - 1) \, quad epsilon in bb(R)^m \, $

and restrict $epsilon$ to $cal(A)_(m \, delta) = { m \( 1 - delta \) lt.eq parallel epsilon parallel^2 lt.eq m \( 1 + delta \) }$. Write $G_m tilde.op cal(N) \( 0 \, I_m \)$ for a standard Gaussian vector. At fixed $m \, delta$ the marginal surface density of $epsilon$ converges relatively uniformly on this compact shell to standard Gaussian density. The angular law of $x$ is independent uniform surface measure.

The $N + m$ perturbation can be replaced here by the same $N$-spin perturbation used in $A_N$. For any two shell configurations their full overlaps differ from the old overlaps by $O_m \( N^(- 1) \)$. Since $\| r^j - r' ""^j \| lt.eq j \| r - r' \|$ on $\[ - 1 \, 1 \]$, covariance interpolation and $sum w_j^2 j < oo$ bound the change of expected log partition by $O_m \( N^(2 rho - 1) \) = o \( 1 \)$. This includes the change from $s_(N + m)$ to $s_N$.

Let $B_(mu i)$ be the new independent Gaussian columns. For each old row, its new argument is

$ sqrt(1 - frac(parallel epsilon parallel^2, N + m)) thin g_mu \( x \) + frac(B_mu dot.op epsilon, sqrt(N + m)) . $

Taylor expansion of its potential around $g_mu \( x \)$ yields, after summing rows,

#[#set math.equation(numbering: n => "(4.7)")
 $ sum_(i = 1)^m epsilon_i z_i \( x \) + 1 / 2 parallel epsilon parallel^2 b_N \( x \) + T \( x \, epsilon \) + o \( 1 \) \, #h(2em) z_i \( x \) = 1 / sqrt(N) sum_(mu lt.eq M_N) a_mu \( x \) B_(mu i) \, $ <eq:press-cavity-expansion>]

where

$ T \( x \, epsilon \) = frac(1, 2 N) sum_(mu lt.eq M_N) u'' \( g_mu \( x \) \) #scale(x: 120%, y: 120%)[\[] \( B_mu dot.op epsilon \)^2 - parallel epsilon parallel^2 #scale(x: 120%, y: 120%)[\]] . $

Writing $"Rem"_N \( x \, epsilon \)$ for the $o \( 1 \)$ term in (4.7), we have, for fixed $m \, delta$,

$ bb(E) sup_(x in bb(S)_N\
epsilon in cal(A)_(m \, delta)) \| "Rem"_N \( x \, epsilon \) \| arrow.r 0 . $

To check this directly, use $sum_mu g_mu \( x \)^2 lt.eq parallel A parallel_(upright("op"))^2$ and $bb(E) parallel A parallel_(upright("op"))^j = O \( N^(j \/ 2) \)$, together with $bb(E) sum_mu parallel B_mu parallel^j = O_m \( N \)$ for $j lt.eq 3$. For the cubic remainder, write the argument increment as $d_mu = c_N g_mu + B_mu dot.op epsilon \/ sqrt(N + m)$, where $c_N = - parallel epsilon parallel^2 \/ \( 2 N \) + O_m \( N^(- 2) \)$. Then

$ sum_mu \| d_mu \|^3 lt.eq C_m (N^(- 3) parallel A parallel_(upright("op"))^3 + N^(- 3 \/ 2) sum_mu parallel B_mu parallel^3) . $

This uses $\| a + b \|^3 lt.eq 4 \( \| a \|^3 + \| b \|^3 \)$, so no mixed fourth moment is needed. The quadratic mixed term is at most

$ C_m N^(- 3 \/ 2) parallel A parallel_(upright("op")) (sum_mu parallel B_mu parallel^2)^(1 \/ 2) \, $

whose mean is $O_m \( N^(- 1 \/ 2) \)$. The shrinkage-square term is bounded by $C_m N^(- 2) parallel A parallel_(upright("op"))^2 = O_(L^1 \, m) \( N^(- 1) \)$, and denominator replacements use only the first two displayed column moments. These estimates prove the claimed uniform remainder. The operator-norm estimate follows from finite bilinear sphere nets and Gaussian tail bounds. The $k$ fresh rows can similarly be replaced by independent old-dimensional fields $g_a^(upright("new")) \( x \)$: their new-column contribution is $O_m \( N^(- 1 \/ 2) \)$ and their shrinkage error is bounded by $O_m \( N^(- 1) \)$ times a row norm.

===== 4.4.2 The centered quadratic term. <the-centered-quadratic-term.>

For the lower bound we may discard $T$ at expected cost $o \( 1 \)$, although its supremum need not be small. Here is the required estimate. Condition the Gaussian shell measure to be a probability, and let $chevron.l dot.op chevron.r_0$ include it and the old Gibbs measure. Put

$ W \( x \, epsilon \) = epsilon dot.op z \( x \) + 1 / 2 parallel epsilon parallel^2 b_N \( x \) + sum_(a = 1)^k u \( g_a^(upright("new")) \( x \) \) . $

Jensen’s inequality gives

$ log chevron.l e^(W + T) chevron.r_0 - log chevron.l e^W chevron.r_0 gt.eq - chevron.l \| T \| chevron.r_W \, #h(2em) bb(E) chevron.l \| T \| chevron.r_W lt.eq bb(E) chevron.l \| T_1 \| e^(W_1 - W_2) chevron.r_0 . $

The second inequality uses $chevron.l e^W chevron.r_0^(- 1) lt.eq chevron.l e^(- W) chevron.r_0$. Conditional on the old disorder and $\( x \, epsilon \)$, the centered Gaussian squares in $T$ are independent across rows; hence $bb(E) chevron.l T_1^2 chevron.r_0 = O_m \( N^(- 1) \)$. Furthermore $bb(E) chevron.l e^(a \( W_1 - W_2 \)) chevron.r_0$ is bounded for every fixed $a \, m \, delta$. Indeed the Gaussian fields $z_i$ have covariance bounded by $\( M_N \/ N \) parallel u' parallel_oo^2$, fresh row potentials have linear growth, and

$ \| b_N \( x \) \| lt.eq C (1 + frac(parallel A parallel_(upright("op")), sqrt(N))) . $

Cauchy–Schwarz proves the desired $o \( 1 \)$ bound. Here is the lower bound needed later for coefficient averaging. For fixed coefficients put $F_N \( c \) = bb(E) log Z_(N + m) \( c \) - bb(E) log Z_N \( c \)$. All the preceding sphere-density, perturbation, Taylor, and fresh-row errors are $o \( 1 \)$ uniformly in $c$, with $m \, delta$ fixed. Before tilting, $bb(E) chevron.l z_i chevron.r_0 = 0$ and $bb(E) chevron.l T chevron.r_0 = 0$, while the fresh-row potential means are finite constants and $bb(E) chevron.l b_N chevron.r_0 gt.eq - C$. Jensen therefore gives

$ F_N \( c \) gt.eq log bb(P) \( G_m in cal(A)_(m \, delta) \) - C_(m \, delta) - o \( 1 \) \, $

uniformly in $c$. This is a bound on the actual dimension increment, not only on its limiting RPC expression.

===== 4.4.3 The limiting insertion. <the-limiting-insertion.>

At fixed $m$, the row count $k$ has at most two possible values; pass first to a dimension subsequence on which it is constant. Now fix an admissible coefficient vector and extract a base-array limit. Conditionally on the old disorder, the $z_i$ are independent centered Gaussian fields with covariance array $p^N$. Lemma 19 identifies that array and $b_N$, while the fresh rows have covariance array $R$. To handle the unbounded retained observable $b_N$, set $K_N = C \( 1 + parallel A parallel_(upright("op")) \/ sqrt(N) \)$. Clipping $b_N$ to $\[ - L \, L \]$ changes $W$ uniformly in $\( x \, epsilon \)$ by at most $C_m K_N upright(bold(1))_({ K_N > L })$. Thus the expected log integral changes by at most $C_m bb(E) \[ K_N upright(bold(1))_({ K_N > L }) \]$, which tends to zero uniformly in $N$ and $c$. Apply Lemma 4 with this bounded clipping, then let $L arrow.r oo$. Together with the exponential bounds for the Gaussian terms, this passes the logarithmic increment to its RPC limit. The independent fresh-row contributions separate, giving $k Phi_u \( q \)$. If $p$ has a diagonal residual, its independent Gaussian convolution contributes precisely half that variance times $parallel epsilon parallel^2$. Thus the remaining integral is the radial Gaussian version of the spin functional with covariance $p = p_q$ and scalar shift $b$.

On the shell, write $epsilon = r omega$, where $omega in sqrt(m) bb(S)^(m - 1)$ and $r^2 in \[ 1 - delta \, 1 + delta \]$. Let $Z_(upright("sph")) \( r \)$ be the cascade sum of the spherical exponential integrals at radius $r$, including any residual-diagonal factor, and let $Z_(upright("shell"))$ be the corresponding Gaussian shell integral including the scalar shift $b parallel epsilon parallel^2 \/ 2$. For each fixed field realization, $Z_(upright("sph")) \( r \)$ increases with $r gt.eq 0$ by symmetry of $omega$ and nonnegativity of the residual variance. Thus, with $r_(-) = sqrt(1 - delta)$,

$ Z_(upright("shell")) gt.eq bb(P) \( G_m in cal(A)_(m \, delta) \) exp { m b \/ 2 - \| b \| m delta \/ 2 } thin Z_(upright("sph")) \( r_(-) \) . $

The expected logarithm of the last factor is $m S_m \( \( 1 - delta \) p \; \( 1 - delta \) p_d \)$. Covariance interpolation changes it to $m S_m \( p \; p_d \)$ at cost at most $C delta m$, uniformly over bounded profiles $p$. Adding the fresh-row contribution $k Phi_u \( q \)$ and using $\| k - alpha m \| lt.eq 1$ and the uniform bound on $\| Phi_u \( q \) \|$ gives

#[#set math.equation(numbering: n => "(4.8)")
 $ liminf_(N arrow.r oo) \( A_(N + m) - A_N \) & gt.eq inf_q { alpha m Phi_u \( q \) + m S_m \( p_q \) + m b \( q \) \/ 2 }\
 & quad - C \( 1 + delta m \) + log bb(P) \( G_m in cal(A)_(m \, delta) \) \, $ <eq:press-increment-lower>]

with $C$ independent of $m \, delta$. The uniformity follows from boundedness of $p_q$, $b \( q \)$, and $Phi_u \( q \)$. More explicitly, take a subsequence realizing the left lower limit; extract GG errors almost everywhere in the coefficients for the base and both row deletions; then take pointwise array subsequences. Every resulting functional is bounded below by the displayed infimum. The uniform finite lower bound on increments permits Fatou in the coefficients. This establishes (4.8) without requiring a common profile for different coefficient vectors or different dimensions.

===== 4.4.4 From increments to pressure. <from-increments-to-pressure.>

The insertion bound still contains the finite-dimensional spin functional $S_m$. Telescoping the dimension increments and then sending $m$ to infinity will replace it by $cal(S)$, giving the trial functional in the upper bound. To carry this out, for any real sequence $\( A_N \)$ with the present linear bounds, telescoping separately in the $m$ residue classes gives

$ liminf_(N arrow.r oo) A_N / N gt.eq liminf_(N arrow.r oo) frac(A_(N + m) - A_N, m) . $

Indeed, for any number below the right side, every sufficiently late increment is at least $m$ times that number, and summing proves the inequality. Substitute $b = - p_d + integral q p_q$, use the uniform convergence $S_m - p_d \/ 2 arrow.r cal(S)$ of Proposition 6, and divide the error in (4.8) by $m$. For fixed $delta$, $bb(P) \( G_m in cal(A)_(m \, delta) \) arrow.r 1$ as $m arrow.r oo$. Sending first $m arrow.r oo$ and then $delta arrow.b 0$ proves

$ liminf_(N arrow.r oo) P_N \( u \) gt.eq inf_q cal(P)_u \( q \) . $

Together with (4.5), this proves the pressure formula for smooth concave caps.

=== 4.5 Removing the cap and identifying the minimizing profile <removing-the-cap-and-identifying-the-minimizing-profile>

The uniform tail comparison of Section 3 removes the cap. For clarity, the mechanism is row insertion: conditional on a cavity spin, a fresh Gaussian projection is standard normal; insertion with an increasing potential decreases expectations of decreasing nonnegative tail functions. The error between a tangent cap below $- L$ and $u = - beta \( - 1 - z \)_(+)^2 \/ 2$ is bounded by a Gaussian negative-tail quadratic expectation tending to zero with $L$. A bounded terminal perturbation only multiplies this bound by $e^(2 \| d \| parallel psi parallel_oo)$. The same estimate applies to the RPC row functional and to its tilted derivative moments. Consequently $Phi_u$, $D_q$, and $cal(P)_u$ have uniform cap limits on the compact space of monotone profiles, with its $L^1$ topology. We obtain

$ P \( u \) := lim_(N arrow.r oo) P_N \( u \) = min_q cal(P)_u \( q \) . $

Continuity and profile compactness give the stated minimum.

#thm([Proposition 4.5.])[
  (Entropy form of the pressure).  #emph[For Gaussian rows, $u = - beta V$, and $alpha > 0$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ P \( u \) = min_(q : thin q_(*) < 1) { alpha Phi_u \( q \) + E \( q \) } \, #h(2em) q_(*) := "ess sup" q . $ <eq:src9>]

 Every minimizer of $cal(P)_u$ has $q_(*) < 1$ and satisfies the spin inverse relations of Section 2 with $p = p_q$.]
] <prop:press-formula>

#proof[
  Let $q$ minimize $cal(P)_u$. By Proposition 7, $cal(S)$ has at $p_q$ a supergradient $- r \/ 2$, where $r$ is a nonnegative nondecreasing profile bounded strictly below $1$ and $p_q = cal(I) \( r \)$ for the inverse map (2.14). Put $q_t = q + t \( r - q \)$ and $p_t = p_(q_t)$. The supporting inequality for the concave row functional and the supergradient inequality for $cal(S)$ give
  $ alpha #scale(x: 120%, y: 120%)[\[] Phi_u \( q_t \) - Phi_u \( q \) #scale(x: 120%, y: 120%)[\]] & lt.eq - t / 2 integral \( r - q \) p_q \,\
cal(S) \( p_t \) - cal(S) \( p_q \) & lt.eq - 1 / 2 integral r \( p_t - p_q \) . $
  Adding the exact difference of the coupling terms yields
  $ cal(P)_u \( q_t \) - cal(P)_u \( q \) lt.eq - frac(1 - t, 2) integral \( r - q \) \( p_t - p_q \) . $
  By (3.22), for $0 < t < 1$ the integral on the right is at least $c_(alpha \, beta) t parallel r - q parallel_2^2$. Minimality therefore forces $r = q$. In particular $q_(*) < 1$ and $p_q = cal(I) \( q \)$, proving the asserted spin inverse relation for the original profile $p_q$. The equality of this spin supergradient with $- q \/ 2$ means that $p_q$ attains the entropy conjugate:
  $ E \( q \) = cal(S) \( p_q \) + 1 / 2 integral q p_q . $
  For any competing profile $q'$ with $q'_(*) < 1$, the definition of $E$ gives $cal(P)_u \( q' \) lt.eq alpha Phi_u \( q' \) + E \( q' \)$. Equality at the minimizing $q$ proves (4.9). ◻
]

One useful endpoint estimate follows directly from minimality. Let $a_0$ be the root first derivative before the initial Gaussian variance is added, and recall $chi_q \( 0 \) = integral_0^1 \( 1 - q \( s \) \) thin upright(d) s$. Then

#[#set math.equation(numbering: n => "(4.10)")
 $ alpha a_0^2 chi_q \( 0 \) lt.eq frac(1, chi_q \( 0 \)) - 1 . $ <eq:src10>]

Indeed, for $a gt.eq 0$ small, set $q^(\( a \)) = a + \( 1 - a \) q$. Formula (2.21) gives the exact entropy change

$ E \( q^(\( a \)) \) - E \( q \) = 1 / 2 log \( 1 - a \) + frac(a, 2 \( 1 - a \) chi_q \( 0 \)) . $

The row derivative from (2.6) is $- alpha integral \( 1 - q \) D_q \/ 2 lt.eq - alpha a_0^2 chi_q \( 0 \) \/ 2$, because the derivative martingale gives $D_q gt.eq a_0^2$. The nonnegative right derivative of the minimized objective is thus at most half the right side of (4.10) minus half its left side, proving the claim.

=== 4.6 Touching supports for row observables <touching-supports-for-row-observables>

The pressure formula concerns the base quadratic loss. To identify row observables, we also need an upper bound for perturbed terminals that agrees with the base pressure at zero perturbation. No pressure formula for the perturbed model is required.

Fix $psi in C_c^oo \( bb(R) \)$. For $\| d \|$ sufficiently small, Corollary 14 and its regularized proof give profile concavity for $u + d psi$ and all its approximations. The interpolation upper bound applies at any base minimizer $q$. With $p = alpha D_(q \, u + d psi)$, the entropy conjugate bounds $cal(S) \( p \) + integral q p \/ 2 lt.eq E \( q \)$. After removing the cap this gives the upper support inequality

#[#set math.equation(numbering: n => "(4.11)")
 $ limsup_(N arrow.r oo) P_N \( u + d psi \) lt.eq alpha Phi_(u + d psi) \( q \) + E \( q \) . $ <eq:src11>]

The permissible size of $d$ may depend on $beta$ and $psi$, as required for the terminal perturbation argument.

#thm([Corollary 4.6.])[
  (Upper bound for convex loss perturbations).  #emph[Let $psi in C_c^oo \( \( - oo \, 0 \) \)$. There is $w_0 > 0$, independent of $beta$, such that for both signs of $w$ with $\| w \| < w_0$ the loss $L_w \( z \) = V \( z \) + w psi \( 1 + z \)$ is nonnegative, convex, and nonincreasing. For every fixed $beta > 0$ and every fixed profile $q$ with $q_(*) < 1$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ limsup_(N arrow.r oo) P_N \( - beta L_w \) lt.eq alpha Phi_(- beta L_w) \( q \) + E \( q \) . $ <eq:press-convex-loss-upper>]

 More generally this upper bound holds for any nonpositive, concave, nondecreasing terminal of at most quadratic growth which agrees with a negative quadratic hinge outside a compact set.]
] <cor:press-convex-loss-upper>

#proof[
  The support of $psi \( 1 + z \)$ is a compact subset of $z < - 1$, where $V'' = 1$, $V > 0$, and $V' < 0$. Taking $\| w \|$ sufficiently small preserves all three asserted inequalities, including at the boundary of that support. The threshold for $w$ is a property of the loss and does not depend on $beta$. For the fixed concave terminal $- beta L_w$, take tangent caps and concave mollifications. Ordinary concave-terminal profile concavity from Section 3 gives the interpolation upper bound for each such cap. The entropy conjugate bounds its spin terms by $E \( q \)$, so the right side is simply $alpha Phi \( q \) + E \( q \)$ at this fixed trial. Mollification errors vanish uniformly in terminal value for a fixed cap. Beyond the compact perturbation support the cap error is the original negative Gaussian quadratic-tail error, controlled by monotone row insertion both microscopically and in the cascade. Sending the cap to infinity proves the displayed bound. Only pressure and row-functional values are passed to the limit; no derivative-profile uniformity in $w$ and no complete pressure formula for the perturbed loss are required. ◻
]

== 5 Universality at fixed temperature <sec:universality>

Write $nu_epsilon = 1 / 2 cal(N) \( 0 \, 1 - epsilon \) + 1 / 2 cal(N) \( 0 \, 1 + epsilon \)$, and let $P_(N \, epsilon) \( w \)$ denote the pressure when the entries of $A$ have law $nu_epsilon$. Thus $P_(N \, 0) = P_N$. Surface measure on each sphere is normalized to have mass one. We use unit spins $y = x \/ sqrt(N)$ when comparing matrix entries. Fix $0 < B_0 < oo$ and $u \( z \) = - beta / 2 \( - 1 - z \)_(+)^2$.

#thm([Theorem 5.1.])[
  (Pressure and upper supports).  #emph[There is $epsilon_0 \( B_0 \) > 0$, independent of $beta > 0$, with the following property. If $0 < alpha lt.eq B_0$ and $0 lt.eq epsilon < epsilon_0 \( B_0 \)$, then 
$ lim_(N arrow.r oo) P_(N \, epsilon) \( u \) = P \( u \) . $

 If $q$ is any Gaussian minimizer in (4.9) and $psi in C_c^oo \( bb(R) \)$, then, for all sufficiently small $\| d \|$, 
$ limsup_(N arrow.r oo) P_(N \, epsilon) \( u + d psi \) lt.eq alpha Phi_(u + d psi) \( q \; 1 \) + E \( q \) . $

 The allowed size of $d$ can depend on $beta \, psi$ and $B_0$.]
] <thm:univ-pressure>

The principal issue is that a unit spin may place a positive fraction of its squared norm on a few coordinates. Moment matching controls the remaining coordinates, but gives no vanishing error for these large ones. We therefore bound separately the slices on which their values are fixed. A slice with squared norm $t$ in the large coordinates loses spherical entropy. Its rows acquire a random variance change of size at most $epsilon t$. The decisive estimate compares both effects on the same scale, $t \/ chi_q \( 0 \)$, with constants independent of temperature. This permits one choice of $epsilon_0 \( B_0 \)$ before any later zero-temperature limit. After proving the pressure bounds, we use their derivatives in $d$ to identify the empirical row law and the normalized-force observables.

=== 5.1 Concentration, truncation, and replacement <concentration-truncation-and-replacement>

We record the quantitative elementary estimates needed below. Constants in this subsection may depend on a fixed smooth capped potential, on $beta$, and on $B_0$, but are uniform in $N$ and $0 lt.eq epsilon lt.eq 1 \/ 2$. Every entry is subgaussian with variance proxy at most $3 \/ 2$. Applying the exponential Markov inequality to a fixed bilinear form and taking $1 \/ 4$-nets of the two unit spheres gives

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(P) { parallel A parallel_(upright("op")) > K sqrt(N) } lt.eq 2 exp \( C \( M + N \) - c K^2 N \) . $ <eq:univ-opnorm>]

Indeed the nets have at most $9^(M + N)$ pairs, each bilinear form has a subgaussian tail, and their maximum controls the operator norm within an absolute factor. Integrating this estimate also gives every fixed moment bound for $parallel A parallel_(upright("op")) \/ sqrt(N)$.

A mixture entry is a Lipschitz function of a standard Gaussian. To see this, let $T = F_epsilon^(- 1) compose Phi$, where $F_epsilon$ is the mixture CDF and $Phi$ the standard Gaussian CDF, and put $sigma_(+) = sqrt(1 + epsilon)$. For $z gt.eq 0$, $0 lt.eq T \( z \) lt.eq sigma_(+) z$, and the mixture density $f_epsilon$ satisfies

$ f_epsilon \( T \( z \) \) gt.eq frac(1, 2 sigma_(+)) phi.alt \( T \( z \) \/ sigma_(+) \) gt.eq frac(phi.alt \( z \), 2 sigma_(+)) . $

Consequently $T' lt.eq 2 sigma_(+)$; symmetry gives the same bound on the negative half-line. Product Gaussian concentration therefore applies to a Lipschitz function of the entries with only this absolute change in its Lipschitz constant.

For a potential $w$ with bounded first three derivatives and any nonrandom nonzero finite measure $lambda$ supported on unit spins, set

$ L \( A \) = log integral exp { sum_(mu = 1)^M w \( A_mu y \) } thin lambda \( upright(d) y \) . $

The total mass of $lambda$ need not be one. Differentiation gives $parallel nabla_A L parallel_F lt.eq parallel w' parallel_oo sqrt(M)$. If $\| y_i \| lt.eq b_N$ on the integration domain, differentiating three times in $A_(mu i)$ gives

$ partial_(mu i)^3 L =  & chevron.l w''' \( g_mu \) y_i^3 chevron.r + 3 "Cov" #scale(x: 120%, y: 120%)[\(] w'' \( g_mu \) y_i^2 \, w' \( g_mu \) y_i #scale(x: 120%, y: 120%)[\)]\
 & + ⟨#scale(x: 120%, y: 120%)[\(] w' \( g_mu \) y_i - chevron.l w' \( g_mu \) y_i chevron.r #scale(x: 120%, y: 120%)[\)]^3⟩ . $

Its absolute value is at most $C_w b_N^3$. Taylor’s theorem with integral remainder, replacing entries one at a time, thus shows that two entry laws with matching first two moments and uniformly bounded third absolute moments satisfy

#[#set math.equation(numbering: n => "(5.2)")
 $ \| bb(E) L \( A \) - bb(E) L \( tilde(A) \) \| lt.eq C_w M N b_N^3 . $ <eq:univ-replacement>]

This is the smooth-function Lindeberg replacement argument [6] Theorem 1.1. The coordinate bound $b_N$ is what makes its error small; the localization argument below handles spins for which that bound fails. The estimate is unchanged by adding arbitrary, fixed row biases, and also holds conditionally on such biases.

Here and below the hinge can be capped and smoothed as in Section 3. More explicitly, writing $r = \( - 1 - z \)_(+)$, replace $- beta r^2 \/ 2$ for $r > L$ by its tangent $- beta L r + beta L^2 \/ 2$. The difference from $u$ is $beta / 2 \( r - L \)_(+)^2$. Mollification with a symmetric kernel, followed by a constant of size $O \( beta delta^2 \)$, gives a smooth upper approximation with bounded first three derivatives and arbitrarily small smoothing error. The pressure error of the cap tends to zero uniformly in $N$, including on any fixed restricted spin domain. For completeness, insert the rows one at a time. For a fixed row and any cavity measure, weighting by a decreasing function of $r$ decreases the mean of any increasing function of $r$. This is the identity

$ 2 "Cov" \( a \( R \) \, b \( R \) \) = bb(E) \[ \( a \( R \) - a \( R' \) \) \( b \( R \) - b \( R' \) \) \] lt.eq 0 $

for increasing $a$, decreasing $b$, and independent copies $R \, R'$. Interpolate between the cap and the hinge and apply this observation to the cap error. Before row insertion, the fresh projection conditional on the spin is Gaussian with a random variance in $\[ 1 - epsilon \, 1 + epsilon \]$. The expected error is therefore bounded by $beta / 2 sup_(v in \[ 1 \/ 2 \, 3 \/ 2 \]) bb(E) \[ \( - 1 - sqrt(v) Z - L \)_(+)^2 \]$ per row, which tends to zero. Addition of the bounded test $d psi$ changes this bound by at most $e^(2 \| d \| parallel psi parallel_oo)$. For the row functional, interpolate the terminal potentials in the same way. The derivative is the tilted expectation of the cap error. Every interpolating base terminal has nonnegative first derivative, so its tilted diffusion has nonnegative drift; driven by the same Brownian motion, its endpoint is at least the Brownian endpoint. Its residual therefore has no larger upper tail than the fresh Gaussian residual. The same Gaussian tail bound applies, uniformly over profiles and diagonals in $\[ 1 \/ 2 \, 3 \/ 2 \]$. The bounded-terminal-perturbation comparison proved below supplies the factor $e^(2 \| d \| parallel psi parallel_oo)$ for row functionals as well.

Choose once and for all

#[#set math.equation(numbering: n => "(5.3)")
 $ 1 / 3 < a < 1 / 2 \, #h(2em) cal(D)_N = { y in S^(N - 1) : max_i \| y_i \| lt.eq N^(- a) } . $ <eq:univ-a-range>]

For Gaussian disorder, rotation invariance implies that the #emph[disorder-averaged] Gibbs spin is uniform on the sphere. Spherical coordinate tails and a union bound give $bb(E) chevron.l upright(bold(1))_(cal(D)_N^c) chevron.r lt.eq C N exp \( - c N^(1 - 2 a) \)$. In particular the probability that the Gibbs mass of $cal(D)_N$ is below $1 \/ 2$ is exponentially small on this scale. On the complementary event the loss in log partition is at most $log 2$. On the exceptional event, Jensen’s inequality on the restricted surface measure bounds the restricted log partition below by $log sigma_N \( cal(D)_N \) - C_beta \( M + parallel A parallel_(upright("op"))^2 \)$. The full log partition has the same polynomial moment bound. By Cauchy–Schwarz and (5.1), the expected restriction loss is $o \( N \)$. This argument applies to the hinge and to its caps. For a fixed smooth cap, (5.2) costs $O \( N^(2 - 3 a) \) = o \( N \)$ on $cal(D)_N$. Removing the cap afterwards proves

#[#set math.equation(numbering: n => "(5.4)")
 $ liminf_(N arrow.r oo) P_(N \, epsilon) \( u \) gt.eq P \( u \) . $ <eq:univ-lower>]

=== 5.2 Reduction of the upper bound to a localized slice <reduction-of-the-upper-bound-to-a-localized-slice>

Fix a smooth upper cap $w$ of $u + d psi$. For a unit spin define its large-coordinate set $I \( y \) = { i : \| y_i \| > N^(- a) }$. Its cardinality is at most $N^(2 a)$. The number of possible sets is at most $exp \( C N^(2 a) log N \) = exp \( o \( N \) \)$. Fix such a set $I$ of size $k$, write $c = y_I$, $t = parallel c parallel^2$, and set $n = N - k$. Conditional on $c$, the remaining coordinates have the form $sqrt(1 - t) thin z$ with $z in S^(n - 1)$. For $k > 0$ the marginal density of $c$ is

$ a_(N \, k) \( 1 - t \)^(\( n - 2 \) \/ 2) upright(bold(1))_({ t < 1 }) \, #h(2em) a_(N \, k) = frac(Gamma \( N \/ 2 \), pi^(k \/ 2) Gamma \( n \/ 2 \)) . $

Stirling’s formula gives $\| log a_(N \, k) \| = O \( k log N \) = o \( N \)$. For $k = 0$ there is one slice, $c = 0 \, t = 0$.

Fix $eta > 0$. The total contribution of $t > 1 - eta$, after summing over $I$, has normalized log at most $1 / 2 log eta + B_0 sup w + o \( 1 \)$, since ball volumes and density prefactors contribute $o \( N \)$. The lower bound $P \( u \) gt.eq - C beta B_0$ follows from Jensen’s inequality, and the desired upper-support value is at least $P \( u \) - alpha \| d \| parallel psi parallel_oo$. Hence $eta$ can be chosen, at the fixed temperature and test perturbation under consideration, so that this part lies strictly below that value. Dependence of $eta$ on $beta$ will have no bearing on $epsilon_0$.

For $t lt.eq 1 - eta$, the original restriction on the remaining coordinates implies $\| z_i \| lt.eq eta^(- 1 \/ 2) N^(- a)$. Enlarge their integration domain to this fixed restriction, independently of $c$. Cover the $c$-ball by a Euclidean $N^(- 2)$-net, retaining centers with $parallel c parallel^2 lt.eq 1 - eta \/ 2$. Across all $I$ the number of centers is still $exp \( O \( N^(2 a) log N \) \) = exp \( o \( N \) \)$. On $parallel A parallel_(upright("op")) lt.eq K sqrt(N)$, changing a center by $h$ changes the row arguments in Euclidean norm by at most $C_eta K sqrt(N) parallel h parallel$. Cauchy–Schwarz over the rows shows that the log integral changes by at most $C_(w \, eta \, K) N parallel h parallel$. The logarithm of the marginal density changes by at most $C_eta N parallel h parallel$ as well. Both errors are $o \( N \)$ on these nets.

For each center, the restricted log integral is $C_w sqrt(N)$-Lipschitz in the matrix. Gaussian concentration through $T$ and a union bound make this uniform over all centers. Explicitly, put $delta_N = N^(- \( 1 - 2 a \) \/ 4)$. The probability that any centered log integral exceeds $N delta_N$ in absolute value is at most

$ 2 exp { C N^(2 a) log N - c N^(\( 1 + 2 a \) \/ 2) } arrow.r 0 . $

Conditional on the localized columns, replace the remaining entries by Gaussians using (5.2); their coefficients are bounded by $C_eta N^(- a)$, so the error is $o \( N \)$ uniformly over the centers. Average this conditional inequality over the localized columns #emph[before] maximizing over centers. The maximum is therefore over deterministic, fully averaged expected log partitions; no maximum of conditional expectations is taken. Then enlarge the remaining spin domain to the full sphere. Consequently it suffices to bound, for every deterministic sequence of centers, the unrestricted hybrid expected log partition plus $N / 2 log \( 1 - t \)$. There is no compactness assertion uniform in an unspecified growing collection here: if the required bound failed for the maximum, one could choose a maximizing center for each $N$ and apply the following subsequence argument to that deterministic sequence. The passage from probability to expected pressure is legitimate because $N^(- 1) log Z$ is bounded above for these potentials, and its negative part has uniformly bounded moments by Jensen and (5.1).

For each localized row, condition on independent fair signs $s_i$ in the variance-mixture representation. Its bias is Gaussian of variance $t + epsilon D$, where

#[#set math.equation(numbering: n => "(5.5)")
 $ D = sum_(i in I) c_i^2 s_i \, #h(2em) \| D \| lt.eq t . $ <eq:univ-mark>]

These marks and biases are independent from row to row and from the Gaussian remaining columns. Along a subsequence, $t$ converges and the laws of $D$ converge weakly to a probability measure supported on $\[ - t \, t \]$. We use $t \, D$ for these limits. The next calculation is valid for any such law; in particular it does not need a lower bound on the number of large coordinates.

=== 5.3 The marked-row interpolation <the-marked-row-interpolation>

Here we give the extension of the Gaussian upper interpolation from Section 4, including the terms caused by the localized coordinates. For two remaining spins with overlap $R$, put $R_f = t + \( 1 - t \) R$. Conditional on the row mark $D$, the actual row field has covariance $R_f + epsilon D$ and diagonal $v = 1 + epsilon D$. Its common Gaussian variance $t + epsilon D$ is nonnegative. For a finite trial profile $q$ reaching diagonal $1$, use a row trial field of profile $v q$ and diagonal $v$, and put

$ p = alpha bb(E)_D D_(v q) \, #h(2em) p_d = alpha bb(E)_D D_(v q \, d) \, $

where the row derivative profile is calculated with terminal $w$. The spin field must have covariance $N R_f p$. To realize it, write $x = sqrt(n) thin z$ for the remaining spin and take independent cascade fields $z_0^p \, z_1^p \, dots.h \, z_n^p$, each with profile $p$ and diagonal $p_d$. Use

$ sqrt(N t) thin z_0^p \( tau \) + sqrt(frac(N \( 1 - t \), n)) sum_(i = 1)^n x_i z_i^p \( tau \) . $

The first term is common to all remaining spins and supplies covariance $N t p$; the second supplies $N \( 1 - t \) R p$. Add a compensation field with covariance $N q p$. At interpolation time $s in \[ 0 \, 1 \]$, using independent fields conditional on the marks, each row input is $sqrt(s)$ times the actual field plus $sqrt(1 - s)$ times the trial field; the spin and compensation fields enter the exponent with factors $sqrt(1 - s)$ and $sqrt(s)$, respectively, while $H_N^(upright("pert"))$ is unchanged. At finite $N$ one may use the current mark law and $M \/ N$ in this definition; continuity of the finite cascade recursion gives the displayed limits. Since $n \/ N arrow.r 1$, the difference between the $n$-spin and $N$-spin normalizations vanishes.

Here are the fluctuation and deletion details needed to apply the cavity argument of Section 4. All limits in this paragraph are taken at a fixed finite trial grid and a fixed cap. Keep $s$ fixed, and let $Q$ be the covariance of two cascade leaves. Changing one mark from $D$ to $D'$ changes that row’s covariance by

$ Delta C = epsilon \( D' - D \) \[ s + \( 1 - s \) Q \] \, #h(2em) Delta C_(upright("diag")) = epsilon \( D' - D \) . $

The profile $p$ is defined from the deterministic mark law, rather than the realized marks, and is held fixed in this comparison. Gaussian covariance differentiation of the expected log partition, conditional on all marks, gives the change-rate bound

$ frac(epsilon \| D' - D \|, 2) #scale(x: 120%, y: 120%)[\(] parallel w'' parallel_oo + 2 parallel w' parallel_oo^2 #scale(x: 120%, y: 120%)[\)] . $

Indeed its two terms are the diagonal expectation of $w'' + \( w' \)^2$ and the off-diagonal expectation of $\[ s + \( 1 - s \) Q \] w'_1 w'_2$; the latter coefficient lies in $\[ 0 \, 1 \]$. The bound is $O \( 1 \)$ uniformly in the other marks, $N$, and $s$. Conditional on the marks, the independent row fields give a Gaussian Lipschitz constant at most $parallel w' parallel_oo sqrt(3 M \/ 2)$; spin and compensation fields add $O \( sqrt(N) \)$ and the perturbation adds $O \( s_N \)$. The finite-cascade log-mass estimate from Section 4 handles the weight randomness. Bounded differences for the marks therefore imply an unconditional expected fluctuation of $O \( sqrt(N) + s_N \)$, also after any fixed number of row deletions.

Apply the GG argument after averaging the marks as well as the Gaussian disorder. There is no assertion of GG for every quenched mark vector. Deleting row $1$ removes its row field and mark but leaves the deterministic $p$, the spin and compensation fields, and the perturbation fixed. Thus at each $N$ the joint law of the removed mark and deleted-row replica array is exactly $rho_N ⊗ upright("Law") \( upright("deleted-row array") \)$. At fixed almost-everywhere perturbation parameters and interpolation time, take deterministic subsequences of these distributions. Every limit retains this product structure. The independent mark may therefore be adjoined to the limiting cavity array and integrated after Gaussian row reinsertion. This argument does not select a subsequence depending on the realized removed mark. Bounded derivatives at the fixed cap justify the extra integration by dominated convergence. The positivity and comonotone-profile conclusions of the Gaussian cavity argument now apply. Finite-grid limits are taken before profile approximation, so no concentration bound uniform in cascade depth is required.

To make the cancellation explicit, let $Q$ denote the overlap of two cascade leaves, and let $a_mu^ell$ be $w'$ evaluated at the interpolating field of row $mu$ in replica $ell$. Gaussian integration by parts gives the following exact derivative of the normalized expected log partition at fixed perturbation coefficients (with $bb(E)$ averaging the row marks, Gaussian fields, and cascade weights):

$ - frac(M, 2 N) bb(E) ⟨\[ \( R_f - Q \) + epsilon D_1 \( 1 - Q \) \] a_1^1 a_1^2⟩ + 1 / 2 bb(E) chevron.l \( R_f - Q \) p \( Q \) chevron.r . $

Here $p \( Q \)$ means the value of the spin covariance at the same cascade rank; repeated covariance levels can be refined without changing the fields. The diagonal differences are zero in both terms.

Let $r$ be the limiting remaining-spin cavity profile. It is nonnegative and comonotone with the prescribed cascade profile $q$. Thus $r_f = t + \( 1 - t \) r$ satisfies $r_f + epsilon D gt.eq \( 1 - epsilon \) t gt.eq 0$. The interpolating conditional profile is $C_D \( s \) = s \( r_f + epsilon D \) + \( 1 - s \) v q$, with fixed diagonal $v$. Row concavity, with the small perturbation allowed by Section 3, bounds the row derivative by

$ - alpha / 2 integral_0^1 bb(E)_D #scale(x: 120%, y: 120%)[\[] \( \( r_f - q \) + epsilon D \( 1 - q \) \) D_(v q) #scale(x: 120%, y: 120%)[\]] thin upright(d) a . $

The spin and compensation derivatives cancel exactly the term $- 1 / 2 integral \( r_f - q \) p$. The remaining upper bound is $- frac(alpha epsilon, 2) integral \( 1 - q \) bb(E)_D \[ D D_(v q) \]$. As in the Gaussian proof, this pointwise subsequential derivative bound integrates by Fatou after the perturbation parameters are averaged; the fixed-cap derivatives are bounded, and the perturbation contributes $o \( N \)$.

At the trial endpoint the row contribution is $alpha bb(E)_D Phi_w \( v q \; v \)$. The common spin field contributes $t \( p_d - integral p \) \/ 2$. The remaining-spin field contributes, at finite $N$, $\( n \/ N \) S_n \( \( N \/ n \) \( 1 - t \) p \)$; by uniform convergence on bounded profiles, this converges to $cal(S) \( \( 1 - t \) p \) + \( 1 - t \) p_d \/ 2$. The second term restores the diagonal contribution removed in the definition of $cal(S)$. Compensation subtracts $\( p_d - integral q p \) \/ 2$. Using $\| D \| lt.eq t$, $D_(v q) gt.eq 0$ and the definition of $p$, the sum of these terms, the residual derivative bound, and the slice density is at most

#[#set math.equation(numbering: n => "(5.6)")
 $ alpha bb(E)_D Phi_w \( v q \; v \) + 1 / 2 log \( 1 - t \) + cal(S) \( \( 1 - t \) p \) + 1 / 2 integral_0^1 \( q_e - t \) p \, #h(2em) q_e = epsilon t + \( 1 - epsilon t \) q . $ <eq:univ-slice-bound>]

In this cancellation the restored diagonal term $\( 1 - t \) p_d \/ 2$ combines with the common-field contribution and the compensation, leaving no diagonal term. This also checks the normalization of the common field.

We now fix $q$ to be a Gaussian base minimizer, so that $q_(*) < 1$. This includes every minimizer of (4.9): the conjugate bound gives $cal(P)_u \( q \) lt.eq alpha Phi_u \( q \) + E \( q \) = P \( u \)$, whereas the pressure formula gives $cal(P)_u \( q \) gt.eq P \( u \)$. Thus such a $q$ is also a minimizer of $cal(P)_u$ and inherits its root estimates. At a fixed cap first pass from finite trial profiles to this $q$ by profile continuity. Since $p gt.eq 0$, clipping $\( q_e - t \) \/ \( 1 - t \)$ below at zero only increases its pairing with $p$. The spin conjugate (2.21) therefore bounds the non-row terms by

#[#set math.equation(numbering: n => "(5.7)")
 $ & 1 / 2 log \( 1 - t \) + E (max {0 \, frac(q_e - t, 1 - t)})\
 & #h(2em) = E \( q_e \) - 1 / 2 integral_0^t frac(upright(d) z, chi_(q_e) \( z \))\
 & #h(2em) lt.eq E \( q \) + 1 / 2 log \( 1 - epsilon t \) - frac(\( 1 - epsilon \) t, 2 \( 1 - epsilon t \) chi_q \( 0 \)) . $ <eq:src12>]

Here is a direct check, including clipping. If $hat(q) = \( q_e - t \)_(+) \/ \( 1 - t \)$, then for $z gt.eq 0$

$ m_(hat(q)) \( z \) = m_(q_e) \( t + \( 1 - t \) z \) \, #h(2em) chi_(hat(q)) \( z \) = frac(chi_(q_e) \( t + \( 1 - t \) z \), 1 - t) . $

Substitution into (2.21) proves the equality. When $t$ exceeds the essential supremum of $q_e$, use $chi_(q_e) \( z \) = 1 - z$ above that supremum; the same equality reduces to $E \( hat(q) \) = E \( 0 \) = 0$. For $b = epsilon t$, the affine change $q_e = b + \( 1 - b \) q$ gives

$ E \( q_e \) = E \( q \) + 1 / 2 log \( 1 - b \) + frac(b, 2 \( 1 - b \) chi_q \( 0 \)) \, #h(2em) chi_(q_e) \( 0 \) = \( 1 - b \) chi_q \( 0 \) . $

Since $chi_(q_e)$ is nonincreasing, $integral_0^t upright(d) z \/ chi_(q_e) \( z \) gt.eq t \/ chi_(q_e) \( 0 \)$, proving the inequality. Crucially, the resulting estimate contains no $p$. We can now remove the cap, using its uniform row-functional error over $v in \[ 1 \/ 2 \, 3 \/ 2 \]$.

=== 5.4 A variance estimate uniform in temperature <a-variance-estimate-uniform-in-temperature>

The entropy estimate (5.7) gives a loss of at least $t \/ \( 4 chi_q \( 0 \) \)$ when $epsilon lt.eq 1 \/ 2$. We now bound the possible row gain by $C \( B_0 \) epsilon t \/ chi_q \( 0 \)$ with no temperature dependence in $C \( B_0 \)$. The needed residual estimate is a property of the single-row diffusion.

#thm([Lemma 5.2.])[
  (Residual moments under a decrease of variance).  #emph[Let $q$ be a nonnegative nondecreasing profile with diagonal $1$, and let $u \( z \) = - beta \( - 1 - z \)_(+)^2 \/ 2$, $beta > 0$. Put $a_0 = f_z \( 0 \, 0 \)$ for its row solution before the root Gaussian variance. Write $bb(E)_(u \, v)$ for expectation under the tilted endpoint law for profile $v q$ and diagonal $v$. For $1 \/ 2 lt.eq v lt.eq 1$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ sqrt(v) thin beta bb(E)_(u \, v) \( - 1 - g \)_(+) lt.eq a_0 \, #h(2em) bb(E)_(u \, v) \( - 1 - g \)_(+)^2 lt.eq sqrt(pi \/ 2) thin bb(E)_(u \, v) \( - 1 - g \)_(+) . $ <eq:src13>]

]
] <lem:univ-residual-variance>

#proof[
  For the first inequality put the variance scale into the terminal, so the Gaussian variance profile is $q$ on the fixed time interval $\[ 0 \, 1 \]$. Let $A_v$ and $A_1$ be the derivative solutions for the terminals $u \( sqrt(v) z \)$ and $u \( z \)$, respectively. Their difference $H = A_v - A_1$ satisfies
  $ H_t + 1 / 2 H_(z z) + m_q A_v H_z + m_q \( A_1 \)_z H = 0 \, #h(2em) H \( 1 \, z \) = sqrt(v) thin beta \( - 1 - sqrt(v) z \)_(+) - beta \( - 1 - z \)_(+) lt.eq 0 . $
  The zeroth-order coefficient lies in $\[ - beta \, 0 \]$, and the drift is Lipschitz with at most linear growth. The maximum principle gives $H lt.eq 0$. To handle the hinge, convolve the two terminal derivative functions with the same nonnegative mollifier, preserving their order, and pass to the limit. When $q \( 0 \) > 0$, $m_q = 0$ before that root variance, so the same comparison includes the initial heat interval. The derivative martingale at $\( 0 \, 0 \)$ identifies $A_v \( 0 \, 0 \)$ with the expectation on the left of (5.8).
  For the second inequality use variance time, writing the tilted diffusion as
  $ upright(d) Z_s = upright(d) B_s + m \( s \) a \( s \, Z_s \) thin upright(d) s \, #h(2em) Z_0 = 0 \, #h(2em) 0 lt.eq s lt.eq v . $
  The base derivative $a = f_z$ is nonnegative, nonincreasing, and convex in position. Nonnegativity and monotonicity follow from the terminal and parabolic comparison. Convexity follows by differentiating once more: $c = f_(z z z)$ has nonnegative terminal value (a positive measure for the hinge) and solves the linear equation $\( partial_s + 1 / 2 partial_(z z) + m a partial_z \) c = - 3 m f_(z z) c$. Smooth concave approximations with convex first derivative and no far cap justify the claim; their diffusion limits give the hinge. Thus the drift is nonnegative, nonincreasing, and convex.
  Condition on the Brownian bridge $omega_s = B_s - \( s \/ v \) B_v$ and write $b = B_v tilde.op cal(N) \( 0 \, v \)$, independent of the bridge. The endpoint map $T_omega \( b \) = Z_v$ is increasing, convex, and $1$-Lipschitz. Indeed its first variation $J_s$ solves $J'_s = 1 \/ v + d_z \( s \, Z_s \) J_s$, $J_0 = 0$, for $d = m a$; hence $0 lt.eq J_s lt.eq s \/ v$ and, more precisely,
  $ T'_omega \( b \) = 1 / v integral_0^v exp {integral_r^v d_z \( s \, Z_s \) thin upright(d) s} upright(d) r gt.eq frac(1 - e^(- beta v), beta v) > 0 . $
  Its second variation solves $K'_s = d_z K_s + d_(z z) J_s^2$, $K_0 = 0$, and is nonnegative. These deterministic integral-equation variations remain valid for every continuous bridge path by smooth approximation. Also $T_omega \( b \) gt.eq b$ by nonnegative drift. The strictly positive lower slope bound makes $T_omega$ onto, so it has a unique crossing $b_0 lt.eq - 1$ of $- 1$. Set $R \( s \) = - 1 - T_omega \( b_0 - s \)$, $s gt.eq 0$. Then $R$ is increasing and concave, $R \( 0 \) = 0$, and $0 lt.eq R \( s \) lt.eq s$. Consequently $R \( s \) \/ s$ is nonincreasing. Under the Gaussian left-tail measure with density proportional to $exp \( - \( b_0 - s \)^2 \/ \( 2 v \) \) upright(bold(1))_(s gt.eq 0)$, decreasing-likelihood-ratio comparison gives
  $ frac(bb(E) \[ R \( s \)^2 \], bb(E) \[ R \( s \) \]) lt.eq frac(bb(E) \[ s R \( s \) \], bb(E) \[ R \( s \) \]) lt.eq frac(bb(E) \[ s^2 \], bb(E) \[ s \]) lt.eq sqrt(pi \/ 2) . $
  The middle inequality follows from the same covariance identity used above, now relative to the probability density proportional to $s exp \( - \( b_0 - s \)^2 \/ \( 2 v \) \)$. Relative to the density proportional to $s e^(- s^2 \/ 2)$, the logarithmic derivative of its likelihood ratio is $b_0 \/ v - \( 1 \/ v - 1 \) s lt.eq 0$. The last ratio is therefore at most $integral_0^oo s^2 e^(- s^2 \/ 2) upright(d) s \/ integral_0^oo s e^(- s^2 \/ 2) upright(d) s = sqrt(pi \/ 2)$. Multiply by the conditional first moment and integrate over the bridge to obtain the second assertion of (5.8). The lower slope bound is used only for the crossing and approximation; its dependence on $beta$ does not enter the moment constant. Mollified drifts retain all three shape properties and the common Lipschitz bound $beta$. Approximate a general monotone $m$ by steps in $L^1$; the linear PDE difference equation and uniform diffusion moments give local convergence of solutions, and the flow maps converge on compact endpoint sets. Finally $\( - 1 - Z_v \)_(+) lt.eq \( - 1 - B_v \)_(+)$ supplies uniform integrability for all residual moments. These observations justify the hinge and coefficient limits in the bridge argument. ◻
]

===== 5.4.1 Bounded terminal tests. <bounded-terminal-tests.>

A bounded terminal perturbation changes a tilted endpoint expectation of a nonnegative observable by at most the factor $e^(2 \| d \| parallel psi parallel_oo)$. On the same realized cascade and Gaussian field, the normalized Gibbs measure with terminal $u + d psi$ has density

$ frac(e^(d psi \( g \)), chevron.l e^(d psi \( g \)) chevron.r_u) in \[ e^(- 2 \| d \| parallel psi parallel_oo) \, e^(2 \| d \| parallel psi parallel_oo) \] $

relative to the measure with terminal $u$. Average this pointwise bound over the cascade and field. The endpoint expectation here is precisely the PDE tilted expectation: for a bounded continuous terminal direction $h$, differentiating $Phi_(u + lambda h)$ at zero gives $bb(E) chevron.l h \( g \) chevron.r_u$ directly, while differentiating the recursion gives the following linear equation, now denoting the fixed diagonal by $Q$:

$ J_t + 1 / 2 J_(z z) + m f_z J_z = 0 \, #h(2em) J \( Q \, z \) = h \( z \) . $

Its diffusion representation identifies the same expectation with the tilted endpoint law. The initial $m = 0$ heat interval includes common root variance. For residual diagonal variance, augment the base measure at each leaf by the residual Gaussian variable and integrate it inside that leaf weight. Each replica draws a fresh residual variable, even when leaf labels coincide, so this convention adds no off-diagonal variance. The terminal $m = 1$ interval is exactly this convolution. Profile approximation preserves the equality for bounded tests and the likelihood-ratio bound; monotone truncation extends the latter to nonnegative observables. In particular there is no factor depending on cascade depth.

===== 5.4.2 Comparison with the entropy loss. <comparison-with-the-entropy-loss.>

Put $w = u + d psi$ after removing the cap. Differentiating the variance scale in the terminal gives

$ partial_v Phi_w \( v q \; v \) = frac(1, 2 v) bb(E)_(w \, v) \[ g w' \( g \) \] . $

This identity follows first by differentiating the finite cascade recursion and then by the uniform quadratic moment bounds. If $r = \( - 1 - g \)_(+)$, then $g u' \( g \) = - beta \( r^2 + r \)$. For $v gt.eq 1$ this part of the derivative is nonpositive. For $1 \/ 2 lt.eq v lt.eq 1$, the preceding perturbation bound and (5.8) show that its absolute value is at most $C_0 a_0$, provided $\| d \| parallel psi parallel_oo lt.eq 1$, where $C_0 = e^2 sqrt(2) \( 1 + sqrt(pi \/ 2) \)$. The test part is bounded by $\| d \| sup_z \| z psi' \( z \) \| \/ \( 2 v \)$. Impose also $\| d \| sup_z \| z psi' \( z \) \| lt.eq 1$. Since $\| v - 1 \| lt.eq epsilon t$,

$ alpha #scale(x: 120%, y: 120%)[\(] Phi_w \( v q \; v \) - Phi_w \( q \; 1 \) #scale(x: 120%, y: 120%)[\)] lt.eq epsilon t \( C_0 alpha a_0 + alpha \) lt.eq frac(\( C_0 sqrt(B_0) + B_0 \) epsilon t, chi_q \( 0 \)) . $

The final inequality uses (4.10), which implies $alpha a_0 lt.eq sqrt(alpha) \/ chi_q \( 0 \)$, and $chi_q \( 0 \) lt.eq 1$. The constant $C_0$ is absolute: the dependence on $beta$ has disappeared. For $epsilon lt.eq 1 \/ 2$ the negative last term in (5.7) has magnitude at least $t \/ \( 4 chi_q \( 0 \) \)$, and its logarithmic term is nonpositive. Choose, for example, any

$ 0 < epsilon_0 \( B_0 \) < min {1 / 2 \, frac(1, 8 \( C_0 sqrt(B_0) + B_0 \))} . $

The entropy loss then dominates the row improvement in every slice. To specify the quantifiers, choose this $epsilon_0 \( B_0 \)$ before choosing $beta$, a minimizer, a test perturbation, or a cap. For each fixed $beta$ and $psi$, Proposition 13 and Corollary 14 allow both signs of $d$ with

$ \| d \| lt.eq min {d_(upright("stab")) \( beta \, psi \) \, frac(1, 1 + parallel psi parallel_oo) \, frac(1, 1 + sup_z \| z psi' \( z \) \|)} . $

The stability radius is uniform in the trial profile, the diagonal in $\[ 1 \/ 2 \, 2 \]$, and the cap and mollifier. The thermodynamic limit is taken at each fixed cap and finite trial grid; profile approximation follows, then removal of mollification at fixed cap, and finally removal of the cap. The entropy factor $1 \/ chi_q \( 0 \)$ may depend on $beta$ but appears on both sides of the comparison and cancels. No convergence rate uniform in $beta$ is required. The same fixed mixture law therefore remains valid throughout the later ordered limits. Equations (5.6)–(5.8) prove the upper support in Theorem 22. Combined with (5.4) at $d = 0$, they prove its pressure assertion.

=== 5.5 The inner thermodynamic observables <the-inner-thermodynamic-observables>

Let $mu_(beta \, alpha)$ be the Gaussian tilted endpoint law associated with a minimizer $q$. The following argument proves, in particular, that this law does not depend on the choice of minimizer. Define the random empirical projection measure

$ L_N = 1 / M sum_(mu = 1)^M delta_(A_mu y) . $

Convergence in probability below refers to the joint law of disorder and one Gibbs sample.

#thm([Proposition 5.3.])[
  (Empirical row law and force normalization).  #emph[For either the Gaussian law or any mixture in Theorem 22, at fixed $beta > 0$ and $0 < alpha lt.eq B_0$, $L_N$ converges weakly in probability to $mu_(beta \, alpha)$. This measure is atomless, assigns positive mass to $\( - oo \, - 1 \)$, and has finite moments of its negative part. The gap and normalized-force observables in the problem have inner $N arrow.r oo$ limits at every fixed argument, and those limits agree for all these entry laws.]
] <prop:univ-observables>

#proof[
  First, the normalized random log partition concentrates for the uncapped potentials $u + d psi$. On the convex operator-norm ball $parallel A parallel_(upright("op")) lt.eq K sqrt(N)$, differentiation gives
  $ parallel nabla_A log Z parallel_F lt.eq beta \( parallel A parallel_(upright("op")) + sqrt(M) \) + \| d \| parallel psi' parallel_oo sqrt(M) = O \( sqrt(N) \) . $
  Extend its restriction from this ball with the same Lipschitz constant and use Gaussian concentration, through $T$ for mixture entries. The complement has probability exponentially small in $N$ for a large fixed $K$, by (5.1). Jensen’s lower bound $log Z gt.eq - C_beta \( M + parallel A parallel_(upright("op"))^2 \) - M \| d \| parallel psi parallel_oo$ and the corresponding upper bound show that the extension changes its expectation by $o \( N \)$. Hence $N^(- 1) log Z - P_(N \, epsilon) \( u + d psi \)$ converges to zero in probability.
  For a fixed test $psi$, put $S \( d \) = alpha Phi_(u + d psi) \( q \; 1 \) + E \( q \)$. Theorem 22 gives $S \( 0 \) = P \( u \)$ and $S' \( 0 \) = alpha integral psi thin upright(d) mu_(beta \, alpha)$. If $b > S' \( 0 \)$, choose a sufficiently small $d > 0$ and $c > 0$ such that $S \( d \) - S \( 0 \) < d b - 2 c$. The expected upper support and base pressure limit, together with the preceding concentration, imply with disorder probability tending to one that
  $ log Z \( u + d psi \) - log Z \( u \) lt.eq N \( d b - c \) . $
  This uses only a limsup bound at $d$; a thermodynamic pressure limit for the perturbed terminal has not been assumed. Exponential Markov under the Gibbs measure gives
  $ ⟨upright(bold(1))_({ N^(- 1) sum_mu psi \( g_mu \) gt.eq b })⟩ lt.eq exp { log Z \( u + d psi \) - log Z \( u \) - N d b } . $
  On that event the right side is at most $e^(- N c)$. The same argument with $d < 0$ gives the lower bound. Therefore $integral psi thin upright(d) L_N arrow.r integral psi thin upright(d) mu_(beta \, alpha)$ in joint probability for every $psi in C_c^oo$. A countable determining class, together with tightness obtained by smooth cutoffs whose $mu_(beta \, alpha)$-masses tend to one, proves weak convergence. The same limits for every base minimizer prove their equality of row marginals.
  Here are direct bounds ensuring that threshold tests and normalization are permitted. Remove one row and let $chevron.l dot.op chevron.r_0$ be its cavity measure. Its reweighting denominator is $D = chevron.l e^(u \( g \)) chevron.r_0 lt.eq 1$, and Jensen gives $D gt.eq exp chevron.l u \( g \) chevron.r_0$. Since the row is independent of this measure, $bb(E) \[ - chevron.l u \( g \) chevron.r_0 \] lt.eq C_beta$. Thus $bb(P) \( D < e^(- K) \) lt.eq C_beta \/ K$. For an interval $J$, conditional on a unit cavity spin the fresh projection has density bounded by an absolute constant, and $e^u lt.eq 1$. Consequently its reweighted marginal satisfies
  $ bb(E) chevron.l upright(bold(1))_({ g in J }) chevron.r lt.eq C e^K \| J \| + C_beta \/ K . $
  This estimate is uniform in $N$ and passes to the deterministic limiting law by continuous tests. Sending $\| J \| arrow.b 0$ and then $K arrow.r oo$ proves that the law has no atoms. Conversely, for a fixed nonempty interval $J subset.double \( - oo \, - 1 \)$, $D lt.eq 1$ gives
  $ bb(E) chevron.l upright(bold(1))_({ g in J }) chevron.r gt.eq inf_(g in J) e^(u \( g \)) inf_(v in \[ 1 \/ 2 \, 3 \/ 2 \]) bb(P) \( sqrt(v) Z in J \) > 0 . $
  Hence its limiting negative-gap probability is positive. Finally the single-row covariance inequality used above gives, for every fixed $p > 0$,
  $ bb(E) chevron.l \( - 1 - g \)_(+)^p chevron.r lt.eq sup_(v in \[ 1 \/ 2 \, 3 \/ 2 \]) bb(E) \( - 1 - sqrt(v) Z \)_(+)^p < oo . $
  Using an exponent larger than $p$ gives uniform integrability, including for empirical averages.
  Set
  $ p_(-) = mu_(beta \, alpha) \( \( - oo \, - 1 \) \) \, #h(2em) m_(-) = integral \( - 1 - g \)_(+) thin mu_(beta \, alpha) \( upright(d) g \) \, #h(2em) macron(r) = m_(-) \/ p_(-) . $
  Both $p_(-)$ and $m_(-)$ are strictly positive. Weak convergence, atomlessness, and uniform integrability imply in joint probability
  $ frac(\| C \( y \) \|, M) arrow.r p_(-) \, #h(2em) 1 / M sum_(mu in C \( y \)) \( - 1 - g_mu \) arrow.r m_(-) . $
  For the second assertion, the second-moment bound gives $bb(E) integral r upright(bold(1))_({ r > K }) thin upright(d) L_N lt.eq C \/ K$, where $r = \( - 1 - g \)_(+)$. Markov’s inequality makes this truncation error small in joint probability. The bounded continuous truncated residual converges by weak convergence, and then $K arrow.r oo$ gives the assertion. Thus the configuration-dependent conditional mean residual converges to $macron(r)$. For every $s > 0$, sandwich its random threshold between $s \( macron(r) - delta \)$ and $s \( macron(r) + delta \)$, apply weak convergence to these fixed thresholds, and send $delta arrow.b 0$. Atomlessness at $g = - 1 - s macron(r)$ justifies the last step. Since the observables lie in $\[ 0 \, 1 \]$, convergence in probability also gives convergence of their expectations. Explicitly,
  $ lim_(N arrow.r oo) G_(N \, beta \, alpha) \( delta \, u_(+) \) & = mu_(beta \, alpha) \( \( delta - 1 \, u_(+) - 1 \] \) \, #h(2em) 0 < delta < u_(+) \,\
lim_(N arrow.r oo) F_(N \, beta \, alpha) \( s \) & = frac(mu_(beta \, alpha) \( { - 1 - s macron(r) lt.eq g < - 1 } \), p_(-)) . $
  The convention when $C \( y \)$ is empty is immaterial, since its probability tends to zero. These formulas prove the proposition with exactly the force normalization specified in the problem. ◻
]

== 6 Ground energy and the sharp satisfiability threshold <sec:threshold>

This section separates an energetic issue from a geometric one. The pressure formula determines when the minimum energy is subextensive. A uniform repair lemma then turns subextensive energy into exact satisfiability after deleting a fixed fraction of the constraints. There are two geometric obstacles. Solving for the violated rows can create violations in other rows, so the repair enlarges the set of rows whose projections it controls. The repaired vector may then have norm less than one, so a second displacement restores its norm without spoiling those controlled projections. The negative margin permits radial contraction when the repaired vector instead has norm at least one.

Write $A in bb(R)^(M times N)$ for the pattern matrix, and use unit-spin coordinates $y = x \/ sqrt(N)$. Set

$ r_A \( y \) = \( - upright(bold(1)) - A y \)_(+) \, #h(2em) H_A \( y \) = 1 / 2 parallel r_A \( y \) parallel_2^2 \, #h(2em) R \( A \) = min_(parallel y parallel_2 = 1) parallel r_A \( y \) parallel_2 . $

All vector norms without a subscript are Euclidean, and $parallel A parallel$ denotes the operator norm between Euclidean spaces. Let $P_(N \, alpha)^nu \( beta \) = N^(- 1) bb(E) log integral e^(- beta H_A \( y \)) thin upright(d) sigma \( y \)$, where $M = floor.l alpha N floor.r$, $sigma$ is normalized surface measure on the unit sphere, and $nu$ is the entry law. We use $nu_0 = cal(N) \( 0 \, 1 \)$ and the variance mixtures $nu_epsilon$ from the introduction. The pressure and universality results of Sections 4 and 5 are the only input from the variational analysis: the Gaussian pressure has a limit at every fixed $\( alpha \, beta \)$; for every finite $B_0$, the same limit holds for $0 lt.eq epsilon < epsilon_0 \( B_0 \)$ and $0 < alpha lt.eq B_0$.

We will repeatedly use a uniform matrix-norm estimate. For $epsilon lt.eq 1 \/ 2$, an entry satisfies $bb(E) e^(t A_(mu i)) lt.eq e^(3 t^2 \/ 4)$. Independence gives the same bound for $v^(sans(T)) A y$ when $parallel v parallel = parallel y parallel = 1$. Nets of radius $1 \/ 4$ on the two spheres have at most $9^(M + N)$ pairs, and approximating both arguments gives $parallel A parallel lt.eq 2 max \| v^(sans(T)) A y \|$ on these nets. Thus

#[#set math.equation(numbering: n => "(6.1)")
 $ bb(P) \( parallel A parallel > 2 t \) lt.eq 2 thin 9^(M + N) e^(- t^2 \/ 3) \, #h(2em) t > 0 . $ <thresh:eq:operator-tail>]

In particular $bb(E) parallel A parallel^2 lt.eq C \( M + N \)$, and sufficiently large constant multiples of $sqrt(M) + sqrt(N)$ bound $parallel A parallel$ with exponential error. The case $M = 0$ is immediate.

=== 6.1 The ground-energy limit <the-ground-energy-limit>

#thm([Lemma 6.1.])[
  (Uniform approximation by the pressure).  #emph[For every finite $B_0$ there is a constant $C = C \( B_0 \)$ such that, for $N gt.eq 2$, $0 lt.eq M lt.eq B_0 N$, $0 lt.eq epsilon lt.eq 1 \/ 2$, $beta > 0$, and $0 < delta < 1 \/ 2$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ 0 lt.eq - frac(P_(N \, alpha)^(nu_epsilon) \( beta \), beta) - 1 / N bb(E) min_(parallel y parallel = 1) H_A \( y \) lt.eq C delta + 1 / beta log C / delta . $ <thresh:eq:pressure-energy>]

 Consequently the Gaussian limit 
$ e \( alpha \) = lim_(N arrow.r oo) 1 / N bb(E) min_(parallel y parallel = 1) H_A \( y \) = lim_(beta arrow.r oo) - frac(P_alpha^(nu_0) \( beta \), beta) $

 exists. On every range where the fixed-temperature pressures agree, the mixture ground-energy limit also exists and equals $e \( alpha \)$. Moreover, $e$ is nondecreasing and $1$-Lipschitz, and $e \( alpha \) = 0$ for $0 lt.eq alpha lt.eq 1$.]
] <thresh:pressure-energy>

#proof[
  The positive-part map is $1$-Lipschitz, so for unit $y \, y'$,
  $ parallel r_A \( y \) - r_A \( y' \) parallel lt.eq parallel A parallel thin parallel y - y' parallel \, #h(2em) parallel r_A \( y \) parallel lt.eq sqrt(M) + parallel A parallel . $
  It follows that $H_A$ has Lipschitz constant at most $L_A = parallel A parallel \( sqrt(M) + parallel A parallel \)$ on the sphere. A spherical cap of Euclidean radius $delta$ about a minimizer has surface probability at least $\( c delta \)^N$, for an absolute $c > 0$. For completeness, rotate its center to the last coordinate vector and parametrize the upper hemisphere by $z mapsto \( z \, sqrt(1 - parallel z parallel^2) \)$. The ball $parallel z parallel lt.eq delta \/ 2$ maps inside the cap, and its surface Jacobian is at least one. The ratio of the $\( N - 1 \)$-ball volume to the $\( N - 1 \)$-sphere area is bounded below by $c_1^N$, as follows directly from their gamma-function formulas; this proves the stated bound. Integrating over this cap and also using $H_A gt.eq min H_A$ gives the deterministic estimate
  $ 0 lt.eq - frac(1, beta N) log integral e^(- beta H_A) thin upright(d) sigma - frac(min H_A, N) lt.eq frac(L_A delta, N) + 1 / beta log C / delta . $
  Equation (6.1) gives $bb(E) parallel A parallel^2 lt.eq C \( B_0 \) N$; hence $bb(E) L_A \/ N lt.eq C \( B_0 \)$. This proves (6.2).
  At fixed $N$, the quantity $- P_(N \, alpha)^(nu_0) \( beta \) \/ beta$ is nonincreasing in $beta$ and nonnegative. Indeed, $beta mapsto log integral e^(- beta H_A) upright(d) sigma$ is convex and vanishes at zero. Its limiting pressure inherits these properties, so its zero-temperature limit exists. First let $N arrow.r oo$ in the inequality, then let $beta arrow.r oo$ with, for example, $delta = beta^(- 1 \/ 2)$. The liminf and limsup of the expected ground energy coincide with this limit. The identical argument applies to any law with the same fixed-temperature pressures.
  Couple matrices of different row counts by appending independent rows. Appending rows cannot decrease the minimum energy. Conversely, evaluate the new rows at a measurable approximate minimizer of the old matrix and then let its approximation error tend to zero. For every fixed unit $y$, a fresh projection $g = A_mu y$ has mean zero and variance one, and
  $ bb(E) V \( g \) lt.eq 1 / 2 bb(E) \( 1 + g \)^2 = 1 . $
  Thus the expected minimum energy increases by at most one per appended row. After dividing by $N$ and passing to the limit this proves the monotonicity and Lipschitz assertions. Approximate minimizers can be selected measurably by taking the first adequate point in a fixed countable dense subset of the sphere, since $H_A$ is continuous. If $M < N$, the row kernel contains a unit vector, at which every gap is one. Hence $e \( alpha \) = 0$ for $alpha < 1$; continuity gives $e \( 1 \) = 0$. ◻
]

#thm([Lemma 6.2.])[
  (Positive energy at a finite density).  #emph[There is an absolute finite $B > 1$ such that the Gaussian ground energy satisfies $e \( B \) > 0$. The same finite-dimensional lower bound used to prove this assertion holds uniformly for $0 lt.eq epsilon lt.eq 1 \/ 2$.]
] <thresh:large-density>

#proof[
  Conditioned on the variance marks of a mixture matrix, a fixed unit-spin projection is Gaussian with variance in $\[ 1 \/ 2 \, 3 \/ 2 \]$. Thus
  $ bb(P) \( A_mu y < - 2 \) gt.eq p \, #h(2em) p = bb(P) \( Z < - 2 sqrt(2) \) > 0 \, quad Z tilde.op cal(N) \( 0 \, 1 \) . $
  At a deterministic unit $y$, row independence and the elementary Chernoff bound give
  $ bb(P) #scale(x: 120%, y: 120%)[\(] \# { mu : A_mu y < - 2 } < p M \/ 2 #scale(x: 120%, y: 120%)[\)] lt.eq e^(- c_p M) . $
  Outside this event, $parallel r_A \( y \) parallel gt.eq sqrt(p M \/ 2)$. There is an absolute $K_0$ such that $parallel A parallel lt.eq K_0 \( sqrt(N) + sqrt(M) \)$ with probability tending to one, uniformly in these entry laws. Choose a fixed $delta > 0$ so small that $2 K_0 delta lt.eq 1 / 2 sqrt(p \/ 2)$, and take a $delta$-net of the unit sphere of cardinality at most $\( 1 + 2 \/ delta \)^N$. For $M gt.eq N$, the Lipschitz bound for $r_A$ transfers the residual lower bound on the net to
  $ R \( A \) gt.eq 1 / 2 sqrt(p M \/ 2) . $
  The probability that a net point fails is at most $exp { N log \( 1 + 2 \/ delta \) - c_p M }$. Choosing $B$ sufficiently large and setting $M = floor.l B N floor.r$ makes this probability tend to zero. Therefore $min H_A \/ N gt.eq p M \/ \( 16 N \)$ with probability tending to one, and $e \( B \) gt.eq p B \/ 16 > 0$. ◻
]

Fix henceforth $B_0 > B$ and reduce the pressure-comparison constant, if necessary, so that $epsilon_0 \( B_0 \) lt.eq 1 \/ 2$. Define

#[#set math.equation(numbering: n => "(6.3)")
 $ alpha_J = sup { alpha gt.eq 0 : e \( alpha \) = 0 } . $ <thresh:eq:threshold-definition>]

The preceding lemmas show that $1 lt.eq alpha_J < B < B_0$. By continuity and monotonicity, $e \( alpha \) = 0$ for $alpha lt.eq alpha_J$ and $e \( alpha \) > 0$ for $alpha > alpha_J$. It remains to show that vanishing energy density yields exact satisfiability at each strictly smaller density.

=== 6.2 Uniform geometry of the rows <uniform-geometry-of-the-rows>

The repair needs a uniformly bounded right inverse for every set of slightly fewer than $N$ rows. It also needs a bound on how many rows can be close to contact at an arbitrary spin. The next lemma supplies both facts before the spin is selected from the random matrix. This uniformity is what permits us to apply it at a ground minimizer.

#thm([Lemma 6.3.])[
  (Uniform row estimates).  #emph[Fix $B_0 < oo$ and $0 < rho < 1 \/ 8$. There are constants $K < oo$, $c > 0$, $u_0 > 0$, $a > 0$, and $C < oo$, depending only on $\( B_0 \, rho \)$, such that, for all sufficiently large $N$, all $M lt.eq B_0 N$, and every $0 lt.eq epsilon lt.eq 1 \/ 2$, the following hold simultaneously with probability at least $1 - C e^(- a N)$:]
  + #emph[$parallel A parallel lt.eq K sqrt(N)$;]
  + #emph[for every row set $I$ with $1 lt.eq \| I \| lt.eq \( 1 - rho \) N$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ parallel A_I^(sans(T)) v parallel gt.eq c sqrt(N) thin parallel v parallel quad upright("for all ") v in bb(R)^(\| I \|) \; $ <thresh:eq:surjection>]

]
  + #emph[every unit $y$ satisfies 
#[#set math.equation(numbering: n => "(6.5)")
 $ \# { mu : \| 1 + A_mu y \| lt.eq u_0 } lt.eq \( 1 + rho \/ 2 \) N . $ <thresh:eq:gap-count>]

]
] <thresh:uniform-geometry>

#proof[
  Choose $K = K \( B_0 \)$ large enough in (6.1) that the operator-norm failure probability is exponentially small, and work on this event for the two net transfers below.
  For a fixed $I$, $k = \| I \|$, and fixed $v in bb(R)^k$ with $parallel v parallel = 1$, the coordinates of $A_I^(sans(T)) v$, conditional on all variance marks, are independent centered Gaussians with variances at least $1 \/ 2$. Their joint density is at most $pi^(- N \/ 2)$. The Euclidean ball-volume formula therefore gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] parallel A_I^(sans(T)) v parallel lt.eq 2 c sqrt(N) #scale(x: 120%, y: 120%)[\)] lt.eq \( C_1 c \)^N . $
  Use a $\( c \/ K \)$-net of the unit sphere in $bb(R)^k$, of cardinality at most $\( 3 K \/ c \)^k$, taking $c < K$. If (6.4) fails while $parallel A parallel lt.eq K sqrt(N)$, some net point has image norm at most $2 c sqrt(N)$. Summing over dimensions and row sets bounds the failure probability by
  $ N thin 2^(B_0 N) \( 3 K \/ c \)^(\( 1 - rho \) N) \( C_1 c \)^N . $
  Its logarithm divided by $N$ is bounded by a constant depending on $\( B_0 \, K \)$ plus $rho log c + o \( 1 \)$. Choose $c$ sufficiently small to make this bound negative.
  For the gap-count estimate take a net of radius $eta = u_0 sqrt(rho) \/ \( 4 K \)$. If $y$ and its net representative $y_0$ satisfy $parallel y - y_0 parallel lt.eq eta$, then
  $ \# { mu : \| A_mu \( y - y_0 \) \| > u_0 } lt.eq frac(parallel A \( y - y_0 \) parallel^2, u_0^2) lt.eq rho N \/ 16 . $
  If (6.5) fails, more than $\( 1 + 7 rho \/ 16 \) N$ rows at $y_0$ therefore satisfy $\| 1 + A_mu y_0 \| lt.eq 2 u_0$; in particular at least $ceil.l \( 1 + rho \/ 4 \) N ceil.r$ do. For fixed $y_0$, each row projection has density at most $1 \/ sqrt(pi)$, conditionally on its variance marks and also unconditionally. Hence its probability of this interval is at most $C_2 u_0$. Row independence, a union bound over row subsets, and then a union bound over the spin net give, for $C_2 u_0 < 1$,
  $ bb(P) \( upright("gap-count failure") \, med parallel A parallel lt.eq K sqrt(N) \) lt.eq \( 1 + 8 K \/ \( u_0 sqrt(rho) \) \)^N thin 2^(B_0 N) \( C_2 u_0 \)^(\( 1 + rho \/ 4 \) N) . $
  Its logarithm divided by $N$ is at most a constant depending on $\( B_0 \, K \, rho \)$ plus $\( rho \/ 4 \) log u_0$. Choose $u_0$ sufficiently small. These choices establish all three assertions with exponential error. ◻
]

The following elementary fact supplies a direction with uniformly small row projections. It does not require any randomness.

#thm([Lemma 6.4.])[
  (A direction inside finitely many slabs).  #emph[Let $W$ be a $D$-dimensional Euclidean space, $D gt.eq 1$, and $L : W arrow.r bb(R)^m$ a linear map. There exists a unit $v in W$ such that 
#[#set math.equation(numbering: n => "(6.6)")
 $ parallel L v parallel_oo lt.eq frac(parallel L parallel, sqrt(D)) . $ <thresh:eq:slab-direction>]

]
] <thresh:slab-direction>

#proof[
  If $L$ has a nonzero kernel, take a unit kernel vector. Otherwise the set $Q = { w in W : parallel L w parallel_oo lt.eq 1 }$ is compact and has nonempty interior. Let $w_(*)$ maximize $parallel w parallel$ over $Q$. The active linear functionals, those satisfying $\| \( L w_(*) \)_j \| = 1$, span $W^(*)$. Indeed, if they had a common nonzero annihilator $h$, both $w_(*) + t h$ and $w_(*) - t h$ would remain in $Q$ for sufficiently small $t > 0$: active inequalities would be unchanged and the finitely many inactive inequalities have positive slack. But at least one of these two points has squared norm at least $parallel w_(*) parallel^2 + t^2 parallel h parallel^2$, a contradiction. There are consequently at least $D$ distinct active rows, and
  $ D lt.eq parallel L w_(*) parallel^2 lt.eq parallel L parallel^2 parallel w_(*) parallel^2 . $
  The vector $v = w_(*) \/ parallel w_(*) parallel$ satisfies the required bound. ◻
]

=== 6.3 Repair after deleting constraints <repair-after-deleting-constraints>

#thm([Lemma 6.5.])[
  (Deterministic repair).  #emph[Fix $K \, c \, u_0 > 0$ and $0 < rho < 1 \/ 8$. There exists $d_(*) = d_(*) \( K \, c \, u_0 \, rho \) > 0$ such that the following holds for all sufficiently large $N$. Suppose $A$ satisfies the first two assertions of Lemma 27, and some unit $y$ satisfies 
$ parallel r_A \( y \) parallel lt.eq d sqrt(N) \, #h(2em) S = { mu : 1 + A_mu y lt.eq u_0 } \, #h(2em) \| S \| lt.eq \( 1 - 2 rho \) N \, quad 0 < d lt.eq d_(*) . $

 Then there is a unit $hat(y)$ with $1 + A_mu hat(y) gt.eq 0$ for every row $mu$.]
] <thresh:repair>

#proof[
  We first correct the deficient gaps in the ambient vector space, keeping all uncontrolled rows a fixed distance above zero. We then return the corrected vector to the unit sphere.
  #emph[Correct the gaps.] Choose $d_(*) > 0$ sufficiently small that, for $d lt.eq d_(*)$,
  #[#set math.equation(numbering: n => "(6.7)")
   $ d / c lt.eq 1 / 2 \, #h(2em) L_d := frac(16 K^2 d^2, c^2 u_0^2) lt.eq rho / 4 \, #h(2em) K sqrt(frac(4 d, c rho)) lt.eq u_0 / 2 . $ <thresh:eq:repair-smallness>]
  Write $h = upright(bold(1)) + A y$ and $r = \( - h \)_(+) = r_A \( y \)$; these vectors remain fixed throughout the construction. For each imposed set $T supset.eq S$, consider the equations $A_S z = r_S$ and $A_(T \\ S) z = 0$. When they are solvable, let $z_T$ be their minimum-norm solution. Whenever $\| T \| lt.eq \( 1 - rho \) N$, the surjection bound gives existence and
  #[#set math.equation(numbering: n => "(6.8)")
   $ parallel z_T parallel lt.eq frac(parallel r_S parallel, c sqrt(N)) lt.eq d / c . $ <thresh:eq:correction-norm>]
  The empty-set case is understood as $z_diameter = 0$.
  Start at $T = S$. If
  $ J = { j in.not T : \| A_j z_T \| > u_0 \/ 4 } $
  is nonempty, add all of $J$ to $T$, impose $A_J z = 0$, and solve again. Here is a count that verifies that every solve is permitted. If $z'$ is the new solution, then $z' - z_T in ker A_T$ while $z_T$ belongs to the row span of $A_T$. Thus
  $ parallel z' parallel^2 - parallel z_T parallel^2 = parallel z' - z_T parallel^2 gt.eq frac(parallel A_J z_T parallel^2, K^2 N) > frac(\| J \| u_0^2, 16 K^2 N) . $
  Summing over completed additions and using (6.8) shows that they contain at most $L_d N$ rows altogether. The next, not yet imposed, set also has at most $L_d N$ rows, since
  $ \| J \| u_0^2 \/ 16 < parallel A_J z_T parallel^2 lt.eq K^2 N parallel z_T parallel^2 lt.eq K^2 N \( d \/ c \)^2 . $
  Consequently, before every proposed solve,
  $ \| T union J \| lt.eq \( 1 - 2 rho \) N + 2 L_d N lt.eq \( 1 - 3 rho \/ 2 \) N < \( 1 - rho \) N . $
  This proves the induction without assuming existence of the proposed solution. Each nonterminal step adds at least one row, so the procedure terminates after finitely many steps. At termination write $T$ for the imposed set and $z = z_T$. In particular $\| T \| lt.eq \( 1 - rho \) N$ and $parallel z parallel lt.eq d \/ c$.
  Put $y' = y + z$. On $S$ its gaps are $1 + A_S y' = h_S + \( - h_S \)_(+) = \( h_S \)_(+) gt.eq 0$. On $T \\ S$ the correction has zero image and the original gaps exceed $u_0$. Every remaining row has original gap greater than $u_0$ and $\| A_j z \| lt.eq u_0 \/ 4$, so its new gap is at least $3 u_0 \/ 4$. Thus $y'$ is feasible in the ambient space.
  #emph[Restore the norm.] If $n = parallel y' parallel gt.eq 1$, set $hat(y) = y' \/ n$. Each gap becomes
  $ 1 + A_mu hat(y) = \( 1 - n^(- 1) \) + n^(- 1) \( 1 + A_mu y' \) gt.eq 0 . $
  If $n < 1$, take $W = ker A_T ∩ \( y' \)^perp$, whose dimension satisfies $D gt.eq N - \| T \| - 1 gt.eq rho N - 1 gt.eq rho N \/ 2$ for large $N$. Apply Lemma 28 to the remaining rows restricted to $W$. There is a unit $v in W$ such that
  $ parallel A_(T^c) v parallel_oo lt.eq K sqrt(N \/ D) lt.eq K sqrt(2 \/ rho) . $
  Here the infinity norm of an empty vector is zero. Set $hat(y) = y' + sqrt(1 - n^2) thin v$. Orthogonality gives $parallel hat(y) parallel = 1$, and imposed gaps are unchanged. Since $n gt.eq 1 - parallel z parallel gt.eq 1 - d \/ c$, we have $1 - n^2 lt.eq 2 d \/ c$. The absolute change of every remaining gap is at most $K sqrt(4 d \/ \( c rho \)) lt.eq u_0 \/ 2$, leaving it at least $u_0 \/ 4$. This completes the repair. ◻
]

#thm([Proposition 6.6.])[
  (Subextensive parent energy implies satisfiability).  #emph[Let $0 < alpha < alpha' lt.eq B_0$, and let the entries have any one of the laws $nu_epsilon$, $0 lt.eq epsilon lt.eq 1 \/ 2$. If 
$ 1 / N bb(E) min H_(floor.l alpha' N floor.r times N) arrow.r 0 \, $

 then a matrix with $floor.l alpha N floor.r$ rows is satisfiable with probability tending to one.]
] <thresh:deletion>

#proof[
  Deleting rows serves one precise purpose: it reduces the number of small or negative gaps from at most slightly more than $N$ to strictly fewer than $N$. The remaining rows can then be repaired using the surplus dimension in Lemma 29.
  The constants are chosen in the following order. First fix $eta in \( 0 \, 1 - alpha \/ alpha' \)$, so that for all sufficiently large $N$ the retained row count $m = floor.l alpha N floor.r$ is at most $\( 1 - eta \) M$, where $M = floor.l alpha' N floor.r$. Next choose $0 < rho < min \( 1 \/ 8 \, eta \/ 8 \)$ and obtain $K \, c \, u_0$ from Lemma 27 for the parent matrix. Finally fix $d > 0$ satisfying (6.7) and $d^2 \/ u_0^2 lt.eq rho \/ 2$.
  Choose a measurable approximate minimizer $y$ of the parent matrix, with energy at most $min H_A + N^(- 1)$. Markov’s inequality and the hypothesis show that $parallel r_A \( y \) parallel lt.eq d sqrt(N)$ with probability tending to one. On the uniform geometric event, the set of problematic parent rows $S_(upright("par")) = { mu : 1 + A_mu y lt.eq u_0 }$ has size at most $\( 1 + rho \) N$. Indeed, the rows with $\| 1 + A_mu y \| lt.eq u_0$ number at most $\( 1 + rho \/ 2 \) N$, while those with $1 + A_mu y < - u_0$ number at most $parallel r_A \( y \) parallel^2 \/ u_0^2 lt.eq rho N \/ 2$.
  Independently of the parent matrix, retain a uniformly chosen set $I$ of exactly $m$ rows. Conditional on the parent and $y$, the random variable $X = \| I ∩ S_(upright("par")) \|$ is hypergeometric, with
  $ bb(E) \[ X divides A \, y \] lt.eq \( 1 - eta \) \( 1 + rho \) N lt.eq \( 1 - 7 rho \) N . $
  Writing $X$ as a sum of inclusion indicators gives, with $k = \| S_(upright("par")) \|$ and $r = m \/ M$,
  $ "Var" \( X divides A \, y \) = k r \( 1 - r \) frac(M - k, M - 1) lt.eq k / 4 lt.eq frac(\( 1 + rho \) N, 4) . $
  Here the covariance of two distinct inclusion indicators is $- r \( 1 - r \) \/ \( M - 1 \)$; the formula is also immediate when $k = 0$. Chebyshev’s inequality therefore gives
  $ bb(P) { X > \( 1 - 2 rho \) N divides A \, y } lt.eq frac(1 + rho, 100 rho^2 N) . $
  Thus $X lt.eq \( 1 - 2 rho \) N$ with probability tending to one, uniformly over the parent on the stated event.
  The retained matrix inherits the parent’s operator-norm and surjection bounds, and its residual at $y$ is no larger than the parent residual. Lemma 29 makes it exactly feasible on the unit sphere. Finally, an independently chosen subset of rows of an iid matrix, listed in increasing order, has precisely the law of an iid $m times N$ matrix. This proves the assertion for the desired row count. ◻
]

=== 6.4 The common threshold and subsequent ordered limits <the-common-threshold-and-subsequent-ordered-limits>

#thm([Theorem 6.7.])[
  (Sharp common satisfiability threshold).  #emph[For Gaussian entries and, with the choice of $B_0$ above, for every fixed $0 lt.eq epsilon < epsilon_0 \( B_0 \)$, the number $alpha_J$ in (6.3) satisfies $1 lt.eq alpha_J < oo$ and 
$ lim_(N arrow.r oo) bb(P) \( upright("SAT") \) = cases(delim: "{", 1 \, & 0 < alpha < alpha_J \,, 0 \, & alpha > alpha_J .) $

 In particular the threshold itself agrees for all these laws. No assertion at $alpha = alpha_J$ is needed here.]
] <thresh:sharp>

#proof[
  If $alpha < alpha_J$, choose a fixed $alpha' in \( alpha \, alpha_J \)$. The expected parent ground energy is $o \( N \)$ for both laws by Lemma 25 and pressure universality. Proposition 30 proves satisfiability with probability tending to one.
  For $alpha_J < alpha lt.eq B_0$, the same ground-energy limit is strictly positive. The map $A mapsto R \( A \)$ is $1$-Lipschitz in Frobenius norm: for every fixed unit $y$,
  $ \| parallel r_A \( y \) parallel - parallel r_(A') \( y \) parallel #scale(x: 120%, y: 120%)[\|] lt.eq parallel \( A - A' \) y parallel lt.eq parallel A - A' parallel_(upright(F)) \, $
  and taking minima preserves this bound. Gaussian concentration gives $"Var" R \( A \) lt.eq C$ for Gaussian entries. For mixture entries use the coordinatewise Gaussian quantile representation from Section 5, whose Lipschitz constant is at most $2 sqrt(1 + epsilon)$; the same variance bound follows with an absolute constant for $epsilon lt.eq 1 \/ 2$. Since
  $ frac(bb(E) R \( A \)^2, N) = 2 frac(bb(E) min H_A, N) arrow.r 2 e \( alpha \) \, $
  we obtain $bb(E) R \( A \) \/ sqrt(N) arrow.r sqrt(2 e \( alpha \)) > 0$ by subtracting the bounded variance. Chebyshev’s inequality now implies
  $ bb(P) \( upright("SAT") \) = bb(P) \( R \( A \) = 0 \) lt.eq frac("Var" R \( A \), \( bb(E) R \( A \) \)^2) arrow.r 0 . $
  For larger densities, retain the first $floor.l alpha_(*) N floor.r$ rows at any fixed $alpha_(*) in \( alpha_J \, B_0 \)$ and use monotonicity of satisfiability. ◻
]

#thm([Corollary 6.8.])[
  (Transfer of the remaining ordered limits).  #emph[Fix $0 lt.eq epsilon < epsilon_0 \( B_0 \)$. On a full interval above the common threshold, the thermodynamic gap and normalized-force observables at every fixed positive temperature and fixed argument agree with their Gaussian counterparts. Consequently each further ordered limit in the problem exists for the mixture law if and only if it exists for the Gaussian law, and their values agree whenever it exists.]
] <thresh:ordered-limits>

#proof[
  The fixed-temperature row-marginal result in Section 5 gives equality of the inner $N arrow.r oo$ limits for every fixed $beta$, argument, and $alpha in \( alpha_J \, B_0 \]$. Limits of these identical functions, taken successively in the prescribed order, have identical existence and values. This assertion makes no exchange of limits; existence of the Gaussian zero-temperature and jamming limits is established in the following sections. ◻
]

== 7 Zero temperature and mechanical bounds <sec:zero-temperature>

The pressure formula supplies variational minimizers at each positive temperature. We now extract their zero-temperature limits and obtain the mechanical estimates that will control the subsequent approach to the threshold. There are two endpoints to distinguish: the diffusion immediately before the concentrated terminal layer, and the physical row gap after that layer. We first derive their relation. A supporting functional then identifies the negative part of the physical law with ground-minimizer residuals. Finally the contact count, spectral estimate, and small-gap bounds give control uniform as the density approaches the threshold. Section 8 will use that control to preserve mass and moments in the critical limit.

Throughout this section the rows are Gaussian and $alpha_J < alpha lt.eq B_0$ is fixed. Write $e = e \( alpha \) > 0$. Constants with a subscript $e$ may depend on this fixed density; constants called uniform are uniform on a fixed bounded interval of UNSAT densities adjacent to $alpha_J$. All assertions about a random matrix are in probability as $N arrow.r oo$, at fixed values of every cutoff occurring in the assertion. No uniqueness of the limiting variational parameters is assumed in this section.

=== 7.1 Compactness of the variational parameters <compactness-of-the-variational-parameters>

Let $q_beta$ be any minimizer in (4.9). Denote its variance-time row solution by $f_beta$; thus, in the notation of (3.2),

$ \( f_beta \)_t = - 1 / 2 #scale(x: 120%, y: 120%)[\(] \( f_beta \)_(z z) + m_(q_beta) \( t \) \( f_beta \)_z^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) f_beta \( 1 \, z \) = - beta V \( z \) \, #h(2em) f_beta \( 0 \, 0 \) = Phi_(- beta V) \( q_beta \) . $

Put

$ g_beta = f_beta \/ beta \, #h(2em) gamma_beta \( t \) = beta m_(q_beta) \( t \) \, #h(2em) macron(chi)_beta \( t \) = beta chi_(q_beta) \( t \) \, #h(2em) q_(beta \, *) = "ess sup" q_beta . $

Thus $g_(beta \, z) gt.eq 0$, $- 1 lt.eq g_(beta \, z z) lt.eq 0$, and $gamma_beta = beta$ on $\( q_(beta \, *) \, 1 \)$. The next lemma shows that this last interval shrinks while its mass $beta \( 1 - q_(beta \, *) \)$ stays bounded away from zero. The limiting scaled measure therefore retains an endpoint mass, denoted by $Delta$ below; mass from just below $q_(beta \, *)$ can also contribute to it.

#thm([Lemma 7.1.])[
  (UNSAT compactness bounds).  #emph[For all sufficiently large $beta$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ 0 < c lt.eq macron(chi)_beta \( 0 \) lt.eq C_e \, #h(2em) 0 < c_e lt.eq beta \( 1 - q_(beta \, *) \) lt.eq C_e . $ <eq:src14>]

 Consequently every sequence $beta arrow.r oo$ has a subsequence for which 
$ gamma_beta \( t \) thin upright(d) t med arrow.r.double med gamma \( t \) thin upright(d) t + Delta delta_1 \, #h(2em) macron(chi) \( t \) = Delta + integral_t^1 gamma \( v \) thin upright(d) v \, #h(2em) L = macron(chi) \( 0 \) \, $

 where $gamma gt.eq 0$ is nondecreasing and integrable and $Delta gt.eq c_e$. The convergence of $gamma_beta$ is in $L^1 \( \[ 0 \, T \] \)$ for every $T < 1$, and $macron(chi)_beta \( t \) arrow.r macron(chi) \( t \)$ for $t < 1$.]
] <zero:compactness>

Here $gamma_beta$ and $gamma \( t \)$ are variational profiles; the unindexed scalar $gamma$ in Theorem 1 denotes the gap exponent.

#proof[
  The entropy $E \( q \)$ is nonnegative. Since $P \( - beta V \) \/ beta arrow.r - e$, at a minimizer $alpha g_beta \( 0 \, 0 \) lt.eq - e \/ 2$ for large $beta$. Jensen’s inequality in the row recursion gives $g_beta \( 0 \, z \) gt.eq - bb(E) V \( z + G \)$, where $G tilde.op cal(N) \( 0 \, 1 \)$. Choose $R_e > 0$ so that $bb(E) V \( R_e + G \) < e \/ \( 4 alpha \)$. Concavity then implies $g_(beta \, z) \( 0 \, 0 \) gt.eq e \/ \( 4 alpha R_e \)$. After dividing (4.10) by the appropriate powers of $beta$,
  $ alpha g_(beta \, z) \( 0 \, 0 \)^2 macron(chi)_beta \( 0 \)^2 lt.eq 1 \, $
  which proves the upper bound for $macron(chi)_beta \( 0 \)$. Conversely $E \( q_beta \) lt.eq C beta$, since the pressure is nonpositive and $Phi_(- beta V) gt.eq - beta bb(E) V \( G \)$. The integral version of (2.21), restricted to $\[ 0 \, 1 \/ 2 \]$, gives
  $ E \( q_beta \) gt.eq frac(1, 4 chi_(q_beta) \( 0 \)) - frac(log 2, 2) \, $
  and hence the lower bound.
  We shall also use the following consequences of the spin inverse relations:
  #[#set math.equation(numbering: n => "(7.2)")
   $ frac(1, 1 - q_(beta \, *)) = frac(1, chi_(q_beta) \( 0 \)) + integral_0^1 s thin upright(d) p_(q_beta) \( s \) \, #h(2em) q_(beta \, *) lt.eq chi_(q_beta) \( 0 \)^2 p_(q_beta) \( 1 - \) . $ <zero:spin-endpoint>]
  These follow directly from the continuous inverse relation (2.14). For brevity write $q = q_beta$, $p = p_q$, and $chi = chi_q$. Stieltjes integration by parts and Fubini’s theorem give
  $ p \( 1 - \) = integral_0^(q_(*)) frac(upright(d) t, chi \( t \)^2) \, #h(2em) integral_0^1 s thin upright(d) p \( s \) = p \( 1 - \) - integral_0^1 p \( s \) thin upright(d) s = integral_0^(q_(*)) frac(m_q \( t \), chi \( t \)^2) thin upright(d) t . $
  Since $chi' = - m_q$ and $chi \( q_(*) \) = 1 - q_(*)$, the last integral is $\( 1 - q_(*) \)^(- 1) - chi \( 0 \)^(- 1)$. Also $chi \( t \) lt.eq chi \( 0 \)$ in the first integral, so $p \( 1 - \) gt.eq q_(*) \/ chi \( 0 \)^2$. This proves both relations, including general profiles and their top limits.
  Let $Z_t$ solve $upright(d) Z_t = m_(q_beta) \( t \) f_(beta \, z) \( t \, Z_t \) thin upright(d) t + upright(d) B_t$, $Z_0 = 0$, and put $cal(P)_beta \( t \) = alpha bb(E) f_(beta \, z) \( t \, Z_t \)^2$. The derivative martingale and Itô’s isometry imply $cal(P)'_beta \( t \) = alpha bb(E) f_(beta \, z z) \( t \, Z_t \)^2 lt.eq alpha beta^2$, and $p_(q_beta) \( s \) = cal(P)_beta \( q_beta \( s \) \)$. The Stieltjes chain rule, including jumps by integration over the intervening variance interval, yields
  $ integral s thin upright(d) p_(q_beta) \( s \) lt.eq alpha beta^2 integral s thin upright(d) q_beta \( s \) lt.eq alpha beta^2 chi_(q_beta) \( 0 \) . $
  Thus the first relation in (7.2) gives
  $ frac(1, beta \( 1 - q_(beta \, *) \)) lt.eq frac(1, macron(chi)_beta \( 0 \)) + alpha macron(chi)_beta \( 0 \) . $
  The reverse endpoint bound follows from $1 - q_(beta \, *) lt.eq chi_(q_beta) \( 0 \)$.
  Finally, bounded mass and monotonicity give subsequential weak compactness of $gamma_beta thin upright(d) t$. On every compact interval before 1, monotonicity bounds the densities uniformly and gives $L^1$ compactness. Any singular mass is therefore at 1. The terminal interval has mass $beta \( 1 - q_(beta \, *) \) gt.eq c_e$, so the endpoint atom has mass at least $c_e$. ◻
]

#thm([Proposition 7.2.])[
  (Zero-temperature variational principle).  #emph[For every subsequential limit in Lemma 33, let $g$ be the solution of 
$ g_t = - 1 / 2 #scale(x: 120%, y: 120%)[\(] g_(z z) + gamma \( t \) g_z^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) g \( 1 \, z \) = - frac(V \( z \), 1 + Delta) . $

 It satisfies 
#[#set math.equation(numbering: n => "(7.3)")
 $ cal(E)_alpha \( gamma \, Delta \) := alpha g \( 0 \, 0 \) + 1 / 2 integral_0^1 frac(upright(d) t, macron(chi) \( t \)) = - e \, $ <eq:src15>]

 and minimizes this functional over nonnegative nondecreasing integrable $gamma$ and $Delta > 0$. Here solutions have quadratic growth, nonnegative first derivative, and second derivative in $\[ - 1 \, 0 \]$; an integrable time coefficient is interpreted by approximation in $L^1$.]
] <zero:variational>

#proof[
  We give the endpoint comparison explicitly. For $t < 1$, set
  $ U_beta \( t \, z \) = sup_(w in bb(R)) {- V \( w \) - frac(\( z - w \)^2, 2 macron(chi)_beta \( t \))} = - frac(V \( z \), 1 + macron(chi)_beta \( t \)) . $
  At $t = 1$ use the continuous extension $U_beta \( 1 \, z \) = - V \( z \)$. This solves $U_t = - gamma_beta U_z^2 \/ 2$ and has curvature in $\[ - 1 \, 0 \]$. Subtraction from the viscous equation for $g_beta$ produces a linear equation with drift $gamma_beta \( g_(beta \, z) + U_(beta \, z) \) \/ 2$ and a source of absolute value at most $1 \/ 2$. Its diffusion representation, or comparison after smoothing the hinge, gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ sup_z \| g_beta \( t \, z \) - U_beta \( t \, z \) \| lt.eq \( 1 - t \) \/ 2 \, #h(2em) sup_z \| g_(beta \, z) \( t \, z \) - U_(beta \, z) \( t \, z \) \| lt.eq C sqrt(1 - t) . $ <zero:terminal-comparison>]
  For the gradient bound use the value bound and the common Lipschitz bound on the two gradients, comparing difference quotients with step $sqrt(1 - t)$. The identical comparison holds for $g$, with $macron(chi)$ in place of $macron(chi)_beta$.
  On $\[ 0 \, T \]$, subtraction of two viscous equations again gives a linear equation. Its source is bounded by the coefficient difference times $C \( 1 + z^2 \)$, and its drift has a spatial Lipschitz constant bounded by an integrable function with uniformly bounded integral. The associated diffusions have uniform moments of every fixed order, by Gronwall’s inequality. The diffusion representation therefore proves stability under $L^1$ coefficient convergence and local uniform terminal convergence with a common quadratic growth bound. Applying this at $T < 1$, using (7.4), and then sending $T arrow.t 1$, proves local uniform convergence of values and gradients on compact time intervals before 1. The same argument constructs, and proves uniqueness of, the stated solution for an integrable $gamma$.
  For the entropy, (2.21) gives
  $ frac(E \( q_beta \), beta) = 1 / 2 integral_0^(q_(beta \, *)) frac(upright(d) t, macron(chi)_beta \( t \)) + frac(log \( 1 - q_(beta \, *) \), 2 beta) . $
  On this integration interval the denominator is at least $beta \( 1 - q_(beta \, *) \) gt.eq c_e$. Dominated convergence applies, and the logarithmic term is $O_e \( log beta \/ beta \)$. This proves (7.3).
  For an arbitrary trial pair, use the finite-temperature CDF $m_beta \( t \) = min { gamma \( t \) \/ beta \, 1 }$ until $1 - Delta \/ beta$, and set $m_beta = 1$ thereafter. This is nondecreasing and its scaled measure converges to $gamma thin upright(d) t + Delta delta_1$; integrability of $gamma$ ensures that its mass on the shrinking terminal interval vanishes. The comparisons just proved show convergence of its row term and entropy. The finite-temperature minimum is at most this trial value, so $- e lt.eq cal(E)_alpha \( gamma \, Delta \)$. ◻
]

=== 7.2 Endpoint laws and the negative marginal <endpoint-laws-and-the-negative-marginal>

#thm([Proposition 7.3.])[
  (Subsequential endpoint law).  #emph[Let $Z_0 = 0$ and $upright(d) Z_t = gamma \( t \) g_z \( t \, Z_t \) thin upright(d) t + upright(d) B_t$, and put $H = 1 + Z_1$. Along the subsequence defining $\( gamma \, Delta \)$, the tilted row gap converges in distribution to 
#[#set math.equation(numbering: n => "(7.5)")
 $ h^(*) = cases(delim: "{", H \, & H gt.eq 0 \,, H \/ \( 1 + Delta \) \, & H < 0 .) $ <eq:src16>]

 Every fixed moment of the negative part converges. Both $H$ and $h^(*)$ are atomless and assign positive probability to every nonempty open interval. This statement is subsequential; uniqueness is addressed separately below and in Section 8.]
] <zero:endpoint>

#proof[
  On each constant-CDF interval the row tilt is the Gaussian Doob transform. Composing these transforms, then approximating a general CDF, identifies its physical gap with $1 + Z_1^beta$, where
  $ Z_t^beta = B_t + integral_0^t gamma_beta \( v \) g_(beta \, z) \( v \, Z_v^beta \) thin upright(d) v . $
  Couple $Z^beta$ and $Z$ with the same Brownian motion. Before a fixed time $T < 1$, the coefficient and gradient convergence above and Gronwall’s inequality imply convergence in expected supremum norm. On $\[ T \, 1 \]$, replace the gradient by $U_(beta \, z)$. The error has expected size at most $C_e sqrt(1 - T)$, by (7.4) and the uniform bound on $integral gamma_beta$; the Brownian increment has the same bound. The resulting deterministic flow fixes positive gaps and multiplies a negative gap between times $T$ and $t$ by $\( 1 + macron(chi)_beta \( t \) \) \/ \( 1 + macron(chi)_beta \( T \) \)$. First send $beta arrow.r oo$, and then $T arrow.t 1$. The limiting integrable drift on $\[ T \, 1 \]$ has vanishing total mass, whereas the total mass concentrating near time $1$ in $gamma_beta \( t \) thin upright(d) t$ is $Delta$. Since $macron(chi)_beta \( 1 \) = 0$ and $macron(chi)_beta \( T \) arrow.r macron(chi) \( T \)$, the displayed flow factor tends to $\( 1 + Delta \)^(- 1)$ as $beta arrow.r oo$ and then $T arrow.t 1$. This proves (7.5). Since the drift is nonnegative, the negative part of the gap is bounded by $\( 1 + B_1 \)_(-)$; this gives uniform integrability of every moment of the negative part.
  For atomlessness, condition on the Brownian bridge $tilde(B)_t = B_t - t B_1$. The map from $b = B_1$ to $Z_1$ is increasing and has slope between $exp \( - integral gamma \)$ and 1. Indeed its variation satisfies $J' \( t \) = 1 + gamma \( t \) g_(z z) \( t \, Z_t \) J \( t \)$, $J \( 0 \) = 0$. Approximation proves the same bounds when derivatives exist only almost everywhere. The conditional endpoint law is thus the pushforward of a Gaussian under a globally bi-Lipschitz map. That map is onto $bb(R)$, so the law has a bounded density and assigns positive probability to every nonempty open interval. The piecewise linear map in (7.5) preserves these properties. ◻
]

The variable $H$ is the pre-layer gap; $h^(*)$ is the gap sampled by the microscopic observable. In particular their signs agree, but a negative gap is reduced by the factor $1 + Delta$. Define

$ p = bb(P) \( h^(*) < 0 \) = bb(P) \( H < 0 \) \, #h(2em) mu = bb(E) \( h^(*) \)_(-) \, #h(2em) z_c = alpha p . $

The parameter $z_c$ will be identified with the number of active constraints per spin coordinate. That identification requires a small-residual estimate: convergence against tests supported away from zero alone would miss constraints whose negative gaps tend to zero.

#thm([Proposition 7.4.])[
  (Identification of negative gaps).  #emph[For every subsequential endpoint law in Proposition 35, the restriction of the law of $h^(*)$ to $\( - oo \, 0 \)$ is the same. For $psi in C_c^oo \( \( - oo \, 0 \) \)$, uniformly over Gaussian ground minimizers $y_N$, 
$ 1 / N sum_(i = 1)^M psi \( 1 + A_i y_N \) arrow.r alpha bb(E) psi \( h^(*) \) quad upright("in probability") . $

 Moreover, 
#[#set math.equation(numbering: n => "(7.6)")
 $ alpha bb(E) \( h^(*) \)_(-)^2 = 2 e . $ <zero:energy-moment>]

]
] <zero:negative-law>

#proof[
  We perturb the loss in a compact negative-gap interval. For either sign of the perturbation, the pressure trial gives a lower support for the ground energy. Evaluating the perturbed energy at an unperturbed minimizer gives the opposite inequality, and the two one-sided slopes identify its empirical test average. The perturbation interval must remain fixed as $beta arrow.r oo$.
  Let $psi$ be smooth with support in a compact negative-gap interval $\[ - R \, - a \]$, $a > 0$, and put $W_w \( z \) = V \( z \) + w psi \( 1 + z \)$. Choose $w_0 > 0$ so that
  $ w_0 parallel psi'' parallel_oo lt.eq 1 / 2 \, #h(2em) w_0 parallel psi' parallel_oo lt.eq a \/ 2 \, #h(2em) w_0 parallel psi parallel_oo lt.eq a^2 \/ 4 . $
  For $\| w \| lt.eq w_0$, $W_w$ is convex, nonnegative, and nonincreasing, and agrees with $V$ outside that compact interval. In particular $- beta W_w$ is concave for every $beta > 0$. This is a fixed interval of loss perturbations, independent of $beta$.
  Here only a trial upper bound is needed. The Gaussian interpolation with smooth concave tangent caps, followed by the spin conjugate inequality (Corollary 21), gives for every $q_(*) < 1$
  #[#set math.equation(numbering: n => "(7.7)")
   $ limsup_(N arrow.r oo) P_N \( - beta W_w \) lt.eq alpha Phi_(- beta W_w) \( q \) + E \( q \) . $ <zero:fixed-loss-pressure-trial>]
  This uses Corollary 15, namely ordinary profile concavity for a concave terminal, not the small-terminal-perturbation radius in (4.11). The tangent caps have the required concavity, and removal of the cap is valid at each fixed $beta \, w$, because $W_w$ has the same quadratic tail as $V$. Neither strict profile concavity nor identification of a perturbed minimizer is required for (7.7).
  For a base limiting pair $\( gamma \, Delta \)$, let $g_w$ solve the PDE with coefficient $gamma$ and terminal value
  $ g_w \( 1 \, z \) = sup_(v in bb(R)) {- W_w \( v \) - frac(\( z - v \)^2, 2 Delta)} \, #h(2em) S \( w \) = - alpha g_w \( 0 \, 0 \) - 1 / 2 integral_0^1 frac(upright(d) t, macron(chi) \( t \)) . $
  Write $hat(e)_N \( w \) = N^(- 1) min_(parallel y parallel = 1) sum_i W_w \( A_i y \)$ and $e_N \( w \) = bb(E) hat(e)_N \( w \)$. The surface-cap pressure–energy estimate applies to $W_w$, whose curvature and growth bounds are uniform for $\| w \| lt.eq w_0$. Use the recovery profiles of Proposition 34 in (7.7), take $N arrow.r oo$, and then $beta arrow.r oo$. For completeness, the endpoint comparison for this nonquadratic loss uses
  $ U_(beta \, w) \( t \, z \) = sup_v {- W_w \( v \) - frac(\( z - v \)^2, 2 macron(chi)_beta \( t \))} \, #h(2em) t < 1 \, $
  with continuous terminal value $U_(beta \, w) \( 1 \, z \) = - W_w \( z \)$. Both $U_(beta \, w)$ and the scaled viscous solution $g_(beta \, w)$ have curvature in $\[ - C \, 0 \]$, uniformly for $\| w \| lt.eq w_0$, and $U_(beta \, w \, t) = - gamma_beta U_(beta \, w \, z)^2 \/ 2$. The difference equation has forcing bounded by $C \/ 2$, so
  $ sup_z \| g_(beta \, w) \( t \, z \) - U_(beta \, w) \( t \, z \) \| lt.eq C \( 1 - t \) \, #h(2em) sup_z \| g_(beta \, w \, z) \( t \, z \) - U_(beta \, w \, z) \( t \, z \) \| lt.eq C sqrt(1 - t) . $
  Recovery has $integral gamma_beta = L + o \( 1 \)$; hence its drift Lipschitz constants have bounded integrals and its diffusions have uniform moments. Compact-time $L^1$ coefficient stability, followed by $t arrow.t 1$, gives exactly the terminal supremum defining $g_w$, and the entropy converges as before. We obtain
  #[#set math.equation(numbering: n => "(7.8)")
   $ liminf_(N arrow.r oo) e_N \( w \) gt.eq S \( w \) \, #h(2em) S \( 0 \) = e . $ <zero:fixed-loss-support>]
  No existence of a perturbed thermodynamic ground-energy limit is being asserted or used.
  The function $S$ is differentiable at zero. The quadratic penalization in the endpoint supremum is strictly concave in $v$, so the optimizer is unique; its envelope derivative is minus $psi$ at the proximal gap. Linearization of the PDE propagates this bounded terminal derivative along the tilted diffusion. The coefficient stability follows from the difference equation used above. Hence
  #[#set math.equation(numbering: n => "(7.9)")
   $ S' \( 0 \) = alpha bb(E) psi \( h^(*) \) . $ <zero:fixed-loss-derivative>]
  For every base ground minimizer $y_N$, let $T_N = N^(- 1) sum_i psi \( 1 + A_i y_N \)$. Direct evaluation gives
  $ hat(e)_N \( w \) lt.eq hat(e)_N \( 0 \) + w T_N . $
  For each fixed $w$, the centered ground energy $hat(e)_N \( w \) - e_N \( w \)$ tends to zero in probability. Indeed on $parallel A parallel lt.eq K sqrt(N)$ its matrix Lipschitz constant is $C_w \/ sqrt(N)$, uniformly over spins; extend Lipschitz and use Gaussian concentration, and then control the complement by the quadratic growth bound. Thus (7.8) and the known convergence $hat(e)_N \( 0 \) arrow.r e$ imply, for fixed $w > 0$ and $v < 0$, uniformly over all base minimizers,
  $ frac(S \( w \) - e, w) - o_(bb(P)) \( 1 \) lt.eq T_N lt.eq frac(S \( v \) - e, v) + o_(bb(P)) \( 1 \) . $
  Sending $w arrow.b 0$ and $v arrow.t 0$ proves $T_N arrow.r S' \( 0 \)$ in probability. Apply this argument to any two base limiting pairs: the same empirical tests have the two asserted limits, so their derivatives agree. Smooth compact negative tests determine the restriction of a measure to $\( - oo \, 0 \)$, proving the asserted uniqueness and, at the same time, microscopic negative-test convergence.
  For the energy identity use $W_w = \( 1 + w \) V$, $\| w \| < 1 \/ 2$. The same trial-support argument applies, while now $hat(e)_N \( w \) = \( 1 + w \) hat(e)_N \( 0 \)$ identically. The derivative squeeze therefore gives $e = S' \( 0 \) = alpha bb(E) V \( h^(*) - 1 \)$, proving (7.6). Quadratic growth in this differentiation is justified by the uniform diffusion moments. ◻
]

The first moment of the negative part also converges at microscopic ground minimizers: outside residual size $R$, its empirical contribution is at most $2 H_min \/ \( M R \)$. Together with the compact negative-test convergence just proved, this controls the far tail. For any subsequential thermal limit at fixed $alpha$, weak convergence to (7.5), atomlessness at zero, and first-moment convergence identify the force CDF as

$ F_(alpha \, oo) \( s \) = 1 / p bb(P) (0 < \( h^(*) \)_(-) lt.eq s mu / p) \, #h(2em) s > 0 . $

The conditional mean residual is $mu \/ p$; $p \, mu > 0$ by (7.6). Proposition 36 makes this expression independent of the temperature subsequence. Identification with ground-minimizer force statistics additionally uses the active-mass cutoff proved in Lemma 39. Positive gap tests will be identified uniquely only in Section 8.

=== 7.3 Support stability <support-stability>

#thm([Lemma 7.5.])[
  (Endpoint stability).  #emph[For every subsequential zero-temperature optimizer, the contact density parameter $z_c = alpha bb(P) \( H < 0 \)$ satisfies 
#[#set math.equation(numbering: n => "(7.10)")
 $ z_c lt.eq \( 1 + 1 \/ Delta \)^2 . $ <eq:src17>]

]
] <zero:stability>

#proof[
  Let $Z^beta$ denote the finite-temperature tilted diffusion. At finite temperature vary the overlap distribution, with CDF $m$, by moving mass to a point below 1. Linearization of the PDE and (2.21) gives, for variations supported below a cutoff $T < 1$,
  $ delta \( alpha Phi + E \) = 1 / 2 integral_0^T delta m \( t \) J \( t \) thin upright(d) t \, #h(2em) J \( t \) = cal(P)_beta \( t \) - integral_0^t frac(upright(d) v, chi_(q_beta) \( v \)^2) . $
  Let $nu$ be the minimizing overlap distribution, choose $q_(beta \, *) < T < 1$, and fix $s in \[ 0 \, T \)$. The feasible direction $nu_epsilon = \( 1 - epsilon \) nu + epsilon delta_s$ has $m_epsilon \( t \) - m \( t \) = epsilon \( upright(bold(1))_({ s lt.eq t }) - m \( t \) \)$ for $t lt.eq T$, and vanishes for $t > T$. With $K \( s \) = integral_s^T J \( t \) thin upright(d) t$, Fubini’s theorem makes its directional derivative
  $ 1 / 2 (K \( s \) - integral K \( r \) thin nu \( upright(d) r \)) gt.eq 0 . $
  Therefore $K$ is at least its $nu$-average everywhere on $\[ 0 \, T \)$, and equals that average on the support, by continuity. Thus every support point in $\( 0 \, T \)$ is a local minimum of $K$. Since $K' = - J$ and $K'' = - J'$, at each such point
  $ alpha bb(E) f_(beta \, z z) \( s \, Z_s^beta \)^2 chi_(q_beta) \( s \)^2 lt.eq 1 . $
  The derivatives $J'$ and $K''$ are continuous before time 1, including across jumps of $m$. Indeed the mild heat equation and the local spatial Lipschitz bound on $f_(beta \, z)^2$ give joint continuity of $f_(beta \, z z)$ away from the terminal time; the second derivative of the heat kernel applied to a Lipschitz function has an integrable time singularity. The diffusion moment formula then gives continuity of $cal(P)'_beta$, and explicitly
  $ J' \( s \) = alpha bb(E) f_(beta \, z z) \( s \, Z_s^beta \)^2 - chi_(q_beta) \( s \)^(- 2) . $
  No continuity of $f_(beta \, t)$ at a jump of $m$ is asserted.
  Select continuity times $t_n arrow.t 1$ with $\( 1 - t_n \) gamma \( t_n \) arrow.r 0$; this follows from integrability and monotonicity. A diagonal choice $t_beta arrow.t 1$ ensures $t_beta < q_(beta \, *)$, $macron(chi)_beta \( t_beta \) arrow.r Delta$, and $\( 1 - t_beta \) gamma_beta \( t_beta \) arrow.r 0$. Let $s_beta$ be the next overlap-support point at or above $t_beta$. The CDF is constant between these points, so
  $ macron(chi)_beta \( t_beta \) - macron(chi)_beta \( s_beta \) = gamma_beta \( t_beta \) \( s_beta - t_beta \) lt.eq \( 1 - t_beta \) gamma_beta \( t_beta \) arrow.r 0 . $
  Consequently $macron(chi)_beta \( s_beta \) arrow.r Delta$. Moreover, for fixed $T < 1$,
  $ integral_T^(s_beta) gamma_beta \( t \) thin upright(d) t arrow.r integral_T^1 gamma \( t \) thin upright(d) t . $
  The drift over this interval is negligible after $T arrow.t 1$, so $Z_(s_beta)^beta$ converges to the pre-atom endpoint $Z_1$.
  By (7.4), $g_(beta \, z) \( s_beta \, z \) arrow.r \( - 1 - z \)_(+) \/ \( 1 + Delta \)$ locally uniformly. These gradients are convex in $z$: differentiating the PDE three times gives a linear equation preserving the nonnegative third spatial derivative of a smoothed hinge terminal, and passage to the limit preserves convexity. Secant bounds for convex functions therefore give locally uniform convergence of their derivatives on each compact interval avoiding $z = - 1$: the limit derivative is continuous there, and a finite secant mesh gives a uniform bound. Since these derivatives are bounded and $Z_1$ is atomless, the finite-temperature stability inequality passes to
  $ alpha frac(Delta^2, \( 1 + Delta \)^2) bb(P) \( Z_1 < - 1 \) lt.eq 1 \, $
  as asserted. ◻
]

=== 7.4 Mechanical contacts and uniform cutoff estimates <mechanical-contacts-and-uniform-cutoff-estimates>

We now relate these variational quantities to finite-dimensional minimizers. Three separate facts are needed. A positive-energy minimizer has at least $N$ strictly violated rows and almost surely no row at exactly zero gap. A uniform small-residual bound then prevents an extensive number of those violated rows from disappearing at zero in the large-$N$ limit. A different bound, proved on near-ground configurations later in the section, controls small positive gaps in the prescribed thermal order. Write $Pi_y = I - y y^T$, $r_i \( y \) = \( - 1 - A_i y \)_(+)$, and $nabla_S H \( y \) = Pi_y nabla H \( y \)$ on the unit sphere.

#thm([Lemma 7.6.])[
  (Mechanical contact count).  #emph[Almost surely, every positive-energy Gaussian ground minimizer has no zero gap outside its active set $C = { i : r_i > 0 }$, and $k = \| C \| gt.eq N$. At such a minimizer, 
#[#set math.equation(numbering: n => "(7.11)")
 $ A_C^T \( A_C y + upright(bold(1)) \) = lambda y \, #h(2em) lambda = sum_(i in C) r_i \( 1 + r_i \) > 0 \, #h(2em) v^T \( A_C^T A_C - lambda I \) v gt.eq 0 quad \( v perp y \) . $ <zero:mechanical-hessian>]

]
] <zero:mechanical>

#proof[
  For a fixed $C$, Gaussian genericity gives simple nonzero singular values of $A_C$ and a nonzero component of $A_C^T upright(bold(1))$ in each corresponding right singular direction. These properties hold almost surely, since their exceptional sets are proper algebraic sets. Stationarity implies the first identity in (7.11); its scalar product with $y$ gives $lambda > 0$. The genericity just noted precludes $lambda$ from being an eigenvalue of $A_C^T A_C$. Thus the stationary vector is obtained by inversion. Its unit-norm equation is rational in $lambda$, is not identically satisfied (it tends to zero at infinity), and has finitely many roots. Conditional on $A_C$, any row outside $C$ almost surely avoids gap zero at all these finitely many vectors. A union over the finitely many sets $C$ proves the first assertion, even if such a row was initially allowed to have zero gap. The energy is now smooth near the minimizer, so its constrained Hessian is nonnegative on the tangent space. Finally stationarity with $lambda > 0$ puts $y$ in the row span of $A_C$. A nontrivial kernel of $A_C$ would be tangent and would have Hessian value $- lambda$, a contradiction. Hence $"rank" A_C = N$, and $k gt.eq N$. ◻
]

We record the common counting estimate behind the cutoff bounds. Work on $parallel A parallel lt.eq K sqrt(N)$, whose probability tends to one for fixed sufficiently large $K = K \( B_0 \)$. Both the residual map and the tangent gradient obey

#[#set math.equation(numbering: n => "(7.12)")
 $ parallel r \( y \) - r \( y' \) parallel_2 lt.eq K sqrt(N) parallel y - y' parallel \, #h(2em) parallel nabla_S H \( y \) - nabla_S H \( y' \) parallel lt.eq C N parallel y - y' parallel . $ <zero:lipschitz>]

At a deterministic unit vector $y_0$, condition on all scalar projections $A_i y_0$. The tangent row components remain independent standard Gaussians, and therefore

$ nabla_S H \( y_0 \) divides \( A_i y_0 \)_i tilde.op cal(N) #scale(x: 120%, y: 120%)[\(] 0 \, parallel r \( y_0 \) parallel_2^2 I_(N - 1) #scale(x: 120%, y: 120%)[\)] . $

For $parallel r \( y_0 \) parallel_2 gt.eq t sqrt(N) \/ 2$, its small-ball bound is

#[#set math.equation(numbering: n => "(7.13)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] parallel nabla_S H \( y_0 \) parallel lt.eq C a N divides \( A_i y_0 \)_i #scale(x: 120%, y: 120%)[\)] lt.eq \( C a \/ t \)^(N - 1) . $ <zero:gradient-small-ball>]

A deterministic net of mesh proportional to $a$ has at most $\( C \/ a \)^N$ points. Thus a projection event of probability at most $C^N t^k w^j$, involving specified row sets, has union probability at most

#[#set math.equation(numbering: n => "(7.14)")
 $ a^(- 1) C^N t^(k - N + 1) w^j $ <zero:net-master>]

provided the original projection event transfers to that event at a net point, and the configurations satisfy $parallel nabla_S H parallel lt.eq C a N$ and have residual size in $\[ t sqrt(N) \, 2 t sqrt(N) \]$. Choose the mesh at most $t \/ \( 2 K \)$; then (7.12) ensures the required residual lower bound $t sqrt(N) \/ 2$ at the net point. The factor $t^(k - N + 1)$ records the useful cancellation: forcing $k$ active projections into a ball of radius $O \( t sqrt(N) \)$ contributes $t^k$, while making the tangent gradient small costs $t^(- \( N - 1 \))$. With at least $N$ active rows, no negative power growing with $N$ remains as $t arrow.b 0$. Here all choices of row subsets, at most $3^M$, have been absorbed into $C^N$. The mesh $a > 0$ is chosen after $t \, w$ and every other cutoff, and is then held fixed as $N arrow.r oo$. In particular the factor $a^(- 1)$ does not affect exponential decay. The operator-norm event is used only to transfer a configuration to the net, never in the conditional Gaussian probability calculation.

#thm([Lemma 7.7.])[
  (Negative cutoffs).  #emph[There are constants $c \, C > 0$, independent of the density, such that $alpha mu gt.eq c sqrt(e)$, where $mu = bb(E) \( h^(*) \)_(-)$. At each fixed UNSAT density, uniformly over Gaussian ground minimizers, 
$ k / N arrow.r z_c quad upright("in probability") . $

 There is $s_0 > 0$, independent of the density, such that their limiting mean-one force law obeys $F_(alpha \, oo) \( s \) lt.eq C \/ \| log s \|$ for all $0 < s < s_0$, uniformly as $alpha arrow.b alpha_J$. Furthermore $z_c arrow.r 1$ in this limit, and every weak subsequential jamming force law has total mass one and no atom at zero.]
] <zero:negative-cutoffs>

#proof[
  Set $t = sqrt(e)$. Since $H_min \/ N arrow.r e$, with probability tending to one,
  $ frac(3 e, 4) lt.eq H_min / N lt.eq frac(5 e, 4) \, #h(2em) t sqrt(N) lt.eq parallel r parallel_2 lt.eq 2 t sqrt(N) . $
  Thus a single residual annulus suffices at every fixed density. Moreover $t lt.eq sqrt(B_0)$, since $e \( alpha \) lt.eq alpha lt.eq B_0$. All exponential bases in the counting estimates can consequently be chosen independently of the density; the net mesh may still depend on its fixed value of $t$. If $parallel r parallel_1 lt.eq c_1 t N$, transfer to a net of sufficiently small mesh so that the same active set $C$ has $sum_(i in C) \| 1 + A_i y_0 \| lt.eq 2 c_1 t N$. The joint projection density is bounded by an absolute constant to the power $k$, and the $k$-dimensional cross-polytope volume is $2^k \( 2 c_1 t N \)^k \/ k !$. Since $k gt.eq N$, the projection probability is at most $\( C c_1 t \)^k$. Combining with (7.13) and the net gives $a^(- 1) C^N c_1^k t^(k - N + 1)$, which is exponentially small for a uniformly small $c_1$, because $t lt.eq sqrt(B_0)$ and $N lt.eq k lt.eq B_0 N$. Thus $parallel r parallel_1 gt.eq c_1 t N$; the previously established first-moment convergence proves the bound for $mu$.
  Suppose at least $eta N$ active residuals are at most $s t$, where $0 < eta < 1 \/ 2$. Choose $a lt.double s t sqrt(eta) \/ K$. By the squared projection displacement bound, at least $j = floor.l eta N \/ 2 floor.r$ corresponding net gaps have absolute value at most $2 s t$. The remaining coordinates of $C$ lie in a Euclidean ball of radius $C t sqrt(N)$. Its volume, together with the $j$ intervals, bounds the projection probability by $C^N t^k s^j$; here $k - j gt.eq N \/ 2$ bounds the ball’s dimension factor. Equation (7.14) excludes this event for $s lt.eq exp \( - C' \/ eta \)$, with $C'$ uniform. At fixed $e > 0$, this estimate and convergence of compact negative tests show that no extensive active mass is lost at zero, proving $k \/ N arrow.r alpha bb(P) \( h^(*) < 0 \) = z_c$.
  The mean residual among active rows is at most $parallel r parallel_2 \/ sqrt(k) lt.eq 2 t$. A normalized force at most $s$ therefore has residual at most $C s t$. The preceding estimate, divided by $k gt.eq N$, gives $F_(alpha \, oo) \( s \) lt.eq C \/ \| log s \|$. The mean-one laws are tight by Markov’s inequality; in fact their second moments are uniformly bounded, since $k parallel r parallel_2^2 \/ parallel r parallel_1^2 lt.eq C$. Their weak limits therefore retain mean one. The displayed logarithmic bound prevents any subsequential limit from putting mass at zero.
  For the contact density, use the uniform all-spin near-gap estimate in Lemma 27. For each fixed $rho > 0$, it supplies $u_0 > 0$ such that every ground minimizer satisfies
  $ k lt.eq \( 1 + rho \) N + 2 H_min \/ u_0^2 . $
  Take $N arrow.r oo$, then $alpha arrow.b alpha_J$, and finally $rho arrow.b 0$. This gives $limsup z_c lt.eq 1$, while Lemma 38 gives $z_c gt.eq 1$. ◻
]

=== 7.5 A uniform spectral bound <a-uniform-spectral-bound>

The precise Marčenko–Pastur input needed here is the following Gaussian special case [15] Theorem 1 and Example 1, pp. 459–461: if $k_N \/ N arrow.r z gt.eq 1$ and $A_N$ is a $k_N$-by-$N$ matrix of independent standard Gaussians, the empirical law of the eigenvalues of $A_N^T A_N \/ N$ converges weakly in probability to the probability measure with density

$ frac(sqrt(\( b_z - x \) \( x - a_z \)), 2 pi x) thin upright(bold(1))_(\[ a_z \, b_z \]) \( x \) \, #h(2em) a_z = \( sqrt(z) - 1 \)^2 \, quad b_z = \( sqrt(z) + 1 \)^2 . $

In particular every interval immediately to the right of $a_z$ has positive limiting mass. No extreme-eigenvalue theorem is needed.

#thm([Lemma 7.8.])[
  (Spectral and susceptibility bounds).  #emph[For every $epsilon > 0$, with probability tending to one, simultaneously for all row subsets $C$ with $N lt.eq \| C \| lt.eq B_0 N$, at least two singular values of $A_C \/ sqrt(N)$ are at most $sqrt(\| C \| \/ N) - 1 + epsilon$. Consequently 
#[#set math.equation(numbering: n => "(7.15)")
 $ 2 e + alpha mu lt.eq \( sqrt(z_c) - 1 \)^2 lt.eq Delta^(- 2) \, #h(2em) Delta lt.eq C e^(- 1 \/ 4) \, #h(2em) 1 / sqrt(2 e) lt.eq L lt.eq C / sqrt(e) . $ <zero:susceptibility-bounds>]

 In particular $Delta \/ L arrow.r 0$ as $alpha arrow.b alpha_J$.]
] <zero:spectral>

#proof[
  Fix $epsilon > 0$. For each aspect ratio in $\[ 1 \, B_0 \]$, choose a nonnegative Lipschitz function of the singular value, supported strictly below $sqrt(z) - 1 + epsilon$, with positive integral under the limiting singular-value law. By continuity of the spectral edges and density, each fixed test stays below the cutoff and retains a positive limiting integral throughout the closure of a sufficiently small ratio neighborhood. A finite collection of these neighborhoods covers the compact ratio interval, giving a common positive lower bound for the relevant limiting integrals. Convergence of their expectations is uniform within the chosen neighborhoods: otherwise a violating sequence of ratios would have a convergent subsequence and contradict the stated spectral limit. The Frobenius singular-value inequality gives
  $ A mapsto 1 / N sum_(i = 1)^N phi #scale(x: 120%, y: 120%)[\(] s_i \( A \/ sqrt(N) \) #scale(x: 120%, y: 120%)[\)] quad upright("Lipschitz constant at most ") "Lip" \( phi \) \/ N . $
  Gaussian concentration therefore bounds a fixed positive downward deviation by $2 exp \( - c_epsilon N^2 \)$. Union over at most $2^(B_0 N)$ subsets still has probability tending to zero. A positive normalized test average implies a positive multiple of $N$ singular values below the cut, hence at least two for large $N$.
  The span of two corresponding right singular vectors intersects $y^perp$. The Hessian inequality (7.11) therefore yields
  $ lambda / N lt.eq \( sqrt(k \/ N) - 1 + epsilon \)^2 . $
  Since $lambda \/ N = 2 H_min \/ N + parallel r parallel_1 \/ N$, first take $N arrow.r oo$, then $epsilon arrow.b 0$, and use the contact and moment convergence. The upper bound $Delta^(- 2)$ follows from (7.10) and $z_c gt.eq 1$. The estimate for $mu$ in Lemma 39 then gives $Delta lt.eq C e^(- 1 \/ 4)$.
  The second inequality in (7.2), together with $p_(q_beta) \( 1 - \) lt.eq alpha bb(E) f_(beta \, z) \( 1 \, Z_1^beta \)^2$, passes to $1 lt.eq L^2 alpha bb(E) \( h^(*) \)_(-)^2 = 2 e L^2$. Finally the derivative martingale identifies $g_(beta \, z) \( 0 \, 0 \) arrow.r mu$, so (4.10) implies $alpha mu^2 L^2 lt.eq 1$. The lower bound for $mu$ proves the upper bound for $L$. Dividing the two estimates proves the final assertion. This conclusion concerns the thermal endpoint atom; it does not preclude additional layers concentrating at the endpoint in the subsequent density limit. ◻
]

#thm([Corollary 7.9.])[
  (Cutoffs after susceptibility normalization).  #emph[For every subsequential endpoint law, put $R = L \( h^(*) \)_(-)$ and $p = bb(P) \( h^(*) < 0 \)$. There are constants $c \, C \, u_0 > 0$, independent of the density, such that throughout the fixed UNSAT interval and for $0 < u < u_0$, 
$ c lt.eq bb(E) R lt.eq C \, #h(2em) bb(P) \( 0 < R lt.eq u \) lt.eq frac(C, \| log u \|) #h(2em) alpha p arrow.r 1 quad \( alpha arrow.b alpha_J \) . $

]
] <zero:normalized-force-cutoff>

#proof[
  The bounds $L gt.eq \( 2 e \)^(- 1 \/ 2)$, $alpha mu gt.eq c sqrt(e)$, and $alpha mu^2 L^2 lt.eq 1$ give the two bounds for $bb(E) R = L mu$. Moreover $p = z_c \/ alpha$ is bounded away from zero because $z_c gt.eq 1$ and $alpha lt.eq B_0$. Thus the conditional mean $bb(E) \[ R divides R > 0 \] = L mu \/ p$ is bounded above and below. Apply Lemma 39 to the corresponding mean-one force to obtain the displayed small-value bound. The final assertion is $z_c arrow.r 1$. ◻
]

=== 7.6 Positive gaps in the prescribed temperature order <positive-gaps-in-the-prescribed-temperature-order>

#thm([Proposition 7.10.])[
  (Positive-gap cutoffs).  #emph[Constants $c \, C \, u_0 > 0$, independent of the density, exist such that, for $0 < delta < u < 1$, $G_(N \, beta \, alpha) \( delta \, u \) gt.eq c \( u - delta \)$. For every fixed UNSAT density in the interval under consideration and every $0 < u < u_0$, 
#[#set math.equation(numbering: n => "(7.16)")
 $ limsup_(beta arrow.r oo) limsup_(N arrow.r oo) bb(E) ⟨1 / M sum_(i = 1)^M upright(bold(1))_({ 0 < h_i lt.eq u })⟩ lt.eq frac(C, \| log u \|) $ <zero:direct-positive-cutoff>]

 with the same constants $C \, u_0$ at every such density. In particular every subsequential endpoint law in (7.5) satisfies the direct bound $bb(P) \( 0 < h^(*) lt.eq u \) lt.eq C \/ \| log u \|$. The same estimate bounds the ordered zero-temperature and density limsups of $G_(N \, beta \, alpha) \( delta \, u \)$, uniformly in $0 < delta < u$. The upper bound requires no identification of positive gap tests at exact ground minimizers.]
] <zero:positive-cutoffs>

#proof[
  Remove a tested row. Its insertion denominator is at most one, whereas its penalty vanishes on the tested positive interval. Conditional on the cavity spin, the removed projection is standard Gaussian. Its density is bounded below on $\[ - 1 \, 0 \]$, which proves the lower bound. The same proof works for the small mixtures, conditional on their variances, with a uniform lower density bound.
  For the upper bound, exact ground minimizers alone are insufficient: the observable first takes $N arrow.r oo$ at positive temperature. We therefore prove the counting bound throughout a thin energy sublevel and only then concentrate the Gibbs measure on it. The needed replacement for the exact contact count $k gt.eq N$ is a lower bound $k gt.eq \( 1 - 2 eta' \) N$ on that whole sublevel. We derive it before counting the positive gaps.
  Fix the UNSAT density and a tolerance $rho > 0$. On the good operator-norm event the surface-cap argument implies that, for all sufficiently large $beta$, Gibbs mass outside
  $ cal(L)_rho = { y : H \( y \) lt.eq H_min + rho N } $
  is exponentially small in $N$. Along any great circle the energy derivative has Lipschitz constant $C N$. Descending in the negative tangent-gradient direction therefore gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ parallel nabla_S H \( y \) parallel lt.eq C sqrt(rho) thin N #h(2em) \( y in cal(L)_rho \) . $ <zero:near-ground-gradient>]
  Indeed a derivative of magnitude $d$ permits an energy decrease at least $c d^2 \/ N$, contradicting near-minimality if $d > C sqrt(rho) N$.
  Set $t = sqrt(e)$ and require $rho lt.eq e \/ 4$. On the event $H_min \/ N in \[ 3 e \/ 4 \, 5 e \/ 4 \]$, every point of $cal(L)_rho$ then satisfies $t sqrt(N) lt.eq parallel r \( y \) parallel_2 lt.eq 2 t sqrt(N)$. Choose from the outset
  $ 0 < eta' lt.eq min {1 / 4 \, frac(1, 2 \( 1 + \| log t \| \))} . $
  At a sufficiently small fixed cutoff $v = v \( e \, eta' \) > 0$, and then sufficiently small $rho > 0$, no point of $cal(L)_rho$ has $eta' N$ absolute gaps at most $v$. To see this, use the net and conditional-gradient argument with projection factor $\( C v \)^(floor.l eta' N \/ 2 floor.r)$ and residual lower bound $t sqrt(N)$. Its union probability is at most $a^(- 1) C^N t^(- \( N - 1 \)) v^(floor.l eta' N \/ 2 floor.r)$. Choose $v$ small, then $a lt.double min { t \, v sqrt(eta') }$, then $sqrt(rho) lt.double a$. This is exponentially small by (7.17).
  Every point of $cal(L)_rho$ must consequently have $k gt.eq \( 1 - 2 eta' \) N$ active rows, after decreasing $rho$ if necessary. Otherwise impose zero image on all active and all absolute-near-zero rows and intersect their kernel with $y^perp$. This subspace has dimension at least $eta' N - 1$. Lemma 28 gives a unit vector $v_0$ there with $parallel A v_0 parallel_oo lt.eq C \/ sqrt(eta')$. For small fixed $b > 0$, depending on $v$ and $eta'$, set $y_b = sqrt(1 - b^2) y + b v_0$. With $c_b = sqrt(1 - b^2)$,
  $ h_i \( y_b \) = c_b h_i \( y \) + \( 1 - c_b \) + b A_i v_0 . $
  Choose $b$ so small that $c_b gt.eq 1 \/ 2$ and $b C \/ sqrt(eta') < v \/ 4$. Positive gaps above $v$ then remain positive. All rows with $\| h_i \( y \) \| lt.eq v$ have $A_i v_0 = 0$, so their nonnegative gaps remain nonnegative. The same vanishing projection on every active row gives $r_i \( y_b \) lt.eq c_b r_i \( y \)$. Therefore $H \( y_b \) lt.eq \( 1 - b^2 \) H \( y \)$, an improvement of at least $b^2 e N \/ 2$ with high probability. This contradicts membership in $cal(L)_rho$ when $rho < b^2 e \/ 2$.
  Now suppose that $eta N$ positive gaps are at most $u$. Transfer to a sufficiently fine net, retaining at least $j = floor.l eta N \/ 2 floor.r$ of these rows with absolute gap at most $2 u$; these row indices are disjoint from the active set of the original point. The active coordinates at the net point lie in a Euclidean ball of radius $C t sqrt(N)$, with the same $t = sqrt(e)$ fixed above. Since $k gt.eq N \/ 2$, the joint projection probability is at most $C^N t^k u^j$. The net estimate (7.14) still applies, by choosing $rho$ after the mesh. Since $t = sqrt(e) lt.eq sqrt(B_0)$, $k gt.eq \( 1 - 2 eta' \) N$, and $2 eta' \| log t \| lt.eq 1$,
  $ t^(k - N) lt.eq max {max \( 1 \, sqrt(B_0) \)^(B_0 N) \, exp #scale(x: 120%, y: 120%)[\(] 2 eta' N \| log t \| #scale(x: 120%, y: 120%)[\)]} lt.eq C^N \, $
  with a uniform $C$, even as $e arrow.b 0$. The union probability is consequently bounded by $a^(- 1) C^N u^(floor.l eta N \/ 2 floor.r)$, and tends to zero for $u lt.eq exp \( - C' \/ eta \)$, where $C'$ is uniform in the density.
  The sequence of choices is: density and $eta$; then $eta'$, $v$, and the corresponding descent step; then the uniform exponential cutoff $u$; then the net mesh and $rho$; finally $beta$ large enough for Gibbs concentration, and $N arrow.r oo$. Thus no interchange of the temperature and size limits is used. The row count bound $eta N$, divided by $M$, is at most a uniform multiple of $eta$, since the densities stay bounded away from zero. Taking $eta = C \/ \| log u \|$ proves (7.16), since the counting event included all positive gaps in $\( 0 \, u \]$. At fixed density, the finite-temperature row marginal and Proposition 35 converge along the chosen subsequence at both endpoints 0 and $u$, which are atomless. Thus the bound passes directly to every subsequential law of $h^(*)$, without removing a positive lower cutoff or identifying positive tests at exact ground minimizers. ◻
]

=== 7.7 A variational characterization of the threshold <a-variational-characterization-of-the-threshold>

#thm([Corollary 7.11.])[
  #emph[With $g$ and $macron(chi)$ as in Proposition 34, 
#[#set math.equation(numbering: n => "(7.18)")
 $ alpha_J = inf_(gamma gt.eq 0 med upright("nondecreasing") \, med gamma in L^1\
Delta > 0) frac(integral_0^1 macron(chi) \( t \)^(- 1) thin upright(d) t, - 2 g \( 0 \, 0 \)) . $ <zero:threshold-ratio>]

 Equivalently one may impose $macron(chi) \( 0 \) = 1$ and replace the terminal condition by $g \( 1 \, z \) = - V \( z \) \/ Delta$.]
] <zero:threshold-characterization>

#proof[
  The denominator is positive. The diffusion representation writes $g \( 0 \, 0 \)$ as a negative terminal expectation minus $1 / 2 bb(E) integral gamma g_z^2$; atomlessness with a positive density on negative intervals makes the terminal expectation strictly negative. Recovery trials in Proposition 34 remain valid when $e = 0$. In that regime all trial functionals are nonnegative, so $alpha$ is at most every ratio in (7.18). For $e > 0$, an attained negative functional gives a ratio strictly below $alpha$. Approaching the threshold from the two sides proves the formula.
  To verify the normalization assertion, scale a fixed pair by $c > 0$. If $g_c$ is the solution for $\( c gamma \, c Delta \)$, then $c g_c$ solves the equation with coefficient $gamma$ and terminal value $- V \/ \( Delta + 1 \/ c \)$. The ratio for the scaled pair is therefore the ratio for this rescaled equation. It decreases as $c arrow.t oo$ and converges to the ratio with terminal $- V \/ Delta$, by the PDE comparison and stability already proved. Every shape can be normalized to $macron(chi) \( 0 \) = 1$, and every normalized limiting ratio is approached by its finite scalings. The two infima are equal. ◻
]

The next section uses the susceptibility bounds of Lemma 40 and the two direct cutoff estimates to construct the normalized critical law. Joint convexity will first supply the fixed-density uniqueness still missing for positive gaps.

== 8 A convex critical problem and the limiting microscopic laws <sec:critical>

At a fixed UNSAT density, Section 7 describes subsequential zero-temperature laws by a susceptibility and its PDE. We first prove that this description is unique. We then approach the threshold, retaining the notation $alpha_c = alpha_J$, and construct a unique normalized pair consisting of a susceptibility $chi$ and a nonnegative terminal force variable $R$. The limiting state $H_1$ will be the gap variable: $H_1 gt.eq 0$, and $R H_1 = 0$ separates positive gaps from contacts.

There are two different convergence questions. Convexity on one Wiener space identifies every weak subsequential limit, but does not preserve contact probabilities or force normalization. To obtain those facts we prove that the critical susceptibility vanishes at the endpoint, upgrade the terminal convergence to $L^2$, and apply the uniform small-gap and small-force estimates from the preceding section. The resulting laws, with the limits taken in the prescribed order, are stated in Theorem 55.

The stochastic variational viewpoint is related to Boué–Dupuis [4] and Auffinger–Chen [2]. More specifically, the use of terminal duality to obtain a variational formula over Brownian martingales, with the optimizer identified by the derivative of the Parisi PDE along its diffusion, has a close analogue in Mourrat [17] Lemma 2.2 and Theorem 2 in the preprint; see also Chen, Issa and Mourrat [7] Proposition 8.1 and Theorem 1.5. Proposition 44 establishes the representation needed here for a concave quadratic terminal function and a nonnegative terminal variable in $L^2$. Rewriting its quadratic terms using $s = 1 \/ chi$ gives the joint convexity in Lemma 45. The possibility that $chi$ vanishes at the endpoint requires the additional compactness and equality arguments below; the critical uniqueness statement is not a direct consequence of the cited results.

=== 8.1 The probability space and the admissible class <the-probability-space-and-the-admissible-class>

Fix canonical Wiener space, with its completed natural filtration $\( cal(F)_t \)_(0 lt.eq t lt.eq 1)$ and coordinate Brownian motion $B$. Realize each fixed-density zero-temperature optimizer’s forward diffusion as the strong solution driven by this same $B$. Thus the terminal variables for different densities will belong to one Hilbert space, rather than merely having laws that can be compared. Expectations in this section are on that space. For every $R in L^2 \( cal(F)_1 \)$, martingale representation gives a unique predictable $b in L^2 \( Omega times \[ 0 \, 1 \] \)$ such that

$ r_t := bb(E) \[ R divides cal(F)_t \] = c + integral_0^t b_v thin upright(d) B_v \, #h(2em) c := bb(E) R . $

The maps $R mapsto c$ and $R mapsto b$ are bounded linear maps, and $bb(E) R^2 = c^2 + integral_0^1 bb(E) b_t^2 thin upright(d) t$.

The susceptibility class extends the positive-energy class in (7.3) to allow a zero endpoint value. An admissible susceptibility is

$ chi \( t \) = Delta + integral_t^1 gamma \( v \) thin upright(d) v \, #h(2em) Delta gt.eq 0 \, #h(2em) chi \( t \) > 0 quad \( t < 1 \) \, $

where $gamma gt.eq 0$ is nondecreasing and belongs to $L^1 \( 0 \, 1 \)$. Thus $chi$ is concave, nonincreasing, and continuous on $\[ 0 \, 1 \]$; the endpoint value is $chi \( 1 \) = Delta$. Set $s = 1 \/ chi$ on $\[ 0 \, 1 \)$ and require $integral_0^1 s < oo$. The value of $s$ at the single endpoint is immaterial. We explicitly require $s in L^2 \( 0 \, 1 \)$ whenever that stronger condition is needed. A pair $\( R \, s \)$ is admissible when its susceptibility is admissible and $R gt.eq 0$ almost surely belongs to $L^2 \( cal(F)_1 \)$.

For $lambda gt.eq 0$ define the joint functional

#[#set math.equation(numbering: n => "(8.1)")
 $ J_(alpha \, lambda) \( R \, s \) =  & alpha bb(E) [R \( 1 + B_1 \) + lambda / 2 R^2] + alpha / 2 {frac(c^2, s \( 0 \)) + integral_0^1 frac(bb(E) b_t^2, s \( t \)) thin upright(d) t} + 1 / 2 integral_0^1 s \( t \) thin upright(d) t . $ <crit:def-functional>]

All terms are finite. In particular $chi lt.eq chi \( 0 \)$ bounds the quadratic martingale term. The elementary identity

#[#set math.equation(numbering: n => "(8.2)")
 $ c^2 chi \( 0 \) + integral_0^1 chi \( t \) bb(E) b_t^2 thin upright(d) t = Delta bb(E) R^2 + integral_0^1 gamma \( t \) bb(E) r_t^2 thin upright(d) t $ <crit:quadratic-identity>]

follows from $bb(E) r_t^2 = c^2 + integral_0^t bb(E) b_v^2 thin upright(d) v$ and Tonelli’s theorem.

=== 8.2 Duality and positive-energy uniqueness <duality-and-positive-energy-uniqueness>

For fixed $chi$, quadratic duality replaces the PDE value by a minimum over terminal force variables. Passing from $chi$ to its reciprocal $s$ then makes the susceptibility and terminal variable jointly convex. This change of variables is what allows two physical optimizers to be compared on the Wiener space just fixed.

#thm([Proposition 8.1.])[
  (Joint martingale formulation).  #emph[For an original susceptibility $chi$ with $Delta > 0$, the functional in (7.3) equals the minimum over $R gt.eq 0$ in $L^2 \( cal(F)_1 \)$ of 
#[#set math.equation(numbering: n => "(8.3)")
 $ J_(alpha \, 1) \( R \, s \) = alpha bb(E) [R \( 1 + B_1 \) + 1 / 2 R^2] + alpha / 2 [frac(c^2, s \( 0 \)) + integral_0^1 frac(bb(E) b_t^2, s \( t \)) thin upright(d) t] + 1 / 2 integral_0^1 s \( t \) thin upright(d) t . $ <eq:src18>]

 This minimizer is unique for fixed $s$.]
] <crit:duality>

#proof[
  Use gap coordinates $h = 1 + z$ and write $f \( t \, h \) = g \( t \, h - 1 \)$ and $a = f_h$. The zero-temperature equation and forward diffusion are
  $ f_t + 1 / 2 f_(h h) + 1 / 2 gamma f_h^2 = 0 \, quad f \( 1 \, h \) = - frac(h_(-)^2, 2 \( 1 + Delta \)) \, #h(2em) H_t = 1 + B_t + integral_0^t gamma \( v \) a \( v \, H_v \) thin upright(d) v \, $
  where $h_(-) = max { - h \, 0 }$. The coefficient is time integrable; $a$ has linear growth and an integrable Lipschitz constant after multiplication by $gamma$. The diffusion therefore has finite second moments. Itô’s formula, first on $\[ 0 \, T \]$ and then with $T arrow.t 1$, gives
  $ f \( 0 \, 1 \) = bb(E) [- frac(\( H_1 \)_(-)^2, 2 \( 1 + Delta \)) - 1 / 2 integral_0^1 gamma \( t \) a \( t \, H_t \)^2 thin upright(d) t] . $
  For every nonnegative $R$, the pointwise quadratic dual inequality is
  $ - frac(h_(-)^2, 2 \( 1 + Delta \)) lt.eq R h + frac(1 + Delta, 2) R^2 . $
  Insert $h = H_1$, condition $R$ against $cal(F)_t$ in the drift term, and use $r_t a - a^2 \/ 2 lt.eq r_t^2 \/ 2$. This proves
  $ f \( 0 \, 1 \) lt.eq bb(E) [R \( 1 + B_1 \) + frac(1 + Delta, 2) R^2] + 1 / 2 integral_0^1 gamma \( t \) bb(E) r_t^2 thin upright(d) t . $
  For $R = a \( 1 \, H_1 \) = \( H_1 \)_(-) \/ \( 1 + Delta \)$ the differentiated equation makes $a \( t \, H_t \)$ a square-integrable martingale with terminal value $R$. Consequently $r_t = a \( t \, H_t \)$, and both inequalities are equalities. Equation (8.2) proves the claimed formula. Strict convexity of $bb(E) R^2 \/ 2$ proves uniqueness for fixed $s$. All uses of Itô’s formula can be justified with smooth terminal data and bounded smooth coefficients; the curvature and growth bounds above dominate the terms when those approximations are removed. ◻
]

#thm([Lemma 8.2.])[
  (Convexity and its equality cases).  #emph[The set of admissible $s$ is convex, as is its normalized part $s \( 0 \) = 1$. The functional $J_(alpha \, lambda)$ is jointly convex in $\( R \, s \)$. If two pairs attain equality in this convexity inequality at a nontrivial convex combination, then 
#[#set math.equation(numbering: n => "(8.4)")
 $ frac(c_1, s_1 \( 0 \)) = frac(c_2, s_2 \( 0 \)) \, #h(2em) frac(b_(1 \, t), s_1 \( t \)) = frac(b_(2 \, t), s_2 \( t \)) quad upright("for ") upright(d) t ⊗ bb(P) upright("-almost every ") \( t \, omega \) . $ <crit:perspective-equality>]

 If $lambda > 0$, equality also forces $R_1 = R_2$ in $L^2$.]
] <crit:convexity>

#proof[
  For $0 < q < 1$, the reciprocal of $q s_1 + \( 1 - q \) s_2$ is the weighted harmonic mean $sans(H) \( x \, y \) = \( q \/ x + \( 1 - q \) \/ y \)^(- 1)$ evaluated at $\( chi_1 \, chi_2 \)$. This function is increasing in each coordinate and concave on the positive quadrant: differentiation gives a negative semidefinite Hessian. Hence $sans(H) \( chi_1 \( t \) \, chi_2 \( t \) \)$ is concave and nonincreasing in $t$. It extends continuously to the endpoint, and its negative derivative is nonnegative, nondecreasing, and integrable. Integrability of the new $s$ is immediate from its definition as a convex combination. The same argument preserves $L^2$ integrability and the normalization.
  For a real Hilbert space $cal(H)$, the perspective $\( x \, u \) mapsto parallel x parallel_(cal(H))^2 \/ u$, $u > 0$, is convex. Its convexity defect vanishes exactly when $x_1 \/ u_1 = x_2 \/ u_2$. Apply this once with $cal(H) = bb(R)$ to $c$, and for almost every $t$ with $cal(H) = L^2 \( Omega \)$ to $b_t$. Integration preserves nonnegative defects, so equality in the sum implies the asserted almost-everywhere equalities. The remaining terms are linear, except for $alpha lambda bb(E) R^2 \/ 2$, whose strict convexity gives the last assertion. ◻
]

#thm([Corollary 8.3.])[
  (Uniqueness in the UNSAT phase).  #emph[At each fixed $alpha > alpha_c$ the minimizing physical susceptibility in (7.3) is unique. Thus the entire zero-temperature endpoint law in (7.5), including its restriction to positive gaps, is unique.]
] <crit:unsat-unique>

#proof[
  Two minimizing pairs have the same $R$ and therefore the same $c$ and $b$. For a PDE optimizer, $b_t = f_(h h) \( t \, H_t \) < 0$ almost surely for $t < 1$. To see the strict inequality, the curvature is nonpositive, and its differentiated diffusion representation propagates the strictly negative terminal curvature on $\( - oo \, 0 \)$. On every interval ending before time $1$ the drift is Lipschitz, its flow derivative is positive, and the diffusion has positive probability of reaching that interval. Equivalently the strong maximum principle applied after smoothing gives strict negativity; the representation retains strictness on removing the smoothing. Equality in (8.4) therefore gives $s_1 = s_2$ almost everywhere, hence everywhere before the endpoint by continuity. Their continuous susceptibilities have the same endpoint value as well. The PDE and its forward diffusion are then identical. The subsequential description in (7.5) consequently has only one possible limit. ◻
]

=== 8.3 Normalization and compactness at the threshold <normalization-and-compactness-at-the-threshold>

The initial physical susceptibility $macron(chi) \( 0 \)$ diverges as the density decreases to the threshold. Normalize that value before taking the limit. Use bars for the fixed-density quantities in (7.3): $macron(gamma) = - macron(chi)'$, $macron(Delta) = macron(chi) \( 1 \)$, $macron(f) \( t \, h \) = g \( t \, h - 1 \)$, and $macron(a) = macron(f)_h$. The dual optimizer is $macron(R) = macron(a) \( 1 \, H_1 \) = \( h^(*) \)_(-)$ by (7.5). Put $L = macron(chi) \( 0 \)$ and define

$ lambda & = L^(- 1) \, & chi & = L^(- 1) macron(chi) \, & s & = L \/ macron(chi) \,\
gamma & = L^(- 1) macron(gamma) \, & Delta & = L^(- 1) macron(Delta) \, & R & = L macron(R) \,\
f & = L macron(f) \, & a & = L macron(a) . &  & $

Hence $chi \( 0 \) = s \( 0 \) = 1$, the terminal condition is $f \( 1 \, h \) = - h_(-)^2 \/ \[ 2 \( lambda + Delta \) \]$, and the physical residual is $lambda R$. The state process $H$ is unchanged on each Brownian path: its drift satisfies $gamma a = macron(gamma) macron(a)$. Below $chi \, gamma \, Delta \, f \, a \, R$ denote these normalized quantities.

Multiplying the original functional by $L$ gives $J_(alpha \, lambda)$. Thus the normalized physical pair minimizes this functional among normalized pairs at the fixed value $lambda = L^(- 1)$. Write $macron(s) = 1 \/ macron(chi)$. Moreover

#[#set math.equation(numbering: n => "(8.5)")
 $ J_(alpha \, lambda) \( R \, s \) = - frac(e \( alpha \), lambda) \, #h(2em) integral_0^1 s \( t \)^2 thin upright(d) t = alpha bb(E) R^2 = frac(2 e \( alpha \), lambda^2) . $ <eq:src19>]

Indeed, variation of the original $macron(Delta) > 0$ in both directions, with $macron(R)$ fixed in (8.3), yields $integral macron(s)^2 = alpha bb(E) macron(R)^2$. The second-moment identity for the physical residual in Section 7 says $alpha bb(E) macron(R)^2 = 2 e \( alpha \)$. These identities give (8.5) after normalization. Here optimality is initially over $Delta > 0$. It extends to the admissible normalized class with $Delta = 0$ by replacing $chi$ with $\( chi + eta \) \/ \( 1 + eta \)$ and keeping $R$ fixed: the quadratic terms converge by domination and the entropy by monotone convergence followed by the factor $1 + eta$.

The spectral and residual estimates in Lemma 40 and Corollary 41 give, uniformly as $alpha arrow.b alpha_c$:

#[#set math.equation(numbering: n => "(8.6)")
 $ lambda asymp sqrt(e \( alpha \)) arrow.r 0 \, #h(2em) integral_0^1 s^2 + bb(E) R^2 lt.eq C \, #h(2em) 0 < c_0 lt.eq bb(E) R lt.eq C_0 . $ <crit:imported-bounds>]

The contact-count limit and the two logarithmic cutoff bounds will enter only when we identify the endpoint masses. For compactness we need only (8.6). In particular we do not assume a critical power law or an endpoint boundary condition for $chi$.

#thm([Proposition 8.4.])[
  (Existence of a normalized critical pair).  #emph[The functional $J_(alpha_c \, 0)$ is nonnegative on the whole admissible class, without a normalization constraint. Every sequence of normalized physical pairs with $alpha_n arrow.b alpha_c$ has a subsequence such that 
$ chi_n arrow.r chi upright(" uniformly on every ") \[ 0 \, T \] \, med T < 1 \, #h(2em) R_n harpoon.rt R upright(" in ") L^2 \( cal(F)_1 \) . $

 Its limit is normalized, satisfies $s in L^2 \( 0 \, 1 \)$ and $c gt.eq c_0$, and attains $J_(alpha_c \, 0) \( R \, s \) = 0$.]
] <crit:compactness>

We will prove uniqueness for the limits supplied by this proposition. That conclusion concerns physical limits; it will not require a classification of all admissible zero-value pairs.

#proof[
  #emph[Nonnegativity of the limiting functional.] First suppose $Delta > 0$. For $A > 0$, direct substitution gives the exact homogeneity identity
  #[#set math.equation(numbering: n => "(8.7)")
   $ A J_(alpha \, 1) \( R \/ A \, s \/ A \) = J_(alpha \, 0) \( R \, s \) + frac(alpha, 2 A) bb(E) R^2 . $ <crit:homogeneity>]
  The reciprocal of $s \/ A$ is $A chi$, so this is an admissible zero-temperature trial. At $alpha_c$, zero ground energy and Proposition 44 make its value nonnegative. Letting $A arrow.r oo$ proves the assertion. If $Delta = 0$, replace $chi$ by $chi + eta$. The quadratic term converges by dominated convergence, while $1 \/ \( chi + eta \) arrow.t 1 \/ chi$; let $eta arrow.b 0$.
  #emph[Compactness on the common space.] Normalization and concavity give $1 gt.eq chi_n \( t \) gt.eq 1 - t$. On each $\[ 0 \, T \]$ their slopes are bounded by a constant depending only on $T$: monotonicity of $gamma_n$ gives $gamma_n \( t \) lt.eq \( 1 - t \)^(- 1)$. Arzelà–Ascoli and a diagonal selection give the stated local uniform convergence. The limit is concave and nonincreasing; its continuous endpoint value is $Delta = lim_(t arrow.t 1) chi \( t \)$, which is not initially identified with $lim_n chi_n \( 1 \)$. Its derivative gives an admissible integrable $gamma = - chi'$. At differentiability points of $chi$, the concavity inequalities imply $gamma_n arrow.r gamma$; the same local bound then gives $L^1 \( 0 \, T \)$ convergence for every $T < 1$. Fatou’s lemma gives $s in L^2$.
  The bound on $R_n$ gives a weakly convergent subsequence on the fixed Wiener space. The cone of nonnegative $L^2$ variables is weakly closed. Martingale representation, being a bounded linear isometry after the constant component is included, gives weak convergence of $b_n$ and convergence of $c_n$. In particular $c gt.eq c_0$.
  #emph[Passage to the minimum.] For each $T < 1$, uniform convergence of the positive weights $chi_n$ on $\[ 0 \, T \]$ and weak convergence of $b_n$ imply
  $ integral_0^T chi \( t \) bb(E) b_t^2 thin upright(d) t lt.eq liminf_n integral_0^T chi_n \( t \) bb(E) b_(n \, t)^2 thin upright(d) t . $
  Let $T arrow.t 1$ for the corresponding global lower semicontinuity. In contrast the entropy term actually converges: local convergence of $s_n$ combines with $integral_T^1 s_n lt.eq C sqrt(1 - T)$ from (8.6). The linear term converges weakly, and $lambda_n bb(E) R_n^2 arrow.r 0$. Equations (8.5) and (8.6) therefore give
  $ J_(alpha_c \, 0) \( R \, s \) lt.eq liminf_n J_(alpha_n \, lambda_n) \( R_n \, s_n \) = 0 . $
  Nonnegativity proves equality. ◻
]

=== 8.4 Interior PDE representation <interior-pde-representation>

A weak terminal limit need not by itself retain the PDE representation. We now recover that representation before comparing two critical limits. The strict curvature and the time regularity proved here will make the common-noise uniqueness argument possible.

For the normalized physical pairs use gap coordinates and denote the scaled PDE by $f_n$. Its equation and terminal data are

$ \( f_n \)_t + 1 / 2 \( f_n \)_(h h) + 1 / 2 gamma_n \( t \) \( f_n \)_h^2 = 0 \, #h(2em) f_n \( 1 \, h \) = - frac(h_(-)^2, 2 \( lambda_n + chi_n \( 1 \) \)) . $

Write $a_n = \( f_n \)_h$. The comparison estimates below control the terminal error uniformly as the density changes. They will also specify the boundary condition of the critical equation if $chi \( 1 \) = 0$:

#[#set math.equation(numbering: n => "(8.8)")
 $ - s_n \( t \) lt.eq - frac(1, lambda_n + chi_n \( t \)) lt.eq \( a_n \)_h \( t \, h \) lt.eq 0 \, #h(2em) a_n gt.eq 0 \, #h(2em) \( a_n \)_(h h) gt.eq 0 \,\
lr(|f_n \( t \, h \) + frac(h_(-)^2, 2 \( lambda_n + chi_n \( t \) \))|) lt.eq 1 / 2 integral_t^1 s_n \( v \) thin upright(d) v \,\
lr(|a_n \( t \, h \) - frac(h_(-), lambda_n + chi_n \( t \))|) lt.eq C sqrt(s_n \( t \) integral_t^1 s_n \( v \) thin upright(d) v) . $ <eq:src20>]

#thm([Lemma 8.5.])[
  (Interior limits and strict curvature).  #emph[For each subsequence in Proposition 47, $f_n$ and $a_n$ converge locally uniformly on $\[ 0 \, 1 \) times bb(R)$ to functions $f$ and $a = f_h$ determined by $chi$. They satisfy (8.8) with $lambda_n + chi_n$ replaced by $chi$. They are smooth in the spatial variable in the interior and locally Lipschitz in time there, together with each spatial derivative used below. For $t < 1$, 
$ f_(h h) \( t \, h \) < 0 \, #h(2em) f_(h h h) \( t \, h \) > 0 \, #h(2em) lim_(h arrow.r + oo) a \( t \, h \) = 0 . $

 On the common Wiener space the limiting martingale and diffusion obey 
#[#set math.equation(numbering: n => "(8.9)")
 $ H_t = 1 + B_t + integral_0^t gamma \( v \) r_v thin upright(d) v \, #h(2em) r_t = a \( t \, H_t \) \, #h(2em) b_t = f_(h h) \( t \, H_t \) \, #h(2em) t < 1 . $ <eq:src21>]

 Both $H_t$ and $r_t$ extend continuously and in $L^2$ to $t = 1$, with $r_1 = R$.]
] <crit:pde>

#proof[
  #emph[Comparison estimates.] The curvature bounds are parabolic comparison bounds. Specifically, if $b = \( f_n \)_(h h)$, then $b_t + 1 / 2 b_(h h) + gamma_n a_n b_h + gamma_n b^2 = 0$. The spatially constant function $- \( lambda_n + chi_n \( t \) \)^(- 1)$ solves this equation, and zero is the upper comparison solution. Differentiating once more gives the linear equation $d_t + 1 / 2 d_(h h) + gamma_n a_n d_h + 3 gamma_n b d = 0$ for $d = \( f_n \)_(h h h)$, which preserves nonnegativity backwards from the convex terminal derivative. These comparisons follow first for smooth terminal data and smooth coefficients; the bounds survive approximation. The first-order solution is $q_n \( t \, h \) = - h_(-)^2 \/ \( 2 \( lambda_n + chi_n \( t \) \) \)$. Its missing diffusion term is bounded in absolute value by $s_n \( t \) \/ 2$. Comparison with $q_n plus.minus 1 / 2 integral_t^1 s_n$ proves the value bound. The derivative bound follows by taking secants of length $sqrt(\( integral_t^1 s_n \) \/ s_n \( t \))$ and using the curvature bound; the zero-length limiting case is immediate.
  #emph[Convergence with a terminal cutoff.] At a fixed cutoff $T < 1$ the value estimates compare $f_n \( T \, dot.op \)$ and $f_m \( T \, dot.op \)$ with quadratic functions whose coefficients converge. The error left after this quadratic comparison is bounded uniformly in space by $C sqrt(1 - T)$, uniformly in $n \, m$. On $\[ 0 \, T \]$, the difference $w = f_n - f_m$ solves a linear equation with drift $gamma_n \( a_n + a_m \) \/ 2$ and source $\( gamma_n - gamma_m \) a_m^2 \/ 2$. The drift has uniformly bounded Lipschitz and linear-growth constants on that interval, and its diffusion has uniformly bounded second moments on bounded starting sets. Its Feynman–Kac representation propagates a constant terminal error without amplification. The quadratic terminal error tends to zero at fixed $T$, as does the source error because $gamma_n arrow.r gamma$ in $L^1 \( 0 \, T \)$. For each fixed $T$, first let $n \, m arrow.r oo$: only the constant terminal error remains, bounded on every earlier compact set by $C sqrt(1 - T)$. Then let $T arrow.t 1$. This proves the Cauchy property and shows that the limit depends only on $chi$. Curvature bounds and secants give convergence of the first derivatives.
  #emph[Regularity for a measurable time coefficient.] On a compact time interval ending strictly before $1$, $gamma$ is bounded. We need spatial smoothness and local time-Lipschitz bounds, including at jumps of $gamma$, for the inverse-curvature map used below. We give the regularity argument in a form that does not require continuity of this coefficient in time. Reverse time and multiply $a$ by smooth space and time cutoffs supported in a larger interior rectangle, with the time cutoff zero at its initial edge. The resulting inhomogeneous heat equation has bounded source: the nonlinear term is $gamma a a_h$, and the cutoff terms involve only $a$ and $a_h$, already bounded on that rectangle. For the heat semigroup $P_u$, differentiation of the Gaussian kernel gives
  $ parallel partial_h P_u F parallel_oo lt.eq C u^(- 1 \/ 2) parallel F parallel_oo \, #h(2em) parallel partial_(h h) P_u F parallel_oo lt.eq C_eta u^(- 1 + eta \/ 2) \[ F \]_(C_h^eta) \, quad 0 < eta < 1 . $
  The second estimate uses the zero integral of the differentiated kernel to subtract $F \( h \)$. The first estimate and its spatial increment version in Duhamel’s formula give a uniform spatial $C^(1 \, eta)$ bound for every $eta < 1$: splitting the time integral at the square of the spatial increment bounds the gradient increment by a constant times $\| z \| \( 1 + \| log \| z \| \| \)$. The source is therefore spatially $C^eta$. The second displayed estimate is integrable at $u = 0$ and yields $C^(2 \, eta')$ on a smaller rectangle for $0 < eta' < eta$. More generally, if $a$ is already bounded in $C_h^(m \, eta)$, $m gt.eq 1$, then the localized source is bounded in $C_h^(m - 1 \, eta)$: its derivatives of order $m - 1$ use derivatives of $a$ of order at most $m$. Apply the second heat-kernel estimate to $partial_h^(m - 1) F$ to obtain $C_h^(m + 1 \, eta')$ on a smaller rectangle. This induction uses no derivative of $a$ that it is trying to establish. It gives every spatial derivative on nested interior rectangles. Multiplication by the bounded function $gamma \( t \)$ preserves all spatial Hölder bounds, so this bootstrap is valid for measurable time coefficients. Smooth coefficient approximation justifies the intermediate differentiations with these same bounds. Finally the PDE bounds the almost-everywhere time derivative of every spatial derivative on smaller rectangles. This gives the claimed local time-Lipschitz property, including across jumps of $gamma$. The uniform spatial Hölder and time-Lipschitz bounds make these derivatives jointly continuous. At the start of this argument the source uses the bounded weak derivative $a_h$ supplied by the curvature estimate; the distributional PDE passes from $a_n$ by local uniform convergence and $L^1$ convergence of $gamma_n$. Thus the initial Duhamel representation does not presume smoothness.
  #emph[Strict curvature and identification of the martingale.] The value bound on $h > 0$ and $a gt.eq 0$ imply $a \( t \, h \) arrow.r 0$ as $h arrow.r + oo$. On the negative half-line, (8.8) makes $a$ unbounded. Thus $a$ is not affine, its nonnegative second derivative is nontrivial at every later interior time, and its nonpositive first derivative is nontrivial there. The strong maximum principle, on an interval between two strictly interior times, gives $f_(h h h) > 0$ and $f_(h h) < 0$ at the earlier time.
  The coupled forward diffusions converge in $L^2$ uniformly on each compact time interval, by the local gradient convergence, $L^1$ convergence of $gamma_n$, and the common linear-growth bounds. For precision, those deterministic growth bounds and Gronwall’s inequality give uniformly bounded moments of every fixed finite order for $sup_(t lt.eq T) \| H_(n \, t) \|$ and $sup_(t lt.eq T) \| a_n \( t \, H_(n \, t) \) \|$, for each $T < 1$. The fourth-moment bound permits spatial localization to be removed in $L^2$ after the coupled convergence is proved on bounded sets. Consequently $a_n \( t \, H_(n \, t) \) arrow.r a \( t \, H_t \)$ strongly in $L^2$ for every $t < 1$. But $a_n \( t \, H_(n \, t) \) = bb(E) \[ R_n divides cal(F)_t \]$ converges weakly to $bb(E) \[ R divides cal(F)_t \]$. This identifies $r_t$; Itô’s formula identifies $b_t = f_(h h) \( t \, H_t \)$ and proves (8.9). Finally Doob’s inequality gives $bb(E) sup_(t lt.eq 1) \| r_t \|^2 lt.eq 4 bb(E) R^2$. Since $gamma in L^1$, the drift integral in (8.9) converges both almost surely and in $L^2$ at $1$. The martingale itself has its continuous $L^2$ extension with terminal value $R$. ◻
]

=== 8.5 Uniqueness at zero energy <uniqueness-at-zero-energy>

#thm([Proposition 8.6.])[
  (Uniqueness of the normalized critical limit).  #emph[Any two subsequential limits supplied by Proposition 47 coincide on the common Wiener space. In particular the normalized susceptibility and the law of $\( H_1 \, R \)$ are independent of the density sequence.]
] <crit:unique-critical>

#proof[
  #emph[Equality identifies the normalized curvatures along the states.] Both pairs minimize the globally nonnegative critical functional. Their midpoint is admissible and also has value zero. Lemma 45 and $s_i \( 0 \) = 1$ yield $c_1 = c_2 = : c > 0$ and $chi_1 b_1 = chi_2 b_2$ almost everywhere. Put $k_i \( t \, h \) = - chi_i \( t \) \( f_i \)_(h h) \( t \, h \)$. The proof uses this matched normalized curvature to express one state process as a deterministic transform of the other. Their common Brownian noise forces the transform to have spatial derivative one; the common martingale mean then identifies the susceptibilities. Interior continuity upgrades the curvature identity to
  $ k_1 \( t \, H_(1 \, t) \) = k_2 \( t \, H_(2 \, t) \) \, #h(2em) 0 < t < 1 \, $
  on a single event of probability one. Each $k_i \( t \, dot.op \)$ is strictly decreasing with strictly negative derivative by Lemma 48. Each $H_(i \, t)$ has full support in $bb(R)$: on every interior compact time interval its additive-noise diffusion has locally bounded Lipschitz drift, and localized Girsanov equivalence, or the Brownian support property followed by continuity of the solution map, reaches every open interval. Thus the support of $k_i \( t \, H_(i \, t) \)$ is the closure of the range of $k_i \( t \, dot.op \)$. Equality of their laws identifies the two ranges, which are open intervals. We may therefore define
  $ Psi \( t \, h \) = k_2 \( t \, dot.op \)^(- 1) \( k_1 \( t \, h \) \) \, #h(2em) H_(2 \, t) = Psi \( t \, H_(1 \, t) \) . $
  These inverse functions have uniform local bounds. At a fixed $\( t_0 \, h_0 \)$ put $y_0 = Psi \( t_0 \, h_0 \)$. Strict decrease gives
  $ k_2 \( t_0 \, y_0 - 1 \) > k_1 \( t_0 \, h_0 \) > k_2 \( t_0 \, y_0 + 1 \) . $
  Joint continuity preserves these inequalities on a neighborhood of $\( t_0 \, h_0 \)$, trapping $Psi$ between $y_0 - 1$ and $y_0 + 1$. Compactness and uniqueness of the inverse give continuity there. The negative derivative of $k_2$ is bounded away from zero on a slightly smaller compact rectangle. The implicit derivative $Psi_h \( t \, h \) = \( k_1 \)_h \( t \, h \) \/ \( k_2 \)_h \( t \, Psi \( t \, h \) \)$ is therefore jointly continuous, all needed spatial derivatives are bounded locally, and the mean-value theorem with the time-Lipschitz bounds on $k_1 \, k_2$ proves a uniform local time-Lipschitz bound on $Psi$. Finite covers give the same assertions on every compact subset of $\( 0 \, 1 \) times bb(R)$.
  #emph[The common noise forces a spatial translation.] Taking quadratic covariations with the driving Brownian motion on an arbitrary interval $\[ u \, t \] subset \( 0 \, 1 \)$ gives
  $ t - u = \[ H_2 \, B \]_t - \[ H_2 \, B \]_u = integral_u^t Psi_h \( v \, H_(1 \, v) \) thin upright(d) v . $
  This chain rule needs no continuous time derivative. After localization, the temporal increments in a partition contribute at most $C sum Delta t thin \| Delta B \|$, which tends to zero. The spatial Taylor remainders contribute at most $C max \| Delta B \| sum \| Delta H_1 \|^2$, which tends to zero in probability, since quadratic-variation sums of a continuous semimartingale are tight. The first-order sums give the displayed integral. Rational interval endpoints and continuity give all these identities on one event of probability one. It follows that $Psi_h \( t \, H_(1 \, t) \) = 1$ for almost every time, almost surely. Full support gives $Psi_h \( t \, h \) = 1$ for every $h$ at almost every $t$; continuity extends it to every interior $t$. Hence $Psi \( t \, h \) = h + d \( t \)$.
  #emph[The martingale mean identifies the susceptibility.] The equality of $k$’s now holds for all $h$. Integrate the matched curvatures from $h$ to $+ oo$, using gradient decay there, to obtain
  $ chi_1 \( t \) a_1 \( t \, h \) = chi_2 \( t \) a_2 \( t \, h + d \( t \) \) . $
  Along the states this gives $chi_1 r_(1 \, t) = chi_2 r_(2 \, t)$. Taking expectations yields $c chi_1 = c chi_2$, so $chi_1 = chi_2$. The PDE is determined by $chi$, and the two forward diffusions have the same initial condition and Brownian motion. They agree, and their martingales, including their $L^2$ terminal values, agree as well. ◻
]

=== 8.6 Variational conditions and the vanishing endpoint mass <variational-conditions-and-the-vanishing-endpoint-mass>

From now on, “the critical pair” means the unique limit of the normalized physical optimizers just constructed. To reach the endpoint we must show that $Delta = chi \( 1 \)$ vanishes. The convergence so far is local in time: even a vanishing sequence of endpoint values $chi_n \( 1 \)$ would not exclude mass of $gamma_n$ concentrating near 1. We instead use optimality of the critical pair in the full admissible class.

The first-order conditions are expressed by the stationarity defect $J \( t \)$ and its integral $K \( t \)$, defined by

$ P \( t \) = alpha_c bb(E) r_t^2 \, #h(2em) I \( t \) = integral_0^t s \( v \)^2 thin upright(d) v \, #h(2em) J \( t \) = P \( t \) - I \( t \) \, #h(2em) K \( t \) = integral_t^1 J \( v \) thin upright(d) v . $

The quantity $K \( t \) \/ 2$ is the directional derivative for the admissible positive variation $gamma mapsto gamma + epsilon upright(bold(1))_(\[ t \, 1 \))$, as proved below. Here $J \( t \)$ is a function of time, distinct from the joint functional $J_(alpha \, lambda)$, and $P \, I \, J$ extend continuously to $1$. In the interior, $P' = alpha_c bb(E) b_t^2$ is continuous. Choose the right-continuous nondecreasing representative of $gamma$. Let $nu = upright(d) gamma$ denote the nonnegative Stieltjes measure on $\[ 0 \, 1 \)$ with $nu \( \[ 0 \, t \] \) = gamma \( t \)$; this convention includes a possible initial value of $gamma$ as an atom at zero.

#thm([Lemma 8.7.])[
  (Complete first-order conditions).  #emph[The critical pair satisfies 
#[#set math.equation(numbering: n => "(8.10)")
 $ H_1 + Delta R gt.eq 0 \, #h(2em) R \( H_1 + Delta R \) = 0 quad upright("almost surely") \,\
K \( t \) gt.eq 0 quad \( 0 lt.eq t lt.eq 1 \) \, #h(2em) integral_0^1 gamma \( t \) J \( t \) thin upright(d) t = integral_(\[ 0 \, 1 \)) K \( t \) thin nu \( upright(d) t \) = 0 . $ <crit:complementarity>]

 The profile $gamma$ vanishes on an initial interval. At every interior point of $"supp" nu$ one has $J = 0$ and $J' lt.eq 0$; at every non-isolated such point, $J' = 0$. Finally $J \( 1 \) = 0$.]
] <crit:kkt>

#proof[
  The critical pair minimizes without normalization, since its value is the global lower bound zero. By (8.2), the Fréchet derivative in $R$ is the $L^2$ variable $alpha_c \( H_1 + Delta R \)$. Explicitly the quadratic operator is
  $ cal(A) Q = Delta Q + integral_0^1 gamma \( t \) bb(E) \[ Q divides cal(F)_t \] thin upright(d) t \, #h(2em) parallel cal(A) parallel_(L^2 arrow.r L^2) lt.eq chi \( 0 \) . $
  Conditional expectations are self-adjoint contractions, so $cal(A)$ is bounded and self-adjoint; the functional’s gradient is $alpha_c \( 1 + B_1 + cal(A) R \)$, as asserted. In particular $parallel H_1 parallel_2 lt.eq 1 + parallel B_1 parallel_2 + parallel gamma parallel_1 parallel R parallel_2$ also when $Delta = 0$. Minimization on the nonnegative cone means that this variable is nonnegative and has zero pairing with $R$; these are exactly (8.10).
  Adding $epsilon upright(bold(1))_(\[ t \, 1 \))$ to $gamma$ is an admissible positive variation. Its susceptibility increment at $v$ is $epsilon \( 1 - max { t \, v } \)$, bounded by $epsilon chi \( v \) \/ chi \( 0 \)$ by concavity. Differentiating the entropy term is therefore justified by domination: if $q \( v \) = 1 - max { t \, v }$, its difference quotient is bounded by $s \( v \) \/ chi \( 0 \)$ for the positive variations used here. For scaling $gamma$, the susceptibility increment is $q = chi - Delta lt.eq chi$, and the difference quotient is bounded by $2 s$ for $\| epsilon \| < 1 \/ 2$. Both bounds require only $s in L^1$. Tonelli’s theorem in the quadratic term gives the directional derivative $K \( t \) \/ 2$. This proves $K gt.eq 0$. Scaling $gamma$ by $1 + epsilon$ permits either sign for small $epsilon$, and gives $integral gamma J = 0$. Fubini gives $integral gamma J = integral K thin upright(d) nu$: its absolute version is bounded by $parallel J parallel_oo integral gamma < oo$. Equivalently the Stieltjes boundary term at $1$ vanishes because $K \( t \) = O \( 1 - t \)$ and $\( 1 - t \) gamma \( t \) arrow.r 0$. Thus $K$ vanishes on $"supp" nu$.
  Since $J \( 0 \) = alpha_c c^2 > 0$ and $K' = - J$, nonnegativity of $K$ forces $K \( 0 \) > 0$. Hence $nu$ vanishes on an initial interval, including its possible atom at zero. An interior support point is a local minimum of the nonnegative $C^2$ function $K$, so $J = 0$ and $J' lt.eq 0$. At a non-isolated support point, differentiability of $J$ and nearby zeros give $J' = 0$.
  If $Delta > 0$, two-sided variation of $Delta$ gives $0 = \( P \( 1 \) - I \( 1 \) \) \/ 2$. If $Delta = 0$ and the support did not accumulate at $1$, then $gamma$ would be constant on a final interval and $chi \( t \)$ would be a positive constant times $1 - t$. This contradicts $s in L^2$. Thus in this case interior support points approach $1$, and continuity of $J$ again gives $J \( 1 \) = 0$. ◻
]

#thm([Proposition 8.8.])[
  (No critical endpoint susceptibility).  #emph[The critical susceptibility satisfies $Delta = 0$. Its increase measure $nu$ accumulates at $1$, and with $k = - chi f_(h h)$ one has, at every interior support point, 
#[#set math.equation(numbering: n => "(8.11)")
 $ alpha_c bb(E) k \( t \, H_t \) = 1 + alpha_c c chi \( t \) \, #h(2em) alpha_c bb(E) k \( t \, H_t \)^2 lt.eq 1 . $ <eq:src22>]

 The second inequality is an equality at non-isolated interior support points.]
] <crit:no-endpoint>

#proof[
  Introduce $W \( t \) = s \( t \) + alpha_c bb(E) b_t$. The curvature equation along the forward diffusion gives $frac(upright(d), upright(d) t) bb(E) b_t = - gamma \( t \) bb(E) b_t^2$ almost everywhere. Since $s' = gamma s^2$, we have $W' = - gamma J'$. The Stieltjes product rule and $J thin upright(d) gamma = 0$ now give
  #[#set math.equation(numbering: n => "(8.12)")
   $ W \( t \) = W \( 0 \) - gamma \( t \) J \( t \) quad upright("almost everywhere") \, #h(2em) integral_0^1 W \( t \) thin upright(d) t = W \( 0 \) . $ <crit:W-identity>]
  The initial constant uses the initial zero interval of $gamma$.
  Itô’s formula for $H_t r_t$ and (8.10) yield
  $ - Delta P \( 1 \) = alpha_c c + integral_0^1 #scale(x: 120%, y: 120%)[\(] gamma \( t \) P \( t \) + alpha_c bb(E) b_t #scale(x: 120%, y: 120%)[\)] thin upright(d) t . $
  Every term is integrable: $P$ is bounded, $gamma in L^1$, and $\| bb(E) b_t \| lt.eq s \( t \) in L^1$. The stochastic products are justified by localization and the $L^2$ maximal bounds for $H$ and $r$. Moreover (8.10) and integration by parts give
  $ integral_0^1 gamma P = integral_0^1 gamma I = integral_0^1 s - Delta I \( 1 \) . $
  Since $P \( 1 \) = I \( 1 \)$, these identities show
  #[#set math.equation(numbering: n => "(8.13)")
   $ W \( 0 \) = - alpha_c c < 0 . $ <crit:W0>]
  Suppose for contradiction that $Delta > 0$. Then $s lt.eq 1 \/ Delta$, and the value and derivative bounds in (8.8) give $a \( t \, h \) arrow.r h_(-) \/ Delta$ as $t arrow.t 1$, uniformly on bounded sets. Convex secant bounds give $f_(h h) \( t \, h \) arrow.r - upright(bold(1))_({ h < 0 }) \/ Delta$ locally away from zero. The endpoint $H_1$ has no atom at zero. Here is a direct justification: condition on the Brownian bridge and write $B_t = t Z + cal(B)_t$, where $Z$ has a Gaussian density independent of the bridge. The map $Z mapsto H_1$ is increasing, and its derivative is
  $ integral_0^1 exp {integral_u^1 gamma \( v \) a_h \( v \, H_v \) thin upright(d) v} upright(d) u gt.eq exp {- Delta^(- 1) integral_0^1 gamma} > 0 . $
  The estimate follows first by smoothing and then by the Lipschitz flow comparison. Thus the conditional endpoint law, and hence the unconditional one, is atom-free. With $p = bb(P) \( H_1 < 0 \)$, bounded convergence gives
  $ W \( 1 - \) = frac(1 - alpha_c p, Delta) \, #h(2em) J' \( 1 - \) = frac(alpha_c p - 1, Delta^2) . $
  Because $J \( 1 \) = 0$ and $J'$ is bounded when $Delta > 0$, $\| J \( t \) \| lt.eq C \( 1 - t \)$. Integrability and monotonicity of $gamma$ imply $gamma \( t \) J \( t \) arrow.r 0$. Hence (8.12)–(8.13) give $W \( 1 - \) = - alpha_c c < 0$, so $alpha_c p > 1$ and $J' \( 1 - \) > 0$. It follows that $J \( t \) < 0$, and therefore $K \( t \) < 0$, for $t$ sufficiently close to $1$. This contradicts Lemma 50.
  Thus $Delta = 0$, and the support accumulation follows from that lemma. At a support point $J = 0$, (8.12) and (8.13) give the first identity in (8.11). Although (8.12) was initially obtained almost everywhere, it applies here by continuity of $W$: approach the support point through times where that identity holds, and use local boundedness of $gamma$ and $J \( t \) arrow.r 0$. Multiplying $J' = alpha_c bb(E) b_t^2 - s^2 lt.eq 0$ by $chi^2$ gives the second. The equality statement follows from $J' = 0$ at non-isolated support points. ◻
]

=== 8.7 Strong convergence through the endpoint <strong-convergence-through-the-endpoint>

We have now identified the only possible weak limit and proved $chi \( 1 \) = 0$. The remaining analytic task is to strengthen convergence of the terminal force. A trial obtained by rescaling the critical minimizer bounds the physical normalization in terms of $alpha - alpha_c$; comparison at that normalization then yields convergence of the full $L^2$ norm. Positivity probabilities will be treated separately using the cutoff bounds.

#thm([Proposition 8.9.])[
  (Strong critical convergence).  #emph[As $alpha_n arrow.b alpha_c$, the normalized physical variables satisfy 
$ R_n arrow.r R upright(" in ") L^2 \, #h(2em) gamma_n arrow.r gamma upright(" in ") L^1 \( 0 \, 1 \) \, #h(2em) H_(n \, 1) arrow.r H_1 upright(" in ") L^2 . $

 The physical endpoint gap is $h_n^(*) = H_(n \, 1) + chi_n \( 1 \) R_n$, its residual is $\( h_n^(*) \)_(-) = lambda_n R_n$, and $h_n^(*) arrow.r H_1 gt.eq 0$ in $L^2$.]
] <crit:strong>

#proof[
  Use stars temporarily for the unique critical pair and put $S \( s \) = 1 / 2 integral_0^1 s$, $d_n = alpha_n - alpha_c$. The critical pair is a legitimate limiting normalized trial at any $lambda > 0$: replace $chi_(*)$ by $\( chi_(*) + eta \) \/ \( 1 + eta \)$, keep $R_(*)$ fixed, and send $eta arrow.b 0$. Its entropy and quadratic terms converge by domination and monotone convergence. Since its critical value is zero, its value at $\( alpha_n \, lambda \)$ is
  $ - d_n / alpha_c S_(*) + frac(alpha_n lambda, 2) bb(E) R_(*)^2 . $
  The original unnormalized trial has an additional factor $lambda$. Choosing $lambda = d_n S_(*) \/ \( alpha_c alpha_n bb(E) R_(*)^2 \)$ gives
  $ e \( alpha_n \) gt.eq frac(d_n^2 S_(*)^2, 2 alpha_c^2 alpha_n bb(E) R_(*)^2) . $
  Here $S_(*) > 0$ and $bb(E) R_(*)^2 > 0$, so (8.6) implies $lambda_n gt.eq c_1 d_n$.
  Compare now at the physical value $lambda_n$. Optimality and the same trial give
  #[#set math.equation(numbering: n => "(8.14)")
   $ (1 + d_n / alpha_c) J_(alpha_c \, 0) \( R_n \, s_n \) + frac(alpha_n lambda_n, 2) \( bb(E) R_n^2 - bb(E) R_(*)^2 \) lt.eq d_n / alpha_c \( S_n - S_(*) \) . $ <crit:strong-inequality>]
  The first term is nonnegative, $S_n arrow.r S_(*)$ by uniform integrability, and $d_n \/ lambda_n$ is bounded. Therefore $limsup bb(E) R_n^2 lt.eq bb(E) R_(*)^2$. Weak convergence and lower semicontinuity give the reverse inequality. The Hilbert-space identity for $parallel R_n - R_(*) parallel_2^2$ proves strong convergence. Uniqueness of all weak subsequential limits makes this conclusion valid for the original sequence.
  Local $L^1$ convergence of $gamma_n$ becomes global because $integral_T^1 gamma_n lt.eq chi_n \( T \) arrow.r chi \( T \)$, and $chi \( T \) arrow.b 0$ by Proposition 51. The same estimate gives $chi_n \( 1 \) arrow.r 0$. Doob’s inequality applied to $bb(E) \[ R_n - R divides cal(F)_t \]$ gives $L^2$ convergence uniformly in time of the martingales. In (8.9), split the drift difference into $gamma_n \( r_n - r \) + \( gamma_n - gamma \) r$. Conditional-expectation contraction and Minkowski’s inequality give the explicit bound
  $ ∥integral_0^1 \( gamma_n r_n - gamma r \) thin upright(d) t∥_2 lt.eq parallel gamma_n parallel_1 parallel R_n - R parallel_2 + parallel gamma_n - gamma parallel_1 parallel R parallel_2 arrow.r 0 . $
  Hence $H_(n \, 1) arrow.r H_1$ in $L^2$.
  The terminal dual optimizer satisfies $R_n = \( H_(n \, 1) \)_(-) \/ \( lambda_n + chi_n \( 1 \) \)$. On its positive half-line the physical gap equals $H_(n \, 1)$; on its negative half-line the proximal formula (7.5) gives $h_n^(*) = - lambda_n R_n$. These two cases are exactly $h_n^(*) = H_(n \, 1) + chi_n \( 1 \) R_n$. The asserted limits follow. Finally (8.10) with $Delta = 0$ gives $H_1 gt.eq 0$ and $R H_1 = 0$. ◻
]

=== 8.8 Contacts, atoms, and the prescribed order of limits <contacts-atoms-and-the-prescribed-order-of-limits>

Strong $L^2$ convergence preserves the first two moments, but a positive variable may still converge to zero. To identify contacts we therefore use both uniform cutoff estimates from Section 7: the force estimate preserves $bb(P) \( R > 0 \)$, and the positive-gap estimate identifies $bb(P) \( H_1 = 0 \)$. Only after these masses are known can we normalize the limiting force law.

#thm([Lemma 8.10.])[
  (Contact and noncontact mass).  #emph[At the critical pair, 
$ bb(P) \( R > 0 \) = bb(P) \( H_1 = 0 \) = 1 / alpha_c \, #h(2em) { R > 0 } = { H_1 = 0 } quad upright("modulo null sets") . $

]
] <crit:contacts>

#proof[
  Let $p_n = bb(P) \( R_n > 0 \)$. Corollary 41 gives $alpha_n p_n arrow.r 1$ and the direct cutoff bound
  $ lim_(u arrow.b 0) sup_n bb(P) \( 0 < R_n lt.eq u \) = 0 $
  after discarding a finite initial part of the density sequence. Apply strong convergence at positive continuity cutoffs and then send the cutoff to zero. This gives $bb(P) \( R > 0 \) = lim_n p_n = 1 \/ alpha_c$.
  Similarly the direct bound in (7.16), passed to the atomless endpoint law at each fixed UNSAT density, gives $lim_(u arrow.b 0) sup_n bb(P) \( 0 < h_n^(*) lt.eq u \) = 0$. Its constants and its upper cutoff are uniform in the density. This is a bound on the whole interval $\( 0 \, u \]$ at fixed density; no interchange between a lower gap cutoff and the density limit is used. At every positive continuity point $u$ of the law of $H_1$, the $L^2$ convergence $h_n^(*) arrow.r H_1$ gives convergence of the probabilities of $\( - oo \, u \]$. Subtracting the negative mass $p_n$ and then sending $u arrow.b 0$ proves $bb(P) \( H_1 = 0 \) = 1 \/ alpha_c$; fixed-density endpoint laws have no atom at zero, as established in (7.5). Complementarity gives the inclusion ${ R > 0 } subset { H_1 = 0 }$. Equality of their probabilities proves the final assertion. ◻
]

The contact atom at zero is now identified. To pass the microscopic observables at #emph[every] positive cutoff, we still need to exclude atoms away from zero. The two variables require different estimates: nondegeneracy in deterministic variance time for $R$, and a bounded state drift away from zero for $H_1$.

#thm([Lemma 8.11.])[
  (No positive atoms).  #emph[Neither $R$ nor $H_1$ has an atom at any strictly positive point.]
] <crit:no-positive-atoms>

#proof[
  #emph[The force variable.] Monotonicity of $s$ gives
  $ s \( t \) integral_t^1 s \( v \) thin upright(d) v lt.eq integral_t^1 s \( v \)^2 thin upright(d) v arrow.r 0 . $
  Thus (8.8) approximates $a \( t \, h \)$ by $s \( t \) h_(-)$ with an error $epsilon_t arrow.r 0$ uniformly in $h$. Fix $x > 0$. When $x \/ 2 lt.eq a \( t \, h \) lt.eq 2 x$ and $t$ is sufficiently close to $1$, one has $h < 0$ and $- h gt.eq \( x \/ 2 - epsilon_t \) \/ s \( t \)$. A forward secant of length $x \/ \( 8 s \( t \) \)$ stays negative. Convexity of $a$ gives
  $ a_h \( t \, h \) lt.eq - s \( t \) + 16 epsilon_t s \( t \) \/ x lt.eq - s \( t \) \/ 2 . $
  Consequently $1 \/ 2 lt.eq k \( t \, h \) lt.eq 1$ in that region, whereas $0 lt.eq k lt.eq 1$ globally.
  Change deterministic time to $v = I \( t \) = integral_0^t s^2$ and put $T = I \( 1 \) < oo$. The martingale $r$ then has Brownian coefficient $- k$: indeed, with $t \( v \) = I^(- 1) \( v \)$,
  $ tilde(B)_v = integral_0^(t \( v \)) s \( q \) thin upright(d) B_q \, #h(2em) upright(d) r_(t \( v \)) = frac(b_(t \( v \)), s \( t \( v \) \)) thin upright(d) tilde(B)_v = - k \( t \( v \) \, H_(t \( v \)) \) thin upright(d) tilde(B)_v . $
  The process $tilde(B)$ is Brownian in the filtration $cal(F)_(t \( v \))$, since its integrand and time change are deterministic and its quadratic variation is $v$. The coefficient has absolute value at most one and at least $1 \/ 2$ whenever $\| r - x \| lt.eq x \/ 2$ in a sufficiently short final time interval. For $eta > 0$ write $ell = T - v + eta^2$ and consider
  $ Phi \( v \, r \) = ell^(- zeta \/ 2) exp { - a_0 \( r - x \)^2 \/ ell } \, #h(2em) a_0 = 1 / 4 \, quad zeta = 1 / 16 . $
  Its drift divided by $Phi$ is
  $ frac(zeta \/ 2 - a_0 k^2, ell) + frac(\( - a_0 + 2 a_0^2 k^2 \) \( r - x \)^2, ell^2) . $
  On $\| r - x \| lt.eq x \/ 2$ both terms are nonpositive. Off this interval the second is at most $- x^2 \/ \( 32 ell^2 \)$ and the first at most $1 \/ \( 32 ell \)$, so their sum is nonpositive when $ell lt.eq x^2$. Choose $delta > 0$ so that $v_0 = T - delta$ lies in that final region and $2 delta lt.eq x^2$. For $eta^2 lt.eq delta$ one has $ell lt.eq 2 delta$. At this fixed $eta$, $Phi$ and its stochastic derivative are bounded, so Itô’s formula gives
  $ bb(E) Phi \( T \, R \) lt.eq bb(E) Phi \( v_0 \, r_(t \( v_0 \)) \) lt.eq delta^(- zeta \/ 2) \, $
  uniformly in $eta$. Since $Phi \( T \, R \) gt.eq e^(- a_0) eta^(- zeta)$ on $\| R - x \| lt.eq eta$,
  $ bb(P) \( \| R - x \| lt.eq eta \) lt.eq C_x eta^zeta . $
  This proves the first assertion.
  #emph[The gap variable.] We show that the state drift is bounded on spatial intervals away from the contact point. Positivity of the drift and monotonicity of $a$ imply, for $t < t' < 1$,
  $ a \( t \, h \) = bb(E) a \( t' \, H_(t')^(t \, h) \) lt.eq bb(E) a \( t' \, h + B_(t' - t) \) . $
  Fix $x > 0$, write $tau = 1 - t$, and set $t_j = 1 - 2^(- j) tau$ and $x_j = x \/ 2 + \( x \/ 2 \) 2^(- j \/ 4)$. Split the last expectation according to whether the Brownian increment is below $- \( x_j - x_(j + 1) \)$. The complement costs at most $a \( t_(j + 1) \, x_(j + 1) \)$. On the exceptional event, the global linear-growth bound in (8.8) and the Gaussian tail estimate bound the cost by
  $ C_x \( 1 + s \( t_(j + 1) \) \) exp { - c_x 2^(j \/ 2) \/ tau } . $
  Concavity and $chi \( 1 \) = 0$ give $s \( t_(j + 1) \) lt.eq 2^(j + 1) s \( t \)$. The remaining term $a \( t_j \, x_j \)$ tends to zero by the uniform error $epsilon_(t_j)$. Summing the rapidly decreasing tail series proves
  $ sup_(h gt.eq x) a \( t \, h \) lt.eq C_x s \( t \) exp { - c_x \/ \( 1 - t \) } $
  for $t$ close to $1$. Since $chi \( t \) = integral_t^1 gamma \( v \) thin upright(d) v gt.eq \( 1 - t \) gamma \( t \)$, the drift $gamma \( t \) a \( t \, h \)$ is bounded uniformly near time $1$ on every compact interval contained in $\( 0 \, oo \)$; explicitly it is at most $C_x \( 1 - t \)^(- 1) exp { - c_x \/ \( 1 - t \) }$ for $h gt.eq x$.
  Start at a fixed late time, stop on leaving such an interval, and set the drift to zero after exit. The resulting diffusion has bounded adapted drift up to time $1$. The exponential martingale in Girsanov’s theorem is integrable because that drift is bounded; its law is equivalent to Brownian motion with its initial value. Its terminal law therefore has no atoms. The original diffusion agrees with it on the event of no exit. Continuity of $H$ implies that every event ${ H_1 = x }$ with $x > 0$ is covered by a countable union of these no-exit events, using rational interval endpoints and rational starting times. Thus $bb(P) \( H_1 = x \) = 0$. ◻
]

#thm([Theorem 8.12.])[
  (The ordered limiting observables).  #emph[The Gaussian observables in the problem have all their stated ordered limits, at every $u > 0$ and $s > 0$, and are given by 
#[#set math.equation(numbering: n => "(8.15)")
 $ G_J \( u \) = bb(P) \( 0 < H_1 lt.eq u \) \, #h(2em) F_J \( s \) = bb(P) (frac(R, alpha_c c) lt.eq s thin mid(bar.v) thin R > 0) . $ <crit:limiting-laws>]

 The force law has mean one and no atom at zero. These limiting laws are also the laws for all Gaussian scale mixtures in the fixed-temperature comparison range. More explicitly, for every $0 < delta < u$ and $s > 0$, the individual limits at each level of 
$ lim_(alpha arrow.b alpha_c) lim_(beta arrow.r oo) lim_(N arrow.r oo) G_(N \, beta \, alpha) \( delta \, u \) = bb(P) \( delta < H_1 lt.eq u \) \,\
lim_(alpha arrow.b alpha_c) lim_(beta arrow.r oo) lim_(N arrow.r oo) F_(N \, beta \, alpha) \( s \) = F_J \( s \) $

 exist; the additional limit $delta arrow.b 0$ in the first line gives $G_J \( u \)$.]
] <crit:ordered-laws>

#proof[
  #emph[Thermodynamic and zero-temperature limits at fixed density.] First take $N arrow.r oo$ at fixed $\( beta \, alpha \)$, using the inner empirical-marginal result proved earlier. At fixed UNSAT density, Corollary 46 and (7.5) give the zero-temperature endpoint law, with no atoms. For completeness, let $h_(beta \, alpha)$ denote the inner limiting gap variable and put $p_(beta \, alpha) = bb(P) \( h_(beta \, alpha) < 0 \)$ and $mu_(beta \, alpha) = bb(E) \( h_(beta \, alpha) \)_(-)$. Proposition 35 supplies uniform integrability of the negative first moment, and the absence of an atom at zero gives
  $ p_(beta \, alpha) arrow.r p_alpha > 0 \, #h(2em) mu_(beta \, alpha) arrow.r mu_alpha > 0 . $
  Positivity follows from $alpha bb(E) \( h_alpha^(*) \)_(-)^2 = 2 e \( alpha \) > 0$. The inner limiting force CDF at $s > 0$ is
  $ 1 / p_(beta \, alpha) bb(P) (- s mu_(beta \, alpha) / p_(beta \, alpha) lt.eq h_(beta \, alpha) < 0) . $
  Both limiting interval endpoints are atomless under the law of $h_alpha^(*)$, so this expression converges at every $s > 0$. Thus the full $beta arrow.r oo$ limit exists for all the required gap and force arguments, and its conditioning mass is preserved before the density is changed. Uniqueness of every subsequential endpoint law yields convergence along the full temperature limit.
  #emph[The critical-density limit and the final gap cutoff.] Now approach $alpha_c$ from above. Proposition 52 gives convergence of the physical endpoint gaps and the scaled residuals, and Lemma 54 permits every positive cutoff, rather than just a selected continuity sequence.
  For gaps keep $0 < delta < u$ fixed throughout these three limits; the answer is $bb(P) \( delta < H_1 lt.eq u \)$. Only then let $delta arrow.b 0$, which removes the contact atom and gives the first formula in (8.15). For forces the conditional mean at density $alpha_n$ is $c_n \/ p_n$, which converges to $alpha_c c$. Lemma 53 preserves the conditioning mass, and its cutoff argument loses no positive residual mass to zero. Subtracting the noncontact mass and applying the positive-atom assertion gives the second formula at every $s > 0$. Since $bb(E) R = c$ and $bb(P) \( R > 0 \) = 1 \/ alpha_c$, its mean is one. Its conditional probability of ${ 0 }$ is zero; the uniform cutoff bound also explicitly prevents an atom from appearing there in the limit of the physical conditional laws.
  Finally the Gaussian and mixture inner-limit observables agree at each fixed temperature and density in a neighborhood above the common threshold, by Section 5. Equality of these functions passes through exactly the same ordered limits. The limits $u arrow.b 0$ and $s arrow.b 0$, which determine their exponents, are taken only in the subsequent sections. ◻
]

== 9 Uniform control of the critical layer <sec:scales>

Throughout this section, $\( chi \, R \)$ is the normalized critical optimizer, $alpha = alpha_c$, $c = bb(E) R > 0$, and $Y = H_1$. The inputs from Section 8 are the PDE and diffusion representation of Lemma 48, the first-order conditions of Lemma 50, and the endpoint conclusions of Proposition 51 and Lemma 53. In particular,

$ chi \( 1 \) = 0 \, #h(2em) integral_0^1 chi^(- 2) < oo \,\
{ R > 0 } = { Y = 0 } quad upright("modulo null sets") \, #h(2em) bb(P) \( R > 0 \) = 1 \/ alpha . $

The increase support of $gamma$ accumulates at $1$, and $gamma = 0$ on an initial interval. At its interior support points we have $J = 0$, $J' lt.eq 0$, and (8.11), where $J = P - I$ is the variational defect defined in Section 8. All constants below may depend on this fixed optimizer and on a fixed interior starting time; they do not depend on the distance to the endpoint. Constants with a subscript may also depend on that parameter.

Write $tau = 1 - t$. Whenever $tau$ is the time argument, $chi \( tau \)$ means the original susceptibility at physical time $1 - tau$; the same convention applies to the other deterministic time-dependent quantities. Thus $chi_tau = gamma gt.eq 0$ and $chi \( tau \) arrow.r 0$ as $tau arrow.b 0$; the susceptibility is concave in this clock. The physical-time normalization remains $chi \( t = 0 \) = 1$. In this clock write $cal(S) = { tau in \( 0 \, 1 \) : 1 - tau in "supp" upright(d) gamma }$. It has points arbitrarily close to zero. A support gap means a component $\( tau_1 \, tau_2 \)$ of its complement, on which $chi$ is affine. When extending estimates across gaps, we work below a fixed point of $cal(S)$; every intervening gap then has both endpoints in $cal(S)$. Choosing this point sufficiently small puts both endpoints in the range of any support-point estimate under consideration. Set

$ s & = chi^(- 1) \, & m \( t \, h \) & = chi \( t \) a \( t \, h \) \,\
k & = - m_h \, & l & = 1 - k \,\
X \( t \, h \) & = h + m \( t \, h \) \, & w \( t \) & = integral_t^1 s \( v \)^2 thin upright(d) v \,\
D & = chi sqrt(w \/ tau) . &  & $

The same symbol $X_t$ denotes $X \( t \, H_t \)$. In particular,

$ upright(d) r_t = - s \( t \) k \( t \, H_t \) thin upright(d) B_t \, #h(2em) upright(d) X_t = l \( t \, H_t \) thin upright(d) B_t \, #h(2em) r_1 = R \, quad X_1 = Y . $

The curvature bounds give $0 lt.eq k \, l lt.eq 1$ and $k_h < 0$, hence $0 < k < 1$ at every finite spatial point. Since $\| l \| lt.eq 1$, $X_t$ is a square-integrable martingale. Its $L^2$ endpoint limit is $Y$, because $H_t arrow.r Y$, $chi arrow.r 0$, and $r_t arrow.r R$ in $L^2$. Thus $X_t = bb(E) \[ Y divides cal(F)_t \] gt.eq 0$, just as $r_t = bb(E) \[ R divides cal(F)_t \] gt.eq 0$. Finally $w \( tau \) gt.eq tau \/ chi \( tau \)^2$ gives $D gt.eq 1$. Here $m = chi a$ is the rescaled force field; the earlier finite-temperature CDF is $m_q$.

The identity $H_t = X_t - chi r_t$ explains the susceptibility factor in $D$. We first prove that $D$ stays bounded, making the spatial scales $chi sqrt(w)$ and $sqrt(tau)$ comparable, and derive the endpoint mass estimates (9.20). We then use the inverse-slope bounds (9.21) to exclude terminal gaps in the increase support and obtain (9.26). These are the inputs for Section 10.

The equation for $m$ in remaining time is

#[#set math.equation(numbering: n => "(9.1)")
 $ m_tau = 1 / 2 m_(h h) + d thin m \( 1 + m_h \) \, #h(2em) d = gamma \/ chi \, #h(2em) 0 lt.eq d lt.eq tau^(- 1) . $ <eq:scale-m-pde>]

The last inequality follows from $tau gamma \( tau \) lt.eq chi \( tau \)$.

=== 9.1 Value barriers and inverse flows <value-barriers-and-inverse-flows>

Let $phi.alt$ and $Phi$ be the standard normal density and distribution function. The following estimates do not require any information about $D$ beyond $D gt.eq 1$.

#thm([Lemma 9.1.])[
  (Pointwise barriers).  #emph[For $z = h \/ sqrt(tau)$, 
#[#set math.equation(numbering: n => "(9.2)")
 $ sqrt(tau) thin \[ phi.alt \( z \) - z Phi \( - z \) \] lt.eq m \( t \, h \) lt.eq sqrt(tau) thin frac(phi.alt \( z \), Phi \( z \)) . $ <eq:src23>]

 Consequently, with fixed positive constants $C \, c_0$, 
#[#set math.equation(numbering: n => "(9.3)")
 $ k \( t \, h \) lt.eq C e^(- c_0 z^2) quad \( z gt.eq 1 \) \, #h(2em) l \( t \, h \) lt.eq C \| z \|^(- 2) quad \( z lt.eq - 1 \) \, #h(2em) integral_(bb(R)) k l thin upright(d) h lt.eq C sqrt(tau) . $ <eq:src24>]

]
] <lem:scale-barriers>

#proof[
  First $m gt.eq h_(-)$. Indeed $X_h = l gt.eq 0$, and the bounded difference between $f \( t \, h \)$ and $- h_(-)^2 \/ \( 2 chi \)$ in (8.8) forces $X \( t \, h \) arrow.r 0$ as $h arrow.r - oo$: a nonzero limit of the monotone function $X$ would make the integral of $f_h + h \/ chi = X \/ chi$ unbounded on that half-line. Thus $X gt.eq 0$; on the other half-line use $m gt.eq 0$.
  The heat evolution of the hinge is the lower function in (9.2). It is a subsolution of (9.1), since $m \( 1 + m_h \) gt.eq 0$. For the upper function $U$, direct differentiation of $rho \( z \) = phi.alt \( z \) \/ Phi \( z \)$, using $rho' = - z rho - rho^2$, gives $U_tau = U_(h h) \/ 2 + tau^(- 1) U \( 1 + U_h \)$ and $- 1 lt.eq U_h lt.eq 0$. It is therefore a supersolution for $d lt.eq tau^(- 1)$.
  Here comparison must start before the singular endpoint. At $tau' > 0$, (8.8) gives
  $ 0 lt.eq m \( tau' \, h \) - h_(-) lt.eq C chi \( tau' \) sqrt(w \( tau' \)) quad upright("uniformly in ") h . $
  For the difference between two solutions, the zeroth-order coefficient in the linear comparison equation is at most $d$. Thus the positive error at $tau'$ is amplified by at most $exp \( integral_(tau')^tau d \) = chi \( tau \) \/ chi \( tau' \)$. The resulting error is at most $C chi \( tau \) sqrt(w \( tau' \))$, which tends to zero as $tau' arrow.b 0$. Comparison may first be made with smooth coefficients and on bounded spatial intervals; the uniform linear growth and curvature bounds permit the limits.
  Finally, for a convex decreasing function $m$, its negative derivative at $h$ is bounded above by the backward secant over a distance $sqrt(tau)$. Applying the upper value barrier gives the positive Gaussian tail for $k$. Apply the forward secant to the convex increasing function $X$ on the negative half-line, using $X \( t \, h \) lt.eq C tau \/ \| h \|$ there; this gives the stated bound for $l$. The integral estimate follows by using $k l lt.eq 1$ on $\| h \| lt.eq sqrt(tau)$ and integrating the two tails. ◻
]

We next turn these pointwise bounds into estimates under the law of $H_t$. The inverse flow retains the Gaussian density at an early time; its Jacobian records how much the critical drift compresses that law.

Choose $t_0 > 0$ in the interval on which $gamma = 0$. Then $chi \( t_0 \) = 1$ and $H_(t_0)$ has a strictly positive Gaussian density $p_0$, independently of subsequent Brownian increments. Conditional on those increments, the flow $F_t$ taking $H_(t_0)$ to $H_t$ is increasing and convex: its first derivative solves an equation with coefficient $- d k in \[ - d \, 0 \]$, and its second derivative has nonnegative forcing $d m_(h h)$. If $cal(I)_t = F_t^(- 1)$ and $cal(J)_t = cal(I)'_t$, then

#[#set math.equation(numbering: n => "(9.4)")
 $ 1 lt.eq cal(J)_t lt.eq chi \( t \)^(- 1) \, #h(2em) cal(J)_t upright(" is nonincreasing") \, #h(2em) p_t \( h \) = bb(E) \[ p_0 \( cal(I)_t \( h \) \) cal(J)_t \( h \) \] lt.eq C \/ chi \( t \) . $ <eq:scale-inverse-density>]

In particular the critical state has a density at every interior time.

We shall also use the lower bound

#[#set math.equation(numbering: n => "(9.5)")
 $ inf_(\| h \| lt.eq K chi \( t \)) p_t \( h \) gt.eq c_K > 0 . $ <eq:scale-density-lower>]

Here is a uniform moment justification. The inverse flow, read in increasing remaining time $u$, solves the additive-noise equation $upright(d) tilde(H)_u = - d \( u \) m \( u \, tilde(H)_u \) thin upright(d) u + upright(d) tilde(B)_u$. Its positive part is bounded by its initial positive part and twice the Brownian supremum. For $N = - tilde(H) \/ chi$,

$ upright(d) N = - s thin upright(d) tilde(B) + frac(gamma X \( u \, tilde(H) \), chi^2) thin upright(d) u . $

The value barrier gives $\( - h \)_(+) X \( u \, h \) lt.eq C u$. Applying Itô’s formula to $N_(+)^2$ therefore bounds its expected growth by $C s^2 thin upright(d) u$, since $u gamma \/ chi lt.eq 1$. Its initial second moment is at most $K^2$. The inverse position at $t_0$ consequently has a uniformly bounded second moment. On a fixed interval its Gaussian density is bounded below, and Markov’s inequality puts a fixed positive fraction of the inverse positions in that interval. Equation (9.4), with $cal(J)_t gt.eq 1$, proves (9.5). All these inverse statements can also be obtained pathwise from the additive-noise integral equation, so no independence between the inverse position and its Jacobian is used.

At an interior point of the increase support of $gamma$, (8.11) gives $bb(E) k l gt.eq c chi$. Combining this with (9.3) and $p_t lt.eq C \/ chi$ gives

#[#set math.equation(numbering: n => "(9.6)")
 $ chi \( tau \) lt.eq C tau^(1 \/ 4) . $ <eq:scale-chi-quarter>]

This holds throughout a terminal interval. Indeed on a complementary support interval $chi$ is affine, whereas $tau^(1 \/ 4)$ is concave, so the endpoint inequalities imply the inequality in the interval.

=== 9.2 The ratio of the two natural scales <the-ratio-of-the-two-natural-scales>

Let $pi \( t \, h \) = bb(P) \( R > 0 divides H_t = h \)$ and $q_g = 1 - pi$. The Markov property supplies these conditional probabilities as measurable functions of the state. The curvature equation gives

$ upright(d) k \( t \, H_t \) = k_h \( t \, H_t \) thin upright(d) B_t - d \( t \) k \( t \, H_t \) l \( t \, H_t \) thin upright(d) t . $

Its endpoint limit is $upright(bold(1))_({ R > 0 })$. On $Y > 0$ this follows from (9.3); on $R > 0$, the uniform derivative error in (8.8) is $o \( 1 \)$, so $H_t = - chi \( t \) R + o \( chi \( t \) \)$. A secant of length a fixed fraction of $chi \( t \) R$ on the negative side then gives $k \( t \, H_t \) arrow.r 1$. The two events exhaust the space. Conditional bounded-supermartingale convergence thus gives

#[#set math.equation(numbering: n => "(9.7)")
 $ k gt.eq pi \, #h(2em) q_g \( t \, h \) gt.eq Phi #h(-0.16667em) (frac(h, chi sqrt(w))) quad upright("for almost every ") h . $ <eq:scale-probability-comparison>]

For the second inequality, run the inverse flow from position zero at $t' > t$. The variable $N$ in the preceding argument has nonnegative drift, and hence dominates, under the same noise, a centered Gaussian of variance $w \( t \) - w \( t' \)$. The monotonicity of the flow shows

$ bb(P) \( H_(t') > 0 divides H_t = h \) gt.eq Phi #h(-0.16667em) (frac(h, chi \( t \) sqrt(w \( t \) - w \( t' \)))) . $

Now let $t' arrow.t 1$. On the force event the sign is eventually negative by the just established secant argument; on the gap event it is eventually positive. Conditional dominated convergence proves the claim.

A second useful consequence of complementarity is, for $v = r \/ sqrt(w) gt.eq 2$,

#[#set math.equation(numbering: n => "(9.8)")
 $ X lt.eq C sqrt(tau) thin v Phi \( - v \) \, #h(2em) l lt.eq C v^2 / D Phi \( - v \) . $ <eq:src26>]

Indeed the event $Y > 0$ requires the martingale $r$ to hit zero. Its remaining quadratic variation is at most $w$, so the reflection principle after Brownian time change bounds this event’s conditional probability by $q lt.eq 2 Phi \( - v \)$. The martingale $X$ has remaining quadratic variation at most $tau$. Integration of its Gaussian tail gives, for any event $A$ of probability $q$,

$ bb(E) \[ \| Y - X \| upright(bold(1))_A divides H_t = h \] lt.eq C sqrt(tau) thin q sqrt(log \( 2 \/ q \)) . $

As $Y$ vanishes off $A = { Y > 0 }$, this bounds $X \( 1 - q \)$. The normal tail estimates give the first claim, also with adjusted constants for all $v gt.eq 1$. To bound $l = X_h$, take its forward secant over $delta h = chi sqrt(w) \/ v$. The variable $r \/ sqrt(w)$ at the new position is at least $v - v^(- 1)$, because $\| r_h \| lt.eq 1 \/ chi$. The ratio of the corresponding normal tails is bounded by an absolute constant. Dividing the value bound by $delta h$ proves the second claim. Continuity extends estimates derived at almost every state.

#thm([Lemma 9.2.])[
  (Subpower scale ratio).  #emph[As $tau arrow.b 0$, 
#[#set math.equation(numbering: n => "(9.9)")
 $ log D = o \( \| log tau \| \) . $ <eq:src25>]

]
] <lem:scale-subpower>

#proof[
  At a support point, stability says $bb(E) \( k^2 - pi \) lt.eq 0$. Suppose instead that along support points $D gt.eq tau^(- epsilon)$ for some $epsilon > 0$. Since $h = X - chi r gt.eq - chi r$, (9.7) gives $q_g gt.eq Phi \( - v \)$. Thus (9.8) implies $k^2 - pi gt.eq q_g \/ 2$ when $2 lt.eq v lt.eq a sqrt(D)$, for a fixed sufficiently small $a > 0$. When $v > a sqrt(D)$ its negative part is bounded by $k l lt.eq C exp \( - c_0 D \)$. When $v < 2$ and $h lt.eq - K sqrt(tau)$, take $K$ sufficiently large in (9.3); again $k^2 - pi gt.eq q_g \/ 2$. In particular, on
  $ I_(-) = [- 1 / 2 chi sqrt(w) \, - 1 / 4 chi sqrt(w)] $
  there is a fixed positive lower bound for $k^2 - pi$ once $D$ is large. This follows from $q_g gt.eq Phi \( - 1 \/ 2 \)$, the negative-tail slope bound, and the upper value barrier, which gives $v lt.eq 1$ on this interval. Writing $p_(-) := inf_(I_(-)) p_t$, the positive contribution is at least $c_0 chi sqrt(w) thin p_(-)$. Equation (9.5) gives $p_(-) gt.eq c_0$ for late times.
  For clarity, the required density comparison has the following quantitative form. If $h_2 > h_1$, $delta = \( h_2 - h_1 \) \/ chi$, and $P$ is fixed, then
  #[#set math.equation(numbering: n => "(9.10)")
   $ p_t \( h_2 \) lt.eq exp #h(-0.16667em) { C_P \[ delta sqrt(\| log tau \|) + delta^2 + 1 \] } thin p_t \( h_1 \) + tau^P . $ <eq:scale-truncated-density>]
  To prove it, use the decreasing inverse Jacobian, the bound $\| cal(I)_t \( h_2 \) - cal(I)_t \( h_1 \) \| lt.eq delta$, and the Gaussian density ratio on $\| cal(I)_t \( h_2 \) \| lt.eq C_P sqrt(\| log tau \|)$. On the complement use $cal(J)_t lt.eq chi^(- 1) lt.eq C tau^(- 1 \/ 2)$; the last inequality follows from $tau \/ chi^2 lt.eq w lt.eq w \( t_0 \)$. Increasing $C_P$ makes the discarded Gaussian density at most $tau^P$.
  Apply this with $h_1 in I_(-)$ and $- K sqrt(tau) lt.eq h_2 lt.eq C_P sqrt(tau \| log tau \|)$. Here $delta lt.eq C_P sqrt(w \( 1 + \| log tau \| \))$, so the exponential factor is $tau^(- o \( 1 \))$. The negative contribution in this layer is at most $C sqrt(tau) thin tau^(- o \( 1 \)) p_(-)$ by $\( k^2 - pi \)_(-) lt.eq k l$ and (9.3). Above the layer the positive Gaussian tail of $k$ makes the contribution an arbitrarily small power of $tau$. Below it the only remaining negative contribution is $C exp \( - c_0 D \)$. Both are negligible compared with $chi sqrt(w) thin p_(-) = D sqrt(tau) thin p_(-)$, a contradiction.
  It remains to cross a support gap $tau_1 < tau < tau_2$. Affineness gives the exact identity
  #[#set math.equation(numbering: n => "(9.11)")
   $ w \( tau \) = w_1 + frac(tau - tau_1, chi_1 chi \( tau \)) . $ <eq:scale-affine-gap>]
  If $tau_2 \/ tau_1 lt.eq 2$, concavity gives $chi \/ chi_1 lt.eq 2$, so the assertion transfers immediately. Otherwise $chi_2 \/ chi_1 lt.eq 2 D_2^2$, by applying (9.11) at $tau_2$. Hence
  $ D \( tau \)^2 lt.eq D_1^2 tau_1 / tau \( 2 D_2^2 \)^2 + 2 D_2^2 . $
  For every fixed $eta > 0$ the endpoint estimates bound $D_i$ by $C_eta tau_i^(- eta)$. The factor $tau_1 \/ tau$ absorbs the possible disparity between $tau_1$ and $tau$; since $tau_2 gt.eq tau$, for $0 < eta < 1 \/ 2$ we obtain explicitly
  $ D \( tau \)^2 lt.eq C_eta tau_1^(1 - 2 eta) / tau tau_2^(- 4 eta) + C_eta tau_2^(- 2 eta) lt.eq C_eta \( tau^(- 6 eta) + tau^(- 2 eta) \) . $
  As $eta$ is arbitrary, this proves the same subpower conclusion in the gap. ◻
]

#thm([Lemma 9.3.])[
  (Strict improvement of the endpoint power).  #emph[There exist $eta > 0$ and $C < oo$ such that $s \( tau \) lt.eq C tau^(- 1 \/ 2 + eta)$. In particular $w \( tau \) lt.eq C tau^(2 eta)$.]
] <lem:scale-strict-power>

#proof[
  In the inverse formula, $log cal(J)_t = integral d \( u \) k \( u \, tilde(H)_u \) thin upright(d) u$. Starting at $h in \[ - a sqrt(tau) \, 0 \]$, the inverse drift is nonpositive, so at every reverse time its probability of a negative position is at least $1 \/ 2$. The barriers and secants give a uniform lower bound $k gt.eq kappa > 0$ for negative positions. Moreover the inverse moment bound proved above gives $bb(E) log p_0 \( cal(I)_t \( h \) \) gt.eq - C$ uniformly: its initial normalized negative position has square at most $a^2 tau \/ chi^2 lt.eq a^2 w$. Jensen’s inequality therefore yields $p_t \( h \) gt.eq C^(- 1) chi^(- kappa \/ 2)$. Here both $k$ and $l$ have fixed positive lower bounds on $\[ - a sqrt(tau) \, 0 \]$ if $a > 0$ is sufficiently small. To see this uniformly in time, the heat barrier gives $m \( 0 \) gt.eq phi.alt \( 0 \) sqrt(tau)$, while the upper barrier makes $m \( K sqrt(tau) \) \/ sqrt(tau)$ arbitrarily small for fixed large $K$. The secant from $0$ to $K sqrt(tau)$ bounds $k \( 0 \)$ below, and $k \( h \) gt.eq k \( 0 \)$ for $h lt.eq 0$. Likewise $X \( h \) gt.eq X \( 0 \) - \| h \| gt.eq \( phi.alt \( 0 \) - a \) sqrt(tau)$ on that interval, whereas $X \( - K sqrt(tau) \) lt.eq C sqrt(tau) \/ K$. The backward secant from $- K sqrt(tau)$ to $h$ therefore gives
  $ l \( h \) gt.eq frac(X \( h \) - X \( - K sqrt(tau) \), h + K sqrt(tau)) gt.eq frac(phi.alt \( 0 \) - a - C \/ K, K) > 0 $
  after fixing $a < phi.alt \( 0 \) \/ 2$ and then a sufficiently large $K$. Together with (9.6) this gives
  $ bb(E) k l gt.eq C^(- 1) sqrt(tau) thin chi^(- kappa \/ 2) gt.eq C^(- 1) tau^(b_0) \, #h(2em) b_0 = 1 / 2 - kappa / 8 < 1 / 2 . $
  The drift identity for $k$, including its endpoint limit, gives $bb(E) k - 1 \/ alpha = integral_t^1 d thin bb(E) k l$. Thus, if $tau_2$ is a late support point and $0 < tau_1 < tau_2$,
  #[#set math.equation(numbering: n => "(9.12)")
   $ chi \( tau_2 \) gt.eq C^(- 1) tau_1^(b_0) log frac(chi \( tau_2 \), chi \( tau_1 \)) . $ <eq:scale-power-growth>]
  Put $b = limsup_(tau arrow.b 0) log chi \( tau \) \/ log tau$. The bounds already proved imply $1 \/ 4 lt.eq b lt.eq 1 \/ 2$. Fix $0 < epsilon < 1$ and choose $tau_n arrow.b 0$ realizing this limsup. For sufficiently small $delta > 0$, eventually $chi \( u \) gt.eq u^(b + delta)$ at all small $u$, whereas along a subsequence $chi \( tau_n \) lt.eq tau_n^(b - delta)$. At $u_n = tau_n^(1 - epsilon)$, choosing $\( 2 - epsilon \) delta < b epsilon \/ 4$ gives
  $ frac(chi \( u_n \), chi \( tau_n \)) gt.eq tau_n^(- b epsilon + \( 2 - epsilon \) delta) gt.eq tau_n^(- 3 b epsilon \/ 4) . $
  If $u_n$ lies in a gap, move to its smaller endpoint $tau_(2 \, n)$; otherwise put $tau_(2 \, n) = u_n$. The loss in susceptibility is subpower in $1 \/ u_n$. Indeed it is at most two on a gap of time ratio at most two; on any other gap it is at most $2 D \( tau_2 \)^2$, by (9.11), and $tau_2 gt.eq u_n$. Lemma 57 therefore gives, for all large $n$,
  $ frac(chi \( tau_(2 \, n) \), chi \( tau_n \)) gt.eq tau_n^(- b epsilon \/ 2) . $
  In particular $tau_n < tau_(2 \, n) lt.eq u_n$. This is the ordering needed to apply (9.12) with lower endpoint $tau_n$. Concavity then gives
  $ chi \( tau_n \) gt.eq tau_n / tau_(2 \, n) chi \( tau_(2 \, n) \) gt.eq C^(- 1) tau_n^(b_0 + epsilon) \| log tau_n \| . $
  Therefore $b lt.eq b_0 + epsilon$. Letting $epsilon arrow.b 0$ gives $b lt.eq b_0 < 1 \/ 2$. Choose any exponent strictly between $b_0$ and $1 \/ 2$ and use the defining limsup to obtain the asserted bound on $s$; integration gives the bound on $w$. ◻
]

=== 9.3 A martingale bin comparison <a-martingale-bin-comparison>

We give the probability estimate needed to replace subpower control by a uniform bound. Let $\( Z_upsilon \)_(0 lt.eq upsilon lt.eq T)$ be a nonnegative continuous martingale on a finite deterministic horizon, with $upright(d) Z_upsilon = sigma_upsilon thin upright(d) W_upsilon$ and $\| sigma_upsilon \| lt.eq 1$. Write $u = T - upsilon$ for its remaining time. Suppose that, for each fixed $a > 0$, there is $c_a > 0$, independent of $upsilon$ and the sample path, such that

#[#set math.equation(numbering: n => "(9.13)")
 $ Z gt.eq a sqrt(u) quad arrow.r.double quad \| sigma \| gt.eq c_a > 0 quad \( a > 0 \) . $ <eq:scale-nondegenerate>]

We also assume that its law has a positive continuous density on $\( 0 \, oo \)$ at each strictly interior time $0 < upsilon < T$. Continuity of its paths and absence of positive atoms then make each moving-bin probability continuous for $0 < u < T$. For $r$ take variance time $integral_0^t s^2$, remaining time $u = w$, and $\| sigma \| = k$. Condition (9.13) follows from $m \/ sqrt(tau) gt.eq a D gt.eq a$, the upper barrier, and a secant: the corresponding $z$ is bounded above, and $k$ is bounded below on that half-line. No upper bound on $D$ is needed here.

#thm([Lemma 9.4.])[
  (Bin comparison).  #emph[Under these assumptions there exist $0 < u_0 < T$ and finite constants $C \, P$, depending on the process and the constants $c_a$, such that $M_j \( u \) := bb(P) \( j sqrt(u) lt.eq Z_(T - u) lt.eq \( j + 1 \) sqrt(u) \)$ satisfies 
#[#set math.equation(numbering: n => "(9.14)")
 $ M_j \( u \) lt.eq C j^P M_1 \( u \) \, #h(2em) j gt.eq 2 \, quad 0 < u lt.eq u_0 . $ <eq:src27>]

]
] <lem:scale-bins>

#proof[
  We first prove a conditional steering estimate; the martingale need not itself have the Markov property. After any stopping time $S$, apply Brownian time change to the shifted continuous martingale $Z_(S + v) - Z_S$ in the filtration $cal(F)_(S + v)$. Extending it with independent Brownian increments after the terminal time if necessary, this gives $Z_(S + v) = Z_S + W_(Q_v)$, where $Q_v = integral_S^(S + v) sigma^2 thin upright(d) t$ and $W$ is Brownian with respect to a filtration containing $cal(F)_S$ at time zero. Its Brownian law thus holds conditionally on $cal(F)_S$. All estimates below are uniform in that initial information. Conditional spatial and time scaling permits us to set the remaining time at $S$ equal to one.
  Consider first a single step with time ratio $rho in \[ sqrt(2) \, 2 \]$, elapsed time $L = 1 - rho^(- 1)$, and starting position $x in \[ 1 \, 2 \]$. Put
  $ L_min = 1 - 1 \/ sqrt(2) \, #h(2em) kappa = c_(1 \/ 2) \, #h(2em) q_(*) = kappa^2 L_min \/ 2 \, #h(2em) y_rho = frac(3, 2 sqrt(rho)) . $
  The terminal first bin is $\[ rho^(- 1 \/ 2) \, 2 rho^(- 1 \/ 2) \]$. Take the fixed spatial corridor $\( 1 \/ 2 \, 3 \)$. Up to its first exit, (9.13) gives $kappa^2 lt.eq dot(Q) lt.eq 1$, since the remaining time is at most one. Let $g_(x \, rho) \( q \)$ move linearly from $x$ to $y_rho$ on $\[ 0 \, q_(*) \]$, and stay at $y_rho$ on $\[ q_(*) \, 1 \/ 2 \]$. It lies in $\[ 1 \, 2 \]$. On the Brownian event
  $ sup_(0 lt.eq q lt.eq 1 \/ 2) \| x + W_q - g_(x \, rho) \( q \) \| < 1 \/ 16 \, $
  no first corridor exit can occur before elapsed time $L$: at such an exit, $Q_v lt.eq v lt.eq L lt.eq 1 \/ 2$, whereas the displayed event places the exit position strictly inside the corridor. This first-exit argument establishes the lower clock bound without assuming it on the event being proved. In particular $Q_L gt.eq kappa^2 L gt.eq 2 q_(*)$, so $Z_(S + L)$ is within $1 \/ 16$ of $y_rho$ and lies in the terminal first bin. The paths $g_(x \, rho) - x$ form a compact family of piecewise linear paths starting at zero. Brownian motion has positive probability to stay in a fixed uniform neighborhood of each such path; a finite cover by neighborhoods of radius $1 \/ 32$ gives one positive lower bound for the displayed event, independent of $x$ and $rho$. This elementary tube fact follows, for example, by requiring finitely many Gaussian increments to lie in prescribed open intervals and the intervening Brownian bridges to stay in prescribed open strips.
  For any total ratio $u' \/ u gt.eq sqrt(2)$, partition it into factors in $\[ sqrt(2) \, 2 \]$ and iterate the conditional estimate. The number of steps is at most $1 + log_2 \( u' \/ u \)$, so the resulting probability is at least $c \( u \/ u' \)^(P_1 \/ 2)$ for a fixed $P_1$. On the first step the starting interval may instead be $\[ 1.5 \, J \]$: use corridor $\( 1 \/ 2 \, J + 1 \)$ and the same piecewise linear path, obtaining a first-step constant depending only on fixed $J$, with the same subsequent power. There is also a uniform bound when starting at exactly $1.5$ and $u' \/ u in \[ 1 \, sqrt(2) \]$. In normalized units the event $sup_(q lt.eq L_min) \| W_q \| < 1 \/ 16$ suffices, since $\[ 1.5 - 1 \/ 16 \, 1.5 + 1 \/ 16 \]$ lies inside every corresponding terminal first bin. Here only $Q_L lt.eq L lt.eq L_min$ is used; no lower clock bound is necessary.
  The steering estimates now give a polynomial lower bound for reaching the first bin across the scale ratios used below. We use that bound in an induction over decreasing dyadic slabs of remaining time, comparing the other bins to the first and controlling distant starting bins by Gaussian tails. On $\[ u_0 \/ 2 \, u_0 \]$, $M_1$ has a positive minimum, so the assertion follows from $M_j lt.eq 1$. Suppose the assertion has been established on earlier slabs and let $u$ lie in the next slab. For $j gt.eq 2$, set $u_a = min \( j^2 u \, u_0 \) gt.eq 2 u$. If $u_a = u_0$, steering from its first bin gives $M_1 \( u \) gt.eq c \( u \/ u_0 \)^(P_1 \/ 2) M_1 \( u_0 \)$. Since $j^2 u gt.eq u_0$, the trivial bound $M_j \( u \) lt.eq 1$ proves the desired inequality with power $P_1$ and a fixed constant.
  In the uncapped case $u_a = j^2 u$, condition at $u_a$. Any path that starts below $1.5 sqrt(u_a)$ and ends in bin $j$ at time $u$ must hit the #emph[moving] boundary $Z = 1.5 sqrt(upright("remaining time"))$. Let $A$ be the event of starting below this boundary and hitting it before the terminal observation, and let $S$ be the first hitting time. On $A$ its remaining time $u_h$ belongs to $\[ u \, u_a \]$. The conditional steering estimate just proved, restarted at $S$, gives a probability at least $c j^(- P_1)$ of ending in the first bin, since $u_h \/ u lt.eq u_a \/ u = j^2$; its short-ratio case covers $u_h \/ u in \[ 1 \, sqrt(2) \]$. Therefore
  $ M_1 \( u \) gt.eq bb(E) #h(-0.16667em) [upright(bold(1))_A bb(P) \( Z upright(" ends in the first bin") divides cal(F)_S \)] gt.eq c j^(- P_1) bb(P) \( A \) . $
  The target contribution from starting positions below the boundary is at most $bb(P) \( A \)$, because every such target path must hit it. This proves the desired bound $C j^(P_1) M_1 \( u \)$ without conditioning on later target success. Starting positions between $1.5 sqrt(u_a)$ and $J sqrt(u_a)$ obey the same bound, with $C_J$, by direct steering.
  For an ancestor in bin $i gt.eq J$ at $u_a$, ending in the target bin requires a martingale displacement at least a constant times $i sqrt(u_a)$, once $J$ is a fixed sufficiently large integer: the upper target endpoint divided by $sqrt(u_a)$ is $\( j + 1 \) \/ j lt.eq 3 \/ 2$. The exponential martingale bound therefore gives probability at most $C e^(- c_0 i^2)$. The induction hypothesis at $u_a$ bounds the ancestor mass by $C_(*) i^P M_1 \( u_a \)$, and steering gives $M_1 \( u_a \) lt.eq C j^(P_1) M_1 \( u \)$. Thus the remaining contribution is at most
  $ C_(*) C j^(P_1) M_1 \( u \) sum_(i gt.eq J) i^P e^(- c_0 i^2) . $
  Choose $P gt.eq P_1$, then $J$ making the coefficient of $C_(*)$ at most $1 \/ 2$, and finally $C_(*)$ large enough to absorb the nonrecursive terms and the initial slab. These choices are independent of the slab and close the induction. ◻
]

#thm([Proposition 9.5.])[
  (Bounded scale ratio).  #emph[There is a constant $C$ such that $1 lt.eq D lt.eq C$ near the endpoint. Consequently $w asymp tau \/ chi^2$ and $integral_t^1 s asymp tau \/ chi$.]
] <prop:scale-bounded-D>

#proof[
  Repeat the stability argument in Lemma 57, now along an arbitrary support sequence on which $D arrow.r oo$. Use the force bin $1 lt.eq r \/ sqrt(w) lt.eq 2$ for the positive contribution. The first estimate in (9.8), valid also for $v gt.eq 1$, places its state interval below $- K sqrt(tau)$ when $D$ is large. There $q_g gt.eq Phi \( - 2 \)$ and $l arrow.r 0$ uniformly, so its contribution is at least $c_0 M_1 \( w \)$. Its interval has length at least $chi sqrt(w)$, because $\| r_h \| lt.eq 1 \/ chi$.
  Lemma 58 makes the exponential factor in (9.10) uniformly bounded when comparing this bin to $\[ - K sqrt(tau) \, C_P sqrt(tau \| log tau \|) \]$. Using the infimum density on the bin, (9.3) bounds the negative layer contribution by $C M_1 \( w \) \/ D$. Errors $tau^P$ are negligible compared with $M_1 \( w \)$: the density lower bound and the bin length give $M_1 \( w \) gt.eq c_0 chi sqrt(w) gt.eq c_0 sqrt(tau)$. For $v > a sqrt(D)$, sum (9.8) over the force bins and use Lemma 59. This contribution is at most $C M_1 \( w \) sum_(j gt.eq a sqrt(D) - 1) j^(P + 2) e^(- c_0 j^2) = o \( M_1 \( w \) \)$. The other regions have nonnegative contribution as before. Stability is contradicted. Formula (9.11) transfers the result across gaps, with the same two cases as in the subpower proof. The estimate for $integral s$ follows from Cauchy–Schwarz for the upper bound and monotonicity for the lower bound. ◻
]

=== 9.4 Density comparison and endpoint masses <density-comparison-and-endpoint-masses>

Bounded $D$ implies $upright(d) log w \/ upright(d) log tau = D^(- 2) gt.eq delta_0 > 0$. Combining this with $w asymp tau \/ chi^2$ gives, for $0 < tau lt.eq u lt.eq 1 - t_0$,

#[#set math.equation(numbering: n => "(9.15)")
 $ frac(chi \( u \), chi \( tau \)) lt.eq C \( u \/ tau \)^(\( 1 - delta_0 \) \/ 2) \, #h(2em) integral_tau^(1 - t_0) frac(gamma \( u \), sqrt(u)) thin upright(d) u lt.eq C frac(chi \( tau \), sqrt(tau)) . $ <eq:src28>]

For the integral use $gamma \( u \) lt.eq chi \( u \) \/ u$ and integrate the first bound; the power in the resulting integral is $- 1 - delta_0 \/ 2$.

We need the additional gradient estimate $\| k_h \| lt.eq C \/ sqrt(tau)$. Differentiating (9.1) gives $k_tau = k_(h h) \/ 2 + d m k_h + d k l$. On $\[ tau \/ 2 \, tau \]$, the drift has spatial Lipschitz constant at most $2 \/ tau$, and the source is bounded by $2 \/ tau$. For completeness, the semigroup estimate used here is

$ \| partial_x bb(E)_x g \( Z_T \) \| lt.eq e^(L T) / sqrt(T) parallel g parallel_oo $

for $upright(d) Z = b \( v \, Z \) thin upright(d) v + upright(d) B$, $\| b_x \| lt.eq L$. If $J_v = partial_x Z_v$, Brownian integration by parts represents the derivative by $bb(E) \[ g \( Z_T \) T^(- 1) integral_0^T J_v thin upright(d) B_v \]$. Indeed contraction of the noise derivative with the adapted process $J_v \/ T$ produces the endpoint variation $J_T$; its divergence is its Itô integral. For smooth simple adapted integrands this is Gaussian integration by parts, and the general statement follows by $L^2$ approximation. Cauchy–Schwarz and $\| J_v \| lt.eq e^(L T)$ give the estimate. Apply it to the bounded datum $k \( tau \/ 2 \, dot.op \)$ and to Duhamel’s source integral; $integral_0^(tau \/ 2) v^(- 1 \/ 2) thin upright(d) v$ gives $\| k_h \| lt.eq C \/ sqrt(tau)$. Smooth approximation and localization justify the argument for the time-measurable coefficient and linear-growth drift.

Couple inverse flows from $h$ and $0$. At reverse time $u$, their separation is at most $\| h \| chi \( u \) \/ chi \( tau \)$. The logarithmic Jacobian formula, the preceding gradient estimate, and (9.15) consequently give

$ \| log cal(J)_t \( h \) - log cal(J)_t \( 0 \) \| lt.eq C \| h \| \/ sqrt(tau) \, #h(2em) \| cal(I)_t \( h \) - cal(I)_t \( 0 \) \| lt.eq \| h \| \/ chi . $

These imply

#[#set math.equation(numbering: n => "(9.16)")
 $ p_t \( h \) asymp_K p_t \( 0 \) quad \( \| h \| lt.eq K sqrt(tau) \) \, #h(2em) p_t \( h \) lt.eq C p_t \( 0 \) exp { C \| z \| + epsilon \( tau \) z^2 } \, quad epsilon \( tau \) arrow.r 0 . $ <eq:src29>]

Here and subsequently $asymp_K$ denotes two positive constants depending only on $K$ and the fixed optimizer. The first comparison is uniform in all sufficiently late times for each fixed $K$; the second holds for every $z in bb(R)$ at each such time, with a single function $epsilon \( tau \)$ independent of $z$. To check the global assertion, write $delta = \| h \| \/ chi lt.eq C sqrt(w) thin \| z \|$. The Gaussian density satisfies, for $0 < eta lt.eq 1 \/ 2$,

$ p_0 \( cal(I)_t \( h \) \) lt.eq C p_0 \( cal(I)_t \( 0 \) \)^(1 - eta) exp \( C delta^2 \/ eta \) . $

Hölder’s inequality with measure $cal(J)_t \( 0 \) thin upright(d) bb(P)$ bounds its expectation by $p_t \( 0 \)^(1 - eta) chi^(- eta)$. Take $eta = sqrt(w)$; Lemma 58 makes $chi^(- eta)$ bounded, while (9.5) bounds $p_t \( 0 \)$ below. This proves the global claim with $epsilon \( tau \) = C sqrt(w)$ after enlarging constants. Apply the same argument with $h$ and $0$ interchanged for the compact lower bound; the Jacobian estimate is symmetric, and powers $p_t \( 0 \)^(plus.minus eta)$ are uniformly bounded because $c_0 lt.eq p_t \( 0 \) lt.eq C \/ chi$.

Put $M_(upright("lay")) = p_t \( 0 \) sqrt(tau)$. The first force bin has mass comparable to $M_(upright("lay"))$. Indeed $D$ is bounded, the barriers put its endpoints in a fixed scaled spatial interval, and $k$ is bounded below there. Thus its spatial length is comparable to $chi sqrt(w) asymp sqrt(tau)$, and (9.16) applies. The same bin lemma applies to $X$ with remaining time $tau$ and coefficient $l$. If $X gt.eq a sqrt(tau)$, its scaled position is bounded below by the upper barrier for $X$ on the negative half-line; a secant then bounds $l$ below. Its first bin also lies in a fixed scaled spatial interval. Therefore both families of bins have mass at most $C j^P M_(upright("lay"))$, and

#[#set math.equation(numbering: n => "(9.17)")
 $ bb(E) k l asymp M_(upright("lay")) \, #h(2em) bb(E) \( r X \) asymp \( tau \/ chi \) M_(upright("lay")) . $ <eq:src30>]

For the lower bounds integrate over a fixed central interval: both $m \/ sqrt(tau)$ and $X \/ sqrt(tau)$ are bounded below there by the heat barrier, and so are $k$ and $l$ by secants. For the upper bounds split into large force bins, large gap bins, and their complement. In force bin $j$, (9.8) bounds $k l$ and $chi r X \/ tau$ by a polynomial in $j$ times $e^(- c_0 j^2)$; bounded $D$ is used here. In gap bin $j$, the positive barrier places $z$ above a fixed positive multiple of $j$ for large $j$, and (9.2)–(9.3) give the same estimate. The polynomial bin masses are summable against these tails. The complement is in a fixed scaled spatial interval and has mass $O \( M_(upright("lay")) \)$.

Recall $J = P - I$ from the critical variational conditions, where $P \( t \) = alpha bb(E) r_t^2$ and $I \( t \) = integral_0^t s^2$. The identities for $W$ and $J'$ give globally

$ frac(alpha bb(E) k l, chi) = alpha c + gamma J - chi J' = alpha c - \( chi J \)' . $

Itô’s formula for $r X$, using its covariation $- s k l thin upright(d) t$ and $R Y = 0$, now gives

#[#set math.equation(numbering: n => "(9.18)")
 $ bb(E) \( r_t X_t \) = c tau + chi \( t \) J \( t \) \/ alpha . $ <eq:scale-mixed-moment>]

The terminal boundary term is zero: $J$ is bounded by $alpha bb(E) R^2 + integral_0^1 s^2$ and $chi arrow.r 0$. At support points $J = 0$, so (9.17) implies $M_(upright("lay")) asymp chi$ there.

These comparisons hold throughout a terminal interval. First the ratios $tau_2 \/ tau_1$ across support gaps are bounded. Otherwise (9.11) and bounded $D$ give $chi_2 \/ chi_1 lt.eq C$ along a sequence of gaps with unbounded time ratio. Their affine slope satisfies $d lt.eq C \/ tau_2$. The inverse flow from $0$ at $tau_1$ to $tau_2$ therefore has a bounded Jacobian and a position whose ratio to $sqrt(tau_2)$ has a uniform Gaussian tail. To see the latter directly, the barrier gives $\| m \( u \, h \) \| lt.eq C \( sqrt(tau_2) + \| h \| \)$ for $u lt.eq tau_2$; Gronwall’s inequality bounds the inverse position by a constant times $sqrt(tau_2)$ plus the Brownian supremum. Use the inverse density formula on this interval and (9.16) at $tau_2$. The linear exponential integrates against this Gaussian tail, as does the quadratic exponential once $epsilon \( tau_2 \)$ is sufficiently small. Thus $p_(1 - tau_1) \( 0 \) lt.eq C p_(1 - tau_2) \( 0 \)$. But the support comparisons make their ratio comparable to $\( chi_1 \/ chi_2 \) sqrt(tau_2 \/ tau_1)$, which tends to infinity. This contradiction bounds the time ratios.

For a point inside a gap, compare to its larger endpoint by the same inverse formula. The bounded time ratio and $d lt.eq 1 \/ tau$ give bounded Jacobians and uniformly tight scaled inverse positions. Equation (9.16) gives the upper comparison. For the lower comparison restrict to a fixed compact containing a positive probability of inverse positions and use its compact lower bound and $cal(J)_t gt.eq 1$. As $chi$ and $sqrt(tau)$ also have bounded ratios,

#[#set math.equation(numbering: n => "(9.19)")
 $ p_t \( 0 \) sqrt(tau) asymp chi \( t \) $ <eq:scale-layer-mass>]

throughout a terminal interval.

The two endpoint windows and the atoms they exclude are shown in Figure 1.

#thm([Proposition 9.6.])[
  (Two-sided endpoint mass estimates).  #emph[There exist $t_1 < 1$ and constants $0 < c_1 < C_1 < oo$ such that, for every $t_1 < t < 1$, 
#[#set math.equation(numbering: n => "(9.20)")
 $ bb(P) \( 0 < R lt.eq sqrt(w) \) asymp chi \( t \) \, #h(2em) bb(P) \( 0 < Y lt.eq sqrt(tau) \) asymp chi \( t \) . $ <eq:src31>]

 Both comparisons use the same fixed constants $c_1 \, C_1$, after enlarging their range if necessary; the time $t$ need not be a support point.]
] <prop:scale-endpoint-masses>

#proof[
  For a lower bound, start the relevant martingale in the scaled interval $\[ 0.4 \, 0.6 \]$. The barriers, bounded $D$, and (9.16)–(9.19) put at least $c_0 chi$ mass in this interval. Its remaining quadratic variation is at most the square of the corresponding scale. Brownian time change shows that its displacement stays within $0.2$ of that scale with a fixed positive probability: it suffices that standard Brownian motion stay in $\[ - 0.2 \, 0.2 \]$ up to time one. Its endpoint is then strictly positive and below the desired cutoff.
  For the force upper bound, paths starting in force bin $j gt.eq 2$ must make a displacement of at least $\( j - 1 \) sqrt(w)$ to finish below $sqrt(w)$, and hence pay a Gaussian tail. Paths starting in gap bin $j gt.eq 2$ must make a displacement at least $j sqrt(tau)$ to have $R > 0$, since that event forces $Y = 0$. Sum the polynomial bin estimates against these Gaussian tails. The remaining region ${ r lt.eq 2 sqrt(w) \, med X lt.eq 2 sqrt(tau) }$ is in a fixed scaled spatial interval and has mass $O \( chi \)$. For the gap upper bound interchange the two martingales, using $Y > 0 arrow.r.double R = 0$. This proves both statements. ◻
]

#figure(
  [#grid(
    columns: (0.47fr, 0.47fr,),
    column-gutter: 6%,
    [
      (175,86) (20,27)(1,0)146 (25,27) (110,23)(0,1)8 (25,42)(1,0)85 (25,39)(0,1)6 (110,39)(0,1)6 (67,49)(0,0)mass $asymp chi$ (25,14)(0,0)$0$ (110,14)(0,0)$sqrt(tau)$ (166,14)(0,0)$Y$ (85,75)(0,0)Positive gaps (85,0)(0,0)atom at zero: $1 \/ alpha$
    ],
    [
      (175,86) (20,27)(1,0)146 (25,27) (110,23)(0,1)8 (25,42)(1,0)85 (25,39)(0,1)6 (110,39)(0,1)6 (67,49)(0,0)mass $asymp chi$ (25,14)(0,0)$0$ (110,14)(0,0)$sqrt(w)$ (166,14)(0,0)$R$ (85,75)(0,0)Positive forces (85,0)(0,0)atom at zero: $1 - 1 \/ alpha$
    ],
  )],
  caption: [Figure 1: The unconditional endpoint laws of $Y$ and $R$ and the windows in (9.20). Each bracket denotes an interval open at zero, so its indicated mass excludes the atom. These are probability windows, with no density assumption or common horizontal scale. The force law $F_J$ conditions on $R > 0$ and rescales $R$ to conditional mean one. The martingales $X_t$ and $r_t$ have remaining quadratic variations at most $tau$ and $w$, respectively. In the identity $H_t = X_t - chi r_t$, the corresponding spatial scales are $sqrt(tau)$ and $chi sqrt(w)$. Proposition 60 makes them comparable. ],
) <fig:scale-endpoint-windows>

=== 9.5 Quantitative inverse-slope barriers <quantitative-inverse-slope-barriers>

For the rest of this section put $V = - sqrt(tau) thin k_h > 0$. Since $k$ decreases strictly from $1$ to $0$, we may also regard $V$ as a function of $k in \( 0 \, 1 \)$ at a fixed time. Subscripts $z$ below mean differentiation in $z = h \/ sqrt(tau)$, so $V = - k_z$.

#thm([Lemma 9.7.])[
  (Inverse-slope bounds).  #emph[At every interior critical time, 
#[#set math.equation(numbering: n => "(9.21)")
 $ 9 / 7 k \( 1 - k \)^(3 \/ 2) lt.eq V lt.eq 6 / 5 \[ k \( 1 - k \) \]^(3 \/ 4) . $ <eq:src32>]

]
] <lem:scale-inverse-slope>

#proof[
  We first establish the claim for a regularization that makes all endpoint comparisons classical. In the approximants of (8.8), replace $m$ by $\( lambda_n + chi_n \) a_n$. Its terminal value is the hinge, and it solves (9.1) with $d = gamma_n \/ \( lambda_n + chi_n \)$, $0 lt.eq tau d lt.eq 1$. At fixed $n$ this coefficient is integrable. Approximate it in $L^1$ by bounded coefficients satisfying the same inequality. Next replace the initial hinge by its heat smoothing of variance $e' > 0$ and replace the bounded coefficient $d \( tau \)$ by $d \( tau \) tau \/ \( tau + e' \)$. Put $T = tau + e'$, and denote the replaced coefficient again by $d$. Then $D_0 = T d in \[ 0 \, 1 \]$. These operations converge on interior compact sets, first as $e' arrow.b 0$, then in the coefficient approximation, then as $n arrow.r oo$: the linear difference equation and the uniform curvature and value bounds give local uniform convergence, and the semigroup gradient estimates give convergence of spatial derivatives. It is therefore enough to prove the bounds uniformly for this regularization, with $sqrt(T)$ in the definition of $V$.
  The slopes remain in $\[ - 1 \, 0 \]$ and are strictly monotone. Their endpoint values are $- 1$ and $0$. Write $v = - k_h$, and let $h = h \( tau \, k \)$ be the inverse position. From the equation for $k$,
  $ h_tau = 1 / 2 v_k - d m + frac(d k \( 1 - k \), v) \, #h(2em) h_k = - 1 \/ v . $
  Differentiate the first identity in $k$, use $m_k = k \/ v$, and compare with the time derivative of $h_k$. For $V = sqrt(T) thin v$ the result is
  #[#set math.equation(numbering: n => "(9.22)")
   $ partial_(log T) V = 1 / 2 V^2 V_(k k) + \[ 1 / 2 + D_0 \( 1 - 3 k \) \] V - D_0 k \( 1 - k \) V_k . $ <eq:scale-inverse-pde>]
  The endpoint values are $V \( 0 \) = V \( 1 \) = 0$, uniformly on compact time intervals in this regularization. To justify this at spatial infinity, $v$ solves $v_tau = v_(h h) \/ 2 + d m v_h + d \( 1 - 3 k \) v$, with Gaussian initial datum, Lipschitz drift of at most linear growth, and bounded potential. Its reverse diffusion representation shows that $v$ vanishes uniformly at spatial infinity on a compact time interval: starting positions tending to infinity remain there in probability, by the bounded integrated Lipschitz norm. The corresponding equations for $k$ and $1 - k$ show that their fixed intermediate levels stay in bounded spatial intervals. These facts give the asserted endpoint behavior in inverse coordinates.
  Let $t_k = k \( 1 - k \)$ and $b_(+) = \( 6 \/ 5 \) t_k^(3 \/ 4)$. Direct differentiation gives
  $ - b_(+) b''_(+) = 36 / 25 (3 / 4 sqrt(t_k) + frac(3, 16 sqrt(t_k))) \, #h(2em) 1 - 3 k - t_k b'_(+) \/ b_(+) = 1 / 4 - 3 / 2 k . $
  For $k gt.eq 1 \/ 6$, $- b_(+) b''_(+) gt.eq 27 \/ 25 > 1$ suffices to make the right-hand side of (9.22) nonpositive at $b_(+)$. For $k < 1 \/ 6$, the required inequality is
  $ 27 / 100 frac(1 + 4 t_k, sqrt(t_k)) gt.eq 3 / 2 sqrt(1 - 4 t_k) . $
  After squaring, it follows from $x \( 1 - x \) \/ \( 1 + x \)^2 lt.eq 1 \/ 8$ for $0 lt.eq x lt.eq 1$, with $x = 4 t_k$. Thus $b_(+)$ is a stationary supersolution for every $D_0 in \[ 0 \, 1 \]$.
  For $b_(-) = C k \( 1 - k \)^(3 \/ 2)$, the right-hand side divided by $b_(-)$ is bounded below by
  $ frac(1 - k, 2) [1 - C^2 (3 k \( 1 - k \) - 3 / 4 k^2)] . $
  The quadratic in parentheses has maximum $3 \/ 5$; with $C = 9 \/ 7$, its product with $C^2$ is $243 \/ 245 < 1$. This proves the subsolution inequality.
  At the heat-smoothed initial time, the inverse profile is $V_0 \( k \) = phi.alt \( Phi^(- 1) \( k \) \)$ and satisfies $V''_0 = - 1 \/ V_0$. Both barriers have zero endpoint values. Their stationary inequalities at $D_0 = 0$ give $b_(-) b''_(-) gt.eq - 1$ and $b_(+) b''_(+) lt.eq - 1$. If $b_(-) - V_0$ had a positive interior maximum, then $b''_(-) lt.eq V''_0 = - 1 \/ V_0 < - 1 \/ b_(-)$, a contradiction. The same argument at a positive maximum of $V_0 - b_(+)$ proves $V_0 lt.eq b_(+)$. Parabolic comparison in (9.22) now yields the bounds at all later times. One may apply the maximum principle on $\[ delta \, 1 - delta \]$ and then let $delta arrow.b 0$. The zeroth-order coefficient in the linearized difference is bounded above: it involves $\( V + b \) b''$, which is bounded above for the supersolution and, for the subsolution, on the only relevant region $V < b_(-)$. Multiplying the difference by a sufficiently decreasing exponential in time deals with this bound. The uniform endpoint vanishing deals with the spatial boundary. Smooth approximation handles measurable time coefficients. Passing through the regularizations proves (9.21). ◻
]

We record the compactness and tail information used below. Uniformly near the endpoint,

#[#set math.equation(numbering: n => "(9.23)")
 $ \| V \( z \) \| + \| V_z \( z \) \| lt.eq C e^(- c_0 z^2) . $ <eq:scale-V-tails>]

For $V$ use (9.21), the positive Gaussian tail in (9.3), and the negative tail in (9.8); bounded $D$ makes $r \/ sqrt(w)$ comparable to $\| z \|$ on the negative half-line. For $V_z$ apply the semigroup gradient argument given above to the linear equation $v_tau = v_(h h) \/ 2 + d m v_h + d \( 1 - 3 k \) v$ for $v = - k_h$ on $\[ tau \/ 2 \, tau \]$, using spatial unit $sqrt(tau)$ and time unit $tau$. In these units the drift has uniformly bounded Lipschitz constant and at most linear growth, and the potential is bounded. The bound just proved for $V$ holds at every time in this interval, so both the initial datum and the Duhamel source (the potential times $sqrt(tau) v$) have uniform Gaussian decay in the scaled position. A reverse diffusion started at $z$ stays at distance at least $c \| z \| - C$ from zero except on an event of probability $C e^(- c_0 z^2)$, by the flow separation estimate and the Brownian supremum bound. Thus the second moment of either decaying datum evaluated along that diffusion is at most $C e^(- c_0 z^2)$. Cauchy–Schwarz in the integration-by-parts gradient formula bounds its gradient by $C T^(- 1 \/ 2) e^(- c_0 z^2)$, with a possibly smaller $c_0$. The source cost is integrable because $integral_0^(1 \/ 2) T^(- 1 \/ 2) thin upright(d) T < oo$. This proves (9.23). Repeating the spatial derivative estimates on smaller time intervals gives local bounds and equicontinuity of $k \, V \, V_z$. In particular sequences of scaled spatial profiles have subsequences converging locally with these derivatives. Time differentiability of the coefficient is not needed in these semigroup estimates.

The limiting density ratios have a useful order property. For $h_1 < h_2$ with bounded scaled positions, the inverse displacement is $O \( sqrt(w) \)$. On $\| cal(I)_t \( h_2 \) \| lt.eq w^(- 1 \/ 4)$, the Gaussian density ratio $p_0 \( cal(I)_t \( h_2 \) \) \/ p_0 \( cal(I)_t \( h_1 \) \)$ is at most $1 + o \( 1 \)$, uniformly on the chosen scaled compact. The complement contributes at most $C chi^(- 1) e^(- c_0 \/ sqrt(w)) = o \( p_t \( 0 \) \)$, using the strict power bound. The inverse Jacobian is decreasing. Hence

$ frac(p_t \( h_2 \), p_t \( 0 \)) lt.eq frac(p_t \( h_1 \), p_t \( 0 \)) + o \( 1 \) . $

The compact two-sided bounds in (9.16) and the elementary selection theorem for monotone functions now give subsequential limits

#[#set math.equation(numbering: n => "(9.24)")
 $ frac(p_t \( z sqrt(tau) \), p_t \( 0 \)) arrow.r P_oo \( z \) $ <eq:scale-density-limit>]

at continuity points, where $P_oo$ is positive, nonincreasing, and bounded above and below on every compact interval. One can apply the selection theorem to the decreasing upper envelopes on each compact, whose difference from the original functions tends uniformly to zero, and then use a diagonal subsequence.

=== 9.6 A strict curvature inequality <a-strict-curvature-inequality>

#thm([Lemma 9.8.])[
  (Weighted curvature inequality).  #emph[There is $c_1 > 0$ such that, at all sufficiently late times, with $A_0 = tau gamma \/ chi in \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(9.25)")
 $ bb(E) #h(-0.16667em) [V_z^2 + 6 A_0 \( 2 k - 1 \) V^2 + 6 A_0^2 k^2 \( 1 - k \)^2] gt.eq c_1 p_t \( 0 \) sqrt(tau) . $ <eq:src33>]

]
] <lem:scale-curvature>

#proof[
  We first prove an unweighted inequality for every limiting profile satisfying (9.21). Put
  $ F_A \( z \) = V_z^2 + 6 A \( 2 k - 1 \) V^2 + 6 A^2 k^2 \( 1 - k \)^2 \, #h(2em) 0 lt.eq A lt.eq 1 . $
  Its cumulative integral from $- oo$ is nonnegative until $k = 1 \/ 2$, since every term is then pointwise nonnegative. For an endpoint with $k = k_0 lt.eq 1 \/ 2$, change variables from $z$ to $k$ to obtain
  $ integral_(- oo)^(z \( k_0 \)) F_A \( z \) thin upright(d) z = H + 6 A C_1 + 6 A^2 B_1 \, $
  where all following integrals are over $\[ k_0 \, 1 \]$ and
  $ H & = integral V V_k^2 \, & C_1 & = integral \( 2 k - 1 \) V \, & B_1 & = integral t_k^2 \/ V \,\
T_1 & = integral t_k \, & U_b & = 6 / 5 integral t_k^(3 \/ 4) \, & B_b & = 7 / 9 integral k sqrt(1 - k) . $
  Cauchy–Schwarz applied to $\( V^(3 \/ 2) \)'$ on $\[ 1 \/ 2 \, 1 \]$ gives
  $ H gt.eq 8 / 9 V \( 1 \/ 2 \)^3 gt.eq frac(81, 5488 sqrt(2)) > 1 / 100 . $
  Put $b = T_1 \/ U_b$. Integration by parts and weighted Cauchy–Schwarz give
  $ C_1 & = V \( k_0 \) { t_(k_0) - b V \( k_0 \) \/ 2 } + integral V \( t_k \/ V - b \) V_k\
 & gt.eq V \( k_0 \) { t_(k_0) - b V \( k_0 \) \/ 2 } - sqrt(H B_1 (1 - frac(T_1^2, U_b B_b))) . $
  Indeed the square integral in this application is $B_1 - 2 b T_1 + b^2 integral V lt.eq B_1 - T_1^2 \/ U_b$; (9.21) gives $integral V lt.eq U_b$ and $B_1 lt.eq B_b$.
  Here are explicit bounds for the ratio appearing in this estimate. Under probability weight $t_k \/ T_1$, the mean of $t_k^(- 1 \/ 4)$ on $\[ k_0 \, 1 \]$, $0 lt.eq k_0 lt.eq 1 \/ 2$, is at most its full-interval mean. This follows by symmetry and monotonic decrease on $\[ 0 \, 1 \/ 2 \]$: the integral of $t_k$ times its deviation from the full mean over $\[ 0 \, k_0 \]$ is nonnegative. Cauchy–Schwarz bounds the full mean by $sqrt(3 pi \/ 4)$, since $integral_0^1 sqrt(k \( 1 - k \)) = pi \/ 8$ and $integral_0^1 k \( 1 - k \) = 1 \/ 6$. The mean of $\( 1 - k \)^(- 1 \/ 2)$ increases with the lower cutoff; at $k_0 = 1 \/ 2$ it is $7 sqrt(2) \/ 5 < 2$. If $k_0 < 1 \/ 50$, its value is less than $17 \/ 10$: integrate $k sqrt(1 - k)$ explicitly and evaluate at $k_0 = 1 \/ 50$. Consequently, using $pi < 22 \/ 7$,
  $ frac(U_b B_b, T_1^2) < 28 / 15 sqrt(33 / 14) < 287 / 100 \, #h(2em) frac(U_b B_b, T_1^2) < 119 / 75 sqrt(33 / 14) < 61 / 25 quad \( k_0 < 1 \/ 50 \) . $
  The endpoint term is nonnegative unless $t_(k_0) < 1 \/ 64$. Indeed $b lt.eq 5 \/ \( 6 sqrt(2) \)$ and $V \( k_0 \) lt.eq \( 6 \/ 5 \) t_(k_0)^(3 \/ 4)$. When $t_(k_0) < 1 \/ 64$, necessarily $k_0 < 1 \/ 50$, and the endpoint term is still greater than $- 1 \/ 20000$. To verify the latter, its dependence on $V \( k_0 \)$ is concave, so its minimum on the permitted interval is at an endpoint. With $x = t_(k_0)^(1 \/ 4)$, the nonzero endpoint is bounded below by $\( 6 \/ 5 \) x^6 \( x - 1 \/ \( 2 sqrt(2) \) \)$. The absolute value of this polynomial’s minimum on $x gt.eq 0$ is $6^7 \/ \( 5 dot.op 7^7 dot.op 1024 sqrt(2) \) < 1 \/ 20000$.
  Complete the square in $A$ in $H + 6 A C_1 + 6 A^2 B_1$ and use $A lt.eq 1$ for the endpoint loss. The result is at least
  $ H [1 - 3 / 2 (1 - frac(T_1^2, U_b B_b))] - 6 / 20000 upright(bold(1))_({ t_(k_0) < 1 \/ 64 }) . $
  The preceding rational bounds make this greater than
  $ min {13 / 57400 \, 7 / 6100 - 3 / 10000} > 1 / 5000 . $
  Thus, if $C_A \( z \) = integral_(- oo)^z F_A$, then $C_A gt.eq 0$ everywhere and $C_A gt.eq 1 \/ 5000$ after the unique point $z_(*)$ at which $k = 1 \/ 2$.
  Let $P$ be any positive nonincreasing limiting density in (9.24). Integration by parts against its Stieltjes measure gives
  $ integral_(bb(R)) F_A P thin upright(d) z = C_A \( + oo \) P \( + oo \) + integral_(bb(R)) C_A thin upright(d) \( - P \) gt.eq 1 / 5000 P \( z_(*) \) > 0 . $
  The negative boundary product is zero by the Gaussian tail of $C_A$ and the exponential bound for $P$; one may first truncate both tails. The inequality includes the case $P \( + oo \) > 0$, which contributes the displayed boundary term.
  Finally suppose (9.25) failed along a sequence to the endpoint. Extract a limit of $A_0 in \[ 0 \, 1 \]$, of the spatial profiles, and of the density ratios. Equations (9.16) and (9.23) give an integrable Gaussian majorant for the normalized integrands, so dominated convergence applies. The level $z_(*)$ stays in a fixed compact by the value and slope barriers, and the limiting density is uniformly bounded below there. The preceding strictly positive lower bound contradicts failure. This proves (9.25). ◻
]

=== 9.7 Full increase support near the endpoint <full-increase-support-near-the-endpoint>

#thm([Proposition 9.9.])[
  (Absence of terminal support gaps).  #emph[The increase support of $gamma$ contains a terminal interval $\( t_(*) \, 1 \)$. On this interval $J = J' = 0$, and $gamma$ has a continuous version with 
#[#set math.equation(numbering: n => "(9.26)")
 $ A_0 = frac(bb(E) V^2, 2 bb(E) k^2 \( 1 - k \)) . $ <eq:src34>]

]
] <prop:scale-full-support>

#proof[
  On an open gap, $gamma$ is constant. Write $b = f_(h h) < 0$ and $H_b = bb(E) b \( t \, H_t \)^2$. The diffusion equations and Itô’s formula give
  $ H'_b = bb(E) b_h^2 - 2 gamma bb(E) b^3 \, #h(2em) H''_b = bb(E) b_(h h)^2 - 12 gamma bb(E) \( b b_h^2 \) + 6 gamma^2 bb(E) b^4 . $
  For example $upright(d) b = b_h thin upright(d) B - gamma b^2 thin upright(d) t$ and $upright(d) b_h = b_(h h) thin upright(d) B - 3 gamma b b_h thin upright(d) t$; these yield both identities by the product rule. Localization and the spatial tails justify taking expectations.
  Substitute $b = - s k$, $b_h = s V \/ sqrt(tau)$, $b_(h h) = s V_z \/ tau$, and $gamma s tau = A_0$. Then
  $ frac(2 H_b H''_b - 3 \( H'_b \)^2, 2 H_b s^2 \/ tau^2) =  & bb(E) V_z^2 + 12 A_0 bb(E) \( k V^2 \) + 6 A_0^2 bb(E) k^4\
 & - frac(3, 2 bb(E) k^2) \( bb(E) V^2 + 2 A_0 bb(E) k^3 \)^2 . $
  Use $bb(E) k^3 \/ bb(E) k^2 lt.eq 1$ and the identity
  $ bb(E) k^4 - frac(\( bb(E) k^3 \)^2, bb(E) k^2) = bb(E) \[ k^2 \( 1 - k \)^2 \] - frac(\( bb(E) \[ k^2 \( 1 - k \) \] \)^2, bb(E) k^2) . $
  The last display is therefore at least the left-hand side of (9.25) minus
  $ frac(6 A_0^2 \( bb(E) \[ k^2 \( 1 - k \) \] \)^2, bb(E) k^2) + frac(3 \( bb(E) V^2 \)^2, 2 bb(E) k^2) . $
  Both errors are $O \( chi^2 \)$: (9.17), (9.19), and the Gaussian derivative tails bound each numerator’s unsquared expectation by $C chi$. Moreover $bb(E) k^2 arrow.r bb(P) \( R > 0 \) = 1 \/ alpha > 0$ by bounded convergence. The main term in (9.25) is at least $c_0 chi$. Hence $2 H_b H''_b - 3 \( H'_b \)^2 > 0$ on every sufficiently late open gap. Equivalently $psi = \( alpha H_b \)^(- 1 \/ 2)$ is strictly concave there.
  Choose a support point $t_(*)$ beyond the time at which this determinant inequality holds uniformly. Every support gap to the right of $t_(*)$ has both endpoints in the increase support: the left endpoint lies at or after $t_(*)$, and accumulation at $1$ excludes a final gap. For any such gap, stability gives $psi gt.eq chi$ at those endpoints, whereas $chi$ is affine on the gap. Strict concavity consequently gives $psi > chi$ at every interior point. But then $J' = alpha H_b - s^2 < 0$ throughout the gap, contradicting $J = 0$ at both endpoints. Thus there are no complementary intervals to the right of $t_(*)$. Closedness of the support proves that it contains $\( t_(*) \, 1 \)$.
  On this interval the variational conditions give $J = J' = 0$, $bb(E) k^2 = 1 \/ alpha$, and $bb(E) k l = c chi$. Apply Itô’s formula to $k \( t \, H_t \)^2$:
  $ 0 = frac(upright(d), upright(d) t) bb(E) k^2 = 1 / tau bb(E) V^2 - frac(2 gamma, chi) bb(E) \[ k^2 \( 1 - k \) \] quad upright("for almost every ") t . $
  The denominator is strictly positive. Interior spatial regularity, the diffusion representation, and dominated convergence make the quotient on the right of (9.26) continuous in $t$. It supplies the continuous version of $A_0$, and hence of $gamma$, and proves the asserted identity everywhere on the terminal interval. ◻
]

== 10 Selection of the critical similarity profile <sec:contraction>

The estimates of Section 9 leave a scalar quantity to identify: the limiting logarithmic derivative of the susceptibility. We prove a rigidity statement for every limit obtained by translating the critical layer in logarithmic time. Its quantitative part consists of finitely many inequalities for one-dimensional functions. The analytic implications of those inequalities are proved here; their finite verification and rounding-error bounds are given in Section 12. The stationary scaling equations have their antecedents in [5] Section IX and [10] Section V. Here their selection is deduced from the entire limits of the critical problem constructed in Sections 8–9.

The coefficient reduction first confines $A$ to $\[ 0 \, .41 \]$. With this bound, stationary-reference comparisons give curvature and density barriers for every entire critical limit. Using its critical integral identities, signed tests then narrow the coefficient interval to $\[ .285 \, .303 \]$, where a strict contraction around the root forces $A equiv a_(*)$. Compactness finally transfers this identification to the original critical layer. The opening table in Section 12 maps the finite checks to these analytic steps.

=== 10.1 Entire limits and their identities <entire-limits-and-their-identities>

We regard $chi$, $gamma$, and $m$ as functions of remaining time: their value at $tau$ in this section is their previous value at physical time $t = 1 - tau$. The density $p_t$ retains its physical-time index. Write $v = log tau$, $u = - v$, and $q = 1 \/ 2$. Throughout this section the letters $M \, X \, P$ refer to rescaled quantities:

$ M \( v \, z \) & = frac(m \( tau \, z sqrt(tau) \), sqrt(tau)) \, & X \( v \, z \) & = z + M \( v \, z \) \,\
P \( u \, z \) & = frac(sqrt(tau), chi \( tau \)) p_(1 - tau) \( z sqrt(tau) \) \, & A & = frac(tau gamma, chi) . $

Thus $P$ is a positive density divided by a mass scale and need not integrate to one. Set $k = - M_z$, $l = 1 - k$, and $V = - k_z = M_(z z) > 0$. Spatial derivatives in this section are derivatives in $z$, except where inverse-slope coordinates are explicitly specified. Direct change of variables gives

#[#set math.equation(numbering: n => "(10.1)")
 $ M_v & = 1 / 2 M_(z z) + B M_z + \( A - q \) M \,\
B & = q z + A M \,\
P_u & = 1 / 2 P_(z z) - \( B P \)_z + A P . $ <eq:src35>]

The opposite time directions are essential: $M$ is parabolic in $v$, whereas $P$ is parabolic in $u$. The last term in the density equation comes from $chi_u = - A chi$.

#thm([Lemma 10.1.])[
  (Compactness in logarithmic time).  #emph[Every sequence $u_n arrow.r oo$ has a subsequence along which the translated rescaled profiles converge locally to a solution of (10.1) for all $u in bb(R)$. The limiting coefficient $A$ is continuous and takes values in $\[ 0 \, 1 \]$. The value barriers (9.2), the inverse-curvature bounds (9.21), and the Gaussian bounds for $k$ on the positive half-line, $l$ on the negative half-line, and $V \, V_z$ on both half-lines hold uniformly in entire time. Moreover $P > 0$, $P lt.eq C exp \( C \| z \| \)$, and on every bounded spatial interval $P$ has a positive lower bound independent of entire time. The limits satisfy 
#[#set math.equation(numbering: n => "(10.2)")
 $ integral_(bb(R)) M X P thin upright(d) z = integral_(bb(R)) k l P thin upright(d) z = c \, #h(2em) A = frac(integral_(bb(R)) V^2 P thin upright(d) z, 2 integral_(bb(R)) k^2 l P thin upright(d) z) \, $ <eq:src36>]

 where $c = bb(E) R > 0$ is the critical normalization constant.]
] <lem:contr-entire>

#proof[
  The density estimate (9.16), together with $p_(1 - tau) \( 0 \) sqrt(tau) \/ chi asymp 1$, bounds $P$ above and below on spatial compact sets. The same estimate bounds it globally by $C exp \( C \| z \| + o \( 1 \) z^2 \)$, which is integrable against the Gaussian tail bounds already proved. The value and curvature barriers bound the coefficients of (10.1) locally, uniformly after sufficiently late translation. Interior estimates for the localized heat equation, applied forward in $v$ to $M$ and forward in $u$ to $P$, give local bounds and equicontinuity for their spatial derivatives. Applying the equations on a slightly smaller cylinder gives time equicontinuity. For precision, one may first differentiate the localized heat-kernel formula in space: the initial $C^1$ bound controls the drift term, and iteration gives the derivatives needed below. Bounded, initially merely measurable, time coefficients suffice in this argument.
  On the full-support endpoint interval, (9.26) expresses $A$ as a quotient of spatial integrals. Its denominator, after division by $chi$, is bounded below uniformly. Indeed the value barriers place an interior interval of slope values in a bounded spatial interval; inversion and (9.21) give positive spatial width, and central positivity of $P$ gives a positive integral of $k^2 l P$. Gaussian tails and the density bound permit uniform truncation of both integrals. Consequently the same compactness gives compactness of $A$ itself. Pass first in the integral form of the equations; the quotient then shows that the limiting $A$ is continuous.
  The critical identities in physical units are $bb(E) \[ r_t X_t \] = c tau$ and $bb(E) \[ k l \] = c chi$. They become the first two integrals in (10.2). Their passage to the limit, and passage in the quotient, use the value barriers, the negative-tail estimate (9.8), and the Gaussian domination just described. The constants in all these arguments are uniform under translation, so the conclusions hold on the whole time axis. ◻
]

We now use $Q$ for the logarithmic spatial slope of $P$ throughout this section. There is a global, translation-uniform bound:

#[#set math.equation(numbering: n => "(10.3)")
 $ Q = \( log P \)_z in \[ - C \, 0 \] \, #h(2em) Q_u = 1 / 2 Q_(z z) + \( Q - B \) Q_z - \( q - A k \) Q - A V . $ <eq:src37>]

Here nonincrease of $P$ follows from the inverse-flow comparison in Section 9. To obtain the lower bound for $Q$, compare two inverse positions corresponding to fixed rescaled positions $z_1 \, z_2$. Their displacement is $O \( sqrt(w) \)$, so the ratio of the initial Gaussian densities tends to one after truncating the inverse positions as in that comparison; the complement is negligible. The inverse-Jacobian logarithmic ratio is bounded by $C \| z_1 - z_2 \|$, with $C$ independent of the chosen compact set. Hence in the limit $\| log P \( z_1 \) - log P \( z_2 \) \| lt.eq C \| z_1 - z_2 \|$ for all $z_1 \, z_2$. Differentiating the density equation gives (10.3).

All subsequent integrations by parts can be made first with compact cutoffs. To justify removal of the cutoffs also after differentiation, use cylinders of spatial radius $\( 1 + \| z \| \)^(- 1)$ and time length $\( 1 + \| z \| \)^(- 2)$. Rescaling bounds the drift and its required spatial derivatives there. Interior derivative estimates thus introduce only polynomial losses into the Gaussian bounds for $V$ and its derivatives and into the exponential bounds for $P$. These losses remain integrable in every expression below.

=== 10.2 An absolute improvement of the coefficient bound <an-absolute-improvement-of-the-coefficient-bound>

Let $cal(L) = 1 / 2 partial_z^2 + B partial_z$. Differentiating the $M$ equation gives

$ \( partial_u + cal(L) \) k = - A k l \, #h(2em) \( partial_u + cal(L) \) V = - \( q + A - 3 A k \) V . $

For a smooth integrable function $F = F \( u \, z \)$, the density equation therefore supplies the useful differentiation rule

$ frac(upright(d), upright(d) u) integral F P = integral #scale(x: 120%, y: 120%)[\(] F_u + cal(L) F + A F #scale(x: 120%, y: 120%)[\)] P . $

Apply it to $V^2$ and $k^2 l$. The quotient in (10.2) is $C^1$ and obeys

#[#set math.equation(numbering: n => "(10.4)")
 $ 2 (integral_(bb(R)) k^2 l P thin upright(d) z) A_u = integral_(bb(R)) #scale(x: 120%, y: 120%)[\[] \( V_z \)^2 + \( 12 A k - 5 A - 1 \) V^2 + 6 A^2 k^2 l^2 #scale(x: 120%, y: 120%)[\]] P thin upright(d) z . $ <eq:src38>]

For example the derivative of the denominator without its factor two is

$ integral #scale(x: 120%, y: 120%)[\[] A \( - 1 + 3 k \) k^2 l + \( 1 - 3 k \) V^2 #scale(x: 120%, y: 120%)[\]] P . $

In simplifying the quotient derivative one uses $integral \( - 2 A V^2 + 4 A^2 k^2 l \) P = 0$, which is precisely (10.2).

#thm([Lemma 10.2.])[
  (Coefficient reduction).  #emph[Every entire limit in Lemma 65 has $0 lt.eq A lt.eq 0.41$.]
] <lem:contr-A>

#proof[
  We first show that the right side of (10.4) is strictly positive whenever $0.41 lt.eq A lt.eq 1$. Denote $t_k = k \( 1 - k \)$. Its unweighted integrand is positive while $k gt.eq 5 \/ 8$. For a cumulative integral ending at a slope $k_0 lt.eq 5 \/ 8$, change variables from $z$ to $k$, so the cumulative runs from $k_0$ to $1$. Put
  $ b = 2 \( 0.6 - k \) \, #h(2em) E = - 0.4 t_k \, #h(2em) K = 12 A k - 5 A - 1 - b^2 + 0.8 \( 1 - 2 k \) . $
  Integrating the inequality $V \( V_k - b - E \/ V \)^2 gt.eq 0$ gives the following lower bound for that cumulative:
  #[#set math.equation(numbering: n => "(10.5)")
   $ - \( b V^2 + 2 E V \) \( k_0 \) + integral_(k_0)^1 [2 V^2 + K V - 2 b E + \( 6 A^2 - 0.16 \) t_k^2 / V] upright(d) k . $ <eq:src39>]
  The boundary term at $k = 1$ vanishes by (9.21).
  The finite check #raw("checkA") proves strict positivity of (10.5), uniformly for $A in \[ 0.41 \, 1 \]$ and $k_0 in \[ 0 \, 5 \/ 8 \]$. Its input is only the two explicit bounds in (9.21). It partitions $A$ and $k$, subdivides the interval between the lower and upper allowed values of $V$, and integrates cellwise lower bounds. For the boundary quadratic its maximum is at an endpoint when $b gt.eq 0$; when $b < 0$ it is decreasing for $V gt.eq 0$. The two omitted endpoint cells each cost at most $9$ times their width, and on the first cell the boundary expression before its negation is less than $0.001$. A possible positive partial cell is subtracted rather than included in full. These are exactly the corrections in #raw("checkA"); Section 12 verifies the arithmetic.
  For completeness, positive cumulatives are preserved under the weight $P$. If $f$ is the unweighted integrand and $F \( z \) = integral_(- oo)^z f$, then $F > 0$ at every finite point and its terminal value is positive. Since $P$ is positive and nonincreasing, Stieltjes integration by parts gives $integral f P = F \( oo \) P \( oo \) + integral F thin upright(d) \( - P \) > 0$; limits of truncated expressions give the same formula when a tail value is infinite. The Gaussian/exponential bounds make the left endpoint product zero and justify the limits. Strictness follows either from $P \( oo \) > 0$ or from the nonzero positive measure $upright(d) \( - P \)$.
  Finally let $L$ be the endpoint limsup of the original rescaled $A$. Choose translates realizing $L$ at time zero and take an entire limit. In that limit $A \( 0 \) = L$ and $A \( u \) lt.eq L$ for all $u$. If $L gt.eq 0.41$, (10.4) makes $A_u \( 0 \) > 0$, contradicting this maximum. Thus $L < 0.41$, which implies the claimed, slightly weaker bound for every entire limit. ◻
]

=== 10.3 Stationary reference profiles <stationary-reference-profiles>

For $a in \[ 0 \, 0.41 \]$, let $M_a$ denote the entire solution of the first equation of (10.1) with $A equiv a$ and the value barriers (9.2), in the inherited admissible class $- 1 lt.eq M_z lt.eq 0$, $M_(z z) > 0$. This solution exists and is unique. For existence, evolve the heat-smoothed hinge of variance one with coefficient $a \/ \( 1 + tau \)$ in the original $m$ equation, and rescale by $T = 1 + tau$. The resulting equation is autonomous in $log T$; the heat and Mills-ratio barriers, together with (9.21), give compactness of translates. For uniqueness, subtract two entire solutions. Their bounded difference solves a linear equation whose zeroth-order coefficient is $a l_2 - q lt.eq a - q < 0$ and whose drift is $q z + a M_1$. Comparison from time $v - T$ to $v$ bounds its supremum by $C e^(- \( q - a \) T)$; let $T arrow.r oo$. Time translation and uniqueness then imply stationarity. The same compactness and uniqueness argument proves continuity of $M_a$ in $a$ on compact spatial sets, with its needed spatial derivatives.

The maximum principles used here and below are valid on the whole line. For bounded differences, localize to $\[ - R \, R \]$ and add $epsilon e^(C t) \( 1 + z^2 \)$; bounded diffusivity and at most linear drift allow $C$ independent of $R$. Send $R arrow.r oo$ and then $epsilon arrow.b 0$. This also proves the corresponding comparison for bounded ratios whenever their equation has bounded diffusivity and at most linear drift.

At a fixed reference, abbreviate $p = q - a > 0$ and $W = M''_a$. Its ODE and its derivative give

#[#set math.equation(numbering: n => "(10.6)")
 $ W = 2 p M l + X k = 2 p M + 2 B k \, #h(2em) W_z = - 2 B W + 2 a t_k \, #h(2em) W_k = 2 B - 2 a t_k / W . $ <eq:src40>]

Here and subsequently $W_k$ is taken at the inverse position $z_a \( k \)$. In particular, for $x > 0$,

$ z = x : & k lt.eq e^(- q x^2) \, & M lt.eq k \/ x \,\
z = - x : & l lt.eq e^(- p x^2) \, & X lt.eq l \/ \( 2 p x \) . $

Indeed $W gt.eq x k$ on the positive side, and $W gt.eq 2 p x l$ on the negative side; integrate the logarithmic derivatives of $k$ or $l$, and then their tail integrals. These formulas also bound the tails of $W$ by a polynomial times the same Gaussians.

Define the reference density up to a positive factor by

$ 1 / 2 P''_a - \( B_a P_a \)' = - lambda \( a \) P_a \, #h(2em) Q_a = \( log P_a \)' . $

The substitution $P_a = exp \( integral_0^z B_a \) psi_a$ gives the self-adjoint operator

$ cal(H)_a = - 1 / 2 partial_z^2 + 1 / 2 \( B_a^2 + B'_a \) . $

Its potential is bounded below by $c_0 z^2 - C_0$, uniformly in $a in \[ 0 \, 0.41 \]$. Minimization of its quadratic form over unit vectors therefore has a minimizer: the confining bound makes the mass outside large compact intervals uniformly small, and bounded one-dimensional Sobolev norms give compactness on each such interval. Replace a minimizer by its absolute value; the ODE and uniqueness for initial values make it strictly positive. The lowest eigenvalue is simple, by the Wronskian identity for two positive square-integrable solutions. Smooth compactly supported trials give upper semicontinuity of $lambda \( a \)$; compactness of minimizing sequences gives lower semicontinuity. Thus $lambda$ is continuous.

Section 12 certifies

$ lambda \( 0.2936533 \) > 0.2936533 \, #h(2em) lambda \( 0.2936535 \) < 0.2936535 . $

Fix a root $a_(*) in \( 0.2936533 \, 0.2936535 \)$ of $lambda \( a \) = a$. For every tabulated density reference used below, and for each root in this bracket, the tail construction in that section proves polynomial-order tails for $P_a$ and $Q_a arrow.r 0$ at both ends. No table at the unknown root is needed: at $lambda = a_(*)$ the two tail coefficients in (12.6) obey

$ c_(upright("tail") \, +) & = 2 a_(*) - 1 in \( - 0.4126934 \, - 0.4126930 \) \,\
c_(upright("tail") \, -) & = frac(a_(*), 1 \/ 2 - a_(*)) - 1 in \( 0.4231063 \, 0.4231088 \) . $

These intervals lie inside the sided hypotheses of the analytic tail construction, and (10.6) supplies its coefficient estimates uniformly for the root. Also $Q_a lt.eq 0$: its stationary equation is (10.3), since differentiating the eigenvalue equation removes the constant eigenvalue term. A positive interior maximum would have right side at most $- \( q - a k \) Q_a - a W < 0$. Together with the zero tail limits this excludes positive values (also at $a = 0$).

At the root the two integral identities in (10.2) hold, after a common positive normalization of $P_(*)$. In fact

$ cal(L) \( M X \) = \( 1 - a \) M X - k l \, #h(2em) cal(L) \( k l \) = - a \( 1 - 2 k \) k l - W^2 . $

Integration against $P_a$ replaces $cal(L)$ by $- lambda \( a \)$. At $lambda = a$, the first formula gives $integral \( M X - k l \) P_a = 0$ and the second gives $integral W^2 P_a = 2 a integral k^2 l P_a$. Boundary terms vanish by the reference tail estimates. Normalize the positive first integral to $c$.

=== 10.4 Comparisons with the references <subsec:contr-comparisons>

For the comparisons and integral tests, an #emph[input] consists of a continuous coefficient $A : bb(R) arrow.r \[ 0 \, 0.41 \]$ and a solution $M_i \( v \, z \)$ of the first equation in (10.1), defined for all $v \, z in bb(R)$. We require $0 < k_i = - M_(i \, z) < 1$, $V_i = M_(i \, z z) > 0$, the scaled value barriers (9.2), and the inverse-curvature bounds (9.21), uniformly in time. A density input also includes a positive function $P_i \( u \, z \)$ whose logarithmic slope $Q_i = \( log P_i \)_z$ is bounded on $bb(R)^2$, nonpositive, and satisfies (10.3), with $u = - v$. The regularity is that of the entire limits above, so the equations and comparisons hold classically on interior space–time cylinders.

Every critical entire limit is an input by Lemmas 65 and 66. Every stationary $M_a$ is an input. The stationary density references used below, including every root in the certified bracket, are density inputs by the tail construction and the bound $Q_a lt.eq 0$. The density comparison class requires neither the full density equation in (10.1) nor the integral identities (10.2). Indeed a stationary eigenreference with $lambda \( a \) eq.not a$ need not solve that density equation, but its logarithmic derivative solves (10.3): spatial differentiation removes the constant eigenvalue term. Consequently all the comparisons and the resulting #raw("Env") enclosures apply to such references. Later, the reference at $0.293650$ enters only through direct functional evaluation and interpolation. Converting a functional sign into a coefficient bound will additionally require the homogeneous consequences of (10.2); a reference satisfies them at a root. If $a lt.eq A lt.eq b$, then at the same spatial position

#[#set math.equation(numbering: n => "(10.7)")
 $ M_a lt.eq M_i lt.eq M_b . $ <eq:src41>]

For example $delta = M_i - M_a$ solves, in $v$, a linear equation with drift $B_i$, damping $q - A l_a gt.eq q - b > 0$, and source $\( A - a \) M_a l_a gt.eq 0$. Its negative part vanishes by comparison from the arbitrarily remote past. The upper comparison is identical with the inequality reversed.

Curvatures must instead be compared at the same slope $k$. Fix a reference $a$, put

$ T_a = 1 - 3 k - t_k W_k / W = frac(2 p M l, W) - 2 k + 2 a (t_k / W)^2 \, #h(2em) D_a = q + a T_a \, $

and write $R = V_i \/ W$ as a function of the reference position $z = z_a \( k \)$. Substitution into the inverse-curvature equation of Section 9 gives

#[#set math.equation(numbering: n => "(10.8)")
 $ R_v = 1 / 2 R^2 R_(z z) + [- R^2 B + \( a R^2 + A \) t_k / W] R_z + R #scale(x: 120%, y: 120%)[\[] D_a \( 1 - R^2 \) + \( A - a \) T_a #scale(x: 120%, y: 120%)[\]] . $ <eq:src42>]

Equivalently, its derivative terms in $k$ are $1 / 2 R^2 W^2 R_(k k) + \( R^2 W W_k - A t_k \) R_k$.

#thm([Lemma 10.3.])[
  (A bounded curvature ratio).  #emph[For every input, at the same $k in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(10.9)")
 $ sqrt(1 - 0.82 dot.op 1.12) med lt.eq med V_i / W_0 med lt.eq med sqrt(1 + 0.82 dot.op 0.13) \, #h(2em) W_0 \( k \) = phi.alt \( Phi^(- 1) \( k \) \) . $ <eq:src43>]

 Consequently the ratio of any two input curvatures is less than $3.8$.]
] <lem:contr-heat-ratio>

#proof[
  The central reference check and the tail estimates proved below give $- 1.12 lt.eq T_0 lt.eq 0.13$. Let $alpha = q + 0.41 dot.op 0.13$ and solve $C' = C \( alpha - q C^2 \)$ with $C \( v \) arrow.r oo$ as $v arrow.b v_0$. Equation (10.8) says that $C W_0$ is a supersolution for $V_i$ in the $k$ equation. This comparison does not initially assume a bounded ratio. Indeed in the equation for $V_i - C W_0$ the extra zeroth-order coefficient is $1 / 2 \( V_i + C W_0 \) C W_(0 \, k k) lt.eq 0$, because $W_(0 \, k k) = - 1 \/ W_0$. The remaining positive coefficient is bounded independently of $C$. At time $v_0 + h$, the positive part of $V_i - C W_0$ has supremum tending to zero as $h arrow.b 0$: on interior $k$-intervals $C arrow.r oo$, and near both endpoints the uniform upper bound (9.21) tends to zero. Comparison, followed by $h arrow.b 0$ and $v_0 arrow.r - oo$, gives $R lt.eq sqrt(alpha \/ q)$.
  To obtain a positive lower ratio without assuming one, set $U = 1 \/ R$ in heat-reference position. Differentiating (10.8) and dropping its nonpositive gradient-square term gives
  $ U_v lt.eq 1 / 2 R^2 U_(z z) + [- q R^2 z + A t_k / W_0] U_z - delta_0 U + q R \, #h(2em) delta_0 = q - 0.41 dot.op 1.12 > 0 . $
  Here $0 lt.eq A t_k \/ W_0 lt.eq C$ and the already proved upper bound controls $R$. The lower bound in (9.21) and elementary normal-tail estimates give, uniformly in entire time,
  $ U \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + z_(+)^2 + e^(z_(-)^2 \/ 3) #scale(x: 120%, y: 120%)[\)] . $
  The diffusion representation for this subsolution has no surviving boundary term at infinity. Here is a direct justification. For $r < q$ and an even integer $m gt.eq 2$, use a $C^1$, piecewise $C^2$ Lyapunov function comparable to $1 + z_(+)^m + e^(r z_(-)^2)$. On the negative half-line its generator is bounded above by a constant: the quadratic exponential contribution has coefficient $2 r \( r - q \) R^2 z^2 lt.eq 0$, and the additional drift is nonnegative, hence contributes nonpositively there. On the positive half-line its generator is at most $C \( 1 + z_(+)^(m - 1) \)$. Stopped Itô and Jensen therefore bound its expectation over duration $T$ by $C_z \( 1 + T \)^m$. Taking $m = 4$, $r = 0.45$ supplies uniform integrability for the smaller growth bound on $U$, permitting removal of stops at each finite duration. The representation thus yields
  $ U \( v \, z \) lt.eq e^(- delta_0 T) bb(E) \[ U \( v - T \, Z_T \) \] + q sup R integral_0^T e^(- delta_0 s) thin upright(d) s . $
  The first term tends to zero polynomially times an exponential. We obtain $U lt.eq q sup R \/ delta_0$, a uniform positive lower bound for $R$.
  Now compare $R$ to the spatially constant solution of $r' = r \( delta_0 - q r^2 \)$ starting below that positive lower bound. The coefficients in (10.8) are bounded in diffusion and at most linear in drift, so the whole-line comparison stated above applies. Let its starting time tend to $- oo$; this gives $R gt.eq sqrt(delta_0 \/ q)$. The quotient of the upper and lower constants in (10.9) is less than $3.8$. ◻
]

=== 10.5 Quantitative curvature and density barriers <quantitative-curvature-and-density-barriers>

Suppose that $a lt.eq A \( v \) lt.eq b$ for every $v in bb(R)$, where $\[ a \, b \]$ is one of the intervals used in the coefficient reductions or the tight root enclosure below. Their finite checks are verified in Section 12. Put $g = b - a$ and define

$ e \( z \) = frac(0.13, #scale(x: 120%, y: 120%)[\(] 1 + \( 2 - z \)_(+)^2 \/ 2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 4)) . $

The following inequalities hold at equal slope values:

#[#set math.equation(numbering: n => "(10.10)")
 $ V_i \( k \) lt.eq W_a \( k \) #scale(x: 120%, y: 120%)[\(] 1 + g e \( z_a \( k \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) V_i \( k \) gt.eq W_b \( k \) #scale(x: 120%, y: 120%)[\(] 1 - 1.1 g e \( z_b \( k \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:src44>]

We spell out both the finite tests and their implication for an entire solution, since simply testing a stationary barrier would not by itself prove an entire comparison.

For either endpoint temporarily call the reference $a$, and let $R_0 = 1 + f g e$, with $f = 1$ at the lower reference and $f = - 1.1$ at the upper reference. Set $C_0 = e'' \/ 2 + \( - B + a t_k \/ W \) e'$. The sufficient inequalities are

#[#set math.equation(numbering: n => "(10.11)")
 $ R_0^2 C_0 + A t_k / W e' + R_0 [- \( R_0 + 1 \) D_a e + frac(\( T_a \)_(+), \| f \|)] & < 0 \,\
f g C_0 - R_0 D_a & < - 0.02 . $ <eq:src45>]

The first line bounds the right side of (10.8) after division by $f g$; for $f < 0$ the reversal gives the required subsolution inequality. On replacing $R_0$ by $C R_0$, the right side divided by $C$ changes by $\( C^2 - 1 \) R_0^2 \( f g C_0 - R_0 D_a \)$. Start with $C > 1$ for the upper barrier or $0 < C < 1$ for the lower barrier, chosen to dominate the bounded ratios of Lemma 67. For a sufficiently small fixed $c_0 > 0$, the solution $C' = c_0 C \( 1 - C^2 \)$ preserves the corresponding super- or subsolution inequality. Entire comparison and passage of the starting time to $- oo$ give $C arrow.r 1$ and prove (10.10). The products of drift differences with barrier derivatives are bounded, including $B e'$. To see explicitly why whole-line comparison is legitimate, write

$ beta = - B + a t_k / W \, #h(2em) F \( r \) = r \[ D_a \( 1 - r^2 \) + \( A - a \) T_a \] . $

For the difference between an input $R$ and a trial $S = C R_0$, the diffusion and drift coefficients are $R^2 \/ 2$ and $R^2 beta + A t_k \/ W$. The zeroth-order coefficient is

$ 1 / 2 \( R + S \) S_(z z) + \( R + S \) beta S_z + frac(F \( R \) - F \( S \), R - S) \, $

where the quotient is interpreted as $F' \( S \)$ at equality. Both $R$ and $S$ stay in fixed positive bounded intervals; $D_a \, T_a \, t_k \/ W$ are bounded, $S_(z z)$ is bounded, and $beta S_z$ is bounded because $B e'$ is bounded. Hence this coefficient is bounded above uniformly, the diffusion is bounded, and the drift grows at most linearly. Multiplying the difference by a decaying time exponential and using the polynomial localization already stated proves comparison. The barrier is $C^1$ and piecewise $C^2$ at $z = 2$; comparison applies on both sides, or follows by smoothing inside the strict margins.

The central inequalities (10.11) are the test #raw("checkV"). The following tail estimates complete their whole-line verification and also supply the heat bound used above. For $z = x gt.eq 6$, (10.6) gives

$ t_k / W lt.eq 1 / x \, #h(2em) - 2 k lt.eq T_a lt.eq 1 / x^2 \; $

$e$ is constant there, so both inequalities in (10.11) follow directly. For $z = - x$, $x gt.eq sqrt(13 \/ p)$, put $U_0 = \( 4 p^2 x^2 \)^(- 1) lt.eq \( 52 p \)^(- 1)$. Write $W = 2 p M l \( 1 + y \)$. Then

$ 0 lt.eq y lt.eq U_0 \, #h(2em) k gt.eq 1 - 3 dot.op 10^(- 6) \, #h(2em) x / M gt.eq 1 - 3 dot.op 10^(- 6) \, $

and, more sharply, $l lt.eq e^(- 13) < 2.261 dot.op 10^(- 6)$ and $X \/ x lt.eq e^(- 13) \/ 26 < 8.694 dot.op 10^(- 8)$. Thus $\( k x \/ M \)^2 > 1 - 4.7 dot.op 10^(- 6) > 1 - 10^(- 5)$, and hence

$ - 1 - U_0 + frac(2 a \( 1 - 10^(- 5) \) U_0, \( 1 + U_0 \)^2) lt.eq T_a lt.eq 1 - 2 k + 2 a U_0 < 0 . $

In particular $D_a > 0.56 p$: maximize the quadratic in $a$ in $a \[ 1 - 2 a \( 1 - 10^(- 5) \) \/ \( 1 + U_0 \)^2 \] < 0.185$, using $U_0 < 0.214$. Also

$ t_k / W lt.eq frac(1, 2 p x) \, quad 0 lt.eq - B lt.eq p x \, quad 0 lt.eq e' / e lt.eq frac(1, 2 \( x + 2 \)) \, quad frac(\| e'' \|, e) lt.eq frac(1, \( x + 2 \)^2) . $

In the first line of (10.11), divided by $e$, the positive terms are at most

$ 1.12 [p / 2 + frac(0.5 p, 13) + 0.41 / 52] + 0.41 / 52 < 0.8 p \, $

whereas the negative term has magnitude at least $0.94 dot.op 1.94 dot.op 0.56 p > p$. For the second line, $\| f g C_0 \| < 0.059 \( 0.5 + 0.039 + 0.088 \) p$, while $R_0 D_a > 0.94 dot.op 0.56 p$; since $p gt.eq 0.09$, its value is below $- 0.02$. At $a = 0$ these tail bounds and the central check give $- 1.12 lt.eq T_0 lt.eq 0.13$.

For density comparison use equal spatial positions and the trial $hat(Q) = Q_a + a delta$, where $delta = M_i - M_a$. Substitution into (10.3), using the difference equation for $delta$ with time reversed from $v$ to $u$, gives the exact residual

#[#set math.equation(numbering: n => "(10.12)")
 $ H = a \( 1 - a \) delta + \( A - a \) [M_i \( Q'_a - a l_a \) - k_i Q_a + V_i - a k_i delta] . $ <eq:src46>]

In particular the second spatial derivatives of $delta$ cancel. The difference $hat(Q) - Q_i$ solves a linear equation with drift $Q_i - B_i$, source $H$, and damping

$ D_Q = q - Q'_a - a k_a - \( A - a \) k_i . $

At either endpoint the certificate proves $D_Q > 0.06$ and that the square bracket in (10.12) is at least $- 0.12 D_Q$. Together with (10.7) and entire comparison in $u$, these inequalities give

#[#set math.equation(numbering: n => "(10.13)")
 $ Q_b - b \( M_b - M_a \) - 0.12 g lt.eq Q_i lt.eq Q_a + a \( M_b - M_a \) + 0.12 g . $ <eq:src47>]

For example at the lower reference $delta gt.eq 0$ and $H gt.eq - 0.12 g D_Q$, so adding $0.12 g$ to $hat(Q)$ gives a supersolution. At the upper reference $delta lt.eq 0$ and $A - b lt.eq 0$, so subtracting $0.12 g$ gives a subsolution.

On $\| z \| lt.eq 12$ the test is #raw("checkH"). It uses (10.7), $V_i gt.eq \( 9 \/ 7 \) k_i l_i^(3 \/ 2)$, and the possible same-position slope interval obtained by inverting (10.10); the inversion is described below. The term $- a k_i delta$ is discarded only at the upper reference, where it is nonnegative. The damping uses the worst possible positive part of $A - a$. For $x gt.eq 12$, the reference tail certification gives, with $S = partial_x log P_a \( plus.minus x \)$,

$ \| S \| < 0.071 \, #h(2em) \| x S' + S \| < 0.0055 . $

On the positive side $M_i lt.eq M_b$ is Gaussian-small, and so is $k_i$ by a secant from $z - 1$; also $Q_a lt.eq 0$ and $\| Q'_a \| < 0.0064$. On the negative side

$ M_i = x + X_i \, quad X_i lt.eq X_b < 1.2 dot.op 10^(- 6) \, quad l_i lt.eq x X_b \( - x + 1 \/ x \) < 2 dot.op 10^(- 5) . $

There $Q_a = - S$, $Q'_a = S'$, and the leading terms of the bracket are $x S' + S$. The adverse remainder terms $X_i S'$, $- l_i S$, $- a M_i l_a$, and $- a k_i delta$ have total absolute size below $0.0001$, using (10.6) and decrease of $x e^(- p x^2)$ in this range. Since $D_Q gt.eq 0.09 - 0.0064$, these estimates prove the required tail inequalities.

=== 10.6 Inverse-coordinate functionals and their enclosures <subsec:contr-functional>

The comparisons now give bounds for the fields at every entire time. We use them to evaluate a signed integral whose sign determines whether $A$ lies above or below a tested value. Curvature is compared at equal slope, so we first express the other fields in that same coordinate.

The primitive reconstruction formulas are

#[#set math.equation(numbering: n => "(10.14)")
 $ M \( k \) = integral_0^k frac(j, V \( j \)) thin upright(d) j \, #h(2em) X \( k \) = integral_k^1 frac(1 - j, V \( j \)) thin upright(d) j \, #h(2em) z \( k \) = X \( k \) - M \( k \) . $ <eq:src50>]

Indeed $z_k = - 1 \/ V$, $M_k = k \/ V$, and $X_k = - \( 1 - k \) \/ V$; the zero constants at the appropriate tails follow from the value barriers. These formulas fix the spatial origin, so no translation parameter is suppressed when comparing curvatures at equal $k$.

For a tested coefficient $xi$ and a nonnegative number $c_(+)$ define

$ N_xi \( V \, P \) = integral_0^1 P / V #scale(x: 120%, y: 120%)[\[] V^2 + c_(+) \( M X - t_k \) - 2 xi k t_k #scale(x: 120%, y: 120%)[\]] thin upright(d) k . $

The critical identities have the following homogeneous form:

#[#set math.equation(numbering: n => "(10.15)")
 $ integral_(bb(R)) \( M X - k l \) P thin upright(d) z = 0 \, #h(2em) integral_(bb(R)) V^2 P thin upright(d) z = 2 A integral_(bb(R)) k^2 l P thin upright(d) z . $ <eq:contr-homogeneous>]

They hold for each critical entire limit by (10.2), and for each stationary reference at a root of $lambda \( a \) = a$. For every input satisfying these identities, change of variables gives exactly

$ N_xi \( V_i \, P_i \) = 2 \( A - xi \) integral_0^1 P_i / V_i k t_k thin upright(d) k . $

The value comparisons give Gaussian tails for $M X$ and $k l$, and bounded $Q_i$ gives at most exponential growth of $P_i$. The integrals are therefore finite; the one on the right is strictly positive. Thus a sign enclosure for $N_xi$ bounds $A$ at every time; no assumption of stationarity of the input is involved.

The remaining construction turns the value, curvature and log-slope comparisons into enclosures of this functional. All comparison bounds apply to inputs before the identities (10.15) are imposed; only the conversion of a functional sign into a coefficient bound uses those identities.

Here we specify the mathematical meaning of the interval operations used in the certificate. Its middle grid covers $\[ kappa \, 1 - kappa \]$, where $kappa = 2^(- 38)$, and contains $1 \/ 2$ as a cell boundary. A #emph[box] is an interval containing every value of a function throughout one closed grid cell. A sum of boxes times cell widths encloses the corresponding integral. The operation #raw("partialsum") bounds a primitive ending anywhere in a cell: from the inclusive full-cell sum it subtracts that cell’s box multiplied by the interval from zero to its width. The operation #raw("anchored") forms the analogous signed primitive from $1 \/ 2$. Thus endpoints and partial cells are included, not replaced by point sampling.

The object #raw("Env") applies (10.10) with

$ r_h = 1 + g e_a \, quad r_l = 1 - 1.1 g e_b \, #h(2em) V_h = r_h W_a \, quad V_l = r_l W_b . $

To bound $M$ and $X$ below, integrate $1 \/ V_h$ in (10.14), writing it as the known $a$-reference primitive plus the correction $\( 1 \/ r_h - 1 \) \/ W_a$. Use the $b$-reference and $1 \/ r_l$ for upper bounds. Since $g lt.eq 0.41$ and $0 lt.eq e lt.eq 0.13$,

$ \| 1 \/ r_h - 1 \| lt.eq 0.16 g \, #h(2em) \| 1 \/ r_l - 1 \| lt.eq 0.16 g . $

Hence the omitted correction in each primitive tail costs at most $0.16 g$ times the corresponding reference tail primitive. The coarser direct factor bound in #raw("adjusted") is a second valid enclosure, and intersection improves the result.

Subtracting the primitive bounds encloses $z_i \( k \)$. A spatial range query in (10.13), with this position box as input, then bounds $Q_i \( z_i \( k \) \)$. Together with (10.10) and $Q_i lt.eq 0$ it yields cellwise bounds $s_l \, s_h$ for

$ frac(upright(d), upright(d) k) log P_i \( k \) = - frac(Q_i \( z_i \( k \) \), V_i \( k \)) . $

Except in the final local comparison, normalize $P_i \( 1 \/ 2 \) = 1$ in inverse coordinates. The primitive of these slope bounds is the #raw("logp") enclosure. This normalization is made separately at each fixed time, after the evolution comparisons. It preserves $Q_i$ and the homogeneous identities $integral \( M X - k l \) P_i = 0$ and $integral V_i^2 P_i = 2 A integral k_i^2 l_i P_i$. No evolution equation for this renormalized density is used in the functional tests.

Conversely, the test of (10.12) needs possible slope values at a given spatial position. The lower position bounds are replaced by their prefix minima and the upper bounds by their suffix maxima, which preserves enclosure and makes inversion monotone. Invert the resulting position intervals against the given spatial cell. At a clipped endpoint include the corresponding entire $k$ tail. The checked edge positions straddle the central region: the positive edge is above $4$, and the negative edge below $- 5.5$. A spatial cell beyond an edge uses that extreme slope cell and its tail. This is #raw("possiblek"). Thus the density comparison has no circular dependence on an assumed bound for $Q_i$ in its own residual test: #raw("checkH") uses only $M$ and $V$ enclosures to bound its input slopes.

Several uniform tail bounds will be used in the integral tests. Equation (10.13) gives $Q_i gt.eq - 0.4$ for $z lt.eq - 5.5$: the central reference table checks $Q_b > - 0.28$ and $X_b < 0.03$ there, and the reference $S$ estimates continue the bounds outside the table. Also #raw("logp") verifies $P_i \( 1 - kappa \) lt.eq e^5$. The two curvature factors lie in $\[ 0.94 \, 1.054 \]$. For either reference let $x_c$ be the absolute position of its grid edge in the tail under consideration. The checked bounds give $x_c < 20$, $x_c > 6$ on the positive side, and $2 p x_c > 2$ on the negative side. Integration of the reference slope bounds gives

$ k_a \( x \) lt.eq kappa e^(- q \( x^2 - x_c^2 \)) \, & x gt.eq x_c quad upright("(positive tail)") \,\
l_a \( - x \) lt.eq kappa e^(- p \( x^2 - x_c^2 \)) \, & x gt.eq x_c quad upright("(negative tail)") . $

The same statements hold at $b$. In the negative tails $W lt.eq \( x + 1 \) l$, by (10.6). On the positive tails the bound $W lt.eq \( x + 2 \) k$ suffices.

=== 10.7 From signed integral tests to a narrow interval <from-signed-integral-tests-to-a-narrow-interval>

First take $c_(+) = 0$. To prove an upper bound, use the monotonicity in $V > 0$ of $V - 2 xi k t_k \/ V$ and replace $V_i$ by $V_h$. Define $p_h$ on the middle grid by its piecewise constant logarithmic slope $s_l$, anchored by $p_h \( 1 \/ 2 \) = 1$. Then $P_i \/ p_h$ is nondecreasing. The upper #raw("coarse") test verifies that the right cumulatives of

$ f_h = p_h (V_h - 2 xi frac(k t_k, V_h)) $

are negative, with margin $10^(- 7)$ until the far region $k > 0.95$, where the integrand itself is checked negative. If $F_h \( k \) = integral_k^(1 - kappa) f_h$, integration by parts gives

$ integral_kappa^(1 - kappa) P_i / p_h f_h = (P_i / p_h) \( kappa \) F_h \( kappa \) + integral_kappa^(1 - kappa) F_h thin upright(d) \( P_i \/ p_h \) lt.eq - 10^(- 7) (P_i / p_h) \( kappa \) . $

In the negative spatial tail the actual integrand remains negative:

$ frac(V_i^2, k^2 l) lt.eq 1.054^2 frac(\( x + 1 \)^2 l_a, k^2) \, $

which is Gaussian-small from the edge onward. In the positive spatial tail $P_i$ is increasing in $k$, $p_h \( kappa \) lt.eq 1$, and the only harmful term has $integral_0^kappa P_i V_i thin upright(d) k < kappa \( P_i \/ p_h \) \( kappa \)$ by (9.21). The strict margin therefore survives both tails.

For a lower bound use $V_l$ and $p_l$ with logarithmic slope $s_h$. Then $P_i \/ p_l$ is nonincreasing. The lower #raw("coarse") test checks positive left cumulatives with the same margin, except in $k < 0.05$, where the integrand itself is positive. Integration by parts with left cumulatives gives a lower bound $10^(- 7) \( P_i \/ p_l \) \( 1 - kappa \)$ on the middle integral. Beyond the positive edge actual positivity follows from $V_l gt.eq 0.94 x k$ in $b$-reference position. On the negative side the possible negative contribution is at most

$ (P_i / p_l) \( 1 - kappa \) frac(2 xi e^5, 0.94) integral_(x_c)^oo l_b \( - x \) e^(0.43 \( x - x_c \)) thin upright(d) x < 10^(- 7) (P_i / p_l) \( 1 - kappa \) . $

Here $p_l \( 1 - kappa \) lt.eq e^5$, and $x_i - x_(i \, c) lt.eq \( x_b - x_(b \, c) \) \/ 0.94$, by the lower curvature bound. The Gaussian rate $2 p x_c > 2$ proves the last inequality (even the bound $kappa \/ \( 2 - 0.43 \)$ for the integral suffices). This establishes the analytic validity of every #raw("coarse") sign test.

The sharper test uses $c_(+) = 0.3$. Fix the reference $r$ with $a_r = 0.293650$, which lies in every interval to which this test is applied. At fixed inverse coordinate $k$, set

$ epsilon.alt = log \( V_i \/ V_r \) \, #h(2em) pi = log \( P_i \/ P_r \) \, #h(2em) v_sigma = V_r e^(sigma epsilon.alt) \, quad p_sigma = P_r e^(sigma pi) \, quad 0 lt.eq sigma lt.eq 1 . $

This is interpolation in the functional only. Define $M_sigma \, X_sigma$ by (10.14); no interpolated PDE is claimed or needed. Both endpoints, and hence their geometric interpolants and interpolated logarithmic density slopes, lie in #raw("Env")’s envelopes. It bounds $epsilon.alt$ and $pi'$ by #raw("eps") and #raw("pis"), and bounds $pi$ by the anchored primitive of #raw("pis"). The interpolated primitives are obtained by correcting the $r$ primitives. On their omitted tails $\| e^(- sigma epsilon.alt) - 1 \| < 3$ by Lemma 67; the code uses the harmless larger constant $3.01$. Intersecting with the static envelopes remains valid.

Let $v \, p \, M \, X$ denote these interpolated profiles, and put $S = c_(+) \( M X - t_k \) - 2 xi k t_k$. Differentiating the middle-grid contribution gives $integral \( g_p pi + g_v epsilon.alt \)$, up to the explicitly bounded primitive-tail terms, where

#[#set math.equation(numbering: n => "(10.16)")
 $ g_p & = p / v \( v^2 + S \) \,\
g_v & = p / v \( v^2 - S \) - c_(+) k / v integral_k^(1 - kappa) p / v X thin upright(d) j - c_(+) l / v integral_kappa^k p / v M thin upright(d) j . $ <eq:src51>]

The integration variable in the inner integrals is $j$, with every profile there evaluated at $j$. To verify the formula, differentiate (10.14):

$ partial_sigma M \( k \) = - integral_0^k frac(j epsilon.alt \( j \), v \( j \)) thin upright(d) j \, #h(2em) partial_sigma X \( k \) = - integral_k^1 frac(\( 1 - j \) epsilon.alt \( j \), v \( j \)) thin upright(d) j . $

The local factors $p \/ v$ and $v^2$ give the first terms in (10.16); Fubini for the two primitive derivatives gives its last terms. The omitted Fubini regions are bounded in absolute value by

$ cal(E)_(upright("prim")) = 6 M_r \( kappa \) integral_kappa^(1 - kappa) c_(+) p / v X thin upright(d) k + 6 X_r \( 1 - kappa \) integral_kappa^(1 - kappa) c_(+) p / v M thin upright(d) k . $

Indeed $\| epsilon.alt \| V_r \/ v lt.eq 3.8 log 3.8 < 6$. This is #raw("terror"), checked below $3 dot.op 10^(- 7)$ uniformly on each interpolation-parameter box.

Since $pi \( 1 \/ 2 \) = 0$, the density term can instead be expressed against $pi'$: its coefficient is $- integral_kappa^k g_p$ for $k < 1 \/ 2$ and $integral_k^(1 - kappa) g_p$ for $k > 1 \/ 2$. This is just Fubini applied to the anchored primitive; there is no endpoint term. The code intersects this enclosure with the direct enclosure for $integral g_p pi$. It integrates the resulting derivative enclosures in $sigma$ and adds them to the directly enclosed reference middle integral, called #raw("base").

To recover a sign for the full functional, add an absolute bound for the actual tails. On the positive side $P_i lt.eq 1$, $V_i lt.eq 1$; moreover

$ frac(upright(d) k, V_i) lt.eq frac(upright(d) x_b, 0.94) \, #h(2em) M_i X_i lt.eq frac(M_b X_b, 0.94^2) lt.eq 1.2 k . $

On the negative side the corresponding estimates are $M_i X_i lt.eq 7 l$ and $P_i lt.eq e^5 e^(0.43 \( x_b - x_(b \, c) \))$. For the term $P_i V_i thin upright(d) k$, use the upper reference instead:

$ P_i V_i thin upright(d) k lt.eq 1.054 e^5 \( x_a + 1 \)^2 l_a^2 e^(1.52 \( x_a - x_(a \, c) \)) thin upright(d) x_a . $

The exponential factor uses the position-change bound $3.8$ from (10.9) and $3.8 dot.op 0.4 = 1.52$. Integrating with the tail rates above, and $2 xi < 1.1$, bounds the total actual tail by $3 dot.op 10^(- 7)$. In fact a much smaller explicit allowance suffices. With $s = x - x_c$ and $e^5 < 149$, the positive-tail contribution is at most

$ kappa + 1.76 / 0.94 kappa / 2 < 7.05 dot.op 10^(- 12) . $

Here $\| c_(+) \( M X - t_k \) - 2 xi k t_k \| lt.eq 1.76 k$ and the tail rate is at least $2$. The negative-tail contribution excluding $P_i V_i$ is at most

$ frac(3.5 dot.op 149, 0.94) frac(kappa, 2 - 0.43) < 1.30 dot.op 10^(- 9) \, $

since the corresponding numerator is at most $3.5 l$. Its remaining $P_i V_i$ contribution is at most

$ 1.054 dot.op 149 thin kappa^2 integral_0^oo \( 21 + s \)^2 e^(- 2.48 s) thin upright(d) s < 4 dot.op 10^(- 19) . $

These bounds follow from $x_c < 20$ and the displayed Gaussian rates; their sum is below $1.31 dot.op 10^(- 9)$. Thus the allowance $10^(- 6)$ in #raw("nonlineartest") covers both the primitive-tail error and the actual tails with slack. This proves the analytic validity of that sign test as well.

The certificate applies the following interval reductions. Entries are the resulting allowed intervals for $A$, in units of $10^(- 3)$:

$ upright("test") & upright("successive intervals")\
mono("coarse") & \[ 167 \, 410 \] \, \[ 183 \, 410 \] \, \[ 185 \, 400 \] \, \[ 193 \, 397 \] \, \[ 197 \, 390 \] \,\
 & \[ 203 \, 386 \] \, \[ 207 \, 381 \] \, \[ 211 \, 377 \] \, \[ 215 \, 373 \] \, \[ 218 \, 369 \] \, \[ 220 \, 370 \] \,\
mono("nonlineartest") & \[ 228 \, 370 \] \, \[ 231 \, 368 \] \, \[ 234 \, 363 \] \, \[ 239 \, 358 \] \, \[ 244 \, 350 \] \,\
 & \[ 251 \, 341 \] \, \[ 258 \, 332 \] \, \[ 266 \, 324 \] \, \[ 272 \, 316 \] \, \[ 277 \, 311 \] \,\
 & \[ 281 \, 307 \] \, \[ 283 \, 304 \] \, \[ 285 \, 303 \] . $

The initial interval is $\[ 0 \, 0.410 \]$. Widening the upper endpoint from $0.369$ to $0.370$ before the last coarse step is harmless; only the improved lower endpoint requires a sign test there. At each step, the input satisfies (10.15) and its coefficient lies in the incoming interval for every entire time. The comparisons and sign test therefore apply at every time, giving the resulting interval on the whole time axis. That whole-time enclosure is the hypothesis for the next round of comparisons. The resulting conclusion is

$ 0.285 lt.eq A \( v \) lt.eq 0.303 quad upright("for all entire times ") v \, #h(2em) sup_v \| A \( v \) - a_(*) \| < 0.01 . $

=== 10.8 A local barrier at the root <a-local-barrier-at-the-root>

The signed tests have placed every input satisfying (10.15) within distance $0.01$ of the root. To turn this interval bound into equality, we need comparison errors that are proportional to the remaining deviation. Put $d = sup_v \| A \( v \) - a_(*) \| lt.eq 0.01$. At the root reference,

#[#set math.equation(numbering: n => "(10.17)")
 $ 1 - d L \( k \) lt.eq frac(V_i \( k \), W_(*) \( k \)) lt.eq 1 + d L \( k \) \, #h(2em) L \( k \) = 0.26 + 1.30 k - 1.86 k^2 + 3.25 k^3 . $ <eq:src48>]

For $d > 0$ let $C_L = W^2 L_(k k) \/ 2 + W W_k L_k$. The two required stationary inequalities, for $R_0 = 1 plus.minus d L$, are

$ R_0^2 C_L - A t_k L_k + R_0 \[ - \( R_0 + 1 \) D_a L + \| T_a \| \] < 0 \, #h(2em) plus.minus d C_L - R_0 D_a < 0 . $

Scaling and entire comparison work exactly as in (10.11). In the linearization just given, the local trial $S = C \( 1 plus.minus d L \( k \( z \) \) \)$ has $S_z = minus.plus C d W L_k$ and $S_(z z) = plus.minus C d \( W^2 L_(k k) - W_z L_k \)$. The Gaussian derivative bounds make $S_(z z)$ and $beta S_z$ bounded here too. The test #raw("localcheck") verifies these inequalities on its central $k$ grid, enclosing the root by the reference interval $\[ 0.293650 \, 0.293655 \]$ and (10.7), (10.10), (10.13). In particular, the root is an admissible stationary input for (10.13); this encloses its unknown $Q_(*)$ between the two tabulated endpoint expressions without using rigidity. The omitted positive and negative tails have respectively $z > 7$ and $x = - z > 10$, as checked by those enclosures; both root edge positions also have absolute value below $20$. The reference Gaussian tail bounds stated above therefore apply to the root. On the positive side the preceding bound for $T_a$ applies and $\| C_L \| < 0.001$, using $W lt.eq \( x + 2 \) e^(- q x^2)$ and $\| W W_k \| lt.eq 2 \| B \| W + 2 a t_k$. On the negative side $U_0 < 0.059$, so

$ T_a in \[ - 1 - U_0 \, 0 \] \, #h(2em) D_a gt.eq p - a U_0 > 0.1889 \, #h(2em) L > 2.94 . $

Again $\| C_L \| < 0.001$, now using $W lt.eq \( x + 1 \) e^(- p x^2)$. In both tails $t_k \| L_k \| < 0.001$. These bounds give the displayed strict inequalities, since $0 < L < 3$ and $1.97 dot.op 0.1889 dot.op 2.94 > 1.09$.

At the same spatial position one also has

#[#set math.equation(numbering: n => "(10.18)")
 $ \| M_i - M_(*) \| lt.eq 0.65 d \, #h(2em) \| Q_i - Q_(*) \| lt.eq 2 d . $ <eq:src49>]

For the first, the difference equation used in (10.7) is controlled by the certified bound

$ sup_z frac(M_(*) l_(*), q - \( a_(*) + 0.01 \) l_(*)) < 0.65 . $

The finite test covers the inverse middle grid. Outside that grid, $z > 7$ or $x = - z > 10$, while the denominator exceeds $0.196$. On the positive tail $M_(*) l_(*) lt.eq e^(- z^2 \/ 2) \/ z$; on the negative tail $M_(*) l_(*) lt.eq \( x + 1 \) e^(- 0.2063465 x^2)$, by (10.6) and $X_(*) < 1$. These decreasing envelopes make the ratio less than $10^(- 6)$ on both omitted tails. Thus the displayed supremum bound holds on the whole line, and the constants $plus.minus 0.65 d$ are barriers. For the second, use (10.12) in absolute value. The central test checks positive damping and, cell by cell,

$ a_(*) thin 0.65 + frac(a_(*) \( 1 - a_(*) \) thin 0.65 + sup \| upright("bracket in ") upright("(10.12)") \|, D_(Q \, min)) < 2 . $

It obtains the possible $k_i$ range by the outward inversion described above, using the larger position boxes from (10.17) and (10.14); at a clipped tail cell the extra $0.0001$ in its upper curvature bound is justified by (9.21): outside the inverse grid, $t_k lt.eq kappa = 2^(- 38)$, so $W_(*) lt.eq \( 6 \/ 5 \) kappa^(3 \/ 4) < 3.162 dot.op 10^(- 9)$. Equation (10.17) increases this by a factor at most $1.03$; the overlapping grid cell is already enclosed by the range query. For the spatial tails, $a_(*) + 0.01 < 0.31$ gives $M_i lt.eq M_0.31$ by (10.7), and also $X_i lt.eq X_0.31$. Convex secants and (10.6) give, for $x gt.eq 12$,

$ k_i \( x \) & lt.eq M_0.31 \( x - 1 \) lt.eq frac(e^(- \( x - 1 \)^2 \/ 2), x - 1) < 4.829 dot.op 10^(- 28) \,\
l_i \( - x \) & lt.eq x X_0.31 \( - x + 1 \/ x \) lt.eq frac(x e^(- 0.19 \( x - 1 \/ x \)^2), 0.38 \( x - 1 \/ x \)) < 5.075 dot.op 10^(- 12) . $

The bounding functions decrease on this range. Substitution in (9.21), rather than the secants alone, yields $V_i < 4.059 dot.op 10^(- 9) < 0.0001$ on both tails. The same $S$ bounds and cancellation used above give bracket absolute value below $0.08$ and $D_Q > 0.18$; with $\| delta \| lt.eq 0.65 d$ these imply the second inequality of (10.18) there also.

=== 10.9 Strict contraction and rigidity <strict-contraction-and-rigidity>

#thm([Proposition 10.4.])[
  (Rigidity of the logarithmic-time limit).  #emph[Let $\( M_i \, P_i \, A \)$ be a density input as defined in Subsection 10.4, and suppose that the two identities (10.15) hold at every entire time. Then $A equiv a_(*)$. In particular every entire limit of the critical rescaled profiles has this coefficient, and 
$ lim_(tau arrow.b 0) frac(tau gamma \( tau \), chi \( tau \)) = a_(*) \, #h(2em) lim_(tau arrow.b 0) frac(log chi \( tau \), log tau) = a_(*) . $

 The root of $lambda \( a \) = a$ in the certified interval is unique.]
] <prop:contr-rigidity>

#proof[
  Let $d = sup \| A - a_(*) \| < 0.01$. If $d = 0$ there is nothing to prove; assume $d > 0$. Interpolate from the root to the input as above, with $c_(+) = 0.3$ and $xi = a_(*)$. Normalize the two densities at the #emph[same spatial position] $z_c = z_(*) \( 1 \/ 2 \)$ to have value one. This normalization preserves both identities (10.15). Unlike the previous normalization, it does not require the input density at its own median slope to be one.
  Our target is $\| A \( v \) - a_(*) \| lt.eq c_(upright("loc")) d$ at every entire time, with $c_(upright("loc")) < 1$. We obtain it by bounding the change in the signed functional from its zero value at the root and dividing by the positive denominator in the identity for $N_(a_(*))$. The estimates below control that one quotient, including its endpoint tails, by a constant times $d$.
  Write $W = W_(*)$. Equation (10.17) implies
  $ frac(\| epsilon.alt \|, d) lt.eq E_m := frac(L, 1 - 0.01 L) \, #h(2em) \| \( V_i \/ W \)^(- sigma) - 1 \| lt.eq sigma d E_m \, #h(2em) E_m < 3.1 . $
  For the second inequality, if $V_i \/ W < 1$, convexity of $t mapsto \( V_i \/ W \)^(- t)$ puts its value below the chord on $\[ 0 \, 1 \]$; if $V_i \/ W gt.eq 1$, use $1 - e^(- x) lt.eq x$ and the logarithmic bound. Integrating $E_m \/ W$ with weights $k$ and $l$ in (10.14) gives bounds $L_M \, L_X$ for primitive changes divided by $sigma d$. Their sum $L_z$ bounds the position change:
  $ \| z_i \( k \) - z_(*) \( k \) \| lt.eq d L_z \( k \) . $
  The code arrays #raw("lm"), #raw("lx"), #raw("lz") enclose these functions; the global bounds $3.11 M_(*)$ and $3.11 X_(*)$ give convenient caps and tail allowances.
  The logarithmic density difference splits as
  $ pi \( k \) =  & log P_i \( z_(*) \( k \) \) - log P_(*) \( z_(*) \( k \) \)\
 & + log P_i \( z_i \( k \) \) - log P_i \( z_(*) \( k \) \) . $
  The first term is zero at $k = 1 \/ 2$ and has $k$-derivative bounded by $2 d \/ W$, by (10.18). The absolute value of the second is bounded by $d$ times #raw("shifts"): use the position interval $z_(*) plus.minus d L_z$ and (10.18) to bound $Q_i$ there by a range query for $Q_(*)$ plus $2 d$. Hence
  $ frac(\| pi \( k \) \|, d) lt.eq 2 \| z_(*) \( k \) - z_c \| + mono("shifts") \( k \) . $
  These estimates enclose the interpolated $v \, p \, M \, X$ on each of the four parameter subintervals used by #raw("localcheck").
  Apply (10.16) to the middle contribution, divided by $d$. The curvature term has the enclosure #raw("cv"); the density term has the enclosure #raw("cp"). For the latter, integrate by parts only the first, anchored, part of $pi$ just displayed, and bound the shift part directly. The primitive-tail error now uses $4$ instead of $6$: indeed
  $ frac(\| epsilon.alt \|, d) W / v lt.eq frac(3 \/ 0.97, 0.97) < 4 . $
  This holds on the full open interval $\( 0 \, 1 \)$, including the omitted tails, because (10.17) was proved there analytically. For example the omitted lower primitive derivative obeys
  $ 1 / d integral_0^kappa frac(j \| epsilon.alt \( j \) \|, v \( j \)) thin upright(d) j lt.eq 4 integral_0^kappa frac(j, W \( j \)) thin upright(d) j = 4 M_(*) \( kappa \) \, $
  and the upper primitive has the corresponding bound $4 X_(*) \( 1 - kappa \)$. These are precisely the two factors in the local #raw("terror") bound. The certificate again checks this error below $3 dot.op 10^(- 7)$. It also gives a positive lower bound, called #raw("den"), for
  $ D_i = 2 integral_0^1 P_i / V_i k t_k thin upright(d) k \, $
  by integrating its lower enclosure on the middle grid only. The last parameter box includes $sigma = 1$, so the denominator enclosure applies to the actual input.
  The full reference functional is exactly zero by the stationary identities at $a_(*)$. Therefore its tail contribution must be subtracted from the input tail contribution before applying the local bound. We bound this difference by differentiating along the interpolation, not by an error independent of $d$. Here are explicit bounds for that step. Equations (10.13) and (10.18), with the certified tight reference interval, give $\| Q_i \| lt.eq 1.5$. The value barriers give $M_(*) + X_(*) lt.eq x + 1.6$ and the certificate gives $\| z_c \| < 2$. Thus
  $ frac(\| pi \|, d) lt.eq 2 \( x + 2 \) + 1.5 dot.op 3.11 \( x + 1.6 \) < 7 x + 12 . $
  With $s = x - x_c gt.eq 0$, the interpolated density satisfies
  $ p lt.eq 5 e^5 e^(0.47 s) quad upright("on the negative spatial tail") \, #h(2em) p lt.eq 5 e^(0.07 s) quad upright("on the positive spatial tail") . $
  At the edge the normalization estimate above, $d < 0.01$, and $x_c < 20$ permit the factor $5$. Along a tail one may use the reference density bound together with $p = P_(*) exp \( sigma pi \)$ and the $7 s$ part of the last display. On the negative side the reference has logarithmic growth bounded by $0.4$; the positive-side reference density is at most its edge value. This gives exactly the displayed exponents.
  Every primitive derivative has absolute value at most $3.1 d$ times the primitive itself: the full-interval bound $\| epsilon.alt \( j \) \| < 3.1 d$ and positivity imply
  $ \| partial_sigma M_sigma \( k \) \| lt.eq 3.1 d integral_0^k frac(j, v_sigma \( j \)) thin upright(d) j = 3.1 d M_sigma \( k \) \, $
  and likewise for $X_sigma$. The reference tail bounds and $v_sigma gt.eq 0.97 W$ dominate these differentiated integrals, so differentiation under their endpoint integrals is justified. Therefore the pointwise absolute functional derivative, divided by $d$, is at most
  $ p / v [(frac(\| pi \|, d) + 3.1) #scale(x: 120%, y: 120%)[\(] v^2 + 0.3 \( M X + t_k \) + 2 a_(*) k t_k #scale(x: 120%, y: 120%)[\)] + 0.3 dot.op 6.2 M X] . $
  Use $upright(d) k \/ v lt.eq upright(d) x \/ 0.97$. On the negative side, $M X lt.eq 2.6 l$ and $v^2 lt.eq 1.061 \( x + 1 \)^2 l^2$; on the positive side, $M X lt.eq 1.2 k$ and $v^2 lt.eq 1.061 \( x + 2 \)^2 k^2$. For the product bound on the negative side, $p_(*) := q - a_(*) gt.eq 0.2063465$ and $x gt.eq 10$ give explicitly
  $ frac(M X, l) lt.eq frac(1 \/ \( 2 p_(*) \) + kappa \/ \( 400 p_(*)^2 \), 0.97^2) < 2.576 < 2.6 \; $
  on the positive side, $x gt.eq 7$ gives $M X \/ k lt.eq \( 1 + kappa \/ 49 \) \/ 0.97^2 < 1.063 < 1.2$. The reference tail bounds give $l$ or $k$ at most $kappa e^(- 2 s)$, and $x_c < 20$. Integrating proves a total tail error below $10^(- 6)$ after division by $d$. More explicitly, the non-$v^2$ part on the negative side is bounded by
  $ frac(5 e^5, 0.97) thin kappa integral_0^oo #scale(x: 120%, y: 120%)[\[] \( 156 + 7 s \) 1.68 + 4.84 #scale(x: 120%, y: 120%)[\]] e^(- 1.53 s) thin upright(d) s . $
  The positive-side non-$v^2$ counterpart is
  $ 5 / 0.97 thin kappa integral_0^oo \[ \( 156 + 7 s \) 1.26 + 2.232 \] e^(- 1.93 s) thin upright(d) s . $
  The two $v^2$ contributions are bounded respectively by
  $ & frac(5 e^5, 0.97) thin 1.061 kappa^2 integral_0^oo \( 156 + 7 s \) \( 21 + s \)^2 e^(- 3.53 s) thin upright(d) s \,\
 & 5 / 0.97 thin 1.061 kappa^2 integral_0^oo \( 156 + 7 s \) \( 22 + s \)^2 e^(- 3.93 s) thin upright(d) s . $
  Using $e^5 < 149$ and $integral_0^oo s^n e^(- b s) thin upright(d) s = n ! \/ b^(n + 1)$ reduces their sum to a rational expression below $5.035 dot.op 10^(- 7)$. This proves the stated $10^(- 6)$ allowance. Including the primitive-tail error, the $2 dot.op 10^(- 6)$ used by #raw("localcheck") is sufficient.
  The certified middle derivative bound plus these errors, divided by the positive denominator enclosure, gives a number $c_(upright("loc")) < 0.95$. Hence at each entire time
  $ \| A \( v \) - a_(*) \| = frac(\| N_(a_(*)) \( V_i \, P_i \) \|, D_i) lt.eq c_(upright("loc")) thin d . $
  Taking the supremum yields $d lt.eq c_(upright("loc")) d$, contradicting $d > 0$. Thus every such density input has $A equiv a_(*)$. In particular this holds for every critical entire limit. Compactness now implies convergence of the original $A$ to $a_(*)$: otherwise a sequence with a fixed nonzero deviation would produce an entire limit with that deviation at time zero. Finally $upright(d) log chi \/ upright(d) log tau = A$; integrate between a fixed positive $tau_0$ and $tau$, divide by $log tau$, and use the convergence of $A$ to obtain the logarithmic susceptibility limit.
  A stationary reference at any other root in the certified interval is a density input: its value and curvature bounds were proved above, and its positive eigenfunction has bounded nonpositive logarithmic slope satisfying (10.3). The stationary integral identities are exactly (10.15). The implication just proved therefore forces its constant coefficient to equal $a_(*)$. This proves uniqueness in the interval without assuming that the other reference arises as a critical translation limit. ◻
]

== 11 The cumulative exponents <sec:conclusion>

We now deduce the cumulative exponents from the selected susceptibility slope. This completes the main theorem using the finite inequalities invoked in Section 10; their verification, including rounding and exterior error bounds, follows in Section 12.

#proof[
  #emph[Completion of Theorem 1.] Sections 5 and 6 establish the common threshold and mixture comparison. Theorem 55 identifies the limits in the prescribed order (1.4), followed by removal of the gap cutoff, using a nonnegative terminal gap $Y = H_1$ and a nonnegative terminal force variable $R$ on the common Brownian space. If $c = bb(E) R$, then
  #[#set math.equation(numbering: n => "(11.1)")
   $ G_J \( u \) = bb(P) \( 0 < Y lt.eq u \) \, #h(2em) F_J \( s \) = bb(P) (frac(R, alpha_c c) lt.eq s med mid(bar.v) med R > 0) . $ <eq:concl-observables>]
  In particular $bb(P) \( Y = 0 \) = bb(P) \( R > 0 \) = 1 \/ alpha_c$. The gap convention removes exactly the first of these masses; conditioning in the second formula removes the noncontact mass of $R$. The small-force cutoff estimate and strong $L^2$ convergence give a probability law with no atom at zero, and
  $ bb(E) [frac(R, alpha_c c) thin mid(bar.v) thin R > 0] = frac(c, alpha_c c thin bb(P) \( R > 0 \)) = 1 . $
  We now restore physical time as the argument of $chi$ and $w$, and write $tau = 1 - t$. Proposition 68 gives
  $ lim_(tau arrow.b 0) frac(log chi \( 1 - tau \), log tau) = a_(*) . $
  Equivalently $chi \( 1 - tau \) = tau^(a_(*) + o \( 1 \))$. The scale estimate in Section 9 states
  $ w \( 1 - tau \) = integral_(1 - tau)^1 chi \( t \)^(- 2) thin upright(d) t asymp frac(tau, chi \( 1 - tau \)^2) = tau^(1 - 2 a_(*) + o \( 1 \)) . $
  Together with (9.20), this yields
  $ bb(P) \( 0 < Y lt.eq sqrt(tau) \) & = tau^(a_(*) + o \( 1 \)) \,\
bb(P) \( 0 < R lt.eq sqrt(w \( 1 - tau \)) \) & = tau^(a_(*) + o \( 1 \)) . $
  For the gap distribution set $u = sqrt(tau)$ to obtain $G_J \( u \) = u^(2 a_(*) + o \( 1 \))$. For the force distribution, $w \( 1 - tau \)$ is continuous and strictly increasing in $tau$, and tends to zero with $tau$. Its square root therefore covers all sufficiently small positive cutoffs. Taking logarithms of the second display gives the force exponent $2 a_(*) \/ \( 1 - 2 a_(*) \)$. Conditioning and the fixed mean normalization in (11.1) change no logarithmic exponent. Thus (1.10) holds.
  Returning to the gap-exponent notation of Theorem 1, $gamma = 1 - 2 a_(*)$, the exponent relation is exact:
  $ 2 + theta = 1 + frac(2 a_(*), 1 - 2 a_(*)) = frac(1, 1 - 2 a_(*)) = 1 / gamma . $
  Both maps $a mapsto 1 - 2 a$ and $a mapsto 2 a \/ \( 1 - 2 a \) - 1$ are strictly monotone on the certified interval, in opposite directions. The endpoint arithmetic gives
  $ 0.4126930 < gamma < 0.4126934 $
  and
  $ 0.4231063544994904 dots.h < theta < 0.4231087030795289 dots.h \, $
  which implies the stated rational decimal bounds. Finally, the mixture comparison identifies the fixed-temperature row marginals on an entire density neighborhood above the common threshold. Each subsequent ordered limit and each exponent is therefore the same for every fixed $epsilon in \[ 0 \, epsilon_0 \)$. ◻
]

== 12 Verification of the finite certificate <sec:certificate>

The computer-assisted part of the argument has three logically distinct components: integer certificates for the stationary ODEs, analytic estimates that turn small residuals into errors relative to the exact profiles, and interval bounds for the remaining integrals. This section describes the interface between these components. In particular, a successful floating-point calculation alone is not the assertion being used: every computed box must contain the corresponding exact mathematical quantity. We first certify the reference profiles and eigenfunction logarithmic derivatives using integer residuals and analytic error estimates; we then enclose the barrier and integral tests by interval arithmetic and record the complete execution.

Throughout this section $q = 1 \/ 2$, $0 lt.eq a lt.eq .41$, $p = q - a gt.eq .09$, and

$ B \( z \) = q z + a M_a \( z \) \, #h(2em) k = - M'_a \, #h(2em) l = 1 - k \, #h(2em) X = z + M_a . $

The existence, uniqueness, and monotonicity of $M_a$, its ODE and tail bounds (10.6), and the confining ground-state construction of $P_a$ are analytic inputs from Section 10. All decimal constants in inequalities below denote terminating decimals, hence rational numbers. Machine padding constants are discussed separately in Subsection 12.4.

The table maps the finite checks to their uses in Section 10. The enclosure proofs and recorded execution below establish the finite inequalities; the comparison principles and exterior estimates of that section supply their analytic consequences. The tail estimates used with each line have been established in Section 10; a finite grid by itself would not justify any statement over an infinite spatial domain.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Routine
], table.cell(rowspan: 1, colspan: 1)[Role in the analytic argument
]),
  table.cell(rowspan: 1, colspan: 1)[#raw("checkA")
], table.cell(rowspan: 1, colspan: 1)[Positivity of the cumulative lower bound (10.5), excluding an entire limit with $A gt.eq .41$.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("checkV")
], table.cell(rowspan: 1, colspan: 1)[Central strict inequalities (10.11), which validate the curvature barriers (10.10).
],
  table.cell(rowspan: 1, colspan: 1)[#raw("Env.checkH")
], table.cell(rowspan: 1, colspan: 1)[Central positive damping and source bounds for (10.12), hence the log-slope comparison (10.13), and the density bounds needed for integration tails.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("Env.coarse")
], table.cell(rowspan: 1, colspan: 1)[Signs of the left or right signed cumulatives for $c_(+) = 0$, with a $10^(- 7)$ allowance for the adverse tail.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("nonlineartest")
], table.cell(rowspan: 1, colspan: 1)[Signs of the full calibrated functional at $c_(+) = .3$, using geometric interpolation and (10.16), with a $10^(- 6)$ allowance.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("localcheck")
], table.cell(rowspan: 1, colspan: 1)[The local barriers (10.17), (10.18), a positive denominator, and the strict contraction coefficient, with a $2 dot.op 10^(- 6)$ allowance.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("certified")
], table.cell(rowspan: 1, colspan: 1)[Integer residual and shooting tests, including the opposite signs of $lambda \( a \) - a$ at the final two parameter values.
],
)
]

=== 12.1 Integer polynomial certificates <cert:integer>

Set $D = 10^36$ and $h = 1 \/ 100$. The program uses integer coefficients $c_n$ for the polynomial

$ tilde(M) \( z \) = D^(- 1) sum_(n = 0)^18 c_n s^n \, #h(2em) z = epsilon \( j + s \) h \, quad 0 lt.eq s lt.eq 1 \, quad epsilon in { - 1 \, 1 } . $

The input parameter is the rational number $a = A \/ upright("AD")$; initially $upright("AD") = 10^6$, and the two final parameter tests use $upright("AD") = 10^7$. The spatial equation is

#[#set math.equation(numbering: n => "(12.1)")
 $ M'' + 2 \( q z + a M \) M' - 2 p M = 0 . $ <cert:M-ode>]

After substitution of the polynomial, multiplication by the integer common denominator gives exactly the coefficient expression #raw("rhs(n)") in #raw("mstep"). Successive coefficients are obtained by integer division. Their manner of construction is only a way to find a good trial: certification uses the residual of the completed polynomial, not the accuracy of this recurrence as an ODE solver.

Specifically, if $r_n$ are the integer residual coefficients after the multiplication by $upright("AD") D^2$, the assertion in #raw("mstep") is

$ 10^23 sum_n \| r_n \| < upright("AD") D^2 . $

Because $0 lt.eq s lt.eq 1$, it proves, throughout the closed cell,

#[#set math.equation(numbering: n => "(12.2)")
 $ \| tilde(M)'' + 2 \( q z + a tilde(M) \) tilde(M)' - 2 p tilde(M) \| < 10^(- 23) . $ <cert:M-residual>]

At the next cell the initial value and the derivative in $s$ are the integer sums $sum c_n$ and $sum n c_n$. Thus joins are exactly $C^1$, including the join at zero: the two first derivative coefficients are chosen with opposite signs. Second derivatives may jump at joins; the comparison arguments below apply separately on cells and use continuity of the first derivative.

The routine #raw("mint"), with #raw("save=True"), additionally certifies

#[#set math.equation(numbering: n => "(12.3)")
 $ \| tilde(M) \( 24 \) \| < 10^(- 23) \, #h(2em) \| tilde(M) \( - 24 \) - 24 \| < 10^(- 23) . $ <cert:M-boundary>]

The derivative coefficient tests in #raw("certified") give $- 1.01 lt.eq tilde(M)' lt.eq .01$ on every cell. Indeed, for $k = - tilde(M)'$, the constant coefficient is the integer $- epsilon 100 c_1$, and the sum of the absolute values of the remaining coefficients is at most $100 sum_(n gt.eq 2) n \| c_n \|$; these are precisely #raw("kp") and #raw("rad").

#thm([Lemma 12.1.])[
  (Error of the stationary profile).  #emph[For every certified rational parameter, 
$ parallel M_a - tilde(M) parallel_(L^oo \( \[ - 24 \, 24 \] \)) < 10^(- 22) \, #h(2em) parallel M'_a - tilde(M)' parallel_(L^oo \( \[ - 24 \, 24 \] \)) < 4 dot.op 10^(- 20) . $

]
] <cert:M-error>

#proof[
  Let $E = M_a - tilde(M)$ and let $r$ denote the residual in (12.2). Subtraction gives
  #[#set math.equation(numbering: n => "(12.4)")
   $ E'' + 2 B E' - \( 2 p - 2 a tilde(M)' \) E = - r . $ <cert:M-difference>]
  The zero-order damping satisfies $2 p - 2 a tilde(M)' gt.eq .18 - .0082 > .17$. The true deviations from the hinge at $plus.minus 24$ are bounded, respectively, by $e^(- q 24^2) \/ 24$ and $e^(- p 24^2) \/ \( 2 p thin 24 \)$, by (10.6). Combining these with (12.3), the maximum principle applied to the constant barriers $plus.minus 10^(- 22)$ yields the first claim. At an interior join a strict positive maximum of the difference is excluded by the same one-sided argument, since its first derivative is continuous.
  On either half-line write $x = \| z \|$, $beta \( x \) = epsilon B \( epsilon x \)$, and $F = partial_x E \( epsilon x \)$. Equation (12.4) reads
  $ F' + 2 beta F = f \, #h(2em) \| f \| < 2.1 dot.op 10^(- 22) . $
  On the positive half-line $beta gt.eq q x$; on the negative half-line $beta = p x - a X gt.eq p x - .34$, using $X lt.eq .8$. Consequently the total magnitude of the negative part of $2 beta$ is at most $.34^2 \/ p < 1.29$. On $\[ 0 \, .1 \]$ we also have $beta lt.eq .38$. The integrating-factor formula for $F$, integrated once more between zero and $.1$, and $\| E \( .1 \) - E \( 0 \) \| < 2 dot.op 10^(- 22)$ now imply $\| F \( 0 \) \| < 2.4 dot.op 10^(- 21)$. Explicitly, the coefficient of $F \( 0 \)$ in this second integration is at least $.1 e^(- .076)$, whereas the source contribution has absolute value at most $.1^2 e^1.29 \( 2.1 dot.op 10^(- 22) \) \/ 2$. Finally, on $\[ 0 \, 24 \]$ the same formula gives
  $ \| F \( x \) \| lt.eq e^1.29 #scale(x: 120%, y: 120%)[\(] 2.4 dot.op 10^(- 21) + 24 dot.op 2.1 dot.op 10^(- 22) #scale(x: 120%, y: 120%)[\)] < 4 dot.op 10^(- 20) . $
  ◻
]

=== 12.2 The decaying eigenfunction branch at infinity <cert:tail>

For the polynomial-order branch of $P_a$, put $S_epsilon \( x \) = partial_x log P_a \( epsilon x \)$. The eigenvalue equation gives the Riccati equation

#[#set math.equation(numbering: n => "(12.5)")
 $ S' = 2 beta S - S^2 + 2 \( q - a k - lambda \) . $ <cert:Riccati>]

Let $p_(+) = q$ and $p_(-) = p$. For either sign set

#[#set math.equation(numbering: n => "(12.6)")
 $ c & = lambda \/ p_epsilon - 1 \, & d & = frac(c \( c - 1 \), 2 p_epsilon) \, & e & = frac(\( 2 c - 3 \) d, 2 p_epsilon) \,\
T \( x \) & = c / x + d / x^3 + e / x^5 \, & K & = frac(10 \| e \| + 3 d^2 + 30, p_epsilon) . $ <cert:tail-coefficients>]

The rational assertions in #raw("tailinit"), applied at all three tested values of $lambda$, verify $- .71 < c < .81$ and, on the negative side, $c > - .01$. The same bounds hold at $lambda = a_(*)$ in the final root bracket. On the positive side $p_(+) = 1 \/ 2$ and $\| c \( c - 1 \) \| < 1.215$; on the negative side $\| c \( c - 1 \) \| lt.eq 1 \/ 4$ and $p_(-) gt.eq .09$. These sided bounds imply

#[#set math.equation(numbering: n => "(12.7)")
 $ \| d \| < 1.4 \, #h(2em) \| e \| < 24 \, #h(2em) K < 3066 . $ <cert:tail-constants>]

#thm([Lemma 12.2.])[
  (Riccati tail enclosure).  #emph[For $x gt.eq 12$, the polynomial-order branch is uniquely determined by 
$ T \( x \) - K x^(- 7) lt.eq S_epsilon \( x \) lt.eq T \( x \) + K x^(- 7) . $

 It depends continuously on $lambda$ within each trial window. Moreover, 
#[#set math.equation(numbering: n => "(12.8)")
 $ \| S_epsilon \( x \) \| < .071 \, #h(2em) \| x S'_epsilon \( x \) + S_epsilon \( x \) \| < .0055 . $ <cert:tail-derivatives>]

]
] <cert:tail-enclosure>

#proof[
  First replace the coefficients in (12.5) by their limiting values $beta = p_epsilon x$ and $q - a k = p_epsilon$. For the residual $cal(R) \( S \) = S' - 2 beta S + S^2 - 2 \( q - a k - lambda \)$, direct expansion gives
  $ cal(R) \( T \) = frac(\( 2 c - 5 \) e + d^2, x^6) + frac(2 d e, x^8) + e^2 / x^10 . $
  Thus $x^6 \| cal(R) \( T \) \| lt.eq 6.62 \| e \| + d^2 + 1$ for $x gt.eq 12$. Replacing $T$ by $T plus.minus K x^(- 7)$ adds the leading term $minus.plus 2 p_epsilon K x^(- 6)$ and a remainder whose absolute value, after multiplication by $x^6$, is at most
  $ frac(\| - 7 + 2 c + 2 d \/ x^2 + 2 e \/ x^4 \| K, x^2) + K^2 / x^8 lt.eq .7 p_epsilon K . $
  The true coefficients differ from their limiting values by at most
  $ \| beta - p_epsilon x \| lt.eq frac(.41 e^(- p_epsilon x^2), 2 p_epsilon x) \, #h(2em) \| q - a k - p_epsilon \| lt.eq .41 e^(- p_epsilon x^2) . $
  Their additional residual cost, multiplied by $x^6$, is less than $8$. For example, the largest exponential envelope is obtained with $p_epsilon = .09$ at $x = 12$, since $x^6 e^(- p_epsilon x^2)$ is decreasing for these values; inserting $\| T plus.minus K x^(- 7) \| < .071$ proves the stated bound. The definition of $K$ leaves strict room:
  $ 1.3 p_epsilon K - \( 6.62 \| e \| + d^2 + 1 + 8 \) = 6.38 \| e \| + 2.9 d^2 + 30 > 0 . $
  Accordingly the lower barrier has positive residual and the upper barrier negative residual. These are the required signs for integration from larger to smaller $x$.
  Start at $T \( R \)$ at a finite $R > 12$ and integrate inward. Comparison keeps the solution within the barriers. Compactness on finite intervals supplies a limit as $R arrow.r oo$. If two such limits are compared, their difference satisfies a homogeneous first-order equation with coefficient $2 beta - S_1 - S_2 gt.eq p_epsilon x$ for $x gt.eq 12$. Inward integration therefore forces their difference to vanish as the comparison point tends to infinity. The same formula with the additional source $- 2 \( lambda_1 - lambda_2 \)$ proves continuity in $lambda$ on compact subintervals.
  The first estimate in (12.8) follows immediately from (12.7). For the second, substitute the enclosure into (12.5). The resulting upper bound is
  $ frac(2 \| d \|, x^3) + 1 / x^5 #scale(x: 240%, y: 240%)[\(] & 4 \| e \| + 6.62 \| e \| + d^2 + 1 + 8 + 2 p_epsilon K\
 & + frac(\( 1 + 2 dot.op .82 \) K, x^2) + K^2 / x^8 #scale(x: 240%, y: 240%)[\)] . $
  To justify the constant $.82$ in this expression, observe that $d$ and $e$ have opposite signs and $\| e \| \/ \( \| d \| x^2 \) = \| 2 c - 3 \| \/ \( 2 p_epsilon x^2 \) < 1$ when $d eq.not 0$. Thus $x T$ has the sign of $c$ and magnitude at most $\| c \| < .81$; the case $d = 0$ is immediate. The displayed bound, using (12.7), is less than $.00514$. Here one must retain the identity $p_epsilon K = 10 \| e \| + 3 d^2 + 30$; replacing the two factors by separate worst-case bounds would lose the required estimate.
  Finally, integrating $S = c \/ x + O \( x^(- 3) \)$ gives $P \( epsilon x \) = C x^c \( 1 + O \( x^(- 2) \) \)$ with $C > 0$. After the conjugation $P = e^(integral B) psi$, this is the square-integrable branch of the Schrödinger equation. Reduction of order gives a second independent solution growing by the reciprocal Gaussian factor; hence no other square-integrable branch is available at this endpoint. ◻
]

=== 12.3 Inward shooting and eigenvalue certification <cert:shooting>

The shooting routine begins at $x = 20$. The value #raw("tailinit") is an integer multiple of $D^(- 1)$ within $D^(- 1)$ of the exact rational number $T \( 20 \)$. The routine #raw("revpoly") expresses the stationary polynomial in the reversed cell coordinate. In #raw("qcoefs"), the resulting coefficients represent $2 tilde(beta)$ with denominator $upright("AD") D$, and $tilde(k)$ with denominator $D$. The inward cell step is $- 1 \/ 100$; this explains the sign in #raw("qint")’s recurrence.

For the completed degree-$18$ Riccati trial $tilde(S)$, the integer residual test is again a sum of absolute coefficients on $0 lt.eq s lt.eq 1$. It proves a residual smaller than $10^(- 20)$ in the spatial Riccati equation with the approximate $tilde(beta) \, tilde(k)$. The trial is exactly continuous between cells. No numerical differentiation is used.

Let $E_S = S - tilde(S)$. With $lambda$ equal to the trial value,

#[#set math.equation(numbering: n => "(12.9)")
 $ E'_S = \( 2 beta - 2 tilde(S) - E_S \) E_S + f_S \, #h(2em) \| f_S \| < 3 dot.op 10^(- 19) \, $ <cert:S-difference>]

where the source bound includes the residual and both stationary-profile errors from Lemma 69. When $lambda$ differs from the middle trial value by at most $10^(- 9)$, add $2 dot.op 10^(- 9)$ to this source bound.

Under the provisional condition $\| E_S \| lt.eq .001$, each integer #raw("gs") is a lower bound for the drift in (12.9), with denominator $upright("AD") D$. The subtraction $.002$ in its definition covers $\| E_S \|$ and the much smaller profile error. The tests on #raw("gs") imply:

+ every inward integrating factor, including factors with endpoints inside cells, is at most $e^2$;
+ the integrating factor from $20$ to $0$ is smaller than $e^(- 20)$;
+ the factor from $20$ to any $x < 12.02$ is smaller than $e^(- 6)$.

For the last assertion, the cells indexed from $1203$ upward have total integral greater than $8$, while the sum of all negative cell contributions is greater than $- 2$. This also covers the possible partial cell.

The initial error at $20$, including variation of $T \( 20 \)$ over the eigenvalue window, is less than $2.41 dot.op 10^(- 6)$. Variation of constants gives the following deliberately loose enclosures:

#[#set math.equation(numbering: n => "(12.10)")
 $ \| E_S \| < 2.9 dot.op 10^(- 5) quad \( 0 lt.eq x lt.eq 20 \) \, #h(2em) \| E_S \| < 4.5 dot.op 10^(- 7) quad \( 0 lt.eq x < 12.02 \) . $ <cert:S-errors>]

For example, the global estimate is bounded by $e^2 \[ 2.41 dot.op 10^(- 6) + 20 \( 2 dot.op 10^(- 9) + 3 dot.op 10^(- 19) \) \]$; the central estimate replaces the first factor $e^2$ on the initial error by $e^(- 6)$. Both are strictly below the provisional $.001$, which closes the bootstrap and proves that the positive branch extends to the center. For an endpoint trial compared at its own eigenvalue, the error at zero is bounded instead by

$ \( 2.41 dot.op 10^(- 6) \) e^(- 20) + 20 e^2 \( 3 dot.op 10^(- 19) \) < 10^(- 10) . $

The matching condition is $S_(-) \( 0 \) + S_(+) \( 0 \) = 0$, because derivatives in $z$ acquire opposite signs on the two half-lines. At the lower and upper shooting values the integer tests give, respectively, a trial sum smaller than $- 10^(- 9)$ and greater than $10^(- 9)$. The total error of the two halves is less than $2 dot.op 10^(- 10)$, so these signs also hold for the true shoots. Continuity therefore supplies a match. It produces a positive square-integrable eigenfunction after conjugation, and consequently the lowest eigenvalue. We have proved

#[#set math.equation(numbering: n => "(12.11)")
 $ frac(mono("lam") - 10, 10^10) < lambda \( A \/ upright("AD") \) < frac(mono("lam") + 10, 10^10) $ <cert:lambda-window>]

for every call to #raw("certified"). This also justifies the log-slope errors assigned to the middle shoot in subsequent tables.

=== 12.4 Floating-point enclosures <cert:arithmetic>

The interval stage uses IEEE binary64 round-to-nearest arithmetic, including square root. Integer polynomial residual tests precede every tabulation. Let $u = 2^(- 53)$ be unit roundoff. Away from underflow each elementary operation has relative error at most $u$; at underflow an absolute error of one subnormal unit suffices. The functions #raw("down") and #raw("up") subtract or add

$ \( \| x \| + 10^(- 280) \) 2^(- 43) $

to a rounded endpoint. This is more than one thousand unit roundoffs in relative scale, and its absolute component is much larger than a subnormal unit. Rounding in forming and applying the padding consumes less than this allowance. Therefore the operations of class #raw("I"), including the four-product rule for multiplication, reciprocal on intervals of fixed sign, squaring, and square root, enclose the exact operations. Assertions exclude division by a zero-containing interval, invalid square roots, overflow, and invalid floating-point operations.

The class constructor itself does not enlarge a literal. Integer and dyadic inputs are exact. A terminating decimal that defines a mathematical barrier or functional is consequently entered by #raw("rat(n,d)"), rather than by an unpadded decimal literal. The other non-dyadic literals in the code are allowances or coarse caps with strict slack; they may be interpreted as their binary64 values. In particular the caps $.1431$ and $.1301$ in #raw("adjusted") are strictly weaker than the analytic bounds they represent. Integer-coefficient conversion and node evaluation require the separate allowance below.

No library exponential or logarithm is used for interval evaluation. For $\| x \| lt.eq 100$, #raw("iexp") evaluates a degree-$20$ Taylor polynomial at $x \/ 256$, adds the interval remainder $\[ - 2^(- 80) \, 2^(- 80) \]$, and squares eight times. The remainder bound follows from $e^.4 .4^21 \/ 21 ! < 2^(- 80)$. For $1 \/ 8 lt.eq x lt.eq 8$, #raw("ilog") takes three interval square roots and uses

$ log x = 16 (t + t^3 / 3 + dots.h.c + t^21 / 21) + upright("remainder") \, #h(2em) t = frac(x^(1 \/ 8) - 1, x^(1 \/ 8) + 1) . $

Here $\| t \| < .14$ and $16 \| t \|^23 \/ \[ 23 \( 1 - t^2 \) \] < 2^(- 60)$, the remainder interval used by the code. All polynomial operations in these two routines are interval operations.

For summation of at most $n$ real terms, the usual induction on rounded addition gives

$ lr(|"fl" #scale(x: 180%, y: 180%)[\(] sum_(j = 1)^n y_j #scale(x: 180%, y: 180%)[\)] - sum_(j = 1)^n y_j|) lt.eq frac(n u, 1 - n u) sum_(j = 1)^n \| y_j \| $

up to the negligible absolute underflow contribution. The quadrature arrays have $n < 2 dot.op 10^5$, so the coefficient is less than $3 dot.op 10^(- 11)$. The routine #raw("sums") uses the much larger allowance $10^(- 9)$ times the accumulated absolute sum, plus #raw("tiny"). This also covers rounding in that accumulated sum and in the final correction. The shorter summation in #raw("checkA") has at most $4096$ terms of absolute value below $9$; its error after division by $4096$ is less than $gamma_4096 thin 9 < 4.1 dot.op 10^(- 12)$. Its remaining scalar arithmetic costs less than $10^(- 13)$, since all terms have magnitude less than $10$. The subtraction of $2 dot.op 10^(- 9)$ therefore covers both, including the unpadded bound arithmetic after the summation.

The last scalar addition or division in the nonlinear and local tests is also unpadded. The analytic allowances retain sufficient slack to cover it. In the recorded run all nonlinear returned values have magnitude below $.00204$, so the final addition of the signed $10^(- 6)$ changes its exact value by less than $10^(- 18)$; the two substantive errors total less than $6 dot.op 10^(- 7)$, leaving nearly $4 dot.op 10^(- 7)$ unused. For the local test, an additional diagnostic evaluation of the unchanged function gave

$ O = mono("out.hi") = .7290900413708653 \, #h(2em) D_0 = mono("den.lo") = .7928198472818054 . $

With $O < 1$ and $.7 < D_0 < 1$, rounding the final expression $\( O + 2 dot.op 10^(- 6) \) \/ D_0$ costs less than $6 dot.op 10^(- 16)$. The exterior and primitive-tail estimates cost less than $1.3 dot.op 10^(- 6)$ in the numerator, leaving $.7 dot.op 10^(- 6)$ unused there. Small rounding in the positive scalar calculation of #raw("terror") is absorbed in the same slack. Thus the returned local number is an upper bound for the exact contraction coefficient, and the returned signed nonlinear numbers retain the required mathematical signs.

=== 12.5 From polynomial tables to spatial and inverse boxes <cert:boxes>

Each step of length $.01$ is sampled at the $50$ fractions $0 \, 1 \/ 50 \, dots.h \, 49 \/ 50$. The resulting spacing is $1 \/ 5000$. The coefficients for $X$, $k$, and $l$ are formed by exact integer operations from those of $M$; they are evaluated independently. Here is a quantitative bound for the conversion and evaluation. CPython’s integer true division computes the correctly rounded ratio $c_n \/ D$: it forms an integer quotient with guard bits, records the discarded remainder, rounds ties to even, and then converts the rounded integer and rescales exactly.#footnote[The implementation and its rounding argument are in CPython 3.12.13, #link("https://github.com/python/cpython/blob/v3.12.13/Objects/longobject.c")[#raw("long_true_divide"), #raw("Objects/longobject.c")].] Every nonzero ratio here is at least $10^(- 36)$ in magnitude, so it is normal and has relative conversion error at most $u$. Both an ordinary sample $j \/ 50$ and a reversed sample $1 - j \/ 50$ have absolute node error at most $2 u$, and the exact and rounded nodes lie in $\[ 0 \, 1 \]$. Writing $C = sum \| c_n \| \/ D$, the node perturbation therefore costs at most $36 u C$. The $36$ rounded operations in degree-$18$ Horner evaluation cost at most $gamma_36 \( 1 + u \) C$, where $gamma_n = n u \/ \( 1 - n u \)$; coefficient conversion costs at most $u C$. The total is less than $74 u C < 8.22 dot.op 10^(- 15) C$, and in particular smaller than $2 dot.op 10^(- 14) C$. The node allowance used for each of $M \, X \, k \, l$ is

#[#set math.equation(numbering: n => "(12.12)")
 $ 3 dot.op 10^(- 14) sum_n \| c_n \| \/ D + 3 dot.op 10^(- 18) . $ <cert:node-error>]

It covers this evaluation error, Lemma 69, and the additions and subtractions that form node bounds. The code checks that the coefficient sum is less than $30 D$. The separate $Q$ allowances contain the evaluation error and (12.10); the global node radius is $2.95 dot.op 10^(- 5)$ and the central refinement uses $5 dot.op 10^(- 7)$.

Between nodes, monotonicity gives boxes for $M \, X \, k \, l$. For $Q = \( log P \)'$, #raw("zcells") first bootstraps $\| Q \| lt.eq 1$: the trial nodes have magnitude below $.951$, and the Riccati equation bounds $\| Q' \| < 30$ on a fine cell under this provisional bound. Its length is $1 \/ 5000$, so enlargement by $.006$ is sufficient and is strictly inside the provisional bound. Twice applying the derivative equation then sharpens the cell box. The cap $Q lt.eq 0$ uses the analytic maximum-principle argument for the exact eigenprofile; the cap is not an additional numerical assumption.

Inverse lookup must also include uncertainty in node values. Since $k$ is decreasing, suffix maxima of its node lower bounds remain valid lower bounds, and prefix minima of its upper bounds remain valid upper bounds. The analogous operations for increasing $l$ give its monotone guaranteed bounds. A binary search through these outward-monotonized arrays supplies outer nodes for the inverse position. The code uses $k$ or $l$ according to which is better separated from $1$; the two schemes are mathematically equivalent. The inverse curvature is then evaluated through the exact identity

$ W = 2 p M l + X k \, $

rather than by differentiating an inverse interpolant.

The routines #raw("Rmq.query") and #raw("kquery") return minima and maxima over all cells between two indices. For a range of length $n$, take the two blocks of length $2^(floor.l log_2 n floor.r)$ abutting its endpoints. Their union covers the range, and their individual extrema have been computed by successive doubling. Thus the returned box is valid even when these blocks overlap. Spatial coordinate bounds and index calculations are enlarged by $10^(- 12)$ or $10^(- 10)$ before multiplication and flooring; these allowances are larger than the binary64 errors on the bounded coordinate range. This padding also validates the scalar negative-edge test $2 p x_c > 2$, even though its code uses the rounded parameter #raw("af"). If $x_f$ is the negation of the padded upper position bound used in that test, then $x_f < x_c - 0.99 dot.op 10^(- 12)$. Since $p gt.eq 0.09$ and $x_c < 20$, replacing the rounded parameter and product by their exact values costs less than $3 dot.op 10^(- 14)$, whereas the position padding leaves more than $1.7 dot.op 10^(- 13)$ in $2 p x_c$. Thus a successful scalar comparison implies the exact tail-rate inequality.

The inversion of the envelope $z_i \( k \)$ in #raw("possiblek") and #raw("localcheck") uses the same outward monotonicity principle. At a clipped edge it explicitly restores the missing $k$-tail; a point outside the central range is never silently treated as an interior grid point.

More explicitly, let $L_j \, U_j$ be the outward-monotonized bounds in inverse cell $j$. If an admissible inverse value belongs to the queried spatial interval $\[ z_(-) \, z_(+) \]$, necessarily $L_j lt.eq z_(+)$ and $U_j gt.eq z_(-)$. The binary searches give the first and last cells satisfying these necessary inequalities. Clipping either index to the available grid and restoring $k = 0$ or $k = 1$ therefore retains all admissible slopes, including those in the omitted tails. For the local curvature query the retained cells obey $V_i \( k \) lt.eq 1.03 W \( k \)$ by (10.17). If an admissible $k$ is in an omitted tail, $k \( 1 - k \) lt.eq kappa$ and (9.21) gives instead

$ V_i \( k \) lt.eq 1.2 kappa^(3 \/ 4) = 1.2 thin 2^(- 28.5) < 3.2 dot.op 10^(- 9) . $

Consequently the code’s bound $1.031 thin mono("wi.hi") + .0001$ contains the curvature in both cases; the clipped query cannot discard a larger tail curvature.

=== 12.6 Integral enclosures and their logical use <cert:integrals>

The integration grid covers $\[ kappa \, 1 - kappa \]$ with $kappa = 2^(- 38)$, and has $2048$ subdivisions per dyadic scale. It splits at $1 \/ 2$ and all edges and widths are exactly representable binary numbers: the finest required denominator is $2^49$. A box on a closed cell, multiplied by its width, encloses its integral. The routine #raw("partialsum") removes an arbitrary fraction of the endpoint cell by subtracting its box multiplied by $\[ 0 \, upright("width") \]$. This is valid for either sign of the integrand. The routine #raw("anchored") integrates separately to the left and right of $1 \/ 2$, avoiding unnecessary cancellation.

The opening table records the analytic uses of these enclosures.

Several implementation details are important for this correspondence. The ratio caps in #raw("Env") apply to the exact profiles by the analytic barriers; primitive corrections use (10.14), including the omitted primitive tail. In #raw("nonlineartest"), the intermediate pairs are defined by geometric interpolation solely inside the functional. No assertion that they solve a parabolic equation is made or needed. Their log slopes lie in the same envelope because these slopes interpolate affinely. The two forms of the density variation—direct integration against $pi$, and integration by parts against its anchored derivative—each enclose the same quantity; taking their interval intersection is therefore justified. The quantity #raw("terror") bounds the missing primitive terms in that integration by parts, rather than the full exterior integral. These are distinct errors: #raw("nonlineartest")’s $10^(- 6)$ contains both, and #raw("localcheck")’s $2 dot.op 10^(- 6)$ contains their local analogues after division by $d$.

These primitive-tail allowances require derivative bounds, which can be checked directly. Put $r = V_i \/ W$ and $v_sigma = W r^sigma$. Then

$ partial_sigma \( v_sigma^(- 1) \) = - \( log r \) v_sigma^(- 1) . $

In the local regime, $\| log r \| \/ d lt.eq L \/ \( 1 - .01 L \) < 3.1$, so differentiating the positive integrals in (10.14) gives $\| partial_sigma M_sigma \| lt.eq 3.1 d M_sigma$ and the identical estimate for $X_sigma$. Relative to the reference integrands, $\| log r \| r^(- sigma) \/ d lt.eq 3.1 \/ .97 < 4$, proving the primitive-tail coefficient $4$ after division by $d$. For the nonlinear refinement, $1 \/ 3.8 < r < 3.8$ gives instead $\| log r \| r^(- sigma) lt.eq 3.8 log 3.8 < 6$. This proves its coefficient $6$. The distinct finite-difference bound $\| r^(- sigma) - 1 \| < 2.8 < 3.01$ justifies its primitive correction. These arguments use dominated differentiation with the reference primitive as an integrable majorant; no derivative estimate is inferred merely from a finite-difference estimate.

The omitted endpoint cells of #raw("checkA") admit particularly crude bounds. In the notation of (10.5), $\| b \| lt.eq 1.2$, $b gt.eq - .8$, $E = - .4 t_k$, $t_k lt.eq 1 \/ 4$, and $K gt.eq - 8.24$. Since $V < .5$ and $6 A^2 - .16 > 0$ for $.41 lt.eq A lt.eq 1$, its integral density satisfies

$ 2 V^2 + K V - 2 b E + \( 6 A^2 - .16 \) t_k^2 \/ V gt.eq - 8.24 dot.op .5 - .16 = - 4.28 > - 9 . $

This holds throughout the interval, hence on both omitted cells. At $0 lt.eq k_0 lt.eq 1 \/ 4096$, the endpoint expression obeys

$ b V^2 + 2 E V lt.eq 1.2 V^2 lt.eq 1.728 t_k^(3 \/ 2) lt.eq 1.728 \/ 262144 < 6.6 dot.op 10^(- 6) < .001 . $

Thus its endpoint allowances also have analytic coverage.

The driver follows the successive output intervals listed with the signed tests in Section 10: eleven coarse updates from $\[ 0 \, 0.410 \]$, then thirteen nonlinear updates, give $\[ 0.285 \, 0.303 \]$. Each printed checkpoint is the #emph[input] interval for the checks about to run. In particular, the last printed interval is $\[ 0.283 \, 0.304 \]$; successful completion of its two sign tests proves the final interval $\[ 0.285 \, 0.303 \]$. The slight enlargement from $0.369$ to $0.370$ in the coarse sequence keeps a valid coefficient enclosure. All sign tests include the error allowances described above. Their analytic consequence is the input enclosure required by the local contraction, which then forces $A equiv a_(*)$.

=== 12.7 Reproduction and numerical output <cert:execution>

The accompanying file #raw("certificate/original_certificate.py") is the unaltered code printed in the appendix. From the manuscript directory, run

#quote(block: true)[
  python3 certificate/original\_certificate.py
]

with NumPy installed and assertions enabled; do not use #raw("-O"). The certificate requires IEEE binary64 arithmetic with round-to-nearest operations as described above. Its interval checkpoints are printed to standard output. The accompanying reproducibility record identifies the software versions, source hashes, and saved output of a complete run.

The complete unchanged driver passed on October 4, 2026, under Python 3.12.13 and NumPy 2.3.5, with assertions enabled, in $338.52$ seconds. It printed all $24$ checkpoints and had empty standard error; the actual output is retained with the certificate. The separate return-observer record from September 24, which leaves the source, function arguments and results unchanged, gives

$ mono("checkA()") = 0.002977541856187091 > 0 \, #h(2em) mono("localcheck()") = 0.9196188060510444 < .95 . $

The displayed decimals are a returned lower bound and upper bound, respectively. A fresh targeted evaluation of the unchanged local routine reproduces the second value and the numerator and denominator reported in Subsection 12.4. The complete unchanged execution and this diagnostic evaluation are recorded separately. Their interpretation as rigorous bounds is supplied by the error analysis and comparison arguments above. The exact source hash is

#quote(block: true)[
  7bd5dbd918d9a48fe4da62044e295239b 74f7a1607e2643337ad4d073a85dc7f.
]

The integer seeds for the final two spectral tests are $2936535033$ and $2936533047$, with denominator $10^10$. Formula (12.11) therefore yields

$ .2936535023 & < lambda \( .2936533 \) < .2936535043 \,\
.2936533037 & < lambda \( .2936535 \) < .2936533057 . $

In particular the first eigenvalue is strictly larger than its parameter and the second strictly smaller. Continuity supplies

$ .2936533 < a_(*) < .2936535 . $

The contraction argument applies to every root in this interval and proves its uniqueness there. Combined with the analytic identification of the critical exponents, these rational inequalities give the exponent bounds stated in the conclusion.

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman, R.~Sims and S.~L.~Starr, #emph[Extended variational principle for the Sherrington--Kirkpatrick spin-glass model], Physical Review B #strong[68] (2003), 214403. #link("https://doi.org/10.1103/PhysRevB.68.214403")[doi:10.1103/PhysRevB.68.214403].]
#bibitem([2])[A.~Auffinger and W.-K.~Chen, #emph[The Parisi formula has a unique minimizer], Communications in Mathematical Physics #strong[335] (2015), 1429--1444. #link("https://doi.org/10.1007/s00220-014-2254-z")[doi:10.1007/s00220-014-2254-z].]
#bibitem([3])[E.~Bolthausen and A.-S.~Sznitman, #emph[On Ruelle's probability cascades and an abstract cavity method], Communications in Mathematical Physics #strong[197] (1998), 247--276. #link("https://doi.org/10.1007/s002200050450")[doi:10.1007/s002200050450].]
#bibitem([4])[M.~Boué and P.~Dupuis, #emph[A variational representation for certain functionals of Brownian motion], The Annals of Probability #strong[26] (1998), 1641--1659. #link("https://doi.org/10.1214/aop/1022855876")[doi:10.1214/aop/1022855876].]
#bibitem([5])[P.~Charbonneau, J.~Kurchan, G.~Parisi, P.~Urbani and F.~Zamponi, #emph[Exact theory of dense amorphous hard spheres in high dimension. III. The full replica symmetry breaking solution], Journal of Statistical Mechanics: Theory and Experiment (2014), P10009. #link("https://doi.org/10.1088/1742-5468/2014/10/P10009")[doi:10.1088/1742-5468/2014/10/P10009]. Preprint version: #link("https://arxiv.org/abs/1310.2549v5")[arXiv:1310.2549v5].]
#bibitem([6])[S.~Chatterjee, #emph[A generalization of the Lindeberg principle], The Annals of Probability #strong[34] (2006), no.~6, 2061--2076. #link("https://doi.org/10.1214/009117906000000575")[doi:10.1214/009117906000000575].]
#bibitem([7])[H.-B.~Chen, V.~Issa and J.-C.~Mourrat, #emph[The convex structure of the Parisi formula for multi-species spin glasses], preprint (2025). #link("https://arxiv.org/abs/2508.06397")[arXiv:2508.06397].]
#bibitem([8])[W.-K.~Chen, #emph[The Aizenman--Sims--Starr scheme and Parisi formula for mixed $p$-spin spherical models], Electronic Journal of Probability #strong[18] (2013), no.~94, 1--14. #link("https://doi.org/10.1214/EJP.v18-2580")[doi:10.1214/EJP.v18-2580].]
#bibitem([9])[S.~Franz and G.~Parisi, #emph[The simplest model of jamming], Journal of Physics A: Mathematical and Theoretical #strong[49] (2016), 145001. #link("https://doi.org/10.1088/1751-8113/49/14/145001")[doi:10.1088/1751-8113/49/14/145001]. #link("https://arxiv.org/abs/1501.03397")[arXiv:1501.03397].]
#bibitem([10])[S.~Franz, G.~Parisi, M.~Sevelev, P.~Urbani and F.~Zamponi, #emph[Universality of the SAT-UNSAT (jamming) threshold in non-convex continuous constraint satisfaction problems], SciPost Physics #strong[2] (2017), 019. #link("https://doi.org/10.21468/SciPostPhys.2.3.019")[doi:10.21468/SciPostPhys.2.3.019].]
#bibitem([11])[E.~Gardner, #emph[The space of interactions in neural network models], Journal of Physics A: Mathematical and General #strong[21] (1988), 257--270. #link("https://doi.org/10.1088/0305-4470/21/1/030")[doi:10.1088/0305-4470/21/1/030].]
#bibitem([12])[E.~Gardner and B.~Derrida, #emph[Optimal storage properties of neural network models], Journal of Physics A: Mathematical and General #strong[21] (1988), 271--284. #link("https://doi.org/10.1088/0305-4470/21/1/031")[doi:10.1088/0305-4470/21/1/031].]
#bibitem([13])[F.~Guerra, #emph[Broken replica symmetry bounds in the mean field spin glass model], Communications in Mathematical Physics #strong[233] (2003), 1--12. #link("https://doi.org/10.1007/s00220-002-0773-5")[doi:10.1007/s00220-002-0773-5].]
#bibitem([14])[E.~Lerner, G.~Düring and M.~Wyart, #emph[Low-energy non-linear excitations in sphere packings], Soft Matter #strong[9] (2013), 8252--8263. #link("https://doi.org/10.1039/C3SM50515D")[doi:10.1039/C3SM50515D].]
#bibitem([15])[V.~A.~Marchenko and L.~A.~Pastur, #emph[Distribution of eigenvalues for some sets of random matrices], Mathematics of the USSR--Sbornik #strong[1] (1967), 457--483. #link("https://doi.org/10.1070/SM1967v001n04ABEH001994")[doi:10.1070/SM1967v001n04ABEH001994].]
#bibitem([16])[A.~Montanari, Y.~Zhong and K.~Zhou, #emph[Tractability from overparametrization: The example of the negative perceptron], Probability Theory and Related Fields #strong[188] (2024), 805--910. #link("https://doi.org/10.1007/s00440-023-01248-y")[doi:10.1007/s00440-023-01248-y]. #link("https://arxiv.org/abs/2110.15824")[arXiv:2110.15824].]
#bibitem([17])[J.-C.~Mourrat, #emph[Un-inverting the Parisi formula], Annales de l'Institut Henri Poincaré, Probabilités et Statistiques #strong[61] (2025), no.~4, 2709--2720. #link("https://doi.org/10.1214/24-AIHP1487")[doi:10.1214/24-AIHP1487]. Preprint (2023), #link("https://arxiv.org/abs/2308.10715v2")[arXiv:2308.10715v2].]
#bibitem([18])[D.~Panchenko, #emph[A connection between the Ghirlanda--Guerra identities and ultrametricity], The Annals of Probability #strong[38] (2010), 327--347, Theorem~2(a). #link("https://doi.org/10.1214/09-AOP484")[doi:10.1214/09-AOP484].]
#bibitem([19])[D.~Panchenko, #emph[On the Dovbysh--Sudakov representation result], Electronic Communications in Probability #strong[15] (2010), 330--338. #link("https://doi.org/10.1214/ECP.v15-1562")[doi:10.1214/ECP.v15-1562].]
#bibitem([20])[D.~Panchenko, #emph[The Parisi ultrametricity conjecture], Annals of Mathematics #strong[177] (2013), 383--393. #link("https://doi.org/10.4007/annals.2013.177.1.8")[doi:10.4007/annals.2013.177.1.8].]
#bibitem([21])[G.~Parisi and F.~Zamponi, #emph[A proof of an identity for the critical exponents of jamming], Journal of Statistical Mechanics: Theory and Experiment (2026), 073301. #link("https://doi.org/10.1088/1742-5468/ae7bd7")[doi:10.1088/1742-5468/ae7bd7]. #link("https://arxiv.org/abs/2606.03300")[arXiv:2606.03300].]
#bibitem([22])[M.~Stojnic, #emph[Another look at the Gardner problem], preprint (2013). #link("https://arxiv.org/abs/1306.3979")[arXiv:1306.3979].]
#bibitem([23])[M.~Wyart, #emph[Marginal stability constrains force and pair distributions at random close packing], Physical Review Letters #strong[109] (2012), 125502. #link("https://doi.org/10.1103/PhysRevLett.109.125502")[doi:10.1103/PhysRevLett.109.125502].]


== 13 Executable certificate <app:code>

The following listing is the complete certificate distributed with the manuscript. Run it with Python 3 and NumPy, with assertions enabled; see Section 12 for the relation between the finite checks and the analytic estimates. An arrow at the start of a displayed line marks a continuation of the same source line.

#raw(block: true, lang: "", "import math, numpy as np\nD=10**36\nHN=100 # step reciprocal\nL=24\nN=L*HN\nDEG=18\nAD=10**6 # a denominator\nLD=10**10\n# all stored coefficients are integers /D\ndef mstep(A, side, j, c0,c1, check=False):\n # z0=side*j/HN, h=side/HN, q=.5, a=A/AD\n c=[c0,c1]\n # recurrence common h² terms: 2(q-a-q*n)c_n -2q*(z0/h)*(n+1)c_{n+1}; nonlinear -2*a/h ...\n # denominator HN² AD D\n def rhs(n):\n  val=0\n  if n<len(c): val+=(AD*(1-n)-2*A)*D*c[n]\n  if n+1<len(c): val-=j*(n+1)*AD*D*c[n+1]\n  conv=sum(c[i]*(n-i+1)*c[n-i+1] for i in range(max(0,n+2-len(c)),min(n+1,len(c))) )\n  val-=2*A*side*HN*conv\n  return val\n den=HN**2*AD*D\n for n in range(DEG-1):\n  c.append(rhs(n)//(den*(n+2)*(n+1)))\n if check:\n  # equation residual in M_zz - rhs/h²; scale D² AD\n  err=sum(abs(((c[n+2]*(n+2)*(n+1)*den) if n+2<len(c) else 0)-rhs(n)) for n in range(2*DEG+1))\n  assert err*10**23 < AD*D**2, (side,j,err/(AD*D**2))\n return c\ndef mint(A,m0,k0,save=False):\n data=[]; ends=[]\n for side in [-1,1]:\n  arr=[]\n  c0=m0\n  # to ensure initial derivative exactly same with sides define k0 here as k0/HN scaled!\n  c1=-side*k0\n  for j in range(N):\n   c=mstep(A,side,j,c0,c1,save)\n   c0=sum(c);c1=sum(n*x for n,x in enumerate(c))\n   if save: arr.append(c)\n  ends.append(c0-(L*D if side<0 else 0));data.append(arr)\n if save:\n  assert max(abs(x) for x in ends)*10**23 < D\n  return data\n return np.array([x/D for x in ends])\nLQ=20\ndef revpoly(c):\n return [(-1)**j*sum(c[i]*math.comb(i,j) for i in range(j,len(c))) for j in range(len(c))]\ndef qcoefs(A,data):\n out=[]\n for side,arr in zip([-1,1],data):\n  barr=[];karr=[]\n  for j,m in enumerate(arr[:LQ*HN]):\n   mr=revpoly(m)\n   # beta stored scaled AD D\n   beta=[2*A*side*x for x in mr]\n   beta[0]+=AD*D*(j+1)//HN;beta[1]-=AD*D//HN\n   # physical derivative z: dx reversed -1/HN\n   k=[side*HN*n*mr[n] for n in range(1,len(mr))]\n   barr.append(beta);karr.append(k)\n  out.append((barr,karr))\n return out\nfrom fractions import Fraction as Fr\ndef tailinit(A,Lam,side):\n p=Fr(1,2)-(Fr(A,AD) if side<0 else 0)\n c=Fr(Lam,LD)/p-1\n assert Fr(-71,100)<c<Fr(81,100) and (side>0 or c>Fr(-1,100))\n d=c*(c-1)/(2*p);e=(2*c-3)*d/(2*p)\n val=c/LQ+d/LQ**3+e/LQ**5\n return val.numerator*D//val.denominator\ndef qint(A,Lam,coefs,save=False):\n ends=[];out=[]\n for side,(barr,karr) in zip([-1,1],coefs):\n  s0=tailinit(A,Lam,side); arr=[]\n  # h negative; residual scaled LD AD D²\n  for beta,k in zip(barr[::-1],karr[::-1]):\n   c=[s0]\n   def rhs(n):\n    convb=sum(c[i]*beta[n-i] for i in range(max(0,n+1-len(beta)),min(n+1,len(c))))\n    convs=sum(c[i]*c[n-i] for i in range(max(0,n+1-len(c)),min(n+1,len(c))))\n    val=LD*(convb-AD*convs)\n    if n<len(k): val-=2*LD*D*A*k[n]\n    if n==0: val+=(LD-2*Lam)*AD*D**2\n    return -val # sign h\n   den=HN*LD*AD*D\n   for n in range(DEG):\n    c.append(rhs(n)//(den*(n+1)))\n   s0=sum(c)\n   if save:\n    err=sum(abs(((c[n+1]*(n+1)*den) if n+1<len(c) else 0)-rhs(n)) for n in range(2*DEG+1))\n    assert err*10**20 < LD*AD*D**2\n    arr.append(c)\n  ends.append(s0);out.append(arr[::-1])\n if save:return ends,out\n return sum(ends)/D\ndb={\n0: [398942280401432677939946059934936368, 5000000000000000000000000000000001, 5000000000],\n167000: [436448204647172275671154571065521908, 5111026674046595034939603490045098, 4002528709],\n183000: [440536919244443400292190017104934260, 5123874426378891221881448106403949, 3886015237],\n185000: [441054831040266796082023272478293862, 5125511916180277425031674550494055, 3871133409],\n193000: [443141880868177733854084218630813528, 5132133382720642510533594754892904, 3810876605],\n197000: [444194725820485682959362490472149280, 5135487495896646327064404732292470, 3780302564],\n203000: [445785769731214940781912304479234981, 5140573657830417507240017132653823, 3733871338],\n207000: [446854382388375608957334107223406674, 5144001493265635761300449570536001, 3702530072],\n211000: [447929381090052885385364640445907237, 5147459297648980728746473644952589, 3670873366],\n215000: [449010811041136767599350272927726311, 5150947346067397468701694365523148, 3638896171],\n218000: [449826131225767018035053374695566673, 5153583395711869859552546091908423, 3614699851],\n220000: [450371711347115414702287234485694676, 5155350356897422981117371212249798, 3598466110],\n228000: [452570421073155581002349457455156882, 5162495706450928292015335430770643, 3532693692],\n231000: [453401748336946844064210643083735018, 5165207491261130326087668688414708, 3507677435],\n234000: [454236820433129662972716954382051104, 5167937063446988969961240183678679, 3482465702],\n239000: [455636980863394482376305475385213303, 5172526193122040947960671147502318, 3440005122],\n244000: [457047684631426696806497007443129457, 5177165590864996728236809104282291, 3396983232],\n251000: [459040549972883437425970210163056860, 5183746215430131520421292962258781, 3335786897],\n258000: [461054492582858640009939593690213328, 5190427871537775227086712728654635, 3273433269],\n266000: [463382256258761310925112548110693165, 5198189616921800648472720382573621, 3200709619],\n272000: [465146562404304407912087965480558966, 5204100048614802448626400462062651, 3145111670],\n277000: [466629038869660672695849875091361589, 5209084479440533646312103130621392, 3098069677],\n281000: [467823080450381224176236382390647761, 5213111054345015033023913790482294, 3059960694],\n283000: [468422802833727954210264696892144102, 5215137440217787546712478602076254, 3040745124],\n293650: [471646903449743964326750054546019982, 5226076475530743371555160276374328, 2936567807],\n293655: [471648429278170868718179649270487911, 5226081670400701322796197274730540, 2936518150],\n304000: [474830062508701471123549605498961791, 5236950205867338402676604016732928, 2832226234],\n307000: [475762010965247164513736332348470605, 5240147358667012150252587393292838, 2801389817],\n311000: [477011157190311061741246569619152021, 5244442225649069448736879731180273, 2759849013],\n316000: [478583169388318722513619887175424457, 5249862548442940911853802351401021, 2707225932],\n324000: [481123016830877402189435259911758451, 5258655641387006960242857464890572, 2621373597],\n332000: [483693438251416145305364963041169198, 5267598590953712710367653201944070, 2533413436],\n341000: [486622067478021139143860888527609012, 5277840475816287771505304037559031, 2431833246],\n350000: [489590149217013150459035454451604544, 5288276035769017229974864077309765, 2327350370],\n358000: [492261862551830464462065996735397278, 5297716154872114923625434487895606, 2231929998],\n363000: [493947768520916359508306619953883636, 5303695170717058167276507568238026, 2171028129],\n368000: [495646114469944087456537737737225530, 5309735201830213364679958592968569, 2109122819],\n369000: [495987281117020524255538529154406594, 5310950548984813632995589189134366, 2096618989],\n370000: [496328947871629374756867582623647432, 5312168346853911202387504058544337, 2084073726],\n373000: [497356952751536597848406417862848528, 5315836459606920685663169284212728, 2046187111],\n377000: [498734651097943921003750035530256643, 5320761672756152026272462715404391, 1995077904],\n381000: [500120399939983459354541920108240900, 5325726268072088182877928567867189, 1943276576],\n386000: [501863941040929695618157081757711250, 5331987493849022591294812731983611, 1877528371],\n390000: [503267883372610202334955761574692406, 5337040922801031344612478693686727, 1824113384],\n397000: [505744327598534384034341787833659036, 5345979603431905326263929284728143, 1728838531],\n400000: [506813294676182538273397955089170882, 5349847568311569582933277586355971, 1687287204],\n410000: [510409698904365400089610218268197555, 5362901520459144207633059993983021, 1545546607],\n2936533: [471647910495218087096951828814828891, 5226079904138646272764052074508064, 2936535033],\n2936535: [471647971528437792087151567621746964, 5226080111933846901160172613080866, 2936533047],\n}\ndef certified(A):\n m,k,lam=db[A]; data=mint(A,m,k,save=True); co=qcoefs(A,data)\n for lr in [lam-10,lam,lam+10]:\n  ends,out=qint(A,lr,co,save=True)\n  for side,arr,(barr,_),sarr in zip([-1,1],data,co,out):\n   for c in arr:\n    kp=-side*HN*c[1]; rad=HN*sum(n*abs(x) for n,x in enumerate(c) if n>=2)\n    assert (kp-rad)*100>=-D and (kp+rad)*100<=101*D\n   # integer lower g scaled AD*D\n   gs=[b[0]-sum(abs(x) for x in b[1:])-2*AD*(c[0]+sum(abs(x) for x in c[1:]))-AD*D//500 for b,c in zip(barr,sarr)]\n   assert all(sum(abs(v) for v in c)*100<95*D for c in sarr)\n   assert sum(gs[1203:])>8*HN*AD*D\n   assert sum(min(g,0) for g in gs)>-2*HN*AD*D and sum(gs)>20*HN*AD*D\n  if lr<lam:assert sum(ends)*10**9 < -D\n  if lr>lam:assert sum(ends)*10**9 > D\n  if lr==lam:qdata=out\n return data,qdata,lam\n\n# float interval library; padding assumes IEEE\nnp.seterr(over='raise',invalid='raise',divide='raise')\ntiny=1e-280\ndef down(x):return x-(abs(x)+tiny)*2**-43\ndef up(x):return x+(abs(x)+tiny)*2**-43\nclass I:\n def __init__(self,lo,hi=None):\n  self.lo=lo;self.hi=lo if hi is None else hi\n def __add__(x,y):\n  y=iv(y);return I(down(x.lo+y.lo),up(x.hi+y.hi))\n __radd__=__add__\n def __neg__(x):return I(-x.hi,-x.lo)\n def __sub__(x,y):return x+-iv(y)\n def __rsub__(x,y):return iv(y)+-x\n def __mul__(x,y):\n  y=iv(y)\n  a=x.lo*y.lo;b=x.lo*y.hi;c=x.hi*y.lo;d=x.hi*y.hi\n  return I(down(np.minimum(np.minimum(a,b),np.minimum(c,d))),up(np.maximum(np.maximum(a,b),np.maximum(c,d))))\n __rmul__=__mul__\n def inv(x):\n  assert np.all(x.lo*x.hi>0)\n  return I(down(1/x.hi),up(1/x.lo))\n def __truediv__(x,y):return x*iv(y).inv()\n def __rtruediv__(x,y):return iv(y)*x.inv()\n def sq(x):\n  a=x.lo*x.lo;b=x.hi*x.hi\n  return I(np.where((x.lo<=0)&(x.hi>=0),0,down(np.minimum(a,b))),up(np.maximum(a,b)))\n def sqrt(x):\n  assert np.all(x.lo>=0)\n  return I(np.maximum(0,down(np.sqrt(x.lo))),up(np.sqrt(x.hi)))\n def cap(x,lo,hi):\n  z=I(np.maximum(x.lo,lo),np.minimum(x.hi,hi));assert np.all(z.lo<=z.hi)\n  return z\n def sel(x,s):return I(x.lo[s],x.hi[s])\n def maxabs(x):return np.maximum(abs(x.lo),abs(x.hi))\ndef iv(x):return x if isinstance(x,I) else I(x)\ndef rat(n,d):return I(n)/d\ndef choose(cond,x,y):\n x=iv(x);y=iv(y);return I(np.where(cond,x.lo,y.lo),np.where(cond,x.hi,y.hi))\n# exp interval Taylor scale /256, require |x|<=100\ndef iexp(x):\n x=iv(x);assert np.all(x.maxabs()<=100)\n def fn(y,upper):\n  # Taylor point using interval class\n  w=I(y)/256; t=I(1.)\n  for i in range(20,0,-1):t=1+w*t/i\n  t=t+I(-2**-80,2**-80) # exp(.4) *.4^21/21! < 2^-80\n  for i in range(8):t=t.sq()\n  return t.hi if upper else t.lo\n return I(fn(x.lo,False),fn(x.hi,True))\n# log for args [1/8,8] via repeated sqrt and atanh\ndef ilog(x):\n x=iv(x); assert np.all(x.lo>=.125) and np.all(x.hi<=8)\n for _ in range(3):x=x.sqrt()\n t=(x-1)/(x+1); ts=t.sq()\n p=rat(1,21)\n for i in range(19,0,-2):p=rat(1,i)+ts*p\n return 16*t*p+I(-2**-60,2**-60) # |t|<.14\n\nZF=50 # fine per HN =.0002\nZN=HN*ZF\ndef polytab(intarr,reverse=False):\n # table each cell at s=0,...,(ZF-1)/ZF; q reversed variable use 1-s\n co=np.array([[float(v/D) for v in c] for c in intarr])\n frac=np.arange(ZF)/ZF\n if reverse:frac=1-frac\n val=co[:,[-1]]\n for j in range(co.shape[1]-2,-1,-1): val=val*frac+co[:,[j]]\n # final endpoint omitted\n return val.reshape(-1)\nclass Profile:\n def __init__(self,A):\n  data,qdata,lam=certified(A)\n  self.A=A; self.a=rat(A,AD); self.af=A/AD\n  self.lam=rat(lam,LD)+I(-1.01e-9,1.01e-9) # use pads later\n  sides=[]\n  for side,arr,qs in zip([-1,1],data,qdata):\n   arr=arr[:LQ*HN]\n   mx=[];ks=[];ls=[]\n   for j,c in enumerate(arr):\n    xx=c.copy();xx[0]+=side*j*D//HN;xx[1]+=side*D//HN;mx.append(xx)\n    kk=[-side*HN*n*v for n,v in enumerate(c) if n>0];ks.append(kk)\n    ll=[-v for v in kk];ll[0]+=D;ls.append(ll)\n    # error bound for polytab rounding using sumabs\n    for coeff in [c,xx,kk,ll]:\n     # absolute eval error <=2e-14 sumabs; want 1e-14 when small; adaptive use? store separately\n     assert sum(abs(x) for x in coeff)<30*D\n   sides.append([polytab(arr),polytab(mx),polytab(ks),polytab(ls),side*polytab(qs,True)])\n  # join z indices -(20-1/ZN)..(20-1/ZN)\n  self.offset=LQ*ZN-1\n  self.M,self.X,self.k,self.l,self.Q=[np.concatenate([x[:0:-1],y]) for x,y in zip(*sides)]\n  # adaptive rounding error: for M,X,k,l near small sumabs maybe bound globally tighter by cell checking\n  # compute arrays of err coefficients for each\n  errsides=[]\n  for side,arr in zip([-1,1],data):\n   lists=[[] for _ in range(4)]\n   for j,c in enumerate(arr[:LQ*HN]):\n    xx=c.copy();xx[0]+=side*j*D//HN;xx[1]+=side*D//HN\n    kk=[-side*HN*n*v for n,v in enumerate(c) if n>0]\n    ll=[-v for v in kk];ll[0]+=D\n    for li,coef in zip(lists,[c,xx,kk,ll]):\n     li.append(sum(abs(x) for x in coef)/D*3e-14+3e-18)\n   errsides.append([np.repeat(li,ZF) for li in lists])\n  self.err=[np.concatenate([x[:0:-1],y]) for x,y in zip(*errsides)]\n  # monotone search approximate k and l enforce using certified thresholds cumulative\n  # exact k decreasing. guaranteed lower k and upper l prefix if node bound; take suffix max lower k?\n  self.klo=np.maximum.accumulate((self.k-self.err[2])[::-1])[::-1] # suffix nodes prove lower\n  self.khi=np.minimum.accumulate(self.k+self.err[2]) # prefix upper\n  self.llo=np.maximum.accumulate(self.l-self.err[3]) # prefix lower (l inc)\n  self.lhi=np.minimum.accumulate((self.l+self.err[3])[::-1])[::-1]\n def at(self,name,idx):\n  vals=getattr(self,name)[idx]\n  er=(2.95e-5 if name=='Q' else self.err[['M','X','k','l'].index(name)][idx])\n  return I(vals)-0+I(-er,er) # padded\n def inverse_indices(self,k,l): # intervals arrays, find z interval outer nodes\n  use=k.hi<=.6\n  # lower idx: want node k_lower >= khi, choose last such; equivalently search on -klo\n  l1=np.searchsorted(-self.klo,-k.hi,side='right')-1\n  u1=np.searchsorted(-self.khi,-k.lo,side='left')\n  # l increasing: lower node upper l <= llo\n  l2=np.searchsorted(self.lhi,l.lo,side='right')-1\n  u2=np.searchsorted(self.llo,l.hi,side='left')\n  low=np.where(use,l1,l2);hi=np.where(use,u1,u2)\n  assert np.all(low>=0) and np.all(hi<len(self.k))\n  return low,hi\n def inverse(self,k,l):\n  low,hi=self.inverse_indices(k,l)\n  z=I((low-self.offset)/ZN-1e-12,(hi-self.offset)/ZN+1e-12)\n  M=I(self.at('M',hi).lo,self.at('M',low).hi).cap(0,100)\n  X=I(self.at('X',low).lo,self.at('X',hi).hi).cap(0,100)\n  W=2*(.5-self.a)*M*l+X*k\n  return z,M,X,W\n\nfrom functools import lru_cache\nprofiles=lru_cache(maxsize=6)(Profile)\n\nMGRID=2048\nCUT=38\ndef grid():\n ed=np.concatenate([(1+np.arange(MGRID)/MGRID)*2.**(-i) for i in range(CUT,1,-1)]+[np.array([.5])])\n ed=np.concatenate([ed,1-ed[-2::-1]]) # exact dyadic? smallest subdivisions require CUT+11=49 <53 yes\n w=np.diff(ed); assert len(w)\n return I(ed[:-1],ed[1:]),I(1-ed[1:],1-ed[:-1]),w,len(w)//2\nkg,lg,width,mid=grid()\ndef sums(x,rev=False): # intervals of weighted cumulative over cells inclusive full endpoint\n v=x*I(width)\n def side(a,sgn):\n  if rev:a=a[::-1]\n  cs=np.cumsum(a)\n  err=np.cumsum(abs(a))*1e-9+tiny # n<1e6\n  out=cs+sgn*err\n  return out[::-1] if rev else out\n return I(side(v.lo,-1),side(v.hi,1))\ndef partialsum(x,rev=False): # integral to any point in current cell from relevant tail (within grid)\n v=x # allow either sign\n full=sums(v,rev)\n # remove optional part\n amt=x*I(0,width)\n return full-amt\ndef total(x):\n sm=sums(x);return I(sm.lo[-1],sm.hi[-1])\ndef anchored(x): # integral from .5 to any cell; avoid total cancellation\n left=choose(np.arange(mid*2)<mid,x,0)\n right=choose(np.arange(mid*2)>=mid,x,0)\n return choose(np.arange(mid*2)<mid,-partialsum(left,True),partialsum(right))\n# RMQ for cell bounds on z table adjacent nodes\nclass Rmq:\n def __init__(self,g,values):\n  self.g=g;self.los=[values.lo];self.his=[values.hi]\n  while 2**len(self.los)<=len(values.lo):\n   step=2**(len(self.los)-1)\n   self.los.append(np.minimum(self.los[-1][:-step],self.los[-1][step:]))\n   self.his.append(np.maximum(self.his[-1][:-step],self.his[-1][step:]))\n def query(self,z):\n  low=np.floor((z.lo-1e-10)*ZN).astype(int)+self.g.offset\n  high=np.floor((z.hi+1e-10)*ZN).astype(int)+self.g.offset\n  assert np.all(low>=0) and np.all(high<len(self.los[0]))\n  lens=high-low+1\n  olo=np.empty_like(z.lo);ohi=np.empty_like(z.lo)\n  for j,(los,his) in enumerate(zip(self.los,self.his)):\n   sel=(lens>=2**j)&(lens<2**(j+1)); u=low[sel];v=high[sel]-(2**j-1)\n   olo[sel]=np.minimum(los[u],los[v]);ohi[sel]=np.maximum(his[u],his[v])\n  return I(olo,ohi)\ndef zcells(g):\n idx=np.arange(len(g.M)-1)\n def monot(name,inc):\n  vals=g.at(name,np.arange(len(g.M)))\n  return I(vals.lo[:-1] if inc else vals.lo[1:],vals.hi[1:] if inc else vals.hi[:-1])\n M=monot('M',False).cap(0,30);X=monot('X',True).cap(0,30)\n k=monot('k',False).cap(0,1);l=monot('l',True).cap(0,1)\n z=I((idx-g.offset)/ZN-1e-12,(idx+1-g.offset)/ZN+1e-12)\n beta=.5*z+g.a*M\n # bootstrap derivative bound: start Q node error, assume |Q|<=1 within length => |Q'|<25, enlarge, refine\n qnodes=g.at('Q',idx)\n # refine error central (cert proof)\n qnodes=qnodes.cap(g.Q[idx]-np.where(abs(z.lo)<12.01,5e-7,3e-5),g.Q[idx]+np.where(abs(z.lo)<12.01,5e-7,3e-5))\n Q=qnodes+I(-.006,.006)\n for _ in range(2):\n  qp=2*beta*Q-Q.sq()+2*(.5-g.a*k-g.lam)\n  Q=(qnodes+I(-1,1)*I(qp.maxabs())/ZN).cap(-1,0)\n qp=2*beta*Q-Q.sq()+2*(.5-g.a*k-g.lam)\n V=2*(.5-g.a)*M*l+X*k\n return locals()\ndef eloc_z(z,cp): # .25 power\n t=2-z\n t=I(np.maximum(t.lo,0),np.maximum(t.hi,0))\n den=1+t.sq()/2\n e=cp/2/den.sqrt().sqrt()\n ep=e*t/(4*den)\n epp=e*(5*t.sq()/(16*den.sq())-1/(4*den))\n epp=I(np.where(z.hi>=2,np.minimum(0,epp.lo),epp.lo),np.where(z.hi>=2,np.maximum(0,epp.hi),epp.hi))\n return e,ep,epp\ndef checkV(g,gapA,upper,cp):\n d=zcells(g);a=g.a\n p=.5-g.af\n sel=(d['z'].lo<6)&(d['z'].hi> -math.sqrt(13/p)-.01)\n z,M,k,l,W,B=[d[x].sel(sel) for x in ['z','M','k','l','V','beta']]\n t=k*l\n T=2*(.5-a)*M*l/W-2*k+2*a*(t/W).sq()\n if g.A==0: assert np.min(T.lo)>-1.12 and np.max(T.hi)<.13\n e,ep,epp=eloc_z(z,cp)\n fac=rat(1,1) if upper else -rat(11,10)\n R=1+fac*e*gapA\n Ar=(a+I(0,1)*gapA) if upper else (a-I(0,1)*gapA)\n core=.5*epp+(-B+a*t/W)*ep\n rhs=R.sq()*core+Ar*t/W*ep+R*(-(R+1)*(.5+a*T)*e+I(np.maximum(T.lo,0),np.maximum(T.hi,0))/(fac if upper else -fac))\n core0=fac*gapA*core-(.5+a*T)*R\n return np.max(rhs.hi),np.max(core0.hi)\nCP=rat(26,100); ERR=rat(12,100)\ndef tail_mx_bounds(g): # cut primitives station first/last cell from inverse already include true cutoff\n z,m,x,v=g\n return m.hi[0],x.hi[-1]\nclass Env:\n def __init__(self,A,B,check=True):\n  self.a=profiles(A);self.b=profiles(B); gap=self.gap=self.b.a-self.a.a\n  if check:\n   for g,u in [(self.a,1),(self.b,0)]:\n    rr,co=checkV(g,gap,u,CP); assert rr<0 and co<-.02,(g.A,rr,co)\n  self.va0=self.a.inverse(kg,lg); self.vb0=self.b.inverse(kg,lg)\n  za,ma,xa,wa=self.va0; zb,mb,xb,wb=self.vb0\n  rh=1+gap*eloc_z(za,CP)[0]; rl=1-rat(11,10)*gap*eloc_z(zb,CP)[0]\n  self.vhi=rh*wa; self.vlo=rl*wb\n  # envelopes primitive correction\n  def adjusted(box,w,R,weight,rev):\n   corr=1/R-1\n   tail=I(-.16,.16)*gap*(box.sel(-1 if rev else 0))\n   out=box+tail+partialsum(weight/w*corr,rev)\n   direct=box/(1+I(-.1431,.1301)*gap)\n   return out.cap(direct.lo,direct.hi)\n  ml=adjusted(ma,wa,rh,kg,False);xl=adjusted(xa,wa,rh,lg,True)\n  mh=adjusted(mb,wb,rl,kg,False);xh=adjusted(xb,wb,rl,lg,True)\n  self.m=I(ml.lo,mh.hi);self.x=I(xl.lo,xh.hi)\n  self.z=self.x-self.m\n  # Q combo cell rmq\n  da=zcells(self.a);db=zcells(self.b)\n  delta=(db['M']-da['M']).cap(0,30) # may fail over tiny equal? intervals overlap\n  upperq=da['Q']+self.a.a*delta\n  lowerq=db['Q']-self.b.a*delta\n  qhi=Rmq(self.a,upperq).query(self.z)+ERR*gap\n  qlo=Rmq(self.b,lowerq).query(self.z)-ERR*gap\n  qhi=I(np.minimum(0,qhi.lo),np.minimum(0,qhi.hi))\n  self.sl=I(np.maximum(0,(-qhi/self.vhi).lo)); self.sh=I((-qlo/self.vlo).hi)\n  # actual slope between sl.lo and sh.hi (qlo.lo negative)\n  self.slope=I(self.sl.lo,self.sh.hi)\n  self.logp=anchored(self.slope)\n  if check:self.checkH(da,db,delta)\n def possiblek(self,z): # central away grid tails\n  # high k where zhi >= z.lo; low k where zlo<= z.hi\n  low=np.minimum.accumulate(self.z.lo) # enforce decreasing lower? prefix min remains lower\n  hi=np.maximum.accumulate(self.z.hi[::-1])[::-1]\n  i1=np.searchsorted(-low,-z.hi,side='left')\n  i2=np.searchsorted(-hi,-z.lo,side='right')-1\n  ok=(i1<len(kg.lo))&(i2>=0)\n  i1=np.clip(i1,0,len(low)-1);i2=np.clip(i2,0,len(low)-1)\n  klow=np.where(ok,kg.lo[i1],np.where(z.lo>0,0,kg.lo[-1]))\n  khigh=np.where(ok,kg.hi[i2],np.where(z.lo>0,kg.hi[0],1))\n  # even if ok at extreme include tail if i1==0 or i2==last\n  klow=np.where(i1==0,0,klow);khigh=np.where(i2==len(low)-1,1,khigh)\n  assert np.all(klow<=khigh)\n  k=I(klow,khigh)\n  l=1-k;l=I(np.maximum(0,l.lo),np.minimum(1,l.hi))\n  # lower V via 32\n  vl=rat(9,7)*k*l*l.sqrt()\n  return k,vl.lo\n def checkH(self,da,db,delta):\n  sel=(da['z'].lo<12)&(da['z'].hi>-12)\n  z=da['z'].sel(sel)\n  mi=I(da['M'].lo,db['M'].hi).sel(sel)\n  ki,vl=self.possiblek(z)\n  for d,g,upper in [(da,self.a,True),(db,self.b,False)]:\n   q,qp,k,l=[d[x].sel(sel) for x in ['Q','qp','k','l']]\n   damp=.5-qp-g.a*k-(self.gap*ki if upper else 0)\n   br=mi*(qp-g.a*l)-ki*q+I(vl)\n   if upper:br-=g.a*ki*delta.sel(sel)\n   val=br+ERR*damp\n   assert np.min(damp.lo)>.06,np.min(damp.lo)\n   assert np.min(val.lo)>0,(g.A,np.min(val.lo),z.lo[np.argmin(val.lo)])\n  # tail q @ z <= -5.5 numerical\n  for d in [da,db]:\n   s=(d['z'].lo<-5.5)\n   assert np.min(d['Q'].lo[s])>-.28\n  assert self.z.hi[-1]<-5.5 and self.z.lo[0]>4\n  # delta tail <= X_b(-5.5) for negative z; numerical\n  s=db['z'].lo<-5.5\n  assert np.max(db['X'].hi[s])<.03\n  assert self.logp.hi[-1]<5\n  for g,arr in [(self.a,self.va0),(self.b,self.vb0)]:\n   assert -arr[0].hi[-1]*2*(.5-g.af)>2 and arr[0].lo[0]>6\n def coarse(self,test,upper,detail=False):\n  test=iv(test)\n  slope=self.sl if upper else self.sh\n  p=iexp(anchored(slope))\n  v=self.vhi if upper else self.vlo\n  integrand=p*(v-2*test*kg*kg*lg/v)\n  # sign cumulative, allow tail error absolute 1e-7, only when away far endpoint\n  if upper:\n   # g negative near k=1 verify central tail say k>.95, analytical beyond cut\n   far=kg.lo>.95\n   if np.max(integrand.hi[far])>=0:return False\n   cum=partialsum(integrand,True)\n   val=np.max(cum.hi[~far])+1e-7\n   # positive tail k->0 total error\n   return val if detail else val<0\n  else:\n   far=kg.hi<.05\n   if np.min(integrand.lo[far])<=0:return False\n   cum=partialsum(integrand)\n   val=np.min(cum.lo[~far])-1e-7\n   return val if detail else val>0\n@lru_cache(maxsize=3)\ndef refdata(g):\n z,m,x,v=g.inverse(kg,lg)\n q=Rmq(g,zcells(g)['Q']).query(z)\n slope=-q/v; lp=anchored(slope); p=iexp(lp)\n return z,m,x,v,q,slope,lp,p\ndef nonlineartest(env,test,upper,nt=8):\n test=iv(test);c=rat(3,10)\n gr=profiles(293650)\n z,mr,xr,vr,q,sr,lpr,pr=refdata(gr)\n tk=kg*lg\n base=total(pr/vr*(vr.sq()+c*(mr*xr-tk)-2*test*kg*tk))\n # actual slopes bounded, reference slope cell intervals\n eps=ilog(I(env.vlo.lo,env.vhi.hi)/vr)\n pis=env.slope-sr\n pi=anchored(pis) # tighter than logp - lpr\n out=base\n for it in range(nt):\n  t=I((it)/nt,(it+1)/nt) # nt power2\n  vf=iexp(t*eps);pf=iexp(t*pi)\n  v=vr*vf;p=pr*pf\n  # cap v,p actual envelope geometric? both ref within => yes slope convex for interpolated log\n  v=v.cap(env.vlo.lo,env.vhi.hi)\n  pbox=iexp(env.logp);p=p.cap(pbox.lo,pbox.hi)\n  pv=p/v\n  inv=1/vf-1\n  def prim(ref,weight,rev):\n   # omitted tail |1/vfac-1|<=3 from heat ratio <4\n   tail=I(-3.01,3.01)*ref.sel(-1 if rev else 0)\n   y=ref+tail+partialsum(weight/vr*inv,rev)\n   static=(env.x if rev else env.m)\n   return y.cap(static.lo,static.hi)\n  m=prim(mr,kg,False);x=prim(xr,lg,True)\n  signed=c*(m*x-tk)-2*test*kg*tk\n  gp=pv*(v.sq()+signed)\n  gv=pv*(v.sq()-signed)-c*kg/v*partialsum(pv*x,True)-c*lg/v*partialsum(pv*m)\n  varv=total(gv*eps)\n  # omitted M epsilon derivative tails <=6 M_ref(cut), heat/log ratio\n  terror=6*(mr.hi[0]*total(c*pv*x).hi+xr.hi[-1]*total(c*pv*m).hi)\n  assert terror<3e-7,terror # may pv*m divergent near tail but finite cut logs polynomial!\n  coeff=choose(np.arange(len(width))<mid,-partialsum(gp),partialsum(gp,True))\n  varp=total(coeff*pis)\n  alt=total(gp*pi)\n  varp=varp.cap(alt.lo,alt.hi)\n  out+=(varv+varp)/nt\n val=out.hi+1e-6 if upper else out.lo-1e-6\n return val\ndef kquery(vals,i1,i2):\n # range extrema sparse using generic\n los=vals.lo;his=vals.hi\n n=i2-i1+1\n outlo=np.empty(len(n));outhi=np.empty(len(n))\n step=1\n while step<=max(n):\n  sel=(n>=step)&(n<2*step)\n  a=i1[sel];b=i2[sel]-step+1\n  outlo[sel]=np.minimum(los[a],los[b]);outhi[sel]=np.maximum(his[a],his[b])\n  los=np.minimum(los[:-step],los[step:]);his=np.maximum(his[:-step],his[step:])\n  step*=2\n return I(outlo,outhi)\ndef localcheck():\n E=Env(293650,293655)\n a=I(E.a.a.lo,E.b.a.hi); d=rat(1,100)\n k,l=kg,lg; z=E.z;m=E.m;x=E.x\n assert -20<z.lo[-1] and z.hi[-1]<-10 and z.lo[0]>7 and z.hi[0]<20\n W=I(E.vlo.lo,E.vhi.hi)\n c0,c1,c2,c3=[rat(t,100) for t in [26,130,-186,325]]\n L=c0+k*(c1+k*(c2+k*c3));Lp=c1+2*k*c2+3*k*k*c3;Lpp=2*c2+6*k*c3\n assert np.max(L.hi)<3\n t=k*l\n T=2*(.5-a)*m*l/W-2*k+2*a*(t/W).sq()\n B=.5*z+a*m\n Wk=2*B-2*a*t/W\n R=1+I(-1,1)*d*L\n core=.5*W.sq()*Lpp+W*Wk*Lp\n rhs=R.sq()*core-(a+I(-1,1)*d)*t*Lp+R*(-(R+1)*(.5+a*T)*L+I(0,T.maxabs())) # absolute adverse source\n core0=I(-1,1)*d*core-(.5+a*T)*R\n assert np.max(rhs.hi)<0,np.max(rhs.hi)\n assert np.max(core0.hi)<0\n epsmax=L/(1-d*L)\n def lprim(weight,ref,rev):\n  val=I(0,3.11)*ref.sel(-1 if rev else 0)+partialsum(weight/W*epsmax,rev)\n  return I(0,np.minimum(val.hi,3.11*ref.hi))\n lm=lprim(k,m,False);lx=lprim(l,x,True);lz=lm+lx\n zi=z+I(-1,1)*d*lz\n da=zcells(E.a);db=zcells(E.b)\n delta=(db['M']-da['M']).cap(0,30)\n Qh=da['Q']+E.a.a*delta+ERR*E.gap;Ql=db['Q']-E.b.a*delta-ERR*E.gap\n Qsp=I(Ql.lo,np.minimum(0,Qh.hi))\n rq=Rmq(E.a,Qsp)\n Qstar=rq.query(z)\n shifts=lz*I(rq.query(zi).maxabs()+2*.011) # pad\n # H same z\n sel=(da['z'].lo<12)&(da['z'].hi>-12); zz=da['z'].sel(sel)\n def poss(box,useW=False):\n  low=np.minimum.accumulate(box.lo);hi=np.maximum.accumulate(box.hi[::-1])[::-1]\n  i1=np.searchsorted(-low,-zz.hi,side='left');i2=np.searchsorted(-hi,-zz.lo,side='right')-1\n  i1=np.clip(i1,0,len(low)-1);i2=np.clip(i2,0,len(low)-1)\n  kk=I(np.where(i1==0,0,k.lo[i1]),np.where(i2==len(low)-1,1,k.hi[i2]))\n  assert np.all(i2>=i1)\n  ww=kquery(W,i1,i2) # tail max <= .0001 below from (32)\n  return kk,ww\n ks,_=poss(z);ki,wi=poss(zi)\n Ms=I(da['M'].lo[sel],db['M'].hi[sel]);ls=1-ks\n assert np.max((m*l/(.5-(a+d)*l)).hi)<.65\n dm=rat(65,100)\n Mi=Ms+I(-1,1)*dm*d\n qq=Qsp.sel(sel)\n qp=2*(.5*zz+a*Ms)*qq-qq.sq()+2*(.5-a*ks-a)\n damp=.5-qp-a*ks-d*ki\n # wi max tails use endpoint or simple .001 extra\n br=Mi*(qp-a*ls)-ki*qq+I(0,(1.031*wi.hi+.0001))+I(-1,1)*a*ki*dm*d\n assert np.min(damp.lo)>.1\n gain=a*dm+(a*(1-a)*dm+I(br.maxabs()))/damp\n assert np.max(gain.hi)<2,np.max(gain.hi)\n # functional\n cadd=rat(3,10)\n sr=-Qstar/W;lpr=anchored(sr);pr=iexp(lpr)\n zc=z.sel(mid)\n assert zc.maxabs()<2\n pimax=2*I((z-zc).maxabs())+shifts\n out=0\n for it in range(4):\n  td=d*(it+1)/4\n  pvf=iexp(I(-1,1)*td*pimax)\n  vf=iexp(I(-1,1)*td*epsmax)\n  v=W*vf;p=pr*pvf;pv=p/v\n  mt=(m+I(-1,1)*td*lm).cap(.968*m.lo,1.033*m.hi)\n  xt=(x+I(-1,1)*td*lx).cap(.968*x.lo,1.033*x.hi)\n  signed=cadd*(mt*xt-t)-2*a*k*t\n  gp=pv*(v.sq()+signed)\n  gv=pv*(v.sq()-signed)-cadd*k/v*partialsum(pv*xt,True)-cadd*l/v*partialsum(pv*mt)\n  cv=total(I(gv.maxabs())*epsmax)\n  terror=4*(m.hi[0]*total(cadd*pv*xt).hi+x.hi[-1]*total(cadd*pv*mt).hi)\n  assert terror<3e-7\n  coeff=choose(np.arange(len(width))<mid,partialsum(gp),partialsum(gp,True))\n  cp=total(I(coeff.maxabs())*2/W)+total(I(gp.maxabs())*shifts)\n  out+=(cv+cp)/4\n den=2*total(pv*k*t)\n assert den.lo>0\n return (out.hi+2e-6)/den.lo\ndef checkA():\n n=4096\n ind=np.arange(1,n-1)\n k=I(ind/n,(ind+1)/n);l=1-k;t=k*l\n low=rat(9,7)*k*l*l.sqrt(); high=rat(6,5)*(t*t.sqrt()).sqrt()\n b=2*(rat(6,10)-k); B=-rat(4,10)*t\n # max endpoint term convex when b>=0, decreasing if b<0\n edge=(b*low.sq()+2*B*low).hi\n edge=np.maximum(edge,(b*high.sq()+2*B*high).hi)\n ws=[low+(high-low)*I(i/128,(i+1)/128) for i in range(128)]\n mini=100.\n for aa in range(419,1024): # covers [.41,1]\n  a=I(aa/1024,(aa+1)/1024)\n  K=12*a*k-5*a-1-b.sq()+rat(8,10)*(1-2*k)\n  pos=(6*a.sq()-rat(16,100))*t.sq()\n  mins=np.minimum.reduce([(2*w.sq()+K*w-2*b*B+pos/w).lo for w in ws])\n  # last cell crude integrand >=-9; first likewise and endpoint |...| upper<.001\n  assert np.max(abs(mins))<9\n  cs=np.cumsum(mins[::-1])[::-1]/n-2e-9\n  bound=cs-np.maximum(0,mins)/n-9/n-edge\n  val=min(np.min(bound[ind<=2560]),cs[0]-18/n-.001)\n  mini=min(mini,val)\n  assert val>0,(aa,val,cs[0])\n return mini\n\ndef driver():\n global AD\n assert checkA()>0\n A,B=(0, 410000)\n for an,bn in [(167000, 410000), (183000, 410000), (185000, 400000), (193000, 397000), (197000, 390000), (203000, 386000), (207000, 381000), (211000, 377000), (215000, 373000), (218000, 369000), (220000, 370000)]:\n  e=Env(A,B); print(A,B,flush=True)\n  if an>A: assert e.coarse(rat(an,AD),False)\n  if bn<B: assert e.coarse(rat(bn,AD),True)\n  A,B=an,bn\n A,B=(220000, 370000)\n for an,bn in [(228000, 370000), (231000, 368000), (234000, 363000), (239000, 358000), (244000, 350000), (251000, 341000), (258000, 332000), (266000, 324000), (272000, 316000), (277000, 311000), (281000, 307000), (283000, 304000), (285000, 303000)]:\n  e=Env(A,B); print(A,B,flush=True)\n  if an>A: assert nonlineartest(e,rat(an,AD),False)>0\n  if bn<B: assert nonlineartest(e,rat(bn,AD),True)<0\n  A,B=an,bn\n\n assert localcheck()<.95\n AD=10**7\n for A in [2936533,2936535]:\n  _,_,lam=certified(A)\n  assert (lam-10>A*1000 if A==2936533 else lam+10<A*1000)\ndriver()")

