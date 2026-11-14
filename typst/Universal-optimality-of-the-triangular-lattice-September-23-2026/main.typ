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

#align(center)[#text(size: 16pt, weight: "bold")[Universal optimality of the triangular lattice]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Universal optimality asks whether one configuration minimizes an entire class of pair interactions.
  In the plane, the triangular lattice is the natural candidate.
  The problem goes beyond comparison with other lattices: a competing configuration may be nonperiodic,
  may contain arbitrarily close pairs, and may have very uneven local point counts.
  We prove the energy comparison for this full class under a single centered-density hypothesis.

Put $b = sqrt(3) \/ 2$ and let

$ A = b^(- 1 \/ 2) { j \( 1 \, 0 \) + k \( 1 \/ 2 \, b \) : j \, k in bb(Z) } $

be the triangular lattice of covolume one. Let $B_R$ be the closed disk of radius $R$ centered at the origin.
  For a locally finite configuration $cal(C) subset bb(R)^2$, write $cal(C)_R =
  cal(C) ∩ B_R$ and $N_R = \# cal(C)_R$. Its centered disk density is one if

$ frac(N_R, pi R^2) arrow.r 1 wide \( R arrow.r oo \) . $

For a nonnegative interaction $g : \( 0 \, oo \) arrow.r \[ 0 \, oo \)$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ E_g \( cal(C) \) = liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) g \( lr(|x - y|)^2 \) . $ <eq:energy-definition>]

The sum counts ordered pairs. Density one makes $N_R$ positive for all sufficiently large $R$,
  so the lower limit is well defined in $\[ 0 \, oo \]$.

#thm([Theorem 1.1.])[
  (Universal energy minimality).  #emph[Let $g : \( 0 \, oo \)
    arrow.r \[ 0 \, oo \)$ be smooth and completely monotone, meaning that $\( - 1 \)^r g^(\( r \)) \( t \) gt.eq
    0$ for every integer $r gt.eq 0$ and every $t > 0$. For every locally finite configuration $cal(C) subset
    bb(R)^2$ of centered disk density one, the following equality and inequality hold in the extended nonnegative reals:
#[#set math.equation(numbering: n => "(1.2)")
 $ E_g \( cal(C) \) gt.eq sum_(a in A \\ { 0 }) g \( lr(||) a^2 \) = E_g \( A \) . $ <eq:main-inequality>]

]
] <thm:universal>

This includes every Gaussian $g \( t \) = e^(- pi alpha t)$ with $alpha > 0$ and every inverse power $g \( t \) =
  t^(- p)$ with $p > 0$. The theorem permits singular potentials and divergent lattice sums,
  and it imposes no separation or local occupancy bound on $cal(C)$.
  It identifies the minimum value, not all minimizers. The comparison uses the centered-density and lower-energy
  formulation of Cohn et al. #cite(label("CKMRV2022")) Definitions 1.1–1.3.

=== 1.1 The planar problem and its predecessors <the-planar-problem-and-its-predecessors>

The lattice problem began with inverse-power interactions.
  For the convergent Epstein zeta sums, Rankin #cite(label("Rankin1953")) proved the triangular minimum in a
  restricted exponent range, and Cassels #cite(label("Cassels1959")) addressed the remaining range.
  Cassels subsequently acknowledged a gap in his proof #cite(label("Cassels1963Corrigendum"));
  Ennola #cite(label("Ennola1964Lemma")) supplied a repair,
  and Diananda #cite(label("Diananda1964")) simplified the needed lemmas.
  Together these works establish the triangular minimum among planar lattices of fixed covolume for $g \( t \) =
  t^(- p)$ with $p > 1$. Montgomery’s theta theorem gives the Gaussian minimum for every positive parameter
  #cite(label("Montgomery1988")) Theorem 1. These results identify the best lattice;
  they leave comparison with nonlattice configurations open.

Cohn and Kumar placed this question alongside their study of universal energy minimization on spheres
  #cite(label("CohnKumar2007")) Theorem 1.2. Their Euclidean conjecture singled out the triangular, $E_8$,
  and Leech lattices #cite(label("CohnKumar2007")) Conjecture 9.4.
  It asks for a sharp auxiliary function for each sufficiently decaying completely monotone squared-distance
  interaction: a Fourier lower bound that attains the lattice energy and therefore proves the comparison for
  periodic competitors. In dimensions $8$ and $24$, Cohn, Kumar, Miller, Radchenko,
  and Viazovska proved universal optimality and constructed sharp Gaussian bounds and Fourier interpolation
  formulas #cite(label("CKMRV2022")) Theorems 1.4, 1.7, and 1.9.

Several planar results address restricted competitor classes.
  Faulhuber et al. #cite(label("FaulhuberShafkulovskaZlotnikov2023")) Theorem 1.1 and Corollary 1.3 compare the
  triangular lattice with the honeycomb configuration, Cartesian products of one-dimensional periodic
  configurations, and unions of two translates of a rectangular or triangular lattice,
  with each class normalized to the same density. Hardin and Tenpas #cite(label("HardinTenpas2025")) Theorem 1
  prove triangular optimality among four-point configurations modulo a fixed triangular lattice and six-point
  configurations modulo $bb(Z) times sqrt(3) bb(Z)$, with the appropriate scaling and rotation of the minimizing
  lattice. Their completely monotone interactions satisfy a rapid-decay assumption.
  Leblé #cite(label("Leble2025")) Theorems 1–2 proves that sufficiently small bounded displacements of the
  triangular lattice cannot lower the energy; the permitted displacement size depends on the interaction.
  These restrictions are different from the centered-density hypothesis of Theorem 1.

Theorem 1 proves the positive planar universal-energy conclusion in the formulation stated above.
  The construction also supplies sharp auxiliary functions for every Gaussian.
  Integrating the resulting energy inequalities does not construct a sharp auxiliary for each mixed potential in
  the class required by Cohn and Kumar’s conjecture. That stronger per-potential quantifier is not claimed here.

=== 1.2 The Gaussian route and the interpolation problem <the-gaussian-route-and-the-interpolation-problem>

The proof reduces the energy problem to a family of Fourier inequalities. We use the normalization

$ hat(f) \( xi \) = integral_(bb(R)^2) f \( x \) e^(- 2 pi i x dot.op xi) thin #h(-0.16667em) upright(d) x $

and write $A^(*) = { w in bb(R)^2 : w dot.op a in bb(Z) upright(" for every ") a in A }$ for the dual lattice.
  Fix a Gaussian $G_alpha \( x \) = e^(- pi alpha \| x \|^2)$, with $alpha > 0$.
  We seek a real radial Schwartz function $f_alpha$ satisfying

$ f_alpha lt.eq G_alpha \, wide hat(f)_alpha gt.eq 0 \, wide f_alpha \( a \) & =
  G_alpha \( a \) &  & \( a in A \\ { 0 } \) \,\
hat(f)_alpha \( w \) & = 0 &  & \( w in A^(*) \\ { 0 } \) . $

The two inequalities give a lower bound for arbitrary competitors.
  The contacts at the direct and dual lattice points make the bound exact on $A$.
  For every competitor $cal(C)$ of centered disk density one, Section 6 proves

$ E_(e^(- pi alpha t)) \( cal(C) \) gt.eq hat(f)_alpha \( 0 \) - f_alpha \( 0 \) =
  sum_(a in A \\ { 0 }) e^(- pi alpha \| a \|^2) . $

The lower bound compares the point measure in a disk with area measure in a slightly larger disk.
  Its error is uniform even when points cluster. The equality follows from Poisson summation on $A$;
  the competitor itself need not be periodic.

Exact contacts and signs between contacts are different requirements.
  The first is an infinite interpolation problem. The second must hold at every radius and every Gaussian scale.
  Our construction separates them, then uses a quantitative correction estimate to bring them together.
  The normalized auxiliary theorem, Theorem 2, is stated after the shell and node definitions in Section 2.
  Its periodic set of rescaled squared radii contains all triangular-lattice shells,
  so the prescribed values and first derivatives (jets) supply the required contacts.

The construction has three stages. First, Section 2 encodes the periodic contact set by a sine product with double
  zeros. Multiplying that product by summable double-pole and simple-pole terms gives entire functions with
  independently specified values and slopes at the nodes. A compactly supported spectral measure represents each
  such cardinal function. Gaussian damping turns it into a radial Schwartz function,
  and transforming the Gaussian inside the integral gives its genuine Fourier transform.
  Combining two cardinal functions with their transformed profiles reduces the simultaneous contacts to coupled
  linear equations for two summable coefficient lists. The transformed jets become uniformly small at distant
  output nodes, regardless of the input coefficient locations.

Second, Section 3 constructs finite reference lists by positive quadrature, leaving the spectral atoms exact.
  It proves a uniform quadrature error and certifies explicit matrix and polynomial inequalities.
  These lists do not yet interpolate exactly. The available bound on the full coupled operator is also too large
  for a direct small-perturbation argument. Section 4 instead inverts the finite block and eliminates it;
  the small distant outputs make the remaining tail operator invertible.
  This solves all the exact interpolation equations and bounds the correction to the reference lists.

Third, Section 5 proves the signs corresponding to $G_alpha - f_alpha gt.eq 0$ and $hat(f)_alpha gt.eq 0$.
  It works in the rescaled squared-radius coordinate, after removing positive Gaussian factors.
  The normalized difference and Fourier profile then vanish to second order at the positive nodes because of the
  exact value-and-slope contacts. To control them near a node,
  we subtract the value and linear term of each component, divide by the squared distance to the node,
  and then approximate the quotient by a polynomial. This keeps a small interpolation error from being divided by
  a vanishing square. Coefficients in the Bernstein basis bound the polynomial on whole intervals between nodes,
  and rectangular bounds on its parameter data cover whole parameter intervals.
  On the unbounded radial tail, the signed contribution from the low-node rational terms is positive.
  The sum of the remaining terms has double zeros and a small second derivative.
  A quadratic lower bound for the sine product puts the positive part and the remainder on the same scale.
  Appendix 9 supplies the scalar bounds used in this argument and describes the accompanying interval verifier for
  the exact quadrature arrays. Appendix 11 gives a separate rational verification procedure,
  whose implication is conditional on its tests passing.

Section 6 converts the normalized construction into the functions $f_alpha$ above.
  It directly covers $alpha gt.eq 1$; a Fourier-complement construction supplies $0 < alpha < 1$.
  Finally, Section 7 represents each positive shift of a completely monotone potential as

$ g \( epsilon + t \) = integral_(\[ 0 \, 1 \]) v^t thin #h(-0.16667em) upright(d) rho_epsilon \( v \)
  wide \( t > 0 \) \, $

where $epsilon > 0$ and $rho_epsilon$ is positive with total mass $g \( epsilon \)$.
  The shift makes this mass finite even when $g$ is singular at zero.
  For $0 < v < 1$, the kernel $v^t$ is a Gaussian with $alpha = - log \( v \) \/ pi$; the endpoint $v =
  1$ gives the constant interaction. Fatou’s lemma and Tonelli’s theorem transfer the Gaussian comparisons to the
  mixture, and the shift is removed only in the lattice sum.
  This proves Theorem 1, including singular potentials and infinite energies.

=== 1.3 Antecedents of the method <antecedents-of-the-method>

The interpolation mechanism has substantial antecedents in the Beurling–Selberg extremal method.
  Cardinal formulas with squared trigonometric factors, double-pole value terms,
  and simple-pole derivative terms occur in the one-dimensional construction of Cohn and
  Kumar #cite(label("CohnKumar2007")) Proposition 9.6 and in the Gaussian extremal functions of Carneiro
  et al. #cite(label("CarneiroLittmannVaaler2013")) Section 1, (1.2)–(1.3).
  Radchenko and Viazovska #cite(label("RadchenkoViazovska2019")) Theorem 1 reconstruct even Schwartz functions on
  the real line from simultaneous function and Fourier data at square-root nodes.
  Theorems 1.7 and 1.9 of Cohn et al. #cite(label("CKMRV2022")) give radial value-and-derivative reconstruction
  formulas in dimensions $8$ and $24$. In the plane, simultaneous values and first derivatives of a radial
  Schwartz function and its Fourier transform on the triangular shells do not determine the function:
  Talebizadeh Sardari #cite(label("Sardari2021")) Theorem 1.7 proves that infinitely many linearly independent
  functions have all these data zero. His proof uses periodic congruence supersets of the triangular
  quadratic-form values #cite(label("Sardari2021")) Section 6.1, Lemma 6.1.
  Our construction prescribes data on a periodic superset and proves uniqueness within its specified summable
  coefficient system. The following sections establish exact interpolation in that system and the
  parameter-uniform planar signs.

Related Fourier sign conditions enter the sphere-packing bound of Cohn and Elkies #cite(label("CohnElkies2003")).
  The companion manuscript #cite(label("SharpPlanar2026")) Sections 2–4 develops the cardinal, Gaussian-transform,
  and finite sign-certification framework for a sharp planar packing bound.
  We adapt that framework to a continuously varying Gaussian target and establish the required energy identities,
  correction estimates, and signs locally. The separate atomic companion independently proves the same energy
  conclusion #cite(label("AtomicTriangular2026")) Theorem 1.1; this is not a premise of the present proof.
  Its auxiliary construction is compared with ours after Theorem 2.

The density-only linear-programming argument follows Cohn and
  de Courcy-Ireland #cite(label("CohnDeCourcyIreland2018")) Proposition 2.2,
  whose background-measure method follows Cohn and Zhao #cite(label("CohnZhao2014")) Theorem 3.3.
  The latter is a packing theorem; we use the method, not its exclusion-distance hypotheses.
  Section 6 proves the needed statement for real even Schwartz functions with nonnegative Fourier transform.
  The positive-mixture representation belongs to the classical Hausdorff–Bernstein–Widder theory
  #cite(label("Hausdorff1921")) #cite(label("Bernstein1929")) #cite(label("Widder1931"));
  our finite-difference and moment-measure proof is given in Section 7.
  The lower-limit, endpoint, and infinite-energy arguments are proved there as well.

=== 1.4 Renormalized and jellium consequences <renormalized-and-jellium-consequences>

For $0 < s < 2$, the raw Riesz energy with $g \( t \) = t^(- s \/ 2)$ is infinite even on $A$,
  so the comparison of raw energies does not by itself distinguish configurations in this range.
  Neutralized energies account for a uniform oppositely charged background.
  In a finite jellium system, one combines point–point, point–background, and background–background interactions;
  the thermodynamic jellium minimum is the large-volume limit of the minimum energy per unit volume.
  Renormalized energies remove the divergent self-energy of each point.
  Their periodic version compares configurations in a fixed torus,
  and their infinite-system version measures field energy per unit area.
  Petrache and Serfaty #cite(label("PetracheSerfaty2020")) Theorem 2 proved that the Cohn–Kumar
  universal-optimality conjecture implies the corresponding Coulomb and Riesz crystallization results.
  Their heat-kernel representation #cite(label("PetracheSerfaty2020")) Lemma 1 supplies the connection to Gaussian
  comparisons used here. We carry out this passage for the field functional defined in Section 8,
  including its normalization and periodic approximation, after completing the main theorem in Section 7.

Corollary 19 proves the triangular minimum for every $0 lt.eq s < 2$, with interaction $- log \| x \|$ at $s =
  0$ and $\| x \|^(- s)$ for $0 < s < 2$. On each torus $bb(R)^2 \/ \( n A \)$,
  the $n^2$ classes of $A \/ \( n A \)$ minimize the canonical periodic energy among all configurations of $n^2$
  distinct points. The lattice also minimizes the infinite-system field energy $W_s$ among density-one
  configurations, and the ordered-pair thermodynamic jellium minimum is $W_s \( A \) \/ kappa_s$, where $kappa_0 =
  2 pi$ and $kappa_s = 4 pi$ for $0 < s < 2$.

Section 8 defines these quantities with unit background and fixes the field normalization by the
  fundamental-solution equation. The field energy takes the centered-square upper limit at each fixed self-energy
  cutoff, then removes the cutoff; the infimum over compatible gradient fields is outside both limits.
  The proof compares heat-kernel energies for arbitrary period lattices.
  Appendix 10 constructs a sequence of square-periodic fields approaching the field infimum,
  so the comparison does not require a periodic approximation with prescribed triangular periods.
  The scalar periodic and jellium identities of Lewin et al. #cite(label("LewinLiebSeiringer2019")) Section VI,
  Theorem 2 and Lauritsen #cite(label("Lauritsen2021")) Theorem II.1 then identify the thermodynamic value.

The fresh long-range conclusion here is $0 < s < 2$. At $s = 0$,
  the corollary overlaps the independent direct logarithmic result of the Coulomb companion
  #cite(label("CoulombRenormalized2026")) Theorems 1.1–1.2,
  which uses its own field-energy normalization and proves a lower bound on square tori.
  The periodic assertion above concerns only the compatible triangular tori $bb(R)^2 \/ \( n A \)$.
  It asserts neither uniqueness nor exclusion of defects, and makes no claim at $s = 2$ or for quantum crystallization.

== 2 Cardinal interpolation and Fourier transformation <sec:fourier>

The auxiliary pair will be assembled from two summable lists of interpolation data.
  We first realize each list by an entire function whose values and first derivatives are determined by its
  coordinates. Gaussian damping then turns this function into a radial Schwartz function,
  and Fourier transformation gives a second kernel with rapidly decreasing jets at distant nodes.
  The estimates in this section apply to arbitrary summable lists, before any finite approximation is introduced.

The spectral construction adapts the cardinal-measure and Gaussian-transform method of
  OpenAI #cite(label("SharpPlanar2026")) Section 2. The formulas and estimates needed for the present target are
  proved below; no packing sign bound is used.

=== 2.1 Shells and interpolation nodes <shells-and-interpolation-nodes>

Set the construction parameters and radial coordinate as follows:

#[#set math.equation(numbering: n => "(2.1)")
 $ b = sqrt(3) / 2 \, wide h = 2 / 5 \, wide B = 4 / 3 = 1 / b^2 \, wide s = b \| x \|^2 . $ <eq:normalization>]

The same radial coordinate is used on the Fourier side. For the unit-covolume triangular lattice $A$, take the basis

$ u = sqrt(2 \/ sqrt(3)) thin \( 1 \, 0 \) \, wide v = sqrt(2 \/ sqrt(3)) thin \( 1 \/ 2 \, sqrt(3) \/ 2 \) . $

Then

$ b \| j u + ell v \|^2 = j^2 + j ell + ell^2 wide \( j \, ell in bb(Z) \) . $

Modulo 3 the right side equals $\( j - ell \)^2$, and is therefore 0 or 1.
  Modulo 2 it is even only when both $j$ and $ell$ are even, in which case it is divisible by 4.
  These two restrictions give the residue classes listed below.
  Thus every nonzero shell belongs to the positive part of the following periodic set:

#[#set math.equation(numbering: n => "(2.2)")
 $ L = { 0 \, 1 \, 3 \, 4 \, 7 \, 9 } \, wide cal(Z) = 12 bb(Z) + L \,\
cal(N) = cal(Z) ∩ \( 0 \, oo \) \, wide cal(N)_0 = { 0 } union cal(N) . $ <eq:node-set>]

The inclusion is strict. For example, $24 in cal(N)$, but if $j^2 + j ell + ell^2 = 24$,
  the parity implication makes $j \, ell$ even. Dividing by four gives the same quadratic form with value 6,
  so its two arguments are again even. The original value would then be divisible by 16,
  contrary to $16 divides.not 24$. Such additional nodes will also carry prescribed interpolation data.

Let $J$ denote rotation through a positive right angle. Since $det \( u \, v \) = 1$, the vectors $- J v \,
  J u$ are dual to $u \, v$. They generate $J A$, because $- v \, u$ form another basis of $A$.
  Hence $A^(*) = J A$, so the direct and dual lattices have the same radial shells.

=== 2.2 The normalized Gaussian theorem <the-normalized-gaussian-theorem>

The Fourier transform uses the convention fixed in the introduction.
  The common direct and dual shell set allows us to impose contacts at every positive node of $cal(N)$.
  The following theorem is the auxiliary result proved in Sections 2–5.

#thm([Theorem 2.1.])[
  (Normalized Gaussian Fourier pair).  #emph[For every finite real $k gt.eq 2.36$, put $T_k \( s \) =
    k^(- 1) e^(- k \( s - 1 \))$. There are entire functions $H_1 \, H_2$, real on the real axis,
    and a real radial Schwartz function $f$ on $bb(R)^2$ such that
$ f \( x \) = e^(- pi h b lr(||) x^2) H_1 \( b lr(||) x^2 \) \, wide hat(f) \( xi \) =
  e^(- pi h b lr(|xi|)^2) H_2 \( b lr(|xi|)^2 \) . $

 For every real $s gt.eq 0$,
#[#set math.equation(numbering: n => "(2.3)")
 $ H_1 \( s \) lt.eq T_k \( s \) \, wide H_2 \( s \) gt.eq 0 . $ <eq:normalized-signs>]

 At every $n in cal(N)$, the values and first derivatives satisfy
#[#set math.equation(numbering: n => "(2.4)")
 $ H_1 \( n \) = T_k \( n \) \, wide H'_1 \( n \) = T'_k \( n \) = - e^(- k \( n - 1 \)) \,\
H_2 \( n \) = H'_2 \( n \) = 0 . $ <eq:normalized-jets>]

]
] <thm:normalized-pair>

The full parameter range $k gt.eq 2.36$ and every artificial node are part of the assertion,
  beyond the contacts needed for the energy inequalities. The theorem asserts existence;
  uniqueness will be proved only in the fixed coefficient system of Proposition 10.

For $alpha gt.eq 1$, multiplying the pair by $k e^(- k)$ with $k =
  pi \( alpha \/ b - h \)$ gives a minorant of $e^(- pi alpha lr(||) x^2)$.
  A Fourier-complement construction supplies $0 < alpha < 1$.
  Section 6 proves this conversion and the sharp Gaussian energy comparison; Section 7 then proves Theorem 1.

The atomic companion #cite(label("AtomicTriangular2026")) Sections 3–4 uses finite atomic columns,
  a prescribed node set omitting $24$, and Gaussian damping $h = 17 \/ 50$.
  Here $h = 2 \/ 5$, and both jets are imposed at every positive node of the periodic superset.
  The common energy conclusion therefore does not identify the two auxiliary-function theorems.

=== 2.3 The sine product and its node coordinates <the-sine-product-and-its-node-coordinates>

We now begin the construction of the theorem’s pair. The first ingredient is a function with a double zero at
  every prescribed node. Define

#[#set math.equation(numbering: n => "(2.5)")
 $ P \( s \) = product_(a in L) (2 sin frac(pi \( s - a \), 12))^2 = sum_(l = - 6)^6 P_l e^(i pi t_l s) \, wide
   t_l = l / 6 . $ <eq:periodic-polynomial>]

This is an entire trigonometric polynomial, nonnegative and 12-periodic on the real axis,
  with a double zero at each point of $cal(Z)$ and no other real zeros. Its Fourier coefficients are

#[#set math.equation(numbering: n => "(2.6)")
 $ \( P_0 \, P_1 \, dots.h \, P_6 \) =
   (5 \, - 1 + 2 i b \, 1 + 2 i b \, - 2 \, - 1 / 2 + i b \, - 1 - 2 i b \, 1) \, wide P_(- l) =
   overline(P_l) . $ <eq:periodic-coefficients>]

Indeed, setting $w = e^(i pi s \/ 6)$ expresses the product as $w^(- 6)
  product_(a in L) \( w - e^(i pi a \/ 6) \)^2$. The scalar factor is one because $sum_(a in L) a = 24$;
  multiplying this degree-twelve polynomial gives (2.6).

At a node $n in cal(N)_0$, write

#[#set math.equation(numbering: n => "(2.7)")
 $ P \( n + u \) = Q_n u^2 #scale(x: 120%, y: 120%)[\(] 1 + D_n u +
   O \( u^2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:node-expansion>]

The periodicity of $P$ makes $Q_n \, D_n$ depend only on the residue $a$ of $n$:

#[#set math.equation(numbering: n => "(2.8)")
 $ a & Q_n & D_n\
0 & pi^2 \/ 3 & - 7 pi sqrt(3) \/ 18\
1 & \( 2 pi^2 \/ 3 \) \( 2 - sqrt(3) \) & pi \( 3 + sqrt(3) \) \/ 18\
3 & \( 2 pi^2 \/ 3 \) \( 2 - sqrt(3) \) & - pi \( 3 + sqrt(3) \) \/ 18\
4 & pi^2 \/ 3 & 7 pi sqrt(3) \/ 18\
7 & \( 2 pi^2 \/ 3 \) \( 2 + sqrt(3) \) & - pi \( 3 - sqrt(3) \) \/ 18\
9 & \( 2 pi^2 \/ 3 \) \( 2 + sqrt(3) \) & pi \( 3 - sqrt(3) \) \/ 18 $ <eq:node-constants>]

To obtain the table, remove the vanishing sine factor and take the value and logarithmic derivative of the
  remaining product:

$ Q_a = (pi / 6)^2 product_(d in L \\ { a }) (2 sin frac(pi \( a - d \), 12))^2 \, wide D_a = pi /
  6 sum_(d in L \\ { a }) cot frac(pi \( a - d \), 12) . $

The angle-addition formulas give the displayed entries. In particular,

#[#set math.equation(numbering: n => "(2.9)")
 $ Q_n > 7 / 4 = 1.75 \, wide \| D_n \| < 53 / 25 = 2.12 . $ <eq:node-constant-bounds>]

For these strict comparisons, $157 \/ 50 < pi < 22 \/ 7$ and $sqrt(3) < 1733 \/ 1000$ suffice.
  The smallest $Q_n$ is greater than $\( 2 \/ 3 \) \( 157 \/ 50 \)^2 \( 267 \/ 1000 \) > 7 \/ 4$,
  while the largest $\| D_n \|$ is $7 pi sqrt(3) \/ 18 < \( 22 \/ 18 \) \( 1733 \/ 1000 \) < 53 \/ 25$.
  The upper bound for $pi$ is proved in Section 3; the lower bound for $pi$ and the upper bound for $sqrt(3)$ are
  proved in Appendix 9.

=== 2.4 A spectral realization of summable cardinal data <a-spectral-realization-of-summable-cardinal-data>

Double-pole value terms and simple-pole derivative terms are familiar from the one-dimensional constructions of
  Cohn and Kumar #cite(label("CohnKumar2007")) Proposition 9.6 and Carneiro
  et al. #cite(label("CarneiroLittmannVaaler2013")) Section 1, (1.2)–(1.3).
  Here we need their planar Fourier transform and bounds uniform in the node location.
  A compactly supported spectral measure provides both.

A coefficient list consists of a real constant $C$ and real pairs $\( c_n \, d_n \)$ for $n in cal(N)_0$,
  with the unweighted norm

$ parallel a parallel_1 := \| C \| + sum_(n in cal(N)_0) \( \| c_n \| + \| d_n \| \) < oo . $

The letter $a$ denotes the full list. Away from the nodes, put

#[#set math.equation(numbering: n => "(2.10)")
 $ p_a \( s \) = P \( s \) (C + sum_(n in cal(N)_0) (frac(c_n, \( s - n \)^2) + frac(d_n, s - n))) .
   $ <eq:cardinal-function>]

We suppress the subscript when the list is understood.

#thm([Lemma 2.2.])[
  (Cardinal measure).  #emph[The function in (2.10) extends to an entire function, real on the real axis, with jets
#[#set math.equation(numbering: n => "(2.11)")
 $ p_a \( n \) = Q_n c_n \, wide p'_a \( n \) = Q_n \( d_n + D_n c_n \) quad \( n in cal(N)_0 \) . $ <eq:cardinal-jets>]

 There is a finite complex measure $mu_a$ on $\[ - 1 \, 1 \]$ such that
#[#set math.equation(numbering: n => "(2.12)")
 $ p_a \( s \) = integral_(- 1)^1 e^(i pi t s) thin #h(-0.16667em) upright(d) mu_a \( t \)
   wide \( s in bb(C) \) \, $ <eq:full-measure>]

 $mu_a \( - E \) = overline(mu_a \( E \))$ for every Borel set $E$, and
#[#set math.equation(numbering: n => "(2.13)")
 $ parallel mu_a parallel_(upright("TV")) lt.eq 25 \| C \| +
   36 sum_(n in cal(N)_0) \( \| c_n \| + \| d_n \| \) . $ <eq:spectral-variation>]

 For real $s$, the same value can be evaluated from a folded measure on $\[ 0 \, 1 \]$:
#[#set math.equation(numbering: n => "(2.14)")
 $ p_a \( s \) = "Re" integral_0^1 e^(i pi t s) thin #h(-0.16667em) upright(d) nu_a \( t \) . $ <eq:folded-evaluation>]

 The atoms of $nu_a$ are $C e_j P_j$ at $t_j$, where $e_0 = 1$ and $e_j = 2$ for $1 lt.eq j lt.eq 6$.
   Its density on the open frequency intervals is
#[#set math.equation(numbering: n => "(2.15)")
 $ d_j \( t \) = 2 pi sum_(n in cal(N)_0) e^(- i pi t n) sum_(l = j)^6 #scale(x: 120%, y: 120%)[\[] -
   pi c_n \( t_l - t \) + i d_n #scale(x: 120%, y: 120%)[\]] P_l e^(i pi t_l n) quad \( t_(j - 1) < t < t_j \) .
   $ <eq:folded-density>]

 The same variation bound holds for $nu_a$.]
] <lem:cardinal-measure>

#proof[
  First consider one node $n$. For $u = s - n$ and real $t_l$, direct integration gives the entire identities
  $ frac(e^(i pi t_l u) - 1, u) & = i pi integral_0^(t_l) e^(i pi t u) thin #h(-0.16667em) upright(d) t \,\
frac(e^(i pi t_l u) - 1 - i pi t_l u, u^2) & = - pi^2 integral_0^(t_l) \( t_l - t \) e^(i pi t u) thin
  #h(-0.16667em) upright(d) t . $
  The integrals include the removable values at $u = 0$. Multiply these identities by $P_l
    e^(i pi t_l n)$ and sum over $l$. The subtracted constant and linear terms cancel because $P \( n \) =
    P' \( n \) = 0$. We therefore obtain spectral measures for the two entire node fractions in (2.10).
    Their negative-frequency parts are conjugate reflections of their positive-frequency parts.
    Folding doubles the latter parts and gives exactly (2.15).
    These node measures are absolutely continuous; the atoms come only from $C P$,
    with the zero frequency counted once and every positive frequency counted twice.
  The coefficient row in (2.6) gives $\( \| P_1 \| \, dots.h \, \| P_6 \| \) = \( 2 \, 2 \, 2 \, 1 \, 2 \, 1 \)$.
    The constant column consequently has variation $\| P_0 \| + 2 sum_(l = 1)^6 \| P_l \| = 25$.
    Taking absolute values in the two integrals above gives, per unit $c_n$ and $d_n$, respectively,
  $ pi^2 sum_(l = 1)^6 t_l^2 \| P_l \| = frac(65 pi^2, 18) < 36 \, wide 2 pi sum_(l = 1)^6 t_l \| P_l \| =
    frac(32 pi, 3) < 36 . $
  The phases involving $n$ have modulus one at real frequencies, so these bounds are independent of the node.
    They apply to the full measure and to its folded form.
  For an absolutely summable list, the node measures now converge in total variation, proving (2.13).
    On every compact subset of the complex $s$-plane, $e^(i pi t s)$ and each of its $s$-derivatives are uniformly
    bounded for $\| t \| lt.eq 1$. Thus the measure integral and all its derivatives are locally uniform limits of
    those for finite lists. On a compact set avoiding the nodes,
    the reciprocal factors in the cardinal sum are uniformly bounded over all $n$,
    so absolute summability also gives uniform convergence of that sum there.
    The integral thus defines its entire extension, with the stated removals.
  For a finite list, (2.7) gives (2.11): the designated double and simple fractions give the two displayed terms,
    while every other term vanishes to order at least two at the node.
    Locally uniform convergence of the functions and their derivatives passes these identities to the full list.
    Finally, conjugate symmetry of the measure gives reality on the real axis and the folded formula. ◻
]

The entire extension is always the full complex integral (2.12).
  The real part in (2.14) is an evaluation rule for real $s$, not a definition at complex arguments.

=== 2.5 Gaussian damping and the transformed kernel <gaussian-damping-and-the-transformed-kernel>

For $- 1 lt.eq t lt.eq 1$, set

#[#set math.equation(numbering: n => "(2.16)")
 $ z \( t \) = - frac(B, t + i h) - i h \, wide lambda \( t \) = frac(i, b \( t + i h \)) . $ <eq:transformed-kernel>]

For a coefficient list $a$, define

#[#set math.equation(numbering: n => "(2.17)")
 $ K_(p_a) \( s \) = integral_(- 1)^1 lambda \( t \) e^(i pi z \( t \) s) thin #h(-0.16667em) upright(d)
   mu_a \( t \) . $ <eq:transformed-function>]

The image of $\[ - 1 \, 1 \]$ under $z$ is compact and $lambda$ is bounded there,
  so the same compact-uniform argument makes $K_(p_a)$ entire. Also,

$ lambda \( - t \) = overline(lambda \( t \)) \, wide z \( - t \) = - overline(z \( t \)) . $

It follows that $K_(p_a)$ is real on the real axis, where

#[#set math.equation(numbering: n => "(2.18)")
 $ K_(p_a) \( s \) = "Re" integral_0^1 lambda \( t \) e^(i pi z \( t \) s) thin #h(-0.16667em) upright(d)
   nu_a \( t \) . $ <eq:folded-transformed-function>]

#prodef([Remark 2.3.])[
  (Pointwise frequency consistency).  The rational formulas in (2.16) also make sense for complex $t eq.not -
    i h$. Since $z \( t \) + i h = - B \/ \( t + i h \)$, the image avoids $- i h$, and substitution twice gives
  $ z \( z \( t \) \) = t \, wide lambda \( t \) lambda \( z \( t \) \) =
    frac(i, b \( t + i h \)) frac(- i \( t + i h \), b B) = 1 . $
  These are pointwise frequency and amplitude identities for the Gaussian transform.
    They do not define a composition of the folded real-contour integral:
    $z$ does not preserve that contour, and a transformed profile has not thereby been given a cardinal measure on
    $\[ - 1 \, 1 \]$. The involution for the radial functions follows from the genuine Fourier transform below.
]

#thm([Lemma 2.4.])[
  (Fourier pairs).  #emph[For every coefficient list $a$, the radial functions $e^(- pi h s)
    p_a \( s \)$ and $e^(- pi h s) K_(p_a) \( s \)$ are real Schwartz functions on $bb(R)^2$ and are Fourier
    transforms of one another. Consequently, for any two lists, the entire functions
#[#set math.equation(numbering: n => "(2.19)")
 $ H_1 = p_1 + K_(p_2) \, wide H_2 = p_2 + K_(p_1) $ <eq:coupled-pair>]

 give the real radial Schwartz Fourier pair
$ f \( x \) = e^(- pi h b \| x \|^2) H_1 \( b \| x \|^2 \) \, wide hat(f) \( xi \) =
  e^(- pi h b \| xi \|^2) H_2 \( b \| xi \|^2 \) . $

]
] <lem:fourier-pair>

