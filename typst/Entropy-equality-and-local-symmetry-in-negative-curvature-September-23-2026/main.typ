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

#align(center)[#text(size: 16pt, weight: "bold")[Entropy equality and local symmetry in negative curvature]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The topological entropy of a geodesic flow measures the exponential growth of its orbit complexity. Its Liouville entropy measures the complexity seen by the invariant probability measure naturally defined by the metric. The variational principle bounds the latter by the former. Katok’s entropy rigidity conjecture asks whether equality, in negative curvature, characterizes locally symmetric metrics.

Let $\( M^n \, g \)$ be a closed connected smooth Riemannian manifold, let $S M$ be its unit tangent bundle, and let $phi.alt_t$ be its unit-speed geodesic flow. Write $m_L$ for normalized Liouville measure; thus, if $sigma_x$ is rotationally invariant probability measure on $S_x M$,

$ integral_(S M) a thin d m_L = frac(1, "Vol"_g \( M \)) integral_M integral_(S_x M) a \( x \, v \) thin d sigma_x \( v \) thin d "Vol"_g \( x \) . $

Both entropies below use natural logarithms.

#thm([Theorem 1.1.])[
  #emph[Suppose $n gt.eq 3$ and every sectional curvature of $g$ is strictly negative. Then 
$ h_(m_L) \( phi.alt_1 \) = h_(upright("top")) \( phi.alt_1 \) quad arrow.l.r.double quad nabla^g R_g = 0 . $

 Equivalently, equality holds precisely when the universal Riemannian cover is a rank-one symmetric space of noncompact type, at an arbitrary overall scale.]
] <thm:main>

The rank-one conclusion includes real, complex, quaternionic and Cayley hyperbolic geometry in the dimensions where these occur. Local symmetry therefore need not mean constant sectional curvature.

The theorem also separates the two natural invariant probabilities when the metric is not locally symmetric. In that case the unique maximal-entropy probability is mutually singular with $m_L$: Theorem 1 makes them distinct, and distinct ergodic invariant probabilities are mutually singular. Here uniqueness and ergodicity of the maximal-entropy probability follow from thermodynamic formalism #cite(label("BowenRuelle1975")); Liouville ergodicity is recalled below.

=== 1.1 History and context <history-and-context>

#cite(label("Katok1982"), form: "prose") p. 347 formulated the conjecture and proved its surface case. His surface argument places Liouville entropy below, and topological entropy above, the entropy of the constant-curvature metric of the same area, with rigidity in equality #cite(label("Katok1982")) Theorem B. He also obtained the higher-dimensional rigidity statement within the conformal class of a locally symmetric metric #cite(label("Katok1982")) Corollary 2.5. For higher-dimensional real hyperbolic metrics, #cite(label("Flaminio1995"), form: "prose") Theorem A proved positivity of the second variation of the entropy gap along fixed-volume metric paths whose initial tangent is transverse to the diffeomorphism orbit. In particular, equality is locally isolated along each such path. His Theorem C also gives a real hyperbolic three-manifold at which the fixed-volume Liouville-entropy Hessian is indefinite. Thus the surface strategy through a Liouville-entropy maximum does not extend directly to higher dimensions. #cite(label("Humbert2026"), form: "prose") Theorem 1 subsequently proved rigidity throughout a sufficiently small $C^N$ neighborhood of any fixed real or complex hyperbolic metric, for a suitable finite $N$.

Entropy rigidity for more general flows also illuminates the problem. For smooth contact Anosov flows on closed three-dimensional phase spaces, #cite(label("Foulon2001"), form: "prose") characterized maximal-entropy measure in the smooth volume class by conjugacy, up to finite covers, to a constant-negative-curvature surface geodesic flow. #cite(label("DeSimoiLeguilVinhageYang2020"), form: "prose") Theorem A removed the contact assumption for flows preserving smooth volume, with an algebraic class that also includes suspension flows. In the geodesic setting, however, the phase space has dimension $2 n - 1$: three-dimensional phase space corresponds to a surface base, whereas Theorem 1 concerns phase dimension at least five.

The present question also differs from minimizing volume entropy in a fixed homotopy class. Volume entropy is the exponential growth rate of balls in the universal cover. The theorem of Besson–Courtois–Gallot #cite(label("BessonCourtoisGallot1995")), with the Cayley case corrected by Ruan #cite(label("Ruan2024")), gives rigidity from a locally symmetric target and equality in a scale-invariant volume-entropy comparison. Here the symmetric target is a conclusion of the argument: it appears through the theorem of Benoist–Foulon–Labourie #cite(label("BenoistFoulonLabourie1992")) only after the invariant distributions have been proved globally smooth. Proposition 5 records this conditional final step, including the period and volume identities needed to return from the flow model to the metric.

=== 1.2 Proof strategy <proof-strategy>

The main obstacle is transverse regularity. Negative curvature supplies stable and unstable distributions $E^s \, E^u$, contracted respectively in positive and negative time. They integrate to smooth individual leaves, whose local pieces we call plaques, but the distributions need not vary smoothly across the leaves. We prove that entropy equality forces precisely this missing smoothness. The proof has four stages.

===== 1.2.1 Entropy supplies transported volume data. <entropy-supplies-transported-volume-data.>

Let $J$ be the infinitesimal unstable volume-expansion rate and let $h$ be the common entropy. The entropy formula, Bowen–Ruelle thermodynamic formalism #cite(label("BowenRuelle1975")), the upper and lower Gibbs estimates #cite(label("Climenhaga2024")) Theorem 3.1, and Livšic cohomology #cite(label("Livsic1972")) give $J = h + X F$, where $X$ generates the flow. In Section 2, the resulting transfer function produces two conormal volume forms: one annihilates $E^u$, the other $E^s$, and flow transport multiplies them by $e^(- h t)$ and $e^(h t)$. Their controlled derivatives along individual weak leaves provide the initial data; ambient smoothness is still to be established.

===== 1.2.2 Plaque jets produce coherent formal fields. <plaque-jets-produce-coherent-formal-fields.>

A finite jet records finitely many Taylor coefficients. We encode the jets of actual plaques and their conormal densities in finite-dimensional spaces on which the dynamics contracts: forward for unstable-plaque records at stable crossings, and backward for the opposite records. Section 3 constructs compatible normal coordinates for these spaces. Nonstationary normal-form theory provides polynomial models for contracting dynamics: #cite(label("GuysinskyKatok1998"), form: "prose") treated the narrow-band setting, and #cite(label("Melnick2019"), form: "prose") and #cite(label("KalininSadovskaya2017"), form: "prose") developed the theory for measurable contractions. The precise normalization and estimates needed here are proved directly. Section 4 takes the polynomial relations obeyed by actual plaque jets, then extracts affine families of alternative conormal covectors from their solution sets. Theorem 13 supplies full ambient formal Taylor coefficients for these families. Along both actual foliations those coefficients are smooth and differentiate consistently as the center moves. All constructions use finite weight cutoffs; no formal series is evaluated by assuming it converges.

===== 1.2.3 Formal symmetries give an algebraic alternative. <formal-symmetries-give-an-algebraic-alternative.>

Section 5 studies formal vector fields preserving the contact form and both affine families, order by order. Their values span the tangent space of a transverse section. A dilation determined by the Lyapunov exponents belongs to this symmetry algebra, and the entropy multipliers give a trace identity for symmetries fixing the section’s center. Section 6 combines that identity with Cartan–Guillemin structure theory #cite(label("Guillemin1968")), in the formulations recalled by #cite(label("BakalovDAndreaKac2001"), form: "prose") and #cite(label("FattoriKac2002"), form: "prose"), together with the associated classification and derivation results. Theorem 46 leaves two possibilities: a finite-dimensional symmetry algebra supplies formal fields with values $E^s \, E^u$; an infinite-dimensional one supplies nonzero stable and unstable directions joined by a formal flat affine connection.

===== 1.2.4 Quantitative realization recovers actual geometry. <quantitative-realization-recovers-actual-geometry.>

The last two sections turn these formal conclusions into smooth maps using finite Taylor truncations, dynamical transport and interpolation. In the infinite alternative, Section 7 first constructs a complete proper stable ray. Sampling on expanding stable plaques then controls the derivatives of truncated unstable translations. Their limits give actual mixed stable–unstable rectangles along the ray, which the endpoint geometry at infinity rules out. In the finite alternative, Section 8 uses the same type of quantitative estimates to prove smoothness of functions labeling the actual weak unstable leaves. Bounds on holonomy volume distortion make these labels submersions, so their kernels yield the globally smooth invariant splitting of Theorem 69. The conditional classical rigidity step then applies. Section 9 assembles the forward implication and proves the locally symmetric converse.

All curvature bounds depend on the given compact metric; their ratio is unrestricted. Typical points refer throughout to smooth Liouville volume. Formal objects are interpreted order by order, while every passage to an actual map is justified by the stated finite-order estimates.

== 2 Dynamical preliminaries <pre:section>

Put $m = n - 1$, let $X$ be the geodesic vector field, and let $alpha$ be the canonical contact form on $S M$, normalized by $alpha \( X \) = 1$. The strong Anosov splitting is

$ T \( S M \) = E^s xor bb(R) X xor E^u \, #h(2em) ker alpha = E^s xor E^u . $

The strong foliations are denoted by $W^s \, W^u$. Their weak versions include the flow direction. We use the following classical facts for compact strictly negatively curved geodesic flows: uniform hyperbolicity, smooth individual strong and weak leaves with uniform local bounds at each finite order, absolute continuity of the foliations, and ergodicity of Liouville volume. The hyperbolic structure comes from Anosov’s theory #cite(label("Anosov1967")). For Hopf’s ergodic argument and the bounded-Jacobian form of absolute continuity, see Brin’s appendix in #cite(label("Ballmann1995"), form: "prose") Appendix, Sections 2 and 5.

Passing to an oriented finite cover of $M$ preserves both entropies and allows the conormal volumes below to be defined globally. Indeed the lifted Lyapunov exponents and normalized smooth entropy formula are unchanged; topological entropy can equally be computed by volume growth on the common universal cover #cite(label("Manning1979")). Local symmetry descends through this cover. We therefore assume $M$ oriented until the end.

Fix a time $T > 0$ for which $f = phi.alt_T$ is ergodic for $m_L$. Such times exist for an ergodic flow. We can replace $T$ by a sufficiently large ergodic time when a one-step contraction is convenient. Norms in a fixed finite-dimensional smooth bundle are measured using an auxiliary smooth metric. Compactness makes all such fixed choices equivalent.

=== 2.1 Leaf estimates and regular sets <leaf-estimates-and-regular-sets>

#thm([Lemma 2.1.])[
  (Uniform smooth plaque charts).  #emph[The strong and weak stable and unstable foliations admit smooth local plaque charts on uniform geometric neighborhoods. At every fixed finite order, their chart and inverse norms are uniformly bounded, and their leaf derivatives depend continuously on the center.]
] <pre:uniform-plaques>

#proof[
  For every finite $r gt.eq 2$, the smooth orbit foliation is $r$-normally hyperbolic: $d phi.alt_t X = X compose phi.alt_t$ has uniformly bounded norm in both time directions, whereas the normal strong directions contract exponentially in the appropriate direction. Its tangent field is smooth, so the Lipschitz tangent-field hypothesis of #cite(label("HirschPughShub1970"), form: "prose") Section 3, pp. 1017–1018 applies. Their stable and unstable manifolds of orbit leaves form $C^r$ laminations, hence give weak plaque charts continuous in the $C^r$ topology. Compactness supplies uniform bounds on smaller plaques, including lower bounds for the differentials of their parametrizations.
  Here the contact form recovers the strong plaques with the same finite-order control. Invariance and forward contraction give $alpha \( E^s \) = 0$ and $d alpha \( E^s \, E^s \) = 0$; also $iota_X d alpha = 0$. Thus $alpha$ restricts to a closed form on each weak stable plaque. In a $C^r$ plaque chart its pullback $beta$ is $C^(r - 1)$. Its local primitive $tau$, normalized at the center, satisfies $d tau = beta$ and is therefore $C^r$ with uniform bounds. On the plaque, $X tau = 1$. The uniform implicit function theorem makes its central level a $C^r$ disk tangent to $E^s$. A path in this disk has its length exponentially contracted by forward flow, so its points lie in the genuine strong stable leaf. Local uniqueness of the $C^1$ stable manifold identifies the disk with the strong plaque. Reverse time for the unstable case.
  The neighborhoods just obtained may initially depend on $r$. Fix instead a sufficiently small uniform $C^1$ strong plaque domain, written as a graph over its central tangent plane. For each $r$, a fixed sufficiently long iterate sends this entire domain into the smaller uniformly controlled $C^r$ plaque at the image center. Pull back that chart by the smooth inverse iterate. The chart differential and the fixed inverse iterate have uniform lower bounds; projection to the original tangent plane also has a uniformly invertible differential, by the fixed $C^1$ graph bound. The implicit function theorem therefore gives uniform $C^r$ bounds on the original domain. The iterate and bounds may depend on $r$; the domain does not. These operations preserve continuous dependence in $C^r$. Thickening the strong plaques by a fixed bounded flow interval gives the corresponding weak charts. This proves leafwise regularity and continuous leaf jets, without transverse differentiability. ◻
]

#thm([Lemma 2.2.])[
  #emph[On uniformly sized local strong stable plaques, expressed in smooth plaque charts at the successive orbit points, every fixed positive derivative order of $f^j$ decays exponentially. The analogous statement holds for $f^(- j)$ on strong unstable plaques. On weak plaques in bounded flow boxes, all derivatives of the corresponding forward or backward maps are uniformly bounded at each fixed order.]
] <pre:plaque-contraction>

#proof[
  Choose a sufficiently long iterate so that the first derivative on the contracted plaques has norm at most $rho < 1$, and use uniform plaque charts whose finite smooth norms are bounded. The first derivative of a composition of $j$ plaque maps is bounded by $rho^j$. For the second derivative the chain rule gives a sum bounded by a constant times
  $ sum_(i = 0)^(j - 1) rho^(j - 1 - i) rho^(2 i) lt.eq C rho^(j - 1) . $
  At derivative order $r$, the chain rule separates the term linear in the order-$r$ derivative of the preceding composition from terms containing at least two derivatives of lower positive orders. Induction bounds the latter by $C_r rho^(2 i)$ at time $i$; the same geometric sum proves the assertion, after changing $C_r$. Boundedly many omitted iterates only change constants. For weak plaques, use the chart $\( y \, t \) mapsto phi.alt_t \( y \)$ over a strong plaque with $t$ in a fixed compact interval. The dynamics commutes with the flow and carries $t$ unchanged. The strong-plaque estimates and smoothness of these bounded flow boxes prove the last assertion. ◻
]

We use the multiplicative ergodic theorem and its tempered estimates on finite tensor and jet bundles #cite(label("Oseledets1968")). Here “tempered” means that the relevant positive bounds and reciprocal radii grow more slowly than $e^(epsilon \| j \|)$ along an orbit for every $epsilon > 0$, with constants depending on the orbit and on the finite order. A regular set may be reduced countably many times. In particular, we impose all finite-order Oseledets conclusions and recurrence to all the positive-measure bounded sets selected later.

We also require leafwise agreement with regular data. This convention has the following precise meaning. In a countable cover by local foliation boxes, disintegration and absolute continuity imply that a conull set meets almost every plaque in a conull set for its intrinsic smooth measure. Removing the exceptional centers is again a null-set removal. Apply this to both strong foliations and their weak versions, repeat after each countable refinement, and intersect over the refinements and all integer iterates. A typical center then has leaf-almost-everywhere agreement with every regular datum under consideration on both entire strong leaves. The extension to an entire leaf uses countably many transported plaque boxes. An identity at every point of such a leaf will always be obtained separately by a smooth or continuous extension; it is not a direct consequence of this measure-theoretic convention.

=== 2.2 Entropy and the conormal forms <entropy-and-the-conormal-forms>

In contact Jacobi coordinates, a vector in $ker alpha_v$ is a pair $\( q \, q' \) in v^perp xor v^perp$. The unstable Riccati tensor $U \( v \)$ is symmetric, uniformly positive definite, and satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ X U + U^2 + R_v = 0 \, #h(2em) R_v \( q \) = R \( q \, v \) v . $ <pre:riccati>]

The graphs of $U \( v \)$ and $- U \( - v \)$ are $E_v^u$ and $E_v^s$, respectively. The tensor $U$ is Hölder on $S M$ and has uniformly bounded smooth leaf jets on weak unstable plaques. Set $J = "tr" U$.

#thm([Proposition 2.3.])[
  #emph[The potential $- J$ has pressure zero and Liouville volume is an equilibrium state for it. If $h_(m_L) \( phi.alt_1 \) = h_(upright("top")) \( phi.alt_1 \) = h$, there is a Hölder function $F$ with flow derivative satisfying 
#[#set math.equation(numbering: n => "(2.2)")
 $ J = h + X F . $ <pre:cohomology>]

 The function $F$ is smooth on weak unstable plaques, with uniform bounds at each finite leaf order. There are continuous horizontal $m$-forms $u \, w$, with $u$ annihilating $E^u$ and $w$ annihilating $E^s$, such that 
#[#set math.equation(numbering: n => "(2.3)")
 $ phi.alt_t^(*) u = e^(- h t) u \, #h(2em) phi.alt_t^(*) w = e^(h t) w \, #h(2em) u and w = c_(*) \( d alpha \)^m \, quad c_(*) eq.not 0 . $ <pre:volume-transport>]

 The form $u$ has smooth uniformly bounded finite jets on weak unstable plaques, and $w$ has the analogous property on weak stable plaques. These leaf jets vary continuously in uniform plaque charts.]
] <pre:entropy-forms>

#proof[
  The unstable Jacobian rate in the horizontal graph volume is $J$. Changing graph volume changes that rate by a flow coboundary. Ruelle’s entropy inequality gives $h_mu \( phi.alt_1 \) lt.eq integral J thin d mu$ for every flow-invariant probability measure, while Pesin’s formula gives equality for smooth Liouville volume #cite(label("Ruelle1978")) #cite(label("Pesin1977")). The variational principle for pressure proves the first assertion.
  Assume entropy equality. Then $m_L$ is the equilibrium state both for $- J$ and for the constant potential $- h$, each with pressure zero. The flow is topologically transitive, since its ergodic Liouville measure has full support. Thermodynamic formalism #cite(label("BowenRuelle1975")) gives upper and lower Gibbs bounds for ordinary forward-time Bowen balls; we use the precise formulation in #cite(label("Climenhaga2024"), form: "prose") preprint version 2, Theorem 3.1 and Equation (1.5). For a sufficiently small fixed Bowen radius valid for both potentials, apply both estimates to the same orbit ball centered on a periodic orbit of period $ell$, observed for $k ell$ units of time. Their comparison bounds
  $ lr(|k integral_0^ell \( J \( phi.alt_t v \) - h \) thin d t|) $
  by $log Q_J + log Q_h$, where $Q_J \, Q_h$ are the two Gibbs constants, independent of the positive integer $k$. Dividing by $k$ proves that the integral vanishes on every periodic orbit. Livšic’s theorem #cite(label("Livsic1972")) yields (2.2) with $F$ Hölder and differentiable along the flow.
  If $x \, y$ lie on one local strong unstable plaque, Hölder continuity and backward contraction give
  #[#set math.equation(numbering: n => "(2.4)")
   $ F \( y \) - F \( x \) = integral_(- oo)^0 #scale(x: 120%, y: 120%)[\(] J \( phi.alt_t y \) - J \( phi.alt_t x \) #scale(x: 120%, y: 120%)[\)] thin d t . $ <pre:transfer-integral>]
  Every positive leaf derivative of the integrand decays exponentially by Lemma 3 and the uniform finite leaf bounds for $J$. Differentiation under the integral proves the strong-unstable assertion. The flow equation supplies the flow derivatives and mixed weak-leaf derivatives. Uniform bounds of arbitrarily high order, combined with continuity of the functions and the uniform plaque charts, show by interpolation that every fixed leaf derivative varies continuously also when the plaque varies. This conclusion asserts continuity of the leaf jets, not transverse differentiability.
  Let $"vol"_(v^perp)$ be the oriented normal volume. Define a horizontal form by
  $ u_v #scale(x: 120%, y: 120%)[\(] \( q_1 \, q'_1 \) \, dots.h \, \( q_m \, q'_m \) #scale(x: 120%, y: 120%)[\)] = e^(F \( v \)) "vol"_(v^perp) \( q'_1 - U q_1 \, dots.h \, q'_m - U q_m \) \, #h(2em) iota_X u = 0 . $
  It annihilates $E^u$. Jacobi’s equation together with (2.1) gives
  $ frac(d, d t) \( q' - U q \) = - U \( q' - U q \) . $
  Taking determinants and using (2.2) proves the first transport identity. Let $iota \( v \) = - v$ be the flip and take $w = iota^(*) u$, up to a fixed nonzero normalization. Since $iota phi.alt_t = phi.alt_(- t) iota$, it has the asserted opposite transport and leaf regularity. The two graph planes are transverse, so $u and w$ is nowhere zero on the contact bundle. Its ratio with $\( d alpha \)^m$ is continuous and invariant. Ergodicity makes the ratio constant almost everywhere, and full support of $m_L$ makes it constant everywhere. ◻
]

On a local transverse section, use flow-box coordinates $\( p \, tau \)$ with $X = partial_tau$. Invariance of the contact form gives

#[#set math.equation(numbering: n => "(2.5)")
 $ alpha = d tau + theta \( p \) \, #h(2em) omega = d theta \, #h(2em) u = e^(- h tau) u \( p \) \, #h(2em) w = e^(h tau) w \( p \) . $ <pre:section-conventions>]

Here $omega$ is symplectic. Changing the section includes the displayed height factors. All later constructions respect this convention.

=== 2.3 The classical final step <the-classical-final-step>

The new argument will establish the hypothesis of the following classical rigidity statement. We give its proof in Section 9, where the period and volume identities recover the metric from the smooth flow model.

#thm([Proposition 2.4.])[
  #emph[If $E^s$ and $E^u$ are smooth on $S M$, then $\( M \, g \)$ is locally symmetric.]
] <pre:smooth-rigidity>

== 3 Contracting plaque jets and exact normal coordinates <nf:section>

We record graph and log-density derivatives of unstable plaques at their crossings with a stable axis. Under $f$, these finite state records contract, although the unstable plaques themselves expand. We construct smooth normal coordinates at each finite level, compatible with forgetting higher derivatives. Their polynomial dynamics supplies the finite algebraic data for the hull construction in Section 4; the stable-plaque construction uses $f^(- 1)$.

We work over the ergodic transformation $f = phi.alt_T$ chosen in the preliminaries. All assertions involving Lyapunov decompositions concern a common invariant conull set. The conull set is refined countably many times, in particular once for each finite jet order. No regularity of the normal coordinates as functions of their centers will be used.

=== 3.1 The raw graph and log-density towers <the-raw-graph-and-log-density-towers>

Choose a transverse section at $v$ and symplectic coordinates $\( x \, y \)$, with $x \, y in bb(R)^m$, in which the central stable and unstable plaques are $y = 0$ and $x = 0$, respectively. The two plaques are smooth transverse Lagrangians, so the relative Lagrangian neighborhood construction provides these coordinates. One may first straighten one plaque and then subtract the differential defining the other plaque as a graph. Choose the height coordinate so that height zero agrees with both central strong plaques. The resulting section maps, height functions, and axis parametrizations have bounded norms at every fixed smooth order on uniform smaller charts. This follows from the uniform leafwise bounds and the usual local symplectic coordinate construction; none of these choices needs to vary smoothly with $v$.

An unstable plaque crossing the stable axis at $\( a \, 0 \)$ is written $x = P \( y \)$, where $P \( 0 \) = a$. Its conormal form on the section is

#[#set math.equation(numbering: n => "(3.1)")
 $ e^(c \( x \, y \) + r \( y \)) and.big_(i = 1)^m (d x_i - sum_(q = 1)^m partial_q P_i \( y \) thin d y_q) . $ <nf:graph-form>]

Fixed nonzero units and orientation signs are suppressed in this formula. They will be retained as constant factors under a change of chart. We choose the smooth background $c$ so that $r \( 0 \) = 0$ for every actual crossing and $r = 0$ along the central unstable plaque. Here is why this choice is available without transverse smoothness. Along the unstable axis the actual form $u$ is smooth. Along the stable axis its coefficient in (3.1) is the reciprocal, up to the fixed wedge-pairing constant, of the coefficient of $w$ in $and.big d y_i$. That coefficient is smooth along the stable plaque. The two logarithms agree at the origin after choosing the constant units. Extend them by $c \( x \, y \) = c \( x \, 0 \) + c \( 0 \, y \) - c \( 0 \, 0 \)$. For the stable construction the background can then be chosen as $- c$. These backgrounds have uniform bounds at each fixed order.

For $j gt.eq 1$ define the raw state space $cal(E)_j \( v \)$ by coordinates

#[#set math.equation(numbering: n => "(3.2)")
 $ (a \, p_1 \, dots.h \, p_j \, s_1 \, dots.h \, s_j) \, #h(2em) p_l = D^l P \( 0 \) \, quad s_l = D^l r \( 0 \) . $ <nf:raw-state>]

Set $cal(E)_0 \( v \) = bb(R)^m$, with coordinate $a$; write $pi_(j \, j - 1)$ for the linear map forgetting the highest tensors. These are unrestricted symmetric graph and scalar tensors. In particular, we impose no Lagrangian equation on alternative states. Actual states give a continuous graph over $a$ at every finite level. Continuity of all of their finite jets follows from uniform leafwise derivative bounds and interpolation on plaques. The actual central state is zero at every level.

#thm([Lemma 3.1.])[
  (Raw dynamics and its weights).  #emph[At every level $j$, the section map of $f$ induces a smooth invertible germ $G_(v \, j) : cal(E)_j \( v \) arrow.r cal(E)_j \( f v \)$ fixing zero. These maps commute with the projections $pi_(j \, j - 1)$. Their base component depends only on $a$; their other components are polynomials in the hidden coordinates $\( p_l \, s_l \)$ with coefficients smooth in $a$. For fixed $j$ their degrees are bounded independently of the length of a composition along the central orbit. The same statements hold for changes of adapted charts over the same stable plaque.]
  #emph[The raw maps and their local inverses have uniformly bounded norms at every fixed order on suitable uniform raw domains. Let $- chi_1 \, dots.h \, - chi_m < 0$ be the stable Lyapunov exponents of $f$, with multiplicities, and put $chi_(*) = min_i chi_i > 0$. The derivative cocycle at zero has only negative exponents. In the quotient $ker pi_(j \, j - 1)$ they are sums of $j + 1$ stable exponents on graph tensors and sums of $j$ stable exponents on log-density tensors. Thus their negative exponents define positive weights, each at least $chi_(*)$, and the new weights at level $j$ are at least $j chi_(*)$.]
] <nf:raw-dynamics>

#proof[
  Write the section map as $\( A \( x \, y \) \, B \( x \, y \) \)$ and its height shift as $rho \( x \, y \)$. It carries the stable axis to the stable axis, so $B \( x \, 0 \) = 0$ and $D_x B \( x \, 0 \) = 0$. Symplecticity gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ D_y B \( a \, 0 \) = D_x A \( a \, 0 \)^(- t) . $ <nf:axis-derivative>]
  Indeed the derivative on that axis is block upper triangular, and preservation of the pairing between the two coordinate planes gives this identity. Put
  $ Y \( y \) = B \( P \( y \) \, y \) \, #h(2em) P_(*) \( Y \( y \) \) = A \( P \( y \) \, y \) . $
  Then $Y \( 0 \) = 0$ and $D Y \( 0 \) = D_y B \( a \, 0 \)$, independently of $D P \( 0 \)$. Consequently formal inversion of the $j$-jet of $Y$ uses only powers of the base-dependent invertible matrix $D_y B \( a \, 0 \)$ as denominators. Successively differentiating the displayed equations proves that the transformed graph jet through order $j$ is polynomial in the hidden tensors, with smooth coefficients in $a$.
  For the coefficient, let $M_(*) = D P_(*) \( Y \)$ and $x = P \( y \)$. Pullback on the $x$-directions yields the determinant $det \( D_x A - M_(*) D_x B \)$. Our height convention says that the pullback of the target section form is $e^(- h T + h rho)$ times the source section form. Hence the transformed log record is given by
  #[#set math.equation(numbering: n => "(3.4)")
   $ r_(*) \( Y \) =  & r \( y \) + c \( x \, y \) - c_(*) \( A \, Y \)\
 & - log \| det \( D_x A - M_(*) D_x B \) \| - h T + h rho \( x \, y \) + upright("constant") . $ <nf:density-transport>]
  At $y = 0$ the determinant is $det D_x A \( a \, 0 \)$, independent of every hidden tensor. The right side has value zero for actual states by actual transport and the definition of the backgrounds. It therefore has value zero for every alternative with that base $a$.
  There is no missing $\( j + 1 \)$st graph derivative in (3.4). In $j$ derivatives of $M_(*) D_x B \( P \( y \) \, y \)$, the term with all $j$ derivatives falling on $M_(*)$ is multiplied by $D_x B \( a \, 0 \) = 0$. Every surviving term uses at most $j - 1$ derivatives of $M_(*)$, hence at most $j$ derivatives of $P_(*)$. All derivatives of the logarithm have only powers of the nonzero base determinant as denominators. This proves closure at order $j$ and polynomial dependence for the density jet.
  This computation is a universal finite-jet formula: it applies to any smooth symplectic section map preserving the stable axis, with its smooth height shift. A composition of any length is again such a map. The maximal number of occurrences of the hidden tensors in this universal formula depends only on $j$, not on the section map. This proves the asserted uniform degree bound for arbitrary compositions. Applying the formula to the inverse map proves invertibility and the same finite-level assertions for the inverse. For one time step all required section derivatives and inverse axis determinants are uniformly controlled on smaller compact charts. The universal formulas then prove all the asserted raw finite-order bounds.
  It remains to identify the linear diagonal blocks. At the central state write $S = D_x A \( 0 \, 0 \)$ and $U = D_y B \( 0 \, 0 \) = S^(- t)$. The base derivative is $S$. Modulo lower graph and density orders, the highest graph tensor transforms by
  $ p_j mapsto S thin p_j \( U^(- 1) thin dot.op \, dots.h \, U^(- 1) thin dot.op \) \, $
  and the highest scalar tensor transforms by
  $ s_j mapsto s_j \( U^(- 1) thin dot.op \, dots.h \, U^(- 1) thin dot.op \) . $
  The latter may also receive a linear contribution from $p_j$. Thus these quotient diagonal blocks are, respectively, $S ⊗ "Sym"^j S$ and $"Sym"^j S$, with a triangular coupling. Their exponents are exactly the sums stated in the lemma. The multiplicative ergodic theorem applied to the invariant order filtration gives no other exponents. Since $j gt.eq 1$, every new weight is at least $j chi_(*)$. ◻
]

The stable graph tower uses $f^(- 1)$, exchanges $x$ and $y$, and uses $w$ with its factor $e^(h T)$ and the background $- c$. The same proof therefore gives another tower with a strictly positive minimum weight. Subsequent time indices count iterates of the indicated map, which is $f$ for the unstable-plaque tower and $f^(- 1)$ for its stable counterpart.

=== 3.2 Estimates and measurable choices <estimates-and-measurable-choices>

At each finite level, the raw dynamics is contracting. To construct compatible normal coordinates, we need estimates for its linear blocks and a way to solve the nonresonant coefficient equations. We collect these facts here, together with the invariant-subspace splitting later used for polynomial relations of actual states.

