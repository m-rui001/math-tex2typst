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

#align(center)[#text(size: 16pt, weight: "bold")[Generalized Cartan--Hadamard isoperimetry \
and Euclidean equality rigidity]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A #emph[Cartan–Hadamard manifold] is a complete simply connected smooth Riemannian manifold with nonpositive sectional curvature. The generalized Cartan–Hadamard isoperimetric conjecture asserts that if its sectional curvature is at most $kappa lt.eq 0$, then every relatively compact smooth domain has boundary area at least that of the equal-volume ball in the simply connected space form of curvature $kappa$. This compares arbitrary domains, so geodesic-ball volume comparison alone does not suffice. We prove the conjecture in every dimension, for arbitrary measurable sets of finite volume and finite perimeter.

=== 1.1 The model comparison <the-model-comparison>

Write $omega_n$ for the volume of the unit ball in $bb(R)^n$, set $m = n - 1$, and put $s_m = \| bb(S)^m \| = n omega_n$. For $b gt.eq 0$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ "sn"_b \( r \) = cases(delim: "{", r \, & b = 0 \,, b^(- 1) sinh \( b r \) \, & b > 0 \,) #h(2em) "cs"_b \( r \) = "sn"'_b \( r \) . $ <eq:model-functions>]

The area and volume of a radius-$r$ ball in curvature $- b^2$ are

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(A)_b \( r \) = s_m "sn"_b \( r \)^m \, #h(2em) cal(V)_b \( r \) = s_m integral_0^r "sn"_b \( t \)^m thin d t . $ <eq:model-area-volume>]

Both functions increase continuously from zero to infinity. The model isoperimetric profile is

$ cal(I)_b \( V \) = cal(A)_b #scale(x: 120%, y: 120%)[\(] cal(V)_b^(- 1) \( V \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) V gt.eq 0 . $

In particular, $cal(I)_b \( 0 \) = 0$, and $cal(I)_b$ is continuous and strictly increasing on $\[ 0 \, oo \)$.

For a measurable set $E subset M$, its #emph[ambient perimeter] is

#[#set math.equation(numbering: n => "(1.3)")
 $ P_g \( E \) = \| D chi_E \|_g \( M \) = sup {integral_E "div"_g X thin d "Vol"_g : X in C_c^oo \( T M \) \, med \| X \|_g lt.eq 1} . $ <eq:ambient-perimeter>]

Here $chi_E$ is the indicator of $E$, and $\| D chi_E \|_g$ is its variation measure. A set has finite perimeter when this quantity is finite. Sets are identified up to ambient volume zero. For a relatively compact smooth domain, perimeter is its boundary area.

#thm([Theorem 1.1.])[
  #emph[Let $n gt.eq 2$, let $kappa lt.eq 0$, and let $\( M^n \, g \)$ be a complete simply connected smooth Riemannian manifold with $sec_g lt.eq kappa$. Every measurable set $E subset M$ with $"Vol"_g \( E \) < oo$ and $P_g \( E \) < oo$ satisfies 
$ P_g \( E \) gt.eq cal(I)_(sqrt(- kappa)) #scale(x: 120%, y: 120%)[\(] "Vol"_g \( E \) #scale(x: 120%, y: 120%)[\)] . $

]
] <thm:main>

For $kappa = 0$, the conclusion reads

$ P_g \( E \) gt.eq n omega_n^(1 \/ n) "Vol"_g \( E \)^(\( n - 1 \) \/ n) . $

For $kappa = - 1$, if $"Vol"_g \( E \) = n omega_n integral_0^r sinh^(n - 1) t thin d t$, it reads

$ P_g \( E \) gt.eq n omega_n sinh^(n - 1) r . $

The comparison concerns full ambient perimeter, including boundary on any confining sphere used in the proof. It applies to unbounded sets of finite volume as well as bounded ones. Balls in the model spaces attain the bounds.

The Euclidean equality case has the following classification.

#thm([Theorem 1.2.])[
  (Euclidean equality rigidity).  #emph[Let $\( M^n \, g \)$ be complete, simply connected and smooth, with $n gt.eq 2$ and $sec_g lt.eq 0$. Let $E subset M$ be bounded and measurable, with $0 < "Vol"_g \( E \) < oo$ and $P_g \( E \) < oo$. Then 
$ P_g \( E \) = n omega_n^(1 \/ n) "Vol"_g \( E \)^(\( n - 1 \) \/ n) $

 if and only if $E$ agrees up to ambient volume zero with an open region whose induced Riemannian metric is isometric to a round Euclidean ball.]
] <thm:equality>

Thus rigidity determines the metric on the entire equality region. It does not require the ambient manifold outside that region to be flat. Boundedness and positive volume belong to the equality theorem; Theorem 1 has the full finite-volume scope stated above.

=== 1.2 Model-ball spectral and torsional consequences <model-ball-spectral-and-torsional-consequences>

For a smooth relatively compact domain $D$ in a Riemannian manifold $\( M \, g \)$ and $1 < p < oo$, let $W_0^(1 \, p) \( D \)$ be the closure of $C_c^oo \( D \)$ in the Sobolev norm, and define

$ lambda_(1 \, p) \( D \) & = inf_(0 eq.not u in W_0^(1 \, p) \( D \)) frac(integral_D \| nabla_g u \|_g^p thin d "Vol"_g, integral_D \| u \|^p thin d "Vol"_g) \,\
T_p \( D \) & = sup_(0 eq.not u in W_0^(1 \, p) \( D \)) frac(#scale(x: 120%, y: 120%)[\(] integral_D \| u \| thin d "Vol"_g #scale(x: 120%, y: 120%)[\)]^p, integral_D \| nabla_g u \|_g^p thin d "Vol"_g) . $

The first is the Dirichlet variational value for $- Delta_(p \, g) u = lambda \| u \|^(p - 2) u$, where $Delta_(p \, g) u = "div"_g \( \| nabla_g u \|_g^(p - 2) nabla_g u \)$ is the unnormalized $p$-Laplacian. The second uses the quotient normalization of $p$-torsional rigidity in #cite(label("BrianiButtazzoPrinari2022")) (1.1)–(1.6).

#thm([Corollary 1.3.])[
  (Model-ball Faber–Krahn and Saint–Venant comparisons).  #emph[Let $n gt.eq 2$, $kappa lt.eq 0$ and $1 < p < oo$. Let $\( M^n \, g \)$ be complete, simply connected, smooth and without boundary, with $sec_g lt.eq kappa$. For a nonempty smooth domain $D subset.double M$, let $B_kappa \( \| D \| \)$ be a geodesic ball of volume $\| D \| = "Vol"_g \( D \)$ in the simply connected $n$-dimensional space form of curvature $kappa$. Then 
$ lambda_(1 \, p) \( D \) gt.eq lambda_(1 \, p) #scale(x: 120%, y: 120%)[\(] B_kappa \( \| D \| \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) T_p \( D \) lt.eq T_p #scale(x: 120%, y: 120%)[\(] B_kappa \( \| D \| \) #scale(x: 120%, y: 120%)[\)] . $

]
] <cor:model-ball-spectral>

Theorem 1 supplies the isoperimetric input for equimeasurable radial rearrangement into the model ball #cite(label("NobiliViolo2025")). This rearrangement preserves the $L^1$ and $L^p$ integrals and does not increase the $p$-Dirichlet energy, giving the two quotient comparisons. The proof appears in Section 9.

=== 1.3 History and related work <history-and-related-work>

The surface inequality originates in Weil’s work and the subharmonic-function approach of Beckenbach and Radó; Bol developed the comparison with nonzero model curvature #cite(label("Weil1926")) #cite(label("BeckenbachRado1933")) #cite(label("Bol1941")). We use the smooth surface formulation of Chavel and Feldman #cite(label("ChavelFeldman1980")). Kleiner proved the model comparison in dimension three, including its equality case #cite(label("Kleiner1992")) Theorem 2. Croke proved the sharp Euclidean comparison in dimension four #cite(label("Croke1984")). Kloeckner and Kuperberg subsequently developed optical and chord-based comparison methods in dimensions two and four; their four-dimensional negative-curvature comparison includes an explicit restriction on the domain’s chord length and the radius of its model ball #cite(label("KloecknerKuperberg2019")) Theorem 1.5.

A second line of work connects isoperimetry to total curvature. Ghomi and Spruck showed that, in a fixed Cartan–Hadamard $n$-manifold, the lower bound $integral_Gamma \| upright("GK") \| gt.eq s_(n - 1)$ for every closed convex $C^(1 \, 1)$ hypersurface $Gamma$ implies the Euclidean isoperimetric inequality for bounded positive-volume finite-perimeter sets, with equality only for regions isometric to Euclidean balls #cite(label("GhomiSpruck2022")) Theorem 7.1. Here $upright("GK")$ is the Gauss–Kronecker curvature, and such a convex hypersurface bounds a compact convex set with nonempty interior. Their analysis of minimizers confined to a geodesic ball includes the obstacle regularity that we use #cite(label("GhomiSpruck2022")) Lemma 7.2(i),(ii); this regularity lemma does not assume the total-curvature inequality. Ghomi and Stavroulakis prove an inequality for sufficiently small $C^2$ perturbations of a Euclidean ball metric with nonpositive curvature #cite(label("GhomiStavroulakis2026")). Their theorem concerns the metric on the ball itself and does not require an extension to a complete Cartan–Hadamard manifold. Related results also include Ghomi’s inequalities under negative-curvature pinching #cite(label("Ghomi2026Pinched")).

Recent preprints overlap with several parts of the problem. Chen, Ghomi and Wang establish Euclidean comparison and rigidity in dimensions three through nine, report calibration verification through at least dimension thirteen, and announce generalized comparison in dimensions four and five #cite(label("ChenGhomiWang2026HigherDimensions")) Theorems 1.1–1.2 and the subsequent discussion. Their argument uses boundary-pair integrals, Jacobi fields and a confined profile; its appendix includes exact-arithmetic certificates. Agnoletto, Da Silva, Nardulli and Resende prove the small-volume model comparison under a Ricci lower bound, and reduce the unrestricted-volume comparison to equality rigidity in a noncollapsing boundaryless Alexandrov class with two-sided curvature bounds #cite(label("AgnolettoDaSilvaNardulliResende2026")) Theorems 1.1 and 1.3, Assumption 1. Wheeler proves all-dimensional Euclidean comparison under controlled variation of a variable negative-curvature scale #cite(label("Wheeler2026")) Theorem 1.1 and Definition 1.2. These dimensional or curvature restrictions, and the Alexandrov rigidity condition in the reduction, differ from the hypotheses of Theorems 1 and 2.

=== 1.4 Main ideas and proof organization <main-ideas-and-proof-organization>

The central analytic estimate is a sharp critical Sobolev inequality on a hypersurface. Normalize the curvature bound to $- b^2$, with $b in { 0 \, 1 }$. For a locally $C^(1 \, 1)$ immersed hypersurface $Sigma^m$ with $m = n - 1 gt.eq 3$, let $d sigma$ be its induced area measure, $nabla_Sigma$ its tangential gradient, and $h$ its signed normalized scalar mean curvature for a local unit normal. Put

$ q = frac(2 m, m - 2) \, #h(2em) c = frac(4, m - 2) \, #h(2em) Y_m = m s_m^(2 \/ m) . $

We prove

#[#set math.equation(numbering: n => "(1.4)")
 $ integral_Sigma (c \| nabla_Sigma v \|^2 + m \( h^2 - b^2 \) v^2) thin d sigma gt.eq Y_m (integral_Sigma \| v \|^q thin d sigma)^(2 \/ q) $ <eq:intro-sobolev>]

for Lipschitz tests compactly supported in the interior of $Sigma$. The square $h^2$ is independent of the local normal. The hypersurface need not be complete or connected. The coefficient is the sharp Euclidean critical Sobolev constant of Aubin and Talenti in this normalization #cite(label("Aubin1976")) #cite(label("Talenti1976")).

Sections 2 and 3 establish this estimate. Radial maps into a unit sphere come with positive weights whose logarithmic Hessians and map differentials satisfy compatible curvature-comparison bounds. The center and scale can be chosen so that every spherical coordinate has zero mean for a prescribed compactly supported nonatomic probability measure. The bounds combine into a completed square in the hypersurface energy. If the critical quotient were below the Euclidean threshold, local compactness and Brézis–Lieb splitting would give a Dirichlet minimizer #cite(label("BrezisLieb1983")). Balancing its critical mass and using the spherical coordinates as variations forces a first-order identity. A weighted zero extension then has zero gradient and nonzero mass, contradicting the Dirichlet condition. The centering and coordinate variations are related to Li and Yau’s conformal-volume argument #cite(label("LiYau1982")) proof of Theorem 1; the maps and weighted centering needed here are constructed directly.

To compare domains, the difficulty is that the mean curvature of an arbitrary boundary is uncontrolled. Sections 4 and 5 instead minimize full ambient perimeter at fixed volume inside a large geodesic ball. This is the confined-profile strategy of Kleiner, with the regularity formulation of Ghomi and Spruck #cite(label("Kleiner1992")) #cite(label("GhomiSpruck2022")). Free variations identify the boundary curvature with the profile derivative; inward variations control it at contact with the confining sphere. A deletion-and-volume-repair argument first proves area growth near the singular set. Cutoffs with vanishing Dirichlet energy then make the constant test legitimate in (1.4). This gives one differential inequality whose integral is exactly the model comparison. Section 6 supplies the classical two- and three-dimensional inputs, their strict BV approximation, a common finite-volume cutoff argument, and metric scaling to arbitrary $kappa < 0$.

For equality, Section 7 first uses the proved Euclidean comparison to make a bounded equality set a local perimeter almost-minimizer. Local regularity #cite(label("AntonelliPasqualettoPozzetta2022")) Corollary 1.6, followed by a difference-quotient argument, gives a locally $C^(1 \, 1)$ regular boundary with the same signed constant mean curvature on every component. Singular cutoffs extend first variation and the Sobolev inequality to ambient tests on the whole perimeter support.

Section 8 locates that support and then recovers the region. In dimensions at least four, the constant equality test in (1.4) gives a sharp spectral bound. Logarithm coordinates centered at a squared-distance barycenter use this bound to give an upper estimate for the radial second moment. A radial flux identity gives the matching lower estimate. Equality forces the outward normal to be radial with constant radius, so the perimeter support lies on a sphere. Periodic Wirtinger replaces the spectral argument in dimension two; a punctured flux identity replaces it in dimension three and produces a sphere in a tangent space whose center may be offset from the logarithm origin. In all dimensions, BV phase constancy and boundedness identify the occupied interior. Exponential metric domination and equality of volume then force every metric eigenvalue to be Euclidean throughout that ball. This last step proves whole-region rigidity, beyond the preceding containment of its boundary.

=== 1.5 Conventions <conventions>

All hypersurface metrics and area measures are induced. For a local unit normal $N$, we use the signed trace curvature $H = "div"_Sigma N$ and the signed normalized scalar $h = H \/ m$. For a smooth ambient function $u$, its restriction satisfies

$ Delta_Sigma u = "tr"_(T Sigma) "Hess"_M u - H N u . $

Thus a Euclidean sphere of radius $r$ has outward $h = 1 \/ r$, and a curvature-$- 1$ sphere has $h = coth r$. Reversing $N$ reverses $h$; only normal-independent expressions are used when no global normal is chosen. For boundaries of sets, the occupied phase fixes $N$. All functions are real-valued. We often write $\| E \| = "Vol"_g \( E \)$ and $P \( E \) = P_g \( E \)$, and use $P \( E \; D \) = \| D chi_E \| \( D \)$ for the perimeter measure on a Borel set $D$. For $p in M$ we write $log_p = exp_p^(- 1)$, $r_p \( x \) = d \( p \, x \)$ and $D_p = r_p^2 \/ 2$; Section 2 proves the comparisons used for these functions.

== 2 Comparison maps into a sphere <sec:maps>

We seek a sphere-valued map with a controlled differential and a compatible Hessian bound for its weight. These two estimates will combine in the hypersurface Sobolev energy. A second step chooses the map’s parameters to balance a given measure.

Fix $b in { 0 \, 1 }$ and a complete simply connected manifold $\( M^n \, g \)$ with $sec_g lt.eq - b^2$. We use the model functions $"sn"_b$ and $"cs"_b$ from Section 1; thus

$ "sn"'_b = "cs"_b \, #h(2em) "cs"'_b = b^2 "sn"_b \, #h(2em) "cs"_b^2 - b^2 "sn"_b^2 = 1 . $

The Cartan–Hadamard theorem makes $exp_p : T_p M arrow.r M$ a diffeomorphism for every $p$; see #cite(label("PetersenManuscript")) Theorem 6.2.2. For $x eq.not p$, put $r = d \( p \, x \)$ and $theta = exp_p^(- 1) \( x \) \/ r$. The sphere $bb(S) \( T_p M xor bb(R) \)$ has its round metric induced by $g_p$ and the usual metric on $bb(R)$. Write $g_(bb(S)_p^(n - 1))$ for the round metric on the unit sphere in $T_p M$.

In the radial coordinate $"sn"_b \( r \/ 2 \) \/ "cs"_b \( r \/ 2 \)$, the model polar metric $d r^2 + "sn"_b \( r \)^2 g_(bb(S)_p^(n - 1))$ is conformal to the Euclidean polar metric. We dilate this coordinate by $a > 0$ and apply inverse stereographic projection, obtaining the map below and its model conformal factor $f_(p \, a)$:

#[#set math.equation(numbering: n => "(2.1)")
 $ z = a frac("sn"_b \( r \/ 2 \), "cs"_b \( r \/ 2 \)) \, #h(2em) Phi_(p \, a) \( x \) = (frac(2 z, 1 + z^2) theta \, frac(1 - z^2, 1 + z^2)) \,\
f_(p \, a) \( x \) = e^(u_(p \, a) \( x \)) = frac(a, "cs"_b \( r \/ 2 \)^2 + a^2 "sn"_b \( r \/ 2 \)^2) . $ <eq:map-definition>]

At the pole set $Phi_(p \, a) \( p \) = \( 0 \, 1 \)$ and $f_(p \, a) \( p \) = a$. In particular the zero-curvature formulas are explicitly $z = a r \/ 2$ and $f_(p \, a) = a \/ \( 1 + a^2 r^2 \/ 4 \)$.

#thm([Lemma 2.1.])[
  (Comparison maps).  #emph[The map $Phi_(p \, a)$ and the positive function $f_(p \, a)$ are smooth on $M$. For every $X in T_x M$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ \| d Phi_(p \, a) \( X \) \| & lt.eq f_(p \, a) \| X \| \,\
"Hess" u_(p \, a) & lt.eq d u_(p \, a) ⊗ d u_(p \, a) - 1 / 2 #scale(x: 120%, y: 120%)[\(] b^2 + f_(p \, a)^2 + \| nabla u_(p \, a) \|^2 #scale(x: 120%, y: 120%)[\)] g . $ <eq:map-comparison>]

 The second inequality is one of quadratic forms. The functions depend smoothly on $\( p \, a \, x \)$. For fixed $o in M$, parallel transport of the first component of $Phi_(p \, a)$ from $p$ to $o$ along the unique geodesic also depends smoothly on $\( p \, a \, x \)$.]
] <lem:comparison-maps>

