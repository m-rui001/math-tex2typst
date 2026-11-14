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

#align(center)[#text(size: 16pt, weight: "bold")[A dimension-free logarithmic Sobolev inequality \
for subgaussian log-concave measures]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A logarithmic Sobolev inequality controls the entropy of a function by its Dirichlet energy.
  Besides implying a Poincaré inequality, it gives Gaussian concentration for Lipschitz functions.
  For a log-concave measure, a natural question is whether Gaussian tails of all #emph[linear] functions already
  force this stronger conclusion. We prove that they do, with a constant independent of dimension.

For a probability measure $nu$ and a nonnegative integrable function $g$, write

$ "Ent"_nu \( g \) = integral g log g thin d nu - (integral g thin d nu) log (integral g thin d nu) \, $

with $0 log 0 = 0$. A Lebesgue density $rho$ on $bb(R)^n$ is log-concave if its positive set is convex and $log
  rho$ is concave there. We call a centered random vector $X$ #emph[linearly $a$-subgaussian] if

#[#set math.equation(numbering: n => "(1.1)")
 $ sup_(\| theta \| = 1) bb(E) exp #h(-0.16667em) (frac(chevron.l X \, theta chevron.r^2, a^2)) lt.eq
   2 . $ <eq:intro-subgaussian>]

This definition concerns only linear functions of $X$. We write $D$ for the Euclidean gradient.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C < oo$ with the following property.
    For every $n gt.eq 1$, every centered log-concave probability measure $mu$ with a Lebesgue density on
    $bb(R)^n$, and every $a > 0$ satisfying (1.1) for $X tilde.op mu$,
$ "Ent"_mu \( f^2 \) lt.eq C a^2 integral_(bb(R)^n) \| D f \|^2 thin d mu wide
  upright("for every ") f in C_c^oo \( bb(R)^n \) . $

 The same constant works in every dimension.]
] <thm:main>

No smoothness of the density or positive lower curvature bound is required.
  In particular, the theorem includes uniform measures on convex bodies.
  The proof will use smooth positive densities only after a reduction that preserves any hypothetical sequence of
  counterexamples.

The Otto–Villani implication from logarithmic Sobolev to quadratic transport–entropy inequalities
  #cite(label("OttoVillani2000")) Theorem 1 gives the following standard consequence, with the same constant.
  Write $cal(P)_2 \( bb(R)^n \)$ for the Borel probabilities with finite second moment.
  For $alpha \, beta in cal(P)_2 \( bb(R)^n \)$, set

$ W_2 \( alpha \, beta \)^2 = inf_(pi in Pi \( alpha \, beta \)) integral \| x - y \|^2 thin d pi \( x \, y \) \, $

where $Pi \( alpha \, beta \)$ is the set of their couplings.
  Relative entropy is $H \( alpha divides beta \) = integral f log f thin d beta$ if $alpha = f beta$,
  with its possible value $+ oo$, and is $+ oo$ if $alpha ≪̸ beta$.

#thm([Corollary 1.2.])[
  (Quadratic transport–entropy inequality).  #emph[Under the assumptions of Theorem 1,
    every $nu in cal(P)_2 \( bb(R)^n \)$ satisfies
$ W_2 \( nu \, mu \)^2 lt.eq C a^2 H \( nu divides mu \) \, $

 with the same absolute constant $C$ as in that theorem.]
] <cor:intro-transport>

The proof in Section 2.1 gives the approximation argument for nonsmooth log-concave densities.

=== 1.1 History and significance <history-and-significance>

Gross’s work on logarithmic Sobolev inequalities connected the Gaussian inequality with hypercontractivity and
  established a framework in which the constants remain independent of dimension #cite(label("Gross1975")).
  The diffusion approach of Bakry and Émery #cite(label("BakryEmery1985")) gives the inequality for a density
  $e^(- V)$ when $D^2 V gt.eq kappa upright("Id")$ with $kappa > 0$:
  in the convention used below, its constant is at most $kappa^(- 1)$.
  Log-concavity alone asserts only $D^2 V gt.eq 0$ when the potential is smooth.
  The question addressed here is whether a global assumption on the tails of linear functions can supply the
  logarithmic Sobolev bound without positive curvature.

A logarithmic Sobolev inequality implies Gaussian concentration for all Lipschitz functions through Herbst’s
  exponential-moment argument; see #cite(label("Ledoux1999")) Section 2.3.
  Under log-concavity, Gaussian concentration for all Lipschitz functions also gives Gaussian isoperimetry by
  Milman’s theorem #cite(label("Milman2010")) Theorem 1.1, and hence a logarithmic Sobolev inequality
  #cite(label("Bobkov1999")) Lemma 3.3, with dimension-independent bounds.
  The question here asks whether control of linear functions suffices.
  Uniformly subgaussian linear marginals are necessary, up to universal constants, by the same Herbst argument.
  Bizeul formulated their sufficiency within the log-concave class in 2023 #cite(label("Bizeul2026"))
  Conjecture 2. Theorem 1 resolves this conjecture for centered log-concave laws with a Lebesgue density,
  under the precise marginal condition (1.1).

Bobkov’s norm-based criterion #cite(label("Bobkov1999")) Theorem 1.3 bounds the entropy coefficient by a universal
  multiple of the squared subgaussian norm of $\| X \|$. Under (1.1),
  Hölder’s inequality gives $bb(E) exp \( \| X \|^2 \/ \( n a^2 \) \) lt.eq 2$,
  so that criterion yields a coefficient of order $n a^2$. Bizeul’s improvement #cite(label("Bizeul2026"))
  Theorem 4 has dimension dependence $n^(1 \/ 4)$ in the parameter $rho_(upright("LS"))$ defined by
  $"Ent" \( f^2 \) lt.eq 2 rho_(upright("LS"))^2 integral \| D f \|^2$.
  Thus for linear subgaussian scale $a$ it gives an entropy coefficient of order $sqrt(n) thin a^2$.
  Bizeul also obtained the dimension-free conclusion for rotationally invariant log-concave laws
  #cite(label("Bizeul2026")) Theorem 8. Klartag and Lehec discuss the conjecture and these bounds in
  #cite(label("KlartagLehec2024")) Section 8.3, Conjecture 76 and Theorem 77.
  The theorem’s marginal hypothesis concerns more than covariance:
  it controls the tails of every linear function, while its conclusion controls the entropy of nonlinear tests.

Our preliminary calculus uses the Bakry–Émery semigroup argument, including its entropy dissipation identity.
  We give the anisotropic and approximation forms needed for Gaussian posteriors in Section 2.
  The other classical input to that calculus comes from Gaussian channels.
  Guo, Shamai, and Verdú relate the derivative of mutual information to minimum mean-square estimation error
  #cite(label("GuoShamaiVerdu2005")) Theorem 2; their relative-entropy formulation
  #cite(label("GuoShamaiVerdu2005")) Theorem 5, Equation (66) gives the Gaussian prediction identity used here.
  We prove its conditional integrated version with our variance and diffusion-time conventions.
  The entropy-loss comparison in Lemma 17 requires an additional argument:
  repeated observations of independent copies make the cost of discarding conditional-mean directions negligible.
  That comparison links Gaussian prediction to the tensor near-equalities described next.

=== 1.2 Proof strategy <proof-strategy>

Write $R \( nu \)$ for the best constant in the convention

#[#set math.equation(numbering: n => "(1.2)")
 $ "Ent"_nu \( f^2 \) lt.eq 2 R \( nu \) integral \| D f \|^2 thin d nu . $ <eq:intro-lsi-convention>]

Failure of Theorem 1 would give, after truncation, a weak quadratic tilt, and dilation,
  a sequence of compactly supported log-concave laws $mu$ such that $R \( mu \) =
  1$ while their linear subgaussian parameters tend to zero.
  The argument derives incompatible descriptions of fluctuations associated with these normalized laws.

===== 1.2.1 From an extremal function to a predictable vector field. <from-an-extremal-function-to-a-predictable-vector-field.>

For a fixed $s > 0$, let $G$ be a standard Gaussian independent of $X tilde.op mu$.
  An extremizer for the entropy inequality of $X + sqrt(s) G$ yields a second probability law $eta$ and a vector field

$ w = D log frac(d eta, d mu_s) \, wide mu_s = "Law" \( X + sqrt(s) thin G \) . $

An exact change-of-reference identity shows that $eta$ itself satisfies a logarithmic Sobolev inequality.
  The Euler equation and translation tests make $w$ an approximate first eigenfunction of the diffusion associated
  with $eta$. If the entropy constant instead coincides with the Poincaré constant, take $eta = mu_s$ and $w =
  D phi$, where $phi$ is a gap eigenfunction. Both cases are treated directly.

The crucial extra information concerns prediction of $w \( Y \)$ from a noisy observation of $Y tilde.op eta$.
  With $I = bb(E)_eta \| w \|^2$ and a fresh independent standard Gaussian $G$, we prove the limiting identity

$ frac(bb(E) \| bb(E) \[ w \( Y \) divides Y + sqrt(r) thin G \] \|^2, I) arrow.r e^(- r) $

on a fixed positive interval of noise variances. It follows by matching entropy contraction with an entropy-loss
  comparison proved using repeated Gaussian observations. At each observation, we discard at most one direction:
  the difference between the conditional means under two competing priors.
  Independent copies make the accumulated cost of discarding these directions negligible.

===== 1.2.2 From prediction to tensor near-equalities. <from-prediction-to-tensor-near-equalities.>

Gaussian polynomial orthogonality turns the exact prediction curve into nearly sharp derivative estimates.
  Starting with $T_0 = w$, we construct symmetric tensor fields $T_l$ whose derivatives approximate $T_(l + 1)$,
  all with asymptotically the same squared norm and all concentrated near the first nonzero spectral value of the
  diffusion. The tensor estimates also control curvature and exclude concentration in the relevant
  small-dimensional subspaces.

For each tensor $T_l$, regard one index as a row and all remaining indices as a column,
  and form the positive matrix $T_l T_l^(*)$. Averaging $I^(- 1) T_l
  T_l^(*)$ over a long band of levels gives a positive matrix field $rho$ of asymptotic mean trace one.
  Its square root is nearly an equality case in Hilbert–Schmidt Poincaré.
  Symmetry in the many tensor indices forces the infinitesimal matrix coefficients to commute asymptotically in a
  weighted Hilbert–Schmidt norm. Gaussian linear combinations of these matrices,
  frozen at the initial diffusion point, consequently have scalar Gaussian moments under the weighted trace.
  A Hermite expansion along the stationary diffusion then gives covariance fluctuations with the lognormal factor

$ exp \( sqrt(8 t) thin Z - 4 t \) \, wide Z tilde.op N \( 0 \, 1 \) \, $

whose mean is one.

===== 1.2.3 An information contradiction. <an-information-contradiction.>

Conditionally on the stationary point, observe a centered Gaussian vector whose covariance is a bounded increasing
  function of $T rho$, where $T > 0$ is a scale and the covariance cap is adjustable.
  Its marginal law is a mixture of these Gaussian laws. Together with the square-root energy estimates,
  the logarithmic Sobolev inequality of $eta$ gives a universal asymptotic upper bound on the mutual information,
  integrated against $d T \/ T^2$. The matrix fluctuation law gives a lower bound by a one-dimensional Gaussian
  mixture with the lognormal variance above. After taking the sequence limit at fixed diffusion time and
  covariance cap, that lower bound becomes arbitrarily large as these two parameters increase together.

The scale integral is essential. In a spectral block where $rho$ has size $beta^2$, the substitution $x =
  T beta^2$ gives

$ frac(d T, T^2) = beta^2 frac(d x, x^2) . $

This is exactly the coefficient multiplying the unnormalized trace on that block.
  Consequently the information lower bound retains all of the matrix mass even when the spectrum is arbitrarily diffuse.

Figure 1 records the two constructions of the critical law and the main dependencies of the information comparison.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.65, 0), [#box(width: 6.753cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Strict entropy branch#linebreak()Entropy optimizer#linebreak()Lemma~3.7\(i\)]]])])
  content((3.65, 0), [#box(width: 6.753cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Gap branch#linebreak()Gap eigenfunction#linebreak()Lemma~3.7\(ii\)]]])])
  content((0, -1.55), [#box(width: 6.153cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Common critical law and vector field#linebreak()Proposition~3.9]]])])
  line((-3.65, -0.7143), (-3.076, -1.039), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((3.65, -0.7143), (3.076, -1.039), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((-4.85, -3.2), [#box(width: 4.353cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Prediction curve#linebreak()and posterior estimates#linebreak()Prop.~4.3, Lemma~4.4]]])])
  content((0, -3.2), [#box(width: 4.353cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Symmetric#linebreak()tensor hierarchy#linebreak()Proposition~5.1]]])])
  content((4.85, -3.2), [#box(width: 4.353cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Matrix estimates#linebreak()and frozen law#linebreak()Proposition~6.8]]])])
  line((-3.076, -1.55), (-4.85, -1.55), (-4.85, -2.45), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((-2.674, -3.2), (-2.176, -3.2), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((2.176, -3.2), (2.674, -3.2), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((0, -5.45), [#box(width: 9.653cm, inset: 0.1764cm, stroke: (thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Integrated information contradiction#linebreak()Propositions~7.2 and~7.9,#linebreak()Lemma~7.10]]])])
  line((4.85, -3.95), (4.85, -4.5), (0, -4.5), (0, -4.762), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((2.425, -4.5), [#text(size: 9pt)[matrix bounds]], anchor: "south", padding: 0.1176cm)
  line((3.076, -1.55), (7.45, -1.55), (7.45, -5.45), (4.826, -5.45), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((6.138, -5.45), [#text(size: 9pt)[entropy bound]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: Main stages of the contradiction argument. At the regularized law, the strict entropy branch means that the logarithmic Sobolev constant exceeds the Poincaré constant; in the gap branch the two constants coincide. The logarithmic Sobolev inequality of the common critical law, together with the square-root energy estimates of Section 6, supplies the information upper bound. The frozen matrix law supplies the scalar lower bound. After the sequence limit at fixed parameters, its scale integral becomes arbitrarily large as the diffusion time and covariance cap grow together. ],
) <fig:proof-dependencies>

=== 1.3 Components of the argument <components-of-the-argument>

Two ingredients have formulations beyond the final contradiction.
  The entropy-loss comparison of Lemma 17 relates relative entropy under common Gaussian convolution to
  conditional prediction of the original relative score. Its proof separates the convexity input from the
  finite-copy observation argument. The matrix reduction in Section 6 converts symmetric tensor near-equalities
  into a weighted scalar fluctuation law, without requiring simultaneous diagonalization in varying dimensions.
  Section 7 then tests that law through bounded covariance observations and integrates over scale.

For orientation, Section 2 records the analytic conventions and approximation facts.
  Section 3 constructs the critical laws and vector fields.
  Section 4 proves the prediction identity, and Section 5 constructs the tensor hierarchy.
  Sections 6 and 7 turn that hierarchy into the contradiction.

== 2 Curvature, diffusion, and entropy calculus <sec:calculus>

We first establish the analytic facts used to construct and study the probability measures in the proof.
  Two time conventions will be kept distinct: convolution with a Gaussian of variance $r$ has generator $Delta \/
  2$, whereas a stationary diffusion has generator $- A$ and noise coefficient $sqrt(2)$.
  These conventions determine every entropy dissipation factor below.

For probabilities $p \, pi$ with $p lt.double pi$, define their relative entropy by

$ H \( p divides pi \) = integral log frac(d p, d pi) thin d p . $

Set $H \( p divides pi \) = + oo$ when absolute continuity fails.
  Write $gamma$ for standard Gaussian measure in the relevant dimension, and set

$ cal(I) \( p divides pi \) = 4 integral lr(|D sqrt(frac(d p, d pi))|)^2 d pi . $

The value is $+ oo$ unless the density exists and its square root belongs to the weighted Sobolev space.
  When the densities are positive and smooth this is $integral \| D log \( d p \/ d pi \) \|^2 d p$. Our convention is

$ "Ent"_pi \( f^2 \) lt.eq 2 R \( pi \) integral \| D f \|^2 d pi \, wide 2 H \( p divides pi \) lt.eq
  R \( pi \) cal(I) \( p divides pi \) . $

The Poincaré constant $R^P \( pi \)$ uses the convention

$ "Var"_pi \( f \) = integral f^2 d pi - (integral f thin d pi)^2 lt.eq R^P \( pi \) integral \| D f \|^2 d pi . $

Linearization of the entropy inequality gives $R^P \( pi \) lt.eq R \( pi \)$.

For smooth positive densities the Sobolev space is the completion of $C_c^oo$ in the squared norm
  $integral \( f^2 + \| D f \|^2 \) d pi$. Cutoffs, truncation of the values,
  and smoothing on compact sets show that it also consists of the functions with a weak gradient in this norm.
  The same approximation and lower semicontinuity of entropy extend a compact-test logarithmic Sobolev inequality
  to this space. One convenient proof of the latter lower semicontinuity is the formula

#[#set math.equation(numbering: n => "(2.1)")
 $ H \( p divides pi \) = sup_(g med upright("bounded")) {integral g thin d p -
   log integral e^g d pi} . $ <eq:calculus-entropy-duality>]

Jensen’s inequality proves the upper bound; bounded truncations of $log \( d p \/ d pi \)$ give equality.
  The same formula implies data processing under a measurable map or a Markov kernel, by conditional Jensen.
  Conditional entropy identities below are always averaged over the conditioning variable.
  In particular, disintegrating a joint density and splitting its logarithm gives the chain rule

$ H \( P_(U \, Z) divides Q_U ⊗ nu \) = H \( P_U divides Q_U \) + bb(E)_(P_U) H \( P_(Z divides U) divides nu \) . $

It holds in the extended nonnegative sense by truncation.
  Mutual information is $sans(I) \( U \; Z \) = H \( P_(U \, Z) divides P_U ⊗ P_Z \)$.
  Taking $g \( z \) = v dot.op z$ in Equation (2.1) and optimizing over $v$ also gives $H \( p divides gamma \)
  gt.eq \| bb(E)_p Z \|^2 \/ 2$ when the mean exists.

The following is the anisotropic Bakry–Émery curvature criterion #cite(label("BakryEmery1985")).
  We include its semigroup proof and the convex approximation needed for Gaussian posteriors with nonsmooth support.

#thm([Lemma 2.1.])[
  (Positive curvature).  #emph[Let $S$ be a positive definite matrix on $bb(R)^n$,
    and let $U$ be a proper lower semicontinuous convex function, possibly taking the value $+ oo$. Suppose
$ d pi \( x \) = Z^(- 1) exp { - 1 / 2 chevron.l x \, S x chevron.r - U \( x \) } thin d x $

 is a probability with a full dimensional support. Then
$ "Ent"_pi \( f^2 \) lt.eq 2 bb(E)_pi chevron.l D f \, S^(- 1) D f chevron.r \, wide "Var"_pi \( f \) lt.eq
  bb(E)_pi chevron.l D f \, S^(- 1) D f chevron.r . $

 The inequalities hold first for compact smooth tests, and then for functions obtained by finite-energy approximation.]
] <lem:curvature>

#proof[
  A linear change of variables reduces the assertion to $S = upright("Id")$.
    First suppose $V \( x \) = \| x \|^2 \/ 2 + U \( x \)$ is smooth with bounded Hessian.
    The diffusion with generator $L = Delta - D V dot.op D$ has globally Lipschitz drift and invariant law $pi$.
    If $J_t$ is the derivative of its trajectory with respect to the starting point, then $dot(J)_t = -
    D^2 V \( X_t \) J_t$, whence $parallel J_t parallel_(upright("op")) lt.eq e^(- t)$.
    For smooth bounded positive $q$, bounded away from zero, weighted Cauchy–Schwarz gives
  $ frac(\| D P_t q \|^2, P_t q) lt.eq e^(- 2 t) P_t (frac(\| D q \|^2, q)) . $
  Integration by parts yields
  $ frac(d, d t) integral \( P_t q \) log \( P_t q \) thin d pi = - integral frac(\| D P_t q \|^2, P_t q) thin d pi . $
  Couple a trajectory started at $x$ to an independent stationary initial point with the same driving Brownian
    motion. Their distance is at most $e^(- t)$ times their initial distance.
    Since $pi$ has Gaussian tails, this proves convergence of $P_t q$ to $bb(E)_pi q$ for bounded Lipschitz $q$,
    and hence convergence of its entropy to zero. Integrating the preceding two displays gives $"Ent"_pi \( q \)
    lt.eq 1 / 2 integral \| D q \|^2 \/ q thin d pi$. Apply this to $q = f^2 + epsilon$ and let $epsilon arrow.b 0$.
  For general $U$, take its quadratic infimal convolutions
  $ U_j \( x \) = inf_z { U \( z \) + j \| x - z \|^2 } . $
  The minimizer is unique, and monotonicity of the subgradient of $U$ shows that $D U_j$ is Lipschitz.
    The functions $U_j$ are convex and increase to $U$. A fixed affine minorant $U \( z \) gt.eq ell dot.op z +
    c$ gives $U_j \( x \) gt.eq ell dot.op x + c - \| ell \|^2 \/ \( 4 j \)$.
    Mollify $U_j$ with a smooth compactly supported kernel at radii tending to zero.
    The resulting functions are smooth, convex, and have bounded Hessian;
    the affine lower bound persists with a uniform additive error.
    Consequently their normalized densities converge almost everywhere and in $L^1$,
    dominated by an integrable Gaussian times an exponential of a linear function.
    The compact-test inequality passes to the limit. Boundary values of $U$ do not matter,
    since the boundary of a full dimensional convex support has Lebesgue measure zero.
    Finally, insert $f = 1 + epsilon g$, using finite-energy cutoffs of the constant,
    and compare the coefficients of $epsilon^2$ to obtain the variance inequality. ◻
]

We shall also use two immediate consequences with their constants.
  If independent laws satisfy inequalities with quadratic energy forms $Q_1 \, Q_2$,
  their product satisfies the inequality with energy $Q_1 + Q_2$.
  Indeed, decompose entropy into conditional entropy and the entropy of the fiber integral, and use

$ lr(|D_x (integral f \( x \, y \)^2 d pi_2 \( y \))^(1 \/ 2)|)^2 lt.eq
  integral \| D_x f \( x \, y \) \|^2 d pi_2 \( y \) . $

Approximation removes zeros of the fiber norm. The variance version uses conditional variance and differentiation
  of the fiber mean. In particular, independent addition gives

#[#set math.equation(numbering: n => "(2.2)")
 $ R \( "Law" \( X + Z \) \) lt.eq R \( "Law" \( X \) \) + R \( "Law" \( Z \) \) . $ <eq:calculus-convolution>]

Second, Herbst’s argument (see #cite(label("Ledoux1999")) Section 2.3) shows that, if $R \( pi \) lt.eq R$,
  every integrable $1$-Lipschitz function $u$ satisfies

#[#set math.equation(numbering: n => "(2.3)")
 $ log bb(E)_pi e^(t \( u - bb(E)_pi u \)) lt.eq R t^2 \/ 2 . $ <eq:calculus-herbst>]

For a bounded smooth $u$, applying the inequality to $e^(t u \/ 2)$, and writing $psi \( t \) =
  log bb(E) e^(t u)$, gives $t psi' \( t \) - psi \( t \) lt.eq R t^2 \/ 2$.
  Integrate the derivative of $psi \( t \) \/ t$ from zero.
  Bounded Lipschitz truncations and Fatou’s lemma prove the assertion in general.
  In particular the conclusion applies to linear forms whenever their first moments are finite.

#thm([Lemma 2.2.])[
  (Dirichlet operator and stationary diffusion).  #emph[Let $pi$ be a smooth,
    strictly positive probability density on $bb(R)^n$. On $C_c^oo \( bb(R)^n \)$ define
$ A_pi = - Delta - D log pi dot.op D . $

 This nonnegative symmetric operator is essentially self-adjoint in $L^2 \( pi \)$,
   and $C_c^oo$ is a core for its closure. In particular, if $f in L^2 \( pi \)$ and the distribution $A_pi
   f$ belongs to $L^2 \( pi \)$, then $f in "Dom" \( A_pi \)$.
   Its semigroup $P_u = e^(- u A_pi)$ preserves constants and is realized by the stationary diffusion
#[#set math.equation(numbering: n => "(2.4)")
 $ d Y_u = sqrt(2) thin d B_u + D log pi \( Y_u \) thin d u \, wide Y_0 tilde.op pi . $ <eq:calculus-diffusion>]

 For $f in "Dom" \( A_pi \)$ the stationary Itô formula holds in $L^2$, with drift $-
   A_pi f$ and martingale integrand $sqrt(2) thin D f$.]
] <lem:dirichlet-core>

#proof[
  Integration by parts gives $chevron.l f \, A_pi g chevron.r = integral D f dot.op D g thin d pi$.
    If $v in L^2 \( pi \)$ is orthogonal to $\( 1 + A_pi \) C_c^oo$, then $\( 1 + A_pi \) v = 0$ distributionally.
    Conjugating by $sqrt(pi)$ reduces this to a Poisson equation with a smooth local potential.
    The local Newtonian potential estimates and bootstrap make $v$ smooth;
    see #cite(label("Viaclovsky2004")) Lecture 24, p. 2; Lecture 16, p. 2.
    Take a compact cutoff $chi_R$, equal to one on the ball of radius $R$, with $\| D chi_R \| lt.eq C \/ R$.
    Testing by $chi_R^2 v$ and using $2 a b lt.eq a^2 \/ 2 + 2 b^2$ gives
  $ integral chi_R^2 v^2 d pi + 1 / 2 integral chi_R^2 \| D v \|^2 d pi lt.eq 2 integral \| D chi_R \|^2 v^2 d pi . $
  Thus $v = 0$. The range of $1 + A_pi$ is dense. Nonnegativity gives $parallel \( 1 + A_pi \) f parallel_2 gt.eq
    parallel f parallel_2$, so the range of the closure is also closed and therefore equals $L^2$.
    The closure is self-adjoint: for $g$ in its adjoint domain,
    solve $\( 1 + overline(A) \) h = \( 1 + A^(*) \) g$; then $g -
    h$ is in the orthogonal complement of the range of $1 + A$, hence vanishes.
    This also proves the asserted maximal distributional domain characterization.
  The cutoffs $chi_R$ converge to $1$ in the form norm with energy tending to zero.
    Hence $1$ belongs to the nullspace of the closed form and $P_u 1 = 1$.
    To identify the diffusion, solve the stochastic equation locally and kill it on exiting each ball.
    Its kernels are symmetric and sub-Markov, as follows either from the Dirichlet heat equation or integration by
    parts. Increasing the balls gives the minimal sub-Markov semigroup.
    The stopped Itô formula on compact tests identifies its generator as an extension of $- A_pi$.
    Essential self-adjointness identifies it with $P_u$, which loses no mass.
    Started in $pi$, the resulting diffusion is stationary and nonexplosive.
    Finally approximate $f$ in graph norm by compact smooth functions.
    Their gradients converge in $L^2 \( pi \)$ since $parallel D g parallel_2^2 = chevron.l g \, A g chevron.r$.
    Stationarity and the Itô isometry pass every term of their formulas to the limit. ◻
]

#thm([Lemma 2.3.])[
  (Entropy dissipation).  #emph[For the semigroup of Lemma 4, if $p_0 =
    q_0 pi$ has finite relative entropy and $p_u = \( P_u q_0 \) pi$, then, for $0 lt.eq a lt.eq b$,
#[#set math.equation(numbering: n => "(2.5)")
 $ H \( p_a divides pi \) - H \( p_b divides pi \) gt.eq integral_a^b cal(I) \( p_u divides pi \) thin d u .
   $ <eq:calculus-stationary-entropy>]

 If instead both probability measures evolve by Gaussian convolution, $p_r = p_0 * gamma_r$ and $q_r =
   q_0 * gamma_r$, then
#[#set math.equation(numbering: n => "(2.6)")
 $ H \( p_a divides q_a \) - H \( p_b divides q_b \) gt.eq 1 /
   2 integral_a^b cal(I) \( p_r divides q_r \) thin d r $ <eq:calculus-heat-entropy>]

 whenever the entropy on the left at time $a$ is finite. Here $gamma_r$ is the centered Gaussian with covariance
   $r upright("Id")$, and time zero is allowed. For the standard Gaussian Ornstein–Uhlenbeck semigroup,
   Equation (2.5) is an equality, including time zero when the initial entropy is finite.
   Each assertion also holds after integration over conditioning labels whose noises are independent conditional
   on those labels.]
] <lem:entropy-calculus>

#proof[
  For a bounded density $q$ bounded away from zero, the form chain rule,
    first for smooth functions and then by form approximation, gives
  $ frac(d, d u) integral \( P_u q \) log \( P_u q \) thin d pi = - integral frac(\| D P_u q \|^2, P_u q) thin d pi . $
  Spectral smoothing puts $P_u q$ in the operator domain for $u > 0$; the bounded range permits $1 +
    log \( P_u q \)$ as a form test. Approximate an arbitrary finite-entropy density by truncating it above and
    below and normalizing. The initial entropies converge. The semigroup contracts $L^1$,
    so densities converge at every later time. Lower semicontinuity of entropy and of $4 integral \| D
    sqrt(q) \|^2 d pi$, followed by Fatou’s lemma in time, gives Equation (2.5) from time zero.
    Restarting the argument gives arbitrary $a$.
  For simultaneous heat evolution put $z = p_r \/ q_r$. Direct differentiation, using $partial_r p_r =
    Delta p_r \/ 2$ and the same equation for $q_r$, gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ \( partial_r - 1 / 2 Delta \) { q_r Phi \( z \) } = - 1 /
     2 q_r Phi'' \( z \) \| D z \|^2 . $ <eq:calculus-heat-chain>]
  Here use smooth convex $Phi_k$ with $Phi_k \( 1 \) = Phi'_k \( 1 \) = 0$,
    with second derivatives increasing to $1 \/ z$, and with second derivatives supported in compact subsets of
    $\( 0 \, oo \)$. Such functions have at most linear growth and increase to $z log z - z + 1$.
    Integrate Equation (2.7) against $chi_R$ with $\| Delta chi_R \| lt.eq C \/ R^2$.
    At each fixed $k$ the cutoff error vanishes because $q_r Phi_k \( p_r \/ q_r \) lt.eq C_k \( p_r + q_r \)$.
    Let $R arrow.r oo$ and then $k arrow.r oo$. Monotone convergence gives the entropy and information terms,
    and in particular the stated inequality on positive time intervals.
    Data processing gives $H \( p_epsilon divides q_epsilon \) lt.eq H \( p_0 divides q_0 \)$;
    let $epsilon arrow.b 0$ to include the initial time.
  For Ornstein–Uhlenbeck evolution relative to $gamma$, apply the same convex truncations to the ratio.
    Its generator is $Delta - x dot.op D$. Expanding radial cutoffs have bounded generator,
    tending pointwise to zero, so the error vanishes by domination at fixed $k$.
    This gives equality on positive time intervals. At time zero, relative entropy is continuous:
    data processing gives its upper bound and lower semicontinuity under weak convergence gives its lower bound.
    Monotone convergence of the nonnegative time integral includes zero.
    Tonelli’s theorem proves all conditional versions. ◻
]

We use the relative-entropy form of the Gaussian-channel identity of Guo, Shamai,
  and Verdú #cite(label("GuoShamaiVerdu2005")) Theorem 5, Equation (66).
  The proof records explicitly its conditional integrated form.

#thm([Lemma 2.4.])[
  (Gaussian signals).  #emph[Let $S$ be an $bb(R)^d$-valued random vector with finite second moment,
    let $U$ be any side information, and let $G$ be standard Gaussian independent of $\( S \, U \)$.
    Write $Z_t = sqrt(t) S + G$ and
$ d \( t \) = bb(E)_U H \( "Law" \( Z_t divides U \) divides gamma \) . $

 Then $d \( 0 \) = 0$, $d \( t \) lt.eq t bb(E) \| S \|^2 \/ 2$, and
#[#set math.equation(numbering: n => "(2.8)")
 $ d \( t \) = 1 / 2 integral_0^t bb(E) lr(|bb(E) \[ S divides Z_v \, U \]|)^2 d v . $ <eq:calculus-gaussian-signal>]

 The integrand is nondecreasing in $v$. The formula without side information is obtained by taking $U$ constant.]
] <lem:gaussian-signals>

#proof[
  Conditional convexity of relative entropy and $H \( gamma \( dot.op - sqrt(t) s \) divides gamma \) =
    t \| s \|^2 \/ 2$ give the upper bound. Gaussian kernel differentiation gives
  $ D_z log frac(d "Law" \( Z_t divides U \), d gamma) \( z \) = sqrt(t) thin bb(E) \[ S divides Z_t = z \, U \] . $
  The differentiation is justified at each positive $t$ by the Gaussian kernel and the finite second moment,
    or by truncating $S$ and passing locally and in the conditional squared norm.
    Applying Ornstein–Uhlenbeck evolution for time $u$ replaces $t$ by $t e^(- 2 u)$.
    Its entropy dissipation identity and $d t \/ d u = - 2 t$ give $d' \( t \) = 1 /
    2 bb(E) \| bb(E) \[ S divides Z_t \, U \] \|^2$ almost everywhere on $\( 0 \, oo \)$.
    The upper bound implies $d \( t \) arrow.r 0$ at zero, proving the integrated identity.
    For $0 < v < t$, the channel at $v$ is obtained from the channel at $t$ by multiplying its output by
    $sqrt(v \/ t)$ and adding fresh Gaussian noise of covariance $\( 1 - v \/ t \) upright("Id")$.
    Conditional Jensen then proves monotonicity of prediction energy. ◻
]

=== 2.1 The transport–entropy consequence <sec:transport-consequence>

#proof[
  Jensen’s inequality in each coordinate gives $integral \| x \|^2 d mu lt.eq n a^2 log 2$,
    so $mu in cal(P)_2 \( bb(R)^n \)$. Only the case $H \( nu divides mu \) < oo$ needs proof.
    For $s > 0$, put $gamma_s = N \( 0 \, s upright("Id") \)$, $mu_s = mu * gamma_s$, and $nu_s = nu * gamma_s$.
    The density of $mu_s$ is smooth and strictly positive. For $X tilde.op
    mu$ and an independent standard Gaussian $G$, its potential $V_s$ satisfies
  $ D^2 V_s \( y \) = s^(- 1) upright("Id") - s^(- 2) "Cov" \( X divides X + sqrt(s) G = y \) gt.eq 0 . $
  Indeed, the posterior has the original convex potential plus $\| x - y \|^2 \/ \( 2 s \)$,
    so Lemma 3 bounds its covariance by $s upright("Id")$. Gaussian differentiation is valid without compact
    support. Thus $mu_s$ is centered and log-concave, with a smooth convex potential.
  Set $beta_s = sqrt(8 s \/ 3)$ and $a_s = a + beta_s$. For a scalar standard Gaussian $Z$,
    $bb(E) exp \( s Z^2 \/ beta_s^2 \) = 2$. The inequality
  $ frac(\( u + t \)^2, \( a + beta_s \)^2) lt.eq frac(a, a + beta_s) u^2 / a^2 + frac(beta_s, a + beta_s) t^2 /
    beta_s^2 $
  and Hölder’s inequality show that $mu_s$ satisfies (1.1) with parameter $a_s$.
    Theorem 1, with the Sobolev extension in Section 2, gives entropy coefficient $C a_s^2$.
    In the conventions of #cite(label("OttoVillani2000")) Definitions 1–2, $"Ent" \( f^2 \) lt.eq
    L integral \| D f \|^2$ is $upright("LSI") \( 2 \/ L \)$, whose transport conclusion is $W_2^2 lt.eq L H$.
    Their Theorem 1 applies to the smooth convex potential of $mu_s$, and hence
  $ W_2 \( nu_s \, mu_s \)^2 lt.eq C a_s^2 H \( nu_s divides mu_s \) lt.eq C a_s^2 H \( nu divides mu \) . $
  The last inequality is data processing for the common Gaussian kernel, as in Section 2.
    Coupling a vector with itself plus independent Gaussian noise gives $W_2 \( mu_s \, mu \) \,
    W_2 \( nu_s \, nu \) lt.eq sqrt(n s)$. Letting $s arrow.b 0$ at fixed $n$, with $a_s arrow.r a$, proves the claim. ◻
]

== 3 Critical laws after Gaussian regularization <sec:critical>

Suppose that the conclusion of Theorem 1 is false. This section constructs, from a sequence of counterexamples,
  smooth probabilities $eta$ satisfying a logarithmic Sobolev inequality and vector fields $w$ that nearly satisfy
  $A_eta w = w$. There are two possible constructions. An attained nonlinear entropy quotient gives a score $w$;
  equality of the logarithmic Sobolev and Poincaré constants gives the gradient of a gap eigenfunction.
  We shall retain both alternatives throughout.

=== 3.1 Normalization and Gaussian regularization <normalization-and-gaussian-regularization>

#thm([Lemma 3.1.])[
  (Normalized counterexamples).  #emph[Failure of Theorem 1 produces a sequence of centered, compactly supported,
    full dimensional log-concave probabilities $mu$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ R \( mu \) = 1 \, wide sup_(\| theta \| = 1) bb(E)_mu e^(chevron.l X \, theta chevron.r^2 \/ a^2) lt.eq 2 \,
   wide a arrow.r 0 . $ <eq:critical-normalization>]

 For an absolute constant $C$, they also satisfy
#[#set math.equation(numbering: n => "(3.2)")
 $ log bb(E)_mu e^(v dot.op X) lt.eq C a^2 \| v \|^2 \, wide "Cov"_mu \( X \) lt.eq
   C a^2 upright("Id") . $ <eq:critical-linear-mgf>]

]
] <lem:critical-normalization>

