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

#align(center)[#text(size: 16pt, weight: "bold")[The Critical Spin Field of the Planar XY Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

The two-dimensional XY model has a massless phase without ordinary long-range order. Its expected large-scale description is Gaussian, but the spin is an exponential of an angular variable, not the angular variable itself. Identifying a height-field limit therefore does not by itself identify the spin field. At criticality a further difficulty is that a scale-dependent scalar factor may survive between the microscopic spin and its continuum normalization.

We prove a critical spin-field limit on a square with fixed boundary spins. The scalar normalization is the actual magnetization at the center of that square. This choice cancels the microscopic amplitude without assuming a power law, a logarithmic correction, or the existence of an asymptotic amplitude. The remaining spatial normalization is fixed by the lattice Green function.

=== 1.1 The physical critical parameter <the-physical-critical-parameter>

We first specify the critical inverse temperature using an infinite-volume quantity, independently of the field limit. For $R in bb(N)$, let

$ Lambda_R = \[ - R \, R \]^2 ∩ bb(Z)^2 \, #h(2em) E_R = { { x \, y } subset Lambda_R : \| x - y \| = 1 } . $

Every unordered edge occurs once. At inverse temperature $b > 0$, the free-box law is

#[#set math.equation(numbering: n => "(1.1)")
 $ 1 / Z_(R \, b) exp #h(-0.16667em) {b sum_({ x \, y } in E_R) cos \( theta_x - theta_y \)} product_(x in Lambda_R) frac(d theta_x, 2 pi) \, #h(2em) theta_x in bb(R) \/ \( 2 pi bb(Z) \) . $ <eq:free-spin-law>]

There are no exterior edges or fixed spins in this definition. Write

#[#set math.equation(numbering: n => "(1.2)")
 $ C_b \( r \) & = lim_(R arrow.r oo\
R gt.eq r) bb(E)_(R \, b) cos \( theta_0 - theta_(r e_1) \) \, #h(2em) e_1 = \( 1 \, 0 \) \,\
m \( b \) & = lim_(r arrow.r oo) - 1 / r log C_b \( r \) \, #h(2em) b_c = inf { b > 0 : m \( b \) = 0 } . $ <eq:critical-parameter>]

The free-box correlation and mass limits exist, $0 < b_c < oo$, and $m \( b_c \) = 0$. These are the usual phase-transition facts for the cosine convention (1.1); see [17] Theorem 1 and the normalization comparison in [15] Proposition 1.2. No critical exponent is included in the definition of $b_c$.

=== 1.2 The normalized spin field <the-normalized-spin-field>

For each integer $n gt.eq 1$, set

$ D = \( - 1 \, 1 \)^2 \, #h(2em) D_n = \[ - 1 \, 1 \]^2 ∩ n^(- 1) bb(Z)^2 \, #h(2em) D_n^compose = D_n ∩ D . $

Let $E_n$ contain all unordered nearest-neighbor pairs in $D_n$. Set $theta_x = 0$ on $D_n \\ D_n^compose$, and integrate only the interior angles in the probability law

#[#set math.equation(numbering: n => "(1.3)")
 $ 1 / Z_n^0 exp #h(-0.16667em) {b_c sum_({ x \, y } in E_n) cos \( theta_x - theta_y \)} product_(x in D_n^compose) frac(d theta_x, 2 pi) . $ <eq:pinned-spin-law>]

Its expectation is denoted by $bb(E)_n^0$. In particular edges incident to the fixed boundary are retained. Define

#[#set math.equation(numbering: n => "(1.4)")
 $ a_n = bb(E)_n^0 cos theta_0 = bb(E)_n^0 e^(i theta_0) > 0 . $ <eq:center-magnetization>]

Angle reflection proves the equality, and the positive Fourier-current expansion proves strict positivity. Thus $a_n$ is a specified observable of (1.3), not a sequence chosen to fit a limit.

On functions zero at the boundary let

$ \( L_n u \) \( x \) = sum_(y in D_n\
\| x - y \| = 1 \/ n) \( u \( x \) - u \( y \) \) \, #h(2em) G_n = L_n^(- 1) . $

The Laplacian is unscaled: it contains no factor $n^2$. Put $K_(*) = 2 \/ pi$, and define the complex random distribution

#[#set math.equation(numbering: n => "(1.5)")
 $ S_n = 1 / n^2 sum_(x in D_n^compose) a_n^(- 1) exp #h(-0.16667em) {frac(G_n \( x \, x \) - G_n \( 0 \, 0 \), 2 K_(*))} e^(i theta_x) delta_x \, #h(2em) delta_x \( f \) = f \( x \) . $ <eq:spin-field>]

The center factor and the Green correction in this definition are the same for every test function and every correlation order.

Let $Phi_D$ be the real zero-Dirichlet Gaussian free field with covariance $\( - Delta_D \)^(- 1)$. Its kernel has the convention

$ G_D \( z \, w \) = frac(1, 2 pi) log frac(1, \| z - w \|) + R_D \( z \, w \) \, $

where $R_D$ is smooth across the interior diagonal. For circle averages $Phi_(D \, epsilon.alt)$, taken where the circles lie in $D$, let

#[#set math.equation(numbering: n => "(1.6)")
 $ V_(*) = lim_(epsilon.alt arrow.b 0) exp #h(-0.16667em) {frac(i Phi_(D \, epsilon.alt), sqrt(K_(*))) + frac(bb(E) Phi_(D \, epsilon.alt)^2, 2 K_(*))} . $ <eq:target-field>]

The limit is understood as a complex random distribution tested against compactly supported smooth functions. This is the full-variance imaginary Gaussian chaos: its counterterm uses the entire variance, including its finite spatial part. In this convention

$ bb(E) V_(*) \( f \) = integral_D f \( z \) thin d z \, #h(2em) bb(E) #scale(x: 120%, y: 120%)[\[] V_(*) \( z \) overline(V_(*) \( w \)) #scale(x: 120%, y: 120%)[\]] = exp { G_D \( z \, w \) \/ K_(*) } \, $

where the second expression denotes the off-diagonal moment kernel. Its singularity has exponent $1 \/ 4$. Existence and the precise mixed-moment interpretation are recalled in Lemma 30; see also [4,14].

#thm([Theorem 1.1.])[
  #emph[For the fixed-boundary critical XY law (1.3), the distributions $S_n$ in (1.5) converge in law along the full sequence $n arrow.r oo$ to $V_(*)$ in $H_(upright("loc"))^(- 3) \( D \)$. Moreover, for every $k gt.eq 1$, every $f_1 \, dots.h \, f_k in C_c^oo \( D \; bb(C) \)$, and every collection of nonnegative integers $p_1 \, q_1 \, dots.h \, p_k \, q_k$, 
#[#set math.equation(numbering: n => "(1.7)")
 $ bb(E)_n^0 product_(j = 1)^k S_n \( f_j \)^(p_j) overline(S_n \( f_j \))^(thin q_j) arrow.r bb(E) product_(j = 1)^k V_(*) \( f_j \)^(p_j) overline(V_(*) \( f_j \))^(thin q_j) . $ <eq:main-moment-convergence>]

 The joint laws of these complex smeared fields converge as well.]
] <thm:main>

Here $H_(upright("loc"))^(- 3) \( D \)$ consists of distributions $T$ such that $chi T$, extended by zero, belongs to $H^(- 3) \( bb(R)^2 \)$ for every $chi in C_c^oo \( D \)$, with the usual local topology. The theorem includes nonneutral moments: there is no requirement that the total number of fields equal the total number of conjugate fields.

The critical input is the Bessel-height coefficient and the height and pin limit theorems of [15]. Their exact statements and conventions are recorded in Section 2; the critical coefficient there is $a \( b_c \) = 8 pi$, giving $K_(*) = a \( b_c \) \/ \( 4 pi^2 \)$. We also use the finite comparisons and field lemmas identified in [14]. We do not deduce the result by continuing a low-temperature spin theorem to $b_c$. Nor does Theorem 1 assert an asymptotic formula for $a_n$, or by itself transfer the result to the free-boundary infinite-volume correlation. Such a transfer would require additional amplitude and boundary-to-bulk information.

=== 1.3 Historical context and related work <historical-context-and-related-work>

The distinction between absence of magnetization and slowly decaying correlations is central to the two-dimensional XY model. Mermin and Wagner [9] established the low-dimensional obstruction to conventional order for isotropic Heisenberg systems. For classical planar spins, McBryan and Spencer [8] obtained quantitative power-law upper bounds on correlations. Berezinskii [1] developed the algebraic low-temperature picture and argued for a phase transition. Kosterlitz and Thouless [6] proposed the transition mechanism through the behavior of topological defects. The ensuing renormalization-group theory predicts the critical exponent $1 \/ 4$ and renormalized stiffness $2 \/ pi$ [5,10].

Fröhlich and Spencer [3] proved a low-temperature phase with power-law lower bounds for the rotator model and related systems. Van Engelenburg and Lis [17] Theorem 1 established a sharp exponential-versus-polynomial dichotomy for free infinite-volume XY correlations, including a polynomial lower bound at the threshold. Lammers [7] Theorem 1 related the spin and dual-height correlation lengths and identified the coincidence of the XY transition with dual-height delocalization. These results identify the physical threshold in Equation (1.2); they do not supply the critical spin-field limit.

Gaussian descriptions of angular fluctuations also have rigorous precedents. Newman and Wu [12] Theorem 2 proved Gaussian limits for angular-gradient observables in a joint zero-temperature and continuum regime. The companion [14] Theorem 7.6 treats the exponential spin field at sufficiently low fixed temperature. The critical coefficient and fixed-geometry Bessel-height inputs used here come instead from [15] Section 6 and Theorems 2.4, 3.1, 3.2. Our task is to pass from these critical inputs to the spin field, retaining the actual center magnetization as normalizer and treating all signed correlations, including nonneutral ones.

The proof begins with integer-current and planar-height duality [17] Section 2. The finite comparisons descend from the lattice-Gaussian inequalities of Regev and Stephens-Davidowitz [16], in their Bessel-height form in [15]. The target belongs to the theory of imaginary Gaussian multiplicative chaos developed by Junnila, Saksman and Webb [4]. To pass from correlations to field laws and moments, we use the Lee–Yang theorem for planar rotators [2] and its moment-generating-function inequalities [11], in the finite-volume formulation of Newman and Wu [13]. The sharp comparison for holes of positive radius and the control of arbitrarily many annular interfaces are developed below.

=== 1.4 Proof strategy <proof-strategy>

Fourier expansion turns a product of spins into a ratio of height partition functions. A spin insertion prescribes an integral winding of the dual height around its location. We call a height law with such prescribed windings a magnetic sector. Fixed spin boundary conditions give free dual heights, modulo one common integer translation.

The height limit does not directly determine a magnetic-sector ratio when a puncture has the size of one lattice spacing. We first keep every puncture at a positive macroscopic radius. For such fixed domains, Section 3 proves the sharp Gaussian variational formula. Its upper bound uses divergence-free tests. Its lower bound introduces quadratic penalties on box averages, uses separated-pin estimates to compare pieces, and refines the observation cells to recover the Dirichlet energy. All height limits occur at fixed geometry.

To return to microscopic punctures, we surround each spin insertion by a sequence of annuli. At an interface, the gluing kernel is the partition-function factor for restoring the deleted bonds, conditional on all height differences in a separating band. The integer constant between two pieces is still summed. This relative-data convention is essential both for exact factorization and for the treatment of the free constant mode.

Sections 4 and 5 give two different controls on these kernels. After division by their centered zero-data value, they lie between zero and one for every datum. Their average loss from one is small on long, approximately circular annuli, including in a unit magnetic sector. These estimates are not multiplied into an error proportional to the number of scales. Instead, a contraction on mean-zero functions shows that an arbitrary fixed microscopic core eventually produces a last-band density bounded by two relative to the free annulus law. The core may have an arbitrarily poor initial gluing factor; positivity is enough.

We then attach all the annular sequences to one exterior region. The exterior has positive-radius holes and is governed by the variational formula already proved. The entire microscopic contribution is the same for every unit insertion and for the single insertion defining $a_n$. Subtracting the corresponding logarithms cancels that contribution exactly. Section 6 computes the remaining Green-function interaction and proves uniform convergence on separated compact configurations.

The final step needs more than separated correlations. A weaker, integrable two-point bound controls collisions uniformly in $n$. Together with positivity and the Lee–Yang moment estimate, it removes every collision region from every mixed moment, without requiring a sharp pointwise bound for higher correlations. Section 7 then identifies the moments, proves moment determinacy, and obtains local Sobolev tightness.

The sharp fixed-hole comparison and the positive-kernel stability argument are the transferable parts of the proof. They separate fixed-geometry Gaussian information from the microscopic normalization, and use averaged control of conditional data where a uniform conditional limit is unavailable.

== 2 Free heights and finite comparisons <sec:heights>

The fixed spin boundary becomes a free boundary after duality. We first establish this correspondence, including nonneutral charges, and then record the height limits that we use from [15]. The finite comparisons must keep track of independent additive constants and prescribed data consisting only of height differences. We spell out how the cited inequalities apply with these conventions.

=== 2.1 Partition sums and fixed-spin duality <partition-sums-and-fixed-spin-duality>

Choose one orientation of every edge of a finite nearest-neighbor graph $G = \( V \, E \)$, and write $nabla_e h = h_y - h_x$ for $e = \( x \, y \)$. We call its vertices and edges primary, to distinguish them from the auxiliary subdivisions used below. An #emph[integral connection] is an antisymmetric edge function $alpha$ with values in $2 pi bb(Z)$. The height variables lie in $2 pi bb(Z)$, and their edge weights are

#[#set math.equation(numbering: n => "(2.1)")
 $ p_b \( j \) = e^(- b) I_j \( b \) \, #h(2em) product_(e in E) p_b (frac(nabla_e h + alpha_e, 2 pi)) . $ <heights:weights>]

Here $I_j$ is the modified Bessel function. The symmetry $p_b \( j \) = p_b \( - j \)$ makes the chosen orientations immaterial. We will occasionally include an observation penalty $exp { - parallel B h - v parallel^2 \/ 2 }$, where $B$ is a finite real linear map and $v$ is a prescribed real vector. Retained observation penalties are sums of component-local forms in every cut topology considered: each row of $B$ is supported in one component. Within each component they either annihilate its constant or confine it.

A component with no absolute constraint or confining observation is summed modulo one common translation by $2 pi bb(Z)$. On a component whose constant is confined by observations, all translation copies are summed. An absolute height pin fixes that constant instead. These conventions also apply after an edge cut produces several components. Thus fixing a representative on each cut piece does not fix the relative translations when the pieces are subsequently joined.

Write $s$ for the collection of shifts, including $alpha$ and any observation centers, and let $Z_G^s$ be the corresponding partition sum with counting measure and the preceding constant convention. The superscript $0$ means zero connection and zero observation centers, with all cuts and quadratic penalties retained. Set

#[#set math.equation(numbering: n => "(2.2)")
 $ F_G^s = Z_G^s / Z_G^0 . $ <heights:sector-ratio>]

If data $u$ are prescribed on a set $p$, then $Z_G^s \( u \)$ denotes the partition sum with those data imposed, not their probability. Data can specify every height on $p$, or every difference from a chosen site of $p$. In the second case the common height on $p$ is still free. Each such relative-data set lies in one component of every topology being compared; data on several components are specified separately. We prescribe only compatible lattice data.

Changing $alpha$ by the gradient of a $2 pi bb(Z)$-valued function and changing the height variable by the opposite function is an exact reindexing of the sum. Observation centers and prescribed data must be changed at the same time. We refer to this reindexing as an integral gauge change. A connection is #emph[flat] on a region if its circulation around every contractible cycle there is zero; on a multiply connected region its remaining circulations are called its periods.

We use the classical Fourier-current duality in the formulation of [17] Section 2, with the fixed-spin boundary convention checked in the following proof.

#thm([Lemma 2.1.])[
  (Duality for the fixed spin boundary).  #emph[Let $cal(G)_n$ have as vertices the centers of the lattice squares in $\[ - 1 \, 1 \]^2$, and join centers of neighboring squares. This is the free dual square grid. Given integers $l_x$, indexed by the interior primal vertices, choose an integral connection $s$ on $cal(G)_n$ whose circulation around $x$ is $2 pi l_x$, with a consistent choice of orientation. Then 
$ bb(E)_n^0 exp (i sum_x l_x theta_x) = F_(cal(G)_n)^s . $

 Such a connection exists without a neutrality assumption. If holes containing the charged vertices are removed, its restriction to the remaining graph is flat, with periods specified by the enclosed charges. On that graph the bare partition ratio depends only on those periods.]
] <heights:duality>

#proof[
  Edges lying along the spin boundary have both endpoints fixed at zero, so their interaction factors cancel from the expectation. Expand every other interaction as
  $ e^(b cos \( theta_x - theta_y \)) = sum_(j in bb(Z)) I_j \( b \) e^(i j \( theta_x - theta_y \)) . $
  Integration imposes divergence conditions only at interior vertices. For the numerator these are the prescribed integer charges, with their sign determined by the current orientation; the denominator has zero divergence. There is no condition at a boundary vertex. Consequently one can construct a current carrying each charge along a path to the boundary, whether or not the total charge vanishes.
  Subtract that fixed current in the numerator and rotate the remaining edge variables onto the dual edges. Every retained primal edge crosses exactly one edge of $cal(G)_n$. Every cycle of $cal(G)_n$ is generated by the elementary cycles around interior primal vertices, so the rotated zero-divergence current is a closed integral form. Integration along dual paths represents it as $nabla h \/ \( 2 pi \)$, uniquely modulo one common height translation. The subtracted current gives the connection $alpha$. The factors $e^b$ needed to replace $I_j \( b \)$ by $p_b \( j \)$ cancel. This proves the identity and also its positivity.
  After holes are removed, any contractible cycle encloses no remaining charge, while a cycle winding around a hole has circulation equal to the total charge in that hole. Two integral flat connections with the same periods differ by an integral gradient: integrate their difference from a fixed vertex, using vanishing circulation for path independence. The last assertion follows by gauge change. ◻
]

=== 2.2 The cited height limits <the-cited-height-limits>

For a finite graph $G$, let $A_G$ be its unscaled, unit-conductance Laplacian, so that

$ chevron.l g \, A_G g chevron.r = sum_({ x \, y } in E \( G \)) \( g_x - g_y \)^2 . $

Pairings here use counting measure. On a free square of side $m$ in lattice units, set $g_m \( x \) = x_1 \/ m$. The coefficient of [15] is

$ a \( b \) = lim_(m arrow.r oo) "Var" chevron.l h \, A_G g_m chevron.r . $

The existence of this limit and the limit theorems below are cited results about the Bessel weights (2.1).

#thm([Theorem 2.2.])[
  (Critical height coefficient [15] Section 6).  #emph[For the free-box spin mass threshold $b_c$ of Section 1, the Bessel height coefficient satisfies $a \( b_c \) = 8 pi$.]
] <heights:critical-input>

The parameter and normalization in this theorem agree with ours: [15] uses the weight $e^(- b) I_j \( b \)$, height spacing $2 pi$, and one copy of each unoriented edge. Its threshold is defined by the same free-square spin mass. We use this as an independent theorem of [15]; it is not a consequence of the low-temperature spin theorem of [14]. In the remainder of the paper,