#proof[
  The two components of $Phi_(p \, a)$ have squared norms summing to one. In normal coordinates $y = exp_p^(- 1) \( x \)$, its first component is $2 z thin y \/ \( r \( 1 + z^2 \) \)$. The coefficient, the last component, and $f_(p \, a)$ are smooth functions of $r^2$ at zero. Their denominators are positive. This proves smoothness at the pole, including that of $u = log f$. The map $\( p \, y \) mapsto \( p \, exp_p y \)$ from $T M$ to $M times M$ is a bijective local diffeomorphism, hence a diffeomorphism. Its inverse and the same even radial expressions prove joint smoothness. The paths $t mapsto exp_o \( t exp_o^(- 1) p \)$ vary smoothly with $p$; smooth dependence for the parallel-transport equation proves the last assertion.
  We next establish the one-sided distance comparison needed below:
  #[#set math.equation(numbering: n => "(2.3)")
   $ cal(H) := "Hess" r - frac("cs"_b \( r \), "sn"_b \( r \)) \( g - d r ⊗ d r \) gt.eq 0 #h(2em) \( r > 0 \) . $ <eq:distance-hessian-comparison>]
  Indeed, for a vector $X$ perpendicular to a unit radial geodesic of length $r$, the Jacobi field with endpoint values $0 \, X$ gives
  $ "Hess" r \( X \, X \) = integral_0^r #scale(x: 120%, y: 120%)[\(] \| D_t J \|^2 - chevron.l R \( J \, dot(gamma) \) dot(gamma) \, J chevron.r #scale(x: 120%, y: 120%)[\)] thin d t gt.eq integral_0^r \( \| D_t J \|^2 + b^2 \| J \|^2 \) thin d t . $
  In a parallel trivialization the last energy is minimized by $J_0 \( t \) = "sn"_b \( t \) X \/ "sn"_b \( r \)$ and equals $"cs"_b \( r \) \| X \|^2 \/ "sn"_b \( r \)$. To verify the minimum, write $J = J_0 + V$; integration by parts makes the cross term zero because $V$ vanishes at the endpoints and $J''_0 = b^2 J_0$. The remaining energy of $V$ is nonnegative. The radial and mixed components of $"Hess" r$ vanish, proving (2.3) without a lower curvature bound.
  For an angular variation field $J$ along a radial geodesic, Gauss’s lemma and commutation of the variation fields give
  $ frac(d, d r) \| J \|^2 = 2 "Hess" r \( J \, J \) gt.eq 2 frac("cs"_b \( r \), "sn"_b \( r \)) \| J \|^2 . $
  Thus $\| J \|^2 \/ "sn"_b \( r \)^2$ is nondecreasing, with limit equal to the initial angular squared norm at zero. Applying this to every angular vector proves the polar metric comparison
  #[#set math.equation(numbering: n => "(2.4)")
   $ g gt.eq d r^2 + "sn"_b \( r \)^2 g_(bb(S)_p^(n - 1)) . $ <eq:polar-comparison>]
  The round stereographic metric is $4 \( d z^2 + z^2 g_(bb(S)_p^(n - 1)) \) \/ \( 1 + z^2 \)^2$. The identities
  $ frac(2 z', 1 + z^2) = f \, #h(2em) frac(2 z, 1 + z^2) = f "sn"_b \( r \) $
  therefore give
  #[#set math.equation(numbering: n => "(2.5)")
   $ Phi_(p \, a)^(*) g_(bb(S) \( T_p M xor bb(R) \)) = f^2 #scale(x: 120%, y: 120%)[\(] d r^2 + "sn"_b \( r \)^2 g_(bb(S)_p^(n - 1)) #scale(x: 120%, y: 120%)[\)] lt.eq f^2 g . $ <eq:map-pullback>]
  This proves the differential estimate off the pole.
  For the Hessian calculation write
  $ A = a^2 + b^2 \, #h(2em) D = "cs"_b \( r \/ 2 \)^2 + a^2 "sn"_b \( r \/ 2 \)^2 = 1 + A "sn"_b \( r \/ 2 \)^2 . $
  Then $f = a \/ D$, $D' = A "sn"_b \( r \) \/ 2$, and $D'' = A "cs"_b \( r \) \/ 2$. The double-angle identities give
  $ b^2 D^2 + a^2 + A^2 / 4 "sn"_b \( r \)^2 = A "cs"_b \( r \) D . $
  For example, substituting $t = "sn"_b \( r \/ 2 \)^2$ makes both sides $A + \( A^2 + 2 b^2 A \) t + 2 b^2 A^2 t^2$. Consequently
  #[#set math.equation(numbering: n => "(2.6)")
   $ u' = - frac(A "sn"_b \( r \), 2 D) lt.eq 0 \, #h(2em) u'' = \( u' \)^2 + u' frac("cs"_b \( r \), "sn"_b \( r \)) \,\
u' frac("cs"_b \( r \), "sn"_b \( r \)) = - 1 / 2 #scale(x: 120%, y: 120%)[\(] b^2 + f^2 + \( u' \)^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:radial-identities>]
  Combining these identities with (2.3),
  $ "Hess" u = d u ⊗ d u - 1 / 2 #scale(x: 120%, y: 120%)[\(] b^2 + f^2 + \| nabla u \|^2 #scale(x: 120%, y: 120%)[\)] g + u' cal(H) . $
  The last term is negative semidefinite. Finally, the pole expansions
  $ d Phi_(p \, a) \|_p \( X \) = \( a X \, 0 \) \, #h(2em) u = log a - frac(a^2 + b^2, 4) r^2 + O \( r^4 \) $
  show that both estimates in (2.2) also hold at $p$. ◻
]

The zero-curvature case also gives three comparisons that will be used in the equality argument. They express, respectively, convexity of squared distance, expansion by the exponential map, and contraction by its inverse.

#thm([Corollary 2.2.])[
  (Distance and metric comparison).  #emph[Let $\( M^n \, g \)$ be complete and simply connected with $sec_g lt.eq 0$. For $p in M$, write $log_p = exp_p^(- 1)$, $r_p \( x \) = d \( p \, x \)$, and $D_p = r_p^2 \/ 2$. Then 
#[#set math.equation(numbering: n => "(2.7)")
 $ "Hess"_g D_p gt.eq g \, #h(2em) \( exp_p \)^(*) g gt.eq g_p \, #h(2em) \| d log_p \( X \) \|_(g_p) lt.eq \| X \|_g . $ <eq:distance-metric-comparison>]

 Here $g_p$ on $T_p M$ denotes its constant Euclidean metric.]
] <lem:distance-comparison>

#proof[
  With $b = 0$, (2.3) gives
  $ "Hess" D_p = d r_p ⊗ d r_p + r_p "Hess" r_p gt.eq g $
  away from $p$; smoothness of squared distance and normal coordinates give equality at $p$. The $b = 0$ case of (2.4) is exactly $\( exp_p \)^(*) g gt.eq g_p$, including at the origin by continuity. Applying this differential inequality to the inverse map gives the last assertion. ◻
]

The map parameters have supplied the geometric estimates. We next choose the center and scale so that the coordinate functions have zero mean for a prescribed measure. This use of spherical centering is related to the conformal variational argument of Li and Yau #cite(label("LiYau1982")) pp. 274–275; the required centering statement is proved below for these comparison maps.

#thm([Lemma 2.3.])[
  (Balancing a nonatomic measure).  #emph[Let $mu$ be a compactly supported Borel probability measure on $M$ with $mu \( { x } \) = 0$ for every $x$. If $"supp" mu subset B_D \( o \)$, there are $p in B_D \( o \)$ and finite $a > 0$ such that 
#[#set math.equation(numbering: n => "(2.8)")
 $ integral_M Phi_(p \, a) \( x \) thin d mu \( x \) = 0 quad upright("in ") T_p M xor bb(R) . $ <eq:balanced-map>]

]
] <lem:balancing>

#proof[
  Write $K = "supp" mu$, parameterize $p$ by $xi = exp_o^(- 1) p$, and let $P_(p arrow.r o)$ be radial parallel transport. Define
  $ F \( xi \, a \) = \( F_1 \, F_2 \) = integral_M \( P_(p arrow.r o) xor upright("id")_(bb(R)) \) Phi_(p \, a) \( x \) thin d mu \( x \) . $
  It is continuous on every cylinder $cal(C) = { xi in T_o M : \| xi \| lt.eq D } times \[ a_0 \, a_1 \]$ with $0 < a_0 < a_1 < oo$: the integrand is jointly continuous and has norm one. We choose the two horizontal faces so that $F$ points strictly inward on the entire boundary.
  First suppose $\| xi \| = D$. Put $rho = d \( o \, dot.op \)$. Radial parallel transport sends $xi$ to $D nabla rho \( p \)$. Convexity of $rho$ along the geodesic from $p$ to $x in K$ gives
  $ chevron.l xi \, P_(p arrow.r o) theta_p \( x \) chevron.r lt.eq frac(D \( rho \( x \) - D \), d \( p \, x \)) < 0 . $
  Here $p in.not K$; the derivative is taken only at $p eq.not o$, so a geodesic passing through $o$ causes no difficulty. The first component of $Phi_(p \, a)$ is a positive multiple of $theta_p \( x \)$ on this face. Hence
  #[#set math.equation(numbering: n => "(2.9)")
   $ chevron.l xi \, F_1 \( xi \, a \) chevron.r < 0 #h(2em) \( \| xi \| = D \, med a > 0 \) . $ <eq:balance-side>]
  Set $t_b \( r \) = "sn"_b \( r \/ 2 \) \/ "cs"_b \( r \/ 2 \)$, an increasing positive function for $r > 0$. Choose $a_0 > 0$ so that $a_0 t_b \( 2 D \) < 1$. Since $d \( p \, x \) < 2 D$ for $\| xi \| lt.eq D$ and $x in K$, we obtain
  #[#set math.equation(numbering: n => "(2.10)")
   $ F_2 \( xi \, a_0 \) gt.eq frac(1 - a_0^2 t_b \( 2 D \)^2, 1 + a_0^2 t_b \( 2 D \)^2) > 0 . $ <eq:balance-bottom>]
  We also have
  #[#set math.equation(numbering: n => "(2.11)")
   $ lim_(delta arrow.b 0) sup_(p in overline(B)_D \( o \)) mu \( B_delta \( p \) \) = 0 . $ <eq:uniform-atomless>]
  Otherwise there would be $epsilon > 0$, $delta_j arrow.r 0$, and centers $p_j$ with $mu \( B_(delta_j) \( p_j \) \) gt.eq epsilon$. The closed ball is compact by completeness, so a subsequence of centers converges to $p_oo$. Every $B_s \( p_oo \)$ then has mass at least $epsilon$. Continuity of a finite measure from above gives an atom at $p_oo$, a contradiction.
  Choose $delta > 0$ so that the supremum in (2.11) is less than $1 \/ 4$, and choose finite $a_1 > a_0$ with $a_1 t_b \( delta \) gt.eq sqrt(3)$. The last coordinate of $Phi_(p \, a_1)$ is at most $- 1 \/ 2$ outside $B_delta \( p \)$ and at most one everywhere. Thus
  #[#set math.equation(numbering: n => "(2.12)")
   $ F_2 \( xi \, a_1 \) lt.eq - 1 / 8 < 0 #h(2em) \( \| xi \| lt.eq D \) . $ <eq:balance-top>]
  Let $Pi_(cal(C))$ be Euclidean nearest-point projection onto the compact convex cylinder. Brouwer’s theorem gives a fixed point of $T \( zeta \) = Pi_(cal(C)) \( zeta + F \( zeta \) \)$. The projection inequality at that point is
  #[#set math.equation(numbering: n => "(2.13)")
   $ chevron.l F \( zeta \) \, y - zeta chevron.r lt.eq 0 #h(2em) \( y in cal(C) \) . $ <eq:projection-fixed-point>]
  On the side face, choosing $y = \( \( 1 - t \) xi \, a \)$ with small $t > 0$ contradicts (2.9). On the lower or upper face, moving the last coordinate inward contradicts (2.10) or (2.12). These choices remain admissible at corners. The fixed point is therefore interior. Taking both signs of every small displacement in (2.13) gives $F = 0$. Parallel transport is an isomorphism, which proves (2.8) with the asserted parameters. ◻
]

== 3 The sharp hypersurface Sobolev inequality <sec:sobolev>

We now turn the comparison maps into a sharp inequality on a possibly incomplete hypersurface. The proof first rules out a Dirichlet quotient below the Euclidean constant; a point cutoff then permits tests supported on an entire compact component.

Let $b in { 0 \, 1 }$, and let $M^n$ be complete and simply connected, with $sec_g lt.eq - b^2$. Put $m = n - 1 gt.eq 3$ and

$ q = frac(2 m, m - 2) \, #h(2em) c = frac(4, m - 2) = q - 2 \, #h(2em) alpha = frac(m - 2, 2) \, #h(2em) Y_m = m s_m^(2 \/ m) . $

Let $Sigma^m$ be a locally $C^(1 \, 1)$ immersed hypersurface in $M$, with its induced metric and area measure $d sigma$. It need not be complete and may have boundary. Compactness is understood in the manifold topology of $Sigma$, and $Sigma^compose$ denotes its interior. Ambient functions and maps on $Sigma$ are composed with the immersion. For a local unit normal $N$, write $m h = "div"_Sigma N$ almost everywhere. The square $h^2$ is independent of the choice of normal. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ Q_Sigma \( v \) = integral_Sigma (c \| nabla_Sigma v \|^2 + m \( h^2 - b^2 \) v^2) thin d sigma . $ <eq:sobolev-form>]

For open $U subset.double Sigma^compose$, let $H_0^1 \( U \)$ be the closure of compactly supported Lipschitz functions in the induced $H^1$ norm; no regularity of $partial U$ is assumed.

#thm([Theorem 3.1.])[
  (Hypersurface Sobolev inequality).  #emph[For every Lipschitz function $v$ with compact support in $Sigma^compose$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ Q_Sigma \( v \) gt.eq Y_m (integral_Sigma \| v \|^q thin d sigma)^(2 \/ q) . $ <eq:extrinsic-sobolev>]

 The inequality also holds for the zero extension of every $v in H_0^1 \( U \)$, where $U subset.double Sigma^compose$ is open.]
] <thm:extrinsic-sobolev>

The constant is sharp: on a geodesic sphere in the space form of curvature $- b^2$, the constant function gives equality.

By this definition, zero extension satisfies

#[#set math.equation(numbering: n => "(3.3)")
 $ E_0 v in H^1 \( Sigma^compose \) \, #h(2em) nabla_Sigma \( E_0 v \) = upright(bold(1))_U nabla_Sigma v quad upright("almost everywhere") . $ <eq:sobolev-zero-extension>]

Both statements hold for the approximating functions and pass to their $H^1$ limits, including when $partial U$ has positive measure. In $C^(1 \, 1)$ charts the induced metric is locally Lipschitz and uniformly positive definite on compact subsets, and $h$ is locally essentially bounded. Thus the potential in (3.1) is bounded near $macron(U)$ and $Q_Sigma$ is continuous on $H_0^1 \( U \)$.

=== 3.1 A geometric square <a-geometric-square>

The comparison maps provide the following lower bound before any minimization takes place.

#thm([Lemma 3.2.])[
  #emph[Fix $p in M$ and $a > 0$, and let $Phi = Phi_(p \, a)$ and $f = e^u = f_(p \, a)$ be the map and functions of Lemma 4. For every compactly supported Lipschitz function $v$ in $Sigma^compose$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ Q_Sigma \( v \) & gt.eq integral_Sigma (m f^2 v^2 + m \( h + N u \)^2 v^2 + c \| nabla_Sigma v - alpha v nabla_Sigma u \|^2) thin d sigma\
 & gt.eq integral_Sigma (v^2 \| d \( Phi \|_Sigma \) \|^2 + c \| nabla_Sigma v - alpha v nabla_Sigma u \|^2) thin d sigma . $ <eq:square-estimate>]

 The same inequalities hold on $H_0^1 \( U \)$ for every $U subset.double Sigma^compose$. In particular, $Q_Sigma$ is nonnegative on all these functions.]
] <lem:square-estimate>

#proof[
  Write $nabla = nabla_Sigma$ and $beta = N u$. The restriction formula is
  #[#set math.equation(numbering: n => "(3.5)")
   $ Delta_Sigma u = "tr"_(T Sigma) "Hess"_g u - m h beta . $ <eq:sobolev-restriction-laplacian>]
  This holds both almost everywhere and weakly: in a $C^(1 \, 1)$ parametrization, the induced divergence expression has Lipschitz coefficients, and the restricted smooth ambient function has Lipschitz first derivatives. The ordinary chain rule therefore gives the same formula as the distributional divergence.
  Taking the tangential trace in Lemma 4, and using $\| nabla_g u \|^2 = \| nabla u \|^2 + beta^2$, gives
  $ 2 Delta_Sigma u lt.eq - \( m - 2 \) \| nabla u \|^2 - m \( b^2 + f^2 \) - m beta^2 - 2 m h beta . $
  Equivalently,
  $ m \( h^2 - b^2 \) gt.eq m f^2 + m \( h + beta \)^2 + \( m - 2 \) \| nabla u \|^2 + 2 Delta_Sigma u . $
  Multiply by $v^2$ and integrate by parts. Since $c alpha = 2$ and $c alpha^2 = m - 2$, the gradient terms become
  $ c \| nabla v \|^2 - 4 v chevron.l nabla v \, nabla u chevron.r + \( m - 2 \) v^2 \| nabla u \|^2 = c \| nabla v - alpha v nabla u \|^2 . $
  This proves the first inequality. The squared differential norm is the sum over an orthonormal tangent frame, so $\| d \( Phi \|_Sigma \) \|^2 lt.eq m f^2$ by Lemma 4, proving the second. Reversing a local normal reverses both $h$ and $beta$; all expressions are therefore globally defined. Finally, all coefficients are bounded near $macron(U)$, so $H_0^1 \( U \)$ approximation proves the last assertion. ◻
]

=== 3.2 Compactness below the Euclidean constant <compactness-below-the-euclidean-constant>

We need only local compactness on the hypersurface. The below-threshold argument follows the critical-quotient application of Brézis–Lieb #cite(label("BrezisLieb1983")) Section 4(B); we give the details for the present metric and potential. The critical concentration threshold is the same for both curvature bounds.

#thm([Lemma 3.3.])[
  #emph[For every open $U subset.double Sigma^compose$ and $epsilon.alt > 0$, there is $C_(epsilon.alt \, U) < oo$ such that 
#[#set math.equation(numbering: n => "(3.6)")
 $ \( Y_m - epsilon.alt \) parallel v parallel_q^2 lt.eq c integral_Sigma \| nabla_Sigma v \|^2 thin d sigma + C_(epsilon.alt \, U) integral_Sigma v^2 thin d sigma \, #h(2em) v in H_0^1 \( U \) . $ <eq:local-sobolev-threshold>]

 The inclusion $H_0^1 \( U \) arrow.r.hook L^2 \( U \)$ is compact.]
] <lem:local-sobolev-threshold>