#proof[
  Choose laws and compact smooth tests for which the entropy-to-energy ratio divided by the squared marginal
    parameter tends to infinity. The tests may be chosen with positive energy:
    a smooth test of zero energy is constant on the connected interior of the convex support,
    and its entropy vanishes. Restriction of the law to a sufficiently large ball preserves each test quotient
    arbitrarily closely. Multiply the restricted density by $e^(- epsilon \| x \|^2 \/ 2)$ and normalize,
    with $epsilon > 0$ sufficiently small to preserve that quotient again.
    Both operations preserve log-concavity, their combined density relative to the original law can be bounded by
    $2$, and Lemma 3 gives a finite logarithmic Sobolev constant for the resulting compact law.
  A bounded density increase changes the exponential-square expectation by at most that factor.
    If $bb(E) e^(Z^2 \/ A^2) lt.eq 4$, Jensen gives $bb(E) e^(Z^2 \/ \( 2 A^2 \)) lt.eq 2$.
    Centering costs only another absolute factor: $bb(E) Z^2 lt.eq A^2 log 4$, while $\( Z - bb(E) Z \)^2 lt.eq
    2 Z^2 + 2 \( bb(E) Z \)^2$; increase the denominator first to make the resulting exponential expectation
    bounded by an absolute constant, and once more by Jensen to make it at most $2$.
    These arguments apply separately to every unit linear form with the same constants.
    Translation preserves the test quotient. Thus the centered compact laws still have $R \/ A^2 arrow.r
    oo$ with $0 < R < oo$. Dilation by $R^(- 1 \/ 2)$ gives Equation (3.1).
  For completeness, if a centered scalar $Z$ obeys $bb(E) e^(Z^2 \/ a^2) lt.eq 2$, then $bb(E) \| Z \|^k lt.eq
    2 a^k Gamma \( k \/ 2 + 1 \)$, by integrating its tail. Expansion of $e^(t Z)$, with the linear term absent,
    therefore gives $log bb(E) e^(t Z) lt.eq C a^2 t^2$ for $a \| t \| lt.eq c$.
    For $a \| t \| gt.eq c$, use $t Z lt.eq Z^2 \/ a^2 + a^2 t^2 \/ 4$ and absorb $log 2$ into $C a^2 t^2$.
    Apply this to $Z = X dot.op theta$. The second moment bound follows either from the exponential-square bound
    or by differentiating the centered moment generating function at zero. ◻
]

We suppress the counterexample index, but all limits in this section refer to this sequence.
  Let $G$ be a fresh standard Gaussian and set

$ mu_s = "Law" \( X + sqrt(s) G \) \, quad R_s = R \( mu_s \) \, quad b_s \( y \) =
  bb(E) \[ X divides X + sqrt(s) G = y \] \, quad V_s = - log mu_s . $

Here and below $mu_s$ also denotes its strictly positive density. Gaussian differentiation and posterior covariance give

#[#set math.equation(numbering: n => "(3.3)")
 $ D V_s \( y \) = frac(y - b_s \( y \), s) \, wide M_s \( y \) = D b_s \( y \) =
   frac("Cov" \( X divides y \), s) \, wide K_s \( y \) = D^2 V_s \( y \) =
   frac(upright("Id") - M_s \( y \), s) . $ <eq:critical-posterior>]

The posterior of $X$ has a convex potential plus $\| x - y \|^2 \/ \( 2 s \)$.
  Lemma 3, applied to its linear forms, therefore implies

#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq M_s lt.eq upright("Id") \, wide 0 lt.eq K_s lt.eq s^(- 1) upright("Id") . $ <eq:critical-curvature>]

All these functions are smooth. Compact support of $X$ also gives $\| b_s \| lt.eq sup_("supp" mu) \| x \|$.

The monotonicity below follows from the heat-flow contraction of Klartag and Putterman
  #cite(label("KlartagPutterman2023")) Theorem 1.2 and Section 3,
  which uses the transport construction of Kim and Milman #cite(label("KimMilman2012")).
  We recall the argument for our regularized laws.

#thm([Lemma 3.2.])[
  (Bounds for the regularized constants).  #emph[The function $s mapsto
    R_s$ is nondecreasing and $1$-Lipschitz on $\( 0 \, oo \)$, and
#[#set math.equation(numbering: n => "(3.5)")
 $ 1 lt.eq R_s lt.eq 1 + s . $ <eq:critical-basic-R>]

]
] <lem:critical-flow-bounds>

#proof[
  The heat equation for $mu_s$ is the continuity equation with velocity $D V_s \/ 2$.
    On a compact positive-time interval this velocity is globally Lipschitz and grows at most linearly,
    so its smooth flow is a diffeomorphism carrying $mu_s$ to $mu_t$.
    Its Jacobian satisfies $dot(J) = K_t J \/ 2$. By positivity of $K_t$,
    the flow expands distances and its inverse is $1$-Lipschitz when $t gt.eq s$.
    Transport a test by that inverse. Its entropy is unchanged and its Dirichlet energy cannot increase,
    proving $R_t gt.eq R_s$. Equation (2.2) gives $R_(s + h) lt.eq R_s + h$ and $R_s lt.eq 1 + s$.
    For every compact smooth test, its entropy and energy converge to those under $mu$ as $s arrow.b 0$.
    Taking the supremum of its quotient gives $liminf_(s arrow.b 0) R_s gt.eq R \( mu \) = 1$.
    Monotonicity now proves the remaining bound. ◻
]

=== 3.2 Attainment above the Gaussian and Poincaré thresholds <attainment-above-the-gaussian-and-poincaré-thresholds>

On compact manifolds, Rothaus obtains nonconstant positive solutions of the logarithmic Euler equation when the
  sharp logarithmic Sobolev constant exceeds the Poincaré constant #cite(label("Rothaus1986")) p. 358.
  The proof below must also control loss of entropy in the Gaussian tails.
  The next two lemmas establish this control and attainment.
  Their constants may depend on a single fixed law and its dimension.
  Uniform estimates along the counterexample sequence begin with the translation argument.

#thm([Lemma 3.3.])[
  (Compactness and the Gaussian entropy defect).  #emph[Fix $s >
    0$ and a compactly supported probability $mu$ on $bb(R)^n$, and put $nu = mu * gamma_s$.
    Its form domain embeds compactly into $L^2 \( nu \)$. For every $epsilon > 0$ there is a finite $C_epsilon$,
    depending on this fixed law, such that
#[#set math.equation(numbering: n => "(3.6)")
 $ "Ent"_nu \( u^2 \) lt.eq 2 \( s + epsilon \) parallel D u parallel_2^2 +
   C_epsilon parallel u parallel_2^2 . $ <eq:critical-defective>]

 If $u_j arrow.r u$ in $L^2 \( nu \)$, $parallel u_j parallel_2 = 1$, and $parallel D u_j parallel_2^2 arrow.r
   E_(*) < oo$, then
#[#set math.equation(numbering: n => "(3.7)")
 $ limsup_j "Ent"_nu \( u_j^2 \) lt.eq "Ent"_nu \( u^2 \) +
   2 s \( E_(*) - parallel D u parallel_2^2 \) . $ <eq:critical-entropy-defect>]

]
] <lem:critical-defect>

#proof[
  Write $r = d nu \/ d gamma_s$. The Gaussian kernel formula gives $D log r = b_s \/ s$, which is bounded,
    and hence $\| log r \( y \) \| lt.eq C \( 1 + \| y \| \)$. For $v = u sqrt(r)$,
  $ "Ent"_nu \( u^2 \) = "Ent"_(gamma_s) \( v^2 \) - integral v^2 log r thin d gamma_s \, wide D v =
    sqrt(r) thin \( D u + 1 / 2 u D log r \) . $
  Gaussian integration by parts followed by Cauchy–Schwarz gives
  $ integral \| y \|^2 v^2 d gamma_s = s n parallel v parallel_2^2 +
    2 s integral v thin y dot.op D v thin d gamma_s lt.eq 2 s n parallel v parallel_2^2 +
    4 s^2 parallel D v parallel_2^2 . $
  Initially this calculation is for compact tests, and cutoffs extend it by lower semicontinuity.
    The linear-growth entropy correction is consequently bounded by $delta parallel D v parallel_2^2 +
    C_delta parallel v parallel_2^2$ for every $delta > 0$. Gaussian logarithmic Sobolev and the displayed
    derivative formula, with another arbitrarily small Cauchy–Schwarz parameter, prove Equation (3.6).
    The same moment estimate shows tightness of the $L^2 \( nu \)$ mass of any bounded form sequence.
    On a fixed ball, the smooth density is bounded above and away from zero,
    so the ordinary local Rellich theorem gives $L^2$ precompactness.
    A diagonal extraction and tightness prove compactness globally.
  We give the tail argument for the sharp coefficient $2 s$ in Equation (3.7).
    Put $v_(j \, L) = \( \| u_j \| - L \)_(+)$ and $m_(j \, L) = parallel v_(j \, L) parallel_2^2$.
    Strong $L^2$ convergence implies $lim_(L arrow.r oo) sup_j m_(j \, L) = 0$.
    The energies of $v_(j \, L)$ and $\| u_j \| and L$ sum to $parallel D u_j parallel_2^2$.
    Lower semicontinuity for the clipped functions therefore gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ lim_(L arrow.r oo) limsup_j parallel D v_(j \, L) parallel_2^2 lt.eq E_(*) -
     parallel D u parallel_2^2 . $ <eq:critical-tail-energy>]
  For a nonnegative $v$ of squared norm $m lt.eq 1$, the negative part of $v^2 log v^2$ has integral at most $C
    sqrt(m)$ (use $- z log z lt.eq C sqrt(z)$ on $0 lt.eq z lt.eq 1$).
    Since $m log m lt.eq 0$, Equation (3.6) thus gives
  $ integral v^2 log_(+) v^2 d nu lt.eq 2 \( s + epsilon \) parallel D v parallel_2^2 + C_epsilon m + C sqrt(m) . $
  If $\| u_j \| > M L$, where $M > 1$ is fixed, then $\| u_j \| lt.eq c_M v_(j \, L)$ with $c_M =
    M \/ \( M - 1 \)$. Consequently
  $ u_j^2 log_(+) u_j^2 lt.eq c_M^2 v_(j \, L)^2 log_(+) v_(j \, L)^2 + c_M^2 log \( c_M^2 \) v_(j \, L)^2 . $
  The integrals of bounded truncations of $z^2 log z^2$ pass to the limit by strong $L^2$ convergence;
    its negative part does as well, being bounded and continuous.
    The last two bounds and Equation (3.8), with limits in the order $j$, $L$, $M$, $epsilon$,
    show that the lost positive entropy is at most $2 s \( E_(*) - parallel D u parallel_2^2 \)$.
    The normalization terms are zero because $parallel u parallel_2 = parallel u_j parallel_2 = 1$. ◻
]

The threshold $s$ in the entropy-defect estimate controls escape into the Gaussian tails.
  The Poincaré constant controls maximizing sequences that converge to constants.
  The next lemma proves attainment when the logarithmic Sobolev constant exceeds both thresholds.

#thm([Lemma 3.4.])[
  (Existence and positivity of an optimizer).  #emph[Let $nu = mu * gamma_s$,
    where $s > 0$ and $mu$ is compactly supported. Suppose its logarithmic Sobolev and Poincaré constants $R =
    R \( nu \)$ and $P = R^P \( nu \)$ satisfy $oo > R > max \( P \, s \)$.
    Then there is a smooth strictly positive nonconstant $f$ with
#[#set math.equation(numbering: n => "(3.9)")
 $ integral f^2 d nu = 1 \, wide "Ent"_nu \( f^2 \) = 2 R integral \| D f \|^2 d nu \, wide A_nu f =
   lambda f log f \, quad lambda = R^(- 1) . $ <eq:critical-optimizer>]

 The last equation is initially distributional and then classical.]
] <lem:optimizer>

#proof[
  Take nonnegative unit-norm maximizing tests $f_j$. Replacing a test by its absolute value preserves entropy and
    energy, so this choice loses nothing. Equation (3.6), with $s + epsilon < R$, bounds their energies.
    We first exclude energies tending to zero; this is the only place the strict inequality $R > P$ is required.
  Suppose $epsilon_j^2 = parallel D f_j parallel_2^2 arrow.r 0$, and write $c_j =
    bb(E)_nu f_j$ and $h_j = \( f_j - c_j \) \/ epsilon_j$. Poincaré gives $parallel h_j parallel_2^2 lt.eq P$,
    while $parallel D h_j parallel_2^2 = 1$ and $1 - c_j^2 = epsilon_j^2 parallel h_j parallel_2^2$.
    Thus $c_j arrow.r 1$. By compactness, after extraction, $h_j arrow.r h$ in $L^2$, where
  $ bb(E) h = 0 \, wide parallel D h parallel_2^2 lt.eq 1 \, wide parallel h parallel_2^2 lt.eq
    P parallel D h parallel_2^2 . $
  For $c > 0$, $epsilon > 0$ and $z gt.eq - c \/ epsilon$ define
  $ Q_(c \, epsilon) \( z \) =
    epsilon^(- 2) [\( c + epsilon z \)^2 log frac(\( c + epsilon z \)^2, c^2) - \( c + epsilon z \)^2 + c^2] . $
  Normalization and $- log c_j^2 - 1 + c_j^2 gt.eq 0$ give
  #[#set math.equation(numbering: n => "(3.10)")
   $ epsilon_j^(- 2) "Ent" \( f_j^2 \) lt.eq integral Q_(c_j \, epsilon_j) \( h_j \) thin d nu .
     $ <eq:critical-small-energy-start>]
  Here is the scalar estimate needed to control unbounded $h_j$.
    For $1 \/ 2 lt.eq c lt.eq 1$ and $0 < epsilon lt.eq 1 \/ 2$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ 0 lt.eq Q_(c \, epsilon) \( z \) lt.eq \( 2 + 2 log 2 \) z^2 + z^2 log_(+) z^2 \, wide
     Q_(c \, epsilon) \( z \) arrow.r 2 z^2 $ <eq:critical-scalar-Q>]
  uniformly on bounded $z$-intervals as $c arrow.r 1$ and $epsilon arrow.r 0$.
    To verify the bound, put $t = epsilon z \/ c$. Then $Q = z^2 B \( t \)$, where Taylor’s integral formula gives
  $ B \( t \) = 2 + 4 integral_0^1 \( 1 - r \) log \( 1 + r t \) thin d r \, wide - 1 lt.eq t < oo . $
  For $t lt.eq 0$, $B \( t \) lt.eq 2$. For $t gt.eq 0$, use $t lt.eq z$ to obtain $B \( t \) lt.eq 2 +
    2 log \( 1 + z \) lt.eq 2 + 2 log 2 + log_(+) z^2$. Continuity at $t = 0$ proves the compact convergence.
  The tail proof in Lemma 9 did not use unit norm until its last sentence.
    In particular, for any bounded form sequence $u_j arrow.r u$ in $L^2$ with energies tending to $E_(*)$, it proves
  #[#set math.equation(numbering: n => "(3.12)")
   $ lim_(K arrow.r oo) limsup_j integral_(\| u_j \| > K) u_j^2 log_(+) u_j^2 d nu lt.eq
     2 s \( E_(*) - parallel D u parallel_2^2 \) . $ <eq:critical-general-tail>]
  Apply the compact convergence in Equation (3.11) on $\| h_j \| lt.eq K$ and its upper bound on the complement.
    Strong $L^2$ convergence removes the quadratic tail as $K arrow.r oo$;
    Equation (3.12) controls the entropy tail. Equation (3.10) consequently gives
  $ limsup_j epsilon_j^(- 2) "Ent" \( f_j^2 \) lt.eq 2 parallel h parallel_2^2 +
    2 s \( 1 - parallel D h parallel_2^2 \) lt.eq 2 max \( P \, s \) < 2 R . $
  This contradicts the maximizing property.
  We may therefore extract $f_j arrow.r f$ strongly in $L^2$ with $parallel D f_j parallel_2^2 arrow.r E_(*) > 0$.
    Put $E = parallel D f parallel_2^2$. The entropy defect and the sharp inequality give
  $ 2 R E_(*) lt.eq "Ent" \( f^2 \) + 2 s \( E_(*) - E \) lt.eq 2 R E + 2 s \( E_(*) - E \) . $
  Since $R > s$ and $E lt.eq E_(*)$, equality forces $E = E_(*) > 0$. Thus $f$ is a nonnegative, nonconstant optimizer.
  The homogeneous functional $"Ent" \( g^2 \) - 2 R parallel D g parallel_2^2$ is nonpositive and is zero at $f$.
    Its derivative along every compact smooth variation $zeta$ is
  $ 4 integral f log f thin zeta thin d nu - 4 R integral D f dot.op D zeta thin d nu = 0 . $
  The entropy normalization term cancels the additional linear term.
    Differentiation is legitimate also at zeros because $z^2 log z^2$ has derivative zero at zero.
    This proves the Euler equation in Equation (3.9).
  We have obtained a nonnegative optimizer with positive energy.
    To use its logarithmic derivative, we still need local regularity and strict positivity.
    We spell out the weak-solution regularity step, using the interior Newtonian-potential $L^p$ and Schauder
    estimates; see #cite(label("Viaclovsky2004")) Lecture 24, p. 2; Lecture 10, Proposition 1.
    Write $nu = e^(- V)$ and set $v = e^(- V \/ 2) f gt.eq 0$.
    The function $V$ is smooth, and direct differentiation of the weak equation gives
  $ - Delta v = lambda v log v + (frac(lambda V, 2) - frac(\| D V \|^2, 4) + frac(Delta V, 2)) v . $
  The conjugating factor and its reciprocal are bounded on each fixed ball.
    Since $\| z log z \| lt.eq C_delta \( 1 + z^(1 + delta) \)$ for $z gt.eq 0$,
    local $L^p$ integrability of $v$ puts the right side in $L_(upright("loc"))^q$, where $q =
    p \/ \( 1 + delta \) > 1$. Localize that right side on a larger ball and take its Newtonian potential with the
    sign solving $- Delta u = F$. The cited $L^q$ estimate gives $u in W_(upright("loc"))^(2 \, q)$;
    the difference $v - u$ is distributionally harmonic and hence smooth by Weyl’s lemma
    #cite(label("Viaclovsky2004")) Lecture 3, Theorem 2. This proves the required $W^(2 \, q)$ gain directly for
    the weak solution.
  For $n gt.eq 2$, start with $p = 2$ and choose $0 < delta < min \( 1 \, 2 \/ n \)$.
    Before boundedness is reached, Sobolev embedding improves reciprocal integrability from $1 \/
    p$ to $\( 1 + delta \) \/ p - 2 \/ n$, a decrease greater than $1 \/ n$ because $p gt.eq 2$.
    At a critical exponent use any sufficiently large finite integrability exponent and continue once more.
    After finitely many steps $q > n \/ 2$, so $v$, and thus $f$, is locally bounded and Hölder continuous.
    In dimension one the same conclusion follows by twice integrating the local Poisson equation.
    The function $z log z$ is locally Hölder of every exponent below one on $\[ 0 \, oo \)$;
    reducing the exponent if necessary, the Schauder estimate therefore gives $f in
    C_(upright("loc"))^(2 \, alpha)$ for some $alpha > 0$. All constants in this paragraph concern one fixed law
    and dimension; none enters a uniform estimate along the counterexample sequence.
  If $f \( x_0 \) = 0$, choose a ball $B$ about $x_0$ with $0 lt.eq f lt.eq b < 1$ on its closure.
    Start the $nu$-diffusion at $x_0$ and stop at its exit time $tau$ from $B$.
    For $Z_t = f \( Y_(t and tau) \)$, $m \( t \) = bb(E) Z_t$, and $g \( z \) = - lambda z log z$,
    the stopped Itô formula gives, for almost every $t$,
  $ m' \( t \) = bb(E) \[ upright(bold(1))_(t < tau) g \( Z_t \) \] lt.eq bb(E) g \( Z_t \) lt.eq
    g \( m \( t \) \) \, wide m \( 0 \) = 0 . $
  Indeed $g$ is nonnegative and concave on $\[ 0 \, b \]$; the first inequality adds its nonnegative stopped
    boundary contribution. Also $m' gt.eq 0$. If $m \( t_1 \) > 0$, let $t_a$ be the first time at which $m = a$,
    for $0 < a < m \( t_1 \)$. Integration gives
  $ integral_a^(m \( t_1 \)) frac(d z, - lambda z log z) lt.eq t_1 - t_a lt.eq t_1 \, $
  contradicting divergence as $a arrow.b 0$. Hence $m = 0$.
    The killed nondegenerate diffusion has positive probability of reaching each open subset of $B$ while staying
    in $B$: one can follow a smooth interior path by requiring Brownian motion to remain in a small tube about its
    corresponding driving path, and use local Lipschitz continuity of the drift.
    Brownian tube probabilities are positive by its finite increment densities and bridge continuity.
    Consequently $f$ vanishes throughout $B$. Its zero set is both open and closed,
    impossible in connected $bb(R)^n$ for a unit-norm function.
    Thus $f > 0$, and smooth elliptic bootstrap makes $f$ smooth everywhere. ◻
]

An optimizer supplies a second probability with its own logarithmic Sobolev inequality.
  The next identity explains why no convexity assumption on this second probability is needed.

#thm([Lemma 3.5.])[
  (Change of reference at an optimizer).  #emph[Under Lemma 10, suppose in addition that $nu =
    e^(- V)$ is log-concave with bounded $K = D^2 V$. Define
$ eta = f^2 nu \, wide h = log f^2 \, wide w = D h \, wide I = bb(E)_eta \| w \|^2 . $

 Then $I = 2 lambda H \( eta divides nu \) > 0$, $R \( eta \) lt.eq 1 \/ lambda$,
   each component of $w$ belongs to $"Dom" \( A_eta \)$, and
#[#set math.equation(numbering: n => "(3.13)")
 $ A_nu h = lambda h + 1 / 2 \| w \|^2 \, wide A_eta w = \( lambda upright("Id") - K \) w .
   $ <eq:critical-score-equation>]

 Moreover,
#[#set math.equation(numbering: n => "(3.14)")
 $ bb(E)_eta chevron.l w \, K w chevron.r lt.eq lambda \| bb(E)_eta w \|^2 . $ <eq:critical-curvature-mean>]

]
] <lem:critical-change-reference>

#proof[
  Since $w = 2 D f \/ f$, $I = 4 parallel D f parallel_(L^2 \( nu \))^2$; optimizer equality gives $I =
    2 lambda H \( eta divides nu \) > 0$. The chain rule applied to its Euler equation gives the first identity in
    Equation (3.13). Commuting one derivative with $A_nu$ gives
  $ A_nu w = D \( A_nu h \) - K w = lambda w + \( D w \) w - K w . $
  Since $A_eta = A_nu - w dot.op D$ and $D w$ is symmetric, the second identity follows distributionally.
    Its right side is in $L^2 \( eta \)$, since $K$ is bounded and $w in L^2 \( eta \)$.
    Lemma 4 therefore puts $w$ in the operator domain; no unproved integrability of higher derivatives has been used.
  Let $p = g^2 eta$ have unit mass, where $g$ is compactly supported and smooth.
    Direct expansion and compactly supported integration by parts give
  $ cal(I) \( p divides nu \) & = cal(I) \( p divides eta \) + integral g^2 \| w \|^2 d eta +
    2 integral D \( g^2 \) dot.op w thin d eta\
 & = cal(I) \( p divides eta \) + integral g^2 { \| w \|^2 + 2 A_eta h } thin d eta\
 & = cal(I) \( p divides eta \) + 2 lambda integral h thin d p . $
  These formulas may be read in square-root form at zeros of $g$.
    On the other hand $H \( p divides nu \) = H \( p divides eta \) + integral h thin d p$. Thus
  #[#set math.equation(numbering: n => "(3.15)")
   $ cal(I) \( p divides nu \) - 2 lambda H \( p divides nu \) = cal(I) \( p divides eta \) -
     2 lambda H \( p divides eta \) . $ <eq:critical-exact-deficit>]
  Apply the inequality for $nu$ to the compact smooth function $g f$.
    Its deficit is nonnegative, so the right side is nonnegative.
    Homogeneity and the Sobolev approximation of Section 2 prove $R \( eta \) lt.eq 1 \/ lambda$.
    Finally the domain identity gives
  $ bb(E)_eta \| D w \|^2 = lambda I - bb(E)_eta chevron.l w \, K w chevron.r \, $
  while Poincaré for $eta$ gives the lower bound $lambda \( I - \| bb(E)_eta w \|^2 \)$.
    Subtract to obtain Equation (3.14). ◻
]

=== 3.3 Uniform estimates in the two alternatives <uniform-estimates-in-the-two-alternatives>

#thm([Lemma 3.6.])[
  (Translation gain).  #emph[Let $mu$ satisfy Equation (3.1), with $a lt.eq 1$.
    Fix a compact interval $J subset \( 0 \, 1 \/ 2 \)$. There is a constant $C_J$,
    independent of the dimension and of the support radius of $mu$, with the following property.
    For $s in J$, put $lambda = R_s^(- 1)$. If $sigma$ is any probability with
$ D_0 = H \( sigma divides mu_s \) < oo \, wide F_0 = cal(I) \( sigma divides mu_s \) < oo \, wide p =
  bb(E)_sigma Y \, $

 then
#[#set math.equation(numbering: n => "(3.16)")
 $ F_0 - 2 lambda D_0 gt.eq \( s^(- 2) - lambda \/ s \) \| p \|^2 -
   C_J sqrt(a) thin \( F_0 + D_0 \) . $ <eq:critical-translation-gain>]

]
] <lem:translation-gain>

#proof[
  The centered linear moment generating functions under $mu_s$ obey
  $ log bb(E)_(mu_s) e^(v dot.op Y) lt.eq C_J \| v \|^2 \, wide log bb(E)_(mu_s) e^(v dot.op b_s \( Y \)) lt.eq
    C a^2 \| v \|^2 . $
  The first follows by independent Gaussian addition and Equation (3.2);
    the second follows by conditional Jensen from that equation.
    Entropy duality, optimized over the scalar multiple of each unit vector, gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ \| p \| lt.eq C_J sqrt(D_0) \, wide \| bb(E)_sigma b_s \( Y \) \| lt.eq
     C a sqrt(D_0) . $ <eq:critical-entropic-means>]
  All expectations exist. More explicitly, compact support of $X$ makes $bb(E)_(mu_s) e^(c \| Y \|^2) <
    oo$ for some $c > 0$; entropy duality then implies $bb(E)_sigma \| Y \|^2 < oo$.
    The latter fact is used only for integrability, not for a uniform bound in dimension.
  Let $sigma_u$ be the translate of $sigma$ by $- u p$, $0 lt.eq u lt.eq 1$, and let $D_u =
    H \( sigma_u divides mu_s \)$. Change of variables in entropy and the Hessian bound give
  $ D_u & = D_0 + bb(E)_sigma \[ V_s \( Y - u p \) - V_s \( Y \) \]\
 & lt.eq D_0 - u \| p \|^2 \/ s + u thin p dot.op bb(E)_sigma b_s \( Y \) \/ s + u^2 \| p \|^2 \/ \( 2 s \) lt.eq
   C_J D_0 . $
  Thus Equation (3.17), applied to $sigma_u$, implies $\| bb(E)_sigma b_s \( Y - u p \) \| lt.eq
    C_J a sqrt(D_0)$ uniformly in $u$. Differentiating the exact entropy expression, and then integrating, gives
  #[#set math.equation(numbering: n => "(3.18)")
   $ D_1 = D_0 - frac(\| p \|^2, 2 s) + O_J \( a D_0 \) . $ <eq:critical-translated-entropy>]
  Indeed its derivative is $- \( 1 - u \) \| p \|^2 \/ s + p dot.op bb(E)_sigma b_s \( Y - u p \) \/ s$.
  Write $r \( Y \) = D log \( d sigma \/ d mu_s \) \( Y \)$ in the weak square-root sense. Its mean is
  #[#set math.equation(numbering: n => "(3.19)")
   $ bb(E)_sigma r = bb(E)_sigma D V_s = \( p - bb(E)_sigma b_s \) \/ s . $ <eq:critical-score-mean>]
  To justify this for finite Fisher information, the Lebesgue density $q$ of $sigma$ has weak derivative $D q =
    q \( r - D V_s \) in L^1$: $r$ is square integrable and $D V_s$ has linear growth.
    Integrating against expanding cutoffs gives $integral D q = 0$ and hence Equation (3.19).
  In the moving coordinates $Y$, the score of $sigma_1$ relative to $mu_s$ is
  $ r \( Y \) - p \/ s + d \( Y \) \/ s \, wide d \( Y \) = b_s \( Y \) - b_s \( Y - p \) . $
  Since $0 lt.eq D b_s lt.eq upright("Id")$, integration along the segment gives
  $ \| d \( Y \) \|^2 = lr(|integral_0^1 M_s \( Y - u p \) p thin d u|)^2 lt.eq
    integral_0^1 \| M_s \( Y - u p \) p \|^2 d u lt.eq p dot.op d \( Y \) . $
  The mean estimates at the two endpoints therefore imply
  #[#set math.equation(numbering: n => "(3.20)")
   $ bb(E)_sigma \| d \|^2 lt.eq C_J a D_0 . $ <eq:critical-posterior-translation-error>]
  Expanding the score square and using Equation (3.19),
  $ bb(E)_sigma \| r - p \/ s \|^2 = F_0 - \| p \|^2 \/ s^2 + 2 p dot.op bb(E)_sigma b_s \/ s^2 . $
  The remaining cross term is bounded by $C_J sqrt(a D_0) thin \( sqrt(F_0) + sqrt(D_0) \)$,
    and the $d$-square term by $C_J a D_0$. Consequently the translated information is finite and satisfies
  #[#set math.equation(numbering: n => "(3.21)")
   $ F_1 = F_0 - \| p \|^2 \/ s^2 + O_J \( sqrt(a) thin \( F_0 + D_0 \) \) . $ <eq:critical-translated-information>]
  These calculations require only the weak derivatives already justified,
    so they apply also when the density of $sigma$ vanishes. Apply logarithmic Sobolev to $sigma_1$,
    namely $F_1 gt.eq 2 lambda D_1$, and combine Equations (3.18) and (3.21).
    Since $2 \/ 3 lt.eq lambda lt.eq 1$ on the time interval in question, this proves Equation (3.16). ◻
]