$ b = b_c \, #h(2em) a = 8 pi \, #h(2em) K_(*) = frac(a, 4 pi^2) = 2 / pi . $

The following limit statements use three types of height observations. A box average means

$ h_Q = frac(1, \| Q_n \|) sum_(x in Q_n) h_x \, $

where $Q_n$ is the set of primary vertices in the discretized box. A smear $chevron.l h \, f_n chevron.r = sum_x h_x f_n \( x \)$ on a free component is defined only when $sum_x f_n \( x \) = 0$ exactly. A continuum mean-zero density $f$ is represented by such profiles $f_n$ whose piecewise constant scaled densities $n^2 f_n$ converge to $f$ in $L^2$; sampled profiles can be centered by subtracting their discrete average. For a free component with vertex set $V_n$, its fractional mean is $\( \| V_n \|^(- 1) sum_(x in V_n) h_x \) med mod med 2 pi$, which is well-defined on the height quotient.

#thm([Theorem 2.3.])[
  (Free rectangle limits [15] Theorem 2.4).  #emph[Let $U_n$ be free axis-parallel rectangles at mesh $n^(- 1)$, with endpoints converging to those of a nondegenerate rectangle $U$. For any finite collection of smooth functions defined near $overline(U)$, the observations $chevron.l h \, A_(U_n) g chevron.r$ converge jointly, in Laplace transforms and all moments, to centered Gaussians with covariance 
$ a integral_U nabla g dot.op nabla g' . $

 For bounded piecewise continuous mean-zero densities and the exactly centered profiles just specified, height smears converge jointly in Laplace transforms and all moments, with covariance $a \( - Delta_(U \, N) \)^(- 1)$, where the inverse is on mean-zero functions.]
] <heights:free-input>

We next specify the domains for the mixed version of this theorem. This will let us use rectangular partitions and cut regions without requiring a limit theorem for arbitrary varying domains.

#prodef([Definition 2.4.])[
  (Fixed mixed geometry).  A fixed mixed geometry is a finite union of bounded axis-parallel rectangular pieces with nondegenerate widths and faces. Pieces belonging to one component meet along full interfaces, which may be subdivided into segments. Components are polygonal Lipschitz domains, and no two parts are joined solely through a point. A pin region is an aligned finite union of positive-area boxes; pinning it means setting every primary lattice height there to zero.
  Discretizations use the nearest-neighbor graph at mesh $n^(- 1)$. Boundaries may be rounded by a bounded number of lattice steps, preserving the faces, corners, and positive-width passages. Observation boxes lie within their respective components. A translated grid, such as the grid of dual square centers, uses the same relative alignment and rounding conventions.
] <heights:geometry>

#thm([Theorem 2.5.])[
  (Mixed height limits [15] Theorem 3.1).  #emph[In any fixed mixed geometry, the centered massless Bessel height law with primary hard pins has Gaussian Laplace and moment limits for each finite collection of bounded piecewise continuous density smears. On a component $U$ meeting a pin $p$, the covariance is the inverse of the form 
$ a^(- 1) integral_U \| nabla u \|^2 quad upright("on") quad { u in H^1 \( U \) : u = 0 upright(" almost everywhere on ") p } . $

 Free walls have the variational Neumann condition. On an unpinned component, the assertion concerns mean-free smears; the fractional mean modulo $2 pi$ tends to an independent uniform variable.]
  #emph[A fixed finite-rank nonnegative quadratic penalty in box averages gives the corresponding Gaussian limit. When the penalty controls every unpinned component constant, lattice translation copies are summed and the limiting constants are integrated. The assertions hold along every admissible sequence of rounded discretizations.]
] <heights:mixed-input>

The next input concerns an interaction of rare pin events, not their individual probabilities. It is this ratio that will control the cost of restoring cut edges.

#thm([Theorem 2.6.])[
  (Separated primary pins [15] Theorem 3.2).  #emph[In a fixed mixed geometry, start with no hard pins and add the centered penalty $parallel B h parallel^2 \/ 2$, where $B$ is a fixed finite list of component-local box averages controlling every component constant. For positively separated pin regions $H \, p$, put 
$ D_n \( H \, p \) = log frac(bb(P) \( h_H = 0 divides h_p = 0 \), bb(P) \( h_H = 0 \)) . $

 Then $D_n \( H \, p \) gt.eq 0$ and it converges to the Gaussian pin interaction for the Hilbert-space inner product associated with 
$ cal(T) \( u \) = a^(- 1) sum_U integral_U \| nabla u \|^2 + parallel B u parallel^2 \, #h(2em) u in xor.big_U H^1 \( U \) . $

 More precisely, with orthogonality and projections taken for $cal(T)$, 
#[#set math.equation(numbering: n => "(1)")
 $ V_Q = { u : u = 0 upright(" almost everywhere on ") Q }^(perp_(cal(T))) \, #h(2em) Pi_Q = "proj"_(V_Q) \, #h(2em) C = Pi_H \|_(V_p) \,\
D_n \( H \, p \) arrow.r - 1 / 2 log det \( 1 - C^(*) C \) . $ <eq:source-1>]

 The operator $C$ is Hilbert–Schmidt and has norm strictly below one.]
] <heights:pin-input>

The determinant formula is the Gaussian pin formula used in [15] Theorem 3.2; its mixed-domain formulation is given in [14] Proposition 3.14. Each use below fixes the geometry, the observation boxes, and the positive separation before refining the lattice. Further limits in cell size or geometric separation are taken afterward. No conclusion uniform over all microscopic pin data is included in these inputs.

=== 2.3 Affine comparisons and edge restoration <affine-comparisons-and-edge-restoration>

We now pass from these limit inputs to comparisons on individual finite graphs. The affine inequality of [15] Lemma 2.2 already includes real observation centers and real numerator tilts. We recall its Gaussian-chain proof before spelling out its application to cut graphs, relative data, and independently released constants. All comparisons in this subsection take place on fixed finite graphs.

#thm([Lemma 2.7.])[
  (Finite comparison rules).  #emph[Allow nonnegative quadratic observation penalties and compatible linear equality constraints on a finite primary height graph. The following comparisons hold.]
  + #emph[Increasing centered precision decreases centered covariance. Consequently, in a proper centered law, the probability of an additional centered linear equality increases under a centered precision increase. The same assertion holds in a quotient law for equalities invariant under its released constants.]
  + #emph[A shifted-to-centered partition ratio is at most one and decreases when the same nonnegative precision is added in the affine and centered coordinates. Shifts may include integral connections, nonzero prescribed data, and arbitrary real observation centers. The monotonicity persists with a fixed real linear statistic in the numerator exponent; the bound by one is not asserted for that tilted ratio.]
  + #emph[Equality constraints are obtained by increasing their quadratic penalties to infinity. Free constants can be released when all data and real tests in question are invariant under those constants.]
] <heights:finite-comparisons>

#proof[
  We first give the Gaussian comparison that will implement an edge restoration. Let $Lambda$ be a lattice in a real Euclidean space, let $z + Lambda$ be a translate, and let $T$ be positive definite. For $Q gt.eq 0$, $t gt.eq 0$, and a fixed real linear functional $ell$, put
  $ R \( t \) = frac(sum_(x in z + Lambda) e^(- chevron.l x \, \( T + t Q \) x chevron.r \/ 2 + ell \( x \)), sum_(x in Lambda) e^(- chevron.l x \, \( T + t Q \) x chevron.r \/ 2)) . $
  The relevant lattice-Gaussian inequalities originate in the work of Regev and Stephens-Davidowitz [16] Theorem 2.1 and Corollary 3.2. The covariance under the numerator law dominates that under the centered denominator law; see [14] Lemma 2.1. If $m_(z \, ell)$ and $"Cov"_(z \, ell)$ denote the numerator mean and covariance, and $"Cov"_0$ the denominator covariance, differentiation gives
  $ frac(d, d t) log R \( t \) = - 1 / 2 "Tr" Q ("Cov"_(z \, ell) - "Cov"_0 + m_(z \, ell) m_(z \, ell)^(sans(T))) lt.eq 0 . $
  For a proper affine subspace, first complete the square in its parallel span. The remaining offset is orthogonal for the current precision $T + t Q$; the covariance on the parallel span is that of a translated, tilted lattice Gaussian with the restricted precision. Thus its covariance still dominates the centered covariance, while the raw mean $m_(z \, ell)$ includes the fixed offset. The centered maximum of a Gaussian lattice sum gives the untilted bound $R \( t \) lt.eq 1$.
  To obtain the Bessel law, replace each primary edge by $N$ independent integer increments with normalized weight $q_N^(j^2)$, where $q_N = b \/ \( 2 N \)$; their physical height increments are $2 pi j$. Uniformly for $u$ in compact real sets,
  $ frac(sum_(j in bb(Z)) q_N^(j^2) e^(u j), sum_(j in bb(Z)) q_N^(j^2)) = 1 + b / N \( cosh u - 1 \) + O_u \( N^(- 2) \) . $
  Their sum tends to the probability weight $p_b$, since its limiting moment generating function is $exp { b \( cosh u - 1 \) }$. Matching endpoints, cycles, periods, and prescribed data gives parallel affine lattices for the numerator and denominator. Appending the residual coordinates $B h - v$ allows arbitrary real observation centers. Thus adding a quadratic penalty or a matching constraint is precisely the precision increase just considered. Centered covariance decreases under such increases by the same finite Gaussian comparisons; see [14] Lemma 2.1.
  All limits just described are on a fixed primary graph. A spanning forest expresses every height difference as a sum of full-chain increments, which have uniformly bounded exponential moments at each fixed real argument. The other normalized edge weights are at most one. This bounds the partition sums, their fixed real tilts, and any polynomial factors. A confined component constant is summed against its Gaussian penalty. Dominated convergence therefore passes the comparisons to $p_b$, as in [15] Lemma 2.2. Equality limits use monotone convergence of the penalties; only nonempty affine fibers are used. For centered pin monotonicity, first use a finite pin penalty. The derivative of the logarithm of its expectation under an additional centered precision $Q$ is $1 / 2 "Tr" Q \( "Cov"_(upright("unpinned")) - "Cov"_(upright("pinned")) \) gt.eq 0$. Then increase the pin penalty to infinity. The release of unconfined constants, including across cuts, is justified next. ◻
]

#thm([Lemma 2.8.])[
  (Cut comparison with prescribed data).  #emph[Let $G^(upright("cut"))$ be obtained from $G$ by deleting edges, with the same observation penalties and compatible prescribed data on both graphs. Each retained observation and each relative-data set is component-local in $G^(upright("cut"))$. Whenever the free constants are left free by those data, 
$ frac(Z_G^s \( u \), Z_G^0 \( 0_p \)) lt.eq frac(Z_(G^(upright("cut")))^s \( u \), Z_(G^(upright("cut")))^0 \( 0_p \)) . $

 The conclusion also holds with absolute data fixing some constants and with observations confining others. It holds for a fixed real numerator tilt on affine edge increments if each deleted increment is retained independently, with its tilt, on the cut side. Every real test on a released component must annihilate its constant.]
] <heights:cut-comparison>

#proof[
  For a deleted edge $e = \( x \, y \)$, retain an independent chain with total increment $J_e in 2 pi bb(Z)$. Its normalized sum without matching is one. Restoring that edge imposes the equality
  $ J_e - h_y + h_x - alpha_(x y) = 0 \; $
  the centered equality has $alpha_(x y) = 0$. On the enlarged affine coordinates this amounts to increasing the coefficient of the square of the displayed residual to infinity. The prescribed-data fibers in numerator and denominator are parallel lattices. This remains true for relative data $h_z - h_(z_0) = u_z$, since these are linear equality constraints. Lemma 8 gives the comparison. Integration of the matched chain contributes $p_b \( \( h_y - h_x + alpha_(x y) \) \/ \( 2 pi \) \)$, and all independent-chain normalizers cancel. For a real edge tilt, use $J_e$ on the enlarged graph. On matching it is precisely the affine edge increment in the restored graph, so the tilted comparison applies with no additional scalar.
  Here is the promised treatment of constants. Before comparing, add an auxiliary site penalty $delta sum_x h_x^2 \/ 2$ and sum all translations. For a free component with $m$ vertices, a translation orbit represented by $h$, with mean $macron(h)$, contributes
  $ e^(- delta / 2 sum_x \( h_x - macron(h) \)^2) sum_(k in bb(Z)) e^(- frac(m delta, 2) \( macron(h) + 2 pi k \)^2) . $
  Divide its translation sum by
  $ c_(m \, delta) = frac(1, 2 pi) sqrt(frac(2 pi, m delta)) . $
  Poisson summation shows that the quotient of the sum by $c_(m \, delta)$ tends uniformly in $macron(h)$ to one and is uniformly bounded for small $delta$. The first factor is at most one and tends pointwise to one. Forest exponential-moment bounds again give domination, also for fixed real tilts invariant under the released constant. Thus the regularized sum divided by one $c_(m \, delta)$ per free component tends to the quotient sum. Within each shifted-to-centered ratio, its component factors cancel. They cancel separately on the cut and restored sides, although those graphs can have different numbers of components.
  On a component already fixed by absolute data or confined by observations, the auxiliary penalty is removed by ordinary dominated convergence, with no divergent factor. This also covers comparison of an unconfined ratio with a ratio in which new observations confine every component: cancellation is performed separately in each ratio. Semidefinite intermediate forms cause no difficulty, since the auxiliary penalty makes every sum proper before the limit. Finally take the chain limit at fixed primary graph as in Lemma 8. ◻
]

In particular, the bare ratios satisfy

#[#set math.equation(numbering: n => "(2)")
 $ 0 < F_G^s lt.eq 1 \, #h(2em) F_G^s lt.eq F_(G^(upright("cut")))^s \, $ <eq:source-2>]

where the connection on the right is the restriction to the cut graph. Deleting an additional region gives the same domain comparison: first cut all its incident edges, then discard its partition ratio, which is at most one.

#thm([Corollary 2.9.])[
  (Restoration at prescribed data).  #emph[For an edge restoration with prescribed absolute or relative data on $p$, define 
$ T^s \( u \) = frac(Z_(upright("restored"))^s \( u \), Z_(upright("cut"))^s \( u \)) \, #h(2em) d = T^0 \( 0_p \) . $

 Use quotient constants on free components and sum all relative integer translations when components are joined. Then 
$ 0 < T^s \( u \) lt.eq d . $

]
] <heights:restoration>

#proof[
  The cut comparison reads
  $ frac(Z_(upright("restored"))^s \( u \), Z_(upright("restored"))^0 \( 0_p \)) lt.eq frac(Z_(upright("cut"))^s \( u \), Z_(upright("cut"))^0 \( 0_p \)) . $
  Rearranging gives the claim. Every factor is positive and finite: on a finite quotient graph the forest bound proves finiteness, and all Bessel weights are positive. A joined component has only one global quotient, so the numerator sums the relative constants that the cut denominator quotients separately. ◻
]

The comparison is pointwise in the prescribed data. Its role is to bound a restoration factor by its centered zero-data value. Lower bounds will instead come from averaging separated pin comparisons; they will not require a conditional limit uniform over microscopic height data.

== 3 Magnetic sectors with holes of positive radius <sec:sectors>

We first determine the sector ratio on a fixed domain whose holes have positive radius. The holes remove every source of the connection, but retain its periods. The height limits of Section 2 then determine the cost of these periods through a variational energy. This result will be used before any hole radius is allowed to shrink.

=== 3.1 The sector theorem and its upper bound <the-sector-theorem-and-its-upper-bound>

Let $U$ be a bounded connected polygonal domain with a simple outer boundary and finitely many simple polygonal holes. All sides are parallel to the coordinate axes and have dyadic endpoints. The closures of the holes are mutually disjoint and lie strictly inside the outer boundary; every boundary segment has positive length. In particular, $U$ is Lipschitz and has no point contacts. The graph $cal(G)_n \( U \)$ is the nearest-neighbor discretization at mesh $n^(- 1)$, with free boundary and coherent array rounding as in Definition 5.

Fix integral periods around the holes, in units of $2 pi$, and a smooth closed one-form $d v_0$ with these periods, defined on a neighborhood of $overline(U)$. Here $v_0$ denotes a multivalued primitive: its local branches differ by constants and its differential is single-valued. A sum of integer multiples of angle functions, with centers in the holes, provides such a form. Let $alpha_n$ be an integral connection on $cal(G)_n \( U \)$, flat away from the holes, with the prescribed periods. Its sector ratio is denoted by $F_(U \, n)^s$. Changing $alpha_n$ by an integral gradient leaves this ratio unchanged.

#thm([Theorem 3.1.])[
  (Sector cost at fixed geometry).  #emph[For the domain and periods just specified, at $b = b_c$ and $a = 8 pi$, 
#[#set math.equation(numbering: n => "(3)")
 $ lim_(n arrow.r oo) F_(U \, n)^s = exp { - cal(M) \( U \) \/ \( 2 a \) } \, #h(2em) cal(M) \( U \) = inf_(g in H^1 \( U \)) integral_U \| d v_0 + d g \|^2 . $ <eq:source-3>]

 The limit holds along every admissible mesh-rounding sequence. The variational energy depends only on the periods.]
] <sectors:positive-radius>

The upper bound extends the divergence-free real-tilt argument of [15] proof of Proposition 2.6 to this fixed multiply connected domain. For the lower bound we add strong, spatially distributed confinement. Its separated zero-pin interactions vanish, which controls the restoration loss after averaging over guard data. We can then slit every hole, apply the single-valued height limit on the resulting pieces, and restore the cuts.

