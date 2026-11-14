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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform Bi-Hölder Transport from Weak MTW]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For the squared-distance cost on a compact Riemannian manifold,
  positive upper and lower density bounds give an almost-everywhere optimal map,
  but continuity depends on the geometry of the cost. The weak Ma–Trudinger–Wang condition controls that geometry
  where the cost is smooth. We prove that it gives a common Hölder estimate for the map and its inverse throughout
  each fixed density-bounded class, even when transport graphs approach conjugate pairs.

Let $\( M \, g \)$ be a smooth connected compact Riemannian manifold without boundary, of dimension $n gt.eq 2$.
  Write $d$ and $"vol"$ for its distance and volume measure, and set

$ c \( x \, y \) = 1 / 2 d \( x \, y \)^2 \, wide I \( x \) = { p in T_x M : med d \( x \, exp_x \( a p \) \) =
  a \| p \| upright(" for some ") a > 1 } . $

We assume the weak Ma–Trudinger–Wang condition: for every $p in I \( x \)$ and $xi \, eta in T_x M$ with $xi perp eta$,

#[#set math.equation(numbering: n => "(1.1)")
 $ - 3 / 2 frac(partial^4, partial s^2 partial t^2) c #scale(x: 120%, y: 120%)[\(] exp_x \( t xi \) \,
   exp_x \( p + s eta \) #scale(x: 120%, y: 120%)[\)]\|_(s = t = 0) gt.eq 0 . $ <eq:weak-mtw>]

The cost is smooth near the pair in this formula. No curvature inequality at a nonsmooth cost pair is assumed.
  For probability densities $rho_0 \, rho_1$, an optimal map is a measurable map $T$ with
  $T_(\#) \( rho_0 "vol" \) = rho_1 "vol"$ that minimizes $integral_M c \( x \, T \( x \) \) rho_0 \( x \) thin d
  "vol" \( x \)$ among maps with that pushforward.

#thm([Theorem 1.1.])[
  (Uniform bi-Hölder transport).  #emph[Fix $\( M \, g \)$ as above and $0 < lambda lt.eq
    Lambda < oo$ for which the following density class is nonempty.
    There are $alpha in \( 0 \, 1 \]$ and $C < oo$, depending only on $\( M \, g \) \, lambda \, Lambda$,
    such that the following holds for every pair of measurable densities satisfying
$ integral_M rho_i thin d "vol" = 1 \, wide lambda lt.eq rho_i lt.eq Lambda quad
  "vol" upright("-almost everywhere") \, wide i = 0 \, 1 . $

 The almost-everywhere unique optimal map from $rho_0 "vol"$ to $rho_1
   "vol"$ for the cost $c$ has a homeomorphic representative $tilde(T) : M arrow.r M$, and
$ d \( tilde(T) \( x \) \, tilde(T) \( x' \) \) lt.eq C d \( x \, x' \)^alpha \, wide
  d \( tilde(T)^(- 1) \( y \) \, tilde(T)^(- 1) \( y' \) \) lt.eq C d \( y \, y' \)^alpha $

 for all $x \, x' \, y \, y' in M$.]
] <thm:main>

The constants are common to the full density class on the fixed manifold.
  They do not depend on individual densities or their derivatives.
  The theorem includes conjugate cut points, and does not assume nonfocality, strict MTW, or cut avoidance.
  We obtain a positive exponent by contradiction; no explicit exponent or uniformity over varying metrics is asserted.

=== 1.1 Context and geometric input <context-and-geometric-input>

McCann’s polar factorization theorem supplies the almost-everywhere unique optimal map and its cost potential
  #cite(label("McCann2001")). The curvature condition originates in the work of Ma–Trudinger–Wang
  #cite(label("MTW2005")); Loeper established its connection with supporting cost functions and continuity
  #cite(label("Loeper2009")). Sections and contact-volume comparison are central tools in Caffarelli’s theory
  #cite(label("Caffarelli1992")) and in the weak-MTW regularity theory of Figalli–Kim–McCann
  #cite(label("FKM2013Holder")) Theorem 2.1 and Corollary 9.6. These results already treat rough densities.
  Their smooth-cost Hölder estimates require the appropriate cost-convexity and nondegeneracy hypotheses.
  A density-controlled exponent after localization does not by itself provide a common localization scale or
  Hölder constant for a family whose transport graphs approach conjugate pairs.

Uniform control over a density-bounded class is known in important geometric settings.
  Loeper–Villani obtain such estimates under strict MTW and nonfocality,
  with a further extension under their uniform-regularity hypothesis and positivity of the minimizing-fiber
  diameter $delta \( M \)$ #cite(label("LoeperVillani2010")) Corollaries 8.3–8.4.
  Figalli–Kim–McCann prove uniform cut separation on products of round spheres #cite(label("FKM2013Spheres"))
  Theorem 5.1 and Corollary 5.2. The issue addressed here is the general fixed weak-MTW manifold,
  without imposing such separation. A different quantitative stability result of Warren #cite(label("Warren2026"))
  Theorem 1 assumes common $C^2$ norm bounds on the logarithms of smooth densities and sufficiently small
  Wasserstein distance; those assumptions are not part of the measurable-density class considered here.

The density-free input is proved in the companion paper #emph[Global Support and Convex Injectivity Domains under
  Weak MTW] #cite(label("Foundation2026")). It derives convexity of open and closed injectivity domains,
  global support for every ordinary subgradient, and uniform intermediate regularity from (1.1).
  We state the complete interface in Section 2. The global supporting conclusion has an important antecedent:
  Figalli–Rifford–Villani #cite(label("FRV2011")) Lemma 3.1 prove the global double-mountain principle assuming
  convex injectivity domains as well as weak MTW. The companion supplies the geometric hypothesis under weak MTW
  alone, together with the intermediate statements needed below.
  Figalli–Gallouët–Rifford #cite(label("FGR2015")) Theorem 1.7 previously proved the convexity implication under
  nonfocality. On compact surfaces, Figalli–Rifford–Villani #cite(label("FRV2011")) Theorem 1.3 proved that
  transport continuity is equivalent to the conjunction of convex injectivity domains and weak MTW.
  Their introduction poses the equivalence with weak MTW alone;
  the separate convexity and continuity questions also appear in #cite(label("LPZ2019")) Questions 8.6–8.7.

Figalli–Rifford–Villani’s transport continuity property concerns all density pairs bounded above and away from
  zero. They prove that this property implies convex injectivity domains and weak MTW #cite(label("FRV2011"))
  Definition 1.1 and Theorem 1.2(i). Theorem 1 implies that property by choosing bounds for each pair.
  Combined with their necessity result, it yields the weak-MTW–transport-continuity equivalence,
  with the forward direction strengthened to the class-uniform estimates above.

=== 1.2 Conventions <conventions>

We use dual potentials with

$ u \( x \) = sup_y { - c \( x \, y \) - v \( y \) } \, wide v \( y \) = sup_x { - c \( x \, y \) - u \( x \) } . $

Thus $u \( x \) + c \( x \, y \) + v \( y \) gt.eq 0$, with equality at a contact.
  The symbol $partial u \( x \)$ denotes the ordinary subdifferential of the semiconvex function,
  with covectors identified with tangent vectors by the metric.
  At a differentiable contact its gradient is the initial minimizing log. We write

$ G_x = { p in T_x M : d \( x \, exp_x p \) = \| p \| } = overline(I \( x \)) \, wide c_t = c \/ t \, wide
  Q_t f \( z \) = min_x { f \( x \) + c_t \( x \, z \) } \, $

and, for $p in I \( x \)$,

$ A_x \( p \) = D_(x x)^2 c \( x \, exp_x p \) \, wide sigma_x \( p \) = \| det \( d exp_x \)_p \| . $

The function $sigma_x$ extends continuously to $G_x$. At an ordinary cut point,
  a specified nonconjugate minimizing branch has a smooth upper cost branch;
  we state explicitly when such a branch is used. A star denotes the adjoint.
  Constants denoted by $c \, C$ may change between formulas.
  Constants in the final comparison depend only on the fixed geometry and density bounds;
  constants used solely to pass limits at fixed scales may also depend on the already fixed templates.

=== 1.3 Proof structure <proof-structure>

For a dual pair $\( u \, v \)$, the lifted gap section at $x$ and height $r gt.eq 0$ is

$ cal(S)_x \( r \) = {p in G_x : u \( x \) + frac(\| p \|^2, 2) + v \( exp_x p \) lt.eq r} . $

We study the oscillation of $v$ on its endpoint image $exp_x cal(S)_x \( r \)$.
  Convexity of the lifted section turns a power bound on that oscillation into a power bound on the diameter of
  the endpoint image. Taking the oscillation supremum over all admissible density pairs makes this a single scalar
  estimate for the entire class. Once it is proved, every zero-height section has one endpoint,
  and comparison of nearby poles gives the Hölder estimate in both transport directions.

The foundation theorem applies to all ordinary subgradients,
  including convex combinations of all minimizing logs at active cut endpoints.
  The projection $\( x \, p \) mapsto exp_x \( t p \)$ of the full subgradient graph is a homeomorphism for $0 <
  t < 1$; only the supporting inequality is asserted at time one for an arbitrary potential.
  It also gives compact convex lifted gap sections and $C^(1 \, 1)$ intermediate potentials.
  The minimizing point in $Q_t u \( z \)$, called its pole, depends Lipschitzly on $z$.

Section 3 develops the quantitative estimates needed when a minimizing endpoint approaches conjugacy.
  A fixed joining point factors the full Jacobi matrix into nonsingular piece matrices and a positive semidefinite
  broken-action Hessian. Radial shortening adds a uniformly positive form.
  Transverse MTW, the radial identity, and a common separating logarithmic scale then compare ordered singular
  values along an extended affine segment.

Section 4 takes a supremum of section oscillations over the entire density class.
  Failure of every power bound gives two separated gap scales on which this supremum is almost constant.
  Two scalar modifications produce a positive comparison maximum.
  One modifies the value at a center endpoint; the other supplies the active endpoints whose minimizing logs have
  the center log as a convex combination. Varying their amplitude gives an inequality for every positive active
  barycentric representation, with constants fixed before the curvature of the outer modification is chosen.

Section 5 keeps the order of the limiting argument explicit.
  An exact pole-matrix identity transfers lower jets to active endpoints.
  The original contact-volume bound first excludes conjugacy at a selected outer endpoint and bounds its
  determinant. This bounds the center Hessian. Only then does the short-time minimizer have nonsingular
  derivative, allowing the original almost-everywhere density equation to be used at the sampled center endpoints.
  An oblique-projection determinant gain and the spectral comparison give the contradiction.
  Finally, Section 6 converts the resulting power bound into the common estimate for the map and its inverse.

== 2 The density-free foundation <sec:geometry>

We record the precise geometric input from #cite(label("Foundation2026")).
  Every statement in this section is density-free and uses only the fixed compact manifold and weak MTW.
  The proofs, including the treatment of conjugate cut endpoints, are in that paper.

A potential is a function $u \( x \) = max_y { - c \( x \, y \) - w \( y \) }$ with a continuous datum $w$;
  replacing $w$ by the cost transform of $u$ gives a dual pair. Put $D_g = "diam" M$.
  The total minimizing-vector set ${ \( x \, p \) : p in G_x }$ is compact.
  For $p in G_x$ and $y_s = exp_x \( s p \)$, $0 < s < 1$, divided action gives

#[#set math.equation(numbering: n => "(2.1)")
 $ c \( z \, exp_x p \) lt.eq c_s \( z \, y_s \) + frac(1 - s, 2) \| p \|^2 \, wide c_s \( x \, y_s \) = s /
   2 \| p \|^2 . $ <geo:split-support>]

The right side is a smooth upper support near $x$.

#thm([Lemma 2.1.])[
  (Uniform supports and active logs).  #emph[There is a geometric constant $C_g$ such that the cost is uniformly
    semiconcave in either variable, including at cut points. Every potential is $D_g$-Lipschitz and uniformly
    semiconvex. For a continuous representing datum $w$, define
$ cal(V)_u \( x \) = { p in G_x : u \( x \) + c \( x \, exp_x p \) + w \( exp_x p \) = 0 } . $

 Then $cal(V)_u \( x \)$ is compact and $partial u \( x \) = "conv" cal(V)_u \( x \)$.
   Every $p in partial u \( x \)$ has a positive representation using at most $n +
   1$ affinely independent active logs. The set $cal(V)_u \( x \)$ includes every minimizing log to each endpoint
   active for the specified datum $w$.]
] <geo:prelim>

This is #cite(label("Foundation2026")) Lemma 4.1. In particular,
  the smooth upper supports obtained by splitting at time $1 \/
  2$ have a common neighborhood size and Hessian bound. The representing datum need not itself be a cost potential.

Write $H_s \( p \) = A_x \( s p \) \/ s$. At a specified nonconjugate minimizing branch,
  $A_x$ will also denote the smooth branch Hessian.

#thm([Lemma 2.2.])[
  (Radial divided action).  #emph[Let $p in G_x$, and let $S_p \( r \)$ be the Jacobi tensor along
    $exp_x \( r p \)$ with $S_p \( 0 \) = 0$, $D_r S_p \( 0 \) = upright("Id")$, in parallel orthonormal frames.
    For $0 < t < s < 1$,
$ frac(d, d r) H_r \( p \) = - S_p \( r \)^(- 1) S_p \( r \)^(- T) \, wide H_t \( p \) - H_s \( p \) gt.eq
  kappa_g \( s - t \) upright("Id") \, $

 where $kappa_g > 0$ depends only on the manifold. On every smooth minimizing branch, $A_x \( w \) w = w$.]
] <geo:radial-index>

#thm([Lemma 2.3.])[
  (Transverse slack).  #emph[Let $p_i in G_x$, $m_i > 0$, $sum_i m_i = 1$, and set $p = sum_i m_i p_i$, $E =
    "span" { p_i - p }$. If $t "conv" { p_i } subset I \( x \)$ and $0 < t < s < 1$, then
$ [frac(A_x \( t p \), t) - sum_i m_i frac(A_x \( s p_i \), s)] \|_(E^perp) gt.eq kappa_g \( s - t \) upright("Id") . $

 The conclusion also holds at a limiting time $t$ if the radially contracted hulls lie in $I \( x \)$ and the
   displayed Hessians have nonconjugate branch limits. No minimizing assumption about $s
   p$ is needed in this limiting assertion.]
] <geo:slack>

These are #cite(label("Foundation2026")) Lemmas 4.2–4.3. The latter applies to every positive finite
  representation, not merely a selected Carathéodory representation.
  We reconstruct the Jacobi identities and the additional uniform spectral bounds in Section 3.

#thm([Lemma 2.4.])[
  (Short time for a semiconvex datum).  #emph[Let $f$ be Lipschitz and semiconvex.
    For sufficiently small $t > 0$, depending only on these two bounds and the manifold,
$ F_t : Gamma_f arrow.r M \, wide Gamma_f = { \( x \, p \) : p in partial f \( x \) } \, wide F_t \( x \, p \) =
  exp_x \( t p \) $

 is a homeomorphism with locally Lipschitz inverse into the tangent bundle.
   The minimizing pole $x_t \( z \)$ of $Q_t f$ is unique, $Q_t f in C^(1 \, 1)$, and $"grad" Q_t f \( z \) = -
   t^(- 1) log_z x_t \( z \)$. The graph $Gamma_f$ is an $n$-dimensional Lipschitz manifold.]
] <geo:short-time>

This is #cite(label("Foundation2026")) Lemma 4.4. The local mechanism is the curved version of proximal
  regularization and quadratic inf-convolution; compare #cite(label("Moreau1965")) Sections 3–5 and 7.
  It is needed below for increasing scalar modifications of potentials, which need not themselves be cost potentials.

#thm([Theorem 2.5.])[
  (Global supporting property).  #emph[For every potential $u$, every $x in M$,
    and every $p in partial u \( x \)$, one has $p in G_x$ and
$ u \( x' \) gt.eq u \( x \) + c \( x \, exp_x p \) - c \( x' \, exp_x p \) wide \( x' in M \) . $

 For each $0 < t < 1$, $F_t : Gamma_u arrow.r M$ is a homeomorphism, $t p in I \( x \)$,
   and its poles are the unique global minimizers of $Q_t u$.]
] <geo:support>

#thm([Corollary 2.6.])[
  (Convex injectivity domains).  #emph[Both $G_x$ and $I \( x \)$ are convex for every $x in M$.]
] <geo:convexity>

#thm([Corollary 2.7.])[
  (Convex lifted gap sections).  #emph[For a dual pair $\( u \, v \)$, each set
$ cal(S)_x \( r \) = {p in G_x : u \( x \) + frac(\| p \|^2, 2) + v \( exp_x p \) lt.eq r} $

 is compact and convex, including ordinary and conjugate cut endpoints. If it is nonempty and $r gt.eq 0$, then
$ "diam" cal(S)_x \( r \)^2 lt.eq 8 (r + "osc"_(p in cal(S)_x \( r \)) v \( exp_x p \)) . $

]
] <geo:sections>

These are #cite(label("Foundation2026")) Theorem 4.8 and Corollaries 4.9–4.10.
  Convexity of injectivity domains alone is not the whole input:
  the ordinary-subgradient supporting assertion is also used for modified envelopes and local lower tests.

#thm([Proposition 2.8.])[
  (Intermediate regularity and pole control).  #emph[Let $\( u \, v \)$ be a dual pair and $0 < t < 1$.
    Then $Q_t u = - Q_(1 - t) v in C^(1 \, 1) \( M \)$, with almost-everywhere bounds
$ - frac(C_g, 1 - t) g lt.eq "Hess" Q_t u lt.eq C_g / t g . $

 If $\( x_t \( z \) \, p_t \( z \) \) = F_t^(- 1) \( z \)$ and $Phi_s$ is geodesic flow on $T M$, then
$ \( x_t \( z \) \, p_t \( z \) \) = Phi_(- t) \( z \, "grad" Q_t u \( z \) \) . $

 In particular, the pole and momentum maps are Lipschitz with constants depending only on $M \, g \, t$.
   There are also $r_t \, b_t > 0$, depending only on $M \, g \, t$, such that every $z = exp_x \( t p \)$,
   $p in partial u \( x \)$, satisfies
$ u \( x' \) + c_t \( x' \, z \) gt.eq u \( x \) + c_t \( x \, z \) + b_t d \( x \, x' \)^2 wide
  upright("if ") d \( x \, x' \) < r_t . $

 All these constants are uniform when $t$ ranges in a compact subinterval of $\( 0 \, 1 \)$.]
] <geo:intermediate>

This is #cite(label("Foundation2026")) Proposition 4.11. Its proof uses the two-sided supports from the split
  contact geodesic and smooth backward geodesic flow, not inversion of the full endpoint exponential map.

#prodef([Remark 2.9.])[
  No time-one injectivity is claimed for an arbitrary potential.
    For example, $u \( x \) = - c \( x \, y_0 \)$ can have many poles with endpoint $y_0$.
    All inverse projections and $C^(1 \, 1)$ regularizations in this paper are used at times strictly between zero
    and one.
] <geo:time-one>

== 3 Jacobi fields and uniform comparison of exponential Jacobians <sec:spectral>

This section proves two estimates that remain uniform near conjugate endpoints:
  a positive divided-Hessian difference after pullback by an exponential differential,
  and a comparison of exponential Jacobians along an extended affine segment.
  The radial estimates use only the fixed compact Riemannian manifold.
  Weak MTW enters when we compare different rays on the segment.
  None of these constants depends on the scalar perturbations introduced in Section 4.
  The pullback estimate is Lemma 14; it supplies the positive term in the center lower bound of Lemma 29.
  The affine-segment estimate is Lemma 15. Corollary 16 applies it to a positive barycentric representation.
  A fixed positive vertex weight supplies the opposite extension required for the affine comparison;
  radial and norm bounds control its remaining hypotheses. This is the geometric comparison needed in the final
  determinant argument.

For a linear map between tangent spaces, singular values and adjoints are defined using the Riemannian inner
  products. We write

$ s_1 \( x \, v \) lt.eq dots.h.c lt.eq s_n \( x \, v \) $

for the singular values of $\( d exp_x \)_v$, including zero singular values when $v in G_x$ is conjugate. Thus