We can now obtain estimates that are uniform along the counterexample sequence.
  Write $R_s^P$ for the optimal Poincaré constant of $mu_s$. By linearization $R_s^P lt.eq R_s$.
  Since $R_s gt.eq 1 > s$ on $\( 0 \, 1 \/ 2 \)$, the strict alternative $R_s >
  R_s^P$ meets all the hypotheses of Lemma 10.

#thm([Lemma 3.7.])[
  (Critical fields in both alternatives).  #emph[Fix $J subset \( 0 \, 1 \/ 2 \)$ compact and $s in J$,
    and put $lambda = 1 \/ R_s$. There are a smooth positive probability $eta$ and a smooth vector field $w$,
    with $0 < I := bb(E)_eta \| w \|^2 < oo$, such that
#[#set math.equation(numbering: n => "(3.22)")
 $ R \( eta \) lt.eq lambda^(- 1) \, wide w in "Dom" \( A_eta \)^n \, wide
   A_eta w = \( lambda upright("Id") - K_s \) w . $ <eq:critical-common-identities>]

 They can be chosen as follows.]
  + #emph[If $R_s > R_s^P$, take the optimizer $f$ of Lemma 10 and set
$ eta = f^2 mu_s \, wide w = D log f^2 \, wide I = 2 lambda H \( eta divides mu_s \) . $

]
  + #emph[If $R_s = R_s^P$, there is a centered nonconstant gap eigenfunction $phi$ satisfying $A_(mu_s) phi =
    lambda phi$. Take
$ eta = mu_s \, wide w = D phi \, wide I = lambda bb(E)_(mu_s) phi^2 . $

]
  #emph[In either alternative,
#[#set math.equation(numbering: n => "(3.23)")
 $ \| bb(E)_eta w \|^2 + bb(E)_eta \| K_s w \|^2 lt.eq C_J sqrt(a) thin I \, wide bb(E)_eta chevron.l w \,
   K_s w chevron.r lt.eq lambda \| bb(E)_eta w \|^2 . $ <eq:critical-uniform-smallness>]

 In alternative (ii) the factor $sqrt(a)$ can be replaced by $a^2$.
   Coordinates belong to $"Dom" \( A_eta \)$ in both alternatives.]
] <lem:critical-two-alternatives>

#proof[
  In the first alternative the identities and the last inequality are Lemma 11.
    Apply Lemma 12 to $sigma = eta$, where $F_0 = I$ and $D_0 = I \/ \( 2 lambda \)$, so the deficit vanishes.
    The coefficient $s^(- 2) - lambda \/ s$ is bounded below by a positive constant on $J$.
    Thus, with $p = bb(E)_eta Y$,
  $ \| p \|^2 lt.eq C_J sqrt(a) thin I \, wide \| bb(E)_eta b_s \| lt.eq C_J a sqrt(I) . $
  Equation (3.19) applied to $eta$ now gives $\| bb(E)_eta w \|^2 lt.eq C_J sqrt(a) thin I$.
    Since $K_s^2 lt.eq s^(- 1) K_s$, the curvature-mean inequality gives the asserted estimate for $K_s w$.
  In the second alternative, compact form embedding supplies a minimizer of the Rayleigh quotient among mean-zero
    functions of unit norm. Its positive eigenvalue is $1 \/ R_s^P = lambda$.
    The nullspace consists of constants, since zero weak gradient on $bb(R)^n$ implies constancy.
    Compactness therefore makes this a positive gap, and interior elliptic regularity makes its eigenfunction
    $phi$ smooth. Commuting a derivative gives $A_(mu_s) D phi = \( lambda upright("Id") - K_s \) D phi$.
    Its right side is in $L^2$, so Lemma 4 gives the operator-domain assertion.
    Taking the energy pairing and then Poincaré gives, exactly as before,
  $ bb(E) chevron.l w \, K_s w chevron.r lt.eq lambda \| bb(E) w \|^2 . $
  Coordinates belong to the operator domain because both $Y$ and $A_(mu_s) Y = \( Y - b_s \) \/
    s$ belong to $L^2 \( mu_s \)$. Integration by parts, or self-adjointness with these coordinate tests, yields
  $ bb(E) w = lambda bb(E) \[ phi Y \] = frac(bb(E) \[ phi Y \] - bb(E) \[ phi b_s \], s) \,
    wide \( 1 - lambda s \) bb(E) \[ phi Y \] = bb(E) \[ phi b_s \] . $
  Conditional Jensen gives
  $ bb(E)_(mu_s) b_s b_s^(*) lt.eq bb(E)_mu X X^(*) lt.eq C a^2 upright("Id") . $
  For every unit vector $v$, Cauchy–Schwarz thus bounds $\| bb(E) \[ phi thin v dot.op b_s \] \|$ by $C a parallel
    phi parallel_2$. Taking the supremum over $v$ introduces no dimension factor.
    Since $1 - lambda s gt.eq 1 \/ 2$ and $I = lambda parallel phi parallel_2^2$,
    it follows that $\| bb(E) w \| lt.eq C_J a sqrt(I)$. The bound for $K_s w$ follows from $K_s^2 lt.eq
    s^(- 1) K_s$ once again.
  It remains to justify the coordinate assertion for the first alternative.
    Finite $H \( eta divides mu_s \)$ and the Gaussian tails of $mu_s$ imply $bb(E)_eta \| Y \|^2 < oo$,
    by the entropy argument in the proof of Lemma 12. The distributional identity
  #[#set math.equation(numbering: n => "(3.24)")
   $ A_eta Y = \( Y - b_s \) \/ s - w $ <eq:critical-coordinate-generator>]
  has an $L^2 \( eta \)$ right side, because $b_s$ is bounded for the fixed law and $w in L^2 \( eta \)$.
    The maximal-domain assertion of Lemma 4 applies. ◻
]

#thm([Proposition 3.8.])[
  (Limit of the regularized constants).  #emph[For the sequence in Lemma 7,
#[#set math.equation(numbering: n => "(3.25)")
 $ R_s arrow.r 1 wide upright("for every ") 0 < s < 1 \/ 2 . $ <eq:critical-R-limit>]

 At every differentiability point of $R_s$, the fields of Lemma 13 satisfy the contact identity
#[#set math.equation(numbering: n => "(3.26)")
 $ R'_s = R_s thin frac(bb(E)_eta chevron.l w \, K_s w chevron.r, I) . $ <eq:critical-contact-derivative>]

 In particular $0 lt.eq R'_s lt.eq C_J sqrt(a)$ almost everywhere on each fixed compact $J subset \( 0 \, 1 \/ 2 \)$.]
] <prop:regularized-constants>

#proof[
  Fix $s$, and let $Phi_(s \, t)$ be the heat continuity flow from Lemma 8, for $t$ on either side of $s$.
    Transport a form-domain test $g$ by $g_t = g compose Phi_(s \, t)^(- 1)$.
    Its distribution under $mu_t$ is fixed, so both its entropy and its variance are constant.
    The Jacobian equation $partial_t D Phi_(s \, t) = K_t D Phi_(s \, t) \/ 2$ gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ frac(d, d t)\|_(t = s) integral \| D g_t \|^2 d mu_t = - integral chevron.l D g \,
     K_s D g chevron.r d mu_s . $ <eq:critical-transport-energy>]
  For compact smooth $g$ this follows by differentiating the inverse-transpose Jacobian in the gradient.
    For a form-domain $g$, the change-of-variables formula still holds by Sobolev approximation.
    The flow derivatives and their time derivatives are uniformly bounded on a compact time interval,
    so the derivative of the integrand is dominated by $C \| D g \|^2$.
    Dominated convergence proves Equation (3.27) without a smoothness or compact-support restriction on $g$.
  In the strict alternative take $g = f$ and set $Q \( t \) =
    "Ent"_(mu_t) \( f_t^2 \) \/ \( 2 integral \| D f_t \|^2 d mu_t \)$.
    The denominator is positive near $s$, and $Q \( t \) lt.eq R_t$ for both signs of $t - s$, with $Q \( s \) =
    R_s$. At a differentiability point of $R_s$, this two-sided contact implies $Q' \( s \) = R'_s$.
    Equation (3.27) and $w = 2 D f \/ f$ give Equation (3.26).
    In the gap alternative take $g = phi$ and instead use $Q \( t \) =
    "Var"_(mu_t) \( phi_t \) \/ integral \| D phi_t \|^2 d mu_t$.
    Now $Q \( t \) lt.eq R_t^P lt.eq R_t$ and $Q \( s \) = R_s^P = R_s$.
    The same contact argument gives the identical derivative formula, with $w = D phi$.
  Equation (3.23) bounds this derivative by $C_J sqrt(a)$ in either alternative,
    with constants independent of which alternative holds at each time.
    Lipschitz continuity makes $R_s$ absolutely continuous. For fixed $0 < delta < s < 1 \/ 2$,
    integration on $\[ delta \, s \]$ gives
  $ 1 lt.eq R_s lt.eq R_delta + C_(\[ delta \, s \]) sqrt(a) thin \( s - delta \) lt.eq 1 + delta +
    C_(\[ delta \, s \]) sqrt(a) thin \( s - delta \) . $
  First take the counterexample-sequence limit and then let $delta arrow.b 0$. This proves Equation (3.25). ◻
]

We finish by fixing the Gaussian time and collecting precisely the objects used in the following sections.
  The fixed time will not be sent to zero.

#thm([Proposition 3.9.])[
  (The critical sequence).  #emph[If Theorem 1 fails, there is a sequence of dimensions and centered compactly
    supported log-concave laws $mu$ satisfying Equation (3.1).
    Fix $s = 1 \/ 8$, form $mu_s \, b_s \, M_s \, K_s$ as in Equation (3.3), and put $lambda = R_s^(- 1)$.
    After passage to a subsequence there are smooth positive probabilities $eta$ and smooth vector fields $w$ such
    that, with $A = A_eta$ and $I = bb(E)_eta \| w \|^2$,
#[#set math.equation(numbering: n => "(3.28)")
 $ lambda arrow.r 1 \, wide R \( eta \) lt.eq lambda^(- 1) \, wide 0 < I < oo \, wide w in "Dom" \( A \)^n \,\
A w = \( lambda upright("Id") - K_s \) w \, wide parallel \( A - 1 \) w parallel_(L^2 \( eta \)) + \| bb(E)_eta
  w \| = o \( sqrt(I) \) \,\
bb(E)_eta \| K_s w \|^2 = o \( I \) \, wide bb(E)_eta \| D w \|^2 = \( 1 + o \( 1 \) \) I .
  $ <eq:critical-sequence-data>]

 The spectral gap of $A$ is at least $lambda$. Each coordinate function belongs to $"Dom" \( A \)$.
   Exactly one of the following constructions can be used throughout the subsequence:]
  + #emph[$R_s > R_s^P$, $eta = f^2 mu_s$ for the positive unit-norm optimizer, $w = D log f^2$, and $I =
    2 lambda H \( eta divides mu_s \)$. The exact deficit identity in Equation (3.15) holds for compact
    square-root tests relative to $eta$, and $A Y = \( Y - b_s \) \/ s - w$.]
  + #emph[$R_s = R_s^P$, $eta = mu_s$, $A phi = lambda phi$, $bb(E)_eta phi = 0$, $w = D phi$, and $I =
    lambda bb(E)_eta phi^2$. One may rescale $phi$ so that $I arrow.r 0$.]
  #emph[All $o$-terms refer to the counterexample sequence with fixed finite parameters.
    In particular no relation between dimension, $I$, and the rate of convergence is asserted or needed here.]
] <prop:critical-sequence>

#proof[
  Choose an infinite subsequence with the same alternative at $s = 1 \/ 8$.
    Lemma 13 gives all structural identities and the curvature and mean bounds.
    Proposition 14 gives $lambda arrow.r 1$. Consequently
  $ \( A - 1 \) w = \( lambda - 1 \) w - K_s w = o_(L^2) \( sqrt(I) \) . $
  The energy pairing yields $bb(E) \| D w \|^2 = lambda I - bb(E) chevron.l w \,
    K_s w chevron.r = \( 1 + o \( 1 \) \) I$. Poincaré with constant $lambda^(- 1)$ is the asserted spectral gap.
    The coordinate and branch-specific identities have already been proved.
    In the gap alternative all estimates are homogeneous in $phi$,
    so multiplying it by positive scalars can enforce $I arrow.r 0$ without changing any normalized assertion. ◻
]

== 4 Efficient probes and the prediction curve <sec:prediction>

Fix $s = 1 \/ 8$ and take one of the two subsequences supplied by Proposition 15.
  We continue to suppress the counterexample index. Thus $lambda arrow.r 1$,
  $eta$ satisfies the logarithmic Sobolev inequality with constant at most $1 \/ lambda$, and, with $A = A_eta$,
  $w$ belongs coefficientwise to $"Dom" \( A \)$ and satisfies

#[#set math.equation(numbering: n => "(4.1)")
 $ I = bb(E)_eta \| w \|^2 > 0 \, wide parallel \( A - 1 \) w parallel_(L^2 \( eta \)) + \| bb(E)_eta w \| =
   o \( sqrt(I) \) . $ <eq:prediction-input>]

In the strict case, $eta = f^2 mu_s$, $w = D log f^2$, and $2 H \( eta divides mu_s \) = I \/ lambda$.
  In the gap case, $eta = mu_s$, $w = D phi$, and $A_(mu_s) phi = lambda phi$, where $bb(E)_(mu_s) phi =
  0$ and $I = lambda bb(E)_(mu_s) phi^2$. All limits in this section are along the selected subsequence,
  with the displayed auxiliary parameters fixed unless a different order is specified.

Our objective is to determine how much of $w \( Y_0 \)$ can be predicted from $Y_0 + sqrt(r) G$.
  The strict case first requires an entropy estimate for an additional Gaussian observation of $w$.
  We then prove an entropy-loss comparison for arbitrary smooth alternatives to a log-concave law.
  These two estimates determine the prediction curve; linearization of the same comparison handles the gap case.

#thm([Lemma 4.1.])[
  (Efficient Gaussian probes).  #emph[In the strict case, let $Y_0 tilde.op
    eta$ and let $G'$ be an independent standard Gaussian vector in the same Euclidean space. For $T gt.eq 0$ define
$ L_T = sqrt(T) thin w \( Y_0 \) + G' \, wide d \( T \) = H \( "Law" \( L_T \) divides gamma \) \, $

 where $gamma$ is standard Gaussian measure. For every finite $M$,
#[#set math.equation(numbering: n => "(4.2)")
 $ sup_(0 lt.eq T lt.eq M) d \( T \) = o \( I \) . $ <eq:efficient-probes>]

]
] <lem:efficient-probes>

#proof[
  Run the stationary diffusion with law $eta$, using Brownian noise independent of $G'$, and write $P_u =
    e^(- u A)$. Proposition 15 puts each coordinate in $"Dom" \( A \)$ and gives the identity
  #[#set math.equation(numbering: n => "(4.3)")
   $ - A y = - y \/ s + w + b_s \/ s . $ <eq:prediction-coordinate-generator>]
  In particular, $bb(E)_eta \| Y_0 \|^2 < oo$. The logarithmic Sobolev inequality for $eta$ then gives
  $ bb(E)_eta e^(v dot.op \( Y_0 - bb(E) Y_0 \)) lt.eq e^(\| v \|^2 \/ \( 2 lambda \)) . $
  Integrating this inequality over a Gaussian $v$ proves $bb(E)_eta e^(c' \| Y_0 \|^2) <
    oo$ for a sufficiently small $c' > 0$. Here the choice of $c'$ may depend on the individual law and dimension.
    This exponential-square moment will also permit application of the entropy-loss comparison below.
  For a fixed $T lt.eq M$, set
  $ J_u = sans(I) \( L_T \; Y_u \) \, wide F_u = bb(E) thin
    cal(I) \( "Law" \( Y_u divides L_T \) divides eta \) \, wide Q_u = bb(E) \| bb(E) \[ Y_u divides L_T \] \|^2 . $
  The Gaussian observation identity gives $J_0 = T I \/ 2 - d \( T \)$.
    Entropy dissipation, including its conditional version, gives $- d J_u gt.eq F_u thin d u$,
    and in particular $integral_0^1 F_u thin d u lt.eq J_0$. If $sigma_(u \, l) =
    "Law" \( Y_u divides L_T = l \)$, then the entropy chain rule and the strict-case normalization give
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) H \( sigma_(u \, L_T) divides mu_s \) = J_u + frac(I, 2 lambda) \, wide
     bb(E) cal(I) \( sigma_(u \, L_T) divides mu_s \) = F_u + I . $ <eq:probe-reference-decomposition>]
  For the second equality, write the conditional relative score with respect to $mu_s$ as the sum of $w$ and the
    conditional relative score with respect to $eta$. The latter scores have conditional average zero at each
    $Y_u$, since the conditional likelihoods average to one. This cancels the cross term.
    At the almost every time where $F_u < oo$, the assertion also follows weakly by differentiating that marginal
    identity: Cauchy–Schwarz gives locally integrable averaged derivatives.
  Apply Lemma 12 to $sigma_(u \, l)$ and average over $l$. Since $s^(- 2) - lambda \/ s$ stays positive,
    Equations (4.4) give, on $\[ 0 \, 1 \]$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ - d J_u gt.eq \( 2 lambda J_u + c_s Q_u \) thin d u - d cal(E)_u \, wide cal(E) \( \[ 0 \, 1 \] \) =
     o_M \( I \) \, $ <eq:probe-decay>]
  where $c_s > 0$ is fixed and $cal(E)$ is a nonnegative error measure.
    Indeed the error in that lemma is bounded by a number tending to zero times $F_u + I + J_u +
    I \/ \( 2 lambda \)$, whose integral is $O_M \( I \)$. The measure formulation avoids imposing
    differentiability on $J_u$.
  The spectral theorem and Equation (4.1) imply
  #[#set math.equation(numbering: n => "(4.6)")
   $ sup_(0 lt.eq u lt.eq 1) parallel P_u w - e^(- u) w parallel_2 lt.eq parallel \( A - 1 \) w parallel_2 =
     o \( sqrt(I) \) . $ <eq:probe-semigroup>]
  Reversibility gives $bb(E) \[ L_T divides Y_u \] = sqrt(T) P_u w \( Y_u \)$.
    Relative entropy with respect to a standard Gaussian is at least half the square of the mean,
    by testing its variational formula with linear functions. Consequently
  $ J_u + d \( T \) = bb(E) H \( "Law" \( L_T divides Y_u \) divides gamma \) gt.eq T /
    2 parallel P_u w parallel_2^2 = frac(T I, 2) e^(- 2 u) + o_M \( I \) . $
  Integrating Equation (4.5) with factor $e^(2 lambda u)$ and comparing at $u = 1$ yields
  #[#set math.equation(numbering: n => "(4.7)")
   $ integral_0^1 Q_u thin d u lt.eq C_s d \( T \) + o_M \( I \) . $ <eq:probe-position-control>]
  Here the difference between $e^(- 2 lambda)$ and $e^(- 2)$ contributes only $o_M \( I \)$.
  It remains to turn control of the predicted position into control of the predicted score.
    The pushforward of $mu_s$ by $b_s$ has the centered linear moment bound
  $ log bb(E)_(mu_s) e^(v dot.op b_s) lt.eq C a^2 \| v \|^2 \, $
  by conditional Jensen and the corresponding bound for the original signal $X$.
    The entropy variational formula, optimized over $v$, thus gives
  $ bb(E) \| bb(E) \[ b_s \( Y_v \) divides L_T \] \|^2 lt.eq C a^2 #scale(x: 120%, y: 120%)[\(] J_v +
    I \/ \( 2 lambda \) #scale(x: 120%, y: 120%)[\)] = o_M \( I \) . $
  Condition Equation (4.3) on $L_T$ and use variation of constants.
    By Equation (4.6) and the contraction property of conditional expectation,
  #[#set math.equation(numbering: n => "(4.8)")
   $ bb(E) \[ Y_u divides L_T \] = e^(- u \/ s) bb(E) \[ Y_0 divides L_T \] +
     frac(e^(- u) - e^(- u \/ s), 1 \/ s - 1) bb(E) \[ w \( Y_0 \) divides L_T \] + o_(L^2 \, M) \( sqrt(I) \) \,
     $ <eq:probe-coordinate-solution>]
  uniformly for $0 lt.eq u lt.eq 1$. The two scalar functions multiplying the conditional means are linearly
    independent on $\[ 0 \, 1 \]$: the first is nonzero at zero,
    whereas the second vanishes there and is nonzero for $u > 0$.
    Their $2 times 2$ Gram matrix is therefore positive definite.
    Applying its smallest-eigenvalue bound to each coordinate and then averaging, Equations (4.7) and (4.8) show that
  $ bb(E) \| bb(E) \[ w \( Y_0 \) divides L_T \] \|^2 lt.eq C_s d \( T \) + o_M \( I \) . $
  By Lemma 6, the left side is $2 d' \( T \)$ for almost every $T$.
    The error is uniform for $T in \[ 0 \, M \]$, and $d \( 0 \) = 0$.
    Integrating this differential inequality proves Equation (4.2). No lower bound on $I$ is used. ◻
]

The next comparison relates the entropy lost under heat flow to the conditional mean of the initial relative
  score. The conditional mean need not equal the relative score at positive heat time,
  so entropy dissipation alone does not give this comparison.

The choice of observation directions is related to function-preserving stochastic localization.
  Eldan–Koehler–Zeitouni #cite(label("EldanKoehlerZeitouni2022")) Section 2,
  Lemma 2 use controls approximating projection orthogonal to the covariance of the signal with a selected
  function. Chen and Eldan #cite(label("ChenEldan2022")) Sections 2.4.2 and 3.2.3,
  Equation (27) express the entropy drift through the difference of means under a measure and its normalized
  likelihood tilt, in a continuous-time setup with positive definite controls.
  Below we prove the cancellation and its error directly for finite Gaussian observations with singular
  projections, and use independent copies to control the discarded directions.

#thm([Lemma 4.2.])[
  (Entropy loss under a Gaussian observation).  #emph[Let $p$ and $q$ be smooth strictly positive probability
    densities on $bb(R)^d$, with $q$ log-concave. Suppose
$ H_0 = H \( p divides q \) < oo \, wide w = D log \( p \/ q \) \, wide I = bb(E)_p \| w \|^2 < oo \, wide
  bb(E)_p e^(c \| Y \|^2) < oo $

 for some $c > 0$, where $Y tilde.op p$. Let $G$ be a standard Gaussian vector independent of $Y$.
   For $r > 0$, let $U_r = Y + sqrt(r) G$, let $p_r$ and $q_r$ be the Gaussian convolutions of $p$ and $q$,
   and put $macron(w)_r \( U_r \) = bb(E)_p \[ w \( Y \) divides U_r \]$ and $H_r = H \( p_r divides q_r \)$.
   Then, for every $z > 0$,
#[#set math.equation(numbering: n => "(4.9)")
 $ 2 \( H_0 - H_z \) lt.eq integral_0^z bb(E)_p \| macron(w)_r \( U_r \) \|^2 thin d r . $ <eq:prediction-entropy-loss>]

]
] <lem:entropy-loss>

#proof[
  The proof adds weak observations that increase the curvature of the base posterior while losing asymptotically
    no relative entropy. At each step we remove the direction in which the two posterior means differ.
    The retained output means then agree, and we will show that its relative entropy,
    averaged over the retained history, is $O \( delta^2 \)$ for observation strength $delta$.
    Independent copies make the cost of removing these directions vanish after division by the number of copies.
    That last comparison concerns the score residuals after full observations,
    whose conditional independence will be essential.
  We keep the one-copy problem fixed. The three successive limits will be refinement of a finite observation mesh,
    increase of the number of independent copies, and increase of the total additional precision.
    Set $b = 1 \/ z$ and take $N$ independent copies. Write $Y = \( Y_1 \, dots.h \, Y_N \)$ and
    $W = \( w \( Y_1 \) \, dots.h \, w \( Y_N \) \)$; the two possible priors are $p^(⊗ N)$ and $q^(⊗ N)$.
    Expectations in the proof use $p^(⊗ N)$.
  #emph[Additional observations and their entropy cost.] First observe $Z_0 = sqrt(b) Y + G_0$.
    The chain rule says that the remaining posterior relative entropy, averaged over this observation,
    is $N \( H_0 - H_z \)$. Fix $u > 0$ and an integer $m$, and put $delta = u \/ m$.
    For $i = 0 \, dots.h \, m - 1$, let $cal(H)_i$ be the retained history before step $i$.
    Compute the difference of the two posterior means given this history and let $P_i$ be the orthogonal
    projection onto its span; set $P_i = 0$ when the difference vanishes. Retain only
  $ \( 1 - P_i \) Z_(i + 1) \, wide Z_(i + 1) = sqrt(delta) Y + G_(i + 1) \, $
  where all Gaussian noises are independent. The same measurable rule is used under both priors.
    One may choose versions of the posterior means by their integral formulas;
    the positive densities make the rule well defined on all histories of positive probability.
  For each realized retained history the likelihood, as a function of $Y$, is a Gaussian quadratic factor of precision
  #[#set math.equation(numbering: n => "(4.10)")
   $ B = b upright("Id") + delta sum_(i = 0)^(m - 1) \( 1 - P_i \) succ.curly.eq b upright("Id") .
     $ <eq:entropy-loss-precision>]
  There is no extra likelihood factor from the choices of $P_i$:
    each choice was already determined by the retained past. The factor is the same for both priors.
    Thus the posterior base has curvature at least $B$, and the posterior relative score is still $W$.
  We next bound the relative entropy lost in the additional observations.
    Condition on a retained history at one step and put $Q = 1 - P_i$. The projected posterior means agree.
    After subtracting their common mean, let $X_c$ denote either centered projected signal in $"ran" Q$,
    whose dimension is at most $N d$. The base posterior has curvature at least $b upright("Id")$.
    Its centered linear moment bound and integration over a Gaussian vector give
  $ bb(E)_q \[ e^(kappa \| X_c \|^2) divides cal(H)_i \] lt.eq \( 1 - 2 kappa \/ b \)^(- N d \/ 2) \, wide
    0 < 2 kappa < b . $
  For the alternative, write $a_i = bb(E)_p \[ Y divides cal(H)_i \]$.
    For any sufficiently small $kappa > 0$, conditional Jensen gives
  $ bb(E)_p \[ e^(kappa \| Q \( Y - a_i \) \|^2) divides cal(H)_i \] & lt.eq
    e^(2 kappa \| a_i \|^2) bb(E)_p \[ e^(2 kappa \| Y \|^2) divides cal(H)_i \]\
 & lt.eq #scale(x: 120%, y: 120%)[\(] bb(E)_p \[ e^(2 kappa \| Y \|^2) divides cal(H)_i \]
   #scale(x: 120%, y: 120%)[\)]^2 . $
  Squaring and applying conditional Jensen once more shows that its square, averaged over $cal(H)_i$,
    is bounded by $bb(E)_p e^(8 kappa \| Y \|^2) < oo$. These bounds hold for every history sigma-field,
    so their constants do not depend on the mesh or on the adaptive choices.
  Let $h_p \, h_q$ be the output densities of $sqrt(delta) X_c +
    G$ in $"ran" Q$ and let $phi.alt$ be standard Gaussian density there. Centering and Jensen give the pointwise bound
  $ frac(h_q \( x \), phi.alt \( x \)) = bb(E)_q e^(sqrt(delta) x dot.op X_c - delta \| X_c \|^2 \/ 2) gt.eq
    e^(- delta N d \/ \( 2 b \)) . $
  For either conditional signal, using a conditionally independent copy $X'_c$ and integrating the Gaussian kernel gives
  $ ∥h / phi.alt - 1∥_(L^2 \( phi.alt \))^2 = bb(E) \[ e^(delta X_c dot.op X'_c) divides cal(H)_i \] - 1 . $
  The linear term vanishes because $X_c$ is centered. The bound $\| e^t - 1 - t \| lt.eq t^2 e^(\| t \|) \/ 2$,
    followed by $\| X_c dot.op X'_c \| lt.eq \( \| X_c \|^2 + \| X'_c \|^2 \) \/ 2$,
    bounds the last expression by $C delta^2$ times the square of a small conditional exponential-square moment.
    The preceding moment bounds therefore give
  $ bb(E) H \( h_p divides h_q \) lt.eq bb(E) chi^2 \( h_p divides h_q \) lt.eq
    2 e^(delta N d \/ \( 2 b \)) bb(E) (∥h_p \/ phi.alt - 1∥_2^2 + ∥h_q \/ phi.alt - 1∥_2^2) lt.eq
    C_(N \, b \, p) delta^2 . $
  This statement includes the zero-dimensional observed subspace, for which the loss is zero.
    Summing the $m$ steps loses $O_(N \, b \, p) \( u delta \)$ entropy.
    Apply the anisotropic curvature inequality, Lemma 3, to the final posterior pair. For fixed $N$ and $u$ we obtain
  #[#set math.equation(numbering: n => "(4.11)")
   $ 2 N \( H_0 - H_z \) - o_(delta arrow.b 0) \( 1 \) lt.eq bb(E) W^(*) B^(- 1) W . $ <eq:entropy-loss-posterior-lsi>]
  #emph[Comparison with full observations.] We now estimate the effect of the rank-one exclusions.
    Work in the Hilbert space of square-integrable vector fields on the signal and all the full observations
    $Z_0 \, dots.h \, Z_m$. In particular, $parallel W parallel_2^2 = N I$. Completing the square pointwise gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ b parallel W parallel_2^2 - b^2 bb(E) W^(*) B^(- 1) W = min_v {b parallel W - v parallel_2^2 +
     delta sum_(i = 0)^(m - 1) parallel \( 1 - P_i \) v parallel_2^2} . $ <eq:entropy-loss-variational>]
  Its minimizer is $v_(*) = b B^(- 1) W$, so $parallel v_(*) parallel_2 lt.eq parallel W parallel_2$.
    Let $cal(F)_i = sigma \( Z_0 \, dots.h \, Z_i \)$ and let $e_i$ be conditional expectation onto $cal(F)_i$.
    The sigma-fields are nested, and $P_i$ is $cal(F)_i$-measurable because the retained history is a function of
    this full history. We compare the original minimum with one that penalizes the part of $v$ left unpredicted by
    the full observations: replace $1 - P_i$ by $1 - e_i$, and denote the resulting minimum by $M_0$.
    The nested projections make this new minimum explicitly computable in terms of Gaussian prediction.
    We first find its minimizer, then use its residuals in a dual test to bound the original minimum below in
    terms of $M_0$. Its minimizer is
  $ v_0 = b (b + delta sum_(i = 0)^(m - 1) \( 1 - e_i \))^(- 1) W . $
  Here is its explicit form. Set $alpha_k = b \/ \( b + k delta \)$ for $0 lt.eq k lt.eq m$.
    On $"ran" e_0$ the multiplier is one; on $"ran" \( e_k - e_(k - 1) \)$ it is $alpha_k$;
    on $"ran" \( 1 - e_(m - 1) \)$ it is $alpha_m$. Consequently
  #[#set math.equation(numbering: n => "(4.13)")
   $ v_0 = alpha_m W + sum_(k = 0)^(m - 1) \( alpha_k - alpha_(k + 1) \) e_k W . $ <eq:entropy-loss-minimizer>]
  All coefficients are nonnegative and sum to one. Put $g_i = \( 1 - e_i \) v_0$. Equation (4.13) gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ g_i = alpha_m \( W - e_i W \) + sum_(k = i + 1)^(m - 1) \( alpha_k - alpha_(k + 1) \) \( e_k W - e_i W \) .
     $ <eq:entropy-loss-residual>]
  The weights in this formula sum to $alpha_(i + 1) lt.eq 1$.
  We need a bound uniform over every subdivision. The retained histories need not factor across copies.
    We use independence only for the full observation arrays:
    those belonging to different copies are independent under $p^(⊗ N)$.
    Conditioning on $cal(F)_i$ conditions each such array on its own past.
    Thus $e_k W_j$ depends only on copy $j$’s observations through step $k$.
    Conditional on $cal(F)_i$, the blocks $g_(i \, j)$ are independent and centered,
    even though they involve future full observations. To see this directly,
    factor the joint law into the independent copy arrays and condition each factor on its own past;
    the resulting conditional kernel remains a product. By conditional Jensen applied to Equation (4.14),
  #[#set math.equation(numbering: n => "(4.15)")
   $ Z_(i \, j) := "tr" "Cov" \( g_(i \, j) divides cal(F)_i \) lt.eq
     bb(E) \[ \| W_j - e_i W_j \|^2 divides cal(F)_i \] lt.eq bb(E) \[ \| W_j \|^2 divides cal(F)_i \] .
     $ <eq:entropy-loss-block-bound>]
  For example, every term with $k > i$ is bounded in conditional squared mean by
    $bb(E) \[ \| W_j - e_i W_j \|^2 divides cal(F)_i \]$ by the tower property;
    the nonnegative weights of total at most one preserve this bound.
  The right sides in Equation (4.15) are uniformly integrable over all these sigma-fields.
    Explicitly, if $Z gt.eq 0$ is integrable and $M = bb(E) \[ Z divides cal(F) \]$, then
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(E) \[ M upright(bold(1))_({ M > K }) \] lt.eq 2 bb(E) \[ Z upright(bold(1))_({ Z > K \/ 2 }) \] .
     $ <eq:entropy-loss-ui>]
  Indeed $M lt.eq K \/ 2 + bb(E) \[ Z upright(bold(1))_({ Z > K \/ 2 }) divides cal(F) \]$,
    and on ${ M > K }$ the last conditional expectation is at least $M \/ 2$.
    The conditional covariance of $g_i$ is block diagonal. Since $P_i$ is measurable in $cal(F)_i$ and has rank at
    most one,
  $ bb(E) \| P_i g_i \|^2 lt.eq bb(E) max_(1 lt.eq j lt.eq N) Z_(i \, j) . $
  The maximum is at most $K + sum_j Z_(i \, j) upright(bold(1))_({ Z_(i \, j) > K })$.
    Equations (4.15) and (4.16) show that, uniformly in $i \, m$, and $delta$,
  #[#set math.equation(numbering: n => "(4.17)")
   $ bb(E) \| P_i g_i \|^2 lt.eq N q_N \, wide q_N := inf_(K > 0) {K / N +
     2 bb(E)_p \[ \| w \( Y \) \|^2 upright(bold(1))_({ \| w \( Y \) \|^2 > K \/ 2 }) \]} arrow.r
     0 . $ <eq:entropy-loss-rank-error>]
  No moment of the score beyond its second moment is required.
    In particular this bound permits $P_i$ to depend adaptively on all copies.
  For completeness, the comparison of the two minima follows from a dual test. For every $v$,
  $ parallel \( 1 - P_i \) v parallel_2^2 gt.eq 2 chevron.l v \, \( 1 - P_i \) g_i chevron.r -
    parallel g_i parallel_2^2 . $
  The normal equation for $v_0$ is $b \( W - v_0 \) = delta sum_i g_i$. Therefore the minimum over $v$ of
  $ b parallel W - v parallel_2^2 + 2 delta sum_i chevron.l v \, g_i chevron.r - delta sum_i parallel g_i parallel_2^2 $
  is attained at $v_0$ and equals $M_0$. Use the displayed linear bound at $v_(*)$ in Equation (4.12).
    By Equation (4.17), the true minimum is at least
  #[#set math.equation(numbering: n => "(4.18)")
   $ M_0 - 2 delta sum_i parallel v_(*) parallel_2 parallel P_i g_i parallel_2 gt.eq M_0 -
     2 u N sqrt(I q_N) . $ <eq:entropy-loss-dual-error>]
  #emph[The prediction integral.] It remains to compute $M_0$ and take the limits.
    The same orthogonal decomposition into nested projection increments gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ M_0 / N = sum_(i = 0)^(m - 1) frac(b^2 delta, \( b + i delta \) \( b + \( i + 1 \) delta \))
     (I - parallel e_i W_1 parallel_2^2) . $ <eq:entropy-loss-discrete-minimum>]
  Indeed a component first seen after $j$ increments has penalty $b j delta \/ \( b + j delta \)$, and
  $ frac(b j delta, b + j delta) =
    sum_(i = 0)^(j - 1) frac(b^2 delta, \( b + i delta \) \( b + \( i + 1 \) delta \)) . $
  Full observations through step $i$ have the sufficient Gaussian statistic of precision $b + i delta$.
    Completing the likelihood square proves sufficiency directly. Hence
  $ parallel e_i W_1 parallel_2^2 =
    bb(E)_p \| macron(w)_(1 \/ \( b + i delta \)) \( U_(1 \/ \( b + i delta \)) \) \|^2 . $
  This squared prediction norm is nondecreasing with precision,
    since a weaker observation can be obtained by adding independent Gaussian noise.
    It is bounded by $I$, so Equation (4.19) converges as $m arrow.r oo$ to
  $ b^2 integral_0^u
    frac(I - bb(E)_p \| macron(w)_(1 \/ \( b + t \)) \( U_(1 \/ \( b + t \)) \) \|^2, \( b + t \)^2) thin d t . $
  First take this mesh limit at fixed $N \, u$. It removes the entropy error in Equation (4.11),
    while Equation (4.18) remains uniform in the mesh. Divide by $N$, then let $N arrow.r oo$, using $q_N arrow.r
    0$. Equations (4.11) and (4.12) give
  $ 2 \( H_0 - H_z \) lt.eq I / b -
    integral_0^u frac(I - bb(E)_p \| macron(w)_(1 \/ \( b + t \)) \( U_(1 \/ \( b + t \)) \) \|^2, \( b + t \)^2)
    thin d t = frac(I, b + u) + integral_(1 \/ \( b + u \))^(1 \/ b) bb(E)_p \| macron(w)_r \( U_r \) \|^2 thin d r . $
  Finally let $u arrow.r oo$. Since $1 \/ b = z$ and the integrand is bounded by $I$,
    this proves Equation (4.9) in the claimed order of limits. ◻
]

