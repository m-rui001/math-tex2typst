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

#align(center)[#text(size: 16pt, weight: "bold")[Diagonal Fourier extension for positively curved surfaces \
in three dimensions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $Sigma subset bb(R)^3$ be a compact smooth surface, with induced surface measure $d sigma$. Its Fourier extension operator is

$ E_Sigma f \( x \) = integral_Sigma f \( xi \) e^(2 pi i x dot.op xi) thin d sigma \( xi \) . $

We allow smooth boundary. Positive curvature means that the second fundamental form is definite at every point, with the normal chosen on each chart so that the form is positive definite.

#thm([Theorem 1.1.])[
  #emph[Let $Sigma subset bb(R)^3$ be a compact smooth positively curved surface, possibly with smooth boundary. For every $3 < p < oo$, there is a finite constant $C_(Sigma \, p)$ such that 
#[#set math.equation(numbering: n => "(1.1)")
 $ parallel E_Sigma f parallel_(L^p \( bb(R)^3 \)) lt.eq C_(Sigma \, p) parallel f parallel_(L^p \( Sigma \)) $ <eq:main>]

 for every complex-valued $f in L^p \( Sigma \)$.]
] <thm:main>

The theorem establishes the diagonal extension conjecture in three dimensions for positively curved surfaces. It includes the sphere, compact elliptic paraboloid patches, and general smooth elliptic graphs. The surface and the exponent are fixed throughout each estimate.

===== 1.1 Background. <background.>

The restriction problem originates in Stein’s work; the Tomas–Stein theory gives $L^2 \( Sigma \) arrow.r L^4 \( bb(R)^3 \)$ for positively curved surfaces #cite(label("Tomas1975")) #cite(label("Stein1979")). The bilinear framework of Tao, Vargas, and Vega #cite(label("TaoVargasVega1998")), Wolff’s cone estimate #cite(label("Wolff2001")), and Tao’s paraboloid estimate #cite(label("Tao2003")) developed the role of wave packets and transverse interactions. Bennett, Carbery, and Tao’s multilinear estimates #cite(label("BennettCarberyTao2006")) and Bourgain–Guth’s approach #cite(label("BourgainGuth2011")) further connected these interactions to the linear problem.

Guth’s polynomial-partitioning argument established the bounded-data estimate for $p > 13 \/ 4$ #cite(label("Guth2016")) Theorem 0.1. Shayya obtained diagonal estimates in that range #cite(label("Shayya2017")) Corollary 2.1(iii); see also Kim’s treatment #cite(label("Kim2017")) Theorem 1.2 and the following remark. Wang’s broom method further improved bounded-data restriction for the truncated paraboloid #cite(label("Wang2022Brooms")) Theorem 1.4. Wang and Wu proved the diagonal bound for $p > 22 \/ 7$ on compact positively curved surfaces, including surfaces with boundary, using decoupling and two-ends Furstenberg inequalities #cite(label("WangWu2024")) Theorem 0.2.

For the sphere and quadratic graphs, factorization gives a separate route from bounded-data estimates to diagonal estimates with an arbitrarily small increase in the exponent; see Bourgain #cite(label("Bourgain1991Besicovitch")) and Buschenhenke #cite(label("Buschenhenke2024")) Theorem 1.1 and Remark 1.6. The argument here treats general smooth elliptic charts through the packet theorem’s full array formulation and the explicit phase continuation. The packet and maximal inputs play distinct roles: the former controls oscillatory coefficients, while the latter controls their positive tube density.

The compact paraboloid case also gives a consequence for free Schrödinger evolution. Let $W^(s \, p) \( bb(R)^2 \)$ denote the inhomogeneous Bessel-potential space with norm $parallel f parallel_(W^(s \, p)) = parallel \( I - Delta \)^(s \/ 2) f parallel_(L^p \( bb(R)^2 \))$.

#thm([Corollary 1.2.])[
  (Free Schrödinger local smoothing).  #emph[For every $3 < p < oo$ and $s > 2 - 6 \/ p$, the free Schrödinger propagator, initially defined on Schwartz functions, extends boundedly from $W^(s \, p) \( bb(R)^2 \)$ to $L^p \( bb(R)^2 times \[ 0 \, 1 \] \)$: 
#[#set math.equation(numbering: n => "(1.2)")
 $ parallel e^(i t Delta) f parallel_(L^p \( bb(R)^2 times \[ 0 \, 1 \] \)) lt.eq C_(p \, s) parallel f parallel_(W^(s \, p) \( bb(R)^2 \)) . $ <eq:schrodinger-smoothing>]

]
] <cor:schrodinger-smoothing>

The spacetime norm is global in space and local in time. Rogers’s necessary condition #cite(label("Rogers2008")) Section 2 shows that the Sobolev threshold cannot be lowered. We deduce the corollary from the compact-frequency transfer of Lee, Rogers, and Seeger #cite(label("LeeRogersSeeger2013")) Theorem 1.1 in Section 7.

A second consequence concerns local oscillatory integrals with phase $N \[ x dot.op y + psi \( t \; y \) \]$, where $x \, y in bb(R)^2$, $t in bb(R)$, and the amplitude is smooth and compactly supported. Suppose $D_y^2 partial_t psi$ is definite and its time derivative is a scalar multiple of itself. A change of output variables then reduces the phase to a fixed elliptic graph. Corollary 16 gives the resulting $L^p$ estimate with the scaling factor $N^(- 3 \/ p)$ for every finite $p > 3$. The additional phase condition is the translation-invariant form of Bourgain’s condition; we explain the straightening directly in Section 7, following the setting of Gao–Liu–Xi #cite(label("GaoLiuXi2025")).

The proof of Theorem 1 uses two theorem inputs. The packet propagation theorem #cite(label("OpenAIPacket2026")) Theorem 6.4 controls arbitrary finite complex coefficient arrays through an elliptic capacity, with coordinate masks permitted. The Kakeya maximal theorem #cite(label("OpenAIKakeya2026")) Theorem 1.1 controls nonnegative weighted tube concentration. We state both inputs in the forms used here and verify their hypotheses. The remainder of the proof gives the density conversion, the estimates for rough $L^3$ graph data, and the passage to general surfaces.

===== 1.2 The argument. <the-argument.>

After fixing a graph chart, an explicit continuation places its phase in the class allowed by the packet theorem. The construction matches the quadratic Taylor data in a transition annulus of a continued spherical patch and preserves uniform ellipticity. It applies equally to boundary charts, where the graph extends smoothly and the datum is extended by zero.

The packet theorem gives a cubic sample estimate with a small spatial power loss and an elliptic-capacity factor. A decomposition according to the capacity of the remaining coefficients allows this factor to be summed using the positive weighted tube estimate. The latter follows from the Kakeya maximal theorem by duality; its direction and position formulation follows the classical weighted tube framework of Tao, Vargas, and Vega #cite(label("TaoVargasVega1998")) arXiv version 1, Section 3.

To pass to $L^3$ data, we prove one joint estimate for a sparse family of balls. Removing a small union of frequency resonances makes the corresponding packet analyses almost orthogonal. The bound is uniform in the ball locations and in arbitrarily large separations. A covering of each level set then removes the spatial loss. This follows Tao’s sparse-ball strategy for epsilon removal #cite(label("Tao1999Epsilon")); see the detailed treatments in Bourgain–Guth’s appendix #cite(label("BourgainGuth2011")) and Kim’s appendix #cite(label("Kim2017")). We prove the precise covering and summation needed for the present estimate.

The resulting graph bound has $L^3$ input and $L^p$ output for every $p > 3$. A finite chart decomposition, with the surface and physical-space Jacobians retained, gives Equation (1.1) by the finite-measure embedding $L^p \( Sigma \) subset L^3 \( Sigma \)$.

