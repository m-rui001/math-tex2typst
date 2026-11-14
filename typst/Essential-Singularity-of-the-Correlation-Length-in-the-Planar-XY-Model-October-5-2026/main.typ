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

#align(center)[#text(size: 16pt, weight: "bold")[Essential Singularity of the Correlation Length \
in the Planar XY Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The planar XY model describes unit vectors interacting through the cosine of their angle difference.
  Its transition is expected to differ sharply from an ordinary power-law critical point:
  on the massive side, the correlation length diverges exponentially in the inverse square root of the distance to
  criticality. We prove this asymptotic, with a single limiting constant,
  for the square-lattice model with its original cosine interaction.

For $R in bb(N)$, let $Lambda_R = \[ - R \, R \]^2 ∩ bb(Z)^2$ and let $E_R$ contain each unordered
  nearest-neighbor edge of $Lambda_R$ once. At inverse temperature $b > 0$, the free-boundary measure is

#[#set math.equation(numbering: n => "(1.1)")
 $ 1 / Z_(R \, b) exp #h(-0.16667em) (b sum_({ u \, v } in E_R) cos \( theta_u - theta_v \))
   product_(u in Lambda_R) frac(d theta_u, 2 pi) \, wide theta_u in bb(R) \/ \( 2 pi bb(Z) \) . $ <eq:spin-law>]

There are no exterior edges. Write $e_1 = \( 1 \, 0 \)$ and define

#[#set math.equation(numbering: n => "(1.2)")
 $ C_b \( r \) = lim_(R arrow.r oo) bb(E)_(R \, b)^(upright("free")) cos \( theta_0 - theta_(r e_1) \) \, wide
   m \( b \) = lim_(r arrow.r oo) - 1 / r log C_b \( r \) \, wide b_c = inf { b > 0 : m \( b \) =
   0 } . $ <eq:mass-definition>]

The thermodynamic limit precedes the limit in $r$. We use the standard existence of these limits and the facts
  $0 < b_c < oo$, $m \( b_c \) = 0$, and $0 < m \( b \) < oo$ for $0 < b < b_c$;
  see the correlation inequalities and phase-transition results discussed below.
  The axis correlation length in the massive phase is $xi \( b \) = m \( b \)^(- 1)$.

#thm([Theorem 1.1.])[
  #emph[For the model (1.1), there is a constant $A_(upright("XY")) in \( 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(1.3)")
 $ lim_(b arrow.t b_c) sqrt(b_c - b) thin log xi \( b \) = A_(upright("XY")) . $ <eq:main-limit>]

]
] <thm:main>

The temperature parameter in this limit is exactly the coefficient $b$ in (1.1).
  The constant depends on this normalization and is not evaluated in closed form.

=== 1.1 Context and preceding results <context-and-preceding-results>

Berezinskii predicted a low-temperature phase with algebraically decaying correlations [4].
  Kosterlitz and Thouless identified vortex binding as the mechanism of the transition [10].
  Kosterlitz’s renormalization analysis predicted the essential singularity of the correlation length [9].
  The quadratic flow underlying that prediction also underlies our argument.
  Its integration is explicit; the mathematical difficulty is to justify how the original temperature moves the
  microscopic model across the critical trajectory, and to recover the infinite-volume mass from the resulting scale.

Fröhlich and Spencer established the low-temperature regime of slow decay for plane rotators and the associated
  vortex-binding mechanism [7]. The modern current and loop approach of van Engelenburg and Lis gives an
  elementary proof of the planar XY phase transition and a useful exponential-versus-polynomial correlation
  dichotomy [18]. Their loop representation and finite-size criterion are used in our final passage from height
  fluctuations to spin correlations. The underlying correlation inequalities go back to Ginibre and to the
  Lieb–Rivasseau bounds for plane rotators [8,12,17].

Aizenman, Harel, Peled, and Shapiro developed a complementary height-level-set approach for the Villain and XY
  models, using in particular the lattice-Gaussian inequality of Regev and Stephens-Davidowitz [1,16].
  Lammers proved an exact relation between spin and dual-height correlation lengths [11] Theorem 1.
  Durand and Lammers further express the XY mass through the right derivative at zero slope of the dual-height
  free energy [5] Theorem 1.4. The issue here is to control height fluctuations on scales diverging together with
  the temperature. Rigorous renormalization-group analyses include Falco’s critical small-activity Coulomb gas and
  Bauerschmidt, Park, and Rodriguez’s Gaussian scaling limits for the high-temperature discrete Gaussian model
  [6,2,3]. These results concern different hypotheses from the ordinary cosine XY model at its fixed critical
  temperature.

Two companion works provide the critical inputs for the present proof.
  The first identifies the critical correlation exponent and the critical coefficient of the dual height field
  [14]. The second establishes the logarithmic correction to the critical correlation and develops the analytic
  activity map used here [15]. In the height normalization specified in Section 2,
  the critical coefficient is $8 pi$. We use the companions’ finite-graph comparisons, critical height limits,
  and analytic map estimates at their stated scope. The extension to a shrinking temperature neighborhood,
  the nonzero temperature response, and the conversion of a moving finite-scale profile into the near-critical
  mass are proved below.

=== 1.2 Proof strategy and new estimates <proof-strategy-and-new-estimates>

The proof separates the determination of a scale from its interpretation as a correlation length.
  This separation allows the analytic activity map to be used only while its coordinates are small.

The first task is to make the temperature a controlled variable in that map.
  After averaging heights over cells of side $s$, we prove analytic initialization on a complex disk of radius
  proportional to $s^(- 2)$ about $b_c$. A Poisson representation controls changes of physical weights on the
  finitely many comparison graphs. For complex parameters, we compare unnormalized physical factors to a nearby
  real law and retain the same quadratic regulator. Only local scalar normalizers are inverted.
  Interpolation between the real smallness estimate and a complex majorant then preserves the small activity bound.

At scale $L^j$, the two scalar coordinates $x_j$ and $y_j$ measure, respectively,
  a quadratic gradient perturbation and the first Fourier harmonic of the coarse height weight.
  After normalization, their leading recursion is

#[#set math.equation(numbering: n => "(1.4)")
 $ \( x \, y \) mapsto \( x - y^2 \, med y - x y \) . $ <eq:intro-map>]

The remaining coordinates contract. At criticality, $\( x_j \, y_j \) = \( 1 \, 1 \) \/ j + O \( log j \/ j^2 \)$.
  Differentiating in the original parameter $b$, we prove

#[#set math.equation(numbering: n => "(1.5)")
 $ 1 / j thin partial_b \( x_j \, y_j \) \|_(b = b_c) arrow.r cal(P) \( 1 \, - 1 \/ 2 \) \, wide
   0 < cal(P) < oo . $ <eq:intro-response>]

The positivity of $cal(P)$ is essential. It follows from a finite-volume lower bound on the derivative of a height
  variance. Comparing common physical observables allows derivatives from different observation scales to be
  joined without identifying their different remainder spaces.

Put $delta = sqrt(b_c - b)$ and let $w = delta j$ be the scaled logarithmic length.
  A comparison of finite differences on overlapping histories gives the initial condition for the rescaled
  coordinates $X = x \/ delta$, $Y = y \/ delta$ and their limiting flow

#[#set math.equation(numbering: n => "(1.6)")
 $ X' = - Y^2 \, wide Y' = - X Y \, wide X \( w \) = k cot \( k w \) \, quad Y \( w \) = k csc \( k w \) \, quad
   k = sqrt(3 cal(P)) . $ <eq:intro-flow>]

The flow reaches its outgoing pole at $T = pi \/ k$. We prove that the discrete trajectory reaches any
  sufficiently small fixed outgoing level at an index $j_e$ satisfying $delta j_e arrow.r T$.
  Thus the relevant spatial scale is $L^(T \/ delta)$, where $L$ is the fixed block ratio of the map.

The second task is to identify this scale with $xi \( b \)$.
  Let $a_m \( b \)$ be the variance coefficient of an affine height test on a free square of side $m$.
  Along a sequence $b arrow.t b_c$, compactness and cutting comparisons produce a nonincreasing profile
  $cal(A) \( w \)$ at scales $w = delta log_L m$. We establish Gaussian height limits in each continuity window,
  including the pinned geometries needed for spin duality. A relative growth estimate for a positive phase
  coefficient excludes intermediate profile values. The torus diagnostics before and at the exit then force

#[#set math.equation(numbering: n => "(1.7)")
 $ cal(A) \( w \) = 8 pi quad \( 0 < w < T \) \, wide cal(A) \( w \) = 0 quad \( w > T \) . $ <eq:intro-profile>]

Figure 1 relates the limiting flow to this height profile.

Below $T$, positive pinned-height covariance requires loops of macroscopic diameter and hence a correlation length
  of at least the corresponding exponential scale. Above $T$,
  the vanishing height coefficient makes fixed circulation tilts arbitrarily inexpensive.
  A stack of annuli gives arbitrarily strong polynomial decay at those scales;
  the Lieb–Rivasseau finite-size criterion then gives an upper bound on $xi \( b \)$.
  Both bounds have the same limiting logarithmic scale. In particular,

#[#set math.equation(numbering: n => "(1.8)")
 $ A_(upright("XY")) = \( log L \) pi / sqrt(3 cal(P)) . $ <eq:amplitude>]

Although the intermediate coordinates depend on the chosen block construction,
  the left side is determined by (1.1) and (1.2).

Section 2 develops the finite-graph estimates. Section 3 states the analytic map inputs and proves the temperature
  extension. Section 4 establishes (1.5) and the passage time.
  Section 5 identifies the moving-scale height profile, and Section 6 completes the transfer to the mass.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.262), (0, 3.733), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 3.733), [#text(size: 9pt)[$X"/"k,#h(0.3333em) Y"/"k$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.9), (4.856, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.856, 1.9), [#text(size: 9pt)[$"kw"$]], anchor: "west", padding: 0.1176cm)
  line((4.461, 0.301), (4.461, 3.577), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((4.461, 1.9), [#text(size: 9pt)[$pi$]], anchor: "north-west", padding: 0.1176cm)
  content((2.231, 1.9), [#text(size: 9pt)[$pi"/"2$]], anchor: "north", padding: 0.1176cm)
  line((0.3692, 3.366), (0.4068, 3.224), (0.4444, 3.105), (0.4819, 3.005), (0.5195, 2.918), (0.5571, 2.843), (0.5947, 2.776), (0.6323, 2.717), (0.6698, 2.665), (0.7074, 2.617), (0.745, 2.574), (0.7826, 2.535), (0.8202, 2.498), (0.8577, 2.465), (0.8953, 2.434), (0.9329, 2.406), (0.9705, 2.379), (1.008, 2.354), (1.046, 2.33), (1.083, 2.308), (1.121, 2.287), (1.158, 2.267), (1.196, 2.248), (1.234, 2.23), (1.271, 2.213), (1.309, 2.196), (1.346, 2.18), (1.384, 2.165), (1.421, 2.15), (1.459, 2.136), (1.497, 2.122), (1.534, 2.108), (1.572, 2.095), (1.609, 2.082), (1.647, 2.07), (1.684, 2.058), (1.722, 2.046), (1.76, 2.034), (1.797, 2.023), (1.835, 2.012), (1.872, 2.001), (1.91, 1.99), (1.948, 1.979), (1.985, 1.968), (2.023, 1.957), (2.06, 1.947), (2.098, 1.937), (2.135, 1.926), (2.173, 1.916), (2.211, 1.905), (2.248, 1.895), (2.286, 1.885), (2.323, 1.874), (2.361, 1.864), (2.399, 1.854), (2.436, 1.843), (2.474, 1.833), (2.511, 1.822), (2.549, 1.811), (2.586, 1.8), (2.624, 1.789), (2.662, 1.778), (2.699, 1.766), (2.737, 1.755), (2.774, 1.743), (2.812, 1.731), (2.849, 1.718), (2.887, 1.706), (2.925, 1.693), (2.962, 1.679), (3, 1.665), (3.037, 1.651), (3.075, 1.636), (3.113, 1.621), (3.15, 1.605), (3.188, 1.588), (3.225, 1.571), (3.263, 1.553), (3.3, 1.534), (3.338, 1.514), (3.376, 1.493), (3.413, 1.471), (3.451, 1.448), (3.488, 1.423), (3.526, 1.396), (3.563, 1.367), (3.601, 1.337), (3.639, 1.304), (3.676, 1.268), (3.714, 1.229), (3.751, 1.186), (3.789, 1.138), (3.827, 1.086), (3.864, 1.028), (3.902, 0.9617), (3.939, 0.8868), (3.977, 0.8009), (4.014, 0.7012), (4.052, 0.5838), (4.09, 0.4433), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((0.3692, 3.417), (0.4068, 3.28), (0.4444, 3.167), (0.4819, 3.071), (0.5195, 2.99), (0.5571, 2.92), (0.5947, 2.859), (0.6323, 2.806), (0.6698, 2.758), (0.7074, 2.716), (0.745, 2.679), (0.7826, 2.645), (0.8202, 2.614), (0.8577, 2.587), (0.8953, 2.562), (0.9329, 2.539), (0.9705, 2.518), (1.008, 2.498), (1.046, 2.481), (1.083, 2.464), (1.121, 2.449), (1.158, 2.436), (1.196, 2.423), (1.234, 2.411), (1.271, 2.4), (1.309, 2.39), (1.346, 2.38), (1.384, 2.371), (1.421, 2.363), (1.459, 2.356), (1.497, 2.349), (1.534, 2.342), (1.572, 2.336), (1.609, 2.331), (1.647, 2.325), (1.684, 2.321), (1.722, 2.316), (1.76, 2.312), (1.797, 2.309), (1.835, 2.306), (1.872, 2.303), (1.91, 2.3), (1.948, 2.298), (1.985, 2.296), (2.023, 2.294), (2.06, 2.293), (2.098, 2.292), (2.135, 2.291), (2.173, 2.29), (2.211, 2.29), (2.248, 2.29), (2.286, 2.29), (2.323, 2.291), (2.361, 2.292), (2.399, 2.293), (2.436, 2.294), (2.474, 2.296), (2.511, 2.298), (2.549, 2.3), (2.586, 2.303), (2.624, 2.305), (2.662, 2.309), (2.699, 2.312), (2.737, 2.316), (2.774, 2.32), (2.812, 2.325), (2.849, 2.33), (2.887, 2.336), (2.925, 2.342), (2.962, 2.348), (3, 2.355), (3.037, 2.363), (3.075, 2.371), (3.113, 2.38), (3.15, 2.389), (3.188, 2.399), (3.225, 2.41), (3.263, 2.422), (3.3, 2.435), (3.338, 2.449), (3.376, 2.463), (3.413, 2.48), (3.451, 2.497), (3.488, 2.516), (3.526, 2.537), (3.563, 2.56), (3.601, 2.585), (3.639, 2.613), (3.676, 2.643), (3.714, 2.676), (3.751, 2.714), (3.789, 2.756), (3.827, 2.803), (3.864, 2.856), (3.902, 2.916), (3.939, 2.986), (3.977, 3.066), (4.014, 3.161), (4.052, 3.273), (4.09, 3.408), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, miter-limit: 10))
  content((3.124, 0.808), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$cot ("kw")$]]]])])
  content((2.485, 2.875), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$csc ("kw")$]]]])])
  line((1.661, 2.068), (1.903, 1.992), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  content((2.229, -0.362), [#text(size: 9pt)[Limiting scalar trajectory]])
  line((7.2, 0.3), (12.13, 0.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((12.13, 0.3), [#text(size: 9pt)[$w$]], anchor: "west", padding: 0.1176cm)
  line((7.2, 0.3), (7.2, 4.08), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((7.2, 4.08), [#text(size: 9pt)[$cal(A) (w)$]], anchor: "south", padding: 0.1176cm)
  line((9.883, 0.3), (9.883, 3.52), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((9.883, 0.3), [#text(size: 9pt)[$T= pi"/"k$]], anchor: "north", padding: 0.1176cm)
  line((7.287, 3.1), (9.883, 3.1), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((9.883, 0.342), (11.7, 0.342), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((9.883, 3.1), radius: (0.06525, 0.0644), fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((9.883, 0.342), radius: (0.06525, 0.0644), fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((7.2, 3.1), [#text(size: 9pt)[$8 pi$]], anchor: "east", padding: 0.1176cm)
  content((8.462, 0.552), [#text(size: 8pt)[Positive pinned#linebreak()covariance]], anchor: "south", padding: 0.1176cm)
  content((11.06, 1.28), [#text(size: 8pt)[Vanishing#linebreak()height variance]], anchor: "south", padding: 0.1176cm)
  content((9.447, -0.344), [#text(size: 9pt)[Limiting height coefficient]])
})],
  caption: [Figure 1: The two limits that determine the correlation length. Left: the explicit rescaled trajectory, with $k = sqrt(3 cal(P))$, has its outgoing pole at $w = T$. Right: the finite-scale free-height coefficient has a step at the same value. No value at the jump is asserted. Positive covariance below $T$ and circulation estimates above $T$ give the two bounds on $delta log_L xi \( b \)$. ],
) <fig:flow-profile>

== 2 Finite height laws and their temperature response <sec:finite>

The temperature dependence needed in the proof is already visible on a finite graph.
  We first recall the comparison inequalities for the dual heights,
  and then derive a lower bound for the derivative of a height variance.
  The lower bound will later distinguish a change of temperature from a displacement along the critical trajectory.

=== 2.1 Conventions and finite comparisons <conventions-and-finite-comparisons>

For a finite primary height graph $G = \( V \, E \)$, orient its edges once and write $nabla_e h = h_(e^(+)) -
  h_(e^(-))$. The height spacing is $2 pi$ and its edge weight is

#[#set math.equation(numbering: n => "(2.1)")
 $ p_b \( k \) = e^(- b) I_k \( b \) \, wide sum_(k in bb(Z)) p_b \( k \) e^(t k) =
   exp { b \( cosh t - 1 \) } . $ <eq:bessel-weight>]

In particular, $p_b$ is the distribution of the difference of two independent Poisson variables of mean $b \/ 2$.
  Each unoriented edge contributes one factor. The primary Laplacian $A_G$ is normalized by

#[#set math.equation(numbering: n => "(2.2)")
 $ chevron.l v \, A_G v chevron.r = sum_(e in E) \( nabla_e v \)^2 \, $ <eq:primary-energy>]

where all discrete pairings use counting measure. We never replace $A_G$ by $A_G \/ 4$.

A free connected component of the height law is taken modulo its common $2 pi bb(Z)$ translations.
  A representative can be pinned at one vertex when evaluating an invariant test.
  If Gaussian observations confine the constant, all its translates are instead summed.
  On a torus we use single-valued periodic heights, hence zero winding,
  with the same common translation convention. Its height space is $2 pi
  bb(Z)^V \/ \( 2 pi bb(Z) upright(bold(1)) \)$; choosing mean-zero representatives means projecting this lattice
  onto the mean-zero space, rather than requiring each projected coordinate to remain an integer multiple of $2
  pi$. Additional primary pins always have value zero unless an affine law is specified.

Fourier expansion of the spin interaction identifies the free spin partition function with the divergence-free
  integer-current sum. Rotating currents onto the dual edges gives the height law with exterior face height zero.
  A spin insertion at two vertices changes the divergence to two opposite unit sources;
  subtracting a unit current along a path between them gives a height law with an integral connection on the
  crossed dual edges. This is the free-boundary duality of [14] Lemma 2.1.
  It applies to the edge convention in (2.1); the factors $e^b$ cancel in every partition ratio.

We shall use the following finite comparison rules. A centered law may include nonnegative quadratic penalties in
  real linear observations, independent Gaussian observation noises, and centered linear equalities.
  An affine law has the same precision and parallel constraint space but may have an integral edge connection,
  nonzero equality values, or shifted observation centers.

#thm([Lemma 2.1.])[
  (Finite comparisons).  #emph[For the finite height laws just described,
    increasing centered precision decreases centered covariances and real moment generating functions.
    The covariance in an affine law, also after a real linear tilt,
    dominates the corresponding centered covariance. A shifted-to-centered partition ratio is at most one and
    decreases when the same positive precision is added to both laws.
    The latter monotonicity also holds with a fixed real linear statistic inserted in the exponent of the affine
    numerator.]
  #emph[Centered invariant characteristic coefficients are positive and increase with precision.
    The Hessian of their logarithm at any phase is bounded below by its Hessian at zero.
    A characteristic test on a freely translated component is invariant when the sum of its coefficients is an
    integer; a real linear test on such a component must have coefficient sum zero. For a centered real linear test $X$,
#[#set math.equation(numbering: n => "(2.3)")
 $ log bb(E) e^X gt.eq 1 / 2 "Var" \( X \) . $ <eq:laplace-lower>]

 The same centered moment and characteristic comparisons imply that, as $b$ increases,
   centered covariances and real transforms increase, whereas centered invariant characteristic coefficients decrease.]
] <lem:comparisons>

#proof[
  The lattice-Gaussian inequality underlying these comparisons is due to Regev and Stephens-Davidowitz [16];
    related extensions to annealed integer-valued Gaussian fields appear in [1] Appendix D.
    The statements at fixed $b$ are [14] Lemma 2.2. We recall the approximation which also gives the last
    assertion. Replace each primary edge by $N$ bonds in series,
    with normalized lattice-Gaussian bond weight $\( b \/ \( 2 N \) \)^(k^2)$.
    On compact sets of real $t$ its transform is
  $ frac(sum_k \( b \/ \( 2 N \) \)^(k^2) e^(t k), sum_k \( b \/ \( 2 N \) \)^(k^2)) = 1 + b /
    N \( cosh t - 1 \) + O \( N^(- 2) \) . $
  The full chain therefore converges to (2.1), including all fixed exponential moments.
    Matching endpoints, cycle constraints, period constraints,
    and the additional observations are positive quadratic forms or limits of such forms on the enlarged lattice.
    The finite lattice-Gaussian comparison inequalities apply there.
    Increasing $b$ decreases the bond precision $2 log \( 2 N \/ b \)$,
    proving the required monotonicities before passage to the limit.
    A spanning-forest parametrization and full-chain exponential moments dominate the sums on each fixed primary
    graph. This justifies the limit, including fixed polynomial insertions and real tilts.
    Confined constants are dominated by their observation penalties; unconfined constants are factored out. ◻
]

If $X = sum_e w_e nabla_e h$, its #emph[reference cost] is $sum_e w_e^2$,
  minimized over flows representing the same test. For $X = chevron.l h \, f chevron.r$ with $sum_x f_x = 0$,
  the minimum is

#[#set math.equation(numbering: n => "(2.4)")
 $ G_G \( f \) = chevron.l f \, A_G^(+) f chevron.r . $ <eq:reference-cost>]

The analogous definition uses a grounded Laplacian when primary vertices are pinned.

#thm([Lemma 2.2.])[
  (Uniform reference bounds).  #emph[Fix a compact interval $I subset \( 0 \, oo \)$.
    In every centered finite height law above, for $b in I$ and each fixed $r gt.eq 1$,
#[#set math.equation(numbering: n => "(2.5)")
 $ "Var" \( X \) lt.eq C_I sum_e w_e^2 \, wide bb(E) \| X \|^r lt.eq
   C_(I \, r) #scale(x: 180%, y: 180%)[\(] sum_e w_e^2 #scale(x: 180%, y: 180%)[\)]^(r \/ 2) . $ <eq:reference-moments>]

 For every fixed $t$, the transform $bb(E) exp \( t X \/ \( sum_e w_e^2 \)^(1 \/ 2) \)$ is bounded uniformly in
   the graph. More generally, if $max_e \| t w_e \| lt.eq K$, then
#[#set math.equation(numbering: n => "(2.6)")
 $ log bb(E) e^(t X) lt.eq C_(I \, K) t^2 sum_e w_e^2 . $ <eq:bounded-flow-mgf>]

 Zero tests are interpreted separately.]
] <lem:reference-cost>

#proof[
  Release the centered endpoint, curl, period, and observation constraints in the full-chain construction of
    Lemma 2. The comparison bounds the transform by a product of independent whole-chain transforms.
    Their limiting logarithm is $b sum_e \( cosh \( 2 pi t w_e \) - 1 \)$,
    which is bounded by the right side of (2.6) when the arguments are bounded.
    The same bound holds uniformly in sufficiently fine subdivision.
    For a flow normalized by its Euclidean norm every coefficient has modulus at most one.
    Fixed exponential moments then give (2.5) and the normalized transform bound.
    This is the argument of [14] Lemma 2.3; its constants are uniform on $I$. ◻
]

=== 2.2 Poisson insertions and a finite-volume continuity estimate <poisson-insertions-and-a-finite-volume-continuity-estimate>

Retain the two Poisson variables $U_e \, V_e$ for every oriented edge in (2.1), and impose $U_e - V_e =
  nabla_e h \/ \( 2 pi \)$. The joint unnormalized weight is

$ product_(e in E) e^(- b) frac(\( b \/ 2 \)^(U_e + V_e), U_e ! V_e !) $

with the same height constraints and observation penalties as before.
  Let $N = sum_e \( U_e + V_e \)$ and $M = \| E \|$. For $ell gt.eq 0$, write $\( N \)_ell =
  N \( N - 1 \) dots.h.c \( N - ell + 1 \)$, with $\( N \)_0 = 1$.

#thm([Lemma 2.3.])[
  (Factorial insertions).  #emph[In a centered finite height law,
    including centered primary pins and centered observation penalties,
#[#set math.equation(numbering: n => "(2.7)")
 $ bb(E)_b \( N \)_ell lt.eq \( b M \)^ell . $ <eq:factorial-bound>]

 If the observation centers are prescribed real values, the unnormalized factorial insertion is bounded by
   $\( b M \)^ell$ times the corresponding zero-observation centered sum.]
] <lem:factorial>

#proof[
  Expand $\( N \)_ell$ as the sum over ordered choices of $ell$ Poisson units, recording their edges and signs.
    Removing those units leaves a partition sum with an integral edge connection and the same primary height
    variables, pins, and observation penalties. In particular the remaining Poisson differences obey the shifted
    curl and period constraints determined by that connection. Every removed unit contributes $b \/ 2$.
    Lemma 2 bounds each shifted sum by its centered zero-observation counterpart.
    Summing the $\( 2 M \)^ell$ choices proves the assertion.
    Repeated choices of the same edge cause no difficulty: falling factorials are exactly the factors canceled by
    removing several units from its Poisson factorial. ◻
]

For a fixed finite graph with observations $eta$, let $mu_b^eta$ denote its unnormalized joint weight,
  including the Poisson variables, and let $Z_b^0$ denote its centered zero-observation mass.
  The graph may have centered hard pins; these are included in both objects.

#thm([Lemma 2.4.])[
  (Finite-volume parameter continuity).  #emph[Fix $b_0 > 0$ and a compact set $K$ of complex observation vectors
    on a fixed finite list of observation shapes. There are constants $c \, C > 0$ such that,
    for $eta in K$ and $\| b - b_0 \| M lt.eq c$,
#[#set math.equation(numbering: n => "(2.8)")
 $ frac(parallel mu_b^eta - mu_(b_0)^eta parallel_(upright("TV")), Z_(b_0)^0) lt.eq C \| b -
   b_0 \| M . $ <eq:finite-tv>]

 Here total variation for complex weights means the sum of their absolute values.
   The constants can be uniform over any prescribed finite family of graph topologies and observation shapes.
   In particular, each centered normalizer is nonzero on a disk of radius $c \/ M$ about $b_0$.]
] <lem:finite-perturbation>

#proof[
  The parameter likelihood in the augmented variables is exactly
  #[#set math.equation(numbering: n => "(2.9)")
   $ exp { - \( b - b_0 \) M } \( b \/ b_0 \)^N . $ <eq:poisson-likelihood>]
  Expand the second factor in falling factorials. For real observations,
    Lemma 4 bounds the absolute sum of its positive-order terms, divided by $Z_(b_0)^0$, by
  $ sum_(ell gt.eq 1) frac(\| b - b_0 \|^ell, ell ! b_0^ell) \( b_0 M \)^ell = e^(\| b - b_0 \| M) - 1 . $
  The scalar exponential in (2.9) has the same bound. For $eta = eta_1 + i eta_2$,
    the absolute observation penalty is its real-$eta_1$ penalty times $e^(parallel eta_2 parallel^2 \/ 2)$,
    uniformly bounded on $K$. This proves (2.8). At zero observation it gives $\| Z_b^0 \/ Z_(b_0)^0 -
    1 \| < 1 \/ 2$ after decreasing $c$, hence nonvanishing. All sums are analytic on compact parameter sets by
    the same expansion. ◻
]

=== 2.3 A strict response bound <a-strict-response-bound>

The upper bound in Lemma 3 alone does not imply that changing $b$ moves the long-scale height coefficient.
  The following inequality supplies the needed strict response using only finite graphs.

#thm([Lemma 2.5.])[
  (Temperature response).  #emph[Let $G$ be a finite connected graph with the centered Bessel height law,
    and let $f eq.not 0$ have coefficient sum zero. Set $X = chevron.l h \, f chevron.r$ and $G \( f \) =
    chevron.l f \, A_G^(+) f chevron.r$. For $b$ in a compact interval $I subset \( 0 \, oo \)$,
