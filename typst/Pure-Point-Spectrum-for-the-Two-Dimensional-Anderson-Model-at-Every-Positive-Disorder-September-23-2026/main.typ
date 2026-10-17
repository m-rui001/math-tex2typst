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

#align(center)[#text(size: 16pt, weight: "bold")[Pure-Point Spectrum for the Two-Dimensional \
Anderson Model at Every Positive Disorder]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Let $h > 0$ and let $\( v_x \)_(x in bb(Z)^2)$ be independent random variables, each uniform on $\[ - h \, h \]$. We consider the bounded self-adjoint operator

#[#set math.equation(numbering: n => "(1.1)")
 $ \( H_v u \) \( x \) = sum_(lr(|y - x|)_1 = 1) u \( y \) + v_x u \( x \) #h(2em) upright("on ") ell^2 \( bb(Z)^2 \) . $ <setup:model>]

Thus $v_x = h omega_x$ in the usual notation with $omega_x$ uniform on $\[ - 1 \, 1 \]$. Pure-point spectral type means that the closed span of the eigenvectors is the entire Hilbert space; it does not mean that every point of the spectrum is an eigenvalue.

The planar spectral localization problem asks whether this pure-point conclusion holds throughout the spectrum for every nonzero width of the uniform distribution [14] Example 2.1 and Problem 2. We prove that it does.

#thm([Theorem 1.1.])[
  #emph[For each fixed $h > 0$, almost surely $H_v$ has pure-point spectral type, admits a complete orthonormal eigenbasis, and has spectrum 
$ sigma \( H_v \) = \[ - 4 - h \, 4 + h \] . $

 Its eigenvalues are dense in this interval. The probability-one event in this statement is allowed to depend on $h$.]
] <main:theorem>

The conclusion includes arbitrarily weak nonzero disorder and the entire spectrum. It resolves the pure-point assertion of the two-dimensional Anderson localization conjecture for a uniform single-site distribution, as formulated in [14] Problem 2. An arbitrary nondegenerate uniform interval reduces to the centered interval above by subtracting its midpoint from the operator. We do not assert one probability-one event for all disorder strengths, a bound uniform in energy, or a dynamical-localization theorem.

=== Context and scope <context-and-scope>

Anderson introduced random site energies as a mechanism for suppressing quantum transport, motivated by spin diffusion and impurity conduction [5]. His discussion includes a flat single-site distribution and nearest-neighbor hopping, although the original physical argument is not a modern proof of the spectral assertion considered here. The conductance-scaling theory of Abrahams, Anderson, Licciardello and Ramakrishnan predicts the absence of true metallic behavior in two dimensions [1]. That physical prediction is distinct from an almost-sure spectral-type theorem. Simon’s formulation isolates the latter question; his diffusion problem is listed separately [14].

Rigorous multidimensional localization theory developed several complementary mechanisms. Fröhlich and Spencer’s multiscale analysis gave Green-function decay and vanishing Kubo diffusion in large-disorder or appropriate extreme-energy regimes [12]. Their 1983 conclusions were explicitly distinguished from a complete pure-point decomposition. Fröhlich, Martinelli, Scoppola and Spencer subsequently established pure-point spectrum with exponentially decaying eigenfunctions for independent identically distributed diagonal potentials with a bounded density in sufficiently large-disorder and suitable tail-energy regimes [11]. Delyon, Lévy and Souillard also obtained multidimensional spectral localization in large-disorder or large-energy regimes [9]. The passage from fixed-energy Green-function information to a complete spectral decomposition is a substantive step, not an automatic consequence of decay outside an exceptional set of energies.

Aizenman and Molchanov developed the fractional-moment approach, obtaining localization at large disorder and at extreme energies under suitable hypotheses on the conditional single-site distributions, including absolute continuity and regularity [3]. This method supplies important ancestry for our use of fractional Green-function moments, but its established regimes do not by themselves yield the all-disorder, all-energy assertion above. Spectral-edge results also have a different scope. Ding and Smart proved localization near an edge for the two-dimensional Bernoulli model and observed that their proof extends to bounded nontrivial iid laws [10]; Hurtado extended edge-localization and unique-continuation methods to independent, not necessarily identically distributed uniformly bounded potentials with uniformly positive variance [13]. The latter localization theorems remain restricted to a bottom interval, even though their distributional assumptions are broader.

Weak-disorder transport on long finite scales poses another, compatible question. Black, Drogin and Hernández obtain quantitative time-averaged diffusion, resolvent and finite-volume eigenfunction results for Gaussian iid potentials on disorder-dependent scales [7]. These weak-coupling limits neither imply nor contradict pure-point spectral type at every fixed positive disorder for the uniform law. The present assertion concerns that fixed-disorder spectral type; it does not assert exponential eigenfunction decay or dynamical localization.

The final spectral step follows the rank-one mechanism of Simon and Wolff [15]. Its input is a suitable inverse-square spectral integral, equivalently a square-summable resolvent column, for almost every configuration and energy. Averaging over the independent site value transfers this information to the random spectral measure. We prove the required averaging and spectral readout explicitly; the main work is to obtain their fixed-energy input under the true uniform product law at arbitrary disorder.

=== The proof mechanism <the-proof-mechanism>

Fix $h > 0$ and an interior real energy $E$. In 3, we introduce absorbing diagonal terms in finite tori and their associated input and output channels, called ports. Squared scattering amplitudes define a Dirichlet energy on port data: if $S_(j a)$ is the scattering amplitude from port $a$ to port $j$ and $f$ is real data on the ports, the energy is

$ cal(Q)_S \( f \) = 1 / 2 sum_(a \, j) \| S_(j a) \|^2 \| f_j - f_a \|^2 . $

A Cauchy-distributed real closing value would remove a port with a favorable averaged energy comparison. The bounded physical distribution requires a truncated version and a relative estimate for its error.

The first main ingredient is a family of rare resonant cells (Section 4, Section 5, Section 6). Their conditional law is embedded in the original product measure by an acceptance likelihood; the true potentials remain independent uniforms before conditioning. The construction gives a weighted boundary impedance estimate uniform in arbitrary passive exterior data, including weakly coupled missing boundary directions. It also gives a transmission lower bound strong enough to make the closing error small relative to the transmission itself. These estimates, together with an upper envelope over adaptive interior configurations, are useful beyond a single prescribed environment.

The second ingredient is a comparison along a hierarchy of increasingly sparse ports (7). A parent-cell alternative controls the apparent singularity at the end of each thinning interpolation. Local generic observation, followed by path estimates, supplies screening at every fixed starting stage (8). For a fixed starting level $n$, let $d_n$ be the infinite-volume limit of the expected sum of squared port-to-port distances, weighted by $\| S_(j a) \|^2$ and divided by twice the torus area. These quantities measure the scattering energy of affine coordinate data. The torus side tends to infinity with $n$ fixed to define $d_n$; only afterwards does the thinning comparison give a finite limit $d$ as $n$ tends to infinity.

The dimension enters decisively in forcing $d = 0$ (9). An adaptive modification of affine data first makes a local affine first-variation trace small in expectation. Separately, a logarithmic voltage profile separates retained interior ports from an annulus of very weak probes at arbitrarily small two-dimensional capacity cost. If $d > 0$, an analytic test of the scattering matrix has a nonzero value at the center of the disk. Support-preserving shifts of the true potentials and the thinning comparison make its boundary moments arbitrarily small, contradicting submean. Dimension-free weak integral bounds prevent the number of ports from spoiling this argument.

Finally, vanishing affine energy is upgraded to a fixed-real-energy fractional-moment estimate for the true finite-torus Green function (10). Buffered probe barriers, conditional estimates under transmission weights, and resampling of disjoint regions close a contraction uniform over the allowed masks. The infinite-volume conclusion then follows from the spectral theorem, Fubini, and rank-one averaging (11). The property to which Fubini is applied belongs to the true operator, so no common auxiliary construction measurable in energy is needed.

The proof keeps these roles separate: the rare laws prove local comparisons, fixed-stage screening controls limits, two-dimensional capacity makes the limit vanish, and spectral averaging converts fixed-energy information to spectral type.

== 2 Finite volumes and conventions <setup:conventions>

Throughout the local and multiscale arguments, fix

#[#set math.equation(numbering: n => "(2.1)")
 $ h > 0 \, #h(2em) - 4 - h < E < 4 + h . $ <setup:fixed-energy>]

All constants and auxiliary choices may depend on this pair. Their dependence on the varying geometric scales, exterior data and masks is specified in each assertion. Uniformity in $E$ is neither assumed nor needed for 1.

For integer $l gt.eq 0$, put $b_l = 3^l$. The global finite volume is the square torus

$ bb(T)_N^2 = \( bb(Z) \/ b_N bb(Z) \)^2 \, $

with the periodic nearest-neighbor adjacency and independent uniform potentials on its sites. Its area is $b_N^2$. Distances are shortest coordinate distances on this torus, using the maximum norm unless a different norm is displayed. We write

$ Lambda_r \( x \) = { y : lr(|y - x|)_oo lt.eq r } . $

All local constructions are used with the torus sufficiently large to contain the required neighborhoods without ambiguity. Dirichlet restrictions mean deletion of the hopping bonds leaving the indicated physical site set.

The physical disorder is always the product law of the true variables $v_x$. Auxiliary selectors, acceptance uniforms, offsets and thinning marks will be introduced explicitly. Conditioning on a rare event can change the law within one cell; it never changes this unconditional physical law. An expectation refers to the sampling and conditioning specified in its statement.

Site and port spaces are complexified finite-dimensional Euclidean spaces. A superscript $top$ denotes transpose, not adjoint; a superscript $*$ denotes adjoint. Bases used for coordinate projections and their subspaces are real orthonormal bases. We use

$ "Im" D = frac(D - D^(*), 2 i) \, #h(2em) "Re" D = frac(D + D^(*), 2) . $

Unless otherwise indicated, a norm is the Euclidean or induced operator norm. Hilbert–Schmidt and trace norms carry subscripts $upright("HS")$ and $1$. Coordinate projections may be identified with their ranges. Symbols used for local blocks are reset when the local matrix is defined.

A real reference potential may replace a true potential only at a site carrying an open cell port. Closing that port restores the true value. The matrix $H^(\#)$ denotes the real symmetric operator with the current reference values. Artificial probes, introduced in the next section, do not alter real reference values. Several ports may share a physical site; their columns are kept distinct.

In bounds for a cell of size $L$, the notation $"poly" \( L \)$ means a quantity bounded by $C \( 1 + L \)^C$ for fixed constants. The constants may depend on the previously fixed cell-design parameters, including the corner-box width exponent, but not on the exterior matrix, exterior volume, exterior source, or allowed probe mask. The ordering of design parameters is part of each construction. Expressions $exp \( L^(O \( 1 \)) \)$ have the corresponding interpretation. A statement requiring sufficiently large $L$ is applied only after its fixed design parameters have been chosen.

We will repeatedly distinguish the following orders of choice. The disorder and energy are fixed first. Local design constants are fixed before the cell scale is enlarged. For global limits a starting level $n$ is fixed before observation and approximation constants are chosen; a later level $m$ can then be increased to exceed all those thresholds, and the torus level $N$ is increased last. No rate uniform in $n$ is implicit in this convention.

== 3 Scattering matrices and analytic estimates <mat:section>

All matrices in this section are finite dimensional. A port at a physical site $x$, of strength $sigma > 0$, is represented by the column $sqrt(sigma) thin e_x$. In the matrix $Y$ of these columns, rows index physical sites and columns index ports; several distinct ports may be attached to the same site. For a real symmetric matrix $H^(\#)$ and a real energy $E$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(L) = H^(\#) - E - i Y Y^top \, #h(2em) G = cal(L)^(- 1) \, #h(2em) S = upright(bold(1)) + 2 i Y^top G Y . $ <mat:response>]

The entry $S_(j a)$ is the scattering amplitude from input port $a$ to output port $j$. The physical matrix $H^(\#)$ may differ from the true Hamiltonian by real diagonal changes at sites carrying ports. We call these changes #emph[reference potentials]. They may depend on the true potentials.

Absorption bounds the response between ports even when the full inverse $G$ is large. Closing ports removes their absorptions and changes real diagonal values; we express this operation as a rational family of scattering matrices and compare its energies after averaging the closing values.

=== 3.1 Invertibility, absorption, and Schur complements <invertibility-absorption-and-schur-complements>

The inverses in (3.1) exist almost surely under any absolutely continuous joint law of the true site potentials. Indeed, if $cal(L) u = 0$, taking the imaginary part of $u^(*) cal(L) u$ gives $Y^top u = 0$. Thus $u$ vanishes at every port site, so restoring the true diagonal entries leaves its equation unchanged: $\( H - E \) u = 0$. For a fixed finite site set, $det \( H - E \)$ is a polynomial in its true diagonal variables whose coefficient of their full product is one. It is not identically zero. A nonzero polynomial has a Lebesgue-null zero set, as follows by induction on the number of variables and one-variable slicing. This proves the assertion even when the port set and reference potentials depend on those variables. The same argument applies to deterministic restrictions to physical sites. We always discard the resulting null exceptional sets when forming such inverses.

A matrix $D$ is #emph[passive] if $"Im" D lt.eq 0$, with the Hermitian imaginary part fixed in 2. The absorption identities below apply to any real rectangular $Y$, including real coordinate or subspace inclusions.

#thm([Lemma 3.1.])[
  (Absorption identities).  #emph[Suppose $cal(L)$ is invertible and $W = - "Im" cal(L) gt.eq Y Y^top$. Then 
#[#set math.equation(numbering: n => "(3.2)")
 $ "Im" G & = G^(*) W G = G W G^(*) \,\
∥Y^top G Y a∥^2 & lt.eq "Im" \( a^(*) Y^top G Y a \) \, #h(2em) ∥Y^top G Y∥ lt.eq 1 . $ <mat:ward-identity>]

 For the physical system in (3.1), $S$ is symmetric and unitary. If $cal(L)$ is complex symmetric and passive, each defined Schur complement is complex symmetric and passive. An absorption lower bound supported on retained coordinates persists in the Schur complement.]
] <mat:ward>

#proof[
  The inverse difference identities give
  $ G - G^(*) = G^(*) \( cal(L)^(*) - cal(L) \) G = G \( cal(L)^(*) - cal(L) \) G^(*) \, $
  which proves (3.2). Consequently, with $K = Y^top G Y$,
  $ ∥K a∥^2 lt.eq a^(*) Y^top G^(*) W G Y a = "Im" \( a^(*) K a \) lt.eq ∥∥ a thin ∥K a∥ . $
  This proves (3.2). In the physical case $W = Y Y^top$, we have $"Im" K = K^(*) K$ and hence
  $ \( upright(bold(1)) + 2 i K \)^(*) \( upright(bold(1)) + 2 i K \) = upright(bold(1)) - 4 "Im" K + 4 K^(*) K = upright(bold(1)) . $
  Since the matrix is square, it is unitary. Symmetry follows from $cal(L)^top = cal(L)$ and the fact that $Y$ is real.
  For the Schur assertion, write a symmetric matrix in blocks as
  $ D = mat(delim: "(", D_11, C; C^top, D_22) \, #h(2em) D_(upright("eff")) = D_11 - C D_22^(- 1) C^top . $
  For a vector $v$ on the retained coordinates, extend it to $tilde(v) = \( v \, - D_22^(- 1) C^top v \)$. Then
  $ D tilde(v) = \( D_(upright("eff")) v \, 0 \) \, #h(2em) tilde(v)^(*) D tilde(v) = v^(*) D_(upright("eff")) v . $
  Taking imaginary parts proves passivity. If $- "Im" D gt.eq "diag" \( W_0 \, 0 \)$, the same identity gives $- "Im" D_(upright("eff")) gt.eq W_0$. Symmetry is immediate from the displayed Schur formula. ◻
]

We will also use the elementary kernel consequence of passivity: if $D u = 0$ and $D$ is passive, then $"Im" D thin u = "Re" D thin u = 0$. Indeed, the nonnegative matrix $- "Im" D$ has zero quadratic form on $u$, so it annihilates $u$; the assertion about the real part follows from $D u = 0$.

=== 3.2 Closing ports and comparing energies <closing-ports-and-comparing-energies>

Symmetry and unitarity make $lr(|S_(j a)|)^2$ symmetric nonnegative weights with unit row sums. For real scalar or real Euclidean-vector data $f$ on the ports, their Dirichlet energy and its single-port contribution are

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(Q)_S \( f \) = 1 / 2 sum_(a \, j) lr(|S_(j a)|)^2 lr(|f_j - f_a|)^2 \, #h(2em) cal(M)_a \( f \) = sum_j lr(|S_(j a)|)^2 lr(|f_j - f_a|)^2 . $ <mat:energies>]

For scalar data, writing $F = "diag" \( f \)$, unitarity gives

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(Q)_S \( f \) = "tr" \( F^2 - F S F S^(*) \) . $ <mat:energy-trace>]

For vector data, one sums this identity over real components.

#thm([Lemma 3.2.])[
  (Common-phase closure).  #emph[Partition the ports into retained ports and a set $C$ to be closed, and write 
$ S = mat(delim: "(", A, T; T^top, B) . $

 Close every port in $C$ and add the real shift $w sigma_j$ to the physical diagonal for each closed port $j$ of strength $sigma_j$. Where the resulting inverse exists, its scattering matrix on the retained ports is 
#[#set math.equation(numbering: n => "(3.5)")
 $ S_z = A + T z \( upright(bold(1)) - z B \)^(- 1) T^top \, #h(2em) z = frac(w + i, w - i) . $ <mat:closure-formula>]

 The right-hand side is analytic for $lr(||) z < 1$.]
] <mat:closure>

#proof[
  If $Y_C$ consists of the closed port columns, the site matrix becomes $cal(L)_w = cal(L) + \( w + i \) Y_C Y_C^top$. Woodbury inversion and $Y_C^top G Y_C = \( B - upright(bold(1)) \) \/ \( 2 i \)$ give the result, using
  $ frac(z, 1 - z) = - frac(w + i, 2 i) \, #h(2em) upright(bold(1)) + \( w + i \) Y_C^top G Y_C = frac(upright(bold(1)) - z B, 1 - z) . $
  These are rational identities, so the formulas extend across any removable singularities. The determinant of $cal(L)_w$ is a polynomial in $w$ which is nonzero at $w = - i$; hence only finitely many closing values can make the site matrix singular. Finally $B$ is a compression of a unitary matrix and is therefore contractive, which makes $upright(bold(1)) - z B$ invertible in the open disk. ◻
]

#thm([Lemma 3.3.])[
  (Conditional single-port comparison).  #emph[Consider closing a single port $a$. Set 
$ u = S_(hat(a) \, a) \, #h(2em) b = S_(a a) \, #h(2em) gamma = frac(z, 1 - z b) \, $

 where $hat(a)$ means that port $a$ is omitted. Let $cal(F)$ contain the open system and the real data $f$, before the closing value is sampled. Assume that its conditional law assigns no mass to the finite exceptional set in 3. If $lr(||) b < 1$, put $mu = bb(E) \[ gamma divides cal(F) \]$. Then 
#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E) \[ cal(Q)_(S_z) \( f_(hat(a)) \) divides cal(F) \] lt.eq cal(Q)_S \( f \) + 2 lr(|mu|) thin cal(M)_a \( f \) . $ <mat:conditional-comparison>]

 If $lr(||) b = 1$, the same assertion holds with zero error, and we use the convention $mu = 0$.]
] <mat:energy-closure>

#proof[
  First take scalar data and subtract $f_a$ from every datum. This does not change either energy, and it makes the removed datum zero. Let $F = "diag" \( f_(hat(a)) \)$ after this subtraction and $A = S_(hat(a) \, hat(a))$. By (3.4), expansion of $S_z = A + gamma u u^top$ yields the exact identity
  $ cal(Q)_(S_z) \( f_(hat(a)) \) - cal(Q)_S \( f \) = - 2 "Re" #scale(x: 120%, y: 120%)[\(] gamma thin u^top F A^(*) F u #scale(x: 120%, y: 120%)[\)] - lr(|gamma|)^2 thin \( u^(*) F u \)^2 . $
  The last square is real and nonnegative. Moreover,
  $ lr(|u^top F A^(*) F u|) lt.eq ∥F u∥^2 = cal(M)_a \( f \) \, $
  because $A$ is contractive. Conditional expectation therefore proves (3.6). For vector data the same argument is applied componentwise. If $lr(||) b = 1$, unitarity gives $u = 0$, so closing the port leaves the scattering matrix on the other ports unchanged. ◻
]

The use of the conditional mean $mu$, rather than $bb(E) \[ lr(|gamma|) divides cal(F) \]$, is important. In later applications the open system and the data must remain measurable without exposing the hidden true value at the port to be closed.

A standard Cauchy law for $w$ makes this conditional mean vanish. To restore a potential within a bounded interval, we truncate that law and estimate the resulting error.

#thm([Lemma 3.4.])[
  (A cutoff-Cauchy closing law).  #emph[Fix a smooth function $chi : bb(R) arrow.r \[ 0 \, 1 \]$ equal to one near zero and supported in a fixed sufficiently small interval about zero. For a port of strength $sigma$, give its hidden real shift $delta$ the law 
#[#set math.equation(numbering: n => "(3.7)")
 $ 1 / Z_sigma chi \( delta \) frac(sigma thin thin upright(d) delta, pi \( delta^2 + sigma^2 \)) \, #h(2em) Z_sigma = integral_(bb(R)) chi \( delta \) frac(sigma thin thin upright(d) delta, pi \( delta^2 + sigma^2 \)) . $ <mat:cutoff-law>]

 Use $w = delta \/ sigma$ in 3. Conditional on the open system, let $g = sigma G_(x x)$, where $x$ is the site of the port. For all sufficiently small $sigma$, the mean in 4 satisfies 
#[#set math.equation(numbering: n => "(3.8)")
 $ lr(|mu|) lt.eq C \, #h(2em) lr(|mu|) lt.eq C sqrt(sigma) quad upright("if ") lr(||) g > sqrt(sigma) . $ <mat:cutoff-estimate>]

 The constants depend on $chi$, not on the exterior system.]
] <mat:cutoff>

#proof[
  The case $lr(|S_(a a)|) = 1$ uses the zero-error convention. Otherwise put $b = S_(a a) = 1 + 2 i g$, so $lr(||) b < 1$. Under the uncut Cauchy law,
  $ z = frac(delta + i sigma, delta - i sigma) = e^(i t) \, #h(2em) delta = sigma cot \( t \/ 2 \) \, $
  is Haar distributed on the circle. Its mean of $z \/ \( 1 - b z \) = sum_(k gt.eq 0) b^k z^(k + 1)$ is zero. Define the deleted angular density
  $ d_sigma \( t \) = 1 - chi #scale(x: 120%, y: 120%)[\(] sigma cot \( t \/ 2 \) #scale(x: 120%, y: 120%)[\)] . $
  It is bounded by one, supported on an arc of length $O \( sigma \)$ about $t = 0$, and Lipschitz with constant $O \( sigma^(- 1) \)$. To see the last claim, derivatives can occur only when $delta$ lies in a fixed compact set separated from zero; there $lr(||) t$ is comparable to $sigma$ and $lr(|thin upright(d) delta \/ thin upright(d) t|) = O \( sigma^(- 1) \)$. Near $t = 0$ the function is constant. Thus $Z_sigma = 1 - O \( sigma \)$ and
  #[#set math.equation(numbering: n => "(3.9)")
   $ mu = - Z_sigma^(- 1) integral_(bb(T)) d_sigma \( t \) frac(e^(i t), 1 - b e^(i t)) thin thin upright(d) m_(bb(T)) \( t \) \, $ <mat:deleted-density>]
  where $thin upright(d) m_(bb(T)) \( t \) = thin upright(d) t \/ \( 2 pi \)$.
  On the support of $d_sigma$,
  $ lr(|1 - b e^(i t)|) gt.eq lr(|1 - b|) - lr(||) b lr(|1 - e^(i t)|) gt.eq 2 lr(||) g - C sigma . $
  If $lr(||) g > sqrt(sigma)$, this is at least $lr(||) g$ for small enough $sigma$. The integral in (3.9) is then bounded by $C sigma \/ lr(||) g lt.eq C sqrt(sigma)$.
  For the uniform bound, $lr(||) b lt.eq 1 \/ 2$ is immediate. If $1 \/ 2 < lr(||) b < 1$, use
  $ frac(z, 1 - b z) = b^(- 1) (frac(1, 1 - b z) - 1) . $
  Write $b = rho e^(i beta)$ and use
  $ frac(1, 1 - rho e^(i t)) = 1 / 2 #scale(x: 120%, y: 120%)[\(] 1 + P_rho \( t \) + i Q_rho \( t \) #scale(x: 120%, y: 120%)[\)] \, $
  where
  $ P_rho \( t \) = frac(1 - rho^2, 1 - 2 rho cos t + rho^2) \, #h(2em) Q_rho \( t \) = frac(2 rho sin t, 1 - 2 rho cos t + rho^2) . $
  The Poisson contribution is bounded since $P_rho gt.eq 0$ has integral one. For the conjugate contribution, if the singular center $- beta$ is farther than a sufficiently large multiple of $sigma$ from the support arc, use $lr(|Q_rho \( t \)|) lt.eq C \/ lr(||) t$ in angular distance to bound the integral absolutely. Otherwise, after recentering at $- beta$, the density is supported in $lr(||) t lt.eq C' sigma$ and has Lipschitz constant $C \/ sigma$. Oddness gives
  $ lr(|integral Q_rho \( t \) d_sigma \( t - beta \) thin thin upright(d) m_(bb(T)) \( t \)|) lt.eq C integral_0^(C' sigma) 1 / t t / sigma thin thin upright(d) t lt.eq C . $
  The constant part and normalization in (3.9) are harmless. This proves both bounds. ◻
]

=== 3.3 Dimension-independent analytic bounds <dimension-independent-analytic-bounds>

The common-phase closure formula contains the resolvent $\( upright(bold(1)) - z B \)^(- 1)$. We need weak-$L^1$ bounds for its sandwiched and trace expressions, with no dimensional factor beyond the displayed norms. For a nonnegative random variable $X$ on the circle, write

$ ∥∥ X_(L^(1 \, oo)) = sup_(t > 0) t thin m_(bb(T)) { X > t } . $

The Hilbert–Schmidt estimate below has the same dimension-independent scale as the dissipative-resolvent bound in [2] Lemma 3.1 and Appendix C. We prove the disk estimates directly using a Hilbert-space-valued Calderón–Zygmund decomposition [6] Theorem 1.

#thm([Lemma 3.5.])[
  (Weak-$L^1$ resolvent estimate).  #emph[Let $B$ be a contraction and let $U \, V$ be compatible deterministic matrices. At the almost-everywhere boundary values of the rational function in question, 
#[#set math.equation(numbering: n => "(3.10)")
 $ ∥∥U \( upright(bold(1)) - z B \)^(- 1) V∥_(upright("HS"))∥_(L^(1 \, oo)) lt.eq C ∥∥ U_(upright("HS")) ∥∥ V_(upright("HS")) . $ <mat:weak-sandwich>]

 For any compatible square matrix $D$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ ∥lr(|"tr" #scale(x: 120%, y: 120%)[\(] D \( upright(bold(1)) - z B \)^(- 1) #scale(x: 120%, y: 120%)[\)]|)∥_(L^(1 \, oo)) lt.eq C ∥∥ D_1 . $ <mat:weak-trace>]

 Here and below $∥∥ D_1$ denotes the trace norm. In particular, every moment of order $0 < p < 1$ is bounded by $C_p$ times the corresponding right-hand scale to the power $p$.]
] <mat:weak>

#proof[
  We first prove a weak estimate for the conjugate Poisson kernel and then represent the matrix resolvent by a positive matrix-valued measure. Let $nu$ be a finite measure with values in a Hilbert space, and let $m_0$ be its total variation. Uniformly in $0 lt.eq rho < 1$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ ∥∥Q_rho * nu∥∥_(L^(1 \, oo)) lt.eq C m_0 \, #h(2em) integral_(bb(T)) ∥P_rho * nu∥ thin thin upright(d) m_(bb(T)) lt.eq m_0 . $ <mat:hilbert-kernel>]
  The Poisson assertion follows from positivity and Fubini. If $m_0 = 0$, both assertions are immediate. Otherwise, for the conjugate assertion, identify the circle with a normalized interval of length one and fix a level $t gt.eq 2 m_0$. Choose maximal dyadic intervals $I$ for which $lr(|nu|) \( I \) > t lr(||) I$, where $lr(|nu|)$ denotes total variation. They are disjoint and have total length at most $m_0 \/ t$. Their dyadic parents are not selected, so $lr(|nu|) \( I \) lt.eq 2 t lr(||) I$.
  Replace $nu$ on each selected interval by its vector average. The resulting good measure has a density $g$ with
  $ ∥∥ g_(L^oo) lt.eq 2 t \, #h(2em) ∥∥ g_(L^1) lt.eq m_0 \, #h(2em) ∥∥ g_(L^2)^2 lt.eq 2 t m_0 . $
  These assertions include a possibly singular original measure. The variation measure restricted to the complement of the selected intervals is bounded by $t lr(||) J$ on every dyadic interval $J$: if $J$ lies inside a selected interval the restriction vanishes there, and otherwise $J$ cannot have variation greater than $t lr(||) J$. Dyadic coverings extend this domination to Borel sets, proving absolute continuity and the density bound. The Fourier multipliers of $Q_rho$ have modulus at most one, and Hilbert-space Parseval therefore gives $∥Q_rho * g∥_(L^2)^2 lt.eq 2 t m_0$.
  The bad pieces
  $ nu_I = nu \|_I - frac(nu \( I \), lr(||) I) thin upright(bold(1))_I thin thin upright(d) m_(bb(T)) $
  have zero total mass and total variations summing to at most $2 m_0$. Interpret a concentric triple interval of length at least one as the whole circle. Outside the triple interval $3 I$, cancellation and the uniform kernel derivative bound
  $ lr(|Q'_rho \( u \)|) lt.eq frac(C, "dist" \( u \, 0 \)^2) $
  give
  $ integral_(bb(T) \\ 3 I) ∥Q_rho * nu_I∥ thin thin upright(d) m_(bb(T)) lt.eq C lr(|nu_I|) \( I \) . $
  Indeed, subtract the kernel evaluated at the center of $I$, bound its difference by $C lr(||) I \/ "dist" \( u \, I \)^2$, and integrate away from $3 I$. For completeness, in angular coordinates and $rho > 0$,
  $ lr(|Q'_rho \( u \)|) lt.eq frac(2 rho, lr(|1 - rho e^(i u)|)^2) lt.eq frac(1, 2 sin^2 \( u \/ 2 \)) lt.eq frac(C, "dist" \( u \, 2 pi bb(Z) \)^2) \; $
  the case $rho = 0$ is trivial. Rescaling the circle only changes the absolute constant, so the bound is uniform as $rho$ tends to one. The union of the triple intervals has length at most $3 m_0 \/ t$. Chebyshev applied to the good $L^2$ bound and the bad $L^1$ bound outside this union gives $m_(bb(T)) { ∥Q_rho * nu∥ > C t } lt.eq C m_0 \/ t$. Levels below $2 m_0$ are trivial. This proves (3.12).
  Now define the analytic matrix function
  $ F_1 \( z \) = 2 \( upright(bold(1)) - z B \)^(- 1) - upright(bold(1)) . $
  It satisfies $F_1 \( 0 \) = upright(bold(1))$ and
  $ "Re" F_1 \( z \) = \( upright(bold(1)) - macron(z) B^(*) \)^(- 1) \( upright(bold(1)) - lr(||) z^2 B^(*) B \) \( upright(bold(1)) - z B \)^(- 1) gt.eq 0 . $
  For $r < r' < 1$, the positive matrix-valued measure
  $ thin upright(d) M_(r') \( t \) = "Re" F_1 \( r' e^(i t) \) thin thin upright(d) m_(bb(T)) \( t \) $
  has total mass $upright(bold(1))$. Fourier series show that on the circle of radius $r$, $F_1$ is its Poisson integral plus $i$ times its conjugate Poisson integral, with kernel radius $r \/ r'$. There is no additional constant imaginary part because $F_1 \( 0 \) = upright(bold(1))$.
  The measure $U M_(r') V$, considered in the Hilbert space of matrices with Hilbert–Schmidt norm, has variation at most $∥∥ U_(upright("HS")) ∥∥ V_(upright("HS"))$. To verify this for a finite measurable partition, write $M_j$ for its positive matrix masses. Then
  $ sum_j ∥U M_j V∥_(upright("HS")) & lt.eq sum_j ∥U M_j^(1 \/ 2)∥_(upright("HS")) ∥M_j^(1 \/ 2) V∥_(upright("HS"))\
 & lt.eq (sum_j ∥U M_j^(1 \/ 2)∥_(upright("HS"))^2)^(1 \/ 2) (sum_j ∥M_j^(1 \/ 2) V∥_(upright("HS"))^2)^(1 \/ 2) = ∥∥ U_(upright("HS")) ∥∥ V_(upright("HS")) . $
  Taking the supremum over partitions proves the claim. Applying (3.12) proves the required weak estimate for $U F_1 V$. The added constant $U V$ in $U \( upright(bold(1)) - z B \)^(- 1) V = \( U F_1 \( z \) V + U V \) \/ 2$ obeys the same scale bound.
  For the trace assertion, factor $D = X Y$ by singular values so that $∥∥ X_(upright("HS")) ∥∥ Y_(upright("HS")) = ∥∥ D_1$. For any positive partition masses $M_j$ of total mass $upright(bold(1))$,
  $ sum_j lr(|"tr" \( D M_j \)|) lt.eq sum_j ∥Y M_j^(1 \/ 2)∥_(upright("HS")) ∥M_j^(1 \/ 2) X∥_(upright("HS")) lt.eq ∥∥ D_1 . $
  Thus the scalar measure $"tr" \( D M_(r') \)$ has variation at most the trace norm of $D$, and the same argument applies.
  All estimates are uniform on inner circles. Rationality gives radial limits outside finitely many boundary points. Applying Fatou to level sets, first at a slightly smaller level and then increasing it, gives (3.10), (3.11) on the boundary. Finally, a tail bound $bb(P) { X > t } lt.eq min \( 1 \, A \/ t \)$ gives
  $ bb(E) X^p = p integral_0^oo t^(p - 1) bb(P) { X > t } thin thin upright(d) t lt.eq C_p A^p \, #h(2em) 0 < p < 1 . $
  ◻
]

We record a useful extension of the same proof. If a rational analytic $d times d$ matrix function $F$ has nonnegative Hermitian real part in the disk, its representing positive measures have total mass $"Re" F \( 0 \)$. Their Hilbert–Schmidt variation is at most $"tr" \( "Re" F \( 0 \) \) lt.eq d ∥F \( 0 \)∥$. Restoring the constant $i "Im" F \( 0 \)$, the preceding argument gives

#[#set math.equation(numbering: n => "(3.13)")
 $ ∥∥F \( e^(i t) \)∥∥_(L^(1 \, oo)) lt.eq C d ∥F \( 0 \)∥ . $ <mat:positive-real-extension>]

We need only the resulting polynomial dependence on dimension and the norm at the center.

=== 3.4 Determinant phases and artificial absorptions <determinant-phases-and-artificial-absorptions>

To average inverse traces over a real diagonal shift, we integrate the phase of the determinant. The estimate must also allow artificial absorptions that vary with that shift.

#thm([Lemma 3.6.])[
  (Phase integration).  #emph[Let $D \( s \)$ be a continuously differentiable $d times d$ matrix on a bounded real interval, with $- "Im" D \( s \) > 0$. Its determinant has a continuous phase $Phi$ such that 
#[#set math.equation(numbering: n => "(3.14)")
 $ - d pi < Phi \( s \) < 0 \, #h(2em) Phi' \( s \) = "Im" "tr" #scale(x: 120%, y: 120%)[\(] D' \( s \) D \( s \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <mat:phase-derivative>]

 Suppose, in particular, that 
$ D' \( s \) = P_J - i tau "diag"_J \( a'_i \( s \) \) \, #h(2em) 0 lt.eq tau lt.eq 1 \, #h(2em) lr(|a'_i \( s \)|)^2 lt.eq C a_i \( s \) \, $

 where $P_J$ is the coordinate projection onto $J$, and that $- "Im" D \( s \) gt.eq tau "diag"_J \( a_i \( s \) \)$. With $G = D^(- 1)$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ Phi' \( s \) gt.eq 1 / 2 "tr"_J "Im" G \( s \) - C' d . $ <mat:phase-lower>]

 Consequently, on an interval $\[ a \, b \]$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ integral_a^b "tr"_J "Im" D \( s \)^(- 1) thin thin upright(d) s lt.eq C'' d \( 1 + b - a \) . $ <mat:phase-integral>]

 The integral bound remains valid for passive matrices at their almost-everywhere existing inverses, by strict regularization.]
] <mat:phase>