#proof[
  For a complex parameter $gamma$ with $"Re" gamma > 0$, the Gaussian transform in dimension two,
    with kernel $e^(- 2 pi i x dot.op xi)$, is
  #[#set math.equation(numbering: n => "(2.20)")
   $ hat(e^(- pi gamma \| x \|^2)) \( xi \) = gamma^(- 1) e^(- pi \| xi \|^2 \/ gamma) .
     $ <eq:complex-gaussian-transform>]
  For real $gamma > 0$, squaring the Gaussian integral and using polar coordinates gives the one-dimensional value
    $gamma^(- 1 \/ 2)$ at frequency zero. Integration by parts shows that the one-dimensional transform obeys
    $F' \( xi \) = - \( 2 pi xi \/ gamma \) F \( xi \)$. Solving this differential equation and taking the product
    in two coordinates proves (2.20) for positive real $gamma$.
    Both sides are holomorphic on the right half-plane; differentiation under the integral is locally justified by
    a polynomial times a decaying Gaussian. The identity theorem gives the complex case.
  After multiplication by $e^(- pi h s)$, the integrand in (2.12) is a Gaussian with parameter $gamma =
    b \( h - i t \) = - i b \( t + i h \)$, whose real part is the fixed positive number $b h$.
    Using $B = 1 \/ b^2$, its transform is
  $ frac(1, b \( h - i t \)) exp (- frac(pi \| xi \|^2, b \( h - i t \))) =
    e^(- pi h s) lambda \( t \) e^(i pi z \( t \) s) \, wide s = b \| xi \|^2 . $
  Integrating this identity against $mu_a$ proves the forward Fourier formula.
    The exchanges with Fourier integration, derivatives, and polynomial weights are justified uniformly:
    the measure is finite, the frequency interval is compact,
    and every differentiated real-space Gaussian is bounded by a fixed polynomial times a decaying Gaussian.
    On the transformed side, the real part of the Gaussian parameter is $h \/ \[ b \( h^2 + t^2 \) \]$,
    with a positive lower bound on $\[ - 1 \, 1 \]$. The same domination applies there.
    Both functions are therefore Schwartz.
  Fourier transformation twice reflects a Schwartz function.
    The functions here are radial, so reflection fixes them and proves the reverse transform. Linearity gives (2.19). ◻
]

=== 2.6 The jet operator and its distant outputs <the-jet-operator-and-its-distant-outputs>

For a function differentiable at the positive nodes, define the jet projection

#[#set math.equation(numbering: n => "(2.21)")
 $ \( cal(J) u \)_(c \, n) = frac(u \( n \), Q_n) \, wide \( cal(J) u \)_(d \, n) =
   frac(u' \( n \) - D_n u \( n \), Q_n) quad \( n in cal(N) \) . $ <eq:jet-projection>]

By Lemma 3, $cal(J) p_a$ is precisely the positive-node part of $a$.
  The three remaining coordinates, in the order $\( c_0 \, d_0 \, C \)$, are called the extra coordinates.
  They make no direct contribution to the jets at positive nodes; we will choose them in Section 3. Put

#[#set math.equation(numbering: n => "(2.22)")
 $ S a = - cal(J) K_(p_a) . $ <eq:jet-operator>]

For two full lists $a_1 \, a_2$, let $a_i^(+)$ denote their positive-node parts. The coupled pair (2.19) then satisfies

$ cal(J) H_1 = a_1^(+) - S a_2 \, wide cal(J) H_2 = a_2^(+) - S a_1 . $

Thus the interpolation problem asks for these two expressions to equal $cal(J) T_k$ and zero, respectively.
  This explains the minus sign in the definition of $S$. The next estimates bound the transformed contribution,
  especially at distant output nodes, uniformly in the locations of the input coefficients.

The same letter $S$ denotes its restriction to positive-node inputs with zero extras.
  Subscripts specify input and output restrictions. All list norms are unweighted sums of absolute values,
  including the sum of the norms on a pair of lists; operator norms are induced by them.
  A finite matrix therefore has the maximum absolute column-sum norm.

#thm([Lemma 2.5.])[
  (Kernel and tail bounds).  #emph[For $0 lt.eq t lt.eq 1$,
#[#set math.equation(numbering: n => "(2.23)")
 $ \| lambda \( t \) \| < 3 \, wide \| z \( t \) \| lt.eq 44 / 15 < 3 \, wide
   pi "Im" z \( t \) > .187 . $ <eq:global-kernel-bounds>]

 The last quantity exceeds $.70$ when $0 lt.eq t lt.eq 5 \/ 6$. On $5 \/ 6 lt.eq t lt.eq 1$, the sharper bounds are
#[#set math.equation(numbering: n => "(2.24)")
 $ \| lambda \( t \) \| < 1.25 \, wide \| z \( t \) \| < 1.32 \, wide pi "Im" z \( t \) > .187 +
   2.48 \( 1 - t \) . $ <eq:last-interval-bounds>]

 The operator $S$, with extra input coordinates included if desired,
   maps coefficient lists boundedly to positive-node $ell^1$ lists and has norm less than 4000. More precisely, if
$ w gt.eq sum_(n in cal(N)_0) \( \| c_n \| + \| d_n \| \) \, wide c gt.eq \| C \| \, $

 then for every positive integer $r$,
#[#set math.equation(numbering: n => "(2.25)")
 $ sum_(n in cal(N)\
n gt.eq r) #scale(x: 120%, y: 120%)[\(] \| \( S a \)_(c \, n) \| + \| \( S a \)_(d \, n) \|
  #scale(x: 120%, y: 120%)[\)] lt.eq U_r \( w \, c \) := 800 \( w + c \) frac(e^(- .70 r), 1 - e^(- .70)) +
  5.3 (frac(2.54 w, r) + 2 c) frac(e^(- .187 r), 1 - e^(- .187)) . $ <eq:tail-bound>]

 For several lists, the same formula bounds the sum of their tail outputs when $w \,
   c$ bound the corresponding sums of input coefficients.]
] <lem:kernel-bounds>

#proof[
  Write $q \( t \) = pi "Im" z \( t \)$ within this proof. Direct calculation gives
  $ \| lambda \( t \) \| & = frac(1, b sqrt(t^2 + h^2)) \,\
\| z \( t \) \|^2 & = h^2 + frac(B^2 - 2 B h^2, t^2 + h^2) \,\
q \( t \) & = pi h (frac(B, t^2 + h^2) - 1) . $
  Since $B > 2 h^2$, all three expressions decrease for $t gt.eq 0$.
    At zero, $\| lambda \| = 5 \/ sqrt(3) < 3$ and $\| z \| = 44 \/ 15$. At the other relevant endpoints,
  $ q \( 1 \) = frac(26 pi, 435) > .187 \, wide q \( 5 \/ 6 \) = frac(862 pi, 3845) > .70 \, $
  and
  $ \| lambda \( 5 \/ 6 \) \| = 60 / sqrt(2307) < 5 / 4 \, wide \| z \( 5 \/ 6 \) \|^2 = 33476 / 19225 < (33 / 25)^2 . $
  Finally,
  $ - q' \( t \) = frac(2 pi h B t, \( t^2 + h^2 \)^2) . $
  The function $t \/ \( t^2 + h^2 \)^2$ decreases for $t > h \/ sqrt(3)$.
    Its value at the last endpoint therefore gives $- q' \( t \) gt.eq
    2000 pi \/ 2523 > 2.48$ throughout $\[ 5 \/ 6 \, 1 \]$. Integrating from $t$ to 1 proves the last inequality
    in (2.24). All strict numerical comparisons here follow from $157 \/ 50 < pi < 22 \/
    7$ and squaring the positive rational bounds.
  One unit of spectral variation at frequency $t$ contributes at most
  #[#set math.equation(numbering: n => "(2.26)")
   $ frac(\| lambda \( t \) \|, Q_n) #scale(x: 120%, y: 120%)[\(] 1 + \| D_n \| +
     pi \| z \( t \) \| #scale(x: 120%, y: 120%)[\)] e^(- q \( t \) n) $ <eq:jet-kernel-cost>]
  to the sum of the two absolute jet coordinates at $n$. By (2.9),
    its prefactor is less than 22 globally and less than 5.3 on the last interval, since
  $ frac(3 \( 1 + 2.12 + 3 pi \), 1.75) < 22 \, wide frac(1.25 \( 1 + 2.12 + 1.32 pi \), 1.75) < 5.3 . $
  The variation bound is at most $36 parallel a parallel_1$.
    Summing (2.26) over all positive integers, a superset of the positive nodes, therefore gives
  $ parallel S parallel lt.eq frac(22 dot.op 36, e^.187 - 1) < 4000 . $
  For the final comparison, $e^.187 - 1 > .187 + \( .187 \)^2 \/ 2 > .198$.
  For the sharper tail, split the folded measure into $\[ 0 \, 5 \/ 6 \]$ and $\( 5 \/ 6 \, 1 \]$,
    assigning the atom at $5 \/ 6$ to the first part. The first part has variation at most $36 w + 25 c$.
    Its contribution to the row pair at $n$ is therefore at most
  $ 22 \( 36 w + 25 c \) e^(- .70 n) lt.eq 800 \( w + c \) e^(- .70 n) . $
  On the last open frequency interval, only $l = 6$ remains in (2.15).
    Here $\| P_6 \| = 1$ and $pi \( 1 - t \) lt.eq pi \/ 6 < 1$,
    so the density has absolute value at most $2 pi w$. The only atom in $\( 5 \/ 6 \, 1 \]$ is the one at 1,
    of mass $2 C$. This part contributes at most
  $ 5.3 e^(- .187 n) (2 pi w integral_(5 \/ 6)^1 e^(- 2.48 n \( 1 - t \)) thin #h(-0.16667em) upright(d) t +
    2 c) lt.eq 5.3 e^(- .187 n) (frac(2.54 w, n) + 2 c) \, $
  because $2 pi \/ 2.48 < 2.54$. Summing over the integers $n gt.eq r$ and using $1 \/ n lt.eq
    1 \/ r$ proves (2.25). Only absolute-value sums were used,
    so the same argument applies to several lists with their summed inputs. ◻
]

The same estimates control every derivative. If $V = 25 \| C \| + 36 sum_n \( \| c_n \| + \| d_n \| \)$,
  then for every integer $j gt.eq 0$ and real $s gt.eq 0$, differentiation of the spectral integrals gives

#[#set math.equation(numbering: n => "(2.27)")
 $ \| p_a^(\( j \)) \( s \) \| lt.eq pi^j V \, wide \| K_(p_a)^(\( j \)) \( s \) \| lt.eq
   3 \( 3 pi \)^j e^(- .187 s) V . $ <eq:uniform-derivative-bounds>]

Keeping the two frequency ranges separate as above gives, for $s > 0$,

#[#set math.equation(numbering: n => "(2.28)")
 $ \| K_(p_a)^(\( j \)) \( s \) \| lt.eq 3 \( 3 pi \)^j \( 36 w + 25 c \) e^(- .70 s) +
   1.25 \( 1.32 pi \)^j (frac(2.54 w, s) + 2 c) e^(- .187 s) . $ <eq:refined-derivative-bound>]

In particular, the jet, tail, and derivative bounds are uniform in the input node locations and require no
  finite-support assumption.

== 3 Positive quadrature and finite data <sec:finite>

The spectral formulas of Section 2 turn coefficient lists into genuine Fourier pairs.
  We now construct ten pairs of finite coefficient columns.
  Their linear combinations will approximate the two lists required by the coupled jet equations.
  The columns are fixed; only the coefficients of the combination vary with the Gaussian parameter.
  We control the construction in two ways: a uniform quadrature estimate bounds the error from replacing the six
  density integrals by finite sums, and finite interval comparisons establish the norm and sign bounds for the
  columns. Section 4 then corrects the lists to exact interpolation, and Section 5 uses these bounds to prove the signs.

All terminating decimals in this section denote exact rational numbers.
  For a real matrix, $∥A∥$ is its maximum absolute column sum. A column has its $ell^1$ norm, denoted $∥v∥_1$.
  Matrix products below are ordinary products, without complex conjugation.

=== 3.1 A positive rule for the six density integrals <a-positive-rule-for-the-six-density-integrals>

Set

$ M = 168 \, wide cal(F) = cal(N) ∩ \[ 1 \, M \] \, wide N = 384 . $

There are $84$ nodes in $cal(F)$: each of the fourteen successive blocks of twelve positive integers contains six
  permitted residues. A finite positive-node list has $168$ coordinates, first all $c_n$ and then all $d_n$,
  with $n$ increasing in each group. We append the extra coordinates $e = \( c_0 \, d_0 \, C \)$ in that order.
  Thus the complete finite input space has $171$ coordinates.

The folded spectral measure in Lemma 3 has a density on each interval $\( \( j - 1 \) \/ 6 \, j \/ 6 \)$ and seven
  atoms at $t_j = j \/ 6$. We leave the atoms unchanged. On each density interval define

#[#set math.equation(numbering: n => "(3.1)")
 $ alpha_v & = frac(v + 1 \/ 2, N) \, & tau_(j v) & = frac(2 j - 1 + cos \( pi alpha_v \), 12) \,\
o_v & = 1 / N (1 - 2 sum_(a = 1)^(N \/ 2 - 1) frac(cos \( 2 a pi alpha_v \), 4 a^2 - 1)) \, & 0 & lt.eq v < N \,
  quad 1 lt.eq j lt.eq 6 . $ <eq:quadrature-rule>]

The replacement of the density integral is the sum of masses $o_v d_j \( tau_(j v) \) \/ 6$.
  Since $0 < pi alpha_v < pi$, every quadrature point lies inside its frequency interval.
  This is the first Fejér rule described by Waldvogel #cite(label("Waldvogel2006")) Section 2,
  divided by two so that its weights on $\[ - 1 \, 1 \]$ approximate the average rather than the integral of mass
  two. We prove the exactness and positivity needed for this normalization.

Put $theta_v = pi \( v + 1 \/ 2 \) \/ N$. For $1 lt.eq l lt.eq 2 N - 1$, the finite identity

$ sum_(v = 0)^(N - 1) cos \( \( v + 1 \/ 2 \) t \) = frac(sin \( N t \), 2 sin \( t \/ 2 \)) $

at $t = l pi \/ N$ gives $N^(- 1) sum_v cos \( l theta_v \) = 0$.
  Applying the product-to-sum formula, for $1 lt.eq l lt.eq N - 1$ and $1 lt.eq a lt.eq N \/ 2 - 1$ we obtain

$ 1 / N sum_(v = 0)^(N - 1) cos \( l theta_v \) cos \( 2 a theta_v \) =
  cases(delim: "{", 1 \/ 2 \, & l = 2 a \,, 0 \, & l eq.not 2 a .) $

Consequently

$ sum_(v = 0)^(N - 1) o_v cos \( l theta_v \) =
  cases(delim: "{", 1 \, & l = 0 \,, 0 \, & l upright(" odd") \,, 1 \/ \( 1 - l^2 \) \, & l > 0
  upright(" even") \,) wide 0 lt.eq l lt.eq N - 1 . $

Let $C_l$ be the Chebyshev polynomial defined by $C_l \( cos theta \) = cos \( l theta \)$.
  These values equal $1 / 2 integral_(- 1)^1 C_l \( x \) thin #h(-0.16667em) upright(d) x$,
  as follows by substituting $x = cos theta$. The polynomials $C_0 \, dots.h \,
  C_(N - 1)$ span all polynomials of degree at most $N - 1$, so the rule is exact through degree $383$. Moreover,

$ sum_(a = 1)^(N \/ 2 - 1) frac(2, 4 a^2 - 1) = 1 - frac(1, N - 1) $

by telescoping. Since every cosine is at most one, this identity and the case $l = 0$ above prove

#[#set math.equation(numbering: n => "(3.2)")
 $ o_v gt.eq frac(1, N \( N - 1 \)) > 0 \, wide sum_(v = 0)^(N - 1) o_v = 1 . $ <eq:positive-quadrature-weights>]

The substitution $t = \( 2 j - 1 + x \) \/ 12$ changes the average rule on $\[ - 1 \, 1 \]$ into the weights
  $o_v \/ 6$ on the $j$th frequency interval. Each interval therefore has total weight $1 \/ 6$,
  and all six together have total weight one.

A tilde will denote this replacement of the density integrals.
  In particular, $tilde(p)$ and $tilde(K)_p$ are finite sums.
  The functions ultimately used in the Fourier pair remain $p$ and $K_p$ with their exact spectral integrals;
  the following lemma quantifies the difference.

#thm([Lemma 3.1.])[
  (Quadrature error for scaled moments).  #emph[Let $p$ and $K_p$ be the exact direct and transformed functions
    for one basis input among the $171$ coordinates $\( cal(F) \, e \)$.
    For every integer $a gt.eq 0$, real $0 lt.eq m lt.eq 168$, and real $\| y \| lt.eq 3 \/ 2$,
    the replacement (3.1), with all atoms kept exactly, changes each of
$ frac(y^a, a !) p^(\( a \)) \( m \) \, wide frac(y^a, a !) K_p^(\( a \)) \( m \) $

 by less than $10^(- 31)$ in absolute value.]
] <lem:quadrature-error>

#proof[
  We first bound each analytic integrand on a disk twice as wide as its real integration interval.
    We then use polynomial exactness and positivity to turn one Taylor remainder bound into a quadrature error
    bound. The estimates are uniform in the derivative order.
  For the $j$th density piece in (2.15), put $u = \( 2 j - 1 \) \/ 12$ and consider $\| t - u \| lt.eq 1 \/ 6$.
    On this disk, $\| t \| lt.eq 13 \/ 12 < 1.1$. The pole $- i h$ of $z$ and $lambda$ lies outside, and
  $ \| lambda \( t \) \| lt.eq frac(1, b \( h - 1 \/ 6 \)) < 5 \, wide \| z \( t \) \| lt.eq frac(B, h - 1 \/ 6) +
    h = 214 / 35 < 6.2 . $
  Inversion sends the disk centered at $u + i h$ with radius $1 \/
    6$ to the disk centered at $\( u - i h \) \/ \( u^2 + h^2 - 1 \/ 36 \)$ with radius
    $\( 1 \/ 6 \) \/ \( u^2 + h^2 - 1 \/ 36 \)$. Thus
  #[#set math.equation(numbering: n => "(3.3)")
   $ "Im" z \( t \) gt.eq frac(B \( h - 1 \/ 6 \), u^2 + h^2 - 1 \/ 36) - h gt.eq - 1402 /
     17505 > - .081 . $ <eq:complex-kernel-disk>]
  The middle expression decreases as $u$ increases, so its minimum among the six disks occurs at $u = 11 \/ 12$.
  For positive indices, the moduli of the coefficients in (2.6) are $\( 2 \, 2 \, 2 \, 1 \, 2 \, 1 \)$. Hence
  $ sum_(l = 1)^6 \| P_l \| = 10 \, wide sum_(l = 1)^6 t_l \| P_l \| = 16 / 3 . $
  For a $c_n$ basis column, the density on the disk has modulus at most
  $ 2 pi^2 e^(pi n \/ 6) sum_(l = j)^6 \| P_l \| \( t_l - u + 1 \/ 6 \) lt.eq
    frac(37 pi^2, 3) e^(pi M \/ 6) < 220 e^(pi M \/ 6) . $
  The last sum is bounded by $16 \/ 3 + \( 1 \/ 12 \) 10 = 37 \/ 6$;
    the first disk gives the largest possible added term. For a $d_n$ column the smaller bound $20 pi
    e^(pi M \/ 6)$ suffices. These arguments include $n = 0$.
    The constant column has only atoms, so it has no quadrature error.
  The direct scaled kernel factor satisfies
  $ \| e^(i pi t m) \| frac(\| i pi t y \|^a, a !) lt.eq e^(pi M \/ 6) e^(1.65 pi) \, $
  and the transformed factor satisfies
  $ \| lambda \( t \) e^(i pi z \( t \) m) \| frac(\| i pi z \( t \) y \|^a, a !) lt.eq 5 e^(.081 pi M) e^(9.3 pi) . $
  Here $x^a \/ a ! lt.eq e^x$ for $x gt.eq 0$ removes all dependence on $a$.
    The resulting direct and transformed integrand bounds are respectively
  $ 220 e^(pi M \/ 3 + 1.65 pi) \, wide 1100 e^(pi M \/ 6 + .081 pi M + 9.3 pi) . $
  For completeness, the elementary estimates used to bound these two numbers need no matrix or interval
    computation. Polynomial division gives
  $ 0 < integral_0^1 frac(x^4 \( 1 - x \)^4, 1 + x^2) thin #h(-0.16667em) upright(d) x = 22 / 7 - pi . $
  The positive exponential series, whose tail after degree six is bounded by a geometric series of ratio $1 \/ 8$, gives
  $ e < sum_(j = 0)^6 frac(1, j !) + frac(1, 7 ! \( 1 - 1 \/ 8 \)) = 95901 / 35280 < 2719 / 1000 . $
  With $M = 168$, the two exponents above are less than $182$ and $160$, respectively, after using $pi < 22 \/ 7$.
    The exact rational comparisons
  $ 220 \( 2719 \/ 1000 \)^182 < 10^83 \, wide 1100 \( 2719 \/ 1000 \)^160 < 10^83 $
  therefore bound both analytic integrands by $10^83$. This is the degree-six elementary route for the present
    allowance; it is separate from the scalar method developed in Appendix 9.
  The actual interval is $\| t - u \| lt.eq 1 \/ 12$, half the disk radius.
    Cauchy’s coefficient estimate bounds the Taylor tail after degree $383$ there by
  $ 10^83 sum_(r = 384)^oo 2^(- r) = 2 dot.op 10^83 2^(- 384) . $
  The degree-$383$ polynomial is integrated exactly. Both integration and quadrature are positive functionals of
    total mass one when the six intervals are combined, by (3.2).
    Applying each to the tail thus bounds their difference by
  $ 4 dot.op 10^83 2^(- 384) < 10^(- 31) \; $
  the final comparison is the integer inequality $4 dot.op 10^114 < 2^384$.
    Taking real parts cannot enlarge the error, and no atom was changed. ◻
]

=== 3.2 Masses and transformed jets <masses-and-transformed-jets>

The quadrature is now both specified and controlled. We next express it as matrix multiplication,
  so that every entry of the finite construction is determined by the formulas already given.
  The mass matrix $W$ has $6 N = 2304$ quadrature rows in lexicographic $\( j \, v \)$ order,
  followed by the seven atom rows in increasing $j$ order; its $171$ columns use the coordinate order specified
  above. For $t = tau_(j v)$ and $n in cal(F) union { 0 }$, set

$ W_(\( j \, v \) \, c_n) & = - frac(2 pi^2 o_v, 6) e^(- i pi t n) sum_(l = j)^6 \( t_l - t \) P_l e^(i pi t_l n) \,\
W_(\( j \, v \) \, d_n) & = frac(2 pi i o_v, 6) e^(- i pi t n) sum_(l = j)^6 P_l e^(i pi t_l n) \, &
  W_(\( j \, v \) \, C) & = 0 . $

At atom $j$, only the constant column is nonzero: $W_(upright("atom") \( j \) \, C) = e_j P_j$, where $e_0 =
  1$ and $e_j = 2$ for $j > 0$. These are exactly the folded masses of Lemma 3.

For the tuple $t$ of all $2311$ mass points, define the row vectors

#[#set math.equation(numbering: n => "(3.4)")
 $ F_a \( m \, y \; t \) & = e^(i pi t m) frac(\( i pi y t \)^a, a !) \,\
G_a \( m \, y \; t \) & = lambda \( t \) e^(i pi z \( t \) m) frac(\( i pi y z \( t \) \)^a, a !) .
  $ <eq:quadrature-moments>]

For a real coefficient column $A$, the real parts of $F_a W A$ and $G_a W
  A$ are the order-$a$ derivatives at $m$ of its direct and transformed finite sums, multiplied by $y^a \/ a !$.
  This follows by differentiating each finite exponential sum.
  It fixes, in particular, the absence of conjugation in these products.

Apply the jet projection of (2.21) to the transformed sums and write

$ \( tilde(S)_(cal(F) cal(F)) \, tilde(S)_(cal(F) e) \) = - cal(J)_(cal(F)) tilde(K) \, wide D =
  tilde(S)_(cal(F) cal(F)) . $

Thus $D$ is a $168 times 168$ matrix; it is distinct from the scalar node constants $D_n$.
  Explicitly, if $a_n = "Re" \( G_0 \( n \, 1 \) W \)$ and $b_n = "Re" \( G_1 \( n \, 1 \) W \)$,
  the $c_n$ and $d_n$ rows of the full projected matrix are

$ - a_n \/ Q_n \, wide \( D_n a_n - b_n \) \/ Q_n \, $

respectively. The bounds in (2.9) ensure that these denominators are positive.

=== 3.3 Target data and finite reference columns <target-data-and-finite-reference-columns>

The ten data coordinates encode the target jets at the first five positive nodes. Define

$ \( n_1 \, dots.h \, n_5 \) = \( 1 \, 3 \, 4 \, 7 \, 9 \) \, wide v_j = e^(- k \( n_j - 1 \)) \, wide
  q \( k \) = \( v_1 \, dots.h \, v_5 \, v_1 \/ k \, dots.h \, v_5 \/ k \)^t . $

The first five coordinates are $- T'_k \( n_j \)$ and the last five are $T_k \( n_j \)$.
  We will convert these values and slopes to cardinal coordinates with the jet projection $cal(J)$.
  In the cardinal formula, $c_0 \, d_0$ determine the value and slope of the direct profile $p$ at the origin,
  while $C$ multiplies $P$ and supplies the constant term in the later rational tail comparison.
  These three coordinates leave all direct positive-node jets unchanged, but alter the transformed contribution.
  We fix them first; Section 4 will correct the positive-node coefficients to impose all contacts of the coupled
  pair. We choose the following values, whose suitability will be established by the norm and sign estimates
  below. In the order of list 1 followed by list 2, they are

#[#set math.equation(numbering: n => "(3.5)")
 $ E \( k \) = vec(.567, .250, - .0074, 0, - .209, .0096) + 1 /
   k vec(- .976, .408, .0115, 1, .938, - .017) . $ <eq:extra-data>]

Let $E_1 \, E_2$ be $3 times 10$ matrices. Their first columns are the first and last three entries, respectively,
  of the first vector in (3.5); their sixth columns use the corresponding entries of the second vector,
  and all other columns vanish. Since $v_1 = 1$, the stack of $E_1 q \( k \)$ and $E_2
  q \( k \)$ is exactly $E \( k \)$.

Define a $168 times 10$ matrix $Y$ by the following nonzero entries, for $1 lt.eq j lt.eq 5$:

$ Y_(d_(n_j) \, j) = - 1 / Q_(n_j) \, wide Y_(c_(n_j) \, j + 5) = 1 / Q_(n_j) \, wide Y_(d_(n_j) \, j + 5) = -
  D_(n_j) / Q_(n_j) . $

Then $Y q \( k \)$ is the jet projection of $T_k$ at these five nodes and is zero at the other nodes of $cal(F)$.
  The remaining target jets are small; Section 4 will include them in the correction.

To see which equations the finite columns must approximate, write $A_1 \,
  A_2$ for their unknown positive-node parts, each a $168 times 10$ matrix.
  The coupled jet identities from Section 2, with integrals replaced by quadrature and target data replaced by $Y$, give

$ A_1 - D A_2 = Y + tilde(S)_(cal(F) e) E_2 \, wide A_2 - D A_1 = tilde(S)_(cal(F) e) E_1 . $

Each right side contains the other list’s extras because the transformed function in $H_i$ comes from that other
  list. Denote these right sides by $g_1 \, g_2$. Adding and subtracting the equations gives

$ \( I - D \) \( A_1 + A_2 \) = g_1 + g_2 \, wide \( I + D \) \( A_1 - A_2 \) = g_1 - g_2 . $

We use finite geometric sums in place of the two inverses and define

#[#set math.equation(numbering: n => "(3.6)")
 $ g_1 & = Y + tilde(S)_(cal(F) e) E_2 \, & g_2 & = tilde(S)_(cal(F) e) E_1 \,\
V_(+) & = sum_(j = 0)^511 D^j \, & V_(-) & = sum_(j = 0)^511 \( - D \)^j \,\
X_(1 cal(F)) & = 1 / 2 #scale(x: 120%, y: 120%)[\(] V_(+) \( g_1 + g_2 \) +
  V_(-) \( g_1 - g_2 \) #scale(x: 120%, y: 120%)[\)] \,\
X_(2 cal(F)) & = 1 / 2 #scale(x: 120%, y: 120%)[\(] V_(+) \( g_1 + g_2 \) -
  V_(-) \( g_1 - g_2 \) #scale(x: 120%, y: 120%)[\)] \, & X_i & =
  vec(X_(i cal(F)), E_i) quad \( i = 1 \, 2 \) . $ <eq:finite-columns>]

The identities $\( I - D \) V_(+) = \( I + D \) V_(-) = I -
  D^512$ show that the error in these equations is controlled by $D^512$.
  Its bound, and the passage back to the exact integrals, are proved in Section 4.
  Each $X_i$ has $171$ rows and ten columns; the reference list for a given $k$ will be $X_i q \( k \)$.
  A column is extended by zero beyond $M$ when regarded as a full list.
  For any such matrix $X$, the row functions $p_X$ and $K_X$ have $j$th components $p_(\( X \)_j)$ and
  $K_(p_(\( X \)_j))$; the same convention applies to finite sums and derivatives.
  Although the reference lists have finite support, their profiles $p_(X_i q \( k \))$ and $K_(p_(X_i q \( k \)))$
  use the exact spectral integrals. The tilde profiles replace those integrals by the quadrature rule when
  constructing finite moment rows.

The remaining finite bounds have three roles. Bounds on powers of $D$ and the sums $V_(+) \,
  V_(-)$ will control the finite inverse in Section 4, while column norms will control the size of the reference
  lists and their interpolation residual. Half-gap and tail inequalities formed from the reference columns will
  supply quantitative margins in the proof of $T_k - H_1 gt.eq 0$ and $H_2 gt.eq 0$.
  Section 5 will compare these inequalities with the exact pair,
  accounting for the interpolation correction and the approximation errors.
  We next construct the rows for those sign inequalities.

=== 3.4 Containing parameter boxes <containing-parameter-boxes>

The data vector $q \( k \)$ lies on a one-dimensional curve.
  To obtain lower bounds uniform in $k$, we place each part of that curve in a rectangular box. The endpoints are

$ 2.36 \, quad 2.65 \, quad 3.2 \, quad 4 \, quad 6 \, quad oo . $

For a real row $l = \( a_1 \, dots.h \, a_5 \, b_1 \, dots.h \, b_5 \)$ and consecutive endpoints $K \, J$, define

#[#set math.equation(numbering: n => "(3.7)")
 $ \[ l \]_(K \, J) =
   min_(x in { 1 \/ K \, 1 \/ J })
   (a_1 + x b_1 + sum_(j = 2)^5 min_(H in { K \, J }) { \( a_j + x b_j \) e^(- H \( n_j - 1 \)) }) . $ <eq:box-lower>]

At $J = oo$, the conventions are $1 \/ J = 0$ and $e^(- J \( n_j - 1 \)) = 0$ for $j > 1$.

#thm([Lemma 3.2.])[
  (Containing parameter boxes).  #emph[Let $K \, J$ be consecutive endpoints in the displayed list.
    For every real row $l$ as above and every finite $k$ with $K lt.eq k lt.eq J$,
    where the upper inequality is omitted if $J = oo$, one has $l q \( k \) gt.eq \[ l \]_(K \, J)$.]
] <lem:parameter-box>

#proof[
  Write $x = 1 \/ k$ and $w_j = e^(- k \( n_j - 1 \))$ for $j = 2 \, dots.h \, 5$. The physical vector lies in the box
  $ x in \[ 1 \/ J \, 1 \/ K \] \, wide w_j in \[ e^(- J \( n_j - 1 \)) \, e^(- K \( n_j - 1 \)) \] . $
  On this larger box the expression $a_1 + x b_1 + sum_(j = 2)^5 \( a_j + x b_j \)
    w_j$ is affine in each variable while the others are fixed. Its minimum therefore occurs at a vertex.
    First minimizing each $w_j$ and then the single shared $x$ gives exactly (3.7).
    This is a containing-box bound, not sampling of the curve $q \( k \)$. ◻
]

=== 3.5 Polynomial rows on the half-gaps <polynomial-rows-on-the-half-gaps>

We now construct the rows to which the containing-box bound will be applied.
  They are Bernstein coefficients of polynomials that will control the signs between nodes.
  The required inequalities are $T_k - H_1 gt.eq 0$ and $H_2 gt.eq 0$, so set $sigma_1 = - 1$ and $sigma_2 = 1$.
  At each center $m in cal(N)_0 ∩ \[ 0 \, 88 \]$, take the half-gap toward its successor and, when $m > 0$,
  the half-gap toward its predecessor in $cal(N)_0$. If $m'$ is that neighbor, put $y = \( m' - m \) \/ 2$.
  The half-gap consists of $s = m + y x$, $0 lt.eq x lt.eq 1$, with signed $y$.

At a positive center the desired value and derivative contacts would make $T_k -
  H_1$ and $H_2$ vanish to second order. Before making an approximation,
  we therefore subtract these two Taylor terms from each component. For an entire function $u$, define

$ cal(D)_(m \, 2) u \( s \) = frac(u \( s \) - u \( m \) - \( s - m \) u' \( m \), \( s - m \)^2) \, wide
  cal(D)_(m \, 2) u \( m \) = frac(u'' \( m \), 2) . $

If $u \( m \) = u' \( m \) = 0$, then

$ u \( s \) = \( s - m \)^2 cal(D)_(m \, 2) u \( s \) . $

Once exact interpolation is imposed, this identity applies to both $u = T_k - H_1$ and $u =
  H_2$ at every positive center. It reduces their sign inequalities to lower bounds for quotients that remain
  regular at the nodes. At the origin we use $cal(D)_(0 \, 0) u = u$.
  Put $nu = 0$ there and $nu = 2$ at every positive center. Taylor expansion gives

$ cal(D)_(m \, nu) u \( m + y x \) = sum_(r = 0)^oo frac(y^r, \( r + nu \) !) u^(\( r + nu \)) \( m \) x^r . $

This subtraction is defined even for reference functions that do not interpolate exactly.
  For the reference pair formed from the columns $X_i$, we keep the first 41 coefficients and replace each
  spectral moment by its quadrature sum. The resulting ten-component rows are

#[#set math.equation(numbering: n => "(3.8)")
 $ l_(i \, r) & =
   sigma_i frac(y^r, \( r + nu \) !)
   (tilde(p)_(X_i)^(\( r + nu \)) \( m \) + tilde(K)_(X_(3 - i))^(\( r + nu \)) \( m \)) \, &  & 0 lt.eq r lt.eq 40 \,\
L_(i \, d) & = sum_(r = 0)^d omega_(d r) l_(i \, r) \, & omega_(d r) & = binom(d, r) / binom(40, r) \, wide
  0 lt.eq d lt.eq 40 . $ <eq:bernstein-rows>]

Equivalently, the first row is

