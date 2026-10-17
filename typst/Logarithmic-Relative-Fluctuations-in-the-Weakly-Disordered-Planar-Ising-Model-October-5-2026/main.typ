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

#align(center)[#text(size: 16pt, weight: "bold")[Logarithmic Relative Fluctuations in the \
Weakly Disordered Planar Ising Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

Weak random bonds in the planar Ising model provide a basic example in which disorder is expected to change critical correlations through logarithmic factors. The fluctuations of a quenched correlation are particularly revealing: the correlation is first computed in a fixed environment, with its own Gibbs normalization, and only then averaged over the bonds. This paper establishes the predicted logarithmic growth of its relative second moment for small, fixed binary disorder. The proof uses deterministic critical-reference estimates from [19]; the stochastic estimates and the identification of the physical critical point are proved here.

=== 1.1 Model and result <model-and-result>

Let $E$ be the unordered nearest-neighbor edges of $bb(Z)^2$, each counted once, and let $\( xi_e \)_(e in E)$ be independent fair signs on a single probability space. Fix $0 < epsilon < 1$ and set $J_e \( omega \) = 1 + epsilon xi_e \( omega \)$. For $Lambda_n = { - n \, dots.h \, n }^2$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ H_(n \, omega)^(upright(f)) \( sigma \) & = - sum_(e = { x \, y } in E\
x \, y in Lambda_n) J_e \( omega \) sigma_x sigma_y \,\
H_(n \, omega)^(+) \( sigma \) & = - sum_(e = { x \, y } in E\
e ∩ Lambda_n eq.not diameter) J_e \( omega \) sigma_x sigma_y \, #h(2em) sigma_x = 1 quad \( x in.not Lambda_n \) . $ <eq:free-hamiltonian>]

In the second sum, edges wholly outside $Lambda_n$ are omitted. For $b in { upright(f) \, + }$ and $beta gt.eq 0$, write $chevron.l dot.op chevron.r_(n \, beta \, omega)^b$ for the Gibbs expectation proportional to $exp \( - beta H_(n \, omega)^b \)$. Every expectation is normalized separately at its indicated environment and boundary condition.

The physical critical inverse temperature is

#[#set math.equation(numbering: n => "(1.2)")
 $ m_epsilon \( beta \) = bb(E) #h(-0.16667em) [lim_(n arrow.r oo) chevron.l sigma_0 chevron.r_(n \, beta \, omega)^(+)] \, #h(2em) beta_c \( epsilon \) = inf { beta gt.eq 0 : m_epsilon \( beta \) > 0 } . $ <eq:critical-definition>]

Ferromagnetic monotonicity gives the plus limit. Comparison with constant bonds, with $beta_0 = 1 / 2 log \( 1 + sqrt(2) \)$, gives

$ 0 < frac(beta_0, 1 + epsilon) lt.eq beta_c \( epsilon \) lt.eq frac(beta_0, 1 - epsilon) < oo . $

For each integer $r gt.eq 3$, let

#[#set math.equation(numbering: n => "(1.3)")
 $ C_(epsilon \, omega) \( r \) = lim_(n arrow.r oo \, thin n gt.eq r) chevron.l sigma_0 sigma_(\( r \, 0 \)) chevron.r_(n \, beta_c \( epsilon \) \, omega)^(upright(f)) \, #h(2em) R_epsilon \( r \) = frac(bb(E) \[ C_(epsilon \, omega) \( r \)^2 \], bb(E) \[ C_(epsilon \, omega) \( r \) \]^2) . $ <eq:quenched-correlation>]

The free correlation limit exists by monotonicity in the volume and lies in $\( 0 \, 1 \]$. In particular $R_epsilon \( r \)$ is defined and is at least one. All unqualified expectations $bb(E)$ below are over the environment; auxiliary independent random choices used in the proof will be included explicitly when introduced.

#thm([Theorem 1.1.])[
  #emph[Assume the deterministic reference-model estimates of [19], at the scopes stated in Section 2. There is $epsilon_0 > 0$ such that for every fixed $epsilon in \( 0 \, epsilon_0 \)$, 
#[#set math.equation(numbering: n => "(1.4)")
 $ lim_(r arrow.r oo \, thin r in bb(N)) frac(log R_epsilon \( r \), log log r) = 1 / 4 . $ <eq:main-limit>]

 The critical inverse temperature in (1.3) is the physical value (1.2); it is the unique positive solution of 
#[#set math.equation(numbering: n => "(1.5)")
 $ sinh #scale(x: 120%, y: 120%)[\(] 2 beta \( 1 - epsilon \) #scale(x: 120%, y: 120%)[\)] sinh #scale(x: 120%, y: 120%)[\(] 2 beta \( 1 + epsilon \) #scale(x: 120%, y: 120%)[\)] = 1 . $ <eq:critical-curve>]

]
] <thm:main>

The order of limits is essential. The disorder strength is fixed first; the free thermodynamic limit is then taken for each separation, followed by the disorder moments and the limit in $r$. Constants and errors may depend on this fixed positive strength. At $epsilon = 0$ the environment is deterministic and $R_0 \( r \) = 1$.

The reference input concerns deterministic translation-invariant, square-symmetric, finite-range even perturbations and their critical nearest-neighbor comparison kernels. It supplies neither a random critical point nor a quenched moment estimate. Section 2 states the particular reference consequences needed below, including their buffer and symmetry conditions. The proof of Theorem 1 establishes the random estimates from these inputs.

=== 1.2 Historical context <historical-context>

The pure planar Ising model has specific-heat exponent zero, the borderline case left undecided by Harris’s criterion for the effect of quenched disorder [16] Section 5. Dotsenko and Dotsenko obtained the double-logarithmic prediction for the random model’s specific heat [9]. Shalaev’s renormalization analysis predicted unchanged leading critical indices [20]. Shankar and Ludwig developed the logarithmic corrections to spin-correlation moments [21,17]. In particular, Shankar predicted the factor $\( log r \)^(1 \/ 4)$ in the second moment of the spin correlation, and Ludwig studied logarithmic corrections to its moments. The exponent in Theorem 1 is thus an established prediction. The issue addressed here is its derivation for normalized quenched correlations at the physical critical point, under the stated reference input.

The deterministic reference theory has a different role. Critical nearest-neighbor spin correlations and mixed primary fields have rigorous scaling limits; the limiting fields satisfy operator-product expansions [7,8]. Rigorous results for deterministic weak perturbations include energy correlations in the plane [14], energy correlations on cylinders [2], and boundary spin correlations in the half-plane [4]. These results provide context for the deterministic bulk premise used here [19]; none supplies the random moment estimates below. The energy and spin operator products enter the coefficient computation in Section 6, after the local estimates needed for random interactions have been established.

Rigorous critical behavior at a self-dual random-bond law also predates this work. Building on disorder-rounding results of Aizenman and Wehr [1], Chayes and Shtengel proved zero magnetization and algebraic lower bounds on averaged correlations at the binary self-dual law [5] Theorems 1$'$ and 2$'$. Their argument did not exclude a critical phase containing that point. Here the weak-disorder estimates identify the tuned parameter with the physical critical threshold and give the logarithmic moment asymptotic there. The probabilistic part uses the random-cluster representation [13,12], critical crossing estimates [10,6], product-space influences [15], and the monotone-measure extension [11] of the decision-tree inequality of O’Donnell, Saks, Schramm, and Servedio [18].

=== 1.3 Proof strategy and the role of locality <proof-strategy-and-the-role-of-locality>

It is convenient to include inverse temperature in the couplings and use the coordinates

#[#set math.equation(numbering: n => "(1.6)")
 $ log sinh \( 2 K_e \) = t + D xi_e \, #h(2em) D > 0 . $ <eq:model-td>]

For each sufficiently small fixed $D$, we first choose $t$ by a renormalization construction. The last part of the proof identifies this choice with $t = 0$ and then returns to the original parameter $beta$.

At scale $r_j = r_0 L^j$, the effective interaction is a sum of local even spin functions. Each cell has one distinguished term whose size is allowed to be large. The other terms are indexed by connected sets of cells and have small norms with exponential decay in the size of those sets. Every term records both the spins on which it acts and the original random variables on which its coefficients depend. This second record will give exact independence of the leading factors attached to well-separated spin insertions.

The first difficulty is to transport interactions that are small in high moments but are not uniformly small. Section 3 constructs an exact local change of representation. An isolated group of large interactions is integrated as a positive exponential weight. Insertions in the same region are transported by its normalized conditional law. Reference comparison across a surrounding buffer bounds the resulting density, and reference even-function decay attenuates its dependence on the outer spins. Failures of this attenuation have a distant large-field witness, which can be paid for using independence and high moments. Section 4 turns these observations into the estimates needed to iterate the construction. In particular, it controls mixed moments of spin sources and nearby background fields, whose randomness is shared.

The linearized background transport has one expanding mean coordinate and one neutral covariance coordinate. The first is removed by choosing $t$; the second, denoted $g_j$, measures thermal-charge variance per unit area. Section 5 proves contraction of the remaining coordinates. The nonlinear coefficients of the two surviving effects are computed in Section 6. Its method uses finitely many microscopic energy insertions: exact partition identities preserve their normalized charges, and the reference energy and spin operator products determine the logarithmic terms. Only finite-degree polynomial calculations are needed. This separates the coefficient calculation from the estimates that justify the real random iteration.

The resulting flow, proved in Sections 7 and 8, satisfies $g_j tilde.op \( B_0 j \)^(- 1)$ for a positive constant $B_0$. The leading random factor of a transported spin has a bounded positive mean and second moment $j^(1 \/ 8 + o \( 1 \))$. Two distant insertions have independent leading factors once their small nonlocal remainders are removed. Section 9 uses an enlarging terminal buffer to compare the remaining Gibbs expectation with the critical reference expectation. It obtains the relative second-moment exponent $1 \/ 4$ and also a high-moment wired-arm bound.

Finally, Section 10 identifies the physical transition. Twisted torus partition functions locate the tuned value at the distributionally self-dual point. A product-space influence inequality and a random-shell exploration inequality make the needed threshold and subcritical estimates explicit. Planar random-cluster duality then gives positive magnetization above tuning. This final step connects the local renormalization construction to the critical point used in the statement.

The reusable parts of the method are the positive treatment of large local interactions, the simultaneous tracking of spin support and random dependence, and the extraction of marginal coefficients from invariant charges of finitely many insertions. Their application here requires all three: locality controls dependence, high moments control exceptional fields, and the coefficient identities determine the logarithmic exponent.

== 2 Reference averaging, charges, and field products <sec:reference>

The changes of scale below use conditional expectations in the critical nearest-neighbor model. This section records their precise scope and derives three consequences: an invariant coefficient for each of the energy and spin directions, the large-distance coefficients of the products of these fields, and a finite set of boundary tests that controls an averaged sup norm. These are deterministic statements. Estimates for the random lists constructed from them begin in Section 4.

=== 2.1 The reference measure and its accepted inputs <the-reference-measure-and-its-accepted-inputs>

Write $chevron.l dot.op chevron.r_0$ for critical nearest-neighbor plane expectation on $bb(Z)^2$, at coupling $K_c = 1 / 2 log \( 1 + sqrt(2) \)$. For a max-norm square $B_R \( z \)$, let $P_(R \, z)$ be conditional expectation over its interior, retaining the spins of its cutting contour. Thus $P_(R \, z) F$ is a function of cutting spins whenever $F$ is supported inside the square. All sup norms in this section are over every assignment of the spins on the support of the function; for $P_(R \, z) F$ these are the cutting spins. We abbreviate $P_(R \, 0)$ to $P_R$. Nested cuts compose by the tower property. In particular, if a square lies inside a larger reference domain, replacing an observable inside the square by its conditional average preserves its expectation in that domain, as well as in the plane.

Put $F^compose = F - chevron.l F chevron.r_0$, and use this representative for even functions modulo constants. An odd function already has plane mean zero. Our scalar energy and spin dimension are

#[#set math.equation(numbering: n => "(2.1)")
 $ e \( z \) = 1 / 4 sum_(v : thin \| v - z \| = 1) #scale(x: 120%, y: 120%)[\(] sigma_z sigma_v - chevron.l sigma_z sigma_v chevron.r_0 #scale(x: 120%, y: 120%)[\)] \, #h(2em) d = 1 / 8 . $ <ref:energy>]

We use Euclidean distances for field asymptotics and max-norm squares for conditional averaging. This distinction changes no buffer condition.

The supplied conformal-universality theorem applies to a fixed deterministic potential on finite even sets, of fixed finite range, invariant under lattice translations, reflections, and right-angle rotations. For a sufficiently small fixed coefficient multiplying that potential, it supplies a critical branch, nonzero field factors, and separated bulk spin and energy limits in smooth simply connected domains with free, plus, or minus boundary, and in the plane obtained from periodic-square thermodynamic limits [19] Theorem 1.1. We use its conditional averaging, thermal, and marked-source interfaces only for the unperturbed critical reference model in bulk charts with their prescribed buffers. In particular, its conditional kernels throughout this paper are $P$; they are never conditional kernels of a random effective interaction.

Here are the specific operator and calibration inputs. If $F$ is supported in $B_w \( 0 \)$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ d_R \( F \) = chevron.l F chevron.r_(upright("disk") \( 4 R \))^(+) - chevron.l F chevron.r_0 . $ <ref:disk-response>]

For each sufficiently large fixed ratio $R \/ w$, and all sufficiently large $w$, the reference estimate gives

#[#set math.equation(numbering: n => "(2.3)")
 $ \| d_R \( F \) \| & lt.eq C \( w \/ R \)^b ∥F∥_oo \,\
∥P_R F^compose∥_oo & lt.eq C \| d_R \( F \) \| + C \( w \/ R \)^p ∥F∥_oo \, $ <ref:response-input>]

where

#[#set math.equation(numbering: n => "(2.4)")
 $ \( b \, p \) = cases(delim: "{", \( 1 \, 3 \) \, & F upright(" is even and invariant under right-angle rotations") \,, \( 1 \, 2 \) \, & F upright(" is even") \,, \( d \, 1 + d \) \, & F upright(" is odd") .) $ <ref:exponents>]

The constant is uniform over sufficiently large fixed ratios, whereas the fine-mesh threshold can depend on the ratio. Ratios converging to a fixed admissible value are allowed. The norm bound is uniform over all cutting configurations [19] Proposition 4.1.

Write $cal(O)_1 \( z \) = e \( z \)$ and $cal(O)_d \( z \) = sigma_z$, and omit $z$ when $z = 0$. There are nonzero constants $kappa_b$ such that

#[#set math.equation(numbering: n => "(2.5)")
 $ R^b d_R \( cal(O)_b \) arrow.r kappa_b . $ <ref:calibration>]

Moreover the averaged reference fields satisfy

#[#set math.equation(numbering: n => "(2.6)")
 $ c lt.eq ∥w^b P_w cal(O)_b∥_oo lt.eq C \, #h(2em) c \( w \/ R \)^b lt.eq \| d_R \( w^b P_w cal(O)_b \) \| lt.eq C \( w \/ R \)^b . $ <ref:line-norms>]

Here and below energy fields are plane-centered. These are the calibration and field-line estimates of [19] Lemmas 4.5 and 5.3 and Equation (5.18). The exact identity behind the last reference is

#[#set math.equation(numbering: n => "(2.7)")
 $ B^b P_(B w) #scale(x: 120%, y: 120%)[\(] w^b P_w cal(O)_b #scale(x: 120%, y: 120%)[\)] = \( B w \)^b P_(B w) cal(O)_b . $ <ref:exact-line>]

No convergence rate for primary fields is used in these inputs.

=== 2.2 Invariant energy and spin coefficients <invariant-energy-and-spin-coefficients>

The disk response in (2.3) depends on the observation scale. To use a single thermal coordinate through successive cuts, we first replace that response by a linear functional invariant under all cuts.

#thm([Lemma 2.1.])[
  (Invariant charges).  #emph[There are linear functionals $ell$ on bounded local even functions modulo constants and $ell_s$ on bounded local odd functions with 
$ ell \( e \( z \) \) = 1 \, #h(2em) ell_s \( sigma_z \) = 1 . $

 They commute with translations and square symmetries and are invariant under reference conditional averaging whenever the cut encloses the support. For $b = 1$ write $ell_b = ell$, and for $b = d$ write $ell_b = ell_s$; the subscript in $ell_s$ means spin. If $F$ has the corresponding parity and support in a square of radius $w$ above a fixed threshold, then 
#[#set math.equation(numbering: n => "(2.8)")
 $ \| ell_b \( F \) \| lt.eq C w^b ∥F∥_oo \, #h(2em) ell_b \( F \) = kappa_b^(- 1) lim_(R arrow.r oo) R^b d_R \( F \) . $ <ref:charge-bound>]

 The disk in this limit may be centered at any fixed lattice point. In the even case $ell_b$ annihilates constants.]
] <ref:charges>

#thm([Proposition 2.2.])[
  (Averaging and charge cancellation).  #emph[Fix $nu > 0$ smaller than $p - b$ in the applicable row of (2.4). For all sufficiently large $w$ and $R gt.eq C w$, a function $F$ of that parity, supported in $B_w \( z \)$, satisfies 
#[#set math.equation(numbering: n => "(2.9)")
 $ ∥P_(R \, z) F^compose∥_oo & lt.eq C \( w \/ R \)^b ∥F∥_oo \,\
∥P_(R \, z) F^compose - ell_b \( F \) P_(R \, z) cal(O)_b \( z \)∥_oo & lt.eq C \( w \/ R \)^(p - nu) ∥F∥_oo . $ <ref:ordinary-decay>]

 In particular, the second bound is the improved decay bound for a function of charge zero. We shall use $nu = 1 \/ 4$. The exponent $3 - nu$ requires the individual even function to be invariant under right-angle rotations; invariance of its probability law alone does not suffice. For a site at fixed positive relative distance from the cutting contour, 
#[#set math.equation(numbering: n => "(2.10)")
 $ ∥P_(R \, z) e \( y \)∥_oo lt.eq C R^(- 1) \, #h(2em) ∥P_(R \, z) sigma_y∥_oo lt.eq C R^(- d) . $ <ref:microscopic-decay>]

 The first bound also holds for a single plane-centered bond product.]
] <ref:operator>

#proof[
  Fix a sufficiently large integer $B$ and put $w_k = B^k w$. In the appropriate parity space, with plane centering in the even case, define
  $ v_k = w_k^b P_(w_k) cal(O)_b \, #h(2em) S_k = B^b P_(w_(k + 1)) . $
  The lines $bb(R) v_k$ are uniformly nonzero and bounded by (2.6), and $S_k v_k = v_(k + 1)$ by (2.7). If $F$ is supported in $B_(w_k)$, subtract $alpha v_k$ to cancel its response in the disk of radius $4 w_(k + 1)$. Equations (2.3) and (2.6) give $\| alpha \| lt.eq C ∥F∥_oo$. Applying (2.3) to this difference proves the quotient bound
  #[#set math.equation(numbering: n => "(2.11)")
   $ ∥S_k : thin X_k \/ bb(R) v_k arrow.r X_(k + 1) \/ bb(R) v_(k + 1)∥ lt.eq C B^(b - p) . $ <ref:quotient>]
  Here $X_k$ is the space of bounded functions of the required parity on $B_(w_k)$, with plane mean zero in the even case and with right-angle rotation invariance imposed when $p = 3$; its norm is the sup norm. The same estimate holds after subtracting any multiple of $v_k$, so it is indeed an estimate for the quotient norm. Combining (2.3) and (2.3) at the fixed ratio $B$ also bounds $S_k$ uniformly.
  Choose uniformly bounded projections onto $bb(R) v_k$, using for example the response in a disk at one fixed large multiple of $w_k$ and dividing by its nonzero response on $v_k$. In the resulting bounded splittings,
  $ S_k = mat(delim: "(", 1, beta_k; 0, D_k) \, #h(2em) ∥beta_k∥ lt.eq C \, quad ∥D_k∥ lt.eq C B^(b - p) = : q . $
  Enlarge $B$ until $q lt.eq B^(b - p + nu) < 1$. Writing $S_(k - 1) dots.h.c S_0 F = a_k v_k + u_k$ gives
  $ ∥u_k∥ lt.eq C q^k ∥F∥_oo \, #h(2em) a_(k + 1) - a_k = beta_k u_k . $
  Consequently $a_k$ converges to a linear functional $a_oo \( F \)$ and
  #[#set math.equation(numbering: n => "(2.12)")
   $ \| a_oo \( F \) \| lt.eq C ∥F∥_oo \, quad ∥S_(k - 1) dots.h.c S_0 F - a_oo \( F \) v_k∥_oo lt.eq C q^k ∥F∥_oo . $ <ref:line-limit>]
  Define $ell_b \( F \) = w^b a_oo \( F \)$. Since the line is transported exactly, its coefficient is one on $cal(O)_b$. Constants have already been removed. Dividing (2.12) by $B^(k b)$ gives (2.9) at the radii $w_k$ and gives (2.8)’s bound. The construction permits an arbitrary initial function on the first square; it need not initially be a function of the cutting contour.
  To identify the functional independently of the chosen initial scale, first divide (2.12) by $B^(k b)$ and test the resulting unscaled decomposition in a plus disk at a fixed sufficiently large multiple of $w_k$. Conditional averaging preserves that expectation. After multiplication by the disk scale to the power $b$, the error is $O \( B^(k \( b - p + nu \)) \)$ and tends to zero because $p - nu > b$; the line term tends to $kappa_b ell_b \( F \)$ by (2.5). This proves the limit in (2.8). It also proves that different initial scales and bounded splittings give the same functional. For an intermediate radius $R$, stop one scale earlier when necessary, choosing $k$ so that $B lt.eq R \/ w_k < B^2$. The final averaging ratio then lies in a fixed admissible compact interval. The input estimates are uniform on such an interval: otherwise a sequence of failing ratios would have a convergent subsequence, contrary to their stated converging-ratio version. One additional cut therefore proves both decay bounds and the disk limit for every sufficiently large radius.
  For a cut enclosing $F$, its disk expectation agrees with that of $F$ in every disk containing the cut, and its plane expectation also agrees. The disk-limit formula now proves $P$-invariance. A fixed shift of the disk center gives the same limit: apply the decay decomposition about the old center, whose remainder still has sup norm $O \( R^(- p + nu) \)$ in a square inside the shifted disk. The line term has the same calibrated one-point limit, by bulk one-point convergence with the insertion displaced by $O \( R^(- 1) \)$ in rescaled coordinates. This proves translation invariance; the disk symmetry proves rotation and reflection invariance.
  The bounds in (2.10) at the center are (2.6). For a displaced site, first cut at a square centered there of radius comparable to $R$ and contained inside the requested cut, and then use the tower property and contraction in sup norm. For a single centered bond, its one-point calibration has the same nonzero scalar limit as the four-bond average, by the separated reference field theorem for both bond orientations. The recurrence proving (2.6) uses (2.3) with $p = 2$ in this case: at a fixed large ratio,
  $ \( B w \) ∥P_(B w) F∥_oo lt.eq C + C B^(- 1) w ∥P_w F∥_oo . $
  Iteration bounds the left side uniformly. Finally all four incident bonds have equal charge by square symmetry, and their average has charge one; thus every centered bond has charge one. ◻
]

=== 2.3 Extracting product coefficients from separated limits <extracting-product-coefficients-from-separated-limits>

Normalize the continuum energy $epsilon$ so that its plane two-point function is $\| z - w \|^(- 2)$. Let $a > 0$ be the lattice energy field factor in this normalization; a simultaneous sign change of $epsilon$ changes the signed energy–spin coefficient but not any expression used below. Write $a_sigma > 0$ for the spin field factor. The separated primary-field limits, including mixed correlations in a plus disk, are the accepted reference input and [8] Theorem 1.3. The continuum product expansions in a fixed domain are

#[#set math.equation(numbering: n => "(2.13)")
 $ epsilon \( z \) epsilon \( 0 \) = \| z \|^(- 2) upright(bold(1)) + O \( 1 \) \, #h(2em) epsilon \( z \) sigma \( 0 \) = frac(1, 2 \| z \|) sigma \( 0 \) + O \( 1 \) . $ <ref:continuum-ope>]

They hold inside correlation functions, uniformly away from other insertions and the boundary [8] Theorems 6.1–6.2 and Remark 6.4.

#thm([Lemma 2.3.])[
  (Energy and energy–spin products).  #emph[Uniformly in the direction of $z in bb(Z)^2$ as $\| z \| arrow.r oo$, 
#[#set math.equation(numbering: n => "(2.14)")
 $ chevron.l e \( z \) e \( 0 \) chevron.r_0 & = frac(a^2 + o \( 1 \), \| z \|^2) \,\
ell #scale(x: 120%, y: 120%)[\(] e \( z \) e \( 0 \) #scale(x: 120%, y: 120%)[\)] & = o \( \| z \|^(- 1) \) \,\
ell_s #scale(x: 120%, y: 120%)[\(] e \( z \) sigma_0 #scale(x: 120%, y: 120%)[\)]^2 & = frac(a^2 + o \( 1 \), 4 \| z \|^2) . $ <ref:ee-correlation>]

 The even charge in (2.14) is evaluated modulo the plane mean. In addition to Proposition 3, the proof uses only separated lattice limits and the continuum expansions (2.13).]
] <ref:ope>

#proof[
  Set $n = \| z \|$ and $zeta = z \/ n$. The plane separated energy limit gives (2.14). To extract the other two coefficients without a lattice collision estimate, fix a small $rho > 0$ and cut separately in the disjoint squares of radius $rho n$ about $0$ and $z$. Put
  $ E_0 = P_(rho n \, 0) e \( 0 \) \, quad E_z = P_(rho n \, z) e \( z \) \, quad S_0 = P_(rho n \, 0) sigma_0 \, $
  and
  $ Phi_n = n^2 \( E_z E_0 - chevron.l E_z E_0 chevron.r_0 \) \, #h(2em) Psi_n = n^(1 + d) E_z S_0 . $
  Rounding the square radii leaves fixed buffers. The two conditional replacements preserve expectations in the plane and in every sufficiently large plus disk: condition on both contours and use independence of their interiors. They consequently preserve charges by Lemma 2. Proposition 3 gives $∥Phi_n∥_oo + ∥Psi_n∥_oo lt.eq C$, with both supports in $B_(C n) \( 0 \)$. Their scale-normalized charges are
  #[#set math.equation(numbering: n => "(2.15)")
   $ lambda_n = frac(ell \( Phi_n \), n) = n thin ell \( e \( z \) e \( 0 \) \) \, #h(2em) mu_n = frac(ell_s \( Psi_n \), n^d) = n thin ell_s \( e \( z \) sigma_0 \) \, $ <ref:normalized-product-charges>]
  and are bounded uniformly in $n$.
  For either $Theta_n = Phi_n$ or $Psi_n$, let $b$ be its leading dimension, and put $chi_n = ell_b \( Theta_n \) \/ n^b$. Subtract from $Theta_n$ the field $chi_n n^b P_(C n) cal(O)_b$. This subtraction has bounded norm and zero charge. Its expectation in a disk of radius $4 B n$, with $B$ fixed and large, is therefore $O \( B^(- p + nu) \)$, by (2.9). Calibration of the subtracted line yields
  #[#set math.equation(numbering: n => "(2.16)")
   $ limsup_(n arrow.r oo) lr(|chi_n - kappa_b^(- 1) B^b d_(B n) \( Theta_n \)|) lt.eq C B^(b - p + nu) . $ <ref:charge-extraction>]
  For a sequence of varying directions the same assertion follows from compact-separated convergence after passing to a convergent subsequence of $zeta$. This is the quantitative separation of the two limits: first $n arrow.r oo$ with $B$ fixed, and then $B arrow.r oo$.
  For the even product the limit of $d_(B n) \( Phi_n \)$ is
  $ a^2 #scale(x: 120%, y: 120%)[\(] chevron.l epsilon \( zeta \) epsilon \( 0 \) chevron.r_(upright("disk") \( 4 B \))^(+) - 1 #scale(x: 120%, y: 120%)[\)] . $
  Rescale this disk by $B$. The first expansion in (2.13) gives
  $ chevron.l epsilon \( zeta \) epsilon \( 0 \) chevron.r_(upright("disk") \( 4 B \))^(+) = B^(- 2) chevron.l epsilon \( zeta \/ B \) epsilon \( 0 \) chevron.r_(upright("disk") \( 4 \))^(+) = 1 + O \( B^(- 2) \) . $
  Thus $B d_(B n) \( Phi_n \)$ tends to zero in the iterated limit. The error in (2.16) also tends to zero, since the general even exponent $p = 2$ is already larger than $b = 1$. This proves (2.14).
  For the odd product, plane expectation vanishes, and the separated limit is $a a_sigma chevron.l epsilon \( zeta \) sigma \( 0 \) chevron.r_(upright("disk") \( 4 B \))^(+)$. Let $m_sigma = chevron.l sigma \( 0 \) chevron.r_(upright("disk") \( 4 \))^(+)$. The second expansion in (2.13) gives
  $ chevron.l epsilon \( zeta \) sigma \( 0 \) chevron.r_(upright("disk") \( 4 B \))^(+) = B^(- 1 - d) #scale(x: 120%, y: 120%)[\(] 1 / 2 B m_sigma + O \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Since $kappa_d = a_sigma m_sigma$, the odd instance of (2.16) gives $mu_n arrow.r a \/ 2$ in this sign normalization. Squaring gives (2.14). All the continuum remainders just used are uniform for $\| zeta \| = 1$, which also proves the claimed uniformity in direction. ◻
]

=== 2.4 Positive local tilts and finite boundary tests <positive-local-tilts-and-finite-boundary-tests>

We next give two consequences needed for controlling sup norms of random functions. The first controls a large positive weight inside a small patch; the second reduces a sup norm on a distant contour to finitely many scalar evaluations. In both, the untouched collar is in the reference model.

#thm([Lemma 2.4.])[
  (Buffered comparison and normalized positive weights).  #emph[Consider a finite critical reference graph in a square chart. Let $I \, J$ and $V_(upright("pin"))$ be pairwise disjoint vertex sets, and prescribe common spin values on $V_(upright("pin"))$. Suppose $I subset B_w \( z \)$ and $J subset B_R \( z \)^c$. For $R gt.eq \( 1 + c \) w$ with fixed $c > 0$, every assignment $a$ on $I$ and assignments $tau \, tau'$ on $J$ satisfy 
#[#set math.equation(numbering: n => "(2.17)")
 $ C_c^(- 1) lt.eq frac(bb(P)_0 \( sigma_I = a divides sigma_J = tau \, sigma_(V_(upright("pin"))) \), bb(P)_0 \( sigma_I = a divides sigma_J = tau' \, sigma_(V_(upright("pin"))) \)) lt.eq C_c . $ <ref:density-ratio>]

 For $R gt.eq 8 w gt.eq 8$, the absolute logarithm of this ratio is at most $C \( w \/ R \)^theta$ for some $theta > 0$. The constants are uniform in mesh, common pins, and auxiliary finite real fields. Either law can be replaced by a mixture; the comparison also holds after a common conditional randomization, across fixed polygonal collars of positive relative width, and for different continuations whose reference interactions agree in the separating chart. Free or fixed physical boundaries can intersect such collars.]
  #emph[In particular, let $W > 0$ and $f$ be bounded functions supported in $B_w \( z \)$, let $s \/ w > 1$ leave a fixed relative collar, and put 
#[#set math.equation(numbering: n => "(2.18)")
 $ Z = chevron.l W chevron.r_0 \, #h(2em) N = Z^(- 1) P_(s \, z) W \, #h(2em) M = Z^(- 1) P_(s \, z) \( f W \) . $ <ref:normalized-weights>]

 Then 
#[#set math.equation(numbering: n => "(2.19)")
 $ C^(- 1) lt.eq N lt.eq C \, #h(2em) ∥M∥_oo lt.eq C ∥f∥_oo \, #h(2em) chevron.l N chevron.r_0 = 1 \, quad chevron.l M chevron.r_0 = frac(chevron.l f W chevron.r_0, Z) . $ <ref:weight-bounds>]

 The bounds are independent of the amplitude of $W$. If $W$ and $f$ are spin-flip even, then $N$ and $M$ are even.]
] <ref:comparison>