#prodef([Definition 3.2.])[
  A measurable function $C gt.eq 1$ on the regular set is #emph[tempered] if
  $ lim_(\| n \| arrow.r oo) frac(log C \( f^n v \), \| n \|) = 0 . $
  A positive radius is tempered when its reciprocal, increased to at least one, is tempered. An estimate with arbitrarily small exponential slack means that for every $epsilon.alt > 0$ its prefactor can be chosen tempered, while its exponential rate increases by at most $epsilon.alt$.
] <nf:tempered>

If $C$ is tempered, the function

$ C_epsilon.alt \( v \) = sup_(n in bb(Z)) C \( f^n v \) e^(- epsilon.alt \| n \|) $

is finite and measurable, majorizes $C$, and satisfies $e^(- epsilon.alt) C_epsilon.alt \( v \) lt.eq C_epsilon.alt \( f v \) lt.eq e^epsilon.alt C_epsilon.alt \( v \)$. We refer to this operation, and to its reciprocal for radii, as slow regularization. The multiplicative ergodic theorem, with its tempered norm comparison, gives the following form of the estimates we use. If a linear block $A$ has the single exponent $lambda$, then, in the original finite-dimensional norms,

#[#set math.equation(numbering: n => "(3.5)")
 $ C_epsilon.alt \( v \)^(- 1) e^(\( lambda - epsilon.alt \) n) parallel z parallel lt.eq parallel A_v^(\( n \)) z parallel lt.eq C_epsilon.alt \( v \) e^(\( lambda + epsilon.alt \) n) parallel z parallel \, #h(2em) n gt.eq 0 . $ <nf:lyapunov-bounds>]

The corresponding estimates hold for inverses and with $v$ replaced by any $f^q v$. Tensor products add exponents, and duals negate them.

We will also use finite triangular arrays whose diagonal blocks have one and the same exponent $lambda$. Suppose their diagonal blocks satisfy (3.5) and their one-step off-diagonal coefficients are tempered. Their products satisfy the same estimates with additional arbitrarily small slack. Indeed, in a triangular array of length $r$, each matrix entry of a product is a sum over paths with at most $r - 1$ off-diagonal jumps. There are at most a polynomial in $n$ many choices of jump times. Each diagonal interval contributes its exponential factor; the interval lengths sum to $n$ minus at most $r - 1$. Slowly regularized bounds at jump times contribute at most $C \( v \) e^(r delta n)$ for any preassigned $delta > 0$. Absorb this factor and the polynomial in $n$ by choosing $delta$ smaller than the desired slack. Apply the identical argument to the triangular inverse to obtain the lower estimate. This proof does not assume logarithmic integrability of the additional off-diagonal coefficients.

#thm([Lemma 3.3.])[
  (Splitting invariant subspaces).  #emph[Suppose a measurable invertible linear cocycle has an invariant direct sum $E = xor.big_(i = 1)^r E_i$, with distinct exponents $lambda_1 < dots.h.c < lambda_r$, and each $E_i$ satisfies (3.5). Every measurable invariant subspace $S$ satisfies, almost everywhere, 
$ S = xor.big_(i = 1)^r \( S ∩ E_i \) . $

 No temperedness assumption on $S$ or on a measurable frame for $S$ is required. The statement also applies to a cocycle whose base transformation is $f^(- 1)$.]
] <nf:blocks>

#proof[
  Use the measurable direct-sum norm $parallel sum_i z_i parallel_xor = max_i parallel z_i parallel$ on $E$. Only measurability of this norm is needed in the argument below; no tempered comparison with the original ambient norm is required. Write $E = E_(<) xor E_r$ and put $K = S ∩ E_(<)$ and $I = "pr"_(E_r) S$. In quotient norms, $S \/ K$ is the graph of a measurable linear map $L : I arrow.r E_(<) \/ K$. Its transport obeys
  $ parallel L_(f^n v) parallel lt.eq C_epsilon.alt \( v \)^2 e^(\( lambda_(r - 1) - lambda_r + 2 epsilon.alt \) n) parallel L_v parallel . $
  Here the operator on the quotient has norm at most that on $E_(<)$, and the inverse on $I$ has norm at most the inverse on $E_r$. Choose $2 epsilon.alt < lambda_r - lambda_(r - 1)$. Thus $parallel L_(f^n v) parallel arrow.r 0$ almost everywhere. For every $a > 0$, invariance of the probability measure and dominated convergence give
  $ mu { parallel L parallel > a } = integral 1_({ parallel L_(f^n v) parallel > a }) thin d mu \( v \) arrow.r 0 . $
  Consequently $L = 0$ almost everywhere, so $S = \( S ∩ E_(<) \) xor \( S ∩ E_r \)$. Induction proves the assertion. ◻
]

#thm([Lemma 3.4.])[
  (A nonresonant homological equation).  #emph[Let $L$ be an invertible finite-dimensional measurable cocycle with a single exponent $gamma eq.not 0$ and estimates (3.5). For a tempered measurable inhomogeneous term $e$, the recurrence 
#[#set math.equation(numbering: n => "(3.6)")
 $ q_(n + 1) = L_n q_n + e_(n + 1) $ <nf:recurrence>]

 has a unique tempered solution on every regular two-sided orbit. The solution is measurable. This conclusion also holds for the single-exponent triangular blocks described above.]
] <nf:homological>

#proof[
  For $gamma < 0$ the solution is
  $ q_n = e_n + sum_(j gt.eq 1) \( L_(n - 1) dots.h.c L_(n - j) \) e_(n - j) \; $
  for $gamma > 0$ it is
  $ q_n = - sum_(j gt.eq 0) \( L_n^(- 1) dots.h.c L_(n + j)^(- 1) \) e_(n + j + 1) . $
  Both expressions solve (3.6) by shifting the summation index. To verify convergence and temperedness, choose $0 < 3 delta < \| gamma \|$. For example, in the first expression the $j$th term has norm at most
  $ C_delta \( v \) E_delta \( v \) e^(2 delta \| n \|) e^(\( gamma + 3 delta \) j) \, $
  after slow regularization of the linear estimates and the input. The geometric series converges. Since $delta$ is arbitrarily small, its sum is tempered; the second expression has the same proof with $- gamma$ in place of $gamma$. Partial sums are measurable. The difference of two solutions is a homogeneous orbit. A nonzero such orbit grows exponentially in the future if $gamma > 0$ and in the past if $gamma < 0$, contradicting temperedness. ◻
]

For later recurrence arguments, every finite collection of measurable finite norms, inverse minors, and positive radii can be bounded on a set of positive measure. Birkhoff’s theorem then supplies returns with positive frequency. Such a set and its bounds can depend on the finite orders under discussion. Leafwise essential suprema give measurable bounds for continuous leafwise extensions: a supremum over a compact plaque equals the essential supremum over its interior, after using a slightly larger plaque. The same observation applies to every fixed derivative. Absolute continuity and a countable collection of plaque boxes allow us to impose agreement almost everywhere on both whole strong leaves through a typical center. Flow boxes give the corresponding weak-leaf assertion. These facts do not furnish a radius common to infinitely many orders.

=== 3.3 Exact resonance normalization <exact-resonance-normalization>

A graded space in this subsection is a finite direct sum $E = xor.big_(d > 0) E_d$. Give a coordinate on $E_d$ weight $d$. A polynomial map is #emph[weight preserving] if its $E_d$ component is a sum of monomials of weight $d$. Since all weights are positive, such a polynomial has degree at most $d_max \/ d_min$. Its nonlinear $E_d$ component uses only variables of weights strictly less than $d$; consequently an invertible linear diagonal gives a polynomial inverse by induction in weight.

#thm([Lemma 3.5.])[
  (Exact compatible normal coordinates).  #emph[For the raw towers in Lemma 6, at every finite level there are measurable smooth germ coordinates $Psi_(v \, j)$, tangent to the identity, and weight-preserving polynomial diffeomorphisms $N_(v \, j)$ such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ Psi_(f v \, j) compose G_(v \, j) = N_(v \, j) compose Psi_(v \, j) . $ <nf:conjugacy>]

 Their linear part is the raw derivative, with its Oseledets grading. The coordinates and normal maps commute with the tower projections. For every fixed state level and every fixed derivative order, their norms and the corresponding inverse norms have measurable tempered bounds on measurable tempered positive radii. At a fixed level the coordinate change is smooth on a forward admissible domain; the estimates at different orders do not require one radius common to the entire infinite tower.]
] <nf:normalization>

#proof[
  Fix a finite level and suppress its index. The derivative $A_v = D G_v \( 0 \)$ has a measurable Oseledets splitting by weights $d$, with exponent $- d$. Oseledets projections commute with every tower projection: the latter intertwines the derivative cocycles, and a vector with one exponent can project only to that exponent or to zero. Use adapted norms, temperedly equivalent to the raw norms, in which $parallel A_v parallel lt.eq e^(- chi_(*) \/ 2)$, decreasing the exponent slack if necessary.
  We first construct the formal conjugacy. Suppose it has been constructed through ordinary degree $b - 1$. The discrepancy in degree $b$ is a homogeneous polynomial. Its component with output weight $d$ and input weights $d_1 \, dots.h \, d_b$ lies in the cocycle of homogeneous maps with linear transport
  $ Q mapsto A_v Q \( A_v^(- 1) thin dot.op \, dots.h \, A_v^(- 1) thin dot.op \) . $
  This cocycle has the single exponent $d_1 + dots.h.c + d_b - d$. If it is nonzero, Lemma 9 solves the homological equation by a unique tempered correction. If it is zero, choose the correction to be zero and retain the discrepancy in the normal map. Induction gives measurable tempered coefficients at each finite order. There are no resonances after $b > d_max \/ d_min$, so the resulting normal map $N_v$ is a finite weight-preserving polynomial. Its linear diagonal is $A_v$, and the weight induction just given supplies its polynomial inverse.
  The construction respects the tower without choosing complements inside an equal-weight block. Project the degree-$b$ equation to a lower level. Since raw projection is linear and intertwines the derivatives, this is precisely the lower-level homological equation. On each nonresonant part uniqueness in Lemma 9 identifies the projected correction with the lower correction; on each resonant part both corrections are zero and the projected discrepancy is retained. Induction proves compatibility of all formal changes and normal maps.
  We now pass from a formal change to an exact smooth change. This step is included to specify the domains and finite-order estimates; it is the measurable contraction mechanism underlying the usual nonstationary normal-form results #cite(label("Melnick2019")) #cite(label("KalininSadovskaya2017")). Let $Psi_v^(\[ b \])$ be the polynomial truncation of the constructed formal change through degree $b$. Once $b$ exceeds the largest resonant degree, the defect
  #[#set math.equation(numbering: n => "(3.8)")
   $ R_v^(\[ b \]) = Psi_(f v)^(\[ b \]) G_v - N_v Psi_v^(\[ b \]) $ <nf:flat-defect>]
  vanishes through degree $b$. On a fixed raw domain its $C^q$ norms are tempered for every fixed $b \, q$. This follows directly from the raw bounds and the finitely many tempered polynomial coefficients.
  Choose a positive radius $r_v$ on which $parallel D G_v parallel lt.eq e^(- kappa)$ for a fixed $kappa > 0$. The raw second-derivative bounds and tempered norm comparison allow $r_v$ to be chosen tempered. Slowly decrease these radii so that
  $ r_(f v) gt.eq e^(- delta) r_v \, #h(2em) 0 < delta < kappa . $
  Then $G_v \( B \( 0 \, r_v \) \) subset B \( 0 \, r_(f v) \)$. On this forward admissible family of balls,
  #[#set math.equation(numbering: n => "(3.9)")
   $ parallel G_v^(\( n \)) \( z \) parallel lt.eq e^(- kappa n) parallel z parallel . $ <nf:raw-contraction>]
  For each fixed $q$, the derivatives through order $q$ of $G_v^(\( n \))$ have tempered bounds with arbitrarily small exponential slack. To see this directly, differentiate $G_v^(\( n + 1 \)) = G_(f^n v) compose G_v^(\( n \))$. At derivative order $q$ the term containing $D^q G_v^(\( n \))$ is multiplied by $D G_(f^n v)$; all other terms are products of derivatives of lower order and a tempered fixed-order derivative of $G_(f^n v)$. Induction on $q$ and summation of the contracting scalar recurrence give the claim. One can obtain decay as well, but the stated subexponential upper bounds suffice below.
  There is a finite exponent $K$, depending on this state level but independent of $b$, such that all coefficients of $N_v^(\( - n \))$ are bounded by $C_epsilon.alt \( v \) e^(\( K + epsilon.alt \) n)$. Here $N_v^(\( - n \))$ denotes the inverse of $N_v^(\( n \))$ from the space at $f^n v$ back to the space at $v$. To check this bound, consider the finite-dimensional space of coordinate monomials of a given weight $d$. Substitution by $N$ is triangular by ordinary degree; every diagonal tensor block has the single exponent $- d$. The triangular-array estimate therefore bounds forward substitution by $e^(\( - d + epsilon.alt \) n)$ and its inverse by $e^(\( d + epsilon.alt \) n)$, with tempered prefactors. Only weights up to $d_max$ occur in the coordinate functions of $N^(plus.minus n)$, so one can take $K = d_max$, with additional slack. The same exponential bound controls any fixed derivatives of these polynomials on a fixed bounded set, since their degrees are bounded independently of $n$.
  Define
  #[#set math.equation(numbering: n => "(3.10)")
   $ Q_(v \, n)^(\[ b \]) = N_v^(\( - n \)) compose Psi_(f^n v)^(\[ b \]) compose G_v^(\( n \)) . $ <nf:limit-formula>]
  Consecutive terms differ by applying $N_v^(\( - n - 1 \))$ to two arguments whose difference is $R_(f^n v)^(\[ b \]) compose G_v^(\( n \))$. Both arguments and each of their fixed derivatives are bounded with arbitrarily small exponential slack; the arguments themselves converge to zero. Taylor’s formula for (3.8), (3.9), and the chain rule give, for $b gt.eq k$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ parallel R_(f^n v)^(\[ b \]) compose G_v^(\( n \)) #scale(x: 120%, y: 120%)[parallel]_(C^k) lt.eq C_(b \, k \, epsilon.alt) \( v \) e^(\[ - kappa \( b + 1 - k \) + epsilon.alt \] n) . $ <nf:defect-estimate>]
  Indeed, a term with $q lt.eq k$ derivatives falling on $R^(\[ b \])$ contains its Taylor factor of order $b + 1 - q$, evaluated at the exponentially contracting argument, and only a fixed finite number of derivatives of $G_v^(\( n \))$. All remaining costs are tempered. Using the integral difference formula for the polynomial $N_v^(\( - n - 1 \))$ and differentiating it through order $k$ now yields
  #[#set math.equation(numbering: n => "(3.12)")
   $ parallel Q_(v \, n + 1)^(\[ b \]) - Q_(v \, n)^(\[ b \]) parallel_(C^k) lt.eq C_(b \, k \, epsilon.alt) \( v \) e^(\[ K - kappa \( b + 1 - k \) + epsilon.alt \] n) . $ <nf:telescoping>]
  The slack has been enlarged to absorb the finitely many chain-rule factors; it is still arbitrarily small for fixed $b \, k$.
  Choose $b_0$ so that $kappa \( b_0 + 1 \) > K$. The series of differences converges in $C^0$ on the forward admissible domain. For any fixed $k$, choose a larger $b$ with $kappa \( b + 1 - k \) > K$; it converges in $C^k$ there. These limits agree. In fact $Psi^(\[ b' \]) - Psi^(\[ b \])$ vanishes through degree $b$ when $b' > b$, and the same estimate with $k = 0$ shows $Q_(v \, n)^(\[ b' \]) - Q_(v \, n)^(\[ b \]) arrow.r 0$ whenever $b gt.eq b_0$. Thus the common limit $Psi_v$ is smooth. Increasing $b$ does not introduce a new convergence-domain assumption: each $Psi^(\[ b \])$ is a polynomial, and every fixed derivative of the raw maps is bounded on the original raw domains. On compact subsets of the forward interior, the preceding estimates apply directly. If a fixed-order auxiliary estimate uses a smaller tempered radius at future centers, (3.9) and slow variation eventually put the arguments inside it.
  The identity relating $Q_(v \, n + 1)^(\[ b \])$ and $Q_(f v \, n)^(\[ b \]) compose G_v$ proves (3.7) on taking limits. For any fixed Taylor order $a$, take $b gt.eq a$ sufficiently large for $C^a$ convergence. Every telescoping difference has zero Taylor jet through degree $b$, so $j^a Psi_v = j^a Psi_v^(\[ b \])$. In particular $D Psi_v \( 0 \) = upright("id")$. Summing (3.12) gives tempered fixed-order bounds. The inverse function theorem, first with the $C^2$ bound to obtain a tempered injectivity radius and then differentiated to any fixed order, gives the stated inverse bounds. For example, shrink until $parallel D Psi_v - upright("id") parallel lt.eq 1 \/ 2$; inverse derivatives are then finite sums of products of derivatives of $Psi_v$ and inverse matrices of norm at most two. These estimates use only finitely many tempered quantities at every fixed order. Finally, projection commutes with each expression (3.10), after choosing a sufficiently large common truncation for the two levels. It therefore commutes with their germ limits. ◻
]

=== 3.4 Fiber polynomiality and finite weight blocks <fiber-polynomiality-and-finite-weight-blocks>

#thm([Lemma 3.6.])[
  (Analyticity only in the hidden variables).  #emph[At every fixed state level, the exact coordinate map $Psi_(v \, j)$ is polynomial in the raw hidden variables at fixed raw base $a$, with smooth coefficients in $a$. Write the normalized variables as $\( z_0 \, zeta \)$, where $z_0$ is the level-zero coordinate. The local inverse of $Psi_(v \, j)$ is smooth in $z_0$ and real analytic in $zeta$. Every fixed derivative in $z_0$ and $zeta$ has this same real-analytic dependence on $zeta$. The assertion makes no analyticity claim in the base or in the center $v$.]
] <nf:fiber-analyticity>

#proof[
  Fix a truncation $b_0$ for which the $C^0$ limit in (3.10) converges. By Lemma 6, at fixed raw $a$ the map $G_v^(\( n \))$ has polynomial hidden degree bounded by a number $D_j$ independent of $n$, and its base component is independent of the hidden variables. The polynomial $Psi_(f^n v)^(\[ b_0 \])$ has degree at most $b_0$. The inverse normal iterate is weight preserving, so it has degree at most $L_j = d_max \/ d_min$, rounded down. Consequently the hidden degree of every $Q_(v \, n)^(\[ b_0 \])$ is at most $D_j b_0 L_j$. Polynomials of bounded degree form a closed finite-dimensional space under uniform convergence on a ball: evaluation at a fixed unisolvent finite collection of points recovers all coefficients by an invertible matrix. The $C^0$ limit is therefore polynomial of this bounded hidden degree. Its coefficients are smooth in $a$, either by the same finite evaluation formula on a smaller product neighborhood or by the already established smoothness of $Psi_v$.
  Compatibility with level zero gives the triangular expression
  $ Psi_v \( a \, eta \) = \( psi_v \( a \) \, F_v \( a \, eta \) \) \, $
  where $psi_v$ is a smooth local diffeomorphism and $F_v$ is polynomial in $eta$. At fixed $a$, its hidden derivative is invertible near the central state. The real analytic inverse function theorem in the hidden variables therefore gives an analytic solution $eta = H_v \( a \, zeta \)$ of $F_v \( a \, eta \) = zeta$. The ordinary smooth parameter inverse function theorem identifies this with a jointly smooth function. Moreover, differentiating the implicit identity in a base variable gives
  $ partial_a H_v = - \( D_eta F_v \)^(- 1) thin partial_a F_v \, $
  evaluated at $\( a \, H_v \( a \, zeta \) \)$. The right side is analytic in $zeta$ because $F_v$ and every base derivative of $F_v$ are polynomial in $eta$. Repeated implicit differentiation expresses each mixed derivative as a finite sum of products of such polynomials, lower derivatives of $H_v$, and $\( D_eta F_v \)^(- 1)$. Induction proves the same analyticity for all fixed derivatives. Substituting $a = psi_v^(- 1) \( z_0 \)$ proves the statement in normalized base coordinates. If desired, a common small complex hidden neighborhood for each fixed real base point is obtained by polynomial complexification and implicit inversion; no complexification of the base is involved. ◻
]

#thm([Corollary 3.7.])[
  (Finite arrays and higher kernels).  #emph[In either normalized tower, the independent coordinates introduced at level $j$ have weights at least $j chi_(*)$ for a fixed $chi_(*) > 0$. A prescribed upper weight bound consequently uses only finitely many independent tower coordinates and finitely many monomials. On the array of monomials of a fixed weight $d$, normal substitution has the single exponent $- d$, and inverse substitution has exponent $d$, with two-sided estimates and arbitrarily small exponential slack. These estimates continue to hold for finite tensor arrays and their invariant subquotients, with the corresponding sums and differences of weights.]
] <nf:finite-weight>

#proof[
  The assertion about new coordinates is the quotient assertion in Lemma 6, preserved by the compatible grading in Lemma 10. Positivity bounds the ordinary degree of a monomial of weight at most $D$ by $D \/ chi_(*)$, and only levels $j lt.eq D \/ chi_(*)$ can contribute independent variables. At these finitely many levels the dimensions are finite. Substitution is triangular by ordinary degree on each fixed-weight array; its diagonal consists of tensor products of the derivative blocks with total exponent $- d$. The triangular-array estimates prove the asserted forward and inverse bounds. Tensor operations add or subtract the indicated exponents. Restriction preserves an upper bound and the inverse upper bound supplies the lower bound; the same two estimates pass to quotient norms. This proves the subquotient assertion. ◻
]

The corollary concerns finite arrays. It will allow a later argument to fix a weight cutoff, choose a sufficiently large spatial Taylor order, and then pass to an orbit limit. It does not identify an infinite formal series with a convergent spatial germ.

== 4 Algebraic hulls and coherent formal fields <hull:section>

Starting from the contracting state towers, we construct affine families of conormal covectors with coherent full ambient Taylor coefficients along both actual foliations. These fields will define the formal symmetry equations in Section 5. All assertions concerning typical points are with respect to Liouville volume. We refine the regular set countably many times, including by the conditional full-measure properties on strong leaves. A statement about a formal field always concerns its full ambient Taylor series, not just its restriction to the tangent space of a plaque.

A formal rank-$d$ subbundle is represented by $d$ formal columns having a nonzero $d$-minor at the center, modulo invertible formal changes of frame. An affine subbundle is represented by a linear subbundle after adding a scalar slot and intersecting that slot with $1$. To specify holonomicity precisely, use fixed ambient coordinates and a Grassmann coordinate chart for the subbundle. Let $B_beta \( a \)$ be its derivative coefficient of multi-order $beta$ at a point $a$ on an axis. Along a smooth axis path $a \( t \)$, coherence means

$ frac(d, d t) B_beta \( a \( t \) \) = sum_i dot(a)_i \( t \) B_(beta + e_i) \( a \( t \) \) . $

Here the coefficients are derivatives rather than factorial-divided Taylor coefficients. This condition is independent of the ambient and Grassmann charts by the chain rule. Differentiation on the left is actual differentiation along the leaf. The higher coefficients on the right retain all their ambient indices; their existence does not assert transverse differentiability of an ambient field.

#thm([Theorem 4.1.])[
  (The two formal affine fields).  #emph[At every point of a conull invariant set there are formal affine fields $cal(A)^u \, cal(A)^s$ of horizontal $m$-covectors with the following properties.]
  + #emph[Their values contain $u$ and $w$, respectively. At the center, the exterior product of any element of $cal(A)^u$ with any element of $cal(A)^s$ equals the fixed nonzero exterior product $u and w$.]
  + #emph[The fields are equivariant under $f$, changes of section, and flip, with the same constant and height multipliers as $u \, w$. In a flow box their height dependences are $e^(- h tau)$ and $e^(h tau)$.]
  + #emph[On each entire typical strong stable or strong unstable leaf, every ambient Taylor coefficient has a smooth representative agreeing almost everywhere with the regular construction. These representatives are holonomic: differentiating along the leaf gives the corresponding higher ambient coefficients. The analogous assertion holds on typical weak leaves, using flow transport.]
  + #emph[At every finite order the local representatives, their bounds, and positive radii can be chosen measurably. On compact plaque subboxes one may restrict to positive-measure families with uniform finite-order bounds. No common convergence radius for all orders is asserted.]
] <hull:main>

We prove the theorem first for the unstable construction. The stable construction is obtained by reversing time, or equivalently by flip. The raw states, normal coordinates, and positive weights are those of Section 3. Write $cal(E)_j \( v \)$ for the raw state space through order $j$, $Psi_(v \, j)$ for its exact normal-coordinate map, and $N_(v \, j)$ for the normal dynamics. All projections commute with these maps. The order-zero projection is the base label $a$ on the stable axis. The actual states form a continuous graph over $a$.

=== 4.1 Polynomial changes of center <polynomial-changes-of-center>

#thm([Lemma 4.2.])[
  #emph[Fix a finite state level. At sufficiently nearby regular centers on the same strong stable leaf, the changes between normal state coordinates are restrictions of polynomial automorphisms. They respect all lower state projections and carry corresponding actual states into one another. The same conclusion holds for regular centers related by a fixed flow translation, using the induced change of section.]
] <hull:recenter>

#proof[
  Let $v'$ lie on the stable axis of $v$. In raw coordinates the change of center is a smooth graph-and-density transformation $C$; both charts use the same stable plaque. Its conjugate by $Psi_(v \, j) \, Psi_(v' \, j)$ is a smooth local map $Q$ near the state representing the plaque through $v'$. Take $v'$ sufficiently close that this state is in a forward-admissible normal domain at $v$. It is the zero state in the chart at $v'$. Shrinking a neighborhood of it therefore places the neighborhood in forward-admissible domains for both descriptions.
  Let $Q_n$ be the corresponding change at $f^n v \, f^n v'$. Exact functoriality of graph transformation gives, on the chosen neighborhood,
  #[#set math.equation(numbering: n => "(4.1)")
   $ Q = \( N_(v' \, j)^(\( n \)) \)^(- 1) compose Q_n compose N_(v \, j)^(\( n \)) . $ <hull:transition-identity>]
  At the future actual state, the raw chart changes have bounded smooth norms of each prescribed finite order. The normal changes and their inverses have tempered norms and radii along each of the two regular orbits. The arguments of $Q_n$ in (4.1), minus its future actual center, decrease exponentially on a fixed smaller initial neighborhood. Consequently they eventually fit every prescribed finite-order tempered domain.
  For a fixed integer $b$, replace $Q_n$ by its Taylor polynomial of degree $b$ at the future actual center. Its error after substitution is $O \( e^(- kappa \( b + 1 \) n + epsilon.alt n) \)$, for a fixed $kappa > 0$ and arbitrarily small $epsilon.alt > 0$. On the bounded range in question, postcomposition by $\( N_(v' \, j)^(\( n \)) \)^(- 1)$ costs at most $e^(C n + epsilon.alt n)$, where $C$ depends on the state level but not on $b$. Choose $kappa \( b + 1 \) > C + 1$. The resulting polynomial approximations converge uniformly to $Q$.
  Their degrees are bounded independently of $n$: at a fixed state level both iterated normal maps and their inverses have bounded weighted, hence ordinary, polynomial degree, and $b$ has been fixed. The vector space of polynomials of this bounded degree is closed under locally uniform convergence on an open set. Thus $Q$ is polynomial. Applying the same argument to the inverse change gives a polynomial inverse. The two polynomial compositions equal the identity on an open set and therefore identically. Projection compatibility follows first for raw changes and then for the normal changes.
  For a fixed flow shift, use its induced raw graph transformation. It commutes with $f$, fixes the corresponding central states, and has fixed finite-order smooth bounds. The same argument applies; closeness of the two phase-space centers under iteration is unnecessary in this case. ◻
]

=== 4.2 The algebraic tower <the-algebraic-tower>

Let $V_j \( v \)$ be the real Zariski closure of the germ at zero of the actual states in normal coordinates. Equivalently one may take the complex Zariski closure of the real evaluations and subsequently use its real structure. Noetherianity implies that a sufficiently small actual-state neighborhood already has this closure. Normal dynamics identifies $V_j \( v \)$ with $V_j \( f v \)$.

For a finite cutoff $D$, let $upright(bold(e))_(j \, D) \( z \)$ be the vector of all monomials of weight at most $D$, including the constant monomial. Their evaluation span on the actual germ will be denoted $S_(j \, D) \( v \)$. Weighted substitution by $N_(v \, j)$ is an invertible linear cocycle on this array. On each weight-$d$ block its sole Lyapunov exponent is $- d$. The invariant-subspace splitting of Lemma 8 therefore gives

#[#set math.equation(numbering: n => "(4.2)")
 $ S_(j \, D) \( v \) = xor.big_(d lt.eq D) S_(j \, D) \( v \)_d $ <hull:span-splitting>]

at typical centers. The annihilator of this span is the space of polynomial relations in the array; hence the ideal of $V_j \( v \)$ is weighted homogeneous.

#thm([Lemma 4.3.])[
  #emph[After a conull refinement, all $V_j \( v \)$ are irreducible and smooth at zero. Their projections onto lower levels, including the full base, are submersions at zero. Nearby regular centers on the stable axis have their variety germs identified by Lemma 14. These objects and all finite-dimensional ranks used below are measurable.]
] <hull:regular-varieties>

#proof[
  For each finite array, its evaluation span is measurable: evaluate the continuous actual graph on a countable dense set in successively smaller base balls and take the stabilized finite-dimensional span. Its annihilator gives the measurable space $I_D$ of polynomial relations of ordinary degree at most $D$. In an ambient space $bb(C)^N$, the dimension $d$ of the closure is the largest size of a coordinate subset $S$ for which $I_D ∩ bb(C) \[ z_i : i in S \]$ is zero for every $D$. Indeed, a maximal-dimensional irreducible component has a transcendence-basis subset among its coordinate generators. Conversely, if every component has a nonzero relation in the coordinates $S$, the product of those finitely many relations lies in the full relation ideal. This dimension test uses only countably many finite-dimensional intersection ranks; the dimension–transcendence-degree identity is #cite(label("StacksProject"), form: "prose") Tag 00P0.
  The spans of the gradients at zero of the spaces $I_D$ stabilize in $\( bb(C)^N \)^(*)$. Choose the first degree attaining their maximal rank and then a basis by a fixed pivot rule; these are measurable choices. Every irreducible component contains zero: the connected group of positive weighted dilations fixes the finite set of components, and contraction to zero preserves each closed component. Thus the local dimension at zero is $d$. The tangent-space criterion makes smoothness at zero equivalent to gradient rank $N - d$; smoothness also forces irreducibility, since all components meet there #cite(label("StacksProject")) Tags 00KU, 0B8X, and 00NP. This proves measurability of the central smoothness and irreducibility condition without selecting components measurably. Projection ranks on the smooth germs are finite matrix tests. Nonzero minors and sufficiently small coordinate neighborhoods may then be chosen by countable tests. The components used below are only existential choices at a fixed center.
  The dimensions of the closures are invariant under $f$ and hence constant almost everywhere. Work in one such regular stable-axis chart. Zariski density of the actual graph supplies actual points outside the singular and intersection loci of the maximal-dimensional components. It supplies them in arbitrarily small neighborhoods, since the closure is the closure of a germ. Avoiding these closed algebraic exceptional loci gives a relatively open subset of the continuous actual graph. Its regular points have full conditional leaf measure. At any such point, polynomial re-centering maps its closure into the selected component. The almost-everywhere equality of dimensions makes this closure the whole component. Its center is smooth and its closure is irreducible.
  Let $G$ be the measurable invariant set where the central closure is irreducible and smooth at its center. To pass from the preceding leaf argument to ambient measure, suppose that $G$ were null. Choose the regular center above so that its stable plaque meets $G$ in conditional measure zero, as allowed by the conull convention in the preliminaries. The relatively open actual-state patch just constructed instead gives a positive leaf-measure set of regular centers in $G$, a contradiction. Thus $G$ has positive ambient measure; invariance and ergodicity make it conull.
  For the projection assertion, proceed through the levels. The projection of the actual germ is the lower actual germ, so its image is Zariski dense in the lower irreducible variety. In characteristic zero the dominant projection has full rank on a nonempty open part of the smooth locus. The same actual-point and re-centering argument gives a positive leaf-measure patch of centers with full projection rank. Applying the same conditional-null contradiction to this invariant rank condition proves the central submersion assertion almost everywhere. These are the usual smooth-locus and generic-rank facts for affine varieties; see #cite(label("Hartshorne1977"), form: "prose") and #cite(label("StacksProject"), form: "prose") Tags 0B8X, 07ND, and 02K4.
  The complex formulation introduces no additional component problem. A selected real actual point outside the other components belongs to both its component and the complex conjugate of that component. The two components therefore coincide, so the selected component is defined over the reals. The selected point is nonsingular; its real locus is Zariski dense and locally smooth of real dimension equal to the complex dimension #cite(label("Mangolte2019")) Theorem 2.2.9(2) and its proof. Density of the actual evaluations themselves comes from the closure argument above. Finally, irreducibility and equal dimension make the local inclusions supplied by polynomial re-centering equalities of germs. Intersect the resulting conull sets over the countably many levels and finite tests. ◻
]