#proof[
  Every eigenvalue of a strictly passive matrix lies in the open lower half-plane: test the imaginary part of the quadratic form on an eigenvector. Use the branch of the logarithm whose arguments there lie in $\( - pi \, 0 \)$. The sum of the eigenvalue arguments, counted with algebraic multiplicity, defines a continuous phase of the determinant in $\( - d pi \, 0 \)$. The logarithmic derivative of the determinant gives (3.14); no differentiability of individual eigenvalues is needed.
  The absorption identity gives, for every $i in J$,
  $ \( "Im" G \)_(i i) gt.eq tau a_i lr(|G_(i i)|)^2 . $
  Thus the derivative contribution of an artificial diagonal satisfies
  $ tau lr(|a'_i G_(i i)|) lt.eq C^(1 \/ 2) sqrt(tau) sqrt(\( "Im" G \)_(i i)) . $
  This is also valid when $a_i = 0$, since then $a'_i = 0$. Taking imaginary parts of the trace derivative and applying Young’s inequality yields
  $ Phi' gt.eq sum_(i in J) \( "Im" G \)_(i i) - C^(1 \/ 2) sqrt(tau) sum_(i in J) sqrt(\( "Im" G \)_(i i)) gt.eq 1 / 2 "tr"_J "Im" G - C' d . $
  Integration, followed by $Phi \( b \) - Phi \( a \) lt.eq d pi$, proves (3.16). For merely passive $D$, apply the same argument to $D - i zeta upright(bold(1))$, $zeta > 0$. The bounds are independent of $zeta$; where $D^(- 1)$ exists, the inverses converge as $zeta$ tends to zero, and Fatou proves the stated extension. ◻
]

Two variants will be used without changing this argument. If the real derivative is a Hermitian matrix $K \( s \) gt.eq c P_J$ for a fixed $c > 0$, its contribution is $"tr" \( K "Im" G \) gt.eq c "tr"_J "Im" G$. Thus (3.16) holds with constants also depending on $c$. Additional real diagonal derivatives can instead be retained explicitly in (3.14) and estimated using available absorption bounds. This is how the calibrated root derivative will be handled.

=== 3.5 The artificial probe profile <mat:probes>

Separate from the cell ports, we allow at most one artificial probe at each site. A prescribed #emph[mask] chooses among absence, strength $tau$, and strength $tau theta.alt \( v_i \)$, where $v_i$ is always the true site potential, including when the real reference value differs from it. Masks do not depend on the potentials. They may be fixed after conditioning on spatial offsets or other independent prescriptions. Zero strength means absence.

Here $theta.alt : \[ - h \, h \] arrow.r \[ 0 \, 1 \]$ is fixed, of class $C^(1 \, 1)$, polynomial on finitely many pieces, positive on $\( - h \, h \)$, and identically one on a plateau containing $\[ - h \/ 2 \, h \/ 2 \]$ and the compact interior potential settings of the cell construction. Such a profile can be chosen after those compact settings are fixed and before the later scale and width parameters are selected. To construct it, choose $a < h$ large enough that the required compact set lies in $\[ - a \, a \]$, and use $3 t^2 - 2 t^3$ on each endpoint transition, with $t = \( v + h \) \/ \( h - a \)$ on $\[ - h \, - a \]$ and $t = \( h - v \) \/ \( h - a \)$ on $\[ a \, h \]$; put $theta.alt = 1$ on $\[ - a \, a \]$. The endpoint values are zero, the derivatives match at the joins, and

#[#set math.equation(numbering: n => "(3.17)")
 $ lr(|theta.alt' \( v \)|)^2 lt.eq C theta.alt \( v \) \, #h(2em) theta.alt \( v \) asymp "dist" \( v \, { - h \, h } \)^2 quad upright("near the endpoints") . $ <mat:profile-properties>]

Constants may depend on the fixed profile. In particular, $theta.alt^(- q)$ is integrable on $\[ - h \, h \]$ for every $q < 1 \/ 2$.

For estimates at a single cell of size $L$, artificial strengths will obey $0 lt.eq tau lt.eq e^(- c_(*) L)$ with a sufficiently large fixed $c_(*) > 0$. The screening estimates will also allow $0 lt.eq tau lt.eq 1$. All spatial masks remain arbitrary subject to the independence convention above.

== 4 The resonant cell law <sec:resonant>

Throughout this section, $h > 0$ and $E in \( - 4 - h \, 4 + h \)$ are fixed. All choices may depend on these two parameters. A polynomial bound in $L$ means $C \( 1 + L \)^C$, with constants independent of the exterior system, its dimension, and the artificial-probe mask. The construction below specifies an auxiliary law on one cell. Its incorporation into the true product law is deferred to 19.

=== 4.1 Clipping the corners <clipping-the-corners>

Fix an integer margin $b gt.eq 3$. In a tile of odd side $b_l = 3^l$, use coordinates centered at its central site and put

#[#set math.equation(numbering: n => "(4.1)")
 $ L = frac(b_l - 1, 2) - b \, #h(2em) V = { - L \, dots.h \, L }^2 \\ { \( plus.minus L \, plus.minus L \) } \, #h(2em) J = V \\ { 0 } . $ <cell:sets>]

Only sufficiently large $l$ are used. Let

$ B = { x in.not V : "dist"_1 \( x \, V \) = 1 } \, #h(2em) p_x = upright(bold(1))_({ \| x \|_1 = 1 }) quad \( x in J \) . $

Thus $p$ is the adjacency column from the root $0$ to $J$. Let $M : bb(R)^B arrow.r bb(R)^J$ be the adjacency matrix from $B$ to $J$; when used on $V$, it has an additional zero row at the root. Define

#[#set math.equation(numbering: n => "(4.2)")
 $ Z = { x in J : M_(x \, dot.op) eq.not 0 } \, #h(2em) Z^(+) = { x in J : "dist"_1 \( x \, Z \) lt.eq 1 } \, #h(2em) P = "proj"_(\( ker M \)^perp) . $ <cell:boundary-spaces>]

We identify a projection with its range when specifying a matrix domain. The cell and its corner coupling are shown in 1.

#thm([Lemma 4.1.])[
  (The clipped boundary).  #emph[The set $Z$ consists of the four sides of the square with their corners removed. Every site of $Z$ has an inward nearest neighbor in $J \\ Z$. The restriction $M : P arrow.r bb(R)^Z$ is an isomorphism whose singular values lie in $\[ 1 \, sqrt(3) \]$. In particular, 
$ ∥M∥ lt.eq sqrt(3) \, #h(2em) ∥M w∥ gt.eq ∥w∥ quad \( w in P \) . $

 There is an orthogonal decomposition $P = P_0 + Q$: $P_0$ is the coordinate projection onto the single side sites of $B$, and $Q$ is the direct sum of four two-dimensional corner planes.]
] <cell:geometry>

#proof[
  At the positive corner the relevant sites of $B$, in their fixed order, are
  $ e_1 = \( L + 1 \, L - 1 \) \, #h(2em) e_2 = \( L - 1 \, L + 1 \) \, #h(2em) e_3 = \( L \, L \) . $
  Here and below the same symbols also denote the corresponding coordinate vectors. The two rows indexed by $\( L \, L - 1 \)$ and $\( L - 1 \, L \)$ give the block
  #[#set math.equation(numbering: n => "(4.3)")
   $ mat(delim: "(", 1, 0, 1; 0, 1, 1) . $ <cell:corner-matrix>]
  Its row space is $"span" { e_1 + e_3 \, e_2 + e_3 }$. We use the orthonormal basis
  #[#set math.equation(numbering: n => "(4.4)")
   $ n = frac(\( - 1 \, - 1 \, 1 \), sqrt(3)) \, #h(2em) r_1 = frac(\( 1 \, - 1 \, 0 \), sqrt(2)) \, #h(2em) r_2 = frac(\( 1 \, 1 \, 2 \), sqrt(6)) . $ <cell:corner-basis>]
  Here $n$ spans the kernel, and $r_1 \, r_2$ span the corner plane. The two nonzero singular values are $1$ and $sqrt(3)$. Use the reflected geometric configuration and the same ordered basis coefficients at the other three corners. Every remaining nonzero row of $M$ contains one entry, equal to $1$, in a distinct single side coordinate. This proves the asserted decomposition and singular-value bounds. In fact $\| B \| = 8 L$, $\| Z \| = 8 L - 4$, and $dim P_0 = 8 L - 12$.
  For example, an inward neighbor of $\( L \, y \) in Z$ is $\( L - 1 \, y \)$, which is not in $Z$; the other sides follow by reflection. These choices remain valid next to a clipped corner. All connections from $V$ to its complement pass through $B$, and $V union B$ lies inside the tile because of the fixed margin $b$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-2.688, -2.688), (2.688, 2.688), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.92, -1.44), (-1.44, -1.92), (1.44, -1.92), (1.92, -1.44), (1.92, 1.44), (1.44, 1.92), (-1.44, 1.92), (-1.92, 1.44), close: true, fill: rgb("#f0f0f0"), stroke: none)
  line((-1.92, -1.44), (-1.44, -1.92), (1.44, -1.92), (1.92, -1.44), (1.92, 1.44), (1.44, 1.92), (-1.44, 1.92), (-1.92, 1.44), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-1.92, -1.44), radius: 0.0336, fill: black, stroke: none)
  circle((-1.44, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, -1.44), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.44, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, -1.44), radius: 0.0336, fill: black, stroke: none)
  circle((-1.44, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, -1.44), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.44, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, -0.96), radius: 0.0336, fill: black, stroke: none)
  circle((-0.96, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, -0.96), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.96, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, -0.96), radius: 0.0336, fill: black, stroke: none)
  circle((-0.96, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, -0.96), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.96, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, -0.48), radius: 0.0336, fill: black, stroke: none)
  circle((-0.48, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, -0.48), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.48, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, -0.48), radius: 0.0336, fill: black, stroke: none)
  circle((-0.48, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, -0.48), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.48, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, 0), radius: 0.0336, fill: black, stroke: none)
  circle((0, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, 0), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, 0), radius: 0.0336, fill: black, stroke: none)
  circle((0, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, 0), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, 0.48), radius: 0.0336, fill: black, stroke: none)
  circle((0.48, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, 0.48), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.48, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, 0.48), radius: 0.0336, fill: black, stroke: none)
  circle((0.48, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, 0.48), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.48, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, 0.96), radius: 0.0336, fill: black, stroke: none)
  circle((0.96, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, 0.96), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.96, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, 0.96), radius: 0.0336, fill: black, stroke: none)
  circle((0.96, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, 0.96), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.96, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, 1.44), radius: 0.0336, fill: black, stroke: none)
  circle((1.44, -1.92), radius: 0.0336, fill: black, stroke: none)
  circle((-2.4, 1.44), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.44, -2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, 1.44), radius: 0.0336, fill: black, stroke: none)
  circle((1.44, 1.92), radius: 0.0336, fill: black, stroke: none)
  circle((2.4, 1.44), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.44, 2.4), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, -1.92), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-1.92, 1.92), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, -1.92), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.92, 1.92), radius: 0.048, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.0624, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.768, 0.72), [#text(size: 9pt)[$V$]])
  content((0, 2.688), [#text(size: 9pt)[cell inside its tile]], anchor: "south", padding: 0.1176cm)
  line((-0.864, -0.864), (-1.848, -0.864), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-0.864, -0.864), [#text(size: 9pt)[$Z$]], anchor: "west", padding: 0.1176cm)
  content((0, -3.072), [#text(size: 9pt)[filled boundary sites: $Z$; open sites: $B$]])
  rect((6.34, -1.51), (8.1, 0.226), fill: rgb("#f0f0f0"), stroke: none)
  line((6.5, -0.55), (8.9, -0.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((7.3, -1.35), (7.3, 1.05), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((8.1, -1.35), (8.1, 0.25), (6.5, 0.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((8.1, -0.55), (8.9, -0.55), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((7.3, 0.25), (7.3, 1.05), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((8.1, -0.55), (8.1, 0.25), (7.3, 0.25), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((8.1, -0.55), radius: 0.056, fill: black, stroke: none)
  circle((7.3, 0.25), radius: 0.056, fill: black, stroke: none)
  circle((7.3, -0.55), radius: 0.056, fill: black, stroke: none)
  line((8.1, -0.646), (7.42, -0.646), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((7.204, 0.25), (7.204, -0.43), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  circle((8.9, -0.55), radius: 0.08, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.9, -0.55), [#text(size: 9pt)[$e_1$]], anchor: "west", padding: 0.1176cm)
  circle((7.3, 1.05), radius: 0.08, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.3, 1.05), [#text(size: 9pt)[$e_2$]], anchor: "south", padding: 0.1176cm)
  circle((8.1, 0.25), radius: 0.08, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.1, 0.25), [#text(size: 9pt)[$e_3$#linebreak()clipped corner]], anchor: "south-west", padding: 0.1176cm)
  content((8.1, -0.83), [#text(size: 9pt)[$(L,L-1)$]], anchor: "north-west", padding: 0.1176cm)
  content((7.3, 0.25), [#text(size: 9pt)[$(L-1,L)$]], anchor: "south-east", padding: 0.1176cm)
  content((7.9, -2.15), [#text(size: 9pt)[$Q:#h(0.3333em) "span" \{e_1+e_3,e_2+e_3\}$#linebreak()$ker M:#h(0.3333em) "span" \{(-1,-1,1)\}$]])
})],
  caption: [Figure 1: The clipped cell and a magnified positive corner. The two boundary rows couple to a triple of exterior coordinates, leaving exactly one missing direction. The inward arrows reach a site outside $Z$; this geometric fact is used in the transmission argument. ],
) <fig:clipped-cell>

=== 4.2 Calibrating the root with a decaying profile <calibrating-the-root-with-a-decaying-profile>

We choose the root reference value so that the Dirichlet cell has a mode at energy $E$. For arbitrary real values $v \|_J$, write

$ A = "Adj"_J + "diag"_J \( v - E \) . $

Whenever $A$ is invertible, define

#[#set math.equation(numbering: n => "(4.5)")
 $ c \( v \) = E + p^top A^(- 1) p . $ <cell:calibrated-root>]

The Dirichlet matrix on $V$, with root potential $c \( v \)$, then satisfies

#[#set math.equation(numbering: n => "(4.6)")
 $ mat(delim: "(", c \( v \) - E, p^top; p, A) vec(1, - A^(- 1) p) = 0 . $ <cell:dirichlet-mode>]

Thus invertibility of the punctured matrix $A$ permits resonance of the full Dirichlet cell. We must choose the interior law so that $A^(- 1)$ is controlled, $c \( v \)$ stays inside the physical potential interval, and this root-normalized mode is small at the boundary. The transmission estimates will later control how it couples to an arbitrary passive exterior.

We first construct a comparison profile $psi$, normalized by $psi_0 = 1$, and potentials $v^0$ satisfying its local equation. The profile is defined also on $B$, where it is small but nonzero, so it need not be a Dirichlet eigenvector. A deformation of this profile will give a polynomial inverse bound for the punctured matrix at $v^0$. These two properties will control the exact calibrated mode after the interior values are randomly perturbed.

Choose a rational multiple $theta$ of $pi$ and a real phase $phi.alt$ such that

#[#set math.equation(numbering: n => "(4.7)")
 $ \| E - 4 cos theta \| < h \, #h(2em) m_theta := min_(k in bb(Z)) \| cos \( theta k + phi.alt \) \| > 0 . $ <cell:carrier>]

The first choice is possible because the energy is in $\( - 4 - h \, 4 + h \)$ and rational multiples of $pi$ are dense. The sequence of cosine values is periodic, so the second condition excludes only finitely many phases modulo $2 pi$. Put

$ d = frac(h - \| E - 4 cos theta \|, 8) > 0 . $

Define the real sequence $f$ on all integers by

#[#set math.equation(numbering: n => "(4.8)")
 $ f_0 & = 0 \,\
f_k + f_(k + 1) & = "sign" #scale(x: 120%, y: 120%)[\(] cos \( theta k + phi.alt \) cos \( theta \( k + 1 \) + phi.alt \) #scale(x: 120%, y: 120%)[\)] . $ <cell:recurrence>]

Recursion in either direction gives $\| f_k \| lt.eq \| k \|$. For small fixed $nu \, c_u > 0$, and $\| u \| lt.eq c_u \/ L$, set

#[#set math.equation(numbering: n => "(4.9)")
 $ psi_x \( u \) & = e^(- nu \| x \|_oo) frac(cos \( theta \( x_1 + x_2 \) + phi.alt \), cos phi.alt) e^(u f_(x_1 + x_2)) quad \( x in V union B \) \,\
v_x^0 \( u \) & = E - sum_(y tilde.op x) frac(psi_y \( u \), psi_x \( u \)) quad \( x in V \) . $ <cell:profile-formula>]

Every neighbor in the last sum belongs to $V union B$ and $psi_0 = 1$. Uniformly over the allowed parameters,

#[#set math.equation(numbering: n => "(4.10)")
 $ c e^(- nu \| x \|_oo) lt.eq \| psi_x \( u \) \| lt.eq C e^(- nu \| x \|_oo) . $ <cell:profile-size>]

Indeed $\| u f_(x_1 + x_2) \|$ is bounded by a fixed multiple of $c_u$ and the periodic carrier is bounded away from zero. For neighbors $x \, y$ the additional ratio factors differ from $1$ by $O \( nu + c_u \)$: their radial exponents differ by at most $nu$, and $\| u \( f_(y_1 + y_2) - f_(x_1 + x_2) \) \| lt.eq C c_u$. At $nu = u = 0$, the cosine addition formula gives $v_x^0 = E - 4 cos theta$. We therefore fix $nu \, c_u$ small enough, once and for all, that

#[#set math.equation(numbering: n => "(4.11)")
 $ \| v_x^0 \( u \) - \( E - 4 cos theta \) \| lt.eq d \, #h(2em) \| v_x^0 \( u \) \| lt.eq h - 7 d . $ <cell:design-margin>]

#thm([Lemma 4.2.])[
  (Choice of the profile parameter).  #emph[There is a fixed exponent $C_2$ such that, for every sufficiently large $L$, a deterministic $u_L in \[ - c_u \/ L \, c_u \/ L \]$ can be chosen for which the real symmetric Dirichlet matrix 
$ A^0 = "Adj"_J + "diag"_J \( v^0 - E \) $

 satisfies $∥\( A^0 \)^(- 1)∥ lt.eq L^(C_2)$. The bounds in (4.10), (4.11) hold for this choice, with constants independent of $L$.]
] <cell:profile>

#proof[
  During the proof retain $u$ as a variable. Let $Psi \( u \) = "diag" \( psi_x \( u \) : x in J \)$, $W \( u \) = Psi \( u \)^2$, and $Q \( u \) = - Psi \( u \) A^0 \( u \) Psi \( u \)$. Extend a test vector $alpha$ by zero at $0$ and on $B$. Counting each unoriented edge meeting $J$ once gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ alpha^(*) Q \( u \) alpha = sum_({ x \, y } : { x \, y } ∩ J eq.not diameter) psi_x \( u \) psi_y \( u \) \| alpha_x - alpha_y \|^2 . $ <cell:weighted-form>]
  The sum here contains only edges with the other endpoint in $J union { 0 } union B$. Its weights may have either sign. Nevertheless, (4.8) gives the exact identity
  $ frac(thin upright(d), thin upright(d) u) #scale(x: 120%, y: 120%)[\(] psi_x \( u \) psi_y \( u \) #scale(x: 120%, y: 120%)[\)] = \| psi_x \( u \) psi_y \( u \) \| quad \( x tilde.op y \) . $
  Thus $Q' \( u \)$ is a positive weighted Dirichlet form.
  For each $x in J$, choose a nearest-neighbor path to $0$ by decreasing coordinates in absolute value. It lies in $V$, has at most $2 L$ edges, and its max radius never exceeds $\| x \|_oo$. Every edge on the path has weight $\| psi_y psi_z \| gt.eq c \| psi_x \|^2$, by (4.10). Weighted Cauchy–Schwarz along the path gives
  $ \| psi_x \|^2 \| alpha_x \|^2 lt.eq C L sum_({ y \, z } upright(" on the path")) \| psi_y psi_z \| \| alpha_y - alpha_z \|^2 lt.eq C L thin alpha^(*) Q' \( u \) alpha . $
  Summing over at most $C L^2$ sites shows
  #[#set math.equation(numbering: n => "(4.13)")
   $ Q' \( u \) gt.eq c L^(- 3) W \( u \) gt.eq L^(- C_1) W \( u \) $ <cell:form-monotonicity>]
  for some fixed $C_1$, after increasing the lower size threshold. One may take $C_1 = 4$. Moreover, all $W \( u \)$ in the allowed interval are comparable as quadratic forms, with a fixed comparison constant, and
  $ - C L W \( u \) lt.eq W' \( u \) lt.eq C L W \( u \) . $
  Choose $C_2 > C_1 + 3$ and put $t = L^(- C_2)$. For sufficiently large $L$,
  $ \( Q plus.minus t W \)' gt.eq 1 / 2 L^(- C_1) W . $
  More explicitly, form comparability and (4.13) give, whenever $u_2 - u_1 > C' t L^(C_1)$ with a sufficiently large fixed $C'$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ Q \( u_2 \) - t W \( u_2 \) > Q \( u_1 \) + t W \( u_1 \) . $ <cell:inertia-comparison>]
  Let $lambda_k \( u \)$ be the $k$th eigenvalue, in increasing order, of $- A^0 \( u \)$. Congruence by the invertible real diagonal matrix $Psi \( u \)$ preserves the numbers of negative, zero, and positive eigenvalues. Consequently, if $lambda_k \( u_1 \) gt.eq - t$, the $k$th eigenvalue of $Q \( u_1 \) + t W \( u_1 \)$ is nonnegative. The strict inequality in (4.14) then makes the $k$th eigenvalue of $Q \( u_2 \) - t W \( u_2 \)$ positive, so $lambda_k \( u_2 \) > t$.
  It follows that each set ${ u : \| lambda_k \( u \) \| lt.eq t }$ has diameter at most $C' t L^(C_1)$. No monotonicity assertion about the individual $lambda_k \( u \)$ is needed. The union of these sets, over $\| J \| = O \( L^2 \)$ indices, has length at most $C L^(C_1 + 2 - C_2) = o \( L^(- 1) \)$, whereas the available interval has length $2 c_u \/ L$. Choose $u_L$ outside this union. For definiteness, one may choose the first rational point in a fixed enumeration that belongs to the open complement. Then $"dist" \( 0 \, "spec" A^0 \) > L^(- C_2)$, proving the inverse bound. ◻
]

From now on $u = u_L$ is fixed and suppressed in the notation. Set

#[#set math.equation(numbering: n => "(4.15)")
 $ epsilon.alt = e^(- nu L) \, #h(2em) sigma = epsilon.alt^2 . $ <cell:epsilon>]

In particular, $\| psi_x \|$ is comparable to $epsilon.alt$ on $B$ and on $Z^(+)$, with constants independent of $L$. We have chosen the port strength $sigma$ as the square of this designed boundary-profile scale. The exact calibrated mode will satisfy the polynomially lossy comparison in (4.23).

=== 4.3 The branch sampler <the-branch-sampler>

We first describe the boundary conditionings used by the sampler. For each corner triple use the fixed basis in (4.4) and put

#[#set math.equation(numbering: n => "(4.16)")
 $ sans(D)_j = "diag" (frac(\( r_j \)_i, n_i) : 1 lt.eq i lt.eq 3) quad \( j = 1 \, 2 \) . $ <cell:box-directions>]

These matrices satisfy

$ sans(D)_j n = r_j \, #h(2em) "tr" sans(D)_j = 0 \, #h(2em) n^top sans(D)_j n = 0 . $

Thus a common shift changes the real diagonal in the missing direction $n$, while a shift along $sans(D)_j$ changes its coupling to $r_j$ without changing that diagonal. The three diagonal directions $I \, sans(D)_1 \, sans(D)_2$ are linearly independent: multiplying a vanishing linear combination by $n$ gives a vanishing linear combination of the orthonormal vectors $n \, r_1 \, r_2$. Thus centered coordinates $\( s \, t_1 \, t_2 \)$ specify physical potentials by

#[#set math.equation(numbering: n => "(4.17)")
 $ "diag" \( v \) = "diag" \( macron(v) \) + s I + t_1 sans(D)_1 + t_2 sans(D)_2 . $ <cell:box-coordinates>]

The map has a fixed nonzero Jacobian. In fact its three columns, as vectors of diagonal entries, are orthogonal and have length $sqrt(3)$. Use this same coordinate convention at all levels, including at exactly coincident triples.

A prescribed corner box is the image under (4.17) of a product of three centered intervals. Fix an exponent $kappa$. The boxes allowed below have all three side lengths at least $c \( 1 + L \)^(- kappa)$ and at most $C$, lie at distance at least $c \( 1 + L \)^(- kappa)$ from the boundary of $\( - h \, h \)^3$, and keep each physical coordinate in a single polynomial piece of the fixed artificial profile $theta.alt$. Constants may depend on $kappa$; in the hierarchy this exponent is fixed by $K_0$. Uniform measure in these box coordinates is also uniform measure in the physical parallelepiped. Because $theta.alt$ is positive in the interior and comparable to squared distance from the support endpoints, every nonzero artificial profile $a_i in { 1 \, theta.alt }$ on a permitted box obeys

#[#set math.equation(numbering: n => "(4.18)")
 $ a_i \( v_i \) gt.eq c \( 1 + L \)^(- 2 kappa) . $ <cell:box-profile-lower>]

Increasing the exponent absorbs any fixed comparison constants.

Choose $D_1 > C_2 + 2$. A shell-depth parameter $D_2$ will be fixed after the polynomial thresholds in the boundary and zero-jitter transmission estimates have been fixed. Finally choose $D_3$ sufficiently large depending on $D_1 \, D_2$ and these thresholds. On $J$ sample

#[#set math.equation(numbering: n => "(4.19)")
 $ v_x = v_x^0 + r upright(bold(1))_(Z^(+)) \( x \) + zeta_x \, #h(2em) r tilde.op "Unif" \[ - L^(- D_1) \, L^(- D_1) \] \, $ <cell:interior-sampler>]

where the $zeta_x$ are independent centered uniforms of half-width

#[#set math.equation(numbering: n => "(4.20)")
 $ w_x = cases(delim: "{", L^(- D_3) \, & L - \| x \|_oo lt.eq D_2 log L + 5 \,, epsilon.alt L^(- D_3) \, & L - \| x \|_oo > D_2 log L + 5 .) $ <cell:jitter-widths>]

They are independent of $r$ and all boundary sampling.

For these interior draws, use the matrix $A$ and the calibrated value $c \( v \)$ from (4.5). At the root, put an open cell port $a$ of strength $sigma$, and use $c \( v \)$ as its real reference potential. To define the hidden true potential, fix a smooth cutoff $chi : bb(R) arrow.r \[ 0 \, 1 \]$ with $chi = 1$ on $\[ - d \, d \]$ and $"supp" chi subset \[ - 2 d \, 2 d \]$, and sample

#[#set math.equation(numbering: n => "(4.21)")
 $ v_0 = c \( v \) + delta \, #h(2em) bb(P) \( delta in thin upright(d) t divides v \|_J \) = 1 / Z_sigma chi \( t \) frac(sigma, pi \( t^2 + sigma^2 \)) thin thin upright(d) t \,\
Z_sigma = integral_(bb(R)) chi \( t \) frac(sigma, pi \( t^2 + sigma^2 \)) thin thin upright(d) t . $ <cell:hidden-root>]

This is exactly the cutoff Cauchy law used in 5. The open reference $c \( v \)$ does not depend on the hidden draw $delta$.

The boundary law is as follows. On each corner triple sample uniformly in its prescribed box, independently between the four triples. On every single side site $x$ sample

#[#set math.equation(numbering: n => "(4.22)")
 $ v_x = xi_x + s_0 \, #h(2em) xi_x tilde.op "Unif" \[ - h \/ 4 \, h \/ 4 \] \, #h(2em) s_0 tilde.op "Unif" \[ - h \/ 4 \, h \/ 4 \] \, $ <cell:side-law>]

using independent $xi_x$ and one common $s_0$. These draws are independent of the triples and the interior draws. Sites of the tile outside $V union B$ retain their independent uniform $\[ - h \, h \]$ laws, independently of all draws just described. Apart from the common shifts $r \, s_0$ and the dependence of the root center $c \( v \)$ on $v \|_J$, all sampling is independent.

#thm([Proposition 4.3.])[
  (Properties of the branch law).  #emph[For sufficiently large $L$, the above choices have the following properties, uniformly over permitted corner boxes:]
  + #emph[Every interior draw has 
#[#set math.equation(numbering: n => "(4.23)")
 $ ∥A^(- 1)∥ lt.eq 2 L^(C_2) \, #h(2em) ∥- A^(- 1) p - psi \|_J∥ lt.eq C L^(C_2 + 1) epsilon.alt . $ <cell:residual>]

 The exponents in these bounds are independent of $D_2$, provided $D_3$ is subsequently chosen sufficiently large.]
  + #emph[All true potentials on $V$ lie in a fixed compact subinterval of $\( - h \, h \)$. The root center satisfies 
#[#set math.equation(numbering: n => "(4.24)")
 $ \| c \( v \) - v_0^0 \| lt.eq C L^(C_2 + 1) epsilon.alt . $ <cell:root-calibration>]

 The plateau of $theta.alt$ can therefore be fixed to contain every true value on $V$ and every single side value in $B$, for all the cells used. The artificial absorptions on these sites are constant as $r$, the jitters, the common side shift, and the hidden root draw vary.]
  + #emph[Relative to the true product law on the tile conditioned on these same four corner boxes, the branch has a density $cal(L)$ satisfying 
#[#set math.equation(numbering: n => "(4.25)")
 $ 0 lt.eq cal(L) lt.eq exp #scale(x: 120%, y: 120%)[\(] C L^3 + C L^2 log L #scale(x: 120%, y: 120%)[\)] \, #h(2em) integral cal(L) thin thin upright(d) bb(P)_(upright(t r u e \, b o x e s)) = 1 . $ <cell:likelihood>]

 The corner-box conditional laws and the laws outside $V union B$ are unchanged.]
  #emph[Artificial probes may have any prescribed mask of absent, constant, or profile-dependent strengths, as in 3.5. For subsequent cell estimates their common scale is restricted to $0 lt.eq tau lt.eq e^(- c_(*) L)$, with a fixed $c_(*) > 2 nu$.]
] <cell:branch>

#proof[
  The perturbation from $A^0$ is diagonal and has norm at most $L^(- D_1) + L^(- D_3)$. Taking $D_3 > D_1$, 9 and a Neumann series give the first bound in (4.23). The profile equation on $J$ gives the exact residual identity
  $ A^0 psi \|_J + p = - M psi \|_B . $
  The right-hand side has norm at most $C sqrt(L) epsilon.alt$. On $Z^(+)$, $\| psi_x \| lt.eq C epsilon.alt$, so the additional common-shift residual has norm at most $C L epsilon.alt L^(- D_1)$. On the jitter shell,
  $ \| psi_x \| lt.eq C epsilon.alt L^(nu D_2) \, $
  where the extra depth $5$ has been absorbed in $C$. Its jitter residual is bounded by $C L epsilon.alt L^(nu D_2 - D_3)$. Off that shell, the half-width already has a factor $epsilon.alt$, and $\| psi_x \| lt.eq C$, giving an upper bound $C L epsilon.alt L^(- D_3)$. Thus $D_3 > nu D_2 + 2$ ensures
  $ ∥A psi \|_J + p∥ lt.eq C L epsilon.alt . $
  Multiplication by $A^(- 1)$ proves the second bound in (4.23). Notice that the resulting exponent $C_2 + 1$ was fixed before $D_2$.
  Since $psi_0 = 1$, the profile equation at $0$ reads $v_0^0 = E - p^top psi \|_J$. Subtracting this from the definition of $c \( v \)$ proves (4.24). Increase the minimum cell size so that all interior perturbations and the last calibration error are at most $d$. By (4.11), $\| v_x \| lt.eq h - 6 d$ on $J$, $\| c \( v \) \| lt.eq h - 6 d$, and $\| v_0 \| lt.eq h - 4 d$ after the hidden draw. The side values lie in $\[ - h \/ 2 \, h \/ 2 \]$. Choose the plateau to contain these compact intervals. This choice uses only the original design margin $d$, and is therefore available before the large width and shell exponents are fixed. Each present artificial profile on these sites is then identically $1$, proving the constancy assertion, also at the root.
  For the density estimate, first condition on $r$ and $s_0$. Each jitter has density at most $\( 2 w_x \)^(- 1)$ in its physical coordinate, hence likelihood at most $h \/ w_x$ relative to a uniform $\[ - h \, h \]$ coordinate. For small $sigma$, $Z_sigma gt.eq 1 \/ 2$, so the conditional root density is at most $C \/ sigma$. Its likelihood relative to the true uniform coordinate is at most $C_h \/ sigma$. Each single side coordinate has likelihood at most $4$. Multiplying these bounds before averaging the common shifts gives
  $ log cal(L) lt.eq C \| J \| + D_3 \| J \| log L + nu L thin \# { x in J : w_x = epsilon.alt L^(- D_3) } + 2 nu L + C \| B \| lt.eq C L^3 + C L^2 log L . $
  An upper bound of this form also holds when some individual displayed logarithms are negative. The four corner factors cancel against the identical box conditionings in the reference law. The outside factors cancel as well. All sampler laws are normalized, so integration gives the last assertion in (4.25). ◻
]

We record explicitly the order of choices used later. The carrier, $d \, nu \, c_u \, C_1 \, C_2$, the compact cutoff and plateau, and the corner-box exponent are fixed first. Next fix $D_1$. The polynomial threshold in 11 and the regular inverse thresholds in the zero-jitter part of 17 can then be fixed without $D_2 \, D_3$. At depth $L - \| x \|_oo = floor.l D_2 log L floor.r$, (4.10) gives

$ frac(\| psi_x \|, epsilon.alt) gt.eq c L^(nu D_2) . $

Choose $D_2$ large enough that this dominates the already fixed polynomial errors and reflected-field bounds in that argument. Finally choose $D_3$ to satisfy both the residual requirements above and the inverse and path-entry stability requirements of 17. Enlarging $D_3$ changes neither the exponents in (4.23) nor the earlier zero-jitter bounds. All parameters are now fixed; only after that do we increase the lower cell-size threshold. This order prevents the depth choice from depending on a polynomial exponent that itself grows with the depth.

== 5 A weighted projected impedance estimate <sec:impedance>

We retain the boundary geometry and the conditional boundary law of Lemma 4.1, Proposition 4.3. In this section the interior of the cell does not enter the calculation. Its only relevant feature is that it couples to the boundary space through the projection $P$. We write

$ P = P_0 + Q \, #h(2em) Q = Q_1 + Q_2 + Q_3 + Q_4 \, $

where $P_0$ projects onto the single side sites and $Q_a$ projects onto the two-dimensional plane of the $a$th corner triple. The four complementary directions in the triples are denoted by $n_a$. In the prescribed ordering of each triple, $n_a = \( - 1 \, - 1 \, 1 \) \/ sqrt(3)$. Thus $"rank" Q = 8$, whereas the dimension of the whole boundary space is $O \( L \)$.

All norms below use the fixed real orthonormal bases of these spaces. Constants may depend on the fixed disorder, profile, and corner-box parameters. They will not depend on the exterior matrices, their norms, the source vector, or the artificial-probe mask. Until an exponent $H$ is selected below, every expression denoted by $"poly" \( L \)$ means a bound $C \( 1 + L \)^C$ whose constants are independent of $H$. A final polynomial bound is allowed to depend on that selected, fixed exponent.

#thm([Proposition 5.1.])[
  (Weighted projected impedance).  #emph[Let $T$ be any fixed complex symmetric matrix on the boundary space with $- "Im" T gt.eq 0$, and let $k$ be any fixed vector there. For each boundary site prescribe $a_i$ to be one of $0$, $1$, and $theta.alt$, with the prescription independent of the boundary variables. Set 
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(T) = T + "diag"_B #scale(x: 120%, y: 120%)[\(] v_i - i tau a_i \( v_i \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) rho = ∥P \( cal(T) - i P \)^(- 1) k∥^2 . $ <imp:rho>]

 Fix $c_(*) > 0$ and suppose $0 lt.eq tau lt.eq e^(- c_(*) L)$. There are constants $c > 0$, $C < oo$, and a sufficiently large lower threshold for $L$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E)_B #h(-0.16667em) [rho thin upright(bold(1))_({ ∥P cal(T)^(- 1) P∥ lt.eq C \( 1 + L \)^C })] gt.eq c thin bb(E)_B rho . $ <imp:weighted-estimate>]

 Here the expectation uses the boundary law conditional on its four corner boxes. The constants are uniform in all the exterior data just described. Moreover, changing only the single side variables to any other bounded allowed settings, including their artificial absorptions, changes $rho$ by at most fixed multiplicative factors, pointwise wherever the inverses exist.]
] <imp:weighted>

The weight in (5.1) matters: a small unweighted exceptional set could contain nearly all the response of a weakly coupled exterior mode. We first control the inverse on the corner planes $Q$ while leaving unit absorption on the single side coordinates $P_0$. The corner estimates must retain a fixed fraction of the response weight. We then average the common real side shift to bound the whole projected inverse $P cal(T)^(- 1) P$ with the auxiliary $P_0$ absorption removed.

=== 5.1 Elementary reductions and polynomial estimates <elementary-reductions-and-polynomial-estimates>

We first record the comparison that permits bounded changes of the absorbed coordinates.

#thm([Lemma 5.2.])[
  (Comparison of absorbed responses).  #emph[Suppose $D_1 \, D_2$ are invertible matrices with $- "Im" D_j gt.eq P$. If $D_2 - D_1 = P Delta P$ and $∥Delta∥ lt.eq K$, then, for every $k$, 
$ \( 1 + K \)^(- 1) ∥P D_1^(- 1) k∥ lt.eq ∥P D_2^(- 1) k∥ lt.eq \( 1 + K \) ∥P D_1^(- 1) k∥ . $

]
] <imp:comparison>