#proof[
  The sharp Euclidean Sobolev inequality of Aubin and Talenti #cite(label("Aubin1976")) #cite(label("Talenti1976")), in our normalization, is
  #[#set math.equation(numbering: n => "(3.7)")
   $ c integral_(bb(R)^m) \| D phi \|^2 thin d x gt.eq Y_m (integral_(bb(R)^m) \| phi \|^q thin d x)^(2 \/ q) \, #h(2em) phi in "Lip"_c \( bb(R)^m \) . $ <eq:talenti-normalization>]
  Before multiplying by $c$, the sharp constant is $m \( m - 2 \) \| bb(S)^m \|^(2 \/ m) \/ 4$. Normalize the metric at a chart center. In a sufficiently small chart, its matrix $G$ satisfies $\( 1 - delta \) upright("Id") lt.eq G lt.eq \( 1 + delta \) upright("Id")$. Comparing inverse metrics and volume densities in (3.7) gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ c integral_Sigma \| nabla_Sigma phi \|^2 thin d sigma gt.eq Y_m (frac(1 - delta, 1 + delta))^(m \/ 2) parallel phi parallel_q^2 $ <eq:chart-sobolev-distortion>]
  for chart-supported $phi$. The gradient integral is at least $\( 1 - delta \)^(m \/ 2) \( 1 + delta \)^(- 1)$ times its Euclidean value, whereas the squared critical norm is at most $\( 1 + delta \)^(m \/ q)$ times its Euclidean value, and $m \/ q = \( m - 2 \) \/ 2$.
  Choose $delta$ so that the coefficient in (3.8) is at least $Y_m - epsilon.alt$. Cover $macron(U)$ by finitely many such charts and choose chart-supported Lipschitz functions $chi_i$ with $sum_i chi_i^2 = 1$ near $macron(U)$. They are obtained by normalizing a finite family of cutoffs by the square root of the sum of their squares near $macron(U)$, and then cutting off outside that neighborhood. The triangle inequality in $L^(q \/ 2)$ and the product rule give
  #[#set math.equation(numbering: n => "(3.9)")
   $ parallel v parallel_q^2 & = ∥sum_i \( chi_i v \)^2∥_(q \/ 2) lt.eq sum_i parallel chi_i v parallel_q^2 \,\
sum_i \| nabla_Sigma \( chi_i v \) \|^2 & = \| nabla_Sigma v \|^2 + v^2 sum_i \| nabla_Sigma chi_i \|^2 . $ <eq:squared-partition-norm>]
  Summing (3.8) proves (3.6) first for compactly supported Lipschitz functions. Taking, for example, $epsilon.alt = Y_m \/ 2$ gives the continuous inclusion into $L^q$, so approximation proves it for every $v in H_0^1 \( U \)$.
  For compactness, extend a bounded $H_0^1 \( U \)$ sequence by zero. Each $chi_i v_j$ is a bounded Euclidean $H^1$ sequence in its chart, supported in a fixed compact subset. Rellich compactness gives an $L^2$-convergent subsequence in each of the finitely many charts. The identity $v_j = sum_i chi_i \( chi_i v_j \)$ then gives convergence in $L^2 \( U \)$. No boundary regularity of $U$ is used. ◻
]

#thm([Lemma 3.4.])[
  (Attainment below the threshold).  #emph[For nonempty open $U subset.double Sigma^compose$, put 
$ Y \( U \) = inf { Q_Sigma \( v \) : v in H_0^1 \( U \) \, med parallel v parallel_q = 1 } . $

 If $Y \( U \) < Y_m$, the infimum is attained.]
] <lem:subthreshold-minimizer>

#proof[
  Write $Y = Y \( U \) gt.eq 0$, the last inequality following from Lemma 8. For a normalized minimizing sequence, Hölder’s inequality and $h^2 - b^2 gt.eq - b^2$ give
  #[#set math.equation(numbering: n => "(3.10)")
   $ parallel v_j parallel_2^2 lt.eq sigma \( U \)^(2 \/ m) \, #h(2em) c parallel nabla_Sigma v_j parallel_2^2 lt.eq Q_Sigma \( v_j \) + m b^2 sigma \( U \)^(2 \/ m) . $ <eq:minimizing-sequence-bound>]
  Thus, after a subsequence,
  $ v_j harpoon.rt psi upright(" in ") H_0^1 \( U \) \, #h(2em) v_j arrow.r psi upright(" in ") L^2 \( U \) upright(" and almost everywhere") . $
  Set $t = integral_U \| psi \|^q thin d sigma in \[ 0 \, 1 \]$ and $z_j = v_j - psi$. The Brézis–Lieb lemma #cite(label("BrezisLieb1983")) Theorem 1 gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ integral_U \| z_j \|^q thin d sigma arrow.r 1 - t . $ <eq:brezis-lieb-splitting>]
  Weak convergence splits the quadratic form: $Q_Sigma \( v_j \) = Q_Sigma \( psi \) + Q_Sigma \( z_j \) + o \( 1 \)$. The bounded potential and (3.6) give
  $ Q_Sigma \( z_j \) gt.eq \( Y_m - epsilon.alt \) parallel z_j parallel_q^2 - \( C_(epsilon.alt \, U) + m b^2 \) parallel z_j parallel_2^2 . $
  Letting $j arrow.r oo$ and then $epsilon.alt arrow.b 0$, we obtain
  #[#set math.equation(numbering: n => "(3.12)")
   $ Y gt.eq Q_Sigma \( psi \) + Y_m \( 1 - t \)^(2 \/ q) gt.eq Y t^(2 \/ q) + Y_m \( 1 - t \)^(2 \/ q) . $ <eq:critical-mass-inequality>]
  If $t = 0$, this contradicts $Y < Y_m$. If $Y = 0$, it forces $t = 1$. If $Y > 0$ and $0 < t < 1$, strict concavity gives $t^(2 \/ q) + \( 1 - t \)^(2 \/ q) > 1$, and the right side is strictly greater than $Y$. Thus $t = 1$ in every case. Lower semicontinuity of the gradient energy and strong $L^2$ convergence of the potential term give $Q_Sigma \( psi \) lt.eq Y$; normalization gives the reverse inequality. ◻
]

=== 3.3 Balanced variations <balanced-variations>

A quotient below the sharp threshold would now have a normalized minimizer $psi$. After balancing its critical mass with a comparison map $Phi$, the spherical-coordinate variations will give $integral_Sigma psi^2 \| d \( Phi \|_Sigma \) \|^2 thin d sigma gt.eq Q_Sigma \( psi \)$. The geometric square gives the reverse inequality with an additional nonnegative gradient square. The two bounds force that square to vanish, and zero extension supplies the contradiction.

#proof[
  First let $Sigma$ be connected and boundaryless, and fix a nonempty open $U subset.double Sigma$ with $Sigma \\ macron(U) eq.not diameter$. Suppose $Y \( U \) < Y_m$, and take the normalized minimizer $psi$ supplied by Lemma 10. Write $Y = Q_Sigma \( psi \)$.
  Push the probability measure $\| psi \|^q thin d sigma$, extended by zero, to $M$ by the immersion. Its support is compact and it has no atoms. Indeed, an immersion is locally an embedding, so a fiber in the compact support meets each member of a finite embedding-chart cover in at most one point; every such fiber has zero area measure. Lemma 6 supplies fixed parameters $p \, a$ such that the coordinates $w_1 \, dots.h \, w_(n + 1)$ of $Phi_(p \, a) \|_Sigma$ satisfy
  #[#set math.equation(numbering: n => "(3.13)")
   $ integral_Sigma \| psi \|^q w_j thin d sigma = 0 \, #h(2em) sum_(j = 1)^(n + 1) w_j^2 = 1 . $ <eq:balanced-minimizer>]
  These coordinates and $u = u_(p \, a)$ have bounded first derivatives near $macron(U)$. Multiplication by $w_j$ or $w_j^2$ preserves $H_0^1 \( U \)$.
  Let $B_Q$ be the symmetric bilinear form associated with $Q_Sigma$. For a bounded Lipschitz multiplier $zeta$ near $macron(U)$, differentiate the quotient along $psi \( 1 + s zeta \)$ to obtain
  #[#set math.equation(numbering: n => "(3.14)")
   $ B_Q \( psi \, psi zeta \) = Y integral_Sigma \| psi \|^q zeta thin d sigma . $ <eq:minimizer-first-variation>]
  For small $\| s \|$, the factor $1 + s zeta$ is bounded away from zero, and differentiated mass integrands are dominated by a constant times $\| psi \|^q$. No regularity or positivity of the minimizer is needed.
  Fix a coordinate $w = w_j$ and put $B_w = integral_Sigma \| psi \|^q w^2 thin d sigma$. Since $\| w \| lt.eq 1$ and its weighted mean is zero,
  $ parallel psi \( 1 + s w \) parallel_q^2 = 1 + \( q - 1 \) B_w s^2 + o \( s^2 \) . $
  The numerator has zero linear term by (3.14); its second variation at the minimum therefore gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ Q_Sigma \( psi w \) gt.eq \( q - 1 \) Y B_w . $ <eq:minimizer-second-variation>]
  The product rule and the first variation with $zeta = w^2$ give
  #[#set math.equation(numbering: n => "(3.16)")
   $ Q_Sigma \( psi w \) & = B_Q \( psi \, psi w^2 \) + c integral_Sigma psi^2 \| nabla_Sigma w \|^2 thin d sigma\
 & = Y B_w + c integral_Sigma psi^2 \| nabla_Sigma w \|^2 thin d sigma . $ <eq:coordinate-product-identity>]
  Subtract and sum over the coordinates. Since $c = q - 2$ and $sum_j w_j^2 = 1$, the result is
  #[#set math.equation(numbering: n => "(3.17)")
   $ integral_Sigma psi^2 \| d \( Phi_(p \, a) \|_Sigma \) \|^2 thin d sigma gt.eq Y . $ <eq:balanced-map-energy>]
  Combining this with Lemma 8 forces
  #[#set math.equation(numbering: n => "(3.18)")
   $ nabla_Sigma psi = alpha psi nabla_Sigma u quad upright("almost everywhere on ") U . $ <eq:weighted-minimizer-gradient>]
  Choose a compactly supported Lipschitz cutoff $chi$ on $Sigma$ equal to one near $macron(U)$. By (3.3),
  $ F = \( chi e^(- alpha u) \) E_0 psi in H^1 \( Sigma \) $
  is the zero extension of $e^(- alpha u) psi$, and (3.18) gives $nabla_Sigma F = 0$ almost everywhere on all of $Sigma$. The local Poincaré inequality in coordinate balls makes $F$ constant almost everywhere on each ball. Overlapping balls have the same constant, so connectedness makes $F$ constant on $Sigma$. It vanishes on the nonempty open set $Sigma \\ macron(U)$ and therefore vanishes everywhere, contradicting $parallel psi parallel_q = 1$. Thus $Y \( U \) gt.eq Y_m$.
  Every proper compact support in a connected boundaryless $Sigma$ is contained in such a $U$: choose a coordinate ball outside the support and finitely many relatively compact neighborhoods covering the support that miss a smaller ball. This proves the inequality unless the support is the entire compact component. In that case, let $D_delta$ be the image of a Euclidean ball of radius $delta$ in a fixed chart about a point. Remove that point with a cutoff $eta_delta$ equal to zero in $D_delta$, equal to one outside $D_(2 delta)$, and satisfying $\| nabla_Sigma eta_delta \| lt.eq C \/ delta$. For Lipschitz $v$, metric comparability gives
  $ integral_Sigma \| nabla_Sigma \( \( 1 - eta_delta \) v \) \|^2 thin d sigma lt.eq 2 integral_(D_(2 delta)) \| nabla_Sigma v \|^2 thin d sigma + C parallel v parallel_oo^2 delta^(m - 2) arrow.r 0 . $
  Also $eta_delta v arrow.r v$ in $L^2$ and $L^q$. The potential is bounded on the compact component, so the inequality for $eta_delta v$ passes to $v$. This is where $m > 2$ is needed.
  Finally, pass to $Sigma^compose$ if $Sigma$ has boundary. A compact support meets only finitely many connected components, because the components are open. If $a_j = integral_(Sigma_j) \| v \|^q thin d sigma$, the connected result gives
  $ Q_Sigma \( v \) gt.eq Y_m sum_j a_j^(2 \/ q) gt.eq Y_m (sum_j a_j)^(2 \/ q) . $
  For $v in H_0^1 \( U \)$, use its defining approximation: Lemma 9 gives convergence in $L^q$, and boundedness of the potential near $macron(U)$ gives convergence of the quadratic form. This proves the final assertion. ◻
]

== 4 The confined isoperimetric profile <sec:profile>

Confinement gives perimeter minimizers at prescribed volume. At volumes where the confined profile is differentiable, its derivative will determine the mean curvature on the free boundary and bound it from above on the contact set. Both portions contribute to full ambient perimeter. These curvature bounds will enter the hypersurface Sobolev inequality once the constant test has been justified in Section 5.

Throughout this section, $M^n$ is a Cartan–Hadamard manifold; only $sec_g lt.eq 0$ is needed. Fix an open geodesic ball $B = B_(R_B) \( o \)$ of finite radius. Its closure is compact, and its boundary is a smooth strictly convex hypersurface. For a measurable set $E$, write $\| E \| = "Vol"_g \( E \)$ and

$ P \( E \; U \) = \| D chi_E \| \( U \) \, #h(2em) P \( E \) = P \( E \; M \) \, $

where $U subset M$ is open and $\| D chi_E \|$ is the perimeter measure. In particular, $P \( E \)$ includes any part of the boundary lying on $partial B$. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ I \( v \) = inf { P \( E \) : med \| E \\ B \| = 0 \, med \| E \| = v #scale(x: 120%, y: 120%)[}] \, #h(2em) 0 < v < \| B \| . $ <eq:confined-profile>]

All statements about measurable sets in this definition are understood up to sets of ambient volume zero.

=== 4.1 Compactness and variation of finite-perimeter sets <compactness-and-variation-of-finite-perimeter-sets>

For an integrable function $u$, write $u in B V \( M \)$ when its distributional gradient $D u$ is a finite vector-valued measure, and write $\| D u \|$ for its total variation. For $u = chi_E$, this agrees with the perimeter measure already defined.

Existence of confined minimizers will follow from compactness, and smooth flows will change their volume while controlling full ambient perimeter. We recall these facts in the precise forms used below. In smooth coordinate charts, De Giorgi’s reduced-boundary representation and Gauss–Green formula #cite(label("Maggi2012")) Synopsis, pp. 119–120 give the Riemannian identities

$ D chi_E = - N_E thin cal(H)_g^(n - 1) floor.l partial^(*) E \, #h(2em) integral_E "div" X thin d "Vol"_g = integral_(partial^(*) E) chevron.l X \, N_E chevron.r thin d cal(H)_g^(n - 1) . $

Here $partial^(*) E$ is countably rectifiable, $N_E$ is its outward measure-theoretic unit normal, and its tangent plane is $N_E^perp$ almost everywhere. The formulas apply to every smooth compactly supported field $X$. To see the metric conversion, write $g$ for the metric matrix, $rho = sqrt(det g)$ and $nu$ for the Euclidean outward normal. If $a = \( nu^T g^(- 1) nu \)^(1 \/ 2)$, then

$ N_E = g^(- 1) nu \/ a \, #h(2em) d cal(H)_g^(n - 1) = rho a thin d cal(H)_e^(n - 1) \, #h(2em) "div"_g X = rho^(- 1) "div" \( rho X \) . $

The first two identities follow from orthogonality and the tangent Gram determinant; substitution in Euclidean Gauss–Green gives the displayed Riemannian formula. Smooth positivity of the metric and density compares the BV norms on compact subcharts. Chart partitions then give the invariant measure identity.

#thm([Lemma 4.1.])[
  (Compactness and lower semicontinuity).  #emph[Let $K$ be a compact subset of a smooth Riemannian manifold without boundary. If functions $u_j$ vanish outside $K$ almost everywhere and 
$ sup_j #scale(x: 120%, y: 120%)[\(] parallel u_j parallel_(L^1) + \| D u_j \| \( M \) #scale(x: 120%, y: 120%)[\)] < oo \, $

 then a subsequence converges in $L^1 \( M \)$. Total variation is lower semicontinuous under this convergence. If the $u_j$ are characteristic functions, their limit is a characteristic function.]
] <lem:bv-compactness>

#proof[
  Choose a finite smooth partition on a neighborhood of $K$, with each partition function compactly supported in a coordinate chart. The smooth multiplier formula follows by inserting a multiplier in the distributional test field. Smooth positivity of the metric and volume density on the compact chart supports therefore bounds the Euclidean BV norms of the localized functions. Extend each of them by zero within its chart.
  For a Euclidean BV function $v$, convolution satisfies $D \( v * rho_epsilon \) = D v * rho_epsilon$ and $parallel D \( v * rho_epsilon \) parallel_1 lt.eq \| D v \| \( bb(R)^n \)$. Apply the fundamental theorem of calculus to the convolution and let its scale tend to zero in $L^1$. This gives
  $ parallel v \( dot.op + h \) - v parallel_1 lt.eq \| h \| thin \| D v \| \( bb(R)^n \) \, #h(2em) parallel v * rho_epsilon - v parallel_1 lt.eq epsilon C_rho \| D v \| \( bb(R)^n \) . $
  For fixed $epsilon$, the convolutions have common compact support and uniformly bounded sup norms and first derivatives, by the uniform $L^1$ bound on $v$. Approximation on a finite mesh makes this family precompact in $L^1$. Taking scales to zero and a diagonal subsequence gives compactness in each chart, hence for the original finite sum. Total variation is a supremum of continuous divergence integrals, so is lower semicontinuous. A further almost-everywhere convergent subsequence of characteristic functions has values in ${ 0 \, 1 }$. ◻
]

#thm([Lemma 4.2.])[
  (Perimeter under smooth flows).  #emph[Let $F : M arrow.r M$ be an orientation-preserving smooth diffeomorphism, and let $E$ have finite perimeter. If the right side below is finite, then 
#[#set math.equation(numbering: n => "(4.2)")
 $ P \( F E \) = integral_(partial^(*) E) J_(n - 1) #scale(x: 120%, y: 120%)[\(] d F_x \|_(N_E \( x \)^perp) #scale(x: 120%, y: 120%)[\)] thin d cal(H)_g^(n - 1) \( x \) . $ <eq:bv-flow-jacobian>]

 All Jacobians and adjoints use the source and target Riemannian metrics. For a smooth flow $F_t$ with velocity $Z$ and a set whose perimeter support is compact, 
#[#set math.equation(numbering: n => "(4.3)")
 $ frac(d, d t)\|_(t = 0) P \( F_t E \) = integral_(partial^(*) E) "div"_(N_E^perp) Z thin d cal(H)_g^(n - 1) . $ <eq:bv-flow-first-variation>]

 For a fixed finite family of flows and perimeter supports contained in a fixed compact set, there are common $C \, tau > 0$ such that $\| P \( F_t E \) - P \( E \) \| lt.eq C \| t \| P \( E \)$ for $\| t \| < tau$.]
] <lem:bv-flow>