We return to the critical sequence. For $Y_0 tilde.op eta$ and independent Gaussian noise, define

$ U_r = Y_0 + sqrt(r) G \, wide macron(w)_r \( U_r \) = bb(E) \[ w \( Y_0 \) divides U_r \] \, wide m \( r \) =
  I^(- 1) bb(E) \| macron(w)_r \( U_r \) \|^2 . $

In the strict case we also use the label $L_T$ of Lemma 16,
  constructed with fresh Gaussian noise independent of $\( Y_0 \, G \)$.
  Thus $L_T$ and $U_r$ are conditionally independent given $Y_0$. Set

$ p_T \( r \) = I^(- 1) bb(E) \| bb(E) \[ w \( Y_0 \) divides U_r \, L_T \] \|^2 \, wide p_0 \( r \) = m \( r \) . $

#thm([Proposition 4.3.])[
  (The prediction curve).  #emph[For the strict and gap critical sequences, for every fixed $0 < r < 1 \/ 4$,
#[#set math.equation(numbering: n => "(4.20)")
 $ m \( r \) arrow.r e^(- r) . $ <eq:prediction-curve>]

 In the strict case, for every fixed finite $T gt.eq 0$ one also has $p_T \( r \) arrow.r e^(- r)$.
   In the gap case the eigenfunction may be rescaled so that $I arrow.r 0$,
   without changing Equation (4.20) or Equation (4.1).]
] <prop:prediction>

#proof[
  For $0 lt.eq r < 1 \/ 4$ put
  $ theta \( r \) = exp (- integral_0^r frac(d t, R_(s + t))) . $
  Proposition 14 gives $theta \( r \) = e^(- r) + o \( 1 \)$, uniformly on compact intervals under consideration.
    The common heat flow dissipates relative entropy at one half the relative Fisher information.
    Thus its entropy relative to $mu_(s + r)$ is at most $theta \( r \)$ times its initial entropy,
    by the logarithmic Sobolev inequality at the contemporaneous base law.
    This assertion applies to conditional laws after averaging as well.
  In the strict case write $H_r = H \( "Law" \( U_r \) divides mu_(s + r) \)$ and $H_0 = I \/ \( 2 lambda \)$.
    The entropy of $U_r$ given $L_T$, relative to $mu_(s + r)$ and averaged over the label,
    is at most $theta \( r \) \( H_0 + T I \/ 2 \)$, since initially it is $H_0 + sans(I) \( Y_0 \; L_T \)$.
    The chain rule gives
  $ I / 2 integral_0^T p_v \( r \) thin d v & = bb(E) H \( "Law" \( L_T divides U_r \) divides gamma \)\
 & = bb(E) H \( "Law" \( U_r divides L_T \) divides mu_(s + r) \) + d \( T \) - H_r\
 & lt.eq I / 2 theta \( r \) \( 1 \/ lambda + T \) + d \( T \) . $
  The first equality is Lemma 6, conditionally on $U_r$. Fix $v gt.eq 0$ and then $T > v$.
    Since $p_t \( r \)$ is nondecreasing in signal strength $t$, Lemma 16 yields
  $ \( T - v \) limsup p_v \( r \) lt.eq e^(- r) \( 1 + T \) . $
  The sequence limit is taken with $T$ fixed. Allowing this fixed $T$ to be arbitrarily large proves
  #[#set math.equation(numbering: n => "(4.21)")
   $ limsup p_v \( r \) lt.eq e^(- r) . $ <eq:prediction-upper>]
  Lemma 17 applies to $p = eta$ and $q = mu_s$; the exponential-square moment was proved in the proof of Lemma 16.
    Since $H_z lt.eq theta \( z \) H_0$, it gives
  $ integral_0^z m \( r \) thin d r gt.eq frac(1 - theta \( z \), lambda) wide \( 0 < z < 1 \/ 4 \) . $
  The reverse limiting inequality follows from Equation (4.21), $0 lt.eq m lt.eq 1$, and reverse Fatou. Hence
  #[#set math.equation(numbering: n => "(4.22)")
   $ integral_0^z m \( r \) thin d r arrow.r 1 - e^(- z) . $ <eq:prediction-integral>]
  The function $m$ is nonincreasing in $r$. For $0 < h < r$ with $r + h < 1 \/ 4$,
    its value at $r$ is bounded below and above by its averages on $\[ r \, r + h \]$ and $\[ r - h \, r \]$,
    respectively. Equation (4.22) determines the limits of both averages;
    letting $h arrow.b 0$ gives Equation (4.20). Finally $m \( r \) lt.eq
    p_T \( r \)$ and Equation (4.21) give the assertion for every fixed $T$.
  We now prove the gap assertion without using additional probes. First linearize Lemma 17.
    Let $q$ be a bounded smooth centered test under $mu_s$, with bounded gradient, and let
  $ d eta_epsilon = \( 1 + epsilon q \) thin d mu_s \, wide \| epsilon \| parallel q parallel_oo < 1 . $
  This alternative has a finite exponential-square moment. Write $macron(q)_r =
    bb(E)_(mu_s) \[ q \( Y_0 \) divides U_r \]$ and $overline(D q)_r =
    bb(E)_(mu_s) \[ D q \( Y_0 \) divides U_r \]$. The output density ratio is $1 + epsilon macron(q)_r$,
    while the predicted initial relative score is exactly
  $ bb(E)_(eta_epsilon) \[ D log \( 1 + epsilon q \) \( Y_0 \) divides U_r \] =
    frac(epsilon overline(D q)_r, 1 + epsilon macron(q)_r) . $
  Consequently its squared norm averaged under the alternative output is $epsilon^2
    bb(E)_(mu_(s + r)) \[ \| overline(D q)_r \|^2 \/ \( 1 + epsilon macron(q)_r \) \]$.
    The entropy expansion $H \( \( 1 + epsilon q \) mu_s divides mu_s \) =
    epsilon^2 parallel q parallel_2^2 \/ 2 + o \( epsilon^2 \)$, and its output version, now give
  #[#set math.equation(numbering: n => "(4.23)")
   $ parallel q parallel_2^2 - parallel macron(q)_z parallel_2^2 lt.eq
     integral_0^z parallel overline(D q)_r parallel_2^2 thin d r . $ <eq:prediction-linearized-loss>]
  Indeed the denominator is bounded away from zero uniformly in $r$,
    and conditional Jensen bounds the integrand by a constant times $parallel D q parallel_2^2$,
    justifying the limit. Approximation in the form norm extends Equation (4.23) to $q = phi$:
    centered compact smooth approximants have the required boundedness,
    and all conditional expectation maps are $L^2$ contractions.
    To retain compact support while centering, subtract the approximant’s mean times one fixed compact smooth
    function of mean one; this correction tends to zero in the form norm.
  For clarity, we also give the heat variance identity used here.
    For a centered scalar or finite-dimensional vector field $g in L^2 \( mu_s \)$, let $g_r =
    bb(E) \[ g \( Y_0 \) divides U_r \]$ under the base law. Then
  #[#set math.equation(numbering: n => "(4.24)")
   $ frac(d, d r) bb(E)_(mu_(s + r)) \| g_r \|^2 = - bb(E)_(mu_(s + r)) \| D g_r \|^2 . $ <eq:prediction-heat-variance>]
  For bounded $g$, both the numerator density $g_r mu_(s + r)$ and the denominator density $mu_(s + r)$ solve the
    heat equation, and the quotient calculation with the square function gives
    $\( partial_r - Delta \/ 2 \) \( mu_(s + r) \| g_r \|^2 \) = - mu_(s + r) \| D g_r \|^2$.
    Integrate against expanding cutoffs, whose Laplacians tend uniformly to zero.
    The bound $\| g_r \| lt.eq parallel g parallel_oo$ removes the cutoff terms and gives the integrated identity
    on positive time intervals. Its initial endpoint follows from $parallel g_r \( U_r \) -
    g \( Y_0 \) parallel_2 arrow.r 0$: for a bounded continuous test use $g \( U_r \)$ as a predictor and
    dominated convergence under the coupling $U_r = Y_0 + sqrt(r) G$,
    and then approximate in $L^2 \( mu_s \)$ and use conditional contraction.
    Approximate a general $L^2$ field by bounded ones. Applying the same identity to their differences shows that
    their gradients are Cauchy in the space-time energy norm,
    while conditional contraction gives convergence of both endpoint norms.
    This proves the integrated version of Equation (4.24) in full generality.
  Poincaré at $mu_(s + r)$ and preservation of the mean therefore imply
  $ bb(E)_(mu_(s + r)) \| g_r \|^2 lt.eq theta \( r \) bb(E)_(mu_s) \| g \|^2 . $
  Apply this first to $phi$, and then to $w - bb(E) w$. The latter application and Equation (4.1) give $m \( r \)
    lt.eq theta \( r \) + o \( 1 \)$. The former and $parallel phi parallel_2^2 = I \/ lambda$,
    inserted into Equation (4.23), give $integral_0^z m \( r \) thin d r gt.eq \( 1 - theta \( z \) \) \/ lambda$.
    The same integral squeeze and monotonicity argument prove Equation (4.20).
    Multiplying $phi$ by any positive scalar multiplies every squared quantity by its square,
    so we may finally choose these scalars to arrange $I arrow.r 0$. ◻
]

The hierarchy construction will use the following consequences of the prediction curve.
  The estimates distinguish conditional covariance tails, which are needed only in the strict case,
  from bounds on deterministic subspaces, which hold in both cases.

#thm([Lemma 4.4.])[
  (Posterior covariance and outlier subspaces).  #emph[Use the critical sequence and notation of Proposition 18,
    with $I arrow.r 0$ in the gap case. The following assertions hold.]
  + #emph[For every fixed $c < oo$, uniformly over deterministic orthogonal projections $Pi$ with $"rank" Pi lt.eq c I$,
#[#set math.equation(numbering: n => "(4.25)")
 $ bb(E) \| Pi w \|^2 = o \( I \) . $ <eq:prediction-small-subspaces>]

]
  + #emph[For every $epsilon.alt > 0$, for all sufficiently far members of the sequence there is a deterministic
    subspace $V_epsilon.alt$ of dimension at most $C_epsilon.alt I$ such that, for every $v perp V_epsilon.alt$,
#[#set math.equation(numbering: n => "(4.26)")
 $ v^(*) \( bb(E) w w^(*) \) v lt.eq epsilon.alt \| v \|^2 \, wide v^(*) \( bb(E) b_s b_s^(*) \) v lt.eq
   epsilon.alt \| v \|^2 \, wide v^(*) \( bb(E) M_s \) v lt.eq
   epsilon.alt \| v \|^2 . $ <eq:prediction-outlier-subspaces>]

 In the gap case $V_epsilon.alt$ may be taken to be zero, and $parallel bb(E) b_s b_s^(*)
   parallel_(upright("op")) + parallel bb(E) M_s parallel_(upright("op")) = o \( 1 \)$.]
  + #emph[In the strict case, for every fixed $r in \( 0 \, 1 \/ 4 \)$ and $epsilon.alt > 0$,
    the conditional covariance $C_r = "Cov" \( w \( Y_0 \) divides U_r \)$ satisfies
#[#set math.equation(numbering: n => "(4.27)")
 $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] C_r upright(bold(1))_({ C_r > epsilon.alt upright("Id") })
   #scale(x: 120%, y: 120%)[\)] = o \( I \) . $ <eq:conditional-tail>]

 The indicator denotes the spectral projection. No assertion about additional Gaussian probes or Equation (4.27)
   is needed for the gap case.]
] <lem:posterior-outliers>

#proof[
  We first prove the strict-case spectral estimates. If a random vector $S$ has covariance $C$ and mean $a$,
    the affine estimator
  $ a + C \( upright("Id") + C \)^(- 1) \( S + G - a \) $
  of $S$ from $S + G$ is its least-squares affine predictor.
    Its mean squared norm is $\| a \|^2 + "tr" \( C^2 \( upright("Id") + C \)^(- 1) \)$,
    by direct expansion of the covariances. Conditional expectation has at least this squared norm,
    because it is the orthogonal projection onto all functions of the observation.
    The same calculation holds conditionally on any side information, using fresh independent Gaussian noise.
  By the Gaussian signal derivative formula and its monotonicity,
  $ bb(E) \| bb(E) \[ w divides L_1 \] \|^2 lt.eq 2 #scale(x: 120%, y: 120%)[\(] d \( 2 \) -
    d \( 1 \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 d \( 2 \) = o \( I \) . $
  Apply the affine prediction bound to $S = w$ and $C = "Cov"_eta w$. For every fixed $epsilon.alt > 0$,
  #[#set math.equation(numbering: n => "(4.28)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] C upright(bold(1))_({ C > epsilon.alt upright("Id") })
     #scale(x: 120%, y: 120%)[\)] = o \( I \) \, $ <eq:prediction-unconditional-tail>]
  since $t^2 \/ \( 1 + t \) gt.eq epsilon.alt t \/ \( 1 + epsilon.alt \)$ for $t > epsilon.alt$.
    For every projection of rank at most $c I$,
  $ bb(E) \| Pi w \|^2 lt.eq epsilon.alt c I + "tr" #scale(x: 120%, y: 120%)[\(] C
    upright(bold(1))_({ C > epsilon.alt upright("Id") }) #scale(x: 120%, y: 120%)[\)] + \| bb(E) w \|^2 . $
  First take the sequence limit, then $epsilon.alt arrow.b 0$.
    Equation (4.1) proves Equation (4.25) uniformly in $Pi$. In the gap case a projection of rank at most $c
    I$ is eventually zero, which proves the same assertion.
  Conditionally on $U_r$, the additional observation $L_1$ has signal $w$ and covariance $C_r$.
    Orthogonality of successive conditional expectations and the conditional affine prediction bound yield
  $ I #scale(x: 120%, y: 120%)[\(] p_1 \( r \) - m \( r \) #scale(x: 120%, y: 120%)[\)] gt.eq
    bb(E) "tr" #scale(x: 120%, y: 120%)[\(] C_r^2 \( upright("Id") + C_r \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  Proposition 18 makes the left side $o \( I \)$. The same scalar eigenvalue inequality proves Equation (4.27).
  We finally bound the dimensions of the deterministic outlier spaces. Let
  $ D = bb(E)_eta bb(E) \[ X X^(*) divides X + sqrt(s) G = Y_0 \] \, $
  where the inner posterior kernel always refers to the original prior $mu$.
    Conditional Jensen and the definition of $M_s$ imply
  #[#set math.equation(numbering: n => "(4.29)")
   $ bb(E)_eta b_s b_s^(*) prec.curly.eq D \, wide bb(E)_eta M_s prec.curly.eq D \/ s .
     $ <eq:prediction-posterior-domination>]
  For each deterministic projection $Q$ of rank $l gt.eq 1$, the original subgaussian assumption gives
  #[#set math.equation(numbering: n => "(4.30)")
   $ log bb(E)_mu exp (frac(\| Q X \|^2, C a^2)) lt.eq C l . $ <eq:prediction-subspace-moment>]
  Indeed choose a $1 \/ 2$-net of the unit sphere in $"ran" Q$ with at most $5^l$ points.
    The norm $\| Q X \|$ is at most twice the largest absolute linear form over this net,
    and bounding the exponential of a maximum by the sum proves the claim.
  In the strict case, form the joint law by first drawing $Y_0$ from $eta$ and then drawing $X$ from the original
    posterior kernel. Its entropy relative to the original joint law of $\( X \, X + sqrt(s) G \)$ is exactly
    $H_0 = I \/ \( 2 lambda \)$. Data processing therefore bounds the entropy of its $X$-marginal relative to $mu$
    by $H_0$. Applying the entropy variational inequality to Equation (4.30) gives
  #[#set math.equation(numbering: n => "(4.31)")
   $ "tr" \( Q D \) lt.eq C a^2 \( H_0 + l \) . $ <eq:prediction-posterior-trace>]
  If the spectral subspace of $D$ above $tau > 0$ has dimension $l$, then $tau l lt.eq C a^2 \( H_0 + l \)$.
    For sufficiently small $a$ this implies $l lt.eq 2 C a^2 H_0 \/ tau = O_tau \( I \)$;
    the assertion is trivial when $l = 0$. The spectral subspace of $bb(E) w
    w^(*)$ above $epsilon.alt$ has dimension at most $I \/ epsilon.alt$, since its trace is $I$.
    Take $V_epsilon.alt$ to be the span of this subspace and the spectral subspace of $D$ above $s epsilon.alt$.
    Its dimension is at most $C_epsilon.alt I$, and Equation (4.29) gives all three bounds in Equation (4.26).
  In the gap case, averaging the original posterior under $eta = mu_s$ gives $D =
    bb(E)_mu X X^(*) prec.curly.eq C a^2 upright("Id")$. Thus Equation (4.29) gives the two claimed operator
    bounds directly. Also $parallel bb(E) w w^(*) parallel_(upright("op")) lt.eq I arrow.r 0$, so $V_epsilon.alt =
    { 0 }$ suffices eventually. This completes all assertions. ◻
]

== 5 A symmetric hierarchy of nearly first eigenfunctions <sec:hierarchy>

The prediction curve from Section 4 determines much more than the norm of a conditional mean.
  Its Gaussian Bessel inequality is asymptotically saturated at every fixed derivative order.
  We use this saturation to construct symmetric tensors whose derivatives remain nearly first eigenfunctions.
  We then show that every tensor has negligible energy in the curvature directions of $mu_s$.
  Throughout this section, coefficient norms are unnormalized Euclidean norms, including for tensors of high order.

For a tensor field with $d$ slots, differentiation appends a last slot.
  A matrix subscript, such as $K_1$, specifies the slot on which it acts.
  Write $parallel F parallel_2^2 = bb(E)_eta \| F \|^2$ and $chevron.l F \, G chevron.r_2 =
  bb(E)_eta chevron.l F \, G chevron.r$. Every occurrence of $A$ on a tensor means its componentwise action.
  The following formulation records precisely the inputs used in the construction;
  the dimension and $I$ may vary along the sequence.

#thm([Proposition 5.1.])[
  (Symmetric tensor hierarchy).  #emph[Consider a sequence of smooth positive probability densities $eta$ on
    finite-dimensional Euclidean spaces, with finite second moments.
    Let $A = - Delta - D log eta dot.op D$, and suppose that $eta$ satisfies Poincaré with constant at most
    $lambda^(- 1)$, where $lambda arrow.r 1$. Fix $s = 1 \/ 8$.
    Suppose smooth vector fields $b \, w$ and a symmetric matrix field $K$ satisfy
$ D log eta = - frac(y - b \( y \), s) + omega \( y \) \, wide D b = upright("Id") - s K \, wide 0 lt.eq K lt.eq
  s^(- 1) upright("Id") \, $

 where either $omega = w$ throughout the sequence or $omega = 0$ throughout the sequence.
   Assume $b \, w in L^2 \( eta \)$, $w$ is a gradient, and, with $I = parallel w parallel_2^2 > 0$,
#[#set math.equation(numbering: n => "(5.1)")
 $ w in "Dom" A \, wide parallel \( A - 1 \) w parallel_2 = o \( sqrt(I) \) \, wide \| bb(E)_eta w \| =
   o \( sqrt(I) \) \, wide chevron.l w \, K w chevron.r_2 = o \( I \) . $ <eq:hierarchy-initial>]

 Assume also the following prediction and projection properties.]
  + #emph[For $Y tilde.op eta$ and an independent standard Gaussian $G$, set
$ U_r = Y + sqrt(r) thin G \, quad h_r \( u \) = bb(E) \[ w \( Y \) divides U_r = u \] \, quad m \( r \) =
  I^(- 1) bb(E) \| h_r \( U_r \) \|^2 . $

 For every fixed $0 < r < 1 \/ 4$, one has $m \( r \) arrow.r e^(- r)$.]
  + #emph[For every fixed $c < oo$,
#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(Pi^2 = Pi = Pi^(*) med upright("deterministic")\
"rank" Pi lt.eq c I) parallel Pi w parallel_2^2 = o \( I \) . $ <eq:hierarchy-input-projection>]

 For every $epsilon.alt > 0$ there is a deterministic projection $Pi_epsilon.alt$ of rank at most $C_epsilon.alt
   I$ such that
#[#set math.equation(numbering: n => "(5.3)")
 $ ∥bb(E) \[ \( 1 - Pi_epsilon.alt \) b b^(*) \( 1 - Pi_epsilon.alt \) \]∥_(upright("op")) + ∥bb(E) \[ \( 1 -
   Pi_epsilon.alt \) omega omega^(*) \( 1 - Pi_epsilon.alt \) \]∥_(upright("op")) lt.eq
   epsilon.alt $ <eq:hierarchy-input-outliers>]

 eventually along the sequence.]
  + #emph[If $omega = w$, the conditional covariance $C_r = "Cov" \( w \( Y \) divides U_r \)$ satisfies,
    for every fixed $r in \( 0 \, 1 \/ 4 \)$ and $a > 0$,
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] C_r upright(bold(1))_({ C_r > a }) #scale(x: 120%, y: 120%)[\)] =
   o \( I \) . $ <eq:hierarchy-input-tail>]

 No conditional covariance-tail assumption is made when $omega = 0$.]
  #emph[Then there are totally symmetric tensor fields $T_l$ of order $l + 1$, for every fixed integer $l gt.eq
    0$, with $T_0 = w$, such that
#[#set math.equation(numbering: n => "(5.5)")
 $ parallel T_l parallel_2^2 = \( 1 + o \( 1 \) \) I \, wide parallel \( A - 1 \) T_l parallel_2 = o \( sqrt(I) \) \,\
parallel D T_l - T_(l + 1) parallel_2 = o \( sqrt(I) \) . $ <eq:hierarchy-eigen>]

#[#set math.equation(numbering: n => "(5.6)")
 $ chevron.l T_l \, K_1 T_l chevron.r_2 = o \( I \) . $ <eq:hierarchy-curvature>]

#[#set math.equation(numbering: n => "(5.7)")
 $ sup_(Pi^2 = Pi = Pi^(*) med upright("deterministic")\
"rank" Pi lt.eq c I) parallel Pi_1 T_l parallel_2^2 = o \( I \) wide
  upright("for every fixed ") c < oo . $ <eq:hierarchy-projection>]

 Every $T_l$ belongs componentwise to $"Dom" A$. For $l gt.eq 1$ it can be chosen in $⋂_(p gt.eq 1) "Dom" A^p$.
   By symmetry, the specified slot in Equations (5.6) and (5.7) may be any slot.
   All assertions can be made simultaneous for any fixed finite collection of levels and parameters.]
] <prop:hierarchy>

In the application, take $b = b_s$ and $K = K_s$. Proposition 15 supplies the drift, Poincaré,
  and initial estimates; Proposition 18 and Lemma 19 supply the remaining inputs.
  In the gap branch, $omega = 0$ and $parallel bb(E) b b^(*) parallel_(upright("op")) = o \( 1 \)$,
  so one may take $Pi_epsilon.alt = 0$ in Equation (5.3). The normalization $I arrow.r
  0$ makes Equation (5.2) automatic: eventually the only projection of rank at most $c I$ is zero.
  Thus no strict-branch probe estimate has been added to the gap-branch hypotheses.

We prove the proposition in three steps. First we construct the eigenfunction and derivative hierarchy.
  Second we expand its evolution along stationary diffusion and, in the strict branch,
  deduce operator-norm tail estimates. Finally those estimates justify a curvature integration by parts.

=== 5.1 Gaussian Bessel saturation and the induction <gaussian-bessel-saturation-and-the-induction>

We use the classical correspondence between Hermite polynomials and multiple Wiener integrals
  #cite(label("Ito1951")) Sections 3–5, with the ordered-index normalization recorded below.
  The saturation argument will come from the prediction curve, in addition to this orthogonality.

For a standard Gaussian vector $G in bb(R)^n$, define its symmetric Hermite tensors $frak(h)_j \( G \)$ by

#[#set math.equation(numbering: n => "(5.8)")
 $ e^(xi dot.op G - \| xi \|^2 \/ 2) = sum_(j gt.eq 0) frac(1, j !) thin frak(h)_j \( G \) :
   xi^(⊗ j) . $ <eq:hierarchy-hermite-definition>]

Here a colon contracts all indicated slots and $frak(h)_0 = 1$.
  Comparing coefficients in the expectation of the product of two such exponentials gives,
  for symmetric order-$j$ and order-$k$ tensors $a \, b$,

#[#set math.equation(numbering: n => "(5.9)")
 $ bb(E) \[ \( a : frak(h)_j \( G \) \) \( b : frak(h)_k \( G \) \) \] =
   upright(bold(1))_({ j = k }) j ! chevron.l a \, b chevron.r . $ <eq:hierarchy-hermite-isometry>]

This identity uses ordered coefficient indices; it explains all factorials below.

#thm([Lemma 5.2.])[
  (Bessel inequality for the prediction).  #emph[For the data of Proposition 20, define $g_r \( y \) =
    bb(E)_G h_r \( y + sqrt(r) thin G \)$. For each $r > 0$,
#[#set math.equation(numbering: n => "(5.10)")
 $ chevron.l w \, g_r chevron.r_2 = m \( r \) I \, wide sum_(j gt.eq 0) frac(r^j, j !) parallel D^j g_r
   parallel_2^2 lt.eq m \( r \) I . $ <eq:hierarchy-bessel>]

 In particular, every fixed derivative appearing here is in the form domain of $A$.]
] <lem:hierarchy-bessel>

#proof[
  The first equality is conditional expectation:
  $ bb(E) chevron.l w \( Y \) \, h_r \( U_r \) chevron.r = bb(E) \| h_r \( U_r \) \|^2 . $
  For fixed $y$, Gaussian integration by parts identifies the order-$j$ Hermite coefficient of
    $h_r \( y + sqrt(r) thin G \)$ as $r^(j \/ 2) D^j g_r \( y \)$. Its orthogonal projection onto that chaos is
  $ frac(r^(j \/ 2), j !) D^j g_r \( y \) : frak(h)_j \( G \) \, $
  where the vector output slot is not contracted. By Equation (5.9),
    the squared norm of this projection is $r^j \| D^j g_r \( y \) \|^2 \/ j !$.
    Bessel’s inequality, integrated in $y tilde.op eta$, proves the asserted sum.
  These calculations require only $bb(E) \| h_r \( Y + sqrt(r) G \) \|^2 < oo$.
    To justify the derivatives, on a compact set of starting points use positivity of $eta$ on a slightly larger
    compact set. Integrating translated Gaussian kernels over that larger set bounds each fixed differentiated
    kernel by a constant times the mixture density of $U_r$. The enlargement absorbs the polynomial factors from
    differentiation. Thus the kernel integrals are classically smooth locally;
    alternatively all identities first hold distributionally.
    The Bessel bounds for orders $j$ and $j + 1$ put $D^j g_r$ and its weak derivative in $L^2 \( eta \)$,
    hence in the form domain by cutoff and local smoothing. The local constants need not be uniform in the
    dimension: only the exact integrated Bessel inequality is used quantitatively. ◻
]

Two elementary Hilbert-space facts will prevent dimension factors and unjustified differentiations in the induction.

#thm([Lemma 5.3.])[
  (Cross-covariance and spectral smoothing).  #emph[If $F$ is a square-integrable random variable with values in a
    finite-dimensional Hilbert space and $Z$ is a centered Euclidean random vector with $"Cov" Z lt.eq
    c upright("Id")$, then
#[#set math.equation(numbering: n => "(5.11)")
 $ \| bb(E) \( F ⊗ Z \) \|_(upright("HS"))^2 lt.eq c bb(E) \| F \|^2 . $ <eq:hierarchy-crosscov>]

 Next, let $A$ be a sequence of nonnegative Dirichlet operators with kernel the constants and spectral gap at
   least $lambda arrow.r 1$. If fields $S$ in their form domains satisfy
$ \| bb(E) S \|^2 = o \( I \) \, wide parallel S parallel_2^2 = \( 1 + o \( 1 \) \) I \, wide
  parallel D S parallel_2^2 lt.eq \( 1 + o \( 1 \) \) I \, $

 then $tilde(S) = e^(1 - A) S$ satisfies
#[#set math.equation(numbering: n => "(5.12)")
 $ parallel tilde(S) - S parallel_2 + parallel D \( tilde(S) - S \) parallel_2 = o \( sqrt(I) \) \, wide
   parallel \( A - 1 \) tilde(S) parallel_2 = o \( sqrt(I) \) . $ <eq:hierarchy-smoothing>]

]
] <lem:hierarchy-smoothing>

#proof[
  The map $u mapsto u dot.op Z$ from Euclidean space to scalar $L^2$ has operator norm at most $sqrt(c)$.
    Apply its adjoint to each scalar coefficient of $F$ and sum the squared bounds.
    This proves Equation (5.11) without a factor equal to the number of coordinates of either variable.
  For the second assertion, sum the coefficient spectral measures of $S -
    bb(E) S$ and call the resulting measure $nu$. Then
  $ integral \( x - lambda \) thin d nu \( x \) = parallel D S parallel_2^2 - lambda parallel S -
    bb(E) S parallel_2^2 = o \( I \) \, $
  where the left side is nonnegative. For every fixed $delta > 0$,
    the spectral mass and the spectral energy outside $\[ 1 - delta \, 1 + delta \]$ are $o \( I \)$:
    the part below $1 - delta$ is absent eventually, and on $x gt.eq 1 +
    delta$ both $1$ and $x$ are bounded by a $delta$-dependent constant times $x - lambda$.
    The constant component has squared norm $o \( I \)$ as well.
  On the remaining interval the multipliers $e^(1 - x) - 1$ and $\( x - 1 \)
    e^(1 - x)$ tend uniformly to zero as $delta arrow.b 0$. Outside it, $\( 1 + x \) \| e^(1 - x) - 1 \|^2 lt.eq
    C \( 1 + x \)$ and $\( x - 1 \)^2 e^(2 - 2 x) lt.eq C$. Integrate these inequalities against the spectral
    measure, first take the sequence limit and then let $delta arrow.b 0$. This gives Equation (5.12).
    The same functional calculus shows that $e^(1 - A) S$ belongs to every $"Dom" A^p$. ◻
]

#thm([Lemma 5.4.])[
  (Construction before the curvature estimate).  #emph[Under the hypotheses of Proposition 20,
    there exist totally symmetric fields $T_l$ satisfying Equations (5.5) and (5.7),
    with the stated operator domains. Moreover $\| bb(E) T_l \| = o \( sqrt(I) \)$ for every fixed $l$.]
] <lem:hierarchy-construction>