#proof[
  The inverse difference identity gives
  $ P D_2^(- 1) k = P D_1^(- 1) k - P D_2^(- 1) P Delta P D_1^(- 1) k . $
  By 2, $∥P D_2^(- 1) P∥ lt.eq 1$. This proves the upper bound; interchanging the indices proves the lower bound. ◻
]

The inverses used in this section exist almost everywhere in the stated boundary law. To see this without any nonsingularity assumption on $T$, recall that a kernel vector of a passive matrix is annihilated by both its Hermitian real and imaginary parts. Absorption on $P$ restricts such a vector to the four missing directions. On that space the Hermitian real part has the form of a fixed real symmetric matrix plus the independent common corner shifts on its diagonal. Its determinant is a nonzero polynomial, with the product of those shifts as its leading monomial. The same reasoning applies after one missing direction is deleted or after bounded changes in plane blocks. With absorption only on $P_0$, a possible kernel lies on the full corner triples. The four common shifts act there as scalar shifts on their respective three-dimensional blocks; the determinant again has a nonzero leading monomial. Finally, $cal(T)$ itself has physical real diagonal variables with a joint density, so its Hermitian real part is nonsingular almost everywhere. These observations also justify almost-everywhere slicing below.

The response weights are integrable. For example, writing $G = \( cal(T) - i P \)^(- 1)$, the Ward identity implies

$ ∥P G k∥^2 lt.eq k^(*) \( "Im" G \) k lt.eq ∥k∥^2 "tr" "Im" G . $

The joint law of the physical boundary diagonals has a bounded density on a compact set; the bound here may depend on $L$. Slice that set along a common real shift of all the physical diagonals. The phase estimate 7, including its artificial-diagonal derivative term, bounds the integral of $"tr" "Im" G$ along each slice. Integration over the transverse coordinates proves finiteness. One may add $- i zeta upright(bold(1))$ first and pass to the limit by Fatou. In particular, after some boundary variables are frozen, all integrals below are finite for almost every such choice.

We shall use two elementary facts about polynomials. Their degree bounds are fixed throughout this section.

#thm([Lemma 5.3.])[
  (Polynomial norms and products).  #emph[On a rectangular box in a fixed number of real variables, let $p$ be a polynomial of degree at most $d$ with values in a finite-dimensional Hilbert space. There is a constant depending only on $d$ and the number of variables such that 
#[#set math.equation(numbering: n => "(5.3)")
 $ sup ∥p∥^2 lt.eq C thin upright("avg") ∥p∥^2 . $ <imp:poly-average>]

 If the length of a coordinate interval is at least $ell$, then 
#[#set math.equation(numbering: n => "(5.4)")
 $ sup ∥partial_j p∥ lt.eq C ell^(- 1) sup ∥∥ p . $ <imp:poly-derivative>]

 If $q$ is a scalar polynomial of degree at most $d$, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ sup ∥p q∥ gt.eq c thin sup ∥∥ p thin sup lr(||) q . $ <imp:poly-product>]

 The constants do not depend on the dimension of the target Hilbert space or the side lengths of the box.]
] <imp:polynomials>

#proof[
  Affinely rescale the box to a unit cube. For scalar polynomials of bounded degree, the asserted norm comparisons and derivative estimate follow from equivalence of norms on a fixed finite-dimensional vector space. For (5.3), choose a point where $∥∥ p$ is maximal and a unit linear functional attaining that norm at that point; apply the scalar estimate to its composition with $p$. The derivative estimate follows in the same way by projecting at a maximizing derivative.
  For the scalar product estimate, normalize the two supremum norms to one. The two unit spheres of bounded-degree scalar polynomials are compact. The supremum norm of their product has a positive minimum: otherwise two nonzero limiting polynomials would have identically zero product. Projecting the vector polynomial at one of its maximizing points reduces (5.5) to this scalar result. ◻
]

The following one-dimensional observation will prevent an extremely narrow response peak from defeating a short-exception estimate.

#thm([Lemma 5.4.])[
  (Resolution of a weighted slice).  #emph[Let $I$ be an interval of length at least $ell$, let $N$ be a Hilbert-space-valued polynomial of fixed degree on $I$, and let $z$ be a continuously differentiable complex function satisfying 
$ lr(|z \( s \)|) gt.eq c_0 a \, #h(2em) lr(|z' \( s \)|) lt.eq C_0 \, #h(2em) a > 0 . $

 Then 
$ sup_(s in I) ∥N \( s \)∥^2 / lr(|z \( s \)|)^2 lt.eq frac(C, min \( ell \, a \)) integral_I ∥N \( s \)∥^2 / lr(|z \( s \)|)^2 thin thin upright(d) s . $

 Here $C$ depends only on $c_0 \, C_0$ and the degree bound.]
] <imp:resolution>

#proof[
  Take a maximizing point $s_0$ and an interval $I_0 subset I$ containing it, of length a sufficiently small fixed multiple of $min \( ell \, a \)$. The derivative bound gives $lr(|z \( s \)|) lt.eq 2 lr(|z \( s_0 \)|)$ on $I_0$. Applying (5.3) on $I_0$ yields
  $ integral_(I_0) ∥N \( s \)∥^2 / lr(|z \( s \)|)^2 thin thin upright(d) s gt.eq frac(c lr(|I_0|) ∥N \( s_0 \)∥^2, lr(|z \( s_0 \)|)^2) . $
  This proves the claim, including when $s_0$ is an endpoint. ◻
]

=== 5.2 Eight corner tests <eight-corner-tests>

Remove the common shift from the single side variables and omit their artificial absorptions. Denote the resulting boundary matrix by $cal(T)_0$, and set

$ w_0 = ∥P \( cal(T)_0 - i P \)^(- 1) k∥^2 . $

The independent single side uniforms are still present. By 12, $w_0$ and $rho$ are pointwise comparable by fixed factors. We now hold those independent side uniforms fixed.

Choose an exponent $H$, to be fixed after the polynomial losses below, and put

$ eta = L^(- H) \, #h(2em) G_eta = \( cal(T)_0 - i P_0 - i eta Q \)^(- 1) . $

For each vector $b'$ in the eight prescribed real orthonormal corner-plane bases, define

#[#set math.equation(numbering: n => "(5.6)")
 $ cal(E)_(b') = {eta "Im" \( b' ""^top G_eta b' \) gt.eq 1 / 40} . $ <imp:test>]

Outside their union,

#[#set math.equation(numbering: n => "(5.7)")
 $ ∥Q \( cal(T)_0 - i P_0 \)^(- 1) Q∥ lt.eq eta^(- 1) . $ <imp:Qgood>]

Indeed, if $∥Q G_eta Q∥ < \( 2 eta \)^(- 1)$, inverse difference and a Neumann series give the bound in (5.7). Hence failure of that bound forces $∥Q G_eta Q∥ gt.eq \( 2 eta \)^(- 1)$. Ward on $Q$ then gives

$ eta "tr" \( Q "Im" G_eta Q \) gt.eq eta^2 ∥Q G_eta Q∥_(upright("HS"))^2 gt.eq 1 / 4 . $

If all eight tests fail to occur, the left side is less than $8 \/ 40 < 1 \/ 4$, a contradiction.

Fix one test and condition on all boundary variables outside its corner triple. Use centered box coordinates $\( s \, t_1 \, t_2 \)$ there, where $s$ is the common shift and $t_j$ is the shift whose diagonal matrix maps the missing direction $n$ to the plane basis vector $r_j$. In particular, the $t_j$ shift has zero $n \, n$ entry. Write $t = \( t_1 \, t_2 \)$. Every side length of the box is at least $ell gt.eq \( 1 + L \)^(- C)$ and at most a fixed constant. All probabilities and averages on this box are normalized uniform ones.

There is first an unweighted bound

#[#set math.equation(numbering: n => "(5.8)")
 $ bb(P)_(s \, t) \( cal(E)_(b') \) lt.eq "poly" \( L \) eta . $ <imp:unweighted>]

For fixed $t$, apply 7 while varying $s$. Its real derivative is the identity on the tested triple. The artificial derivatives satisfy the profile condition and are controlled by their actual absorption, so the integral of the triple partial trace of $"Im" G_eta$ is polynomially bounded. Since $b'$ is a unit vector in that triple, its quadratic form is bounded by this trace. Divide by the interval length, then average over $t$, to obtain (5.8). Neither the phase range nor this polynomial loss depends on $H$ or on the exterior norm.

We must strengthen (5.8) to a bound for $w_0$-mass.

=== 5.3 A fixed remainder at one corner <a-fixed-remainder-at-one-corner>

The exceptional test still uses the actual inverse $G_eta$. To measure its weight, we replace $w_0$ by a comparable response whose remainder after deleting the tested missing direction $n$ is fixed. In $cal(T)_0 - i P$, freeze the real variations of the tested triple within its plane-plane block at the box center. Replace the artificial absorption in that plane-plane block by $tau$ times the plane identity. Retain every fixed term from $T$ and retain all actual mixed terms and the missing-direction diagonal. Call this modified matrix $tilde(D)$.

The modification is bounded and supported on the tested plane. It also preserves absorption at least $P$ plus the original artificial absorption of the tested triple. In fact the change of artificial absorption is

$ tau Q_a #scale(x: 120%, y: 120%)[\(] upright(bold(1)) - "diag" \( a_i \( v_i \) \) #scale(x: 120%, y: 120%)[\)] Q_a gt.eq 0 \, $

because $0 lt.eq a_i lt.eq 1$. Consequently

#[#set math.equation(numbering: n => "(5.9)")
 $ C^(- 1) w_0 lt.eq W := ∥P tilde(D)^(- 1) k∥^2 lt.eq C w_0 . $ <imp:modified-weight>]

The constant is fixed by 12.

Delete the tested missing direction $n$, and denote the inverse of the remaining block of $tilde(D)$ by $G_(upright(a))$. This inverse is independent of $\( s \, t \)$. The off-diagonal column from $n$ and its Schur denominator have the form

#[#set math.equation(numbering: n => "(5.10)")
 $ p_1 \( s \, t \) & = p_10 + t_1 r_1 + t_2 r_2 - i tau sum_(i upright(" in the triple")) a_i \( v_i \) n_i Q e_i \,\
s - e \( s \, t \) & = s - e_(upright("fix")) - p_1^top G_(upright(a)) p_1 - i tau sum_(i upright(" in the triple")) a_i \( v_i \) n_i^2 . $ <imp:p1>]

The fixed vector $p_10$ may have components outside the tested triple; no bound on it is assumed. All variable parts of $p_1$ lie in the tested plane. The constants in (5.10) include the fixed diagonal at $n$; there is no real $t$-dependent contribution to that diagonal.

Write $k_(hat(n))$ for $k$ with its $n$ coordinate deleted, and set

#[#set math.equation(numbering: n => "(5.11)")
 $ a = P G_(upright(a)) k_(hat(n)) \, #h(2em) d_1 = P G_(upright(a)) p_1 \, #h(2em) beta = p_1^top G_(upright(a)) k_(hat(n)) - k_n . $ <imp:adb>]

The block inverse formula yields

#[#set math.equation(numbering: n => "(5.12)")
 $ W = ∥a + frac(d_1 beta, s - e)∥^2 = ∥N_1∥^2 / lr(|s - e|)^2 \, #h(2em) N_1 = a \( s - e \) + d_1 beta . $ <imp:W>]

The norm of $d_1$ measures the response on the absorbed coordinates induced by unit amplitude in the missing direction. The scalar Schur denominator $s - e$ controls how sharply $W$ can concentrate. It need not agree with the corresponding denominator in the actual test $G_eta$. Each profile lies on one fixed polynomial piece throughout the corner box. Hence $p_1 \, d_1 \, beta \, e \, N_1$ are polynomials in $\( s \, t \)$ of bounded degree, independently of all exterior data. Their coefficients need not be bounded.

#thm([Lemma 5.5.])[
  (Corner Schur estimates).  #emph[Uniformly throughout the box, 
#[#set math.equation(numbering: n => "(5.13)")
 $ "Im" e & gt.eq ∥d_1∥^2 \, & lr(|partial_s e|) & lt.eq C tau \( 1 + ∥d_1∥ \) \,\
∥partial_s d_1∥ & lt.eq C tau \, & lr(|partial_s beta|) & lt.eq C tau ∥∥ a \,\
∥partial_(t_j) d_1∥ & lt.eq C \, & lr(|partial_(t_j) e|) & lt.eq C \( 1 + ∥d_1∥ \) . $ <imp:derivatives-a>]

 If at least one artificial probe is present in the tested triple and $tau > 0$, then also 
#[#set math.equation(numbering: n => "(5.14)")
 $ "Im" e gt.eq frac(tau, "poly" \( L \)) . $ <imp:probe-floor>]

 For every fixed $t$, 
#[#set math.equation(numbering: n => "(5.15)")
 $ integral ∥d_1 \( s \, t \)∥^2 / lr(|s - e \( s \, t \)|)^2 thin thin upright(d) s lt.eq integral "Im" frac(1, s - e \( s \, t \)) thin thin upright(d) s lt.eq "poly" \( L \) . $ <imp:s-integral>]

]
] <imp:schur-estimates>

#proof[
  Apply absorption to the Schur extension $\( - G_(upright(a)) p_1 \, 1 \)$ at $n$. Its quadratic form under $tilde(D)$ is the scalar $s - e$, and its absorbed $P$-coordinates have norm $∥d_1∥$. This proves the first inequality. Every derivative of $p_1$ is supported in the tested plane. Its $s$ derivative has size $O \( tau \)$, whereas its $t_j$ derivative is $r_j + O \( tau \)$. Since $∥P G_(upright(a)) P∥ lt.eq 1$, these facts give the bounds on $d_1$. Differentiating (5.10), (5.11), using transpose symmetry, gives the other derivative bounds: for example,
  $ partial_s e = 2 \( partial_s p_1 \)^top G_(upright(a)) p_1 + i tau sum_i partial_s \( a_i \( v_i \) \) n_i^2 . $
  The projection of $G_(upright(a)) p_1$ onto the support of $partial_s p_1$ is controlled by $d_1$. Thus arbitrarily large fixed components of $p_10$ cause no loss.
  For (5.14), an active profile in the triple is at least an inverse polynomial, by the box clearance from the support endpoints. If $∥d_1∥ gt.eq 1 \/ \( 2 sqrt(3) \)$, the first bound already supplies a fixed positive lower bound. Otherwise the corresponding physical coordinate of $\( - G_(upright(a)) p_1 \, 1 \)$ has modulus at least $1 \/ \( 2 sqrt(3) \)$, since $lr(|n_i|) = 1 \/ sqrt(3)$. Its artificial absorption supplies $tau \/ "poly" \( L \)$.
  For the integral bound, let $y = "Im" e$ and $V = "Im" \( s - e \)^(- 1) = y \/ lr(|s - e|)^2$. The first inequality of (5.15) follows from $y gt.eq ∥d_1∥^2$. If $e$ is independent of $s$, ordinary scalar shift integration gives $integral V lt.eq pi$; real poles are null sets. Otherwise $tau > 0$ and a probe is present. Combining (5.13), (5.14),
  $ lr(|partial_s e|) / sqrt(y) lt.eq C tau (1 / sqrt(y) + 1) lt.eq "poly" \( L \) . $
  The argument of $s - e$ lies in $\( - pi \, 0 \)$, and its derivative is
  $ frac(thin upright(d), thin upright(d) s) arg \( s - e \) = V - "Im" frac(partial_s e, s - e) . $
  The error is bounded by $"poly" \( L \) sqrt(V)$. Young’s inequality absorbs half the integral of $V$; the remaining constant and the phase variation are polynomially bounded on the bounded interval. This proves (5.15). ◻
]

=== 5.4 Weighted exceptions when the coupling is appreciable <weighted-exceptions-when-the-coupling-is-appreciable>

Put

$ D = max_(s \, t) ∥d_1 \( s \, t \)∥ \, #h(2em) alpha_0 = 1 / 100 . $

All maxima are taken over the closed box, which does not affect its conditional law. The bound $"Im" e gt.eq ∥d_1∥^2$ ties the width of the response to this coupling. When $D gt.eq eta^(alpha_0)$, we can isolate the few transverse parameters where the coupling becomes small and use the unweighted test bound elsewhere. The case where $D$ is small throughout the box will instead require comparing the length of each exceptional slice with its response width.

We first treat $D gt.eq eta^(alpha_0)$.

Suppose initially that $lr(|s - e|) gt.eq 1$ throughout the box. The maximum and minimum of this denominator are then comparable by a fixed factor. Indeed, (5.13), (5.13) show that $d_1$ varies by at most a fixed constant. If $D$ is large, then $"Im" e gt.eq c D^2$ throughout, whereas the variation of $s - e$ is at most $C \( 1 + D \)$. If $D$ is bounded, the same variation bound and the assumed lower bound one suffice. By (5.3), (5.8),

#[#set math.equation(numbering: n => "(5.16)")
 $ bb(E)_(s \, t) \[ W upright(bold(1))_(cal(E)_(b')) \] lt.eq "poly" \( L \) eta thin bb(E)_(s \, t) W . $ <imp:comparable-case>]

It remains to consider the case where $lr(|s - e|) < 1$ somewhere. At that point $∥d_1∥ < 1$; the derivative bounds then imply that $D$ is bounded throughout the box. Since $s$ is bounded, the same argument shows that $e$ and $s - e$ are bounded as well. Set

$ M_1 = max ∥N_1∥ \, #h(2em) B_1 = max lr(|beta|) . $

The bounded denominator and (5.3) give

#[#set math.equation(numbering: n => "(5.17)")
 $ bb(E)_(s \, t) W gt.eq c M_1^2 . $ <imp:weight-lower>]

Furthermore,

#[#set math.equation(numbering: n => "(5.18)")
 $ ∥∥ a + D B_1 lt.eq "poly" \( L \) M_1 . $ <imp:numerator-control>]

Here is the required quantitative argument. By the product estimate,

$ D B_1 lt.eq C max ∥d_1 beta∥ lt.eq C \( M_1 + ∥∥ a \) . $

Differentiate $N_1 = a \( s - e \) + d_1 beta$ in $s$ and use (5.4), (5.13), (5.13). As $D$ is bounded, this gives

$ ∥∥ a lt.eq C ell^(- 1) M_1 + C tau \( ∥∥ a + B_1 \) . $

Substitute the preceding estimate for $B_1$. Since $D gt.eq eta^(alpha_0)$, the coefficient $C tau \( 1 + D^(- 1) \)$ is less than one half for sufficiently large $L$ after $H$ is fixed. Absorption proves (5.18). Its polynomial exponent is independent of $H$.

Choose $Delta = eta^(1 \/ 8)$ and let

$ cal(A) = { t : min_s ∥d_1 \( s \, t \)∥ < Delta } . $

Then

#[#set math.equation(numbering: n => "(5.19)")
 $ bb(P)_t \( cal(A) \) lt.eq C Delta / D . $ <imp:affine-sublevel>]

To prove this, (5.10) and Ward show that $d_1 \( s \, t \)$ is within $C tau$ of an affine function of $t$, uniformly in $s$. Rescale the two $t$ intervals to unit intervals. If $cal(A)$ is nonempty, the affine function has a value of norm at most $Delta + C tau$, and its maximum norm is at least $D - C tau$. Project it by a real unit linear functional attaining that latter norm. Because $Delta \/ D arrow.r 0$ and $tau lt.double Delta$, one of the two scalar slopes has magnitude at least $c D$. Slicing in that coordinate bounds the fraction where the scalar magnitude is at most $Delta + C tau$ by $C Delta \/ D$. This includes $cal(A)$.

For each $t in cal(A)$, (5.12), (5.15) gives

$ bb(E)_s W lt.eq "poly" \( L \) \( ∥∥ a^2 + B_1^2 \) lt.eq "poly" \( L \) \( 1 + D^(- 2) \) M_1^2 . $

On the complement of $cal(A)$, absorption gives $lr(|s - e|) gt.eq ∥d_1∥^2 gt.eq Delta^2$, so $W lt.eq Delta^(- 4) M_1^2$. Using (5.8) there and (5.19) on $cal(A)$, we obtain

#[#set math.equation(numbering: n => "(5.20)")
 $ bb(E)_(s \, t) \[ W upright(bold(1))_(cal(E)_(b')) \] lt.eq "poly" \( L \) (Delta / D^3 + eta / Delta^4) bb(E)_(s \, t) W . $ <imp:first-case>]

We used the boundedness of $D$ and (5.17) in the last step. If $M_1 = 0$, all the weighted integrals vanish and the inequality holds directly. In particular, this argument never divides by a possibly zero expected weight. The powers in (5.20) satisfy

$ Delta / D^3 lt.eq eta^(1 \/ 8 - 3 alpha_0) \, #h(2em) eta / Delta^4 = eta^(1 \/ 2) \, #h(2em) 1 / 8 - 3 alpha_0 > 0 . $

=== 5.5 Weighted exceptions when the coupling is small <weighted-exceptions-when-the-coupling-is-small>

We now assume $D < eta^(alpha_0)$ and write $b' = r_j$ for the tested basis vector. Vary $t_j$ between two points separated by at least half its interval length. From (5.10), (5.11),

#[#set math.equation(numbering: n => "(5.21)")
 $ a_(b') := P G_(upright(a)) b' \, #h(2em) ∥a_(b')∥ lt.eq C ell^(- 1) \( D + tau \) . $ <imp:small-b>]

This can be made as small as a prescribed fixed constant by choosing $H$ sufficiently large, then $L$ sufficiently large. The inference uses variation over the whole $t_j$ interval; it does not assume that the exterior has a lower bound on its coupling.

Next delete $n$ in the actual matrix $G_eta^(- 1)$, without freezing its plane block. Let $G_(eta \, upright("rem"))$ denote the remaining inverse, put

$ d_(1 \, eta) = P G_(eta \, upright("rem")) p_1 \, $

and write $s - e_eta$ for its Schur denominator at $n$. Its off-diagonal column is exactly the same $p_1$ as before. The remaining matrices for $G_(upright(a))$ and $G_(eta \, upright("rem"))$ differ by a bounded matrix supported on $Q$. Moreover, $∥Q G_(eta \, upright("rem")) Q∥ lt.eq eta^(- 1)$ by Ward. Inverse difference and symmetry therefore give

#[#set math.equation(numbering: n => "(5.22)")
 $ eta lr(|b' ""^top G_(eta \, upright("rem")) b'|) & lt.eq C ∥a_(b')∥ \,\
lr(|b' ""^top d_(1 \, eta)|) & lt.eq lr(|b' ""^top d_1|) + C ∥a_(b')∥ ∥Q d_(1 \, eta)∥ . $ <imp:small-comparison-a>]

For clarity, the inverse identity used in both estimates is $G_(eta \, upright("rem")) = G_(upright(a)) + G_(upright(a)) Delta G_(eta \, upright("rem"))$, where $Delta = Q Delta Q$ has bounded norm. The first left factor is thus controlled by $P G_(upright(a)) b'$, regardless of the exterior norm.

Take the bound in (5.21) small enough that the first term in the Schur inverse formula cannot by itself cause $cal(E)_(b')$. On that exception,

#[#set math.equation(numbering: n => "(5.23)")
 $ frac(eta lr(|b' ""^top d_(1 \, eta)|)^2, lr(|s - e_eta|)) gt.eq c . $ <imp:exception-schur>]

On the other hand, absorption on the actual Schur extension yields

$ "Im" e_eta gt.eq eta ∥Q d_(1 \, eta)∥^2 . $

Together with (5.23), this implies $∥Q d_(1 \, eta)∥ lt.eq C lr(|b' ""^top d_(1 \, eta)|)$. Insert (5.22) and absorb its small last coefficient. We conclude that, on the exception,

#[#set math.equation(numbering: n => "(5.24)")
 $ ∥Q d_(1 \, eta)∥ lt.eq C ∥d_1∥ \, #h(2em) lr(|s - e_eta|) lt.eq C eta ∥d_1∥^2 . $ <imp:small-exception>]

The exceptional set is short on every almost-everywhere $s$ slice. To establish this rigorously, let $D_t = max_s ∥d_1 \( s \, t \)∥$. Differentiating the actual Schur formula shows that, on the exception,

$ lr(|partial_s e_eta|) lt.eq C ∥Q d_(1 \, eta)∥^2 + C tau \( 1 + ∥Q d_(1 \, eta)∥ \) lt.eq C D^2 + C tau \( 1 + D \) < 1 / 2 . $

The first term comes from the real derivative of the tested plane block. Its artificial derivative is absorbed in the same bound; the mixed and missing-direction derivatives give the terms containing $tau$. Thus $"Re" \( s - e_eta \)$ has derivative at least one half on the exception.

There are only boundedly many components of that exceptional slice away from poles. Indeed, with all other variables fixed, the matrix varies polynomially only on the three coordinates of the tested triple. In a basis containing those coordinates, expansion of the determinant uses variable factors from at most three rows. Its degree, and the degrees of the relevant cofactors, are bounded by a constant depending only on the profile degree, not on the dimension or norm of the exterior. The same assertion holds after deleting $n$. Clearing the squared absolute value of a denominator converts (5.6) into a real polynomial inequality of bounded degree. Such a set has a bounded number of intervals and isolated points, except for poles, which also have bounded number on an almost-everywhere slice.

On each interval component, (5.24) confines $"Re" \( s - e_eta \)$ to an interval of length $C eta D_t^2$, while its derivative is at least one half. Summing over the bounded number of components gives

#[#set math.equation(numbering: n => "(5.25)")
 $ lr(|{ s : \( s \, t \) in cal(E)_(b') }|) lt.eq C eta D_t^2 . $ <imp:slice-length>]

If $D_t = 0$, (5.24) and the Schur formula rule out the exception off its null set of poles.

For $D_t > 0$, the denominator of the modified weight has a matching minimum scale:

#[#set math.equation(numbering: n => "(5.26)")
 $ "Im" e \( s \, t \) gt.eq c D_t^2 quad upright("throughout the slice") \, #h(2em) lr(|partial_s \( s - e \)|) lt.eq C . $ <imp:linewidth>]

Here is the point requiring the artificial-absorption floor. By (5.13), the oscillation of $d_1$ on the slice is $O \( tau \)$. If its norm is everywhere at least $D_t \/ 2$, absorption proves the first bound immediately. Otherwise $D_t lt.eq C tau$. In this latter case an artificial term must be present, since without one $d_1$ is independent of $s$. Now (5.14) gives $"Im" e gt.eq tau \/ "poly" \( L \) gt.eq c D_t^2$ for sufficiently large $L$. The derivative bound follows from (5.13) and $D < eta^(alpha_0)$.

The exceptional length $O \( eta D_t^2 \)$ must be compared with the resolution $min \( ell \, D_t^2 \)$ supplied by the modified denominator. The real parts of the two Schur denominators need not vanish at the same point. Apply 14 to $N_1$ and $s - e$, using (5.26). It gives

$ max_s W \( s \, t \) lt.eq frac(C, min \( ell \, D_t^2 \)) integral W \( s \, t \) thin thin upright(d) s . $

Combining with (5.25),

$ integral W \( s \, t \) upright(bold(1))_(cal(E)_(b')) thin thin upright(d) s lt.eq frac(C eta D_t^2, min \( ell \, D_t^2 \)) integral W \( s \, t \) thin thin upright(d) s lt.eq "poly" \( L \) eta integral W \( s \, t \) thin thin upright(d) s . $

The last inequality uses $D_t lt.eq D < 1$ and the inverse-polynomial lower bound on $ell$. Averaging over $t$ proves

#[#set math.equation(numbering: n => "(5.27)")
 $ bb(E)_(s \, t) \[ W upright(bold(1))_(cal(E)_(b')) \] lt.eq "poly" \( L \) eta thin bb(E)_(s \, t) W $ <imp:second-case>]

in the small-coupling case. This estimate remains uniform as the coupling vanishes; no positive lower bound for $D$ was used here.

=== 5.6 Restoring the side shift <restoring-the-side-shift>

We now choose the parameters. All polynomial losses in (5.16), (5.20), (5.27), and the box width exponent, have been fixed independently of $H$. Choose $H$ large enough that their products with

$ eta^(1 \/ 8 - 3 alpha_0) \, #h(2em) eta^(1 \/ 2) \, #h(2em) eta $

tend to zero, and that (5.21) is uniformly small in its case. With this $H$ fixed, take $L$ sufficiently large that $tau lt.double Delta$, $tau \/ eta^(alpha_0) lt.double 1$, and all preceding absorptions are valid. The assumption $tau lt.eq e^(- c_(*) L)$ ensures every one of these requirements for any fixed $c_(*) > 0$.

For each of the eight tests, condition on the other corner variables, apply the appropriate estimate, and compare $W$ with the same weight $w_0$ by (5.9). Integration and summation give

#[#set math.equation(numbering: n => "(5.28)")
 $ bb(E) \[ w_0 upright(bold(1))_(cal(G)) \] gt.eq 3 / 4 bb(E) w_0 \, #h(2em) cal(G) = ⋂_(b') cal(E)_(b')^c \, $ <imp:weighted-Qgood>]

for sufficiently large $L$. This is still conditional on the independent side uniforms. The threshold can be chosen uniformly in those frozen values and in all exterior data. Zero conditional weights cause no difficulty, since every estimate was an inequality between integrals.

Fix data in $cal(G)$, before restoring the common side shift. On the space $P$ consider the rational matrix function

$ F \( z \) = P \( cal(T)_0 + z P_0 \)^(- 1) P \, #h(2em) "Im" z < 0 . $

It is analytic there and has nonnegative imaginary part. To check analyticity, a kernel at one point of the lower half-plane would be annihilated by $P_0$ and by $cal(T)_0$, hence would also be a kernel at $z = - i$, where the inverse exists. On $cal(G)$, (5.7) bounds the $Q \, Q$ block of $F \( - i \)$ by $eta^(- 1)$. Ward gives a bound one on the $P_0 \, P_0$ block and

$ ∥P_0 \( cal(T)_0 - i P_0 \)^(- 1) Q∥^2 lt.eq ∥Q "Im" \( cal(T)_0 - i P_0 \)^(- 1) Q∥ lt.eq eta^(- 1) . $

Transpose symmetry gives the same bound on the other mixed block. Thus

#[#set math.equation(numbering: n => "(5.29)")
 $ ∥F \( - i \)∥ lt.eq C eta^(- 1) . $ <imp:center-bound>]

For completeness, map the unit disk to the lower half-plane by $z = - i \( 1 + w \) \/ \( 1 - w \)$. Then $- i F \( z \( w \) \)$ has positive semidefinite Hermitian real part, and its value at zero obeys (5.29). The positive-real-part weak estimate (3.13) gives a boundary weak-$L^1$ bound at most $C \( "rank" P \) eta^(- 1)$. One can obtain this bound directly from the positive matrix measure in its Herglotz representation: its total trace mass is at most $\( "rank" P \) ∥F \( - i \)∥$, while the constant imaginary part has the same polynomial bound. The boundary change of variable sends Haar measure to $thin upright(d) x \/ \( pi \( 1 + x^2 \) \)$.

The Cauchy density has a positive lower bound on the fixed interval $\[ - h \/ 4 \, h \/ 4 \]$. Therefore there is a polynomial $R_L = C \( 1 + L \)^C$, now allowed to depend on $H$, such that for at least half the common side shifts $x$ in their prescribed uniform law,

#[#set math.equation(numbering: n => "(5.30)")
 $ ∥P \( cal(T)_0 + x P_0 \)^(- 1) P∥ lt.eq R_L . $ <imp:side-good>]

This conclusion uses only the norm at $- i$, not the norm of $T$.

Restore the artificial absorptions at the single side sites. Their change has norm at most $tau$ and is supported on $P_0$. For a shift satisfying (5.30), the inverse difference identity on $P$ and a Neumann series give

$ ∥P cal(T)^(- 1) P∥ lt.eq 2 R_L $

as soon as $tau R_L lt.eq 1 \/ 2$. This holds for sufficiently large $L$. Throughout the common-shift average, with or without these side absorptions, 12 compares the weight to $w_0$ by fixed factors. Hence at least a fixed fraction of the $rho$-weight survives the good shifts for every corner setting in $cal(G)$. Integrate this statement, use (5.28), and finally average over the initially frozen independent side uniforms. Since $bb(E) rho$ and $bb(E) w_0$ are comparable, this proves (5.2). The pointwise comparison assertion in 11 is already contained in 12. $square.stroked.tiny$

=== 5.7 The Schur form used by the interior <the-schur-form-used-by-the-interior>

The following formulation makes the interface with the transmission calculation explicit.

#thm([Corollary 5.6.])[
  (Eliminating the missing directions).  #emph[Let $N = upright(bold(1)) - P$ on the boundary space. Almost everywhere in the boundary law, the $N \, N$ block of $cal(T)$ is invertible. Define its Schur matrix and transformed source by 
$ hat(T) & = P cal(T) P - P cal(T) N \( N cal(T) N \)^(- 1) N cal(T) P \,\
hat(k) & = P k - P cal(T) N \( N cal(T) N \)^(- 1) N k . $

 Then $hat(T)$ is complex symmetric and passive, and 
$ hat(T)^(- 1) & = P cal(T)^(- 1) P \,\
hat(k) & = hat(T) P cal(T)^(- 1) k \,\
P \( cal(T) - i P \)^(- 1) k & = \( hat(T) - i upright(bold(1))_P \)^(- 1) hat(k) . $

 In particular $rho = ∥\( hat(T) - i upright(bold(1))_P \)^(- 1) hat(k)∥^2$, and (5.2) controls $hat(T)^(- 1)$ on a set carrying a fixed fraction of this weight.]
] <imp:schur-interface>

#proof[
  On the four-dimensional space $N$, the Hermitian real part is a fixed real symmetric matrix plus the four common corner shifts on its diagonal; the traceless box directions have zero diagonal entry there. Its determinant is a nonzero polynomial, so the block is invertible almost everywhere by passivity and the density of those shifts. The identities are the block inverse and source elimination formulas. Symmetry and passivity persist under Schur elimination by 2. ◻
]

== 6 Transmission through a cell <sec:transmission>

Throughout this section, the geometry and branch parameters are those of Lemma 4.1, Lemma 4.2, Proposition 4.3. Constants may depend on the fixed energy, disorder, profile, corner-box exponents, and parameters already chosen, but not on exterior matrices or source vectors. A polynomial bound means $C \( 1 + L \)^C$ with this convention; different occurrences may have different exponents. All assertions concern sufficiently large $L$ after the parameters have been fixed.

=== 6.1 Exterior data and the two branch estimates <exterior-data-and-the-two-branch-estimates>

Suppose that the root is the only cell port in $V union B$, and that the source port lies outside this set. Artificial probes with a prescribed mask may be present. Eliminate the exterior physical sites. Its effect on $B$ is a fixed complex-symmetric passive matrix $T$, and the source gives a fixed vector $k$, including its input multiplier. The remaining boundary matrix is

$ cal(T) = T + "diag"_B #scale(x: 120%, y: 120%)[\(] v_i - i tau a_i \( v_i \) #scale(x: 120%, y: 120%)[\)] . $

The exterior is held fixed throughout the cell integration, as are the four corner boxes. In particular, no bound on $∥T∥$ or $∥k∥$ is assumed.

Let $P$ also denote its range, equipped with a real orthonormal basis. Eliminating the four missing boundary directions gives

#[#set math.equation(numbering: n => "(6.1)")
 $ hat(T) = \( P cal(T)^(- 1) P \)^(- 1) \, #h(2em) hat(k) = hat(T) P cal(T)^(- 1) k \, #h(2em) k_(*) = \( hat(T) - i I_P \)^(- 1) hat(k) \, #h(2em) rho = ∥k_(*)∥^2 . $ <trans:normalization>]

These formulas are used at their almost-everywhere inverses. The missing-direction block is generically invertible by 16. Schur complementation preserves symmetry and passivity, and gives the identity

$ k_(*) = P \( cal(T) - i P \)^(- 1) k . $

Thus $rho$ is exactly the weight in 11, and

#[#set math.equation(numbering: n => "(6.2)")
 $ ∥\( hat(T) - i I_P \)^(- 1)∥ lt.eq 1 . $ <trans:absorbed-exterior>]

Hereafter $M$ is restricted to $P$, and is extended by a zero row at the root when it is regarded as a map into $V$.

Let $G$ be the inverse on $V xor P$ with the root open, reference potential $c \( v \)$, and root strength $sigma = epsilon.alt^2$. Its internal artificial absorptions are constant during the branch integration: the true values lie on the plateau specified in 10. Set

#[#set math.equation(numbering: n => "(6.3)")
 $ u = sqrt(sigma) thin G e_0 \, #h(2em) g = sigma G_00 \, #h(2em) t = hat(k)^top u_P . $ <trans:amplitude>]

Since $k$ includes the source input multiplier, the root-to-source scattering amplitude satisfies $lr(|S_(upright("source") \, a)|)^2 = 4 lr(||) t^2$. The sign convention for the source does not affect this identity. The inverse exists almost everywhere even though $c \( v \)$ depends on other potentials. Indeed, absorption forces a kernel vector to vanish at the root. Restoring its true real diagonal therefore preserves that vector. After eliminating the fixed boundary data, the real part is a fixed matrix plus the true real diagonals on $V$; their absolutely continuous joint law makes its determinant nonzero almost everywhere. This also justifies the almost-everywhere slices used below.

#thm([Proposition 6.1.])[
  (Branch transmission).  #emph[Choose the branch parameters in the order described below and fix $c_(*) > 2 nu$. For $0 lt.eq tau lt.eq e^(- c_(*) L)$, uniformly in the fixed exterior data and allowed corner boxes, 
#[#set math.equation(numbering: n => "(6.4)")
 $ bb(E) lr(|t|)^2 & gt.eq e^(- C \( log L \)^2) thin bb(E)_B rho \,\
bb(E) #scale(x: 120%, y: 120%)[\[] lr(|mu|) thin lr(|t|)^2 #scale(x: 120%, y: 120%)[\]] & lt.eq e^(- c L) thin bb(E) lr(|t|)^2 . $ <trans:lower>]

 Here $mu$ is the conditional single-root closure coefficient of Lemma 3.2, Lemma 3.4. The expectation is the branch expectation, and $bb(E)_B$ averages its boundary law. The hidden root value has already been averaged in $mu$; averaging it again does not change any other quantity in these formulas.]
] <trans:cell>

=== 6.2 The cutoff error and the small-response region <the-cutoff-error-and-the-small-response-region>

We first derive (6.4) assuming (6.4). Fix the boundary data and all jitters, and vary the common real shift $r$ on $Z^(+)$. Write $P_(+)$ for the coordinate projection onto $Z^(+)$, extended by zero on the root and on $P$. Since $c \( v \) = E + p^top A^(- 1) p$ and $A' = P_(+)$ on $J$, differentiation gives

#[#set math.equation(numbering: n => "(6.5)")
 $ c' = - ∥P_(+) A^(- 1) p∥^2 \, #h(2em) g' = - u^top P_(+) u - sigma^(- 1) c' g^2 . $ <trans:shift-derivatives>]

The profile estimate in (4.23), together with $lr(|psi_i|) lt.eq C epsilon.alt$ on $Z^(+)$, implies $lr(|c'|) \/ sigma lt.eq C \( 1 + L \)^C$. Root absorption and 2 imply

#[#set math.equation(numbering: n => "(6.6)")
 $ lr(||) g^2 lt.eq "Im" g lt.eq 1 . $ <trans:g-ward>]

Let $I_r = \[ - L^(- D_1) \, L^(- D_1) \]$. The derivative of a continuous determinant phase of $G^(- 1)$ is

$ Phi' \( r \) = "tr" \( P_(+) "Im" G P_(+) \) + c' / sigma "Im" g . $

The phase has range at most $pi dim \( V xor P \)$ after strict regularization. Integrating, using (6.6), and then removing the regularization as in 7 gives

#[#set math.equation(numbering: n => "(6.7)")
 $ integral_(I_r) "tr" \( P_(+) "Im" G P_(+) \) thin thin upright(d) r lt.eq C \( 1 + L \)^C . $ <trans:phase-trace>]

In particular, Ward and symmetry bound the integral of $∥P_(+) u∥^2$ by the same polynomial. We need an additional factor when $g$ is small.

Put $D = - "Im" G^(- 1)$. Complex symmetry makes $D$ real symmetric and gives

$ u - overline(u) = 2 i G^(*) D u \, #h(2em) u^(*) D u = "Im" g . $

For each coordinate, Cauchy–Schwarz in the form $D$ bounds the square of the corresponding entry of $G^(*) D u$ by $\( "Im" G \)_(i i) "Im" g$. Consequently, with entrywise imaginary part on vectors,

#[#set math.equation(numbering: n => "(6.8)")
 $ ∥P_(+) "Im" u∥^2 lt.eq \( "Im" g \) "tr" \( P_(+) "Im" G P_(+) \) . $ <trans:imaginary-vector>]

Take $q = sqrt(sigma) = epsilon.alt$, and set $Omega_q = { r in I_r : lr(|g \( r \)|) lt.eq q }$, excluding null singular sets. (6.7), (6.8) give

$ integral_(Omega_q) ∥P_(+) "Im" u∥^2 thin thin upright(d) r lt.eq C \( 1 + L \)^C q . $

There are only polynomially many component intervals of $Omega_q$. To see this, $A$ is affine in $r$, $c$ is a rational function obtained by inverting $A$, and $G$ is a further matrix inverse in cell dimension $O \( L^2 \)$. Thus numerator and denominator degrees of $g$ are bounded by a fixed polynomial in $L$. The inequality $lr(||) g^2 lt.eq q^2$ becomes a real polynomial inequality after clearing the squared denominator. Its intervals and the poles are therefore polynomially many; the values of the exterior coefficients do not affect this degree bound. Integrate the real part of (6.5) on these intervals, first truncating away from any endpoints where necessary. Every endpoint value of $"Re" g$ has modulus at most $q$. Hence

$ integral_(Omega_q) "Re" \( u^top P_(+) u \) thin thin upright(d) r lt.eq C \( 1 + L \)^C q + C \( 1 + L \)^C q^2 lr(|I_r|) . $

Using $∥P_(+) u∥^2 = "Re" \( u^top P_(+) u \) + 2 ∥P_(+) "Im" u∥^2$, we obtain

#[#set math.equation(numbering: n => "(6.9)")
 $ integral_(Omega_q) ∥P_(+) u∥^2 thin thin upright(d) r lt.eq C \( 1 + L \)^C q . $ <trans:small-response>]

Normalized uniform integration in $r$ only introduces the polynomial factor $\( 2 L^(- D_1) \)^(- 1)$.

The $Z$ rows of the equation $G^(- 1) u = sqrt(sigma) e_0$ involve only $u_P$ and $P_(+) u$. Their coefficients are uniformly bounded, and $M$ is bounded below on $P$. The $P$ rows then give, respectively,

$ ∥u_P∥ lt.eq C ∥P_(+) u∥ \, #h(2em) hat(T) u_P = - M^top u_J \, #h(2em) ∥hat(T) u_P∥ lt.eq C ∥P_(+) u∥ . $

It follows from symmetry and (6.1) that

#[#set math.equation(numbering: n => "(6.10)")
 $ lr(||) t = lr(|k_(*)^top \( hat(T) - i I_P \) u_P|) lt.eq C sqrt(rho) thin ∥P_(+) u∥ . $ <trans:source-control>]

The cutoff bounds in 5 now yield

#[#set math.equation(numbering: n => "(6.11)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] lr(|mu|) thin lr(||) t^2 #scale(x: 120%, y: 120%)[\]] lt.eq C q bb(E) lr(||) t^2 + C \( 1 + L \)^C q bb(E)_B rho . $ <trans:relative-prelower>]

The first term treats $lr(||) g > q$; the second follows from (6.9), (6.10) on $Omega_q$. Since $q = e^(- nu L)$, substitution of (6.4) absorbs the factor $e^(C \( log L \)^2)$ and proves (6.4) for some fixed $c > 0$.

=== 6.3 Regular boundary and shift data <regular-boundary-and-shift-data>

We turn to (6.4). By 11, it is enough to work on boundary data satisfying

#[#set math.equation(numbering: n => "(6.12)")
 $ ∥hat(T)^(- 1)∥ lt.eq C \( 1 + L \)^C \, $ <trans:good-boundary>]

since this event carries a fixed positive fraction of $bb(E)_B rho$. Fix such data, assume $rho > 0$, and initially set every jitter to zero. Define the boundary Schur matrix

$ cal(B) = hat(T) - M^top A^(- 1) M . $

We claim that at least half of the uniform $r$-interval satisfies

#[#set math.equation(numbering: n => "(6.13)")
 $ ∥cal(B)^(- 1)∥ lt.eq C \( 1 + L \)^C . $ <trans:regular-r>]

All exponents in this assertion can be fixed before $D_2 \, D_3$.

Indeed,

$ cal(B)' = M^top A^(- 1) P_(+) A^(- 1) M gt.eq c I_P . $

For the last inequality, put $w = A^(- 1) M x$. The $Z$ rows of $A w = M x$ have bounded coefficients, use only $P_(+) w$, and give $∥M x∥ lt.eq C ∥P_(+) w∥$. The lower singular-value bound for $M$ gives $∥P_(+) w∥ gt.eq c ∥∥ x$, which proves the assertion. For $xi > 0$ let $K_xi = \( cal(B) - i xi I_P \)^(- 1)$. If $∥cal(B)^(- 1)∥ > xi^(- 1)$, inverse difference implies $∥K_xi∥ gt.eq \( 2 xi \)^(- 1)$. Ward then implies

#[#set math.equation(numbering: n => "(6.14)")
 $ xi "tr" "Im" K_xi gt.eq 1 / 4 . $ <trans:regular-test>]