#proof[
  Write $J_F$ for the positive ambient volume Jacobian. The Piola pullback of a target test field $X$ is
  $ Q_X \( x \) = J_F \( x \) \( d F_x \)^(- 1) X \( F x \) . $
  Ordinary smooth change of variables, tested against smooth scalar functions, gives $"div" Q_X = J_F \( "div" X \) compose F$. Gauss–Green for $E$ implies
  $ integral_(F E) "div" X thin d "Vol"_g = integral_(partial^(*) E) chevron.l X \( F x \) \, J_F \( x \) \( d F_x \)^(- *) N_E \( x \) chevron.r_g thin d cal(H)_g^(n - 1) \( x \) . $
  Thus the outward vector measure $- D chi_(F E)$ is the pushforward of the vector density $a \( x \) = J_F \( x \) \( d F_x \)^(- *) N_E \( x \)$ against the perimeter measure of $E$. Since $F$ is injective and $a eq.not 0$, its polar direction at $y = F \( x \)$ is $a \( x \) \/ \| a \( x \) \|$. Its total variation is therefore the pushforward of $\| a \| thin d \| D chi_E \|$, with no cancellation. Linear algebra in orthonormal bases gives $\| a \| = J_(n - 1) \( d F \|_(N_E^perp) \)$, proving (4.2). Differentiation of the Gram determinant at $t = 0$ gives tangential divergence. The Jacobians and their time derivatives are uniformly bounded over all tangent planes above the fixed compact set. This justifies differentiation under the integral and proves the final estimate. ◻
]

The compactness statement supplies minimizers and compact families of competitors. The flow formula counts contact perimeter as well as free perimeter, both for volume adjustment and for one-sided variations.

=== 4.2 Existence, regularity, and variation of the profile <existence-regularity-and-variation-of-the-profile>

#thm([Proposition 4.3.])[
  (Confined minimizers and their regularity).  #emph[For each $v in \( 0 \, \| B \| \)$ there is a minimizer $E$ in (4.1). It has a regular representative for which $Gamma = partial E$ is the support of its perimeter measure and is contained in $overline(B)$. There is a compact set $S subset B$ such that]
  + #emph[$dim_(cal(H)) S lt.eq n - 8$, with $S = diameter$ if $n < 8$;]
  + #emph[$Sigma = Gamma \\ S$ is a boundaryless $C_(upright("loc"))^(1 \, 1)$ hypersurface, smooth on $Sigma ∩ B$;]
  + #emph[$Gamma$ is $C^(1 \, 1)$ in an ambient neighborhood of $partial B$, and $S$ is disjoint from a collar of $partial B$;]
  + #emph[with $d sigma$ denoting area on $Sigma$, for every Borel set $A subset M$ one has 
#[#set math.equation(numbering: n => "(4.4)")
 $ \| D chi_E \| \( A \) = integral_(A ∩ Sigma) d sigma \, #h(2em) P \( E \) = integral_Sigma d sigma = I \( v \) . $ <eq:perimeter-area>]

]
  #emph[The unit normal on $Sigma$ is the outward normal of $E$.]
] <prop:confined-regularity>

#proof[
  Concentric balls provide finite-perimeter competitors at every volume in $\( 0 \, \| B \| \)$. A minimizing sequence has uniformly bounded perimeter and is supported, up to null sets, in the compact set $overline(B)$. Lemma 11 gives an $L^1 \( M \)$ limit $chi_E$ of the same volume with $P \( E \) lt.eq I \( v \)$. The limit vanishes almost everywhere outside $overline(B)$; since $partial B$ has ambient volume zero, it is admissible in (4.1). Thus it attains the infimum.
  For the regularity conclusions, choose a minimizing region supplied by Ghomi–Spruck in the cited arXiv version #cite(label("GhomiSpruck2022")) Lemma 7.2(i),(ii), p. 35, and denote it by $E$. Set $K = "supp" \| D chi_E \|$. These unconditional parts of the Lemma give interior smoothness outside the stated singular set and $C^(1 \, 1)$ regularity in a neighborhood of the confining sphere in a Cartan–Hadamard manifold; see also Morgan #cite(label("Morgan2003")) Section 2 and Corollary 3.8 for the interior theory. For the boundary part, Ghomi and Spruck use the Euclidean obstacle regularity of Stredulinsky and Ziemer #cite(label("StredulinskyZiemer1997")) and its local graph extension to the Riemannian setting. The graph and singular-set description gives $\| K \| = 0$. Off $K$, $chi_E$ is locally constant almost everywhere. Take $E$ to be the union of the components of $M \\ K$ on which $chi_E = 1$ almost everywhere. This changes only a null set. Every ball centered on $K$ has positive perimeter, hence contains both phases in positive volume, so $partial E = K = Gamma$. At regular points the perimeter measure is the induced area measure. The singular set has zero $m$-dimensional Hausdorff measure, giving (4.4).
  The free portion in the $C^(1 \, 1)$ collar is smooth by interior regularity for the constant-mean-curvature equation. Hence the actual interior singular set avoids this collar. It is closed away from the collar and contained in the compact set $Gamma$, so it is a compact subset of $B$. Finally, the $C^(1 \, 1)$ regularity is that of the whole hypersurface near $partial B$; the transition between its free and contact portions does not create a boundary of $Sigma$. ◻
]

We henceforth use this representative whenever discussing the boundary of a minimizer. Notice that

#[#set math.equation(numbering: n => "(4.5)")
 $ P \( E \; B \) > 0 #h(2em) \( 0 < \| E \| < \| B \| \) . $ <eq:positive-free-perimeter>]

Indeed, if $D chi_E$ vanished in the connected ball $B$, then $chi_E$ would be constant almost everywhere there, contrary to the volume condition. In particular $I \( v \) > 0$, and, by (4.4), a minimizing boundary has a nonempty smooth free patch.

#thm([Lemma 4.4.])[
  (Local Lipschitz continuity).  #emph[The profile $I$ is positive and locally Lipschitz on $\( 0 \, \| B \| \)$.]
] <lem:profile-lipschitz>

#proof[
  Positivity was just established. Fix a compact interval $\[ v_(-) \, v_(+) \] subset \( 0 \, \| B \| \)$. The radius of a concentric ball varies continuously with its volume, and its boundary area is continuous in its radius. Consequently there is $C_0 < oo$ such that $I \( v \) lt.eq C_0$ for all $v in \[ v_(-) \, v_(+) \]$.
  Consider the family
  $ cal(K) = { chi_F : med \| F \\ B \| = 0 \, med v_(-) lt.eq \| F \| lt.eq v_(+) \, med P \( F \) lt.eq C_0 #scale(x: 120%, y: 120%)[}] . $
  BV compactness on a compact neighborhood of $overline(B)$, together with lower semicontinuity and $L^1$ continuity of volume, shows that $cal(K)$ is compact in $L^1 \( M \)$. For each $F in cal(K)$ there is a smooth vector field $Z_F$ compactly supported in $B$ for which
  $ A_(Z_F) \( F \) := integral_F "div" Z_F thin d "Vol"_g eq.not 0 . $
  Otherwise $D chi_F$ would vanish in $B$, contradicting $v_(-) lt.eq \| F \| lt.eq v_(+)$. Reverse the sign of $Z_F$ if necessary so that $A_(Z_F) \( F \) > 0$. For each fixed $Z$, the functional $A_Z$ is $L^1$-continuous. A finite subcover of $cal(K)$ therefore gives smooth fields $Z_1 \, dots.h \, Z_k$, compactly supported in $B$, and a number $delta > 0$ such that
  #[#set math.equation(numbering: n => "(4.6)")
   $ max_(1 lt.eq j lt.eq k) A_(Z_j) \( F \) gt.eq 2 delta #h(2em) upright("for every ") F in cal(K) . $ <eq:uniform-volume-speed>]
  Let $Psi_j^t$ be the flow of $Z_j$. These flows preserve $B$ in both time directions. If $J_j \( t \, x \)$ is the ambient volume Jacobian, then
  $ G_j \( t \, F \) := \| Psi_j^t \( F \) \| = integral_F J_j \( t \, x \) thin d "Vol"_g \( x \) \, #h(2em) partial_t G_j \( 0 \, F \) = A_(Z_j) \( F \) . $
  Smoothness of the finitely many flows gives uniform bounds on $partial_t^2 J_j$ on a fixed compact set for small $\| t \|$. Since $\| F \| lt.eq \| B \|$, there is a common $tau > 0$ such that
  $ \| partial_t G_j \( t \, F \) - A_(Z_j) \( F \) \| lt.eq delta quad \( \| t \| lt.eq tau \, med F in cal(K) \, med 1 lt.eq j lt.eq k \) . $
  For an index satisfying (4.6), the function $t mapsto G_j \( t \, F \)$ thus has derivative at least $delta$ on $\[ - tau \, tau \]$. It follows that every $w$ with $\| w - \| F \| \| < delta tau$ is attained for some $t$ satisfying
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| Psi_j^t \( F \) \| = w \, #h(2em) \| t \| lt.eq delta^(- 1) \| w - \| F \| \| . $ <eq:volume-adjustment-time>]
  By Lemma 12, perimeter transforms by the tangential Jacobian of a smooth diffeomorphism on the reduced boundary. Applied to these finitely many flows, this gives
  $ P \( Psi_j^t \( F \) \) & = integral_(partial^(*) F) J_m #scale(x: 120%, y: 120%)[\(] D Psi_j^t \( x \) \|_(T_x partial^(*) F) #scale(x: 120%, y: 120%)[\)] thin d cal(H)_g^m \( x \) \,\
\| P \( Psi_j^t \( F \) \) - P \( F \) \| & lt.eq C \| t \| P \( F \) #h(2em) \( \| t \| lt.eq tau \) . $
  Here $C$ is uniform over the finitely many flows and all $m$-planes above the compact set $overline(B)$. Equation (4.7) and the bound $P \( F \) lt.eq C_0$ show that changing the volume by $Delta v$ costs at most $C C_0 delta^(- 1) \| Delta v \|$ in perimeter.
  Apply this construction first to a minimizer at $v$ and then to a minimizer at $w$, where $v \, w in \[ v_(-) \, v_(+) \]$ and $\| v - w \| < delta tau$. Both are in $cal(K)$, and the resulting competitors give
  $ \| I \( v \) - I \( w \) \| lt.eq C C_0 delta^(- 1) \| v - w \| . $
  This proves local Lipschitz continuity. All constants here may depend on the fixed ball and interval; no uniform regularity of the minimizers is required. ◻
]

The profile can now be differentiated at almost every volume. The next lemma identifies its derivative on free boundary patches and obtains the needed one-sided bound at contact. Figure 1 shows why both parts must enter the same ambient perimeter; in the figure, $rho = d \( o \, dot.op \)$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 2.09, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  merge-path({arc((0.5409, 2.019), start: 75deg, stop: 105deg, radius: 2.09); bezier((-0.5409, 2.019), (-0.9975, -0.4275), (-1.567, 1.748), (-1.52, 0.475)); bezier((-0.9975, -0.4275), (1.14, -0.5225), (-0.5225, -1.282), (0.7125, -1.33)); bezier((1.14, -0.5225), (0.5409, 2.019), (1.615, 0.38), (1.567, 1.748))}, close: true, fill: rgb("#ededff"), stroke: none)
  bezier((-0.5409, 2.019), (-0.9975, -0.4275), (-1.567, 1.748), (-1.52, 0.475), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((-0.9975, -0.4275), (1.14, -0.5225), (-0.5225, -1.282), (0.7125, -1.33), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.14, -0.5225), (0.5409, 2.019), (1.615, 0.38), (1.567, 1.748), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  arc((0.5409, 2.019), start: 75deg, stop: 105deg, radius: 2.09, stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10))
  content((0, 0.285), [$E$])
  content((2.422, -1.71), [#text(fill: rgb("#606060"))[$partial B$]])
  line((2.09, -1.662), (1.577, -1.377), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#acacac"))))
  line((0, 2.09), (0, 2.708), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.708), [$N= "nabla" rho$], anchor: "west", padding: 0.1176cm)
  content((0.9975, 2.328), [#text(fill: rgb("#cc6600"))[$C= Gamma inter partial B$]], anchor: "west", padding: 0.1176cm)
  line((0.95, 2.28), (0.399, 2.061), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#cc6600"))))
  content((2.185, 0.4275), [#text(fill: rgb("#0000b2"))[free part $Sigma inter B$]], anchor: "west", padding: 0.1176cm)
  line((2.185, 0.304), (1.396, 0.1425), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
})],
  caption: [Figure 1: The confined problem minimizes full ambient perimeter, including contact with the confining sphere. The occupied phase fixes the outward normal. Free variations give $m h = I' \( v \)$; inward variations give $m h lt.eq I' \( v \)$ almost everywhere on the contact set. The planar drawing is schematic: the proof does not assume that the contact set contains an open patch. ],
) <fig:confined-boundary>

#thm([Lemma 4.5.])[
  (Mean curvature at differentiability volumes).  #emph[Let $v in \( 0 \, \| B \| \)$ be a differentiability point of $I$, and let $E$ be a minimizer as in Proposition 13. With $m h = "div"_Sigma N$ and $h_0 = I' \( v \) \/ m$, one has 
$ I' \( v \) > 0 \, #h(2em) h = h_0 med upright("on ") Sigma ∩ B \, #h(2em) 0 lt.eq h lt.eq h_0 quad upright("almost everywhere on ") Sigma . $

 In particular, $h^2 lt.eq h_0^2$ almost everywhere on $Sigma$.]
] <lem:profile-curvature>

#proof[
  For a smooth flow $Psi^t$ with $E_t = Psi^t \( E \)$, set $P \( t \) = P \( E_t \)$ and $V \( t \) = \| E_t \|$. Whenever the flow is admissible,
  #[#set math.equation(numbering: n => "(4.8)")
   $ P \( t \) gt.eq I \( V \( t \) \) \, #h(2em) P \( 0 \) = I \( v \) \, #h(2em) V \( 0 \) = v . $ <eq:profile-variation-comparison>]
  For a field supported on a free regular patch, admissibility holds for both signs of $t$. Differentiating at the minimum in (4.8) gives $P' \( 0 \) = I' \( v \) V' \( 0 \)$. The first variation formulas are
  $ V' \( 0 \) = integral_Sigma chevron.l Z \, N chevron.r thin d sigma \, #h(2em) P' \( 0 \) = m integral_Sigma h chevron.l Z \, N chevron.r thin d sigma . $
  Arbitrary smooth compactly supported normal speeds on the patch therefore give $m h = I' \( v \)$. This holds on every free regular patch, so $h = h_0$ throughout $Sigma ∩ B$. Such patches exist by (4.5).
  To determine the sign of $h_0$, put $rho \( x \) = d \( o \, x \)$ and $F \( x \) = rho \( x \)^2 \/ 2$. The function $F$ is smooth on $M$, including at $o$. Hessian comparison gives
  $ "Hess" F = d rho ⊗ d rho + rho "Hess" rho gt.eq d rho ⊗ d rho + \( g - d rho ⊗ d rho \) = g \, $
  with the inequality at $o$ understood by smooth extension. The flow of $- nabla F$ is
  $ Psi^t \( x \) = exp_o #scale(x: 120%, y: 120%)[\(] e^(- t) exp_o^(- 1) \( x \) #scale(x: 120%, y: 120%)[\)] . $
  It sends $B$ into itself for $t gt.eq 0$. The volume and perimeter Jacobian formulas give
  #[#set math.equation(numbering: n => "(4.9)")
   $ V' \( 0 \) & = - integral_E Delta F thin d "Vol"_g lt.eq - n v < 0 \,\
P' \( 0 \) & = - integral_(partial^(*) E) "tr"_(T_x partial^(*) E) \( "Hess" F \) thin d cal(H)_g^m \( x \) lt.eq - m P \( E \) < 0 . $ <eq:radial-volume-derivative>]
  These formulas apply to the reduced boundary as a rectifiable set, so they include its contact portion and do not require smoothness at singular points. The integrands and their flow derivatives are bounded on a fixed compact neighborhood of $overline(B)$. The one-sided derivative of (4.8) now yields
  $ P' \( 0 \) - I' \( v \) V' \( 0 \) gt.eq 0 . $
  Since $V' \( 0 \) < 0$, division reverses the inequality and gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ I' \( v \) gt.eq frac(P' \( 0 \), V' \( 0 \)) > 0 . $ <eq:profile-derivative-positive>]
  It remains to control the contact set $C = Gamma ∩ partial B$. At every point of $C$, the $C^1$ boundary of $E$ is tangent to the sphere and has the same outward normal $N = nabla rho$: the region lies on the inner side of the sphere. At almost every such point $x$, its local $C^(1 \, 1)$ graph has a second-order expansion. In normal coordinates at $x$, with the common outward normal pointing upward, write the boundary of $E$ and the sphere as graphs $u$ and $beta$. They have equal values and first derivatives at $x$, and $u lt.eq beta$. Thus $D^2 u \( x \) lt.eq D^2 beta \( x \)$. In these coordinates their second fundamental forms for the outward normal are $- D^2 u \( x \)$ and $- D^2 beta \( x \)$, respectively. Hessian comparison on the sphere therefore gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ upright("II")_Gamma \( x \) gt.eq upright("II")_(partial B) \( x \) \, #h(2em) h \( x \) gt.eq R_B^(- 1) > 0 quad upright("for almost every ") x in C . $ <eq:contact-curvature-lower>]
  Choose an open collar $U$ of $partial B$ whose closure avoids $S$ and $o$ and in which $Gamma$ is $C^(1 \, 1)$. For arbitrary $phi in C_c^oo \( U \)$ with $phi gt.eq 0$, the smooth field $Z = - phi nabla rho$, extended by zero, has an admissible flow for $t gt.eq 0$, because $rho$ is nonincreasing along its trajectories. The one-sided variation inequality gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ m integral_Sigma \( h - h_0 \) chevron.l Z \, N chevron.r thin d sigma gt.eq 0 . $ <eq:contact-variation>]
  For completeness, the perimeter first variation used here is obtained by integrating $"div"_Sigma Z = "div"_Sigma Z^(sans(T)) + m h chevron.l Z \, N chevron.r$ on the whole $C^(1 \, 1)$ hypersurface in the collar. The tangential divergence integrates to zero, since its support is compact in $Sigma$. Thus there is no additional term on the transition between the free and contact portions.
  The integrand in (4.12) vanishes on the free portion, where $h = h_0$, while $chevron.l Z \, N chevron.r = - phi$ on $C$. Consequently
  $ integral_C \( h - h_0 \) phi thin d sigma lt.eq 0 #h(2em) \( phi in C_c^oo \( U \) \, med phi gt.eq 0 \) . $
  Nonnegative smooth ambient tests determine the sign of a Radon measure, so $h lt.eq h_0$ almost everywhere on $C$, irrespective of whether $C$ has relative interior. Combining this with (4.11), $h = h_0$ on the free portion, and (4.10), gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ 0 lt.eq h lt.eq h_0 \, #h(2em) h^2 lt.eq h_0^2 quad upright("almost everywhere on ") Sigma . $ <eq:profile-curvature-bound>]
  ◻
]

== 5 From the hypersurface inequality to model comparison <sec:comparison>

Fix $b in { 0 \, 1 }$, assume $sec_M lt.eq - b^2$, and let $n = m + 1 gt.eq 4$. We use the confined profile $I$ in a geodesic ball $B = B_(R_B) \( o \)$ from Section 4. A minimizing boundary has the decomposition $Gamma = Sigma union S$ of Proposition 13: $Gamma$ is compact, $S subset.double B$ is closed, and $Sigma = Gamma \\ S$ is a boundaryless $C_(upright("loc"))^(1 \, 1)$ hypersurface. Its area measure records the entire perimeter, including obstacle contact:

#[#set math.equation(numbering: n => "(5.1)")
 $ P \( E \; D \) = sigma \( Sigma ∩ D \) #h(2em) upright("for every Borel set ") D subset M . $ <eq:regular-perimeter-measure>]

At a differentiability volume $v$, Lemma 15 gives $0 lt.eq h lt.eq I' \( v \) \/ m$ almost everywhere on the regular boundary. The constant Sobolev test would therefore bound the profile derivative from below in terms of $I \( v \)$. Although $Gamma$ is compact, its regular part $Sigma = Gamma \\ S$ need not be compact, so compactness of $Gamma$ alone does not justify that test. We will approximate it by compactly supported cutoffs whose Dirichlet energy tends to zero. This requires area growth near $S$, which we obtain directly from constrained minimality.

=== 5.1 Area growth by deletion and volume repair <area-growth-by-deletion-and-volume-repair>

Deleting a small ball removes boundary near a singular point and creates at most the area of the distance sphere. A variation on a fixed free patch will restore the lost volume. We first record the deletion estimate for finite-perimeter sets, so neither operation presupposes regularity at the singular point.

#thm([Lemma 5.1.])[
  (Deleting a geodesic ball).  #emph[Let $E$ have finite volume and perimeter in a complete smooth Riemannian manifold, let $x in M$, and let $0 < r < "inj" \( x \)$. Then 
#[#set math.equation(numbering: n => "(5.2)")
 $ P \( E \\ B_r \( x \) \) lt.eq P \( E \; M \\ overline(B)_r \( x \) \) + cal(H)_g^(n - 1) \( partial B_r \( x \) \) . $ <eq:bv-deletion>]

 For all but countably many radii in any bounded interval, $P \( E \; partial B_r \( x \) \) = 0$, so the perimeters on the two open sides sum to $P \( E \)$.]
] <lem:bv-deletion>

#proof[
  For a bounded Lipschitz scalar $phi$, distributional testing gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ D \( phi chi_E \) = phi D chi_E + chi_E nabla phi thin d "Vol"_g . $ <eq:bv-multiplier>]
  First prove this for smooth multipliers. On a compact neighborhood of a test field’s support, approximate $phi$ smoothly, uniformly and in $W^(1 \, 1)$. Uniform convergence controls the measure term and $W^(1 \, 1)$ convergence controls the second term, since $\| chi_E \| lt.eq 1$. This proves the displayed distributional identity.
  Take
  $ phi_epsilon \( y \) = min { 1 \, max { 0 \, \( d \( x \, y \) - r \) \/ epsilon } } \, #h(2em) r + epsilon < "inj" \( x \) . $
  Its derivative is supported in a compact annulus. The products $phi_epsilon chi_E$ converge in $L^1$ to $chi_(E \\ B_r \( x \))$, because the smooth distance sphere has ambient volume zero. Lower semicontinuity and (5.3) give
  $ P \( E \\ B_r \( x \) \) & lt.eq liminf_(epsilon arrow.b 0) (integral phi_epsilon thin d \| D chi_E \| + frac(\| E ∩ \( B_(r + epsilon) \( x \) \\ B_r \( x \) \) \|, epsilon))\
 & lt.eq P \( E \; M \\ overline(B)_r \( x \) \) + frac(d, d s)\|_(s = r) \| B_s \( x \) \| . $
  Polar coordinates identify the last derivative with the area of the distance sphere. Finally, disjoint spheres can carry positive mass for a finite measure at only countably many radii. ◻
]

#thm([Lemma 5.2.])[
  (Area growth at singular points).  #emph[Let $0 < v < "Vol" \( B \)$, and let $E$ be a confined minimizing region of volume $v$. There are constants $C < oo$ and $r_0 > 0$, depending on $E$ and $B$, such that 
#[#set math.equation(numbering: n => "(5.4)")
 $ sigma #scale(x: 120%, y: 120%)[\(] Sigma ∩ B_r \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq C r^m #h(2em) \( x in S \, med 0 < r < r_0 \) . $ <eq:singular-area-growth>]

]
] <lem:area-growth>

#proof[
  Suppose $S eq.not diameter$, since otherwise the assertion is empty. By (4.5) and (4.4), there is a free smooth boundary point. Choose a neighborhood $W$ of that point with $overline(W) subset B \\ S$ so small that $Gamma ∩ W$ is smooth. Extend a nonnegative, nonzero normal variation of a smaller patch to a smooth field $Z$ compactly supported in $W$. With $N$ the outward normal, this gives
  $ a := integral_(Sigma ∩ W) chevron.l Z \, N chevron.r thin d sigma > 0 . $
  Let $phi.alt_t$ be its flow and put $G \( t \) = "Vol" \( phi.alt_t \( E \) \) - "Vol" \( E \)$. The volume Jacobian formula gives $G' \( 0 \) = a$. Choose $t_0 > 0$ so that $G' \( t \) gt.eq a \/ 2$ for $0 lt.eq t lt.eq t_0$. The flow preserves $W$ and $B$ and fixes $M \\ W$. Whenever a finite-perimeter set $F$ agrees with $E$ almost everywhere on $W$, the volume Jacobian minus one is supported in $W$, so
  #[#set math.equation(numbering: n => "(5.5)")
   $ "Vol" \( phi.alt_t \( F \) \) - "Vol" \( F \) = G \( t \) . $ <eq:fixed-patch-volume>]
  The tangential Jacobian formula and locality of the reduced boundary likewise give
  $ P \( phi.alt_t \( F \) \) - P \( F \) = integral_(partial^(*) E ∩ W) (J_m #scale(x: 120%, y: 120%)[\(] D phi.alt_t \|_(T_x partial^(*) E) #scale(x: 120%, y: 120%)[\)] - 1) thin d cal(H)_g^m \( x \) . $
  On the compact support of the flow, the tangential Jacobians satisfy $\| J_m - 1 \| lt.eq L t$ uniformly over all tangent $m$-planes for $0 lt.eq t lt.eq t_0$. Hence
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| P \( phi.alt_t \( F \) \) - P \( F \) #scale(x: 120%, y: 120%)[\|] lt.eq L P \( E \; W \) t . $ <eq:fixed-patch-perimeter>]
  Every volume deficit $0 lt.eq delta lt.eq a t_0 \/ 2$ can therefore be repaired by a time $0 lt.eq t lt.eq 2 delta \/ a$, at perimeter cost at most $C_R delta$, where $C_R = 2 L P \( E \; W \) \/ a$. The bound is independent of $F$ as long as $F = E$ almost everywhere on $W$.
  Compactness of $S$ and its disjointness from $overline(W) union partial B$ give $rho_(*) > 0$ such that
  $ B_(2 rho_(*)) \( x \) subset B \\ overline(W) #h(2em) \( x in S \) . $
  After decreasing $rho_(*)$, smoothness of the ambient metric on a compact neighborhood of $S$ gives uniform constants $C_V \, C_A$ with
  #[#set math.equation(numbering: n => "(5.7)")
   $ "Vol" \( B_r \( x \) \) lt.eq C_V r^n \, #h(2em) cal(H)_g^m \( partial B_r \( x \) \) lt.eq C_A r^m quad \( x in S \, med 0 < r < rho_(*) \) . $ <eq:small-ambient-balls>]
  Decrease $rho_(*)$ again so that $C_V rho_(*)^n lt.eq a t_0 \/ 2$.
  Fix $x in S$. For almost every $r in \( 0 \, rho_(*) \)$, one has $P \( E \; partial B_r \( x \) \) = 0$. At such radii set $F = E \\ B_r \( x \)$; Lemma 16, applied to $E$, gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ P \( F \) lt.eq P \( E \; M \\ overline(B_r \( x \)) \) + cal(H)_g^m \( partial B_r \( x \) \) . $ <eq:deleted-perimeter>]
  The volume deficit is $delta = "Vol" \( E ∩ B_r \( x \) \) lt.eq C_V r^n$, and $F = E$ on $W$. Use (5.5) to repair this deficit by a flow time $t lt.eq 2 delta \/ a$. The repaired set remains in $B$ and has volume $v$. Minimality, (5.6), and (5.8) imply
  $ P \( E \; B_r \( x \) \) & lt.eq cal(H)_g^m \( partial B_r \( x \) \) + C_R delta\
 & lt.eq C_A r^m + C_R C_V r^n lt.eq C_0 r^m \, $
  where $C_0 = C_A + C_R C_V rho_(*)$ because $n = m + 1$. The constants are uniform in $x in S$.
  For an arbitrary $0 < r < rho_(*) \/ 2$, choose a good radius $rho in \( r \, 2 r \)$. Monotonicity of the perimeter measure gives
  $ P \( E \; B_r \( x \) \) lt.eq P \( E \; B_rho \( x \) \) lt.eq 2^m C_0 r^m . $
  Together with (5.1), this proves the claim with $r_0 = rho_(*) \/ 2$. ◻
]

=== 5.2 Removing the singular set from the constant test <removing-the-singular-set-from-the-constant-test>

The area bound turns a cutoff gradient of order $r^(- 1)$ on a ball of radius $r$ into an energy cost of order $r^(m - 2)$. The small Hausdorff dimension of the singular set will make the sum of these costs tend to zero. We isolate the cutoff construction because the same conclusion will later apply to the boundary of an equality set.

#thm([Lemma 5.3.])[
  (Cutoffs around a set of zero capacity).  #emph[Let $Gamma$ be a compact subset of a smooth Riemannian manifold, and let $S subset Gamma$ be closed. Suppose that $Sigma = Gamma \\ S$ is an embedded, boundaryless, locally $C^(1 \, 1)$ hypersurface of dimension $m gt.eq 3$ and finite area. Assume $cal(H)^(m - 2) \( S \) = 0$ and that, for some $C \, r_0 > 0$, 
$ sigma \( Sigma ∩ B_r \( x \) \) lt.eq C r^m #h(2em) \( x in S \, med 0 < r < r_0 \) . $

 There are $eta_j in "Lip"_c \( Sigma \)$ such that 
#[#set math.equation(numbering: n => "(5.9)")
 $ 0 lt.eq eta_j lt.eq 1 \, #h(2em) eta_j \( x \) arrow.r 1 quad \( x in Sigma \) \, #h(2em) integral_Sigma \| nabla_Sigma eta_j \|^2 thin d sigma arrow.r 0 . $ <eq:singular-cutoff-properties>]

 If $S = diameter$, the choice $eta_j = 1$ works in every dimension.]
] <lem:capacity-cutoffs>

#proof[
  If $S = diameter$, then $Sigma = Gamma$ is compact and we take $eta_j = 1$, including when $Sigma$ has several components. Otherwise, use $cal(H)^(m - 2) \( S \) = 0$ as follows. For each positive integer $j$, choose a finite covering
  #[#set math.equation(numbering: n => "(5.10)")
   $ S subset union.big_(i = 1)^(N_j) B_(r_(j i)) \( x_(j i) \) \, #h(2em) x_(j i) in S \,\
0 < r_(j i) < min \( 2^(- j) \, r_0 \/ 4 \) \, #h(2em) sum_(i = 1)^(N_j) r_(j i)^(m - 2) < 2^(- j) . $ <eq:singular-cover>]
  Indeed, Hausdorff nullity first gives a countable open-ball cover with arbitrarily small radii and sum. Recenter the balls at points of $S$ with a fixed enlargement, starting with tolerances small enough to absorb this enlargement, and take a finite subcover by compactness.
  Put $theta \( t \) = min { 1 \, max { 0 \, t - 1 } }$ for $t gt.eq 0$, and define
  $ eta_(j i) \( x \) = theta #h(-0.16667em) (frac(d \( x \, x_(j i) \), r_(j i))) \, #h(2em) eta_j = min_(1 lt.eq i lt.eq N_j) eta_(j i) \|_Sigma . $
  Each ambient cutoff vanishes on $B_(r_(j i)) \( x_(j i) \)$, is one outside $B_(2 r_(j i)) \( x_(j i) \)$, and has Lipschitz constant at most $r_(j i)^(- 1)$. A finite minimum is Lipschitz, and almost everywhere
  $ \| nabla_Sigma eta_j \|^2 lt.eq sum_(i = 1)^(N_j) \| nabla_Sigma eta_(j i) \|^2 . $
  There is no restriction on the overlap of the balls. Applying the assumed area bound at their doubled radii gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_Sigma \| nabla_Sigma eta_j \|^2 thin d sigma & lt.eq sum_i r_(j i)^(- 2) sigma \( Sigma ∩ B_(2 r_(j i)) \( x_(j i) \) \)\
 & lt.eq 2^m C sum_i r_(j i)^(m - 2) < 2^m C thin 2^(- j) . $ <eq:singular-cutoff-energy>]
  The open balls in (5.10) form a neighborhood of $S$ on which $eta_j$ vanishes. Its support is therefore contained in a compact subset of $Gamma \\ S$. The embedded graph charts identify the subspace and manifold topologies on $Sigma$, so this support is compact in $Sigma$. For each fixed $x in Sigma$, closedness of $S$ gives $d \( x \, S \) > 0$. As the maximum radius tends to zero, the doubled balls eventually miss $x$, and $eta_j \( x \) = 1$. This proves (5.9), without assuming completeness of $Sigma$ or finiteness of its components. ◻
]

#thm([Lemma 5.4.])[
  (The constant test).  #emph[Let $v in \( 0 \, "Vol" \( B \) \)$ be a differentiability point of $I$, and let $E$ minimize the confined perimeter at volume $v$. Then 
#[#set math.equation(numbering: n => "(5.12)")
 $ m integral_Sigma \( h^2 - b^2 \) thin d sigma gt.eq Y_m I \( v \)^(\( m - 2 \) \/ m) . $ <eq:constant-sobolev>]

]
] <lem:constant-test>

#proof[
  Lemma 15 gives $0 lt.eq h lt.eq h_0 := I' \( v \) \/ m < oo$ almost everywhere on $Sigma$. If $S eq.not diameter$, the singular-dimension bound gives
  $ dim_(cal(H)) S lt.eq n - 8 = m - 7 < m - 2 \, #h(2em) cal(H)^(m - 2) \( S \) = 0 . $
  Lemma 17 and the compact embedded boundary structure therefore verify the hypotheses of Lemma 18. That lemma supplies cutoffs with (5.9); when $S = diameter$ take $eta_j = 1$.
  Apply Theorem 7 to these cutoffs:
  $ c integral_Sigma \| nabla_Sigma eta_j \|^2 thin d sigma + m integral_Sigma \( h^2 - b^2 \) eta_j^2 thin d sigma gt.eq Y_m (integral_Sigma eta_j^q thin d sigma)^(2 \/ q) . $
  The area is $I \( v \) < oo$, and $\| h^2 - b^2 \| lt.eq h_0^2 + b^2$ almost everywhere. Dominated convergence and (5.9) prove (5.12), since $2 \/ q = \( m - 2 \) \/ m$. The same construction applies in every dimension under consideration: when $4 lt.eq n lt.eq 7$ the singular set is empty, and when $n = 8$ its possible infinite zero-dimensional compact set still admits the covers in (5.10). ◻
]

=== 5.3 The profile differential inequality and its integral <the-profile-differential-inequality-and-its-integral>

The singular set has now been removed from the constant test without assuming completeness of the regular locus. The curvature bound from the confined profile can therefore be inserted in the sharp Sobolev inequality. This is the step that reduces the geometric problem to one scalar differential inequality.

#thm([Proposition 5.5.])[
  (Profile differential inequality).  #emph[For almost every $v in \( 0 \, "Vol" \( B \) \)$, 
#[#set math.equation(numbering: n => "(5.13)")
 $ I' \( v \) gt.eq m sqrt(b^2 + (frac(s_m, I \( v \)))^(2 \/ m)) . $ <eq:profile-differential>]

]
] <prop:profile-ode>

#proof[
  The profile is locally Lipschitz by Lemma 14, hence differentiable almost everywhere. At a differentiability volume choose a minimizer. Lemma 15 gives $h_0 = I' \( v \) \/ m > 0$ and $h^2 lt.eq h_0^2$ almost everywhere on its regular boundary. Lemma 19 therefore gives
  $ m \( h_0^2 - b^2 \) I \( v \) gt.eq Y_m I \( v \)^(\( m - 2 \) \/ m) . $
  Since $I \( v \) > 0$ and $Y_m = m s_m^(2 \/ m)$, division yields
  $ h_0^2 gt.eq b^2 + (frac(s_m, I \( v \)))^(2 \/ m) . $
  Taking the positive square root proves (5.13). ◻
]

#thm([Theorem 5.6.])[
  (Comparison in the normalized curvatures).  #emph[Let $n gt.eq 4$ and $b in { 0 \, 1 }$. If $M^n$ is complete, simply connected and smooth, with $sec_M lt.eq - b^2$, then every bounded measurable set $E subset M$ of finite perimeter and positive volume satisfies 
$ P \( E \) gt.eq cal(I)_b \( "Vol" \( E \) \) . $

]
] <thm:normalized-comparison>

#proof[
  Choose radii $0 < R_0 < R$ such that $E subset B_(R_0) \( o \)$ up to a null set, and put $B = B_R \( o \)$. The annulus $B_R \( o \) \\ overline(B_(R_0) \( o \))$ has positive volume, so $"Vol" \( B \) > "Vol" \( E \)$. Recall the model area and volume functions
  $ cal(A)_b \( r \) = s_m "sn"_b \( r \)^m \, #h(2em) cal(V)_b \( r \) = s_m integral_0^r "sn"_b \( t \)^m thin d t . $
  Both are strictly increasing from zero to infinity. For $A > 0$ put
  #[#set math.equation(numbering: n => "(5.14)")
   $ R_b \( A \) = cal(A)_b^(- 1) \( A \) \, #h(2em) cal(W)_b \( A \) = cal(V)_b \( R_b \( A \) \) . $ <eq:inverse-model-profile>]
  Thus $cal(W)_b$ is strictly increasing. The identities $"sn"'_b = "cs"_b$ and $"cs"_b^2 - b^2 "sn"_b^2 = 1$ give
  #[#set math.equation(numbering: n => "(5.15)")
   $ cal(W)'_b \( A \) & = frac("sn"_b \( R_b \( A \) \), m "cs"_b \( R_b \( A \) \))\
 & = frac(1, m sqrt(b^2 + \( s_m \/ A \)^(2 \/ m))) . $ <eq:inverse-profile-derivative>]
  On every interval $\[ epsilon \, v \] subset \( 0 \, "Vol" \( B \) \)$, the positive Lipschitz function $I$ has image in a compact subset of $\( 0 \, oo \)$, where $cal(W)_b$ is continuously differentiable. Thus $cal(W)_b compose I$ is absolutely continuous there. Proposition 20, the chain rule, and (5.15) imply
  $ \( cal(W)_b compose I \)' \( s \) = cal(W)'_b \( I \( s \) \) I' \( s \) gt.eq 1 quad upright("for almost every ") s in \[ epsilon \, v \] . $
  Integrating yields
  $ cal(W)_b \( I \( v \) \) gt.eq cal(W)_b \( I \( epsilon \) \) + v - epsilon gt.eq v - epsilon . $
  Letting $epsilon arrow.b 0$, we obtain
  #[#set math.equation(numbering: n => "(5.16)")
   $ cal(W)_b \( I \( v \) \) gt.eq v #h(2em) \( 0 < v < "Vol" \( B \) \) . $ <eq:integrated-profile>]
  This endpoint passage uses only nonnegativity of $cal(W)_b \( I \( epsilon \) \)$.
  Set $V = "Vol" \( E \)$. The choice of $B$ gives $0 < V < "Vol" \( B \)$, and $E$ is an admissible competitor in (4.1). Consequently
  $ P \( E \) gt.eq I \( V \) . $
  This step uses the full ambient perimeter of $E$, with no regularity assumption on its boundary. If $r > 0$ is determined by $cal(V)_b \( r \) = V$, then $cal(W)_b \( cal(A)_b \( r \) \) = V$. Equation (5.16) and strict monotonicity of $cal(W)_b$ give $I \( V \) gt.eq cal(A)_b \( r \) = cal(I)_b \( V \)$, which proves the assertion. ◻
]