$ sigma_x \( v \) = product_(j = 1)^n s_j \( x \, v \) . $

For a positive definite symmetric matrix $Q$, the notation $lambda_j^arrow.b \( Q \)$ lists its eigenvalues in
  decreasing order. All matrix identities below are written in parallel orthonormal frames;
  their statements are independent of that choice.

=== 3.1 The divided-action identities <the-divided-action-identities>

On a minimizing ray, the divided Hessian $S \( T \)$ below is $H_T \( v \)$ from Lemma 3.
  We record its Jacobi form together with reversal, and distinguish the local action from the global cost when a
  branch passes through cut.

#thm([Lemma 3.1.])[
  (Jacobi matrices and reversal).  #emph[Let $gamma \( s \) =
    exp_x \( s v \)$ be a geodesic and identify its tangent spaces by parallel transport.
    Put $cal(R) \( s \) w = R \( w \, dot(gamma) \( s \) \) dot(gamma) \( s \)$ and let $C \, J$ solve
$ U'' + cal(R) U = 0 \, wide C \( 0 \) = upright("Id") \, quad C' \( 0 \) = 0 \, quad J \( 0 \) = 0 \, quad
  J' \( 0 \) = upright("Id") . $

 Then
#[#set math.equation(numbering: n => "(3.1)")
 $ \( d exp_x \)_(T v) = frac(J \( T \), T) $ <spec:exp-jacobi>]

 for $T > 0$. Whenever the geodesic to $gamma \( T \)$ is nonconjugate,
   let $c_(gamma \, T)$ be its smooth local action: one half the squared length of the geodesic branch obtained by
   varying the two endpoints. The source Hessian of its divided action is
#[#set math.equation(numbering: n => "(3.2)")
 $ S \( T \) := D_(x x)^2 frac(c_(gamma \, T) \( x \, gamma \( T \) \), T) = J \( T \)^(- 1) C \( T \) \, wide
   S' \( T \) = - J \( T \)^(- 1) J \( T \)^(- *) . $ <spec:divided-hessian>]

 The endpoint is held fixed when taking $D_(x x)^2$; the derivative in $T$ then follows the displayed geodesic.
   The identities apply to a smooth action branch whether or not it minimizes.
   Before cut, this action is the cost $c$; at a nonconjugate minimizing cut vector,
   it is the chosen smooth upper branch of $c$.]
  #emph[If $y = exp_x v$ and $macron(v) = - P_(x arrow.r y) v$ is the reverse initial velocity, then
#[#set math.equation(numbering: n => "(3.3)")
 $ \( d exp_y \)_(macron(v)) = #scale(x: 120%, y: 120%)[\(] \( d exp_x \)_v #scale(x: 120%, y: 120%)[\)]^(*) \,
   wide sigma_y \( macron(v) \) = sigma_x \( v \) \, $ <spec:reversal>]

 with the indicated source and target tangent spaces. Finally, for $v in I \( x \)$,
#[#set math.equation(numbering: n => "(3.4)")
 $ A_x \( v \) v = v . $ <spec:radial-identity>]

]
] <spec:identities>

#proof[
  Varying the initial velocity in the geodesic equation gives (3.1). Since $cal(R)$ is symmetric, the fundamental matrix
  $ Phi \( T \) = mat(delim: "(", C \( T \), J \( T \); C' \( T \), J' \( T \)) $
  is symplectic. In particular,
  #[#set math.equation(numbering: n => "(3.5)")
   $ J^(*) J' = J' ""^(*) J \, wide C^(*) J' - C' ""^(*) J = upright("Id") \, wide C J^(*) =
     J C^(*) . $ <spec:wronskians>]
  These identities can also be obtained by differentiating their left sides and using the Jacobi equation;
    their values at zero give the displayed constants.
  For a variation of the initial point by $a$ with terminal variation zero,
    the variational field is $C \( s \) a + J \( s \) b$, where $b = - J \( T \)^(- 1) C \( T \) a$.
    The initial gradient of the divided action is the negative initial velocity.
    Differentiating it in a normal frame at $x$ therefore gives $S \( T \) = J \( T \)^(- 1) C \( T \)$.
    The last identity in (3.5) shows that this matrix is symmetric. Moreover, the first two identities give
  $ J^(*) #scale(x: 120%, y: 120%)[\(] C' - J' J^(- 1) C #scale(x: 120%, y: 120%)[\)] = J^(*) C' - J' ""^(*) C = -
    upright("Id") . $
  Consequently
  $ frac(d, d T) \( J^(- 1) C \) = J^(- 1) #scale(x: 120%, y: 120%)[\(] C' -
    J' J^(- 1) C #scale(x: 120%, y: 120%)[\)] = - J^(- 1) J^(- *) \, $
  including the order of the two inverse factors in (3.2).
  For completeness, symplecticity also gives
  $ Phi \( T \)^(- 1) = mat(delim: "(", J' \( T \)^(*), - J \( T \)^(*); - C' \( T \)^(*), C \( T \)^(*)) . $
  A Jacobi field for the reversed geodesic with initial position zero and initial derivative $a$ has,
    in the forward parametrization, terminal data $\( 0 \, - a \)$.
    Multiplication by this inverse matrix shows that its value at the other endpoint is $J \( T \)^(*) a$.
    The reversed Jacobi matrix at time $T$ is thus $J \( T \)^(*)$.
    Dividing both matrices by $T$ as in (3.1) proves (3.3); this argument does not require $J \( T \)$ to be invertible.
  In the radial direction the Jacobi equation has the explicit solutions $J \( s \) v = s v$ and $C \( s \) v =
    v$. Thus $S \( T \) v = v \/ T$. For $v in I \( x \)$, taking $T = 1$ gives (3.4); the case $v = 0$ is immediate. ◻
]

=== 3.2 Radial shortening at a conjugate endpoint <radial-shortening-at-a-conjugate-endpoint>

#thm([Lemma 3.2.])[
  (Uniform radial transversality).  #emph[There are constants $c_(upright(r)) > 0$ and $C_(upright(r)) < oo$,
    depending only on $\( M \, g \)$, such that for $x in M$, $v in G_x$, $0 < delta lt.eq 1 \/ 2$, and $1 lt.eq
    j lt.eq n$,
#[#set math.equation(numbering: n => "(3.6)")
 $ c_(upright(r)) #scale(x: 120%, y: 120%)[\(] s_j \( x \, v \) + delta #scale(x: 120%, y: 120%)[\)] lt.eq
   s_j \( x \, \( 1 - delta \) v \) lt.eq C_(upright(r)) #scale(x: 120%, y: 120%)[\(] s_j \( x \, v \) +
   delta #scale(x: 120%, y: 120%)[\)] . $ <spec:singular-shortening>]

 There is also a positive definite form $Q_(x \, v \, delta)$ on $T_x M$ such that, on putting
$ N_(x \, delta) \( v \) = - delta #scale(x: 120%, y: 120%)[\(] A_x \( \( 1 - delta \) v \) -
  upright("Id") #scale(x: 120%, y: 120%)[\)] \, $

 one has
#[#set math.equation(numbering: n => "(3.7)")
 $ & parallel N_(x \, delta) \( v \) - Q_(x \, v \, delta) parallel lt.eq C_(upright(r)) delta \,\
 & c_(upright(r)) frac(delta, s_j \( x \, v \) + delta) lt.eq lambda_j^arrow.b \( Q_(x \, v \, delta) \) lt.eq
   C_(upright(r)) frac(delta, s_j \( x \, v \) + delta) . $ <spec:bounded-background>]

 In particular, uniformly on this set,
#[#set math.equation(numbering: n => "(3.8)")
 $ parallel N_(x \, delta) \( v \) parallel lt.eq C_(upright(r)) \, wide N_(x \, delta) \( v \) succ.curly.eq -
   C_(upright(r)) delta upright("Id") \, wide N_(x \, delta) \( v \) v = 0 . $ <spec:bounded-N>]

 No condition on the multiplicity of conjugacy is required.]
] <spec:radial>

#proof[
  The bundle
  $ cal(G) = { \( x \, v \) : x in M \, med v in G_x } $
  is compact: its defining distance equality is closed, and $\| v \|$ is bounded by $"diam" \( M \)$.
    For each such vector consider $gamma \( s \) = exp_x \( s v \)$ on $\[ 0 \, 1 \]$.
    Fix the splitting time $h = 1 \/ 4$ and allow the final time $T$ to vary in $\[ 1 \/ 2 \, 1 \]$.
    The prefix $h v$ belongs to $I \( x \)$, since it extends by the factor $1 \/ h =
    4$ to the original minimizing ray. For the suffix, reverse the ray at $y_T = gamma \( T \)$ and put
  $ w_T = - \( T - h \) dot(gamma) \( T \) \, wide a_T = frac(T, T - h) gt.eq 4 / 3 . $
  Then $exp_(y_T) w_T = gamma \( h \)$ and $d \( y_T \, exp_(y_T) \( a_T w_T \) \) = a_T \| w_T \|$,
    so $w_T in I \( y_T \)$. The reversed suffix is therefore before cut; reversal preserves uniqueness and,
    by Lemma 11, nonconjugacy. The parameter family is compact and its image lies in the open injectivity domain.
    Thus both piece differentials and their inverses have uniform bounds.
    Their time lengths are bounded below by $1 \/ 4$.
  Let $C \, J$ be the matrices from Lemma 11. Starting at time $h$, let $C_h \( s \) \,
    J_h \( s \)$ have the same initial data and solve the Jacobi equation along $gamma \( h + s \)$.
    Smooth dependence on $\( x \, v \, T \)$ and the preceding nonconjugacy show that
  #[#set math.equation(numbering: n => "(3.9)")
   $ J \( h \) \, med J \( h \)^(- 1) \, med J_h \( T - h \) \, med J_h \( T - h \)^(- 1) \, med C \( h \) \, med
     J' \( h \) $ <spec:piece-bounds>]
  all have uniformly bounded norms. This compactness assertion also includes $v = 0$, for which $J \( s \) =
    s upright("Id")$.
  Write $z = gamma \( h \)$ and $y_T = gamma \( T \)$. The Hessian in the joining point of the broken action
  $ z' mapsto frac(c \( x \, z' \), h) + frac(c \( z' \, y_T \), T - h) $
  at $z$ is
  #[#set math.equation(numbering: n => "(3.10)")
   $ D \( T \) = J' \( h \) J \( h \)^(- 1) + J_h \( T - h \)^(- 1) C_h \( T - h \) . $ <spec:middle-Hessian>]
  The first term is the terminal Hessian of the first piece; the second is the source Hessian of the second piece.
    At $T = 1$, the broken action has a minimum at $z$. To see this directly,
    the triangle inequality and Cauchy–Schwarz give
  $ frac(d \( x \, z' \)^2, 2 h) + frac(d \( z' \, y_1 \)^2, 2 \( 1 - h \)) gt.eq
    frac(\( d \( x \, z' \) + d \( z' \, y_1 \) \)^2, 2) gt.eq frac(d \( x \, y_1 \)^2, 2) \, $
  with equality at $z$. Hence $D \( 1 \) succ.curly.eq 0$.
  Only the second term in (3.10) depends on $T$. Applying (3.2) with initial point $z$ yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ D \( 1 - delta \) & = D \( 1 \) + delta G_delta \,\
G_delta & = 1 / delta integral_(1 - delta)^1 J_h \( s - h \)^(- 1) J_h \( s - h \)^(- *) thin d s \, wide
  c upright("Id") prec.curly.eq G_delta prec.curly.eq C upright("Id") . $ <spec:middle-crossing>]
  The bounds on $G_delta$ are precisely the bounds in (3.9):
    the smallest eigenvalue of the integrand is $parallel J_h \( s - h \) parallel^(- 2)$,
    and its largest eigenvalue is $parallel J_h \( s - h \)^(- 1) parallel^2$.
    Thus the crossing is positive on the whole space, including any null space of $D \( 1 \)$.
  Jacobi propagation through the joining point gives the exact factorization
  #[#set math.equation(numbering: n => "(3.12)")
   $ J \( T \) & = C_h \( T - h \) J \( h \) + J_h \( T - h \) J' \( h \)\
 & = J_h \( T - h \) D \( T \) J \( h \) . $ <spec:Jacobi-factorization>]
  This formula is also valid at $T = 1$ when either of the two full matrices is singular.
    The splitting point is kept fixed while $T$ varies; differentiating a moving midpoint is unnecessary.
    Taking $h = 1 \/ 2$ gives the usual midpoint factorization on $T in \[ 3 \/ 4 \, 1 \]$.
    The choice $h = 1 \/ 4$ covers all the parameters in the statement with one set of bounds.
  Write $lambda_1 \( D \) lt.eq dots.h.c lt.eq lambda_n \( D \)$ for the increasing eigenvalues of a positive
    semidefinite matrix $D$. The min–max characterization applied to (3.11) gives
  $ lambda_j \( D \( 1 \) \) + c delta lt.eq lambda_j \( D \( 1 - delta \) \) lt.eq lambda_j \( D \( 1 \) \) +
    C delta . $
  Multiplication of a matrix on either side by a uniformly bounded invertible matrix changes each ordered singular
    value by at most a uniform multiplicative factor. Apply this fact to (3.12), use $\( d exp_x \)_(T v) =
    J \( T \) \/ T$, and note $1 \/ 2 lt.eq T lt.eq 1$. At $T = 1$,
    the singular values of $J \( 1 \)$ are comparable to the eigenvalues of $D \( 1 \)$; at $T = 1 - delta$,
    they are comparable to the eigenvalues of $D \( 1 - delta \)$.
    These observations prove (3.6) with uniform constants.
  We give the Hessian calculation as well, because it identifies the bounded term that must not be discarded at a
    radial eigenvector. Set
  $ P = J \( h \)^(- 1) C \( h \) \, wide E = J \( h \)^(- *) . $
  The source–join mixed Hessian of the first divided action is $- J \( h \)^(- 1) = - E^(*)$.
    For $T < 1$, eliminating the joining-point variation in the Hessian of the broken action gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ frac(A_x \( T v \), T) = P - E^(*) D \( T \)^(- 1) E . $ <spec:Schur-action>]
  To verify the elimination, write the quadratic form for source variation $a$ and joining variation $b$ as $a^(*)
    P a - 2 a^(*) E^(*) b + b^(*) D \( T \) b$. Its unique stationary value in $b$ is at $b =
    D \( T \)^(- 1) E a$ and has value $a^(*) \( P - E^(*) D \( T \)^(- 1) E \) a$.
    This is the Hessian of the stationary composed action. Positivity of $D \( T \)$ follows from (3.11);
    the composed action is the smooth cost branch of the shortened minimizing ray.
  For $T = 1 - delta$, formula (3.13) gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ N_(x \, delta) \( v \) & = Q_(x \, v \, delta) + delta \( upright("Id") - T P \) \,\
Q_(x \, v \, delta) & = T delta E^(*) D \( T \)^(- 1) E . $ <spec:Q-definition>]
  The second form is positive definite. The bounds on $P \, E \, E^(- 1)$, the min–max inequalities just proved,
    and inversion of $D \( T \)$ give (3.7) and (3.7). They imply the norm and lower bounds in (3.8).
    The remaining identity follows from (3.4). In particular,
    for $v eq.not 0$ the radial eigenvalue of $N_(x \, delta) \( v \)$ is exactly zero,
    while the radial singular value of $\( d exp_x \)_v$ is one.
    These two facts are consistent because the comparison with $Q_(x \, v \, delta)$ includes the bounded
    background $delta \( upright("Id") - T P \)$. ◻
]

#thm([Corollary 3.3.])[
  (Radial comparison of exponential determinants).  #emph[With a constant depending only on $\( M \, g \)$,
    if $v in G_x$ and $1 \/ 2 lt.eq theta lt.eq 1$, then
#[#set math.equation(numbering: n => "(3.15)")
 $ sigma_x \( theta v \) gt.eq c sigma_x \( v \) . $ <spec:radial-det>]

 Suppose $y = exp_x p$, $p in G_x$, and $macron(p) = - P_(x arrow.r y) p$.
   If $l in \[ 1 \/ 2 \, 1 \)$ and $macron(p) \/ l in G_y$, then
#[#set math.equation(numbering: n => "(3.16)")
 $ sigma_y \( macron(p) \/ l \) lt.eq C sigma_x \( p \) . $ <spec:center-true-det>]

 If $l_(+) in \[ 1 \, 2 \]$, then
#[#set math.equation(numbering: n => "(3.17)")
 $ sigma_y \( macron(p) \/ l_(+) \) gt.eq c sigma_x \( p \) . $ <spec:outer-true-det>]

 Comparison (3.16) permits the longer reversed vector $macron(p) \/ l$ to have a conjugate endpoint.]
] <spec:radial-determinants>

#proof[
  For $theta < 1$, multiply the lower bounds in (3.6) with $delta = 1 -
    theta$ and discard the nonnegative terms $delta$. The case $theta = 1$ is immediate.
    For (3.16), apply (3.15) to the longer vector $macron(p) \/ l$ with shortening factor $l$, and then use (3.3).
    For (3.17), apply it to $macron(p)$ with shortening factor $1 \/ l_(+)$ and use the same reversal identity.
    Thus the direction of the two inequalities reflects, respectively, a longer and a shorter true reversed ray. ◻
]

=== 3.3 A uniform gain from an extra minimizing extension <a-uniform-gain-from-an-extra-minimizing-extension>

#thm([Lemma 3.4.])[
  (Isotropic gain after pullback).  #emph[There is $c_(upright(p)) > 0$, depending only on $\( M \, g \)$,
    with the following property. Let $y in M$, $r in T_y M$, and $1 < T_(*) lt.eq 2$ satisfy $T_(*) r in G_y$. Put
$ gamma \( s \) = exp_y \( s r \) \, quad x = gamma \( 1 \) \, quad p = - P_(y arrow.r x) r \, quad
  L = \( d exp_x \)_p \, wide tau = 1 + frac(T_(*) - 1, 2) . $

 Then all costs appearing in
#[#set math.equation(numbering: n => "(3.18)")
 $ L^(*) [A_y \( r \) - 1 / tau A_y \( tau r \)] L succ.curly.eq c_(upright(p)) \( T_(*) - 1 \) upright("Id")
   $ <spec:half-extension-gain>]

 are smooth. If the terminal ray at time $T_(*)$ is nonconjugate,
   the same inequality holds with $tau$ replaced by $T_(*)$ and its chosen smooth branch.
   In particular, for $T_(*) = 1 \/ l$ this latter inequality reads
#[#set math.equation(numbering: n => "(3.19)")
 $ L^(*) [A_y \( r \) - l A_y \( r \/ l \)] L succ.curly.eq c_(upright(p)) \( 1 - l \) upright("Id") \, wide
   1 \/ 2 lt.eq l < 1 . $ <spec:full-extension-gain>]

 Without any uniformity assertion, the source Hessian of divided action decreases strictly in the positive
   definite order between any two nonconjugate times on a minimizing ray.]
] <spec:pullback>