The same conclusion follows at a singular matrix from a null vector. The determinant phase derivative of $cal(B) - i xi I_P$ is at least $c "tr" "Im" K_xi$. Thus phase integration bounds the Lebesgue measure of the failed event in (6.13) by $C xi dim P$. Dividing by $2 L^(- D_1)$ and choosing $xi$ to be a sufficiently small inverse polynomial proves the claim. The only dependence on the exterior here is through coefficients of a passive matrix; its norm never enters.

For regular zero-jitter data, omit both the root and artificial absorption in $J$, and write

#[#set math.equation(numbering: n => "(6.15)")
 $ R_0 = mat(delim: "(", A, M; M^top, hat(T))^(- 1) \, #h(2em) Gamma = \( R_0 \)_(J J) \, #h(2em) z_0 = \( R_0 \)_(J P) hat(k) \, #h(2em) U_0 = Gamma p \/ epsilon.alt . $ <trans:rootless-fields>]

The subscript $0$ denotes the absence of internal artificial absorption; the boundary matrix $hat(T)$ is unchanged. These definitions will also be used after the jitters have been varied. The field $z_0$ is the response in $J$ to the exterior source. Define its normalized coupling to the root by

$ F_0 = p^top z_0 \/ epsilon.alt . $

If we adjoin the calibrated open root, still omitting the artificial absorptions on $V$, block inversion gives the analogue of $t$ for this auxiliary system:

$ - frac(F_0, \( c \( v \) - E - i sigma - p^top Gamma p \) \/ sigma) . $

The prescribed internal absorptions will be restored below. We first obtain a lower bound for this numerator using the shell jitters, then control the denominator. A diagonal change at a site $j$ changes $F_0$ through the product $\( U_0 \)_j \( z_0 \)_j$. We will find a source component near the boundary and a large component of $U_0$ at logarithmic depth, and use the jitters to propagate the source component to that deeper site.

Block inversion through $A$ and $cal(B)$ gives polynomial bounds on $R_0$ and $Gamma$. Moreover,

#[#set math.equation(numbering: n => "(6.16)")
 $ Gamma^(- 1) = A - M hat(T)^(- 1) M^top $ <trans:gamma-inverse>]

has polynomial norm by (6.12).

The source normalization requires some care because $hat(k)$ and $hat(T)$ need not be bounded. Put $C_(upright("ext")) = hat(T) - i I_P$, $Delta = cal(B) - C_(upright("ext")) = i I_P - M^top A^(- 1) M$, and $b_0 = cal(B)^(- 1) hat(k)$. The identities

#[#set math.equation(numbering: n => "(6.17)")
 $ b_0 = \( I_P - cal(B)^(- 1) Delta \) k_(*) \, #h(2em) k_(*) = \( I_P + C_(upright("ext"))^(- 1) Delta \) b_0 $ <trans:source-comparison>]

use only polynomially bounded $Delta \, cal(B)^(- 1)$ and the norm bound (6.2). Consequently,

#[#set math.equation(numbering: n => "(6.18)")
 $ \( 1 + L \)^(- C) sqrt(rho) lt.eq ∥b_0∥ lt.eq C \( 1 + L \)^C sqrt(rho) \, #h(2em) ∥z_0∥ lt.eq C \( 1 + L \)^C sqrt(rho) . $ <trans:source-size>]

Since $A z_0 = - M b_0$, the sparse $Z$ rows also imply $∥P_(+) z_0∥ gt.eq c ∥b_0∥$. There is therefore a site $j_0 in Z^(+)$ with

#[#set math.equation(numbering: n => "(6.19)")
 $ lr(|\( z_0 \)_(j_0)|) gt.eq \( 1 + L \)^(- C) sqrt(rho) . $ <trans:initial-component>]

The other field has the representation

#[#set math.equation(numbering: n => "(6.20)")
 $ U_0 = frac(A^(- 1) p, epsilon.alt) + A^(- 1) M cal(B)^(- 1) frac(M^top A^(- 1) p, epsilon.alt) . $ <trans:reflected-field>]

The profile estimate and $lr(|psi_i|) lt.eq C epsilon.alt$ on $Z$ show $∥M^top A^(- 1) p∥ lt.eq C \( 1 + L \)^C epsilon.alt$. Thus the reflected term in (6.20) has polynomial norm, with exponent fixed independently of $D_2$. At depth $d = floor.l D_2 log L floor.r$, the profile has

$ lr(|psi_i|) / epsilon.alt gt.eq c e^(nu d) gt.eq c' L^(nu D_2) . $

Choose $D_2$ large enough that this exceeds both the reflected term and the profile error in units of $epsilon.alt$, with fixed slack. Every site $i$ at that depth then satisfies

#[#set math.equation(numbering: n => "(6.21)")
 $ lr(|\( U_0 \)_i|) gt.eq 2 . $ <trans:terminal-field>]

=== 6.4 A path of resolvent entries <a-path-of-resolvent-entries>

Join $j_0$ to a site at depth $d$ by a physical nearest-neighbor path of length $O \( 1 + log L \)$ in $J$, moving inward by decreasing absolute coordinates. The corner clipping guarantees that the path can avoid $Z$ after its first vertex. For each successive pair $y \, j$, with $j in.not Z$, (6.16) gives

$ \( Gamma^(- 1) \)_(y j) = 1 . $

We next replace this physical edge by a uniformly bounded number of large entries of $Gamma$. This replacement is needed because $Gamma$ need not be spatially local.

Write $B_Gamma = Gamma^(- 1)$, $n_J = lr(||) J$, and $K_Gamma = max \( 1 \, ∥B_Gamma∥ \)$. Let

$ S_y = "supp" \( B_Gamma e_y \) \, #h(2em) S_j = "supp" \( B_Gamma e_j \) \, #h(2em) delta_Gamma = \( 2 n_J K_Gamma^2 \)^(- 1) . $

Form the undirected graph on $S_y union S_j$ with an edge between $a in S_y$ and $b in S_j$ whenever $lr(|Gamma_(a b)|) gt.eq delta_Gamma$. The endpoints $y \, j$ belong to this vertex set because $\( B_Gamma \)_(y j) = 1$. If they were not connected, let $F$ be the diagonal indicator of the component of $y$, extended by zero outside the graph. The inverse commutator identity would give

$ 1 & = lr(|\[ F \, B_Gamma \]_(y j)|) = lr(|\( B_Gamma \[ F \, Gamma \] B_Gamma \)_(y j)|)\
 & lt.eq delta_Gamma ∥\( B_Gamma \)_(y \, :)∥_1 ∥\( B_Gamma \)_(: \, j)∥_1 lt.eq delta_Gamma n_J K_Gamma^2 = 1 / 2 . $

Indeed every nonzero summand with $F_(a a) eq.not F_(b b)$ must cross components, so its $Gamma$ entry is below threshold. This contradiction proves connectivity.

Every graph edge meets $S_j$, which consists of $j$ and at most its four physical neighbors: $j in.not Z$ makes the nonlocal term in (6.16) vanish in its column. Thus $S_j$ is a vertex cover of size at most five. A simple connecting path has at most ten edges, since a simple path with no two successive vertices outside a set of size five has at most eleven vertices. The other support $S_y$ lies in the physical star of $y$ together with $Z$. All these vertices lie in the shell $L - lr(||) i_oo lt.eq D_2 log L + 5$; the fixed buffer accommodates the physical stars.

Concatenate the paths for the physical edges and erase loops. We obtain distinct sites

#[#set math.equation(numbering: n => "(6.22)")
 $ j_0 \, j_1 \, dots.h \, j_s \, #h(2em) s lt.eq C \( 1 + log L \) \, #h(2em) lr(|Gamma_(j_a j_(a + 1))|) gt.eq \( 1 + L \)^(- C) \, $ <trans:resolvent-path>]

all carrying shell jitters, with $j_s$ at depth $d$. Fixed tie rules make all choices measurable functions of the regular zero-jitter data alone.

=== 6.5 Propagation by the independent jitters <propagation-by-the-independent-jitters>

Choose $D_3$ sufficiently large after $D_2$. For every allowed simultaneous jitter perturbation, its diagonal operator norm is at most $L^(- D_3)$. Inverse difference applied to $R_0$ therefore preserves its polynomial norm, the bounds for $Gamma^(- 1)$, and the path-edge lower bounds, with constant-factor slack. In particular, if superscripts denote perturbed and zero-jitter values, then

$ z_0^(upright("new")) - z_0^(upright("old")) = - Gamma^(upright("new")) Delta_J z_0^(upright("old")) \, $

where $Delta_J$ is the jitter diagonal. (6.18), (6.19) show that the norm and starting-component bounds also retain constant-factor slack. The terminal bound retains, say, $lr(|\( U_0 \)_(j_s)|) gt.eq 1$ throughout these perturbations. For this last assertion use (6.20) and the uniform profile estimate again: the large total size of $U_0$ is not controlled by an additive small-perturbation argument.

Condition on all nonpath jitters. Expose the path jitters successively, setting unexposed ones to zero only in the intermediate calculations. Let $w = L^(- D_3)$ be their common half-width. At step $a < s$, changing the diagonal at $j_a$ by $zeta in \[ - w \, w \]$ gives the exact rank-one formula

#[#set math.equation(numbering: n => "(6.23)")
 $ \( z_0^(upright("new")) \)_(j_(a + 1)) = \( z_0 \)_(j_(a + 1)) - frac(Gamma_(j_(a + 1) j_a) \( z_0 \)_(j_a) zeta, 1 + Gamma_(j_a j_a) zeta) . $ <trans:jitter-update>]

Values on the right refer to the state just before this update. The denominator has modulus between $1 \/ 2$ and $3 \/ 2$ after increasing $D_3$ if necessary. For $zeta in \[ - w \, - w \/ 2 \]$ and $zeta' in \[ w \/ 2 \, w \]$, the two values on the right differ by

$ lr(|Gamma_(j_(a + 1) j_a) \( z_0 \)_(j_a)|) frac(lr(|zeta - zeta'|), lr(|1 + Gamma_(j_a j_a) zeta|) lr(|1 + Gamma_(j_a j_a) zeta'|)) gt.eq c w \( 1 + L \)^(- C) lr(|\( z_0 \)_(j_a)|) . $

If one of the two intervals contains a value below one quarter of this separation in modulus, every value in the other interval is above that threshold. If it contains no such value, that interval itself is successful. Hence the conditional success probability is at least $1 \/ 4$, and success gives

#[#set math.equation(numbering: n => "(6.24)")
 $ lr(|\( z_0^(upright("new")) \)_(j_(a + 1))|) gt.eq \( 1 + L \)^(- C) lr(|\( z_0 \)_(j_a)|) . $ <trans:jitter-gain>]

Constants and the exponent here include the fixed $D_3$.

Finally expose the jitter at $j_s$. Applied to the scalar $F_0$, the update is

$ F_0^(upright("new")) = F_0 - frac(\( U_0 \)_(j_s) \( z_0 \)_(j_s) zeta, 1 + Gamma_(j_s j_s) zeta) . $

Since $lr(|\( U_0 \)_(j_s)|) gt.eq 1$, the same two-interval argument gives a final success of probability at least $1 \/ 4$ and size at least $\( 1 + L \)^(- C) lr(|\( z_0 \)_(j_s)|)$. Only the current component is used at each step; later jitters need not preserve previously propagated components. There are $O \( 1 + log L \)$ updates, all at distinct sites and hence using independent uniforms. Combining (6.19), (6.24), we conclude that

#[#set math.equation(numbering: n => "(6.25)")
 $ bb(P)_(upright("jitters")) {lr(|p^top z_0 \/ epsilon.alt|) gt.eq e^(- C \( log L \)^2) sqrt(rho)} gt.eq e^(- C \( 1 + log L \)) . $ <trans:jitter-success>]

This holds conditionally on every regular zero-jitter boundary and $r$ datum, and uniformly after conditioning on nonpath jitters.

=== 6.6 Restoring absorption and the root <restoring-absorption-and-the-root>

Reinsert the prescribed artificial absorptions in $J$. If their diagonal is $tau A_(upright("art"))$, with $0 lt.eq A_(upright("art")) lt.eq I_J$, the rootless inverse becomes

$ R_tau = (R_0^(- 1) - i tau mat(delim: "(", A_(upright("art")), 0; 0, 0))^(- 1) . $

Write $Gamma_tau = \( R_tau \)_(J J)$ and $z_tau = \( R_tau \)_(J P) hat(k)$. Inverse difference and the polynomial bounds already established give

#[#set math.equation(numbering: n => "(6.26)")
 $ ∥Gamma_tau - Gamma∥ lt.eq tau C \( 1 + L \)^C \, #h(2em) ∥z_tau - z_0∥ lt.eq tau C \( 1 + L \)^C sqrt(rho) . $ <trans:absorption-errors>]

Thus the error in $p^top z_0 \/ epsilon.alt$ is at most $epsilon.alt^(- 1) tau C \( 1 + L \)^C sqrt(rho)$.

Now restore the open root. Its scalar Schur denominator is

$ d = c \( v \) - E - i sigma - i tau a_0 - p^top Gamma_tau p . $

For the auxiliary system with internal artificial absorptions omitted, the calibration and block formula for $Gamma$ give

#[#set math.equation(numbering: n => "(6.27)")
 $ frac(c \( v \) - E - i sigma - p^top Gamma p, sigma) = - i - frac(p^top A^(- 1) M cal(B)^(- 1) M^top A^(- 1) p, sigma) . $ <trans:root-denominator>]

The boundary profile estimate gives $∥M^top A^(- 1) p∥ lt.eq C \( 1 + L \)^C epsilon.alt$, and hence the second term is polynomially bounded. Reinstating absorption changes the normalized denominator by at most $sigma^(- 1) tau C \( 1 + L \)^C$, including the absorption at the root. Because $c_(*) > 2 nu$, this is small for large $L$. We have therefore proved, uniformly on all the data being used,

$ lr(|d \/ sigma|) lt.eq C \( 1 + L \)^C . $

Passivity and the open root also give $- "Im" d gt.eq sigma$, so this denominator is nonzero.

Block inversion now identifies the amplitude, with an irrelevant sign, as

#[#set math.equation(numbering: n => "(6.28)")
 $ t = - frac(p^top z_tau \/ epsilon.alt, d \/ sigma) . $ <trans:final-root-amplitude>]

The numerator error in (6.26) is exponentially smaller than the successful lower bound in (6.25). The polynomial denominator and the success probability can therefore be incorporated into $e^(- C \( log L \)^2)$. For each good boundary datum, integration over the regular $r$ event, of probability at least $1 \/ 2$, and then all jitters gives

$ bb(E)_(r \, upright("jitters")) lr(||) t^2 gt.eq e^(- C \( log L \)^2) rho . $

When $rho = 0$, invertibility in (6.1) gives $hat(k) = 0$, and the inequality is immediate. Finally integrate over the weighted good boundary event from 11. This proves (6.4) and completes the proof of 17.

For clarity, the choices above have no circular dependence. First fix the profile and its plateau, the box-width exponents, and $D_1$ as in 10. The polynomial in 11, the regular zero-jitter inverse thresholds, and the exponents for the profile residual and reflected field can then be fixed without $D_2 \, D_3$. Choose $D_2$ to obtain the profile height in (6.21). Choose $D_3$ afterwards to guarantee the profile estimates and all the perturbation margins used above. The constants in (6.25) may depend on this last choice. Any fixed $c_(*) > 2 nu$ then makes the absorption errors small for sufficiently large $L$; no polynomial threshold is chosen by using the norm of an exterior matrix.

=== 6.7 An envelope for arbitrary interior choices <an-envelope-for-arbitrary-interior-choices>

For comparison between different interior laws we need a bound that does not require the branch on $V$. Keep the same geometry, boundary data, exterior source, and prescribed artificial mask. Allow any set $D subset V$ of internal cell ports, at most one per site, with strengths $s_d in \[ e^(- C_0 L) \, 1 \]$ and real reference potentials bounded in modulus by a fixed $C_0$. All other internal real diagonals are their true values, and there are no cell ports on $B$. The set $D$, strengths, and references may depend arbitrarily on the true interior potentials and on auxiliary choices.

#thm([Proposition 6.2.])[
  (Interior envelope).  #emph[For almost every fixed boundary datum there is a nonnegative function $frak(E) \( v_V \)$ depending only on the true interior potentials, the fixed exterior and boundary data, and the artificial mask, such that every allowed internal configuration satisfies 
#[#set math.equation(numbering: n => "(6.29)")
 $ sum_(d in D) lr(|S_(d \, upright("source"))|)^2 lt.eq frak(E) \( v_V \) \, #h(2em) bb(E)_(V \, upright("true")) frak(E) lt.eq e^(C \( 1 + L \)^C) rho . $ <trans:envelope-bound>]

 The same integrated bound, with adjusted constants, holds under any density bounded by $e^(C \( 1 + L \)^C)$ relative to the true product law on $V$. The constants are uniform in the exterior data and in all adaptive interior choices.]
] <trans:envelope>

#proof[
  First fix a candidate subset $D$ and let $E_D$ denote its coordinate inclusion in $V xor P$. Replace all its strengths by $1$ and all its real reference potentials by their true values, retaining the artificial probes. Write $G'_D$ for the inverse after replacement and $G_D$ for the inverse of any of the original configurations with this set of sites. The two inverse matrices differ by
  $ \( G'_D \)^(- 1) = G_D^(- 1) + E_D Delta_D E_D^top \, #h(2em) ∥Delta_D∥ lt.eq C . $
  Let $s_(*) = e^(- C_0 L)$. Absorption before replacement gives $∥E_D^top G_D E_D∥ lt.eq s_(*)^(- 1)$. For any source vector $x$, inverse difference gives the pointwise identity
  $ E_D^top G_D x = #scale(x: 120%, y: 120%)[\(] I_D + E_D^top G_D E_D Delta_D #scale(x: 120%, y: 120%)[\)] E_D^top G'_D x . $
  Consequently, including the factor $4$ for squared scattering amplitudes and using $s_d lt.eq 1$,
  #[#set math.equation(numbering: n => "(6.30)")
   $ sum_(d in D) lr(|S_(d \, upright("source"))|)^2 lt.eq e^(C \( 1 + L \)) ∥E_D^top \( G'_D \)_(V P) hat(k)∥^2 . $ <trans:replacement>]
  In this formula and below, $E_D$ is also used for its inclusion in $V$ when the block dimensions specify this meaning. The replacement matrix depends on $D$ and true potentials only, so the right side is independent of the original reference values and strengths.
  All these inverses can be justified on a common full-measure set. For $G'_D$, eliminate $P$ and use the true diagonal densities on $V$; the real-part determinant is a nonzero diagonal polynomial. If an original matrix had a kernel vector, absorption would make it vanish on $D$. Restoring true reference values and replacing strengths at those sites would leave it a kernel vector of the replacement matrix. Thus the original inverse exists whenever the replacement inverse does, even for potential-dependent choices. There are only finitely many subsets $D$, so their generic sets can be intersected.
  Fix $D$. Ward and transpose symmetry imply
  #[#set math.equation(numbering: n => "(6.31)")
   $ X_D := ∥\( G'_D \)_(V V) E_D∥_(upright("HS"))^2 lt.eq "tr" "Im" \( G'_D \)_(V V) . $ <trans:envelope-ward>]
  We bound the expectation of the trace under the true product law by common-shift phase integration. If $n_V = lr(||) V$, parameterize the cube $\[ - h \, h \]^(n_V)$ by $v_(n_V) = t$ and $v_i = t + w_i$ for $i < n_V$. This change has Jacobian $1$; the allowed $t$ form an interval of length at most $2 h$, and each $w_i in \[ - 2 h \, 2 h \]$. Along this interval every true real diagonal in $V$ shifts at rate $1$. The only other derivatives are $- i tau a'_i \( v_i \)$, which obey $lr(|a'_i|)^2 lt.eq C a_i$. The absorption argument of 7 therefore gives
  $ Phi' \( t \) gt.eq 1 / 2 "tr" "Im" \( G'_D \)_(V V) - C dim \( V xor P \) . $
  The phase range and interval length bound the unnormalized trace integral by $C \( 1 + L \)^C$. Integrating over the transverse box and dividing by $\( 2 h \)^(n_V)$ costs at most $e^(C \( 1 + L \)^C)$; the constants may depend on the fixed $h$. Strict regularization followed by Fatou handles null singular slices. Thus
  #[#set math.equation(numbering: n => "(6.32)")
   $ bb(E)_(V \, upright("true")) X_D lt.eq bb(E)_(V \, upright("true")) "tr" "Im" \( G'_D \)_(V V) lt.eq e^(C \( 1 + L \)^C) \, $ <trans:envelope-phase>]
  uniformly in $D$ and in the exterior matrices.
  Let $H'_V$ be the $V \, V$ block of $\( G'_D \)^(- 1)$. It has bounded operator norm, since its diagonals are true potentials with unit cell absorption and bounded artificial absorption. The $V$ rows of $\( G'_D \)^(- 1) G'_D = I$ give
  $ M \( G'_D \)_(P V) E_D = E_D - H'_V \( G'_D \)_(V V) E_D . $
  The lower singular-value bound for $M$ implies the pointwise estimate
  #[#set math.equation(numbering: n => "(6.33)")
   $ ∥\( G'_D \)_(P V) E_D∥_(upright("HS"))^2 lt.eq C #scale(x: 120%, y: 120%)[\(] lr(||) D + X_D #scale(x: 120%, y: 120%)[\)] . $ <trans:envelope-boundary-field>]
  For the exterior source, use the $V \, P$ block of $G'_D \( G'_D \)^(- 1) = I$ and (6.1):
  $ E_D^top \( G'_D \)_(V P) hat(k) & = E_D^top \( G'_D \)_(V P) \( hat(T) - i I_P \) k_(*)\
 & = - E_D^top \( G'_D \)_(V V) M k_(*) - i E_D^top \( G'_D \)_(V P) k_(*) . $
  Transpose symmetry, the bounded norm of $M$, and (6.33) now show
  #[#set math.equation(numbering: n => "(6.34)")
   $ ∥E_D^top \( G'_D \)_(V P) hat(k)∥^2 lt.eq C rho #scale(x: 120%, y: 120%)[\(] lr(||) D + X_D #scale(x: 120%, y: 120%)[\)] . $ <trans:envelope-source>]
  Again, this uses no norm bound on $hat(T)$ or $hat(k)$. (6.32), (6.34) give the desired integrated bound for each replacement problem.
  Finally define the pointwise envelope
  $ frak(E) \( v_V \) = e^(C \( 1 + L \)) sum_(D subset V) ∥E_D^top \( G'_D \)_(V P) hat(k)∥^2 \, $
  with the empty-set summand zero and any value on the common null exceptional set. There are $2^(lr(||) V) = e^(O \( L^2 \))$ summands. (6.30) proves pointwise domination for every adaptive choice, and summing the expectation bounds proves (6.29). Multiplication by a bounded density gives the final assertion of the proposition. ◻
]

When this envelope is compared with the branch lower bound, the corner-box conditionings must coincide. The single-side laws on $B$ may differ: their settings and artificial absorptions change $rho$ only by the pointwise bounded factors in 11. This is the precise boundary comparison needed when an adaptive collection of descendant ports is replaced by an open parent root.

== 7 A hierarchy of probability splits and energy comparisons <sec:hierarchy>

Throughout this section the disorder strength $h > 0$ and the interior energy $E$ are fixed. All parameters in the cell construction are fixed as well. Constants may depend on these choices, including the corner-box exponent chosen below, but not on the outer torus, the upper thinning level, or the prescribed artificial-probe mask. We write

$ b_l = 3^l \, #h(2em) L_l = frac(b_l - 1, 2) - b \, #h(2em) q_l = p_l = exp \( - b_l^6 \) . $

Only levels above a sufficiently large fixed $l_0$ will be used. We increase $l_0$ whenever necessary to apply all the preceding cell estimates.

=== 7.1 An iid implementation of the rare cell laws <an-iid-implementation-of-the-rare-cell-laws>

On the torus of side $b_N$, choose one uniform lattice offset, independently of the true iid potentials. For each $l_0 lt.eq l lt.eq N$, partition the torus into squares of side $b_l$ whose centers are congruent to that offset modulo $b_l$. These partitions are nested. In each tile use the translated geometry and branch law of Lemma 4.1, Proposition 4.3, with $L = L_l$. The word #emph[ancestor] will always refer to strict containment in this nested family unless the contrary is stated.

We first record the geometric feature that makes conditioning compatible across levels. The corner triples belonging to different tiles and levels are disjoint except when they coincide exactly. At a coincident triple the ordering of its three sites, and the two real plane-basis vectors used for its box coordinates, are the same. In fact, the missing corner and its two companions have fixed displacements from the corresponding two ends of a tile. Passing to an extreme child preserves those positions:

$ b_l + frac(b_l - 1, 2) - b = frac(b_(l + 1) - 1, 2) - b . $

Consequently, if an ancestor triple meets a descendant tile, it is one of that descendant’s own triples. Also, the set $V union B$ of a descendant is contained in that of its ancestor, and every descendant center belongs to the ancestor’s $V$. The latter inclusion will ensure that all descendant reference-potential changes are interior changes when we use the parent-cell envelope.

Put $K_0 = 10^6$. For each distinct corner triple, give its three true potentials a single box label as follows. In each product of polynomial pieces of $theta.alt$ lying in $\( - h \, h \)^3$, use the fixed linear box coordinates from 10. Partition the resulting region into maximal dyadic cubes whose concentric doubles lie in the region. Their inverse images are the corner boxes. All labels are defined from the true potentials, but we will expose only specified labels. At exact corner coincidences we use the same label, rather than successively refining it. Null boundaries may be assigned arbitrarily.

Conditional on a box label, the three true variables are uniform on that box: the original density is constant, and the coordinate change is linear with constant nonzero Jacobian. Labels of disjoint triples are independent. If a box has width less than $xi$, its points lie within $C xi$ of the boundary of one of the finitely many piece regions. Indeed, away from those boundary strips a dyadic cube of width comparable to $xi$ containing the point has its concentric double inside the region, so a maximal cube containing it cannot be smaller. Thus

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P) \( upright("width of a given triple’s box") < xi \) lt.eq C xi . $ <hier:small-box>]

A level-$l$ tile has #emph[valid own labels] when the widths of all four corner boxes are at least $b_l^(- K_0)$. The doubled-box requirement also provides the polynomial clearance from support endpoints and piece boundaries required in the cell estimates.

Assign to every tile $U$ of level $l$ an independent selector $eta_U in { 0 \, 1 }$ of success probability $q_l$. These selectors are independent of all true potentials. A tile is #emph[eligible] if it is selected and has no selected strict ancestor. Eligible tiles are pairwise disjoint, even when a selected tile later fails its branch test. An eligible tile is #emph[allowed] if its own labels and those of every strict ancestor are valid at their respective levels.

For an allowed tile $U$, let $cal(L)_U$ be the likelihood of its cell branch law relative to the true product law with its four corner boxes fixed. It changes the law on $V$ and the noncorner single-side coordinates of $B$, leaves the conditional laws on the four corner triples unchanged, and leaves all remaining sites of the tile unchanged. Its root factor is the conditional density centered at the reference $c \( v \)$ constructed from the true values on $J$. Apart from the allowance gate, the likelihood uses only data in $U$ and its own corner boxes. In particular it does not use ancestor labels in any other way. The density bound of 10 gives, uniformly over valid boxes,

$ cal(L)_U lt.eq exp #scale(x: 120%, y: 120%)[\(] C L_l^3 + C L_l^2 log \( 2 + L_l \) #scale(x: 120%, y: 120%)[\)] . $

After increasing $l_0$, we have $p_l cal(L)_U lt.eq 1$.

Give each tile a further independent uniform variable $t_U$ on $\[ 0 \, 1 \]$. Its acceptance indicator is

#[#set math.equation(numbering: n => "(7.2)")
 $ A_U = upright(bold(1))_({ U upright(" eligible and allowed") }) upright(bold(1))_({ t_U lt.eq p_l cal(L)_U }) . $ <hier:acceptance>]

The selectors, acceptance uniforms, and offset are auxiliary randomness; the true potentials are sampled first from their unchanged iid law.

#thm([Proposition 7.1.])[
  (Conditional sampling).  #emph[Fix the offset and all selector marks. Expose the box identities of the eligible tiles and of their ancestors. Conditional on this information, the unexplored variables in disjoint eligible tiles are independent. For an allowed eligible tile $U$ of level $l$, its conditional acceptance probability is $p_l$, and conditional on acceptance its site variables have exactly the branch law of 10 with the indicated corner conditioning.]
  #emph[These conclusions remain valid for $U$ after fixing status decisions or other local choices in disjoint eligible tiles, provided the exposed box identities are retained in the conditioning. In particular, 
#[#set math.equation(numbering: n => "(7.3)")
 $ bb(P) \( A_U = 1 divides upright("offset") \) lt.eq q_l p_l . $ <hier:incidence>]

 The unconditional law of the true potentials remains the iid product law. The same construction can be made prospectively by omitting all selectors and ancestor tests above a specified cutoff level.]
] <hier:sampling>