Figure 1 records the two inputs and the successive reductions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.875, 0), [#box(width: 6.595cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Positively curved chart#linebreak()Insertion into an allowed phase]]])])
  content((3.875, 0), [#box(width: 6.595cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$L^3$ Kakeya maximal theorem#linebreak()Loss $rho^(-s)$ for each $s>0$]]])])
  content((-3.875, -1.8), [#box(width: 6.595cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Packet theorem#linebreak()Complex arrays; coordinate masks]]])])
  content((3.875, -1.8), [#box(width: 6.595cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weighted tube estimate#linebreak()Nonnegative tube weights]]])])
  content((0, -3.9), [#box(width: 9.233cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Density grouping#linebreak()Sampled cubic estimate]]])])
  content((0, -5.7), [#box(width: 9.233cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Joint estimate on sparse balls#linebreak()Compactly supported $L^3$ data]]])])
  content((0, -7.5), [#box(width: 9.233cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Level-set cover and loss removal#linebreak()Graph $L^3 arrow.r L^p$, $p>3$]]])])
  content((0, -9.3), [#box(width: 9.233cm, inset: (x: 0.2469cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Finite charts and surface measure#linebreak()Surface $L^p arrow.r L^p$, $p>3$]]])])
  line((-3.875, -0.6), (-3.875, -1.2), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((3.875, -0.6), (3.875, -1.2), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((-3.875, -2.4), (-2.473, -3.3), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((3.875, -2.4), (2.473, -3.3), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((0, -4.5), (0, -5.1), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((0, -6.3), (0, -6.9), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
  line((0, -8.1), (0, -8.7), stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#595959"))))
})],
  caption: [Figure 1: The two independent inputs meet in the sampled cubic estimate. The sparse-ball bound then supplies the common $L^3$ control needed for globalization and passage to the surface. ],
) <fig:argument-map>

===== 1.3 Dependence on the exponent. <dependence-on-the-exponent.>

Let $C_(Sigma \, p)^(upright("best"))$ denote the operator norm in Equation (1.1). Write $M \( s \) gt.eq 1$ for the constant in the Kakeya maximal estimate with loss $delta^(- s)$, and let $P_Sigma \( kappa \, eta \) gt.eq 1$ be the largest packet constant among the finitely many fixed chart and window setups used below. For $3 < p lt.eq 4$, put $theta = 10^(- 6) \( p - 3 \)^2$. The proof gives

#[#set math.equation(numbering: n => "(1.3)")
 $ C_(Sigma \, p)^(upright("best")) lt.eq C \( Sigma \) \( p - 3 \)^(- 7 \/ p) P_Sigma \( theta \, theta \)^(1 \/ p) M \( theta \)^(3 \/ \( 2 p \)) \, $ <eq:quantitative-intro>]

where $C \( Sigma \)$ is independent of $p in \( 3 \, 4 \]$. The two input theorems supply finite constants at each positive loss exponent. No rate for their growth is assumed, so Equation (1.3) records the elementary losses without asserting a polynomial bound in $\( p - 3 \)^(- 1)$. For nonempty $Sigma$, a fixed smooth datum also gives

#[#set math.equation(numbering: n => "(1.4)")
 $ C_(Sigma \, p)^(upright("best")) gt.eq c \( Sigma \) \( p - 3 \)^(- 1 \/ p) \, #h(2em) 3 < p lt.eq 4 . $ <eq:lower-intro>]

Proposition 15 proves this comparison.

===== 1.4 Conventions and organization. <conventions-and-organization.>

Write $e \( t \) = exp \( 2 pi i t \)$. All functions and coefficient arrays may be complex-valued. Constants may depend on the fixed surface, charts, frequency supports, and windows; dependence on the small loss exponents is displayed through $P$ and $M$. Section 2 fixes the local graph problem. The next sections give the packet interface, the density conversion, and the joint sparse-ball estimate. The global argument tracks the dependence on $p$, and Section 7 completes the transfer to $Sigma$ and proves the local-smoothing and oscillatory-integral consequences.

== 2 Local graphs and fixed parameters <sec:setup>

We first explain the class of graph integrals to be estimated. Near each point of $Sigma$, choose tangent coordinates and a normal in which the surface is a graph with positive definite Hessian. At a boundary point, a smooth parametrization up to the boundary extends to an open neighborhood of the parameter half-disk; this is the usual smooth-boundary convention #cite(label("Lee2013Smooth")) Chapter 1, pp. 27–28. Projection onto the tangent plane has invertible differential there. The inverse function theorem on the extension therefore gives a graph on an open planar neighborhood, whose restriction parametrizes the original surface piece.

After shrinking a chart, Lemma 3 gives a fixed invertible affine change of ambient frequency coordinates in which the graph agrees locally with a phase $phi.alt in C^oo \( bb(R)^2 \)$ in the precise continuation class of Theorem 6. In particular, this phase satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ c I lt.eq D^2 phi.alt lt.eq C I \, #h(2em) sup_(bb(R)^2) \| D^j phi.alt \| < oo quad \( j gt.eq 2 \) . $ <eq:ellipticity>]

The elementary arguments below use only Equation (2.1); the packet estimate also uses the continuation form verified in Lemma 3.

Fix a smooth nonnegative function $chi$ supported in a square centered at zero, such that

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(nu in a bb(Z)^2) \( chi_a^nu \( xi \) \)^2 = 1 \, #h(2em) chi_a^nu \( xi \) = chi \( \( xi - nu \) \/ a \) \, #h(2em) a > 0 . $ <eq:window-partition>]

For example, start with a compactly supported bump positive on $\[ - 1 \, 1 \]^2$, and divide it by the square root of the sum of the squares of its integer translates. This denominator is smooth, positive, and periodic. Let $D_(upright(f)) gt.eq 1$ be a fixed side length for a square containing the support of $chi$.

Write

$ E_phi.alt g \( y \) = integral_(bb(R)^2) g \( xi \) e #scale(x: 120%, y: 120%)[\(] y' dot.op xi + y_3 phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi \, #h(2em) y = \( y' \, y_3 \) in bb(R)^2 times bb(R) . $

A partition at scale one reduces each compactly supported graph integral to finitely many functions of the form

#[#set math.equation(numbering: n => "(2.3)")
 $ F \( y \) = E_phi.alt \( h chi_1^(nu_(*)) \) \( y \) . $ <eq:local-F>]

Here $nu_(*) in bb(Z)^2$ is fixed and $h in L^3 \( bb(R)^2 \)$ is supported in a fixed compact set $Q_0$. To see the reduction, write graph data $g = sum_(nu_(*)) \( g chi_1^(nu_(*)) \) chi_1^(nu_(*))$, using Equation (2.2); only finitely many terms meet $"supp" g$. The extra copy of the window is included in $h$.

All constants for a fixed setup may depend on $phi.alt \, Q_0 \, chi$, $D_(upright(f))$, and $nu_(*)$. These objects, and all label ranges used later, are chosen before the large scale or the small loss exponents vary. In particular,

#[#set math.equation(numbering: n => "(2.4)")
 $ \( nabla phi.alt \( xi \) - nabla phi.alt \( eta \) \) dot.op \( xi - eta \) gt.eq c \| xi - eta \|^2 $ <eq:velocity-monotonicity>]

on $bb(R)^2$. Thus the velocity map $U_xi = - nabla phi.alt \( xi \)$ is bi-Lipschitz on each fixed bounded region and has bounded size there.

The final graph estimate controls Equation (2.3) by $parallel h parallel_3$. We record the precise surface Jacobians in Section 7.

== 3 The packet estimate and its phase class <sec:packets>

We need a cubic bound for the samples obtained by synthesizing a finite packet array and analyzing it at a larger scale. The input array must remain arbitrary, since Section 4 splits it into coordinate subarrays. We first verify the precise phase requirement of the cited packet theorem: uniform convexity alone is not its stated hypothesis.

=== 3.1 Continued phases and local changes of coordinates <continued-phases-and-local-changes-of-coordinates>

The setup of #cite(label("OpenAIPacket2026")) Section 6.1 starts with a small spherical graph and extends its phase smoothly to $bb(R)^2$, with uniformly definite bounded Hessian and bounded derivatives of every order at least two. Its constants may depend on this fixed continuation, the fixed bounded frequency region, and the windows. The continuation is made by cutting off the difference from the quadratic Taylor polynomial. We shall use continuations of precisely this form: write

$ q_s \( xi \) = - sqrt(1 - \| xi \|^2) \, #h(2em) Q_s \( xi \) = - 1 + 1 / 2 \| xi \|^2 \, $

and, for a sufficiently small fixed $rho > 0$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ phi.alt = Q_s + zeta \( q_s - Q_s \) \, #h(2em) 0 lt.eq zeta lt.eq 1 \, quad zeta = 1 med upright("on ") B \( 0 \, rho \) \, quad "supp" zeta subset B \( 0 \, 2 rho \) . $ <eq:spherical-continuation>]

Here $zeta$ is smooth, the product is extended by zero outside $B \( 0 \, 2 rho \)$, and the resulting phase must satisfy Equation (2.1). No radiality is required of the cutoff.

#thm([Lemma 3.1.])[
  (Insertion of an elliptic graph).  #emph[Every germ of a smooth graph with positive definite Hessian can be carried by an invertible affine transformation of $bb(R)^3$ to a graph agreeing, on an open neighborhood, with a phase of the form in Equation (3.1). The phase, the neighborhood, and the affine transformation can all be fixed independently of the packet scales and of the exponents used below.]
] <lem:continuation>

#proof[
  Choose a smooth cutoff $zeta_0$ equal to one on $B \( 0 \, rho \)$, supported in $B \( 0 \, 2 rho \)$, and identically $1 \/ 2$ on a neighborhood $V$ of a point $xi_1$ with $rho < \| xi_1 \| < 2 rho$. It can be chosen by rescaling a fixed cutoff with an annular plateau. The phase
  $ q = Q_s + zeta_0 \( q_s - Q_s \) $
  has Hessian $I + O \( rho^2 \)$: the remainder $q_s - Q_s$ and its derivatives of orders zero, one, and two are respectively $O \( rho^4 \)$, $O \( rho^3 \)$, and $O \( rho^2 \)$ on the support of the cutoff. Fix $rho$ small enough that $q''$ is positive definite everywhere.
  After translating the target base point, let its height function be $h_0$ near zero and put $H = h''_0 \( 0 \) > 0$ and $B = q'' \( xi_1 \) > 0$. Choose an invertible real matrix $A$ with $A^(sans(T)) H A = B$; for example, $A = H^(- 1 \/ 2) B^(1 \/ 2)$. Define, near $xi_1$,
  $ psi \( xi \) & = h_0 #scale(x: 120%, y: 120%)[\(] A \( xi - xi_1 \) #scale(x: 120%, y: 120%)[\)] + q \( xi_1 \) - h_0 \( 0 \)\
 & quad + #scale(x: 120%, y: 120%)[\(] nabla q \( xi_1 \) - A^(sans(T)) nabla h_0 \( 0 \) #scale(x: 120%, y: 120%)[\)] dot.op \( xi - xi_1 \) . $
  Thus $psi$ and $q$ have the same value, gradient, and Hessian at $xi_1$. This change of graph is induced by an invertible affine map of ambient frequency space: its base part is $x mapsto xi_1 + A^(- 1) x$, and its height part is addition of an affine function of the new base coordinates.
  Let $theta.alt in C_c^oo \( B \( 0 \, 2 \) \)$ equal one on $B \( 0 \, 1 \)$ and take $0 lt.eq theta.alt lt.eq 1$. For a small fixed $epsilon.alt > 0$ put
  $ R_epsilon.alt \( xi \) = theta.alt #scale(x: 120%, y: 120%)[\(] \( xi - xi_1 \) \/ epsilon.alt #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] psi \( xi \) - q \( xi \) #scale(x: 120%, y: 120%)[\)] . $
  Choose $epsilon.alt$ so that its support is contained in $V$ and the target graph is defined there. Taylor’s theorem and the agreement of the two-jets give
  $ parallel D^j R_epsilon.alt parallel_oo lt.eq C epsilon.alt^(3 - j) \, #h(2em) j = 0 \, 1 \, 2 . $
  Consequently $phi.alt = q + R_epsilon.alt$ remains uniformly convex for sufficiently small $epsilon.alt$ and agrees with $psi$ on $B \( xi_1 \, epsilon.alt \)$. It equals $Q_s$ outside a compact set, so all of its derivatives of order at least two are bounded.
  To verify the required continuation form, observe that $D = q_s - Q_s$ is strictly positive for $0 < \| xi \| < 1$. Shrink $V$, if necessary, so that $D gt.eq d_0 > 0$ there. The function $R_epsilon.alt \/ D$, extended by zero outside $V$, is smooth. Set
  $ tilde(zeta) = zeta_0 + R_epsilon.alt \/ D . $
  On the perturbation support, $zeta_0 = 1 \/ 2$ and $\| R_epsilon.alt \/ D \| lt.eq C epsilon.alt^3 \/ d_0$. Choosing $epsilon.alt$ smaller makes this last quantity at most $1 \/ 4$. Hence $0 lt.eq tilde(zeta) lt.eq 1$, with the same inner and outer support properties as $zeta_0$, and $phi.alt = Q_s + tilde(zeta) \( q_s - Q_s \)$. Every choice was made using only the fixed target graph. ◻
]

In what follows, the phases to which the cited packet theorem is applied are chosen as in Lemma 3. Although the inserted graph lies in the transition annulus, the packet theorem allows arbitrary frequency labels in a fixed bounded region. In particular, those labels need not lie in the spherical region $B \( 0 \, rho \)$: #cite(label("OpenAIPacket2026")) Definition 6.3 imposes no such restriction, and its single-step maps act on arbitrary finite input arrays. All windows meeting the inserted graph, and the terminal windows used below, can therefore be included in one fixed bounded frequency region. The constants may depend on the chosen phase, including its higher derivative bounds.

=== 3.2 Frames and the capacity norm <frames-and-the-capacity-norm>

We use the standard frequency and spatial localization of wave packets; see Tao #cite(label("Tao2003")) arXiv version 2, Section 4 and the Fourier-series construction of Guo, Oh, Wang, Wu, and Zhang #cite(label("GOWWZ2025Packets")) arXiv version 1, Section 4.1. Square windows give the exact identities below, with the normalization needed for our sample sum.

Fix a dyadic $N gt.eq 2$ and put $delta = N^(- 1)$ and $U_nu = - nabla phi.alt \( nu \)$. For a dyadic factor $1 lt.eq m lt.eq N$ let

#[#set math.equation(numbering: n => "(3.2)")
 $ theta = m delta \, #h(2em) r = m^(- 2) \, #h(2em) w = r theta = delta \/ m . $ <eq:packet-scales>]

Partition $\[ 0 \, 1 \)$ into intervals $I$ of length $r$, with left endpoints $t_I$. At this scale, the indices are

$ \( nu \, z \, I \) \, #h(2em) nu in theta bb(Z)^2 \, #h(2em) z in D_(upright(f))^(- 1) w bb(Z)^2 . $

Using the windows fixed in the local setup, define

#[#set math.equation(numbering: n => "(3.3)")
 $ \( sans(P)_(m \, I) f \)_(nu \, z) & = integral f \( xi \) chi_theta^nu \( xi \) e #scale(x: 120%, y: 120%)[\(] N^2 \( z dot.op xi + t_I phi.alt \( xi \) \) #scale(x: 120%, y: 120%)[\)] thin d xi \,\
sans(S)_(m \, I) d \( xi \) & = \( D_(upright(f)) theta \)^(- 2) sum_(nu \, z) d_(nu \, z) chi_theta^nu \( xi \) e #scale(x: 120%, y: 120%)[\(] - N^2 \( z dot.op xi + t_I phi.alt \( xi \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:packet-analysis>]

Synthesis is initially defined for finite arrays and then extended continuously to $ell^2$.

#thm([Lemma 3.2.])[
  (Exact frame identities).  #emph[For every $f in L^2 \( bb(R)^2 \)$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ sans(S)_(m \, I) sans(P)_(m \, I) f = f \, #h(2em) parallel sans(P)_(m \, I) f parallel_(ell^2)^2 = \( D_(upright(f)) theta \)^2 parallel f parallel_2^2 \, #h(2em) parallel sans(S)_(m \, I) parallel_(ell^2 arrow.r L^2) = \( D_(upright(f)) theta \)^(- 1) . $ <eq:packet-frame>]

]
] <lem:packet-frame>

#proof[
  Since $N^2 w theta = 1$, the vectors $N^2 z$ run through $\( D_(upright(f)) theta \)^(- 1) bb(Z)^2$. For each fixed $nu$, Equation (3.3) is the Fourier coefficient array of $f chi_theta^nu e \( N^2 t_I phi.alt \)$ on a square of side $D_(upright(f)) theta$. Parseval and Fourier inversion give
  $ sum_z \| \( sans(P)_(m \, I) f \)_(nu \, z) \|^2 = \( D_(upright(f)) theta \)^2 parallel f chi_theta^nu parallel_2^2 $
  and, after synthesis, $f \( chi_theta^nu \)^2$. Sum over $nu$ and use $sum_nu \( chi_theta^nu \)^2 = 1$. The norm of synthesis follows from $sans(S)_(m \, I) = \( D_(upright(f)) theta \)^(- 2) sans(P)_(m \, I)^(*)$. These identities first hold for finite partial Fourier sums in $L^2$ and then for their limits. ◻
]

For $0 < kappa < 1 \/ 10$, let $E$ be a centered closed ellipse with ordered semiaxes $L gt.eq a > 0$, of any orientation, and write $W_kappa \( E \) = L^(1 + kappa) a^(1 - kappa)$. For a finite array $c$ in one bin at the scale $\( theta \, r \, w \)$ define

#[#set math.equation(numbering: n => "(3.5)")
 $ K_(theta \, r) \( c \) & = sup_(E \, u \, v\
L gt.eq a gt.eq theta) frac(theta^2, W_kappa \( E \)) sum_(U_nu in u + E\
z in v + r E) \| c_(nu \, z) \|^2 \,\
G_(theta \, r) \( c \)^3 & = (w^2 sum_(nu \, z) \| c_(nu \, z) \|^2) K_(theta \, r) \( c \)^(1 \/ 2) . $ <eq:packet-general-capacity>]

The translations $u \, v in bb(R)^2$ are independent, and there is no upper restriction on either semiaxis. On each finite index set let

$ A_(theta \, r) \( c \) & = inf {sum_(ell = 1)^q G_(theta \, r) \( a_ell \) : \| c \| lt.eq sum_(ell = 1)^q \| a_ell \| \, med q < oo} \,\
cal(A)_m \( c \)^3 & = r sum_I A_(theta \, r) \( c_I \)^3 . $

The domination in this infimum is coordinatewise.

#thm([Lemma 3.3.])[
  (The atomic norm controls the sample sum).  #emph[The function $A_(theta \, r)$ is a norm on every finite coordinate space, is monotone under absolute coordinatewise domination, and is contracted by coordinate masks. Moreover, 
#[#set math.equation(numbering: n => "(3.6)")
 $ r w^2 sum_(nu \, z \, I) \| c_(nu \, z \, I) \|^3 lt.eq cal(A)_m \( c \)^3 . $ <eq:packet-atomic-lower>]

]
] <lem:packet-atomic>

#proof[
  The disk of radius $theta$, with its two translations chosen independently, contains any prescribed index in both tests. Its weight is $theta^2$, so $K_(theta \, r) \( c \) gt.eq parallel c parallel_oo^2$ and
  $ G_(theta \, r) \( c \)^3 gt.eq w^2 parallel c parallel_2^2 parallel c parallel_oo gt.eq w^2 sum_(nu \, z) \| c_(nu \, z) \|^3 . $
  For every atomic domination of $c$, the triangle inequality in $ell^3$ now gives
  $ w^(2 \/ 3) parallel c parallel_3 lt.eq sum_ell G_(theta \, r) \( a_ell \) . $
  Taking the infimum and summing its cube over bins with weight $r$ proves Equation (3.6). A singleton has cost $w^(2 \/ 3) \| c_(nu \, z) \|$, so the infimum is finite; the displayed lower bound makes it positive away from zero. Homogeneity, subadditivity, and absolute monotonicity follow directly from the definition, as does contraction under masks. ◻
]

At the initial scale $m = 1$ there is one bin, $\[ 0 \, 1 \)$, and we use the notation

#[#set math.equation(numbering: n => "(3.7)")
 $ cal(K)_kappa \( d \) = K_(delta \, 1) \( d \) \, #h(2em) m \( d \) = delta^2 sum_(nu \, z) \| d_(nu \, z) \|^2 . $ <eq:packet-capacity>]

In particular, $G_(delta \, 1) \( d \)^3 = m \( d \) cal(K)_kappa \( d \)^(1 \/ 2)$.

=== 3.3 The cited theorem and its specialization <the-cited-theorem-and-its-specialization>

A single-step map $T_m$ synthesizes at factor $1$, analyzes in every factor-$m$ time bin, and then applies any coordinate mask. It uses the full matrix between its input and retained output indices. The admissible complexity convention of #cite(label("OpenAIPacket2026")) Definition 6.3 fixes a finite $B$ and a bounded frequency-label region, requires $m lt.eq N lt.eq m^B$ and position labels of size at most $m^B$, and allows arbitrary finite arrays on those indices. The phase and window constants are fixed throughout this class.

#thm([Theorem 3.4.])[
  (Packet propagation #cite(label("OpenAIPacket2026")) Theorem 6.4, Equation (6.8)).  #emph[For a fixed phase as in Equation (3.1), every fixed admissible complexity range, $0 < kappa < 1 \/ 10$, and $eta > 0$, there is a finite constant $C$ such that 
#[#set math.equation(numbering: n => "(3.8)")
 $ cal(A)_m \( T_m d \)^3 lt.eq C m^(10 kappa + eta) G_(delta \, 1) \( d \)^3 $ <eq:packet-source>]

 for all its single-step maps and all its finite complex input arrays. The source also permits $A_(delta \, 1) \( d \)^3$ on the right. The constant may depend on $kappa$, $eta$, the complexity range, the phase, and the windows.]
  #emph[In particular, suppose the initial labels $nu in delta bb(Z)^2$ and $z in D_(upright(f))^(- 1) delta bb(Z)^2$ lie in fixed bounded sets. Define 
#[#set math.equation(numbering: n => "(3.9)")
 $ S d \( xi \) & = \( D_(upright(f)) delta \)^(- 2) sum_(nu \, z) d_(nu \, z) chi_delta^nu \( xi \) e \( - N^2 z dot.op xi \) \,\
c_(nu' \, z' \, j) & = integral S d \( xi \) chi_1^(nu') \( xi \) e #scale(x: 120%, y: 120%)[\(] N^2 z' dot.op xi + j phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi \, $ <eq:packet-synthesis>]

 where $nu' in bb(Z)^2$, $z' in D_(upright(f))^(- 1) N^(- 2) bb(Z)^2$, and $j = 0 \, dots.h \, N^2 - 1$. Retain any output coordinate mask for which $nu' \, z'$ lie in fixed bounded sets. There is a finite $P \( kappa \, eta \) gt.eq 1$, depending on these fixed sets, the phase, and the windows, such that, for every dyadic $N gt.eq 2$ and $0 < eta lt.eq 1$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ N^(- 6) sum_(nu' \, z' \, j) \| c_(nu' \, z' \, j) \|^3 lt.eq P \( kappa \, eta \) N^(10 kappa + eta) m \( d \) cal(K)_kappa \( d \)^(1 \/ 2) . $ <eq:packet-bound>]

 The sum is over the retained coordinates.]
] <thm:packet>

#proof[
  #emph[Specialization of the cited theorem.] Set $m = N$. The scales in Equation (3.2) become
  $ & theta & r & w\
upright("input") & delta & 1 & delta\
upright("output") & 1 & N^(- 2) & N^(- 2) #h(2em) t_I = j / N^2 \, #h(2em) r w^2 = N^(- 6) quad upright("at output") . $
  Thus the companion’s synthesis and analysis operators are exactly the displayed operators, with its window constant $L_(upright(f))$ equal to our $D_(upright(f))$. The initial gauge is exactly the last expression in Equation (3.10), and Equation (3.6) gives
  $ N^(- 6) sum_(nu' \, z' \, j) \| c_(nu' \, z' \, j) \|^3 lt.eq cal(A)_N \( c \)^3 . $
  All bounded label sets fit one fixed admissible complexity range for sufficiently large $N$, since $m = N$; the finitely many smaller dyadic scales may be included by enlarging the constant. The bound at any such fixed scale follows from finite-dimensional boundedness and $cal(K)_kappa \( d \) gt.eq parallel d parallel_oo^2$. Applying Equation (3.8) proves Equation (3.10). This argument uses arbitrary input arrays, so it also applies after any restriction of their support. ◻
]