$ l_(i \, r) = sigma_i y^(- nu) "Re" #scale(x: 120%, y: 120%)[\(] F_(r + nu) \( m \, y \) W X_i +
  G_(r + nu) \( m \, y \) W X_(3 - i) #scale(x: 120%, y: 120%)[\)] . $

There is no singular case here: every selected half-gap has $y eq.not 0$.

The rows $L_(i \, d)$ are exactly the degree-$40$ Bernstein coefficients of $sum_(r = 0)^40 l_(i \, r) x^r$.
  Indeed, the binomial theorem gives

$ x^r = sum_(d = r)^40 binom(d, r) / binom(40, r) binom(40, d) x^d \( 1 - x \)^(40 - d) . $

On $\[ 0 \, 1 \]$ the complete family $binom(40, d) x^d \( 1 - x \)^(40 - d)$, $0 lt.eq d lt.eq 40$,
  is nonnegative and sums to one. Thus a polynomial value lies between its smallest and largest Bernstein
  coefficients, the standard coefficient-range enclosure discussed by Titi and
  Garloff #cite(label("TitiGarloff2019")) Section 3. The identity just proved specifies our rows;
  the local remainder and parameter estimates are separate.

The first inequality also contains the target quotient $cal(D)_(m \, nu) T_k$.
  To bound it below on the same half-gap and parameter box, define

#[#set math.equation(numbering: n => "(3.9)")
 $ \( a_r^(*) \)_(r = 0)^40 =
   cases(delim: "{", #scale(x: 120%, y: 120%)[\(] \( e^K \/ K \) \( - K y \)^r \/ r !
   #scale(x: 120%, y: 120%)[\)]_(r = 0)^40 \, & m = 0 \,, #scale(x: 120%, y: 120%)[\(]
   K \( - K y \)^r \/ \( r + 2 \) ! #scale(x: 120%, y: 120%)[\)]_(r = 0)^40 \, & m = 1 \,,
   #scale(x: 120%, y: 120%)[\(] \( J \/ 2 \) e^(- 13 J \/ 6) \, 0 \, dots.h \,
   0 #scale(x: 120%, y: 120%)[\)] \, & m = 3 \, med J < oo \,, \( 0 \, dots.h \, 0 \) \, & upright("otherwise") .)
   $ <eq:target-support>]

Lemma 11 proves the precise lower bound

$ cal(D)_(m \, nu) T_k \( m + y x \) gt.eq sum_(r = 0)^40 a_r^(*) x^r - .000001 wide \( 0 lt.eq x lt.eq 1 \) . $

Thus the target polynomial supports the same quotient as the reference polynomial;
  its truncation error is retained separately.

=== 3.6 The complete finite certificate <the-complete-finite-certificate>

For large $s$, we will use the low-node terms of the cardinal formula rather than its Taylor expansion. Put

$ s_0 = 89.5 \, wide cal(N)_(lt.eq 88) = cal(N)_0 ∩ \[ 0 \, 88 \] . $

Write $u_(i \, n)$ and $d_(i \, n)^(*)$ for the $c_n$ and $d_n$ rows of $sigma_i X_i$,
  and $C_i^(*)$ for its constant row. For the reference list $X_i q \( k \)$,
  the signed rational part from these rows is

$ sigma_i R_(i \, 0)^(upright("ref")) \( s \) = C_i^(*) q \( k \) +
  sum_(n in cal(N)_(lt.eq 88)) (frac(u_(i \, n) q \( k \), \( s - n \)^2) + frac(d_(i \, n)^(*) q \( k \), s - n)) . $

The identity

$ frac(1, s - n) = 1 / s + frac(n, s \( s - n \)) $

groups the simple-pole rows into a coefficient of $1 \/ s$ and a remaining sum.
  For a fixed parameter box, put $eta_(K \, J) \( l \) = min \( 0 \, \[ l \]_(K \, J) \)$.
  This gives a nonpositive lower bound for the numerator $l q \( k \)$.
  On $s gt.eq s_0$, the reciprocal factors are positive and decrease with $s$,
  so their products with this lower bound are smallest at $s_0$.
  Keeping the full lower bound for the constant row gives the tail expression in the proposition below.
  In Section 5, its positive margin will absorb the correction to the exact lists and the omitted high-node and
  transformed terms.

#thm([Proposition 3.3.])[
  (Finite certificate).  #emph[The exact arrays defined in this section satisfy
#[#set math.equation(numbering: n => "(3.10)")
 $ ∥D^64∥ < .004 \, wide ∥V_(+)∥ + ∥V_(-)∥ < 36 \,\
sum_(i = 1)^2 ∥\( X_i \)_j∥_1 < cases(delim: "{", 2.3 \, & 1 lt.eq j lt.eq 5 \,, 5.6 \, & 6 lt.eq j lt.eq 10 .)
  $ <eq:finite-norms>]

 For every specified half-gap, $i = 1 \, 2$, consecutive parameter endpoints $K \, J$, and $0 lt.eq d lt.eq 40$,
#[#set math.equation(numbering: n => "(3.11)")
 $ \[ L_(i \, d) \]_(K \, J) + upright(bold(1))_(i = 1) sum_(r = 0)^d omega_(d r) a_r^(*) > .001 .
   $ <eq:bernstein-certificate>]

 For every box and $i = 1 \, 2$,
#[#set math.equation(numbering: n => "(3.12)")
 $ \[ C_i^(*) \]_(K \, J) & +
   frac(eta_(K \, J) #scale(x: 120%, y: 120%)[\(] sum_(n in cal(N)_(lt.eq 88)) d_(i \, n)^(*)
   #scale(x: 120%, y: 120%)[\)], s_0)\
 & +
   sum_(n in cal(N)_(lt.eq 88))
   (frac(eta_(K \, J) \( u_(i \, n) \), \( s_0 - n \)^2) + frac(n thin eta_(K \, J) \( d_(i \, n)^(*) \), s_0 \(
   s_0 - n \))) > .0021 . $ <eq:tail-certificate>]

]
] <prop:finite-certificate>

#proof[
  #emph[Finite verification.] We specify the complete stronger exact-array comparisons in Tables 1–3 and the route
    by which each is checked. Their looser consequences are the proposition’s outputs,
    whose analytic use is separate. No precomputed coefficient list or approximate auxiliary function is an input:
    all arrays are reconstructed from (3.1)– (3.6).
  The power sums use nine doubling steps. Start with $U = D$ and $V_(+) = V_(-) = I$.
    At step $r = 0 \, dots.h \, 8$, replace $V_(+)$ by $V_(+) \( I + U \)$ and $V_(-)$ by
    $V_(-) \( I + epsilon.alt_r U \)$, where $epsilon.alt_0 = - 1$ and $epsilon.alt_r = 1$ for $r > 0$;
    square $U$ before the next step. Before step $r$, $U = D^(2^r)$, and
  $ product_(r = 0)^8 \( I + D^(2^r) \) = sum_(j = 0)^511 D^j \,
    wide \( I - D \) product_(r = 1)^8 \( I + D^(2^r) \) = sum_(j = 0)^511 \( - D \)^j . $
  Thus the final sums are exactly those in (3.6). Table 1 gives strict upper bounds for $U$ before each update and
    for both sums after it. Row 6 therefore bounds $D^64$.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Step $r$
], table.cell(rowspan: 1, colspan: 1)[$∥U∥$
], table.cell(rowspan: 1, colspan: 1)[$∥V_(+)∥$
], table.cell(rowspan: 1, colspan: 1)[$∥V_(-)∥$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1.74
], table.cell(rowspan: 1, colspan: 1)[2.74
], table.cell(rowspan: 1, colspan: 1)[2.1
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2.09
], table.cell(rowspan: 1, colspan: 1)[6.94
], table.cell(rowspan: 1, colspan: 1)[2.2
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[2.27
], table.cell(rowspan: 1, colspan: 1)[15.32
], table.cell(rowspan: 1, colspan: 1)[2.13
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[1.75
], table.cell(rowspan: 1, colspan: 1)[25.3
], table.cell(rowspan: 1, colspan: 1)[1.97
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[.75
], table.cell(rowspan: 1, colspan: 1)[31.1
], table.cell(rowspan: 1, colspan: 1)[1.88
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[.12
], table.cell(rowspan: 1, colspan: 1)[32.09
], table.cell(rowspan: 1, colspan: 1)[1.85
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[.0031
], table.cell(rowspan: 1, colspan: 1)[32.12
], table.cell(rowspan: 1, colspan: 1)[1.85
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[.000002
], table.cell(rowspan: 1, colspan: 1)[32.12
], table.cell(rowspan: 1, colspan: 1)[1.85
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[.000000000001
], table.cell(rowspan: 1, colspan: 1)[32.12
], table.cell(rowspan: 1, colspan: 1)[1.85
],
)
]],
    caption: [Table 1: Strict upper bounds in the nine-step power computation. ],
  )
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Columns $1$–$5$
], table.cell(rowspan: 1, colspan: 1)[Columns $6$–$10$
]),
  table.cell(rowspan: 1, colspan: 1)[$max_j ∥\( X_1 \)_j∥_1$
], table.cell(rowspan: 1, colspan: 1)[1.29
], table.cell(rowspan: 1, colspan: 1)[2.65
],
  table.cell(rowspan: 1, colspan: 1)[$max_j ∥\( X_2 \)_j∥_1$
], table.cell(rowspan: 1, colspan: 1)[1.01
], table.cell(rowspan: 1, colspan: 1)[3.03
],
  table.cell(rowspan: 1, colspan: 1)[$max_j sum_i ∥\( X_i \)_j∥_1$
], table.cell(rowspan: 1, colspan: 1)[2.20
], table.cell(rowspan: 1, colspan: 1)[5.40
],
)
]],
    caption: [Table 2: Strict upper bounds for column norms. In the last row the two norms are added for the same column before taking the maximum. ],
  )
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 4, align: center)[Half-gap certificate
], table.cell(rowspan: 1, colspan: 1)[]),
  table.cell(rowspan: 1, colspan: 1)[2-5 $K$
], table.cell(rowspan: 1, colspan: 1)[$m = 0$
], table.cell(rowspan: 1, colspan: 1)[$m = 1$
], table.cell(rowspan: 1, colspan: 1)[$m = 3 \, 4$
], table.cell(rowspan: 1, colspan: 1)[$7 lt.eq m lt.eq 88$
], table.cell(rowspan: 1, colspan: 1)[Tail
],
  table.cell(rowspan: 1, colspan: 1)[2.36
], table.cell(rowspan: 1, colspan: 1)[.33
], table.cell(rowspan: 1, colspan: 1)[.019
], table.cell(rowspan: 1, colspan: 1)[.0033
], table.cell(rowspan: 1, colspan: 1)[.00116
], table.cell(rowspan: 1, colspan: 1)[.0022
],
  table.cell(rowspan: 1, colspan: 1)[2.65
], table.cell(rowspan: 1, colspan: 1)[.34
], table.cell(rowspan: 1, colspan: 1)[.017
], table.cell(rowspan: 1, colspan: 1)[.0037
], table.cell(rowspan: 1, colspan: 1)[.0018
], table.cell(rowspan: 1, colspan: 1)[.0029
],
  table.cell(rowspan: 1, colspan: 1)[3.2
], table.cell(rowspan: 1, colspan: 1)[.35
], table.cell(rowspan: 1, colspan: 1)[.033
], table.cell(rowspan: 1, colspan: 1)[.0061
], table.cell(rowspan: 1, colspan: 1)[.0026
], table.cell(rowspan: 1, colspan: 1)[.0036
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[.36
], table.cell(rowspan: 1, colspan: 1)[.036
], table.cell(rowspan: 1, colspan: 1)[.0085
], table.cell(rowspan: 1, colspan: 1)[.0031
], table.cell(rowspan: 1, colspan: 1)[.0043
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[.38
], table.cell(rowspan: 1, colspan: 1)[.011
], table.cell(rowspan: 1, colspan: 1)[.0105
], table.cell(rowspan: 1, colspan: 1)[.0037
], table.cell(rowspan: 1, colspan: 1)[.0052
],
)
]],
    caption: [Table 3: Strict lower bounds for the left sides of (3.11) and (3.12). Each half-gap entry covers both functions, every indicated center and signed half-gap, and all Bernstein indices. The right endpoint $J$ follows $K$ in the endpoint list. ],
  )
  There are $46$ centers: the seven complete residue blocks in $\[ 0 \, 83 \]$ contribute $42$, and $84 \, 85 \,
    87 \, 88$ contribute four more. Every center has a right half-gap and every center except zero has a left one,
    giving $91$. Consequently the sign table consists of $91 dot.op 2 dot.op 5 dot.op 41 =
    37310$ separate real lower comparisons, and the tail column consists of ten.
    The power and column tests likewise compare every indicated norm, including each same-column paired norm.
  The selected finite route encloses the exact mathematical quadrature arrays directly by Arb ball arithmetic,
    whose inclusion principle is described by Johansson #cite(label("Johansson2017")).
    The local source implements these formulas at $256$-bit precision.
    For an upper comparison the required test is that the whole ball lies below its table cutoff;
    for a lower comparison it is that the whole ball lies above it.
    It performs these tests for all indices just counted. All comparisons in Tables 1–3 pass these strict
    inclusion tests. The containing-box lemma, Bernstein range property,
    and analytic remainders provide continuum coverage in $s$ and $k$.
  Finally, the stronger cutoffs imply the displayed proposition bounds:
    $.0031 < .004$, $32.12 + 1.85 < 36$, $2.20 < 2.3$, $5.40 < 5.6$, $.00116 > .001$, and $.0022 > .0021$.
    Appendix 11 gives a second, fully specified floor-rounded rational procedure and proves that a successful
    comparison with these same stronger cutoffs implies the looser proposition bounds after its roundoff allowances. ◻
]

== 4 Exact interpolation in the summable coefficient space <sec:interpolation>

The finite columns of Section 3 approximate the interpolation equations,
  but the auxiliary functions must use the genuine spectral integrals.
  We correct the finite lists in an unweighted $ell^1$ space, holding their extra coordinates fixed.
  The useful small quantity is not the norm of the full transformed-jet operator:
  it is the norm of its outputs at distant nodes. This allows a finite-block inverse followed by a small tail
  correction.

The elimination method adapts the finite-block and tail argument of OpenAI #cite(label("SharpPlanar2026"))
  Section 3. The operator, target data, and quantitative estimates below are those of the present Gaussian problem.

Let

$ cal(E) = ell^1 \( cal(N) \; bb(R)^2 \) \, wide cal(T) = cal(N) \\ cal(F) \, $

where $cal(F) = cal(N) ∩ \[ 1 \, 168 \]$ is the finite node set from Section 3.
  The two coordinates at each node are its $c$- and $d$-coefficients.
  On a pair of lists we use the sum of their norms. A subscript $cal(F)$ or $cal(T)$ restricts the corresponding
  input or output; the paired finite block has 336 coordinates.
  Every operator norm is induced by these unweighted norms.

#thm([Proposition 4.1.])[
  (Exact interpolation).  #emph[For every real $k gt.eq 2.36$,
    there is a unique pair of positive-node lists in $cal(E)$, with extra coordinates $e_i = E_i q \( k \)$,
    whose full lists $ell_i$ give
#[#set math.equation(numbering: n => "(4.1)")
 $ H_1 \( n \) & = T_k \( n \) \, & H'_1 \( n \) & = T'_k \( n \) \,\
H_2 \( n \) & = 0 \, & H'_2 \( n \) & = 0 wide \( n in cal(N) \) \, $ <eq:exact-jets>]

 where $H_1 = p_(ell_1) + K_(p_(ell_2))$ and $H_2 = p_(ell_2) + K_(p_(ell_1))$.
   Let $ell_i^(upright("ref")) = X_i q \( k \)$, extended by zero on $cal(T)$. Then
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(i = 1)^2 ∥ell_i^(upright("ref"))∥_1 < 4.8 \, wide sum_(i = 1)^2 ∥ell_i -
   ell_i^(upright("ref"))∥_1 < 2 dot.op 10^(- 8) \, wide sum_(i = 1)^2 ∥ell_i∥_1 < 5 . $ <eq:exact-list-bounds>]

 The functions $H_1 \, H_2$ are entire and real on the real axis.
   In particular, $H_1 - T_k$ and $H_2$ have zeros of order at least two at every positive node,
   including the nodes that are not lattice radii. Their Gaussian-damped functions form the real radial Schwartz
   Fourier pair of Lemma 5.]
] <prop:exact-interpolation>

The bounded inverse below gives uniqueness for summable coefficient lists with fixed extras and jets prescribed on
  the larger periodic node set $cal(N)$. This differs from reconstruction using only the actual triangular shells:
  Talebizadeh Sardari #cite(label("Sardari2021")) Theorem 1.7 constructs infinitely many linearly independent
  radial Schwartz functions whose values and radial derivatives, and those of their Fourier transforms,
  vanish on all those shells.

#proof[
  We first solve the exact operator equation on the full space.
    We then bound the size and residual of the finite reference lists and use the same block equations to estimate
    their correction.
  ===== 4.1 The coupled jet equation. <the-coupled-jet-equation.>
  Write $a_i in cal(E)$ for the positive-node part of $ell_i$. By (2.11) and (2.22), the desired equations are
  #[#set math.equation(numbering: n => "(4.3)")
   $ cal(L) binom(a_1, a_2) := mat(delim: "(", I, - S; - S, I) binom(a_1, a_2) =
     binom(cal(J) T_k + S_e e_2, S_e e_1) . $ <eq:infinite-interpolation-system>]
  Here $S$ acts on positive-node inputs, while $S_e$ acts on the three extra coordinates.
    Both are bounded by Lemma 6. The target belongs to $cal(E)$ as well.
    Indeed, $T'_k \( n \) = - e^(- k \( n - 1 \))$, and (2.9) gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ lr(|frac(T_k \( n \), Q_n)|) + lr(|frac(T'_k \( n \) - D_n T_k \( n \), Q_n)|) lt.eq
     frac(1 + \( 1 + 2.12 \) \/ k, 1.75) thin e^(- k \( n - 1 \)) . $ <eq:target-jet-bound>]
  The right side is summable, uniformly after replacing $k$ by 2.36. We will use the exact constant
  $ c_(*) := frac(1 + \( 1 + 2.12 \) \/ 2.36, 1.75) = 548 / 413 < 4 / 3 . $
  ===== 4.2 The finite block. <the-finite-block.>
  Let $D = tilde(S)_(cal(F) cal(F))$ and form the paired quadrature block
  $ cal(L)_D = mat(delim: "(", I, - D; - D, I) . $
  With $eta = .004^8$, submultiplicativity and Proposition 9 give $∥D^512∥ = ∥\( D^64 \)^8∥ < eta$.
    The finite geometric identities for the matrices $V_(+) \, V_(-)$ in (3.6) yield
  $ R_(+) = \( I - D \)^(- 1) = V_(+) \( I - D^512 \)^(- 1) \, wide R_(-) = \( I + D \)^(- 1) =
    V_(-) \( I - D^512 \)^(- 1) . $
  The remaining inverse is its norm-convergent Neumann series.
    Diagonalizing the two-list block into its sum and difference gives
  $ cal(L)_D^(- 1) = 1 / 2 mat(delim: "(", R_(+) + R_(-), R_(+) - R_(-); R_(+) - R_(-), R_(+) + R_(-)) . $
  Bounding the two output blocks in each column, and using the finite sum-norm bound, gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ ∥cal(L)_D^(- 1)∥ lt.eq ∥R_(+)∥ + ∥R_(-)∥ lt.eq frac(∥V_(+)∥ + ∥V_(-)∥, 1 - eta) < frac(36, 1 - eta) < 37 .
     $ <eq:finite-quadrature-inverse>]
  We now replace this quadrature block by the exact one. Apply Lemma 7 to orders zero and one with $y = 1$.
    For each basis input, the errors in the two transformed moments are less than $10^(- 31)$.
    In the jet projection their multipliers are bounded by $1 \/ Q_n$ and $\( 1 + \| D_n \| \) \/ Q_n$,
    both less than 2. In particular, every entry of $S_(cal(F) cal(F)) - D$, and every entry of $S_(cal(F) e) -
    tilde(S)_(cal(F) e)$, has absolute value less than $10^(- 29)$. There are 168 output coordinates.
    The paired block is off-diagonal, so its column norm has no extra factor of two. Hence
  #[#set math.equation(numbering: n => "(4.6)")
   $ ∥cal(L)_(cal(F) cal(F)) - cal(L)_D∥ < 2 dot.op 10^(- 27) . $ <eq:finite-operator-perturbation>]
  Factoring $cal(L)_(cal(F) cal(F))$ through $cal(L)_D$ and using another Neumann series gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ ∥cal(L)_(cal(F) cal(F))^(- 1)∥ < frac(37, 1 - 37 dot.op 2 dot.op 10^(- 27)) < 40 . $ <eq:finite-exact-inverse>]
  This bound is for the exact finite block, not for the full inverse.
  ===== 4.3 Solving after elimination of the finite block. <solving-after-elimination-of-the-finite-block.>
  The scalar bound (9.4) gives
  $ U_168 \( 1 \, 0 \) < 1.1 dot.op 10^(- 14) = : delta . $
  Because (2.25) is uniform in the input node locations, it bounds outputs on $cal(T)$ from either finite or
    infinite positive-node inputs. Again the two off-diagonal blocks introduce no extra factor in the combined
    $ell^1$ norm. We obtain
  #[#set math.equation(numbering: n => "(4.8)")
   $ ∥cal(L)_(cal(T) cal(F))∥ < delta \, wide ∥cal(L)_(cal(T) cal(T)) - I∥ < delta \,
     wide ∥cal(L)_(cal(F) cal(T))∥ < 4000 . $ <eq:tail-operator-blocks>]
  The last bound need not be small. We first solve the finite equation for its finite unknowns in terms of the
    tail unknowns. Substituting that solution into the tail equation leaves the Schur complement
  $ cal(Q) = cal(L)_(cal(T) cal(T)) - cal(L)_(cal(T) cal(F)) cal(L)_(cal(F) cal(F))^(- 1) cal(L)_(cal(F) cal(T)) . $
  It satisfies
  $ ∥cal(Q) - I∥ < delta \( 1 + 40 dot.op 4000 \) = 1.760011 dot.op 10^(- 9) < 1 \, $
  so its Neumann series converges. More explicitly, for any right side $psi = \( psi_(cal(F)) \, psi_(cal(T)) \)$,
    the solution is reconstructed by
  $ a_(cal(T)) & = cal(Q)^(- 1) #scale(x: 120%, y: 120%)[\(] psi_(cal(T)) -
    cal(L)_(cal(T) cal(F)) cal(L)_(cal(F) cal(F))^(- 1) psi_(cal(F)) #scale(x: 120%, y: 120%)[\)] \,\
a_(cal(F)) & = cal(L)_(cal(F) cal(F))^(- 1) #scale(x: 120%, y: 120%)[\(] psi_(cal(F)) -
  cal(L)_(cal(F) cal(T)) a_(cal(T)) #scale(x: 120%, y: 120%)[\)] . $
  Every operator in these formulas is bounded. Thus $cal(L)$ is a boundedly invertible operator on the full pair
    space $cal(E)^2$, not merely on a truncation. Applied to (4.3),
    this proves existence and uniqueness for the specified extras.
    We henceforth write $a = \( a_1 \, a_2 \)$ for this solution.
  ===== 4.4 Size of the reference lists. <size-of-the-reference-lists.>
  The same-column bounds in Proposition 9, applied to the nonnegative entries of $q \( k \)$, give
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_i ∥ell_i^(upright("ref"))∥_1 & lt.eq (2.3 + 5.6 / k) (1 + e^(- 2 k) + e^(- 3 k) + e^(- 6 k) + e^(- 8 k))\
 & lt.eq (2.3 + 5.6 / 2.36) (1 + e^(- 4.72) + e^(- 7.08) + e^(- 14.16) + e^(- 18.88)) < 4.8 . $ <eq:reference-norm>]
  The last comparison is the corresponding scalar bound in (9.4).
    The norm includes all extras, so $∥e_1∥_1 + ∥e_2∥_1 < 4.8$.
    The constant coordinates in (3.5) satisfy the sharper bound
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| C_1 \| + \| C_2 \| = lr(|- .0074 + .0115 / k|) + lr(|.0096 - .017 / k|) < .02 . $ <eq:extra-constant-bound>]
  Indeed, for $k gt.eq 2.36$, the first expression inside absolute values is negative and the second is positive;
    their absolute values are less than $.0074$ and $.0096$, respectively.
    The exact lists have the same constants because their extras are fixed.
  ===== 4.5 The three finite residual terms. <the-three-finite-residual-terms.>
  Let $a^(upright("ref"))$ be the paired positive-node part of the reference lists,
    and let $r$ be the right side of (4.3) minus $cal(L) a^(upright("ref"))$.
    Put $gamma_i = g_i q \( k \)$, with $g_i$ as in (3.6), and define
  $ Delta S_(cal(F)) = #scale(x: 120%, y: 120%)[\(] S_(cal(F) cal(F)) - D \, thin S_(cal(F) e) -
    tilde(S)_(cal(F) e) #scale(x: 120%, y: 120%)[\)] . $
  This map acts on the finite positive-node coordinates followed by the three extras;
    the reference lists are supported on these coordinates. The finite geometric identities $\( I - D \)
    V_(+) = \( I + D \) V_(-) = I - D^512$ give the exact decomposition
  #[#set math.equation(numbering: n => "(4.11)")
   $ r_(cal(F)) = binom(cal(J)_(cal(F)) T_k - Y q \( k \), 0) +
     binom(Delta S_(cal(F)) ell_2^(upright("ref")), Delta S_(cal(F)) ell_1^(upright("ref"))) +
     binom(D^512 gamma_1, D^512 gamma_2) . $ <eq:finite-residual-decomposition>]
  The three terms are the omitted target data, the quadrature error on the full reference lists,
    and the finite geometric-sum residual.
  The vector $Y q \( k \)$ reproduces the target jets at $1 \, 3 \, 4 \, 7 \,
    9$ and vanishes at the other finite nodes. Summing (4.4) over all integers from 12,
    a superset of the omitted nodes, and applying the scalar bound in (9.4), gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ frac(1 + \( 1 + 2.12 \) \/ 2.36, 1.75) sum_(n = 12)^oo e^(- 2.36 \( n - 1 \)) < 8 dot.op 10^(- 12) .
     $ <eq:omitted-target-jets>]
  For the quadrature replacement, each basis column has finite output error less than $168 dot.op 10^(- 29)$.
    Multiplication by the combined reference norm in (4.9) therefore costs less than $10^(- 24)$,
    including the extra inputs.
  For the third term, we can bound $gamma_i$ without a further matrix estimate.
    The elementary bound $e^(- 2.36) < 2 \/ 21$, proved in the local calculation preceding (9.5),
    and (4.4) give the first five target jets total norm at most
  $ c_(*) (1 + \( 2 \/ 21 \)^2 + \( 2 \/ 21 \)^3 + \( 2 \/ 21 \)^6 + \( 2 \/ 21 \)^8) < 1.35 . $
  The exact operator on the extra inputs has norm less than 4000,
    and its finite quadrature replacement differs by less than $2 dot.op 10^(- 27)$.
    Since the extras have combined norm less than 4.8,
  $ ∥gamma_1∥_1 + ∥gamma_2∥_1 < 1.35 + \( 4000 + 2 dot.op 10^(- 27) \) 4.8 < 20000 . $
  The geometric-sum residual is consequently less than $20000 eta =
    1.31072 dot.op 10^(- 15) < 1.4 dot.op 10^(- 15)$. Adding the three finite errors yields
  #[#set math.equation(numbering: n => "(4.13)")
   $ ∥r_(cal(F))∥_1 < 10^(- 11) . $ <eq:finite-reference-residual>]
  ===== 4.6 The tail residual. <the-tail-residual.>
  The positive-node reference lists vanish on $cal(T)$. Their transformed outputs there, including the extras,
    are bounded by $U_168 \( 5 \, .02 \)$, using (4.9) and (4.10).
    For the target part, $cal(T)$ is contained in the integers above 168, so (4.4) gives
  $ sum_(n in cal(T)) (lr(|frac(T_k \( n \), Q_n)|) + lr(|frac(T'_k \( n \) - D_n T_k \( n \), Q_n)|)) lt.eq
    c_(*) frac(e^(- 2.36 dot.op 168), 1 - e^(- 2.36)) < 10^(- 170) . $
  The last inequality is the local target-tail calculation (9.5).
    The scalar bound (9.4) retains the separate strict margin $U_168 \( 5 \, .02 \) < 8.3 dot.op 10^(- 14) -
    10^(- 170)$. Therefore
  #[#set math.equation(numbering: n => "(4.14)")
   $ ∥r_(cal(T))∥_1 lt.eq U_168 \( 5 \, .02 \) + 10^(- 170) < 8.3 dot.op 10^(- 14) . $ <eq:tail-reference-residual>]
  ===== 4.7 Correction size and exact jets. <correction-size-and-exact-jets.>
  Put $u_(cal(F)) = ∥\( a - a^(upright("ref")) \)_(cal(F))∥_1$ and
    $u_(cal(T)) = ∥\( a - a^(upright("ref")) \)_(cal(T))∥_1$.
    Take the finite and tail blocks of $cal(L) \( a - a^(upright("ref")) \) = r$.
    Using (4.7), (4.8), (4.13), and (4.14) gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ u_(cal(F)) & lt.eq 40 #scale(x: 120%, y: 120%)[\(] 10^(- 11) + 4000 u_(cal(T)) #scale(x: 120%, y: 120%)[\)] \,\
u_(cal(T)) & lt.eq 8.3 dot.op 10^(- 14) + 1.1 dot.op 10^(- 14) \( u_(cal(F)) + u_(cal(T)) \) . $ <eq:correction-system>]
  Substituting the first inequality into the second gives
  $ u_(cal(T)) lt.eq frac(8.3 dot.op 10^(- 14) + 4.4 dot.op 10^(- 24), 1 - 1.760011 dot.op 10^(- 9)) < 8.31 dot.op
    10^(- 14) \, wide u_(cal(F)) < 1.37 dot.op 10^(- 8) . $
  Their sum is less than $2 dot.op 10^(- 8)$. The extras did not change,
    so this is the full-list correction in (4.2). Adding (4.9) gives the combined exact norm less than 5.
  Finally, (4.3) is exactly $cal(J) H_1 = cal(J) T_k$ and $cal(J) H_2 = 0$.
    The definition of $cal(J)$ recovers both values and first derivatives at every node of $cal(N)$,
    proving (4.1). The functions $p_(ell_i)$ and $K_(p_(ell_i))$ are entire and real on the real axis by
    Section 2; $T_k$ is entire as well. The jet identities are therefore genuine double zeros.
    Lemma 5 supplies the Schwartz Fourier pair. ◻
]

== 5 Signs on every radius and parameter <sec:signs>

Fix a real $k gt.eq 2.36$, and take the exact lists $ell_1 \, ell_2$ from Proposition 10.
  Write $p_i = p_(ell_i)$, and combine the two desired inequalities into the slacks

$ F_i \( s \) = sigma_i H_i \( s \) + delta_i T_k \( s \) \, wide \( sigma_1 \, sigma_2 \) = \( - 1 \, 1 \) \,
  wide delta_i = upright(bold(1))_({ i = 1 }) . $

Thus we must prove $F_1 \, F_2 gt.eq 0$ on $\[ 0 \, oo \)$. Exact interpolation already gives

#[#set math.equation(numbering: n => "(5.1)")
 $ F_i \( m \) = F'_i \( m \) = 0 wide \( m in cal(N) \) . $ <eq:exact-slack-jets>]

The reference lists are $X_i q \( k \)$, extended by zero beyond $M = 168$.
  Throughout this section, $H_i^(upright("ref"))$ denotes the function formed from those lists with the
  #emph[exact] direct and transformed spectral integrals. Only the finite coefficient rows of Section 3 use quadrature.

The gaps in the full zero set have repeating lengths $1 \, 2 \, 1 \, 3 \, 2 \, 3$.
  The signed half-gaps centered at the nodes through 88 therefore cover exactly

$ \[ 0 \, s_0 \] \, wide s_0 = 89.5 . $