== 6 All dimensions and finite-volume sets <sec:dimensions>

Theorem 21 already gives the comparison for bounded sets of finite ambient perimeter in dimensions at least four. We first obtain the same statement in dimensions two and three by smooth approximation. A single cutoff argument then removes boundedness, and metric rescaling restores every negative curvature bound.

=== 6.1 The classical lower-dimensional inequalities <the-classical-lower-dimensional-inequalities>

We first check that the classical smooth comparisons allow disconnected domains. For $b gt.eq 0$ and $r = cal(V)_b^(- 1) \( V \) > 0$,

$ cal(I)'_b \( V \) = m frac("cs"_b \( r \), "sn"_b \( r \)) > 0 \, #h(2em) frac(d, d r) frac("cs"_b \( r \), "sn"_b \( r \)) = - frac(1, "sn"_b \( r \)^2) < 0 . $

Thus $cal(I)_b$ is concave. Since $cal(I)_b \( 0 \) = 0$, concavity between $0$ and $u + v$ gives

$ cal(I)_b \( u \) gt.eq frac(u, u + v) cal(I)_b \( u + v \) \, #h(2em) cal(I)_b \( v \) gt.eq frac(v, u + v) cal(I)_b \( u + v \) . $

Adding proves subadditivity. Consequently, comparisons for the finitely many connected components of a relatively compact smooth domain imply the comparison at its total volume.

In dimension three, Kleiner’s Theorem 2 #cite(label("Kleiner1992")) p. 38 gives the model comparison for every upper sectional-curvature bound $kappa lt.eq 0$ on a complete simply connected manifold, for arbitrary compact smooth domains. Apply this result to each connected component and use subadditivity if necessary.

In dimension two, the classical Weil–Bol inequality #cite(label("Weil1926")) #cite(label("Bol1941")), in the smooth disk formulation of Chavel and Feldman #cite(label("ChavelFeldman1980")) Isoperimetric Inequality (I), p. 83, gives, for a smooth disk of area $V$ and boundary length $L$ under $K lt.eq kappa lt.eq 0$,

$ L^2 gt.eq 4 pi V - kappa V^2 \; $

This disk statement suffices for arbitrary relatively compact smooth domains. The Cartan–Hadamard theorem identifies the surface with $bb(R)^2$. Direct evaluation of the two-dimensional model functions gives $cal(I)_(sqrt(- kappa)) \( V \) = sqrt(4 pi V - kappa V^2)$. Fill the holes in each connected component, retaining its outer boundary. The resulting smooth disk has at least the original area and no greater boundary length. The disk inequality and monotonicity therefore bound the original component’s boundary length below by the model profile at its original area. Summing and using subadditivity proves the comparison for the original domain, even when the filled disks overlap.

=== 6.2 Smooth approximation in a fixed neighborhood <smooth-approximation-in-a-fixed-neighborhood>

Recall that $B V \( M \)$ consists of integrable functions with finite distributional variation. Strict convergence means $L^1$ convergence together with convergence of the total masses $\| D u \| \( M \)$. For $u = chi_E$, that mass is the full ambient perimeter.

The following form of approximation preserves ambient perimeter. No correction to impose exactly equal volumes is needed.

#thm([Lemma 6.1.])[
  (Smooth approximation).  #emph[Let $M$ be a complete connected smooth Riemannian manifold without boundary. Let $E$ have finite ambient perimeter, and suppose that $\| E \\ K \| = 0$ for a compact set $K subset M$. For every open neighborhood $U supset K$ with compact closure, there are relatively compact open sets $E_j subset.double U$ with smooth boundary such that 
$ \| E_j triangle.stroked.t E \| arrow.r 0 \, #h(2em) P \( E_j \) arrow.r P \( E \) . $

 The sets $E_j$ need not be connected.]
] <lem:smooth-bv-approximation>

#proof[
  Strict smooth approximation on complete manifolds #cite(label("GuneysuPallara2015")) Theorem 2.12 in the author preprint provides smooth compactly supported functions $f_j$ with
  $ parallel f_j - chi_E parallel_(L^1 \( M \)) arrow.r 0 \, #h(2em) integral_M \| nabla f_j \| thin d "Vol"_g arrow.r P \( E \) . $
  The cited result assumes completeness, smoothness, connectedness, and absence of boundary; it imposes no curvature condition. We may take real parts, since doing so cannot increase the $L^1$ error or gradient integral, and lower semicontinuity gives the reverse limiting bound.
  Choose $eta in C_c^oo \( U \)$ with $0 lt.eq eta lt.eq 1$ and $eta = 1$ near $K$, and put $u_j = eta f_j$. Then $u_j arrow.r chi_E$ in $L^1 \( M \)$, and $chi_E nabla eta = 0$ almost everywhere. Hence
  $ integral_M \| nabla u_j \| thin d "Vol"_g lt.eq integral_M \| nabla f_j \| thin d "Vol"_g + parallel nabla eta parallel_oo parallel f_j - chi_E parallel_1 . $
  Lower semicontinuity shows that the left side also converges to $P \( E \)$. Thus all approximating functions now have support in the same compact subset of $U$.
  Write $e_j = parallel u_j - chi_E parallel_1$, and choose $0 < delta_j < 1 \/ 2$ with $delta_j arrow.r 0$ and $e_j \/ delta_j arrow.r 0$. For $delta_j < t < 1 - delta_j$, pointwise comparison with $chi_E$ gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ \| { u_j > t } triangle.stroked.t E #scale(x: 120%, y: 120%)[\|] lt.eq delta_j^(- 1) e_j . $ <eq:threshold-volume-error>]
  The ordinary coarea formula for the smooth function $u_j$ gives
  $ integral_(delta_j)^(1 - delta_j) P \( { u_j > t } \) thin d t lt.eq integral_M \| nabla u_j \| thin d "Vol"_g . $
  By Sard’s Theorem, almost every $t$ is a regular value. We can therefore choose such a $t_j in \( delta_j \, 1 - delta_j \)$ with
  $ P \( { u_j > t_j } \) lt.eq frac(1, 1 - 2 delta_j) integral_M \| nabla u_j \| thin d "Vol"_g + 1 / j . $
  Set $E_j = { u_j > t_j }$. Its boundary is smooth and compact in $U$. Equation (6.1) gives $L^1$ convergence of the characteristic functions. The displayed perimeter bound and lower semicontinuity give the claimed perimeter convergence. ◻
]

Apply Lemma 22 to a bounded finite-perimeter set in a two- or three-dimensional Cartan–Hadamard manifold. The smooth comparison just proved applies to every $E_j$, including its disconnected cases. Since $\| E_j \| arrow.r \| E \|$ and $cal(I)_b$ is continuous, it passes to $E$. Together with Theorem 21, this establishes the normalized comparison for bounded finite-perimeter sets in every dimension $n gt.eq 2$.

=== 6.3 Removing boundedness <removing-boundedness>

We record the cutoff argument separately, since it applies to any continuous increasing perimeter lower bound.

#thm([Lemma 6.2.])[
  (Passage to finite volume).  #emph[Let $M$ be a complete connected smooth Riemannian manifold without boundary. Let $J : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ be continuous and increasing, with $J \( 0 \) = 0$. Suppose that $P \( F \) gt.eq J \( \| F \| \)$ for every bounded finite-perimeter set $F subset M$. Then the same inequality holds for every measurable $E$ of finite volume and finite ambient perimeter.]
] <lem:finite-volume-cutoff>

#proof[
  We use two elementary BV identities. For a compactly supported Lipschitz function $phi$ and bounded $u in B V \( M \)$, the product rule is
  $ D \( phi u \) = phi thin D u + u nabla phi thin d "Vol"_g . $
  It follows from the distributional product rule for smooth multipliers by smoothing $phi$ locally in charts: the approximations converge uniformly, and their gradients converge in $L^1$ on the fixed compact support. The boundedness of $u$ permits passage in the second term. For $0 lt.eq u lt.eq 1$, the coarea identity is
  #[#set math.equation(numbering: n => "(6.2)")
   $ \| D u \| \( M \) = integral_0^1 P \( { u > t } \) thin d t . $ <eq:bv-coarea>]
  The integrand is measurable: the defining perimeter supremum can be taken over a countable dense family of compactly supported test fields. For completeness, apply the strict smooth approximation theorem #cite(label("GuneysuPallara2015")) Theorem 2.12 in the author preprint to $u in B V \( M \)$. It applies to arbitrary integrable functions. The ordinary coarea formula then proves the inequality “$gt.eq$”: take a subsequence whose level sets converge in $L^1$ for almost every $t$, and use lower semicontinuity and Fatou’s Lemma. Such a subsequence exists because the integral over $t in bb(R)$ of the $L^1$ distance between the two level indicators equals the $L^1$ distance between the functions. For the reverse inequality, write $u = integral_0^1 chi_({ u > t }) thin d t$, test against $"div" X$ for $X in C_c^oo \( T M \)$ with $\| X \| lt.eq 1$, and take the supremum in the definition of total variation. This also shows that almost every level in (6.2) has finite ambient perimeter.
  Fix $o in M$ and, for $R > 0$, define
  $ phi_R \( x \) = min { 1 \, max { 0 \, R + 1 - d \( o \, x \) } } . $
  Completeness makes its support compact. It equals one on $B_R \( o \)$, vanishes outside $B_(R + 1) \( o \)$, and has Lipschitz constant at most one. The product rule and (6.2) give
  #[#set math.equation(numbering: n => "(6.3)")
   $ integral_0^1 P \( { phi_R chi_E > t } \) thin d t & = \| D \( phi_R chi_E \) \| \( M \)\
 & lt.eq integral_M phi_R thin d \| D chi_E \| + integral_E \| nabla phi_R \| thin d "Vol"_g\
 & lt.eq P \( E \) + \| E \\ B_R \( o \) \| . $ <eq:cutoff-coarea-perimeter>]
  Almost every level is a bounded finite-perimeter set, and for every $0 < t < 1$ its volume is at least $v_R = \| E ∩ B_R \( o \) \|$. The hypothesis and monotonicity of $J$ therefore bound the left side of (6.3) below by $J \( v_R \)$. Since $v_R arrow.r \| E \|$ and $\| E \\ B_R \( o \) \| arrow.r 0$, continuity of $J$ proves the assertion. ◻
]

#proof[
  Null sets have zero perimeter and $cal(I)_b \( 0 \) = 0$. The preceding bounded-set comparison and Lemma 23, with $J = cal(I)_b$, prove the assertion for all $n gt.eq 2$ and normalized curvature parameters $b in { 0 \, 1 }$.
  For an arbitrary negative curvature bound, put $b = sqrt(- kappa) > 0$ and $tilde(g) = b^2 g$. Then
  $ sec_(tilde(g)) = b^(- 2) sec_g lt.eq - 1 \, #h(2em) \| E \|_(tilde(g)) = b^n \| E \|_g \, #h(2em) P_(tilde(g)) \( E \) = b^(n - 1) P_g \( E \) . $
  The last identity holds for ambient BV perimeter: constant metric rescaling leaves divergence unchanged, while $d "Vol"_(tilde(g)) = b^n d "Vol"_g$ and $\| X \|_(tilde(g)) = b \| X \|_g$. In the dual definition of perimeter, the substitution $Y = b X$ therefore multiplies the supremum by $b^(n - 1)$. The model functions have the matching relations
  $ cal(V)_b \( r \) = b^(- n) cal(V)_1 \( b r \) \, #h(2em) cal(A)_b \( r \) = b^(- \( n - 1 \)) cal(A)_1 \( b r \) \, #h(2em) cal(I)_b \( V \) = b^(- \( n - 1 \)) cal(I)_1 \( b^n V \) . $
  Applying the normalized result to $tilde(g)$ and dividing by $b^(n - 1)$ gives the claimed inequality for $g$ and $kappa$. The case $kappa = 0$ was proved directly, without a curvature limit. ◻
]

== 7 Regularity of equality sets <sec:equality-regularity>

The comparison established in 1 turns an equality set into a local perimeter almost-minimizer. We first identify its regular boundary and prove the differentiability needed for the curvature formulas. We then remove the singular set from the integral identities that will locate the equality region.

=== 7.1 The perimeter support and its curvature <the-perimeter-support-and-its-curvature>

#thm([Proposition 7.1.])[
  (Boundary of an equality set).  #emph[Let $M^n$ be complete, simply connected and smooth, with $n gt.eq 2$ and $sec_M lt.eq 0$. Suppose that a bounded measurable set $E subset M$ has positive volume $V$, finite ambient perimeter $A$, and 
$ A = n omega_n^(1 \/ n) V^(\( n - 1 \) \/ n) . $

 Put $m = n - 1$, $R = \( V \/ omega_n \)^(1 \/ n)$, and $H_0 = m \/ R$. The support $Gamma = "supp" \| D chi_E \|$ is compact and has a decomposition $Gamma = Sigma dot(union) Z$ with the following properties:]
  + #emph[$Sigma$ is a relatively open, boundaryless, embedded $C_(upright("loc"))^(1 \, 1)$ hypersurface, and $Z$ is compact, with $dim_(cal(H)) Z lt.eq n - 8$. In particular, $Z = diameter$ when $n < 8$.]
  + #emph[The side occupied by $E$ defines an outward unit normal $N$ on $Sigma$, and 
#[#set math.equation(numbering: n => "(7.1)")
 $ \| D chi_E \| = d sigma floor.l Sigma \, #h(2em) sigma \( Sigma \) = A = s_m R^m \, #h(2em) overline(Sigma) = Gamma . $ <eq:equality-perimeter-area>]

 Here $d sigma$ denotes induced area on $Sigma$, extended by zero to $M$.]
  + #emph[There are $C < oo$ and $r_0 > 0$ such that 
#[#set math.equation(numbering: n => "(7.2)")
 $ sigma #scale(x: 120%, y: 120%)[\(] Sigma ∩ B_r \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq C r^m #h(2em) \( x in Gamma \, med 0 < r < r_0 \) . $ <eq:equality-area-growth>]

]
  + #emph[The outward trace mean curvature satisfies $H = "div"_(T Sigma) N = H_0$ almost everywhere on $Sigma$.]
  #emph[These assertions concern the perimeter support and the measurable class of $E$, not the topological boundary of an arbitrary representative.]
] <prop:equality-boundary>

#proof[
  #emph[Almost-minimality and the regular part.] Write $theta = \( n - 1 \) \/ n$ and $Lambda = A \/ V$. For every bounded finite-perimeter set $F$, 1 gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ P \( E \) - P \( F \) & lt.eq A [1 - (frac(\| F \|, V))^theta] lt.eq Lambda \| E triangle.stroked.t F \| . $ <eq:equality-almost-minimality>]
  Indeed $z^theta gt.eq min { z \, 1 }$ for $z gt.eq 0$, and the difference of the volumes is bounded by the volume of the symmetric difference. If $E triangle.stroked.t F$ is contained, up to a null set, in a compact subset of a bounded open set $O$, locality of perimeter cancels the part outside $O$. Thus
  $ P \( E \; O \) lt.eq P \( F \; O \) + Lambda \| E triangle.stroked.t F \| . $
  It suffices to consider competitors with $P \( F \; O \) < oo$; agreement with $E$ near the complement of $O$ then gives finite global perimeter as well.
  We apply the local smooth-manifold conclusion of #cite(label("AntonelliPasqualettoPozzetta2022")) Corollary 1.6. To check its quasi-perimeter hypothesis, on measurable subsets of $O$ define
  $ G \( F \) = Lambda \| F triangle.stroked.t \( E ∩ O \) \| . $
  This functional is finite at the empty set and satisfies
  $ \| G \( F_1 \) - G \( F_2 \) \| lt.eq Lambda \| F_1 triangle.stroked.t F_2 \| . $
  Its continuity exponent is therefore $1 > 1 - 1 \/ n$, as required in Condition (1.3) of that reference. The localized inequality says that $E$ minimizes $P + G$ under compact modifications; in particular it does so under the volume-preserving modifications of Definition 1.2. For a ball $O$ centered on $Gamma$, the remaining hypothesis $P \( E \; O \) > 0$ follows from the definition of support. The cited local conclusion applies in every dimension $n gt.eq 2$ and requires no global lower Ricci bound.
  It gives a $C_(upright("loc"))^(1 \, alpha)$ regular part of full perimeter, a relatively closed singular part of Hausdorff dimension at most $n - 8$, and local upper area growth. Here and below the local exponent may be decreased so that $0 < alpha < 1$. These are statements about the perimeter support: one may take the density-one representative supplied by the theorem, whose boundary equals that support. For completeness, the perimeter measure is concentrated on the reduced boundary, giving one inclusion. Conversely, a boundary point of this representative is an essential boundary point; if the perimeter vanished in a neighborhood, the characteristic function would be constant almost everywhere there, a contradiction.
  The support is unchanged by modifying $E$ on a null set. It is a closed subset of a compact set containing $E$, since completeness makes closed bounded sets compact. Hence $Gamma$ and its closed singular subset $Z$ are compact. The local area estimates become (7.2) with uniform constants by a finite cover of $Gamma$.
  Near a regular point, the whole support is a graph dividing a coordinate neighborhood into two connected sides. On either side $D chi_E = 0$, so $chi_E$ is constant almost everywhere. One way to see this last fact is to express the distributional derivatives in coordinates, compensating for the volume density, and mollify on smaller coordinate balls. Overlapping balls give the same constant. The two side values must differ: otherwise the characteristic function would be constant across the neighborhood, since the graph has zero ambient volume. The occupied side consequently defines a consistent outward normal. The divergence formula on a graph identifies its perimeter with its induced area. Together with the full-perimeter conclusion, this proves (7.1). In particular, every neighborhood of a support point meets the regular part, so $Sigma$ is dense in $Gamma$.
  #emph[The graph equation.] Choose graph coordinates $\( y \, z \) in bb(R)^m times bb(R)$ with $z = u \( y \)$ on $Sigma$ and $E$ below the graph, up to a null set. Let $G \( y \, z \)$ be the ambient metric matrix and $W \( y \, z \) = sqrt(det G \( y \, z \))$. The graph area integrand is
  $ L_g \( y \, z \, p \) = W \( y \, z \) [\( - p \, 1 \)^T G \( y \, z \)^(- 1) \( - p \, 1 \)]^(1 \/ 2) . $
  For a smooth compactly supported function $zeta$ in the graph domain, the graph $u + t zeta$ gives admissible sets for both signs of small $t$. The sharp deficit $P \( F \) - n omega_n^(1 \/ n) \| F \|^theta$ is nonnegative and vanishes at $F = E$. Its volume derivative has coefficient $n omega_n^(1 \/ n) theta V^(theta - 1) = H_0$. Define
  $ cal(B) \( y \, z \, p \) = partial_z L_g \( y \, z \, p \) - H_0 W \( y \, z \) . $
  Differentiating area and the volume between the two graphs gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ integral [partial_p L_g \( y \, u \, D u \) dot.op D zeta + cal(B) \( y \, u \, D u \) zeta] d y = 0 . $ <eq:equality-graph-equation>]
  The derivative $D$ here is Euclidean differentiation in $y$. The matrix $partial_(p p) L_g$ is positive definite. Indeed, the Hessian of a positive definite norm is positive in directions transverse to its radial kernel, and a nonzero slope variation $\( - v \, 0 \)$ is not radial at $\( - p \, 1 \)$. On compact sets of arguments the equation is therefore uniformly elliptic.
  The local graph-regularity result in 25 applies to this weak equation: a $C^(1 \, alpha)$ graph stationary for area minus $H_0$ times volume is locally $C^(1 \, 1)$. Thus $D u$ is locally Lipschitz. The proof of that result follows in the next subsection; it obtains this conclusion without an advance bound on second derivatives.
  #emph[The signed curvature.] We can now interpret the graph equation geometrically. On a $C^(1 \, 1)$ graph the induced metric and its volume density are locally Lipschitz. For a tangential field $X = X^i F_i$ in a parametrization $F$, with induced metric $\( a_(i j) \)$, metric compatibility gives, almost everywhere,
  $ "div"_Sigma X = partial_i X^i + 1 / 2 X^i a^(j k) partial_i a_(j k) = 1 / sqrt(det a) thin partial_i #scale(x: 120%, y: 120%)[\(] sqrt(det a) thin X^i #scale(x: 120%, y: 120%)[\)] . $
  The identities are also distributional: Lipschitz coefficients obey the product rule, and the weak mixed derivatives of $F$ commute. Consequently compactly supported tangential Lipschitz fields have zero integral divergence. Splitting a field into its tangential and normal parts now gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ "div"_(T Sigma) Y = "div"_Sigma \( Y^(sans(T)) \) + H chevron.l Y \, N chevron.r \, #h(2em) H = "div"_(T Sigma) N \, $ <eq:equality-tangential-divergence>]
  almost everywhere and weakly on each regular chart.
  For the graph variation used in (7.4), take $Y = zeta thin partial_z$. The area derivative is $integral "div"_(T Sigma) Y thin d sigma$, and the volume derivative is its outward flux. By (7.5), the graph equation becomes
  $ integral_Sigma \( H - H_0 \) chevron.l partial_z \, N chevron.r zeta thin d sigma = 0 . $
  The factor $chevron.l partial_z \, N chevron.r$ is strictly positive, because $E$ occupies the lower side; equivalently its product with the graph area density is $W$. Arbitrary compactly supported $zeta$ therefore give $H = H_0$ almost everywhere. The coefficient $H_0$ came from the same global deficit on every patch, so this is the same signed outward curvature on every component. This completes the proof. ◻
]