#proof[
  Choose a smooth stream function $psi$ constant in a neighborhood of each boundary component, allowing different constants on different components, and put $w = nabla^perp psi$. Thus $w$ vanishes near the boundary. Sample $psi$ on the faces of the height graph and take oriented differences across its edges. This gives an exactly divergence-free edge flow $w_n$, supported away from the boundary, whose coefficients are $n^(- 1) w$ to first order. The form $d v_0$ and $alpha_n$, integrated along lattice edges, have the same cycle periods. Their difference is therefore a real gradient. Consequently
  $ D'_n = sum_e w_(n \, e) \( nabla_e h + alpha_(n \, e) \) = sum_e w_(n \, e) alpha_(n \, e) arrow.r integral_U w dot.op d v_0 $
  is deterministic.
  Insert $e^(D'_n)$ into the sector numerator. Partition $U$ into dyadic squares of side $d$, with $d$ fixed and aligned with the boundary, and cut all edges between distinct squares. In applying Lemma 9, retain an independent Bessel increment on each cut edge and place that edge’s tilt on this increment. Restoring the edge identifies the increment with the affine height difference, so the statistic has not changed. The normalized tilted sector sum is bounded above by the resulting product of centered Laplace transforms. On each square the connection is an integral gradient and disappears by reindexing heights. Since the tilt is on the affine differences, this reindexing introduces no scalar tilt factor.
  Here is the limiting bound on that product. On the internal edges of each square replace the coefficients of $w_n$ by $n^(- 1)$ times one constant vector sampled there, and set the replacement to zero on cut edges. For fixed $d$, the sum of squared errors on cut edges is $O_d \( n^(- 1) \)$: there are $O_d \( n \)$ such edges and every coefficient is $O \( n^(- 1) \)$. The remaining squared error has a limsup tending to zero as $d arrow.b 0$, by smoothness of $w$. The free-square Laplace limit in Theorem 4 applies to the constant-vector tests. Their total limiting log transform is $a \/ 2$ times the corresponding Riemann sum for $integral_U \| w \|^2$.
  For completeness, the errors can be kept inside the transforms. Apply Hölder’s inequality with exponent $p > 1$ to the constant-vector part. Bound the transform of the error, at the conjugate exponent, by freeing all Bessel increments. For every fixed tilt multiple,
  $ log bb(E) exp #h(-0.16667em) {sum_e r_e J_e} lt.eq C sum_e r_e^2 $
  when the $J_e$ are independent increments of law $p_(b_c)$ in height units and the $r_e$ are uniformly bounded. This follows from $bb(E) e^(t J_e) = exp { b_c \( cosh \( 2 pi t \) - 1 \) }$. First let $n arrow.r oo$, then $d arrow.b 0$, and finally $p arrow.b 1$. We obtain
  #[#set math.equation(numbering: n => "(3.1)")
   $ limsup_(n arrow.r oo) log F_(U \, n)^s lt.eq - integral_U w dot.op d v_0 + a / 2 integral_U \| w \|^2 . $ <sectors:dual-bound>]
  The fields $w$ just used are dense in the orthogonal complement of gradients in $L^2 \( U \; bb(R)^2 \)$. Indeed, extend a field in that complement by zero outside $U$. Its distributional divergence vanishes, so in a larger simply connected box it has an $H^1$ stream function. This function is constant on every complementary component of $U$. Subtract a smooth function having the same constants near these components. The remainder has zero trace on $partial U$, and $H_0^1 \( U \)$ approximation now proves the density assertion. The gradient space is closed by the Poincaré inequality modulo constants. If $P$ is the orthogonal projection onto its complement, then $cal(M) \( U \) = parallel P thin d v_0 parallel_2^2$. Optimizing Equation (3.1) over the dense class, with optimizer $a^(- 1) P thin d v_0$, gives the required upper bound. ◻
]

=== 3.2 Confinement suppresses separated pin interactions <confinement-suppresses-separated-pin-interactions>

We next add one quadratic observation for each small cell. Although each observation has coefficient one, their number grows as the cell size decreases. This gives the lower-bound construction its spatial localization.

Fix one of the polygonal geometries of Definition 5 whose rectangular pieces have dyadic coordinates, possibly with finitely many components or cuts. Partition it into dyadic squares $Q$ of side $d$, aligning all boundaries and cuts, and write

$ u_Q = frac(1, \| Q \|) integral_Q u \, #h(2em) cal(T)_d \( u \) = a^(- 1) integral \| nabla u \|^2 + sum_Q u_Q^2 . $

The lattice observation on $Q$ is the average over its rounded array of vertices. Its penalty is one half of the square of that average. These observations control the constant on every component. For two positively separated unions of positive-area boxes $H \, p$ with dyadic coordinates, let $D_(n \, d) \( H \, p \)$ be the centered absolute-zero pin interaction of Theorem 7 for this law.

#thm([Lemma 3.2.])[
  (Localization under cell observations).  #emph[For every fixed dyadic mixed geometry and fixed dyadic pin regions $H \, p$ as above, 
#[#set math.equation(numbering: n => "(4)")
 $ lim_(d arrow.b 0) limsup_(n arrow.r oo) D_(n \, d) \( H \, p \) = 0 . $ <eq:source-4>]

 Here $d$ runs through dyadic values aligned with every fixed geometric division. The mesh limit is taken at each fixed $d$.]
] <sectors:localization>

#proof[
  At each fixed $d$, Theorem 7 identifies the limit with the Gaussian determinant in Equation (1). We prove that this determinant tends to one. Equip the component $H^1$ spaces with the norm $parallel u parallel_d^2 = cal(T)_d \( u \)$, and write
  $ V_Q = { u : u = 0 upright(" on ") Q }^(perp_(cal(T)_d)) \, #h(2em) C_d = Pi_H \|_(V_p) \, $
  where $Pi_H$ is orthogonal projection onto $V_H$. The letter $Q$ in this definition can denote a pin region; the observation cells remain the squares in the sum defining $cal(T)_d$.
  Rescale space by $d^(- 1)$. The observation cells are now unit squares. In dimension two the gradient energy is unchanged by this rescaling, and cell Poincaré gives, with constants independent of $d$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ c parallel u parallel_(H^1)^2 lt.eq cal(T)_d \( u \) lt.eq C parallel u parallel_(H^1)^2 quad upright("in these rescaled coordinates") . $ <sectors:cell-coercivity>]
  There are $N_d = O \( d^(- 2) \)$ cells. If $f in V_p$, then $cal(T)_d \( f \, phi.alt \) = 0$ for every $phi.alt$ vanishing on $p$. In particular $f$ is form-harmonic off $p$.
  We record the cutoff estimate, including the observation terms. Take a Lipschitz cutoff $chi$ vanishing near $p$, with transition width and Lipschitz constant bounded in cell units, and test with $chi^2 f$. The gradient part satisfies
  $ integral nabla f dot.op nabla \( chi^2 f \) gt.eq 1 / 2 integral chi^2 \| nabla f \|^2 - C integral_({ nabla chi eq.not 0 }) f^2 . $
  On cells where $chi = 1$, the observation contribution is $f_Q^2$. On transition cells its absolute value is at most $C parallel f parallel_(L^2 \( Q \))^2$, by Cauchy–Schwarz. Thus the energy on the plateau is bounded by the $L^2$ mass in a fixed enlargement of the transition layer. The test is also admissible at a free side, where no boundary value is prescribed.
  To iterate the estimate, let $E_r$ be the sum of cell energies at cell-center distance at least $r$ from $p$. Choose $chi$ zero up to distance $r + 2$ and one beyond $r + 6$. By Equation (3.2), enlarging the layer by a fixed number of cells gives
  $ E_(r + 10) lt.eq C \( E_r - E_(r + 10) \) . $
  Iteration gives exponential decay in cell distance. The fixed positive separation of $H$ and $p$ is of order $d^(- 1)$ in these coordinates. Multiplying $f$ by a cutoff equal to one near $H$ and supported away from $p$ therefore produces an extension of its $H$-data of energy at most $C e^(- c \/ d) parallel f parallel_d^2$. Orthogonal projection gives the least-energy extension of these data, so, after adjusting the constants,
  #[#set math.equation(numbering: n => "(3.3)")
   $ parallel C_d parallel lt.eq delta_d \, #h(2em) delta_d = C e^(- c \/ d) . $ <sectors:operator-decay>]
  An operator-norm bound alone does not control the determinant. We also need a summable singular-value bound. For an integer $m gt.eq 1$, restrict $f in V_p$ by requiring its Neumann cosine coefficients on every unit cell, for frequencies $0 lt.eq k_1 \, k_2 lt.eq m$, to vanish. The codimension is at most $C N_d m^2$, and the cell spectral inequality gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ parallel f parallel_(L^2 \( Q \)) lt.eq C m^(- 1) parallel nabla f parallel_(L^2 \( Q \)) . $ <sectors:cell-high-modes>]
  Choose nested neighborhoods $cal(N)_1 subset cal(N)_2 subset cal(N)_3$ of $H$, each a union of cells and separated from $p$. Leave fixed-width buffers, in cell units, between successive neighborhoods and between $H$ and the relative boundary of $cal(N)_1$. The neighborhoods may meet free walls. Define
  $ E_j \( f \) = sum_(Q subset cal(N)_j) (a^(- 1) integral_Q \| nabla f \|^2 + f_Q^2) . $
  Use cutoffs equal to one on $cal(N)_j$, supported in $cal(N)_(j + 1)$, and with uniformly bounded gradients. In both harmonic tests the function is the original $f$. The cutoff estimate and Equation (3.4) give
  $ E_1 \( f \) lt.eq C m^(- 2) E_2 \( f \) lt.eq C m^(- 4) E_3 \( f \) lt.eq C m^(- 4) parallel f parallel_d^2 . $
  Finally choose $eta = 1$ near $H$, supported in $cal(N)_1$, with bounded gradient. Cell coercivity bounds the cutoff extension by $parallel eta f parallel_d^2 lt.eq C E_1 \( f \)$. Minimality of $Pi_H f$ then gives $parallel Pi_H f parallel_d lt.eq C m^(- 2) parallel f parallel_d$. The fixed positive physical separation leaves room for these buffers when $d$ is small.
  The min-max characterization of singular values consequently gives
  $ s_j \( C_d \) lt.eq frac(C N_d, j) quad \( j gt.eq C N_d \) . $
  Together with Equation (3.3), splitting the sum at an index of order $N_d \/ delta_d$ yields
  $ parallel C_d parallel_(upright("HS"))^2 lt.eq C N_d delta_d arrow.r 0 . $
  For small $d$, $parallel C_d parallel < 1 \/ 2$, and hence
  $ - 1 / 2 log det \( 1 - C_d^(*) C_d \) lt.eq parallel C_d parallel_(upright("HS"))^2 arrow.r 0 . $
  Components contribute independently, so the proof also covers all the fixed cut geometries in the statement. ◻
]

=== 3.3 The confined sector and single-valued lifts <the-confined-sector-and-single-valued-lifts>

Return to the domain $U$ of Theorem 11. Fix $v = v_0 + g$, where $g$ is smooth near $overline(U)$. Choose real vertex values $v_n$, in cut coordinates compatible with $alpha_n$, so that

$ v_n \( y \) - v_n \( x \) + alpha_n \( x \, y \) = integral_(\[ x \, y \]) d v . $

These values exist because the difference of the two edge forms has zero cycle periods. We choose them by fixing branch cuts and local branches of $v$ first, then replacing $alpha_n$ by the gauge-equivalent connection with the matching integral jumps across these cuts. This gives samples of fixed branches, rather than mesh-dependent choices of their additive constants. On any piece where $alpha_n$ is gauged to zero, the simultaneous change of $v_n$ gives samples of a smooth single-valued lift of $v$. Add the cell penalties of the preceding subsection, using

$ 1 / 2 sum_Q #scale(x: 120%, y: 120%)[\(] h_Q - \( v_n \)_Q #scale(x: 120%, y: 120%)[\)]^2 quad upright("in the sector numerator") \, #h(2em) 1 / 2 sum_Q h_Q^2 quad upright("in the centered denominator") . $

Here the subscripts denote lattice averages. All common translation copies are summed. Denote the resulting ratio by $R_(n \, d)^s \( v \)$. The affine precision comparison of Lemma 8 gives

#[#set math.equation(numbering: n => "(3.5)")
 $ 0 < R_(n \, d)^s \( v \) lt.eq F_(U \, n)^s . $ <sectors:confinement-lower>]

Indeed the shifted observation residuals are additional affine coordinates with the same positive precision; their centers need not belong to the height lattice.

#thm([Lemma 3.3.])[
  (A single-valued lift).  #emph[Let $A$ be a component of a fixed dyadic mixed geometry, with free boundary, and suppose it admits a single-valued smooth lift $v_A$ of $v$. For its confined ratio, the mesh limit exists at each fixed $d$, and 
$ lim_(d arrow.b 0) lim_(n arrow.r oo) R_(A \, n \, d)^s \( v \) = exp {- frac(1, 2 a) integral_A \| d v \|^2} . $

 The same assertion holds for finitely many such pieces, with free constants treated independently.]
] <sectors:single-lift>

#proof[
  Gauge away the connection on $A$. The ratio becomes a centered confined Laplace transform in finitely many cell averages, multiplied by the scalar from expanding the shifted penalties. Theorem 6 gives its Gaussian limit, with the constant integrated. The sampled centers converge to the cell averages of $v_A$. Convergence of transforms also holds at these converging arguments: Hölder bounds from transforms at fixed nearby arguments give local equicontinuity. Gaussian completion of the square identifies the limiting ratio as
  $ exp { - I_d \( v_A \) \/ 2 } \, #h(2em) I_d \( v_A \) = inf_(u in H^1 \( A \)) {a^(- 1) integral_A \| nabla u \|^2 + sum_(Q subset A) \( u_Q - \( v_A \)_Q \)^2} . $
  The determinant is the same in the two Gaussian integrals and cancels. Trying $u = v_A$ bounds $I_d \( v_A \)$ by its gradient energy. For a sequence with bounded values of this functional, cell Poincaré gives
  $ parallel u - v_A parallel_(L^2 \( A \))^2 lt.eq C d^2 (parallel nabla u parallel_2^2 + parallel nabla v_A parallel_2^2 + sum_Q \( u_Q - \( v_A \)_Q \)^2) arrow.r 0 . $
  Weak compactness in $H^1$ and lower semicontinuity now show that $I_d \( v_A \) arrow.r a^(- 1) integral_A \| nabla v_A \|^2$. Independent components give the final assertion. ◻
]

The remaining issue is that $U$ itself need not admit a single-valued lift. We remove this obstruction by cuts and use Lemma 12 to show that the cuts change the confined ratio by a vanishing amount.

#thm([Proposition 3.4.])[
  (Confined sector limit).  #emph[For the observations and smooth multivalued $v$ just defined, 
#[#set math.equation(numbering: n => "(5)")
 $ lim_(d arrow.b 0) limsup_(n arrow.r oo) lr(|R_(n \, d)^s \( v \) - exp {- frac(1, 2 a) integral_U \| d v \|^2}|) = 0 . $ <eq:source-5>]

 The observation partitions may be required to align with any fixed finite collection of the cuts, patches, and pin bands constructed below.]
] <sectors:weighted>