#proof[
  The conditional-law assertions are the buffered and shrinking-patch comparison [19] Corollary 2.2; the comparison across physical boundaries has the same common-pin convention. Apply (2.17) to the law in the inner square under an arbitrary cutting configuration and to its mixture induced by the reference plane law. Pointwise comparison of these laws, integrated against $W gt.eq 0$, gives $C^(- 1) Z lt.eq P_(s \, z) W lt.eq C Z$. The inequality $\| f W \| lt.eq ∥f∥_oo W$ gives the bound for $M$. The two mean identities are the tower property. Finally, global spin flip commutes with the reference kernel, which proves the parity assertion. ◻
]

Taking $W = e^B$ in (2.18) makes both the denominator and numerator of the tilted expectation bounded before a farther reference cut is applied. Lemma 14 will combine these bounds with Proposition 3 to obtain attenuation uniform in the size of an even local tilt $B$.

#thm([Lemma 2.5.])[
  (Finite tests for an averaged sup norm).  #emph[Fix concentric inner and outer squares with a sufficiently large fixed ratio of radii and fixed relative buffers. Rescale the inner radius to one; the resulting mesh is $1 \/ w$ when the original radius is $w$ in lattice units. For every $eta > 0$ there are an integer $N$ and a fine-mesh threshold such that, at each finer mesh, one can choose outer cutting configurations $tau_1 \, dots.h \, tau_N$ with 
#[#set math.equation(numbering: n => "(2.20)")
 $ ∥P F∥_oo lt.eq max_(1 lt.eq k lt.eq N) \| P F \( tau_k \) \| + eta ∥∥ F_oo $ <ref:finite-tests>]

 for every bounded function $F$ supported in the inner square. Here $P$ averages to the outer contour. The number $N$ is independent of the mesh and of $F$; the actual configurations may depend on the mesh. Consequently, for a random inner function $F$ and $q gt.eq 1$, 
#[#set math.equation(numbering: n => "(2.21)")
 $ #scale(x: 120%, y: 120%)[\(] bb(E) ∥P F∥_oo^q #scale(x: 120%, y: 120%)[\)]^(1 \/ q) lt.eq N^(1 \/ q) max_k #scale(x: 120%, y: 120%)[\(] bb(E) \| P F \( tau_k \) \|^q #scale(x: 120%, y: 120%)[\)]^(1 \/ q) + eta #scale(x: 120%, y: 120%)[\(] bb(E) ∥∥ F_oo^q #scale(x: 120%, y: 120%)[\)]^(1 \/ q) . $ <ref:finite-moment-tests>]

]
] <ref:dictionary>

#proof[
  Choose an intermediate annular contour separated from both squares by fixed relative collars. For any outer configuration $tau$, the induced law on this contour has a density $H_tau$ relative to the reference plane law satisfying $chevron.l H_tau chevron.r_0 = 1$ and $0 lt.eq H_tau lt.eq C$. This is the pointwise comparison used in [19] Proposition 4.1. Hence $P F \( tau \) = chevron.l F H_tau chevron.r_0$.
  Apply the outer-to-inner version of finite soft-weight replacement [19] Lemma 3.3 to $H_tau \/ C$. For any $eta_0 > 0$, it supplies finitely many positive normalized weights $U_1 \, dots.h \, U_m$ and vectors $c \( tau \) in bb(R)^m$ with $sum_i \| c_i \( tau \) \| lt.eq C$, such that, simultaneously for all $F$,
  $ lr(|P F \( tau \) - sum_(i = 1)^m c_i \( tau \) chevron.l F U_i chevron.r_0|) lt.eq C eta_0 ∥∥ F_oo . $
  Because $U_i gt.eq 0$ and $chevron.l U_i chevron.r_0 = 1$, each functional $F mapsto chevron.l F U_i chevron.r_0$ has norm at most one. Cover the finite-dimensional coefficient ball ${ c : ∥c∥_(ell^1) lt.eq C }$ by finitely many sets of $ell^1$-diameter at most $eta \/ 2$. From each occupied set choose one actual outer configuration $tau_k$. For every $tau$ in that set, the two approximation errors and the coefficient difference give
  $ \| P F \( tau \) - P F \( tau_k \) \| lt.eq \( 2 C eta_0 + eta \/ 2 \) ∥∥ F_oo . $
  Take $eta_0 lt.eq eta \/ \( 4 C \)$. The number of sets depends on the tolerance and geometry, but not on the fine mesh. Taking the supremum over $tau$ proves (2.20). Finally, Minkowski’s inequality and $max_k \| X_k \|^q lt.eq sum_k \| X_k \|^q$ prove (2.21). ◻
]

The finite tests control images of arbitrary inner functions, so their choice is independent of the disorder when $F$ is random. Later we apply them after summing all short inputs sent to one common parent contour. That sum still has its support inside a fixed inner square; this is why the buffer size in the blocking construction is chosen before the moment estimates.

== 3 An exact local change of scale <sec:blocking>

We now construct the transformation of interactions that will be iterated. Its defining identity holds for each realization of the disorder. The probability estimates needed to control its iteration enter only in Section 4. The distinction matters: a principal interaction can be large, and the construction must still preserve the normalized partition function. We integrate such interactions through positive conditional weights, while expanding only the remaining small interactions. The connected expansion used below is the list construction of [19] Section 5, Proposition 5.2, with this additional positive-weight operation; we include its algebra and counting estimates.

=== 3.1 Lists and the two kinds of support <lists-and-the-two-kinds-of-support>

Let $r_0$ and $L$ be odd positive integers and set

#[#set math.equation(numbering: n => "(3.1)")
 $ r_j = r_0 L^j \, #h(2em) r = r_j \, #h(2em) R = L r . $ <block:scales>]

Partition $bb(Z)^2$ into disjoint squares of side $r$, with centers in $r bb(Z)^2$, and denote this collection by $cal(G)_r$. These partitions are nested, and the origin is a cell center at every scale. Cells are adjacent when their closures meet, so corner adjacency is allowed. An #emph[animal] is a nonempty finite connected set of cells. Write $"par" \( c \)$ for the unique $R$-cell containing the $r$-cell $c$. Distances between cells, when expressed without units, are maximum-norm cell distances. Physical distances carry the factor $r$ or $R$ explicitly.

At scale $r$ the index set is

$ cal(I)_r = { p_c : c in cal(G)_r } dot(union) { \( A \, c \) : A subset cal(G)_r upright(" is an animal") \, med c in A } . $

The index $p_c$ is the #emph[principal slot] at $c$. It may use the cells within a fixed distance $S$ of $c$, called its halo. The slot $\( A \, c \)$ is an #emph[animal slot], with anchor $c$. Assign sizes

$ n \( p_c \) = 1 \, #h(2em) n \( A \, c \) = \| A \| . $

Thus the principal size is one even though its allowed support has a fixed halo. A list $h = \( h_i \)_(i in cal(I)_r)$ consists of real functions of finitely many spins. Its background functions are invariant under a simultaneous reversal of all spins. Terms with an identical slot index are added as functions before a norm is taken. Different list representations of the same total interaction need not coincide.

Every slot records two supports. Its #emph[spin carrier] contains the spin coordinates used by its function. Its #emph[dependence carrier] contains the microscopic edge variables and decision seeds on which that function, including its choice of representation, depends. Both carriers are contained in its animal, or in the permitted halo of a principal slot. In every geometric contact test and output-footprint rule below, we use this full indexed animal or full principal halo, even if the actual spin or random dependence is smaller. These geometric carriers therefore depend only on the slot indices. An edge variable is assigned to its incident cells; enlarging a carrier by one safety cell removes ambiguity at interfaces. Consequently sets of slots whose enlarged dependence carriers are at distance greater than two use disjoint primitive random variables and are independent. This is an assertion about the disorder probability space, not about spins in the reference Gibbs measure. Independent seeds are reserved at all cells and all future scales. A decision at a given scale reads only the seeds and edge variables in its recorded dependence carrier.

In the plane, the law of the list is invariant under translations of its grid and the symmetries of the square. Geometric choices of cutting squares are equivariant random choices using these independent seeds. For example, a rounding tie is resolved by assigning independent continuous priorities to its candidates and choosing the smallest priority. We make one realized choice before performing conditional averaging or taking a logarithm. Assigning a resulting function to an anchor is a linear operation; only for these assignments may we instead split the function equally among all tied slots. Both conventions preserve square symmetries in law.

Let $chevron.l dot.op chevron.r_0$ denote critical plane reference expectation, acting on spins only, with the disorder fixed. We use the projection

#[#set math.equation(numbering: n => "(3.2)")
 $ pi f = f - chevron.l f chevron.r_0 \, #h(2em) parallel pi f parallel_oo lt.eq 2 parallel f parallel_oo . $ <block:centering>]

All list entries are plane-centered. The removed scalar is saved separately, with its dependence carrier, and never subsequently treated as an interaction. This convention will also be applied to coefficients containing source labels. It is essential to save their scalars: only source-independent scalars cancel automatically in a normalized partition function.

For a finite set of marked sites, introduce commuting variables $zeta_1 \, dots.h \, zeta_m$ satisfying $zeta_a^2 = 0$. A #emph[source jet] is an expression

#[#set math.equation(numbering: n => "(3.3)")
 $ H \( zeta \) = sum_i h_i + sum_(diameter eq.not J subset { 1 \, dots.h \, m }) zeta_J sum_i u_i^J \, #h(2em) zeta_J = product_(a in J) zeta_a . $ <block:jet>]

A coefficient carrying $J$ must have a carrier containing the cells of all the corresponding marks. A one-mark list is anchored at its mark cell and has a marked principal slot there. For more than one mark we use animal slots and anchor at the first mark, in the prescribed order of labels. Source coefficients are not used in threshold decisions. The nilpotent variables record derivatives and products exactly; they place no positivity assumption on the source coefficients. We always use finitely many labels and source lists with finite weighted indexed norms, defined below.

=== 3.2 Indexed norms and the order of the parameters <indexed-norms-and-the-order-of-the-parameters>

The function space at a slot is the finite-dimensional space of functions of its available spins, with its sup norm. For a tensor in $k$ such spaces we use the projective norm

#[#set math.equation(numbering: n => "(3.4)")
 $ parallel F parallel_pi = inf {sum_alpha product_(b = 1)^k parallel f_(b \, alpha) parallel_oo : F = sum_alpha f_(1 \, alpha) ⊗ dots.h.c ⊗ f_(k \, alpha)} . $ <block:projective>]

The infimum is over finite tensor representations, or their norm completion. In particular, $parallel f_1 ⊗ dots.h.c ⊗ f_k parallel_pi lt.eq product_b parallel f_b parallel_oo$. A bounded multilinear operation on the component function spaces extends to this tensor product with the same operator bound. Expectations of random tensors are taken componentwise; the inequality $parallel bb(E) F parallel_pi lt.eq bb(E) parallel F parallel_pi$ then applies.

For $v > 0$ and $1 lt.eq p < oo$, define the indexed norms

#[#set math.equation(numbering: n => "(3.5)")
 $ parallel h parallel_(v \, oo) & = sup_(i in cal(I)_r) e^(v n_i) parallel h_i parallel_oo \,\
parallel h parallel_(v \, p) & = sup_(i in cal(I)_r) e^(v n_i) #scale(x: 120%, y: 120%)[\(] bb(E) parallel h_i parallel_oo^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) \,\
parallel K parallel_(v \, pi) & = sup_(i_1 \, dots.h \, i_k) e^(v \( n_(i_1) + dots.h.c + n_(i_k) \)) parallel K_(i_1 \, dots.h \, i_k) parallel_pi . $ <block:det-indexed>]

The first norm is deterministic; whenever a random essential supremum is intended it will be stated. In the tensor norm the factors retain separate spin variables, even if their carriers overlap. Diagonal evaluation and multiplication are bounded operations, but do not replace the projective norm. Source norms use their marked index sets. Rooted sums that arise when slots are combined will be bounded by the counting argument below; they are not part of the definition of these indexed suprema. An admissible source jet, at a fixed disorder realization, has finite deterministic norms $parallel u^J parallel_(v \, oo)$ at a fixed weight with counting slack, for each of its finitely many nonempty label sets. A finite-volume list also has only finitely many possible anchors. These conditions imply absolute summability, as verified in Proposition 12, and hold for the microscopic initialization and every finite iterate. On the infinite plane we require only the corresponding indexed and rooted estimates.

Here is an order of choices sufficient for all later uses. Fix the finite set of even source powers, including $2$, $4$, and $400$, and then a much larger even background power $p$. Choose a fixed contour dilation $H$ large enough for the buffered reference estimates and the finite testing statement in Section 2. Choose the principal halo $S gt.eq 10^5 H$, increasing its absolute multiplier if a larger protective neighborhood is used. Let $a_(upright("an"))$ be an exponential counting constant for rooted animals, established below. One may take a slack weight $omega > 100 a_(upright("an"))$, a tensor weight $10 omega$, and background and moment weights $w \, v$ larger than $10^6 \( p + 400 \)^4$ times that tensor weight. Only finitely many intermediate weights, all with this counting slack, will occur. They are fixed before $L$. Set $M = \( log L \)^3$ and increase the odd integer $L$ until it pays all the weight comparisons below and satisfies

#[#set math.equation(numbering: n => "(3.6)")
 $ S lt.double M \, #h(2em) 1000 M lt.double L . $ <block:M>]

Choose $delta > 0$ sufficiently small after $L$. The testing accuracy needed later can then be chosen at this fixed $L$, followed by a sufficiently large odd $r_0$. Finally the disorder strength is made small after these choices. Constants $C_L$ may depend on the fixed weights and geometric constants, but not on the scale, mesh, volume, or principal field amplitudes. The counting constants $C_L$ below can be chosen polynomial in $L$ for fixed weights.

The deterministic hypothesis on the nonprincipal background is

#[#set math.equation(numbering: n => "(3.7)")
 $ parallel h_(A \, c) parallel_oo lt.eq delta e^(- w \| A \|) . $ <block:tail-hypothesis>]

There is no such bound on principal slots. At a fixed finite-volume step they are finite real functions, with a possibly large deterministic bound. No stochastic moment hypothesis is used in this section.

=== 3.3 Positive treatment of the large principal fields <positive-treatment-of-the-large-principal-fields>

For each principal slot choose an independent threshold $theta_c$ uniformly in $\[ delta \, 2 delta \]$, independently of the input list, using a fresh seed. Declare $c$ bad when $parallel h_(p_c) parallel_oo > theta_c$. All other entries are called small entries; in particular their principal norms are at most $2 delta$. Put an edge between bad centers at physical maximum-norm distance at most $100 H R$. A component is selected if its diameter is at most $1000 M r$. The empty set has no selected component.

Selection can be decided locally. Starting at a bad center $x$, inspect all bad centers within distance $100 H R + 1000 M r$ of $x$, and the component of $x$ in this finite inspected graph. If this component contains a vertex at distance greater than $1000 M r$ from $x$, the true component is already too large. Otherwise every possible first edge leaving the inspected component has its other endpoint in the inspected ball, so there is no such edge. We have found the entire component and can test its diameter. This also rejects every infinite component using a finite certificate. The badness of each inspected center uses only its principal halo and its fresh threshold seed. Thus selection has a bounded dependence neighborhood of radius $C H R$.

For a selected component $cal(C)$, choose a lattice center near the center of its bounding box, resolving rounding symmetrically, and let $Q_(cal(C))$ be the cutting square of radius $H R$ there. Write

$ B_(cal(C)) = sum_(c in cal(C)) h_(p_c) \, #h(2em) A_(cal(C)) = P_(Q_(cal(C))) e^(B_(cal(C))) \, #h(2em) b'_(cal(C)) = log A_(cal(C)) . $

Here and throughout, $P_Q$ is conditional expectation in the critical reference measure given the spins outside the interior of $Q$, as defined in Section 2. In particular it retains the cutting spins. Our choices of $L$ ensure that all spin supports of $B_(cal(C))$ lie strictly inside $Q_(cal(C))$. Distinct selected squares have disjoint interiors and large intervening collars: their bad centers belong to distinct components and hence are separated by more than $100 H R$, whereas their diameters are $O \( M r \)$. An unselected bad insertion also has its entire spin support outside these collars. Since the integrand is positive,

#[#set math.equation(numbering: n => "(3.8)")
 $ e^(- parallel B_(cal(C)) parallel_oo) lt.eq A_(cal(C)) lt.eq e^(parallel B_(cal(C)) parallel_oo) \, #h(2em) parallel pi b'_(cal(C)) parallel_oo lt.eq 2 sum_(c in cal(C)) parallel h_(p_c) parallel_oo . $ <block:positive-log>]

Put $pi b'_(cal(C))$ in a nearest parent principal slot and save its scalar. For every unselected bad input, retain $h_(p_c)$ without averaging and add it to the principal slot at $"par" \( c \)$. A boundary modification, specified below, may also retain a selected component; its individual insertions are then treated this same way. The pure output of all bad backgrounds is therefore principal.

For any spin function $F$, the normalized tilted conditional operator is

#[#set math.equation(numbering: n => "(3.9)")
 $ P_Q^B F = frac(P_Q \( e^B F \), P_Q e^B) . $ <block:tilt>]

It is defined for every real bounded $B$, sends $1$ to $1$, and obeys $parallel P_Q^B F parallel_oo lt.eq parallel F parallel_oo$. These properties require no smallness or ferromagnetic property of $B$. The operator still uses only reference conditional probabilities. The denominator in (3.9), and its logarithm already saved above, are the normalization that will make the ensuing partition identity exact.

=== 3.4 The transformed moments and their logarithm <the-transformed-moments-and-their-logarithm>

Keep the bad configuration and its selected squares fixed. Expand the exponential of all small entries and source coefficients in ordered occurrences, with the factor $1 \/ k !$ for $k$ occurrences. An occurrence remembers its input slot and its source label set, if any. Retain only products whose source label sets are disjoint, as required by $zeta_a^2 = 0$. Repeated background indices are allowed and their occurrences remain separately labeled.

For each such list, join two occurrences when their full geometric carriers are within $1000 H R$. Call this contact graph $G$. First average the product of the occurrences jointly inside every selected square, using $P_(Q_(cal(C)))^(B_(cal(C)))$. These operators commute because their interiors are disjoint and the reference specification has the nearest-neighbor Markov property. An additional ordinary conditional average is used for an occurrence if it is a singleton component of $G$, has $n_i < L \/ 2$, and has no input bad center within $1000 H R$ of its carrier. The additional cutting square has radius $H R$ and center the center of the parent of its anchor. Its support is inside that square, and its collar is disjoint from all other occurrence supports and all bad supports. The ordinary cuts are also mutually separated. Long singletons, and short singletons near bad centers, receive only the selected-square operations already specified. This defines a transformed moment $m \( I \)$ for every finite labeled set $I$ of occurrences; set $m \( diameter \) = 1$.

For clarity, let $cal(J)$ index the small background entries and all source entries. An index $iota in cal(J)$ carries a function $f_iota$ and a label set $J_iota$, empty for a background entry. Write $m \( f_(iota_1) \, dots.h \, f_(iota_k) \)$ for the transformed moment just constructed. Thus its arguments already include the input functions. The transformed series is

#[#set math.equation(numbering: n => "(3.10)")
 $ cal(F) \( zeta \) = sum_(k gt.eq 0) frac(1, k !) sum_(iota_1 \, dots.h \, iota_k in cal(J)\
J_(iota_a) ∩ J_(iota_b) = diameter med \( a eq.not b \)) zeta_(J_(iota_1)) dots.h.c zeta_(J_(iota_k)) m \( f_(iota_1) \, dots.h \, f_(iota_k) \) \, $ <block:moment-series>]

where $zeta_diameter = 1$ and the term $k = 0$ is $1$. Its jointly degree-zero term in all occurrence amplitudes is $1$. Define its connected coefficients by the ordinary formal logarithm. More explicitly, for $k$ labeled occurrences,

#[#set math.equation(numbering: n => "(3.11)")
 $ c \( I \) = sum_(cal(P) upright(" partition of ") I) \( - 1 \)^(\| cal(P) \| - 1) \( \| cal(P) \| - 1 \) ! product_(J in cal(P)) m \( J \) . $ <block:partition-coefficient>]

The ordinary variables used to distinguish occurrences in this formula can equivalently be made square-free. The factor $1 \/ k !$ is retained when these labeled coefficients are summed over ordered background occurrences. Lemma 9 below proves convergence on the full required ball of small entries, uniformly over the fixed large fields. It consequently defines a real logarithmic interaction there, together with a finite jet in the source variables.

For $\| I \| = 1$ and $n_i < L \/ 2$, with at most one source label, assign the centered output to the principal slot at the parent anchor, also for a singleton mark. The same assignment applies when the short entry has not been averaged because of a nearby unselected bad field. All long singleton outputs, all outputs carrying more than one mark, and all outputs with at least two occurrences are put in animal slots. For these animal slots, take the union of the parent footprints of the input geometric carriers and thicken it by $10000 H$ parent cells. This union is connected whenever $c \( I \)$ can be nonzero, as proved below; otherwise its coefficient is zero. Increasing this fixed thickening if necessary includes the cutting contours and every decision neighborhood. Average the anchor over the parents of the input anchors, with multiplicity, and keep the stated first-mark anchor for marked coefficients. Center each resulting function and save its scalar with the same carrier before discarding its spin support.

At zero background all principal inputs are below threshold. The first derivative on backgrounds and one-mark lists is therefore the operator $T$ given by

#[#set math.equation(numbering: n => "(3.12)")
 $ \( i \, f \) mapsto cases(delim: "{", #scale(x: 120%, y: 120%)[\(] p_("par" \( c \)) \, pi P_(H R \, "par" \( c \)) f #scale(x: 120%, y: 120%)[\)] \, & n_i < L \/ 2 \,, upright("the same function in its parent animal slot") \, & n_i gt.eq L \/ 2 .) $ <block:linear>]

Here the first cutting square is centered at the indicated parent center. For a spin source whose scaling dimension is $d = 1 \/ 8$, the scaled one-mark linear transport is $L^d T$; with $q$ spin labels the corresponding rescaling factor is $L^(q d)$. These rescalings are a choice of coordinates on sources, after the exact unscaled identity.

#thm([Lemma 3.1.])[
  (Carriers after one step).  #emph[The construction has exact finite dependence carriers. Its principal outputs fit in a fixed halo $S$ at scale $R$. An animal output generated by input occurrences of sizes $n_1 \, dots.h \, n_k$ has size 
#[#set math.equation(numbering: n => "(3.13)")
 $ n' lt.eq sum_(a = 1)^k (C + frac(C n_a, L)) \, $ <block:compression>]

 where $C$ depends only on the fixed protective neighborhoods and not on $L$. Both the spin carrier and the dependence carrier satisfy these statements. The same bound holds for the footprint of a saved scalar.]
] <block:carrier>

#proof[
  A connected animal of $n$ fine cells has a spanning-tree traversal of length at most $2 n$ in fine-cell units. Divide this walk into consecutive pieces of length at most $L$. Each piece, together with its prescribed $O \( R \)$-thickening, lies in a bounded number of parent cells. There are at most $1 + 2 n \/ L$ pieces, proving the bound for one carrier. A principal halo has fine diameter $O \( S \)$ and, since $L$ is large compared with $S$, its parent thickening has bounded size. Taking the union proves (3.13). The $1000 H R$ contact rule makes the thickened union connected. Every cut and every tested bad center is within a fixed $H R$ distance of one of the input carriers. Their input principal halos add only $S r lt.double R$. The selection test and fresh rounding seeds are within the same neighborhood. This proves the dependence claim, not just the assertion about spin coordinates. In a pure selected bad output the whole component lies in an $O \( M r \)$ square; its cuts and tests thus fit in a fixed parent halo. An unselected bad input uses an even smaller halo. Short singleton outputs fit in a fixed parent halo for the same reason. Choosing $S$ to contain these fixed neighborhoods completes the proof. ◻
]

=== 3.5 Exactness and the connected expansion <exactness-and-the-connected-expansion>

Let $mu_0$ be a finite-volume reference measure in which all the cuts just described are legal. Let $B_(upright("ret"))$ be the sum of the retained bad insertions and set

$ B' = B_(upright("ret")) + sum_(cal(C) upright(" selected")) b'_(cal(C)) . $

The next statement includes all scalars removed from $B'$ and from $log cal(F)$.

#thm([Proposition 3.2.])[
  (Exact partition identity).  #emph[For sufficiently small $delta$ at fixed $L$, let a finite-volume real background have finitely many possible anchors, satisfy (3.7), and have finite principal norms. Every admissible source jet with finitely many labels then has a transformed centered jet $H' \( zeta \)$ and a saved scalar jet $s' \( zeta \)$ such that 
#[#set math.equation(numbering: n => "(3.14)")
 $ integral e^(H \( zeta \)) thin thin upright(d) mu_0 = e^(s' \( zeta \)) integral e^(H' \( zeta \)) thin thin upright(d) mu_0 . $ <block:partition-identity>]

 The equality is coefficientwise in the square-free variables and holds for every disorder realization and every choice of decision seeds. Consequently the normalized source partition function is 
#[#set math.equation(numbering: n => "(3.15)")
 $ frac(integral e^(H \( zeta \)) thin thin upright(d) mu_0, integral e^(H \( 0 \)) thin thin upright(d) mu_0) = e^(s' \( zeta \) - s' \( 0 \)) frac(integral e^(H' \( zeta \)) thin thin upright(d) mu_0, integral e^(H' \( 0 \)) thin thin upright(d) mu_0) . $ <block:normalized-identity>]

 All pure bad output is principal, and the linearization at zero is (3.12).]
] <block:exact>

#proof[
  Fix one product $F$ of expansion occurrences. Conditional on all selected cutting spins and all remaining exterior spins, the reference law factors over the selected interiors. The retained bad supports are outside these interiors. Therefore
  #[#set math.equation(numbering: n => "(3.16)")
   $ integral e^(B_(upright("ret")) + sum_(cal(C)) B_(cal(C))) F thin thin upright(d) mu_0 = integral e^(B') (product_(cal(C)) P_(Q_(cal(C)))^(B_(cal(C)))) F thin thin upright(d) mu_0 . $ <block:tilted-identity>]
  This is the tower property with the factors $P_Q e^B$ left outside the normalized operators. If an ordinary singleton cut is used, its interior has a collar from all other factors, including the selected normalizations and retained bad fields. Conditional averaging of its one occurrence consequently leaves the right-hand integral unchanged. The resulting integrand is precisely $e^(B') m \( I \)$. Thus each expansion term preserves its integral. Summing first for finitely many inputs and sufficiently small scalar amplitudes gives $integral e^(H \( zeta \)) thin upright(d) mu_0 = integral e^(B') cal(F) \( zeta \) thin upright(d) mu_0$. By construction $B' + log cal(F) = s' + H'$. Lemma 9 justifies this logarithm, its exponentiation, and the extension to the whole small-entry ball, including finite source jets. Absolute finite-volume summability, proved in Proposition 12, permits truncation of an infinite slot list. This proves (3.14). Its denominator at zero sources is strictly positive, so division gives (3.15). No disorder expectation was taken. ◻
]

#thm([Lemma 3.3.])[
  (Tree coefficients and weighted summability).  #emph[Fix an arbitrary real bad background and its selected squares. For $k$ small or marked occurrences with contact graph $G$, their connected coefficient before centering satisfies 
#[#set math.equation(numbering: n => "(3.17)")
 $ c \( I \) = 0 quad upright("if ") G upright(" is disconnected") \, #h(2em) parallel c \( I \) parallel_oo lt.eq 2^(k - 1) tau \( G \) product_(a = 1)^k parallel f_a parallel_oo quad upright("otherwise") \, $ <block:tree-coefficient>]

 where $tau \( G \)$ is the number of spanning trees and $tau \( G \) = 1$ for a single vertex. For any of the fixed output weights, sufficiently large $L$ allows summation of the ordered order-$k$ coefficients, with their $1 \/ k !$, at a fixed output anchor at cost $C_L^k$ times the product of the input weighted bounds. This holds also with a fixed larger output weight, before or after centering, and for a fixed finite number of marked occurrences or substitutions of input norm factors.]
  #emph[In particular the bounds can be realized by deterministic nonnegative coefficient majorants that retain every separate factor $parallel f_a parallel_oo$. If all but one of these factors are small backgrounds, summing terms of order at least two leaves a factor at most $C_L delta$ times the retained factor’s weighted input bound. This last statement also holds with a marked retained factor under the normalized bad operators. The analogous multilinear maps on indexed projective tensors have the same bounds, after the indicated allocation of weights.]
] <block:tree>