=== 7.2 Local regularity of the graph equation <local-regularity-of-the-graph-equation>

The local input used above concerns the graph equation itself. Its proof first bounds the energy of difference quotients, uniformly in their step, and then controls their gradients by comparison with a constant-coefficient equation.

#thm([Lemma 7.2.])[
  (Regularity of a stationary graph).  #emph[Let $Omega subset bb(R)^m$ be open, with $m gt.eq 1$, and let $u in C_(upright("loc"))^(1 \, alpha) \( Omega \)$ for $0 < alpha < 1$. Let $G \( y \, z \)$ be the matrix of a smooth Riemannian metric on a neighborhood of the graph of $u$ in $bb(R)^m times bb(R)$, and put 
$ W \( y \, z \) = sqrt(det G \( y \, z \)) \, #h(2em) L_g \( y \, z \, p \) = W \( y \, z \) [\( - p \, 1 \)^T G \( y \, z \)^(- 1) \( - p \, 1 \)]^(1 \/ 2) . $

 Fix $H_0 > 0$ and write $cal(B) \( y \, z \, p \) = partial_z L_g \( y \, z \, p \) - H_0 W \( y \, z \)$. If 
$ integral_Omega [partial_p L_g \( y \, u \, D u \) dot.op D zeta + cal(B) \( y \, u \, D u \) zeta] d y = 0 #h(2em) \( zeta in C_c^oo \( Omega \) \) \, $

 then $u in C_(upright("loc"))^(1 \, 1) \( Omega \)$.]
] <lem:equality-graph-regularity>

#proof[
  #emph[Difference quotients and an energy bound.] The positivity of $partial_(p p) L_g$ was verified after (7.4). Shrink the graph chart so that its arguments and the segments between nearby arguments lie in one compact ellipticity region. Choose a Euclidean ball $B_(4 rho)$ compactly contained in its parameter domain. For a coordinate unit vector $e$ and $0 < delta < rho$, put
  $ v \( y \) = frac(u \( y + delta e \) - u \( y \), delta) \, #h(2em) y in B_(3 rho) . $
  Each $v$ is $C^1$, though no uniform bound on $D v$ is yet known. The identity
  $ v \( y \) = integral_0^1 partial_e u \( y + s delta e \) thin d s $
  does give a uniform $C^(0 \, alpha)$ bound for $v$.
  Subtract the translated equations and divide by $delta$. To describe the coefficients explicitly, set
  $ T_s \( y \) & = \( 1 - s \) \( y \, u \( y \) \, D u \( y \) \)\
 & quad + s \( y + delta e \, u \( y + delta e \) \, D u \( y + delta e \) \) . $
  The resulting weak equation is
  #[#set math.equation(numbering: n => "(7.6)")
   $ integral [\( a D v + f \) dot.op D zeta + \( b dot.op D v + d \) zeta] d y = 0 \, $ <eq:equality-quotient-equation>]
  where
  $ a & = integral_0^1 partial_(p p) L_g \( T_s \) thin d s \, #h(2em) b = integral_0^1 partial_p cal(B) \( T_s \) thin d s \,\
f & = integral_0^1 #scale(x: 120%, y: 120%)[\(] partial_e partial_p L_g \( T_s \) + partial_z partial_p L_g \( T_s \) v #scale(x: 120%, y: 120%)[\)] thin d s \,\
d & = integral_0^1 #scale(x: 120%, y: 120%)[\(] partial_e cal(B) \( T_s \) + partial_z cal(B) \( T_s \) v #scale(x: 120%, y: 120%)[\)] thin d s . $
  In these expressions $partial_e$ differentiates only the explicit $y$ argument. The known $C^(1 \, alpha)$ norm of $u$ bounds the $C^(0 \, alpha)$ norms of all $T_s$, uniformly in $s$ and $delta$. Smooth composition on the compact argument set, together with the bound for $v$, shows that $a \, f$ have uniform $C^(0 \, alpha)$ bounds and $b \, d$ are uniformly bounded. The matrices $a$ are symmetric and uniformly elliptic.
  Test (7.6) with $chi^2 v$, where $chi$ is supported in $B_(3 rho)$ and equals one on $B_(2 rho)$. Such tests are justified by smooth approximation. Ellipticity gives a multiple of $integral chi^2 \| D v \|^2$ on the left. All other terms are bounded by Young’s inequality and the uniform bounds on $v \, f \, b \, d$, absorbing the terms linear in $D v$ into that left side. In particular, the first-order term involving $b dot.op D v$ is absorbed in this way. The remaining bound is $C integral \( chi^2 + \| D chi \|^2 \)$, so
  #[#set math.equation(numbering: n => "(7.7)")
   $ integral_(B_(2 rho)) \| D v \|^2 thin d y lt.eq C \, $ <eq:equality-quotient-energy>]
  uniformly in the difference step. No bound on a second derivative of $u$ has been used.
  #emph[Harmonic comparison and the gradient bound.] Fix $x in B_rho$ and $0 < r lt.eq min { rho \, 1 }$. On $B_r \( x \)$, let $w - v in H_0^1 \( B_r \( x \) \)$ solve
  $ "div" \( a \( x \) D w \) = 0 . $
  Existence and uniqueness follow by minimizing the positive quadratic Dirichlet energy in $v + H_0^1 \( B_r \( x \) \)$. Put $z = v - w$. Subtract the equations and test with $z$; the constant vector $f \( x \)$ integrates to zero against $D z$. With all norms on $B_r \( x \)$, ellipticity and the coefficient bounds give
  $ lambda parallel D z parallel_2^2 & lt.eq C r^alpha #scale(x: 120%, y: 120%)[\(] parallel D v parallel_2 + \| B_r \|^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] parallel D z parallel_2\
 & quad + C #scale(x: 120%, y: 120%)[\(] parallel D v parallel_2 + \| B_r \|^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] parallel z parallel_2 . $
  The second line includes the first-order term $b dot.op D v$. Zero-boundary Poincaré gives $parallel z parallel_2 lt.eq C r parallel D z parallel_2$. Since $r lt.eq r^alpha$ for $r lt.eq 1$, it follows that
  #[#set math.equation(numbering: n => "(7.8)")
   $ (- #h(-0.16667em) integral_(B_r \( x \)) \| D v - D w \|^2)^(1 \/ 2) lt.eq C r^alpha (1 + (- #h(-0.16667em) integral_(B_r \( x \)) \| D v \|^2)^(1 \/ 2)) . $ <eq:equality-frozen-comparison>]
  Energy minimization after subtracting an affine function also gives, for every constant vector $p$,
  #[#set math.equation(numbering: n => "(7.9)")
   $ (- #h(-0.16667em) integral_(B_r \( x \)) \| D w - p \|^2)^(1 \/ 2) lt.eq C (- #h(-0.16667em) integral_(B_r \( x \)) \| D v - p \|^2)^(1 \/ 2) . $ <eq:equality-harmonic-energy>]
  We use the following elementary interior estimate for this constant coefficient equation. For $0 < gamma lt.eq 1 \/ 4$,
  #[#set math.equation(numbering: n => "(7.10)")
   $ (- #h(-0.16667em) integral_(B_(gamma r) \( x \)) \| D w - \( D w \)_(B_(gamma r) \( x \)) \|^2)^(1 \/ 2) lt.eq C gamma (- #h(-0.16667em) integral_(B_r \( x \)) \| D w - p \|^2)^(1 \/ 2) . $ <eq:equality-harmonic-oscillation>]
  Here subscripts on a function denote its average. To justify the estimate at the weak regularity in use, mollify $D w - p$ in an interior ball. Its components solve the same constant coefficient equation. A linear coordinate change, with distortion controlled by ellipticity, makes them harmonic. The mean value formula reproduces each such function by convolution with a smooth radial averaging kernel of radius comparable to $r$. Differentiating that kernel and applying Cauchy–Schwarz bounds its gradient on $B_(r \/ 2) \( x \)$ by
  $ C r^(- 1) (- #h(-0.16667em) integral_(B_r \( x \)) \| D w - p \|^2)^(1 \/ 2) . $
  The radius of the averaging kernel is chosen small enough that its support remains in the transformed interior ball. Letting the mollification scale tend to zero proves the same estimate for a representative of $D w - p$, and its oscillation on $B_(gamma r) \( x \)$ is at most this bound times $2 gamma r$. This proves (7.10).
  We control the mean gradient and its oscillation together: harmonic comparison contracts the oscillation, while the coefficient errors are summable on geometric scales. Define
  $ p_r = - #h(-0.16667em) integral_(B_r \( x \)) D v \, #h(2em) J \( r \) = (- #h(-0.16667em) integral_(B_r \( x \)) \| D v - p_r \|^2)^(1 \/ 2) . $
  Using $p = p_r$ in the preceding estimates and comparing averages on the two balls gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ J \( gamma r \) & lt.eq C gamma J \( r \) + C gamma^(- m \/ 2) r^alpha #scale(x: 120%, y: 120%)[\(] 1 + \| p_r \| + J \( r \) #scale(x: 120%, y: 120%)[\)] \,\
\| p_(gamma r) - p_r \| & lt.eq gamma^(- m \/ 2) J \( r \) . $ <eq:equality-oscillation-iteration>]
  Fix $gamma$ so that $C gamma lt.eq 1 \/ 2$, and choose a fixed $ell gt.eq 1$ with $ell \/ 2 gt.eq gamma^(- m \/ 2)$. Then
  $ S \( r \) = 1 + \| p_r \| + ell J \( r \) quad upright("satisfies") quad S \( gamma r \) lt.eq \( 1 + C' r^alpha \) S \( r \) . $
  Choose one starting radius $r_(*) lt.eq min { rho \, 1 }$. Its starting averages are bounded uniformly for every $x in B_rho$ by (7.7). On the geometric scales $r_j = gamma^j r_(*)$, the product of $1 + C' r_j^alpha$ is finite, because $sum_j r_j^alpha < oo$. Thus $\| p_(r_j) \|$ is uniformly bounded. Each fixed-step quotient is $C^1$, so these averages tend to $D v \( x \)$ as $j arrow.r oo$. We obtain a bound for $D v \( x \)$ uniform in $x in B_rho$, in $e$, and in the sufficiently small step $delta$.
  Finally,
  $ D v \( y \) = frac(D u \( y + delta e \) - D u \( y \), delta) $
  holds classically. The uniform bound just proved bounds increments of $D u$ along every coordinate direction. On a smaller coordinate cube, join two points by coordinate segments and add the increment bounds. The sum of their lengths is at most $sqrt(m)$ times the Euclidean distance between the points. Therefore $D u$ is locally Lipschitz and $u in C_(upright("loc"))^(1 \, 1) \( Omega \)$. ◻
]

=== 7.3 Integral identities across the singular set <integral-identities-across-the-singular-set>

The regular boundary now has constant mean curvature. To use it in the rigidity argument, we must justify integral tests that need not vanish near its singular set.

#thm([Lemma 7.3.])[
  (Cutoffs for an equality boundary).  #emph[Under the hypotheses of 24, there are $eta_j in "Lip"_c \( Sigma \)$ such that 
$ 0 lt.eq eta_j lt.eq 1 \, #h(2em) eta_j \( x \) arrow.r 1 quad \( x in Sigma \) \, #h(2em) integral_Sigma \| nabla_Sigma eta_j \|^2 thin d sigma arrow.r 0 . $

]
] <lem:equality-cutoffs>

#proof[
  If $Z = diameter$, then $Sigma = Gamma$ is compact, and we take $eta_j = 1$. Otherwise $n gt.eq 8$, $m gt.eq 7$, and
  $ dim_(cal(H)) Z lt.eq m - 7 < m - 2 \, #h(2em) cal(H)^(m - 2) \( Z \) = 0 . $
  The compactness, finite area, embedding and uniform growth hypotheses of 18 follow from 24. That lemma supplies the stated cutoffs. In particular their supports are compact in the manifold topology of $Sigma$, and the construction does not assume that $Sigma$ is complete or has finitely many components. ◻
]

For every smooth ambient field $Y$ defined near $Gamma$, the cutoffs and (7.5) imply

#[#set math.equation(numbering: n => "(7.12)")
 $ integral_Sigma "div"_(T Sigma) Y thin d sigma = H_0 integral_Sigma chevron.l Y \, N chevron.r thin d sigma . $ <eq:global-first-variation>]

Indeed, apply the compact-support identity to $eta_j Y$ and expand:

$ & integral_Sigma eta_j "div"_(T Sigma) Y thin d sigma + integral_Sigma chevron.l nabla_Sigma eta_j \, Y^(sans(T)) chevron.r thin d sigma\
 & #h(35mm)  = H_0 integral_Sigma eta_j chevron.l Y \, N chevron.r thin d sigma . $

The middle integral has absolute value at most $parallel Y parallel_oo A^(1 \/ 2) parallel nabla_Sigma eta_j parallel_2$, which tends to zero. All other terms converge by dominated convergence, since the ambient data are bounded near compact $Gamma$. The same identity holds on any compact boundaryless component of $Sigma$ directly, by integrating (7.5) on that component.

When $n gt.eq 4$, the same cutoffs extend 7 to every smooth ambient function $v$ restricted to $Sigma$. Here the signed normalized mean curvature is $h = H \/ m = 1 \/ R$, and we use the case $b = 0$. With $q = 2 m \/ \( m - 2 \)$ and $c = 4 \/ \( m - 2 \)$, the result is

#[#set math.equation(numbering: n => "(7.13)")
 $ c integral_Sigma \| nabla_Sigma v \|^2 thin d sigma + m / R^2 integral_Sigma v^2 thin d sigma gt.eq m s_m^(2 \/ m) (integral_Sigma \| v \|^q thin d sigma)^(2 \/ q) . $ <eq:equality-sobolev>]

To justify passage from $eta_j v$ to $v$, boundedness of $v$ and its gradient near $Gamma$ gives convergence in $L^2$ and $L^q$, and

$ nabla_Sigma \( eta_j v \) - nabla_Sigma v = \( eta_j - 1 \) nabla_Sigma v + v nabla_Sigma eta_j arrow.r 0 quad upright("in ") L^2 \( Sigma \) . $

The first term tends to zero by dominated convergence and the second by 26. Thus the whole Dirichlet energy, including its cross term, converges. In particular the constant function and fixed ambient perturbations of it are now legitimate tests; no completeness of the regular locus has been introduced.

== 8 Rigidity of the equality case <sec:rigidity>

We prove Theorem 2. Let $M^n$ and $E$ satisfy its hypotheses, and assume equality in the Euclidean perimeter bound. In particular, $E$ is bounded and has positive finite volume and finite ambient perimeter. Retain the notation

$ m = n - 1 \, #h(2em) V = "Vol" \( E \) \, #h(2em) R = \( V \/ omega_n \)^(1 \/ n) \, #h(2em) A = P \( E \) = s_m R^m . $

By 24, the perimeter support is a compact set $Gamma = Sigma union Z$, its regular part carries all the perimeter, and its outward trace curvature is $H_0 = m \/ R$. We first show that $Gamma$ is contained in the exponential image of a Euclidean sphere of radius $R$. The argument depends on the dimension. A single final argument then recovers both the set and the metric on its interior.

=== 8.1 A barycenter and a flux inequality <a-barycenter-and-a-flux-inequality>

We record two observations used in the higher-dimensional and curve cases. If $mu$ is a nonzero finite positive measure of compact support in $M$, the function

$ cal(F) \( p \) = integral_M D_p \( x \) thin d mu \( x \) \, #h(2em) D_p \( x \) = 1 / 2 d \( p \, x \)^2 \, $

is continuous and proper. Indeed, if the support lies in $B_a \( o \)$, then $d \( p \, x \) gt.eq d \( p \, o \) - a$, so $cal(F) \( p \) arrow.r oo$ as $p$ leaves compact sets. Completeness and Hopf–Rinow give a minimizer. Squared distance is smooth on $M times M$, and differentiation on compact sets gives

#[#set math.equation(numbering: n => "(8.1)")
 $ integral_M log_p x thin d mu \( x \) = 0 $ <eq:barycenter>]

at any minimizer. Uniqueness of the minimizer is not needed.

Let $T$ be either $Sigma$ or a compact boundaryless component of $Sigma$, and put $a = "Area" \( T \)$. The global first-variation identity from 7 applies on $T$. The distance comparison 5 yields, for every $p in M$,