#proof[
  Every time less than $T_(*)$ lies strictly before the cut time of this ray,
    so $r$ and $tau r$ are in $I \( y \)$, and the reverse vector $p$ is in $I \( x \)$.
    Let $J \( s \)$ be the Jacobi matrix based at $y$ with unit initial derivative. By reversal,
  #[#set math.equation(numbering: n => "(3.20)")
   $ L = J \( 1 \)^(*) . $ <spec:pullback-transpose>]
  Apply Lemma 12 to the minimizing vector $T_(*) r$, with shortening factor $1 \/ T_(*)$.
    Since $delta = \( T_(*) - 1 \) \/ T_(*) gt.eq \( T_(*) - 1 \) \/ 2$, its lower bound gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ s_1 \( J \( 1 \) \) = s_1 \( y \, r \) gt.eq c \( T_(*) - 1 \) \, wide
     parallel J \( 1 \)^(- 1) parallel lt.eq frac(C, T_(*) - 1) . $ <spec:J-one-inverse>]
  There is also a uniform bound on $parallel J' \( s \) parallel$ for $0 lt.eq s lt.eq T_(*)$.
    Indeed, $\| T_(*) r \| lt.eq "diam" \( M \)$, $T_(*) lt.eq 2$,
    and smooth Jacobi evolution on this compact set of initial data bounds its fundamental matrices.
    Therefore, for $1 lt.eq s lt.eq tau$,
  #[#set math.equation(numbering: n => "(3.22)")
   $ parallel J \( s \) J \( 1 \)^(- 1) parallel & lt.eq 1 + parallel J \( s \) -
     J \( 1 \) parallel thin parallel J \( 1 \)^(- 1) parallel\
 & lt.eq 1 + C frac(s - 1, T_(*) - 1) lt.eq C . $ <spec:noncommuting-ratio>]
  Write $S \( s \) = A_y \( s r \) \/ s$. Lemma 11 and (3.20) give
  #[#set math.equation(numbering: n => "(3.23)")
   $ L^(*) \[ - S' \( s \) \] L = J \( 1 \) J \( s \)^(- 1) J \( s \)^(- *) J \( 1 \)^(*) .
     $ <spec:noncommuting-positive>]
  The matrix on the right is $B_s B_s^(*)$ with $B_s = J \( 1 \) J \( s \)^(- 1)$.
    Its smallest eigenvalue equals $parallel B_s^(- 1) parallel^(- 2) =
    parallel J \( s \) J \( 1 \)^(- 1) parallel^(- 2)$ and is thus bounded below by a uniform positive constant by
    (3.22). This uses the displayed order of the factors and does not commute any Jacobi matrices.
    Integration over $\[ 1 \, tau \]$, whose length is $\( T_(*) - 1 \) \/ 2$, proves (3.18).
  If the terminal branch is nonconjugate, $S$ is defined through time $T_(*)$ and $-
    S' \( s \)$ is positive definite on the remaining interval.
    Adding its integral over $\[ tau \, T_(*) \]$ preserves the lower bound.
    Since $T_(*) - 1 = \( 1 - l \) \/ l gt.eq 1 - l$, this gives (3.19).
    For arbitrary two nonconjugate times on a minimizing ray, integration of $- S' \( s \) =
    J \( s \)^(- 1) J \( s \)^(- *) succ 0$ proves strict decrease.
    When the true terminal point is conjugate, only the half-extension formula is used;
    no undefined terminal Hessian has been differentiated. ◻
]

=== 3.4 From transverse MTW to comparison along an affine segment <from-transverse-mtw-to-comparison-along-an-affine-segment>

#thm([Lemma 3.5.])[
  (Uniform comparison along an extended segment).  #emph[Assume weak MTW. Fix $a_0 > 0$ and $B < oo$.
    There is $c_(upright(s)) > 0$, depending only on $\( M \, g \) \, a_0 \, B$, such that the following holds.
    Let $x in M$, $p \, q in T_x M$, $q eq.not 0$, satisfy
#[#set math.equation(numbering: n => "(3.24)")
 $ p + t q in G_x quad \( - a_0 lt.eq t lt.eq 1 \) \, wide p dot.op q > 0 \, wide
   frac(\| q \|^2, p dot.op q) lt.eq B . $ <spec:segment-hypotheses>]

 Then, for every $1 lt.eq j lt.eq n$,
#[#set math.equation(numbering: n => "(3.25)")
 $ s_j \( x \, p \) gt.eq c_(upright(s)) s_j \( x \, p + q \) . $ <spec:ordered-comparison>]

 In particular,
#[#set math.equation(numbering: n => "(3.26)")
 $ sigma_x \( p \) gt.eq c_(upright(s))^n sigma_x \( p + q \) . $ <spec:product-comparison>]

]
] <spec:comparison>

#proof[
  If there is a configuration in the statement then $B > 0$. Set
  $ a = min { a_0 \, \( 2 B \)^(- 1) } . $
  We use only the segment $\[ - a \, 1 \]$. First suppose that all its points lie in $I \( x \)$. Write
  $ p \( t \) = p + t q \, wide beta = frac(\| q \|^2, p dot.op q) \, wide L \( t \) = upright("Id") +
    t frac(q q^(*), p dot.op q) . $
  The eigenvalues of $L \( t \)$ are $1$ on $q^perp$ and $1 + t beta$ on $bb(R) q$. Hence
  #[#set math.equation(numbering: n => "(3.27)")
   $ parallel L \( t \) parallel lt.eq 1 + B \, wide parallel L \( t \)^(- 1) parallel lt.eq
     2 wide \( - a lt.eq t lt.eq 1 \) . $ <spec:L-bounds>]
  For $0 < delta lt.eq 1 \/ 2$, put
  #[#set math.equation(numbering: n => "(3.28)")
   $ N_delta \( t \) = - delta #scale(x: 120%, y: 120%)[\(] A_x \( \( 1 - delta \) p \( t \) \) -
     upright("Id") #scale(x: 120%, y: 120%)[\)] \, wide F_delta \( t \) =
     L \( t \)^(*) N_delta \( t \) L \( t \) . $ <spec:F-definition>]
  These matrices are uniformly bounded by Lemma 12 and (3.27), and $F_delta \( t \) succ.curly.eq -
    C delta upright("Id")$.
  We next prove full matrix convexity of $F_delta$. For any fixed $z in T_x M$, the vector
  $ xi = z - frac(z dot.op q, p dot.op q) p $
  is perpendicular to $q$. Moreover,
  $ xi - L \( t \) z = - frac(z dot.op q, p dot.op q) p \( t \) . $
  The last vector belongs to the kernel of $N_delta \( t \)$ by the radial identity.
    Symmetry consequently gives the exact equality
  #[#set math.equation(numbering: n => "(3.29)")
   $ z^(*) F_delta \( t \) z = xi^(*) N_delta \( t \) xi . $ <spec:transverse-conjugation>]
  Weak MTW means that $t mapsto A_x \( \( 1 - delta \) p \( t \) \) \( xi \, xi \)$ is concave whenever $xi perp
    q$. The negative sign in the definition of $N_delta$ therefore makes the right side of (3.29) convex.
    Since this holds for every $z$, $F_delta$ is convex in the Loewner order.
  This argument remains uniform when $p dot.op q$ is small.
    The fixed test vector $xi$ itself might be large, but its value modulo the radial kernel is $L \( t \) z$.
    Equations (3.27) and (3.29) bound the scalar convex function by $C \| z \|^2$,
    independently of the size of $xi$. For any compact interval $K subset \( - a \, 1 \)$,
    a real convex function bounded in absolute value by $C \| z \|^2$ has slopes on $K$ bounded by $2 C \|
    z \|^2 \/ "dist" \( K \, { - a \, 1 } \)$: sandwich each secant slope between secants to the two endpoints.
    Applying this estimate to basis vectors and their sums and differences shows by polarization that every matrix
    entry of $F_delta$ has a uniform Lipschitz bound on $K$.
  To turn this bounded matrix convexity into a spectral comparison, we argue by contradiction.
    The spectral profile $delta \/ \( s_i + delta \)$ from (3.7) detects singular values below the radial scale:
    it stays positive when $s_i lt.double delta$ and tends to zero when $s_i gt.double delta$.
    At a scale separated from the singular values, the rank of a limiting matrix therefore counts those below the
    scale. A failing ordered singular-value ratio will provide a radial scale between the center and endpoint
    values. We choose it to separate asymptotically from every singular value at each fixed point of a countable
    dense set of segment parameters. The resulting positive semidefinite matrix limit has a uniform gap between
    zero and its positive eigenvalues, forcing constant interior rank.
    Convexity then prevents rank loss at the endpoint, whereas the failing ratio will force precisely such a loss.
  Suppose that no uniform constant in (3.25) exists. There are configurations $\( x_k \, p_k \, q_k \)$ satisfying
    the same $a_0 \, B$, an index $j$ fixed after passing to a subsequence, and
  #[#set math.equation(numbering: n => "(3.30)")
   $ frac(s_j \( x_k \, p_k \), s_j \( x_k \, p_k + q_k \)) arrow.r 0 . $ <spec:failed-ratio>]
  For now all the segments are in their open injectivity domains, so the singular values are positive.
    Choose an orthonormal identification of each $T_(x_k) M$ with $bb(R)^n$. No smooth choice in $k$ is needed.
    Abbreviate
  $ s_(i \, k) \( t \) = s_i \( x_k \, p_k + t q_k \) \, wide R_k =
    log frac(s_(j \, k) \( 1 \), s_(j \, k) \( 0 \)) arrow.r oo . $
  Let ${ t_1 \, t_2 \, dots.h }$ be a fixed countable dense subset of $\( - a \, 1 \)$,
    enlarged to include $0$ and $1$. We now choose one radial scale that separates every fixed member of this set.
    Take $log delta_k$ in the middle half of the interval
  $ \[ log s_(j \, k) \( 0 \) \, log s_(j \, k) \( 1 \) \] . $
  Exclude the intervals of radius $R_k^(1 \/ 3)$ centered at
  $ log s_(i \, k) \( t_m \) \, wide 1 lt.eq i lt.eq n \, quad 1 lt.eq m lt.eq floor.l R_k^(1 \/ 3) floor.r . $
  Their total length is at most $2 n R_k^(2 \/ 3)$, while the available middle interval has length $R_k \/ 2$.
    For all sufficiently large $k$ there is a remaining point, which we choose as $log delta_k$.
    This construction ensures
  #[#set math.equation(numbering: n => "(3.31)")
   $ & s_(j \, k) \( 0 \) \/ delta_k arrow.r 0 \, wide s_(j \, k) \( 1 \) \/ delta_k arrow.r oo \,\
 & lr(|log frac(s_(i \, k) \( t_m \), delta_k)|) arrow.r oo quad upright("for every fixed ") i \,
   m . $ <spec:separating-scale>]
  All singular values on $cal(G)$ are uniformly bounded above.
    Since $delta_k lt.eq s_(j \, k) \( 1 \) e^(- R_k \/ 4)$, we also have $delta_k arrow.r 0$.
    In particular these scales are eventually admissible in Lemma 12.
  Form the matrices $F_k \( t \)$ in (3.28) using the $k$th segment and scale $delta_k$.
    Their uniform bounds and interior Lipschitz bounds give, by successive extraction on compact subintervals,
    a locally uniform limit $F \( t \)$ on $\( - a \, 1 \)$. Extract also a limit $E = lim_k F_k \( 1 \)$.
    Both $F \( t \)$ and $E$ are positive semidefinite, because their approximants are bounded below by $-
    C delta_k upright("Id")$. The limit $F$ is matrix convex and bounded.
  To identify its possible ranks, use (3.7) to write
  $ F_k \( t \) = L_k \( t \)^(*) Q_(x_k \, p_k + t q_k \, delta_k) L_k \( t \) + cal(E)_k \( t \) \, wide
    parallel cal(E)_k \( t \) parallel lt.eq C delta_k . $
  The positive form in this expression has its $i$th decreasing eigenvalue between uniform multiples of
  #[#set math.equation(numbering: n => "(3.32)")
   $ frac(delta_k, s_(i \, k) \( t \) + delta_k) \, $ <spec:rank-spectral-profile>]
  by (3.7) and (3.27). At a fixed dense point $t_m$, put $eta_k = exp \( - R_k^(1 \/ 3) \)$.
    For all sufficiently large $k$, depending on $m$, (3.31) says that $s_(i \, k) \( t_m \) \/
    delta_k$ is at most $eta_k$ or at least $eta_k^(- 1)$. Weyl’s eigenvalue inequality therefore gives one of the
    two alternatives
  $ lambda_i^arrow.b \( F_k \( t_m \) \) gt.eq frac(c_0, 1 + eta_k) - C delta_k \, wide upright("or") wide -
    C delta_k lt.eq lambda_i^arrow.b \( F_k \( t_m \) \) lt.eq C_0 eta_k + C delta_k \, $
  with $c_0 \, C_0 > 0$ uniform in $i \, m \, k$. Since $F_k \( t_m \)$ already converges,
    its ordered eigenvalues converge. Their limits are therefore either zero or at least $c_0$,
    even if the alternatives initially alternate. No simultaneous rate at all dense points is required.
    Set $c_(*) = c_0 \/ 2$.
  The ordered eigenvalues of a symmetric matrix are continuous in its entries.
    Density of the set ${ t_m }$ and continuity of $F \( t \)$ therefore give
  #[#set math.equation(numbering: n => "(3.33)")
   $ "spec" F \( t \) subset { 0 } union \[ c_(*) \, C_(*) \] wide \( - a < t < 1 \) $ <spec:uniform-limit-gap>]
  after decreasing $c_(*)$ once if necessary. Indeed, an eigenvalue strictly between zero and $c_(*)$ at an
    interior point would remain in that interval in a neighborhood and contradict the dense-set conclusion.
    The rank is now locally constant, because a continuous eigenvalue cannot pass from zero to a positive value
    without entering that gap. It is consequently constant on the connected interval $\( - a \, 1 \)$.
  The endpoint also has to be treated; constancy of the interior rank alone would not suffice.
    For every fixed vector $z$, the bounded scalar convex function $z^(*) F \( t \) z$ has a finite limit as $t
    arrow.t 1$. Polarization yields a matrix limit $F \( 1 - \)$.
    The gap (3.33) persists in this limit, so its rank equals the interior rank.
    For fixed $s < t < 1$, matrix convexity of $F_k$ says
  $ F_k \( t \) prec.curly.eq frac(1 - t, 1 - s) F_k \( s \) + frac(t - s, 1 - s) F_k \( 1 \) . $
  First let $k arrow.r oo$, then let $t arrow.t 1$; this gives
  #[#set math.equation(numbering: n => "(3.34)")
   $ F \( 1 - \) prec.curly.eq E . $ <spec:endpoint-order>]
  Positive semidefinite order implies $"rank" E gt.eq "rank" F \( 1 - \)$,
    since the kernel of $E$ is contained in the kernel of $F \( 1 - \)$.
  On the other hand, the first inequality in (3.31) and the ordering of singular values make the first $j$
    eigenvalues in (3.32) at $t = 0$ bounded away from zero. Thus $"rank" F \( 0 \) gt.eq j$.
    The second inequality makes all eigenvalues with decreasing index $i gt.eq j$ tend to zero at $t = 1$,
    so $"rank" E lt.eq j - 1$. This contradicts the interior rank constancy and (3.34).
    The uniform ordered comparison is proved for open segments.
  Finally, replace a closed segment in (3.24) by $\( 1 - epsilon \) \( p + t q \)$, with $0 < epsilon < 1$.
    It lies in $I \( x \)$ by radial shortening. Its extension interval and the ratio $\|
    q \|^2 \/ \( p dot.op q \)$ are unchanged, so the same constant applies.
    Letting $epsilon arrow.b 0$ and using continuity of the singular values proves (3.25) on $G_x$.
    Multiplication over $j$ proves (3.26). Every bound in the contradiction argument depended only on
    $\( M \, g \) \, a_0 \, B$, which establishes the stated uniformity. ◻
]

=== 3.5 Jacobian comparison for a barycentric configuration <jacobian-comparison-for-a-barycentric-configuration>

#thm([Corollary 3.6.])[
  (Barycentric configurations).  #emph[Assume weak MTW and the convexity of $G_x$ established in Corollary 7.
    Fix $mu in \( 0 \, 1 \)$ and positive constants $kappa \, L_0$. Suppose
$ p = sum_(i = 1)^N m_i p_i \, wide p_i in G_x \, quad m_i > 0 \, quad sum_i m_i = 1 \, $

 and for one index $i$ there are $D > 0$, a unit vector $e$, and $t_i > 0$ such that
#[#set math.equation(numbering: n => "(3.35)")
 $ p_i = p + t_i e \, quad h := p dot.op e > 0 \, quad h^2 gt.eq kappa D \, quad \| p_i \|^2 - \| p \|^2 lt.eq
   L_0 D \, quad m_i gt.eq mu . $ <spec:outward-data>]

 Then
#[#set math.equation(numbering: n => "(3.36)")
 $ sigma_x \( p \) gt.eq c sigma_x \( p_i \) \, $ <spec:outward-det>]

 where $c > 0$ depends only on $\( M \, g \) \, mu \, kappa \, L_0$.]
] <spec:outward>

#proof[
  Set $q = t_i e$. Expansion of the squared norms in (3.35) gives
  $ 2 h t_i + t_i^2 lt.eq L_0 D \, wide frac(\| q \|^2, p dot.op q) = t_i / h lt.eq frac(L_0 D, 2 h^2) lt.eq
    frac(L_0, 2 kappa) . $
  Because $q eq.not 0$, $m_i < 1$. The remaining barycenter belongs to $G_x$ by its convexity and is
  $ frac(1, 1 - m_i) sum_(j eq.not i) m_j p_j = p - frac(m_i, 1 - m_i) q . $
  The coefficient $m_i \/ \( 1 - m_i \)$ is at least $m_i gt.eq mu$.
    Convexity therefore puts $p + s q$ in $G_x$ for every $s in \[ - mu \, 1 \]$.
    Lemma 15 applies with $a_0 = mu$ and $B = L_0 \/ \( 2 kappa \)$ and proves the result.
    No upper bound on $m_i \/ \( 1 - m_i \)$ is needed: a shorter common opposite extension is enough. ◻
]

== 4 Sections, scales, and a quantitative separation <sc:section>

Throughout this section the manifold and the density bounds are fixed. We use the negative-cost convention

$ f^c \( x \) = max_(y in M) { - c \( x \, y \) - f \( y \) } . $

Thus a cost-dual pair satisfies $u = v^c$, $v = u^c$, and $u \( x \) + c \( x \, y \) + v \( y \) gt.eq 0$.
  Let $cal(C)$ denote the class of these pairs for all admissible density pairs,
  with any fixed additive normalization. All members of $cal(C)$ have a common Lipschitz bound,
  and their oscillations are uniformly bounded. None of the arguments below uses derivatives of the densities.

=== 4.1 A scalar quantity controlling both transport directions <a-scalar-quantity-controlling-both-transport-directions>

For $\( u \, v \) in cal(C)$ and $r gt.eq 0$, put

$ S_r \( x \; u \, v \) = { y in M : u \( x \) + c \( x \, y \) + v \( y \) lt.eq r } \, wide F \( r \) =
  sup_(\( u \, v \) in cal(C) \, med x in M) "osc"_(S_r \( x \; u \, v \)) v . $

The sets $S_r$ are nonempty and compact. The function $F$ is bounded and nondecreasing.

#thm([Lemma 4.1.])[
  (The power reduction).  #emph[If there are $beta > 0$, $C_0 < oo$, and $r_0 > 0$ such that $F \( r \) lt.eq
    C_0 r^beta$ for $0 < r < r_0$, then all the optimal maps in the fixed density class have homeomorphic
    representatives with a common Hölder estimate in both directions.
    One may take any exponent no larger than $1 / 2 min { beta \, 1 }$.]
] <sc:power>

#proof[
  Write
  $ h_x \( p \) = u \( x \) + 1 / 2 \| p \|^2 + v \( exp_x p \) \, wide p in G_x . $
  By Corollary 8, the lifted section ${ p in G_x : h_x \( p \) lt.eq r }$ is convex.
    If $p \, q$ belong to it and $m = \( p + q \) \/ 2$, the squared-norm identity gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ 1 / 8 \| p - q \|^2 & = v \( exp_x m \) - frac(v \( exp_x p \) + v \( exp_x q \), 2) +
     frac(h_x \( p \) + h_x \( q \), 2) - h_x \( m \)\
 & lt.eq F \( r \) + r . $ <sc:diameter>]
  The exponential map has a common Lipschitz bound on the compact bundle of minimizing velocities.
    Hence the target diameter of a section is at most $C sqrt(F \( r \) + r)$.
  Let $\( x \, y \)$ and $\( x' \, y' \)$ be contacts of the same dual pair.
    The common Lipschitz bounds for $u$ and $c$ imply
  $ 0 lt.eq u \( x \) + c \( x \, y' \) + v \( y' \) lt.eq C d \( x \, x' \) . $
  Thus $y \, y'$ belong to a section at $x$ of that height. For sufficiently small $d \( x \, x' \)$, (4.1) gives
  $ d \( y \, y' \) lt.eq C d \( x \, x' \)^(1 / 2 min { beta \, 1 }) . $
  In particular, letting the section height tend to zero shows that every pole has exactly one contact endpoint.
    The bound proves that this endpoint depends continuously on the pole.
    The class also contains the reversed pair $\( v \, u \)$ after renormalization,
    which does not affect its section oscillations. The same reasoning therefore gives a unique continuous contact
    in the reverse direction. The dual identities give a contact above every point of either copy of $M$,
    and the two resulting maps are inverse. They agree almost everywhere with the optimal maps by optimality and
    uniqueness. Finally, compactness absorbs the remaining, larger distances into the same uniform constant. ◻
]