#proof[
  Throughout this proof, $Z_G^s$ and $F_G^s = Z_G^s \/ Z_G^0$ include the cell penalties at the fixed parameters $n \, d \, v$, on whichever cut topology $G$ is indicated. In particular $F_U^s = R_(n \, d)^s \( v \)$. We suppress these parameters until taking the ordered limits.
  #emph[The cuts and their separating guards.] Connect each hole to a distinct unused part of the outer boundary by disjoint simple arcs. These can be chosen successively: opening a channel from one hole to the outside preserves connectivity and merges those two boundary components. Choose positive clearances from nonincident boundaries and previously chosen arcs. Approximate the arcs within those clearances by simple rectilinear paths with dyadic vertices, retaining short normal segments where they meet boundary sides and removing loops. Their endpoints lie in interiors of boundary segments. Narrow tubular strips around these paths, with square corners and dyadic widths, can then be chosen mutually disjoint, together with wider disjoint strip neighborhoods.
  Delete the edges crossing the two sides of each narrow strip. This isolates the strips and leaves a domain with every hole slit. Every resulting piece admits a single-valued lift of $v$. The strips, their wider neighborhoods, and all later bands have fixed positive widths. Choose the dyadic observation cells to align with all their boundaries. Coherent rounding makes these cells arrays entirely within their respective pieces.
  Consider one of the finitely many strip deletions, with all earlier deletions retained, and denote its narrow strip by $S$. Call the configurations before and after this deletion $upright("open")$ and $upright("cut")$. Inside a wider strip patch $W$, place a guard $p$ consisting of bands on both sides of the narrow strip. The bands separate every edge to be restored from the artificial boundary of $W$, and have positive buffers to both. At the two ends they reach the original free walls. Parallel collars and square corners provide the same construction at turns. Thus $W$ has a common single-valued lift, before and after the deletion. Figure 1 illustrates the arrangement.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-3, -1.5), (3, 3), fill: rgb("#f5f5f5"), stroke: none)
  rect((-1.5, -1.5), (1.5, 0), fill: rgb("#ffffff"), stroke: none)
  line((-3, -1.5), (-3, 3), (3, 3), (3, -1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-1.5, -1.5), (-1.5, 0), (1.5, 0), (1.5, -1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.78, 0), (-0.55, 3), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.55, 0), (0.78, 3), fill: rgb("#d9d9ff"), stroke: none)
  rect((-0.3, 0), (-0.12, 3), fill: rgb("#ffdfbf"), stroke: none)
  rect((0.12, 0), (0.3, 3), fill: rgb("#ffdfbf"), stroke: none)
  line((-1.05, 0), (-1.05, 3), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.05, 0), (1.05, 3), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.21, 0), (-0.21, 3), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dotted"))
  line((0.21, 0), (0.21, 3), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dotted"))
  content((0, -0.55), [#text(size: 9pt)[hole]])
  content((2, 2.5), [#text(size: 9pt)[$U$]])
  content((0, 1.3), [#text(size: 9pt)[$S$]])
  content((-0.665, 2.5), [#text(size: 9pt)[$p$]])
  content((0.665, 2.5), [#text(size: 9pt)[$p$]])
  line((-2, 1.25), (-0.3, 1.25), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((-2, 1.25), [#text(size: 9pt)[$H$]], anchor: "east", padding: 0.1176cm)
  line((2, 1.7), (1.05, 1.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2, 1.7), [#text(size: 9pt)[$partial W$]], anchor: "west", padding: 0.1176cm)
  line((-1.05, 3.35), (1.05, 3.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((0, 3.35), [#text(size: 9pt)[$W$]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: A straight part of a strip $S$ joining a hole to the outer free wall. Dotted lines indicate the interfaces cut to isolate $S$. The pin region $H$, shown along both interfaces, contains every endpoint of every lattice edge crossing either interface. The two guard bands $p$ separate them from the artificial boundary of the wider patch $W$. All bands have positive widths and positive intervening gaps. Parallel collars give the same separation at rectilinear turns. The bottom ends of the outer boundary and hole are omitted from the schematic. ],
  ) <sectors:slit-figure>
  For prescribed absolute primary data $u$ on $p$, let
  $ K^s \( u \) = frac(Z_(upright("open"))^s \( u \), Z_(upright("cut"))^s \( u \)) \, #h(2em) d_0 = K^0 \( 0 \) . $
  Conditioning on the full guard separates the restored edges from everything beyond $W$, since no observation cell crosses a guard division. Therefore $K^s \( u \)$ is unchanged if we cut the edges across $partial W$ and compute it using $W$ alone. The prescribed-data comparison of Lemma 9 gives
  $ frac(Z_(upright("open"))^s \( u \), Z_(upright("open"))^0 \( 0 \)) lt.eq frac(Z_(upright("cut"))^s \( u \), Z_(upright("cut"))^0 \( 0 \)) \, #h(2em) upright("hence") #h(2em) 0 < K^s \( u \) lt.eq d_0 . $
  #emph[The loss inside the patch.] Choose a union of positive-area boxes $H$ containing all endpoints of restored edges and positively separated from $p$, in the cut patch. Under its centered confined law,
  $ 1 gt.eq bb(E)_(upright("cut") thin W \, 0) frac(K^0 \( u \), d_0) gt.eq e^(- D_(n \, d) \( H \, p \)) . $
  To verify the lower bound, compare the restored partition sums with guard data $u$ and $0$, then add the pin $h_H = 0$. Precision comparison decreases their ratio. With $H$ pinned, restoration is a fixed scalar because all restored-edge endpoints are fixed. Dividing by the corresponding cut-patch data ratio gives the pointwise lower comparator
  $ frac(K^0 \( u \), d_0) gt.eq frac(bb(P)_(upright("cut") thin W \, 0) \( h_H = 0 divides h_p = u \), bb(P)_(upright("cut") thin W \, 0) \( h_H = 0 divides h_p = 0 \)) . $
  Averaging and using Bayes’ rule gives the displayed estimate. Lemma 12 shows that its lower bound tends to one, in the order $n arrow.r oo$, then $d arrow.b 0$.
  Both versions of $W$ have lifts, and the cuts remove only zero-area interfaces. Lemma 13 therefore gives the same limit for their shifted-to-centered ratios. It follows that
  #[#set math.equation(numbering: n => "(6)")
   $ sum_u frac(Z_(upright("cut") thin W)^s \( u \), Z_(upright("cut") thin W)^0) (1 - frac(K^s \( u \), d_0)) arrow.r 0 quad \( n arrow.r oo \, med upright("then ") d arrow.b 0 \) . $ <eq:source-6>]
  The arrow means that the iterated limsup is zero. For clarity, the sum in Equation (6) is exactly
  $ F_(upright("cut") thin W)^s - F_(upright("open") thin W)^s thin bb(E)_(upright("cut") thin W \, 0) K^0 / d_0 . $
  This identity proves the assertion without any approximation of conditional laws at individual microscopic values $u$.
  #emph[Passing from the patch to the whole domain.] Let $G$ be the current topology with the narrow strip cut, and let $G'$ be obtained by further cutting the edges across the artificial boundary of $W$. At prescribed guard data, precision comparison gives
  $ frac(Z_G^s \( u \), Z_G^0 \( 0_p \)) lt.eq frac(Z_(G')^s \( u \), Z_(G')^0 \( 0_p \)) . $
  Here $0_p$ denotes prescribed zero guard data; a denominator without a data argument sums over those data. Thus
  #[#set math.equation(numbering: n => "(3.6)")
   $ frac(Z_G^s \( u \), Z_G^0) lt.eq frac(bb(P)_(G \, 0) \( h_p = 0 \), bb(P)_(G' \, 0) \( h_p = 0 \)) frac(Z_(G')^s \( u \), Z_(G')^0) . $ <sectors:global-data-bound>]
  This change of normalization has a controlled cost. Let $R \( u \)$ be the centered restoration factor from $G'$ to $G$ at guard data $u$. Directly summing partition functions gives
  $ frac(bb(P)_(G \, 0) \( h_p = 0 \), bb(P)_(G' \, 0) \( h_p = 0 \)) = frac(R \( 0 \), bb(E)_(G' \, 0) R) . $
  Choose a union of boxes $H'$ containing the endpoints of all edges across the artificial boundary of $W$, separated from $p$. The preceding centered restoration comparison, now with $H'$, implies
  $ frac(bb(E)_(G' \, 0) R, R \( 0 \)) gt.eq e^(- D_(n \, d)^(G') \( H' \, p \)) . $
  Lemma 12 makes this interaction tend to zero. All observation cells remain within their components after the cut, and control their constants, so its hypotheses hold for $G'$.
  Multiply Equation (3.6) by the nonnegative quantity $1 - K^s \( u \) \/ d_0$ and sum. On $G'$, the part outside $W$ factors off as a shifted-to-centered confined ratio, at most one by Lemma 8. The resulting global loss is therefore at most $e^(D_(n \, d)^(G') \( H' \, p \))$ times the patch loss in Equation (6); it tends to zero. The same conclusion applies to the centered loss.
  To finish, define these two losses on the current cut graph by
  $ L_s = sum_u frac(Z_(upright("cut"))^s \( u \), Z_(upright("cut"))^0) (1 - frac(K^s \( u \), d_0)) \, #h(2em) L_0 = bb(E)_(upright("cut") \, 0) (1 - K^0 / d_0) . $
  Summing the restored numerator and denominator gives the exact identity
  #[#set math.equation(numbering: n => "(3.7)")
   $ F_(upright("open"))^s = frac(F_(upright("cut"))^s - L_s, 1 - L_0) . $ <sectors:restoration-identity>]
  Since $L_s \, L_0$ tend to zero in the prescribed order and $F_(upright("cut"))^s lt.eq 1$, a strip deletion changes the confined ratio by a quantity tending to zero. There are only finitely many strips. After all deletions, Lemma 13 identifies the product ratio with the right side of Equation (5). The energies add over the pieces to $integral_U \| d v \|^2$. Restoring the strips proves the proposition. The raw factors $d_0$ cancel in Equation (3.7); no bound on their size is needed. ◻
]

#proof[
  #emph[Completion of Theorem 11.] For every smooth $g$ near $overline(U)$, combine Equation (3.5) with Proposition 14 to obtain
  $ liminf_(n arrow.r oo) F_(U \, n)^s gt.eq exp {- frac(1, 2 a) integral_U \| d v_0 + d g \|^2} . $
  Restrictions of smooth functions from a neighborhood are dense in $H^1 \( U \)$, since $U$ is Lipschitz. Let their energies approach $cal(M) \( U \)$. This proves the lower bound in Equation (3), and the earlier upper bound proves the limit. Every use of a height or pin theorem was at fixed geometry and fixed $d$; all subsequent limits were taken afterwards. ◻
]

== 4 Flat pins across a long annulus <sec:annuli>

The comparison in Theorem 11 concerns holes of fixed positive radius. To connect such a hole to a microscopic source, we need a pin-probability estimate on a long annulus: making the heights equal on a middle band changes the probability that the heights are equal at a distant end by a factor tending to one in the mesh limit as the logarithmic annular length grows. Each of these events leaves its common height free. We derive this estimate from the absolute-pin input in Theorem 7.

=== 4.1 Polygonal annuli and their bands <polygonal-annuli-and-their-bands>

Fix a small $epsilon > 0$, and choose a closed rectilinear polygon $P$, homeomorphic to a closed disk, with dyadic vertices and

$ B \( 0 \, 1 - epsilon \) subset P subset B \( 0 \, 1 + epsilon \) . $

One may use a sufficiently fine staircase approximation to the circle, chosen symmetrically in the four quadrants. All side lengths and passages in the resulting fixed geometry are nondegenerate. Write $Q_r = \( - r \, r \)^2$. Choose $lambda$ to be a sufficiently large power of $4$, and put

$ A_lambda = lambda P \\ P^compose \, #h(2em) p = overline(Q_(2 sqrt(lambda))) \\ Q_(sqrt(lambda)) \,\
H_(upright("in")) = A_lambda ∩ overline(Q_4) \, #h(2em) H_(upright("out")) = A_lambda \\ Q_(lambda \/ 4) . $

Sobolev spaces on $A_lambda$ refer to its interior. The guard $p$ is a full square band separating the two ends. Each end region contains all vertices next to its annular wall after fine discretization. The guard and either end are positively separated. They are finite unions of positive-area boxes in the polygonal geometry of Section 2. Discretizations use the coherent array divisions specified there. In particular, a boundary division never identifies pieces merely at a point. Figure 2 displays these regions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((2.72, 0), (2.72, 0.68), (2.55, 0.68), (2.55, 1.19), (2.38, 1.19), (2.38, 1.53), (2.21, 1.53), (2.21, 1.87), (1.87, 1.87), (1.87, 2.21), (1.53, 2.21), (1.53, 2.38), (1.19, 2.38), (1.19, 2.55), (0.68, 2.55), (0.68, 2.72), (-0.68, 2.72), (-0.68, 2.55), (-1.19, 2.55), (-1.19, 2.38), (-1.53, 2.38), (-1.53, 2.21), (-1.87, 2.21), (-1.87, 1.87), (-2.21, 1.87), (-2.21, 1.53), (-2.38, 1.53), (-2.38, 1.19), (-2.55, 1.19), (-2.55, 0.68), (-2.72, 0.68), (-2.72, -0.68), (-2.55, -0.68), (-2.55, -1.19), (-2.38, -1.19), (-2.38, -1.53), (-2.21, -1.53), (-2.21, -1.87), (-1.87, -1.87), (-1.87, -2.21), (-1.53, -2.21), (-1.53, -2.38), (-1.19, -2.38), (-1.19, -2.55), (-0.68, -2.55), (-0.68, -2.72), (0.68, -2.72), (0.68, -2.55), (1.19, -2.55), (1.19, -2.38), (1.53, -2.38), (1.53, -2.21), (1.87, -2.21), (1.87, -1.87), (2.21, -1.87), (2.21, -1.53), (2.38, -1.53), (2.38, -1.19), (2.55, -1.19), (2.55, -0.68), (2.72, -0.68), close: true, fill: rgb("#dbdbdb"), stroke: none)
  rect((-1.768, -1.768), (1.768, 1.768), fill: rgb("#ffffff"), stroke: none)
  rect((-1.258, -1.258), (1.258, 1.258), fill: rgb("#d1d1ff"), stroke: none)
  rect((-0.9656, -0.9656), (0.9656, 0.9656), fill: rgb("#ffffff"), stroke: none)
  rect((-0.765, -0.765), (0.765, 0.765), fill: rgb("#dbdbdb"), stroke: none)
  rect((-1.768, -1.768), (1.768, 1.768), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  rect((-1.258, -1.258), (1.258, 1.258), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.9656, -0.9656), (0.9656, 0.9656), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.765, -0.765), (0.765, 0.765), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  line((2.72, 0), (2.72, 0.68), (2.55, 0.68), (2.55, 1.19), (2.38, 1.19), (2.38, 1.53), (2.21, 1.53), (2.21, 1.87), (1.87, 1.87), (1.87, 2.21), (1.53, 2.21), (1.53, 2.38), (1.19, 2.38), (1.19, 2.55), (0.68, 2.55), (0.68, 2.72), (-0.68, 2.72), (-0.68, 2.55), (-1.19, 2.55), (-1.19, 2.38), (-1.53, 2.38), (-1.53, 2.21), (-1.87, 2.21), (-1.87, 1.87), (-2.21, 1.87), (-2.21, 1.53), (-2.38, 1.53), (-2.38, 1.19), (-2.55, 1.19), (-2.55, 0.68), (-2.72, 0.68), (-2.72, -0.68), (-2.55, -0.68), (-2.55, -1.19), (-2.38, -1.19), (-2.38, -1.53), (-2.21, -1.53), (-2.21, -1.87), (-1.87, -1.87), (-1.87, -2.21), (-1.53, -2.21), (-1.53, -2.38), (-1.19, -2.38), (-1.19, -2.55), (-0.68, -2.55), (-0.68, -2.72), (0.68, -2.72), (0.68, -2.55), (1.19, -2.55), (1.19, -2.38), (1.53, -2.38), (1.53, -2.21), (1.87, -2.21), (1.87, -1.87), (2.21, -1.87), (2.21, -1.53), (2.38, -1.53), (2.38, -1.19), (2.55, -1.19), (2.55, -0.68), (2.72, -0.68), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.3536, 0), (0.3536, 0.0884), (0.3315, 0.0884), (0.3315, 0.1547), (0.3094, 0.1547), (0.3094, 0.1989), (0.2873, 0.1989), (0.2873, 0.2431), (0.2431, 0.2431), (0.2431, 0.2873), (0.1989, 0.2873), (0.1989, 0.3094), (0.1547, 0.3094), (0.1547, 0.3315), (0.0884, 0.3315), (0.0884, 0.3536), (-0.0884, 0.3536), (-0.0884, 0.3315), (-0.1547, 0.3315), (-0.1547, 0.3094), (-0.1989, 0.3094), (-0.1989, 0.2873), (-0.2431, 0.2873), (-0.2431, 0.2431), (-0.2873, 0.2431), (-0.2873, 0.1989), (-0.3094, 0.1989), (-0.3094, 0.1547), (-0.3315, 0.1547), (-0.3315, 0.0884), (-0.3536, 0.0884), (-0.3536, -0.0884), (-0.3315, -0.0884), (-0.3315, -0.1547), (-0.3094, -0.1547), (-0.3094, -0.1989), (-0.2873, -0.1989), (-0.2873, -0.2431), (-0.2431, -0.2431), (-0.2431, -0.2873), (-0.1989, -0.2873), (-0.1989, -0.3094), (-0.1547, -0.3094), (-0.1547, -0.3315), (-0.0884, -0.3315), (-0.0884, -0.3536), (0.0884, -0.3536), (0.0884, -0.3315), (0.1547, -0.3315), (0.1547, -0.3094), (0.1989, -0.3094), (0.1989, -0.2873), (0.2431, -0.2873), (0.2431, -0.2431), (0.2873, -0.2431), (0.2873, -0.1989), (0.3094, -0.1989), (0.3094, -0.1547), (0.3315, -0.1547), (0.3315, -0.0884), (0.3536, -0.0884), close: true, fill: rgb("#ffffff"), stroke: none)
  line((0.3536, 0), (0.3536, 0.0884), (0.3315, 0.0884), (0.3315, 0.1547), (0.3094, 0.1547), (0.3094, 0.1989), (0.2873, 0.1989), (0.2873, 0.2431), (0.2431, 0.2431), (0.2431, 0.2873), (0.1989, 0.2873), (0.1989, 0.3094), (0.1547, 0.3094), (0.1547, 0.3315), (0.0884, 0.3315), (0.0884, 0.3536), (-0.0884, 0.3536), (-0.0884, 0.3315), (-0.1547, 0.3315), (-0.1547, 0.3094), (-0.1989, 0.3094), (-0.1989, 0.2873), (-0.2431, 0.2873), (-0.2431, 0.2431), (-0.2873, 0.2431), (-0.2873, 0.1989), (-0.3094, 0.1989), (-0.3094, 0.1547), (-0.3315, 0.1547), (-0.3315, 0.0884), (-0.3536, 0.0884), (-0.3536, -0.0884), (-0.3315, -0.0884), (-0.3315, -0.1547), (-0.3094, -0.1547), (-0.3094, -0.1989), (-0.2873, -0.1989), (-0.2873, -0.2431), (-0.2431, -0.2431), (-0.2431, -0.2873), (-0.1989, -0.2873), (-0.1989, -0.3094), (-0.1547, -0.3094), (-0.1547, -0.3315), (-0.0884, -0.3315), (-0.0884, -0.3536), (0.0884, -0.3536), (0.0884, -0.3315), (0.1547, -0.3315), (0.1547, -0.3094), (0.1989, -0.3094), (0.1989, -0.2873), (0.2431, -0.2873), (0.2431, -0.2431), (0.2873, -0.2431), (0.2873, -0.1989), (0.3094, -0.1989), (0.3094, -0.1547), (0.3315, -0.1547), (0.3315, -0.0884), (0.3536, -0.0884), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$P$]])
  content((0, 0.5576), [#text(size: 9pt)[$H_( upright("in") )$]])
  content((0, 1.115), [#text(size: 9pt)[$p$]])
  content((0, 2.176), [#text(size: 9pt)[$H_( upright("out") )$]])
  content((3.026, 0.952), [#text(size: 9pt)[$partial ( lambda P)$]], anchor: "west", padding: 0.1176cm)
  line((2.992, 0.884), (2.55, 0.884), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  content((3.026, -0.476), [#text(size: 9pt)[free walls#linebreak()at both ends]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: A polygonal annulus with its full square guard $p$ and the two possible end regions. The inner and outer walls are rectilinear approximations to circles; the square boundaries belong to the bands, not to the annular walls. Radial distances are compressed: the actual walls are $P$ and $lambda P$, the guard is at scale $sqrt(lambda)$, and either end is separated from it by a round annulus of logarithmic length $1 / 2 log lambda - O \( 1 \)$. The two end regions are displayed together, but the pin estimate is applied to one end at a time. ],
) <annuli:figure>

Consider the centered, free height law $mu$ on this annulus, with one common translation quotiented out. For a nonempty vertex set $Q$, write

$ \[ Q \] = { h_x = h_y upright(" for every ") x \, y in Q } . $

Thus $\[ Q \]$ pins all differences within $Q$, without pinning its common height. For $H = H_(upright("in"))$ or $H_(upright("out"))$, set

$ overline(D) \( H \, p \) = log frac(mu \( \[ H \] divides \[ p \] \), mu \( \[ H \] \)) . $

#thm([Proposition 4.1.])[
  (Separated flat pins).  #emph[Fix $P$ as above. For either choice of $H$, the interaction $overline(D) \( H \, p \)$ is nonnegative and 
#[#set math.equation(numbering: n => "(7)")
 $ limsup_(upright("mesh") arrow.r 0) overline(D) \( H \, p \) quad upright("can be made arbitrarily small by taking ") lambda upright(" large.") $ <eq:source-7>]

 The mesh limit is taken at each fixed polygonal geometry.]
] <annuli:flat-interaction>

The proof of Proposition 15 first estimates the continuum interaction with one confining box average. It then weakens that confinement and passes from absolute pins to flat pins. The constant mode is retained throughout.

=== 4.2 The continuum estimate with confinement <the-continuum-estimate-with-confinement>

Choose a dyadic box inside $p$ whose side lengths are fixed positive multiples of $sqrt(lambda)$, and let $B_0$ be its probability average. Sum all common height translations and add the penalty $gamma \( B_0 h \)^2 \/ 2$, where $gamma > 0$. Let $D_gamma \( H \, p \)$ be the interaction of the absolute events $h_H = 0$ and $h_p = 0$ under this confined law.

Start with $gamma = 1$. By Theorem 7, $D_1$ converges to the Gaussian interaction for

$ cal(T) \( u \) = a^(- 1) integral_(A_lambda) \| nabla u \|^2 + \( B_0 u \)^2 . $

Write $parallel u parallel_(cal(T))^2 = cal(T) \( u \)$. As in Equation (1), let

$ V_Q = { u in H^1 \( A_lambda \) : u = 0 upright(" on ") Q }^(perp_(cal(T))) \, #h(2em) C = Pi_H \|_(V_p) . $

We claim that $parallel C parallel_(upright("HS")) arrow.r 0$ as $lambda arrow.r oo$.

Between $p$ and $H$ there is a full round annulus which is a conformal cylinder

#[#set math.equation(numbering: n => "(4.1)")
 $ \[ 0 \, T \] times #scale(x: 120%, y: 120%)[\(] bb(R) \/ \( 2 pi bb(Z) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) T = 1 / 2 log lambda - O \( 1 \) . $ <annuli:cylinder>]

The end $s = 0$ faces $p$. For the inner end, for example, one may take radii $8$ and $sqrt(lambda) \/ 2$, with the logarithmic coordinate reversed. For the outer end one may take radii $4 sqrt(lambda)$ and $lambda \/ 8$. Enlarging the lower bound on $lambda$ makes both choices available, with fixed clearances from the bands.

For $f in V_p$, the trace at $s = 0$ satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ parallel f \|_(s = 0) parallel_(H^(1 \/ 2) \( bb(S)^1 \)) lt.eq C_0 parallel f parallel_(cal(T)) \, $ <annuli:trace>]

with $C_0$ independent of large $lambda$. Indeed, after scaling lengths by $sqrt(lambda)$, this circle, the guard, and the observation box lie in a fixed connected annular region. Poincare’s inequality with the box mean controls the $H^1$ norm there, including constants; the trace theorem then gives Equation (4.2). On the side of this circle containing $H$, the function $f$ minimizes the gradient energy with its given trace and free walls. There is no observation term on that side.

Let $A$ map a trace at $s = 0$ to the restriction to $H$ of this energy minimizer, with the target norm equal to the least $cal(T)$-norm of an extension of that restriction to the whole annulus. This target is naturally identified with $V_H$. We estimate $A$ on a normalized Fourier basis of $H^(1 \/ 2) \( bb(S)^1 \)$. For the constant trace, the minimizer on the $H$-side is constant. An extension of its $H$-data can be chosen constant beyond $s = T$, linear across the cylinder, and zero before $s = 0$. It vanishes on the observation box and has energy $O \( T^(- 1) \)$. Thus the norm of the image of the constant mode is $O \( T^(- 1 \/ 2) \)$.

For a sine or cosine mode of frequency $j gt.eq 1$, normalization in $H^(1 \/ 2)$ makes its amplitude $O \( \( 1 + j \)^(- 1 \/ 2) \)$. The Neumann minimum at $s = T$, on the cylinder alone, is a lower bound for the actual minimum. The Dirichlet-zero minimum at $s = T$, extended by zero beyond that circle, is an admissible upper trial. The solutions of $u'' = j^2 u$ give, respectively, the factors $tanh \( j T \)$ and $coth \( j T \)$ in their energies. Their difference is therefore $O \( e^(- 2 j T) \)$. Orthogonality of the actual minimizer to zero-trace variations shows that the difference between it and the upper trial has gradient norm $O \( e^(- j T) \)$. This difference has zero trace at $s = 0$, so it extends by zero toward $p$, pays no observation penalty, and has, up to sign, the required restriction on $H$. Consequently

$ parallel A parallel_(upright("HS"))^2 lt.eq C_1 / T + C_1 sum_(j gt.eq 1) e^(- 2 j T) arrow.r 0 . $

All extensions are in $H^1$: across each interior circle their traces agree. Composing $A$ with the uniformly bounded trace map in Equation (4.2) proves the claim for $C$. The determinant in Equation (1) now tends to one, since $parallel C parallel lt.eq parallel C parallel_(upright("HS")) arrow.r 0$. We have proved

#[#set math.equation(numbering: n => "(4.3)")
 $ lim_(lambda arrow.r oo) lim_(upright("mesh") arrow.r 0) D_1 \( H \, p \) = 0 . $ <annuli:unit-confinement>]

=== 4.3 From absolute pins to flat pins <from-absolute-pins-to-flat-pins>

We next establish Equation (4.3) with any fixed $gamma > 0$ in place of $1$. Consider the four partition functions defining the absolute-pin interaction. When $p$ is pinned, $B_0 h = 0$, so changing $gamma$ has no effect. With neither region pinned, the ratio of partition functions at precisions $gamma$ and $1$ tends to $gamma^(- 1 \/ 2)$. This follows from Theorem 6: the fractional mean becomes uniform and independent of the mean-free field, and the translation sums of the Gaussian penalties are bounded periodic functions.

With $H$ alone pinned, let $x = x \( lambda \)$ be the variance of $B_0$ in the massless continuum Gaussian law with that pin. Applying the hard-pin height limit in Theorem 6 to the two bounded weights $exp \( - gamma \( B_0 h \)^2 \/ 2 \)$ and $exp \( - \( B_0 h \)^2 \/ 2 \)$ gives the ratio

$ (frac(1 + x, 1 + gamma x))^(1 \/ 2) . $

Moreover $x arrow.r oo$. To see this from the variational formula for the variance, take a function equal to one on the $p$-side, zero on the $H$-side, and linear across the cylinder in Equation (4.1). Its box average is one and its gradient energy is $O \( T^(- 1) \)$, so $x gt.eq c T$. Combining the four partition functions yields, at fixed geometry,

#[#set math.equation(numbering: n => "(4.4)")
 $ D_gamma - D_1 arrow.r 1 / 2 log frac(1 + gamma x, gamma \( 1 + x \)) . $ <annuli:change-confinement>]

The right side tends to zero as $lambda arrow.r oo$. The absolute-pin interaction thus tends to zero for every fixed positive $gamma$.

It remains to compare these absolute pins with the desired flat events. In a centered confined law, the logarithmic interaction of two centered quadratic penalties increases when either precision increases. In fact, if the first precision changes by $t Q$, differentiating the four log partition functions gives

$ 1 / 2 "Tr" Q #scale(x: 120%, y: 120%)[\(] "Cov"_(upright("first penalty")) - "Cov"_(upright("both penalties")) #scale(x: 120%, y: 120%)[\)] gt.eq 0 $

by centered covariance comparison. Taking equality limits proves the same assertion for nested centered constraints. Absolute zero pins are obtained from flat pins by also pinning one reference height in each set after the within-set constraints are imposed. Hence the interaction of $\[ H \]$ and $\[ p \]$ in the confined law is between zero and $D_gamma \( H \, p \)$.

Finally, project the confined law onto common-translation orbits. If $t = B_0 h$ in any representative, the orbit receives the factor

$ w_gamma \( t \) = sum_(k in bb(Z)) exp { - gamma / 2 \( t + 2 pi k \)^2 } . $

Poisson summation gives the uniform estimate

$ sup_t lr(|sqrt(2 pi gamma) thin w_gamma \( t \) - 1|) lt.eq 2 sum_(j gt.eq 1) e^(- j^2 \/ \( 2 gamma \)) = : delta_gamma arrow.r 0 #h(2em) \( gamma arrow.b 0 \) . $

For $gamma$ sufficiently small that $delta_gamma < 1$, the normalized projected density relative to the free orbit law is between $\( 1 - delta_gamma \) \/ \( 1 + delta_gamma \)$ and its reciprocal. This multiplicative estimate applies to the individual pin events and their intersection, however small their probabilities. Their log interactions differ by $O \( delta_gamma \)$, uniformly in the mesh and the annulus.

Given a tolerance, first choose $gamma > 0$ so that this error is small. Then choose $lambda$ large so that the limiting absolute-pin interaction is small, and finally take the mesh limit at that fixed geometry. This proves Equation (7). Nonnegativity in the free law follows either from centered precision comparison directly or by sending $gamma$ to zero at each fixed finite graph. 0◻

== 5 Gluing kernels and stability from a fixed core <sec:kernels>

We now return to the bare height weights, with no confining penalty. The flat-pin estimate gives an average bound for restoring an interface between annuli. A uniform upper bound for the same kernel will make that estimate stable through any number of annuli.

=== 5.1 Guard data and interface kernels <guard-data-and-interface-kernels>

Use the polygon $P$, the guard, and the end regions of Section 4. In lattice units, an annular block has walls $R P$ and $lambda R P$. We take $R$ large enough and dyadically aligned so that all divisions lie between rows of dual vertices. Every block is connected. The bonds between adjacent blocks are precisely the bonds to be restored.

Choose one guard vertex in each annulus. Its #emph[guard datum] $u$ is the list of all height differences from that vertex to the other guard vertices, in the chosen connection gauge. Every compatible datum has positive probability. Denote its law in block $i$, in sector $s$, by $m_i^s \( d u \)$. Fixing the representative whose chosen height is zero turns $u$ into full prescribed height data on the guard. The configurations on the two sides are then conditionally independent, since the guard is a full separating band and the energy is a sum of nearest-neighbor terms.

For two adjacent annuli, with data $u_i \, u_(i + 1)$, define

$ T_i^s \( u_i \, u_(i + 1) \) = frac(Z_(upright("restored"))^s \( u_i \, u_(i + 1) \), Z_(upright("cut"))^s \( u_i \, u_(i + 1) \)) . $

The numerator is summed modulo one common translation; the denominator is a product of sums modulo one translation in each block. Thus the numerator sums the relative integer translation of the two blocks.

We use the same definition in two other cases. A #emph[core] is a connected block filling the inner hole of the first annulus; it may contain a magnetic source and carries no prescribed guard. Its interface kernel is a function $T_0^s \( u_1 \)$. At the other end, several disjoint last annuli may be attached to one connected exterior, with no direct bonds between these annuli. The exterior carries no prescribed data. Its one joint kernel is a function of the incident annular data. In every case let

$ d_i = T_i^0 \( 0 \) \, $

where $0$ means zero guard differences in the centered sector. No size estimate for this positive scalar is required.

#thm([Lemma 5.1.])[
  (Upper bound and centered average).  #emph[For each of the kernels just defined, every sector and every compatible guard datum satisfy 
#[#set math.equation(numbering: n => "(8)")
 $ 0 < T_i^s \/ d_i lt.eq 1 . $ <eq:source-8>]

 For an interface between two annuli, choose the end region $H$ on each side containing its seam endpoints. For the joint exterior kernel choose the outer end region in each incident annulus. Then 
#[#set math.equation(numbering: n => "(9)")
 $ 1 gt.eq integral \( T_i^0 \/ d_i \) product_(upright("incident annuli ") ell) d m_ell^0 gt.eq product_(upright("incident annuli ") ell) e^(- overline(D)_ell \( H \, p \)) . $ <eq:source-9>]

]
] <kernels:bounds>

#proof[
  Lemma 9 gives the prescribed-data comparison
  $ frac(Z_(upright("restored"))^s \( u \), Z_(upright("restored"))^0 \( 0 \)) lt.eq frac(Z_(upright("cut"))^s \( u \), Z_(upright("cut"))^0 \( 0 \)) . $
  Rearranging proves Equation (8). The comparison applies to relative guard data: they are affine constraints on height differences. If auxiliary confinement is used to perform the comparison, its divergent translation scalar cancels within each displayed ratio before confinement is removed. The two graphs need not have the same number of free components.
  For the lower bound, work in the centered sector and impose $\[ H \]$ in every indicated annulus. Adding these centered constraints to the restored data-versus-zero ratio decreases that ratio. Once they hold, choose the representative in each annulus to be zero on its flat end. The restoration factor is then independent of the guard data: its remaining variables are the relative integer translations and, in the exterior case, the unprescribed exterior heights. Let $bb(P)_(ell \, 0)$ denote the free centered law in annulus $ell$. The comparison, after division by the cut data-versus-zero ratio, gives
  $ frac(T_i^0 \( u \), d_i) gt.eq product_(upright("incident annuli ") ell) frac(bb(P)_(ell \, 0) \( \[ H \] divides u_ell \), bb(P)_(ell \, 0) \( \[ H \] divides \[ p \] \)) . $
  All seam endpoints lie in the chosen end regions; hence no other annular heights enter the restoration factor with these events imposed. Averaging over the independent cut-block laws yields Equation (9). ◻
]

#thm([Lemma 5.2.])[
  (Exact multiplication).  #emph[Let a core be surrounded by $N$ annular blocks, with no other adjacencies between the blocks. Their restored partition function is 
#[#set math.equation(numbering: n => "(5.1)")
 $ Z_(upright("full"))^s = Z_(upright("core"))^s product_(i = 1)^N Z_i^s integral T_0^s \( u_1 \) product_(i = 1)^(N - 1) T_i^s \( u_i \, u_(i + 1) \) product_(i = 1)^N d m_i^s \( u_i \) . $ <kernels:product>]

 For several disjoint nests attached to a common connected exterior, the corresponding formula includes its cut partition function and the one joint exterior kernel.]
] <kernels:multiplication>

#proof[
  Begin with one representative of the heights in each cut block. On the tree whose vertices are these blocks and whose edges are their interfaces, integer block constants modulo one common constant are in bijection with the integer differences along the tree edges. The bijection has no multiplicity factor: fix the root constant, then recover each other constant along its unique path from the root. The relative translations can therefore be summed independently at the interfaces.
  Condition next on every guard datum. Within each annulus, its inner and outer configurations are conditionally independent. The two incident interface factors may consequently be integrated separately, giving the kernels in Equation (5.1). For several nests, put the exterior at the root of the block tree. Its different boundary portions need not be independent, so their integrations remain together in the single exterior kernel. This is exactly the formula asserted. ◻
]

=== 5.2 Small average losses in unit magnetic sectors <small-average-losses-in-unit-magnetic-sectors>

Call an annulus-annulus interface #emph[regular] when the connection is flat on their restored union and has the same period $2 pi$, $- 2 pi$, or zero in both annuli. In particular, restoring that interface introduces no magnetic source.

#thm([Proposition 5.3.])[
  (Average loss).  #emph[For a regular interface, 
#[#set math.equation(numbering: n => "(10)")
 $ integral \( T_i^s \/ d_i \) product_ell d m_ell^s = (integral \( T_i^0 \/ d_i \) product_ell d m_ell^0) F_(upright("restored"))^s / F_(upright("cut"))^s . $ <eq:source-10>]

 Given any $xi > 0$, first choose $epsilon$ sufficiently small and fix a polygon $P$ satisfying its disk inclusions. Then choose $lambda$ sufficiently large. There is a fixed aligned threshold $R_0$ such that every regular interface with smaller inner scale at least $R_0$ satisfies 
#[#set math.equation(numbering: n => "(11)")
 $ integral \( 1 - T_i^s \/ d_i \) product_ell d m_ell^s lt.eq xi $ <eq:source-11>]

 in each of the two unit-period sectors and in the centered sector. The individual flat-pin interactions in Equation (9) can also be made arbitrarily small with these choices.]
] <kernels:average-loss>

#proof[
  The integral of $T_i^s$ under the independent cut-block laws is $Z_(upright("restored"))^s \/ Z_(upright("cut"))^s$. Dividing this identity by its centered counterpart proves Equation (10). The same identity is valid for a joint exterior kernel, without a claim yet about its average loss.
  For a circular annulus of radii $1$ and $lambda$, the minimum energy with unit period $2 pi$ is $2 pi log lambda$. The angular function attains it, and integration on concentric circles proves the matching lower bound. Restriction of admissible forms, together with $B \( 0 \, 1 - epsilon \) subset P subset B \( 0 \, 1 + epsilon \)$, gives
  $ cal(M) \( lambda P \\ P^compose \) = 2 pi log lambda + O \( epsilon \) \, $
  where the constant is independent of large $lambda$. For example, the circular annulus with radii $1 + epsilon$ and $lambda \( 1 - epsilon \)$ is contained in the polygonal one, which in turn is contained in the circular annulus with radii $1 - epsilon$ and $lambda \( 1 + epsilon \)$. The same bounds apply with $lambda^2$ to the union of two blocks. It follows that
  $ 0 lt.eq cal(M) \( lambda^2 P \\ P^compose \) - 2 cal(M) \( lambda P \\ P^compose \) lt.eq C epsilon . $
  The lower bound follows by restriction to the two cut annuli; their energies agree by scale invariance in dimension two. Theorem 11, applied at this fixed geometry, therefore makes the last factor in Equation (10) converge to a number in $\[ e^(- C epsilon \/ \( 2 a \)) \, 1 \]$. Changing the unit period’s sign does not change its energy.
  Choose $epsilon$ to make this error small, and then choose $lambda$ so that Proposition 15 makes the two centered pin interactions small. Equation (9) and Equation (10) now give the desired small loss in the mesh limit. With $P$ and $lambda$ fixed, every regular interface is a refinement of one fixed geometry. The convergence theorems hold along every admissible mesh sequence, so there is one threshold $R_0$ beyond which the inequalities hold at every aligned scale. There are only three sectors to consider. This proves Equation (11). ◻
]

=== 5.3 A positive-kernel stability lemma <a-positive-kernel-stability-lemma>

The preceding estimate controls the average loss under independent guard laws. Actual guard data in a nest have been influenced by all the inner blocks. The following lemma bounds that change of law without accumulating a fixed error at every interface.

#thm([Lemma 5.4.])[
  (Stability from a positive initial weight).  #emph[Let $\( X_i \, m_i \)$, $i gt.eq 1$, be probability spaces, and let $t_i : X_i times X_(i + 1) arrow.r \( 0 \, 1 \]$ be measurable kernels with 
$ integral \( 1 - t_i \) thin d \( m_i ⊗ m_(i + 1) \) lt.eq xi \, #h(2em) 0 < xi < 1 \/ 64 . $

 Fix a measurable $g : X_1 arrow.r \( 0 \, 1 \]$, positive $m_1$-almost everywhere. For each $N$, give $X_1 times dots.h.c times X_N$ density proportional to 
$ g \( u_1 \) product_(i = 1)^(N - 1) t_i \( u_i \, u_(i + 1) \) $

 with respect to $product_i m_i$. For all sufficiently large $N$, its last-coordinate marginal has density at most $2$ with respect to $m_N$. No positive essential lower bound on $g$ is required.]
] <kernels:stability>

#proof[
  Define
  $ L_i f \( v \) = integral t_i \( u \, v \) f \( u \) thin d m_i \( u \) . $
  First propagate the constant density:
  $ q_1 = 1 \, #h(2em) beta_i = integral L_i q_i thin d m_(i + 1) \, #h(2em) q_(i + 1) = beta_i^(- 1) L_i q_i . $
  Inductively $q_i lt.eq 2$, because
  $ beta_i = 1 - integral \( 1 - t_i \) q_i thin d \( m_i ⊗ m_(i + 1) \) gt.eq 1 - 2 xi \, #h(2em) q_(i + 1) lt.eq M := \( 1 - 2 xi \)^(- 1) < 2 . $
  The same argument, with the kernels reversed, bounds by $2$ any normalized density obtained by propagating $1$ backwards through a finite number of them.
  Propagate $g$ using these same scalars, rather than renormalizing it at each step:
  $ f_1 = g \, #h(2em) f_(i + 1) = beta_i^(- 1) L_i f_i \, #h(2em) c_i = integral f_i thin d m_i \, #h(2em) E_i = f_i - c_i q_i . $
  The scalar $c_i$ is the ratio of the two integrals obtained by starting with $g$ and with $1$. Equivalently, it is the expectation of $g$ under a normalized backwards density on $X_1$, which is at most $2$. Choose $delta > 0$ with $m_1 \( g < delta \) < 1 \/ 4$. Every such density assigns at least half its mass to ${ g gt.eq delta }$, so
  #[#set math.equation(numbering: n => "(5.2)")
   $ c_i gt.eq delta \/ 2 quad upright("for every ") i . $ <kernels:core-mass>]
  For a mean-zero function $E$, replace $t_i$ in $L_i E$ by $t_i - 1$. Since $0 lt.eq \( 1 - t_i \)^2 lt.eq 1 - t_i$, the resulting operator has $L^2 \( m_i \)$-to-$L^2 \( m_(i + 1) \)$ norm at most $sqrt(xi)$. The exact recurrence for the centered remainder is
  $ E_(i + 1) = frac(L_i E_i - #scale(x: 120%, y: 120%)[\(] integral L_i E_i thin d m_(i + 1) #scale(x: 120%, y: 120%)[\)] q_(i + 1), beta_i) . $
  Using $parallel q_(i + 1) parallel_2 lt.eq 2$, we obtain
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel E_(i + 1) parallel_2 lt.eq frac(3 sqrt(xi), 1 - 2 xi) parallel E_i parallel_2 . $ <kernels:contraction>]
  The factor is strictly smaller than one. Also $t_i lt.eq 1$ gives $parallel L_i E_i parallel_oo lt.eq parallel E_i parallel_2$, and hence
  $ parallel E_(i + 1) parallel_oo lt.eq frac(3, 1 - 2 xi) parallel E_i parallel_2 . $
  Thus the remainders tend to zero in the last displayed norm. The last-coordinate density in the lemma is
  $ f_N \/ c_N = q_N + E_N \/ c_N . $
  Equation (5.2) and the strict inequality $M < 2$ show that it is eventually bounded by $2$. ◻
]

=== 5.4 Application to a nest of annuli <application-to-a-nest-of-annuli>

Fix the parameters in Proposition 18 with $xi < 1 \/ 64$, and increase the aligned $R_0$ if necessary. Set

$ R_j = R_0 lambda^j \, #h(2em) j gt.eq 0 . $

Let annulus $i$ have walls $R_(i - 1) P$ and $R_i P$, and fill the inner hole by the fixed core in $R_0 P$. The core is a fixed finite graph in lattice units. In a unit magnetic sector it contains the source; all regular annuli carry its period. Fix the core and the connection on the increasing family of blocks once and for all, so restrictions agree as the depth $N$ increases. A fixed straight connection cut from the source gives such a choice. Thus the first guard law and its core interface kernel do not vary with $N$.

#thm([Corollary 5.5.])[
  (The last guard law).  #emph[For these fixed choices, the last-guard law in a nest of $N$ annuli has density at most $2$ relative to $m_N^s$ for all sufficiently large $N$, in the centered sector and in either unit-period sector. The conclusion holds for identical lattice translates of the nest with the same threshold in $N$.]
] <kernels:last-guard>

#proof[
  Put $t_i = T_i^s \/ d_i$ for regular interfaces and $g = T_0^s \/ d_0$ for the core interface. Lemma 16 gives $0 < g lt.eq 1$ and $0 < t_i lt.eq 1$. Proposition 18 gives the average-loss hypothesis of Lemma 19. Exact multiplication in Lemma 17 identifies its last marginal with the actual last-guard law. The fixed initial weight $g$ may be arbitrarily small on some data; positivity is sufficient.
  A lattice translation preserves all block laws and kernels. Changing the source sign negates the connection and heights. More generally, a connection with the same source restricts on the nest to the chosen connection up to an integral gauge change, which merely reindexes the guard data. Taking the maximum of the finitely many thresholds for the centered and two unit sectors proves the assertion. ◻
]