The last is the right half-gap from 88 to the midpoint 89.5 of the gap to 91.
  Every signed half-length satisfies $1 \/ 2 lt.eq \| y \| lt.eq 3 \/ 2$.
  At the origin there is only the half-gap $\[ 0 \, 1 \/ 2 \]$, with $nu = 0$; at every positive center, $nu = 2$.
  Figure 1 records the junction with the tail.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.1725, 0), (10.06, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.06, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  circle((1.15, 0), radius: 0.0635, fill: black, stroke: none)
  content((1.15, -0.1058), [#text(size: 9pt)[$87$]], anchor: "north", padding: 0.1176cm)
  circle((2.3, 0), radius: 0.0635, fill: black, stroke: none)
  content((2.3, -0.1058), [#text(size: 9pt)[$88$]], anchor: "north", padding: 0.1176cm)
  circle((5.75, 0), radius: 0.0635, fill: black, stroke: none)
  content((5.75, -0.1058), [#text(size: 9pt)[$91$]], anchor: "north", padding: 0.1176cm)
  circle((8.05, 0), radius: 0.0635, fill: black, stroke: none)
  content((8.05, -0.1058), [#text(size: 9pt)[$93$]], anchor: "north", padding: 0.1176cm)
  line((1.725, -0.05), (1.725, 0.72), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((6.9, -0.88), (6.9, 0.06), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((6.9, 0.1058), [#text(size: 9pt)[$92$]], anchor: "south", padding: 0.1176cm)
  line((4.025, -1.05), (4.025, 1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.025, 1.2), [#text(size: 9pt)[$s_0=89.5$]], anchor: "south", padding: 0.1176cm)
  line((-0.115, 0.65), (4.025, 0.65), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((1.725, 0.55), (1.725, 0.75), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((2.3, 0.55), (2.3, 0.75), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((4.025, 0.55), (4.025, 0.75), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.208, 0.72), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[finite half-gaps]]], anchor: "south", padding: 0.1176cm)
  content((2.875, 0.62), [#text(fill: rgb("#0000a6"))[#text(size: 7pt)[center 88]]], anchor: "north", padding: 0.1176cm)
  line((4.025, -0.7), (9.89, -0.7), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10))
  line((4.025, -0.8), (4.025, -0.6), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10))
  line((6.9, -0.8), (6.9, -0.6), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10))
  line((9.775, -0.8), (9.775, -0.6), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10))
  content((5.462, -0.77), [#text(fill: rgb("#cc6600"))[#text(size: 7pt)[Taylor remainder#linebreak()double zero at 91]]], anchor: "north", padding: 0.1176cm)
  content((8.337, -0.77), [#text(fill: rgb("#cc6600"))[#text(size: 7pt)[Taylor remainder#linebreak()double zero at 93]]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The finite inequalities cover the half-gaps through $s_0$. In the tail, 91 is a nearest node on $\[ 89.5 \, 92 \]$, then 93 on $\[ 92 \, 94.5 \]$, and so on. A double zero at the chosen node turns the uniform second-derivative estimate into a quadratic remainder bound. ],
) <fig:sign-junction>

=== 5.1 Quotients after subtracting values and slopes <quotients-after-subtracting-values-and-slopes>

Recall the quotient $cal(D)_(m \, 2)$ introduced before the finite polynomial rows in Section 3.
  For a twice continuously differentiable function $u$, Taylor’s formula gives

$ cal(D)_(m \, 2) u \( s \) = frac(u \( s \) - u \( m \) - \( s - m \) u' \( m \), \( s - m \)^2) =
  integral_0^1 \( 1 - v \) u'' #scale(x: 120%, y: 120%)[\(] m +
  v \( s - m \) #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) v . $

The integral also gives the removable value at $s = m$. As before, $cal(D)_(0 \, 0) u = u$ at the origin.
  On a prescribed half-gap $s = m + y x$, $0 lt.eq x lt.eq 1$, the relevant quotient is

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(D)_(m \, nu) F_i \( s \) = sigma_i cal(D)_(m \, nu) H_i \( s \) +
   delta_i cal(D)_(m \, nu) T_k \( s \) . $ <eq:deleted-slack>]

For $m > 0$, (5.1) makes this equal to $F_i \( s \) \/ \( s - m \)^2$ away from the center.
  The deletion is performed on each function before any approximation is made,
  so a nonzero constant or linear approximation error is never divided by $\( s - m \)^2$.

===== 5.1.1 Moving from the exact lists to the reference lists. <moving-from-the-exact-lists-to-the-reference-lists.>

Their combined $ell^1$ distance is less than $2 dot.op 10^(- 8)$.
  A unit list has spectral variation at most 36, direct frequency modulus at most one,
  and transformed bounds $\| lambda \| < 3$, $\| z \| < 3$.
  The transformed damping has positive exponent $pi "Im" z$,
  so there is no exponential growth at nonnegative radii. Taylor’s integral formula and the derivative estimates
  of Section 2 therefore give the following bound. Each $H_i -
  H_i^(upright("ref"))$ contains a direct error from one list and a transformed error from the other.
  The $ell^1$ norms of the two list differences add to less than $2 dot.op 10^(- 8)$,
  so the larger of the two kernel bounds controls the sum:

#[#set math.equation(numbering: n => "(5.3)")
 $ sup_(s upright(" in the half-gap")) lr(|cal(D)_(m \, nu) \( H_i - H_i^(upright("ref")) \) \( s \)|) & lt.eq
   frac(36, nu !) \( 2 dot.op 10^(- 8) \) max { pi^nu \, 3 \( 3 pi \)^nu }\
 & < .00011 . $ <eq:deleted-list-error>]

For $nu = 0$, this is the zeroth-derivative estimate. For $nu = 2$,
  the factor $1 \/ 2$ is $integral_0^1 \( 1 - v \) thin #h(-0.16667em) upright(d) v$,
  and the last comparison is the scalar bound in (9.4). No zero jet is required of the reference function;
  only the exact slack uses (5.1).

===== 5.1.2 Replacing the reference quotient by its finite polynomial. <replacing-the-reference-quotient-by-its-finite-polynomial.>

The entire Taylor series gives, in both cases $nu = 0 \, 2$,

$ sigma_i cal(D)_(m \, nu) H_i^(upright("ref")) \( m + y x \) =
  sum_(r = 0)^oo sigma_i frac(y^r, \( r + nu \) !) \( H_i^(upright("ref")) \)^(\( r + nu \)) \( m \) x^r . $

The rows $l_(i \, r)$ in (3.8) replace the included derivatives by quadrature. We claim

#[#set math.equation(numbering: n => "(5.4)")
 $ sup_(0 lt.eq x lt.eq 1)
   lr(|sigma_i cal(D)_(m \, nu) H_i^(upright("ref")) \( m + y x \) - sum_(r = 0)^40 l_(i \, r) q \( k \)
   x^r|) < .000001 . $ <eq:half-gap-polynomial-error>]

For the included coefficients, Lemma 7 controls the scaled moment of order $r + nu$.
  The row above has the additional multiplier $y^(- nu)$, whose absolute value is at most 4.
  By (4.9), the combined reference-list norm is less than $4.8 < 5$.
  Summing the 41 coefficient errors therefore gives at most $41 dot.op 4 dot.op 5 dot.op 10^(- 31)$.

For the omitted powers, put $Y = \| y \|$ and $l = 41 + nu$. Their total is at most

#[#set math.equation(numbering: n => "(5.5)")
 $
   frac(Y^(- nu) 36 dot.op 5, l ! #scale(x: 120%, y: 120%)[\(] 1 - 3 pi Y \/ \( l + 1 \)
   #scale(x: 120%, y: 120%)[\)]) (\( pi Y \)^l + 3 max_(1 lt.eq j lt.eq 6) e^(- pi "Im" z \( t_j \) m)
   #scale(x: 120%, y: 120%)[\(] pi \| z \( t_(j - 1) \) \| Y #scale(x: 120%, y: 120%)[\)]^l) .
   $ <eq:half-gap-series-tail>]

Indeed, each direct derivative contributes a factor $i pi t$,
  and each transformed derivative a factor $i pi z \( t \)$.
  On $\[ t_(j - 1) \, t_j \]$, both $"Im" z \( t \)$ and $\| z \( t \) \|$ decrease.
  Thus the right endpoint maximizes $e^(- pi "Im" z \( t \) m)$,
  while the left endpoint bounds the largest frequency modulus, including the endpoint atoms.
  For each fixed frequency, the ratio of successive terms in the absolute exponential series is at most $3 pi
  Y \/ \( l + 1 \) < 1$. Summing this geometric majorant and then integrating against total variation gives the
  displayed denominator. The factor $36 dot.op 5$ bounds the combined spectral variation of the reference inputs.

The scalar calculation in Appendix 9 replaces the maximum in (5.5) by the larger sum over all six intervals. For

$ \( m \, Y \, nu \) = \( 0 \, 1 \/ 2 \, 0 \) \, quad \( 1 \, 1 \, 2 \) \, quad \( 3 \, 1 \, 2 \) \,
  quad \( 4 \, 3 \/ 2 \, 2 \) \, $

it gives, respectively, upper bounds $1.8 dot.op 10^(- 19)$, $10^(- 11)$, $3 dot.op 10^(- 16)$,
  and $2 dot.op 10^(- 11)$, all below $10^(- 8)$. These four cases cover every half-gap.
  The origin is the first case; the largest half-lengths at 1 and 3 are one;
  and every later center is at least 4 with half-length at most $3 \/ 2$.
  For fixed $nu$, the expression decreases as $m$ increases or $Y$ decreases:
  its powers contain $Y^(l - nu) = Y^41$, and the positive geometric denominator also improves when $Y$ decreases.
  Adding the included quadrature error proves (5.4).

=== 5.2 Lower supports for every target regime <lower-supports-for-every-target-regime>

#thm([Lemma 5.1.])[
  (Exponential supports).  #emph[Let $K \, J$ be consecutive endpoints of the parameter partition in Section 3,
    and let $K lt.eq k lt.eq J$, with no upper restriction when $J = oo$.
    On every prescribed half-gap, the coefficients $a_r^(*)$ from (3.9) satisfy
$ cal(D)_(m \, nu) T_k \( m + y x \) gt.eq sum_(r = 0)^40 a_r^(*) x^r - .000001 wide \( 0 lt.eq x lt.eq 1 \) . $

]
] <lem:exponential-support>

#proof[
  At the origin, $0 lt.eq s lt.eq 1 \/ 2$, and
  $ frac(partial T_k \( s \), partial k) = T_k \( s \) (1 - s - 1 / k) > 0 $
  because $k gt.eq 2.36 > 2$. Replacing $k$ by $K$ therefore lowers the target.
    The Taylor polynomial of $T_K \( y x \)$ through degree 40 has coefficients $\( e^K \/ K \) \( - K y \)^r \/
    r !$, exactly the first case in (3.9).
  At the first positive node, write $u = s - 1$. The deleted quotient is
  $ cal(D)_(1 \, 2) T_k \( 1 + u \) = frac(e^(- k u) - 1 + k u, k u^2) \, $
  with value $k \/ 2$ at $u = 0$. For $u eq.not 0$, its derivative with respect to $k$ is
  $ frac(1 - \( 1 + k u \) e^(- k u), k^2 u^2) gt.eq 0 \, $
  by $e^(k u) gt.eq 1 + k u$. The same monotonicity holds at the removable value.
    This works for both signed half-gaps, including negative $u$.
    Replacing $k$ by $K$ again lowers the quotient, and its Taylor coefficients are
    $K \( - K y \)^r \/ \( r + 2 \) !$, the second case in (3.9).
  In both cases the left endpoint satisfies $K lt.eq 6$, even for the last, unbounded parameter interval.
    At the origin $K \| y \| lt.eq 3$, and at node 1 $K \| y \| lt.eq 6$.
    Also $e^K \/ K$ increases for $K > 1$, so its value is at most $e^6 \/ 6$.
    The absolute tails after degree 40 are bounded by
  $ e^6 / 6 frac(3^41, 41 ! \( 1 - 3 \/ 42 \)) < 8 dot.op 10^(- 29) < 10^(- 6) \, wide
    frac(6 dot.op 6^41, 43 ! \( 1 - 6 \/ 44 \)) < 10^(- 20) < 10^(- 6) \, $
  using the scalar comparisons in Appendix 9. Thus no Taylor estimate with unbounded $k$ is needed.
  At every positive node, Taylor’s integral formula also gives the general nonnegative support
  #[#set math.equation(numbering: n => "(5.6)")
   $ cal(D)_(m \, 2) T_k \( m + u \) = k integral_0^1 \( 1 - v \) e^(- k \( m - 1 + v u \)) thin #h(-0.16667em)
     upright(d) v gt.eq 0 . $ <eq:target-integral-quotient>]
  This handles all cases in which (3.9) prescribes zero. It remains to justify the stronger constant at $m =
    3$ for finite $J$. Here $- 1 lt.eq u lt.eq 1 \/ 2$, so $a = 2 + v u gt.eq 1$.
    The function $k e^(- a k)$ decreases for $k gt.eq 2.36$, and (5.6) is at least
  $ J integral_0^1 \( 1 - v \) e^(- J \( 2 + v u \)) thin #h(-0.16667em) upright(d) v . $
  The probability density $2 \( 1 - v \)$ on $\[ 0 \, 1 \]$ has mean $1 \/ 3$.
    Jensen’s inequality for the exponential therefore bounds this expression below by
  $ J / 2 e^(- J \( 2 + u \/ 3 \)) gt.eq J / 2 e^(- 13 J \/ 6) \, $
  which is the third case of (3.9). When $J = oo$, the prescribed support is zero and (5.6) applies. ◻
]

=== 5.3 The bounded radial range <the-bounded-radial-range>

#thm([Lemma 5.2.])[
  (Signs on the finite half-gaps).  #emph[For every real $k gt.eq 2.36$,
    the exact slacks satisfy $F_i \( s \) gt.eq 0$ for $0 lt.eq s lt.eq s_0$, $i = 1 \, 2$.]
] <lem:half-gap-signs>

#proof[
  Choose a half-gap and a parameter interval containing $k$. Combine the finite rows and the target support into
  $ Phi_i \( x \; k \) = sum_(r = 0)^40 #scale(x: 120%, y: 120%)[\(] l_(i \, r) q \( k \) +
    delta_i a_r^(*) #scale(x: 120%, y: 120%)[\)] x^r . $
  By the Bernstein conversion defining (3.8), the coefficient of the $d$-th degree-40 Bernstein basis function is
  $ L_(i \, d) q \( k \) + delta_i sum_(r = 0)^d omega_(d r) a_r^(*) . $
  The containing-box lower evaluation (3.7) applies to the physical vector $q \( k \)$.
    Together with Proposition 9, it makes every coefficient above strictly greater than $.001$.
    The Bernstein basis functions are nonnegative and sum to one on $\[ 0 \, 1 \]$,
    so $Phi_i \( x \; k \) > .001$ on that entire interval.
  Apply (5.3), (5.4), and Lemma 11 to (5.2). The result is the strict quotient margin
  $ cal(D)_(m \, nu) F_i \( m + y x \) > .001 - .00011 - .000001 - .000001 = .000888 > 0 . $
  At the origin this is the desired inequality. At a positive center,
    multiplication by $\( s - m \)^2$ proves the inequality away from the center,
    and (5.1) supplies equality at the center. The half-gaps cover $\[ 0 \, s_0 \]$,
    while the five parameter intervals cover every finite $k gt.eq 2.36$. ◻
]

=== 5.4 The tail and its quadratic scale <the-tail-and-its-quadratic-scale>

Beyond $s_0$, the low-node rational part of each direct cardinal function has a positive signed value.
  We will group the high-node terms, the transformed function, and the target into a single remainder.
  That sum has a small second derivative and exact double zeros; its individual terms need not have zero jets.
  The following geometric bound lets us compare the positive part and the remainder on the same squared-distance scale.

#thm([Lemma 5.3.])[
  (Quadratic barrier for the sine product).  #emph[For every real $s$,
    let $m in cal(Z)$ be any nearest point of the full periodic zero set, so $\| s - m \| =
    min_(n in cal(Z)) \| s - n \|$. Then
#[#set math.equation(numbering: n => "(5.7)")
 $ P \( s \) gt.eq .68 \( s - m \)^2 . $ <eq:P-quadratic-lower>]

]
] <lem:sine-product-barrier>

#proof[
  The set $cal(Z)$ is discrete and periodic, so a nearest point exists.
    Between a zero $m$ and either adjacent midpoint, the quotient $P \( s \) \/ \( s - m \)^2$ is positive after
    its removable value is filled in. Its logarithm is concave. For the factor vanishing at $m$, with $u = s - m$,
  $ frac(#h(-0.16667em) upright(d)^2, #h(-0.16667em) upright(d) u^2) log (frac(sin^2 \( pi u \/ 12 \), u^2)) = 2 /
    u^2 - 2 (pi / 12)^2 csc^2 (frac(pi u, 12)) lt.eq 0 $
  for $u eq.not 0$, by $\| sin x \| lt.eq \| x \|$, and the inequality extends through the removable value.
    Every other sine factor has nonpositive logarithmic second derivative on this half-gap.
    A concave function is bounded below by the smaller of its endpoint values,
    so the quotient is bounded below by its smaller value at the center and the midpoint.
  At the center, the periodicity of $P$ reduces the removable value to the corresponding node value $Q_n >
    1.75$ in (2.9). At the midpoints, the exact values are
  $ upright("gap modulo ") 12 & P \( s \) \/ \( s - m \)^2 upright(" at its midpoint")\
\[ 0 \, 1 \] \, med \[ 3 \, 4 \] & 12 - 8 sqrt(2)\
\[ 1 \, 3 \] & 1\
\[ 4 \, 7 \] \, med \[ 9 \, 12 \] & 8 / 9 \( 3 + sqrt(2) + sqrt(3) + sqrt(6) \)\
\[ 7 \, 9 \] & 9 $
  Here the denominator is the square of the half-gap length, independent of which endpoint is chosen at a tie.
    For clarity, the smallest entry can be derived directly. At $s = 1 \/ 2$, put $theta =
    pi \/ 24$ and pair the unsquared factors for residues $\( 1 \, 7 \)$, $\( 3 \, 9 \)$, and $\( 0 \, 4 \)$.
    Product-to-sum gives
  $ \( 2 sin \( - theta \) \) \( 2 sin \( - 13 theta \) \) & = 2 sin \( pi \/ 12 \) \,\
\( 2 sin \( - 5 theta \) \) \( 2 sin \( - 17 theta \) \) & = 2 sin \( 5 pi \/ 12 \) \,\
\( 2 sin theta \) \( 2 sin \( - 7 theta \) \) & = 1 - sqrt(2) . $
  The product of the first two right sides is one. Thus $P \( 1 \/ 2 \) \/ \( 1 \/ 2 \)^2 =
    4 \( 1 - sqrt(2) \)^2 = 12 - 8 sqrt(2)$. The same product-to-sum calculation at the other midpoints gives the
    remaining entries. The identity $P \( 4 - s \) = P \( s \)$,
    which follows from invariance of $L$ under $a mapsto 4 - a$ modulo 12,
    accounts for the paired gap types in the table. The smallest entry satisfies $12 - 8 sqrt(2) > .6862 > .68$,
    as recorded in Appendix 9; every other entry is larger than $.68$ as well.
    The half-gaps cover the real line, proving the claim, including the zero values themselves. ◻
]

#thm([Lemma 5.4.])[
  (Signs in the tail).  #emph[For every real $k gt.eq 2.36$, the exact slacks satisfy $F_i \( s \) gt.eq
    0$ for $s gt.eq s_0$, $i = 1 \, 2$.]
] <lem:tail-signs>

#proof[
  We first bound the low-node rational contribution, then compare the remaining term on the same quadratic scale.
  ===== 5.4.1 The low-node rational part. <the-low-node-rational-part.>
  Separate each direct cardinal function as
  $ R_(i \, 0) \( s \) & = C_i + sum_(n in cal(N)_0\
n lt.eq 88) (frac(c_(i n), \( s - n \)^2) + frac(d_(i n), s - n)) \,\
p_i \( s \) & = P \( s \) R_(i \, 0) \( s \) + p_(i \, upright("high")) \( s \) . $
  The high function contains precisely the node columns beginning at 91 and no constant column.
    Every denominator in $R_(i \, 0)$ is positive for $s gt.eq s_0$. We claim
  #[#set math.equation(numbering: n => "(5.8)")
   $ sigma_i R_(i \, 0) \( s \) > .002 wide \( s gt.eq s_0 \) . $ <eq:tail-rational-positive>]
  For the reference lists, use the decomposition preceding (3.12),
    which groups the simple-pole rows into their common $1 \/ s$ numerator before taking negative parts.
    In the parameter box containing $k$, each numerator row $l$ has the nonpositive lower bound
    $eta_(K \, J) \( l \) = min \( 0 \, \[ l \]_(K \, J) \)$.
    The reciprocal factors are nonnegative and nonincreasing for $s gt.eq s_0$,
    so their products with these lower bounds give a value at least as large as at $s_0$;
    the constant row retains its full lower bound $\[ C_i^(*) \]_(K \, J)$.
    Thus (3.12) gives $sigma_i R_(i \, 0)^(upright("ref")) \( s \) > .0021$.
  The passage to the exact list changes this rational function by less than $2 dot.op 10^(- 8)$.
    Indeed, $s - n gt.eq 1.5$ for every low node, so both reciprocal coefficient factors have modulus at most one,
    as does the constant factor; apply the full-list correction in (4.2).
    Since $.0021 - 2 dot.op 10^(- 8) > .002$, this proves (5.8).
  ===== 5.4.2 The high-node list and the remainder. <the-high-node-list-and-the-remainder.>
  For the exact pair define the coupled input sizes
  $ w = sum_(i = 1)^2 sum_(n in cal(N)_0) \( \| c_(i n) \| + \| d_(i n) \| \) \, wide c = sum_(i = 1)^2 \| C_i \| . $
  The full-list norm and the fixed extras give $w + c < 5$ and $c < .02$, by (4.2) and (4.10).
    At every node $n gt.eq 91$, the exact equations (4.3) read
  $ \( c_(1 n) \, d_(1 n) \) = \( S ell_2 \)_n + \( cal(J) T_k \)_n \,
    wide \( c_(2 n) \, d_(2 n) \) = \( S ell_1 \)_n . $
  Here $S ell_i = - cal(J) K_(p_i)$ includes all input coordinates, including the extras.
    Applying Lemma 6 to both lists with their summed input bounds $w \, c$,
    the combined high-node norm is at most $U_91 \( w \, c \)$ plus the target geometric majorant
  $ frac(1 + \( 1 + 2.12 \) \/ 2.36, 1.75) frac(e^(- 2.36 dot.op 90), 1 - e^(- 2.36)) < 10^(- 89) . $
  This follows from (4.4) by overcounting with all integers from 91;
    the last comparison is the local calculation (9.6). The finer scalar bound in (9.4) is $U_91 \( 5 \, .02 \) <
    2.2711 dot.op 10^(- 7)$. Since $U_91$ is increasing in both input bounds, we obtain
  $ sum_(i = 1)^2 sum_(n in cal(N)\
n gt.eq 91) \( \| c_(i n) \| + \| d_(i n) \| \) < 2.2711 dot.op 10^(- 7) + 10^(- 89) < 2.4 dot.op 10^(- 7) . $
  The difference between $2.2711 dot.op 10^(- 7)$ and $2.4 dot.op 10^(- 7)$ leaves room for this target contribution.
  Define
  $ Z_i \( s \) = sigma_i #scale(x: 120%, y: 120%)[\(] p_(i \, upright("high")) \( s \) +
    K_(p_(3 - i)) \( s \) #scale(x: 120%, y: 120%)[\)] + delta_i T_k \( s \) . $
  Then
  #[#set math.equation(numbering: n => "(5.9)")
   $ F_i \( s \) = sigma_i P \( s \) R_(i \, 0) \( s \) + Z_i \( s \) . $ <eq:tail-decomposition>]
  We have the uniform bound
  #[#set math.equation(numbering: n => "(5.10)")
   $ sup_(s gt.eq s_0) \| Z''_i \( s \) \| < .0002 . $ <eq:tail-second-derivative>]
  To verify it, the direct high columns contribute at most $36 pi^2 \( 2.4 dot.op 10^(- 7) \)$.
    For the low-frequency transformed term, the actual coupled full-list norm gives the important estimate
  $ 25 c + 36 w lt.eq 36 \( c + w \) < 180 . $
  Thus the $\[ 0 \, 5 \/ 6 \]$ variation in (2.28), which includes the atom at $5 \/ 6$,
    is bounded by $36 dot.op 5$. On $\( 5 \/ 6 \, 1 \]$, we may separately use $w < 5$ and $c < .02$;
    the only atom there is at 1 and contributes $2 c < .04$. Finally, $T''_k \( s \) = k e^(- k \( s - 1 \))$.
    Its supremum over $s gt.eq s_0$, $k gt.eq 2.36$, occurs at $s = s_0$, $k = 2.36$, since $s_0 - 1 > 1 \/ 2.36$.
    The resulting four-term bound is
  $ & 36 pi^2 \( 2.4 dot.op 10^(- 7) \) + 3 \( 3 pi \)^2 thin 36 dot.op 5 thin e^(- .70 s_0)\
 & quad + 1.25 \( 1.32 pi \)^2 (frac(2.54 dot.op 5, s_0) + .04) e^(- .187 s_0) +
   2.36 e^(- 2.36 \( s_0 - 1 \)) < 8.5485 dot.op 10^(- 5) < .0002 \, $
  by the scalar comparison in Appendix 9. This proves (5.10).
  At every node $m in cal(N)$ with $m gt.eq 91$, $R_(i \, 0)$ is regular and $P$ has a double zero.
    Subtracting its product from the exact slack jets in (5.9) therefore gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ Z_i \( m \) = Z'_i \( m \) = 0 wide \( m in cal(N) \, med m gt.eq 91 \) . $ <eq:tail-remainder-jets>]
  These zeros use the exact interpolation equations, not merely the small norm of the high list.
  ===== 5.4.3 Comparison at a nearest zero. <comparison-at-a-nearest-zero.>
  For $s gt.eq s_0$, choose a nearest point $m in cal(Z)$ with $m gt.eq 91$.
    Such a choice is possible throughout the tail; at $s = s_0$, choose 91 from the tied points 88 and 91.
    The segment joining $s$ and $m$ stays in $\[ s_0 \, oo \)$.
    Taylor’s integral formula, using (5.10) and (5.11), gives
  $ \| Z_i \( s \) \| lt.eq .0001 \( s - m \)^2 . $
  On the other hand, (5.8) and Lemma 13 imply
  $ sigma_i P \( s \) R_(i \, 0) \( s \) gt.eq .68 dot.op .002 \( s - m \)^2 . $
  Since $.68 dot.op .002 > .0001$, (5.9) gives $F_i \( s \) gt.eq 0$.
    At a node the exact zero value gives the same conclusion, without division by a vanishing factor. ◻
]

#proof[
  For every real $k gt.eq 2.36$, Proposition 10 supplies real summable lists with the prescribed extras.
    Section 2 makes $H_1 \, H_2$ entire and real on the real axis,
    and Lemma 5 gives the real radial Schwartz Fourier pair
  $ f \( x \) = e^(- pi h b \| x \|^2) H_1 \( b \| x \|^2 \) \, wide hat(f) \( xi \) =
    e^(- pi h b \| xi \|^2) H_2 \( b \| xi \|^2 \) . $
  Lemmas 12 and 14 cover all $s gt.eq 0$, so $H_1 \( s \) lt.eq T_k \( s \)$ and $H_2 \( s \) gt.eq 0$.
    The exact jets are
  $ H_1 \( n \) = T_k \( n \) \, wide H'_1 \( n \) = T'_k \( n \) \, wide H_2 \( n \) = H'_2 \( n \) =
    0 wide \( n in cal(N) \) . $
  This proves the theorem. ◻
]

== 6 From Gaussian pairs to energy comparisons <sec:energy>

The preceding sections construct the Fourier pair in Theorem 2.
  We now turn that pair into a sharp energy bound for every Gaussian. Two steps are needed.
  First, Fourier nonnegativity gives a lower bound for any locally finite configuration with the stated centered
  density. Second, scaling and Fourier complementation turn the normalized pair into a minorant for every positive
  Gaussian parameter. Section 7 then completes the universal-energy theorem by positive mixtures.
  The renormalized and jellium consequences are treated separately in Section 8.

=== 6.1 An area comparison under centered density <an-area-comparison-under-centered-density>

Recall that $B_R$ is the centered closed disk, $cal(C)_R = cal(C) ∩ B_R$, and $N_R = \# cal(C)_R$.
  The only geometric limit used below is $N_R \/ \( pi R^2 \) arrow.r 1$.
  The density-only linear-programming argument is due to Cohn and
  de Courcy-Ireland #cite(label("CohnDeCourcyIreland2018")) Proposition 2.2,
  whose background-measure comparison follows Cohn and Zhao #cite(label("CohnZhao2014")) Theorem 3.3.
  The latter is a packing theorem; its exclusion-distance hypothesis is not an assumption here.
  We give the argument for the exact auxiliary class used in this paper.

#thm([Proposition 6.1.])[
  (Linear programming with centered disk density).  #emph[Let $f$ be a real even Schwartz function on $bb(R)^2$
    whose Fourier transform is nonnegative. Every locally finite configuration $cal(C) subset
    bb(R)^2$ with centered disk density one satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) f \( x - y \) gt.eq hat(f) \( 0 \) - f \( 0 \) . $ <eq:density-lp>]

 The same lower bound holds if $f \( x - y \)$ is replaced by $Phi \( x - y \)$, where $Phi :
   bb(R)^2 \\ { 0 } arrow.r \[ 0 \, oo \)$ satisfies $Phi \( z \) gt.eq f \( z \)$.]
] <prop:density-lp>

#proof[
  For finite real signed measures $mu \, nu$ on $bb(R)^2$, define
  $ Q \( mu \, nu \) = integral.double f \( x - y \) thin #h(-0.16667em) upright(d) mu \( x \) thin #h(-0.16667em)
    upright(d) nu \( y \) \, wide hat(mu) \( xi \) = integral e^(- 2 pi i x dot.op xi) thin #h(-0.16667em)
    upright(d) mu \( x \) . $
  Fourier inversion and Fubini’s theorem give
  $ Q \( mu \, nu \) = integral_(bb(R)^2) hat(f) \( xi \) overline(hat(mu) \( xi \)) hat(nu) \( xi \) thin
    #h(-0.16667em) upright(d) xi . $
  Indeed, $hat(f)$ is integrable and the transforms of finite measures are bounded.
    Since $hat(f) gt.eq 0$, this is a positive-semidefinite form and therefore satisfies Cauchy–Schwarz.
  Put $a = hat(f) \( 0 \) = integral f gt.eq 0$ and $mu_R = sum_(x in cal(C)_R) delta_x$.
    If $a = 0$, positivity gives $Q \( mu_R \, mu_R \) \/ N_R gt.eq a$ whenever $N_R > 0$.
    Suppose now that $a > 0$. Fix $epsilon > 0$ and let
  $ nu_R = 1_(B_(\( 1 + epsilon \) R)) thin #h(-0.16667em) upright(d) x \, wide V_R = pi \( 1 + epsilon \)^2 R^2 . $
  For every $x in B_R$, the disk $B_(\( 1 + epsilon \) R) - x$ contains $B_(epsilon R)$. Thus
  #[#set math.equation(numbering: n => "(6.2)")
   $ \| Q \( mu_R \, nu_R \) - N_R a #scale(x: 120%, y: 120%)[\|] lt.eq
     N_R integral_(\| z \| gt.eq epsilon R) \| f \( z \) \| thin #h(-0.16667em) upright(d) z =
     o \( N_R \) . $ <eq:uniform-cross-term>]
  The estimate is uniform in the locations of all points of $cal(C)_R$;
    it does not use a bound on their number in any smaller disk.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 2.457, fill: rgb("#f5f5f5"), stroke: none)
  circle((0, 0), radius: 1.638, fill: rgb("#e6e6e6"), stroke: none)
  circle((1.229, 0.5005), radius: 0.819, fill: rgb("#ffffff"), stroke: none)
  circle((0, 0), radius: 2.457, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 1.638, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.229, 0.5005), radius: 0.819, stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((-0.8645, 0.3185), radius: 0.03185, fill: black, stroke: none)
  circle((-0.7735, 0.364), radius: 0.03185, fill: black, stroke: none)
  circle((-0.6825, 0.3367), radius: 0.03185, fill: black, stroke: none)
  circle((-0.455, -1.001), radius: 0.03185, fill: black, stroke: none)
  circle((0.1365, 0.8645), radius: 0.03185, fill: black, stroke: none)
  circle((0.4095, -0.546), radius: 0.03185, fill: black, stroke: none)
  circle((0.455, -0.6188), radius: 0.03185, fill: black, stroke: none)
  circle((0.5915, -0.5733), radius: 0.03185, fill: black, stroke: none)
  circle((-0.182, 0.091), radius: 0.03185, fill: black, stroke: none)
  circle((0, 0), radius: 0.03185, fill: black, stroke: none)
  content((0, 0), [$0$], anchor: "north-east", padding: 0.1176cm)
  circle((1.229, 0.5005), radius: 0.04095, fill: black, stroke: none)
  content((1.229, 0.5005), [$x$], anchor: "north-east", padding: 0.1176cm)
  line((0, 0), (-1.42, -0.819), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((-0.7098, -0.4095), [$R$], anchor: "south-east", padding: 0.1176cm)
  line((1.229, 0.5005), (2.047, 0.5005), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((1.638, 0.5005), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$epsilon R$]])], anchor: "south")
  content((0, 2.766), [$B_((1+ epsilon )R)$])
  content((-0.9555, 1.684), [$B_R$])
  content((2.866, 0.3185), [$x in B_R$$arrow.r.double.long$#linebreak() $B_( epsilon R)(x) subset B_((1+ epsilon )R)$.], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: The comparison disk contains a disk of radius $epsilon R$ around every $x in cal(C)_R$. This containment gives the uniform tail error in (6.2), including for clustered points. ],
  ) <fig:larger-disk>
  The area self-term has the limit
  $ frac(Q \( nu_R \, nu_R \), V_R) = integral_(bb(R)^2) f \( z \)
    frac(\| B_(\( 1 + epsilon \) R) ∩ \( B_(\( 1 + epsilon \) R) - z \) \|, V_R) thin #h(-0.16667em) upright(d) z
    arrow.r a . $
  For each fixed $z$, the overlap fraction tends to one and is between zero and one.
    Dominated convergence therefore applies with dominator $\| f \|$.
    In particular, $Q \( nu_R \, nu_R \) > 0$ for all sufficiently large $R$. Cauchy–Schwarz and (6.2) now yield
  $ frac(Q \( mu_R \, mu_R \), N_R) gt.eq frac(\| Q \( mu_R \, nu_R \) \|^2, N_R Q \( nu_R \, nu_R \)) = N_R /
    V_R frac(\( a + o \( 1 \) \)^2, a + o \( 1 \)) . $
  Since $N_R \/ V_R arrow.r \( 1 + epsilon \)^(- 2)$, taking the lower limit in $R$ and then letting $epsilon
    arrow.b 0$ proves
  $ liminf_(R arrow.r oo) frac(Q \( mu_R \, mu_R \), N_R) gt.eq a . $
  There are exactly $N_R$ diagonal terms, each equal to $f \( 0 \)$, so removing them proves (6.1).
    The assertion for $Phi$ follows by termwise comparison of each finite off-diagonal sum. ◻
]

=== 6.2 Sharp pairs for every Gaussian parameter <sharp-pairs-for-every-gaussian-parameter>

The normalized theorem directly covers $alpha gt.eq 1$. Fourier complementation supplies $0 < alpha < 1$.
  This is the Gaussian form of the duality in Cohn and Miller #cite(label("CohnMiller2016")) Section 6;
  we give the calculation to fix the dimension-two factor and the two contact sets.

#thm([Lemma 6.2.])[
  (Gaussian duality).  #emph[For every $alpha > 0$, let $G_alpha \( x \) = e^(- pi alpha \| x \|^2)$.
    There is a real radial Schwartz function $f_alpha$ such that, pointwise,
#[#set math.equation(numbering: n => "(6.3)")
 $ f_alpha lt.eq G_alpha \, wide hat(f)_alpha gt.eq 0 \,\
f_alpha \( a \) = G_alpha \( a \) quad \( a in A \\ { 0 } \) \, wide hat(f)_alpha \( w \) =
  0 quad \( w in A^(*) \\ { 0 } \) . $ <eq:gaussian-sharp-pair>]

]
] <lem:gaussian-duality>

#proof[
  For $alpha gt.eq 1$, take
  $ k = pi \( alpha \/ b - h \) gt.eq pi \( 2 \/ sqrt(3) - 2 \/ 5 \) > 2.36 . $
  The elementary comparison is proved in Appendix 9. Let $f$ be the function supplied by Theorem 2 for this $k$,
    and define $f_alpha = k e^(- k) f$. The multiplier is positive, so $hat(f)_alpha gt.eq 0$.
    With $s = b \| x \|^2$, the upper bound for $f_alpha$ becomes
  $ k e^(- k) e^(- pi h s) T_k \( s \) = e^(- \( pi h + k \) s) = e^(- pi alpha \| x \|^2) . $
  The shell containment and $A^(*) = J A$ from Section 2 place every nonzero direct and dual shell in $cal(N)$.
    The value contacts in (2.4) therefore give (6.3).
  For $0 < alpha < 1$, put $beta = 1 \/ alpha$ and use the function already constructed for $beta > 1$.
    Define its nonnegative radial Schwartz slacks
  $ q_beta = G_beta - f_beta \, wide r_beta = hat(f)_beta . $
  The Fourier transform applied twice is reflection, which is immaterial for these radial functions.
    Thus $G_beta = q_beta + hat(r)_beta$. The dimension-two Gaussian transform from (2.20) gives
  $ beta^(- 1) G_alpha = hat(G)_beta = hat(q)_beta + r_beta . $
  Set
  #[#set math.equation(numbering: n => "(6.4)")
   $ f_alpha = beta hat(q)_beta . $ <eq:reciprocal-minorant>]
  Then $G_alpha - f_alpha = beta r_beta gt.eq 0$ and $hat(f)_alpha = beta q_beta gt.eq 0$.
    The known contacts say that $q_beta$ vanishes on $A \\ { 0 }$ and $r_beta$ vanishes on $A^(*) \\ { 0 }$.
    Since $A^(*)$ is a rotation of $A$ and both functions are radial,
    $q_beta$ also vanishes on the nonzero dual shells and $r_beta$ on the nonzero direct shells.
    The two displayed slack identities give the required contacts for $f_alpha$. ◻
]

