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

#align(center)[#text(size: 16pt, weight: "bold")[Full support of the zero-temperature \
Sherrington--Kirkpatrick order parameter]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

For independent standard Gaussian variables $J_(i j)$ and spins $sigma in { - 1 \, 1 }^n$, the pure Sherrington–Kirkpatrick (SK) Hamiltonian with no external field is

$ H_n \( sigma \) = 1 / sqrt(n) sum_(i < j) J_(i j) sigma_i sigma_j . $

Its ground-state problem asks for the limiting maximum energy per spin. The Parisi variational formula expresses this value through an order parameter encoding a hierarchy of overlap scales. Infinitely many scales need not fill an interval; the question studied here is whether every scale below one belongs to the zero-temperature support.

We first specify the variational problem, including the convention at the left endpoint. Let $cal(U)$ be the set of nonnegative, nondecreasing, right-continuous functions $gamma : \[ 0 \, 1 \) arrow.r \[ 0 \, oo \)$ satisfying $integral_0^1 gamma \( t \) thin upright(d) t < oo$. The Stieltjes measure $mu_gamma$ on $\[ 0 \, 1 \)$ is defined by

$ mu_gamma \( \[ 0 \, t \] \) = gamma \( t \) \, #h(2em) 0 lt.eq t < 1 . $

In particular $mu_gamma \( { 0 } \) = gamma \( 0 \)$. It is locally finite, but need not be a probability measure or have finite total mass. All support statements below use the relative topology of $\[ 0 \, 1 \)$.

For $gamma in cal(U)$, define the Parisi value function by

#[#set math.equation(numbering: n => "(1.1)")
 $ Phi_gamma \( t \, x \) = sup_(\| a \| lt.eq 1) bb(E) [lr(|x + B_1 - B_t + integral_t^1 gamma \( s \) a_s thin upright(d) s|) - 1 / 2 integral_t^1 gamma \( s \) a_s^2 thin upright(d) s] . $ <eq:model-control>]

Here $B$ is standard Brownian motion and the supremum is over progressively measurable controls $a_s in \[ - 1 \, 1 \]$, adapted to its increments after time $t$. This is the solution, obtained by monotone-coefficient approximation, of

#[#set math.equation(numbering: n => "(1.2)")
 $ Phi_t = - 1 / 2 \( Phi_(x x) + gamma \( t \) Phi_x^2 \) \, #h(2em) Phi \( 1 \, x \) = \| x \| . $ <eq:model-pde>]

Section 2 proves the regularity and approximation facts we use, directly from the heat equation and (1.1). The functional to be minimized is

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(P) \( gamma \) = Phi_gamma \( 0 \, 0 \) - 1 / 2 integral_0^1 t gamma \( t \) thin upright(d) t . $ <eq:model-functional>]

This normalization has covariance $xi \( t \) = t^2 \/ 2$, hence $xi'' = 1$. For two spin configurations with overlap $R_12 = n^(- 1) sum_i sigma_i^1 sigma_i^2$, the covariance is $bb(E) H_n \( sigma^1 \) H_n \( sigma^2 \) = n R_12^2 \/ 2 - 1 \/ 2$. Adding an independent centered Gaussian of variance $1 \/ 2$, constant across spin configurations, gives exactly $n xi \( R_12 \)$ and leaves the expected maximum unchanged. The zero-temperature Parisi formula and its attainment give#footnote[The normalized maximum is a Lipschitz function of the Gaussian disorder with constant $sqrt(\( n - 1 \) \/ \( 2 n^2 \))$. Gaussian concentration makes its difference from its expectation tend to zero in probability. Together with the almost-sure ground-state limit in the cited formula, this implies convergence of the expectations to the same constant.]

#[#set math.equation(numbering: n => "(1.4)")
 $ P_(*) := lim_(n arrow.r oo) 1 / n bb(E) max_sigma H_n \( sigma \) = min_(gamma in cal(U)) cal(P) \( gamma \) . $ <eq:model-ground-state>]

We use this established formula and existence theorem from Auffinger and Chen #cite(label("AC2017")) Theorem 1 and the proof of Lemma 3. The proof of the support assertion itself applies to any minimizer of the explicitly defined functional (1.3).

Write $u_gamma = Phi_(gamma \, x)$ and define its controlled diffusion by

#[#set math.equation(numbering: n => "(1.5)")
 $ upright(d) X_t = gamma \( t \) u_gamma \( t \, X_t \) thin upright(d) t + upright(d) B_t \, #h(2em) X_0 = 0 . $ <eq:model-diffusion>]

The drift is bounded and Lipschitz in space on every compact time strip; its absolute value is bounded by the integrable function $gamma$. Thus this equation has a unique strong solution up to time one, as proved in Lemma 3.

#thm([Theorem 1.1.])[
  (Full support at zero temperature).  #emph[If $gamma in cal(U)$ minimizes $cal(P)$, then 
$ "supp" mu_gamma = \[ 0 \, 1 \) . $

 In particular $gamma \( b \) > gamma \( a \)$ whenever $0 lt.eq a < b < 1$. For the solution of (1.5), 
#[#set math.equation(numbering: n => "(1.6)")
 $ bb(E) \[ u_gamma \( t \, X_t \)^2 \] = t \, #h(2em) bb(E) \[ Phi_(gamma \, x x) \( t \, X_t \)^2 \] = 1 \, #h(2em) 0 lt.eq t < 1 . $ <eq:main-consistency>]

]
] <thm:full-support>

Chen #cite(label("Chen2026")) Theorem 1.3 proves the same full-relative-support conclusion, together with smooth absolute continuity of the minimizing Stieltjes measure. The present proof excludes gaps through an explicit rational coercive identity and an unconditional strict-curvature inequality on positive constant intervals. Corollary 15 recovers $gamma in C^oo \( \[ 0 \, 1 \) \)$ and $gamma \( 0 \) = 0$ by the consistency and polynomial-moment argument of #cite(label("Chen2026")) Proposition 4.6 and Appendix B.6. A fixed-time approximation by constant intervals then transfers our coercive bound to the minimizer and gives $gamma' \( t \) > 0$ for $0 < t < 1$. Thus $mu_gamma = gamma' \( t \) thin upright(d) t$ has a smooth density which is strictly positive away from zero. We also develop the scalar martingale value representation and finite Gaussian coefficients in Section 7, and apply the optimization theorem of El Alaoui, Montanari, and Sellke in Corollary 18.

Zero external field is used in the evenness of $Phi$ and the initial condition $X_0 = 0$; the constant value of $xi''$ is used in the curvature identities. Neither a nonzero-field extension nor an extension to a general mixed-spin covariance is implicit in the statement.

=== 1.1 Prior work and the distinction between support assertions <prior-work-and-the-distinction-between-support-assertions>

Sherrington and Kirkpatrick introduced the infinite-range Gaussian Ising spin-glass model #cite(label("SK1975")). Parisi proposed a hierarchy of replica-symmetry breaking described by a functional order parameter #cite(label("Parisi1979")); its interpretation through overlaps was developed subsequently #cite(label("Parisi1983")). Guerra established the interpolation bound for the Parisi variational expression #cite(label("Guerra2003")), and Talagrand proved the Parisi formula for the SK free energy at every positive temperature #cite(label("Talagrand2006")). Identifying the support of the minimizing order parameter is a separate question from proving that variational formula.

The zero-temperature variational problem is part of the rigorous Parisi theory developed by Auffinger and Chen #cite(label("AC2017")). The control formulation has antecedents in the Brownian variational representation of Boué and Dupuis #cite(label("BD1998")) and the diffusion-control representation of the Parisi equation in Bovier and Klimovsky #cite(label("BK2009")) Section 6.2. Auffinger and Chen #cite(label("AC2015")) and Jagannath and Tobasco #cite(label("JT2016")) developed stochastic-control, strict-convexity, and gradient-martingale arguments for this equation. Chen, Handschy, and Lerman #cite(label("CHL2018")) Propositions 2–4, Theorems 4–5, and Lemma 3 give zero-temperature regularity, control, uniqueness, and variation interfaces. We prove the analytic and variational facts needed here, including global-in-space derivative convergence on compact time strips, rather than presume that a smooth-terminal statement applies at the terminal cusp $\| x \|$.

Auffinger, Chen, and Zeng proved that the zero-temperature SK order parameter has infinitely many support points #cite(label("ACZ2017")) Theorem 1. They also recorded the exclusion of a terminal constant interval #cite(label("ACZ2017")) Remark 7; Section 6 supplies a detailed boundary-layer proof of that endpoint fact. Infinite support and absence of a terminal plateau do not exclude an interior gap. The main issue here is the elimination of every such gap.

At positive temperature, Zhou #cite(label("Zhou2026")) Theorem 1 established an interval-support result near the critical temperature, and Lopatto #cite(label("Lopatto2026")) Theorem 1.1 established full interval support throughout the zero-field SK low-temperature phase. Lopatto’s proof propagates inequalities for Cole–Hopf profiles and a transformed diffusion density before applying a constant-interval crossing argument #cite(label("Lopatto2026")) Sections 3, 7–9. Chen’s zero-temperature analysis also uses transformed-density inequalities and smooth-terminal approximation #cite(label("Chen2026")) Propositions 3.7 and 3.11. The crossing conclusions in #cite(label("Lopatto2026")) Proposition 9.1 and #cite(label("Chen2026")) Proposition 4.2 are conditional: if the second derivative of the gradient’s second moment vanishes at a point of a positive constant interval, its third derivative is positive at that point. Our rational identity instead bounds that third derivative below by a strictly positive quantity throughout each such interval. The argument is carried out directly at zero temperature; interval support alone does not in general pass through weak limits of measures.

The variational contact conditions have precedents in both the positive-temperature analysis of Jagannath and Tobasco #cite(label("JT2017")) Proposition 1.1, Lemma 3.2, and Corollaries 3.6 and 3.10 and the zero-temperature analysis of Chen, Handschy, and Lerman #cite(label("CHL2018")) Propositions 3–4. In the present setting one may add or remove Stieltjes mass without a probability normalization constraint. This gives a contact potential which is nonnegative and vanishes on the support, a fact we derive explicitly. Once consistency is saturated at every time, differentiating polynomial moments yields regularity of the order parameter. This method appears in Auffinger and Chen #cite(label("ACProperties2015")) Lemma 2 and the proof of Theorem 2(ii) and in the zero-temperature form of Chen #cite(label("Chen2026")) Appendix B.6.

The scalar consequences in Section 7 follow the incremental approximate-message-passing methodology of Montanari #cite(label("Montanari2019")) and El Alaoui, Montanari, and Sellke #cite(label("EAMS2021")): a Hessian-weighted gradient martingale determines normalized Euler increments and the limiting value. We prove the needed scalar statements directly. The finite-disorder algorithm is supplied separately by the theorem of El Alaoui, Montanari, and Sellke #cite(label("EAMS2021")) Theorem 3 and Corollary 2.2 of the cited preprint: full support verifies its strictly increasing minimizer hypothesis. Corollary 18 spells out the Gaussian input normalization and the resulting $C \( epsilon.alt \) n^2$ real-arithmetic operation count.

=== 1.2 Proof structure <proof-structure>

The argument has an analytic part and a variational part. Section 2 first constructs the diffusion and proves the compact-strip estimates needed to approximate integrable order parameters. Set $q \( t \) = bb(E) u_gamma \( t \, X_t \)^2$. The gradient-martingale identity gives $q' \( t \) = bb(E) Phi_(gamma \, x x) \( t \, X_t \)^2$. At a minimizer, the first variation shows that

$ G \( s \) = integral_s^1 \( q \( t \) - t \) thin upright(d) t $