We shall always restrict to smooth submersion neighborhoods. In raw coordinates they have local coordinates $\( a \, t_j \)$, smooth in all variables and analytic in $t_j$ for fixed $a$, including any fixed derivatives in $a$. Indeed the inverse normal change has this property by Lemma 11, and the parameterized implicit function theorem preserves it.

At a typical center, take the fiber $a = 0$ of $V_1 \( v \)$. Its elements give unstable conormal alternatives at that point, with the prescribed zero-order density. Higher levels give the same fiber germ at this level, by submersion. Define stable alternatives in the opposite tower. These are conormal values supplied by alternative state records. We will prove their cross-pairing identity first, then construct from their affine spans full ambient formal fields of constant rank.

#thm([Lemma 4.4.])[
  (Homogeneous parameters).  #emph[The smooth germs $V_j \( v \)$ have compatible positively weighted polynomial parametrizations. Independent parameters can be introduced successively with the state levels. Their new weights tend to infinity with the level. A finite collection of independent parameters extends to the full tower by setting all later independent parameters to zero. If their weights are at most $D_0$, a component of weight $d$ on this section has ordinary vanishing order at least $d \/ D_0$.]
] <hull:parameters>

#proof[
  The tangent spaces at zero are graded, and their projections are surjective. Choose graded linear retractions onto them, compatibly with the projections. The local graph over the tangent space is invariant under positive weighted dilation. Taylor expansion at zero then makes each output coordinate a weighted homogeneous polynomial: the Taylor remainder, pulled toward zero by dilation and divided by the fixed output weight, tends to zero once the Taylor order is sufficiently high. Choose successive graded complements for the tangent kernels. Their weights are among those of the new raw derivative blocks; the minimum such weight tends to infinity by the raw jet computation. Finally a monomial of ordinary degree $q$ in parameters of weights at most $D_0$ has weight at most $q D_0$, proving the last assertion. ◻
]

=== 4.3 Extraction from transported actual states <extraction-from-transported-actual-states>

#thm([Lemma 4.5.])[
  (Pure-weight evaluation).  #emph[Fix a finite level and monomial array. A vector $b$ in its actual evaluation span of pure weight $d$ can, along negative returns $- n$, be written as a linear combination of actual evaluations transported to the target center. For every $epsilon.alt > 0$ the sum of absolute values of the coefficients is at most $C_epsilon.alt e^(\( d + epsilon.alt \) n)$. The transported states tend exponentially to zero. Arrays can be enlarged before making this choice, and the larger evaluation spans project surjectively onto the smaller ones, separately at each weight.]
] <hull:evaluation>

#proof[
  At each regular source choose an evaluation basis on an arbitrarily small actual-state neighborhood inside a forward-admissible domain. Such a basis exists by the definition of the germ span. Countable dense tests on the actual graph give a measurable choice. Restrict to a positive-measure set where the domain size, basis norms, and inverse conditioning are uniformly controlled. Pull $b$ back by the monomial substitution cocycle. Its norm is at most $C_epsilon.alt e^(\( d + epsilon.alt \) n)$ by the single-exponent estimate on its weight block. At negative returns to this set, express it in the chosen basis and transport the resulting identity forward.
  Every basis state is actual, and its transport is an actual state in the target chart. Forward-admissibility and the positive minimum weight give exponential convergence to zero. Projection surjectivity follows because evaluation vectors project to evaluation vectors on the same actual germ. Equation (4.2) gives the assertion weight by weight. Larger cutoffs may alter the conditioning constant and return set, but not the exponent $d$ of the desired vector. ◻
]

Positive-frequency returns will be used throughout. For two towers, the magnitudes of selected positive and negative return times can be taken in $\[ N \, 2 N \]$ for all sufficiently large $N$: the ergodic theorem gives a positive asymptotic count on each such interval. All choices in Lemma 17 are made at finite levels, so a countable regular-set refinement suffices.

#thm([Lemma 4.6.])[
  (Smooth identities and fiber identities).  #emph[If a smooth function vanishes on the local actual states, its Taylor series at a typical center vanishes on the formal germ of $V_j$. Moreover, let a function on a local smooth piece of $V_j$ be smooth in the base and analytic on each fiber. If it vanishes on the nearby typical actual states, it vanishes on a product neighborhood with connected fibers. The same assertion applies to each finite coefficient of a formal calculation having this regularity.]
] <hull:identities>

#proof[
  Extend the function smoothly off $V_j$ if necessary. Fix a weight $d$ in its Taylor series, and take a Taylor polynomial of ordinary degree $b$ large enough that its remainder on transported states is $O \( e^(- \( d + 1 \) n) \)$. This is possible because all normal variables decrease at some fixed exponential rate. Include every monomial of this polynomial in the evaluation array, and apply Lemma 17 to a pure weight-$d$ vector. All other weights are killed exactly. The coefficient cost is $e^(\( d + epsilon.alt \) n)$, whereas the smooth remainder tends to zero faster. Thus the weight-$d$ Taylor polynomial annihilates the whole evaluation span and vanishes on $V_j$. Repeat for the finitely many weights needed at each ordinary order.
  For the second assertion first use continuity to include all actual states on the local graph. Re-center at any nearby typical actual point using Lemma 14; its closure is the same variety germ by Lemma 15. The first assertion makes the function flat there in every tangent direction. Its restriction to the fiber is analytic, hence zero on that connected fiber patch. Typical base labels are dense and have full conditional measure. Continuity therefore gives zero throughout a product neighborhood. The argument can be applied separately to any fixed coefficient. ◻
]

=== 4.4 The pairing of opposite alternatives <the-pairing-of-opposite-alternatives>

#thm([Proposition 4.7.])[
  #emph[Every sufficiently small unstable alternative and stable alternative through the center have the same wedge as the actual pair. This remains true for their affine spans.]
] <hull:pairing>

#proof[
  Use the paired charts and density backgrounds of Section 3. Transport one actual unstable plaque from a negative return and one actual stable plaque from a positive return. Write their equations as $x = P \( y \)$ and $y = P^(-) \( x \)$, with log-density records $r \( y \) \, r^(-) \( x \)$. At their unique nearby intersection the actual identity is
  #[#set math.equation(numbering: n => "(4.3)")
   $ e^(r \( y \) + r^(-) \( x \)) det #scale(x: 120%, y: 120%)[\(] I - D P \( y \) D P^(-) \( x \) #scale(x: 120%, y: 120%)[\)] = 1 . $ <hull:actual-wedge>]
  The two backgrounds cancel at the same point. Base labels and slopes tend exponentially to zero, so the implicit intersection derivative is uniformly invertible.
  Fix a desired pair of weights $\( d \, d' \)$. First truncate spatial graphs and density records at a large order $R$. Actual plaque derivatives have uniform bounds of every fixed order. Spatial truncation changes the intersection and the left side of (4.3) by at most $C_R \( \| x \| + \| y \| \)^(R - 1)$; the loss of one derivative accounts for the slopes. Since the return lengths $n \, n'$ are comparable, this is smaller than $e^(- \( d + 1 \) n - \( d' + 1 \) n')$ when $R$ is sufficiently large. The truncated intersection calculation is a smooth function of finitely many state coordinates. Taylor-expand it to sufficiently high ordinary order that the new remainder has the same bound. All low biweight components stabilize as these orders increase, because the formal intersection displacements have zero constant term and every state weight is positive.
  Take product evaluation arrays containing every term of this finite polynomial. Pure-weight extraction on the two arrays has coefficient cost at most $e^(\( d + epsilon.alt \) n + \( d' + epsilon.alt \) n')$. The exact identity on actual plaque pairs and the two remainder bounds force its $\( d \, d' \)$ component to vanish on the product of the two varieties. This proves the formal identity at every finite order.
  Now restrict to the two zero-base fibers. Their intersection equations have the solution $x = y = 0$ identically, so only the two slopes and prescribed zero-order densities remain. Arbitrary low-level fiber germs lift to every higher finite level used in the test. Fiber analyticity upgrades the formal identity to an identity near the actual pair. Finally bilinearity gives the same constant on affine combinations. ◻
]

=== 4.5 Transport in the opposite direction <transport-in-the-opposite-direction>

The centered alternatives now satisfy the wedge identity. To turn their affine spans into formal fields, we must also move the construction along the central unstable plaque. Polynomial re-centering on the stable axis does not provide this step: the normal coordinates are only measurable in their centers.

We will construct a graph-and-density family $Phi_v \( z \, y \) = \( P_z \( y \) \, r_z \( y \) \)$. Here $y$ is an actual coordinate on a small central unstable patch, while $z$ denotes formal normal-state parameters. The coefficient at parameter zero is the actual central plaque record. First we construct smooth spatial coefficients with the prescribed state jets. We then compare their finite weight truncations with transported actual plaques, to arbitrary prescribed exponential accuracy. That comparison will let us test the polynomial relations at a displaced center using actual evaluations.

Denote the positive minimum state weight by $w_0$. A weight cutoff $W$ leaves a finite-dimensional algebra of parameter polynomials, with products of weight greater than $W$ set to zero. Its positive ideal is nilpotent of index at most $1 + floor.l W \/ w_0 floor.r$. A “parameter series with smooth spatial coefficients” means a compatible family of these finite weight truncations, without a convergence assertion in the parameters. On a homogeneous tower section from Lemma 16, each finite ordinary parameter jet involves only finitely many weights and hence finitely many levels.

#thm([Lemma 4.8.])[
  (Finite coefficient graph calculus).  #emph[Fix a weight cutoff $W$ and a target spatial derivative order $k$. There exist integers $r = r \( W \, k \)$ and a constant $C = C \( W \, k \)$ with the following property. Pushing a weight-truncated graph and log-density variation from time $- l$ to the target along the central unstable graph requires only source spatial derivatives through order $r$ at the contracted central preimage. Comparing two such inputs of tempered finite coefficient norm costs at most $e^(C l + epsilon.alt l)$ in target $C^k$ norm. The constants $r \, C$ are independent of the spatial Taylor degree used to specify the inputs.]
] <hull:calculus>

#proof[
  Put $q = floor.l W \/ w_0 floor.r$. The parameter-zero term is the actual central graph, kept exactly. In the graph-parameter equation solve the constant term first. Each successive parameter degree is found by inverting the same central graph Jacobian and substituting already known lower degrees. At degree at most $q$, Taylor substitution uses at most $q$ derivatives in the source spatial variable. Taking $k$ target derivatives adds finitely many derivatives; the density Jacobian adds one. For example, any $r gt.eq k + 2 q + 4$ suffices if all graph, inverse, and density operations are differentiated together.
  The composed section map, its height function, and the inverse central graph parametrization have derivatives through every fixed order bounded by $e^(A_r l)$ for some $A_r$. This follows by induction from bounded one-step derivatives and the chain rule; the number of derivatives is fixed before $l$ varies. Substitution of $N^(- l) z$ on the weight-$W$ array has norm at most $e^(\( W + epsilon.alt \) l)$, by its triangular single-weight estimates. Every coefficient produced by the preceding nilpotent calculation is a fixed finite sum of products of these quantities, input derivatives, and central inverse Jacobians. The number of factors is bounded in terms of $W \, k$. Differences are estimated by replacing one factor at a time. Input bounds are tempered, so, after choosing smaller exponential slack for their finitely many factors, all these costs are bounded by $e^(C l + epsilon.alt l)$. The spatial Taylor degree does not enter the number of parameter operations or the required derivative order $r$. ◻
]

#thm([Lemma 4.9.])[
  (Smooth spatial profiles).  #emph[There is a parameter-formal family $Phi_v \( z \, y \)$ of graph and log-density records, with smooth coefficients for $y$ in a fixed small patch of the central unstable axis. Its Taylor series at $y = 0$ is the prescribed tower of raw states. It is exactly equivariant, coefficient by coefficient, for the section dynamics and $z mapsto N_v z$. For every fixed weight cutoff and spatial order its coefficient norms are tempered along the central orbit.]
] <hull:profiles>

#proof[
  Fix $W$. Work first in the ambient normal-state tower and restrict to the varieties afterward. By Corollary 12, choose a level $j_0$ after which every new kernel weight exceeds $W$. For a fixed $j gt.eq j_0$, let $pi : cal(E)_j arrow.r cal(E)_(j_0)$ be the projection and let $Pi_j \, Pi_(j_0)$ be the spectral projections onto weights at most $W$. If $cal(R)_j$ is a bounded raw right inverse of $pi$, then
  $ pi Pi_j cal(R)_j = Pi_(j_0) pi cal(R)_j = Pi_(j_0) . $
  Since $ker pi$ has no weight at most $W$, the restriction of $Pi_j cal(R)_j$ to $"im" Pi_(j_0)$ is the inverse of the low-weight projection. Its norm is tempered. Thus the stabilized low-weight inputs supply arbitrarily high spatial jets with tempered bounds at each fixed higher level, without a bound on a measurable choice of parameters for $V_j$.
  At time $- l$, take the spatial Taylor polynomial of degree $R$ of the prescribed variation, modulo weights greater than $W$, and push it to the target, using $N^(- l) z$ as source parameter. Keep the parameter-zero central graph and its density exactly, rather than Taylor-truncating them. Denote the resulting approximation by $Phi_(v \, l)^R$. The preimage of a fixed small target central patch has spatial size at most $C e^(- gamma l)$, for a fixed $gamma > 0$.
  Compare consecutive approximations at source time $- l$, first applying one step to the earlier source polynomial. Exact raw state dynamics makes their spatial Taylor jets agree through degree $R$. In particular, the crossing density transformation does not require the next shape derivative. All higher derivatives needed for this comparison are tempered for fixed $R \, W$. Taylor’s formula at the contracted source argument and Lemma 20 give
  #[#set math.equation(numbering: n => "(4.4)")
   $ parallel Phi_(v \, l + 1)^R - Phi_(v \, l)^R parallel_(C^k) lt.eq C_(R \, W \, k \, epsilon.alt) \( v \) e^(- { gamma \( R + 1 - r \( W \, k \) \) - C \( W \, k \) - epsilon.alt } l) . $ <hull:profile-difference>]
  Choose $R$ so that the exponent in braces is positive. The differences are summable in $C^k$. Comparing two spatial cutoffs whose jets agree through the smaller cutoff gives the same estimate. Thus increasing $R$ after obtaining $C^0$ convergence does not change the limit. One may then increase $R$ again to obtain convergence in each $C^k$. The limits for different $W$ are compatible by the same uniqueness estimate.
  Every prescribed finite spatial jet is retained by taking $R$ sufficiently high; convergence in that derivative order proves Taylor matching. Shifting the source sequence by one step proves exact formal equivariance. Finally, all estimates in (4.4) hold at shifted regular centers with tempered prefactors. Summing the geometric series after reducing the slack shows that each fixed coefficient norm of the limit is tempered. Only a fixed weight cutoff and a fixed spatial norm are being bounded at a time. ◻
]

The following quantitative comparison connects this constructed family to actual plaques. It is the reason formal identities at a displaced axis point can be tested by actual evaluations.

#thm([Lemma 4.10.])[
  (Approximation of actual transported plaques).  #emph[Fix a target norm consisting of graph derivatives through order $k + 1$ and log-density derivatives through order $k$, and fix $K > 0$. For a sufficiently large weight cutoff $W$ and a sufficiently high finite state level, the following holds. Start at a negative return $- n$ with an actual state in a bounded small forward-admissible domain, and transport its actual plaque to the target. On a fixed smaller central unstable patch, substituting its target normal coordinates into $Phi_v$ truncated through weight $W$ approximates that plaque in the prescribed norm with error at most $C e^(- K n)$. The level, cutoff, and constant may depend on $k \, K$.]
] <hull:actual-approximation>

#proof[
  Let the source be at time $- n$ and consider only times from $- floor.l n \/ 2 floor.r$ to zero. On every fixed finite normal array, a monomial of weight $d$ in the transported state is bounded by
  #[#set math.equation(numbering: n => "(4.5)")
   $ C_epsilon.alt e^(- d n \/ 2 + epsilon.alt n) $ <hull:half-small>]
  throughout this last half. Here and below the finite arrays are fixed before taking $n$ large, and slack is divided among their finitely many coefficients. Slow regularization bounds every fixed tempered conversion factor uniformly by $C_epsilon.alt \( v \) e^(epsilon.alt n)$ on this interval.
  We first establish a common geometric patch. The actual crossings remain on the stable axis. At a crossing, the inverse unstable parameter differential over a block is the transpose of the contracting stable-axis differential, because $D_x B \( x \, 0 \) = 0$ and symplecticity gives $D_y B \( x \, 0 \) = D_x A \( x \, 0 \)^(- t)$. Choose a fixed block length making this inverse norm less than $1 \/ 4$, after the bounded chart conversions. Uniform finite derivatives of actual plaques and of this fixed block map extend the inverse contraction to a fixed small parameter ball with norm less than $1 \/ 2$. During the last half the crossings tend uniformly to zero, so the same ball is available for all sufficiently large $n$. Shorter intermediate blocks have bounded cost. A fixed small final patch therefore has true inverse arguments of size
  #[#set math.equation(numbering: n => "(4.6)")
   $ \| y_(- floor.l n \/ 2 floor.r) \| lt.eq C e^(- gamma_1 n) $ <hull:half-arguments>]
  at halfway, for a fixed $gamma_1 > 0$.
  Fix the low-order comparison domain before choosing $W$. It consists of graph jets through $k + 2$ and density jets through $k + 1$ in a compact neighborhood of the bounded central jets, with graph Jacobians bounded away from singularity. The true jets lie there after shrinking the patch. Let $L_k gt.eq 2$ bound the one-step jet transformation and its first derivatives on a slightly larger such domain. This number uses only the fixed low orders and the uniform raw geometric bounds.
  For each fixed $W$, every positive-parameter term of the truncated profile tends uniformly to zero in these low norms during the last half: its spatial coefficient is tempered, while its state monomial has positive weight and satisfies (4.5). Thus the substituted profiles lie in the same comparison domain for all $n gt.eq n_0 \( W \)$. This is the decisive point: the threshold depends on $W$, but the amplification constant $L_k$ does not.
  Compare the actual and substituted profiles at halfway. Choose a spatial order $S$ and a finite tower containing their spatial jets through $S$. Expand the smooth inverse normal change to ordinary degree $b$, where $\( b + 1 \) w_0 > 2 W$. All terms of weight at most $W$ agree by Lemma 21. Every remaining polynomial term has weight greater than $W$ and is bounded using (4.5). The ordinary Taylor remainder satisfies the same bound by the choice of $b$. Consequently the differences of spatial Taylor coefficients through order $S$ are at most $C e^(- W n \/ 4)$, after sufficiently small slack. The spatial Taylor remainder at the true inverse argument is bounded by $C e^(- gamma_1 \( S - k \) n + epsilon.alt n)$, using (4.6), uniform actual plaque derivatives, and tempered profile coefficients. Choose
  #[#set math.equation(numbering: n => "(4.7)")
   $ gamma_1 \( S - k \) > W \/ 2 + 1 . $ <hull:spatial-choice>]
  The initial error in the graph/density norm at halfway is then at most $C e^(- W n \/ 4)$.
  At every last-half step, the substituted truncated profiles satisfy the exact graph/density recurrence modulo weights greater than $W$. For fixed $W$ and each fixed parameter derivative order, the real graph transformation of the finite polynomial profile is defined on a temperedly small parameter ball and has tempered derivatives there. Indeed its central graph Jacobian is uniformly invertible; the finite profile coefficient bounds give a tempered radius on which it remains invertible, and implicit differentiation uses only finitely many tempered coefficients. Exponentially small transported states eventually lie in these balls, uniformly over the last-half interval. Taylor-expand that smooth recurrence to ordinary degree $b$ with $\( b + 1 \) w_0 > 2 W$. Formal equivariance kills its terms through weight $W$, and (4.5) bounds all remaining terms and the smooth remainder by $C e^(- W n \/ 4)$. The same estimate holds in the fixed low derivative norms. The constant and the large-$n$ threshold may depend on $W \, S$, which have now been fixed.
  These errors can be compared at the true successive arguments. The approximate transformed argument differs from the true one by a bounded multiple of the source point error. Moving its jets to the true argument costs at most another bounded factor, because one additional spatial derivative lies in the fixed comparison domain. Increasing $L_k$ once, if necessary, the successive errors $E_i$ satisfy
  $ E_(i + 1) lt.eq L_k E_i + C e^(- W n \/ 4) . $
  There are at most $n$ steps. Hence the final error is at most
  #[#set math.equation(numbering: n => "(4.8)")
   $ C n L_k^n e^(- W n \/ 4) lt.eq C' e^(- { W \/ 4 - log L_k - 1 } n) . $ <hull:actual-error>]
  Finally choose $W > 4 \( K + log L_k + 2 \)$, then $S$ by (4.7), then the requisite finite level and ordinary Taylor degrees. This order of choices proves the result. All estimates were uniform on the fixed final subpatch. ◻
]

#thm([Lemma 4.11.])[
  (Translation of the formal family).  #emph[At a nearby typical point of the central unstable plaque, re-center $Phi_v \( z \, y \)$ over that point’s stable axis. Its graph-and-density state series belongs formally, at every finite arrival level, to the arrival variety. The re-centered zero-order log-density has exactly the prescribed background value. This assertion is understood on finite homogeneous parameter sections and then in weight completion.]
] <hull:transport>

#proof[
  Fix the arrival chart and a polynomial relation of its finite-level variety. Re-centering is a smooth graph transformation followed by an implicit equation for the crossing. At parameter zero it describes the actual central unstable plaque, and its crossing derivative is invertible. Substituting $Phi_v$ therefore gives a well-defined parameter series with smooth spatial coefficients.
  Fix one weight $d$ of this series. Evaluate on actual states transported from negative returns as in Lemma 17. At the arrival point the transported actual plaques satisfy the chosen polynomial relation exactly. By Lemma 22, the substituted profiles approximate all graph and density jets needed for the test to accuracy $e^(- K n)$ for arbitrary prescribed $K$. The arrival chart is fixed, so re-centering and polynomial evaluation have fixed smooth comparison constants. Taylor-expand the resulting composition in positive-weight variables through sufficiently high ordinary order, then retain weights through a large cutoff. On transported states its discarded terms again decrease as fast as required, by the positive minimum weight and (4.5) at the final time.
  Choose $K > d + 1$ and take an evaluation array containing every term of this finite polynomial. Pure-weight extraction has cost $e^(\( d + epsilon.alt \) n)$, so its weight-$d$ component vanishes on the departure variety. Increasing the level is harmless by the surjectivity in Lemma 17. The same test, applied to the re-centered zero-order log-density minus its prescribed background, proves that equality too; omitting this entry from the state causes no loss. Repeat at every finite weight and arrival level.
  On any fixed homogeneous parameter section, an ordinary coefficient uses only bounded weights by Lemma 16. Thus all compositions in the statement are ordinary formal compositions at each finite test. No analyticity in the spatial variable, convergence in parameters, or regular dependence of the arrival normal chart on the center has been used. ◻
]

=== 4.6 Taking the spans <taking-the-spans>

The varieties constructed above parameterize alternative plaque jets. We now use their raw state coefficients to form spatial Taylor series, and take the affine span of their conormal forms at a fixed formal point. The remaining task is to prove constant formal rank and independence from the parameters and higher lifts.

Choose compatible local raw submersion coordinates $\( a \, t_j \)$ on each finite level. For a fixed Taylor order in $y$, take $j$ large enough to contain its graph and log-density coefficients. These coefficients are smooth in the base $a$ and analytic in the hidden parameters $t_j$, also after any fixed number of base derivatives, by Lemma 11. Thus the spatial series used here are formal in $y$, with these actual coefficient functions of $\( a \, t_j \)$. When we re-center at a typical actual state and Taylor-expand in the parameters, these are precisely the state jets matched by Lemma 21. Its smooth spatial coefficients will let us transport those parameter Taylor coefficients along the actual unstable plaque; no profile is being evaluated at arbitrary hidden parameters.

Restore the fixed form units in the graph-conormal formula. To retain the translation part when passing from affine to linear spans, augment each alternative with a scalar slot and write

$ upright(bold(u))_(a \, t_j) \( y \) = \( u_(a \, t_j) \( y \) \, 1 \) . $

At a formal section point $\( x \, y \)$, solve the graph equation for the base label while leaving the hidden parameters free:

#[#set math.equation(numbering: n => "(4.9)")
 $ P_(b \( x \, t_j \, y \) \, t_j) \( y \) & = x \,\
b \( x \, t_j \, 0 \) & = x \,\
S \( x \, t_j \, y \) & = upright(bold(u))_(b \( x \, t_j \, y \) \, t_j) \( y \) . $ <hull:point-constraint>]

The submersion to the base gives this formal solution in $y$, with coefficients smooth in $x$ and analytic in $t_j$. We take the span of the augmented forms by taking all derivatives of $S$, including order zero, in the free parameters while keeping $\( x \, y \)$ fixed. At the central point its dimension is a number $d$, constant almost everywhere by equivariance and ergodicity. It is already detected at a finite level: at the center only the slope and prescribed density enter, and the fiber dependence is analytic.

#thm([Lemma 4.12.])[
  (Constant formal rank).  #emph[The constrained augmented span is a free formal subbundle of rank $d$. Its coefficients can be taken smooth in the stable-axis variable, with their full coherent ambient jets. The resulting subbundle is independent of the hidden parametrization and of all higher-level lifts used in its construction.]
] <hull:rank>

#proof[
  Fix a spatial Taylor order. Each fixed $y$-order in (4.9) uses only finitely many shape and density jets, including one additional shape derivative for the conormal slope. Increasing the number of derivatives in $t_j$ does not increase that required state level: it differentiates the same functions on that level.
  For any $d + 1$ multi-indices $nu_0 \, dots.h \, nu_d$, including zero, form the wedge of the columns $partial_(t_j)^(nu_i) S$ while keeping $\( x \, y \)$ fixed. Substitute $x = P_(a \, t_j) \( y \)$ afterward. Every spatial Taylor coefficient of this wedge is a function on a finite $V_j$, smooth in $a$ and analytic in $t_j$. We claim that it vanishes.
  First center the calculation at a nearby typical actual state. Polynomial stable-axis re-centering identifies its variety germ with the present finite-level germ. In the re-centered chart choose a homogeneous tower section over a level containing all jets needed for the tested spatial coefficient. This section covers the entire finite-level parameter germ after the invertible chart comparison. Higher choices do not affect the tested spatial coefficient at displacement zero.
  Apply Lemma 21 in this re-centered chart. At each small finite displacement on its actual unstable plaque, the parameter-zero graph is actual. The derivative of its crossing with respect to the base parameter is invertible near displacement zero, so the fixed-point constraint can be solved there as a formal series in the finite parameters. At typical displaced centers, Lemma 23 places all these constrained variations in the arrival centered fibers. Their augmented-form derivatives belong to the centered $d$-dimensional span. Every $\( d + 1 \)$-fold wedge therefore vanishes.
  Each such derivative has smooth dependence on spatial displacement. Typical displaced points are dense on this plaque, so the wedge vanishes smoothly along a patch. Its tested Taylor coefficient at zero is precisely the coefficient under consideration at the chosen actual state: finite-level re-centering preserves the needed jets, and the homogeneous lift covers their finite parameter germ. Thus this coefficient vanishes at every nearby requisite typical actual state. Lemma 18 now makes it vanish throughout a product neighborhood in $V_j$. At a fixed spatial order all multi-indices can use the same finite level and connected fiber patch. The conclusion applies to each of their analytic coefficient functions there.
  Choose $d$ independent derivative columns at the central state, and let $B$ be their formal continuation in the section-point variables. A corresponding $d$-minor is a unit. Substitute the formal solution of (4.9) in the wedge identities just proved. They show that every derivative column lies in the free rank-$d$ module generated by $B$. Differentiating a basis column in a hidden direction gives another derivative column; hence
  $ partial_(t_j) B = B C_j $
  for a formal coefficient matrix $C_j$. Normalize the selected minor of $B$ to the identity. Its hidden derivative is then zero, since the same relation has zero rows on that minor. This proves that the span is independent of hidden variables.
  The chain rule under an invertible hidden reparametrization gives the same derivative span in both directions. Higher-level parameters are also hidden parameters, so changing a higher lift cannot alter the span. For each fixed ambient order choose a sufficiently high finite level; the unit-minor characterization makes the resulting jets consistent. Finally, one may retain the base variable $x$ as an actual smooth variable while expanding only in $y$ in (4.9). A smooth reference hidden section then gives smooth coefficients on the stable axis, whose base derivatives are exactly their higher ambient coefficients. ◻
]

Intersect this augmented linear bundle with scalar slot $1$. It defines the formal affine field $cal(A)^u$. The scalar-$1$ intersection is nonempty at the center because it contains the actual form. The same unit-minor description makes it a formal affine bundle on the local germ.

#thm([Lemma 4.13.])[
  (Coherence on both axes).  #emph[The full ambient jets of $cal(A)^u$ have smooth holonomic representatives along both entire typical strong axes. They agree with the regular construction almost everywhere and are compatible with dynamics, changes of section, and regular flow translations.]
] <hull:coherence>