Theorem 6 is the additional oscillatory input. Its source proves Equation (3.8) in #cite(label("OpenAIPacket2026")) Section 7; no rate for the dependence of $P \( kappa \, eta \)$ on its small parameters is asserted here.

== 4 From packet capacity to weighted tubes <sec:density>

We first obtain a positive tube estimate from the Kakeya maximal theorem. We then use a decomposition by capacity to apply Theorem 6 to an arbitrary initial array without imposing a condition on the sizes of its coefficients. Throughout this section, the frequency and position label bounds are fixed as in the packet setup. The positive tube-duality formulation follows the classical mixed-norm framework of Tao, Vargas, and Vega #cite(label("TaoVargasVega1998")) arXiv version 1, Section 3, Equation (21); the capacity decomposition below is proved here.

For an initial array $d = \( d_(nu \, z) \)$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ T_(nu \, z) & = { \( X \, t \) in bb(R)^2 times bb(R) : 0 lt.eq t lt.eq 1 \, med \| X - z - t U_nu \| lt.eq delta } \,\
H_d \( X \, t \) & = sum_(nu \, z) \| d_(nu \, z) \|^2 upright(bold(1))_(T_(nu \, z)) \( X \, t \) \, #h(2em) b_nu \( d \) = sum_z \| d_(nu \, z) \|^2 . $ <eq:tube-function>]

All integrals of tube functions use Lebesgue measure $d X thin d t$. In particular, $\| T_(nu \, z) \| = pi delta^2$ and

#[#set math.equation(numbering: n => "(4.2)")
 $ integral_(bb(R)^3) H_d = pi m \( d \) . $ <eq:tube-mass>]

For clarity, the precise maximal operator used below is

$ K_rho g \( omega \) = sup_(a in bb(R)^3) frac(1, pi rho^2) integral_(cal(T)_rho \( a \, omega \)) \| g \( y \) \| thin d y \, #h(2em) cal(T)_rho \( a \, omega \) = { a + r omega + w : \| r \| lt.eq 1 / 2 \, med w perp omega \, med \| w \| lt.eq rho } . $

Thus $cal(T)_rho \( a \, omega \)$ is a circular cylinder of length one and volume $pi rho^2$. The companion theorem #cite(label("OpenAIKakeya2026")) Theorem 1.1 states that for every $s > 0$ there is a finite constant $M \( s \)$, which we enlarge to be at least one, such that for every $g in L^3 \( bb(R)^3 \)$,

#[#set math.equation(numbering: n => "(4.3)")
 $ parallel K_rho g parallel_(L^3 \( S^2 \)) lt.eq M \( s \) rho^(- s) parallel g parallel_(L^3 \( bb(R)^3 \)) \, #h(2em) 0 < rho < 1 . $ <eq:kakeya-input>]

Here $S^2$ carries its usual surface measure. We will use only $0 < s lt.eq 1$.

#thm([Lemma 4.1.])[
  (Weighted Kakeya estimate).  #emph[There are fixed constants $C$ and $N_0$ such that for every dyadic $N gt.eq N_0$, every initial array $d$, and every $0 < s lt.eq 1$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ integral H_d^(3 \/ 2) lt.eq C M \( s \)^(3 \/ 2) delta^(- 3 s \/ 2) delta^2 sum_nu b_nu \( d \)^(3 \/ 2) . $ <eq:weighted-tubes>]

 The constants $C \, N_0$ depend only on the fixed geometric setup.]
] <lem:weighted>