== 6 Critical spin correlations <sec:correlations>

The sector limit of Section 3 and the gluing estimates of Section 5 now determine the spin correlations after normalization by the center magnetization. The microscopic part of each unit source will be represented by an identical nest of annuli. Its partition ratio need not have an asymptotic expansion: the same ratio occurs in the center observable and cancels.

Throughout this section, $k gt.eq 1$ is fixed, $sigma_i in { - 1 \, 1 }$, and

$ x_(i \, n) in D_n^compose \, #h(2em) x_(i \, n) arrow.r z_i in D \, #h(2em) z_i eq.not z_j quad \( i eq.not j \) . $

Write the continuum Dirichlet Green kernel as

$ G_D \( z \, w \) = frac(1, 2 pi) log frac(1, \| z - w \|) + R_D \( z \, w \) . $

The function $R_D$ is smooth across the diagonal on compact subsets of $D times D$. Define

$ H_D \( upright(bold(z)) \, bold(sigma) \) = sum_(i = 1)^k R_D \( z_i \, z_i \) + 2 sum_(i < j) sigma_i sigma_j G_D \( z_i \, z_j \) . $

No assumption on $sum_i sigma_i$ is imposed.

=== 6.1 The energy outside small holes <the-energy-outside-small-holes>

#thm([Lemma 6.1.])[
  (Exterior energy).  #emph[Remove the closed disks of radius $rho$ about the distinct points $z_1 \, dots.h \, z_k$ from $D$, where $rho > 0$ is small enough that these disks are disjoint and contained in $D$. For affine gradients with periods $2 pi sigma_i$ about the holes, the minimum energy of Equation (3) satisfies 