#proof[
  Stable-axis agreement at nearby typical centers follows from Lemma 14 and the intrinsic constrained-span description. Smooth stable-axis coherence was proved in Lemma 24.
  For the unstable axis take a homogeneous tower section over a level containing the base variables and the parameters furnishing the $d$ independent columns. Use $Phi_v$ to carry the same constrained basis calculation to a small finite $y$. The columns and every one of their formal point coefficients depend smoothly on $y$. Their central minor remains invertible after shrinking the patch. At a typical arrival center, Lemma 23 places their full graph-state series in every finite arrival variety, including the prescribed zero-order density. For a prescribed point-jet order, take an arrival state level containing the required graph and density derivatives, including the extra graph derivative in the conormal form. Taylor re-expansion of the smooth spatial profile about this fixed arrival center is exactly the graph reconstructed from those state jets. Fix a full formal arrival point $q = \( x' \, y' \)$ and a finite jet order. Write $S_(upright("arr")) \( q \, t' \)$ for the arrival constrained augmented family from (4.9). In an arrival submersion chart, the state inclusion and the point constraint give, at the chosen finite order,
  $ S_(upright("tr")) \( q \, t \) = S_(upright("arr")) #scale(x: 120%, y: 120%)[\(] q \, Theta \( q \, t \) #scale(x: 120%, y: 120%)[\)] \, $
  where $t$ denotes the departure hidden parameters, $Theta \( q \, t \)$ the induced arrival hidden parameters, and both augmented families are expressed in the arrival chart. Only finitely many state levels enter this identity. Differentiating in $t$ while keeping $q$ fixed shows by the chain rule that every transported column belongs to the arrival constrained span. That span also has rank $d$, so the retained independent columns give the whole bundle. Inclusion and equality of ranks suffice; no surjectivity between infinite towers is required. Equality at each finite order proves full ambient coherence on this unstable-axis patch.
  All operations commute with raw graph transformation, normal comparison, and the appropriate conormal height factors. The constant height multiplier at a fixed point is independent of the alternative being spanned. Thus the constructed jets are equivariant for dynamics and changes of section. Regular centers related by a fixed flow shift have compatible jets by Lemma 14.
  To cover an entire typical stable leaf, fix a finite collection of orders. Local smooth representatives have a positive radius at almost every center. Choose forward returns on which their radius is bounded below and the required finite construction bounds are bounded above. Every compact portion of the central stable leaf contracts into these patches; pull the representatives back. Two pulled representatives agree on the dense set of typical points and hence everywhere. The same argument backward in time covers the entire unstable leaf. Repeat one finite collection of orders at a time. Agreement of the orders and their derivative identities follows on overlaps by density and smoothness. This does not require a single radius valid at all orders. Measurability of the radii used here is established below. ◻
]

#thm([Lemma 4.14.])[
  (Measurable finite-order bounds).  #emph[The construction and the representatives in Lemma 25 admit measurable finite-order norm and radius tests. Smooth flow transport supplies coherent representatives on typical weak plaques, agreeing leaf-almost everywhere with the regular data. For almost every individual strong or weak plaque, every fixed finite collection of coefficient norms is finite on each compactly contained plaque subpatch. Positive-measure families of these plaques can therefore be chosen with a common finite bound on the prescribed subpatches.]
] <hull:measurability>

#proof[
  Raw leaf charts and actual finite plaque jets have measurable, indeed continuous local transverse dependence. The adapted normal changes have measurable finite jets and domains. All subsequent finite constructions use polynomial spans, kernels, nonzero minors, implicit coordinate charts, or limits of measurable coefficient functions. Countable choices of candidate minors and coordinate balls give measurable versions. The coefficients of the resulting formal fields are therefore measurable.
  It remains to justify the patch bounds without presupposing a smooth transverse choice of representative. In a fixed countable plaque box, the smooth representative on a typical plaque agrees almost everywhere with these measurable coefficients. Its norm on a compact subpatch is the essential supremum of the same coefficient norms there; this is measurable by conditional integration. Derivative norms are tested in the same way using the higher coherent coefficients. For a radius bound, work in a fixed Grassmann chart with a chosen minor bounded away from zero and impose bounded jets and Taylor difference estimates through an order strictly higher than the differentiability being requested, between almost every pair of points on a smaller plaque ball. These tests are measurable by Fubini and countably many radii and bounds. Existing smooth coherent representatives satisfy them locally. Conversely, such bounds extend the tested jets continuously to the closure of a dense valid set and give their stipulated finite differentiability and coherence. A dense countable set of mutually valid points may be selected by successive Fubini choices. These tests provide the measurable positive radii required in the globalization proof.
  On weak plaques use the whole-strong-leaf representatives and smooth flow transport. At points for which both constructions are regular, their jets agree by the flow comparison already proved. Strong-leaf conditional agreement and flow Fubini then give agreement almost everywhere on the weak plaque; agreement at every flow time is unnecessary. Compact subpatches have finite smooth norms. Conditional essential suprema make these bounds measurable on the family of weak plaques as well.
  An almost-everywhere finite measurable bound is bounded on a positive-measure subfamily of any positive-measure plaque-label set. The same applies to the reciprocal of a positive radius and to any finite list of bounds. Absolute continuity of the strong and weak foliations and a countable cover allow all conditional agreement requirements to be imposed simultaneously, also at integer iterates. These statements concern bounds along plaques; they do not assert that the formal fields themselves have tempered norms along every regular orbit. ◻
]

#proof[
  The unstable affine field is supplied by Lemma 24. Its central value contains the actual augmented form and hence the actual form. Lemmas 25 and 26 give the full ambient coherence, globalization, and measurable finite-order bounds. Restore the height dependence $e^(- h tau)$.
  Apply the same construction with time reversed to obtain $cal(A)^s$, restoring height dependence $e^(h tau)$. One may choose charts measurably in flip pairs, with the axes interchanged; all graph comparisons preserve the construction, so it is compatible with flip. Proposition 19 gives the constant cross pairing of the centered affine spans. The transformation laws follow from the exact raw form transformation and the fixed-point nature of the span. This proves every assertion of the theorem. ◻
]

== 5 Formal symmetries and coherent transport <sym:section>

We apply the affine-field construction of Theorem 13. Its full ambient jets, and their holonomicity on both axes, are essential here. Smoothness of the values on an axis alone would not suffice. We construct the formal strict contact symmetries of these fields, prove that their projected values span the section tangent space, and derive the entropy trace identity used in the next section. All vector spaces in this section are complexified unless a real structure is specified. Formal series carry the coefficientwise linear topology: a neighborhood of zero prescribes the vanishing of finitely many Taylor coefficients. In particular, no convergence of a formal series at a nonzero point is asserted.

=== 5.1 The symmetry equations <the-symmetry-equations>

Fix a regular center and a section through it, with coordinates $q in bb(R)^(2 m)$, center $q = 0$, and contact lift

$ alpha = d tau + theta \, #h(2em) omega = d theta . $

A strict contact vector field commuting with $X = partial_tau$ is uniquely specified by a formal function $p \( q \)$:

#[#set math.equation(numbering: n => "(5.1)")
 $ iota_(Y_p) omega = - d p \, #h(2em) Z_p = Y_p + #scale(x: 120%, y: 120%)[\(] p - theta \( Y_p \) #scale(x: 120%, y: 120%)[\)] partial_tau \, #h(2em) alpha \( Z_p \) = p . $ <sym:hamiltonian-lift>]

Indeed Cartan’s formula gives $cal(L)_(Z_p) alpha = 0$, and every strict lift has this form. For formal functions $p \, r$, we use the bracket

$ { p \, r } = Y_p r = omega \( Y_p \, Y_r \) \, #h(2em) \[ Z_p \, Z_r \] = Z_({ p \, r }) . $

Augment each affine field $cal(A)^epsilon$ by a scalar slot:

$ cal(B)^epsilon = "span" { \( a \, 1 \) : a in cal(A)^epsilon } \, #h(2em) epsilon in { u \, s } . $

Thus the scalar-one slice recovers the affine field, including its translation part. On the section, put $b_p = p - theta \( Y_p \)$. The infinitesimal action on an augmented section is

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(D)_p^u \( beta \, s \) & = \( cal(L)_(Y_p) beta - h b_p beta \, thin Y_p s \) \,\
cal(D)_p^s \( beta \, s \) & = \( cal(L)_(Y_p) beta + h b_p beta \, thin Y_p s \) . $ <sym:augmented-action-u>]

These formulas retain the factors $e^(- h tau)$ and $e^(h tau)$ in the contact lift. Define $frak(h)$ by requiring each operator to preserve its corresponding formal subbundle. In a Grassmann chart, choose a frame matrix $B^epsilon$ and a quotient matrix $Q^epsilon$ with kernel $cal(B)^epsilon$; the equations are

#[#set math.equation(numbering: n => "(5.3)")
 $ Q^epsilon cal(D)_p^epsilon B^epsilon = 0 \, #h(2em) epsilon = u \, s . $ <sym:linear-equations>]

They are linear in $p$. Their coefficients through order $r$ use only finitely many background coefficients and the $\( r + 2 \)$-jet of $p$. Changing a frame or a Grassmann chart gives equivalent equations. Consequently $frak(h)$ is a closed linear subspace of the formal Hamiltonians and is closed under the Poisson bracket. In particular it is a linearly compact Lie algebra with continuous bracket. Set

#[#set math.equation(numbering: n => "(5.4)")
 $ xi \( p \) = p \( 0 \) \, #h(2em) frak(k) = { p in frak(h) : Y_p \( 0 \) = 0 } . $ <sym:isotropy-functional>]

Both the functional and the evaluation map are continuous; $frak(k)$ is an open subalgebra.

=== 5.2 A signed dilation <a-signed-dilation>

The normal forms used to construct the hulls had one-signed state weights. For the present purpose we need a different normalization, of the section map itself, with both dynamical signs. This is only a formal normalization, performed one ordinary Taylor degree at a time.

#thm([Lemma 5.1.])[
  (Signed symplectic normalization).  #emph[Along almost every orbit of $f = phi.alt_T$ there are centered formal symplectic section coordinates, with tempered jets at every fixed order, having the following properties. The symplectic form is a constant form $omega_0$. If $lambda_1 \, dots.h \, lambda_(2 m)$ are the signed Lyapunov exponents, counted with multiplicity and measured per iterate of $f$, then 
$ D = sum_i lambda_i q_i partial_(q_i) $

 is symplectic and every normalized section map commutes with $D$. The coordinates lift strictly with $theta_0 = 1 / 2 iota_R omega_0$, where $R = sum_i q_i partial_(q_i)$, and center height zero. The centered return map has the form 
#[#set math.equation(numbering: n => "(5.5)")
 $ \( q \, tau \) mapsto \( F \( q \) \, tau + r \( q \) \) \, #h(2em) r \( 0 \) = 0 \, quad D r = 0 . $ <sym:graded-return>]

 The actual strong stable and unstable Taylor germs are respectively the negative and positive coordinate axes, with their horizontal lifts.]
] <sym:graded-contact>

#proof[
  The symplectic pairing between Lyapunov spaces of exponents $lambda \, mu$ vanishes unless $lambda + mu = 0$. To see this, transport the pairing along the orbit and use the two-sided Lyapunov estimates; when the sum is nonzero, transport in the direction in which the product of the two norms tends to zero. A measurable symplectic Oseledets frame therefore pairs opposite spaces and has tempered finite-dimensional change-of-frame costs. Centered Darboux coordinates with these first derivatives give the initial constant symplectic form. The field $D$ preserves $omega_0$.
  Suppose that the section map has already been made weight-preserving through degree $j - 1$, with $j gt.eq 2$. Factor out its linear part. The non-weight-preserving part of its degree-$j$ term is a homogeneous symplectic vector field. More explicitly, the symplectic pullback identity in degree $j - 1$ has a linear term $cal(L)_V omega_0$ and terms determined by lower degrees. Those lower terms have weight zero; its nonzero-weight part is therefore $cal(L)_(V_(eq.not 0)) omega_0 = 0$. A homogeneous symplectic vector field is Hamiltonian, by the polynomial Poincare lemma.
  On each nonzero-weight component solve the nonresonant homogeneous coordinate-change equation, and take zero correction on the zero-weight component. Explicitly, write the degree-$j$ error after factoring the linear map as $V_n$, and the coordinate correction as $Q_n$. Conjugating by the correction gives the equation
  $ Q_(n + 1) = A_(n *) Q_n - A_(n *) V_n \, #h(2em) \( A_(n *) Q \) \( q \) = A_n Q \( A_n^(- 1) q \) . $
  The operator $A_(n *)$ preserves Hamiltonian vector fields and has the single exponent $- gamma$ on their $D$-weight-$gamma$ module. Thus Lemma 9 applies for $gamma eq.not 0$. At this degree the nonzero exponent differences form a finite set bounded away from zero. The appropriate forward or backward Green series consequently gives a tempered correction. The formal time-one map of its Hamiltonian vector field is symplectic and changes no lower degree. Induction gives compatible coordinates at all orders. This argument imposes no discreteness condition on the union of the weights over all degrees.
  The radial primitive $theta_0$ satisfies $cal(L)_D theta_0 = 0$. A symplectic coordinate change has a strict lift because the difference of its pulled-back primitive and the original primitive is formally exact. Normalize its primitive at zero. For the return map, strictness gives $d r = theta_0 - F^(*) theta_0$. Both terms are $D$-invariant, so $d \( D r \) = 0$; evaluation at zero gives $D r = 0$.
  Finally, a graded section map preserves each signed linear axis: a monomial involving only negative-weight inputs cannot have positive output weight, and conversely. The actual stable germ is a graph over the negative axis with tempered finite jets. If the first nonzero graph coefficient had degree $j$, its invariance would give a homogeneous recurrence whose exponent is a positive output weight minus a sum of negative input weights. This exponent is nonzero. A homogeneous recurrence of nonzero exponent has no nonzero two-sided tempered solution. Thus this coefficient vanishes; induction removes every graph coefficient. The unstable argument uses the opposite signs. The strong leaves are horizontal. On either signed linear axis $theta_0$ vanishes, so their centered horizontal lifts have height zero as formal germs. ◻
]

#thm([Proposition 5.2.])[
  (Dilation in the symmetry algebra).  #emph[In the coordinates of Lemma 27, 
#[#set math.equation(numbering: n => "(5.6)")
 $ H = - T + theta_0 \( D \) \, #h(2em) Z_H = D - T partial_tau $ <sym:dilation-hamiltonian>]

 belongs to $frak(k) subset frak(h)$. The operator $"ad" H$ on formal Hamiltonians is $D$ and is semisimple on every finite Taylor quotient, with real weights. Every closed $"ad" H$-invariant linear subspace admits the continuous projections onto each individual weight. On a finite-dimensional continuous invariant subquotient, weight-zero vectors have weight-zero lifts. Moreover $frak(h)_0 subset frak(k)$, and $xi$ vanishes on every nonzero weight space.]
] <sym:dilation>

#proof[
  For clarity, consider the finite-dimensional space of augmented section jets through a fixed order $N$. Its subspace consisting of jets valued in $cal(B)^u$ is measurable and invariant under the return cocycle. In the normalized charts that cocycle acts on the form component by
  #[#set math.equation(numbering: n => "(5.7)")
   $ beta mapsto e^(h T - h r) F^(*) beta \, $ <sym:entropy-jet-action>]
  and on the scalar component by composition with $F$. For $cal(B)^s$ the multiplier in (5.7) is $e^(- h T + h r)$. These are pullbacks from the next center to the present center; they may equivalently be viewed as a cocycle over the backward base map.
  For an $m$-form monomial $q^a thin d q_(i_1) and dots.h.c and d q_(i_m)$, its ordinary weight is
  $ sum_i a_i lambda_i + lambda_(i_1) + dots.h.c + lambda_(i_m) . $
  Add $h T$ for the $u$ form component and subtract $h T$ for the $s$ form component. Scalar monomials have their unshifted ordinary weight. The return cocycle preserves these augmented weights: $F$ is graded and $r$ has weight zero. Each block has the single Lyapunov exponent indicated by its weight. Indeed its diagonal ordinary-degree blocks are tensor representations of the linear return maps with precisely that exponent. The remaining terms are triangular in ordinary degree; at a fixed truncation there are only finitely many such extensions. Their coefficients are tempered, and the finite iterated sums in an upper triangular product add only subexponential costs to the common exponent.
  Lemma 8 now splits the measurable invariant jet subspace into these weight blocks. The ambient finite jet cocycle of the smooth return maps on the compact phase space has bounded one-step coefficients, and its formal change of coordinates is tempered at the fixed order. No tempered bound on the hull subspace itself is being assumed. The infinitesimal diagonal action is $\( cal(L)_D + h T \, D \)$ on the two augmented $u$ slots and $\( cal(L)_D - h T \, D \)$ on the $s$ slots. It therefore preserves both augmented subbundles through order $N$. Since $N$ was arbitrary, Equations (5.2)–(5.2) show that $D - T partial_tau$ preserves both formal affine fields. The identity $d \( theta_0 \( D \) \) = - iota_D omega_0$ proves (5.6).
  For any Hamiltonian $p$, ${ H \, p } = D p$. Thus the asserted diagonalization is literal monomial diagonalization. To project onto a prescribed weight $gamma$, choose on each finite Taylor quotient the polynomial spectral projector onto $gamma$ for $D$. Applied to a fixed formal series these projectors eventually agree at every fixed coefficient, and converge coefficientwise to its weight-$gamma$ part. A closed invariant subspace contains this limit. A continuous finite-dimensional quotient is detected at a finite Taylor order, so the same projectors commute with passage to that quotient and give the claimed lifts. The argument applies also to closed invariant subspaces before taking such a quotient.
  All coordinate weights in degree one are nonzero. A weight-zero Hamiltonian therefore has zero differential at zero and belongs to $frak(k)$. Evaluation at zero sees only the constant monomial, which has weight zero. ◻
]

#thm([Lemma 5.3.])[
  (Entropy trace identity).  #emph[For every $p in frak(h)_0$, the linear map $A_p = d Y_p \( 0 \)$ preserves both actual signed tangent planes and 
#[#set math.equation(numbering: n => "(5.8)")
 $ h xi \( p \) = "tr" #scale(x: 120%, y: 120%)[\(] A_p \|_(E^s) #scale(x: 120%, y: 120%)[\)] . $ <sym:geometric-trace>]

 Here the strong tangent planes are identified with their projections to the section.]
] <sym:trace>

#proof[
  Since $\[ D \, Y_p \] = 0$ and $Y_p \( 0 \) = 0$, the derivative $A_p$ commutes with $D$. It preserves the signed planes, which are the actual strong planes by Lemma 27. At the center, the actual form $u$ annihilates $E^u$ and is a volume form on $E^s$. Its infinitesimal transform under $Z_p$ is therefore
  $ #scale(x: 120%, y: 120%)[\(] "tr" \( A_p \|_(E^s) \) - h xi \( p \) #scale(x: 120%, y: 120%)[\)] u . $
  Preservation of the affine field says that this vector belongs to the direction space of $cal(A)^u \( 0 \)$. Pairing any such direction with the actual opposite form $w \( 0 \)$ gives zero, by the constant cross-pairing property in Theorem 13. Since $u \( 0 \) and w \( 0 \) eq.not 0$, the displayed scalar is zero. Complexification causes no change in this argument. ◻
]

=== 5.3 Finite solution spaces on a whole axis <finite-solution-spaces-on-a-whole-axis>

The dilation coordinates above are only measurable in the center. We will never differentiate them with respect to the center. Instead we use the equations in fixed smooth coordinates and the following finite-dimensional consequence of whole-axis coherence.

#thm([Lemma 5.4.])[
  (Full-solution projection bundles).  #emph[Refine the regular set by a countable conull intersection. For every finite order $r$, the projections of $frak(h)$ and $frak(k)$ to the Hamiltonian $r$-jets have smooth extensions on each entire strong axis through a regular center. Their fibers at every point of that axis are the projections of the full formal solution spaces for the extended background jets there. Projections between successive jet orders are surjective smooth bundle maps. These statements also hold after appending a fixed finite list of linear jet conditions whose matrices are smooth along the axes and equivariant under the return maps.]
] <sym:full-projections>

#proof[
  Use the background extensions of Lemmas 25 and 26. Write $K_N \( a \)$ for the finite space of $\( N + 2 \)$-jets satisfying Equation (5.3) through degree $N$ at center $a$. Isotropy, when required, is an additional linear condition. For $N + 2 gt.eq r$, set
  $ V_(r \, N) \( a \) = pi_r K_N \( a \) . $
  Both $K_N$ and the map defining this image are finite-dimensional linear algebra in finitely many background jets. Their matrices are smooth on the axis.
  The ranks of the defining matrix $A_N$ and the augmented matrix obtained by stacking $A_N$ with $pi_r$ are invariant under the return dynamics, because finite symmetry conditions and jet projection are natural under centered coordinate changes. By ergodicity these ranks are constant almost everywhere, simultaneously for all $r \, N$ under consideration. These two ranks determine $dim K_N$ and $dim V_(r \, N)$. At a regular center a nonzero maximal minor remains nonzero on a small axis patch. Dense regular agreement prevents a larger rank anywhere on that patch: otherwise an open set of larger rank would meet the dense regular set. Thus both ranks, and consequently the kernel and image ranks, are constant near the center. Constant-rank linear algebra gives smooth kernel and image bundles there.
  This local assertion extends to the entire typical axis. Fix the finite list of matrices just used. Their local patches have measurable positive radii after also recording finite coefficient bounds and a lower bound for the chosen nonzero minors. Such data are provided by Lemma 26. Some positive-measure set has these radii bounded below. Returns of a typical center to that set, in the direction contracting the axis, bring every fixed compact portion of the axis into one of these patches. Pullback preserves the finite equations and both ranks. This proves the constant-rank conclusion on that compact portion. Exhausting the axis and intersecting over the countable list of finite tests gives the assertion for the whole axis. Forward time is used for the stable axis and backward time for the unstable axis.
  For fixed $r$, the spaces $V_(r \, N) \( a \)$ decrease with $N$ inside a finite-dimensional vector space. At regular centers all their dimensions are the same deterministic sequence of integers. Choose $N \( r \)$ after its eventual stabilization; a first adjacent equality would not suffice. The preceding whole-axis rank argument applies to every $N$, so for every point of that axis
  #[#set math.equation(numbering: n => "(5.9)")
   $ V_r \( a \) := ⋂_N V_(r \, N) \( a \) = V_(r \, N \( r \)) \( a \) . $ <sym:stabilized-projection>]
  It remains to identify this intersection with full solutions.
  We use the elementary linear compactness principle: a system of linear equations in coefficient variables, each equation involving only finitely many variables, has a solution if every finite subsystem has a solution. One proof regards each equation as a finitely supported row vector. Finite consistency makes the specified right sides a well-defined linear functional on the span of the rows; extend it to the direct sum of all coefficient coordinates. Its values on the coordinate vectors give a solution. If $v in V_r \( a \)$, impose the prescribed $r$-jet $v$ together with all formal symmetry equations. Every finite subsystem is solvable by the defining intersection, so this principle gives a full solution with that jet. Conversely every full solution projects into each $V_(r \, N)$. This proves the claimed equality.
  Equation (5.9) makes $V_r$ a smooth bundle. A full solution lifting any of its elements also supplies a lift at order $r + 1$, so $V_(r + 1) arrow.r V_r$ is surjective in every fiber. It is a smooth map of constant-rank bundles. All arguments apply unchanged to the isotropy condition or a finite list of linear conditions with the stated smoothness and equivariance. ◻
]

#thm([Proposition 5.5.])[
  (Transitivity).  #emph[At every regular center the map 
$ frak(h) arrow.r T_0 bb(R)^(2 m) \, #h(2em) p mapsto Y_p \( 0 \) $

 is onto. It remains onto at every point of the smooth formal extensions on either entire typical axis.]
] <sym:transitivity>

#proof[
  Fix a regular center $a \( 0 \) = 0$, and a smooth path $a \( t \)$ in one of its actual axes. Fix a desired equation order $r$. By Lemma 30, extend the $\( r + 3 \)$-jet of its particular isotropy $H$ to a smooth section $p_t$ of the full isotropy projection bundle on that axis. Each $p_t$ is represented by a Taylor polynomial in $z = q - a \( t \)$. It satisfies the symmetry equations through degree $r + 1$ and $Y_(p_t) \( a \( t \) \) = 0$.
  Differentiate while holding the original coordinate $q$ fixed. For a moving-center series $C_t \( z \)$ this differentiation is
  $ partial_t^(upright("fixed")) C_t = partial_t C_t - sum_i a'_i \( t \) partial_(z_i) C_t . $
  Full ambient holonomicity of the background states that its fixed-coordinate derivative vanishes, coefficient by coefficient. The same is true for smooth frames and quotient matrices obtained from it by the Grassmann-chart operations. Differentiating the linear equations through degree $r + 1$ therefore shows that $partial_t^(upright("fixed")) p_t$ satisfies them through degree $r$. The extra degree is what compensates for differentiation of the moving Taylor center; the order-two Hamiltonian operator accounts for the choice of the $\( r + 3 \)$-jet.
  Differentiating isotropy by the ordinary chain rule gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ Y_(partial_t^(upright("fixed")) p_t) \( 0 \) = - d Y_H \( 0 \) a' \( 0 \) . $ <sym:differentiated-value>]
  At the chosen center, $d Y_H \( 0 \)$ is conjugate to the signed dilation $D$. It is invertible and preserves each actual signed tangent plane. Using paths in the two axes therefore gives, at every prescribed finite equation order, a solution with any prescribed tangent value. Finite sums handle a value with both signs. Apply the linear compactness principle from Lemma 30, with this tangent value prescribed, to obtain a full formal solution. No compatibility of the separately chosen finite families is needed.
  Finally, the dimension of the evaluation image is the difference between the dimensions of the full symmetry and isotropy projections at first jet order. Those dimensions have the same constant values on the entire typical axes by Lemma 30. Surjectivity at their regular points consequently implies surjectivity throughout their smooth extensions. ◻
]

#thm([Proposition 5.6.])[
  (The effective symplectic homogeneous algebra).  #emph[The open isotropy $frak(k)$ contains no nonzero ideal of $frak(h)$, and is exactly the coadjoint stabilizer of $xi$. Evaluation identifies 
$ E = frak(h) \/ frak(k) tilde.eq T_0 bb(R)^(2 m) \, #h(2em) omega_E \( macron(p) \, macron(q) \) = xi \( { p \, q } \) . $

 This form is nondegenerate. On $E$, $"ad" H$ is $- D$, so it has no zero weight. With $E_(+)$ denoting its positive-weight subspace, the trace identity is 
#[#set math.equation(numbering: n => "(5.11)")
 $ c xi \( p \) = "tr" \( p \|_(E_(+)) \) \, #h(2em) p in frak(h)_0 \, #h(2em) c = - h eq.not 0 . $ <sym:algebra-trace>]

 Here $p \|_(E_(+))$ means the isotropy action by brackets. In particular $E_(+)$ corresponds to the geometrically stable plane.]
] <sym:effective>

#proof[
  Transitivity and the Hamiltonian bracket formula give
  $ xi \( { p \, q } \) = omega_0 \( Y_p \( 0 \) \, Y_q \( 0 \) \) . $
  Its radical is exactly the kernel of tangent evaluation. This is both the asserted symplectic identification and the assertion $frak(k) = "stab"_(frak(h)) xi$.
  Suppose an ideal $I$ lies in $frak(k)$ and $p in I$. Every iterated bracket of its projected field with fields from $frak(h)$ vanishes at zero. If $Y_p$ had a first nonzero homogeneous term of degree $j gt.eq 1$, brackets with symmetries having prescribed constant tangent values would differentiate that term. After $j$ such brackets a nonzero constant value would result. At each step the other bracket term has higher order, so it cannot cancel this leading derivative. This contradicts $I subset frak(k)$. Hence $Y_p = 0$ formally and $p$ is constant. A constant Hamiltonian has weight zero; Lemma 29 then gives $h p = 0$. Thus $I = 0$.
  For $p in frak(k)$ and any $q in frak(h)$, evaluation of the projected bracket gives $Y_({ p \, q }) \( 0 \) = - d Y_p \( 0 \) Y_q \( 0 \)$. Apply this first to $p = H$ to obtain the action $- D$, and then use Lemma 29 on the stable plane to obtain Equation (5.11). ◻
]

=== 5.4 Homogeneous fields and their transport <homogeneous-fields-and-their-transport>

#thm([Proposition 5.7.])[
  (Homogeneous formal fields).  #emph[Every $frak(k)$-invariant subspace $V subset E$ has a unique $frak(h)$-invariant formal distribution with value $V$ at zero. The construction respects real structures, inclusions, and natural tensor operations. If $V = frak(l) \/ frak(k)$ for a subalgebra $frak(l) supset frak(k)$, this distribution is involutive.]
] <sym:homogeneous-fields>

#proof[
  Choose symmetries $p_1 \, dots.h \, p_(2 m)$ whose projected values form a basis. Write $G_t$ for the composition of their formal flows with parameters $t_1 \, dots.h \, t_(2 m)$, and $F \( t \) = G_t \( 0 \)$. Its linear term is invertible, so the formal inverse function theorem gives $t = t \( q \)$. Transport $V$ by $d G_t \( 0 \)$ and substitute $t \( q \)$. All operations are well-defined in formal displacement parameters of positive order.
  We verify independence and invariance. Two such parameterized translations reaching the same point differ by a formal family fixing zero. Its right logarithmic derivative belongs coefficientwise to the projected symmetry algebra: composition and inversion give sums of conjugated generators, and their formal adjoint series are iterated brackets. Since the family fixes zero, these derivatives belong to the projected isotropy. Its derivative at zero consequently preserves $V$, by the linear differential equation starting at the identity. This proves independence. Including the formal flow of any further symmetry in the comparison proves invariance. Conversely any invariant field must be transported from its value by these spanning flows, which proves uniqueness. The same argument applies to invariant tensors and to the asserted compatibility operations.
  For involutivity, the Levi bracket of an invariant distribution at zero, evaluated on the values of $p \, q in frak(l)$, is the negative of the projected bracket ${ p \, q }$ modulo $V$. One can check this without assuming that the fundamental fields themselves are tangent everywhere: choose tangent sections with the same initial values and use that their brackets with symmetry fields remain tangent. Subtracting the two identities gives the claimed Levi bracket. It vanishes since $frak(l)$ is a subalgebra. Invariance and the spanning formal translations make the obstruction vanish as a full formal tensor. ◻
]

For the next proposition, an #emph[intrinsic] construction means one that commutes with formal strict contact isomorphisms of the affine data, including reciprocal constant rescalings of the two affine fields. Such rescalings do not change the symmetry equations.

#thm([Proposition 5.8.])[
  (Intrinsic transport on an actual axis).  #emph[On either entire typical strong axis there are local smooth formal identifications of $\( frak(h) \, frak(k) \, xi \)$, induced by strict contact coordinate changes. They may be chosen smoothly for a smooth finite-dimensional family of paths on an axis patch. Every intrinsic isotropy-invariant tensor or subspace construction, extended homogeneously as in Proposition 33, has smooth full ambient formal jets on that axis, and these jets are holonomic there. The same conclusion holds for a continuous choice from a finite intrinsic list of invariant subspaces after these identifications. Natural choices commute with the dynamics. Flow translation gives the corresponding weak-axis statement, with almost-everywhere agreement at regular centers.]
] <sym:axis-transport>