#proof[
  The selector marks determine eligibility without using any potential. Consider an eligible tile $U$. Any exposed triple that meets $U$ is either one of its own triples or an ancestor triple coinciding with one of them. To see this also for labels exposed on behalf of another eligible tile, use nesting: that other tile is disjoint from $U$, and an ancestor of it that meets $U$ either contains $U$ or is disjoint from its interior. In the containing case the corner-coincidence property applies. Thus no exposed label imposes an additional condition on the interior of $U$ or on its single-side variables.
  The conditional true law in $U$ is consequently precisely the reference law defining $cal(L)_U$: the four corner triples are uniform in their fixed boxes, and all other sites have their product laws. These conditional laws factor across eligible tiles, since their site sets are disjoint and the only repeated labels are identical labels on the same triple. For an allowed tile,
  $ bb(E) \[ cal(L)_U divides upright("selectors and exposed labels") \] = 1 . $
  Integrating the independent uniform $t_U$ proves that its acceptance probability is $p_l$. More generally, for every bounded local test function $F$,
  $ bb(E) \[ F upright(bold(1))_({ A_U = 1 }) divides upright("selectors and exposed labels") \] = p_l bb(E) \[ F cal(L)_U divides upright("selectors and exposed labels") \] . $
  After division by $p_l$, this is exactly the branch expectation. Local status decisions in disjoint eligible tiles multiply the conditional product density by factors on those tiles alone, so do not alter this conclusion.
  The event $A_U = 1$ requires its own selector to be one. Conditional on eligibility and all required valid labels, the additional acceptance probability is $p_l$; dropping the other restrictions gives (7.3). Finally, acceptance only attaches auxiliary indicators to the initially sampled product field, and never resamples or changes that field. Omitting the higher-level rules leaves the same argument on the truncated hierarchy. ◻
]

For a stage $n$, $l_0 lt.eq n lt.eq N$, place active cell ports at precisely the accepted roots of levels at least $n$. Use their branch strengths and reference potentials. Every site without an active cell port has its true real potential. Because eligible tiles are disjoint, there is at most one cell port at a site. Denote the scattering matrix without artificial probes by $S_(n \, N)$.

We may also prescribe at most one artificial probe per site, absent or of strength $tau$ or $tau theta.alt \( v_i \)$. Its mask may depend on the offset and on external randomness independent of the potentials and branch decisions. The profile is always evaluated at the true value, including at an active cell root. When comparing stages $n < m$, we assume

#[#set math.equation(numbering: n => "(7.4)")
 $ 0 lt.eq tau lt.eq exp \( - c_(*) b_m \) . $ <hier:probe-range>]

This is sufficient for the cell estimate at every removed level and at its immediate parent. In particular all constants below are uniform over these masks. For notational convenience, expectations denoted by $bb(E)_(upright("off"))$ may include any external independent randomness used in the geometry or deterministic data prescriptions.

#thm([Lemma 7.2.])[
  (The hidden root law).  #emph[At an accepted root whose cell port is still open, condition on the selectors, the needed corner-box identities, all branch acceptance indicators, and the other true potentials. Do not condition on the numerical value of the root tile’s acceptance uniform. The root’s true value then has the form 
$ v_0 = c \( v \) + delta \, $

 where $delta$ has the centered, cutoff Cauchy law of 5, with the scale of that cell port. The open response, all other active references and strengths, and any artificial probe at this root are independent of this hidden draw under the stated conditioning.]
] <hier:hidden>

#proof[
  The root does not belong to any exposed triple. By 19, acceptance tilts its tile’s conditional law by the branch likelihood. With all other true values fixed, the only remaining factor is exactly the specified root density centered at $c \( v \)$; the reference is a function of the values on $J$. Acceptance indicators of other eligible tiles concern disjoint sites. Indicators of ineligible descendants are identically zero and give no further information about the root.
  The open system uses $c \( v \)$ in place of $v_0$. The support of the hidden draw lies on the plateau of $theta.alt$, so its artificial probe, if present, has constant strength there. References and strengths in other active cells depend only on their disjoint tiles. These facts prove the final assertion. Restoring true values at other roots does not change it, since those values also belong to disjoint eligible tiles. Conditioning on the numerical acceptance uniform, in contrast, could truncate the root density and is expressly excluded. ◻
]

=== 7.2 Thinning passes and admissible data <thinning-passes-and-admissible-data>

Fix $n < m lt.eq N$. A thinning pass acts on a designated union of level-$m$ tiles, chosen from the offset and any independent geometric randomness. In that region remove all accepted root ports of levels $n \, dots.h \, m - 1$, restoring their true real values. Process these levels in increasing order. At a given level interpolate by retaining each eligible accepted root independently with probability $theta$, with $theta$ decreasing from one to zero. Use fresh independent thinning marks; never recompute branch choices. One may subsequently perform a second pass on the complementary union of level-$m$ tiles. Each such pass is covered separately by the estimates below, with its own starting system. A #emph[prefix] may end between levels or at an intermediate value of $theta$.

Let $f$ be deterministic finite real scalar or Euclidean-vector site data, possibly depending on the offset. Its restriction supplies data on every port set. Let $g$ be data fixed at the beginning of the pass such that, for a deterministic $c_g < oo$,

#[#set math.equation(numbering: n => "(7.5)")
 $ lr(|g_i - g_j|)^2 lt.eq c_g^2 lr(|f_i - f_j|)^2 quad upright("for all sites ") i \, j . $ <hier:data-control>]

We permit $g$ to depend on selectors, branch statuses, and the start-of-pass response, and on external independent randomness. The precise admissibility requirement is that, at each root closure to which the energy comparison is applied, $g$ is measurable in the conditioning that preserves that root’s hidden law in 20. In particular it must not inspect still hidden true values needed for future closures, and it must not depend on the thinning marks of the pass. This formulation allows response-dependent adjustments while retaining the conditional closure identity.

For a level-$l$ tile $U$, let $D \( U \)$ be its immediate parent, and put

$ h_D = sup_(i \, j in D) lr(|f_i - f_j|) . $

Define the nonnegative charge

#[#set math.equation(numbering: n => "(7.6)")
 $ cal(C)_(n \, m) \( f \) = sum_(l = n)^(m - 1) q_l p_l thin bb(E)_(upright("off")) sum_(U : thin "level" \( U \) = l) h_(D \( U \))^2 . $ <hier:charge-definition>]

The sum includes all tiles of a level, even when the pass acts on only part of the torus; this only enlarges the bound.

#thm([Theorem 7.3.])[
  (Energy comparison under thinning).  #emph[There is a deterministic sequence $zeta_n arrow.b 0$, after replacing it by a decreasing majorant if necessary, such that for all sufficiently large $n$, every $n < m lt.eq N$, every allowed artificial-probe mask, and every pass or prefix just described, 
#[#set math.equation(numbering: n => "(7.7)")
 $ bb(E) cal(Q)_(upright("end")) \( g \) lt.eq bb(E) cal(Q)_(upright("start")) \( g \) + C c_g^2 (zeta_n bb(E) cal(Q)_(upright("start")) \( f \) + cal(C)_(n \, m) \( f \)) . $ <hier:comparison-equation>]

 The constants and $zeta_n$ are independent of $m \, N$, the pass region, the mask satisfying (7.4), and the finite dimensions of the real vector data.]
] <hier:comparison>

We prove the theorem by first establishing the estimate that controls the interpolation near $theta = 0$. In a current level-$l$ system, let $cal(A)_l$ be the thinnable roots in the pass region that are still present. For $a in cal(A)_l$, write $U \( a \)$ for its level-$l$ tile. Set

#[#set math.equation(numbering: n => "(7.8)")
 $ Z_l \( theta \) & = bb(E) sum_(a in cal(A)_l) sum_(j : thin "site" \( j \) in.not D \( U \( a \) \)) lr(|S_(j a)|)^2 lr(|f_j - f_a|)^2 \,\
B_l \( f \) & = q_l p_l thin bb(E)_(upright("off")) sum_(U : thin "level" \( U \) = l) h_(D \( U \))^2 . $ <hier:exterior-mass>]

Port data in these formulas are evaluated at their physical sites. Trivially,

#[#set math.equation(numbering: n => "(7.9)")
 $ Z_l \( theta \) lt.eq 2 bb(E) cal(Q)_(upright("current")) \( f \) . $ <hier:uncapped>]

#thm([Lemma 7.4.])[
  (The parent-alternative cap).  #emph[There are constants $C \, C_1$ such that, with $K_l = exp \( C \( 1 + b_(l + 1) \)^(C_1) \)$, for $0 lt.eq theta lt.eq 1$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ Z_l \( theta \) lt.eq theta K_l bb(E) cal(Q)_(upright("current")) \( f \) + C theta B_l \( f \) . $ <hier:cap-equation>]

 The estimate holds during either pass and during every level interpolation in that pass.]
] <hier:cap>

#proof[
  First replace the datum $f_a$ by that at its parent center $c_D$:
  $ lr(|f_j - f_a|)^2 lt.eq 2 lr(|f_j - f \( c_D \)|)^2 + 2 h_D^2 . $
  The additional term is bounded using the unit row mass of $S$ and (7.3). Each accepted level-$l$ root survives with probability $theta$ independently, so the total additional expectation is at most $C theta B_l \( f \)$. It remains to treat the first term, grouped by parent $D$.
  Fix such a parent in the pass region. The presence of a thinnable accepted child implies that all selector marks on $D$ and above it are zero and that all labels on $D$ and above it are valid. For comparison, however, leave the selector of $D$ itself free. Condition on:
  + absence of selected strict ancestors of $D$;
  + the identities of the valid labels of $D$ and its strict ancestors;
  + true potentials outside the parent’s $V union B$;
  + exterior selector marks, auxiliary uniforms, and thinning outcomes determining choices in tiles disjoint from $D$.
  Only this conditioned event can contribute to the upper expression; outside it that expression is zero. In particular, do not expose finer labels, statuses, or true potentials inside the parent.
  No eligible tile strictly contains $D$ under this conditioning. Changing $D$’s selector affects only its descendants. Exterior eligibility is unchanged, and any shared ancestor validity tests use the labels already fixed. If a label on behalf of an exterior tile meets the parent, it is one of the fixed parent triples. Hence the exterior active ports, their strengths and references, and their already restored true values are fixed across the alternatives below. The remaining law on the parent is the true product law with precisely the parent corner-box conditioning.
  Fix an exterior source port $j$ whose physical site is outside $D$. Schur elimination of the fixed exterior produces the same passive matrix $T$ and source vector $k$ at the parent’s $B$ in both alternatives. Artificial probes in the exterior are part of these fixed data. All possible descendant centers are in the parent’s $V$, and there are no cell ports on its $B$. Every active descendant strength is between $exp \( - C L_(l + 1) \)$ and one, and its reference potential is bounded, because its level does not exceed $l$.
  In the alternative contributing child survivors, apply 18 to all possible internal active subsets. The pointwise envelope furnished there depends only on the true potentials and the fixed exterior data. The same pointwise envelope applies to every internal branch choice and thinning outcome, so all internal selector, label, and acceptance restrictions may be dropped in its upper bound. Assign a fresh Bernoulli-$theta$ survival mark to each of the nine level-$l$ children, including those not accepted. A child contribution is possible only if at least one of these marks is one. This event has probability at most $9 theta$, independently of the envelope. Thus, writing $cal(S)_D$ for the thinnable survivors in $D$, the conditional upper bound is
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(E) [sum_(a in cal(S)_D) lr(|S_(j a)|)^2 thin mid(bar.v) thin upright("fixed data")] lt.eq theta exp #scale(x: 120%, y: 120%)[\(] C \( 1 + b_(l + 1) \)^(C_1) #scale(x: 120%, y: 120%)[\)] bb(E)_(B \, upright("true")) rho . $ <hier:parent-upper>]
  Here $rho$ is the parent’s boundary weight used in 17; the expectation includes its fixed corner boxes.
  In the comparison alternative, $D$ itself is selected and accepted. It is eligible because its strict ancestor selectors are zero, and allowed because its labels and those above are valid. By 19, this alternative has conditional probability $q_(l + 1) p_(l + 1)$ and its conditional law is the parent branch law. Its root $a_D$ is still active: the pass is presently at level $l$, and it has not thinned level $l + 1$. If this is the second pass, the earlier pass did not touch $D$, since its region and the present region are unions of level-$m$ tiles and $l + 1 lt.eq m$. Therefore the alternative is an actual member of the current ensemble, not a new system outside that ensemble. The lower estimate in 17 yields
  #[#set math.equation(numbering: n => "(7.12)")
   $ bb(E) [upright(bold(1))_({ a_D upright(" active") }) lr(|S_(j a_D)|)^2 thin mid(bar.v) thin upright("fixed data")] gt.eq c q_(l + 1) p_(l + 1) exp #scale(x: 120%, y: 120%)[\(] - C \( log L_(l + 1) \)^2 #scale(x: 120%, y: 120%)[\)] bb(E)_(B \, upright("branch")) rho . $ <hier:parent-lower>]
  The harmless normalization of a scattering amplitude is absorbed in $c$.
  The two boundary averages in (7.11), (7.12) have identical corner-box laws. They differ only in the single-side values and their permitted artificial absorptions. The pointwise weight comparison accompanying 11 compares all such bounded settings by a fixed factor. Integrating that comparison shows that the two averages of $rho$ are comparable, without imposing an exterior norm bound or assuming independence after a branch tilt. Inverting the parent incidence probability costs
  $ \( q_(l + 1) p_(l + 1) \)^(- 1) = exp \( 2 b_(l + 1)^6 \) \, $
  which can be absorbed in $K_l$. Consequently, under the specified conditioning,
  #[#set math.equation(numbering: n => "(7.13)")
   $ bb(E) sum_(a in cal(S)_D) lr(|S_(j a)|)^2 lt.eq theta K_l bb(E) [upright(bold(1))_({ a_D upright(" active") }) lr(|S_(j a_D)|)^2] . $ <hier:parent-transfer>]
  Absent exterior source ports contribute zero on both sides. Their status was fixed in the conditioning, so the inequality can be summed over exterior source indices and then integrated.
  Multiply by $lr(|f_j - f \( c_D \)|)^2$ and sum over parents. For an active parent this datum is exactly $f_(a_D)$. Each parent appears only once at this level, and the resulting oriented parent-to-exterior sum is at most $2 cal(Q)_(upright("current")) \( f \)$. Combining it with the oscillation charge proves (7.10), after enlarging $K_l$ by a fixed factor. ◻
]

#proof[
  Fix a level $l$ during the pass. Conditional on the initial data and the true potentials, the expectation over its finitely many thinning marks is a polynomial in $theta$. Differentiation gives a sum of single-root kept-versus-removed differences, with the other roots retained independently with parameter $theta$. Equivalently, for $theta > 0$, sum over the roots currently retained and divide by $theta$. The data $g$ are frozen throughout this interpolation. All scattering energies involved are integrable: unitarity and (7.5) bound them by finite deterministic pair-data oscillations and the finite number of ports.
  For one retained thinnable root $a$, use the conditioning of 20 and the admissibility of $g$. Restoring its true potential is exactly the closure operation of 4. Its expected increase is at most
  $ 2 lr(|mu_a|) cal(M)_a \( g \) \, $
  where $mu_a$ is the conditional cutoff coefficient. Use (7.5) to dominate the squared differences by those of $f$, with factor $c_g^2$. After this domination, $g$ plays no role in any further conditioning or cell integration.
  For ports $j$ in the parent $D \( U \( a \) \)$, the uniform bound on $lr(|mu_a|)$ from 5 and row mass give a cost at most $C c_g^2 h_(D \( U \( a \) \))^2$ on occurrence of this root. Its incidence is at most $theta q_l p_l$. After division by $theta$, the summed local cost is at most $C c_g^2 B_l \( f \)$.
  For links to ports outside the parent, apply the relative estimate in 17. To justify its use, fix selectors, the needed box identities, the tile’s acceptance, exterior true potentials off its $V union B$, and choices in the disjoint eligible tiles, as well as the independent thinning outcomes. Its branch law is unchanged by 19. All other active cell ports and their reference-potential changes are exterior, since the accepted tile has no eligible descendants. Accordingly the source and Schur data are fixed in the cell average. For deterministic $f$ this gives the upper bound
  $ C c_g^2 e^(- c L_l) frac(Z_l \( theta \), theta) $
  for the exterior part of the derivative in the direction of removal. Writing $F_l \( theta \) = bb(E) cal(Q)_(upright("current")) \( f \)$, the complete upper derivative bound is therefore
  #[#set math.equation(numbering: n => "(7.14)")
   $ C c_g^2 (B_l \( f \) + e^(- c L_l) frac(Z_l \( theta \), theta)) . $ <hier:differential>]
  Combine (7.9), (7.10). Increasing $K_l$ to be at least two and using $min \( a \, b + c \) lt.eq min \( a \, b \) + c$ gives
  $ frac(Z_l \( theta \), theta) lt.eq min (2 / theta \, K_l) F_l \( theta \) + C B_l \( f \) . $
  The logarithmic interpolation cost is explicit:
  $ integral_0^1 min (2 / theta \, K_l) thin upright(d) theta = 2 + 2 log \( K_l \/ 2 \) lt.eq C \( 1 + log K_l \) . $
  In particular the additive charge is not multiplied by this logarithm. Define
  $ a_l = C e^(- c L_l) \( 1 + log K_l \) \, #h(2em) alpha_n = sum_(l = n)^oo a_l . $
  The constants in $K_l$ are fixed independently of $l \, m \, N$. Since $log K_l$ is polynomial in $b_(l + 1) = 3 b_l$ and $L_l$ is proportional to $b_l$ for large levels, $alpha_n$ is finite and tends to zero. Integrating (7.14) over a whole level, or any prefix of it, costs at most
  $ c_g^2 (a_l sup_(0 lt.eq theta lt.eq 1) F_l \( theta \) + C B_l \( f \)) . $
  At $theta = 0$ use continuity of the finite thinning polynomial.
  Let $M$ be the supremum of $bb(E) cal(Q) \( f \)$ over all prefixes of the pass, including all intermediate interpolation parameters. First take $g = f$. Summing the preceding estimates up to any prefix gives
  $ M lt.eq bb(E) cal(Q)_(upright("start")) \( f \) + alpha_n M + C cal(C)_(n \, m) \( f \) . $
  Choose $n$ sufficiently large that $alpha_n < 1 \/ 2$. Then
  #[#set math.equation(numbering: n => "(7.15)")
   $ M lt.eq frac(bb(E) cal(Q)_(upright("start")) \( f \) + C cal(C)_(n \, m) \( f \), 1 - alpha_n) . $ <hier:prefix-supremum>]
  Now apply the same integrated estimates to the given $g$ and substitute (7.15). The resulting increase is at most
  $ c_g^2 (frac(alpha_n, 1 - alpha_n) bb(E) cal(Q)_(upright("start")) \( f \) + frac(C, 1 - alpha_n) cal(C)_(n \, m) \( f \)) . $
  This proves the theorem with a decreasing majorant of $alpha_n \/ \( 1 - alpha_n \)$ as $zeta_n$. All bounds are uniform over the specified levels and masks. For a complementary pass the same proof starts with that pass’s own initial energy; already performed changes in the other region are simply fixed exterior data in each local comparison. ◻
]

=== 7.3 The two useful scales of the additive charge <the-two-useful-scales-of-the-additive-charge>

#thm([Lemma 7.5.])[
  (Charge tails).  #emph[Put $r_n = sum_(l = n)^oo q_l p_l$, so that $r_n arrow.r 0$.]
  + #emph[If $f$ has global lattice Lipschitz constant at most $K$, then 
$ b_N^(- 2) cal(C)_(n \, m) \( f \) lt.eq C K^2 r_n \, #h(2em) n < m lt.eq N . $

]
  + #emph[Suppose $f$ vanishes outside a square of side at most $A R$ and has Lipschitz constant at most $K \/ R$. If $b_m lt.eq R$ and the square is interpreted in a coordinate neighborhood of the torus, then 
$ cal(C)_(n \, m) \( f \) lt.eq C_A K^2 r_n . $

 Both assertions hold for offset-dependent locations and prescriptions, and for real Euclidean-vector data.]
] <hier:charges>

#proof[
  There are $b_N^2 \/ b_l^2$ level-$l$ tiles. The diameter of an immediate parent is at most $C b_(l + 1)$ in the lattice distance. In the first case, $h_D^2 lt.eq C K^2 b_(l + 1)^2$. The contribution of this level, divided by area, is at most
  $ C K^2 q_l p_l b_(l + 1)^2 / b_l^2 lt.eq C K^2 q_l p_l . $
  Sum over $l$.
  In the second case, parents missing the support have zero oscillation. At level $l$, at most $C_A \( 1 + R \/ b_l \)^2$ children have a parent meeting the support. Also $h_D^2 lt.eq C K^2 b_(l + 1)^2 \/ R^2$. Thus the entire level contributes at most
  $ C_A K^2 q_l p_l \( 1 + R \/ b_l \)^2 b_(l + 1)^2 / R^2 lt.eq C_A K^2 q_l p_l \, $
  because $b_(l + 1) lt.eq b_m lt.eq R$. Summation proves the second claim. These are deterministic counts conditional on the offset, so averaging does not change the bounds. ◻
]

== 8 Screening and affine energies at a fixed stage <sec:screening>

Throughout this section the starting level $n$ is fixed and sufficiently large. Constants bearing a subscript $n$ may depend arbitrarily on $n$, as well as on the fixed $h \, E$. They do not depend on the torus size once that size is sufficiently large. We use the stage-$n$ construction of 19. We also allow the prescribed artificial probes: at each prescribed site there is at most one such probe, of strength $tau$ or $tau theta.alt \( v_x \)$, where $0 lt.eq tau lt.eq 1$. A mask specifies which of these choices is made at each site. Masks, observation grids, and test centers may depend on the hierarchy offset and on external independent randomness, but not on the potentials or on the branch decisions. When conditioning on the offset below, we also fix any such external randomness. Uniform assertions about these prescriptions mean estimates for every individual prescription, not a single event on which all prescriptions work simultaneously.

Write $Lambda_r \( x \)$ for the max-norm ball of radius $r$, with shortest coordinate distances on the torus. A tile of level $l > n$ is #emph[hazardous] if its selector is present, regardless of acceptance, or if one of its own corner labels fails the level-$l$ validity test. The construction gives, conditional on the offset,

#[#set math.equation(numbering: n => "(8.1)")
 $ bb(P) \( U upright(" is hazardous") divides upright("offset") \) lt.eq C b_l^(- K_0) \, #h(2em) K_0 = 10^6 . $ <screen:hazard>]

Consequently, for a square of radius $A$, the probability that a hazardous tile of side greater than $D$ meets that square is at most

#[#set math.equation(numbering: n => "(8.2)")
 $ C sum_(b_l > D) \( 1 + A \/ b_l \)^2 b_l^(- K_0) . $ <screen:hazard-count>]

All the counting estimates below are used within a small fixed fraction of the torus side, where squares may be unwrapped in the usual way.

=== 8.1 Prospective observations and a generic observation bound <prospective-observations-and-a-generic-observation-bound>

Choose a large power of three $Q_1$, and tile the torus by observation cores of side $Q_1$. Set $beta = 1 \/ 12$ and require $Q_1^beta gt.eq b_n$. For a core centered at $z$, test candidate level-$n$ roots in $Lambda_(3 Q_1) \( z \)$ using the prospective rule from 19: retain all local acceptance rules, but omit ancestor selectors and validity tests at sides exceeding $Q_1^beta$. The resulting test for one candidate uses randomness within distance $C Q_1^beta$ of that candidate, conditional on the offset.

Each test succeeds with probability at least $c q_n p_n > 0$. To see this, first expose the required selector statuses and the needed corner-box identities. Conditional on the candidate being eligible and all required labels being valid, its acceptance likelihood integrates to one, so its selector and acceptance contribute $q_n p_n$. The probability of the required strict-ancestor selector absences and the own and ancestor validity conditions is bounded below by a positive absolute constant: their failures have a summable union bound along the ancestor chain, made small by the choice of the starting level. This also explains why the local likelihood is not additionally conditioned on finer corner data.

Cover $Lambda_(2 Q_1) \( z \)$ by mesh squares of side comparable to $Q_1^(1 \/ 4)$. In each such square choose candidates separated by a sufficiently large multiple of $Q_1^beta$. There are at least $c Q_1^(2 \( 1 \/ 4 - beta \)) = c Q_1^(1 \/ 3)$ candidates with disjoint randomness neighborhoods, for sufficiently large $Q_1$ at fixed $n$. Their success indicators are independent conditional on the offset. The probability that some mesh square contains no successful root is therefore at most

#[#set math.equation(numbering: n => "(8.3)")
 $ C Q_1^(3 \/ 2) exp \( - c_n Q_1^(1 \/ 3) \) . $ <screen:net-failure>]

In particular, with arbitrarily high probability, the prospective observation roots form a $C Q_1^(1 \/ 4)$-net of $Lambda_(2 Q_1) \( z \)$, also for nearest-neighbor graph distance after changing the absolute constant.

The next argument applies to every possible observation set with this net property. Its equations always use the true potentials.

#thm([Lemma 8.1.])[
  (Generic local observation).  #emph[For sufficiently large $Q_1$, almost every choice of the true potentials on $Lambda_(3 Q_1) \( z \)$ has the following property. For every set $cal(O) subset Lambda_(3 Q_1) \( z \)$ that is a $C Q_1^(1 \/ 4)$-net of $Lambda_(2 Q_1) \( z \)$, there is a finite constant $C_(upright("obs"))$ such that 
#[#set math.equation(numbering: n => "(8.4)")
 $ ∥u \|_(upright("core"))∥ lt.eq C_(upright("obs")) (∥\( H - E \) u \|_(Lambda_(3 Q_1) \( z \))∥ + ∥u \|_(cal(O))∥) $ <screen:observation-bound>]

 for every vector on $Lambda_(3 Q_1 + 1) \( z \)$. After $Q_1$ is fixed, a deterministic $C_(upright("obs"))$ can be chosen so that this bound holds for every such set $cal(O)$ outside an event of arbitrarily small probability. The exceptional probability is uniform in the offset and in all sufficiently large tori.]
] <screen:observation>

#proof[
  It suffices to show that a vector annihilated by both constraints on the right of (8.4) vanishes on the core. All these constraints are real, so a counterexample would have a real counterexample. Fix its support pattern $cal(P) subset Lambda_(3 Q_1 + 1) \( z \)$ and an observation-set pattern $cal(O)$, and suppose that $cal(P)$ meets the core. Set $ell = ceil.l C' Q_1^(1 \/ 4) ceil.r$, with $C'$ large enough for the graph-distance net property.
  For any fixed sufficiently small $c_0 > 0$, some integer $r in \[ Q_1 \, 2 Q_1 \]$ satisfies
  #[#set math.equation(numbering: n => "(8.5)")
   $ lr(|cal(P) ∩ \( Lambda_(r + 1) \( z \) \\ Lambda_(r - ell) \( z \) \)|) lt.eq c_0 ell^(- 2) lr(|cal(P) ∩ Lambda_(r - ell) \( z \)|) . $ <screen:thin-support-annulus>]
  Indeed, if this failed at every radius, apply its reverse inequality at radii separated by $ell + 1$. At each step the support count would grow by a factor greater than $1 + c_0 ell^(- 2)$. The first inner square contains the nonempty core support, and there are at least $c Q_1 \/ ell$ steps. The resulting count would be at least $exp \( c Q_1 \/ ell^3 \)$, whereas the available neighborhood has only $O \( Q_1^2 \)$ sites. Since $Q_1 \/ ell^3$ grows as a positive multiple of $Q_1^(1 \/ 4)$, this is impossible for large $Q_1$.
  For a radius satisfying (8.5), write
  $ d'_0 = lr(|cal(P) ∩ Lambda_(r - ell) \( z \)|) \, #h(2em) p = lr(|cal(P) ∩ Lambda_r \( z \)|) \, #h(2em) m = lr(|cal(P) ∩ Lambda_(r + 1) \( z \)|) . $
  Every deep support site $x in cal(P) ∩ Lambda_(r - ell) \( z \)$ has an observed zero within graph distance $ell$. Follow a shortest path to such a zero and take its first vertex outside $cal(P)$. This is a missing site in $Lambda_r \( z \)$ adjacent to the support. At that site the equation $\( H - E \) u = 0$ is a nonzero homogeneous linear equation in the $m$ coordinates on $cal(P) ∩ Lambda_(r + 1) \( z \)$; its diagonal term vanishes.
  Select a maximal collection of these missing sites with pairwise graph distance greater than two. Their neighbor sets are disjoint, and each row is nonzero, so the corresponding linear equations are independent. By maximality, each deep site is within distance $ell + 2$ of a selected missing site. A graph ball of this radius has at most $C ell^2$ sites. Thus the number $k$ of independent equations satisfies
  $ k gt.eq c ell^(- 2) d'_0 . $
  On the other hand, $m - p lt.eq c_0 ell^(- 2) d'_0$ by (8.5). Choosing $c_0 < c$ gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ m - k < p . $ <screen:dimension-count>]
  The equations at the $p$ nonzero sites in $Lambda_r \( z \)$ determine their true potentials through
  $ v_x = E - frac(sum_(y : thin \| y - x \|_1 = 1) u_y, u_x) . $
  The admissible nonzero coordinates lie in a linear space of dimension at most $m - k$. On the set where the relevant denominators are nonzero, these formulas define a smooth map into $bb(R)^p$. Cover its domain by countably many bounded patches on which the denominators are bounded away from zero. On each patch the map is Lipschitz, and its image is Lebesgue null by (8.6). For completeness, a bounded patch in dimension $a < p$ may be covered by $O \( epsilon^(- a) \)$ cubes of side $epsilon$; their Lipschitz images have total $p$-dimensional covering volume $O \( epsilon^(p - a) \)$, which tends to zero. The joint law of the $p$ true potentials has a density, so this support and observation pattern has probability zero. There are only finitely many patterns and admissible radii. Taking their union proves the kernel assertion, including for an observation set chosen from the potentials.
  Let $A$ be the map consisting of the residual and observation constraints, and let $B$ be restriction to the core. The assertion $ker A subset ker B$ makes $B$ a well-defined linear map on $"im" A$ through $A$. Finite dimensionality gives a finite operator bound, which is (8.4); complex vectors obey the same bound by complexification. The maximum of these finite bounds over all possible net sets is finite almost surely. Taking a sufficiently high quantile gives a deterministic $C_(upright("obs"))$. The local true product law is unchanged by offset or by passage to a larger torus, proving the last assertion. No deterministic unique-continuation assertion is used. ◻
]

=== 8.2 Projected resolvents and shield comparisons <projected-resolvents-and-shield-comparisons>

The decay estimate below uses an exponential-conjugation argument of Combes–Thomas type [8]. We first establish the projected inverse bound on the observed coordinates; no bound on the full inverse is required.

Call an observation core #emph[good] if the prospective roots form the specified net, the deterministic observation bound holds, and no hazardous tile of side greater than $Q_1^beta$ meets $Lambda_(4 Q_1)$ about its center. The prospective roots of a good core are actual stage-$n$ ports: all omitted ancestor requirements hold. Moreover, every real reference change in its tested rows occurs at a cell port of side at most $Q_1^beta$. Such a port has strength bounded below by a positive number depending on $Q_1$.

We may count only a subset of these good cores. In a partly thinned or Dirichlet-restricted system, we count only cores for which the physical neighborhood $Lambda_(3 Q_1 + 1) \( z \)$ remains present, and for which all cell ports, their strengths, and the real reference values in the tested rows $Lambda_(3 Q_1) \( z \)$ agree with the full stage-$n$ system. We call these tests #emph[intact]. The neighbor layer preserves every hopping term in the true equations; artificial probes may still have any of the allowed masks. Let $J_(upright(g))$ be the coordinate embedding of the sites in the counted cores, and set

$ Pi = \[ J_(upright(g)) med med Y \] \, #h(2em) G = \( H^(\#) - E - i Y Y^top \)^(- 1) \, $

where $Y$ includes every current port, whether or not it lies in a counted core.

#thm([Proposition 8.2.])[
  (Projected screening).  #emph[For all the systems just described, 
#[#set math.equation(numbering: n => "(8.7)")
 $ ∥Pi^top G Pi∥ lt.eq C_n . $ <screen:projected-bound>]

 Give cost one to nearest-neighbor edges whose endpoints both belong to counted good cores, and cost zero to other edges; any of the positive costs may also be dropped. If two source and response sectors of $Pi$ have cost distance at least $t$, their resolvent block has norm at most $C_n exp \( - c_n t \)$.]
  #emph[Suppose, further, that two systems agree on an inner region and a surrounding shield, including all ports there, and that counted good tests in the shield are usable in both systems. Count costs only on shared good-good edges in the shield. If every crossing of the shield from the inner region to the exterior costs at least $t$, then the responses between common inner ports differ by at most $C_n exp \( - c_n t \)$ in operator norm. This includes comparison with a Dirichlet restriction buffered beyond the shield.]
] <screen:projected>

#proof[
  Put $u = G Pi w$, and abbreviate $A = ∥J_(upright(g))^top u∥$, $B = ∥Y^top u∥$, and $W = ∥∥ w$. In each tested neighborhood the true residual is
  $ \( H - E \) u = Pi w + \( H - H^(\#) \) u + i Y Y^top u . $
  There are at most two ports at a site and their strengths are uniformly bounded, so $∥∥ Y$ is uniformly bounded. The real changes are bounded and, within these rows, supported at cell ports with the positive strength lower bound just noted. Thus their contribution is bounded by $C_n B$. The observed values obey the same bound, using the accepted level-$n$ ports. The testing neighborhoods have bounded overlap. Summing the squared observation inequalities gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ A lt.eq C_n \( W + B \) . $ <screen:residual-observation>]
  Taking the imaginary part of the inverse equation, or using the Ward identity of 2, yields
  $ B^2 lt.eq \( A + B \) W lt.eq C_n \( W + B \) W . $
  This implies $B lt.eq C_n W$, and then $A lt.eq C_n W$ by (8.8). It proves (8.7) without a bound on the full inverse.
  Let $F$ be a real function on physical sites with $\| F \( x \) - F \( y \) \|$ at most the assigned cost of every nearest-neighbor edge. Conjugate the site matrix by multiplication by $e^(s F)$. Diagonal entries do not change, and every changed hopping entry has both endpoints among the counted good sites. Hence
  $ e^(s F) \( H^(\#) - E - i Y Y^top \) e^(- s F) = H^(\#) - E - i Y Y^top + J_(upright(g)) D_s J_(upright(g))^top \, #h(2em) ∥D_s∥ lt.eq C \( e^s - 1 \) . $
  For a sufficiently small fixed $s > 0$, depending on $n$, we have $∥D_s J_(upright(g))^top G J_(upright(g))∥ < 1 \/ 2$. The inverse difference formula and (8.7) therefore bound the conjugated projected inverse by another $C_n$. Assign to each column of $Pi$ the value of $F$ at its physical site, so that repeated columns at a site have the same weight. If $F_Pi$ is this diagonal matrix, the conclusion is
  #[#set math.equation(numbering: n => "(8.9)")
   $ ∥e^(s F_Pi) Pi^top G Pi e^(- s F_Pi)∥ lt.eq C_n . $ <screen:weighted-bound>]
  Choose $F$ to be cost distance from the source sector. Restriction of (8.9) to a response sector at distance $t$ gives the stated exponential attenuation.
  For the two-system comparison, use this same distance from the inner region, with costs counted only in the shield. For $t$ larger than an absolute constant, choose a multiplier $chi$ equal to one where $F lt.eq t \/ 3$, zero where $F gt.eq 2 t \/ 3$, and affine in between. It is supported in the common region, and changes only across counted good-good edges. Cut off the first system’s columns sourced at common inner ports by $chi$. In the second inverse equation the intended source is unchanged, and the only error is a hopping commutator supported on good coordinates. Each edge of that commutator has $F gt.eq t \/ 3 - 1$ at both endpoints. The weighted bound in the first system makes the error, as a good-coordinate source, at most $C_n e^(- c_n t)$ in operator norm. Correcting it with the second system’s projected inverse costs at most another $C_n$. Taking the common inner-port response proves the comparison. Bounded $t$ is covered by the unweighted projected bounds after enlarging the constant. The same calculation applies to a buffered Dirichlet restriction, because the cutoff vanishes before its boundary. ◻
]

=== 8.3 Crossing costs and the wall variant <crossing-costs-and-the-wall-variant>

By (8.3), Lemma 8.1, the probability of a local test failure can be made arbitrarily small, first by taking $Q_1$ large and then $C_(upright("obs"))$ large. The additional hazard cost for one core is at most

$ C sum_(b_l > Q_1^beta) \( 1 + Q_1 \/ b_l \)^2 b_l^(- K_0) \, $

which tends to zero as $Q_1$ grows. Consequently, in any neighborhood of radius a fixed multiple of $Q_1$, the probability that some core meeting that neighborhood is bad is arbitrarily small. All these probabilities are conditional on the offset, uniformly in that offset.

#thm([Proposition 8.3.])[
  (Full-stage path estimate).  #emph[There is an absolute $alpha > 0$ such that, for the full stage-$n$ good-core costs and all sufficiently large $r$ up to a small fixed fraction of the torus side, 
#[#set math.equation(numbering: n => "(8.10)")
 $ bb(P) (upright("some nearest-neighbor crossing from ") Lambda_r \( x \) upright(" to ") Lambda_(2 r) \( x \)^c\
upright("has cost less than ") c_n r^alpha thin mid(bar.v) thin upright("offset")) lt.eq C_n r^(- 50) . $ <screen:path-bound>]

 Only costs of edges with both endpoints in the intervening band need be counted. The constants are uniform in the center and the allowed prescriptions.]
] <screen:paths>