#proof[
  By Equation (2.4), the velocity map is bi-Lipschitz on the fixed frequency-label range, where it is bounded. The map $U mapsto \( U \, 1 \) \/ sqrt(1 + \| U \|^2)$ is bi-Lipschitz on this bounded range: its inverse is $omega mapsto omega' \/ omega_3$, whose derivative is bounded where $omega_3$ is bounded away from zero. Thus the directions
  $ omega_nu = frac(\( U_nu \, 1 \), sqrt(1 + \| U_nu \|^2)) $
  are separated by a fixed positive multiple of $delta$. Choose spherical caps $Omega_nu$ centered at $omega_nu$ with radius $c_1 delta$, where the fixed $c_1 > 0$ is small enough that these caps are disjoint. Their surface areas satisfy $c_2 delta^2 lt.eq \| Omega_nu \| lt.eq C_2 delta^2$.
  The center segment of $T_(nu \, z)$ has Euclidean length $sqrt(1 + \| U_nu \|^2)$, bounded by a fixed constant. For each $omega in Omega_nu$, its distance from the line through $\( z \, 0 \)$ in direction $omega$ is $O \( delta \)$. Adding the horizontal cross-section of radius $delta$ preserves this bound. The projection of the entire tube onto that line is an interval of bounded length. Cover that interval by a bounded number of intervals of length one. It follows that $T_(nu \, z)$ is contained in at most $C_3$ cylinders $cal(T)_(C_4 delta) \( a \, omega \)$, where $C_3$ and $C_4 gt.eq 1$ are fixed. In particular, for every $g in L^3 \( bb(R)^3 \)$,
  $ integral_(T_(nu \, z)) \| g \| lt.eq C delta^2 K_(C_4 delta) g \( omega \) #h(2em) \( omega in Omega_nu \) . $
  Averaging over $Omega_nu$, multiplying by $\| d_(nu \, z) \|^2$, and summing gives
  $ integral H_d \| g \| lt.eq C sum_nu b_nu \( d \) integral_(Omega_nu) K_(C_4 delta) g \( omega \) thin d omega . $
  Set $B_d = sum_nu b_nu \( d \) upright(bold(1))_(Omega_nu)$. Disjointness of the caps gives
  $ parallel B_d parallel_(L^(3 \/ 2) \( S^2 \)) lt.eq C (delta^2 sum_nu b_nu \( d \)^(3 \/ 2))^(2 \/ 3) . $
  Choose $N_0$ so that $C_4 delta < 1$. Hölder’s inequality on $S^2$ and Equation (4.3) now yield
  $ integral H_d \| g \| lt.eq C M \( s \) delta^(- s) (delta^2 sum_nu b_nu \( d \)^(3 \/ 2))^(2 \/ 3) parallel g parallel_3 . $
  We used $\( C_4 delta \)^(- s) lt.eq delta^(- s)$, so the displayed constant is independent of $s$. Duality between $L^(3 \/ 2)$ and $L^3$, followed by taking the power $3 \/ 2$, proves Equation (4.4). The sum over positions causes no loss because $K_rho$ already takes the supremum over cylinder locations. ◻
]

The next observation compares a single ellipse test with the tube mass. Recall that $E$ is a centered ellipse with semiaxes $L gt.eq a gt.eq delta$, and

$ W_kappa \( E \) = L^(1 + kappa) a^(1 - kappa) = L a \( L \/ a \)^kappa gt.eq L a . $

If a nonzero coordinate subarray $q$ of $d$ is supported on $U_nu in u + E$, $z in v + E$, then for $0 lt.eq t lt.eq 1$ the horizontal support of $H_q \( dot.op \, t \)$ lies in

$ v + t u + E + t E + B \( 0 \, delta \) subset v + t u + 3 E . $

Indeed, $B \( 0 \, delta \) subset E$, and the convexity and central symmetry of $E$ imply $E + t E = \( 1 + t \) E$. Therefore $\| "supp" H_q \| lt.eq 9 pi L a$. Equation (4.2) and Hölder’s inequality give

#[#set math.equation(numbering: n => "(4.5)")
 $ integral H_q^(3 \/ 2) gt.eq frac(#scale(x: 120%, y: 120%)[\(] integral H_q #scale(x: 120%, y: 120%)[\)]^(3 \/ 2), \| "supp" H_q \|^(1 \/ 2)) gt.eq pi / 3 thin m \( q \) (frac(m \( q \), W_kappa \( E \)))^(1 \/ 2) . $ <eq:bundle-lower>]

The bound is uniform in the eccentricity $L \/ a$, in the independent translations $u \, v$, and in $kappa > 0$.

#thm([Lemma 4.2.])[
  (Decomposition by capacity).  #emph[Let $d$ be a nonzero finite initial array, and let $n = \# "supp" d$. For every $0 < kappa < 1 \/ 10$, there is a decomposition into coordinate subarrays with pairwise disjoint supports, 
$ d = sum_(i = 1)^J d^(\( i \)) \, #h(2em) J lt.eq C log \( 2 + n \) \, $

 such that 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(i = 1)^J m \( d^(\( i \)) \) cal(K)_kappa \( d^(\( i \)) \)^(1 \/ 2) lt.eq C integral H_d^(3 \/ 2) . $ <eq:density-cost>]

 Both constants are absolute and independent of the nonzero coefficient sizes and of $kappa$.]
] <lem:density>

#proof[
  Write $D = max_(nu \, z) \| d_(nu \, z) \|^2 > 0$. A disk of radius $delta$, independently translated to a prescribed velocity and position, is an admissible test with weight $delta^2$. On the other hand, every test has $W_kappa \( E \) gt.eq delta^2$. Hence
  #[#set math.equation(numbering: n => "(4.7)")
   $ D lt.eq cal(K)_kappa \( d \) lt.eq n D . $ <eq:capacity-range>]
  Capacity is monotone under restriction to a subset of coordinates.
  Put $A = D \/ n^2$. The cost of any remaining array with capacity at most $A$ is controlled by the contribution of a largest original coefficient to the tube integral. Indeed, any coordinate subarray $r$ with $cal(K)_kappa \( r \) lt.eq A$ satisfies
  $ m \( r \) cal(K)_kappa \( r \)^(1 \/ 2) lt.eq delta^2 n D sqrt(D \/ n^2) = delta^2 D^(3 \/ 2) . $
  An original entry whose squared modulus is $D$ contributes $D upright(bold(1))_(T_(nu \, z))$ to $H_d$, whence $integral H_d^(3 \/ 2) gt.eq pi delta^2 D^(3 \/ 2)$. Thus the cost of any such remainder is controlled by $pi^(- 1) integral H_d^(3 \/ 2)$, independently of which entries remain.
  Start with remainder $r_1 = d$. Whenever $cal(K)_kappa \( r_j \) > A$, choose an ellipse test whose density is at least half of that supremum. Let $q_j$ contain all nonzero coordinates of $r_j$ selected by that test, write $E_j$ for its ellipse, and put
  $ rho_j = frac(m \( q_j \), W_kappa \( E_j \)) gt.eq 1 / 2 cal(K)_kappa \( r_j \) \, #h(2em) r_(j + 1) = r_j - q_j . $
  Such a test exists without assuming that the supremum is attained. It selects at least one nonzero entry, so the process terminates after at most $n$ removals. Denote the terminal remainder by $r_(*)$; then $cal(K)_kappa \( r_(*) \) lt.eq A$, including the possibility $r_(*) = 0$.
  We group the removed bundles by the capacity of the remainder from which they were selected. This controls the capacity of each group by its first remainder, while leaving only logarithmically many groups. For each integer $k gt.eq 0$, set $lambda_k = 2^k A$, and group together all $q_j$ for which
  $ lambda_k lt.eq cal(K)_kappa \( r_j \) < 2 lambda_k . $
  Let $d_k$ be the union array at this level, omitting empty levels. The array $d_k$ is a coordinate restriction of the remainder at the first removal in that level. Therefore $cal(K)_kappa \( d_k \) < 2 lambda_k$. Every bundle at this level has $rho_j gt.eq lambda_k \/ 2$, so additivity of $m$ gives
  $ m \( d_k \) cal(K)_kappa \( d_k \)^(1 \/ 2) & lt.eq sqrt(2 lambda_k) sum_(j upright(" at level ") k) m \( q_j \)\
 & lt.eq 2 sum_(j upright(" at level ") k) m \( q_j \) sqrt(rho_j) . $
  Use Equation (4.5) for each selected test. Since the $q_j$ are disjoint coordinate subarrays, their tube functions sum to a function bounded by $H_d$. For nonnegative numbers, $sum_j x_j^(3 \/ 2) lt.eq \( sum_j x_j \)^(3 \/ 2)$. Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ sum_k m \( d_k \) cal(K)_kappa \( d_k \)^(1 \/ 2) lt.eq C sum_j integral H_(q_j)^(3 \/ 2) lt.eq C integral H_d^(3 \/ 2) . $ <eq:level-cost>]
  The stopping estimate applies to $r_(*)$. Adding its cost to Equation (4.8) proves Equation (4.6).
  Finally, at every removal the capacity lies in $\( A \, n D \]$, by monotonicity and Equation (4.7). The ratio of these endpoints is $n^3$, so there are at most $1 + floor.l 3 log_2 n floor.r$ occupied dyadic levels. Including the nonzero remainder gives $J lt.eq C log \( 2 + n \)$. If $n = 1$, then $cal(K)_kappa \( d \) = D = A$; the process makes no removal and the remainder alone gives the conclusion. No lower bound on the smallest coefficient has been used. ◻
]

#thm([Proposition 4.3.])[
  (Discrete critical estimate).  #emph[Let $c$ be the terminal coefficient array obtained from $d$ by the synthesis and sampling map of Theorem 6, with any fixed permitted output mask. For every sufficiently large dyadic $N$, $0 < kappa < 1 \/ 10$, $0 < eta lt.eq 1$, and $0 < s lt.eq 1$, put $gamma_0 = 10 kappa + eta + 3 s \/ 2$. Then 
#[#set math.equation(numbering: n => "(4.9)")
 $ sum_(nu' \, z' \, j) \| c_(nu' \, z' \, j) \|^3 lt.eq C N^6 P \( kappa \, eta \) M \( s \)^(3 \/ 2) N^(gamma_0) log^2 \( 2 + N \) delta^2 sum_nu b_nu \( d \)^(3 \/ 2) . $ <eq:discrete-critical>]

 The constant $C$ and the lower threshold for $N$ are independent of $kappa \, eta \, s$. Their dependence is only on the fixed phase, windows, and label bounds; all additional parameter dependence is contained in $P \( kappa \, eta \)$ and $M \( s \)$.]
] <prop:discrete>

#proof[
  There is nothing to prove if $d = 0$. Otherwise use the decomposition in Lemma 8, and let $c^(\( i \))$ be the terminal array of $d^(\( i \))$ with the same output mask. The sampling map is linear, so $c = sum_i c^(\( i \))$. The triangle inequality in $ell^3$, Hölder’s inequality for the finite sum over $i$, and Theorem 6 give
  $ N^(- 6) sum \| c \|^3 & lt.eq J^2 sum_i N^(- 6) sum \| c^(\( i \)) \|^3\
 & lt.eq J^2 P \( kappa \, eta \) N^(10 kappa + eta) sum_i m \( d^(\( i \)) \) cal(K)_kappa \( d^(\( i \)) \)^(1 \/ 2)\
 & lt.eq C log^2 \( 2 + n \) P \( kappa \, eta \) N^(10 kappa + eta) integral H_d^(3 \/ 2) . $
  There are $O \( N^2 \)$ initial frequency labels and $O \( N^2 \)$ initial position labels in the fixed bounded ranges, so $n lt.eq C N^4$. It follows that
  #[#set math.equation(numbering: n => "(4.10)")
   $ N^(- 6) sum \| c \|^3 lt.eq C P \( kappa \, eta \) N^(10 kappa + eta) log^2 \( 2 + N \) integral H_d^(3 \/ 2) . $ <eq:packet-tube-comparison>]
  Insert Lemma 7 and use $delta^(- 3 s \/ 2) = N^(3 s \/ 2)$ to obtain Equation (4.9). Every coordinate restriction used above obeys the same label bounds as $d$, so the same packet constant $P \( kappa \, eta \)$ applies to every piece. ◻
]

== 5 Joint estimates on sparse balls <sec:sparse>

The factor $N^(gamma_0)$ in Proposition 9 is a small loss on a bounded region. To remove it later, we need an estimate for many distant regions with a single data norm on the right. The directions in which two translations fail to oscillate are confined to a small frequency set. Discarding that set costs little in $L^oo$; the remaining translations are almost orthogonal at the initial packet scale. This joint estimate supplies the input to the sparse-ball strategy for removing a spatial loss #cite(label("Tao1999Epsilon")) #cite(label("BourgainGuth2011")) #cite(label("Kim2017")); we prove the required estimate for $L^3$ data with the precise separation and uniformity below.

#thm([Proposition 5.1.])[
  (Sparse balls).  #emph[There is a constant $mu_0 in \( 0 \, 1 \)$ depending only on the fixed graph setup with the following property. Suppose that $h$ is supported in $Q_0$, $parallel h parallel_3 lt.eq 1$, and $0 < mu lt.eq mu_0$. Let $cal(B)$ be a finite family of balls of common radius $R$ such that 
$ \# cal(B) lt.eq mu^(- 8) \, #h(2em) R gt.eq mu^(- 100) \, #h(2em) \| x_B - x_(tilde(B)) \| gt.eq mu^(- 40) R quad \( B eq.not tilde(B) \) \, $

 where $x_B$ denotes the center of $B$. Choose a dyadic integer $N$ with $4 R lt.eq N^2 < 16 R$. For $0 < kappa < 1 \/ 10$ and $0 < eta \, s lt.eq 1$, put $gamma_0 = 10 kappa + eta + 3 s \/ 2$. Then 