#proof[
  Work first on a smooth axis patch in a fixed section, and let $a \( t \)$ be a path there. By Proposition 31 and Lemma 30, the full finite symmetry projections surject smoothly onto prescribed tangent values. Choose a smooth section with value $a' \( t \)$ at the first required order. Lift it successively through the surjective smooth bundle maps of Lemma 30, using smooth right inverses chosen from bundle metrics on the axis. This constructs a compatible family of formal symmetries $p_t$ whose every coefficient is smooth and for which
  $ Y_(p_t) \( a \( t \) \) = a' \( t \) . $
  The choice can be made smoothly in auxiliary path parameters by the same finite-dimensional right inverses. There is no assertion of a bound uniform in the formal order.
  Integrate these symmetries in coordinates relative to the moving center. In the section the generating field is
  $ Y_(p_t) \( a \( t \) + z \) - a' \( t \) \, $
  which vanishes at $z = 0$. Its ordinary differential equation therefore closes at every finite Taylor order: the order-$N$ transported jet depends only on the order-$N$ generator jet and lower orders. Solving these compatible finite-dimensional equations produces a smooth formal coordinate change. For the strict contact lift, choose the center height $beta \( t \)$ by
  $ beta' \( t \) = p_t \( a \( t \) \) - theta_(a \( t \)) \( a' \( t \) \) . $
  The lifted generator relative to $\( a \( t \) \, beta \( t \) \)$ then also vanishes at its formal origin. The resulting formal changes are strict.
  They intertwine the augmented affine fields. Indeed differentiate the pullback of their frame jets, modulo the corresponding bundle. Moving-center differentiation is the formal derivative in the center velocity, by whole-axis holonomicity and the prescribed smooth height dependence. The relative generator subtracts that same velocity. The remaining term is its infinitesimal symmetry equation (5.3), and is zero in the bundle quotient. An internal change of frame is permitted. This verification is made at each finite order, where it is ordinary differentiation of a finite system. At the endpoint, the center height $beta$ introduces the reciprocal constants $e^(- h beta)$ and $e^(h beta)$ in the two affine fields. They do not change $frak(h)$. Strictness and transport of the center preserve both isotropy and the evaluation functional $xi$.
  An intrinsic construction at the centers is thus constant under these algebra identifications. Proposition 33 commutes with the identifications, so its entire formal field is transported and has smooth coefficients. To verify holonomicity, let $T_t$ denote its moving-center formal tensor, projected to the section. For a distribution the following identities are interpreted in a Grassmann chart. The transport identity gives
  $ partial_t T_t + cal(L)_(Y_(p_t) - a' \( t \)) T_t = 0 . $
  Homogeneous invariance gives $cal(L)_(Y_(p_t)) T_t = 0$; hence
  $ partial_t T_t = cal(L)_(a' \( t \)) T_t . $
  For the constant displacement vector $a' \( t \)$ this is exactly the coefficientwise Taylor coherence identity. The argument for lifted tensors includes the center height velocity in the same way.
  For a finite intrinsic list, use the smooth family of paths to trivialize the structures over a whole axis patch. A continuous selection into that finite list is locally constant in this trivialization, and the preceding argument applies. This patch formulation also proves the assertion along paths that need not themselves consist of regular points. The whole-axis extensions of Lemma 30 permit these patches everywhere on the axis; uniqueness and regular density make their jets agree on overlaps. Naturality proves equivariance under the return map and under regular flow shifts. The prescribed height dependence, strong-axis coherence, and flow Fubini then give the weak-axis extension and its almost-everywhere agreement. ◻
]

== 6 The algebraic consequence of the entropy trace identity <alg:section>

We work over $bb(C)$, by complexifying the real formal symmetry algebra. Real structures will be retained throughout and recovered at the end. The notation and sign convention are those of Section 5. In particular, set

$ E = frak(h) \/ frak(k) \, #h(2em) omega \( p + frak(k) \, q + frak(k) \) = xi \( \[ p \, q \] \) . $

An overall change of sign in this identification has no effect below. We use the following conclusions of Propositions 28 and 32 and Lemma 29:

+ $frak(h)$ is a linearly compact Lie algebra with continuous bracket, and $frak(k)$ is an open subalgebra containing no nonzero ideal of $frak(h)$.
+ The continuous functional $xi$ has coadjoint stabilizer $frak(k)$, and the displayed form on the finite-dimensional space $E$ is symplectic.
+ $H in frak(k)$ acts by a real, degreewise semisimple formal grading. Its adjoint powers preserve the ambient finite-jet kernels. Closed invariant spaces admit continuous pure-weight projections, and zero-weight vectors in finite-dimensional continuous invariant quotients admit zero-weight lifts.
+ $frak(h)_0 subset frak(k)$, and $E$ has no zero $H$-weight. For a fixed nonzero real constant $c$,
  #[#set math.equation(numbering: n => "(6.1)")
   $ c thin xi \( p \) = "tr" #scale(x: 120%, y: 120%)[\(] p \| E_(+) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p in frak(h)_0 . $ <alg:entropy-trace>]
  Here the action on $E$ is the bracket isotropy action, and $+$ denotes positive $"ad" H$-weights.

The grading on $E$ has signs opposite to the eigenvalues of the projected dilation $D$. Thus its positive part corresponds to the actual stable space. We use algebraic signs in the calculations and return to the actual stable and unstable notation when constructing fields.

We seek invariant formal directions of each dynamical sign. The construction has two algebraic steps. First we find an intrinsic coisotropic subspace of $E$; its symplectic orthogonal will provide the characteristic directions in the infinite-dimensional case. Then the trace identity forces the sign subspaces to belong to finite intrinsic lists. That finiteness will let us transport the choices smoothly along actual axes, while their ambient extensions remain formal.

=== 6.1 The intrinsic coisotropic reduction <the-intrinsic-coisotropic-reduction>

For $p in frak(h)$, consider the family of operators ${ \( "ad" p \)^n : n gt.eq 0 }$. Equicontinuity in the formal linear topology means that, for each prescribed output jet order, there is an input vanishing order that makes every operator in this family have zero output jet. The input order may depend on the output order and on $p$, but not on $n$. Define the set

#[#set math.equation(numbering: n => "(6.2)")
 $ frak(l) = { p in frak(h) : { \( "ad" p \)^n : n gt.eq 0 } upright(" is equicontinuous") } . $ <alg:equicontinuity>]

In finite dimension this is all of $frak(h)$, because the topology is discrete. In general, even its subalgebra property needs proof.

#thm([Proposition 6.1.])[
  (Intrinsic coisotropic reduction).  #emph[The set $frak(l)$ is an open intrinsic subalgebra containing $frak(k)$ and $H$, and has arbitrarily small open ideals for its induced topology. The subspace $L = frak(l) \/ frak(k)$ of $E$ is coisotropic, meaning $L^omega subset L$. If $frak(h)$ is infinite dimensional, then $frak(l) eq.not frak(h)$.]
] <alg:coisotropic>

We will identify $frak(l)$ as an origin stabilizer in the classical realizations of the minimal ideals of $frak(h)$. The trace identity will then show that $frak(k)$ fixes those origins and prove coisotropy. We begin by finding the ideals on which to make this test.

#thm([Lemma 6.2.])[
  #emph[The algebra $frak(h)$ has no nonzero closed abelian ideal. Every nonzero closed ideal contains a minimal nonzero closed ideal. There are finitely many such minimal ideals, each is topologically perfect, and their common centralizer in $frak(h)$ is zero.]
] <alg:minimal-ideals>

#proof[
  Let $A$ be a closed abelian ideal. For $p in A ∩ frak(h)_0$ we have $p in frak(k)$ and $\( "ad" p \)^2 = 0$ on $frak(h)$. Consequently its induced trace on $E_(+)$ vanishes, and (6.1) gives $xi \( p \) = 0$. The functional $xi$ kills every nonzero weight because $H$ stabilizes it. Weight projection therefore gives $xi \( A \) = 0$. Since $\[ frak(h) \, A \] subset A$, every element of $A$ stabilizes $xi$; hence $A subset frak(k)$, which forces $A = 0$.
  Consider a decreasing chain of nonzero closed ideals contained in a given nonzero closed ideal. Their images in $E$ are nonzero: an ideal with zero image would be contained in $frak(k)$. These images are nested finite-dimensional spaces. Choose a member whose image has minimal dimension, and a nonzero vector in that image. On the cofinal subchain below this member, the fibers over this vector form a nested family of nonempty closed affine subspaces of a linearly compact space. Their intersection is nonempty. The intersection of the chain is consequently a nonzero closed ideal. The usual minimal-element argument now gives a minimal nonzero closed ideal.
  For a minimal ideal $I$, the closure of $\[ I \, I \]$ is a closed ideal of $frak(h)$. It is nonzero by the first paragraph, so it equals $I$. Also $xi \( I \) eq.not 0$: otherwise the ideal property would put $I$ in $frak(k)$. By continuity and topological perfection, there exist $a \, b in I$ such that $xi \( \[ a \, b \] \) eq.not 0$. Their values in $E$ span a symplectic two-plane.
  Distinct minimal ideals commute. Indeed their bracket is contained in their intersection, and a nonzero intersection would make them equal. The two-planes just constructed for distinct ideals are thus mutually symplectically orthogonal. There are at most $dim \( E \) \/ 2$ of them. Finally, the common centralizer is a closed ideal. If nonzero, it contains a minimal ideal; this ideal would commute with itself, contradicting the first paragraph. ◻
]

We recall precisely the classical structure results used here. Over $bb(C)$, the Cartan–Guillemin theorem identifies a nonabelian minimal closed ideal of a transitive linearly compact Lie algebra with

#[#set math.equation(numbering: n => "(6.3)")
 $ I = S hat(⊗) cal(O)_e \, #h(2em) cal(O)_e = bb(C) \[ \[ z_1 \, dots.h \, z_e \] \] \, $ <alg:current-ideal>]

where $S$ is a nonabelian simple linearly compact Lie algebra and $e$ is finite. This is a topological Lie algebra identification, with pointwise current bracket. In the coinduced formulation, a maximal proper closed ideal of $I$ has an open normalizer $N$ in $frak(h)$; the simple quotient is $S$, and $I tilde.eq "Hom"_(U \( N \)) \( U \( frak(h) \) \, S \)$. The finite complement to $N$ and the PBW coalgebra identification give (6.3). See #cite(label("FattoriKac2002"), form: "prose") Proposition 2.6, Theorem 2.7 and Corollary 2.8 and #cite(label("BakalovDAndreaKac2001"), form: "prose") Proposition 6.11.

The infinite-dimensional possibilities for $S$ are the formal Cartan algebras: all vector fields $W$, divergence-free vector fields, Hamiltonian vector fields, and contact vector fields. The finite-dimensional simple algebras are also allowed. For the infinite simple factors, continuous derivations are represented faithfully by their normalizing formal vector fields. For the divergence-free and Hamiltonian cases these normalizers allow a constant conformal multiplier; the normalizers of $W$ and of the contact algebra are those algebras themselves. These are the classification and derivation results in #cite(label("BakalovDAndreaKac2001"), form: "prose") Theorem 6.8 and Proposition 6.12(i). For a finite-dimensional simple factor, derivations are inner and are treated as finite matrices. The topological Lie algebra statements use formal linear topologies with discrete scalar field, not analytic convergence topologies.

For later order tests, give ordinary coordinates weight one in the $W$, divergence-free and Hamiltonian realizations. Vector-field grade is coefficient degree minus one; for a Hamiltonian it is Hamiltonian degree minus two, modulo constants. In contact coordinates the horizontal coordinates have weight one and the Reeb coordinate has weight two; contact-Hamiltonian grade is weighted degree minus two. Write $S_(gt.eq j)$ for series with all grades at least $j$, and $S_(\( 0 \))$ for the subalgebra fixing the origin. In these realizations, $S_(\( 0 \)) = S_(gt.eq 0)$. The lowest grades are $- 1$, except in the contact case, where they are $- 2$ and $- 1$.

#thm([Lemma 6.3.])[
  #emph[For an ideal (6.3), every continuous derivation has a unique decomposition into a formal parameter vector field and an $cal(O)_e$-family of continuous derivations of $S$: 
#[#set math.equation(numbering: n => "(6.4)")
 $ "Der" \( I \) = W_e ⊗ 1 + cal(O)_e hat(⊗) "Der" \( S \) . $ <alg:current-derivations>]

 The action of $frak(h)$ on its finitely many minimal ideals gives a faithful topological embedding with closed image in the product of these derivation algebras.]
] <alg:derivation-realization>

#proof[
  The continuous centroid of a simple factor $S$ is scalar. One may use the linearly compact Schur lemma, as in #cite(label("FattoriKac2002"), form: "prose") Lemma 2.2. In the listed realizations it also follows by commuting a centroid map with the grading in the $W$ and contact cases, or with the degree-zero $frak(s l)$ or $frak(s p)$ action in the other cases. A grading eigenspace in the former cases, and a finite-multiplicity isotypic component in the latter, is a nonzero finite-dimensional centroid-invariant space. Such components exist because the homogeneous divergence-free polynomial fields and homogeneous Hamiltonians form irreducible modules with distinct highest weights as their degrees vary. An eigenvalue on this finite-dimensional space gives a nonzero kernel for the centroid map minus that scalar. This kernel is an ideal, so simplicity makes the map scalar.
  A continuous centroid map of $I$, restricted to constant $S$-series and tested coefficientwise against brackets with constants, is multiplication by a scalar series $a \( z \)$. To see that this determines the map everywhere, subtract this multiplication map. For each monomial $z^nu$ its value on $z^nu S$ is zero: write elements of $S$ as limits of finite sums of brackets and use $z^nu \[ a \, b \] = \[ z^nu a \, b \]$, placing the centroid map on the constant entry. Polynomial series are dense, so continuity finishes the argument. Thus the centroid is exactly $cal(O)_e$.
  A derivation acts on this centroid by commutator and hence induces a continuous derivation of $cal(O)_e$, namely a formal parameter vector field. For continuity, evaluate the commutator on a fixed nonzero constant $s in S$ and apply a continuous linear functional on $S$ taking value one on $s$. Continuity on $I$ then gives continuity of the induced scalar-series operator. After subtracting the parameter field, the remaining derivation is $cal(O)_e$-linear. Restriction to constant $S$-series, coefficient by coefficient, gives derivations of $S$. Density again gives the decomposition and its uniqueness. This proves (6.4); it is also the continuous-derivation formula of #cite(label("BakalovDAndreaKac2001"), form: "prose") Proposition 6.12(ii).
  The kernel of the action on all minimal ideals is their common centralizer, which is zero by Lemma 36. The displayed derivation spaces are linearly compact in their formal coefficient topology: factor normalizers are closed spaces of formal vector fields, finite simple factors give finite matrix spaces, and completed coefficient products preserve linear compactness. Continuity in the asserted jet topologies follows from continuity of bracketing. More explicitly, the normalizer realization embeds continuously into the product of its bracket evaluations on factor elements. It is injective and has continuous inverse on its image: a continuous injective map from a linearly compact space to a Hausdorff linearly topologized space has closed image and induces its original topology. Apply this fact first to the normalizer and then to the faithful map from $frak(h)$. ◻
]

===== 6.1.1 Detecting translations. <detecting-translations.>

In the faithful realization just obtained, fields fixing the origins preserve high-order jet kernels. We next show that a translation has the opposite behavior, so that the origin stabilizers can be identified with $frak(l)$.

#thm([Lemma 6.4.])[
  #emph[Let $A$ be a normalizing formal vector field of an infinite simple Cartan algebra, and suppose that it does not fix the origin. Its lowest nonzero grade is $- b < 0$. The grade $- b$ part of $"ad" A$ maps each homogeneous component of grade $j + b$ onto the component of grade $j$. Consequently the family ${ \( "ad" A \)^n : n gt.eq 0 }$ is not equicontinuous for the formal linear topology.]
] <alg:translation-test>

#proof[
  For $W$ this is surjectivity of differentiation in a nonzero constant direction on homogeneous vector-field coefficients. For divergence-free fields, integrate the coefficients in that direction. The divergence of the resulting primitive is independent of this coordinate. Integrating that error in another coordinate and subtracting the resulting component corrects the divergence without changing the first directional derivative. The correction is homogeneous. In the Hamiltonian case, integrate homogeneous Hamiltonians, modulo constants.
  For contact fields, a grade $- 2$ Hamiltonian acts by Reeb differentiation. A nonzero grade $- 1$ Hamiltonian acts by a constant horizontal derivative plus a linear multiple of Reeb differentiation. Its Reeb derivative is zero, so the contact bracket on Hamiltonians has no additional multiplier term. A homogeneous quadratic change of the Reeb coordinate straightens this directional operator. Integration in the resulting coordinate preserves the indicated weighted degrees and proves surjectivity.
  Fix a grade $j$ with a nonzero homogeneous element. Repeatedly choose homogeneous primitives to obtain elements of grade $j + n b$ whose $n$th image under the leading operation is that fixed element. In $\( "ad" A \)^n$, only the product of the lowest-grade operations can reach grade $j$ from grade $j + n b$; all other products have larger grade. The inputs tend to zero in the formal topology, while these outputs do not. This contradicts equicontinuity. ◻
]

For each infinite-dimensional minimal ideal $I_i$, let $frak(l)_i$ be the inverse image in $frak(h)$ of the stabilizer of the parameter origin and, when its simple factor is Cartan, the factor origin at zero parameters. Finite-dimensional minimal ideals impose no condition. These are subalgebras defined by finitely many coefficient conditions. Their intersection gives the following concrete description of the intrinsic set just defined.

#thm([Lemma 6.5.])[
  (Origin stabilizers).  #emph[The set $frak(l)$ is the intersection of the subalgebras $frak(l)_i$. In particular it is open and intrinsic, contains $H$, and has arbitrarily small open ideals for its induced topology.]
] <alg:intrinsic-l>

#proof[
  There are finitely many origin conditions, each involving finitely many coefficients, so their intersection is open. In the faithful realization of Lemma 37, an element of this intersection acts by vector fields fixing the joint origin. Its brackets preserve arbitrarily high total-order jet kernels. In joint parameter and factor coordinates, this is ordinary coefficient order: differentiation loses one order and multiplication by an origin-vanishing coefficient restores it. In the case of a finite simple factor with parameters, the same assertion holds for a parameter field fixing zero and a matrix-valued series. On each finite-dimensional ideal the discrete topology imposes no additional restriction. The faithful topological embedding proves equicontinuity on $frak(h)$.
  Conversely, suppose the parameter field of $p$ has a nonzero value at zero. Choose $z_1$ with $p \( z_1 \) \( 0 \) eq.not 0$ and a fixed nonzero $s in S$. Applied $n$ times to $z_1^n s$, only repeated use of the constant parameter derivative can produce parameter order zero in $n$ steps. Its value there is $n ! thin p \( z_1 \) \( 0 \)^n s eq.not 0$. Thus the adjoint powers fail equicontinuity already on that ideal. If the parameter origin is fixed but the factor origin is not, reduce modulo the parameter ideal and apply Lemma 38. Equicontinuity would restrict to the closed invariant ideal $I$ and descend through the open quotient map $I arrow.r I \/ \( z_1 \, dots.h \, z_e \) I tilde.eq S$, since the parameter ideal is then invariant. The same failure holds on $frak(h)$ with its induced topology. This identifies the intersection with the set in (6.2); its intrinsic character follows from that definition.
  The actual formal grading of $H$ preserves finite-jet kernels, so $H in frak(l)$. Finally, inside $frak(l)$ impose vanishing of all sufficiently low jets in its infinite-ideal realizations and zero action on its finite-dimensional ideals. These are open ideals of $frak(l)$: bracketing with an origin-preserving field preserves the prescribed order. They form a neighborhood basis of zero by the topological embedding. ◻
]

#proof[
  Lemma 39 proves the topological assertions. Only the infinite case needs a further argument. Fix an infinite minimal ideal $I = S hat(⊗) cal(O)_e$, and let $frak(m) = \( z_1 \, dots.h \, z_e \)$. The space $frak(m) I$ is $H$-invariant because $H$ fixes the parameter origin. If $p in frak(m) I$ has weight zero, it belongs to $frak(k)$. Its first bracket with $frak(h)$ lies in $I$; each further bracket with $p$ raises parameter order. Since $frak(k)$ is open, this induced action is nilpotent on $E$. Equation (6.1) kills $xi \( p \)$. Weight projection and the vanishing of $xi$ on nonzero weights give
  #[#set math.equation(numbering: n => "(6.5)")
   $ xi \( frak(m) I \) = 0 . $ <alg:parameter-annihilation>]
  The resulting functional on constant $S$-series is nonzero.
  For $q in frak(k)$, test $xi \( \[ q \, frak(m) I \] \) = 0$ on $z_a s$, choosing $s$ with $xi \( s \) eq.not 0$. At parameter order zero this bracket is $q \( z_a \) \( 0 \) s$. Thus the parameter field of $q$ fixes zero. If $S$ is Cartan, let $j$ be the highest standard grade on which the functional on $S$ is nonzero; it exists by continuity. If the factor field of $q$ does not fix the origin, let its leading grade be $- b$. Test on grade $j + b$. By Lemma 38 the leading term can have any prescribed grade-$j$ value, whereas all higher terms have grades annihilated by $xi$. This contradicts $q in frak(k)$. Therefore $frak(k) subset frak(l)_i$ for every $i$.
  In the contact case $j = - 2$ is impossible. Indeed the functional would then vanish on $frak(m) I + S_(\( 0 \))$ and descend nontrivially to $I \/ \( I ∩ frak(l) \)$. This quotient is exactly $S \/ S_(\( 0 \))$: the ideal acts trivially on all the other minimal ideals, and its factor action is inner. It is an $H$-invariant subspace of $frak(h) \/ frak(l)$. The descended functional is $H$-invariant because $xi \( \[ H \, I \] \) = 0$, forcing a zero weight in this quotient of $E$. But $E$ has no zero weight. Thus $j gt.eq - 1$. In contact coordinates this also says that a functional supported only on the Reeb value cannot occur.
  For this ideal define the closed linear subspace
  $ J_i = frak(m) I + S_(gt.eq j + 1) \, $
  omitting the second term when $S$ is finite dimensional. It lies in $frak(l)_i$, since its possible Cartan term has nonnegative grade, and in all the other origin stabilizers by commutation of distinct ideals. Hence $J_i subset frak(l)$.
  We claim that the annihilator in $E$ of the image of $J_i$ is $frak(l)_i \/ frak(k)$. If $q in frak(l)_i$, order preservation at the origins and (6.5) give $xi \( \[ q \, J_i \] \) = 0$. Conversely, this vanishing tested on $z_a s$ detects every parameter translation. Once those vanish, the grade-$j + b$ test from the preceding paragraph detects any factor translation. This proves the claim. Taking symplectic annihilators and using finite dimensionality of $E$ gives
  $ L^omega = (⋂_i frak(l)_i \/ frak(k))^omega = sum_i \( frak(l)_i \/ frak(k) \)^omega = sum_i "image" \( J_i \) subset L . $
  A Cartan factor makes $frak(l)$ proper because its inner factor translations survive modulo $frak(l)$. If there are only finite simple factors but a nontrivial parameter ring, equality $frak(l) = frak(h)$ would make $frak(m) I$ a nonzero closed ideal of $frak(h)$ killed by $xi$. It would be contained in $frak(k)$, a contradiction. Without a Cartan factor or parameters, the faithful derivation realization is finite dimensional. Thus $frak(l) eq.not frak(h)$ whenever $frak(h)$ is infinite dimensional. ◻
]

The characteristic space of $L$ is its symplectic orthogonal. To use it in the trace argument, we need a representation on that space extending the isotropy action. Set

#[#set math.equation(numbering: n => "(6.6)")
 $ B = frak(h) \/ frak(l) \, #h(2em) P = L^omega \, #h(2em) frak(u) = "stab"_(frak(l)) \( xi \|_(frak(l)) \) . $ <alg:base-characteristic>]

#thm([Lemma 6.6.])[
  (The characteristic representation).  #emph[We have $frak(u) \/ frak(k) = P$, and symplectic pairing identifies $P$ with $B^(*)$ as a $frak(k)$-module. Transferring the dual bracket representation on $B^(*)$ gives a representation of all of $frak(l)$ on $P$ extending this $frak(k)$ action.]
] <alg:characteristic-representation>

#proof[
  The kernel of the restricted alternating form on $L$ is $frak(u) \/ frak(k)$, so it is $P$. The map
  $ P arrow.r B^(*) \, #h(2em) v mapsto #scale(x: 120%, y: 120%)[\(] q + frak(l) mapsto omega \( v \, q + frak(k) \) #scale(x: 120%, y: 120%)[\)] $
  is well-defined and an isomorphism by nondegeneracy. The $frak(k)$ action is symplectic, since its elements stabilize $xi$, so this map intertwines its action with the dual of the bracket action on $B$. The latter is an actual representation of all of $frak(l)$, because $frak(l)$ is a subalgebra. Transferring that representation gives the asserted action on $P$. It is not necessary, and generally would not be correct, to define the action of $frak(u)$ on $frak(u) \/ frak(k)$ by brackets. ◻
]

=== 6.2 Trace positivity and full isotypic sign spaces <trace-positivity-and-full-isotypic-sign-spaces>

The remaining algebraic task is to find invariant sign subspaces that belong to a finite intrinsic list. In the infinite case we choose an invariant submodule of the transferred dual representation. The proposition below says why its sign parts are sums of whole isotypic components; these sums form the required finite list.

#thm([Proposition 6.7.])[
  (Pure signs in full isotypic components).  #emph[If $B eq.not 0$, let 
#[#set math.equation(numbering: n => "(6.7)")
 $ P' = "soc"_(frak(l)) \( B^(*) \) subset P $ <alg:socle>]

 under the transferred representation of Lemma 40; the socle is the sum of all irreducible submodules. It is nonzero. Its two $H$-sign parts are sums of full $frak(u)$-isotypic components, and in particular are invariant under the full transferred $frak(u)$ action.]
  #emph[If $frak(h)$ is finite dimensional and $frak(l) = frak(h)$, then $E$ is a semisimple $frak(k)$-module whose $H$-sign parts are sums of full isotypic components. In either case there are only finitely many possible sums of isotypic components in the module under consideration.]
] <alg:signs>

We prove the proposition by putting the trace identity into a finite quotient. That quotient is auxiliary: $frak(l)$, its representation on $B^(*)$, and the socle in the statement are already intrinsically defined. The reduction isolates the part of $H$ whose trace must vanish; positivity will then rule out constituents containing both signs.

==== 6.2.1 A finite quotient and its reductive stabilizer <a-finite-quotient-and-its-reductive-stabilizer>

We use finite-dimensional Lie theory only for the quotients and modules specified below; the triangularization and complete-reducibility inputs are stated in #cite(label("Milne2013"), form: "prose") Theorems I.3.7 and I.5.20(b).

#thm([Lemma 6.8.])[
  #emph[Let $g$ be a finite-dimensional complex Lie algebra with solvable radical $r$. On every irreducible finite-dimensional $g$-module, $r$ acts by scalars and $\[ g \, r \]$ acts trivially. On every finite-dimensional $g$-module each element of $\[ g \, r \]$ acts nilpotently.]
] <alg:radical-action>

#proof[
  Triangularize the action of $r$ by Lie’s theorem. Its finite set of diagonal characters is preserved by conjugation by $exp \( t rho \( x \) \)$, for $x in g$, since $r$ is an ideal. Dependence on $t$ is continuous, so every character is fixed; differentiating yields $chi \( \[ x \, r \] \) = 0$ for each such character. Choose a nonzero common eigenspace for $r$, with character $chi$. For a vector $v$ in this eigenspace, $y in r$ and $x in g$,
  $ rho \( y \) rho \( x \) v = rho \( x \) rho \( y \) v + rho \( \[ y \, x \] \) v = chi \( y \) rho \( x \) v . $
  Thus this eigenspace is $g$-invariant. In an irreducible module it is the whole module, proving the scalar assertion. A composition series of a general module then makes $\[ g \, r \]$ act strictly triangularly, proving nilpotence. ◻
]

By Lemma 39, choose an open ideal $N$ of $frak(l)$ small enough that the quotient

$ g = frak(l) \/ N $

carries both $xi \|_(frak(l))$ and the representation on $B$. The latter representation is continuous: choose finitely many lifts of a basis of $B$ and use continuity of their brackets followed by projection to $B$. Thus the intersection of its kernel with $ker \( xi \|_(frak(l)) \)$ contains a sufficiently small open ideal. In the finite case one may take $N = 0$. The ideal $N$ is contained in $frak(u)$, since it is an ideal annihilated by $xi$. Every quotient in use is $H$-invariant, and its $H$-action is semisimple with real weights.

#thm([Lemma 6.9.])[
  #emph[For $p in frak(l)_0$, identity (6.1) becomes 
#[#set math.equation(numbering: n => "(6.8)")
 $ c thin xi \( p \) =  & "tr" #scale(x: 120%, y: 120%)[\(] p \| \( frak(l) \/ frak(u) \)_(+) #scale(x: 120%, y: 120%)[\)] + "tr" #scale(x: 120%, y: 120%)[\(] p \| B_(+) #scale(x: 120%, y: 120%)[\)] - "tr" #scale(x: 120%, y: 120%)[\(] p \| B_(-) #scale(x: 120%, y: 120%)[\)] . $ <alg:three-traces>]

 The functional on $g$ annihilates $\[ g \, r_g \]$, where $r_g$ is the radical of $g$.]
] <alg:finite-trace>

#proof[
  Use the filtration $0 subset P subset L subset E$. Its quotients are $P tilde.eq B^(*)$, $L \/ P tilde.eq frak(l) \/ frak(u)$ and $E \/ L tilde.eq B$. A zero-weight $p$ lies in $frak(k)$, so acts on all three quotients and commutes with $H$. On the positive part of the dual module its trace is minus the trace on $B_(-)$. Additivity of trace proves (6.8).
  Lift a weight-zero element of $\[ g \, r_g \]$ to a weight-zero element $p in frak(l)$. Such a lift exists by the formal weight projection property. It lies in $frak(k) subset frak(u)$. Lemma 42 makes its actions on $B$ and on the adjoint representation of $g$ nilpotent. Its action on $frak(l) \/ frak(u)$ is defined, precisely because $p in frak(u)$, and inherits nilpotence from the latter adjoint action. All three traces in (6.8) vanish, so $xi \( p \) = 0$. Nonzero weights are already annihilated by $xi$. Weight decomposition in this finite quotient proves the claim on all of $\[ g \, r_g \]$. ◻
]

Set $g' = g \/ \[ g \, r_g \]$. It is reductive, because its radical is central. Denote the induced functional by $xi'$ and its stabilizer by $frak(u)'$. Since $\[ g \, r_g \]$ is an ideal annihilated by $xi$, its full inverse image in $frak(l)$ lies in $frak(u)$. Consequently $frak(u)$ is the full inverse image of $frak(u)'$ and

#[#set math.equation(numbering: n => "(6.9)")
 $ frak(l) \/ frak(u) tilde.eq g' \/ frak(u)' . $ <alg:reductive-tangent>]

#thm([Lemma 6.10.])[
  #emph[The algebra $frak(u)'$ is reductive. Its center on the semisimple summand of $g'$ is toral. The restriction to $frak(u)'$ of every irreducible $g'$-module is semisimple, and $g' \/ frak(u)'$ is a semisimple $frak(u)'$-module.]
] <alg:reductive-stabilizer>

#proof[
  Write $g' = z xor s$, with $s$ semisimple, and write $H_s$ for the semisimple-summand component of the image of $H$. Its adjoint is semisimple, so $H_s$ is a semisimple element of $s$. Let $A in s$ be the Killing-dual of $xi' \|_s$. Every element of $g'$ commuting with the image of $H$ has a zero-weight lift to $frak(l)$, hence a lift in $frak(k)$. It therefore stabilizes $xi'$. Also $H$ stabilizes $xi'$. These assertions give
  $ A in Z_s \( H_s \) \, #h(2em) \[ A \, Z_s \( H_s \) \] = 0 . $
  Thus $A$ lies in the center of the reductive centralizer of the semisimple element $H_s$. To recall the toral-center assertion, choose a Cartan subalgebra of $s$ containing $H_s$. Its root decomposition describes $Z_s \( H_s \)$ as that Cartan subalgebra plus the root spaces whose roots vanish on $H_s$. The resulting root subsystem gives its semisimple derived algebra, and its center is the subspace of the Cartan subalgebra annihilated by this subsystem. Every element of this center is therefore semisimple. In particular $A$ is semisimple. Applying the same centralizer description to $A$ shows that
  $ frak(u)' = z xor Z_s \( A \) $
  is reductive, with toral center on the $s$ summand. For these root-centralizer and weight facts, see #cite(label("KirillovPreliminary"), form: "prose") Theorems 6.30, 6.38 and 8.2.
  For an irreducible $g'$-module the global center $z$ acts by scalars. The derived algebra of $Z_s \( A \)$ is semisimple, so its action is completely reducible. The center of $Z_s \( A \)$ consists of commuting semisimple elements of $s$ and hence acts simultaneously diagonalizably in every finite-dimensional $s$-module. Splitting into its eigenspaces and then into irreducible derived-algebra modules proves complete reducibility over $frak(u)'$. The same argument applies to the adjoint module of $g'$ and its $frak(u)'$-invariant quotient $g' \/ frak(u)'$. ◻
]