#[#set math.equation(numbering: n => "(2.10)")
 $ frac("Var"_b \( X \)^2, 4 pi^2 b^2 G \( f \)) lt.eq partial_b "Var"_b \( X \) lt.eq
   C_I \| E \| G \( f \) . $ <eq:temperature-response>]

 In particular, these inequalities hold on every zero-winding periodic torus, with constants independent of its size.]
] <lem:response>

#proof[
  Let $C_b$ be the covariance operator on mean-zero tests. For each oriented edge $e$,
    removing one positive Poisson unit gives the shifted height weight
  $ product_(d in E) p_b #scale(x: 120%, y: 120%)[\(] nabla_d h \/ \( 2 pi \) -
    upright(bold(1))_({ d = e }) #scale(x: 120%, y: 120%)[\)] . $
  Let $r_e$ be its partition sum divided by the centered sum, and $v_e$ its mean of $X$.
    Reversing $h$ identifies the negative-removal law with its reflection,
    so its partition ratio is $r_e$ and its mean is $- v_e$. By Lemma 2, $0 < r_e lt.eq
    1$ and each shifted variance is at least $"Var"_b \( X \)$.
  Differentiating the normalized augmented law inserts the score $N \/ b$;
    the deterministic term $- \| E \|$ cancels. Since the centered mean of $X$ is zero,
  $ partial_b "Var"_b \( X \) = b^(- 1) "Cov"_b \( X^2 \, N \) . $
  Removing a positive or negative unit separately now gives the exact identity
  #[#set math.equation(numbering: n => "(2.11)")
   $ partial_b "Var"_b \( X \) = sum_(e in E) r_e #scale(x: 120%, y: 120%)[\(] "Var"_(e \, +) \( X \) -
     "Var"_b \( X \) + v_e^2 #scale(x: 120%, y: 120%)[\)] gt.eq sum_(e in E) r_e v_e^2 . $ <eq:response-insertions>]
  The same removal with the insertion $X$ gives
  $ bb(E)_b \[ \( U_e - V_e \) X \] = b r_e v_e . $
  As $nabla_e h = 2 pi \( U_e - V_e \)$, this is
  #[#set math.equation(numbering: n => "(2.12)")
   $ nabla_e \( C_b f \) = 2 pi b r_e v_e . $ <eq:response-gradient>]
  Discrete integration by parts and Cauchy–Schwarz yield
  $ "Var"_b \( X \)^2 & = chevron.l nabla A_G^(+) f \, nabla C_b f chevron.r^2\
 & lt.eq G \( f \) sum_e \| nabla_e C_b f \|^2 lt.eq 4 pi^2 b^2 G \( f \) sum_e r_e v_e^2 . $
  Together with (2.11), this proves the lower bound. For the upper bound,
    Lemma 4 gives $bb(E) N^2 lt.eq \( b M \)^2 + b M$, while Lemma 3 gives $bb(E) X^4 lt.eq C_I G \( f \)^2$.
    Cauchy–Schwarz in the score identity proves $\| partial_b "Var"_b \( X \) \| lt.eq C_I M G \( f \)$,
    since $M gt.eq 1$ and $b in I$. The finite-volume analyticity established above justifies every
    differentiation. No bound on the inverse precision of a subdivided Gaussian chain is used. ◻
]

== 3 Analytic entry and the activity coordinates <sec:entry>

We now connect the finite height laws to the small-activity map of [15].
  The map itself acts on analytic functions and is independent of the temperature of the physical input.
  The point requiring a new argument is initialization: the critical construction must remain small on a parameter
  disk large enough to differentiate with respect to $b$. We prove this on a disk of radius proportional to
  $s^(- 2)$, where $s$ is the observation-cell side. All constants depending on fixed geometric parameters are
  chosen before $s$ tends to infinity.

=== 3.1 The reference field and the initialization norm <the-reference-field-and-the-initialization-norm>

The critical free-height coefficient is $a = 8 pi$ by [14] Section 6.
  Fix $alpha = sqrt(a)$ and $omega = 2 pi \/ alpha$. The reference field has covariance $A^(+)$,
  so that $alpha$ times the reference field has height covariance $a A^(+)$.
  We keep this reference, including $alpha$, fixed when $b$ varies.

Partition the primary graph into whole square cells of side $s$, let $B_s$ average over each cell,
  and introduce the observations

#[#set math.equation(numbering: n => "(3.1)")
 $ eta = B_s h + e \, $ <eq:observations>]

where the components of $e$ are independent standard Gaussians.
  On a retained graph $G$, let $Z_(G \, b) \( eta \)$ be the height partition sum with penalty
  $exp \( - parallel B_s h - eta parallel^2 \/ 2 \)$, and define the fixed reference energy

#[#set math.equation(numbering: n => "(3.2)")
 $ E_G \( eta \) = min_(v in bb(R)^(V \( G \))) { a^(- 1) parallel nabla v parallel_G^2 + parallel B_s v -
   eta parallel^2 } . $ <eq:observation-energy>]

Each component constant is free in this minimization. For a retained cell face $f = \( Q \, Q' \)$, put $w_f =
  eta_(Q') - eta_Q$ and use the entire cutoff

#[#set math.equation(numbering: n => "(3.3)")
 $ chi_s \( z \) =
   frac(integral_(- s)^s e^(- \( z - t \)^2 \/ 2) thin d t, integral_(- s)^s e^(- t^2 \/ 2) thin d t) \, wide
   hat(Z)_(G \, b) \( eta \) = Z_(G \, b) \( eta \) product_f chi_s \( w_f \) . $ <eq:entry-cutoff>]

A deleted face loses both its primary bonds and its cutoff factor.

Here are the reference split and norm used in [15]. For an integer $u gt.eq 1$, set

$ P_u \( cos t \) = (frac(sin \( u t \/ 2 \), u sin \( t \/ 2 \)))^64 \, wide sans(P)_u = P_u \( 1 - A \/ 64 \) \, $

with removable values understood, and put

#[#set math.equation(numbering: n => "(3.4)")
 $ C_(< u) = A^(- 1) \( I - sans(P)_u \) \, wide Gamma_u = A^(- 1) \( sans(P)_u - sans(P)_(L u) \) \, wide
   C_(gt.eq u) = A^(+) sans(P)_u . $ <eq:reference-split>]

The first two quotients have polynomial continuations at the constant mode.
  They have finite range and are positive. Their constant modes can be integrated because the final common mean is
  uniform modulo $omega$.

At side $u$, a polymer is a finite set $X$ of $u$-blocks connected for the fixed adjacency of [15].
  Its occupied support is the union of those blocks. The field dependence of $K \( X \, phi.alt \)$ is confined to
  this support together with the prescribed microscopic collar of [15] Proposition 4.1,
  whose width is at most a fixed sufficiently small fraction of $u$.
  This dependence region is distinct from the larger norm padding $D_u \( X \)$,
  which is enlarged to whole observation cells and contains all fixed difference stencils.

We use the bulk symmetry class of [15] Theorem 4.6(i). Its activities are analytic in the field and satisfy

#[#set math.equation(numbering: n => "(3.5)")
 $ K \( X \, - phi.alt \) = K \( X \, phi.alt \) \, wide K \( X \, phi.alt + omega upright(bold(1)) \) =
   K \( X \, phi.alt \) \, wide K \( g X \, g phi.alt \) = K \( X \, phi.alt \) \, $ <eq:bulk-activity-symmetries>]

where $g$ is a compatible block translation or square-lattice rotation or reflection and
  $\( g phi.alt \) \( v \) = phi.alt \( g^(- 1) v \)$. Compatibility means that $g$ preserves the chosen block and
  observation grids. On a torus we impose the corresponding periodic support and covariance rules.
  These identities are complex-linear conditions on the activity; reality on real fields is a separate property.
  The point norm is

#[#set math.equation(numbering: n => "(3.6)")
 $ parallel f parallel_(u \, D) & = max_(v in D) { \| f \( v \) \| \, u \| nabla f \( v \) \| \,
   u^2 \| nabla^2 f \( v \) \| } \,\
\| K \( X \) \|_(u \, phi.alt) & = sum_(r gt.eq 0) frac(h_0^r, r !)
  sup_(parallel f_i parallel_(u \, D_u \( X \)) lt.eq 1) \| D^r
  K \( X \, phi.alt \) \[ f_1 \, dots.h \, f_r \] \| . $ <eq:entry-point-norm>]

Let $ W_u^kappa \( X \, phi.alt \)$ be the ordinary exponential regulator specified in [15] Section 4.2,
  Equations (41)–(43); it controls the bulk gradient energy, its boundary trace, and scaled second differences.
  The additional observation regulator is given explicitly by

#[#set math.equation(numbering: n => "(3.7)")
 $ V_u \( X \, phi.alt \) = 1 / 2 sup_(zeta \, e) {h_(*) E_(D_u \( X \)) #scale(x: 120%, y: 120%)[\(] B_s
   alpha \( phi.alt + zeta \) + e #scale(x: 120%, y: 120%)[\)] -
   p_1^(- 1) \( parallel zeta parallel_(C_(< u))^2 + parallel e parallel^2 \)} . $ <eq:entry-observation-regulator>]

The Cameron norm is taken on the covariance support. With a fixed block weight $A_w > 1$, the activity norm is

#[#set math.equation(numbering: n => "(3.8)")
 $ parallel K parallel_(u \, s) = sup_(X \, phi.alt) A_w^(\| X \|)
   frac(\| K \( X \) \|_(u \, phi.alt),  W_u^kappa \( X \, phi.alt \) e^(V_u \( X \, phi.alt \))) .
   $ <eq:entry-activity-norm>]

Write $ A_(u \, s)^(upright("bulk"))$ for the complex space of activity families satisfying the support and
  symmetry conditions above and having finite norm (3.8). Every activity ball and activity variation below is
  taken in this space or its compatible-torus counterpart. The ordinary regulator is kept exactly as in the cited
  construction; its shell averaging and translation estimates, together with the explicit observation regulator,
  are part of the imported local-map bounds below. Norms with different observation sides $s$ need not be identified.

The cutoff gives a strict large-field reserve. Indeed, adjacent-cell averages have a primary flow representation
  with coefficient bound $C \/ s$ and squared cost $C$. Applying (2.6) with tilts of size at most a fixed multiple
  of $s$, then using the Gaussian tails of $chi_s$, gives uniformly for $b$ in a compact neighborhood of $b_c$

#[#set math.equation(numbering: n => "(3.9)")
 $ e^(E_G \( eta \) \/ 2) frac(hat(Z)_(G \, b) \( eta \), Z_(G \, b) \( 0 \)) lt.eq
   e^(\( 1 - c_(*) \) E_G \( eta \) \/ 2) \, wide eta in bb(R)^(cal(Q) \( G \)) \, $ <eq:entry-large-field>]

for some fixed $c_(*) > 0$ on every retained topology used in the construction.
  More explicitly, transporting each site straight to its translate in a neighboring cell gives flows $Phi_f$ with

$ max_e lr(|sum_f t_f Phi_f \( e \)|) lt.eq C s^(- 1) max_f \| t_f \| \, wide
  sum_e lr(|sum_f t_f Phi_f \( e \)|)^2 lt.eq C sum_f t_f^2 . $

The tilted affine comparison applies also at prescribed observations;
  releasing the height and noise equalities gives a bound $exp \( C sum_f t_f^2 \)$.
  Choose $t_f$ proportional to $"sgn" \( w_f \) min \( \| w_f \| \, s \)$.
  For $\| w_f \| > s$ the cutoff supplies the remaining quadratic decay.
  Finally $E_G \( eta \) lt.eq C sum_f w_f^2$, by cell interpolation.
  These are the steps in [15] Lemma 4.4 and Equation (57); the only physical transform used there is $exp {
  b \( cosh \( 2 pi t \) - 1 \) }$, whose constants are uniform on the chosen $b$ interval.

Choose fixed parameters with strict inequalities

#[#set math.equation(numbering: n => "(3.10)")
 $ 1 - c_(*) < h_1 < h_(*) < 1 \/ p_2 \, wide 1 < p_1 < p_2 . $ <eq:entry-reserves>]

There is also slack in the exponent of $ W$. Choose the fixed analytic radius, field-strip widths,
  and a sufficiently large dyadic $L$ as in [15]; then choose the activity weights and the small map domain.
  Fix its coloring period $q$, choose a sufficiently large dyadic $R_0$, and set $P_0 = R_0^5$.
  An admissible observation side satisfies

#[#set math.equation(numbering: n => "(3.11)")
 $ q R_0 s = L^(j_0) . $ <eq:entry-side>]

The index $j_0$ is absolute, rather than reset to zero at entry.
  The choice of $R_0$ remains subject to any further fixed small-tube requirements made below;
  all such choices precede the limits in $s$ and $b$.

=== 3.2 A parameter disk for initialization <a-parameter-disk-for-initialization>

We use the finite initialization of [15] with no magnetic or compulsory component.
  On a compatible finite torus it represents the cutoff law exactly, up to a field-independent scalar,
  after averaging $e$ and the Gaussian field with covariance $C_(< L^(j_0))$.
  The corresponding plane activities are defined by the same local formulas.
  For clarity, the partition functional of an activity is

$ cal(Z)_u \( K \; phi.alt \) = sum_(V subset cal(B)_u) product_(X in "Comp" \( V \)) K \( X \, phi.alt \) \, $

where components use the fixed block adjacency and the empty product is one.
  The representation identifies the averaged cutoff interaction with a scalar times $cal(Z)_(L^(j_0))$.

#thm([Proposition 3.1.])[
  (Analytic initialization).  #emph[For every sufficiently small $rho > 0$,
    the fixed choices above can be made so that there exist $c_(R_0) > 0$ and $s_0 <
    oo$ with the following property. For every admissible $s gt.eq s_0$,
    the ordinary plane and compatible-torus entry activities $K_s \( b \)$ are Banach analytic on
#[#set math.equation(numbering: n => "(3.12)")
 $ \| b - b_c \| < c_(R_0) s^(- 2) \, $ <eq:entry-parameter-disk>]

 and take values in $ A_(L^(j_0) \, s)^(upright("bulk"))$ or its compatible-torus counterpart,
   with norm at most $rho$. They are real on real fields when $b$ is real.
   Their support, symmetry, and local copying identities agree with those at criticality throughout the complex
   parameter disk. For real parameters in this disk the cutoff partition representation is exact.
   On a smaller concentric disk, for each fixed $r gt.eq 1$,
#[#set math.equation(numbering: n => "(3.13)")
 $ parallel partial_b^r K_s \( b \) parallel_(L^(j_0) \, s) lt.eq C_(R_0 \, r) s^(2 r) . $ <eq:entry-cauchy>]

]
] <prop:entry>

#proof[
  We first describe the parts of the finite expansion whose estimates have to be extended.
    The geometry and algebra are those of [15] Sections 4.6–4.7, Theorem 4.6;
    only their physical weights change with $b$. The observation cells are partitioned into tiles of side
    comparable to $R_0$. A finite colored sequence of isolation events deletes the remaining bonds between tiles.
    At an event with open patch $o_i$ and cut patch $c_i$, its proxy is
  #[#set math.equation(numbering: n => "(3.14)")
   $ cal(B)_i \( b \, eta \) = C_i \( b \) e^(- \( E_(o_i) \( eta \) - E_(c_i) \( eta \) \) \/ 2) \, wide
     C_i \( b \) = frac(Z_(o_i \, b) \( 0 \), Z_(c_i \, b) \( 0 \)) . $ <eq:entry-proxy>]
  One writes the original factor as its proxied cut factor plus their difference.
    Selecting the difference marks that event. Later events within its fixed neighborhood are skipped.
    After the finite sequence, undeleted intertile bonds lie in the union of the marked neighborhoods.
    We call each connected part of this union a halo. Outside the halos,
    an isolated tile contributes either one or its normalized factor minus one. The latter choice is a selected tile.
  The remaining Gaussian mismatch is expanded in links $e^(b_ell w_f w_(f')) - 1$, with
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| b_ell \| lt.eq C e^(- c \( R_0 + d_ell \)) . $ <eq:entry-links>]
  Here $d_ell$ records the entire tagged path length, including winding on a torus.
    A link covers at most $C \( 1 + d_ell \/ R_0 \)$ entry blocks.
    An individual pattern $pi$ consists of marked events, selected tiles, and links,
    with their complete occupied cover $X \( pi \)$. Write $l \( pi \)$ for the number of marks and selected
    tiles. Each of these physical items uses at most $C_(R_0)$ observation cells and $C_(R_0) s^2$ primary edges.
    Link-only cells carry no physical height factor. All identical factors off the affected halos cancel before
    the pattern is defined. Its denominator is a product of the affected local scalars $C_i \( b \)$ and
    isolated-tile normalizers $Z_(Q \, b) \( 0 \)$. In particular,
    a centered partition function of an arbitrarily large halo is not a denominator of a defining pattern.
  We keep every Gaussian energy in (3.14) fixed. Thus the finite algebra, the link coefficients,
    the occupied covers, and the copying identities remain valid with the actual parameter in every physical
    factor and scalar normalizer. It remains to bound and sum the resulting patterns.
  ===== 3.2.1 Real parameters. <real-parameters.>
  In the critical proof a positive expansion of each marked difference introduces a conditional factor
  #[#set math.equation(numbering: n => "(3.16)")
   $ d_i \( eta \, gamma \) =
     frac(\| K_(o_i) \( eta \, gamma \) - cal(B)_i \( eta \) K_(c_i) \( eta \, gamma \) \|, K_(o_i) \( eta \,
     gamma \) + cal(B)_i \( eta \) K_(c_i) \( eta \, gamma \)) lt.eq 1 . $ <eq:entry-mark-fraction>]
  The kernels prescribe the primary guard values $gamma$ surrounding the event.
    Exterior factors common to the two choices cancel in this ratio.
    The halo is then cut into boxes of side $P_0$ in cell units.
    Only guards whose testing neighborhoods lie inside a box are retained.
    Affine comparison bounds the joint observation and guard densities before and after cutting.
    The resulting centered zero-guard ratio is bounded by a product of local separated-pin comparisons.
    Gaussian shape errors have small face-square coefficients.
    This is precisely the positive-topology and seam accounting in [15] Equations (71)–(74).
  After $R_0 \, P_0$, the field strips, and the large-field threshold are fixed,
    the compact-data part of this argument concerns finitely many box topologies.
    Each has at most $C_(R_0) s^2$ primary edges. A box is called good when the sum of squared differences on its
    underlying cell faces is below that fixed threshold. Period recentering places its observations in a fixed
    compact set. The critical inputs in [15] Proposition 2.3 and Equations (75)–(80) give on these compact sets:
    bounds on normalized positive box factors, separated-pin restoration bounds,
    and a small fixed list of moments of the fractions (3.16).
    The list includes all Hölder orders required by the finite number of marks which a $P_0$-box can contain.
    All inequalities are used with strict slack.
  Lemma 5, applied to these finite graphs, preserves the required tolerances when $\| b - b_c \| lt.eq
    c_(R_0) s^(- 2)$. For centered pin interactions one applies the lemma to each pinned sum itself,
    so that a small absolute change in an unpinned normalization is never used as a relative estimate for a rare
    pin event. On real compact observation sets,
  $ Z_(G \, b) \( eta \) \/ Z_(G \, b) \( 0 \) = e^(- parallel eta parallel^2 \/ 2) bb(E)_(G \, b \, 0)
    e^(chevron.l eta \, B_s h chevron.r) gt.eq e^(- parallel eta parallel^2 \/ 2) \, $
  which converts normalized total-variation estimates to the needed relative estimates.
  The conditional fractions require some care because the guards have an increasing number of primary vertices.
    For one retained event, use the two complete adjacent positive box topologies and let $A_b \( gamma \) \,
    B_b \( gamma \)$ be their joint weights, incorporating the proxy and cutoff scalars.
    Their total masses are comparable, uniformly on the fixed compact set:
    at zero observation this follows from the open and zero-guard brackets and the bounded separated-pin
    interaction; for other compact observations it follows from the preceding lower bound and the upper affine
    comparison. Lemma 5 controls both arrays in $ell^1$, in units of either total mass.
    For nonnegative $A \, B \, A' \, B'$,
  $ \( A + B \) lr(|frac(\| A - B \|, A + B) - frac(\| A' - B' \|, A' + B')|) lt.eq
    2 \( \| A - A' \| + \| B - B' \| \) \, $
  with the continuous convention at a zero denominator. The same estimate for the $r$th power has an additional
    factor at most $r$. Consequently every required fixed moment of $d_i$ changes by a quantity tending to zero
    with $c_(R_0)$. No estimate uniform in individual guard values is needed.
    The compact imaginary-observation estimates after pinning strips are preserved by the complex version of Lemma 5.
  The remaining inputs are uniform finite comparisons and (3.9).
    They control the boxes outside the compact set with the same reserves.
    The deterministic Gaussian localization, link estimates, and counting do not involve $b$.
    Repeating the real and complex-field interpolation of [15] Lemma 4.7, Equations (85)–(89) therefore gives,
    on fixed field disks with radius larger than the polarization radius needed in (3.6),
  #[#set math.equation(numbering: n => "(3.17)")
   $ \| F_pi \( b \; phi.alt + z f \) \| lt.eq C^(l \( pi \)) e^(- c R_0 l \( pi \)) product_(ell in pi) C
     e^(- c \( R_0 + d_ell \))  W_(L^(j_0))^kappa \( X \, phi.alt \) e^(V_(L^(j_0)) \( X \, phi.alt \)) .
     $ <eq:entry-real-pattern>]
  Here $b$ is real in the parameter interval, $phi.alt$ is real, $parallel f parallel_(L^(j_0) \, D) lt.eq 1$,
    and $\| z \|$ is in that fixed disk. The constants in the exponential gains may have decreased.
  We have extended the small real-parameter bound. To obtain parameter Cauchy estimates we next need an analytic
    bound on a complex disk; this bound need not retain the small factor attached to each physical item.
  ===== 3.2.2 A complex-parameter majorant in the same norm. <a-complex-parameter-majorant-in-the-same-norm.>
  Let $r_s = c_(R_0) s^(- 2)$ and $b_(+) = b_c + r_s$. For $\| b - b_c \| lt.eq r_s$ we have $\| b \| lt.eq
    b_(+)$. On a positive physical branch containing $N_pi$ retained primary edges,
    absolute augmented Poisson weights satisfy
  #[#set math.equation(numbering: n => "(3.18)")
   $ lr(|product_e e^(- b) frac(\( b \/ 2 \)^(U_e + V_e), U_e ! V_e !)|) lt.eq
     e^(\( b_(+) - Re b \) N_pi) product_e e^(- b_(+)) frac(\( b_(+) \/ 2 \)^(U_e + V_e), U_e ! V_e !) .
     $ <eq:complex-poisson-majorant>]
  The physical support count gives $N_pi lt.eq C_(R_0) l \( pi \) s^2$.
    Each local scalar normalizer is nonzero in this disk by Lemma 5; its value and its inverse,
    relative to the corresponding value at $b_(+)$, cost at most a fixed factor.
    There are $O \( l \( pi \) \)$ affected scalars. Expand each marked difference into its two terms and compare
    their unnormalized physical numerators by (3.18), and their local scalar factors separately.
    The result is bounded by $e^(C_(R_0) l \( pi \))$ times the corresponding positive pattern at $b_(+)$.
    At this point one may apply the real positive-topology estimate at $b_(+)$.
    This ordering uses no complex partition function of a large connected halo.
  For a field displacement $z f$ in the fixed field disk, every imaginary observation coordinate is bounded.
    The absolute observation penalty costs $e^(parallel Im eta parallel^2 \/ 2)$ on each physical factor.
    There are at most $C_(R_0) l \( pi \)$ such coordinates, including the local proxies.
    The real quadratic forms satisfy
  $ Re E_G \( eta_1 + i eta_2 \) = E_G \( eta_1 \) - E_G \( eta_2 \) . $
  Their imaginary contributions therefore also cost at most $e^(C_(R_0) l \( pi \))$.
    For the real parts keep the Gaussian shapes combined into the reference mismatch before estimating them.
    It consists of the energy of the actual positive physical topology and the small localized proxy and link
    errors. Thus overlapping proxy patches do not create overlapping broad-energy charges.
  More explicitly, after dropping the fractions $d_i$, the large-field bound may be used on every actual halo
    piece and every separate selected-tile factor. Its broad quadratic cost is
  #[#set math.equation(numbering: n => "(3.19)")
   $ frac(1 - c_(*), 2) sum_B E_B \( eta_1 \) . $ <eq:complex-broad-charge>]
  The actual graphs $B$ are disjoint: selected tiles lie outside the halo graph and are mutually isolated.
    Restricting a trial field for the open energy on $D = D_(L^(j_0)) \( X \)$ to each of them gives $sum_B E_B
    lt.eq E_D$. The remaining proxy, seam, and link costs have small coefficients on underlying face differences
    with bounded per-face sum. The cell flow estimate bounds each such face square by the energy of its two
    underlying cells. Taking $R_0$ large leaves these costs inside the strict gap $h_1 - \( 1 - c_(*) \)$.
    Hence the complete positive real-variable quadratic form $q_pi$ obeys
  #[#set math.equation(numbering: n => "(3.20)")
   $ q_pi \( eta_1 \) lt.eq 1 / 2 h_1 E_D \( eta_1 \) . $ <eq:complex-form-domination>]
  This is the form domination of [15] Equation (82), with all physical boxes now charged broadly.
    Its coefficient and its ambient open energy are unchanged.
  To see that the determinant is still harmless, write the averaging variables as a standard Gaussian vector
    $zeta$ and $eta_1 = d + sans(S) zeta$. Set $M_pi = nabla_zeta^2 \[ p_1 q_pi \( d + sans(S) zeta \) \]$.
    The covariance contraction for the observation energy and (3.20) give $0 lt.eq M_pi lt.eq p_1 h_1 I < I$.
    Gaussian completion is exactly
  #[#set math.equation(numbering: n => "(3.21)")
   $ #scale(x: 120%, y: 120%)[\(] bb(E) e^(p_1 q_pi \( d + sans(S) zeta \))
     #scale(x: 120%, y: 120%)[\)]^(1 \/ p_1) = det \( I - M_pi \)^(- 1 \/ \( 2 p_1 \)) exp sup_zeta
     {q_pi \( d + sans(S) zeta \) - frac(parallel zeta parallel^2, 2 p_1)} . $ <eq:complex-entry-completion>]
  The supremum is bounded by the same $V_(L^(j_0)) \( X \, phi.alt \)$ in (3.7).
    A broad energy has rank at most its number of observation coordinates, as in [15] Equations (83)–(84).
    There are at most $C_(R_0) l \( pi \)$ physical coordinates; proxy errors keep their small coefficients.
    Link-only cells enter through the reserved link cost, not a broad rank. The trace bound is consequently
  #[#set math.equation(numbering: n => "(3.22)")
   $ "tr" M_pi lt.eq C_(R_0) l \( pi \) + C sum_(ell in pi) e^(- c \( R_0 + d_ell \)) "poly" \( d_ell \) .
     $ <eq:complex-entry-trace>]
  A face contrast has uniformly bounded reference variance by the cell flow bound, which proves the second term,
    even for arbitrarily long links. Since $parallel M_pi parallel$ is bounded away from one, $-
    log det \( I - M_pi \) lt.eq C "tr" M_pi$. Hölder’s inequality handles the ordinary regulator with its fixed
    exponent reserve. Translation by the bounded real part of $z f$ costs $e^(C \| X \|)$.
    Such a factor can be absorbed by weakening the gains of (3.15),
    because each link occupies only $O \( 1 + d_ell \/ R_0 \)$ blocks.
    The exponential gain per physical item is not retained in this coarse estimate.
  We have obtained, on the same field disks and in the same regulators,
  #[#set math.equation(numbering: n => "(3.23)")
   $ \| F_pi \( b \; phi.alt + z f \) \| lt.eq e^(C_(R_0) l \( pi \)) product_(ell in pi) C
     e^(- c \( R_0 + d_ell \))  W_(L^(j_0))^kappa \( X \, phi.alt \) e^(V_(L^(j_0)) \( X \, phi.alt \)) .
     $ <eq:entry-complex-pattern>]
  The domination also proves analyticity of each pattern after Gaussian averaging.
    All scalar denominators are local and nonzero, and the integrals converge absolutely on compact parameter and
    field disks.
  ===== 3.2.3 Recovering smallness in the parameter disk. <recovering-smallness-in-the-parameter-disk.>
  For fixed $pi \, phi.alt \, z \, f$, apply the two-constants theorem to the upper and lower half-disks $\| b -
    b_c \| < r_s$. On the real diameter use (3.17); on the semicircle use (3.23).
    If $\| b - b_c \| lt.eq theta.alt r_s$, the harmonic measure of the semicircle is at most
    $omega \( theta.alt \)$, where $omega \( theta.alt \) arrow.r 0$ as $theta.alt arrow.b 0$.
    The regulator and a common weakened link product are independent of $b$ and can be divided out.
    The resulting item factor is at most
  $ exp { \[ - \( 1 - omega \( theta.alt \) \) c R_0 + omega \( theta.alt \) C_(R_0) + C \] l \( pi \) } . $
  Choose $theta.alt > 0$, depending only on $R_0$, so that its exponent is at most $- c R_0 l \( pi \) \/ 2$,
    after enlarging $R_0$ if needed. Thus the small pattern bound holds on the reduced complex parameter disk.
    For patterns containing only links, both boundary estimates already have the common link gains.
  The fixed field disk has radius exceeding the polarization radius in (3.6).
    Cauchy’s formula and polarization therefore sum all field derivatives with that norm.
    Connected summation over the complete occupied covers, with the gains just proved,
    is the same absolutely convergent sum as in [15] Theorem 4.6.
    Its norm is at most $C e^(- c R_0)$, uniformly in $s$, the absolute entry index, and compatible volume.
    The same bound on compact parameter disks makes the sum Banach analytic.
    Absorb $theta.alt$ into $c_(R_0)$ and choose $R_0$ to reach the prescribed $rho$.
    Parameter Cauchy estimates give (3.13). The occupied covers retain every field dependency,
    as in the critical construction. The covariant placement and color rules, reference Gaussian averaging,
    and field-negation identities are unchanged when only the physical weights and centered scalar normalizers
    depend on $b$. Thus (3.5) and the prescribed collar rules hold throughout the parameter disk.
    The exact finite algebra and real positive normalizers give the partition representation for real $b$,
    and the same local formulas give the copying identities. ◻
]