#proof[
  Fix a sufficiently large absolute integer $B_1$, and use the integer radii
  $ r_0 = 100 Q_1 \, #h(2em) r_j = B_1^j r_0 \, $
  as long as $r_j lt.eq b_N \/ 100$. Let $p'_j$ be the worst conditional probability, over offsets, centers, and sufficiently large tori, of a crossing of the $r_j$-band with cost less than $2^j$. Trim a crossing at its two radial boundaries, so that the tested segment lies entirely in the band.
  A crossing of the $r_(j + 1)$-band with cost less than $2^(j + 1)$ forces two failures at scale $r_j$ at well-separated centers from a bounded mesh list. Indeed, take successive visits to radii rounded from $5 r_(j + 1) \/ 4$, $3 r_(j + 1) \/ 2$, and $7 r_(j + 1) \/ 4$, and replace each visited site by a mesh center within distance $r_j$. For $B_1$ large enough, the corresponding $r_j$-annuli lie in the larger band, are pairwise disjoint, and are crossed by subsegments of the original path. Their centers are more than $20 r_j$ apart. If two of these crossings each had cost at least $2^j$, the original cost would be at least $2^(j + 1)$. Thus at least two are failures. The number of possible mesh-center pairs is an absolute constant after $B_1$ has been fixed.
  Temporarily truncate the hazard tests used for these smaller annuli at side $r_j$. Each resulting failure event then depends only on randomness within distance at most $5 r_j$ of its center. This includes the local prospective tests, the true observation equations, and the complete corner triples and selectors of every tested tile. The two separated events are independent conditional on the offset. Truncation can only enlarge the good set, so each truncated failure probability is at most $p'_j$. If no omitted hazardous tile meets the needed neighborhoods, the truncated and full costs coincide. The union bound (8.2) therefore gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ p'_(j + 1) lt.eq C \( p'_j \)^2 + C sum_(b_l > r_j) \( 1 + r_(j + 1) \/ b_l \)^2 b_l^(- K_0) lt.eq C \( p'_j \)^2 + C r_j^(- K_0) . $ <screen:path-recursion>]
  The constants here may depend on the fixed absolute $B_1$.
  Choose a small absolute $a > 0$ with $C a lt.eq B_1^(- 50) \/ 2$. The base tests above allow $p'_0 lt.eq a$. Increase $Q_1$, if necessary, so that the hazard term at the base is at most $a B_1^(- 50) \/ 2$. Since $K_0 > 50$, induction in (8.11) gives
  $ p'_j lt.eq a B_1^(- 50 j) . $
  Set $alpha = log_(B_1) 2$; thus $2^j = \( r_j \/ r_0 \)^alpha$. This proves the assertion at recursion radii. For a general sufficiently large radius $r$, take the largest $r_j$ with $r_j lt.eq r \/ 100$. A crossing of the $r$-band has a translated $r_j$-band crossing wholly inside it, at one of a bounded mesh list of centers. Here $r_j$ is comparable to $r$, with absolute comparison constants. The union bound gives (8.10), after changing $c_n \, C_n$. This construction also covers noninteger radii and uses no costs at the outer band boundaries. ◻
]

#thm([Proposition 8.4.])[
  (Screening on retained walls).  #emph[Fix an aligned square grid of side $L_(*)$, deterministic given the offset. Suppose a system retains the full stage-$n$ data on a wall set containing strips of width $delta L_(*)$ along every grid boundary, where $delta > 0$ is a fixed absolute constant. Count only good cores whose centers are at least $5 Q_1$ inside this wall set, so that all their tests are intact. There is an absolute constant $A_(upright(w))$ such that, for $L_(*)$ sufficiently large at fixed $n$ and 
$ A_(upright(w)) L_(*) lt.eq r lt.eq c b_N \, $

 every crossing of the $r$-band has wall cost at least $c'_n r^alpha$ outside an event of conditional probability at most $C'_n r^(- 30)$. Here $c'_n \, C'_n$ and the threshold on $L_(*)$ may depend on $n$; $A_(upright(w))$ depends only on the absolute strip fraction and geometric constants. In particular, the constants in the bound are uniform as $L_(*)$ grows. As before, only edges within the crossed band need be counted.]
] <screen:walls>

#proof[
  It suffices to count good cores whose centers are at least $5 Q_1$ inside the prescribed boundary strips. These cores are among those allowed in the statement, and dropping the other costs can only decrease crossing costs. This counted geometric region is deterministic conditional on the offset.
  Let $r_0^(upright(w)) = K L_(*)$ for a sufficiently large fixed absolute $K$. A crossing of its band contains a smaller annulus crossing deep inside one wall strip. To verify this, unwrap coordinates about the large-band center $x$ and stop the path when it first reaches radius approximately $7 r_0^(upright(w)) \/ 4$. One of its signed coordinates attains this value. Between signed coordinate distances $5 r_0^(upright(w)) \/ 4$ and $3 r_0^(upright(w)) \/ 2$ from $x$, choose a parallel grid boundary line. Such a line exists because $K$ is large. The path must visit this line, while its other coordinate has modulus at most $7 r_0^(upright(w)) \/ 4 + 1$.
  Put $rho = floor.l c_(upright(w)) L_(*) floor.r$ for a small fixed $c_(upright(w)) > 0$. Choose a mesh center within $rho \/ 10$ of this visit. The entire $rho$-annulus about that center lies both inside the original large band and inside the wall strip; choosing $c_(upright(w))$ sufficiently small and then $L_(*)$ sufficiently large also leaves the $5 Q_1$ buffer for all relevant core tests. By its later visit to radius $7 r_0^(upright(w)) \/ 4$, the path has left the small annulus. It therefore provides the claimed crossing. Since $r_0^(upright(w)) \/ rho$ is bounded by an absolute constant, only boundedly many mesh centers are needed. Applying 26 at those centers gives a base wall threshold $a_n L_(*)^alpha$, with failure probability at most $C_n L_(*)^(- 50)$.
  Run the same recursion as in (8.11), now with the deterministic wall restriction at every scale. The three-annulus geometry is unchanged. After truncating hazards, separated events still use disjoint randomness neighborhoods, since the counted strips add no randomness conditional on the offset. At radius $r_j^(upright(w)) = B_1^j K L_(*)$ the threshold is
  $ 2^j a_n L_(*)^alpha = a_n K^(- alpha) \( r_j^(upright(w)) \)^alpha . $
  The failure recurrence is again a square of the preceding probability plus $O \( \( r_j^(upright(w)) \)^(- K_0) \)$. For a sufficiently large lower threshold on $L_(*)$, its base bound $C_n L_(*)^(- 50)$ and this recurrence imply $C'_n \( r_j^(upright(w)) \)^(- 30)$ at all recursion radii: at a new radius $B_1 r$, the two terms are $O_n \( r^(- 60) \)$ and $O \( r^(- K_0) \)$, which are bounded by $C'_n \( B_1 r \)^(- 30)$ once the base radius is large. This induction uses constants independent of $L_(*)$. Finally use a comparable smaller recursion scale and a bounded mesh list inside a general band, as in 26. Taking $r gt.eq 100 r_0^(upright(w))$ suffices. This is an absolute multiple of $L_(*)$, as claimed. ◻
]

=== 8.4 Jump tails and fixed-stage limits <jump-tails-and-fixed-stage-limits>

At full stage $n$, with the possible extra probes, define

#[#set math.equation(numbering: n => "(8.12)")
 $ d_(n \, N) \( x \) = 1 / 2 sum_(a : thin "site" \( a \) = x) sum_j \| S_(j a) \|^2 "dist"_2 \( x \, "site" \( j \) \)^2 . $ <screen:local-energy>]

Here $"dist"_2$ is Euclidean distance formed from the shortest coordinate displacements. Let $d_(n \, N)^(lt.eq D) \( x \)$ and $d_(n \, N)^(> D) \( x \)$ denote the same sum restricted respectively to jump lengths at most $D$ and greater than $D$.

#thm([Proposition 8.5.])[
  (Fixed-stage limits).  #emph[For each fixed sufficiently large $n$ there is a finite number $d_n gt.eq 0$ with the following properties. The jump tails satisfy 
#[#set math.equation(numbering: n => "(8.13)")
 $ sup bb(E) [d_(n \, N)^(> D) \( x \) divides upright("offset")] lt.eq omega_n \( D \) \, #h(2em) omega_n \( D \) arrow.r 0 \, $ <screen:jump-tail>]

 uniformly in the site, sufficiently large tori, prescribed masks, and $0 lt.eq tau lt.eq 1$. For a deterministic site $x$, with expectation including the uniform offset, 
#[#set math.equation(numbering: n => "(8.14)")
 $ bb(E) d_(n \, N) \( x \) arrow.r d_n #h(2em) \( N arrow.r oo \, med tau arrow.r 0 \) \, $ <screen:point-limit>]

 uniformly in the prescriptions. If $A$ is a growing square, whose position may be chosen from the offset and external independent randomness, then 
#[#set math.equation(numbering: n => "(8.15)")
 $ frac(1, \| A \|) sum_(x in A) d_(n \, N) \( x \) arrow.r d_n quad upright("in mean and in probability") . $ <screen:spatial-limit>]

 The estimates for this convergence are uniform conditional on the offset, over such square positions and prescriptions, as the square side and the torus size grow and $tau arrow.r 0$. Bounded-length jumps capture these spatial averages to any given tolerance with arbitrarily high probability if the jump cutoff is chosen first and sufficiently large.]
] <screen:limits>

#proof[
  At most two ports occur at a site: one accepted cell root and one artificial probe. Thus the source rank in (8.12) is at most two. For large $D$, use a separating annulus about $x$ with radius comparable to $D \/ 200$. Its cost is at least $c_n D^alpha$ outside an event of conditional probability at most $C_n D^(- 50)$, by 26. The projected attenuation in 25 applies from the source ports at $x$ to all ports at distance greater than $D$ simultaneously. Unitarity bounds that block on the exceptional event. The source-rank bound gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ bb(E) [sum_(a : thin "site" \( a \) = x) sum_(j : thin "dist"_2 \( x \, "site" \( j \) \) > D) \| S_(j a) \|^2 thin mid(bar.v) thin upright("offset")] lt.eq C_n #scale(x: 120%, y: 120%)[\(] e^(- c_n D^alpha) + D^(- 50) #scale(x: 120%, y: 120%)[\)] . $ <screen:mass-tail>]
  Multiply the bound at dyadic distances $2^q D$ by $C \( 2^q D \)^2$ and sum. The series is convergent and tends to zero with $D$, proving (8.13). This also controls jumps comparable to the torus side: their separating annulus can still be taken at radius $D \/ 200$, within the allowed small torus fraction. There is no final unestimated shell.
  We next construct local approximants, keeping $n$ fixed. Fix a jump cutoff $D$. First restrict the effective site data to a Dirichlet square of a sufficiently large fixed radius $R_(upright("loc"))$ about $x$. A shield buffered inside this square encloses $x$ and all targets at distance at most $D$. The shield comparison of 25 and the path estimate give arbitrarily small expected error in the truncated sum as $R_(upright("loc"))$ grows. On its exceptional event use unitarity; the truncated sum is bounded by $C D^2$. The comparison concerns a block with source rank at most two, so its error does not acquire a factor from the number of remote ports.
  Next choose a fixed superscale $b_k$ much larger than $R_(upright("loc"))$ and omit all hierarchy rules above that scale when forming the restricted effective data. Use the prospective ancestor convention, the same true potentials, and the same selectors and acceptance uniforms below the cutoff. The restricted effective data agree with the original data unless an omitted hazardous tile meets the restriction. Indeed, absent such a hazard, no omitted selector can suppress a retained root, and every omitted ancestor validity gate is satisfied. The local likelihoods do not otherwise use ancestor-label identities. The probability of disagreement is bounded by
  $ C sum_(b_l > b_k) \( 1 + R_(upright("loc")) \/ b_l \)^2 b_l^(- K_0) \, $
  which tends to zero with $k$. A retained reference value and its likelihood use only their finite tile. The resulting truncated Dirichlet quantity therefore depends on randomness within distance $O \( R_(upright("loc")) + b_k \)$ of $x$.
  For this fixed finite approximant we may remove artificial probes by sending $tau$ to zero. To keep its channel space fixed, pad it with one artificial channel at every site of the restriction and give absent channels strength zero. Such a column is zero in $Y$ and contributes only an isolated identity entry to $S$. Its inverse at $tau = 0$ exists almost surely: a kernel vector of the passive matrix vanishes at cell-port sites, where all real reference changes are supported, and hence would be a kernel vector of the true Dirichlet restriction minus $E$. The latter has nonzero determinant almost surely by the joint diagonal density. Inverse continuity now gives $S arrow.r S_(upright("cell")) xor 1$ on this fixed channel space. In particular, the cell-port scattering block converges. Mixed entries involving an artificial probe tend to zero, as do off-diagonal entries between artificial probes. Their diagonal entries do not contribute to (8.12), since their jump length is zero. Bounded convergence applies to the truncated sums, which are uniformly bounded by $C D^2$. There are only finitely many local masks, including the choices of constant or profile strength, and finitely many offset patterns modulo the fixed superscale. Taking a maximum over these finitely many choices makes this convergence uniform. This step does not require any uniform lower bound for $theta.alt \( v_x \)$.
  Combining these constructions with the jump-tail bound proves the following useful precise statement. For every $epsilon > 0$ there is a bounded no-extra local function $Z_x$, with fixed dependence radius $rho_(upright("loc")) = O \( R_(upright("loc")) + b_k \)$, such that
  #[#set math.equation(numbering: n => "(8.17)")
   $ bb(E) \[ \| d_(n \, N) \( x \) - Z_x \| divides upright("offset") \] < epsilon $ <screen:local-approximation>]
  for every sufficiently large $N$ and sufficiently small $tau$, uniformly in masks, offsets, and sites. The choices of $D$, $R_(upright("loc"))$, and $k$ are made in that order, before these limits.
  Conditional on the offset, the $Z_x$ have finite dependence range: two collections farther apart than $2 rho_(upright("loc"))$ are independent. Their conditional means are periodic at the superscale $b_k$, and the pattern for a different offset is a translate of the same pattern. Thus their period-averaged mean, say $mu_Z$, is independent of offset. It is also their mean at any deterministic site after averaging over the uniform offset. For all sufficiently large tori these local laws are identical. By (8.17), the numbers $bb(E) d_(n \, N) \( x \)$ are Cauchy in the joint limit, uniformly in the prescriptions. Their finite limit is $d_n$, and $\| mu_Z - d_n \| lt.eq epsilon$.
  For a square $A$ of side $a$, covering its interior by complete $b_k$-periods gives
  $ lr(|frac(1, \| A \|) sum_(x in A) bb(E) \[ Z_x divides upright("offset") \] - mu_Z|) lt.eq C ∥Z∥_oo b_k / a . $
  Counting pairs with nonzero conditional covariance also gives
  $ "Var" (frac(1, \| A \|) sum_(x in A) Z_x thin mid(bar.v) thin upright("offset")) lt.eq C ∥Z∥_oo^2 rho_(upright("loc"))^2 / a^2 . $
  Both bounds hold for every square position, including one chosen from the offset. The same bounded-range counting applies on the torus, with periodic distances. Average (8.17) over $A$, take the square and torus sizes large, and then send $epsilon$ to zero. This proves the asserted conditional uniform convergence in mean and hence in probability. Notice that a conditional point mean need not equal $d_n$; it is the period average that removes its dependence on the offset pattern. Finally, the expected difference between the full and truncated spatial averages is at most $omega_n \( D \)$, even conditional on the offset. Markov’s inequality, followed by (8.15), proves the bounded-jump assertion. ◻
]

=== 8.5 Compact profiles and convergence of affine energies <compact-profiles-and-convergence-of-affine-energies>

#thm([Proposition 8.6.])[
  (Compact-profile estimate).  #emph[Let $phi : bb(R)^2 arrow.r bb(R)^q$ be compactly supported and Lipschitz, piecewise smooth with bounded gradients and piecewise regular interfaces. Let its center $c$ be prescribed from the offset and external independent randomness. At full stage $n$, 
#[#set math.equation(numbering: n => "(8.18)")
 $ limsup_(R arrow.r oo \, med tau arrow.r 0\
b_N \/ R arrow.r oo) bb(E) thin cal(Q)_(upright("start")) #scale(x: 120%, y: 120%)[\(] phi \( \( dot.op - c \) \/ R \) #scale(x: 120%, y: 120%)[\)] lt.eq C d_n integral_(bb(R)^2) \| nabla phi \|^2 thin thin upright(d) x \, $ <screen:profile-bound>]

 where $C$ is absolute. Here $n$ and the profile are fixed; the thresholds may depend arbitrarily on them. The estimate is uniform over the allowed masks and centers, and remains valid with the expectation conditioned on the offset.]
  #emph[More generally, let $f$ be supported in a square of side at most $A R$ whose position is prescribed from the offset and external independent randomness, and suppose that $f$ has global Lipschitz constant at most $B \/ R$. Then 
#[#set math.equation(numbering: n => "(8.19)")
 $ bb(E) thin cal(Q)_(upright("start")) \( f \) lt.eq C_(A \, B) \( d_n + o \( 1 \) \) $ <screen:rough-profile>]

 in the same fixed-$n$ regime, uniformly over all such data and prescriptions. Thus each assertion holds to any fixed additive tolerance for all sufficiently large spatial and torus scales and all sufficiently small $tau$; no rate uniform in $n$ is asserted.]
] <screen:profiles>

#proof[
  Fix a large jump cutoff $D$. If a profile difference is nonzero, at least one endpoint belongs to its support. By symmetry of $S$, the contribution of jumps longer than $D$ is bounded by
  $ frac(C "Lip" \( phi \)^2, R^2) sum_(x in "supp" phi_R) d_(n \, N)^(> D) \( x \) \, #h(2em) phi_R \( x \) = phi \( \( x - c \) \/ R \) . $
  There are $O \( R^2 \)$ sites in this support. Its expected value tends uniformly to zero as $D arrow.r oo$, by (8.13).
  For jumps of length at most $D$, the squared profile difference is bounded by $R^(- 2)$ times the squared jump length times a local supremum of $\| nabla phi \|^2$. Away from the interfaces, these suprema converge to $\| nabla phi \|^2$ in the Riemann-sum limit. The sites whose rescaled $D$-neighborhood meets an interface have vanishing relative area, and the global Lipschitz bound controls their contribution. Thus the short-jump energy is bounded by
  $ C / R^2 sum_x w_R \( x \) d_(n \, N)^(lt.eq D) \( x \) \, $
  where $w_R$ is uniformly bounded, supported in an $O \( R \)$ square, and has Riemann-sum limit $integral \| nabla phi \|^2$.
  To justify averaging these weights also conditional on the offset, use the fixed local approximants from (8.17). Their bounded periodic conditional means have period average arbitrarily close to $d_n$. On complete periods, the slowly varying Riemann-sum weights may be replaced by a representative value with error tending to zero; the incomplete boundary periods contribute vanishingly. The uniform conditional expected approximation error contributes at most $C epsilon R^(- 2) sum_x w_R \( x \)$. This proves the bound for the short jumps after sending the spatial and torus scales to infinity and $tau$ to zero. Then let the local approximation error and the jump-tail error tend to zero. All finite cutoffs and local neighborhoods were chosen at fixed $n$ before taking these limits.
  For the more general data, use the global Lipschitz bound directly. Symmetry charges every nonzero difference to the supporting square, so
  $ cal(Q)_(upright("start")) \( f \) lt.eq frac(C B^2, R^2) sum_(x upright(" in the supporting square")) d_(n \, N) \( x \) . $
  The uniform spatial mean estimate in 28 now gives (8.19). This argument only uses support size and the Lipschitz bound, so it is uniform for varying profiles with the stated bounds. ◻
]

To approximate affine coordinate data on a torus without choosing a discontinuous coordinate branch, put

#[#set math.equation(numbering: n => "(8.20)")
 $ f_N \( x \) = frac(b_N, 2 pi) #scale(x: 120%, y: 120%)[\(] cos \( 2 pi x_i \/ b_N \) \, sin \( 2 pi x_i \/ b_N \) #scale(x: 120%, y: 120%)[\)]_(i = 1 \, 2) in bb(R)^4 . $ <screen:affine-data>]

Its chord distances satisfy

#[#set math.equation(numbering: n => "(8.21)")
 $ 2 / pi "dist"_2 \( x \, y \) lt.eq \| f_N \( x \) - f_N \( y \) \| lt.eq "dist"_2 \( x \, y \) \, $ <screen:chord-comparison>]

and their ratio to $"dist"_2 \( x \, y \)$ tends to one uniformly for bounded nonzero jumps as $N arrow.r oo$. Indeed, for shortest coordinate displacements $delta_i$, the squared chord distance is $sum_i \( b_N sin \( pi delta_i \/ b_N \) \/ pi \)^2$. Truncate the jumps, use this local limit, and then use (8.13) for the tails. Translation after offset averaging and (8.14) give

#[#set math.equation(numbering: n => "(8.22)")
 $ b_N^(- 2) bb(E) thin cal(Q)_(S_(n \, N)) \( f_N \) arrow.r d_n . $ <screen:affine-limit>]

There are no artificial probes in this identity.

#thm([Proposition 8.7.])[
  (Limit of the affine energy densities).  #emph[The fixed-stage limits satisfy 
#[#set math.equation(numbering: n => "(8.23)")
 $ d_n arrow.r d quad upright("for some ") 0 lt.eq d < oo . $ <screen:d-limit>]

 More precisely, a deterministic $epsilon_n arrow.r 0$ can be chosen such that 
#[#set math.equation(numbering: n => "(8.24)")
 $ d_m lt.eq \( 1 + epsilon_n \) d_n + epsilon_n #h(2em) \( m > n \) $ <screen:almost-monotone>]

 for all sufficiently large $n$, uniformly in $m$.]
] <screen:limit>

#proof[
  Apply 21 without extras to $f_N$ in the full transition from stage $n$ to stage $m$. The data have a uniformly bounded Lipschitz constant by (8.21). The area-normalized charge estimate of 23 has a vanishing $n$-tail independent of $m \, N$, as does the multiplicative error in the comparison. Divide by $b_N^2$, fix $n < m$, and send $N$ to infinity using (8.22) for both stages. This proves (8.24) with errors uniform in $m > n$; no limit uniform in the pair $\( n \, m \)$ was taken.
  Fixing one sufficiently large $n_0$ in that inequality first bounds $d_m$ for all $m > n_0$. Let $d$ be the finite nonnegative lower limit of this bounded sequence and choose $n_k arrow.r oo$ with $d_(n_k) arrow.r d$. For each $k$, (8.24) gives
  $ limsup_(m arrow.r oo) d_m lt.eq \( 1 + epsilon_(n_k) \) d_(n_k) + epsilon_(n_k) . $
  Sending $k arrow.r oo$ proves that the upper limit is at most $d$. This proves convergence. ◻
]

The order of parameters in this section will be used explicitly below. One fixes $n$ before choosing observation scales, quantiles, jump cutoffs, or local approximation radii. Their possibly very large values impose only fixed thresholds on subsequent spatial scales. With fixed additional parameters, one can then take $m > n$ so large that scales of order $exp \( b_m^2 \)$ exceed every such threshold. A probe strength $tau = C_0 \/ R$ at those scales tends to zero and eventually satisfies $tau lt.eq exp \( - c_(*) b_m \)$, as required by 21. Finally $N$ is increased after these choices. Neither this procedure nor (8.23) supplies or uses a rate of convergence uniform in $n$.

== 9 Vanishing of the limiting energy in two dimensions <sec:vanishing>

Throughout this section, the disorder strength and the interior energy are fixed. All auxiliary constructions are those of the preceding sections. In particular, 30 provides finite numbers $d_n$ with $d_n arrow.r d gt.eq 0$. No convergence rate uniform in $n$ is assumed.

#thm([Proposition 9.1.])[
  #emph[The limiting affine energy vanishes: $d = 0$.]
] <van:zero>

Suppose for contradiction that $d > 0$. We first thin the gaps between retained inner squares and grid walls. A localized change of the affine data disappears after the complementary thinning pass. Since the expected initial and final affine energy densities approach the same limit, choosing the sign of this change forces its local first variation to be small in expectation.

We then place weak probes in a square annulus between one inner square and its wall. A logarithmic voltage profile makes total transmission to the probes small, so the cell-to-cell scattering block is nearly unitary. Its surviving internal jump energy gives an analytic trace a nonzero central value. Closing the probes identifies the boundary modulus with the preceding first variation evaluated after a support-preserving shift of the true potentials. A bounded cost for changing the law transfers smallness to boundary probabilities, and dimension-independent moment bounds turn this into a small boundary integral, contradicting submean.

=== 9.1 Geometry and order of scales <geometry-and-order-of-scales>

Fix a number $M_0 > 20$, to be enlarged below. After choosing $n$, choose $m > n$ and a power of three $L_(*)$ such that

#[#set math.equation(numbering: n => "(9.1)")
 $ e^(b_m^2) lt.eq L_(*) < 3 e^(b_m^2) \, #h(2em) R = L_(*) / M_0^2 . $ <van:scales>]

The torus side $b_N$ will be much larger than $L_(*)$. Since $L_(*)$ is a power of three, the torus admits an aligned partition into grid tiles $D$ of side $L_(*)$. The alignment is specified by the hierarchy offset. Write $c_D$ for a tile center and use max-norm radii about this center.

Let $I_D$ be the union of level-$m$ tiles whose centers have radius at most $R$, and let $O_D$ be the union of level-$m$ tiles whose centers have radius at least $L_(*) \/ 3$. Thus the inner square has radius $R + O \( b_m \)$, and the outer walls begin at radius $L_(*) \/ 3 + O \( b_m \)$. The remaining level-$m$ tiles form the gap. Thin levels $n \, dots.h \, m - 1$ in all gaps, leaving the inner squares and walls at stage $n$. The result is called the intermediate system. A complementary pass on the retained regions finishes the transition to uniform stage $m$. Both pass regions are unions of whole level-$m$ tiles, as required by 21.

Define the selector event

#[#set math.equation(numbering: n => "(9.2)")
 $ cal(P)_D = { upright("no selected tile of level at least ") m upright(" meets ") D } . $ <van:no-large>]

This event involves selectors only. Conditional on the offset,

#[#set math.equation(numbering: n => "(9.3)")
 $ bb(P) \( cal(P)_D^c divides upright("offset") \) lt.eq C sum_(l gt.eq m) \( 1 + L_(*) \/ b_l \)^2 q_l = o \( 1 \) . $ <van:no-large-bound>]

Indeed $q_l = e^(- b_l^6)$ and $L_(*) < 3 e^(b_m^2)$, so the right side tends to zero faster than any fixed negative power of $R$. On $cal(P)_D$, the intermediate cell ports in $D$ lie only in $I_D union O_D$; after the complementary pass there are no cell ports in $D$.