We shall contradict failure of a power bound for $F$. The following elementary selection makes the required
  quantifiers explicit.

#thm([Lemma 4.2.])[
  (Logarithmic plateaus).  #emph[Suppose that $F$ has no power upper bound near zero.
    There are $r_j < R_j arrow.r 0$, pairs $\( u_j \, v_j \) in cal(C)$, poles $x_j$, and numbers $a_j \,
    D_j$ with $D_j > 0$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ min_(S_(r_j) \( x_j \; u_j \, v_j \)) v_j = a_j \, wide max_(S_(r_j) \( x_j \; u_j \, v_j \)) v_j = a_j + D_j \,\
r_j / R_j arrow.r 0 \, wide F \( R_j \) lt.eq \( 1 + delta_j \) D_j \, wide delta_j arrow.r 0 \, wide
  frac(\| log D_j \|, \| log R_j \|) arrow.r 0 . $ <sc:endlevels>]

 Consequently $R_j \/ D_j^k arrow.r 0$ for every fixed $k > 0$.]
] <sc:plateau>

#proof[
  If $F$ vanished at a positive scale, monotonicity would already give a power bound below that scale.
    Thus $F \( r \) > 0$. Fix $C_F gt.eq max { 1 \, sup_r F \( r \) }$ and set
  $ f \( s \) = log frac(C_F, F \( e^(- s) \)) . $
  This function is nonnegative and nondecreasing. Failure of every power bound implies $liminf_(s arrow.r oo)
    f \( s \) \/ s = 0$; otherwise $f \( s \) gt.eq beta s$ eventually for some $beta > 0$.
    Choose $N_j arrow.r oo$ with $f \( N_j \) = o \( N_j \)$, and divide $\[ N_j \/ 2 \, N_j \]$ into
  $ m_j = ⌈sqrt(N_j max { 1 \, f \( N_j \) })⌉ $
  equal intervals. Their length $N_j \/ \( 2 m_j \)$ tends to infinity.
    Since their total $f$-increment is at most $f \( N_j \)$,
    some interval $\[ A_j \, B_j \]$ has increment at most $f \( N_j \) \/ m_j = o \( 1 \)$.
    Put $R_j = e^(- A_j)$ and $r_j = e^(- B_j)$. Then
  $ log \( R_j \/ r_j \) = B_j - A_j arrow.r oo \, wide frac(F \( R_j \), F \( r_j \)) =
    e^(f \( B_j \) - f \( A_j \)) arrow.r 1 . $
  Choose an actual section with oscillation $D_j gt.eq \( 1 - 1 \/ j \) F \( r_j \)$,
    discarding the first few indices. Its extrema are attained, which gives (4.2).
    Moreover $A_j gt.eq N_j \/ 2$ and $f \( B_j \) lt.eq f \( N_j \) = o \( N_j \)$, so $\| log D_j \| =
    o \( A_j \)$. This proves (4.2). Finally
  $ log \( R_j \/ D_j^k \) = - A_j - k log D_j = - A_j + o \( A_j \) arrow.r - oo . $
  ◻
]

We suppress the index $j$ from now on. All asymptotic statements refer to the sequence in Lemma 18,
  after the templates below have been fixed. It is not necessary that $D$ tend to zero. Set

#[#set math.equation(numbering: n => "(4.3)")
 $ b_(-) = r \( R \/ r \)^(1 \/ 3) \, wide b_(+) = r \( R \/ r \)^(2 \/ 3) . $ <sc:binterval>]

Then $r lt.double b_(-) lt.double b_(+) lt.double R$. Uniformly for $b in \[ b_(-) \, b_(+) \]$ and $0 lt.eq
  tau lt.eq 8 b \/ D$,

#[#set math.equation(numbering: n => "(4.4)")
 $ r / b arrow.r 0 \, quad b / R arrow.r 0 \, quad b / D^k arrow.r 0 med \( k > 0 upright(" fixed") \) \, quad
   tau / D arrow.r 0 \, quad tau^2 / b arrow.r 0 . $ <sc:smallness>]

For example, $tau^2 \/ b lt.eq 64 b \/ D^2$. These estimates, rather than an additional restriction on $R \/ r$,
  will control the Taylor errors.

=== 4.2 Templates and the order of choices <templates-and-the-order-of-choices>

At the normalized level $s = \( v - a \) \/ D$, we will use the two modifications $v + b B_c \( s \)$ and $v +
  b B_o \( s \)$. The first is the center datum; we compare it with the double cost transform of the second.
  A positive excess in this comparison will produce an interior maximum.
  We first fix the center profile and a cap on the outer values,
  then choose the outer curvature parameter $K$ and its profile, and only afterward take the gap scales small.
  The construction below makes that order explicit.

We use the fixed numerical choices

#[#set math.equation(numbering: n => "(4.5)")
 $ epsilon_0 = 2^(- 10) \, wide c_0 = 2^(- 10) \, wide c_1 = c_0 \/ 4 . $ <sc:numerical>]

The constants are deliberately smaller than needed.

The value constraints below serve the envelope comparison:
  the center profile stays near one on the lower half of the selected oscillation,
  whereas the outer profile vanishes at level one and places a barrier on intermediate levels.
  We also prescribe strong outer concavity where the outer value is bounded by a fixed cap.
  That derivative condition will enter the endpoint lower tests in Section 5;
  the height bound below keeps the constants in the switch and excess bounds independent of $K$.

#thm([Lemma 4.3.])[
  (Smooth templates).  #emph[There is a fixed smooth function $B_c :
    bb(R) arrow.r \( - 1 \, 1 \)$ with bounded derivatives such that
$ B'_c < 0 upright(" on ") bb(R) \, wide B_c \( s \) gt.eq 1 - epsilon_0 quad \( s lt.eq 1 \/ 2 \) \, wide
  B_c \( s \) < 0 quad \( s gt.eq 3 \/ 4 \) . $

 Given a cap $M_0 gt.eq 2$ and $K gt.eq 1$, there are $0 < eta lt.eq
   1 \/ 128$ and a smooth bounded function $B_o gt.eq 0$, with bounded derivatives, satisfying
#[#set math.equation(numbering: n => "(4.6)")
 $ & B_o \( s \) gt.eq 1 quad \( s lt.eq 1 - eta \) \, wide B_o \( 1 \) = 0 \, wide 1 lt.eq B_o \( 0 \) lt.eq 1 +
   epsilon_0 \,\
 & B_o \( s \) gt.eq B_o \( 0 \) + 1 quad \( 1 \/ 16 lt.eq s lt.eq 1 - eta \) \,\
 & B'_o \( s \) > 0 \, quad B''_o \( s \) lt.eq - K quad upright("if ") - 2 eta lt.eq s lt.eq 1 -
   eta upright(" and ") B_o \( s \) lt.eq M_0 . $ <sc:outer-values>]

 One can arrange $parallel B_o parallel_oo lt.eq 2 M_0 + 8$, independently of $K$,
   and make $eta$ arbitrarily smaller if desired.]
] <sc:templates>

#proof[
  Choose $gamma$ so large that $2 \/ \( 1 + e^(gamma \/ 8) \) lt.eq epsilon_0$, and set
  $ B_c \( s \) = 1 - frac(2, 1 + e^(- gamma \( s - 5 \/ 8 \))) . $
  This has all the asserted properties. In particular, $\| B'_c \|$ has a positive minimum on every fixed compact
    interval.
  For the outer function let
  $ beta \( z \) = cases(delim: "{", e^(- 1 \/ z) \, & z > 0 \,, 0 \, & z lt.eq 0 \,) wide chi \( z \) =
    frac(beta \( z \), beta \( z \) + beta \( 1 - z \)) . $
  Thus $chi$ is a smooth step, equal to zero on $\( - oo \, 0 \]$ and to one on $\[ 1 \, oo \)$. Put
  $ kappa = K + 1 \, wide A = M_0 + 3 \, wide L = 128 A kappa \, wide h_0 = frac(1, 128 kappa) \, wide
    0 < eta lt.eq min {1 / 128 \, frac(epsilon_0, 24 L)} . $
  Define
  $ w \( s \) & = \( L - kappa s \) chi #h(-0.16667em) (frac(s + 3 eta, eta)) [1 - chi #h(-0.16667em)
    (frac(s - h_0, h_0))] \,\
J \( s \) & = 1 + epsilon_0 / 2 + integral_0^s w \( q \) thin d q \,\
B_o \( s \) & = J \( s \) [1 - chi #h(-0.16667em) (frac(s - \( 1 - eta \), eta))] . $
  The function $w$ is nonnegative and supported in $\[ - 3 eta \, 2 h_0 \]$. Also
  $ integral_(- 3 eta)^0 w lt.eq 3 eta \( L + 3 kappa eta \) lt.eq 6 eta L lt.eq epsilon_0 \/ 4 \, wide
    integral_0^(2 h_0) w lt.eq 2 L h_0 = 2 A . $
  It follows that
  $ 1 + epsilon_0 \/ 4 lt.eq J \( s \) lt.eq 1 + epsilon_0 \/ 2 + 2 A . $
  On $\[ - 2 eta \, h_0 \]$, one has $J' = L - kappa s > 0$ and $J'' = - kappa$. Moreover
  $ J \( h_0 \) - J \( 0 \) = A - frac(1, 32768 kappa) > M_0 + 1 . $
  Since $J$ is nondecreasing, the condition $B_o \( s \) lt.eq
    M_0$ on $\[ - 2 eta \, 1 - eta \]$ forces $s < h_0$; here $B_o = J$, proving (4.6).
    The function $J$ is constant beyond $2 h_0 lt.eq 1 \/ 64$, so (4.6) also follows.
    The final factor is identically one up to $1 - eta$, and decreases to zero only in $\( 1 - eta \, 1 \)$.
    This proves the remaining assertions, including smoothness at all joins and the uniform height bound. ◻
]

The cap $M_0$ will be fixed independently of $K$ by Lemma 25; the choice $M_0 = 24 \( n + 1 \) \/ c_1$ suffices.
  The center template is already fixed. After fixing $M_0$, choose $K$ and the outer template,
  and only then take the scales small. Besides (4.4), this order gives

#[#set math.equation(numbering: n => "(4.7)")
 $ delta_j = o \( eta \) \, wide b / D max { parallel B'_o parallel_oo \, parallel B'_c parallel_oo } arrow.r 0 \,
   wide b / D^2 max { parallel B''_o parallel_oo \, parallel B''_c parallel_oo } arrow.r 0 . $ <sc:template-smallness>]

In particular, both scalar modifications used below are increasing.
  Constants in intermediate local estimates may depend on a fixed template, but the constants $c_0 \,
  c_1$ and the cap do not depend on $K$.

=== 4.3 The first switch <the-first-switch>

Fix a selected section with extreme endpoints $y_0 \, y_1$, so that $v \( y_0 \) = a$ and $v \( y_1 \) = a + D$.
  Choose minimizing logs $p_0 \, p_1 in G_(x_0)$ to these endpoints, and put $P = \| p_0 \|^2$. For every target write

$ s_y = frac(v \( y \) - a, D) \, wide w_(o \, b) \( y \) = v \( y \) + b B_o \( s_y \) \, wide
  w_(c \, b) \( y \) = v \( y \) + b B_c \( s_y \) \, wide g_b = w_(o \, b)^c . $

Let $H_o = parallel B_o parallel_oo$. Since $B_o gt.eq 0$,

#[#set math.equation(numbering: n => "(4.8)")
 $ u - b H_o lt.eq g_b lt.eq u . $ <sc:g-bounds>]

We will move the pole toward $y_0$. Initially the outer modification lowers the level-zero mountain by about $b$,
  while leaving $y_1$ unpenalized. As long as mountains with $s_y gt.eq 1 - eta$ dominate,
  their minimizing logs are shorter than the log to $y_0$, so they grow more slowly along this motion.
  The barrier excludes intermediate-level winners, forcing a switch with both a low and a high active endpoint.
  Their two logs will then provide a supported intermediate log with a prescribed squared norm;
  the next subsection converts this construction into a positive excess.

We record the uniform distance estimate used in the proof.
  Splitting a minimizing geodesic at its midpoint gives a smooth upper support for the squared-distance cost with
  a uniformly bounded Hessian. Consequently, for any minimizing log $q$ from $x$ to $y$,

#[#set math.equation(numbering: n => "(4.9)")
 $ c \( exp_x z \, y \) lt.eq c \( x \, y \) - chevron.l q \, z chevron.r + C_g \| z \|^2 quad
   upright("for ") \| z \| upright(" sufficiently small") \, $ <sc:cost-upper>]

with one geometric constant and radius. Along a smooth curve, the one-sided derivative of $-
  c \( dot.op \, y \)$ is the maximum of the pairings with its minimizing logs.
  In particular, whenever this restriction is differentiable,

#[#set math.equation(numbering: n => "(4.10)")
 $ frac(d, d tau) \[ - c \( x_tau \, y \) \] lt.eq d \( x_tau \, y \) \| dot(x)_tau \| . $ <sc:advance>]

These assertions hold also at a cut endpoint. The same upper derivative bound applies to an active mountain of a
  maximum: at a time when the maximum is differentiable, a semiconvex active mountain has the same derivative.
  Indeed its one-sided derivatives straddle that derivative in the opposite order to their semiconvex ordering,
  and hence coincide. The restrictions in question are Lipschitz, so these differential inequalities can be integrated.

#thm([Lemma 4.4.])[
  (First switch with absolute level control).  #emph[For all sufficiently small selected scales,
    uniformly for $b in \[ b_(-) \, b_(+) \]$, there is
#[#set math.equation(numbering: n => "(4.11)")
 $ frac(b, 32 D) lt.eq tau_b lt.eq frac(8 b, D) $ <sc:switch-time>]

 such that, at $x_b = exp_(x_0) \( tau_b p_0 \)$, the function $g_b$ has active endpoints $y_(-)$ and $y_(+)$ with
$ - 2 eta lt.eq s_(y_(-)) < 1 \/ 16 \, wide s_(y_(+)) gt.eq 1 - eta . $

 The original endpoints $y_0 \, y_1$ and every active endpoint at this pole lie in one original section
   $S_(C b) \( x_b \; u \, v \)$, where $C$ depends only on the geometry and $H_o$.
   In particular every active level is in $\[ - delta_j \, 1 + delta_j \]$.
   For every minimizing log $q_i$ to an active endpoint,
#[#set math.equation(numbering: n => "(4.12)")
 $ \| q_i \|^2 = P - 2 D s_(y_i) + O_(H_o) \( tau_b + b \) = P - 2 D s_(y_i) + o \( D \) . $ <sc:switch-norms>]

 The constants in (4.11) are independent of $K$ and of the height and derivatives of the outer template.]
] <sc:switch>

#proof[
  Set $x_tau = exp_(x_0) \( tau p_0 \)$ for $0 lt.eq tau lt.eq T := 8 b \/ D$,
    and let $Pi_tau$ be parallel transport along this geodesic. For small scales $T < 1 \/ 2$. The left cost is exact:
  $ f_y \( tau \) := - c \( x_tau \, y \) - v \( y \) \, wide f_0 \( tau \) = - 1 / 2 \( 1 - tau \)^2 P - a \,
    wide q_0 \( tau \) = \( 1 - tau \) Pi_tau p_0 . $
  The initial gaps at $y_0 \, y_1$ lie in $\[ 0 \, r \]$, whence
  #[#set math.equation(numbering: n => "(4.13)")
   $ P - \| p_1 \|^2 = 2 D + O \( r \) \, wide \| p_0 - p_1 \|^2 lt.eq 8 \( D + r \) \, wide P - chevron.l p_0 \,
     p_1 chevron.r lt.eq 6 D $ <sc:initial-logs>]
  for small scales; the second inequality is (4.1) applied using the actual oscillation $D$ of this section.
    In particular $P gt.eq D$.
  First exclude the middle levels. If $1 \/ 16 lt.eq s_y lt.eq 1 - eta$, put
  $ h_y \( tau \) = f_y \( tau \) - b B_o \( s_y \) - f_0 \( tau \) + b B_o \( 0 \) . $
  Initially $h_y \( 0 \) lt.eq r - b$. Wherever $h_y gt.eq - b \/ 2$,
    the identity relating values and squared distances gives, for every minimizing log $q_y$ at the current pole,
  $ \| q_y \|^2 - \| q_0 \|^2 = - 2 D s_y - 2 b \( B_o \( s_y \) - B_o \( 0 \) \) - 2 h_y lt.eq - D \/ 8 - b . $
  Equations (4.10) and $dot(x)_tau = Pi_tau p_0$ imply $h'_y lt.eq - D \/ 16$ at almost every such time.
    The positive part of $h_y + b \/ 2$ is therefore nonincreasing and starts at zero.
    Thus $h_y lt.eq - b \/ 2$ throughout $\[ 0 \, T \]$. No middle-level mountain can be active.
  Let $G_L$ and $G_R$ be the maxima of $f_y - b B_o \( s_y \)$ over the compact sets $s_y lt.eq
    1 \/ 16$ and $s_y gt.eq 1 - eta$, respectively. Both are continuous,
    and the preceding paragraph shows $g_b \( x_tau \) = max { G_L \( tau \) \, G_R \( tau \) }$.
    Initially $G_L \( 0 \) lt.eq u \( x_0 \) - b$ and $G_R \( 0 \) gt.eq f_1 \( 0 \) gt.eq u \( x_0 \) - r$.
    While $G_R > G_L$, every active endpoint is right and comparison with the left modified mountain gives
  $ \| q_y \|^2 lt.eq \| q_0 \|^2 - 2 D \( 1 - eta \) + 2 b B_o \( 0 \) lt.eq \| q_0 \|^2 - D . $
  By rationalizing the difference of the square roots in (4.10),
  $ frac(d, d tau) { g_b \( x_tau \) - f_0 \( tau \) } lt.eq - D \/ 2 quad
    upright("almost everywhere while ") G_R > G_L . $
  This difference starts at most $r$ and is always at least $- b B_o \( 0 \) gt.eq - 2 b$.
    It cannot obey the displayed inequality throughout $\[ 0 \, T \]$.
    There is therefore a first equality time $tau_b lt.eq T$.
    At that time both maxima are attained, and the middle-level exclusion gives $s_(y_(-)) < 1 \/ 16$.
    Throughout the preceding interval, including its endpoint,
  #[#set math.equation(numbering: n => "(4.14)")
   $ - b B_o \( 0 \) lt.eq g_b \( x_tau \) - f_0 \( tau \) lt.eq r . $ <sc:left-anchor>]
  We next anchor the absolute levels. By (4.8) and (4.14), $u \( x_tau \) - f_0 \( tau \) lt.eq b H_o + r$.
    The initial-cost upper support and (4.13) give
  #[#set math.equation(numbering: n => "(4.15)")
   $ f_1 \( tau \) gt.eq f_0 \( 0 \) - r + \( P - 6 D \) tau - C_g tau^2 = : cal(L) \( tau \) . $ <sc:benchmark>]
  Since $f_0 \( tau \) = f_0 \( 0 \) + P tau - P tau^2 \/ 2$, it follows that $f_0 - f_1 lt.eq r + 6 D tau +
    C tau^2 = O \( b \)$ on this interval. Thus both $y_0 \, y_1$ lie in an original section of height $C b$.
    For any active endpoint $y$,
  $ u \( x_tau \) + c \( x_tau \, y \) + v \( y \) = u \( x_tau \) - g_b \( x_tau \) - b B_o \( s_y \) lt.eq b H_o . $
  All these endpoints belong to the same section of height $C b < R$.
    Its oscillation is at most $\( 1 + delta_j \) D$ and it contains levels $a \, a + D$.
    Hence every active level lies in $\[ - delta_j \, 1 + delta_j \]$,
    proving in particular the required lower bound for $s_(y_(-))$.
  To prove the lower time estimate, keep the winning left endpoint $y_(-)$ fixed, and put
  $ k \( tau \) = f_(y_(-)) \( tau \) - b B_o \( s_(y_(-)) \) - cal(L) \( tau \) . $
  One has $k \( 0 \) lt.eq 2 r - b < - b \/ 2$, while $k \( tau_b \) gt.eq 0$, since $g_b \( x_(tau_b) \) gt.eq
    f_1 \( tau_b \)$. Let $theta$ be the last time before $tau_b$ at which $k = - b \/ 2$.
    Then $k gt.eq - b \/ 2$ on $\[ theta \, tau_b \]$. On this interval, using $s_(y_(-)) gt.eq -
    2 eta$ and $B_o gt.eq 0$, the inequality defining this last strip gives
  $ \| q_(y_(-)) \|^2 - \| q_0 \|^2 & lt.eq 4 eta D + 2 r + 12 D tau + 2 C_g tau^2 + b\
 & lt.eq D $
  for all sufficiently small scales. This uses only (4.4); in particular $tau \/ D arrow.r 0$.
    Rationalizing once more gives $f'_(y_(-)) lt.eq \( 1 - tau \) P + 2 D$ almost everywhere in the strip.
    Since $cal(L)' = P - 6 D - 2 C_g tau$, we have $k' lt.eq 10 D$ there for small scales. Therefore
  $ b \/ 2 lt.eq k \( tau_b \) - k \( theta \) lt.eq 10 D \( tau_b - theta \) \, $
  which implies the stated weaker lower bound $tau_b gt.eq b \/ \( 32 D \)$.
    No upper bound for the template or its derivatives occurs in this last estimate.
  Finally, if $y_i$ is active at the switch, the exact equality of its modified value with $g_b$ gives
  $ \| q_i \|^2 = \( 1 - tau_b \)^2 P - 2 D s_(y_i) - 2 b B_o \( s_(y_i) \) - 2 { g_b \( x_b \) - f_0 \( tau_b \) } . $
  Equation (4.14) and (4.4) prove (4.12). ◻
]