==== 6.2.2 The positivity argument <the-positivity-argument>

#proof[
  The image of $H$ belongs to $frak(u)'$. Decompose it using the center and derived algebra of this reductive algebra:
  $ H = H_(upright(c)) + H_(upright("ss")) \, #h(2em) H_(upright(c)) in Z \( frak(u)' \) \, quad H_(upright("ss")) in \[ frak(u)' \, frak(u)' \] . $
  Lift $H_(upright("ss"))$ to a weight-zero element $p in frak(l)$; this is possible because $H_(upright("ss"))$ commutes with $H$. The functional $xi'$ annihilates $\[ frak(u)' \, frak(u)' \]$, since it is fixed by $frak(u)'$, so $xi \( p \) = 0$.
  Filter $B$ first by irreducible $g$-modules. By Lemma 42 each factor is a $g'$-module, and by Lemma 44 its restriction to $frak(u)'$ is semisimple. Use these irreducible $frak(u)'$ constituents for the trace computation on $B$; use the semisimple decomposition of $g' \/ frak(u)'$ for the other quotient in (6.8). The filtrations are $H$-invariant. Since $H$ is semisimple and $p$ has weight zero, passing to either sign subspace respects all these quotient trace computations.
  On one irreducible constituent, $H_(upright(c))$ acts by a scalar $a$, whereas $H_(upright("ss"))$ acts by an operator $T$ of trace zero. The scalar $a$ is real, as it equals the average of the real eigenvalues of $H$. The operator $T = H - a upright("id")$ is semisimple with real eigenvalues, say $t_1 \, dots.h \, t_d$, and $sum_i t_i = 0$. There are no zero $H$-weights on the modules in (6.8). If both signs occur, the set
  $ I_(+) = { i : a + t_i > 0 } $
  is a nonempty proper upper segment of the ordered $t_i$ spectrum. Every entry in this segment is strictly larger than every entry outside it. Since the total average is zero, its sum is strictly positive. If only one sign occurs, its sum is zero, with the empty sum included. Thus
  $ "tr" \( T \| V_(+) \) gt.eq 0 \, #h(2em) "tr" \( T \| V_(+) \) - "tr" \( T \| V_(-) \) = 2 "tr" \( T \| V_(+) \) gt.eq 0 \, $
  with strict inequality in each expression when $V$ has both signs.
  Evaluate (6.8) at the chosen lift of $H_(upright("ss"))$. Its left side is zero, and all the constituent contributions just described are nonnegative. None can be strictly positive. Every irreducible constituent in these computations is therefore pure sign. Moreover isomorphic $frak(u)'$ modules have the same spectrum for the fixed element $H$, so they have the same sign.
  The finite-dimensional nonzero module $B^(*)$ has an irreducible submodule, so its socle $P'$ is nonzero. It is a semisimple $g$-module. Its irreducible constituents are duals of irreducible quotients of $B$, hence occur among the duals of the factors just considered. Their restrictions to $frak(u)'$ are semisimple, with pure-sign irreducible constituents by the same result and with signs reversed under duality. Isomorphic constituents cannot be assigned opposite signs. Consequently each sign part of $P'$ is a sum of full $frak(u)$-isotypic components, for the transferred dual representation. This proves the assertion of full $frak(u)$ invariance.
  In the finite case $B = 0$, $frak(u) = frak(k)$, and (6.9) identifies $E$ with $g' \/ frak(u)'$. The same constituent argument gives its semisimple isotropy representation and pure-sign isotypic decomposition. Any finite-dimensional semisimple module has only finitely many distinct isotypic components and therefore finitely many sums of entire components. ◻
]

=== 6.3 Intrinsic fields, real structures, and axis coherence <intrinsic-fields-real-structures-and-axis-coherence>

The finite quotient used for the proof is auxiliary. The subalgebra $frak(l)$ is intrinsic by (6.2); $L \, P \, B \, frak(u)$ and the representation transferred to $P$ are intrinsic from their definitions. The socle in (6.7) is also intrinsic. In particular none of these objects depends on a choice of coordinates in the minimal ideals or on the finite quotient $g$.

#thm([Proposition 6.11.])[
  #emph[The planes and subalgebras above are measurable on a common conull set and commute with the dynamics and real conjugation. Their invariant homogeneous formal fields have full ambient jets smooth and holonomic along both entire typical strong axes, with the weak versions obtained by flow transport.]
  #emph[In the infinite case $P'$ is flip-invariant. Its actual stable and unstable parts 
$ P^s = P' ∩ E^s \, #h(2em) P^u = P' ∩ E^u $

 are both nonzero, have the same rank almost everywhere, and have the stated coherent formal extensions. They remain invariant under the full transferred $frak(u)$ action. In the finite case the formal sign fields have center values exactly $E^s$ and $E^u$. All these formal fields are invariant under the signed dilation.]
] <alg:axis-coherence>

#proof[
  We first explain measurability without choosing a measurable classification of minimal ideals. Replace the countably many completed-measurable background coefficients by Borel versions on a common conull Borel set, refined under the countable group generated by $f$ and flip. For this purpose, coefficient sequences are coded in the countable product of the usual standard Borel space $bb(C)$. This measurable structure is distinct from the formal linear topology with discrete scalars used in the algebraic arguments. The symmetry algebra is given by countably many linear jet equations. For the intrinsic condition (6.2), fix an output jet order. It asks for an input jet order such that every power of the adjoint annihilates the corresponding input kernel after output projection. For each power this is a finite-jet linear inclusion test; the full formal solution images are obtainable by the stabilized finite linear tests from Lemma 30. The quantifiers over orders and powers are countable. Thus membership in $frak(l)$ is a Borel relation between the base point and coefficient sequences. Its finite-dimensional projections are analytic, hence universally measurable #cite(label("Tserunyan2025")) Proposition 12.2 and Corollary 14.10. To recover the tangent plane measurably, for each $d$ code $d$ independent projected vectors. Their analytic relation has domain $A_d$, the set where the dimension is at least $d$, and admits a universally measurable tuple selection #cite(label("Moschovakis2009")) Section 4E.9. Restrict this already chosen tuple to $A_d \\ A_(d + 1)$ and take its span. This gives the Grassmannian-valued plane for the completed Liouville measure; the exact-dimension strata need not be analytic. Subsequent countable coefficient choices can again be replaced by Borel versions before further coding. No Borel selector, or common Borel refinement invariant under every real flow time, is required.
  Once the finite-dimensional plane $L$ is known, brackets and finite jet lifts determine the representation on $B$. The socle of its dual is specified by finite-dimensional invariant-subspace and rank conditions. Indeed invariance is a closed Grassmannian incidence condition for a finite basis of the represented matrix algebra; reducibility is a finite union of projections along compact nested Grassmannians. Thus irreducibility is Borel, and the preceding independent-tuple procedure selects the span of the irreducible submodules. These operations give measurable planes and, where needed, measurable choices of finite jets. The homogeneous formal extensions are computed to each requested order from finitely many such jet operations. All resulting constructions are natural for the dynamics. Their dimensions are therefore almost everywhere constant by ergodicity.
  Conjugation preserves the intrinsic definitions and the real $H$-sign spaces; hence the complex planes descend to real ones. Flip intertwines the two affine-form data, preserves the underlying symmetry structure up to the harmless sign of the contact form, and consequently preserves $P'$. It exchanges the actual stable and unstable parts. Since it preserves smooth volume and these two ranks are almost everywhere constant, the ranks are equal. Their sum is the positive rank of $P'$, so both are nonzero.
  For smoothness and coherence, use the formal identifications along whole axes supplied by Proposition 34. They carry $frak(h) \, frak(k) \, xi$, hence all the intrinsic objects just constructed, smoothly along the axis. The transported plane $P'$ is preserved by the projections to the two actual sign bundles at typical points. These projections are continuous and uniformly transverse. By density they preserve the smooth extension of $P'$ everywhere on the axis patch. Their restrictions are continuous idempotents, so their ranks are locally constant; their images give continuous sign subbundles.
  In this trivialization, Proposition 41 places each sign subspace, at typical points, in a fixed finite list of full isotypic sums. The finite list is closed, so the same holds at all points by density. A continuous choice in that list is locally constant. The same reasoning applies to the finite-case sign spaces in $E$. Proposition 34, including its version for local smooth families of paths, now gives smooth full formal jets and their holonomicity along the whole axes. The homogeneous extensions are invariant under $frak(h)$ by Proposition 33, and thus under $H$. Their center values are the prescribed actual sign planes. Finally, flow shifts intertwine all these intrinsic objects; the section fields and their horizontal lifts can be taken time-independent within a flow box. This supplies the weak-axis extensions with the required agreement at regular translates. ◻
]

#thm([Theorem 6.12.])[
  (Algebraic dichotomy).  #emph[At typical centers exactly one of the following alternatives holds, with the same alternative almost everywhere.]
  + #emph[The symmetry algebra is finite dimensional. There are $frak(h)$-invariant formal fields with center values $E^s$ and $E^u$, obtained from finite isotypic sign choices. Their full ambient jets are smooth and holonomic along both entire typical axes and equivariant under the dynamics.]
  + #emph[The symmetry algebra is infinite dimensional. The intrinsic proper open subalgebra $frak(l) supset frak(k)$ determines an involutive coisotropic formal distribution $L$, whose characteristic distribution is $P = L^omega$. It contains an intrinsic nonzero plane $P'$ with nonzero actual stable and unstable parts $P^s \, P^u$. These parts are invariant under the full $frak(u)$ action transferred from $B^(*)$, and all these formal fields have the same whole-axis coherence and equivariance.]
] <alg:dichotomy>

#proof[
  The algebraic assertions are Propositions 35 and 41; the real, measurable and coherent conclusions are Proposition 45. The subalgebra $frak(l)$ gives an involutive homogeneous formal distribution by Proposition 33. Coisotropy gives its characteristic distribution. Invariance and ergodicity make the alternative almost everywhere constant. ◻
]

We record the precise representation-theoretic input to the characteristic-leaf argument in the next section. First integrals of $L$ define a formal base with tangent space $B$. For $p in frak(l)$, the projected symmetry fixes the base origin; the negative of its linearization is the bracket action on $B$. The cotangent action, under Hamiltonian translation frames for the characteristic leaf, is exactly the transferred dual action on $P$. Elements of $frak(u)$ have values spanning $P$ and preserve that leaf. Proposition 41 therefore supplies invariant initial subspaces for this full cotangent action. This is the invariance needed to prove that $P^s$ and $P^u$ are parallel for the canonical characteristic affine connection. The construction of that connection, its restriction to actual plaques, and the realization of mixed rectangles are carried out below; no convergence of formal flows at nonzero parameters is asserted here.

== 7 Realization of characteristic rectangles <real:section>

We exclude the infinite-dimensional alternative of Theorem 46. The construction will use actual smooth structures on individual stable leaves and finite Taylor polynomials in the transverse parameters. No ambient smooth realization of the formal characteristic foliation is assumed.

We will obtain a complete proper path in one actual strong stable leaf and a nontrivial translate in another, with corresponding points on common strong unstable leaves. The endpoint geometry of negative curvature will rule out this configuration.

Here are the precise inputs from the preceding sections. There are intrinsic formal fields

$ L \, #h(2em) P = L^omega \, #h(2em) P^s = P' ∩ E^s \, #h(2em) P^u = P' ∩ E^u \, $

where $L$ is involutive and coisotropic, and $P^s \, P^u$ both have positive rank. At each regular center, their values lie in the indicated actual sign planes. Their full ambient jets are smooth and holonomic along both entire typical strong axes, and along the corresponding weak axes by flow transport. All finite collections of these jets and their plaque derivatives have measurable finite patch bounds. They are equivariant under $f = phi.alt_T$. These statements use Theorem 13, Lemmas 25 and 26, and the intrinsic extension in Proposition 45.

We also retain the algebraic notation

$ B = frak(h) \/ frak(l) \, #h(2em) frak(u) = "stab"_(frak(l)) \( xi \|_(frak(l)) \) . $

The characteristic value space $P = frak(u) \/ frak(k)$ is identified with $B^(*)$, with its transferred dual $frak(l)$-representation. The spaces $P^s \, P^u$ are invariant under the full $frak(u)$-action in this representation, by Proposition 41. The notation does not assert that $frak(u)$ acts on $frak(u) \/ frak(k)$ by brackets.

We work on $S tilde(M)$ when making global constructions, and use lifted geometric charts and lifted regular data. Norms on finite tensors are measured in uniformly bounded geometric charts. Write $d_s$ for intrinsic distance on a strong stable leaf. Fix positive constants $b_s \, b_u$ and $C$ such that, for $r gt.eq 0$,

#[#set math.equation(numbering: n => "(7.1)")
 $ parallel d f^r \|_(E^s) parallel lt.eq C e^(- b_s r) \, #h(2em) parallel d f^(- r) \|_(E^u) parallel lt.eq C e^(- b_u r) . $ <real:hyperbolicity>]

All subsequent refinements of the regular set are countable and retain conditional full measure on the entire axes in use.

=== 7.1 The characteristic connection and its stable restriction <the-characteristic-connection-and-its-stable-restriction>

#thm([Lemma 7.1.])[
  #emph[The formal characteristic leaves of $P$ carry a canonical flat torsion-free connection. Their horizontal lifts to $ker alpha$ are integrable. The lifted fields $P^s \, P^u$ are parallel along these leaves. The horizontal affine exponential 
$ cal(E)_a \( V \) \, #h(2em) V in P_a \, $

 including its height coordinate, is a formal map equivariant under $f$. Its finite jets have the whole-axis coherence and measurability properties stated above. Restricted to $P_a^s$, respectively $P_a^u$, its Taylor series lies in the actual central strong stable, respectively strong unstable, plaque germ.]
] <real:formal-affine>

#proof[
  On a transversal section, formal Frobenius supplies independent first integrals $z_1 \, dots.h \, z_d$ of $L$, where $d = dim P$. Since $L$ is coisotropic, the Hamiltonian fields $X_(z_i)$ lie in $L$ and span $P$. Furthermore,
  $ { z_i \, z_j } = d z_j \( X_(z_i) \) = 0 \, #h(2em) \[ X_(z_i) \, X_(z_j) \] = 0 . $
  Declare this frame parallel. A different system of first integrals has the form $hat(z) = h \( z \)$, with invertible differential, and
  $ X_(hat(z)_i) = sum_j frac(partial h_i, partial z_j) \( z \) X_(z_j) . $
  The change-of-frame matrix is constant on every characteristic leaf. Thus the connection is independent of the first integrals; its torsion and curvature vanish in the displayed commuting frame. Since $P$ is isotropic, the bracket of two horizontal lifts has no additional Reeb component: that component is the negative of their $d alpha$ pairing. Hence the horizontal lifts commute as well and give the asserted lifted affine structure.
  We verify the parallelism of the sign fields. A symmetry preserves the ring of first integrals of $L$, so it induces a formal field on their base. At the origin, the base tangent space is $B$. For $p in frak(l)$, the induced base field vanishes there, and the negative of its linearization is the bracket representation on $B$. The Hamiltonian translation frame identifies $P$ with the cotangent space of this base. Its linear transformation under that symmetry is consequently the transferred dual representation on $B^(*)$.
  Every projected symmetry preserves both $omega$ and $L$, and hence preserves $P = L^omega$. If $p in frak(u)$, its projected value belongs to $P$. In formal Frobenius coordinates for $P$, its flow fixes the characteristic leaf through the origin: its transverse component depends only on transverse coordinates and vanishes at their origin. On this leaf its action on the parallel frame is the fixed cotangent derivative at the base origin. This action preserves both $P_a^s$ and $P_a^u$, since these are full $frak(u)$-invariant submodules. The values of $frak(u) \/ frak(k)$ span $P_a$. Its formal flows are thus transitive along the characteristic leaf, and the homogeneous sign fields are constant in the parallel frame. A strict lift may also translate height; the horizontal structure and its parallel frame are independent of that constant height translation. This proves parallelism for the horizontal lifts.
  The connection and its exponential are natural under the maps preserving the data, hence under $f$. They are computed to any given order by finite formal operations: solve the formal Frobenius equations and then the affine geodesic and horizontal-lift equations in an additional time parameter. Coherence and measurable finite bounds are preserved by these operations on a fixed nonsingular coordinate patch.
  Finally use the signed coordinates of Lemma 27 and the dilation of Proposition 28. In these coordinates the actual central unstable and stable plaque Taylor series are the positive and negative axes. The formal affine exponential is dilation-equivariant. A Taylor monomial in only positive-weight initial coordinates cannot have a negative-weight output component, and conversely for negative initial coordinates. Its pure-sign restriction therefore has no component toward the opposite axis. Horizontality fixes its height to that of the actual strong plaque. This is an identity of Taylor series and makes no assertion about their convergence. ◻
]

#thm([Lemma 7.2.])[
  #emph[On an entire typical strong stable leaf, $P^s$ is a genuine smooth involutive subbundle, with a genuine flat torsion-free connection on its integral slices. The bundle $P^u$ has a smooth flat partial connection along those slices, induced by the characteristic connection. Locally one can choose smooth frames of $P^u$ that are parallel on every $P^s$ slice and depend smoothly on the transverse slice label. The analogous assertions hold with the signs exchanged. All these actual structures are equivariant on transported axis patches.]
] <real:stable-restriction>

#proof[
  The extended values of $P^s$ belong to the actual stable tangent space everywhere on the axis, by agreement on a dense set and continuity. Derivatives in $P^s$ directions are actual derivatives within this smooth axis. Holonomicity identifies them with the corresponding formal derivatives. Thus the formal Frobenius identity becomes the actual involutivity identity there. The same reasoning applies to torsion, curvature, and preservation of the two sign bundles: all their derivatives, when restricted as asserted, are stable-tangential derivatives. Frobenius now gives actual smooth integral slices, and the restricted connection is flat and torsion-free. On small simply connected slices, parallel transport defines parallel frames. In smooth slice coordinates, its ordinary differential equations have coefficients depending smoothly on the transverse label, which gives the stated smooth choice of frames. The identities extend over nonregular points of the axis through the smooth extensions. Equivariance likewise extends by dense agreement. ◻
]

We can already construct one side of the configuration needed for the contradiction: a complete proper affine ray inside an actual strong stable leaf. The translated stable path will require a different argument, because an unstable displacement away from that leaf is still specified only by formal coefficients.

=== 7.2 Complete proper affine rays <complete-proper-affine-rays>

We write $"Exp"_a^s$ for the actual affine exponential of the connection on the $P^s$ slice through $a$ supplied by Lemma 48. This is different from the background Riemannian exponential used for displacement charts.

#thm([Lemma 7.3.])[
  #emph[There is a positive-measure set $K$ of regular centers and constants $eta_0 \, c_1 \, c_2 > 0$ such that, for $a in K$ and $x in P_a^s$ with $\| x \| lt.eq eta_0$, the affine geodesic with initial velocity $x$ exists through time $1$, stays in a fixed geometric stable plaque, and satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ c_1 \| x \| lt.eq d_s \( a \, "Exp"_a^s x \) lt.eq c_2 \| x \| . $ <real:local-comparison>]

]
] <real:local-stable-exponential>

#proof[
  In bounded coordinates $z$ on a stable plaque, the affine geodesic equation on $P^s$ has the form
  $ dot(z) = v \, #h(2em) dot(v) = A \( z \) \( v \, v \) \, #h(2em) v in P_z^s . $
  The acceleration coefficients are finite-order operations on the formal connection coefficients and become smooth actual coefficients on the stable plaque by coherence. The geodesic spray is tangent to this velocity subbundle, since the connection preserves $P^s$. One can extend the coefficients smoothly to all stable velocities by a smooth projection to $P^s$ when applying the ordinary existence theorem.
  Their suprema on fixed compactly contained stable plaques are measurable and finite at almost every center. Restrict to a positive-measure set on which they have a common bound $C_A$. The geometric plaque charts and their metric comparisons already have uniform bounds. If $\| v \( 0 \) \|$ is sufficiently small, the inequality $\| dot(v) \| lt.eq C_A \| v \|^2$ gives
  $ \| v \( t \) \| lt.eq 2 \| v \( 0 \) \| \, #h(2em) 0 lt.eq t lt.eq 1 . $
  Thus the solution remains in the interior of the chosen plaque and its velocity remains in a compact coordinate neighborhood; ordinary continuation gives existence through time $1$. Integration gives
  $ z \( 1 \) - z \( 0 \) = v \( 0 \) + O \( \| v \( 0 \) \|^2 \) $
  with a uniform constant. Shrink the input radius so that the coordinate displacement is bounded below by $\| v \( 0 \) \| \/ 2$. Ambient distance in the bounded geometric chart provides the corresponding lower bound for intrinsic stable distance. The length estimate gives the upper bound. Uniform norm comparisons give the constants in (7.2). ◻
]

#thm([Lemma 7.4.])[
  #emph[If an increasing sequence of positive integers $\( n_i \)$ has a positive asymptotic frequency, then 
$ n_i - n_(i - 1) = o \( n_i \) . $

 In particular this holds for the successive visits of almost every point to the set $K$ of Lemma 49.]
] <real:returns>

#proof[
  If the frequency is $p > 0$, then $i \/ n_i arrow.r p$. Consequently $n_(i - 1) \/ n_i arrow.r 1$, which is the assertion. The last statement is the ergodic theorem for the indicator of $K$. ◻
]

#thm([Proposition 7.5.])[
  #emph[At a typical center $a$, the affine exponential 
$ "Exp"_a^s : P_a^s arrow.r W^s \( a \) $

 is defined for every initial vector. It is smooth, and it leaves every compact subset of the intrinsic stable leaf as $\| x \| arrow.r oo$. In particular a nonzero initial vector determines a complete proper forward affine ray in that stable leaf.]
] <real:proper-exponential>

#proof[
  Choose $a$ whose forward visits to $K$ have positive frequency. For any initial vector $x in P_a^s$, contraction in (7.1) makes $\| d f^n x \| lt.eq eta_0$ at all sufficiently large good visits. Solve the local affine geodesic there through time $1$ and pull it back by $f^(- n)$. Equivariance of the actual restricted connection makes the resulting path an affine geodesic with initial velocity $x$ at $a$. Uniqueness of the ordinary geodesic equation makes the construction independent of the chosen sufficiently large visit. Applying it to $t x$ for arbitrary finite $t$ proves completeness. On a neighborhood of any fixed input, one sufficiently large good visit works for all inputs in that neighborhood, so the resulting exponential is smooth.
  For properness, let $\| x \| arrow.r oo$ and let $n = n_i$ be the first good visit with $\| d f^n x \| lt.eq eta_0$. Then $n arrow.r oo$: the inverse norms of the finitely many earlier linear maps are bounded. For large $x$ there is a previous good visit $n_(i - 1)$, and minimality gives $\| d f^(n_(i - 1)) x \| > eta_0$. The global one-step inverse derivative bound and Lemma 50 give
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| d f^n x \| gt.eq C^(- 1) eta_0 e^(- K \( n_i - n_(i - 1) \)) = e^(- o \( n \)) . $ <real:subexponential-crossing>]
  The constants in this inequality do not depend on the varying initial vector. By equivariance and (7.2),
  $ d_s #scale(x: 120%, y: 120%)[\(] f^n a \, f^n "Exp"_a^s x #scale(x: 120%, y: 120%)[\)] gt.eq c_1 \| d f^n x \| . $
  If the endpoints $"Exp"_a^s x$ remained in a fixed compact subset $C_0$ of $W^s \( a \)$ along such a sequence, their intrinsic distances from $a$ would be bounded. Stable path-length contraction would instead give
  $ d_s #scale(x: 120%, y: 120%)[\(] f^n a \, f^n "Exp"_a^s x #scale(x: 120%, y: 120%)[\)] lt.eq C_(C_0) e^(- b_s n) \, $
  contradicting (7.3). This proves properness. For $x_0 eq.not 0$, the path $t mapsto "Exp"_a^s \( t x_0 \)$ is the complete affine geodesic with initial velocity $x_0$ and is proper as $t arrow.r + oo$. Neither this argument nor the preceding construction assumes injectivity of the affine exponential. ◻
]

An unstable displacement along this ray is still specified only by the formal exponential. We next realize that exponential over compact patches of its stable leaf and prove that parallel $P^u$ inputs produce $E^s$-tangent paths. Compatibility on overlapping patches will allow the construction along every finite segment of the ray.

=== 7.3 Uniform calculus on the moving plaques <uniform-calculus-on-the-moving-plaques>

We record the estimates used below, including the dependence on derivative and truncation orders.

#thm([Lemma 7.6.])[
  #emph[Forward iterates restricted to uniform local strong stable plaques have uniformly bounded derivatives of every fixed order. The same holds on weak stable plaques with a bounded local flow coordinate. On the ambient manifold, for every fixed $j$ there are constants $C_j \, K_j$ such that 
$ parallel f^r parallel_(C^j) + parallel f^(- r) parallel_(C^j) lt.eq C_j e^(K_j r) #h(2em) \( r gt.eq 0 \) $

 in bounded local charts, with the zeroth-order position term omitted. If $D_0 subset.double D_1$ are patches in a strong stable leaf, the sets $f^(- r) D_0$ have uniform positive intrinsic room inside $f^(- r) D_1$.]
] <real:iterate-bounds>

#proof[
  The strong and weak stable plaque estimates follow from Lemma 3.
  For the ambient estimate, truncated substitution on polynomials of degree at most $j$ turns the jet of a composition into a product of fixed-size matrices with uniformly bounded one-step norms. Their products grow at most exponentially. Apply this to $f$ and $f^(- 1)$. Lastly, contraction of stable path lengths gives
  $ d_s \( f^r a \, f^r a' \) lt.eq C e^(- b_s r) d_s \( a \, a' \) . $
  A ball of radius smaller than $C^(- 1)$ times the intrinsic distance from $overline(D)_0$ to the complement of $D_1$ in its leaf about a point of $f^(- r) D_0$ therefore stays in $f^(- r) D_1$. ◻
]

#thm([Lemma 7.7.])[
  #emph[Consider a product of finite matrices of a fixed size, 
$ A_(r - 1) \( a \) dots.h.c A_0 \( a \) \, $

 on uniform plaque charts. Suppose $parallel A_i parallel lt.eq M$, with $M gt.eq 1$, and that $parallel D^j A_i parallel lt.eq C_j$ for every fixed $j$, uniformly in $i \, r$. Then 
$ parallel D^j \( A_(r - 1) dots.h.c A_0 \) #scale(x: 120%, y: 120%)[parallel] lt.eq C'_j \( r + 1 \)^j M^r lt.eq C''_j e^(\( log M + 1 \) r) . $

 The exponential rate is independent of $j$. The same conclusion holds with a terminal vector of smooth data having bounded derivatives of every fixed order.]
] <real:product-derivatives>

#proof[
  Leibniz differentiation affects at most $j$ factors. There are at most $C_j \( r + 1 \)^j$ choices of factors and distributions of the derivatives among them. Each term has at most $j$ differentiated factors, whose norms contribute a constant depending on $j$, and at most $r$ undifferentiated factors. Finally $\( r + 1 \)^j lt.eq C_j e^r$. Include the terminal vector as one additional factor. ◻
]

#thm([Lemma 7.8.])[
  (Interior interpolation).  #emph[On uniform coordinate balls with a fixed amount of interior room, for integers $0 < j < r$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ parallel D^j a parallel_(C^0) lt.eq C_(j \, r) (parallel a parallel_(C^0)^(1 - j \/ r) parallel a parallel_(C^r)^(j \/ r) + parallel a parallel_(C^0)) . $ <real:interpolation-inequality>]

 In particular, if $parallel a_n parallel_(C^0) lt.eq C e^(- beta n)$ and $parallel a_n parallel_(C^r) lt.eq C_r e^(A n)$, then its $j$th derivatives are bounded by a constant times 
$ e^(- { beta \( 1 - j \/ r \) - A j \/ r } n) + e^(- beta n) . $

 The statement holds componentwise for tensors in uniformly bounded frames.]
] <real:interpolation>

#proof[
  Taylor interpolation on a fixed unisolvent polynomial stencil, rescaled to size $t$, gives
  $ \| D^j a \( x \) \| lt.eq C_(j \, r) (t^(- j) parallel a parallel_(C^0) + t^(r - j) parallel a parallel_(C^r)) \, #h(2em) 0 < t < t_0 \, $
  where $t_0$ is determined by the interior room. Choose $t = \( parallel a parallel_(C^0) \/ parallel a parallel_(C^r) \)^(1 \/ r)$ when this is at most $t_0$, and otherwise use $t_0$. This proves (7.4); the exponential consequence is immediate. Uniform coordinate changes preserve the estimate. ◻
]

#thm([Lemma 7.9.])[
  (Bounded jets in stable disks).  #emph[Fix an integer $k$ and a sufficiently small geometric radius $rho > 0$. After a conull refinement, there is a constant $B_k$ such that every intrinsic stable disk of radius $rho$ in each entire typical stable leaf contains a regular point at which the jets of $cal(E)$ through order $k$ have norm at most $B_k$. The refinement can be imposed simultaneously for all $k$ and all integer iterates.]
] <real:good-points>

#proof[
  Choose finitely many product boxes for the strong stable and weak unstable foliations, with inner boxes covering $S M$. Choose the outer boxes so that their stable plaque diameters are smaller than $rho \/ 2$. All boxes can be taken compactly inside slightly larger ones. The product measure class in each box is the product of its transversal Lebesgue classes: this follows by stable disintegration and absolute continuity of weak unstable holonomy between stable transversals.
  For almost every weak unstable plaque, the required tensor jets have smooth coherent representatives on its full compact crossing plaque, agreeing with the global regular data almost everywhere. Their suprema there are finite and measurable by Lemma 26. In each box choose a positive-measure family of such weak unstable plaques with a common finite bound. Product measure equivalence and Fubini show that almost every stable plaque intersects this family, in positive stable measure, at regular agreeing points. There are only finitely many boxes, so one bound $B_k$ works for all of them.
  The properties that a local stable plaque has such intersections and that global regular agreement holds along it discard an ambient null set. Refine typical centers so that their whole stable leaves meet each of these null sets in intrinsic measure zero. This is obtained by local absolute continuity at all integer iterates and the exhaustion
  $ W^s \( a \) = union.big_(r gt.eq 0) f^(- r) W_(upright("loc"))^s \( f^r a \) . $
  Now take any radius-$rho$ disk, including one centered at a nonregular point of such a leaf. Its inner half contains a point with all the preceding good-plaque properties. An inner product box containing that point has its entire outer stable crossing plaque inside the disk, by the diameter choice. That plaque contains the required bounded-jet regular point. Countable intersection treats all $k$ and all integer translates. The same argument in lifted boxes proves the assertion on $S tilde(M)$. ◻
]

=== 7.4 Strong decay of the pulled-back parameter jets <strong-decay-of-the-pulled-back-parameter-jets>