Independently of the potentials, selectors, and acceptance variables, choose a uniformly random grid tile, conditional on the offset. For this test tile write $D \, c \, I \, O \, cal(P)$ instead of $D \, c_D \, I_D \, O_D \, cal(P)_D$. All expectations below include this choice. It is a permitted independent prescription for the screening and comparison estimates. The retained regions and the probe annulus used below are shown in 2.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({rect((-3.25, -3.25), (3.25, 3.25), fill: rgb("#e0e0e0"), stroke: none); line((3.25, 3.25), (-2.6, -2.6)); rect((-2.6, -2.6), (2.6, 2.6), fill: rgb("#e0e0e0"), stroke: none)}, fill: rgb("#e0e0e0"), fill-rule: "even-odd", stroke: none)
  compound-path({rect((-1.94, -1.94), (1.94, 1.94), fill: rgb("#dbdbff"), stroke: none); line((1.94, 1.94), (-1.45, -1.45)); rect((-1.45, -1.45), (1.45, 1.45), fill: rgb("#dbdbff"), stroke: none)}, fill: rgb("#dbdbff"), fill-rule: "even-odd", stroke: none)
  rect((-0.7, -0.7), (0.7, 0.7), fill: rgb("#e0f0e0"), stroke: none)
  rect((-3.25, -3.25), (3.25, 3.25), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-2.6, -2.6), (2.6, 2.6), stroke: (thickness: 0.55pt, miter-limit: 10))
  rect((-1.94, -1.94), (1.94, 1.94), stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  rect((-1.45, -1.45), (1.45, 1.45), stroke: (paint: rgb("#0000a6"), thickness: 0.55pt, miter-limit: 10))
  rect((-0.7, -0.7), (0.7, 0.7), stroke: (paint: rgb("#003a00"), thickness: 0.55pt, miter-limit: 10))
  rect((-0.96, -0.96), (0.96, 0.96), stroke: (paint: rgb("#808080"), thickness: 0.55pt, miter-limit: 10, dash: "dashed"))
  content((0, 0.18), [$I_D$])
  content((0, -0.16), [#text(size: 7pt)[retained]])
  content((0, 2.27), [#text(size: 9pt)[thinned gap]])
  content((0, 1.69), [#text(size: 9pt)[probe annulus $C$]])
  content((0, 2.94), [#text(size: 9pt)[retained wall $O_D$]])
  circle((0, 0), radius: 0.025, fill: black, stroke: none)
  line((0, -0.35), (3.52, -0.35), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.56, -0.35), [#text(size: 7pt)[radius]], anchor: "west", padding: 0.1176cm)
  line((0.7, -0.43), (0.7, -0.27), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((1.45, -0.43), (1.45, -0.27), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((1.94, -0.43), (1.94, -0.27), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((2.6, -0.43), (2.6, -0.27), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((3.25, -0.43), (3.25, -0.27), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((0.7, -0.44), (0.7, -0.85), (4.05, -0.85), stroke: (paint: rgb("#737373"), thickness: 0.55pt, miter-limit: 10))
  line((1.45, -0.44), (1.45, -1.38), (4.05, -1.38), stroke: (paint: rgb("#737373"), thickness: 0.55pt, miter-limit: 10))
  line((1.94, -0.44), (1.94, -1.91), (4.05, -1.91), stroke: (paint: rgb("#737373"), thickness: 0.55pt, miter-limit: 10))
  line((2.6, -0.44), (2.6, -2.44), (4.05, -2.44), stroke: (paint: rgb("#737373"), thickness: 0.55pt, miter-limit: 10))
  line((3.25, -0.44), (3.25, -2.97), (4.05, -2.97), stroke: (paint: rgb("#737373"), thickness: 0.55pt, miter-limit: 10))
  content((4.12, -0.85), [#text(size: 9pt)[$R+O(b_m)$]], anchor: "west", padding: 0.1176cm)
  content((4.12, -1.38), [#text(size: 9pt)[$M_0R$]], anchor: "west", padding: 0.1176cm)
  content((4.12, -1.91), [#text(size: 9pt)[$2M_0R$]], anchor: "west", padding: 0.1176cm)
  content((4.12, -2.44), [#text(size: 9pt)[$L_*"/"3+O(b_m)$]], anchor: "west", padding: 0.1176cm)
  content((4.12, -2.97), [#text(size: 9pt)[$L_*"/"2$]], anchor: "west", padding: 0.1176cm)
  content((3.95, 1.05), [#text(size: 9pt)[$L_*=M_0^2R$#linebreak()$b_m << R$#linebreak()$M_0>20$]], anchor: "west", padding: 0.1176cm)
  content((0, -3.63), [#text(size: 7pt)[Dashed square: adjustment support ends at radius $2R$.]])
})],
  caption: [Figure 2: One grid tile in the intermediate system. The annulus is a square annulus, because all indicated radii use the max norm. The picture is schematic, not to scale: in the proof $M_0$ is large, so $R lt.double M_0 R < 2 M_0 R lt.double L_(*) \/ 3$. Inner and wall boundaries are rounded to unions of level-$m$ tiles; the probe annulus is not so rounded. On $cal(P)_D$, the gap has no cell ports, and the added probes occur only in the displayed annulus. ],
) <van:geometry-figure>

=== 9.2 An adaptive adjustment of the affine data <an-adaptive-adjustment-of-the-affine-data>

For the moment use no artificial probes. Let $S'$ be the intermediate scattering matrix and let $f = f_N$ be the four-component torus embedding used to define the affine energy in 30. Its chord distances are globally comparable to shortest Euclidean torus distances, and its nearest-neighbor increments are bounded. Define four-component data on the intermediate cell ports by

#[#set math.equation(numbering: n => "(9.4)")
 $ F = frac(f - f \( c \), R) \, #h(2em) F_I = upright(bold(1))_I F \, #h(2em) H^0 = sum_(nu = 1)^4 "tr" #h(-0.16667em) [F_(I \, nu) \( F_nu - S' F_nu S' ""^(*) \)] . $ <van:trace-data>]

As elsewhere, real scalar data inside a matrix expression denote the corresponding diagonal matrices. The trace $H^0$ is real, since every diagonal entry of $S' F_nu S' ""^(*)$ is real. It is the local first variation of the affine energy: for fixed $S'$,

$ frac(thin upright(d), thin upright(d) t) cal(Q)_(S') \( f - t R F_I \)\|_(t = 0) = - 2 R^2 H^0 . $

Here the perturbation is data on the intermediate ports. The proof below extends it by a cutoff to site data with bounded increments and chooses its sign separately in each grid tile. On the selector event, the affected ports disappear in the complementary pass.

#thm([Lemma 9.2.])[
  #emph[Fix $M_0$. For every $a > 0$, one can arrange 
#[#set math.equation(numbering: n => "(9.5)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(P)) \| H^0 \| #scale(x: 120%, y: 120%)[\]] lt.eq a $ <van:adjustment-small>]

 by taking $n$, then $m > n$, then $N$ sufficiently large. More precisely, the estimate holds for all sufficiently large $n$, all sufficiently large $m$ depending on $n$, and all sufficiently large $N$ depending on the fixed pair $\( n \, m \)$.]
] <van:adjustment>

#proof[
  For each grid tile choose a cutoff $eta_D$ that is one on $I_D$, vanishes at radius $2 R$, and has Lipschitz constant at most $C \/ R$. Such cutoffs exist once $b_m \/ R$ is small. Define $H_D^0$ by (9.4) with $D$ as the test tile, and set
  $ phi \( x \) = - sum_D upright(bold(1))_(cal(P)_D) "sgn" \( H_D^0 \) eta_D \( x \) #scale(x: 120%, y: 120%)[\(] f \( x \) - f \( c_D \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) "sgn" \( 0 \) = 0 . $
  The supports are disjoint. On each support, $\| f - f \( c_D \) \| lt.eq C R$, so the product has uniformly bounded nearest-neighbor increments. Across support boundaries the same bound holds because the cutoff vanishes there. Using a shortest lattice path and global comparability of chord distances gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ \| phi \( x \) - phi \( y \) \| lt.eq C \| f \( x \) - f \( y \) \| quad upright("for all torus sites ") x \, y . $ <van:adjustment-lipschitz>]
  This random adjustment is admissible at the start of the complementary pass in 21. The selector events may be used as pre-information. Also $S'$ uses the calibrated reference value at every still-open root, not the hidden true value at that root. By 20, the disjoint eligible cells and their recorded statuses do not expose any of those hidden values. Thus $H_D^0$ and its sign are measurable with respect to the allowed pre-information. The adjustment does not use the subsequent thinning marks.
  On $cal(P)_D$, all intermediate ports meeting $"supp" eta_D$ lie in $I_D$, where $eta_D = 1$. No final port meets this support. Hence $g = f + t phi$, $0 < t < 1$, agrees with $f$ on the final stage-$m$ ports. By symmetry and unitarity of $S'$, the quadratic energy expands as
  $ cal(Q)_(S') \( g \) = cal(Q)_(S') \( f \) + 2 t sum_nu "tr" #h(-0.16667em) [phi_nu \( f_nu - S' f_nu S' ""^(*) \)] + t^2 cal(Q)_(S') \( phi \) . $
  One may subtract $f_nu \( c_D \)$ in the trace belonging to a fixed tile, because $S'$ is unitary. Its linear contribution is therefore $- 2 t R^2 upright(bold(1))_(cal(P)_D) \| H_D^0 \|$. There are $b_N^2 \/ L_(*)^2$ grid tiles. Averaging the uniformly selected test tile and dividing by the torus area yields
  #[#set math.equation(numbering: n => "(9.7)")
   $ frac(bb(E) cal(Q)_(S') \( g \), b_N^2) = frac(bb(E) cal(Q)_(S') \( f \), b_N^2) - 2 t M_0^(- 4) bb(E) \[ upright(bold(1))_(cal(P)) \| H^0 \| \] + t^2 frac(bb(E) cal(Q)_(S') \( phi \), b_N^2) . $ <van:adjustment-expansion>]
  By (9.6), the last energy is at most a constant times $cal(Q)_(S') \( f \)$.
  Apply Theorem 7.3, Lemma 7.5 to the first pass with data $f$. Then apply the comparison to the complementary pass with data $g$, using the pointwise increment bound for $g$ obtained from (9.6). The allowed increment constant is uniform for $0 < t < 1$. The fixed-stage affine limits give
  $ b_N^(- 2) bb(E) cal(Q)_(S') \( f \) & lt.eq d_n + epsilon_n + o_(n \, m \; N) \( 1 \) \,\
b_N^(- 2) bb(E) cal(Q)_(S') \( g \) & gt.eq d_m - epsilon_n - o_(n \, m \; N) \( 1 \) \, $
  where $epsilon_n arrow.r 0$ uniformly in $m > n$. Here and below, $o_(n \, m \; N) \( 1 \)$ tends to zero as $N arrow.r oo$ with $n \, m$ fixed. Boundedness of $d_n$ now gives, from (9.7),
  #[#set math.equation(numbering: n => "(9.8)")
   $ 2 t M_0^(- 4) bb(E) \[ upright(bold(1))_(cal(P)) \| H^0 \| \] lt.eq C t^2 + d_n - d_m + 2 epsilon_n + o_(n \, m \; N) \( 1 \) . $ <van:adjustment-inequality>]
  First take $t$ sufficiently small that the quadratic contribution, after division by $2 t M_0^(- 4)$, is less than $a \/ 2$. Since $d_n$ is convergent, the remaining terms are less than the required tolerance for sufficiently large $n \, m \, N$ in the stated order. This proves (9.5). ◻
]

=== 9.3 An annulus of artificial probes <an-annulus-of-artificial-probes>

Add probes at all sites of

$ C = { x : M_0 R lt.eq \| x - c \|_oo lt.eq 2 M_0 R } \, $

and nowhere else, using strength $tau theta.alt \( v_x \)$, where

#[#set math.equation(numbering: n => "(9.9)")
 $ tau = C_0 / R . $ <van:probe-scale>]

The constant $C_0$ will be fixed before $n \, m \, N$ are chosen. For sufficiently large $m$, (9.1) implies $tau lt.eq e^(- c_(*) b_m)$, so this mask is allowed throughout the first comparison pass. Use the same underlying hierarchy choices as before. The resulting intermediate scattering matrix has block form

#[#set math.equation(numbering: n => "(9.10)")
 $ S = mat(delim: "(", A, T; T^top, B) . $ <van:block>]

The first block consists of all cell ports, and the second consists of the new probes. We also use $C$ for their index set. In this section $I$ denotes the cell ports in the retained inner square and $J$ denotes all other cell ports; these symbols are local to this section. On $cal(P)$, every port in $J$ is outside the probe annulus toward the exterior. Set

$ K = ∥T∥_(upright("HS"))^2 . $

The data $F \, F_I$ still refer to (9.4), now restricted to the cell ports of (9.10).

We first give the deterministic use of a good annular barrier. A site is called good for this purpose when $theta.alt \( v_x \) gt.eq d_0$, where $d_0 > 0$ is fixed sufficiently small. Count only edges with both endpoints good and lying in a buffered square band strictly inside $C$, for example with both endpoint radii in $\[ 1.2 M_0 R \, 1.8 M_0 R \]$. Give such an edge cost one, and all other edges cost zero. Denote by $ell \( x \)$ the resulting cost distance from the region $\| x - c \|_oo gt.eq 2 M_0 R$. Let $cal(B)$ be the event

#[#set math.equation(numbering: n => "(9.11)")
 $ ell \( x \) gt.eq gamma M_0 R quad upright("whenever ") \| x - c \|_oo lt.eq M_0 R \, $ <van:barrier-event>]

where $gamma > 0$ is a sufficiently small fixed constant.

#thm([Lemma 9.3.])[
  #emph[For suitable fixed $d_0 \, gamma > 0$, $bb(P) \( cal(B)^c \) lt.eq C e^(- c M_0 R)$. On $cal(B) ∩ cal(P)$, for every compatible matrix $D'$ on the source columns indexed by $J$, 
#[#set math.equation(numbering: n => "(9.12)")
 $ ∥A_(I J) D'∥_(upright("HS")) lt.eq frac(C, M_0 R tau d_0) ∥S_(C J) D'∥_(upright("HS")) . $ <van:barrier-bound>]

 The constant includes the fixed factor $gamma^(- 1)$. The same cutoff argument controls every absorbed output supported where the cutoff equals one; it requires no norm bound on the exterior resolvent.]
] <van:barrier>

#proof[
  Since $theta.alt$ is positive in the interior of the single-site support, the iid probability $p_0 = bb(P) { theta.alt \( v_x \) < d_0 }$ tends to zero with $d_0$. If (9.11) fails, trim a cheap crossing to the buffered band and erase its loops. The resulting simple path has length $j gt.eq c M_0 R$. Choosing $gamma$ sufficiently small, a fixed positive fraction of its edges must touch bad sites. Since the path is simple, a fixed positive fraction of its distinct vertices are bad. There are at most $C \( M_0 R \)^2 4^j$ candidate paths of length $j$, and at most $2^(j + 1)$ ways to designate a subset of their vertices. Independence therefore bounds the failure probability by
  $ C \( M_0 R \)^2 sum_(j gt.eq c M_0 R) 4^j 2^(j + 1) p_0^(c' j) . $
  For sufficiently small fixed $d_0$, this is exponentially small.
  For the deterministic estimate, use the physical inverse $G$ of the intermediate system with the probes inserted, and set $u = G Y_J D'$. Define
  $ chi \( x \) = min { 1 \, ell \( x \) \/ \( gamma M_0 R \) } . $
  It is zero at the $J$ sources and one at $I$. An edge across which $chi$ changes is a counted edge; on that edge $\| chi \( x \) - chi \( y \) \| lt.eq \( gamma M_0 R \)^(- 1)$. Since diagonal terms commute with $chi$, the equation for $chi u$ has only the residual
  $ q = \[ G^(- 1) \, chi \] u $
  and no original source. This residual is supported on the probe sites at endpoints of changing edges. If $sigma_x = tau theta.alt \( v_x \)$, write $q = Y_C a$ there. In each matrix entry of the map $Y_C^top u mapsto a$, the conversion introduces $sigma_x^(- 1 \/ 2) sigma_y^(- 1 \/ 2) lt.eq \( tau d_0 \)^(- 1)$. The vertex degree is bounded, and hence
  #[#set math.equation(numbering: n => "(9.13)")
   $ ∥a∥_(upright("HS")) lt.eq frac(C, M_0 R tau d_0) ∥Y_C^top u∥_(upright("HS")) . $ <van:commutator-source>]
  By 2, the norm of propagation from probe sources to all absorbed outputs is at most one. Since $chi = 1$ at $I$,
  $ ∥Y_I^top u∥_(upright("HS")) = ∥Y_I^top G Y_C a∥_(upright("HS")) lt.eq ∥a∥_(upright("HS")) . $
  The blocks in (9.12) are off diagonal, so replacing the physical fields by their scattering blocks multiplies both sides by the same factor $2$. This proves the assertion and also the stated all-output version of the cutoff argument. ◻
]

The next event combines small total transmission with positive internal jump energy and a bound on transmission weighted by $F$. The weighted bound is needed because $F$ grows on distant cell ports: small $K$ alone does not control those coordinate factors in the trace.

#thm([Lemma 9.4.])[
  #emph[Assume $d > 0$. There is a constant $c_1 > 0$ with the following property. For every sufficiently small fixed $kappa > 0$, one can choose $M_0$ sufficiently large and finite constants $C_1 \, C_F$, before choosing $C_0 \, n \, m \, N$, so that the following holds. For any fixed sufficiently large $C_0$, and then $n \, m \, N$ sufficiently large successively, an event $cal(G)$ of probability at least $1 \/ 2$ satisfies 
#[#set math.equation(numbering: n => "(9.14)")
 $ cal(G) subset cal(P) ∩ cal(B) \, #h(2em) K lt.eq kappa \,\
c_1 d lt.eq sum_(i \, j in I) \| F \( i \) - F \( j \) \|^2 \| A_(i j) \|^2 lt.eq C_1 \,\
∥F_nu T∥_(upright("HS")) lt.eq C_F quad \( 1 lt.eq nu lt.eq 4 \) . $ <van:good-transmission>]

 In particular, on this event, 
#[#set math.equation(numbering: n => "(9.15)")
 $ ∥A_(I J)∥_(upright("HS")) + sum_(nu = 1)^4 ∥A_(I J) F_nu \|_J∥_(upright("HS")) lt.eq frac(C \( sqrt(kappa) + C_F \), M_0 C_0 d_0) . $ <van:external-small>]

 The right side tends to zero as $C_0$ increases, with all constants chosen before it kept fixed.]
] <van:good>

#proof[
  Fix small exception budgets for each of the following assertions, with their sum less than $1 \/ 2$. All probability bounds are unconditional; in particular, none of the screening or spatial-average estimates is conditioned on $cal(P)$. Let $D_(*)$ be a finite upper bound for all $d_n$ after increasing the starting level if necessary.
  #emph[Small total transmission to the annulus.] Choose voltage one on $C$, zero within radius $2 R$ and at radii at least $L_(*) \/ 4$, with logarithmic ramps in the intervening regions. For example, as a function of $r = \| x - c \|_oo$, the inner ramp is $log \( r \/ \( 2 R \) \) \/ log \( M_0 \/ 2 \)$ and the outer ramp is $log \( \( L_(*) \/ 4 \) \/ r \) \/ log \( M_0 \/ 8 \)$. It has a compact profile at scale $R$ and
  #[#set math.equation(numbering: n => "(9.16)")
   $ integral_(bb(R)^2) \| nabla phi \|^2 thin thin upright(d) x lt.eq frac(C, log M_0) . $ <van:capacity>]
  Indeed the area element for square shells is a constant times $r thin thin upright(d) r$, while the gradient on either ramp is at most $C \/ \( r log M_0 \)$. On $cal(P)$, all cell-port voltages are zero, and all probe voltages are one. The intermediate energy is therefore exactly $K$: each cell-to-probe pair is counted once by the symmetric energy.
  Use 29 for the starting stage-$n$ energy and Theorem 7.3, Lemma 7.5 for the first pass. For fixed $M_0 \, C_0 \, n$, with $m \, N$ subsequently large, this gives
  $ bb(E) \[ upright(bold(1))_(cal(P)) K \] lt.eq frac(C D_(*), log M_0) + o_(n arrow.r oo) \( 1 \) + o_(m \, N arrow.r oo \; n \, M_0 \, C_0) \( 1 \) . $
  Choose $M_0$ large enough for the first term to meet the assigned Markov bound at threshold $kappa$, then take $n \, m \, N$ large in order. Together with (9.3), this proves (9.14) outside the assigned exception.
  #emph[Internal jump energy.] Inside $I$, the intermediate system has exactly the same data as the full stage-$n$ system without artificial probes. Consider a deep square of radius $R \/ 4$ and its bounded-jump neighborhoods. A shield at fixed relative radii inside $I$ has intact stage-$n$ tests. By Proposition 8.2, Proposition 8.3, comparison across that shield changes the relevant scattering block by at most $C_n e^(- c_n R^alpha)$ in operator norm outside an event of vanishing probability. The block ranks grow only polynomially in $R$.
  Fix $n$ with $d_n gt.eq d \/ 2$. By 28, choose a finite jump cutoff capturing the spatial average on this deep square up to, say, a quarter of $d_n$. For sufficiently large $m \, N$, that truncated average exceeds $d_n \/ 2$ with the prescribed high probability. Every such jump lies in $I$. Its squared chord length under $F$ is its squared physical length divided by $R^2$, up to factors tending to one as $b_N \/ R arrow.r oo$. The deep square has area comparable to $R^2$. The preceding operator-norm comparison incurs a vanishing error in the resulting weighted sum, because the rank is polynomial and the shield error is exponential. This gives the lower bound in (9.14), with $c_1 > 0$ independent of the later scales.
  For the upper bound, extend $F \|_I$ to data vanishing by radius $2 R$, with Lipschitz constant $C \/ R$. Apply the coarse profile bound in 29 and then the first-pass comparison. The expected intermediate energy is at most $C D_(*) + o \( 1 \)$. The sum of internal jump terms is at most twice this energy. Markov’s inequality therefore gives a fixed upper cutoff $C_1$, chosen before $C_0$, for the assigned exception budget.
  #emph[Weighted transmission.] For cell ports within a sufficiently large absolute multiple of $L_(*)$ from $c$, chord bounds give $\| F_nu \| lt.eq C M_0^2$. Their contribution to $∥F_nu T∥_(upright("HS"))$ is at most $C M_0^2 sqrt(K)$. Beyond this range, retain only the good-edge costs on the thick grid walls $O_D$. Those costs are still available in the intermediate system, including their buffered tests. The wall estimate in 27, followed by 25, gives for a dyadic distance range of order $D_1$ the expectation bound
  #[#set math.equation(numbering: n => "(9.17)")
   $ C_(n \, M_0) R^2 \( D_1 \/ R \)^2 (e^(- c_n D_1^alpha) + D_1^(- 30)) . $ <van:far-weighted>]
  To see the rank factor, there are $O_(M_0) \( R^2 \)$ input probes; the operator norm of transmission across a successful wall shield is exponentially small, and it is always at most one by unitarity. The chord weight is at most $C D_1 \/ R$. At torus-size distances one uses a separating band with radius a sufficiently small fixed multiple of $D_1$, so the same estimates apply. The dyadic sum of (9.17) tends to zero as $m$ increases at fixed $n$, uniformly for sufficiently large $N$: its polynomial part is a sum of $D_1^(- 28)$. Thus one may choose, for example, $C_F = C M_0^2 sqrt(kappa) + 1$, with a sufficiently large absolute constant and harmless extra slack for all four components. This choice is independent of $n \, C_0$; only the scale required to make the far error small depends on them.
  Finally include $cal(B)$ using 33. The total exception probability is less than $1 \/ 2$. This proves the event assertion. Apply (9.12) with $D' = 1$ and with $D' = F_nu \|_J$. Since $S_(C J) = \( T^top \)_(C J)$, its unweighted Hilbert-Schmidt norm is at most $sqrt(K)$, and its weighted norm is at most $∥F_nu T∥_(upright("HS"))$. Substituting (9.9) proves (9.15). ◻
]

=== 9.4 An analytic trace with nonzero central value <an-analytic-trace-with-nonzero-central-value>

Close all inserted probes with the common phase $z$. For real $s$, the corresponding physical shifts and the phase are

#[#set math.equation(numbering: n => "(9.18)")
 $ v_x mapsto v_x + s theta.alt \( v_x \) quad \( x in C \) \, #h(2em) z = frac(s + i tau, s - i tau) . $ <van:twist-parameter>]

By 3, the scattering matrix on cell ports is

#[#set math.equation(numbering: n => "(9.19)")
 $ S_z = A + Delta \( z \) \, #h(2em) Delta \( z \) = T z \( 1 - z B \)^(- 1) T^top . $ <van:closed-family>]

Define $H \( z \)$ on the unit circle by replacing $S'$ with $S_z$ in (9.4). Its matrix expression contains the adjoint $S_z^(*)$. To remove that obstruction to analyticity, replace the adjoint by the adjugate and multiply the constant term by the determinant:

#[#set math.equation(numbering: n => "(9.20)")
 $ frak(h) \( z \) = sum_nu "tr" #h(-0.16667em) [F_(I \, nu) { F_nu det S_z - S_z F_nu "adj" S_z }] $ <van:analytic-function>]

This function is analytic in the disk. Indeed $B$ is a contraction, and the scattering entries in (9.19) are rational analytic functions there. Possible boundary poles are removable: away from finitely many points their boundary values are unitary, which excludes a genuine pole of a rational entry on the circle. Thus $frak(h)$ extends continuously to the boundary. There,

#[#set math.equation(numbering: n => "(9.21)")
 $ frak(h) \( z \) = det \( S_z \) H \( z \) \, #h(2em) \| frak(h) \( z \) \| = \| H \( z \) \| \, $ <van:boundary-modulus>]

because $"adj" S_z = \( det S_z \) S_z^(*)$.

#thm([Lemma 9.5.])[
  #emph[Choose $kappa$ sufficiently small depending on $d$, then the constants in 34, and then $C_0$ sufficiently large. There are constants $c_2 > 0$ and $B_p < oo$, independent of the later choices $n \, m \, N$, such that on $cal(G)$ 
#[#set math.equation(numbering: n => "(9.22)")
 $ \| frak(h) \( 0 \) \| gt.eq c_2 \, $ <van:central-bound>]

 and, for every fixed $0 < p < 1 \/ 2$, 
#[#set math.equation(numbering: n => "(9.23)")
 $ integral_(bb(T)) \| H \( z \) \|^p thin thin upright(d) gamma_(bb(T)) \( z \) lt.eq B_p . $ <van:hardy-bound>]

 Here $gamma_(bb(T))$ is normalized Haar measure. Neither constant depends on the number of cell ports or probes.]
] <van:analytic-bounds>

#proof[
  Unitarity in (9.10) gives $A A^(*) = 1 - T T^(*)$. If the eigenvalues of $T T^(*)$ are $delta_j gt.eq 0$, then $sum_j delta_j = K lt.eq kappa$. Thus $A$ is invertible and
  #[#set math.equation(numbering: n => "(9.24)")
   $ \| det A \|^2 = product_j \( 1 - delta_j \) gt.eq 1 - K \, #h(2em) ∥A^(- 1) - A^(*)∥_1 = ∥A^(- 1) T T^(*)∥_1 lt.eq K / sqrt(1 - K) lt.eq 2 K $ <van:almost-unitary>]
  for sufficiently small $kappa$. At zero,
  #[#set math.equation(numbering: n => "(9.25)")
   $ frac(frak(h) \( 0 \), det A) = sum_nu "tr" #h(-0.16667em) [F_(I \, nu) \( F_nu - A F_nu A^(- 1) \)] . $ <van:central-trace>]
  On $I$ every $F_nu$ is bounded by an absolute constant, because the radius of $I$ is $R + O \( b_m \)$.
  First retain only the $I \, I$ indices in the product term of (9.25), along with the entire constant trace. Replacing the internal block of $A^(- 1)$ by that of $A^(*)$ costs at most $C K$ in trace norm, by (9.24). Symmetry of $A$ makes the resulting internal expression exactly
  #[#set math.equation(numbering: n => "(9.26)")
   $ 1 / 2 sum_(i \, j in I) \| A_(i j) \|^2 \| F \( i \) - F \( j \) \|^2 + sum_(i in I) \| F \( i \) \|^2 (1 - sum_(j in I) \| A_(i j) \|^2) . $ <van:internal-positive>]
  The second term is nonnegative, since $A$ is a contraction. The first is at least $c_1 d \/ 2$ on $cal(G)$.
  For the external part, put
  $ delta_A = ∥A_(I J)∥_(upright("HS")) + sum_nu ∥A_(I J) F_nu \|_J∥_(upright("HS")) . $
  Symmetry and (9.24) give
  $ ∥\( A^(- 1) \)_(J I)∥_(upright("HS")) lt.eq ∥A_(I J)∥_(upright("HS")) + 2 K . $
  The external trace is consequently bounded in modulus by $C delta_A \( delta_A + K \)$. Choose $kappa$ so that the internal replacement error is less than $c_1 d \/ 8$. After the choices in 34, choose $C_0$ so large that (9.15) makes the external error less than $c_1 d \/ 8$. The real part of (9.25) is then at least $c_1 d \/ 4$. Combining with $\| det A \| gt.eq sqrt(1 - kappa)$ proves (9.22).
  For the boundary moment, expand the trace using $S_z = A + Delta$. The part $H_A$ with $A \, A^(*)$ has a bounded modulus on $cal(G)$. Indeed its internal part is (9.26), whose first term is bounded by $C_1 \/ 2$, and
  $ sum_(i in I) (1 - sum_(j in I) \| A_(i j) \|^2) lt.eq K + ∥A_(I J)∥_(upright("HS"))^2 . $
  The external part is bounded using (9.15). All these bounds involve only the fixed cutoffs in 34.
  Consider a linear term, for one component,
  $ "tr" \( F_I Delta F A^(*) \) = "tr" #h(-0.16667em) [z \( 1 - z B \)^(- 1) D_F] \, #h(2em) D_F = T^top F A^(*) F_I T . $
  Its coefficient satisfies
  $ ∥D_F∥_1 lt.eq ∥T^top F A^(*)∥_(upright("HS")) ∥F_I T∥_(upright("HS")) lt.eq ∥F T∥_(upright("HS")) ∥F_I T∥_(upright("HS")) . $
  The other linear term is its complex conjugate on the circle. By 6, these terms have weak $L^1$ bounds depending only on $C_F$ and $kappa$, since $∥F_I T∥_(upright("HS")) lt.eq C sqrt(kappa)$.
  The quadratic term is bounded by
  $ \| "tr" \( F_I Delta F Delta^(*) \) \| lt.eq ∥F_I Delta∥_(upright("HS")) ∥Delta F∥_(upright("HS")) . $
  Again 6, with the respective sandwiches $\( F_I T \, T^top \)$ and $\( T \, T^top F \)$, gives weak $L^1$ bounds for each factor. A nonnegative random variable with weak $L^1$ bound $a$ has every moment $q < 1$ bounded by $C_q a^q$, by integration of its tail. Applying Cauchy–Schwarz with exponent $2 p < 1$ therefore bounds the $p$-moment of this product. There are four components and finitely many terms. Subadditivity at exponent $p < 1$ proves (9.23). The use of Hilbert-Schmidt products and trace norms makes the bounds independent of all matrix dimensions. ◻
]

=== 9.5 Changing the potential law under a bounded twist <changing-the-potential-law-under-a-bounded-twist>

The artificial profile vanishes at the support endpoints and belongs to $C^(1 \, 1) \( \[ - h \, h \] \)$. For sufficiently small $\| s \|$, the map

$ T_s \( v \) = v + s theta.alt \( v \) $

is therefore a diffeomorphism of $\[ - h \, h \]$ onto itself, with derivative at least $1 \/ 2$. If $r_s$ is the density of its pushforward of the uniform law relative to that same law, then

$ r_s \( y \) = frac(1, 1 + s theta.alt' \( T_s^(- 1) \( y \) \)) \, #h(2em) \| r_s - 1 \| lt.eq C \| s \| \, #h(2em) integral r_s thin thin upright(d) mu = 1 . $

Consequently

#[#set math.equation(numbering: n => "(9.27)")
 $ integral r_s^2 thin thin upright(d) mu = 1 + integral \( r_s - 1 \)^2 thin thin upright(d) mu lt.eq 1 + C s^2 . $ <van:single-density>]

Here $mu$ is the uniform law on $\[ - h \, h \]$.

Fix $W < oo$ and assume $\| s \| \/ tau lt.eq W$. Conditional on the offset and the test tile, change every true variable in $C$ by $T_s$ and leave all other true variables, selectors, and auxiliary uniforms unchanged. There are at most $C \( M_0 R \)^2$ changed sites. By independence and (9.27), the resulting joint law has a density $cal(D)_s$ relative to the original joint law with

#[#set math.equation(numbering: n => "(9.28)")
 $ ∥cal(D)_s∥_(L^2)^2 lt.eq exp \( C M_0^2 R^2 s^2 \) lt.eq exp \( C M_0^2 C_0^2 W^2 \) = D_W^2 . $ <van:joint-density>]

This also holds after averaging over the offset and the test tile. The bound is uniform in $m \, N$ once they are sufficiently large for the maps to be diffeomorphisms. Its constant may be large; only its independence of the later scales matters.

We next check why this change of true potentials reproduces the closed-probe system despite the potential-dependent hierarchy. This check concerns recomputed statuses, not an assumption that statuses are fixed by definition.

On $cal(P)$, selected tiles of level at least $m$ do not meet the test tile. Every tile of level below $m$ touching $C$ lies wholly in the thinned gap, since $b_m lt.double R$ and the annulus is separated from both retained regions by a distance comparable to $R$. Thus a selected tile capable of carrying an intermediate cell port is disjoint from $C$. Its own true variables, own corner labels, local likelihood, and reference potential are unchanged by the shift. Eligibility depends only on selectors and is unchanged as well.

There is one remaining possibility: a changed coordinate may alter the validity of an ancestor label used by a retained tile. Any such ancestor contains both the retained root and a coordinate in $C$. Their separation is at least a fixed multiple of $R$, so the ancestor side is at least $c R$. The probability that any such large tile has an invalid own label is bounded by

#[#set math.equation(numbering: n => "(9.29)")
 $ u_R = C_(M_0) sum_(b_l gt.eq c R) \( 1 + R \/ b_l \)^2 b_l^(- K_0) = o \( 1 \) . $ <van:gate-exception>]

This counts only tiles meeting $C$, which also covers every relevant changed triple. The original bound is uniform in the offset and torus size. After the shift the probability is at most $D_W sqrt(u_R)$ by (9.28). Exclude both events. All potentially changed ancestor validity tests are then valid before and after the shift. Ancestor box identities themselves need not be the same: the acceptance rules use those identities only through the validity gates, whereas each retained tile’s own box and likelihood are unchanged.

On the remaining part of $cal(P)$, all intermediate cell ports and references are therefore unchanged when the hierarchy is recomputed with the same selectors and auxiliary uniforms. Changes of acceptance inside the gap have no effect, because those ports have already been thinned, and $cal(P)$ excludes the larger ones. Before closure the real potentials on $C$ were the true ones; the only added terms there were the artificial absorbers. Hence Lemma 3.2, (9.18) imply that $H \( z \)$ is exactly the no-extra-probe intermediate trace $H^0$ evaluated at the shifted data. Almost-everywhere inverse statements suffice throughout.

Let $a_(n \, m \, N) = bb(E) \[ upright(bold(1))_(cal(P)) \| H^0 \| \]$ in the original law. Since $cal(P)$ uses only unchanged selectors, Markov’s inequality and (9.28) give, for every fixed $delta > 0$,

#[#set math.equation(numbering: n => "(9.30)")
 $ bb(P) { cal(G) \, med \| H \( z \) \| > delta } lt.eq e_R \( W \) + D_W (a_(n \, m \, N) / delta)^(1 \/ 2) \, #h(2em) \| s \| \/ tau lt.eq W \, $ <van:twist-probability>]

where one may take $e_R \( W \) = u_R + D_W sqrt(u_R)$. This tends to zero as $m$ grows at fixed $W \, M_0 \, C_0$. The estimate is uniform over bounded twists; it does not assert simultaneous invariance for all twists on a single realization. Only the probability bound for each twist will be integrated.

=== 9.6 The contradiction <the-contradiction>

#proof[
  Retain the assumption $d > 0$. Choose the constants in the following order. First fix the barrier constants $d_0 \, gamma$, then choose $kappa$ small enough for 35. Choose $M_0$ and the cutoffs $C_1 \, C_F$ using 34. Then choose $C_0$ sufficiently large for the same analytic lemma. All these choices precede $n \, m \, N$. They provide a fixed central lower bound $c_2 > 0$ and a fixed boundary moment bound $B_p$ on an event $cal(G)$ of probability at least $1 \/ 2$ once those scales are sufficiently large.
  Fix $0 < p' < p < 1 \/ 2$. Under Haar measure, $s \/ tau$ in (9.18) has the standard Cauchy law. Denote its tail probability beyond $W$ by $beta_W$, so $beta_W arrow.r 0$. Apply Hölder’s inequality on the product of the underlying probability space and the circle. The pointwise good-data bound (9.23) gives
  #[#set math.equation(numbering: n => "(9.31)")
   $ & bb(E) [upright(bold(1))_(cal(G)) integral_(bb(T)) \| H \( z \) \|^(p') thin thin upright(d) gamma_(bb(T)) \( z \)]\
 & quad lt.eq delta^(p') + B_p^(p' \/ p) [beta_W^(1 - p' \/ p) + {e_R \( W \) + D_W (a_(n \, m \, N) / delta)^(1 \/ 2)}^(1 - p' \/ p)] . $ <van:small-boundary>]
  For completeness, the first term covers $\| H \| lt.eq delta$. The Haar tail costs the first Hölder term. On the bounded-twist part, (9.30) bounds the product measure of ${ cal(G) \, \| H \| > delta }$, and the same $p$-moment bound gives the second Hölder term. Tonelli’s theorem applies to these nonnegative quantities; no realization-wise uniformity in the twist is used.
  The right side can be made smaller than $c_2^(p') \/ 4$. To see the order without interchanging limits, first choose $W$ so the tail term is small, then choose $delta$ so $delta^(p')$ is small. With these fixed, $D_W$ is a fixed finite constant. Choose the tolerance in 32 sufficiently small relative to $D_W$ and $delta$. Take $n$ large for that adjustment and the good-data requirements; then take $m$ large for all fixed-$n$ spatial estimates, the probe-strength constraint, and $e_R \( W \)$; finally take $N$ large for the finite-torus approximations at this fixed pair. Increasing $m \, N$ as required preserves the preceding assertions. Thus (9.31) is indeed less than $c_2^(p') \/ 4$.
  On the other hand, $\| frak(h) \|^(p')$ is subharmonic in the disk. For example, one may first use the nonnegative Laplacian of $\( \| frak(h) \|^2 + epsilon.alt \)^(p' \/ 2)$ and then let $epsilon.alt arrow.b 0$. The continuous boundary extension and (9.21), (9.22) give on every good realization
  $ integral_(bb(T)) \| H \( z \) \|^(p') thin thin upright(d) gamma_(bb(T)) \( z \) = integral_(bb(T)) \| frak(h) \( z \) \|^(p') thin thin upright(d) gamma_(bb(T)) \( z \) gt.eq \| frak(h) \( 0 \) \|^(p') gt.eq c_2^(p') . $
  Taking the expectation over $cal(G)$ gives a lower bound $c_2^(p') \/ 2$, contradicting the preceding upper bound. Therefore $d = 0$. ◻
]

== 10 A fixed-energy fractional-moment estimate <sec:bootstrap>

We return to the true product law and remove the hierarchy from the operator whose decay is to be estimated. Throughout this section, $h > 0$ and $E in \( - 4 - h \, 4 + h \)$ are fixed. All choices may depend on these two parameters. Distance means the shortest-coordinate max-norm distance on the torus $bb(T)_N^2 = \( bb(Z) \/ b_N bb(Z) \)^2$. The notation for the probe sets below is local to this section.

#thm([Theorem 10.1.])[
  (True torus Green function).  #emph[Fix $0 < s < 1 \/ 16$. There are constants $A = A \( h \, E \, s \) < oo$, $a = a \( h \, E \, s \) > 0$, and an integer $N_0 = N_0 \( h \, E \, s \)$ such that, for every $N gt.eq N_0$ and every $x \, y in bb(T)_N^2$, 
#[#set math.equation(numbering: n => "(10.1)")
 $ bb(E) lr(|\( H_N - E \)_(x y)^(- 1)|)^(s \/ 2) lt.eq A exp { - a "dist" \( x \, y \) } . $ <boot:real-decay>]

 Here $H_N$ has the true iid uniform $\[ - h \, h \]$ diagonal and periodic nearest-neighbor hopping. Its inverse at the specified real energy exists almost surely. No uniformity in $E$, nor any statement about time evolution, is part of this theorem.]
] <boot:fractional>

We prove the theorem by first retaining arbitrary deterministic masks of artificial probes. At each site a mask prescribes absence, strength $tau$, or strength $tau theta.alt \( v_i \)$, with at most one probe per site. The profile $theta.alt$ is the one fixed earlier; in particular it equals one on $\[ - h \/ 2 \, h \/ 2 \]$, is $C^(1 \, 1)$, and vanishes quadratically only at the endpoints of the potential interval. Write $eta_i$ for a prescribed positive probe strength and let $Y$ have columns $sqrt(eta_i) e_i$. In this section

$ G = \( H_N - E - i Y Y^top \)^(- 1) \, #h(2em) S = 1 + 2 i Y^top G Y . $

Thus $S$ is symmetric and unitary, and $Y^top G Y$ is a contraction by 2. All exceptional algebraic singularities below can be discarded under the continuous product law.

The parameter order is

#[#set math.equation(numbering: n => "(10.2)")
 $ s \, med d_0 \, med C_0 \, med n \, med m \, med N \, #h(2em) R = floor.l exp \( b_m^2 \) floor.r \, #h(2em) tau = C_0 \/ R . $ <boot:order>]

The barrier threshold $d_0 > 0$ will be small; $C_0$ will be large. After they have been fixed, $n$ and then $m > n$ are made sufficiently large. Finally $N$ is sufficiently large in terms of all these choices; all ensuing estimates hold for every larger $N$. We always require $b_N > 100 R$ and $tau lt.eq 1$.

=== 10.1 Filling and twisting an annulus <filling-and-twisting-an-annulus>

Let $X \, Y'$ be arbitrary deterministic subsets of the probe sites in the radius-$R$ squares centered at $x \, y$, respectively, where $"dist" \( x \, y \) gt.eq 10 R$. Let

$ C = { i : 2 R lt.eq "dist" \( i \, x \) lt.eq 4 R } . $

Fill every previously unoccupied site of $C$ with a probe of strength $tau theta.alt \( v_i \)$, keeping existing probes and their strengths. The filled mask is again deterministic. Superscripts $upright("old")$ and $upright("fill")$ distinguish the resulting scattering matrices. Identify the probes in $C$ with their sites and put

$ U = ∥S_(C X)^(upright("fill"))∥_(upright("HS")) \, #h(2em) V = ∥S_(C Y')^(upright("fill"))∥_(upright("HS")) \, #h(2em) D = ∥S_(Y' X)^(upright("fill"))∥_(upright("HS")) . $

#thm([Lemma 10.2.])[
  (Mixture domination).  #emph[There is $C_s < oo$, independent of the masks, centers, $R \, N$, and $C_0 gt.eq 1$, such that 
#[#set math.equation(numbering: n => "(10.3)")
 $ bb(E) ∥S_(Y' X)^(upright("old"))∥_(upright("HS"))^s lt.eq C_s \( 1 + C_0 \) bb(E) #scale(x: 120%, y: 120%)[\[] D^s + V^s U^s #scale(x: 120%, y: 120%)[\]] . $ <boot:twist-ineq>]

 As everywhere in this section, the constant may depend on the fixed $h \, E \, s$ and profile.]
] <boot:twist>

#proof[
  Close just the newly added probes using a common Haar phase $z$. The closure identity in 3 and the sandwich estimate in 6, followed by integration of the weak $L^1$ tail, give
  $ integral ∥\( S_z \)_(Y' X)∥_(upright("HS"))^s thin thin upright(d) z lt.eq C_s \( D^s + V^s U^s \) . $
  Here $thin upright(d) z$ is normalized Haar measure, and the blocks linking the new probes to $X \, Y'$ are subblocks of those defining $U \, V$. The corresponding real closing shift at each newly occupied site is $w theta.alt \( v_i \)$, where $w$ has density
  $ frac(tau, pi \( w^2 + tau^2 \)) . $
  Only newly occupied sites are shifted, so after closing we have precisely the old mask evaluated at these shifted true potentials.
  For $lr(||) w lt.eq c \/ R$, with fixed sufficiently small $c > 0$, the map $T_w \( v \) = v + w theta.alt \( v \)$ is a diffeomorphism of $\[ - h \, h \]$ onto itself. If $u = T_w \( v \)$, its pushforward density relative to the uniform law is $r_w \( u \) = \( 1 + w theta.alt' \( v \) \)^(- 1)$. Uniformly in $u$,
  $ log r_w \( u \) = - w theta.alt' \( u \) + O \( w^2 \) . $
  This follows from the inverse Jacobian and the Lipschitz continuity of $theta.alt'$. There are at most $K R^2$ shifted sites, so at each fixed output configuration the joint density satisfies
  $ log product_i r_w \( u_i \) = - w sum_i theta.alt' \( u_i \) + O \( R^2 w^2 \) . $
  Choose the half interval $\[ 0 \, c \/ R \]$ or $\[ - c \/ R \, 0 \]$ on which the linear term is nonnegative. On this entire half interval the joint density is at least a fixed positive constant. Its Cauchy probability is
  $ 1 / pi arctan c / C_0 gt.eq frac(c_1, 1 + C_0) . $
  Consequently the full shifted mixture dominates $c_2 \( 1 + C_0 \)^(- 1)$ times the true product law, pointwise in the output configuration. Applying this domination to the nonnegative old-mask block power and then averaging the Haar estimate proves the claim. ◻
]

We seek a bound by an arbitrarily small multiple of $bb(E) V^s$. Thus (10.3) leaves two tasks: attenuate $D$ across the filled annulus, and combine a small mean return $U$ with a resampling bound for $U^s V^s$. An unweighted estimate for barrier failure would not suffice when $bb(E) V^s$ is small. We therefore control that failure also under the $V^s$-weighted law.

=== 10.2 Two barriers under a transmission tilt <two-barriers-under-a-transmission-tilt>

Call a site good when $theta.alt \( v_i \) gt.eq d_0$. Give cost one to an edge precisely when both endpoints are good and both radii about $x$ belong to $\[ 2.2 R \, 2.8 R \]$; all other edges have cost zero. Let $d_(upright("in"))$ be the associated path-cost distance from the radius-$2 R$ square. Independently of this definition, count good-good edges with both radii in $\[ 3.2 R \, 3.8 R \]$, and let $d_(upright("out"))$ be the resulting distance from ${ i : "dist" \( i \, x \) gt.eq 4 R }$. Integer roundings of the four band boundaries make no difference to the constants. For a sufficiently small absolute $gamma > 0$, define

#[#set math.equation(numbering: n => "(10.4)")
 $ cal(B) = mat(delim: "{", d_(upright("in")) \( i \) gt.eq gamma R, upright("if ") "dist" \( i \, x \) gt.eq 3 R \,; d_(upright("out")) \( i \) gt.eq gamma R, upright("if ") "dist" \( i \, x \) lt.eq 3 R .) . $ <boot:barrier-event>]

These two strictly buffered bands will allow separate resampling of the inside and outside of radius $3 R$.

#thm([Lemma 10.3.])[
  (Uniform one-site estimates under tilt).  #emph[Suppose $bb(E) V^s > 0$, and define the probability law 
$ thin upright(d) nu = frac(V^s, bb(E) V^s) thin thin upright(d) bb(P) . $

 For a site $i in C$, conditional on all other potentials, put $W \( v_i \) = V^s$. Then 
#[#set math.equation(numbering: n => "(10.5)")
 $ #scale(x: 120%, y: 120%)[\(] bb(E)_i W^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq K_s bb(E)_i W \, $ <boot:l2l1>]

 with a constant uniform in every frozen exterior and in the mask. For $d_0 > 0$ sufficiently small, chosen after $s$ and before $C_0$, there are $K \, c > 0$ such that 
#[#set math.equation(numbering: n => "(10.6)")
 $ bb(P) \( cal(B)^c \) + nu \( cal(B)^c \) lt.eq K e^(- c R) \, #h(2em) bb(E)_nu d_min^(- 2 s) lt.eq K R^2 \, #h(2em) d_min = min_(i in C) theta.alt \( v_i \) . $ <boot:tilted-barriers>]

 No independence under $nu$ is asserted or needed.]
] <boot:tilted>