It remains to identify the lower bound with the Gaussian lattice sum.
  Periodize the fixed Schwartz function $f_alpha$ over $A$.
  Schwartz decay makes the periodization smooth, and termwise integration over a unit-area fundamental cell gives
  Fourier coefficients $hat(f)_alpha \( w \)$ for $w in A^(*)$. These coefficients are absolutely summable.
  Evaluating the Fourier series at zero gives $sum_(a in A) f_alpha \( a \) =
  sum_(w in A^(*)) hat(f)_alpha \( w \)$. Using (6.3) and removing the origin yields

#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(a in A \\ { 0 }) G_alpha \( a \) = hat(f)_alpha \( 0 \) - f_alpha \( 0 \) . $ <eq:gaussian-lattice-value>]

Only the lattice has been periodized; no periodicity is assumed of the competitor.
  Proposition 15 with $Phi = G_alpha$ therefore proves, for every locally finite $cal(C)$ of centered disk density
  one and every $alpha > 0$,

#[#set math.equation(numbering: n => "(6.6)")
 $ liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) e^(- pi alpha \| x - y \|^2) gt.eq sum_(a in A \\ { 0 }) e^(- pi alpha \| a \|^2) . $ <eq:gaussian-energy>]

This scalar inequality is the input for the positive-mixture argument in the next section.
  No measurable choice of the functions $f_alpha$ will be needed there.

== 7 Shifted moments and positive mixtures <sec:mixtures>

Equation (6.6) compares the configuration with the triangular lattice for every kernel $e^(- pi alpha t)$.
  To pass to a completely monotone interaction, we represent it by positive mixtures of these kernels.
  A potential may be singular at zero, so a finite representing measure need not be available for the unshifted
  function. We instead construct one for each positive shift and remove the shift only after taking the lattice sum.

=== 7.1 A finite moment representation <a-finite-moment-representation>

The representation belongs to the classical Hausdorff–Bernstein–Widder theory #cite(label("Hausdorff1921"))
  #cite(label("Bernstein1929")) #cite(label("Widder1931")).
  We prove precisely the finite-measure form needed here. The construction first solves a discrete moment problem
  using finite differences, then passes to all positive real exponents.
  It also identifies the endpoint masses that enter the energy argument.

#thm([Lemma 7.1.])[
  (Positive mixtures).  #emph[Let $F : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ be smooth,
    with one-sided derivatives at zero, and suppose $\( - 1 \)^j F^(\( j \)) \( t \) gt.eq
    0$ for every integer $j gt.eq 0$ and every $t gt.eq 0$. There is a finite positive Borel measure $rho$ on
    $\[ 0 \, 1 \]$ of total mass $F \( 0 \)$ such that
#[#set math.equation(numbering: n => "(7.1)")
 $ F \( t \) = integral_(\[ 0 \, 1 \]) v^t thin #h(-0.16667em) upright(d) rho \( v \) wide \( t > 0 \) .
   $ <eq:positive-mixture>]

 Moreover, $rho \( { 0 } \) = 0$. An atom at $1$ is allowed and contributes a constant function.]
] <lem:positive-mixture>

#proof[
  #emph[Compactness of the measures.] We first record an elementary compactness argument that preserves the
    limiting total mass without discarding possible endpoint atoms.
    Let $\( mu_n \)$ be any sequence of positive measures on $\[ 0 \, 1 \]$ with uniformly bounded masses.
    By a diagonal subsequence, arrange that the masses converge to $m$ and that $mu_n \( \[ 0 \, q \] \)$
    converges to $a \( q \)$ for every rational $q in \( 0 \, 1 \)$. For $0 lt.eq x < 1$, set
  $ H \( x \) = inf_(x < q < 1\
q upright(" rational")) a \( q \) \, wide H \( 1 \) = m . $
  The function $H$ is nondecreasing and right-continuous. Its associated positive Borel measure $mu$ has
    distribution $mu \( \[ 0 \, x \] \) = H \( x \)$, including mass $H \( 0 \)$ at zero and mass $m -
    H \( 1 - \)$ at one. At every continuity point $x in \( 0 \, 1 \)$ of $H$,
    rational points on either side of $x$ bracket $mu_n \( \[ 0 \, x \] \)$ and give convergence to $H \( x \)$.
    Step-function approximations on partitions with such internal endpoints,
    together with convergence of the total masses and uniform continuity, then give
  $ integral phi thin #h(-0.16667em) upright(d) mu_n arrow.r integral phi thin #h(-0.16667em) upright(d) mu quad
    upright("for every continuous ") phi : \[ 0 \, 1 \] arrow.r bb(R) . $
  Thus the subsequence converges weakly. The endpoint atoms have not been discarded in this construction.
  #emph[Discrete moments.] Fix $d > 0$ and put $m_j = F \( j d \)$ for integers $j gt.eq 0$.
    Writing $Delta m_j = m_(j + 1) - m_j$, repeated integration gives, for $r gt.eq 1$,
  $ \( - 1 \)^r Delta^r m_j = integral_(\[ 0 \, d \]^r) \( - 1 \)^r F^(\( r \)) \( j d + u_1 + dots.h.c + u_r \)
    thin #h(-0.16667em) upright(d) u_1 dots.h.c #h(-0.16667em) upright(d) u_r gt.eq 0 . $
  Define a linear functional on polynomials by $Lambda \( x^j \) = m_j$.
    For every integer $M gt.eq 1$, place at $p \/ M$, $0 lt.eq p lt.eq M$, the mass
  $ w_(M \, p) = Lambda #h(-0.16667em) (binom(M, p) x^p \( 1 - x \)^(M - p)) =
    binom(M, p) \( - 1 \)^(M - p) Delta^(M - p) m_p gt.eq 0 . $
  Let $mu_(M \, d) = sum_(p = 0)^M w_(M \, p) delta_(p \/ M)$.
    Its total mass is $m_0$, because the Bernstein basis sums to one.
    For fixed $0 lt.eq j lt.eq M$, the identity $binom(M, p) binom(p, j) = binom(M, j) binom(M - j, p - j)$ gives
  $ sum_(p = 0)^M binom(p, j) / binom(M, j) binom(M, p) x^p \( 1 - x \)^(M - p) = x^j . $
  Applying $Lambda$ shows that $sum_p w_(M \, p) binom(p, j) \/ binom(M, j) = m_j$.
    For fixed $j$ and $M gt.eq max { 1 \, j }$, put
  $ P_(M \, j) \( x \) = product_(r = 0)^(j - 1) frac(M x - r, M - r) . $
  These polynomials converge uniformly to $x^j$ on $\[ 0 \, 1 \]$ as $M arrow.r oo$:
    each of their finitely many factors converges uniformly to $x$.
    At $x = p \/ M$ their values are exactly $binom(p, j) \/ binom(M, j)$,
    so the identity above says $integral P_(M \, j) thin #h(-0.16667em) upright(d) mu_(M \, d) = m_j$.
    Since $mu_(M \, d)$ is positive with mass $m_0$,
  $ lr(|integral x^j thin #h(-0.16667em) upright(d) mu_(M \, d) - m_j|) lt.eq m_0 parallel x^j -
    P_(M \, j) parallel_oo arrow.r 0 . $
  The compactness argument supplies one weakly convergent subsequence of $\( mu_(M \, d) \)_(M gt.eq 1)$.
    Since the moment convergence holds for every fixed $j$ along the full sequence,
    its limit $eta_d$ satisfies all the moment identities
  $ F \( j d \) = integral_(\[ 0 \, 1 \]) x^j thin #h(-0.16667em) upright(d) eta_d \( x \)
    wide \( j = 0 \, 1 \, 2 \, dots.h \) . $
  In particular, $eta_d$ has mass $F \( 0 \)$.
  #emph[Positive real exponents.] For each positive integer $l$,
    push $eta_(1 \/ l)$ forward by $x mapsto x^l$ and call the resulting measure $rho_l$. It has mass $F \( 0 \)$ and
  $ integral_(\[ 0 \, 1 \]) v^(j \/ l) thin #h(-0.16667em) upright(d) rho_l \( v \) =
    F \( j \/ l \) wide \( j = 1 \, 2 \, dots.h \) . $
  Choose one weakly convergent subsequence $rho_(l_n) arrow.r rho$; necessarily $l_n arrow.r oo$,
    and the limit still has mass $F \( 0 \)$. Now fix any $t > 0$ and set $t_n = ceil.l l_n t ceil.r \/ l_n$.
    Since $0 lt.eq t_n - t < 1 \/ l_n$ and $sup_(0 < v lt.eq 1) v^t \| log v \| = 1 \/ \( e t \)$,
    the mean value theorem in the exponent gives the following bound; at $v =
    0$ both powers are zero because their exponents are positive:
  $ sup_(0 lt.eq v lt.eq 1) \| v^(t_n) - v^t \| lt.eq frac(t_n - t, e t) arrow.r 0 . $
  Continuity of $F$ and weak convergence against the continuous function $v^t$ now imply
  $ F \( t \) = lim_n F \( t_n \) = lim_n integral v^(t_n) thin #h(-0.16667em) upright(d) rho_(l_n) =
    integral v^t thin #h(-0.16667em) upright(d) rho . $
  The subsequence was chosen before $t$, so the same $rho$ works for every $t > 0$.
    Finally, as $t arrow.b 0$, the functions $v^t$ increase to $1_(\( 0 \, 1 \]) \( v \)$.
    Monotone convergence and continuity of $F$ at zero give $rho \( \( 0 \, 1 \] \) = F \( 0 \) =
    rho \( \[ 0 \, 1 \] \)$, proving $rho \( { 0 } \) = 0$. ◻
]

=== 7.2 Lower limits and singular interactions <lower-limits-and-singular-interactions>

The next proposition isolates the positive-mixture step. Its Gaussian hypothesis has already been proved for every
  configuration considered here in (6.6).

#thm([Proposition 7.2.])[
  (Positive-mixture transfer).  #emph[Let $cal(C) subset bb(R)^2$ be locally finite with centered disk density
    one. Suppose that, for every $alpha > 0$,
$ liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) e^(- pi alpha \| x - y \|^2) gt.eq sum_(a in A \\ { 0 }) e^(- pi alpha \| a \|^2) . $

 Then every smooth completely monotone $g : \( 0 \, oo \) arrow.r \[ 0 \, oo \)$ satisfies
#[#set math.equation(numbering: n => "(7.2)")
 $ E_g \( cal(C) \) gt.eq sum_(a in A \\ { 0 }) g \( \| a \|^2 \) $ <eq:full-energy-bound>]

 in the extended nonnegative reals, with the ordered-pair energy defined in (1.1).]
] <prop:energy-reduction>

#proof[
  Fix $epsilon > 0$ and set $F_epsilon \( t \) = g \( epsilon + t \)$ for $t gt.eq 0$.
    It satisfies Lemma 17, with a finite representing measure $rho_epsilon$ of mass $g \( epsilon \)$.
    Choose any real sequence $R_n arrow.r oo$, discarding finitely many terms so that $N_(R_n) > 0$, and define
  $ A_n \( v \) = 1 / N_(R_n) sum_(x \, y in cal(C)_(R_n)\
x eq.not y) v^(\| x - y \|^2) wide \( 0 lt.eq v lt.eq 1 \) . $
  Every exponent is positive, so $A_n$ is continuous and nonnegative on $\[ 0 \, 1 \]$, with $0^t =
    0$ for $t > 0$. Define the nonnegative extended-valued function
  $ L \( v \) = sum_(a in A \\ { 0 }) v^(\| a \|^2) wide \( 0 lt.eq v lt.eq 1 \) . $
  For $0 < v < 1$, the Gaussian hypothesis with $alpha = - log \( v \) \/ pi$ gives
  $ liminf_n A_n \( v \) gt.eq L \( v \) . $
  A full-radius lower-limit inequality holds along every sequence tending to infinity.
    The same comparison holds at the endpoints: $A_n \( 0 \) = L \( 0 \) = 0$, while $A_n \( 1 \) = N_(R_n) -
    1 arrow.r oo = L \( 1 \)$.
  The finite-sum representation, Fatou’s lemma, and Tonelli’s theorem now give
  $ & liminf_n 1 / N_(R_n) sum_(x \, y in cal(C)_(R_n)\
x eq.not y) F_epsilon \( \| x - y \|^2 \)\
 & wide = liminf_n integral A_n \( v \) thin #h(-0.16667em) upright(d) rho_epsilon \( v \)\
 & wide gt.eq integral liminf_n A_n \( v \) thin #h(-0.16667em) upright(d) rho_epsilon \( v \) gt.eq
   integral L \( v \) thin #h(-0.16667em) upright(d) rho_epsilon \( v \)\
 & wide = sum_(a in A \\ { 0 }) F_epsilon \( \| a \|^2 \) . $
  Every integrand and summand is nonnegative, so these steps remain valid when the last sum is infinite.
    Since the sequence $R_n$ was arbitrary, this is the full-radius lower bound for $F_epsilon$.
  Complete monotonicity gives $g' lt.eq 0$, hence $g \( t \) gt.eq F_epsilon \( t \)$ for $t > 0$.
    Termwise comparison therefore yields
  $ E_g \( cal(C) \) gt.eq sum_(a in A \\ { 0 }) g \( epsilon + \| a \|^2 \) wide \( epsilon > 0 \) . $
  As $epsilon arrow.b 0$, the summands increase to $g \( \| a \|^2 \)$.
    Monotone convergence in the lattice sum proves (7.2). No limit in $epsilon$ has been interchanged with the
    configuration lower limit, and no unshifted representing measure has been used. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Equation (6.6) verifies the proposition’s hypothesis for every
    locally finite configuration of centered disk density one. This proves the inequality in Theorem 1.
    We finish by checking attainment, including the case of an infinite lattice sum.
  Choose a bounded half-open fundamental cell of $A$ with vertex zero and area one,
    and let $d$ bound the distance of its points from its lattice vertex.
    Up to boundary sets of area zero, for $R > d$ the union of cells whose vertices lie in $A ∩
    B_R$ contains $B_(R - d)$ and is contained in $B_(R + d)$.
    Its area is $\# \( A ∩ B_R \)$, so $A$ has centered disk density one.
    For each $x in A ∩ B_R$, the differences $y - x$ with $y in A ∩ B_R \\ { x }$ form a subset of $A \\ { 0 }$.
    Nonnegativity gives
  $ sum_(y in A ∩ B_R\
y eq.not x) g \( \| x - y \|^2 \) lt.eq sum_(a in A \\ { 0 }) g \( \| a \|^2 \) . $
  If the lattice sum is finite, averaging gives the upper bound for $E_g \( A \)$,
    and (7.2) applied to $A$ gives the reverse bound. If the lattice sum is infinite,
    the same lower bound gives $E_g \( A \) = oo$. Thus the equality in Theorem 1 holds in every case. ◻
]

== 8 Renormalized and jellium energies <sec:renormalized>

The universal-energy theorem is now proved. For the nonsummable Riesz kernels with $0 < s <
  2$ and for the logarithm, the meaningful finite comparison comes from neutralizing the points against a uniform
  background and removing their self-energy. Petrache and Serfaty established the implication from universal
  optimality to these crystallization conclusions #cite(label("PetracheSerfaty2020")) Theorem 2.
  We give the transfer for the field normalization and order of limits specified below.

The decisive intermediate comparison allows arbitrary period lattices.
  Consequently the square-periodic approximation of the field infimum in Appendix 10 suffices,
  although the minimizing lattice is triangular.

=== 8.1 Field and scalar energy conventions <field-and-scalar-energy-conventions>

Following the field-first construction of Petrache and Serfaty #cite(label("PetracheSerfaty2017"))
  Definitions 1.2–1.3, we define the energy with its full-space normalization fixed by the fundamental-solution
  equation below. The truncation limit and cubic approximation for this convention are established in
  Proposition 22. For $0 lt.eq s < 2$, put

$ g_s \( X \) = cases(delim: "{", - log \| X \| \, & s = 0 \,, \| X \|^(- s) \, & 0 < s < 2 \,)
  wide \( k \, gamma \) = cases(delim: "{", \( 0 \, 0 \) \, & s = 0 \,, \( 1 \, s - 1 \) \, & 0 < s < 2 .) $

Write $X = \( x \, y \) in bb(R)^2 times bb(R)^k$, with the extra coordinate omitted when $k = 0$,
  and let $w_s = \| y \|^gamma$ for $k = 1$ and $w_0 = 1$. The full-space identity

$ - "div" \( w_s nabla g_s \) = kappa_s delta_0 $

gives $kappa_0 = 2 pi$ and, for $0 < s < 2$,

$ kappa_s = s integral_(S^2) \| omega_y \|^(s - 1) thin d sigma \( omega \) = 4 pi . $

Here $omega_y$ is the vertical coordinate on the unit sphere,
  and $delta_(bb(R)^2)$ denotes area measure on $bb(R)^2 times { 0 }$.

Fix once and for all $p$ with $1 < p < 2$ if $s = 0$, and

$ 1 < p < min (2 \, 2 / s \, frac(3, s + 1)) wide upright("if ") 0 < s < 2 . $

For a locally finite configuration $cal(C)$, admissible fields are gradients $E =
  nabla h$ in $L_(upright("loc"))^p \( bb(R)^(2 + k) \; bb(R)^(2 + k) \)$ with $w_s E in L_(upright("loc"))^1$,
  satisfying

$ - "div" \( w_s E \) = kappa_s (sum_(p in cal(C)) delta_(\( p \, 0 \)) - delta_(bb(R)^2)) . $

This is the local integrability range following Petrache and Serfaty #cite(label("PetracheSerfaty2017"))
  Definition 1.2. Set

$ f_(s \, eta) = \( g_s - g_s \( eta \) \)_(+) \, wide E_eta = E -
  sum_(p in cal(C)) nabla f_(s \, eta) \( X - \( p \, 0 \) \) . $

Thus the scalar potential subtracts $f_(s \, eta)$ and its gradient subtracts $nabla f_(s \, eta)$.
  For $K_R = \[ - R \/ 2 \, R \/ 2 \]^2$, define

$ cal(W)_(s \, eta) \( E \) & =
  limsup_(R arrow.r oo) [1 / R^2 integral_(K_R times bb(R)^k) w_s \| E_eta \|^2 - kappa_s g_s \( eta \)] \,\
cal(W)_s \( E \) & = lim_(eta arrow.b 0) cal(W)_(s \, eta) \( E \) \, wide W_s \( cal(C) \) = inf_E cal(W)_s \( E \) . $

The truncation limit exists in $bb(R) union { + oo }$ by Proposition 22;
  the infimum is over compatible admissible fields and is $+ oo$ if there are none.
  In particular, the configuration infimum is outside both limits.

The periodic energy has the same field normalization. For a torus $T =
  bb(R)^2 \/ L$ of area $N in bb(N)$ and distinct points $a_1 \, dots.h \, a_N$,
  let $H$ be the canonical potential with mean-zero trace satisfying

$ - "div" \( w_s nabla H \) = kappa_s (sum_(i = 1)^N delta_(\( a_i \, 0 \)) - delta_T) \, $

with finite truncated energy on $T times bb(R)^k$. Truncations include the periodic images of the charges. Set

$ W_(s \, L) \( a_1 \, dots.h \, a_N \) = lim_(eta arrow.b 0)
  [1 / N integral_(T times bb(R)^k) w_s \| nabla H_eta \|^2 - kappa_s g_s \( eta \)] . $

If $cal(G)_L$ is the mean-zero unit-source extension Green function,

$ - "div" \( w_s nabla cal(G)_L \) = delta_(\( 0 \, 0 \)) - N^(- 1) delta_T \, $

integration by parts gives

$ W_(s \, L) =
  kappa_s^2
  [1 / N sum_(i eq.not j) cal(G)_L \( a_i - a_j \, 0 \) + lim_(x arrow.r 0) (cal(G)_L \( x \, 0 \) - frac(g_s \(
  x \), kappa_s))] . $

This follows the integration-by-parts argument of Petrache and Serfaty #cite(label("PetracheSerfaty2017"))
  Proposition 1.5, using the Green function and coefficient determined by the displayed extension equation.

For $N in bb(N)$, set $R = sqrt(N)$ and $K_R = \[ - R \/ 2 \, R \/ 2 \]^2$. The finite ordered-pair jellium energy is

#[#set math.equation(numbering: n => "(8.1)")
 $ J_(s \, R) \( a_1 \, dots.h \, a_N \) =  & sum_(i eq.not j) g_s \( a_i - a_j \) -
   2 sum_(i = 1)^N integral_(K_R) g_s \( a_i - x \) thin #h(-0.16667em) upright(d) x\
 & + integral_(K_R) integral_(K_R) g_s \( x - x' \) thin #h(-0.16667em) upright(d) x thin #h(-0.16667em)
   upright(d) x' . $ <eq:finite-ordered-jellium>]

Here the particles are distinct; collisions have energy $+ oo$. We use the density-one thermodynamic minimum

$ e_(upright("Jel"))^(\( s \)) = lim_(N arrow.r oo) 1 / N min_(a_1 \, dots.h \, a_N in K_(sqrt(N)))
  J_(s \, sqrt(N)) \( a_1 \, dots.h \, a_N \) . $

Since $\| K_(sqrt(N)) \| = N$, normalization per particle and per unit area coincide.
  The scalar thermodynamic results and finite confinement argument below establish the existence of this limit.

=== 8.2 The triangular minimum <the-triangular-minimum>

#thm([Corollary 8.1.])[
  (Planar renormalized and jellium energies).  #emph[Let $0 lt.eq s < 2$.
    For every positive integer $n$, put $N = n^2$ and enumerate $A \/ \( n A \)$ by $a_1^triangle.stroked.t \,
    dots.h \, a_N^triangle.stroked.t$. Every configuration of $N$ distinct points in $bb(R)^2 \/ \( n A \)$ satisfies
$ W_(s \, n A) \( a_1 \, dots.h \, a_N \) gt.eq
  W_(s \, n A) \( a_1^triangle.stroked.t \, dots.h \, a_N^triangle.stroked.t \) . $

 Moreover, $A$ minimizes $W_s$ among density-one planar configurations, and $e_(upright("Jel"))^(\( s \)) =
   kappa_s^(- 1) W_s \( A \)$.]
] <cor:riesz-jellium>

For a density-one periodic configuration $cal(C) = union.big_(i = 1)^N \( a_i + L \)$, write $V_s \( cal(C) \) =
  W_(s \, L) \( a_1 \, dots.h \, a_N \)$ for its canonical periodic value.
  The following identity compares these values without requiring the configurations to share a period lattice.

#thm([Lemma 8.2.])[
  (Heat comparison across period lattices).  #emph[Let $0 lt.eq s < 2$,
    and let $cal(C)$ and $cal(D)$ be simple periodic configurations of density one. Put
$ q_0 = 2 pi \, wide q_s = frac(2^(2 - s) pi Gamma \( 1 - s \/ 2 \), Gamma \( s \/ 2 \)) quad \( 0 < s < 2 \) \,
  wide Psi_t \( x \) = \( 4 pi t \)^(- 1) e^(- \| x \|^2 \/ \( 4 t \)) . $

 If $cal(C) = union.big_(i = 1)^N \( a_i + L \)$, where $\| bb(R)^2 \/ L \| = N$, define
$ P_(t \, L) \( x \) = sum_(v in L) Psi_t \( x - v \) \, wide H_(cal(C)) \( t \) = 1 /
  N sum_(i \, j = 1)^N P_(t \, L) \( a_i - a_j \) - Psi_t \( 0 \) \, $

 and define $H_(cal(D))$ using its own period lattice and point count.
   Then the following integral is absolutely convergent and satisfies
$ V_s \( cal(C) \) - V_s \( cal(D) \) = frac(kappa_s q_s, Gamma \( 1 - s \/ 2 \)) integral_0^oo
  #scale(x: 120%, y: 120%)[\(] H_(cal(C)) \( t \) - H_(cal(D)) \( t \) #scale(x: 120%, y: 120%)[\)] t^(- s \/ 2)
  thin #h(-0.16667em) upright(d) t . $

]
] <lem:periodic-heat-comparison>

#proof[
  Put $alpha = 1 - s \/ 2$. We first identify the scalar Green function whose heat representation has the field
    normalization used here. On the base plane, $\( - Delta \)^alpha g_s \( dot.op \, 0 \) = q_s delta_0$,
    with the extra coordinate omitted when $s = 0$. On $T = bb(R)^2 \/ L$,
    the spectral operator $\( - Delta \)^alpha$ multiplies the Fourier mode $e^(2 pi i xi dot.op x)$,
    $xi in L^(*)$, by $lambda_xi^alpha$, where $lambda_xi = \( 2 pi \| xi \| \)^2$.
    Its mean-zero unit-source Green function $G_L$ therefore has coefficient $N^(- 1)
    lambda_xi^(- alpha)$ for each $xi eq.not 0$. To compare it with the full-space extension,
    suppose first that $0 < s < 2$. For $lambda > 0$, the even profile
  $ u_lambda \( y \) = frac(1, Gamma \( alpha \)) integral_0^oo t^(alpha - 1) e^(- lambda t - y^2 \/ \( 4 t \))
    thin #h(-0.16667em) upright(d) t $
  decays at infinity and satisfies
  $ u_lambda \( 0 \) = lambda^(- alpha) \, wide u''_lambda + frac(1 - 2 alpha, y) u'_lambda - lambda u_lambda =
    0 quad \( y > 0 \) . $
  Differentiation and the substitution $v = y^2 \/ \( 4 t \)$ give its full, two-sided weighted flux:
  $ - 2 lim_(y arrow.b 0) y^(1 - 2 alpha) u'_lambda \( y \) =
    2^(2 - 2 alpha) frac(Gamma \( 1 - alpha \), Gamma \( alpha \)) = kappa_s / q_s . $
  Thus the unit-source extension mode is $\( q_s \/ \( N kappa_s \) \) u_(lambda_xi)$,
    whose trace is $\( q_s \/ kappa_s \) N^(- 1) lambda_xi^(- alpha)$. The zero mode has no source:
    finite tail energy forces it to be constant, and the mean-zero trace sets that constant to zero.
    For $s = 0$ there is no extension coordinate; both Green functions solve $- Delta G = delta_0 -
    N^(- 1)$ on $T$ with zero mean, and $q_0 \/ kappa_0 = 1$.
    Hence, throughout $0 lt.eq s < 2$, $cal(G)_L \( x \, 0 \) = \( q_s \/ kappa_s \) G_L \( x \)$,
    with the trace notation omitted at $s = 0$. The periodic formula above consequently becomes
  $ W_(s \, L) =
    kappa_s q_s
    [1 / N sum_(i eq.not j) G_L \( a_i - a_j \) + lim_(x arrow.r 0) (G_L \( x \) - frac(g_s \( x \), q_s))] . $
  Set
  $ B_(cal(C)) \( t \, x \) = 1 / N sum_(i \, j) P_(t \, L) \( a_i - a_j + x \) \, $
  so $B_(cal(C)) \( t \, 0 \) = H_(cal(C)) \( t \) + Psi_t \( 0 \)$.
    The heat representation #cite(label("PetracheSerfaty2020")) Lemma 1 is
  $ G_L \( x \) = frac(1, Gamma \( alpha \)) integral_0^oo (P_(t \, L) \( x \) - 1 / N) t^(alpha - 1) thin
    #h(-0.16667em) upright(d) t . $
  Its spectral proof applies to any flat torus. To compare two periodic configurations $cal(C)$ and $cal(D)$,
    set $S_(cal(C)) \( x \) = N^(- 1) sum_(i \, j) G_L \( a_i - a_j + x \)$,
    and define $S_(cal(D))$ using its own period lattice and point count.
    Each $S$ has singular part $g_s \( x \) \/ q_s$. In their heat-integrand difference the background terms are
    both $1$ and the diagonal terms are both $Psi_t \( x \)$, so these terms cancel.
    Uniformly for $x$ near zero, the remaining difference is bounded by $C t^(- 1) e^(- c \/ t)$ as $t arrow.b 0$,
    because the other image distances are positive, and by $C e^(- lambda t)$ as $t arrow.r oo$,
    by the two torus spectral gaps. Dominated convergence as $x arrow.r 0$ consequently gives
  $ V_s \( cal(C) \) - V_s \( cal(D) \) = frac(kappa_s q_s, Gamma \( 1 - s \/ 2 \)) integral_0^oo
    #scale(x: 120%, y: 120%)[\(] H_(cal(C)) \( t \) - H_(cal(D)) \( t \) #scale(x: 120%, y: 120%)[\)] t^(- s \/ 2)
    thin #h(-0.16667em) upright(d) t . $
  This calculation also covers $s = 0$: the logarithmic singularity cancels before either endpoint is integrated. ◻
]

#proof[
  #emph[Periodic configurations.] The subtraction in $H_(cal(C))$ removes only the coincident point;
    all other images, including images of the same point, remain. Periodic counting gives
  $ H_(cal(C)) \( t \) = frac(1, 4 pi t) E_(g_t) \( cal(C) \) \, wide g_t \( u \) = e^(- u \/ \( 4 t \)) . $
  Indeed, every fixed image displacement has its periodic frequency in large disks,
    and the Gaussian tail is summable uniformly over the finitely many point types.
    The Gaussian estimate (6.6), with Gaussian parameter $1 \/ \( 4 pi t \)$,
    multiplied by the positive factor $\( 4 pi t \)^(- 1)$, therefore gives $H_(cal(C)) \( t \) gt.eq
    H_A \( t \)$ for every $t > 0$.
  Applying Lemma 20 with $cal(D) = A$ therefore proves $V_s \( cal(C) \) gt.eq
    V_s \( A \)$ for every periodic $cal(C)$. Repetition on $n A$ preserves $H_A$ and hence $V_s \( A \)$,
    which proves the stated torus inequality.
  #emph[The infinite-system field infimum.]
  Put $m_s = inf_E cal(W)_s \( E \)$, where the infimum runs over all compatible gradients in the fixed-$p$ class
    with simple locally finite configurations and unit background.
    No centered-density assumption is added to this infimum. Proposition 22 supplies canonical periodic gradients
    whose values tend to $m_s$. Each value is at least $V_s \( A \)$ by the preceding inequality, so $m_s gt.eq
    V_s \( A \)$. Conversely the canonical field of $A$ is admissible, so $m_s lt.eq V_s \( A \)$.
    For the configuration infimum we now have
  $ m_s lt.eq W_s \( A \) lt.eq V_s \( A \) = m_s \, $
  and every configuration has $W_s \( cal(C) \) gt.eq m_s$.
    This lower bound uses inclusion in the field class, not a conversion between disk and square density.
    The cubic sequence suffices because the heat comparison applies to every period lattice.
  #emph[The scalar jellium value.] Let $G_L$ again denote the mean-zero unit-source Green function of
    $\( - Delta \)^(1 - s \/ 2)$ on $bb(R)^2 \/ L$, as in the heat-comparison lemma.
    To identify the jellium value, use the physical periodic kernel $v_L = q_s G_L$ and its regular part $r_L =
    lim_(x arrow.r 0) \( v_L \( x \) - g_s \( x \) \)$. The unordered scalar periodic energy,
    including its self term, is
  $ cal(E)_(upright("per") \, L) = sum_(i < j) v_L \( a_i - a_j \) + N / 2 r_L \, wide
    frac(2 cal(E)_(upright("per") \, L), N) = W_(s \, L) / kappa_s . $
  The scalar thermodynamic input, in this notation, is
  #[#set math.equation(numbering: n => "(8.2)")
   $ lim_(N arrow.r oo) frac(1, 2 N) min_(upright(bold(a)) in \( bb(R)^2 \)^N)
     J_(s \, sqrt(N)) \( upright(bold(a)) \) = liminf_(N arrow.r oo) 1 /
     N min_(upright(bold(a)) in \( bb(R)^2 \/ \( sqrt(N) bb(Z)^2 \) \)^N)
     cal(E)_(upright("per") \, sqrt(N) bb(Z)^2) \( upright(bold(a)) \) = :
     e_(upright("per"))^(\( s \)) . $ <eq:scalar-jellium-input>]
  For $0 < s < 2$, this is Lewin et al. #cite(label("LewinLiebSeiringer2019")) Section II, (3)–(4),
    and Section VI, (25), (27)–(31), Theorem 2; for $s = 0$, it is Lauritsen #cite(label("Lauritsen2021"))
    Section II and Theorem II.1, who also proves existence of the full periodic limit.
    Both inputs use $N$ particles against a background of density one and area $N$,
    with unrestricted particle positions on the left. Their scalar energies count each pair once.
    Their periodic kernels have zero mean, and their self contribution is $N r_L \/ 2$,
    exactly as in $cal(E)_(upright("per") \, L)$ above.
  The approximating periods in Proposition 22 are cubic. Every canonical periodic value is at least $m_s$,
    and the values along that sequence tend to $m_s$. The finite identity $2 cal(E)_(upright("per") \, L) \/ N =
    W_(s \, L) \/ kappa_s$ therefore identifies the lower limit in (8.2) as $e_(upright("per"))^(\( s \)) =
    m_s \/ \( 2 kappa_s \)$.
  #emph[Confinement to the background square.] Finite minimization is unchanged by restricting the particles to
    $K_R$. Fix the other $N - 1$ particles. For $0 < s < 2$, their one-particle potential extends to
    $X = \( x \, z \) in bb(R)^3$ as
  $ U \( X \) = sum_(j eq.not i) \| X - \( a_j \, 0 \) \|^(- s) -
    integral_(K_R) \| X - \( y \, 0 \) \|^(- s) thin #h(-0.16667em) upright(d) y . $
  The background potential is continuous because $s < 2$, the point poles tend to $+ oo$,
    and $U \( X \) = - \| X \|^(- s) + O \( \| X \|^(- s - 1) \)$ at infinity.
    Hence $U$ attains a negative global minimum away from its point poles.
  We use the weighted strong minimum principle: a continuous weak solution $u in
    H_(upright("loc"))^1 \( D \, \| z \|^gamma thin #h(-0.16667em) upright(d)
    X \)$ of $"div" \( \| z \|^gamma nabla u \) = 0$ on a connected open set $D$, with $- 1 < gamma < 1$,
    cannot attain an interior minimum unless it is constant #cite(label("FabesKenigSerapioni1982"))
    Corollary 2.3.10, p. 98. This follows from their Harnack inequality for $A_2$ weights, Theorem 2.3.8;
    here $\| z \|^gamma in A_2$.
  Apply this principle on
  $ D = bb(R)^3 \\ #scale(x: 120%, y: 120%)[\(] \( K_R times { 0 } \) union { \( a_j \, 0 \) :
    j eq.not i } #scale(x: 120%, y: 120%)[\)] \, wide gamma = s - 1 . $
  The function $U$ is smooth away from these sources and belongs to
    $H_(upright("loc"))^1 \( D \, \| z \|^(s - 1) thin #h(-0.16667em) upright(d) X \)$.
    It is weighted harmonic also across the source-free part of $z = 0$:
    there $partial_z U = O \( \| z \| \)$, so $\| z \|^(s - 1) partial_z U = O \( \| z \|^s \) arrow.r
    0$ from both sides. The set $D$ is connected. Constancy there is incompatible with the negative minimum and $U
    arrow.r 0$ at infinity, so a minimum lies on $K_R times { 0 }$.
    For $s = 0$, ordinary harmonicity outside the square and the point poles, together with $U \( x \) =
    log \| x \| + o \( 1 \)$ at infinity, gives the same conclusion by the ordinary strong minimum principle.
    Moving each exterior particle to such a minimum does not increase the energy or create a collision.
    On $K_R^N$, the extended energy is lower semicontinuous, finite at a distinct tuple,
    and diverges at collisions, so its infimum is attained. The confined and unrestricted minima therefore agree, and
  $ e_(upright("Jel"))^(\( s \)) = 2 e_(upright("per"))^(\( s \)) = m_s / kappa_s . $
  ◻
]