Fix nested patches in a typical strong stable leaf, with the closure of each compactly contained in the next. The innermost one is denoted $D$, and a sufficiently large outer one by $D^(+)$. Let $d_u = "rank" P^u$ and let $Y \( a \) : bb(R)^(d_u) arrow.r P_a^u$ be a smooth frame map on $D^(+)$. This frame selects unstable initial vectors above the stable base patch. It can be arbitrary for the approximation argument; parallelism along the $P^s$ slices will later force stable tangency of the translated path. Set, formally in $y$,

$ cal(F) \( a \, y \) = cal(E)_a \( Y \( a \) y \) \, #h(2em) a in D^(+) . $

At $s = f^(- n) a$, use a bounded geometric logarithm based at $s$ and write

#[#set math.equation(numbering: n => "(7.5)")
 $ log_s #h(-0.16667em) (f^(- n) cal(F) \( f^n s \, y \)) & = log_s #h(-0.16667em) (cal(E)_s \( d f^(- n) Y \( f^n s \) y \))\
 & = sum_(k gt.eq 1) G_(n \, k) \( s \) \[ y^(⊗ k) \] . $ <real:pulled-jet>]

The tensors include the usual factorial convention for Taylor coefficients. They are genuine smooth coefficient fields on the moving stable patch $f^(- n) D^(+)$, although the displayed series is only formal.

#thm([Lemma 7.10.])[
  #emph[For each fixed $k$ there is $A_k gt.eq 0$, independent of the stable derivative order $j$, such that 
#[#set math.equation(numbering: n => "(7.6)")
 $ parallel D_s^j G_(n \, k) parallel lt.eq C_(j \, k) e^(A_k n) #h(2em) \( j gt.eq 0 \) $ <real:naive-estimate>]

 on the moving patches, in uniform stable charts.]
] <real:naive>

#proof[
  At the orbit points $s \, f s \, dots.h \, f^n s$, center the one-step inverse maps by geometric exponential and logarithm charts. Their finite jets act by substitution on polynomials of degree at most $k$. This realizes the finite jet of their composition as a matrix product of fixed size. The undifferentiated one-step matrix norms are uniformly bounded by a constant depending only on $k$. Locally, fix a small stable ball about the point being estimated and hold fixed geometric frames on its successive forward images. Contraction puts these images inside uniformly bounded ambient charts; use the same intermediate frame in the two adjacent factors. These local choices require no global bundle trivialization.
  Differentiate these matrices in $s$ along the moving stable plaque. Each coefficient is a uniformly smooth geometric one-step coefficient evaluated at one of the forward points $f^i s$. Lemma 52 gives bounds for every fixed derivative order of these forward plaque maps, uniformly in $i \, n$. Thus the differentiated matrix factors satisfy the hypotheses of Lemma 53. The terminal order-$k$ jets of $cal(F)$ at $f^n s in D^(+)$ are smooth and have bounded derivatives on an outer compact enlargement; their composition with $f^n$ has the same property. That lemma proves (7.6). This argument differentiates bounded geometric jet matrices; it does not differentiate measurable normal coordinates. ◻
]

#thm([Proposition 7.11.])[
  #emph[There exists $c_0 > 0$, independent of the fixed orders $j \, k$, such that 
#[#set math.equation(numbering: n => "(7.7)")
 $ parallel D_s^j G_(n \, k) parallel lt.eq C_(j \, k) e^(- c_0 k n) #h(2em) \( k gt.eq 1 \, med j gt.eq 0 \) $ <real:decay-estimate>]

 on $f^(- n) D$. Constants may depend on the initial patches and the frame $Y$. No bound uniform in $j$ or $k$ is asserted for the prefactors.]
] <real:decay>

#proof[
  Fix $k$. Smooth finite-jet equivariance supplies a number $D_k gt.eq 0$ with the following property: transporting the jets of $cal(E)$ through order $k$ forward by $r$ steps costs at most $C_k e^(D_k r)$ when the starting jets are bounded. Indeed, the output finite jets of $f^r$ and the inverse linear tangent map on the input have at most exponential growth, by Lemma 52; only finitely many products occur at the fixed order $k$.
  Choose
  $ 0 < epsilon.alt lt.eq min {1 \, frac(b_u k, 8 \( D_k + 1 \))} \, #h(2em) delta = frac(b_s epsilon.alt, 4) \, #h(2em) r_n = floor.l epsilon.alt n floor.r . $
  Consider an intrinsic stable disk of radius $e^(- delta n)$ inside the moving outer patch. Its inverse image under $f^(r_n)$ contains an intrinsic disk of radius
  $ C^(- 1) e^(b_s r_n - delta n) . $
  This follows by applying the stable path-length contraction to any point in the latter disk. The radius tends to infinity. Hence Lemma 55 supplies a regular point in that inverse image where the required jets through order $k$ are bounded. Pushing this point forward $r_n$ times gives a point in the original disk where those jets are bounded by $C_k e^(D_k r_n)$. Consequently such points form an $O \( e^(- delta n) \)$-dense set on every inner moving patch.
  At each of these points, $parallel d f^(- n) Y \( f^n s \) parallel lt.eq C_Y e^(- b_u n)$ because $Y$ takes values in the actual unstable bundle. Formula (7.5), homogeneous of degree $k$ in this input, therefore gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ \| G_(n \, k) \( s \) \| lt.eq C_k e^(D_k epsilon.alt n - b_u k n) lt.eq C_k e^(- 7 b_u k n \/ 8) . $ <real:net-values>]
  The bounded-point test used jets only through order $k$; the interpolation orders chosen next do not enter that test.
  To estimate values between the sample points, take a fixed unisolvent stencil for polynomials of degree less than $p$, scaled to radius $t_n = e^(- delta n \/ 2)$ about the point being estimated. Perturb each stencil point to a point satisfying (7.8). The relative perturbation is $O \( e^(- delta n \/ 2) \)$, so the interpolation matrices and their inverses remain uniformly bounded. Taylor’s formula and Lemma 56 yield
  $ parallel G_(n \, k) parallel_(C^0) lt.eq C_(p \, k) (e^(- 7 b_u k n \/ 8) + e^(\( A_k - delta p \/ 2 \) n)) . $
  Choose $p$ with $delta p \/ 2 gt.eq A_k + 3 b_u k \/ 4$. We obtain
  #[#set math.equation(numbering: n => "(7.9)")
   $ parallel G_(n \, k) parallel_(C^0) lt.eq C_k e^(- 3 b_u k n \/ 4) . $ <real:improved-values>]
  Uniform interior room is provided by Lemma 52; nested intermediate patches allow both this step and the next one.
  For a prescribed $j$, apply Lemma 54 with (7.9) and the naive bound at an order $q > j$. Choose $q$ so large that
  $ j / q (A_k + frac(3 b_u k, 4)) lt.eq frac(b_u k, 4) . $
  The resulting derivative bound is $C_(j \, k) e^(- b_u k n \/ 2)$. Finitely many small values of $n$ can be included by increasing the prefactors. Thus, for example, $c_0 = b_u \/ 4$ works for every fixed $j \, k$. The choices of $epsilon.alt \, delta \, p \, q$ may depend on the orders, which is consistent with the assertion. ◻
]

=== 7.5 Actualization by finite truncations <actualization-by-finite-truncations>

#thm([Proposition 7.12.])[
  #emph[For the patches and frame in (7.5), there is a smooth map 
$ F : D times bb(R)^(d_u) arrow.r S tilde(M) $

 whose Taylor series in $y$ at zero is $cal(F)$, such that 
$ F \( a \, 0 \) = a \, #h(2em) D_y F \( a \, 0 \) = Y \( a \) \, #h(2em) F \( a \, y \) in W^u \( a \) . $

 The construction depends only on the initial vector $Y \( a \) y$ and is compatible on overlapping patches and under $f$.]
  #emph[More precisely, put 
$ V_(n \, R) \( s \, y \) = sum_(k = 1)^R G_(n \, k) \( s \) \[ y^(⊗ k) \] \, #h(2em) F_(n \, R) \( a \, y \) = f^n exp_(f^(- n) a) V_(n \, R) \( f^(- n) a \, y \) . $

 On every compact parameter set and compactly contained base patch, the following holds. For every fixed $j$ and $L > 0$, all sufficiently large fixed $R$ give 
#[#set math.equation(numbering: n => "(7.10)")
 $ parallel F - F_(n \, R) parallel_(C^j) lt.eq C_(R \, j \, L) e^(- L n) \, $ <real:fast-approximation>]

 and, after applying $f^(- n)$ and taking the logarithm based at $f^(- n) a$, 
#[#set math.equation(numbering: n => "(7.11)")
 $ ∥log_(f^(- n) a) \( f^(- n) F \( a \, y \) \) - V_(n \, R) \( f^(- n) a \, y \)∥_(C^j \( a \, y \)) lt.eq C_(R \, j \, L) e^(- L n) . $ <real:fast-backward>]

 Norms comparing nearby points use common bounded charts.]
] <real:actualization>

#proof[
  Fix a compact set of $y$ values. For every fixed $R$, the displacement $V_(n \, R)$ tends uniformly to zero by Proposition 57, so the exponential chart expressions are defined for all sufficiently large $n$.
  First compare consecutive approximants at time $- n$. With $s = f^(- n) a$ and $s_(-) = f^(- 1) s$, the centered one-step map is
  $ Psi_(s_(-)) \( z \) = log_s #scale(x: 120%, y: 120%)[\(] f \( exp_(s_(-)) z \) #scale(x: 120%, y: 120%)[\)] . $
  It is uniformly smooth, vanishes at zero, and has uniformly bounded derivatives of each fixed order. Exact formal equivariance says that the degree-$R$ Taylor truncation in $y$ of $Psi_(s_(-)) \( V_(n + 1 \, R) \( s_(-) \, y \) \)$ is $V_(n \, R) \( s \, y \)$. Taylor-expand $Psi_(s_(-))$ in $z$ through spatial order $R$. Its remainder has size at most $C_R \| V_(n + 1 \, R) \|^(R + 1) = O \( e^(- c_0 \( R + 1 \) n) \)$. Among the terms in the finite polynomial part, every omitted parameter monomial has degree at least $R + 1$. Each degree-$k$ input coefficient costs $e^(- c_0 k n)$, so every such product has the same bound. Consequently
  $ lr(|Psi_(s_(-)) \( V_(n + 1 \, R) \) - V_(n \, R)|) lt.eq C_R e^(- c_0 \( R + 1 \) n) . $
  Since $f^n$ has Lipschitz norm at most $C e^(A n)$, with $A$ independent of $R$,
  #[#set math.equation(numbering: n => "(7.12)")
   $ parallel F_(n + 1 \, R) - F_(n \, R) parallel_(C^0) lt.eq C_R e^(- { c_0 \( R + 1 \) - A } n) . $ <real:consecutive-czero>]
  For a fixed sufficiently large $R$, this is summable. Completeness of the lifted geometric metric gives a uniform continuous limit. If $R' > R$, the backward difference of the two truncations consists of degrees $R + 1 \, dots.h \, R'$, and its forward push tends to zero by the same estimate. All sufficiently large fixed cutoffs therefore give one and the same limit $F$.
  We next justify differentiating the limit. For every fixed $j$, Proposition 57 gives
  $ parallel V_(n \, R) parallel_(C^j \( s \, y \)) lt.eq C_(R \, j) e^(- c_0 n) . $
  Derivatives in $y$ introduce only constants depending on the finite cutoff and the compact parameter set. In $\( a \, y \)$ variables, the base substitution $s = f^(- n) a$ costs at most an exponential with rate depending on $j$. Applying the geometric exponential and then $f^n$ has the same kind of fixed-order cost. Thus
  #[#set math.equation(numbering: n => "(7.13)")
   $ parallel F_(n \, R) parallel_(C^j) lt.eq C_(R \, j) e^(B_j n) \, $ <real:cutoff-independent-growth>]
  where $B_j$ is independent of $R$. This independence concerns the exponential rate only; $C_(R \, j)$ need not be bounded as $R arrow.r oo$.
  The already obtained continuous limit allows us to use common output charts on finitely many compactly contained parameter patches. Apply Lemma 54 to consecutive differences, using (7.12) and (7.13) at an order $q > j$. The decay exponent in the $C^j$ estimate is at least
  $ (1 - j / q) { c_0 \( R + 1 \) - A } - j / q B_q . $
  For fixed $j \, q$ it tends to infinity with $R$. Choosing a fixed $R$ large enough gives summable $C^j$ differences and any desired exponential tail bound. This proves smoothness and (7.10). The derivatives through any fixed parameter order of $F_(n \, R)$ at $y = 0$ agree with the formal jets of $cal(F)$ once $R$ is at least that order, by equivariance. Smooth convergence therefore identifies all Taylor coefficients of $F$ with those prescribed by $cal(F)$.
  First the based logarithm in (7.11) is defined for large $n$. Indeed, if $"Lip" \( f^(- n) \) lt.eq C e^(K_1 n)$, use the $C^0$ estimate (7.10) with a rate $M > K_1 + c_0$. It gives
  $ d #scale(x: 120%, y: 120%)[\(] f^(- n) F \( a \, y \) \, exp_(f^(- n) a) V_(n \, R) #scale(x: 120%, y: 120%)[\)] lt.eq C_R e^(- \( M - K_1 \) n) . $
  The second point is at distance $O \( e^(- c_0 n) \)$ from $f^(- n) a$, so both points lie in a fixed based-logarithm ball. Composition with $f^(- n)$ and this logarithm, including the derivatives of their base $f^(- n) a$, now costs only a fixed-order exponential by Lemma 52. Choose a larger decay rate in (7.10) to absorb it; this proves (7.11). In particular,
  $ d #scale(x: 120%, y: 120%)[\(] f^(- n) F \( a \, y \) \, f^(- n) a #scale(x: 120%, y: 120%)[\)] lt.eq C e^(- c_0 n) $
  on each fixed compact parameter set, for all sufficiently large $n$. The entire backward tail has this estimate. The local unstable-manifold characterization then places the pair in one local unstable plaque at large negative time; invariance gives $F \( a \, y \) in W^u \( a \)$.
  A change of geometric logarithm is a uniformly smooth change of displacement coordinates fixing zero. Its finite Taylor remainder has exactly the degree-weight bound used in (7.12); its forward push vanishes for a sufficiently large fixed cutoff. Thus the limit is independent of these charts. At a fixed base point, a change of input frame amounts to an invertible linear substitution in the same initial vector, and produces the same limit. The same comparison applies on overlapping base patches. Shifting the backward sequence by one step proves equivariance under $f$. Taking increasing compact parameter sets now defines the asserted map for all finite $y$. ◻
]

#thm([Lemma 7.13.])[
  (Finite normal extensions).  #emph[Let $Q$ be the formal projection onto the perpendicular of $P^s$ for a smooth background metric. At regular centers, and on their entire typical unstable axes, use its smooth coherent coefficient extensions. For each fixed pair of integers $N \, r$, one can choose a positive-measure set of centers with the following uniform property: on a fixed small unstable plaque through the center, there is a smooth ambient matrix field $hat(Q)$ which equals the actual annihilating projection on the plaque, has the prescribed ambient Taylor jet through order $N$ at the center, and has uniformly bounded $C^r$ norm in a neighborhood of that plaque.]
] <real:normal-extension>

#proof[
  Flatten the actual unstable plaque in uniformly bounded geometric coordinates $\( x \, z \)$, with the plaque given by $z = 0$. Orthogonal projection is a smooth operation on the fixed-rank Grassmannian, so its full formal jets inherit coherence and measurable finite bounds. Write $Q_beta \( x \)$ for its pure normal formal derivatives of multi-order $beta$ at $\( x \, 0 \)$. Define
  $ hat(Q) \( x \, z \) = sum_(\| beta \| lt.eq N) frac(z^beta, beta !) Q_beta \( x \) . $
  On the plaque this equals $Q_0 \( x \)$, the actual projection for its smoothly extended subbundle. Holonomicity identifies every mixed derivative through total order $N$ at the center with the corresponding formal derivative. Its $C^r$ norm is controlled by a finite collection of tangential derivatives, through order $r$, of the $Q_beta$, together with bounded geometric chart factors. Those are finite on compactly contained fixed plaques by whole-axis smoothness. Their bounds are measurable; increasing finite bounds exhaust a conull set of centers. One bound therefore holds on a positive-measure set. Use slightly smaller plaques to obtain an ambient neighborhood with the claimed uniform geometric size. No common bound or radius for all $N \, r$ is required. ◻
]

#thm([Proposition 7.14.])[
  #emph[Suppose the frame $Y$ is parallel along the $P^s$ slices of the base patch. Then, for every finite $y$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ D_a F \( a \, y \) \[ P_a^s \] subset E_(F \( a \, y \))^s . $ <real:rectangle-tangency>]

 Consequently a path obtained by translating a $P^s$-tangent base path by a parallel $P^u$ input lies in one actual strong stable leaf, while each of its points lies in the strong unstable leaf of the corresponding base point.]
] <real:stable-tangency>

#proof[
  In the formal affine coordinates of Lemma 47, varying the base in $P^s$ with covariantly constant input produces the parallel $P^s$ variation at the translated point. The horizontal lifts have zero bracket curvature. Thus the formal derivative of $cal(F)$ in such a base direction is annihilated by the formal projection $Q$ onto the perpendicular of $P^s$. This identity only uses the first derivative of the input in that base direction. It therefore applies to our actual parallel frame by axis coherence.
  Fix a regular base point $a$, an input in a fixed compact parameter set, and $x in P_a^s$. We may require $a$ to be backward recurrent to the positive-measure sets in Lemma 59 for every finite pair of orders. This is a conull condition by ergodicity, and holds for a dense set of points on each of the typical stable axes in use. Set
  $ s = f^(- n) a \, #h(2em) x_n = d f^(- n) x \, #h(2em) W_(n \, R) \( s \, y \) = exp_s V_(n \, R) \( s \, y \) . $
  There is a fixed $K$ with $\| x_n \| lt.eq C e^(K n) \| x \|$. Equivariance carries the parallel input frame to a parallel frame on the corresponding pulled-back stable slices.
  At a good backward return, choose the extension $hat(Q)_n$ from Lemma 59, with its Taylor jet and derivative bounds taken to sufficiently high orders for a fixed cutoff $R$. Keep this chosen ambient matrix field fixed when varying $\( s \, y \)$ in the following test. The expression
  $ hat(Q)_n #scale(x: 120%, y: 120%)[\(] W_(n \, R) \( s \, y \) #scale(x: 120%, y: 120%)[\)] D_s W_(n \, R) \( s \, y \) \[ x_n \] $
  has zero Taylor coefficients in $y$ through degree $R$ by the formal parallelism identity. Its Taylor remainder on a compact parameter set satisfies
  #[#set math.equation(numbering: n => "(7.15)")
   $ lr(|hat(Q)_n \( W_(n \, R) \) D_s W_(n \, R) \[ x_n \]|) lt.eq C_R e^(K n - c_0 \( R + 1 \) n) \| x \| . $ <real:projection-remainder>]
  Here is the order accounting, including the base derivative. In bounded coordinates put $H \( s \, V \) = exp_s V$, and keep $hat(Q)_n$ fixed. Writing $V = V_(n \, R) \( s \, y \)$ and $W = H \( s \, V \)$ gives
  $ hat(Q)_n \( W \) D_s W \[ x_n \] = A_s \( V \) x_n + B_s \( V \) D_s V \[ x_n \] \, $
  where $A_s \( V \) = hat(Q)_n \( H \( s \, V \) \) D_s H \( s \, V \)$ and $B_s \( V \) = hat(Q)_n \( H \( s \, V \) \) D_V H \( s \, V \)$. Take these geometric derivatives before Taylor expansion in $V$. Both degree-$R$ remainders are $O \( \| V \|^(R + 1) \)$; the second is also multiplied by $D_s V \[ x_n \]$. Each positive parameter-degree coefficient of $V$, and of its first stable base derivative, has cost $e^(- c_0 k n)$ in degree $k$, by Proposition 57. The polynomial terms through parameter degree $R$ cancel by the formal identity. Every product of parameter degree at least $R + 1$ has total cost at most $e^(- c_0 \( R + 1 \) n)$. Their spatial Taylor remainders have the same cost since $V = O \( e^(- c_0 n) \)$. The base variation contributes $\| x_n \|$, and no further order-dependent exponential. All remaining constants are finite because $R$ is fixed and the extension norms are bounded on the chosen return set. This proves (7.15).
  For a prescribed final error rate, first choose a fixed $R$ large enough for both (7.15) and (7.11), and then use the return set providing the required finite extension norms for that $R$. Recurrence was imposed simultaneously for all finite orders, so these choices do not require a return set uniform in $R$. By (7.11) in $C^1 \( a \, y \)$, the point $f^(- n) F \( a \, y \)$ and its base derivative can replace $W_(n \, R)$ and $D_s W_(n \, R) \[ x_n \]$ with an error decaying at any prescribed exponential rate, upon taking a sufficiently large fixed cutoff. The uniformly bounded test derivatives and the at-most-exponential size of the vectors preserve that assertion. The true backward point is in the local unstable plaque of $s$ for large $n$: the whole further backward tail is uniformly close to the tail of $s$, as shown in Proposition 58. On that actual plaque $hat(Q)_n$ is the true projection, regardless of whether the polynomial approximant lies in the plaque.
  It follows, by increasing the fixed cutoff, that for any prescribed $L > 0$ along the corresponding sequence of good returns,
  $ "dist" (d f^(- n) D_a F \( a \, y \) \[ x \] \, thin P_(f^(- n) F \( a \, y \))^s) lt.eq C_L e^(- L n) \| x \| . $
  The subbundle appearing here is the smooth extension on this actual unstable plaque; its values are contained in the actual $E^s$ everywhere by continuity. Push forward by $d f^n$ and choose $L$ larger than its fixed exponential norm bound. The distance from $D_a F \( a \, y \) \[ x \]$ to $E_(F \( a \, y \))^s$ tends to zero, proving (7.14) at these regular bases. Smoothness of $F$ and of $P^s$ along the base axis, together with continuity of $E^s$, extends the statement to every base point.
  Finally any finite segment of a smooth curve tangent to $E^s$ has its length exponentially contracted under positive iteration. Its endpoints consequently belong to one strong stable leaf. Apply this to translated base paths, and use $F \( a \, y \) in W^u \( a \)$ for their other sides. ◻
]

=== 7.6 The ideal-boundary contradiction <the-ideal-boundary-contradiction>

For $eta in partial_oo tilde(M)$, let $b_eta$ be the Busemann function normalized by $b_eta \( o \) = 0$ at a fixed basepoint $o$, with $b_eta$ decreasing at unit speed toward $eta$. We also write $b_eta \( v \) = b_eta \( pi v \)$ for a unit tangent vector. We use three standard consequences of uniform negative curvature. Two distinct ideal points determine a unique oriented geodesic; these geodesics depend continuously on the endpoints locally off the diagonal; and the normalized Busemann function depends continuously on its endpoint, uniformly on compact spatial sets. The boundary and Busemann descriptions in #cite(label("Ballmann1995"), form: "prose") Chapters II and III, especially Lemma III.3.1 give these facts. In particular, prescribing ordered distinct endpoints and the Busemann level at the future endpoint determines a unit tangent vector continuously.

#thm([Proposition 7.15.])[
  #emph[The infinite-dimensional alternative of Theorem 46 cannot occur.]
] <real:infinite-excluded>