=== 3.3 The map at fixed reference <the-map-at-fixed-reference>

The initialization puts the entire activity into the remainder.
  At a later side $L^j$, separate two singleton functions on each regular block:

$ e_B^0 \( phi.alt \) = 1 / 2 sum_(v in B) sum_(e = plus.minus e_1 \, plus.minus e_2) \| nabla_e
  phi.alt \( v \) \|^2 \, wide c_B^alpha \( phi.alt \) = L^(- 2 j) sum_(v in B) cos \( alpha phi.alt_v \) . $

Their coefficients are denoted by $t_j \/ 2$ and $z_j$; the remaining activity is $cal(R)_j$.
  Block covariance makes these coefficients independent of the block.
  Field negation excludes the sine singleton, and square symmetry makes the retained neutral gradient quadratic
  isotropic. These are the two scalar directions in the bulk weak map of [15] Section 5.1.
  The exact map integrates the shell $Gamma_(L^j)$, removes designated field-independent factors,
  and reexpresses the result in the same subset partition algebra.
  The following interface collects the activity estimates used in the rest of the paper.

#thm([Proposition 3.2.])[
  (Activity map).  #emph[For all sufficiently large absolute indices $j$,
    the map on $\( t \, z \, cal(R) \) in bb(C)^2 times  A_(L^j \, s)^(upright("bulk"))$,
    with the occupied-support and designated-localization conventions of [15] Proposition 4.1,
    preserves the bulk symmetry class and is analytic on a fixed ball $\| t \| + \| z \| +
    parallel cal(R) parallel_(L^j \, s) < rho_(upright("map"))$. Its linear part is
#[#set math.equation(numbering: n => "(3.24)")
 $ \( t \, z \, cal(R) \) mapsto \( t + P_j^t cal(R) \, lambda_j z + P_j^z cal(R) \, sans(C)_j cal(R) \) \, quad
   parallel sans(C)_j parallel lt.eq theta_0 < 1 \, quad lambda_j = 1 + O \( e^(- c j) \) \, $ <eq:map-triangular>]

 with uniformly bounded rows $P_j^t \, P_j^z$. The nonlinear part and its Taylor derivatives have quadratic bounds
   with uniform constants.]
  #emph[There are analytic normal coordinates $\( u \, Z \, Q \)$, uniform in the entry side,
    such that the pure Gaussian curve is $\( u \, 0 \, 0 \)$ and the map fixes $u$ on that curve.
    With $b_(*) = 2 log L$ and a constant $H > 0$, define
#[#set math.equation(numbering: n => "(3.25)")
 $ x = b_(*) u \, wide y = sqrt(b_(*) H) thin Z \, wide W = \( x \, y \) . $ <eq:balanced-coordinates>]

 The coordinate changes obey
#[#set math.equation(numbering: n => "(3.26)")
 $ t = u + O \( u^2 + parallel Q parallel \) \, wide z = \( 1 + O \( e^(- c j) \) \) Z +
   O \( u^2 + parallel Q parallel \) \, wide cal(R) = O \( u^2 \) + Q \, $ <eq:coordinate-comparison>]

 with the differentiated analytic bounds of these orders. In a fixed small tube,
#[#set math.equation(numbering: n => "(3.27)")
 $ W_(+) & = W + \( - y^2 \, - x y \) + cal(E)_j \( W \, Q \) \,\
\| cal(E)_j \( W \, Q \) \| & lt.eq C { j^(- 2) \| W \|^2 + \| W \|^3 + \( \| W \| + parallel Q parallel \)
  parallel Q parallel } \,\
parallel Q_(+) parallel & lt.eq theta parallel Q parallel + C \| W \|^2 \, wide theta < 1 . $ <eq:normal-map>]

 The error is an analytic function with the corresponding Taylor bounds on all fixed derivatives.]
  #emph[On a separately initialized compatible torus with a fixed range buffer,
    the two singleton coefficients copy the plane coefficients through its stop.
    The torus remainder has its own contraction and analytic quadratic bound.
    Its derivative at zero has no singleton forcing. All constants are uniform in the stop, the entry side,
    and their associated norms.]
] <prop:map>

#proof[
  The exact activity map and its uniform norm bounds are [15] Proposition 4.1;
    the triangular form is [15] Equation (93). We recall the coordinate construction to specify the derivative
    bounds being used. Put $ell_j = product_(h gt.eq j) lambda_h = 1 + O \( e^(- c j) \)$ and $sans(C)_(h : j) =
    sans(C)_(h - 1) dots.h.c sans(C)_j$. The balanced linear coordinates are
  $ T = t + sum_(h gt.eq j) P_h^t sans(C)_(h : j) cal(R) \, wide Z = ell_j z +
    sum_(h gt.eq j) ell_(h + 1) P_h^z sans(C)_(h : j) cal(R) . $
  The series converge geometrically. At the chosen entry, initialize an exact Gaussian interaction
    $exp \( d sum_B e_B^0 \/ 2 \)$ and iterate the same map. Its balanced gradient is $T_j^g \( d \) = d +
    O \( d^2 \)$ and its remainder is $cal(R)_j^g \( d \) = O \( d^2 \)$, uniformly on a common complex disk.
    Define $u = \( T_j^g \)^(- 1) \( T \)$ and $Q = cal(R) - cal(R)_j^g \( u \)$, as in [15] Equations (95), (99),
    and (101). This gives (3.26); in particular its linear remainder rows are bounded,
    while derivatives of its quadratic scalar terms are $O \( \| u \| \)$.
  The parity estimates of [15] Lemma 5.2 give leading scalar terms $- H_j Z^2$ and $- b_j u Z$,
    with no nonconstant term on the Gaussian curve. Their remainders have the differentiated orders used in
    (3.27). Moreover [15] Lemma 5.3 gives $\| H_j - H \| + \| b_j - b_(*) \| lt.eq C \( 1 + j \)^(- 2)$.
    Rescaling by (3.25) yields the displayed map. Terms with a small coefficient multiplying $Q$ are absorbed into
    a slightly larger contraction constant. The copying assertion and the separate torus contraction are part of
    the same local-map statement; no equality between plane and torus remainders is required. ◻
]

The triangular contraction also has a useful elementary consequence.
  In equivalent scalar and remainder norms, the derivative of the full map on a sufficiently small tube has norm
  at most $1 + gamma$, for any prescribed $gamma > 0$. To see this, first use the balanced coordinates,
  whose scalar linear rows contain no remainder, and choose a product norm with the fixed remainder contraction.
  At zero the operator norm is at most one. Uniform analytic derivative bounds then give the claim on a small
  tube. A torus remainder driven by these scalar coordinates satisfies the corresponding growth bound by convolution.

=== 3.4 Finite torus observables and comparison of observation grids <finite-torus-observables-and-comparison-of-observation-grids>

Fix a sufficiently large dyadic range buffer $D_0$ and, for an absolute stop $j$, use the torus of side

#[#set math.equation(numbering: n => "(3.28)")
 $ n_j = D_0 L^j . $ <eq:stopping-tori>]

Each such torus is initialized separately at side $q R_0 s$.
  It has $D_0^2$ blocks at its stop and its singletons copy the plane history.
  The physical cutoff initialization requires $n_j gt.eq s P_0$.
  Define the physical first cosine and its noisy-cell approximation by

#[#set math.equation(numbering: n => "(3.29)")
 $ H_n \( h \) & = n^(- 2) sum_(v in \( bb(Z) \/ n bb(Z) \)^2) h_v cos \( 2 pi v_1 \/ n \) \,\
X_(n \, s) & = chevron.l eta \, f_(n \, s) chevron.r \, wide
  f_(n \, s) \( Q \) = \( s \/ n \)^2 cos \( 2 pi x_(Q \, 1) \/ n \) \, $ <eq:physical-cosine>]

where $x_Q$ is the arithmetic center of the primary sites in $Q$. The origins of all grids agree.
  Both real tests annihilate constants. The phase test is $e^(i macron(eta))$,
  where $macron(eta)$ is the uniform mean of the cell observations, interpreted modulo $2 pi$.
  Set $frak(g) = 1 \/ \( 8 pi^2 \)$ and let

$ v_(n \, s)^0 = chevron.l f_(n \, s) \, \( I + a B_s A^(+) B_s^(*) \) f_(n \, s) chevron.r $

be the observation variance in the fixed Gaussian reference.

#thm([Proposition 3.3.])[
  (Analytic torus observables).  #emph[On a fixed small complex ball of terminal activities,
    the cutoff variance correction and the cutoff phase expectation extend to analytic functions of the activity
    coordinates. If $nu_j = \| t_j \| + \| z_j \| + parallel cal(R)_(j \| j)^(upright("tor")) parallel$, they satisfy
#[#set math.equation(numbering: n => "(3.30)")
 $ hat("Var") \( X_(n_j \, s) \) - v_(n_j \, s)^0 & = kappa_(n_j \, s) t_j +
   O \( parallel cal(R)_(j \| j)^(upright("tor")) parallel + nu_j^2 \) \,\
hat(bb(E)) e^(i macron(eta)) & = p_(j \, s) z_j +
  O \( parallel cal(R)_(j \| j)^(upright("tor")) parallel + nu_j^2 \) . $ <eq:torus-readouts>]

 All fixed activity derivatives have the corresponding Taylor bounds, uniformly in entry and stop.
   The multipliers are positive, bounded above and below, and
#[#set math.equation(numbering: n => "(3.31)")
 $ v_(n \, s)^0 = a frak(g) + O \( s \/ n + n^(- 2) \) \, wide kappa_(n \, s) = a frak(g) +
   O \( s \/ n + n^(- 2) \) . $ <eq:readout-multipliers>]

 At a common absolute stop, the multipliers $p_(j \, s)$ for different entries agree except for their
   mean-observation-noise factor; their relative difference is $O \( \( s_1 \/ n \)^2 + \( s_2 \/ n \)^2 \)$.]
] <prop:readouts>

#proof[
  These are the terminal analytic functionals of [15] Equations (97)–(98), (116)–(119), and (130).
    Their analyticity does not require a scaling limit for the physical input.
    Indeed, on the fixed $D_0^2$-block grid the Gaussian and common-mean integral of the terminal subset sum is
    $1 + O \( D_0^2 nu_j \)$, uniformly on a fixed complex source disk.
    Choose the activity ball so that this error is less than $1 \/ 2$.
    Both normalized numerator and denominator are then analytic and the denominator is nonzero.
  Completing the Gaussian source $w X_(n \, s)$ before entry averaging gives the factor
    $e^(v_(n \, s)^0 w^2 \/ 2)$ and translates the interaction by a microscopic cosine $F \( w \) =
    w gamma_(n \, s) cos \( 2 pi v_1 \/ n \)$. Writing $beta_(n \, s)$ for the cell-average cosine factor,
  $ B_s cos \( 2 pi v_1 \/ n \) = beta_(n \, s) cos \( 2 pi x_(Q \, 1) \/ n \) \, wide gamma_(n \, s) =
    frac(2 v_(n \, s)^0, alpha beta_(n \, s)) \, wide beta_(n \, s) = 1 + O \( \( s \/ n \)^2 \) . $
  The linear gradient singleton contributes $t_j chevron.l F \, A F chevron.r \/ 2$ to the logarithm;
    mean integration removes the first harmonic at linear order.
    Since $chevron.l cos \( 2 pi v_1 \/ n \) \, A cos \( 2 pi v_1 \/ n \) chevron.r = 2 n^2 sin^2 \( pi \/ n \)$,
    this gives the first line and (3.31). The remainder costs its norm and all higher terms cost $O \( nu_j^2 \)$.
  For the phase insertion the common-mean integral instead selects the fundamental singleton. Its coefficient is
  $ p_(j \, s) = D_0^2 / 2 exp { tau_(j \, s) \/ 2 - a D_(upright("tail") \, j) \/ 2 } > 0 \, $
  where $D_(upright("tail") \, j)$ is the diagonal of the retained mean-free covariance and $tau_(j \, s)$ is the
    variance, in height units, of the integrated high mean including the observation noise.
    Both are bounded on the fixed terminal geometry. At the same absolute stop the high covariances telescope to
    the same constant-mode continuation. The only entry-dependent contribution to $tau_(j \, s)$ is the noise
    variance $\( s \/ n \)^2$. This proves the second assertion and the comparison of multipliers.
    Cauchy estimates on a smaller activity ball give all stated derivatives. ◻
]

The next two lemmas permit comparison through these observables without identifying the activity spaces of
  distinct observation grids.

#thm([Lemma 3.4.])[
  (Cutoff error and its derivative).  #emph[For real $b$ in the interval of Proposition 7, and $n gt.eq
    s P_0$ with $log n = o \( s^2 \)$, replacing the original torus expectation by its normalized cutoff
    expectation changes the variance of $X_(n \, s)$ and the phase expectation by at most
#[#set math.equation(numbering: n => "(3.32)")
 $ C n^C e^(- c s^2) . $ <eq:cutoff-derivative-error>]

 The same bound holds for their first $b$ derivatives and for divided differences between any two real parameters
   in that interval.]
] <lem:cutoff-derivative>

#proof[
  The cell-flow proof of (3.9) also bounds the probability that a prescribed face difference exceeds $s \/
    2$ by $C e^(- c s^2)$, uniformly in the compact $b$ interval. On its complement, $1 - chi_s$ has that bound.
    Summing over faces and applying Hölder with the uniform reference moments gives the unnormalized loss for the
    phase and the first two moments of $X_(n \, s)$, as in [15] Lemma 4.4.
    The cutoff mass is consequently $1 - o \( 1 \)$ after normalization by the uncut law.
  To differentiate a normalized expectation, insert the Poisson score $N \/ b$.
    Lemma 4 bounds every fixed moment of $N$ by a fixed power of $n$, uniformly on the parameter interval.
    Apply Hölder to the product of this insertion, the observable, and the cutoff loss.
    The face tail retains a bound $e^(- c' s^2)$, while the other factors cost a power of $n$.
    Differentiating the cutoff normalizer has the same estimate because it is bounded away from zero.
    This proves (3.32) for derivatives. Integrating the derivative bound proves the divided-difference version. ◻
]

#thm([Lemma 3.5.])[
  (Observation-grid comparison).  #emph[After dividing the phase expectation by its deterministic mean-noise
    factor, it is exactly $bb(E) e^(i macron(h))$, independently of $s$.
    After subtracting the independent observation-noise variance and dividing by $beta_(n \, s)^2$,
    the variance of $X_(n \, s)$ differs from $"Var" H_n$ by $O \( \( s \/ n \)^4 \)$.
    Its first $b$ derivative, and its divided differences over a compact real parameter interval, differ by at most
#[#set math.equation(numbering: n => "(3.33)")
 $ C n^2 \( s \/ n \)^4 . $ <eq:grid-derivative-error>]

 The estimates are uniform for compatible grids with $n \/ s$ sufficiently large.
   Cutoff observables incur the additional error in (3.32).]
] <lem:grid-comparison>

#proof[
  The spatial mean of $B_s h$ is exactly the microscopic mean.
    The independent mean noise has variance $\( s \/ n \)^2$, proving the phase identity.
    The profile $B_s^(*) f_(n \, s)$ projects onto the microscopic first cosine with coefficient $beta_(n \, s)$
    and has no first sine component, by reflection around arithmetic cell centers.
    The remaining Fourier modes have frequency-index distance at least $c n \/ s$ from zero.
    Their total squared coefficient norm is at most $C n^(- 2) \( s \/ n \)^2$,
    whereas $A^(+)$ restricted to these modes has norm at most $C s^2$.
    Their reference cost is therefore $O \( \( s \/ n \)^4 \)$.
    Translation invariance of the physical torus law makes distinct Fourier modes exactly orthogonal.
    Thus the variance is the first-cosine variance plus the alias variance, without a cross term.
    The reference bound controls the latter variance. Lemma 6, applied to the alias test,
    controls its derivative by its reference cost times $\| E \| = 2 n^2$.
    The factor $beta_(n \, s)^(- 2)$ is uniformly bounded and independent of $b$.
    Integration gives the divided-difference estimate. ◻
]

=== 3.5 The critical histories and late entry <the-critical-histories-and-late-entry>

We finish the interface by recording exactly which critical information is used later.
  A history means the plane sequence initialized wholly in its remainder and iterated with Proposition 8,
  together with the separately initialized tori at its valid stops.

#thm([Proposition 3.6.])[
  (Critical histories).  #emph[The fixed parameters and entry threshold can be chosen so that there is a family
    $cal(H)^(\( k \))$ at $b = b_c$, with admissible $s_k asymp 2^k$ and entry indices $j_0 \( k \) = O \( k \)$,
    having the following properties. For every fixed $0 < c < c' < 3$, uniformly on $c 2^k lt.eq j lt.eq c' 2^k$,
#[#set math.equation(numbering: n => "(3.34)")
 $ W_j^(\( k \)) = frac(\( 1 \, 1 \), j) + O #h(-0.16667em) (frac(log \( 2 + j \), j^2)) \, wide
   parallel Q_j^(\( k \)) parallel + parallel cal(R)_j^(\( k \)) parallel =
   O \( j^(- 2) \) . $ <eq:critical-asymptotic>]

 The separately initialized torus remainders also satisfy $O \( j^(- 2) \)$ on these stage ranges behind every
   valid later stop in the same history up to $4 dot.op 2^k$.]
  #emph[More generally, for any prescribed sufficiently small tube and any integer bound $J_max \( s \) =
    o \( s^2 \)$, the critical plane history at an admissible side $s$ stays in that tube through $J_max \( s \)$,
    for all large $s$. Every stage of its separately initialized tori with valid stops below $J_max \( s \)$ stays
    in the corresponding small ball. The choices of geometric parameters are independent of $s$ and $J_max$.]
] <prop:critical>

#proof[
  The family and its confinement through $4 dot.op 2^k$ are [15] Proposition 5.1 and Lemma 5.5.
    We explain both the second-coordinate precision and the extension to longer critical histories.
  In the proof of that proposition, let $Y_j = \| Z_j \|$ for the spliced critical histories.
    Equations (135)–(137) of [15] give
  $ u_j asymp Y_j asymp j^(- 1) \, wide u_j = sqrt(H \/ b_(*)) thin Y_j + O \( j^(- 2) \) \, wide
    u_j = \( b_(*) j \)^(- 1) + O \( log \( 2 + j \) \/ j^2 \) . $
  The overlap bounds in [15] Lemma 5.7 transfer both coordinates between histories with $O \( j^(- 2) \)$ error on
    the indicated fractional ranges. The phase formula [15] Equation (130),
    together with positive physical characteristic coefficients and the exponentially small cutoff loss,
    selects $Z_j > 0$ there. Rescaling by (3.25) gives (3.34).
    The plane remainder bound is part of the same proposition and its odd cone estimate.
    For a larger torus, its separate contraction is driven by the copied scalar sequence.
    Contracting from an earlier fractional range suppresses its initial contribution exponentially and sums an
    $O \( j^(- 2) \)$ forcing, giving the asserted bound at every intermediate stage.
  For the last assertion, the physical input to critical confinement is [15] Lemma 5.4.
    It gives the critical torus Gaussian first-cosine limit and factorization with the mean phase.
    For any fixed tolerance, first $P_0$ and then $s$ can be chosen so that the variance and mixed phase
    discrepancies are below that tolerance for every compatible $n gt.eq s P_0$.
    No rate of convergence in $n$ is asserted or needed. The mixed phase functional has a nonzero multiplier on
    $z$, as shown in [15] Equations (118)–(119). The variance multiplier in Proposition 9 is nonzero as well.
  Suppose there were a first exit from a tube of radius $rho$.
    Before that exit both plane and torus remainder contractions give
  $ parallel cal(R)_j parallel + parallel cal(R)_(j \| j)^(upright("tor")) parallel lt.eq
    C theta^(j - j_0) rho_(upright("ent")) + C rho^2 \, $
  where $rho_(upright("ent"))$ is the entry norm. At the candidate exit the bounded map leaves all states inside a
    fixed multiple of the tube, so the terminal observables are still defined.
    The variance and mixed phase identities then bound the two singleton coefficients by
    $C \( rho_(upright("ent")) + rho^2 + delta_(upright("phys")) + delta_(upright("cut")) \)$.
    Here $delta_(upright("phys"))$ is the uniform critical discrepancy just described.
    The number of initial indices with $n_j < s P_0$ is at most
    $max \( 0 \, ceil.l log_L \( R_0^4 \/ \( D_0 q \) \) ceil.r \)$, independent of $s$;
    their amplification is absorbed by the small entry norm. Finally, uniformly for $j lt.eq J_max \( s \)$,
  $ delta_(upright("cut")) lt.eq C n_j^C e^(- c s^2) lt.eq exp { O \( J_max \( s \) \) - c s^2 } arrow.r 0 . $
  Choose $rho$ small, then the entry and physical discrepancies small relative to $rho$, and finally $s$ large.
    The preceding bound excludes the first exit. Separate torus contractions give the same conclusion at all
    earlier stages of each valid stopped torus. This is the finite-history argument of [15] Lemma 5.5 with
    precisely the larger range permitted by the cutoff estimate. ◻
]

== 4 Temperature response and the passage through the small-activity region <sec:trajectory>

The activity estimates now determine the scale at which the height variance first departs from its critical value.
  The essential point is to determine how the physical temperature crosses the critical trajectory.
  We first prove a nonzero linear response in its growing direction,
  then follow a real temperature perturbation until it reaches a fixed small exit level.
  All coordinates and Gaussian reference parameters in this section are those of Proposition 8;
  only the input activities depend on the physical inverse temperature $b$.
  The comparison of changing entries follows the physical-readout method of [15] Lemma 5.7 and the proof of
  Proposition 5.1; here we apply it also to temperature derivatives and secants.

Write $cal(H)^(\( k \))$ for the critical families in Proposition 12, with observation side $s_k asymp 2^k$.
  The index $j$ is always the absolute block index. In particular the corresponding physical torus has side $n_j =
  D_0 L^j$, even when the entry side changes. We use

$ W_j = \( x_j \, y_j \) \, wide x_j = b_(*) u_j \, wide y_j = sqrt(b_(*) H) thin Z_j \, wide b_(*) = 2 log L . $

The symbol $y_j$ here denotes the harmonic coordinate, rather than an observation field.
  A superscript $upright("tor")$ on a remainder always refers to the separately initialized torus at its specified stop.

We fix the order of the smallness choices. Enlarge the remainder contraction constant in Proposition 8 slightly to
  a number $theta_1 < 1$, and choose $r in \( theta_1 \, 1 \)$. Choose a constant $C_(*)$ so large that

#[#set math.equation(numbering: n => "(4.1)")
 $ C_(*) log L > 1000 \, wide 2 / C_(*) < frac(- log r, 100) . $ <eq:traj-parameter-choice>]

Next choose $gamma > 0$ with

$ gamma C_(*) < 1 / 100 \, wide gamma < frac(- log r, 100) . $

Choose a sufficiently small activity tube, so that the derivative of the plane map in balanced coordinates has
  norm at most $e^gamma$ at every point of that tube. This is possible because its linearization is the identity
  on the two scalar coordinates and a contraction on the remainder.
  The nonlinear remainder terms are absorbed while keeping their contraction at most $theta_1$.
  Finally choose the entry parameter and its lower scale threshold as in Propositions 7 and 12, for this tube.
  Every choice in this paragraph is fixed independently of $b$.
  Changing the equivalent coordinate norms only changes fixed constants in the estimates below.

=== 4.1 The derivative of the critical trajectory <the-derivative-of-the-critical-trajectory>

#thm([Proposition 4.1.])[
  (Nonzero temperature response).  #emph[For the fixed choices above there is a number $cal(P)
    in \( 0 \, oo \)$ such that, with
$ V_j^(\( k \)) = frac(partial W_j^(\( k \)) \( b \), partial b)\|_(b = b_c) \, wide q_u = \( 1 \, - 1 / 2 \) \, $

 we have
#[#set math.equation(numbering: n => "(4.2)")
 $ sup_(1 / 2 2^k lt.eq j lt.eq 5 / 2 2^k) lr(|V_j^(\( k \)) / j - cal(P) q_u|) arrow.r 0 . $ <eq:traj-response-limit>]

 The plane transverse remainder and every separately initialized torus remainder,
   at an index in this range behind a valid stop in the critical history,
   have temperature derivative bounded by $C \| V_j^(\( k \)) \| \/ j + e^(- c j)$.]
] <prop:response>