#proof[
  For any subset of labeled occurrences, its transformed moment factors as a function over the components of its induced contact graph. Indeed a selected cutting square cannot meet supports in two different components: their distance would then be at most $2 H R$ plus their halos, much smaller than the contact threshold. Each normalized operator therefore acts on only one component and sends empty factors to $1$. Ordinary singleton cuts likewise act on just that component. This proves algebraic factorization without asserting probabilistic independence of the spin functions.
  Regard each nonempty connected subset of labels as a polymer with activity its transformed moment. Two polymers are incompatible if they overlap or a contact edge joins them. The hard-core polymer partition polynomial equals the transformed moment polynomial: every induced contact graph has a unique decomposition into connected components. Its logarithmic coefficient is the sum over partitions of the labels into connected blocks, with the hard-core Mayer coefficient of the quotient contact graph. For a finite graph $Q$ that coefficient is
  $ sum_(F subset E \( Q \) : thin \( V \( Q \) \, F \) upright(" connected")) \( - 1 \)^(\| F \|) . $
  Its absolute value is at most $tau \( Q \)$. To see this directly, strictly order the edges and group each connected subgraph by its greedy minimum spanning tree. For a specified tree, an additional edge is permitted exactly when it is later than every edge on its tree path. Such edges are optional independently, so their alternating sum is zero or has absolute value one. The sum over trees gives the bound.
  For every connected block choose an internal spanning tree, and for every edge of a quotient spanning tree choose one original contact edge between the corresponding blocks. Allowing all these choices can only enlarge the bound. Their union is a spanning tree of $G$ with each edge marked internal or between blocks. Conversely these marks recover the blocks and all the chosen edges. There are at most $2^(k - 1)$ markings per spanning tree. Every polymer activity has norm at most the product of its occurrence norms, since all its conditional operators, tilted or ordinary, are sup-norm contractions. This proves (3.17), including the vanishing for disconnected $G$. Labeling occurrences has avoided any difficulty with repetitions; returning to the exponential series gives the stated $1 \/ k !$.
  We give the placement count because the indexed norms alone contain no summation. A rooted animal of $n$ cells has a depth-first traversal of a spanning tree with at most $2 n$ nearest or corner steps. Choosing a deterministic traversal for counting gives at most $8^(2 n)$ possible encodings. Choices of an anchor and of a distinguished contact cell contribute polynomial factors in $n$, hence can be included in $e^(a_(upright("an")) n)$ after enlarging $a_(upright("an"))$. If a parent occurrence has size $n_1$, a child occurrence of size $n_2$ touching its $1000 H R$ neighborhood can be placed in at most
  #[#set math.equation(numbering: n => "(3.18)")
   $ C L^2 \( 1 + n_1 \) e^(a_(upright("an")) n_2) $ <block:child-count>]
  ways. One chooses a fine cell in the parent’s neighborhood, at cost $C L^2 \( 1 + n_1 \)$, and then the child’s animal, its contact cell and anchor. Principal halos change only the constant in this estimate. A root whose parent anchor is a fixed cell costs at most $C L^2$ anchor choices and the same exponential animal count. The average assignment of anchors permits rooting at an input whose parent is the required output anchor; summing this choice costs at most $k$, harmless below. For a marked output, root instead at the occurrence containing its first mark.
  By Lemma 7, an output weight $v_(upright("out"))$ costs
  $ e^(v_(upright("out")) n') lt.eq e^(C v_(upright("out")) k) product_(a = 1)^k e^(C v_(upright("out")) n_a \/ L) . $
  Choose $L$ so that $C v_(upright("out")) \/ L$ uses only a small fixed fraction of the smallest available input weight. The remaining weight pays the animal count and leaves positive slack $b$ at each vertex. At a vertex with $q$ children, the factors $1 + n$ in (3.18) are paid by
  #[#set math.equation(numbering: n => "(3.19)")
   $ \( 1 + n \)^q e^(- b n) lt.eq q ! thin C_b^(q + 1) \, #h(2em) n gt.eq 1 . $ <block:factorial-slack>]
  For example, apply $x^q \/ q ! lt.eq e^x$ to a fixed fraction of $b n$, and absorb the replacement of $n$ by $1 + n$ in $C_b$. Thus a rooted labeled tree contributes at most $C_L^k product_a q_a !$ times the input weighted bounds. Ordering the children at every vertex introduces exactly $product_a q_a !$ orders. After division by $k !$, these objects are counted by plane rooted trees, whose number at size $k$ is at most $4^(k - 1)$. Factors $k$ and $2^(k - 1)$ are absorbed by increasing $C_L$. This proves the claimed geometric order bound. Only $L^2$ covering factors have entered, so $C_L$ is polynomial in $L$ for fixed weights.
  The argument kept the norm of every occurrence as a separate nonnegative factor. The assigned output footprint depends only on the input indices, and the anchor assignment has at most $k$ choices, with only a fixed additional multiplicity for parent rounding. We dominate these allowed assignments by their sum. Conditional kernels are bounded uniformly by one; we do not sum over badness patterns or possible cutting kernels. This gives deterministic nonnegative kernels independent of the bad amplitudes. One may therefore retain an arbitrary factor, or finitely many factors, while bounding all other good background factors by $2 delta$ on principal slots and by $delta e^(- w n)$ on animal slots. Principal input weights are fixed constant costs. A fixed number of distinguished occurrences adds only a fixed power of $k$, which a geometric series absorbs. For one retained factor the terms of order $k gt.eq 2$ carry $C_L^k delta^(k - 1)$; their sum is $O \( C_L delta \)$ after enlarging $C_L$ and taking $delta$ smaller. The same proof applies to finite rectangular arrays of input indices. Applying the multilinear bounds to each elementary tensor in (3.4), summing its products of norms, and taking the infimum proves the projective statements. For tensor outputs allocate the weights and counting slack separately to the finitely many factors. This explains why only finitely many sufficiently separated weights were fixed.
  Finally, the background connected series converges whenever $C_L delta < 1$. With finitely many square-free labels, at most that many marked occurrences can appear; the background series still converges and the resulting jet is polynomial in the bounded marked coefficients. Exponentiation of the absolutely convergent connected series recovers the transformed moment series. For finite lists this identity first follows near zero from formal power series and extends through the small-entry ball by convergence. The same estimates permit passage to absolutely summable slot lists. Projection (3.2) costs at most two, and a saved scalar costs at most the uncentered function norm, so all the bounds survive these operations. ◻
]

#thm([Corollary 3.4.])[
  (Large generating footprints).  #emph[Retain the animal footprint of a connected coefficient before projecting onto constants. For background coefficients from the small-entry expansion whose footprint has physical diameter at least $D$, the total absolute sum at a fixed output anchor is at most 
$ C_L delta e^(- c D \/ R) . $

 The same gain can be retained together with any fixed number of specified input norm factors, including marked factors. On a torus of side $N$, writing $m = N \/ R$, the total absolute sum of small-expansion scalar terms whose footprints wrap or fail to fit in a chart of fixed relative size is at most $C_L delta m^2 e^(- c m)$. Here $m$ is sufficiently large relative to the fixed halos. Pure bad scalar terms have chart footprints and do not contribute to this last sum.]
] <block:diameter>

#proof[
  A connected union of $n'$ parent cells has diameter at most $C n' R$. Run Lemma 9 with twice the required output weight, and retain one weight after the other has paid the ordinary norm. The remaining factor is at most $e^(- c D \/ R)$. Every coefficient considered contains a small entry, so its summed background bound is $C_L delta$; the sum over orders at least two is smaller. A short singleton or pure bad output has a footprint of diameter $C R$ and cannot be nonchart when $m$ is large. A nonchart connected footprint crosses a distance $c N$ in torus coordinates, or has a lift crossing that distance in the wrapping case, and therefore contains at least $c m$ parent cells. There are at most $C m^2$ anchors. The preceding estimate, applied before the scalar loses its footprint, gives the claimed total. Retained norm factors survive because the tree proof bounds every occurrence separately. ◻
]

#thm([Corollary 3.5.])[
  (Uniform smallness of the tails).  #emph[For sufficiently large $L$ and then sufficiently small $delta$, the transformed nonprincipal background satisfies $parallel h'_(A \, c) parallel_oo lt.eq delta e^(- w \| A \|)$ for every disorder realization. More precisely, with the same output weight $w$, 
#[#set math.equation(numbering: n => "(3.20)")
 $ sup_(\( A \, c \)) e^(w \| A \|) parallel h'_(A \, c) parallel_oo lt.eq C_L delta^2 + C_L e^(- c L) delta . $ <block:tail-propagation>]

]
] <block:tails>

#proof[
  Pure bad outputs are principal. Short singleton outputs are also principal, regardless of nearby bad fields. Every remaining output is therefore either of order at least two in small entries or comes from a singleton animal of size $n gt.eq L \/ 2$. The first class is bounded by $C_L delta^2$ with weight $w$ by Lemma 9. For the second, the weight allocation in (3.13) leaves a fixed positive fraction of $w n$ unused. Since $n gt.eq L \/ 2$, this gives the factor $e^(- c L)$ while retaining enough slack for the placement sum. Conditional averaging under any bad tilt cannot enlarge its sup norm. These two estimates give (3.20). Choose $L$ to make the second coefficient at most $1 \/ 2$, and then $delta$ to make $C_L delta lt.eq 1 \/ 2$. ◻
]

=== 3.6 Finite volumes and exact agreement with the plane <finite-volumes-and-exact-agreement-with-the-plane>

#thm([Proposition 3.6.])[
  (Finite-volume implementation).  #emph[The preceding transformation and partition identity apply to finite boxes with fixed or free boundary data, and to tori whose side is an integer multiple of the working scales, while the scale is sufficiently below the side length. The input finite-volume lists have finitely many possible anchors and admissible source jets. On a torus, wrapping interactions remain in torus animal slots. At every fixed number of steps the principal norms have deterministic bounds uniform in volume, disorder and decision seeds whenever the microscopic principal norms have such a bound. The total list sums are finite, with bounds that may grow with the volume. Bulk slots whose full ancestral footprints avoid the boundary agree exactly with the plane construction. Infinite-plane lists require only the indexed and rooted sums proved above; no infinite-volume partition integral is used in their definition.]
] <block:finite>

#proof[
  On a torus use torus distances and connected torus animals. Make cuts only in injective square charts of radius comparable with $H R$; the scale is required to be smaller than a fixed sufficiently small multiple of the torus side. A wrapping carrier is retained as an animal. The counting and walk-covering arguments hold in charts, and identifying possible placements can only reduce their number. In a twisted torus the local reference specification includes the twist, with a local gauge choice in each chart. Only the background deviation from that reference enters the list. Center chart terms after identifying that local reference with the plane reference. A spin gauge change conjugates the conditional operators and multiplication of functions, preserves sup norms and threshold tests, and commutes with the geometric rules. Thus, using the same decision seeds, the complete local map is gauge covariant. The saved scalars of corresponding chart terms are identical because their reference expectations agree after the gauge identification. The possible constant spin reversal between two gauges acts trivially on the even background. In particular, these scalars cancel when comparing a torus and a twisted torus on matching chart footprints. The conditional identities and positivity argument are unchanged. The possible nonchart scalar discrepancy is bounded by Corollary 10.
  For a box use an ambient grid extending past it and keep prescribed exterior spins as formal coordinates until they are evaluated. Forbid a selected or ordinary singleton cut if its rule neighborhood meets a fixed scale halo of the boundary. Retain its insertions instead; short entries keep the principal assignments already specified. When testing singleton clearance, include every retained bad insertion, including those retained because of the boundary rule. All cuts that remain lie entirely in the reference bulk, so their conditional kernels are exactly the reference kernels used above. Center using the formal plane convention before evaluating exterior spins, or use a fixed bounded projection off constants for boundary entries. No smallness of a boundary principal slot is needed. The termwise proof of (3.16) therefore applies in each finite box.
  There are only finitely many possible anchors at a fixed step in a finite system: initially they lie in a bounded ambient grid, and each step moves an anchor only to a parent or a bounded neighboring parent. For each anchor the number of animals of size $n$ is at most $e^(a_(upright("an")) n)$. Since $w > a_(upright("an"))$, the tail bound proves total absolute summability of all background animal slots. The same argument, with their fixed exponential weights and finitely many mark anchors, proves absolute summability for source jets at every fixed number of steps. Their fixed factors $L^(q d)$ do not affect this conclusion. Truncating the animal lists and passing to the limit proves the full finite-volume partition identity and justifies all finite-volume expansions used in Proposition 8.
  For completeness let $K$ bound the input principal norms at a given step. A selected component producing a fixed principal output has at most $C_L$ fine centers; only $C_L$ such centers can contribute to the same output halo. Equation (3.8) bounds its centered logarithm by $C_L K$. Retained principal inputs obey the same bound simply by summation. The convergent small-entry series adds at most a constant $C_L$. Hence
  #[#set math.equation(numbering: n => "(3.21)")
   $ K' lt.eq C_L \( 1 + K \) . $ <block:finite-principal-bound>]
  Induction gives a finite bound at each fixed step, independent of the volume. This bound need not be uniform in the number of steps and is not a stochastic smallness assertion.
  Finally, every output footprint includes the full input footprints, all cut contours, all selection and threshold neighborhoods, and the boundary-clearance tests. If these footprints avoid the boundary, the finite-volume and plane operations read exactly the same spin functions, edge variables and seeds, so they give exactly the same slot values. Iterate this statement along the ancestors of a slot. One may equivalently impose boundary clearance by a fixed multiple of each current scale; the accumulated clearances are bounded by $C sum_(a lt.eq j) r_a lt.eq C' r_j$. This proves exact bulk agreement and completes the finite-volume construction. ◻
]

The transformation thus separates two tasks. Positive conditional averaging handles arbitrarily large principal backgrounds without a loss depending exponentially on their norms. The connected expansion preserves small tails and records every source scalar and dependence carrier. We next estimate these exact lists in the disorder probability space.

== 4 Moment estimates for local random lists <sec:norms>

The exact map of Section 3 is defined for every realization of the disorder. We now estimate that map in probability. There are two different tasks. Low moments must agree, to a prescribed accuracy, with the Taylor calculation at zero background. A high moment must remain small even though individual principal fields are unbounded. The first task uses the rarity of a large field. The second also uses its geometric isolation. Keeping these tasks separate will allow the second moment tensors to control sup norms without a circular argument.

Write $X_i = ∥h_i∥_oo$, with $n_i$ the slot length, and use the weighted norms of Section 3. All randomness below includes the independent seeds reserved for local decisions. In particular, functions with disjoint enlarged dependence carriers are independent; no assertion about independence of spins is being made. Fix a finite set of even source powers $q$, containing $2 \, 4 \, 400$, and an even integer $p > 8 max q$. Increasing $p$ later in the initial choice is harmless. Weights are chosen with the slack prescribed in Section 3: even their fractions by $p$ and by the source powers exceed the animal counting exponent. Only finitely many weights occur. They are fixed before $L$, and compression of input lengths restores each of them in a single step.

Here are the background hypotheses, for $0 < s < 1$:

#[#set math.equation(numbering: n => "(4.1)")
 $ ∥h∥_(v \, p) lt.eq B s \, #h(2em) ∥h∥_(v \, 2) lt.eq B_2 s \, #h(2em) B gt.eq B_2 gt.eq 1 . $ <norm:input>]

The deterministic tail bound remains part of admissibility. Constants in $O \( dot.op \)$ may depend on $B \, B_2$, on a mixed-moment constant introduced below, and on all the fixed geometric choices. The notation $o \( s \)$ will always mean $O \( s^(1 + kappa) \)$ for some fixed $kappa > 0$, not a limit uniform in these constants.

=== 4.1 The probability and weight estimates used in Taylor expansions <the-probability-and-weight-estimates-used-in-taylor-expansions>

For a principal slot $c$, let $cal(B)_c$ be its bad event. Since its random threshold lies in $\[ delta \, 2 delta \]$,

#[#set math.equation(numbering: n => "(4.2)")
 $ bb(P) \( cal(B)_c \) lt.eq delta^(- p) bb(E) X_c^p lt.eq C \( B s \/ delta \)^p . $ <norm:badprob>]

We first record the precise way in which this supplies additional powers of $s$. If $a_1 \, dots.h \, a_k$ are nonnegative integers with $D = sum a_ell lt.eq p$, then Hölder’s inequality gives

#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) product_(ell = 1)^k X_(i_ell)^(a_ell) lt.eq \( B s \)^D exp { - v sum_ell a_ell n_(i_ell) } . $ <norm:product>]

If a bad indicator at $c$ is also present, use $upright(bold(1))_(cal(B)_c) lt.eq \( X_c \/ delta \)^(p - D)$ before applying Hölder. For $D lt.eq 4$ this gives

#[#set math.equation(numbering: n => "(4.4)")
 $ bb(E) [product_ell X_(i_ell)^(a_ell) upright(bold(1))_(cal(B)_c)] lt.eq C delta^(- \( p - D \)) \( B s \)^p exp { - v sum_ell a_ell n_(i_ell) } . $ <norm:flagproduct>]

These inequalities allow repeated indices and require no independence.

We will use Lemma 9 in the following explicit manner. At a vertex with $b$ children, reserve a length weight $e^(- a n)$ and use

$ \( 1 + n \)^b e^(- a n) lt.eq C_a^(b + 1) b ! . $

The remaining length weight pays the animal choices and the requested output weight, by Lemma 7. Ordering the children absorbs $b !$; the number of rooted ordered trees of order $k$ is at most $4^(k - 1)$. Consequently a coefficient with $k$ occurrences has summed majorant $C_L^k$ times its numerical vertex bounds. Distinguishing at most $p + 4 max q$ vertices multiplies this by a fixed power of $k$, which can be absorbed by increasing $C_L$. A bad test can be chosen in at most $C_L sum \( 1 + n_i \)$ positions, since every decision is local. The same reserved length weight pays this factor. For tensor products there are at most four output roots here; one applies this calculation to each root before multiplying. Thus all subsequent uses of Hölder are made #emph[before] sums over indices. In particular the exponential decrease in every retained index is preserved.

#thm([Proposition 4.1.])[
  (Taylor transport of background moments).  #emph[Under (4.1), the mean and the raw moment and cumulant arrays with at most four arguments are given by the ordinary zero-background Taylor rule, retaining total background degree at most four, with error $O \( s^5 \)$ in the prescribed weighted indexed projective norms. The coefficient maps are bounded uniformly in the scale. An output cumulant vanishes if its dependence carriers split into two nonempty mutually separated families.]
] <norm:taylor>

#proof[
  Expand each output slot into its pure bad part, its singleton part, and its absolutely convergent connected small-field series. The pure bad part has centered sup norm bounded by twice the sum of the norms of the bad principal inputs that generate it. Each such input carries its own bad indicator. All conditional moments in the other two parts are bounded by the product of the input sup norms, because the conditional laws, including the tilted laws, are normalized.
  First consider terms without a bad part. On the event that all local bad tests relevant to a fixed coefficient fail, that coefficient is the ordinary Taylor coefficient. The difference between the two versions is bounded by their sum of absolute majorants and a union of their local bad events. For total degree $D lt.eq 4$, (4.4) bounds each such difference by $O \( s^p \)$ with all retained index weights. The tree calculation above sums the coefficients and the possible test centers. A term containing a pure bad part is treated by expanding its finite sum of principal input norms and choosing one of its bad indicators. For products of at most four outputs the same inequality applies; each remaining factor either contributes an input norm or a convergent small-field series.
  It remains to bound degrees at least five in those series. Retain five input factors, use (4.3) on them, and bound every other good occurrence by its deterministic threshold or tail bound. The majorant is bounded by
  $ C s^5 sum_(k gt.eq 5) k^C C_L^k delta^(k - 5) = O \( s^5 \) \, $
  after decreasing $delta$. The same argument bounds a high-degree term that has already supplied a bad part: retain enough input factors to reach degree five, or use the bad indicator when fewer factors are present. There are at most four unrestricted bad-only factors, so $p > 8 max q$ supplies all required Hölder powers. This proves the raw moment assertion.
  For clarity, the projective estimate here is an estimate before any spin evaluation: a random elementary tensor has projective norm equal to the product of its factor norms, and the norm of its expectation is at most the expectation of that product. Applying the finite partition formula
  $ "cum" \( Z_1 \, dots.h \, Z_k \) = sum_(pi in cal(P) \( \[ k \] \)) \( - 1 \)^(\| pi \| - 1) \( \| pi \| - 1 \) ! ⨂_(A in pi) bb(E) ⨂_(a in A) Z_a $
  with factors put in their original argument order proves the cumulant assertion and its error bound. Finally, disjoint dependence carriers use disjoint primitive disorder variables and seeds. Their joint moment generating polynomial factors, so its logarithm has no coefficient involving both families. This is the claimed connected-index restriction. ◻
]

One related consequence, needed below, keeps the probability norm rather than taking expectation. Retaining two field factors and using Hölder in $L^2$ gives an $O \( s^2 \)$ bound for nonlinear good terms. For a modified singleton or a bad-only term use

$ ∥X_i upright(bold(1))_(cal(B)_c)∥_2 lt.eq delta^(- \( p - 2 \) \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) X_i^2 X_c^(p - 2) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C s^(p \/ 2) e^(- v n_i) . $

Together with the same tree sums, this proves

#[#set math.equation(numbering: n => "(4.5)")
 $ ∥h' - T h∥_(v \, 2) = O \( s^2 \) . $ <norm:quadratic-L2>]

This estimate concerns the error in replacing the map by its linear part. It does not yet bound the $L^2$ sup norm of that linear part by the second moment tensor; that is the role of the finite dictionary.

=== 4.2 Attenuation of an isolated positive tilt <attenuation-of-an-isolated-positive-tilt>

The estimate that handles unbounded principal fields is deterministic. It uses the reference pointwise comparison before any disorder average.

#thm([Lemma 4.2.])[
  (Positive-tilt attenuation).  #emph[Let $B$ and $F$ be even functions supported in a square of radius $w$, with a proportional empty collar, and let $P_R$ average to a surrounding square of radius $R gt.eq C w$. There is a constant $C$, independent of the real function $B$, such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ inf_(a in bb(R)) ∥frac(P_R \( e^B F \), P_R e^B) - a∥_oo & lt.eq C w / R ∥F∥_oo \,\
inf_(a in bb(R)) ∥log P_R e^B - a∥_oo & lt.eq C w / R min { 1 \, ∥B∥_oo } . $ <norm:tilted-function>]

 The centered versions satisfy the same bounds after multiplying $C$ by at most two. In particular, $B$ need not define a ferromagnetic perturbation or satisfy a smallness assumption.]
] <norm:attenuation>

#proof[
  Choose an intermediate square, of radius a fixed multiple of $w$, whose contour lies beyond the collar. Put
  $ D = frac(P_(C w) e^B, chevron.l e^B chevron.r_0) \, #h(2em) N = frac(P_(C w) \( e^B F \), chevron.l e^B chevron.r_0) . $
  Lemma 5 bounds, pointwise, the reference law of the inner spins under any contour assignment above and below by fixed multiples of its plane law. Integration against $e^B > 0$ therefore gives $c lt.eq D lt.eq C$ and $\| N \| lt.eq C ∥∥ F_oo$, uniformly in $B$. Both functions are even and $chevron.l D chevron.r_0 = 1$. The even part of Proposition 3, followed by the tower property, gives
  $ P_R D = 1 + d_R \, #h(2em) P_R N = chevron.l N chevron.r_0 + n_R \, #h(2em) ∥d_R∥_oo lt.eq C w \/ R \, quad ∥n_R∥_oo lt.eq C \( w \/ R \) ∥∥ F_oo . $
  Since $P_R D gt.eq c$, subtracting $chevron.l N chevron.r_0$ from their ratio proves (4.6). The estimate remains uniform upon replacing $B$ by $t B$, $0 lt.eq t lt.eq 1$. Integrate
  $ frac(thin upright(d), thin upright(d) t) log P_R e^(t B) = frac(P_R \( B e^(t B) \), P_R e^(t B)) $
  in the quotient by constants and apply (4.6) with $F = B$. This proves (4.6) without introducing $e^(∥∥ B)$ for the bound linear in $∥∥ B_oo$. For the bound independent of that norm, subtract $log chevron.l e^B chevron.r_0$ and use $log P_R D = log \( 1 + d_R \)$: since $P_R D gt.eq c$, its norm is at most $C ∥d_R∥_oo lt.eq C w \/ R$. Taking the smaller of the two bounds proves the stated minimum. ◻
]

Set $M = \( log L \)^3$ and enlarge $L$ until $M$ dominates all fixed halos. For every short input, meaning $n_i lt.eq M$, the geometric bad-component rule has the following consequence. Its contribution to the absolute bound for a principal output may be charged

#[#set math.equation(numbering: n => "(4.7)")
 $ C M / L X_i + C X_i sum_(c in cal(W) \( i \)) upright(bold(1))_(cal(B)_c) . $ <norm:witness-bound>]

Here $cal(W) \( i \)$ is a deterministic set of at most $C_L$ principal centers within $C L$ fine cells of the input anchor and at distance more than $C_0 M$ from it. The fixed $C_0$ may be chosen large enough that a witness carrier is disjoint from this input and from any second short input whose anchor is within $10 M$ of it.