#[#set math.equation(numbering: n => "(8.2)")
 $ m a & lt.eq integral_T "div"_(T Sigma) nabla D_p thin d sigma = m / R integral_T chevron.l nabla D_p \, N chevron.r thin d sigma\
 & lt.eq m / R (a integral_T r_p^2 thin d sigma)^(1 \/ 2) . $ <eq:flux-bound>]

All fields may be multiplied by an ambient cutoff equal to one near $Gamma$, so their lack of compact support on $M$ causes no difficulty. In particular,

#[#set math.equation(numbering: n => "(8.3)")
 $ integral_T r_p^2 thin d sigma gt.eq R^2 a . $ <eq:lower-moment>]

If the opposite inequality also holds, all inequalities in (8.2) are equalities. Consequently

#[#set math.equation(numbering: n => "(8.4)")
 $ nabla D_p = R N quad upright("almost everywhere on ") T . $ <eq:radial-normal>]

For example, the squared $L^2$ norm of the difference is

$ integral_T r_p^2 thin d sigma + R^2 a - 2 R integral_T chevron.l nabla D_p \, N chevron.r thin d sigma = 0 . $

Continuity upgrades (8.4) to every point of $T$: a nonempty open regular patch has positive area. Since $\| N \| = 1$, this puts $T$ on the distance sphere $r_p = R$.

=== 8.2 Dimensions at least four <dimensions-at-least-four>

Here $m gt.eq 3$. The cutoff passage in 7 has established (7.13) for every smooth ambient function restricted to $Sigma$. Retain $q = 2 m \/ \( m - 2 \)$ and $c = 4 \/ \( m - 2 \) = q - 2$. The constant function $v = 1$ attains equality, since $A = s_m R^m$.

Let $phi.alt$ be such a restriction with $integral_Sigma phi.alt thin d sigma = 0$. Boundedness permits Taylor expansion for $v = 1 + tau phi.alt$:

#[#set math.equation(numbering: n => "(8.5)")
 $ (integral_Sigma \| 1 + tau phi.alt \|^q thin d sigma)^(2 \/ q) = A^(2 \/ q) [1 + \( q - 1 \) tau^2 / A integral_Sigma phi.alt^2 thin d sigma + o \( tau^2 \)] . $ <eq:critical-expansion>]

The constant terms in (7.13) agree, and the linear terms vanish. Since $m s_m^(2 \/ m) A^(2 \/ q - 1) = m \/ R^2$ and $c = q - 2$, comparison of the quadratic terms proves

#[#set math.equation(numbering: n => "(8.6)")
 $ integral_Sigma \| nabla_Sigma phi.alt \|^2 thin d sigma gt.eq m / R^2 integral_Sigma phi.alt^2 thin d sigma . $ <eq:equality-spectral-gap>]

The cutoff limit has already been taken before the expansion; no mean-zero condition on cutoff approximations is asserted.

Choose a barycenter $p$ for the measure $d sigma$ on $Sigma$ and an orthonormal basis $e_1 \, dots.h \, e_n$ of $T_p M$. The smooth functions $phi.alt_i \( x \) = chevron.l log_p x \, e_i chevron.r$ have zero mean by (8.1). Because $d log_p$ is contracting,

$ sum_(i = 1)^n \| nabla_Sigma phi.alt_i \|^2 = sum_(j = 1)^m \| d log_p \( v_j \) \|^2 lt.eq m $

for any orthonormal basis $v_1 \, dots.h \, v_m$ of $T_x Sigma$. Summing (8.6) gives

#[#set math.equation(numbering: n => "(8.7)")
 $ integral_Sigma r_p^2 thin d sigma lt.eq R^2 A . $ <eq:upper-moment>]

Together with (8.3), this yields (8.4) on $Sigma$. Its density in $Gamma$ therefore implies

#[#set math.equation(numbering: n => "(8.8)")
 $ Gamma subset { x in M : d \( p \, x \) = R } . $ <eq:central-sphere>]

Neither connectedness nor completeness of the regular part was used.

=== 8.3 Dimension two <dimension-two>

Now $m = 1$ and $Gamma = Sigma$ is a compact embedded $C^(1 \, 1)$ curve without boundary, with total length $A = 2 pi R$. Choose a connected component $T$ and let $L = "length" \( T \) > 0$. A connected compact one-dimensional manifold without boundary admits a periodic arclength parametrization of period $L$. Here this can also be seen by continuing an oriented arclength chart: a traverse of arbitrarily large length cannot stay injective in a component of finite length, and local uniqueness gives a least positive period. Its image is open and closed in the component, and one least period traverses it once.

The periodic Wirtinger inequality says that

#[#set math.equation(numbering: n => "(8.9)")
 $ integral_T \| nabla_T phi.alt \|^2 thin d sigma gt.eq (frac(2 pi, L))^2 integral_T phi.alt^2 thin d sigma \, #h(2em) integral_T phi.alt thin d sigma = 0 . $ <eq:wirtinger>]

For completeness, in arclength coordinates the assertion follows by expanding a trigonometric polynomial in Fourier modes; the zero mode is absent. Periodic convolution approximates a $C^1$ function and its derivative uniformly, preserving the zero mean, so the same inequality holds for all the tests used below.

Take a barycenter of the area measure on $T$. Apply (8.9) to its logarithm coordinates and use the contraction of $d log_p$ as above. The result is

$ integral_T r_p^2 thin d sigma lt.eq frac(L^3, \( 2 pi \)^2) . $

On the other hand, (8.3) gives $integral_T r_p^2 thin d sigma gt.eq R^2 L$. Thus $L gt.eq 2 pi R = A$. Since $L lt.eq A$, this component has all the length, and every inequality just used is an equality. Another component would contain a regular open arc of positive length, which is impossible. Hence $T = Gamma$, and (8.4) again proves (8.8).

=== 8.4 Dimension three <dimension-three>

Here $m = 2$ and $Sigma = Gamma$ is a compact embedded $C^(1 \, 1)$ surface, with $A = 4 pi R^2$. Write $h = 1 \/ R$, so its trace curvature is $2 h$. The critical Sobolev argument used for $m gt.eq 3$ is replaced by a punctured radial flux calculation.

Fix $p in Sigma$ and, away from $p$, define

$ r = r_p \, #h(2em) Y = r^(- 2) nabla D_p = frac(nabla r, r) \, #h(2em) t = chevron.l Y \, N chevron.r . $

Since $"Hess" D_p gt.eq g$ and $\| nabla r \| = 1$,

#[#set math.equation(numbering: n => "(8.10)")
 $ "div"_(T Sigma) Y & = r^(- 2) "tr"_(T Sigma) "Hess" D_p - 2 r^(- 2) \| nabla_Sigma r \|^2\
 & gt.eq 2 r^(- 2) #scale(x: 120%, y: 120%)[\(] 1 - \| nabla_Sigma r \|^2 #scale(x: 120%, y: 120%)[\)] = 2 t^2 . $ <eq:puncture-divergence>]

Choose a smooth nondecreasing function $chi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ that is zero on $\[ 0 \, 1 \]$ and one on $\[ 2 \, oo \)$. The field $chi \( r \/ epsilon \) Y$ extends smoothly by zero near $p$. Apply the global first-variation identity and differentiate the cutoff. The term containing $chi'$ is nonnegative, and (8.10) gives

#[#set math.equation(numbering: n => "(8.11)")
 $ integral_Sigma chi \( r \/ epsilon \) [h^2 / 2 - 2 (t - h / 2)^2] d sigma gt.eq J_epsilon \, quad J_epsilon = integral_Sigma frac(chi' \( r \/ epsilon \), epsilon r) \| nabla_Sigma r \|^2 thin d sigma . $ <eq:puncture-square>]

Indeed the left integrand before completing the square is $2 h t - 2 t^2 = h^2 \/ 2 - 2 \( t - h \/ 2 \)^2$.

We claim that

#[#set math.equation(numbering: n => "(8.12)")
 $ lim_(epsilon arrow.b 0) J_epsilon = 2 pi . $ <eq:annular-flux>]

Use exponential coordinates at $p$, with the first two coordinate axes in $T_p Sigma$. In a neighborhood of $p$ the entire support is a graph $\( y \, b \( y \) \)$, where $b \( 0 \) = 0$ and $D b \( 0 \) = 0$. For small $epsilon$ this one graph contains the whole annulus contributing to $J_epsilon$; no other sheet or component enters it. Set $y = epsilon z$. For fixed $z eq.not 0$,

$ r / epsilon arrow.r \| z \| \, #h(2em) frac(d sigma, epsilon^2) arrow.r d z \, #h(2em) \| nabla_Sigma r \| arrow.r 1 . $

Here $r = \| \( y \, b \( y \) \) \|$ exactly, by the radial distance formula. On the support of $chi'$ one has $1 lt.eq r \/ epsilon lt.eq 2$. Thus $z$ stays in a fixed bounded disk and, using the vanishing slope of $b$, away from zero. The area density is uniformly bounded there, $\| nabla_Sigma r \| lt.eq 1$, and $\| chi' \( r \/ epsilon \) \/ \( r \/ epsilon \) \| lt.eq parallel chi' parallel_oo$. Dominated convergence after extension by zero to the fixed disk gives

$ lim_(epsilon arrow.b 0) J_epsilon = integral_(bb(R)^2) frac(chi' \( \| z \| \), \| z \|) thin d z = 2 pi integral_1^2 chi' \( s \) thin d s = 2 pi . $

This proves (8.12).

Because $h^2 A \/ 2 = 2 pi$, (8.11) implies

$ 0 lt.eq integral_Sigma chi \( r \/ epsilon \) \( t - h \/ 2 \)^2 thin d sigma lt.eq h^2 / 4 integral_Sigma chi \( r \/ epsilon \) thin d sigma - 1 / 2 J_epsilon arrow.r 0 . $

Fatou’s lemma yields $t = h \/ 2$ almost everywhere off $p$, without any prior integrability assumption on $t^2$ at the pole. Continuity makes this identity valid at every point of $Sigma \\ { p }$.

This everywhere off-diagonal identity has been proved for each fixed $p$. We may therefore now fix $x_0 in Sigma$ and evaluate it at $x_0$ for every $p eq.not x_0$; there is no intersection of uncountably many exceptional null sets. The identity $nabla D_p \( x_0 \) = - log_(x_0) p$ gives

$ - chevron.l log_(x_0) p \, N \( x_0 \) chevron.r = frac(\| log_(x_0) p \|^2, 2 R) . $

Completing the square, including $p = x_0$ by continuity, we obtain

#[#set math.equation(numbering: n => "(8.13)")
 $ Gamma subset exp_(x_0) {v in T_(x_0) M : \| v + R N \( x_0 \) \| = R} . $ <eq:offset-sphere>]

The Euclidean sphere in (8.13) passes through the origin of $T_(x_0) M$; its center is $- R N \( x_0 \)$. 2 depicts this distinction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((-1.9, 0), radius: 1.9, fill: rgb("#f0f0ff"), stroke: none)
  circle((-1.9, 0), radius: 1.9, stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((-4.275, 0), (1.71, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#acacac"))))
  line((0, -2.232), (0, 2.375), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#acacac"))))
  circle((-1.9, 0), radius: 0.05292, fill: black, stroke: none)
  content((-1.9, 0), [$-"RN"(x_0)$], anchor: "north-east", padding: 0.1176cm)
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  content((0, 0), [$0 in T_(x_0)M$], anchor: "north-west", padding: 0.1176cm)
  line((0, 0), (1.188, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.188, 0), [$N(x_0)$], anchor: "south", padding: 0.1176cm)
  line((-1.9, 0), (-1.9, 1.9), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((-1.9, 0.95), [$R$], anchor: "east", padding: 0.1176cm)
  content((-1.9, -1.045), [$U_0$])
  content((-1.9, 2.517), [A planar section of the tangent-space sphere])
})],
  caption: [Figure 2: In dimension three, the open ball $U_0 subset T_(x_0) M$ has radius $R$ and center $- R N \( x_0 \)$, so the logarithm origin lies on its boundary. At this stage the perimeter support is known to lie on $exp_(x_0) \( partial U_0 \)$. The phase-recovery argument identifies the occupied phase and then proves that the induced metric on the enclosed region is Euclidean. ],
) <fig:offset-sphere>

=== 8.5 Recovering the whole ball and its metric <recovering-the-whole-ball-and-its-metric>

The three dimension regimes give the same conclusion: for some $o in M$, $Gamma$ is contained in $exp_o \( S \)$, where $S$ is a Euclidean sphere of radius $R$ in $T_o M$. Let $U_0$ be the open ball bounded by $S$ and put $U = exp_o \( U_0 \)$. The ball need not be centered at the tangent-space origin.

The global exponential diffeomorphism maps the two connected components of $T_o M \\ S$ onto those of $M \\ exp_o \( S \)$. Their interior component $U$ is bounded, since its closure is a compact image. The exterior component is unbounded: vectors escaping to infinity in the Euclidean exterior have image distances $d \( o \, exp_o v \) = \| v \|$ escaping to infinity. Exterior connectedness uses $n gt.eq 2$. The smooth hypersurface $exp_o \( S \)$ has zero ambient volume.

The distributional derivative of $chi_E$ is supported on $Gamma$, so it vanishes on each complementary component. A function with all weak coordinate derivatives zero is locally constant almost everywhere, as follows by mollification in coordinate balls. Overlapping balls then make $chi_E$ almost everywhere constant on each connected component. Its two constants belong to ${ 0 \, 1 }$. Boundedness of $E$ forces the exterior constant to be zero, because the open exterior contains positive-volume balls arbitrarily far from $E$. Since $V > 0$ and the separating sphere has zero volume, the interior constant is one. Therefore

#[#set math.equation(numbering: n => "(8.14)")
 $ E = U quad upright("up to a set of volume zero") . $ <eq:phase-recovery>]

Only containment of the perimeter support in the sphere was needed.

By 5, the pullback metric $tilde(g) = \( exp_o \)^(*) g$ dominates the constant Euclidean metric $g_o$ on all of $T_o M$, hence also on the offset ball $U_0$. On that ball, (8.14) gives

$ "Vol"_(tilde(g)) \( U_0 \) = V = omega_n R^n = "Vol"_(g_o) \( U_0 \) . $

The smooth relative density $sqrt(det_(g_o) tilde(g))$ is at least one. Equality of its integral with $"Vol"_(g_o) \( U_0 \)$ and continuity make it identically one on $U_0$. All eigenvalues of $tilde(g)$ relative to $g_o$ are at least one and their product is one. Each eigenvalue is therefore one, and

$ \( exp_o \)^(*) g = g_o quad upright("on ") U_0 . $

Thus $exp_o : U_0 arrow.r U$ is a Riemannian isometry, proving the necessity in 2.

For the converse, let $F : B_R \( 0 \) subset bb(R)^n arrow.r U subset M$ be a Riemannian isometry onto an open region with its induced metric. Put $p = F \( 0 \)$ and $L = d F_0$. For $\| v \| < R$, the image of the segment $s mapsto s v$ is an ambient geodesic with initial data $\( p \, L v \)$: the Levi–Civita connection on an open region is the restriction of the ambient connection. Geodesic uniqueness gives

$ F \( v \) = exp_p \( L v \) . $

Consequently $U = B_R \( p \)$. This formula extends smoothly to the closed Euclidean ball through the ambient exponential map. Its pullback metric is Euclidean in the interior and therefore on the boundary by continuity. The boundary is a smooth sphere of area $s_(n - 1) R^(n - 1)$, which equals its ambient perimeter by the divergence formula. Its volume is $omega_n R^n$, so equality holds. Perimeter and volume are unchanged by null modifications. This proves the sufficiency and completes 2. No flatness outside the equality region is implied.

== 9 Spectral and torsional comparison <sec:consequences>

We now derive the model-ball variational comparisons stated in Corollary 3. Theorem 1 allows the modulus of each compactly supported smooth test on the original domain to be replaced by an equimeasurable radial test on its model ball with no greater energy. The point to check is that the radial rearrangement belongs to the model ball’s Dirichlet Sobolev space.

#proof[
  Let $M$, $D$, $kappa$ and $p$ satisfy the hypotheses of the corollary. Fix $0 eq.not v in C_c^oo \( D \)$ and extend $u = \| v \|$ by zero to $M$; this is a compactly supported Lipschitz function. Put $b = sqrt(- kappa)$ and take the interval density $a \( r \) = cal(A)_b \( r \)$ on $\( 0 \, oo \)$, whose cumulative mass is $F_a \( r \) = cal(V)_b \( r \)$. Thus $a \( F_a^(- 1) \( s \) \) = cal(I)_b \( s \)$. Apply Nobili and Violo’s Pólya–Szegő theorem #cite(label("NobiliViolo2025")) Theorem 1.1 on $M$ with constant one. Its metric BV perimeter is the ambient Riemannian perimeter (1.3), as recalled after Definition 2.8 of #cite(label("AntonelliBrueFogagnoloPozzetta2022")). Hence Theorem 1 gives the required support-neighborhood bound at every finite volume, trivially also for sets of infinite perimeter. The positive superlevels of $u$ have finite volume, and its relaxed metric $p$-energy is at most its Riemannian energy #cite(label("NobiliViolo2025")) Definition 2.1. The theorem and #cite(label("NobiliViolo2025")) Lemma 3.1 give the decreasing equimeasurable rearrangement $u^(*)$ for $a \( r \) thin d r$, bounded and locally absolutely continuous, with weighted derivative energy at most $integral_D \| nabla_g v \|_g^p thin d "Vol"_g$.
  Write $B = B_kappa \( \| D \| \)$, with center $o$. Since $"supp" u subset.double D$, its volume is strictly below $\| D \|$, so $u^(*)$ vanishes on an interval before $R = cal(V)_b^(- 1) \( \| D \| \)$. We use the radial construction in #cite(label("NobiliViolo2025")) proof of Theorem 1.6, Section 7.1. The polar density is $a \( r \) = n omega_n r^(n - 1) w_b \( r \)$, where $w_b \( r \) = \( "sn"_b \( r \) \/ r \)^(n - 1)$ extends smoothly and positively at zero and is log-convex. Define $tilde(u) \( x \) = u^(*) \( d_kappa \( o \, x \) \)$. In normal coordinates it is bounded and locally $W^(1 \, p)$ away from the origin, with finite gradient $p$-energy. Its gradient is therefore also locally integrable across the origin. Integrating by parts outside the radius-$epsilon$ ball, the inner boundary term is $O \( epsilon^(n - 1) \)$ because $u^(*)$ is bounded. This term tends to zero since $n gt.eq 2$, so the weak gradient extends across the origin. Equivalence of Sobolev norms in smooth coordinates and vanishing near $R$ now give $tilde(u) in W_0^(1 \, p) \( B \)$. The model radial gradient is the radial derivative, and therefore
  $ integral_B \| nabla_kappa tilde(u) \|_kappa^p thin d "Vol"_kappa lt.eq integral_D \| nabla_g v \|_g^p thin d "Vol"_g \, #h(2em) integral_B \| tilde(u) \|^q thin d "Vol"_kappa = integral_D \| v \|^q thin d "Vol"_g quad \( q = 1 \, p \) . $
  Taking the Rayleigh infimum and the torsion-quotient supremum proves the claims. The defining density of $C_c^oo \( D \)$ and the finite volume of $D$ allow both variational values to be computed on the tests used above. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