#[#set math.equation(numbering: n => "(5.1)")
 $ lr(|{ \| F \| > mu } ∩ union.big_(B in cal(B)) B|) lt.eq C mu^(- 3) P \( kappa \, eta \) M \( s \)^(3 \/ 2) N^(gamma_0) log^2 \( 2 + N \) . $ <eq:sparse-estimate>]

 The constant $C$ and the threshold $mu_0$ are independent of $kappa \, eta \, s$, of the centers, and of their maximum separation.]
] <prop:sparse>

#proof[
  Write $delta = N^(- 1)$ and $D = D_(upright(f))$. Every window $chi_delta^nu$ meeting $Q_0$ lies in a fixed compact neighborhood $Q_1$ of $Q_0$, since $delta lt.eq 1$. Fix
  $ G = sup_(Q_1) \| nabla phi.alt \| \, #h(2em) Z > 4 \( 2 + G \) . $
  The initial spatial labels will satisfy $\| z \| lt.eq Z$ and the terminal spatial labels $\| z' \| lt.eq 1$. Thus all label bounds used in Proposition 9 are fixed independently of the small exponents. Throughout the proof we decrease $mu_0$, if necessary, only in terms of this fixed setup. In particular, we may require $N$ to exceed any fixed lower threshold needed below. The hypotheses give
  #[#set math.equation(numbering: n => "(5.2)")
   $ delta lt.eq 1 / 2 mu^50 \, #h(2em) mu^(- 8) lt.eq N \, #h(2em) H gt.eq mu^(- 40) R > 1 / 16 mu^(- 40) N^2 $ <eq:sparse-scale>]
  whenever $H$ is the separation of two distinct centers.
  #emph[Removing resonant frequencies.] Set $a_B = x_B - \( 0 \, 0 \, N^2 \/ 2 \)$. For each pair of distinct balls write $a_B - a_(tilde(B)) = \( q \, s_0 \) in bb(R)^2 times bb(R)$ and $H = \| \( q \, s_0 \) \|$. Its resonant set is
  $ Omega_(B \, tilde(B)) = { xi in Q_0 : \| q + s_0 nabla phi.alt \( xi \) \| lt.eq H mu^20 } . $
  If this set is nonempty, then
  $ H lt.eq \| q \| + \| s_0 \| lt.eq H mu^20 + \( G + 1 \) \| s_0 \| \, $
  so $\| s_0 \| gt.eq H \/ \[ 2 \( G + 1 \) \]$ for sufficiently small $mu_0$. For two points of $Omega_(B \, tilde(B))$, Equation (2.4) gives
  $ c \| xi - zeta \| lt.eq 2 H mu^20 \/ \| s_0 \| lt.eq C mu^20 . $
  Consequently each resonant set has area at most $C mu^40$. The union $Omega$ over all pairs therefore has area at most $C mu^24$. Define $h_(*) = h upright(bold(1))_(Q_0 \\ Omega)$, and let $F_(*)$ be the extension defining $F$ with $h$ replaced by $h_(*)$. By Hölder’s inequality,
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel F - F_(*) parallel_oo lt.eq parallel chi_1^(nu_(*)) parallel_oo thin parallel h parallel_3 \| Omega \|^(2 \/ 3) lt.eq C mu^16 lt.eq mu \/ 2 . $ <eq:sparse-excision>]
  The powers $20$, $40$, and $100$ provide ample room both for this discarded mass and for the phase estimates below; their precise values are not essential.
  #emph[A joint bound for the initial coefficients.] Let
  $ cal(U) = \[ 0 \, D^(- 1) \)^2 times \[ 0 \, 1 \) \, #h(2em) Gamma_nu = "supp" chi_delta^nu . $
  For $u in cal(U)$ and $B in cal(B)$ define
  #[#set math.equation(numbering: n => "(5.4)")
   $ h_(B \, u) \( xi \) & = h_(*) \( xi \) e #scale(x: 120%, y: 120%)[\(] \( a_B + u \) dot.op \( xi \, phi.alt \( xi \) \) #scale(x: 120%, y: 120%)[\)] \,\
d_(nu \, z)^(B \, u) & = integral h_(B \, u) \( xi \) chi_delta^nu \( xi \) e \( N^2 z dot.op xi \) thin d xi \, #h(2em) z in D^(- 1) delta bb(Z)^2 \,\
b_nu^(B \, u) & = sum_(\| z \| lt.eq Z) \| d_(nu \, z)^(B \, u) \|^2 . $ <eq:sparse-analysis>]
  Only angular windows meeting $Q_0$ need be retained. We claim that, uniformly in $u$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(B in cal(B)) b_nu^(B \, u) lt.eq C delta^2 integral_(Gamma_nu) \| h_(*) \|^2 . $ <eq:sparse-joint-mass>]
  If $h_(*) chi_delta^nu = 0$ almost everywhere, the claim is immediate. Otherwise choose a point $xi_g in Gamma_nu ∩ \( Q_0 \\ Omega \)$. For this $nu$, define the operator on #emph[unrestricted] $L^2 \( bb(R)^2 \)$ by
  $ \( T_nu f \)_(B \, z) = integral f \( xi \) chi_delta^nu \( xi \) e #scale(x: 120%, y: 120%)[\(] \( a_B + u \) dot.op \( xi \, phi.alt \( xi \) \) + N^2 z dot.op xi #scale(x: 120%, y: 120%)[\)] thin d xi \, #h(2em) \| z \| lt.eq Z . $
  We will apply it to $f = h_(*) upright(bold(1))_(Gamma_nu)$. This enlargement of the operator domain is useful: the kernel of $T_nu T_nu^(*)$ has the smooth amplitude $\( chi_delta^nu \)^2$, with no indicator of the excised set.
  For a single ball block, Parseval’s identity on the square of side $D delta$ containing $Gamma_nu$ gives
  $ sum_(z in D^(- 1) delta bb(Z)^2) \| \( T_nu f \)_(B \, z) \|^2 = \( D delta \)^2 integral \| f \( xi \) chi_delta^nu \( xi \) \|^2 thin d xi lt.eq C delta^2 parallel f parallel_2^2 . $
  Here the full spatial sum is understood before its restriction to $\| z \| lt.eq Z$; its Fourier frequencies are $N^2 z in \( D delta \)^(- 1) bb(Z)^2$. It follows that each diagonal ball block of $T_nu T_nu^(*)$ has operator norm at most $C delta^2$.
  For distinct $B \, tilde(B)$, an entry of this Gram operator is
  $ integral \( chi_delta^nu \( xi \) \)^2 e #scale(x: 120%, y: 120%)[\(] \( q + N^2 \( z - tilde(z) \) \) dot.op xi + s_0 phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi . $
  To estimate it, put $xi = nu + delta v$ and denote the resulting phase by $Psi \( v \)$. Let
  $ v_0 = frac(q + s_0 nabla phi.alt \( xi_g \), \| q + s_0 nabla phi.alt \( xi_g \) \|) \, #h(2em) Lambda = delta H mu^20 . $
  The direction $v_0$ is defined because $xi_g$ avoids every resonant set. On the entire support of the smooth amplitude $chi \( v \)^2$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ D_(v_0) Psi \( v \) & gt.eq delta #scale(x: 120%, y: 120%)[\(] H mu^20 - C H delta - 2 Z N^2 #scale(x: 120%, y: 120%)[\)] gt.eq Lambda \/ 2 \,\