We verify the geometric implication, including the case of a large input. If the singleton is unaffected by bad centers, apply the even reference estimate on radius $C M r$ and then the tower property. If it is affected and no witness occurs, all affecting bad centers lie in a square of radius $C M r$ about its anchor. Their contact component is selected: otherwise the first contact leaving this square supplies a bad center in the decision window, and hence a witness. The component, the singleton support, and their halos consequently lie deep inside the selected cutting square. Lemma 14 applies to their union. For a good singleton use (4.6); for the sum of the bad inputs use (4.6) and then $∥sum b∥_oo lt.eq sum ∥∥ b_oo$. If a selected square is nearby but its bad support is farther away than the inner square just described, one of those bad centers is itself a witness. On the witness event use the contraction of a normalized conditional expectation, or the bound $2 sum ∥∥ b_oo$ for a centered logarithm. This proves (4.7). Enlarging the numerical distances in the blocking convention makes $C_0$ compatible with the component cutoff; all constants remain independent of $L$. Figure 1 shows the inner collar used for attenuation and the separated dependence carriers used on the witness event.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.75), [#text(size: 9pt)[\(a\) Isolated bad component]], anchor: "south", padding: 0.1176cm)
  rect((-2.5, -2.5), (2.5, 2.5), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  rect((-1.65, -1.65), (1.65, 1.65), fill: rgb("#f2f2ff"), stroke: none)
  rect((-1.05, -0.9), (1.05, 1.2), fill: rgb("#ffffff"), stroke: none)
  rect((-1.65, -1.65), (1.65, 1.65), stroke: (paint: rgb("#00008c"), thickness: 0.65pt, miter-limit: 10))
  rect((-1.05, -0.9), (1.05, 1.2), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((0, 0.35), [#text(size: 9pt)[Bad supports#linebreak()and input $h_i$]])
  content((0, -0.57), [#text(size: 8pt)[radius $O("Mr")$]])
  content((0, -1.27), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Proportional collar]]])])
  content((0, 2.09), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Outer cut: radius $"HR"$]]])])
  content((0, -2.1), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Inner normalization square]]])])
  line((0, -1.89), (0, -1.67), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.13cm, fill: rgb("#595959"))))
  content((0, -2.9), [#text(size: 9pt)[$R="Lr", M << L$]])
  content((7.25, 2.75), [#text(size: 9pt)[\(b\) A distant bad witness]], anchor: "south", padding: 0.1176cm)
  rect((4.75, -2.5), (9.75, 2.5), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((7.25, 2.08), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Local decision window: $O("Lr")$]]])])
  rect((5.25, -0.65), (6.55, 0.65), fill: rgb("#f5f5ff"), stroke: (paint: rgb("#595959"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  circle((5.9, 0), radius: 0.05292, fill: black, stroke: none)
  content((5.9, 0.1), [#text(size: 9pt)[$c_i$]], anchor: "south", padding: 0.1176cm)
  content((5.9, -0.77), [#text(size: 9pt)[Input footprint#linebreak()$n_i lt.eq M$]], anchor: "north", padding: 0.1176cm)
  rect((8.15, -0.42), (8.99, 0.42), fill: rgb("#fff6ed"), stroke: (paint: rgb("#595959"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  circle((8.57, 0), radius: 0.0635, fill: rgb("#a65300"), stroke: none)
  content((8.68, 0), [#text(size: 9pt)[$z$]], anchor: "west", padding: 0.03528cm)
  content((8.57, -0.77), [#text(size: 9pt)[Flag footprint]], anchor: "north", padding: 0.1176cm)
  line((5.9, 1.1), (8.57, 1.1), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", length: 0.15cm, fill: rgb("#595959")), end: (symbol: ">>", length: 0.15cm, fill: rgb("#595959"))))
  content((7.235, 1.1), [#text(size: 9pt)[distance $>C_0"Mr"$]], anchor: "south", padding: 0.07056cm)
  line((5.9, 0.65), (5.9, 1.25), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((8.57, 0.42), (8.57, 1.25), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((7.25, -2.04), [#text(size: 9pt)[Independent randomness]])
  content((7.25, -2.9), [#text(size: 8pt)[Schematic; not to scale.]])
})],
  caption: [Figure 1: The two geometric mechanisms in the short-input estimate. In (a), the supports of the bad fields and the short input lie in the dotted square of radius $O \( M r \)$. The middle solid square provides a proportional collar for pointwise normalization of the positive bad weight before averaging to the selected outer cut of radius $H R$. The ratio of these radii produces the $O \( M \/ L \)$ centered attenuation. In (b), an exceptional short-input contribution has a bad-center witness $z$ farther than $C_0 M r$ from its anchor $c_i$, but within the local decision window of size $O \( L r \)$, where $C_0$ is the fixed witness-separation constant. The separated footprints include the disorder and all decision seeds, so the witness flag is independent of that input. The panels illustrate separate cases; no particular arrangement of bad fields or grid cells is prescribed. ],
) <norm:geometry>

Long singletons, $n_i > M$, have a separate small factor. Reserve an input length weight after paying the output weight. Their summed majorant is at most

#[#set math.equation(numbering: n => "(4.8)")
 $ lambda_L = C L^C e^(- c M) \, $ <norm:long>]

times the relevant input norm. The constants in the exponents depend only on the already fixed weights and powers. In particular $lambda_L$ is smaller than every inverse power of $L$ as $L arrow.r oo$. Finally, an analytic background term of order at least two is bounded by $C_L delta$ times a positive linear sum of input $X_i$: retain one factor, bound all others by their good-field bounds, and sum the trees. This observation holds in any probability measure, including a measure weighted by a source.

=== 4.3 Reproduction of the background probability norms <reproduction-of-the-background-probability-norms>

#thm([Proposition 4.3.])[
  (High moments and recovery of $L^2$).  #emph[Choose $L$ sufficiently large and then $delta$ sufficiently small. Under (4.1), 
#[#set math.equation(numbering: n => "(4.9)")
 $ ∥h'∥_(v \, p) & lt.eq B s \/ 8 + C_L^(*) B_2 s + o \( s \) \,\
∥h'∥_(v \, 2) & lt.eq C_(eta \, L) F_(*) s + epsilon_(*) B s + o \( s \) . $ <norm:high-reproduction>]

 Here $C_L^(*)$ grows at most polynomially in $L$. For the second inequality, assume that each output principal slot has diagonal second-moment bound 
#[#set math.equation(numbering: n => "(4.10)")
 $ sup_sigma bb(E) \| h'_a \( sigma \) \|^2 lt.eq e^(- 2 v) F_(*)^2 s^2 \, #h(2em) F_(*) gt.eq 1 . $ <norm:diagonal>]

 A bound on its raw second tensor implies this hypothesis. One can choose $epsilon_(*) < \[ 100 \( 1 + C_L^(*) \) \]^(- 1)$: first use the long-slot suppression, then choose the dictionary accuracy $eta$ and the mesh threshold $r_0$. These choices do not depend on $B \, B_2 \, F_(*)$.]
] <norm:reproduction>

#proof[
  For the first inequality, use the absolute decomposition just proved. The nonlinear good terms cost $C_L delta B s$, and long singleton terms cost $lambda_L B s$. A witness is independent of the short input it multiplies. Thus
  $ ∥X_i upright(bold(1))_(cal(B)_c)∥_p = ∥X_i∥_p bb(P) \( cal(B)_c \)^(1 \/ p) lt.eq C B^2 delta^(- 1) s^2 e^(- v n_i) . $
  Minkowski’s inequality and the finite witness sums give $O \( s^2 \)$ at fixed $L$. It remains to estimate the attenuated short sum.
  Expand its $p$th power. Join two of the $p$ input anchors when their distance is at most $C M$, choosing $C$ so that different components have disjoint dependence carriers. Call the connected components bunches. For a term with one bunch, choose the first anchor in at most $C L^2$ ways. A spanning tree on the $p$ labeled occurrences places each successive anchor in at most $C M^2$ ways. There are at most $p^(p - 2)$ such trees. Animal shapes and slot lengths are summed with the reserved weights. Hence the count is at most $C L^2 M^(C_p)$, and (4.3) bounds its expectation by $\( B s \)^p$. After taking the $p$th root and including attenuation, this part costs
  #[#set math.equation(numbering: n => "(4.11)")
   $ C L^(- 1 + 2 \/ p) M^(C_p) B s . $ <norm:one-bunch>]
  For two or more bunches, their random variables are independent. Suppose a bunch contains $k < p$ occurrences. Hölder within it uses only $L^k$ norms. For $2 lt.eq k < p$, interpolate by
  $ ∥X_i∥_k lt.eq ∥X_i∥_2^(theta_k) ∥X_i∥_p^(1 - theta_k) \, #h(2em) theta_k = frac(2 \( p - k \), k \( p - 2 \)) \; $
  for $k = 1$ use $∥X_i∥_1 lt.eq ∥X_i∥_2$. The product of all bunch estimates, after its $p$th root, is therefore
  $ s B^(1 - theta) B_2^theta exp { - v sum n_i \/ p } \, #h(2em) theta gt.eq 1 \/ p . $
  For the last inequality, a singleton already contributes one to $p theta$. If there are no singletons and there are $b gt.eq 2$ bunches, then $sum k theta_k = 2 p \( b - 1 \) \/ \( p - 2 \) gt.eq 1$. All placement counts are polynomial in $L$: there are at most $p$ bunch roots, each with $C L^2$ choices, followed by the preceding short-distance counts. For each of the finitely many bunch patterns, weighted Young’s inequality gives, for any fixed $epsilon > 0$,
  $ C L^C B^(1 - theta) B_2^theta lt.eq epsilon B + C_(p \, epsilon) L^(C_p) B_2 . $
  This also follows directly by maximizing the left side minus $epsilon B$ as a function of $B \/ B_2$. Since $1 \/ theta lt.eq p$, the resulting constant remains polynomial in $L$. Sum over the finitely many patterns. Increase $L$ to make (4.11) and (4.8) small; choose $epsilon$ for the multi-bunch terms; then decrease $delta$ for the nonlinear terms. Allocating less than $1 \/ 8$ in total to these coefficients of $B$ proves (4.9).
  For the second inequality, first use (4.5). The nonprincipal part of $T h$ has input length at least $L \/ 2$, and its $L^2$ norm is at most $C L^C e^(- c L) B s$. A principal output of $T h$ has the form $pi P_(H R) A$, where $A$ is the sum of the short-rule inputs anchored in its parent cell and $pi$ denotes plane centering. All these inputs are supported in one inner square, separated by a fixed proportional buffer from the $H R$ contour. The weighted placement bound and Minkowski give
  $ ∥∥∥ A_oo∥_2 lt.eq C_L B s . $
  The finite dictionary of Lemma 6 supplies $N = N \( eta \, L \)$ actual contour assignments $sigma_1 \, dots.h \, sigma_N$ such that
  $ ∥pi P_(H R) A∥_oo lt.eq max_(nu lt.eq N) \| pi P_(H R) A \( sigma_nu \) \| + C eta ∥∥ A_oo . $
  This is a deterministic inequality and thus applies to the random $A$. Replace each tested value of $T h$ by that of $h'$ using (4.5). The $L^2$ norm of the maximum of $N$ values is at most the square root of the sum of their second moments. By (4.10), after restoring the principal weight, this costs $sqrt(N) F_(*) s + O \( s^2 \)$. The net error costs $C_L eta B s$. Choose $L$ so that the exponential long-slot coefficient is smaller than the desired $epsilon_(*) \/ 2$; this is possible against the polynomial $C_L^(*)$. Then choose $eta$ with $C_L eta < epsilon_(*) \/ 2$ and increase $r_0$ to the dictionary threshold. This proves (4.9). Notice the order of the argument: (4.10) is a tensor hypothesis, supplied later by the Taylor flow, whereas the conclusion is a probability norm of a sup norm. They are not the same assertion. ◻
]

=== 4.4 Sources and mixed probability measures <sources-and-mixed-probability-measures>

Let $u$ be a scaled singleton odd source list. Put $Y_i = ∥u_i∥_oo$ and suppose, for one of the chosen even $q$, that

#[#set math.equation(numbering: n => "(4.12)")
 $ \( bb(E) Y_i^q \)^(1 \/ q) & lt.eq U e^(- v n_i) \,\
\( bb(E) Y_i^q X_m^p \)^(1 \/ p) & lt.eq U^(q \/ p) B_s s thin e^(- v q n_i \/ p - v n_m) . $ <norm:source-input>]

The subscript on $B_s$ denotes “source”: $B_s$ is a fixed constant, whereas $U$ may change from one scale to the next. No independence between $u_i$ and a nearby $h_m$ is assumed.

#thm([Proposition 4.4.])[
  (Source Taylor estimates and mixed reproduction).  #emph[Under the preceding assumptions, moments with $q$ source occurrences and at most two background arguments obey the ordinary Taylor rule through total background degree two, with error $O \( U^q s^3 \)$ in the weighted projective norms. Background arguments already present in a tensor count toward that degree. With fewer source arguments the corresponding bound follows by Hölder. Moreover, 
#[#set math.equation(numbering: n => "(4.13)")
 $ ∥u' - L^d T u∥_(v \, q) = O \( U s \) \, $ <norm:source-difference>]

 and the output satisfies 
#[#set math.equation(numbering: n => "(4.14)")
 $ sup_(a \, b) e^(v q n_a \/ p + v n_b) \( bb(E) ∥u'_a∥_oo^q ∥h'_b∥_oo^p \)^(1 \/ p) lt.eq U^(q \/ p) { B_s s \/ 8 + C_(L \, B) s + o \( s \) } . $ <norm:mixed-output>]

 The choices of $p \, L \, delta$ and the weights can be made before $B_s$ and $U$. All these estimates retain any saved scalar’s carrier until after its weighted estimate is taken.]
] <norm:source>

#proof[
  For a fixed source input define the finite measure $thin upright(d) mu_i = Y_i^q thin upright(d) bb(P)$. Its mass is at most $U^q e^(- v q n_i)$, and (4.12) bounds the $p$th moment of every $X_m$ in this measure. Consequently, for nonnegative integers $a_m$ of total $D lt.eq p$,
  #[#set math.equation(numbering: n => "(4.15)")
   $ integral product_m X_m^(a_m) thin thin upright(d) mu_i lt.eq U^q \( B_s s \)^D e^(- v q n_i - v sum_m a_m n_m) . $ <norm:weighted-holder>]
  Indeed, apply Hölder with exponents $p \/ a_m$ and $p \/ \( p - D \)$, the last factor being the mass of $mu_i$. The powers of $U$ and of the source weight sum to exactly $q$. A bad indicator supplies the unused $p - D$ powers as in (4.4).
  For $q$ possibly distinct source slots, Hölder first gives
  $ bb(E) [product_(ell = 1)^q Y_(i_ell) product_m X_m^(a_m)] lt.eq product_(ell = 1)^q (integral product_m X_m^(a_m) thin thin upright(d) mu_(i_ell))^(1 \/ q) . $
  Thus (4.15) retains decay in every source and background index. For fewer source occurrences include unweighted probability measures in this Hölder step. Apply this calculation to the tree expansion, retaining three background factors in a remainder. Additional good factors are bounded deterministically, and a changed bad decision is paid by the unused mixed moment powers. The same summable series as in Proposition 13 proves the asserted $O \( U^q s^3 \)$ bound. In $L^q$ retain one background factor and use (4.15) with degree $q$. A bad flag costs $O \( U s^(p \/ q) \)$. This proves (4.13), since $p \/ q > 1$.
  We give the high mixed estimate separately. Normalized tilted conditional moments and the deterministic good-field bounds imply a positive linear majorant
  #[#set math.equation(numbering: n => "(4.16)")
   $ Y'_a lt.eq sum_i K_(a i) Y_i \, #h(2em) K_(a i) gt.eq 0 . $ <norm:source-majorant>]
  Here the coefficients are deterministic majorants, not the realized coefficients of the map. They include the factor $L^d$. Lemma 9, with the source vertex retained, proves that their weighted row sums are bounded by $C L^d$; reserving additional input length weight makes the part with $n_i > M$ bounded by $C L^C e^(- c M)$. These statements mean row sums after paying the requested output weight from the input weight; they also hold with all the fractional weights appearing below. In particular no factor $∥log P e^B∥$ occurs in (4.16). To construct $K_(a i)$, sum the absolute tree majorants over the allowed carrier and anchor assignments, taking the prescribed enlarged union of input carriers for each output. Every realized routing is one of these boundedly many assignments. There is no sum over patterns of threshold outcomes or over the amplitudes of bad fields.
  Fix output background slot $b$ and source input $i$. Estimate $∥∥h'_b∥_oo∥_(L^p \( mu_i \))$ using the deterministic decomposition preceding Proposition 15. If $n_i > M$, crude Minkowski and (4.12) give
  #[#set math.equation(numbering: n => "(4.17)")
   $ ∥∥h'_b∥_oo∥_(L^p \( mu_i \)) lt.eq C_L U^(q \/ p) B_s s thin e^(- v q n_i \/ p - v n_b) . $ <norm:mixed-long-source>]
  There is still a reserved exponential in $n_i$ for its subsequent source sum.
  Suppose now $n_i lt.eq M$. Long background inputs and nonlinear good terms cost, respectively, $lambda_L B_s s$ and $C_L delta B_s s$, times the common factor $U^(q \/ p) e^(- v q n_i \/ p - v n_b)$. For short background inputs with anchors within $10 M$ of the source anchor, use (4.12). There are at most $C M^2$ anchors. Animal lengths and shapes cost a constant after their weight sums. The attenuated part of (4.7), estimated by Minkowski, therefore costs
  $ C M^C L^(- 1) B_s s thin U^(q \/ p) e^(- v q n_i \/ p - v n_b) . $
  For its witness part the witness carrier is disjoint from the union of the source and background input carriers. Exact independence gives
  $ #scale(x: 120%, y: 120%)[\(] bb(E) Y_i^q X_m^p upright(bold(1))_(cal(B)_c) #scale(x: 120%, y: 120%)[\)]^(1 \/ p) = #scale(x: 120%, y: 120%)[\(] bb(E) Y_i^q X_m^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) bb(P) \( cal(B)_c \)^(1 \/ p) \, $
  so this part gains an additional factor $O \( B s \/ delta \)$ and is $O \( U^(q \/ p) s^2 \)$ at fixed constants. For short background anchors farther than $10 M$, the background input is independent of $Y_i$. Drop any witness indicator and use
  $ #scale(x: 120%, y: 120%)[\(] bb(E) Y_i^q X_m^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) = \( bb(E) Y_i^q \)^(1 \/ p) \( bb(E) X_m^p \)^(1 \/ p) lt.eq U^(q \/ p) B s thin e^(- v q n_i \/ p - v n_m) . $
  Even a crude sum over these anchors has only a polynomial cost in $L$. Combining these estimates gives, for short $i$,
  #[#set math.equation(numbering: n => "(4.18)")
   $ ∥∥h'_b∥_oo∥_(L^p \( mu_i \)) lt.eq U^(q \/ p) e^(- v q n_i \/ p - v n_b) { a_L B_s s + C_L B s + o \( s \) } \, quad a_L = C M^C \/ L + lambda_L + C_L delta . $ <norm:mixed-fixed-source>]
  We now check the powers when summing sources. Put $F_i = \( bb(E) Y_i^q ∥h'_b∥_oo^p \)^(1 \/ p)$. Minkowski in $L^q$, applied to (4.16), yields
  #[#set math.equation(numbering: n => "(4.19)")
   $ \( bb(E) \( Y'_a \)^q ∥h'_b∥_oo^p \)^(1 \/ p) lt.eq (sum_i K_(a i) F_i^(p \/ q))^(q \/ p) . $ <norm:mixed-minkowski>]
  This is an $ell^(p \/ q)$ norm with weights $K_(a i)$. Apply its triangle inequality to the three terms in braces in (4.18). Raising the input source weight to $p \/ q$ gives $\( e^(- v q n_i \/ p) \)^(p \/ q) = e^(- v n_i)$, exactly the weight needed in the positive source sum. The background output weight remains $e^(- v n_b)$ after taking the power $q \/ p$. Hence the short-source coefficient of $B_s s$ is at most
  $ \( C L^d \)^(q \/ p) #scale(x: 120%, y: 120%)[\(] C M^C \/ L + lambda_L + C_L delta #scale(x: 120%, y: 120%)[\)] \, $
  whereas the far-background term is a constant $C_(L \, B) s$ independent of $B_s$. For the long-source part use (4.17) and the reserved exponential in its row sum; its coefficient is at most $C L^C e^(- c M q \/ p)$. First choose $L$ large. Since $d q \/ p < 1$ and $M$ is a power of $log L$, the first attenuation coefficient tends to zero, as do both long coefficients. Then choose $delta$ small. Their sum can be made less than $1 \/ 8$. Witness errors have an extra positive power of $s$ and remain $o \( s \)$ after (4.19), whose use of the $ell^(p \/ q)$ triangle inequality is homogeneous of degree one in $F_i$. This proves (4.14). ◻
]

The deterministic estimate (4.16) also explains why marked readout is possible in boxes whose principal background fields are large near the boundary. Before any probability estimate, the homogeneous transport of a coefficient with a fixed set of mark labels has a bounded weighted operator cost per step, with the prescribed factors $L^d$ for its marks. A freshly generated coefficient with two distinct marks has a bounded bilinear cost in the two singleton lists and retains both carriers and its saved scalar carrier; apply Lemma 9 with two source vertices. A background factor retained at a merge can then be estimated under the source-weighted measures above, even when the two sources are correlated with it. No large-field logarithm multiplies either source.

We finish by making the dependence of choices explicit. Fix the source powers, then $p$, the finite collection of weights and their counting slack, and the geometric halos. Choose $L$ for attenuation, long-slot compression and the one-bunch bound. Choose $delta$ for convergence and the small nonlinear coefficients. The polynomial $C_L^(*)$ is now fixed. Choose $epsilon_(*)$, dictionary accuracy $eta$, and $r_0$ in that order. The moment constants $B_2 \, B \, B_s$ and the tensor allowances may then be fixed, and finally $s$ made sufficiently small. In particular an allowance depending on the starting mesh does not force a new mesh choice. Because every contraction above has fixed slack, the same inequalities hold on replacing the next-scale targets $s \, U$ by $s \( 1 + O \( s^2 \) \)$ and $U \( 1 + O \( s \) \)$, respectively. The stronger variation $U \( 1 + O \( s^2 \) \)$ used after the marked cumulant comparison is therefore covered as well.

== 5 Linear transport and its distinguished coordinates <sec:linear>

The Taylor estimates of Section 4 reduce the background flow to its first four cumulant arrays. We now identify the directions which linear blocking does not contract. There is one expanding mean direction and one neutral covariance direction. A spin insertion has one neutral direction after multiplication by the scale factor $L^d$. The distinction between a covariance per unit area and a homogeneous perturbation is essential here.

=== 5.1 Coordinates and exact representatives <coordinates-and-exact-representatives>

Write $a \( i \)$ for the anchor cell of a slot $i in cal(I)_r$. The array spaces and indexed projective norms are those of Section 3: the tensor norm at fixed indices is the projective tensor norm of the function sup norms, and the array weight is $e^(v sum n_i)$. All unmarked arrays in this section are invariant under grid translations and square symmetries. A connected array is zero unless the safety adjacency graph of its dependence carriers is connected. This is the support condition satisfied by joint cumulants of the random lists. Whenever indices are summed, an unused part of the exponential weight pays the animal counts and polynomial size factors.

Let $ell$ and $ell_s$ be the charges of Lemma 2. For an even function and a scaled odd function, respectively, put

$ q_r \( F \) = r^(- 1) ell \( F \) \, #h(2em) q_(r \, s) \( U \) = r^(- d) ell_s \( U \) . $

These are bounded functionals on a slot of length $n$, with norms at most $C \( n + S \)$ and $C \( n + S \)^d$. For a homogeneous mean array $m$ and a homogeneous connected two-tensor $K$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ x_r \( m \) & = sum_(a \( i \) = c) q_r \( m_i \) \,\
g_r \( K \) & = sum_(a \( i \) = c) sum_(k in cal(I)_r) \( q_r ⊗ q_r \) \( K_(i \, k) \) . $ <lin:x>]

The values do not depend on the cell $c$. The second sum converges absolutely: connectivity puts the second anchor within $C \( n_i + n_k + S \) r$ of the first, and exponential weights dominate this number of placements. The factor $r^(- 2)$ in (5.1) divides the charge covariance by the number of microscopic sites in one cell. Thus $g_r$ is a variance density.

Let $P_(H r \, c)$ denote reference conditional averaging to the square contour with radius $H r$ about the center of $c$, followed, for even functions, by plane centering. Define arrays supported on principal slots by

#[#set math.equation(numbering: n => "(5.2)")
 $ \( v_j \)_(p_c) & = r_j^(- 1) sum_(z in c) P_(H r_j \, c) e \( z \) \, & x_(r_j) \( v_j \) & = 1 \,\
\( V_j \)_(p_c \, p_c) & = sum_(z in c) #scale(x: 120%, y: 120%)[\(] P_(H r_j \, c) e \( z \) #scale(x: 120%, y: 120%)[\)]^(⊗ 2) \, & g_(r_j) \( V_j \) & = 1 . $ <lin:v>]

All other entries of $V_j$ vanish. The charge identities follow from $ell \( e \( z \) \) = 1$ and $\| c \| = r_j^2$. The bounds $parallel P_(H r_j \, c) e \( z \) parallel lt.eq C \/ r_j$ show that both representatives have uniformly bounded indexed norms, including the projective norm of $V_j$.

Write $T_j$ for linear background transport and $T_j^(\( k \))$ for its induced transport on $k$-tensors, including the prescribed reindexing and sums. Nested contours and the tower property give the exact identities

#[#set math.equation(numbering: n => "(5.3)")
 $ T_j v_j = L v_(j + 1) \, #h(2em) T_j^(\( 2 \)) V_j = V_(j + 1) \, #h(2em) x_(r_(j + 1)) T_j = L x_(r_j) \, #h(2em) g_(r_(j + 1)) T_j^(\( 2 \)) = g_(r_j) . $ <lin:exact>]

For example, the $L^2$ child cells partition a parent cell, so transporting (5.2) yields

$ r_j^(- 1) sum_(z in c') P_(H r_(j + 1) \, c') e \( z \) . $

For (5.2), each microscopic diagonal tensor is transported to the same parent contour in both factors. No off-diagonal microscopic pair is created. These observations also explain why the two multipliers differ. The coordinate identities follow by preserving charges and dividing by $R$ or $R^2$, respectively. Reindexing long slots preserves the same total charge sums. We use the bounded projections

$ Pi_(m \, j) m = x_(r_j) \( m \) v_j \, #h(2em) Pi_(K \, j) K = g_(r_j) \( K \) V_j . $

#thm([Proposition 5.1.])[
  (Background linear splitting).  #emph[Fix the finite set of weights needed in Section 4. By taking $L$ sufficiently large, all the following contraction constants can be made smaller than any prescribed $kappa > 0$: 
$ parallel T_j m parallel lt.eq kappa parallel m parallel quad \( x_(r_j) \( m \) = 0 \) \, #h(2em) parallel T_j^(\( 2 \)) K parallel lt.eq kappa parallel K parallel quad \( g_(r_j) \( K \) = 0 \) \, $

 and $parallel T_j^(\( k \)) A parallel lt.eq kappa parallel A parallel$ for homogeneous connected arrays of orders $k = 3 \, 4$. Norms here and below have the fixed input and output weights allocated to the corresponding estimate. The bounds are uniform in $j$. The two projections above intertwine transport with multipliers $L$ and $1$.]
] <lin:background>

#proof[
  Put $M = \( log L \)^3$. If an input length exceeds $M$, the unused exponential weight gives $C L^C e^(- c M)$ after all linear placement sums. Charge projection adds only polynomial factors in the lengths. Consequently these long inputs, including the charge needed to compensate their removal, have norm at most $eta_L parallel A parallel$, where $eta_L arrow.r 0$ faster than every fixed negative power of $L$. It suffices to estimate the inputs of lengths at most $M$; constants denoted by $C M^C$ include their weighted index sums.
  For the mean, collect all short slots with anchor $c$ into one even function supported in a square of radius $C M r$. Homogeneity and square symmetry make this grouped function square symmetric about $c$. Its charge is zero, up to the discarded long-input charge. Subtract that charge using a translated copy of $v_j$ before applying the reference estimate. The square-symmetric charge-zero exponent is $3 - nu$, so one child contribution at the parent contour costs $C M^C L^(- 3 + nu)$. There are $L^2$ child anchors. Thus the short part is bounded by $C M^C L^(- 1 + nu) parallel m parallel$, plus $eta_L parallel m parallel$ for the compensation. The grouped function is formed before taking its sup norm; the triangle inequality and the weighted slot sum bound that norm by the input array norm. This is where the square symmetry of the law is used.
  For the covariance, connectivity and the short-length restriction put the two anchors within $C M r$ of one another. Separate pairs whose anchors go to different parent cells from pairs going to the same parent. In the first case, an anchor lies in a strip of width $C M r$ about the boundary of a parent cell. There are $C L M$ such fine cells per parent. Each centered factor costs at most $C M \/ L$ under averaging; after the weighted sums over slot shapes and the other anchor, this contribution is at most
  #[#set math.equation(numbering: n => "(5.4)")
   $ C M^C L^(- 1) parallel K parallel . $ <lin:strip>]
  This bound applies also to pairs inside one parent for which the first anchor lies in that strip.
  For the remaining pairs work first with one elementary projective tensor $F ⊗ G$. If $c$ is its first anchor and $z_c$ the center site of $c$, replace both factors by their charges times the same unit-charge field:
  $ F mapsto q_r \( F \) thin r P_(H r \, c) e \( z_c \) \, #h(2em) G mapsto q_r \( G \) thin r P_(H r \, c) e \( z_c \) . $
  Their supports and the original supports are contained in a square of radius $C M r$. After subtracting the charge, the even improved estimate and the tower property bound a replaced-factor error at the parent contour by $C M^C L^(- 2 + nu)$ times the original factor norm. The other factor has its usual $C M^C \/ L$ bound. Summing $L^2$ first anchors gives $C M^C L^(- 1 + nu) parallel K parallel$ for terms containing a replacement error.
  It remains to sum the term in which both factors were replaced. With the first anchor fixed, the transported elementary pair is the same for every choice of its second slot or anchor. Its scalar coefficient is therefore the corresponding sum in (5.1), and vanishes on the kernel of $g_r$. For an anchor outside the strip, every short connected second anchor goes to the same parent, so this cancellation is complete. Restriction to short inputs leaves only the discarded long-input charge, already bounded by $eta_L$. Strip anchors were estimated in (5.4). Homogeneity is needed here to make the zero coordinate condition hold at every first anchor; it is not a statement about an arbitrary nonhomogeneous covariance. Taking infima over projective decompositions proves the asserted tensor bound without any factor depending on the dimension of the function spaces.
  Finally, a connected short $k$-tuple has all its anchors within $C_k M r$ of its first anchor. The first anchor has $C L^2$ possible positions in a rooted parent cell, and each of the $k$ centered factors costs $C M \/ L$. Weighted sums bound the result by $C M^C L^(2 - k) parallel A parallel$ for $k = 3 \, 4$. Together with the long part and the preceding estimates this tends to zero. The intertwining assertions follow from (5.3). ◻
]

=== 5.2 One marked point and tensor copies <one-marked-point-and-tensor-copies>

For a fixed marked site $y$, let $c_j \( y \)$ be its cell and put

#[#set math.equation(numbering: n => "(5.5)")
 $ \( w_(j \, y) \)_(p_(c_j \( y \))) = r_j^d P_(H r_j \, c_j \( y \)) sigma_y . $ <lin:w>]

This is an odd scaled source list, with all other entries zero. Its total normalized spin charge is one. For an arbitrary marked list $u$, and for an array of $q$ marked copies whose slot indices are kept separate, set

$ Q_(j \, y) \( u \) = sum_i q_(r_j \, s) \( u_i \) \, #h(2em) Q_(j \, q \, y) \( U \) = sum_(i_1 \, dots.h \, i_q) q_(r_j \, s)^(⊗ q) \( U_(i_1 \, dots.h \, i_q) \) . $

Every marked carrier contains $y$, so these are bounded functionals in the weighted indexed spaces. Write $cal(T)_j = L^d T_j$ for scaled odd transport and $cal(T)_j^(\( q \))$ for its tensor extension. The exact identities are

$ cal(T)_j w_(j \, y) = w_(j + 1 \, y) \, #h(2em) Q_(j + 1 \, q \, y) cal(T)_j^(\( q \)) = Q_(j \, q \, y) . $

The corresponding projection is $Pi_(q \, j \, y) U = Q_(j \, q \, y) \( U \) w_(j \, y)^(⊗ q)$.

#thm([Proposition 5.2.])[
  (Marked linear splitting).  #emph[For each fixed finite set of positive integers $q$, the operators $cal(T)_j^(\( q \))$ are bounded uniformly in $j \, y \, L$. On $ker Q_(j \, q \, y)$ their norms tend to zero as $L arrow.r oo$. A connected array comprising this marked tensor as one grouped argument and at least one even background argument contracts without removal of a line. The one-source kernel estimate also holds pathwise, and hence in each of the weighted random-list $L^p$ norms used in Section 4.]
] <lin:marked>

#proof[
  For a short source slot the ordinary odd estimate gives $C \( \( n + S \) \/ L \)^d$ before source scaling. Multiplication by $L^d$ and summation with the unused exponential weight give a constant independent of $L$; one sums $\( n + S \)^d$ against that weight, rather than replacing it by $M^d$. Long slots are again bounded by $C L^C e^(- c M)$.
  For each short slot individually, subtract its normalized charge times the representative at its input scale. Both functions fit in a square of radius $C \( n + S \) r$ containing $y$. The charge-zero odd estimate, whose exponent is $1 + d - nu$, followed by source scaling, bounds the difference between the transported slot and its charged representative by $C \( n + S \)^C L^(- 1 + nu)$ times its norm. Summing over slots is legitimate by the exponential weights. Long slots admit the same subtraction with a beyond-polynomially small bound, since charge extraction has only a polynomial size cost. This gives a componentwise decomposition into a bounded rank-one map and a remainder of arbitrarily small norm.
  Apply that decomposition separately to each factor of an elementary projective $q$-tensor. The all-line term is exactly $Q_(j \, q \, y) \( U \) w_(j + 1 \, y)^(⊗ q)$. Every other term contains a small remainder and at most $q - 1$ bounded factors. The sum of its $2^q - 1$ choices is small for fixed $q$. Infimizing over decompositions proves the result in the projective norm. In particular no norm comparison involving the number of spin configurations is used.
  A connected array with an additional background factor has no $L^2$ volume sum: its root is the fixed mark. Connectivity bounds the remaining anchor sums by powers of the slot lengths. At least one even factor supplies $C M^C \/ L$, whereas the scaled marked factors stay bounded. This proves contraction in the mixed sector. All these are componentwise deterministic inequalities, so applying the center-coordinate projection to each random realization and then taking its $L^p$ norm gives the last assertion. The buffer $H$ keeps every point of a cell uniformly away from its cutting contour, making the constants independent of the position of $y$ in its cell. ◻
]

== 6 The marginal coefficients from finite insertions <sec:coefficients>

Linear transport leaves the variance density unchanged. Its first nonlinear increment, and the first increments of marked charge moments, must therefore be computed. We compute their averages over scales by comparing linear charges of logarithms with normalized charges of finite products of microscopic insertions. The latter charges are preserved by the exact partition identities. Only coefficients through degree four are used; there is no infinite-volume random power series in this argument.

=== 6.1 A bounded-degree test and its profiles <a-bounded-degree-test-and-its-profiles>

Give every microscopic site $i$ a formal variable $t_i$ and start with the factor $1 + t_i e \( i \)$. Initially its logarithm is put into the principal slot of its cell. First work with finitely many sites and retain only the degrees needed below. Apply the ordinary Taylor rules at the zero background, and then substitute

#[#set math.equation(numbering: n => "(6.1)")
 $ t_i = lambda eta_i \, #h(2em) bb(P) \( eta_i = 1 \) = bb(P) \( eta_i = - 1 \) = 1 / 2 \, $ <coef:test>]

with independent signs. Coefficient notation $\[ lambda^k \]$ means the coefficient, without a factorial. At fixed degree and fixed scale every coefficient has bounded range. A large finite window may consequently tend to the whole plane after that coefficient has been computed. Averaging over the signs gives homogeneous arrays in the norms of Section 5. For a mark at $y$ start with $r_0^d sigma_y$ and use scaled marked transport.

Let $h_j$ be the formal background list and $u_(j \, y)$ its scaled marked list. Define

$ m_j^(*) & = \[ lambda^2 \] bb(E) h_j \, & K_j^(*) & = \[ lambda^2 \] "Cov" \( h_j \, h_j \) \,\
W_j^(*) & = \[ lambda^4 \] "cum" \( h_j \, h_j \, h_j \) \, & Y_j^(*) & = \[ lambda^4 \] "cum" \( h_j \, h_j \, h_j \, h_j \) . $

For a fixed positive integer $q$ the $q$ source indices remain separate in $u_(j \, y)^(⊗ q)$, but that tensor is one grouped random argument in the joint cumulant

#[#set math.equation(numbering: n => "(6.2)")
 $ Z_(j \, q \, y)^(*) = \[ lambda^2 \] "cum" \( u_(j \, y)^(⊗ q) \, h_j \) . $ <coef:Z>]

Put

#[#set math.equation(numbering: n => "(6.3)")
 $ beta_j & = \[ lambda^4 \] g_(r_j) #scale(x: 120%, y: 120%)[\(] "Cov" \( h_j \, h_j \) #scale(x: 120%, y: 120%)[\)] \, & b_j & = beta_(j + 1) - beta_j \,\
alpha_(j \, q) \( y \) & = \[ lambda^2 \] bb(E) Q_(j \, q \, y) \( u_(j \, y)^(⊗ q) \) \, & c_(j \, q) \( y \) & = alpha_(j + 1 \, q) \( y \) - alpha_(j \, q) \( y \) . $ <coef:b>]

The definitions include any bounded initial-scale discrepancy between a microscopic list and the averaged representatives of Section 5.

#thm([Lemma 6.1.])[
  (Uniform formal profiles).  #emph[For $j gt.eq 1$, the arrays $m_j^(*) \, W_j^(*) \, Y_j^(*) \, Z_(j \, q \, y)^(*)$ have bounded indexed projective norms, uniformly in $j$ and $y$ and for every fixed finite set of $q$’s. Moreover $K_j^(*) = V_j$ and the degree-zero marked list is $w_(j \, y)$. The coefficients $b_j$ and $c_(j \, q) \( y \)$ are uniformly bounded.]
] <coef:profiles>