=== 4.4 Positive excess and an interior maximum <positive-excess-and-an-interior-maximum>

Write $hat(w)_b = g_b^c = w_(o \, b)^(c c)$ and

$ E_b \( y \) = w_(c \, b) \( y \) - hat(w)_b \( y \) \, wide E \( b \) = max_(y in M) E_b \( y \) . $

Order reversal of one cost transform and the double-transform inequality give

#[#set math.equation(numbering: n => "(4.16)")
 $ v lt.eq hat(w)_b lt.eq w_(o \, b) \, wide E_b \( y \) lt.eq b B_c \( s_y \) lt.eq b . $ <sc:excess-upper>]

#thm([Lemma 4.5.])[
  (Uniform positive excess).  #emph[For all sufficiently small selected scales and all $b in \[ b_(-) \, b_(+) \]$,
#[#set math.equation(numbering: n => "(4.17)")
 $ c_0 b lt.eq E \( b \) lt.eq b \, $ <sc:excess-bounds>]

 with the constant in (4.5), independently of $K$.]
] <sc:excess>

#proof[
  Use the two active logs at the switch supplied by Lemma 20.
    Equation (4.12) and their level bounds show that their squared norms lie on opposite sides of $P - D \/ 2$.
    By continuity along their segment, choose $p in partial g_b \( x_b \)$ with
  $ \| p \|^2 = P - D \/ 2 . $
  Theorem 6 says that $p$ is minimizing and that $y = exp_(x_b) p$ is a contact endpoint for $g_b$. Thus
  $ E_b \( y \) = v \( y \) + b B_c \( s_y \) + c \( x_b \, y \) + g_b \( x_b \) . $
  Minorizing $g_b$ by the left modified mountain gives the direct bound
  #[#set math.equation(numbering: n => "(4.18)")
   $ E_b \( y \) gt.eq D \( s_y - 1 \/ 4 \) + P tau_b - P tau_b^2 \/ 2 + b { B_c \( s_y \) -
     B_o \( 0 \) } . $ <sc:direct-excess>]
  If $s_y > 1 \/ 2$, the right side is at least $D \/ 4 - 3 b$, which is larger than $c_0 b$ for small scales.
  It remains to consider $s_y lt.eq 1 \/ 2$. The original support inequality at $x_0$ yields
  $ v \( y \) - a gt.eq c \( x_0 \, y_0 \) - c \( x_0 \, y \) - r . $
  Apply (4.9) at $x_b$ with backward displacement $- tau_b Pi_(tau_b) p_0$ to get
  $ c \( x_b \, y \) - c \( x_0 \, y \) gt.eq - tau_b chevron.l p \, Pi_(tau_b) p_0 chevron.r - C tau_b^2 . $
  The corresponding cost difference for $y_0$ is exactly $- P tau_b + P tau_b^2 \/ 2$. Therefore
  #[#set math.equation(numbering: n => "(4.19)")
   $ frac(E_b \( y \), b) gt.eq B_c \( s_y \) - B_o \( 0 \) + #scale(x: 120%, y: 120%)[\(] P - chevron.l p \,
     Pi_(tau_b) p_0 chevron.r #scale(x: 120%, y: 120%)[\)] tau_b / b - r / b - C tau_b^2 / b . $ <sc:geometric-excess>]
  The norm choice gives
  $ P - chevron.l p \, Pi_(tau_b) p_0 chevron.r = frac(P - \| p \|^2 + \| p - Pi_(tau_b) p_0 \|^2, 2) gt.eq D \/ 4 . $
  The middle term in (4.19) is consequently at least $1 \/ 128$.
    The template difference is at least $- 2 epsilon_0$, and the last two terms tend to zero uniformly by (4.4).
    The numerical choices (4.5) give the asserted lower bound. The upper bound is (4.16). ◻
]

To obtain an interior maximum, we now subtract a penalty from the excess.
  A small linear term preserves its positive lower bound, and a quadratic term makes the upper amplitude boundary
  unfavorable. Define

#[#set math.equation(numbering: n => "(4.20)")
 $ pi \( b \) = c_0 / 4 b + frac(2 b^2, b_(+)) . $ <sc:penalty>]

In particular, $pi' \( b \) gt.eq c_1$.

#thm([Lemma 4.6.])[
  (Regularized interior maxima).  #emph[Fix a sufficiently small selected scale.
    For every $t < 1$ sufficiently close to one, the continuous function
$ Phi_t \( b \, z \) = Q_t g_b \( z \) + Q_(1 - t) w_(c \, b) \( z \) - pi \( b \) \,
  wide \( b \, z \) in \[ b_(-) \, b_(+) \] times M \, $

 has a positive global maximum with $b$ in the interior of its interval.
   Both spatial terms are $C^(1 \, 1)$, and both minimizing points are unique.
   If $x$ and $y$ are these minimizing points at a maximum, there is $p in partial g_b \( x \) ∩ G_x$ such that
#[#set math.equation(numbering: n => "(4.21)")
 $ z = exp_x \( t p \) \, wide y = exp_x p \, wide Q_t g_b \( z \) + Q_(1 - t) w_(c \, b) \( z \) =
   E_b \( y \) > 0 . $ <sc:aligned>]

 Moreover $\( x \, y \)$ is before cut.]
] <sc:maximum>

#proof[
  At $b = b_(+)$, (4.17) makes $E \( b \) - pi \( b \)$ negative. At $b = b_(-)$, it is at most $b_(-)$.
    At $b_(*) = c_0 b_(+) \/ 8$, which belongs to the interval for small scales,
  $ E \( b_(*) \) - pi \( b_(*) \) gt.eq c_0^2 b_(+) \/ 16 . $
  Since $b_(-) \/ b_(+) arrow.r 0$, these inequalities give a strictly positive interior maximum with a positive
    separation from both boundary values.
  For a fixed scale and $b$ in its compact interval, $Q_t g_b arrow.r Q_1 g_b = -
    hat(w)_b$ uniformly as $t arrow.t 1$. This follows directly from the uniform bound for $\| c \/ t - c \|$.
    The functions $w_(c \, b)$ have a common Lipschitz constant $L_(*)$ on that interval, and
  $ w_(c \, b) - 1 / 2 L_(*)^2 \( 1 - t \) lt.eq Q_(1 - t) w_(c \, b) lt.eq w_(c \, b) . $
  Thus $Phi_t arrow.r E_b - pi$ uniformly in $\( b \, z \)$,
    preserving the positive interior maximum when $t$ is sufficiently close to one.
  Proposition 9 gives the asserted regularity and unique pole for $Q_t g_b$.
    To check the other term, the scalar function $q mapsto q +
    b B_c \( \( q - a \) \/ D \)$ has positive derivative, and its first two derivatives are bounded at the fixed
    scales. Composing a Lipschitz semiconvex function with this function preserves semiconvexity:
    the lower Taylor support for $v$, its Lipschitz bound, and the ordinary second-order Taylor inequality for the
    scalar function give a common quadratic lower support for $w_(c \, b)$.
    For completeness, a minimizer in $Q_epsilon.alt w_(c \, b) \( z \)$ has $d \( z \, y \) lt.eq
    2 L_(*) epsilon.alt$, by comparison with $y = z$. For small $epsilon.alt$,
    all minimizers therefore lie in one convex normal ball, where the Hessian of $c \( z \, dot.op \) \/
    epsilon.alt$ dominates the negative semiconvexity bound. Strict convexity gives uniqueness.
    In one fixed coordinate chart, let $K_(*)$ be the semiconvexity constant and let $mu \/
    epsilon.alt$ be a lower Hessian bound for the smooth cost term.
    The subgradient inequalities at the minimizers $y \, y'$ for nearby $z \,
    z'$ and the mixed cost derivative bound give
  $ \( mu \/ epsilon.alt - K_(*) \) \| y - y' \|^2 lt.eq \( C \/ epsilon.alt \) \| z - z' \| thin \| y - y' \| . $
  For small $epsilon.alt$ this proves local Lipschitz dependence on $z$.
    The envelope gradient formula then gives $C^(1 \, 1)$ regularity. This is uniform in $b$ on the fixed interval.
  At a maximum, the two spatial gradients sum to zero. Their envelope formulas show that the geodesic from $x$ to
    $z$, continued for the remaining time $1 - t$ with the same velocity, reaches $y$.
    The pole minimum gives $p in partial g_b \( x \)$. By Theorem 6,
    this full vector is minimizing and its endpoint is a support for $g_b$.
    Splitting its energy at time $t$ proves (4.21) exactly.
  Finally put $l = 1 + b B'_c \( s_y \) \/ D in \( 0 \, 1 \)$.
    The short final minimization gives its backward velocity in $partial w_(c \, b) \( y \) =
    l partial v \( y \)$; the equality follows from the increasing scalar chain rule,
    which follows in both directions by Taylor expansion and inversion of that scalar function.
    Dividing by $l$ gives a minimizing velocity by Theorem 6.
    The backward velocity to $x$ is a strict radial shortening of this vector, and is therefore before cut. ◻
]

=== 4.5 The parameter inequality for every representation <the-parameter-inequality-for-every-representation>

#thm([Lemma 4.7.])[
  (The parameter derivative).  #emph[At any maximum in Lemma 22, let
$ p = sum_(i = 1)^N m_i p_i \, wide m_i > 0 \, wide sum_i m_i = 1 \, $

 be any finite representation by minimizing logs active for the displayed representation $g_b =
   w_(o \, b)^c$ at its minimizing pole $x$. Thus $g_b \( x \) + c \( x \, exp_x p_i \) +
   w_(o \, b) \( exp_x p_i \) = 0$. Write $y_i = exp_x p_i$ and $s_i = \( v \( y_i \) - a \) \/ D$,
   and let $s = \( v \( y \) - a \) \/ D$ be the center level. Then
#[#set math.equation(numbering: n => "(4.22)")
 $ B_c \( s \) - sum_i m_i B_o \( s_i \) gt.eq pi' \( b \) gt.eq c_1 . $ <sc:parameter-inequality>]

]
] <sc:parameter>

#proof[
  Fix the prefix time and the spatial maximum point $z$, and abbreviate $A \( b \) =
    Q_t g_b \( z \)$ and $C \( b \) = Q_(1 - t) w_(c \, b) \( z \)$.
    Decrease $b$ by $h > 0$, and let $x_h$ be the new pole for $A \( b - h \)$.
    Because $0 lt.eq g_(b - h) - g_b lt.eq h H_o$, compactness and uniqueness of the old pole imply $x_h arrow.r
    x$. The strict local quadratic growth in Proposition 9 gives, in normal coordinates $Delta_h = exp_x^(- 1) x_h$,
  #[#set math.equation(numbering: n => "(4.23)")
   $ \| Delta_h \| = O \( sqrt(h) \) \, wide 0 lt.eq A \( b - h \) - A \( b \) lt.eq h H_o . $ <sc:pole-movement>]
  Choose one duration $q in \( t \, 1 \)$ and split each active endpoint cost at $z_i = exp_x \( q p_i \)$.
    The energy inequality
  $ c \( x' \, y_i \) lt.eq c_q \( x' \, z_i \) + c_(1 - q) \( z_i \, y_i \) $
  is an equality at $x' = x$. Its first term is smooth near $x$, because $q p_i$ is before cut.
    Its gradient is $- p_i$ and its Hessian is $A_x \( q p_i \) \/ q$.
    Combining this upper support with the smooth prefix cost gives
  #[#set math.equation(numbering: n => "(4.24)")
   $ A \( b - h \) & gt.eq A \( b \) + h B_o \( s_i \) + chevron.l p_i - p \, Delta_h chevron.r + 1 /
     2 Q_i \( Delta_h \, Delta_h \) + o \( \| Delta_h \|^2 \) \,\
Q_i & = 1 / t A_x \( t p \) - 1 / q A_x \( q p_i \) . $ <sc:individual-pole>]
  All expansions here concern fixed scales, a fixed time, and a fixed finite representation.
    Equations (4.23)–(4.24) bound each $chevron.l p_i - p \, Delta_h chevron.r$ above by $O \( h \)$.
    Their positive weighted sum is zero, so each is also bounded below by $- O \( h \)$.
    Hence, for $E = "span" { p_i - p }$,
  #[#set math.equation(numbering: n => "(4.25)")
   $ \| "proj"_E Delta_h \| = O \( h \) . $ <sc:linear-movement>]
  On $E^perp$, MTW concavity on the simplex of the $q p_i$ gives
  $ A_x \( q p \) gt.eq sum_i m_i A_x \( q p_i \) . $
  Radial monotonicity of divided action, equivalently Lemma 4, then gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ sum_i m_i Q_i = 1 / t A_x \( t p \) - sum_i m_i / q A_x \( q p_i \) gt.eq 0 quad
     upright("on ") E^perp . $ <sc:transverse-pole>]
  Average (4.24). The linear terms cancel. By (4.23), (4.25), and (4.26),
    its quadratic term is bounded below by $- o \( h \)$: the transverse part is nonnegative,
    mixed terms are $O \( h^(3 \/ 2) \)$, and the remaining part is $O \( h^2 \)$.
    The Taylor remainders are $o \( h \)$ as well. Thus
  $ A \( b - h \) - A \( b \) gt.eq h sum_i m_i B_o \( s_i \) + o \( h \) . $
  The unique center minimizer and the elementary envelope argument (compare the old and new minimizers and use
    their convergence) give
  $ C \( b - h \) - C \( b \) = - h B_c \( s \) + o \( h \) . $
  Since $b$ is an interior maximum of $A + C - pi$, division of the resulting one-sided comparison by $h$ and
    passage to the limit give (4.22). The argument applies to the arbitrary representation fixed at the start,
    proving the asserted universal quantifier. ◻
]

#thm([Lemma 4.8.])[
  (Levels at a regularized maximum).  #emph[At a maximum in Lemma 22,
    the center and all active endpoints belong to $S_(\( H_o + 2 \) b) \( x \; u \, v \)$. For every active log $p_i$,
#[#set math.equation(numbering: n => "(4.27)")
 $ v \( y_i \) - v \( y \) = frac(\| p \|^2 - \| p_i \|^2, 2) + b { B_c \( s \) - B_o \( s_i \) } -
   E_b \( y \) . $ <sc:level-identity>]

 In every positive barycentric representation the total weight on levels $s_i gt.eq 1 - eta$ is at least $c_1$. Moreover
#[#set math.equation(numbering: n => "(4.28)")
 $ s < 3 \/ 4 \, wide max { s \, s_i } - min { s \, s_i } lt.eq 1 + delta_j \, wide min { s \, s_i } gt.eq -
   2 eta $ <sc:level-bounds>]

 for small scales. These conclusions hold at each exact maximum, before taking a prefix-time limit.]
] <sc:levels>

#proof[
  An active endpoint has original gap $u - g_b - b B_o \( s_i \) in \[ 0 \, b H_o \]$.
    By (4.21), the center gap is $u - g_b + E_b \( y \) - b B_c \( s \)$,
    which is at most $\( H_o + 2 \) b$ by (4.16). This proves the common section assertion and its oscillation
    bound. Subtracting the active contact equality from (4.21) gives (4.27).
    Since $E_b \( y \) > 0$ and $E_b \( y \) lt.eq b B_c \( s \)$, one has $B_c \( s \) > 0$,
    and therefore $s < 3 \/ 4$.
  Let $m_R$ be the total right weight. Nonnegativity of $B_o$ and its lower bound by one outside the right region give
  $ 1 - m_R lt.eq sum_i m_i B_o \( s_i \) lt.eq B_c \( s \) - c_1 lt.eq 1 - c_1 . $
  Thus $m_R gt.eq c_1$. In particular a right endpoint is present.
    The common range bound then puts every level above $\( 1 - eta \) - \( 1 + delta_j \) = - eta -
    delta_j gt.eq - 2 eta$. ◻
]

=== 4.6 A quantitative outward endpoint <a-quantitative-outward-endpoint>

The next Lemma selects an endpoint once the active logs lie on a line and the center log has a nonzero component
  along that line. The center Hessian estimate in Section 5 will establish these two properties;
  the selection itself is finite-dimensional.

#thm([Lemma 4.9.])[
  (Weight, cap, and norm increment).  #emph[Suppose $p = sum_(i = 1)^N m_i
    p_i$ in an $n$-dimensional Euclidean space, with $N lt.eq n + 1$, $m_i > 0$, and $sum_i m_i = 1$.
    Suppose $E = "span" { p_i - p } = bb(R) e$, where $\| e \| = 1$, and $q = p dot.op e > 0$.
    Assume the template and level inequalities (4.22), (4.28), and
$ lr(|med \| p_i \|^2 - \| p \|^2 + 2 D \( s_i - s \) med|) lt.eq zeta D \, wide 0 lt.eq delta_j lt.eq zeta lt.eq
  1 \/ 16 . $

 There is an outward index $i$ with $p_i = p + d_i e$, $d_i > 0$, such that
#[#set math.equation(numbering: n => "(4.29)")
 $ m_i gt.eq m_(*) := frac(c_1, 12 \( n + 1 \)) \, wide m_i d_i gt.eq frac(c_1 D, 8 \( n + 1 \) q) \, wide
   d_i lt.eq frac(3 D, 2 q) \,\
0 < \| p_i \|^2 - \| p \|^2 lt.eq 3 D \,\
- 2 eta lt.eq s_i < 1 - eta \, wide B_o \( s_i \) lt.eq 1 \/ m_(*) . $ <sc:outward-weight>]

 In particular the cap $M_0 = 2 \/ m_(*)$ can be fixed before $K$. All these constants are independent of $K$.]
] <sc:outward>