\| partial^alpha Psi \( v \) \| & lt.eq C_alpha H delta^2 lt.eq C_alpha Lambda quad \( \| alpha \| gt.eq 2 \) \, #h(2em) Lambda gt.eq 1 / 16 N mu^(- 20) . $ <eq:sparse-phase-first>]
  For Equation (5.6), the two errors relative to $H mu^20$ are at most $C mu^30$ and $32 Z mu^20$ by Equation (5.2); their sum is at most $1 \/ 2$ after fixing $mu_0$. Equation (5.6) follows from the bounded higher derivatives of $phi.alt$ and $delta mu^(- 20) lt.eq mu^30 \/ 2$.
  Repeated integration by parts in the fixed direction $v_0$ now gives, for each fixed integer $k gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ lr(|integral \( chi_delta^nu \)^2 e #scale(x: 120%, y: 120%)[\(] \( q + N^2 \( z - tilde(z) \) \) dot.op xi + s_0 phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi|) lt.eq C_k delta^2 Lambda^(- k) lt.eq C_k delta^2 N^(- k) . $ <eq:sparse-kernel-decay>]
  For completeness, use the operator $\( 2 pi i D_(v_0) Psi \)^(- 1) D_(v_0)$ on the exponential. The lower bound for $D_(v_0) Psi$ and the higher derivative bounds imply that each fixed directional derivative of $\( D_(v_0) Psi \)^(- 1)$ is $O_k \( Lambda^(- 1) \)$. Applying the adjoint $k$ times to the fixed smooth bump therefore costs $O_k \( Lambda^(- k) \)$. No upper bound on the first derivative is required. In particular, these constants remain uniform as $H$ becomes arbitrarily large: the lower bound and the higher derivative bounds carry the same factor $H$.
  There are at most $C_Z N^2$ retained spatial labels in each ball block. Thus every row and column of the off-diagonal block matrix has at most $C_Z mu^(- 8) N^2 lt.eq C_Z N^3$ entries. Taking $k = 4$ in Equation (5.7) and applying the row and column sum bound for the $ell^2$ operator norm shows that its norm is at most $C delta^2$. Together with the diagonal block estimate, this gives $parallel T_nu parallel_(2 arrow.r 2)^2 lt.eq C delta^2$. Applying it to $h_(*) upright(bold(1))_(Gamma_nu)$ proves Equation (5.5).
  Since the windows have bounded overlap and $\| Gamma_nu \| lt.eq C delta^2$, Hölder’s inequality gives the precise power needed for Proposition 9:
  #[#set math.equation(numbering: n => "(5.8)")
   $ delta^2 sum_(nu \, B) \( b_nu^(B \, u) \)^(3 \/ 2) & lt.eq delta^2 sum_nu (sum_B b_nu^(B \, u))^(3 \/ 2) lt.eq C delta^5 sum_nu (integral_(Gamma_nu) \| h_(*) \|^2)^(3 \/ 2)\
 & lt.eq C delta^5 sum_nu \| Gamma_nu \|^(1 \/ 2) integral_(Gamma_nu) \| h_(*) \|^3 lt.eq C delta^6 . $ <eq:sparse-l3-mass>]
  #emph[Reconstruction and the discarded spatial tail.] Let $d^(B \, u)$ now denote the finite array in Equation (5.4) restricted to $\| z \| lt.eq Z$. Apply the synthesis and sampling map to this array, retaining only $nu' = nu_(*)$, $\| z' \| lt.eq 1$, and $0 lt.eq j < N^2$. Write the resulting array as $c_(z' \, j)^(B \, u)$. We next justify, uniformly in $B \, u \, z' \, j$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ c_(z' \, j)^(B \, u) = F_(*) #scale(x: 120%, y: 120%)[\(] a_B + u + \( N^2 z' \, j \) #scale(x: 120%, y: 120%)[\)] + O \( N^(- 3) \) . $ <eq:sparse-samples>]
  To do so, write $hat(d)^(B \, u)$ for the initial analysis array with the spatial grid untruncated. Lemma 4 at the initial scale gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ \( D delta \)^(- 2) sum_(nu \, z) hat(d)_(nu \, z)^(B \, u) chi_delta^nu \( xi \) e \( - N^2 z dot.op xi \) = h_(B \, u) \( xi \) quad upright("in ") L^2 \( bb(R)^2 \) . $ <eq:sparse-full-frame>]
  The same lemma gives the exact squared-mass identity
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(nu \, z) \| hat(d)_(nu \, z)^(B \, u) \|^2 = \( D delta \)^2 parallel h_(B \, u) parallel_2^2 = \( D delta \)^2 parallel h_(*) parallel_2^2 lt.eq C delta^2 . $ <eq:sparse-full-mass>]
  These statements require only $h in L^2 \( Q_0 \)$, which follows from the assumed $L^3$ bound and compact support. In particular, the possibly very large center modulation does not affect the bound.
  A matrix entry from an omitted $\| z \| > Z$ to a retained output is
  $ A_(z' \, j \; nu \, z) = \( D delta \)^(- 2) integral chi_delta^nu \( xi \) chi_1^(nu_(*)) \( xi \) e #scale(x: 120%, y: 120%)[\(] N^2 \( z' - z \) dot.op xi + j phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi . $
  After the substitution $xi = nu + delta v$, the prefactor is $D^(- 2)$, the amplitude has uniformly bounded smooth derivatives, and the derivative of the phase in the direction $- z \/ \| z \|$ is at least
  $ N \( \| z \| - 1 - G \) gt.eq c N \( 1 + \| z \| \) . $
  All phase derivatives of order at least two are bounded uniformly, because $j delta^2 lt.eq 1$. The same integration by parts argument therefore gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| A_(z' \, j \; nu \, z) \| lt.eq C_k \[ N \( 1 + \| z \| \) \]^(- k) . $ <eq:sparse-tail-entry>]
  There are $O \( N^2 \)$ angular labels, and on the spatial mesh $D^(- 1) N^(- 1) bb(Z)^2$,
  $ sum_(\| z \| > Z) \( 1 + \| z \| \)^(- 2 k) lt.eq C_k N^2 #h(2em) \( k > 2 \) . $
  Consequently each discarded part of a matrix row has squared $ell^2$ norm at most $C_k N^(4 - 2 k)$. By Equation (5.11), its pairing with $hat(d)^(B \, u)$ is at most $C_k N^(1 - k)$. Taking $k = 4$ proves Equation (5.9). One may justify all infinite sums by the $L^2$ convergence in Equation (5.10); the tail pairing is also absolutely convergent by Cauchy–Schwarz. Thus neither the data nor the sharp excision boundary has been differentiated.
  #emph[Summing samples and filling the balls.] Apply Proposition 9 to each retained array and sum over $B$. Equation (5.8) cancels its factor $N^6$ exactly and gives
  $ sum_(B \, z' \, j) \| c_(z' \, j)^(B \, u) \|^3 lt.eq C P \( kappa \, eta \) M \( s \)^(3 \/ 2) N^(gamma_0) log^2 \( 2 + N \) . $
  There are $O \( N^4 \)$ terminal spatial labels and $N^2$ times per ball, so the total number of samples is $O \( mu^(- 8) N^6 \) = O \( N^7 \)$. The cubed errors from Equation (5.9) sum to at most $C N^7 N^(- 9) = C N^(- 2)$. Using $\| a + b \|^3 lt.eq 4 \( \| a \|^3 + \| b \|^3 \)$ and $P \, M gt.eq 1$, we obtain
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_(B \, z' \, j) \| F_(*) #scale(x: 120%, y: 120%)[\(] a_B + u + \( N^2 z' \, j \) #scale(x: 120%, y: 120%)[\)] \|^3 lt.eq C P \( kappa \, eta \) M \( s \)^(3 \/ 2) N^(gamma_0) log^2 \( 2 + N \) \, $ <eq:sparse-cube-sum>]
  uniformly for $u in cal(U)$.
  Integrating in the common offset $u$ turns the sum for each ball into an integral over the disjoint half-open cells
  $ a_B + \( N^2 z' \, j \) + cal(U) \, #h(2em) \| z' \| lt.eq 1 \, quad 0 lt.eq j < N^2 . $
  These cells cover $B$. Indeed, for $y in B$ set $r = y - a_B$; then
  $ \| r' \| lt.eq R lt.eq N^2 \/ 4 \, #h(2em) N^2 \/ 4 lt.eq r_3 lt.eq 3 N^2 \/ 4 . $
  The lower corner $ell'$ of its horizontal cell in $D^(- 1) bb(Z)^2$ satisfies $\| ell' \| lt.eq N^2 \/ 4 + sqrt(2) \/ D < N^2$ for the fixed large $N$ under consideration. Hence $z' = ell' \/ N^2$ is a retained label, and $j = floor.l r_3 floor.r$ is one of the retained times. The change of variables has Jacobian one; the offset domain has fixed volume $D^(- 2)$. Equation (5.13) therefore implies
  $ sum_(B in cal(B)) integral_B \| F_(*) \( y \) \|^3 thin d y lt.eq C P \( kappa \, eta \) M \( s \)^(3 \/ 2) N^(gamma_0) log^2 \( 2 + N \) . $
  On ${ \| F \| > mu }$, Equation (5.3) gives $\| F_(*) \| > mu \/ 2$. Chebyshev’s inequality now proves Equation (5.1).
  All choices made in this proof involve only fixed geometric constants and fixed orders of differentiation. Thus $mu_0$ is independent of $kappa \, eta \, s$, as asserted. ◻
]

== 6 Global bounds and exponent dependence <sec:global>

To apply Proposition 10 globally, we cover each superlevel set by a controlled number of sparse families. The $L^4$ and gradient bounds below control the number of occupied unit cubes; slow growth of local point counts then selects the radii without a diameter bound.

We retain the fixed graph, support, and window from the preceding sections. All constants in this section, except for the displayed dependence on the small exponents, depend only on that fixed setup. The elementary estimates below use only Equation (2.1). The global estimate for $3 < p lt.eq 4$ additionally uses Proposition 10, and hence the packet input in Theorem 6.

=== 6.1 Elementary bounds and the number of occupied cubes <elementary-bounds-and-the-number-of-occupied-cubes>

#thm([Lemma 6.1.])[
  (Basic graph estimates).  #emph[Let $g in L^2 \( bb(R)^2 \)$ have compact support, and let 
$ G \( y' \, t \) = integral_(bb(R)^2) g \( xi \) e #scale(x: 120%, y: 120%)[\(] y' dot.op xi + t phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi . $

 If $phi.alt'' gt.eq c I$ on $bb(R)^2$, then 
#[#set math.equation(numbering: n => "(6.1)")
 $ parallel G parallel_(L^4 \( bb(R)^3 \)) lt.eq \( pi \/ c \)^(1 \/ 4) parallel g parallel_(L^2 \( bb(R)^2 \)) . $ <eq:elementary-lfour>]

 In particular, for $F = E_phi.alt \( h chi_1^(nu_(*)) \)$ with $h$ supported in $Q_0$, there is a fixed $C_(upright(b)) gt.eq 1$ such that 
#[#set math.equation(numbering: n => "(6.2)")
 $ parallel F parallel_4 + parallel F parallel_oo + parallel nabla F parallel_oo lt.eq C_(upright(b)) parallel h parallel_3 . $ <eq:basic-bounds>]

]
] <lem:basic>

#proof[
  Let $lambda$ be the finite complex measure on the graph of $phi.alt$ whose density in base coordinates is $g$. For $v in C_c^oo \( bb(R)^3 \)$, Cauchy–Schwarz gives
  $ lr(|integral v thin d \( lambda * lambda \)|) & lt.eq parallel g parallel_2^2 (integral.double_(bb(R)^2 times bb(R)^2) \| v \( xi + xi' \, phi.alt \( xi \) + phi.alt \( xi' \) \) \|^2 thin d xi thin d xi')^(1 \/ 2) . $
  Put $m = xi + xi'$ and $w = \( xi - xi' \) \/ 2$; this linear change has absolute Jacobian one. Write $w = r omega$, where $r > 0$ and $omega in S^1$, and set
  $ H_(m \, omega) \( r \) = phi.alt \( m \/ 2 + r omega \) + phi.alt \( m \/ 2 - r omega \) . $
  Uniform convexity implies
  $ H'_(m \, omega) \( r \) = integral_(- r)^r omega^(sans(T)) phi.alt'' \( m \/ 2 + s omega \) omega thin d s gt.eq 2 c r . $
  Thus $H_(m \, omega)$ is strictly increasing for $r > 0$, and the substitution $s = H_(m \, omega) \( r \)$ yields
  $ & integral.double \| v \( xi + xi' \, phi.alt \( xi \) + phi.alt \( xi' \) \) \|^2 thin d xi thin d xi'\
 & quad = integral_(bb(R)^2) integral_(S^1) integral_0^oo \| v \( m \, H_(m \, omega) \( r \) \) \|^2 r thin d r thin d omega thin d m lt.eq pi / c parallel v parallel_2^2 . $
  The omitted set $r = 0$ has measure zero. Consequently $lambda * lambda$ has an $L^2$ density with norm at most $\( pi \/ c \)^(1 \/ 2) parallel g parallel_2^2$, by the $L^2$ representation theorem. Its Fourier transform is $G \( - thin dot.op \)^2$ in the sense of tempered distributions. Plancherel therefore gives Equation (6.1); this reasoning applies to the stated rough data and does not assume the convolution has a density in advance.
  For $g = h chi_1^(nu_(*))$, compact support and Hölder’s inequality bound $parallel g parallel_2$ by a fixed multiple of $parallel h parallel_3$. Furthermore
  $ parallel F parallel_oo lt.eq parallel g parallel_1 \, #h(2em) parallel nabla F parallel_oo lt.eq 2 pi integral \| \( xi \, phi.alt \( xi \) \) \| thin \| g \( xi \) \| thin d xi . $
  Differentiation under the integral is valid because the integrands are supported in a fixed compact set. Another application of Hölder’s inequality proves Equation (6.2). ◻
]

For the covering argument, normalize $parallel h parallel_3 lt.eq 1$ and write

$ A_mu = { y in bb(R)^3 : \| F \( y \) \| > mu } \, #h(2em) 0 < mu lt.eq 1 . $

The half-open cubes $k + \[ 0 \, 1 \)^3$, $k in bb(Z)^3$, form a partition. Call such a cube occupied if it meets $A_mu$.

#thm([Lemma 6.2.])[
  (Finite occupancy).  #emph[There is a fixed $C_X gt.eq 1$ such that at most $C_X mu^(- 7)$ unit cubes are occupied. In particular, if $mu lt.eq C_X^(- 1)$, one can choose one point of $A_mu$ in each occupied cube to obtain a finite set $X$ satisfying $\# X lt.eq mu^(- 8)$.]
] <lem:occupancy>

#proof[
  First take any finite collection $cal(Q)$ of occupied cubes and choose $x_Q in Q ∩ A_mu$ for each of them. By Equation (6.2), on $B \( x_Q \, r_mu \)$, where $r_mu = mu \/ \( 2 C_(upright(b)) \) lt.eq 1 \/ 2$, one has $\| F \| > mu \/ 2$. These balls have overlap at most $125$: if a point belongs to one of them, its center lies within distance one, and at most $5^3$ unit lattice cubes can contain such centers. Separation of the selected points is not required. Therefore
  $ \# cal(Q) thin frac(pi, 96 C_(upright(b))^3) mu^7 lt.eq sum_(Q in cal(Q)) integral_(B \( x_Q \, r_mu \)) \| F \|^4 lt.eq 125 parallel F parallel_4^4 lt.eq 125 C_(upright(b))^4 . $
  For example, one may take $C_X = max { 1 \, 12000 C_(upright(b))^7 \/ pi }$. This bound holds for every finite collection of occupied cubes. An infinite collection would have finite subsets of arbitrarily large cardinality, a contradiction. Thus the full collection is finite with the same bound. Finally $C_X mu^(- 7) lt.eq mu^(- 8)$ when $mu lt.eq C_X^(- 1)$. ◻
]

=== 6.2 A multiscale cover without a diameter bound <a-multiscale-cover-without-a-diameter-bound>

The finite-growth and coloring argument below is the covering step of the sparse-ball method; compare Bourgain–Guth #cite(label("BourgainGuth2011")) arXiv version 3, Appendix, Lemma A.2. We retain explicit scale choices to track the dependence on the output exponent.

Fix once and for all a number $mu_0 > 0$ that is no larger than the threshold in Proposition 10, $C_X^(- 1)$, and $1 \/ 2$. In particular, for $0 < mu lt.eq mu_0$ we have

#[#set math.equation(numbering: n => "(6.3)")
 $ mu^(- 60) gt.eq 8 \, #h(2em) mu^(- 100) > 2 . $ <eq:fixed-geometric-thresholds>]

This choice is independent of all small exponents below.

#thm([Lemma 6.3.])[
  (Sparse covering).  #emph[Let $0 < tau lt.eq 1$, $0 < mu lt.eq mu_0$, and let $X$ be the set in Lemma 12. Set 
#[#set math.equation(numbering: n => "(6.4)")
 $ beta = tau / 4 \, #h(2em) J = ⌈32 / tau⌉ + 1 \, #h(2em) R_j = mu^(- 100 \( j + 1 \)) quad \( 0 lt.eq j lt.eq J \) . $ <eq:cover-scales>]

 The union of the occupied cubes is covered by at most 