#proof[
  Linear insertions propagate by nested averaging. Thus the coefficient of $t_i$ at scale $r$ is $P_(H r \, c \( i \)) e \( i \)$ in the principal slot of its current cell, giving $K_j^(*) = V_j$ exactly, and the same statement for the spin gives $w_(j \, y)$. We explain separately why the mean profile stays bounded despite the expanding mean direction.
  For one microscopic variable, write $H_(i \, k)^(\( j \))$ for its $t_i^k$ coefficient in the plane-centered background log list at scale $j$. All its anchors follow the same chain of parent cells. The fixed-degree carrier estimate of Lemma 7 bounds the number of occupied slot types and their lengths by constants independent of $j$. Increasing $L$ makes these slots short for linear transport. Constants in the present formal calculation may depend on $L$ and $r_0$. We claim
  #[#set math.equation(numbering: n => "(6.4)")
   $ parallel H_(i \, 1)^(\( j \)) parallel lt.eq C r_j^(- 1) \, #h(2em) parallel H_(i \, 2)^(\( j \)) parallel lt.eq C r_j^(- 2) . $ <coef:single-columns>]
  The first bound is the reference energy estimate. At a step from radius $s$ to $L s$, every freshly generated quadratic term costs $C parallel H_(i \, 1) parallel^2$, hence at most $C_L \( L s \)^(- 2)$. To bound the transported old quadratic terms, condition on one contour outside all earlier cuts. The exact identity, with saved constants restored, represents the original factor $1 + t_i e \( i \)$. Its quadratic coefficient is zero. Its first scalar coefficient is zero because $e \( i \)$ is plane centered. Equating quadratic coefficients therefore gives, modulo constants,
  #[#set math.equation(numbering: n => "(6.5)")
   $ P H_(i \, 2) = - 1 / 2 P \( H_(i \, 1)^2 \) . $ <coef:single-cancel>]
  Here each $H$ denotes the sum of its list entries before this common outer average. The linear rule puts these old short entries in the same parent principal slot; cancellation in (6.5) thus occurs before taking its norm. The right side is bounded by $C s^(- 2)$. Combining old and fresh terms proves the second bound at the next scale. At the first scale the bound is included by the allowed constant depending on $L \, r_0$. This reasoning also covers earlier saved scalar coefficients: they are reinstated for the exact identity and disappear upon plane centering. Their footprints obey the same carrier bound.
  Only squares of individual signs contribute to $\[ lambda^2 \] bb(E) h_j$. There are at most $C r_j^2$ microscopic sites which can contribute to a fixed output anchor. Summing the second estimate in (6.4) proves the bound on $m_j^(*)$. The finitely many fixed-degree slot lengths permit the same conclusion with the indexed exponential weights.
  For completeness, the remaining profile recurrences follow by the moment–cumulant partition formula. The lowest nonzero fourth-cumulant coefficient has four linear background letters, so $Y_j^(*)$ transports homogeneously by $T_j^(\( 4 \))$. At degree four the third cumulant has, besides its homogeneous term, only a quadratic output letter and two linear output letters. Its input partitions use either $Y_j^(*)$ or two copies of $V_j$. These terms are bounded by the multilinear estimates of Proposition 13. The strict contractions of Proposition 17 therefore bound $Y_j^(*)$ and $W_j^(*)$. In (6.2), the constant marked tensor is deterministic. Its first nonzero covariance with a background uses one linear marked correction and one linear background letter. The recurrence is the contracting connected marked/background transport, with bounded forcing from the constant marked tensor and $V_j$; hence $Z_(j \, q \, y)^(*)$ is bounded by Proposition 18. The degree-two coefficient of $"cum" \( u_(j \, y)^(⊗ q) \, h_j \, h_j \)$ is zero: at that degree the marked argument is deterministic, and a joint cumulant with a deterministic argument vanishes.
  Finally, in the degree-four covariance increment the linearly transported covariance has identical $g$ coordinate. The remaining partitions use $W_j^(*) \, Y_j^(*) \, V_j ⊗ V_j$, or $m_j^(*) ⊗ V_j$, all bounded. In the degree-two marked-charge increment the transported marked tensor likewise has unchanged charge; the remaining terms use $m_j^(*) \, V_j$ and $Z_(j \, q \, y)^(*)$, while the connected two-background profile just discussed vanishes. This proves the asserted bounds on the increments. ◻
]

=== 6.2 Charges invariant under a finite sequence of cuts <charges-invariant-under-a-finite-sequence-of-cuts>

For finitely many microscopic insertions let $H_(*)^(\( j \))$ be the sum of the plane-centered log-list entries produced through scale $j$. At any fixed coefficient order this is a finite sum with its full carrier footprints. Let $f_i^(\( j \))$ be the unscaled coefficient of one square-free spin source in log-list slot $i$, and set $f^(\( j \)) = sum_i f_i^(\( j \))$. The scaled source entries are $u_(j \, i) = r_j^d f_i^(\( j \))$. In particular,

$ Q_(j \, q \, y) \( u_j^(⊗ q) \) = ell_s \( f^(\( j \)) \)^q . $

This identity connects the scalar charge calculation below to the indexed tensor coordinate in (6.3). Define formal normalized charges by

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(E)_j = frac(ell \( exp H_(*)^(\( j \)) \), chevron.l exp H_(*)^(\( j \)) chevron.r_0) \, #h(2em) cal(S)_j = frac(ell_s \( f^(\( j \)) exp H_(*)^(\( j \)) \), chevron.l exp H_(*)^(\( j \)) chevron.r_0) . $ <coef:invariants>]

Both denominators have constant term one, so their formal reciprocals are well defined. Saved background constants cancel between numerator and denominator. A saved odd scalar is zero by spin-flip symmetry.

#thm([Lemma 6.2.])[
  (Finite-insertion invariance).  #emph[Each coefficient of $cal(E)_j$ and $cal(S)_j$ in the formal variables is independent of $j$. It equals the corresponding normalized charge of the original microscopic product and, for $cal(S)_j$, its spin insertion.]
] <coef:invariance>

#proof[
  Fix the coefficient and place an outer contour beyond every cut and carrier which occurs in it. For each fixed spin assignment on that contour, apply Proposition 8 to the system inside it. The termwise conditional-expectation proof of that proposition leaves these contour spins fixed: each inner cut is an application of the tower property within this conditional reference measure. Thus the conditional partition expression, as a function of the outer spin assignment, agrees before and after every step. Its source derivative gives the analogous identity with the single odd insertion. Let $C_j$ be the saved scalar formal series, so that the restored weight is $e^(C_j) exp H_(*)^(\( j \))$. Taking the reference plane average proves that $e^(C_j) chevron.l exp H_(*)^(\( j \)) chevron.r_0$ is independent of $j$. Taking the disk-response limit defining $ell$ or $ell_s$ proves the corresponding invariance of each charge numerator multiplied by $e^(C_j)$. The saved scalar with one odd source is zero, so the marked identity has this same scalar factor. Every operation involves a finite coefficient and finitely many cuts; no interchange with a convergent infinite formal expansion is involved. Dividing cancels $e^(C_j)$ and proves the claim. ◻
]

We next quantify the difference between these invariant charges and the linear charges $ell \( H_(*)^(\( j \)) \)$ and $ell_s \( f^(\( j \)) \)$ which occur in the Taylor coordinates. In the following bounds set $r = r_j$ and $h = 1 + \| i - k \|$ for two distinct sites. For $h lt.eq C r$ we have

#[#set math.equation(numbering: n => "(6.7)")
 $ parallel \[ t_i t_k \] H_(*)^(\( j \)) parallel lt.eq frac(C, h r) . $ <coef:mixed-column>]

The norm here is the sum of the finitely many occupied slot norms, with fixed-degree weights; it also bounds their aggregate sup norm. A mixed coefficient cannot be generated before the two microscopic descendants have contacting carriers. This requires a generation radius $s gt.eq c_L h$. At radius $s$ a new quadratic coefficient costs $C_L s^(- 2)$. Subsequent linear transport along ancestor cells is nested conditional averaging and has centered-even bound $C_L s \/ r$. Anchor splitting adds only a fixed-degree number of terms, already included in the constant. Thus

$ sum_(s = r_b lt.eq r\
s gt.eq c_L h) C_L s^(- 2) s / r lt.eq C_L / r sum_(b : r_b gt.eq c_L h) r_b^(- 1) lt.eq frac(C_L, h r) . $

This also covers $h$ below the starting radius by changing the constant. The last generation has no further averaging and obeys the same bound.

For one energy site and one spin mark, put $h = 1 + \| i - y \|$. The corresponding bounds are

#[#set math.equation(numbering: n => "(6.8)")
 $ parallel \[ 1 \] f^(\( j \)) parallel lt.eq C r^(- d) \, #h(2em) parallel \[ t_i \] f^(\( j \)) parallel lt.eq C r^(- d) h^(- 1) . $ <coef:marked-columns>]

Indeed a mixed spin/energy generation at radius $s gt.eq c_L h$ costs $C_L s^(- 1 - d)$ and subsequent odd averaging costs $C_L \( s \/ r \)^d$. The geometric sum is $C_L r^(- d) sum_(b : r_b gt.eq c_L h) r_b^(- 1)$, as claimed. All supports in these comparisons fit in a square of radius $C_L r$. Charge extraction therefore costs at most $C_L r$ for even functions and $C_L r^d$ for odd functions.

=== 6.3 The covariance increment <the-covariance-increment>

#thm([Proposition 6.3.])[
  (Averages of the marginal coefficients).  #emph[The coefficients in (6.3)–(6.3) satisfy 
#[#set math.equation(numbering: n => "(6.9)")
 $ sum_(j < J) b_j & = - 4 pi a^2 log r_J + o \( log r_J \) \,\
sum_(j < J) c_(j \, q) \( y \) & = binom(q, 2) frac(pi a^2, 2) log r_J + o \( log r_J \) \, $ <coef:bsum>]

 where the second error is uniform in $y$ for each fixed $q$. Equivalently, their Cesàro means are $- 4 pi a^2 log L$ and $binom(q, 2) \( pi a^2 \/ 2 \) log L$.]
] <coef:averages>

#proof[
  We first prove (6.9). The coordinate $beta_J$ is the coefficient of degree four in the variance per unit microscopic area of $ell \( H_(*)^(\( J \)) \)$. To see this directly, restrict to a large union of cells, sum its linear charges, divide its variance by the number of microscopic sites, and let the window grow. At fixed $J$ the coefficient arrays have bounded range, so the boundary contribution vanishes. Formula (5.1) is precisely the resulting anchored covariance sum. At degree four, averaging the independent signs leaves only one-site terms and unordered two-site terms. Terms supported on disjoint noninteracting insertions cancel in the variance subtraction. The surviving pair separations are at most $C_L r_J$, by the fixed-degree carrier bound.
  Fix two sites $i eq.not k$ and abbreviate
  $ C_(i k) = chevron.l e \( i \) e \( k \) chevron.r_0 \, #h(2em) A_(i k) = ell \( e \( i \) e \( k \) \) . $
  Their invariant energy charge is exactly
  #[#set math.equation(numbering: n => "(6.10)")
   $ cal(E) = frac(t_i + t_k + A_(i k) t_i t_k, 1 + C_(i k) t_i t_k) . $ <coef:pair-rational>]
  The numerator uses $ell \( e \( i \) \) = ell \( e \( k \) \) = 1$ and $ell \( 1 \) = 0$; the denominator uses the centering of each energy. Through degree three,
  #[#set math.equation(numbering: n => "(6.11)")
   $ cal(E) = t_i + t_k + A_(i k) t_i t_k - C_(i k) \( t_i^2 t_k + t_i t_k^2 \) + O \( t^4 \) . $ <coef:pair-expansion>]
  Here $O \( t^4 \)$ denotes only discarded formal monomials of total degree at least four. Consequently the degree-four variance contribution after $t_i = lambda eta_i$, $t_k = lambda eta_k$ is
  #[#set math.equation(numbering: n => "(6.12)")
   $ A_(i k)^2 - 4 C_(i k) . $ <coef:pair-value>]
  The square of the quadratic mixed term supplies $A_(i k)^2$; its mean is zero. The two linear/cubic crosses each supply $- 2 C_(i k)$. Pure quadratic terms, if present in a different log representation, are deterministic after the sign substitution and disappear in the variance.
  We justify replacing the linear charge by this invariant charge with a bounded total error. Write $A_i = \[ t_i \] H_(*)$, $B_i = \[ t_i^2 \] H_(*)$ and $D_(i k) = \[ t_i t_k \] H_(*)$ at scale $r = r_J$. The bounds above give
  $ parallel A_i parallel lt.eq C \/ r \, quad parallel B_i parallel lt.eq C \/ r^2 \, quad parallel D_(i k) parallel lt.eq C \/ \( h r \) . $
  All columns are plane centered. In particular the denominator in (6.6) has zero first-degree term. At mixed degree two, $exp H_(*) - H_(*)$ contributes $A_i A_k$, whose energy charge is $O \( r^(- 1) \)$. Thus the linear charge has first-degree coefficients exactly one and mixed second-degree coefficient $A_(i k) + O \( r^(- 1) \)$. At $t_i^2 t_k$, the numerator corrections beyond the linear log charge are the charges of
  $ A_i D_(i k) \, #h(2em) B_i A_k \, #h(2em) 1 / 2 A_i^2 A_k . $
  The denominator correction is its quadratic coefficient multiplied by a first-degree numerator. That coefficient is bounded by $C \( r^(- 2) + \( h r \)^(- 1) \)$ (in fact the plane-centering cancellation may improve some of its terms). Multiplying the displayed sup-norm products by the charge cost $C r$ gives the same bound. Therefore the linear and invariant coefficients at $t_i^2 t_k$ and $t_i t_k^2$ differ by
  #[#set math.equation(numbering: n => "(6.13)")
   $ O #scale(x: 120%, y: 120%)[\(] r^(- 2) + \( h r \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <coef:cubic-error>]
  Since $\| A_(i k) \| lt.eq C \/ h$ by Lemma 4, squaring the second-degree coefficient adds at most $C \( \( h r \)^(- 1) + r^(- 2) \)$. The first-degree/cubic crosses obey the same bound. This proves that the pair contribution differs from (6.12) by at most $C \( \( h r \)^(- 1) + r^(- 2) \)$.
  For a single site the invariant charge is exactly $t_i$. The pure cubic charge discrepancy consists of the products $A_i B_i$, $A_i^3 \/ 6$, and the quadratic denominator term times the linear numerator, and is $O \( r^(- 2) \)$. Hence its degree-four variance contribution is $O \( r^(- 2) \)$ per site. No bound on the third log column itself is being assumed: its linear charge is determined by the invariant identity and these lower-column corrections.
  The pair errors have a bounded sum per unit area, since in two dimensions
  #[#set math.equation(numbering: n => "(6.14)")
   $ sum_(1 lt.eq \| z \| lt.eq C_L r) (frac(1, r \( 1 + \| z \| \)) + 1 / r^2) lt.eq C_L . $ <coef:error-sum>]
  Indeed the shell $n lt.eq \| z \| < n + 1$ has at most $C \( n + 1 \)$ lattice points; the first summand contributes $C \/ r$ per shell and the second has at most $C r^2$ terms. The one-site contribution is bounded as well. One may use the disk $\| z \| lt.eq C_L r$ for the pair sum: any noninteracting pair in this range has zero linear variance contribution and satisfies the same comparison, and beyond this range the linear coefficient is zero. Thus
  #[#set math.equation(numbering: n => "(6.15)")
   $ beta_J = 1 / 2 sum_(0 < \| z \| lt.eq C_L r_J) {ell \( e \( z \) e \( 0 \) \)^2 - 4 chevron.l e \( z \) e \( 0 \) chevron.r_0} + O \( 1 \) . $ <coef:beta-lattice>]
  The half accounts for unordered pairs. If the fixed-scale list is only grid-translation invariant, the intermediate expression averages its linear pair contribution over the first site’s residue class in a grid cell; the invariant expression is fully translation invariant and the uniform error bound gives exactly (6.15).
  Lemma 4 gives, uniformly in direction, $chevron.l e \( z \) e \( 0 \) chevron.r_0 = a^2 \| z \|^(- 2) + o \( \| z \|^(- 2) \)$ and $ell \( e \( z \) e \( 0 \) \)^2 = o \( \| z \|^(- 2) \)$. The lattice sum satisfies
  $ sum_(0 < \| z \| lt.eq R) \| z \|^(- 2) = 2 pi log R + O \( 1 \) . $
  For example compare each unit lattice square away from the origin with its radial integral; the gradient error is $O \( \| z \|^(- 3) \)$, which is summable outside any fixed disk. For an $o \( \| z \|^(- 2) \)$ remainder, split at a fixed large radius, make its coefficient arbitrarily small beyond that radius, and use the same logarithmic bound. Its sum is consequently $o \( log R \)$. Applying these facts in (6.15) yields $beta_J = - 4 pi a^2 log r_J + o \( log r_J \)$. Telescoping (6.3) subtracts only the bounded initial coefficient $beta_0$, proving (6.9).
  === The marked increment <the-marked-increment>
  For one energy site $i$ and mark $y$, the invariant normalized spin charge is exactly
  #[#set math.equation(numbering: n => "(6.16)")
   $ cal(S) = 1 + t_i S_i \( y \) \, #h(2em) S_i \( y \) = ell_s \( sigma_y e \( i \) \) . $ <coef:spin-invariant>]
  The denominator is one because the energy is centered. Write $F_0 = \[ 1 \] f$, $F_1 = \[ t_i \] f$, and retain the background columns $A_i \, B_i$ above. At first degree the difference between $ell_s \( f \)$ and $cal(S)$ is $ell_s \( F_0 A_i \)$, which is $O \( r^(- 1) \)$ by (6.8). At second degree the numerator corrections are the charges of
  $ F_1 A_i \, #h(2em) F_0 B_i \, #h(2em) 1 / 2 F_0 A_i^2 . $
  Their sup norms, multiplied by the odd charge cost $C r^d$, are bounded by $C \( \( h r \)^(- 1) + r^(- 2) \)$. The denominator correction has the same bound. It follows that the linear marked charge is
  $ 1 + t_i { S_i \( y \) + O \( r^(- 1) \) } + t_i^2 O #scale(x: 120%, y: 120%)[\(] \( h r \)^(- 1) + r^(- 2) #scale(x: 120%, y: 120%)[\)] + O \( t_i^3 \) . $
  Its $q$th power has degree-two coefficient
  #[#set math.equation(numbering: n => "(6.17)")
   $ binom(q, 2) S_i \( y \)^2 + O_q #scale(x: 120%, y: 120%)[\(] \( h r \)^(- 1) + r^(- 2) #scale(x: 120%, y: 120%)[\)] \, $ <coef:spin-pair-error>]
  since $\| S_i \( y \) \| lt.eq C \/ h$. Sign averaging eliminates distinct-site quadratic monomials, so only this one-site calculation is needed. The marked coefficient has range at most $C_L r$; sum (6.17) over those sites and use (6.14). Uniformly in $y$,
  #[#set math.equation(numbering: n => "(6.18)")
   $ alpha_(J \, q) \( y \) = binom(q, 2) sum_(\| i - y \| lt.eq C_L r_J) ell_s \( sigma_y e \( i \) \)^2 + O_q \( 1 \) . $ <coef:alpha-lattice>]
  The finitely many coincident or adjacent sites contribute only a bounded amount. The uniform OPE asymptotic $ell_s \( sigma_y e \( i \) \)^2 tilde.op a^2 \/ \( 4 \| i - y \|^2 \)$ and the preceding lattice summation give (6.9) after subtracting $alpha_(0 \, q) \( y \)$. Finally $log r_J = J log L + log r_0$ gives both Cesàro assertions. ◻
]

#thm([Corollary 6.4.])[
  (Bounded first-charge sums).  #emph[There is a constant independent of $J$ and $y$ such that 
$ lr(|sum_(j < J) c_(j \, 1) \( y \)|) lt.eq C . $

]
] <coef:bounded-first>

#proof[
  For $q = 1$ the invariant coefficient of $t_i^2$ in (6.16) is exactly zero, rather than merely smaller than its logarithmic scale. Thus (6.18) gives $\| alpha_(J \, 1) \( y \) \| lt.eq C$. The initial coefficient is uniformly bounded, and (6.3) telescopes. This stronger conclusion will control the first marked moment; a zero Cesàro mean alone would not suffice. ◻
]

== 7 The tuned background flow <sec:flow>

The linear estimates leave one expanding mean coordinate and one neutral covariance coordinate. We now choose the initial temperature to keep the first coordinate small and use the averaged coefficient from Proposition 21 to control the second. The construction uses estimates on finite intervals of scales; it does not assume that an infinite bounded trajectory already exists.

Write $m_j \, K_j \, W_j \, Y_j$ for the first four disorder cumulants of the background list at scale $j$. All tensor norms in this section are the indexed projective norms of Section 3. The initial bond functions are placed in principal slots, with a crossing bond divided symmetrically between its incident cells. Their centered random parts are independent symmetric two-point variables. Consequently, uniformly for $t = O \( D^2 \)$,

#[#set math.equation(numbering: n => "(7.1)")
 $ g_0 = macron(g) \( 1 + O \( D \) \) \, #h(2em) macron(g) = gamma D^2 \, #h(2em) K_0 = O \( macron(g) \) \, quad W_0 = 0 \, quad Y_0 = O \( macron(g)^2 \) \, $ <flow:initial>]

where $gamma > 0$. Positivity follows from the nonzero energy charge of a bond and the nonzero derivative of its coupling with respect to $D$. The initial mean is $O \( \| t \| + D^2 \)$, and $x_0 = x \( m_0 \)$ has nonzero derivative with respect to $t$ at $\( t \, D \) = \( 0 \, 0 \)$. Thus $x_0$ itself can be used as the shooting parameter on any fixed interval of size $O \( D^2 \)$.

Put

#[#set math.equation(numbering: n => "(7.2)")
 $ B_0 = 4 pi a^2 log L \, #h(2em) G_j = frac(macron(g), 1 + B_0 j macron(g)) \, #h(2em) s_j = G_j^(1 \/ 2) . $ <flow:comparison-sequence>]

In particular $G_(j + 1) \/ G_j = \( 1 + B_0 G_j \)^(- 1)$ tends uniformly to one as $D$ tends to zero. A trajectory is #emph[kept through scale $N$] if $\| x_j \| lt.eq X G_j$ for $0 lt.eq j lt.eq N$, where $X$ will be fixed below. An estimate for its tested next step concerns the actual output at $N + 1$ without requiring that output to satisfy the thermal bound.

#thm([Proposition 7.1.])[
  (Finite-prefix estimates).  #emph[There are fixed constants $X \, C$ and $rho < 1$ such that, for sufficiently small $D > 0$, every trajectory kept through scale $N$ satisfies the background tail and moment bounds of Section 4 with $s = s_j$, and 
#[#set math.equation(numbering: n => "(7.3)")
 $ ∥m_j∥ + ∥K_j∥ lt.eq C G_j \, #h(2em) ∥W_j∥ + ∥Y_j∥ lt.eq C G_j^2 \, #h(2em) 1 / 2 G_j < g_j < 2 G_j . $ <flow:rough>]

 The tensor and moment bounds also hold for the tested next step, with a larger fixed constant for its mean. Moreover, for $1 lt.eq j lt.eq N$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ K_j - g_j V_j & = O #scale(x: 120%, y: 120%)[\(] G_j \( G_j + rho^j \) #scale(x: 120%, y: 120%)[\)] \,\
m_j - g_j m_j^(*) & = O #scale(x: 120%, y: 120%)[\(] G_j \( G_j + rho^j + rho^(N - j) \) #scale(x: 120%, y: 120%)[\)] \,\
W_j - g_j^2 W_j^(*) \, quad Y_j - g_j^2 Y_j^(*) & = O #scale(x: 120%, y: 120%)[\(] G_j^2 \( s_j + rho^j + rho^(N - j) \) #scale(x: 120%, y: 120%)[\)] . $ <flow:cov-profile>]

 Here $V_j \, m_j^(*) \, W_j^(*) \, Y_j^(*)$ are the bounded formal profiles of Section 6. For $0 lt.eq j lt.eq N$, including the tested next covariance, 
#[#set math.equation(numbering: n => "(7.5)")
 $ g_(j + 1) = g_j + b_j g_j^2 + O #scale(x: 120%, y: 120%)[\(] G_j^2 \( s_j + rho^j + rho^(N - j) \) #scale(x: 120%, y: 120%)[\)] . $ <flow:variance-recursion>]

 The constants are independent of $N$ and of the kept trajectory.]
] <flow:prefix>

#proof[
  We first derive the estimates under the corresponding bounds on an input prefix, and then choose the constants so that the estimates reproduce those bounds. This separation is useful because no sign condition is available for an individual $b_j$.
  The finite Taylor rule in Proposition 13 determines the cumulant recursion with remainder $O \( G_j^(5 \/ 2) \)$. The required algebra can be described explicitly. Assign a separate letter to every factor in a Taylor monomial, even when two letters have the same slot index. If $I_1 \, dots.h \, I_k$ are the groups belonging to the $k$ output factors, the cumulant of their products is
  #[#set math.equation(numbering: n => "(7.6)")
   $ "cum" (product_(a in I_1) h_a \, dots.h \, product_(a in I_k) h_a) = sum_(pi : thin pi or { I_1 \, dots.h \, I_k } = upright(bold(1))) med product_(B in pi) "cum" \( h_a : a in B \) . $ <flow:connected-partitions>]
  The join condition says precisely that the partition connects the output groups. Formula (7.6) follows by expanding moments into cumulants and applying the defining alternating sum for the output cumulant. The coefficient of a partition not connecting the groups is zero. It therefore applies also to correlated input slots.
  A singleton block costs $m = O \( G \)$, a pair costs $K = O \( G \)$, and blocks of sizes three and four cost $W \, Y = O \( G^2 \)$, where $G = G_j$. For covariance the nonlinear degree patterns with at most four letters are $\( 1 \, 2 \) \, \( 2 \, 1 \) \, \( 1 \, 3 \) \, \( 2 \, 2 \) \, \( 3 \, 1 \)$. The three-letter patterns retain $W$ and the connecting $m K$ partitions; the four-letter patterns retain $Y$ and the connecting $K K$ partitions. For the third cumulant the only further pattern has four letters and retains $Y$ and $K K$. For the fourth cumulant there is only homogeneous linear transport to the stated accuracy. The mean retains its linear term and the quadratic Taylor coefficient applied to $K$; its other terms have size $O \( G^2 \)$. In particular the recursions have the form
  #[#set math.equation(numbering: n => "(7.7)")
   $ m_(j + 1) & = T_j m_j + Q_j \( K_j \) + O \( G_j^2 \) \,\
K_(j + 1) & = T_j^(\( 2 \)) K_j + cal(B)_j \( W_j \, Y_j \, K_j ⊗ K_j \, m_j ⊗ K_j \) + O \( G_j^(5 \/ 2) \) \,\
W_(j + 1) & = T_j^(\( 3 \)) W_j + cal(F)_j \( Y_j \, K_j ⊗ K_j \) + O \( G_j^(5 \/ 2) \) \,\
Y_(j + 1) & = T_j^(\( 4 \)) Y_j + O \( G_j^(5 \/ 2) \) . $ <flow:mean-recursion>]
  Here $Q_j$ is the quadratic Taylor coefficient contracted against a covariance; $cal(B)_j$ and $cal(F)_j$ denote the sums of exactly the connected partitions just listed, including their Taylor coefficients. They are bounded linear maps on the displayed direct sums of tensor spaces. The indexed estimates in Proposition 13 justify all slot sums.
  The charge of linear covariance transport is unchanged by Proposition 17. Equations (7.3) and (7.7) therefore first give the coarse estimate $g_(j + 1) - g_j = O \( G_j^2 \)$. On the kernel of that charge the linear operator contracts. Subtracting $g_(j + 1) V_(j + 1)$, and using the exact transport of $V_j$, gives (7.4) by convolution with this contraction. For clarity, every such convolution uses the elementary estimate
  #[#set math.equation(numbering: n => "(7.8)")
   $ sum_(i < j) kappa^(j - 1 - i) G_i^alpha lt.eq C_alpha G_j^alpha \, #h(2em) kappa^j G_0^alpha lt.eq C_alpha rho^j G_j^alpha \, $ <flow:convolution>]
  for the finitely many positive exponents $alpha$ used here, where $kappa < rho < 1$. To verify it, use $G_i \/ G_j lt.eq \( 1 + B_0 macron(g) \)^(j - i)$ and decrease $D$ so that $kappa \( 1 + B_0 macron(g) \)^alpha < rho$.
  Subtract next the recursion for $g_j m_j^(*)$ from (7.7). The stable mean component is controlled forward by (7.8). Its forcing is $O \( G_j^2 + G_j rho^j \)$. The thermal component is controlled backward: if its error is $z_j$, then
  $ z_j = L^(- 1) z_(j + 1) + O \( G_j^2 + G_j rho^j \) \, #h(2em) \| z_N \| lt.eq C G_N . $
  Summing this equality from $N$ backwards gives $\| z_j \| lt.eq C G_j \( G_j + rho^j + rho^(N - j) \)$, after enlarging $rho < 1$. This proves (7.4). The fourth and third cumulant recursions, in that order, have contracting homogeneous operators. Subtract their formal-profile recursions, use $g_(j + 1)^2 - g_j^2 = O \( G_j^3 \)$, and apply (7.8). The resulting errors are those in (7.4). An unmatched initial profile contributes only the geometric term. All comparisons at scale zero can likewise be paid by that term.
  The definition of $b_j$ is the charge of the nonlinear term in (7.7) evaluated on the formal profiles. Inserting (7.4)–(7.4) therefore gives (7.5). The terminal term in that formula is the cost of using only a finite thermal prefix.
  We now show why this refined estimate reproduces the asserted covariance range. The coarse one-step bound first makes the tested $g_(N + 1)$ positive and comparable to $G_(N + 1)$, so reciprocals are legitimate. Taking reciprocals in (7.5) and summing gives, for $1 lt.eq k lt.eq N + 1$,
  #[#set math.equation(numbering: n => "(7.9)")
   $ 1 / g_k = 1 / g_0 - sum_(j < k) b_j + O (1 + sum_(j < k) s_j) . $ <flow:reciprocal>]
  Indeed $g_j \/ G_j$ is comparable to one on the input prefix, the two geometric errors have bounded sums, and the reciprocal Taylor remainder is $O \( G_j \)$, bounded by $O \( s_j \)$. Proposition 21 says that $R_k = sum_(j < k) \( b_j + B_0 \) = o \( k \)$. Thus for each $eta > 0$ there is $C_eta < oo$ such that $\| R_k \| lt.eq eta k + C_eta$ for every $k$. Since $s_j lt.eq sqrt(macron(g))$,
  #[#set math.equation(numbering: n => "(7.10)")
   $ sup_(1 lt.eq k lt.eq N + 1) frac(lr(|g_k^(- 1) - \( macron(g)^(- 1) + B_0 k \)|), macron(g)^(- 1) + B_0 k) lt.eq C D + C sqrt(macron(g)) + C eta + C_eta macron(g) . $ <flow:relative-reciprocal>]
  First choosing $eta$ small and then $D$ small makes this strictly smaller than the amount allowed by $G_k \/ 2 < g_k < 2 G_k$. It also proves that
  #[#set math.equation(numbering: n => "(7.11)")
   $ sup_(k lt.eq N + 1) \| g_k \/ G_k - 1 \| arrow.r 0 quad \( D arrow.b 0 \) \, $ <flow:uniform-ratio>]
  uniformly over all kept prefixes. Only the averaged coefficient was used; individual coefficients may have either sign.
  It remains to fix the constants in the bounds used above. First choose the covariance-kernel allowance larger than its initial and line contributions. Contraction reproduces this allowance, with its nonlinear $O \( G^2 \)$ loss left for the final smallness choice. Choose $X$ so large that, under this covariance bound,
  #[#set math.equation(numbering: n => "(7.12)")
   $ x_(j + 1) = L x_j + f_j \, #h(2em) \| f_j \| lt.eq C G_j \, #h(2em) \( L - 1 \) X > C + 1 . $ <flow:outward>]
  Choose the remaining mean allowance from this tube, the initial mean, and stable contraction. Next choose the fourth-cumulant allowance and then the third-cumulant allowance, using (7.7) and (7.7). These choices furnish a fixed bound $F_(*)$ on the actual next principal raw second tensor. Indeed, at each principal slot $i$,
  $ ∥bb(E) \[ h'_i ⊗ h'_i \]∥ = ∥K'_(i \, i) + m'_i ⊗ m'_i∥ lt.eq C G_j + C G_j^2 lt.eq e^(- 2 v) F_(*)^2 G_j \, $
  after enlarging $F_(*)$ by the fixed factor $e^v$ if necessary. This is precisely the tensor input required by the moment reproduction estimate; no output probability norm has been assumed to obtain it.
  For the moment bounds in Proposition 15, choose $B_2$ larger than the fixed multiple of $F_(*)$ and the initial second moment bound, and $B$ larger than the initial high-moment bound and $C_L^(*) B_2$, with strict room in both inequalities. The dictionary error was chosen to have $epsilon_(*) C_L^(*)$ sufficiently small, so these choices can also satisfy $epsilon_(*) B lt.double B_2$. Finally decrease $D$ to pay all nonlinear remainders, the variation of $G_j$, and all fixed constants in the profile comparisons. The tail bound is reproduced by the exact map. This order closes the input-prefix induction and its tested next step. In particular, the covariance improvement uses only the previously kept prefix, not an as yet unproved next thermal bound. ◻
]