#proof[
  We omit the history superscript until we compare two entries.
    The entry analyticity in Proposition 7 gives an initial derivative bound $C s_k^2$.
    Propagation in the chosen tube bounds all plane derivatives by $C s_k^2 e^(gamma j)$;
    contraction of a torus remainder driven by the same scalars gives the weaker common bound $C s_k^2
    e^(2 gamma j)$. These estimates are used only to remove the initial remainder contribution.
  On a slightly larger fixed fractional interval than that in the statement, Proposition 12 gives
  $ W_j = frac(\( 1 \, 1 \), j) + O #h(-0.16667em) (frac(log j, j^2)) \, wide parallel Q_j parallel +
    parallel cal(R)_(j \| h)^(upright("tor")) parallel = O \( j^(- 2) \) . $
  Here $h gt.eq j$ is any valid stop within the history’s horizon.
    Differentiating the map of Proposition 8 therefore gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ V_(j + 1) = A_j V_j + B_j partial_b Q_j \, wide A_j = I + sans(M) / j +
     O #h(-0.16667em) (frac(log j, j^2)) \, wide parallel B_j parallel lt.eq C / j \, wide sans(M) =
     mat(delim: "(", 0, - 2; - 1, - 1) . $ <eq:traj-linear-response>]
  For a fixed torus stop $h$, put
  $ r_(j \| h) = parallel partial_b Q_j parallel + parallel partial_b cal(R)_(j \| h)^(upright("tor")) parallel . $
  The analytic remainder estimates, the absence of linear forcing from the scalar inputs into the unbalanced torus
    remainder, and the coordinate changes in Proposition 8 imply
  #[#set math.equation(numbering: n => "(4.4)")
   $ r_(j + 1 \| h) lt.eq theta_1 r_(j \| h) + C / j \| V_j \| . $ <eq:traj-derivative-contraction>]
  Terms with a small coefficient multiplying either remainder derivative have been included in $theta_1$.
    The constants are independent of $h$.
  We give the backward estimate that makes this contraction useful.
    Fix $j$ in the asserted interval and take $l = floor.l j \/ 2 floor.r$.
    For large $k$, the interval $\[ l \, j \]$ lies inside the slightly enlarged fractional range on which the
    preceding bounds hold. Define
  $ S_v = max_(l lt.eq i lt.eq j) r^(j - i) \| V_i \| \, wide S_q = max_(l lt.eq i lt.eq j) r^(j - i) r_(i \| h) . $
  Iterating (4.4), and using $i asymp j$ on this interval, gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ S_q lt.eq C / j S_v + C r^(j - l) r_(l \| h) . $ <eq:traj-weighted-forward>]
  For large $j$, the matrices $A_i$ are invertible and $parallel A_i^(- 1) parallel lt.eq 1 +
    C \/ j$ in a fixed equivalent scalar norm. Solving (4.3) backward from $j$,
    multiplying at index $i$ by $r^(j - i)$, and summing the geometric factors $r^(v - i)$ over intermediate
    indices $i lt.eq v < j$, gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ S_v lt.eq C \| V_j \| + C / j S_q . $ <eq:traj-weighted-backward>]
  Absorbing $C S_q \/ j^2$ between these inequalities yields
  $ r_(j \| h) lt.eq C / j \| V_j \| + C r^(j - l) r_(l \| h) . $
  The crude initial derivative estimate and the choice of $gamma$ make the last term exponentially small on these
    fractional intervals. Consequently
  #[#set math.equation(numbering: n => "(4.7)")
   $ r_(j \| h) lt.eq C / j \| V_j \| + e^(- c j) . $ <eq:traj-slaving>]
  The same proof without the torus term gives the plane assertion.
  We next use the physical meaning of the two scalar coordinates.
    The height part of the first-cosine observation has variance bounded below by a positive constant on the
    critical tori and has bounded reference cost. Lemma 6 thus gives a fixed positive lower bound for its
    temperature derivative. Lemma 10 allows us to use the cutoff readout with an exponentially small error.
    Differentiating Proposition 9, using (4.7) and the coordinate changes, bounds this response by $C \| V_j \| +
    e^(- c j)$. In particular
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| V_j \| gt.eq c > 0 . $ <eq:traj-response-nonvanishing>]
  This lower bound is the step that will exclude a purely decaying solution of the linearized recurrence.
  To compare two entries, define the normalized diagnostic vector
  #[#set math.equation(numbering: n => "(4.9)")
   $ O_(j \, s) \( b \) =
     vec(#scale(x: 120%, y: 120%)[\(] hat("Var")_b X_(n_j \, s) - parallel f_(n_j \, s) parallel_2^2
     #scale(x: 120%, y: 120%)[\)] \/ beta_(n_j \, s)^2, e^(\( s \/ n_j \)^2 \/ 2) hat(bb(E))_b e^(i
     macron(eta))) . $ <eq:traj-normalized-diagnostic>]
  The subtracted term is the independent observation-noise variance in the uncut law.
    Lemma 11 compares this vector with the same physical pair
    $\( "Var"_b^(upright("tor")) H_(n_j) \, bb(E)_b^(upright("tor")) e^(i macron(h)) \)$ for either entry.
    At zero activity, its linear scalar coefficient in the $W_j \, Q_j$ coordinates is
  $ "diag"
    (frac(kappa_(n_j \, s), b_(*) beta_(n_j \, s)^2) \, frac(e^(\( s \/ n_j \)^2 \/ 2) p_(j \, s) ell_j^(- 1),
    sqrt(b_(*) H))) . $
  Here $ell_j = 1 + O \( e^(- c j) \)$ is the balancing factor in the proof of Proposition 8.
    The linear remainder rows are controlled by (4.7). Its constant background is independent of $b$.
    Differentiating and using (4.7) gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ D_j V_j + O \( \| V_j \| \/ j \) + O \( e^(- c j) \) \, wide D_j =
     "diag" (frac(a frak(g), b_(*)) \, p_j / sqrt(b_(*) H)) . $ <eq:traj-response-readout>]
  The numbers $p_j$ and their inverses are uniformly bounded and positive.
    At a common absolute stop this diagonal matrix may be chosen identically for both entries:
    the difference of the actual multipliers is exponentially small and is included in the error.
    The variance comparison error is bounded by $C n_j^2 \( s \/ n_j \)^4$;
    the phase comparison is exact after removal of the mean noise, apart from the cutoff error.
    All these errors are exponentially small when the entries being compared have $s asymp j$.
    Since both readouts describe the same finite physical torus, (4.10) and (4.8) give
  #[#set math.equation(numbering: n => "(4.11)")
   $ \| V_j^(\( k \)) - V_j^(\( k' \)) \| lt.eq C / j #scale(x: 120%, y: 120%)[\(] \| V_j^(\( k \)) \| + \|
     V_j^(\( k' \)) \| #scale(x: 120%, y: 120%)[\)] $ <eq:traj-response-overlap>]
  whenever the index lies in the fixed interior ranges for both histories.
    In particular their norms are comparable. Only two physical scalar readouts were compared;
    no subtraction of remainders belonging to different activity norms is involved.
  Define a single sequence by taking $V_j = V_j^(\( k \))$ for $2^k lt.eq j < 2^(k + 1)$.
    At an ordinary step, (4.3) and (4.7) show that this sequence obeys
  $ V_(j + 1) = (I + sans(M) / j + E_j) V_j \, wide parallel E_j parallel lt.eq C frac(log j, j^2) . $
  Indeed an error vector of norm at most $eta \| V_j \|$ can be written as a matrix of norm at most $eta$ applied
    to $V_j$. The nonvanishing bound permits this representation also for the exponentially small errors.
    At a change of entry there is, by (4.11), an additional matrix error of norm $C \/ j$.
  The matrix $sans(M)$ has eigenvectors $q_u = \( 1 \, - 1 \/ 2 \)$ and $q_s = \( 1 \, 1 \)$,
    with eigenvalues $1$ and $- 2$, respectively. Let $\( U_k \, S_k \)$ be the coordinates of $V_(2^k)$ in this
    basis. Telescoping products over a dyadic interval gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ vec(U_(k + 1), S_(k + 1)) = {mat(delim: "(", 2, 0; 0, 1 \/ 4) + sans(E)_k} vec(U_k, S_k) \, wide
     parallel sans(E)_k parallel lt.eq C k 2^(- k) . $ <eq:traj-epoch>]
  For completeness, the unperturbed growing product is exactly $product_(j = n)^(2 n - 1) \( 1 + 1 \/ j \) = 2$,
    and the decaying product is $product_(j = n)^(2 n - 1) \( 1 - 2 \/ j \) = 1 \/ 4 + O \( n^(- 1) \)$.
    All partial products within one dyadic interval and their inverses are bounded.
    Summing $C log j \/ j^2$ over the interval, together with its one $C \/ j$ change of entry,
    proves the stated bound on $sans(E)_k$.
  For all sufficiently large $k$, the cone ${ \| S_k \| lt.eq \| U_k \| }$ is invariant under (4.12).
    If a sequence never enters this cone, then $\| U_k \| < \| S_k \|$ at every sufficiently large index,
    and (4.12) gives $\| S_(k + 1) \| lt.eq 1 / 2 \| S_k \|$.
    Both coordinates would tend to zero, contrary to (4.8). Thus the sequence enters the cone. Thereafter
  $ U_(k + 1) = 2 U_k \( 1 + eta_k \) \, wide \| eta_k \| lt.eq C k 2^(- k) . $
  The factors $1 + eta_k$ are positive on the tail and their logarithms are absolutely summable.
    It follows that $U_k \/ 2^k$ converges to a finite nonzero number $cal(P)$.
    The second row of (4.12), divided by its first, gives
  $ frac(\| S_(k + 1) \|, \| U_(k + 1) \|) lt.eq rho frac(\| S_k \|, \| U_k \|) + C k 2^(- k) quad
    upright("for some ") rho < 1 \, $
  so this ratio tends to zero. The same product estimates on partial dyadic intervals show that $V_j \/ j arrow.r
    cal(P) q_u$ at every intermediate index. Applying (4.11) then gives the uniform assertion for either history
    on its interior range. Finally the first component of (4.10) has positive physical response.
    Its leading term would be negative and of order $j$ if $cal(P) < 0$. Hence $cal(P) > 0$. ◻
]

=== 4.2 Matching a late entry to the critical trajectory <matching-a-late-entry-to-the-critical-trajectory>

We will use one observation side much larger than the absolute index at which the perturbation is first measured.
  The next lemma supplies the critical estimates for that history.
  Its proof compares finite physical diagnostics, so no rate of convergence of a critical height scaling limit is
  needed.

#thm([Lemma 4.2.])[
  (Critical estimates after a logarithmic initial interval).  #emph[Let $s arrow.r
    oo$ through admissible observation sides, put $J = floor.l C_(*) log s floor.r$, and let $K \( s \) gt.eq
    J$ satisfy $K \( s \) = o \( s^2 \)$. For the history with observation side $s$, at $b = b_c$,
    uniformly for $J \/ 2 lt.eq i lt.eq K \( s \)$,
#[#set math.equation(numbering: n => "(4.13)")
 $ W_i = frac(\( 1 \, 1 \), i) + O #h(-0.16667em) (frac(log i, i^2)) \, wide parallel Q_i parallel +
   parallel cal(R)_i parallel = O \( i^(- 2) \) . $ <eq:traj-late-critical>]

 Every separately initialized torus with a valid stop $h in \[ i \, K \( s \) \]$ also has $parallel
   cal(R)_(i \| h)^(upright("tor")) parallel = O \( i^(- 2) \)$.]
] <lem:traj-late-critical>

#proof[
  The extended critical confinement in Proposition 12 keeps all these states in the chosen small tube.
    Put $i_0 = ceil.l J \/ 100 ceil.r$. At every $i gt.eq i_0$,
    compare the history with a canonical history $cal(H)^(\( k \))$ for which $2^k lt.eq i < 2^(k + 1)$.
    Both are exact descriptions of the same physical torus of side $n_i$.
    The first choice in (4.1) ensures $s \/ n_i lt.eq e^(- c i)$ throughout this range.
    The observation sampling errors and multiplier differences are consequently exponentially small.
    The cutoff error is uniformly at most
  $ C exp { C K \( s \) - c s^2 } \, $
  and is also exponentially small in $i$, since $K \( s \) = o \( s^2 \)$.
    The canonical history has the bounds of Proposition 12.
  Write $d_i = \| t_i \| + \| z_i \|$, and let $R_i$ be the maximum of $parallel cal(R)_i
    parallel$ and the remainder norms at stage $i$ of all the separate tori with stops in $\[ i \, K \( s \) \]$.
    The two nonzero scalar multipliers in Proposition 9 give
  #[#set math.equation(numbering: n => "(4.14)")
   $ d_i lt.eq C / i + C R_i + C d_i^2 . $ <eq:traj-late-readout>]
  In writing this inequality we absorbed remainder squares and mixed terms using the uniform small tube.
    Remainder contraction, with copied scalar forcing also on each torus, gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ R_(i + 1) lt.eq theta_1 R_i + C d_i^2 . $ <eq:traj-late-contraction>]
  The family of tori in the maximum only decreases when $i$ increases,
    so the same inequality holds for the maximum itself.
  Absorb $C d_i^2$ into the left side of (4.14). Then $d_i lt.eq C \/ i + C R_i$, and,
    since $R_i$ is uniformly small, (4.15) becomes
  $ R_(i + 1) lt.eq theta_2 R_i + C / i^2 quad upright("for a fixed ") theta_2 < 1 . $
  Iteration from $i_0$ shows that $R_i lt.eq C theta_2^(i - i_0) + C \/ i^2$.
    For $i gt.eq J \/ 2$ the first term is at most $C \/ i^2$, uniformly for all later $i$, when $s$ is large.
    Thus $R_i = O \( i^(- 2) \)$ and $d_i = O \( i^(- 1) \)$.
  Repeat the readout comparison with these improved bounds.
    Each nonlinear and remainder error is now $O \( i^(- 2) \)$.
    Consequently the two unbalanced scalar coordinates agree with those of the canonical history to
    $O \( i^(- 2) \)$. Each coordinate change to $W \, Q$ differs from its linear part by $O \( i^(- 2) \)$,
    by Proposition 8. The canonical critical estimates therefore give (4.13). ◻
]

=== 4.3 A temperature secant at the matching index <a-temperature-secant-at-the-matching-index>

Let

$ epsilon = b_c - b > 0 \, wide delta = sqrt(epsilon) \, wide s asymp epsilon^(- 1 \/ 3) \, wide J =
  floor.l C_(*) log s floor.r \, $

where $s$ is chosen admissibly. Consecutive admissible sides have a fixed ratio,
  so the two-sided bound implicit in $asymp$ is independent of $epsilon$. These choices give

#[#set math.equation(numbering: n => "(4.16)")
 $ epsilon s^2 arrow.r 0 \, wide delta^(- 1) = o \( s^2 \) \, wide J = o \( delta^(- 1) \) . $ <eq:traj-scale-slack>]

The first inequality places $b$ inside the analytic entry disk;
  the second keeps every stop of order $delta^(- 1)$ within the cutoff range.

#thm([Lemma 4.3.])[
  (Matching the temperature secant).  #emph[For the history with observation side $s$,
#[#set math.equation(numbering: n => "(4.17)")
 $ frac(W_J \( b_c - epsilon \) - W_J \( b_c \), - epsilon) = J #scale(x: 120%, y: 120%)[\(] cal(P) q_u +
   o \( 1 \) #scale(x: 120%, y: 120%)[\)] \, wide ∥frac(Q_J \( b_c - epsilon \) - Q_J \( b_c \), epsilon)∥ lt.eq
   C . $ <eq:traj-secant-match>]

 The same uniform bound holds for the secant of each unbalanced torus remainder at stage $J$ behind a stop of
   order $delta^(- 1)$.]
] <lem:traj-secant>

#proof[
  Entry analyticity and propagation in the small tube first give, through stage $J$, the crude bound
  #[#set math.equation(numbering: n => "(4.18)")
   $ upright("distance between the states at ") b_c - epsilon upright(" and ") b_c lt.eq
     C epsilon s^2 e^(2 gamma J) . $ <eq:traj-crude-proximity>]
  This statement uses each history’s own norm. The torus bound follows by contracting its remainder with the same
    scalar inputs. Since $epsilon asymp s^(- 3)$ and $2 gamma C_(*) < 1$,
    the right side decays as a negative power of $s$; in particular it is smaller than every fixed negative power
    of $J$. Induction with a fixed margin to the boundary of the tube justifies the propagation up to $J$.
  Denote the scalar secants by $tilde(V)_i$, with denominator $- epsilon$.
    On $\[ J \/ 2 \, J \]$, Lemma 14 and (4.18) allow us to integrate the analytic derivatives of the map along
    the segment between its two input states. This gives the same form of scalar and remainder inequalities as
    (4.3) and (4.4). The extra coefficients from (4.18) are exponentially small in $J$,
    and hence fit inside their displayed errors. The crude bound for any initial remainder secant is $C s^2
    e^(2 gamma J)$. The weighted estimates (4.5)– (4.6), now on a fixed-fraction interval ending at $J$, therefore give
  #[#set math.equation(numbering: n => "(4.19)")
   $ tilde(r)_J lt.eq C / J \| tilde(V)_J \| + e^(- c J) . $ <eq:traj-secant-slaving>]
  Indeed the homogeneous contribution is bounded by a constant times $r^(c_1 J) s^2 e^(2 gamma J)$.
    The choices of $C_(*)$ and $gamma$ make its exponent strictly negative; taking, for example,
    an interval of length $J \/ 4$ within $\[ J \/ 2 \, J \]$ suffices.
    The estimate is uniform for the torus remainders behind later stops.
  To identify this secant, choose a canonical history with $s_k asymp J$ and $J$ in its fixed interior range.
    In that history we can compare the secant directly with its derivative.
    For all stages through $J$, analytic continuation in the parameter is valid and bounded on a disk of radius
  $ rho_J = c J^(- 2) e^(- 2 gamma J) $
  about $b_c$. To see this, the entry displacement is bounded by $C s_k^2 rho_J$,
    and its amplification through $J$ is bounded by $C e^(gamma J)$; the resulting displacement tends to zero.
    The same argument and contraction control the separate torus states.
    Cauchy’s estimate bounds second parameter derivatives of the stopped states by $C rho_J^(- 2)$.
    Since $log epsilon = - 3 J \/ C_(*) + O \( 1 \)$,
  #[#set math.equation(numbering: n => "(4.20)")
   $ epsilon rho_J^(- 2) lt.eq C J^4 exp { \( - 3 \/ C_(*) + 4 gamma \) J } arrow.r 0 . $ <eq:traj-cauchy-error>]
  Thus the canonical scalar secant is $V_J^(\( k \)) + o \( 1 \)$,
    with analogous absolute control of its remainder secants.
    This is the only use of a second temperature derivative; it is taken in the history with entry side comparable
    to $J$.
  Compare the two histories through their physical readout secants.
    Lemma 11 and Lemma 10 apply uniformly on the real parameter segment $\[ b_c - epsilon \, b_c \]$,
    so their first-derivative bounds apply also to the divided differences.
    Taylor expansion of $ O_(J \, s)$ from (4.9) on the segment between each history’s two temperature states,
    followed by (4.19), gives
  #[#set math.equation(numbering: n => "(4.21)")
   $ D_J tilde(V)_J = D_J V_J^(\( k \)) + O #h(-0.16667em) (frac(\| tilde(V)_J \| + \| V_J^(\( k \)) \|, J)) +
     o \( 1 \) \, $ <eq:traj-secant-comparison>]
  with the same uniformly invertible diagonal matrix as in (4.10).
    The multipliers and observation errors are exponentially small because the first condition in (4.1) also gives
    $n_J^2 \( s \/ n_J \)^4 lt.eq e^(- c J)$.
  Proposition 13 gives $\| V_J^(\( k \)) \| = O \( J \)$. Absorbing $C \| tilde(V)_J \| \/ J$ in (4.21) shows $\|
    tilde(V)_J \| = O \( J \)$, then $tilde(V)_J - V_J^(\( k \)) = O \( 1 \) + o \( 1 \)$.
    Proposition 13 and (4.19) prove all the assertions. ◻
]

=== 4.4 The nonlinear passage time <the-nonlinear-passage-time>

We now follow the real perturbed trajectory beyond the matching index.
  The result includes exactly the two physical variance facts needed in the following section.
  Recall the microscopic torus cosine $H_n$ from (3.29), and $frak(g) = 1 \/ \( 8 pi^2 \)$.

#thm([Proposition 4.4.])[
  (Passage time and the variance diagnostic).  #emph[Put
$ k_0 = sqrt(3 cal(P)) \, wide T = pi / k_0 . $

 For $b = b_c - epsilon$, use an admissible observation side $s asymp epsilon^(- 1 \/ 3)$.
   On every compact subinterval of $\( 0 \, T \)$, the scalar trajectory satisfies, uniformly for $w =
   delta j$ in that subinterval,
#[#set math.equation(numbering: n => "(4.22)")
 $ frac(x_j \( b \), delta) arrow.r k_0 cot \( k_0 w \) \, wide frac(y_j \( b \), delta) arrow.r
   k_0 csc \( k_0 w \) \, wide parallel Q_j \( b \) parallel = O \( delta^2 \) . $ <eq:traj-scaled-limit>]

 In particular, for every sequence $epsilon arrow.b 0$ and $delta j arrow.r w in \( 0 \, T \)$,
#[#set math.equation(numbering: n => "(4.23)")
 $ "Var"_(b \, n_j)^(upright("tor")) H_(n_j) arrow.r a frak(g) . $ <eq:traj-before-variance>]

 For every sufficiently small fixed $d > 0$, there are exit indices $j_e = j_e \( epsilon \, d \)$ such that
#[#set math.equation(numbering: n => "(4.24)")
 $ delta j_e arrow.r T \, wide x_(j_e) = - d + O \( d^2 \) \, wide y_(j_e) = O \( d \) \, wide
   parallel Q_(j_e) parallel + parallel cal(R)_(j_e \| j_e)^(upright("tor")) parallel = O \( d^2 \) . $ <eq:traj-exit>]

 All states through the exit lie in the small-activity map domain. For some $c_d > 0$,
#[#set math.equation(numbering: n => "(4.25)")
 $ limsup_(epsilon arrow.b 0) "Var"_(b \, n_(j_e))^(upright("tor")) H_(n_(j_e)) lt.eq a frak(g) -
   c_d . $ <eq:traj-exit-variance>]

 The torus law in these assertions is the original periodic Bessel height law in the zero-winding sector,
   with its common height translation factored out.]
] <prop:passage>

#proof[
  Set $Delta W_i = W_i \( b_c - epsilon \) - W_i \( b_c \)$ and define $Delta Q_i$ similarly.
    We first prove that, for a sufficiently small fixed $eta > 0$, uniformly on $J lt.eq i lt.eq eta \/ delta$,
  #[#set math.equation(numbering: n => "(4.26)")
   $ Delta W_i = - epsilon i #scale(x: 120%, y: 120%)[\(] cal(P) q_u + O \( eta^2 \) +
     o \( 1 \) #scale(x: 120%, y: 120%)[\)] \, wide parallel Delta Q_i parallel lt.eq
     C epsilon . $ <eq:traj-early-perturbation>]
  Here the constant in $O \( eta^2 \)$ is independent of sufficiently small $eta$, and $o \( 1 \) arrow.r
    0$ as $epsilon arrow.r 0$. The critical history has the estimates of Lemma 14 through every fixed multiple of
    $delta^(- 1)$, by (4.16).
  Bootstrap the estimate $\| Delta W_i \| lt.eq C_1 epsilon i$.
    The differentiated remainder bounds in Proposition 8 give
  $ parallel Delta Q_(i + 1) parallel lt.eq theta_1 parallel Delta Q_i parallel +
    C_(C_1) #scale(x: 120%, y: 120%)[\(] i^(- 1) epsilon i + \( epsilon i \)^2 #scale(x: 120%, y: 120%)[\)] . $
  The second term is $O_(C_1) \( epsilon \)$ on the indicated range.
    Lemma 15 and contraction therefore give $parallel Delta Q_i parallel lt.eq C_(C_1) epsilon$.
    Subtract the two scalar recurrences and linearize their leading quadratic terms about the critical trajectory.
    The result is
  #[#set math.equation(numbering: n => "(4.27)")
   $ Delta W_(i + 1) = (I + sans(M) / i) Delta W_i + e_i \, wide \| e_i \| lt.eq
     C_(C_1) (frac(epsilon log i, i) + epsilon / i + epsilon^2 i^2) . $ <eq:traj-difference-recurrence>]
  The first error uses the $O \( log i \/ i^2 \)$ critical correction and the differentiated cubic terms.
    The second uses $parallel Delta Q_i parallel = O \( epsilon \)$ and the $O \( i^(- 1) \)$ scalar remainder
    row. The last is the quadratic term in $Delta W_i$.
  In the eigenbasis of $sans(M)$, the unperturbed products from $h$ to $i$ have norm at most $C i \/ h$,
    and send $q_u$ to $\( i \/ h \) q_u$ exactly. Variation of constants in (4.27) and Lemma 15 therefore gives,
    after division by $epsilon i$, a total error bounded by
  $ o \( 1 \) + C_(C_1) sum_(h gt.eq J) frac(log h + 1, h^2) + C_(C_1) epsilon sum_(h lt.eq i) h lt.eq o \( 1 \) +
    C_(C_1) (frac(log J, J) + eta^2) . $
  Choose $C_1$ larger than the leading bound, then choose $eta$ small.
    The improved inequality closes the bootstrap. The trajectory stays within the chosen tube throughout this
    argument, by the same bound and the critical estimates. This proves (4.26).
    The unbalanced remainder on every torus behind a stop of order $delta^(- 1)$ satisfies its corresponding
    bounds by the same contraction with copied scalars.
  For the continuous-scale limit, linearly interpolate $x_j \/ delta \, y_j \/ delta$ at times $w = delta j$.
    On every compact subinterval of $\( 0 \, eta \]$, (4.26) and the critical estimates bound these interpolants
    uniformly and give $Q_j = O \( delta^2 \)$. The map in Proposition 8 then gives bounded slopes and,
    uniformly on such a subinterval, the limiting equations
  #[#set math.equation(numbering: n => "(4.28)")
   $ X' = - Y^2 \, wide Y' = - X Y . $ <eq:traj-ode>]
  Indeed the scalar map error is $O \( delta^3 \)$ there, while a step has length $delta$ and the scalar
    coordinates were divided by $delta$. Its contribution to the slope tends to zero.
    Compactness and integration of the discrete equations therefore show that every subsequential limit solves (4.28).
  Applying (4.26) with arbitrarily small $eta$ determines its behavior at the left endpoint:
  #[#set math.equation(numbering: n => "(4.29)")
   $ \( X \( w \) \, Y \( w \) \) = frac(\( 1 \, 1 \), w) - w #scale(x: 120%, y: 120%)[\(] cal(P) q_u +
     O \( w^2 \) #scale(x: 120%, y: 120%)[\)] wide \( w arrow.b 0 \) . $ <eq:traj-left-asymptotic>]
  The equations preserve $X^2 - Y^2$, whose value is $- 3 cal(P)$ by (4.29). Thus $X' = - \( X^2 + 3 cal(P) \)$.
    Its pole at zero and the positive sign of $Y$ near zero give uniquely
  $ X \( w \) = k_0 cot \( k_0 w \) \, wide Y \( w \) = k_0 csc \( k_0 w \) . $
  Every subsequential limit is the same, so convergence holds on compact subintervals of $\( 0 \, eta \]$.
  We extend it to each compact subinterval of $\( 0 \, T \)$.
    Starting from any fixed time in $\( 0 \, eta \)$, choose a bound strictly larger than the supremum of the
    displayed solution on the target compact interval. While the discrete scalars divided by $delta$ remain within
    this bound, remainder contraction gives $parallel Q_j parallel = O \( delta^2 \)$,
    so the scalar error in the Euler approximation tends uniformly to zero.
    The quadratic vector field is Lipschitz on this bounded set.
    The discrete Gronwall inequality then gives uniform convergence up to the end of the interval and excludes a
    first exit from the larger bound. This proves (4.22), including the analogous torus remainder bounds behind
    these stops.
  It remains to control the final part of the trajectory, where the scaled solution diverges but the unscaled
    activity is still small. Fix a time $w_0 in \( T \/ 2 \, T \)$.
    Starting at $j_(upright("start")) = floor.l w_0 \/ delta floor.r$, let $j_e$ be the first index with $-
    x_(j_e) gt.eq d$, provided such an index exists. We prove its existence and the estimates in (4.24) using a
    cone on which both scalar coordinates have a definite direction of motion.
  Take a large fixed $M > k_0$ and let $w_M in \( T \/ 2 \, T \)$ be the outgoing time at which $Y \( w_M \) = M$.
    At an index with $delta j arrow.r w_M$, compact convergence gives
  $ y_j = \( M + o \( 1 \) \) delta \, wide - x_j \/ y_j = 1 + O \( M^(- 2) \) + o \( 1 \) . $
  The remainder estimate at this index can be made
  #[#set math.equation(numbering: n => "(4.30)")
   $ parallel Q_j parallel + parallel cal(R)_(j \| h)^(upright("tor")) parallel lt.eq
     K M^2 delta^2 $ <eq:traj-cone-initial>]
  with $K$ independent of large fixed $M$. Here $h$ can be any later stop up to a fixed sufficiently large
    multiple of $delta^(- 1)$. To verify the independence, use the fixed scaled interval on which the limiting
    outgoing $Y$ increases from $M \/ 2$ to $M$. Throughout it $\| W \| lt.eq
    C M delta$ for all sufficiently small $delta$, with an absolute $C$,
    and its number of discrete steps tends to infinity. Contraction bounds the forced remainder by $C M^2
    delta^2$ and removes the contribution from the earlier state.
    The threshold for $delta$ may depend on $M$, as is appropriate when $M$ is fixed before taking $delta arrow.r 0$.
  For sufficiently small coordinates consider
  #[#set math.equation(numbering: n => "(4.31)")
   $ y > 0 \, wide 1 / 2 lt.eq q := - x \/ y lt.eq 2 \, wide parallel Q parallel +
     parallel cal(R)^(upright("tor")) parallel lt.eq K_1 y^2 . $ <eq:traj-outgoing-cone>]
  Choose $K_1$ sufficiently large for the remainder contraction. In this cone the scalar map gives
  #[#set math.equation(numbering: n => "(4.32)")
   $ y_(+) & = y { 1 + q y + O_(K_1) \( y^2 + j^(- 2) y \) } \,\