#proof[
  Start with $T_0 = w$. Suppose the assertions have been constructed through level $l$, and put $L = l +
    1$ and $V = D T_l$. Self-adjointness gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ parallel V parallel_2^2 = chevron.l T_l \, A T_l chevron.r_2 = \( 1 + o \( 1 \) \) I .
     $ <eq:hierarchy-raw-derivative>]
  If $Pi$ is an admissible deterministic projection acting on an existing tensor slot,
    it commutes with $A$ and differentiation. Consequently
  $ parallel Pi_1 V parallel_2^2 = chevron.l Pi_1 T_l \, A Pi_1 T_l chevron.r_2 lt.eq
    parallel Pi_1 T_l parallel_2^2 + parallel Pi_1 T_l parallel_2 parallel \( A - 1 \) T_l parallel_2 = o \( I \) . $
  The error is uniform over projections of rank at most $c I$ for fixed $c$.
  Fix $0 < r < 1 \/ 4$. Set $V_j = T_j$ for $0 lt.eq j lt.eq l$ and $V_L = V$.
    Successive form integration by parts gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ I^(- 1) chevron.l D^j g_r \, V_j chevron.r_2 arrow.r e^(- r) wide \( 0 lt.eq j lt.eq L \) .
     $ <eq:hierarchy-correlations>]
  Indeed the assertion at $j = 0$ is Equation (5.10). For $j lt.eq l$,
  $ chevron.l D^(j + 1) g_r \, D T_j chevron.r_2 = chevron.l D^j g_r \, A T_j chevron.r_2 = chevron.l D^j g_r \,
    T_j chevron.r_2 + o \( I \) . $
  Replacing $D T_j$ by $T_(j + 1)$ when $j < l$ costs $o \( I \)$.
    All test derivatives and their form energies are finite by Lemma 21;
    its bound controls every error for fixed $r$ and $j$. No uniform estimate as $r arrow.b 0$ has been used.
  Here is the precise Bessel budget. Equation (5.14) and $parallel V_j parallel_2^2 \/ I arrow.r 1$ imply
  $ liminf I^(- 1) e^(2 r) parallel D^j g_r parallel_2^2 gt.eq 1 wide \( 0 lt.eq j lt.eq L \) . $
  Multiply Equation (5.10) by $e^(2 r) \/ I$ and subtract these minimum contributions. The resulting bounds are
  #[#set math.equation(numbering: n => "(5.15)")
   $ limsup frac(parallel e^r D^L g_r - V parallel_2^2, I) & lt.eq
     frac(L !, r^L) (e^r - sum_(j = 0)^L frac(r^j, j !)) = O_L \( r \) \,\
limsup frac(e^(2 r) parallel D^(L + 1) g_r parallel_2^2, I) & lt.eq
  frac(\( L + 1 \) !, r^(L + 1)) (e^r - sum_(j = 0)^L frac(r^j, j !)) = 1 + O_L \( r \) . $ <eq:hierarchy-budget-error>]
  For the first line, expand the squared difference and use the correlation at order $L$;
    its normalized limit subtracts exactly one from the normalized squared derivative norm.
    Thus the exponential-series tail accounts for the entire excess, rather than merely bounding the norms.
  Choose $r arrow.b 0$ sufficiently slowly along the sequence in these two estimates.
    The field $S_0 = e^r D^L g_r$ then satisfies
  $ parallel S_0 - V parallel_2 = o \( sqrt(I) \) \, wide parallel D S_0 parallel_2^2 lt.eq \( 1 + o \( 1 \) \) I . $
  It is symmetric in its last $L$ slots; $V$ is symmetric in its first $L$ slots.
    For $L gt.eq 2$, the permutations of those two sets of slots generate every permutation of the $L + 1$ slots.
    Indeed their adjacent transpositions together are all the adjacent transpositions.
    If a permutation fixes $S_0$, its action changes $V$ by at most $2 parallel S_0 - V parallel_2$;
    a permutation fixing $V$ costs zero. Expressing each permutation as a fixed finite word therefore shows that
    $V$ is $o \( sqrt(I) \)$ from its full symmetrization. For $L = 1$, $V =
    D w$ is already symmetric because $w$ is a gradient. Let $S$ be the full symmetrization of $S_0$.
    Averaging coefficient permutations is an orthogonal contraction and commutes with differentiation, so
  #[#set math.equation(numbering: n => "(5.16)")
   $ parallel S - V parallel_2 = o \( sqrt(I) \) \, wide parallel S parallel_2^2 = \( 1 + o \( 1 \) \) I \, wide
     parallel D S parallel_2^2 lt.eq \( 1 + o \( 1 \) \) I . $ <eq:hierarchy-symmetric-approximant>]
  The preceding projection estimate for $V$ now holds on its last slot too,
    since a coefficient-slot permutation moves it to an old slot with an $o \( sqrt(I) \)$ error uniform over
    projections.
  To apply Poincaré sharply we still need to center $V$. Write $C_y = "Cov" \( T_l \, y \)$, $C_b =
    "Cov" \( T_l \, b \)$, and $C_omega = "Cov" \( T_l \, omega \)$,
    with the vector variable occupying the last slot. Testing the equation for $A
    T_l$ against centered coordinates gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ bb(E) V = C_y + E_l \, wide \| E_l \| = o \( sqrt(I) \) \, wide bb(E) V = s^(- 1) \( C_y - C_b \) -
     C_omega . $ <eq:hierarchy-two-center-identities>]
  For clarity, the first exact identity before the error is $bb(E) V =
    bb(E) \[ \( A T_l \) ⊗ \( y - bb(E) y \) \]$. Poincaré gives $"Cov"_eta y lt.eq lambda^(- 1) upright("Id")$,
    and Equation (5.11) bounds its error by $lambda^(- 1 \/ 2) parallel \( A - 1 \) T_l parallel_2$.
    This is the needed dimension-free estimate. The second identity follows by integration by parts using $A
    y = \( y - b \) \/ s - omega$. These coordinate tests are legitimate in the form domain;
    their distributional $A$-images are in $L^2$ by the stated second-moment assumptions,
    hence they are also in $"Dom" A$.
  Project the last slot onto $1 - Pi_epsilon.alt$. The two covariance terms involving $b$ and $omega$ have norm at
    most $C sqrt(epsilon.alt I)$ by Equations (5.3) and (5.11).
    Subtracting the two identities in Equation (5.17), and using $s eq.not 1$,
    therefore bounds this part of $bb(E) V$ by $C_s sqrt(epsilon.alt I) + o \( sqrt(I) \)$.
    On the $Pi_epsilon.alt$ part,
  $ \| \( Pi_epsilon.alt \)_(L + 1) bb(E) V \| lt.eq parallel \( Pi_epsilon.alt \)_(L + 1) V parallel_2 =
    o \( sqrt(I) \) $
  by the projected-energy estimate and $"rank" Pi_epsilon.alt lt.eq C_epsilon.alt I$.
    First take the sequence limit and then let $epsilon.alt arrow.b 0$.
    This proves $\| bb(E) V \| = o \( sqrt(I) \)$, and thus $\| bb(E) S \| = o \( sqrt(I) \)$.
  Lemma 22 applies to $S$. Define
  $ T_(l + 1) = e^(1 - A) S . $
  It is symmetric, lies in every operator-power domain, is $o \( sqrt(I) \)$ from $V$,
    and satisfies the strong near-eigenfunction estimate. Its mean is $e bb(E) S = o \( sqrt(I) \)$.
    Finally, coefficient projections commute with the semigroup,
    and $parallel e^(1 - A) parallel_(2 arrow.r 2) lt.eq e$. Together with $S - V = o_(L^2) \( sqrt(I) \)$,
    this preserves the uniform projected-energy estimates. The induction is complete.
    Each step used only a finite collection of limits; diagonal choices give the assertion for all fixed levels. ◻
]

=== 5.2 Expansion along stationary diffusion <expansion-along-stationary-diffusion>

The fields just constructed retain the same norm under repeated differentiation.
  This makes their stochastic Taylor expansion summable with a factorial remainder.
  We use the ordered-integral form of the Wiener–Itô correspondence #cite(label("Ito1951")) Section 5.
  Let $Y_t$ be the stationary diffusion with invariant density $eta$,

$ d Y_t = sqrt(2) thin d B_t + D log eta \( Y_t \) thin d t \, wide Y_0 tilde.op eta \, $

where $Y_0$ is independent of the driving Brownian motion.

#thm([Lemma 5.5.])[
  (Hermite expansion of the stationary evolution).  #emph[Let symmetric fields $T_l$ satisfy Equation (5.5).
    For fixed integers $l \, m gt.eq 0$ and fixed $t > 0$, set $N = B_t \/ sqrt(t)$. Then
#[#set math.equation(numbering: n => "(5.18)")
 $ T_l \( Y_t \) = e^(- t) sum_(j = 0)^m frac(\( 2 t \)^(j \/ 2), j !) T_(l + j) \( Y_0 \) : frak(h)_j \( N \) +
   cal(E)_(l \, m \, t) \, $ <eq:hierarchy-diffusion-expansion>]

 where the colon contracts the last $j$ tensor slots and
#[#set math.equation(numbering: n => "(5.19)")
 $ limsup frac(parallel cal(E)_(l \, m \, t) parallel_2, sqrt(I)) lt.eq
   frac(\( 2 t \)^(\( m + 1 \) \/ 2), sqrt(\( m + 1 \) !)) . $ <eq:hierarchy-diffusion-remainder>]

 For $0 lt.eq t lt.eq T < oo$ the same bound holds uniformly with $t$ replaced on the right by $T$ and with the
   expansion at $t = 0$ interpreted by continuity. The limits are also simultaneous for any fixed finite set of
   starting levels. In particular the normalized remainder tends to zero when the sequence limit is followed by $m
   arrow.r oo$.]
] <lem:hermite-expansion>

#proof[
  The operator-domain Itô formula from Lemma 4 gives, for each fixed $d$,
  $ e^v T_d \( Y_v \) =  & T_d \( Y_0 \) + sqrt(2) integral_0^v e^u T_(d + 1) \( Y_u \) : d B_u\
 & + integral_0^v e^u \( 1 - A \) T_d \( Y_u \) thin d u +
   sqrt(2) integral_0^v e^u \( D T_d - T_(d + 1) \) \( Y_u \) : d B_u . $
  Stationarity, Cauchy–Schwarz for the time integral, and Itô isometry show that the last two terms are
    $o \( sqrt(I) \)$, uniformly for $v in \[ 0 \, T \]$ in squared-mean norm.
    Substitute this formula for the integrand at the next level, and repeat $m + 1$ times.
    For fixed $l \, m \, T$, every replacement error remains $o \( sqrt(I) \)$;
    iterated isometry sums coefficient squares and introduces no dimension factor.
  After multiplication by $e^(- t)$, the remaining integral has coefficient $2^(\( m + 1 \) \/ 2)$,
    is over the ordered time simplex of length $t$, and has innermost integrand $e^(u - t)
    T_(l + m + 1) \( Y_u \)$. Since $u lt.eq t$, its squared norm is at most
  $ 2^(m + 1) frac(t^(m + 1), \( m + 1 \) !) parallel T_(l + m + 1) parallel_2^2 = \( 1 + o \( 1 \) \) I
    frac(\( 2 t \)^(m + 1), \( m + 1 \) !) . $
  This proves the remainder estimate and its uniform version.
    The other terms have coefficients evaluated at $Y_0$. Symmetry in their Brownian slots turns their ordered
    iterated integrals into $t^(j \/ 2) frak(h)_j \( N \) \/ j !$.
    To verify the factor directly, expand the Brownian exponential martingale
    $exp \( xi dot.op B_t - t \| xi \|^2 \/ 2 \)$ by iterated Itô integration and compare its coefficients with
    Equation (5.8). The additional $sqrt(2)$ at each stochastic integration gives exactly $\( 2 t \)^(j \/ 2) \/
    j !$ in Equation (5.18). ◻
]

=== 5.3 Operator tails in the strict branch <operator-tails-in-the-strict-branch>

For a tensor $F$, a one-slot flattening is the matrix whose row index is one specified tensor slot and whose
  column index is the tuple of all remaining slots. Its Hilbert–Schmidt norm is exactly $\| F \|$.

In the strict branch, put $Q = D w$. The drift decomposition gives $D^2 \( - log eta \) = K - Q$.
  Viewing $D F$ as a matrix with its derivative slot as row index, commuting a derivative with $A$ formally gives

$ D \( A F \) = A \( D F \) + \( K - Q \) D F . $

For $F = T_l$, both $Q$ and $D F$ belong to $L^2$, but their product $Q D F$ need not belong to $L^2$.
  We cannot yet use this formula to deduce the curvature estimate.
  The conditional covariance bound will instead let us approximate $D
  F$ by tests $P$ whose uniform operator norms tend to zero.
  Then $parallel Q P parallel_2 lt.eq parallel P parallel_(upright("op") \, oo) parallel Q parallel_2 =
  o \( sqrt(I) \)$, which is the product bound needed for the justified identity below.
  This step is needed only when $omega = w$; in the gap branch $Q = 0$.

#thm([Lemma 5.6.])[
  (Vanishing operator tails).  #emph[In the strict branch of Proposition 20, $Q =
    D w$ and the fields $T_l$ constructed in Lemma 23 satisfy the following property.
    For every fixed $delta > 0$, each one-slot flattening $F$ of $T_l$, $l gt.eq 1$, and also $F = Q$, obeys
#[#set math.equation(numbering: n => "(5.20)")
 $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] F F^(*) upright(bold(1))_({ F F^(*) > delta^2 })
   #scale(x: 120%, y: 120%)[\)] = o \( I \) . $ <eq:hierarchy-operator-tail>]

 Equivalently, clipping every singular value at any fixed positive cutoff changes the field by $o \( sqrt(I) \)$
   in $L^2$.]
] <lem:hierarchy-operator-tails>

#proof[
  We first prove the assertion for $Q$. Couple the heat observations by $U_v = Y_0 + W_v$,
    where $W$ is a standard Brownian motion independent of $Y_0 tilde.op eta$, and retain $h_v =
    bb(E) \[ w \( Y_0 \) divides U_v \]$. Put $H_v = D h_v \( U_v \)$ wherever this derivative is square
    integrable. The conditional covariance has the exact representation
  #[#set math.equation(numbering: n => "(5.21)")
   $ C_r = integral_0^r bb(E) \[ H_v H_v^(*) divides U_r \] thin d v \, wide
     integral_0^r bb(E) \| H_v \|^2 thin d v = \( 1 - m \( r \) \) I . $ <eq:hierarchy-conditional-bracket>]
  To check the first identity and its normalization, let $p_v$ denote the density of $U_v$.
    The entries of $p_v h_v$ solve the heat equation with generator $Delta \/ 2$.
    Direct differentiation gives the matrix identity
  $ \( partial_v - 1 / 2 Delta \) \( p_v h_v h_v^(*) \) = - p_v D h_v \( D h_v \)^(*) . $
  Integrate it against the later heat kernel and divide by $p_r$.
    The initial term becomes $bb(E) \[ w w^(*) divides U_r \]$, and the final term is $h_r h_r^(*)$,
    which proves the first formula. Taking the trace and expectation proves the second formula.
    For nonsmooth or unbounded initial $w$, perform the calculation on scalar projections with convex truncations
    increasing to the square, and then use polarization. Spatial cutoffs and the square-integrability of $w$
    justify the positive-time passage. At time zero, approximation of $w$ in $L^2 \( eta \)$ by bounded continuous
    functions gives $bb(E) \| w - bb(E) \[ w divides U_v \] \|^2 arrow.r 0$.
    Thus there is no missing boundary term in Equation (5.21).
  By Equation (5.1), $parallel Q parallel_2^2 = chevron.l w \, A w chevron.r_2 = \( 1 + o \( 1 \) \) I$.
    For almost every $v > 0$, convolution differentiation and form integration by parts give
  #[#set math.equation(numbering: n => "(5.22)")
   $ bb(E) chevron.l Q \( Y_0 \) \, H_v chevron.r = chevron.l D w \, D g_v chevron.r_2 = chevron.l A w \,
     g_v chevron.r_2 = m \( v \) I + o \( I \) . $ <eq:hierarchy-derivative-correlation>]
  The error is uniform in $v$: Jensen’s inequality gives $parallel g_v parallel_2 lt.eq sqrt(I)$,
    so it is bounded by $parallel \( A - 1 \) w parallel_2 sqrt(I)$.
    The convolution derivative identity follows first with cutoffs and bounded functions,
    then by the square-integrable derivative bounds in Equation (5.21).
  Fix a small $z > 0$ with $2 z < 1 \/ 4$. Combining the last two equations and using $0 lt.eq m \( v \) lt.eq
    1$ yields the exact limiting discrepancy
  #[#set math.equation(numbering: n => "(5.23)")
   $ lim 1 / I integral_0^(2 z) bb(E) \| Q \( Y_0 \) - H_v \|^2 thin d v & = 2 z + 1 - e^(- 2 z) -
     2 integral_0^(2 z) e^(- v) thin d v\
 & = 2 z - 1 + e^(- 2 z) = O \( z^2 \) . $ <eq:hierarchy-integrated-discrepancy>]
  Dominated convergence is applicable to $m \( v \)$, so this calculation does not require uniform convergence of
    the prediction curve near zero.
  We select a time in $\[ z \, 2 z \]$ while preserving a covariance-tail bound. For a fixed $kappa > 0$, define
  $ a \( r \) = I^(- 1) bb(E) "tr" (C_r / r upright(bold(1))_({ C_r \/ r > kappa })) . $
  For fixed $r in \[ z \, 2 z \]$, Equation (5.4) gives $a \( r \) arrow.r 0$, and $a \( r \) lt.eq
    1 \/ z$ follows from $bb(E) "tr" C_r lt.eq I$. Consequently $integral_z^(2 z) a \( r \) thin d r arrow.r 0$.
    On the other hand, Equation (5.23) and Markov’s inequality show that the set of times satisfying
  $ bb(E) \| Q \( Y_0 \) - H_r \|^2 lt.eq C z I $
  has measure at least $z \/ 2$, with an absolute $C$ and for sufficiently far terms of the sequence.
    The set where $a \( r \)$ exceeds a quantity tending to zero has measure tending to zero.
    Select $r in \[ z \, 2 z \]$ in the intersection. Thus $r$ may vary with the sequence index, but
  #[#set math.equation(numbering: n => "(5.24)")
   $ bb(E) \| Q \( Y_0 \) - H_r \|^2 lt.eq C z I \, wide bb(E) "tr"
     (C_r / r upright(bold(1))_({ C_r \/ r > kappa })) = o \( I \) . $ <eq:hierarchy-selected-time>]
  All constants in this selection are for fixed $z \, kappa$.
  We compare $B = H_r H_r^(*)$ with $C = C_r \/ r$ in trace norm. For matrices $U \, V$,
  #[#set math.equation(numbering: n => "(5.25)")
   $ parallel U U^(*) - V V^(*) parallel_1 lt.eq \| U -
     V \|_(upright("HS")) \( \| U \|_(upright("HS")) + \| V \|_(upright("HS")) \) . $ <eq:hierarchy-product-trace>]
  Compare both $B$ and $C$ with $bb(E) \[ Q Q^(*) divides U_r \]$.
    For $B$, conditional Jensen’s inequality and the first bound in Equation (5.24) give an $O \( sqrt(z) \)
    I$ bound on the expected trace-norm difference. For $C$, use the first identity in Equation (5.21),
    followed by Equation (5.25) and Cauchy–Schwarz in both probability and time.
    The integrated discrepancy is $O \( z^2 \) I$, whereas
  $ integral_0^r bb(E) \( \| H_v \| + \| Q \| \)^2 thin d v lt.eq 2 \( 1 - m \( 2 z \) \) I +
    4 z parallel Q parallel_2^2 . $
  Here we used $r lt.eq 2 z$ and the nonnegative integral in the second identity of Equation (5.21).
    The normalized limsup of the right side is $O \( z \)$, by prediction at the fixed time $2 z$.
    No prediction limit at the selected varying time is needed.
    Division by $r gt.eq z$ therefore also costs at most $O \( sqrt(z) \) I$. We have proved, in normalized limsup,
  #[#set math.equation(numbering: n => "(5.26)")
   $ bb(E) parallel B - C parallel_1 lt.eq O \( sqrt(z) \) I . $ <eq:hierarchy-bracket-comparison>]
  Fix $delta > 0$, take $kappa = delta^2 \/ 2$ above, and set $P = upright(bold(1))_({ B > delta^2 })$.
    Positivity of $C$ implies
  $ "tr" \( B P \) lt.eq delta^2 / 2 "rank" P + "tr" #scale(x: 120%, y: 120%)[\(] C
    upright(bold(1))_({ C > delta^2 \/ 2 }) #scale(x: 120%, y: 120%)[\)] + parallel B - C parallel_1 . $
  Since $delta^2 "rank" P lt.eq "tr" \( B P \)$, the first term is absorbed into the left side.
    Equations (5.24) and (5.26) bound the remaining high singular-value energy by $O \( sqrt(z) \) I + o \( I \)$.
    Clip $H_r$ at $delta$; its squared distance from the operator-norm ball of radius $delta$ is at most this
    energy. The first estimate in Equation (5.24) then gives the same bound, up to constants,
    for the distance of $Q$ from that ball. Let $z arrow.b 0$ after the sequence limit.
    The squared distance is $o \( I \)$ for every fixed $delta > 0$.
    Applying this distance assertion at cutoff $delta \/ 2$ bounds the energy of singular values above $delta$ by
    four times the squared distance, proving Equation (5.20) for $Q$.
    Since $parallel T_1 - Q parallel_2 = o \( sqrt(I) \)$, it also proves the assertion for $T_1$.
  It remains to propagate this estimate to higher levels. Fix $l gt.eq 1$ and $t > 0$.
    Apply Lemma 24 with starting level $1$. Conditional on $Y_0$,
    the Hermite chaoses are orthogonal even after applying an arbitrary measurable projection $P \( Y_0 \)$ to the
    first tensor slot. The chaos containing $T_l \( Y_0 \)$ has squared coefficient
  $ c_(l \, t) = e^(- 2 t) frac(\( 2 t \)^(l - 1), \( l - 1 \) !) > 0 . $
  Use the expansion to order $m gt.eq l - 1$, first take the sequence limit, and then let $m arrow.r
    oo$ in its remainder bound. The resulting inequality is
  #[#set math.equation(numbering: n => "(5.27)")
   $ liminf
     frac(bb(E) \| P \( Y_0 \)_1 T_1 \( Y_t \) \|^2 - c_(l \, t) bb(E) \| P \( Y_0 \)_1 T_l \( Y_0 \) \|^2, I)
     gt.eq 0 . $ <eq:hierarchy-random-projection>]
  The remainder estimates are uniform over such projections, since their operator norms are at most one.
  Choose $P \( Y_0 \)$ to project onto the singular values greater than a fixed $epsilon.alt >
    0$ of the first-slot flattening of $T_l \( Y_0 \)$. Then
  $ bb(E) "rank" P lt.eq epsilon.alt^(- 2) parallel T_l parallel_2^2 = \( 1 + o \( 1 \) \) epsilon.alt^(- 2) I . $
  For every $delta > 0$, let $S_delta$ be the singular-value clipping of $T_1$ at $delta$. Pointwise,
  $ \| P \( Y_0 \) S_delta \( Y_t \) \|_(upright("HS"))^2 lt.eq delta^2 "rank" P \( Y_0 \) . $
  Stationarity controls the $o \( I \)$ clipping error for $T_1 \( Y_t \)$.
    Hence the normalized limsup of the first expectation in Equation (5.27) is at most $delta^2 \/ epsilon.alt^2$.
    Send $delta arrow.b 0$ to obtain the tail claim at threshold $epsilon.alt$ for $T_l$.
    No independence between $P \( Y_0 \)$ and $T_1 \( Y_t \)$ was required.
    Tensor symmetry supplies every other one-slot flattening. ◻
]

=== 5.4 The curvature estimate and its domains <the-curvature-estimate-and-its-domains>

It remains to prove the curvature assertion of the hierarchy.
  We first justify the differentiated operator identity against a test whose product with the curvature is in
  $L^2$. The preceding tail estimate will supply such a test in the strict branch;
  the gap branch will use $T_(l + 1)$ directly.

#thm([Lemma 5.7.])[
  (Weighted divergence and the differentiated operator).  #emph[Let $eta$ be a smooth positive probability
    density, let $A = - Delta - D log eta dot.op D$, and put $H = D^2 \( - log eta \)$.
    Let $P = \( P_(i alpha) \)$ have one vector slot $i$ and a finite-dimensional coefficient index $alpha$.
    Suppose every coefficient belongs to $"Dom" A$ and $H P in L^2 \( eta \)$. Then the weighted adjoint divergence
$ \( D^(*) P \)_alpha = - sum_i partial_i P_(i alpha) - sum_i \( partial_i log eta \) P_(i alpha) $

 belongs to $L^2 \( eta \)$ and satisfies
#[#set math.equation(numbering: n => "(5.28)")
 $ parallel D^(*) P parallel_2^2 lt.eq parallel D P parallel_2^2 + chevron.l P \,
   H P chevron.r_2 . $ <eq:hierarchy-divergence-bound>]

 For every coefficient field $F in "Dom" A$,
#[#set math.equation(numbering: n => "(5.29)")
 $ chevron.l A F \, D^(*) P chevron.r_2 = chevron.l D F \, A P chevron.r_2 + chevron.l D F \,
   H P chevron.r_2 . $ <eq:hierarchy-differentiated-operator>]

 In particular this identity requires $H P in L^2$, not $H D F in L^2$.]
] <lem:hierarchy-divergence>

#proof[
  For compactly supported smooth $P$, commuting two first derivatives in weighted integration by parts gives
  #[#set math.equation(numbering: n => "(5.30)")
   $ parallel D^(*) P parallel_2^2 = sum_(i \, j \, alpha) chevron.l partial_j P_(i alpha) \,
     partial_i P_(j alpha) chevron.r_2 + chevron.l P \, H P chevron.r_2 . $ <eq:hierarchy-divergence-identity>]
  Cauchy–Schwarz applied to the two arrays with $i \, j$ interchanged bounds the sum by $parallel D P
    parallel_2^2$, without a dimension factor.
  For the stated $P$, membership in $"Dom" A$ gives $P in H_(upright("loc"))^2$ by local elliptic regularity and
    $D P in L^2 \( eta \)$. Choose smooth cutoffs $0 lt.eq chi_R lt.eq
    1$ tending to one with $parallel D chi_R parallel_oo arrow.r 0$.
    Equation (5.30) applies to $chi_R P$ by local Sobolev approximation. Since
  $ parallel D \( chi_R P \) - D P parallel_2 arrow.r 0 \, wide chevron.l chi_R P \, H chi_R P chevron.r_2 arrow.r
    chevron.l P \, H P chevron.r_2 \, $
  its right side is bounded. The second convergence uses $\| chevron.l P \, H P chevron.r \| in L^1$,
    a consequence of $P \, H P in L^2$. Weak compactness in $L^2$ and distributional convergence of
    $D^(*) \( chi_R P \)$ identify the limit as $D^(*) P$. Lower semicontinuity proves Equation (5.28).
    Only first derivatives of the cutoffs have entered the estimate.
  For compactly supported smooth $F$, differentiate the scalar operator:
  $ D \( A F \) = A \( D F \) + H D F . $
  Pair this identity with $P$, use symmetry of $H$, and integrate by parts to obtain Equation (5.29).
    For general $F in "Dom" A$, use the operator core from Lemma 4 to choose compact smooth $F_j$ with $F_j
    arrow.r F$ and $A F_j arrow.r A F$ in $L^2$. This convergence also holds in the form norm, since
  $ parallel D \( F_j - F \) parallel_2^2 = chevron.l F_j - F \, A \( F_j - F \) chevron.r_2 arrow.r 0 . $
  All terms in Equation (5.29) therefore converge: the three fixed factors are $D^(*) P$, $A P$, and $H P$,
    each in $L^2$. This proves the claimed global identity. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 20.] Lemma 23 supplies the fields and all assertions except
    Equation (5.6). Fix $l gt.eq 0$ and write $F = T_l$. View $D
    F$ as a matrix with its derivative slot as row index and all old tensor slots as column index.
    We construct a matrix field $P$ satisfying
  #[#set math.equation(numbering: n => "(5.31)")
   $ parallel P - D F parallel_2 + parallel \( A - 1 \) P parallel_2 = o \( sqrt(I) \) \, wide
     parallel D P parallel_2 = O \( sqrt(I) \) \, wide parallel Q P parallel_2 = o \( sqrt(I) \) \,
     $ <eq:hierarchy-curvature-test>]
  where $Q = D w$ in the strict branch and $Q = 0$ in the gap branch.
  In the strict branch, apply Lemma 25 to the corresponding flattening of $T_(l + 1)$.
    Choose a singular-value cutoff $delta arrow.b 0$ sufficiently slowly that the clipped field $C$ obeys
  $ parallel C - T_(l + 1) parallel_2 = o \( sqrt(I) \) \, wide parallel C \( y \) parallel_(upright("op")) lt.eq
    delta . $
  Set $P = e^(1 - A) C = e P_1 C$. Markov averaging and convexity of the operator-norm ball give $parallel
    P \( y \) parallel_(upright("op")) lt.eq e delta$. The spectral multipliers $e^(1 - x)$,
    $\( x - 1 \) e^(1 - x)$, and $sqrt(x) thin e^(1 - x)$ are bounded for $x gt.eq 0$.
    Moreover $\| e^(1 - x) - 1 \| lt.eq C \| x - 1 \|$ there.
    These bounds, the approximation of $C$, and the near-eigenfunction assertion for $T_(l + 1)$ give the first
    two estimates in Equation (5.31). Finally $parallel Q parallel_2^2 = \( 1 + o \( 1 \) \) I$ and
  $ parallel Q P parallel_2 lt.eq parallel P parallel_(upright("op") \, oo) parallel Q parallel_2 = o \( sqrt(I) \) . $
  The clipping is only used to construct $P$, so it need not preserve tensor symmetry.
    In the gap branch take $P = T_(l + 1)$ directly. The first two estimates follow from Equation (5.5),
    and the last is immediate from $Q = 0$. No operator-tail argument is needed in this branch.
  The drift hypothesis gives $H = D^2 \( - log eta \) = K - Q$ in either case.
    Both $K P$ and $Q P$ are in $L^2$, and the operator-domain assertion for $P$ was retained by its construction.
    Lemma 26 therefore applies. In particular,
  $ parallel D^(*) P parallel_2^2 lt.eq parallel D P parallel_2^2 + s^(- 1) parallel P parallel_2^2 +
    parallel P parallel_2 parallel Q P parallel_2 = O \( I \) . $
  Insert $A F = F + \( A - 1 \) F$ and $A P = P + \( A - 1 \) P$ into Equation (5.29).
    The terms $chevron.l F \, D^(*) P chevron.r_2$ and $chevron.l D F \, P chevron.r_2$ cancel. Consequently
  $ chevron.l D F \, K P chevron.r_2 =  & chevron.l \( A - 1 \) F \, D^(*) P chevron.r_2 -
    chevron.l D F \, \( A - 1 \) P chevron.r_2 + chevron.l D F \, Q P chevron.r_2 = o \( I \) . $
  Since $parallel K parallel_(upright("op") \, oo) lt.eq s^(- 1)$ and $P - D F = o_(L^2) \( sqrt(I) \)$, this gives
  $ chevron.l D F \, K D F chevron.r_2 = o \( I \) . $
  Replacing $D F$ by $T_(l + 1)$ costs $o \( I \)$ by the derivative estimate.
    It proves Equation (5.6) at level $l + 1$ on the derivative slot, and hence on every slot by symmetry.
    Level zero was an initial assumption. All claims of the proposition follow. ◻
]

To use many tensor degrees at once, first impose the estimates on a fixed finite list of levels,
  projection-rank constants, and times. Then increase that list sufficiently slowly along the original sequence.
  For example, one may choose $k arrow.r oo$ so that the normalized errors in Proposition 20 tend to zero
  uniformly through level $3 k$, while $sup_(l lt.eq 3 k) parallel T_l parallel_2^2 \/ I$ stays bounded.
  The same diagonal applies to any fixed number of terms in Lemma 24 and any fixed bounded time interval.
  Thus averaging over a band of degrees or shifting that band by a fixed integer does not change any of the
  preceding normalized estimates.

== 6 The reduced square root and a frozen matrix algebra <sec:matrices>

The hierarchy of Proposition 20 contains tensors of arbitrarily high order whose derivatives have almost the same
  energy as the tensors themselves. We first transfer this near equality to the positive square root of their
  one-slot reduction. We then describe that square root along the stationary diffusion by matrices frozen at the
  initial point. The construction uses weighted traces throughout; in particular,
  no lower bound on a nonzero eigenvalue will be required.

=== 6.1 Sharp energy for the reduced square root <sharp-energy-for-the-reduced-square-root>

All limits in this section are along the counterexample sequence. We make the following diagonal choice explicit.
  For each finite integer $K$, impose the conclusions of Proposition 20 through level $3 K$,
  the fixed-projection conclusions for rank coefficients at most $K$,
  and the estimates of Lemma 24 for every starting level $0 lt.eq l < 2 K$ and every truncation order $0 lt.eq
  m lt.eq K$, on time intervals $0 lt.eq t lt.eq K$. Only levels through $3 K$ enter these expansions,
  including their remainders. For each such finite list, the hierarchy defects and the excesses over the
  normalized Hermite remainder bounds can be made arbitrarily small.
  Choose an integer $k arrow.r oo$ slowly enough that these defects and excesses tend to zero,
  uniformly over the corresponding list. Further auxiliary parameters below will be chosen by the same finite-list
  procedure. In particular, normalized endpoint energies remain bounded when a band of $k$ levels is shifted by a
  fixed number of levels.

Regard the direct sum

$ Psi = xor.big_(k lt.eq l < 2 k) T_l / sqrt(k I) $

as a matrix by separating the first tensor index from the remaining indices and the direct-sum label. Define