#proof[
  Choose a typical lifted center $v$ and a nonzero vector in $P_v^s$. Proposition 51 gives a proper affine ray $a \( t \)$, $t gt.eq 0$, in $W^s \( v \)$, with $a \( 0 \) = v$. Parallel-transport a sufficiently small nonzero vector $V_0 in P_v^u$ along this ray using the partial connection in Lemma 48. On every finite segment this is an ordinary smooth linear differential equation and therefore has a solution $V \( t \)$ throughout that segment. These solutions agree on overlaps, so $V \( t \)$ is defined for all finite $t gt.eq 0$.
  Use Proposition 58 to set
  $ z \( t \) = F_(a \( t \)) \( V \( t \) \) \, $
  where the subscript denotes the intrinsic initial-vector version of that construction. Local parallel frames on the stable slices show that this is a smooth path; compatibility on overlaps makes it globally well defined. Proposition 60 gives
  $ z \( t \) in W^u \( a \( t \) \) ∩ W^s \( z \( 0 \) \) #h(2em) \( t gt.eq 0 \) . $
  Only finite parameter values on compact ray segments have been used, so no boundedness of $V \( t \)$ as $t arrow.r oo$ is needed.
  Let $eta$ be the future endpoint of $v$, and $eta'$ the future endpoint of $z \( 0 \)$. Because $D_V F_v \( 0 \)$ is the inclusion of $P_v^u$, a sufficiently small nonzero $V_0$ has $z \( 0 \) eq.not v$. These two vectors belong to one strong unstable leaf. If their future endpoints also coincided, uniqueness of the connecting geodesic and equality of their past Busemann levels would force the vectors to coincide. Therefore $eta' eq.not eta$.
  Write $zeta_t$ for the past endpoint of $a \( t \)$. The past-endpoint map identifies the full strong stable leaf $W^s \( v \)$ with $partial_oo tilde(M) \\ { eta }$: its inverse takes the geodesic from $zeta$ to $eta$ at the fixed $b_eta \( v \)$ level. Existence, uniqueness, and continuity are exactly the endpoint facts just recalled. Properness of $a \( t \)$ therefore implies $zeta_t arrow.r eta$. Indeed otherwise a subsequence of its past endpoints would stay in a compact subset of the boundary minus $eta$, whose inverse image in $W^s \( v \)$ is compact.
  Figure 1 records these actual leaf incidences for a finite segment of the two paths.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  bezier((0, 0), (8, 0.25), (2.4, -0.35), (5.5, 0.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.129, -0.06503), [#text(size: 9pt)[$a([0,t]) subset W^s(v)$]], anchor: "north", padding: 0.1176cm)
  bezier((0.6, 3.1), (7.55, 3.4), (2.8, 3.65), (5.4, 2.85), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.094, 3.497), [#text(size: 9pt)[$z([0,t]) subset W^s(z(0))$]], anchor: "south", padding: 0.1176cm)
  bezier((0, 0), (0.6, 3.1), (-0.4, 1.1), (0.85, 2.1), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.05351, 1.557), [#text(size: 9pt)[$W^u(v)$]], anchor: "east", padding: 0.1176cm)
  bezier((8, 0.25), (7.55, 3.4), (8.55, 1.25), (7.2, 2.25), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((8.067, 1.676), [#text(size: 9pt)[$W^u(a(t))$]], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.04939, fill: black, stroke: none)
  circle((8, 0.25), radius: 0.04939, fill: black, stroke: none)
  circle((0.6, 3.1), radius: 0.04939, fill: black, stroke: none)
  circle((7.55, 3.4), radius: 0.04939, fill: black, stroke: none)
  content((0, -0.2822), [#text(size: 9pt)[$a(0)=v$#linebreak()$( zeta_0, eta )$]], anchor: "north", padding: 0.1176cm)
  content((8, -0.03222), [#text(size: 9pt)[$a(t)$#linebreak()$( zeta_t, eta )$]], anchor: "north", padding: 0.1176cm)
  content((0.6, 3.382), [#text(size: 9pt)[$z(0)$#linebreak()$( zeta_0, eta ')$]], anchor: "south", padding: 0.1176cm)
  content((7.55, 3.682), [#text(size: 9pt)[$z(t)$#linebreak()$( zeta_t, eta ')$]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: Actual leaf incidences in the infinite-dimensional alternative, for a fixed finite $t$. Each ordered pair gives the past and future endpoints. The lower path is tangent to $P^s$; the translated upper path is proved tangent to $E^s$. Each vertical connection indicates membership in one strong unstable leaf. The drawing is schematic: it asserts no ambient affine plane, smooth product chart or embedded surface. The contradiction uses the proper lower ray and the endpoint identities, not any geometric shape of this drawing. ],
  ) <fig:mixed-rectangle>
  We claim
  #[#set math.equation(numbering: n => "(7.16)")
   $ b_(zeta_t) \( a \( t \) \) arrow.r - oo . $ <real:busemann-divergence>]
  The sum $b_eta + b_(zeta_t)$ is convex and has zero gradient on the geodesic with these endpoints, so it attains its minimum there. Let $c \( r \)$ be the ray from $o$ toward $eta$. For each fixed $r > 0$,
  $ b_eta \( a \( t \) \) + b_(zeta_t) \( a \( t \) \) lt.eq b_eta \( c \( r \) \) + b_(zeta_t) \( c \( r \) \) . $
  As $t arrow.r oo$ the right-hand side tends to $- 2 r$, by endpoint continuity of normalized Busemann functions. The term $b_eta \( a \( t \) \) = b_eta \( v \)$ is fixed. Since $r$ is arbitrary, (7.16) follows.
  On the other hand, $z \( t \)$ has ordered endpoints $\( zeta_t \, eta' \)$ and fixed future Busemann level $b_(eta') \( z \( 0 \) \)$. Their limiting pair $\( eta \, eta' \)$ is off the diagonal. The corresponding unit tangent vectors therefore converge to the vector with this limiting pair and that level; in particular they remain in a compact subset of $S tilde(M)$. Endpoint continuity now makes $b_(zeta_t) \( z \( t \) \)$ bounded. But $z \( t \) in W^u \( a \( t \) \)$ means that the two vectors have the same past endpoint and past Busemann level, so
  $ b_(zeta_t) \( z \( t \) \) = b_(zeta_t) \( a \( t \) \) . $
  This contradicts (7.16) and excludes the infinite-dimensional alternative. ◻
]

== 8 From formal sign fields to a smooth splitting <smooth:section>

The finite alternative in Theorem 46 remains. In this section all work on the universal cover is local in the resulting smooth structure, so the conclusions descend to $S M$. We first recover the actual plaque jets on an entire typical axis. We then propagate their regularity using scalar functions which label weak unstable leaves.

=== 8.1 Actual plaque jets and formal leaf labels <actual-plaque-jets-and-formal-leaf-labels>

#thm([Lemma 8.1.])[
  (Tangency to the central plaques).  #emph[In the finite alternative, the positive-$D$ invariant formal plane field is tangent to the entire formal central unstable plaque. Consequently, on each entire typical strong stable leaf, all finite Taylor jets of the actual weak unstable plaques are smooth functions of their crossing point. They have holonomic full formal extensions there. The same statements hold on the weak stable leaf generated by that strong stable leaf.]
] <smooth:tangency>

#proof[
  Use the graded section coordinates of Lemma 27 and the dilation of Proposition 28. Write $x$ for the positive variables and $y$ for the negative variables. The actual central unstable plaque has formal projection $y = 0$. Let $D_(+)$ and $D_(-)$ denote the restrictions of $D$ to the two coordinate spaces. The positive formal field furnished by Proposition 45 has value $E^u$ at the origin and is invariant under the dilation. Its restriction to $y = 0$ is a graph, with graph matrix $B \( x \)$ from the positive to the negative space. Dilation invariance gives
  $ B \( e^(t D_(+)) x \) = e^(t D_(-)) B \( x \) e^(- t D_(+)) . $
  Diagonalize $D$ over the real graded spaces. A monomial $x^nu$ in a matrix entry with input weight $lambda_i > 0$ and output weight $mu_j < 0$ would have to satisfy
  $ sum_a nu_a lambda_a = mu_j - lambda_i < 0 . $
  The left side is nonnegative, so every coefficient vanishes. Thus $B = 0$. This is an identity of formal series; it needs no convergence. Adding the flow direction gives formal tangency to the weak unstable plaque.
  In ordinary smooth coordinates, represent that plaque by a graph $z = g \( v \)$ with prescribed crossing $g \( 0 \)$. Tangency to the formal plane field gives a system
  $ partial_(v_i) g \( v \) = A_i \( v \, g \( v \) \) . $
  Its constant coefficient determines the first derivatives of $g$; after $d$ differentiations, it determines derivatives of order $d + 1$ from the field jet and the already determined graph coefficients. There is no existence assertion hidden in this recursion: the actual central plaque already provides the formally tangent solution. The recursion merely expresses each of its graph coefficients by finitely many operations on the ambient formal field jet.
  The full ambient jets of that field are smooth and holonomic on each entire typical stable axis, by Proposition 45. Hence the recursively obtained graph coefficients are smooth there and have the same tangential coherence. Initially the equality with actual plaque coefficients holds at the regular crossing points. It holds everywhere on the axis by continuity: the actual plaques depend continuously in $C^0$ on their crossings, have uniformly bounded local derivatives of each finite order, and therefore depend continuously in each finite $C^r$ norm by interior interpolation. Regular crossings are dense on the axis by conditional full measure. This also explains why no transverse smoothness of the actual foliation was used. Flow transport proves the weak-axis assertion, with compatibility on overlapping flow boxes. ◻
]

Fix one such strong stable leaf $A^(upright("all"))$ on the universal cover, with future endpoint $eta$. Normalize its Busemann function so that $A^(upright("all"))$ is at height $b_eta = 0$; our convention is $b_eta \( pi phi.alt_t v \) = b_eta \( pi v \) - t$ when $v_(+) = eta$. The past-endpoint map identifies this leaf with $partial_oo tilde(M) \\ { eta }$. Choose a coordinate patch $A subset A^(upright("all"))$, with smooth coordinates $a mapsto q_A \( a \) in bb(R)^m$, and write

$ cal(B) = { phi.alt_t a : a in A \, med t in bb(R) } . $

This is an open part of the fixed-future weak stable leaf. On the open set $cal(U)$ of vectors whose past endpoints occur in $A$, define

#[#set math.equation(numbering: n => "(8.1)")
 $ q \( v \) = q_A \( a \( v \) \) \, #h(2em) a \( v \)_(-) = v_(-) \, quad a \( v \) in A . $ <smooth:label-definition>]

The endpoint identifications show that $q$ is continuous. It is constant on actual weak unstable leaves and under the flow. Only its restriction $q_0 = q \|_(cal(B))$ is known to be smooth at this stage.

#thm([Lemma 8.2.])[
  (Formal inversion of plaque labels).  #emph[The function $q_0$ has a distinguished full formal ambient extension along $cal(B)$. Its coefficients are smooth and holonomic on $cal(B)$, it is formally constant on every actual weak unstable plaque crossing $cal(B)$, and its finite jets transform by scalar pullback under the flow. These assertions concern formal jets along $cal(B)$, and do not assert differentiability of $q$ elsewhere.]
] <smooth:formal-labels>

#proof[
  At any fixed Busemann height, the strong stable slice in $cal(B)$ is a smooth transversal to the weak unstable plaques. Use coordinates $a$ on this slice and auxiliary variables $z$ along the plaques. By Lemma 62, the parameterized actual plaque Taylor graphs form a formal map
  $ Psi \( a \, z \) \, #h(2em) Psi \( a \, 0 \) = a \, $
  whose coefficients in $z$ are smooth in $a$, with all their tangential derivatives. Within a weak unstable plaque, the strong plaque through its crossing is tangent to $ker alpha$. Its graph coefficients are determined recursively from the weak plaque jets and the smooth contact form, as in Lemma 62; the actual strong plaque supplies the solution. These finite operations preserve smooth dependence on $a$. We may therefore choose $z = \( u \, t \)$ and write
  $ Psi \( a \, u \, t \) = phi.alt_t Gamma \( a \, u \) \, #h(2em) Gamma \( a \, 0 \) = a \, $
  where $Gamma \( a \, u \)$ is the actual strong unstable plaque Taylor map through $a$. Only its finite Taylor coefficients and their smooth dependence on $a$ are used. The differential of $\( a \, z \) mapsto Psi \( a \, z \)$ at $z = 0$ is invertible, by transversality. Formal inversion therefore determines $a = a \( p \)$ and the scalar formal function $q_0 \|_(upright("slice")) \( a \( p \) \)$ to every finite order. Concretely, to compute order $r$, take a sufficiently high finite Taylor polynomial of $Psi$ in $z$ and invert it as an ordinary local smooth map. The resulting order-$r$ jet is independent of all higher coefficients. Thus this construction uses only finitely many jet operations at each stage.
  Smooth dependence of the coefficients on $a$ gives tangential holonomicity of the inverse jets. The construction is independent of coordinates because it describes the crossing of an actual plaque with the chosen transversal. Moving the height slice by the flow transports both the actual plaque jets and the prescribed labels; formal inversion commutes with this transport. This proves compatibility at different heights. The inverse label is independent of $u \, t$, and $partial_t Psi = X compose Psi$ gives the full formal identity $X q = 0$. Differentiating scalar jet equivariance in time therefore gives the holonomic derivative identity along $X$; combined with coherence on each height slice, this proves full holonomicity along $cal(B)$. In particular, the scalar jet identity is
  $ j_p^r q = \( j_(phi.alt_t p)^r q \) compose j_p^r phi.alt_t \, #h(2em) p \, phi.alt_t p in cal(B) \, $
  where both $q$-jets in this display mean the formal jets just constructed. ◻
]

=== 8.2 Backward geometry and estimates along the axis <backward-geometry-and-estimates-along-the-axis>

Let $N_eta \( x \) = \( x \, v_eta \( x \) \)$ be the unit vector based at $x$ pointing toward $eta$. It parametrizes the fixed-future weak stable leaf as a smooth graph over $tilde(M)$. This graph, its local charts, and all of its fixed-order local derivatives have uniform bounds. Indeed the individual weak stable leaves have uniform smooth plaque bounds, and their spatial projections have uniformly invertible differentials. Write $rho \( x \, v \) = N_eta \( x \)$. Near this graph use the intrinsic angular coordinate

$ t = v - chevron.l v \, v_eta \( x \) chevron.r v_eta \( x \) in v_eta \( x \)^perp \, #h(2em) chevron.l v \, v_eta \( x \) chevron.r > 0 . $

It is the tangential component of $v$ in the horosphere. Thus $v = sqrt(1 - \| t \|^2) thin v_eta \( x \) + t$. The degree-$l$ angular Taylor coefficient of the formal label will be denoted $q_l$; it is a smooth symmetric $l$-tensor on the horosphere tangent bundle over $cal(B)$, with values in $bb(R)^m$, and includes the Taylor factorial. In these coordinates the formal label is $sum_(l gt.eq 0) q_l \( s \, r \) \[ t^l \]$, where $r$ is Busemann height and $s$ denotes coordinates on its horosphere.

#thm([Lemma 8.3.])[
  (Compact sets approach the fixed-future axis).  #emph[Let $K subset.double cal(U)$. There are $b > 0$, $C < oo$, and a compact $K_(cal(B)) subset.double cal(B)$ such that, for all sufficiently large $n$ and $v in K$, 
$ \| t \( f^(- n) v \) \| lt.eq C e^(- b n) \, #h(2em) f^n rho \( f^(- n) v \) in K_(cal(B)) . $

 The actual weak unstable plaque through $f^(- n) v$ crosses the axis $t = 0$ at the same Busemann height, at a point $a_n \( v \)$. That crossing and the axis points underlying the intervening local plaque graph also have their $f^n$-images in $K_(cal(B))$, after enlarging this compact set. All assertions hold on a fixed neighborhood of $K$.]
] <smooth:backward-geometry>

#proof[
  The crossing $a \( v \)$ in (8.1) depends continuously on $v$, so $a \( K \)$ is compact in $A$. Put $zeta = v_(-)$ and choose the continuous bounded time shift
  $ tau \( v \) = b_zeta \( pi v \) - b_zeta \( pi a \( v \) \) . $
  The vector $z \( v \) = phi.alt_(tau \( v \)) a \( v \)$ has the same past endpoint and the same past Busemann height as $v$; hence it is on its strong unstable leaf. Moreover their intrinsic strong unstable distance is uniformly bounded on $K$. To see the uniformity explicitly, join their base points by a spatial geodesic segment of bounded length and project it onto their common past horosphere along the Busemann gradient flow. The required flow times are bounded by the segment length. Uniform bounds for the Busemann Hessian bound the length of this projected path and its lift to the normal graph. This uses the fixed negatively curved metric, not regularity of the endpoint map.
  Backward strong unstable contraction now gives
  $ d^u \( f^(- n) v \, f^(- n) z \( v \) \) lt.eq C e^(- b n) . $
  Write $f^(- n) v = \( x_n \, v_n \)$ and $f^(- n) z \( v \) = N_eta \( y_n \)$. The uniform local bounds of $N_eta$ imply $d \( N_eta \( x_n \) \, N_eta \( y_n \) \) lt.eq C e^(- b n)$ and the asserted angular bound. If
  $ epsilon.alt_n = b_eta \( x_n \) - b_eta \( y_n \) \, $
  then $\| epsilon.alt_n \| lt.eq C e^(- b n)$. The two vectors $phi.alt_(epsilon.alt_n) N_eta \( x_n \)$ and $N_eta \( y_n \)$ belong to the same strong stable leaf and have intrinsic distance $O \( e^(- b n) \)$. Forward strong stable contraction, and the unchanged small time shift, show that $f^n N_eta \( x_n \)$ stays within $O \( e^(- b n) \)$ in the intrinsic weak stable metric of the compact family $z \( v \)$. This proves the compact-axis assertion.
  For completeness, the local crossing assertion has a uniform transversality bound. At $t = 0$, the weak unstable plaque intersected with $b_eta = r$ has tangent $E^u$. In Jacobi coordinates the differential of its angular coordinate in a spatial direction $a$ is $\( U \( v \) + U \( - v \) \) a$, which is uniformly positive definite. Uniform smooth bounds on individual plaques and the inverse function theorem therefore give actual graphs
  #[#set math.equation(numbering: n => "(8.2)")
   $ s = P_(s_0 \, r) \( t \) \, #h(2em) P_(s_0 \, r) \( 0 \) = s_0 \, $ <smooth:actual-graphs>]
  on a fixed radius, with uniformly bounded derivatives in $t$ of each fixed order. No derivative with respect to $s_0$ is asserted.
  The nearby crossing of the plaque through $f^(- n) v$ is especially explicit. If $c_n = b_eta \( x_n \)$, then
  $ c_n = n T - tau \( v \) + epsilon.alt_n \, #h(2em) a_n \( v \) = phi.alt_(- c_n) a \( v \) \, #h(2em) f^n a_n \( v \) = phi.alt_(tau \( v \) - epsilon.alt_n) a \( v \) . $
  These identities follow from its past endpoint, future endpoint, and height. They prove compactness of its forward image. On the local graph between angular values $0$ and $t \( f^(- n) v \)$, the base points move by $O \( e^(- b n) \)$ on this same horosphere. Their axis vectors have that small intrinsic stable distance from $a_n \( v \)$; contraction gives the remaining compactness assertion. Replacing $K$ by a slightly larger compact subset of $cal(U)$ proves the neighborhood assertion. ◻
]

All following norms along the axis are computed in uniformly bounded local weak stable charts and uniformly bounded tensor frames. For $L subset.double cal(B)$ let $L_n = f^(- n) L$. When an interior estimate is used, enlarge $L$ slightly inside $cal(B)$. The forward weak-plaque bounds in Lemma 3, in particular the uniform Lipschitz bound, give a uniform positive amount of local room around $L_n$.

#thm([Lemma 8.4.])[
  (A derivative-order-independent exponential bound).  #emph[For each angular degree $l$ there is $A_l < oo$ such that, for every $j gt.eq 0$ and every $L subset.double cal(B)$, 
#[#set math.equation(numbering: n => "(8.3)")
 $ parallel q_l parallel_(C^j \( L_n \)) lt.eq C_(L \, l \, j) e^(A_l n) . $ <smooth:naive-bound>]

 The exponent $A_l$ is independent of $j$.]
] <smooth:naive>

#proof[
  Transport the full ambient scalar jet of order $l$ from $f^n p$ to $p$, using Lemma 63. The one-step transport is a finite-dimensional linear pullback-jet matrix $M_l \( p \)$. In uniformly bounded geometric charts these matrices and every fixed-order weak-axis derivative are uniformly bounded: the one-step ambient map is smooth, and the weak-axis charts have the uniform leafwise bounds just explained. The transport over $n$ steps is the product of these matrices at $p \, f p \, dots.h \, f^(n - 1) p$.
  When this product is differentiated $j$ times along the initial weak axis, at most $j$ factors are differentiated. Each derivative of a factor composed with $f^i \|_(cal(B))$ is bounded by a constant depending on $l \, j$, uniformly in $i$. The remaining factors are bounded by a fixed $M_l gt.eq 1$. The number of terms is at most a constant times $\( 1 + n \)^j$. The final jet field on $L$, and its derivatives composed with $f^n \|_(cal(B))$, have bounded derivatives. Hence the product rule gives $C_(L \, l \, j) \( 1 + n \)^j M_l^n$. Absorb the polynomial in $e^n$, with its $j$-dependent prefactor. Taking angular coefficients and changing uniform frames preserve the resulting exponent $A_l = 1 + log M_l$. This is Lemma 53 on the fixed bundle $J^l$ of scalar $l$-jets: differentiation changes the matrix coefficient functions, not the jet order. Using ambient derivative bounds for $f^n$ in its place would lose the independence from $j$. ◻
]

#thm([Lemma 8.5.])[
  (Subexponential bounds for every axis derivative).  #emph[For every $l \, j gt.eq 0$, every $epsilon > 0$, and every $L subset.double cal(B)$ there is a constant $C_(L \, l \, j \, epsilon)$ such that 
#[#set math.equation(numbering: n => "(8.4)")
 $ parallel q_l parallel_(C^j \( L_n \)) lt.eq C_(L \, l \, j \, epsilon) e^(epsilon n) . $ <smooth:subexponential-bound>]

]
] <smooth:subexponential>

#proof[
  We induct on $l$, proving all derivative orders at each stage. For $l = 0$, the identity $q_0 \( p \) = q_0 \( f^n p \)$ and the bounded weak-axis derivatives of forward iterates give bounded derivatives on $L_n$.
  At each fixed height, formal constancy on the actual graph (8.2) gives the coefficientwise identity
  #[#set math.equation(numbering: n => "(8.5)")
   $ sum_(k gt.eq 0) q_k \( P_(s_0 \, r) \( t \) \, r \) \[ t^k \] = q_0 \( s_0 \, r \) . $ <smooth:crossing-identity>]
  Every occurrence of a coefficient on the left is Taylor-expanded at $t = 0$. The identity follows directly from the formal crossing inversion of Lemma 63 and its tangential holonomicity. In degree $l$, its only term containing $q_l$ is $q_l \( s_0 \, r \) \[ t^l \]$. All other terms involve derivatives in $s$ of $q_k$ with $k < l$ and order at most $l - k$, multiplied by polynomials in the $t$-derivatives of $P_(s_0 \, r)$ through order $l$. These graph derivatives are uniformly bounded. The induction hypothesis and polarization of the homogeneous degree-$l$ identity therefore give
  $ parallel q_l parallel_(C^0 \( L_n \)) lt.eq C_(L \, l \, epsilon) e^(epsilon n) quad upright("for every ") epsilon > 0 . $
  This argument estimates only values of the next coefficient. In particular it never differentiates the actual graph with respect to its crossing point.
  We upgrade values to arbitrary weak-axis derivatives using interpolation on the full weak axis, including the height coordinate. On a fixed interior chart the elementary Taylor difference estimate is
  $ parallel D^j u parallel_(C^0) lt.eq C_(j \, r) #scale(x: 120%, y: 120%)[\(] h^(- j) parallel u parallel_(C^0) + h^(r - j) parallel u parallel_(C^r) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 < h < h_0 \, $
  where the norms on the right are on a slightly larger chart. The uniform interior room makes its constants independent of $n$; see also Lemma 54. Fix $j gt.eq 1$ and target $epsilon > 0$. Take $delta = epsilon \/ \( 4 j \)$ and $h = e^(- delta n)$, use the value bound with exponent $epsilon \/ 4$, and choose a fixed integer $r > j + A_l \/ delta$. By (8.3), the two terms then have exponents at most $epsilon \/ 2$ and $A_l - delta \( r - j \) < 0$, respectively. This proves (8.4). The choice of $r$ is possible precisely because $A_l$ does not depend on $r$. The argument works for every compact $L$, using a larger compact for interior estimates, so the induction is complete. ◻
]

=== 8.3 Smoothness of the actual label <smoothness-of-the-actual-label>

#thm([Proposition 8.6.])[
  (Propagation from the axis).  #emph[The actual endpoint label $q : cal(U) arrow.r bb(R)^m$ is smooth.]
] <smooth:propagation>

#proof[
  Fix nested compact neighborhoods $K subset.double K^(+) subset.double cal(U)$. For large $n$, Lemma 64 puts $f^(- n) K^(+)$ in the angular coordinate neighborhood of the axis. For a fixed finite cutoff $R$ define the smooth function, near $K^(+)$,
  #[#set math.equation(numbering: n => "(8.6)")
   $ p_(n \, R) \( v \) = sum_(l = 0)^R q_l #scale(x: 120%, y: 120%)[\(] rho \( f^(- n) v \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\[] t \( f^(- n) v \)^l #scale(x: 120%, y: 120%)[\]] . $ <smooth:approximants>]
  These expressions are intrinsic tensor contractions, so no seams from angular frames occur. They use a finite polynomial at each $n$; no infinite formal series is evaluated.
  We first estimate their error without differentiating $q$. At a pulled back point, use its actual plaque graph $s = P_(s_0 \, r) \( t \)$ and its genuine crossing $\( s_0 \, r \, 0 \)$. The function of the angular parameter
  $ H \( t \) = sum_(l = 0)^R q_l \( P_(s_0 \, r) \( t \) \, r \) \[ t^l \] - q_0 \( s_0 \, r \) $
  has zero Taylor coefficients through degree $R$ by (8.5). Along the segment from zero to the angular parameter in question, all underlying axis points lie over the compact set supplied by Lemma 64. Lemma 66, the uniform derivatives of the single actual graph, and Taylor’s remainder formula give
  $ \| H \( t \) \| lt.eq C_(K \, R \, epsilon) e^(epsilon n) \| t \|^(R + 1) . $
  The actual label equals $q_0 \( s_0 \, r \)$ on that plaque, and is flow invariant. Consequently
  #[#set math.equation(numbering: n => "(8.7)")
   $ parallel p_(n \, R) - q parallel_(C^0 \( K^(+) \)) lt.eq C_(K \, R \, epsilon) e^(- \( b \( R + 1 \) - epsilon \) n) . $ <smooth:approximation-error>]
  Only derivatives of the smooth axis coefficients and of an individual actual plaque entered this estimate.
  For each fixed $j$, the same coefficients have subexponential $C^j$ bounds. A polynomial of degree at most $R$ in $\| t \| < 1$ therefore has a $C^j$ bound $C_(K \, R \, j \, epsilon) e^(epsilon n)$ in the geometric angular coordinates. The ordinary ambient bounds for $f^(- n)$ and the chain rule give
  #[#set math.equation(numbering: n => "(8.8)")
   $ parallel p_(n \, R) parallel_(C^j \( K^(+) \)) lt.eq C_(K \, R \, j \, epsilon) e^(\( B_j + epsilon \) n) \, $ <smooth:approximant-growth>]
  where $B_j$ depends on $j$ and the smooth dynamics, but is independent of $R$. Indeed differentiating the angular polynomial at most $j$ times only introduces $R$-dependent combinatorial constants; its coefficients already have arbitrary subexponential slack. All exponential losses come from derivatives of $f^(- n)$ of orders at most $j$. This independence from $R$ is the second essential exponent separation in the proof.
  Here are the convergence quantifiers. Fix a desired derivative order $j gt.eq 1$ and a desired positive convergence rate $lambda$. Set $r = 2 j + 2$, take $epsilon = 1$, and choose one finite $R$ large enough that
  $ #scale(x: 120%, y: 120%)[\(] b \( R + 1 \) - 1 #scale(x: 120%, y: 120%)[\)] \( 1 - j \/ r \) - \( B_r + 1 \) j \/ r > lambda . $
  The differences $p_(n + 1 \, R) - p_(n \, R)$ have the $C^0$ decay in (8.7) and the $C^r$ growth in (8.8). Interior interpolation on the fixed pair $K subset.double K^(+)$ gives
  $ parallel p_(n + 1 \, R) - p_(n \, R) parallel_(C^j \( K \)) lt.eq C e^(- lambda n) . $
  Thus the sequence converges in $C^j \( K \)$ to its already identified uniform limit $q$. Since $j$ is arbitrary, $q$ is smooth. There is no requirement that a single cutoff work for all $j$. If a single sequence converging in the $C^oo$ topology is desired, choose cutoffs $R_k$ which work through order $k$, and choose $n_k$ so large that $parallel p_(n_k \, R_k) - q parallel_(C^k \( K \)) lt.eq 2^(- k)$. This diagonal sequence has that property and still evaluates only finite polynomials. ◻
]

=== 8.4 Nondegeneracy and the strong bundles <nondegeneracy-and-the-strong-bundles>

Smoothness of a leaf label does not by itself make its differential surjective. We use bounded holonomy Jacobians for this final step.

#thm([Lemma 8.7.])[
  (Volume comparison for weak unstable holonomy).  #emph[Between two smooth $m$-dimensional local transversals to the weak unstable foliation, its holonomy $h$ satisfies, locally, 
$ c thin "Vol" \( E \) lt.eq "Vol" \( h \( E \) \) lt.eq C thin "Vol" \( E \) $

 for measurable sets $E$, with $0 < c lt.eq C < oo$.]
] <smooth:holonomy-volume>

#proof[
  Strong unstable holonomy between smooth transversals is absolutely continuous with locally bounded positive Jacobian; applying the same statement to inverse holonomy supplies the reciprocal bound. This is the bounded-Jacobian theorem for horospheric foliations #cite(label("Ballmann1995")) Appendix, Theorem 5.1 and Definition 3.3. We explain the passage to the weak foliation.
  Thicken each transversal for a short interval by the flow, using a fixed time translate of the target if necessary. The resulting smooth $\( m + 1 \)$-dimensional submanifolds are transversals to the strong unstable foliation. On suitably small flow boxes, strong holonomy has the form
  $ H \( a \, t \) = \( h \( a \) \, t + tau \( a \) \) . $
  This follows from flow invariance and uniqueness of the crossing; $tau$ need only be continuous. Choose a fixed short interval $I$ so that $H$ is defined on $E times I$ for every $E$ in a smaller source patch. In product coordinates, its image has the interval $I + tau \( h^(- 1) \( y \) \)$ above each $y in h \( E \)$. Fubini’s theorem gives product volume $\| I \| "Vol" \( h \( E \) \)$. The smooth volume densities of both flow-box parametrizations are bounded above and below. The strong holonomy comparison applied to $E times I$ proves the displayed weak comparison. A finite chain of boxes proves the same assertion along any compact holonomy path. ◻
]

#thm([Theorem 8.8.])[
  (Smoothness of the Anosov splitting).  #emph[In the finite alternative of Theorem 46, the actual bundles $E^u$ and $E^s$ are smooth on $S M$.]
] <smooth:splitting>

#proof[
  Fix a base point $x$ on the universal cover. On its direction sphere, the restriction $q \|_(S_x tilde(M))$ is locally the weak unstable holonomy to $A$, followed by the smooth coordinate map $q_A$. Both are genuine $m$-dimensional transversals: a weak unstable tangent vector with zero spatial projection is zero, and $T A = E^s$ is complementary to $E^u xor bb(R) X$. The restriction is a local homeomorphism, by the endpoint parametrizations. By Proposition 67 it is smooth, and by Lemma 68 it satisfies a positive lower volume comparison on every smaller patch.
  Its derivative cannot be singular. Use smooth coordinate charts on the source sphere and the target, with volume densities bounded above and below. If the derivative at a point had rank less than $m$, choose a unit target direction perpendicular to its image. Differentiability then places the image of a coordinate ball of radius $r$ in a box with widths $O \( r \)$ in the other $m - 1$ directions and $o \( r \)$ in that direction. Its volume is $o \( r^m \)$, contradicting the fixed positive lower volume comparison for these balls. Thus $d q$ is surjective at every point of $cal(U)$. The smooth bundle $ker d q$ has dimension $m + 1$ and contains the tangent spaces of the actual weak unstable leaves, since $q$ is constant on each such smooth leaf. The dimensions agree, so
  $ ker d q = E^u xor bb(R) X quad upright("on ") cal(U) . $
  Intersecting with the smooth contact distribution gives the smooth strong unstable bundle
  $ E^u = \( ker d q \) ∩ ker alpha . $
  The coordinate patches of the full typical strong stable axis cover all past endpoints except $eta$. A second typical axis with a distinct future endpoint covers the omitted endpoint. Such an axis exists because typical points have full smooth measure, whereas a single fixed-future weak leaf has positive codimension. The preceding argument therefore gives smoothness of $E^u$ everywhere on the cover. The flip $v mapsto - v$ exchanges the strong bundles, and hence gives smoothness of $E^s$. These are the actual invariant bundles, so they are deck invariant and descend smoothly to $S M$. ◻
]

== 9 Completion of the proof <sec:completion>

Theorem 69 supplies the global smoothness required by Proposition 5. We first prove that classical implication, then assemble the entropy-rigidity theorem and its converse.

#proof[
  Smoothness of the weak stable distribution lets us apply the theorem of Benoist–Foulon–Labourie #cite(label("BenoistFoulonLabourie1992")) Theorem 2. It supplies a smooth conjugacy to a negatively curved locally symmetric geodesic flow on the unit tangent bundle of a closed manifold $\( M_0 \, g_0 \)$, with the scale absorbed in the model metric. We first explain how their general contact formulation leads to this geodesic conclusion: its finite-cover and closed-one-form qualifications #cite(label("BenoistFoulonLabourie1992")) Theorem 1bis and Sections 7.1–7.5 reduce to a constant time change on finite covers. The geodesic specialization in Section 7.5.3 gives a torsion-free group and hence a manifold model. After explaining that reduction, we recover the base metric from contact volume and minimal entropy rigidity.
  For $n gt.eq 3$, the sphere-bundle exact sequence gives $pi_1 \( S M \) tilde.eq pi_1 \( M \)$ because $S^(n - 1)$ is simply connected, and the same holds on the symmetric model. Hence finite covers of these unit tangent bundles come from finite base covers.
  On $S M_0$, a canonical time density is $a_0 + beta \( X_0 \) > 0$, where $a_0 > 0$ and $beta$ is a closed one-form on $S M_0$. Its period in a conjugacy class $gamma$ is
  $ a_0 ell_0 \( gamma \) + integral_gamma beta . $
  Geodesic periods agree for inverse classes. The group isomorphism induced by the conjugacy respects inversion, whereas the integral of $beta$ changes sign. Thus its integral vanishes on every closed geodesic lift. Since $pi_1 \( S M_0 \) tilde.eq pi_1 \( M_0 \)$, these lifts, including iterates, represent every nontrivial conjugacy class in $S M_0$. All periods of $beta$ therefore vanish, and $beta = d b$. The orbit shift
  $ x mapsto phi.alt_(b \( x \) \/ a_0)^0 \( x \) $
  carries $X_0 \/ \( a_0 + X_0 b \)$ to $X_0 \/ a_0$. It is a diffeomorphism: its orbit derivative is positive, and its bounded time displacement makes it onto on nonperiodic orbits and degree one on periodic orbits. This removes the exact correction.
  We therefore have, on finite covers when necessary, a diffeomorphism $Psi$ with $Psi_(*) X_g = a X_0$ for a constant $a > 0$. Strong stable and unstable distributions are carried to their counterparts. Evaluation on these distributions and on $X_g$ gives
  $ Psi^(*) alpha_0 = a alpha_g \, #h(2em) Psi^(*) #scale(x: 120%, y: 120%)[\(] alpha_0 and \( d alpha_0 \)^(n - 1) #scale(x: 120%, y: 120%)[\)] = a^n alpha_g and \( d alpha_g \)^(n - 1) . $
  The fiber integral of contact volume is the same universal multiple of base Riemannian volume on both sides. Consequently
  $ "Vol" \( g_0 \) = a^n "Vol" \( g \) \, #h(2em) h_(upright("top")) \( g \) = a h_(upright("top")) \( g_0 \) . $
  The bases are aspherical, so the induced group isomorphism is realized by a base homotopy equivalence. In particular, $H_n \( M_0 \; bb(Z) \) tilde.eq H_n \( M \; bb(Z) \) = bb(Z)$, because the source base is oriented. Hence $M_0$ is orientable, and this equivalence has degree of absolute value one.
  Topological entropy agrees with volume entropy in negative curvature #cite(label("Manning1979")); see also #cite(label("Leuzinger2006"), form: "prose") Main Theorem, parts (a)–(b). Set $hat(g) = a^2 g$ and write $h_(upright("vol"))$ for volume entropy. The scaling identities give
  $ "Vol" \( hat(g) \) = "Vol" \( g_0 \) \, #h(2em) h_(upright("vol")) \( hat(g) \) = h_(upright("vol")) \( g_0 \) . $
  The normalized equality case of minimal entropy rigidity now gives a Riemannian covering from $\( M \, hat(g) \)$ to $\( M_0 \, g_0 \)$ #cite(label("BessonCourtoisGallot1995")) Theorem 8.1 and Proposition 8.2. For the Cayley case we use the corrected determinant estimate and equality argument in #cite(label("Ruan2024"), form: "prose") arXiv version 1, final paragraph of Section 3 and Section 4.4. Thus $g$ is homothetic to the symmetric metric, and local symmetry descends from the covers. One may alternatively use the direct smooth-foliation conclusion of #cite(label("BessonCourtoisGallot1995"), form: "prose") Corollary 9.17 with the same Cayley correction. ◻
]

#proof[
  Suppose first that the entropies are equal. Proposition 4 provides the transported conormal volumes. Theorem 13 constructs their coherent formal affine fields. Proposition 32 and Theorem 46 give the algebraic alternative. Proposition 61 excludes its infinite-dimensional case. In the finite-dimensional case, Theorem 69 proves that $E^s$ and $E^u$ are smooth on all of $S M$. Proposition 5 therefore gives $nabla^g R_g = 0$.
  Conversely, suppose that $nabla^g R_g = 0$. Completeness makes the simply connected cover globally symmetric. Strict negative curvature excludes nontrivial products, compact type and flats of dimension two; the cover is therefore of noncompact type and rank one #cite(label("Gorodski2021")) Theorem 1.3.5, Section 1.6 and Section 3.3. Its isotropy is transitive on unit tangent directions #cite(label("EschenburgSymmetricSpaces")) Section 9, Theorem 9 and its rank-one consequence. Together with homogeneity, this shows that the curvature operator has the same negative eigenvalue list at every unit tangent vector. Parallel curvature makes that operator constant in a parallel normal frame along each geodesic. The unstable Riccati solution is $U \( v \) = sqrt(- R_v)$, the positive definite square root. Thus $J = "tr" U$ is a constant, say $h_0$. By Proposition 4, or directly by the entropy formula and inequality, Liouville volume is an equilibrium state for $- J$ and this potential has pressure zero. Since $- J = - h_0$ is constant, $h_(upright("top")) \( phi.alt_1 \) = h_0 = h_(m_L) \( phi.alt_1 \)$. Both implications are unchanged by finite isometric covers and overall rescaling. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