#proof[
  Write $p_i = p + d_i e$. The level inequality gives total right mass at least $c_1$, as in Lemma 24.
    A right point has $s_i - s > 1 \/ 4 - eta$, hence
  $ \| p_i \|^2 - \| p \|^2 = 2 q d_i + d_i^2 lt.eq - D \/ 4 . $
  It follows that $d_i < 0$ and $\| d_i \| gt.eq D \/ \( 8 q \)$.
    Every outward point satisfies, by the common level range,
  $ 0 < 2 q d_i + d_i^2 lt.eq 2 D \( 1 + delta_j \) + zeta D lt.eq 3 D \, $
  and so $d_i lt.eq 3 D \/ \( 2 q \)$. The barycenter identity $sum_i m_i d_i = 0$ therefore implies
  $ sum_(d_i > 0) m_i d_i gt.eq frac(c_1 D, 8 q) . $
  Choose an outward index contributing at least $1 \/ N$ of this moment.
    Its upper displacement bound gives $m_i gt.eq c_1 \/ \( 12 N \) gt.eq m_(*)$, proving (4.29).
  The parameter inequality and nonnegativity of the outer template give $m_i B_o \( s_i \) lt.eq 1$,
    proving its cap bound. The lower level bound is already known.
    The positive norm increment implies $s_i lt.eq s + zeta \/ 2 < 3 \/ 4 + 1 \/ 32 < 1 - eta$.
    Thus the selected endpoint lies in the region where (4.6) applies when $M_0 = 2 \/ m_(*)$. ◻
]

For a convergent sequence of active representations, an endpoint selected by Lemma 25 in the limit carries a
  definite positive moment as well as a definite weight. Its strict outward displacement and its strict separation
  from the right region persist for the corresponding approximating vertices.
  The remaining analytic task is to produce the one-dimensional difference space and a bound $q^2 gt.eq
  kappa D$ with $kappa > 0$ independent of $K$. Together with (4.29), these are the hypotheses of Corollary 16,
  which will compare the center and selected outer Jacobians.

== 5 Lower jets and the determinant contradiction <sec:jets>

The comparison maxima of Section 4 relate a center endpoint to finitely many active outer endpoints.
  We seek determinant bounds for lower tests of the original potential at these endpoints.
  The main obstacle is that the center selected by a maximum need not belong to the full-measure set where the
  original transport Jacobian equation holds. Even though the short-time minimizing map is Lipschitz,
  it could send a set of positive volume into that exceptional set.

We first transfer lower jets from the prefix regularization to its active outer endpoints.
  The original contact-volume bound applies to these lower tests and bounds the selected outer determinant.
  That bound controls the regularized center Hessian, which in turn makes the short-time minimizing map
  nonsingular at the sampled points. Only then can we use the original Jacobian equation at the centers.
  The resulting matrix inequalities give a determinant gain proportional to the outer curvature parameter $K$,
  contradicting the geometric comparison from Section 3.

Throughout the argument the manifold and density bounds are fixed.
  In the local calculations, $F \, G$ and their indexed versions denote regularized potentials;
  the scalar oscillation function $F$ from Section 4 returns in Proposition 35.

Throughout this section, a #emph[lower Taylor jet] $\( zeta \, B \)$ of a function $f$ at the origin means

$ f \( h \) gt.eq f \( 0 \) + zeta dot.op h + 1 / 2 B \( h \, h \) + o \( \| h \|^2 \) . $

Replacing $B$ by $B - epsilon upright("Id")$, for any $epsilon > 0$,
  gives a genuine quadratic lower test on a sufficiently small neighborhood.
  All the tests to which we apply a determinant inequality will have a strictly positive relative Hessian,
  so this replacement and the subsequent limit $epsilon arrow.b 0$ are harmless.

=== 5.1 The original contact measure and lower tests <the-original-contact-measure-and-lower-tests>

#thm([Lemma 5.1.])[
  (Contact-volume comparison).  #emph[Let $u \, v$ be the dual potentials for an admissible pair of densities, and let
$ cal(C) = { \( x \, y \) : u \( x \) + c \( x \, y \) + v \( y \) = 0 } . $

 For a Borel set $A$ on either side, its contact image satisfies
#[#set math.equation(numbering: n => "(5.1)")
 $ lambda / Lambda "vol" \( A \) lt.eq "vol" \( cal(C) \( A \) \) lt.eq Lambda /
   lambda "vol" \( A \) . $ <jet:contact-volume-eq>]

 Projections are interpreted in the completed volume measures.]
] <jet:contact-volume>

#proof[
  The contact relation is closed. Its projections of Borel sets are analytic,
    hence measurable for the completed measures. The optimal coupling has full mass on $cal(C)$.
    At every differentiability point of either potential its contact endpoint is unique:
    all minimizing first-variation logs must equal its gradient,
    and their exponential endpoints therefore coincide. Since both marginals are absolutely continuous,
    almost every contact pair lies in the sets where both potentials are differentiable.
    The two contact maps on these sets are inverse to each other.
  Write $mu = rho_0 "vol"$ and $nu = rho_1 "vol"$. Consequently $nu \( cal(C) \( A \) \) =
    mu \( A \)$ for sets on the first side, and $mu \( cal(C) \( A \) \) =
    nu \( A \)$ for sets on the second side: any additional contact image outside the almost-everywhere map image
    consists, up to a null set, of points where the opposite potential is not differentiable.
    The density bounds give (5.1). ◻
]

#thm([Lemma 5.2.])[
  (Upper determinant bound for a lower test).  #emph[Let $v$ be one of the original dual potentials.
    Suppose a $C^2$ function $phi.alt$ touches $v$ from below at $y$, its gradient $r =
    "grad" phi.alt \( y \)$ belongs to $I \( y \)$, and
$ W = "Hess" phi.alt \( y \) + A_y \( r \) > 0 . $

 Then
#[#set math.equation(numbering: n => "(5.2)")
 $ sigma_y \( r \) det W lt.eq Lambda \/ lambda . $ <jet:viscosity-eq>]

 The same conclusion holds for a lower Taylor jet with these properties, by approximation of its quadratic part.]
] <jet:viscosity>

#proof[
  It suffices first to prove the result after decreasing the Hessian by a small positive multiple of the metric.
    Thus we may arrange strict touching, with $v - phi.alt gt.eq
    epsilon d \( dot.op \, y \)^2$ in a small coordinate ball. The map
  $ S \( z \) = exp_z "grad" phi.alt \( z \) $
  is a local diffeomorphism near $y$. Indeed its defining equation is $D_z c \( z \, S \( z \) \) +
    "grad" phi.alt \( z \) = 0$, and differentiation gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ \| det D S \( z \) \| = sigma_z \( "grad" phi.alt \( z \) \) det { "Hess" phi.alt \( z \) +
     A_z \( "grad" phi.alt \( z \) \) } . $ <jet:smooth-jacobian>]
  The relative Hessian is positive throughout a sufficiently small ball, and the logs remain before cut.
  For $h > 0$, let $Omega_h$ be the connected component containing $y$ of ${ phi.alt + h > v }$ inside that ball.
    It is relatively compact and shrinks to $y$. If $z in Omega_h$ and $x = S \( z \)$, the cost mountain
  $ m_x \( w \) = phi.alt \( z \) + c \( z \, x \) - c \( w \, x \) $
  is tangent to $phi.alt$ at $z$. On a fixed smaller coordinate ball, $phi.alt - m_x$ has positive Hessian,
    uniformly for $x$ close to $S \( y \)$; thus $phi.alt gt.eq m_x$ there.
    On $partial Omega_h$ we have $v - m_x gt.eq h$, whereas at $z$ we have $v \( z \) - m_x \( z \) < h$.
    The minimum of $v - m_x$ on $overline(Omega_h)$ is therefore attained at an interior point $z'$.
    Thus $"grad" m_x \( z' \) in partial v \( z' \)$. By Theorem 6,
    the corresponding local contact is a global cost contact. Its endpoint is $x$. This proves
  $ S \( Omega_h \) subset cal(C) \( Omega_h \) . $
  Use the area formula for the diffeomorphism $S$ #cite(label("Simon2018")) Chapter 2, Theorem 3.3,
    followed by Lemma 26, to obtain
  $ inf_(Omega_h) \| det D S \| thin "vol" \( Omega_h \) lt.eq
    "vol" \( S \( Omega_h \) \) lt.eq \( Lambda \/ lambda \) "vol" \( Omega_h \) . $
  Let $h arrow.b 0$ and then restore the original Hessian. ◻
]

Only the original correspondence occurs in these two Lemmas.
  No density bound is claimed for a modified potential or its envelope.
  For later use, the almost-everywhere counterpart of (5.3) is the following consequence of
  #cite(label("CEMS2001")) Proposition 4.1 and Theorem 4.2.
  There is a volume-null Borel set $N subset M$ such that, at every $y in.not N$, $v$ has an Alexandrov Hessian,
  its true log $r = "grad" v \( y \)$ is before cut, and

#[#set math.equation(numbering: n => "(5.4)")
 $ W_v \( y \) := "Hess" v \( y \) + A_y \( r \) > 0 \, wide lambda / Lambda lt.eq
   sigma_y \( r \) det W_v \( y \) lt.eq Lambda / lambda . $ <jet:ae-jacobian>]

We enlarge $N$ to include the exceptional sets in the contact-map differential of #cite(label("CEMS2001"))
  Proposition 4.1(b). The Jacobian equation in #cite(label("CEMS2001")) Theorem 4.2 assumes only absolute
  continuity with $L^1$ densities. The lower density bound makes its full-source-measure set a full-volume set;
  differentiability of a density is not required.

=== 5.2 An exact endpoint-jet calculation <an-exact-endpoint-jet-calculation>

Fix a continuous datum $w_o$ and put

$ g \( x \) = max_y { - c \( x \, y \) - w_o \( y \) } \, wide F = Q_t g \, quad 0 < t < 1 . $

By Proposition 9, $F$ is locally $C^(1 \, 1)$ and its minimizing pole $x \( z \)$ is unique and locally Lipschitz.
  The following calculation concerns the first minimum alone.

#thm([Lemma 5.3.])[
  (The pole matrix and endpoint lower jets).  #emph[Suppose $z_0$ is a point where $F$ has a second-order
    expansion and $x \( z \)$ is differentiable. Write $x = x \( z_0 \)$, $z_0 = exp_x \( t p \)$,
    and choose active logs
$ p = sum_(j = 1)^N m_j p_j \, wide m_j > 0 \, quad sum_j m_j = 1 \, wide N lt.eq n + 1 \, $

 where $y_j = exp_x p_j$ and $g \( x \) + c \( x \, y_j \) + w_o \( y_j \) = 0$.
   Set $E = "span" { p_j - p : 1 lt.eq j lt.eq N }$. In the fixed-pole coordinates $z \( q \) = exp_x \( t q \)$, define
#[#set math.equation(numbering: n => "(5.5)")
 $ L = D_q^2 { c_t \( x \, z \( q \) \) - F \( z \( q \) \) } \|_(q = p) . $ <jet:L-definition>]

 Then
#[#set math.equation(numbering: n => "(5.6)")
 $ L gt.eq 0 \, wide L E = 0 . $ <jet:L-properties>]

 For every $j$, the function
$ Psi_j \( d \) = w_o \( exp_x \( p_j + d \) \) + 1 / 2 \| p_j + d \|^2 $

 has at $d = 0$ the lower Taylor jet $\( 0 \, m_j L \)$, after subtracting its value at zero.
   If $p_j$ is nonconjugate, this is an endpoint lower test in the smooth chosen cost branch.]
  #emph[More precisely, for $t < s < 1$ put
$ Q_s = 1 / t A_x \( t p \) - 1 / s sum_j m_j A_x \( s p_j \) . $

 Then $Q_s gt.eq 0$ on $E^perp$, and $m_j \( L + L Q_s L \)$ is a lower Taylor Hessian for $Psi_j$.]
] <jet:transfer>

#proof[
  Use normal coordinates $x' = exp_x a$ and set
  $ B \( a \, q \) = c_t \( exp_x a \, z \( q \) \) \, quad f \( q \) = F \( z \( q \) \) \, quad a \( q \) =
    log_x x \( z \( q \) \) . $
  At the reference point $a \( p \) = 0$. First variation gives the exact identities
  $ B \( 0 \, q \) = t / 2 \| q \|^2 \, wide B_a \( 0 \, q \) = - q . $
  Thus $B_(q q) = t upright("Id")$, $B_(q a) = - upright("Id")$ at $\( 0 \, p \)$.
    The envelope identity $D f \( q \) = B_q \( a \( q \) \, q \)$ and differentiability of the pole imply
  #[#set math.equation(numbering: n => "(5.7)")
   $ D^2 f = t upright("Id") - R \, wide R = D_q a \( p \) = L . $ <jet:pole-identity>]
  In particular $R$ is symmetric. Since $f \( q \) lt.eq g \( x \) + B \( 0 \, q \)$ with equality at $p$,
    we have $L gt.eq 0$.
  Choose a common $s in \( t \, 1 \)$. For each $j$ define
  $ y_j \( d \) = exp_x \( p_j + d \) \, wide z_j \( d \) = exp_x \( s \( p_j + d \) \) \, $
  and the split upper cost
  #[#set math.equation(numbering: n => "(5.8)")
   $ C_j \( a \, d \) = frac(c \( exp_x a \, z_j \( d \) \), s) +
     frac(c \( z_j \( d \) \, y_j \( d \) \), 1 - s) . $ <jet:split-cost>]
  Both cost pieces are smooth near $\( 0 \, 0 \)$ because they are proper subsegments of a minimizing ray.
    Energy splitting gives $c \( exp_x a \, y_j \( d \) \) lt.eq C_j \( a \, d \)$.
    At $a = 0$, the chosen geodesic remains minimizing on both pieces for small $d$, and consequently
  #[#set math.equation(numbering: n => "(5.9)")
   $ C_j \( 0 \, d \) = 1 / 2 \| p_j + d \|^2 \, quad \( C_j \)_a \( 0 \, d \) = - \( p_j + d \) \,
     quad \( C_j \)_(a d) = - upright("Id") \, quad \( C_j \)_(a a) = 1 / s A_x \( s p_j \) . $ <jet:split-derivatives>]
  The use of the fixed reference pole in $z_j \( d \)$ is what makes the mixed derivative exactly $- upright("Id")$.
  The nonnegative function
  $ g \( x \( z \( q \) \) \) + C_j \( a \( q \) \, 0 \) + w_o \( y_j \) $
  vanishes at $p$. It is differentiable there, since $g \( x \( z \( q \) \) \) = f \( q \) -
    B \( a \( q \) \, q \)$, and its derivative equals $\( p - p_j \)^(*) R$. This derivative is zero.
    Symmetry in (5.7) proves $L E = 0$.
  On $E^perp$, MTW concavity on the convex hull of the $s p_j$, followed by divided-action monotonicity, gives
  $ Q_s gt.eq 1 / t A_x \( t p \) - 1 / s A_x \( s p \) > 0 . $
  All points used in this inequality are before cut by Theorem 6; equivalently one may invoke Lemma 4.
    Notice that unsplit endpoints may still be conjugate.
  Fix $i$ and write $m = m_i$. Given $d$, choose any linear map $U : T_x M arrow.r E$, and set $k =
    m \( d + U d \)$ and $a = a \( p + k \)$. In the lower bound defining $g \( exp_x a \)$,
    move endpoint $i$ to $y_i \( d \)$, keep all other endpoints fixed, replace the costs by (5.8),
    and average with the old weights. Write $hat(Psi)_i \( d \) = Psi_i \( d \) - Psi_i \( 0 \)$.
    The resulting inequality is
  $ f \( p + k \) gt.eq B \( a \, p + k \) - sum_j m_j { C_j \( a \, d_j \) + w_o \( y_j \( d_j \) \) } \, $
  where $d_i = d$ and $d_j = 0$ for $j eq.not i$. Subtract the equality at $\( a \, k \, d \) = \( 0 \, 0 \, 0 \)$
    and use (5.7)–(5.9). The linear terms cancel: the pole terms cancel because $sum m_j p_j = p$,
    and the prefix terms cancel because $D f \( p \) = t p$. The remaining inequality is
  #[#set math.equation(numbering: n => "(5.10)")
   $ m hat(Psi)_i \( d \) gt.eq 1 / 2 L \( k \, k \) + 1 / 2 Q_s \( a \, a \) + a dot.op \( m d - k \) +
     o \( \| d \|^2 \) . $ <jet:quadratic-transfer>]
  Here $a = L k + o \( \| d \| \)$. Since $m d - k = - m U d$ and $"range" L subset E^perp$,
    the mixed term is $o \( \| d \|^2 \)$. Hence the lower Hessian is
  $ m \( upright("Id") + U \)^(*) \( L + L Q_s L \) \( upright("Id") + U \) . $
  In fact this equals $m \( L + L Q_s L \)$ because $L U = 0$.
    The latter dominates $m L$, proving the asserted jet. The linear term is exactly zero independently of any
    second function or maximum condition.
  The map $d mapsto y_i \( d \)$ need not be invertible for the preceding pullback calculation.
    When $p_i$ is nonconjugate it is a local diffeomorphism, and $1 / 2 \| p_i +
    d \|^2$ is the smooth chosen upper branch of $c \( x \, y_i \( d \) \)$.
    This converts the pullback jet into an endpoint jet. ◻
]

Let $G$ be another locally $C^(1 \, 1)$ function, and define

#[#set math.equation(numbering: n => "(5.11)")
 $ H = D_q^2 { c_t \( x \, z \( q \) \) + G \( z \( q \) \) } \|_(q = p) . $ <jet:H-definition>]

The exact identity

#[#set math.equation(numbering: n => "(5.12)")
 $ H - L = D_q^2 { \( F + G \) \( z \( q \) \) } \|_(q = p) $ <jet:H-minus-L>]

will distinguish the first-minimum calculation from the maximum argument.
  At a twice differentiable maximum, it gives $H lt.eq L$ and $H \|_E lt.eq 0$.
  At a Jensen point with gradient and upper Hessian errors tending to zero in a fixed smooth chart, it gives

#[#set math.equation(numbering: n => "(5.13)")
 $ H lt.eq L + eta upright("Id") \, wide eta arrow.r 0 . $ <jet:Jensen-error>]

The coordinate-change term uses the gradient error and also tends to zero. Lemma 28 is exact at such a point.
  For every linear $U$ with image in $E$, it therefore supplies a lower jet $H_i = m_i L$ satisfying

$ H_i gt.eq m_i \( upright("Id") + U \)^(*) H \( upright("Id") + U \) -
  m_i eta \( upright("Id") + U \)^(*) \( upright("Id") + U \) . $

In particular no approximate stationarity term occurs in the linear coefficient of the endpoint test.

=== 5.3 The center semibound without a density equation <the-center-semibound-without-a-density-equation>

We use the scales and templates of the preceding section.
  To distinguish a scalar argument from a point of the manifold, write

$ phi_c \( h \) = h + b B_c \( \( h - a \) \/ D \) \, quad phi_o \( h \) = h + b B_o \( \( h - a \) \/ D \) \,
  quad w_c = phi_c compose v \, quad w_o = phi_o compose v . $

For each fixed outer template the scales are sufficiently small that both scalar maps have derivative between
  $1 \/ 2$ and $2$. On the fixed compact interval of possible center levels,
  $B'_c$ is negative and bounded away from zero. Its derivative bounds are fixed independently of the outer
  curvature parameter $K$.

#thm([Lemma 5.4.])[
  (A lower semibound before the center Jacobian).  #emph[Fix one set of scales, one original potential $v$,
    and the two templates. Let $t_j arrow.t 1$ and $b_j in \[ b_(-) \, b_(+) \]$. Put
$ F_j = Q_(t_j) g_(b_j) \, wide G_j = Q_(1 - t_j) w_(c \, b_j) . $

 Let $z_j$ be simultaneous differentiability points for the objects in Lemma 28,
   with second-order expansions of $G_j$, whose center levels lie in the fixed compact interval above. Suppose
$ \| "grad" \( F_j + G_j \) \( z_j \) \| arrow.r 0 . $

 Let $x_j$ be the prefix pole and $z_j = exp_(x_j) \( t_j p_j \)$. The matrix $H_j$ of (5.11) satisfies
#[#set math.equation(numbering: n => "(5.14)")
 $ H_j gt.eq c b_j / D upright("Id") - C b_j / D^2 p_j p_j^(*) - epsilon_j upright("Id") \, wide epsilon_j arrow.r
   0 . $ <jet:semibound-eq>]

 The constants $c \, C$ depend on the geometry and the fixed center template, but not on $K$.
   The errors tend to zero with the prefix and gradient errors at the fixed scales.
   No upper bound on $H_j$, and no Alexandrov Hessian of $v$ at the center, is assumed.]
] <jet:semibound>