== 9 Scalar bounds for the Gaussian construction <sec:arithmetic>

The elementary inequalities and scalar error budgets below are the numerical inputs to the interpolation and sign
  arguments in Sections 4 and 5. We give rational proofs of these bounds.
  The supplied program checks these scalar budgets and the numerical error-propagation majorants in Appendix 11,
  using $512$-bit Arb balls, exact rational arithmetic, and exact integer samples of the rounded exponential
  routine. It does not implement the degree-$2000$ rational exponential enclosures described below.

The finite matrix certificate has a separate verification.
  The program encloses the exact quadrature arrays at $256$-bit precision and tests every strict comparison in
  Tables 1–3. This is the finite route used in Proposition 9;
  its relation to the exact spectral integrals is supplied by Lemma 7.

Appendix 11 gives a separate conditional floor-rounded rational procedure,
  with all its error estimates and finite loops. That full matrix construction is not executed by the supplied
  programs. Commands and dependencies for the two programs are listed in .

=== 9.1 Rational enclosures of elementary constants <rational-enclosures-of-elementary-constants>

Every terminating decimal specifying a parameter or comparison threshold is an exact rational number.
  Set $epsilon.alt = 10^(- 80)$ and define
#[#set math.equation(numbering: n => "(9.1)")
 $ p_(*) =  & 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899 \,\
b_(*) =  & 0.86602540378443864676372317075293618347140262690519031402790348972596650845440001 . $ <eq:rational-pi-b>]

#thm([Lemma 9.1.])[
  (Decimal enclosures).  #emph[For $b = sqrt(3) \/ 2$, these rationals satisfy
#[#set math.equation(numbering: n => "(9.2)")
 $ p_(*) < pi < p_(*) + epsilon.alt \, wide b_(*) < b < b_(*) + epsilon.alt . $ <eq:rational-pi-b-error>]

]
] <lem:rational-pi-b>

#proof[
  Put
  $ A \( x \) = sum_(j = 0)^65 frac(\( - 1 \)^j x^(2 j + 1), 2 j + 1) . $
  For $0 < x < 1$, integrate the finite geometric expansion of $1 \/ \( 1 + x^2 \)$.
    Its remainder has the sign and magnitude giving $A \( x \) < arctan x < A \( x \) + x^133 \/ 133$.
    The tangent addition formula gives $tan \( 4 arctan \( 1 \/ 5 \) \) = 120 \/ 119$;
    subtracting an angle with tangent $1 \/ 239$ gives tangent one,
    and the resulting angle is in $\( 0 \, pi \/ 2 \)$. Therefore $pi \/ 4 = 4 arctan \( 1 \/ 5 \) -
    arctan \( 1 \/ 239 \)$. The two required rational comparisons are
  $ p_(*) & < 16 A \( 1 \/ 5 \) - 4 #scale(x: 120%, y: 120%)[\(] A \( 1 \/ 239 \) +
    239^(- 133) \/ 133 #scale(x: 120%, y: 120%)[\)] \,\
16 #scale(x: 120%, y: 120%)[\(] A \( 1 \/ 5 \) + 5^(- 133) \/ 133 #scale(x: 120%, y: 120%)[\)] -
  4 A \( 1 \/ 239 \) & < p_(*) + epsilon.alt . $
  They follow by clearing positive denominators. Likewise, the second bracket is exactly the pair of
    integer-square comparisons $b_(*)^2 < 3 \/ 4 < \( b_(*) + epsilon.alt \)^2$. ◻
]

The threshold in Lemma 16 needs only a shorter rational comparison. Squaring gives $sqrt(3) < 1733 \/ 1000$.
  Using the Machin identity proved above, the alternating arctangent series gives

$ pi > 16 (1 / 5 - frac(1, 3 dot.op 5^3)) - 4 / 239 = 281476 / 89625 > 157 / 50 . $

Consequently

$ pi \( 2 \/ sqrt(3) - 2 \/ 5 \) > 157 / 50 (2000 / 1733 - 2 / 5) = 1025838 / 433250 > 59 / 25 = 2.36 . $

We will also use a rational enclosure of a real exponential.
  For rational $a gt.eq 0$ and an integer $q gt.eq 0$, put $P_q \( a \) = sum_(j = 0)^q a^j \/ j !$.
  If $a > 0$ and $q + 2 > a$, comparison of successive terms in the positive tail gives

#[#set math.equation(numbering: n => "(9.3)")
 $ P_q \( a \) < e^a < P_q \( a \) + frac(a^(q + 1), \( q + 1 \) !) frac(1, 1 - a \/ \( q + 2 \)) \,\
frac(1, P_q \( a \) + frac(a^(q + 1), \( q + 1 \) !) frac(1, 1 - a \/ \( q + 2 \))) < e^(- a) <
  frac(1, P_q \( a \)) . $ <eq:scalar-rational-enclosure>]

Indeed, the first omitted term is $a^(q + 1) \/ \( q + 1 \) !$,
  and every subsequent ratio is at most $a \/ \( q + 2 \) < 1$.
  The lower bound is the positive partial sum, and reciprocation reverses the two positive bounds.
  At $a = 0$ both exponentials equal one. Lemma 7 uses only the $a = 1 \, q =
  6$ instance to prove $e < 2719 \/ 1000$; its three final numerical allowances have already been established there.

=== 9.2 Scalar bounds for interpolation and signs <scalar-bounds-for-interpolation-and-signs>

We now evaluate the scalar majorants derived in Sections 4 and 5.
  The first is the tail bound from Lemma 6, for a positive integer $r$:

$ U_r \( w \, c \) = frac(800 \( w + c \) e^(- .70 r), 1 - e^(- .70)) +
  frac(5.3 \( 2.54 w \/ r + 2 c \) e^(- .187 r), 1 - e^(- .187)) . $

In each application, $w$ bounds the sum of the absolute node coefficients and $c$ bounds the absolute constant
  coordinate, summed over the input lists when there are two.
  Lemma 6 then bounds the sum of the absolute transformed jet coordinates over all output nodes $n gt.eq
  r$ by $U_r \( w \, c \)$.

The following strict outward bounds collect the numerical inputs for interpolation and the first sign estimates:

#[#set math.equation(numbering: n => "(9.4)")
 $ upright("quantity") & upright("outward upper bound") & upright("allowance used")\
U_168 \( 1 \, 0 \) & 1.0670 dot.op 10^(- 14) & 1.1 dot.op 10^(- 14)\
U_168 \( 5 \, .02 \) & 8.1575 dot.op 10^(- 14) & 8.3 dot.op 10^(- 14) - 10^(- 170)\
U_91 \( 5 \, .02 \) & 2.2711 dot.op 10^(- 7) & 2.4 dot.op 10^(- 7)\
frac(1 + \( 1 + 2.12 \) \/ 2.36, 1.75) frac(e^(- 2.36 dot.op 11), 1 - e^(- 2.36)) & 7.7915 dot.op 10^(- 12) & 8
  dot.op 10^(- 12)\
\( 2.3 + 5.6 \/ 2.36 \) sum_(n in { 1 \, 3 \, 4 \, 7 \, 9 }) e^(- 2.36 \( n - 1 \)) & 4.7185 & 4.8\
36 / 2 \( 2 dot.op 10^(- 8) \) 3 \( 3 pi \)^2 & 9.5933 dot.op 10^(- 5) & .00011 $ <eq:scalar-error-budgets>]

The first tail residual has a deliberately finer margin: $8.3 dot.op 10^(- 14) - 8.1575 dot.op 10^(- 14) =
  1.425 dot.op 10^(- 15) > 10^(- 170)$. For the high-node list,
  the finer $2.2711 dot.op 10^(- 7)$ bound is retained before the target jets are added.

===== 9.2.1 Local target tails and interpolation arithmetic. <local-target-tails-and-interpolation-arithmetic.>

Write

$ c_(upright("jet")) = frac(1 + \( 1 + 2.12 \) \/ 2.36, 1.75) = 548 / 413 \, wide rho = e^(- 2.36) . $

The target-jet estimate (4.4), monotonicity in $k gt.eq 2.36$,
  and overcounting by all integers show that the target cost from nodes $n gt.eq r +
  1$ is at most $c_(upright("jet")) rho^r \/ \( 1 - rho \)$.
  A small rational check suffices even for the very distant tail:

$ P_7 \( 59 \/ 25 \) > 1 + 2.36 + 2.78 + 2.19 + 1.29 + .61 + .239 + .08 = 10.549 > 21 \/ 2 . $

Each termwise lower comparison is rational. Thus $rho < 2 \/ 21$. Also

$ 548 / 413 21 / 19 < 3 / 2 \, wide \( 21 \/ 20 \)^168 > \( 21 \/ 20 \)^160 > \( 3 \/ 2 \)^16 > 150 . $

The middle inequality follows from $\( 1 + 1 \/ 20 \)^10 > 1 + 10 \/ 20 = 3 \/ 2$,
  and the last follows by comparing $3^16$ with $150 dot.op 2^16$.
  Therefore the target tail above $168$ satisfies the explicit local bound

#[#set math.equation(numbering: n => "(9.5)")
 $ c_(upright("jet")) frac(rho^168, 1 - rho) < 548 / 413 21 / 19 \( 2 \/ 21 \)^168 < 3 / 2 10^(- 168) / 150 =
   10^(- 170) . $ <eq:target-tail-168>]

Combining this with the finer $U_168 \( 5 \, .02 \)$ row of (9.4) proves the tail allowance
  $U_168 \( 5 \, .02 \) + 10^(- 170) < 8.3 dot.op 10^(- 14)$.
  This direct rational bound handles the exponent $2.36 dot.op 168 = 396.48$,
  outside the range of exponents used in the degree-$2000$ comparisons below.

The same local estimate for the first high node $91$ gives

#[#set math.equation(numbering: n => "(9.6)")
 $ c_(upright("jet")) frac(e^(- 2.36 dot.op 90), 1 - e^(- 2.36)) < 3 /
   2 thin 10^(- 90) < 10^(- 89) . $ <eq:target-tail-91>]

Thus the transformed and target contributions to the high-list norm obey $U_91 \( 5 \, .02 \) +
  10^(- 89) < 2.4 dot.op 10^(- 7)$. The finer $U_91$ bound leaves the margin needed to include the target jets.

The same $rho < 2 \/ 21$ gives a direct bound for the first five target jets:

$ 548 / 413 (1 + \( 2 \/ 21 \)^2 + \( 2 \/ 21 \)^3 + \( 2 \/ 21 \)^6 + \( 2 \/ 21 \)^8) < 1.35 . $

The reference-list bound in (9.4) includes the extras, so their combined norm is below $4.8$.
  Their constant coordinates also retain a stronger bound. For $k gt.eq 2.36$,
  the first expression below is negative and the second positive, whence

$ \| - .0074 + .0115 \/ k \| + \| .0096 - .017 \/ k \| = .017 - .0285 \/ k < .02 . $

The first-five jet bound and the quadrature-operator bound imply $1.35 + \( 4000 + 2 dot.op 10^(- 27) \) 4.8 <
  20000$ for the combined data norm used in the geometric residual.

For clarity, the remaining local inverse and residual arithmetic is

$ frac(36, 1 - .004^8) < 37 \, wide frac(37, 1 - 37 \( 2 dot.op 10^(- 27) \)) < 40 \,\
\( 1.1 dot.op 10^(- 14) \) \( 1 + 40 dot.op 4000 \) = 1.760011 dot.op 10^(- 9) < 1 \,\
20000 \( .004 \)^8 = 1.31072 dot.op 10^(- 15) < 1.4 dot.op 10^(- 15) . $

The finite residual is consequently bounded by $8 dot.op 10^(- 12) + 10^(- 24) +
  1.4 dot.op 10^(- 15) < 10^(- 11)$ after its three terms have been derived in Section 4.
  For the correction inequalities (4.15), put $beta = 1.1 dot.op 10^(- 14)$. Their rational solution is bounded by

$ u_(cal(T)) lt.eq frac(8.3 dot.op 10^(- 14) + 40 beta dot.op 10^(- 11), 1 - beta \( 1 + 40 dot.op 4000 \)) \,
  wide u_(cal(F)) lt.eq 40 \( 10^(- 11) + 4000 u_(cal(T)) \) . $

The denominator is positive by the preceding Schur bound, and the two right sides give $u_(cal(F)) +
  u_(cal(T)) < 1.3681 dot.op 10^(- 8) < 2 dot.op 10^(- 8)$.
  Together with the operator-derived inequalities (4.15), this proves the correction bound.
  The reference norm then gives a combined exact-list norm below $4.8 + 2 dot.op 10^(- 8) < 5$,
  with the fixed constant coordinates still bounded by $.02$.

===== 9.2.2 Half-gap and tail sign arithmetic. <half-gap-and-tail-sign-arithmetic.>

For the Taylor remainder in (5.5), put

$ cal(R) \( m \, Y \, nu \) =
  frac(Y^(- nu) 36 dot.op 5, \( 41 + nu \) ! #scale(x: 120%, y: 120%)[\(] 1 - 3 pi Y \/ \( 42 + nu \)
  #scale(x: 120%, y: 120%)[\)]) (\( pi Y \)^(41 + nu) + 3 sum_(j = 1)^6 e^(- pi "Im" z \( t_j \) m) \( pi \| z \(
  t_(j - 1) \) \| Y \)^(41 + nu)) . $

The denominators are positive for the four tuples below; for example,
  $3 pi Y \/ \( 42 + nu \) lt.eq \( 9 pi \/ 2 \) \/ 42 < 1$.
  The sum of six nonnegative candidates dominates the maximum in the analytic remainder. The strict outward bounds are

$ \( m \, Y \, nu \) & cal(R) \( m \, Y \, nu \) upright(" is below")\
\( 0 \, 1 \/ 2 \, 0 \) & 1.8 dot.op 10^(- 19)\
\( 1 \, 1 \, 2 \) & 1.0 dot.op 10^(- 11)\
\( 3 \, 1 \, 2 \) & 3.0 dot.op 10^(- 16)\
\( 4 \, 3 \/ 2 \, 2 \) & 2.0 dot.op 10^(- 11) . $

The included-moment quadrature cost is separately at most $41 dot.op 4 dot.op 5 dot.op 10^(- 31) =
  8.2 dot.op 10^(- 29)$. Adding it to each displayed remainder still gives less than $10^(- 8)$.
  As proved after (5.5), the bound decreases when $m$ increases or $Y$ decreases,
  so these four tuples cover every half-gap.

The two target-support Taylor tails satisfy

$ e^6 / 6 frac(3^41, 41 !) frac(1, 1 - 3 \/ 42) < 8 dot.op 10^(- 29) < 10^(- 6) \, wide
  6 frac(6^41, 43 !) frac(1, 1 - 6 \/ 44) < 10^(- 20) < 10^(- 6) . $

These estimates are applied after the parameter monotonicity and signed half-gap cases in Lemma 11; in particular,
  $K lt.eq 6$ also in the final unbounded parameter box.

At $s_0 = 89.5$, the four terms in the tail second-derivative majorant obey

$ & 36 pi^2 \( 2.4 dot.op 10^(- 7) \) + 3 \( 3 pi \)^2 thin 36 dot.op 5 thin e^(- .70 s_0)\
 & quad + 1.25 \( 1.32 pi \)^2 \( 2.54 dot.op 5 \/ s_0 + .04 \) e^(- .187 s_0) +
   2.36 e^(- 2.36 \( s_0 - 1 \)) < 8.5485 dot.op 10^(- 5) < .0002 . $

The last term is the supremum of $k e^(- k \( s_0 - 1 \))$ for $k gt.eq 2.36$:
  its logarithmic derivative is $1 \/ k - \( s_0 - 1 \) < 0$ there.
  The smallest endpoint ratio for the divided periodic product satisfies $12 - 8 sqrt(2) > .6862 > .68$.
  The midpoint identities and logarithmic concavity in Lemma 13 extend this endpoint bound to every nearest-node
  half-gap.

The final numerical implications are elementary once their separate error terms and barriers have been proved:

$ .001 - .00011 - .000001 - .000001 = .000888 > 0 \, wide .0021 - 2 dot.op 10^(- 8) > .002 \,
  wide .68 dot.op .002 > .0001 . $

These give, respectively, the bounded-range quotient margin, the exact low-node rational margin,
  and the comparison with the tail remainder.

===== 9.2.3 A nonmatrix rational route for these scalars. <a-nonmatrix-rational-route-for-these-scalars.>

For the three $U_r$ evaluations and the reference-list, omitted-jet, deleted-quotient, four half-gap-remainder,
  two target-support-tail, second-derivative, and product endpoint comparisons above, use (9.3) with $q = 2000$.
  Square roots, when present, are enclosed between positive rationals of width $10^(- 80)$ whose squares straddle
  the radicand. Explicitly, write a radicand as $A_(upright("num")) \/
  A_(upright("den"))$ with positive integers $A_(upright("num")) \, A_(upright("den"))$.
  Integer search over $0 lt.eq m < 3 dot.op 10^80$ finds $m$ with $m^2 A_(upright("den")) lt.eq
  10^160 A_(upright("num")) < \( m + 1 \)^2 A_(upright("den"))$.
  Then $m \/ 10^80 lt.eq sqrt(A_(upright("num")) \/ A_(upright("den"))) < \( m + 1 \) \/ 10^80$;
  equality at the lower endpoint is kept exact. The radicands used here exceed one,
  so both bracket endpoints are positive. The tail and interpolation comparisons need only rational arithmetic and
  exponential enclosures, with positive geometric denominators.
  The deleted-quotient, half-gap-remainder, and second-derivative comparisons also use the $pi$ output of
  Lemma 21; they do not need its $b$ output. For the half-gap remainders,

$ "Im" z \( t \) = frac(B h, t^2 + h^2) - h \, wide \| z \( t \) \|^2 = h^2 + frac(B \( B - 2 h^2 \), t^2 + h^2) $

at rational $t = t_j$, so only the latter positive rational radicand needs a square-root bracket.
  For $0 lt.eq t lt.eq 1$, $1 < 4 \/ 25 + 304 \/ 261 lt.eq \| z \( t \) \|^2 < 9$,
  by this formula and $\| z \| < 3$. The endpoint ratio uses a bracket for $sqrt(2)$,
  whose radicand also lies between one and nine. Thus each of these scalar comparisons requires no matrix construction.

All exponential magnitudes in this list are below $250$: the largest explicit target phase is
  $2.36 \( s_0 - 1 \) = 208.86$, the largest tail phase is $.70 dot.op 168 = 117.6$,
  and the four half-gap phases are below $pi dot.op 3 dot.op 4 < 38$ by $\| z \| < 3$.
  Finite rational evaluation with $q = 2000$ and the indicated root brackets gives the printed outward margins.
  The two more distant target-jet tails instead use the local $P_7 \( 59 \/ 25 \)$ calculation above;
  the quadrature proof uses $q = 6$.

== 10 Periodic approximation for the field energy <app:normalized-periodic-approximation>

Fix $s$ and the exponent $p$ as in Section 8. Throughout this appendix we suppress the subscript $s$ in $g_s \,
  w_s \, kappa_s \, f_(s \, eta) \, cal(W)_(s \, eta) \, cal(W)_s$, and $V_s$, retaining the same order of limits.
  Thus $L = - "div" \( w nabla dot.op \)$, $L g = kappa delta_0$, and $kappa = 2 pi$ for the planar logarithm,
  whereas $kappa = 4 pi$ for $g \( X \) = \| X \|^(- s)$, $0 < s < 2$, with $k = 1$, $gamma = s - 1$,
  and $w = \| y \|^gamma$ on the full extension space; for the logarithm set $k = 0$, $gamma = 0$, and $w = 1$.
  A compatible field also satisfies $w E in L_(upright("loc"))^1$;
  its equation is understood through the finite weak integrals $integral w E dot.op nabla phi$.
  This requirement is automatic whenever a truncation has finite local weighted energy.
  Write $K_R = \[ - R \/ 2 \, R \/ 2 \]^2$ and

$ Q_eta \( E \, R \) = integral_(K_R times bb(R)^k) w \| E_eta \|^2 \, wide F_eta =
  integral_(bb(R)^2) f_eta \( x \, 0 \) thin d x =
  cases(delim: "{", pi eta^2 \/ 2 \, & s = 0 \,, pi s eta^(2 - s) \/ \( 2 - s \) \, & s > 0 .) $

#thm([Proposition 10.1.])[
  (Normalized cubic approximation).  #emph[Let $0 lt.eq s < 2$, and fix $1 < p < 2$ for $s = 0$,
    or $1 < p < min \( 2 \, 2 \/ s \, 3 \/ \( s + 1 \) \)$ for $s > 0$.
    Let $cal(A)_1$ be the compatible gradient fields in this fixed $L_(upright("loc"))^p$ class,
    with simple locally finite configurations and unit background. Then the limit
$ cal(W) \( E \) = lim_(eta arrow.b 0) [limsup_(R arrow.r oo) R^(- 2) Q_eta \( E \, R \) - kappa g \( eta \)] $

 exists in $bb(R) union { + oo }$ and is bounded below uniformly over $cal(A)_1$. Its infimum $m$ is finite.
   There are integers $R_j arrow.r oo$ and simple configurations $cal(C)_j$, periodic under $2 R_j bb(Z)^2$,
   with $4 R_j^2$ points per period cell, whose canonical periodic values satisfy
$ V \( cal(C)_j \) arrow.r m . $

 The approximating fields may therefore be chosen to be canonical periodic gradients in the same fixed-$p$ class.]
] <prop:normalized-cubic-approximation>

The proof has three inputs: cutoff control, a stationary minimizing law, and a screening construction.
  The following lemmas establish them before we reflect and project the screened fields to prove the proposition.

A cutoff-energy estimate alone does not control the renormalized energy:
  removing the cutoff can expose arbitrarily close pairs. We first obtain a stationary law supported on minimizing
  fields whose expected close-pair defect tends to zero with the cutoff.
  We then screen one realization without creating new close pairs,
  and reflect it to obtain a periodic configuration. The periodic defect identity below converts its cutoff bound
  into a bound for the renormalized energy.

The screening fields need not be gradients. At that stage we preserve the divergence equation,
  obtain zero exterior normal flux, and bound the cutoff energy.
  After reflection, projection onto the canonical periodic gradient preserves the charges and decreases that
  energy. For cutoff estimates and compactness we temporarily allow integer multiplicities;
  the stationary-law lemma will rule out collisions before using the infimum over simple configurations.
  Let $B_eta$ be the ball of radius $eta$ centered at zero in $bb(R)^(2 + k)$. The positive unit sphere measure is

$ d delta_0^(\( eta \)) = kappa^(- 1) \[ - g' \( eta \) \] w thin d sigma_(partial B_eta) \, wide L f_eta =
  kappa \( delta_0 - delta_0^(\( eta \)) \) . $

The measure $delta_p^(\( eta \))$ is its translate to $\( p \, 0 \)$. The sign is fixed by the decreasing kernel.
  Write $nu = sum_p N_p delta_p$, $nu_eta = sum_p N_p delta_p^(\( eta \))$, and $N_B = nu \( B \)$.
  Fix the geometric constants

$ a_0 = 1 / 4 sqrt(2 / 3) \, wide a_1 = 4 sqrt(2) \, wide eta_0 = min {1 / 8 \, a_0 / 16} . $

These constants are independent of the cutoffs, the realization, $epsilon$, and $R$.
  Indeed, the planar subdivision in Petrache and Serfaty #cite(label("PetracheSerfaty2017")) Lemma 6.3 gives
  sidelengths in $\[ 1 / 4 tilde(m)^(- 1 \/ 2) \, 4 tilde(m)^(- 1 \/ 2) \]$;
  for $tilde(m) in \[ 1 \/ 2 \, 3 \/ 2 \]$ this interval is contained in $\[ a_0 \, a_1 \]$.
  Fix once and for all a dyadic auxiliary cutoff $eta' in \( 0 \, eta_0 \)$ for the local count estimates,
  and include it among the cutoffs controlled by the stationary law.
  The cutoffs used for stationary approximation will run through dyadic values $0 < eta < eta'$.

=== 10.1 Cutoff control and spatial density <cutoff-control-and-spatial-density>

#thm([Lemma 10.2.])[
  (Cutoff control).  #emph[For compatible gradients in the prescribed fixed-$p$ class,
    allowing integer multiplicities, the cutoff limit $cal(W) \( E \)$ exists in $bb(R) union { + oo }$.
    There is a constant $C_s$ independent of the field such that
$ - C_s lt.eq cal(W)_eta \( E \) lt.eq cal(W) \( E \) + 2 kappa F_eta wide \( 0 < eta < eta_0 \) . $

 If $Q_eta \( E \, R \) = O \( R^2 \)$ at one fixed cutoff, $Q_rho \( E \, R \) =
   O \( R^2 \)$ holds at every fixed cutoff $rho$ and $nu \( K_R \) \/ R^2 arrow.r 1$.
   In particular, the infimum $m$ in Proposition 22 is a finite real number.]
] <lem:field-cutoff-control>

#proof[
  Testing the smeared field equation against a nonnegative smooth function equal to one near all spheres centered
    in a fixed unit cell gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ N_B^2 lt.eq C_(B \, eta) (1 + integral_(B' times \[ - h \, h \]^k) w \| E_eta \|^2) .
     $ <eq:normalized-local-count>]
  Here $B'$ and $h$ are fixed enlargements. These enlargements have bounded overlap over a unit-cell tiling. Also
  $ integral w \| nabla \( f_alpha - f_eta \) \|^2 = kappa \[ g \( alpha \) - g \( eta \) \] \, wide 0 < alpha < eta . $
  Consequently, if $Q_alpha \( E \, R \) = O \( R^2 \)$ at one fixed cutoff, then $Q_eta \( E \, R \) =
    O \( R^2 \)$ at every fixed cutoff: apply (10.1) to the finite-range difference $sum_p N_p
    nabla \( f_alpha - f_eta \) \( dot.op - p \)$.
  The smeared Gauss equation also gives $nu \( K_R \) \/ R^2 arrow.r
    1$ whenever one cutoff has volume-order energy. For completeness,
    choose a lateral boundary at distance at most one from $partial K_R$ with squared flux energy $O \( R^2 \)$.
    For $k = 1$, choose height $L in \[ 1 \, sqrt(R) \]$ with top and bottom squared energy $O \( R^(3 \/ 2) \)$.
    Weighted Cauchy–Schwarz bounds the total flux by
  $ C L^(\( gamma + 1 \) \/ 2) R^(3 \/ 2) + C L^(gamma \/ 2) R^(7 \/ 4) = o \( R^2 \) \, $
  since $- 1 < gamma < 1$ (for negative $gamma$, use $L^(gamma \/ 2) lt.eq 1$).
    The smeared count lies between the counts in squares whose sidelengths differ from $R$ by a fixed constant.
    Applying these inequalities at the correspondingly shifted radii proves full-radius density convergence.
    In the logarithmic case only the lateral term is needed. This is the argument of Petrache and
    Serfaty #cite(label("PetracheSerfaty2017")) Lemma 2.1, with the actual flux in the weak equation.
  Put $S = sum_p N_p \( f_alpha - f_eta \) \( dot.op - p \) lt.eq 0$.
    For a horizontal cutoff $chi$, integration by parts gives
  $ integral chi w \( \| E_eta \|^2 - \| E_alpha \|^2 \) & =
    kappa integral chi S \( nu_eta + nu_alpha - 2 delta_(bb(R)^2) \)\
 & quad - integral S w \( E_alpha + E_eta \) dot.op nabla chi . $
  Distinct-charge terms are nonpositive. An interior self term is $-
    kappa \[ g \( alpha \) - g \( eta \) \] N_p^2$, bounded above by the same expression with $N_p$ in place of
    $N_p^2$. The background contributes at most $2 kappa F_eta$ per particle.
    The commutator and transition terms are bounded by the sum of the two energies and the counts in a fixed-width
    shell, using (10.1).
  To remove that shell, choose $r_j$ realizing the $eta$-limsup.
    Averaging both fixed-cutoff shell energies over $t in \[ r_j + b_0 \, r_j + sqrt(r_j) \]$,
    where $b_0$ exceeds twice the shell width, gives a radius $t_j$ at which their sum is $O \( r_j^(3 \/ 2) \) =
    o \( r_j^2 \)$. Since $t_j \/ r_j arrow.r 1$ and $Q_eta$ is nonnegative and increasing,
  $ frac(Q_eta \( E \, t_j \), t_j^2) gt.eq r_j^2 / t_j^2 frac(Q_eta \( E \, r_j \), r_j^2) . $
  Thus these radii still realize the $eta$-limsup. Only an upper limsup bound is needed for
    $Q_alpha \( E \, t_j \) \/ t_j^2$. The count shell is $o \( t_j^2 \)$ by the density conclusion. Hence
  #[#set math.equation(numbering: n => "(10.2)")
   $ cal(W)_eta \( E \) lt.eq cal(W)_alpha \( E \) + 2 kappa F_eta \, wide
     0 < alpha < eta < eta_0 . $ <eq:normalized-almost-monotonicity>]
  These selected radii suffice for the upper-limit comparison.
    Comparing with one fixed cutoff proves a uniform lower bound;
    then (10.2) proves existence of the full cutoff limit and
  #[#set math.equation(numbering: n => "(10.3)")
   $ - C_s lt.eq cal(W)_eta \( E \) lt.eq cal(W) \( E \) + 2 kappa F_eta . $ <eq:normalized-cutoff-bound>]
  If every cutoff has infinite energy, the conclusion is immediate.
    These arguments also hold with integer multiplicities. A canonical unit-lattice field has finite renormalized
    value, so $- oo < m < oo$. ◻
]

=== 10.2 A minimizing stationary law and its close-pair defect <a-minimizing-stationary-law-and-its-close-pair-defect>

The cutoff estimate does not exclude rare clusters. We now use translation averages to obtain a stationary law for
  which their contribution can be measured exactly. Fix the unit square $Q = \[ - 1 \/ 2 \, 1 \/ 2 \)^2$ and a
  decreasing dyadic sequence $eta_ell arrow.b 0$ beginning with $eta_1 = eta'$.
  For distinct locations define the nonnegative kernel

$ q_eta \( p - q \) = f_eta \( p - q \, 0 \) + integral f_eta \( X - \( p \, 0 \) \) thin d
  delta_q^(\( eta \)) \( X \) . $

It vanishes when $\| p - q \| gt.eq 2 eta$. Anchor each ordered pair at its first point and define the measure

$ mu_eta = kappa sum_(p in cal(C)) (sum_(q in cal(C) \\ { p }) q_eta \( p - q \)) delta_p . $

#thm([Lemma 10.3.])[
  (Stationary minimizers with vanishing defect).  #emph[There is a horizontally stationary probability law $P$ on
    compatible simple gradient fields in the fixed-$p$ class, supported on $cal(W) \( E \) = m$.
    For the selected dyadic cutoffs, put
$ a_eta = bb(E)_P cal(W)_eta \( E \) \, wide D_eta = bb(E)_P mu_eta \( Q \) . $

 Then $a_eta arrow.r m$ and $0 lt.eq D_eta lt.eq m - a_eta + 2 kappa F_eta arrow.r 0$.
   For each selected $eta$, one can choose a realization for which the spatial averages of every selected cutoff
   energy have finite limits, the density $d_eta = lim_(R arrow.r oo) R^(- 2) mu_eta \( K_R \)$ satisfies $d_eta
   lt.eq 2 D_eta$, and, when $k = 1$, for every fixed $epsilon > 0$,
$ frac(1, epsilon^4 R^2) integral_(K_R times { \| y \| > epsilon^2 R \/ 4 }) w \| E \|^2 arrow.r 0 . $

]
] <lem:stationary-field-minimizers>