#[#set math.equation(numbering: n => "(6.5)")
 $ 3 J #scale(x: 120%, y: 120%)[\(] 1 + 8 log_2 \( 1 \/ mu \) #scale(x: 120%, y: 120%)[\)] mu^(- beta) $ <eq:family-count>]

 families of balls. Each family has at most $mu^(- 8)$ balls, all of radius $R = 4 R_j$ for some $0 lt.eq j < J$, and its centers are separated by at least $mu^(- 40) R$. For the dyadic $N$ chosen in Proposition 10, 
#[#set math.equation(numbering: n => "(6.6)")
 $ 4 R lt.eq N^2 < 16 R \, #h(2em) N < 8 mu^(- 50 J) . $ <eq:cover-N>]

]
] <lem:sparse-cover>

#proof[
  If $X$ is empty there is nothing to cover. Otherwise, using open balls throughout, set
  $ n_j \( x \) = \# #scale(x: 120%, y: 120%)[\(] X ∩ B \( x \, R_j \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) x in X . $
  For each $x$ there is an index $0 lt.eq j < J$ with
  #[#set math.equation(numbering: n => "(6.7)")
   $ n_(j + 1) \( x \) lt.eq mu^(- beta) n_j \( x \) . $ <eq:slow-growth>]
  Indeed, failure at every index would imply $n_J \( x \) > mu^(- beta J) n_0 \( x \) gt.eq mu^(- beta J) > mu^(- 8)$, since $beta J > 8$, contrary to $\# X lt.eq mu^(- 8)$. Assign each $x$ one such index $j$ and the unique integer $k gt.eq 0$ for which
  $ 2^k lt.eq n_j \( x \) < 2^(k + 1) . $
  There are at most $J \( 1 + 8 log_2 \( 1 \/ mu \) \)$ nonempty groups with a common pair $\( j \, k \)$.
  In one group, choose a maximal pairwise disjoint collection of the open balls $B \( x \, R_j \)$, and denote its centers by $Y$. The collection is finite. Each unselected ball intersects a selected one, so every center in the group is within distance $2 R_j$ of a point of $Y$. A point of the unit cube containing that center is within a further distance $sqrt(3)$. Since $R_j gt.eq mu^(- 100)$, the balls ${ B \( y \, 4 R_j \) : y in Y }$ cover all cubes assigned to the group.
  Make a finite graph on $Y$, joining distinct $x \, y$ when $\| x - y \| < R_(j + 1) \/ 2$. For a fixed vertex $x$, the original balls $B \( y \, R_j \)$ of all its neighbors are disjoint and lie in $B \( x \, R_(j + 1) \)$: Equation (6.3) gives $R_j < R_(j + 1) \/ 2$. Each neighbor ball contains at least $2^k$ points of $X$, whereas Equation (6.7) gives
  $ n_(j + 1) \( x \) < mu^(- beta) 2^(k + 1) . $
  The degree of $x$ is therefore less than $2 mu^(- beta)$. A greedy coloring uses at most $3 mu^(- beta)$ colors. Centers of the same color are separated by at least $R_(j + 1) \/ 2$, and
  $ R_(j + 1) / 2 = mu^(- 100) / 2 R_j gt.eq mu^(- 40) \( 4 R_j \) $
  by Equation (6.3). Each color thus supplies a family satisfying the separation condition, with at most $\# X lt.eq mu^(- 8)$ balls and $R = 4 R_j gt.eq mu^(- 100)$.
  Multiplying the group and color counts proves Equation (6.5). A dyadic $N$ with $4 R lt.eq N^2 < 16 R$ exists, and satisfies
  $ N < 4 sqrt(R) = 8 mu^(- 50 \( j + 1 \)) lt.eq 8 mu^(- 50 J) . $
  The argument uses neither the absolute locations of the points nor the diameter of $X$. In particular, different clusters may be arbitrarily far apart. The use of open balls also resolves boundary cases: unselected balls meet selected balls by maximality, and equality in the graph’s distance threshold leaves the desired weak separation inequality intact. ◻
]

=== 6.3 Integration of the distribution bound <integration-of-the-distribution-bound>

#thm([Theorem 6.4.])[
  (Global graph estimate).  #emph[Fix a phase and window setup for which Theorem 6 and Proposition 10 apply. For $3 < p lt.eq 4$, put 
#[#set math.equation(numbering: n => "(6.8)")
 $ tau = p - 3 \, #h(2em) theta = 10^(- 6) tau^2 . $ <eq:theta-choice>]

 There is a constant $C$, independent of $p$ in this interval, such that 
#[#set math.equation(numbering: n => "(6.9)")
 $ parallel E_phi.alt \( h chi_1^(nu_(*)) \) parallel_p lt.eq C [P \( theta \, theta \) M \( theta \)^(3 \/ 2) tau^(- 7)]^(1 \/ p) parallel h parallel_3 $ <eq:global-graph-bound>]

 for all $h in L^3$ supported in $Q_0$. For $4 < p < oo$, Equation (6.2) alone gives $parallel E_phi.alt \( h chi_1^(nu_(*)) \) parallel_p lt.eq C_(upright(b)) parallel h parallel_3$.]
] <thm:graph>

#proof[
  By homogeneity it suffices to take $parallel h parallel_3 lt.eq 1$. In Proposition 10 choose $kappa = eta = s = theta$. These choices lie in the permitted parameter ranges, and
  $ gamma_0 = 10 kappa + eta + 3 / 2 s = 25 / 2 theta . $
  For $J$ in Equation (6.4), we have
  #[#set math.equation(numbering: n => "(6.10)")
   $ J lt.eq 34 / tau \, #h(2em) 50 J gamma_0 lt.eq 17 / 800 tau < tau / 4 . $ <eq:exponent-budget>]
  Consequently the scale in every family furnished by Lemma 13 satisfies
  $ N^(gamma_0) lt.eq 8^(gamma_0) mu^(- tau \/ 4) lt.eq 2 mu^(- tau \/ 4) \, #h(2em) log \( 2 + N \) lt.eq 53 J #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ mu \) #scale(x: 120%, y: 120%)[\)] . $
  Applying Proposition 10 to each family and summing over the cover yields, for $0 < mu lt.eq mu_0$,
  #[#set math.equation(numbering: n => "(6.11)")
   $ \| A_mu \| lt.eq C P \( theta \, theta \) M \( theta \)^(3 \/ 2) J^3 #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ mu \) #scale(x: 120%, y: 120%)[\)]^3 mu^(- 3 - tau \/ 2) . $ <eq:global-distribution>]
  Here the colors cost $mu^(- beta) = mu^(- tau \/ 4)$, while the scale factor costs at most $mu^(- tau \/ 4)$. The group count contributes one factor of $J \( 1 + log \( 1 \/ mu \) \)$, and the logarithm squared in Proposition 10 contributes the other two. All constants and $mu_0$ are independent of $tau$.
  The layer-cake identity, valid by Tonelli even before finiteness of the norm is known, is
  $ parallel F parallel_p^p = p integral_0^oo mu^(p - 1) \| A_mu \| thin d mu . $
  For its portion below $mu_0$, Equation (6.11) and $p = 3 + tau$ reduce the needed integral to
  #[#set math.equation(numbering: n => "(6.12)")
   $ integral_0^1 mu^(- 1 + tau \/ 2) #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ mu \) #scale(x: 120%, y: 120%)[\)]^3 thin d mu & = 2 / tau + 12 / tau^2 + 48 / tau^3 + 96 / tau^4 lt.eq 158 tau^(- 4) . $ <eq:layer-integral>]
  For example, the substitution $u = log \( 1 \/ mu \)$ turns the integral into $integral_0^oo e^(- tau u \/ 2) \( 1 + u \)^3 thin d u$, which gives the displayed identity by integrating each monomial. Since $p lt.eq 4$ and $J^3 lt.eq 34^3 tau^(- 3)$, the small-level contribution is at most $C P \( theta \, theta \) M \( theta \)^(3 \/ 2) tau^(- 7)$.
  For the remaining levels, again by Tonelli,
  $ p integral_(mu_0)^oo mu^(p - 1) \| A_mu \| thin d mu & lt.eq integral_({ \| F \| > mu_0 }) \| F \|^p lt.eq mu_0^(p - 4) parallel F parallel_4^4 lt.eq mu_0^(- 1) C_(upright(b))^4 . $
  This is uniform for $3 < p lt.eq 4$ and is absorbed into the previous bound because $P \, M gt.eq 1$ and $tau lt.eq 1$. Taking the $p$th root and restoring homogeneity proves Equation (6.9). If $p > 4$, directly use
  $ parallel F parallel_p^p lt.eq parallel F parallel_oo^(p - 4) parallel F parallel_4^4 lt.eq C_(upright(b))^p parallel h parallel_3^p . $
  ◻
]

The factor $tau^(- 7)$ explicitly records the elementary loss removal argument. The assumptions provide finite constants $P \( theta \, theta \)$ and $M \( theta \)$, but do not provide rates for them as $theta arrow.b 0$. Equation (6.9) therefore asserts no polynomial upper bound in $\( p - 3 \)^(- 1)$ for the full extension constant.

=== 6.4 A necessary divergence at the endpoint <a-necessary-divergence-at-the-endpoint>

#thm([Proposition 6.5.])[
  (Lower bound for the best constant).  #emph[For every nonempty compact smooth surface $Sigma$ in the stated class there is $c_Sigma > 0$ such that its best extension constant satisfies 
#[#set math.equation(numbering: n => "(6.13)")
 $ C_(Sigma \, p)^(upright("best")) gt.eq c_Sigma \( p - 3 \)^(- 1 \/ p) \, #h(2em) 3 < p lt.eq 4 . $ <eq:constant-lower-bound>]

 This conclusion does not use the Kakeya or packet estimates.]
] <prop:lower>

#proof[
  Choose a nonempty interior chart; a nonempty smooth surface with boundary also has such a chart. Write it in the affine graph form
  $ Psi \( xi \) = v_0 + L \( xi \, phi.alt \( xi \) \) \, #h(2em) xi in D \, $
  where $L$ is invertible, and write $d sigma = J_Sigma \( xi \) thin d xi$ on this chart. Take a fixed nonzero $g in C_c^oo \( D \)$ and define $f \( Psi \( xi \) \) = g \( xi \) \/ J_Sigma \( xi \)$ on the chart, with $f = 0$ elsewhere. This is a smooth surface datum with
  $ B_f := sup_(3 lt.eq p lt.eq 4) parallel f parallel_(L^p \( Sigma \)) < oo . $
  Let
  $ G \( y' \, t \) = integral g \( xi \) e #scale(x: 120%, y: 120%)[\(] y' dot.op xi + t phi.alt \( xi \) #scale(x: 120%, y: 120%)[\)] thin d xi \, #h(2em) A = parallel g parallel_2^2 > 0 . $
  Horizontal Plancherel and its derivative identity give, for $t gt.eq 0$,
  $ integral_(bb(R)^2) \| G \( y' \, t \) \|^2 thin d y' & = A \,\
integral_(bb(R)^2) \| y' \|^2 \| G \( y' \, t \) \|^2 thin d y' & = frac(1, \( 2 pi \)^2) ∥nabla #scale(x: 120%, y: 120%)[\(] g e \( t phi.alt \) #scale(x: 120%, y: 120%)[\)]∥_2^2 lt.eq B_g \( 1 + t \)^2 \, $
  where one may take $B_g = 2 \( 2 pi \)^(- 2) parallel nabla g parallel_2^2 + 2 parallel g nabla phi.alt parallel_2^2 > 0$. Set $K = max { 1 \, \( 2 B_g \/ A \)^(1 \/ 2) }$. The integral outside the disk $\| y' \| < K \( 1 + t \)$ is at most $B_g \/ K^2 lt.eq A \/ 2$, so at least $A \/ 2$ of the squared norm lies inside that disk. Hölder’s inequality on the disk implies
  #[#set math.equation(numbering: n => "(6.14)")
   $ integral_(bb(R)^2) \| G \( y' \, t \) \|^p thin d y' gt.eq \( A \/ 2 \)^(p \/ 2) \( pi K^2 \)^(1 - p \/ 2) \( 1 + t \)^(2 - p) gt.eq c_g \( 1 + t \)^(2 - p) \, $ <eq:horizontal-lower-bound>]
  uniformly for $3 lt.eq p lt.eq 4$, with the explicit positive choice
  $ c_g = min {\( A \/ 2 \)^(3 \/ 2) \( pi K^2 \)^(- 1 \/ 2) \, \( A \/ 2 \)^2 \( pi K^2 \)^(- 1)} . $
  Integrating Equation (6.14) over $t gt.eq 0$ yields $parallel G parallel_p^p gt.eq c_g \/ \( p - 3 \)$.
  The affine coordinates introduce exactly the factors
  $ E_Sigma f \( x \) = e \( x dot.op v_0 \) G \( L^(sans(T)) x \) \, #h(2em) parallel E_Sigma f parallel_p^p = \| det L \|^(- 1) parallel G parallel_p^p . $
  Hence, on setting $d_g = \| det L \|^(- 1) c_g > 0$, we obtain
  $ C_(Sigma \, p)^(upright("best")) gt.eq B_f^(- 1) d_g^(1 \/ p) \( p - 3 \)^(- 1 \/ p) gt.eq B_f^(- 1) min { d_g^(1 \/ 3) \, d_g^(1 \/ 4) } \( p - 3 \)^(- 1 \/ p) . $
  This proves Equation (6.13), with every choice of chart and datum fixed independently of $p$. ◻
]