#[#set math.equation(numbering: n => "(6.1)")
 $ rho = Psi Psi^(*) \, wide R = rho^(1 \/ 2) . $ <eq:matrix-reduction>]

High tensor degree provides many interchangeable slots, while averaging adjacent degrees makes each fixed shift
  cost only endpoint terms of order $k^(- 1)$. These two features will force sharp energy estimates for the
  positive matrix field $R$.

Here $R$ is a positive matrix field, distinct from the scalar log-Sobolev constant $R \( nu \)$.
  Write $parallel dot.op parallel_2$ for the field norm formed with ordinary Hilbert–Schmidt coefficient norms.
  The hierarchy gives

#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E) "tr" R^2 = parallel Psi parallel_2^2 arrow.r 1 \, wide parallel D Psi parallel_2^2 arrow.r
   1 . $ <eq:matrix-normalization>]

#thm([Lemma 6.1.])[
  (Centering and the square-root energy).  #emph[The field $R$ belongs to the Dirichlet form domain and satisfies
$ parallel bb(E) R parallel_(upright("HS")) = o \( 1 \) \, wide liminf parallel D R parallel_2^2 gt.eq 1 \, wide
  parallel D R parallel_2^2 = O \( 1 \) . $

]
] <lem:matrix-centering>

#proof[
  For rectangular matrices $X \, Y$, the Araki–Yamagami inequality #cite(label("ArakiYamagami1981")) Theorem 1
    gives the following square-root bound. We give a finite-dimensional proof by self-adjoint dilation:
  #[#set math.equation(numbering: n => "(6.3)")
   $ parallel sqrt(X X^(*)) - sqrt(Y Y^(*)) parallel_(upright("HS"))^2 lt.eq 2 parallel X -
     Y parallel_(upright("HS"))^2 . $ <eq:matrix-root-lipschitz>]
  Indeed the absolute value of the dilation of $X$ has diagonal blocks $sqrt(X X^(*))$ and $sqrt(X^(*) X)$.
    If $A \, B$ are self-adjoint and $f$ is scalar Lipschitz,
    expansion in an eigenbasis of $A$ and an eigenbasis of $B$ shows that $parallel f \( A \) -
    f \( B \) parallel_(upright("HS")) lt.eq "Lip" \( f \) parallel A - B parallel_(upright("HS"))$.
    Apply this with $f \( x \) = \| x \|$. Difference quotients, followed by form approximation,
    prove that $R$ is in the form domain and that $parallel D R parallel_2^2 lt.eq 2 parallel D Psi parallel_2^2$.
  The curvature conclusion of the hierarchy yields
  $ bb(E) "tr" \( \( 1 - M_s \) R^2 \) = o \( 1 \) . $
  We also have
  #[#set math.equation(numbering: n => "(6.4)")
   $ "tr" \( \( bb(E) M_s \) \( bb(E) R^2 \) \) = o \( 1 \) . $ <eq:matrix-independent-centering>]
  To see the latter assertion in the strict branch, fix $delta >
    0$ and let $P_delta$ be the spectral projection of $bb(E) M_s$ onto $\( delta \, oo \)$.
    Lemma 19 gives $"rank" P_delta = O_delta \( I \)$; the deterministic-projection conclusion of Proposition 20
    therefore gives $"tr" \( P_delta bb(E) R^2 \) = o \( 1 \)$.
    Since $0 lt.eq M_s lt.eq 1$, the left side of Equation (6.4) is at most $o \( 1 \) + delta bb(E) "tr" R^2$.
    Send $delta$ to zero after the sequence limit. In the gap branch use directly $parallel bb(E) M_s
    parallel_(upright("op")) = o \( 1 \)$.
  Let $R'$ be evaluated at an independent point. Insert $1 - M_s +
    M_s$ between $R$ and $R'$ in $parallel bb(E) R parallel_(upright("HS"))^2 = bb(E) "tr" \( R R' \)$.
    Hilbert–Schmidt Cauchy–Schwarz bounds the term containing $1 - M_s$ by
  $ #scale(x: 120%, y: 120%)[\(] bb(E) "tr" \( \( 1 - M_s \) R^2 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\(] bb(E) "tr" R^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = o \( 1 \) . $
  The other term is bounded by
  $ #scale(x: 120%, y: 120%)[\(] bb(E) "tr" \( M_s R^2 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\(] "tr" \( \( bb(E) M_s \) \( bb(E) R^2 \) \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = o \( 1 \) . $
  Poincaré for $eta$, whose constant tends to one, now gives the lower bound on $parallel D R
    parallel_2^2$ from Equation (6.2). ◻
]

The next estimate is the reason for using tensors with many symmetric slots.
  It compares averaging an action over those slots with the geometric, rather than arithmetic,
  weighting by the marginal matrix.

#thm([Lemma 6.2.])[
  (Averaging over symmetric tensor slots).  #emph[Let $psi$ be a finite direct sum of symmetric tensors,
    each with at least $k gt.eq 2$ slots. Let $rho$ be its one-slot reduction and $R = sqrt(rho)$.
    For a self-adjoint matrix $H$, let $H_(upright("av"))$ act on each component by averaging the action of $H$
    over its slots. Then
#[#set math.equation(numbering: n => "(6.5)")
 $ parallel H_(upright("av")) psi parallel^2 lt.eq "tr" \( R H R H \) + 2 /
   k "tr" \( rho H^2 \) . $ <eq:matrix-copied-slots>]

]
] <lem:matrix-copied-slots>

#proof[
  For a component $psi_d$ with $d$ slots, put
  $ a_d = chevron.l psi_d \, H_(\( 1 \))^2 psi_d chevron.r \, wide c_d = chevron.l psi_d \,
    H_(\( 1 \)) H_(\( 2 \)) psi_d chevron.r . $
  Symmetry and Cauchy–Schwarz give $\| c_d \| lt.eq a_d$, and direct expansion gives
  $ parallel H_(upright("av")) psi parallel^2 = sum_d (a_d / d + (1 - 1 / d) c_d) lt.eq sum_d c_d + 2 / k sum_d a_d . $
  It remains to prove $\| sum_d c_d \| lt.eq "tr" \( R H R H \)$.
    This correlation bound can also be deduced from the Wigner–Yanase case of Lieb’s trace-concavity theorem
    #cite(label("Lieb1973")); we give a proof by weighted interpolation.
  Define the linear map $C$ by
  $ "tr" \( X C \( Y \) \) = sum_d chevron.l psi_d \, X_(\( 1 \)) Y_(\( 2 \)) psi_d chevron.r . $
  Flattening all remaining indices exhibits $C \( Y \)$ as a sum of terms $A_alpha Y^(sans(T)) A_alpha^(*)$.
    Thus $C$ is positive and $C \( 1 \) = C^(*) \( 1 \) = rho$.
    Restrict to the support of $rho$, on which inverse powers are defined, and set
  $ U \( Y \) = rho^(- 1 \/ 2) C \( Y \) rho^(- 1 \/ 2) . $
  The map $U$ is unital and contractive in operator norm: its preceding representation is an isometric compression
    of copies of $Y^(sans(T))$. It also satisfies $"tr" \( rho U \( Y \) \) = "tr" \( rho Y \)$.
    For $0 lt.eq Re z lt.eq 1$ introduce
  $ U_z \( Y \) = rho^(z \/ 2) U \( rho^(- z \/ 2) Y rho^(- z \/ 2) \) rho^(z \/ 2) . $
  On $Re z = 0$, multiplication on either side by imaginary powers of $rho$ is isometric,
    so $U_z$ is operator-norm contractive. At $z = 1$,
  $ U_1 \( Y \) = C \( rho^(- 1 \/ 2) Y rho^(- 1 \/ 2) \) \, wide U_1^(*) \( 1 \) = 1 . $
  Its adjoint is a unital positive map with the same compression and transpose representation,
    hence is operator-norm contractive. Duality makes $U_1$ trace-norm contractive;
    imaginary powers give the same conclusion on $Re z = 1$.
  The interpolation used here is the finite-dimensional weighted Schatten argument;
    compare #cite(label("Beigi2013")) Section III, Theorem 4.
    We give the details for our positive correlation map. Given matrices of Hilbert–Schmidt norm one,
    continue the singular values of the input by powers $2 z$,
    and those of the matrix paired with its output by powers $2 \( 1 - z \)$, keeping the unitary factors fixed.
    The bilinear trace pairing is analytic in the strip, bounded by one on both boundary lines by the preceding
    endpoint bounds and trace duality. The three-lines inequality bounds it by one at $z = 1 \/ 2$.
    Zero singular values follow by approximation. This proves $parallel U_(1 \/ 2) \( Y \)
    parallel_(upright("HS")) lt.eq parallel Y parallel_(upright("HS"))$. Take $Y = rho^(1 \/ 4) H rho^(1 \/ 4)$. Then
  $ "tr" \( Y U_(1 \/ 2) \( Y \) \) = "tr" \( H C \( H \) \) = sum_d c_d \, wide
    parallel Y parallel_(upright("HS"))^2 = "tr" \( R H R H \) . $
  Cauchy–Schwarz proves the claim. Compression to the support leaves the correlation unchanged:
    every tensor slot lies in that support. Complexification, used only for interpolation,
    preserves the conclusion for real tensors. ◻
]

#thm([Lemma 6.3.])[
  (Saturation of the square-root energy).  #emph[There are measurable symmetric matrix fields $H_i$, $1 lt.eq
    i lt.eq n$, solving
#[#set math.equation(numbering: n => "(6.6)")
 $ D_i R = frac(H_i R + R H_i, 2) \, $ <eq:matrix-sylvester>]

 with zero kernel–kernel block, such that
#[#set math.equation(numbering: n => "(6.7)")
 $ parallel D R parallel_2^2 arrow.r 1 \, wide sum_i bb(E) parallel \[ H_i \, R \] parallel_(upright("HS"))^2 =
   o \( 1 \) \, wide sum_i bb(E) "tr" \( R^2 H_i^2 \) arrow.r 1 . $ <eq:matrix-saturation>]

 Moreover,
#[#set math.equation(numbering: n => "(6.8)")
 $ sum_i (parallel D_i R - H_i R parallel_2^2 + parallel D_i Psi - \( H_i \)_(\( 1 \)) Psi parallel_2^2) =
   o \( 1 \) . $ <eq:matrix-action-errors>]

 The first slot can be replaced by any existing slot in each component.]
] <lem:matrix-saturation>

#proof[
  In an eigenbasis of $R$ with eigenvalues $r_a$, define $\( H_i \)_(a b) =
    2 \( D_i R \)_(a b) \/ \( r_a + r_b \)$ when $r_a + r_b > 0$, and zero otherwise.
    The kernel–kernel block of $D_i R$ vanishes almost everywhere.
    One way to check this for a form-domain positive matrix field is to use absolutely continuous line
    representatives: at a differentiability point, the quadratic form on every vector in the kernel has a local
    minimum zero, and polarization gives the assertion. The formula is measurable and gives
  $ sum_i parallel H_i R parallel_(upright("HS"))^2 lt.eq 4 \| D R \|^2 . $
  Set
  $ e = parallel D R parallel_2^2 \, quad a = sum_i bb(E) "tr" \( R^2 H_i^2 \) \, quad c =
    sum_i bb(E) parallel \[ H_i \, R \] parallel_(upright("HS"))^2 \, quad d = parallel D Psi parallel_2^2 . $
  The Sylvester equation implies the exact identities
  #[#set math.equation(numbering: n => "(6.9)")
   $ e = a - c / 4 \, wide sum_i bb(E) "tr" \( R H_i R H_i \) = e - c / 4 . $ <eq:matrix-energy-identities>]
  Differentiating $R^2 = Psi Psi^(*)$ in the weak form sense gives
  $ e = sum_i bb(E) chevron.l D_i Psi \, \( H_i \)_(\( 1 \)) Psi chevron.r =
    sum_i bb(E) chevron.l D_i Psi \, \( H_i \)_(upright("av")) Psi chevron.r . $
  For example, the first equality follows by pairing $D_i \( R^2 \)$ with $H_i \/ 2$;
    all products are integrable by the displayed bound. The second uses the symmetry of each $D_i
    Psi$ on its existing slots. Lemma 28 and Cauchy–Schwarz yield
  $ e^2 lt.eq d (e - c / 4 + frac(2 a, k)) . $
  Since $a lt.eq 4 e$, $d arrow.r 1$, and $liminf e gt.eq 1$, this first forces $e arrow.r 1$ and then $c arrow.r
    0$; Equation (6.9) gives $a arrow.r 1$. Finally,
  $ sum_i parallel D_i R - H_i R parallel_2^2 = c / 4 \, wide
    sum_i parallel D_i Psi - \( H_i \)_(\( 1 \)) Psi parallel_2^2 = d + a - 2 e . $
  Both tend to zero. Symmetry gives the assertion for the other slots. ◻
]

=== 6.2 Bounded columns and spectral blocks <bounded-columns-and-spectral-blocks>

We next make the column $\( H_i \)_i$ bounded in operator norm.
  This requires a weighted tail estimate; an unweighted truncation would be inadequate when $R$ has many small
  eigenvalues. Throughout the modifications below, $H_i$ denotes the current column;
  the exact Sylvester identity (6.6) refers to the original column.
  The approximate derivative-action and balance estimates are preserved as stated in the following lemmas.

#thm([Lemma 6.4.])[
  (Balance and bounded columns).  #emph[The matrices in Lemma 29 satisfy
#[#set math.equation(numbering: n => "(6.10)")
 $ bb(E) ∥sum_i H_i rho H_i - rho∥_1 = o \( 1 \) \, wide bb(E) ∥R (sum_i H_i^2) R - rho∥_1 =
   o \( 1 \) . $ <eq:matrix-balance>]

 They can be replaced by symmetric matrix fields, still denoted $H_i$, so that Equation (6.8),
   the commutator conclusion of Equation (6.7), and Equation (6.10) hold, and
#[#set math.equation(numbering: n => "(6.11)")
 $ S := sum_i H_i^2 lt.eq 4 upright("Id") \, wide bb(E) parallel \( S - 1 \) R parallel_(upright("HS"))^2 =
   o \( 1 \) . $ <eq:matrix-column-bound>]

 The total change satisfies $sum_i bb(E) parallel \( H_i^(upright("new")) - H_i^(upright("old")) \) R
   parallel_(upright("HS"))^2 = o \( 1 \)$.]
] <lem:matrix-bounded-column>

#proof[
  We repeatedly use the dimension-free inequality
  #[#set math.equation(numbering: n => "(6.12)")
   $ parallel X X^(*) -
     Y Y^(*) parallel_1 lt.eq \( parallel X parallel_(upright("HS")) + parallel Y parallel_(upright("HS")) \)
     parallel X - Y parallel_(upright("HS")) . $ <eq:matrix-reduction-perturbation>]
  By Equation (6.8), the first sum in Equation (6.10) is close in expected trace norm to the one-slot reduction of
    $D Psi$, with the derivative index included among the column indices. The derivative coupling identifies this with
  $ frac(1, k I) sum_(k lt.eq l < 2 k) T_(l + 1) T_(l + 1)^(*) . $
  The trace-norm error from the coupling is $o \( 1 \)$ by Equation (6.12) and Equation (6.2).
    Shifting the band changes its reduction only by its two endpoints, whose expected trace-norm cost is
  $ frac(parallel T_(2 k) parallel_2^2 + parallel T_k parallel_2^2, k I) = O \( k^(- 1) \) . $
  This proves the first balance equation. Comparing the arrays of matrices $\( H_i R \)_i$ and $\( R H_i \)_i$
    proves the second by the same inequality and the summed commutator estimate.
  For the original, possibly unbounded column write $upright(bold(H)) v = \( H_i v \)_i$, $S =
    upright(bold(H))^(*) upright(bold(H))$, and $J = \( 1 + S \)^(- 1)$.
    Let $upright(bold(K)) = upright(bold(H)) R - R^(xor n) upright(bold(H))$,
    so that $bb(E) parallel upright(bold(K)) parallel_(upright("HS"))^2 = o \( 1 \)$. Algebra gives
  $ \[ S \, R \] = upright(bold(H))^(*) upright(bold(K)) - upright(bold(K))^(*) upright(bold(H)) \,
    wide \[ R \, J \] = J \[ S \, R \] J . $
  The bounds
  $ parallel upright(bold(H)) J upright(bold(H))^(*) parallel_(upright("op")) lt.eq 1 \, wide
    parallel upright(bold(H)) J parallel_(upright("op")) lt.eq 1 / 2 \, wide
    parallel J parallel_(upright("op")) lt.eq 1 $
  therefore imply $parallel upright(bold(H)) \[ R \, J \] parallel_(upright("HS")) lt.eq
    2 parallel upright(bold(K)) parallel_(upright("HS"))$. For every fixed $f \( x \) = a + b \/ \( 1 + x \)$,
    it follows that
  $ bb(E) parallel upright(bold(H)) \[ f \( S \) \, R \] parallel_(upright("HS"))^2 = o \( 1 \) . $
  The squared norms of $upright(bold(H)) f \( S \) R$ and $upright(bold(H)) R f \( S \)$ differ by $o \( 1 \)$:
    the latter has bounded mean-square norm, and the preceding bound controls their difference.
    Testing the second balance equation against the bounded matrix $f \( S \)^2$ consequently gives
  $ bb(E) "tr" #scale(x: 120%, y: 120%)[\(] R^2 \( S - 1 \) f \( S \)^2 #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Use $f = 1 \, 1 + J \, 1 - J$ and $\( S - 1 \)^2 \/ \( 1 + S \) = \( S - 1 \) - 2 \( S - 1 \) J$ to obtain
  #[#set math.equation(numbering: n => "(6.13)")
   $ bb(E) "tr" (R^2 frac(\( S - 1 \)^2, 1 + S)) = o \( 1 \) . $ <eq:matrix-column-tail>]
  All these expressions are integrable: their absolute values are bounded by a constant times
    $"tr" \( R^2 \( 1 + S \) \)$.
  Let $Q = upright(bold(1))_(\( 4 \, oo \)) \( S \)$ and $P = 1 - Q$.
    On this spectral region, $\( S - 1 \)^2 \/ \( 1 + S \)$ dominates both a positive constant and a positive
    multiple of $S$. Thus
  $ bb(E) "tr" \( R^2 Q \) + bb(E) "tr" \( R^2 S Q \) = o \( 1 \) . $
  The input truncation costs $sum_i bb(E) parallel H_i Q R parallel_(upright("HS"))^2 = bb(E) "tr" \( R^2 S Q \) =
    o \( 1 \)$. The output truncation costs
  $ sum_i bb(E) parallel Q H_i R parallel_(upright("HS"))^2 = bb(E) "tr" (Q sum_i H_i rho H_i) lt.eq
    bb(E) "tr" \( Q rho \) + bb(E) ∥sum_i H_i rho H_i - rho∥_1 = o \( 1 \) . $
  Consequently replacing $H_i$ by $P H_i P$ has total right-$R$ squared cost $o \( 1 \)$.
    The new column obeys $sum_i \( P H_i P \)^2 lt.eq P S P lt.eq 4 P$.
  Here is the perturbation accounting needed both now and below. If symmetric $tilde(H)_i$ have
  #[#set math.equation(numbering: n => "(6.14)")
   $ Delta = sum_i bb(E) parallel \( tilde(H)_i - H_i \) R parallel_(upright("HS"))^2 = o \( 1 \) \,
     $ <eq:matrix-weighted-change>]
  then symmetry gives the same bound with $R$ on the left. Each derivative error in Equation (6.8) changes in norm
    by at most $sqrt(Delta)$, and the summed commutator norm changes by at most $2 sqrt(Delta)$.
    The two balance errors change in expected trace norm by at most
  $
    (#scale(x: 180%, y: 180%)[\[] sum_i bb(E) parallel H_i R parallel_(upright("HS"))^2
    #scale(x: 180%, y: 180%)[\]]^(1 \/ 2) + #scale(x: 180%, y: 180%)[\[] sum_i bb(E) parallel tilde(H)_i R
    parallel_(upright("HS"))^2 #scale(x: 180%, y: 180%)[\]]^(1 \/ 2)) sqrt(Delta) \, $
  by Equation (6.12), and this is $o \( 1 \)$. The new summed energy is bounded by the old one plus the
    perturbation in norm. These statements apply to the compression just made.
  For the bounded column, $\[ S \, R \] = upright(bold(H))^(*) upright(bold(K)) -
    upright(bold(K))^(*) upright(bold(H))$ satisfies $parallel \[ S \, R \] parallel_2 lt.eq
    4 parallel upright(bold(K)) parallel_2 = o \( 1 \)$. Put $T = S - 1$,
    so $parallel T parallel_(upright("op")) lt.eq 3$. The second balance equation says $bb(E) parallel R T R
    parallel_1 = o \( 1 \)$. Finally,
  $ parallel T R parallel_(upright("HS"))^2 = "tr" \( T R T R \) + "tr" \( T \[ T \, R \] R \) . $
  The expectation of the first term is at most $3 bb(E) parallel R T R parallel_1$ in absolute value;
    the second is at most $3 parallel \[ T \, R \] parallel_2 parallel R parallel_2 = o \( 1 \)$.
    This proves the last assertion. ◻
]

#thm([Lemma 6.5.])[
  (Commutation and exchange of indices).  #emph[For the bounded columns just constructed,
#[#set math.equation(numbering: n => "(6.15)")
 $ sum_(i \, j) bb(E) parallel \[ H_i \, H_j \] R parallel_(upright("HS"))^2 = o \( 1 \) \, wide
   bb(E) sum_(i \, a \, b) \| \( H_i R \)_(a b) - \( H_a R \)_(i b) \|^2 = o \( 1 \) . $ <eq:matrix-index-exchange>]

 These conclusions also hold after a symmetric perturbation satisfying Equation (6.14),
   provided the new column has a uniform operator bound.]
] <lem:matrix-index-exchange>

#proof[
  Equation (6.8) implies that moving $H_i$ between any two existing slots costs $o \( 1 \)$ in summed mean square.
    Three slots suffice to exchange two factors. In the following chain,
    each $tilde.eq$ means that the difference has squared norm $o \( 1 \)$ after expectation and summation over
    $i \, j$:
  $ \( H_i \)_(\( 1 \)) \( H_j \)_(\( 1 \)) Psi & tilde.eq \( H_i \)_(\( 1 \)) \( H_j \)_(\( 2 \))
    Psi = \( H_j \)_(\( 2 \)) \( H_i \)_(\( 1 \)) Psi\
 & tilde.eq \( H_j \)_(\( 2 \)) \( H_i \)_(\( 3 \)) Psi = \( H_i \)_(\( 3 \)) \( H_j \)_(\( 2 \)) Psi\
 & tilde.eq \( H_i \)_(\( 3 \)) \( H_j \)_(\( 1 \)) Psi = \( H_j \)_(\( 1 \)) \( H_i \)_(\( 3 \)) Psi\
 & tilde.eq \( H_j \)_(\( 1 \)) \( H_i \)_(\( 1 \)) Psi . $
  The equalities use commutation on different slots. Each move costs at most the one-factor error multiplied by
    the column bound: for any tensor $v$,
  $ sum_i parallel \( H_i \)_(\( r \)) v parallel^2 lt.eq 4 parallel v parallel^2 . $
  The squared norm of the sum of the four errors is at most four times their summed squared norms.
    Thus the total commutator cost on $Psi$ is $o \( 1 \)$. Its cost on $Psi$ equals its cost on $R$,
    since both have reduction $R^2$.
  For the second conclusion, write $Psi = R J_0$, where $J_0 J_0^(*)$ is the support projection of $R$.
    The matrix-valued array $Z_(i a \, b) = \( H_i R \)_(a b) - \( H_a R \)_(i b)$ has its column index in that
    support, so $parallel Z J_0 parallel_(upright("HS")) = parallel Z parallel_(upright("HS"))$.
    The entries of $Z J_0$ express the exchange of the derivative index and the first tensor index in
    $\( H_i \)_(\( 1 \)) Psi$. Equation (6.8) and the approximation of $D
    Psi$ by fully symmetric $T_(l + 1)$ give the claim. For perturbed matrices,
    the derivative errors and the slot-moving errors have the bounds established after Equation (6.14);
    the same four moves use the new uniform column bound. The index-exchange norm itself changes by at most $2
    sqrt(Delta)$. ◻
]

We have obtained a bounded column acting almost identically on the symmetric tensor slots.
  To use Gaussian matrix polynomials, we now put its weighted estimates into a tracial form.
  The following construction is performed only at the initial point of the diffusion,
  so a varying eigenbasis will never be differentiated.

#thm([Lemma 6.6.])[
  (Spectral blocks and a bounded input map).  #emph[After enlarging the initial probability space by an
    independent uniform variable, there are a positive block matrix $R_(*) =
    xor.big_beta beta upright("Id")_beta$, with zero on $ker R$,
    and symmetric matrices $H_i$ supported on entries whose row, column,
    and outer index belong to the same positive block, with the following properties.
    Their total change satisfies Equation (6.14), $R_(*) lt.eq
    R lt.eq \( 1 + epsilon.alt \) R_(*)$ on the positive support for $epsilon.alt arrow.r 0$,
    and the column bound $S lt.eq 4 upright("Id")$ holds. With the positive weighted trace
#[#set math.equation(numbering: n => "(6.16)")
 $ tau \( U \) = bb(E) sum_beta beta^2 "tr"_beta U_beta \, $ <eq:matrix-weighted-trace>]

 where the expectation also includes any fresh noises present, we have $tau \( 1 \) arrow.r 1$ and
#[#set math.equation(numbering: n => "(6.17)")
 $ tau \( \( S - 1 \)^2 \) = o \( 1 \) \, quad sum_(i \, j) tau \( \| \[ H_i \, H_j \] \|^2 \) = o \( 1 \) \, quad
   bb(E) sum_beta beta^2 sum_(i \, a \, b in beta) \| \( H_i \)_(a b) - \( H_a \)_(i b) \|^2 =
   o \( 1 \) . $ <eq:matrix-tracial-defects>]

 For a vector $v$ in a positive block define $H \[ v \] = sum_(i in beta) v_i H_i$. We can further impose, pointwise,
#[#set math.equation(numbering: n => "(6.18)")
 $ parallel H \[ v \] parallel_(upright("HS")) lt.eq 2 \| v \| . $ <eq:flattening-bound>]

 The bound uses ordinary, unnormalized Hilbert–Schmidt norm.
   All the derivative-action and balance conclusions above continue to hold for these matrices in the initial
   coordinates.]
] <lem:matrix-blocks>

#proof[
  Choose an orthogonal eigenframe $O$ for $R$ at the initial point. Transform all three indices:
    in that frame the matrices are
  $ hat(H)_i = sum_j O_(j i) O^(*) H_j O . $
  This preserves the column bound, all the summed norms, and the index-exchange estimate,
    since these are Euclidean tensor contractions. Finite-dimensional spectral calculus and an ordered orthonormal
    basis completion give measurable choices, including at repeated eigenvalues.
  Let $h = log \( 1 + epsilon.alt \)$ and take an independent $theta$ uniform on $\[ 0 \, h \)$.
    Group positive eigenvalues in $\[ e^(theta + m h) \, e^(theta + \( m + 1 \) h) \)$, $m in bb(Z)$,
    and round those in each nonempty block down to $beta = e^(theta + m h)$. The zero eigenspace is kept separate. Write
  $ kappa = sum_i bb(E) parallel \[ H_i \, R \] parallel_(upright("HS"))^2 = o \( 1 \) \, wide a =
    sum_i bb(E) parallel H_i R parallel_(upright("HS"))^2 = O \( 1 \) . $
  For $0 < delta < h$, a pair of positive eigenvalues with $\| log \( r_a \/ r_b \) \| gt.eq
    delta$ satisfies $r_b^2 lt.eq C delta^(- 2) \( r_a - r_b \)^2$, when $delta lt.eq 1$.
    If their logarithmic distance is smaller than $delta$, the probability that a block boundary separates them is
    at most $delta \/ h$. Consequently the right-$R$ squared cost of deleting entries with row and column in
    different blocks is bounded by
  #[#set math.equation(numbering: n => "(6.19)")
   $ C delta^(- 2) kappa + delta / h a + kappa . $ <eq:matrix-block-error>]
  The final term covers a zero row and positive column directly by the commutator.
    A zero column has no right-$R$ cost. For example, choose $delta arrow.r
    0$ slowly enough that $kappa \/ delta^2 arrow.r 0$, and then $h arrow.r
    0$ slowly enough that $delta \/ h arrow.r 0$.
  Deleting entries whose outer index belongs to another block has vanishing cost as well.
    On the set where $i$ and $b$ have different block labels,
  $ \| \( H_i \)_(a b) r_b \|^2 lt.eq 2 \| \( H_i \)_(a b) r_b - \( H_a \)_(i b) r_b \|^2 +
    2 \| \( H_a \)_(i b) r_b \|^2 . $
  Sum over the indices. The first term is the second defect of Equation (6.15);
    the second is a row–column block exclusion of the kind already bounded in Equation (6.19).
    This includes outer indices in the zero eigenspace. Within each block the resulting matrices have the form
    $P_beta hat(H)_i P_beta$ for $i in beta$, and vanish otherwise. Thus
  $ sum_(i in beta) \( P_beta hat(H)_i P_beta \)^2 lt.eq P_beta (sum_i hat(H)_i^2) P_beta lt.eq 4 P_beta . $
  They are symmetric and their total change has the cost in Equation (6.14).
  For every block matrix $X$ one has the precise comparison
  #[#set math.equation(numbering: n => "(6.20)")
   $ tau \( X^(*) X \) lt.eq bb(E) parallel X R parallel_(upright("HS"))^2 lt.eq \( 1 + epsilon.alt \)^2
     tau \( X^(*) X \) . $ <eq:matrix-weight-comparison>]
  In particular $tau \( 1 \) arrow.r 1$. The perturbation bounds following Equation (6.14) prove the derivative,
    commutator, and balance conclusions for these matrices. The bounded-column argument at the end of Lemma 30
    again gives $bb(E) parallel \( S - 1 \) R parallel_(upright("HS"))^2 = o \( 1 \)$,
    so Equation (6.20) proves the first tracial defect. Lemma 31 gives the second.
    For the third, all three indices now lie in one block, and the index-exchange defect is exactly weighted by
    $r_b^2$; replacing this by $beta^2$ only decreases it. Matrix symmetry and exchange of $i \,
    a$ together give asymptotic symmetry under every permutation of the three indices.
  It remains to bound the map from the outer index to matrix coefficients. On each block let
  $ F v = sum_i v_i H_i \, wide \( G v \)_(a b) = \( H_b v \)_a . $
  The map $G$ has operator norm at most two because $parallel G v parallel_(upright("HS"))^2 = chevron.l v \,
    S v chevron.r lt.eq 4 \| v \|^2$. Total symmetry just established says
  $ bb(E) sum_beta beta^2 parallel F - G parallel_(upright("HS") \( bb(R)^(dim beta) \, upright("HS") \))^2 =
    o \( 1 \) . $
  Clip the singular values of $F$ to two, obtaining $F' = F
    B$ for a real positive contraction $B$ on the input space.
    Metric projection onto the operator-norm ball in Hilbert–Schmidt norm gives $parallel F -
    F' parallel_(upright("HS")) lt.eq parallel F - G parallel_(upright("HS"))$;
    this also follows immediately by singular-value decomposition and the variational characterization of singular
    values. Thus the block-weighted squared cost is $o \( 1 \)$.
    Writing $H'_i = sum_j B_(j i) H_j$ shows that every $H'_i$ remains symmetric. For each vector $v$,
  $ sum_i parallel H'_i v parallel^2 lt.eq sum_j parallel H_j v parallel^2 \, $
  so the column bound is preserved, as is the block support.
    The weighted cost controls the right-$R$ cost by Equation (6.20).
    Therefore the derivative and balance errors have exactly the bounds stated after Equation (6.14);
    index exchange changes by at most twice the perturbation norm,
    and the four-move argument controls the commutators. Repeating the bounded-column last step and then
    Equation (6.20) proves all three tracial defects for $H'_i$.
    The defining singular-value clipping proves Equation (6.18). ◻
]

=== 6.3 Gaussian moments and the frozen diffusion law <gaussian-moments-and-the-frozen-diffusion-law>

The matrices within a block need not commute exactly. The next lemma shows that their Gaussian linear combinations
  nevertheless have the scalar Gaussian joint moments in the weighted limit.
  We include the moment bounds because they also justify the unbounded exponential needed for the diffusion law.

#thm([Lemma 6.7.])[
  (Weighted Gaussian moments).  #emph[Let the block matrices and $tau$ be those of Lemma 32.
    For independent standard Gaussian vectors $N_1 \, dots.h \, N_q$, independent of the initial data, put $D_r =
    H \[ N_r \]$. Then, for every fixed word $r_1 \, dots.h \, r_m$,
#[#set math.equation(numbering: n => "(6.21)")
 $ tau \( D_(r_1) dots.h.c D_(r_m) \) arrow.r bb(E) \( Z_(r_1) dots.h.c Z_(r_m) \) \, $ <eq:matrix-gaussian-joint-law>]

 where $Z_1 \, dots.h \, Z_q$ are independent scalar standard normals.
   Products of any fixed length can be reordered with error tending to zero in $L^2 \( tau \)$.
   For every integer $p gt.eq 1$ and real $u gt.eq 0$,
#[#set math.equation(numbering: n => "(6.22)")
 $ bb(E)_(N_r) "tr"_beta D_r^(2 p) lt.eq 4^p \( 2 p - 1 \) ! ! "tr"_beta 1 \, wide tau \( e^(u \| D_r \|) \) lt.eq
   2 e^(2 u^2) tau \( 1 \) . $ <eq:matrix-gaussian-moment-bound>]

 If $frak(h)_j$ is the tensor Hermite polynomial of Lemma 24 and $frak(h)_j^(\( 1 \))$ is its one-dimensional
   version, then for each fixed $j$,
#[#set math.equation(numbering: n => "(6.23)")
 $ tau
   (lr(|sum_(i_1 \, dots.h \, i_j) H_(i_j) dots.h.c H_(i_1) frak(h)_j \( N_1 \)_(i_1 dots.h i_j) - frak(h)_j^(\(
   1 \)) \( D_1 \)|)^2) = o \( 1 \) . $ <eq:matrix-wick-reduction>]

]
] <lem:matrix-gaussian-moments>