#proof[
  Choose simple fields $E^j$ with $cal(W) \( E^j \) lt.eq m + 1 \/ j$.
    For each $j$ choose one radius $S_j$, with $S_j \/ j arrow.r oo$,
    large enough that the upper limsup estimates for $E^j$ hold simultaneously at $eta_1 \, dots.h \,
    eta_j$ on $K_(S_j + 2 j)$. This enlargement handles all observation windows contained in the centered
    exhaustion square $K_(2 j)$. This is possible because there are only finitely many estimates at each stage.
    Let $P_j$ be the law of $\( E^j \( dot.op + \( x \, 0 \) \) \, nu_j \( dot.op + x \) \)$ when $x$ is uniform
    in $K_(S_j)$. For the unit square $Q$ fixed above, Tonelli’s theorem and the enlargement by $2
    j$ give the limiting bounds
  #[#set math.equation(numbering: n => "(10.4)")
   $ limsup_j integral Gamma_(eta_ell) thin d P_j lt.eq m + 2 kappa F_(eta_ell) + kappa g \( eta_ell \) \, wide
     Gamma_eta \( E \) = integral_(Q times bb(R)^k) w \| E_eta \|^2 . $ <eq:normalized-orbit-bound>]
  The analogous bounds hold on every fixed base square.
  Here are the compactness details. Use $H_(upright("loc"))^(- r)$ for $E$, with $r > \( 2 + k \) \/ 2 + 1$,
    together with the vague topology for the positive charge measure.
    Bounded local $L^p$ sets are relatively compact in the first space.
    Equation (10.1) bounds second moments of local counts. Weighted Hölder bounds $E_eta$ in local unweighted
    $L^p$ when $p < min \( 2 \, 2 \/ s \)$; the singular correction belongs to local $L^p$ when $p <
    3 \/ \( s + 1 \)$. For the logarithm both requirements reduce to $p < 2$.
    Thus Markov’s inequality and a countable exhaustion give tightness.
    Allow multiplicities in the resulting integer point measure.
  On sets with bounded local counts, vague convergence identifies every fixed singular correction distributionally
    (indeed in the permitted local $L^p$ topology). On bounded-energy subsequences,
    the truncated fields have weak $L^2 \( w \)$ limits, identified by that correction.
    It is this weighted convergence that passes the smeared divergence equation,
    since test gradients belong to $L^2 \( w \)$. Adding back the singular correction recovers the unsmeared
    equation; weighted Cauchy–Schwarz and the locally integrable singular flux give $w E in L_(upright("loc"))^1$.
    Distributional curl remains zero and the local $L^p$ bounds persist,
    so the limit is a gradient in the prescribed class. These statements hold on compact sets of arbitrarily large
    probability, by a summable allocation of the Markov bounds.
    They therefore apply to the limiting law, not merely to a deterministic subsequence of configurations.
  Weighted quadratic energy is lower semicontinuous in this topology. On a bounded cylinder this follows also from
  $ integral w \| F \|^2 = sup_(psi in C_c^oo) (2 chevron.l F \, psi chevron.r - integral w^(- 1) \| psi \|^2) . $
  Take the increasing supremum over cylinder heights for the full extension integral.
    Consequently a subsequential law $P$ satisfies (10.4) with $P$ in place of $P_j$.
    At this point the limit law is supported on compatible gradients and has the required energy bounds;
    it may still have multiple charges. It is horizontally stationary:
    for a fixed translation $z$, the total variation discrepancy of an orbit law and its translate is at most $\|
    K_(S_j) triangle.stroked.t \( K_(S_j) + z \) \| \/ S_j^2 arrow.r 0$.
  The $L^1$ pointwise and mean ergodic theorems along tempered Følner sequences #cite(label("Lindenstrauss1999"))
    Section 1, applied to the centered square sequence in $bb(Z)^2$,
    apply to each integrable observable $Gamma_(eta_ell)$. The tiled sums of this observable are exactly the raw
    energies on integer squares; positivity and nested squares extend the limits to every real radius.
    Each limit is the conditional expectation of its observable on the $bb(Z)^2$-invariant sigma-algebra.
    It may depend on the realization; no ergodicity of $P$ is assumed.
    Its expectation equals the mean of the observable. Thus, on one event of full probability for all selected cutoffs,
  $ a_(eta_ell) := bb(E)_P cal(W)_(eta_ell) = bb(E)_P Gamma_(eta_ell) - kappa g \( eta_ell \) lt.eq m +
    2 kappa F_(eta_ell) . $
  Fatou and the uniform lower bound give $bb(E)_P cal(W) lt.eq m$.
    This does not yet use minimality, because the limit could have multiplicities.
    It shows that $cal(W)$ is finite and integrable. Equation (10.3) then gives dominated convergence $a_(eta_ell)
    arrow.r bb(E)_P cal(W)$.
  #emph[Unit intensity and simplicity.] The local count bound gives finite point intensity $rho$.
    In the logarithmic case the expected smeared PDE immediately gives $rho = 1$ by horizontal stationarity.
    In the extension case, let $b_eta \( y \) = bb(E)_P \( E_eta \)_y$ and let $mu_(eta \, y)$ be the vertical
    probability marginal of one smeared charge. Jensen gives $integral \| y \|^gamma \| b_eta \|^2 < oo$,
    and the mean PDE is
  $ - partial_y \( \| y \|^gamma b_eta \) = kappa \( rho mu_(eta \, y) - delta_0 \) . $
  Outside $\[ - eta \, eta \]$ the weighted flux is constant on each tail.
    They must vanish, since $integral_1^oo y^(- gamma) thin d y = oo$. Integrating the equation proves $rho = 1$.
  For cutoffs $0 < alpha < eta$ from the selected dyadic sequence, put $d =
    sum_p \( f_eta - f_alpha \) \( dot.op - p \)$, counting labeled particles. Then
  #[#set math.equation(numbering: n => "(10.5)")
   $ w \( \| E_alpha \|^2 - \| E_eta \|^2 \) = "div" \[ w d \( E_alpha + E_eta \) \] +
     kappa d \( nu_alpha + nu_eta - 2 delta_(bb(R)^2) \) . $ <eq:normalized-two-cutoff-local>]
  At positive cutoffs the kernels in $d$ are bounded and have finite range.
    The second count moment and Cauchy–Schwarz justify all local expected products.
    Test with a smooth horizontal function of integral one and, if needed,
    a vertical cutoff equal to one on $\| y \| lt.eq eta$. Stationarity annihilates the expected horizontal
    divergence; the vertical cutoff varies outside the support of $d$.
    Separating self, distinct-labeled-pair, and background terms gives exactly
  #[#set math.equation(numbering: n => "(10.6)")
   $ D_(alpha \, eta) = a_alpha - a_eta + 2 kappa \( F_eta - F_alpha \) \, wide D_(alpha \, eta) gt.eq
     0 . $ <eq:normalized-two-cutoff-mean>]
  Here $D_(alpha \, eta)$ is the ordered-pair intensity of the kernel
  $ kappa
    integral \( f_eta - f_alpha \) \( X - \( p \, 0 \) \) \( d delta_q^(\( alpha \)) + d delta_q^(\( eta \)) \) \(
    X \) \, wide p eq.not q upright(" as labeled particles") . $
  A coincident pair contributes $kappa \[ g \( alpha \) - g \( eta \) \]$.
    If $c_(upright("coll")) = bb(E)_P sum_(p in Q) N_p \( N_p - 1 \)$, then
  $ 0 lt.eq kappa \[ g \( alpha \) - g \( eta \) \] c_(upright("coll")) lt.eq D_(alpha \, eta) . $
  The right side stays bounded as $alpha arrow.b 0$, whereas $g \( alpha \) arrow.r oo$.
    Hence $c_(upright("coll")) = 0$; stationarity and a countable tiling show simplicity almost surely.
    Only now do we use $cal(W) gt.eq m$, proving $cal(W) = m$ almost surely and $a_(eta_ell) arrow.r m$.
  We have obtained simple minimizing fields. The remaining task is to select one whose close pairs and vertical
    tail remain controlled during screening.
  #emph[Vanishing defect and selection of a realization.] Fatou in (10.6), with only $alpha arrow.b 0$, gives
  #[#set math.equation(numbering: n => "(10.7)")
   $ 0 lt.eq D_eta := kappa bb(E)_P sum_(p in Q) sum_(q eq.not p) q_eta \( p - q \) lt.eq m - a_eta +
     2 kappa F_eta arrow.r 0 . $ <eq:normalized-defect-small>]
  The measure $mu_eta$ thus has finite mean intensity $D_eta$. The ergodic theorem therefore gives its spatial density
  $ d_eta \( E \) = lim_(R arrow.r oo) frac(mu_eta \( K_R \), R^2) \, wide bb(E)_P d_eta = D_eta $
  almost surely. For $k = 1$, apply the same ergodic theorem to the raw energy over each fixed integer height $\|
    y \| > z > 1$. These integrable observables decrease to zero,
    so their spatial densities decrease to zero almost surely.
    Intersect all the energy, tail, and selected defect events, a countable family of full-measure events.
    For each selected $eta$, choose a realization $\( E \, cal(C) \)$ in this intersection with $d_eta lt.eq
    2 D_eta$; if $D_eta = 0$, choose $d_eta = 0$. This realization may depend on $eta$.
    For every fixed $epsilon > 0$, define
  #[#set math.equation(numbering: n => "(10.8)")
   $ e_(epsilon \, R) := frac(1, epsilon^4 R^2) integral_(K_R times { \| y \| > 1 / 4 epsilon^2 R }) w \| E \|^2
     arrow.r 0 . $ <eq:normalized-moving-tail>]
  The coefficient $1 / 4$ in this threshold is fixed independently of the cutoffs and the realization.
    Indeed, compare the moving height with each fixed integer height and then let that fixed height tend to
    infinity. No uniform rate in $epsilon$ is needed. ◻
]

=== 10.3 Screening at a fixed cutoff <screening-at-a-fixed-cutoff>

We use the rectangular shell construction of Petrache and Serfaty #cite(label("PetracheSerfaty2017")) Section 6.2.
  The next lemma records the precise input and output needed here;
  the proof supplies the local field equations and their constants in the present normalization.

#thm([Lemma 10.4.])[
  (Screening without new close pairs).  #emph[Fix the auxiliary cutoff $eta'$ chosen above and $0 < eta < eta'$.
    Let $E$ be a compatible simple gradient field for which
$ M_(R \, rho) := R^(- 2) Q_rho \( E \, R \) $

 has a finite limit for $rho = eta \, eta'$. If $k = 1$, suppose also that $e_(epsilon \, R)$ defined in (10.8)
   tends to zero for every fixed $epsilon > 0$; set $e_(epsilon \, R) = 0$ if $k = 0$.
   For every $0 < epsilon < 1 \/ 8$ and every sufficiently large integer $R$,
   there are exactly $R^2$ distinct points $hat(Lambda) subset
   K_R$ and a field $hat(E)$ with zero exterior normal flux satisfying
$ - "div" \( w hat(E) \) =
  kappa (sum_(p in hat(Lambda)) delta_(\( p \, 0 \)) - upright(bold(1))_(K_R) delta_(bb(R)^2)) . $

 Its truncation has finite weighted energy and obeys
$ R^(- 2) integral_(K_R times bb(R)^k) w \| hat(E)_eta \|^2 & lt.eq M_(R \, eta) +
  C_(s \, eta') epsilon \( 1 + g \( eta \) \) \( 1 + M_(R \, eta) + M_(R \, eta') \) + o_R \( 1 \)\
 & quad + C_s e_(epsilon \, R) epsilon^(1 + min \( 2 gamma \, 0 \)) . $

 Every pair in $hat(Lambda)$ at distance below $2 eta$ is a retained pair of the original configuration in $K_R$,
   and every point has distance at least $a_0 \/ 2$ from $partial K_R$. The field $hat(E)$ need not be a gradient.
   All constants are independent of $R$ and the realization; $R$ is chosen after $eta' \, eta$, the field,
   and $epsilon$.]
] <lem:field-screening>