#[#set math.equation(numbering: n => "(12)")
 $ cal(M) = 2 pi k log \( 1 \/ rho \) + 4 pi^2 H_D \( upright(bold(z)) \, bold(sigma) \) + O \( rho \) . $ <eq:source-12>]

 The error constant may depend on the separated interior configuration, but is uniform for all sufficiently small $rho$.]
] <correlations:exterior-energy>

#proof[
  Set $U \( y \) = sum_i sigma_i G_D \( y \, z_i \)$, and rotate $- 2 pi nabla U$ by a right angle, with the orientation chosen to give the indicated periods. Denote the resulting vector field by $v$. It is a smooth affine gradient on the punctured square, is divergence free there, and is tangent to the outer boundary because $U$ has zero Dirichlet trace. Thus $v$ is an admissible trial field.
  Near $z_i$, write
  $ U \( y \) = frac(sigma_i, 2 pi) log frac(1, \| y - z_i \|) + u_i \( y \) \, #h(2em) u_i \( z_i \) = sigma_i R_D \( z_i \, z_i \) + sum_(j eq.not i) sigma_j G_D \( z_i \, z_j \) . $
  The functions $u_i$ are smooth and harmonic on fixed disjoint neighborhoods of the sources. On the boundary of a hole, the radial singularity contributes no normal component to $v$. Its remaining normal component is bounded uniformly in $rho$ and has integral zero, since it is a tangential derivative of $u_i$.
  Let $g in H^1$ on the punctured square. Integration by parts, followed by subtraction of the mean of $g$ on each inner circle, gives
  $ lr(|integral v dot.op nabla g|) lt.eq C rho thin parallel nabla g parallel_2 . $
  Indeed, the $L^2$ norm of $v dot.op nu$ on such a circle is $O \( rho^(1 \/ 2) \)$, whereas the trace and Poincaré inequalities on the adjacent annulus of radii $rho$ and $2 rho$ give
  $ parallel g - upright("its circle mean") parallel_(L^2 \( partial B \( z_i \, rho \) \)) lt.eq C rho^(1 \/ 2) parallel nabla g parallel_(L^2 \( B \( z_i \, 2 rho \) \\ B \( z_i \, rho \) \)) . $
  The collars are disjoint. Minimizing $parallel v + nabla g parallel_2^2$ therefore changes $parallel v parallel_2^2$ by at most $O \( rho^2 \)$.
  It remains to calculate $parallel v parallel_2^2 = \( 2 pi \)^2 integral \| nabla U \|^2$. The outer-boundary contribution to Green’s identity vanishes. On the circle about $z_i$, with $nu$ pointing into the hole, the integral of $U partial_nu U$ is
  $ frac(1, 2 pi) log \( 1 \/ rho \) + sigma_i u_i \( z_i \) + O \( rho \) . $
  The integral of the normal derivative of the regular harmonic part is zero; in particular it produces no logarithmically enhanced error. Summing over the circles gives Equation (12). These integrations may also be performed with weak Dirichlet data on the outer square. Alternatively, reflection across its sides and corners, away from the sources, justifies the boundary calculation directly. ◻
]

We shall apply this calculation to the rectilinear holes required by the lattice decomposition. Let $P$ be the polygon chosen in Section 4, so that

$ B \( 0 \, 1 - epsilon \) subset P subset B \( 0 \, 1 + epsilon \) . $

Here and in the next lemma, radii are in the scaled coordinates of $D$, rather than in lattice units.

#thm([Lemma 6.2.])[
  (Moving lattice holes).  #emph[Suppose that $rho_n arrow.r rho > 0$, where $rho$ is sufficiently small. Around $x_(i \, n)$, cut out the interiors in the array division with hole shape $rho_n P$, using the rounding conventions of Section 3. Let $F_(upright("ext"))^s$ be the sector ratio in the remaining dual graph, with periods $2 pi sigma_i$ about these holes. Then 
#[#set math.equation(numbering: n => "(13)")
 $ limsup_n lr(|log F_(upright("ext"))^s + frac(2 pi k log \( 1 \/ rho \) + 4 pi^2 H_D \( upright(bold(z)) \, bold(sigma) \), 2 a)|) lt.eq C \( epsilon + rho \) . $ <eq:source-13>]

 The constant $C$ depends on the separated limiting configuration but not on sufficiently small $rho$ or $epsilon$. The same assertion holds after bounded-step mesh rounding.]
] <correlations:exterior-lattice>

#proof[
  Bracket the moving holes by fixed, positively separated rectilinear holes with dyadic coordinates. To obtain strict eventual inclusions, start with circles of radii $\( 1 - 3 epsilon \) rho$ and $\( 1 + 3 epsilon \) rho$ about the limiting points, and approximate them and their centers by still smaller dyadic perturbations. The perturbations can be chosen after fixing $rho$ and $epsilon$. For all sufficiently large $n$, the rounded moving holes lie between these fixed approximations and contain their respective sources. The outer boundary remains the same square.
  Use one connection before making any of these cuts. Its restrictions to the three exteriors have the same winding data. The cut comparison in Equation (2) therefore brackets their sector ratios. Theorem 11 applies to each fixed polygonal exterior. Its continuum minimum energy is in turn bracketed by the energies for the corresponding circular holes: restriction of an admissible affine gradient preserves all the remaining periods. Changing each radius by a factor $1 + O \( epsilon \)$ changes the logarithmic term of Equation (12) by $O \( epsilon \)$. That equation now proves the claim.
  Every domain used in this argument has positive passages and separated hole boundaries. Coherent rounding consequently preserves connectivity and the cycles defining the periods. In particular the argument uses only fixed-domain limits; it does not require uniform convergence under arbitrary motion of the lattice marks. ◻
]

=== 6.2 Identical nests and their exterior attachment <identical-nests-and-their-exterior-attachment>

Fix the annular parameters $epsilon \, lambda \, R_0$ as in Section 5, and write

$ R_j = R_0 lambda^j \, #h(2em) N = N \( n \) = max { j : R_j lt.eq eta n } \, $

where $eta > 0$ is small. The $R_j$ are now lattice radii. Place identical translated nests, from their filled cores through their $N$-th annuli, around all $x_(i \, n)$. For sufficiently small $eta$, these nests have disjoint closures, are contained in the spin square, and leave a connected exterior. Use the same parameters and the same $N$ for a single nest centered at $0$, which will represent the observable $a_n$. Since $n x_(i \, n) in bb(Z)^2$, the microscopic cores and all annuli are exact lattice translates. The restricted connections differ only by integral gauge transformations; reversing a unit period also leaves a bare nest ratio unchanged.

We may pass further along any subsequence so that

$ R_N \/ n arrow.r t in \[ eta \/ lambda \, eta \] . $

For fixed $eta \, lambda$, this is a positive macroscopic radius. The following estimate concerns only the joint kernel which attaches the last annuli to the exterior. Its notation is that of Lemma 16: $d_(upright("ext"))$ is the centered kernel at zero relative guard data, and $m_(N \, i)^s$ is the cut law of the last guard in the $i$-th annulus.

#thm([Lemma 6.3.])[
  (Exterior attachment).  #emph[For every sufficiently small $xi > 0$, the parameters may be chosen so that Equation (11) holds throughout the regular annuli and 
#[#set math.equation(numbering: n => "(14)")
 $ limsup_n integral (1 - T_(upright("ext"))^s / d_(upright("ext"))) product_(i = 1)^k d m_(N \, i)^s lt.eq xi . $ <eq:source-14>]

 This holds both for the shifted and centered calculations and for the single center nest. The parameters depend on the fixed separated configuration and on $xi$, but not on $n$. The errors in Equation (13) at the radii in this construction may simultaneously be made at most $xi$.]
] <correlations:attachment>

#proof[
  For the centered calculation, Equation (9) bounds the attachment loss by the sum of the flat-pin interactions in the incident last annuli. These interactions can be made as small as desired by the choices in Section 4. The bound depends only on these annuli, not on the exterior.
  For the shifted calculation use the exact identity in Equation (10), now for the last annuli together with their common exterior. Restoring them produces an exterior whose smaller holes have radius parameter tending to $t \/ lambda$. Before restoration, the factors are the $k$ last-annulus sector ratios and the exterior ratio with holes of radius parameter $t$. By Theorem 11, each annular energy is $2 pi log lambda + O \( epsilon \)$. By Equation (13), the restored and cut exterior energies have the same term $4 pi^2 H_D \( upright(bold(z)) \, bold(sigma) \)$. The difference between their radius terms is exactly $k thin 2 pi log lambda$. Consequently the logarithm of the restored sector ratio divided by the product of the cut ratios has absolute limiting error at most $C \( epsilon + eta \)$. The circular energy brackets make this error uniform over $t in \[ eta \/ lambda \, eta \]$ and over sufficiently large fixed $lambda$.
  Choose $epsilon$ and $eta$ small, then choose $lambda$ large enough for the flat-pin interactions, and finally choose $R_0$ large enough for the fixed annular geometry. These choices retain the regular-interface estimate Equation (11). The preceding centered estimate, the restored-to-cut identity, and the upper bound $T_(upright("ext"))^s \/ d_(upright("ext")) lt.eq 1$ now give Equation (14), after making the preliminary errors small enough in terms of $xi$. Apply the same choices to the one-source configuration at $0$.
  The argument was given after extraction of a limit $t$. Every subsequence has such a further subsequence, and the error bounds are uniform over its possible values. It therefore proves the stated limiting bounds on the full sequence. All height and pin limits used here precede variation of the fixed geometric parameters; no rate uniform in a shrinking physical radius has been assumed. ◻
]

#thm([Proposition 6.4.])[
  (Center-normalized correlations).  #emph[For the separated moving marks fixed at the beginning of this section, 
#[#set math.equation(numbering: n => "(15)")
 $ lim_n log (frac(bb(E)_n^0 exp \( i sum_i sigma_i theta_(x_(i \, n)) \), a_n^k)) = - frac(H_D \( upright(bold(z)) \, bold(sigma) \) - k R_D \( 0 \, 0 \), 2 K_(*)) . $ <eq:source-15>]

]
] <correlations:separated>

#proof[
  Let $F_(upright("nest")) \( R_N \)$ denote the bare sector ratio of one whole free nest with a unit source, including its core. It is the same for all the translated sources, for either sign, and for the center reference. By Lemma 17, the partition function of the whole graph is the product of its cut block partition functions times its gluing-kernel expectation. After the kernels internal to each nest have been integrated, its last-guard law has density at most $2$ relative to $m_N^s$, for all sufficiently large $N$, by Corollary 20.
  Write $e_s$ for the expectation of $T_(upright("ext"))^s \/ d_(upright("ext"))$ under the product of these propagated last-guard laws, and $e_0$ for the corresponding centered expectation. Equation (14) and the product density bound give
  $ 1 - 2^k xi - o \( 1 \) lt.eq e_s lt.eq 1 $
  in both sectors. The centered factor $d_(upright("ext"))$ cancels between the numerator and denominator, leaving the exact identity
  $ bb(E)_n^0 exp (i sum_i sigma_i theta_(x_(i \, n))) = F_(upright("nest")) \( R_N \)^k F_(upright("ext"))^s thin e_s / e_0 . $
  Taking logarithms, with $xi$ small at this fixed $k$, gives
  $ log bb(E)_n^0 exp (i sum_i sigma_i theta_(x_(i \, n))) = k log F_(upright("nest")) \( R_N \) + log F_(upright("ext"))^s + O_k \( xi \) + o \( 1 \) . $
  The same calculation with the single center source expresses $log a_n$ using this identical nest ratio. Subtracting $k$ times that expression cancels the microscopic term exactly. In Equation (13), the common-radius logarithms also cancel. The remaining coefficient is
  $ frac(4 pi^2, 2 a) = frac(1, 2 K_(*)) \, #h(2em) a = 8 pi \, quad K_(*) = 2 / pi . $
  This proves Equation (15) up to an error that can be made arbitrarily small.
  For completeness, the choices of nests may depend on that accuracy. This is harmless: the quantity on the left is always the same exact observable. If its asserted convergence failed, a subsequence with a fixed positive error would, at a sufficiently high chosen accuracy, have a further subsequence with $R_N \/ n arrow.r t$ and a smaller error by the preceding calculation, a contradiction. ◻
]

=== 6.3 The deterministic diagonal correction <the-deterministic-diagonal-correction>

#thm([Lemma 6.5.])[
  (Green diagonal differences).  #emph[If $x_n in D_n^compose$ and $x_n arrow.r z in D$, then 
#[#set math.equation(numbering: n => "(16)")
 $ G_n \( x_n \, x_n \) - G_n \( 0 \, 0 \) arrow.r R_D \( z \, z \) - R_D \( 0 \, 0 \) . $ <eq:source-16>]

 These differences are bounded uniformly when $x_n$ ranges over a fixed compact subset of $D$.]
] <correlations:green-diagonal>

#proof[
  The killed Green estimate in [14] Lemma 4.2 gives local uniform convergence of $G_n$ to $G_D$ off the diagonal, with exactly the unscaled Laplacian convention used here. We explain how to recover the difference of the diagonals without specifying their common lattice constant.
  Choose a small fixed box $Q$ of displacement vectors about $0$ such that $x_n + Q$ and $Q$ remain in $D$ for all large $n$. For lattice displacement vectors $v$, set
  $ h_n \( v \) = G_n \( x_n \, x_n + v \) - G_n \( 0 \, v \) . $
  Both kernels have the same unit source at $v = 0$. Their difference is therefore discrete harmonic throughout $Q$, including at $v = 0$. On a coherently rounded boundary of $Q$, the off-diagonal convergence identifies its limit as
  $ G_D \( z \, z + v \) - G_D \( 0 \, v \) = R_D \( z \, z + v \) - R_D \( 0 \, v \) . $
  The discrete maximum principle bounds $h_n \( 0 \)$ between the minimum and maximum of these boundary values, up to an error tending to zero. Shrinking $Q$ and using continuity gives Equation (16). If uniform boundedness on an interior compact failed, a violating sequence would have a convergent subsequence of its locations. The convergence just proved would contradict that violation. The finitely many remaining lattice sizes cause no difficulty. ◻
]

For $sigma in { - 1 \, 1 }$, define the normalized point fields

$ W_n^sigma \( x \) = a_n^(- 1) exp {frac(G_n \( x \, x \) - G_n \( 0 \, 0 \), 2 K_(*))} e^(i sigma theta_x) . $

Thus $S_n \( f \) = n^(- 2) sum_x f \( x \) W_n^(+) \( x \)$, and changing the sign conjugates the point field without conjugating a test function.

#thm([Corollary 6.6.])[
  (Normalized separated correlations).  #emph[For every fixed separated moving configuration as above, 
#[#set math.equation(numbering: n => "(17)")
 $ lim_n bb(E)_n^0 product_(i = 1)^k W_n^(sigma_i) \( x_(i \, n) \) = exp {- 1 / K_(*) sum_(i < j) sigma_i sigma_j G_D \( z_i \, z_j \)} . $ <eq:source-17>]

 The convergence to the same kernel evaluated at the lattice locations is uniform when those locations range over a compact interior set and their mutual distances are bounded below by a fixed positive number.]
] <correlations:normalized>

#proof[
  Exponentiate Equation (15), multiply by the deterministic normalizing factors, and use Equation (16). The terms $sum_i R_D \( z_i \, z_i \) - k R_D \( 0 \, 0 \)$ cancel exactly. For uniformity, a sequence of violations in a compact separated configuration space would have a convergent subsequence, to which the just-proved sequential convergence applies. ◻
]

=== 6.4 A bound through the two-point diagonal <a-bound-through-the-two-point-diagonal>

The separated formula alone does not control moment sums near collisions. For that purpose a weaker, integrable power bound suffices. We obtain it by cutting two disjoint nests at a scale comparable to the distance between their marks.

Fix the annular parameters once and for all, with accuracy high enough that the center attachment in Lemma 23 is bounded away from zero. Keep $N \( n \) = max { j : R_j lt.eq eta n }$ for these fixed parameters.