== 7 Surface estimates and consequences <sec:surfaces>

=== 7.1 Passage to the surface <passage-to-the-surface>

We now deduce Theorem 1 from Theorem 14. Cover $Sigma$ by finitely many sufficiently small charts. By Lemma 3, after fixed affine normalizations each chart lies in a graph with a phase admissible for Theorem 6. The construction and its constants are fixed separately for each chart and do not depend on $p$. A measurable partition subordinate to the covering avoids any assumption that the data extend smoothly across chart boundaries.

Write one chart in ambient frequency coordinates as

$ xi = v_0 + L \( zeta \, phi.alt \( zeta \) \) \, #h(2em) zeta in A subset bb(R)^2 \, $

where $L$ is invertible and $A$ is bounded, possibly cut off by the boundary of the surface. Its surface measure is $J_Sigma \( zeta \) thin d zeta$, with $J_Sigma$ smooth and strictly positive on a neighborhood of the chart. For data supported on this piece, set

$ g \( zeta \) = cases(delim: "{", f #scale(x: 120%, y: 120%)[\(] v_0 + L \( zeta \, phi.alt \( zeta \) \) #scale(x: 120%, y: 120%)[\)] J_Sigma \( zeta \) \, & zeta in A \,, 0 \, & zeta in.not A .) $

Then

$ E_Sigma f \( x \) = e \( x dot.op v_0 \) integral_(bb(R)^2) g \( zeta \) e #scale(x: 120%, y: 120%)[\(] \( L^(sans(T)) x \)' dot.op zeta + \( L^(sans(T)) x \)_3 phi.alt \( zeta \) #scale(x: 120%, y: 120%)[\)] thin d zeta . $

The change of physical variables $y = L^(sans(T)) x$ contributes $\| det L \|^(- 1 \/ p)$ to the $L^p$ norm. Moreover,

$ parallel g parallel_3^3 & lt.eq \( sup_A J_Sigma \)^2 integral_(Sigma_(upright("chart"))) \| f \|^3 thin d sigma \,\
parallel f parallel_(L^3 \( Sigma_(upright("chart")) \)) & lt.eq sigma \( Sigma_(upright("chart")) \)^(1 \/ 3 - 1 \/ p) parallel f parallel_(L^p \( Sigma_(upright("chart")) \)) \, #h(2em) p > 3 . $

After the finite window partition of Equation (2.2), Theorem 14 applies to every resulting term. The determinant, area, window, and chart factors are bounded uniformly for $3 < p lt.eq 4$. Summing the finitely many terms by the triangle inequality gives Equation (1.1) in this range, with the quantitative bound Equation (1.3). Here $P_Sigma$ is the maximum of the finitely many packet constants, enlarged to be at least one.

For $p > 4$, the local $L^4$ and $L^oo$ bounds give the result directly, as in Theorem 14, and the same finite chart argument applies. No smoothness of $f$, nor of its extension by zero on the parameter plane, has been used. Boundary charts are therefore included.

Proposition 15 supplies Equation (1.4) for every nonempty surface by choosing a nonzero smooth datum in an interior chart. This completes the proof of Theorem 1 and the stated dependence on $p$.

=== 7.2 Free Schrödinger local smoothing <free-schrödinger-local-smoothing>

The extension estimate for a compact paraboloid controls all frequencies of the Schrödinger propagator through the transfer theorem of Lee, Rogers, and Seeger. The strict Sobolev inequality in Corollary 2 then supplies the summability across frequency scales.

#proof[
  On the compact paraboloid $Sigma = { \( y \, \| y \|^2 \) : \| y \| lt.eq 1 }$, write $thin d sigma = w \( y \) thin d y$, where $w \( y \) = sqrt(1 + 4 \| y \|^2)$. Apply Theorem 1 to the datum $g \( y \) \/ w \( y \)$ on $Sigma$. A fixed change of output variables then gives
  $ ∥integral_(\| y \| lt.eq 1) g \( y \) e^(i \( tau \| y \|^2 - xi dot.op y \)) thin d y∥_(L^p \( bb(R)_(xi \, tau)^3 \)) lt.eq C_p parallel g parallel_(L^p \( { \| y \| lt.eq 1 } \)) . $
  This is the compact-frequency extension estimate in Lee–Rogers–Seeger #cite(label("LeeRogersSeeger2013")) Equation (1.3) with both exponents equal to $p$. Their Theorem 1.1, with spatial dimension two and Besov summation exponent two, yields
  $ parallel e^(i t Delta) f parallel_(L^p \( bb(R)^2 times \[ 0 \, 1 \] \)) lt.eq C_p parallel f parallel_(B_(alpha \, 2)^p \( bb(R)^2 \)) \, #h(2em) alpha = 2 \( 1 - 2 \/ p \) - 2 \/ p = 2 - 6 \/ p . $
  For an inhomogeneous Littlewood–Paley partition $\( P_k \)_(k gt.eq 0)$, the uniform annular multiplier bound $parallel P_k f parallel_p lt.eq C_s 2^(- k s) parallel \( I - Delta \)^(s \/ 2) f parallel_p$ gives
  $ parallel f parallel_(B_(alpha \, 2)^p) lt.eq C_s (sum_(k gt.eq 0) 2^(- 2 k \( s - alpha \)))^(1 \/ 2) parallel f parallel_(W^(s \, p)) . $
  The series converges for $s > alpha$. This proves Equation (1.2) on Schwartz functions, and density gives the stated bounded extension. ◻
]

=== 7.3 Translation-invariant oscillatory integrals <translation-invariant-oscillatory-integrals>

A second application concerns phases whose curvature changes only by a scalar factor in time. Such a phase can be straightened by changing the output variables alone, reducing the estimate to one fixed elliptic graph. This is the translation-invariant setting of the output straightening theorem of Gao–Liu–Xi #cite(label("GaoLiuXi2025")) Theorem 1.12 and Section 4.1. We give the short argument for the two-dimensional input considered here, then allow a general smooth amplitude by Fourier expansion.

#thm([Corollary 7.1.])[
  (Elliptic translation-invariant Bourgain phases).  #emph[Let 
$ phi.alt \( x \, t \; y \) = x dot.op y + psi \( t \; y \) \, #h(2em) x \, y in bb(R)^2 \, quad t in bb(R) \, quad psi \( 0 \; y \) = 0 \, $

 be a fixed real smooth phase near the origin. Suppose throughout this neighborhood that 
$ M \( t \, y \) = D_y^2 partial_t psi \( t \; y \) quad upright("is definite") \, #h(2em) partial_t M \( t \, y \) = c \( t \, y \) M \( t \, y \) $

 for a smooth real scalar function $c$. On a sufficiently small fixed product chart, let $a$ be any fixed smooth amplitude with compact support in its interior. For every $3 < p < oo$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ ∥integral e^(i N phi.alt \( x \, t \; y \)) a \( x \, t \; y \) f \( y \) thin d y∥_(L^p \( bb(R)_(x \, t)^3 \)) lt.eq C_(phi.alt \, a \, p) N^(- 3 \/ p) parallel f parallel_(L^p \( bb(R)^2 \)) \, #h(2em) N gt.eq 1 \, $ <eq:bourgain-oscillatory>]

 where the operator is zero outside the output support of $a$. The constant may depend on the fixed chart, phase, amplitude and $p$, but not on $N$ or $f$.]
] <cor:bourgain-oscillatory>

#proof[
  Shrink the product neighborhood so that its input domain is a ball. Since $M$ is a Hessian in $y$, commuting its derivatives in $partial_t M = c M$ gives
  $ \( partial_(y_k) c \) M_(i j) = \( partial_(y_i) c \) M_(k j) . $
  Multiplication by $\( M^(- 1) \)_(j ell)$, summed over $j$, yields $\( partial_(y_k) c \) delta_(i ell) = \( partial_(y_i) c \) delta_(k ell)$. For each $k$, choose $ell = i eq.not k$; hence $nabla_y c = 0$. The input ball is connected, so $c = c \( t \)$. Set
  $ rho \( t \) = exp #h(-0.16667em) (integral_0^t c \( v \) thin d v) \, #h(2em) h \( y \) = partial_t psi \( 0 \; y \) \, #h(2em) S \( t \) = integral_0^t rho \( v \) thin d v . $
  The equation for $M$ now implies $D_y^2 \( partial_t psi - rho h \) = 0$. Thus $partial_t psi = rho \( t \) h \( y \) + b \( t \) dot.op y + d \( t \)$ for smooth functions $b \, d$. Integrating and using $psi \( 0 \; y \) = 0$ gives
  $ psi \( t \; y \) = S \( t \) h \( y \) + B \( t \) dot.op y + D \( t \) \, #h(2em) B \( t \) = integral_0^t b \( v \) thin d v \, quad D \( t \) = integral_0^t d \( v \) thin d v . $
  Since $S' = rho > 0$, it has a smooth local inverse $t = t \( s \)$. The output change $kappa \( u \, s \) = \( u - B \( t \( s \) \) \, t \( s \) \)$ therefore satisfies
  $ phi.alt \( kappa \( u \, s \) \; y \) = u dot.op y + s h \( y \) + r \( s \) \, #h(2em) r \( s \) = D \( t \( s \) \) . $
  Here $D_y^2 h = M \( 0 \, y \)$ is definite. No input coordinate change is needed.
  Put $z = \( u \, s \)$ and $A \( z \, y \) = a \( kappa \( z \) \; y \)$. Extend this fixed amplitude smoothly by zero, and periodically in $z$ across a fixed cube $Q$ of side $L$ whose interior contains its output support. On $Q$,
  $ A \( z \, y \) = sum_(k in bb(Z)^3) e^(2 pi i k dot.op z \/ L) A_k \( y \) \, #h(2em) sum_k parallel A_k parallel_oo < oo . $
  Indeed, integration by parts in $z$ gives $parallel A_k parallel_oo lt.eq C_m \( 1 + \| k \| \)^(- m)$ for any fixed $m > 3$. All coefficients have a common compact frequency support, and the constants are independent of $N$. Choose a compact graph patch $Sigma$, parametrized by $omega \( y \) = \( y \, h \( y \) \)$, with smooth boundary and parameter domain containing this support, and write $thin d sigma = w \( y \) thin d y$, where $w \( y \) = sqrt(1 + \| nabla h \( y \) \|^2)$. For
  $ g_k \( omega \( y \) \) = A_k \( y \) f \( y \) \/ w \( y \) $
  we have
  $ parallel g_k parallel_(L^p \( Sigma \))^p = integral \| A_k f \|^p w^(1 - p) thin d y lt.eq parallel A_k parallel_oo^p parallel f parallel_p^p . $
  The factor $e^(i N r \( s \))$ is unimodular, and each remaining Fourier term is $e^(2 pi i k dot.op z \/ L) E_Sigma g_k \( N z \/ \( 2 pi \) \)$. Minkowski’s inequality and Theorem 1, applied globally to each term, bound their sum on $Q$ by
  $ \( 2 pi \/ N \)^(3 \/ p) C_(Sigma \, p) sum_k parallel A_k parallel_oo parallel f parallel_p . $
  Changing back by $kappa$ contributes only the bounded factor $sup \| det D kappa \|^(1 \/ p)$ on the fixed output support. Absolute coefficient summability and the local $L^1$ integrability of $f$ justify the series and its interchange with the integral. This proves Equation (7.1), with no power loss in $N$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