#thm([Proposition 7.2.])[
  (Existence of a tuned trajectory).  #emph[For every sufficiently small $D > 0$ there is $t_(*) \( D \) = O \( D^2 \)$ whose background trajectory satisfies $\| x_j \| lt.eq X G_j$ at every scale. All the bounds of Proposition 23 hold along this trajectory. In the profile estimates its terminal geometric term may be omitted.]
] <flow:tuned>

#proof[
  At every fixed scale the expected list coordinates are continuous in $x_0$. Indeed the map has finite random footprints; each fresh threshold has a continuous distribution, so equality with that threshold has probability zero. Almost-sure continuity away from those equalities, together with the finite-step moment bounds and summable coefficient bounds, gives dominated convergence. This applies uniformly on each compact parameter interval used below.
  Choose the initial interval $I_0$ so that its endpoints have $x_0 = - X G_0$ and $x_0 = X G_0$. Suppose $I_j$ is a closed interval all of whose parameters are kept through $j$, and whose endpoints have $x_j = - X G_j$ and $x_j = X G_j$. By (7.12), their next coordinates lie strictly below $- X G_(j + 1)$ and above $X G_(j + 1)$, respectively. Continuity supplies a subinterval $I_(j + 1) subset I_j$ on which $\| x_(j + 1) \| lt.eq X G_(j + 1)$ and whose endpoints attain both bounds. For an explicit choice, take the first hitting of the upper bound and the last preceding hitting of the lower bound. Between those points neither bound can be crossed. The nested nonempty compact intervals have a common parameter, giving the asserted trajectory. Finally, apply the finite-prefix profile bounds to arbitrarily long prefixes of this trajectory, with $j$ fixed, and let $N$ tend to infinity. ◻
]

#thm([Corollary 7.3.])[
  (Decay of the disorder coordinate).  #emph[Along every tuned trajectory obtained above, 
#[#set math.equation(numbering: n => "(7.13)")
 $ g_j tilde.op frac(1, B_0 j) quad \( j arrow.r oo \) \, #h(2em) sum_(j gt.eq 0) \| g_(j + 1) - g_j \| lt.eq C macron(g) . $ <flow:variance-asymptotic>]

 The uniform comparison (7.11) also holds over all $j gt.eq 0$ as $D arrow.b 0$.]
] <flow:variance>

#proof[
  In (7.9), $R_j = o \( j \)$ and $sum_(i < j) s_i = o \( j \)$ for each fixed $D > 0$, because $s_i arrow.r 0$. Thus $g_j^(- 1) = B_0 j + o \( j \)$. The coarse increment estimate and $sum_j G_j^2 lt.eq C macron(g)$ give the total-variation bound. ◻
]

== 8 Transport of a spin insertion <sec:marked>

Fix a tuned background from Proposition 24. A singleton spin insertion at $y$ is transported by the exact marked map, with the factor $L^d$ included at every step. Denote its scaled random list by $u_j = u_(j \, y)$, and set

#[#set math.equation(numbering: n => "(8.1)")
 $ alpha_j = 1 / r_j^d sum_i ell_s \( u_(j \, i) \) \, #h(2em) A_(j \, q) = bb(E) alpha_j^q . $ <mark:charge>]

The initial insertion is $r_0^d sigma_y$, so $alpha_0 = 1$. The deterministic representative $w_(j \, y)$ from Proposition 18 has normalized spin charge one. All estimates below are uniform in $y$, including its position within a grid cell. Let $cal(Q)$ be the finite set of even source powers fixed in Section 4, containing $2 \, 4 \, 400$. It was chosen before the background moment exponent $p$ and the blocking ratio $L$. We prove the moment asymptotics for every $q in cal(Q)$.

=== 8.1 Control of the random marked list <control-of-the-random-marked-list>

For a random marked list, write $∥u∥_(v \, q)$ for its weighted individual-slot $L^q$ norm, with the weights of Proposition 16. The source-background bound is the mixed bound there; its exponent $p$ is fixed sufficiently large relative to $q$. The following statement supplies both that bound and the small component perpendicular to spin charge.

#thm([Proposition 8.1.])[
  #emph[For each $q in cal(Q)$ and sufficiently small $D > 0$, $A_(j \, q) > 0$ and there are fixed constants $C_(*) \, B_s \, C$ such that, at every scale, 
#[#set math.equation(numbering: n => "(8.2)")
 $ ∥u_j∥_(v \, q) & lt.eq C_(*) A_(j \, q)^(1 \/ q) \,\
#scale(x: 120%, y: 120%)[\(] bb(E) ∥u_(j \, i)∥^q ∥h_(j \, m)∥^p #scale(x: 120%, y: 120%)[\)]^(1 \/ p) & lt.eq \( C_(*) A_(j \, q)^(1 \/ q) \)^(q \/ p) B_s s_j e^(- v q n_i \/ p - v n_m) . $ <mark:lq>]

 For $j gt.eq 1$ one has the stronger estimate 
#[#set math.equation(numbering: n => "(8.3)")
 $ ∥u_j - alpha_j w_(j \, y)∥_(v \, q) lt.eq C A_(j \, q)^(1 \/ q) s_j . $ <mark:kernel-small>]

 The notation $alpha_j w_(j \, y)$ places the representative in its marked principal slot. The allowed disorder can be chosen uniformly for the fixed finite collection $cal(Q)$.]
] <mark:kernel>

#proof[
  Put $a_j = A_(j \, q)^(1 \/ q) = ∥alpha_j∥_(L^q)$ and $k_j = ∥u_j - alpha_j w_(j \, y)∥_(v \, q)$. The source-line projection is bounded in the weighted norm. Its complement contracts under the scaled linear transport, and Proposition 16 bounds the nonlinear difference by $C U s_j$ when $U = C_(*) a_j$. Since linear transport preserves normalized spin charge,
  #[#set math.equation(numbering: n => "(8.4)")
   $ \| a_(j + 1) - a_j \| lt.eq C C_(*) a_j s_j \, #h(2em) k_(j + 1) lt.eq kappa k_j + C C_(*) a_j s_j \, $ <mark:rough-charge>]
  where the first inequality is the reverse triangle inequality in $L^q$. In particular $a_(j + 1) > 0$ and $a_(j + 1) \/ a_j = 1 + O \( s_j \)$ once disorder is small. This proves positivity before any normalization by the next moment is used.
  To close (8.2), reserve a fixed part of $C_(*) a_j$ for the line and the rest for the kernel. Choose $C_(*)$ large enough for the bounded line norm and the initial list. The strict contraction in the second inequality of (8.4) then reproduces the kernel allowance relative to $a_(j + 1)$, after decreasing $D$. The mixed output estimate in Proposition 16 is
  $ U^(q \/ p) #scale(x: 120%, y: 120%)[\(] B_s s_j \/ 8 + C_(L \, B) s_j + o \( s_j \) #scale(x: 120%, y: 120%)[\)] . $
  Choose $B_s$ after the background constants so that its first two terms leave strict room below $B_s s_j$, and then decrease $D$ so that the remaining room pays the changes from $U$ to $C_(*) a_(j + 1)$ and from $s_j$ to $s_(j + 1)$. Initially the source is deterministic, so the mixed bound follows directly from the background moment bound. This closes the simultaneous induction for (8.2)–(8.2).
  At zero background the first step gives exactly the representative $w_(1 \, y)$. Its perturbation is $O \( a_0 s_0 \)$, hence $k_1 lt.eq C a_1 s_1$. Divide the kernel recursion in (8.4) by $a_(j + 1) s_(j + 1)$. The ratios $a_j \/ a_(j + 1) = 1 + O \( s_j \)$ and $s_j \/ s_(j + 1) = 1 + O \( G_j \)$ make its contraction coefficient strictly smaller than one. Iteration proves (8.3). ◻
]

=== 8.2 Connected moments and the scalar recurrence <connected-moments-and-the-scalar-recurrence>

Fix $q in cal(Q)$ and abbreviate $A_j = A_(j \, q)$. Use separate slot indices for all tensor factors and define

#[#set math.equation(numbering: n => "(8.5)")
 $ S_j = bb(E) \[ u_j^(⊗ q) \] \, #h(2em) C_(1 \, j) = "cum" \( u_j^(⊗ q) \, h_j \) \, #h(2em) C_(2 \, j) = "cum" \( u_j^(⊗ q) \, h_j \, h_j \) . $ <mark:connected-objects>]

In each cumulant $u_j^(⊗ q)$ is #emph[one random tensor-valued argument]; the $q$ marked factors are not separate cumulant groups. Taking the product of their normalized spin charges gives the scalar coordinate $A_j$ of $S_j$. All products and cumulants in (8.5) are therefore defined entry by entry before summing their indexed projective norms.

#thm([Lemma 8.2.])[
  #emph[For $j gt.eq 1$, with the bounded formal profile $Z_(j \, q \, y)^(*)$ from Section 6, 
#[#set math.equation(numbering: n => "(8.6)")
 $ C_(2 \, j) & = O \( A_j s_j^3 \) \,\
C_(1 \, j) & = A_j g_j Z_(j \, q \, y)^(*) + O #scale(x: 120%, y: 120%)[\(] A_j G_j \( s_j + rho^j \) #scale(x: 120%, y: 120%)[\)] \,\
S_j & = A_j w_(j \, y)^(⊗ q) + O \( A_j s_j \) . $ <mark:c2>]

 Consequently the marked charge moments obey 
#[#set math.equation(numbering: n => "(8.7)")
 $ A_(j + 1) = A_j (1 + c_(j \, q) \( y \) g_j + O #scale(x: 120%, y: 120%)[\(] G_j \( s_j + rho^j \) #scale(x: 120%, y: 120%)[\)]) . $ <mark:scalar-recursion>]

 The recurrence also holds at $j = 0$, where its error is allowed to be $O \( G_0 \)$.]
] <mark:connected-comparison>

#proof[
  The mixed estimates give initially $∥C_(k \, j)∥ lt.eq C A_j s_j^k$ for $k = 1 \, 2$. Apply the source Taylor rule through two background degrees, counting the displayed background arguments among those degrees. For $C_2$ the only retained term is homogeneous linear transport: a nonlinear term in either background output has at least three background letters, and a nonlinear term in the transported source tensor also adds a third letter. The degree-zero transport of the grouped source tensor is deterministic and linear on that tensor. Thus no independent $S_j K_j$ term is present in this cumulant recursion. By Proposition 18,
  #[#set math.equation(numbering: n => "(8.8)")
   $ C_(2 \, j + 1) = cal(L)_(2 \, j) C_(2 \, j) + O \( A_j s_j^3 \) \, #h(2em) ∥cal(L)_(2 \, j)∥ lt.eq kappa . $ <mark:c2-recur>]
  The initial grouped source tensor is deterministic, so $C_(2 \, 0) = 0$. Contraction now proves (8.6). More explicitly, for each of the finitely many exponents $b$ below,
  #[#set math.equation(numbering: n => "(8.9)")
   $ sum_(i < j) kappa^(j - 1 - i) A_i s_i^b lt.eq C_b A_j s_j^b . $ <mark:varying-convolution>]
  Indeed (8.4) gives $A_i \/ A_j lt.eq \( 1 + C sqrt(macron(g)) \)^(j - i)$, and $s_i \/ s_j lt.eq \( 1 + B_0 macron(g) \)^(\( j - i \) \/ 2)$; their product can be absorbed in the strict contraction by choosing $D$ small.
  The corresponding expansion of $C_1$ has its homogeneous term and terms with two background letters. To see their structure without any assumption on the disorder law, set $U = u^(⊗ q)$ in the moment-cumulant identity. For example,
  $ bb(E) \[ U ⊗ h ⊗ h \] = C_2 + S ⊗ K + S ⊗ m ⊗ m + C_1 ⊗ m + m ⊗ C_1 \, $
  with the indicated permutations of indices. The source-linear, background-quadratic term and the source-background term covaried with one background are obtained from this identity by subtracting their products of expectations. Their only possible leading inhomogeneous contribution is a bounded bilinear operation on $S \, K$; all the $C_2$ and $C_1 m$ terms are $O \( A_j s_j^3 \)$ at this stage. Consequently
  #[#set math.equation(numbering: n => "(8.10)")
   $ C_(1 \, j + 1) = cal(L)_(1 \, j) C_(1 \, j) + cal(H)_j \( S_j \, K_j \) + O \( A_j s_j^3 \) \, #h(2em) ∥cal(L)_(1 \, j)∥ lt.eq kappa \, $ <mark:c1-recur>]
  where $cal(H)_j$ is exactly the sum of these degree-two inhomogeneous Taylor terms. Since $C_(1 \, 0) = 0$, contraction first gives $C_(1 \, j) = O \( A_j G_j \)$.
  In the expansion of $S_(j + 1)$, the degree-one terms now use $C_(1 \, j)$ and $S_j m_j$, and the degree-two terms use $S_j K_j$; all other terms cost $O \( A_j s_j^3 \)$. Since $m_j \, K_j = O \( G_j \)$, taking product spin charge improves (8.4) to
  #[#set math.equation(numbering: n => "(8.11)")
   $ A_(j + 1) \/ A_j = 1 + O \( G_j \) . $ <mark:improved-ratio>]
  To identify its coefficient, expand $u_j = alpha_j w_(j \, y) + \( u_j - alpha_j w_(j \, y) \)$ in the $q$ tensor factors. Every term except the all-line term contains a kernel factor. Hölder, (8.2), and (8.3) bound its expectation by $C A_j s_j$, proving (8.6).
  The formal profile satisfies
  $ Z_(j + 1 \, q \, y)^(*) = cal(L)_(1 \, j) Z_(j \, q \, y)^(*) + cal(H)_j \( w_(j \, y)^(⊗ q) \, V_j \) . $
  Subtract this equation multiplied by $A_(j + 1) g_(j + 1)$ from (8.10). The replacements of $S_j$ and $K_j$ by their line parts cost $O \( A_j G_j \( s_j + rho^j \) \)$, by (8.6) and (7.4). The change of scalar factors costs $O \( A_j G_j^2 \)$, by (8.11) and $g_(j + 1) - g_j = O \( G_j^2 \)$. Contraction and (8.9) prove (8.6). Finally insert the three profile comparisons and (7.4), with its terminal term removed, into the Taylor formula for the spin charge of $S_(j + 1)$. Its leading coefficient is exactly $c_(j \, q) \( y \)$ by definition. The accumulated error is that in (8.7). Scale zero has bounded coefficients and errors of order $A_0 G_0$, which the geometric term allows. ◻
]

=== 8.3 Summation of the moments <summation-of-the-moments>

#thm([Proposition 8.3.])[
  #emph[For each $q in cal(Q)$ and fixed sufficiently small $D > 0$, 
#[#set math.equation(numbering: n => "(8.12)")
 $ A_(j \, q) = j^(binom(q, 2) \/ 8 + o \( 1 \)) #h(2em) \( j arrow.r oo \) \, $ <mark:asymptotic>]

 uniformly in the marked site $y$. In addition there is a constant independent of sufficiently small $D$ such that 
#[#set math.equation(numbering: n => "(8.13)")
 $ A_(j \, 2) lt.eq C \( 1 + B_0 j macron(g) \)^(1 \/ 4) #h(2em) \( j gt.eq 0 \) . $ <mark:second-uniform>]

]
] <mark:moments>

#proof[
  The error in (8.7) has summable absolute values, because
  $ sum_(j gt.eq 0) G_j \( s_j + rho^j \) < oo \, #h(2em) sum_(j gt.eq 0) g_j^2 < oo . $
  All factors are positive and uniformly close to one for small $D$. Taking logarithms therefore gives
  #[#set math.equation(numbering: n => "(8.14)")
   $ log A_(J \, q) = sum_(j < J) c_(j \, q) \( y \) g_j + O_D \( 1 \) . $ <mark:log-sum>]
  The error is uniform in $y$. Let $mu_q = binom(q, 2) B_0 \/ 8$. Proposition 21 gives $sum_(j < J) \( c_(j \, q) \( y \) - mu_q \) = o \( J \)$ uniformly in $y$. Abel summation then gives $sum_(1 lt.eq j < J) \( c_(j \, q) \( y \) - mu_q \) \/ j = o \( log J \)$: for each $eta > 0$, the partial sums are at most $eta j + C_eta$, and the summation-by-parts remainder is at most $eta log J + O_eta \( 1 \)$. The coefficients are bounded, so replacing $1 \/ \( B_0 j \)$ by $g_j = \( 1 + o \( 1 \) \) \/ \( B_0 j \)$ costs another $o \( log J \)$. This proves (8.12) from (8.14).
  For the bound uniform in $D$, write $c_j = c_(j \, 2) \( y \)$ and $mu = B_0 \/ 8$. Uniform Cesaro convergence gives $\| sum_(i < k) \( c_i - mu \) \| lt.eq eta k + C_eta$. Since $G_j$ decreases, summation by parts implies
  #[#set math.equation(numbering: n => "(8.15)")
   $ sum_(j < J) c_j G_j lt.eq \( mu + eta \) sum_(j < J) G_j + C_eta macron(g) lt.eq (1 / 8 + eta / B_0) log \( 1 + B_0 J macron(g) \) + C_eta . $ <mark:uniform-abel>]
  By (7.11), replacing $G_j$ by $g_j$ costs at most $∥c∥_oo sup_j \| g_j \/ G_j - 1 \| sum_(j < J) G_j$. Choose $eta$ and then the disorder bound so that the total coefficient of the logarithm is less than $1 \/ 4$. The sums of the Taylor errors and of $g_j^2$ are uniformly bounded (in fact they tend to zero with $D$). Applying the logarithmic estimate proves (8.13). ◻
]

=== 8.4 The first moment <the-first-moment>

The first charge moment need not be used as a norm. Instead, the second moment estimate supplies an absolute bound for its Taylor remainders. This avoids presuming either its sign or its comparability to one.

#thm([Proposition 8.4.])[
  #emph[Uniformly in $j$ and $y$, for sufficiently small $D > 0$, 
#[#set math.equation(numbering: n => "(8.16)")
 $ 1 / C lt.eq A_(j \, 1) = bb(E) alpha_j lt.eq C . $ <mark:first-bound>]

 More precisely, $sup_(j \, y) \| A_(j \, 1) - 1 \| arrow.r 0$ as $D arrow.b 0$.]
] <mark:first>

#proof[
  Set $U_j^(*) = C \( 1 + B_0 j macron(g) \)^(1 \/ 8)$. Equations (8.2), (8.2), and (8.13), with $q = 2$, give all one-source absolute estimates with $A_j$ in the previous proof replaced by $U_j^(*)$. To retain the full background smallness in this passage, write $Y = ∥u_(j \, i)∥$ and $H = product_m ∥h_(j \, m)∥^(a_m)$, with $b = sum_m a_m lt.eq p$. Cauchy–Schwarz gives
  $ bb(E) \[ Y H \] lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) \[ Y^2 H \] #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) \[ H \] #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C U_j^(*) s_j^b e^(- v n_i - v sum_m a_m n_m) . $
  The first factor uses the mixed $q = 2$ measure and the second the background moment bound. Unused powers in both measures pay any large-field indicator in the Taylor remainder as in Proposition 16. Apply the same connected-cumulant recursions to the single grouped source $u_j$. They yield
  $ C_(2 \, j) = O \( U_j^(*) s_j^3 \) \, quad C_(1 \, j) = O \( U_j^(*) G_j \) \, quad S_j = A_(j \, 1) w_(j \, y) + O \( U_j^(*) s_j \) . $
  The change of its scalar coordinate is bounded absolutely by $\| A_(j + 1 \, 1) - A_(j \, 1) \| lt.eq C U_j^(*) G_j$. When comparing the $C_1$ recursion with its formal profile, use this absolute difference bound in place of (8.11). Together with $\| A_(j \, 1) \| lt.eq U_j^(*)$ it bounds the change of $A_(j \, 1) g_j$ by $C U_j^(*) G_j^2$. The same contracting convolution proves
  $ C_(1 \, j) = A_(j \, 1) g_j Z_(j \, 1 \, y)^(*) + O #scale(x: 120%, y: 120%)[\(] U_j^(*) G_j \( s_j + rho^j \) #scale(x: 120%, y: 120%)[\)] . $
  Consequently, with $a_j = A_(j \, 1)$,
  #[#set math.equation(numbering: n => "(8.17)")
   $ a_(j + 1) = \( 1 + c_(j \, 1) \( y \) g_j \) a_j + e_j \, #h(2em) \| e_j \| lt.eq C U_j^(*) G_j \( s_j + rho^j \) . $ <mark:first-recursion>]
  Corollary 22 gives a fixed bound on every partial sum of $c_(j \, 1) \( y \)$, uniformly in $y$. Abel summation and Corollary 25 therefore imply
  $ sup_J lr(|sum_(j < J) c_(j \, 1) \( y \) g_j|) lt.eq C (g_0 + sum_(j gt.eq 0) \| g_(j + 1) - g_j \|) lt.eq C macron(g) . $
  Also $sum_j c_(j \, 1) \( y \)^2 g_j^2 lt.eq C macron(g)$. Thus the products $P_J = product_(j < J) \( 1 + c_(j \, 1) \( y \) g_j \)$ are positive and satisfy $sup_(J \, y) \| P_J - 1 \| lt.eq C macron(g)$. The inhomogeneous errors have total cost
  $ sum_(j gt.eq 0) \| e_j \| & lt.eq C macron(g)^(3 \/ 2) sum_(j gt.eq 0) \( 1 + B_0 j macron(g) \)^(- 11 \/ 8) + C macron(g) sum_(j gt.eq 0) rho^j \( 1 + B_0 j macron(g) \)^(- 7 \/ 8)\
 & lt.eq C sqrt(macron(g)) . $
  The exponent $11 \/ 8 > 1$ is what makes the first sum integrable on the scale $j asymp macron(g)^(- 1)$. Variation of constants in (8.17), with $a_0 = 1$, gives
  $ a_J = P_J (1 + sum_(j < J) e_j \/ P_(j + 1)) . $
  It follows that $sup_(J \, y) \| a_J - 1 \| lt.eq C sqrt(macron(g))$, which proves both assertions. ◻
]

== 9 Quenched partition readout and boundary arms <sec:readout>

The marked estimates concern random functions in a partition integrand. We now recover the spin correlation normalized separately in each random environment. Two features of this passage matter. The charge of an entire source list need not depend on local randomness, so independence will be used only after replacing it by the charge of the principal slot. Also, large terminal background interactions cannot be discarded globally. We remove only the interactions meeting a growing buffer around the two marks and use a conditional reference estimate inside that buffer.

Throughout this section $D > 0$ is fixed and sufficiently small, and $t = t_(*) \( D \)$ is the tuned parameter of Proposition 24. The expectation $bb(E)$ includes the independent decision seeds of the blocking construction. All assertions about growth as the scale index tends to infinity are uniform in the locations of the marks. Constants may depend on $D$ and on the fixed geometric parameters. In particular, no uniform large-distance asymptotic as $D arrow.b 0$ is asserted.

=== 9.1 The exact identity and the two local amplitudes <the-exact-identity-and-the-two-local-amplitudes>

Let $y_1 \, y_2 in bb(Z)^2$ and put $ell = lr(bar.v.double y_1 - y_2 bar.v.double)_oo$. Fix $F$ larger than all principal support and dependence halos and all contact distances in one blocking step. Increase it, if necessary, so that the same separation holds in output-scale units for every step considered below. For sufficiently large $ell$, let $J$ be the largest integer such that

#[#set math.equation(numbering: n => "(9.1)")
 $ F lt.eq ell \/ r_J < L F . $ <read:stop>]

Thus $J = log_L ell + O \( 1 \)$. None of our estimates requires the ratio $ell \/ r_J$ to converge, or either mark to occupy a prescribed position inside its grid cell.

Use two commuting square-free variables $zeta_1 \, zeta_2$, so $zeta_1^2 = zeta_2^2 = 0$. Start the log integrand with $zeta_1 sigma_(y_1) + zeta_2 sigma_(y_2)$; its initial joint coefficient is zero. At scale $j$ write the source-dependent part of the transformed log integrand and its saved scalar as

#[#set math.equation(numbering: n => "(9.2)")
 $ r_j^(- d) sum_(a = 1)^2 zeta_a #scale(x: 120%, y: 120%)[\(] U_(j \, a) + k_(j \, a) #scale(x: 120%, y: 120%)[\)] + r_j^(- 2 d) zeta_1 zeta_2 #scale(x: 120%, y: 120%)[\(] U_(j \, 12) + k_(j \, 12) #scale(x: 120%, y: 120%)[\)] \, #h(2em) d = 1 / 8 . $ <read:jet>]

Here $U_(j \, a) = sum_i u_(j \, a \, i)$ is the sum of the scaled singleton list, $U_(j \, 12)$ is the sum of the scaled joint list, and $k_(j \, a) \, k_(j \, 12)$ are the accumulated scalar coefficients with the indicated scaling. Saved scalars retain their carriers until all estimates involving those carriers have been made. The individual singleton lists coincide with those obtained by running one source alone: set the other square-free variable equal to zero and then differentiate in the chosen variable.

We apply the exact blocking identity first in a free box $Lambda_N$ containing the marks and all relevant buffers. Write $chevron.l dot.op chevron.r_(J \, N \, omega)$ for expectation in its actual terminal background: the reference measure multiplied by the transformed positive weight and divided by its own source-zero partition integral. The saved source-zero scalar cancels in this ratio, however large it is. Use the plane centering convention also for source coefficients near the free boundary. Spin flip then makes $k_(J \, 1) = k_(J \, 2) = 0$. Expanding the exponential of (9.2) therefore gives the exact identity

#[#set math.equation(numbering: n => "(9.3)")
 $ r_J^(2 d) chevron.l sigma_(y_1) sigma_(y_2) chevron.r_(N \, omega)^(upright("free")) = chevron.l U_(J \, 1) U_(J \, 2) + U_(J \, 12) chevron.r_(J \, N \, omega) + k_(J \, 12) . $ <read:exact-normalized>]

This is an identity at each environment and each choice of decision seeds. In particular it computes the quenched correlation and not a ratio of disorder-averaged partition integrals. For every function $Q$, the bound $\| chevron.l Q chevron.r_(J \, N \, omega) \| lt.eq ∥∥ Q_oo$ is independent of the terminal interactions outside its support. This is the reason that the sup-norm errors below remain usable after readout.

We next estimate the plane lists. Their use in (9.3) will be justified by the fixed-step finite-volume passage below. Let $u_(j \, y \, upright("pr"))$ denote the principal slot of the singleton list at $y$. In addition to its total normalized charge $alpha_(j \, y)$ from Section 8, define

#[#set math.equation(numbering: n => "(9.4)")
 $ tilde(alpha)_(j \, y) = r_j^(- d) ell_s \( u_(j \, y \, upright("pr")) \) \, #h(2em) w_(j \, y) = r_j^d P_(H r_j \, c_j \( y \)) sigma_y . $ <read:local-charge>]

The line representative $w_(j \, y)$ occupies the principal slot, has normalized charge one, and has uniformly bounded sup norm. The charge bound of Lemma 2, with exponential weights paying all carrier-size factors, shows that the charge functional is bounded on a singleton list. The nonprincipal slots of $u_(j \, y) - alpha_(j \, y) w_(j \, y)$ are exactly those of $u_(j \, y)$. Consequently Proposition 26 gives, for each of the fixed even powers $q$ used below and $j gt.eq 1$,

#[#set math.equation(numbering: n => "(9.5)")
 $ ∥alpha_(j \, y) - tilde(alpha)_(j \, y)∥_(L^q) & lt.eq C A_(j \, q) \( y \)^(1 \/ q) s_j \,\
∥u_(j \, y) - tilde(alpha)_(j \, y) w_(j \, y)∥_(v \, q) & lt.eq C A_(j \, q) \( y \)^(1 \/ q) s_j \, $ <read:principal-replacement>]

where $A_(j \, q) \( y \) = bb(E) alpha_(j \, y)^q$ and the weighted norm includes slotwise function sup norms. Summation over slots preserves these bounds because the weight has the counting slack of Section 3.

The random variable $tilde(alpha)_(J \, y)$ is measurable with respect to the environment and all decision seeds in the fixed principal footprint at $y$. Those footprints at $y_1 \, y_2$ are disjoint by the choice of $F$, including the safety layer for edge variables. Hence $tilde(alpha)_(J \, y_1)$ and $tilde(alpha)_(J \, y_2)$ are exactly independent. This assertion concerns the two amplitudes; it makes no independence assertion about the Gibbs state in which they will be read. Propositions 28 and 29, together with (9.5), imply, for large $J$,

#[#set math.equation(numbering: n => "(9.6)")
 $ c lt.eq bb(E) tilde(alpha)_(J \, y) lt.eq C \,\
∥tilde(alpha)_(J \, y)∥_(L^2) = J^(1 \/ 16 + o \( 1 \)) \,\
∥tilde(alpha)_(J \, y)∥_(L^4) = J^(3 \/ 16 + o \( 1 \)) . $ <read:local-moments>]

For the first assertion the error is at most $C A_(J \, 2)^(1 \/ 2) s_J = o \( 1 \)$; for the other two, the error in $L^q$ is $o \( A_(J \, q)^(1 \/ q) \)$. Thus, with $Z_J = tilde(alpha)_(J \, y_1) tilde(alpha)_(J \, y_2)$,

#[#set math.equation(numbering: n => "(9.7)")
 $ c lt.eq bb(E) Z_J lt.eq C \, #h(2em) bb(E) \| Z_J \| lt.eq J^(1 \/ 8 + o \( 1 \)) \, #h(2em) ∥Z_J∥_(L^2) = J^(1 \/ 8 + o \( 1 \)) \, #h(2em) ∥Z_J∥_(L^4) = J^(3 \/ 8 + o \( 1 \)) . $ <read:product-moments>]

The mean factors even if the amplitudes are signed. The upper bound for $bb(E) \| Z_J \|$ also follows from the $L^2$ bound.

#thm([Lemma 9.1.])[
  (Separated joint-source terms).  #emph[At the stopping scale (9.1), the sum of the sup norms of the joint-source list and the absolute values of its saved scalar increments, including their subsequent scaling, has $L^2$ norm at most 
#[#set math.equation(numbering: n => "(9.8)")
 $ C s_J J^(3 \/ 8 + o \( 1 \)) = J^(- 1 \/ 8 + o \( 1 \)) . $ <read:merge-bound>]

 Replacing $U_(J \, 1) U_(J \, 2)$ by $Z_J w_(J \, y_1) w_(J \, y_2)$ has the same $L^2$ bound on its sup norm.]
] <read:merge>