#thm([Lemma 6.7.])[
  (Nest lower bounds).  #emph[There are constants $c \, c' > 0$, independent of $n \, N \, j$, such that, for all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(18)")
 $ a_n gt.eq c thin F_(upright("nest")) \( R_(N \( n \)) \) \, $ <eq:source-18>]

 and, for every $N gt.eq j gt.eq 0$, 
#[#set math.equation(numbering: n => "(19)")
 $ F_(upright("nest")) \( R_N \) gt.eq c' lambda^(- \( N - j \) \/ 2) F_(upright("nest")) \( R_j \) . $ <eq:source-19>]

 Here $j = 0$ means the filled core alone.]
] <correlations:nest-bounds>

#proof[
  For the single center source, the normalized exterior attachment has a positive lower bound in the shifted sector and is at most one in the centered sector. Its exterior sector ratio is also bounded away from zero by Equation (13): every subsequential hole radius lies in the fixed interval $\[ eta \/ lambda \, eta \]$. The exact gluing identity therefore gives Equation (18). The compact subsequence argument makes the lower bound uniform for all sufficiently large $n$.
  Next add one regular annulus to a nest. Its sector ratio multiplies the nest ratio, together with the ratio of the shifted and centered attachment expectations. Normalize these two expectations by their common centered zero-data value. The centered expectation is at most one. Once the nest is sufficiently long, its last-data density is at most two, so Equation (11) makes the shifted expectation at least $1 - 2 xi$.
  By Theorem 11 and the circular annular energy bracket, the annular sector factor at large lattice scales is bounded below by
  $ lambda^(- 1 \/ 8) exp { - O \( epsilon \) - o \( 1 \) } \, #h(2em) pi / a = 1 / 8 . $
  Include in the fixed parameter choices that $lambda$ and then the lattice threshold are sufficiently large. Each sufficiently late extension factor is then at least $lambda^(- 1 \/ 2)$. There are only finitely many earlier extension factors, all strictly positive. Their losses relative to this lower bound can be absorbed into a single $c' > 0$, valid for every interval of extension indices. Multiplication proves Equation (19). ◻
]

#thm([Proposition 6.8.])[
  (Two-point collision bound).  #emph[For every compact $E subset.double D$, there is $C_E < oo$ such that, for all $n gt.eq 1$, all $x \, y in E ∩ D_n^compose$, including $x = y$, and all $sigma \, tau in { - 1 \, 1 }$, 
#[#set math.equation(numbering: n => "(20)")
 $ 0 lt.eq bb(E)_n^0 #scale(x: 120%, y: 120%)[\[] W_n^sigma \( x \) W_n^tau \( y \) #scale(x: 120%, y: 120%)[\]] lt.eq C_E #scale(x: 120%, y: 120%)[\(] \| x - y \| + 1 \/ n #scale(x: 120%, y: 120%)[\)]^(- 1) . $ <eq:source-20>]

 Expectations of products of any number of the point fields $W_n^sigma$, with arbitrary signs and repeated locations, are also nonnegative.]
] <correlations:diagonal>

#proof[
  Write $r = n \| x - y \|$. Choose $c_E > 0$ so small that nests of radius $R lt.eq c_E r$, centered at $x$ and $y$ in lattice units, are disjoint and contained in the spin square. Decrease $c_E$, if necessary, so that $c_E r lt.eq eta n$ for all locations under consideration.
  If there is a largest $j gt.eq 0$ with $R_j lt.eq c_E r$, cut out these two nests. The restriction of the magnetic sector to each nest has its single unit source. The cut comparison and the upper bound one for the remaining sector ratio give
  $ bb(E)_n^0 e^(i sigma theta_x + i tau theta_y) lt.eq F_(upright("nest")) \( R_j \)^2 . $
  Equations (18) and (19) yield
  $ frac(bb(E)_n^0 e^(i sigma theta_x + i tau theta_y), a_n^2) lt.eq C lambda^(N - j) . $
  The maximality of $j$ gives $R_j > c_E r \/ lambda$, while $R_N lt.eq eta n$. Since $R_N \/ R_j = lambda^(N - j)$, this is at most $C_E n \/ \( 1 + r \)$, after increasing the constant.
  If no such $j$ exists, then $r < R_0 \/ c_E$. Use the bare expectation bound by one and Equation (19) with $j = 0$, together with Equation (18). The fixed core ratio is positive, and hence
  $ a_n^(- 2) lt.eq C lambda^N lt.eq C n lt.eq C_E frac(n, 1 + r) . $
  This case includes repeated locations with either pair of signs. The deterministic Green factors in the two $W_n$’s are uniformly bounded on $E$ by Lemma 25. They therefore preserve the bound. Increasing $C_E$ handles the finitely many smaller lattice sizes.
  Finally, the Fourier current expansion of the pinned XY law expresses each integer-charge correlation as a sum of nonnegative weights divided by a positive partition function. The fixed boundary imposes no neutrality constraint; repeated locations merely add their charges. Multiplication by the positive deterministic factors proves all the asserted nonnegativity statements. ◻
]

== 7 Laws and moments of the critical field <sec:fields>

Section 6 gives the signed correlations at separated points and a bound valid up to the two-point diagonal. We now pass from these estimates to the field limit. The main issue is to remove collisions of arbitrarily many lattice sites using only the two-point bound. A Lee–Yang estimate for absolute moments supplies this step. We also construct the continuum field and its mixed moments, so that the full Dirichlet variance remains visible in the identification.

The argument develops the proofs of [14] Lemmas 5.10–5.11 and Theorem 5.12. We give the transfer argument here with the exact normalization of this paper: the common scalar multiplying $exp { G_n \( x \, x \) \/ \( 2 K_(*) \) } e^(i sigma theta_x)$ is $a_n^(- 1) exp { - G_n \( 0 \, 0 \) \/ \( 2 K_(*) \) }$, which may depend on $n$. The statement of the cited transfer theorem instead uses a fixed scalar. Throughout this section,

$ S_n^sigma \( f \) = n^(- 2) sum_(x in D_n^compose) f \( x \) W_n^sigma \( x \) \, #h(2em) sigma in { - 1 \, 1 } \, $

with $W_n^sigma$ defined in Section 6; thus $S_n^(+) = S_n$ and $S_n^(-) \( f \) = overline(S_n^(+) \( overline(f) \))$. The same sign convention will be used for continuum fields. In particular the minus sign conjugates the field, and conjugating an entire evaluation also conjugates its test function.

=== 7.1 Absolute moments from Lee–Yang <absolute-moments-from-leeyang>

The following finite-volume estimate applies to arbitrary nonnegative weights. Their size, spatial variation, and dependence on the mesh will therefore place no restriction on its use for $S_n$.

#thm([Lemma 7.1.])[
  (Lee–Yang absolute moment bound).  #emph[Consider a finite ferromagnetic XY model with nonnegative edge couplings and all boundary angles fixed to zero. For deterministic weights $lambda_x gt.eq 0$, set 
$ W = sum_x lambda_x e^(i theta_x) \, #h(2em) v = bb(E) \| W \|^2 . $

 There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel W parallel_(L^p) lt.eq C sqrt(p) thin v^(1 \/ 2) \, #h(2em) p gt.eq 2 . $ <fields:ly-bound>]

 For every finite list of vertices, including repetitions, and every choice of signs $sigma_i in { - 1 \, 1 }$, one also has 
#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E) exp {i sum_i sigma_i theta_(x_i)} gt.eq 0 . $ <fields:positive-moments>]

]
] <fields:lee-yang>

#proof[
  Let $U$ be independent and uniform on the circle, and rotate every spin, including each boundary spin, by $U$. Subtracting the common boundary angle recovers the original fixed-boundary law. Put $X = "Re" \( e^(i U) W \)$. The finite-graph XY Lee–Yang Theorem, with the common uniformly distributed boundary convention, says that the entire function $bb(E) e^(z X)$ has only imaginary zeros [13] Theorem 1 and Remark 5. One may obtain this boundary convention on simple graphs by adjoining a vertex of observable weight zero, joining it ferromagnetically to every boundary vertex, and taking all these added couplings to infinity. The limiting spins on the boundary equal the new spin, whose angle is uniform by rotation invariance. The bounded observable gives locally uniform convergence of the Laplace transforms; the zero-free half-planes persist under this limit.
  The random variable $X$ is symmetric and bounded. Hence its Lee–Yang product representation [13] Proposition 13 is
  $ bb(E) e^(z X) = e^(B z^2) product_j \( 1 + z^2 \/ y_j^2 \) \, #h(2em) B gt.eq 0 \, quad sum_j y_j^(- 2) < oo \, quad B + sum_j y_j^(- 2) = 1 / 2 bb(E) X^2 . $
  The zeros are listed as pairs $plus.minus i y_j$, with $y_j > 0$ and multiplicity. Since uniform rotation gives $bb(E) X^2 = v \/ 2$, the inequality $1 + u lt.eq e^u$ yields
  #[#set math.equation(numbering: n => "(7.3)")
   $ bb(E) e^(t X) lt.eq e^(t^2 v \/ 4) \, #h(2em) t in bb(R) . $ <fields:ly-laplace>]
  The variable $Y = "Im" \( e^(i U) W \)$ has the same law as $X$. If $v > 0$, Chernoff’s Inequality applied to both signs of $X$ and $Y$ therefore gives
  $ bb(P) { \| W \| > r } lt.eq bb(P) { \| X \| > r \/ sqrt(2) } + bb(P) { \| Y \| > r \/ sqrt(2) } lt.eq 4 e^(- r^2 \/ \( 2 v \)) \, #h(2em) r > 0 . $
  Integrating this bound against $p r^(p - 1) thin d r$ gives $bb(E) \| W \|^p lt.eq 2 p \( 2 v \)^(p \/ 2) Gamma \( p \/ 2 \)$, which implies Equation (7.1). When $v = 0$, the assertion is immediate. The auxiliary rotation has left $\| W \|$ unchanged.
  For Equation (7.2), orient the edges arbitrarily and expand each interaction in its absolutely convergent Fourier series. If an edge has coupling $b gt.eq 0$, its coefficients are
  $ I_k \( b \) = sum_(r = 0)^oo frac(\( b \/ 2 \)^(2 r + \| k \|), r ! \( r + \| k \| \) !) gt.eq 0 \, #h(2em) k in bb(Z) . $
  At $b = 0$ these are interpreted as $I_0 \( 0 \) = 1$ and $I_k \( 0 \) = 0$ for $k eq.not 0$. Integrating each interior angle imposes the divergence constraint prescribed by the inserted charges on the integer edge currents. Boundary angles are zero, so they contribute a factor one and impose no divergence constraint. Each surviving summand is nonnegative, and the partition function in the denominator is positive. Repeated vertices simply add their integer charges. ◻
]

=== 7.2 The continuum circle field <the-continuum-circle-field>

We next identify the continuum moments which arise from Equation (17). We state the construction for the whole range in which the collision bound below is integrable. The circle-averaging argument follows [14] Lemma 5.11; its use of covariance positivity is related to the Onsager estimate in [4] Proposition 3.9. We include the bound for unequal radii, which is needed to compare two regularizations.

#thm([Lemma 7.2.])[
  (Circle Wick field and its mixed moments).  #emph[Let $K > 1 \/ \( 4 pi \)$ and let $Phi_D$ be the zero-Dirichlet Gaussian free field with covariance $G_D = \( - Delta_D \)^(- 1)$. Where the circle of radius $epsilon$ about $x$ lies in $D$, define 
$ V_epsilon \( x \) = exp {frac(i Phi_(D \, epsilon) \( x \), sqrt(K)) + frac(bb(E) Phi_(D \, epsilon) \( x \)^2, 2 K)} . $

 There exists a complex random distribution $V_(K \, D) in H_(upright("loc"))^(- 2) \( D \)$ such that, for every $f in C_c^oo \( D \; bb(C) \)$, $V_epsilon \( f \) arrow.r V_(K \, D) \( f \)$ in every finite $L^p$. For every smooth compactly supported cutoff $chi$, $chi V_epsilon arrow.r chi V_(K \, D)$ in $L^2 \( Omega \; H^(- 2) \)$. For $m gt.eq 1$, arbitrary signs $sigma_i in { - 1 \, 1 }$, and $f_i in C_c^oo \( D \; bb(C) \)$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) product_(i = 1)^m V_(K \, D)^(sigma_i) \( f_i \) = integral_(D^m) product_(i = 1)^m f_i \( x_i \) exp {- 1 / K sum_(i < j) sigma_i sigma_j G_D \( x_i \, x_j \)} thin d x_1 dots.h.c d x_m . $ <fields:continuum-moments>]

 The integral is absolutely convergent. In particular, $bb(E) V_(K \, D) \( f \) = integral_D f \( x \) thin d x$.]
] <fields:circle-chaos>

#proof[
  Fix a compact set $E subset.double D$ containing the supports of the tests, and choose $0 < rho < 1$ so that its closed $2 rho$-neighborhood lies in $D$. On that neighborhood write
  $ G_D \( u \, v \) = frac(1, 2 pi) log frac(1, \| u - v \|) + R_D \( u \, v \) \, #h(2em) q = frac(1, 2 pi K) < 2 . $
  The remainder $R_D$ is smooth and bounded, including across the diagonal. Let $C_(a \, b) \( x \, y \)$ be the covariance of the circle averages of $Phi_D \/ sqrt(K)$ with centers $x \, y in E$ and radii $a \, b lt.eq rho$. We first establish, uniformly in both radii,
  #[#set math.equation(numbering: n => "(7.5)")
   $ C_(a \, b) \( x \, y \) = q log frac(1, max { \| x - y \| \, a \, b }) + O_(E \, K) \( 1 \) . $ <fields:circle-covariance>]
  To see this, put $r = \| x - y \|$ and $M = max { r \, a \, b }$. The double circle average of the logarithm of the distance equals
  $ L_(a \, b) \( r \) = frac(1, 2 pi) integral_0^(2 pi) log max { a \, \| r + b e^(i t) \| } thin d t . $
  Here we have used the elementary circle-mean identity $\( 2 pi \)^(- 1) integral_0^(2 pi) log \| z - a e^(i t) \| thin d t = log max { \| z \| \, a }$. The integrand is at most $log \( 2 M \)$. If $a = M$, it is at least $log M$. Otherwise, its integral is bounded below by the circle mean of $log \| r + b e^(i t) \|$, which is $log max { r \, b } = log M$. Thus $log M lt.eq L_(a \, b) \( r \) lt.eq log M + log 2$. Together with the bounded remainder this proves Equation (7.5), even for coincident centers. The finite logarithmic integrals also justify the covariances of the circle averages.
  For arbitrary radii $epsilon_i lt.eq rho$, Gaussian integration and cancellation of the full diagonal variances give
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) product_(i = 1)^m V_(epsilon_i)^(sigma_i) \( x_i \) = exp {- sum_(i < j) sigma_i sigma_j C_(epsilon_i \, epsilon_j) \( x_i \, x_j \)} . $ <fields:regularized-kernel>]
  At the pointwise level $V_epsilon^(-)$ denotes $overline(V_epsilon)$. To dominate this expression for all signs and all collision patterns, suppose that $m gt.eq 2$ and the centers are distinct, and set
  $ d_i = min { rho \, min_(j eq.not i) \| x_i - x_j \| } \, #h(2em) r_i = max { epsilon_i \, d_i \/ 4 } . $
  All circles with radii $r_i$ remain in $D$. For $i eq.not j$,
  $ max { \| x_i - x_j \| \, r_i \, r_j } = max { \| x_i - x_j \| \, epsilon_i \, epsilon_j } . $
  Consequently enlarging the radii changes each off-diagonal covariance by a bounded amount. If $C^r$ is the covariance matrix for the enlarged circles, its positive semidefiniteness gives
  $ - sum_(i < j) sigma_i sigma_j C_(i j)^r = 1 / 2 sum_i C_(i i)^r - 1 / 2 sum_(i \, j) sigma_i sigma_j C_(i j)^r lt.eq 1 / 2 sum_i C_(i i)^r . $
  Since $C_(i i)^r lt.eq q log \( 4 \/ d_i \) + C_(E \, K)$, we obtain
  #[#set math.equation(numbering: n => "(7.7)")
   $ 0 < bb(E) product_i V_(epsilon_i)^(sigma_i) \( x_i \) lt.eq C_(E \, K \, m) product_i d_i^(- q \/ 2) . $ <fields:continuum-domination>]
  This bound is independent of every radius, including their relative sizes. For $m = 1$ the expectation is exactly one.
  We verify explicitly that the right side is integrable on $E^m$. Put $alpha = q \/ 2 < 1$ and use
  $ d_i^(- alpha) lt.eq rho^(- alpha) + sum_(j eq.not i) \| x_i - x_j \|^(- alpha) . $
  Expanding the product produces finitely many directed graphs on ${ 1 \, dots.h \, m }$, with at most one outgoing edge from each vertex and no self-edge. An edge $i arrow.r j$ contributes $\| x_i - x_j \|^(- alpha)$. Each connected component is a tree, or consists of one directed cycle with trees attached. Vertices with no incoming edge can be integrated first: each has at most one remaining incident edge, and
  #[#set math.equation(numbering: n => "(7.8)")
   $ sup_(y in E) integral_E \| x - y \|^(- s) thin d x < oo \, #h(2em) 0 lt.eq s < 2 . $ <fields:polar-integral>]
  This follows by polar integration over a fixed disk containing $E - E$. It removes all trees at a uniform cost. A cycle on two vertices contributes $\| x - y \|^(- 2 alpha)$ and is integrable because $2 alpha = q < 2$. For a cycle on at least three vertices, integrate one vertex using Cauchy–Schwarz:
  $ integral_E \| x - y \|^(- alpha) \| x - z \|^(- alpha) thin d x lt.eq (integral_E \| x - y \|^(- 2 alpha) thin d x)^(1 \/ 2) (integral_E \| x - z \|^(- 2 alpha) thin d x)^(1 \/ 2) lt.eq C_(E \, alpha) . $
  The remaining graph is a path, which can be integrated from its ends. Isolated vertices contribute $\| E \|$. Hence every term of the expansion is integrable, including near simultaneous collisions of any number of centers.
  At distinct centers, $C_(epsilon_i \, epsilon_j) \( x_i \, x_j \) arrow.r G_D \( x_i \, x_j \) \/ K$ as all radii tend to zero, with no restriction on their relative rates. Equations (7.6) and (7.7) now give convergence of all integrated mixed kernels by dominated convergence. In particular, the second mixed kernels with radii $epsilon \, delta$ show that $V_epsilon \( f \)$ is Cauchy in $L^2$. Taking equal numbers of positive and negative signs gives uniform bounds for every even absolute moment. For any finite $p$, choose an even order greater than $p$. These bounds and $L^2$ convergence give convergence in $L^p$ by uniform integrability. Hölder’s Inequality then passes each mixed product to the limit and proves Equation (7.4).
  It remains to realize these limits as one random distribution. Choose a flat torus whose fundamental square contains $overline(D)$ in its interior, with normalized Fourier basis $e_nu$, $nu in bb(Z)^2$. For a fixed $chi in C_c^oo \( D \)$, Equation (7.7) with two factors implies
  $ sup_(nu \, med 0 < epsilon < epsilon_chi) bb(E) \| V_epsilon \( chi e_nu \) \|^2 < oo $
  for sufficiently small $epsilon_chi > 0$. Each Fourier coefficient is Cauchy in $L^2$, and $sum_(nu in bb(Z)^2) \( 1 + \| nu \|^2 \)^(- 2) < oo$. Dominated convergence in this series proves that $chi V_epsilon$ is Cauchy in $L^2 \( Omega \; H^(- 2) \)$ on the torus. Choose a countable exhaustion by smooth cutoffs which equal one near the supports of their predecessors. Their limits are compatible, since multiplication by a smooth function is continuous on $H^(- 2)$. They define an almost surely $H_(upright("loc"))^(- 2)$ distribution $V_(K \, D)$, and testing recovers the scalar limits already constructed. Localization identifies these torus Sobolev spaces with the Euclidean local spaces on $D$. This proves all the asserted convergence. In particular the normalization uses the complete Dirichlet variance, including its finite spatial part. ◻
]