#proof[
  We first prove a conditional moment bound on one fixed block, allowing a general column bound $S lt.eq
    C upright("Id")$. We use the Gaussian trace-moment integration-by-parts argument of #cite(label("Tropp2018"))
    Lemma 6.1 and Section 7; the weighted near-commutation limit will be proved afterward.
    Write $D = sum_i N_i H_i$. Gaussian integration by parts gives
  $ bb(E)_N "tr" D^(2 p) = sum_(j = 0)^(2 p - 2) bb(E)_N sum_i "tr" \( H_i D^j H_i D^(2 p - 2 - j) \) . $
  In an eigenbasis of $D$ with eigenvalues $d_a$, the absolute value of a summand is bounded by
  $ sum_(i \, a \, b) \| \( H_i \)_(a b) \|^2 \| d_b \|^j \| d_a \|^(2 p - 2 - j) . $
  For $p > 1$, the scalar weighted arithmetic–geometric mean inequality bounds the product of powers by
  $ frac(j, 2 p - 2) \| d_b \|^(2 p - 2) + (1 - frac(j, 2 p - 2)) \| d_a \|^(2 p - 2) . $
  Since $sum_(i \, b) \| \( H_i \)_(a b) \|^2 = S_(a a) lt.eq C$ and similarly with $a \, b$ exchanged,
    each summand is at most $C "tr" \| D \|^(2 p - 2)$. For $p = 1$ the assertion is $"tr" S lt.eq C "tr" 1$.
    Induction proves $bb(E)_N "tr" D^(2 p) lt.eq C^p \( 2 p - 1 \) ! ! "tr" 1$.
    After multiplying by the block weights, all fixed moments are uniformly bounded.
    Also $e^(u \| x \|) lt.eq 2 cosh \( u x \)$, so the even-moment series gives
  $ tau \( e^(u \| D \|) \) lt.eq 2 sum_(p gt.eq 0) frac(u^(2 p) C^p \( 2 p - 1 \) ! !, \( 2 p \) !) tau \( 1 \) =
    2 e^(C u^2 \/ 2) tau \( 1 \) . $
  This proves Equation (6.22) with $C = 4$.
  For clarity, the norm $parallel X parallel_(p \, tau) = tau \( \| X \|^p \)^(1 \/ p)$ is formed on the direct
    sum of the blocks and then averaged over the classical random variables.
    Schatten Hölder followed by scalar Hölder gives
  $ parallel X_1 dots.h.c X_m parallel_(p \, tau) lt.eq product_(j = 1)^m parallel X_j parallel_(p_j \, tau) \,
    wide sum_j 1 / p_j = 1 / p . $
  These bounds use the actual weights $beta^2$, with no factor depending on a block dimension.
    The finite-matrix Schatten inequality can itself be obtained by the same singular-value three-lines argument
    as in Lemma 28, interpolating the endpoint bounds with one trace norm and the other norms operator norms,
    and then applying duality.
  For independent $N_r \, N_s$,
  $ parallel \[ D_r \, D_s \] parallel_(2 \, tau)^2 = sum_(i \, j) tau \( \| \[ H_i \, H_j \] \|^2 \) = o \( 1 \) . $
  All its higher fixed moments are bounded by Hölder and the moment bound just proved.
    Interpolation between $L^2 \( tau \)$ and an arbitrarily high fixed $L^p \( tau \)$ therefore makes this
    commutator tend to zero in every fixed finite power norm.
    Applying Hölder to the factors on either side of a commutator shows that an adjacent transposition in a word
    of fixed length costs $o \( 1 \)$ in $L^2 \( tau \)$. A finite sequence of transpositions proves the
    reordering assertion.
  Now expand a mixed moment by Gaussian pairings, conditional on the matrices.
    Pairings must join indices of the same Gaussian vector. For each pair introduce its own independent standard
    Gaussian vector, shared only between the two factors in that pair.
    This represents the contracted matrix word exactly as a conditional expectation.
    Reorder the word until each pair is adjacent; the error is $o \( 1 \)$ even in $L^2 \( tau \)$.
    Averaging the independent vectors then gives $S^(m \/ 2)$. For each fixed integer $b$, boundedness of $S$ gives
  $ parallel S^b - 1 parallel_(2 \, tau) lt.eq (sum_(a = 0)^(b - 1) 4^a) parallel S - 1 parallel_(2 \, tau) =
    o \( 1 \) . $
  Each pairing consequently contributes $tau \( 1 \) + o \( 1 \) = 1 + o \( 1 \)$. Odd moments vanish.
    The number of admissible pairings is precisely the scalar independent-normal moment, proving Equation (6.21).
  Finally expand the tensor Hermite polynomial using its defining exponential
    $exp \( chevron.l v \, N chevron.r - \| v \|^2 \/ 2 \)$. A term consists of free $N$ indices and a number of
    signed Kronecker-delta pairs. Represent each delta pair by its own independent Gaussian vector, as above,
    and move its two matrix factors together. Conditional averaging is contractive in $L^2 \( tau \)$,
    so the reordering error remains $o \( 1 \)$. The resulting factors $S$ can be replaced by one,
    even between fixed powers of $D_1$, by Hölder and interpolation applied to the bounded matrix $S - 1$.
    The resulting polynomial is
  $ sum_(b = 0)^(floor.l j \/ 2 floor.r) frac(\( - 1 \)^b j !, 2^b b ! \( j - 2 b \) !) D_1^(j - 2 b) =
    frak(h)_j^(\( 1 \)) \( D_1 \) . $
  There are only finitely many terms for fixed $j$, proving Equation (6.23). ◻
]

#thm([Proposition 6.8.])[
  (Frozen diffusion law).  #emph[Let $Y_u$ be the stationary diffusion with invariant law $eta$ and driving
    Brownian motion $B_u$, and fix $t > 0$. Make the matrix construction of Lemma 32 at $Y_0$,
    using an independent random block offset. In its orthonormal frame put $N = B_t \/ sqrt(t)$;
    conditionally on the initial data and block offset, $N$ is a standard Gaussian vector.
    Define, in the initial spatial coordinates,
#[#set math.equation(numbering: n => "(6.24)")
 $ sigma = xor.big_beta beta^2 exp #scale(x: 120%, y: 120%)[\(] sqrt(8 t) thin H \[ N \] -
   4 t upright("Id")_beta #scale(x: 120%, y: 120%)[\)] \, $ <eq:matrix-frozen-covariance>]

 and set $sigma = 0$ on the omitted kernel. Then
#[#set math.equation(numbering: n => "(6.25)")
 $ bb(E) parallel R \( Y_t \) - sigma^(1 \/ 2) parallel_(upright("HS"))^2 arrow.r 0 . $ <eq:matrix-frozen-law>]

 The matrices defining $sigma$ obey the bounded-column and input-map bounds (6.11) and (6.18),
   the weighted defects (6.17), and the mixed moment law of Lemma 33.]
] <prop:frozen-law>

#proof[
  The proof has three steps: replace the added tensor indices in the hierarchy expansion by products of the
    initial matrices, identify their Wick contractions, and sum the resulting scalar Hermite series.
    All limits involving the degree of that series are taken after the counterexample-sequence limit, with $t$ fixed.
  The derivative-action estimate and the hierarchy coupling give
  #[#set math.equation(numbering: n => "(6.26)")
   $ frac(1, k I) sum_(k lt.eq l < 2 k) sum_i parallel T_(l + 1 \, i thin dot.op) - \( H_i \)_(\( 1 \)) T_l
     parallel_2^2 = o \( 1 \) . $ <eq:matrix-one-step>]
  It also holds when the band is shifted by any fixed integer $a gt.eq 0$.
    Indeed the same matrices have been constructed using levels $k$ through $2 k - 1$.
    Removing or adding at most $a$ levels in the error sum costs $O_C \( a \/ k \)$,
    since the unnormalized squared norm of each one-step error is at most
  $ 2 parallel T_(l + 1) parallel_2^2 + 2 C parallel T_l parallel_2^2 = O_C \( I \) \, $
  by the bounded column and the diagonal endpoint control. This also explains why the matrices may already include
    the block and input clipping modifications: their cost on $Psi$ is the right-$R$ cost in Equation (6.14).
  Iterating Equation (6.26), for each fixed $j$ we may replace the extra-index tensor $T_(l + j)$ by
  $ \( i_1 \, dots.h \, i_j \) mapsto \( H_(i_j) \)_(\( 1 \)) dots.h.c \( H_(i_1) \)_(\( 1 \)) T_l $
  in the normalized band mean-square norm, with error $o \( 1 \)$.
    More explicitly, if $e_a$ is the root mean-square error in the one-step estimate on the band shifted by $a$,
    the root error after $j$ steps is at most
  $ sum_(a = 0)^(j - 1) C^(a \/ 2) e_(j - 1 - a) . $
  Here multiplication by a column of $H_i$ costs at most $sqrt(C)$ in the summed coefficient norm.
    Each $e_a = o \( 1 \)$ at fixed $a$, so the displayed bound vanishes.
    Contraction with $frak(h)_j \( N \)$ multiplies squared coefficient norm by at most $j !$:
    it first symmetrizes the contracted indices, an orthogonal projection,
    and Gaussian Hermite orthogonality then gives the factor $j !$.
  Apply Lemma 24 to the band of levels in $Psi$. For each fixed $m$, the preceding replacements and Equation (6.23) give
  $ Psi \( Y_t \) = P_(m \, t) \( D \) Psi \( Y_0 \) + cal(E)_(m \, t) \, wide D = H \[ N \] \, $
  where
  $ P_(m \, t) \( x \) = e^(- t) sum_(j = 0)^m frac(\( 2 t \)^(j \/ 2), j !) frak(h)_j^(\( 1 \)) \( x \) $
  and
  #[#set math.equation(numbering: n => "(6.27)")
   $ limsup parallel cal(E)_(m \, t) parallel_2 lt.eq frac(\( 2 t \)^(\( m + 1 \) \/ 2), sqrt(\( m + 1 \) !)) .
     $ <eq:matrix-hermite-error>]
  To justify the conversion of a tracial polynomial error to the norm of its action on $Psi \( Y_0 \)$,
    use $parallel X Psi \( Y_0 \) parallel_(upright("HS")) = parallel X R
    parallel_(upright("HS"))$ and Equation (6.20). The band version of the remainder bound follows from the
    uniform finite-list diagonal fixed at the start of the section. Its right side tends to zero as $m arrow.r oo$.
  The spectral measures of $D$ averaged with $tau$ have total mass tending to one,
    converge in moments to the standard Gaussian by Equation (6.21),
    and have uniformly bounded exponential moments at every fixed linear parameter by Equation (6.22).
    These facts imply weak convergence to the standard Gaussian and convergence of the integrals of every
    continuous function bounded by a polynomial times a fixed linear exponential. Here is a direct justification:
    the second moment gives tightness; the higher moment bounds give uniform integrability of each polynomial,
    so every subsequential limit has the Gaussian moments. Its exponential moments determine its characteristic
    function by its power series, hence determine the law. Using a larger exponential parameter makes the tails of
    any of the specified test functions uniformly small.
  The scalar Hermite generating identity gives, with $Z$ standard normal,
  $ e^(- t) sum_(j gt.eq 0) frac(\( 2 t \)^(j \/ 2), j !) frak(h)_j^(\( 1 \)) \( Z \) =
    exp \( sqrt(2 t) thin Z - 2 t \) $
  in squared mean. In fact its squared tail norm is $e^(- 2 t) sum_(j > m) \( 2 t \)^j \/ j !$.
    Define the matrix multiplier
  $ M = exp \( sqrt(2 t) thin D - 2 t upright("Id") \) . $
  The just-proved convergence of spectral integrals, applied with each fixed $m$, yields
  #[#set math.equation(numbering: n => "(6.28)")
   $ lim tau \( \| M - P_(m \, t) \( D \) \|^2 \) = e^(- 2 t) sum_(j > m) frac(\( 2 t \)^j, j !) \, wide
     tau \( M^2 \) arrow.r 1 . $ <eq:matrix-exponential-limit>]
  Together with Equations (6.27) and (6.20), first sending the sequence index and then $m$ to infinity, this proves
  $ bb(E) parallel Psi \( Y_t \) - M Psi \( Y_0 \) parallel_(upright("HS"))^2 = o \( 1 \) . $
  There is no operator-norm bound on $M$ in this argument; only its weighted trace moments are used.
  Write $Psi \( Y_0 \) = R J_0$, with $J_0 J_0^(*)$ equal to the support projection.
    On each block $\( R - R_(*) \)^2 lt.eq epsilon.alt^2 R_(*)^2$, and $R_(*)$ is scalar there.
    By cyclicity and positivity of trace,
  $ bb(E) parallel M \( R - R_(*) \) J_0 parallel_(upright("HS"))^2 lt.eq epsilon.alt^2 tau \( M^2 \) = o \( 1 \) . $
  Thus $Psi \( Y_t \)$ is close in squared mean to $M R_(*) J_0$. Its reduction is exactly
  $ \( M R_(*) J_0 \) \( M R_(*) J_0 \)^(*) = M R_(*)^2 M =
    xor.big_beta beta^2 exp \( sqrt(8 t) thin H \[ N \] - 4 t upright("Id")_beta \) = sigma . $
  Finally Equation (6.3) transfers the approximation of these rectangular matrices to the approximation of their
    positive reduced square roots, proving Equation (6.25). ◻
]

The resulting description retains the weights $beta^2$ and the ordinary trace on every block.
  It supplies both a bounded matrix column and the input bound of Equation (6.18),
  while allowing any number of positive blocks and eigenvalues arbitrarily close to zero.
  These are the properties needed for the covariance observations in Section 7.

== 7 Covariance observations and the contradiction <sec:observations>

The matrices constructed in Section 6 describe fluctuations whose information content is incompatible with the
  logarithmic Sobolev inequality of the stationary law. We compare two bounds for the same Gaussian covariance
  observation. The first follows from logarithmic Sobolev and is universal after integration over its scale.
  The second uses the frozen matrices to recover a scalar lognormal covariance experiment.
  Integration over scale is essential: it assigns to every spectral block exactly the weight used by the tracial
  limit, regardless of the sizes of its eigenvalues.

Throughout this section, limits refer to the counterexample sequence.
  All observation times, caps, compact parameter intervals,
  and polynomial degrees are fixed before taking that limit. We suppress its index.
  Recall that $Y_t$ is stationary with law $eta$, that $R \( eta \) lt.eq lambda^(- 1)$ with $lambda arrow.r 1$,
  and that $R$ without a measure argument denotes the positive matrix field.
  In particular, Equations (6.2) and (6.7) give

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E) "tr" R^2 arrow.r 1 \, wide bb(E) \| D R \|^2 arrow.r 1 . $ <eq:obs-energy-input>]

To distinguish the original Sylvester matrices from the subsequently modified block matrices,
  denote the former by $hat(H)_i$. Equations (6.6) and (6.7) assert

#[#set math.equation(numbering: n => "(7.2)")
 $ D_i R = 1 / 2 \( hat(H)_i R + R hat(H)_i \) \, wide sum_i bb(E) parallel \[ hat(H)_i \, R \]
   parallel_(upright("HS"))^2 = o \( 1 \) . $ <eq:obs-sylvester-input>]

Only the upper bound below uses these original matrices.

Fix $L gt.eq 1$ and define

#[#set math.equation(numbering: n => "(7.3)")
 $ f_L \( q \) = frac(q, 1 + q \/ L) \, wide C_T \( y \) = upright("Id") + f_L \( T R \( y \)^2 \) \, wide Z_T =
   C_T \( Y_t \)^(1 \/ 2) G \, quad T > 0 \, $ <eq:obs-covariance-definition>]

where $G$ is an independent standard Gaussian vector. Thus $upright("Id") lt.eq
  C_T lt.eq \( 1 + L \) upright("Id")$. We write $H \( P divides Q \)$ for relative entropy and
  $sans(I) \( U \; V \)$ for mutual information, including the usual averaged conditional version when a
  conditioning variable is displayed.

=== 7.1 The integrated information upper bound <the-integrated-information-upper-bound>

#thm([Lemma 7.1.])[
  (Integrated spectral multipliers).  #emph[For $v \, w gt.eq 0$, not both zero, put
#[#set math.equation(numbering: n => "(7.4)")
 $ M_L \( v \, w \) = \( v + w \)^2 integral_0^oo
   frac(d T, \( 1 + T v^2 \/ L \) \( 1 + T w^2 \/ L \) \( 1 + \( 1 + 1 \/ L \) T v^2 \) \( 1 + \( 1 + 1 \/ L \) T
   w^2 \)) . $ <eq:obs-multiplier>]

 Set $M_L \( 0 \, 0 \) = 0$. Then
#[#set math.equation(numbering: n => "(7.5)")
 $ M_L \( v \, w \) lt.eq 4 log \( 1 + L \) quad upright("for all ") v \, w gt.eq 0 \, wide M_L \( v \, w \) lt.eq
   9 quad upright("if ") 1 / 2 lt.eq v \/ w lt.eq 2 . $ <eq:obs-multiplier-bounds>]

 The second bound concerns positive $v \, w$ and is independent of $L$.]
] <lem:obs-multipliers>

#proof[
  Write $a = 1 \/ L$ and $b = 1 + 1 \/ L$, so $b - a = 1$. If $r = max \( v \, w \) > 0$,
    discard the two denominator factors associated with the smaller eigenvalue and substitute $q = T r^2$. This gives
  $ M_L \( v \, w \) lt.eq 4 integral_0^oo frac(d q, \( 1 + a q \) \( 1 + b q \)) = 4 log \( b \/ a \) =
    4 log \( 1 + L \) . $
  For the identity in the middle, integration up to $Q$ gives $log \( 1 + b Q \) - log \( 1 + a Q \)$,
    which tends to $log \( b \/ a \)$. If $v \, w$ are positive and comparable as in the statement, let $r_0 =
    min \( v \, w \)$. Discard the two factors with coefficient $a$, and use $b gt.eq 1$.
    The remaining integral is at most $integral_0^oo \( 1 + T r_0^2 \)^(- 2) thin d T = r_0^(- 2)$.
    Since $v + w lt.eq 3 r_0$, this proves the second bound. ◻
]

#thm([Proposition 7.2.])[
  (Universal integrated upper bound).  #emph[There is an absolute constant $C_0$ such that,
    for every fixed $t > 0$ and $L gt.eq 1$, the observations in Equation (7.3) satisfy
#[#set math.equation(numbering: n => "(7.6)")
 $ limsup integral_0^oo sans(I) \( Y_t \; Z_T \) thin frac(d T, T^2) lt.eq C_0 . $ <eq:obs-information-upper>]

 In particular, one may take $C_0 = 9 \/ 4$.]
] <prop:information-upper>

#proof[
  Let $p_T \( z divides y \)$ denote the density of the centered Gaussian with covariance $C_T \( y \)$,
    and let $p_T \( z \)$ be its marginal density. For each output $z$,
    the posterior density with respect to $eta$ is $q_z \( y \) = p_T \( z divides y \) \/ p_T \( z \)$.
    Applying $2 lambda H lt.eq cal(I)$ to this density and then averaging in $z$ gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ 2 lambda sans(I) \( Y_t \; Z_T \) lt.eq bb(E) \| D_y log p_T \( Z_T divides Y_t \) \|^2 .
     $ <eq:obs-likelihood-lsi>]
  Here and below the expectation on the right includes the observation noise.
    The posterior normalization does not depend on $y$ and therefore does not contribute to the derivative.
  We compute that derivative explicitly. For any positive covariance $C$ and its derivative $D_i C$,
    differentiation of its determinant and inverse yields
  $ D_i log p \( z divides y \) = 1 / 2 (z^(*) C^(- 1) \( D_i C \) C^(- 1) z - "tr" \( C^(- 1) D_i C \)) . $
  Conditional on $y$, set $B_i = C^(- 1 \/ 2) \( D_i C \) C^(- 1 \/ 2)$ and $g = C^(- 1 \/ 2) z$.
    The vector $g$ is standard Gaussian. Expanding its fourth moments gives
    $bb(E) \( g^(*) B_i g - "tr" B_i \)^2 = 2 "tr" B_i^2$; indeed the three Gaussian pairings give
    $\( "tr" B_i \)^2 + 2 "tr" B_i^2$ before subtracting the mean. Consequently Equation (7.7) becomes
  #[#set math.equation(numbering: n => "(7.8)")
   $ sans(I) \( Y_t \; Z_T \) lt.eq frac(1, 4 lambda) bb(E) sum_i "tr" #scale(x: 120%, y: 120%)[\(] C_T^(- 1) D_i
     C_T thin C_T^(- 1) D_i C_T #scale(x: 120%, y: 120%)[\)] . $ <eq:obs-gaussian-fisher>]
  These calculations also apply to the Sobolev matrix field $R$.
    To see this without assuming additional regularity, fix $T \,
    L$ and the finite dimension of one member of the sequence.
    The map $R mapsto C_T$ has bounded derivative on positive semidefinite matrices,
    and its eigenvalues lie in $\[ 1 \, 1 + L \]$. For each fixed $z$,
    the map $C mapsto p \( z divides C \)^(1 \/ 2)$ has bounded derivative on this covariance interval.
    The Sobolev chain rule therefore puts $q_z^(1 \/ 2)$ in the form domain;
    $p_T \( z \) > 0$ and is a harmless fixed normalization. The Sobolev approximation at the opening of Section 2
    extends the logarithmic Sobolev inequality to this form-domain function.
    The squared derivatives integrate in $z$ to the nonnegative finite expression in Equation (7.8).
    Approximation in the form domain and Tonelli thus justify both that equation and the subsequent scale
    integration. The finite-dimensional bounds used for form-domain membership do not enter its numerical coefficient.
  In an eigenbasis of $R$, write $v \, w$ for the row and column eigenvalues. The covariance function is
  $ c_T \( v \) = 1 + f_L \( T v^2 \) = frac(1 + b T v^2, 1 + a T v^2) \, wide a = 1 \/ L \, quad b = 1 + 1 \/ L . $
  Its divided difference, including its derivative at $v = w$, is
  $ frac(c_T \( v \) - c_T \( w \), v - w) = frac(T \( v + w \), \( 1 + a T v^2 \) \( 1 + a T w^2 \)) . $
  Multiplying its square by $c_T \( v \)^(- 1) c_T \( w \)^(- 1)$ and integrating against $d T \/
    T^2$ gives exactly the multiplier in Equation (7.4) for the squared entry $\| \( D_i R \)_(v w) \|^2$.
    When $v = w = 0$, the covariance derivative is zero, which explains the value assigned to $M_L \( 0 \, 0 \)$.
  It remains to obtain a bound independent of the fixed cap.
    For noncomparable pairs with at least one positive eigenvalue, Equation (7.2) gives entrywise
  $ \| \( D_i R \)_(v w) \|^2 = frac(\( v + w \)^2, 4 \( v - w \)^2) \| \[ hat(H)_i \, R \]_(v w) \|^2 lt.eq 9 /
    4 \| \[ hat(H)_i \, R \]_(v w) \|^2 . $
  This includes a pair with exactly one zero eigenvalue. Their total expected derivative energy is therefore
    $o \( 1 \)$. The kernel–kernel derivative is zero almost everywhere,
    as established in the Sylvester construction, and in any case has zero covariance multiplier. Lemma 35 now yields
  $ integral_0^oo sans(I) \( Y_t \; Z_T \) thin frac(d T, T^2) lt.eq
    frac(1, 4 lambda) (9 bb(E) \| D R \|^2 + 4 log \( 1 + L \) thin o \( 1 \)) . $
  Take the sequence limit at this fixed $L$, and use Equation (7.1).
    Stationarity makes the bound independent of $t$. This proves the proposition.
    In particular, the cap-dependent bound on noncomparable pairs is used only before its vanishing error has been
    removed. ◻
]

=== 7.2 Stability on the entire scale interval <stability-on-the-entire-scale-interval>

We next transfer observations to the frozen covariance of Proposition 34.
  A bound on a compact interval of $T$ would not suffice, because the useful scale of a block depends on its
  eigenvalue. The following comparison holds on all positive scales.

#thm([Lemma 7.3.])[
  (Integrated covariance stability).  #emph[For $T > 0$ let $h_T \( v \) = sqrt(1 + f_L \( T v^2 \))$, $v gt.eq
    0$, and put
$ K_L = integral_0^oo frac(d q, \( 1 + q \/ L \)^3 \( 1 + \( 1 + 1 \/ L \) q \)) . $

 Then $0 < K_L lt.eq log \( 1 + L \)$, and for arbitrary positive semidefinite matrices $A \, B$ of the same size,
#[#set math.equation(numbering: n => "(7.9)")
 $ integral_0^oo parallel h_T \( A \) - h_T \( B \) parallel_(upright("HS"))^2 thin frac(d T, T^2) lt.eq
   K_L parallel A - B parallel_(upright("HS"))^2 . $ <eq:obs-matrix-stability>]

 Let $sigma$ be the frozen covariance in Proposition 34, and couple
$ tilde(Z)_T = \( upright("Id") + f_L \( T sigma \) \)^(1 \/ 2) G $

 to $Z_T$ using the same independent Gaussian. For every fixed $t \, L$,
#[#set math.equation(numbering: n => "(7.10)")
 $ integral_0^oo bb(E) \| Z_T - tilde(Z)_T \|^2 thin frac(d T, T^2) = o \( 1 \) . $ <eq:obs-observation-stability>]

]
] <lem:obs-integrated-stability>

#proof[
  Direct differentiation gives
  $ h'_T \( v \) = frac(T v, \( 1 + T v^2 \/ L \)^(3 \/ 2) \( 1 + \( 1 + 1 \/ L \) T v^2 \)^(1 \/ 2)) . $
  For $v > 0$, substitution $q = T v^2$ therefore shows
  $ integral_0^oo \| h'_T \( v \) \|^2 thin frac(d T, T^2) = K_L . $
  Discarding two of the three factors $1 + q \/ L$ bounds $K_L$ by the integral evaluated in Lemma 35,
    namely $log \( 1 + L \)$. If $v gt.eq w gt.eq 0$, the fundamental theorem of calculus and Cauchy–Schwarz give
  $ \| h_T \( v \) - h_T \( w \) \|^2 lt.eq \( v - w \) integral_w^v \| h'_T \( r \) \|^2 thin d r . $
  Integrating in $T$ and using Tonelli proves the scalar bound $K_L \( v - w \)^2$.
    The value of the derivative integral at the single endpoint $r = 0$ does not affect this argument,
    so it covers $w = 0$.
  Choose an orthonormal eigenbasis $\( e_a \)$ of $A$ with eigenvalues $v_a$ and an orthonormal eigenbasis
    $\( f_b \)$ of $B$ with eigenvalues $w_b$. The entry of their functional-calculus difference between these two
    bases is
  $ chevron.l e_a \, \( h_T \( A \) - h_T \( B \) \) f_b chevron.r = \( h_T \( v_a \) - h_T \( w_b \) \) chevron.l
    e_a \, f_b chevron.r . $
  Multiply the scalar bound by $\| chevron.l e_a \, f_b chevron.r \|^2$ and sum over $a \, b$.
    The sum on the right is $K_L parallel A - B parallel_(upright("HS"))^2$, proving Equation (7.9).
    Finally, conditional on all data except $G$, Gaussian isometry gives
  $ bb(E)_G \| Z_T - tilde(Z)_T \|^2 = parallel h_T \( R \( Y_t \) \) -
    h_T \( sigma^(1 \/ 2) \) parallel_(upright("HS"))^2 . $
  Apply the matrix bound and the squared-mean convergence in Proposition 34.
    The resulting factor $K_L$ is fixed while the sequence limit is taken. ◻
]

=== 7.3 Conditional information and blockwise tests <conditional-information-and-blockwise-tests>

Let $cal(D)$ be the initial position, random spectral partition, chosen orthonormal frame,
  and frozen block matrices from Proposition 34. Block formulas below use components in this $cal(D)$-measurable
  frame. Every information term $sans(I) \( Y_t \; Z_T \)$ continues to refer to the original observation in
  ambient coordinates; conditional on $cal(D)$, conversion to the block coordinates is invertible.
  Orthogonal invariance makes the components of the fresh Gaussian noise conditionally standard and independent of
  the diffusion data. Conditional on $cal(D)$, $N = B_t \/ sqrt(t)$ is standard Gaussian.
  On a positive block with rounded eigenvalue $beta$, write $H \[ v \] = sum_(i in beta) v_i H_i$.
  The frozen covariance is

#[#set math.equation(numbering: n => "(7.11)")
 $ sigma_beta = beta^2 exp #scale(x: 120%, y: 120%)[\(] sqrt(8 t) thin H \[ N \] -
   4 t upright("Id") #scale(x: 120%, y: 120%)[\)] . $ <eq:obs-frozen-covariance>]

All $H_i$ here are the modified matrices supported on their initial blocks.
  Their bounds, from Equations (6.18) and (6.17), will be used in the form

#[#set math.equation(numbering: n => "(7.12)")
 $ & S = sum_i H_i^2 lt.eq C upright("Id") \, wide parallel H \[ v \] parallel_(upright("HS"))^2 lt.eq C_1 \| v \|^2 \,\
 & tau \( upright("Id") \) arrow.r 1 \, wide tau \( \( S - upright("Id") \)^2 \) = o \( 1 \) \, wide
   sum_(i \, j) tau \( \| \[ H_i \, H_j \] \|^2 \) = o \( 1 \) . $ <eq:obs-block-bounds>]

The constants $C \, C_1 gt.eq 1$ are absolute. The entries of the three-index array $\( H_i \)_(a b)$ are also
  asymptotically symmetric in all three indices in the weighted squared norm. As before,

$ tau \( U \) = bb(E) sum_beta beta^2 "tr"_beta U_beta \, $

where expectation includes any Gaussian variables appearing in $U$.
  No trace in this definition or in Equation (7.12) is normalized by block dimension.

#thm([Lemma 7.4.])[
  (Conditional Ornstein–Uhlenbeck score).  #emph[Let $N$ be a standard Gaussian vector conditional on $cal(D)$,
    and let $Z$ be any observation for which $sans(I) \( N \; Z divides cal(D) \) < oo$.
    With independent standard Gaussian $G'$ set
$ N_u = alpha N + sqrt(1 - alpha^2) thin G' \, wide alpha = e^(- u) \, quad u > 0 . $

 The relative score of its posterior, with respect to the standard Gaussian marginal, is
#[#set math.equation(numbering: n => "(7.13)")
 $ D log p_(N_u divides Z \, cal(D)) / gamma \( N_u \) = frac(alpha, 1 - alpha^2)
   bb(E) \[ N - alpha N_u divides N_u \, Z \, cal(D) \] . $ <eq:obs-ou-score>]

 For every compact interval $cal(J) subset \( 0 \, oo \)$,
#[#set math.equation(numbering: n => "(7.14)")
 $ sans(I) \( N \; Z divides cal(D) \) gt.eq integral_(cal(J)) frac(alpha^2, \( 1 - alpha^2 \)^2) bb(E)
   lr(|bb(E) \[ N - alpha N_u divides N_u \, Z \, cal(D) \]|)^2 thin d u . $ <eq:obs-ou-information>]

 For the covariance observation in Equation (7.3),
#[#set math.equation(numbering: n => "(7.15)")
 $ sans(I) \( Y_t \; Z_T \) gt.eq sans(I) \( N \; Z_T divides cal(D) \) . $ <eq:obs-data-processing>]

]
] <lem:obs-ou-score>

#proof[
  Put $q = 1 - alpha^2$. Given a posterior law $pi \( d n \)$ of $N$ at fixed $\( Z \, cal(D) \)$,
    the density at $y$ after adding the OU noise is the integral of $\( 2 pi q \)^(- d \/ 2)
    exp \( - \| y - alpha n \|^2 \/ \( 2 q \) \)$ against $pi$.
    Differentiating this kernel and dividing by its integral gives
  $ D log p \( y divides Z \, cal(D) \) = - frac(y - alpha bb(E) \[ N divides N_u = y \, Z \, cal(D) \], q) . $
  The score of the standard Gaussian is $- y$. Subtracting it proves Equation (7.13).
    Kernel differentiation is justified first with $N$ truncated;
    on compact positive time intervals its derivatives are bounded by Gaussian kernels times polynomials,
    and truncation can then be removed by conditional second moments.
  The OU semigroup has generator $Delta - y dot.op D$. For a positive posterior density $r_u$ relative to $gamma$,
    integration by parts gives
  $ frac(d, d u) integral r_u log r_u thin d gamma = - integral frac(\| D r_u \|^2, r_u) thin d gamma . $
  This is the entropy dissipation calculation of Lemma 5; positive-time smoothing,
    truncation of the density and spatial cutoffs justify it for finite-entropy posteriors.
    Averaging over $\( Z \, cal(D) \)$ and integrating over $cal(J)$ bounds its nonnegative right side by the
    initial conditional information. Substitution of the score formula proves Equation (7.14).
  For the last assertion, observation noise is independent of the initial data and diffusion path,
    and its law depends on them only through $Y_t$. Hence $\( cal(D) \, N \) arrow.r Y_t arrow.r
    Z_T$ is a Markov chain. The chain rule and data processing give
  $ sans(I) \( N \; Z_T divides cal(D) \) lt.eq sans(I) \( cal(D) \, N \; Z_T \) lt.eq sans(I) \( Y_t \; Z_T \) . $
  These informations are finite for each member of the sequence:
    the covariance interval $\[ upright("Id") \, \( 1 + L \) upright("Id") \]$ bounds the output entropy from
    above by that of a Gaussian of covariance $\( 1 + L \) upright("Id")$ and bounds its conditional entropy from
    below by that of a standard Gaussian. Thus $sans(I) \( Y_t \; Z_T \) lt.eq \( d \/ 2 \)
    log \( 1 + L \)$ in dimension $d$. This finiteness assertion is used only to justify the identities. ◻
]