#proof[
  A newly generated coefficient containing both labels is bilinear in the two singleton lists. Apply the connected coefficient bounds of Lemma 9, retaining the output carrier containing both marks. At zero background degree a pair of principal slots does not merge: their input carriers, averaging squares, and contact neighborhoods are disjoint, also in output units, by our choice of $F$. Their transformed moment therefore factors and contributes zero to the joint logarithmic coefficient. At the first step the two input sources are principal. At later steps a zero-background merge must therefore contain a remainder from (9.5); Hölder’s inequality in $L^4$ gives a factor $s_j$ in its $L^2$ cost.
  For ordinary analytic terms of positive background degree, retain one background factor before bounding the others by the small thresholds and the deterministic tail bounds. To spell out why the retained factor is small despite dependence, suppress the slot weights and write $X_a = ∥u_(j \, a \, i_a)∥$ and $H = ∥h_m∥$. The mixed bound of Proposition 16, for source power four, and Hölder interpolation with respect to the measure $X_a^4 thin thin upright(d) bb(P)$ give
  $ bb(E) \( X_a^4 H^2 \) lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) X_a^4 H^p #scale(x: 120%, y: 120%)[\)]^(2 \/ p) #scale(x: 120%, y: 120%)[\(] bb(E) X_a^4 #scale(x: 120%, y: 120%)[\)]^(1 - 2 \/ p) lt.eq C U_a^4 s_j^2 \, #h(2em) U_a = C A_(j \, 4) \( y_a \)^(1 \/ 4) . $
  It follows that
  $ ∥X_1 X_2 H∥_(L^2)^2 lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) X_1^4 H^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) X_2^4 H^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C U_1^2 U_2^2 s_j^2 . $
  The slot weights interpolate in the same way.
  There is a separate estimate for changes caused by a large-field decision. The actual map and its ordinary analytic comparison agree unless one of the finitely many local badness tests in that term succeeds. For a tested principal slot $m$, let $B_m = { ∥h_m∥ > delta }$; a random threshold in $\[ delta \, 2 delta \]$ can only reduce this event. The same mixed bound gives
  $ bb(E) \( X_a^4 upright(bold(1))_(B_m) \) lt.eq delta^(- p) bb(E) \( X_a^4 ∥h_m∥^p \) lt.eq C U_a^4 s_j^p \, #h(2em) ∥X_1 X_2 upright(bold(1))_(B_m)∥_(L^2) lt.eq C U_1 U_2 s_j^(p \/ 2) . $
  Normalized tilted moments, and their joint logarithmic derivatives, are bounded by a fixed multiple of $X_1 X_2$; their bounds contain no exponential of a large principal norm. Thus the last display also bounds the decision-dependent terms. The number and positions of tested centers cost only the polynomial carrier factors already paid by the tree weights. Summing the tests and the analytic coefficients as in Lemma 9 gives a fresh joint coefficient of cost at most $C U_1 U_2 s_j$, since $p \/ 2 > 1$. All additional small factors and placements are paid by the thresholds and exponential slack. This separates the smallness supplied by a retained analytic factor from the smallness supplied by the rare decision event.
  An animal containing both marks has length at least $c ell \/ r_(j + 1)$. Retain one further fixed positive exponential weight on the output before summing it or saving a scalar. The fresh cost is therefore at most
  #[#set math.equation(numbering: n => "(9.9)")
   $ C A_(j \, 4) \( y_1 \)^(1 \/ 4) A_(j \, 4) \( y_2 \)^(1 \/ 4) s_j exp \( - c ell \/ r_(j + 1) \) . $ <read:fresh-merge>]
  The finitely many initial-scale adjustments obey this bound with a fixed constant. Once generated, a joint coefficient is transported linearly in that coefficient. The deterministic source bound, with normalized tilts and the fixed source rescaling, bounds its total weighted sup cost by a constant $K$ per step, uniformly in the sizes of the principal background fields. Scalars obey the same bound when their rescaling is included. Thus their accumulated cost is bounded by the sum of (9.9) multiplied by $K^(J - j - 1)$, over $0 lt.eq j < J$.
  For completeness, this sum is uniform over the whole stopping window. For $j gt.eq J \/ 2$, $s_j lt.eq C_D s_J$ and $A_(j \, 4) \( y_a \)^(1 \/ 4) lt.eq C_(D \, eta) J^(3 \/ 16 + eta)$ for every $eta > 0$. Writing $m = J - j - 1$, the remaining numerical series is bounded by
  $ sum_(m gt.eq 0) K^m exp \( - c F L^m \) < oo . $
  For $j < J \/ 2$, the same exponential contains a factor at most $exp \( - c F L^(J \/ 2 - 1) \)$, which pays $K^J$ and any polynomial bound on the earlier marked moments. This proves (9.8), with arbitrarily small fixed power losses in place of its $o \( 1 \)$.
  Finally set $R_a = U_(J \, a) - tilde(alpha)_(J \, y_a) w_(J \, y_a)$. The identity
  $ U_(J \, 1) U_(J \, 2) - Z_J w_(J \, y_1) w_(J \, y_2) = R_1 U_(J \, 2) + tilde(alpha)_(J \, y_1) w_(J \, y_1) R_2 $
  and (9.5) give the same $L^2$ bound by Hölder with fourth moments. No independence is used in this last estimate. ◻
]

=== 9.2 The fixed-step passage from boxes to plane lists <the-fixed-step-passage-from-boxes-to-plane-lists>

We explain the finite-volume passage before using the stochastic plane bounds in (9.3). Fix the marks and the number $J$ of steps. Proposition 12 bounds the principal functions deterministically at each such step, uniformly in $N$. For the fixed source labels, Lemma 9 gives bounded weighted operator costs for transport and for each merge, also under the normalized bad-field averages. Starting from the bounded microscopic sources, iteration through these finitely many steps therefore bounds the source lists and their saved marked increments deterministically, uniformly in $N$; scalar carriers are retained when applying the weights. With any of the fixed exponential weights, the tails of the source lists and of background lists touching a fixed region are summable, with constants allowed to depend on $J$. Given a carrier cutoff, all remaining footprints and all their decision neighborhoods lie in a fixed finite set. Once $N$ contains that set, their coefficients equal the plane coefficients exactly under the common coupling of environment and seeds. First use this equality for the finitely many retained slots and increments, and then let the carrier cutoff increase. The deterministic tail bounds show that the corresponding errors tend to zero in every fixed $L^q$ used here. This argument also applies to the carrier-weighted marked scalar increments before they are summed. Odd local increments vanish by spin flip; in the free box the parity statement holds for the entire construction.

In this order of limits, Lemma 30 and (9.5) imply

#[#set math.equation(numbering: n => "(9.10)")
 $ r_J^(2 d) chevron.l sigma_(y_1) sigma_(y_2) chevron.r_(N \, omega)^(upright("free")) = Z_J chevron.l w_(J \, y_1) w_(J \, y_2) chevron.r_(J \, N \, omega) + cal(R)_(J \, N) \, quad limsup_(N arrow.r oo) ∥cal(R)_(J \, N)∥_(L^2) lt.eq C s_J J^(3 \/ 8 + o \( 1 \)) . $ <read:amplitude-readout>]

Here replacement of the finite-volume principal charges by the plane charges has zero error for all sufficiently large $N$. We do not need the terminal measures themselves to converge: a uniform estimate of the expectation in (9.10) will suffice.

=== 9.3 Removing a buffer and taking the two disorder moments <removing-a-buffer-and-taking-the-two-disorder-moments>

The functions $w_(J \, y_1) \, w_(J \, y_2)$ are supported in a region of bounded diameter in $r_J$ units. Enclose it by a square buffer with margin

#[#set math.equation(numbering: n => "(9.11)")
 $ b = J^(4 \/ 25) $ <read:buffer-radius>]

terminal cells. Figure 2 shows the principal random footprints and the surrounding region used to compare the spin expectation with its reference value.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.15, -3.15), (3.15, 3.15), fill: rgb("#f7f7f7"), stroke: none)
  rect((-2.6, -1.5), (2.6, 1.5), fill: rgb("#ffffff"), stroke: none)
  rect((-3.15, -3.15), (3.15, 3.15), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10))
  content((0, 3.28), [#text(size: 9pt)[Terminal buffer]], anchor: "south", padding: 0.1176cm)
  rect((-2.6, -1.5), (2.6, 1.5), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  rect((-2.5, -1), (-0.5, 1), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-1.95, -0.45), (-1.05, 0.45), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  rect((0.5, -1), (2.5, 1), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  rect((1.05, -0.45), (1.95, 0.45), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((-1.41, 0.05), radius: 0.05292, fill: black, stroke: none)
  circle((1.59, 0.05), radius: 0.05292, fill: black, stroke: none)
  content((-1.41, -0.03), [#text(size: 9pt)[$y_1$]], anchor: "north", padding: 0.1176cm)
  content((1.59, -0.03), [#text(size: 9pt)[$y_2$]], anchor: "north", padding: 0.1176cm)
  content((-1.5, 0.5), [#text(size: 9pt)[$w_(J,y_1)$]], anchor: "south", padding: 0.1176cm)
  content((1.5, 0.5), [#text(size: 9pt)[$w_(J,y_2)$]], anchor: "south", padding: 0.1176cm)
  content((-1.5, -1.05), [#text(size: 9pt)[$tilde( alpha )_(J,y_1)$]], anchor: "north", padding: 0.1176cm)
  content((1.5, -1.05), [#text(size: 9pt)[$tilde( alpha )_(J,y_2)$]], anchor: "north", padding: 0.1176cm)
  line((2.8, 1.5), (2.8, 3.15), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", length: 0.16cm, fill: rgb("#595959")), end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((2.8, 2.325), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$b r_J$]]])], anchor: "east")
  line((2.6, 1.5), (2.97, 1.5), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1.41, -1.55), (-1.41, -2.08), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((1.59, -1.55), (1.59, -2.08), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-1.41, -1.92), (1.59, -1.92), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", length: 0.16cm, fill: rgb("#595959")), end: (symbol: ">>", length: 0.16cm, fill: rgb("#595959"))))
  content((0.09, -1.92), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$ell$]]])], anchor: "north")
  content((0, -2.65), [#text(size: 9pt)[$F lt.eq ell"/"r_J<"LF"$]])
  line((3.6, 1.62), (4.12, 1.62), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((4.25, 1.62), [#box(width: 3.385cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Reference contours#linebreak()supporting $w_(J,y_a)$]])], anchor: "west")
  line((3.6, 0.35), (4.12, 0.35), stroke: (paint: rgb("#00008c"), thickness: 0.7pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.25, 0.35), [#box(width: 3.385cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[Random footprints#linebreak()of the principal slots]])], anchor: "west")
  line((3.6, -0.95), (4.12, -0.95), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((4.25, -0.95), [#box(width: 3.385cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[A bounded insertion#linebreak()enclosure]])], anchor: "west")
  content((3.6, -2.45), [#box(width: 3.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 8pt)[Schematic; not to scale.]])], anchor: "west")
})],
  caption: [Figure 2: Geometry of the terminal readout. The solid inner squares are the reference contours defining $w_(J \, y_a)$, centered at the cells $c_J \( y_a \)$. The dashed principal footprints record the disorder and decision seeds determining $tilde(alpha)_(J \, y_a)$; their disjointness, including the safety layer for edge variables, gives independence of the two amplitudes. The dotted enclosure has bounded diameter in terminal cell units. A surrounding square provides margin of order $b r_J$, where $b = J^(4 \/ 25)$. Removing terminal interactions whose spin supports meet this square leaves a reference conditional expectation inside it. The two spin observables are still evaluated jointly in that expectation. Shapes and relative lengths are schematic. ],
) <read:geometry>

Let $T_(J \, N)$ be the sum of the sup norms of all terminal background slots whose spin supports meet the buffer or its interior. We may bound it by the larger sum over slots whose recorded carriers meet that region. There are $O \( b^2 \)$ possible cells at which to root such a slot. The exponential weights pay the choices of animals and any distance of their anchors from those cells. The background $L^p$ bound from Proposition 24 and Minkowski’s inequality consequently give

#[#set math.equation(numbering: n => "(9.12)")
 $ limsup_(N arrow.r oo) ∥T_(J \, N)∥_(L^p) lt.eq C b^2 s_J = O_D \( J^(- 9 \/ 50) \) . $ <read:buffer-cost>]

Finite-box errors vanish by the preceding fixed-step argument. We have chosen the fixed background moment $p$ sufficiently large; any $p > 25$ suffices for the probability estimates below, and the earlier construction allows much larger values.

Put $Q_J = w_(J \, y_1) w_(J \, y_2)$ and $q_J = chevron.l Q_J chevron.r_0$, where the latter is plane reference expectation. If $T_(J \, N) lt.eq 1$, delete these background slots. For a bounded observable and a perturbation $W$ with $∥∥ W_oo lt.eq T$, differentiation of normalized expectations along $exp \( t W \)$, $0 lt.eq t lt.eq 1$, gives

$ lr(|frac(thin upright(d), thin upright(d) t) chevron.l Q chevron.r_t|) = \| "Cov"_t \( Q \, W \) \| lt.eq 2 ∥∥ Q_oo T . $

Thus deletion changes the expectation of $Q_J$ by at most $C T_(J \, N)$. Conditionally on spins outside the buffer, the remaining law inside is the reference Ising law with some boundary data. The product $Q_J$ is even and has bounded sup norm. Its support diameter in terminal units is bounded uniformly in (9.1). The even conditional reference estimate of Proposition 3 therefore changes its expectation from the plane value by at most $C \/ b$, uniformly in those outer data. On the complementary event we use the uniform bound $C$ on both expectations. In particular, if

$ B_(J \, N) = { T_(J \, N) > J^(- 7 \/ 50) } \, #h(2em) Delta_(J \, N) = chevron.l Q_J chevron.r_(J \, N \, omega) - q_J \, $

then

#[#set math.equation(numbering: n => "(9.13)")
 $ \| Delta_(J \, N) \| lt.eq C \( J^(- 7 \/ 50) + J^(- 4 \/ 25) \) quad upright("on ") B_(J \, N)^(upright(c)) \, #h(2em) \| Delta_(J \, N) \| lt.eq C \, #h(2em) limsup_(N arrow.r oo) bb(P) \( B_(J \, N) \) lt.eq C_D J^(- p \/ 25) . $ <read:buffer-good>]

The probability bound follows from Markov’s inequality and (9.12); it requires no independence between $T_(J \, N)$ and the amplitudes.

Here are the distinct estimates needed for the first and second moments. On $B_(J \, N)^(upright(c))$, (9.7) gives

$ bb(E) #scale(x: 120%, y: 120%)[\[] \| Z_J Delta_(J \, N) \| upright(bold(1))_(B_(J \, N)^(upright(c))) #scale(x: 120%, y: 120%)[\]] & lt.eq J^(1 \/ 8 - 7 \/ 50 + o \( 1 \)) = J^(- 3 \/ 200 + o \( 1 \)) \,\
∥Z_J Delta_(J \, N) upright(bold(1))_(B_(J \, N)^(upright(c)))∥_(L^2) & lt.eq J^(1 \/ 8 - 7 \/ 50 + o \( 1 \)) . $

On the exceptional event, Hölder’s inequality gives, after the finite-volume limit,

$ limsup_(N arrow.r oo) bb(E) #scale(x: 120%, y: 120%)[\[] \| Z_J Delta_(J \, N) \| upright(bold(1))_(B_(J \, N)) #scale(x: 120%, y: 120%)[\]] & lt.eq C ∥Z_J∥_(L^2) J^(- p \/ 50) = J^(1 \/ 8 - p \/ 50 + o \( 1 \)) \,\
limsup_(N arrow.r oo) ∥Z_J Delta_(J \, N) upright(bold(1))_(B_(J \, N))∥_(L^2) & lt.eq C ∥Z_J∥_(L^4) J^(- p \/ 100) = J^(3 \/ 8 - p \/ 100 + o \( 1 \)) . $

The first error tends to zero. For some fixed $eta > 0$ the second is $O \( J^(1 \/ 8 - eta + o \( 1 \)) \)$, since $p > 25$. Together with (9.10), these estimates prove

#[#set math.equation(numbering: n => "(9.14)")
 $ limsup_(N arrow.r oo) bb(E) lr(|r_J^(2 d) chevron.l sigma_(y_1) sigma_(y_2) chevron.r_(N \, omega)^(upright("free")) - q_J Z_J|) & = o \( 1 \) \,\
limsup_(N arrow.r oo) ∥r_J^(2 d) chevron.l sigma_(y_1) sigma_(y_2) chevron.r_(N \, omega)^(upright("free")) - q_J Z_J∥_(L^2) & = O \( J^(1 \/ 8 - eta + o \( 1 \)) \) . $ <read:two-errors>]

Decrease $eta$ if necessary to include the joint-source error $J^(- 1 \/ 8 + o \( 1 \))$. The separate $L^1$ estimate is useful: a relative $L^2$ estimate alone would not recover the bounded first moment.

The two reference averaging squares defining $w_(J \, y_a)$ are disjoint. Conditional independence in the reference model, given their contours, and the tower property yield the exact equality

#[#set math.equation(numbering: n => "(9.15)")
 $ q_J = r_J^(2 d) chevron.l sigma_(y_1) sigma_(y_2) chevron.r_0 . $ <read:reference-pair>]

The separated reference correlation limit, uniformly over the compact window (9.1) and over directions, gives $0 < c lt.eq q_J lt.eq C$. Thus arbitrary integer separations and grid-cell positions are covered.

#thm([Proposition 9.2.])[
  (Disorder moments at tuning).  #emph[Let $C_(* \, omega) \( y_1 \, y_2 \)$ be the free infinite-volume spin correlation at $t_(*) \( D \)$, and let $J$ be determined by (9.1). For every fixed sufficiently small $D > 0$, uniformly in the two marks as their separation tends to infinity, 
#[#set math.equation(numbering: n => "(9.16)")
 $ r_J^(2 d) bb(E) C_(* \, omega) \( y_1 \, y_2 \) asymp 1 \, #h(2em) r_J^(4 d) bb(E) C_(* \, omega) \( y_1 \, y_2 \)^2 = J^(1 \/ 4 + o \( 1 \)) . $ <read:moment-conclusion>]

]
] <read:moments>

#proof[
  For each fixed separation, free ferromagnetic correlations increase as the volume increases and remain in $\[ 0 \, 1 \]$. Their limit exists, and bounded convergence passes both disorder moments to the limit. Here $J$ and $r_J$ are fixed during this passage. The first line of (9.14), (9.7), and (9.15) give the first assertion, including a positive lower bound. For the second, the triangle inequality and its reverse in $L^2$ give
  $ lr(|∥r_J^(2 d) C_(* \, omega) \( y_1 \, y_2 \)∥_(L^2) - q_J ∥Z_J∥_(L^2)|) lt.eq O \( J^(1 \/ 8 - eta + o \( 1 \)) \) . $
  The main term is $J^(1 \/ 8 + o \( 1 \))$, so squaring proves the second assertion. All finite-volume identities hold for each choice of seeds, whereas the original correlation depends only on the bonds. Averaging over the seeds thus leaves the asserted disorder moments unchanged. ◻
]

=== 9.4 A finite-box estimate with wired boundary <a-finite-box-estimate-with-wired-boundary>

The identification of the transition also needs an estimate in boxes whose boundary is fixed to plus. Such a boundary can create an odd saved scalar, so it is important to keep the carrier of that scalar until its distance from the central mark has been used.

#thm([Proposition 9.3.])[
  (Wired arm at tuning).  #emph[For any square box of radius $n$ centered at a lattice site $y$, let $phi.alt_(n \, * \, omega)^w$ be the FK–Ising law at $t_(*) \( D \)$ with wired boundary. Then 
#[#set math.equation(numbering: n => "(9.17)")
 $ bb(E) [phi.alt_(n \, * \, omega)^w \( y arrow.l.r partial Lambda_n \( y \) \)^400] lt.eq n^(- 400 \/ 8 + o \( 1 \)) . $ <read:arm-bound>]

 The estimate is uniform in $y$. It also holds if the fixed wall is one lattice layer inside or outside the indicated square, including the convention with bonds crossing to an exterior wired layer.]
] <read:arm>

#proof[
  Under the Edwards–Sokal coupling [12], the wired arm probability equals the spin expectation with the corresponding plus wall. Start a single source at $y$ and let $J_n$ be the largest integer satisfying
  #[#set math.equation(numbering: n => "(9.18)")
   $ r_(J_n) lt.eq n \/ \( log n \)^2 . $ <read:arm-stop>]
  Thus $r_(J_n) asymp n \/ \( log n \)^2$, $J_n = O \( log n \)$, and the principal halo remains far from the wall for every $j lt.eq J_n$.
  Use the finite-box blocking rule, which forbids cuts near the wall and leaves those interactions in the lists. Every singleton term whose full footprint stays in the bulk equals its plane counterpart. By the weighted $L^400$ source estimate and Proposition 28, the sum of the sup costs of these bulk terms at the final scale has $L^400$ norm bounded by a fixed power of $1 + J_n$. Indeed $A_(j \, 400)^(1 \/ 400) = j^(399 \/ 16 + o \( 1 \))$, and summing the exponential slot weights only changes its constant. A local odd scalar is zero: before the boundary spins are evaluated, the bulk kernels and the plane centering are invariant under simultaneous spin flip.
  It remains to estimate all terms that can see the wall, including saved scalar increments. Every such source footprint contains the mark and reaches the boundary region. At scale $j$ its carrier length is therefore at least $c n \/ r_j$. The deterministic weighted source transport costs a fixed factor $K$ per step, even with arbitrary principal background sizes: selected averages are normalized, retained large terms do not enlarge a source norm, and the small-field coefficient sums are bounded. This is the source estimate of Section 4 applied without averaging over the randomness. Keep an additional exponential carrier weight. At each possible scale of first boundary contact it supplies $exp \( - c' n \/ r_j \)$. Sum these contributions, retaining the source rescaling up to $J_n$; changing $K$ absorbs both that rescaling and the sum over the possible first-contact steps. The total deterministic cost at the stopping scale is at most
  #[#set math.equation(numbering: n => "(9.19)")
   $ C K^(J_n) exp \( - c' n \/ r_(J_n) \) lt.eq exp #scale(x: 120%, y: 120%)[\(] C log n - c'' \( log n \)^2 #scale(x: 120%, y: 120%)[\)] . $ <read:boundary-tail>]
  One can equivalently subtract the plane and finite-box constructions: the first coefficient where they differ must have a footprint meeting the wall, and each later difference is transported with the same weighted estimate. This verifies the bound for all nonbulk coefficients without assuming that their laws agree with plane laws. For an odd scalar the carrier weight is used before its support is forgotten, so (9.19) includes all nonzero scalar contributions. Initial fixed constants merely change $C$.
  The exact normalized one-source identity now expresses the plus magnetization, multiplied by $r_(J_n)^d$, as the terminal expectation of the scaled source plus its saved scalar. Its absolute value is bounded by the total sup costs just estimated, irrespective of the terminal background. Hence, for some fixed $M < oo$,
  $ ∥chevron.l sigma_y chevron.r_(n \, * \, omega)^(+)∥_(L^400) lt.eq r_(J_n)^(- d) (C \( 1 + J_n \)^M + C K^(J_n) e^(- c' n \/ r_(J_n))) = n^(- d + o \( 1 \)) . $
  Raising this inequality to the power $400$ proves (9.17). Translating the box changes none of the constants because the source estimates are uniform in its mark. Moving the wall by a bounded number of lattice layers changes the lower bound on the boundary-reaching carrier length only by a fixed factor, proving the remaining conventions. ◻
]

In particular the averaged plus magnetization vanishes at tuning. The next section uses the stronger finite-box bound (9.17) to identify the tuned parameter and to show that magnetization becomes positive above it.

== 10 Identification of the physical transition <sec:transition>

The construction in Proposition 24 selects a parameter $t_(*) = t_(*) \( D \)$, and Propositions 31 and 32 give correlation moments and a wired one-arm estimate there. We now show that $t_(*) = 0$ and that this value is the magnetization threshold. The first assertion uses partition functions on tori and a product-space influence inequality. The second uses the high moment in Proposition 32 to control a decision-tree exploration in a fixed environment.

For a finite graph $G = \( V \, E \)$, put $v_e = e^(2 K_e) - 1$ and write

#[#set math.equation(numbering: n => "(10.1)")
 $ phi.alt_(G \, t \, omega) \( A \) = 1 / cal(Z)_(G \, t \, omega) 2^(k \( A \)) product_(e in A) v_e \, #h(2em) A subset E . $ <crit:fk-law>]

Here $k \( A \)$ counts components of the spanning subgraph $\( V \, A \)$; a specified boundary wiring is imposed before counting components. Superscripts $upright(f)$ and $upright(w)$ indicate free and wired boundaries. All these probabilities are normalized at fixed $omega$. The Edwards–Sokal coupling [12] identifies the wired connection probability to the boundary with the corresponding plus-boundary spin expectation. In infinite volume it gives

#[#set math.equation(numbering: n => "(10.2)")
 $ chevron.l sigma_0 chevron.r_(t \, omega)^(+) = phi.alt_(t \, omega)^(upright(w)) \( 0 arrow.l.r oo \) . $ <crit:magnetization>]

Finite-energy bounds, positive association, and comparison in the couplings hold uniformly on any fixed compact $\( t \, D \)$ window considered below. In particular, for some $eta > 0$, every one-edge conditional open probability, with any other edges prescribed, lies in $\[ eta \, 1 - eta \]$. This follows directly from (10.1): that probability is either $v_e \/ \( 1 + v_e \)$ or $v_e \/ \( 2 + v_e \)$.

=== 10.1 Torus duality and twisted partition functions <torus-duality-and-twisted-partition-functions>

Let $bb(T)_ell = \( bb(Z) \/ ell bb(Z) \)^2$ have its usual square cellulation. For $A subset E \( bb(T)_ell \)$, let $H \( A \) subset H_1 \( bb(T)_ell \; bb(F)_2 \) = bb(F)_2^2$ be the image of its cycle space, and put $r \( A \) = dim H \( A \)$. The complementary dual configuration $A^(*)$ contains the dual of each edge outside $A$. For each nonzero character $chi : bb(F)_2^2 arrow.r bb(F)_2$, define the increasing, translation-invariant event

$ cal(H)_chi = { A : chi \|_(H \( A \)) eq.not 0 } . $

Thus $cal(H)_chi$ asks for an open cycle detected by $chi$.

#thm([Lemma 10.1.])[
  (Torus duality).  #emph[Under the intersection pairing, 
#[#set math.equation(numbering: n => "(10.3)")
 $ H \( A^(*) \) = H \( A \)^perp \, #h(2em) r \( A^(*) \) = 2 - r \( A \) . $ <crit:homology-annihilator>]

 If $v_(e^(*))^(*) = 2 \/ v_e$, then complement duality carries the torus FK law at $v$ to a measure whose density with respect to the torus FK law at $v^(*)$ lies between $1 \/ 4$ and $4$.]
] <crit:torus-duality>

#proof[
  The cycle space of $\( V \, A \)$ has dimension $\| A \| - \| V \| + k \( A \)$. A cellular boundary is supported on $A$ precisely when its face coefficients are constant on each complementary dual component. The space of such boundaries therefore has dimension $k \( A^(*) \) - 1$: its face coefficients have $k \( A^(*) \)$ degrees of freedom, and adding the constant two-chain does not change the boundary. Consequently
  #[#set math.equation(numbering: n => "(10.4)")
   $ \| A \| - \| V \| + k \( A \) = k \( A^(*) \) - 1 + r \( A \) . $ <crit:euler>]
  Apply the same identity on the dual cellulation and add the two identities. The torus Euler formula $\| V \| - \| E \| + \| F \| = 0$ gives $r \( A \) + r \( A^(*) \) = 2$. Primal and complementary dual cycles have zero intersection, since a primal edge and its transverse dual cannot both be present. This inclusion, together with the dimension identity, proves (10.3).
  The ratio of the two unnormalized weights is
  $ frac(2^(k \( A \)) product_(e in A) v_e, 2^(k \( A^(*) \)) product_(e in.not A) \( 2 \/ v_e \)) & = #scale(x: 180%, y: 180%)[\(] product_(e in E) v_e #scale(x: 180%, y: 180%)[\)] 2^(k \( A \) - k \( A^(*) \) - \| E \| + \| A \|)\
 & = #scale(x: 180%, y: 180%)[\(] product_(e in E) v_e #scale(x: 180%, y: 180%)[\)] 2^(\| V \| - \| E \| - 1) thin 2^(r \( A \)) \, $
  where the last equality uses (10.4). The first factor is independent of $A$, and $1 lt.eq 2^(r \( A \)) lt.eq 4$. Normalization proves the claimed comparison. ◻
]

Choose signs $s_e^chi in { - 1 \, 1 }$ representing the cocycle $chi$, and let $Z^chi \( K \)$ be the Ising partition function with interactions $K_e s_e^chi sigma_x sigma_y$. Write $Z^0 \( K \)$ for the ordinary partition function. Expanding

$ e^(K_e s_e^chi sigma_x sigma_y) = e^(- K_e) #scale(x: 120%, y: 120%)[\(] 1 + v_e upright(bold(1))_({ sigma_x = s_e^chi sigma_y }) #scale(x: 120%, y: 120%)[\)] $

shows that a component of $A$ contributes two compatible spin assignments exactly when the product of seam signs around each of its cycles is $1$. An incompatible component contributes zero. Hence, for every environment, not only after averaging,

#[#set math.equation(numbering: n => "(10.5)")
 $ frac(Z^chi \( K \), Z^0 \( K \)) = phi.alt_(bb(T)_ell \, t \, omega) \( cal(H)_chi^c \) . $ <crit:twist-identity>]

At the critical reference couplings there is $a_0 > 0$, independent of $ell$, such that

#[#set math.equation(numbering: n => "(10.6)")
 $ a_0 lt.eq phi.alt_(bb(T)_ell)^(upright("ref")) \( cal(H)_chi \) lt.eq 1 - a_0 #h(2em) \( chi eq.not 0 \) . $ <crit:reference-homology>]

For completeness, choose a coordinate generator on which $chi$ is nonzero. In a narrow toric strip along that generator, a bounded number of overlapping fixed-aspect rectangle crossings, with transverse crossings in their overlaps, produces an open generator cycle. The arbitrary-boundary crossing bounds of [6] Theorem 1.1, applied in the rectangular charts, and FK positive association give a uniform lower bound. Make both generator cycles in the dual configuration in the same way. Their homology has rank two, so (10.3) forces $H \( A \) = 0$. Lemma 33 compares the complemented law with the critical dual FK law by an absolute factor. This proves the upper bound in (10.6). Only finitely many crossings are used, so their lower bounds do not deteriorate with $ell$.

#thm([Lemma 10.2.])[
  (Transfer of torus nondegeneracy).  #emph[Fix a sufficiently large integer $Q$. After choosing the smallness constants of the construction sufficiently small, there is $a_1 > 0$ such that, for $ell_J = Q r_J$ and every nonzero $chi$, 
#[#set math.equation(numbering: n => "(10.7)")
 $ a_1 lt.eq bb(E) phi.alt_(bb(T)_(ell_J) \, t_(*) \, omega) \( cal(H)_chi \) lt.eq 1 - a_1 $ <crit:tuned-homology>]

 for all sufficiently large $J$.]
] <crit:torus-transfer>

#proof[
  Apply the exact finite-volume map of Proposition 12 to the untwisted model and to the $chi$-twisted model, using the corresponding critical reference partition function in each case and the same decision seeds. A twist is removed on a contractible chart by a spin gauge transformation. Every background function is even, so the ambiguity of a simultaneous sign change on the chart does not alter it. Conditional reference averaging, the local decisions, and plane centering in this gauge therefore give identical chart coefficients and identical saved scalar increments in the two runs.
  Here is why the errors outside charts remain uniform in $J$. Choose $Q$ larger than the fixed halos and chart margins in the construction. A principal output uses only a short parent footprint, by Lemma 7. That footprint lifts to the plane at every scale up to $J$, and its environment and seeds have the planar law. A nonchart footprint has length at least $c m$ when the torus has side $m$ at the scale carrying that footprint. Changing between input and output cells changes this constant by the fixed factor $L$ only. It cannot satisfy the short-footprint rule for a principal output. This also proves that a seam crossing a short footprint causes no exception: it is removed by the local gauge, whereas a genuinely nonchart input remains in the tail.
  Keep the scalar supports until applying the enhanced tree weights in Lemma 9 and Corollary 10. Summing the possible nonchart footprints, including the neighborhoods used by the decisions, bounds the uncancelled scalar increment at this step by
  $ C_L delta m^2 e^(- c m) . $
  There are $O \( m^2 \)$ possible roots; the additional length weight pays $e^(- c m)$ after the animal sum. The side lengths $m$ decrease geometrically and remain at least $Q$, so their total is bounded by $C_L delta Q^2 e^(- c' Q)$, independently of $J$. The final tail functions have total supremum norm at most $C delta Q^2$. These estimates use the finite-volume weighted bounds before forgetting supports, and apply also to normalized conditional operations on nonchart terms.
  To see precisely how these errors enter the desired ratio, let $c_J^chi \, H_J^chi$ denote the accumulated scalar and terminal background for a twist, and use superscript $0$ for the untwisted run. Exact partition preservation gives
  #[#set math.equation(numbering: n => "(10.8)")
   $ frac(Z^chi \( K \), Z^0 \( K \)) = frac(Z^chi \( K^(upright("ref")) \), Z^0 \( K^(upright("ref")) \)) e^(c_J^chi - c_J^0) frac(chevron.l e^(H_J^chi) chevron.r_(J \, upright("ref") \, chi), chevron.l e^(H_J^0) chevron.r_(J \, upright("ref") \, 0)) . $ <crit:terminal-ratio>]
  The brackets are normalized terminal reference expectations in the respective exact partition identities. Chart scalar increments cancel in $c_J^chi - c_J^0$, leaving the nonchart bound above. At the final scale there are only $O \( Q^2 \)$ principal slots. Their laws agree in charts with the planar laws, so the high-moment bounds along the tuned flow imply that their total supremum norm converges to zero in probability as $J arrow.r oo$. Denote this total, in the two runs together, by $P_J$. Exact partition preservation and $\| log chevron.l e^H chevron.r \| lt.eq ∥H∥_oo$ now give
  #[#set math.equation(numbering: n => "(10.9)")
   $ lr(|log frac(Z^chi \( K \) \/ Z^0 \( K \), Z^chi \( K^(upright("ref")) \) \/ Z^0 \( K^(upright("ref")) \))|) lt.eq P_J + C delta Q^2 + C_L delta Q^2 e^(- c' Q) \, #h(2em) P_J arrow.r^(bb(P)) 0 . $ <crit:log-ratio-transfer>]
  The reference ratios here are on the same microscopic torus; exact blocking has not replaced them by a limiting torus ratio. First fix $Q$, then choose $delta$ and the permitted disorder so that the deterministic errors are smaller than a fixed tolerance depending on $a_0$, and finally let $J$ grow. By (10.5) and (10.6), on an event of probability tending to one all three tuned character probabilities lie in a common compact subinterval of $\( 0 \, 1 \)$. Their values always lie in $\[ 0 \, 1 \]$, so averaging proves (10.7). ◻
]

=== 10.2 Sharp thresholds after averaging the environment <sharp-thresholds-after-averaging-the-environment>

We next prove the threshold estimate needed for the torus events. The environment is independent across bonds, but the FK edges are not. A monotone sequential representation lets us apply the product influence theorem while keeping the useful derivative as a quenched covariance.

#thm([Lemma 10.3.])[
  (Torus threshold inequality).  #emph[Fix a compact parameter window containing $0$ and $t_(*) \( D \)$, with uniformly positive, bounded couplings. If $cal(A)$ is any increasing translation-invariant event on $bb(T)_ell$ and $f_ell \( t \) = bb(E) phi.alt_(bb(T)_ell \, t \, omega) \( cal(A) \)$, then 
#[#set math.equation(numbering: n => "(10.10)")
 $ f'_ell \( t \) gt.eq c log ell thin f_ell \( t \) \( 1 - f_ell \( t \) \) \, #h(2em) ell gt.eq 3 \, $ <crit:threshold-inequality>]

 with $c > 0$ independent of $ell$ and $cal(A)$.]
] <crit:threshold>

#proof[
  For a fixed environment abbreviate its FK law to $phi.alt$, and set $X_e = upright(bold(1))_({ e in A })$ and $c_e \( omega \) = "Cov"_(phi.alt_(t \, omega)) \( upright(bold(1))_(cal(A)) \, X_e \) gt.eq 0$. Differentiating the finite sum in (10.1) gives
  #[#set math.equation(numbering: n => "(10.11)")
   $ f'_ell \( t \) = sum_e bb(E) \[ lambda_e \( t \, omega \) c_e \( omega \) \] \, #h(2em) lambda_e = frac(thin upright(d), thin upright(d) t) log v_e . $ <crit:derivative>]
  Since $thin upright(d) K_e \/ thin upright(d) t = 1 / 2 tanh \( 2 K_e \)$, the coefficients $lambda_e = tanh \( 2 K_e \) e^(2 K_e) \/ \( e^(2 K_e) - 1 \)$ have uniform positive lower and upper bounds.
  Represent each environment bit by a uniform variable $V_e$, with $xi_e = 1$ when $V_e gt.eq 1 \/ 2$. Order the FK edges arbitrarily as $e_1 \, dots.h \, e_M$ and use further independent uniforms $U_i$ to set
  $ X_(e_i) = upright(bold(1))_({ U_i gt.eq 1 - p_i }) \, #h(2em) p_i = phi.alt_(t \, omega) \( X_(e_i) = 1 divides X_(e_1) \, dots.h \, X_(e_(i - 1)) \) . $
  The conditional FK laws are increasing both in the prescribed past and in the couplings. Induction in $i$ therefore makes the entire sample increasing in all the $U_i$ and $V_e$. Let $F$ be the Boolean indicator of $cal(A)$ in this product representation. For one uniform coordinate $z$, its influence $I_z$ is the probability, over all other coordinates, that the section of $F$ in $z$ has values zero and one on sets of positive Lebesgue measure.
  We first bound an FK-uniform influence. Fix the environment and let $P = \( X_(e_1) \, dots.h \, X_(e_(i - 1)) \)$ be the past. Write
  $ p \( P \) = phi.alt \( X_(e_i) = 1 divides P \) \, #h(2em) a_b \( P \) = phi.alt \( cal(A) divides P \, X_(e_i) = b \) \, quad b = 0 \, 1 . $
  The future uniforms couple the two branches monotonically. As both intervals for $X_(e_i)$ have length at least $eta$, the section in $U_i$ is nonconstant exactly when the two resulting Boolean outputs differ. Averaging those future uniforms gives $a_1 \( P \) - a_0 \( P \)$. Consequently
  #[#set math.equation(numbering: n => "(10.12)")
   $ I_(U_i) & = bb(E) thin phi.alt #scale(x: 120%, y: 120%)[\(] a_1 \( P \) - a_0 \( P \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq frac(1, eta \( 1 - eta \)) bb(E) thin phi.alt #scale(x: 120%, y: 120%)[\(] "Cov"_phi.alt \( upright(bold(1))_(cal(A)) \, X_(e_i) divides P \) #scale(x: 120%, y: 120%)[\)] lt.eq C bb(E) c_(e_i) \( omega \) . $ <crit:uniform-influence>]
  For the last inequality, total covariance gives an additional term
  $ "Cov"_phi.alt #scale(x: 120%, y: 120%)[\(] phi.alt \( cal(A) divides P \) \, phi.alt \( X_(e_i) = 1 divides P \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Both functions are increasing in $P$, and the marginal distribution of $P$ is positively associated. This proves the indicated sign.
  For the environment coordinate $V_e$, condition on every other bond. Let $phi.alt_(-)$ and $phi.alt_(+)$ be the FK laws with its low and high value, and put $R = v_e^(+) \/ v_e^(-) gt.eq 1$. Changing this bond multiplies the weight by $R^(X_e)$, so direct normalization gives
  #[#set math.equation(numbering: n => "(10.13)")
   $ phi.alt_(+) \( cal(A) \) - phi.alt_(-) \( cal(A) \) = frac(\( R - 1 \) "Cov"_(phi.alt_(-)) \( upright(bold(1))_(cal(A)) \, X_e \), 1 + \( R - 1 \) phi.alt_(-) \( X_e \)) . $ <crit:bond-tilt>]
  Monotonicity of the common-uniform coupling makes the left side the conditional influence of $V_e$. The ratio $R$ is uniformly bounded. After averaging the other bonds, the low-bond covariance is at most twice $bb(E) c_e \( omega \)$, since both low- and high-bond covariances are nonnegative. Thus $I_(V_e) lt.eq C bb(E) c_e \( omega \)$ as well.
  Translation invariance of the averaged law and of $cal(A)$ makes $bb(E) c_e \( omega \)$ constant within each of the two edge orientations. Each orientation has $ell^2$ edges. Equation (10.11) therefore implies
  #[#set math.equation(numbering: n => "(10.14)")
   $ max_z I_z lt.eq C ell^(- 2) f'_ell \( t \) . $ <crit:max-influence>]
  There is no symmetry requirement on the chosen ordering or the sequential sampler: only the averaged covariances were compared by translation. There are $N = 2 M = 4 ell^2$ product coordinates. The BKKKL inequality [3], in the null-set-invariant formulation [15] Theorem 2.3 and Equation (2.3), gives
  $ max_z I_z gt.eq c f_ell \( t \) \( 1 - f_ell \( t \) \) frac(log N, N) . $
  Combine this with (10.14) to obtain (10.10). ◻
]

#thm([Proposition 10.4.])[
  #emph[For every sufficiently small fixed $D > 0$, the tuned parameter is $t_(*) \( D \) = 0$.]
] <crit:tuning-zero>