q_(+) - q & = y \( 1 - q^2 \) + O_(K_1) \( y^2 + j^(- 2) y \) . $ <eq:traj-y-growth>]
  At each endpoint of $\[ 1 \/ 2 \, 2 \]$ the leading term in (4.32) points inward.
    It also points uniformly inward on fixed small neighborhoods of the endpoints.
    Away from those neighborhoods a sufficiently small step cannot cross either endpoint.
    Thus the ratio condition is preserved for small $y$ and large $j$.
    Equation (4.32) gives constants $0 < c < C$ such that
  $ y + c y^2 lt.eq y_(+) lt.eq y + C y^2 . $
  Remainder contraction preserves the last condition in (4.31):
    its forcing is at most $C' y^2$, so choose $K_1 > C' \/ \( 1 - theta_1 \)$, and use $y_(+) gt.eq y$.
    This applies to the plane remainder and separately to every stopped torus under consideration.
  For large fixed $M$, (4.30) places the trajectory in this cone.
    Choose $d$ small enough that the cone estimates hold until the first crossing of $- x = d$,
    including that crossing. Before it, $y lt.eq 2 d$, and reciprocal summation gives
  $ 1 / y_i - 1 / y_(i + 1) = frac(y_(i + 1) - y_i, y_i y_(i + 1)) gt.eq c' > 0 . $
  It follows that the exit occurs within $C \/ \( M delta \)$ further steps:
    otherwise the last inequality would force $1 \/ y_i < 0$.
    At the crossing, the change of $x$ is $O \( y^2 \) = O \( d^2 \)$.
    The cone and remainder bounds therefore give the last three assertions in (4.24).
  Compact convergence on $\[ w_0 \, T - zeta \]$, for any fixed $zeta > 0$,
    shows that no such exit occurs there when $delta$ is small. Hence $liminf delta j_e gt.eq T$.
    The preceding upper bound gives
  $ limsup_(delta arrow.b 0) delta j_e lt.eq w_M + C \/ M . $
  Since $w_M arrow.t T$ as $M arrow.r oo$, this proves $delta j_e arrow.r T$.
    Throughout this argument all unscaled coordinates remain small; no activity map is used beyond its domain.
    The fixed horizon of stopped tori can be taken larger than $\( T + 1 \) \/ delta$,
    and the exit lies before it for small $delta$.
  Finally apply the variance readout of Proposition 9. At a stop with $delta j arrow.r w in \( 0 \, T \)$,
    the scalar activity is $O \( delta \)$ and the remainder is $O \( delta^2 \)$,
    so the variance converges to $a frak(g)$. At the exit, the coordinate change gives
  $ t_(j_e) = - d / b_(*) + O \( d^2 \) \, wide parallel cal(R)_(j_e \| j_e)^(upright("tor")) parallel +
    nu_(j_e)^2 = O \( d^2 \) . $
  Here $nu_(j_e)$ is the full stopped activity size. The readout multiplier tends to $a frak(g)$, and therefore
  $ "Var"_(b \, n_(j_e))^(upright("tor")) H_(n_(j_e)) = a frak(g) - frac(a frak(g), b_(*)) d + O \( d^2 \) +
    o_(epsilon arrow.b 0) \( 1 \) . $
  To pass from the cutoff observation to $H_n$, remove the independent noise and use the sampling comparison and
    cutoff bound. Their errors tend to zero both before and at the exit, since $log n_j = O \( delta^(- 1) \) =
    o \( s^2 \)$ and $s \/ n_j arrow.r 0$. Taking $d$ sufficiently small gives (4.25), for example with $c_d =
    a frak(g) d \/ \( 2 b_(*) \)$ after decreasing its allowed range. ◻
]

== 5 The coefficient on logarithmic scales <sec:profile>

Proposition 16 locates a change in a torus variance at logarithmic scale $T$.
  We now identify the free and pinned height laws on either side of that scale.
  The comparison estimates are finite-graph statements, whereas the height limit theorems in [14] are stated at
  fixed inverse temperature. We therefore formulate the limit argument for a sequence of temperatures and retain
  the order of its auxiliary limits.

Throughout this section let $b_k < b_c$, $b_k arrow.r b_c$, and put $delta_k = sqrt(b_c - b_k)$.
  Passing to subsequences will always preserve these notations.
  All finite comparison constants may be chosen for one fixed compact interval of positive temperatures containing
  the $b_k$ and $b_c$.

=== 5.1 Extraction of the coefficient profile <extraction-of-the-coefficient-profile>

Let $B_m = { 0 \, dots.h \, m - 1 }^2$, let $A_(B_m)$ be its free unit-edge Laplacian, and define

#[#set math.equation(numbering: n => "(5.1)")
 $ g_m \( x \) = x_1 \/ m \, wide a_m \( b \) = "Var"_(B_m \, b)^(upright("free")) \( h \, A_(B_m) g_m \) .
   $ <eq:profile-coefficient>]

The test in (5.1) is the difference of the right and left face averages.
  The two coordinate affine tests have covariance matrix $a_m \( b \) I_2$,
  by the reflections and quarter turns of the square. Their reference costs are bounded, so $a_m \( b \) lt.eq
  C$ uniformly in $m$ and in the temperatures under consideration.

Cutting an $M$-square into $m$-squares and strips of width less than $m$ gives the comparison

#[#set math.equation(numbering: n => "(5.2)")
 $ sqrt(a_M \( b \)) lt.eq sqrt(a_m \( b \)) + C #scale(x: 120%, y: 120%)[\(] m^(- 1) +
   m \/ M #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, wide M gt.eq m . $ <eq:profile-cut>]

Indeed, omit the seam and strip flows in the large square’s affine test.
  Their squared reference cost is $O \( m^(- 1) + m \/ M \)$.
  Releasing the cell constraints increases covariance and makes the retained cell tests independent.
  The triangle inequality in $L^2$ and the reference moment bound then give (5.2).
  This is [14] Equation (2.6); its constant is uniform here because it uses only the compact-temperature reference
  bound.

#thm([Proposition 5.1.])[
  (Extraction on logarithmic scales).  #emph[Every sequence $b_k arrow.r
    b_c$ from below has a subsequence and a nonincreasing function $cal(A) : \( 0 \, oo \) arrow.r \[ 0 \, a \]$,
    where $a = 8 pi$, with the following property. At each continuity point $w > 0$ of $cal(A)$,
    every integer sequence $m_k$ satisfying $delta_k log_L m_k arrow.r w$ obeys
#[#set math.equation(numbering: n => "(5.3)")
 $ a_(m_k) \( b_k \) arrow.r cal(A) \( w \) . $ <eq:profile-limit>]

 One may choose $cal(A)$ to be right continuous.]
] <prop:profile>

#proof[
  For positive rational $q$, set $m_k \( q \) = floor.l L^(q \/ delta_k) floor.r$.
    A diagonal subsequence gives a limit of $a_(m_k \( q \)) \( b_k \)$ for every such $q$.
    If $q < q'$, then $m_k \( q \) \/ m_k \( q' \) arrow.r 0$ and $m_k \( q \) arrow.r oo$.
    Equation (5.2) orders the two limits. Denote these rational limits by $alpha \( q \)$ and define their
    right-limit regularization by
  $ cal(A) \( w \) = sup_(q > w \, med q in bb(Q)) alpha \( q \) . $
  This is nonincreasing and right continuous. Values at rational jump points need not be preserved;
    only continuity points will be used.
  For $q_(-) < w < q_(+)$, a sequence as in the statement eventually lies between $m_k \( q_(-) \)$ and
    $m_k \( q_(+) \)$. Applying (5.2) in these two directions bounds the limsup and liminf of
    $sqrt(a_(m_k) \( b_k \))$ by the values at $q_(-)$ and $q_(+)$.
    Letting these rationals tend to the continuity point $w$ proves (5.3).
  Centered covariance increases with $b$, as follows either from the chain approximation or from the finite
    comparisons of Section 2. Thus $a_m \( b_k \) lt.eq a_m \( b_c \)$.
    The critical height coefficient is $a$ by [14] Section 6, and $a_m \( b_c \) arrow.r a$ by [14] Theorem 2.4.
    Consequently $0 lt.eq cal(A) lt.eq a$. ◻
]

Fix for the moment a continuity point $w$, a sequence $n_k$ with $delta_k log_L n_k arrow.r w$, and write $a_(*) =
  cal(A) \( w \)$. Multiplying $n_k$ by any fixed positive constant,
  or rounding it by a bounded number of lattice steps, leaves this logarithmic scale unchanged.
  This observation supplies the coefficient limit on all fixed macroscopic pieces used below.

=== 5.2 Free Gaussian limits at a moving temperature <free-gaussian-limits-at-a-moving-temperature>

We use scaled densities with the following convention. A lattice profile $f_k$ represents $f in
  L^2 \( U \)$ if its piecewise constant scaled density converges to $f$ in $L^2$.
  For a fixed bounded piecewise continuous $f$ one may take $f_k \( x \) = n_k^(- 2) f \( x \/ n_k \)$,
  using compatible cell averages if needed along its discontinuities.
  When $integral_U f = 0$, make the total exactly zero by replacing this profile with
  $f_k - \( sum_x f_k \( x \) \) u_(U_k)$, where $u_(U_k)$ is uniform probability.
  The subtracted total tends to zero. Smooth shifts $g$ are sampled as $g_k \( x \) = g \( x \/ n_k \)$.
  A boundary probability is normalized by the number of vertices on that face.
  Joint statements below include every fixed finite collection of these observations.

#thm([Lemma 5.2.])[
  (Free limits in a fixed rectangle).  #emph[Let $U_k$, rescaled by $n_k^(- 1)$,
    be free rectangles converging to a fixed nondegenerate axis rectangle $U$.
    For smooth shifts defined near $overline(U)$,
#[#set math.equation(numbering: n => "(5.4)")
 $ log bb(E)_(U_k \, b_k)^(upright("free")) e^(\( h \, A_(U_k) g_k \)) arrow.r a_(*) /
   2 integral_U \| nabla g \|^2 . $ <eq:profile-free-gradient>]

 The joint limits are centered Gaussian and all joint moments converge.
   For zero-total density smears the limiting covariance is $a_(*) \( - Delta_(U \, N) \)^(- 1)$ on mean-free
   functions. Face probabilities minus volume probabilities of the same total are also allowed.
   These conclusions include $a_(*) = 0$.]
] <lem:profile-free>