#thm([Lemma 7.5.])[
  (Block tests and the scale Jacobian).  #emph[Fix compact intervals $cal(J) \, cal(X) subset \( 0 \, oo \)$,
    and write $kappa \( u \) = alpha^2 \/ \( 1 - alpha^2 \)^2$, where $alpha = e^(- u)$.
    Let $P \( u \, x \, a \, b \)$ be a real polynomial, evaluated on matrices with any one fixed ordering of each
    monomial. On each positive block define
$ A_beta = H_beta \[ N_beta \] \, wide A_(u \, beta) = H_beta \[ \( N_u \)_beta \] \, wide B_(beta \, x) =
  H_beta \[ \( Z_(x \/ beta^2) \)_beta \] \, $

 and $P_(beta \, u \, x) = P \( u \, x \, A_(u \, beta) \, B_(beta \, x) \)$. Then
#[#set math.equation(numbering: n => "(7.16)")
 $ integral_0^oo sans(I) \( Y_t \; Z_T \) thin frac(d T, T^2) gt.eq  & integral_(cal(J)) integral_(cal(X))
   kappa \( u \) bb(E) sum_beta beta^2 "tr"_beta #scale(x: 120%, y: 120%)[\(] 2 \( A_beta - alpha A_(u \, beta) \)
   P_(beta \, u \, x)\
 & #h(43mm)  - C_1 P_(beta \, u \, x)^(*) P_(beta \, u \, x) #scale(x: 120%, y: 120%)[\)] thin frac(d x, x^2) thin
   d u . $ <eq:obs-block-test-bound>]

 Here the constant $C_1$ is the absolute constant in Equation (7.12).]
] <lem:obs-block-tests>

#proof[
  For a block, consider the linear map $cal(H) : v mapsto H \[ v \]$ between its Euclidean coordinate space and
    its matrix space with the ordinary Hilbert–Schmidt norm. Its adjoint is
  $ \( cal(H)^(*) Q \)_i = "tr" \( H_i Q \) \, $
  because $H_i$ is real symmetric. Taking the adjoint in Equation (7.12) gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ sum_i \| "tr" \( H_i Q \) \|^2 lt.eq C_1 "tr" \( Q^(*) Q \) . $ <eq:obs-adjoint-bound>]
  This step has no factor involving the dimension of the block.
  At fixed $u \, T$, select precisely those positive blocks for which $x = T beta^2 in cal(X)$. On a selected block set
  $ V_i =
    "tr"_beta #scale(x: 120%, y: 120%)[\(] H_i
    P \( u \, T beta^2 \, H \[ \( N_u \)_beta \] \, H \[ \( Z_T \)_beta \] \) #scale(x: 120%, y: 120%)[\)] \, wide
    i in beta \, $
  and set all other components, including those in the kernel, equal to zero.
    This vector is measurable with respect to $\( N_u \, Z_T \, cal(D) \)$.
    If $m = bb(E) \[ N - alpha N_u divides N_u \, Z_T \, cal(D) \]$, completing the square gives
  $ bb(E) \| m \|^2 gt.eq 2 bb(E) \( N - alpha N_u \) dot.op V - bb(E) \| V \|^2 . $
  The coordinates of distinct selected blocks are orthogonal.
    Their costs therefore add, and Equation (7.17) bounds the cost by $C_1$ times the sum of their unnormalized
    squared matrix norms. Their linear terms contract exactly to
  $ \( N - alpha N_u \) dot.op V = sum_(beta upright(" selected")) "tr"_beta
    #scale(x: 120%, y: 120%)[\(] \( H \[ N_beta \] - alpha H \[ \( N_u \)_beta \] \) P #scale(x: 120%, y: 120%)[\)] . $
  Substitute these two statements in Lemma 38 and integrate in $T$.
  For each realized positive block separately, the change of variable $x = T beta^2$ has the exact Jacobian
  #[#set math.equation(numbering: n => "(7.18)")
   $ T = x / beta^2 \, wide d T = frac(d x, beta^2) \, wide #box(stroke: black, inset: 3pt, [$ frac(d T, T^2) =
     beta^2 frac(d x, x^2) $]) . $ <eq:obs-scale-jacobian>]
  Thus the block selection becomes $x in cal(X)$, and the coefficient of each block trace becomes precisely
    $beta^2$. This proves Equation (7.16).
  For completeness, all its polynomial terms are integrable on the compact parameter rectangle.
    The moment bounds of Lemma 33 control $A_beta$ and $A_(u \, beta)$ under the weighted trace.
    Conditional on the initial data, diffusion path, and OU noise,
    $B_(beta \, x)$ is a Gaussian matrix series whose vector covariance is at most $\( 1 + L \) upright("Id")$.
    If its coefficients are $K_j = sum_i Q_(i j) H_i$ for a square root $Q$ of that covariance,
    then for every vector $v$
  $ sum_j \| K_j v \|^2 lt.eq \( 1 + L \) sum_i \| H_i v \|^2 lt.eq C \( 1 + L \) \| v \|^2 . $
  The same Gaussian even-moment proof therefore gives, for every fixed integer $p gt.eq 1$,
  #[#set math.equation(numbering: n => "(7.19)")
   $ bb(E)_G "tr"_beta \| B_(beta \, x) \|^(2 p) lt.eq \[ C \( 1 + L \) \]^p \( 2 p - 1 \) ! ! "tr"_beta
     upright("Id") . $ <eq:obs-gaussian-moment-bound>]
  Trace Hölder bounds each mixed word by its factors’ moments.
    After multiplying by $beta^2$ and summing, the right side is a constant times $tau \( upright("Id") \)$,
    which is finite and bounded along the sequence. The measure $kappa \( u \) thin d u thin d x \/
    x^2$ is finite on the chosen rectangle. Tonelli applies to the square terms,
    while these moment bounds justify Fubini for the linear terms.
    One can equivalently first truncate $V$ in the conditional-mean inequality and then remove that truncation in
    this integrated squared norm. ◻
]

=== 7.4 Transfer of the polynomial tests to scalar observations <transfer-of-the-polynomial-tests-to-scalar-observations>

The scale substitution has now produced the tracial weights of the matrix limit.
  We next identify that limit for the matrices containing the observation. Two replacements are needed:
  first replace $Z_T$ by its frozen version on the whole scale interval,
  and then use the approximate symmetry of the three-index array to move a bounded matrix function through
  $H \[ thin dot.op thin \]$.

#thm([Lemma 7.6.])[
  (Replacement in integrated polynomial tests).  #emph[In the notation of Lemma 39, put $tilde(B)_(beta \, x) =
    H_beta \[ \( tilde(Z)_(x \/ beta^2) \)_beta \]$. For every fixed polynomial in $u \, x \, A_beta \,
    A_(u \, beta) \, B_(beta \, x)$ and their adjoints, its weighted trace integral over $cal(J) times
    cal(X)$ changes by $o \( 1 \)$ if $B_(beta \, x)$ is replaced by $tilde(B)_(beta \, x)$.]
] <lem:obs-polynomial-replacement>

#proof[
  The flattening bound and the inverse substitution in Equation (7.18) give
  $ & bb(E) sum_beta beta^2 integral_(cal(X)) parallel B_(beta \, x) -
    tilde(B)_(beta \, x) parallel_(upright("HS"))^2 thin frac(d x, x^2)\
 & quad = integral_0^oo bb(E) sum_(beta : T beta^2 in cal(X)) parallel H_beta \[ \( Z_T - tilde(Z)_T \)_beta \]
   parallel_(upright("HS"))^2 thin frac(d T, T^2)\
 & quad lt.eq C_1 integral_0^oo bb(E) \| Z_T - tilde(Z)_T \|^2 thin frac(d T, T^2) = o \( 1 \) \, $
  by Lemma 37. All projected errors are summed before this comparison; no small block weight is divided out.
    Multiplication by the bounded weight $kappa \( u \)$ and integration in the compact interval $cal(J)$ preserve
    $o \( 1 \)$.
  To pass from this squared norm to arbitrary fixed products,
    include the parameter integrals in the finite tracial functional
  $ cal(T) \( U \) = integral_(cal(J)) integral_(cal(X)) kappa \( u \) bb(E) sum_beta beta^2 "tr"_beta
    U_(beta \, u \, x) thin frac(d x, x^2) thin d u . $
  Every matrix in the statement has bounded $L^p \( cal(T) \)$ norm for every fixed finite $p$.
    For $B$ this was proved in Equation (7.19); for $tilde(B)$ the same proof applies because its covariance is
    also at most $\( 1 + L \) upright("Id")$. The remaining matrices are covered by the Gaussian moment lemma.
    For any $q > p gt.eq 2$, interpolation with $1 \/ p = theta \/ 2 + \( 1 - theta \) \/ q$ gives
  $ parallel B - tilde(B) parallel_(L^p \( cal(T) \)) lt.eq parallel B -
    tilde(B) parallel_(L^2 \( cal(T) \))^theta parallel B - tilde(B) parallel_(L^q \( cal(T) \))^(1 - theta) =
    o \( 1 \) . $
  For lower powers, Hölder and boundedness of $cal(T) \( upright("Id") \)$ give the same conclusion.
    Expand the difference of two words of length $r$ by replacing one factor at a time.
    Trace Hölder with all exponents $r$ bounds each resulting trace by the product of its factors’
    $L^r \( cal(T) \)$ norms. The changed factor tends to zero and the others remain bounded.
    There are only finitely many such terms. This proves the claim,
    including polynomial squared norms and linear terms with $A - alpha A_u$. ◻
]

For fixed $t \, L$, define the scalar function

#[#set math.equation(numbering: n => "(7.20)")
 $ g_x \( v \) =
   sqrt(1 + f_L #scale(x: 120%, y: 120%)[\(] x e^(sqrt(8 t) thin v - 4 t) #scale(x: 120%, y: 120%)[\)]) \, wide
   x > 0 \, med v in bb(R) . $ <eq:obs-g-function>]

Then $1 lt.eq g_x lt.eq sqrt(1 + L)$. By Equation (7.11), the frozen observation on a block at $T =
  x \/ beta^2$ is exactly $g_x \( A_beta \) G_beta$. Thus $tilde(B)_(beta \, x) = H_beta \[ g_x \( A_beta \) G_beta \]$.

#thm([Lemma 7.7.])[
  (Polynomial density under exponential moments).  #emph[Let $nu$ be a finite positive measure on $bb(R)^k$ with
    $integral e^(a \| w \|) thin d nu \( w \) < oo$ for every $a > 0$.
    Polynomials are dense in $L^p \( nu \)$ for every $1 lt.eq p < oo$.]
] <lem:obs-polynomial-density>

#proof[
  Suppose a continuous linear functional on $L^p \( nu \)$ annihilates all polynomials.
    Its representing density $F$ belongs to $L^(p') \( nu \)$, where $p' = p \/ \( p - 1 \)$ and $p' = oo$ if $p =
    1$. Hölder and the hypothesis show that the finite signed measure $F thin d
    nu$ has exponential moments of every linear magnitude. For each $xi in bb(R)^k$, the function
  $ z mapsto integral e^(z xi dot.op w) F \( w \) thin d nu \( w \) $
  is entire: on every compact set of complex $z$, its derivatives are dominated by an integrable exponential.
    All its derivatives at zero vanish because $\( xi dot.op w \)^j$ is a polynomial.
    Its Taylor series and hence the entire function are zero.
    Evaluating at $z = upright(i)$ proves that the Fourier transform of $F thin d nu$ vanishes.
    Fourier uniqueness for finite measures can here be seen by convolving with a centered Gaussian:
    the convolution has zero Fourier transform and an integrable Fourier inversion formula,
    so is zero for every positive Gaussian variance; letting that variance tend to zero shows the original measure
    is zero. Thus $F = 0$ almost everywhere. Duality, or equivalently separation of a proper closed subspace,
    proves the density assertion. ◻
]

#thm([Lemma 7.8.])[
  (Nonlinear mixed trace law).  #emph[Let $n \, g' \, g$ be independent scalar standard Gaussians and let $n_u =
    alpha n + sqrt(1 - alpha^2) thin g'$. For every fixed mixed polynomial, the weighted trace moments of
$ #scale(x: 120%, y: 120%)[\(] A_beta \, A_(u \, beta) \, tilde(B)_(beta \, x) #scale(x: 120%, y: 120%)[\)] $

 converge to the corresponding scalar moments of
$ #scale(x: 120%, y: 120%)[\(] n \, n_u \, g_x \( n \) g #scale(x: 120%, y: 120%)[\)] . $

 The assertion holds after integration over compact positive $u \,
   x$ intervals against $kappa \( u \) thin d u thin d x \/ x^2$, and permits fixed polynomial dependence on $u \,
   x$. Adjoints in a matrix word become the identical real scalar factors in its limit.]
] <lem:obs-nonlinear-trace-law>

#proof[
  First we prove the matrix comparison
  #[#set math.equation(numbering: n => "(7.21)")
   $ H \[ g_x \( A \) G \] - g_x \( A \) H \[ G \] arrow.r 0 quad
     upright("in weighted squared Hilbert–Schmidt norm") . $ <eq:obs-index-swap-comparison>]
  All notation in this calculation is on one block. Define
  $ J \( v \)_(a b) = \( H_b v \)_a \, wide D \( v \) = H \[ v \] - J \( v \) \, wide
    Delta_(a b i) = \( H_i \)_(a b) - \( H_b \)_(a i) . $
  Put $q = g_x \( A \)$ and $B = H \[ G \]$. The exact columnwise identity is
  #[#set math.equation(numbering: n => "(7.22)")
   $ H \[ q G \] - q B = D \( q G \) + K - q D \( G \) \, wide
     K_(dot.op b) = \[ H_b \, q \] G . $ <eq:obs-index-swap-identity>]
  Indeed the $b$th column of $J \( q G \) - q J \( G \)$ is $H_b q G - q H_b G$.
    Conditional Gaussian averaging therefore bounds the square of the left side by
  #[#set math.equation(numbering: n => "(7.23)")
   $ 6 \( 1 + L \) sum_(a \, b \, i) \| Delta_(a b i) \|^2 +
     3 sum_b parallel \[ H_b \, g_x \( A \) \] parallel_(upright("HS"))^2 . $ <eq:obs-index-swap-error>]
  For the first and last terms in Equation (7.22), we used $parallel q parallel_(upright("op")) lt.eq
    sqrt(1 + L)$ and the Gaussian isometry for the linear map $D$.
  The function $g_x$ is Lipschitz with a bound depending only on $t \, L$, uniformly for all $x > 0$.
    In fact, with $a = sqrt(8 t)$ and $r = x e^(a v - 4 t) \/ L$, differentiation gives
  $ \| g'_x \( v \) \| = frac(a L r, 2 \( 1 + r \)^2 g_x \( v \)) lt.eq frac(a L, 8) . $
  In an eigenbasis of $A$ with eigenvalues $r_a$, the squared commutator norm is
  $ parallel \[ H_b \, g_x \( A \) \] parallel_(upright("HS"))^2 =
    sum_(a \, c) \| \( H_b \)_(a c) \|^2 \| g_x \( r_c \) - g_x \( r_a \) \|^2 lt.eq
    "Lip" \( g_x \)^2 parallel \[ H_b \, A \] parallel_(upright("HS"))^2 . $
  This is a scalar Lipschitz estimate for matrix entries in the Hilbert–Schmidt norm.
    Averaging $A = sum_i N_i H_i$ over $N$ gives
  $ bb(E)_N sum_b parallel \[ H_b \, A \] parallel_(upright("HS"))^2 =
    sum_(b \, i) parallel \[ H_b \, H_i \] parallel_(upright("HS"))^2 . $
  Multiply Equation (7.23) by the block weight, sum, and average.
    The total symmetry defect and Equation (7.12) prove Equation (7.21), uniformly in $x$ at fixed $t \, L$.
  Every fixed higher moment of both sides of this comparison is bounded.
    Conditional on $A$ and the initial data, $H \[ g_x \( A \) G \]$ is a Gaussian matrix series with
    coefficient-square sum at most $\( 1 + L \) S$, by the quadratic-form argument used in Equation (7.19).
    Also the Schatten ideal inequality gives
  $ parallel g_x \( A \) H \[ G \] parallel_p lt.eq sqrt(1 + L) thin parallel H \[ G \] parallel_p $
  on each block. Interpolation and telescoping products, exactly as in Lemma 40,
    show that these two matrices may be interchanged in every fixed polynomial trace.
  It remains to identify traces containing $g_x \( A \) H \[ G \]$.
    Lemma 33 gives the joint scalar Gaussian moment law for $A = H \[ N \]$, $H \[ G' \]$, and $H \[ G \]$.
    In particular, $A_u = alpha A + sqrt(1 - alpha^2) H \[ G' \]$ has the required joint law with them.
    To include the bounded continuous function $g_x \( A \)$, fix $x$ and a mixed word of length $r$.
    Choose a polynomial $p$ approximating $g_x$ in a sufficiently high finite $L^q \( gamma_1 \)$ norm,
    where $gamma_1$ is the scalar standard Gaussian law. Choose $q$ larger than all the Hölder exponents needed
    for this fixed word, and take the approximation error at most $1$;
    then $parallel p parallel_(L^q \( gamma_1 \)) lt.eq sqrt(1 + L) + 1$.
    Such approximations exist by the polynomial-density argument in Lemma 41, applied to one Gaussian coordinate.
    The scalar spectral measures of $A$ under $tau$ converge to $gamma_1$ by the moment and exponential-moment
    bounds in Lemma 33. Their higher moments are uniformly bounded. Consequently, for even $q$,
  #[#set math.equation(numbering: n => "(7.24)")
   $ tau #scale(x: 120%, y: 120%)[\(] \| g_x \( A \) - p \( A \) \|^q #scale(x: 120%, y: 120%)[\)] arrow.r
     bb(E) \| g_x \( n \) - p \( n \) \|^q . $ <eq:obs-functional-approximation>]
  To justify this last passage directly, cut the scalar spectral variable off at $\| v \| lt.eq M$,
    use weak convergence for the bounded continuous integrand there,
    and bound the complement by a higher uniform moment of $A$.
    Since $g_x$ is bounded and $p$ has fixed degree, that tail tends to zero as $M arrow.r oo$.
  Replace each occurrence of $g_x \( A \)$ by $p \( A \)$. Telescoping the word and applying trace Hölder bounds
    the replacement error by a constant times the $L^q$ error in Equation (7.24),
    with all other factors controlled by fixed higher moments.
    For factors $p \( A \)$, the preceding $L^q$ bound and moment convergence give a bound independent of how
    accurately $p$ approximates $g_x$. Thus the error constant stays bounded as that approximation is improved.
    The remaining word is polynomial in the three independent Gaussian matrix series,
    so its trace has the scalar Gaussian limit. Let the scalar approximation error tend to zero.
    This proves the claimed limit at each fixed $u \, x$; the scalar third coordinate is $g_x \( n \) g$.
  Finally, the moment bounds for the original, bounded function $g_x$ are uniform on the compact parameter
    rectangle, as are the bounds on polynomial coefficients in $u \, x$ and on $alpha$.
    They dominate each mixed trace by an integrable constant.
    Dominated convergence thus permits parameter integration.
    This last argument uses the uniform bounds for $g_x$ itself,
    and does not require choosing one polynomial approximant uniformly in $x$. ◻
]

The preceding lemmas identify the polynomial tests of the actual observation with those of the scalar variance
  mixture. We can now optimize the tests and integrate the scalar OU dissipation.
  The constant in the resulting comparison is exactly the constant of the unnormalized flattening estimate.

#thm([Proposition 7.9.])[
  (Scalar information lower bound).  #emph[For every fixed $t > 0$ and $L gt.eq 1$,
    let $g_x$ be defined by Equation (7.20), and let $n \, g$ be independent scalar standard Gaussians. Then
#[#set math.equation(numbering: n => "(7.25)")
 $ liminf integral_0^oo sans(I) \( Y_t \; Z_T \) thin frac(d T, T^2) gt.eq
   C_1^(- 1) integral_0^oo sans(I) #scale(x: 120%, y: 120%)[\(] n \;
   g_x \( n \) g #scale(x: 120%, y: 120%)[\)] thin frac(d x, x^2) . $ <eq:obs-information-lower>]

 The constant $C_1$ is universal and is independent of $t \, L$.]
] <prop:information-lower>

#proof[
  Fix compact positive intervals $cal(J) \, cal(X)$, and let $n \, g' \,
    g$ be independent scalar standard Gaussians. Write $n_u = alpha n + sqrt(1 - alpha^2) thin g'$,
    and fix a scalar polynomial $P \( u \, x \, a \, b \)$. Give its matrix version any fixed ordering of the
    factors of each monomial. Lemmas 39, 40, and 42, in that order, imply
  #[#set math.equation(numbering: n => "(7.26)")
   $ & liminf integral_0^oo sans(I) \( Y_t \; Z_T \) thin frac(d T, T^2)\
 & quad gt.eq integral_(cal(J)) integral_(cal(X)) kappa \( u \) bb(E) #scale(x: 120%, y: 120%)[\[]
   2 \( n - alpha n_u \) P \( u \, x \, n_u \, g_x \( n \) g \)\
 & #h(58mm)  - C_1 P \( u \, x \, n_u \, g_x \( n \) g \)^2 #scale(x: 120%, y: 120%)[\]] thin frac(d x, x^2) thin
   d u . $ <eq:obs-scalar-test-bound>]
  If the matrix polynomial is not symmetric, its prelimit cost is $"tr" \( P^(*) P \)$ as in Equation (7.16).
    The mixed trace law takes this cost to the real scalar $P^2$, so symmetry of the chosen ordering is unnecessary.
  The sequence limit in Equation (7.26) has been taken for each fixed polynomial.
    We now optimize the tests in one squared-mean space containing the compact parameters.
    Give $\( u \, x \)$ the finite measure $kappa \( u \) thin d u thin d x \/ x^2$ on $cal(J) times cal(X)$,
    independently of the scalar Gaussians $n \, g' \, g$, and put
  #[#set math.equation(numbering: n => "(7.27)")
   $ W = \( u \, x \, n_u \, g_x \( n \) g \) \, wide r = n - alpha n_u . $ <eq:obs-scalar-observed-vector>]
  The first two coordinates of $W$ are bounded. At each fixed $u \, x$, the variable $n_u$ is standard Gaussian,
    and $\| g_x \( n \) g \| lt.eq sqrt(1 + L) \| g \|$. Cauchy–Schwarz therefore gives all linear exponential
    moments for its finite law, uniformly on the compact parameter rectangle.
    Lemma 41 shows that polynomials in the four coordinates of $W$ are dense in this $L^2$ space.
  Since $bb(E) \[ r^2 divides u \, x \] = 1 - alpha^2 lt.eq 1$, the conditional mean $m \( W \) =
    bb(E) \[ r divides W \]$ belongs to the same space. For the finite joint measure just defined,
    completion of the square gives
  $ integral #scale(x: 120%, y: 120%)[\(] 2 r P \( W \) - C_1 P \( W \)^2 #scale(x: 120%, y: 120%)[\)] =
    C_1^(- 1) integral m^2 - C_1 integral \( P - m \/ C_1 \)^2 . $
  Density makes the infimum of the final squared error zero,
    using single four-variable polynomials in the integrated space.
    Taking their supremum and then disintegrating with respect to $\( u \, x \)$ turns the right side of
    Equation (7.26) into
  #[#set math.equation(numbering: n => "(7.28)")
   $ C_1^(- 1) integral_(cal(J)) integral_(cal(X)) frac(alpha^2, \( 1 - alpha^2 \)^2) bb(E)
     lr(|bb(E) \[ n - alpha n_u divides n_u \, g_x \( n \) g \]|)^2 thin frac(d x, x^2) thin d u .
     $ <eq:obs-scalar-score-lower>]
  The conditional expectation here is taken at each fixed $u \, x$.
    All approximation constants used before this optimization may depend on the fixed polynomial, $t \, L$,
    and the compact intervals. The coefficient $C_1$ depends only on Equation (7.17).
  We verify the scalar information identity including its endpoints. Fix $x > 0$ and write $z_x = g_x \( n \) g$.
    Its information is finite: conditional variance lies in $\[ 1 \, 1 + L \]$, so Gaussian entropy comparison gives
  #[#set math.equation(numbering: n => "(7.29)")
   $ 0 lt.eq sans(I) \( n \; z_x \) lt.eq 1 / 2 log \( 1 + L \) . $ <eq:obs-scalar-information-finite>]
  Indeed $bb(E) z_x^2 lt.eq 1 + L$ bounds its entropy above by $1 / 2 log \( 2 pi e \( 1 + L \) \)$,
    while its conditional entropy is $1 / 2 log \( 2 pi e \) + bb(E) log g_x \( n \)$ and is at least $1 /
    2 log \( 2 pi e \)$. Apply the scalar version of Lemma 38 and its entropy dissipation identity between times
    $a$ and $b$, where $0 < a < b < oo$. This gives
  $ sans(I) \( n_a \; z_x \) - sans(I) \( n_b \; z_x \) = integral_a^b frac(alpha^2, \( 1 - alpha^2 \)^2) bb(E)
    lr(|bb(E) \[ n - alpha n_u divides n_u \, z_x \]|)^2 thin d u . $
  As $a arrow.b 0$, the joint pair $\( n_a \, z_x \)$ converges in law to $\( n \, z_x \)$.
    Lower semicontinuity of relative entropy, applied to the joint law and the product of its marginals,
    gives $sans(I) \( n \; z_x \) lt.eq liminf_(a arrow.b 0) sans(I) \( n_a \; z_x \)$.
    The reverse inequality follows from the Markov chain $z_x arrow.r n arrow.r n_a$ and data processing.
    Thus the initial endpoint is exactly $sans(I) \( n \; z_x \)$. At the other endpoint, the same chain gives
  $ 0 lt.eq sans(I) \( n_u \; z_x \) lt.eq sans(I) \( n_u \; n \) = - 1 / 2 log \( 1 - alpha^2 \) arrow.r 0 . $
  The equality follows by subtracting the conditional Gaussian entropy of variance $1 -
    alpha^2$ from that of the standard Gaussian marginal. We have proved
  #[#set math.equation(numbering: n => "(7.30)")
   $ sans(I) \( n \; z_x \) = integral_0^oo frac(alpha^2, \( 1 - alpha^2 \)^2) bb(E)
     lr(|bb(E) \[ n - alpha n_u divides n_u \, z_x \]|)^2 thin d u . $ <eq:obs-scalar-ou-identity>]
  Finally exhaust both positive parameter axes by compact intervals in Equation (7.28).
    Its integrand is nonnegative. Monotone convergence and Equation (7.30) prove Equation (7.25).
    In particular, the polynomial optimization and the exhaustion take place after the counterexample-sequence
    limit, so neither requires a uniform approximation over unbounded parameters. ◻
]

=== 7.5 Divergence of the scalar scale integral <divergence-of-the-scalar-scale-integral>

The upper and lower comparisons are now in the same information units, with universal constants $C_0 \, C_1$.
  To contradict them, it suffices to let the fixed diffusion time and the fixed covariance cap grow together.
  The following elementary test detects the large values of the scalar lognormal variance.

#thm([Lemma 7.10.])[
  (Scalar information divergence).  #emph[Let $n \, g$ be independent scalar standard Gaussians and, for $t gt.eq
    1$, define
$ ell = exp \( sqrt(8 t) thin n - 4 t \) \, wide z_x = sqrt(1 + f_t \( x ell \)) thin g . $

 There are absolute constants $c > 0$ and $h_0 gt.eq 1$ such that, for all $t gt.eq h_0$,
#[#set math.equation(numbering: n => "(7.31)")
 $ integral_0^oo sans(I) \( n \; z_x \) thin frac(d x, x^2) gt.eq
   c bb(E) #scale(x: 120%, y: 120%)[\[] ell upright(bold(1))_({ ell gt.eq e^(2 t) }) #scale(x: 120%, y: 120%)[\]]
   log \( t \/ h_0 \) gt.eq c / 2 log \( t \/ h_0 \) . $ <eq:obs-scalar-divergence>]

]
] <lem:scalar-divergence>

#proof[
  The Gaussian moment generating formula gives $bb(E) ell = 1$.
    Let $P_(x \, n)$ be the conditional law of $z_x$ given $n$, and let $Q_x$ be its marginal law. Thus
  $ sans(I) \( n \; z_x \) = bb(E)_n H \( P_(x \, n) divides Q_x \) . $
  Set $p_0 = bb(P) { \| g \| gt.eq sqrt(2) } > 0$. Suppose first that $ell gt.eq e^(2 t)$,
    and choose a scale with $h = x ell in \[ h_0 \, t \]$. Since $h lt.eq t$,
  $ "Var" \( z_x divides n \) = 1 + frac(h, 1 + h \/ t) gt.eq h \/ 2 . $
  It follows that the event $A_h = { \| z \| gt.eq sqrt(h) }$ has conditional probability $p =
    P_(x \, n) \( A_h \) gt.eq p_0$.
  To bound its marginal probability, use an independent variable $ell'$ with the law of $ell$.
    On $x ell' lt.eq 1$, the conditional variance of the mixture component is at most $2$,
    so its probability of $A_h$ is at most $2 e^(- h \/ 4)$ by the Gaussian exponential bound.
    On the complementary event, Markov’s inequality and $bb(E) ell' = 1$ give probability at most $x$. Hence
  #[#set math.equation(numbering: n => "(7.32)")
   $ q = Q_x \( A_h \) lt.eq 2 e^(- h \/ 4) + x lt.eq 2 e^(- h \/ 4) + t e^(- 2 t) lt.eq
     3 e^(- h \/ 4) . $ <eq:obs-binary-marginal-bound>]
  The last inequality holds for $t gt.eq 1$ and $h lt.eq t$, because $t e^(- 2 t) lt.eq e^(- t \/ 4) lt.eq
    e^(- h \/ 4)$.
  Apply data processing to the event indicator. The binary relative entropy is bounded below by
  $ H \( P_(x \, n) divides Q_x \) & gt.eq p log \( p \/ q \) + \( 1 - p \) log
    #scale(x: 120%, y: 120%)[\(] \( 1 - p \) \/ \( 1 - q \) #scale(x: 120%, y: 120%)[\)]\
 & gt.eq p log \( 1 \/ q \) - log 2\
 & gt.eq p_0 \( h \/ 4 - log 3 \) - log 2 . $
  Choose once and for all
  $ h_0 gt.eq max { 1 \, thin 8 log 3 + 8 log 2 \/ p_0 } \, wide c = p_0 \/ 8 . $
  The preceding expression is then at least $c h$ for $h in \[ h_0 \, t \]$.
    This entropy estimate is made separately for each conditional law $P_(x \, n)$;
    the chosen event may therefore depend on $n$ through $h = x ell$.
  Nonnegativity of relative entropy permits restricting the scale integral to these choices of $n$ and $x$.
    Tonelli and the change of variable $x = h \/ ell$ yield
  $ integral_0^oo sans(I) \( n \; z_x \) thin frac(d x, x^2) & gt.eq
    bb(E)
    [upright(bold(1))_({ ell gt.eq e^(2 t) }) integral_(h_0 \/ ell)^(t \/ ell) H \( P_(x \, n) divides Q_x \) thin
    frac(d x, x^2)]\
 & gt.eq c bb(E) [ell upright(bold(1))_({ ell gt.eq e^(2 t) }) integral_(h_0)^t frac(d h, h)]\
 & = c bb(E) #scale(x: 120%, y: 120%)[\[] ell upright(bold(1))_({ ell gt.eq e^(2 t) })
   #scale(x: 120%, y: 120%)[\]] log \( t \/ h_0 \) . $
  Under the probability change of measure with density $ell$,
    completion of the square makes $n$ a Gaussian of mean $sqrt(8 t)$ and variance $1$.
    Therefore $log ell$ under that measure is Gaussian of mean $4 t$ and variance $8 t$.
    If $Phi$ is the standard Gaussian distribution function, then
  $ bb(E) #scale(x: 120%, y: 120%)[\[] ell upright(bold(1))_({ ell gt.eq e^(2 t) }) #scale(x: 120%, y: 120%)[\]] =
    Phi \( sqrt(t \/ 2) \) gt.eq 1 / 2 . $
  This proves both inequalities in Equation (7.31). ◻
]

#proof[
  Suppose that the asserted dimension-free bound fails. Lemma 7 gives compact centered counterexamples with
    normalized logarithmic Sobolev constant $1$ and linear subgaussian parameter tending to zero.
    Proposition 14 shows that their positive-time regularized constants converge to $1$.
    Proposition 15 supplies the stationary laws and near-eigenfunction fields at the fixed regularization time
    $s = 1 \/ 8$, in either the strict entropy branch or the spectral gap branch.
    Proposition 18 gives the exact prediction curve in both cases.
    Proposition 20 then gives the symmetric tensor hierarchy,
    and Proposition 34 constructs its matrix square root and frozen block description.
    These are precisely the inputs used in the present section.
  For each fixed $t > 0$ and $L gt.eq 1$, combine Propositions 36 and 43. They give
  #[#set math.equation(numbering: n => "(7.33)")
   $ integral_0^oo sans(I) (n \; sqrt(1 + f_L \( x e^(sqrt(8 t) thin n - 4 t) \)) thin g) thin frac(d x, x^2)
     lt.eq C_0 C_1 \, $ <eq:obs-final-scalar-bound>]
  where $C_0 C_1$ is independent of both fixed parameters. Choose an arbitrarily large but finite $t gt.eq
    h_0$ and the fixed cap $L = t$. Lemma 44 makes the left side at least $\( c \/ 2 \) log \( t \/ h_0 \)$,
    which exceeds $C_0 C_1$ for a sufficiently large choice of $t$. This is a contradiction.
  All counterexample limits used to obtain Equation (7.33) were taken with this $t \, L$ fixed.
    Only afterward was their numerical size chosen. Thus no uniform estimate on the intermediate errors as $t \,
    L arrow.r oo$ is needed. The contradiction excludes an unbounded ratio $R \( mu \) \/
    a^2$ over the measures in the theorem. Finally the convention $"Ent"_mu \( f^2 \) lt.eq
    2 R \( mu \) integral \| D f \|^2 thin d mu$ absorbs the factor $2$ into a universal constant and gives the
    asserted inequality for every smooth compactly supported real test function. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