#proof[
  The dual transformation $v_(e^(*))^(*) = 2 \/ v_e$ is equivalent to $sinh \( 2 K_e \) sinh \( 2 K_(e^(*))^(*) \) = 1$. Thus, in the coordinates (1.6), it sends $\( t \, D \, xi \)$ to $\( - t \, D \, - xi \)$ on the dual lattice. At $t = 0$ the environment law is invariant. Write $a_i = bb(E) phi.alt_(bb(T)_ell \, 0 \, omega) \( r \( A \) = i \)$. Lemma 33 gives $a_0 \/ 4 lt.eq a_2 lt.eq 4 a_0$. In particular, $a_1 + a_2 gt.eq 1 \/ 5$ and $a_0 + a_1 gt.eq 1 \/ 5$.
  There are three nonzero characters of $bb(F)_2^2$. A one-dimensional homology space is detected by two of them, whereas a two-dimensional space is detected by all three. Therefore
  $ sum_(chi eq.not 0) bb(E) phi.alt_(0 \, omega) \( cal(H)_chi \) & = 2 a_1 + 3 a_2 \,\
sum_(chi eq.not 0) bb(E) phi.alt_(0 \, omega) \( cal(H)_chi^c \) & = 3 a_0 + a_1 . $
  It follows that at $t = 0$ at least one character has probability bounded below by an absolute positive constant, and at least one has probability bounded away from one. The two characters need not be the same.
  Apply Lemma 35 to each $cal(H)_chi$ along $ell_J = Q r_J$. On $\( 0 \, 1 \)$ it states
  $ frac(thin upright(d), thin upright(d) t) log frac(f_(ell_J) \( t \), 1 - f_(ell_J) \( t \)) gt.eq c log ell_J . $
  If $t_(*) > 0$, integrate from $0$ to $t_(*)$ and use the upper bound in (10.7). Every character probability at zero would tend to zero. If $t_(*) < 0$, integrate from $t_(*)$ to zero and use the lower bound in (10.7); every character probability at zero would tend to one. Both conclusions contradict the preceding absolute bounds. Hence $t_(*) = 0$. ◻
]

=== 10.3 Arm decay below zero and percolation above zero <arm-decay-below-zero-and-percolation-above-zero>

Proposition 32 and Proposition 36 already imply zero plus magnetization at $t = 0$. The next argument extracts a stronger consequence strictly below zero. It applies the monotone OSSS inequality in each good environment, so it does not require a sharpness theorem for a translation-invariant deterministic coupling field.

#thm([Lemma 10.5.])[
  (Averaged subcritical arm bound).  #emph[For every fixed $t' < 0$ in the parameter window and sufficiently small fixed $D > 0$, 
#[#set math.equation(numbering: n => "(10.15)")
 $ bb(E) phi.alt_(t' \, omega)^(upright(w)) \( 0 arrow.l.r partial Lambda_n \) lt.eq C_(t' \, D) n^(- 6) . $ <crit:subcritical-decay>]

]
] <crit:subcritical-arm>

#proof[
  Put $m = floor.l n^(1 \/ 2) floor.r$ and, for $z in Lambda_(2 n)$, define
  $ q_z \( omega \) = phi.alt_(z + Lambda_m \, 0 \, omega)^(upright(w)) \( z arrow.l.r z + partial Lambda_m \) . $
  Use the wall convention of Proposition 32; shifting the wall one lattice step does not affect its uniform estimate. Let $cal(G)_n = { q_z lt.eq n^(- 1 \/ 50) upright(" for every ") z in Lambda_(2 n) }$. Markov’s inequality, the $400$th moment in Proposition 32, and a union bound give
  #[#set math.equation(numbering: n => "(10.16)")
   $ bb(P) \( cal(G)_n^c \) & lt.eq C n^2 n^(400 \/ 50) m^(- 400 \/ 8 + o \( 1 \)) = n^(- 15 + o \( 1 \)) lt.eq C n^(- 6) . $ <crit:exception>]
  All boxes use the same global environment; independence of these box events is unnecessary. On $cal(G)_n$, the same inequalities hold throughout $t in \[ t' \, 0 \]$ by monotonicity in $t$.
  Fix such an environment, and consider
  $ f_omega \( t \) = phi.alt_(Lambda_(4 n) \, t \, omega)^(upright(w)) \( cal(A)_n \) \, #h(2em) cal(A)_n = { 0 arrow.l.r partial Lambda_n upright(" by a path in ") Lambda_n } . $
  Choose $k$ uniformly from ${ 1 \, dots.h \, n }$, independently of the FK configuration. Explore all open components in $Lambda_n$ meeting its square shell $partial Lambda_k$, revealing all edges of the induced graph on $Lambda_n$ incident to the vertices reached. Retain their actual connectivity; the shell vertices are not identified with one another. Every path witnessing $cal(A)_n$ meets the chosen shell, and its whole open component is explored. Thus this algorithm determines $cal(A)_n$.
  For an edge $e = x y$ within $Lambda_n$, the chance that the chosen shell lies within distance $m + 2$ of $x$ or $y$ is at most $C m \/ n$. Otherwise, querying $e$ requires that one endpoint is already joined to the shell by a revealed open path, and hence has an open arm of radius $m$. The endpoint box is contained in $Lambda_(4 n)$. Conditional on all edges outside that box, the domain Markov property gives an induced boundary partition, dominated by full wiring. Its conditional arm probability is consequently at most $q_x$ or $q_y$, uniformly for $t in \[ t' \, 0 \]$. The revealment $delta_e \( t \)$ therefore satisfies
  #[#set math.equation(numbering: n => "(10.17)")
   $ max_e delta_e \( t \) lt.eq C \( n^(- 1 \/ 2) + n^(- 1 \/ 50) \) lt.eq C n^(- 1 \/ 50) . $ <crit:revealment>]
  Edges outside $Lambda_n$ are never queried.
  The monotone-measure OSSS inequality [11] Theorem 1.1, averaged over the independent choice of shell, gives
  $ f_omega \( t \) \( 1 - f_omega \( t \) \) lt.eq sum_e delta_e \( t \) "Cov"_(phi.alt_(Lambda_(4 n) \, t \, omega)^(upright(w))) \( upright(bold(1))_(cal(A)_n) \, X_e \) . $
  The shell construction is the exploration underlying [11] Lemma 3.2; here its revealment is bounded using the quenched local arms on $cal(G)_n$. Differentiating the FK weights as in (10.11) and using their positive lower derivative bound yields
  $ f'_omega \( t \) gt.eq c n^(1 \/ 50) f_omega \( t \) \( 1 - f_omega \( t \) \) . $
  The event that all four edges incident to zero are closed has probability at least $eta^4$, by sequential conditioning and finite energy. Hence $f_omega \( 0 \) lt.eq 1 - eta^4$. Integration of the preceding logit inequality gives
  $ f_omega \( t' \) lt.eq C exp { - c \| t' \| n^(1 \/ 50) } . $
  After averaging, (10.16) contributes at most $C n^(- 6)$. Finally, the restriction of the infinite wired law to this cylinder event is dominated by the wired law in $Lambda_(4 n)$, by domain comparison. This proves (10.15). ◻
]

#thm([Proposition 10.6.])[
  (Transition in the $\( t \, D \)$ coordinates).  #emph[For every sufficiently small fixed $D > 0$, the disorder-averaged plus magnetization vanishes at $t lt.eq 0$ and is positive at every $t > 0$.]
] <crit:identification>

#proof[
  At zero, Proposition 32 implies $bb(E) phi.alt_(Lambda_n \, 0 \, omega)^(upright(w)) \( 0 arrow.l.r partial Lambda_n \) arrow.r 0$ by Hölder’s inequality. Equations (10.2) and monotonicity give zero magnetization for $t lt.eq 0$.
  Fix $s > 0$ small enough that $- s$ lies in the parameter window. Planar free/wired duality sends the infinite free FK law at $\( s \, D \, xi \)$ to the infinite wired dual law at $\( - s \, D \, - xi \)$. This identity follows first from the finite planar bond expansion and then by taking free and wired limits; see also the boundary conventions in [6] Section 2.5. The dual environment still has the same independent binary law. Failure of a primal crossing of a fixed-aspect rectangle of diameter comparable to $n$ entails a dual crossing in the transverse direction, and hence a dual arm of length at least $c n$ from a vertex in that rectangle. There are $O \( n^2 \)$ possible vertices. Lemma 37, translated to each such vertex and applied at $- s$, therefore bounds the averaged failure probability by $C n^(- 4)$.
  For each $n = 2^k n_0$, use the four rectangular sides of $Lambda_(2 n) \\ Lambda_n$, each of width $n$ and length $4 n$. Their longitudinal crossings intersect in the corner squares and contain an open circuit surrounding $Lambda_n$. Require also a left–right crossing of $\[ n \/ 2 \, 5 n \] times \[ - n \/ 4 \, n \/ 4 \]$. Its initial point lies inside $Lambda_n$ and its endpoint lies outside $Lambda_(4 n)$, so it must intersect both this circuit and the circuit at scale $2 n$. Rounding rectangle endpoints by a lattice step is harmless; one may choose $n_0$ divisible by four. All aspect ratios are fixed and there are five requested crossings per scale. The probability that any of them fails is at most
  $ C sum_(k gt.eq 0) \( 2^k n_0 \)^(- 4) \, $
  which is smaller than one for large $n_0$. On the complementary event the joined circuits form an infinite open connected set. Thus the joint law obtained by first sampling the environment and then its infinite free FK configuration has positive probability of an infinite cluster. This joint law is translation stationary. If the origin had zero probability of belonging to an infinite cluster, every vertex would have probability zero, and countable subadditivity would exclude an infinite cluster anywhere. Hence the origin has positive connection probability. Wired domination and (10.2) give positive averaged plus magnetization at $s$. Monotonicity extends this conclusion to every $t > 0$. ◻
]

=== 10.4 The physical inverse temperature and the correlation ratio <the-physical-inverse-temperature-and-the-correlation-ratio>

We finish by matching the parameter just identified to the original bonds $1 + epsilon xi_e$. For $epsilon in \( 0 \, 1 \)$ define

$ b_plus.minus \( beta \, epsilon \) = log sinh #scale(x: 120%, y: 120%)[\(] 2 beta \( 1 plus.minus epsilon \) #scale(x: 120%, y: 120%)[\)] . $

The mean $\( b_(+) + b_(-) \) \/ 2$ is continuous and strictly increasing from $- oo$ to $+ oo$ as $beta$ runs through $\( 0 \, oo \)$. It has a unique zero $beta_(*) \( epsilon \)$, characterized by

#[#set math.equation(numbering: n => "(10.18)")
 $ sinh #scale(x: 120%, y: 120%)[\(] 2 beta_(*) \( epsilon \) \( 1 + epsilon \) #scale(x: 120%, y: 120%)[\)] sinh #scale(x: 120%, y: 120%)[\(] 2 beta_(*) \( epsilon \) \( 1 - epsilon \) #scale(x: 120%, y: 120%)[\)] = 1 . $ <crit:physical-equation>]

Continuity and strict monotonicity imply $beta_(*) \( epsilon \) arrow.r beta_0$ as $epsilon arrow.r 0$. At this parameter put

$ D_(*) \( epsilon \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] b_(+) \( beta_(*) \, epsilon \) - b_(-) \( beta_(*) \, epsilon \) #scale(x: 120%, y: 120%)[\)] . $

Then $D_(*) \( epsilon \) > 0$ for $epsilon > 0$ and $D_(*) \( epsilon \) arrow.r 0$. Choose $epsilon_0 > 0$ so that this value belongs to the permitted disorder interval whenever $0 < epsilon < epsilon_0$. At $beta_(*)$ the physical model is exactly $\( t \, D \) = \( 0 \, D_(*) \)$. Proposition 38 makes its magnetization zero; monotonicity gives the same conclusion below $beta_(*)$.

If $beta > beta_(*)$, both increments $b_plus.minus \( beta \, epsilon \) - b_plus.minus \( beta_(*) \, epsilon \)$ are strictly positive. Choose $s > 0$, inside the parameter window, smaller than their minimum. With the same environment, the physical couplings at $beta$ dominate those with log-sinh values $s + D_(*) xi_e$. The latter model has positive averaged magnetization by Proposition 38. Consequently

#[#set math.equation(numbering: n => "(10.19)")
 $ beta_c \( epsilon \) = beta_(*) \( epsilon \) \, #h(2em) m_epsilon \( beta_c \( epsilon \) \) = 0 . $ <crit:physical-beta>]

This comparison keeps $D_(*)$ fixed; no assumption about holding the physical log-sinh difference constant while varying $beta$ is used.

#proof[
  Fix $epsilon in \( 0 \, epsilon_0 \)$ and use $D = D_(*) \( epsilon \) > 0$. By (10.19) and Proposition 36, the tuned free infinite-volume correlation of Proposition 31 is $C_(epsilon \, omega) \( r \)$ at the physical critical inverse temperature. That proposition gives, at its stopping scale $J = log r \/ log L + O \( 1 \)$,
  $ r_J^(2 d) bb(E) C_(epsilon \, omega) \( r \) asymp 1 \, #h(2em) r_J^(4 d) bb(E) C_(epsilon \, omega) \( r \)^2 = J^(1 \/ 4 + o \( 1 \)) . $
  The factors $r_J^(4 d)$ cancel in the ratio of the second moment to the square of the first. Thus
  $ log R_epsilon \( r \) = \( 1 \/ 4 + o \( 1 \) \) log J + O \( 1 \) \, #h(2em) frac(log J, log log r) arrow.r 1 \, $
  which proves the asserted limit along all integer $r arrow.r oo$. The disorder remains fixed throughout this final limit. The thermodynamic limits and the separate Gibbs normalizations required in the definition of $R_epsilon$ are those already established in Proposition 31. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman and J.~Wehr, #emph[Rounding effects of quenched randomness on first-order phase transitions], Communications in Mathematical Physics #strong[130] (1990), 489--528. \
#link("https://doi.org/10.1007/BF02096933")[doi:10.1007/BF02096933].]
#bibitem([2])[G.~Antinucci, A.~Giuliani, and R.~L.~Greenblatt, #emph[Energy correlations of non-integrable Ising models: The scaling limit in the cylinder], Communications in Mathematical Physics #strong[397] (2023), 393--483. #link("https://doi.org/10.1007/s00220-022-04481-z")[doi:10.1007/s00220-022-04481-z].]
#bibitem([3])[J.~Bourgain, J.~Kahn, G.~Kalai, Y.~Katznelson, and N.~Linial, #emph[The influence of variables in product spaces], Israel Journal of Mathematics #strong[77] (1992), nos.~1--2, 55--64. #link("https://doi.org/10.1007/BF02808010")[doi:10.1007/BF02808010].]
#bibitem([4])[G.~Cava, A.~Giuliani, and R.~L.~Greenblatt, #emph[The scaling limit of boundary spin correlations in non-integrable Ising models], Journal of Mathematical Physics #strong[66] (2025), no.~2, 023301. #link("https://doi.org/10.1063/5.0235381")[doi:10.1063/5.0235381].]
#bibitem([5])[L.~Chayes and K.~Shtengel, #emph[Critical behavior for 2D uniform and disordered ferromagnets at self-dual points], Communications in Mathematical Physics #strong[204] (1999), 353--366. #link("https://doi.org/10.1007/s002200050649")[doi:10.1007/s002200050649]. #link("https://arxiv.org/abs/cond-mat/9811203")[arXiv:cond-mat/9811203].]
#bibitem([6])[D.~Chelkak, H.~Duminil-Copin, and C.~Hongler, #emph[Crossing probabilities in topological rectangles for the critical planar FK-Ising model], Electronic Journal of Probability #strong[21] (2016), paper no.~5, 1--28. #link("https://doi.org/10.1214/16-EJP3452")[doi:10.1214/16-EJP3452]. #link("https://arxiv.org/abs/1312.7785")[arXiv:1312.7785].]
#bibitem([7])[D.~Chelkak, C.~Hongler, and K.~Izyurov, #emph[Conformal invariance of spin correlations in the planar Ising model], Annals of Mathematics #strong[181] (2015), no.~3, 1087--1138. \
#link("https://doi.org/10.4007/annals.2015.181.3.5")[doi:10.4007/annals.2015.181.3.5].]
#bibitem([8])[D.~Chelkak, C.~Hongler, and K.~Izyurov, #emph[Correlations of primary fields in the critical Ising model], preprint, 2021; revised 23 February 2022, #link("https://arxiv.org/abs/2103.10263v2")[arXiv:2103.10263v2].]
#bibitem([9])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the phase transition in the 2D Ising model with impurities], Advances in Physics #strong[32] (1983), no.~2, 129--172. #link("https://doi.org/10.1080/00018738300101541")[doi:10.1080/00018738300101541].]
#bibitem([10])[H.~Duminil-Copin, C.~Hongler, and P.~Nolin, #emph[Connection probabilities and RSW-type bounds for the two-dimensional FK Ising model], Communications on Pure and Applied Mathematics #strong[64] (2011), no.~9, 1165--1198. #link("https://doi.org/10.1002/cpa.20370")[doi:10.1002/cpa.20370].]
#bibitem([11])[H.~Duminil-Copin, A.~Raoufi, and V.~Tassion, #emph[Sharp phase transition for the random-cluster and Potts models via decision trees], Annals of Mathematics #strong[189] (2019), no.~1, 75--99. #link("https://doi.org/10.4007/annals.2019.189.1.2")[doi:10.4007/annals.2019.189.1.2]. #link("https://arxiv.org/abs/1705.03104v2")[arXiv:1705.03104v2].]
#bibitem([12])[R.~G.~Edwards and A.~D.~Sokal, #emph[Generalization of the Fortuin--Kasteleyn--Swendsen--Wang representation and Monte Carlo algorithm], Physical Review D #strong[38] (1988), no.~6, 2009--2012. #link("https://doi.org/10.1103/PhysRevD.38.2009")[doi:10.1103/PhysRevD.38.2009].]
#bibitem([13])[C.~M.~Fortuin and P.~W.~Kasteleyn, #emph[On the random-cluster model: I. Introduction and relation to other models], Physica #strong[57] (1972), no.~4, 536--564. #link("https://doi.org/10.1016/0031-8914(72)90045-6")[doi:10.1016/0031-8914(72)90045-6].]
#bibitem([14])[A.~Giuliani, R.~L.~Greenblatt, and V.~Mastropietro, #emph[The scaling limit of the energy correlations in non-integrable Ising models], Journal of Mathematical Physics #strong[53] (2012), no.~9, 095214. #link("https://doi.org/10.1063/1.4745910")[doi:10.1063/1.4745910].]
#bibitem([15])[G.~R.~Grimmett, S.~Janson, and J.~R.~Norris, #emph[Influence in product spaces], Advances in Applied Probability #strong[48] (2016), special issue~A, 145--152. #link("https://doi.org/10.1017/apr.2016.46")[doi:10.1017/apr.2016.46]. #link("https://arxiv.org/abs/1207.1780v2")[arXiv:1207.1780v2].]
#bibitem([16])[A.~B.~Harris, #emph[Effect of random defects on the critical behaviour of Ising models], Journal of Physics C: Solid State Physics #strong[7] (1974), no.~9, 1671--1692. #link("https://doi.org/10.1088/0022-3719/7/9/009")[doi:10.1088/0022-3719/7/9/009].]
#bibitem([17])[A.~W.~W.~Ludwig, #emph[Infinite hierarchies of exponents in a diluted ferromagnet and their interpretation], Nuclear Physics B #strong[330] (1990), nos.~2--3, 639--680. #link("https://doi.org/10.1016/0550-3213(90)90126-X")[doi:10.1016/0550-3213(90)90126-X].]
#bibitem([18])[R.~O'Donnell, M.~Saks, O.~Schramm, and R.~A.~Servedio, #emph[Every decision tree has an influential variable], Proceedings of the 46th Annual IEEE Symposium on Foundations of Computer Science (2005), 31--39. #link("https://doi.org/10.1109/SFCS.2005.34")[doi:10.1109/SFCS.2005.34]. #link("https://arxiv.org/abs/cs/0508071")[arXiv:cs/0508071].]
#bibitem([19])[OpenAI, #emph[Conformal universality of bulk Ising correlations under weak interactions], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Conformal-universality-of-bulk-Ising-correlations-under-weak-interactions-September-23-2026/paper.pdf")[OAI:Conformal-universality-of-bulk-Ising-correlations-under-weak-interactions-September-23-2026], 2026. Theorem~1.1; Lemmas~2.1, 3.3, 4.5, and~5.3; Corollary~2.2; Propositions~4.1, 5.2, and~5.4; Equation~(5.18).]
#bibitem([20])[B.~N.~Shalaev, #emph[Correlation function and susceptibility of a two-dimensional Ising model with impurities], Fizika Tverdogo Tela #strong[26] (1984), no.~10, 3002--3005 (in Russian).]
#bibitem([21])[R.~Shankar, #emph[Exact critical behavior of a random bond two-dimensional Ising model], Physical Review Letters #strong[58] (1987), 2466--2469; erratum, #strong[59] (1987), 380. #link("https://doi.org/10.1103/PhysRevLett.58.2466")[doi:10.1103/PhysRevLett.58.2466]\; #link("https://doi.org/10.1103/PhysRevLett.59.380.2")[doi:10.1103/PhysRevLett.59.380.2].]