#proof[
  Write $tau_j = 1 - t_j$, and let $y_j$ be the unique final minimizer. Set
  $ r_j = tau_j^(- 1) log_(y_j) z_j \, wide l_j = phi'_c \( v \( y_j \) \) < 1 . $
  The short minimum gives a smooth local lower test for $w_c$ with gradient $r_j$.
    Inverting $phi_c$ gives a local lower test for $v$ with gradient $r_j \/ l_j$. Theorem 6 therefore implies that
  $ zeta_j = exp_(y_j) \( r_j \/ l_j \) $
  is a true contact endpoint of $v$, joined by the indicated minimizing ray.
    In particular $hat(x)_j = exp_(y_j) r_j$ is strictly before cut along that ray.
  For the moment omit subscripts. Put $theta = \( 1 + l^(- 1) \) \/ 2$ and $xi = exp_y \( theta r \)$.
    Split the true support at $xi$, using the fraction $l theta$ of its unit duration.
    The resulting upper cost support is
  $ C \( h \) = frac(c \( h \, xi \), l theta) + frac(c \( xi \, zeta \), 1 - l theta) . $
  It agrees with $c \( h \, zeta \)$ at $h = y$, and $v \( h \) gt.eq v \( y \) + c \( y \, zeta \) - C \( h \)$. Thus
  $ psi \( h \) = phi_c { v \( y \) + c \( y \, zeta \) - C \( h \) } $
  is a smooth local lower support for $w_c$, with
  #[#set math.equation(numbering: n => "(5.15)")
   $ "grad" psi \( y \) = r \, wide "Hess" psi \( y \) = - theta^(- 1) A_y \( theta r \) +
     frac(phi''_c \( v \( y \) \), l^2) r r^(*) . $ <jet:center-support-jet>]
  The original true endpoint $zeta$ may be conjugate. The point $xi$ is halfway into the available extension and
    is before cut, which is all that this construction uses.
  At the fixed scales, $1 - l$ has a positive lower bound and the parameters $\( y \, r \, l \, v \( y \) \)$
    range over a compact set. The first cost piece in $C$ is uniformly smooth on a fixed neighborhood of $y$;
    the second piece is constant in $h$. Consequently the supports $psi$ have uniform smooth bounds and a uniform
    supporting radius. For sufficiently small $tau$, the local infimum $Q_tau psi$ is smooth near $z$,
    has minimizer $y$ at $z$, and supports $Q_tau w_c$ from below there.
    To justify the last assertion, all minimizers of the latter lie within $O \( tau \)$ of $z$,
    by the Lipschitz bound on $w_c$, and so lie in the supporting neighborhood.
    For $psi$ the local Hessian of the minimizing expression is $tau^(- 1) upright("Id") + O \( 1 \) > 0$.
    Equality and stationary first variation hold at $y$. The implicit-function theorem and the Schur formula for a
    minimum give, after parallel identification,
  #[#set math.equation(numbering: n => "(5.16)")
   $ "Hess" Q_tau psi \( z \) = "Hess" psi \( y \) + O \( tau \) . $ <jet:smooth-short-limit>]
  All constants in this statement are uniform for the fixed-scale family just described.
  Let $hat(p) = log_(hat(x)) y$ and $hat(L) = \( d exp_(hat(x)) \)_(hat(p))$.
    Lemma 14, applied to the minimizing ray through duration $1 \/ l$, gives
  $ hat(L)^(*) { A_y \( r \) - theta^(- 1) A_y \( theta r \) } hat(L) gt.eq c \( 1 - l \) upright("Id") . $
  Gauss’s Lemma gives $hat(L)^(*) r = - hat(p)$. Combining this with (5.15) yields
  #[#set math.equation(numbering: n => "(5.17)")
   $ hat(L)^(*) { "Hess" psi \( y \) + A_y \( r \) } hat(L) gt.eq c \( 1 - l \) upright("Id") +
     frac(phi''_c \( v \( y \) \), l^2) hat(p) hat(p)^(*) . $ <jet:center-support-pullback>]
  Here $1 - l gt.eq c b \/ D$ and $\| phi''_c \( v \( y \) \) \| \/ l^2 lt.eq C b \/ D^2$.
  We finally compare the reference pole with $hat(x)_j$. The envelope identities give
  $ x_j = exp_(z_j) \( - t_j "grad" F_j \( z_j \) \) \, wide hat(x)_j = exp_(z_j) \( t_j "grad" G_j \( z_j \) \) . $
  They are at distance tending to zero. The pairs $\( hat(x)_j \, y_j \)$ have a uniform fixed-scale extension,
    so their cost charts and inverse exponential charts are uniformly smooth.
    Omit subscripts again and put $U = Q_tau psi$, $Z \( q \) = exp_x \( t q \)$, $M = D_q Z \( p \)$, and $R =
    nabla_q^2 Z \( p \)$. Since $G - U$ has a local minimum at $z$,
    its first derivative vanishes and its second-order form is positive semidefinite. Consequently
  $ H gt.eq H_psi := t upright("Id") + M^(*) "Hess" U \( z \) M + chevron.l "grad" U \( z \) \, R chevron.r . $
  Only the smooth support $U$ occurs on the right. Its gradient and Hessian are uniformly bounded at the fixed
    scales, and (5.16) identifies its Hessian with that of $psi$, up to $O \( tau \)$ after parallel transport.
  Write $delta = \| "grad" \( F + G \) \( z \) \|$ and identify nearby pole tangent spaces by parallel transport.
    The explicit pole formulas give $d \( x \, hat(x) \) = O \( delta \)$.
    Moreover $p = t^(- 1) log_x z$ and $hat(p) = t^(- 1) log_(hat(x))
    z$ differ by $O_(upright("fixed")) \( delta \)$, since the latter ray has a uniform fixed-scale extension.
    Thus replacing $x \, p$ by $hat(x) \, hat(p)$ in $M \, R$ changes their entries by
    $O_(upright("fixed")) \( delta \)$. Changing $t$ to $1$ then changes them by $O \( tau \)$.
    Every resulting error in $H_psi$ multiplies a bounded derivative of $U$.
  For the full endpoint map $Y \( q \) = exp_(hat(x)) q$, let $B = D Y \( hat(p) \)$.
    The identity $c \( hat(x) \, Y \( q \) \) = \| q \|^2 \/ 2$ on the chosen branch gives
  $ upright("Id") = B^(*) A_y \( r \) B - chevron.l r \, nabla_q^2 Y \( hat(p) \) chevron.r . $
  Since $"grad" psi \( y \) = r$, the preceding expansions yield
  $ H gt.eq H_psi = B^(*) { "Hess" psi \( y \) + A_y \( r \) } B + O_(upright("fixed")) \( tau + delta \) . $
  Combining this with (5.17) proves (5.14). No coordinate error multiplies the unknown Hessian of $G$. ◻
]

The true and modified endpoints occur in opposite orders along the center and outer reverse rays.
  In the center calculation, $l < 1$ makes $hat(x) = exp_y r$ a proper intermediate point on the true ray to
  $zeta = exp_y \( r \/ l \)$. At an active outer endpoint $y_i$, a slope $l_i =
  phi'_o \( v \( y_i \) \) > 1$ instead makes the true endpoint $zeta_i =
  exp_(y_i) \( r_i \/ l_i \)$ an intermediate point on the modified ray to $x = exp_(y_i) r_i$,
  where $r_i$ is its minimizing reverse log. Figure 1 displays this distinction.
  We next use it to exclude conjugacy at the full modified outer endpoint.

#figure(
  [(128,57) (0,50)(128,5)\[l\]Center modification: $l < 1$ (9,38)(1,0)110 (13,38) (72,38) (107,38) (8,40)(10,5)$y$ (67,40)(10,5)$hat(x)$ (102,40)(10,5)$zeta$ (8,31)(10,5)$0$ (67,31)(10,5)$1$ (97,31)(20,5)$1 \/ l > 1$ (0,22)(128,5)\[l\]Selected outer modification: $l_i > 1$ (9,10)(1,0)110 (13,10) (58,10) (107,10) (8,12)(10,5)$y_i$ (53,12)(10,5)$zeta_i$ (102,12)(10,5)$x$ (8,3)(10,5)$0$ (43,3)(30,5)$1 \/ l_i < 1$ (102,3)(10,5)$1$],
  caption: [Figure 1: Two independent reverse rays, shown schematically with their duration parameters. The modified center endpoint $hat(x)$ and the true outer endpoint $zeta_i$ are strictly before cut. The full endpoints $zeta$ and $x$ may still be conjugate at this stage of the argument. The two rows are not drawn to a common scale. ],
) <fig:reverse-rays>

=== 5.4 The outward endpoint and conjugacy <the-outward-endpoint-and-conjugacy>

#thm([Lemma 5.5.])[
  (Conjugacy is excluded by an active increasing modification).  #emph[Fix $b > 0$ and an active outer pair
$ g_b \( x \) + c \( x \, y \) + phi_o \( v \( y \) \) = 0 . $

 Choose any minimizing reverse log $r$ from $y$ to $x$. Suppose
$ l = phi'_o \( v \( y \) \) > 1 \, wide phi''_o \( v \( y \) \) < 0 . $

 Then the chosen modified ray is nonconjugate at its endpoint. The true log $r \/ l$ is before cut.]
] <jet:outer-conjugacy>

#proof[
  The active inequality reads $phi_o \( v \( h \) \) gt.eq - c \( x \, h \) - g_b \( x \)$.
    For $1 \/ l < s < 1$, put $xi_s = exp_y \( s r \)$ and form the smooth upper support
  $ C_s \( h \) = c \( h \, xi_s \) \/ s + c \( xi_s \, x \) \/ \( 1 - s \) . $
  It has value $c \( y \, x \)$ and gradient $- r$ at $y$. Since $phi_o$ is increasing,
    $phi_o^(- 1) \( - C_s - g_b \( x \) \)$ is a smooth lower test for $v$ with gradient $r \/ l$.
    That log is strictly before cut because it shortens a minimizing ray.
    It also gives a global contact by Theorem 6, but its before-cut property does not depend on a density equation.
  The scaled true relative Hessian of this test is
  #[#set math.equation(numbering: n => "(5.18)")
   $ W_s = l A_y \( r \/ l \) - s^(- 1) A_y \( s r \) - frac(phi''_o \( v \( y \) \), l^2) r r^(*) .
     $ <jet:outer-truncated>]
  Fix $s_0 in \( 1 \/ l \, 1 \)$. For $s gt.eq s_0$, divided-action monotonicity gives a positive definite lower
    bound for the difference of the first two terms, independent of $s$. The last term is positive semidefinite.
    If the endpoint at duration one were conjugate, the index-form characterization of conjugacy,
    equivalently Lemma 12, would force an eigenvalue of $s^(- 1) A_y \( s r \)$ to tend to $-
    oo$ as $s arrow.t 1$. Thus $det W_s arrow.r oo$, while $W_s$ retains a positive definite baseline.
    Lemma 27, at the fixed true log $r \/ l$, instead gives
  $ det W_s lt.eq l^n \( Lambda \/ lambda \) \/ sigma_y \( r \/ l \) < oo . $
  This is a contradiction. ◻
]

#thm([Lemma 5.6.])[
  (Undoing the outer modification).  #emph[At a pair as in Lemma 30, let $p =
    log_x y$ be the corresponding forward log, $B = \( d exp_x \)_p$, and let $H_o gt.eq
    0$ be a lower Taylor Hessian, with zero linear part, of $d mapsto w_o \( exp_x \( p + d \) \) + 1 / 2 \| p +
    d \|^2$. Define
#[#set math.equation(numbering: n => "(5.19)")
 $ V_o =  & H_o + B^(*) { l A_y \( r \/ l \) - A_y \( r \) } B -
   frac(phi''_o \( v \( y \) \), l^2) p p^(*) . $ <jet:outer-form>]

 Then $V_o > 0$ and
#[#set math.equation(numbering: n => "(5.20)")
 $ det V_o lt.eq l^n \( Lambda \/ lambda \) thin frac(sigma_x \( p \)^2, sigma_y \( r \/ l \)) . $ <jet:outer-det>]

 The middle term in (5.19) is positive definite. On a compact family of active pairs where $b >
   0$ is bounded away from zero, $phi'_o > 1$ and $phi''_o < 0$ hold with fixed strict margins,
   this term has a uniform positive definite baseline and the chosen exponential branches are uniformly nonsingular.]
] <jet:outer-test>

#proof[
  Lemma 30 makes the endpoint coordinate map locally invertible.
    Its smooth cost branch has endpoint Hessian $A_y \( r \)$,
    and the zero linear coefficient fixes the gradient of the induced lower test of $w_o$ to be $r$.
    Inverting $phi_o$ and using the chain rule shows that (5.19) is $l$ times the true relative lower-test
    Hessian, pulled back by $B$. Gauss’s Lemma gives the rank-one term displayed there.
  The divided-action difference between durations $1 \/ l$ and $1$ is strictly positive definite, so $V_o > 0$.
    Decrease the lower Taylor Hessian by $epsilon upright("Id")$ to obtain a genuine lower test, apply Lemma 27,
    and let $epsilon arrow.b 0$. Taking the determinant of the scaling and pullback gives (5.20).
  For the uniformity assertion, include the minimizing log among the parameters.
    The family is compact and active contact is a closed condition.
    Lemma 30 excludes a conjugate limit anywhere in that family; radial shortening excludes true cut limits.
    The smooth branch matrices and the positive divided-action difference therefore have the claimed uniform
    bounds by compactness. Multiple ordinary branches cause no difficulty:
    each specified nonconjugate minimizing branch is a smooth upper branch and has been included among the parameters. ◻
]

=== 5.5 The order of the limiting argument <the-order-of-the-limiting-argument>

We now select points at which the preceding lower tests and the original Jacobian equation can be combined.
  The following elementary fact will justify differentiation through a short-time minimizer once its endpoint is
  an Alexandrov point: neighboring endpoints need not be differentiable points of the datum.

#thm([Lemma 5.7.])[
  (Subgradients at an Alexandrov point).  #emph[If $f$ is semiconvex near $0$ and has the Alexandrov expansion
$ f \( h \) = f \( 0 \) + p dot.op h + 1 / 2 A \( h \, h \) + o \( \| h \|^2 \) \, $

 then every nearby subgradient satisfies
$ zeta = p + A h + o \( \| h \| \) \, wide zeta in partial f \( h \) \, $

 uniformly over the choice of $zeta$.]
] <jet:subgradient-differential>

#proof[
  Adding a fixed quadratic reduces the assertion to a convex function,
    and subtracting it later restores the displayed formula. In the convex case write the remainder as
    $R \( h \)$, where $\| R \( h \) \| lt.eq omega \( \| h \| \) \|
    h \|^2$ for a nondecreasing modulus $omega \( r \) arrow.r 0$.
    For $r = \| h \| > 0$, a unit vector $e$, and $0 < alpha lt.eq 1$,
    the subgradient inequalities at $h plus.minus alpha r e$ give
  $ \| \( zeta - p - A h \) dot.op e \| lt.eq 1 / 2 parallel A parallel alpha r + 5 omega \( 2 r \) r \/ alpha . $
  For small $r$, choose $alpha = sqrt(max { omega \( 2 r \) \, r^2 })$ and take the supremum over unit $e$.
    This proves the uniform assertion. ◻
]

The selection has two stages. At each fixed prefix time we first pass from nearby twice differentiable points to
  an exact maximum, where the parameter inequality holds for every active representation.
  After selecting an outer endpoint in that limit, we return to the nearby points to obtain the Hessian bound and
  the original center Jacobian. This order preserves the parameter inequality without assuming that a prescribed
  active vertex persists under perturbation.

#thm([Proposition 5.8.])[
  (The limiting matrix configuration).  #emph[Fix the center template and the constants of Lemmas 21, 22, 23,
    and 25. Choose $K$, then an outer template with curvature less than $- K$ in the prescribed capped region.
    For all sufficiently small scales in the sequence of Lemma 18,
    there are a parameter $b in \[ b_(-) \, b_(+) \]$, a pole $x$, center and active logs $p \, p_i in G_x$,
    weights $m_i > 0$ summing to one, and symmetric matrices $H \, L \, V \, V_i$ on $T_x M$,
    with the following properties. For one selected index $i$,
#[#set math.equation(numbering: n => "(5.21)")
 $ p = sum_j m_j p_j \, wide E = "span" { p_j - p } = bb(R) e \, wide \| e \| = 1 \, quad q = p dot.op e > 0 \,
   quad q^2 gt.eq c D \,\
m_i gt.eq m_(*) > 0 \, wide p_i = p + d_i e \, quad d_i > 0 \,\
L gt.eq 0 \, wide L E = 0 \, wide H lt.eq L \, wide H gt.eq V + c b / D upright("Id") - C b / D^2 p p^(*) \, wide
  V > 0 \,\
V_i gt.eq m_i L + c K b / D^2 p_i p_i^(*) \, wide V_i > 0 . $ <jet:limiting-geometry>]

 The center modified log and the selected outer modified log are nonconjugate.
   Let $r$ and $r_i$ denote the reverse logs of these specified rays, let $y = exp_x p$, $y_i = exp_x p_i$,
   and set $l = phi'_c \( v \( y \) \)$, $l_i = phi'_o \( v \( y_i \) \)$.
   The chosen true limiting branches are also nonconjugate, and
#[#set math.equation(numbering: n => "(5.22)")
 $ det V gt.eq c thin frac(sigma_x \( p \)^2, sigma_y \( r \/ l \)) \, wide det V_i lt.eq
   C thin frac(sigma_x \( p_i \)^2, sigma_(y_i) \( r_i \/ l_i \)) . $ <jet:limiting-determinants>]

 Here $c \, C \, m_(*)$ are independent of $K$ and the outer template.
   The level and norm-increment conclusions of Lemma 25 hold as well.]
] <jet:determinants>