#proof[
  Fix all variables except $v = v_i$, and write the probe factor at $i$ as $a \( v \) in { 1 \, theta.alt \( v \) }$. Schur complementation at $i$ expresses the other rows and the row at $i$ of the block defining $V$ in the form
  $ A' + frac(D', v - i tau a \( v \) - w_(*)) \, #h(2em) frac(D'' sqrt(a \( v \)), v - i tau a \( v \) - w_(*)) \, #h(2em) Im w_(*) gt.eq 0 . $
  The coefficients are fixed matrices of compatible sizes. Passivity gives the sign of $Im w_(*)$. The deleted physical-site system is invertible almost surely: the imaginary part forces a kernel vector to vanish at all remaining probe sites, so it would lie in the kernel of the true real restriction, whose nonzero determinant polynomial vanishes only on a product-law null set. Writing both rows over their common denominator, their joint numerator is
  $ N \( v \) = #scale(x: 120%, y: 120%)[\(] \( v - i tau a \( v \) - w_(*) \) A' + D' \, med D'' sqrt(a \( v \)) #scale(x: 120%, y: 120%)[\)] . $
  On the plateau $P = \[ - h \/ 2 \, h \/ 2 \]$, this is the affine vector $N_P \( v \) = \( v A' + B \, D'' \)$, where $B = D' - \( i tau + w_(*) \) A'$. If $M = max_(v in P) ∥N_P \( v \)∥_(upright("HS"))$, then
  $ ∥A'∥_(upright("HS")) lt.eq 2 M \/ h \, #h(2em) ∥\( B \, D'' \)∥_(upright("HS")) lt.eq M \, #h(2em) sup_(\[ - h \, h \]) ∥N \( v \)∥_(upright("HS")) lt.eq K_h M . $
  Moreover an interval in $P$ of length at least $h \/ 4$, adjacent to an endpoint attaining the maximum, has numerator norm at least $M \/ 2$. This uses the displayed slope bound. If $M = 0$, the entire block vanishes and the claimed inequality is immediate.
  Put $b \( v \) = v - i tau a \( v \) - w_(*)$. Its modulus is at most $K_h \( 1 + lr(|w_(*)|) \)$. For every $0 < q < 1$,
  #[#set math.equation(numbering: n => "(10.7)")
   $ bb(E)_i lr(|b \( v \)|)^(- q) lt.eq K_(h \, q) \( 1 + lr(|w_(*)|) \)^(- q) . $ <boot:denominator>]
  Indeed, for bounded $w_(*)$ use $lr(|b \( v \)|) gt.eq lr(|v - Re w_(*)|)$ and integrate the one-dimensional singularity; for $lr(|w_(*)|)$ sufficiently large use $lr(|b \( v \)|) gt.eq lr(|w_(*)|) - h - 1$. Hence
  $ bb(E)_i W gt.eq c_(h \, s) (frac(M, 1 + lr(|w_(*)|)))^s \, #h(2em) bb(E)_i W^2 lt.eq K_(h \, s) (frac(M, 1 + lr(|w_(*)|)))^(2 s) . $
  This proves (10.5), uniformly even for arbitrarily large exterior impedance.
  For any measurable single-site set $A$, Cauchy–Schwarz now gives
  $ nu \( v_i in A divides \( v_j \)_(j eq.not i) \) lt.eq K_s bb(P) \( v_i in A \)^(1 \/ 2) $
  whenever the conditional normalizing mean is positive. The remaining conditional configurations have zero $nu$-measure. In particular the right side for $A = { theta.alt < d_0 }$ tends to zero with $d_0$, uniformly in the conditioning. Iterating this estimate over any fixed set of distinct sites bounds the probability that all of them are bad by $beta^k$, where $beta$ can be made arbitrarily small.
  A failure of either barrier gives, after trimming to intermediate radii and erasing loops, a simple path in the corresponding band of length $j gt.eq c_3 R$ and cost less than $gamma R$. For $gamma$ small, a fixed positive fraction of its edges are not good-good. Since the path is simple, this forces at least $c_4 j$ distinct bad sites. There are at most $K R^2 4^j$ candidate paths of length $j$, and at most $2^(j + 1)$ subsets of their vertices. Choose $d_0$ so that $8 beta^(c_4) < 1$. Summing the resulting geometric series for $j gt.eq c_3 R$ proves the tilted exponential bound. The same argument with the original independent site probabilities proves the untilted bound.
  Finally, the same conditional Cauchy–Schwarz estimate gives
  $ bb(E)_nu \[ theta.alt \( v_i \)^(- 2 s) divides \( v_j \)_(j eq.not i) \] lt.eq K_s #scale(x: 120%, y: 120%)[\(] bb(E)_i theta.alt \( v_i \)^(- 4 s) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq K . $
  The integral is finite because $theta.alt$ vanishes quadratically and $8 s < 1$. Since $d_min^(- 2 s) lt.eq sum_(i in C) theta.alt \( v_i \)^(- 2 s)$ and $lr(||) C lt.eq K R^2$, this proves the last assertion. ◻
]

=== 10.3 Cutoffs and the small return estimate <cutoffs-and-the-small-return-estimate>

We record explicitly the consequence of 33 that will be used several times. Suppose $Psi = G Y_J$ is a matrix of fields sourced at a probe set $J$, and a scalar cutoff $chi$ changes only across edges whose two endpoints belong to $C$ and carry probes of strengths at least $tau d$. If $lr(|chi_i - chi_j|) lt.eq L$, then the hopping commutator can be written as a probe source:

#[#set math.equation(numbering: n => "(10.8)")
 $ \[ H_N \, chi \] Psi = Y_C B_chi \, #h(2em) ∥B_chi∥_(upright("HS")) lt.eq frac(K L, tau d) ∥Y_C^top Psi∥_(upright("HS")) . $ <boot:commutator>]

Only endpoints of changing edges need be included on the right. Indeed, in the coefficient at an endpoint one divides by its square root strength, and replaces each neighboring field by its absorbed field divided by that neighbor’s square root strength. Bounded lattice degree gives the stated operator bound. Ward then yields

#[#set math.equation(numbering: n => "(10.9)")
 $ ∥Y^top G \[ H_N \, chi \] Psi∥_(upright("HS")) lt.eq ∥B_chi∥_(upright("HS")) . $ <boot:cutoff-ward>]

The output here includes #emph[all] probes. These estimates also compare two systems agreeing on the cutoff support and its changing edges: cut off a field of the first system and correct its commutator residual in the second. No estimate on the exterior resolvent is involved.

#thm([Lemma 10.4.])[
  (Small return to a filled annulus).  #emph[For each fixed sufficiently large $C_0$ and each $epsilon.alt > 0$, one can choose $n$, then $m > n$, then a threshold for $N$, so that 
$ bb(E) U^2 < epsilon.alt $

 for every subsequent $N$, every deterministic mask, every center, and every permitted subset $X$.]
] <boot:return>

#proof[
  Carry the filled artificial mask through the auxiliary hierarchy. Take a scalar voltage $f_R$ equal to one on the radius-$R$ square, zero at radii at least $2 R$, and Lipschitz with constant $K \/ R$. By 29, at fixed $n$,
  $ bb(E) cal(Q)_(n \, N) \( f_R \) lt.eq K d_n + o_(m \, N \; n \, C_0) \( 1 \) . $
  Apply 21 to thin to uniform stage $m$. The profile is supported in the radius-$2 R$ square and has Lipschitz constant $K \/ R$, while $b_m lt.double R$. Thus 23(ii) bounds its unnormalized charge by $K r_n$, where $r_n = sum_(l gt.eq n) q_l p_l arrow.r 0$, independently of $R$. Writing $U_m$ for the same artificial-probe block at stage $m$, we obtain
  #[#set math.equation(numbering: n => "(10.10)")
   $ bb(E) U_m^2 lt.eq K d_n + o_(n arrow.r oo) \( 1 \) + o_(m \, N \; n \, C_0) \( 1 \) . $ <boot:return-stage>]
  Each probe pair contributing to $U_m^2$ has unit squared voltage difference and is counted in both directions in $cal(Q)$, canceling its factor $1 \/ 2$. The artificial probes are allowed in the comparison because $C_0 \/ R lt.eq exp \( - c_(*) b_m \)$ for sufficiently large $m$.
  Let $cal(A)$ be the event that no selected tile of level at least $m$ meets the radius-$5 R$ square. Tile counting gives
  $ bb(P) \( cal(A)^c \) lt.eq K sum_(l gt.eq m) \( 1 + R \/ b_l \)^2 e^(- b_l^6) = o \( R^(- 4) \) . $
  For example each fixed polynomial loss in $R$ is dominated by $exp \( - b_m^6 \)$, since $log R tilde.op b_m^2$. On $cal(A)$, the stage-$m$ and true filled coefficients and probes coincide throughout this square. On $cal(B)$ use
  $ chi = \( 1 - d_(upright("in")) \/ \( gamma R \) \)_(+) . $
  It equals one on $X$, vanishes outside radius $3 R$, and changes only on shared good-good edges. Cut off stage-$m$ fields sourced at $X$, and correct in the true system using (10.8), (10.9). Since $R tau = C_0$,
  $ U lt.eq (1 + frac(K, C_0 d_0)) U_m quad upright("on ") cal(A) ∩ cal(B) . $
  Always $U^2 lt.eq lr(||) X lt.eq K R^2$, by unitarity. The exceptional contribution is therefore $o \( 1 \)$, by the preceding hazard estimate and the product-law path count in the proof of 38. That count does not require $bb(E) V^s > 0$. Now $d_n arrow.r 0$ by 31; choosing $n \, m \, N$ in order in (10.10) proves the assertion. The error notation means that at fixed $n \, C_0$, any desired tolerance holds for all sufficiently large $m$, and then for all $N$ above a threshold depending on $m$. It asserts no rate uniform in $n$. ◻
]

=== 10.4 Direct transmission and independent resampling <direct-transmission-and-independent-resampling>

We next prove two pointwise estimates:

#[#set math.equation(numbering: n => "(10.11)")
 $ D lt.eq K d_min^(- 1) V quad upright("almost surely") \, #h(2em) D lt.eq K e^(- c C_0) V quad upright("on ") cal(B) . $ <boot:direct>]

For the first, use fields sourced at $Y'$, symmetry of $S$, and a cutoff equal to one inside radius $2 R$, zero outside radius $4 R$, with gradient at most $K \/ R$. Its source term vanishes, while both endpoints of every changing edge have strength at least $tau d_min$. (10.8), (10.9) give $D lt.eq K \( R tau d_min \)^(- 1) V$; here $C_0 gt.eq 1$. In particular, if $bb(E) V^s = 0$, then $D = 0$ almost surely, and no tilted law is required.

For the improved estimate choose an integer

$ ell = ⌈frac(K_1, tau d_0)⌉ $

with $K_1$ sufficiently large. For $j gt.eq 1$ use the cutoff

$ chi_j \( i \) = min {1 \, frac(\( d_(upright("out")) \( i \) - \( j - 1 \) ell \)_(+), ell)} . $

All original sources have $d_(upright("out")) = 0$. Nonzero gradients have both endpoint distances at least $\( j - 1 \) ell$, because cost distances are integer valued and change by at most one across an edge. Gradients only occur on counted good-good edges in the outer band. For the field $Psi = G^(upright("fill")) Y_(Y')$, put

$ A_j = ∥upright(bold(1))_({ d_(upright("out")) gt.eq j ell }) Y^top Psi∥_(upright("HS")) \, #h(2em) B_j = ∥upright(bold(1))_(C ∩ { d_(upright("out")) gt.eq j ell }) Y^top Psi∥_(upright("HS")) . $

The cutoff equations and Ward give

$ A_j lt.eq frac(K, ell tau d_0) B_(j - 1) lt.eq 1 / 2 B_(j - 1) \, #h(2em) B_j lt.eq A_j . $

Start with $B_0 = V \/ 2$. On $cal(B)$, the set $X$ has $d_(upright("out")) gt.eq gamma R$, so it remains beyond every one of the $floor.l gamma R \/ ell floor.r$ cutoffs. For sufficiently large fixed $C_0$, followed by sufficiently large $R$, this number is at least $c \( d_0 \) C_0$. The iteration proves the second estimate in (10.11). Notice that $A_j$ includes every absorbed output, including $X$; the proof does not require $X subset C$.

To separate the product $V^s U^s$, enlarge the probability space with two independent fresh families of true potentials. Let $A = { i : "dist" \( i \, x \) < 3 R }$. Form one comparison configuration by retaining the original potentials on $A^c$ and replacing those on $A$ by the first fresh family. Form a second by retaining the original potentials on $A$ and replacing those on $A^c$ by the second fresh family. Keep the filled deterministic mask in both configurations, and recompute its strengths from the corresponding potentials. Denote the first configuration’s transmission to $Y'$ by $V^(upright("ext"))$, and the second’s transmission from $X$ by $U^(upright("int"))$.

On $cal(B)$, the cutoff $\( 1 - d_(upright("out")) \/ \( gamma R \) \)_(+)$ is supported in the shared exterior $A^c$, equals one on $Y'$, and has all changing edges in its buffered outer band. Applying it to the fresh-interior fields and correcting in the original system proves

$ V lt.eq (1 + frac(K, C_0 d_0)) V^(upright("ext")) . $

Likewise $\( 1 - d_(upright("in")) \/ \( gamma R \) \)_(+)$ is supported in the shared interior $A$ and gives

$ U lt.eq (1 + frac(K, C_0 d_0)) U^(upright("int")) . $

Take $C_0$ large enough that both factors are at most two. The two comparison configurations are independent #emph[unconditionally]: they use disjoint parts of the original product sample and independent fresh families. Each has the original true product distribution. Dropping $upright(bold(1))_(cal(B))$ before factoring therefore yields

#[#set math.equation(numbering: n => "(10.12)")
 $ bb(E) \[ upright(bold(1))_(cal(B)) V^s U^s \] lt.eq 2^(2 s) bb(E) V^s thin bb(E) U^s lt.eq 2^(2 s) bb(E) V^s \( bb(E) U^2 \)^(s \/ 2) . $ <boot:factorization>]

This factorization makes no assertion of independence conditional on the original barrier event.

The exceptional event is controlled under the tilted law from 38. Unitarity gives $U lt.eq K R$, and (10.11), (10.6) give, respectively,

$ frac(bb(E) \[ upright(bold(1))_(cal(B)^c) V^s U^s \], bb(E) V^s) & lt.eq K R^s nu \( cal(B)^c \) \,\
frac(bb(E) \[ upright(bold(1))_(cal(B)^c) D^s \], bb(E) V^s) & lt.eq K bb(E)_nu \[ upright(bold(1))_(cal(B)^c) d_min^(- s) \]\
 & lt.eq K \( bb(E)_nu d_min^(- 2 s) \)^(1 \/ 2) nu \( cal(B)^c \)^(1 \/ 2) lt.eq K R e^(- c R \/ 2) . $

Both quantities tend to zero uniformly over all the prescriptions. Combining these estimates with 37, we obtain

#[#set math.equation(numbering: n => "(10.13)")
 $ bb(E) ∥S_(Y' X)^(upright("old"))∥_(upright("HS"))^s lt.eq K_s \( 1 + C_0 \) [e^(- s c C_0) + \( bb(E) U^2 \)^(s \/ 2) + epsilon.alt_R] bb(E) V^s \, #h(2em) epsilon.alt_R arrow.r 0 . $ <boot:one-step>]

The constants $K_s \, c > 0$ are independent of large $C_0$. First choose $C_0$ to make its exponential term small, then use 39 with $n \, m \, N$ in order to make the return term small, and enlarge $m \, N$ as necessary for $epsilon.alt_R$. Thus the entire multiplier can be made arbitrarily small. These are uniform expectation bounds for each choice of mask and centers; no simultaneous good event over all choices is needed.

=== 10.5 Contraction over all masks <contraction-over-all-masks>

The passage from finite-scale smallness to exponential fractional-moment decay parallels the finite-volume criteria of [4]. We prove the contraction here for the probe transmission moments and deterministic masks.

#thm([Proposition 10.5.])[
  (Uniform mask contraction).  #emph[For fixed $h \, E \, s$, parameters through $R$ and an integer $N_0$ can be chosen so that, for every $N gt.eq N_0$, 
$ F_N \( r \) lt.eq 1 / 2 F_N \( r - 4 R \) \, #h(2em) r gt.eq 10 R . $

 Here $F_N \( r \)$ is the supremum of $bb(E) ∥S_(Y' X)∥_(upright("HS"))^s$ over all deterministic artificial masks, all subsets $X \, Y'$ lying in radius-$R$ squares, and all centers at distance at least $r$. A supremum over an empty family is zero. Consequently there are constants $K \, a_1 > 0$, independent of $N gt.eq N_0$, such that 
#[#set math.equation(numbering: n => "(10.14)")
 $ F_N \( r \) lt.eq K R^s e^(- a_1 r \/ R) \, #h(2em) r gt.eq 0 . $ <boot:mask-decay>]

]
] <boot:contraction>

#proof[
  Partition $C$ into at most $J$ sets $C_k$, each contained in a radius-$R$ square with center in $C$; $J$ is an absolute constant. Then
  $ V^s = (sum_(k = 1)^J ∥S_(C_k Y')^(upright("fill"))∥_(upright("HS"))^2)^(s \/ 2) lt.eq sum_(k = 1)^J ∥S_(C_k Y')^(upright("fill"))∥_(upright("HS"))^s . $
  Each new center is at distance at least $r - 4 R$ from $y$. The filled model is included in the same mask class. Choose the multiplier in (10.13) at most $1 \/ \( 2 J \)$ and take suprema, using symmetry to interchange the two block roles when necessary. This proves the contraction. Always $F_N \( r \) lt.eq K R^s$ by unitarity and the rank of a radius-$R$ input set. Iterating in steps of $4 R$ until the argument falls below $10 R$ proves (10.14). All thresholds were fixed before taking the supremum and are valid on every sufficiently large torus. ◻
]

=== 10.6 Removing the two endpoint probes <removing-the-two-endpoint-probes>

Choose a mask consisting only of two constant-strength probes $tau$ at distinct sites $x \, y$. Let $G^0 = \( H_N - E \)^(- 1)$, and let $g$ be its two-by-two compression to ${ x \, y }$. Resolvent subtraction gives the damped compression

$ g^(upright("damp")) = \( 1 - i tau g \)^(- 1) g . $

For a symmetric two-by-two matrix, direct multiplication by the adjugate shows

$ \( g^(upright("damp")) \)_(x y) = frac(g_(x y), det \( 1 - i tau g \)) . $

Since $S_(x y) = 2 i tau \( g^(upright("damp")) \)_(x y)$, the exact identity is

#[#set math.equation(numbering: n => "(10.15)")
 $ G_(x y)^0 = frac(S_(x y), 2 i tau) det \( 1 - i tau g \) . $ <boot:endpoint-identity>]

For completeness, the moments needed to remove the determinant are uniform in the exterior and the volume. Conditional on all other potentials, Schur complementation gives

$ g = \( A + "diag" \( v_x \, v_y \) \)^(- 1) $

with $A$ a fixed real symmetric matrix. Put $t = \( v_x + v_y \) \/ 2$, $u = \( v_x - v_y \) \/ 2$. The integration square becomes $lr(||) u lt.eq h$, $lr(||) t lt.eq h - lr(||) u$, with Jacobian two. For each fixed $u$, let $lambda_1 \( u \) \, lambda_2 \( u \)$ be the real eigenvalues of $A + "diag" \( u \, - u \)$. If $0 < q < 1$,

$ integral_(- \( h - lr(||) u \))^(h - lr(||) u) ∥\( A + "diag" \( u \, - u \) + t 1 \)^(- 1)∥^q thin thin upright(d) t lt.eq sum_(j = 1)^2 integral_(- h)^h lr(|t + lambda_j \( u \)|)^(- q) thin thin upright(d) t lt.eq K_q h^(1 - q) . $

Integration in $u$, with the normalized joint uniform density, therefore proves

#[#set math.equation(numbering: n => "(10.16)")
 $ bb(E) ∥∥ g^q lt.eq K_(h \, q) \, #h(2em) 0 < q < 1 . $ <boot:two-site>]

The bound is uniform over all real symmetric $A$, so no exterior norm enters. The deleted system is generically invertible; its exceptional set has zero product measure. A one-site Schur complement and the same scalar integral also give $bb(E) lr(|G_(x x)^0|)^q lt.eq K_(h \, q)$.

Since $lr(|det \( 1 - i tau g \)|) lt.eq \( 1 + tau ∥∥ g \)^2$, (10.16) with $q = 2 s < 1$ gives a uniform bound on $bb(E) lr(|det \( 1 - i tau g \)|)^s$. Apply Cauchy–Schwarz to (10.15):

$ bb(E) lr(|G_(x y)^0|)^(s \/ 2) lt.eq \( 2 tau \)^(- s \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) lr(|S_(x y)|)^s #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) lr(|det \( 1 - i tau g \)|)^s #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $

The first factor of expectations decays exponentially by (10.14), applied to singleton subsets. The diagonal is covered by the one-site bound. The now fixed $R \, tau$ and all constants are absorbed into $A \( h \, E \, s \)$ and $a \( h \, E \, s \) > 0$, proving 36. This conclusion remains a fixed-real-energy finite-volume estimate; the spectral passage uses it separately at each energy.

== 11 Infinite-volume spectral type <sec:spectral>

We now remove the fixed-energy restriction from the spectral conclusion. The probabilistic input is the true finite-torus estimate 36. We use the bounded self-adjoint spectral theorem and its Borel functional calculus in the form of [16] Theorems 3.1 and 3.7. We include the spectral-averaging step to make the quantifiers explicit; it is the rank-one mechanism of [15] Theorem 2’, Proposition 7 and Theorem 8(i).

#thm([Lemma 11.1.])[
  #emph[For every fixed $h > 0$, every fixed $E in \( - 4 - h \, 4 + h \)$ and every site $x in bb(Z)^2$, almost surely there is $u in ell^2 \( bb(Z)^2 \)$ such that 
$ \( H_v - E \) u = delta_x . $

 If $mu_x$ is the scalar spectral measure of $delta_x$, then almost surely 
#[#set math.equation(numbering: n => "(11.1)")
 $ Gamma_x \( E \) := integral_(bb(R)) frac(mu_x \( thin upright(d) e \), \( e - E \)^2) < oo . $ <spec:gamma>]

 The integrand is interpreted as $+ oo$ at $e = E$.]
] <spec:column>

#proof[
  Couple the torus of side $b_N$ to the infinite sample by taking the true potentials in the square of that side centered at $x$. Let $G_N \( E \)$ be its real Green matrix. By 36, there are fixed $q \, c \, C > 0$, with $q < 1$, such that for all sufficiently large $N$,
  $ bb(E) lr(|G_N \( E \)_(y x)|)^q lt.eq C exp \( - c lr(|y - x|)_oo \) . $
  The torus distance from $x$ equals the physical coordinate distance in this centered square. Hence for $0 < a < c$,
  $ sup_N bb(E) sum_(y upright(" in the square")) e^(a lr(|y - x|)_oo) lr(|G_N \( E \)_(y x)|)^q < oo \, $
  where the supremum may omit the finitely many smaller tori. Fatou implies that the liminf of these nonnegative sums is finite almost surely. Choose a subsequence on which they are bounded. Its coordinates are bounded, and a diagonal subsequence converges at every lattice site. Fatou for the counting measure gives a limit $u$ with finite weighted $ell^q$ sum. In particular $u in ell^2$: an $ell^q$ sequence is bounded, and $sum_y lr(|u_y|)^2 lt.eq ∥u∥_oo^(2 - q) sum_y lr(|u_y|)^q$. Every fixed nearest-neighbor equation eventually avoids the torus boundary, so the limit solves $\( H_v - E \) u = delta_x$.
  The bounded self-adjoint spectral theorem gives
  $ mu_x \( thin upright(d) e \) = \( e - E \)^2 mu_u \( thin upright(d) e \) \, $
  where $mu_u$ is the scalar spectral measure of $u$. Thus $mu_x \( { E } \) = 0$ and the integral in (11.1) is at most $∥u∥^2$. ◻
]

#thm([Lemma 11.2.])[
  (Rank-one spectral averaging).  #emph[Let $H_0$ be bounded self-adjoint and let $xi$ be a unit vector. For $a in bb(R)$, let $mu_a$ be the scalar spectral measure of $xi$ for $H_0 + a chevron.l xi \, dot.op chevron.r xi$. Then, as measures on $bb(R)$, 
#[#set math.equation(numbering: n => "(11.2)")
 $ integral_(bb(R)) mu_a thin upright(d) a lt.eq "Leb" . $ <spec:average>]

 Suppose on a Borel set $B$ the base measure $mu_0$ satisfies $integral \( e - E \)^(- 2) mu_0 \( thin upright(d) e \) < oo$ for Lebesgue-almost every $E in B$. For almost every $a$, the restriction of $mu_a$ to $B$ is concentrated on eigenvalues of the perturbed operator.]
] <spec:averaging>

#proof[
  For $"Im" z > 0$ write
  $ F \( z \) = integral frac(mu_0 \( thin upright(d) e \), e - z) \, #h(2em) F_a \( z \) = frac(F \( z \), 1 + a F \( z \)) . $
  The second identity follows from rank-one resolvent inversion. Since $"Im" F \( z \) > 0$, direct integration in $a$ gives $integral_(bb(R)) "Im" F_a \( z \) thin upright(d) a = pi$. For a nonnegative continuous compactly supported function $f$, integrate against $f \( "Re" z \)$, use Tonelli, and let $"Im" z arrow.b 0$. The normalized Poisson kernels are an approximate identity, and Fatou in $a$ gives
  $ integral_(bb(R)) integral_(bb(R)) f \( e \) mu_a \( thin upright(d) e \) thin upright(d) a lt.eq integral_(bb(R)) f \( e \) thin upright(d) e . $
  This proves (11.2).
  Let $B_0$ be the subset of $B$ where the base inverse-square integral is finite. It is Borel, and $B \\ B_0$ is Lebesgue null. Equation (11.2) shows that it has zero $mu_a$-measure for almost every $a$. At $E in B_0$, Cauchy–Schwarz and dominated convergence show that $F \( E + i 0 \)$ exists and is real. If $1 + a F \( E + i 0 \) eq.not 0$, then
  $ "Im" F_a \( E + i eta \) arrow.r 0 \, #h(2em) frac(mu_a \( \[ E - eta \, E + eta \] \), eta) lt.eq 2 "Im" F_a \( E + i eta \) arrow.r 0 . $
  For any finite Borel measure $mu$, the set of points where this last ratio tends to zero has $mu$-measure zero. To see this directly on a bounded interval, fix $epsilon > 0$ and restrict first to points where the ratios are at most $epsilon$ at every dyadic radius below a common threshold. At a finer dyadic mesh, each interval meeting this set lies in a centered interval of that radius at one of its points, so its measure is at most $epsilon$ times the mesh length. Summing gives at most a constant times $epsilon$ times the length of the bounded ambient interval. Increase the threshold sets to their union, then let $epsilon arrow.b 0$, and finally exhaust the real line.
  It remains to consider $E in B_0$ with $1 + a F \( E + i 0 \) = 0$. For each positive integer $k$, apply the bounded Borel multiplier $upright(bold(1))_({ \| e - E \| gt.eq 1 \/ k }) \( e - E \)^(- 1)$ for $H_0$ to $xi$. The inverse-square integral makes these vectors Cauchy in norm. Their limit $u$ satisfies
  $ \( H_0 - E \) u = xi \, #h(2em) chevron.l xi \, u chevron.r = F \( E + i 0 \) . $
  Indeed, the base spectral measure has no atom at $E$, so the truncated equations converge to $\( H_0 - E \) u = xi$ by boundedness of $H_0$. Cauchy–Schwarz gives the asserted inner product. Consequently
  $ \( H_0 + a chevron.l xi \, dot.op chevron.r xi - E \) u = \( 1 + a F \( E + i 0 \) \) xi = 0 . $
  The vector is nonzero because its base equation has a nonzero right side. Hence $E$ is an eigenvalue. All these eigenvectors belong to the closed cyclic subspace generated by $xi$ under $H_0$. This subspace is separable and invariant under the perturbed operator. Eigenvectors for distinct eigenvalues are orthogonal, so the energies obtained in this way form a countable set. The remaining scalar spectral mass is therefore pure point, as asserted. ◻
]

#thm([Proposition 11.3.])[
  #emph[For each fixed $h > 0$, almost surely every site spectral measure of $H_v$ is pure point. Consequently $H_v$ has pure-point spectral type and a complete orthonormal eigenbasis.]
] <spec:readout>

#proof[
  The property in (11.1) is jointly measurable in the true potential configuration and $E$. Indeed $∥H_v∥ lt.eq 4 + h$, and polynomial functional calculus followed by uniform approximation of continuous functions makes $v mapsto mu_x$ a Borel measure kernel. Integration of the nonnegative Borel kernel $\( e - E \)^(- 2)$ then gives the asserted joint measurability. This property no longer mentions any auxiliary port construction or its energy-dependent parameters.
  By 41 and Fubini, for almost every setting of the potentials away from $x$, almost every base value $v_x^0 in \[ - h \, h \]$ has finite $Gamma_x \( E \)$ for Lebesgue-almost every $E in \( - 4 - h \, 4 + h \)$. Fix such an exterior and one such base value. Varying $v_x$ corresponds to the rank-one parameter $a = v_x - v_x^0$. By 42, for almost every allowed $a$ the site measure is pure point on that open interval. The same averaging inequality removes the two endpoint energies. For every allowed $a$ the norm bound confines the spectrum to the closed interval, so the entire site measure is pure point.
  This conditional conclusion integrates to an almost-sure assertion. For completeness, purity of a scalar measure kernel is measurable: $\( v \, e \) mapsto mu_x \( v \) \( { e } \)$ is Borel by continuous approximations to the diagonal indicator, and its zero set has measurable $mu_x \( v \)$-mass. Purity is exactly the vanishing of that mass. Intersect now over the countable set of sites $x$. Each $delta_x$ lies in the closed pure-point subspace; their span is dense, so that subspace is the entire Hilbert space. Choosing orthonormal bases in the mutually orthogonal eigenspaces yields the required eigenbasis. We have not assumed that one site vector is cyclic for the full two-dimensional operator. ◻
]

#thm([Proposition 11.4.])[
  #emph[For each fixed $h > 0$, almost surely $sigma \( H_v \) = \[ - 4 - h \, 4 + h \]$. Under 43, the eigenvalues are dense in this interval.]
] <spec:spectrum>

#proof[
  The norm bound gives the inclusion into the displayed interval. For each prescribed constant in a countable dense subset of $\[ - h \, h \]$, each positive rational accuracy, and each integer box size, infinitely many independent disjoint-box trials have positive probability that every potential in the box is within that accuracy of the constant. Almost surely such boxes therefore occur; take the countable intersection over these choices.
  The free adjacency has plane waves with energies $2 cos k_1 + 2 cos k_2$, whose range is $\[ - 4 \, 4 \]$. Normalize a plane wave cut off to one of the large nearly constant boxes. The hopping error is supported within bounded distance of its boundary and has norm tending to zero because boundary size divided by box volume tends to zero. The diagonal error is at most the prescribed accuracy. Let size tend to infinity and accuracy to zero, using countable dense choices of the wave energies and the constants. The approximate eigenvector criterion puts a dense subset of $\[ - 4 - h \, 4 + h \]$ in the spectrum, and its closedness gives the entire interval.
  For an operator with a complete orthonormal eigenbasis, the spectrum is the closure of its eigenvalues: outside that closure the reciprocal of the diagonal eigenvalue differences defines a bounded inverse. The last assertion follows. Together with 43, this proves 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[E.~Abrahams, P.~W.~Anderson, D.~C.~Licciardello, and T.~V.~Ramakrishnan, #emph[Scaling theory of localization: Absence of quantum diffusion in two dimensions], Physical Review Letters #strong[42] (1979), no.~10, 673--676. #link("https://doi.org/10.1103/PhysRevLett.42.673")[doi:10.1103/PhysRevLett.42.673].]
#bibitem([2])[M.~Aizenman, A.~Elgart, S.~Naboko, J.~H.~Schenker, and G.~Stolz, #emph[Moment analysis for localization in random Schrödinger operators], Inventiones Mathematicae #strong[163] (2006), 343--413. #link("https://doi.org/10.1007/s00222-005-0463-y")[doi:10.1007/s00222-005-0463-y].]
#bibitem([3])[M.~Aizenman and S.~Molchanov, #emph[Localization at large disorder and at extreme energies: An elementary derivation], Communications in Mathematical Physics #strong[157] (1993), no.~2, 245--278. #link("https://doi.org/10.1007/BF02099760")[doi:10.1007/BF02099760].]
#bibitem([4])[M.~Aizenman, J.~H.~Schenker, R.~M.~Friedrich, and D.~Hundertmark, #emph[Finite-volume fractional-moment criteria for Anderson localization], Communications in Mathematical Physics #strong[224] (2001), 219--253. #link("https://doi.org/10.1007/s002200100441")[doi:10.1007/s002200100441].]
#bibitem([5])[P.~W.~Anderson, #emph[Absence of diffusion in certain random lattices], Physical Review #strong[109] (1958), no.~5, 1492--1505. #link("https://doi.org/10.1103/PhysRev.109.1492")[doi:10.1103/PhysRev.109.1492].]
#bibitem([6])[A.~Benedek, A.~P.~Calderón, and R.~Panzone, #emph[Convolution operators on Banach space valued functions], Proceedings of the National Academy of Sciences of the United States of America #strong[48] (1962), no.~3, 356--365. #link("https://doi.org/10.1073/pnas.48.3.356")[doi:10.1073/pnas.48.3.356].]
#bibitem([7])[A.~Black, R.~Drogin, and F.~Hernández, #emph[Self-consistent equations and quantum diffusion for the Anderson model], arXiv:2506.06468v2 (2025). #link("https://arxiv.org/abs/2506.06468v2")[Version 2, November 6, 2025].]
#bibitem([8])[J.~M.~Combes and L.~Thomas, #emph[Asymptotic behaviour of eigenfunctions for multiparticle Schrödinger operators], Communications in Mathematical Physics #strong[34] (1973), no.~4, 251--270. #link("https://doi.org/10.1007/BF01646473")[doi:10.1007/BF01646473].]
#bibitem([9])[F.~Delyon, Y.~Lévy, and B.~Souillard, #emph[Anderson localization for multi-dimensional systems at large disorder or large energy], Communications in Mathematical Physics #strong[100] (1985), no.~4, 463--470. #link("https://doi.org/10.1007/BF01217724")[doi:10.1007/BF01217724].]
#bibitem([10])[J.~Ding and C.~K.~Smart, #emph[Localization near the edge for the Anderson Bernoulli model on the two dimensional lattice], Inventiones Mathematicae #strong[219] (2020), 467--506. #link("https://arxiv.org/abs/1809.09041v3")[arXiv:1809.09041v3].]
#bibitem([11])[J.~Fröhlich, F.~Martinelli, E.~Scoppola, and T.~Spencer, #emph[Constructive proof of localization in the Anderson tight binding model], Communications in Mathematical Physics #strong[101] (1985), no.~1, 21--46. #link("https://doi.org/10.1007/BF01212355")[doi:10.1007/BF01212355].]
#bibitem([12])[J.~Fröhlich and T.~Spencer, #emph[Absence of diffusion in the Anderson tight binding model for large disorder or low energy], Communications in Mathematical Physics #strong[88] (1983), no.~2, 151--184. #link("https://doi.org/10.1007/BF01209475")[doi:10.1007/BF01209475].]
#bibitem([13])[O.~Hurtado, #emph[Localization and unique continuation for non-stationary Schrödinger operators on the 2D lattice], Communications in Mathematical Physics #strong[407] (2026), article~64. #link("https://doi.org/10.1007/s00220-026-05559-8")[doi:10.1007/s00220-026-05559-8].]
#bibitem([14])[B.~Simon, #emph[Schrödinger operators in the twenty-first century], in #emph[Mathematical Physics 2000], A.~Fokas, A.~Grigoryan, T.~Kibble, and B.~Zegarlinski (eds.), Imperial College Press, London, 2000, pp.~283--288. #link("https://math.caltech.edu/SimonPapers/R40.pdf")[Author-hosted published version].]
#bibitem([15])[B.~Simon and T.~Wolff, #emph[Singular continuous spectrum under rank one perturbations and localization for random Hamiltonians], Communications on Pure and Applied Mathematics #strong[39] (1986), no.~1, 75--90. #link("https://doi.org/10.1002/cpa.3160390105")[doi:10.1002/cpa.3160390105].]
#bibitem([16])[G.~Teschl, #emph[Mathematical Methods in Quantum Mechanics: With Applications to Schrödinger Operators], Graduate Studies in Mathematics #strong[99], American Mathematical Society, Providence, RI, 2009. #link("https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf")[Author-hosted first edition].]