#proof[
  Keep the field and both cutoffs fixed. We first choose the inner cylinder where its truncated field is retained,
    then construct the shell and caps. Coarea supplies an inner rectangle $K'_R$ whose corresponding faces are at
    distances between $epsilon R$ and $2 epsilon R$ from the outer boundary, with
  $ integral_(partial K'_R times bb(R)^k) w \| E_eta \|^2 lt.eq C M_(R \, eta) epsilon^(- 1) R \, quad
    integral_(\( partial K'_R \)_b times bb(R)^k) w \| E_(eta') \|^2 lt.eq C M_(R \, eta') epsilon^(- 1) R \, $
  where $b$ is a fixed sufficiently large shell width and $M_(R \, rho) = R^(- 2) Q_rho \( E \, R \)$.
    For $k = 1$, choose $ell in \[ 1 / 2 epsilon^2 R \, epsilon^2 R \]$.
    Such a height with the required trace bound exists because
  $ integral_(1 / 2 epsilon^2 R)^(epsilon^2 R) (integral_(K'_R times { plus.minus t }) w \| E \|^2) thin d t &
    lt.eq integral_(K_R times { \| y \| > 1 / 4 epsilon^2 R }) w \| E \|^2\
 & = epsilon^4 R^2 e_(epsilon \, R) . $
  Dividing by the interval length $1 / 2 epsilon^2 R$ gives
  $ integral_(K'_R times { plus.minus ell }) w \| E \|^2 lt.eq 2 epsilon^2 R e_(epsilon \, R) . $
  For $k = 0$, retain the choice $ell = epsilon^2 R$. In both cases $R$ is then taken large enough that $ell > 2
    sqrt(2)$. The fixed-cutoff energy limits bound both $M$’s as $R arrow.r oo$.
  Let $D_0 = K'_R times \[ - ell \, ell \]^k$, $A_(upright("sh")) = \| K_R \| - \| K'_R \|$, and, when $k = 1$,
    let $T_plus.minus$ be the outward weighted flux of the old field through the top and bottom of $D_0$.
    The cap constants must be
  #[#set math.equation(numbering: n => "(10.9)")
   $ C^plus.minus = - frac(T_plus.minus, A_(upright("sh")) ell^gamma) . $ <eq:normalized-two-caps>]
  They impose separate compatibility in the disconnected upper and lower caps $K_R times \( ell \, R \)$ and $K_R
    times \( - R \, - ell \)$. For $k = 0$ all $T_plus.minus \, C^plus.minus$ and cap terms are omitted.
    Let $Lambda_0 = { p in cal(C) : "dist" \( p \, partial K'_R \) lt.eq
    eta }$ be the retained crossing centers and $rho_0 = sum_(p in Lambda_0) N_p
    delta_p^(\( eta \))$ their full smeared measure. The retained old centers are
    $Lambda_(upright("old")) = \( cal(C) ∩ K'_R \) union Lambda_0$; $N_(upright("old"))$ counts all of them,
    including multiplicity if present. All pieces assembled below are finite-energy components of the
    #emph[truncated] field. In particular the new-charge component uses smeared sources;
    the point singularities are restored only after the pieces have been assembled.
    On a shell cell $H_i$, denote the old side flux by $B_i =
    integral_(\( partial K'_R ∩ partial H_i \) times \[ - ell \, ell \]^k) w E_eta dot.op nu_0$,
    where $nu_0$ points outward from $D_0$. The truncated shell field is the sum of five components, constructed below:
  #[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Field
], table.cell(rowspan: 1, colspan: 1)[Role in the shell
]),
  table.cell(rowspan: 1, colspan: 1)[$E_(upright("cross"))$
], table.cell(rowspan: 1, colspan: 1)[Complete the retained smeared charges across the inner boundary.
],
  table.cell(rowspan: 1, colspan: 1)[$E_(upright("vert"))$
], table.cell(rowspan: 1, colspan: 1)[Match the upper and lower cap data.
],
  table.cell(rowspan: 1, colspan: 1)[$E_(upright("side"))$
], table.cell(rowspan: 1, colspan: 1)[Match the old lateral flux and the ideal background density.
],
  table.cell(rowspan: 1, colspan: 1)[$E_(upright("round"))$
], table.cell(rowspan: 1, colspan: 1)[Correct the density when cell masses are rounded to integers.
],
  table.cell(rowspan: 1, colspan: 1)[$E_(upright("new"))$
], table.cell(rowspan: 1, colspan: 1)[Place new smeared charges against the rounded background.
],
)
]
  For $k = 0$, $E_(upright("vert")) = 0$ and there are no caps.
    We use two independent fixed partitions of the shell, so that corner completion and integer charge counts do
    not require moving its faces.
  For the large cells, include the coordinates of every inner and outer face as breakpoints in each coordinate
    axis. Subdivide each resulting interval into lengths in $\[ ell \, 2 ell \]$,
    and remove the product cells inside $K'_R$. The remaining rectangles $H_i$ form a connected annular grid.
    Adjacent rectangles share full edges of length at least $ell$,
    and there are $O_epsilon \( 1 \)$ rectangles at fixed $epsilon$.
    All the one-dimensional intervals exceed $ell$ for sufficiently large $R$ and the chosen small $epsilon$.
  We spell out the field estimates needed in this construction.
    First consider a fixed cell $Omega = S times \[ - 1 \, 1 \]^k$,
    where $S$ is a rectangle with sidelengths in $\[ 1 \, 2 \]$; when $k = 0$, take $Omega = S$.
    Suppose the cell carries a restriction $nu$ of smeared charges, of total mass $Q$.
    A constant outward normal component $b_F$ on a chosen lateral face $F$ is compatible with $L h =
    kappa nu$ precisely when
  $ b_F integral_F w = - kappa Q . $
  Use the representative $u$ of weighted cell mean zero; compatibility allows this choice because the Neumann
    functional annihilates constants. The weighted Poincaré and trace estimates on these cells can be seen
    directly. Apply ordinary Poincaré and trace in the horizontal variables,
    then integrate against $\| y \|^gamma$. In the vertical variable use
  $ \| v \( y \) - v \( z \) \|^2 lt.eq (integral_(- 1)^1 \| t \|^gamma \| v' \( t \) \|^2 thin d t)
    (integral_(- 1)^1 \| t \|^(- gamma) thin d t) . $
  Both $w$ and $w^(- 1)$ are integrable on this interval because $- 1 < gamma < 1$.
    Averaging this inequality proves weighted Poincaré and the trace bound at $y = 0$;
    horizontal trace gives the lateral-face bound. The constants are uniform over the stated sidelengths.
  For the extension, reflect across the coordinate faces of the base rectangle $S$, which preserves $w$.
    If $k = 1$, extend in $y$ only to $\[ - 3 \/ 2 \, 3 \/ 2 \]$,
    reflecting each added collar into $1 \/ 2 < \| y \| < 1$,
    where the original and reflected weights are comparable. Multiply by a smooth cutoff equal to one on $Omega$
    and supported in this fixed enlargement. Poincaré controls the term $u nabla chi$ from that multiplication,
    giving an extension $T u$ with
  $ parallel nabla T u parallel_(L^2 \( w \)) lt.eq C_gamma parallel nabla u parallel_(L^2 \( w \; Omega \)) . $
  When $k = 0$, the same construction uses only the horizontal reflections.
  Put $g_eta = g - f_eta$, the fundamental solution capped at $g \( eta \)$.
    The retained centers contributing to this cell lie in a fixed enlargement of it.
    On the support of $T u$, radial integration of the fundamental solution’s flux gives
  $ integral_("supp" \( T u \)) w \| nabla g_eta \( X - \( p \, 0 \) \) \|^2 thin d X lt.eq
    C_s \( 1 + g \( eta \) \) . $
  For $s > 0$ the full-space integral is $kappa g \( eta \)$;
    for the logarithm the integral over a ball of fixed radius is $kappa log \( 1 \/ eta \) + O \( 1 \)$.
    Only this local integral is used. Positivity of the smearing measure then gives
  $ lr(|integral_Omega u thin d delta_p^(\( eta \))|) lt.eq integral \| T u \| thin d delta_p^(\( eta \)) =
    kappa^(- 1) lr(|integral w nabla g_eta \( dot.op - p \) dot.op nabla \| T u \||) lt.eq
    C sqrt(1 + g \( eta \)) thin parallel nabla u parallel_(L^2 \( w \)) . $
  The Neumann functional annihilates constants. Lax–Milgram therefore gives energy at most $C
    N^2 \( 1 + g \( eta \) \)$ when at most $N$ labeled charges contribute and the sum of the absolute prescribed
    face fluxes is at most $C kappa N$. The same proof allows several constant face data whose total is $-
    kappa Q$: apply the trace bound to each face. This proves the local estimate needed from Petrache and
    Serfaty #cite(label("PetracheSerfaty2017")) Lemma 6.6, with the outward flux fixed by $L h = kappa nu$.
  For crossing-charge completion, form a separate tensor grid with sidelengths in $\[ 1 \, 2 \]$,
    again containing all inner and outer face coordinates. Restrict $rho_0$ to its exterior cells times
    $\[ - 1 \, 1 \]^k$. Its exterior support lies within distance $2 eta$ of $partial K'_R$.
    With $2 eta < 1 \/ 2$, every such cell either lies in the first layer outside exactly one inner coordinate
    face, and shares a full face with $K'_R$, or is one of the four diagonal corner cells.
    Route each corner cell to an adjacent first-layer cell through their full shared face.
    These are trees of uniformly bounded size; cells not receiving a corner contribution are single-cell trees.
  All face data in the following construction are constant normal derivatives:
    a prescribed integrated weighted flux $F_0$ means the value $F_0 \/ integral_F w$ on that face.
    On a leaf, prescribe outward weighted flux $- kappa$ times its restricted source mass through the face leading
    to the root. At a root, prescribe the opposite incoming flux through each child face, and export $-
    kappa$ times the total tree mass through its full inner face. All other face data are zero.
    More generally the outgoing flux of a tree vertex is $- kappa$ times the mass in its subtree.
    The sum of its outward fluxes is exactly $- kappa$ times its own source mass,
    so the cell problems are compatible. Internal normal fluxes cancel.
    This gives one global completion field $E_(upright("cross"))$ with source $kappa rho_0$ on the exterior part,
    and a nonnegative outlet density
  $ j = - E_(upright("cross")) dot.op nu_(upright("shell")) =
    sum_(F med upright("outlet")) upright(bold(1))_F frac(kappa Q_F, integral_F w) quad
    upright("on the inner shell boundary") . $
  Here $Q_F$ is the total tree mass and $nu_(upright("shell")) = - nu_0$. Figure 3 shows the local corner relay.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.7, 2.7), fill: rgb("#ededed"), stroke: none)
  rect((-2.7, -2.7), (2.7, 2.7), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((0, -2.7), (0, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((-2.7, 0), (0, 0), stroke: (thickness: 0.65pt, cap: "round", miter-limit: 10))
  line((0, 2.7), (0, 0), (2.7, 0), stroke: (thickness: 1.0pt, cap: "round", miter-limit: 10))
  content((1.494, 1.89), [#text(size: 9pt)[$K'_R$]])
  content((-1.53, 2.268), [#text(size: 9pt)[side root]])
  content((-1.404, -2.016), [#text(size: 9pt)[corner cell]])
  content((1.44, -1.764), [#text(size: 9pt)[another#linebreak()side cell]])
  line((-1.476, -1.17), (-1.476, 0.936), stroke: (thickness: 0.85pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.582, -0.2855), [#text(size: 9pt)[$Q_( upright(d) )$]], anchor: "east", padding: 0.1176cm)
  line((-1.332, 1.224), (0, 1.224), stroke: (thickness: 0.85pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.35, 1.71), [#text(size: 9pt)[$Q_( upright(d) )+Q_( upright(r) )$]])
  circle((0.144, 0.144), radius: 0.396, stroke: (thickness: 0.65pt, cap: "round", miter-limit: 10))
  circle((0.144, 0.144), radius: 0.0441, fill: black, stroke: none)
  line((0.198, 0.198), (0.774, 0.612), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((0.774, 0.612), [#text(size: 9pt)[$p$]], anchor: "west", padding: 0.07056cm)
  line((0.45, -0.108), (0.954, -0.522), stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((0.954, -0.522), [#text(size: 9pt)[$eta$-ball]], anchor: "west", padding: 0.07056cm)
})],
    caption: [Figure 3: Auxiliary-cell routing near an inner corner (base-plane view). The corner cell has no full face on $K'_R$, so its restricted smeared mass $Q_(upright(d))$ is routed to the side root, whose own restricted mass is $Q_(upright(r))$. The arrows indicate mass routing. On each outgoing face, the assigned integrated outward flux is $- kappa$ times the indicated mass; the internal face fluxes cancel. One retained center and the section of its $eta$-ball are illustrated. These auxiliary cells are independent of the large cells $H_i$ and of the rectangles used for new particles. The completion field $E_(upright("cross"))$ is added to the other shell fields. ],
  ) <fig:normalized-corner-routing>
  The completion field is not cut at the boundaries of the large cells $H_i$;
    thus no trace on an arbitrary such cut is required. The local count estimate and bounded overlap of the unit
    trees give
  $ integral w \| E_(upright("cross")) \|^2 lt.eq C \( 1 + g \( eta \) \) sum_(upright("trees"))
    N_(upright("tree"))^2 \, wide integral_(partial K'_R times bb(R)^k) w j^2 lt.eq
    C sum_(upright("trees")) N_(upright("tree"))^2 lt.eq C \( 1 + M_(R \, eta') \) epsilon^(- 1) R . $
  The additive $1$ in the count-square bound is required.
  The crossing field now completes every retained smeared charge and provides its actual outlet flux on the inner
    boundary. We next balance that flux against the background, then choose an integer number of new particles.
  For each large cell set $Q_i = integral_(\( partial K'_R ∩ partial H_i \) times \[ - ell \, ell \]^k) w j$,
    its actual inner-face outlet flux. This need not equal the restricted source mass $kappa
    rho_0 \( H_i times \[ - ell \, ell \]^k \)$, because the completion field may transport that source across a
    large-cell boundary. Define the ideal density by
  #[#set math.equation(numbering: n => "(10.10)")
   $ kappa \( m_i - 1 \) \| H_i \| = B_i - ell^gamma \( C^(+) + C^(-) \) \| H_i \| -
     Q_i . $ <eq:normalized-shell-density>]
  Since $sum_i Q_i = kappa rho_0 \( D_0^c \)$, Gauss’ equation and (10.9) give $sum_i m_i \| H_i \| = R^2 -
    N_(upright("old")) = : N_(upright("new")) in bb(N)$. At fixed parameters the lateral-flux,
    cap-flux and outlet bounds make $max_i \| m_i - 1 \| arrow.r 0$ as $R arrow.r oo$;
    choose this maximum below $1 \/ 4$. For example the outlet term divided by $\|
    H_i \|$ is bounded by $C \( 1 + M_(R \, eta') \) epsilon^(- 5) R^(- 1)$.
  Set $r_i = m_i \| H_i \|$. Round the $r_i$ down, and increase the required number of entries by one,
    obtaining integers $n_i$ with $sum_i n_i = N_(upright("new"))$ and $\| n_i - r_i \| lt.eq 1$.
    Put $tilde(m)_i = n_i \/ \| H_i \|$. For large $R$ these densities lie in $\[ 1 \/ 2 \, 3 \/ 2 \]$.
    To compensate this rounding, write $delta_i = n_i - r_i$, whose sum is zero,
    and choose a rooted spanning tree of the large-cell adjacency graph.
    On the face from a child cell $i$ to its parent prescribe outward weighted flux $-
    kappa sum_(a upright(" in the subtree of ") i) delta_a$, with opposite flux on the adjacent cell.
    The total outward flux of cell $i$ is $- kappa delta_i$. There is therefore a compatible Neumann field
    $E_(upright("round") \, i)$ with source $kappa delta_i \| H_i \|^(- 1) delta_(bb(R)^2)$, these face fluxes,
    and zero flux on all other faces, including the caps. The paired fluxes make the union $E_(upright("round"))$
    a global field. It has no flux through the inner or outer shell boundary.
    After dilation by $ell$, weighted trace and Poincaré on rectangles of bounded aspect ratio give
  $ integral w \| E_(upright("round")) \|^2 lt.eq
    cases(delim: "{", C_(s \, epsilon) ell^(- s) \, & s > 0 \,, C_epsilon \, & s = 0 .) $
  Indeed there are $O_epsilon \( 1 \)$ cells and each tree flux is $O_epsilon \( 1 \)$;
    the unit-scale variational problem has bounded energy, and dilation scales it by $ell^(- s)$ for Riesz kernels
    and by one for the logarithm. This is $o \( R^2 \)$ at fixed parameters.
    For sufficiently large $R$, every sidelength of $H_i$ is at least $ell > 2 sqrt(2) gt.eq
    2 tilde(m)_i^(- 1 \/ 2)$, and $tilde(m)_i \| H_i \| = n_i in bb(N)$.
    Thus Petrache and Serfaty #cite(label("PetracheSerfaty2017")) Lemma 6.3 partitions $H_i$ into $n_i$ rectangles
    of area $1 \/ tilde(m)_i$, with every sidelength in
  $ [1 / 4 tilde(m)_i^(- 1 \/ 2) \, 4 tilde(m)_i^(- 1 \/ 2)] subset \[ a_0 \, a_1 \] . $
  In particular, the lower bound $a_0$ fixed at the start applies to every new-charge rectangle,
    independently of all later choices.
  The vertical correction on each shell cell is the gradient of
  $ h_2 \( y \) =
    frac(ell^gamma, 1 - gamma)
    cases(delim: "{", C^(+) y^(1 - gamma) \, & y gt.eq 0 \,, C^(-) \| y \|^(1 - gamma) \, & y lt.eq 0 .) $
  It has source $- ell^gamma \( C^(+) + C^(-) \) delta_(bb(R)^2)$.
    The side-flux correction has the opposite cap source plus $kappa \( m_i - 1 \) delta_(bb(R)^2)$ and datum $-
    E_eta dot.op nu_0 + j$ on the inner side, with zero data elsewhere. Equation (10.10) is exactly its compatibility.
  The large-cell estimate used for this correction is as follows.
    Let $H$ have sidelengths in $\[ ell \, 2 ell \]$, set $Omega = H times \[ - ell \, ell \]$ and $Sigma =
    partial H times \[ - ell \, ell \]$, and let $- 1 < gamma < 1$.
    For a constant $a$ and $b in L^2 \( Sigma \, \| y \|^gamma \)$ satisfying
  $ a \| H \| = - integral_Sigma \| y \|^gamma b \, $
  the weak Neumann problem
  $ - "div" \( \| y \|^gamma nabla h \) = a delta_(bb(R)^2) quad upright("in ") Omega \, wide partial_nu h =
    b quad upright("on ") Sigma \, wide partial_nu h = 0 quad upright("on ") H times { plus.minus ell } $
  has a solution modulo constants and obeys
  #[#set math.equation(numbering: n => "(10.11)")
   $ integral_Omega \| y \|^gamma \| nabla h \|^2 lt.eq C_gamma
     (a^2 ell^(3 - gamma) + ell integral_Sigma \| y \|^gamma \| b \|^2) lt.eq
     C_gamma ell integral_Sigma \| y \|^gamma \| b \|^2 . $ <eq:large-cell-side-estimate>]
  The constants depend only on $gamma$ and the stated aspect-ratio bounds.
    To see the scaling, choose the weighted-mean-zero representative.
    Weighted Poincaré and the one-dimensional trace inequalities, after dilation by $ell$, give
  $ integral_H \| h \( x \, 0 \) \|^2 lt.eq C_gamma ell^(1 - gamma) integral_Omega \| y \|^gamma \| nabla
    h \|^2 \, wide integral_Sigma \| y \|^gamma \| h \|^2 lt.eq
    C_gamma ell integral_Omega \| y \|^gamma \| nabla h \|^2 . $
  Testing the weak equation gives the first inequality in (10.11).
    Compatibility, $\| H \| asymp ell^2$, and $integral_Sigma \| y \|^gamma asymp ell^(gamma + 2)$ give $a^2
    ell^(3 - gamma) lt.eq C_gamma ell integral_Sigma \| y \|^gamma \| b \|^2$, which proves the second.
    This is the constant-source case of Petrache and Serfaty #cite(label("PetracheSerfaty2017")) Lemma 6.4,
    with the source coefficient written explicitly. For the logarithm use $Omega = H$, $- Delta h = a$,
    and $partial_nu h = b$ on $partial H$; ordinary Poincaré, trace,
    and compatibility give the same final bound $C ell integral_(partial H) \| b \|^2$.
  For the side field on $H_i$, take
  $ a_i = kappa \( m_i - 1 \) + ell^gamma \( C^(+) + C^(-) \) \, wide b_i = - E_eta dot.op nu_0 + j quad
    upright("on its inner face,") $
  with $b_i = 0$ on its other lateral faces. The cap term is omitted when $k = 0$.
    The density equation gives $a_i \| H_i \| = B_i - Q_i = - integral_(Sigma_i) w b_i$ exactly,
    so the cap contribution to the constant source is included in the compatibility estimate.
    The inner faces partition the old lateral boundary. Consequently the old-field coarea bound and the outlet
    bound yield
  $ integral w \| E_(upright("side")) \|^2 & lt.eq C_s ell sum_i integral_(Sigma_i) w \| b_i \|^2\
 & lt.eq
   C_s ell
   (integral_(partial K'_R times \[ - ell \, ell \]^k) w \| E_eta \|^2 + integral_(partial K'_R times bb(R)^k) w j^2)\
 & lt.eq C_(s \, eta') \( epsilon^2 R \) \( epsilon^(- 1) R \) \( M_(R \, eta) + 1 + M_(R \, eta') \)\
 & = C_(s \, eta') epsilon R^2 \( M_(R \, eta) + 1 + M_(R \, eta') \) . $
  Here $Sigma_i = partial H_i times \[ - ell \, ell \]^k$. This calculation supplies the length factor in the
    side-field row of the shell-energy estimate. Its constant may depend on the single fixed auxiliary cutoff
    $eta'$, but not on $eta$, $epsilon$, $R$, or the realization.
  Finally, let $S subset H_i$ be one of the area-$1 \/ tilde(m)_i$ rectangles, with barycenter $p$,
    and work on the fixed cylinder $Omega_S = S times \( - 1 \, 1 \)^k$ (or $Omega_S = S$ when $k = 0$).
    Take the $eta$-truncation of the neutral Neumann field with source
    $kappa \( delta_(\( p \, 0 \)) - tilde(m)_i upright(bold(1))_S delta_(bb(R)^2) \)$ and zero normal component
    on its entire boundary.
    The truncated source is $kappa \( delta_p^(\( eta \)) - tilde(m)_i upright(bold(1))_S delta_(bb(R)^2) \)$.
    Extend this truncated field by zero into $H_i times \[ - ell \, ell \]^k$ and the shell.
    The sidelength bounds $\[ a_0 \, a_1 \]$, fixed height, and $eta < a_0 \/
    16$ keep the charge uniformly away from the cell boundary.
    To verify its energy, write the point-source potential as $g \( dot.op - \( p \, 0 \) \) + v$. The correction solves
  $ L v = - kappa tilde(m)_i upright(bold(1))_S delta_(bb(R)^2) \, wide partial_nu v = -
    partial_nu g \( dot.op - \( p \, 0 \) \) quad upright("on ") partial Omega_S . $
  The weighted trace and Poincaré estimates give a uniform bound on $integral_(Omega_S) w \| nabla v \|^2$;
    no smoothness across $y = 0$ is needed. Test this compatible weak equation against
    $g_eta \( dot.op - \( p \, 0 \) \)$. The resulting plane integral is uniformly bounded because $s < 2$,
    and the boundary terms are uniformly bounded by the clearance from the pole.
    Hence $integral_(Omega_S) w nabla v dot.op nabla g_eta = O_s \( 1 \)$.
    The capped fundamental solution itself has energy $kappa g \( eta \) + O_s \( 1 \)$ in $Omega_S$,
    so the truncated cell field has the same energy, uniformly over the allowed rectangles.
    In addition to the preceding $o \( R^2 \)$ bound for $E_(upright("round"))$, the shell fields satisfy
  $ integral w \| E_(upright("cross")) \|^2 & lt.eq C \( 1 + g \( eta \) \) \( 1 + M_(R \, eta') \) epsilon^(- 1) R \,\
integral w \| E_(upright("vert")) \|^2 & lt.eq C e_(epsilon \, R) epsilon^3 R^2 \,\
integral w \| E_(upright("side")) \|^2 & lt.eq C_(s \, eta') epsilon \( M_(R \, eta) + 1 + M_(R \, eta') \) R^2 \,\
integral w \| E_(upright("new")) \|^2 & lt.eq C \( 1 + g \( eta \) \) N_(upright("new")) \, $
  where $N_(upright("new")) = O \( epsilon R^2 \) + o \( R^2 \)$ at fixed parameters.
    The first bound uses the sum of squared tree counts; the third uses the weighted rectangle trace estimate with
    height $ell$. Write $nu_(upright("new") \, eta) = sum_(p med upright("new")) delta_p^(\( eta \))$.
    The five shell fields have combined source
  $ kappa rho_0 - ell^gamma \( C^(+) + C^(-) \) delta_(bb(R)^2) +
    #scale(x: 120%, y: 120%)[\[] kappa \( m_i - 1 \) + ell^gamma \( C^(+) + C^(-) \) #scale(x: 120%, y: 120%)[\]]
    delta_(bb(R)^2) + kappa \( tilde(m)_i - m_i \) delta_(bb(R)^2) +
    kappa \( nu_(upright("new") \, eta) - tilde(m)_i delta_(bb(R)^2) \) \, $
  which is $kappa \( rho_0 + nu_(upright("new") \, eta) - delta_(bb(R)^2) \)$.
    On the inner shell boundary the crossing and side data sum to $- j + \( - E_eta dot.op nu_0 + j \) = -
    E_eta dot.op nu_0$. The rounding field has zero inner data and paired internal data;
    the completion field remains global across the large-cell boundaries. Thus all interface fluxes cancel.
    We sum squared energies only in the shell, where a fixed factor of five is harmless.
    The old field inside $D_0$ is retained exactly, with coefficient one in the energy bound;
    no global factor multiplying its energy is introduced.
  The shell now has the required source and lateral flux. It remains to close the two vertical ends without
    changing these sources.
  The upper and lower weighted harmonic caps are solved separately.
    On the inner horizontal face of the upper or lower cap, prescribe the outward normal derivative $-
    E_eta \( x \, plus.minus ell \) dot.op \( plus.minus e_y \)$ for $x in K'_R$, and $-
    C^plus.minus$ for $x in K_R \\ K'_R$; here $e_y$ is the positive vertical unit vector.
    Prescribe zero normal derivative on every other face. By (10.9), the weighted integral of these data is $-
    T_plus.minus - A_(upright("sh")) ell^gamma C^plus.minus = 0$, so each cap problem is compatible.
    If $u$ is adjusted by its ordinary mean on one cap, ordinary trace and Poincaré, followed by weight comparison, give
  $ integral_(K_R times { ell }) w \| u \|^2 lt.eq C R max { 1 \, \( ell \/ R \)^gamma } integral_(upright("cap"))
    w \| nabla u \|^2 . $
  Testing the compatible cap problem yields total cap energy at most
  $ C e_(epsilon \, R) epsilon^(1 + min \( 2 gamma \, 0 \)) R^2 . $
  The extra factor for $gamma < 0$ is retained. It vanishes at fixed $epsilon$ by (10.8).
    There are no cap terms for $k = 0$.
  Retain $E_eta$ in $D_0$, use the sum of the five finite-energy components in the shell,
    and use the two harmonic cap fields above and below. Extend this assembled field $hat(F)_eta$ by zero past the
    outer square and the cap heights. It has zero exterior normal flux and source
    $kappa \( sum_(p in hat(Lambda)) delta_p^(\( eta \)) - upright(bold(1))_(K_R) delta_(bb(R)^2) \)$,
    where $hat(Lambda)$ consists of the retained old and new barycenter charges, exactly $R^2$ points. Now define
  $ hat(E) = hat(F)_eta + sum_(p in hat(Lambda)) nabla f_eta \( dot.op - \( p \, 0 \) \) . $
  The singular corrections lie inside the outer square by its clearance.
    Thus $hat(E)_eta = hat(F)_eta$ exactly, and the fundamental-solution identity proves the required unsmeared
    divergence equation, with zero exterior normal flux. At fixed cutoffs the preceding bounds give
  #[#set math.equation(numbering: n => "(10.12)")
   $ R^(- 2) integral_(K_R times bb(R)^k) w \| hat(E)_eta \|^2 & lt.eq M_(R \, eta) +
     C_(s \, eta') epsilon \( 1 + g \( eta \) \) \( 1 + M_(R \, eta) + M_(R \, eta') \) + o_R \( 1 \)\
 & quad + C_s e_(epsilon \, R) epsilon^(1 + min \( 2 gamma \, 0 \)) . $ <eq:normalized-screen-estimate>]
  Here $R$ is chosen after $eta \, eta' \, epsilon$. For example,
    the count estimate is controlled once $R gt.double \( 1 + M_(R \, eta') \) epsilon^(- 5)$.
  Every new barycenter is at least $a_0 \/ 2$ from each face of its rectangle.
    Retained old points lie inside $K'_R$ or within $eta$ of its boundary.
    Since $eta < eta_0 lt.eq a_0 \/ 16$ was fixed before the realization was selected,
    every new–old distance is at least $a_0 \/ 2 - eta > 2 eta$.
    Choose the integer radius large enough that $epsilon R - eta gt.eq a_0 \/ 2$;
    this gives the same clearance at the outer boundary and hence at every reflected seam.
    New–new distances and all reflection-seam distances exceed $2 eta$.
    Thus every close pair after screening was already an old close pair. ◻
]

=== 10.4 Reflection, projection, and removal of the cutoff <reflection-projection-and-removal-of-the-cutoff>

#proof[
  Lemma 23 proves existence and the uniform lower bound of the cutoff limit, as well as finiteness of $m$.
    To approximate $m$, choose a selected dyadic cutoff $eta$ and a realization supplied by Lemma 24.
    Apply Lemma 25 after choosing $epsilon$, and then choose its integer radius $R$.
    We now convert that screened field into a canonical periodic gradient and estimate its energy after removing
    the cutoff.
  Reflect the screened square in both coordinate directions and repeat with period $2 R bb(Z)^2$.
    The reflected vector components have matching zero normal flux, so there are no interface charges.
    The period cell has $4 R^2$ points and area $4 R^2$. Reflection multiplies both energy and defect by four.
    The nonnegative defect of the resulting configuration is at most the old anchored defect in $K_R$,
    divided by $R^2$, and hence tends to at most $d_eta \( E \) lt.eq 2 D_eta$.
  Write $E^(upright("per"))$ for the reflected field, which need not be curl free,
    and let $E^(upright("can"))$ be the canonical periodic gradient with exactly its charges and background.
    At fixed cutoff, $D = E^(upright("per")) - E^(upright("can")) = E_eta^(upright("per")) -
    E_eta^(upright("can"))$ belongs to $L^2 \( w \)$ on the full period cylinder and has zero weighted divergence.
    Test against the canonical truncated potential, with vertical cutoffs tending to infinity;
    its nonconstant Fourier modes decay vertically and its zero mode has compactly supported derivative.
    The cross term vanishes, so
  $ integral_(T times bb(R)^k) w \| E_eta^(upright("per")) \|^2 =
    integral_(T times bb(R)^k) w \| E_eta^(upright("can")) \|^2 + integral_(T times bb(R)^k) w \| D \|^2 . $
  Canonical projection therefore decreases the cutoff energy and leaves the configuration defect unchanged.
    It also returns to the prescribed admissible class. For $s > 0$,
    finite truncated $L^2 \( w \)$ energy gives local unweighted $L^p$ by weighted Hölder when $p <
    min \( 2 \, 2 \/ s \)$, and each of the finitely many local singular corrections belongs to $L^p$ when $p <
    3 \/ \( s + 1 \)$. For the logarithm both bounds reduce to $p < 2$.
    Weighted Cauchy–Schwarz and the locally integrable singular flux give $w E^(upright("can")) in
    L_(upright("loc"))^1$. Thus the canonical gradient is a member of $cal(A)_1$ with the exponent fixed at the
    beginning, even though the intermediate screened field was not required to be a gradient.
  For a finite simple periodic configuration, integrate (10.5) over its period cell and let the auxiliary cutoff
    tend to zero. This gives
  #[#set math.equation(numbering: n => "(10.13)")
   $ V \( cal(C) \) - cal(W)_eta \( E_(cal(C))^(upright("can")) \) =
     frac(kappa, \| T \|) sum_(p in T) sum_(q eq.not p) q_eta \( p - q \) -
     2 kappa F_eta . $ <eq:normalized-periodic-defect>]
  The second sum includes periodic images; the self image at zero is the only omitted particle.
  Keep the auxiliary cutoff $eta'$ fixed at its initial value as $eta$ tends to zero.
    For each selected $eta$, take the realization chosen above,
    and choose $epsilon$ so the middle term of (10.12) is as small as desired;
    then choose an arbitrarily large integer $R$ so that all energy and defect limits, the moving-tail estimate,
    the size conditions, and the seam clearance hold simultaneously.
    Subtract $kappa g \( eta \)$, project canonically, and apply (10.13). Equations (10.3) and (10.7) give
  $ V \( cal(C)_(eta \, R) \) lt.eq m + 2 kappa F_eta + o \( 1 \) + 2 D_eta - 2 kappa F_eta = m + 2 D_eta +
    o \( 1 \) . $
  Let the chosen cutoffs tend to zero, taking the screening thickness and integer radius in that order for each
    cutoff. The canonical periodic gradients belong to $cal(A)_1$, so their values are also at least $m$.
    This proves the asserted cubic minimizing sequence. Every use of the box limit preceded removal of the cutoff;
    no interchange of the two limits has been made. ◻
]

== 11 An alternative rational verification procedure <app:floor-certificate>

This appendix proves a conditional alternative to the exact-array interval verification used in Proposition 9.
  If the rational procedure below passes the stronger tables of Section 3,
  its roundoff allowances leave the exact quadrature arrays within the proposition’s looser bounds.
  The complete floor-rounded matrix procedure is not executed by the supplied programs;
  the selected finite certificate uses direct Arb enclosures of the exact arrays.

We use $epsilon.alt = 10^(- 80)$ and the decimal brackets $p_(*) \, b_(*)$ from (9.1) in Appendix 9.
  We first define the rounding and prove its error bounds. The complete listings then specify each finite loop,
  keeping all arithmetic not explicitly rounded exact.

=== 11.1 Componentwise rounding and its error <componentwise-rounding-and-its-error>

For real $x$, let $R \( x \) = epsilon.alt floor.l x \/ epsilon.alt floor.r$.
  Apply $R$ separately to the real and imaginary components of a complex number and entrywise to a matrix.
  For complex rational $w$, define

#[#set math.equation(numbering: n => "(11.1)")
 $ u = R \( w \/ 4096 \) \, wide d_0 = 1 \, wide d_j = R \( d_(j - 1) u \/ j \) quad \( 1 lt.eq j lt.eq 60 \) \,\
x_0 = sum_(j = 0)^60 d_j \, wide x_(j + 1) = R \( x_j^2 \) quad \( 0 lt.eq j < 12 \) \, wide e_(*) \( w \) =
  x_12 . $ <eq:rational-exponential>]

This uses a degree-$60$ polynomial with $61$ terms followed by twelve squarings. Every quantity is rational.
  In the floor prescription, $pi \, b \, sqrt(3)$ are replaced by $p_(*) \, b_(*) \, 2 b_(*)$,
  cosine is evaluated as $"Re" e_(*) \( i w \)$ at the corresponding rational phase $w$, and $B \, h$ remain exact.

In addition to the floors internal to $e_(*)$, the prescription rounds the quadrature points and weights,
  mass entries, and values of $z$ and $lambda$. It rounds the transformed zeroth moment factor and every higher
  moment factor after its divided-power update. It also rounds the projected jet entries, the entries of $Y$,
  every product in the power and partial-sum updates, and both final positive-node coefficient matrices.
  The extra coordinates and all other operations are exact rational arithmetic; in particular,
  the products used to form the Bernstein and tail rows incur no further floors.
  The listings below fix the order of these operations.

A superscript $\#$ denotes the output of this floor prescription.
  Its error is measured against the corresponding exact quadrature array of Section 3:
  for example, $S_(cal(F) cal(F))^(\#)$ is compared with $tilde(S)_(cal(F) cal(F))$,
  $S_(cal(F) e)^(\#)$ with $tilde(S)_(cal(F) e)$, and $Y^(\#) \, X_i^(\#)$ with $Y \, X_i$.
  The error from quadrature to the exact spectral integrals is a different quantity, already bounded in Lemma 7.

#thm([Lemma 11.1.])[
  (Roundoff bounds for rational verification).  #emph[The floor prescription below has the following properties.]
  + #emph[If $\| w \| < 1700$ and $"Re" w < 7$, then $\| e_(*) \( w \) - e^w \| < 10^(- 68)$.
    Every exponential argument in the prescription lies in this domain.]
  + #emph[A computed single-column quadrature moment of order at most $42$,
    scaled by $y^a \/ a !$ with $\| y \| lt.eq 3 \/ 2$, differs from the exact quadrature moment by less than
    $10^(- 48)$. The initial operator-norm errors in $S_(cal(F) cal(F))^(\#)$, $S_(cal(F) e)^(\#)$,
    and $Y^(\#)$ are less than $10^(- 44)$.]
  + #emph[Suppose that either the exact or the rounded computation satisfies the following envelopes:
    every pre-update power in the nine steps has norm below $3$,
    each intermediate partial-sum matrix has norm below $34$, and every combined pair of corresponding $X_1 \,
    X_2$ columns has norm below $5.6$. Then the combined error in a pair of corresponding columns of $X_1^(\#) \,
    X_2^(\#)$ is less than $10^(- 29)$. Every entry of the Bernstein rows $L_(i \, d)^(\#)$ differs from the
    corresponding entry of $L_(i \, d)$ in (3.8) by less than $10^(- 16)$.
    Every lower evaluation in (3.11) and every tail expression in (3.12) has error less than $10^(- 6)$.]
  #emph[The stagewise envelopes in the last item follow from the stronger power and column tables,
    whether those tests are established on the exact arrays by intervals or on the rounded arrays by the
    prescription below.]
] <lem:rational-roundoff>

#proof[
  We control elementary functions first, then a single moment, then the matrix products,
    and finally the scalar lower evaluations. This order keeps the error due to the coefficient lists separate
    from the error in the primitive moments.
  ===== 11.1.1 Exponential approximation. <exponential-approximation.>
  A componentwise floor changes a complex number by less than $2 epsilon.alt$.
    For $r = w \/ 4096$, both $\| r \|$ and $\| u \|$ are below $.416$.
    If $delta_j$ bounds $\| d_j - r^j \/ j ! \|$, then
  $ delta_0 = 0 \, wide delta_j lt.eq .416 / j delta_(j - 1) + frac(2 epsilon.alt thin .416^(j - 1), j !) +
    2 epsilon.alt . $
  The first term propagates the previous error, the second changes $r$ to $u$, and the last is the new floor.
    Summing through $j = 60$ and adding the exponential tail gives
  $ \| x_0 - e^(w \/ 4096) \| lt.eq sum_(j = 0)^60 delta_j +
    frac(e^.416 .416^61, 61 !) < 1.263 dot.op 10^(- 78) < 4 dot.op 10^(- 78) . $
  The factorial tail alone is less than $4 dot.op 10^(- 107)$.
    These are finite rational comparisons after using $e^.416 < e < 2719 \/ 1000$.
  At squaring step $j$, the exact value has modulus at most $e^(7 \/ 2^(12 - j))$.
    While the accumulated error is below one, its amplification factor is at most $2 e^(7 \/ 2^(12 - j)) + 1$.
    Since $2 e^a + 1 lt.eq 3 e^a$ for $a gt.eq 0$, the product of all twelve factors is at most $3^12 e^7$.
    Including all twelve new floors gives
  #[#set math.equation(numbering: n => "(11.2)")
   $ \( 4 dot.op 10^(- 78) + 24 epsilon.alt \) 3^12 e^7 < 2.472 dot.op 10^(- 69) < 10^(- 68) .
     $ <eq:exponential-roundoff-budget>]
  The same bound is below one at every earlier stage, closing the hypothesis used in the amplification estimate.
  The arguments used by the prescription have ample room in the stated domain.
    Density phases have modulus at most $pi dot.op 168$ before the rational perturbations.
    The weight cosines have phase modulus less than $2 pi dot.op 191$.
    Transformed phases have modulus at most $pi \( 44 \/ 15 \) 168 < 1549$ and nonpositive real part by Lemma 6.
    They remain in the left half-plane after substitution: on the real integration interval,
    $"Im" z > .187 \/ pi$, whereas the perturbation of $z$ below is less than $10^(- 65)$.
    The only positive real scalar phases are $K lt.eq 6$ in the support at $m = 0$.
    Every other finite scalar phase is nonpositive with modulus at most $48$.
    Infinite endpoints are evaluated by their limits, not passed to $e_(*)$.
    Thus every call satisfies $\| w \| < 1700$ and $"Re" w < 7$.
  ===== 11.1.2 Primitive masses and moments. <primitive-masses-and-moments.>
  The intermediate absolute error allowances are
  #[#set math.equation(numbering: n => "(11.3)")
   $ upright("quantity") & upright("absolute error bound")\
tau_(j v) & 10^(- 67)\
o_v & 10^(- 65) \/ 384\
z \( t \) \, med lambda \( t \) & 10^(- 65)\
upright("one density value") & 10^(- 60)\
upright("one mass column, summed absolute error") & 10^(- 59)\
F_0 \( t \) \, med G_0 \( t \) & 10^(- 60)\
F_a \( t \) \, med G_a \( t \) \, quad 0 lt.eq a lt.eq 42 & 10^(- 52)\
Q_n \, med D_n & 10^(- 75) . $ <eq:primitive-roundoff-budgets>]
  The comparison values here use the exact quadrature points and the exact constants $pi \, b$.
    We justify each stage rather than infer it from decimal agreement.
  For a weight phase, replacing $pi$ changes the phase by less than $382 epsilon.alt$.
    Add the $10^(- 68)$ exponential error, and use $2 sum_(a = 1)^191 \( 4 a^2 - 1 \)^(- 1) < 1$.
    Including the final floor gives the stated bounds for $tau$ and $o$.
    On the real line, $\| t + i h \| gt.eq h$; the derivative bounds
  $ \| z' \( t \) \| lt.eq B \/ h^2 < 9 \, wide \| partial_t lambda \( t \) \| < 8 \,
    wide \| partial_b lambda \( t \) \| < 4 $
  then give the errors for $z$ and $lambda$. The density phase errors are below $10^(- 63)$ because $n lt.eq 168$.
    Inserting them in the six-term density formulas, using $sum_(l > 0) \| P_l \| = 10$,
    gives the density allowance $10^(- 60)$. The weighted density errors sum to at most $10^(- 60)$ because the
    six positive quadrature rules have total weight one. Weight errors, density errors,
    the $2311$ componentwise mass floors, and atom coefficient errors together contribute less than $10^(- 59)$ to
    the sum of absolute errors in one mass column.
  Each exact mass column has sum of absolute values less than $230$.
    Indeed, the pointwise real-interval density bounds are $2 pi^2 sum_(l > 0) t_l \| P_l \| <
    106$ for a $c_n$ column and $20 pi < 63$ for a $d_n$ column; the constant column has atomic variation $25$.
    Positivity and total density weight one from (3.2) make $230$ a common bound.
  The direct zeroth kernel phase error is below $10^(- 63)$.
    The transformed zeroth phase error is below $6 dot.op 10^(- 63)$,
    and multiplication by $\| lambda \| < 3$ still leaves error below $10^(- 60)$.
    The divided-power arguments $i pi y t$ and $i pi y z$ have modulus below $15$ and error below $10^(- 63)$.
    To see explicitly how these errors enter a higher moment, write either exact factor as $H_a =
    H_0 v^a \/ a !$ and its rounded update as $H_a^(\#) = R \( H_(a - 1)^(\#) v^(\#) \/ a \)$. Here
  $ \| H_0 \| < 3 \, wide \| H_0^(\#) - H_0 \| < 10^(- 60) \, wide \| v \| \, \| v^(\#) \| < 15 \,
    wide \| v^(\#) - v \| < 10^(- 63) . $
  Changing the initial value costs at most $e^15 10^(- 60)$, and changing $v$ costs at most $3 e^15 10^(- 63)$,
    by the derivative of $v^a \/ a !$. A floor introduced at step $j$ is multiplied by $\( v^(\#) \)^(a - j)
    j ! \/ a !$. Since $j ! \/ a ! lt.eq 1 \/ \( a - j \) !$, all the floors together cost at most
  $ 2 epsilon.alt sum_(j = 1)^a 15^(a - j) frac(j !, a !) lt.eq 2 epsilon.alt e^15 . $
  Thus for $0 lt.eq a lt.eq 42$ the total factor error is bounded by
  $ \| H_a^(\#) - H_a \| < e^15 #scale(x: 120%, y: 120%)[\(] 10^(- 60) + 3 dot.op 10^(- 63) +
    2 epsilon.alt #scale(x: 120%, y: 120%)[\)] < 10^(- 52) . $
  The last comparison follows already from $e < 3$. Expanding the moment difference against the rounded mass
    column, whose norm is below $230 + 10^(- 59)$, also retains the product of the two primitive errors.
    The total is at most
  $ \( 230 + 10^(- 59) \) 10^(- 52) + 3 e^15 dot.op 10^(- 59) < 10^(- 48) . $
  Finally, (2.8) and (9.2) give errors below $10^(- 75)$ in $Q_n \, D_n$.
    Jet projection uses $Q_n > 1.75$, $\| D_n \| < 2.12$, and $168$ output coordinates.
    Including its floors, the resulting initial operator errors are less than $10^(- 44)$;
    the same estimate applies to $Y^(\#)$.
  ===== 11.1.3 Powers and coefficient columns. <powers-and-coefficient-columns.>
  A floor on a real matrix with $168$ rows contributes at most $168 epsilon.alt < 10^(- 77)$ in operator norm.
    Let $e_r$ bound the error in $U$ before step $r$, and let $v_r$ bound the error in either partial-sum matrix
    after $r$ steps, with $v_0 = 0$. The assumed stagewise envelopes give $∥U∥ <
    3$ and partial-sum norms below $34$. Comparing products and then adding the floor gives
  #[#set math.equation(numbering: n => "(11.4)")
   $ e_0 < 10^(- 44) \, wide e_(r + 1) lt.eq 7 e_r + 10^(- 77) \, wide v_(r + 1) lt.eq 5 v_r + 34 e_r +
     10^(- 77) . $ <eq:matrix-roundoff-recurrence>]
  More precisely, the square error is at most $\( 6 + e_r \) e_r + 10^(- 77)$,
    and the partial-sum coefficient of $v_r$ is at most $4 + e_r$.
    Induction gives $e_r < 1$ and validates the displayed recurrence. Its finite rational solution yields
  $ max_(0 lt.eq r lt.eq 8) e_r < 5.765 dot.op 10^(- 38) < 10^(- 36) \, wide
    v_9 < 6.529 dot.op 10^(- 36) < 10^(- 34) . $
  If the coarse norms are known for the rounded rather than exact factors,
    exchange their roles in the product difference. The same two inequalities follow.
    This is why the argument is not circular and does not require a rounded matrix inverse.
  The largest combined column norm of $E_1 \, E_2$ is $3.3505$.
    The formulas for $Y$ give $∥Y∥ < 2$, and the transform bound gives the sharper data estimate
    $2 + \( 4000 + 2 dot.op 10^(- 27) \) 3.3505 < 13405$. Its rational perturbation is less than $10^(- 43)$.
    Thus, for every column $j$, $∥\( g_1 \)_j∥_1 + ∥\( g_2 \)_j∥_1 < 20000$ for both the exact and rounded data.
    Applying the two sum/difference formulas in (3.6), including the $168$ real floors in each of the two final
    columns, gives the complete bound
  $ 40000 v_9 + 72 dot.op 10^(- 43) + 336 epsilon.alt < 2.612 dot.op 10^(- 31) < 10^(- 29) . $
  The appended extras are exact. In particular, the term $336
    epsilon.alt$ is part of the column error even though it is negligible numerically.
  ===== 11.1.4 Bernstein and lower-evaluation errors. <bernstein-and-lower-evaluation-errors.>
  A scaled moment against a unit list column has absolute value at most $230 dot.op 3 e^15$.
    Also $\| y \|^(- nu) lt.eq 4$ and $0 lt.eq omega_(d r) lt.eq 1$.
    The contribution from the coefficient-list error to one Bernstein row entry is therefore at most
  $ 41 dot.op 4 dot.op 230 dot.op 3 e^15 dot.op 10^(- 29) < 3.700 dot.op 10^(- 18) . $
  For this decomposition the list difference is evaluated with exact moments;
    the primitive difference is evaluated against the rounded columns.
    The primitive moments therefore contribute separately. The relevant combined column norm is below $6$,
    either directly from the rounded cutoffs or from the exact cutoff $5.6$ and the column error.
    Thus their contribution is at most
  $ 41 dot.op 4 dot.op 6 dot.op 10^(- 48) < 10^(- 44) . $
  The sum of these two contributions is below $10^(- 16)$, as claimed.
    This explicitly includes the primitive-moment addition.
  For completeness, the subsequent minimizations do not amplify that bound to anything close to $10^(- 6)$.
    The same moment bound with combined column norm $6$ shows that each exact Bernstein row entry is below $10^14$
    in modulus. If its entry error is $delta = 10^(- 16)$, then for $x in { 1 \/ K \,
    1 \/ J } subset \[ 0 \, 1 \]$ the error in $a_j + x b_j$ is below $2 delta$.
    A finite endpoint exponential has error below $10^(- 68)$ and modulus at most one;
    the infinite-endpoint values are exact. Each product in (3.7) consequently has error below $2
    delta + \( 2 dot.op 10^14 + 2 delta \) 10^(- 68)$. There are four such products and one unmultiplied term.
    A minimum is nonexpansive in the maximum norm, so the total row lower-evaluation error is less than $2 dot.op
    10^(- 15)$.
  Only the target supports at $m = 0$ and $m = 3$ use a rounded exponential.
    At $m = 0$, $\| K y \| lt.eq 3$, $1 \/ K < 1$, and $sum_(r = 0)^40 3^r \/ r ! < e^3 < 27$,
    so their total weighted error is below $27 dot.op 10^(- 68)$.
    At $m = 3$, $J \/ 2 lt.eq 3$ gives error below $3 dot.op 10^(- 68)$.
    The $m = 1$ support is rational and exact. These additions still leave a bound far below $10^(- 6)$.
  For a tail row from $X_i$, the entry error is below $10^(- 29)$ and its entry modulus is below $6$.
    The same is true for the row obtained by summing the low $d_n$ rows,
    because the combined column norm controls that sum. The preceding five-term argument gives lower-evaluation
    error below $2 dot.op 10^(- 28)$ for each such row. Taking $min \( 0 \, dot.op \)$ does not increase it.
    In (3.12) there are one constant row, one summed row, and two rows for each of $46$ low nodes,
    hence $94$ terms. Their nonnegative reciprocal factors are at most one since $s_0 - n gt.eq 1.5$.
    The tail error is therefore below $94 \( 2 dot.op 10^(- 28) \) < 2 dot.op 10^(- 26)$,
    in particular below $10^(- 6)$. ◻
]

=== 11.2 The complete floor-rounded finite prescription <the-complete-floor-rounded-finite-prescription>

We now specify the alternative rational computation. Every loop has a finite inclusive range.
  The five shell and two list indices are one-based; quadrature and derivative indices start at zero as indicated.
  Products are ordinary matrix or row products, without conjugation.
  An operation not marked $R$ is exact rational arithmetic.
  The imaginary unit is #raw("i"); a list subscript never denotes that unit.
  The symbols $P_l \, Q_n \, D_n$ mean the formulas in (2.6) and (2.8) after the rational substitutions above.

The input order is all $c_n$ for increasing $n in cal(F)$, then all $d_n$, then $c_0 \, d_0 \, C$.
  The $2311$ mass rows are the $6 dot.op 384$ quadrature points in lexicographic order followed by the seven atoms.

#raw(block: true, lang: "Floor-rounded verification: masses and moment factors", "eps = 1/10^80\nR(x) = eps * floor(x/eps)  # separately on complex components\n# pstar,bStar are the two printed 80-digit decimal rationals.\n# e_star uses the degree-60 Taylor polynomial and 12 squarings above.\n\nF_nodes = [n for n=1..168 if n mod 12 in {0,1,3,4,7,9}]\nt_l = l/6 for l=0..6\nfor v=0..383:\n    a0 = (v+1/2)/384\n    o[v] = R((1-2*sum(Re(e_star(2*d*i*pstar*a0))/(4*d*d-1)\n                          for d=1..191))/384)\n    for j=1..6:\n        tau[j,v] = R((2*j-1+Re(e_star(i*pstar*a0)))/12)\n\nW = zero complex matrix with 2311 rows and 171 columns\nfor j=1..6:\n  for v=0..383:\n    t = tau[j,v]\n    for n in F_nodes followed by [0]:\n      for l=j..6:\n        A[l] = (o[v]/6)*2*pstar*e_star(-i*pstar*t*n)\n                            *P[l]*e_star(i*pstar*t_l*n)\n      W[(j,v),c(n)] = R(-pstar*sum((t_l-t)*A[l] for l=j..6))\n      W[(j,v),d(n)] = R(i*sum(A[l] for l=j..6))\nfor j=0..6:\n    W[atom(j),C] = R((1 if j==0 else 2)*P[j])\n\nfunction factors(m,y,end_degree):\n    points = all tau[j,v], followed by t_0,...,t_6\n    for each point t:\n        z[t] = R(-B/(t+i*h)-i*h)\n        lam[t] = R(i/(bStar*(t+i*h)))\n        F[0,t] = e_star(i*pstar*t*m)\n        G[0,t] = R(lam[t]*e_star(i*pstar*z[t]*m))\n        for a=1..end_degree:\n            F[a,t] = R(F[a-1,t]*i*pstar*t*y/a)\n            G[a,t] = R(G[a-1,t]*i*pstar*z[t]*y/a)\n    return F,G")

These moments are scaled by $y^a \/ a !$, which explains the division by $y^nu$ in the later half-gap rows.
  The floor convention can itself be implemented with integers. Put $S = 10^80$.
  For $w = w_r + i w_i$, initialize $u_r = floor.l S w_r \/ 4096 floor.r$ and $u_i =
  floor.l S w_i \/ 4096 floor.r$. Represent a rounded complex number by the two integers obtained after
  multiplication by $S$. The Taylor update is

$ \( d_r \, d_i \) mapsto (⌊frac(d_r u_r - d_i u_i, S j)⌋ \, ⌊frac(d_r u_i + d_i u_r, S j)⌋) \, $

with both right sides evaluated before replacement. The squaring update is

$ \( x_r \, x_i \) mapsto (⌊frac(x_r^2 - x_i^2, S)⌋ \, ⌊frac(2 x_r x_i, S)⌋) . $

Every floor is toward negative infinity, including for negative numerators. These formulas are exactly (11.1).

#raw(block: true, lang: "Floor-rounded verification: projected matrices and columns", "Ssharp = zero matrix with 168 rows and 171 columns\nYsharp = zero matrix with 168 rows and 10 columns\nfor m in F_nodes:\n    F,G = factors(m,1,1)\n    a = Re(G[0,:] * W)\n    d = Re(G[1,:] * W)\n    Ssharp[c(m),:] = R(-a/Q_m)\n    Ssharp[d(m),:] = R((D_m*a-d)/Q_m)\nfor j=1..5:\n    n = [1,3,4,7,9][j]\n    Ysharp[d(n),j]   = R(-1/Q_n)\n    Ysharp[c(n),j+5] = R(1/Q_n)\n    Ysharp[d(n),j+5] = R(-D_n/Q_n)\n\nE = zero matrix with 6 rows and 10 columns\nE[:,1] = [.567,.250,-.0074,0,-.209,.0096]\nE[:,6] = [-.976,.408,.0115,1,.938,-.017]\nE1 = first three rows of E\nE2 = last three rows of E\nU = positive-coordinate columns of Ssharp\nvp = identity matrix of size 168\nvm = identity matrix of size 168\nfor r=0..8:\n    vp = vp + R(vp*U)\n    vm = vm + R((-1 if r==0 else 1)*vm*U)\n    record the maximum absolute column sums of U,vp,vm\n    if r<8: U = R(U*U)\n# Compare every recorded value with the power table, row r.\n\nSe = last three columns of Ssharp\ng1 = Ysharp + Se*E2\ng2 = Se*E1\nX[1] = stack(R((vp*(g1+g2)+vm*(g1-g2))/2), E1)\nX[2] = stack(R((vp*(g1+g2)-vm*(g1-g2))/2), E2)\n# Test every individual and same-column combined absolute column sum\n# against the corresponding bound in the column table.")

The product identities in the proof of Proposition 9 give the prescribed $512$-term series.
  At each stage, the entries of #raw("vp") and #raw("vm") are integer multiples of $epsilon.alt$.
  Hence $V + R \( V U \) = R \( V \( I + U \) \)$, with the analogous identity for the initial minus sign.
  The listing and the rounded product update used in (11.4) are therefore the same operation.

#raw(block: true, lang: "Floor-rounded verification: every half-gap and tail inequality", "nodes5 = [1,3,4,7,9]\nendpoints = [2.36,2.65,3.2,4,6,infinity]\nsigma = [-1,1]\n\nfunction low(row,K,J):\n    exK = [e_star(-K*(n-1)) for n in nodes5]\n    exJ = ([e_star(-J*(n-1)) for n in nodes5]\n                   if J<infinity else [1,0,0,0,0])\n    answers = []\n    for x in [1/K, (1/J if J<infinity else 0)]:\n        v = row[1..5] + x*row[6..10]\n        answers.append(v[1] + sum(min(v[a]*exK[a],v[a]*exJ[a])\n                                                     for a=2..5))\n    return min(answers)\n\nlow_nodes = [0] followed by all n in F_nodes with n<=88\nfor m in low_nodes:\n    # Successor and predecessor are in {0} union the positive nodes.\n    ys = [(successor(m)-m)/2]\n    if m>0: append (predecessor(m)-m)/2 to ys\n    for y in ys:\n        nu = (0 if m==0 else 2)\n        F,G = factors(m,y,40+nu)\n        for fn=1..2:\n            for a=0..40:\n                l[a] = sigma[fn]/y^nu * Re(\n                    F[a+nu,:]*(W*X[fn])\n                    +G[a+nu,:]*(W*X[3-fn]))\n            for consecutive K,J in endpoints:\n                tc = zero row of length 41\n                if m==0:\n                    tc[r] = e_star(K)/K * (-K*y)^r/r! for r=0..40\n                if m==1:\n                    tc[r] = K*(-K*y)^r/(r+2)! for r=0..40\n                if m==3 and J<infinity:\n                    tc[0] = (J/2)*e_star(-13*J/6)\n                for d=0..40:\n                    lsum = zero row of length 10\n                    tsum = 0\n                    w = 1\n                    for r=0..d:\n                        lsum = lsum + w*l[r]\n                        if fn==1: tsum = tsum + w*tc[r]\n                        if r<d: w = w*(d-r)/(40-r)\n                    value = low(lsum,K,J) + tsum\n                    # Strictly compare with the m-group and K row\n                    # of the half-gap table, for every value.\n\ns0 = 89.5\nfor consecutive K,J in endpoints:\n    for fn=1..2:\n        signedX = sigma[fn]*X[fn]\n        neg(row) = min(0,low(row,K,J))\n        value = low(signedX[C,:],K,J)\n        value += neg(sum(signedX[d(n),:] for n in low_nodes))/s0\n        for n in low_nodes:\n            value += neg(signedX[c(n),:])/(s0-n)^2\n            value += n*neg(signedX[d(n),:])/(s0*(s0-n))\n        # Strictly compare with the tail column for this K row.")

The three references to tables in these listings mean, respectively, Tables 1, 2, and 3.
  Every comparison is strict and rational. There are $37310$ half-gap comparisons and ten tail comparisons;
  a reported extremum is not a substitute for testing each index.

If the floor computation passes all these tests, the roundoff lemma transfers them to the looser exact-array
  bounds in Proposition 9. For example, $.00116 - 10^(- 6) > .001$ and $.0022 - 10^(- 6) > .0021$.
  The column cutoffs $2.20 \, 5.40$ remain below $2.3 \, 5.6$ after the column error,
  and the power errors are much smaller than the gaps from $.0031$ to $.004$ and from $32.12 + 1.85$ to $36$.

#bibliography("refs.bib", style: "ieee", title: [References])