is nonnegative and vanishes on $"supp" mu_gamma$. At an interior support point this implies $q \( t \) = t$ and $q' \( t \) lt.eq 1$. On a hypothetical interior gap $\( a \, b \)$ with $gamma = c > 0$, the endpoint conditions give $q \( a \) = a$, $q \( b \) = b$, and $q' \( a \) \, q' \( b \) lt.eq 1$. If $q'$ is strictly convex there, it lies below its endpoint chord and hence below $1$ inside. Integrating gives $q \( b \) - q \( a \) < b - a$, contradicting contact at the endpoints, as illustrated in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  merge-path({line((0, 3.1), (8, 3.1), (8, 2.2)); bezier((8, 2.2), (0, 1.8), (5.333, 0.25), (2.667, 0.1))}, close: true, fill: rgb("#ebebff"), stroke: none)
  line((-1.9, 0), (8.7, 0), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((8.7, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((-1.9, 0), (-1.9, 3.5), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((-1.9, 3.5), [#text(size: 9pt)[$q'(t)$]], anchor: "south", padding: 0.1176cm)
  line((-1.9, 3.1), (8.25, 3.1), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((-1.9, 3.1), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  line((0, 1.8), (8, 2.2), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  content((4, 2.106), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(fill: rgb("#000000"))[#text(size: 9pt)[endpoint chord]]]])], anchor: "south")
  bezier((0, 1.8), (8, 2.2), (2.667, 0.1), (5.333, 0.25), stroke: (paint: rgb("#000099"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((0, 0), (0, 1.8), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "dotted"))
  line((8, 0), (8, 2.2), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "dotted"))
  circle((0, 1.8), radius: 0.05644, fill: black, stroke: none)
  circle((8, 2.2), radius: 0.05644, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  content((8, 0), [#text(size: 9pt)[$b$]], anchor: "north", padding: 0.1176cm)
  content((-0.07484, 1.875), [#text(size: 9pt)[$q'(a) lt.eq 1$]], anchor: "south-east", padding: 0.1176cm)
  content((8.075, 2.275), [#text(size: 9pt)[$q'(b) lt.eq 1$]], anchor: "south-west", padding: 0.1176cm)
  content((4, 0.58), [#text(fill: rgb("#000099"))[#text(size: 9pt)[strictly convex $q'$]]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The contradiction on a hypothetical support gap with $gamma = c > 0$. Strict convexity puts $q'$ below its endpoint chord, which is at most $1$. The shaded deficit is positive, whereas contact at both endpoints requires $integral_a^b q' \( t \) thin upright(d) t = q \( b \) - q \( a \) = b - a$. The endpoint derivatives need not equal $1$. ],
) <fig:gap-convexity>

The main work is to establish this strict convexity without assuming support properties. For a positive constant coefficient $c$, put $r = c Phi_x$, $v = r_x$, $w = r_(x x)$, and $z = r_(x x x)$. Direct differentiation along the diffusion yields

$ q''' \( t \) = c^(- 2) bb(E) \[ z^2 - 12 v w^2 + 6 v^4 \] \( t \, X_t \) . $

The expression inside this expectation has a negative term and is not controlled pointwise by convexity of $Phi$ alone. Sections 3 and 4 overcome this obstacle. For positive finite-step coefficients with smooth terminal data, let $f \( t \, dot.op \)$ be the density of $X_t$. The factorization $f = e^(c Phi) g$ gives a forward heat equation for $g$ between jumps. We propagate backward shape inequalities for $r$ and forward inequalities for the score $s = - partial_x log g$, including a comparison of $s \/ r$. These signs make an exact rational polynomial identity nonnegative after one spatial integration by parts, retaining the lower bound $10^(- 3) bb(E) v^4$.

Section 5 transfers only this integrated inequality to an arbitrary integrable coefficient; it does not require convergence of the auxiliary density scores or their ratios. The zero-coefficient case follows separately from the heat equation. Section 6 then excludes interior, initial, and terminal gaps. With $q \( t \) = t$ at every time, the Hessian Itô identity expresses $gamma$ as a quotient of continuous derivative moments. Differentiating polynomial moments simultaneously bootstraps this formula to smoothness. To obtain $gamma' \( t \) > 0$ at a fixed $t > 0$, we approximate $gamma$ by coefficients which equal $gamma \( t \)$ on shrinking intervals around $t$. The integrated coercive inequality passes to the limit at that fixed time and becomes a strictly positive lower bound for $gamma' \( t \)$. Finally, Section 7 derives a martingale formula for $P_(*)$ and a finite Gaussian approximation, then verifies the hypothesis and normalization of the existing optimization theorem.

== 2 Integrable coefficients and the controlled diffusion <sec:regularity>

The sign inequalities will first be proved for finite step functions. We therefore need estimates which survive approximation of an arbitrary $gamma in cal(U)$, including coefficients which diverge at time one. All estimates in this section are on strips ending strictly before one. The control and heat-semigroup methods follow the Parisi PDE framework of Auffinger and Chen #cite(label("AC2015")), Jagannath and Tobasco #cite(label("JT2016")), and the zero-temperature treatment of Chen, Handschy, and Lerman #cite(label("CHL2018")) Proposition 2 and Theorem 5. We include the proofs to make the approximation uniformity explicit. We retain the notation $u_gamma = partial_x Phi_gamma$ from the model definition, and write $P_t$ for the heat semigroup with variance $t$.

#thm([Lemma 2.1.])[
  (Compact-strip regularity and stability).  #emph[For every $gamma in cal(U)$, the function $Phi_gamma$ is even, convex, and one-Lipschitz in its spatial variable. It satisfies 
#[#set math.equation(numbering: n => "(2.1)")
 $ \| x \| lt.eq Phi_gamma \( t \, x \) lt.eq \| x \| + sqrt(frac(2 \( 1 - t \), pi)) + 1 / 2 integral_t^1 gamma \( s \) thin upright(d) s . $ <eq:terminal-uniform>]

 For each integer $k gt.eq 1$ and $T < 1$, the derivative $partial_x^k Phi_gamma$ is bounded and jointly continuous on $\[ 0 \, T \] times bb(R)$. These bounds are uniform when the coefficients have uniformly bounded $L^1 \( 0 \, 1 \)$ norms. The derivatives are locally absolutely continuous in time and satisfy the spatially differentiated Parisi equation for almost every time.]
  #emph[If $gamma_n arrow.r gamma$ in $L^1 \( 0 \, 1 \)$, then, for every $k gt.eq 1$ and $T < 1$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ sup_(\[ 0 \, T \] times bb(R)) \| partial_x^k Phi_(gamma_n) - partial_x^k Phi_gamma \| arrow.r 0 . $ <eq:derivative-convergence>]

 The same conclusion holds when each $gamma_n$ is a finite step function and its terminal datum is $M_n^(- 1) log \( 2 cosh \( M_n x \) \)$, where $M_n arrow.r oo$.]
] <lem:regularity>

#proof[
  For a nonnegative finite step coefficient and a smooth even convex one-Lipschitz terminal datum $psi$, backward evolution across an interval with coefficient $c$ is
  #[#set math.equation(numbering: n => "(2.3)")
   $ Phi \( t \, x \) = cases(delim: "{", c^(- 1) log P_(b - t) \( e^(c Phi \( b \, dot.op \)) \) \( x \) \, & c > 0 \,, P_(b - t) Phi \( b \, dot.op \) \( x \) \, & c = 0 .) $ <eq:constant-heat>]
  These formulas preserve evenness, convexity, and the one-Lipschitz bound. Convexity in the first case follows either from Hölder’s inequality applied after a spatial translation, or by differentiating the logarithm: its second derivative is the tilted mean of the old second derivative plus $c$ times the tilted variance of the old first derivative. The first derivative is a tilted mean of the old first derivative. The assertions in the case $c = 0$ follow directly from convolution.
  For these step solutions, Itô’s formula and completion of the square give the control representation
  #[#set math.equation(numbering: n => "(2.4)")
   $ Phi \( t \, x \) = sup_(\| a \| lt.eq 1) bb(E) [psi (x + B_1 - B_t + integral_t^1 gamma \( s \) a_s thin upright(d) s) - 1 / 2 integral_t^1 gamma \( s \) a_s^2 thin upright(d) s] . $ <eq:control-representation>]
  The supremum is over progressively measurable controls. Indeed, the drift of $Phi \( s \, Y_s \) - 1 / 2 integral_t^s gamma a^2$ is $- gamma \( a - u_gamma \)^2 \/ 2$ when $upright(d) Y_s = gamma \( s \) a_s thin upright(d) s + upright(d) B_s$. Equality is attained by $a_s = u_gamma \( s \, Y_s \)$; for the smooth finite-step problem the feedback equation has a unique strong solution. Consequently two such solutions obey
  #[#set math.equation(numbering: n => "(2.5)")
   $ parallel Phi_(gamma \, psi) - Phi_(tilde(gamma) \, tilde(psi)) parallel_oo lt.eq parallel psi - tilde(psi) parallel_oo + 3 / 2 parallel gamma - tilde(gamma) parallel_1 . $ <eq:value-stability>]
  Here the supremum is over the whole time-space domain, even though the individual functions grow linearly. The bound follows by using the same controls on both sides of (2.4).
  Nonnegative nondecreasing finite step functions are dense in $cal(U)$ for the $L^1$ norm. For example, truncate at a time increasing to one, approximate the resulting bounded monotone function by monotone step functions, and then let the truncation time tend to one. Since $0 lt.eq M^(- 1) log \( 2 cosh \( M x \) \) - \| x \| lt.eq M^(- 1) log 2$, (2.5) defines a unique uniform limit, with control representation (2.4) and terminal datum $\| x \|$. This agrees with the Parisi solution in the model definition. All the asserted shape properties pass to the limit. The zero control and Jensen’s inequality give the lower bound in (2.1). For the upper bound use the triangle inequality and $\| a \| - a^2 \/ 2 lt.eq 1 \/ 2$ in the control representation.
  We give the smoothing estimates explicitly. This also establishes the uniformity needed below. On any strip $\[ 0 \, b \]$ with $b < 1$, monotonicity gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ gamma \( t \) lt.eq frac(parallel gamma parallel_1, 1 - b) \, #h(2em) 0 lt.eq t lt.eq b . $ <eq:local-coefficient-bound>]
  Thus all coefficients in an $L^1$-bounded family have a common bound $Gamma$ there. Work first with the smooth-terminal step solutions and put $U = Phi_x$. Differentiation of the mild equation gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ U \( t \) = P_(b - t) U \( b \) + integral_t^b gamma \( s \) P_(s - t) \[ U \( s \) U_x \( s \) \] thin upright(d) s . $ <eq:burgers-mild>]
  We always have $parallel U parallel_oo lt.eq 1$, independently of its terminal smoothing. The heat-kernel estimate $parallel partial_x P_h f parallel_oo lt.eq C h^(- 1 \/ 2) parallel f parallel_oo$ implies
  #[#set math.equation(numbering: n => "(2.8)")
   $ parallel U_x \( t \) parallel_oo lt.eq C / sqrt(b - t) + C Gamma integral_t^b frac(parallel U_x \( s \) parallel_oo, sqrt(s - t)) thin upright(d) s . $ <eq:fractional-bound>]
  The constants do not involve derivatives of the terminal datum.
  For completeness, the integral inequality in (2.8) gives a uniform bound away from $b$. The convolution of $h^(- 1 \/ 2)$ with itself equals $pi$. Substituting the inequality once into its integral therefore reduces it to an ordinary backward Gronwall inequality, with forcing bounded by a constant times $1 + \( b - t \)^(- 1 \/ 2)$. That forcing is integrable. The resulting estimate is uniform on every smaller strip.
  The same argument bounds all higher derivatives. Suppose that derivatives of $U$ through order $m - 1$ are already bounded on a slightly larger strip. Differentiate (2.7) $m$ times, placing one derivative on the heat kernel and the other $m - 1$ on $U U_x$. Its highest-order term is $U partial_x^m U$; every remaining product involves derivatives of orders at most $m - 1$. The initial term is bounded by $C \( b - t \)^(- 1 \/ 2) parallel partial_x^(m - 1) U \( b \) parallel_oo$. Thus the same integral inequality applies to $parallel partial_x^m U \( t \) parallel_oo$, with an additional bounded forcing. Choose successively smaller strip endpoints in this induction. For every fixed $m$ this proves the asserted bound, uniformly for the approximants.
  Uniform convergence of the functions now gives convergence of all their spatial derivatives without a separate singular-kernel comparison. If a bounded $C^2$ function $F$ on $bb(R)$ has bounded second derivative, Taylor’s formula gives, for every $h > 0$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ parallel F' parallel_oo lt.eq frac(2 parallel F parallel_oo, h) + h / 2 parallel F'' parallel_oo . $ <eq:interpolation>]
  Apply this to a difference of two approximating solutions, uniformly on a fixed smaller strip. The uniform second-derivative bound and uniform convergence imply convergence of the first derivatives. Apply (2.9) successively to the differences of the first, second, and later derivatives; the next two derivative bounds are available at every stage. This proves uniform convergence of every positive spatial derivative. Their limits are the spatial derivatives of the limiting function, by the fundamental theorem of calculus. Since the approximating derivatives are jointly continuous, so are their uniform limits.
  The argument applies also to an arbitrary $L^1$-convergent sequence in $cal(U)$: first obtain these bounds for each member by step approximation, then use (2.5), the uniform local coefficient bound (2.6), and (2.9). Finally pass to the limit in the integral form of the differentiated equation on each compact strip. All its spatial factors converge uniformly, and its coefficient converges in $L^1$. This proves local absolute continuity in time and the asserted almost-everywhere equations. ◻
]

#thm([Lemma 2.2.])[
  (Diffusion and square-martingale identity).  #emph[For $gamma in cal(U)$, the equation 
#[#set math.equation(numbering: n => "(2.10)")
 $ upright(d) X_t = gamma \( t \) u_gamma \( t \, X_t \) thin upright(d) t + upright(d) B_t \, #h(2em) X_0 = 0 \, $ <eq:controlled-diffusion>]

 has a unique strong solution on $\[ 0 \, 1 \]$. On every strip $\[ 0 \, T \]$ with $T < 1$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ u_gamma \( t \, X_t \) = integral_0^t Phi_(gamma \, x x) \( s \, X_s \) thin upright(d) B_s . $ <eq:gradient-martingale>]

 In particular, $q \( t \) = bb(E) \[ u_gamma \( t \, X_t \)^2 \]$ belongs to $C^1 \[ 0 \, 1 \)$, $q \( 0 \) = 0$, and 
#[#set math.equation(numbering: n => "(2.12)")
 $ q' \( t \) = bb(E) \[ Phi_(gamma \, x x) \( t \, X_t \)^2 \] . $ <eq:qprime>]

 Under the approximations in Lemma 2, the coupled diffusions converge uniformly on compact time strips, and $q_n$ and $q'_n$ converge uniformly there.]
] <lem:diffusion>

#proof[
  The drift is measurable in time, bounded by $gamma \( t \)$, and globally Lipschitz in space on every compact time strip by Lemma 2. Picard iteration gives a unique strong solution there. These solutions agree on overlaps and extend to time one because $integral_0^1 gamma < oo$ and Brownian paths are continuous.
  For clarity, convergence needs no moment estimate for the approximating paths. Couple them using the same Brownian motion. The drift difference is bounded by a common spatial Lipschitz constant times $\| X_n - X \|$, plus $\| gamma_n - gamma \| + gamma_n parallel u_n - u_gamma parallel_oo$. Gronwall’s inequality gives a deterministic bound for $sup_(t lt.eq T) \| X_n \( t \) - X \( t \) \|$ tending to zero. For step coefficients and smooth terminal data, Itô’s formula on each step cancels the drift of $u_n \( t \, X_n \( t \) \)$. The step-boundary values agree. Passing to the limit in the stochastic integral by its $L^2$ isometry proves (2.11). Its initial value is zero by evenness. The same isometry gives $q \( t \) = integral_0^t bb(E) \[ Phi_(gamma \, x x) \( s \, X_s \)^2 \] thin upright(d) s$. The integrand is continuous by joint continuity, boundedness on compact strips, and continuity of $X$. This proves (2.12) and the stated convergence assertions. ◻
]

#thm([Lemma 2.3.])[
  (Transfer on a constant interval).  #emph[Suppose $gamma = c$ on an open interval $I subset \( 0 \, 1 \)$. If $c > 0$, every point of $I$ has a neighborhood on which one may choose positive, bounded, nondecreasing finite step approximants equal to $c$, with smooth terminal data and $M_n gt.eq parallel gamma_n parallel_oo$. At each time in this neighborhood, all spatial derivatives and the corresponding diffusion expectations of bounded polynomials in those derivatives converge. Moreover, $Phi_(gamma \, x x) > 0$ throughout $I times bb(R)$.]
  #emph[For $c > 0$, set $r = c Phi_x$, $v = r_x$, $w = r_(x x)$, and $z = r_(x x x)$. Then, within $I$, 
#[#set math.equation(numbering: n => "(2.13)")
 $ \( q' \)' \( t \) & = c^(- 2) bb(E) \[ w \( t \, X_t \)^2 - 2 v \( t \, X_t \)^3 \] \,\
\( q' \)'' \( t \) & = c^(- 2) bb(E) \[ z \( t \, X_t \)^2 - 12 v \( t \, X_t \) w \( t \, X_t \)^2 + 6 v \( t \, X_t \)^4 \] . $ <eq:first-curvature>]

 For $c = 0$, $q'$ is strictly increasing on $I$.]
] <lem:constant-transfer>

#proof[
  To preserve a positive plateau, truncate and discretize the coefficient separately to the left and right of a closed subinterval of $I$, retain the value $c$ on that subinterval, and impose a positive lower cutoff tending to zero and smaller than $c$. All choices are monotone and converge in $L^1$. Increase the terminal smoothing parameter beyond the finite step bound. The convergence claims then follow from Lemmas 2 and 3. The products involved are uniformly bounded, and the spatial derivative bounds also give uniform continuity for evaluating them on the coupled paths.
  For strict positivity, choose $b in I$ later than the time in question and use (2.3). The function $h = Phi_gamma \( b \, dot.op \)$ is smooth, convex, even, and differs from $\| x \|$ by a bounded function. Its derivative is therefore not constant. Twice differentiating the logarithm in (2.3) gives
  $ Phi_(x x) \( t \, x \) = bb(E)_(t \, x)^(upright("tilt")) \[ h'' \] + c "Var"_(t \, x)^(upright("tilt")) \( h' \) . $
  The tilted Gaussian law has a strictly positive density everywhere. The variance is strictly positive and the first term is nonnegative.
  Inside $I$ all functions are smooth in time as well as space, by the heat formula. Along $X$, the drifts of $r$, $v$, and $w$ are respectively $0$, $- v^2$, and $- 3 v w$, and their diffusion coefficients are $v$, $w$, and $z$. These identities follow by differentiating $r_t = - r_(x x) \/ 2 - r r_x$. Itô’s formula for $v^2$ and then for $w^2 - 2 v^3$, with (2.12), proves (2.13)–(2.13). All differentiations under the expectation are justified by the bounded higher spatial derivatives on smaller intervals.
  If $c = 0$, the same argument gives
  $ \( q' \)' \( t \) = bb(E) \[ Phi_(x x x) \( t \, X_t \)^2 \] > 0 . $
  To see strictness, start the drift-free interval at any earlier time in $I$. Its Gaussian transition kernel implies that $X_t$ has a strictly positive density on $bb(R)$. The function $Phi_(x x x) \( t \, dot.op \)$ cannot vanish identically: otherwise $Phi \( t \, dot.op \)$ would be an even quadratic polynomial, whereas it is one-Lipschitz and differs from $\| x \|$ by a bounded function. ◻
]

== 3 Shape inequalities for finite step functions <shape:section>

On a positive constant interval, the curvature formula (2.13) contains the indefinite expression $z^2 - 12 v w^2 + 6 v^4$. The next section will make its expectation positive by adding a spatial derivative of zero expectation. Our task here is to prove the shape inequalities that make this possible: we compare the backward drift with a logarithmic derivative of the forward density.

We work with a fixed positive finite step coefficient and a smooth terminal condition. The estimates in this section may depend on these fixed data. Section 5 will pass only the resulting integrated inequality to general coefficients, using Lemma 2.

Fix a partition $0 = t_0 < t_1 < dots.h.c < t_N = 1$, constants $0 < c_1 lt.eq dots.h.c lt.eq c_N lt.eq M$, and $gamma \( t \) = c_i$ on $\[ t_(i - 1) \, t_i \)$. Let $Phi$ solve

$ Phi_t = - 1 / 2 \( Phi_(x x) + gamma Phi_x^2 \) \, #h(2em) Phi \( 1 \, x \) = M^(- 1) log \( 2 cosh \( M x \) \) . $

On a step where $gamma = c$, put

$ l = c Phi \, #h(2em) r = l_x \, #h(2em) v = r_x \, #h(2em) w = r_(x x) \, #h(2em) z = r_(x x x) . $

Spatial derivatives of $Phi$ agree across step boundaries; those of $l$ are rescaled with $c$. Within a step, $h = e^l$ satisfies $h_t = - 1 / 2 h_(x x)$. In backward time $tau$ this gives

#[#set math.equation(numbering: n => "(3.1)")
 $ r_tau = 1 / 2 r_(x x) + r r_x . $ <shape:backward-r>]

Let $X_0 = 0$ and $upright(d) X_t = r \( t \, X_t \) upright(d) t + upright(d) B_t$. The drift is bounded and spatially Lipschitz for these fixed data. Its density at positive times will be denoted by $f \( t \, x \)$. Factor it as

$ f = e^l g \, #h(2em) s = - partial_x log g . $

The factor $e^l$ contains the backward solution. The remaining factor $g$ evolves by the forward heat equation within each step. Indeed, the transition density from time $a$ to time $t$ in the same step is

$ p_(t - a) \( x - y \) frac(h \( t \, x \), h \( a \, y \)) \, #h(2em) p_u \( x \) = \( 2 pi u \)^(- 1 \/ 2) e^(- x^2 \/ \( 2 u \)) . $

It integrates to one because $h \( a \, dot.op \) = P_(t - a) h \( t \, dot.op \)$, and differentiation verifies the forward equation with drift $r = h_x \/ h$. Consequently $g_t = 1 / 2 g_(x x)$. On the first step, $g \( t \, x \) = p_t \( x \) \/ h \( 0 \, 0 \)$, so $s = x \/ t$. At a forward jump $c_(+) - c_(-) = delta gt.eq 0$, continuity of $f$ gives

#[#set math.equation(numbering: n => "(3.2)")
 $ g_(+) = g_(-) e^(- delta Phi) . $ <tail:g-jump>]

In particular $g$ is positive and even, and $s$ is odd.

The comparison we need has three parts. On the positive half-line the drift $r$ is increasing and concave; its relative backward-time change $r_tau \/ r$ is nonpositive and nondecreasing in $x$. The score $s$ is also increasing and concave, and its ratio to $r$ is nondecreasing in $x$. Lemmas 6 and 7 state these claims precisely. We first record the boundary estimates needed in their proofs.

=== 3.1 Boundary estimates and comparison <boundary-estimates-and-comparison>

A differentiated exponential error means that, for each fixed finite derivative order, the error and all its derivatives up to that order are $O \( e^(- kappa x) \)$ as $x arrow.r + oo$, for some $kappa > 0$. Constants may change with the derivative order.

#thm([Lemma 3.1.])[
  (Differentiated tails).  #emph[On each closed backward step, uniformly in its time coordinate, 
#[#set math.equation(numbering: n => "(3.3)")
 $ l \( t \, x \) = c x + C \( t \) + O \( e^(- kappa x) \) #h(2em) \( x arrow.r + oo \) $ <tail:backward>]

 with differentiated exponential error. The functions are even, so the negative tail is determined by symmetry.]
  #emph[For the forward heat factor $g$, on every closed forward step with time bounded away from zero, 
#[#set math.equation(numbering: n => "(3.4)")
 $ g \( t \, x \) = exp (- frac(x^2, 2 t) + beta \( t \) x + C_0 \( t \)) \( 1 + O \( e^(- kappa x) \) \) #h(2em) \( x arrow.r + oo \) \, $ <tail:forward>]

 with differentiated relative error. In particular, 
#[#set math.equation(numbering: n => "(3.5)")
 $ s \( t \, x \) = x / t - beta \( t \) + O \( e^(- kappa x) \) \, #h(2em) s_x \( t \, x \) = 1 / t + O \( e^(- kappa x) \) \, #h(2em) s_(x x) \( t \, x \) = O \( e^(- kappa x) \) . $ <tail:score>]

 The assertions include one-sided values at every step boundary.]
] <tail:class>

The proof uses only Gaussian convolution and the finite-step jump rules; none of the shape inequalities proved below enters it.

#proof[
  Here is a Gaussian estimate that also controls differentiation. Suppose $q in C^m \( bb(R) \)$ satisfies, for $0 lt.eq j lt.eq m$,
  $ \| q^(\( j \)) \( y \) \| lt.eq A e^(- kappa y) quad \( y gt.eq 0 \) \, #h(2em) \| q^(\( j \)) \( y \) \| lt.eq A e^(K \| y \|) quad \( y < 0 \) . $
  For $Y_x = lambda x + b + sqrt(V) Z$, where $Z$ is standard normal, $0 < lambda_(*) lt.eq lambda lt.eq lambda^(*)$, $\| b \| lt.eq B$, and $0 lt.eq V lt.eq V_(*)$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ partial_x^j bb(E) q \( Y_x \) = lambda^j bb(E) q^(\( j \)) \( Y_x \) = O \( e^(- kappa' x) \) #h(2em) \( 0 lt.eq j lt.eq m \) $ <tail:gaussian-estimate>]
  uniformly in these parameters, for some $kappa' > 0$. Indeed, write $mu = lambda x + b$ and take $x$ large enough that $mu > 0$. On $Y_x gt.eq mu \/ 2$, use $A e^(- kappa mu \/ 2)$. On its complement, the global bound $\| q^(\( j \)) \( y \) \| lt.eq A e^(K \| y \|)$, Cauchy–Schwarz, and $bb(P) \( Y_x < mu \/ 2 \) lt.eq e^(- mu^2 \/ \( 8 V_(*) \))$ give a bound $C exp \( K mu - mu^2 \/ \( 16 V_(*) \) \)$. This is smaller than an exponential in $x$; the case $V = 0$ is immediate. Exponential integrability of the Gaussian justifies differentiation under the expectation. Adjusting the constant covers the remaining bounded range of $x$.
  For backward evolution, suppose an even starting function $l_0$ has $l_0 \( x \) = c x + C + rho \( x \)$ with differentiated exponential error. Set $q \( y \) = e^(l_0 \( y \) - c y - C) - 1$. This $q$ obeys the hypotheses above: the positive tail follows by differentiating the exponential, and evenness of $l_0$ gives at most exponential growth for $q$ and its derivatives on the negative tail. Gaussian tilting gives
  $ P_tau \( e^(l_0) \) \( x \) = e^(c x + C + c^2 tau \/ 2) (1 + bb(E) q \( x + c tau + sqrt(tau) Z \)) . $
  Apply (3.6) uniformly for bounded $tau$ and take the logarithm. Its relative error tends uniformly to zero, so differentiating $log \( 1 + dot.op \)$ proves (3.3) with all the stated derivatives. The initial condition starts this induction since, for $x > 0$,
  $ c / M log \( 2 cosh M x \) = c x + c / M log \( 1 + e^(- 2 M x) \) . $
  At a backward boundary, $l$ is multiplied by $c_(-) \/ c_(+) > 0$, which preserves the required tail class. Finite induction proves the first claim.
  Suppose at a positive time $a$ that $g \( a \, y \) = e^(- y^2 \/ \( 2 a \) + beta y + C) \( 1 + q \( y \) \)$ has the required tail class. Evenness of $g$ implies the same exponential-growth bound for the derivatives of $q$ on the negative tail. Completing the square gives
  $ P_h g \( a \, dot.op \) \( x \) & = sqrt(frac(a, a + h)) thin exp (- frac(x^2, 2 \( a + h \)) + frac(a beta, a + h) x + C + frac(beta^2 a h, 2 \( a + h \)))\
 & quad times (1 + bb(E) q (frac(a, a + h) x + frac(beta a h, a + h) + sqrt(frac(a h, a + h)) Z)) . $
  On a fixed interval $0 lt.eq h lt.eq H$, the coefficient of $x$ in the Gaussian mean is at least $a \/ \( a + H \) > 0$. Thus (3.6) proves closure, uniformly including $h = 0$. At a jump, write $Phi = x + D + rho$ on the positive tail. Formula (3.2) replaces $\( beta \, C \)$ by $\( beta - delta \, C - delta D \)$ and replaces $1 + q$ by $\( 1 + q \) e^(- delta rho)$, preserving the differentiated relative error. Finite induction proves (3.4). Logarithmic differentiation then gives (3.5). ◻
]

We will use the following elementary form of comparison. If on a compact space-time cylinder

$ u_t - 1 / 2 u_(x x) - b u_x - c u gt.eq 0 \, #h(2em) c lt.eq C \, $

and $u gt.eq 0$ initially while $u gt.eq - epsilon$ on the lateral boundary, then

#[#set math.equation(numbering: n => "(3.7)")
 $ u \( t \, x \) gt.eq - epsilon e^(\( max \( C \, 0 \) + 1 \) \( t - t_0 \)) . $ <shape:barrier>]

To see this, add the positive exponential on the right to $u$ and multiply by $e^(- \( max \( C \, 0 \) + 1 \) \( t - t_0 \))$. The resulting zeroth-order coefficient is at most $- 1$. A negative space-time minimum, which cannot be on the parabolic boundary, has nonpositive time derivative, zero spatial gradient, and nonnegative second spatial derivative, contradicting its differential inequality. The same proof applies in a ball in $bb(R)^d$ with $1 / 2 Delta$ in place of $1 / 2 partial_(x x)$. In particular, to exhaust the line or half-line it suffices that the lateral boundary errors tend uniformly to zero and that $C$ is independent of the truncation. No uniform bound on the first-order coefficient $b$ over the exhausting cylinders is needed.

=== 3.2 Backward shape inequalities <backward-shape-inequalities>

#thm([Lemma 3.2.])[
  (Backward shapes).  #emph[For the fixed step data above, $r$ is odd and $v > 0$. On $x > 0$, 
#[#set math.equation(numbering: n => "(3.8)")
 $ w lt.eq 0 \, #h(2em) H := r_tau / r = frac(w, 2 r) + v lt.eq 0 \, #h(2em) H_x gt.eq 0 . $ <shape:backward-signs>]

 The quotient defining $H$ extends smoothly and evenly at zero.]
] <shape:backward>

#proof[
  Evenness is preserved by both heat evolution and rescaling. If $l''_0 > 0$, the logarithm of its heat evolution obeys
  $ partial_(x x) log P_tau e^(l_0) \( x \) = bb(E)_nu l''_0 \( Y \) + "Var"_nu \( l'_0 \( Y \) \) > 0 \, $
  where $nu$ is the Gaussian law of $Y = x + sqrt(tau) Z$ tilted by $e^(l_0 \( Y \))$; at $tau = 0$ use $l''_0 \( x \) > 0$ directly. Since the terminal second derivative is $c M "sech"^2 \( M x \) > 0$ and backward rescalings are positive, this proves $v > 0$. Thus $r \( x \) > 0$ for $x > 0$. All required derivatives are bounded on closed steps, by smoothness on compact sets and Lemma 5 at infinity.
  Differentiating (3.1) twice gives
  $ w_tau = 1 / 2 w_(x x) + r w_x + 3 v w . $
  The terminal $w = - 2 c M^2 "sech"^2 \( M x \) tanh \( M x \)$ is nonpositive for $x > 0$. The lateral values are $w \( tau \, 0 \) = 0$ and $w \( tau \, A \) = o_A \( 1 \)$ uniformly on a closed step. Apply (3.7) to $- w$, with $C = 3 sup v$, and let $A arrow.r oo$. Backward jumps multiply $w$ by a positive constant, so the sign holds throughout.
  Because $r \( x \) = v \( 0 \) x + O \( x^3 \)$ with $v \( 0 \) > 0$, odd smoothness makes $w \/ r$ smooth and even at zero. Direct differentiation of $r_tau = r H$ gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ H_tau & = 1 / 2 H_(x x) + \( v \/ r + r \) H_x + v H \,\
\( H_x \)_tau & = 1 / 2 \( H_x \)_(x x) + \( v \/ r + r \) \( H_x \)_x + #scale(x: 120%, y: 120%)[\(] \( v \/ r \)_x + 2 v #scale(x: 120%, y: 120%)[\)] H_x + w H . $ <shape:H-evolution>]
  At the terminal endpoint of the last step,
  $ H = \( c M - M^2 \) "sech"^2 \( M x \) lt.eq 0 \, #h(2em) H_x gt.eq 0 quad \( x > 0 \) . $
  For (3.9), write $v \/ r + r = x^(- 1) + eta \( x \)$, where $eta$ is smooth odd and $eta \( x \) = O \( x \)$ near zero. The radial lift $hat(H) \( y \) = H \( \| y \| \)$ in $bb(R)^3$ satisfies
  $ hat(H)_tau = 1 / 2 Delta hat(H) + eta \( \| y \| \) frac(y, \| y \|) dot.op nabla hat(H) + v \( \| y \| \) hat(H) . $
  Both the lifted function and vector field are smooth at zero: a smooth even function lifts smoothly, and $eta \( x \) \/ x$ is smooth even. Since $H arrow.r 0$ uniformly at infinity, comparison on balls followed by exhaustion gives $H lt.eq 0$.
  For $H_x$, use intervals $\[ epsilon \, A \]$. The source $w H$ is nonnegative, and
  $ \( v \/ r \)_x = w / r - v^2 / r^2 < 0 \, #h(2em) \( v \/ r \)_x + 2 v lt.eq 2 sup v . $
  The lateral errors are $H_x \( tau \, epsilon \) = O \( epsilon \)$, uniformly by smooth evenness, and $H_x \( tau \, A \) = o_A \( 1 \)$ by the tails. Formula (3.7), with a bound independent of $epsilon \, A$, proves $H_x gt.eq 0$ on taking the two limits.
  Finally, at a backward jump write $r_(upright("new")) = alpha r_(upright("old"))$, where $0 < alpha lt.eq 1$. Its derivatives rescale identically, and hence
  $ H_(upright("new")) = H_(upright("old")) - \( 1 - alpha \) v_(upright("old")) \, #h(2em) \( H_x \)_(upright("new")) = \( H_x \)_(upright("old")) - \( 1 - alpha \) w_(upright("old")) . $
  These preserve both signs. Induction over the finitely many steps completes the proof. ◻
]

=== 3.3 Forward score inequalities <forward-score-inequalities>

The logarithmic derivative $s = - g_x \/ g$ measures the part of the density not contained in $e^l$. We need both its concavity and a comparison with $r$, rather than concavity of either function alone. The density transform and its use on constant intervals also appear in Lopatto’s positive-temperature analysis #cite(label("Lopatto2026")) Sections 3, 7, and 9. Here we prove the additional ratio sign needed by the coercive identity.

#thm([Lemma 3.3.])[
  (Forward score and ratio).  #emph[For every $t > 0$, $s$ is odd and, with $a = s_x$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ a gt.eq 1 / t > 0 \, #h(2em) s_(x x) lt.eq 0 quad \( x > 0 \) \, #h(2em) j := a - s / r v = r partial_x \( s \/ r \) gt.eq 0 quad \( x in bb(R) \) . $ <shape:forward-signs>]

 The ratios and $j$ extend smoothly at zero. At every forward step boundary, $j$ is unchanged.]
] <shape:forward>

#proof[
  Evenness and positivity of $g$ give odd smoothness of $s$. Within a step, the heat equation for $g$ gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ s_t & = 1 / 2 s_(x x) - s s_x \,\
a_t & = 1 / 2 a_(x x) - s a_x - a^2 \,\
\( s_(x x) \)_t & = 1 / 2 \( s_(x x) \)_(x x) - s \( s_(x x) \)_x - 3 a s_(x x) . $ <shape:s-evolution>]
  On the first interval $s = x \/ t$, so the first two claims hold explicitly. At a jump of size $delta = c_(+) - c_(-)$, (3.2) gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ s_(+) = s_(-) + delta Phi_x \, quad a_(+) = a_(-) + delta Phi_(x x) \, quad \( s_(x x) \)_(+) = \( s_(x x) \)_(-) + delta Phi_(x x x) . $ <shape:s-jump>]
  Here $Phi_(x x) > 0$ and $Phi_(x x x) lt.eq 0$ on the positive half-line by Lemma 6.
  For subsequent intervals, put $u = a - 1 \/ t$. Equation (3.11) becomes the linear equation
  $ u_t = 1 / 2 u_(x x) - s u_x - \( a + 1 \/ t \) u . $
  For the fixed smooth solution, $a$ is bounded on a closed step; this follows from (3.5) and compactness and does not presume its sign. Thus the zeroth-order coefficient is bounded above independently of a spatial truncation. Initially $u gt.eq 0$, by the preceding step and (3.12); at both infinities $u arrow.r 0$ uniformly by Lemma 5. Comparison on $\[ - A \, A \]$ and exhaustion prove $a gt.eq 1 \/ t$. Next apply comparison to $- s_(x x)$ on $\[ 0 \, A \]$ using (3.11). Its zeroth coefficient is $- 3 a lt.eq 0$, its initial values are nonnegative, and its boundary values tend to zero, at zero by oddness and at infinity by (3.5). This proves $s_(x x) lt.eq 0$.
  For the ratio inequality, first note that $s \( x \) > 0$ and $r \( x \) > 0$ for $x > 0$. On this half-line define
  $ d_s = s_x / s \, #h(2em) d_r = r_x / r \, #h(2em) rho = d_s - d_r . $
  Then $j = s rho$, so it suffices to prove $rho gt.eq 0$. On the first step, $s = x \/ t$ and the concavity of $r$ gives $r \( x \) = integral_0^x v \( y \) upright(d) y gt.eq x v \( x \)$; hence $rho = 1 \/ x - v \/ r gt.eq 0$. Within any later step, forward time reverses (3.1), so $r_t = - r H$. Consequently
  $ \( d_s \)_t = 1 / 2 \( d_s \)_(x x) + d_s \( d_s \)_x - s_(x x) \, #h(2em) \( d_r \)_t = - H_x . $
  Also $1 / 2 \( d_r \)_(x x) + d_r \( d_r \)_x = 1 / 2 \( w \/ r \)_x = H_x - w$. Subtracting gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ rho_t = 1 / 2 rho_(x x) + d_s rho_x + \( d_r \)_x rho + 2 H_x - w - s_(x x) . $ <shape:G-evolution>]
  The source is nonnegative by the signs already proved, while $\( d_r \)_x = w \/ r - v^2 \/ r^2 < 0$.
  Here are the endpoint details for this last comparison. On a closed step away from time zero, $v \( t \, 0 \) > 0$ is continuous and bounded below, and $a \( t \, 0 \) gt.eq 1 \/ t > 0$. Odd Taylor expansions therefore give, uniformly,
  $ d_s = x^(- 1) + O \( x \) \, #h(2em) d_r = x^(- 1) + O \( x \) \, #h(2em) rho = O \( x \) quad \( x arrow.b 0 \) . $
  At infinity, (3.3) and (3.5) give $d_r = O \( e^(- kappa x) \)$ and $d_s = \( x - beta \( t \) t \)^(- 1) + O \( e^(- kappa' x) \)$, so $rho arrow.r 0$ uniformly. Use (3.7) on $\[ epsilon \, A \]$, with upper zeroth-order bound zero, and let $epsilon arrow.b 0$, $A arrow.r oo$. This proves $rho gt.eq 0$ provided it is nonnegative at the start of the step.
  To verify that condition, write at a forward jump
  $ r_(+) = alpha r_(-) \, quad v_(+) = alpha v_(-) \, quad s_(+) = s_(-) + lambda r_(-) \, quad a_(+) = a_(-) + lambda v_(-) \, #h(2em) alpha = c_(+) / c_(-) > 0 \, quad lambda = frac(c_(+) - c_(-), c_(-)) gt.eq 0 . $
  Then direct cancellation gives
  $ j_(+) = a_(-) + lambda v_(-) - frac(s_(-) + lambda r_(-), alpha r_(-)) alpha v_(-) = j_(-) . $
  Since $rho_(+) = j_(+) \/ s_(+)$ for $x > 0$, its initial sign is preserved. This proves the ratio claim by induction. Smoothness of $s \/ r$ at zero follows by factoring $x$ from both odd functions; in particular $j$ is even and $j \( 0 \) = 0$. Reflection gives the assertion on the whole line. ◻
]

=== 3.4 Variables for the integral certificate <variables-for-the-integral-certificate>

We now express the shape inequalities as nonnegative quantities suited to polynomial algebra. Set

$ R = r^2 \, quad K = r s \, quad b = - w \/ r \, quad j = s_x - \( s \/ r \) v = r \( s \/ r \)_x . $

The first two quantities are nonnegative by the common signs of $r$ and $s$, and $b gt.eq 0$ expresses the concavity of $r$. The ratio comparison is precisely $j gt.eq 0$. The remaining three quantities encode the backward-time and forward-concavity inequalities:

$ B = b - 2 v = - 2 H \, #h(2em) S = z + b v - 2 R b = 2 r H_x \, #h(2em) L = - r s_(x x) . $

All are nonnegative. The following lemma collects their derivative rules and the integration-by-parts identity that will be used in the coercive calculation.

#thm([Lemma 3.4.])[
  (Certificate signs and integration by parts).  #emph[At a fixed positive time in a constant step, the functions $R \, K \, v \, b \, j \, L \, B \, S$ defined above are even and extend smoothly across zero. They satisfy 
$ R \, K \, v \, j \, L \, B \, S gt.eq 0 . $

 Writing $cal(D) = r partial_x$, one has 
#[#set math.equation(numbering: n => "(3.14)")
 $ cal(D) \( R \, K \, v \, b \, j \) = #scale(x: 120%, y: 120%)[\(] 2 R v \, med 2 v K + R j \, med - R b \, med - z - b v \, med - j v + K b - L #scale(x: 120%, y: 120%)[\)] . $ <shape:D-rules>]

 For every polynomial $F$ in $R \, K \, v \, b \, j$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E)_f #h(-0.16667em) [cal(D) F + \( v + R - K \) F] = 0 . $ <shape:ibp-identity>]

 Every term in this identity is absolutely integrable.]
] <shape:ibp>

#proof[
  The signs of $R \, K \, v \, j \, L$ follow from Lemmas 6 and 7; for $K$ use the common sign of the odd functions $r \, s$. Since $H = v - b \/ 2$, we have $B = - 2 H gt.eq 0$. On $x > 0$, differentiation gives
  $ S = 2 r H_x gt.eq 0 . $
  All these expressions are even. The ratios $w \/ r$ and $s \/ r$ are smooth at zero since their numerators and denominator are odd and $r_x \( 0 \) > 0$. The inequalities consequently extend there by continuity. For example $b \( 0 \) = - z \( 0 \) \/ v \( 0 \)$, $j \( 0 \) = 0$, and $S \( 0 \) = 0$.
  The derivative rules follow directly from the definitions. The only one involving the forward score is
  $ r j_x = r s_(x x) - a v - s w + frac(s v^2, r) = - j v + K b - L \, $
  which gives the last rule in (3.14).
  The density has logarithmic derivative $f_x \/ f = r - s$. Therefore
  $ partial_x \( r F f \) = (cal(D) F + \( v + r \( r - s \) \) F) f = (cal(D) F + \( v + R - K \) F) f . $
  By the differentiated tails, $r$ is bounded and tends to $c$ at the positive tail, $v \, w \, z \, b$ and their derivatives decay exponentially, $s = x \/ t + O \( 1 \)$, $j = 1 \/ t + O \( \( 1 + x \) e^(- kappa x) \)$, and $K = O \( 1 + x \)$. Every polynomial $F$ and its differentiated expression thus have at most polynomial growth. Moreover
  $ f \( t \, x \) lt.eq C exp (- frac(x^2, 2 t) + C \| x \|) . $
  These bounds prove absolute integrability and $r F f arrow.r 0$ at both infinities. Integrating the displayed derivative on $\[ - A \, A \]$ and letting $A arrow.r oo$ proves (3.15). ◻
]

== 4 An exact coercive identity <cert:section>

We retain the fixed positive time, positive constant step, and notation of Lemma 8. We will prove

$ bb(E)_f \[ z^2 - 12 v w^2 + 6 v^4 \] gt.eq 1 / 1000 bb(E)_f v^4 . $

The expression need not be positive pointwise. Subtracting a spatial derivative with zero expectation preserves its expectation; the calculation below decomposes the resulting expression into nonnegative terms. The variables introduced at the end of the previous section satisfy

#[#set math.equation(numbering: n => "(4.1)")
 $ R \, K \, v \, B \, j \, L \, S gt.eq 0 \, #h(2em) b = B + 2 v gt.eq 0 \, #h(2em) R b^2 = w^2 . $ <cert:signs>]

In particular, the signs of $B$ and $S$ record the backward inequalities $H lt.eq 0$ and $H_x gt.eq 0$.

For a polynomial $F$ in $R \, K \, v \, b \, j$, set

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(D) F = r partial_x F \, #h(2em) cal(W) \( F \) = cal(D) F + \( v + R - K \) F . $ <cert:operators>]

The derivative rules in (3.14) determine $cal(W)$ algebraically. Its analytic meaning is

#[#set math.equation(numbering: n => "(4.3)")
 $ f cal(W) \( F \) = partial_x \( r f F \) \, #h(2em) bb(E)_f cal(W) \( F \) = 0 . $ <cert:divergence>]

Lemma 8 supplies the integrability and vanishing boundary terms for every polynomial used here. Thus it suffices to find $F$ for which subtracting $cal(W) \( F \)$ from the curvature expression leaves a positive multiple of $v^4$ and other nonnegative terms.

=== 4.1 Choosing the derivative correction <choosing-the-derivative-correction>

We first arrange the terms containing $z$. Set

#[#set math.equation(numbering: n => "(4.4)")
 $ \( A \, C \, k \, T_0 \, g_0 \, h \) = (1 / 13 \, 53 / 24 \, 19 / 16 \, 73 / 48 \, 2331 / 10000 \, 87 / 2500) $ <cert:constants-first>]

and define

#[#set math.equation(numbering: n => "(4.5)")
 $ Q = A v b + C v^2 + k K v - 2 k R b + T_0 R v \, #h(2em) T = g_0 R v + h j v . $ <cert:QT>]

The terms $\( z + Q \)^2$ and $S T$ will be nonnegative: the first is a square, and $S \, T gt.eq 0$. Since $S = z + b v - 2 R b$, their terms linear in $z$ have total coefficient $2 Q + T$.

The only derivative rule containing $z$ is $cal(D) b = - z - b v$. Consequently the coefficient of $z$ in $cal(W) \( F \)$ is $- partial_b F$. We therefore choose $F = F_2$ so that $partial_b F_2 = 2 Q + T$. Set

#[#set math.equation(numbering: n => "(4.6)")
 $ \( x_0 \, y \, m \, n_0 \) = (4663 / 5000 \, 6853 / 10000 \, - 1051 / 400 \, - 1073 / 500) . $ <cert:constants-second>]

The following polynomial has the required derivative:

#[#set math.equation(numbering: n => "(4.7)")
 $ F_2 =  & \( A v - 2 k R \) b^2\
 & + b #scale(x: 120%, y: 120%)[\(] 2 C v^2 + 2 k K v + \( g_0 + 2 T_0 \) R v + h j v #scale(x: 120%, y: 120%)[\)]\
 & + x_0 v^2 j + y v^3 + m K v^2 + n_0 R v^2 . $ <cert:polynomials>]

Its first two lines are the required antiderivative in $b$; the last line is independent of $b$ and will be used in the remaining terms. Directly,

$ partial_b F_2 = 2 A v b - 4 k R b + 2 C v^2 + 2 k K v + \( g_0 + 2 T_0 \) R v + h j v = 2 Q + T . $

It follows that

$ z^2 - 12 R v b^2 + 6 v^4 - \( z + Q \)^2 - S T - cal(W) \( F_2 \) $

has no $z$ dependence. This is the reason for the choice of the derivative correction.

The remaining calculation uses one further favorable term from the forward score inequality. Let $cal(W)_0$ be the polynomial rule obtained from $cal(W)$ by omitting $- L$ in $cal(D) j = - j v + K b - L$. Since

#[#set math.equation(numbering: n => "(4.8)")
 $ partial_j F_2 = x_0 v^2 + h b v \, #h(2em) cal(W) \( F_2 \) = cal(W)_0 \( F_2 \) - L \( x_0 v^2 + h b v \) \, $ <cert:L-correction>]

replacing $cal(W)$ by $cal(W)_0$ leaves the nonnegative term $L \( x_0 v^2 + h b v \)$ to be retained in the final identity. We now have only a polynomial in $R \, K \, v \, b \, j$ to decompose.

=== 4.2 The nonnegative remainder <the-nonnegative-remainder>

Define the five polynomials

#[#set math.equation(numbering: n => "(4.9)")
 $ P_0 & = R j \( b - 7 v \)^2 \,\
P_1 & = R B (b - 7 / 3 v)^2 \,\
P_2 & = K v (b - 9 / 2 v)^2 \,\
P_3 & = v B (K + 1 / 4 R - 1 / 7 v)^2 \,\
P_4 & = (v b - 14 / 5 v^2 - 13 / 4 K v + 4 / 3 R v)^2 \, $ <cert:squares>]

with positive coefficients

#[#set math.equation(numbering: n => "(4.10)")
 $ \( p_0 \, p_1 \, p_2 \, p_3 \, p_4 \) = (337 / 10000 \, 183 / 2500 \, 411 / 10000 \, 11461 / 5000 \, 647 / 10000) . $ <cert:constants>]

Let $P_(upright("rem"))$ be the polynomial in $R \, K \, v \, B \, j$ whose nonzero coefficients are listed in Table 1. All its variables and coefficients are nonnegative.

#thm([Lemma 4.1.])[
  (Rational polynomial identity).  #emph[With these definitions, $B = b - 2 v$, and $S = z + b v - 2 R b$, one has the polynomial identity over $bb(Q)$ 
#[#set math.equation(numbering: n => "(4.11)")
 $ z^2 - 12 R v b^2 + 6 v^4 =  & \( z + Q \)^2 + S T + sum_(i = 0)^4 p_i P_i + cal(W) \( F_2 \)\
 & + L \( x_0 v^2 + h b v \) + P_(upright("rem")) . $ <cert:identity>]

]
] <cert:identity-lemma>

#proof[
  Equation (4.8) reduces the assertion to the same identity with $cal(W)_0$ and without the displayed $L$ term. The construction of $F_2$ above cancels every term containing $z$. Expand the residual
  $ z^2 - 12 R v b^2 + 6 v^4 - \( z + Q \)^2 - S T - cal(W)_0 \( F_2 \) - sum_(i = 0)^4 p_i P_i $
  using (3.14), substitute $b = B + 2 v$, and collect monomials in $R \, K \, v \, B \, j$. The coefficients are exactly those of Table 1, and every unlisted coefficient is zero. This proves the identity by rational arithmetic. ◻
]

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, right, center, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Monomial
], table.cell(rowspan: 1, colspan: 1)[Coefficient
], table.cell(rowspan: 1, colspan: 1)[Monomial
], table.cell(rowspan: 1, colspan: 1)[Coefficient
]),
  table.cell(rowspan: 1, colspan: 1)[$R^2 v^2$
], table.cell(rowspan: 1, colspan: 1)[$223 \/ 160000$
], table.cell(rowspan: 1, colspan: 1)[$R^2 v B$
], table.cell(rowspan: 1, colspan: 1)[$4007 \/ 240000$
],
  table.cell(rowspan: 1, colspan: 1)[$R^2 B^2$
], table.cell(rowspan: 1, colspan: 1)[$1097 \/ 120000$
], table.cell(rowspan: 1, colspan: 1)[$R K v^2$
], table.cell(rowspan: 1, colspan: 1)[$83 \/ 80000$
],
  table.cell(rowspan: 1, colspan: 1)[$R K v B$
], table.cell(rowspan: 1, colspan: 1)[$3343 \/ 24000$
], table.cell(rowspan: 1, colspan: 1)[$R v^3$
], table.cell(rowspan: 1, colspan: 1)[$16259 \/ 23400000$
],
  table.cell(rowspan: 1, colspan: 1)[$R v^2 B$
], table.cell(rowspan: 1, colspan: 1)[$30179 \/ 5460000$
], table.cell(rowspan: 1, colspan: 1)[$R v^2 j$
], table.cell(rowspan: 1, colspan: 1)[$26 \/ 625$
],
  table.cell(rowspan: 1, colspan: 1)[$R v B^2$
], table.cell(rowspan: 1, colspan: 1)[$107 \/ 15000$
], table.cell(rowspan: 1, colspan: 1)[$R v B j$
], table.cell(rowspan: 1, colspan: 1)[$3 \/ 2500$
],
  table.cell(rowspan: 1, colspan: 1)[$R B^3$
], table.cell(rowspan: 1, colspan: 1)[$121 \/ 32500$
], table.cell(rowspan: 1, colspan: 1)[$R B^2 j$
], table.cell(rowspan: 1, colspan: 1)[$11 \/ 10000$
],
  table.cell(rowspan: 1, colspan: 1)[$K^2 v^2$
], table.cell(rowspan: 1, colspan: 1)[$579 \/ 20000$
], table.cell(rowspan: 1, colspan: 1)[$K^2 v B$
], table.cell(rowspan: 1, colspan: 1)[$207 \/ 2500$
],
  table.cell(rowspan: 1, colspan: 1)[$K v^3$
], table.cell(rowspan: 1, colspan: 1)[$911 \/ 975000$
], table.cell(rowspan: 1, colspan: 1)[$K v^2 B$
], table.cell(rowspan: 1, colspan: 1)[$349 \/ 420000$
],
  table.cell(rowspan: 1, colspan: 1)[$K v^2 j$
], table.cell(rowspan: 1, colspan: 1)[$5011 \/ 5000$
], table.cell(rowspan: 1, colspan: 1)[$K v B^2$
], table.cell(rowspan: 1, colspan: 1)[$133 \/ 130000$
],
  table.cell(rowspan: 1, colspan: 1)[$K v B j$
], table.cell(rowspan: 1, colspan: 1)[$87 \/ 2500$
], table.cell(rowspan: 1, colspan: 1)[$v^4$
], table.cell(rowspan: 1, colspan: 1)[$1661507 \/ 1521000000$
],
  table.cell(rowspan: 1, colspan: 1)[$v^3 B$
], table.cell(rowspan: 1, colspan: 1)[$633799 \/ 621075000$
], table.cell(rowspan: 1, colspan: 1)[$v^2 B^2$
], table.cell(rowspan: 1, colspan: 1)[$10657 \/ 1690000$
],
)
]],
  caption: [Table 1: All 22 nonzero coefficients of $P_(upright("rem"))$; every unlisted coefficient is zero. Each listed coefficient is positive; the coefficient of $v^4$ gives the coercive lower bound. ],
)

#thm([Proposition 4.2.])[
  (Integrated coercivity).  #emph[Suppose $r \, v \, w \, z \, s$ and the variables $R \, K \, b \, j \, L \, B \, S$ are related as in Lemma 8, with the derivative rules (3.14) and signs (4.1). Assume their quotients extend across zero. Let $f$ be a probability density satisfying $f_x \/ f = r - s$ such that every term of (4.11) is integrable and $r f F_2$ tends to zero at both spatial infinities. Then 
#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E)_f \[ z^2 - 12 v w^2 + 6 v^4 \] gt.eq 1661507 / 1521000000 bb(E)_f v^4 gt.eq 1 / 1000 bb(E)_f v^4 . $ <cert:inequality>]

]
] <cert:coercivity>

#proof[
  Integrating (4.11) removes $cal(W) \( F_2 \)$ by (4.3). Every remaining term on the right is nonnegative. Indeed, the prefactors of the five squares $P_i$ are $R j \, R B \, K v \, v B \, 1$; $T = v \( g_0 R + h j \) gt.eq 0$; and $L \( x_0 v^2 + h b v \) gt.eq 0$. The table gives the stronger bound
  $ P_(upright("rem")) gt.eq 1661507 / 1521000000 v^4 \, #h(2em) 1661507 / 1521000000 - 1 / 1000 = 140507 / 1521000000 > 0 . $
  Using $R b^2 = w^2$ proves (4.12). ◻
]

For the smooth finite-step data of Section 3, Lemma 8 verifies all the hypotheses of this proposition. Although the proof uses the density score and its ratios, the resulting inequality involves only $v \, w \, z$. This is the form that passes to an integrable order parameter.

== 5 Strict curvature on constant intervals <sec:curvature>

We now pass from the smooth finite-step calculation to the order parameters in $cal(U)$. Both sides of the final integrated inequality depend only on spatial derivatives of $Phi$ through order four. The compact-strip bounds and convergence from Section 2 therefore suffice to pass to the limit; no uniform tail constants or convergence of the forward scores are needed.

#thm([Proposition 5.1.])[
  (Constant-interval curvature).  #emph[Let $gamma in cal(U)$ and suppose $gamma = c$ on an open interval $I subset \( 0 \, 1 \)$. For its controlled diffusion, put $q \( t \) = bb(E) Phi_(gamma \, x) \( t \, X_t \)^2$. If $c > 0$, then $q'$ is strictly convex on $I$; more precisely, with $v = c Phi_(gamma \, x x)$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ q''' \( t \) gt.eq frac(1, 1000 c^2) bb(E) v \( t \, X_t \)^4 > 0 \, #h(2em) t in I . $ <eq:strict-curvature>]

 If $c = 0$, then $q'$ is strictly increasing on $I$.]
] <prop:gap-curvature>

#proof[
  Suppose first $c > 0$ and fix $t in I$. Choose a closed neighborhood of $t$ inside $I$. Lemma 4 supplies positive nondecreasing finite-step approximants $gamma_n$, equal to $c$ there, and terminal smoothings $M_n^(- 1) log \( 2 cosh M_n x \)$ with $M_n gt.eq parallel gamma_n parallel_oo$ and $M_n arrow.r oo$. Write $X^n$ for the associated diffusions and $r_n = c Phi_(n \, x)$, $v_n = r_(n \, x)$, $w_n = r_(n \, x x)$, $z_n = r_(n \, x x x)$ on that neighborhood.
  Lemmas 6, 7, and 8 verify all sign, integrability, and boundary hypotheses of Proposition 10. Therefore
  $ bb(E) \[ z_n^2 - 12 v_n w_n^2 + 6 v_n^4 \] \( t \, X_t^n \) gt.eq 1 / 1000 bb(E) v_n \( t \, X_t^n \)^4 . $
  The derivatives through order four converge uniformly in space and are uniformly bounded, by Lemma 2. The coupled paths $X_t^n$ converge, and the next spatial derivative bounds ensure uniform continuity when evaluating at these paths. Thus each expectation in the display converges to its counterpart for $gamma$. In particular no limit of $s_n$, $j_n$, or $w_n \/ r_n$ is needed.
  Equation (2.13) identifies the resulting left side with $c^2 q''' \( t \)$. Lemma 4 also gives $v \( t \, x \) = c Phi_(gamma \, x x) \( t \, x \) > 0$ for every $x$, so its fourth moment is strictly positive. This proves (5.1) at every interior time, hence strict convexity of $q'$. The assertion for $c = 0$ is the last part of Lemma 4; it is not obtained by dividing by $c$. ◻
]

== 6 Full support and regularity <sec:variation>

We now turn the constant-interval curvature into full support. The first variation must allow removal of arbitrary Stieltjes mass, not only removal of atoms: a minimizer need not initially be known to have a discrete or absolutely continuous measure. For related variational characterizations see Chen, Handschy, and Lerman #cite(label("CHL2018")) Propositions 3–4 and Jagannath and Tobasco #cite(label("JT2017")) Lemma 3.2 and Corollary 3.6.

#thm([Lemma 6.1.])[
  (First variation in every admissible integrable direction).  #emph[Let $gamma in cal(U)$, and suppose that $eta in L^1 \( 0 \, 1 \)$ has the property that $gamma + epsilon.alt eta in cal(U)$ for $0 lt.eq epsilon.alt lt.eq epsilon.alt_0$, where $epsilon.alt_0 > 0$. With $X$ and $q$ from Lemma 3, 
#[#set math.equation(numbering: n => "(6.1)")
 $ frac(upright(d), upright(d) epsilon.alt)\|_(epsilon.alt = 0 +) cal(P) \( gamma + epsilon.alt eta \) = 1 / 2 integral_0^1 eta \( t \) \( q \( t \) - t \) thin upright(d) t . $ <eq:first-variation>]

]
] <lem:first-variation>

#proof[
  Put $beta = gamma + epsilon.alt eta$, $u = Phi_(gamma \, x)$, $tilde(u) = Phi_(beta \, x)$, and $D = Phi_beta - Phi_gamma$. Subtracting the two equations gives
  $ D_t = - 1 / 2 D_(x x) - 1 / 2 beta \( tilde(u) + u \) D_x - 1 / 2 \( beta - gamma \) u^2 . $
  Let $Y_0^epsilon.alt = 0$ and
  $ upright(d) Y_t^epsilon.alt = 1 / 2 beta \( t \) \( tilde(u) + u \) \( t \, Y_t^epsilon.alt \) thin upright(d) t + upright(d) B_t . $
  This diffusion exists uniquely by Lemma 2; its drift is bounded by the integrable function $beta$. Itô’s formula on $\[ 0 \, T \]$ yields the following identity. One may justify it without a classical time derivative by approximating $gamma$ and $beta$ separately by nondecreasing step functions, using the same smooth terminal datum for the pair. The two solutions, their spatial derivatives, and the associated linear diffusions converge on $\[ 0 \, T \]$ by Lemma 2 and the same Gronwall estimate as in Lemma 3. The source converges in $L^1$, since the gradients are bounded by one. Passing to the limit in their classical identities gives
  $ D \( 0 \, 0 \) = bb(E) D \( T \, Y_T^epsilon.alt \) + 1 / 2 integral_0^T \( beta - gamma \) \( t \) bb(E) \[ u \( t \, Y_t^epsilon.alt \)^2 \] thin upright(d) t . $
  The time-local form of (2.5) gives $parallel D \( T \, dot.op \) parallel_oo lt.eq 3 / 2 integral_T^1 \| beta - gamma \|$. Letting $T arrow.t 1$ therefore proves the exact identity
  #[#set math.equation(numbering: n => "(6.2)")
   $ frac(Phi_beta \( 0 \, 0 \) - Phi_gamma \( 0 \, 0 \), epsilon.alt) = 1 / 2 integral_0^1 eta \( t \) bb(E) \[ u \( t \, Y_t^epsilon.alt \)^2 \] thin upright(d) t . $ <eq:exact-difference>]
  The coefficients $beta$ have uniformly bounded $L^1$ norms for $0 lt.eq epsilon.alt lt.eq epsilon.alt_0$, and converge to $gamma$ in $L^1$. Lemma 2 gives uniform convergence $tilde(u) arrow.r u$ and common spatial Lipschitz bounds on every compact strip. Coupling the diffusions with the same Brownian motion and using Gronwall’s inequality gives $Y^epsilon.alt arrow.r X$ uniformly there. The integrand in (6.2) consequently converges for each $t < 1$ to $eta \( t \) q \( t \)$ and is bounded in absolute value by $\| eta \( t \) \|$. Dominated convergence and differentiation of the linear penalty term in $cal(P)$ prove (6.1). ◻
]

#thm([Lemma 6.2.])[
  (Contact conditions).  #emph[Let $gamma$ minimize $cal(P)$ over $cal(U)$, and let $mu$ be its locally finite Stieltjes measure on $\[ 0 \, 1 \)$, with the convention $mu \( { 0 } \) = gamma \( 0 \)$. Thus $gamma \( t \) = mu \( \[ 0 \, t \] \)$. Define 
#[#set math.equation(numbering: n => "(6.3)")
 $ G \( s \) = integral_s^1 \( q \( t \) - t \) thin upright(d) t \, #h(2em) S = "supp" mu subset \[ 0 \, 1 \) . $ <eq:contact-potential>]

 Then $G gt.eq 0$ on $\[ 0 \, 1 \)$ and $G = 0$ on $S$. At every $s in S ∩ \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ q \( s \) = s \, #h(2em) q' \( s \) lt.eq 1 . $ <eq:contact-derivatives>]

 If $0 in S$, then also $q' \( 0 \) lt.eq 1$, with the derivative from the right.]
] <lem:contact>

#proof[
  For $s < 1$, the direction $eta = upright(bold(1))_(\[ s \, 1 \))$ adds an atom to $mu$ and is admissible. Minimality and Lemma 12 give $G \( s \) gt.eq 0$. If $K subset \[ 0 \, 1 \)$ is compact, let $nu = mu \|_K$ and take $eta_K \( t \) = - nu \( \[ 0 \, t \] \)$. This bounded direction is admissible for $0 lt.eq epsilon.alt lt.eq 1$, since it replaces $mu$ by $mu - epsilon.alt nu$. Fubini’s theorem gives
  $ 0 lt.eq D cal(P) \( gamma \) \[ eta_K \] = - 1 / 2 integral_K G \( s \) thin mu \( upright(d) s \) . $
  The interchange is legitimate because $\| q \( t \) - t \| lt.eq 1$ and $nu \( K \) < oo$. Since $G gt.eq 0$, it vanishes $mu$-almost everywhere on every such $K$. Its continuity then gives $G = 0$ on the relative support $S$.
  By Lemma 3, $G' \( s \) = s - q \( s \)$ and $G'' \( s \) = 1 - q' \( s \)$ on compact strips. Every interior support point is a minimum of $G$, proving (6.4). If $0 in S$, use $G \( 0 \) = 0$ and $q \( 0 \) = 0$ to write
  $ G \( h \) = 1 / 2 \( 1 - q' \( 0 \) \) h^2 + o \( h^2 \) . $
  Nonnegativity for $h > 0$ proves the asserted one-sided condition. ◻
]

#thm([Lemma 6.3.])[
  (No terminal plateau).  #emph[For a minimizer $gamma$, there is no $a < 1$ and finite $c gt.eq 0$ such that $gamma = c$ on $\( a \, 1 \)$.]
] <lem:no-terminal-plateau>

#proof[
  The endpoint conclusion is recorded by Auffinger, Chen, and Zeng #cite(label("ACZ2017")) Remark 7. We give the quantitative argument needed here, including arbitrary positive constant plateaus. The boundary-layer method is also related to the zero-terminal-segment argument in El Alaoui, Montanari, and Sellke #cite(label("EAMS2021")) Lemma 6.12 and the proof of Theorem 5 in the cited preprint; their positivity-support statement concerns a different admissible class. Suppose such a plateau exists. We show that for some $C > 0$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ 1 - q \( t \) gt.eq C sqrt(1 - t) quad upright("for all ") t upright(" sufficiently close to one") . $ <eq:terminal-layer>]
  Fix $s in \( a \, 1 \)$, and let $rho_s$ denote the law of $X_s$. Choose $R < oo$ with $p_0 = rho_s \( \[ - R \, R \] \) > 0$; no density assumption on $rho_s$ is needed.
  When $c > 0$, set $h \( t \, y \) = bb(E) exp \( c \| y + sqrt(1 - t) Z \| \)$, with $Z$ standard normal. The heat formula gives $Phi \( t \, y \) = c^(- 1) log h \( t \, y \)$ and drift $c Phi_x = h_x \/ h$. Its transition density on the plateau is
  #[#set math.equation(numbering: n => "(6.6)")
   $ k_(s \, t) \( x \, y \) = p_(t - s) \( y - x \) frac(h \( t \, y \), h \( s \, x \)) \, #h(2em) p_v \( z \) = e^(- z^2 \/ \( 2 v \)) / sqrt(2 pi v) . $ <eq:terminal-kernel>]
  Indeed, the heat-semigroup identity makes $h \( t \, B_t \) \/ h \( s \, B_s \)$ a positive mean-one martingale when Brownian motion is started at $\( s \, x \)$. Its stochastic logarithm has the bounded coefficient $h_x \/ h = c Phi_x$, so change of measure gives precisely this drift and kernel. For $c = 0$ use the same kernel formula with $h equiv 1$.
  Put $L = 1 - s$ and $delta = L \/ 2$. Uniformly for $s + delta lt.eq t < 1$, $\| x \| lt.eq R$, and $\| y \| lt.eq 1$,
  $ p_(t - s) \( y - x \) gt.eq \( 2 pi L \)^(- 1 \/ 2) e^(- \( R + 1 \)^2 \/ \( 2 delta \)) = : k_(*) > 0 \, $
  while $h \( t \, y \) gt.eq 1$ and $h \( s \, x \) lt.eq e^(c R) bb(E) e^(c sqrt(L) \| Z \|) = : M$. Consequently the mixture of (6.6) against $rho_s$ is a density $f_t$ satisfying
  #[#set math.equation(numbering: n => "(6.7)")
   $ f_t \( y \) gt.eq p_0 k_(*) \/ M = : m > 0 quad \( s + delta lt.eq t < 1 \, med \| y \| lt.eq 1 \) . $ <eq:terminal-density>]
  For $epsilon.alt = 1 - t$ and $\| y \| lt.eq sqrt(epsilon.alt)$, differentiation of the terminal heat formula gives, also when $c = 0$,
  $ u \( t \, y \) = frac(bb(E) \[ "sgn" \( y + sqrt(epsilon.alt) Z \) e^(c \| y + sqrt(epsilon.alt) Z \|) \], bb(E) e^(c \| y + sqrt(epsilon.alt) Z \|)) . $
  For $epsilon.alt lt.eq 1$ the denominator is at most $D = e^c bb(E) e^(c \| Z \|) < oo$. The unnormalized mass of each sign is at least $p_(*) := Pr \( Z gt.eq 1 \) > 0$, because $\| y \/ sqrt(epsilon.alt) \| lt.eq 1$ and the exponential tilt is at least one. Each sign thus has probability at least $theta = p_(*) \/ D in \( 0 \, 1 \/ 2 \)$ under the normalized tilt. Hence $\| u \( t \, y \) \| lt.eq 1 - 2 theta$ and $1 - u \( t \, y \)^2 gt.eq 4 theta \( 1 - theta \) = : kappa > 0$. Integrating this bound over $\[ - sqrt(epsilon.alt) \, sqrt(epsilon.alt) \]$ and using (6.7) proves (6.5) with $C = 2 m kappa$.
  It follows that $q \( t \) - t lt.eq \( 1 - t \) - C sqrt(1 - t) < 0$ sufficiently near one. Thus $G \( s' \) < 0$ for $s'$ sufficiently near one, contrary to Lemma 13. This also covers $c = 0$. ◻
]

#proof[
  Let $S$ be the support in Lemma 13. Since $S$ is relatively closed in $\[ 0 \, 1 \)$, a nonempty component of its complement is an initial, interior, or terminal interval. On each such interval $gamma$ is constant. A terminal component is impossible by Lemma 14; that lemma also excludes empty support, for which $gamma = 0$.
  Consider a remaining gap with endpoints $0 lt.eq a < b < 1$ and with $a \, b in S$. By Lemma 13, $q \( a \) = a$, $q \( b \) = b$, and $q' \( a \) \, q' \( b \) lt.eq 1$, including the one-sided interpretation at $a = 0$. If its constant coefficient is positive, Proposition 11 makes $q'$ strictly convex inside the gap. By continuity up to its endpoints,
  $ q' \( t \) < frac(b - t, b - a) q' \( a \) + frac(t - a, b - a) q' \( b \) lt.eq 1 \, #h(2em) a < t < b . $
  Integrating contradicts $q \( b \) - q \( a \) = b - a$, as illustrated by the positive area deficit in Figure 1. If the constant coefficient is zero, the strict increase in Proposition 11 instead gives $q' \( t \) < q' \( b \) lt.eq 1$, with the same contradiction.
  It remains only to consider an initial component $\[ 0 \, b \)$ when $0 in.not S$ and $b in S$. Here $gamma = 0$ on the gap. Strict increase gives $q' \( t \) < q' \( b \) lt.eq 1$ for $0 < t < b$, whereas $q \( 0 \) = 0$ and $q \( b \) = b$. Integration is again a contradiction. Thus $S = \[ 0 \, 1 \)$. The contact identities give $q \( t \) = t$ for $0 < t < 1$, and the identity at zero follows from symmetry. Differentiating this identity using Lemma 3 gives $bb(E) Phi_(gamma \, x x) \( t \, X_t \)^2 = 1$, including the right derivative at zero. Finally, every nonempty interval $\( a \, b \)$ with $0 lt.eq a < b < 1$ has positive $mu$ mass, so $gamma \( b \) - gamma \( a \) = mu \( \( a \, b \] \) > 0$. ◻
]

=== 6.1 Smoothness and positivity of the density <sec:density>

The smoothness conclusion and its deduction from saturated consistency appear in Chen #cite(label("Chen2026")) Theorem 1.3 and Proposition 4.6. We include the argument to show how Theorem 1 determines the regularity of the minimizing order parameter. The polynomial-moment differentiation follows Auffinger and Chen #cite(label("ACProperties2015")) Lemma 2 and the proof of Theorem 2(ii), in its zero-temperature form in Chen #cite(label("Chen2026")) Appendix B.6; the Hessian semimartingale identity is also given by Chen, Handschy, and Lerman #cite(label("CHL2018")) Lemma 3. We then use the coercive inequality of Section 4 to prove that the density is strictly positive at every positive time below one.

#thm([Corollary 6.4.])[
  (Smooth positive density of the minimizing measure).  #emph[Let $gamma in cal(U)$ minimize $cal(P)$, and let $X$ be its controlled diffusion. Then $gamma \( 0 \) = 0$ and $gamma$ is smooth on $\[ 0 \, 1 \)$, with derivatives at zero understood from the right. Moreover, 
#[#set math.equation(numbering: n => "(6.8)")
 $ gamma \( t \) = frac(bb(E) \[ Phi_(gamma \, x x x) \( t \, X_t \)^2 \], 2 bb(E) \[ Phi_(gamma \, x x) \( t \, X_t \)^3 \]) \, #h(2em) 0 lt.eq t < 1 . $ <eq:gamma-moment-ratio>]

 Consequently $mu_gamma \( upright(d) t \) = gamma' \( t \) thin upright(d) t$ on $\[ 0 \, 1 \)$, where $gamma'$ is smooth and nonnegative. In fact, for $0 < t < 1$, 
#[#set math.equation(numbering: n => "(6.9)")
 $ 2 gamma' \( t \) bb(E) \[ Phi_(gamma \, x x) \( t \, X_t \)^3 \] gt.eq frac(gamma \( t \)^2, 1000) bb(E) \[ Phi_(gamma \, x x) \( t \, X_t \)^4 \] > 0 . $ <eq:positive-density-bound>]

 In particular $gamma' \( t \) > 0$ on $\( 0 \, 1 \)$.]
] <cor:smooth-measure>

#proof[
  Write $f_k = partial_x^k Phi_gamma$ for $k gt.eq 1$, and evaluate these functions along $X$ unless otherwise indicated. All spatial derivatives are bounded on each compact time strip by Lemma 2. Differentiating the PDE and applying Itô’s formula gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ upright(d) f_k \( t \, X_t \) = - frac(gamma \( t \), 2) sum_(j = 1)^(k - 1) binom(k, j) f_(j + 1) \( t \, X_t \) f_(k - j + 1) \( t \, X_t \) thin upright(d) t + f_(k + 1) \( t \, X_t \) thin upright(d) B_t . $ <eq:spatial-derivative-martingales>]
  The sum is empty for $k = 1$. For general integrable $gamma$, this identity follows by the finite-step approximation and Itô isometry used in Lemma 3. On a fixed strip the spatial factors converge uniformly along the coupled paths, the time coefficients converge in $L^1$, and the stochastic integrals converge in $L^2$.
  For $a = f_2$ and $b = f_3$, the identity is $upright(d) a = - gamma a^2 thin upright(d) t + b thin upright(d) B_t$. Hence
  $ frac(upright(d), upright(d) t) bb(E) a \( t \, X_t \)^2 = bb(E) b \( t \, X_t \)^2 - 2 gamma \( t \) bb(E) a \( t \, X_t \)^3 quad upright("for almost every ") t < 1 . $
  The left side is zero by Theorem 1. Convexity gives $a gt.eq 0$, and the same theorem gives $bb(E) a^2 = 1$, so $bb(E) a^3 gt.eq \( bb(E) a^2 \)^(3 \/ 2) = 1$. The ratio on the right of (6.8) is therefore well defined and continuous on every compact time strip. Its almost-everywhere equality with $gamma$ extends to every time by right continuity. In particular $gamma$ is continuous. At time zero, evenness gives $b \( 0 \, 0 \) = 0$, so the formula yields $gamma \( 0 \) = 0$.
  To bootstrap regularity without assuming time derivatives of $gamma$, consider all polynomial moments of the spatial derivatives at once. For a polynomial $P = P \( y_1 \, dots.h \, y_m \)$, define
  $ M_P \( t \) = bb(E) P \( f_1 \( t \, X_t \) \, dots.h \, f_m \( t \, X_t \) \) . $
  In formal variables $y_1 \, y_2 \, dots.h$, set
  $ D_k \( y \) & = - 1 / 2 sum_(j = 1)^(k - 1) binom(k, j) y_(j + 1) y_(k - j + 1) \,\
Q_P \( y \) & = 1 / 2 sum_(k \, l = 1)^m \( partial_k partial_l P \) \( y \) y_(k + 1) y_(l + 1) \,\
R_P \( y \) & = sum_(k = 1)^m \( partial_k P \) \( y \) D_k \( y \) . $
  These are polynomials in finitely many variables, with $D_1 = 0$. Itô’s product rule and (6.10) give
  #[#set math.equation(numbering: n => "(6.11)")
   $ M_P \( t \) - M_P \( 0 \) = integral_0^t #scale(x: 120%, y: 120%)[\(] M_(Q_P) \( s \) + gamma \( s \) M_(R_P) \( s \) #scale(x: 120%, y: 120%)[\)] thin upright(d) s . $ <eq:polynomial-moment-bootstrap>]
  Every such moment is finite and continuous on each compact strip. Since $gamma$ is continuous, (6.11) makes every $M_P$ continuously differentiable; the ratio (6.8) then makes $gamma$ continuously differentiable. More generally, if $gamma$ and all these moments are $C^k$, the integrand in (6.11) is $C^k$ for every $P$, making all moments $C^(k + 1)$. The same ratio makes $gamma$ $C^(k + 1)$. Induction proves smoothness, including right derivatives at zero.
  Smoothness and $gamma \( 0 \) = 0$ identify its Stieltjes measure with $gamma' \( t \) thin upright(d) t$, and monotonicity gives $gamma' gt.eq 0$. It remains to prove strict positivity away from zero. Set $d = f_4$. The polynomial-moment identities give
  $ frac(upright(d), upright(d) t) bb(E) b^2 = bb(E) d^2 - 6 gamma bb(E) \( a b^2 \) \, #h(2em) frac(upright(d), upright(d) t) bb(E) a^3 = 3 bb(E) \( a b^2 \) - 3 gamma bb(E) a^4 . $
  Differentiating $bb(E) b^2 = 2 gamma bb(E) a^3$ therefore yields
  #[#set math.equation(numbering: n => "(6.12)")
   $ 2 gamma' bb(E) a^3 = bb(E) d^2 - 12 gamma bb(E) \( a b^2 \) + 6 gamma^2 bb(E) a^4 . $ <eq:density-curvature-identity>]
  All factors in this identity are evaluated at $\( t \, X_t \)$.
  Fix $t in \( 0 \, 1 \)$ and put $c = gamma \( t \)$. Full support implies $c > 0$. We next apply the integrated coercivity estimate at this fixed time, although $gamma$ need not be constant on a neighborhood of $t$. Choose $delta_n arrow.b 0$ with $\[ t - delta_n \, t + delta_n \] subset \( 0 \, 1 \)$. Replace $gamma$ on $\[ t - delta_n \, t + delta_n \)$ by the value $c$. This preserves monotonicity, since $gamma \( s \) lt.eq c$ for $s < t$ and $gamma \( s \) gt.eq c$ for $s > t$, and the change tends to zero in $L^1$. Outside that interval, truncate at a height greater than $c$, impose a positive lower cutoff less than $c$, and approximate separately on the left and right by nondecreasing finite step functions with values at most $c$ and at least $c$, respectively. Let the truncation height tend to infinity, the lower cutoff tend to zero, and the discretization error tend to zero. The resulting positive bounded nondecreasing coefficients $gamma_n$ converge to $gamma$ in $L^1$ and equal $c$ on a neighborhood of $t$ for every $n$.
  Use terminal data $M_n^(- 1) log \( 2 cosh \( M_n x \) \)$, with $M_n gt.eq parallel gamma_n parallel_oo$ and $M_n arrow.r oo$, and let $a_n \, b_n \, d_n$ and $X^n$ denote the corresponding spatial derivatives and diffusion. At time $t$, the scaled derivatives in Proposition 10 are $v_n = c a_n$, $w_n = c b_n$, and $z_n = c d_n$. Thus that proposition and Lemmas 6–8 give
  $ bb(E) \[ d_n^2 - 12 c a_n b_n^2 + 6 c^2 a_n^4 \] \( t \, X_t^n \) gt.eq c^2 / 1000 bb(E) a_n \( t \, X_t^n \)^4 . $
  The derivative bounds and convergence on a fixed compact strip from Lemmas 2 and 3 do not depend on the widths $delta_n$ of the artificial plateaus. They therefore allow passage to the limit in every expectation in the last display. Combine the limiting inequality with (6.12) and $c = gamma \( t \)$ to obtain (6.9). Its right side is strictly positive because $c > 0$ and $bb(E) a^4 gt.eq \( bb(E) a^2 \)^2 = 1$. The proof asserts only $gamma' \( 0 \) gt.eq 0$ at the left endpoint. ◻
]

== 7 Martingale representation and optimization consequences <sec:consequences>

Full support gives the gradient martingale exactly the second-moment profile of Brownian motion: $bb(E) u_gamma \( t \, X_t \)^2 = t$. Its correlation with the driving Brownian motion recovers the ground-state value. We first prove this identity and then approximate it using a single ${ - 1 \, 1 }$-valued function of finitely many independent Gaussians. The gradient-martingale and normalized Euler approach is developed in Montanari #cite(label("Montanari2019")) Sections 2–3 and El Alaoui, Montanari, and Sellke #cite(label("EAMS2021")) Sections 5–6 of the cited preprint. Here Theorem 1 supplies the required zero-temperature second-moment normalization.

#thm([Corollary 7.1.])[
  (Martingale representation of the value).  #emph[Let $gamma$ be a minimizer, let $X$ be its diffusion, and write $u = Phi_(gamma \, x)$ and $a = Phi_(gamma \, x x)$. There is a bounded martingale terminal value $U_1$ such that $u \( t \, X_t \) arrow.r U_1$ almost surely and in $L^2$ as $t arrow.t 1$, with $U_1^2 = 1$ almost surely. Moreover, 
#[#set math.equation(numbering: n => "(7.1)")
 $ P_(*) & = bb(E) \| X_1 \| - integral_0^1 t gamma \( t \) thin upright(d) t\
 & = bb(E) \[ U_1 B_1 \] = integral_0^1 bb(E) a \( t \, X_t \) thin upright(d) t . $ <eq:value-identities>]

 The last integral is finite.]
] <cor:value>

#proof[
  Lemma 3 gives the bounded martingale $u \( t \, X_t \) = integral_0^t a \( s \, X_s \) thin upright(d) B_s$. By Theorem 1, its second moment is $t$ and $bb(E) a \( t \, X_t \)^2 = 1$. Martingale convergence therefore gives $U_1$ with $\| U_1 \| lt.eq 1$ and $bb(E) U_1^2 = 1$, hence $U_1^2 = 1$ almost surely. The diffusion converges to $X_1$ almost surely and in $L^2$, because its drift has deterministic integrable bound $gamma$.
  The uniform terminal bound (2.1) and convexity show that $u \( t \, x_t \) arrow.r "sgn" \( x \)$ whenever $x_t arrow.r x eq.not 0$. Indeed, for a fixed small $h > 0$, the derivative of a convex function at $x_t$ lies between its left and right difference quotients of step $h$; uniform convergence to $\| dot.op \|$ makes both limits equal to the sign when the interval stays away from zero. Consequently $U_1 X_1 = \| X_1 \|$ almost surely, with no need to exclude $X_1 = 0$.
  Itô’s formula along the optimal diffusion, justified on compact strips as in Lemma 3, gives
  $ bb(E) Phi_gamma \( t \, X_t \) = Phi_gamma \( 0 \, 0 \) + 1 / 2 integral_0^t gamma \( s \) bb(E) u \( s \, X_s \)^2 thin upright(d) s . $
  Let $t arrow.t 1$. The terminal bound and $L^1$ convergence of $X_t$ identify the left side with $bb(E) \| X_1 \|$. Substitute $bb(E) u \( s \, X_s \)^2 = s$ and the definition of $cal(P)$ to obtain the first line of (7.1). Since $X_1 = B_1 + integral_0^1 gamma \( s \) u \( s \, X_s \) thin upright(d) s$, martingality and Fubini’s theorem yield
  $ bb(E) \[ U_1 X_1 \] = bb(E) \[ U_1 B_1 \] + integral_0^1 gamma \( s \) bb(E) \[ u \( s \, X_s \)^2 \] thin upright(d) s . $
  All terms are integrable because $\| u \| \, \| U_1 \| lt.eq 1$ and $gamma in L^1$. Finally the $L^2$ stochastic-integral identity at time one implies $bb(E) \[ U_1 B_1 \] = integral_0^1 bb(E) a \( s \, X_s \) thin upright(d) s$. The integral is absolutely bounded by one using $bb(E) \| a \( s \, X_s \) \| lt.eq \( bb(E) a \( s \, X_s \)^2 \)^(1 \/ 2) = 1$. ◻
]

The last expression in (7.1) is the expected covariation of the gradient martingale with its driving Brownian motion. To approximate it, replace the diffusion by an Euler scheme on a fixed strip $\[ 0 \, T \]$, where $T < 1$. The continuum identity $bb(E) a \( t \, X_t \)^2 = 1$ makes each martingale increment have variance equal to its time step. The Euler scheme has only an approximate version of this normalization, so we normalize its Gaussian-weighted directions to unit variance.

One additional independent Gaussian then rounds the Euler terminal gradient to a spin while preserving its conditional mean. The coefficients $A_j$ below measure this spin’s correlations with the normalized martingale directions; the coefficients $B_i$ measure its correlations with the original Gaussian coordinates. Their adjacent-index product converges to the same covariation integral. These are scalar Gaussian coefficients, not an implementation on the finite-spin disorder.

On this fixed strip, $u \, a$ and all their spatial derivatives are bounded; the Gaussian increments remain unbounded. We first refine the mesh and only afterwards let $T$ approach one. The mesh count $N$ is distinct from the spin-system size $n$ in the introduction.

#thm([Proposition 7.2.])[
  (Finite Gaussian coefficients).  #emph[Fix $0 < T < 1$, a minimizer $gamma$, and $u \, a$ as above. For an integer $N gt.eq 1$ put $Delta = T \/ N$ and $t_j = j Delta$. On independent standard normal variables $Z_1 \, dots.h \, Z_(N + 1)$, define 
#[#set math.equation(numbering: n => "(7.2)")
 $ Y_0 & = 0 \, #h(2em) Y_j = Y_(j - 1) + sqrt(Delta) Z_j + Delta gamma \( t_(j - 1) \) u \( t_(j - 1) \, Y_(j - 1) \) \, &  & 1 lt.eq j lt.eq N \,\
c_j & = #scale(x: 120%, y: 120%)[\(] bb(E) a \( t_(j - 1) \, Y_(j - 1) \)^2 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 2) > 0 \, #h(2em) g_j = c_j a \( t_(j - 1) \, Y_(j - 1) \) Z_j . $ <eq:euler>]

 For all sufficiently large $N$ these constants are finite and positive. For these mesh counts, let $F_(upright(G))$ denote the standard normal distribution function and set 
$ F_N = "sgn" #scale(x: 120%, y: 120%)[\(] u \( T \, Y_N \) + 2 F_(upright(G)) \( Z_(N + 1) \) - 1 #scale(x: 120%, y: 120%)[\)] \,\
A_j = bb(E) \[ F_N g_j \] \, #h(2em) B_i = bb(E) \[ F_N Z_i \] \, #h(2em) A_0 = 0 . $

 Here $1 lt.eq j lt.eq N$ and $1 lt.eq i lt.eq N + 1$ in the definitions of $A_j$ and $B_i$. The value of the sign at zero is immaterial. Then 
#[#set math.equation(numbering: n => "(7.3)")
 $ lim_(N arrow.r oo) sum_(j = 0)^N A_j B_(j + 1) = integral_0^T bb(E) a \( t \, X_t \) thin upright(d) t . $ <eq:finite-value>]

 Letting $T arrow.t 1$ on the right gives $P_(*)$.]
] <prop:gaussian>

#proof[
  #emph[Euler convergence and normalization.] Use Brownian increments $sqrt(Delta) Z_j = B_(t_j) - B_(t_(j - 1))$ to couple (7.2) to $X$ up to time $T$. Lemma 2, on a slightly larger strip, bounds all spatial derivatives of $u \, a$. Their almost-everywhere time derivatives given by the PDE are bounded there, so $u \, a$ are uniformly Lipschitz in time and space. The drift $gamma u$ is spatially Lipschitz with a common bound. For its time dependence, it is enough to use that $gamma$ is bounded and monotone. If $pi_N \( s \) = t_(j - 1)$ on $\[ t_(j - 1) \, t_j \)$, then
  $ integral_0^T \| gamma \( s \) - gamma \( pi_N \( s \) \) \| thin upright(d) s lt.eq Delta #scale(x: 120%, y: 120%)[\(] gamma \( T \) - gamma \( 0 \) #scale(x: 120%, y: 120%)[\)] . $
  Also $bb(E) \| X_s - X_(pi_N \( s \)) \|^2 lt.eq C Delta$. Subtract the two integral drift equations at the grid points, use these bounds and the Lipschitz bounds, and apply discrete Gronwall. This gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ bb(E) max_(j lt.eq N) \| Y_j - X_(t_j) \|^2 arrow.r 0 . $ <eq:euler-convergence>]
  More explicitly, the $L^2$ norm of the sum of local drift errors is at most $C sqrt(Delta) + C Delta$; the remaining errors satisfy $e_j lt.eq C Delta sum_(i < j) e_i + o \( 1 \)$, which proves the claim.
  Uniform convergence in (7.4), boundedness and Lipschitz continuity of $a$, and $bb(E) a \( t \, X_t \)^2 = 1$ imply $max_(j lt.eq N) \| c_j - 1 \| arrow.r 0$. The $g_j$ form an orthonormal family in $L^2$: they have unit second moment by definition and zero conditional mean given the previous increments. Itô isometry, (7.4), and the same continuity estimates give
  $ M_N := sum_(j = 1)^N sqrt(Delta) thin a \( t_(j - 1) \, Y_(j - 1) \) Z_j = u \( T \, Y_N \) + o_(L^2) \( 1 \) . $
  #emph[Rounding and the two coefficient vectors.] The independent random variable $F_(upright(G)) \( Z_(N + 1) \)$ is uniform on $\( 0 \, 1 \)$. For any $v in \[ - 1 \, 1 \]$, the sign of $v + 2 U - 1$, with $U$ uniform on $\( 0 \, 1 \)$, has mean $v$. Hence $bb(E) \[ F_N divides Z_1 \, dots.h \, Z_N \] = u \( T \, Y_N \)$ exactly. This preserves every correlation with a function of the first $N$ Gaussians. Bessel’s inequality applied to $u \( T \, Y_N \) - M_N$ against the two orthonormal families $\( g_j \)_(j = 1)^N$ and $\( Z_i \)_(i = 1)^N$ yields
  $ \( A_j \)_(j = 1)^N & = \( sqrt(Delta) \/ c_j \)_(j = 1)^N + o_(ell^2) \( 1 \) \,\
\( B_i \)_(i = 1)^N & = \( sqrt(Delta) thin bb(E) a \( t_(i - 1) \, Y_(i - 1) \) \)_(i = 1)^N + o_(ell^2) \( 1 \) . $
  For the second equality, terms of $M_N$ before $i$ are independent of $Z_i$, and those after $i$ have zero conditional mean; the $i$th term contributes the stated expectation. The first equality follows from orthogonality of the $g_j$ and $M_N = sum_j sqrt(Delta) thin g_j \/ c_j$.
  #emph[The shifted product.] The first coefficient vector is asymptotically the constant vector with entries $sqrt(Delta)$, because $c_j arrow.r 1$ uniformly. The second has entries $sqrt(Delta)$ times the expected Hessian at the preceding mesh point. Pairing $A_j$ with $B_(j + 1)$ therefore selects the expected Hessian at $t_j$, which is a Riemann-sum value for the target integral. To justify the accumulated errors, the vectors in both displays have bounded $ell^2$ norm. Cauchy–Schwarz shows that their errors contribute $o \( 1 \)$ to the shifted scalar product with $1 lt.eq j < N$. The first display also gives $A_N = sqrt(Delta) \/ c_N + o \( 1 \) = o \( 1 \)$. The remaining term therefore obeys $\| A_N B_(N + 1) \| lt.eq \| A_N \| = o \( 1 \)$, since $\| B_(N + 1) \| lt.eq 1$. Thus the sum in (7.3) differs by $o \( 1 \)$ from
  $ Delta sum_(j = 1)^(N - 1) frac(bb(E) a \( t_j \, Y_j \), c_j) . $
  This converges to the stated integral by (7.4), uniform convergence of $c_j$ to one, and continuity of $t mapsto bb(E) a \( t \, X_t \)$. Corollary 16 gives its limit as $T arrow.t 1$. ◻
]

=== 7.1 An application of the existing optimization theorem <sec:algorithm-application>

The full-support theorem also verifies the hypothesis of an existing algorithmic result. We use the operation count of El Alaoui, Montanari, and Sellke #cite(label("EAMS2021")) Remark 2.1, Theorem 3, and Corollary 2.2 of the cited preprint: real sums and products have unit cost, and the scalar functions and normalization constants are those prescribed in their algorithm for the chosen accuracy. This is an instance-size bound; the argument below supplies no separate complexity estimate for numerical preprocessing of those functions or for finite-precision arithmetic.

#thm([Corollary 7.3.])[
  (Asymptotically optimal SK optimization).  #emph[For every fixed $epsilon.alt > 0$, there is a randomized algorithm with operation count at most $C \( epsilon.alt \) n^2$ in the model just described, where $C \( epsilon.alt \)$ is independent of $n$, that takes the Gaussian couplings of $H_n$ as input and returns $sigma^(upright("alg")) in { - 1 \, 1 }^n$ such that 
$ Pr {H_n \( sigma^(upright("alg")) \) gt.eq max_(sigma in { - 1 \, 1 }^n) H_n \( sigma \) - epsilon.alt n} arrow.r 1 #h(2em) \( n arrow.r oo \) . $

 The probability includes the couplings and the algorithm’s randomness.]
] <cor:algorithm>

#proof[
  Theorem 1 gives a strictly increasing minimizer in $cal(U)$, exactly the no-overlap-gap hypothesis in #cite(label("EAMS2021")) Assumption 2 for $xi \( t \) = t^2 \/ 2$. We apply their Corollary 2.2, with its operation count from Theorem 3.
  To match their Gaussian quadratic input, form a symmetric matrix $A$ with $A_(i j) = J_(i j) \/ sqrt(n)$ for $i < j$ and independent diagonal entries $A_(i i) = sqrt(2 \/ n) thin G_i$, where the $G_i$ are independent standard Gaussians. The quadratic extension $hat(H)_n \( x \) = 1 / 2 x^(sans(T)) A x$ has covariance $\( 2 n \)^(- 1) \( sigma^(sans(T)) tau \)^2$ on the hypercube, and
  $ hat(H)_n \( sigma \) = H_n \( sigma \) + 1 / sqrt(2 n) sum_(i = 1)^n G_i . $
  The second term is independent of $sigma$, so every optimization gap is identical for $H_n$ and $hat(H)_n$.
  Evaluating $nabla hat(H)_n \( x \) = A x$ costs $O \( n^2 \)$ operations. The part with distinct indices is $H_n \( x \)$, and evaluating one coordinate of its gradient costs $O \( n \)$. Thus the bound $C \( epsilon.alt \) \( chi + n \) + n chi_1$ in the cited theorem is $C \( epsilon.alt \) n^2$, after changing the constant. Its probability guarantee and the equality of the optimization gaps give the assertion. ◻
]

This corollary invokes the finite-disorder message-passing theorem of El Alaoui, Montanari, and Sellke. Proposition 17 supplies the separate scalar approximation proved above.


#bibliography("refs.bib", style: "ieee", title: [References])