At $K = K_(*) = 2 \/ pi$ the parameter $q$ in the proof is $1 \/ 4$, and Lemma 30 constructs precisely the field $V_(*)$ in Theorem 1. We next prove that its mixed moments are the limits of the lattice moments.

=== 7.3 Uniform bounds and removal of collisions <uniform-bounds-and-removal-of-collisions>

#thm([Lemma 7.3.])[
  (Bounds for smeared lattice fields).  #emph[For every compact $E subset.double D$, every bounded complex function $f$ supported in $E$, and every $p gt.eq 2$, 
#[#set math.equation(numbering: n => "(7.9)")
 $ bb(E)_n^0 \| S_n^sigma \( f \) \|^2 lt.eq C_E parallel f parallel_oo^2 \, #h(2em) parallel S_n^sigma \( f \) parallel_(L^p) lt.eq C_E sqrt(p) thin parallel f parallel_oo \, $ <fields:test-bounds>]

 uniformly in $n$ and $sigma in { - 1 \, 1 }$. If $B subset E$ is a square of side $d lt.eq 1$, then 
#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)_n^0 \| S_n^sigma \( 1_B \) \|^2 lt.eq C_E \( d + n^(- 1) \)^3 \, #h(2em) parallel S_n^sigma \( 1_B \) parallel_(L^p) lt.eq C_E sqrt(p) thin \( d + n^(- 1) \)^(3 \/ 2) . $ <fields:box-bounds>]

]
] <fields:moment-bounds>

#proof[
  Write $h = n^(- 1)$. For a fixed $x in B ∩ D_n^compose$, the shell $j h lt.eq \| x - y \| < \( j + 1 \) h$ contains at most $C \( j + 1 \)$ lattice points. Equation (20) thus implies
  $ h^2 sum_(y in B ∩ D_n^compose) \( \| x - y \| + h \)^(- 1) lt.eq C h sum_(0 lt.eq j lt.eq C \( d \/ h + 1 \)) 1 lt.eq C \( d + h \) . $
  There are at most $C \( d \/ h + 1 \)^2$ choices of $x$, so a second summation, including its factor $h^2$, proves the first bound in Equation (7.10). Summation over a fixed compact set gives a uniform bound for its indicator. Positivity of the opposite-sign two-point expectation then gives, for arbitrary complex $f$ supported there,
  $ bb(E)_n^0 \| S_n^(+) \( f \) \|^2 lt.eq h^4 sum_(x \, y in E ∩ D_n^compose) \| f \( x \) \| thin \| f \( y \) \| thin bb(E)_n^0 \[ W_n^(+) \( x \) W_n^(-) \( y \) \] lt.eq C_E parallel f parallel_oo^2 . $
  For a nonnegative weight $w$, the coefficients of the spins in $S_n^(+) \( w \)$ are
  $ lambda_x = n^(- 2) w \( x \) a_n^(- 1) exp {frac(G_n \( x \, x \) - G_n \( 0 \, 0 \), 2 K_(*))} gt.eq 0 . $
  Lemma 29 applies to these exact coefficients for each $n$. It proves the second box bound from the first. For a complex weight, decompose
  $ f = \( "Re" f \)_(+) - \( "Re" f \)_(-) + i \( "Im" f \)_(+) - i \( "Im" f \)_(-) . $
  Each nonnegative summand is bounded by $parallel f parallel_oo$ and supported in $E$. Minkowski’s Inequality and the Lee–Yang bound prove the second estimate in Equation (7.9). Conjugation proves the same bounds for the minus field. ◻
]

#thm([Proposition 7.4.])[
  (Convergence of every mixed moment).  #emph[For every $m gt.eq 1$, signs $sigma_i in { - 1 \, 1 }$, and $f_i in C_c^oo \( D \; bb(C) \)$, 
#[#set math.equation(numbering: n => "(7.11)")
 $ lim_(n arrow.r oo) bb(E)_n^0 product_(i = 1)^m S_n^(sigma_i) \( f_i \) = bb(E) product_(i = 1)^m V_(*)^(sigma_i) \( f_i \) . $ <fields:lattice-moment-limit>]

 The right side is the integral in Equation (7.4) with $K = K_(*)$.]
] <fields:moments>

#proof[
  Let $E subset.double D$ contain all supports. The case $m = 1$ follows from Equation (17), uniformly on $E$, and Riemann summation. Assume $m gt.eq 2$ and expand the moment as a sum over $\( x_1 \, dots.h \, x_m \) in \( D_n^compose \)^m$. All signed correlations in this sum are nonnegative by Equation (7.2) and the positivity of the deterministic normalizers.
  Fix two indices $i eq.not j$ and a small $d > 0$. Enlarging the squares of a grid of side $d$ by a fixed factor gives a family $cal(B)_d$ of at most $C_E d^(- 2)$ squares, each of side at most $C d$, such that every pair $x_i \, x_j in E$ with $\| x_i - x_j \| < d$ lies in one of these squares. All these squares lie in a fixed larger compact set $E' subset.double D$ when $d$ is small. Positivity allows us to bound the absolute value of the restricted moment sum by
  $ (product_(ell = 1)^m parallel f_ell parallel_oo) sum_(B in cal(B)_d) bb(E)_n^0 [S_n^(sigma_i) \( 1_B \) S_n^(sigma_j) \( 1_B \) product_(ell eq.not i \, j) S_n^(sigma_ell) \( 1_(E') \)] . $
  Each expectation is nonnegative. Its absolute value is at most the expectation of the product of absolute values. Hölder’s Inequality with $m$ equal exponents and Lemmas 29 and 31 bound it by
  $ C_(E' \, m) parallel S_n^(+) \( 1_B \) parallel_(L^2)^2 lt.eq C_(E' \, m) \( d + n^(- 1) \)^3 . $
  Indeed the two box factors each contribute their $L^2$ norm times a constant depending only on $m$, and every other factor has a uniformly bounded $L^m$ norm. Summing over all pairs proves
  #[#set math.equation(numbering: n => "(7.12)")
   $ limsup_(n arrow.r oo) n^(- 2 m) #h(-0.16667em) #h(-0.16667em) sum_(x_1 \, dots.h \, x_m in D_n^compose\
min_(i < j) \| x_i - x_j \| < d) (product_i \| f_i \( x_i \) \|) bb(E)_n^0 product_i W_n^(sigma_i) \( x_i \) lt.eq C_(E \, m \, f_1 \, dots.h \, f_m) d . $ <fields:collision-bound>]
  In particular repeated lattice sites, of every multiplicity and every choice of signs, are included in this estimate.
  Choose a continuous cutoff on configurations which vanishes when some pair is at distance at most $d$ and equals one when every pair is at distance at least $2 d$. On its support, the uniform separated-point convergence in Equation (17) turns the lattice moment sum into the Riemann sum of the continuum kernel. The cutoff makes the product with the test functions continuous across the excluded diagonals. For fixed $d$ these sums therefore converge to their continuum integrals. Equation (7.12) bounds the omitted lattice contribution by a quantity tending to zero with $d$, after taking the upper limit in $n$. The omitted continuum contribution tends to zero by the integrable domination in Equation (7.7). Letting $d arrow.b 0$ proves Equation (7.11). ◻
]

=== 7.4 Identification of laws and local tightness <identification-of-laws-and-local-tightness>

The moment bounds also supply the determinacy needed to identify joint complex laws. This step uses the real and imaginary parts together, so it retains the nonneutral moments.

#thm([Proposition 7.5.])[
  (Joint convergence of test-function laws).  #emph[For every $k gt.eq 1$ and $f_1 \, dots.h \, f_k in C_c^oo \( D \; bb(C) \)$, 
$ \( S_n \( f_1 \) \, dots.h \, S_n \( f_k \) \) med arrow.r.double med \( V_(*) \( f_1 \) \, dots.h \, V_(*) \( f_k \) \) . $

 Every mixed moment of this vector and its complex conjugate converges.]
] <fields:law>

#proof[
  Fix a real linear combination $Z_n$ of the real and imaginary parts of the $k$ lattice evaluations, and let $Z$ be the same linear combination of the continuum evaluations. Equation (7.9) gives $parallel Z_n parallel_(L^p) lt.eq C sqrt(p)$ for all $p gt.eq 2$, with $C$ depending on the tests and the chosen linear combination. Consequently, for every $t gt.eq 0$,
  #[#set math.equation(numbering: n => "(7.13)")
   $ sup_n bb(E)_n^0 e^(t \| Z_n \|) < oo . $ <fields:exponential-moments>]
  Indeed the exponential series is dominated, apart from its first two terms, by $sum_(p gt.eq 2) \( C t sqrt(p) \)^p \/ p ! < oo$. Proposition 32 gives convergence of the even moments of $Z_n$ to those of $Z$. Hence $Z$ satisfies the same bound at even orders, and at all remaining orders by Hölder’s Inequality. It too has every exponential moment. Absolute convergence of the exponential series thus determines its characteristic function from its moments.
  The finite-dimensional lattice vectors are tight by their second-moment bounds. Along a weakly convergent subsequence, the higher uniform moment bounds make every polynomial in their real and imaginary coordinates uniformly integrable. The limit therefore has the moments given in Proposition 32. Each of its real projections has the same even-moment bounds as $Z$, hence is exponentially integrable and has the same characteristic function as $Z$. The Cramér–Wold Criterion identifies the vector law. Every convergent subsequence has this law, which proves convergence along the full sequence. For the stated mixed moments, use the sign convention $overline(S_n \( f \)) = S_n^(-) \( overline(f) \)$ in Proposition 32. ◻
]

#thm([Proposition 7.6.])[
  (Tightness in the local Sobolev topology).  #emph[The laws of $S_n$ are tight in $H_(upright("loc"))^(- 3) \( D \)$. They converge there, along the full sequence, to the law of $V_(*)$.]
] <fields:tightness>

#proof[
  Use the larger flat torus from the continuum construction and its normalized Fourier basis $e_nu$, $nu in bb(Z)^2$. Choose real smooth cutoffs $chi_j$ with compact support in $D$, equal to one on an increasing exhaustion of $D$, and with $chi_(j + 1) = 1$ near $"supp" chi_j$. Since the Fourier functions have uniformly bounded suprema, Equation (7.9) gives
  $ sup_(n \, nu) bb(E)_n^0 \| S_n \( chi_j e_nu \) \|^2 lt.eq C_j . $
  Fourier summation yields
  #[#set math.equation(numbering: n => "(7.14)")
   $ sup_n bb(E)_n^0 parallel chi_j S_n parallel_(H^(- 2))^2 lt.eq C'_j sum_(nu in bb(Z)^2) \( 1 + \| nu \|^2 \)^(- 2) < oo . $ <fields:sobolev-bound>]
  The embedding $H^(- 2) arrow.r.hook H^(- 3)$ on this torus is compact. Indeed finite Fourier truncations have finite rank, and on their complements the ratio of the squared Sobolev weights is $\( 1 + \| nu \|^2 \)^(- 1) arrow.r 0$.
  Given $eta > 0$, choose $R_j < oo$ so that the sum of the Markov bounds in Equation (7.14), with thresholds $R_j^2$, is less than $eta$. With probability at least $1 - eta$, all inequalities $parallel chi_j S_n parallel_(H^(- 2)) lt.eq R_j$ hold simultaneously. The set of distributions satisfying these inequalities has relatively compact closure in $H_(upright("loc"))^(- 3) \( D \)$: compact embedding gives a convergent subsequence for each localized field, and a diagonal choice gives convergence for all $j$. The identities $chi_j \( chi_(j + 1) S_n \) = chi_j S_n$ pass to the limits because smooth multiplication is continuous on $H^(- 3)$. Thus the limits define one distribution on $D$. This proves tightness.
  For completeness, the topology just used is the Euclidean local topology in the statement of Theorem 1. On distributions supported in any fixed compact subset of $D$, the torus Sobolev norms and the corresponding Euclidean Sobolev norms are equivalent by localization inside its fundamental square. Moreover every compactly supported cutoff is supported where some $chi_j$ equals one. The countable family of these localized norms therefore generates exactly $H_(upright("loc"))^(- 3) \( D \)$.
  Every subsequential limit in this space has the test-function laws in Proposition 33, since evaluation on a smooth compactly supported test is continuous. These laws determine the distribution-valued law. For example, the countably many tests $chi_j e_nu$ determine every localized Fourier coefficient; their real and imaginary parts generate the Borel sigma-field of the compatible subspace of the countable product of the separable spaces $H^(- 3)$. Lemma 30 places $V_(*)$ in this space, so all subsequential limits have its law. Tightness and this uniqueness prove full-sequence convergence. ◻
]

Propositions 32, 33, and 34 complete the proof of Theorem 1. Every lattice field in this argument uses the same exact center magnetization $a_n$ and the same Green-function factor fixed in its definition.

#heading(level: 1)[References]
#bibitem([1])[V.~L.~Berezinskii. Destruction of long-range order in one-dimensional and two-dimensional systems having a continuous symmetry group. I.~Classical systems. #emph[Soviet Physics JETP] #strong[32]\(3) (1971), 493--500. Russian original: #emph[Zh. Eksp. Teor. Fiz.] #strong[59] (1970), 907--920. #link("https://www.jetp.ras.ru/cgi-bin/dn/e_032_03_0493.pdf")[English translation].]
#bibitem([2])[F.~Dunlop and C.~M.~Newman. Multicomponent field theories and classical rotators. #emph[Communications in Mathematical Physics] #strong[44] (1975), 223--235. #link("https://doi.org/10.1007/BF01609827")[doi:10.1007/BF01609827].]
#bibitem([3])[J.~Fröhlich and T.~Spencer. The Kosterlitz--Thouless transition in two-dimensional Abelian spin systems and the Coulomb gas. #emph[Communications in Mathematical Physics] #strong[81]\(4) (1981), 527--602. #link("https://doi.org/10.1007/BF01208273")[doi:10.1007/BF01208273].]
#bibitem([4])[J.~Junnila, E.~Saksman, and C.~Webb. Imaginary multiplicative chaos: Moments, regularity and connections to the Ising model. #emph[Annals of Applied Probability] #strong[30]\(5) (2020), 2099--2164. #link("https://doi.org/10.1214/19-AAP1553")[doi:10.1214/19-AAP1553]. #link("https://arxiv.org/abs/1806.02118v2")[arXiv:1806.02118v2].]
#bibitem([5])[J.~M.~Kosterlitz. The critical properties of the two-dimensional XY model. #emph[Journal of Physics C: Solid State Physics] #strong[7]\(6) (1974), 1046--1060. #link("https://doi.org/10.1088/0022-3719/7/6/005")[doi:10.1088/0022-3719/7/6/005].]
#bibitem([6])[J.~M.~Kosterlitz and D.~J.~Thouless. Ordering, metastability and phase transitions in two-dimensional systems. #emph[Journal of Physics C: Solid State Physics] #strong[6]\(7) (1973), 1181--1203. #link("https://doi.org/10.1088/0022-3719/6/7/010")[doi:10.1088/0022-3719/6/7/010].]
#bibitem([7])[P.~Lammers. Bijecting the BKT transition. Preprint (2023). #link("https://arxiv.org/abs/2301.06905v2")[arXiv:2301.06905v2].]
#bibitem([8])[O.~A.~McBryan and T.~Spencer. On the decay of correlations in SO($n$)-symmetric ferromagnets. #emph[Communications in Mathematical Physics] #strong[53]\(3) (1977), 299--302. #link("https://doi.org/10.1007/BF01609854")[doi:10.1007/BF01609854].]
#bibitem([9])[N.~D.~Mermin and H.~Wagner. Absence of ferromagnetism or antiferromagnetism in one- or two-dimensional isotropic Heisenberg models. #emph[Physical Review Letters] #strong[17]\(22) (1966), 1133--1136. #link("https://doi.org/10.1103/PhysRevLett.17.1133")[doi:10.1103/PhysRevLett.17.1133].]
#bibitem([10])[D.~R.~Nelson and J.~M.~Kosterlitz. Universal jump in the superfluid density of two-dimensional superfluids. #emph[Physical Review Letters] #strong[39]\(19) (1977), 1201--1205. #link("https://doi.org/10.1103/PhysRevLett.39.1201")[doi:10.1103/PhysRevLett.39.1201].]
#bibitem([11])[C.~M.~Newman. Inequalities for Ising models and field theories which obey the Lee--Yang theorem. #emph[Communications in Mathematical Physics] #strong[41] (1975), 1--9. #link("https://doi.org/10.1007/BF01608542")[doi:10.1007/BF01608542].]
#bibitem([12])[C.~M.~Newman and W.~Wu. Gaussian fluctuations for the classical XY model. #emph[Annales de l'Institut Henri Poincaré, Probabilités et Statistiques] #strong[54]\(4) (2018), 1759--1777. #link("https://doi.org/10.1214/17-AIHP854")[doi:10.1214/17-AIHP854]. #link("https://arxiv.org/abs/1605.01297")[arXiv:1605.01297].]
#bibitem([13])[C.~M.~Newman and W.~Wu. Lee--Yang property and Gaussian multiplicative chaos. #emph[Communications in Mathematical Physics] #strong[369] (2019), 153--170. #link("https://doi.org/10.1007/s00220-019-03453-0")[doi:10.1007/s00220-019-03453-0]. #link("https://arxiv.org/abs/1708.08820v3")[arXiv:1708.08820v3].]
#bibitem([14])[OpenAI. BKT universality for height and planar spin fields. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/BKT-universality-for-height-and-planar-spin-fields-September-24-2026/paper.pdf")[OAI:BKT-universality-for-height-and-planar-spin-fields-September-24-2026], 2026.]
#bibitem([15])[OpenAI. The critical correlation exponent of the planar XY model. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026/paper.pdf")[OAI:The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026], 2026.]
#bibitem([16])[O.~Regev and N.~Stephens-Davidowitz. An inequality for Gaussians on lattices. #emph[SIAM Journal on Discrete Mathematics] #strong[31]\(2) (2017), 749--757. #link("https://doi.org/10.1137/15M1052226")[doi:10.1137/15M1052226]. #link("https://arxiv.org/abs/1502.04796v3")[arXiv:1502.04796v3].]
#bibitem([17])[D.~van Engelenburg and M.~Lis. An elementary proof of phase transition in the planar XY model. #emph[Communications in Mathematical Physics] #strong[399]\(1) (2023), 85--104. #link("https://doi.org/10.1007/s00220-022-04550-3")[doi:10.1007/s00220-022-04550-3]. #link("https://arxiv.org/abs/2110.09465v2")[arXiv:2110.09465v2].]


