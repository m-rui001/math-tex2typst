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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp mass bounds for the two-dimensional O(4) model]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $Lambda_(n \, w) = \( bb(Z) \/ n bb(Z) \) times \( bb(Z) \/ w bb(Z) \)$ be a periodic square-lattice rectangle, and assign a spin $sigma_x in S^3 subset bb(R)^4$ to each site. We use normalized sphere measure $thin upright(d) omega$ and the probability law

#[#set math.equation(numbering: n => "(1.1)")
 $ thin upright(d) mu_(beta \; n \, w) \( sigma \) = Z_beta \( n \, w \)^(- 1) exp (beta sum_(chevron.l x y chevron.r) sigma_x dot.op sigma_y) product_(x in Lambda_(n \, w)) thin upright(d) omega \( sigma_x \) . $ <eq:measure>]

Every unoriented nearest-neighbor bond is counted once. Periods are even and at least four. Equivalently, the action, up to a constant, is $beta / 2 sum_(chevron.l x y chevron.r) \| sigma_x - sigma_y \|^2$. The parameter $beta > 0$ is the bare inverse coupling. The number four refers to the internal spin space; spacetime is two-dimensional.

The principal question is how rapidly the model loses memory over long spatial separations. Three assertions must be distinguished: absence of magnetization, exponential decay of a particular spin correlation, and a positive gap for the full transfer operator. The third concerns every local observable, including the rotation-invariant bond energy $sigma_x dot.op sigma_y$. Its low-temperature scale is the subject of this paper.

The absence of ordinary ordering in two dimensions is a classical consequence of continuous symmetry. Mermin and Wagner established the foundational nonordering result for quantum Heisenberg systems, and Mermin gave the corresponding classical argument #cite(label("MW")) #cite(label("Mermin1967")). McBryan and Spencer obtained quantitative algebraic upper bounds by complex spin rotations #cite(label("McBryanSpencer")); later extensions substantially weakened the regularity assumptions on the interaction #cite(label("GagnebinVelenik")). These results leave open whether the decay is exponential. For two spin components the distinction is essential: the low-temperature phase predicted by Berezinskii, Kosterlitz and Thouless and established rigorously by Fröhlich and Spencer has no positive exponential spin-decay rate #cite(label("Berezinskii")) #cite(label("KosterlitzThouless")) #cite(label("FS")).

At sufficiently high temperature, local Ward inequalities give exponential spin-correlation decay #cite(label("AizenmanSimonWard")) Theorem 3.2. For non-Abelian sigma models, perturbative renormalization further predicts asymptotic freedom and mass generation #cite(label("Polyakov")) #cite(label("BrezinZinnJustin")) #cite(label("BrezinZinnJustinLeGuillou")). In the normalization (1.1), the predicted $O \( 4 \)$ inverse length is $sqrt(beta) e^(- pi beta)$. Bethe-Ansatz and $S$-matrix calculations of the exact continuum mass for $O \( 3 \)$ and $O \( 4 \)$, and subsequently general $O \( n \)$, provide a complementary description #cite(label("HasenfratzMaggioreNiedermayer")) #cite(label("HasenfratzNiedermayer")). They concern a continuum theory and its renormalization scale; they do not by themselves prove a gap for the specified lattice model or its convergence to that theory. The all-temperature lattice decay question is recorded as open in the 2025 account of Aru, Garban and Sepúlveda #cite(label("AGS")) Section 1. We address the $O \( 4 \)$ model with its full local-observable transfer spectrum and keep the continuum issue separate.

OpenAI #cite(label("OpenAIClassicalONDecay")) Theorem 1.1 and Corollary 1.2 proves exponential spin-correlation decay for each fixed integer internal spin dimension at least three and each finite $beta > 0$. The bounds are uniform over finite free-boundary nearest-neighbor square-lattice subgraphs with edge strengths in $\[ 0 \, beta \]$ and pass to subsequential local weak limits of free boxes with constant strength $beta$. They neither identify these limits with the periodic state used here nor assert a full local-observable transfer gap.

The reflected Hilbert-space construction originates in the work of Osterwalder and Schrader #cite(label("OS73")) #cite(label("OS75")); the elementary discrete construction needed here is given in Section 3.12.2. Reflection positivity associates to a periodic thermodynamic limit a Hilbert space, a vacuum vector $Omega$, and a positive one-step translation contraction $T_beta$, with $T_beta Omega = Omega$. The Hilbert space is the completion of local observables on a time half-space under their reflected two-point form. Define the full mass gap by

#[#set math.equation(numbering: n => "(1.2)")
 $ m_(upright("lat")) \( beta \) = - log ∥T_beta \|_(Omega^perp)∥ . $ <eq:mass-definition>]

This definition includes every sector generated by local observables, including invariant observables such as bond energies. A spin two-point estimate alone would not prove a lower bound for this gap. We abbreviate the natural inverse length by $rho \( beta \) = sqrt(beta) e^(- pi beta)$.

The theorem also gives bounds in terms of a coarse lattice. The block transformation used below introduces a unit spin for each $L times L$ block through a normalized probability kernel, and then integrates the finer spins exactly. After $N$ steps, one coarse lattice spacing represents $L^N$ microscopic spacings. The negative logarithm of the resulting density is its effective action. The #emph[kinetic coupling] is the bulk coefficient extracted from the quadratic cost of a slowly varying spin configuration in that action, in the same inverse-coupling convention as $beta$. At the initial step it is $beta$. The #emph[terminal coupling] is its value when blocking stops.

#thm([Theorem 1.1.])[
  #emph[There are finite constants $beta_0 \, c \, C$, with $0 < c < C$, such that for every $beta gt.eq beta_0$ the periodic square measures have a unique local limit, and its full transfer gap satisfies 
#[#set math.equation(numbering: n => "(1.3)")
 $ c sqrt(beta) thin e^(- pi beta) lt.eq m_(upright("lat")) \( beta \) lt.eq C sqrt(beta) thin e^(- pi beta) . $ <eq:target>]

 There are also a fixed dyadic blocking factor $L$, a fixed large terminal coupling $H$, and finite integers $N_0 \, M_0$ with the following property. For every $N gt.eq N_0$ one can choose a bare coupling $beta_N$ whose exact $N$-step block transformation has terminal kinetic coupling $H$, and 
#[#set math.equation(numbering: n => "(1.4)")
 $ frac(log 2, M_0 L^N) lt.eq m_(upright("lat")) \( beta_N \) lt.eq frac(log 8, L^N) . $ <eq:depth-bounds>]

 The same bounds hold uniformly for terminal couplings in a fixed small interval about $H$, after increasing $M_0$ and $N_0$ if necessary.]
] <thm:main>

#thm([Corollary 1.2.])[
  (Full gap at every positive temperature).  #emph[For every finite $beta > 0$, the measures (1.1) on periodic squares have a unique local limit. There are absolute constants $c \, C > 0$ such that its full transfer gap obeys 
$ m_(upright("lat")) \( beta \) gt.eq c exp { - pi beta - C sqrt(\( 1 + beta \) log \( 2 + beta \)) } > 0 . $

]
] <cor:all-temperature>

Corollary 2 follows from the preliminary all-observable mixing estimate in Section 3, without using the sharp-scale comparison. Uniqueness here refers to the periodic local limit; no assertion about every nonperiodic Gibbs state is included. For the $O \( 4 \)$ periodic state this gives a positive resolution of the all-temperature lattice mass-generation conjecture discussed above. Theorem 1 gives two-sided order bounds, not an exact asymptotic prefactor.

In particular, fix a positive physical reference length $ell_(upright("ref"))$ and declare that $L^N$ microscopic steps have this length. The lattice spacing is $a_N = ell_(upright("ref")) L^(- N)$. Equation (1.4) gives

#[#set math.equation(numbering: n => "(1.5)")
 $ frac(log 2, M_0 ell_(upright("ref"))) lt.eq frac(m_(upright("lat")) \( beta_N \), a_N) lt.eq frac(log 8, ell_(upright("ref"))) . $ <eq:physical-main>]

The units have been fixed by the block scale and terminal coupling, independently of the mass. Up to bounded positive multiplicative factors, the two-loop calculation identifies this choice with the natural asymptotically free scale for (1.1). These are bounds for the cutoff theories; neither convergence of their masses nor existence of a continuum theory is assumed.

=== 1.1 Methods and their relation to earlier work <methods-and-their-relation-to-earlier-work>

The proof joins three traditions. Local rotation identities turn continuous symmetry into estimates on current fluctuations, as in the classical Ward-identity approach #cite(label("Mermin1967")) #cite(label("DriesslerLandauPerez")) #cite(label("AizenmanSimonWard")). Here the quaternion commutator supplies a quantitative decrease of stiffness across scales. The later passage from charged observables to invariant ones uses Ginibre’s formulation of the Griffiths inequalities for Ising and plane-rotator systems, the FKG association mechanism, and embedded reflection variables #cite(label("Ginibre1970")) #cite(label("FortuinKasteleynGinibre1971")) #cite(label("Wolff1989")), followed by two successive conditioning arguments. We prove the finite forms needed below and retain the covariances of conditional means at both stages.

Reflection positivity connects Euclidean lattice correlations with a positive transfer operator. Classical lattice reflection and chessboard methods were developed systematically by Fröhlich, Israel, Lieb and Simon #cite(label("FILS78")) #cite(label("FILS80")). The finite-volume argument uses the complete trace, so multiplicities and invariant sectors enter automatically. Its role differs from that of an infrared bound: it turns a small partition-function defect on one box into a spectral estimate uniform in larger circumferences. The positivity calculations and the limiting Hilbert-space argument are included in Section 2.

The block-variable viewpoint goes back to Kadanoff and Wilson #cite(label("Kadanoff")) #cite(label("Wilson")). Constructive results for sigma models have required careful distinctions of regime and model. Kupiainen established a large-$n$ expansion and a mass gap for sufficiently large $n$ above the spherical model’s critical temperature #cite(label("Kupiainen")); Gawędzki and Kupiainen constructed a finite-volume continuum limit for a hierarchical model #cite(label("GawedzkiKupiainen")); Mitter and Ramadas constructed the Wilson trajectory in perturbation theory #cite(label("MitterRamadas")). Bałaban developed small-field renormalization and variational-background methods for vector spins #cite(label("BalabanFlow")) #cite(label("BalabanVariational")). For $S U \( 2 \)$, identified with $S^3$, Dybalski, Stottmeister and Tanimoto proved a small-field variational result for one block step, uniform in the box size #cite(label("DybalskiStottmeisterTanimotoVariational")). These results are relevant predecessors of the block analysis; their hypotheses and conclusions do not supply the exact iterated $O \( 4 \)$ density estimates required here.

Normalized stochastic block transformations for sigma models also appear in the perfect-action construction of Hasenfratz and Niedermayer #cite(label("HasenfratzNiedermayerPerfect1994")) Section 2.1, Eqs. (3)–(5). The observation kernel used here differs, and its iterated estimates are proved below. The renormalization step is an exact integration through that probability kernel. Its estimates concern the complete density, including rough configurations, rather than only a formal expansion near aligned spins. Perturbative coefficients determine the scale only after these uniform estimates are available. The comparison of two cutoffs then requires equal terminal kinetic couplings. Since the retained expansion has signed terms, we compare complete positive densities on a common set of large probability under both laws. These are the two interfaces that connect the coefficient calculation with the nonperturbative gap.

=== 1.2 Proof strategy <proof-strategy>

There are two distinct changes of scale in the proof. At fixed $beta$, we enlarge a periodic box to control the infinite-volume spectrum. To compare ultraviolet cutoffs, we instead change the bare coupling and the number of blocking steps while holding the coarse coupling fixed. The argument succeeds because the second operation preserves a finite-box estimate to which the first operation applies.

==== 1.2.1 A finite box controls the full spectrum <a-finite-box-controls-the-full-spectrum>

On a cylinder of spatial circumference $w$, let $K_w$ be the positive transfer operator that advances time by one lattice step. If its eigenvalues are $lambda_1 > lambda_2 gt.eq dots.h.c gt.eq 0$, closing time after $n$ steps gives $Z_beta \( n \, w \) = "Tr" K_w^n$. The ratio

$ P_beta \( n \, w \) = frac(Z_beta \( 2 n \, w \), Z_beta \( n \, w \)^2) = sum_j (frac(lambda_j^n, sum_i lambda_i^n))^2 $

is the purity of the normalized spectral weights. When it is close to one, almost all the trace weight belongs to the largest eigenvalue. This controls the sum of the excited-state contributions, including their multiplicities. Writing

$ s_n \( w \) = sum_(j gt.eq 2) \( lambda_j \/ lambda_1 \)^n \, #h(2em) s_(2 n) \( w \) lt.eq s_n \( w \)^2 \, $

shows the elementary source of the improvement under time doubling.

The remaining issue is that enlarging the spatial circumference could introduce new low-energy states. Transfer positivity in both coordinate directions resolves this issue through exact identities among rectangular partition functions. For a square define

#[#set math.equation(numbering: n => "(1.6)")
 $ Delta_beta \( n \) = 4 log Z_beta \( n \, n \) - log Z_beta \( 2 n \, 2 n \) . $ <intro:Delta>]

By interchange of the coordinate axes,

$ e^(- Delta_beta \( n \)) = P_beta \( n \, n \)^2 P_beta \( n \, 2 n \) . $

The second purity is evaluated on the already-doubled rectangle. A product close to one therefore controls both directions. Section 2 proves

$ Delta_beta \( 2 n \) lt.eq 64 Delta_beta \( n \)^2 \, #h(2em) Delta_beta \( n \) lt.eq eta_(*) := 2^(- 10) med arrow.r.double med m_(upright("lat")) \( beta \) gt.eq frac(log 2, n) . $

The recurrence applies in the displayed small-defect regime. Repeated squaring gives decay exponential in the increasing side length. It controls the full transfer spectrum, including every symmetry sector, as the circumference tends to infinity. This is the box-doubling part of the proof.

The same quantity is useful for comparing cutoffs. Any contribution $f_beta n w$ to $log Z_beta \( n \, w \)$ cancels from (1.6). Thus the bulk free energy generated by exact integration does not enter the finite-volume test. Our lower-bound problem is now to make this one test small on a box whose physical size stays bounded as $beta$ increases.

==== 1.2.2 The preliminary estimate: currents, stiffness, and mixing <the-preliminary-estimate-currents-stiffness-and-mixing>

The first source of decay is specific to the spin geometry. Identify $S^3$ with the unit quaternions. The first-order change of each bond energy under a spin rotation defines its current in that rotation direction. The corresponding #emph[stiffness] is the second-order response of the free energy to the imposed twist. Its defining identity has the form “direct quadratic cost minus current covariance.” Conditioning on the boundaries of smaller squares gives the same structure: the stiffness of the larger square is an average of cell stiffnesses minus a covariance. A lower bound on these current fluctuations therefore improves an upper bound on stiffness. No positive lower bound on the local stiffness is needed.

Rotations about different quaternion axes do not commute. Their integration-by-parts identities consequently contain a term that rotates the current itself. Applying these identities over a range of wavelengths gives a stiffness reduction with leading term $\( log ell \) \/ pi$ when the side of a square is increased by a factor $ell$. The logarithm comes from a reciprocal-square frequency sum in two dimensions. Starting from stiffness at most $beta$, one can therefore reach a small upper bound after a total logarithmic length close to $pi beta$. Choosing the intermediate scale increments to control the accumulated errors gives the length bound

#[#set math.equation(numbering: n => "(1.7)")
 $ Xi \( beta \) = exp #h(-0.16667em) [pi beta + C sqrt(\( 1 + beta \) log \( 2 + beta \))] . $ <intro:Xi>]

The extra term is a loss in this estimate, not a prediction for the physical correlation length.

Small stiffness makes suitable local rotations inexpensive with high probability. Coarse orientation variables then admit a coupling that erases boundary disagreements except at rare locations. A disagreement can travel far only through a long connected chain of such failures. This gives decay first for observables with zero average under a common spin rotation.

To include invariant observables, write each spin as $\( cos alpha_x thin z_x \, sin alpha_x thin w_x \)$, with $alpha_x in \[ 0 \, pi \/ 2 \]$ and $z_x \, w_x in S^1$. Given the angles, the two circle-valued fields are independent ferromagnets. Further conditioning on component magnitudes reduces their sign variables to ferromagnetic Ising models. Positive-correlation inequalities relate their general covariances to two-point functions. At both conditioning stages the covariance of the conditional means must also be bounded; cutting distant bonds makes those means local, with a controlled error. This proves mixing for all local Lipschitz observables in the unpinned ferromagnetic systems, uniformly when bonds are weakened or removed.

That uniformity also compares the mean bond energy on the $n$ and $2 n$ tori. Integrating the difference with respect to the coupling gives the precise output of Section 3:

#[#set math.equation(numbering: n => "(1.8)")
 $ 0 lt.eq Delta_beta \( n \) lt.eq C \( 1 + beta \)^p n^p e^(- c n \/ Xi \( beta \)) \, #h(2em) n gt.eq C Xi \( beta \) . $ <intro:preliminary>]

This establishes a gap at each fixed coupling. Its length bound is too large to give a positive lower bound in the physical units of (1.5): the excess over $rho \( beta \)^(- 1) = beta^(- 1 \/ 2) e^(pi beta)$ grows without bound. The next step uses this estimate at one reference cutoff and preserves its conclusion at all finer cutoffs.

==== 1.2.3 Comparing cutoffs at a fixed coarse coupling <comparing-cutoffs-at-a-fixed-coarse-coupling>

Fix the blocking factor $L$ and a sufficiently large terminal inverse coupling $H$. Every step of the exact block transformation remains in the weak-coupling regime. The coarse law contains interactions beyond the original nearest-neighbor energy. These are retained, together with the contributions from configurations having large spin differences. The comparison concerns the complete coarse laws produced by the original lattice measures.

The basic contraction comes from averaging. In the linear prediction of the fine field from a slowly varying coarse field, each spin difference gains a factor $L^(- 1)$, while a block contains $L^2$ sites. This contracts the dependence on inherited higher-order interactions, after their lower-order contributions have been extracted. Integrating the fluctuations also generates new interactions; the estimates keep them within the same controlled class. A quadratic term needs a further subtraction: its response to a uniform gradient is included in the running kinetic coupling. The remaining quadratic terms have a cancellation that makes them contract as well. A bulk constant is tracked separately. This is why the kinetic coupling is the parameter that must be matched.

Let $I_H$ be a fixed small interval about $H$. A trajectory is #emph[admitted] if every exact blocking step stays in the controlled class of densities and coupling ranges established in Section 5. Before constructing such trajectories, Section 6 determines the two kinetic coefficients. The relation between depth and bare coupling is then determined, rather than imposed, by the kinetic drift. Computing the same finite-volume partition function directly and after exact blocking identifies the first two drift coefficients. Together with the remainder estimates for the exact transformation, this gives, with chronological step index $h$ and coupling $tilde(b)_h$,

$ tilde(b)_(h + 1) = tilde(b)_h - gamma - frac(gamma, 2 pi tilde(b)_h) + r_h \, #h(2em) gamma = frac(log L, pi) \, $

where, along an admitted nearest-neighbor trajectory, the total absolute error $sum_h \| r_h \|$ is bounded uniformly in the depth. Summation, with $tilde(b)_0 = beta$ and $tilde(b)_N in I_H$ fixed, yields

#[#set math.equation(numbering: n => "(1.9)")
 $ N log L = pi beta - 1 / 2 log beta + O_(L \, H) \( 1 \) . $ <intro:calibration>]

The inverse-coupling correction is essential: it supplies the factor $sqrt(beta)$ in the inverse length. Control of the leading exponential $e^(- pi beta)$ alone would leave an unbounded multiplicative uncertainty in physical units.

Section 7 next shows that for every terminal value $h in I_H$ one can choose a bare coupling $beta_N \( h \)$ so that all $N$ exact steps satisfy the required error bounds and the last coupling is $h$. Existence of these choices is part of the construction; uniqueness is unnecessary. Compare depths $N gt.eq K$. At the beginning of their last $K$ steps, the remaining interaction data can differ by a bounded amount. Their kinetic couplings agree at the opposite end. Forward contraction of the interaction differences, combined with this terminal condition on the coupling, bounds the differences by $C_H e^(- c_H K)$ in the local norms controlling the retained interactions and errors. The estimate is uniform in $N - K$ and allows arbitrarily separated bare couplings.

Passing from local interaction bounds to partition functions requires an additional argument. The expansion uses signed terms, so a small absolute error in its coefficients need not be a small relative error in its sum. Section 8 instead compares the complete positive densities on a common set whose complement has small probability under #emph[both] laws. Local modifications of rough regions and an exact expansion provide this relative comparison. The probability bounds under both laws then control the normalization constants as well.

The errors can accumulate over the $M^2$ coarse cells in a box. This explains both the strength and the volume restriction of the resulting comparison. Define

#[#set math.equation(numbering: n => "(1.10)")
 $ D_N \( h \; M \) = Delta_(beta_N \( h \)) \( M L^N \) . $ <intro:DN>]

For all sufficiently large $K$, all $N gt.eq K$, and all dyadic coarse periods $M gt.eq M_min \( L \, H \)$, the estimate is

#[#set math.equation(numbering: n => "(1.11)")
 $ \| D_N \( h \; M \) - D_K \( h \; M \) \| lt.eq C_H e^(- d_H K) \, #h(2em) \( 2 M \)^2 lt.eq e^(c_H K) . $ <intro:comparison>]

The constants are uniform in $h in I_H$. The factor $2 M$ occurs because the test contains the doubled box as well. The common terminal coupling fixes the physical comparison: the two microscopic periods $M L^N$ and $M L^K$ both represent the same $M times M$ coarse torus.

==== 1.2.4 Choose the reference box once, then refine the cutoff <choose-the-reference-box-once-then-refine-the-cutoff>

We can now see why the two estimates fit together. Equation (1.9) gives

$ frac(Xi \( beta_K \( h \) \), L^K) = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\[] O_(L \, H) \( sqrt(K log K) \) #scale(x: 120%, y: 120%)[\]] . $

Thus the coarse side required by the preliminary decay bound grows subexponentially in $K$. The comparison (1.11), however, permits coarse sides growing exponentially in $K$. There is room to choose a box large enough for the first estimate and small enough for the second.

Concretely, choose dyadic $M_K$ with

$ log M_K = K^(3 \/ 4) + O \( 1 \) . $

Then

$ log frac(M_K L^K, Xi \( beta_K \( h \) \)) = K^(3 \/ 4) - O_(L \, H) \( sqrt(K log K) \) \, #h(2em) 2 log \( 2 M_K \) = o \( K \) . $

The first relation makes the decay in (1.8) overwhelm its polynomial prefactor, so $D_K \( h \; M_K \) arrow.r 0$ uniformly in $h$. The second keeps both boxes inside the comparison range. The exponent $3 \/ 4$ merely lies between $1 \/ 2$ and $1$; no significance is attached to its particular value.

Choose one finite $K_0$ large enough that

$ sup_(h in I_H) D_(K_0) \( h \; M_(K_0) \) + C_H e^(- d_H K_0) lt.eq eta_(*) . $

Now fix $M_0 = M_(K_0)$. For every finer cutoff $N gt.eq K_0$,

$ D_N \( h \; M_0 \) lt.eq eta_(*) . $

Box doubling therefore gives $m_(upright("lat")) \( beta_N \( h \) \) gt.eq \( log 2 \) \/ \( M_0 L^N \)$. The growing family $M_K$ was used only to find a single reference box. After that choice, $M_0$ is constant, and the microscopic box $M_0 L^N$ always has physical side $M_0 ell_(upright("ref"))$. This order of choices removes the subexponential loss from the physical mass bound. It also explains why the blocking construction can stop at a large $H$: long-distance decay is supplied by the preliminary argument on the reference lattice.

==== 1.2.5 A block correlation bounds the mass above <a-block-correlation-bounds-the-mass-above>

The upper bound uses a different consequence of stopping at a large $H$. Nearby terminal spins remain aligned on average, by the one-law rarity estimate of Lemma 20. For terminal sites $0$ and $3 e_1$, Lemma 29 gives $bb(E) \[ V_0^(\( 1 \)) V_(3 e_1)^(\( 1 \)) \] gt.eq 1 \/ 8$, where the superscript denotes one spin component. Pull this observable back to the original lattice by setting

$ F_X \( sigma \) = bb(E) \[ V_X^(\( 1 \)) divides sigma \] . $

Each $F_X$ is centered, bounded by one, and supported in its block of side $L^N$. The auxiliary variables in disjoint blocks are independent given $sigma$, so the two $F$’s retain the same correlation. Their supports are separated by at least $L^N$ time steps. The full transfer gap bounds that correlation by $e^(- m_(upright("lat")) \( beta_N \( h \) \) L^N)$, giving the upper bound in (1.4).

The proof thus gives a uniform exponential decay rate for all connected correlations of bounded local observables in physical units, together with a nonzero bounded correlation at a fixed physical separation. These give the two sides of (1.5). The admission argument assigns every sufficiently large bare coupling a trajectory ending in $I_H$, so the depth bounds imply the assertion for every sufficiently large $beta$. Section 11 states separately the additional convergence assumptions needed to interpret the bounds as statements about an existing continuum theory.

===== 1.2.5.1 Conventions. <conventions.>

The normalizations used throughout are collected here to distinguish the physical spacing from the observation precision.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Convention
]),
  table.cell(rowspan: 1, colspan: 1)[Spin and measure
], table.cell(rowspan: 1, colspan: 1)[$sigma_x = q_x in S^3$; $integral_(S^3) d omega = 1$
],
  table.cell(rowspan: 1, colspan: 1)[Bond sum
], table.cell(rowspan: 1, colspan: 1)[Each unoriented nearest-neighbor bond counted once
],
  table.cell(rowspan: 1, colspan: 1)[Bare parameter
], table.cell(rowspan: 1, colspan: 1)[$beta > 0$ is inverse coupling (inverse temperature)
],
  table.cell(rowspan: 1, colspan: 1)[Running parameter
], table.cell(rowspan: 1, colspan: 1)[$b$ is the extracted kinetic inverse coupling
],
  table.cell(rowspan: 1, colspan: 1)[Preliminary distance
], table.cell(rowspan: 1, colspan: 1)[Maximum-norm lattice distance between supports
],
  table.cell(rowspan: 1, colspan: 1)[Transfer distance
], table.cell(rowspan: 1, colspan: 1)[Number of time edges between the actual supports
],
  table.cell(rowspan: 1, colspan: 1)[Physical spacing
], table.cell(rowspan: 1, colspan: 1)[$a_N = ell_(upright("ref")) L^(- N)$
],
  table.cell(rowspan: 1, colspan: 1)[Observation precision
], table.cell(rowspan: 1, colspan: 1)[$a = 1$, a dimensionless kernel parameter
],
)
]

For quaternion generators, an imaginary unit $u$ acts by $q_x mapsto e^(t u) q_x$ and $\[ u \, v \] = 2 u times v$; the bond current normalization is derived in Section 3.1.

===== 1.2.5.2 Organization. <organization.>

Section 2 proves the box-doubling criterion and Section 3 proves the preliminary estimate. Sections 4 and 5 construct and control the exact block transformation. Section 6 calibrates its kinetic drift. Section 7 constructs admitted trajectories and matches their terminal couplings; Section 8 compares the resulting positive densities. Sections 9–11 assemble the lower bound, prove the upper bound, and identify the physical units. The regularity and support conventions required by the expansions are specified at their points of use. The appendices are parts of the proof: Appendix 12 supplies the uniform analytic estimates for the linear block map; Appendix 13 fixes the canonical coefficient norm and proves its diagonal contraction; Appendix 14 constructs the local factors and their complete supports; and Appendix 15 proves the joint Gaussian product bound and verifies it for all eight prepared-factor classes.

== 2 A finite-volume criterion for the full gap <sec:finite-volume>

We first isolate a finite-volume statement that will be sufficient for a mass gap. It involves the actual partition functions, so it sees every spectral sector. It is also insensitive to a contribution to the free energy proportional to volume, which will make it suitable for renormalization.

=== 2.1 Transfer eigenvalues and a measure of excited-state weight <transfer-eigenvalues-and-a-measure-of-excited-state-weight>

Fix a spatial circumference $w$. A time slice is a configuration $s = \( s_1 \, dots.h \, s_w \) in \( S^3 \)^w$. Set $V_w \( s \) = sum_(i = 1)^w s_i dot.op s_(i + 1)$, with periodic indices, and let $K_w$ be the integral operator with kernel

#[#set math.equation(numbering: n => "(2.1)")
 $ K_w \( s \, s' \) = exp #h(-0.16667em) [beta / 2 V_w \( s \) + beta sum_(i = 1)^w s_i dot.op s'_i + beta / 2 V_w \( s' \)] . $ <eq:transfer-kernel>]

The operator is compact and self-adjoint. It is positive semidefinite: the expansion of $e^(beta s dot.op s')$ is a sum of positive tensor-product kernels, and multiplication on both sides by $e^(beta V_w \/ 2)$ preserves positivity. The positive-kernel series has finite diagonal integral, so it also proves trace class. The strictly positive kernel gives a simple largest eigenvalue. Write $lambda_1 \( w \) > lambda_2 \( w \) gt.eq lambda_3 \( w \) gt.eq dots.h.c gt.eq 0$, allowing $lambda_2 = 0$. Closing the time direction gives

#[#set math.equation(numbering: n => "(2.2)")
 $ Z_beta \( n \, w \) = "Tr" K_w^n = sum_i lambda_i \( w \)^n . $ <eq:trace>]

Suppress $beta$ temporarily and define

#[#set math.equation(numbering: n => "(2.3)")
 $ p \( n \, w \) & = 2 log Z \( n \, w \) - log Z \( 2 n \, w \) \,\
q \( n \, w \) & = 2 log Z \( n \, w \) - log Z \( n \, 2 w \) . $ <eq:p>]

Both are nonnegative. To interpret $p$, introduce the normalized trace weights

#[#set math.equation(numbering: n => "(2.4)")
 $ t_i = frac(lambda_i \( w \)^n, sum_j lambda_j \( w \)^n) . #h(2em) upright("Then") #h(2em) e^(- p \( n \, w \)) = sum_i t_i^2 . $ <eq:purity>]

Thus small $p$ means that almost all the trace weight lies in one eigenstate, necessarily the ground state. The same interpretation applies to $q$ after interchanging the coordinate directions.

#thm([Lemma 2.1.])[
  #emph[The excited trace tail 
$ s_n \( w \) = sum_(i gt.eq 2) (frac(lambda_i \( w \), lambda_1 \( w \)))^n $

 satisfies $s_n \( w \) lt.eq e^(p \( n \, w \)) - 1$. If $p \( n \, w \) lt.eq 1 \/ 4$, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ (frac(lambda_2 \( w \), lambda_1 \( w \)))^n lt.eq 2 p \( n \, w \) \, #h(2em) p \( 2 n \, w \) lt.eq 4 p \( n \, w \)^2 . $ <eq:squaring>]

 The analogous statements hold for $q$ when the other period is doubled.]
] <lem:squaring>

#proof[
  Since $sum_i t_i^2 lt.eq t_1 = \( 1 + s_n \)^(- 1)$, we have $s_n lt.eq e^p - 1$. For $p lt.eq 1 \/ 4$, this is at most $p e^p lt.eq 2 p$, which also bounds the first excited term. The largest eigenvalue cancels from the definition of $p$, so
  $ p \( 2 n \, w \) = 2 log \( 1 + s_(2 n) \) - log \( 1 + s_(4 n) \) lt.eq 2 s_(2 n) lt.eq 2 s_n^2 lt.eq 2 p^2 e^(2 p) lt.eq 4 p^2 . $
  ◻
]

=== 2.2 Increasing the spatial volume <increasing-the-spatial-volume>

Ground-state dominance at one fixed circumference is not enough. New low-energy states could appear as the circumference increases. The following exact identity lets us control that limit:

#[#set math.equation(numbering: n => "(2.6)")
 $ p \( n \, 2 w \) = 2 p \( n \, w \) - 2 q \( n \, w \) + q \( 2 n \, w \) . $ <eq:rectangle>]

It follows by substituting (2.3)–(2.3). There is a second identity obtained by interchanging the directions.

Figure 1 records the two-direction geometry.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.38, 1.38), fill: rgb("#f5f5f5"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.69, 0.69), [#text(size: 9pt)[$Z(n,n)$]])
  content((0.69, 0), [#text(size: 9pt)[$n$]], anchor: "north", padding: 0.1176cm)
  content((0, 0.69), [#text(size: 9pt)[$n$]], anchor: "east", padding: 0.1176cm)
  line((1.702, 0.69), (2.806, 0.69), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((2.254, 0.828), [#text(size: 9pt)[double#linebreak()time]], anchor: "south", padding: 0.1176cm)
  rect((3.128, 0), (5.888, 1.38), fill: rgb("#f5f5f5"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.508, 0), (4.508, 1.38), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.508, 0.69), [#box(inset: 0.3333em, stroke: none, fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Z(2n,n)$]]])])
  content((4.508, 0), [#text(size: 9pt)[$2n$]], anchor: "north", padding: 0.1176cm)
  line((6.21, 0.69), (7.314, 0.69), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((6.762, 0.828), [#text(size: 9pt)[double#linebreak()space]], anchor: "south", padding: 0.1176cm)
  rect((7.636, 0), (10.4, 2.76), fill: rgb("#f5f5f5"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.636, 1.38), (10.4, 1.38), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((9.016, 0.69), [#text(size: 9pt)[$Z(2n,2n)$]])
  content((9.016, 0), [#text(size: 9pt)[$2n$]], anchor: "north", padding: 0.1176cm)
  content((10.4, 1.38), [#text(size: 9pt)[$2n$]], anchor: "west", padding: 0.1176cm)
  content((5.198, -0.92), [#text(size: 9pt)[$ Delta (n)=2 [2 log Z(n,n)- log Z(2n,n) ]_(p(n,n)) + [2 log Z(2n,n)- log Z(2n,2n) ]_(q(2n,n))$]])
})],
  caption: [Figure 1: The two coordinate directions enter the square-box test. Every rectangle has periodic boundary conditions; the dashed lines mark its dimensions, not cuts that make the pieces independent. The second doubling starts from the enlarged rectangle. The displayed identity is exact, with the fixed coupling suppressed. ],
) <fig:rectangle-doubling>

Define the square-box test

#[#set math.equation(numbering: n => "(2.7)")
 $ Delta_beta \( n \) = 4 log Z_beta \( n \, n \) - log Z_beta \( 2 n \, 2 n \) . $ <eq:Delta>]

It obeys $Delta_beta \( n \) = 2 p \( n \, n \) + q \( 2 n \, n \) gt.eq 0$. The coefficients in (2.7) cancel any term proportional to the area of the box.

#thm([Proposition 2.2.])[
  (Finite-volume criterion).  #emph[Let $n gt.eq 4$ be even. If 
#[#set math.equation(numbering: n => "(2.8)")
 $ Delta_beta \( n \) lt.eq eta_(*) := 2^(- 10) \, $ <eq:small-test>]

 then the transfer operators on circumferences $2^k n$, $k gt.eq 0$, satisfy 
#[#set math.equation(numbering: n => "(2.9)")
 $ frac(lambda_2 \( 2^k n \), lambda_1 \( 2^k n \)) lt.eq e^(- \( log 2 \) \/ n) . $ <eq:width-gap>]

 Every local limit of the square tori with sides $2^k n$ has full gap at least $\( log 2 \) \/ n$. In particular, if the periodic infinite-plane state is unique, then 
#[#set math.equation(numbering: n => "(2.10)")
 $ m_(upright("lat")) \( beta \) gt.eq frac(log 2, n) . $ <eq:criterion-gap>]

]
] <prop:criterion>

#proof[
  Write $Delta = Delta_beta \( r \)$. Besides $q \( 2 r \, r \) lt.eq Delta$, the definitions give $p \( r \, 2 r \) = Delta - 2 q \( r \, r \) lt.eq Delta$. Lemma 3 therefore yields $p \( 2 r \, 2 r \) lt.eq 4 Delta^2$. The rectangle identity in the other direction gives
  $ q \( 4 r \, r \) = 2 q \( 2 r \, r \) - 2 p \( 2 r \, r \) + p \( 2 r \, 2 r \) lt.eq 2 Delta + 4 Delta^2 lt.eq 3 Delta . $
  Squaring in that direction gives $q \( 4 r \, 2 r \) lt.eq 36 Delta^2$. Consequently,
  #[#set math.equation(numbering: n => "(2.11)")
   $ Delta_beta \( 2 r \) = 2 p \( 2 r \, 2 r \) + q \( 4 r \, 2 r \) lt.eq 44 Delta_beta \( r \)^2 lt.eq 64 Delta_beta \( r \)^2 . $ <eq:quadratic-recursion>]
  Every use of the lemma is justified by $3 eta_(*) < 1 \/ 4$, and the smallness condition is preserved. For $n_k = 2^k n$, induction gives
  $ Delta_beta \( n_k \) lt.eq 1 / 64 \( 64 eta_(*) \)^(2^k) lt.eq 1 / 64 2^(- 2^k) . $
  Since the first assertion of the lemma bounds $\( lambda_2 \( n_k \) \/ lambda_1 \( n_k \) \)^(n_k)$ by $2 p \( n_k \, n_k \) lt.eq Delta_beta \( n_k \)$, taking the $n_k$-th root proves (2.9).
  Let $Omega_w$ be the normalized positive ground eigenvector of $K_w$. For a bounded continuous observable $F$ supported in a time slab of finite thickness, let $K_(w \, F)$ denote the transfer kernel across that slab with the insertion of $F$. Pointwise, $\| K_(w \, F) \| lt.eq ∥F∥_oo K_w^r$, where $r$ is the number of transfer steps across the slab. Set $A_F = K_(w \, F) \/ lambda_1 \( w \)^r$; for $r = 0$, this is multiplication by $F$. Its operator norm is at most $∥F∥_oo$. The infinite-time cylinder expectation is $omega_w \( F \) = chevron.l Omega_w \, A_F Omega_w chevron.r$. Applying (2.9) between two such insertions gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ \| "Cov"_(omega_w) \( F \, G \) \| lt.eq ∥F∥_oo ∥G∥_oo e^(- \( log 2 \) d \/ n) \, $ <eq:slab-bound>]
  where $d$ is the number of transfer edges separating their supports. This bound passes to any local limit of the cylinder states as $w = 2^k n arrow.r oo$.
  We can identify these limits directly with the square-torus limits. Let $hat(K)_w = K_w \/ lambda_1 \( w \)$. If $w = n_k$ and $r lt.eq w \/ 2$, the square-torus expectation is
  $ frac("Tr" \( A_F hat(K)_w^(thin w - r) \), "Tr" hat(K)_w^(thin w)) . $
  Separating the ground projection in numerator and denominator shows that its difference from the cylinder expectation is at most $2 ∥F∥_oo s_(w \/ 2) \( w \)$. But
  $ p \( w \/ 2 \, w \) lt.eq Delta_beta \( w \/ 2 \) \, #h(2em) s_(w \/ 2) \( w \) lt.eq e^(Delta_beta \( w \/ 2 \)) - 1 arrow.r 0 . $
  Thus the square and cylinder expectations have the same subsequential limits, also for products of fixed local observables. In particular, (2.12) holds in every such square-torus limit.
  For each centered vector created by a local observable in the reflection-positive Hilbert space, the transfer autocorrelation has a positive spectral measure. It is a correlation of two reflected slabs, so (2.12) applies and excludes spectral support above $e^(- \( log 2 \) \/ n)$ for that vector. Such vectors are dense in the vacuum orthogonal subspace, so the same exclusion holds for the full transfer operator. This proves (2.10). ◻
]

The slab estimate extends to bounded measurable local observables by approximation in their finite-dimensional distributions. No prefactor depending on the size of a slab is needed; this will be useful for the upper mass bound.

The criterion has reduced the problem to a single question: can one make $Delta_beta \( n \)$ small with $n$ no larger than a fixed multiple of $rho \( beta \)^(- 1)$? The preliminary estimate alone will not do this. It will instead supply a reference box for the comparison between cutoffs.

== 3 Preliminary mixing <pre:mixing>

We first prove a lattice estimate whose length scale is less precise than the natural continuum scale, but whose uniformity under weakening bonds will be needed later. Spins take values in the unit sphere $S^3 subset bb(R)^4$, identified with the unit quaternions. The a priori measure is normalized Haar measure. For a finite graph in the square lattice the Gibbs density is proportional to

$ exp (sum_(e = x y) beta_e q_x dot.op q_y) . $

Each unoriented edge occurs once. A free subgraph means that bonds outside the graph are absent; it imposes no pinned spin values.

For a local Lipschitz observable $F$, supported on a finite set $A$, put

$ L_F = ∥F∥_oo + max_(x in A) "Lip"_x \( F \) \, $

where the individual Lipschitz constant uses round distance on $S^3$ with all other spins fixed. Distances between supports use the maximum norm, or its periodic version on a torus.

#thm([Theorem 3.1.])[
  (Preliminary mixing).  #emph[There are fixed positive constants $C \, c \, p$ such that, on setting 
#[#set math.equation(numbering: n => "(3.1)")
 $ Xi \( beta \) = exp [pi beta + C sqrt(\( 1 + beta \) log \( 2 + beta \))] \, $ <eq:pre:Xi>]

 the following hold for every $beta gt.eq 0$.]
  #emph[For every unpinned rectangular torus with each side at least $C Xi \( beta \)$, and every choice $0 lt.eq beta_e lt.eq beta$, local observables $F \, G$ supported on $A \, A'$ at distance $d$ satisfy 
#[#set math.equation(numbering: n => "(3.2)")
 $ \| "Cov" \( F \, G \) \| lt.eq C \( 1 + beta + \| A \| + \| A' \| + d \)^20 L_F L_G e^(- c d \/ Xi \( beta \)) . $ <eq:pre:theorem-mixing>]

 The same bound holds on every unpinned free subgraph, with ambient lattice distance. In the homogeneous model the local limit of periodic square measures is unique.]
  #emph[Let $Z_beta \( n \, m \)$ be the partition function of the homogeneous $n$-by-$m$ torus. For every even $n gt.eq C Xi \( beta \)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ 0 lt.eq Delta_beta \( n \) := 4 log Z_beta \( n \, n \) - log Z_beta \( 2 n \, 2 n \) lt.eq C \( 1 + beta \)^p n^p e^(- c n \/ Xi \( beta \)) . $ <eq:pre:theorem-delta>]

]
] <thm:preliminary>

The proof first obtains a small stiffness on a suitable pinned square. This part allows arbitrary signed couplings and fixed right twists. We then use coarse orientation variables to prove decay for charged observables. Two conditional decompositions into ferromagnetic circle and Ising systems give mixing for arbitrary local observables. Only this last part requires nonnegative untwisted couplings.

Constants denoted by $C$ may increase from line to line. All are independent of lattice size and of the particular couplings and pins. Dependence on a fixed moment order or a fixed auxiliary exponent is indicated when needed. For continuum test fields on the unit square, $parallel dot.op parallel_2$ denotes the Lebesgue $L^2$ norm. For random variables, $parallel dot.op parallel_p$ denotes the probabilistic $L^p$ norm.

=== 3.1 Local class and Ward identities <pre:local>

The following calculation is a local Ward identity, in the tradition of #cite(label("Mermin1967")) #cite(label("DriesslerLandauPerez")) #cite(label("AizenmanSimonWard")). We give the full quaternion formula because the noncommuting current term and its factor two determine the quantitative stiffness gain.

Work on $Q \( S \) = { 0 \, dots.h \, S }^2$ with all boundary spins fixed. For each positively oriented edge $e = x arrow.r y$, set

$ t_e + s_e = q_y U_e q_x^(- 1) \, #h(2em) t_e in bb(R) \, quad s_e in "Im" bb(H) tilde.eq bb(R)^3 \, $

where $U_e$ is any fixed unit quaternion. Take signed coefficients $\| b_e \| lt.eq b lt.eq B$, with $w_e = b_e$ except that edges tangent to the boundary carry $w_e = b_e \/ 2$. The local density is $Z^(- 1) exp \( sum_e w_e t_e \)$. The half allocation makes adjacent cell actions sum exactly to the action on the union.

For macroscopic midpoint coordinates $z_e$, define

$ X_Q \( F \) = S^(- 1) sum_e w_e s_e dot.op F_(mu \( e \)) \( z_e \) \, $

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(H)_Q \( F \, G \) = S^(- 2) bb(E) sum_e w_e t_e thin overline(F_e) dot.op G_e - "Cov" \( X_Q \( F \) \, X_Q \( G \) \) . $ <eq:pre:1-1>]

The covariance is sesquilinear, with conjugation on the first entry. Write $H_Q$ for the restriction to constant $3 times 2$ matrices. In each spatial direction the sum of the absolute edge coefficients is at most $b S^2$: there are $S \( S - 1 \)$ interior edges and two tangent boundary rows with half weight. Thus

#[#set math.equation(numbering: n => "(3.5)")
 $ H_Q lt.eq b I . $ <eq:pre:1-2>]

This is valid with signed coefficients and twists. No positive lower bound on $H_Q$ is claimed or used.

For an imaginary unit $a$, rotate $q_x mapsto e^(a f_x) q_x$. A bond quaternion changes to $e^(a f_y) \( t_e + s_e \) e^(- a f_x)$. Its $\( 1 \, a \)$-plane rotates through $f_y - f_x$; its imaginary plane perpendicular to $a$ rotates through $f_y + f_x$. If $cal(A) = - sum w_e t_e$, then

#[#set math.equation(numbering: n => "(3.6)")
 $ D_f cal(A) = sum_e w_e \( s_e dot.op a \) \( f_y - f_x \) \, #h(2em) D_f^2 cal(A) = sum_e w_e t_e \( f_y - f_x \)^2 . $ <eq:pre:1-3>]

For a general infinitesimal imaginary profile $eta_x$, the imaginary bond derivative is exactly

#[#set math.equation(numbering: n => "(3.7)")
 $ D_eta s_e = t_e \( eta_y - eta_x \) + \( eta_y + eta_x \) times s_e . $ <eq:pre:1-4>]

Consequently the compact-profile Ward identity has a contact term and a bracket term. If $eta$ vanishes on the fixed boundary, Haar integration by parts gives

#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E) \[ overline(X_Q \( d_S eta \)) X_Q \( F \) \] = S^(- 2) bb(E) sum_e w_e t_e overline(\( d_S eta \)_e) dot.op F_e + bb(E) X_Q #h(-0.16667em) (F_e times \( overline(eta_y) + overline(eta_x) \)) \, $ <eq:pre:1-5>]

where the cross product is extended complex bilinearly. This follows first for real profiles and then by complex linear extension. Here $\( d_S eta \)_mu \( z \) = S \[ eta \( z + e_mu \/ \( 2 S \) \) - eta \( z - e_mu \/ \( 2 S \) \) \]$. This fixes the normalization and the factor two in the eventual nonabelian derivative. For the same-axis score there is no bracket term; (3.6) follows directly.

=== 3.2 Current moments near a pinned boundary <pre:moments>

Assume throughout the local induction

#[#set math.equation(numbering: n => "(3.9)")
 $ log \( 2 + S \) lt.eq 16 B . $ <eq:pre:2-1>]

#thm([Lemma 3.2.])[
  (Uniform current moments).  #emph[For every fixed $1 lt.eq p < oo$,]
  #emph[
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel X_Q \( F \) parallel_p lt.eq C_p \( 1 + b \) log \( 2 + S \) parallel F parallel_(C^1) . $ <eq:pre:2-2>]

]
  #emph[Here and subsequently the derivative norm is in the indicated rescaled coordinates. The constants are independent of pins, signs, twists, and side length.]
] <pre:current-moments>

#proof[
  ==== 3.2.1 Compact scores <pre:part-2-1>
  For a real one-axis profile $f$ zero at the pinned boundary, the second variation along the full rotation path is bounded in absolute value by $b sum_e \( f_y - f_x \)^2$. Taylor’s formula and invariance of the Haar integral under the compact rotation imply
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E) exp \( t D_f cal(A) \) lt.eq exp [1 / 2 b t^2 sum_e \( f_y - f_x \)^2] . $ <eq:pre:2-3>]
  Here $E \( f \) = sum_e \( f_y - f_x \)^2$ and $q_x^(t f) = e^(a t f_x) q_x$. Use $cal(A) \( q^(- t f) \) lt.eq cal(A) \( q \) - t D_f cal(A) \( q \) + 1 / 2 b t^2 E \( f \)$, exponentiate, and integrate. The same Taylor estimate bounds the $r$-th moment of the likelihood ratio of a unit rotation by $exp \( C_r b E \( f \) \)$. It is therefore bounded when $b E \( f \)$ is bounded. These arguments use $\| w_e t_e \| lt.eq b$, so remain valid for signed and twisted interactions.
  ==== 3.2.2 Extracting a transverse current on a buffered patch <pre:part-2-2>
  Take an interior patch of lattice side $d$, with a proportional buffer. For a scalar test $h$ on the inner patch, let $H$ be its $C^1$ norm in patch coordinates. Choose a compact scalar potential $theta.alt$, affine with slope $1 \/ d$ in direction $mu$ on all edges meeting the support of $h$, and with bounded Dirichlet energy. Choose $a$ perpendicular to the current color to be extracted. The compact score in the other perpendicular color has every fixed moment $O_p \( sqrt(b) \)$ by (3.11).
  Assume $H > 0$, since otherwise the test is zero. Rotate this score by the two opposite profiles
  $ f = 1 / 2 arcsin \( h \/ N \) \, #h(2em) N = C sqrt(1 + b) thin H . $
  The rotations have uniformly bounded likelihood norms. The difference of the rotated scores is the transverse current multiplied by $2 sin \( f_x + f_y \)$. Multiplication by $N$ extracts $h$ at the midpoint up to $C H \/ d$. It is important that only this first-order error is needed: after the score normalization $d^(- 1)$, its deterministic total over $O \( d^2 \)$ edges is $O \( b H \)$. The moment cost of the two scores multiplied by $N$ is $O_p \( \( 1 + b \) H \)$. Hence
  #[#set math.equation(numbering: n => "(3.12)")
   $ ∥d^(- 1) sum_(e parallel mu) w_e \( s_e \)_k h_e∥_p lt.eq C_p \( 1 + b \) H . $ <eq:pre:2-4>]
  Bounded $d$ can be treated deterministically.
  ==== 3.2.3 Whitney summation <pre:part-2-3>
  A width $O \( 1 \)$ boundary layer contributes $O \( b parallel F parallel_oo \)$. Decompose the remaining square into buffered patches with $d$ comparable to distance to the boundary. At one dyadic scale there are $O \( S \/ d \)$ such patches; their normalized tests have $C^1$ norms $O \( parallel F parallel_(C^1) \)$. Applying (3.12), multiplying by $d \/ S$, and summing gives $O \( \( 1 + b \) parallel F parallel_(C^1) \)$ per scale. There are $O \( log \( 2 + S \) \)$ scales. This proves (3.10). ◻
]

=== 3.3 Conditioning into cells <pre:cells>

The symbol $L$ in this preliminary argument is an auxiliary integer which may change during the stiffness iteration. It is independent of the fixed block size chosen for the exact renormalization map in Section 4.

The current-moment estimate permits replacing slowly varying fields by their values at cell anchors. We next express the large-square stiffness through the conditioned cell laws; the variance of their conditional currents is the gain to exploit.

Tile $Q \( S \)$ by $L^2$ cells of side $R = S \/ L$. Condition on their complete boundary rings $omega$. Cell interiors are independent and the ring density has action $S_g \( omega \) = - sum_c log Z_c \( omega \)$. Set

$ j \( F \) = bb(E) \[ X_Q \( F \) divides omega \] = L^(- 1) sum_c bb(E)_c X_c \( F \) . $

Let $z_c$ be the lower-left cell anchor and put

$ N_c \( F \) = sup_(c^(+)) \( \| F \| + L^(- 1) \| nabla F \| \) \, #h(2em) D_c \( F \) = L^(- 1) N_c \( nabla F \) . $

The fixed enlargement $c^(+)$ is used only for smooth test-field estimates. Write $P \( B \)$ for a fixed polynomial whose degree and coefficients may depend on fixed moment orders or prescribed exponents, but not on $R \, L \, S$. Equation (3.10) and (3.9) give

#[#set math.equation(numbering: n => "(3.13)")
 $ \| bb(E)_c X_c \( F \) \| lt.eq P \( B \) N_c \( F \) \, quad \| cal(H)_c \( F \, G \) \| lt.eq P \( B \) N_c \( F \) N_c \( G \) \, $ <eq:pre:3-1>]

#[#set math.equation(numbering: n => "(3.14)")
 $ \| cal(H)_c \( F \, G \) - overline(F_c) H_c G_c \| lt.eq P \( B \) \[ D_c \( F \) N_c \( G \) + N_c \( F \) D_c \( G \) \] . $ <eq:pre:3-2>]

For the last estimate subtract the constants $F_c \, G_c$ in the bilinear form. Their remainders have cell-coordinate $C^1$ norm bounded by the displayed $D_c$. One can instead use a direct Lipschitz bound on the cell where appropriate.

For a scalar ring rotation $u$, let $H_c^u$ be the resulting constant-field stiffness and $O_c \( u \) = "Ad" \( e^(a u \( z_c \)) \)$. Then

#[#set math.equation(numbering: n => "(3.15)")
 $ parallel O_c \( u \)^T H_c^u O_c \( u \) - H_c parallel lt.eq P \( B \) D_c \( u \) \, $ <eq:pre:3-3>]

and its derivative at zero satisfies the same bound. To prove this, remove the constant rotation $u \( z_c \)$ exactly by covariance. Along the remaining path also rotate the interior integration variables. The logarithmic density derivative is the negative of the centered cell current with test $a R \( u_y - u_x \)$, whose fixed moments are bounded by $P \( B \) D_c \( u \)$. The residual profile need not vanish on the cell boundary; the current-moment bound applies to this test without that restriction. Derivatives of a constant-field current have the bracket current with residual profile of size $D_c \( u \)$, plus a deterministic contact of that size. Differentiate the contact and covariance in (3.4) and apply Hölder with the already established current moments. Restarting this calculation at each point of the path gives the bound for arbitrary amplitude $u$; there is no exponential dependence on its constant part.

Rotating all rings while fixing the outside boundary gives the exact Hessian identity

#[#set math.equation(numbering: n => "(3.16)")
 $ D_u^2 S_g = L^(- 2) sum_c cal(H)_c \( a thin d_S u \, a thin d_S u \) . $ <eq:pre:3-4>]

=== 3.4 Gaussian augmentation and commuting derivatives <pre:gaussian>

The cell stiffness matrices need not be positive. We add auxiliary Gaussian noise so that the desired upper bound on $H_Q$ becomes a lower bound on the variance of an augmented current. The identity below makes this reduction exact.

Suppose uniformly throughout the pinned cell class $H_c lt.eq h I$, where $B^(- D) lt.eq h lt.eq B$. Choose

#[#set math.equation(numbering: n => "(3.17)")
 $ h < v lt.eq 2 B \, #h(2em) c_0 gt.eq B^(- D') \, #h(2em) C_c = v I - H_c - c_0 P_a gt.eq B^(- D') I \, $ <eq:pre:4-1>]

where $P_a$ is projection onto the two spatial components of color $a$. Let $n_c$ be independent standard six-dimensional Gaussian vectors, and $n_(0 \, c)$ independent two-dimensional Gaussian vectors of covariance $c_0 I$, all independent of the true ring data. Define

#[#set math.equation(numbering: n => "(3.18)")
 $ J \( F \) = j \( F \) + L^(- 1) sum_c \( sqrt(C_c) n_c + a n_(0 \, c) \) dot.op F_c . $ <eq:pre:4-2>]

For every constant real matrix $A$, total variance gives exactly

#[#set math.equation(numbering: n => "(3.19)")
 $ H_Q \( A \, A \) = v \| A \|^2 - "Var" J \( A \) . $ <eq:pre:4-3>]

Indeed $H_Q = L^(- 2) sum_c bb(E) H_c - "Var" j$, and the conditional noise covariance adds $v I - L^(- 2) sum_c H_c$.

Choose a real trigonometric cutoff $psi$, zero on the boundary, with band $O \( m \)$. Let $f_i = psi phi_i$, where $phi_i$ are the real orthonormal Fourier modes of frequency $\| k \| lt.eq 4 K$, including the constant. Use $K + m lt.double L$ and

$ G_0 = L^(- 2) sum_c nabla f \( z_c \) nabla f \( z_c \)^T \, quad p = \( c_0 G_0 \)^(- 1) L^(- 1) sum_c nabla f \( z_c \) n_(0 \, c) \, quad theta = f dot.op p . $

Quadrature is exact at this band, so $G_0$ is the continuum gradient Gram matrix. It is positive: a linear combination of the $f_i$ with zero gradient is a constant, zero on the boundary, and hence is zero; division by $psi$ on its open nonzero set then annihilates the Fourier polynomial. Thus $p$ is Gaussian with covariance $\( c_0 G_0 \)^(- 1)$.

Put

$ omega^0 = e^(- a theta) omega \, #h(2em) n_(0 \, c)^0 = n_(0 \, c) - c_0 nabla theta \( z_c \) \/ L \, $

$ n_c^0 = O_c \( theta \)^T n_c - sqrt(C_c^0) thin a nabla theta \( z_c \) \/ L \, $

where $C_c^0$ uses $omega^0$. At fixed base data $\( omega^0 \, n_0^0 \, n^0 \)$, the density of $p$ is proportional to $e^(- V \( p \))$, with

#[#set math.equation(numbering: n => "(3.20)")
 $ V \( p \) = 1 / 2 c_0 p^T G_0 p + S_g \( e^(a theta) omega^0 \) + 1 / 2 sum_c \| n_c^0 + sqrt(C_c^0) thin a nabla theta \( z_c \) \/ L \|^2 . $ <eq:pre:4-4>]

This is an exact change of variables. First split the Gaussian $n_0$ into its linear projection and orthogonal residual. At fixed $p$, the ring rotation preserves product Haar measure. At fixed $p \, omega^0$, the $n_c$ transformations are orthogonal maps followed by translations. These successive maps have constant Jacobian; dependencies of later maps on earlier variables give a triangular Jacobian, not an extra determinant.

For fixed scalar directions $u_i$ in the potential span, let $partial_i$ mean addition of $t u_i$ to $theta$ with all base data fixed. They commute. Conditional integration by parts gives, for $partial_i^(*) = - partial_i + partial_i V$,

#[#set math.equation(numbering: n => "(3.21)")
 $ bb(E) (sum_i partial_i^(*) Y_i)^2 = bb(E) sum_(i j) \( partial_j Y_i \) \( partial_i Y_j \) + bb(E) sum_(i j) Y_i \( partial_i partial_j V \) Y_j . $ <eq:pre:4-5>]

The identity first holds conditionally and then in the full law. The conditional density has Gaussian decay: its first term is strictly positive quadratic and $S_g$ is bounded for each fixed finite system. The functions involved and their derivatives have at most polynomial growth in Gaussian variables, since the matrices remain in a fixed positive cone for that system. Thus the integration by parts has no missing boundary term.

=== 3.5 Three uniform band estimates <pre:bands>

The integration-by-parts identity in the preceding subsection contains a Hessian term and a crossed derivative term. We next control their ingredients uniformly in the number of modes, while retaining the exact contact cancellation in the Ward identity.

Fix $D \, D'$ and any requested power $N$. Take $K \/ L lt.eq B^(- J)$, with $J$ sufficiently large depending only on these fixed numbers and on the fixed test amplitude bounds. Retain $S gt.eq L$, (3.9), and $B m lt.eq K$. The constants denoted $P \( B \)$ below do not depend on the subsequently increased $J$.

==== 3.5.1 Sampling, gradients, and the good event <pre:part-5-1>

For any trigonometric field of band $O \( K \)$, with $K lt.double L$, we have

#[#set math.equation(numbering: n => "(3.22)")
 $ parallel N \( F \) parallel_square.stroked.tiny lt.eq C parallel F parallel_2 \, #h(2em) parallel D \( F \) parallel_square.stroked.tiny lt.eq C \( K \/ L \) parallel F parallel_2 \, quad parallel a parallel_square.stroked.tiny^2 = L^(- 2) sum_c \| a_c \|^2 . $ <eq:pre:5-1>]

Here is a direct sampling proof. Choose a smooth frequency cutoff equal to one on the allowed band and supported in a ball of radius $c L$, with fixed $c$. Its periodic convolution kernel $K_L$ satisfies, for any fixed $N_0 > 2$,

$ \| partial^r K_L \( z \) \| lt.eq C_(r \, N_0) L^(2 + r) \( 1 + L "dist" \( z \, bb(Z)^2 \) \)^(- N_0) . $

This follows by writing the kernel as the periodization of the rescaled inverse Fourier transform of the smooth cutoff and integrating that transform by parts. Since $F = K_L * F$, weighted Cauchy gives

$ sup_(z in c^(+)) \| F \( z \) \|^2 lt.eq C L^2 integral \( 1 + L "dist" \( z_c - y \, bb(Z)^2 \) \)^(- N_0) \| F \( y \) \|^2 thin d y . $

Sum over cells and divide by $L^2$; the remaining lattice sum is bounded. Apply the same argument to derivatives and use Parseval, $parallel partial^r F parallel_2 lt.eq \( C K \)^r parallel F parallel_2$. This proves (3.22), including its constant independent of the number of cells. The centered-difference Fourier multiplier also gives

#[#set math.equation(numbering: n => "(3.23)")
 $ parallel d_S u - nabla u parallel_2 lt.eq C \( K \/ S \)^2 parallel nabla u parallel_2 . $ <eq:pre:5-2>]

Although the matrix $G_0$ need not be well conditioned in the chosen basis, that is immaterial. The covariance of $nabla theta$ is $c_0^(- 1)$ times the orthogonal projection onto the gradient subspace. Evaluation of a band $O \( K \)$ gradient field has norm at most $C K$, and evaluation after one more derivative at most $C K^2$. Therefore

#[#set math.equation(numbering: n => "(3.24)")
 $ rho = L^(- 1) parallel nabla theta parallel_oo + L^(- 2) parallel nabla^2 theta parallel_oo lt.eq B^(- n) $ <eq:pre:5-3>]

outside an event of probability at most $e^(- B^3)$, for any prescribed fixed $n$ if $J$ is large enough. For the supremum bound one can use only the elementary Fourier estimate $parallel nabla F parallel_oo lt.eq C K^2 parallel F parallel_2 lt.eq C K^2 parallel F parallel_oo$ on this unit-volume torus. A grid of spacing $c K^(- 2)$ therefore captures at least half the supremum. It has $O \( K^4 \) lt.eq e^(C B)$ points by (3.9). At each point the gradient standard deviation is at most $C K \/ sqrt(c_0)$, and that of one more derivative at most $C K^2 \/ sqrt(c_0)$. After division by $L$ and $L^2$, respectively, the Gaussian tail exponent at the threshold in (3.24) is an arbitrarily high fixed power of $B$ when $J$ is increased. This proves the claimed probability after the finite union bound.

==== 3.5.2 Hessian estimate <pre:part-5-2>

From (3.20) and (3.16), the exact conditional Hessian is the sum of the cell stiffness form and the two quadratic noise forms. Replace $d_S u$ by $nabla u \( z_c \)$ using (3.14), (3.22), and (3.23). Conjugate each true cell stiffness back to its base value using (3.15). The color $a$ is fixed by $O_c$. The total error on (3.24) is at most

$ P \( B \) \[ K \/ L + \( K \/ S \)^2 + rho \] thin parallel nabla u parallel_2^2 . $

The remaining matrix sum is exactly $H_c^0 + C_c^0 + c_0 P_a = v I$. Consequently, for all directions simultaneously,

#[#set math.equation(numbering: n => "(3.25)")
 $ partial_u^2 V lt.eq \( v + B^(- N) \) parallel nabla u parallel_2^2 $ <eq:pre:5-4>]

on the good event. Everywhere the same upper bound holds with $P \( B \)$ in place of $v + B^(- N)$, by (3.13), (3.17), and (3.22). The crude bound

#[#set math.equation(numbering: n => "(3.26)")
 $ parallel J \( F \) parallel_p lt.eq C_p P \( B \) L parallel F parallel_2 $ <eq:pre:5-5>]

follows from (3.13), Cauchy over cells, and conditional Gaussian moments. Thus an exceptional event of probability $e^(- B^3)$ contributes an arbitrary inverse power of $B$ to every later finite moment expression, even if that expression has a fixed polynomial number of modes and a fixed polynomial factor in $L$: $log L lt.eq 16 B$.

==== 3.5.3 Nonabelian derivative estimate <pre:part-5-3>

Let at most $C K^2$ real directions $u_i$ satisfy

#[#set math.equation(numbering: n => "(3.27)")
 $ parallel nabla sum_i d_i u_i parallel_2 lt.eq C \| d \| \, #h(2em) N_c \( nabla u_i \) lt.eq C . $ <eq:pre:5-6>]

For real deterministic $F$ of band $O \( K \)$, perpendicular in color to $a$, write $F' = - a times F$. Then

#[#set math.equation(numbering: n => "(3.28)")
 $ bb(E) sum_i \| partial_i J \( F \) - 2 J \( u_i F' \) \|^2 lt.eq B^(- N) parallel F parallel_2^2 . $ <eq:pre:5-7>]

Here is the termwise proof. For $u = sum d_i u_i$, differentiation of the physical conditional mean gives exactly

#[#set math.equation(numbering: n => "(3.29)")
 $ partial_u j \( F \) = 2 j \( u F' \) + j \( r_u F' \) + L^(- 2) sum_c cal(H)_c \( a thin d_S u \, F \) \, $ <eq:pre:5-8>]

where $\( r_u \)_mu \( z \) = u \( z + e_mu \/ \( 2 S \) \) + u \( z - e_mu \/ \( 2 S \) \) - 2 u \( z \)$. Taylor or Fourier multipliers give $parallel r_u parallel_2 lt.eq C K S^(- 2) parallel nabla u parallel_2$. Using cell products in (3.13) and (3.22),

#[#set math.equation(numbering: n => "(3.30)")
 $ \| j \( r_u F' \) \| lt.eq P \( B \) L K S^(- 2) parallel nabla u parallel_2 parallel F parallel_2 . $ <eq:pre:5-9>]

The anchor-conjugation part of differentiating $sqrt(C_c)$ combines with the derivative of $n_c = O_c \( theta \) \( n_c^0 + sqrt(C_c^0) a nabla theta \/ L \)$ to give exactly the noise part of $2 J \( u F' \)$. The $n_0$ noise is in color $a$ and pairs to zero. The remaining deterministic noise drift is

#[#set math.equation(numbering: n => "(3.31)")
 $ L^(- 2) sum_c F_c dot.op sqrt(C_c) thin O_c \( theta \) sqrt(C_c^0) thin a nabla u \( z_c \) . $ <eq:pre:5-10>]

On the good event, (3.15) and the positive lower bound in (3.17) imply $sqrt(C_c) O_c sqrt(C_c^0) a = C_c a + O \( P \( B \) rho \)$. Together with the anchored version of the last term in (3.29), this leaves $F_c dot.op \( H_c + C_c \) a nabla u$, which is zero because $H_c + C_c = v I - c_0 P_a$ and $F perp a$. The error is at most

#[#set math.equation(numbering: n => "(3.32)")
 $ P \( B \) \[ K \/ L + \( K \/ S \)^2 + rho \] parallel nabla u parallel_2 parallel F parallel_2 . $ <eq:pre:5-11>]

Both (3.30) and (3.32) are bounds on a #emph[real scalar linear functional of $d$], holding pointwise uniformly for $\| d \| lt.eq 1$. Its squared norm is precisely the sum of the squared errors in the individual directions. One must not multiply these bounds by the number of directions. Complex test fields follow by applying the estimate separately to their real and imaginary parts, at the cost of a fixed factor.

There remains the non-anchor square-root derivative $Gamma_c \( u_i \)$, with $parallel Gamma_c \( u_i \) parallel lt.eq P \( B \) L^(- 1) N_c \( nabla u_i \)$. At the true data the corresponding error is $L^(- 1) sum_c F_c dot.op Gamma_c \( u_i \) n_c$. The noises $n_c$ are independent of $omega \, p$; $Gamma_c \( u_i \)$ depends on $omega$ and the deterministic direction, not on these noises. Hence

#[#set math.equation(numbering: n => "(3.33)")
 $ sum_i bb(E) lr(|L^(- 1) sum_c F_c dot.op Gamma_c \( u_i \) n_c|)^2 lt.eq P \( B \) K^2 / L^2 parallel F parallel_2^2 . $ <eq:pre:5-12>]

This last estimate does count the $O \( K^2 \)$ directions; its smallness comes from $K \/ L$. On the exceptional angular event use the everywhere polynomial drift bound, and then its probability. Equations (3.30)–(3.33) prove (3.28) after choosing $J$ sufficiently large. They explain exactly where a dimension loss is and is not allowed.

==== 3.5.4 Same-frequency Ward bound <pre:part-5-4>

For the uncentered defect

$ cal(D) \( F \, G \) = v L^(- 2) sum_c overline(F_c) dot.op G_c - bb(E) overline(J \( F \)) J \( G \) \, $

total covariance splitting and (3.14) compare it to the raw defect from (3.8), with error

#[#set math.equation(numbering: n => "(3.34)")
 $ P \( B \) \( K \/ L \) parallel F parallel_2 parallel G parallel_2 . $ <eq:pre:5-13>]

Let $eta = r xi \( z \) e^(i k dot.op z) \/ \( i \| k \| \)$, with $eta$ zero on the boundary, $\| r \| lt.eq 1$, $m lt.eq \| k \| lt.eq C K$, and $xi$ having band $O \( m \)$, bounded supremum, and fixed polynomial $C^3$ bounds. Let $G$ be an exact gradient of a potential of the same type and frequency, or a bounded constant matrix times $xi_2 e^(i k dot.op z)$. Require the amplitude’s first derivative divided by $\| k \|$ bounded, as is the case in all uses below. Apply (3.8) with $eta$ as defined; the identity already conjugates its first argument. Its contact cancels the raw defect. In the bracket term the two Fourier phases cancel even at the centered endpoints; the remaining current test has $C^1$ norm $P \( B \) \/ \| k \|$. For a gradient $G$, its centered amplitude differences and the factors $S sin \( k_mu \/ \( 2 S \) \)$ have the same bound after division by $\| k \|$. Thus (3.10) and (3.34) imply

#[#set math.equation(numbering: n => "(3.35)")
 $ \| cal(D) \( d_S eta \, G \) \| lt.eq P \( B \) \/ \| k \| + B^(- N) . $ <eq:pre:5-14>]

The raw Ward identity must be applied before replacing the gradient by its leading Fourier symbol. Otherwise the exact contact cancellation is lost.

=== 3.6 A weighted current estimate <pre:weighted>

The band estimates control differentiated currents. We now sum them with frequency weights whose convolutions remain summable. This is the auxiliary estimate needed to bound the crossed derivative term in the variance gain; it is not yet the stiffness improvement itself.

Fix an integer $N_(*) > 100 \( 1 + D + D' \)$ and apply the band estimates with accuracy $B^(- 10 N_(*))$. Increase the fixed exponent $J$ whenever required below. The error estimates in the next two subsections are then bounded by $C B^(- N_(*))$. To track this convention, all remaining weighted frequency sums are bounded by fixed powers of $T \, T_w lt.eq C B$; all cutoff derivative and cell-moment constants are fixed powers of $B$. The only crude factors in $L$ occur with an $S^(- 2)$ Taylor remainder or an event of probability $e^(- B^3)$. Since $S gt.eq L$ and $log L lt.eq 16 B$, those errors are also at most $B^(- N_(*))$. No unweighted count of the main frequency band is used in this convention.

Choose a sufficiently large fixed exponent $J$ and set

$ M = B^J \, quad K = L \/ B^J \, quad L gt.eq B^(10 J) \, quad psi \( z \) = product_(mu = 1)^2 \[ 1 - cos^(2 m) \( pi z_mu \) \] \, quad m = ceil.l B^4 ceil.r . $

All fixed powers of $psi$ have Fourier $ell^1$ norm bounded independently of $B$, band $O \( m \)$, and fixed derivative bounds polynomial in $B$. Put $chi = psi^2$; then

#[#set math.equation(numbering: n => "(3.36)")
 $ I_chi = integral_(\[ 0 \, 1 \]^2) chi^2 gt.eq 1 - C B^(- 2) . $ <eq:pre:6-1>]

This follows from the Gaussian decay of $cos^(2 m) \( pi z \)$ away from the seams and an exceptional width $O \( m^(- 1 \/ 2) \)$.

In a long step use $K_1 = L \/ B^(4 J)$, $K_2 = L \/ B^(3 J)$. In a short step use $K_1 = 8 M$, $K_2 = 256 M$. The main reciprocal lattice is $2 pi bb(Z)^2$, and

#[#set math.equation(numbering: n => "(3.37)")
 $ T = sum_(M lt.eq \| k \| lt.eq K_1) \| k \|^(- 2) = frac(1, 2 pi) log \( K_1 \/ M \) + O \( M^(- 1) \) \, #h(2em) c lt.eq T lt.eq C B . $ <eq:pre:6-2>]

The coefficient is $\( 2 pi \)^(- 2) times 2 pi = 1 \/ \( 2 pi \)$. The sum here includes both signs of the Fourier frequencies, equivalently both normalized real modes for each pair.

==== 3.6.1 The weight and its convolution <pre:part-6-1>

For dyadic $H$ from $M$ up to $K_2$, let

$ p_H \( k \) = H^(- 2) e^(- sqrt(\| k \| \/ H)) \, quad w \( k \) = sum_H p_H \( k \) \, quad T_w = sum_k w \( k \) . $

Then

#[#set math.equation(numbering: n => "(3.38)")
 $ T_w asymp 1 + log \( K_2 \/ M \) \, quad w * w lt.eq C T_w w \, quad \( m + \| k \| \)^2 w \( k \) lt.eq C \, $ <eq:pre:6-3>]

and $w \( k \) gt.eq c \( M + \| k \| \)^(- 2)$ for $\| k \| lt.eq K_2 \/ 2$. Shifts of size $O \( m \)$ change $w$ by at most a fixed factor.

For completeness, if $H lt.eq H' \/ 4$,

$ sqrt(\| l \| \/ H) + sqrt(\| k - l \| \/ H') gt.eq 1 / 2 sqrt(\| l \| \/ H) + sqrt(\| k \| \/ H') \, $

so summing $l$ proves $p_H * p_(H') lt.eq C p_(H')$. If $H' \/ 4 lt.eq H lt.eq H'$, split into $\| l \| lt.eq \| k - l \|$ and its complement and use

$ sqrt(\| l \|) + sqrt(\| k - l \|) gt.eq sqrt(\| k \|) + c sqrt(min \( \| l \| \, \| k - l \| \)) . $

The retained exponential is summable on the comparable scale. Summing over the dyadic pair of scales proves the convolution bound. The other claims follow directly by dyadic summation.

The tail $\| k \| > K - O \( m \)$ is negligible to every fixed inverse power of $B$, even against fixed polynomial factors in $L \, B \, \| k \| \/ L$. In the long case $sqrt(K \/ K_2) = B^J$, whereas $log L lt.eq 16 B$; the short case has an even larger separation.

==== 3.6.2 Closing a two-color estimate <pre:part-6-2>

Fix perpendicular colors $r \, r'$, with $r' = - a times r$. For both real modes in each frequency pair with $2 M lt.eq \| k_p \| lt.eq 4 M$, put

$ b_p = \| k_p \|^(- 2) \, #h(2em) G_p^r = r thin d_S \( psi tilde(phi)_p \/ \| k_p \| \) \, $

where the quadrature modes are $sqrt(2) sin \, - sqrt(2) cos$ for $sqrt(2) cos \, sqrt(2) sin$, respectively. The Ward bound gives

#[#set math.equation(numbering: n => "(3.39)")
 $ sum_p b_p bb(E) J \( G_p^r \)^2 lt.eq C v . $ <eq:pre:6-4>]

Indeed the summed contact is $O \( v \)$, the annular sum of $b_p$ is $O \( 1 \)$, and the error $P \( B \) \/ M + B^(- N)$ can be made $o \( v \)$.

Take directions $u_i = sqrt(w \( k_i \)) psi phi_i$, $\| k_i \| lt.eq K$, and set

$ Y_(p i) = J \( G_p^r u_i \) \, #h(2em) U^r = sum_p b_p sum_i bb(E) Y_(p i)^2 . $

The directions obey (3.27) by (3.38), Parseval, and the bounded multiplier norms of $psi$. Use the adjoints for the base-data-fixed conditional law in (3.21), and define

$ D_p = sum_i partial_i^(*) Y_(p i) \, #h(2em) F_p = - G_p^(r') . $

The sign is fixed by $\( r' \)' = - r$: the prime field of $F_p$ is $G_p^r$. Conditional integration by parts and (3.28) therefore give

$ sum_p b_p bb(E) \[ J \( F_p \) D_p \] = sum_(p i) b_p bb(E) \[ \( partial_i J \( F_p \) \) Y_(p i) \] = 2 U^r + O \( B^(- N_(*)) \) sqrt(U^r) . $

Weighted Cauchy and (3.39) bound the square of this expression by $C v sum_p b_p bb(E) D_p^2$. To estimate the latter sum, apply (3.21) to each vector $Y_p$. The Hessian contribution is at most $C v U^r + O \( B^(- N_(*)) \)$. Bound the crossed derivative term by $sum_(p i j) b_p bb(E) \| partial_j Y_(p i) \|^2$. A second use of (3.28) bounds this Frobenius sum by

#[#set math.equation(numbering: n => "(3.40)")
 $ C sum_(p i j) b_p bb(E) \| J \( G_p^(r') u_i u_j \) \|^2 + O \( B^(- N_(*)) \) lt.eq C T_w U^(r') + O \( B^(- N_(*)) \) . $ <eq:pre:6-5>]

For the last inequality use complex Fourier modes in $i \, j$, apply $w * w lt.eq C T_w w$, and remove the extra power of $psi$ by its bounded Fourier $ell^1$ norm and the shift bound for $w$. Frequencies beyond the truncated set are negligible by the preceding tail estimate and the elementary extension of (3.26), $parallel J \( G_p^(r') psi e^(i k z) \) parallel_2 lt.eq P \( B \) L \( 1 + \| k \| \/ L \)$. The derivative-error sum costs $B^(- N) sum_i parallel G_p^r u_i parallel_2^2 lt.eq C B^(- N) T_w$, not $B^(- N) K^2$.

We have consequently proved

$ sum_p b_p bb(E) D_p^2 lt.eq C v U^r + C T_w U^(r') + O \( B^(- N_(*)) \) . $

Interchanging the colors gives the same inequality with $r \, r'$ reversed, since $U^(- r) = U^r$. Thus neither color estimate is assumed in proving the other. Let $U = max \( U^r \, U^(r') \)$. Unless $U lt.eq C B^(- 2 N_(*))$, the signal lower bound gives $U^2 lt.eq C v \( v + T_w \) U + C v B^(- N_(*))$. Solving this quadratic and using $v gt.eq B^(- D)$ gives

#[#set math.equation(numbering: n => "(3.41)")
 $ U^r + U^(r') lt.eq C v \( v + T_w \) . $ <eq:pre:6-6>]

==== 3.6.3 Extracting all spatial directions <pre:part-6-3>

At fixed total complex frequency $n = k_p + k_i$, $\| n \| lt.eq 4 K_1$, take the common positive lower bound $w \( n - k_p \) gt.eq c \( M + \| n \| \)^(- 2)$. Write

$ psi_mu^(+) \( z \) = 1 / 2 #scale(x: 120%, y: 120%)[\[] psi \( z + e_mu \/ \( 2 S \) \) + psi \( z - e_mu \/ \( 2 S \) \) #scale(x: 120%, y: 120%)[\]] . $

The exact gradient factor in spatial direction $mu$ is

$ hat(k)_(p mu) "sinc" \( k_(p mu) \/ \( 2 S \) \) psi_mu^(+) + frac(S cos \( k_(p mu) \/ \( 2 S \) \), i \| k_p \|) \[ psi \( z + e_mu \/ \( 2 S \) \) - psi \( z - e_mu \/ \( 2 S \) \) \] . $

Under $k_p mapsto - k_p$ its first part changes sign and its second part does not. Pairing the two squared currents cancels the interference term and permits discarding the second square. Separate coordinate reflections of $k_p$ then cancel the mixed spatial terms. The annular sum of each diagonal coefficient is bounded below by a positive constant. Replacing $psi psi_mu^(+)$ by $psi^2$ has Fourier size $P \( B \) S^(- 2)$, so (3.26) makes its summed error negligible. It follows that

#[#set math.equation(numbering: n => "(3.42)")
 $ #box(stroke: black, inset: 3pt, [$ quad W^r := sum_(\| n \| lt.eq 4 K_1) \( M + \| n \| \)^(- 2) sum_(mu = 1)^2 bb(E) \| J \( r e_mu psi^2 e^(i n dot.op z) \) \|^2 lt.eq C v \( v + T_w \) . quad $]) $ <eq:pre:6-7>]

This is the auxiliary weighted estimate. It has not been assumed in any preceding replacement.

=== 3.7 The variance gain <pre:variance>

We now use the weighted estimate to obtain a lower bound on current variance. Through (3.19), this becomes the desired decrease of the stiffness upper bound.

For a real constant $3 times 2$ matrix $A$ of Hilbert–Schmidt norm one, choose a unit $a$ perpendicular to both its columns. This is where the three-dimensional imaginary quaternion space is used. Put $A' = - a times A$, so $\| A' \| = 1$. On the main annulus set

$ u_i = chi phi_i \/ \| k_i \| \, quad G_i^(A') = d_S #scale(x: 120%, y: 120%)[\(] chi \( A' hat(k)_i \) tilde(phi)_i \/ \| k_i \| #scale(x: 120%, y: 120%)[\)] \, quad Y_i = J \( G_i^(A') \) \/ \| k_i \| . $

The gradient Gram operator of the $u_i$ is bounded by $\( 1 + C m \/ M \)^2$. The Ward bound, exact quadrature, and $sum \| k \|^(- 2) hat(k) hat(k)^T = \( T \/ 2 \) I_2$ yield

#[#set math.equation(numbering: n => "(3.43)")
 $ sum_i bb(E) Y_i^2 = v I_chi T \/ 2 + O \( B^(- N_(*)) \) \, #h(2em) sum_i bb(E) \( partial_i J \( A \) \) Y_i = v I_chi T + O \( B^(- N_(*)) \) \, $ <eq:pre:7-1>]

#[#set math.equation(numbering: n => "(3.44)")
 $ bb(E) Y^T V'' Y lt.eq v^2 I_chi T \/ 2 + O \( B^(- N_(*)) \) . $ <eq:pre:7-2>]

The second formula in (3.43) uses the factor two in (3.28). The leading-symbol replacement of $G_i$ is made only inside the contact pairing after applying (3.35), with error $C \[ m \/ \| k_i \| + \( \| k_i \| \/ S \)^2 \]$. Summing with $\| k_i \|^(- 2)$ makes the total arbitrarily small. The same error convention, chosen stronger than all needed powers of $v$, is used in this section.

==== 3.7.1 The crossed term <pre:part-7-1>

The estimate needed is

#[#set math.equation(numbering: n => "(3.45)")
 $ lr(|sum_(i j) bb(E) \( partial_j Y_i \) \( partial_i Y_j \)|) lt.eq C \[ v T^2 + v \( v + T_w \) \] . $ <eq:pre:7-3>]

By (3.28) the derivative array is, up to a negligible summed-square error, $- 2 J \( G_i^A chi phi_j \) \/ \( \| k_i \| \| k_j \| \)$. Its complex change of basis deserves a convention check. For a real matrix $D$, transforming both indices by a unitary matrix $U$ produces $D' = U D U^T$. Then $sum_(i j) D'_(i j) overline(D'_(j i)) = "Tr" \( D^2 \)$, because $U^T overline(U) = I$. Thus the crossed pairing becomes the sesquilinear pairing of the two arrays at the #emph[same total frequency] $n = k + l$; it is not a bilinear pairing without conjugation in the complex basis.

For main-annulus frequencies define

$ H_0 \( n \) = sum_(k + l = n) \| k \|^(- 2) \| l \|^(- 2) . $

Elementary annular summation gives

#[#set math.equation(numbering: n => "(3.46)")
 $ H_0 \( n \) lt.eq C T \( M + \| n \| \)^(- 2) . $ <eq:pre:7-4>]

For $\| n \| < 2 M$, $T$ can be replaced by a constant. For $\| n \| gt.eq 2 M$, it can also be replaced by a constant if the summand is multiplied by $min \( 1 \, min \( \| k \| \, \| l \| \) \/ \| n \| \)$. To prove these statements split where $\| k \| lt.eq \| n \| \/ 2$, where $\| l \| lt.eq \| n \| \/ 2$, and the complement. In the first region the other denominator is $O \( \| n \|^(- 2) \)$, and the annular sum of $\| k \|^(- 2)$ produces the logarithm; the inserted $\| k \| \/ \| n \|$ removes it. The complementary comparable-size region and its $\| k \| gt.eq 2 \| n \|$ tail are summable without a logarithm. For small $n$, the cutoff $\| k \| \, \| l \| gt.eq M$ gives the bound directly.

Together with (3.42), (3.46) bounds the summed square norms of fields $psi^2 e^(i n z)$ with bounded constant transverse-color coefficients by $C T v \( v + T_w \)$. A Fourier multiplier whose coefficients have a common summable majorant of total $C$, supported at shifts $O \( m \)$, preserves this estimate. Cauchy with the absolute Fourier coefficients and the bounded shift cost of $\( M + \| n \| \)^(- 2)$ proves this last claim.

It is therefore legitimate to replace $G_k^A chi e^(i l z)$ by

#[#set math.equation(numbering: n => "(3.47)")
 $ e^(i n z) chi^2 A P_k \, #h(2em) P_k = hat(k) hat(k)^T . $ <eq:pre:7-5>]

Before and after replacement, factor out $psi^2 e^(i n z)$; the residual Fourier coefficients have common $ell^1$ majorants. The error majorant is $C \[ m \/ M + \( K_1 \/ S \)^2 \]$, from the exact centered-gradient formula. Hence all these replacements are negligible by (3.42), (3.46), and Cauchy. The small-$n$ part already obeys (3.45).

For $\| n \| gt.eq 2 M$, split the spatial index in (3.47) into directions parallel and perpendicular to $n$. Replace the longitudinal component by

#[#set math.equation(numbering: n => "(3.48)")
 $ d_S (chi^2 A P_k hat(n) thin e^(i n z) \/ \( i \| n \| \)) . $ <eq:pre:7-6>]

This replacement also has a small summed-square error, but two sorts of error must be distinguished. The sinc error and the first derivative of $chi^2 = psi^4$ are divisible by $psi^2$ and have common Fourier majorants of total $C \[ \( K_1 \/ S \)^2 + m \/ M \]$, so (3.42) applies. The symmetric-shift error and the centered Taylor remainder have Fourier size $P \( B \) \/ S^2$ and need not be divisible by $psi^2$; use (3.26) instead. Its factor $L \/ S^2 lt.eq 1 \/ L$ makes their sum negligible. This avoids an unjustified division by a cutoff that vanishes at the boundary.

If at least one paired field is now the exact gradient (3.48), (3.35) bounds its uncentered current pairing with the other same-frequency field by $C v$. Summing $\| k \|^(- 2) \| l \|^(- 2)$ yields $C v T^2$.

For two transverse spatial components, the product of coefficient norms is at most

#[#set math.equation(numbering: n => "(3.49)")
 $ \| sin angle \( k \, n \) \| thin \| sin angle \( l \, n \) \| lt.eq min (1 \, frac(min \( \| k \| \, \| l \| \), \| n \|)) . $ <eq:pre:7-7>]

For example, if $\| k \| lt.eq \| l \|$, then $\| sin angle \( l \, n \) \| = \| k times l \| \/ \( \| l \| \| n \| \) lt.eq \| k \| \/ \| n \|$; bound the other sine by one. Bound the pairing of the constant-coefficient fields by this product times the sum of the four coordinate current second moments. The improved version of (3.46) and (3.42) then give $C v \( v + T_w \)$. This proves (3.45).

==== 3.7.2 Variance gain <pre:part-7-2>

Set $cal(S) = sum_i partial_i^(*) Y_i$, using the directions and vector field defined above (3.43). Conditional integration by parts gives $bb(E) \[ cal(S) divides upright("base data") \] = 0$ and

$ "Cov" \( J \( A \) \, cal(S) \) = sum_i bb(E) \[ \( partial_i J \( A \) \) Y_i \] = v I_chi T + O \( B^(- N_(*)) \) . $

Equation (3.21) expresses $bb(E) cal(S)^2$ as the Hessian contribution plus the crossed derivative term. Their bounds (3.44)–(3.45), followed by $\| "Cov" \( J \( A \) \, cal(S) \) \|^2 lt.eq "Var" J \( A \) bb(E) cal(S)^2$, give

#[#set math.equation(numbering: n => "(3.50)")
 $ "Var" J \( A \) gt.eq frac(\( v I_chi T + O \( B^(- N_(*)) \) \)^2, v^2 I_chi T \/ 2 + C \[ v T^2 + v \( v + T_w \) \] + O \( B^(- N_(*)) \)) . $ <eq:pre:7-8>]

In the long regime $v gt.eq h gt.eq 1$, $log L lt.eq h$, use $\( 1 + x \)^(- 1) gt.eq 1 - x$, (3.36), and (3.37):

#[#set math.equation(numbering: n => "(3.51)")
 $ "Var" J \( A \) gt.eq 2 I_chi T - C \[ 1 + T^2 \/ v + T_w \/ v \] gt.eq frac(log L, pi) - C_J [log B + frac(\( log L \)^2, v)] . $ <eq:pre:7-9>]

In the short regime $T \, T_w$ are bounded above and below by absolute constants, and (3.50) gives

#[#set math.equation(numbering: n => "(3.52)")
 $ "Var" J \( A \) gt.eq c_(upright("sh")) min \( v \, 1 \) . $ <eq:pre:7-10>]

The positive constant $c_(upright("sh"))$ can be fixed before choosing the final large $J$ and $B$: all analytic leading constants in (3.42) and (3.45) are absolute, while those choices only suppress errors. This is necessary for the low-stiffness induction below.

=== 3.8 Iteration of the stiffness bound <pre:iteration>

Fix any sufficiently large $D$, then $D' > D$, and fix $J$ to make all preceding errors as small as required. Start with the uniform upper bound $H_1 lt.eq b I$. If $b lt.eq B^(- D)$, no step is needed.

For $h gt.eq A log B$, use

$ v = h + 1 \, quad c_0 = 1 \/ 2 \, quad L = ⌈e^(sqrt(h log B))⌉ . $

Choose fixed $A$ large compared with $J^2$ and the constants in (3.51). Then $L gt.eq B^(10 J)$, $log L lt.eq h$, (3.17) holds, and (3.19), (3.51) decrease the stiffness upper bound by

$ delta h gt.eq \( log L \) \/ pi - C log B gt.eq c sqrt(h log B) . $

There are at most $C sqrt(B \/ log B)$ such steps. Summing the relation $log L lt.eq pi delta h + C log B$ gives a total logarithmic side length at most

#[#set math.equation(numbering: n => "(3.53)")
 $ pi b + C_D sqrt(B log B) . $ <eq:pre:8-1>]

Stop at $h lt.eq C log B$, using a weaker positive upper bound at the crossing if necessary. Now take a small fixed $delta < c_(upright("sh")) \/ 4$, and use

$ v = h + delta min \( h \, 1 \) \, quad c_0 = 1 / 2 delta min \( h \, 1 \) \, quad L = ceil.l B^(11 J) ceil.r . $

The matrix lower bounds in (3.17) hold with $D' > D$, after increasing the fixed lower threshold for $B$. Equations (3.19), (3.52) reduce $h$ by at least $c min \( h \, 1 \)$. It takes $O_D \( log B \)$ steps to reach $B^(- D)$, at total additional logarithmic length $O_D \( \( log B \)^2 \)$. This is absorbed in (3.53).

At all stages $log \( 2 + S \) lt.eq 16 B$ holds once $B$ exceeds a threshold depending only on the fixed choices: the accumulated bound is $pi b + o \( B \)$, and a proposed next step adds at most $B$. This verifies the premise used in the moment bounds, rather than assuming it retrospectively.

We have proved, uniformly over the signed/twisted/pinned class, that there is a common integer side $R_(*)$ with

#[#set math.equation(numbering: n => "(3.54)")
 $ #box(stroke: black, inset: 3pt, [$ med H_(R_(*)) lt.eq B^(- D) I \, #h(2em) log R_(*) lt.eq pi b + C_D sqrt(B log B) . med $]) $ <eq:pre:8-2>]

=== 3.9 Uniform control of local rotations <pre:rotations>

Take coarse cells of integer side comparable to $s = R_(*) M_(*)$, where $M_(*) = ceil.l B^(D + C_0) ceil.r$. Rectangles with sides in $\[ s \, 2 s \]$ allow arbitrary sufficiently large tori to be tiled. Profiles below are supported on a fixed number of coarse cells, vanish at the outer boundary of a fixed collar, are continuous across cells, and have uniformly bounded cellwise $C^2$ extensions. Pins lie outside the collar.

For one fixed-axis profile $f$, the effective coarse ring action $F$ obeys

#[#set math.equation(numbering: n => "(3.55)")
 $ D_f^2 F lt.eq C B^(- D) $ <eq:pre:9-1>]

at every ring configuration. To prove it, subdivide each coarse cell into side-$R_(*)$ squares and possible leftover strips of total area $O \( s R_(*) \)$. Conditional variance subtraction bounds its Hessian above by the sum of the subcell Hessians. The gradient test on a small square has size $O \( M_(*)^(- 1) \)$, with variation smaller by another $M_(*)^(- 1)$. Equations (3.54), (3.14) bound each small-square cost by $C M_(*)^(- 2) \[ B^(- D) + P \( B \) \/ M_(*) \]$. Summing gives $C B^(- D) + P \( B \) \/ M_(*)$. On leftover strips discard the negative variance and use the contact bound: their total cost is $C B R_(*) \/ s = C B \/ M_(*)$. Choose $C_0$ large enough. The polynomial in this use of (3.14) is independent of $D$, so the choice is not circular.

Haar integration by parts on the free ring spins gives

#[#set math.equation(numbering: n => "(3.56)")
 $ bb(E) \( D_f F \)^2 = bb(E) D_f^2 F lt.eq C B^(- D) . $ <eq:pre:9-2>]

For the normalized square-root density $phi$ relative to product Haar, this is $parallel D_f phi parallel_2^2 lt.eq C B^(- D)$. Pullbacks by deterministic ring rotations are unitary. Integrate the derivative along a fixed-axis rotation and telescope a bounded number of such factors. For every allowed product $phi.alt$,

#[#set math.equation(numbering: n => "(3.57)")
 $ bb(E) (e^(- \[ F \( phi.alt omega \) - F \( omega \) \] \/ 2) - 1)^2 lt.eq C B^(- D) . $ <eq:pre:9-3>]

Thus a specified action displacement exceeds fixed $epsilon.alt > 0$ with probability $O_epsilon.alt \( B^(- D) \)$.

==== 3.9.1 Uniformity over profile parameters <pre:part-9-1>

Let $phi.alt_lambda$ vary smoothly on a fixed-dimensional compact parameter rectangle, with fixed bounded spatial and parameter derivatives, and have a compact smooth homotopy to identity of this same class. Such a homotopy can be subdivided into finitely many small increments, each factored into three fixed-axis profiles by smooth local product coordinates on $S^3$, so (3.57) holds uniformly at each specified parameter.

A compact microscopic Lie-algebra score with bounded Dirichlet energy is subGaussian with variance bound $C B$, by (3.11) and Hölder over its three colors. The coarse score is its conditional expectation and has the same bound. The likelihood of any one of the present rotations is bounded in fixed $L^p$ by $e^(C_p B)$; apply the score and second-variation estimates for one factor and the likelihood cocycle and Hölder for finitely many factors. Consequently at rotated data

$ Pr \( \| partial_lambda F \( phi.alt_lambda omega \) \| > t \) lt.eq min \( 1 \, exp \[ C B - c t^2 \/ B \] \) \, $

In particular, choose a fixed $A$ so that the exponent is at most $- c t^2 \/ \( 2 B \)$ for $t gt.eq A B$. The layer-cake formula then gives

$ bb(E) \| partial_lambda F \( phi.alt_lambda omega \) \|^p lt.eq \( A B \)^p + p integral_(A B)^oo t^(p - 1) e^(- c t^2 \/ \( 2 B \)) thin d t lt.eq C_p \( 1 + B \)^p . $

Thus the exponential likelihood bound produces a polynomial moment bound after its Gaussian tail is taken into account.

Take $p > 2 d$, where $d$ is the fixed parameter dimension. Morrey’s estimate bounds the parameter Hölder-$1 \/ 2$ seminorm of the displacement by $B^2$ with probability $1 - O \( B^(- p) \)$. A mesh of spacing $B^(- 6)$ has $O \( B^(6 d) \)$ points and then incurs a displacement error at most $C B^(- 1)$. Union bounding (3.57) over this mesh proves

#[#set math.equation(numbering: n => "(3.58)")
 $ Pr (sup_lambda \| F \( phi.alt_lambda omega \) - F \( omega \) \| > epsilon.alt) lt.eq zeta \( B \) \, #h(2em) zeta \( B \) arrow.r 0 \, $ <eq:pre:9-4>]

provided $D > 10 d + 10$, for example. All estimates are uniform under conditioning outside the collar.

=== 3.10 Coarse orientations and decay of charged observables <pre:orientations>

Independently adjoin Haar variables $g_X in S^3$ at free coarse vertices, equal to identity at pinned boundary vertices. On a directed coarse edge $X arrow.r Y$, interpolate by

$ Phi \( g \; t \) = g_X exp \[ eta \( t \) ell \( g_X^(- 1) g_Y \) \] \, $

where $eta$ is fixed smooth and constant near endpoints, and $ell$ is any fixed measurable logarithm of norm at most $pi$, equal to zero at identity. Write the retained spin ring as $omega = Phi \( g \) tilde(omega)$. At fixed $g$ this is a Haar-preserving change of ring variables. Conditional on $tilde(omega)$, the $g$’s have density proportional to $e^(- F \( Phi \( g \) tilde(omega) \))$, a finite-range Gibbs density.

For every unpinned cell its potential is invariant under common left multiplication of its incident $g$’s: $\( k g_X \)^(- 1) \( k g_Y \) = g_X^(- 1) g_Y$, so $Phi \( k g \) = k Phi \( g \)$, and simultaneous left rotation of the cell’s rings and interior preserves its action even with the fixed right twists.

Call an interior vertex bad if, for some values of the neighboring $g$’s, varying its own $g_X$ changes the incident-cell action by more than $epsilon.alt$. Enlarge the test to permit all logarithms of the prescribed bounded size satisfying the endpoint equations, using the same data on unaffected edges. This enlargement makes the test a supremum over a compact parameter set and covers every branch choice of the measurable interpolation.

==== 3.10.1 Why the required profiles form finitely many smooth families <pre:part-10-1>

Fix a star and its true redundant data. Two trial assignments differing only at its center produce relative ring rotations $Phi \( g^(\( j \)) \) Phi \( g^(upright("true")) \)^(- 1)$, $j = 1 \, 2$. They agree along the star perimeter. Treat vertex quaternions and all bounded edge logarithms, including the true ones, as independent ambient parameters, imposing their endpoint equations only on the compact subset of valid assignments.

At any valid parameter value the finitely many relative edge arcs, together with identity, omit some point of $S^3$: a finite union of smooth compact curves has zero three-dimensional volume. Their distance from that chosen point is positive and remains positive on a parameter neighborhood. Use stereographic coordinates on its complement, and ordinary local coordinates for the finitely many vertex parameters.

For neighboring ambient parameters not satisfying endpoint equations, correct each arc in stereographic coordinates near its endpoints so that it takes the prescribed relative vertex values. The corrections use fixed smooth cutoff functions and are zero on the valid subset. The original edge profiles are flat near vertices, so these corrected profiles are uniformly smooth within each coarse edge.

Extend to coarse cells by a Coons interpolation: add the two linear normal extensions of each pair of opposite side curves and subtract the bilinear interpolant of the four corner values. This matches all four sides. In the outer collar choose the additional edge and vertex data tending to identity, and choose this construction using only the common star-perimeter data. Thus the two extensions agree everywhere outside the star for valid assignments. The profiles are identity on and outside the outer collar boundary. Linear homotopy of their stereographic coordinates to the identity coordinate gives compact homotopies with the required uniform cellwise derivative bounds.

The compact valid parameter set has a finite subcover by such neighborhoods, which may be reduced to closed coordinate rectangles. All chart, extension, derivative, and homotopy constants are then finite and independent of the lattice side, coupling, spin configurations, and actual branch choices. Rectangular coarse-cell aspect ratios in $\[ 1 \/ 2 \, 2 \]$ add only compact parameters.

This justifies applying (3.58) to the entire bad-site test. In the original joint law, condition on the true $g$’s. The test is now a local event in the true ring variables $omega$, of probability at most $zeta$ even conditional on all rings outside a fixed collar. The two complete action displacements differ exactly by the incident-star displacement, since the extensions agree outside the star. A finite coloring of the collar-overlap graph selects at least $\| E \| \/ C$ vertices with disjoint collars from any finite set $E$. Iterated conditioning gives

#[#set math.equation(numbering: n => "(3.59)")
 $ Pr \( E upright(" is entirely bad") \) lt.eq zeta^(\| E \| \/ C) . $ <eq:pre:10-1>]

==== 3.10.2 Disagreement exploration with correct marginals <pre:part-10-2>

The exploration follows the disagreement-percolation mechanism of van den Berg and Maes #cite(label("VanDenBergMaes1994")). Their finite-spin theorem is not invoked for the present continuous spin space: the Haar minorization and the adaptive marginal argument are proved below.

Fix $tilde(omega)$ and call the conditional orientation law $nu$. Its pushforward $nu_k$ under common left multiplication by $k$ on all free vertices differs from $nu$ only in potentials near the pinned boundary. At each good interior vertex every one-site conditional density, under either law and every neighboring configuration, is at least $e^(- epsilon.alt)$ times Haar. The same holds with only partial conditioning, by averaging the full conditional densities.

Seed a possible disagreement on a fixed-width boundary layer. Repeatedly reveal a vertex neighboring possible disagreements. At a good vertex couple the two appropriate conditional marginals by their common $e^(- epsilon.alt)$-Haar component; use a preassigned independent Bernoulli variable of parameter $q = 1 - e^(- epsilon.alt)$ for the possible failure. At a bad vertex always permit failure. A successful vertex is assigned the same value. If the remaining unassigned components no longer touch a disagreement, their conditional distributions agree by the finite-range Markov form and can be sampled identically.

The adaptive order causes no marginal error. For a test $H$ of one completed configuration, the original-law conditional expectation $nu \[ H divides upright("that marginal’s assigned values") \]$ is a martingale relative to the full exploration history: for whichever vertex the history selects, sampling its value from that original-law conditional uses exactly the tower identity. This proof also covers the joint sampling of a remaining component at the stopping time.

A disagreement at a specified interior vertex requires an open simple path to the boundary seed, where all good vertices have failed their Bernoulli trials. The trials can be chosen independent of $tilde(omega)$. For a fixed path of $r$ tested vertices, (3.59) gives

#[#set math.equation(numbering: n => "(3.60)")
 $ bb(E) \[ q^(\# upright("good")) \] lt.eq \( q + zeta^(1 \/ C) \)^r . $ <eq:pre:10-2>]

This follows by expanding $product_v \[ q + \( 1 - q \) upright(bold(1))_(v upright(" bad")) \]$ and applying (3.59) to every subset. Choose fixed $epsilon.alt$ small and then $B$ large enough that the right side beats the bounded-degree path count. The connection probability is then at most $C e^(- c thin upright("distance") \/ s)$.

For a bounded original observable $O$ supported on $A$, whose average under a common left rotation is identically zero, integrate cell interiors at their transformed rings. The resulting $O^(*) \( g \)$ depends on at most $C \| A \|$ coarse vertices and still has identically zero common-left average. Comparing $nu$ with $nu_k$, using (3.60), and averaging $k$ proves

#[#set math.equation(numbering: n => "(3.61)")
 $ \| bb(E) O \| lt.eq C parallel O parallel_oo \| A \| e^(- c d_(upright("pin")) \/ s) . $ <eq:pre:10-3>]

For bounded Haar-centered one-site $O \( q_x \)$, condition on the boundary of a coarse region within a third of the distance from $x$ to another site $y$. Apply (3.61) inside and multiply by any bounded one-site observable at $y$. In unpinned sufficiently large tori,

#[#set math.equation(numbering: n => "(3.62)")
 $ \| bb(E) O \( q_x \) O' \( q_y \) \| lt.eq C parallel O parallel_oo parallel O' parallel_oo e^(- c d \( x \, y \) \/ s) . $ <eq:pre:10-4>]

Small distances use the trivial bound. Rectangular tilings and collars work whenever each periodic side is at least $C s$. Free subgraphs are obtained by padding with zero couplings. Right twists and signed couplings are still allowed in this step; no association is being used yet.

=== 3.11 Mixing for arbitrary local observables <pre:neutral>

From now on use the untwisted zero-field ferromagnet, with $0 lt.eq b_e lt.eq b$. This restriction is essential. Neither the association argument nor its conclusion is being claimed for arbitrary pinned or frustrated systems.

==== 3.11.1 Association and the covariance inequality <pre:part-11-1>

The covariance estimate below belongs to the association literature #cite(label("Newman1980")) #cite(label("BulinskiShabanovich1998")); the elementary proof is included. For a finite associated collection of scalar random variables $X_i$ with finite second moments, and functions with individual Lipschitz constants $ell_(F \, i) \, ell_(G \, j)$,

#[#set math.equation(numbering: n => "(3.63)")
 $ \| "Cov" \( F \, G \) \| lt.eq sum_(i j) ell_(F \, i) ell_(G \, j) "Cov" \( X_i \, X_j \) . $ <eq:pre:11-1>]

Let $U = sum_i ell_(F \, i) X_i$, $V = sum_j ell_(G \, j) X_j$. The functions $U plus.minus F \, V plus.minus G$ are increasing. Adding the two matching-sign covariance inequalities gives the lower bound in (3.63); adding the opposite-sign inequalities gives the upper bound.

The next doubled-variable proof is the plane-rotator form of Ginibre’s inequality #cite(label("Ginibre1970")); it is not an application of a general sphere-spin Ginibre inequality. For zero-field ferromagnetic XY, cosine-character means are nonnegative by Fourier expansion. The covariance of two cosine characters is nonnegative by the two-replica substitution $theta = phi + psi$, $theta' = phi - psi$. This map is an onto homomorphism of the product tori and pushes normalized Haar measure to normalized Haar measure. Each difference is $- 2 sin \( k dot.op phi \) sin \( k dot.op psi \)$. Expanding the replicated weight $exp \( sum_e 2 J_e cos phi_e cos psi_e \)$ therefore gives a sum of squares of real integrals with nonnegative coefficients. Absolute convergence follows from compactness and the exponential series. This proves the required edge-energy covariance and monotonicity of two-point functions in every coupling.

For zero-field ferromagnetic Ising, the random-cluster expansion of Fortuin–Kasteleyn and its joint spin–bond form #cite(label("FortuinKasteleyn1972")) #cite(label("EdwardsSokal1988")) with $p_e = 1 - e^(- 2 J_e)$ gives a measure proportional to independent Bernoulli weights times $2^(\# upright("components"))$. Component count is supermodular because graph rank is submodular. Hence the edge law is associated, connection probabilities are nondecreasing in $p_e$, and $chevron.l tau_i tau_j chevron.r = Pr \( i arrow.l.r j \)$. The spin law itself is associated by its elementary log lattice condition. These statements also hold with zero couplings by continuity.

The use of scalar amplitudes and conditional ferromagnets is related to the amplitude-association argument of Campbell and Chayes for the $O \( 3 \)$ Wolff representation #cite(label("CampbellChayes1998")); the two-circle $O \( 4 \)$ decomposition below is proved separately. The continuous angle marginals below have a positive density satisfying the log lattice condition relative to product one-site measure: their mixed derivatives are nonnegative. This is the FKG lattice condition #cite(label("FortuinKasteleynGinibre1971")). For this continuous product space, association follows by induction in the number of coordinates. Conditional densities at ordered values of one coordinate have an increasing density ratio; association on the remaining slice orders their increasing expectations, and one-dimensional Chebyshev’s inequality completes the induction. Endpoint zero densities can be handled by restriction and a limit.

==== 3.11.2 A quantitative arbitrary-observable bound inside XY <pre:part-11-2>

Split an XY spin as $\( tau^1 cos gamma \, tau^2 sin gamma \)$, $gamma in \[ 0 \, pi \/ 2 \]$. Under the a priori circle measure the two signs are independent fair signs and $gamma$ has density $2 \/ pi$. Given the angles, the two sign species are independent ferromagnetic Ising systems. The $gamma$ marginal is associated: its density relative to the product angle measure is the product of the two Ising partition functions. Differentiate its logarithm. Products of first coupling derivatives have the same sign, edge covariances are nonnegative, and mixed derivatives of a coupling on a single edge are nonnegative.

Write $c_(i j) = chevron.l s_i dot.op s_j chevron.r$ for the full XY two-point function. For either sign species, and for the angle itself,

#[#set math.equation(numbering: n => "(3.64)")
 $ bb(E) \[ tau_i^h tau_j^h \] lt.eq C c_(i j)^(1 \/ 3) \, #h(2em) \| "Cov" \( gamma_i \, gamma_j \) \| lt.eq C c_(i j)^(1 \/ 3) . $ <eq:pre:11-2>]

To verify the second claim as well as the first, use an embedded Ising decomposition for any fixed reflection of the circle. A bounded one-site function odd under that reflection has the form $tau_i f_i$ after conditioning on its reflecting-component magnitude and perpendicular component. Its two-point is bounded by its sup norms times the averaged connection probability. By rotation invariance and the uniform one-site marginal,

$ 1 / 2 c_(i j) = bb(E) \[ \| x_i \| \| x_j \| upright(bold(1))_(i arrow.l.r j) \] \, $

where $x_i$ is the reflecting coordinate. Since $Pr \( \| x_i \| lt.eq delta \) lt.eq C delta$, $Pr \( i arrow.l.r j \) lt.eq C delta + C delta^(- 2) c_(i j)$. Choose $delta asymp c_(i j)^(1 \/ 3)$, with the endpoint cases by a limit or the trivial bound. Sign coordinates are odd under coordinate reflection; $gamma - pi \/ 4$ is odd under exchange of the two coordinates, itself a reflection. This proves (3.64). The averaged conditional sign correlation is exactly the unconditional sign correlation appearing there.

For two independent XY sectors, let $F \, G$ have supports $A \, A'$, sup-plus-maximum-individual-Lipschitz norms $L_F \, L_G$, and distance at least $4 u$, $u gt.eq 3$. Let $A_u$ be the radius-$u$ neighborhood and let $accent(partial A, ̌)_u$ list endpoints of its crossing edges with multiplicity. Then

#[#set math.equation(numbering: n => "(3.65)")
 $ \| "Cov"_(X Y) \( F \, G \) \| lt.eq C \( 1 + b \)^2 L_F L_G sum_(t = 1)^2 [sum_(i in A_u \, j in A'_u) + sum_(i in A \, j in accent(partial A, ̌)_u) + sum_(i in A' \, j in accent(partial A, ̌)'_u)] \( c_(i j)^t \)^(1 \/ 3) . $ <eq:pre:11-3>]

Here is the localization proof. Conditional on all $gamma$’s, apply (3.63) to the product sign system for the conditional covariance. Average and use (3.64); its cross-support sum is included in the first term of (3.65).

For clarity, let $f \( gamma \) = bb(E) \[ F divides gamma \]$ and $g \( gamma \) = bb(E) \[ G divides gamma \]$, and let $f_0 \, g_0$ be the same conditional expectations after cutting the sign bonds crossing their respective $u$-neighborhoods. We keep the original, full marginal law of $gamma$ throughout this comparison. The cut sign systems factor across the cuts, so $f_0$ depends only on $gamma \|_(A_u)$, and similarly for $g_0$. Their suprema remain bounded by those of the original observables. Differentiation in $gamma_i$ gives

$ partial_(gamma_i) f_0 = bb(E)_0 \[ partial_(gamma_i) F \] + sum_(e in.rev i \, h) \( partial_(gamma_i) J_e^h \) "Cov"_0 \( F \, tau_(e^(-))^h tau_(e^(+))^h \) . $

There are at most eight terms, each coupling derivative is bounded by $b$, and the covariance is bounded by $2 parallel F parallel_oo$. Thus the individual Lipschitz constants of $f_0$ are at most $C \( 1 + b \) L_F$, uniformly in the neighborhood size. For a merely Lipschitz observable the formula holds almost everywhere, or follows by smooth approximation with the same bound. Apply (3.63) and (3.64) to $f_0 \, g_0$.

Finally control the replacement errors. Interpolate each deleted sign bond. The derivative of a conditional mean is its covariance with the sign-edge product. Apply (3.63) in the sign variables: it is bounded by $C L_F sum_(i in A \, j upright(" endpoint")) chevron.l tau_i tau_j chevron.r$. Monotonicity bounds every weakened-system correlation by the full conditional sign correlation. Averaging under the original full angle law and using (3.64) gives the boundary terms of (3.65), with a factor $b$. If $f \, f_0 \, g \, g_0$ are bounded conditional means, the covariance replacement cost is at most $2 parallel g parallel_oo bb(E) \| f - f_0 \| + 2 parallel f_0 parallel_oo bb(E) \| g - g_0 \|$. Thus $L^1$, not pointwise, control suffices.

==== 3.11.3 The O(4) decomposition and the second localization <pre:part-11-3>

Write

$ q_i = \( cos alpha_i thin z_i \, sin alpha_i thin w_i \) \, #h(2em) alpha_i in \[ 0 \, pi \/ 2 \] \, quad z_i \, w_i in S^1 . $

The a priori law is the product of the two uniform circle laws and $sin \( 2 alpha \) thin d alpha$. Conditional on $alpha$, the two circle sectors are independent XY models, with couplings

$ J_e^1 = b_e cos alpha_x cos alpha_y \, #h(2em) J_e^2 = b_e sin alpha_x sin alpha_y . $

The $alpha$ density relative to its product one-site measure is the product of these two XY partition functions. It is associated by the same mixed-derivative argument, now using the XY inequalities. The first derivatives of the cosine-sector couplings are all nonpositive and those of the sine-sector couplings all nonnegative; their products therefore have the required sign in each sector. Mixed endpoint derivatives of a single coupling are nonnegative.

The normalized circle components are bounded measurable one-site functions of $q$, defined arbitrarily on a Haar-null set, with zero Haar means. The angle $alpha - pi \/ 4$ also has zero Haar mean. Equation (3.62) therefore gives

#[#set math.equation(numbering: n => "(3.66)")
 $ 0 lt.eq bb(E)_alpha c_(i j)^t lt.eq C e^(- c d \( i \, j \) \/ s) \, #h(2em) \| "Cov" \( alpha_i \, alpha_j \) \| lt.eq C e^(- c d \( i \, j \) \/ s) . $ <eq:pre:11-4>]

For original local Lipschitz observables $F \, G$ at separation $d$, use (3.65) conditionally with $u = floor.l d \/ 10 floor.r$. The individual circle Lipschitz norms do not increase, since the map from a circle angle to the corresponding sphere spin has speed at most one. Average and use Jensen, $bb(E) \( c_(i j)^t \)^(1 \/ 3) lt.eq \( bb(E) c_(i j)^t \)^(1 \/ 3)$. This bounds the averaged conditional covariance by a polynomial times $e^(- c' d \/ s)$.

For the remaining covariance of the $alpha$-conditional means, localize again: delete the conditional XY bonds crossing $A_u$ for the first mean and $A'_u$ for the second. Keep the original full marginal law of $alpha$ fixed. The cut expectations depend only on the corresponding local angle sets. Their individual $alpha$-Lipschitz constants are at most $C \( 1 + b \) L_F$ and $C \( 1 + b \) L_G$: the differentiation formula just displayed now has the cosine of an XY edge in place of a sign-edge product, still bounded by one. Their covariance is bounded by association and (3.66).

For their $L^1$ errors, interpolate a deleted XY bond. Its derivative is a conditional XY covariance of $F$ with a cosine edge at distance at least $u - O \( 1 \)$. Apply (3.65) to this pair with radius, for example, $floor.l u \/ 10 floor.r$. Every conditional XY two-point function in that inequality is bounded by the full conditional one by coupling monotonicity. Jensen and (3.66) bound the averaged error. This is the second localization; no estimate for an extended conditional mean is being inferred directly from its original support.

All needed sums have polynomial size: $\| A_u \| lt.eq C \| A \| \( 1 + d \)^2$, the crossing-edge endpoint lists satisfy the same bound, (3.65) uses pairs of such sets, and the second localization introduces only one additional crossing-edge sum. Small $d$ uses the trivial bound. For instance, increasing constants gives the convenient common bound

#[#set math.equation(numbering: n => "(3.67)")
 $ #box(stroke: black, inset: 3pt, [$ quad \| "Cov" \( F \, G \) \| lt.eq C \( 1 + B + \| A \| + \| A' \| + d \)^20 L_F L_G e^(- c d \/ s) . quad $]) $ <eq:pre:11-5>]

It holds uniformly on the stated unpinned tori and on free subgraphs, for every set of couplings $0 lt.eq b_e lt.eq b$, including all intermediate bond weakenings. The support and derivative constants do not grow exponentially with support size.

=== 3.12 Periodic limits and the partition-function bound <pre:conclusion>

Fix the absolute $D$ required by the profile parameter dimension, then all other constants, and take $B = max \( B_(*) \, b \)$. The polynomial overhead in $s = R_(*) M_(*)$ is absorbed by (3.54), so one may use

#[#set math.equation(numbering: n => "(3.68)")
 $ s \( b \) lt.eq exp \[ pi b + C sqrt(B log B) \] . $ <eq:pre:12-1>]

==== 3.12.1 Local periodic limits <pre:part-12-1>

For a fixed local Lipschitz observable $F$, choose a square containing its support at distance $r$ from its boundary. In any sufficiently large torus, interpolate all bonds crossing that square to zero. The derivative of its expectation is a sum of covariances with those edge-energy observables. Equation (3.67), valid uniformly throughout the interpolation, bounds the total change by a polynomial in $b \, r \, \| "supp" F \|$ times $e^(- c r \/ s \( b \))$. After the cut, the law inside the square is the same free-square law for every exterior torus. Letting $r arrow.r oo$ proves that every periodic subsequential limit has the same expectation of every local Lipschitz observable. Such functions are dense in the continuous local algebra on the compact spin space. This proves uniqueness of the periodic local limit. It does not claim uniqueness among every possible nonperiodic Gibbs state without another argument.

==== 3.12.2 Full fixed-lattice spectrum <pre:part-12-2>

In homogeneous even periodic systems, site and link reflection positivity follow from factorization at a site seam and the positive kernel $e^(b q dot.op q') = sum_(m gt.eq 0) b^m \( q dot.op q' \)^m \/ m !$ at a link seam. Each power is positive because it is the inner product of the corresponding tensor powers of $q \, q'$. These properties first pass to the preceding local limit for continuous local functions. To extend them to bounded measurable local functions, approximate each observable in $L^2$ of the marginal on its original finite support, retaining that support. The finite-spin product is compact metric, so continuous (and Lipschitz) functions are dense there. Reflection invariance gives convergence of the reflected copies, and Cauchy–Schwarz gives convergence of the reflected products. Thus positivity extends to the bounded measurable local algebra. Define the site-reflection form on bounded local functions in the nonnegative time half-plane by $chevron.l F \, G chevron.r = bb(E) \[ \( Theta overline(F) \) G \]$, quotient its null space, and complete. One-step translation $T$ is symmetric on this dense space by reflection and translation invariance. For $a_n = parallel T^n F parallel^2$, Schwarz gives $a_n^2 lt.eq a_(n - 1) a_(n + 1)$, while $a_n lt.eq parallel F parallel_oo^2$. If $a_1 > a_0 > 0$, log convexity would make $a_n$ grow geometrically, a contradiction. If $a_0 = 0$, the same inequality gives $a_1 = 0$. Hence $T$ is well defined on the quotient and extends to a self-adjoint contraction. Link reflection positivity gives $chevron.l F \, T F chevron.r gt.eq 0$, so this contraction is nonnegative.

#proof[
  For a centered local Lipschitz vector $F$, its $n$-step matrix element is a covariance of two separated local functions. Equation (3.67) implies $limsup_(n arrow.r oo) \| chevron.l F \, T^n F chevron.r \|^(1 \/ n) lt.eq e^(- c \/ s \( b \))$. Positivity of the spectral measure then places its support in $\[ 0 \, e^(- c \/ s \( b \)) \]$. To justify density even when bounded measurable local functions generate that Hilbert space, fix a finite support. Lipschitz functions are dense in $L^2$ of its marginal probability measure, since the finite spin product is a compact metric space. Reflection invariance and Cauchy–Schwarz give
  $ parallel \[ F \] parallel_(upright("OS"))^2 = bb(E) \[ \( Theta overline(F) \) F \] lt.eq bb(E) \| F \|^2 . $
  Thus $L^2$ approximation implies approximation in the reflection seminorm; subtracting expectations preserves density in the vacuum complement. Bounded spectral projections then extend the spectral inclusion from local Lipschitz vectors to that whole complement. The periodic-limit uniqueness was proved in the preceding subsection, and (3.68) gives the stated quantitative bound. ◻
]

This passage explains why neutral-observable mixing is necessary: it controls the dense local algebra, not only the spin sector.

For large $b$, this preliminary gap is of order at least $e^(- pi b - C sqrt(b log b))$. It is insufficient by itself for a positive mass bound in the conventional physical scaling, and no such implication is made here.

==== 3.12.3 Comparing bond expectations on the two tori <pre:part-12-3>

Let $e_t \( n \) = bb(E)_(t \; n \, n) \( q_0 dot.op q_(e_1) \)$, and fix $b$ while letting $0 lt.eq t lt.eq b$. Use (3.67) uniformly with the maximum coupling parameter $b$, not with a varying threshold. For even $n gt.eq C s \( b \)$, choose the same free square of radius comparable to $n \/ 4$ around this bond in each of the $n$- and $2 n$-tori. Cut its crossing bonds by interpolation. There are $O \( n \)$ such edges; their distance from the fixed bond is $gt.eq c n$, their coefficients are at most $b$, and the edge observables have uniformly bounded sup and individual Lipschitz norms. Therefore

#[#set math.equation(numbering: n => "(3.69)")
 $ \| e_t \( n \) - e_t \( 2 n \) \| lt.eq C \( 1 + B + n \)^P e^(- c n \/ s \( b \)) quad upright("uniformly for ") 0 lt.eq t lt.eq b . $ <eq:pre:12-2>]

After both cuts the central bond has the identical free-square expectation. This comparison does not invoke mixing with pinned boundary fields; every system encountered is an unpinned ferromagnet with some weakened or zero bonds.

Differentiate the actual normalized partition functions. There are $2 n^2$ bonds on the $n$-square torus and $8 n^2$ on the $2 n$-square torus, with equal horizontal and vertical means. Thus

#[#set math.equation(numbering: n => "(3.70)")
 $ frac(d, d t) Delta_t \( n \) = 8 n^2 \[ e_t \( n \) - e_t \( 2 n \) \] \, #h(2em) Delta_0 \( n \) = 0 . $ <eq:pre:12-3>]

Integrating (3.69) proves the upper bound in (3.3), after absorbing $b$, $n^2$, and the polynomial into $C \( 1 + b \)^p n^p$. To verify nonnegativity directly, on a row of width $w$ let

$ T_w \( u \, v \) = exp {b / 2 sum_i u_i dot.op u_(i + 1) + b sum_i u_i dot.op v_i + b / 2 sum_i v_i dot.op v_(i + 1)} . $

The positive crossing kernel, multiplied on both sides by the same positive function, defines a positive compact operator. Its powers of order at least two are trace class, and direct integration gives $Z \( n \, w \) = "Tr" T_w^n$. If its nonnegative eigenvalues are $lambda_j$, then $sum_j lambda_j^(2 n) lt.eq \( sum_j lambda_j^n \)^2$. Thus $p \( n \, w \) = 2 log Z \( n \, w \) - log Z \( 2 n \, w \) gt.eq 0$. Square-lattice rotation symmetry now gives the exact identity $Delta \( n \) = 2 p \( n \, n \) + p \( n \, 2 n \) gt.eq 0$.

For large $b$, the right-hand side of (3.68) is bounded by $Xi \( b \)$ after increasing its fixed constant. The bounded interval $0 lt.eq b lt.eq B_(*)$ is covered by a further enlargement of that constant. Since $B = max \( B_(*) \, b \)$, its occurrence in the polynomial prefactor can likewise be absorbed into a constant times a power of $1 + b$. This completes the proof of Theorem 5.

== 4 The linear block transformation <free:section>

Exponential localization of Gaussian block kernels is a standard ingredient of constructive renormalization. See #cite(label("DybalskiStottmeisterTanimotoGreen")) for a related treatment using Fourier analyticity and resolvent estimates. We prove the particular identities and the uniformity in the blocking factor required here.

The input is a Gaussian precision and a block average observed with independent Gaussian noise. We first identify the new precision and the conditional mean. We then express the same energy identity through localized edge operators; this form will retain a positive cost near large gradients in the nonlinear integration. Constants used to choose the block size must be uniform in that size. The Fourier estimates in Appendix 12 establish this uniformity on fixed complex domains, so their use below does not shrink a domain at each iteration.

Fix a sufficiently large dyadic integer $L$. Within each $L times L$ block choose nonnegative weights $b_x$ obtained by sampling and normalizing the product of the same even smooth one-dimensional bump. If $x_(upright(c))$ is the center of the block, then $sum_x b_x \( x - x_(upright(c)) \) = 0$ exactly. The bump is centered in the block, is supported at distance at most $L \/ 5$ from its center, and is positive within distance $L \/ 10$. Set

$ \( Q u \) \( y \) = sum_(0 lt.eq x_1 \, x_2 < L) b_x u \( L y + x \) \, #h(2em) b \( k \) = sum_x b_x e^(i k dot.op x) . $

The origins for the fine and coarse lattices are their block centers. This convention removes an inessential translation in the affine identities below. The observation precision is $a = 1$; we retain $a$ in formulas which are valid for any fixed positive value.

For Fourier momentum $k$, write

$ d_mu \( k \) = e^(i k_mu) - 1 \, #h(2em) D \( k \) = sum_(mu = 1)^2 \| d_mu \( k \) \|^2 . $

Stars in formulas continued to complex momentum mean analytic continuation of the adjoint on real momentum. At coarse momentum $p$ the fine aliases are $k_l = \( p + 2 pi l \) \/ L$, with $l$ a centered representative modulo $L$ in each coordinate. Our Fourier convention assigns a fine field the norm $L^2 sum_l \| u_l \|^2$ per coarse cell. Thus if a block-average row has entries $b \( k_l \)$, its adjoint has entries $L^(- 2) b \( k_l \)^(*)$.

=== 4.1 The free precision and the conditional mean <the-free-precision-and-the-conditional-mean>

Let $h$ count block transformations from the nearest-neighbor precision. Define $K_0 = D$ and

#[#set math.equation(numbering: n => "(4.1)")
 $ K_(h + 1) \( p \)^(- 1) = a^(- 1) + L^(- 2) sum_l \| b \( k_l \) \|^2 K_h \( k_l \)^(- 1) . $ <free:recursion>]

The pole at zero in this expression is interpreted by continuation. Equation (4.1) is the covariance of $Q u$ plus independent Gaussian observation noise.

#thm([Lemma 4.1.])[
  #emph[For all sufficiently large $L$, the following bounds hold with constants independent of $h$ and $L$. The functions $K_h$ are analytic and uniformly bounded on a common complex neighborhood of the momentum torus, 
$ c D \( p \) lt.eq K_h \( p \) lt.eq C D \( p \) quad \( p upright(" real") \) \, #h(2em) K_h \( p \) - D \( p \) = O \( \| p \|^4 \) . $

 Their differences between depths $macron(h) gt.eq h$ have the corresponding analytic bounds multiplied by $L^(- h)$. There are real-kernel, self-adjoint edge operators $B_h$, with analytic Hermitian Fourier symbols on real momentum, such that 
$ K_h = d^(*) B_h d \, #h(2em) c I lt.eq B_h lt.eq C I \, #h(2em) B_h \( 0 \) = I \, $

 whose inverses and history differences satisfy the same bounds.]
  #emph[Writing $K = K_h$ and $K' = K_(h + 1)$, the conditional mean operator is 
#[#set math.equation(numbering: n => "(4.2)")
 $ P_l = L^(- 2) K \( k_l \)^(- 1) b \( k_l \)^(*) K' \( p \) . $ <free:P>]

 It obeys $K P = Q^(*) K'$ and $a \( I - Q P \) = K'$, preserves constants and centered affine fields, and, for every fixed integer $r gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ sup_x sum_y e^(c \| x \/ L - y \|) \| nabla_f^r P \( x \, y \) \| lt.eq C_r L^(- r) . $ <free:derivative>]

 Here $nabla_f$ is a nearest-neighbor difference on the fine lattice. The conditional covariance 
#[#set math.equation(numbering: n => "(4.4)")
 $ C_h = \( K_h + a Q^(*) Q \)^(- 1) $ <free:C>]

 has exponentially decaying kernels in coarse units, with constants allowed to depend on the fixed $L$. All these assertions retain the factor $L^(- h)$ in history differences.]
] <free:bounds>

#proof[
  The covariance iteration has an explicit form. Set $m = L^h$, $W_h \( xi \) = product_(j = 1)^h b \( xi \/ L^j \)$, $D_m \( p \) = m^2 D \( p \/ m \)$, and $s_L = sum_x b_x^2$. Separating the principal alias gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ K_h \( p \) = frac(D_m \( p \), W_h \( p \) W_h \( p \)^(*) + D_m \( p \) R_h \( p \)) \, $ <free:explicit>]
  where
  $ R_h \( p \) = a^(- 1) sum_(r < h) s_L^r + sum_(l med mod med m\
l eq.not 0) frac(W_h \( p + 2 pi l \) W_h \( p + 2 pi l \)^(*), D_m \( p + 2 pi l \)) . $
  The first sum is the accumulated observation noise: averaging $r$ more times multiplies its variance by $s_L^r$. For the second sum, Lemma 32 proves that the product weights in the $r$th alias shell have total at most $C A^r$, while its nonprincipal denominator is at least $c L^(2 \( r - 1 \))$. Thus $R_h$ and its fixed analytic derivatives are uniformly bounded. The principal bump product is uniformly positive on the real momentum cube. These facts keep the denominator in (4.5) away from zero on a common smaller complex domain. They also give $K_h - D = O \( \| p \|^4 \)$. Comparing the same products at two depths, without dividing by possibly vanishing bump factors, gives the $L^(- h)$ discrepancy and its fixed derivatives.
  For the edge representation, the same lemma writes the fourth-order zero $K_h - D$ as $d^(*) \( B_h^(upright("raw")) - I \) d$, with $B_h^(upright("raw")) = I + O \( \| p \|^2 \)$ and bounded analytic coefficients. Hermitian, reality and spatial-symmetry averaging preserve this identity. Adding a fixed sufficiently large multiple of $sans(c)^(*) sans(c)$, where
  $ sans(c) = \( - d_2 \, d_1 \) \, #h(2em) sans(c) d = 0 \, $
  does not change $d^(*) B d$. Near zero the raw lift is already positive; away from zero, ellipticity controls its longitudinal entry and the added term controls the transverse entry. The fixed choice makes $B_h$ uniformly positive, with analytic inverse and the same history bounds.
  The normal equations for the conditional mean give (4.2) and the two stated operator identities. On a nonprincipal alias the smooth bump gives arbitrary fixed inverse-power decay in $l$; for the principal alias remove the apparent pole using
  $ P_0 = b \( k_0 \)^(- 1) [1 - (a^(- 1) + L^(- 2) sum_(l eq.not 0) \| b \( k_l \) \|^2 K \( k_l \)^(- 1)) K'] . $
  At $p = 0$ the other aliases vanish to second order. The zero and first jets of this formula prove preservation of constants and affine fields. Each fine difference contributes $\| d_mu \( k_l \) \| lt.eq C \( 1 + \| l \| \) \/ L$. Choose the bump decay exponent larger than the required number of differences plus the summation dimension. Fourier inversion on a smaller coarse strip proves (4.3), with its weighted moments and history version. This argument also treats differences across block boundaries, since their coarse translation factor is already in the alias formula.
  Finally invert $K + a Q^(*) Q$ in aliases. The nonprincipal diagonal block is invertible with the preceding bounds. Its rank-one update has denominator $a^(- 1) + L^(- 2) sum_(l eq.not 0) \| b \( k_l \) \|^2 K \( k_l \)^(- 1)$, positive on real momentum and nonzero on a smaller strip. The remaining principal Schur complement, multiplied by $L^2$, is bounded below by the principal bump term. Its inverse is analytic on that strip. Fourier inversion proves the asserted localization of the covariance. ◻
]

The conditional mean also gives an exact energy decomposition. For real ambient fields $u \, V$ on a finite periodic pair of lattices,

#[#set math.equation(numbering: n => "(4.6)")
 $ 1 / 2 chevron.l u \, K_h u chevron.r + a / 2 parallel V - Q u parallel^2 = 1 / 2 chevron.l V \, K_(h + 1) V chevron.r + 1 / 2 chevron.l u - P_h V \, C_h^(- 1) \( u - P_h V \) chevron.r . $ <free:schur-energy>]

Indeed $C_h^(- 1) P_h = a Q^(*)$ and $a \( I - Q P_h \) = K_(h + 1)$ make the cross and constant terms agree after expansion. Although $K_h$ vanishes on constants, $C_h^(- 1) = K_h + a Q^(*) Q$ is strictly positive, since $Q$ preserves constants. This identity identifies the fluctuation field and its positive precision. The next construction expresses the energy through localized edge rows, with the row and column estimates needed to keep that positivity near rough regions.

=== 4.2 A positive identity for the kinetic energy <a-positive-identity-for-the-kinetic-energy>

The edge representation of $K_h$ is not unique: a curl correction leaves $d^(*) B_h d$ unchanged. We use this freedom to obtain a positive completion whose fine-output rows gain $L^(- 1)$. All operators act on real ambient fields, so the resulting identity also applies to sphere-valued fields without linearizing them.

#thm([Lemma 4.2.])[
  (Positive completion of the block transformation).  #emph[One can choose a common $c_0 > 0$ and edge operators $ell_h$ such that 
$ sans(A)_h = binom(sqrt(c_0) I, ell_h) \, #h(2em) X_h = sans(A)_h d \, $

 give the free precision $X_h^(*) X_h = K_h$. There are real operators $cal(M)_h \, cal(N)_h$ satisfying 
#[#set math.equation(numbering: n => "(4.7)")
 $ cal(M)_h^(*) cal(M)_h + cal(N)_h^(*) cal(N)_h & = I \,\
cal(M)_h^(*) \( X_h u \, sqrt(a) \( V - Q u \) \) & = X_(h + 1) V \,\
cal(M)_h X_(h + 1) & = \( X_h P \, sqrt(a) \( I - Q P \) \) \,\
cal(N)_h X_(h + 1) & = 0 . $ <free:isometry>]

 All kernels have exponential moments and the history bounds of Lemma 7. The fine-output part of $cal(M)_h$ has weighted row norm $C \/ L$ and column norm $C L$. Its first two fine differences have row norms $C \/ L^2 \, C \/ L^3$. All coarse slots have bounded row and column norms. At depth zero one may take $ell_0 = sqrt(1 - c_0) I$.]
] <lem:free-stack>

#proof[
  We first construct a coarse-edge to fine-edge map $T$ with
  #[#set math.equation(numbering: n => "(4.8)")
   $ T^(*) d = d' Q \, #h(2em) T B' d' = B d P . $ <free:Tidentities>]
  Primes denote the next lattice. Start with
  $ T_(0 \, l) = L^(- 2) "diag" \( omega_(mu \, l)^(*) \) b \( k_l \)^(*) \, #h(2em) omega_(mu \, l) = sum_(j = 0)^(L - 1) e^(i j k_(l \, mu)) . $
  The identity $omega_(mu \, l) d_mu \( k_l \) = d'_mu \( p \)$ proves the first equation, with the $L^2$ convention for adjoints. Put $R_l = B_l d_l P_l - T_(0 \, l) B' d'$. Its divergence vanishes by $K P = Q^(*) K'$. Its aliases have bounds $C_s L^(- 1) \( 1 + \| l \| \)^(- s)$ for every required fixed $s$. At $p = 0$ both terms vanish on each nonprincipal alias; on the principal alias their linear terms are both $i p \/ L$. Thus $R_0$ vanishes through first order. Lemma 33 applies and constructs analytic $gamma_l \, H_l$ with
  $ R_l = sans(c)_l^(*) gamma_l \, #h(2em) H_l d' = gamma_l \, #h(2em) \| gamma_l \| + \| H_l \| lt.eq C_s \( 1 + \| l \| \)^(- s) . $
  The first division removes a fine derivative. The second uses the vanishing of $gamma_l \( 0 \)$ on every alias to divide by coarse derivatives, preserving alias gluing and decay without another power of $L$. The interpolation formula and its uniform bound are proved in Appendix 12. Set
  $ T_l = T_(0 \, l) + sans(c)_l^(*) H_l \( B' \)^(- 1) . $
  This proves (4.8). Its aliases are bounded by $C_J L^(- 1) \( 1 + \| l \| \)^(- J)$. Fourier inversion gives the row, column, and fine-difference bounds in the statement. The operations are linear or uniformly analytic in the input coefficients, so also preserve the history discrepancy. Symmetry averaging preserves both identities.
  On real momentum the Hermitian defect
  $ U = \( B' \)^(- 1) - T^(*) B^(- 1) T - a^(- 1) d' d' ""^(*) $
  annihilates $B' d'$, by (4.8) and $a \( I - Q P \) = K'$. Division on both sides therefore factors $B' U B'$ through $sans(c)' ""^(*) sans(c)'$ with a bounded analytic scalar coefficient. Similarly $sans(c) B^(- 1) T B' d' = 0$. Its aliases, before the last division, cost $C L^(- 2) \( 1 + \| l \| \)^(- J)$. Squaring and summing with the fine norm $L^2 sum_l$ proves
  $ \| z^(*) U z \| & lt.eq C \| sans(c)' \( B' \)^(- 1) z \|^2 \,\
parallel sans(c) B^(- 1) T z parallel^2 & lt.eq C L^(- 2) \| sans(c)' \( B' \)^(- 1) z \|^2 . $
  The normalization factor in the second estimate is essential.
  Choose a fixed sufficiently large $lambda$ and replace
  $ tilde(B)^(- 1) = B^(- 1) + lambda B^(- 1) sans(c)^(*) sans(c) B^(- 1) \, $
  and do the same at the next scale. This leaves $tilde(B) d = B d$, hence leaves $K$ unchanged. The new defect $U_(*)$ is bounded below by
  $ \[ lambda \( 1 - C \/ L^2 \) - C \] \( B' \)^(- 1) sans(c)' ""^(*) sans(c)' \( B' \)^(- 1) . $
  First choose $lambda gt.eq 2 \( C + 1 \)$ and then $L$ sufficiently large; the coefficient is at least one. We may consequently write
  $ tilde(B)' U_(*) tilde(B)' = sans(c)' ""^(*) B_2 sans(c)' $
  with a uniformly positive analytic scalar $B_2$. Positivity extends through $p = 0$, as follows from
  $ sans(c)' \( B' \)^(- 1) tilde(B)' = \[ 1 + lambda sans(c)' \( B' \)^(- 1) sans(c)' ""^(*) \]^(- 1) sans(c)' . $
  Choose $c_0$ below the common lower bound of $tilde(B)$ and set $ell = \( tilde(B) - c_0 I \)^(1 \/ 2)$. All square roots and inverses here are uniformly analytic on a smaller strip. Finally put
  $ S' & = sans(A)' \( tilde(B)' \)^(- 1) \( sans(A)' \)^(*) \,\
cal(M) z & = #scale(x: 120%, y: 120%)[\(] sans(A) tilde(B)^(- 1) T \( sans(A)' \)^(*) z \, a^(- 1 \/ 2) d' ""^(*) \( sans(A)' \)^(*) z #scale(x: 120%, y: 120%)[\)] \,\
cal(N) z & = #scale(x: 120%, y: 120%)[\(] \( I - S' \) z \, B_2^(1 \/ 2) sans(c)' \( tilde(B)' \)^(- 1) \( sans(A)' \)^(*) z #scale(x: 120%, y: 120%)[\)] . $
  Here $S'$ is an orthogonal projection. Substitution of (4.8) proves (4.7) and (4.7); $sans(c)' d' = 0$ proves (4.7). Using the definition of $U_(*)$ gives $cal(M)^(*) cal(M) + cal(N)^(*) cal(N) = I$. The extra factors are uniformly summable convolution kernels, so they preserve the proved bounds for $T$. At depth zero keep $B = tilde(B) = I$ instead of making the fine curl correction. This deletes a nonnegative subtraction from $U_(*)$ and thus only improves its positivity. All finite-period operators are obtained by folding these same kernels. ◻
]

== 5 An exact renormalization map <rg:section>

The use of local backgrounds and small-field integration has close constructive predecessors #cite(label("BalabanFlow")) #cite(label("BalabanVariational")) #cite(label("DybalskiStottmeisterTanimotoVariational")). The exact observation kernel and the separate treatment of rough configurations in the retained-density class are specified below; the cited constructions do not supply closure or terminal-coupling comparison.

The estimates in this section concern the original lattice measure at finite cutoff. The renormalization map will be an exact conditional integration. Its purpose is to compare two cutoffs after they have reached the same value of the running coupling. The terms not described by that coupling must therefore be controlled as functions, including their dependence on the cutoff.

Section 5.1 defines the retained class and states closure. Section 5.2 constructs the positive energy reserve and the Gaussian integral. Sections 5.3 and 5.4 bound joint products and reassemble the exact density; the explicit factor ownership and support tables are in Sections 14.1 and 14.4, and the product estimate is proved in Appendix 15. Sections 5.5 and 5.6 then contract the canonical coefficients and regular error, using the fixed norm of Appendix 13. Section 5.7 restores the normalization and closes the induction.

We identify $S^3$ with the unit quaternions. Multiplication on either side is an isometry, and the stabilizer of the identity acts by all rotations on the imaginary quaternions $bb(R)^3$. Haar measure is normalized to have total mass one. We use the averaging operator $Q$, the precisions $K_h$, and the operators

$ sans(A)_h = binom(sqrt(c_0) thin upright("Id"), ell_h) \, #h(2em) P_h \, quad C_h \, quad cal(M)_h \, quad cal(N)_h $

of Lemmas 7 and 8. In particular, $K_h = d^(*) sans(A)_h^(*) sans(A)_h d$, and the constants in the weighted first and second fine-difference bounds for $P_h$ are independent of sufficiently large $L$. Constants denoted by $C_L \, c_L > 0$ may depend on the now fixed blocking factor. Constants used to choose $L$ will be explicitly distinguished from these.

=== 5.1 Scales, observation, and the class of densities <rg:class>

Choose a dyadic integer $L$, later sufficiently large, and put

#[#set math.equation(numbering: n => "(5.1)")
 $ gamma & = frac(log L, pi) \, & H_j & = H + gamma j \, & frak(m)_j & = ⌈\( log H_j \)^2⌉ \,\
p_j & = \( log H_j \)^(P_0) \, & t_j & = H_j^(- 1 \/ 2) p_j \, & T_j & = H_j^(- .49) . $ <rg:scales>]

The exponent $P_0$ and then $H$ will be fixed below. A run of depth $N$ uses layers $j = N \, N - 1 \, dots.h \, 0$ and free history $h = N - j$. At a step its precise coupling $b$ is required to lie in $\[ H_j \/ 2 \, 2 H_j \]$. We write $g = b^(- 1 \/ 2)$ and omit $j \, h$ temporarily. Within a single step, $M = frak(m)_j$ and $M' = frak(m)_(j - 1)$. Thus $t asymp g p$. All geometric thresholds in a comparison use $H_j$, not the varying $b$.

On a square torus of side $m L^j$, take $m$ dyadic and $m gt.eq C_(upright("adm")) frak(m)_0$. The constant $C_(upright("adm"))$ is fixed sufficiently large for the finite neighborhoods below. Increasing $H$ gives $frak(m)_j \/ frak(m)_(j - 1) lt.eq 2$; hence these period conditions hold simultaneously at every layer. Bulk formulas mean the same formulas with their absolutely summable position lists on $bb(Z)^2$.

The observation from $q$ to one new spin $V_Y$ in each block is

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(K)_b \( d V divides q \) & = bb(E)_tau #h(-0.16667em) [product_Y frac(exp { - b a \| V_Y - hat(m)_Y \( q \, tau_Y \) \|^2 \/ 2 }, z \( b a \)) thin d V_Y] \,\
z \( b a \) & = integral_(S^3) e^(- b a \| V - 1 \|^2 \/ 2) thin d V \, #h(2em) m_Y = Q q \( Y \) . $ <rg:observation>]

Here $a$ is the fixed positive observation precision in the free construction. If $\| m_Y \| gt.eq 1 \/ 2$, set $hat(m)_Y = m_Y \/ \| m_Y \|$. Otherwise the independent tag $tau_Y$ samples a constituent spin with the weights of $Q$, and $hat(m)_Y \( q \, tau_Y \)$ is that spin. The expectation in (5.2) averages these tags. They may be included at every block, even where they are unused. The denominator in (5.2) is independent of the unit vector $hat(m)_Y$, so this is a probability kernel.

For an edge $e$, write $r_e = \| d_e q \|$. Fix $0 < d_0 < c_0 \/ 16$ and a constant $R_(*)$ sufficiently large compared with the exponential localization length of $ell_h$. Define

#[#set math.equation(numbering: n => "(5.3)")
 $ S_t \( r \) & = cases(delim: "{", c_0 r^2 \/ 2 \, & r lt.eq t \,, d_0 t r \, & r > t \,)\
m_e \( q \) & = upright(bold(1)) { r_f lt.eq t e^("dist" \( e \, f \) \/ R_(*)) upright(" for all ") f } \,\
cal(E)_(h \, t) \( q \) & = sum_e S_t \( r_e \) + 1 / 2 sum_e m_e \( q \) \| \( ell_h d q \)_e \|^2 . $ <rg:kinetic>]

The mask reads only edges within $O \( log \( 1 \/ t \) \)$ of $e$, since chord lengths are at most two. Moreover $m_e = 1$ implies $\| \( ell_h d q \)_e \| lt.eq C t$. The masks and $S_t$ may be discontinuous; they will never be differentiated as functions of a moving output configuration.

We next specify the locality norms. Each label carries its complete support and a connected record of cubes of radius $frak(m)_j$ covering that support, together with the paths used to join them. Its load is an integer $s gt.eq 1$. The conventions are chosen so that the support has at most $C frak(m)_j^2 s$ sites and its record has length at most $C frak(m)_j s$. Every argument, mask, eligibility test, negative status query, and window determining a formula is included. On a torus the record retains the lifted displacements before folding. Intersecting records can be joined with load at most a fixed multiple of their total load.

Projection of a record to the next lattice, followed by any of the fixed neighborhoods used below, has a record satisfying

#[#set math.equation(numbering: n => "(5.4)")
 $ 4 s \/ L lt.eq s' lt.eq D_(*) \( 1 + s \/ L \) . $ <rg:projection>]

The upper bound follows by breaking its walk into pieces of length comparable with $L frak(m)_(j - 1)$; the lower bound is imposed by retaining unused load if necessary. A record of load less than $c_(*) m L^j \/ frak(m)_j$ is called short. Choose $c_(*)$ small enough that every short complete record has an injective lift. Its formula must coincide with that of the corresponding bulk label. All other records are called winding records, whether or not their displayed support itself wraps. This convention also applies to a constant or a short function whose derivation used a long record.

For a connected graph $X$ let $1_X \( q \) = upright(bold(1)) { r_e lt.eq t_j upright(" for all ") e in X }$. At an anchor $o$, use relative coordinates

$ y_o \( x \) = "Im" \( q_x q_o^(- 1) \) \, #h(2em) S_o \( q \) = 1 / 4 sum_(\| e \| = 1) \| y_o \( o + e \) \|^2 . $

Fix a basis of each space of invariant tensors $\( \( bb(R)^3 \)^(⊗ n) \)^(S O \( 3 \))$, $2 lt.eq n lt.eq 6$. In particular this includes the alternating cubic tensor. A canonical polynomial is a homogeneous tensor polynomial in the $y_o \( x \)$, with an anchored joining path of length $u$ comparable with $1 + sum_x \| x - o \|$, counted with multiplicity. Its coefficient norm is

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel A_n parallel_sigma = sup_o sum_(upright("labels at ") o) e^(sigma u) \( 1 + u \)^2 \| a_(upright("label")) \| . $ <rg:canonical-norm>]

Take $sigma > 0$ sufficiently small for the finitely many uses of the free exponential bounds; it is fixed before $L$. The seven canonical slots, in their order, are

#[#set math.equation(numbering: n => "(5.6)")
 $ b P_4 \, quad I_2 \, quad b P_5 \, quad I_3 \, quad b P_6 \, quad I_4 \, quad b^(- 1) J_2 . $ <rg:slots>]

The subscript records homogeneous field degree, and $upright(bold(P)) = \( P_4 \, I_2 \, P_5 \, I_3 \, P_6 \, I_4 \, J_2 \)$ denotes the seven coefficient lists without their displayed powers of $b$. Their norms have fixed caps $B_1 \, dots.h \, B_7$, chosen successively below.

Each quadratic label is grouped into its dihedral orbit at the anchor and compensated by a multiple of $S_o$, so that its Hessian vanishes on unit affine fields at the identity. This means its second derivative on $q_x = exp { theta v thin hat(e) dot.op \( x - o \) }$ is zero, for a unit imaginary quaternion $v$ and a coordinate unit vector $hat(e)$. Spin and spatial symmetry then imply vanishing on every pair of affine tangent fields. Compensation coefficients are included in (5.5). All polynomials are formed before folding. For $u lt.eq frak(m)_j$ their mask graph may be a ball of radius $C_chi frak(m)_j$ at $o$. Longer paths are padded by fixed multiples of $frak(m)_j$. Their load is at most $C \( 1 + u \/ frak(m)_j \)$.

A regular error $f_X$ is defined and $C^k$, with $k = 8$, on ${ r_e < 4 t_j : e in X }$. Its norm $\[ f_X \]_(k \, j)$ is the sum of the sup norms of its derivatives through order $k$, using independently in each derivative slot the bounds

#[#set math.equation(numbering: n => "(5.7)")
 $ \| v_x \| lt.eq t_j \( 1 + "dist" \( x \, o \) \)^8 . $ <rg:directions>]

Derivatives are taken in $q_x \( theta \) = exp \( sum_i theta_i v_(i \, x) \) q_x$. On a torus use physical distances. The error norm and cap are

#[#set math.equation(numbering: n => "(5.8)")
 $ parallel f parallel_(k \, j \, A) := sup_o sum_(X upright(" at ") o) e^(A s_X) \[ f_X \]_(k \, j) lt.eq delta_j := H_j^(- 2.05) \, #h(2em) A = 64 . $ <rg:error-norm>]

Each bulk or nonwinding error has zero value and zero affine Hessian at the identity. Its first derivative is zero by conjugation invariance. Winding errors need not have these normalizations.

Finally a covering label $ell$ has a bounded measurable weight $k_ell \( q \)$, complete support $P_ell$, and a nonempty inventory $D_ell$ of bonds in that support. Its weight vanishes unless $D_ell subset D \( q \) := { e : r_e > t_j }$. Set

#[#set math.equation(numbering: n => "(5.9)")
 $ Xi \( q \) = sum_(Gamma upright(" has disjoint supports")\
union.sq.big_(ell in Gamma) D_ell = D \( q \)) product_(ell in Gamma) k_ell \( q \) \, #h(2em) parallel k parallel_(j \, A) := sup_x sum_(ell : x in P_ell) e^(A s_ell) parallel k_ell parallel_oo lt.eq w_j := e^(- p_j^(1 \/ 4)) . $ <rg:covering-gas>]

In particular $Xi = 1$ if $D \( q \)$ is empty. This is a mandatory cover, not an optional polymer gas. No sign or differentiability assumption is made on the individual weights.

All these lists are translation covariant and have the spin and spatial symmetries just specified. The class consists of the densities

#[#set math.equation(numbering: n => "(5.10)")
 $ e^(v \| Lambda_j \|) exp {- b cal(E)_(h \, t_j) - sum_(upright("slots")) 1_X P_X - sum_X 1_X f_X} Xi . $ <rg:density>]

The scalar $v$ is the same bulk scalar on every admitted period. Assignments of anchors are made equivariantly: distribute a term equally among its permissible anchors, retaining identical complete supports on the resulting copies. Splitting an additive term this way preserves its sum; splitting a covering weight preserves its gas, since copies with the same nonempty support are mutually incompatible. Average additive anchored coefficient and error lists over the finite dihedral group. Their full sums are invariant, so this also preserves the density. If different orbit terms initially have different masks, first strengthen them to their common orbit graph and retain the exact covering correction, as in Section 5.4. Eligibility and internal compatibility tests are carried with each label, not averaged independently. All geometric rules and free kernels commute with these symmetries. Finally, after removing the total affine coefficient, orbitwise quadratic compensation subtracts multiples of $S_o$ whose sum is zero at every anchor; it changes only the representation. These conventions justify both the individual orbit normalization and the invariant Hessian test. Masked expressions are defined to be zero off their mask; no value of an undefined extension is used there. The estimates below also apply to signed densities of this form. Positivity is used later only for the actual probability measures obtained from (5.2).

#thm([Theorem 5.1.])[
  (Exact step and its comparison estimates).  #emph[ The constants can be chosen in the order described below so that integration by (5.2), from an input with $b in \[ H_j \/ 2 \, 2 H_j \]$, gives an exact representation (5.10) on layer $j - 1$, with free history $h + 1$, all the renewed norm bounds, and 
#[#set math.equation(numbering: n => "(5.11)")
 $ b' = b + alpha_h \( upright(bold(P)) \) + frac(kappa_h \( upright(bold(P)) \), b) + Delta \, #h(2em) \| alpha_h \| + \| kappa_h \| lt.eq C_L \, #h(2em) \| Delta \| lt.eq C_L H_j^(- 1.05) . $ <rg:coupling-step>]

 The canonical map and $alpha_h \, kappa_h$ depend only on the input canonical vector $upright(bold(P))$ and the free history. They do not depend on the precise coupling, the cutoffs, the errors, the covering gas, or the period. The output is iterable if its coupling belongs to the next admitted band; this additional fact is proved for the trajectories used below.]
  #emph[For two inputs on common label lists and the same reference layer, let $lambda = b_2 - b_1$. Let $u$ be a fixed positively weighted sum of the seven coefficient discrepancies, the error discrepancy $delta_j^(- 1) parallel f_2 - f_1 parallel_(k - 1 \, j \, A)$, and the gas discrepancy $w_j^(- 1) parallel k_2 - k_1 parallel_(j \, A)$. The weights are independent of $j$ and the periods. The outputs have common compatible lists and satisfy 
#[#set math.equation(numbering: n => "(5.12)")
 $ u' & lt.eq q u + C_L H_j^C epsilon.alt_h + C_L H_j^(- b_(*)) \| lambda \| \,\
\| lambda' - lambda \| & lt.eq C_L u + C_L H_j^C epsilon.alt_h + C_L H_j^(- b_(*)) \| lambda \| \, $ <rg:shape-comparison>]

 where $L^(- 1) < q < 1$, $b_(*) > 0$, and $epsilon.alt_h = L^(- min \( h_1 \, h_2 \))$ for unequal free histories (zero for equal histories). These estimates include bulk and all admitted periods.]
] <rg:closure>

To prove closure, we first isolate regions with large gradients and retain a positive energy cost for them. Gaussian completion on the complement produces local fluctuation factors. We then sum connected factors, extract the seven canonical coefficients, and return the remaining terms to the error and covering classes.

Appendix 14 fixes the profiles, row ownership and complete read sets used below. It supplies an explicit core factor and proves the derivative-support and factorization assertions.

=== 5.2 The energy identity and the massive Gaussian <rg:gaussian>

Truncate the primitive kernels at radius $r_(*) = floor.l M \/ 10^4 floor.r$ in their respective localization units, reducing this by a fixed factor if necessary for the finite compositions below. Use a subscript $s$ for these numerical kernels. The omitted paths have exponentially small weighted sums, including their free history differences. Retain those paths as separate factors.

Use stack variables

$ X = \( sqrt(c_0) thin d q \, ell_s d q \) \, #h(2em) Y = sqrt(a) \( V - hat(m) \) \, #h(2em) X' = \( sqrt(c_0) thin d' V \, ell'_s d' V \) \, $

and put

$ zeta = \( sqrt(c_0) thin "clip"_(t') d' V \, m' ell'_s d' V \) \, #h(2em) \( nu \, w \) = cal(M)_s zeta . $

Here clipping changes a vector of length greater than $t'$ to the vector of length $t'$ in the same direction. The free estimates and the masks give, entrywise,

#[#set math.equation(numbering: n => "(5.13)")
 $ \| zeta \| + \| w \| lt.eq C t \, #h(2em) \| nu \| lt.eq C t \/ L . $ <rg:stack-sizes>]

The numerical input kinetic energy plus observation energy minus the numerical output kinetic energy is the sum of the following rows:

#[#set math.equation(numbering: n => "(5.14)")
 $ cal(F)_e & = S_t \( r_e \) + 1 / 2 m_e \| X_(2 \, e) \|^2 - nu_e dot.op X_e + 1 / 2 \| nu_e \|^2 \, & cal(B)_Y & = 1 / 2 \| Y_Y - w_Y \|^2 \,\
cal(C)_E & = zeta_E dot.op X'_E - 1 / 2 \| zeta_E \|^2 - S_(t') \( \| d'_E V \| \) - 1 / 2 m'_E \| X'_(2 \, E) \|^2 \,\
cal(U)_E & = zeta_E dot.op \[ cal(M)_s^(*) \( X \, Y \) - X' \]_E \, & cal(N)_i & = 1 / 2 \| \( cal(N)_s zeta \)_i \|^2 \,\
cal(Z)_E & = 1 / 2 zeta_E dot.op \[ \( upright("Id") - cal(M)_s^(*) cal(M)_s - cal(N)_s^(*) cal(N)_s \) zeta \]_E . $ <rg:ledger>]

This is an algebraic identity: the cross terms cancel because $\( nu \, w \) = cal(M)_s zeta$, and the displayed defect cancels the remaining quadratic terms in $zeta$. The free stack identities give

#[#set math.equation(numbering: n => "(5.15)")
 $ \| cal(Z)_E \| lt.eq C_L e^(- c_L M) t^2 \, quad \| cal(U)_E \| lt.eq C_L t e^(- c_L M) + C t sum_Y e^(- c "dist" \( E \, Y \)) \| m_Y - hat(m)_Y \| . $ <rg:ledger-errors>]

Insert a smooth decomposition $G_e + \( 1 - G_e \)$ at every input edge, where $G_e = 1$ for $r_e lt.eq t \/ 4$ and $G_e = 0$ for $r_e gt.eq t \/ 2$. At every observation block use an analogous decomposition for $\| V_Y - hat(m)_Y \|$, with thresholds $W t$ and $2 W t$; $W$ is a fixed sufficiently large constant. A complement is a primary seed. Every true output bad edge is also a mandatory primary seed. Join seeds whose radius-$50 M$ footprints meet. For each component freeze the spins within distance $3 M$ of its seeds and assign to it the numerical rows within distance $5 M$. Frozen spins retain their Haar integration. The remaining spins have the principal coordinates

$ T_x = V_(\[ x \]) \, #h(2em) xi_x = log \( q_x T_x^(- 1) \) \, #h(2em) q_x = exp \( xi_x \) T_x \, quad xi_x in "Im" bb(H) . $

The retained sector tests imply $\| xi_x \| lt.eq C_L t < pi \/ 4$. Thus this logarithm is unique; an arbitrary preimage under the exponential map is not allowed.

Select all $cal(F) \, cal(B)$ rows farther than $2.5 M$ from every seed. On the full sector their masks are enabled, clipping is absent, their mean is on its smooth branch, and all their spins are within $C_L t$ of their block reference. Rotate a row to a nearby output reference and let

$ D_0 = \( sans(A)_s d \, - sqrt(a) Q \) \, #h(2em) F_i^0 \( V \) = "Im" \( R_i \( 0 \, V \) V_(o \( i \))^(- 1) \) \, quad R = \( X - nu \, Y - w \) . $

Use the affine row $D_0 xi + F^0$. A frozen angle is smoothly cut off outside a slightly larger $C_L t$ chart. For an output-inventory-free call, its $V$ extension fixes every queried output status to no flag, replaces clipping by the identity and every good output mask by one, and extends that analytic formula through the required graph gradients $< 4 t'$. Cut it off smoothly only on a larger graph domain. Equality with the actual expression is recovered on the outgoing regular mask. No extension of a discontinuous output predicate through its jump is intended. Calls with output inventory instead retain their fixed output statuses and are not field-differentiated. These conventions give the bounded extensions used below on arbitrary frozen spins and output data. In exterior variables the selected affine rows are $D xi + F$.

A #emph[protector] is a smooth cutoff in an exterior coordinate $xi_x$, equal to one for $\| xi_x \| lt.eq pi \/ 2$ and supported strictly inside $\| xi_x \| < pi$. It remains attached to every factor reading that protected coordinate. The attachment rules are given in Section 5.3.

#thm([Lemma 5.2.])[
  (Core reserve).  #emph[On the retained sector tests around a component with $s_c$ seeds, using these principal coordinates, 
#[#set math.equation(numbering: n => "(5.16)")
 $ sum_(upright("assigned")) \( cal(F) + cal(B) + cal(C) + cal(U) + cal(N) + cal(Z) \) - 1 / 2 sum_(upright(s e l e c t e d \, a s s i g n e d)) \| D xi + F \|^2 gt.eq c t^2 s_c . $ <rg:reserve>]

 The same estimate holds on the no-output-flag extension of a component with no output seeds. After extending the Gaussian coordinates beyond the original chart, it holds on the attached protector supports, including the supports of their fixed-order derivatives and of the retained sector-profile derivatives. No estimate for an arbitrary exponential preimage outside those supports is asserted.]
] <rg:core-reserve>

#proof[
  On a good input edge the direct part of $cal(F)$ is a square. At an input seed $r_e gt.eq t \/ 4$ it pays $c t^2$ by (5.13), after choosing $L$ large. If $r_e > t$ it pays $c t r_e$. The second-stack part is nonnegative unless its mask fails. A failed mask has a witness $f$ with $r_f > t$ in this same component. For each witness there are at most $C \( 1 + log \( r_f \/ t \) \)^2 lt.eq C r_f \/ t$ failed rows. Their contributions from chords at most $t$ cost at most $C t sum_f r_f \/ L$; contributions from larger chords satisfy the same bound by the column sum of $ell_s$. Absorb them into the direct reserves. Noise seeds pay $c t^2$ when $W$ is large. On an output flag the direct part of $cal(C)$ is
  $ \( c_0 - d_0 \) t' r - 1 / 2 c_0 t' ""^2 gt.eq \( c_0 \/ 2 - d_0 \) t' r \, $
  and its second-stack part cancels exactly. The row $cal(N)$ is nonnegative.
  For the remaining mean error, coordinate paths in a block give
  $ \| m_Y - hat(m)_Y \| lt.eq C / L sum_(e subset Y) r_e . $
  For the fallback branch, $\| m_Y \| < 1 \/ 2$ already forces the right side to be bounded below by a positive constant, so this estimate holds for every sampled constituent spin. If every block chord is at most $T$, the smooth branch is used and the stronger bound is $C_L T^2$. In a block containing a chord greater than $T$, charge the large-chord terms in (5.15) to the same direct reserves with their $L^(- 1)$ gain. Its remaining $C_L t^2$ cost is paid by the stronger $c t T$ witness. All other mean and numerical losses total at most $C_L M^D s_c \( t T^2 + t e^(- c_L M) \)$.
  Selected assigned rows were used only for nonnegativity in these payments. On their retained defaults all angles are the genuine small angles, and the actual row differs from its affine row by $C_L M^D t^2$. Subtracting its affine square therefore costs at most $C_L M^D t^3$ per row. These losses are $o \( t^2 s_c \)$, since $T^2 \/ t = H_j^(- .48) \/ p$, $t M^D arrow.r 0$, and $M^D e^(- c_L M) \/ t arrow.r 0$.
  All witnesses and defaults used here lie within the retained $14 M$ neighborhood of the seeds. A derivative of a complement still has $r_e gt.eq t \/ 4$ or noise at least $W t$; a derivative of a default retains its upper support bound. The attached protectors keep every exterior argument in the injectivity ball. Together with the retained physical-spin tests this selects precisely its small principal logarithm, also on all the stated derivative supports. Thus the same argument applies there. In a component with no output seeds use the unclipped, positive-mask output formula through $4 t'$; only the fixed constants in the preceding estimates change. ◻
]

The exterior quadratic $A = D^(*) D$ is the principal restriction of

$ d^(*) sans(A)_s^(*) sans(A)_s d + a Q^(*) Q . $

Indeed every row incident on an exterior column is selected. For a vector extended by zero into the frozen region, block Poincare gives

$ parallel u parallel_2^2 lt.eq C L^2 \( parallel d u parallel_2^2 + parallel Q u parallel_2^2 \) . $

Hence $c_L upright("Id") lt.eq A lt.eq C_L upright("Id")$, uniformly in the primary geometry and the period.

For an exterior site $x$ let $Omega_x$ be the exterior sites in its radius-$r_(*)$ window, and set

$ \( Pi_u \)_(y x) = upright(bold(1))_(y in Omega_x) \( A_(Omega_x) + u \)_(y x)^(- 1) \, #h(2em) E_u = \( A + u \) Pi_u - upright("Id") . $

Exponential conjugation, followed by the resolvent identity, proves in exponentially weighted row and column sums

#[#set math.equation(numbering: n => "(5.17)")
 $ parallel \( A + u \)^(- 1) parallel + parallel Pi_u parallel lt.eq frac(C_L, 1 + u) \, #h(2em) parallel E_u parallel lt.eq frac(C_L e^(- c_L M), 1 + u) . $ <rg:window-bounds>]

The residual lies outside its column window, so every contribution crosses its radius. The same proof for a difference of free histories retains $epsilon.alt_h$. These facts also hold if the exterior is empty.

Put

$ C_s = 1 / 2 \( Pi_0 + Pi_0^(*) \) \, #h(2em) mu = - Pi_0^(*) D^(*) F \, #h(2em) r_s = D mu + F . $

By (5.17), $C_s$ is positive for large $H$, and it and all its principal marginals have upper and lower bounds at fixed $L$. The exact substitution $xi = mu + g Z$ uses the single probability law $Z tilde.op N \( 0 \, C_s \)$ and extracts

#[#set math.equation(numbering: n => "(5.18)")
 $ \( 2 pi g^2 \)^(3 n \/ 2) det \( C_s \)^(1 \/ 2) e^(- \| r_s \|^2 \/ \( 2 g^2 \)) exp {1 / 2 Z^(*) \( C_s^(- 1) - A \) Z - g^(- 1) \( A mu + D^(*) F \)^(*) Z} . $ <rg:gaussian-ratio>]

Here $n$ is the number of exterior sites and the determinant includes the three colors. This identity follows by expanding the square; the last exponential remains inside the expectation.

All nonlocal corrections in (5.18) are retained as explicit paths. With $E_s = A C_s - upright("Id")$,

#[#set math.equation(numbering: n => "(5.19)")
 $ C_s^(- 1) - A & = sum_(r gt.eq 1) \( - E_s \)^r A \,\
log det C_s & = - "Tr" log A + sum_(r gt.eq 1) frac(\( - 1 \)^(r + 1), r) "Tr" E_s^r \,\
\( log A \)_(x x) & = integral_0^oo \[ \( 1 + u \)^(- 1) upright("Id") - \( A + u \)^(- 1) \]_(x x) thin d u \, quad \( A + u \)^(- 1) = Pi_u sum_(r gt.eq 0) \( - E_u \)^r . $ <rg:ratio-series>]

The leading-window term is a local scalar. Extract its empty-pattern value on every site, including frozen sites, and put the local compensations into the adjacent core. Residual chains have at least one $E$ hop; their summed envelope, with any fixed requested support exponent, is at most

#[#set math.equation(numbering: n => "(5.20)")
 $ C_L "poly" \( M \, r \) e^(C B r) \( C_L e^(- c_L M) \)^r . $ <rg:chain-price>]

The resolvent integral uses $\( 1 + u \)^(- 2)$ for these terms.

On a stencil farther than $6 M$ from the seeds, comparison with the full empty-pattern operators gives

#[#set math.equation(numbering: n => "(5.21)")
 $ r_s = O #scale(x: 120%, y: 120%)[\(] C_L M^D \( t^2 + t e^(- c_L M) \) #scale(x: 120%, y: 120%)[\)] \, quad \| d \( e^mu T \) \| lt.eq C t \/ L + C_L M^D t^2 \, quad \| mu \| lt.eq C t + C_L M^D t^2 . $ <rg:prediction>]

These estimates include normalized derivatives and free-history differences. To prove them, first replace the numerical kernels and window inverse by the full empty-pattern kernels using (5.17). In the full calculation the first tangent of $e^mu T$ is exactly $P_h V$: the stack identities make the linear residual vanish there, and $D^(*) D$ is invertible. The remaining terms are quadratic on the local $O \( M t \)$ chart. The first and second fine-difference bounds for $P_h$ give the displayed constants independent of $L$. Everywhere, including near cores, the extended formula still gives $\| mu \| lt.eq C_L M^D t$.

=== 5.3 Prepared factors and a joint integral estimate <rg:prepared>

We describe the factors before expanding products. This is necessary because estimates on separate factors would not justify their products under a common Gaussian.

The ownership rules and complete read sets are made explicit in Sections 14.1 and 14.4. A complete read support includes geometric status queries as well as numerical arguments; a ratio’s Gaussian endpoint set is only part of that support. Disjoint complete supports give the exact factorization of Lemma 37; overlapping factors use the joint estimate below.

Mark, in each primary component, the selected input edges whose true bad-bond inventory is supplied by an old covering label. Require each marked bit to be supplied once. On every other selected input primary edge retain $upright(bold(1))_(r_e lt.eq t)$. Nonprimary edges already have $r_e lt.eq t \/ 2$ on the full product. Thus these local rules reproduce the old inventory constraint exactly.

For each primary component form a compulsory factor $B_c$ from its assigned rows, with the selected affine squares subtracted. Include the negative stationary-square exponent within $8 M$ of its seeds, all primary tests and all defaults within $14 M$, the frozen normalization reciprocals, and the leading-window determinant compensations. Retain all true and contrary output-status tests needed by these formulas. In particular a component evaluated alone does not infer the absence of a nearby output seed from unspecified outside data. Lemma 10 gives

#[#set math.equation(numbering: n => "(5.22)")
 $ \| B_c \| lt.eq e^(- c_L p^2 s_c + C_L M^D \( 1 + log g^(- 1) \) s_c) lt.eq e^(- c'_L p^2 s_c) \, $ <rg:core-bound>]

after the choices of $P_0 \, H$ made below.

On every exterior site put a smooth chart profile equal to one for $\| xi \| lt.eq pi \/ 4$ and zero for $\| xi \| gt.eq pi \/ 3$. It preserves the full sector integral and removes other angular preimages. In addition, attach a protector to every exterior spin read by a hard factor or by $B_c$. These are the protectors defined before Lemma 10; each remains attached to its factor and is never opened separately. No extra hard predicate in the moving angle $xi = log \( q T^(- 1) \)$ is imposed: alignment follows from the retained sector profiles, or is imposed by a smooth larger plateau. All merely measurable dependencies are through physical input spins, fixed tags, or output statuses that will not be field-differentiated.

The remaining factors are prepared as follows. Each stated exponential factor is then opened as $1 + \( e^V - 1 \)$.

+ On unassigned $cal(F) \, cal(B)$ rows use $- b \( \| R \|^2 - \| R^(upright("aff")) \|^2 \) \/ 2$ with smooth angular cutoffs supported in $\| xi \| lt.eq C_L t$, whose plateaus contain all full-sector values. Use smooth mean branches and no clipping. The same preparation for $- b cal(U)$ is supported inside its smooth mean branch. Their sup and fixed normalized derivative bounds are $C_L g "poly" \( M \, p \)$.
+ The unassigned stationary squares, necessarily farther than $8 M$ from the seeds, have bound $C_L g^2 "poly" \( M \, p \)$ by (5.21). The unassigned $cal(C)$ rows are zero. The $cal(N) \, cal(Z)$ rows have an exceptional bound $C_L g^(- D) e^(- c_L M)$, since $cal(N) X' = 0$ for full kernels.
+ A canonical term or regular error is called remote if its entire projected graph is farther than $14 M$ from the seeds. For a remote term replace its hard mask by a smooth product of graph-edge profiles, one through $t \/ 2$ and zero from $2 t$. The resulting function is globally smooth: the error was defined through $4 t$. For a degree-$n$ canonical term with prefactor $b^r$ and coefficient $a_X$, its bound is
  #[#set math.equation(numbering: n => "(5.23)")
   $ C_L \| a_X \| g^(n - 2 r) "poly" \( M \, p \, u \) . $ <rg:old-polynomial-bound>]
  For an old error it is $C_L "poly" \( M \, p \, s_X \) \[ f_X \]_(k \, j)$. For a nonremote term keep the actual mask and attach protectors. The same undifferentiated bounds hold; it meets a compulsory factor by the very test that made it nonremote.
+ Keep input and output kinetic truncation tails with both of their paths and every mask query. They have exceptional bounds $C_L g^(- D) e^(- c_L M)$ with their exponential path prices. Input tails may use the preceding smooth or protected hard prescription. On an output-empty extension use the analytic no-output-flag formula; otherwise retain the actual output status.
+ Use the determinant chains and the linear and quadratic Gaussian-ratio chains in (5.19) literally. A ratio exponent $Q_alpha$ has at most two Gaussian endpoints and
  #[#set math.equation(numbering: n => "(5.24)")
   $ \| Q_alpha \( Z \) \| lt.eq e_alpha (1 + sum_(x in I_alpha) \| Z_x \|^2) . $ <rg:ratio-envelope>]
  Even the eighth roots of $e_alpha$ are summable with any of the fixed support exponents required below: combine (5.20) with the finite-range path count in Section 15.1. The linear exponent uses $- g^(- 1) \( A mu + D^(*) F \)$, which has the same exceptional accuracy.
+ Replace the exterior Haar Jacobian ratio by $1 + chi \( xi \) \( J_exp \( xi \) \/ J_exp \( 0 \) - 1 \)$, where $chi$ is a smooth cutoff to $\| xi \| lt.eq C_L t$ and has the required plateau. Its second term has bound $C_L g^2 "poly" \( M \, p \)$ because the Jacobian differs from its identity value quadratically.
+ Open the remaining edge and noise defaults, and the global exterior chart profile, as one plus their signed failure letters. For the remote noise default use $chi_0 \( \| m \| \) G_(upright("noise")) \( V - m \/ \| m \| \)$, where $chi_0 = 1$ above $3 \/ 4$ and $chi_0 = 0$ below $2 \/ 3$; evaluate the normalized mean only on this smooth branch. This equals the original default on the full sector. The failure and all its nonzero derivative supports force a large Gaussian coordinate, as proved below.
+ An old covering weight retains its own sup envelope and all its protectors. Every one of its inventory edges is a selected input primary, so the label meets a compulsory factor. Its measurable function is never differentiated.

The empty-pattern leading determinant, the Gaussian scalar powers, the Haar constant and the observation denominator have already been extracted. Their local changes were put into $B_c$. In particular there is no unaccounted ordinary factor of order zero.

Every preparation above preserves the original full sector product: the required cutoffs are one and the smooth branches agree there. Only after these preparations do we open factors. A resulting term need not satisfy every original default, and its primary geometry is not recomputed from the values of $Z$.

#thm([Lemma 5.3.])[
  (Joint prepared-factor bounds).  #emph[The prepared factors have nonnegative majorants $a_alpha$ such that, for every admissible finite selection $A$ in a fixed primary pattern, including its compulsory component factors, and every allowed normalized derivative of total order $r lt.eq k$, 
#[#set math.equation(numbering: n => "(5.25)")
 $ lr(|D^r bb(E) product_(alpha in A) F_alpha|) lt.eq C_k (1 + sum_(alpha in A) s_alpha)^(d_k) product_(alpha in A) a_alpha . $ <rg:joint-product>]

 For nonempty output inventory only the undifferentiated and parameter comparison forms are asserted. A single marked discrepancy retains its own size in the corresponding product bound. The load polynomial is absorbed by a reserved amount of support exponent. The product estimate is proved explicitly in Appendix 15, with the concrete eight-class verification at its end. The majorants have the following summed bounds. An ordinary primitive of order $r > 0$ has a summed majorant $C_L g^r "poly" \( M \, p \)$, with any fixed required support exponent. The old errors retain their actual cap $delta_j$. Exceptional primitives retain an arbitrary fixed power of $g$, and an output-seeded connected component retains a bound stronger than $e^(- p^(3 \/ 10))$.]
  #emph[For a component with empty output inventory, the same statements hold through $k$ normalized field derivatives on its no-output-flag extension, and through $k - 1$ derivatives for a single input or parameter discrepancy. For a component with nonempty output inventory, only sup bounds and coupling/history differences at fixed $V$ and fixed output statuses are asserted. All discrepancies retain their own input difference or the factor $epsilon.alt_h + lambda_g$, where $lambda_g = \| b_2 - b_1 \| \/ H_j$.]
] <rg:joint>

#proof[
  For the first prepared rows, $R - R^(upright("aff")) = O \( C_L M^D t^2 \)$ and $R + R^(upright("aff")) = O \( C_L M^D t \)$ on their cutoffs. Their product times $b$ is $C_L g "poly" \( M \, p \)$. The mean error in $cal(U)$ is quadratic and is multiplied by an output gradient. Each normalized derivative replaces an angular factor by a direction of the same size. A cutoff derivative costs $t^(- 1)$ and is paired with such a direction. Thus the orders are preserved. Substitution of $mu + g Z$ adds fixed Gaussian polynomials and fixed $M \, p$ losses; it does not change the order. The same argument, using the quadratic jet of $r_s$, proves the stationary and Jacobian bounds.
  For (5.23), each relative slot is bounded by $2 t$ times the length of its path on the smooth graph cutoff. The old coefficient exponential pays every fixed power of that length, including the compensation coefficients. An old error is multiplied by a smooth cutoff supported strictly inside its $C^k$ domain and extended by zero. Its derivatives use its prescribed norm, with only fixed powers of graph size and translated direction weights. This argument does not require a large graph to fit in one angular chart. For a map discrepancy acting on an unchanged error, one extra derivative uses order at most $k$; a difference of errors itself is used only through order $k - 1$.
  For ratio letters, an elementary exponential estimate gives
  $ \| e^(Q_alpha) - 1 \| lt.eq C sqrt(e_alpha) exp {C sqrt(e_alpha) \( 1 + sum_(I_alpha) \| Z_x \|^2 \)} . $
  All endpoint loads are small in per-site sum. For any fixed moment exponent, the Gaussian determinant formula therefore bounds a product over distinct ratio letters by $C_L^n product_alpha e_alpha^(1 \/ 4)$ in that moment norm. Indeed the matrix in the quadratic exponential has sufficiently small norm, and its logarithmic determinant is bounded by a constant times its trace. The eighth-root reserve pays fixed differentiated Gaussian polynomials as well. No independence of overlapping letters is used.
  For a remote edge failure, (5.21) and $max \| Z_x \| < c_L p$ on its stencil would put the chord strictly below $t \/ 4$. For a remote noise failure they would give $\| m \| > 3 \/ 4$ and $\| V - m \/ \| m \| \| < W t$, after $W$ is chosen large. The same conclusions hold on every derivative support. A chart failure has $\| xi \| gt.eq pi \/ 4$; the global bound $\| mu \| lt.eq C_L M^D t = o \( 1 \)$ gives the stronger condition $\| Z_x \| gt.eq c \/ g$. Among $n_d$ distinct local failure tests, select at least $c_L n_d \/ M^D$ with disjoint stencils. This follows from the bounded polynomial number of test types and placements meeting a stencil. Choose an offending site in each. Exponential Chebyshev with a fixed small positive quadratic coefficient and the bounded covariance gives
  #[#set math.equation(numbering: n => "(5.26)")
   $ bb(P) \( upright("all specified failures") \) lt.eq e^(- c_L p^2 n_d \/ M^D) . $ <rg:joint-rarity>]
  The number of offending-site choices is absorbed into this bound. Again the Gaussian sites need not be independent. A fixed Holder inequality combines (5.26) with the ratio estimate.
  It remains to justify derivatives through hard inputs. Take the one marginal on the union $I$ of all read Gaussian coordinates. On each protected exterior spin solve
  $ partial_v q_x + W_x dot.op nabla_(Z_x) q_x = 0 . $
  The differential of the exponential chart is invertible on the protector’s compact support. Its inverse costs $g^(- 1)$; extend $W_x$ smoothly outside a slightly larger chart and set other components to zero. All hard physical-spin arguments are then fixed simultaneously. Integration by parts for this full marginal gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ partial_v bb(E) F = bb(E) [\( partial_v + W dot.op nabla_Z \) F + F { "div" W - Z \[ I \]^(*) C_s \[ I \, I \]^(- 1) W \[ I \] }] \, $ <rg:transport>]
  with the additional covariance score when the covariance varies. Frozen spins and tags are fixed in this operation. Explicit angle dependence in the affine squares, smooth frozen-angle extensions, chart profiles and protectors is differentiated normally. There is no hard moving-angle predicate to which (5.27) would be inapplicable.
  Repeating a fixed number of times costs only a fixed polynomial in $g^(- 1) \, M \, p \, \| I \|$ and the Gaussian variables. Every connected hard use has a retained reserve: an old covering label supplies a primary bit; a nonremote mask meets a primary by its definition; a voluntarily hard tail has its own exceptional accuracy. The core bound also holds on differentiated profile supports by Lemma 10. For a parameter difference interpolate the two core exponents at the same physical $q$; both endpoints satisfy that reserve, hence so does their interpolation.
  Only finitely many factors are differentiated at fixed total order. Their placement count and their Gaussian moment cost are polynomial in the total load, not exponential in the number of factors. All undifferentiated ordinary factors have deterministic sup bounds. Thus a single fixed Holder exponent suffices, independent of that number. The exceptional reserves absorb the finite negative powers of $g$. The restriction on output field derivatives in the statement is essential: the actual output-status indicators are not smooth.
  Finally convert the individual bounds to support-hit sums. An old anchor contributing to a new hit lies within $C M' \( 1 + s \/ L \)$ of it; there are only polynomially many such positions. For a fixed requested exponent $B$, (5.4) gives
  $ e^(B s' - A s) \( 1 + s \)^D lt.eq e^(B D_(*)) \( 1 + s \)^D e^(- \( A - B D_(*) \/ L \) s) . $
  Choose $L$ so that $B D_(*) \/ L < A \/ 4$. The unused exponential pays these polynomials. Canonical paths have their stronger analytic length weight; take $H$ so that a mesoscopic price consumes less than a fixed fraction of it. Core patterns have at most $\( C_L M^D \)^(C s_c)$ choices at a support hit, paid by (5.22). Chain sums follow from (5.20). This proves all stated summed bounds. ◻
]

=== 5.4 Connected sums and exact reassembly <rg:connected>

Here is the elementary estimate used for each connected sum. Suppose primitive majorants $a_alpha$ on supports $S_alpha$ satisfy

#[#set math.equation(numbering: n => "(5.28)")
 $ sup_x sum_(alpha : x in S_alpha) a_alpha e^(\( B + 2 \) s_alpha) lt.eq eta \, #h(2em) \| S_alpha \| lt.eq C_L M^2 s_alpha \, #h(2em) C_L M^2 eta lt.eq 1 / 4 . $ <rg:tree-condition>]

The sum of the rooted trees above a root of load $s$ is at most $e^s$: assuming this bound for the descendants, the unordered children have exponential sum at most $exp \( C_L M^2 eta s \)$. Induction on tree depth and monotone convergence prove the assertion. Connected sets are bounded by their spanning trees. For a hard-core Mayer logarithm the absolute connected-graph coefficient is at most the number of spanning trees. To see this, fix a total edge order and partition connected graphs according to their minimal spanning tree. Each class is an interval of optional extra edges; its alternating edge sum is zero or has absolute value one. Treat repeated labels as distinct numbered vertices before dividing by the factorial. This gives the same rooted-tree estimate.

The complete supports make the algebra match these bounds. Give each noncore read position its $20 M$ halo. A mean or covariance window reads only this halo, including the $3 M$ hole-status test. The mask radius $O \( log \( 1 \/ t \) \)$ is smaller than $r_(*)$ for large $H$. All reads of a core, including its $14 M$ defaults and their windows, fit inside the $50 M$ footprint with these margins. Long determinant or inverse chains retain each successive window as a separate charged hop. Two disjoint complete supports therefore have zero cross covariance under $C_s$ and disjoint frozen/tag variables. Their individual marginal entries are unchanged when outside primaries are deleted. Their integrals consequently factor exactly.

Group each connected collection of selected prepared factors into an integrated polymer, retaining its original compatibility, coverage and status checks. A disjoint family of such polymers with the full required output inventory reconstructs exactly the original selection of prepared factors. An output-empty polymer can be required to have all of its output graph good: otherwise the mandatory cover of a bad edge in that graph would intersect it and belong to the same component. It is therefore a regular masked function with the extension furnished by Lemma 11.

Apply the Mayer expansion only to these output-empty polymers and write its logarithm as $J = sum_i 1_(X_i) j_i$. For a fixed compatible family of output-seeded polymers, the allowed background has logarithm equal to $J$ minus just those Mayer terms whose supports meet that family. Factor out $e^J$, open each of these forbidden terms once as an exponential-minus-one letter with the opposite sign, and join it to the seeded polymers it meets. Every new component has nonempty output inventory. We obtain exactly

#[#set math.equation(numbering: n => "(5.29)")
 $ e^(v_(upright("step")) \| Lambda' \| - b cal(E)') e^J Xi'_(upright("pre")) \, $ <rg:preliminary-output>]

where $Xi'_(upright("pre"))$ is again a mandatory covering gas.

The same operation implements every later mask strengthening. The logarithmic correction $\( 1_X - 1_Y \) j$ for a stronger mask $Y$ can be nonzero only if its support contains a true output bad edge. In a full family it therefore meets that edge’s covering label. Open the correction once and regroup. If supports have been enlarged, regroup by the enlarged supports while retaining the original compatibilities inside the new weights. Connected-component decomposition is a bijection, so these operations preserve the density and the inventory exactly.

For countable lists, do the algebra first for finite subsets of the prepared factors. The resulting identity is for that truncated prepared expression. Lemma 11 and (5.28) give a volume-exponential absolute majorant, also for the required derivatives. Dominated convergence then gives (5.29) for the original full expression. No positivity of the truncated signed gases is used.

=== 5.5 The canonical coefficients <rg:canonical>

The canonical map is a finite-order algebraic operation on the full bulk kernels. It is useful to define it before comparing it with the exact integration. Use the empty primary pattern, no masks or cutoffs, and the full free kernels. Write

$ R = \( X - nu \, Y - w \) \, #h(2em) \( nu \, w \) = cal(M) X' \, #h(2em) U_E = X'_E dot.op \[ cal(M)^(*) \( 0 \, sqrt(a) \( m - m \/ \| m \| \) \) \]_E . $

The full energy identity is $cal(E) \( q \) + \| Y \|^2 \/ 2 - cal(E)' \( V \) = \| R \|^2 \/ 2 + sum_E U_E$. Use its affine row $R^(upright("aff")) = D_f xi + F_f$, its mean $mu_f = - C_h D_f^(*) F_f$, and its stationary residual $R_(upright("stat")) = D_f mu_f + F_f$. Substitute $xi = mu_f + g Z$, $Z tilde.op N \( 0 \, C_h \)$, in the following negative-log vertices:

#[#set math.equation(numbering: n => "(5.30)")
 $ b / 2 \( \| R_i \|^2 - \| R_i^(upright("aff")) \|^2 \) \, #h(2em) b U_E \, #h(2em) b / 2 \| R_(upright("stat") \, i) \|^2 \, #h(2em) upright("the old canonical slots on ") q \, #h(2em) - log frac(J_exp \( xi_x \), J_exp \( 0 \)) . $ <rg:canonical-vertices>]

An anchor is removed by common right multiplication before using its coordinates $y_o$. Count $y_o$ and $g Z$ as order $g$, and retain total order at most four in the negative logarithm of the Gaussian expectation. Equivalently, for each ordered multiset of $v lt.eq 4$ vertices use its connected Wick expectation with coefficient $\( - 1 \)^(v + 1) \/ v !$. Both internal and intervertex Wick pairs are included. The coefficient sums converge absolutely by the free exponential bounds and (5.5).

Write the resulting expression as $sum_(r \, d) g^(- 2 d) F_(r \, d) \( y \)$, with $r lt.eq 4$. Thus $F_(r \, d)$ is the coefficient polynomial without its displayed power of $g$, and is homogeneous of field degree $r + 2 d$. Scalar polynomials are extracted per unit volume. Let $S_(K' \, o)^(\[ n \])$ be the degree-$n$ part, in the relative $y_o$ chart, of the analytic unmasked output kinetic density, assigned to its anchor by splitting edge and row contributions between their endpoints. Its affine quadratic Hessian is one. Its odd-degree parts vanish, since it is quadratic in ambient spins and every dot product has even total degree in this chart.

Let $"Comp"$ denote the orbitwise quadratic compensation described after (5.5). The map is

#[#set math.equation(numbering: n => "(5.31)")
 $ P'_4 & = F_(2 \, 1) \, & alpha & = upright("affine Hessian of ") F_(2 \, 0) \, & I'_2 & = "Comp" \( F_(2 \, 0) - alpha S_(K')^(\[ 2 \]) \) \,\
P'_5 & = F_(3 \, 1) \, & I'_3 & = F_(3 \, 0) \,\
P'_6 & = F_(4 \, 1) \, & I'_4 & = F_(4 \, 0) - alpha P'_4 - alpha S_(K')^(\[ 4 \]) \, & kappa & = upright("affine Hessian of ") F_(4 \, - 1) \,\
J'_2 & = "Comp" \( F_(4 \, - 1) - kappa S_(K')^(\[ 2 \]) \) . $ <rg:canonical-map>]

Here and below the affine Hessian means its bulk sum per anchor. After the bulk affine coefficient has been removed, the sum of the individual orbit compensation coefficients is zero; thus $"Comp"$ does not change that polynomial sum.

Appendix 13 specifies one common coefficient norm and proves the diagonal estimate, including compensation and the translation-invariant bulk symmetry needed by the quadratic slots.

#thm([Lemma 5.4.])[
  (Completeness and contraction of the canonical map).  #emph[The list (5.6) contains every nonscalar canonical term through total order four. In that order the map (5.31) is triangular, with same-slot linear response at most $C \/ L$ in the coefficient norm, where $C$ is fixed before $L$. All other responses are bounded by constants depending on $L$ and the preceding caps. The kick $alpha$ does not depend on old $I_2$, and $kappa$ does not depend on old $J_2$ at their respective orders.]
  #emph[Consequently the caps in (5.5) can be chosen successively so that the canonical orbit starting from zero remains bounded. This orbit, and its kicks $alpha_h \, kappa_h$, approach limits exponentially in $h$.]
] <rg:canonical-contraction>

#proof[
  The first vertex of (5.30) begins with a cubic, of total order one. Its cubic contains a Gaussian field: at $Z = 0$ both $R$ and $R^(upright("aff"))$ have zero first tangent by the harmonic identity. The $U$ vertex begins in degree four. Its possible cubic would pair the real degree-two part of $m - m \/ \| m \|$ with the imaginary first-degree part of $X'$, and is zero. The stationary-square vertex begins in degree four, and the Haar vertex in degree two.
  A connected Wick graph on $v$ vertices requires at least $v - 1$ intervertex pairs. Each vertex carries at most $g^(- 2)$ and each pair supplies $g^2$, so its remaining prefactor is at most $g^(- 2)$. Write it as $g^(- 2 d)$, with the integer $d lt.eq 1$. A linear field is forbidden because the stabilizer $S O \( 3 \)$ has no invariant vector. The possible degree-three term at order one is zero by the Gaussian-field observation above. At orders two, three and four, the remaining possibilities are respectively
  $ \( b P_4 \, I_2 \, upright("scalar") \) \, #h(2em) \( b P_5 \, I_3 \) \, #h(2em) \( b P_6 \, I_4 \, b^(- 1) J_2 \, upright("scalar") \) . $
  The full invariant-tensor basis includes every color contraction, including odd alternating tensors. No additional tensor has been discarded by a parity assumption.
  For a quadratic form, conjugation invariance gives a color dot product. On affine fields it has the form $sum_(mu \, nu) T_(mu nu) a_mu dot.op a_nu$. Spatial reflections give $T_12 = 0$ and the quarter turn gives $T_11 = T_22$. Thus there is exactly one affine quadratic coefficient. Its removal is precisely the stiffness extraction in (5.31); polarization then gives vanishing on every pair of affine fields. A one-site invariant potential is constant, so there is no additional relevant potential term.
  Composition cannot lower the total order of an old slot, since an anchor-relative field has no constant term. At its own order an old slot therefore enters only through a singleton Gaussian expectation and its linear field map. Contractions lower $d$ and cannot raise it. Ordering equal total orders by decreasing $d$ gives exactly the triangular order (5.6). The subtractions in (5.31) preserve it. In particular the term $alpha P'_4$ is necessary to express the output with coupling $b + alpha + kappa \/ b$.
  For its diagonal response, a relative field at $x$ is replaced by $sum_z \( P_h \( x \, z \) - P_h \( o \, z \) \) y_o \( z \)$. The free fine-difference bounds give, with any of the fixed smaller exponential weights needed here,
  #[#set math.equation(numbering: n => "(5.32)")
   $ sum_z e^(c sigma \| z - \[ o \] \|) \| P_h \( x \, z \) - P_h \( o \, z \) \| lt.eq frac(C \| x - o \|, L) e^(C_1 sigma \( 1 + \| x - o \| \/ L \)) . $ <rg:row-difference>]
  Its constants are independent of $L$. A degree-$n$ substitution therefore has a factor $L^(- n)$; the $L^2$ old anchors over a new anchor give $L^(2 - n) lt.eq L^(- 1)$ for $n gt.eq 3$. Fixed powers of old path lengths are absorbed by the unused old exponential, uniformly once $L gt.eq 2 C_1$.
  For a compensated quadratic write this row difference as
  $ \( x - o \) dot.op nabla_f P_h \( o \, dot.op \) + R_x \, #h(2em) parallel R_x parallel_exp lt.eq frac(C \| x - o \|^2, L^2) e^(C_1 sigma \( 1 + \| x - o \| \/ L \)) . $
  The product of the two affine pieces cancels on the whole old compensated orbit. The remaining coefficient polynomials have a factor $L^(- 3)$, which gives $C \/ L$ after the anchor count. This cancellation is performed before taking absolute coefficient norms. Output compensation adds only fixed polynomial path factors; spare exponential width pays them with a constant fixed before $L$. Moreover the aggregate transferred affine Hessian is exactly zero, because $P_h$ preserves affine fields. This proves the assertions about $I_2 \, alpha$ and $J_2 \, kappa$.
  All nondiagonal terms contain a bounded number of vertices. Their connected position sums are bounded by exponentially summable free kernels and old coefficient lists, so they have finite $C_L$ bounds, also for differences. Choose $L$ for diagonal contraction and then the caps successively. Positive triangular weights give a common contraction factor $q_c < 1$ for differences in a bounded orbit. The free-history forcing is $C_L L^(- h)$. Comparing an orbit of length $h$ with any longer one aligned for its last $h$ steps gives
  $ d_h lt.eq q_c^h C_L + C_L sum_(r = 0)^(h - 1) q_c^(h - 1 - r) L^(- r) lt.eq C_L rho_c^h $
  for a fixed $max \( q_c \, L^(- 1) \) < rho_c < 1$. This is uniform in the extra history, hence proves the Cauchy and kick assertions. No interacting fixed point has been assumed. ◻
]

=== 5.6 The regular error and the exact Taylor comparison <rg:error>

The one old-error contribution which cannot be discarded by order counting is its isolated linear response

#[#set math.equation(numbering: n => "(5.33)")
 $ cal(T) f_X \( V \) = bb(E)_(C_s) \[ chi_X \( q \) f_X \( q \) \] \, #h(2em) q_x = exp \( mu_x + g Z_x \) V_(\[ x \]) \, $ <rg:error-transfer>]

in the empty primary pattern. Give it the projected old anchor. For $s_X lt.eq L^(1 \/ 4)$ include a complete output good-field ball of radius $C M'$ and its required stencils. Increasing $C_(upright("adm"))$ makes these cases nonwinding. Any strengthening of an existing mask is compensated by the exact operation following (5.29).

#thm([Lemma 5.5.])[
  (Contraction of old regular errors).  #emph[For each fixed required output exponent $B$, and sufficiently large $L$ followed by $H$, 
#[#set math.equation(numbering: n => "(5.34)")
 $ parallel cal(T) f parallel_(k \, j - 1 \, B) lt.eq \( C \/ L + o \( 1 \) \) parallel f parallel_(k \, j \, A) . $ <rg:error-contraction-bound>]

 The same bound applies to an input difference through order $k - 1$. A change of map acting on an unchanged input instead costs $C_L "poly" \( M \, p \) delta_j \( epsilon.alt_h + lambda_g \)$ through order $k - 1$.]
] <rg:error-contraction>

#proof[
  Retain an even smooth Gaussian guard $\| Z_x \| lt.eq c_L p$ on all read sites. Its complement costs $C_L M^D \( 1 + s_X \)^D e^(- c_L p^2) \[ f_X \]_(k \, j)$, including the derivatives at issue, by the union tail estimate and Lemma 11. On the guard the old cutoff $chi_X$ is one, also when the fluctuation is multiplied by any number in $\[ - 1 \, 1 \]$.
  For output orders at most two, Taylor expansion twice in that fluctuation removes it with error
  #[#set math.equation(numbering: n => "(5.35)")
   $ C_L M^D \( 1 + s_X \)^D p^(- 2) \[ f_X \]_(k \, j) . $ <rg:fluctuation-omission>]
  The first term integrates to zero by the even guard. Each fluctuation insertion has size at most $C sup \| Z \| \/ p$ in the old direction norm; mixed map derivatives retain these two factors. Only four old derivatives are needed. Choose $P_0$ larger than the fixed $M$-power requirement, so this is a delayed small factor.
  For a short label remove the anchor spin by right multiplication and write
  $ A_x = log \( q_x^0 \( q_o^0 \)^(- 1) \) \, quad q_x^0 = e^(mu_x) V_(\[ x \]) \, #h(2em) frak(b)_x = \( x - o \) dot.op nabla_f P_h \( o \, dot.op \) y . $
  In the old normalized direction norm, including the low output derivatives,
  #[#set math.equation(numbering: n => "(5.36)")
   $ parallel A parallel lt.eq C \/ L + o \( 1 \) \, #h(2em) parallel A - frak(b) parallel lt.eq C \/ L^2 + o \( 1 \) . $ <rg:affine-prediction>]
  For $r = \| x - o \| lt.eq L$, the first and second fine-difference bounds give respectively $C t' r \/ L$ and $C t' r^2 \/ L^2$. Dividing by the old direction bound $t \( 1 + r \)^8$ gives the two displayed gains, since $t' \/ t$ is bounded. For $r > L$, use instead the bounded row of $P_h$: the ratio of direction weights is at most $C \( 1 + r \/ L \)^8 \/ \( 1 + r \)^8 lt.eq C L^(- 8)$. The affine term divided by the old weight is at most $C r \/ \[ L \( 1 + r \)^8 \] lt.eq C L^(- 8)$ as well. This treats distant sites without extending a small-displacement Taylor bound beyond its range. The same estimates apply to the linear parts of the first two output derivatives. Nonlinear chart terms have an extra $t$ with fixed polynomial $M$ costs, which tend to zero after $L$ is fixed. The Gaussian guard permits the same first-derivative bound for the relative-angle map with fluctuation retained, while every higher map derivative is $o \( 1 \)$ in this norm.
  To see the cancellation also in the differentiated norms, put $F_X \( A \) = f_X \( e^A \)$ and $cal(B)_X = D^2 F_X \( 0 \)$ after removing the anchor spin. The normalization of $f_X$ gives $F_X \( 0 \) = D F_X \( 0 \) = 0$, and $cal(B)_X$ vanishes on every pair of affine tangent fields. For two normalized output directions write $A_i = partial_i A$ and $A_12 = partial_1 partial_2 A$. Taylor’s formula and the chain rule give
  $ F_X \( A \) & = 1 / 2 cal(B)_X \( A \, A \) + R_0 \,\
partial_i F_X \( A \) & = cal(B)_X \( A \, A_i \) + R_i \,\
partial_1 partial_2 F_X \( A \) & = cal(B)_X \( A_1 \, A_2 \) + cal(B)_X \( A \, A_12 \) + R_12 . $
  The bounds (5.36), including these derivatives, give
  $ \| R_0 \| + \| R_1 \| + \| R_2 \| + \| R_12 \| lt.eq #scale(x: 120%, y: 120%)[\(] C \/ L^3 + o \( 1 \) #scale(x: 120%, y: 120%)[\)] \[ f_X \]_(k \, j) . $
  For example the second-derivative remainder is bounded by a constant times $\( parallel A parallel parallel A_1 parallel parallel A_2 parallel + parallel A parallel^2 parallel A_12 parallel \) \[ f_X \]_(k \, j)$; only three old derivatives are needed here. Every derivative of $frak(b)_x = \( x - o \) dot.op nabla_f P_h \( o \, dot.op \) y$ remains affine in $x - o$. Replacing each $A$ or its derivatives in the bilinear terms by the corresponding $frak(b)$ therefore gives zero. Each remaining term contains one difference controlled by $C \/ L^2 + o \( 1 \)$ and one factor controlled by $C \/ L + o \( 1 \)$, proving the same gain for the bilinear terms. The chart conversion costs already included above and the fluctuation-omission error tend to zero with $H$.
  The Taylor segment stays in the old graph domain because (5.21) puts its chords strictly inside the cutoff plateau. For output orders three through $k$, retain the fluctuation and apply the chain rule directly on the Gaussian guard. A term has either at least three first map derivatives, giving $C \/ L^3 + o \( 1 \)$, or a higher map derivative, giving $o \( 1 \)$ for fixed $L$. This uses no old derivative above the requested order; it does not differentiate a Taylor remainder through order $k$.
  There are $L^2$ old anchors over a new anchor. On these short labels the output load is bounded independently of $L$, so its fixed exponential price gives $C \/ L + o \( 1 \)$. On labels $s_X > L^(1 \/ 4)$, including winding ones, use the direct composition bound $C \( 1 + s_X \)^D \[ f_X \]_(k \, j)$. There is no loss of a bare $M$ power in its leading first-direction comparison: the absolute first jet is the bounded row of $P_h$. Higher map derivatives have extra $t$ factors paying their $M$ powers. The unused old size exponential in (5.4) gives $e^(- c L^(1 \/ 4))$, which pays $L^2$ and the displayed polynomial. This proves (5.34).
  An input difference uses exactly the same argument in order $k - 1$. For a changed map, ordinary composition estimates use one extra derivative of the unchanged error, at most $k$, and give the stated map-difference bound. Thus iteration does not lose one derivative at each scale: every individual output is still $C^k$, and every discrepancy is measured in $C^(k - 1)$. ◻
]

We now compare the exact logarithm in (5.29) with (5.31). An ordinary positive-order primitive of order $r$ has majorant $C_L g^r "poly" \( M \, p \)$. Inflate it by $g^(- .96 r)$ in (5.28). Its remaining $g^(.04 r)$ still beats every fixed logarithmic loss and the factor $M^2$. The connected sum of terms of total order at least five therefore retains $g^4.8$. A smaller exponent pays the remaining fixed derivative and logarithmic costs. Thus, after removing the isolated old-error response, all nonprincipal terms cost

#[#set math.equation(numbering: n => "(5.37)")
 $ C_L g^4.6 \, #h(2em) C_L g^4.5 tau upright(" for discrepancies") \, quad tau = u + epsilon.alt_h + lambda_g \, $ <rg:high-order-remainder>]

in the needed anchored norms and a sufficiently large fixed support exponent. Old errors are counted as order four here but retain their stronger actual cap; every nonisolated use has total order at least five. Exceptional terms and canonical paths longer than $M$ have arbitrary power accuracy.

For the principal terms, group the at most four origins at one anchor and strengthen their masks to a common ball. Choose $C_chi$ large and then $L$ large: the old canonical balls shrink by $L$, while the fixed number of new stencils uses only fixed multiples of $M$. The common ball contains every required read. Its complement is compensated in the covering gas. On that ball and the even Gaussian guard, every prepared factor has its smooth vacuum formula. Taylor expansion through total order four, then restoration of full Gaussian polynomial moments, costs $C_L g^5 "poly" \( M \, p \)$, also in the normalized derivative norms. The largest vertex degree required is six; a higher normalized derivative retains the same power because each direction supplies a factor $t$.

On each fixed origin multiset the exact product and Mayer-log identities are identities of these finite polynomials. They give precisely its connected Wick expectation under the short Gaussian, including repeated origins and the Jacobian logarithm. Replacing short kernels and covariance by full ones costs exponential accuracy in $M$, with all fixed position moments and discrepancies. Any connection that appears only after this replacement contains a long kernel path and has that same accuracy. The principal answer is therefore exactly (5.31), up to (5.37). This proves that the formal coefficient operation describes the actual integration to the claimed accuracy.

=== 5.7 Normalization, periods, and closure <rg:normalization>

The remaining task is to remove the constant and affine-Hessian parts of the regular error without changing the density. These two extractions determine the scalar increment and the remaining kinetic increment $Delta$.

Put $b^(-) = b + alpha + kappa \/ b$. Inserting the full canonical lists with their masks and expressing their displayed prefactors in terms of $b^(-)$ leaves a raw regular list. Denote its norm by $R$ and the norm of its difference for two inputs by $R^Delta$. The preceding two subsections give

#[#set math.equation(numbering: n => "(5.38)")
 $ R & lt.eq q_1 delta_j + C_L g^4.6 \,\
R^Delta & lt.eq q_1 delta_j^Delta + C_L "poly" \( M \, p \) delta_j \( epsilon.alt_h + lambda_g \) + C_L g^4.5 tau \, #h(2em) q_1 = C \/ L + o \( 1 \) . $ <rg:raw-error>]

Here $delta_j^Delta$ is the actual input error discrepancy, before division by $delta_j$, and $lambda_g = \| b_2 - b_1 \| \/ H_j$ up to a fixed constant. The constant multiplying $L^(- 1)$ is fixed before $L$; the $o \( 1 \)$ is made small by the subsequent choice of $H$. These estimates hold with any of the finitely many larger support exponents reserved for the operations that follow.

We describe the insertion of the kinetic terms explicitly. Assign each analytic base path to an anchor, using the convention in (5.31), and require on its mask every edge queried by the relevant $m'_e$. On that mask it is the analytic chord expression. Its Taylor remainder after degree four for the $alpha$ term, or degree two for the $kappa \/ b$ term, has the accuracy in (5.37). A long path pays its position and derivative powers from exponential localization. Off the mask keep the actual clipped path expression as a covering correction. Its site-hit bound is a small power of $g$: the direct clipped energy is at most $C t'$, and an active second-slot row is bounded using $m'_e = 1$ and its exponentially weighted chord bound. Thus the exact insertion uses no Taylor formula outside its domain.

For a nonwinding raw error at anchor $o$, let $v_i = f_i \( 1 \)$ and let $b_i$ be its unit-affine Hessian. The direction norm gives

$ \| v_i \| lt.eq \[ f_i \]_(k \, j - 1) \, #h(2em) \| b_i \| lt.eq C \( t' \)^(- 2) \[ f_i \]_(k \, j - 1) . $

There is no support-size loss in the second estimate: a unit affine field at distance $r$ is bounded by a constant times $\( 1 + r \)^8$. After strengthening the mask to include the nearest neighbors of $o$, use the exact identity

#[#set math.equation(numbering: n => "(5.39)")
 $ 1_X f_i = v_i + b_i S_o + 1_X \( f_i - v_i - b_i S_o \) - \( 1 - 1_X \) \( v_i + b_i S_o \) . $ <rg:normalization-identity>]

The middle term has zero value and zero affine Hessian. On its extension, $S_o$ and its normalized derivatives are bounded by $C \( t' \)^2$, so its norm is at most a fixed multiple of that of $f_i$. The last term meets an output bad bond and is included in the covering gas by the exact regrouping in Section 5.4.

Sum the bulk $v_i$ per anchor into the volume scalar and put $Delta = sum_i b_i$, also using the bulk lists. Replacing $b^(-)$ by $b' = b^(-) + Delta$ leaves the negative-log correction

#[#set math.equation(numbering: n => "(5.40)")
 $ - Delta #scale(x: 120%, y: 120%)[\(] cal(E)' - sum_o S_o #scale(x: 120%, y: 120%)[\)] . $ <rg:kinetic-reset>]

Allocate the compensating $S_o$ to each base path in proportion to that path’s affine Hessian. These Hessians sum to one. On its path mask each resulting expression has zero affine Hessian, and the sum of its regular norms is at most $C \( t' \)^2 \| Delta \|$. The constant here is independent of $L$: it uses only the uniform exponentially weighted free-row moments and the fixed direction order. Mask complements are again covering corrections. The changes in the seven displayed canonical prefactors are smaller; for example the change $Delta P'_4$ has an additional factor $\( t' \)^4$. Consequently the final regular norm and coupling error satisfy

#[#set math.equation(numbering: n => "(5.41)")
 $ parallel f' parallel_(k \, j - 1 \, A) lt.eq C q_1 delta_j + C_L g^4.6 \, #h(2em) \| Delta \| lt.eq C_L H_j^(- 1.05) . $ <rg:closed-error>]

The same operations give the difference estimate in (5.38), up to fixed factors and the indicated $\( t' \)^(- 2)$ for $Delta$. In particular no derivative above order $k$ of an input error has been used.

We next justify using bulk $v_i \, b_i$ on every admitted period. Every finite-period free entry is the fold of its lifted paths. All primitive choices retain complete lifted read records. A connected calculation with load below $c_(*) n' \/ M'$ therefore agrees exactly with its bulk calculation. A disagreement has load at least $c_(*) n' \/ M'$, and hence has an additional factor

$ exp \( - c_(*) A_1 n' \/ M' \) $

from a reserved support exponent $A_1$. Keep a period-dependent constant or Hessian disagreement as an actual winding error, with a declared record of load $O \( n' \/ M' \)$. The extra exponential pays this record. Its constant is an allowed winding term; its Hessian is multiplied by $S_o$, recovering the factor $\( t' \)^2$ in the regular norm. An off-mask correction has the same covering interpretation as before. Already winding inputs remain winding because $s' gt.eq 4 s \/ L$ in (5.4). Thus all period discrepancies stay in the error or covering lists. The extracted coupling and volume scalar are precisely the bulk ones and are independent of the period.

Here is a finite order of choices closing all the estimates. Reserve a sufficiently large fixed support exponent $E_(*)$ for the finitely many tree, mask, orbit and winding operations, and let $D_(*)$ bound their geometric dilations. First choose $L$ large enough that

$ E_(*) D_(*) \/ L < A \/ 4 \, #h(2em) C_(upright("lead")) e^(2 E_(*) D_(*)) \/ L < 1 \/ 16 \, $

as well as the free and core requirements already stated. $C_(upright("lead"))$ uses only the uniform free moments and the fixed derivative and reset conventions. It does not contain a constant that grows with $L$. Choose the seven canonical caps successively using Lemma 12. Choose fixed triangular weights for their discrepancy norm.

Let $D$ exceed every fixed polynomial degree in $M$, support load, Gaussian score variables, and normalization entropy used above. Increase it for the finitely many remaining regroupings and choose $P_0 gt.eq 2 D + 2$. Finally increase $H$ until, uniformly for $H_j gt.eq H$,

#[#set math.equation(numbering: n => "(5.42)")
 $ C_L e^(- c_L M) "poly" \( M \) & lt.double 1 \, & C_L t M^D & lt.double 1 \,\
C_L M^D \/ p^2 & lt.double 1 \, & C_L M^D \( T^2 \/ t + e^(- c_L M) \/ t + t \) & lt.double 1 \,\
C_L M^D \( 1 + log g^(- 1) \) & < c_L p^2 \/ 4 \, & c_L p^2 \/ M^D & gt.double p^(3 \/ 10) + D log g^(- 1) + D log M \,\
C_L g^.04 "poly" \( M \, p \) & lt.double M^(- 2) \, & C_L g^4.6 \/ delta_j & lt.double 1 . $ <rg:finite-choices>]

Each condition follows either from $P_0 gt.eq 2 D + 2$ or from a positive power of $H_j$ dominating every fixed power of its logarithm. For instance $T^2 \/ t = H_j^(- .48) \/ p$, and $g^4.6 \/ delta_j = O \( H_j^(- .25) \)$. The choices are therefore noncircular.

Equation (5.41) now gives the renewed error cap. Every output-seeded component retains a compulsory suppression. The reserve, the shared Gaussian tail estimate and (5.42) give, after all its decorations and regroupings, the stronger covering bound $e^(- p^(3 \/ 10)) = o \( w_(j - 1) \)$. This pays the fixed hard-derivative losses and the relative input error and gas discrepancy norms. Symmetrizing the assignments by the finite spatial group preserves these bounds and the density.

For completeness, divide the error discrepancy in (5.38) by $delta_(j - 1)$. The remainder factor is small because $g^4.5 \/ delta_j = O \( g^.4 \)$. The gas has just been bounded with strictly more suppression than its required relative cap. The canonical map is triangular with contracting diagonal. Choose the later discrepancy weights sufficiently small, and then enlarge $H$ for the remaining cross terms. This gives a common $q < 1$. Dependence on the precise coupling costs $"poly" \( M \, p \) \| b_2 - b_1 \| \/ H_j$, which is at most $C_L H_j^(- 1 \/ 2) \| b_2 - b_1 \|$ after increasing $H$. Differences of the canonical kicks cost $C_L u$; differentiating $kappa \/ b$ costs $C_L \| b_2 - b_1 \| \/ H_j^2$; the extracted raw Hessian has the bounds just proved. Weakening the positive decay exponent if necessary gives (5.12)–(5.12). This finishes the proof of Theorem 5.1.

== 6 Determining the kinetic drift <cal:section>

The two coefficients computed here agree with the first two sigma-model renormalization coefficients #cite(label("BrezinZinnJustin")) #cite(label("BrezinZinnJustinLeGuillou")) #cite(label("Shin")). We determine them in the precise lattice normalization rather than importing a change of renormalization scheme. The bare variable used below is $beta$; the fluctuation parameter in Section 5 is $g = beta^(- 1 \/ 2)$, whereas the usual perturbative charge is $beta^(- 1)$.

The preceding construction proves that the scalar and kinetic coefficients are well defined and that their canonical parts converge with the free history. It remains to determine two numbers. We do so by computing a finite-volume partition function in two ways. The bare calculation below is an ordinary finite-dimensional Laplace expansion; its remainder need not be uniform in the volume. Uniformity enters only in the second calculation, through the coefficient bounds already proved for the block transformation.

Let $alpha_h \, kappa_h$ be the canonical kinetic kicks at depth $h$, starting with zero canonical interactions. Thus a single step has the form

$ beta' = beta + alpha_h + kappa_h \/ beta + Delta_h . $

The error $Delta_h$ is the regular-error contribution, separately bounded in Theorem 5.1. It is absent from the formal canonical calculation. Define

$ B_s = sum_(h < s) alpha_h \, #h(2em) C_s = sum_(h < s) kappa_h . $

#thm([Theorem 6.1.])[
  #emph[For the nearest-neighbor O(4) normalization of (1.1), and $gamma = \( log L \) \/ pi$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ B_s & = - gamma s + O_L \( 1 \) \, & C_s & = - frac(gamma, 2 pi) s + O_L \( 1 \) \,\
alpha_h & = - gamma + O_L \( rho^h \) \, & kappa_h & = - frac(gamma, 2 pi) + O_L \( rho^h \) $ <cal:sums>]

 for some $rho < 1$. The constants are independent of the number of subsequent block transformations.]
] <thm:calibration>

=== 6.1 A finite-torus expansion <a-finite-torus-expansion>

For this calculation only, take spins on $S^D$, so that there are $D$ tangent components. Let $v = n^2$. Write $A \( n \)$ and $Z_2 \( n \)$ for the coefficients of $beta^(- 1)$ and $beta^(- 2)$ in $log Z_beta \( n \, n \)$ at fixed $n$. A subscript $upright(d)$ denotes the operation $F_(upright(d)) \( n \) = 4 F \( n \) - F \( 2 n \)$, and put $D_0 = 3 D \/ 2$.

Near an aligned configuration choose the mean-spin axis and write

$ q_x = \( sqrt(1 - \| u_x \|^2) \, u_x \) \, #h(2em) sum_x u_x = 0 \, #h(2em) z_x = sqrt(beta) thin u_x . $

Integrating over the mean axis gives the chart density

$ product_x \( 1 - \| u_x \|^2 \)^(- 1 \/ 2) (v^(- 1) sum_x sqrt(1 - \| u_x \|^2))^D . $

Indeed the delta constraint that the mean tangent component vanishes has axis Jacobian $\| macron(q) \|^(- D)$, so the displayed factor cancels that Jacobian. The root with positive mean component is selected. At fixed volume every configuration outside a neighborhood of the aligned manifold has a positive action excess, and hence contributes exponentially little as $beta arrow.r oo$.

Let $K$ be the nearest-neighbor Laplacian and let $G_x$ be its mean-zero inverse on the torus. In this subsection put

$ G = G_0 \, quad M = v^(- 1) sum_x G_x^2 \, quad r = frac(1 - v^(- 1), 2) \, quad c = G - r \/ 2 = G_(e_1) . $

The components of $z$ are independent centered Gaussian fields with covariance $G$. Put $R_x = \| z_x \|^2$. Expansion of the action and chart density gives

#[#set math.equation(numbering: n => "(6.2)")
 $ L_1 =  & 1 / 2 \( 1 - D \/ v \) sum_x R_x - 1 / 8 sum_(chevron.l x y chevron.r) \( R_x - R_y \)^2 \,\
L_2 =  & (1 / 4 - frac(D, 8 v)) sum_x R_x^2 - frac(D, 8 v^2) (sum_x R_x)^2 - 1 / 16 sum_(chevron.l x y chevron.r) \( R_x - R_y \)^2 \( R_x + R_y \) . $ <cal:L1>]

All edge sums in these two formulas are unoriented. Therefore

$ A \( n \) = bb(E) L_1 \, #h(2em) Z_2 \( n \) = bb(E) L_2 + 1 / 2 "Var" L_1 . $

The first coefficient is

#[#set math.equation(numbering: n => "(6.3)")
 $ A \( n \) = frac(D v r^2, 4) - frac(D \( D - 1 \), 2) G . $ <cal:A>]

For example $bb(E) \( R_x - R_y \)^2 = 4 D \( G^2 - c^2 \)$ on an edge, which gives (6.3) directly. For the next coefficient, the independent Gaussian variables $\( z_x + z_y \) \/ sqrt(2)$ and $\( z_x - z_y \) \/ sqrt(2)$ have covariances $\( G + c \) I$ and $\( G - c \) I$. Their moments give

#[#set math.equation(numbering: n => "(6.4)")
 $ bb(E) L_2 =  & D \( D + 2 \) [(v / 4 - D / 8) G^2 - v r G^2 + frac(v r^2 G, 4)] - frac(D^3 G^2, 8) - frac(D^2 M, 4) . $ <cal:EL2>]

To compute the variance, decompose $L_1$ into its second and fourth Gaussian chaoses, that is, its normal-ordered homogeneous Gaussian polynomials. The quadratic coefficient matrix of its second chaos is

$ - 1 / 2 \[ c K + \( D - 1 \) I \/ v \] . $

This follows by replacing the second-chaos part of $\( R_x - R_y \)^2$ by $4 G \( : R_x : + : R_y : \) - 8 c : z_x dot.op z_y :$ and summing the four incident edges. Since $K G$ is the projection off constants, its contribution to half the variance is

#[#set math.equation(numbering: n => "(6.5)")
 $ D / 4 { c^2 \( v - 1 \) + 2 c \( D - 1 \) G + \( D - 1 \)^2 M } . $ <cal:chaos2>]

The fourth chaos is $- 1 / 8 sum_(x y) K_(x y) : R_x R_y :$. In its covariance there are four pairings which send all fields at $x$ to one endpoint and all fields at $y$ to the other, four with the endpoints exchanged, and sixteen mixed pairings. The first eight have color factor $D^2$ and the last sixteen factor $D$. Thus its contribution to half the variance is

#[#set math.equation(numbering: n => "(6.6)")
 $ v (frac(D^2 T_1, 16) + frac(D T_2, 8)) \, $ <cal:chaos4>]

where

$ T_1 & = sum_x #scale(x: 120%, y: 120%)[\(] K G_bullet^2 #scale(x: 120%, y: 120%)[\)]_x^2 \,\
T_2 & = sum_y K_(0 y) sum_x G_x G_(x - y) #scale(x: 120%, y: 120%)[\(] K \( G_bullet G_(bullet - y) \) #scale(x: 120%, y: 120%)[\)]_x . $

Distinct chaoses are orthogonal, so no further variance terms occur.

Here are useful reductions of these expressions. In sums indexed by $a \, d$, let these indices run over all four nearest-neighbor directions. Set

$ J_a \( x \) = G_(x + a) - G_x \, quad P \( x \) = sum_a J_a \( x \)^2 \, quad h_(a d) \( x \) = J_d \( x + a \) - J_d \( x \) \, $

and

$ j_0 = sum_x P \( x \)^2 \, #h(2em) j_1 = sum_(x \, a \, d) J_a \( x \)^2 h_(a d) \( x \)^2 . $

The discrete product rule $K \( f g \) = f K g + g K f - sum_a \( nabla_a f \) \( nabla_a g \)$ gives

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_x G_x P \( x \) & = G^2 - M \,\
T_1 & = 4 G^2 \( 1 - v^(- 1) \) - 4 G r^2 + j_0 \,\
T_2 & = 8 r G^2 - 2 r^2 G - 2 \( G^2 - M \) \/ v - W \,\
W & = 2 r \( G^2 + c^2 \) + j_0 \/ 2 - j_1 \/ 4 . $ <cal:GP>]

For clarity, (6.7) follows by applying the product rule to $W = sum_(x \, d) G_x J_d \( x \) \( K \( G_bullet J_d \) \)_x$. Its three terms are

$ sum_x G_x \( K G \)_x P \( x \) \, quad sum_(x \, d) G_x^2 J_d \( x \) \( K J_d \)_x \, quad - sum_(x \, a \, d) G_x J_a \( x \) J_d \( x \) h_(a d) \( x \) . $

The middle term is $2 r \( G^2 + c^2 \)$. In the last term use $2 J_d h_(a d) = J_d \( x + a \)^2 - J_d \( x \)^2 - h_(a d)^2$ and sum by parts. The difference cancels the first term and supplies $j_0 \/ 2$; reversal of each $a$-edge gives $sum G_x J_a h_(a d)^2 = - j_1 \/ 2$, supplying $- j_1 \/ 4$. The other three identities follow from the same product rule and $K G = delta_0 - v^(- 1)$.

Combining (6.4)–(6.7) yields

#[#set math.equation(numbering: n => "(6.8)")
 $ Z_2 \( n \) = D v [frac(D - 1, 16) j_0 + 1 / 32 j_1 + 1 / 128] - frac(D \( D - 1 \)^2, 4) G^2 - frac(D \( D - 1 \), 8) G + O \( 1 \) . $ <cal:Z2>]

In fact the remainder displayed as $O \( 1 \)$ is exactly

$ frac(D \( D - 1 \) \( D - 2 \), 4) M + frac(D \( D - 1 \), 8 v) G - frac(3 D, 128) + frac(3 D, 128 v) - frac(D, 128 v^2) . $

This also verifies that the remainder is bounded, using $G = O \( log n \)$ and $M = O \( 1 \)$.

=== 6.2 The logarithm in the finite-size correction <the-logarithm-in-the-finite-size-correction>

Let

$ G^oo \( x \) = integral_(\[ - pi \, pi \]^2) frac(cos \( p dot.op x \) - 1, sum_mu 4 sin^2 \( p_mu \/ 2 \)) frac(upright(d)^2 p, \( 2 pi \)^2) $

be the infinite-lattice potential, with $G^oo \( 0 \) = 0$, and use superscript $oo$ for its differences. For $d = 1 \, 2 \, 3$ one has, with $x$ in the centered fundamental square for the torus term,

#[#set math.equation(numbering: n => "(6.9)")
 $ \| nabla^d G \( x \) \| + \| nabla^d G^oo \( x \) \| & lt.eq C \( 1 + \| x \| \)^(- d) \,\
\| nabla^d \( G - G^oo \) \( x \) \| & lt.eq C n^(- d) quad \( \| x \|_oo lt.eq n \/ 3 \) . $ <cal:green-decay>]

The bound for $G^oo$ holds at every lattice point. To see these bounds, partition the Fourier multiplier $\[ sum_mu 4 sin^2 \( p_mu \/ 2 \) \]^(- 1)$ into smooth dyadic annuli of radius $s$. After $d$ differences, integration by parts bounds each annulus by $C_N s^d \( 1 + s \| x \| \)^(- N)$. The corresponding torus sum is its periodization. For $s gt.tilde n^(- 1)$ sum its nonzero translates; for smaller $s$ sum the infinite-lattice estimates directly. These give (6.9)–(6.9). The same Fourier comparison gives $G = \( 2 pi \)^(- 1) log n + O \( 1 \)$ and $M = O \( 1 \)$. The leading symbol $i a dot.op p \/ \| p \|^2$ gives

$ J_a^oo \( x \) = - frac(a dot.op x, 2 pi \| x \|^2) + O \( \| x \|^(- 2) \) . $

One may evaluate it by replacing a cutoff at zero by $e^(- \| p \|^2)$; the difference has the stated faster decay, and $e^(- \| p \|^2) \/ \| p \|^2 = integral_1^oo e^(- t \| p \|^2) thin upright(d) t$.

The equation and square symmetry improve the local comparison. At zero its first difference is $1 \/ \( 4 v \)$, its pure centered second difference is $1 \/ \( 2 v \)$, and its mixed centered second difference is zero. Summing the third-difference bound therefore gives

#[#set math.equation(numbering: n => "(6.10)")
 $ J_a \( x \) - J_a^oo \( x \) = frac(a dot.op x, 2 v) + frac(1, 4 v) + O \( \( 1 + \| x \| \)^2 \/ n^3 \) \, #h(2em) \| x \|_oo lt.eq n \/ 4 . $ <cal:green-quadratic>]

Put $c_(*) = \( 2 pi \)^(- 1)$. For $1 lt.eq \| x \| lt.eq n \/ 4$, the preceding formulas imply

$ P \( x \) - P^oo \( x \) & = - 2 c_(*) \/ v + O \( \( v \| x \| \)^(- 1) + \| x \| \/ n^3 + \| x \|^2 \/ v^2 \) \,\
P^oo \( x \) & = 2 c_(*)^2 \/ \| x \|^2 + O \( \| x \|^(- 3) \) . $

In the difference of the squares the only logarithmic sum is $- 8 c_(*)^3 v^(- 1) sum_(1 lt.eq \| x \| lt.eq n \/ 4) \| x \|^(- 2)$. All the displayed error terms, and the tails outside this range, sum to $O \( v^(- 1) \)$. For $j_1$ the infinite summand decays as $\| x \|^(- 6)$ and its differentiated comparison errors are summable. Consequently

#[#set math.equation(numbering: n => "(6.11)")
 $ j_0 = j_0^oo - frac(2 log n, pi^2 v) + O \( v^(- 1) \) \, #h(2em) j_1 = j_1^oo + O \( v^(- 1) \) . $ <cal:j-asymptotic>]

Volume terms cancel in the doubling operation. Substituting (6.11) into (6.3), (6.8) gives

#[#set math.equation(numbering: n => "(6.12)")
 $ A_(upright(d)) \( n \) & = - frac(3 D \( D - 1 \), 4 pi) log n + O \( 1 \) \,\
Z_(2 \, upright(d)) \( n \) + frac(A_(upright(d)) \( n \)^2, 2 D_0) & = - D_0 frac(D - 1, 4 pi^2) log n + O \( 1 \) . $ <cal:direct1>]

There is an instructive cancellation in the second formula. Write $G' = G_(2 n) \( 0 \)$. The quadratic Green terms reduce to $D \( D - 1 \)^2 \( G - G' \)^2 \/ 3$, which is bounded. The cross term in $A_(upright(d))^2 \/ \( 2 D_0 \)$ cancels the linear Green term in $Z_(2 \, upright(d))$. Thus the only unbounded term is the finite-size correction to $j_0$.

=== 6.3 Computing the same coefficients after blocking <computing-the-same-coefficients-after-blocking>

We now set $D = 3$. Choose a fixed sufficiently large dyadic $m$ and put $n = m L^s$. Insert $s$ normalized observation kernels at parameters $beta_h = beta + B_h + C_h \/ beta$, on both the $n$ and $2 n$ tori. Pin one spin on the last layer to remove global rotation. For each fixed $s$ this is a finite-dimensional integral with the same partition function up to a coupling-independent constant. Here $beta$ tends to infinity at fixed $s$; the calculation does not require an admitted trajectory in the reference bands $\[ H_j \/ 2 \, 2 H_j \]$. Its aligned saddle is unique after pinning, with strictly positive transverse quadratic form. All other configurations have a positive action excess: zero microscopic energy forces alignment, and zero observation energy propagates that alignment through every layer, including the fallback branch of the observation.

Successive Gaussian completion and Wick integration compute exactly the same finite Taylor coefficients as direct Laplace expansion. These are the canonical prescriptions of Lemma 12. Replacing the next formal parameter by $beta + B_(h + 1) + C_(h + 1) \/ beta$ changes the kinetic coefficient only by $O_s \( beta^(- 2) \)$; its two angular factors put that change beyond the field order in question. Scalar powers are still retained at their specified order.

We justify the uniform error needed in comparing coefficients as $s$ varies. At a step whose output period is $macron(m) = m L^(s - h - 1)$, a finite-period coefficient differs from its folded bulk value only if the complete contraction paths travel a distance at least $c macron(m)$. Analytic coefficient norms therefore bound this discrepancy by $C_L e^(- c macron(m))$ per anchor. A previously introduced discrepancy of size $delta$ in the ordinary coefficients grows by at most $C_L$ in one formal step: there are at most four fluctuation orders, and all the coefficient and covariance sums are absolutely summable. There is no need to impose an affine cancellation on this discrepancy. Earlier periods are larger by successive factors $L$, so

$ sum_(r gt.eq 0) C_L^(r + 1) e^(- c m L^r) < oo . $

The same sum with any fixed polynomial in $r$ and $m L^r$ is finite. The period factor pays for the sum over anchors, including scalar Wick contractions. The depth factor also pays for reexpressing their inverse-coupling powers in terms of $beta_s$, since $\| B_s - B_h \| lt.eq C_L \( s - h \)$. Thus both inverse-coupling coefficients of the propagated winding contributions are bounded uniformly in $s$.

At the final fixed period $m$, the pinned Gaussian and canonical coefficients are bounded uniformly in $s$. All bulk scalar powers at earlier stages are proportional to volume and cancel in the doubling operation. The remaining Gaussian pinning power is $D_0 log beta_s$: the powers on periods $m$ and $2 m$ are respectively $- D \( m^2 - 1 \) \/ 2$ and $- D \( 4 m^2 - 1 \) \/ 2$, whose doubling difference is $D_0$. The blocked expansion consequently has the form

$ Delta_beta \( m L^s \) = D_0 log beta_s + cal(C)_s + X_s / beta_s + Y_s / beta_s^2 + O_s \( beta_s^(- 3) \) \,\
\| X_s \| + \| Y_s \| lt.eq C_(L \, m) . $

Here $cal(C)_s$ is independent of $beta$, and $X_s \, Y_s$ include the final fixed-period coefficients and all propagated winding terms. Their bounds are uniform in $s$; the displayed remainder is a fixed-$s$ Laplace remainder. Substituting $beta_s = beta + B_s + C_s \/ beta$ and comparing coefficients gives

#[#set math.equation(numbering: n => "(6.13)")
 $ A_(upright(d)) \( m L^s \) & = D_0 B_s + X_s \,\
Z_(2 \, upright(d)) \( m L^s \) & = D_0 \( C_s - B_s^2 \/ 2 \) - B_s X_s + Y_s . $ <cal:block1>]

Equations (6.12), (6.13) prove the first part of (6.1). Adding $A_(upright(d))^2 \/ \( 2 D_0 \)$ in (6.13) cancels both $B_s^2$ and $B_s X_s$; then (6.12) proves its second part.

The triangular contraction of the canonical coefficients, with the forcing $O \( L^(- h) \)$ from the free kernels, gives exponential convergence of each kick. The bounded cumulative formulas (6.1) identify their limits, proving (6.1) and the theorem. Notice that no uniform bare Laplace remainder was used.

=== 6.4 Length as a function of the bare coupling <length-as-a-function-of-the-bare-coupling>

For later use we record the consequence for the exact trajectories.

#thm([Proposition 6.2.])[
  #emph[For every admitted nearest-neighbor trajectory of length $N$, starting with zero canonical interactions, whose terminal coupling belongs to a fixed compact interval $I_H$ about a sufficiently large $H$, its initial coupling $beta$ satisfies 
#[#set math.equation(numbering: n => "(6.14)")
 $ N log L = pi beta - 1 / 2 log beta + O_(L \, H) \( 1 \) . $ <eq:calibration>]

 In particular $L^(- N)$ is bounded above and below by positive fixed multiples of $sqrt(beta) e^(- pi beta)$.]
] <prop:calibration>

#proof[
  Index the successive actual couplings by $beta_h$, $0 lt.eq h lt.eq N$. Theorem 5.1 and (6.1) give
  $ beta_(h + 1) = beta_h - gamma - nu \/ beta_h + r_h + e_h \, quad nu = gamma \/ \( 2 pi \) \, quad \| r_h \| lt.eq C_L beta_h^(- 1 - epsilon.alt) \, quad sum_h \| e_h \| lt.eq C_L $
  for some $epsilon.alt > 0$. Increase $H$ so that $\| r_h \| lt.eq gamma \/ 2$. For
  $ Phi \( b \) = b \/ gamma - \( nu \/ gamma^2 \) log b $
  Taylor’s formula gives
  $ Phi \( beta_(h + 1) \) - Phi \( beta_h \) = - 1 + O_L \( beta_h^(- 1 - epsilon.alt') \) + O_L \( \| e_h \| \) \, #h(2em) epsilon.alt' = min \( epsilon.alt \, 1 \) > 0 . $
  The two terms of order $beta_h^(- 1)$ cancel. The errors are summable uniformly in $N$. Indeed, summing the raw drift between indices $i < j$ gives $beta_i - beta_j gt.eq gamma \( j - i \) \/ 2 - C_L$. Thus a unit interval of couplings can be visited only a bounded number of times: apply this inequality to its first and last visits. Summation over unit intervals now bounds $sum_h beta_h^(- 1 - epsilon.alt')$. Telescoping $Phi$ and using the fixed terminal interval proves (6.14). ◻
]

== 7 Admission and terminal-coupling matching <sec:trajectories>

The exact map provides a stable class of densities. We now select trajectories that stay in this class and reach a prescribed terminal kinetic coupling. The coefficient calculation in Section 6 is the input that fixes their depth; terminal matching will then compare their full endpoint data.

=== 7.1 Initialization and admitted trajectories <rg:trajectories>

Here $j$ counts remaining layers: $b_N$ is the bare coupling and $b_0$ is terminal. The chronological free-history index is $h = N - j$, as in the coefficient calibration and the introductory drift formula.

At free history zero, the unmasked quadratic energy is the nearest-neighbor energy. Its representation in the class has all seven slots and all regular errors zero. To construct the covering gas, group the true bad bonds into connected components after padding by a fixed multiple of $R_(*) log \( 100 \/ t \)$. Assign every deleted mask row to a bad bond witnessing its deletion, and retain that witness in the component record. The difference between the original energy and the clipped energy is nonnegative. Each bad bond supplies at least $c b r_e^2 gt.eq c p^2$ to this difference. The remaining deleted rows are nonnegative squares. The weight of a component is the exponential of minus its assigned difference, with the indicators recording its exact bad-bond inventory. These components have disjoint padded supports, or are joined when their supports meet. Their product therefore gives exactly the original density.

Connected positioning and padding cost at most $exp \( C s log M \)$ for a record of load $s$. The retained $p^2$ reserve dominates this count and $e^(A s)$ by (5.42), proving the initial covering cap. The initial weights are continuous in the precise bare coupling: their geometric predicates use the fixed reference parameters $H_j \, t_j \, frak(m)_j$, so only the exponential energy factors vary. The retained reserve makes this continuity uniform in the covering norm on each admitted coupling interval. For two nearby inputs with the same free history, the comparison estimates (5.12)–(5.12) have $epsilon.alt_h = 0$ and preserve continuity of both the shape data and the extracted coupling. Induction therefore gives a continuous terminal-coupling map on every finite sequence of strictly admitted inputs. This is the continuity used in the shooting argument below.

Write $alpha_h \, kappa_h$ for the kicks on the canonical orbit started from zero. Theorem 14, proved in Section 6, gives

#[#set math.equation(numbering: n => "(7.1)")
 $ alpha_h = - gamma + O_L \( rho_c^h \) \, #h(2em) kappa_h = - frac(gamma, 2 pi) + O_L \( rho_c^h \) \, #h(2em) 0 < rho_c < 1 . $ <rg:calibrated-kicks>]

The regular error $Delta$ is not used in that formal calculation. It is bounded for the actual trajectory by Theorem 5.1.

#thm([Proposition 7.1.])[
  (Admission and shooting).  #emph[Fix $L \, P_0 \, H$ as above, increasing $H$ if necessary, and put $I_H = \[ .9 H \, 1.1 H \]$. Every sufficiently large prescribed bare coupling $b$ has a depth $N$ for which the nearest-neighbor trajectory remains in all its admitted bands and ends at a coupling in $I_H$. Conversely, for every $N gt.eq 1$ and every $h_0 in I_H$ there is a bare coupling $b_N \( h_0 \)$ whose admitted trajectory of depth $N$ ends exactly at $h_0$.]
  #emph[For each of these trajectories, uniformly in its depth and terminal value, 
#[#set math.equation(numbering: n => "(7.2)")
 $ N log L = pi b - 1 / 2 log b + O_(L \, H) \( 1 \) \, #h(2em) L^N asymp_(L \, H) b^(- 1 \/ 2) e^(pi b) . $ <rg:scale-calibration>]

 No uniqueness of the shooting value is asserted or needed.]
] <rg:admission>

#proof[
  Set $c_log = 1 \/ \( 2 pi \)$ and define
  $ theta.alt_j = H_j + c_log log \( H_j \/ H \) . $
  It obeys
  $ theta.alt_j - theta.alt_(j - 1) = gamma + frac(gamma, 2 pi H_j) + O_L \( H_j^(- 2) \) . $
  Choose $N$ so that $\| b - theta.alt_N \| lt.eq C_L$, and run the exact map only until its first possible exit. Put $D_j = b_j - theta.alt_j$. Sum (5.11) and (7.1) along an admitted initial segment. The exponential kick errors have bounded total sum, as does $sum_j H_j^(- 1.05)$ at fixed $L \, H$. The denominator difference is bounded by
  $ \| b_j^(- 1) - H_j^(- 1) \| lt.eq C { log \( 2 + H_j \/ H \) + \| D_j \| } \/ H_j^2 . $
  Consequently, including a first candidate output position,
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| D_j \| lt.eq C_L + C_L sum_(r = j + 1)^N frac(log \( 2 + H_r \/ H \) + \| D_r \|, H_r^2) . $ <rg:first-exit-bound>]
  The constant can be chosen bounded as $H$ is increased. Both coefficient sums on the right are $O_L \( H^(- 1) \)$. Taking a maximum and then increasing $H$ gives $\| D_j \| lt.eq 2 C_L$ on this entire segment. Also $sup_(x gt.eq H) log \( x \/ H \) \/ x = 1 \/ \( e H \)$. Thus $theta.alt_j + \[ - 2 C_L \, 2 C_L \]$ lies strictly inside $\[ H_j \/ 2 \, 2 H_j \]$ for every $j$, and its value at $j = 0$ lies in $I_H$. A first exit is impossible. This proves the assertion for prescribed $b$.
  For exact shooting, vary the initial value in $\[ .6 H_N \, 1.4 H_N \]$. On every admitted segment from layer $k$ to layer $j < k$, the same equations, using only $b_r gt.eq H_r \/ 2$, give
  #[#set math.equation(numbering: n => "(7.4)")
   $ \| \( b_j - H_j \) - \( b_k - H_k \) \| lt.eq C_L + C_L \( k - j \) \/ H . $ <rg:barrier-bound>]
  Call a value high if a strictly admitted initial segment reaches $b_k > 1.25 H_k$, or if its strictly admitted full run ends above $h_0$. Define low with $b_k < .75 H_k$ or a terminal value below $h_0$. These classes are open by continuity. They are nonempty because they contain respectively the upper and lower endpoints of the initial interval.
  They are disjoint. Indeed an upper mark and a lower mark would make the left side of (7.4) at least $\( H_j + H_k \) \/ 4$, while its right side is $C_L + C_L \( k - j \) \/ H$. For large $H$, the former exceeds the latter, since $H_k - H_j = gamma \( k - j \)$. An upper mark and a terminal value at most $h_0$ instead give a lower bound $H_k \/ 4 - .1 H$; the same comparison rules this out. The argument with lower marks is identical.
  A connected interval cannot be the union of two nonempty disjoint open subsets. An initial value outside both classes cannot leave an admitted band: every step changes the coupling by at most $C_L$, and $H$ is large enough that a first exit must have been preceded by one of the strict internal marks. It therefore reaches layer zero, and its terminal value is neither above nor below $h_0$. This is the required shot.
  For a shot, $D_0 = h_0 - H = O \( H \)$. Sum the same difference equation backwards from layer zero. The sums of the inhomogeneous errors are bounded and $sum_r H_r^(- 2) = O_L \( H^(- 1) \)$. Taking the maximum on any finite run absorbs its coefficient and yields $D_j = O_(L \, H) \( 1 \)$ uniformly in $j \, N$. For either construction,
  $ b = H + gamma N + frac(1, 2 pi) log \( \( H + gamma N \) \/ H \) + O_(L \, H) \( 1 \) . $
  The difference between $log \( H + gamma N \)$ and $log b$ is bounded, and tends to zero as $N$ grows. Multiplying by $pi$ gives (7.2). ◻
]

=== 7.2 Matching at a common terminal coupling <rg:terminal>

Figure 2 displays the two boundary conditions used in the following comparison.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.7), [#text(size: 9pt)[depth $N$]], anchor: "east", padding: 0.1176cm)
  content((1, 1.7), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$beta_N(h_0)$]]])])
  line((1.9, 1.7), (3.55, 1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2.7, 1.75), [#text(size: 9pt)[$N-K$#linebreak()steps]], anchor: "south", padding: 0.1176cm)
  content((4.15, 1.7), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$b_K^((N))$]]])])
  line((4.85, 1.7), (8.05, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((6.45, 1.78), [#text(size: 9pt)[last $K$ steps]], anchor: "south", padding: 0.1176cm)
  content((8.5, 1.7), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$h_0$]]])])
  content((0, 0), [#text(size: 9pt)[depth $K$]], anchor: "east", padding: 0.1176cm)
  content((4.15, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$beta_K(h_0)$]]])])
  line((5.05, 0), (8.05, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((6.5, -0.08), [#text(size: 9pt)[$K$ steps]], anchor: "north", padding: 0.1176cm)
  content((8.5, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$h_0$]]])])
  line((4.15, 0.4), (4.15, 1.3), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((3.9, 0.85), [#text(size: 9pt)[bounded initial#linebreak()shape discrepancy]], anchor: "east", padding: 0.1176cm)
  line((8.5, 0.4), (8.5, 1.3), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.75, 0.85), [#text(size: 9pt)[same terminal#linebreak()kinetic coupling]], anchor: "west", padding: 0.1176cm)
  content((6.2, -1.15), [#text(size: 9pt)[forward contraction of shape data + terminal coupling condition#linebreak() $arrow.r.double.long$ endpoint interaction discrepancy per anchor $lt.eq C_H e^(-d_H K)$]])
})],
  caption: [Figure 2: The comparison aligns the last $K$ blocking steps of two admitted trajectories with $N gt.eq K$. Here $b_K^(\( N \))$ is the longer trajectory’s coupling after its first $N - K$ steps. Their kinetic couplings agree at the terminal scale. Their complete endpoint laws need not agree: contraction bounds the discrepancy in their local interaction data, while bulk scalars are tracked separately. The bound is uniform in the number $N - K$ of earlier steps. ],
) <fig:matched-trajectories>

#thm([Theorem 7.2.])[
  (Matched endpoint densities).  #emph[ Let $N gt.eq K gt.eq 1$, and choose any two admitted nearest-neighbor trajectories of these depths with the same terminal coupling $h_0 in I_H$. On every common admitted terminal period $m$, write their exact endpoint densities as 
$ rho_r \( V \) = e^(v_r m^2) e^(X_r \( V \)) Xi_r \( V \) \, #h(2em) r = N \, K \, $

 using common compatible label lists. The numbers $v_r$ are independent of $m$. There are constants $C_H \, d_H > 0$, independent of $N \, K \, h_0 \, m$, such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ parallel X_N - X_K parallel_oo & lt.eq C_H m^2 e^(- d_H K) \,\
sup_x sum_(ell : x in P_ell) e^(A s_ell) parallel k_(N \, ell) - k_(K \, ell) parallel_oo & lt.eq C_H e^(- d_H K) . $ <rg:terminal-difference>]

 All the endpoint class bounds hold uniformly. In particular, with $t = t_0$, the canonical part of $- X_r$ is bounded by $C_L m^2 \( H t^4 + t^2 \)$ and its error part by $m^2 H^(- 2.05)$. Every covering support has a connected hull of at most $R_H s_ell$ sites. Changing a set $B$ of endpoint spins changes $X_r$ by at most $D_H \| B \|$. The constants $R_H \, D_H$ can be chosen polynomial in $H$.]
] <rg:matching>

#proof[
  Compare the last $K$ layers, indexed by $j = K \, dots.h \, 0$. At their common upper layer both shape data are within the fixed caps, so $u_K lt.eq C$. Their free histories differ; the shallower one at layer $j$ is $K - j$, giving $epsilon.alt_j lt.eq L^(- \( K - j \))$. Their couplings agree at the opposite end: $lambda_0 = 0$.
  Set $eta = C_L H^(- b_(*))$, enlarging its constant if necessary, and $f_j = C_L H_j^C L^(- \( K - j \))$. The step inequalities imply
  $ u_(j - 1) lt.eq q u_j + eta \| lambda_j \| + f_j \, #h(2em) \| lambda_j \| lt.eq a \| lambda_(j - 1) \| + a C_L u_j + a f_j \, quad a = \( 1 - eta \)^(- 1) . $
  Choose $rho$ with $max \( q \, L^(- 1) \) < rho < 1$, and then increase $H$ until $a rho < 1$. Put $w_j = rho^(K - j)$, $U = max_(0 lt.eq j lt.eq K) u_j \/ w_j$, and $W = max_(0 lt.eq j lt.eq K) \| lambda_j \| \/ w_j$. For $F_K = C_(L \, H) \( 1 + K \)^C$ we have $f_j lt.eq F_K w_j$. Iterating the first inequality from $K$ and the second from $0$ gives
  $ U lt.eq u_K + frac(eta W + F_K, rho - q) \, #h(2em) W lt.eq frac(a \( C_L U + F_K \), 1 - a rho) . $
  Choose $H$ so that the product of the two coefficients linking $U$ and $W$ is less than $1 \/ 2$. It follows that
  #[#set math.equation(numbering: n => "(7.6)")
   $ u_j + \| lambda_j \| lt.eq C_(L \, H) \( 1 + K \)^C rho^(K - j) . $ <rg:two-end-bound>]
  This argument requires neither a bound on the ratio of the two bare couplings nor uniqueness of either shot.
  At $j = 0$ the shape estimate and the free-history error $O \( L^(- K) \)$ give the covering estimate in (7.5). They also bound the regular negative-log difference per anchor, including the difference of the clipped kinetic kernels; their displayed couplings are equal. Summing over $m^2$ anchors gives the first estimate. A fixed polynomial in $K$ is absorbed by decreasing the positive exponential rate. Uniformity in $h_0$ follows from its compact admitted interval and the same constants in the step estimates.
  At each step only a bulk scalar was extracted. The number of sites at layer $j$ is $m^2 L^(2 j)$, so the sum of all extracted scalars is exactly $v_r m^2$ with $v_r$ independent of $m$. All period discrepancies were kept in the winding lists.
  The remaining statements follow directly from the class norms at $j = 0$. On a canonical graph, $\| y_o \( x \) \| lt.eq C t$ times its path length; the exponential coefficient norm sums the resulting fixed powers, giving $C_L \( H t^4 + t^2 \)$ per anchor. The error bound is its cap. The complete record gives a hull of $O \( frak(m)_0^2 s_ell \)$ sites. For a local change of spins, sum only terms whose complete support meets the changed set, charging each term to one such site. Conversion from anchored to support-hit sums costs fixed position moments, and all test neighborhoods have polynomial size in $H$. The kinetic terms and their mask tests obey the same bound by the free exponential moments. This gives $D_H$ polynomial in $H$. ◻
]

The endpoint densities in this theorem are strictly positive: they are repeated integrals of the positive microscopic density against the strictly positive kernel (5.2). More quantitatively, changing $B$ endpoint spins changes the logarithm of the true endpoint density by at most $C_L H \| B \|$. For each fixed input the last observation densities have this ratio bound, since their coupling is in a fixed band of order $H$ and chord lengths on $S^3$ are bounded. Integrating their ratio inequality against the positive preceding-layer measure preserves it. This positivity statement concerns the complete density; the individual covering weights remain allowed to have either sign.

== 8 Relative comparison of the retained densities <cmp:section>

Closeness of the coefficients in an effective action does not by itself compare the corresponding partition functions. The difficulty here is quite specific. A retained density contains a signed covering sum, and this sum can be small on configurations with many rough bonds. Its absolute difference is then an inadequate estimate for its relative difference.

We prove the relative estimate by combining two facts. Rough bonds are rare under each of the two positive measures. On the remaining configurations, a local modification removes rough clusters at a controlled cost. An exact inclusion–exclusion identity then turns the signed comparison into a convergent sum of trees. Positivity will be used for complete densities and complete covering sums, never for a restricted signed sum.

=== 8.1 The finite-volume comparison problem <the-finite-volume-comparison-problem>

Let

$ Lambda_M = \( bb(Z) \/ M bb(Z) \)^2 \, #h(2em) v = \| Lambda_M \| = M^2 \, #h(2em) q in \( S^3 \)^(Lambda_M) \, $

where $M$ is dyadic. Write $thin upright(d) q$ for product normalized Haar measure, $r_e = \| q_x - q_y \|$ for $e = chevron.l x y chevron.r$, and

$ D \( q \) = { e : r_e > t_H } . $

The large parameter $H$ is the inverse coupling at the retained scale. It is fixed throughout a comparison. In the application,

$ t_H = H^(- 1 \/ 2) p_H \, #h(2em) p_H = \( log H \)^(P_0) \, $

with the fixed exponent $P_0$ chosen in the renormalization construction.

#prodef([Definition 8.1.])[
  (A mandatory covering sum).  A label $lambda$ consists of a finite site support $P_lambda$, a load $s_lambda gt.eq 1$, and a fixed nonempty inventory $J_lambda$ of bonds whose endpoints belong to $P_lambda$. Its weight $k_lambda \( q \)$ is a bounded measurable function of $q \|_(P_lambda)$; every eligibility indicator is included in this function. In particular $k_lambda \( q \) = 0$ unless $J_lambda subset D \( q \)$. The support contains every spin read by the function or by an eligibility test, including a test asserting the absence of a flag.
  A family is compatible when its supports are pairwise disjoint. The mandatory covering sum is
  #[#set math.equation(numbering: n => "(8.1)")
   $ Xi \( q \) = sum_(Gamma med upright("compatible")\
union.sq.big_(lambda in Gamma) J_lambda = D \( q \)) product_(lambda in Gamma) k_lambda \( q \) . $ <cmp:cover>]
  The empty family has weight one. Since inventories are nonempty, $Xi \( q \) = 1$ when $D \( q \) = diameter$.
] <cmp:cover-definition>

The word mandatory refers to the equality of inventories in (8.1). In particular, $Xi$ is not the partition function of an optional dilute gas.

Consider two pointwise positive densities

#[#set math.equation(numbering: n => "(8.2)")
 $ rho_i \( q \) = e^(X_i \( q \)) Xi_i \( q \) > 0 \, #h(2em) Z_i = integral rho_i \( q \) thin thin upright(d) q \, #h(2em) thin upright(d) mu_i = Z_i^(- 1) rho_i thin thin upright(d) q \, quad i = 1 \, 2 . $ <cmp:densities>]

Use a common countable label set, putting unused weights equal to zero. The functions in (8.2) are the pointwise versions provided by the exact blocking identity.

Here are the precise data needed for comparison. A quantity described as polynomial in $H$ is bounded by $C H^a$, with $C \, a$ fixed independently of the period and the cutoff depths.

+ Each $P_lambda$ is contained in a connected lattice graph with at most $R_H s_lambda$ vertices, where $R_H$ is polynomial in $H$. For a fixed $A gt.eq 16$,
  #[#set math.equation(numbering: n => "(8.3)")
   $ sup_x sum_(lambda : x in P_lambda) e^(A s_lambda) parallel k_(i \, lambda) parallel_oo & lt.eq w_H \,\
sup_x sum_(lambda : x in P_lambda) e^(A s_lambda) parallel k_(2 \, lambda) - k_(1 \, lambda) parallel_oo & lt.eq D_H delta_K . $ <cmp:activity>]
  Here $w_H$ decreases faster than every inverse power of $H$; $D_H < oo$ is independent of the period and the cutoff depths.
+ If $q \, tilde(q)$ differ at $n$ sites, then
  #[#set math.equation(numbering: n => "(8.4)")
   $ \| log rho_i \( q \) - log rho_i \( tilde(q) \) \| & lt.eq B_(rho \, H) n \,\
\| X_i \( q \) - X_i \( tilde(q) \) \| & lt.eq B_(X \, H) n \, $ <cmp:density-finite-energy>]
  where $B_(rho \, H) \, B_(X \, H)$ are polynomial in $H$. Moreover
  #[#set math.equation(numbering: n => "(8.5)")
   $ parallel X_2 - X_1 parallel_oo lt.eq D_H v delta_K . $ <cmp:exponent-difference>]
+ For some $c_(*) > 0$ independent of $H$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ X_i \( q \) lt.eq epsilon.alt_H v - c_(*) H sum_e min \( r_e^2 \, t_H^2 \) \, #h(2em) epsilon.alt_H = o \( H t_H^2 \) . $ <cmp:stability>]
  On the cap
  $ cal(C)_H = { q : \| q_x - upright(bold(1)) \| lt.eq c H^(- 1 \/ 2) upright(" for every ") x } \, $
  one has $D \( q \) = diameter$ and
  #[#set math.equation(numbering: n => "(8.7)")
   $ X_i \( q \) gt.eq - epsilon.alt'_H v \, #h(2em) epsilon.alt'_H = o \( H t_H^2 \) . $ <cmp:cap>]
+ Both positive measures are translation invariant and reflection positive at the axis seams used to reflect lattice tiles. The reflection prescriptions are compatible with the tile events below. Finally,
  $ t_H arrow.r 0 \, #h(2em) t_H^(- 1) lt.eq "poly" \( H \) \, #h(2em) frac(H t_H^2, \( log H \)^2) arrow.r oo . $ <cmp:thresholds>

All comparisons below are uniform over families satisfying these data. The last subsection verifies the data for the retained densities of Theorem 5.1.

#thm([Theorem 8.2.])[
  (Relative comparison).  #emph[Suppose (C1)–(C4) hold and $delta_K lt.eq C_H e^(- gamma_H K)$, where $gamma_H > 0$. Fix $0 < zeta_H < gamma_H \/ 2$. For every sufficiently large fixed $H$ there are constants $M_H \, C_H \, a_H > 0$ such that, whenever $M gt.eq M_H$, there is a common measurable set $G = G_(H \, K \, M)$ satisfying 
#[#set math.equation(numbering: n => "(8.8)")
 $ mu_i \( G^c \) & lt.eq C_H M^2 e^(- a_H K) \, #h(2em) i = 1 \, 2 \,\
lr(|frac(Xi_2 \( q \), Xi_1 \( q \)) - 1|) & lt.eq exp #h(-0.16667em) (C_H M^2 delta_K e^(zeta_H K)) - 1 \, #h(2em) q in G . $ <cmp:bad-probability>]

 The same estimate holds after interchanging $1$ and $2$. Thus 
#[#set math.equation(numbering: n => "(8.9)")
 $ lr(|log frac(rho_2 \( q \), rho_1 \( q \))|) lt.eq C_H M^2 delta_K e^(zeta_H K) \, #h(2em) q in G . $ <cmp:relative-density>]

 There are also $c_H \, d_H > 0$ and $K_H < oo$ such that 
#[#set math.equation(numbering: n => "(8.10)")
 $ lr(|log Z_2 / Z_1|) lt.eq C_H e^(- d_H K) quad upright("if") quad K gt.eq K_H \, #h(2em) M_H lt.eq M \, #h(2em) M^2 lt.eq e^(c_H K) . $ <cmp:partition-conclusion>]

]
] <thm:relative-comparison>

=== 8.2 A joint rough-bond estimate under each positive law <a-joint-rough-bond-estimate-under-each-positive-law>

Choose a fixed constant $C_1$, to be enlarged in the geometric construction, and define the wider set of flagged bonds

#[#set math.equation(numbering: n => "(8.11)")
 $ hat(D) \( q \) = { e : r_e > t_H \/ C_1 } . $ <cmp:wider-flags>]

The distinction between $D$ and $hat(D)$ leaves room to modify a configuration near its true rough bonds.

#thm([Lemma 8.3.])[
  (Joint rarity).  #emph[For sufficiently large $H$, there is $sigma_H = c H t_H^2$, with $c > 0$ fixed after $C_1$, such that 
#[#set math.equation(numbering: n => "(8.12)")
 $ mu_i { J subset hat(D) } lt.eq e^(- sigma_H \| J \|) $ <cmp:joint-rarity>]

 for every set $J$ of distinct bonds and $i = 1 \, 2$.]
] <cmp:rarity>

#proof[
  Dropping the coverage and compatibility constraints only in an absolute upper bound gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ \| Xi_i \( q \) \| lt.eq product_lambda \( 1 + parallel k_(i \, lambda) parallel_oo \) lt.eq exp #h(-0.16667em) (sum_lambda parallel k_(i \, lambda) parallel_oo) lt.eq e^(v w_H) . $ <cmp:absolute-cover>]
  All these sums converge by (8.3). On $cal(C)_H$ the covering sum is exactly one. A cap of radius $c H^(- 1 \/ 2)$ on $S^3$ has Haar measure at least $c' H^(- 3 \/ 2)$. Consequently
  #[#set math.equation(numbering: n => "(8.14)")
   $ Z_i gt.eq exp \[ - v \( epsilon.alt'_H + C + 3 / 2 log H \) \] . $ <cmp:denominator-cap>]
  Place one specified flagged-bond event inside a $2$-by-$2$ tile, and reflect it into every tile. The fully disseminated event requires at least $c v$ distinct flagged bonds. On this event, $sum_e min \( r_e^2 \, t_H^2 \) gt.eq c' v t_H^2$. Equations (8.6), (8.13), and (8.14) therefore imply
  #[#set math.equation(numbering: n => "(8.15)")
   $ mu_i \( upright("fully disseminated event") \) lt.eq exp { - v \[ c'' H t_H^2 - epsilon.alt_H - epsilon.alt'_H - w_H - C log H \] } lt.eq e^(- c''' v H t_H^2) . $ <cmp:disseminated>]
  This is the classical chessboard estimate #cite(label("FILS78")) Theorems 4.1–4.3. To display the reflection hypotheses used here, we include the following form of successive Cauchy–Schwarz. If $f_z$ are nonnegative tile tests and $theta_z f_z$ denotes their reflected placement in tile $z$, then
  $ mu_i #h(-0.16667em) (product_z theta_z f_z) lt.eq product_z mu_i #h(-0.16667em) (product_y theta_y f_z)^(1 \/ N_(upright("tile"))) . $
  At one seam, reflection positivity applies Cauchy–Schwarz to the two half-torus functions. It replaces them by their two reflected duplicates and gives exponent $1 \/ 2$ to each. Repeat in each direction, bisecting the dyadic array of tiles. After all bisections a chosen tile test has been reflected into every tile and has exponent $1 \/ N_(upright("tile"))$, which is the displayed inequality.
  Partition $J$ into finitely many orientation, parity, and tile-origin classes. One class contains at least a fixed fraction of its bonds, with at most one specified test per tile. Use the displayed inequality with this test on those tiles and $1$ elsewhere. Applying (8.15) proves (8.12), after reducing the constant in $sigma_H$. This proof is performed separately for each $mu_i$; it does not compare their normalizing constants. ◻
]

=== 8.3 Removing a rough cluster <removing-a-rough-cluster>

We first record the target-space fact used in the modification.

#thm([Lemma 8.4.])[
  (Quantitative filling on $S^3$).  #emph[An $L_0$-Lipschitz map from the boundary of the unit square to $S^3$ has an extension to the square with Lipschitz constant at most $C \( 1 + L_0 \)^(3 \/ 2)$. The extension can be chosen measurably as a function of the boundary map.]
] <cmp:filling>

#proof[
  Parameterize the boundary by a circle using a fixed bi-Lipschitz map and write its image as $g \( theta \)$. Its antipodal curve can be covered by $C \( 1 + L_0 \/ eta \)$ balls of radius $2 eta$. The total Haar volume of these balls is at most $C \( eta^3 + L_0 eta^2 \)$. With $eta = c \( 1 + L_0 \)^(- 1 \/ 2)$, this is smaller than the volume of $S^3$. Choose $p in S^3$ at distance at least $c eta$ from the antipodal curve. Then
  $ F \( r \, theta \) = frac(\( 1 - r \) p + r g \( theta \), \| \( 1 - r \) p + r g \( theta \) \|) \, #h(2em) 0 lt.eq r lt.eq 1 \, $
  is well defined. Indeed its denominator is bounded below by $c eta$. The radial derivative is $O \( eta^(- 1) \)$, and its angular derivative is $O \( r L_0 eta^(- 1) \)$. In disk coordinates these imply the claimed bound. A fixed bi-Lipschitz map between disk and square changes only the constant.
  To make the choice measurable, fix a sufficiently fine finite net of possible $p$’s and take the first one separated from the antipodal curve by the smaller prescribed distance. The volume argument with slightly larger avoidance balls guarantees such a net point. ◻
]

#thm([Lemma 8.5.])[
  (Disjoint editable regions).  #emph[For fixed sufficiently large constants $C_2 \, C_1$, in that order, and $M gt.eq M_H$, each configuration has a finite family of disjoint editable site sets $E_C$, with nonempty fixed inventories $D_C subset D \( q \)$, such that 
$ D \( q \) = union.sq.big_C D_C . $

 If $n_C$ is the number of original flagged bonds assigned to this region, then $n_C gt.eq 1$, the assigned flagged sets are disjoint, and 
#[#set math.equation(numbering: n => "(8.16)")
 $ \| E_C \| lt.eq R_(E \, H) n_C \, #h(2em) E_C upright(" has a connected hull of at most ") R_(E \, H) n_C upright(" sites") \, #h(2em) R_(E \, H) lt.eq C t_H^(- 2) . $ <cmp:edit-size>]

 One can replace the spins in any selected $E_C$, leaving all other spins and the region’s outer boundary unchanged, so that every true rough bond of $D_C$ disappears and no true rough bond is created. All choices can be made measurably.]
] <cmp:editing>

#proof[
  Partition each coordinate circle into integer intervals of lengths between $ell = ceil.l C_2 \/ t_H ceil.r$ and $2 ell$. This is possible once $M$ exceeds a fixed multiple of $ell$. Use the resulting rectangular mesh. Mark every box meeting a bond of $hat(D)$. Take the union of their closed two-box neighborhoods, and form components by joining boxes that meet even at a vertex. Distinct components are disjoint closed mesh regions. Keep just the components containing a bond of $D$.
  Let $E_C$ be the lattice sites in one retained region, and let $n_C$ count all originally flagged bonds whose marked boxes generate that region. A flagged bond marks only a bounded number of boxes, and each marked box adds only a bounded number of boxes to its neighborhood. Hence the number of boxes is at most $C n_C$, proving (8.16). The regions have a connected lattice hull with the same bound. Every flagged bond is separated from the boundary of its component by a mesh collar. Thus boundary bonds are unflagged.
  Retain the original spins on all boundary vertices and edges of the region. Interpolate each such edge by short geodesic arcs between successive lattice spins. Its speed in physical lattice coordinates is at most $C t_H \/ C_1$. At every other mesh vertex choose the fixed spin $upright(bold(1))$. On the other mesh sides join the chosen endpoint spins by a fixed measurably selected shortest arc. Use exactly the same arc for the two cells sharing a side.
  After rescaling a cell to the unit square, its boundary map has Lipschitz constant at most $C \( 1 + C_2 \/ C_1 \)$. Apply Lemma 21 in every cell. Choose $C_2$ larger than the resulting fixed filling constant for $C_2 \/ C_1 lt.eq 1$, and then choose $C_1$ large enough. The Lipschitz constant in lattice units is less than $t_H$. Sampling the fillings at lattice sites therefore gives new bond lengths below $t_H$.
  The fillings agree on shared sides. Boundary spins were preserved, so no bond crossing out of a region becomes rough. The construction also treats regions with holes. If a region wraps around the torus, the same shared-side rule is used periodically; if it fills the torus, one may simply replace all its spins by $upright(bold(1))$. ◻
]

Fix the regions and the modified values using the original configuration, once and for all. Write $cal(I)$ for the retained regions and $q \( I \)$, $I subset cal(I)$, for the configuration in which precisely the regions outside $I$ have been modified. Then

#[#set math.equation(numbering: n => "(8.17)")
 $ D \( q \( I \) \) = union.sq.big_(C in I) D_C . $ <cmp:inventory-after-edit>]

The modification need not remove the wider flags at threshold $t_H \/ C_1$. We never recluster a modified configuration; its geometry, its $n_C$’s, and its inventories are those fixed from the original one.

Put $Xi_i \( I \) = Xi_i \( q \( I \) \)$. Since $rho_i > 0$, these are complete positive sums. Equations (8.4) and (8.4) give the crucial denominator estimate:

#[#set math.equation(numbering: n => "(8.18)")
 $ 0 < frac(Xi_i \( I \\ B \), Xi_i \( I \)) lt.eq exp #h(-0.16667em) (C_(3 \, H) sum_(C in B) n_C) \, #h(2em) C_(3 \, H) = \( B_(rho \, H) + B_(X \, H) \) R_(E \, H) . $ <cmp:complete-ratio>]

Indeed $log Xi_i = log rho_i - X_i$, and at most $R_(E \, H) sum_(C in B) n_C$ sites have changed.

=== 8.4 Exact identities for the signed covering sums <exact-identities-for-the-signed-covering-sums>

At a fixed active set $I$, take a full original covering family and join two of its labels whenever their supports meet the same active region $E_C$, $C in I$. Call a connected group a macrolabel $U$, and give it support

#[#set math.equation(numbering: n => "(8.19)")
 $ S_U = union.big_(lambda in U) P_lambda med union med union.big_(C in I :\
E_C ∩ P_lambda eq.not diameter upright(" for some ") lambda in U) E_C . $ <cmp:macro-support>]

Its weight is

$ w_i \( U \; q \( I \) \) = product_(lambda in U) k_(i \, lambda) \( q \( I \) \) . $ <cmp:macro-weight>

Every active region it meets is covered in full by this macrolabel: all labels supplying its inventory meet that region and so belong to the same group. Different macrolabels have disjoint enlarged supports. Conversely, compatible macrolabels covering all active inventories recover exactly the original full covering families.

For a site set $S$ disjoint from the active editable regions, let $Xi_i \( I \; S \)$ be the full-inventory sum restricted to macrolabels whose supports avoid $S$. This restricted sum may have either sign. If $cal(A)$ is a compatible selected macrolabel family, denote its combined support by $S_(cal(A))$, and the active regions it covers by $B_(cal(A))$.

#thm([Lemma 8.6.])[
  (Removal and inclusion–exclusion).  #emph[The background left after selecting $cal(A)$ has total weight 
#[#set math.equation(numbering: n => "(8.20)")
 $ Xi_i \( I \\ B_(cal(A)) \; S_(cal(A)) \) . $ <cmp:background-identity>]

 Consequently 
#[#set math.equation(numbering: n => "(8.21)")
 $ Xi_i \( I \; S \) & = sum_(cal(A) med upright("compatible")\
S_U ∩ S eq.not diameter med forall U in cal(A)) \( - 1 \)^(\| cal(A) \|) [product_(U in cal(A)) w_i \( U \; q \( I \) \)] Xi_i \( I \\ B_(cal(A)) \; S_(cal(A)) \) \,\
Xi_2 \( I \) - Xi_1 \( I \) & = sum_(cal(A) med upright("compatible")\
cal(A) eq.not diameter) [product_(U in cal(A)) #scale(x: 120%, y: 120%)[\(] w_2 \( U \; q \( I \) \) - w_1 \( U \; q \( I \) \) #scale(x: 120%, y: 120%)[\)]] Xi_1 \( I \\ B_(cal(A)) \; S_(cal(A)) \) . $ <cmp:IE>]

 The empty term in (8.21) is $Xi_i \( I \)$.]
] <cmp:removal-identities>

#proof[
  The configurations $q \( I \)$ and $q \( I \\ B_(cal(A)) \)$ differ only inside $S_(cal(A))$. Every remaining weight and every eligibility indicator reads a support avoiding this set, so its value is unchanged. A remaining active region is disjoint from $S_(cal(A))$, by the definition of $B_(cal(A))$. Removing the selected regions therefore does not change the grouping of background labels: background supports avoided these regions already. Its inventory requirement loses exactly the inventories in $B_(cal(A))$. This proves the weight-preserving bijection (8.20).
  In every full covering family, expand the indicator that all its macrolabels avoid $S$ as
  $ product_U #scale(x: 120%, y: 120%)[\(] 1 - upright(bold(1))_({ S_U ∩ S eq.not diameter }) #scale(x: 120%, y: 120%)[\)] . $
  After selecting the factors carrying the minus sign, apply (8.20); this gives (8.21). For (8.21), expand each product using $w_2 = w_1 + \( w_2 - w_1 \)$ and subtract the all-$w_1$ term.
  One may first perform these algebraic manipulations with finite label lists. A full family has at most $\| D \( q \( I \) \) \|$ original labels, and (8.13) provides absolute convergence of all the unnormalized sums. The identities therefore pass to the countable lists. Division by complete sums is performed only after this limit; no positivity of a truncated or restricted sum is required. ◻
]

Introduce the nonnegative envelopes

$ p_lambda = parallel k_(1 \, lambda) parallel_oo + parallel k_(2 \, lambda) parallel_oo \, #h(2em) d_lambda = parallel k_(2 \, lambda) - k_(1 \, lambda) parallel_oo $

and the restricted ratio

$ R_i \( I \, S \) = frac(\| Xi_i \( I \; S \) \|, Xi_i \( I \)) . $

Equations (8.18) and (8.21) give

#[#set math.equation(numbering: n => "(8.22)")
 $ R_i \( I \, S \) lt.eq 1 + sum_(cal(A) eq.not diameter \, med upright("compatible")\
S_U ∩ S eq.not diameter med forall U in cal(A)) [product_(lambda in union.big cal(A)) p_lambda] e^(C_(3 \, H) sum_(C in B_(cal(A))) n_C) R_i \( I \\ B_(cal(A)) \, S_(cal(A)) \) . $ <cmp:ratio-recursion>]

A telescoping of each finite product also gives

#[#set math.equation(numbering: n => "(8.23)")
 $ \| w_2 \( U \) - w_1 \( U \) \| lt.eq sum_(lambda in U) d_lambda product_(kappa in U\
kappa eq.not lambda) p_kappa . $ <cmp:marked-macro>]

Thus (8.21) starts the same recursion with a nonempty first generation and one marked, differenced original label in each of its macrolabels. Every generation consumes at least one active region. The recursion is consequently finite.

=== 8.5 The common exceptional set <the-common-exceptional-set>

Let $C_(4 \, H) > 0$ be a polynomial in $H$, to be fixed in the next subsection. Define $G$ by the following requirement. Take any finite collection of distinct original label nodes and distinct editable-region nodes whose physical supports form a connected intersection graph. Write

$ s = sum_lambda s_lambda \, #h(2em) n = sum_C n_C . $

Whenever $n > 0$, require

#[#set math.equation(numbering: n => "(8.24)")
 $ \( C_(3 \, H) + C_(4 \, H) \) n lt.eq A / 4 s + zeta_H K . $ <cmp:good-set>]

This quantification uses the whole common label set, not just labels eligible at the original configuration. The recursion can evaluate a label at a different $q \( I \)$, and the same geometric inequality must remain available there. All these collections are countable, so $G$ is measurable.

#thm([Lemma 8.7.])[
  (Probability of the exceptional set).  #emph[For every polynomial choice of $C_(4 \, H)$, sufficiently large $H$ admits an $a_H > 0$ such that 
#[#set math.equation(numbering: n => "(8.25)")
 $ mu_i \( G^c \) lt.eq 2 v e^(- a_H K) \, #h(2em) i = 1 \, 2 . $ <cmp:exceptional-bound>]

]
] <cmp:exceptional>

#proof[
  A violation of (8.24) implies
  $ n > frac(zeta_H K, C_(3 \, H) + C_(4 \, H)) \, #h(2em) s < frac(4 \( C_(3 \, H) + C_(4 \, H) \), A) n . $
  The connected hull bounds on labels and editable regions give a connected graph containing these $n$ distinct originally flagged bonds, with at most $B_H n$ vertices and edges, for a polynomial $B_H$. A traversal of this graph visits all the bonds with total length at most $C B_H n$.
  We count the ordered flagged bonds in such a traversal, rather than every intervening lattice step. There are at most $2 v$ choices for the first bond. At distance $ell$, there are at most $C \( ell + 1 \)$ possible next bonds, including their orientations. If $Q lt.eq C B_H n$, the generating identity
  $ sum_(ell gt.eq 0) \( ell + 1 \) z^ell = \( 1 - z \)^(- 2) $
  therefore gives
  $ sum_(ell_1 + dots.h.c + ell_n lt.eq Q) product_(j = 1)^n \( ell_j + 1 \) = binom(Q + 2 n, 2 n) lt.eq \[ C \( 1 + B_H \)^2 \]^n . $
  This also bounds the number of ordered distinct-bond lists; allowing repetitions in the count only increases it. On a torus one may lift the traversal before projecting its recorded bonds, which gives the same upper bound. Thus the number of possible flagged sets forced by a violation is at most
  #[#set math.equation(numbering: n => "(8.26)")
   $ v \[ C \( 1 + B_H \)^2 \]^n . $ <cmp:flag-entropy>]
  This estimate costs $O \( log H \)$ per flag, not $O \( B_H \)$ per flag.
  Set $Q_H = C \( 1 + B_H \)^2 e^(- sigma_H)$. Since $B_H$ is polynomial and $sigma_H = c H t_H^2$, assumption (C4) gives $Q_H < 1 \/ 2$ for large $H$. Lemma 20 and (8.26) imply, under either law,
  $ mu_i \( G^c \) lt.eq v sum_(n > zeta_H K \/ \( C_(3 \, H) + C_(4 \, H) \)) Q_H^n lt.eq 2 v e^(- a_H K) \, #h(2em) a_H = frac(zeta_H log \( 1 \/ Q_H \), C_(3 \, H) + C_(4 \, H)) > 0 . $
  The possibly infinite number of labels adds no factor: every violating collection already forces one of the flagged sets counted above. ◻
]

=== 8.6 A tree bound for the signed recursion <a-tree-bound-for-the-signed-recursion>

We now prove the normalized estimate, including its combinatorial multiplicity.

#thm([Lemma 8.8.])[
  (Normalized covering comparison).  #emph[For a sufficiently large polynomial $C_(4 \, H)$ and sufficiently large $H$, the set $G$ above satisfies 
#[#set math.equation(numbering: n => "(8.27)")
 $ frac(\| Xi_2 \( q \) - Xi_1 \( q \) \|, Xi_1 \( q \)) lt.eq exp \( D_H v delta_K e^(zeta_H K) \) - 1 . $ <cmp:forest-conclusion>]

 The same estimate holds with denominator $Xi_2 \( q \)$.]
] <cmp:forest>

#proof[
  Iterate (8.22) in (8.21), using (8.23). A term is specified by successive nonempty compatible macrolabel families; the recursion ends when the term $1$ is chosen. Every macrolabel after the first generation meets the combined support of the preceding generation.
  Here is a faithful encoding of these terms by forests. Inside each macrolabel choose a spanning tree of its original label nodes and editable-region nodes, using a fixed deterministic ordering to make the choice. For each later macrolabel choose, again deterministically, one support intersection joining it to a macrolabel of the preceding generation. Color an edge according to whether it is internal to a macrolabel or joins two generations. Root each resulting tree at the marked original label in its initial macrolabel.
  No node is repeated. An editable region is consumed the first time it appears. An original label has a fixed nonempty inventory; after it appears, the regions containing that inventory have been removed, so it cannot appear again in an eligible subsequent family. Within one generation supports are disjoint.
  The encoding loses no multiplicity. Contract the internal edges to recover each macrolabel, including its original labels and editable regions. The depth of the resulting vertex in its rooted tree recovers its generation; vertices at the same depth, across all trees, recover the compatible family selected at that stage. The marked roots recover the choices in the product telescoping. Finally, remove the regions in all earlier generations to recover the active set $I$ at that stage and hence the configuration $q \( I \)$ at which every weight was evaluated. These data specify the original recursive term. Thus two different terms cannot produce the same forest with its node labels, marks and two edge colors. No ordering of siblings, or other choice of a recursive history, remains to be counted.
  Each tree is a connected collection of distinct nodes of the kind used in (8.24). Its accumulated denominator factor is therefore bounded by
  #[#set math.equation(numbering: n => "(8.28)")
   $ e^(C_(3 \, H) n) lt.eq e^(zeta_H K) product_(lambda med upright(i n med t h e med t r e e)) e^(A s_lambda \/ 4) product_(C med upright(i n med t h e med t r e e)) e^(- C_(4 \, H) n_C) . $ <cmp:tree-charge>]
  The factor $e^(zeta_H K)$ occurs once per rooted tree.
  To sum the remaining forests, give a gas node size $s_lambda$ and an edit node size $\| E_C \|$. Their unmarked weights are
  $ p_lambda e^(A s_lambda \/ 4) \, #h(2em) e^(- C_(4 \, H) n_C) \, $
  respectively. A marked gas root instead has weight $d_lambda e^(A s_lambda \/ 4)$. Put $R = max \( 1 \, R_H \)$ and choose
  #[#set math.equation(numbering: n => "(8.29)")
   $ C_(4 \, H) gt.eq 2 R_(E \, H) + log \( 16 R \) + 1 . $ <cmp:C4>]
  Since the editable sets are disjoint and $n_C gt.eq 1$,
  #[#set math.equation(numbering: n => "(8.30)")
   $ sup_x sum_(C : x in E_C) e^(- C_(4 \, H) n_C) e^(2 \| E_C \|) lt.eq frac(1, 16 R) . $ <cmp:edit-hit>]
  By (8.3), $A \/ 4 + 2 lt.eq A$, and the rapid decay of $w_H$,
  #[#set math.equation(numbering: n => "(8.31)")
   $ sup_x sum_(lambda : x in P_lambda) p_lambda e^(A s_lambda \/ 4) e^(2 s_lambda) lt.eq 2 w_H lt.eq frac(1, 16 R) . $ <cmp:gas-hit>]
  A node of size $a$ has support at most $R a$. Summing a potential child over one of its intersection sites and over the two edge colors, equations (8.30)–(8.31) bound the child sum, even with an exponential allowance for its descendants, by $a \/ 4$. More explicitly, induction on maximum tree depth bounds the sum of descendants below a root of size $a$ by $e^a$. For the induction step, each child of size $b$ contributes at most its weight times $e^b$. The sum over unordered distinct children is at most the exponential of their one-child sum: sum ordered $r$-tuples with factor $1 \/ r !$ and then drop distinctness. The result is at most $e^(a \/ 4) lt.eq e^a$. Positivity of these majorants permits the limit in the maximum depth.
  The marked-root sum is bounded by
  #[#set math.equation(numbering: n => "(8.32)")
   $ sum_lambda d_lambda e^(A s_lambda \/ 4) e^(s_lambda) lt.eq D_H v delta_K . $ <cmp:root-hit>]
  Here summing the per-site bound can only overcount labels. Actual forest components have distinct marked roots. Drop all disjointness conditions between their descendant trees and sum unordered root sets. Equations (8.28) and (8.32) give
  $ sum_(upright("nonempty forests")) upright("majorant") lt.eq sum_(r gt.eq 1) frac(\( D_H v delta_K e^(zeta_H K) \)^r, r !) \, $
  which is (8.27).
  Every denominator used above was a complete positive $Xi_i \( I \)$; every restricted signed sum entered only through its absolute value. The argument is symmetric in $1 \, 2$, proving the last assertion. ◻
]

=== 8.7 From relative densities to partition functions <from-relative-densities-to-partition-functions>

#thm([Lemma 8.9.])[
  (Normalization on a common set).  #emph[Let $f_1 \, f_2 > 0$ be integrable, with $0 < Z_i = integral f_i thin thin upright(d) nu < oo$ and $pi_i = f_i nu \/ Z_i$. If 
$ pi_i \( G^c \) lt.eq epsilon_i < 1 \, #h(2em) lr(|log f_2 / f_1|) lt.eq eta quad upright("on ") G \, $

 then 
#[#set math.equation(numbering: n => "(8.33)")
 $ e^(- eta) \( 1 - epsilon_1 \) lt.eq Z_2 / Z_1 lt.eq frac(e^eta, 1 - epsilon_2) . $ <cmp:normalization-bound>]

 If $epsilon_i lt.eq epsilon lt.eq 1 \/ 2$, then $lr(|log \( Z_2 \/ Z_1 \)|) lt.eq eta + 2 epsilon$.]
] <cmp:normalization>

#proof[
  The relative density bound compares the two integrals over $G$ by factors $e^(plus.minus eta)$. Use the exact identity
  $ Z_2 / Z_1 = frac(integral_G f_2 thin thin upright(d) nu, integral_G f_1 thin thin upright(d) nu) frac(pi_1 \( G \), pi_2 \( G \)) . $
  The last assertion follows from $- log \( 1 - epsilon \) lt.eq 2 epsilon$. ◻
]

#proof[
  Choose $C_(4 \, H)$ as in (8.29). Lemma 24 gives the common exceptional-set estimate, and Lemma 25 gives (8.8).
  Applying the latter estimate in both directions yields
  $ e^(- u) lt.eq frac(Xi_2 \( q \), Xi_1 \( q \)) lt.eq e^u \, #h(2em) u = D_H v delta_K e^(zeta_H K) . $
  This step does not require $u$ to be small. Adding (8.5) proves (8.9).
  Let
  $ b_H = min \( a_H \, gamma_H - zeta_H \) > 0 $
  and choose $0 < c_H < b_H \/ 2$. If $v lt.eq e^(c_H K)$, both the exceptional probability and the relative density error are at most $C_H e^(- \( b_H - c_H \) K)$. For $K$ sufficiently large the former is at most $1 \/ 2$, so Lemma 26 proves (8.10), with any fixed $0 < d_H lt.eq b_H - c_H$ after adjusting $C_H$. ◻
]

=== 8.8 Verification for the renormalized $O \( 4 \)$ densities <verification-for-the-renormalized-o4-densities>

We now check the assumptions used in the theorem, including those that come from positivity of the original model rather than from bounds on its signed expansion.

At the retained scale, Theorem 5.1 gives

#[#set math.equation(numbering: n => "(8.34)")
 $ rho_i = e^(X_i) Xi_i \, #h(2em) X_i = - h cal(E)_i - cal(P)_i - cal(L)_i \, #h(2em) H \/ 2 lt.eq h lt.eq 2 H . $ <cmp:RG-density>]

The two densities are written using the prescribed bulk scalar normalization. The kinetic form is

#[#set math.equation(numbering: n => "(8.35)")
 $ cal(E)_i \( q \) = sum_e S_t \( r_e \) + 1 / 2 sum_e m_e \( q \) \| \( ell_i nabla q \)_e \|^2 \, #h(2em) S_t \( r \) = cases(delim: "{", c_0 r^2 \/ 2 \, & r lt.eq t \,, d_0 t r \, & r > t \,) $ <cmp:kinetic-form>]

where $0 < d_0 < c_0 \/ 16$. In this formula $nabla q$ denotes the field of nearest-neighbor spin differences. The free kernels $ell_i$ have the stated uniform exponentially weighted row and column bounds. Every mask and every other condition used by a term is part of its complete support.

===== 8.8.1 Support and difference norms. <support-and-difference-norms.>

The complete-cover convention gives a connected hull with at most $C_L cal(M)_H^2 s_lambda$ sites, where $cal(M)_H = ceil.l \( log H \)^2 ceil.r$. Thus $R_H$ is polynomial. The covering bound is

$ w_H = exp \[ - p_H^(1 \/ 4) \] \, $

which decreases faster than every inverse power because $P_0 > 4$. The compatible lists and the equal-endpoint estimate of Theorem 17 give (8.3) and (8.5) with $delta_K lt.eq C_H e^(- gamma_H K)$. Any fixed polynomial in $K$ in that estimate is absorbed by decreasing $gamma_H$. The constants are uniform in the longer cutoff depth and in the admitted terminal coupling.

===== 8.8.2 Strict positivity and finite energy of the full density. <strict-positivity-and-finite-energy-of-the-full-density.>

The last block observation has conditional density

$ Q_b \( V divides u \) = z_(a b)^(- 1) e^(a b V dot.op u) \, #h(2em) \| u \| = 1 . $

In the small-mean branch it is a positive mixture of these densities over constituent-spin directions. In either case,

#[#set math.equation(numbering: n => "(8.36)")
 $ e^(- 2 a b) lt.eq frac(Q_b \( V divides dot.op \), Q_b \( tilde(V) divides dot.op \)) lt.eq e^(2 a b) . $ <cmp:kernel-ratio>]

For a mixture the bound follows term by term before summation. The observation variables in different cells are conditionally independent. Changing $n$ output spins therefore changes the product kernel by a factor between $e^(- 2 a b n)$ and $e^(2 a b n)$; integration against any positive input density preserves this bound.

The incoming coupling in the last step is at most $2 \( H + gamma_0 \)$, where $gamma_0 = \( log L \) \/ pi$. Hence

$ B_(rho \, H) = 4 a \( H + gamma_0 \) $

works in (8.4), uniformly in all preceding steps. It also follows directly that the output density is strictly positive. Scalar extraction does not affect the ratio bound.

===== 8.8.3 Reflection positivity. <reflection-positivity.>

At a retained seam, the fine reflection exchanges the two disjoint halves of the block partition. The symmetric block weights, the normalized-mean rule, and the constituent-spin fallback commute with that reflection. For a function $F$ of output spins on one side, let $cal(Q) F$ be its conditional expectation given the input spins on that side. Conditional independence and reflection covariance give

$ mu_(upright("out")) \( \( theta overline(F) \) F \) = mu_(upright("in")) \( \( theta overline(cal(Q) F) \) thin cal(Q) F \) gt.eq 0 . $

Thus reflection positivity passes through each blocking step. Translation and reflection compatibility on the retained lattice pass through the same kernels. Notice that conditional independence is used together with reflection covariance.

===== 8.8.4 Stability. <stability.>

The second term of (8.35) is nonnegative and

$ h cal(E)_i \( q \) gt.eq frac(d_0 H, 2) sum_e min \( r_e^2 \, t_H^2 \) . $

The seven canonical slots have degrees $4 \, 2 \, 5 \, 3 \, 6 \, 4 \, 2$ and prefactors $h \, 1 \, h \, 1 \, h \, 1 \, h^(- 1)$. On a slot’s regular mask, a displacement along a recorded path of length $u$ is at most $u t_H$. The exponential path norm absorbs every fixed power of $u$, so

$ parallel cal(P)_i parallel_oo & lt.eq C_L v #scale(x: 120%, y: 120%)[\(] H t_H^4 + t_H^2 + H t_H^5 + t_H^3 + H t_H^6 + t_H^4 + H^(- 1) t_H^2 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq C_L v \( H t_H^4 + t_H^2 \) . $

The regular-error norm gives $parallel cal(L)_i parallel_oo lt.eq v H^(- 2.05)$. Thus (8.6) holds with

$ c_(*) = d_0 / 2 \, #h(2em) epsilon.alt_H = C_L \( H t_H^4 + t_H^2 + H^(- 2.05) \) = o \( H t_H^2 \) . $

On the cap $cal(C)_H$, all bonds are $O \( H^(- 1 \/ 2) \)$, all masks are on, and the row bound for $ell_i$ gives $h cal(E)_i lt.eq C_L v$. The same canonical and error estimates yield $X_i gt.eq - C_L v$ there. Since $H t_H^2 arrow.r oo$, this is (8.7).

===== 8.8.5 Finite energy of the regular exponent. <finite-energy-of-the-regular-exponent.>

Changing $n$ spins changes only $O \( n \)$ direct bonds. The row and column bounds for $ell_i$ imply

$ sum_e \| \( ell_i nabla \( q - tilde(q) \) \)_e \| lt.eq C_L n . $

A kinetic mask can change only if its read neighborhood meets a changed bond. Its radius is $O \( log \( 2 \/ t_H \) \)$, so there are at most $C n log^2 \( 2 \/ t_H \)$ such masks. Uniform boundedness of the row values therefore bounds the kinetic variation by

$ C_L H \[ 1 + log^2 \( 2 \/ t_H \) \] thin n . $

For the other terms, complete supports imply that a change is possible only in terms whose supports hit a changed site. Their exponential path and cover norms bound this hit sum by a fixed polynomial in $cal(M)_H$ times their anchored norms: sum over possible anchors in a connected hull, and absorb its fixed size powers with the spare exponential weight. It follows that

$ B_(X \, H) lt.eq C_L H \[ 1 + cal(M)_H + log \( 2 \/ t_H \) \]^C \, $

which proves (8.4).

Finally $t_H arrow.r 0$, $t_H^(- 1)$ is polynomially bounded, and $H t_H^2 = p_H^2$ dominates $\( log H \)^2$. This completes the verification of (C1)–(C4). Increasing the fixed minimum period to accommodate the boxes in Lemma 22 is harmless: it depends only on $H$, not on either cutoff depth.

== 9 A fixed reference box and the lower mass bound <sec:assembly>

Fix $L$ and then $H$ large enough for all preceding estimates and for $epsilon_H lt.eq 1 \/ 9$ in Lemma 29. This choice precedes the selection of $K_0 \, M_0$ and is used for both mass bounds. All estimates needed to compare different cutoffs have now been established. We first make that comparison at the level of actual partition functions, then choose the reference box only once.

Let $I_H$ be the terminal interval in Proposition 16. For an admitted $r$-step trajectory ending at $h in I_H$, write its initial coupling as $beta_r \( h \)$. The exact integrations and the bulk scalar convention give

#[#set math.equation(numbering: n => "(9.1)")
 $ Z_(beta_r \( h \)) \( M L^r \, M L^r \) = e^(v_r \( h \) M^2) cal(Z)_(r \, h) \( M \) \, #h(2em) cal(Z)_(r \, h) \( M \) = integral f_(r \, h \, M) \( V \) thin thin upright(d) nu_M \( V \) . $ <eq:blocked-partition>]

Here $nu_M$ is product probability measure on the coarse $M times M$ torus, $f_(r \, h \, M)$ is the complete positive density, and $v_r \( h \)$ is independent of $M$. Only this last independence matters; the scalar need not converge or be close for different depths. The notation $beta_r \( h \)$ does not assert uniqueness: every estimate is uniform over all admitted trajectories with the specified endpoints.

#thm([Proposition 9.1.])[
  (Comparison of cutoffs).  #emph[There are constants $C_H \, c_H \, d_H > 0$ and a finite depth threshold such that, for all admitted $N gt.eq K$, $h in I_H$, and dyadic $M gt.eq M_min \( L \, H \)$ with $\( 2 M \)^2 lt.eq e^(c_H K)$, 
#[#set math.equation(numbering: n => "(9.2)")
 $ \| D_N \( h \; M \) - D_K \( h \; M \) \| lt.eq C_H e^(- d_H K) \, #h(2em) D_r \( h \; M \) = Delta_(beta_r \( h \)) \( M L^r \) . $ <eq:cutoff-comparison>]

 The constants do not depend on the ratio of the two bare couplings or on $N - K$.]
] <prop:cutoff>

#proof[
  Theorem 17 gives a local discrepancy $delta_K lt.eq C_H e^(- gamma_H K)$ for the two terminal representations. Apply Theorem 19 with their common terminal coupling. There is one set $G$ such that, under each normalized law,
  $ mu_i \( G^c \) lt.eq C_H M^2 e^(- a_H K) \, $
  and on $G$ the logarithms of the complete densities differ by at most
  $ C_H M^2 delta_K e^(zeta_H K) \, #h(2em) 0 < zeta_H < gamma_H \/ 2 . $
  This includes the regular exponent and the signed covering sum. Choose $c_H < min \( a_H \, gamma_H - zeta_H \)$, and decrease it if any admissible-volume restriction requires this. Both bounds then decrease exponentially with $K$ whenever $M^2 lt.eq e^(c_H K)$.
  Lemma 26, which uses the exceptional probability under both laws, consequently gives
  $ \| log cal(Z)_(N \, h) \( M \) - log cal(Z)_(K \, h) \( M \) \| lt.eq C_H e^(- d_H K) $
  for some $d_H > 0$ and all sufficiently large $K$. The scalar in (9.1) cancels exactly:
  $ D_r \( h \; M \) = 4 log cal(Z)_(r \, h) \( M \) - log cal(Z)_(r \, h) \( 2 M \) \, $
  because $4 M^2 - \( 2 M \)^2 = 0$. Apply the normalization bound at $M$ and $2 M$; the factor of five is absorbed in $C_H$. ◻
]

The size requirement is explicit in terms of the constants in the construction. For a prescribed coarse box and error $epsilon$, it suffices that

#[#set math.equation(numbering: n => "(9.3)")
 $ K gt.eq max {K_(upright("adm")) \( L \, H \) \, frac(2 log \( 2 M \), c_H) \, frac(log \( C_H \/ epsilon \), d_H)} \, #h(2em) N gt.eq K . $ <eq:K-threshold>]

Here $K_(upright("adm"))$ includes both trajectory admission and the lower depth threshold in Proposition 27. Calibration gives

#[#set math.equation(numbering: n => "(9.4)")
 $ beta_r \( h \) = frac(log L, pi) r + frac(1, 2 pi) log r + O_(L \, H) \( 1 \) . $ <eq:beta-depth>]

Thus the shorter depth controls the required largeness of both bare inverse couplings. The proof gives finite thresholds through a specified order of inequalities; it does not supply a useful numerical value for them. The two trajectories must have the same terminal kinetic coupling. Mere largeness of two arbitrarily chosen bare couplings is not that matching condition.

#thm([Theorem 9.2.])[
  (Lower bound).  #emph[There are fixed $K_0 \, M_0$, independent of the final depth, such that 
#[#set math.equation(numbering: n => "(9.5)")
 $ m_(upright("lat")) \( beta_N \( h \) \) gt.eq frac(log 2, M_0 L^N) \, #h(2em) N gt.eq K_0 \, quad h in I_H . $ <eq:lower-depth>]

 In particular $m_(upright("lat")) \( beta \) gt.eq c sqrt(beta) e^(- pi beta)$ for every sufficiently large bare coupling, with $c > 0$.]
] <thm:lower>

#proof[
  Temporarily let the reference depth $K$ grow. Choose a dyadic $M_K$ with $log M_K = K^(3 \/ 4) + O \( 1 \)$, and put $n_K = M_K L^K$. Since $log M_K = o \( K \)$, Proposition 27 admits $M_K$ and $2 M_K$ for all large $K$. By calibration and Theorem 5, uniformly for $h in I_H$,
  $ log frac(n_K, Xi \( beta_K \( h \) \)) = K^(3 \/ 4) - O_(L \, H) \( sqrt(K log K) \) arrow.r + oo . $
  The ratio grows faster than every polynomial in $K$, whereas the logarithm of the polynomial prefactor in the preliminary estimate is only $O_(L \, H) \( K \)$. Hence
  $ sup_(h in I_H) D_K \( h \; M_K \) arrow.r 0 . $
  Choose one finite $K_0$ for which all admissibility requirements hold and
  $ sup_(h in I_H) D_(K_0) \( h \; M_(K_0) \) + C_H e^(- d_H K_0) lt.eq 2^(- 10) . $
  Fix $M_0 = M_(K_0)$. The cutoff comparison now gives $D_N \( h \; M_0 \) lt.eq 2^(- 10)$ for every $N gt.eq K_0$. Proposition 4, and uniqueness of the periodic limit from Theorem 5, prove (9.5). Neither the reference depth nor the coarse box subsequently changes.
  Finally, (6.14) identifies $L^(- N)$ with $sqrt(beta) e^(- pi beta)$ up to fixed positive factors. Proposition 16 covers every sufficiently large bare coupling, so this proves the last assertion. ◻
]

Figure 3 summarizes the order of choices.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.54, 4), [#text(size: 9pt)[trial boxes $M_K$#linebreak()$log M_K=K^(3"/"4)+O(1)$]])
  line((3.3, 4), (4.4, 4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((6.16, 4), [#text(size: 9pt)[choose one finite $K_0$#linebreak()and fix $M_0=M_(K_0)$]])
  line((7.92, 4), (8.965, 4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((10.62, 4), [#text(size: 9pt)[refine the cutoff#linebreak()$N gt.eq K_0$]])
  line((0, 0), (0, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0.55, 0), (0.55, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((1.1, 0), (1.1, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((1.65, 0), (1.65, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((2.2, 0), (2.2, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((2.75, 0), (2.75, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (2.75, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.5), (2.75, 0.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1), (2.75, 1), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.5), (2.75, 1.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2), (2.75, 2), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.5), (2.75, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  rect((0, 0), (2.75, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((1.375, 2.6), [#text(size: 9pt)[reference depth $K_0$]], anchor: "south", padding: 0.1176cm)
  content((1.375, -0.08), [#text(size: 9pt)[$M_0L^(K_0)$ sites per side#linebreak()$a_(K_0)= ell_( upright("ref") )L^(-K_0)$]], anchor: "north", padding: 0.1176cm)
  line((3.135, 1.25), (4.125, 1.25), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((4.51, 0), (4.51, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.785, 0), (4.785, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((5.06, 0), (5.06, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((5.335, 0), (5.335, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((5.61, 0), (5.61, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((5.885, 0), (5.885, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((6.16, 0), (6.16, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((6.435, 0), (6.435, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((6.71, 0), (6.71, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((6.985, 0), (6.985, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((7.26, 0), (7.26, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 0), (7.26, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 0.25), (7.26, 0.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 0.5), (7.26, 0.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 0.75), (7.26, 0.75), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 1), (7.26, 1), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 1.25), (7.26, 1.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 1.5), (7.26, 1.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 1.75), (7.26, 1.75), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 2), (7.26, 2), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 2.25), (7.26, 2.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((4.51, 2.5), (7.26, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  rect((4.51, 0), (7.26, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((5.885, 2.6), [#text(size: 9pt)[a finer depth $N$]], anchor: "south", padding: 0.1176cm)
  content((5.885, -0.08), [#text(size: 9pt)[$M_0L^N$ sites per side#linebreak()$a_N= ell_( upright("ref") )L^(-N)$]], anchor: "north", padding: 0.1176cm)
  line((7.645, 1.25), (8.635, 1.25), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((9.02, 0), (9.02, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.157, 0), (9.157, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.295, 0), (9.295, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.432, 0), (9.432, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.57, 0), (9.57, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.707, 0), (9.707, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.845, 0), (9.845, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.982, 0), (9.982, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.12, 0), (10.12, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.26, 0), (10.26, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.39, 0), (10.39, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.53, 0), (10.53, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.67, 0), (10.67, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.81, 0), (10.81, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((10.95, 0), (10.95, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.08, 0), (11.08, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.22, 0), (11.22, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.36, 0), (11.36, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.49, 0), (11.49, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.63, 0), (11.63, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((11.77, 0), (11.77, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0), (11.77, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.125), (11.77, 0.125), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.25), (11.77, 0.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.375), (11.77, 0.375), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.5), (11.77, 0.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.625), (11.77, 0.625), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.75), (11.77, 0.75), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 0.875), (11.77, 0.875), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1), (11.77, 1), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.125), (11.77, 1.125), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.25), (11.77, 1.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.375), (11.77, 1.375), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.5), (11.77, 1.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.625), (11.77, 1.625), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.75), (11.77, 1.75), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 1.875), (11.77, 1.875), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 2), (11.77, 2), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 2.125), (11.77, 2.125), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 2.25), (11.77, 2.25), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 2.375), (11.77, 2.375), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.02, 2.5), (11.77, 2.5), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  rect((9.02, 0), (11.77, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((10.39, 2.6), [#text(size: 9pt)[depth $N+1$]], anchor: "south", padding: 0.1176cm)
  content((10.39, -0.08), [#text(size: 9pt)[$M_0L^(N+1)$ sites per side#linebreak()$a_(N+1)= ell_( upright("ref") )L^(-(N+1))$]], anchor: "north", padding: 0.1176cm)
  content((5.885, -1.45), [#text(size: 9pt)[Every box has the same physical side $M_0 ell_( upright("ref") )$.]])
})],
  caption: [Figure 3: The order of choices in the lower-bound argument. The growing family of trial boxes is used only to select one reference depth and one coarse period. The comparison then transfers the small square-box test to all finer admitted cutoffs at the same terminal coupling. The grids are schematic; their counts are not the actual lattice periods. Refinement does not enlarge the physical reference box. ],
) <fig:fixed-reference-box>

The exponent $3 \/ 4$ is only a convenient choice between $1 \/ 2$ and $1$. More generally an error $o \( beta \)$ in the logarithm of the preliminary length can be absorbed in a subexponentially growing reference box. Calibration fixes the physical size of a coarse cell; comparison transfers a small partition-function test to a fixed number of those cells. Both facts are needed for the bound.

== 10 An upper bound from correlated block observables <sec:upper>

A lower bound for the full gap must exclude all low-energy sectors. For an upper bound one nonvanishing correlation at a controlled distance suffices. We obtain such a correlation from the terminal spins, then pull it back through the observation kernels to two bounded observables of the original spins. The only estimate from Section 8 needed here is the one-law rarity bound of Lemma 20. Its proof uses (C1), (C3), and (C4), already verified for each retained density; it uses neither relative comparison of two densities nor matching of their terminal couplings.

=== 10.1 Alignment and the microscopic observables <alignment-and-the-microscopic-observables>

#thm([Lemma 10.1.])[
  (Alignment of retained spins).  #emph[For the actual retained densities of Theorem 5.1, uniformly in the cutoff depth and the admitted terminal coupling, 
#[#set math.equation(numbering: n => "(10.1)")
 $ bb(E) \| V_X - V_(X + e) \|^2 lt.eq epsilon_H \, #h(2em) epsilon_H = \( t_H \/ C_1 \)^2 + 4 e^(- sigma_H) arrow.r 0 quad \( H arrow.r oo \) . $ <cmp:alignment>]

 If $H$ is large enough that $epsilon_H lt.eq 1 \/ 9$, then 
#[#set math.equation(numbering: n => "(10.2)")
 $ bb(E) \[ V_0^(\( 1 \)) V_(3 e)^(\( 1 \)) \] gt.eq 1 / 8 . $ <cmp:block-correlation>]

 At depth $N$ this is the correlation of two centered original-spin observables of norm at most one, supported in their respective ancestral blocks of side $L^N$.]
] <lem:alignment>

#proof[
  Apply Lemma 20 to a single bond. Outside its flagged event the squared chord is at most $\( t_H \/ C_1 \)^2$, and everywhere it is at most $4$. This proves (10.1). Along three consecutive bonds, Cauchy–Schwarz gives
  $ bb(E) \| V_0 - V_(3 e) \|^2 lt.eq 3 sum_(j = 0)^2 bb(E) \| V_(j e) - V_(\( j + 1 \) e) \|^2 lt.eq 9 epsilon_H . $
  The spins are unit vectors, so $bb(E) \[ V_0 dot.op V_(3 e) \] gt.eq 1 - 9 epsilon_H \/ 2 gt.eq 1 \/ 2$. The exact joint law is $O \( 4 \)$-invariant. Therefore every component has mean zero and $bb(E) \[ V_0^(\( 1 \)) V_(3 e)^(\( 1 \)) \] = 1 / 4 bb(E) \[ V_0 dot.op V_(3 e) \]$, proving (10.2).
  Condition on the original spins $sigma$, and define
  #[#set math.equation(numbering: n => "(10.3)")
   $ F_X \( sigma \) = bb(E) \[ V_X^(\( 1 \)) divides sigma \] \, #h(2em) parallel F_X parallel_oo lt.eq 1 . $ <eq:block-observable>]
  Each observation kernel reads only the spins in its block. Iterating this fact, all auxiliary observation variables and fallback tags that produce $V_X$ lie in its ancestral block. Distinct ancestral blocks use disjoint auxiliary variables, independent conditional on $sigma$. Integrating these block trees shows that $F_X$ depends only on the original spins in its block and $bb(E) F_X = 0$. For disjoint blocks,
  $ bb(E) \[ F_X F_Y \] = bb(E) \[ V_X^(\( 1 \)) V_Y^(\( 1 \)) \] . $
  In particular, choosing $e = e_1$ in the time direction gives
  #[#set math.equation(numbering: n => "(10.4)")
   $ bb(E) \[ F_0 F_(3 e_1) \] gt.eq 1 \/ 8 . $ <eq:block-correlation>]
  ◻
]

The finite-torus conclusion passes to the periodic infinite-volume state at each fixed depth $N$. To justify this even for a measurable fallback rule, approximate the bounded local functions $F_X$ and their products by continuous functions in product-Haar $L^1$. The nearest-neighbor model has finite-support marginal densities bounded uniformly in the surrounding torus, with a bound depending only on that fixed support and its fixed bare coupling; this follows by bounding the finitely many incident interaction terms in its conditional density. The approximation is therefore uniform in the torus size. Local convergence then proves the claim. This passage uses no continuum construction.

=== 10.2 Transfer across the actual support gap <transfer-across-the-actual-support-gap>

The choice of $H$ at the start of Section 9 already ensures $epsilon_H lt.eq 1 \/ 9$. It remains to compare the correlation (10.4) with the distance between the two microscopic supports.

We will use the following direct consequence of the full transfer gap. If real centered bounded observables $F \, G$ are supported in time slabs $\[ - r \, 0 \]$ and $\[ d \, d + s \]$, respectively, then

#[#set math.equation(numbering: n => "(10.5)")
 $ \| "Cov" \( F \, G \) \| lt.eq ∥∥ F_oo ∥∥ G_oo e^(- m_(upright("lat")) d) . $ <eq:actual-slab>]

Indeed let $theta$ reflect in the zero-time plane, and translate $G$ by $- d$. Their half-space vectors satisfy $"Cov" \( F \, G \) = chevron.l \[ theta F \] \, T^d \[ tau_(- d) G \] chevron.r$. Each vector has norm at most its sup norm, by the reflected expectation defining that norm. Both vectors are perpendicular to the vacuum. Applying the definition of $m_(upright("lat"))$ proves (10.5). Bounded measurable observables follow by local $L^2$ approximation and Cauchy–Schwarz. This argument uses the actual infinite-volume Hilbert space and makes no claim that finite-cylinder eigenvalues converge individually.

#thm([Proposition 10.2.])[
  (Upper bound).  #emph[For all the admitted trajectories used above, 
#[#set math.equation(numbering: n => "(10.6)")
 $ m_(upright("lat")) \( beta_N \( h \) \) lt.eq \( log 8 \) L^(- N) . $ <eq:upper-depth>]

]
] <prop:upper>

#proof[
  The observables in (10.3) are centered and bounded by one. Their ancestral blocks, indexed by $0$ and $3 e_1$, are separated by at least $L^N$ time steps, as shown in Figure 4. Apply (10.5) to (10.4) to get $1 \/ 8 lt.eq e^(- m_(upright("lat")) \( beta_N \( h \) \) L^N)$, which proves the result. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.2, 2.2), fill: rgb("#e0e0e0"), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((2.2, 0), (4.4, 2.2), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((4.4, 0), (6.6, 2.2), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((6.6, 0), (8.8, 2.2), fill: rgb("#e0e0e0"), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((1.1, 1.1), [#text(size: 9pt)[block for $0$#linebreak()$"supp" F_0$]])
  content((7.7, 1.1), [#text(size: 9pt)[block for $3e_1$#linebreak()$"supp" F_(3e_1)$]])
  line((0, 2.64), (2.2, 2.64), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: ("|", "<"), end: (">", "|")))
  content((1.1, 2.64), [#text(size: 9pt)[$L^N$]], anchor: "south", padding: 0.1176cm)
  line((6.6, 2.64), (8.8, 2.64), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: ("|", "<"), end: (">", "|")))
  content((7.7, 2.64), [#text(size: 9pt)[$L^N$]], anchor: "south", padding: 0.1176cm)
  line((2.2, -0.33), (6.6, -0.33), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: ("|", "<"), end: (">", "|")))
  content((4.4, -0.33), [#text(size: 9pt)[support gap $gt.eq L^N$]], anchor: "north", padding: 0.1176cm)
  line((-0.33, -1.32), (9.35, -1.32), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((9.35, -1.32), [#text(size: 9pt)[time]], anchor: "west", padding: 0.1176cm)
  content((4.4, 4.07), [#text(size: 9pt)[$ F_X( sigma )= bb(E) [V_X^((1)) divides sigma ], |F_X| lt.eq 1, bb(E) F_X=0$]])
})],
  caption: [Figure 4: Pulling terminal observables back to the original lattice. Each displayed support lies within an ancestral block of side $L^N$. The auxiliary block variables are independent between disjoint ancestral blocks conditional on the original spins, so $bb(E) \[ F_0 F_(3 e_1) \] = bb(E) \[ V_0^(\( 1 \)) V_(3 e_1)^(\( 1 \)) \]$. Alignment bounds this correlation below by $1 \/ 8$; the full transfer gap bounds it above by the exponential of minus the gap times $L^N$. No independence of the two pulled-back observables is asserted. ],
) <fig:block-supports>

#proof[
  #emph[Completion of Theorem 1.] Theorem 5 gives existence and uniqueness of the periodic local limit. Proposition 16 supplies all required trajectories and covers every sufficiently large bare coupling. Theorem 28 and Proposition 30 give the two bounds in depth units. Proposition 15 converts them to (1.3). Every choice of constants was made before the final depth $N$. ◻
]

== 11 Physical units and the role of a continuum limit <sec:physical>

Choose a physical reference length $ell_(upright("ref")) > 0$ and terminal coupling $h = H$. A microscopic time separation of $n$ steps then equals $a_N n$, with $a_N = ell_(upright("ref")) L^(- N)$. Since $e^(- m_(upright("lat")) n) = e^(- \( m_(upright("lat")) \/ a_N \) \( a_N n \))$, the mass in these units is $m_(upright("phys") \, N) = m_(upright("lat")) \( beta_N \( H \) \) \/ a_N$. The proved bounds are

#[#set math.equation(numbering: n => "(11.1)")
 $ #box(stroke: black, inset: 3pt, [$ frac(log 2, M_0 ell_(upright("ref"))) lt.eq m_(upright("phys") \, N) lt.eq frac(log 8, ell_(upright("ref"))) \, #h(2em) N gt.eq K_0 . $]) $ <eq:physical-bounds>]

These are uniform bounds for cutoff theories. They require neither convergence of their measures nor convergence of the numerical sequence of masses. Equally, if one prescribes $a \( beta \) Lambda = A sqrt(beta) e^(- pi beta) \( 1 + o \( 1 \) \)$ with positive fixed $A \, Lambda$, Theorem 1 bounds the physical mass above and below by positive multiples of $Lambda$.

The half-logarithm in (6.14) matters. Write $xi_(upright("lat")) = m_(upright("lat"))^(- 1)$ for the inverse full gap. Knowing only $log xi_(upright("lat")) \/ beta arrow.r pi$ would also allow $xi_(upright("lat")) = beta^(- 1 \/ 2) e^(pi beta + sqrt(beta))$, whose inverse vanishes in these physical units. Our proof bounds the entire multiplicative error.

=== 11.1 What would pass to an existing continuum theory <what-would-pass-to-an-existing-continuum-theory>

We state separately the precise spectral implication if an appropriate continuum limit is available. This is not used to prove (11.1).

#thm([Proposition 11.1.])[
  #emph[Let $a_j arrow.b 0$ and let $T_j$ be positive lattice transfer contractions with normalized vacua $Omega_j$ and full gaps $m_j$ satisfying $liminf_j m_j \/ a_j gt.eq m_(*) > 0$. Suppose a limiting theory has Hilbert space $cal(H)$, normalized vacuum $Omega$, and a strongly continuous semigroup $e^(- t sans(H))$ with $sans(H) gt.eq 0$ self-adjoint and $sans(H) Omega = 0$. Suppose a set of centered vectors $u$ dense in $Omega^perp$ has centered lattice approximants $u_j perp Omega_j$ and nonnegative integers $n_j \( t \)$ such that 
$ ∥u_j∥^2 arrow.r ∥∥ u^2 \, #h(2em) chevron.l u_j \, T_j^(n_j \( t \)) u_j chevron.r arrow.r chevron.l u \, e^(- t sans(H)) u chevron.r \, #h(2em) a_j n_j \( t \) arrow.r t $

 for every $t gt.eq 0$. Then 
$ "spec" \( sans(H) \) subset { 0 } union \[ m_(*) \, oo \) \, #h(2em) ker sans(H) = bb(C) Omega . $

]
] <prop:continuum>

#proof[
  For every $t > 0$, the lattice gap gives
  $ chevron.l u_j \, T_j^(n_j \( t \)) u_j chevron.r lt.eq e^(- \( m_j \/ a_j \) a_j n_j \( t \)) ∥u_j∥^2 . $
  Pass to the limit and extend by density. For every $u perp Omega$, $chevron.l u \, e^(- t sans(H)) u chevron.r lt.eq e^(- m_(*) t) ∥∥ u^2$. Positivity of its spectral measure excludes spectral weight below $m_(*)$, including at zero, on that subspace. ◻
]

The norm convergence can instead be imposed after positive-time regularization. More precisely, for each $u$ in a dense subset of $Omega^perp$, suppose there are centered lattice vectors $v_j$ and some $s > 0$. Define their autocorrelations by

$ C_j \( t \) = chevron.l v_j \, T_j^(floor.l t \/ a_j floor.r) v_j chevron.r #h(2em) \( t gt.eq 0 \) \, $

and assume that

$ C_j \( s + r \) arrow.r chevron.l u \, e^(- r sans(H)) u chevron.r quad \( r gt.eq 0 \) . $

The case $r = 0$ gives $C_j \( s \) arrow.r parallel u parallel^2$. For $t > s$, positivity of the lattice spectral measure gives $C_j \( t \) lt.eq e^(- \( m_j \/ a_j \) \( t - s + o \( 1 \) \)) C_j \( s \)$. Apply this with $t = s + r$ and pass to the limit to obtain the same quadratic-form bound as in the proposition. Thus no bound on $parallel v_j parallel$, or on an unnormalized field renormalization constant, is needed. Euclidean covariance is a separate condition if the energy gap is to be interpreted as a relativistic mass gap.

An upper bound needs a surviving observable. Low-energy cutoff states can disappear from a chosen limiting Hilbert space: the positive energy measures $j^(- 1) delta_1 + \( 1 - j^(- 1) \) delta_R$, $R > 1$, have spectral bottom one but converge to $delta_R$. A sufficient observable-survival condition is the following: in the same limiting theory there are centered vectors $f \, g$, with $parallel f parallel \, parallel g parallel lt.eq 1$, and a time separation $d gt.eq ell_(upright("ref"))$, such that the separated cutoff block cross correlations converge to $chevron.l f \, e^(- d sans(H)) g chevron.r gt.eq 1 \/ 8$. Then, writing $m_(upright("cont"))$ for the spectral bottom on $Omega^perp$,

$ 1 \/ 8 lt.eq \| chevron.l f \, e^(- d sans(H)) g chevron.r \| lt.eq e^(- d m_(upright("cont"))) lt.eq e^(- ell_(upright("ref")) m_(upright("cont"))) \, $

so $m_(upright("cont")) lt.eq \( log 8 \) \/ ell_(upright("ref"))$. The mixed-correlation convergence and norm bounds are additional hypotheses; separate convergence of observables without these properties would not suffice. These convergence requirements identify the additional input for a statement about a continuum spectrum. The finite and positive mass bounds in physical units have already been proved without that input.

== 12 Uniform analytic estimates for the linear block map <app:analytic-block>

This section supplies the analytic estimates used in the linear block transformation. In particular, every strip width and every constant below is chosen independently of the blocking depth and before the sufficiently large integer $L$ is chosen. There are only finitely many derivative and decay orders in an application of these estimates.

=== 12.1 Domains, sampling, and the free precision <domains-sampling-and-the-free-precision>

We use integer site coordinates for Fourier transforms. Changing to block-centered coordinates conjugates the formulas by deterministic translation phases; in coarse momentum these phases and their fixed derivatives are uniformly bounded. The integer-coordinate convention makes the gluing of aliases explicit. For $delta > 0$, put

$ Omega_delta = { p in bb(C)^2 : \| upright("Rep")_mu \| < pi + delta \, quad \| upright("Imp")_mu \| < delta } . $

An alias field is a family on these overlapping cubes, with the alias index relabeled when $p$ crosses a face of the real momentum cube. Equivalently it is a function of $k$ on the fine momentum torus, with $p = L k$ reduced modulo $2 pi$. At a centered representative $l$ write $chevron.l l chevron.r = 1 + \| l \|_1$. The weights of two representatives used on an overlap are comparable by an absolute constant. All estimates on overlapping cubes therefore define estimates of the same field. An analytic star means $f^(*) \( z \) = overline(f \( macron(z) \))$ for real-kernel matrix symbols, with transposition included for matrices; for the scalar Fourier transform of real weights it is $b^(*) \( z \) = b \( - z \)$.

#thm([Lemma 12.1.])[
  (Uniform shells and strips).  #emph[For the sampled smooth block weights in Section 4, there are $delta \, c \, C > 0$ and $L_0$ with the following properties for $L gt.eq L_0$ and $h gt.eq 0$. The precisions $K_h$ and an elliptic edge lift $B_h$ are analytic on the complex $delta$-neighborhood of the momentum torus. On the real torus, 
$ c D lt.eq K_h lt.eq C D \, #h(2em) c I lt.eq B_h lt.eq C I \, #h(2em) K_h = d^(*) B_h d \, quad B_h \( 0 \) = I . $

 Their fixed derivatives are bounded, $K_h - D$ has a zero of order four at zero, and their history differences, including the inverse edge lifts, are bounded by $C L^(- h)$ when compared with any depth $macron(h) gt.eq h$. The same assertions hold on a common smaller strip.]
] <app:free-strip>

#proof[
  Let $s_L = sum_x b_x^2$. Smoothness and normalization of the sampled bump give $s_L lt.eq A \/ L^2$ for a fixed $A$. Discrete summation by parts $N$ times, with no boundary terms because the bump is supported in the block interior, gives
  #[#set math.equation(numbering: n => "(12.1)")
   $ \| partial_p^alpha b \( \( p + 2 pi l \) \/ L \) \| lt.eq C_(N \, alpha) chevron.l l chevron.r^(- N) quad \( p in Omega_(delta_0) \) . $ <app:analytic-1>]
  Here $delta_0 > 0$ can initially be any sufficiently small fixed constant. Indeed the sum of absolute $N$th differences of the normalized weights is $O \( L^(- N) \)$, whereas on a nonzero alias at least one difference multiplier has size $c chevron.l l chevron.r \/ L$. Complex tilting costs at most $exp \( C delta_0 \)$, since the block has diameter $O \( L \)$; derivatives in $p$ insert bounded rescaled coordinates. The principal alias is bounded directly. This also proves (12.1) in the centered convention.
  Set $m = L^h$, $W_h \( xi \) = product_(j = 1)^h b \( xi \/ L^j \)$ and $D_m \( xi \) = m^2 D \( xi \/ m \)$. For centered $l eq.not 0$ modulo $m$,
  #[#set math.equation(numbering: n => "(12.2)")
   $ \| D_m \( p + 2 pi l \) \| gt.eq c chevron.l l chevron.r^2 quad \( p in Omega_(delta_0) \) \, $ <app:analytic-2>]
  after reducing $delta_0$. To check the complex bound directly, use $D_m \( z \) = 4 m^2 sum_mu sin^2 \( z_mu \/ \( 2 m \) \)$. Its real part is at least $c \| upright("Rez") \|^2 - C \| upright("Imz") \|^2$ on this cube. A nonzero alias has $\| upright("Re") \( p + 2 pi l \) \| gt.eq c chevron.l l chevron.r$. This proves (12.2), including aliases at the faces of the cube.
  Here is a precise shell estimate, including its complex tilt. The $r$-fold block weights have squared sum $s_L^r$: the base-$L$ representation of each position in an $L^r$ block is unique. Their positions divided by $L^r$ remain in a fixed bounded square. Finite Fourier orthogonality, first at tilt $+ upright("Imp")$ and then at tilt $- upright("Imp")$, and Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(12.3)")
   $ sum_(l med mod med L^r) \| W_r \( p + 2 pi l \) W_r \( p + 2 pi l \)^(*) \| lt.eq C A^r . $ <app:analytic-3>]
  For a shell contained in $\| l \|_oo lt.eq L^r \/ 2$, the factors with $j > r$ have absolute product at most a fixed constant: their real arguments cost at most one and their complex tilts cost $exp \( C delta_0 sum_(j > r) L^(1 - j) \)$. Thus (12.3) bounds the corresponding shell of $W_h$ too. Split the nonprincipal aliases into the first shell $0 < \| l \|_oo lt.eq L \/ 2$ and the shells $L^(r - 1) \/ 2 < \| l \|_oo lt.eq L^r \/ 2$, $2 lt.eq r lt.eq h$. Equations (12.2)–(12.3) imply
  #[#set math.equation(numbering: n => "(12.4)")
   $ sum_(l eq.not 0) lr(|frac(W_h \( p + 2 pi l \) W_h \( p + 2 pi l \)^(*), D_m \( p + 2 pi l \))|) lt.eq C sum_(r = 1)^h A^r / L^(2 \( r - 1 \)) lt.eq C \, $ <app:analytic-4>]
  uniformly once $L^2 gt.eq 2 A$. The noise sum $a^(- 1) sum_(r < h) s_L^r$ is also bounded. Consequently the function $R_h$ in (4.5) is bounded on a fixed complex domain. Cauchy’s estimate on nested fixed domains bounds every required fixed derivative; no real-momentum estimate is being used in place of a complex estimate.
  For real $p$ in the cube, the centered one-dimensional bump has phase variation less than $pi \/ 2$ in its first principal factor. The product structure gives $\| b \( p \/ L \) \| gt.eq c$. For $j gt.eq 2$, $1 - b \( p \/ L^j \) b \( p \/ L^j \)^(*) = O \( \| p \|^2 L^(- 2 \( j - 1 \)) \)$. It follows that $W_h \( p \) W_h \( p \)^(*) gt.eq c$ uniformly in $h$. The denominator
  $ F_h \( p \) = W_h \( p \) W_h \( p \)^(*) + D_m \( p \) R_h \( p \) $
  is therefore at least $c$ on the real cube. It and its first derivatives have uniform bounds on the larger complex cube. A fixed reduction of the imaginary width gives $\| F_h \| gt.eq c \/ 2$. The formula $K_h = D_m \/ F_h$ now proves analyticity and boundedness. The defining covariance sum proves that expressions from overlapping alias cubes agree. Real ellipticity follows from (12.4), and the expansions $F_h = 1 + O \( \| p \|^2 \)$, $D_m = \| p \|^2 + O \( \| p \|^4 \/ m^2 \)$ give $K_h - D = O \( \| p \|^4 \)$.
  For completeness, history differences require no division by a bump factor. On common aliases $\| l \|_oo lt.eq L^h \/ 2$ put $xi = p + 2 pi l$. Taylor’s theorem for the extra product, with the linear term canceled in each $b b^(*)$, gives
  $ \| W_(macron(h)) W_(macron(h))^(*) - W_h W_h^(*) \| lt.eq C \| xi \|^2 L^(- 2 h) \| W_h W_h^(*) \| . $
  On the same aliases, $\| D_(L^(macron(h)))^(- 1) - D_(L^h)^(- 1) \| lt.eq C L^(- 2 h)$; this follows from $\| D_(L^(macron(h))) - D_(L^h) \| lt.eq C \| xi \|^4 L^(- 2 h)$ and (12.2). Thus the common nonprincipal sum changes by at most $C A^h L^(- 2 h)$. The extra shells have total at most $C A^(h + 1) L^(- 2 h)$ by (12.4), and the noise tail has the same bound. After increasing $L_0$ these quantities are at most $C L^(- h)$. The principal product and numerator have their direct Taylor bounds. The nonvanishing denominator then gives the history estimate for $K_h$, and Cauchy’s estimate gives its fixed derivatives.
  We spell out why the edge lift does not introduce a scale-dependent strip. If $f$ is periodic analytic, the quotient
  $ frac(f \( p_1 \, p_2 \) - f \( 0 \, p_2 \), e^(i p_1) - 1) $
  is analytic and bounded on a smaller fixed strip, with norm bounded by a fixed multiple of the norm of $f$ on the larger strip. Near $p_1 = 0$ this is Taylor’s integral formula; away from zero the denominator is bounded below. Repeat in the two coordinates. If $f$ vanishes through degree three at zero this writes it as a sum of the five monomials $d_1^j d_2^(4 - j)$ with bounded analytic coefficients. Since $d_mu^(*) = - e^(- i p_mu) d_mu$, this gives $K_h = d^(*) B_h^(upright("raw")) d$, with $B_h^(upright("raw")) = I + O \( \| p \|^2 \)$ and uniformly bounded coefficients. Taking its Hermitian, reality, and lattice-symmetry averages preserves the identity. Put $c \( p \) = \( - d_2 \, d_1 \)$. Adding $lambda c^(*) c$ leaves the identity unchanged. Near zero $B_h^(upright("raw"))$ is uniformly positive. Away from zero its longitudinal quadratic form is $K_h \/ D gt.eq c$, its mixed entries are bounded, and the transverse addition is $lambda D$. The elementary two-by-two Schur complement therefore makes the matrix uniformly positive for one fixed $lambda$. Uniform first-derivative bounds make this matrix and its inverse analytic on a smaller fixed strip. All operations before this common addition are bounded linear operations; the addition cancels in differences. The inverse difference identity supplies the claimed history bound. Depth zero can be kept equal to $I$; its discrepancy bound is only the bounded $h = 0$ bound. This proves the lemma. ◻
]

=== 12.2 The two divisions in the edge intertwiner <the-two-divisions-in-the-edge-intertwiner>

The following elementary analytic fact specifies the divisions needed in the construction of $T$. It is useful to keep the alias scale $L^(- 1)$ in its statement.

#thm([Lemma 12.2.])[
  (Alias syzygy and coarse division).  #emph[Suppose an analytic alias vector $R_l \( p \)$ satisfies $d \( k_l \)^(*) R_l \( p \) = 0$, has the bounds 
$ \| R_l \( p \) \| lt.eq C_s L^(- 1) chevron.l l chevron.r^(- s) $

 on a fixed larger domain for every required fixed $s$, and has a zero through first order at the principal origin. Then $R_l = c \( k_l \)^(*) gamma_l$ on a smaller fixed domain, with $\| gamma_l \| lt.eq C_s chevron.l l chevron.r^(- s)$ and $gamma_0 \( 0 \) = 0$. If $R_l \( 0 \) = 0$ on every nonprincipal alias, then $gamma_l \( 0 \) = 0$ for all $l$.]
  #emph[If, in addition, $gamma_l \( 0 \) = 0$ for every alias, there is an analytic row $H_l$ satisfying $H_l d' \( p \) = gamma_l \( p \)$ and $\| H_l \| lt.eq C_s chevron.l l chevron.r^(- s)$. Both constructions are linear, preserve alias gluing, and have constants independent of $L$.]
] <app:alias-division>

#proof[
  On a nonprincipal alias one of $\| d_mu \( k_l \)^(*) \|$ is at least $c chevron.l l chevron.r \/ L$ throughout the domain. Divide the corresponding component of $R$ by that component of $c^(*)$. Where both choices are possible they agree by $d^(*) R = 0$. This gives the asserted estimate with one extra power of decay, which can be discarded. On the principal alias away from a small fixed polydisc the same argument applies with denominator $c \/ L$. Inside that polydisc the identity implies $R_2 \( 0 \, p_2 \) = 0$ and $R_1 \( p_1 \, 0 \) = 0$. Hence $R_2 \/ d_1^(*) = - R_1 \/ d_2^(*)$ extends analytically, by the coordinate division proved above. Since $d_mu \( p \/ L \)^(*)$ is $p_mu \/ L$ times an analytic unit, its norm is bounded by $C L parallel R parallel$, with a fixed Cauchy constant. The first-order vanishing of $R$ makes the quotient zero at the origin. At a nonprincipal zero-momentum alias the nonzero divisor gives the last assertion directly. Uniqueness away from the common zero proves agreement on every overlap.
  We give the second division explicitly to avoid summing $L$ bounded interpolation terms. Fix the largest desired decay order $s$ and a single even integer $J > s + 2$, increasing it further if required by the finite list of difference orders. On the fine torus set
  $ \( Pi gamma \) \( k \) = sum_(n med mod med L) (frac(sin \( L \( k_1 - 2 pi n \/ L \) \/ 2 \), L sin \( \( k_1 - 2 pi n \/ L \) \/ 2 \)))^J gamma \( 2 pi n \/ L \, k_2 \) . $
  The power is periodic because $J$ is even. It is one at its own sampling point and zero at all the others. On alias $l$ its absolute value is at most $C_J \( 1 + "dist"_(upright("cyc")) \( l_1 \, n \) \)^(- J)$ on a fixed complex cube: the numerator is bounded there and the denominator is bounded below by a constant times the cyclic distance except at the removable own sample, where the quotient is bounded directly. The elementary triangle inequality gives
  #[#set math.equation(numbering: n => "(12.5)")
   $ chevron.l l chevron.r^s sum_(n med mod med L) frac(chevron.l \( n \, l_2 \) chevron.r^(- s), \( 1 + "dist"_(upright("cyc")) \( l_1 \, n \) \)^J) lt.eq C_s sum_(j in bb(Z)) \( 1 + \| j \| \)^(s - J) lt.eq C_(s \, J) . $ <app:analytic-5>]
  Thus $Pi$ is bounded in the same weighted alias norm, independently of $L$. Its fixed coarse derivatives are bounded by Cauchy’s estimate on nested fixed cubes. Now set
  $ H_1 = frac(gamma - Pi gamma, e^(i p_1) - 1) \, #h(2em) H_2 = frac(Pi gamma, e^(i p_2) - 1) . $
  The first numerator vanishes on $p_1 = 0$ by interpolation. On $p_2 = 0$, all samples in the second numerator vanish by $gamma_n \( 0 \) = 0$. Coordinate division in $p$, rather than in $k$, therefore bounds both quotients with no power of $L$. The resulting identity is $H_1 d'_1 + H_2 d'_2 = gamma$. Only a fixed finite number of domain reductions has been used. ◻
]

We verify the hypotheses for the actual construction. On a nonprincipal alias, Lemma 32 and its explicit formula imply $\| K_h \( k_l \)^(- 1) \| lt.eq C L^2 chevron.l l chevron.r^(- 2)$ on the coarse complex cube. The bump estimate (12.1) and (4.2) give arbitrary fixed alias decay for $P_l$. On the principal alias the exact identity

$ P_0 = b \( k_0 \)^(- 1) [1 - (a^(- 1) + L^(- 2) sum_(l eq.not 0) b \( k_l \) b \( k_l \)^(*) K_h \( k_l \)^(- 1)) K_(h + 1) \( p \)] $

removes the pole. The principal bump is nonzero on the fixed smaller domain by the preceding principal-factor estimate. Consequently $d_l P_l$ has bound $C_s L^(- 1) chevron.l l chevron.r^(- s)$. The finite geometric sum defining $omega_(mu \, l)$ is bounded by $C L$ on that domain; hence $T_(0 \, l)$ has the same bound. The identities $K P = Q^(*) K'$ and $omega_mu d_mu = d'_mu$ give $d_l^(*) R_l = 0$ exactly. At $p = 0$ both terms in $R_l$ vanish on nonprincipal aliases. On the principal alias their linear terms are both $i p \/ L$, so $R_0$ vanishes through first order. Lemma 33 therefore gives the stated $gamma \, H$. In

$ T_l = T_(0 \, l) + c_l^(*) H_l \( B' \)^(- 1) $

the extra factor $c_l^(*)$ has size $C chevron.l l chevron.r \/ L$; using one further decay order proves $\| T_l \| lt.eq C_s L^(- 1) chevron.l l chevron.r^(- s)$. The construction is linear in $R$ and uses uniformly bounded analytic inverses, so its history differences have the same $L^(- h)$ factor. Choose $J$ once after listing all required decay and difference orders.

Finally, the remaining factorizations in the positive completion introduce no further scale loss. A coarse analytic row $v$ with $v d' = 0$ has the form $v = eta c'$ by the same coordinate-plane division, with bounded $eta$. A coarse analytic matrix $A$ with $A d' = 0$ and $d' ""^(*) A = 0$ consequently has the form $A = c' ""^(*) eta c'$, by applying that division successively to its columns and rows. The estimates use only two fixed Cauchy constants. Apply this to $B' U B'$ and to $c_l B_l^(- 1) T_l B'$. The latter row before division is $O \( L^(- 2) chevron.l l chevron.r^(- s) \)$. Its squared fine norm includes the factor $L^2 sum_l$, and hence is $O \( L^(- 2) \)$ after division. These are precisely the bounds used to choose the curl correction with its constant fixed before $L$. Fourier inversion on any smaller retained strip, and the factors $d \( k_l \)$ for fine differences, now give the asserted exponential kernel moments. All reductions of width in this section are made once for the construction; they are not repeated as the depth grows.

== 13 A fixed coefficient norm for the diagonal canonical map <supp:canonical-fixed-norm>

The diagonal response of a canonical slot involves only the linear conditional mean. The following estimate separates this fact from the nonlinear construction. In particular, the same exponential norm is used on the two sides of every block transformation.

We use the distance $\| r \|_1 = \| r_1 \| + \| r_2 \|$ on the square lattice. Fix a shortest lattice path from $o$ to each $o + r_i$, and count its edges with multiplicity, including multiplicities shared by different paths. Our path parameter and weight are

#[#set math.equation(numbering: n => "(13.1)")
 $ u \( r_1 \, dots.h \, r_n \) = 1 + sum_(i = 1)^n \| r_i \|_1 \, #h(2em) W_sigma \( u \) = e^(sigma u) \( 1 + u \)^2 . $ <supp:canonical-path>]

The same convention is imposed at every scale. The union of these paths is connected and joins the anchor to every argument. Thus this is a specific choice of the comparable joining paths used to define the canonical coefficients; it does not change their polynomials or their polynomial supports. We do not identify norms with different exponential exponents.

For $3 lt.eq n lt.eq 6$, fix once and for all a basis of the invariant color tensors of degree $n$. For a tensor $T$ in that basis, a label represents $T \( y_o \( o + r_1 \) \, dots.h \, y_o \( o + r_n \) \)$, with a scalar coefficient $a$. Its contribution to the coefficient norm is $\| a \| W_sigma \( u \)$. Labels with a zero displacement may be discarded, since $y_o \( o \) = 0$. Separate labels may be retained even when they represent the same polynomial; combining their coefficients can only decrease the norm.

Here is the precise quadratic convention. Let $cal(D)$ be the eight symmetries of the square, acting on displacement vectors, and set

#[#set math.equation(numbering: n => "(13.2)")
 $ M_(r \, s) \( y_o \) & = 1 / 8 sum_(g in cal(D)) y_o \( o + g r \) dot.op y_o \( o + g s \) \,\
S_o \( y_o \) & = 1 / 4 sum_(\| e \|_1 = 1) \| y_o \( o + e \) \|^2 \, #h(2em) Q_(r \, s) = M_(r \, s) - \( r dot.op s \) S_o . $ <supp:quadratic-packet>]

On every affine field $y_o \( o + r \) = A r$, where $A : bb(R)^2 arrow.r bb(R)^3$ is linear, $Q_(r \, s)$ is zero. Indeed,

#[#set math.equation(numbering: n => "(13.3)")
 $ 1 / 8 sum_(g in cal(D)) \( g r \)_i \( g s \)_j = frac(r dot.op s, 2) delta_(i j) \, #h(2em) S_o \( A r \) = 1 / 2 sum_(i = 1)^2 \| A e_i \|^2 . $ <supp:quadratic-affine-cancellation>]

A compensated label is the entire packet $a Q_(r \, s)$, including its tagged compensating coefficients. We assign each of those coefficients the weight of its own path. The packet therefore has norm

#[#set math.equation(numbering: n => "(13.4)")
 $ \| a \| { W_sigma \( u \( r \, s \) \) + \| r dot.op s \| W_sigma \( 3 \) } . $ <supp:quadratic-packet-norm>]

In particular, a compensating nearest-neighbor term has path parameter $3$, not the path parameter of the possibly long original label. Keeping its tag records the cancellation before absolute values are taken. For every degree let $parallel A_n parallel_sigma$ be the supremum over anchors of the sum of the corresponding label norms.

Use block-centered fine coordinates, so the $L^2$ fine anchors $o$ assigned to a coarse anchor $O$ satisfy $\| o \/ L - O \|_1 lt.eq 1$. Fine coordinate differences are integral; their absolute origins may be shifted by a half-integer. Write $D_i f \( x \) = f \( x + e_i \) - f \( x \)$. The kernel assumptions needed for the estimate are the following, with $c_(*) > 0$, $K_1$, and $K_2$ independent of the history and of all $L gt.eq L_0$:

#[#set math.equation(numbering: n => "(13.5)")
 $ sup_x sum_z e^(c_(*) \| z - x \/ L \|_1) \| D_(i_1) dots.h.c D_(i_k) P \( x \, z \) \| lt.eq K_k L^(- k) \, #h(2em) k = 1 \, 2 . $ <supp:fixed-norm-kernel-assumption>]

For the statement about stiffness extraction we also use the exact constant and affine identities

#[#set math.equation(numbering: n => "(13.6)")
 $ sum_z P \( x \, z \) = 1 \, #h(2em) sum_z P \( x \, z \) z = x \/ L . $ <supp:fixed-norm-affine-assumption>]

These identities are separate from the difference estimates.

The linear substitution in a label at $o$ is

#[#set math.equation(numbering: n => "(13.7)")
 $ y_o \( o + r \) mapsto sum_z #scale(x: 120%, y: 120%)[\(] P \( o + r \, z \) - P \( o \, z \) #scale(x: 120%, y: 120%)[\)] y_O \( z \) \, #h(2em) O = \[ o \] . $ <supp:fixed-norm-substitution>]

It is the linear part of changing anchor after applying the conditional mean; the constant identity makes it independent of the chosen constant coarse field. Output labels are assigned to $O$ and contributions of all $o$ in that block are added. Let $B_O$ denote that raw output polynomial. For the norm estimate at degree two, define $A'_2$ to be the coefficient list obtained by averaging $B_O$ under the eight square symmetries about $O$ and then compensating every orbit as in (13.2). These operations preserve the polynomial under the additional symmetry and affine assumptions below. At higher degrees, $A'_n$ is simply the raw output list.

#thm([Lemma 13.1.])[
  (One norm and constants chosen before the block size).  #emph[Fix $0 < sigma lt.eq c_(*) \/ 2$. Under (13.5), substitution (13.7) has the following bounds in the single norm just defined: 
#[#set math.equation(numbering: n => "(13.8)")
 $ parallel A'_n parallel_sigma lt.eq C L^(2 - n) parallel A_n parallel_sigma quad \( 3 lt.eq n lt.eq 6 \) \, #h(2em) parallel A'_2 parallel_sigma lt.eq C / L parallel A_2 parallel_sigma . $ <supp:one-norm-conclusion>]

 The quadratic assertion is for sums of compensated packets and includes the cost of output compensation. To regard this compensation as a representation of the same polynomial, assume additionally (13.6) and that the output polynomial at each coarse anchor is invariant under the square symmetries. The latter holds for bulk translation-invariant input coefficients and a block-centered, square-equivariant kernel $P$. In this case the entire transferred quadratic polynomial has zero affine Hessian, and its stiffness extraction is exactly zero.]
  #emph[The constant $C$ and a lower threshold for $L$ depend only on $sigma$, $c_(*)$, $K_1$, $K_2$, and the fixed tensor conventions. They do not depend on $L$, the history, or the coefficient lists. One can consequently choose $L$ after $C$ so that every bound in (13.8) is a strict contraction.]
] <supp:one-norm-contraction>

#proof[
  Put $eta = 2 sigma$ and, for a scalar row $F$, write
  $ \| F \|_(eta \, O) = sum_z e^(eta \| z - O \|_1) \| F \( z \) \| . $
  For $m = \| r \|_1$, telescoping along a shortest path and using (13.5) gives
  #[#set math.equation(numbering: n => "(13.9)")
   $ \| P \( o + r \, dot.op \) - P \( o \, dot.op \) \|_(eta \, O) lt.eq C m / L e^(eta m \/ L) . $ <supp:row-first>]
  Here and in the next two displays $C$ is independent of $L$. To check the exponential factor, every fine point in that telescoping sum lies within distance $m + 1$ of $o$. For such a point $x$, $\| z - O \|_1 lt.eq \| z - x \/ L \|_1 + 1 + \( m + 1 \) \/ L$; the extra bounded factor is absorbed into $C$.
  There is also the exact discrete first-order decomposition
  #[#set math.equation(numbering: n => "(13.10)")
   $ P \( o + r \, dot.op \) - P \( o \, dot.op \) = sum_i r_i G_i + E_r \, quad G_i = D_i P \( o \, dot.op \) \, quad \| G_i \|_(eta \, O) lt.eq C \/ L \, quad \| E_r \|_(eta \, O) lt.eq C m^2 / L^2 e^(eta m \/ L) . $ <supp:row-second>]
  For completeness, a positive path edge contributes $D_i P \( x \, dot.op \)$, and a negative edge contributes $- D_i P \( x - e_i \, dot.op \)$. Subtract the corresponding signed $D_i P \( o \, dot.op \)$ at each edge. The signed sum of these reference rows is $sum_i r_i G_i$. Each remaining difference of first differences telescopes into at most $m + 1$ second differences; there are $m$ edges. The bound for $k = 2$ proves the last estimate after enlarging $C$. The case $r = 0$ is identically zero.
  We will pass from row estimates to coefficient estimates with the elementary inequality
  #[#set math.equation(numbering: n => "(13.11)")
   $ W_sigma \( 1 + t \) = e^(sigma \( 1 + t \)) \( 2 + t \)^2 lt.eq C_sigma e^(2 sigma t) \, #h(2em) t gt.eq 0 \, $ <supp:row-to-path>]
  where $C_sigma = e^sigma sup_(t gt.eq 0) \( 2 + t \)^2 e^(- sigma t) < oo$. Thus a tensor product of $n$ rows has output coefficient norm at most $C_sigma$ times the product of their $\| dot.op \|_(eta \, O)$ norms. No input or output coefficient norm has changed: $eta$ is solely the weight used to estimate the kernels.
  Consider first a degree-$n$ label, $n gt.eq 3$, and put $u = 1 + sum_i \| r_i \|_1$. Equations (13.9) and (13.11) bound its output coefficient norm, before the anchor sum, by
  #[#set math.equation(numbering: n => "(13.12)")
   $ C_sigma \| a \| L^(- n) \( 1 + u \)^n e^(2 sigma u \/ L) . $ <supp:degree-n-before-anchor>]
  The substitution acts on position indices only; it leaves the fixed color tensor unchanged. Any chosen canonical reordering of its at most six arguments costs only a fixed finite-dimensional constant. For $L gt.eq 4$,
  #[#set math.equation(numbering: n => "(13.13)")
   $ frac(\( 1 + u \)^n e^(2 sigma u \/ L), W_sigma \( u \)) lt.eq \( 1 + u \)^(n - 2) e^(- sigma u \/ 2) lt.eq C_(n \, sigma) . $ <supp:spare-width-fixed-space>]
  This is the precise spare exponential factor: it comes from rescaling the old displacement by $L$, and is available on every iteration of the same space. Summing the old labels and the $L^2$ anchors gives the first estimate of (13.8).
  For a quadratic packet, insert (13.10) into (13.2). The terms containing two $G$ rows cancel as coefficient arrays, by (13.3). This cancellation precedes taking absolute values. Every remaining term contains an $E$ row. With $u = 1 + \| r \|_1 + \| s \|_1$, the two terms with one $E$ have bounds
  $ C L^(- 3) \( \| r \|_1 \| s \|_1^2 + \| r \|_1^2 \| s \|_1 \) e^(2 sigma u \/ L) \, $
  and the term with two $E$ rows is at most $C L^(- 4) \| r \|_1^2 \| s \|_1^2 e^(2 sigma u \/ L)$. The compensating nearest-neighbor terms obey the same estimate with an additional factor $\| r dot.op s \| lt.eq \| r \|_1 \| s \|_1$ and bounded displacements. After (13.11), the entire raw output is therefore at most
  #[#set math.equation(numbering: n => "(13.14)")
   $ C_sigma \| a \| L^(- 3) \( 1 + u \)^4 e^(2 sigma u \/ L) lt.eq C'_sigma L^(- 3) \| a \| W_sigma \( u \) . $ <supp:quadratic-before-anchor>]
  The final inequality is (13.13) with $n = 4$. It already uses only the first summand of the input packet norm.
  We next verify the cost and meaning of output compensation. Symmetry averaging does not increase the coefficient norm, since every element of an orbit has the same $u$. A raw orbit with displacements $p \, q$ and coefficient $b$ gains the compensator $- b \( p dot.op q \) S_O$. Its additional norm is at most
  #[#set math.equation(numbering: n => "(13.15)")
   $ \| b \| thin \| p dot.op q \| W_sigma \( 3 \) lt.eq 1 / 4 W_sigma \( 3 \) \| b \| \( u \( p \, q \) - 1 \)^2 lt.eq 1 / 4 W_sigma \( 3 \) \| b \| W_sigma \( u \( p \, q \) \) . $ <supp:output-comp-cost>]
  Thus compensation costs at most the fixed factor $1 + W_sigma \( 3 \) \/ 4$. Together with (13.14) and the $L^2$ anchor count this proves the quadratic norm bound.
  Finally suppose the exact affine and symmetry assumptions hold. On the coarse affine field $y_O \( z \) = A \( z - O \)$, (13.6) gives
  $ sum_z #scale(x: 120%, y: 120%)[\(] P \( o + r \, z \) - P \( o \, z \) #scale(x: 120%, y: 120%)[\)] A \( z - O \) = A r \/ L . $
  Consequently every old packet transfers to a polynomial zero on every affine field, before the sum over anchors. Polarization gives zero affine bilinear Hessian as well. Express a square-invariant output as the sum of its raw orbit labels $b M_(p \, q)$. Its affine evaluation is $1 / 2 sum b \( p dot.op q \) parallel A parallel_(upright("HS"))^2$, so $sum b \( p dot.op q \) = 0$. Absolute convergence follows from the norm estimates. The aggregate compensator is therefore exactly zero; compensation changes only the labelled representation and the extracted scalar stiffness is zero. This proves every assertion. ◻
]

#prodef([Remark 13.2.])[
  (Symmetry, folding, and the scope of this estimate).  The scalar compensation by $S_O$ is appropriate to bulk square-invariant densities. It is not a claim that an arbitrary anchor-dependent array becomes square invariant under blocking. The latter would require a larger space with tensor-valued affine compensation. In the bulk case, square covariance of $P$, invariance of the input, and the permutation of all $L^2$ anchor phases under a block-centered square symmetry imply the required output invariance. One must sum those phases before grouping output orbits.
  The short path weight of a compensating coefficient is only a convention for this unmasked coefficient norm. Its tag retains the original packet and cancellation provenance. It does not authorize shortening any mask, complete read support, or dependency graph in the nonlinear construction.
  All estimates and affine normalizations above concern unfolded coefficients. Folding their absolutely convergent lists onto a torus does not increase the norm if lifted path labels are retained, and also does not increase it if shorter physical paths are subsequently used. Affine test fields need not be periodic, since they are used before folding. The lemma proves only the diagonal coefficient estimate and its zero-stiffness response. Off-diagonal connected sums and the exact nonlinear comparison require their own estimates.
]

== 14 Local sector factors and their complete supports <app:rg-geometry>

This section makes the geometric part of the block integration explicit. The energy rows, the truncated free operators, and their estimates are those of Section 5.2. We prove that the factors can be prepared without changing a sector integral, that the small logarithm persists where its derivatives are used, and that separated factors integrate independently. Positivity and exponential localization of the free operators remain inputs from Lemma 8; the present argument does not prove those analytic estimates.

=== 14.1 One metric and one assignment of each factor <app:factor-ownership>

Fix $L$ before making the following convention. Embed each coarse position at its block anchor, and measure all distances in the same fine-lattice metric. The finite local formulas use a fixed number of primitive kernels. Choose their truncation radii, and the inverse-window radius $R$, small enough that the sum of the radii in any such local composition is at most $M \/ 100$. Include block diameters, reference-point displacements, and kinetic-mask radii in this sum. This is possible by reducing the kernel cutoff by a fixed factor depending on $L$, and then increasing $H$: the block diameter is fixed and the mask radius is $O_L \( log H_j \) = o \( M \)$. The omitted-kernel bounds remain $C_L e^(- c_L M)$ with a possibly smaller $c_L > 0$. Long convolution tails and determinant or inverse chains are not local compositions for this convention: every successive endpoint and window is retained in their records.

For a set $P$ of seed anchors, let $N_r \( P \)$ denote its closed $r$-neighborhood. Seeds have their edge, observation, or output-edge types attached. Join two seeds when their $50 M$-neighborhoods intersect. Write $P_c$ for the seed set of a resulting component. Distinct sets $N_(50 M) \( P_c \)$ are disjoint. Consequently each of the assignments below has at most one owner:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Object
], table.cell(rowspan: 1, colspan: 1)[Owner $c$, if its anchor lies in the indicated set
]),
  table.cell(rowspan: 1, colspan: 1)[Frozen spin
], table.cell(rowspan: 1, colspan: 1)[$N_(3 M) \( P_c \)$
],
  table.cell(rowspan: 1, colspan: 1)[Numerical energy row
], table.cell(rowspan: 1, colspan: 1)[$N_(5 M) \( P_c \)$
],
  table.cell(rowspan: 1, colspan: 1)[Stationary square
], table.cell(rowspan: 1, colspan: 1)[$N_(8 M) \( P_c \)$
],
  table.cell(rowspan: 1, colspan: 1)[Edge or observation default
], table.cell(rowspan: 1, colspan: 1)[$N_(14 M) \( P_c \)$
],
  table.cell(rowspan: 1, colspan: 1)[Leading determinant change
], table.cell(rowspan: 1, colspan: 1)[$N_(3 M + R) \( P_c \)$
],
)
]

The last assignment is applicable because an inverse window differs from the empty geometry only when it sees a frozen site. Objects without an owner remain separate factors. Every primary profile belongs to its own component. Every frozen-site normalization reciprocal belongs to that site’s owner. This assigns each additive row and each multiplicative test once; in particular, the $8 M$ and $14 M$ collections are not additional copies of the $5 M$ collection.

The maximality of $P_c$ is implemented by compatibility of the $50 M$ footprints in the primary-pattern sum. It is not an additional predicate in the core factor. Testing maximality directly could read a seed $100 M$ away. The pattern is fixed throughout Gaussian integration; it is never recomputed from a Gaussian value.

=== 14.2 Profiles and the principal logarithm <profiles-and-the-principal-logarithm>

Choose once and for all $theta.alt in C^oo \( bb(R) \, \[ 0 \, 1 \] \)$ equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$. Define

$ G_e \( q \) = theta.alt (frac(\| d_e q \|^2 - \( t \/ 4 \)^2, \( t \/ 2 \)^2 - \( t \/ 4 \)^2)) \, #h(2em) G_Y \( q \, V \) = theta.alt (frac(\| V_Y - hat(m)_Y \( q \) \|^2 - \( W t \)^2, 3 \( W t \)^2)) . $

The tag in $hat(m)_Y$ is retained wherever its fallback branch is used. The factor for a selected primary is $1 - G$; otherwise it is $G$. These give exactly the sector decomposition by $G + \( 1 - G \) = 1$. For every fixed derivative order, a derivative of $G_e$ has support in ${ \| d_e q \| lt.eq t \/ 2 }$, and a derivative of $1 - G_e$ has support in ${ \| d_e q \| gt.eq t \/ 4 }$. The corresponding observation bounds are $2 W t$ and $W t$. Here and below derivatives are taken only on a smooth branch; measurable physical-spin dependencies are held fixed by the transport identity (5.27).

#thm([Lemma 14.1.])[
  (Alignment and its derivative supports).  #emph[Suppose that all internal edge defaults of an $L$-block and its observation default are retained in a product. On the support of this product, or of any product-rule term of a fixed-order derivative of its smooth profiles, every constituent spin satisfies 
$ \| q_x V_Y^(- 1) - 1 \| lt.eq K_L t . $

 If $q_x = exp \( xi_x \) V_Y$ and $\| xi_x \| < pi$, then $xi_x$ is the principal logarithm and $\| xi_x \| lt.eq 2 K_L t$ for sufficiently large $H$.]
] <app:principal-log>

#proof[
  A coordinate path in the block has length at most $2 L$. The retained edge bounds imply $\| q_x - q_z \| lt.eq L t$ for all constituent spins. As the block weights are nonnegative and sum to one, $\| q_x - m_Y \| lt.eq L t$ and $\| m_Y \| gt.eq 1 - L t$. For $L t < 1 \/ 4$, the normalized mean branch is therefore used and $\| q_x - m_Y \/ \| m_Y \| \| lt.eq 2 L t$. The retained observation bound gives $\| q_x - V_Y \| lt.eq \( 2 L + 2 W \) t$. Product-rule derivatives preserve the closed support bounds of every profile, so the argument is unchanged there. For a unit quaternion, $\| exp xi - 1 \| = 2 sin \( \| xi \| \/ 2 \)$ when $0 lt.eq \| xi \| < pi$. The asserted logarithm and its bound follow from the inverse sine. ◻
]

Every exterior spin is farther than $3 M$ from the seeds. Its block therefore contains no edge or observation primary; the locality convention makes its diameter less than $M \/ 100$. Lemma 36 applies on the full sector. It also applies locally to every spin of a selected assigned row: that row is farther than $2.5 M$ from every seed, and its block tests lie inside the retained $14 M$ neighborhood.

Here is a completely smooth extension convention. Put $a_t = 2 K_L t$, enlarging $K_L$ if the finitely many row reference points require it. On $S^3$, use a smooth function of the geodesic angle that equals one through $a_t$ and zero from $2 a_t$, multiply the principal logarithm by it, and extend the product by zero. This defines a global smooth frozen-angle function, since $2 a_t < pi \/ 2$. It equals the actual frozen angle on every selected-row support just described.

On an exterior coordinate use a protector equal to one through $\| xi \| = pi \/ 2$ and zero from $3 pi \/ 4$. Also, when that coordinate is read by a core factor or another protected hard factor, attach an alignment profile equal to one through $a_t$ and zero from $2 a_t$. Both profiles are smooth functions of $\| xi \|^2$ and remain attached. For a compulsory core or mandatory old covering weight they multiply the factor itself. For an optional hard exponential $e^V$, first open it and prepare instead

$ 1 + chi_(upright("att")) \( e^V - 1 \) \, $

where $chi_(upright("att"))$ is the product of its attached profiles. Thus the profiles multiply its selected letter, including an old nonremote masked term or a hard kinetic tail. This equals $e^V$ on the full sector and retains the small bound on $e^V - 1$. Opening $chi_(upright("att")) e^V$ instead would introduce an unpriced order-one failure outside its plateau, and is not the prescription. The alignment profile is the explicit larger smooth plateau allowed in the preparation; it imposes no hard moving-angle predicate. It is one on the full sector and on the local supports needed for the reserve. Its usefulness at the outer boundary of the retained defaults is that a spin read by a boundary default need not have every test of its block retained. Every such read is nevertheless in a small chart on the support of the attached factor and all its derivatives.

The separate global chart profile is one through $pi \/ 4$ and zero from $pi \/ 3$. Multiplication by this profile before extending the angular integral to $bb(R)^3$ changes no sector integral, by Lemma 36. It removes the other exponential preimages. Its subsequent expansion as one plus a failure factor does not detach the protectors or alignment profiles just specified.

=== 14.3 An explicit core factor and its one-time energy charges <an-explicit-core-factor-and-its-one-time-energy-charges>

Let $J_c$ be the numerical rows assigned to $c$, $J_c^(upright("sel"))$ the selected $cal(F) \, cal(B)$ rows among them, and $S_c$ the stationary-square rows assigned to $c$. Write $L_i$ for the appropriate row among $cal(F) \, cal(B) \, cal(C) \, cal(U) \, cal(N) \, cal(Z)$. Put

$ K_c = sum_(i in J_c) L_i - 1 / 2 sum_(i in J_c^(upright("sel"))) \| D_i xi + F_i \|^2 \, #h(2em) H_c = 1 / 2 sum_(i in S_c) \| r_(s \, i) \|^2 . $

All rows in the first sum are included with their original sign. In particular no second copy of a direct energy reserve is introduced for a mask witness or a mean-error witness.

Let $cal(P)_c$ be the product of the primary profiles of $c$ and the defaults assigned to $c$. Let $cal(I)_c$ retain the local inventory checks: a marked true bad input edge is supplied once by its old covering label, and every unmarked selected input primary has the factor $upright(bold(1))_(r_e lt.eq t)$. Retain each queried output status, including an absent status, in the formula’s data. For an output-empty extension replace these output predicates by the analytic no-flag formula on the stated output graph domain, as in Section 5.2. This is an extension, not a differentiation across the jump of a status indicator.

The leading determinant normalization can be written without an unspecified local compensation. The quadratic acts identically in the three tangent colors. For an exterior site $x$ define

$ h_x = - 3 / 2 integral_0^oo (\( 1 + u \)^(- 1) - \( A_(Omega_x) + u \)_(x x)^(- 1)) thin d u \, $

and let $h_compose \( x \)$ be its empty-pattern value at the same fine-site phase modulo the blocking lattice. This phase must be retained: $Q^(*) Q$ need not be invariant under one-step fine translations. Let $F_c$ now denote the set of frozen sites of $c$ (distinct from the affine vector $F_i$). With $kappa_g = \( 2 pi g^2 \)^(3 \/ 2) J_exp \( 0 \)$, define

$ N_c = kappa_g^(- \| F_c \|) exp {sum_(x upright(" exterior")\
x in N_(3 M + R) \( P_c \)) \( h_x - h_compose \( x \) \) - sum_(x in F_c) h_compose \( x \)} . $

The sum includes zero differences harmlessly. Uniform upper and lower spectral bounds on $A_(Omega_x)$ give $\| h_x \| lt.eq C_L$; at infinity the integrand is $O_L \( \( 1 + u \)^(- 2) \)$. Thus $\| log N_c \| lt.eq C_L M^2 \( 1 + \| log g \| \) \| P_c \|$. This is exactly the correction obtained by extracting $kappa_g^(\| Lambda \|) exp { sum_(x in Lambda) h_compose \( x \) }$ while retaining Haar integration at frozen sites. The sum is a fixed scalar per complete $L$-block, so it has the required volume form. The residual determinant chains stay separate, and the observation denominator is extracted on every block.

Writing $cal(A)_c$ for the product of the attached protectors and alignment profiles, one possible compulsory core factor is therefore

#[#set math.equation(numbering: n => "(14.1)")
 $ B_c = cal(P)_c cal(I)_c cal(A)_c thin N_c exp { - b \( K_c + H_c \) } . $ <app:explicit-core>]

The remaining factors are exactly the rows, stationary squares, defaults, Jacobian ratios, and determinant or inverse chains without an owner, and the separately supported old terms. Subtracting every selected affine square once and multiplying back its Gaussian integral is an identity. The assignments, together with the plateau equalities proved above, consequently preserve the full sector integral exactly.

For clarity we give the charging argument for the reserve in this notation. The quantitative inputs are the stack and ledger bounds (5.13)–(5.15), with their weighted row and column sums. An input seed with $t \/ 4 lt.eq r lt.eq t$ has a direct square at least $c t^2$; for $r > t$ its direct row is at least $c t r$ once $L$ is sufficiently large. A noise seed has $\| Y - w \|^2 \/ 2 gt.eq c t^2$ once $W$ is large. An output seed has the positive direct $cal(C)$ reserve displayed in Section 5.2. The second-stack $cal(C)$ contribution cancels and $cal(N)$ is nonnegative.

Only a failed input kinetic mask can make a second-stack $cal(F)$ contribution negative. Charge that contribution to all its bad-edge witnesses with the following upper bound, so no choice of witness or charge multiplicity is hidden. A witness $f$ can occur in at most $C \( 1 + log \( r_f \/ t \) \)^2 lt.eq C r_f \/ t$ mask tests. Splitting the convolution into chords at most $t$ and chords greater than $t$, and using its column sum for the latter, bounds the total negative contribution by

$ frac(C t, L) sum_(f : r_f > t) r_f . $

Every witness of an assigned row belongs to the same primary component: the mask radius is smaller than $M \/ 100$ and that witness is itself an input seed. Its direct row is therefore assigned to this component. Choose $L$ so the displayed loss consumes less than a fixed fraction of those direct reserves.

For the mean term, divide the observation blocks read by assigned rows into blocks all of whose chords are at most $T$ and their complement. The former cost at most $C_L t T^2$ per block. In the latter, use $\| m - hat(m) \| lt.eq \( C \/ L \) sum_(e subset Y) r_e$. Chords greater than $t$ cost another $\( C t \/ L \) sum_(r_f > t) r_f$. Chords at most $t$ cost at most $C_L t^2$ per such block. Each such block has a witness $r_f > T$, so their number is bounded, with fixed multiplicity, by $T^(- 1) sum_(r_f > T) r_f$. This last cost is absorbed by the unused $c t r_f$ reserve because $t \/ T arrow.r 0$. This uses the same reserves with specified fractional budgets, rather than paying for a witness twice.

Selected assigned rows are farther than $2.5 M$ from every seed. Their masks are enabled, their means use the smooth branch, and no row in this collection supplies a seed or failed-mask reserve. Their small chart bounds and Taylor’s formula give

$ \| R_i - R_i^(upright("aff")) \| lt.eq C_L M^D t^2 \, #h(2em) \| R_i \| + \| R_i^(upright("aff")) \| lt.eq C_L M^D t . $

Thus removal of their squares costs $C_L M^D t^3$ per row, independently of the preceding charges. There are at most $C_L M^2 \| P_c \|$ rows, blocks, or local tests in any fixed neighborhood of $P_c$. This follows by covering that neighborhood by one fixed-radius ball about each seed; overlap reduces, rather than increases, the count. The number $D$ of polynomial losses is fixed by the finite local formulas and the fixed derivative order, not by the geometry of $P_c$. Numerical truncation and the remaining small-chord mean terms therefore give

$ K_c gt.eq c t^2 \| P_c \| - C_L M^D \| P_c \| { t^3 + t T^2 + t e^(- c_L M) } . $

Increasing $H$ absorbs the last line as in the stated scale choices. Since $H_c gt.eq 0$, (14.1) then gives

$ \| B_c \| lt.eq exp { - c_L p^2 \| P_c \| + C_L M^D \( 1 + \| log g \| \) \| P_c \| } . $

The same calculation holds on the supports of differentiated retained profiles: primary lower bounds and default upper bounds persist, and the selected angles remain the principal angles by Lemma 36. Alignment profiles additionally control outer-boundary reads. Product-rule differentiation does not discard an undifferentiated test; it replaces it by a derivative with support in the same closed support. Hard physical-spin tests are transported, not differentiated. The no-output-flag extension uses the positive-mask, unclipped formula through $4 t'$; it changes only the fixed constants in the chart and Taylor estimates.

=== 14.4 The read sets of the prepared factors <app:read-sets>

The following conventions specify complete read sets. A raw position means every endpoint of a row stencil, graph, or recorded path, rather than only its anchor. Add the mean window and output reference for each exterior spin read. Add both centered inverse windows for each covariance entry used. Add the $3 M$ seed-status neighborhood needed to decide membership in every such window. A status read includes both possible answers and is retained when the factor is considered alone.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Factor
], table.cell(rowspan: 1, colspan: 1)[Raw arguments and additional queries
]),
  table.cell(rowspan: 1, colspan: 1)[$B_c$
], table.cell(rowspan: 1, colspan: 1)[All assigned rows, $8 M$ stationary rows, $14 M$ defaults, frozen sites, local inventories, tags, and every queried input/output mask or status; the determinant windows in $N_c$.
],
  table.cell(rowspan: 1, colspan: 1)[Unassigned $cal(F) \, cal(B) \, cal(U)$
], table.cell(rowspan: 1, colspan: 1)[All row endpoints, mean-block spins and tags, output references, clipping/mask statuses or the specified analytic no-flag branch; cutoff arguments.
],
  table.cell(rowspan: 1, colspan: 1)[Stationary, $cal(N) \, cal(Z)$
], table.cell(rowspan: 1, colspan: 1)[All numerical stencil endpoints; the affine-vector arguments in $D mu + F$; their seed-selection queries.
],
  table.cell(rowspan: 1, colspan: 1)[Old canonical term or error
], table.cell(rowspan: 1, colspan: 1)[Its entire old graph, anchored joining paths, compensation terms, masks, and the absence-of-seeds query in $N_(14 M)$ of the projected graph that defines “remote.”
],
  table.cell(rowspan: 1, colspan: 1)[Kinetic tail
], table.cell(rowspan: 1, colspan: 1)[Both complete paths, all endpoints, and each input/output mask query. A long path is never replaced by its anchor.
],
  table.cell(rowspan: 1, colspan: 1)[Ratio or determinant chain
], table.cell(rowspan: 1, colspan: 1)[Every successive matrix endpoint and window, including its hole tests; the affine-vector arguments for a linear chain. Keep the Gaussian endpoint set separately.
],
  table.cell(rowspan: 1, colspan: 1)[Jacobian or chart factor
], table.cell(rowspan: 1, colspan: 1)[Its exterior coordinate and output reference; its mean window and hole tests.
],
  table.cell(rowspan: 1, colspan: 1)[Default or failure
], table.cell(rowspan: 1, colspan: 1)[Both edge endpoints or the whole observation block; the tag if used, smooth mean-branch profile, and its seed/default status.
],
  table.cell(rowspan: 1, colspan: 1)[Old covering weight
], table.cell(rowspan: 1, colspan: 1)[Its original complete support and inventory, every physical-spin argument, and all attached profiles. It retains its own support even when it meets a core.
],
)
]

A noncore factor retains $N_(20 M)$ of every raw position and its joining record. The $14 M$ remote query, $3 M$ hole query, and finite local composition enlargement fit in $18 M$ under the chosen convention. For a core all raw local tests lie in $N_(14 M) \( P_c \)$; their enlargement fits in $N_(18 M) \( P_c \) subset N_(50 M) \( P_c \)$. Old nonremote factors, long tails, and long chains keep their own complete supports, and meet a core or other factor by support intersection. They are not absorbed into a fixed-radius core while forgetting their distant endpoints.

=== 14.5 Exact local marginals <exact-local-marginals>

Let $E \( P \) = Lambda \\ N_(3 M) \( P \)$ and write $A_0$ for the empty-pattern quadratic. Every row incident on an exterior column is selected: its anchor is farther than $3 M - M \/ 100 > 2.5 M$ from the seeds. Consequently

$ A = A_0 \[ E \( P \) \, E \( P \) \] . $

There is no additional selected-row dependence in this principal matrix. For $x in E \( P \)$ let $Omega_x = E \( P \) ∩ B_R \( x \)$ and write

$ Pi_P \( y \, x \) = upright(bold(1))_(y in Omega_x) #scale(x: 120%, y: 120%)[\(] A_0 \[ Omega_x \, Omega_x \]^(- 1) #scale(x: 120%, y: 120%)[\)]_(y x) \, #h(2em) C_P = 1 / 2 \( Pi_P + Pi_P^(*) \) . $

The positivity of $C_P$ is supplied by the window estimate in Section 5.2.

#thm([Lemma 14.2.])[
  (Local marginals and factorization).  #emph[The covariance $C_P \( x \, y \)$ vanishes for $d \( x \, y \) > R$. For $I subset E \( P \)$ its marginal matrix $C_P \[ I \, I \]$ depends only on $P ∩ N_(R + 3 M) \( I \)$. Its numerical mean on $I$ also depends only on the mean windows, affine-row field arguments, and hole queries specified above.]
  #emph[Suppose finitely many prepared factors have disjoint complete supports. Their Gaussian coordinate sets have distance greater than $R$, their frozen-spin and tag argument sets are disjoint, and their integrals factor exactly. Each individual integral is unchanged on deleting outside primary components whose complete supports are disjoint from its own, with all recorded external fields and status answers fixed.]
] <app:local-marginals>

#proof[
  A column of $Pi_P$ vanishes outside its radius-$R$ window; transposition preserves this assertion for an entry’s two endpoints. To decide $Omega_x$ requires only seed positions within distance $R + 3 M$ of $x$. Once that set is known, the principal matrix and its inverse are fixed. Including the windows centered at both endpoints therefore proves the assertion for $C_P \[ I \, I \]$.
  The formula
  $ mu_x = - sum_(y in Omega_x) #scale(x: 120%, y: 120%)[\(] A_0 \[ Omega_x \, Omega_x \]^(- 1) #scale(x: 120%, y: 120%)[\)]_(y x) \( D^(*) F \)_y $
  has exactly the mean reads specified in the table. Notice that its inverse is a window inverse, not the full inverse $A^(- 1)$.
  The complete-support margins include an $R$-neighborhood of each Gaussian read. Disjoint complete supports consequently imply zero cross covariance. The characteristic function of the Gaussian marginal on their union factors into the characteristic functions of its blocks. The frozen Haar measures and tag measures are independent product measures, also independent of the Gaussian, so the complete integrals factor. All deterministic formulas and all marginal entries remain unchanged when outside components are deleted, by the read-set statements just proved. These are Gaussian marginals with covariance $C_P \[ I \, I \]$, not conditional distributions or principal restrictions of the precision matrix. Empty Gaussian or frozen argument sets are allowed and have the unit product measure. ◻
]

Finally, at a fixed total derivative order only a fixed number of factors are differentiated. The number of placements is polynomial in the number of read positions, hence in the total support load times a fixed power of $M$. For completeness the vector field used in protected transport is, on each protected coordinate,

$ W_x = - g^(- 1) \( d exp_(xi_x) \)^(- 1) #scale(x: 120%, y: 120%)[\(] \( partial_v q_x \) T_x^(- 1) #scale(x: 120%, y: 120%)[\)] \, #h(2em) xi_x = mu_x + g Z_x . $

Here $partial_v$ holds $Z$ fixed, and the inverse maps the tangent space at $exp xi_x$ to the imaginary quaternions. Extend this field smoothly from the compact protector chart and set its other components to zero. All fixed-order derivatives of this inverse differential are bounded on that compact chart. The field derivatives of $mu$ come from the displayed window formula: its inverse matrix is independent of the output field at fixed primary statuses, and the derivatives of its affine arguments use only the smooth finite-row and frozen-angle formulas. Their cutoffs cost fixed powers of $t^(- 1)$, paired with normalized directions of size $t$ times the prescribed distance weights. Window and free-history derivative or difference bounds supply the corresponding parameter estimates. These facts, and the stated prediction bounds for remote rows, give fixed polynomial bounds for $W$, its divergence, and their iterated derivatives in $g^(- 1) \, M \, p$ and the number of reads.

At fixed geometry $C_P$ has no output-field dependence. For a parameter or history comparison interpolate its two positive marginal matrices linearly. Uniform ellipticity is preserved, and the covariance score is

$ 1 / 2 (Z \[ I \]^(*) C \[ I \, I \]^(- 1) dot(C) \[ I \, I \] C \[ I \, I \]^(- 1) Z \[ I \] - "Tr" \( C \[ I \, I \]^(- 1) dot(C) \[ I \, I \] \)) . $

The window difference estimate bounds $dot(C)$ with its own discrepancy factor. The trace costs at most a constant times $\| I \|$, and the other term is a Gaussian polynomial of fixed degree. Thus the derivative scores have the polynomial load dependence needed for the joint estimate, with the discrepancy retained. Every hard nonremote factor still meets a retained core, an old covering weight carries a primary inventory edge, and a voluntarily hard tail retains its exceptional chain estimate. This identifies the reserve used by the joint-factor estimate; it does not replace that estimate by a claim of independence for overlapping supports.

== 15 Joint majorants for Gaussian prepared factors <supp:joint-majorants>

The factors produced by the local change of variables share one Gaussian law. Estimates for separate expectations do not suffice. The following estimate is the product bound used before the connected expansion. Its constants do not depend on the dimension of that Gaussian.

#thm([Lemma 15.1.])[
  (A joint Gaussian product estimate).  #emph[Let $Z$ be a centered Gaussian vector with covariance $C$, where $0 lt.eq C lt.eq c_(*) I$ and $c_(*) > 0$. Let $O_i$ satisfy $\| O_i \| lt.eq a_i$. For a finite collection of ratio factors put 
$ R_alpha = e^(Q_alpha) - 1 \, #h(2em) \| Q_alpha \( Z \) \| lt.eq e_alpha (1 + sum_(x in I_alpha) \| Z_x \|^2) \, #h(2em) 0 < e_alpha lt.eq 1 . $

 Suppose that 
#[#set math.equation(numbering: n => "(15.1)")
 $ sup_x sum_(alpha : x in I_alpha) sqrt(e_alpha) & lt.eq \( 64 c_(*) \)^(- 1) \,\
\( 2 + 4 c_(*) \| I_alpha \| \) sqrt(e_alpha) & lt.eq 1 / 4 log \( e_alpha^(- 1) \) quad upright("for every ") alpha . $ <supp:endpoint-load>]

 Let $F_1 \, dots.h \, F_n$ be bounded factors whose product has absolute value at most $upright(bold(1))_E$, where $bb(P) \( E \) lt.eq e^(- tau n)$. Finally suppose $parallel S parallel_(L^4) lt.eq B$. Then 
$ bb(E) lr(|S product_i O_i product_alpha R_alpha product_(j = 1)^n F_j|) lt.eq B product_i a_i product_alpha e_alpha^(1 \/ 4) e^(- tau n \/ 2) . $

 The convention for $n = 0$ is $E$ equal to the full probability space. The conclusion also holds for factors $R_alpha$ satisfying directly $\| R_alpha \| lt.eq sqrt(e_alpha) exp { 2 sqrt(e_alpha) \( 1 + sum_(x in I_alpha) \| Z_x \|^2 \) }$. Here $x$ indexes scalar Gaussian coordinates; vector coordinates may be replaced by their scalar components. No independence between any of the displayed factors is required.]
] <supp:gaussian-product>

#proof[
  For $U gt.eq 1$ and $0 < e lt.eq 1$, the elementary exponential estimate gives
  $ \| e^Q - 1 \| lt.eq e U e^(e U) lt.eq sqrt(e) thin e^(2 sqrt(e) thin U) quad upright("if ") \| Q \| lt.eq e U . $
  Let $D$ be the diagonal matrix whose $x$th entry is $sum_(alpha : x in I_alpha) sqrt(e_alpha)$. The Gaussian determinant identity, valid also for a singular covariance by approximation, yields
  $ bb(E) e^(8 Z^T D Z) = det \( I - 16 C^(1 \/ 2) D C^(1 \/ 2) \)^(- 1 \/ 2) lt.eq e^(16 c_(*) "tr" D) . $
  Indeed, (15.1) makes the eigenvalues of $16 C^(1 \/ 2) D C^(1 \/ 2)$ at most $1 \/ 4$, and $- log \( 1 - u \) lt.eq 2 u$ for $0 lt.eq u lt.eq 1 \/ 2$. Consequently
  $ ∥product_alpha R_alpha∥_(L^4) lt.eq product_alpha [sqrt(e_alpha) e^(\( 2 + 4 c_(*) \| I_alpha \| \) sqrt(e_alpha))] lt.eq product_alpha e_alpha^(1 \/ 4) . $
  Hölder’s inequality with exponents $4 \, 4 \, 2$, applied respectively to $S$, the ratio product, and $upright(bold(1))_E$, completes the proof. ◻
]

Here is the precise reserve bookkeeping used when taking a fixed number of derivatives. It separates the Gaussian estimate from the geometric verification of its hypotheses.

#thm([Corollary 15.2.])[
  (Fixed-order derivatives and an exceptional reserve).  #emph[Let the factors in Lemma 38 carry integer loads $s gt.eq 1$, and let $s_(upright("tot"))$ be their total load. Fix an integer $k$. Suppose that each differentiated product, through order $k$, is a sum of at most $C_k \( 1 + s_(upright("tot")) \)^(d_k)$ expressions to which that lemma applies. Each expression retains the original factor indices and envelopes $a_i \, e_alpha \, I_alpha$, the same failure count $n$, and the same core loads; differentiated factors may use the direct ratio envelope stated in that lemma. Suppose, for every such expression, 
$ B lt.eq C_k g^(- d_k) \( 1 + s_(upright("tot")) \)^(d_k) \, #h(2em) 0 < g < 1 . $

 Suppose each expression requiring the factor $g^(- d_k)$ has at least one of the following reserves:]
  + #emph[a deterministic core factor bounded by $e^(- kappa p^2 s_c)$, with $kappa p^2 \/ 2 gt.eq d_k log \( g^(- 1) \)$;]
  + #emph[at least one failure test, with $tau \/ 4 gt.eq d_k log \( g^(- 1) \)$;]
  + #emph[at least one ratio factor, with $log \( e_alpha^(- 1) \) \/ 8 gt.eq d_k log \( g^(- 1) \)$;]
  + #emph[a deterministic exceptional factor with envelope $a_(*) lt.eq e_(*)$, where $0 < e_(*) < 1$ and $log \( e_(*)^(- 1) \) \/ 2 gt.eq d_k log \( g^(- 1) \)$.]
  #emph[Expressions without any such factor are assumed to obey the same bound on $B$ without $g^(- d_k)$. Then the derivative has a joint product majorant with deterministic ordinary weights $a_i$, core weights $e^(- kappa p^2 s_c \/ 2)$, failure weights $e^(- tau \/ 4)$, and ratio weights $e_alpha^(1 \/ 8)$, and deterministic exceptional weights $e_(*)^(1 \/ 2)$ replacing their original envelopes, times a fixed polynomial in $1 + s_(upright("tot"))$. For a single marked parameter or input discrepancy, factor out its size and use an envelope for the remaining marked factor in place of its original envelope. No bound relative to the original factor is required; that factor may vanish while its discrepancy does not. If the hypotheses above, including the reserves, hold with this replacement, and all other envelopes hold uniformly along the comparison or interpolation, the same conclusion retains the discrepancy size.]
] <supp:product-reserve>

#proof[
  Apply Lemma 38 to each expression. Pay the single global factor $g^(- d_k)$ from the first available reserve in the fixed order core, failure, ratio, deterministic exceptional. The four displayed inequalities justify precisely this payment. Weakening the unused reserves to the same final exponents only enlarges the bound. Sum the polynomially many derivative placements. For a marked term apply the same argument with its replacement envelope. The discrepancy size remains a common multiplicative factor and is not used for this payment. ◻
]

A fixed polynomial of the total load is harmless for the connected expansion: for every $epsilon > 0$ and fixed $d$, $\( 1 + s \)^d lt.eq C_(d \, epsilon) e^(epsilon s)$. It is therefore paid from an explicitly reserved part of the support exponent.

To apply these lemmas to the block integration, the geometric construction supplies the deterministic ordinary and core envelopes, the simultaneous-failure estimate $bb(P) \( E \) lt.eq exp { - c_L p^2 n \/ M^D }$, and the endpoint envelopes of the determinant and Gaussian-ratio chains. Those chains have exponential accuracy in $M$ with polynomial endpoint counts; their summed square roots satisfy (15.1), and (15.1) follows after increasing the terminal scale. Their eighth-root reserve pays the fixed-order score losses. The scale choices ensure

$ frac(c_L p^2, M^D) gt.double p^(3 \/ 10) + log \( g^(- 1) \) \, $

so the failure and core reserves also satisfy Corollary 39 and retain the required $e^(- p^(3 \/ 10))$ suppression.

For a component containing measurable physical-spin factors, use one Gaussian marginal on the union of its read coordinates and one transport vector field that fixes all of those physical-spin arguments. In addition to the covariance bounds, the construction supplies bounds through the required fixed derivative order on the local mean, the transport vector field and its divergence, and, for a varying covariance, its parameter derivatives. These bounds follow from the smooth inverse chart on a fixed compact subset of its injectivity ball and the corresponding differentiated window-kernel bounds. They make each fixed-order transport score bounded in $L^4$ by a polynomial of the load and a fixed power of $g^(- 1)$. Uniform ellipticity alone would not imply this score bound. A product-rule derivative does not remove the closed support conditions of a retained sector profile. Thus the geometric reserve on those supports, proved in Appendix 14, is exactly the hypothesis of Corollary 39; no factor-by-factor independence argument is involved.

=== 15.1 Verification for the eight classes of prepared factors <app:joint-application>

We apply Lemma 38 on the union of the read coordinates of a finite selection in one fixed primary pattern. The scalar-coordinate covariance bound follows from (5.17); it is uniform in the pattern, its exterior, and the admitted period. Empty exterior means a zero-dimensional Gaussian and causes no exception. The complete read sets and attached profile rules are those of Appendix 14.

For the eight classes listed in Section 5.3, the following are the required envelopes and reserves.

+ The unassigned nonlinear rows have deterministic envelopes $C_L g "poly" \( M \, p \)$. Their normalized smooth derivatives retain that order: a cutoff derivative contributes $t^(- 1)$ together with a direction of size $t$ times its prescribed distance weight.
+ The stationary squares have order $g^2$; the $cal(N) \, cal(Z)$ remainders have exponential accuracy in $M$. Their fixed-order derivatives have the same envelopes by (5.21) and the truncated free-kernel estimates.
+ A remote canonical term retains (5.23), and a remote regular error retains its actual derivative norm. A nonremote term is a selected hard letter with the attached profiles prescribed in Appendix 14; it meets a compulsory core by its recorded nonremote test.
+ A kinetic tail retains every path and mask query. If it is smooth its exponential envelope suffices. If it is treated as a hard letter, that same exceptional envelope pays its fixed-order transport loss. The preparation is $1 + chi_(upright("att")) \( e^V - 1 \)$, so it introduces no unpriced cutoff failure.
+ The ratio-chain letters use (5.24). Their scalar endpoint counts are polynomial in their recorded loads and in $M$. To sum their eighth roots, fix a support exponent $B > 0$, a support hit, and a number $r gt.eq 1$ of residual hops. The finite-range convention of Section 14.1 gives $O \( M \)$ range for each matrix hop and window. There are at most $C_L M^D$ choices at each hop; choosing which of the $O \( r \)$ retained windows has its fixed $O \( M \)$ support neighborhood containing the hit costs only a further polynomial. Thus the number $N_r$ of literal paths is at most
  $ N_r lt.eq "poly" \( M \, r \) \( C_L M^D \)^(r + O \( 1 \)) . $
  For a resolvent chain, first integrate its coefficient in the resolvent parameter, using the integrable $\( 1 + u \)^(- 2)$ bound in Section 5.2. The envelopes $e_alpha$ then index discrete paths. Apply (5.20) with support exponent $8 B$ and Hölder’s inequality for this finite path set to obtain
  $ sum_(alpha : thin r upright(" hops")) e^(B s_alpha) e_alpha^(1 \/ 8) & lt.eq N_r^(7 \/ 8) (sum_(alpha : thin r upright(" hops")) e^(8 B s_alpha) e_alpha)^(1 \/ 8)\
 & lt.eq "poly" \( M \, r \) exp { - c_L M r \/ 8 + O_L \( r log M \) + C B r } . $
  This is summable over $r$ and tends to zero as $H$ increases. Since the envelopes are less than one, their square-root sum has the same upper bound. Increasing $H$ makes this support-hit sum less than $\( 64 c_(*) \)^(- 1)$. The exponential decrease in $M$ times the number of hops dominates the polynomial endpoint count, proving (15.1) as well.
+ The Haar-Jacobian letter is smooth and has order $g^2$ with its normalized derivatives, since the Jacobian has zero linear term.
+ The opened edge, observation and chart defaults are the failure factors. Equation (5.26) supplies the simultaneous bound with $tau = c_L p^2 \/ M^D$. It holds on all fixed-order derivative supports, by the prediction estimates and the retained support properties of Section 5.3.
+ An old covering weight retains its sup envelope. Its nonempty inventory supplies a marked primary input edge, hence a compulsory core. Its measurable physical-spin arguments are fixed by the common transport; the weight is never field-differentiated.

The compulsory core itself is (14.1). Its reserve, proved there on the retained profile and derivative supports, gives a deterministic envelope $e^(- kappa_L p^2 s_c)$ after increasing $H$. Normalized derivatives of its smooth factors or exponent cost only a fixed polynomial in $g^(- 1) \, M \, p$ and the total number of reads. The same reserve remains during interpolation of two core exponents at fixed physical spins, because both endpoints obey it.

For a smooth product without a hard factor, the ordinary derivative bounds already stated preserve the ordinary orders. In a product with hard physical-spin dependencies, use the single simultaneous transport at the end of Appendix 14. That calculation supplies the derivatives of the mean, covariance score, vector field and divergence required above. There are at most a polynomial number of placements at a fixed total derivative order. The $L^4$ norm of each score is bounded by a fixed polynomial of the number of reads and by fixed powers of $g^(- 1) \, M \, p$. Fixed powers of $M \, p$ can be absorbed in a further fixed power of $g^(- 1)$ for sufficiently large $H$. Every use that requires this loss has a core, failure or exceptional ratio/tail reserve by the eight cases just listed. A marked coupling, history or input discrepancy retains its own factor in these same bounds, using the window difference identity and the interpolation at fixed physical-spin arguments. For an input discrepancy, telescope a finite product into terms with one marked factor $F_(alpha \, 2) - F_(alpha \, 1)$. Its coefficient, regular-error or covering-weight difference supplies the replacement envelope in Corollary 39; the other factors use envelopes uniform for the two inputs. The marked support retains the same core or exceptional reserve whenever transport requires it.

Corollary 39 therefore proves (5.25). The support-hit sums of the resulting majorants are obtained exactly as at the end of the proof of Lemma 11: projected old records use (5.4), canonical paths use their fixed exponential weight, core patterns are paid by their $p^2$ reserve, and chains use (5.20). Reserve a further fixed positive amount of support exponent for the polynomial in total load. The conditions (5.42) leave this reserve while retaining $e^(- p^(3 \/ 10))$ for output-seeded components. This is a product estimate under one Gaussian, not an independence assertion about overlapping factors. Exact independence is used only for disjoint complete supports, where Lemma 37 proves it.


#bibliography("refs.bib", style: "ieee", title: [References])