#proof[
  We give the moving-temperature version of the cutting and folding argument in [14] Theorem 2.4.
    Its one infinite-size affine comparison is replaced below by a finite macroscopic enclosure.
  First consider an affine shift $g \( x \) = p dot.op x$. Tile most of $U$ by squares of a small fixed
    macroscopic side, leaving strips of arbitrarily small total area.
    The coefficient of every retained square tends to $a_(*)$ by (5.3).
    Releasing the cuts, using independence of the resulting laws, and bounding the strip flows by reference cost give
  #[#set math.equation(numbering: n => "(5.5)")
   $ limsup_k "Var" \( h \, A_(U_k) g_k \) lt.eq a_(*) \| U \| thin \| p \|^2 . $ <eq:profile-affine-upper>]
  The strip bound is sent to zero after $k arrow.r oo$.
  To prove the reverse inequality, place $U$ strictly inside a fixed square $S$ and partition $S \\ U$ into
    finitely many rectangles of positive width. Use the actual $U_k$ endpoints for the complementary cuts;
    their rescaled lengths converge to the prescribed positive lengths.
    The full affine observation on $S_k$ is the sum of the affine observations on these pieces and $U_k$,
    apart from seam flows of reference cost $o \( 1 \)$. Its variance tends to $a_(*) \| S \| thin \| p \|^2$.
    Cutting increases covariance; each piece has the upper bound (5.5).
    The sum of those upper bounds is exactly $a_(*) \| S \| thin \| p \|^2$.
    Hence the bound must be attained on each piece. Otherwise a subsequence with a fixed deficit on one piece,
    together with the upper bounds on the others, would contradict the limiting variance on $S_k$.
    This proves affine saturation on $U$. All enclosing lengths are asymptotic to fixed positive multiples of $n_k$.
  For a smooth or continuous piecewise smooth $g$, approximate its gradient on small fixed macroscopic rectangles
    by constant vectors. The seams have vanishing reference cost;
    the interior error is bounded by its squared $L^2$ gradient error.
    Letting the rectangles shrink after the mesh limit gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ limsup_k "Var" \( h \, A_(U_k) g_k \) lt.eq a_(*) integral_U \| nabla g \|^2 . $ <eq:profile-partial-upper>]
  The same estimate holds for partial gradient observations restricted to polygonal pieces.
    Explicitly, for a piece $H$ the partial test is
  $ J_(H \, k) \( g \) = sum_({ x \, y } in E \( U_k \)\
x \, y in H_k) \( g_k \( y \) - g_k \( x \) \) \( h_y - h_x \) \, $
  where $H_k = { x in U_k : x \/ n_k in H }$, and its energy bound is $a_(*) integral_H \| nabla g \|^2$.
    Edges crossing a fixed cut contribute a vanishing reference-cost error. Call equality #emph[saturation].
    On a convergent joint covariance subsequence, the difference between the quadratic form on the right of (5.6)
    and the limiting covariance is positive semidefinite. Its null space is linear.
    Saturation therefore passes to linear combinations, to $L^2$-gradient limits,
    and to restrictions obtained by cutting an enclosing rectangle and comparing the sum of the energy bounds.
  For completeness, the finite reflection step used to generate nonaffine saturated shifts has no
    temperature-limit hypothesis. Work first in a rectangle symmetric about the reflection line.
    Choose the representative with one height on the line fixed at zero,
    and let $cal(T)$ be the sigma-field generated by its full trace.
    For an odd saturated shift, denote by $Y_(+)$ and $Y_(-)$ the partial tests on the two open sides after
    transporting exceptional coefficients to the line in a reflection-symmetric manner.
    Suppose that the off-line coefficients of $Y_(+)$ are nonnegative; those of $Y_(-)$ are then nonpositive.
    The subdivided quadratic law is conditionally associated, and this property passes to the primary graph.
    Consequently $"Cov" \( Y_(+) \, Y_(-) divides cal(T) \) lt.eq 0$.
    Reflection fixes the prescribed trace and exchanges the two sides, while oddness changes the sign of the test.
    Thus the conditional means satisfy the exact identity
  $ bb(E) \( Y_(-) divides cal(T) \) = - bb(E) \( Y_(+) divides cal(T) \) . $
  The total covariance is therefore
  $ "Cov" \( Y_(+) \, Y_(-) \) = bb(E) "Cov" \( Y_(+) \, Y_(-) divides cal(T) \) -
    "Var" #scale(x: 120%, y: 120%)[\(] bb(E) \( Y_(+) divides cal(T) \) #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $
  The transport has vanishing reference cost, so its contribution to covariances tends to zero by the uniform
    second-moment bound. The saturated sum and the separate energy bounds (5.6) then force both original partial
    tests to saturate. An odd shift vanishes on its reflection line,
    so the weak gradient of $g upright(bold(1))_H$ is $upright(bold(1))_H nabla g$.
    Its lattice gradient test differs from $J_(H \, k) \( g \)$ only by the stated vanishing-cost seam.
    Thus the folded shift itself saturates.
  Here are the shifts and transports from [14] proof of Theorem 2.4, Equation (2.8).
    For a hinge at $t$, use a fixed enclosing rectangle symmetric about $x_1 = t$ and the odd affine seed $g =
    x_1 - t$. Transport the negative coefficients adjacent to that vertical cut to the cut.
    There are $O \( n_k \)$ of them, each of size $O \( n_k^(- 1) \)$, on bounded-length paths of bounded overlap.
    Their total squared cost is $O \( n_k^(- 1) \)$. This yields the hinges $\( x_1 - t \)_(+)$;
    restriction gives their saturation on the target rectangle.
    Linear combinations and energy approximation then give every smooth function of $x_1$, and likewise of $x_2$.
    For a diagonal cut write $Y = x_2 + t$ and start with $F \( x_1 \) -
    F \( Y \)$ on a square symmetric under interchanging $x_1 \, Y$.
    Initially impose $F''' < 0$ and positive derivatives at the two end faces.
    The interior coefficients in $x_1 > Y$ are nonnegative because the centered second differences of $F$ decrease
    with their center; the two outer-face coefficients have positive leading terms.
    Exceptional diagonal-strip coefficients again have total transport cost $O \( n_k^(- 1) \)$. We obtain saturation of
  #[#set math.equation(numbering: n => "(5.7)")
   $ \( F \( x_1 \) - F \( x_2 + t \) \) upright(bold(1))_({ x_1 > x_2 + t }) . $ <eq:profile-fold>]
  Every smooth $F$ is a difference of two functions with those strict properties,
    by adding a sufficiently large cubic of negative third derivative and then a sufficiently large positive
    linear function. Thus (5.7) holds for arbitrary smooth $F$.
    Rounding a reflection line changes the squared gradient cost by $O \( n_k^(- 1) \)$.
  Given smooth $g$, choose a bounded interval $I$ containing all $x_1 - x_2$ in the target rectangle.
    Choose a smooth family $F_t$, compactly supported in $I$ after slightly enlarging $I$, with $F'_t \( x \) = -
    g_12 \( x \, x - t \)$ whenever $\( x \, x - t \)$ lies in that rectangle. Integrate (5.7) over $t in I$.
    Indeed, differentiating first in $x_1$ and then in $x_2$ gives the distributional identity
  $ partial_12 integral_I \( F_t \( x_1 \) - F_t \( x_2 + t \) \) upright(bold(1))_({ x_1 > x_2 + t }) thin d
    t = - F'_(x_1 - x_2) \( x_1 \) = g_12 \( x_1 \, x_2 \) . $
  The difference from $g$ is a sum of one-variable functions.
    Riemann sums converge in gradient energy, including across the moving reflection lines.
    Linearity and energy approximation therefore prove saturation for every smooth $g$.
  The finite centered comparison gives $log bb(E) e^X gt.eq "Var" \( X \) \/ 2$,
    providing the Laplace lower bound. For the upper bound, cut into cells of fixed macroscopic side $r$.
    A retained smooth-gradient test $X$ on one cell has reference-cost square root $O \( r \)$.
    The normalized exponential moment estimate gives, for each fixed $p > 1$,
  $ log bb(E) e^(p X) = 1 / 2 p^2 "Var" \( X \) + O_p \( r^3 \) \, wide bb(E) \( \| X \|^3 e^(p \| X \|) \) =
    O_p \( r^3 \) \, $
  with constants uniform in $k$. Hölder’s inequality and the same reference bound remove the seam errors.
    There are $O \( r^(- 2) \)$ cells. First send $k arrow.r oo$, then $r arrow.b 0$, and finally $p arrow.b 1$.
    This proves (5.4). Apply it to real linear combinations to obtain joint Gaussian limits;
    the exponential bounds supply convergence of moments.
  For densities, approximate by finite sums of Neumann eigenfunctions and use their smooth inverse-Laplacian
    shifts. The discrete Neumann form approximation and Poincaré inequality bound the reference cost of the error
    by its squared scaled $L^2$ norm. Using the actual rectangle endpoints before passing to their limits handles
    the rounding. Finally move a face probability to a parallel strip of width $r$.
    Parallel normal flows cost $O \( r + n_k^(- 1) \)$; the strip is a density smear.
    Let $k arrow.r oo$ and then $r arrow.b 0$. ◻
]

=== 5.3 Fractional means <fractional-means>

For a free graph and a profile $s$ of integer total, write $phi.alt \( s \) = bb(E) e^(i \( h \, s \))$.
  It is independent of the representative of $h$ modulo a common $2 pi$ translation.
  Finite comparison gives $0 < phi.alt \( s \) lt.eq 1$. If $v$ has zero total,
  the logarithmic Hessian bound and the fact that $log phi.alt lt.eq 0$ imply

#[#set math.equation(numbering: n => "(5.8)")
 $ lr(|sqrt(- log phi.alt \( s + v \)) - sqrt(- log phi.alt \( s \))|) lt.eq
   sqrt("Var" \( h \, v \) \/ 2) . $ <eq:profile-phase-transfer>]

Indeed, for all real $t$ let $F \( t \) = log phi.alt \( s + t v \)$ and $V = "Var" \( h \, v \)$.
  The inequalities $F'' gt.eq - V$ and $F lt.eq 0$ give $\| F' \|^2 lt.eq -
  2 V F$ by optimizing the quadratic lower bound for $F$; integration gives (5.8), as in [14] Equation (2.2).

#thm([Lemma 5.3.])[
  (Uniform fractional means).  #emph[Under the hypotheses of Lemma 18, suppose $a_(*) > 0$.
    The fractional mean modulo $2 pi$ converges to uniform measure,
    independently of the Gaussian observations in that lemma.
    For every fixed nonzero integer $l$ and every zero-total profile $v_k$ of bounded reference cost,
#[#set math.equation(numbering: n => "(5.9)")
 $ bb(E) exp { i \( h \, l u_(U_k) + v_k \) } arrow.r 0 \, $ <eq:profile-phase-zero>]

 where $u_(U_k)$ is uniform probability on $U_k$.]
] <lem:profile-phase>

#proof[
  We describe the soft joining and replica argument of [14] Theorem 2.5, Equations (2.10)–(2.13),
    keeping its lattice and geometric limits separate. Start with a square of side $m =
    m_k$ on the chosen logarithmic scale. Let $u_m$ be its volume probability, $rho_m$ its right-face probability,
    and set
  $ X = \( h \, A_(B_m) \( x_1 \/ m \) \) \, wide Y = \( h \, rho_m - u_m \) . $
  Lemma 18 gives joint Gaussian limits, with $"Var" X arrow.r a_(*)$ and $"Cov" \( X \, Y \) arrow.r a_(*) \/ 2$.
    Suppose along a subsequence that $phi.alt \( l u_m \)$ is bounded away from zero for a nonzero integer $l$.
    Uniform exponential bounds provide a further subsequence on which
  $ F_m \( t \, v \) = bb(E) e^(i \( h \, l u_m \) + i t X + i v Y) $
  converges locally with all derivatives. On real arguments the limit $F$ is strictly positive by (5.8).
  The replica identity is a finite quadratic-lattice identity.
    Let $F_(m \, N)$ denote the preceding transform with each primary edge replaced by $N$ Gaussian chain bonds
    and the observations evaluated at the primary endpoints. For two independent fields under this subdivided law
    put $S = h_1 + h_2$, $D = h_1 - h_2$. Choose both representatives to vanish at the same reference vertex.
    At every vertex of the subdivided graph, $S equiv D$ modulo $4 pi bb(Z)$.
    Conditional on this full common parity class, $S$ and $D$ are independent and identically distributed.
    If $V_(i j)$ is the conditional second moment of $S_i \, S_j$, for linear observations indexed by $i \, j$, then
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(E) V_(i j) = 2 "Cov" \( h_i \, h_j \) \, wide "Cov" \( V_(i j) \, V_(r s) \) =
     2 kappa \( h_i \, h_j \, h_r \, h_s \) \, $ <eq:profile-replica>]
  where all moments in this identity are in the subdivided law and $kappa$ is its fourth joint cumulant.
    This follows by expanding $bb(E) S_i S_j D_r D_s$ in the original two copies.
    Differentiating $F_(m \, N)$ in its observation variables gives
  $ bb(E) S_i S_j e^(i \( l \( h_1 - h_2 \, u_m \) + t X \( D \) + v Y \( D \) \)) = -
    2 \( F_(m \, N) F_(m \, N \, i j) - F_(m \, N \, i) F_(m \, N \, j) \) . $
  In the conditional expectation on the left, replace $V_(i j)$ by its mean.
    The error is at most $sqrt("Var" V_(i j))$. First take the chain limit on each fixed primary graph.
    Then the Gaussian moment limits in Lemma 18 make the needed fourth cumulants zero.
    For $i j = X X \, X Y$ this yields
  $ \( log F \)_(t t) = - a_(*) \, wide \( log F \)_(t v) = - a_(*) \/ 2 . $
  Reflection gives $F_t \( 0 \, 0 \) = 0$. Consequently
  #[#set math.equation(numbering: n => "(5.11)")
   $ F \( t \, v \) = F \( 0 \, v \) exp { - a_(*) t^2 \/ 2 - a_(*) t v \/ 2 } . $ <eq:profile-phase-transform>]
  Softly join two horizontal squares as follows. Keep independent seam increments with the Bessel law and put
    $H_2 = \( h_1 \, rho_R \) - \( h_2 \, rho_L \) - macron(eta)$,
    where $macron(eta)$ is their mean with the joining orientation. Penalize this mismatch by $e^(- H_2^2 \/ 2)$.
    Sum relative cell translations; quotient by their common translation.
    Adding exact seam matching recovers the joined rectangle.
    The soft variance of the sum of the internal affine tests is bounded above by twice the free square variance
    and below by its variance in the joined rectangle. The joined full affine test differs from this sum by a seam
    flow of squared cost $O \( m^(- 1) \)$. Lemma 18 therefore makes the soft variance tend to $2 a_(*)$.
  The comparisons just used with summed translations can be obtained from ordinary finite comparisons without
    reweighting the original free cells. First confine each cell mean by an auxiliary precision $zeta sum_i
    macron(h)_i^2$. For each representative mean $mu$, its translation sum is $sum_(q in bb(Z))
    e^(- zeta \( mu + 2 pi q \)^2 \/ 2)$. After division by its Gaussian integral scalar,
    this tends uniformly to one as $zeta arrow.b 0$. After adding the soft penalty,
    divide out the common-translation scalar; the relative-translation Gaussian sum is uniformly bounded in its
    representative-dependent shift. The finite precision comparisons at $zeta > 0$ therefore pass to $zeta =
    0$ by dominated convergence, using the uniform internal moments.
    This justifies both variance comparisons with the original free-cell product law.
  Poisson summation of the relative translations expresses the soft characteristic transform as a positive sum of
    integer sectors, with weights $e^(- q^2 \/ 2) chi_m \( q \)$; here $0 < chi_m \( q \) lt.eq
    1$ is the independent seam characteristic. Explicitly, $chi_m \( q \) =
    exp { m b \( cos \( 2 pi q \/ m \) - 1 \) }$, so $chi_m \( q \) arrow.r 1$ for fixed $q$,
    uniformly in the temperatures here. To specify the sector functions, write $F_m^(\( q \)) \( t \, v \) =
    bb(E) e^(i q \( h \, u_m \) + i t X + i v Y)$. If $rho_R \, rho_L$ are the two vertical face probabilities,
    reflection and charge reversal give
  $ psi_q \( t \) = phi.alt \( q rho_R + t A \( x_1 \/ m \) \) phi.alt \( - q rho_L + t A \( x_1 \/ m \) \) =
    F_m^(\( q \)) \( t \, q \)^2 . $
  Each sector satisfies $\( log psi_q \)'' gt.eq - 2 "Var" X$.
    The logarithmic Hessian of a positive sum is the mean of the sector logarithmic Hessians plus the variance of
    the sector logarithmic first derivatives. Thus the soft variance is at most twice the free variance minus this
    latter, nonnegative variance. Differentiation under the sector sum is justified uniformly: with $V = 2 "Var" X$,
  $ psi_q \| \( log psi_q \)' \|^2 lt.eq 2 V \( - psi_q log psi_q \) lt.eq 2 V \/ e \, $
  and raw second derivatives are bounded by $V$. The Gaussian weights are summable.
  At $t = 0$ the normalizing constant is $Z_m = sum_q e^(- q^2 \/ 2) chi_m \( q \) psi_q \( 0 \)$, and $1 lt.eq
    Z_m lt.eq sum_q e^(- q^2 \/ 2)$ because the zero sector is one.
    Its normalized weight $p_0$ is therefore bounded below and its logarithmic derivative is zero.
    The sector $q = l$ also has normalized weight $p_l$ bounded below:
    (5.8) moves $l u_m$ to a seam face at bounded cost. By reflection, charge reversal and (5.11),
    its logarithmic derivative tends to $- a_(*) l$, up to orientation.
    If $D_q$ denotes the sector logarithmic derivative, their contribution bounds the variance of derivatives
    below by $p_0 p_l \( D_l - D_0 \)^2$. Its liminf is strictly positive,
    contradicting convergence of the soft variance to $2 a_(*)$. Hence $phi.alt \( l u_m \) arrow.r 0$.
    Equation (5.8) then proves (5.9) for square profiles of bounded cost.
  For a fixed rectangle, enclose it in a fixed-multiple square. Regard its mean phase as a phase on the square.
    The difference from the square mean has bounded reference cost, so its square coefficient tends to zero.
    Cutting the complement decreases characteristic coefficients and leaves the rectangle phase on one free
    component; hence the rectangle coefficient also tends to zero.
    Bounded-cost phase transfers inside the rectangle give the stated generality.
    Mixed real characteristic functions with the mean-free observations now vanish whenever $l eq.not 0$,
    and for $l = 0$ they have the Gaussian limit. Fourier approximation on the circle proves joint independence.
    Uniform exponential moments permit passage with any fixed real tilt and polynomial insertion in the mean-free
    observations. ◻
]

=== 5.4 Primary pins at a moving parameter <primary-pins-at-a-moving-parameter>

We next transfer the free limits to a hard pin. This requires more than convergence of finitely many unconditioned
  observations: a pin specifies every primary height in a region.
  We use the band and cable argument of [14] Section 3, stating its finite estimates explicitly and verifying the
  limits with the parameter varying along the sequence. At a positive continuity value of the coefficient profile,
  the free and phase assumptions below are supplied by Lemmas 18 and 19.

#thm([Lemma 5.4.])[
  (Moving-parameter pinned limits).  #emph[Let $b_k$ lie in a compact interval $J subset \( 0 \, oo \)$,
    and let $n_k arrow.r oo$. Suppose that, on every fixed nondegenerate rectangle with mesh $n_k^(- 1)$,
    the free Bessel height laws at $b_k$ have Gaussian Laplace and moment limits for mean-free density smears and
    energy-approximable weak Laplacian tests, with coefficient $a_(*) > 0$.
    Suppose also that the fractional mean modulo $2 pi$ converges jointly with those tests to an independent
    uniform variable.]
  #emph[Let $U$ be a fixed rectangle and let $p subset U$ be a nonempty finite union of aligned positive-area
    boxes. Assume that the resulting pieces have nondegenerate faces and positive-width passages;
    bounded lattice rounding is allowed. Pin every primary vertex of $p$ to zero. Define
$ cal(H)_p = { v in H^1 \( U \) : v = 0 upright(" almost everywhere on ") p } \, wide cal(E)_U \( v \, w \) =
  integral_U nabla v dot.op nabla w \, $

 and let $G_p$ be the inverse of this form: for a bounded density $f$,
   $G_p f in cal(H)_p$ satisfies $cal(E)_U \( G_p f \, v \) = integral_U f v$ for $v in cal(H)_p$.
   For every fixed finite collection of bounded piecewise continuous densities $f_1 \, dots.h \, f_d$,
   their primary smears converge jointly, with all Laplace transforms and polynomial moments,
   to the centered Gaussian vector with covariance
#[#set math.equation(numbering: n => "(5.12)")
 $ a_(*) integral_U f_i G_p f_j . $ <eq:profile-pinned-covariance>]

 The densities need not have zero integral.]
] <lem:profile-pins>

#proof[
  Write $n = n_k$ and $b = b_k$ in this proof, and index primary vertices by $x in n U ∩ bb(Z)^2$,
    with the permitted boundary rounding. For a continuum density $f$, put $f_n \( x \) = n^(- 2) f \( x \/ n \)$;
    equivalent cell quadratures give the same limits. All discrete pairings use ordinary sums:
    $\( h \, f_n \) = sum_x h_x f_n \( x \)$, whereas $g_n \( x \) = g \( x \/ n \)$.
    Probability averages, including cell averages, use weights equal to the reciprocal of their full primary
    counts. The unit-edge form is denoted by $A_(U \, n)$; its energy tends to $cal(E)_U$.
    All unspecified finite-graph constants below are uniform for $b in J$. We first prove the assertion for
  $ X_(g \, n) = \( h \, A_(U \, n) g_n \) \, $
  where $g$ is smooth on the rectangle, may meet its free walls, and vanishes in a neighborhood of $p$.
    The final approximation will use the form grounded on $p$ to reach arbitrary densities.
  Fix a closed neighborhood $V$ of $"supp" g$, separated from $p$,
    so that the primary support of $A_(U \, n) g_n$ lies in $V$ for all sufficiently large $k$.
    Choose a positive-width band $K$ separating $p$ from $V$, with positive gaps on both sides.
    Such a band can be chosen as a finite union of rectangular strips, clipped at the free walls.
    Partition it into rectangular cells $d$ of side comparable to $ell$, with uniformly bounded aspect ratios.
    If $h_d$ is the probability average in $d$, set
  #[#set math.equation(numbering: n => "(5.13)")
   $ W_(ell \, lambda) \( h \) = exp {- lambda / 2 sum_d \| d \| h_d^2} \, wide hat(W)_(n \, ell \, lambda) =
     frac(W_(ell \, lambda), cal(P)_n \( W_(ell \, lambda) \)) . $ <eq:profile-band>]
  Here $cal(P)_n$ is the sigma-finite free measure obtained by normalizing the law modulo common $2 pi
    bb(Z)$-translations and then summing all translations. The band confines its constant,
    so the denominator in (5.13) is finite and positive. We write $bb(E)_W$ for integration against $hat(W) thin d
    cal(P)_n$. Throughout the proof the order is
  #[#set math.equation(numbering: n => "(5.14)")
   $ k arrow.r oo \, wide ell arrow.b 0 \, wide lambda arrow.r oo . $ <eq:profile-band-order>]
  In particular, every band partition and strength is fixed before the moving-parameter mesh limit.
  We will prove that these successive band limits give variance $a_(*) cal(E)_U \( g \, g \)$ for $X_(g \, n)$,
    and that this value is no larger than $liminf_k "Var"_p X_(g \, n)$.
    The free variance upper bound will then give equality. The comparison is the main task.
    The finite exploration argument below controls the linear tilts introduced by the band and proves that
    exploration from $p$ reaches $V$ with vanishing probability.
    When it does not reach $V$, the exposed test is zero and the centered posterior variance is at most the
    hard-pin variance; the bounded band fourth moment controls the contribution when it does reach $V$.
    We finish by squeezing Laplace transforms and using the grounded form to approximate density smears.
  #emph[Band limits.] At a fixed partition and strength, the assumed joint free limits turn translation summation
    into integration of the constant against $d c \/ \( 2 pi \)$.
    This passage also holds with every fixed polynomial insertion.
    Indeed, if $S$ is the probability average over $U$ and $macron(h)_K = \| K \|^(- 1) sum_d \| d \| h_d$, then
  $ W_(ell \, lambda) lt.eq e^(- lambda \| K \| macron(h)_K^2 \/ 2) \, wide S -
    macron(h)_K upright(" has bounded primary reference cost") . $
  The reference-cost moment and fixed-linear-exponential bounds, uniform on $J$, control this difference;
    the displayed Gaussian factor controls the sum over translations.
    They give uniform integrability of the normalizing constants and polynomial insertions.
    The limiting law is therefore the Gaussian with precision $a_(*)^(- 1) cal(E)_U + lambda sum_d \| d \| v_d^2$.
  The subsequent cell refinement is a statement about these Gaussian forms.
    Integrating their constant first leaves the covariance $C_ell$ of the cell projection of the mean-free Neumann
    field, after subtracting its $K$-average. The inverse Neumann Laplacian on a rectangle is Hilbert–Schmidt,
    so $sup_ell parallel C_ell parallel_(upright("HS")) < oo$.
    For $q gt.eq 1$, if $t_j$ are the eigenvalues of $lambda C_ell$,
    the determinant factor in the normalized $q$-th weight moment satisfies
  $ 1 / 2 sum_j { q log \( 1 + t_j \) - log \( 1 + q t_j \) } lt.eq C_q sum_j t_j^2 . $
  The constant integral is a bounded positive factor at fixed $lambda$.
    Poincaré’s inequality, with the constant controlled by the band,
    also bounds every moment of $S$ in the resulting Gaussian law.
    Consequently, for every fixed $q gt.eq 1$, $r gt.eq 0$, and $lambda > 0$,
  #[#set math.equation(numbering: n => "(5.15)")
   $ limsup_(ell arrow.b 0) limsup_(k arrow.r oo) cal(P)_n #scale(x: 120%, y: 120%)[\(]
     hat(W)^q \( 1 + \| S \| \)^r #scale(x: 120%, y: 120%)[\)] < oo . $ <eq:profile-band-density>]
  Strong convergence of cell projections and the ordinary form approximation give the band covariance
  #[#set math.equation(numbering: n => "(5.16)")
   $ T_lambda^(- 1) \, wide T_lambda = - Delta_U \/ a_(*) + lambda upright(bold(1))_K . $ <eq:profile-band-Gaussian>]
  These are the ingredients of the band-density argument in [14] Lemma 3.3,
    now deduced from the assumed sequence limits. Since $g$ vanishes near $K$, $T_lambda \( a_(*) g \) = -
    Delta_U g$ in the weak Neumann sense. Thus the limiting variance of $X_(g \, n)$ is $a_(*)
    cal(E)_U \( g \, g \)$. Its limiting fourth moment is bounded uniformly for $lambda gt.eq lambda_0 > 0$,
    by Gaussian covariance monotonicity.
  #emph[Finite cable estimates.] Metric-graph Gaussian sign clusters are developed in [13] Section 3, Lemma 3.2;
    the Brownian-bridge extension of integer-restricted Gaussian fields is described in [1] Section 7.
    We use this construction on the finite Gaussian-chain approximants.
    We record the finite inputs used to remove the band and impose the primary pin.
    Replace each primary edge by $N$ lattice-Gaussian bonds with increment weight $q_N^(j^2)$, where $q_N =
    b \/ \( 2 N \)$, and attach the corresponding independent Brownian bridges conditional on their endpoint
    heights. Let $cal(P)_(n \, N)$ be the resulting unweighted sigma-finite cable measure,
    and let $bb(E)_(W \, N)$ and $bb(P)_(W \, N)$ denote its normalized band law; write $hat(W)_N =
    W \/ cal(P)_(n \, N) \( W \)$. A cable bond is open when its bridge does not hit zero.
    Under the unweighted cable measure, conditional on the magnitudes and the open graph,
    the nonzero clusters have independent fair signs. Exploration stops a bridge at its first zero or at its next
    vertex. The centered unvisited law has additional zero pins and increased precision on the stopped segments.
    These finite disintegration and comparison facts, together with the estimates below,
    are those of [14] Lemmas 2.2, 3.4, and 3.5. All cluster quantities in the following argument refer to these
    finite-$N$ measures. Subdivision is removed by a $limsup_(N arrow.r oo)$ at each fixed primary graph,
    before taking $k arrow.r oo$. Primary observables and their band normalizers have actual fixed-graph limits,
    equal to those of the Bessel law. No limit of the cable clusters is required.
    A remainder denoted by $o_k \( 1 \)$ in a cable estimate means that its absolute value has
    $limsup_(k arrow.r oo) limsup_(N arrow.r oo)$ equal to zero at the fixed auxiliary parameters then under
    consideration.
  The dependence on $b$ is controlled by the whole-chain estimate
  #[#set math.equation(numbering: n => "(5.17)")
   $ log frac(sum_(j in bb(Z)) q_N^(j^2) e^(2 pi t j), sum_(j in bb(Z)) q_N^(j^2)) lt.eq
     frac(C_(J \, R) t^2, N) \, wide \| t \| lt.eq R \, $ <eq:profile-chain-mgf>]
  for all sufficiently large $N$, uniformly on $J$. This is [14] Equation (3.5) with its parameter dependence made
    explicit. Grouping opposite integers proves this directly:
    the numerator increment is bounded by a constant times $t^2 sum_(j gt.eq 1) q_N^(j^2) j^2 e^(2 pi R j) =
    O_(J \, R) \( t^2 \/ N \)$. A primary flow extended through all $N$ bonds therefore has a uniform moment cost.
    Additional zero pins and increased precision decrease this centered cost.
    No bare resistance of the subdivided network is used.
  For clarity, write $cal(R) \( f \)$ for the minimum squared unit-edge flow cost of a mean-free primary test $f$.
    After exposing a cluster of scaled diameter at least $r > 0$,
    the full-component unvisited mean has grounded reference cost at most $V_r$.
    If $cal(D)$ is the collection of band cells touched by an exposed path and $ell < r \/ C$,
    the remaining averages satisfy
  #[#set math.equation(numbering: n => "(5.18)")
   $ cal(R)_(upright("post")) (sum_(d in cal(D)) \| d \| c_d h_d^U) lt.eq
     C ell^2 sum_(d in cal(D)) \| d \| c_d^2 . $ <eq:profile-path-cost>]
  Here the superscript $U$ denotes the unvisited contribution, extended by zero on visited primary vertices.
    The same bound holds for exploration from a filled region.
    In particular, the remaining probability average in a cell reached by a path from a fixed multiple of its
    diameter away has uniformly bounded centered posterior moments.
    These statements follow from path Poincaré on the unit-edge network:
    a spanning path anchors a positive fraction of the rows or columns in a fixed enlargement of a touched cell,
    giving an $ell^2$ factor; the enlargements have bounded overlap.
    Duality gives (5.18), and (5.17) transfers it to the cable posterior.
    The local estimate is [14] Equation (3.6), Lemma 3.4.
  We also need the finite estimates that control the sigma-finite constant before band weighting.
    Write its sign disintegration as $nu_(n \, N) \( d omega \) cal(R)_omega \( d sigma \)$, and put
  $ M_C \( f \) = sum_(x in C) \| h_x \| f_x \, wide m_C = M_C \( u \) \, wide Q = sum_C m_C^2 \, $
  where $u$ is the probability weight on all primary vertices of $U$.
    If $u_d$ is the probability weight in a cell $d$, we abbreviate $M_C \( u_d \)$ to $M_C \( d \)$.
    A cluster is counted once if it contains a primary vertex; internal cable vertices contribute no mass.
    For $t gt.eq 1$ and every integer $q gt.eq 1$, the bin bounds are
  #[#set math.equation(numbering: n => "(5.19)")
   $ nu_(n \, N) \( Q lt.eq 4 t^2 \) & lt.eq C \( 1 + t \) \,\
integral_(Q lt.eq 4 t^2) (sum_C M_C \( f \)^2)^q thin d nu_(n \, N) & lt.eq
  C_q \( 1 + t \) (t lr(|sum_x f_x|) + cal(R) (f - u sum_x f_x)^(1 \/ 2))^(2 q) . $ <eq:profile-bins>]
  For any nonnegative cost $I \( C \)$ determined by a completed cluster, and all sufficiently large $t =
    t \( r \)$, reinsertion gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ integral sum_("diam" C gt.eq r) I \( C \) upright(bold(1))_({ m_C lt.eq 2 t }) thin d nu_(n \, N) lt.eq
     2 integral upright(bold(1))_({ Q lt.eq 8 t^2 }) sum_("diam" C gt.eq r) I \( C \)
     upright(bold(1))_({ m_C lt.eq 2 t }) thin d nu_(n \, N) . $ <eq:profile-reinsertion>]
  Finally, for every $j > 0$, some $M < oo$ satisfies
  #[#set math.equation(numbering: n => "(5.21)")
   $ cal(P)_(n \, N) (\( 1 + \| S \| \)^(- M) upright(bold(1))_({ t^2 < Q lt.eq 4 t^2 })) lt.eq
     C_j \( 1 + t \)^(- j) . $ <eq:profile-damping>]
  The constants in these estimates depend only on fixed geometry, the displayed moment orders, $r$ when present,
    and $J$. Indeed, the proof of (5.19) uses fair-sign Khintchine and Paley–Zygmund bounds,
    at most $C \( 1 + t \)$ translations with $\| S \| lt.eq C t$, and the primary reference moments.
    After a macroscopic cluster is exposed, path anchoring bounds every moment of the complementary squared-mass
    sum; its probability of being at most $4 t^2$ is at least $1 \/ 2$, proving (5.20).
    Polynomial damping follows by separating clusters below a fixed diameter from the macroscopic ones:
    a small cluster misses one of finitely many fixed boxes and is controlled by the corresponding mean-free test;
    a large cluster anchors the complementary mean. These are finite estimates, proved in [14] Lemma 3.5,
    Equations (3.7)–(3.9); their only parameter-dependent inputs are the uniform primary moment bounds and (5.17).
    All cable statements are made first at a fixed primary graph and then passed through its subdivision limit.
    Thus they require no convergence rate for $N$ uniform in $k$.
  #emph[Band-weighted clusters and tilt errors.] We now combine those finite estimates with (5.15).
    This is the point where the free limits enter the exploration argument.
    If $F = \( sum_C M_C \( f \)^2 \)^(1 \/ 2)$, or if $F$ is a signed partial sum selected using signless data,
    and $A_t$ is a dyadic bin of $Q$, then
  $ cal(P)_(n \, N) \( hat(W)_N \| F \|^q upright(bold(1))_(A_t) \) & lt.eq
    cal(P)_(n \, N) \( hat(W)_N^4 \( 1 + \| S \| \)^M \)^(1 \/ 4)
    cal(P)_(n \, N) \( \( 1 + \| S \| \)^(- M) upright(bold(1))_(A_t) \)^(1 \/ 4)\
 & #h(35mm)  times cal(P)_(n \, N) \( \| F \|^(2 q) upright(bold(1))_(A_t) \)^(1 \/ 2) . $
  The bin moments grow polynomially in $t$, whereas (5.21) has arbitrarily high polynomial decay.
    Choosing its exponent after $q$ therefore bounds the sum and its tail.
    In particular, with $D_ell^2 = 1 + log \( 1 \/ ell \)$,
  #[#set math.equation(numbering: n => "(5.22)")
   $ bb(E)_(W \, N) (sum_C M_C \( d \)^2)^q + bb(E)_(W \, N) \| d_(*) \|^(2 q) lt.eq C_(q \, lambda) D_ell^(2 q) +
     o_k \( 1 \) . $ <eq:profile-weighted-moments>]
  Here $d_(*)$ is any signed selection whose nonnegative coefficients are bounded by the full cell average.
    The logarithm is the ordinary reference cost of a probability cell average minus $S$.
    Fixed observation boxes have a fixed constant in its place.
    The remainder is taken at fixed $ell \, lambda$; the constants remain valid in the subsequent cell refinement.
  Replacing the signs of all clusters of diameter at least $r$ by independent fair signs changes the band law by
    vanishing total variation in the first two limits of (5.14).
    Here is the quantitative estimate ensuring this assertion for our sequence.
    On $Q lt.eq t^2$, expand the difference of the two band energies in the old and new signs.
    Fair-sign orthogonality, followed by exposure of one cluster, (5.18), and (5.20), gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ cal(P)_(n \, N) (upright(bold(1))_({ Q lt.eq t^2 }) \| log W \( sigma' \) - log W \( sigma \) \|^2) lt.eq
     C_(lambda \, t \, r) ell^2 D_ell^2 + o_k \( 1 \) . $ <eq:profile-sign-error>]
  The intermediate conditional second moment is bounded by $C ell^2 sum_d \| d \| M_C \( d \)^2$,
    which explains the factor $ell^2$. On this finite-mass bin,
    split at a fixed tolerance for the logarithmic difference, use Hölder and (5.15) on the exceptional set,
    and use $\| e^x - e^y \| lt.eq \( e^eta - 1 \) \( e^x + e^y \)$ when $\| x - y \| lt.eq eta$.
    Then send $eta$ to zero. The weighted moments remove the bin cutoff,
    also against fixed polynomial observables. Exchanging the old and new sign samples preserves the unweighted
    measure and $Q$, so the two weighted tails obey the same bound.
    This supplies the sequence version of the argument in [14] Lemmas 3.6–3.7.
  Clusters of diameter less than $r$ contribute a second moment at most $C_t
    r^2 \( 1 + log \( 1 \/ r \) \)$ on a fixed bin to a bounded density smear:
    partition into $r$-cells and use that such a cluster meets only boundedly many neighboring cells.
    Higher bin moments and the weighted tail bound extend the vanishing to every fixed moment.
    It follows, by fair-sign resampling, the band Gaussian limit, and then removal of smaller clusters,
    that for nonnegative fixed density smears $f_1 \, f_2$,
  #[#set math.equation(numbering: n => "(5.24)")
   $ limsup_(ell arrow.b 0) limsup_(k arrow.r oo) limsup_(N arrow.r oo) bb(E)_(W \, N) sum_("diam" C gt.eq r)
     M_C \( f_1 \) M_C \( f_2 \) lt.eq \( f_1 \, T_lambda^(- 1) f_2 \) . $ <eq:profile-cluster-cross>]
  If $Q_f = sum_("diam" C gt.eq r) M_C \( f \)^2$, fair-sign Jensen also bounds the limiting $q$-th moment of
    $Q_f$ by the Gaussian $2 q$-th moment of its smear. These bounds are uniform for $lambda gt.eq lambda_0$,
    since the Gaussian covariance decreases with $lambda$. Uniformity toward large strength is thus obtained after
    the mesh and cell limits.
  During exploration write $h_d = d_(*) + h_d^U$. Relative to its centered posterior with the restricted band
    precision, the unvisited law has linear tilt
  $ L = - lambda sum_d \| d \| d_(*) h_d^U \, wide zeta^2 = C lambda^2 ell^2 sum_d \| d \| d_(*)^2 . $
  The latter quantity bounds its reference cost by (5.18). For one completed macroscopic cluster define $zeta_C^2$
    by replacing $d_(*)$ with $M_C \( d \)$, and put $E_2 = sum_("diam" C gt.eq r) zeta_C^2$.
    Weighted Jensen and (5.22) give
  #[#set math.equation(numbering: n => "(5.25)")
   $ bb(E)_(W \, N) zeta^(2 q) + bb(E)_(W \, N) E_2^q lt.eq C_(q \, lambda \, r) ell^(2 q) D_ell^(2 q) +
     o_k \( 1 \) . $ <eq:profile-tilt-moments>]
  When $zeta lt.eq 1$, the centered posterior $mu$ satisfies
  $ 1 lt.eq mu \( e^L \) \, wide mu \( e^(2 L) \) lt.eq e^(C zeta^2) \, wide mu \( \( e^L - 1 \)^2 \) lt.eq
    C' zeta^2 . $
  Thus fixed-cost posterior means and second moments change by $O \( zeta \)$, using their fourth moments.
    Large tilts are removed by polynomial truncation. In the size-biased exploration used below,
    the precise bound for fixed boxes $B \, i$ is
  #[#set math.equation(numbering: n => "(5.26)")
   $ sum_("diam" C gt.eq r) M_C \( B \) upright(bold(1))_({ zeta_C > 1 }) \( 1 + h_i^2 + M_C \( i \)^2 \) lt.eq
     sqrt(Q_B E_2) thin \( 1 + h_i^2 + Q_i \) . $ <eq:profile-large-tilts>]
  For $zeta_C lt.eq 1$, the corresponding errors are bounded by
    $sqrt(Q_B) \( 1 + sqrt(Q_i) \) \( sqrt(E_2) + E_2 \)$. Hölder, the weighted moments,
    and (5.25) make both expectations vanish at fixed $lambda$ after the mesh and cell limits.
    For exploration from a filled region the same conclusion follows directly by discarding $zeta >
    1$ using (5.25) and the actual band moments. The finite tilt estimates used here are [14]
    Equations (3.12)–(3.14); the argument above identifies the sequence limits of all their moment inputs.
  #emph[Vanishing reach.] It remains to show that exploration from $p$ is unlikely to cross the band and reach
    $V$. Choose finite small-cell coverings $i$ and $B$ on the starting and target sides, respectively,
    with fixed positive gaps from the band, the starting region, and the target region.
    They cover separator strips, so any crossing cluster meets a cell on each side.
    The radius $rho$ of these cells is fixed before the band refinement.
    Choose the macroscopic threshold $r > 0$ below the fixed separations that a cluster joining the starting
    region, either comparison strip, the band, or the target must span.
    Every cluster contributing to the cross terms below then has diameter at least $r$,
    and the previous moment and tilt estimates apply with this one threshold.
    Path anchoring bounds the remaining centered variance of an average in a reached cell by a constant $C_0$
    independent of $rho$. On the other hand, a logarithmic trial function supported away from the band gives the
    continuum band variance lower bound
  $ c a_(*) log \( 1 \/ rho \) - C . $
  The trial pays no band mass, so this bound is uniform in $lambda$.
    At a free wall it is restricted to the rectangle, which is permitted for the Neumann form.
    Since $a_(*) > 0$, choose $rho$ so small that the prior variance exceeds $C_0 + 2 c_0$ for a fixed $c_0 > 0$.
    The band limits then give a gap at least $c_0$ in the discrete laws,
    for each fixed strength and sufficiently fine partition and mesh.
    This is the only step that requires a positive height coefficient;
    it uses $a_(*) > 0$ in the limiting band law. The finite estimates require only $b in J$,
    with no assumption on $a \( b_k \)$.
  There are two useful consequences of this gap. Write a target average as exposed plus unvisited height.
    The centered posterior variance is at most the prior variance and loses at least $c_0$ if the cell is reached.
    Restoring its tilt has the vanishing errors just proved. Fair-sign resampling of the exposed term gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ c_0 bb(P)_(W \, N) \( B upright(" reached") \) lt.eq bb(E)_(W \, N) sum_(C : C ∩ p eq.not diameter)
     M_C \( B \)^2 + o \( 1 \) . $ <eq:profile-exterior-deficit>]
  Here and below $o \( 1 \)$ vanishes in the first two limits at fixed $lambda$.
    A second comparison starts by biasing with $\| h_x \|$, for $x in B$, and exposing its cluster.
    The finite size-bias inequality
  $ bb(E) \[ X^2 \| Y \| \] gt.eq bb(E) X^2 thin bb(E) \| Y \| $
  holds for real linear tests under centered band precision.
    It follows from the minimal characteristic logarithmic Hessian in the finite comparison rules:
    integrate $bb(E) \[ X^2 cos \( t Y \) \] lt.eq bb(E) X^2 thin bb(E) cos \( t Y \)$ against $2 thin d
    t \/ \( pi t^2 \)$ after subtracting the identity at zero.
    Consequently the pre-exposure second moment at $i$ is at least its unbiased variance.
    The completed-cluster bias cancels from the conditional complement law.
    Apply the same variance deficit, multiply by $bb(E) \| h_x \|$, and average $x$ over $B$. This yields
  #[#set math.equation(numbering: n => "(5.28)")
   $ c_0 bb(E)_(W \, N) sum_(C : C ∩ i eq.not diameter) M_C \( B \) lt.eq
     bb(E)_(W \, N) sum_C M_C \( B \) M_C \( i \)^2 + o \( 1 \) . $ <eq:profile-biased-deficit>]
  Only clusters spanning the fixed separation contribute to the exposed or tilted terms.
    They have a fixed positive diameter, so (5.26) justifies their summed errors.
    Equations (5.27) and (5.28) are the two finite deficit comparisons in [14] Equations (3.16)–(3.17),
    proof of Proposition 3.8.
  As $lambda arrow.r oo$, the inverse forms $T_lambda^(- 1)$ decrease to the inverse with a hard zero band on $K$.
    This follows from weak energy compactness and recovery by functions zero on $K$.
    The band separates $B$ from $i$, so $\( B \, T_lambda^(- 1) i \) arrow.r 0$.
    By (5.24), the limiting expectation of $sum_C M_C \( B \) M_C \( i \)$ therefore vanishes.
    On $max_C M_C \( i \) lt.eq R$, the right side of (5.28) is at most $R$ times this cross sum.
    Its remaining tail tends to zero as $R arrow.r oo$, uniformly after the first two limits and toward large
    $lambda$, because
  $ sum_C M_C \( B \) M_C \( i \)^2 lt.eq sqrt(Q_B) thin Q_i $
  and the $Q$’s have arbitrary fixed moments uniformly in that order of limits.
    Thus the first-mass sum on the left of (5.28) vanishes. Every cluster joining $p$ to $B$ visits some cell $i$.
    Truncating $max_C M_C \( B \)$ in (5.27) and applying these first-mass bounds,
    with the same moment control of its tail, proves
  #[#set math.equation(numbering: n => "(5.29)")
   $ lim_(lambda arrow.r oo) limsup_(ell arrow.b 0) limsup_(k arrow.r oo) limsup_(N arrow.r oo) bb(P)_(W \, N)
     #scale(x: 120%, y: 120%)[\(] upright("exploration from ") p upright(" reaches ") V
     #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:profile-vanishing-reach>]
  #emph[Pinned tests and the grounded approximation.] On a finite subdivided graph,
    explore every cluster meeting the primary pin region. If it does not reach $V$,
    the exposed part of $X_(g \, n)$ is zero. The centered posterior has the pin $p$,
    possibly further zero pins and increased segment precision, and a nonnegative restricted band form.
    Its variance is at most the variance of $X_(g \, n)$ under the primary hard-pin law on that subdivided graph,
    by finite precision comparison. At fixed primary graph, this latter variance converges as $N arrow.r
    oo$ to the Bessel hard-pin variance. The averaged tilt errors vanish as above.
    On failure, Cauchy–Schwarz bounds the actual second-moment contribution by the fourth-moment root times the
    square root of the failure probability. The band fourth moment is uniformly bounded in the successive limits,
    whereas (5.29) makes that probability vanish. Hence
  $ liminf_(k arrow.r oo) "Var"_p X_(g \, n) gt.eq a_(*) cal(E)_U \( g \, g \) . $
  The free variance bound gives the opposite limsup. For every real $t$,
    the finite lower bound for the logarithmic moment generating function and the upper bound obtained by
    releasing the pin give
  $ t^2 / 2 "Var"_p X_(g \, n) lt.eq log bb(E)_p e^(t X_(g \, n)) lt.eq log bb(E)_(upright("free")) e^(t X_(g \, n)) . $
  The free release is permitted because $A_(U \, n) g_n$ has total zero.
    The two endpoints converge to $a_(*) t^2 cal(E)_U \( g \, g \) \/ 2$.
    Applying this to finite linear combinations gives the joint Gaussian Laplace limit for these tests;
    uniform primary exponential moments give their polynomial moment limits.
    Weak free-face terms may be approximated first by bounded density smears in primary reference cost,
    with the gap from $p$ and $K$ preserved.
  Finally let $f$ be any bounded piecewise continuous density, and set $v = G_p f$.
    Smooth shifts $g_j$ vanishing near $p$, and allowed to meet the free walls, are dense in $cal(H)_p$ in energy.
    Choose $cal(E)_U \( v - g_j \, v - g_j \) arrow.r 0$. The ordinary mixed-form approximation on these
    rectangular geometries, as stated in [14] Section 3.1 and proof of Theorem 3.1, gives
  #[#set math.equation(numbering: n => "(5.30)")
   $ lim_(k arrow.r oo) cal(R)_(p \, n) #scale(x: 120%, y: 120%)[\(] f_n -
     A_(U \, n) g_(j \, n) #scale(x: 120%, y: 120%)[\)] = cal(E)_U \( v - g_j \, v - g_j \) \,
     $ <eq:profile-grounded-approximation>]
  where $cal(R)_(p \, n)$ is the squared dual norm of the unit-edge form grounded on $p$.
    To see the precise form of this approximation, let $A_(p \, n)$ be the restriction to unpinned coordinates and
    put $v_n = A_(p \, n)^(- 1) f_n$. The left side before its limit is
  $ \( f_n \, A_(p \, n)^(- 1) f_n \) - 2 \( f_n \, g_(j \, n) \) + \( g_(j \, n) \, A_(U \, n) g_(j \, n) \) . $
  Mixed inverse-form convergence, quadrature, and smooth energy consistency give respectively
    $cal(E)_U \( v \, v \)$, $cal(E)_U \( v \, g_j \)$, and $cal(E)_U \( g_j \, g_j \)$, proving (5.30).
    Values of a test on pinned vertices are immaterial in this norm.
    Equivalently, a flow representing its unpinned coefficients may discharge into the pinned vertices.
    This is why (5.30) imposes no zero-total condition on $f$.
  Uniform reference-cost bounds make the difference between the two smears in (5.30) tend to zero in every fixed
    moment, first as $k arrow.r oo$ and then $j arrow.r oo$. Their fixed linear exponential bounds give the same
    passage for Laplace transforms, by Cauchy–Schwarz applied to $e^(t \( h \, f_n \)) - e^(t X_(g_j \, n))$.
    The limiting variance is $a_(*) cal(E)_U \( v \, v \) = a_(*) integral_U f G_p f$.
    Apply the argument to every finite linear combination of the $f_i$’s and use polarization to obtain (5.12),
    with the asserted joint Laplace and moment convergence. ◻
]

Two choices of pin will be used below. If $D$ is an inner rectangle and $p =
  U \\ D$ is its positive-width rectangular rim, then $cal(H)_p$ identifies with $H_0^1 \( D \)$ by zero
  extension, and (5.12) is the Dirichlet covariance $a_(*) G_D$.
  If a positive-width primary collar surrounds a compactly supported shift inside an unwrapped torus rectangle,
  zero pinning that collar separates its interior law from the exterior.
  The lemma therefore applies to that interior law as well.

=== 5.5 Torus limits and uniform zero-coefficient estimates <torus-limits-and-uniform-zero-coefficient-estimates>

#thm([Proposition 5.5.])[
  (Gaussian laws at continuity scales).  #emph[Let $w$ be a continuity point of the extracted profile,
    let $delta_k log_L n_k arrow.r w$, and put $a_(*) = cal(A) \( w \)$.
    The free rectangular limits are those in Lemma 18; if $a_(*) > 0$,
    their fractional means have the conclusion of Lemma 19, and their fixed primary pinned geometries have the
    Gaussian Laplace and moment limits of Lemma 20. In particular,
    on a square interior surrounded by a fixed positive-width zero rim,
    the covariance of bounded piecewise continuous density smears converges to $a_(*) \( - Delta_D \)^(- 1)$,
    with Dirichlet boundary on that square.]
  #emph[On the zero-winding height torus of side $n_k$, every smooth periodic shift $g$ satisfies
#[#set math.equation(numbering: n => "(5.31)")
 $ "Var" \( h \, A_(upright("tor")) g_k \) arrow.r a_(*) integral_(bb(T)^2) \| nabla g \|^2 . $ <eq:profile-torus>]

 Thus the area-weighted first cosine observation in (3.29) has limiting variance $a_(*) frak(g)$, where $frak(g) =
   1 \/ \( 8 pi^2 \)$.]
] <prop:gaussian-profile>

#proof[
  The free and pinned assertions have been proved. For the torus upper bound, cut into small fixed rectangles,
    restrict the gradient test to each piece, and use (5.6). The omitted seams and the gradient approximations
    have uniformly vanishing reference cost. Therefore the limsup in (5.31) is at most its right side.
    This already proves the assertion when $a_(*) = 0$.
  For $a_(*) > 0$, first suppose that $g$ is supported in an unwrapped rectangle strictly inside one torus chart.
    Add primary zero pins on a collar of fixed positive width surrounding its support inside that chart.
    Centered precision comparison decreases variance. The collar separates the interior law from the torus
    exterior, and Lemma 20 gives the interior variance limit.
    Indeed the torus test equals the grounded interior test there, and $\( - Delta_D \)^(- 1) \( - Delta g \) =
    g$ because $g$ vanishes near the collar. Its variance is therefore $a_(*) integral \| nabla g \|^2$,
    matching the upper bound. For general $g$, use a finite smooth partition of unity to write $g$ as a sum of
    shifts supported in such charts. On each joint covariance subsequence the upper-bound defect is a positive
    semidefinite quadratic form. Since its diagonal vanishes on each summand,
    its cross terms with those summands vanish as well. It therefore vanishes on their sum.
  For the cosine density $f \( x \) = cos \( 2 pi x_1 \)$, its inverse torus Laplacian is $g =
    f \/ \( 4 pi^2 \)$ and $integral \| nabla g \|^2 = 1 \/ \( 8 pi^2 \)$.
    The discrete eigenvalue converges to $4 pi^2$ after multiplication by $n_k^2$.
    The normalizing correction has vanishing reference cost, which proves the last assertion. ◻
]

#thm([Corollary 5.6.])[
  (Uniform affine transforms on a zero interval).  #emph[Suppose $I = \[ u \, v \]
    subset \( 0 \, oo \)$ consists of continuity points of $cal(A)$ and $cal(A) = 0$ on $I$.
    Fix a compact set $K subset bb(R)^2$ and $lambda in bb(R)$.
    For a free square of side $m$ write $X_(m \, p) = \( h \, A_(B_m) \( p dot.op x \/ m \) \)$. Then
#[#set math.equation(numbering: n => "(5.32)")
 $ sup_(m in bb(N) : med delta_k log_L m in I\
p in K) lr(|bb(E)_(B_m \, b_k)^(upright("free")) e^(lambda X_(m \, p)) - 1|) arrow.r 0 . $ <eq:profile-zero-uniform>]

 The assertion is unchanged by translating the squares or multiplying their sides by factors in a fixed compact
   subset of $\( 0 \, oo \)$, provided their resulting logarithmic scales stay in a fixed zero-profile
   neighborhood of $I$.]
] <cor:profile-zero-uniform>

#proof[
  If $a_m \( b_k \)$ failed to tend to zero uniformly on the stated set,
    there would be offending $m_k$ and a subsequence with $delta_k log_L m_k arrow.r w in I$.
    This contradicts (5.3). Square symmetry gives $"Var" X_(m \, p) = a_m \( b_k \) \| p \|^2$,
    uniformly small for $p in K$. The reference exponential bound at $plus.minus 2
    lambda$ supplies uniform integrability of $e^(lambda X_(m \, p))$.
    Since $X_(m \, p) arrow.r 0$ in probability uniformly over these choices,
    the expectations tend to one uniformly. Translation does not change the law.
    The extra side factors change $delta_k log_L m$ by $o \( 1 \)$; compactness gives the last statement. ◻
]

=== 5.6 Excluding intermediate positive coefficients <excluding-intermediate-positive-coefficients>

The fixed-temperature coefficient gap in [14] Theorem 2.5 is proved by growth of a face characteristic
  coefficient. For a moving temperature, a single growth comparison cannot be iterated at arbitrarily many scales.
  We instead integrate those comparisons over a compact logarithmic interval.
  The initial characteristic coefficient must therefore have a quantitative lower bound on this interval.

Let $rho_m^(upright("sym"))$ be one quarter of the sum of the four face probabilities of $B_m$, and define

#[#set math.equation(numbering: n => "(5.33)")
 $ z_m \( b \) = bb(E)_(B_m \, b)^(upright("free")) e^(i \( h \, rho_m^(upright("sym")) \)) . $ <eq:profile-z>]

It is strictly positive and at most one.

#thm([Lemma 5.7.])[
  (Relative growth of the face phase).  #emph[There is $c > 0$,
    independent of sufficiently large fixed integer $G$, with the following property.
    If $w$ is a continuity point and $cal(A) \( w \) = a_(*) > 0$,
    then along every sequence $delta_k log_L m_k arrow.r w$,
#[#set math.equation(numbering: n => "(5.34)")
 $ liminf_k frac(z_(G m_k) \( b_k \), z_(m_k) \( b_k \)) gt.eq c G^(2 - a_(*) \/ \( 4 pi \)) . $ <eq:profile-ratio>]

 For each fixed such $G$ there is also $c \( G \) > 0$ such that
#[#set math.equation(numbering: n => "(5.35)")
 $ z_(G m) \( b \) \/ z_m \( b \) gt.eq c \( G \) $ <eq:profile-ratio-rough>]

 for all sufficiently large $m$ and all $b$ in the fixed compact temperature interval.]
] <lem:profile-ratio>

#proof[
  We use the finite soft joining formula [14] Equation (2.11). Tile $B_(G m)$ by $G^2$ free $m$-squares.
    The outer-face phase has cell totals $xi_i$, supported on boundary cells, with $sum_i xi_i =
    1$ and $sum_i xi_i^2 lt.eq C \/ G$. On the space of neutral cell totals choose a flow right inverse $P$ on the
    neighboring-cell graph, and let $rho_(i j)$ be the probability on the face of cell $i$ adjoining cell $j$.
    Define a vector $sans(H)$ in that neutral Euclidean space by
  $ \( sans(H) \, d \) = sum_(chevron.l i \, j chevron.r) P \( d \)_(i j)
    #scale(x: 120%, y: 120%)[\(] \( h_i \, rho_(i j) \) - \( h_j \, rho_(j i) \) -
    macron(eta)_(i j) #scale(x: 120%, y: 120%)[\)] \, $
  where $macron(eta)_(i j)$ is the mean of the independent Bessel seam increments with the same orientation.
    Translating cells by constants changes $sans(H)$ by the neutral projection of those constants.
    Penalize by $e^(- \| sans(H) \|^2 \/ 2)$ and sum relative translations,
    quotienting by their common translation. The auxiliary-confinement argument in the proof of Lemma 19 justifies
    the finite precision comparisons for these sums. Poisson summation gives the positive numerator
  #[#set math.equation(numbering: n => "(5.36)")
   $ sum_(q_i in bb(Z)\
sum_i q_i = 1) e^(- \| q - xi \|^2 \/ 2) thin product_i phi.alt_(m \, b)
  (s_i + sum_(j tilde.op i) P \( q - xi \)_(i j) rho_(i j)) chi_m \( P \( q - xi \) \) \, $ <eq:profile-soft-sum>]
  up to a common scalar. Here $s_i$ is the restriction of the outer phase to cell $i$,
    $rho_(i j)$ is its seam-face probability, and $chi_m$ is the characteristic function of the independent seam
    averages. The denominator is the corresponding sum with $s = 0$ and total zero.
    This follows by Fourier transforming the Gaussian penalty on the neutral space.
    The reciprocal of the projected cell-translation lattice is the neutral integer lattice.
    Exact seam matching adds centered precision, so the joined coefficient is at least this soft coefficient.
  For fixed $G$, the denominator tends to one along the sequence in (5.34). Its zero sector is one.
    Every nonzero sector contains a nonzero integer cell total and tends to zero by Lemma 19;
    the Gaussian weights permit dominated convergence. Each fixed-flux seam characteristic tends to one because
    the seam averages have variance $O \( m^(- 1) \)$.
  Retain the sectors $q = e_(i_0)$ with $i_0$ at distance at least $G \/ 4$ from the boundary.
    The radial flow of [14] Equation (2.14) has outward face fluxes $H_(i \, plus.minus j)$,
    constant outer flux $1 \/ \( 4 G \)$, and cell divergence $e_(i_0)$. Set
  $ D_(i j) = 1 / 2 \( H_(i \, + j) - H_(i \, - j) \) \, wide S_(i j) = H_(i \, + j) + H_(i \, - j) . $
  The unit-cell radial field, corrected to have constant boundary flux, gives
  #[#set math.equation(numbering: n => "(5.37)")
   $ sum_(i \, j) D_(i j)^2 lt.eq frac(1, 2 pi) log G + C \, wide sum_(i \, j) S_(i j)^2 lt.eq
     C . $ <eq:profile-radial-cost>]
  One may obtain it by integrating $\( x - x_0 \) \/ \( 2 pi \| x - x_0 \|^2 \) + E \( x \)$ across cell faces,
    where the Neumann boundary correction has $\| E \| lt.eq C \/ G$ and $\| nabla E \| lt.eq C \/ G^2$.
    The radial energy is $\( 2 pi \)^(- 1) log G + O \( 1 \)$, and the face-sum errors are summable.
    The constants are uniform for the retained central cells.
    Prescribe $P \( e_(i_0) - xi \)$ to be these flows for all retained $i_0$ and extend linearly.
    This is possible because the vectors $e_(i_0) - xi$ are linearly independent,
    their central coordinates being distinct.
  In each cell expand the logarithm of its characteristic coefficient about the symmetric four-face profile of the
    same total. Square symmetry makes the linear term vanish on every zero-total face perturbation.
    The logarithmic Hessian bound thus gives the product lower bound
  #[#set math.equation(numbering: n => "(5.38)")
   $ z_m \( b \) exp {- 1 / 2 sum_i "Var" \( h \, Y_i \)} \, $ <eq:profile-relative-lower>]
  where $Y_i$ is the difference from that symmetric profile.
    Since $q_i = S_(i 1) + S_(i 2)$, its decomposition is explicitly
  $ Y_i =  & sum_(j = 1)^2 D_(i j) \( rho_(i \, + j) - rho_(i \, - j) \)\
 & + frac(S_(i 1) - S_(i 2), 4) \( rho_(i \, + 1) + rho_(i \, - 1) - rho_(i \, + 2) - rho_(i \, - 2) \) . $
  Square reflections make these three components mutually orthogonal.
    The two odd face differences have variance exactly $a_m \( b \)$;
    the even component has reference cost at most $C \( S_(i 1)^2 + S_(i 2)^2 \)$. Lemma 18 and the reference bound give
  $ limsup_k sum_i "Var" \( h \, Y_i \) lt.eq a_(*) sum_(i \, j) D_(i j)^2 + C sum_(i \, j) S_(i j)^2 . $
  The Gaussian sector weight is bounded below because $\| e_(i_0) - xi \|$ is bounded.
    There are at least $c_0 G^2$ such sectors. Combining these facts with (5.37) proves (5.34).
    The additive energy constant and the even component constant are uniform, since $a_(*) lt.eq
    a$ and the reference bounds are uniform. Therefore its prefactor $c$ does not depend on $G$ or on the positive
    continuity value.
  For (5.35), keep $G$ fixed and retain just one central sector.
    Bound every variance in (5.38) by its reference cost. The soft denominator is at most the fixed
    finite-dimensional Gaussian lattice sum, since all its characteristic factors are at most one.
    The selected seam factor has a uniform positive lower bound:
    a mean over $m$ independent Bessel increments at fixed flux $q$ has characteristic function $exp { b
    m \( cos \( 2 pi q \/ m \) - 1 \) }$, which is bounded below uniformly in large $m$ and in the compact
    temperature interval. There are only finitely many seams. These bounds prove (5.35).
    Crucially, (5.38) retains the factor $z_m \( b \)$ regardless of how small it is. ◻
]

#thm([Lemma 5.8.])[
  (Critical lower bound for the face phase).  #emph[For the fixed buffer $D_0$ and block ratio $L$,
#[#set math.equation(numbering: n => "(5.39)")
 $ - log z_(D_0 L^j) \( b_c \) = o \( j \) \, wide j arrow.r oo . $ <eq:profile-subexponential>]

 Moreover $z_m \( b \) gt.eq z_m \( b_c \)$ whenever $b lt.eq b_c$.]
] <lem:profile-subexponential>

#proof[
  At $b_c$, [14] Equation (2.15), the fixed-temperature version of (5.34), has coefficient $a = 8 pi$.
    Taking $c_1$ to be the smaller of $1$ and half the prefactor in that liminf bound,
    we obtain a constant independent of sufficiently large fixed $r$ such that for $G = L^r$,
  $ z_(G m) \( b_c \) gt.eq c_1 z_m \( b_c \) $
  for all $m$ beyond a threshold depending on $r$. Fix $r$ and iterate on each residue class of $j$ modulo $r$.
    The finitely many initial coefficients are strictly positive. Hence
  $ liminf_(j arrow.r oo) j^(- 1) log z_(D_0 L^j) \( b_c \) gt.eq r^(- 1) log c_1 . $
  Now let $r arrow.r oo$ and use $z_m lt.eq 1$ to obtain (5.39).
    Characteristic coefficients decrease with $b$ by the chain precision comparison, giving the last claim.
    The lower bound is therefore uniform for all $b lt.eq b_c$. ◻
]

#thm([Proposition 5.9.])[
  (The profile has one jump, at the passage time).  #emph[The profile extracted in Proposition 17 satisfies
#[#set math.equation(numbering: n => "(5.40)")
 $ cal(A) \( w \) = a quad \( 0 < w < T \) \, wide cal(A) \( w \) = 0 quad \( w > T \) \, wide T = pi /
   sqrt(3 cal(P)) . $ <eq:profile-step>]

 In particular all points of these two open intervals are continuity points.
   No assertion about its value at the single point $T$ is needed.]
] <prop:profile-step>

#proof[
  First we exclude a continuity value in $\( 0 \, a \)$. If such a value exists,
    monotonicity and continuity give a compact interval $\[ u \, v \]
    subset \( 0 \, oo \)$ of positive length and $eta > 0$ such that all its continuity values lie in
    $\[ eta \, a - eta \]$. Choose a fixed integer stride $r$ so large that, for $G = L^r$,
    $c G^(2 - \( a - eta \) \/ \( 4 pi \)) > 2$, where $c$ is from Lemma 23.
  On one residue class modulo $r$ take consecutive indices $j$ for which $delta_k j$ runs across $\[ u \, v \]$,
    and define on their cells of width $delta_k r$ the step function
  $ F_k \( t \) = log frac(z_(D_0 L^(j + r)) \( b_k \), z_(D_0 L^j) \( b_k \)) . $
  Choose the endpoints of this union of cells to converge to $u \, v$.
    At almost every $t in \( u \, v \)$ the profile is continuous.
    The starting cell size has logarithmic scale tending to $t$, so (5.34) gives $liminf_k F_k \( t \) gt.eq
    log 2$. Equation (5.35) gives the common lower bound $F_k gt.eq log c \( G \)$.
    Extend by zero outside the chosen cells in a fixed enclosing interval. Fatou’s lemma therefore gives
  #[#set math.equation(numbering: n => "(5.41)")
   $ liminf_k integral F_k \( t \) thin d t gt.eq \( v - u \) log 2 > 0 . $ <eq:profile-fatou>]
  On the other hand, the integral telescopes exactly:
  $ integral F_k \( t \) thin d t = delta_k r #scale(x: 120%, y: 120%)[\[] log
    z_(D_0 L^(j_(+) \( k \))) \( b_k \) - log z_(D_0 L^(j_(-) \( k \))) \( b_k \) #scale(x: 120%, y: 120%)[\]] . $
  Since $z lt.eq 1$, Lemma 24 bounds its limsup by $limsup_k delta_k r thin o \( j_(-) \( k \) \) = 0$;
    here $delta_k j_(-) \( k \) arrow.r u > 0$. This contradicts (5.41).
    Thus every continuity value belongs to ${ 0 \, a }$.
  For $0 < w < T$, Proposition 16 gives the torus cosine variance limit $a frak(g)$,
    whereas Proposition 21 gives $cal(A) \( w \) frak(g)$ at continuity points.
    Thus $cal(A) \( w \) = a$ at all such points. Suppose a continuity point $w_0 > T$ also had value $a$.
    Monotonicity and the bound $cal(A) lt.eq a$ would make the profile identically $a$ on a neighborhood of $T$,
    so $T$ would be a continuity point. The moving exit sizes $n_(j_e) =
    D_0 L^(j_e)$ in Proposition 16 have $delta_k j_e arrow.r T$.
    Proposition 21 would give cosine variance tending to $a frak(g)$ there,
    contradicting the strictly smaller exit limsup. Every continuity point above $T$ therefore has value zero.
    Finally a monotone function whose values on the continuity points of an open interval are a single constant is
    that constant everywhere on the interval. This proves (5.40). ◻
]

== 6 From the height profile to the spin mass <sec:mass>

The height profile identifies a transition at the logarithmic scale $T$.
  We now show that the correlation length has this same scale.
  Positive pinned-height covariance below $T$ prevents a substantially shorter correlation length.
  Above $T$, small free-height fluctuations allow a circulation estimate with an arbitrarily large fixed tilt;
  a finite-size correlation inequality then gives the opposite bound.
  Both arguments concern the free-box thermodynamic correlation used in Theorem 1.

Throughout this section, fix a sequence $b_k < b_c$ tending to $b_c$, put $delta_k = sqrt(b_c - b_k)$,
  and pass to a subsequence furnished by Proposition 25. On this subsequence the height profile satisfies

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(A) \( w \) = a quad \( 0 < w < T \) \, wide cal(A) \( w \) = 0 quad \( w > T \) \, wide a =
   8 pi . $ <eq:mass-profile>]

All finite-graph estimates below are uniform when $b$ belongs to a fixed compact interval $I
  subset \( 0 \, oo \)$ containing the tail of $\( b_k \)$. We will prove

#[#set math.equation(numbering: n => "(6.2)")
 $ delta_k log_L frac(1, m \( b_k \)) arrow.r T . $ <eq:mass-scale-goal>]

=== 6.1 Correlation inequalities with the prescribed mass <correlation-inequalities-with-the-prescribed-mass>

For a finite graph $G$, write

$ C_(G \, b) \( u \, v \) = ⟨e^(i \( theta_u - theta_v \))⟩_(G \, b) \, wide
  C_(G \, b)^(\( 2 \)) \( u \, v \) = ⟨e^(2 i \( theta_u - theta_v \))⟩_(G \, b) . $

Here every edge has the cosine interaction with parameter $b$, and the boundary is free.
  Reflection of all angles makes these quantities real, and their Fourier expansions make them nonnegative.
  We use $C_b \( x \)$ for the infinite-volume free correlation between $0$ and $x in bb(Z)^2$, so $C_b \( r \) =
  C_b \( r e_1 \)$.

#thm([Lemma 6.1.])[
  #emph[For every $b > 0$ and $x in bb(Z)^2$,
#[#set math.equation(numbering: n => "(6.3)")
 $ C_b \( x \) lt.eq e^(- m \( b \) parallel x parallel_oo) . $ <eq:mass-pointwise>]

 If $G$ is a finite subgraph of $bb(Z)^2$, then
#[#set math.equation(numbering: n => "(6.4)")
 $ 0 lt.eq C_(G \, b)^(\( 2 \)) \( u \, v \) lt.eq 4 C_(G \, b) \( u \, v \) lt.eq
   4 C_b \( v - u \) . $ <eq:mass-charge-two>]

]
] <lem:mass-correlation-bounds>

#proof[
  The Ginibre inequalities [8] imply positive correlation for cosine characters and monotonicity of two-point
    correlations under increasing ferromagnetic edge couplings.
    In particular, finite free correlations are bounded above by their free-exhaustion limits;
    see also [18] Lemma 16. These limits are translation invariant:
    translating any finite graph gives another finite graph in the same monotone exhaustion.
  We first record supermultiplicativity. For three vertices $u \, v \, z$, Ginibre’s inequality gives
  $ ⟨cos \( theta_u - theta_v \) cos \( theta_z - theta_v \)⟩ gt.eq C_(G \, b) \( u \, v \) C_(G \, b) \( z \, v \) . $
  The expectation of $sin \( theta_u - theta_v \) sin \( theta_z - theta_v \)$ is nonnegative.
    To see this, condition on $theta_v$, rotate it to zero, and then condition on all cosine coordinates.
    Writing a sine coordinate as its absolute value times its sign,
    the remaining signs have a ferromagnetic zero-field Ising distribution:
    the sign coupling on an edge ${ x \, y }$ is $b \| sin theta_x sin theta_y \| gt.eq 0$.
    The sign at $v$, whose sine is zero, is irrelevant. Their two-point sign expectations are therefore
    nonnegative. The cosine addition formula now proves
  $ C_(G \, b) \( u \, z \) gt.eq C_(G \, b) \( u \, v \) C_(G \, b) \( v \, z \) . $
  After free exhaustion this becomes $C_b \( x + y \) gt.eq C_b \( x \) C_b \( y \)$.
    For every positive integer $n$, $C_b \( j n e_1 \) gt.eq C_b \( n e_1 \)^j$.
    Taking $j arrow.r oo$ in the definition of the axis mass yields $C_b \( n e_1 \) lt.eq e^(- m \( b \) n)$.
    If $x = \( p \, q \)$ and $\| p \| gt.eq \| q \|$, reflection symmetry and supermultiplicativity give
  $ C_b \( x \)^2 = C_b \( p \, q \) C_b \( p \, - q \) lt.eq C_b \( 2 p \, 0 \) lt.eq e^(- 2 m \( b \) \| p \|) . $
  Interchanging coordinates treats the other case and proves (6.3) with the mass specified in the statement of the
    main theorem.
  For the charge-two estimate, fix an axis and abbreviate $s_x = sin theta_x$, $c_x = cos theta_x$.
    Rotation invariance gives
  $ C_(G \, b) \( u \, v \) = 2 chevron.l s_u s_v chevron.r_(G \, b) \, wide C_(G \, b)^(\( 2 \)) \( u \, v \) =
    8 chevron.l c_u c_v s_u s_v chevron.r_(G \, b) . $
  The same conditional sign argument gives $chevron.l s_u s_v divides \( c_x \)_(x in G) chevron.r gt.eq 0$.
    Since $c_u c_v lt.eq 1$, the second identity is at most $8 chevron.l s_u s_v chevron.r_(G \, b) =
    4 C_(G \, b) \( u \, v \)$. Edge monotonicity finishes (6.4). ◻
]

=== 6.2 Pinned covariance gives a lower bound on length <pinned-covariance-gives-a-lower-bound-on-length>

We use the random-loop representation of the XY current due to van Engelenburg and Lis [18] Section 3.
  We describe its normalization because the height boundary condition and the loop orientation are important here.
  For each oriented edge of a finite graph $G$, let $n_(u v) in bb(Z)_(gt.eq 0)$ be a current.
  A current with zero divergence at every vertex has weight

#[#set math.equation(numbering: n => "(6.5)")
 $ product_({ u \, v } in E \( G \)) frac(\( b \/ 2 \)^(n_(u v) + n_(v u)), n_(u v) ! thin n_(v u) !) .
   $ <eq:mass-current-weight>]

Equivalently, take independent Poisson variables of mean $b \/
  2$ on the oriented edges and condition on zero divergence.
  For an unoriented edge put $N_e = n_(u v) + n_(v u)$, label its $N_e$ copies,
  and assign an orientation to each copy. Each labeled assignment receives edge weight $\( b \/ 2 \)^(N_e) \/
  N_e !$. At a vertex with $ell_v$ incoming and $ell_v$ outgoing half-edges,
  pair them by a uniformly chosen bijection. The resulting directed loops have weight

#[#set math.equation(numbering: n => "(6.6)")
 $ product_(e in E \( G \)) frac(\( b \/ 2 \)^(N_e), N_e !) product_(v in V \( G \)) frac(1, ell_v !) .
   $ <eq:mass-loop-weight>]

Indeed, summing orientations introduces the binomial factor $N_e ! \/ \( n_(u v) ! n_(v u) ! \)$,
  and summing pairings cancels the vertex factor. Thus this is a probability extension of the normalized current
  law (6.5).

Let $upright(bold(P))_(G \, b)$ denote this loop law. Given the undirected paired loops,
  their orientations are independent and fair. The reason is that $ell_v =
  deg \( v \) \/ 2$ is fixed by that paired geometry, so every choice of loop orientations has the same weight in
  (6.6). For a planar rectangle, current integration with exterior face height zero gives

#[#set math.equation(numbering: n => "(6.7)")
 $ h \( z \) = 2 pi sum_gamma W_gamma \( z \) \, $ <eq:mass-winding-height>]

where $W_gamma \( z \)$ is the oriented winding number of the loop $gamma$ around the bounded face $z$ [18]
  Proposition 7. The factor $2 pi$ accounts for our height spacing.

We will also use the following consequence of the loop switching identity [18] Lemma 8:

#[#set math.equation(numbering: n => "(6.8)")
 $ upright(bold(P))_(G \, b) { upright("a loop visits both ") u upright(" and ") v } lt.eq
   2 C_(G \, b)^(\( 2 \)) \( u \, v \) . $ <eq:mass-loop-connection>]

In the notation of that lemma, let $m_(u v)$ be the number of directed pieces of loops from $u$ to $v$ with no
  internal visit to either endpoint. A loop visiting both endpoints implies $m_(u v) gt.eq 1$,
  and the identity is $C_(G \, b)^(\( 2 \)) \( u \, v \) =
  upright(bold(E))_(G \, b) \[ m_(u v) \/ \( m_(u v) + 1 \) \]$.
  Thus (6.8) applies to precisely the normalized loop law above.

#thm([Lemma 6.2.])[
  (Separated height covariance).  #emph[Fix $d \, M \, c_1 > 0$ and a compact $I subset \( 0 \, oo \)$.
    Let $G_n$ be a free spin rectangle contained in a square of side $c_1 n$.
    On its bounded faces take the dual height law with exterior face height zero. Let
$ F_n = sum_z f_(n \, z) h \( z \) \, wide H_n = sum_z g_(n \, z) h \( z \) \, $

 where $sum_z \| f_(n \, z) \| \, sum_z \| g_(n \, z) \| lt.eq M$,
   and the two supports are separated horizontally by at least $d n$.
   There are constants $c \, C > 0$, depending only on the displayed fixed parameters, such that,
   for $b in I$ and sufficiently large $n$,
#[#set math.equation(numbering: n => "(6.9)")
 $ \| "Cov" \( F_n \, H_n \) \| lt.eq C n^12 e^(- c n m \( b \)) + C e^(- c n^4 log n) . $ <eq:mass-covariance-decay>]

]
] <lem:mass-loop-covariance>

#proof[
  Condition on the undirected paired geometry. Choose one reference orientation for each loop and write its random
    orientation as $sigma_gamma in { - 1 \, 1 }$. Equation (6.7) gives
  $ F_n = sum_gamma sigma_gamma F_n \( gamma \) \, wide H_n = sum_gamma sigma_gamma H_n \( gamma \) \, $
  where $F_n \( gamma \) = 2 pi sum_z f_(n \, z) W_gamma^(upright("ref")) \( z \)$,
    and similarly for $H_n \( gamma \)$. The conditional means vanish,
    and the conditional covariance is $sum_gamma F_n \( gamma \) H_n \( gamma \)$.
    If one summand is nonzero, the loop has nonzero winding around at least one face in each support.
    Each such face lies in the horizontal range of the loop. Consequently this loop has horizontal diameter at
    least $d n - O \( 1 \)$.
  Let $N = sum_e N_e$ be the total number of traversals, and let $cal(B)_n$ be the event that some loop has
    horizontal diameter at least $d n \/ 2$. A loop of length $\| gamma \|$ has winding number at most $\|
    gamma \|$ in absolute value. Hence
  $ lr(|sum_gamma F_n \( gamma \) H_n \( gamma \)|) lt.eq \( 2 pi M \)^2 sum_gamma \| gamma \|^2 thin
    upright(bold(1))_(cal(B)_n) lt.eq \( 2 pi M \)^2 N^2 upright(bold(1))_(cal(B)_n) . $
  There are $O \( n^4 \)$ ordered pairs of vertices in $G_n$.
    A loop counted by $cal(B)_n$ visits a pair separated by at least $d n \/ 2$. Using (6.8) and Lemma 26, we obtain
  $ upright(bold(P))_(G_n \, b) \( cal(B)_n \) lt.eq C n^4 e^(- c n m \( b \)) . $
  On $N lt.eq n^4$, the preceding conditional-covariance bound is therefore at most $C n^12
    e^(- c n m \( b \))$ after expectation.
  It remains to bound the weighted tail of $N$. Before the zero-divergence conditioning,
    $N$ is Poisson with mean $mu = b \| E \( G_n \) \| lt.eq C_I n^2$.
    The probability of that conditioning event is at least the probability of the zero configuration,
    namely $e^(- mu)$. Thus
  $ upright(bold(E))_(G_n \, b) \[ N^2 upright(bold(1))_({ N > n^4 }) \] lt.eq
    e^mu thin bb(E)_("Pois" \( mu \)) \[ N^2 upright(bold(1))_({ N > n^4 }) \] lt.eq C e^(- c n^4 log n) . $
  For the last estimate one may use the Poisson exponential moment with parameter $log n$:
    its logarithm is $mu \( n - 1 \) = O \( n^3 \)$, whereas the tail factor is $e^(- n^4 log n)$;
    the polynomial insertion changes only a polynomial prefactor. Pairings do not change the marginal law of $N$.
    This proves (6.9). ◻
]

We apply the lemma to the nondegenerate pinned limits supplied by Proposition 21.
  Let $D = \( 0 \, 1 \)^2$, take a larger fixed rectangle $U$,
  and pin every primary height in a positive-width rim $p = U \\ D$,
  with the usual admissible rounding at mesh $n^(- 1)$. Choose the unpinned vertices to be exactly the $n$-by-$n$
  grid of bounded faces of the spin rectangle ${ 0 \, dots.h \, n }^2$.
  This is only a translation and an $O \( n^(- 1) \)$ rounding of the primary mesh.

The resulting interior height law is exactly the dual law of that #emph[free] spin rectangle.
  All pin–pin edge factors cancel from the normalized law. Every edge from an unpinned face to the pinned rim
  becomes an edge to the exterior face; their multiplicities are retained.
  In particular a corner face has two such exterior edges. There are no fixed boundary spins or additional period
  constraints. This agrees with free-boundary duality [14] Lemma 2.1.

Fix smooth nonzero functions $f \, g gt.eq 0$, compactly supported in two interior boxes in $D$ with positive
  horizontal separation, and put

$ F_n = n^(- 2) sum_z f \( z \/ n \) h \( z \) \, wide H_n = n^(- 2) sum_z g \( z \/ n \) h \( z \) . $

The harmless translations of face centers are included in the argument of the sampled functions.
  If $delta_k log_L n_k arrow.r w in \( 0 \, T \)$, Proposition 21 gives

#[#set math.equation(numbering: n => "(6.10)")
 $ "Cov"_(b_k \, p) \( F_(n_k) \, H_(n_k) \) arrow.r a integral_D integral_D f \( z \) G_D \( z \, z' \)
   g \( z' \) thin d z thin d z' > 0 \, $ <eq:mass-positive-pinned>]

where $G_D$ is the Dirichlet Green kernel on $D$. The strict inequality follows from its positivity in the
  connected square. These smears have nonzero total mass. Their convergence uses the grounded inverse-form part of
  Proposition 21: the primary zero rim fixes the constant, and the approximation cost is the grounded cost on $D$.
  No mean-zero condition is imposed on $f$ or $g$.

#thm([Proposition 6.3.])[
  #emph[Along the extracted sequence,
#[#set math.equation(numbering: n => "(6.11)")
 $ liminf_k delta_k log_L frac(1, m \( b_k \)) gt.eq T . $ <eq:mass-liminf>]

]
] <prop:mass-lower-length>

#proof[
  If the assertion failed, a further subsequence and numbers $0 < w < T$, $eta > 0$ would satisfy
  $ delta_k log_L frac(1, m \( b_k \)) lt.eq w - 2 eta . $
  Take $n_k = floor.l L^(w \/ delta_k) floor.r$. Then, for all large $k$,
  $ n_k m \( b_k \) gt.eq L^(eta \/ delta_k) gt.eq n_k^(eta \/ \( 2 w \)) . $
  The coefficients of $F_(n_k)$ and $H_(n_k)$ have uniformly bounded absolute sums.
    Lemma 27 makes their covariance tend to zero, because an exponential in a positive power of $n_k$ dominates
    the polynomial in (6.9). This contradicts (6.10). ◻
]

=== 6.3 Zero coefficient on an interval gives strong decay <zero-coefficient-on-an-interval-gives-strong-decay>

We next use the part of the profile above $T$. The argument is a finite-scale version of the circulation proof of
  [14] Proposition 2.6. Its relevant input is especially simple:
  on a compact interval of logarithmic scales with zero coefficient,
  the transforms of bounded affine tests on free squares tend uniformly to one.
  This is Corollary 22; it follows from vanishing affine variance and the uniform reference exponential moments.
  The tilt below is fixed before the limit in $k$.

#thm([Proposition 6.4.])[
  #emph[Fix $w' > T$, positive integers $r_k$ satisfying $delta_k log_L r_k arrow.r w'$,
    and constants $0 < c_0 < C_0 < oo$. For every $K > 0$, all sufficiently large $k$ satisfy
#[#set math.equation(numbering: n => "(6.12)")
 $ sup_(c_0 r_k lt.eq parallel x parallel_oo lt.eq C_0 r_k) C_(b_k) \( x \) lt.eq r_k^(- K) . $ <eq:mass-polynomial>]

]
] <prop:mass-polynomial>

#proof[
  Choose $T < u < v < w'$, and use radii
  $ cal(R)_k = { 4^j : j in bb(Z) \, quad u lt.eq delta_k log_L \( 4^j \) lt.eq v } . $
  Their number $N_k$ obeys
  #[#set math.equation(numbering: n => "(6.13)")
   $ N_k = frac(v - u, delta_k log_L 4) + O \( 1 \) \, wide frac(N_k, log r_k) arrow.r q :=
     frac(v - u, w' log 4) > 0 . $ <eq:mass-annulus-count>]
  For $R in cal(R)_k$, the annuli $R < \| z \| < 2 R$ about the source at $0$ are disjoint.
    Their maximal radius is $o \( r_k \)$; therefore they avoid the other source $x$,
    uniformly over the displacements in the proposition. Figure 2 compares this annular geometry with the pinned
    geometry used for the lower bound.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0.3, 0.3), (4.3, 4.3), fill: rgb("#e8e8e8"), stroke: none)
  rect((0.8, 0.8), (3.8, 3.8), fill: rgb("#ffffff"), stroke: none)
  rect((0.3, 0.3), (4.3, 4.3), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  rect((0.8, 0.8), (3.8, 3.8), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.3, 4.05), [#text(size: 9pt)[$h=0$]])
  content((3.78, 3.78), [#text(size: 9pt)[$D$]], anchor: "north-east", padding: 0.1176cm)
  rect((1.27, 1.92), (1.77, 2.68), fill: rgb("#d1d1ff"), stroke: none)
  rect((2.83, 1.92), (3.33, 2.68), fill: rgb("#ffe3c7"), stroke: none)
  content((1.52, 2.3), [#text(size: 9pt)[$f$]])
  content((3.08, 2.3), [#text(size: 9pt)[$g$]])
  circle((2.3, 2.3), radius: (1.27, 0.82), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((1.94, 3.086), (2.2, 3.118), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((1.77, 1.17), (2.83, 1.17), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((2.3, 1.17), [#text(size: 9pt)[$c n$]], anchor: "north", padding: 0.1176cm)
  content((2.3, -0.2), [#text(size: 9pt)[Pinned covariance below $T$]])
  compound-path({circle((8.6, 2.3), radius: 1.68, fill: rgb("#e0e0ff"), stroke: none); circle((8.6, 2.3), radius: 1.4, fill: rgb("#e0e0ff"), stroke: none); line((8.6, 2.3), (8.6, 2.3))}, fill: rgb("#e0e0ff"), fill-rule: "even-odd", stroke: none)
  compound-path({circle((8.6, 2.3), radius: 0.42, fill: rgb("#e0e0ff"), stroke: none); circle((8.6, 2.3), radius: 0.35, fill: rgb("#e0e0ff"), stroke: none); line((8.6, 2.3), (8.6, 2.3))}, fill: rgb("#e0e0ff"), fill-rule: "even-odd", stroke: none)
  circle((8.6, 2.3), radius: 1.4, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  circle((8.6, 2.3), radius: 1.68, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  circle((8.6, 2.3), radius: 0.35, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  circle((8.6, 2.3), radius: 0.42, stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  circle((8.6, 2.3), radius: 0.035, fill: black, stroke: none)
  content((8.6, 2.3), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  circle((11.2, 2.3), radius: 0.035, fill: black, stroke: none)
  content((11.2, 2.3), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((9.05, 2.3), (11.13, 2.3), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((9.5, 3.35), [#text(size: 9pt)[$4R$]])
  content((8.77, 1.88), [#text(size: 8pt)[$R$]], anchor: "north-west", padding: 0.1176cm)
  arc((8.27, 3.16), start: 111deg, stop: 145deg, radius: 0.92, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000099"))))
  content((8.6, 0.22), [#text(size: 9pt)[$delta log_"LR"_i in [u,v] subset (T,w')$]])
  content((8.6, -0.2), [#text(size: 9pt)[Circulation tilts above $T$]])
})],
    caption: [Figure 2: Two finite geometries for the mass comparison. Left: a primary pin region of positive width surrounds $D$. A loop contributing to the covariance of two separated density smears must have diameter at least their separation. The displayed loop is schematic. Right: geometrically spaced annuli surround one spin insertion and remain inside the separation scale of the other. Only two annuli are drawn. Their logarithmic scales lie in an interval where the height coefficient vanishes, so a fixed circulation tilt has arbitrarily small fluctuation cost on each annulus. ],
  ) <fig:mass-geometry>
  Choose a nonnegative, nonzero smooth radial function $chi$ supported in $\( 1 \, 2 \)$, and let
  $ p \( z \) = chi \( \| z \| \) nabla arg z \, wide D = integral_(bb(R)^2) p \( z \) dot.op nabla arg z thin d
    z > 0 . $
  This is a smooth divergence-free form, compactly supported in the unit annulus.
    Choose its radial stream function $psi$, constant on each complementary component, with $nabla^perp psi = p$.
    At scale $R$, sample $psi_R \( z \) = psi \( z \/ R \)$ on the faces of the primary height graph and take its
    rotated discrete difference. Denote the resulting edge form by $eta_R$,
    choosing its sign to agree with the positive source. Thus, on an edge with midpoint $z_e$,
    its corresponding coordinate is $R^(- 1) p \( z_e \/ R \) + O \( R^(- 2) \)$. It has zero discrete divergence,
  #[#set math.equation(numbering: n => "(6.14)")
   $ max_e \| eta_R \( e \) \| lt.eq C \/ R \, wide sum_e \| eta_R \( e \) \|^2 lt.eq C . $ <eq:mass-annulus-form>]
  For any affine height difference $nabla h + alpha$ representing the unit spin twist at $0 \, x$,
    discrete summation by parts gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ sum_e eta_R \( e \) \( nabla h + alpha \)_e = D_R \, wide D_R arrow.r
     D > 0 . $ <eq:mass-deterministic-circulation>]
  Indeed the gradient part pairs to zero. The remaining pairing is the difference of the stream-function values at
    the two source faces, multiplied by their circulations $plus.minus 2 pi$.
    The stream function is constant near each source, so there is no dependence on the height configuration or on
    the path chosen for $alpha$. The convergence in (6.15) also follows directly by Riemann sums;
    its error is uniform here because the second source lies outside every annulus.
    Fix $d_(upright("circ")) > 0$ so that $D_R gt.eq d_(upright("circ"))$ for all sufficiently large radii.
  We make the partition-ratio estimate at fixed $k \, x$ in a finite free spin box large enough to contain all
    these annuli in its interior. Write $Z_alpha$ and $Z_0$ for the twisted and centered height sums,
    both with exterior face height zero. Free-boundary duality gives $C_(G \, b_k) \( 0 \, x \) = Z_alpha \/ Z_0$.
    For any fixed $lambda > 0$, insertion of the deterministic tilt from (6.15) gives the exact identity
  #[#set math.equation(numbering: n => "(6.16)")
   $ e^(lambda sum_(R in cal(R)_k) D_R) C_(G \, b_k) \( 0 \, x \) =
     frac(Z_alpha (e^(lambda sum_R \( eta_R \, nabla h + alpha \))), Z_0) . $ <eq:mass-tilted-ratio>]
  Here $Z_alpha \( F \)$ means the unnormalized twisted sum with insertion $F$.
    We will bound the right side independently of the outer spin box.
  Fix a small relative cell size $t > 0$. Cover the support of each $eta_R$ by square primary cells of side $m_R =
    floor.l t R floor.r$, with disjoint vertex sets, leaving individual edges between cells as seam increments.
    The support of $chi$ has positive distance from the annular boundary.
    Thus for sufficiently small fixed $t$, every cell meeting this support lies inside the annulus,
    avoids both sources, and is simply connected. There are $O \( t^(- 2) \)$ such cells at each radius.
    Edges not in a retained cell and carrying a nonzero tilt number $O_t \( R \)$.
  Release the endpoint constraints between these cells and the seam increments,
    and release all remaining constraints outside the cells. The tilted affine-to-centered comparison [14]
    Lemma 2.2(ii) bounds the normalized expression in (6.16) by the product of the cell transforms and the
    independent whole-edge seam transforms. Untilted factors on the rest of the graph have affine-to-centered
    ratio at most one. On a retained cell the connection is an integral gradient, $alpha = nabla kappa$;
    reindexing $h' = h + kappa$ removes it from both the weight and the statistic being tilted.
    Accordingly the factor for that cell is the centered free transform
  $ bb(E)_(Q \, b_k)^(upright("free")) exp { lambda \( eta_R \, nabla h \)_Q } . $
  In particular, this gauge change introduces no additional real exponential factor.
    Released constant modes are taken modulo common translations;
    the edge-difference tests annihilate every such constant.
    Equivalently, one can retain vanishing quadratic penalties on these constants in both sectors and cancel their
    identical factors before removing them. No outer-box normalizer is present in the resulting bound.
  We now estimate the factors for one annulus. The total squared coefficient cost of its seam increments is
    $O_t \( R^(- 1) \)$ by (6.14). The Bessel increment transform is $exp { b_k \( cosh \( 2 pi s \) - 1 \) }$,
    so their combined logarithmic cost is $O_(t \, lambda) \( R^(- 1) \)$, uniformly in $k$.
    On each retained square replace $eta_R$ by its value at a chosen point of the square.
    Smoothness of $p$ makes the total squared cost of the coefficient error over all cells $O \( t^2 \) +
    o_R \( 1 \)$. The bounded-flow estimate (2.6) and Hölder’s inequality with exponent two therefore give
  #[#set math.equation(numbering: n => "(6.17)")
   $ & sum_Q log bb(E)_(Q \, b_k)^(upright("free")) e^(lambda \( eta_R \, nabla h \)_Q)\
 & wide lt.eq 1 / 2 sum_Q log bb(E)_(Q \, b_k)^(upright("free"))
   e^(2 lambda \( macron(eta)_(R \, Q) \, nabla h \)_Q) + C_lambda t^2 + o_(t \, lambda \, R) \( 1 \) \,
   $ <eq:mass-affine-cell-reduction>]
  where $macron(eta)_(R \, Q)$ is the constant coefficient on $Q$.
    The error coefficients multiplied by the fixed tilt are uniformly bounded, as required by (2.6).
    That estimate bounds each error transform by its squared coefficient cost.
    Summing the costs gives the total $C_lambda t^2$ in (6.17).
  Each constant test in the sum is a linear combination of the two square affine observations defining
    $a_(m_R) \( b_k \)$. Its coefficient vector has size at most $C_lambda m_R \/ R lt.eq C_lambda t$.
    Translations of the square do not change its law. Moreover,
  $ delta_k log_L m_R = delta_k log_L R + delta_k log_L t + o \( 1 \) . $
  Thus these scales lie in a slightly enlarged compact subinterval of $\( T \, w' \)$ for all large $k$.
    By Corollary 22, the transforms of these affine tests tend uniformly to one,
    uniformly also in their bounded coefficient vectors. Since the number of cells is uniformly bounded once $t$
    is fixed, their total logarithmic cost is $o_k \( 1 \)$ uniformly over $R in cal(R)_k$.
    The reference estimates and $min cal(R)_k arrow.r oo$ also make all seam and discretization errors uniform.
    We obtain, for every fixed $lambda \, t$, the per-annulus bound
  #[#set math.equation(numbering: n => "(6.18)")
   $ log \( upright("product of its transforms") \) lt.eq C_lambda t^2 + o_k \( 1 \) . $ <eq:mass-annulus-cost>]
  Choose $lambda$ first, and then $t$ so small that $C_lambda t^2 lt.eq lambda d_(upright("circ")) \/ 4$.
    For all sufficiently large $k$, the uniform error in (6.18) is at most $lambda d_(upright("circ")) \/ 4$.
    Equations (6.16) and (6.13) imply
  $ C_(G \, b_k) \( 0 \, x \) lt.eq exp { - lambda d_(upright("circ")) N_k \/ 2 } . $
  This estimate holds uniformly in every sufficiently large outer spin box, at the fixed values of $b_k \, r_k \,
    x$. We may therefore first take the prescribed free-box thermodynamic limit.
    The resulting estimate for $C_(b_k) \( x \)$ is uniform in the indicated range of $x$.
    Finally choose the fixed $lambda$ large enough that $lambda d_(upright("circ")) q \/ 4 > K$.
    Equation (6.13) then gives (6.12). ◻
]

=== 6.4 A finite-size criterion and completion of the proof <a-finite-size-criterion-and-completion-of-the-proof>

The Lieb–Rivasseau inequality for plane rotators [12,17], in the form stated in [18] Lemma 17,
  says that for a finite subgraph $H subset G$, $u in H$, and $v in.not H$,

#[#set math.equation(numbering: n => "(6.19)")
 $ C_(G \, b) \( u \, v \) lt.eq sum_(z in partial H) C_(H \, b) \( u \, z \) C_(G \, b) \( z \, v \) .
   $ <eq:mass-lieb-rivasseau>]

Here $partial H$ is the set of vertices of $H$ adjacent to a vertex outside $H$;
  the first factor is the correlation with free boundary on $H$.
  We give the iteration so its conclusion refers to exactly the axis mass of this paper.

#thm([Lemma 6.5.])[
  #emph[Let $H_r = \[ - r \, r \]^2 ∩ bb(Z)^2$, and put
$ S_(r \, b) = sum_(z in partial H_r) C_(H_r \, b) \( 0 \, z \) . $

 If $S_(r \, b) lt.eq 1 \/ 2$, then $m \( b \) gt.eq \( log 2 \) \/ r$.]
] <lem:mass-finite-size>

#proof[
  At fixed $b \, r$, take the free-box thermodynamic limit in (6.19).
    For a target $s e_1$, apply the inequality successively in translates of $H_r$ centered at the boundary point
    reached in the previous step. Each step moves the center by at most $r$ in the supremum norm.
    Hence at least $floor.l s \/ r floor.r - 1$ iterations are possible before the target can belong to the next
    translated square. Translation invariance and $C_b lt.eq 1$ give
  $ C_b \( s e_1 \) lt.eq S_(r \, b)^(floor.l s \/ r floor.r - 1) . $
  Taking $- s^(- 1) log$ and then $s arrow.r oo$ proves the claim. ◻
]

#thm([Proposition 6.6.])[
  #emph[Along the extracted sequence,
#[#set math.equation(numbering: n => "(6.20)")
 $ limsup_k delta_k log_L frac(1, m \( b_k \)) lt.eq T . $ <eq:mass-limsup>]

]
] <prop:mass-upper-length>

#proof[
  Fix $w' > T$, and set $r_k = floor.l L^(w' \/ delta_k) floor.r$.
    Proposition 29, with any fixed $K > 1$, and finite-to-infinite monotonicity imply
  $ S_(r_k \, b_k) lt.eq sum_(z in partial H_(r_k)) C_(b_k) \( z \) lt.eq 8 r_k thin r_k^(- K) < 1 / 2 $
  for all sufficiently large $k$. Thus Lemma 30 yields $m \( b_k \) gt.eq \( log 2 \) \/ r_k$. Consequently
  $ limsup_k delta_k log_L frac(1, m \( b_k \)) lt.eq lim_k delta_k log_L frac(r_k, log 2) = w' . $
  Letting $w' arrow.b T$ proves (6.20). ◻
]

#proof[
  Start with any sequence $b_k < b_c$ tending to $b_c$. The construction in Sections 4 and 5 admits a subsequence
    with the profile (6.1). Its transition point is
  $ T = pi / sqrt(3 cal(P)) \, $
  where $cal(P) in \( 0 \, oo \)$ is independent of the extracted sequence.
    Propositions 28 and 31 prove (6.2) on that subsequence. If the asserted limit failed for the original
    parameter approach, there would be a sequence on which its distance from $T$ stayed bounded below;
    applying the same extraction to that sequence would give a contradiction.
    Therefore the logarithmic-scale limit holds as $b arrow.t b_c$ without extraction.
    Converting from base $L$ to natural logarithms gives
  $ lim_(b arrow.t b_c) sqrt(b_c - b) log frac(1, m \( b \)) = \( log L \) thin T =
    frac(pi log L, sqrt(3 cal(P))) = : A_(upright("XY")) in \( 0 \, oo \) . $
  All spin correlations used above are limits of the prescribed free spin boxes before their separation tends to
    infinity. Thus the mass in this identity is exactly the mass in Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman, M.~Harel, R.~Peled, and J.~Shapiro,
  Depinning in integer-restricted Gaussian fields and BKT phases of two-component spin models, preprint,
  revised May 27, 2022. #link("https://arxiv.org/abs/2110.09498v3")[arXiv:2110.09498v3].]
#bibitem([2])[R.~Bauerschmidt, J.~Park, and P.-F.~Rodriguez, The Discrete Gaussian model, I.
  Renormalisation group flow at high temperature, #emph[The Annals of Probability] #strong[52] (2024), 1253--1359.
  #link("https://doi.org/10.1214/23-AOP1658")[doi:10.1214/23-AOP1658].]
#bibitem([3])[R.~Bauerschmidt, J.~Park, and P.-F.~Rodriguez, The Discrete Gaussian model, II.
  Infinite-volume scaling limit at high temperature, #emph[The Annals of Probability] #strong[52] (2024),
  1360--1398. #link("https://doi.org/10.1214/23-AOP1659")[doi:10.1214/23-AOP1659].]
#bibitem([4])[V.~L.~Berezinskii, Destruction of long-range order in one-dimensional and two-dimensional systems
  having a continuous symmetry group. I. Classical systems, #emph[Soviet Physics JETP] #strong[32] (1971),
  493--500. #link("https://www.jetp.ras.ru/cgi-bin/dn/e_032_03_0493.pdf")[English translation].]
#bibitem([5])[T.~Durand and P.~Lammers, The BKT transition and surface tension differentiability, preprint,
  May 27, 2026. #link("https://arxiv.org/abs/2605.28473v1")[arXiv:2605.28473v1].]
#bibitem([6])[P.~Falco, Critical exponents of the two dimensional Coulomb gas at the
  Berezinskii--Kosterlitz--Thouless transition, preprint, revised November 25, 2013.
  #link("https://arxiv.org/abs/1311.2237v2")[arXiv:1311.2237v2].]
#bibitem([7])[J.~Fröhlich and T.~Spencer, The Kosterlitz--Thouless transition in two-dimensional Abelian spin
  systems and the Coulomb gas, #emph[Communications in Mathematical Physics] #strong[81] (1981), 527--602.
  #link("https://doi.org/10.1007/BF01208273")[doi:10.1007/BF01208273].]
#bibitem([8])[J.~Ginibre, General formulation of Griffiths' inequalities,
  #emph[Communications in Mathematical Physics] #strong[16] (1970), 310--328.
  #link("https://doi.org/10.1007/BF01646537")[doi:10.1007/BF01646537].]
#bibitem([9])[J.~M.~Kosterlitz, The critical properties of the two-dimensional XY model,
  #emph[Journal of Physics C: Solid State Physics] #strong[7] (1974), 1046--1060.
  #link("https://doi.org/10.1088/0022-3719/7/6/005")[doi:10.1088/0022-3719/7/6/005].]
#bibitem([10])[J.~M.~Kosterlitz and D.~J.~Thouless, Ordering,
  metastability and phase transitions in two-dimensional systems, #emph[Journal of Physics C:
  Solid State Physics] #strong[6] (1973), 1181--1203.
  #link("https://doi.org/10.1088/0022-3719/6/7/010")[doi:10.1088/0022-3719/6/7/010].]
#bibitem([11])[P.~Lammers, Bijecting the BKT transition, preprint, revised April 18, 2023.
  #link("https://arxiv.org/abs/2301.06905v2")[arXiv:2301.06905v2].]
#bibitem([12])[E.~H.~Lieb, A refinement of Simon's correlation inequality,
  #emph[Communications in Mathematical Physics] #strong[77] (1980), 127--135.
  #link("https://doi.org/10.1007/BF01982712")[doi:10.1007/BF01982712].]
#bibitem([13])[T.~Lupu, From loop clusters and random interlacements to the free field,
  #emph[The Annals of Probability] #strong[44] (2016), 2117--2146.
  #link("https://doi.org/10.1214/15-AOP1019")[doi:10.1214/15-AOP1019]. Author's version:
  #link("https://arxiv.org/abs/1402.0298v7")[arXiv:1402.0298v7].]
#bibitem([14])[OpenAI, The critical correlation exponent of the planar XY model,
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026/paper.pdf")[OAI:The-critical-correlation-exponent-of-the-planar-XY-model-September-24-2026],
  2026.]
#bibitem([15])[OpenAI, The critical logarithmic correction for the planar XY model,
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-critical-logarithmic-correction-for-the-planar-XY-model-October-5-2026/paper.pdf")[OAI:The-critical-logarithmic-correction-for-the-planar-XY-model-October-5-2026],
  2026.]
#bibitem([16])[O.~Regev and N.~Stephens-Davidowitz, An inequality for Gaussians on lattices,
  #emph[SIAM Journal on Discrete Mathematics] #strong[31] (2017), 749--757.
  #link("https://doi.org/10.1137/15M1052226")[doi:10.1137/15M1052226].]
#bibitem([17])[V.~Rivasseau, Lieb's correlation inequality for plane rotors,
  #emph[Communications in Mathematical Physics] #strong[77] (1980), 145--147.
  #link("https://doi.org/10.1007/BF01982714")[doi:10.1007/BF01982714].]
#bibitem([18])[D.~van Engelenburg and M.~Lis, An elementary proof of phase transition in the planar XY model,
  #emph[Communications in Mathematical Physics] #strong[399] (2023), 85--104.
  #link("https://doi.org/10.1007/s00220-022-04550-3")[doi:10.1007/s00220-022-04550-3].]