#proof[
  #emph[Step 1: fixed scales and exact maxima.] Throughout the proof the original potential $v$, the scales,
    and both templates are fixed. Constants used only to pass limits may depend on all of them.
    Choose $t_k arrow.t 1$ and interior maxima $\( z_k^0 \, b_k \)$ supplied by Lemma 22, for
  $ F_k \( z \) = Q_(t_k) g_(b_k) \( z \) \, wide G_k \( z \) = Q_(1 - t_k) w_(c \, b_k) \( z \) . $
  The functions are $C^(1 \, 1)$ in space: Proposition 9 applies to the first, and Lemma 5 to the second.
    At an exact maximum the velocities align. If $x_k^0$ and $y_k^0$ are its two minimizers and $p_k^0 =
    t_k^(- 1) log_(x_k^0) z_k^0$, then $y_k^0 = exp_(x_k^0) p_k^0$ along the concatenated minimizing ray.
    Every finite positive active representation of $p_k^0$ satisfies the parameter inequality of Lemma 23.
    The level relations and common section bounds of Lemma 24 hold for these representations.
  #emph[Step 2: null sets are removed before Jensen sampling.] Let $N$ be the null set for the original potential
    in (5.4). For this fixed $k$, the final minimizer map $Y_k \( z \)$ is locally Lipschitz and hence
    differentiable almost everywhere #cite(label("Simon2018")) Chapter 2, Theorem 1.4.
    In each coordinate chart the locally Lipschitz area formula #cite(label("Simon2018")) Chapter 2,
    Theorem 3.3 implies that
  #[#set math.equation(numbering: n => "(5.23)")
   $ Z_k = { z : D Y_k \( z \) upright(" exists") \, med det D Y_k \( z \) eq.not 0 \, med
     Y_k \( z \) in N } $ <jet:null-preimage>]
  is a null set. Indeed the integral of $\| det D Y_k \|$ on $Y_k^(- 1) \( N \)$ is zero.
    This argument does not require us to know in advance where $D Y_k$ is nonsingular.
  Apply the semiconvex maximum Lemma #cite(label("CIL1992")) Appendix, Lemmas A.3–A.4 to $F_k + G_k$ at $z_k^0$,
    using a small fourth-order strictness penalty if needed. Its positive-measure conclusion allows us to choose a
    sequence $z_(k \, nu) arrow.r z_k^0$ off $Z_k$ and off all the null sets where $F_k \, G_k$,
    the prefix pole map, or $Y_k$ lack the derivatives used below. We have
  #[#set math.equation(numbering: n => "(5.24)")
   $ "grad" \( F_k + G_k \) \( z_(k \, nu) \) arrow.r 0 \, wide D^2 \( F_k + G_k \) \( z_(k \, nu) \) lt.eq
     eta_(k \, nu) upright("Id") \, quad eta_(k \, nu) arrow.r 0 $ <jet:Jensen-sequence>]
  in the fixed chart. At every such point choose a representation with at most $n + 1$ active logs,
    padding by zero weights only for compactness. Lemma 28 applies at each point.
    Its matrices $L_(k \, nu)$ are positive semidefinite and annihilate the active differences, exactly;
    its endpoint lower jets are $m_(i \, k \, nu) L_(k \, nu)$. The matrices $H_(k \, nu)$ satisfy (5.13).
  #emph[Step 3: take the first, fixed-prefix limits.] For each fixed $k$,
    the local $C^(1 \, 1)$ bounds are finite. After taking a subsequence in $nu$, all configuration parameters,
    weights, and the two matrices $H_(k \, nu) \, L_(k \, nu)$ converge.
    Denote the limits by $p_k \, p_(i \, k) \, m_(i \, k) \, H_k \, L_k$ and the corresponding base points.
    Discard zero limiting weights. The limiting endpoints are active at the exact maximum,
    and their weighted sum is $p_k$. In particular the #emph[universal] parameter inequality applies to this
    limiting representation; we have not asserted forward persistence of any prescribed active vertex. We retain
  #[#set math.equation(numbering: n => "(5.25)")
   $ L_k gt.eq 0 \, wide L_k E_k = 0 \, wide H_k lt.eq L_k \, quad E_k = "span" { p_(i \, k) - p_k :
     m_(i \, k) > 0 } . $ <jet:fixed-prefix-limits>]
  The quantitative proof of Lemma 29 has an error bounded by a fixed-scale constant times $1 -
    t_k + \| "grad" \( F_k + G_k \) \( z_(k \, nu) \) \|$. Passing $nu arrow.r oo$ therefore gives
  $ H_k gt.eq c b_k / D upright("Id") - C b_k / D^2 p_k p_k^(*) - C_(upright("fixed")) \( 1 - t_k \) upright("Id") . $
  Since $b_k gt.eq b_(-) > 0$, for sufficiently large $k$ this implies, after reducing $c$,
  #[#set math.equation(numbering: n => "(5.26)")
   $ H_k gt.eq c b_k / D upright("Id") - C b_k / D^2 p_k p_k^(*) . $ <jet:absorbed-semibound>]
  If $dim E_k gt.eq 2$, a nonzero vector in $E_k ∩ p_k^perp$ contradicts (5.25) and (5.26).
    If $E_k = 0$, all active logs in the representation equal $p_k$ and all endpoints equal the center.
    But $B_c lt.eq B_o$ at every level, contradicting the strict parameter inequality. Thus $E_k = bb(R) e_k$.
    Orient $e_k$ so $q_k = p_k dot.op e_k > 0$; the same two inequalities give $q_k^2 gt.eq c D$.
    Lemma 25 now supplies an index with $m_(i \, k) gt.eq m_(*)$, a strict outward displacement,
    and a bounded template value. We choose an index carrying a fixed share of the outward moment,
    as permitted by that Lemma, so its displacement has a positive lower bound at the fixed scales.
    Relabel it as index $1$.
  #emph[Step 4: fix the outer branch before bounding any center Hessian.] Pass to a subsequence in $k$ so that the
    selected configurations and their weights converge. Their centers and selected endpoints remain in the compact
    level ranges of Lemma 25. The selected limiting weight is at least $m_(*)$,
    its displacement is strictly outward, and its outer template value is below the prescribed cap.
    By imposing the template conditions under a slightly larger fixed cap,
    the limiting slope and curvature conditions have strict margins: $B'_o > 0$ and $B''_o < - K$.
    The limiting selected pair is active. Lemma 30 excludes conjugacy of its modified branch,
    using only this activity and the original contact-volume bound. Its shortened true log is before cut.
    Lemma 31 consequently supplies a neighborhood of this configuration with constants $delta > 0$ and $M <
    oo$ such that its divided-action gain is at least $delta upright("Id")$ and its determinant upper bound is at
    most $M$. These constants may depend on the fixed scales and templates.
  For every remaining $k$, return to its already chosen Jensen subsequence and choose $nu =
    nu \( k \)$ sufficiently large. We require the configuration and matrices to be within $1 \/
    k$ of their fixed-prefix limits, the selected weight to be at least $m_(*) \/ 2$,
    and the selected endpoint to lie in that neighborhood. We also require both errors in (5.24),
    including their transformed versions in (5.13), to be at most $\( 1 - t_k \)^3 \/ k$.
    All these requirements are compatible because the limit in $nu$ is taken with $k$ fixed.
    For the rest of the proof, a subscript $k$ denotes this diagonal sequence of actual Jensen points.
  #emph[Step 5: the outer test bounds the exact pole matrix.] At each diagonal point,
    Lemma 28 gives the actual lower Taylor Hessian $H_(o \, k) = m_(1 \, k) L_k gt.eq 0$ at the selected endpoint.
    Use Lemma 31 to undo the modification and call the resulting form $V_(1 \, k)$.
    The positive outer curvature term and the uniform divided-action baseline give
  #[#set math.equation(numbering: n => "(5.27)")
   $ V_(1 \, k) gt.eq m_(1 \, k) L_k + delta upright("Id") \, wide det V_(1 \, k) lt.eq M . $ <jet:bootstrap>]
  Every eigenvalue of $V_(1 \, k)$ is at least $delta$, so its largest eigenvalue is at most $M delta^(1 - n)$.
    Since $m_(1 \, k) gt.eq m_(*) \/ 2$, this bounds $L_k$ from above.
    The comparison $H_k lt.eq L_k + o \( 1 \) upright("Id")$ and Lemma 29 now bound $H_k$ from both sides.
    There has still been no use of a center density equation.
  The center extension gives uniformly nonsingular fixed-scale prefix-log coordinate maps,
    as in the proof of Lemma 29. Their derivatives and second derivatives are bounded;
    the gradients of $G_k$ are bounded by the Lipschitz bound of the datum.
    Thus the coordinate change in (5.11) converts the bound on $H_k$ into
  #[#set math.equation(numbering: n => "(5.28)")
   $ parallel "Hess" G_k \( z_k \) parallel lt.eq C_(upright("fixed")) . $ <jet:G-bound>]
  #emph[Step 6: the chosen centers are good original endpoints.] Write $tau_k = 1 - t_k$, $y_k = Y_k \( z_k \)$,
    and $K_k \( z \, y \) = c \( z \, y \) \/ tau_k$. The envelope identity $"grad"
    G_k = \( K_k \)_z \( z \, Y_k \( z \) \)$ and differentiability of $Y_k$ give
  $ "Hess" G_k = \( K_k \)_(z z) + \( K_k \)_(z y) D Y_k . $
  In parallel orthonormal frames, the distance between $z_k$ and $y_k$ is $O \( tau_k \)$,
    and the smooth short-cost expansions are
  $ \( K_k \)_(z z) = tau_k^(- 1) upright("Id") + O \( tau_k \) \, quad \( K_k \)_(y y) =
    tau_k^(- 1) upright("Id") + O \( tau_k \) \, quad \( K_k \)_(z y) = - tau_k^(- 1) Pi + O \( tau_k \) \, $
  where $Pi$ is the appropriate parallel isometry. Solving the preceding identity, using (5.28), gives
  #[#set math.equation(numbering: n => "(5.29)")
   $ D Y_k = Pi^(- 1) { upright("Id") - tau_k "Hess" G_k } + O \( tau_k^2 \) . $ <jet:Y-identity>]
  It is nonsingular for large $k$. The Jensen points were chosen off the set (5.23); hence $y_k in.not N$.
    This is the promised justification for using the original Alexandrov and Jacobian statements at the centers.
  In the following formulas the scalar modifications are evaluated with $b = b_k$.
    At these points $w_c = phi_c compose v$ has an Alexandrov Hessian.
    The minimizing property supplies a proximal subgradient
  $ xi \( z \) = - \( K_k \)_y \( z \, Y_k \( z \) \) in partial w_c \( Y_k \( z \) \) $
  at every nearby point, even if $w_c$ is not differentiable there.
    Apply Lemma 32 at the Alexandrov point $y_k = Y_k \( z_k \)$.
    Since $Y_k$ is Lipschitz and differentiable at $z_k$, it gives, in normal coordinates at $z_k$ and $y_k$,
  $ xi \( z_k + h \) = "grad" w_c \( y_k \) + "Hess" w_c \( y_k \) D Y_k \( z_k \) h + o \( \| h \| \) . $
  Expanding the smooth function $\( K_k \)_y$ in its two variables therefore gives
  $ { "Hess" w_c \( y_k \) + \( K_k \)_(y y) } D Y_k + \( K_k \)_(y z) = 0 . $
  Thus stationary differentiation uses the subgradient expansion even when neighboring endpoints are nonsmooth.
    Solving it with (5.29) gives, in parallel frames,
  #[#set math.equation(numbering: n => "(5.30)")
   $ "Hess" w_c \( y_k \) = "Hess" G_k \( z_k \) + O \( tau_k \) . $ <jet:undo-short>]
  In particular these endpoint Hessians are uniformly bounded.
    The error statement follows directly from the displayed short-cost expansions and the bounded inverse in
    (5.29); it does not assume a bound for $"Hess" w_c$ in advance.
  #emph[Step 7: insert the true center form and take matrix limits.] Set
  $ r_k = tau_k^(- 1) log_(y_k) z_k \, quad l_k = phi'_c \( v \( y_k \) \) \, quad hat(x)_k = exp_(y_k) r_k \,
    quad hat(p)_k = log_(hat(x)_k) y_k . $
  The true center endpoint is $zeta_k = exp_(y_k) \( r_k \/ l_k \)$, and it is before cut because $y_k in.not N$.
    Identify $T_(x_k) M$ with $T_(hat(x)_k) M$ by parallel transport over their short joining segment,
    and let $B_k : T_(x_k) M arrow.r T_(y_k) M$ be the exponential differential at $hat(p)_k$ after that
    identification. Define
  #[#set math.equation(numbering: n => "(5.31)")
   $ V_k = l_k B_k^(*) { "Hess" v \( y_k \) + A_(y_k) \( r_k \/ l_k \) } B_k > 0 . $ <jet:V-sequence>]
  The exact chain rule for the scalar modification gives
  #[#set math.equation(numbering: n => "(5.32)")
   $ B_k^(*) { "Hess" w_c \( y_k \) + A_(y_k) \( r_k \) } B_k =  & V_k + B_k^(*) { A_(y_k) \( r_k \) -
     l_k A_(y_k) \( r_k \/ l_k \) } B_k\
 & + frac(phi''_c \( v \( y_k \) \), l_k^2) hat(p)_k hat(p)_k^(*) . $ <jet:center-exact>]
  All vectors on the last line are understood after the same isometric identification.
    Lemma 14 bounds the middle term below by $c \( 1 - l_k \) upright("Id")$.
    Equation (5.30) and the vanishing pole mismatch show that the left side differs from $H_k$ by $o \( 1 \)
    upright("Id")$. The verification is the same smooth coordinate comparison as in Lemma 29,
    now using the bounded unregularized Hessians in place of the smooth support Hessians. This proves
  $ H_k gt.eq V_k + c b_k / D upright("Id") - C b_k / D^2 p_k p_k^(*) - o \( 1 \) upright("Id") . $
  It also bounds $V_k$ from above, because $V_k > 0$ and $H_k$ is bounded.
  Taking the determinant in (5.31) and using (5.4) gives the exact factorization
  #[#set math.equation(numbering: n => "(5.33)")
   $ det V_k =
     l_k^n sigma_(hat(x)_k) \( hat(p)_k \)^2
     frac(\| det D \( exp_dot.op "grad" v \) \( y_k \) \|, sigma_(y_k) \( r_k \/ l_k \)) gt.eq
     c thin frac(sigma_(hat(x)_k) \( hat(p)_k \)^2, sigma_(y_k) \( r_k \/ l_k \)) . $ <jet:V-jacobian>]
  The squared factor is the determinant of the Hessian pullback.
    All scalar derivatives lie between $1 \/ 2$ and $2$, so the constants in this density inequality are
    independent of $K$.
  There is no assertion that the limiting endpoint is an Alexandrov point of $v$.
    We take limits of matrices at the good endpoints just selected.
    The center modified rays have a uniform extension at the fixed scales:
    $1 - l_k gt.eq c b_(-) \/ D > 0$, and the ray through $hat(x)_k$ continues to the true endpoint through
    duration $1 \/ l_k$. Compactness of this family of proper minimizing subsegments therefore gives
  $ sigma_(hat(x)_k) \( hat(p)_k \) gt.eq c_(upright("fixed")) > 0 . $
  Since $0 < V_k lt.eq C_(upright("fixed")) upright("Id")$, equation (5.33) now implies
  $ sigma_(y_k) \( r_k \/ l_k \) gt.eq frac(c thin sigma_(hat(x)_k) \( hat(p)_k \)^2, det V_k) gt.eq
    c'_(upright("fixed")) > 0 . $
  Continuity of the exponential differential excludes a conjugate limit of the true center rays.
    An ordinary cut limit may remain; the specified nonsingular branch suffices.
  Finally take a subsequence so that $b_k \, H_k \, L_k \, V_k \,
    V_(1 \, k)$ and all configuration parameters converge, in a smooth orthonormal trivialization.
    Discard any additional zero limiting weights. The selected weight remains at least $m_(*)$,
    and its outward displacement retains the positive fixed-scale lower bound from Step 3.
    The barycenter identity then gives another surviving vertex,
    so the surviving difference span is still the same nonzero line.
    The selected modified and true outer branches were already uniformly nonsingular in Step 4;
    the center modified branch has its fixed-scale extension.
    Equation (5.33) gives a positive lower determinant in the limit, so $V > 0$.
    Equations (5.6), (5.13), and (5.32) give (5.21).
  At each selected outer endpoint in the diagonal sequence, formula (5.19), with $H_(o \, k) = m_(1 \, k) L_k$,
    has a positive divided-action term. Its scalar curvature coefficient satisfies
  $ - frac(phi''_o \( v \( y_(1 \, k) \) \), l_(1 \, k)^2) = -
    frac(b_k B''_o \( \( v \( y_(1 \, k) \) - a \) \/ D \), D^2 l_(1 \, k)^2) gt.eq c K b_k \/ D^2 . $
  Passing this inequality and (5.20) along $V_(1 \, k) arrow.r
    V_i$ gives (5.21) and the other inequality in (5.22). No lower Taylor jet is asserted at the limiting
    endpoint. The weights, directions, and section-level estimates pass through the same chosen subsequence and
    give (5.21)–(5.21). Their constants and the cap were fixed before $K$.
    Only $delta \, M$, the rate of the prefix limit, and the Jensen radii depended on the fixed outer template. ◻
]

=== 5.6 The determinant gain <the-determinant-gain>

#thm([Lemma 5.9.])[
  (Oblique projection and the missing direction).  #emph[Suppose the matrices and vectors satisfy (5.21)–(5.21). Then
#[#set math.equation(numbering: n => "(5.34)")
 $ det V_i gt.eq c K det V \, $ <jet:matrix-gain>]

 where $c > 0$ depends on the fixed center-template constants, the dimension, and $m_(*)$, and is independent of $K$.]
] <jet:matrix>

#proof[
  Put $beta = C b \/ D^2$, increasing $C$ if necessary, and $gamma = c K b \/ D^2$. Define
  $ P = upright("Id") - e p^(*) \/ q . $
  This is the projection onto $p^perp$ along $e$. Since $L E = 0$, $P^(*) L P = L$.
    On $p^perp$ the center inequality gives $H gt.eq V$, and $L gt.eq H$. Thus
  #[#set math.equation(numbering: n => "(5.35)")
   $ V_i gt.eq m_i P^(*) V P + gamma p_i p_i^(*) . $ <jet:projected-matrix>]
  Also $H \( e \, e \) lt.eq L \( e \, e \) = 0$ implies $V \( e \, e \) lt.eq beta q^2$.
  Let $Q$ have orthonormal columns spanning $p^perp$, and use the nonsingular basis matrix $\[ Q \, e \]$.
    In this basis write
  $ \[ Q \, e \]^(*) V \[ Q \, e \] = mat(delim: "(", A, z; z^(*), h) \, wide S = h - z^(*) A^(- 1) z > 0 . $
  Then $S lt.eq h = V \( e \, e \) lt.eq beta q^2$. The determinant of the right side of (5.35),
    in the same basis, is $m_i^(n - 1) det A thin gamma \( p_i dot.op e \)^2$.
    Taking the ratio cancels the determinant of the nonorthogonal change of basis and gives
  $ frac(det V_i, det V) gt.eq m_i^(n - 1) frac(gamma \( p_i dot.op e \)^2, S) gt.eq m_i^(n - 1) gamma /
    beta frac(\( p_i dot.op e \)^2, q^2) . $
  Since $p_i = p + d_i e$ with $d_i > 0$ and $q > 0$, we have $p_i dot.op e gt.eq q$.
    Now use $m_i gt.eq m_(*)$ and $gamma \/ beta gt.eq c K$. ◻
]

#thm([Proposition 5.10.])[
  (Contradiction to a non-power oscillation).  #emph[The section-oscillation function of Lemma 18 has a positive
    power upper bound at zero.]
] <jet:contradiction>

#proof[
  Suppose otherwise, and take the sequence of scales supplied by that Lemma.
    Fix all center and weight constants, then choose $K$ and its outer template,
    and then take sufficiently small scales to apply Proposition 33. Lemma 34 and (5.22) imply
  $ c K thin frac(sigma_x \( p \)^2, sigma_y \( r \/ l \)) lt.eq det V_i lt.eq
    C thin frac(sigma_x \( p_i \)^2, sigma_(y_i) \( r_i \/ l_i \)) . $
  The radial comparison of Corollary 13 gives
  $ sigma_y \( r \/ l \) lt.eq C sigma_x \( p \) \, wide sigma_(y_i) \( r_i \/ l_i \) gt.eq c sigma_x \( p_i \) . $
  For the selected outward endpoint, (5.21)–(5.21) give $m_i gt.eq m_(*)$ and $q^2 gt.eq c D$.
    Its norm increment satisfies $\| p_i \|^2 - \| p \|^2 lt.eq 3 D$ by Lemma 25.
    Corollary 16 therefore applies with $mu = m_(*)$, $kappa = c$, and $L_0 = 3$, and gives $sigma_x \( p \) gt.eq
    c' sigma_x \( p_i \)$. These parameters were fixed before $K$. Hence
  $ c K sigma_x \( p \) lt.eq C sigma_x \( p_i \) lt.eq C' sigma_x \( p \) . $
  The center modified branch is nonconjugate, so $sigma_x \( p \) > 0$.
    This bounds $K$ by a constant fixed before it was chosen. Choosing $K$ larger gives a contradiction. ◻
]

== 6 Completion of the uniform estimate <sec:conclusion>

Proposition 35 was applied to the section-oscillation supremum over the entire class of densities with the fixed
  bounds $lambda \, Lambda$ on $\( M \, g \)$. It therefore gives constants $C_0 < oo$, $beta > 0$, and $r_0 > 0$,
  common to that class, such that

$ F \( r \) lt.eq C_0 r^beta wide \( 0 < r < r_0 \) . $

Lemma 17 now gives a common Hölder estimate with $alpha = 1 / 2 min { beta \, 1 }$.
  In particular, every pole has a single contact endpoint. Applying the same estimate to the reversed density pair
  gives singleton contacts on the other side, with the same constants.
  The two contact maps are continuous inverses and agree almost everywhere with the optimal maps.
  Enlarging the Hölder constant to cover distances outside the small-scale range proves Theorem 1.

#prodef([Remark 6.1.])[
  The proof produces a positive exponent by contradiction and compactness.
    It gives no explicit exponent or estimate uniform over varying metrics or density bounds.
    The inverse map comes from applying the result to the reversed positive-density pair;
    no time-one injectivity is asserted for an arbitrary cost potential.
]

#bibliography("refs.bib", style: "ieee", title: [References])
