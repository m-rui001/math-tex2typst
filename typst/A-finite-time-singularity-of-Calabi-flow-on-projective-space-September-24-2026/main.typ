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

#align(center)[#text(size: 16pt, weight: "bold")[A finite-time singularity of Calabi flow \
on projective space]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $omega_0$ be a smooth Kähler form on a compact complex manifold $M$.
  We use the scalar-curvature convention $S \( omega \) = "tr"_omega "Ric" \( omega \)$. The Calabi flow is

#[#set math.equation(numbering: n => "(1.1)")
 $ omega \( t \) = omega_0 + i partial macron(partial) phi.alt \( t \) > 0 \, wide phi.alt \( 0 \) = 0 \, wide
   partial_t phi.alt = S \( omega \( t \) \) - macron(S) \, $ <eq:calabi-flow>]

where $macron(S)$ is the average scalar curvature, determined by the Kähler class.
  Calabi introduced this flow to seek canonical metrics within a Kähler class #cite(label("Calabi1982")).
  Chen’s smooth long-time existence conjecture asserts that the flow exists for all positive times from arbitrary
  smooth Kähler initial data; see #cite(label("HeZeng2021")) Conjecture 1.1.
  We give a counterexample on projective space. Write $omega_(upright("FS"))$ for the Fubini–Study form whose
  potential on the standard affine chart is $log \( 1 + \| Z \|^2 \)$.

#thm([Theorem 1.1.])[
  #emph[There is a smooth $U \( 10 \)$-invariant Kähler form $omega_0$ on $bb(C P)^10$,
    in the class $\[ omega_(upright("FS")) \]$, whose maximal smooth Calabi flow has existence interval
    $\[ 0 \, T_(*) \)$ with $0 < T_(*) < oo$. There are a point $p in bb(C P)^10$ and a constant $a > 0$ such that
$ S \( omega \( t \) \) \( p \) tilde.op a \( T_(*) - t \)^(- 1 \/ 2) wide upright("as ") t arrow.t T_(*) . $

]
] <thm:main>

The Fubini–Study metric has constant scalar curvature. Thus the example also answers negatively the smooth
  global-existence question for classes containing a constant-scalar-curvature Kähler metric,
  emphasized by Chen and Cheng #cite(label("ChenCheng2021")) p. 912, following Conjecture 1.3.
  In particular, no assertion of smooth global existence and subsequent smooth convergence modulo holomorphic
  automorphisms can hold for arbitrary smooth initial metrics in such a class:
  the obstruction already occurs at a finite time.

The same singularity persists on products with a stationary factor.

#thm([Corollary 1.2.])[
  (Products with stationary factors).  #emph[Let $omega \( t \)$, $T_(*)$, $p$, and $a$ be as in Theorem 1,
    and let $\( Y \, eta \)$ be a compact connected Kähler manifold with $eta$ of constant scalar curvature.
    With $pi_X$ and $pi_Y$ the projections from $bb(C P)^10 times Y$,
    the maximal smooth Calabi flow from $Omega_0 = pi_X^(*) omega_0 + pi_Y^(*) eta$ is
$ Omega \( t \) = pi_X^(*) omega \( t \) + pi_Y^(*) eta \, wide 0 lt.eq t < T_(*) . $

 For every $y in Y$, $S \( Omega \( t \) \) \( p \, y \) tilde.op a \( T_(*) - t \)^(- 1 \/ 2)$.
   In particular, finite-time smooth Calabi-flow singularities occur in every complex dimension $n gt.eq 10$,
   on $bb(C P)^10 times bb(C P)^(n - 10)$, in a class containing a Kähler–Einstein metric.]
] <cor:product-singularities>

The corollary is proved after Theorem 1 in Section 6.

=== 1.1 Background and significance <background-and-significance>

On compact Riemann surfaces, Chruściel proved global forward existence and convergence to a constant-curvature
  metric #cite(label("Chrusciel1991")) Theorem 2.1. Chen gave a different proof using decreasing functionals and
  concentration compactness #cite(label("Chen2001")), and Struwe developed a unified treatment of Calabi and
  normalized Ricci flows on closed surfaces #cite(label("Struwe2002")).
  In higher dimensions, Chen and He proved local existence and uniqueness and established stability near a
  constant-scalar-curvature metric #cite(label("ChenHe2008")) Theorems 1.2 and 3.2.
  He and Zeng developed short-time theory for rougher initial metrics #cite(label("HeZeng2021")).
  These higher-dimensional results concern either short times or restricted initial data.

Curvature estimates give continuation criteria for the smooth flow.
  Chen and He proved extension under a uniform Ricci-curvature bound #cite(label("ChenHe2008")) Corollary 5.3,
  and Chen and Cheng established extension under a uniform scalar-curvature bound #cite(label("ChenCheng2021"))
  Theorem 1.8. Li, Zhang and Zheng state that a uniform spatial $L^p$ scalar-curvature bound,
  measured with respect to the evolving metric, suffices when $p > dim_(bb(C))
  M$ #cite(label("LiZhangZheng2024")) Theorem 1.2; Li and Zhang state a further criterion involving spacetime
  scalar and scalar-Laplacian integrability #cite(label("LiZhang2025")) Theorem 1.1.

On a compact almost homogeneous manifold with two hypersurface ends,
  Guan proved exponential smooth convergence of the modified Calabi flow for initial metrics invariant under a
  maximal compact subgroup of the automorphism group #cite(label("Guan2007")) Theorem A.
  The two special orbits of the action used here are instead a point and the hyperplane at infinity.
  The point has complex codimension ten, so the two-hypersurface hypothesis fails.

Streets constructed global weak Calabi flows by minimizing movements #cite(label("Streets2014")).
  Berman, Darvas and Lu identify these flows with trajectories in a space of finite-energy Kähler potentials and
  show that, when the class contains a constant-scalar-curvature metric,
  every weak trajectory converges to a smooth constant-scalar-curvature potential in the $d_1$ distance,
  the extension of the $L^1$ path-length distance on smooth Kähler potentials #cite(label("BermanDarvasLu2017"))
  Section 6 and Theorem 1.11. The weak and classical flows agree for as long as the latter exists
  smoothly #cite(label("BermanDarvasLu2017")) Proposition 6.1.
  Neither this weak continuation nor the large-time $d_1$ convergence implies smooth continuation through every
  finite time.

=== 1.2 Structure of the construction <structure-of-the-construction>

The construction first reduces the flow to a scalar equation,
  then builds an exact shrinking solution of its flat limit,
  and finally corrects that solution on the compact manifold.
  The geometric starting point is the radial ansatz of Calabi #cite(label("Calabi1979")) and the momentum
  formulation of Hwang and Singer #cite(label("HwangSinger2002")).
  Abreu’s toric scalar-curvature formula #cite(label("Abreu1998")) is expressed in Guillemin’s
  symplectic-potential framework #cite(label("Guillemin1994")).
  For a radial potential $Phi \( ell \)$, where $ell = log \| Z \|^2$, set $x = Phi' \( ell \)$ and $v =
  Phi'' \( ell \)$. We use $x in \( 0 \, 1 \)$ as the momentum coordinate and write

$ v = x \( 1 - x \) + x^2 \( 1 - x \)^2 H . $

Smoothness and positivity at both special orbits are encoded by $H in C^oo \[ 0 \, 1 \]$ and $1 +
  x \( 1 - x \) H > 0$. Section 2 derives the scalar fourth-order equation for $H$,
  including the affine choice in the Legendre potential needed to recover the Calabi flow with its prescribed
  normalization. It also realizes the fixed spatial operator on an auxiliary sphere,
  where the endpoint conditions become ordinary smooth invariance.

The singularity is detected by one value of $H$. At the fixed affine origin $p$, the scalar-curvature identity is

$ S \( t \, p \) = 110 #scale(x: 120%, y: 120%)[\(] 1 - H \( t \, 0 \) #scale(x: 120%, y: 120%)[\)] . $

We construct a smooth positive profile $G$, bounded above and away from zero, with $G \( 0 \) =
  1$ and $G' \( 0 \) < 0$, and set

$ F \( t \, x \) = rho^(- 1) h \( x \/ rho \) \, wide h \( y \) = frac(G \( y \) - 1, y) \, wide rho =
  sqrt(- t) \, quad t < 0 . $

Then $F \( t \, 0 \) = rho^(- 1) G' \( 0 \)$. Our task is to find an exact compact solution $H = F +
  V$ for which positivity persists and

$ V \( t \, 0 \) = O \( rho^(- 1 + delta) \) wide upright("for some ") delta > 0 . $

The correction is therefore smaller than the leading term at the origin,
  preserving the desired scalar-curvature divergence. A smooth interior time slice of this solution will be the
  initial metric; no initial metric needs to be fixed before the construction.

Section 3 constructs $G$ so that $F$ solves the scale-invariant flat equation exactly.
  The profile is obtained by matching a two-parameter analytic solution at the origin to a half-line solution
  approaching a positive constant. A finite exact-arithmetic calculation,
  with analytic enclosure and nonlinear error bounds, certifies the matching inequalities.
  This uses the framework of validated Taylor integration surveyed in #cite(label("NedialkovJacksonCorliss1999")).
  The finite argument and its complete executable certificate appear in the appendices.
  The resulting profile also has a differentiable expansion at infinity;
  this expansion controls the compact error away from the shrinking core.

The correction begins with a right inverse for the flat linearized equation.
  Section 4 introduces the weighted norms and local estimates,
  and Section 5 constructs this inverse on all negative times.
  In similarity variables its time-one evolution is a compact perturbation of a damped constant-coefficient
  evolution. A spectral split determines finitely many components from future forcing.
  This choice is available because the initial metric is still free;
  it requires no stability or nondegeneracy theorem for the profile.
  The compact-perturbation and spectral-projection tools are classical #cite(label("Kato1995")).
  After selecting a spectral weight, an outer annulus estimate upgrades the temporal supremum bound to the full
  spatially weighted parabolic Hölder estimate. The decisive input there is a scale-invariant $L^2$ bound that is
  integrable up to the singular time.

Section 6 combines this ancient inverse near the core with a short-time forward solution outside it.
  The outer forcing cancels the inner cutoff commutator exactly; the remaining operator errors are small.
  For the nonlinear correction one further needs the compact residual to become small after applying the inverse.
  This holds in a norm controlling all four spatial derivatives and their temporal Hölder seminorms,
  with the time derivative omitted. The outer estimate uses a strictly higher Hölder exponent for the source,
  and the fixed-point equation then supplies the missing time derivative.
  Positivity and the pointwise correction bound above give the geometric hypotheses needed to finish Theorem 1.

== 2 The geometric reduction and the finite-time obstruction <geo:section>

We use scalar curvature in the convention $S \( omega \) = "tr"_omega "Ric" \( omega \)$.
  Let $omega_(*)$ be the Fubini–Study form on $bb(C P)^n$ with affine potential $log \( 1 + \| Z \|^2 \)$.
  The geometric identities below hold for every $n gt.eq 1$; the construction will use $n = 10$.
  The radial and momentum descriptions follow the framework of Calabi #cite(label("Calabi1979")) and
  Hwang–Singer #cite(label("HwangSinger2002")); the Legendre-coordinate viewpoint is also central to the toric
  formulas of Guillemin and Abreu #cite(label("Guillemin1994")) #cite(label("Abreu1998")).
  We give the identities directly to fix the scalar convention and to verify smoothness at the point orbit as well
  as at the divisor. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ q = \| Z \|^2 \, wide ell = log q \, wide v_(*) \( x \) = x \( 1 - x \) \, wide w \( x \) =
   x^(n - 1) . $ <geo:reference>]

For a radial potential $Phi \( ell \)$, its momentum coordinate and momentum profile are

$ x = Phi' \( ell \) \, wide v \( x \) = Phi'' \( ell \) . $

The Legendre transform $u \( x \) = x ell - Phi \( ell \)$ satisfies $u' = ell$ and $u'' = 1 \/ v$.
  The reference transform is

$ u_(*) \( x \) = x log x + \( 1 - x \) log \( 1 - x \) \, wide u''_(*) = v_(*)^(- 1) . $

Primes on functions of $x$ will denote differentiation in $x$.

#thm([Proposition 2.1.])[
  (Exact fixed-class reduction).  #emph[Let $I$ be an open time interval,
    and let $H in C^oo \( I times \[ 0 \, 1 \] \)$ satisfy
#[#set math.equation(numbering: n => "(2.2)")
 $ b \( t \, x \) := 1 + v_(*) \( x \) H \( t \, x \) > 0 . $ <geo:positivity>]

 Define
#[#set math.equation(numbering: n => "(2.3)")
 $ v = v_(*) + v_(*)^2 H = v_(*) b \, wide K \( H \) = w^(- 1) \( w v_(*)^2 H \)'' \, wide cal(A) H =
   #scale(x: 120%, y: 120%)[\[] w^(- 1) \( w v_(*)^2 H \)'' #scale(x: 120%, y: 120%)[\]]'' . $ <geo:momentum>]

 At each time these data, together with an affine choice in the Legendre potential,
   determine a smooth $U \( n \)$-invariant Kähler form in $\[ omega_(*) \]$.
   Its scalar curvature and average scalar curvature are
#[#set math.equation(numbering: n => "(2.4)")
 $ S \( t \, x \) = n \( n + 1 \) - K \( H \) \( t \, x \) \, wide macron(S) = n \( n + 1 \) . $ <geo:scalar>]

 If, in addition,
#[#set math.equation(numbering: n => "(2.5)")
 $ H_t + \( 1 + v_(*) H \)^2 cal(A) H = 0 \, $ <geo:equation>]

 then for any $t_0 in I$ and any initial affine choice there is a smooth family of these forms satisfying the
   Calabi flow exactly. More precisely, its global potential relative to $omega \( t_0 \)$ satisfies
#[#set math.equation(numbering: n => "(2.6)")
 $ phi.alt \( t_0 \) = 0 \, wide omega \( t \) = omega \( t_0 \) + i partial macron(partial) phi.alt \( t \) \,
   wide phi.alt_t = S \( omega \( t \) \) - macron(S) . $ <geo:potential-flow>]

]
] <geo:reduction>

#proof[
  We first verify smoothness and positivity at both endpoints. Suppress time for this part of the argument. Since
  #[#set math.equation(numbering: n => "(2.7)")
   $ 1 / v - 1 / v_(*) = - frac(H, 1 + v_(*) H) \, $ <geo:smooth-legendre>]
  we can choose $psi in C^oo \[ 0 \, 1 \]$ with second derivative equal to the right-hand side, and put $u =
    u_(*) + psi$. The two integration constants are precisely its free affine part. Write $a = psi'$.
    The function $u'$ is strictly increasing from $- oo$ to $+ oo$,
    so it has a smooth inverse on the open interval. In terms of $q = exp ell$, the inverse relation is
  #[#set math.equation(numbering: n => "(2.8)")
   $ q = frac(x, 1 - x) exp a \( x \) . $ <geo:center-inverse>]
  At $x = 0$ its right-hand side vanishes and has derivative $exp a \( 0 \) > 0$.
    The inverse therefore extends smoothly to $q = 0$, with
  $ x \( q \) = exp \( - a \( 0 \) \) q + O \( q^2 \) . $
  Here and below a smooth remainder is meant: for example the last error is $q^2$ times a smooth function of $q$.
    Since $upright(d) Phi \/ upright(d) q = x \( q \) \/ q$, integration shows that the Legendre dual extends
    smoothly as a function of $q$, with expansion
  #[#set math.equation(numbering: n => "(2.9)")
   $ Phi \( log q \) = C_0 + exp \( - a \( 0 \) \) q + O \( q^2 \) . $ <geo:center-expansion>]
  Division by $q$ here preserves smoothness because $x \( 0 \) = 0$, as is also clear from $x \( q \) \/ q =
    integral_0^1 x' \( s q \) thin upright(d) s$. Its complex Hessian at $Z =
    0$ is $exp \( - a \( 0 \) \)$ times the Euclidean Hermitian form, and is positive.
  At the other endpoint set $eta = q^(- 1)$ and $b_1 = 1 - x$. The same inverse relation becomes
  $ eta = frac(b_1, 1 - b_1) exp #scale(x: 120%, y: 120%)[\(] - a \( 1 - b_1 \) #scale(x: 120%, y: 120%)[\)] \,
    wide b_1 \( eta \) = exp a \( 1 \) eta + O \( eta^2 \) . $
  If $Psi \( eta \) = Phi \( log q \) - log q$, then $Psi' \( eta \) = b_1 \( eta \) \/ eta$. Consequently
  #[#set math.equation(numbering: n => "(2.10)")
   $ Psi \( eta \) = C_1 + exp a \( 1 \) eta + O \( eta^2 \) $ <geo:infinity-expansion>]
  is smooth at $eta = 0$. This expansion gives smoothness on the projective manifold,
    not merely along radial rays. Indeed, on the projective chart meeting the divisor at infinity given by
  $ W_0 = 1 \/ Z_j \, wide W_i = Z_i \/ Z_j quad \( i eq.not j \) \, wide B = 1 + sum_(i eq.not j) \| W_i \|^2 \, $
  we have $q = B \/ \| W_0 \|^2$. After removing the pluriharmonic term $- log \| W_0 \|^2$ from $Phi$,
    a local potential is
  #[#set math.equation(numbering: n => "(2.11)")
   $ log B + Psi #h(-0.16667em) (frac(\| W_0 \|^2, B)) . $ <geo:divisor-potential>]
  On $W_0 = 0$ its tangential complex Hessian is the Fubini–Study metric of the divisor,
    its normal coefficient is $exp a \( 1 \) \/ B > 0$, and its mixed coefficients vanish.
    This proves positivity there; for $n = 1$ only the normal coefficient is present.
    On $0 < x < 1$, direct differentiation gives the tangential and radial eigenvalues $x \/ q$ and $v \/ q$,
    respectively, so positivity holds everywhere.
  The difference $Phi \( log \| Z \|^2 \) - log \( 1 + \| Z \|^2 \)$ is a globally smooth function.
    At the origin this follows from (2.9); in the chart at infinity it equals $Psi \( eta \) - log \( 1 + eta \)$,
    which is smooth by (2.10). Thus its complex Hessian is a global exact form and the Kähler class is
    $\[ omega_(*) \]$. All inversions and integrations above depend smoothly on time on compact subintervals of
    $I$, by the positive endpoint derivatives and the inverse function theorem with parameters.
  We next compute scalar curvature. The eigenvalues already found give
  $ det \( g_(i macron(j)) \) = q^(- n) x^(n - 1) v = q^(- n) w v . $
  For any radial function $f$, the complex Laplacian is
  #[#set math.equation(numbering: n => "(2.12)")
   $ Delta_omega f = f_(ell ell) / v + frac(n - 1, x) f_ell = w^(- 1) partial_x \( w f_ell \) \,
     $ <geo:complex-laplacian>]
  where $partial_ell = v partial_x$ in the last expression. For $f = - log det g$, this yields
  $ f_ell = n - frac(\( w v \)', w) \, wide S = frac(n \( n - 1 \), x) - w^(- 1) \( w v \)'' . $
  Substituting $v = v_(*) + v_(*)^2 H$ gives (2.4). The expression $K \( H \)$ is smooth at zero:
    $w v_(*)^2 H = x^(n + 1) \( 1 - x \)^2 H$, whose second derivative is divisible by $x^(n - 1)$ as a smooth
    function. It is also smooth at one.
  For completeness, the average can be read directly from this formula.
    The radial volume density is a constant multiple of $w \( x \) thin upright(d) x$:
    the Euclidean polar factor $q^(n - 1) upright(d) q$, multiplied by the determinant,
    becomes $w v thin upright(d) ell = w thin upright(d) x$. Moreover,
  $ integral_0^1 K \( H \) w thin upright(d) x = #scale(x: 120%, y: 120%)[\[] \( w v_(*)^2 H \)'
    #scale(x: 120%, y: 120%)[\]]_(x = 0)^(x = 1) = 0 \, $
  because $w v_(*)^2 H$ vanishes to order at least two at both endpoints.
    This proves the asserted average, including when $n = 1$.
  Finally, fix $t_0 in I$, choose $u \( t_0 \)$ as above, and define at fixed momentum coordinate
  #[#set math.equation(numbering: n => "(2.13)")
   $ u \( t \, x \) = u \( t_0 \, x \) + integral_(t_0)^t K \( H \) \( s \, x \) thin upright(d) s .
     $ <geo:legendre-flow>]
  Equation (2.5) implies
  $ partial_t \( 1 \/ v \) = - frac(v_(*)^2 H_t, v^2) = cal(A) H = partial_x^2 K \( H \) = partial_t u'' . $
  Their initial values agree, so $u'' = 1 \/ v$ for all time.
    In particular the preceding metric construction applies throughout $I$.
    Differentiating the Legendre dual $Phi \( t \, ell \) = x \( t \, ell \) ell -
    u \( t \, x \( t \, ell \) \)$ at fixed $ell$ cancels the terms containing $x_t$, and gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ Phi_t = - u_t = - K \( H \) = S - macron(S) . $ <geo:legendre-sign>]
  The difference between $Phi \( t \)$ and $Phi \( t_0 \)$ is globally smooth by the endpoint argument and
    therefore supplies $phi.alt$ in (2.6).
  This also specifies the affine part of $u$ during evolution.
    Replacing a fixed $u$ by $u + alpha x + beta$ changes its dual to $Phi \( ell - alpha \) - beta$,
    corresponding to the projective dilation $Z mapsto exp \( - alpha \/ 2 \) Z$ and a potential constant.
    An arbitrary time-dependent choice of these terms would affect (2.14);
    the prescription (2.13) fixes them and establishes that equation without an additional affine term. ◻
]

=== 2.1 A regular auxiliary sphere and its flat limit <a-regular-auxiliary-sphere-and-its-flat-limit>

The endpoints of the momentum interval can be handled by a smooth equation on a closed auxiliary manifold. Set

#[#set math.equation(numbering: n => "(2.15)")
 $ m = 2 n + 4 \, wide Sigma = S^(m + 5) subset bb(R)^m times bb(R)^6 \, wide x = \| z \|^2 . $ <geo:sphere>]

We identify functions of $x$ with $O \( m \) times O \( 6 \)$-invariant functions on $Sigma$.

#thm([Lemma 2.2.])[
  (The compact and flat operators).  #emph[This identification is a bijection between $C^oo \[ 0 \, 1 \]$ and the
    smooth invariant functions on $Sigma$. The pushforward of spherical volume under $x$ is a positive constant
    multiple of $w v_(*)^2 thin upright(d) x$. With the nonpositive Laplacian convention, put $L = 1 /
    4 Delta_Sigma$. On invariant functions,
#[#set math.equation(numbering: n => "(2.16)")
 $ L = x \( 1 - x \) partial_x^2 + #scale(x: 120%, y: 120%)[\(] n +
   2 - \( n + 5 \) x #scale(x: 120%, y: 120%)[\)] partial_x \, wide
   cal(A) = \( - L + n + 3 \) \( - L + 2 \( n + 2 \) \) . $ <geo:sphere-operator>]

 The right-hand expression defines a smooth elliptic operator of order four on all of $Sigma$.]
  #emph[In the core coordinates $\( z \, theta \) mapsto \( z \, sqrt(1 - \| z \|^2) thin theta \)$,
    with $theta in S^5$, its Laplacian on functions independent of $theta$ is
#[#set math.equation(numbering: n => "(2.17)")
 $ Delta_Sigma = Delta_z - sum_(i \, j = 1)^m z_i z_j partial_(z_i z_j) - \( m + 5 \) sum_(i = 1)^m z_i
   partial_(z_i) . $ <geo:local-laplacian>]

 The flat momentum operator obtained by replacing $v_(*)$ by $x$ in (2.3) satisfies
#[#set math.equation(numbering: n => "(2.18)")
 $ hat(cal(A)) H := #scale(x: 120%, y: 120%)[\[] x^(1 - n) \( x^(n + 1) H \)'' #scale(x: 120%, y: 120%)[\]]'' =
   #scale(x: 120%, y: 120%)[\(] x partial_x^2 + \( n + 2 \) partial_x #scale(x: 120%, y: 120%)[\)]^2 H = 1 /
   16 Delta_(bb(R)^m)^2 H \, wide x = \| z \|^2 . $ <geo:flat-operator>]

]
] <geo:operators>

#proof[
  The only regularity issue in the identification occurs at the two singular orbits.
    Here is an elementary smoothness argument. If $f \( r \)$ is smooth and even near zero, then the operator
  $ cal(T) f \( r \) = frac(f' \( r \), r) = integral_0^1 f'' \( s r \) thin upright(d) s $
  defines another smooth even function. Thus, for $g \( x \) = f \( sqrt(x) \)$,
    each derivative on $x > 0$ has the form $g^(\( j \)) \( x \) = 2^(- j) \( cal(T)^j f \) \( sqrt(x) \)$,
    and extends continuously to $x = 0$. Induction gives smoothness up to zero of $g$ and all its derivatives.
    The same argument holds with smooth parameters. Restricting a smooth invariant function on $Sigma$ to
    $\( r e_1 \, sqrt(1 - r^2) thin theta_0 \)$ gives such an even $f$,
    and invariance makes its value depend only on $x = r^2$. Interchanging the two factors proves smoothness in
    $1 - x$ at the other endpoint. Conversely a smooth function of $x$ is smooth in these coordinates at both
    orbits, as well as on their complement.
  Write $\| z \| = sin theta.alt$, with $0 lt.eq theta.alt lt.eq pi \/ 2$. The spherical metric and volume density are
  $ upright(d) theta.alt^2 + sin^2 theta.alt thin g_(S^(m - 1)) + cos^2 theta.alt thin g_(S^5) \, wide
    sin^(m - 1) theta.alt cos^5 theta.alt thin upright(d) theta.alt thin upright(d) omega_(m - 1) thin upright(d)
    omega_5 . $
  Changing to $x = sin^2 theta.alt$ gives density proportional to
  $ M \( x \) thin upright(d) x := x^(m \/ 2 - 1) \( 1 - x \)^2 thin upright(d) x = w v_(*)^2 thin upright(d) x . $
  The radial Laplacian computed from this metric gives the displayed formula for $L$, equivalently $L =
    M^(- 1) partial_x \( v_(*) M partial_x \)$.
  We verify the factorization by a polynomial argument that also checks the endpoint terms.
    Both $L$ and $cal(A)$ preserve polynomial degree and are symmetric for the inner product with density $M$.
    For $cal(A)$, twice integrating by parts gives
  #[#set math.equation(numbering: n => "(2.19)")
   $ integral_0^1 a \( cal(A) b \) M thin upright(d) x = integral_0^1 frac(\( M a \)'' \( M b \)'', w) thin
     upright(d) x . $ <geo:symmetry>]
  There are no boundary terms: $M a$ and its first derivative vanish at each endpoint,
    and $w^(- 1) \( M b \)''$ is smooth there. For $L$ symmetry follows from its divergence expression,
    since $v_(*) M$ vanishes at both ends. Orthogonalizing the monomials therefore gives common polynomial
    eigenfunctions. On the polynomial of degree $j$, the leading coefficients give respectively the eigenvalues
  $ - j \( j + n + 4 \) \, wide \( j + 1 \) \( j + 2 \) \( j + n + 2 \) \( j + n + 3 \) . $
  Indeed a symmetric degree-preserving operator maps the degree-$j$ orthogonal polynomial to a multiple of itself,
    because its inner product with every lower-degree polynomial vanishes. Finally,
  $ #scale(x: 120%, y: 120%)[\(] j \( j + n + 4 \) + n + 3 #scale(x: 120%, y: 120%)[\)]
    #scale(x: 120%, y: 120%)[\(] j \( j + n + 4 \) + 2 \( n + 2 \)
    #scale(x: 120%, y: 120%)[\)] = \( j + 1 \) \( j + n + 3 \) \( j + 2 \) \( j + n + 2 \) . $
  This proves equality on every polynomial, hence equality of the differential expressions:
    at an interior point polynomials realize arbitrary jets through order four.
    The sphere expression has leading term $Delta_Sigma^2 \/ 16$, proving the claimed ellipticity.
  For (2.17), the inverse metric in the $z$ coordinates is $\( delta_(i j) - z_i z_j \)$ and the volume density is
    $\( 1 - \| z \|^2 \)^2 thin upright(d) z thin upright(d) omega_5$. Applying the divergence formula therefore gives
  $ \( 1 - \| z \|^2 \)^(- 2) partial_(z_i)
    #scale(x: 120%, y: 120%)[\(] \( 1 - \| z \|^2 \)^2 \( delta_(i j) - z_i z_j \) partial_(z_j)
    #scale(x: 120%, y: 120%)[\)] = \( delta_(i j) - z_i z_j \) partial_(z_i z_j) - \( m + 5 \) z_i partial_(z_i) \, $
  with repeated indices summed. This computation only requires independence of $theta$.
    Finally both one-dimensional expressions for $hat(cal(A))$ in (2.18) expand to
  $ x^2 H^(\( 4 \)) + 2 \( n + 3 \) x H^(\( 3 \)) + \( n + 2 \) \( n + 3 \) H'' \, $
  and the radial Euclidean identity $1 / 4 Delta_(bb(R)^m) = x partial_x^2 + m /
    2 partial_x$ proves the last equality. ◻
]

=== 2.2 The self-similar core <geo:core-section>

From now on set $n = 10$, so $m = 24$ and $Sigma = S^29$. In the flat model the equation for the coefficient is

#[#set math.equation(numbering: n => "(2.20)")
 $ F_t + \( 1 + x F \)^2 hat(cal(A)) F = 0 . $ <geo:flat-flow>]

Let $D = x partial_x$. For the function $g = 1 + x F$, (2.18) gives

#[#set math.equation(numbering: n => "(2.21)")
 $ x hat(cal(A)) #scale(x: 120%, y: 120%)[\(] x^(- 1) \( g - 1 \) #scale(x: 120%, y: 120%)[\)] =
   x^(- 2) P \( D \) \( g - 1 \) \, wide P \( D \) = \( D - 2 \) \( D - 1 \) \( D + 9 \) \( D + 10 \) .
   $ <geo:euler-identity>]

Here $P$ denotes a polynomial, as distinct from the evolution operator denoted by $P$ later.
  One can check (2.21) on $g - 1 = x^j$: both sides equal $\( j - 2 \) \( j - 1 \) \( j + 9 \) \( j + 10 \)
  x^(j - 2)$; equality of the differential expressions follows as in Lemma 4.
  Consequently (2.20) is equivalent, for $x > 0$, to

#[#set math.equation(numbering: n => "(2.22)")
 $ g_t = - g^2 x^(- 2) P \( D \) \( g - 1 \) . $ <geo:g-flow>]

Define the cubic polynomial operator $Q \( D \) = \( D - 1 \) \( D + 9 \) \( D + 10 \)$.
  Suppose that $G$ is smooth and positive on $\[ 0 \, oo \)$, with $G \( 0 \) = 1$, and for some $c > 0$ satisfies

#[#set math.equation(numbering: n => "(2.23)")
 $ Q \( y partial_y \) \( G - 1 \) = y^2 / 2 (1 / G - 1 / c) . $ <geo:profile-equation>]

Then set

#[#set math.equation(numbering: n => "(2.24)")
 $ rho = sqrt(- t) \, wide y = x \/ rho \, wide h \( y \) = frac(G \( y \) - 1, y) \, wide F \( t \, x \) =
   rho^(- 1) h \( x \/ rho \) \, wide t < 0 . $ <geo:selfsimilar>]

The value $h \( 0 \) = G' \( 0 \)$ makes $h$ smooth at zero, since $h \( y \) =
  integral_0^1 G' \( s y \) thin upright(d) s$. Thus $F$ is smooth for $t < 0$ including at the flat origin.
  Applying $D - 2$, now with $D = y partial_y$, to (2.23) yields

$ P \( D \) \( G - 1 \) = - frac(y^2 D G, 2 G^2) . $

On the other hand $rho_t = - 1 \/ \( 2 rho \)$, so $partial_t G \( x \/ rho \) = D G \/ \( 2 rho^2 \)$.
  These identities prove (2.22), and hence (2.20), first for $x > 0$ and then at zero by smoothness.
  The existence of the required nonconstant positive $G$ is the subject of Theorem 6.

The same expression $F \( t \, x \)$ is smooth on the compact sphere for every $t < 0$.
  Its compact positivity multiplier obeys the useful identity

#[#set math.equation(numbering: n => "(2.25)")
 $ 1 + v_(*) F = x + \( 1 - x \) G \( x \/ rho \) . $ <geo:approximate-positivity>]

In particular, if $G$ is bounded above and below by positive constants,
  this multiplier has the same property uniformly in $t < 0$ and $0 lt.eq x lt.eq 1$.
  This is a bound in the momentum coordinate $x$, whose relation to the fixed affine coordinate varies under the
  Legendre transform. It does not imply uniform equivalence to the Fubini–Study metric.

=== 2.3 Curvature at the concentrating point <curvature-at-the-concentrating-point>

The final geometric implication uses only one value of the correction.
  It is convenient to state it before constructing that correction.

#thm([Lemma 2.3.])[
  (Finite-time obstruction).  #emph[Let $G in C^oo \[ 0 \, oo \)$ satisfy $G \( 0 \) =
    1$ and $G' \( 0 \) eq.not 0$, and define $F$ by (2.24). Suppose that for some $T > 0$ and $delta >
    0$ there is a smooth invariant solution $H = F + V$ of (2.5) on $\( - T \, 0 \) times Sigma$ such that $1 +
    v_(*) H > 0$ and
#[#set math.equation(numbering: n => "(2.26)")
 $ V \( t \, 0 \) = O \( rho^(- 1 + delta) \) wide \( t arrow.t 0 \) . $ <geo:correction-bound>]

 Then a smooth $U \( 10 \)$-invariant metric $omega_0 in \[ omega_(*) \]$ has maximal smooth Calabi-flow existence
   interval $\[ 0 \, T_(*) \)$, where $T_(*) = T \/ 2 < oo$.
   At the fixed affine origin $p$, the scalar curvature of this flow satisfies
#[#set math.equation(numbering: n => "(2.27)")
 $ S \( tau \, p \) = a \( T_(*) - tau \)^(- 1 \/ 2) + O #scale(x: 120%, y: 120%)[\(]
   1 + \( T_(*) - tau \)^(\( - 1 + delta \) \/ 2) #scale(x: 120%, y: 120%)[\)] \, wide a = -
   110 G' \( 0 \) eq.not 0 . $ <geo:curvature-rate>]

 In particular $S \( tau \, p \) tilde.op a \( T_(*) - tau \)^(- 1 \/ 2)$, and $a > 0$ when $G' \( 0 \) < 0$.]
] <geo:obstruction>

#proof[
  By Lemma 4, $H$ is smooth in $x$ at both endpoints for each time.
    Proposition 3, with $t_0 = - T \/ 2$, gives a smooth family of Kähler forms, and its slice $omega_0 =
    omega \( - T \/ 2 \)$ is a smooth positive form in the Fubini–Study class. Put $tau = t + T \/ 2$.
    The corresponding global potential satisfies exactly the normalization and evolution in (2.6) on $0 lt.eq
    tau < T_(*) = T \/ 2$.
  At $x = 0$, the coefficient of $x^(n + 1)$ in $w v_(*)^2 H$ is $H \( t \, 0 \)$. Thus (2.4) gives the exact identity
  #[#set math.equation(numbering: n => "(2.28)")
   $ S \( t \, p \) = n \( n + 1 \) #scale(x: 120%, y: 120%)[\(] 1 -
     H \( t \, 0 \) #scale(x: 120%, y: 120%)[\)] . $ <geo:center-scalar>]
  This evaluates scalar curvature at the same point $p$ at every time:
    (2.8) sends $q = 0$ to $x = 0$ for every affine choice. Since
  $ H \( t \, 0 \) = rho^(- 1) G' \( 0 \) + O \( rho^(- 1 + delta) \) \, $
  Equation (2.28) proves (2.27) and the asserted divergence.
  We recall why uniqueness applies to comparison with an unrestricted smooth flow;
    no symmetry hypothesis is needed for this step. Smooth positive initial potentials have a unique local Calabi
    flow by #cite(label("ChenHe2008")) Theorem 3.2. The uniqueness mechanism can also be seen directly.
    For two smooth solutions with the same initial potential,
    let $chi$ be their difference and interpolate their potentials by $phi_s$, $0 lt.eq s lt.eq 1$.
    Their interpolated Kähler forms remain positive, and variation of scalar curvature gives
  $ chi_t = - integral_0^1 (Delta_(phi_s)^2 chi + "Ric"_(phi_s)^(i macron(j)) partial_i partial_(macron(j)) chi)
    thin upright(d) s . $
  On a compact time interval where both solutions are smooth, the coefficients are smooth and uniformly elliptic.
    Relative to a fixed smooth volume form, integration twice by parts and interpolation give
  $ frac(upright(d), upright(d) t) parallel chi parallel_(L^2)^2 lt.eq - c parallel chi parallel_(H^2)^2 +
    C parallel chi parallel_(L^2)^2 lt.eq C parallel chi parallel_(L^2)^2 . $
  For this estimate, the principal quadratic form is the integral of $\| Delta_(phi_s) chi \|^2$;
    differentiating the smooth volume density introduces terms bounded by $C parallel chi parallel_(H^1) parallel
    chi parallel_(H^2)$, and the Ricci term has the same or lower order.
    The elliptic estimate for each uniformly elliptic Laplacian and $parallel chi parallel_(H^1) lt.eq
    epsilon parallel chi parallel_(H^2) + C_epsilon parallel chi parallel_(L^2)$ absorb those terms.
    Gronwall’s inequality proves uniqueness.
  It follows that any smooth flow from $omega_0$ agrees with the one constructed above on their common interval.
    Hence its maximal interval contains $\[ 0 \, T_(*) \)$. If it extended beyond $T_(*)$,
    smooth positivity on the compact manifold across that time would bound its scalar curvature,
    contradicting (2.27). Its maximal smooth existence time is therefore exactly $T_(*)$. ◻
]

The Fubini–Study class contains the constant-scalar-curvature form $omega_(*)$,
  so the hypotheses of Lemma 5 suffice to refute the smooth global-existence assertion.
  Its requirement of smooth existence at every finite time has already failed.
  In addition, $parallel S parallel_(L^oo)$ is unchanged by biholomorphic pullback,
  so the curvature divergence itself is unaffected by allowing automorphisms.

== 3 A positive shrinking profile <prof:section>

We construct the profile used in the concentration argument. Its construction has two parts:
  a finite shooting estimate, proved by rational enclosures in Appendix Section 7,
  and an analytic construction on a half-line. The finite calculation belongs to the established framework of
  validated Taylor integration for ordinary differential equations #cite(label("NedialkovJacksonCorliss1999")).
  Here the integer interval recurrences and complex-disk remainder bounds are given explicitly.
  The half-line solution is constructed by a contraction, whereas the final matching argument uses only continuity
  of the shooting map.

#thm([Theorem 3.1.])[
  (Shrinking profile).  #emph[There exist a constant $c > 0$ and a function $G in C^oo \( \[ 0 \, oo \) \)$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ Q \( y partial_y \) \( G - 1 \) = y^2 / 2 (1 / G - 1 / c) \, wide
   Q \( D \) = \( D - 1 \) \( D + 9 \) \( D + 10 \) . $ <prof:profile-equation>]

 The function $G$ is bounded above and bounded away from zero, satisfies $G \( 0 \) = 1$ and $G' \( 0 \) < 0$,
   and is analytic near zero. There are real coefficients $g_j$, $j gt.eq 1$, such that, for every $J \, ell gt.eq 0$,
#[#set math.equation(numbering: n => "(3.2)")
 $ frac(upright(d)^ell, upright(d) y^ell) (G \( y \) - c - sum_(j = 1)^J g_j y^(- 2 j)) =
   O #scale(x: 120%, y: 120%)[\(] y^(- 2 \( J + 1 \) - ell) #scale(x: 120%, y: 120%)[\)] wide \( y arrow.r oo \) .
   $ <prof:expansion>]

 In particular, $u mapsto G \( u^(- 1 \/ 2) \)$ extends smoothly to $u = 0$ from the right, with value $c$.]
  #emph[Set $h \( y \) = \( G \( y \) - 1 \) \/ y$, with its smooth value at zero. For $t < 0$, the function
#[#set math.equation(numbering: n => "(3.3)")
 $ F \( t \, x \) = rho^(- 1) h \( x \/ rho \) \, wide rho = sqrt(- t) \, $ <prof:flat-shrinker>]

 solves
$ F_t + \( 1 + x F \)^2 hat(cal(A)) F = 0 \, wide hat(cal(A)) = \( x partial_x^2 + 12 partial_x \)^2 . $

]
] <prof:profile>

=== 3.1 Reduction and the analytic family at the origin <reduction-and-the-analytic-family-at-the-origin>

The calculation in Section 2.2 shows that (3.1) makes $F$ in (3.3) an exact solution of the flat equation.
  It remains to construct a positive $G$ with the stated behavior at zero and infinity.

Put

#[#set math.equation(numbering: n => "(3.4)")
 $ c = \( 1 + d \)^(- 1) \, wide s = (27 / 16)^(1 \/ 3) (y / c)^(2 \/ 3) \, wide G \( y \) =
   c \( 1 + p \( s \) \) . $ <prof:change-variables>]

Since $y partial_y = 2 / 3 s partial_s$ and $G - 1 = c \( p - d \)$, (3.1) becomes

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(E)_d \( p \) := p''' + 30 / s p'' + B / s^2 p' + C / s^3 \( p - d \) + frac(p, 1 + p) = 0 \, wide B = 751 /
   4 \, quad C = - 1215 / 4 . $ <prof:ode>]

Primes in this section henceforth denote $s$-derivatives, except where another variable is explicitly displayed.
  For example, the identity $Q \( D \) = D^3 + 18 D^2 + 71 D - 90$ verifies all the coefficients in (3.5).

We will construct origin solutions $p \( s \) = d + k s^(3 \/ 2) + O \( s^3 \)$, with two real parameters:
  $d$ fixes $c = \( 1 + d \)^(- 1)$, and $k$ fixes $G' \( 0 \)$.
  These parameters must be chosen to match $p$ to a tail tending to zero.
  The limiting linearized equation $p''' + p = 0$ has roots $- 1$ and $\( 1 plus.minus i sqrt(3) \) \/ 2$:
  one decaying direction and two real growing directions.

The tail argument uses a constant-coefficient comparison equation with the same splitting.
  After subtracting an explicit decaying approximation, we express the residual jet at $S_0 =
  56$ in its eigenbasis. For each allowed $d$, a contraction constructs small bounded tails with one real
  coordinate free and the other two determined. Choosing the free coordinate from the origin solution leaves two
  real matching conditions to enforce by varying $\( k \, d \)$.

The affine square below makes the shot’s two remaining coordinates close to its parameter $z_(*)$.
  Together with the tail bound, the certified estimate yields a continuous self-map of the square;
  Brouwer’s theorem supplies a matching point. All terminating decimals in this section denote exact rational
  numbers. Define

#[#set math.equation(numbering: n => "(3.6)")
 $ R = 5 dot.op 10^(- 10) \, wide cal(Z) = { z_(*) in bb(R)^2 : lr(bar.v.double z_(*) bar.v.double)_oo lt.eq
   R } \, wide S_0 = 56 \,\
vec(k, d) = vec(- .094617116666041, .400682721856639) + 10^(- 8) mat(delim: "(", 25190, - 63731; 721855, 359157)
  z_(*) . $ <prof:parameters>]

Write $k_0 \, d_0$ for the central values. The square implies

#[#set math.equation(numbering: n => "(3.7)")
 $ \| k - k_0 \| lt.eq 4.44605 dot.op 10^(- 13) \, wide \| d - d_0 \| lt.eq
   5.40506 dot.op 10^(- 12) < .011 R . $ <prof:parameter-displacement>]

#thm([Lemma 3.2.])[
  (Origin family).  #emph[For $\| k - k_0 \| lt.eq .1$ and $\| d - d_0 \| lt.eq .1$ in $bb(C)$,
    there is a unique solution germ of (3.5), analytic in $r = s^(3 \/ 2)$, of the form
#[#set math.equation(numbering: n => "(3.8)")
 $ p = d + k r + sum_(i gt.eq 2) a_i r^i \, wide r = s^(3 \/ 2) . $ <prof:origin-series>]

 The series is jointly holomorphic in $r \, k \, d$ for $\| r \| < 3$ and satisfies
#[#set math.equation(numbering: n => "(3.9)")
 $ 3 \| k \| + sum_(i gt.eq 2) \| a_i \| 3^i < .8 . $ <prof:origin-majorant>]

 Each of $p \( 1 \) \, p' \( 1 \) \, p'' \( 1 \)$ has modulus at most $2$ on this parameter polydisc.
   For the real parameters in (3.6), $1 + p > 0$ on $0 lt.eq s lt.eq 1$.]
] <prof:origin>

#proof[
  In the variable $r = s^(3 \/ 2)$, (3.5) is equivalent to
  $ Q \( r partial_r \) \( p - d \) = 8 / 27 r^2 #scale(x: 120%, y: 120%)[\(] \( 1 + p \)^(- 1) -
    1 #scale(x: 120%, y: 120%)[\)] . $
  Consequently the coefficients of an analytic solution must satisfy
  #[#set math.equation(numbering: n => "(3.10)")
   $ a_i =
     frac(\[ r^(i - 2) \] #scale(x: 120%, y: 120%)[\(] \( 1 + p \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)], \(
     27 \/ 8 \) \( i - 1 \) \( i + 9 \) \( i + 10 \)) \, wide i gt.eq 2 . $ <prof:origin-recurrence>]
  The constant and linear equations leave $d \, k$ free, and this recurrence determines every subsequent
    coefficient uniquely.
  For convergence, use the Banach algebra of power series with norm $sum_i \| b_i \| 3^i$.
    On the closed ball of series $a$ with no constant or linear term and norm at most $.2$, one has
  $ lr(bar.v.double k r + a bar.v.double) < .585 + .2 < .8 \, wide \| 1 + d \| > 1.30 . $
  Thus inversion of $1 + d + k r + a$ is given by a convergent geometric series in that Banach algebra and has
    norm at most $2$. The map specified by (3.10) sends this ball into the ball of radius $9 \( 2 + 1 \) \/
    440 < .062$, since every denominator in that formula exceeds $440$.
    Its Lipschitz constant is at most $9 dot.op 2^2 \/ 440 < 1$.
    Iteration therefore gives a unique fixed point, jointly holomorphic in the parameters.
    The strict inequalities also hold on a neighborhood of the closed parameter polydisc. Moreover
  $ 3 \| k \| + lr(bar.v.double a bar.v.double) lt.eq 3 \( .094617116666041 + .1 \) + 27 / 440 < .8 \, $
  which proves (3.9).
  For $0 lt.eq r lt.eq 1$, the nonconstant sum is at most $.8 r \/ 3$.
    In particular the real parameters in (3.6) give $1 + p > 1.4 - .8 \/ 3 > 0$.
    At $s = 1$, a term $a_i s^(3 i \/ 2)$ acquires factors $3 i \/
    2$ and $\( 3 i \/ 2 \) \( 3 i \/ 2 - 1 \)$ under one and two derivatives. The elementary bounds
  $ sup_(i gt.eq 1) frac(3 i \/ 2, 3^i) = 1 / 2 \, wide sup_(i gt.eq 1)
    frac(\( 3 i \/ 2 \) \( 3 i \/ 2 - 1 \), 3^i) = 2 / 3 $
  together with (3.9) and $\| d \| < .501$ give the stated jet bounds.
    Termwise differentiation is valid since $1 < 3$. ◻
]

=== 3.2 The matching coordinates <the-matching-coordinates>

Define the four-term approximation

#[#set math.equation(numbering: n => "(3.11)")
 $ p_(upright(a)) \( s \; d \) = sum_(j = 1)^4 d_j s^(- 3 j) \, wide a = d_1 = C d \, wide b = d_2 = a^2 + 567 a \,\
d_3 = 2 a b - a^3 + 2025 / 4 b \, wide d_4 = b^2 + 2 a d_3 - 3 a^2 b + a^4 + 567 /
  2 d_3 . $ <prof:asymptotic-polynomial>]

We choose the constant coefficients in $D_0$ at the midpoints of the corresponding linearized tail ranges on
  $\[ S_0 \, oo \)$, giving the uniform difference bounds used in Lemma 10. Let

#[#set math.equation(numbering: n => "(3.12)")
 $ D_0 \( lambda \) = lambda^3 + 15 / S_0 lambda^2 + frac(B, 2 S_0^2) lambda + 1 + frac(C, 2 S_0^3) \,\
v_i = \( 1 \, lambda_i \, lambda_i^2 \)^t \, wide
  vec(p - p_(upright(a)), p' - p'_(upright(a)), p'' - p''_(upright(a)))_(s = S_0) = q v_0 + xi v_1 +
  accent(xi v, ‾)_2 . $ <prof:coordinates>]

The roots are ordered so that $lambda_0$ is real, $Im lambda_1 > 0$, and $lambda_2 = macron(lambda)_1$.
  The exact real projection matrix $Gamma$ takes a real jet to $\( q \, Re xi \, Im xi \)^t$.
  Its rational approximation used in the finite certificate is

#[#set math.equation(numbering: n => "(3.13)")
 $ Lambda = 10^(- 5) mat(delim: "(", 30756, - 27384, 33447; 34622, 13692, - 16724; - 2925, - 34040, - 28850) .
   $ <prof:projection-approximation>]

#thm([Lemma 3.3.])[
  (Root and convolution bounds).  #emph[The roots in (3.12) are distinct and satisfy
#[#set math.equation(numbering: n => "(3.14)")
 $ - 1.08659 & < lambda_0 < - 1.08655 \,\
.40933 & < Re lambda_1 < .40938 \, wide .8671 < Im lambda_1 < .86721 . $ <prof:root-boxes>]

 Every entry of $Gamma - Lambda$ has modulus less than $.001$.
   The absolute row sums of $Gamma$ are less than $.92 \, .68 \, .68$, respectively. With
#[#set math.equation(numbering: n => "(3.15)")
 $ M_i = sum_(j = 0)^2 frac(\| lambda_j \|^i, \| Re lambda_j \| thin \| D'_0 \( lambda_j \) \|) \, wide 0 lt.eq
   i lt.eq 2 \, $ <prof:convolution-constants>]

 one has
$ M_0 < 1.96 \, wide M_1 < 1.92 \, wide M_2 < 1.88 \, wide frac(1, Re lambda_1 \| D'_0 \( lambda_1 \) \|) < .82 . $

]
] <prof:root-bounds>

#proof[
  Write $alpha = 15 \/ 56$, $beta = B \/ \( 2 dot.op 56^2 \)$ and $H_0 = 1 + C \/ \( 2 dot.op 56^3 \)$.
    The exact calculations
  $ alpha^2 - 3 beta = - 453 / 25088 < 0 \, wide D_0 \( - 1.08659 \) = - 17566501197647 / 343000000000000000 < 0 \, $
  $ D_0 \( - 1.08655 \) = 187622583137 / 2744000000000000 > 0 $
  show that $D_0$ is strictly increasing on the real line and has exactly one real root in the indicated interval.
    Write $lambda_0 = - r_0$ and $lambda_1 = u + i v$ with $v > 0$. Vieta’s identities give
  #[#set math.equation(numbering: n => "(3.16)")
   $ u = frac(r_0 - alpha, 2) \, wide v^2 = H_0 / r_0 - u^2 \, wide \| lambda_1 \|^2 = H_0 /
     r_0 . $ <prof:root-arithmetic>]
  In particular, if $u_(-) = 114617 \/ 280000$ and $u_(+) = 573113 \/ 1400000$, then $u_(-) < u < u_(+)$,
    with $.40933 < u_(-)$ and $u_(+) < .40938$. The rational inequalities
  $ .8671^2 < H_0 / 1.08659 - u_(+)^2 lt.eq v^2 lt.eq H_0 / 1.08655 - u_(-)^2 < .86721^2 \, wide H_0 /
    1.08655 < .959^2 $
  give the other root bounds and $\| lambda_1 \| < .959$.
  For each root, the corresponding complex projection row is
  #[#set math.equation(numbering: n => "(3.17)")
   $ frac(\( lambda_j lambda_k \, - lambda_j - lambda_k \, 1 \), D'_0 \( lambda_i \)) \, wide { i \, j \, k } =
     { 0 \, 1 \, 2 } . $ <prof:projection-row>]
  Taking the real row for $i = 0$ and the real and imaginary parts for $i = 1$ gives $Gamma$.
    Put $E = \( r_0 + u \)^2 + v^2$. The three real rows are
  $ (frac(u^2 + v^2, E) \, frac(- 2 u, E) \, 1 / E) \,\
(frac(r_0 \( r_0 + 2 u \), 2 E) \, u / E \, frac(- 1, 2 E)) \,\
(frac(r_0 \[ u \( r_0 + u \) - v^2 \], 2 v E) \, frac(- \( v^2 + r_0^2 - u^2 \), 2 v E) \, frac(- \( r_0 + u \), 2
  v E)) . $
  Substituting $r_0 in \[ 1.08655 \, 1.08659 \]$ and the intervals just obtained for $u \, v \,
    v^2$ gives the following rational enclosures. For each entry,
    products are enclosed by the minimum and maximum of the four endpoint products,
    and positive reciprocals by reversing the reciprocal endpoints.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[First entry
], table.cell(rowspan: 1, colspan: 1)[Second entry
], table.cell(rowspan: 1, colspan: 1)[Third entry
]),
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[$\( .3074 \, .3078 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - .2740 \, - .2737 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( .3344 \, .3346 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Re xi$
], table.cell(rowspan: 1, colspan: 1)[$\( .3461 \, .3464 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( .1368 \, .1370 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - .1673 \, - .1672 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Im xi$
], table.cell(rowspan: 1, colspan: 1)[$\( - .0294 \, - .0291 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - .3406 \, - .3402 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - .2887 \, - .2883 \)$
],
)
]
  The entrywise error from $Lambda$ is therefore less than $.001$,
    and the row sums are less than $.9164 \, .6507 \, .6587$, respectively.
  Finally,
  $ E > \( 1.08655 + u_(-) \)^2 + .8671^2 = 46876434629 / 15680000000 > 2.9895 > 1.729^2 . $
  Since $D'_0 \( - r_0 \) = E$ and $\| D'_0 \( u + i v \) \| = 2 v sqrt(E)$, for $i = 0 \, 1 \, 2$ one has
  $ M_i < frac(1.08659^i, 1.08655 dot.op 2.9895) + frac(.959^i, .40933 dot.op .8671 dot.op 1.729) . $
  These three rational expressions are less than $1.96 \, 1.92 \, 1.88$, respectively,
    by multiplication by their positive denominators. Similarly,
  $ frac(1, Re lambda_1 \| D'_0 \( lambda_1 \) \|) < frac(1, 2 dot.op .40933 dot.op .8671 dot.op 1.729) =
    500000000000 / 613674044347 < .82 . $
  ◻
]

The finite part of the construction is the following consequence of Proposition 24.
  The origin solution of Lemma 7, for every $z_(*) in cal(Z)$, continues to $s = S_0$ and satisfies

#[#set math.equation(numbering: n => "(3.18)")
 $ 1 + p \( s \) > 0 quad \( 0 lt.eq s lt.eq S_0 \) \, wide \| q_(upright("shot")) \( z_(*) \) \| lt.eq .25 R \,
   wide lr(bar.v.double \( Re xi_(upright("shot")) \, Im xi_(upright("shot")) \) - z_(*) bar.v.double)_oo
   lt.eq .13 R . $ <prof:forward-bounds>]

The proof in the Appendix includes the analytic interpretation of its rational Taylor enclosures,
  the propagation of all rounding and truncation errors, and the uniform nonlinear continuation estimate.
  In particular, (3.18) is a statement about the exact solutions.
  Their endpoint jets depend continuously on $z_(*)$: this follows first from Lemma 7 at $s = 1$,
  and then from ordinary continuous dependence for (3.5) where $s > 0$ and $1 + p > 0$.
  The estimates from this section used in Appendix Section 7 are the origin family and the explicit root and
  tail-polynomial estimates; all are independent of the matching step.

=== 3.3 Construction on the half-line <construction-on-the-half-line>

#thm([Lemma 3.4.])[
  (Tail residual).  #emph[Uniformly for the parameters in (3.6),
$ sup_(s gt.eq 56) \| cal(E)_d \( p_(upright(a)) \) \( s \) \| < 3 dot.op 10^(- 13) . $

 Each derivative of this residual tends to zero at infinity.
   If $P_(upright(a)) \( d \) = \( p_(upright(a)) \, p'_(upright(a)) \, p''_(upright(a)) \) \( 56 \; d \)$, then
#[#set math.equation(numbering: n => "(3.19)")
 $ lr(bar.v.double P_(upright(a)) \( d \) - P_(upright(a)) \( d_0 \) bar.v.double)_oo lt.eq .01 \| d -
   d_0 \| . $ <prof:tail-parameter-bound>]

]
] <prof:tail-residual>

#proof[
  Put $t = s^(- 3)$. For a monomial $d_j s^(- 3 j)$, the differential part $p''' + 30 s^(- 1) p'' + B s^(- 2) p' +
    C s^(- 3) p$ contributes $L \( - 3 j \) d_j t^(j + 1)$, where
  $ L \( nu \) = nu \( nu - 1 \) \( nu - 2 \) + 30 nu \( nu - 1 \) + B nu + C . $
  Its first four relevant values are
  $ L \( - 3 \) = - 567 \, quad L \( - 6 \) = - 2025 \/ 4 \, quad L \( - 9 \) = - 567 \/ 2 \, quad
    L \( - 12 \) = - 243 \/ 4 . $
  Using $p \/ \( 1 + p \) = p - p^2 \/ \( 1 + p \)$ shows that the coefficients through $t^4$ cancel exactly for (3.11).
  The parameter interval (3.7) is contained in $\[ .40068272185 \, .40068272187 \]$.
    Substituting this rational interval in (3.11) and its $d$-derivative gives
  $ j & 1 & 2 & 3 & 4\
\| d_j \| < & 122 & 54200 & 12500000 & 5100000000\
\| partial_d d_j \| < & 304 & 100000 & 65000000 & 100000000000 . $
  These interval bounds use just the endpoint operations described in Lemma 8;
    the coefficient formulas are polynomials. The first row in particular implies
  #[#set math.equation(numbering: n => "(3.20)")
   $ \| d_1 \| 56^(- 3) < .00070 \, quad \| d_2 \| 56^(- 6) < 1.8 dot.op 10^(- 6) \,
     quad \| d_3 \| 56^(- 9) < 8.1 dot.op 10^(- 9) \, quad \| d_4 \| 56^(- 12) < 3.2 dot.op 10^(- 11) .
     $ <prof:tail-term-bounds>]
  Here is a finite positive-coefficient way to check the residual bound.
    Let $b = \( .00070 \, 1.8 dot.op 10^(- 6) \, 8.1 dot.op 10^(- 9) \, 3.2 dot.op 10^(- 11) \)$ and
    $B_(*) \( z \) = sum_(i = 1)^4 b_i z^i$. If $T_(*) = sum b_i$,
    the sums of the coefficients of degrees greater than four in its second, third, and fourth powers are, respectively,
  $ T_(*)^2 - b_1^2 - 2 b_1 b_2 - 2 b_1 b_3 - b_2^2 \, wide T_(*)^3 - b_1^3 - 3 b_1^2 b_2 \, wide T_(*)^4 - b_1^4 . $
  Substitution of the displayed four rational numbers gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ sum_(j > 4) \[ z^j \] B_(*) \( z \)^2 < 8 dot.op 10^(- 14) \, wide
     sum_(j > 4) \[ z^j \] B_(*) \( z \)^3 < 2 dot.op 10^(- 14) \, wide
     sum_(j > 4) \[ z^j \] B_(*) \( z \)^4 < 3 dot.op 10^(- 15) . $ <prof:residual-arithmetic>]
  Since $B_(*) \( 1 \) < .001$, all powers at least five contribute at most $.001^5 \/ \( 1 - .001 \)$.
    The remaining linear term contributes at most $\( 243 \/ 4 \) \( 3.2 dot.op 10^(- 11) \) \/ 56^3$.
    Thus the residual is bounded by
  $ 8 dot.op 10^(- 14) + 2 dot.op 10^(- 14) + 3 dot.op 10^(- 15) + frac(.001^5, 1 - .001) +
    frac(\( 243 \/ 4 \) \( 3.2 dot.op 10^(- 11) \), 56^3) < 3 dot.op 10^(- 13) . $
  These bounds hold for all $s gt.eq 56$ because every remaining absolute monomial decreases there.
    The residual is a rational function of $s^(- 3)$, analytic at zero with vanishing constant term,
    which also proves the assertion about its derivatives. For the parameter estimate,
    the factors $3 j \/ 56$ and $3 j \( 3 j + 1 \) \/ 56^2$ are at most one for $1 lt.eq j lt.eq 4$.
    Thus the second row of the coefficient table gives
  $ lr(bar.v.double partial_d P_(upright(a)) bar.v.double)_oo lt.eq 304 / 56^3 + 100000 / 56^6 + 65000000 / 56^9 +
    100000000000 / 56^12 < .001735 < .01 . $
  The mean value theorem yields (3.19). ◻
]

#thm([Lemma 3.5.])[
  (Tail solutions).  #emph[For each $d$ arising in (3.6) and each real $\| q \| lt.eq .26 R$,
    there is a solution $p_(upright("tail"))$ of (3.5) on $\[ 56 \, oo \)$ such that
$ \| p_(upright("tail")) \| < .001 \, wide q_(upright("tail")) = q \, wide \| xi_(upright("tail")) \| < .25 R . $

 Its first three jet entries tend to zero at infinity. The solution, as a bounded jet,
   and its initial coordinates depend continuously on $q \, d$.]
] <prof:tail>

#proof[
  Let $b_i = D'_0 \( lambda_i \)^(- 1)$ and let $j$ be a bounded continuous real function on $\[ S_0 \, oo \)$.
    Define a vector $cal(V) = \( V \, V' \, V'' \)^t$ by the convergent integrals
  #[#set math.equation(numbering: n => "(3.22)")
   $ cal(V) \( s \) =  & q upright(e)^(lambda_0 \( s - S_0 \)) v_0 +
     b_0 v_0 integral_(S_0)^s upright(e)^(lambda_0 \( s - u \)) j \( u \) thin upright(d) u\
 & - sum_(i = 1)^2 b_i v_i integral_s^oo upright(e)^(lambda_i \( s - u \)) j \( u \) thin upright(d) u .
   $ <prof:green-formula>]
  Indeed this vector solves the companion system for $D_0 \( partial_s \) V = j$:
    the identities $sum b_i = sum lambda_i b_i = 0$ and $sum lambda_i^2 b_i =
    1$ follow by partial fractions of $1 \/ D_0$. They show both the derivative relations between its entries and
    the source in the last component. The vector is real by complex conjugation.
    It is the unique bounded solution with the prescribed real-mode coordinate at $S_0$,
    since a bounded homogeneous solution has no growing nonreal modes.
  For $0 lt.eq i lt.eq 2$, Lemma 8 gives
  #[#set math.equation(numbering: n => "(3.23)")
   $ lr(bar.v.double V^(\( i \)) bar.v.double)_oo lt.eq \| lambda_0 \|^i \| q \| +
     M_i lr(bar.v.double  bar.v.double) j_oo . $ <prof:green-bound>]
  In particular, on the closed ball $lr(bar.v.double  bar.v.double) j_oo lt.eq .3 R$,
    the first entry satisfies $lr(bar.v.double  bar.v.double) V_oo lt.eq \( .26 + 1.96 dot.op .3 \) R = .848 R$.
    Together with (3.20), this ensures $\| p_(upright(a)) + V \| < .001$ throughout the half-line.
  Write $N \( p \) = p^2 \/ \( 1 + p \)$ and $e_(upright(a)) = cal(E)_d \( p_(upright(a)) \)$.
    Then $p = p_(upright(a)) + V$ solves (3.5) exactly when
  #[#set math.equation(numbering: n => "(3.24)")
   $ j = cal(T)_(q \, d) j :=  & - e_(upright(a)) - (30 / s - 15 / S_0) V'' - (B / s^2 - frac(B, 2 S_0^2)) V'\
 & - (C / s^3 - frac(C, 2 S_0^3)) V + N \( p_(upright(a)) + V \) - N \( p_(upright(a)) \) . $ <prof:tail-map>]
  For $\| p \| lt.eq .001$,
  $ \| N' \( p \) \| = \| 1 - \( 1 + p \)^(- 2) \| < .0021 . $
  The three coefficient differences in (3.24) have absolute bounds $15 \/ S_0$,
    $B \/ \( 2 S_0^2 \)$ and $\| C \| \/ \( 2 S_0^3 \)$ on the entire half-line.
    It follows from (3.23) that the Lipschitz constant of $cal(T)_(q \, d)$ on the ball is at most
  #[#set math.equation(numbering: n => "(3.25)")
   $ 15 / 56 \( 1.88 \) + frac(B, 2 dot.op 56^2) \( 1.92 \) +
     (frac(\| C \|, 2 dot.op 56^3) + .0021) \( 1.96 \) < .57 . $ <prof:tail-contraction-constant>]
  The corresponding coefficient of the homogeneous term is bounded by
  #[#set math.equation(numbering: n => "(3.26)")
   $ 15 / 56 \( 1.08659 \)^2 + frac(B, 2 dot.op 56^2) \( 1.08659 \) +
     frac(\| C \|, 2 dot.op 56^3) + .0021 < .36 . $ <prof:tail-homogeneous-constant>]
  Consequently
  $ lr(bar.v.double cal(T)_(q \, d) j bar.v.double)_oo lt.eq
    3 dot.op 10^(- 13) + .36 \| q \| + .57 lr(bar.v.double  bar.v.double) j_oo
    lt.eq \( .0006 + .36 dot.op .26 + .57 dot.op .3 \) R = .2652 R < .3 R . $
  The contraction theorem gives a unique fixed point in this ball.
    Equation (3.22) then gives a $C^3$ solution, and (3.5) bootstraps it to a smooth solution for $s > 0$.
    Its nonreal initial coordinate satisfies
  $ xi_(upright("tail")) = - b_1 integral_(S_0)^oo upright(e)^(lambda_1 \( S_0 - u \)) j \( u \) thin upright(d)
    u \, wide \| xi_(upright("tail")) \| < .82 \( .3 R \) = .246 R < .25 R . $
  All coefficients in (3.24) depend continuously on $d$ in the relevant uniform norms,
    and the homogeneous vector depends continuously on $q$. The common contraction constant therefore gives
    continuous dependence of the fixed point, the bounded jet, and its initial coordinates.
    Finally, exponential convolutions of continuous functions tending to zero again tend to zero.
    Thus (3.24) preserves the closed subspace of such functions;
    the residual tends to zero and all its other coefficients are bounded.
    Iteration from $j = 0$ shows that the fixed point belongs to this subspace.
    Formula (3.22) proves $p \, p' \, p'' arrow.r 0$. ◻
]

=== 3.4 Matching the two solutions <matching-the-two-solutions>

For a parameter $z_(*) in cal(Z)$, apply Lemma 10 using the value $d \( z_(*) \)$ and the coordinate
  $q_(upright("shot")) \( z_(*) \)$ supplied by the finite shot.
  This is allowed by $\| q_(upright("shot")) \| lt.eq .25 R < .26 R$. Define a map on the closed square by

$ cal(B) \( z_(*) \) = z_(*) - #scale(x: 120%, y: 120%)[\(]
  Re \( xi_(upright("shot")) - xi_(upright("tail")) \) \, Im \( xi_(upright("shot")) - xi_(upright("tail")) \)
  #scale(x: 120%, y: 120%)[\)] . $

It is continuous by the continuous dependence established above and satisfies

$ lr(bar.v.double cal(B) \( z_(*) \) bar.v.double)_oo lt.eq \( .13 + .25 \) R = .38 R < R . $

Brouwer’s fixed point theorem gives $z_(*) in cal(Z)$ with $xi_(upright("shot")) = xi_(upright("tail"))$.
  The real coordinate and the parameter $d$ already agree. The three jet entries in (3.12) therefore agree,
  and ordinary uniqueness for (3.5) joins the shot and tail to one solution on $\[ 0 \, oo \)$.

The finite shot has $1 + p > 0$, and the tail has $\| p \| < .001$.
  Compactness of the finite interval and the uniform tail bound imply that $1 +
  p$ is bounded and bounded away from zero globally. Since $1 + d > 0$,
  the function $G$ in (3.4) has the same properties. Near zero,

$ s^(3 \/ 2) = frac(sqrt(27), 4 c) y \, wide G \( y \) = 1 + sqrt(27) / 4 k y + O \( y^2 \) . $

It is therefore analytic there, with $G' \( 0 \) = k sqrt(27) \/ 4 < 0$ by (3.7).
  This proves all assertions of Theorem 6 except for the differentiable expansion,
  which we now establish independently of the finite shooting estimates.

=== 3.5 Differentiable asymptotics at every order <differentiable-asymptotics-at-every-order>

The distinction between a bounded remainder and a remainder in a prescribed polynomial weight matters here.
  The following argument first proves uniqueness among bounded solutions and then identifies the actual remainder
  with the weighted solution.

#thm([Lemma 3.6.])[
  (Weighted remainder).  #emph[Let $p$ be the matched solution above.
    There are uniquely determined coefficients $d_j$, extending (3.11), such that for every $J \, ell gt.eq 0$,
#[#set math.equation(numbering: n => "(3.27)")
 $ frac(upright(d)^ell, upright(d) s^ell) (p \( s \) - sum_(j = 1)^J d_j s^(- 3 j)) =
   O #scale(x: 120%, y: 120%)[\(] s^(- 3 \( J + 1 \) - ell) #scale(x: 120%, y: 120%)[\)] . $ <prof:s-expansion>]

]
] <prof:weighted-remainder>

#proof[
  The limits $p \, p' \, p'' arrow.r 0$ and (3.5) imply that every derivative of $p$ is bounded on a sufficiently
    late half-line. To see this without assuming any asymptotic expansion, solve (3.5) for $p'''$.
    Its right-hand side is bounded, since $p$ is separated from $- 1$.
    Successively differentiating this formula proves the claim by induction:
    the coefficient functions $s^(- j)$ have bounded derivatives and all derivatives of $p mapsto
    p \/ \( 1 + p \)$ are bounded on the range in question.
  Formal substitution of $p = sum_(j gt.eq 1) d_j t^j$, $t = s^(- 3)$,
    in (3.5) determines the coefficients successively. Indeed the coefficient of $t^j$ contains the new
    coefficient $d_j$ with coefficient one from $p \/ \( 1 + p \)$;
    every other term involves only previous coefficients. The source $- C d \/ s^3$ determines $d_1 = C d$.
    For $p_J = sum_(j = 1)^J d_j s^(- 3 j)$, including $p_0 = 0$, one consequently has
  #[#set math.equation(numbering: n => "(3.28)")
   $ e_J := cal(E)_d \( p_J \) \, wide e_J^(\( ell \)) \( s \) =
     O #scale(x: 120%, y: 120%)[\(] s^(- N - ell) #scale(x: 120%, y: 120%)[\)] \, quad N = 3 \( J + 1 \) \, quad
     ell gt.eq 0 . $ <prof:formal-residual>]
  This follows directly from analyticity of the finite expression in $s^(- 3)$ near zero;
    no convergence of the infinite formal series is asserted.
  Let $W = p - p_J$. The exact divided-difference identity
  $ frac(p, 1 + p) - frac(p_J, 1 + p_J) = frac(W, \( 1 + p \) \( 1 + p_J \)) $
  gives the linear equation
  #[#set math.equation(numbering: n => "(3.29)")
   $ W''' + W = - e_J - a_2 W'' - a_1 W' - a_0 W \, $ <prof:remainder-equation>]
  where
  $ a_2 = 30 / s \, wide a_1 = B / s^2 \, wide a_0 = C / s^3 + frac(1, \( 1 + p \) \( 1 + p_J \)) - 1 . $
  These are now treated as given coefficient functions. Their absolute sum tends to zero because $p \, p_J arrow.r
    0$, and all their derivatives are bounded on a sufficiently late half-line.
  The polynomial $lambda^3 + 1$ has roots $- 1$ and $\( 1 plus.minus i sqrt(3) \) \/ 2$.
    The analogue of (3.22) on $\[ S \, oo \)$, with these roots, writes the bounded solution of $W''' + W =
    j$ as a stable homogeneous vector plus a convolution vector $cal(K)_S j$.
    Every root has modulus one and $\| \( lambda^3 + 1 \)' \| = 3$ at the roots. Hence
  #[#set math.equation(numbering: n => "(3.30)")
   $ max_(0 lt.eq i lt.eq 2) lr(bar.v.double \( cal(K)_S j \)_i bar.v.double)_oo lt.eq 5 /
     3 lr(bar.v.double  bar.v.double) j_oo . $ <prof:weighted-green>]
  It also acts in the Banach space with norm $lr(bar.v.double  bar.v.double) j_N =
    sup_(s gt.eq S) s^N \| j \( s \) \|$. For $S lt.eq u lt.eq s$,
  $ \( s \/ u \)^N lt.eq exp #scale(x: 120%, y: 120%)[\(] N \( s - u \) \/ S #scale(x: 120%, y: 120%)[\)] \, $
  while for $u gt.eq s$ this ratio is at most one. If $S gt.eq 2 N$,
    the forward kernel is therefore bounded by an exponential with decay rate $1 \/ 2$,
    and the two backward kernels already have decay rate $1 \/ 2$. It follows that
  #[#set math.equation(numbering: n => "(3.31)")
   $ max_(0 lt.eq i lt.eq 2) sup_(s gt.eq S) s^N \| \( cal(K)_S j \)_i \( s \) \| lt.eq
     2 lr(bar.v.double  bar.v.double) j_N . $ <prof:weighted-green-2>]
  The stable homogeneous vector $H \( s \) = q_S upright(e)^(- \( s - S \)) \( 1 \, - 1 \, 1 \)^t$ belongs to both
    spaces. Here $q_S$ is chosen to be the stable coordinate of the actual jet $\( W \, W' \, W'' \) \( S \)$.
  Choose $S gt.eq 2 N$ so late that $2 sup_(s gt.eq S) \( \| a_0 \| + \| a_1 \| + \| a_2 \| \) < 1$.
    The affine equation for the source,
  #[#set math.equation(numbering: n => "(3.32)")
   $ j = - e_J - sum_(i = 0)^2 a_i #scale(x: 120%, y: 120%)[\(] H_i + \( cal(K)_S j \)_i
     #scale(x: 120%, y: 120%)[\)] \, $ <prof:weighted-source>]
  is a contraction both in the bounded norm and in the norm $lr(bar.v.double dot.op bar.v.double)_N$,
    by (3.30)–(3.31). It has a unique solution in each space.
    The weighted solution is bounded, so uniqueness in the bounded space identifies the two solutions.
    On the other hand, the actual remainder has a bounded jet and bounded source $j = W''' + W$.
    The growing-mode integrals from infinity are forced by boundedness, so its jet has the representation $H +
    cal(K)_S j$ with the chosen $q_S$. It satisfies (3.32) and hence equals the weighted solution. We have proved
  #[#set math.equation(numbering: n => "(3.33)")
   $ W \, W' \, W'' = O \( s^(- N) \) . $ <prof:preliminary-remainder>]
  Equation (3.29) gives $W''' = O \( s^(- N) \)$. Differentiating it repeatedly,
    using the bounded coefficient derivatives and (3.28), proves $W^(\( ell \)) =
    O \( s^(- N) \)$ for every fixed $ell$. To obtain the extra decay for each derivative in (3.27), fix $J \,
    ell$ and apply this last conclusion to the deeper truncation $p_K$, where $K gt.eq J + ell$. Then
  $ \( p - p_J \)^(\( ell \)) = \( p - p_K \)^(\( ell \)) + sum_(j = J + 1)^K d_j \( s^(- 3 j) \)^(\( ell \)) =
    O #scale(x: 120%, y: 120%)[\(] s^(- 3 \( J + 1 \) - ell) #scale(x: 120%, y: 120%)[\)] . $
  The starting point $S$ and constants may depend on the finite orders $J \, ell$,
    which is exactly what the asserted asymptotic statement requires. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 6.] Finally $s^(- 3) = \( 16 \/ 27 \) c^2 y^(- 2)$,
    so (3.27) and the chain rule give (3.2), with $g_j = c thin d_j \( \( 16 \/ 27 \) c^2 \)^j$.
    Repeated differentiation of $u mapsto G \( u^(- 1 \/ 2) \)$ expresses each derivative as a finite sum of
    powers of $y$ times derivatives of $G$. Subtracting sufficiently many terms in (3.2) shows that these
    derivatives have their Taylor limits at $u = 0$. The resulting extension is $C^oo$.
    The origin expansion gives the smooth extension of $h$, and the calculation in Section 2.2 proves the flat
    equation in Theorem 6, also at $x = 0$ by smoothness. ◻
]

== 4 Parabolic norms and uniform local estimates <sec:parabolic>

The correction to the profile must satisfy the lower-order bound in Lemma 5.
  To encode that bound together with its spatial derivatives, put

$ rho = sqrt(- t) \, wide r = sqrt(x) \, wide sigma = \( r^2 + rho \)^(1 \/ 2) \, wide p_0 = - 2 + 2 delta \, wide
  0 < delta < 1 . $

At the concentrating point, a bound $\| V \| lt.eq epsilon sigma^(p_0)$ gives $\| V \( t \, 0 \) \| lt.eq
  epsilon rho^(- 1 + delta)$, smaller than the profile’s $rho^(- 1)$ term.
  On the sphere, $v_(*) lt.eq r^2 lt.eq sigma^2$, so it also gives $\| v_(*) V \| lt.eq epsilon sigma^(2 delta)$.
  Since $sigma$ is bounded on $Sigma times \[ - T \, 0 \)$ for fixed $T$,
  a small weighted norm will preserve positivity of the multiplier $1 + v_(*) \( F + V \)$.
  Outside the shrinking core, $r^2 gt.eq rho$, the scale $sigma$ is comparable to $r$ and the same weight records
  spatial decay. The particular value of $delta$ will be chosen in Theorem 18.

The norms below measure four spatial derivatives and one time derivative in units $\( sigma \, sigma^4 \)$.
  We also need estimates for an outer forward problem with zero initial data,
  uniform as the elapsed time tends to zero. For this purpose we distinguish the full parabolic norm from the norm
  that omits the first time derivative.

=== 4.1 Norms and scales <norms-and-scales>

On a product $D = U times I subset bb(R)^d times bb(R)$, put

$ d_(upright(p)) \( \( z \, t \) \, \( w \, s \) \) = \| z - w \| + \| t - s \|^(1 \/ 4) . $

Write

$ \[ g \]_(alpha \; D) =
  sup_(P eq.not Q in D) frac(\| g \( P \) - g \( Q \) \|, d_(upright(p)) \( P \, Q \)^alpha) \,
  quad \| g \|_(alpha \; D) = parallel g parallel_(oo \; D) + \[ g \]_(alpha \; D) . $

The joint seminorm is equivalent, with constants depending only on $alpha$,
  to the sum of the spatial $alpha$ and temporal $alpha \/ 4$ seminorms.
  We use the following explicit version of the fourth-order parabolic norm:

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(N)_alpha \( u \; D \) = sum_(j = 0)^4 \| D_z^j u \|_(alpha \; D) + \| u_t \|_(alpha \; D) \, wide
   cal(N)'_alpha \( u \; D \) = sum_(j = 0)^4 \| D_z^j u \|_(alpha \; D) . $ <ana:local-norm>]

Here and below norms of arrays mean sums of component norms.
  Thus $cal(N)'_alpha$ still includes temporal Hölder seminorms of all four spatial derivatives.

#prodef([Definition 4.1.])[
  (Weighted local spaces).  Let $M$ be either $bb(R)^m$ or the fixed sphere $Sigma$, let $I$ be a time interval,
    and let $s \( P \) > 0$ be a scale on $M times I$. Fix a sufficiently small number $a_0 > 0$.
    In Euclidean coordinates, or normal coordinates on $Sigma$, centered at $P = \( z_0 \, t_0 \)$, write $s_0 =
    s \( P \)$ and set
  $ Psi_P \( y \, theta \) = \( exp_(z_0) \( s_0 y \) \, t_0 + s_0^4 theta \) \, wide D_P = B_(a_0) times
    #scale(x: 120%, y: 120%)[\(] \( - a_0^4 \, a_0^4 \) ∩ s_0^(- 4) \( I - t_0 \) #scale(x: 120%, y: 120%)[\)] . $
  In the Euclidean case the exponential map means translation.
    The one-sided endpoints belonging to $I$ are included. For a fixed weight $p$, define
  #[#set math.equation(numbering: n => "(4.2)")
   $ parallel u parallel_(X_(alpha \, p) \( s \)) & = sup_P cal(N)_alpha \( s_0^(- p) u compose Psi_P \; D_P \) \,\
parallel u parallel_(X'_(alpha \, p) \( s \)) & = sup_P cal(N)'_alpha \( s_0^(- p) u compose Psi_P \; D_P \) \,\
parallel f parallel_(Y_(alpha \, p) \( s \)) & = sup_P \| s_0^(4 - p) f compose Psi_P \|_(alpha \; D_P) . $ <ana:X>]
  The derivatives in these formulas are derivatives of the displayed pullbacks.
    On the sphere $s$ is bounded above so that these charts, and their fixed enlargements used below,
    lie within the injectivity radius. Restriction to radial functions on $bb(R)^m$,
    or to invariant functions on $Sigma$, gives closed subspaces with these same norms.
  Unless specified otherwise, $X \, X' \, Y$ mean the spaces (4.2)–(4.2) with $s = sigma$, $p = p_0$,
    and the fixed exponent $0 < alpha < 1$. Subscripts $alpha'$ indicate replacement of $alpha$ by $alpha'$,
    with $alpha < alpha' < 1$.
] <ana:spaces>

These are local weighted norms; no Hölder quotient between distant boxes is imposed.
  Their completeness follows by convergence of the functions and indicated derivatives on every compact subset,
  followed by taking the supremum in the defining inequalities.
  The derivative relations pass to the limit distributionally.
  In particular $X$ and $X'$ are Banach spaces and $X arrow.r.hook X'$ has norm at most one.

The radius function $r$ is Lipschitz on both spaces. The elementary inequalities for Euclidean norms and fourth
  roots give

$ \| sigma \( z \, t \) - sigma \( z_0 \, t_0 \) \| lt.eq \| r \( z \) - r \( z_0 \) \| + \| t - t_0 \|^(1 \/ 4) . $

Consequently $sigma$ is comparable to its center value on every box in Definition 12,
  including boxes truncated at $t = 0$. Changing $a_0$ to another fixed sufficiently small radius gives equivalent
  norms: cover the enlarged box by finitely many smaller comparable-scale boxes,
  and split a Hölder quotient whose points are not in a common small box using the supremum norm.
  The same argument applies to $s_beta = max \( beta \, r \)$, whose lack of smoothness at $r = beta$ is harmless:
  the scale is frozen at each center, never differentiated.
  Products satisfy the usual local Hölder inequality $\| f g \|_alpha lt.eq 2 \| f \|_alpha \| g \|_alpha$,
  with their weights added.

=== 4.2 Interpolation without a lower bound for the time length <interpolation-without-a-lower-bound-for-the-time-length>

We first isolate the interpolation used in localization. For fixed nested balls $B_1 subset.double
  B_2$ and any interval $I$ of length at most one, let

$ U = parallel u parallel_(oo \; B_2 times I) \, wide M = U + parallel D_z^4 u parallel_(oo \; B_2 times I) +
  parallel u_t parallel_(oo \; B_2 times I) . $

Then, for $0 lt.eq j lt.eq 3$,

#[#set math.equation(numbering: n => "(4.3)")
 $ \| D_z^j u \|_(alpha \; B_1 times I) lt.eq C U^(1 - \( j + alpha \) \/ 4) M^(\( j + alpha \) \/ 4) lt.eq
   epsilon M + C_epsilon U . $ <ana:interp-basic>]

All constants are independent of $\| I \|$. Spatial interpolation on nested balls gives the spatial assertion,
  including the supremum. For the temporal assertion apply that same interpolation to $w = u \( dot.op \, t \) -
  u \( dot.op \, s \)$. With $b = \| t - s \|$,

$ parallel w parallel_oo lt.eq min \( 2 U \, b M \) \, wide parallel D^4 w parallel_oo lt.eq 2 M \, $

and hence

$ parallel D^j w parallel_(oo \; B_1) lt.eq C min \( 2 U \, b M \)^(1 - j \/ 4) M^(j \/ 4) . $

Divide by $b^(alpha \/ 4)$ and split at $b = U \/ M$; both resulting bounds give (4.3).
  Restricting the available values of $b$ can only decrease their supremum.
  The spatial interpolation inequalities themselves follow, for example,
  by subtracting a Taylor polynomial in a ball of radius $q$ and minimizing in $q$;
  fixed-radius remainders account for the $U$ term when the minimizer exceeds the gap between the balls.
  The same argument at order four gives

#[#set math.equation(numbering: n => "(4.4)")
 $ parallel D^4 u parallel_(oo \; B_1 times I) lt.eq epsilon \[ D^4 u \]_(alpha \; B_2 times I) +
   C_epsilon U . $ <ana:fourth-sup-interp>]

Here it suffices to use the spatial part of the seminorm on the right.
  Indeed, convolution on each spatial slice with a mollifier of radius $q$ gives $parallel D^4 u parallel_(B_1)
  lt.eq C q^alpha \[ D^4 u \]_(alpha \; B_2) + C q^(- 4) U$;
  choose $q$ below the spatial gap and so that $C q^alpha lt.eq epsilon$.
  Neither inequality uses a temporal seminorm of $u_t$.

=== 4.3 Local fourth-order estimates <local-fourth-order-estimates>

Consider in a coordinate cylinder the real scalar operator

#[#set math.equation(numbering: n => "(4.5)")
 $ cal(L) u = u_t + sum_(\| nu \| lt.eq 4) a_nu \( z \, t \) D^nu u \, wide
   sum_(\| nu \| = 4) a_nu \( z \, t \) xi^nu gt.eq lambda \| xi \|^4 . $ <ana:operator>]

Assume $lambda > 0$ and $sum_(\| nu \| lt.eq 4) \| a_nu \|_alpha lt.eq K$.
  These assumptions are always imposed in the coordinates and units of the estimate.
  On a fixed smooth manifold they include the coefficients arising from the coordinate expression of the operator.
  The leading symbols used later are positive multiples of squared positive definite quadratic forms, and satisfy (4.5).

#thm([Lemma 4.2.])[
  (Local Schauder estimates).  #emph[Under these assumptions the following estimates hold.]
  + #emph[If $Q_R = B_R times \( - R^4 \, 0 \]$ and $cal(L) u = f$ on $Q_2$, then
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(N)_alpha \( u \; Q_1 \) lt.eq C #scale(x: 120%, y: 120%)[\(] \| f \|_(alpha \; Q_2) +
   parallel u parallel_(oo \; Q_2) #scale(x: 120%, y: 120%)[\)] . $ <ana:interior-schauder>]

]
  + #emph[If $0 < h lt.eq 1$, $cal(L) u = f$ on $B_2 times \[ 0 \, h \]$, and $u \( dot.op \, 0 \) = 0$, then
#[#set math.equation(numbering: n => "(4.7)")
 $ cal(N)_alpha \( u \; B_1 times \[ 0 \, h \] \) lt.eq C #scale(x: 120%, y: 120%)[\(] \|
   f \|_(alpha \; B_2 times \[ 0 \, h \]) + parallel u parallel_(oo \; B_2 times \[ 0 \, h \])
   #scale(x: 120%, y: 120%)[\)] . $ <ana:initial-schauder>]

 Here $C$ depends only on $d \, alpha \, lambda \, K$ and the fixed spatial gaps, and in (ii) is independent of $h$.]
  #emph[These are a priori estimates for classical solutions in the indicated spaces;
    smooth approximation gives the same conclusions for limits of such solutions.
    The usual interior regularity theorem also applies: with smooth coefficients,
    distributional solutions in $L_(upright("loc"))^2$ and Hölder sources are locally in the space (4.1),
    and are smooth when the source is smooth. The estimates are from preceding times and require no terminal data.]
] <ana:schauder>

#proof[
  We give the kernel and localization argument, particularly its uniformity in (ii).
    For a frozen homogeneous principal operator $A_0$, with symbol $p \( xi \) gt.eq lambda \| xi \|^4$,
    its heat kernel is
  $ k_b \( z \) = \( 2 pi \)^(- d) integral_(bb(R)^d) e^(i z dot.op xi - b p \( xi \)) thin upright(d) xi \, wide
    b > 0 . $
  Fourier differentiation and scaling give, uniformly for the allowed symbols and every $N \, j \, ell$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| D^j partial_b^ell k_b \( z \) \| lt.eq C_(N \, j \, ell)
     b^(- \( d + j \) \/ 4 - ell) \( 1 + \| z \| b^(- 1 \/ 4) \)^(- N) . $ <ana:kernel>]
  Moreover $integral k_b = 1$ and $integral D^j k_b = 0$ for $j > 0$.
    For $u \( t \) = integral_0^t k_(t - s) * f \( s \) thin upright(d) s$ and $j = 4$,
    subtract $f \( s \, z \)$ inside the convolution. Writing $F = sup_s \[ f \( s \) \]_(alpha \; bb(R)^d)$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ parallel D^4 k_b * f \( s \) parallel_oo lt.eq C F b^(- 1 + alpha \/ 4) \, wide
     parallel partial_b D^4 k_b * f \( s \) parallel_oo lt.eq C F b^(- 2 + alpha \/ 4) . $ <ana:kernel-moment>]
  This proves $parallel D^4 u \( t \) parallel_oo lt.eq C F t^(alpha \/ 4)$.
    For a spatial increment of size $q$, split the lag integral at $q^4$.
    The short-lag part is bounded by $C F integral_0^(q^4) b^(- 1 + alpha \/ 4) thin upright(d) b$.
    For the long-lag part use the mean value theorem and $parallel D^5 k_b * f \( s \) parallel_oo lt.eq
    C F b^(\( alpha - 5 \) \/ 4)$. Its bound is $C F q integral_(q^4)^h b^(\( alpha - 5 \) \/ 4) thin upright(d)
    b$. Both are at most $C F q^alpha$, with an empty integral omitted.
  For a temporal increment $e = t - s > 0$, keep the source time unchanged:
  $ D^4 u \( t \) - D^4 u \( s \) =  & integral_s^t D^4 k_(t - r) * f \( r \) thin upright(d) r\
 & + integral_0^s \( D^4 k_(t - r) - D^4 k_(s - r) \) * f \( r \) thin upright(d) r . $
  The first integral and the part of the second where $s - r < e$ are bounded by $C F e^(alpha \/ 4)$.
    On the remaining part, (4.9) bounds the difference by $C F e \( s - r \)^(- 2 + alpha \/ 4)$, and
  $ e integral_e^s b^(- 2 + alpha \/ 4) thin upright(d) b lt.eq C e^(alpha \/ 4) . $
  This proves the full parabolic $alpha$ bound for $D^4 u$, down to the initial face,
    without any requirement that $f \( 0 \)$ vanish. The bounds for $u$ and lower derivatives follow from the
    kernel integrals or (4.3); finally $u_t = f - A_0 u$ supplies the full parabolic norm of $u_t$.
    We have proved the constant-coefficient zero-data estimate on every slab of length at most one, with one constant.
  Here are the localization details needed to preserve that constant.
    We apply the fourth-derivative frozen estimate in the original local units before localization;
    its constant is independent of the localization radius. In a spatial ball of radius $q$ and a time window of
    length at most $q^4$, freeze the principal coefficients at one point.
    Use a spatial cutoff supported in that ball. For windows meeting the initial face use no lower-time cutoff,
    so the localized function still has zero initial value. For interior windows insert a time cutoff which
    vanishes at the bottom and equals one on the smaller window;
    its derivatives are bounded by fixed powers of $q^(- 1)$.
    The constant-coefficient estimate then applies in both cases.
    The localized forcing consists of the original source, terms of spatial order at most three,
    a time-cutoff multiple of $u$, and $\( a_nu^0 - a_nu \) D^nu u$ for $\| nu \| = 4$. The last terms obey
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| \( a_nu^0 - a_nu \) D^nu u \|_alpha lt.eq C K q^alpha \| D^4 u \|_alpha +
     C K parallel D^4 u parallel_oo \, $ <ana:freeze-bound>]
  with fixed cutoff factors understood. First make $q$ small enough to absorb the first coefficient.
    Apply (4.4) to the second term. For the lower-order terms apply (4.3), and use the equation only in the form
  #[#set math.equation(numbering: n => "(4.11)")
   $ parallel u_t parallel_oo lt.eq parallel f parallel_oo +
     K sum_(j = 0)^4 parallel D^j u parallel_oo . $ <ana:ut-sup>]
  Thus no unknown temporal Hölder seminorm of $u_t$ is used to absorb a temporal seminorm of $D^4 u$.
  For completeness, the resulting nested-domain absorption can be expressed as follows.
    Let $H \( r \)$ be the supremum and parabolic $alpha$ norm of $D^4 u$ on the spatial ball of radius $r$,
    with the given time interval in the initial case; in the interior case also increase the preceding-time window
    with $r$. For $1 lt.eq r < R lt.eq 3 \/ 2$, localization, interpolation, and covering give,
    for any fixed $theta.alt > 0$,
  $ H \( r \) lt.eq theta.alt H \( R \) + C_theta.alt \( R - r \)^(- k) \( \| f \|_alpha + parallel u parallel_oo \) . $
  Here $k$ is fixed; all losses are powers of spatial cutoff radii, and none is a power of $h^(- 1)$.
    For Hölder pairs not sharing a small localization window,
    the quotient is bounded by the corresponding inverse power of that window’s radius times $parallel D^4 u
    parallel_oo$, which is handled by (4.4). Iterate along radii increasing geometrically to $3 \/ 2$,
    choosing $theta.alt 2^k < 1$. The last term tends to zero since the solution norm is finite on that compact
    cylinder. This proves the estimate for $D^4 u$. Equations (4.3) and (4.11) then give the lower derivatives,
    and the equation in full Hölder norm gives $\| u_t \|_alpha$. This proves (i) and (ii).
  For the distributional regularity assertion, extend the coefficients and a spatially localized source from a
    compact coordinate cylinder to a flat torus, combining the principal symbol with $\|
    xi \|^4$ outside the coordinate patch. This convex combination preserves positivity.
    The closed-manifold Cauchy theorem #cite(label("Huang2026")) Theorem 2.4, with order $r =
    4$ and zero data at an earlier time, provides a particular solution $w in
    C^(4 + alpha \, 1 + alpha \/ 4)$ near the smaller cylinder.
    There $u - w$ is a homogeneous distributional solution. To apply #cite(label("Hormander1961")) Theorem 5.1,
    write the full symbol as $p = i tau + a_4 \( x \, t \, xi \) + a_(lt.eq 3) \( x \, t \, xi \)$ and set $R =
    1 + \| tau \| + \| xi \|^4$. On a compact coordinate set,
    ellipticity and lower-order absorption give $\| p \| gt.eq c R$ at large frequencies.
    Smoothness and polynomial degree then give
  $ \| partial_(x \, t)^B partial_(xi \, tau)^A p \| lt.eq
    C_(A \, B) \( 1 + \| xi \| + \| tau \| \)^(- \| A \| \/ 4) \| p \| . $
  This verifies condition HE in #cite(label("Hormander1961")) Equations (3.1)’ and (3.2) with $d =
    1 \/ 4$ and $M_j = 1$. Bounded frequencies are covered by
    $tilde(p) = \( sum_A \| partial_(xi \, tau)^A p \|^2 \)^(1 \/ 2) gt.eq \| partial_tau p \| = 1$.
    Thus $u - w$ is smooth, proving local Hölder regularity. For smooth forcing the same theorem directly gives
    smoothness of $u$.
  The fixed-cylinder Schauder estimate, including an $L^2$ input for the solution,
    can also be taken directly from #cite(label("DongZhang2015")) Theorem 2.2(I).
    Its estimate for the top spatial derivatives is parabolic;
    the full temporal norm of $u_t$ follows here from the equation and the assumed temporal Hölder regularity of
    the coefficients and source. This invocation concerns fixed interior cylinders;
    the uniform initial-face assertion was proved above. ◻
]

#thm([Lemma 4.3.])[
  (Interior estimate with an $L^2$ input).  #emph[Let $U_1 subset.double
    U_2$ be fixed bounded spatial domains and $b_0 < b_1 < b$, with $b - b_1$ bounded above.
    Suppose that the coefficient assumptions of Lemma 13 hold on $U_2 times \( b_0 \, b \)$ and that $cal(L) u =
    f$ there. Then
#[#set math.equation(numbering: n => "(4.12)")
 $ cal(N)_alpha \( u \; U_1 times \[ b_1 \, b \) \) lt.eq C #scale(x: 120%, y: 120%)[\(] \|
   f \|_(alpha \; U_2 times \( b_0 \, b \)) + parallel u parallel_(L^2 \( U_2 times \( b_0 \, b \) \))
   #scale(x: 120%, y: 120%)[\)] . $ <ana:l2-estimate>]

 The constant depends on the spatial gap, $b_1 - b_0$, the upper bound for $b - b_1$,
   and the coefficient constants, but requires no terminal trace.
   The estimate is unchanged if the upper face is included and the solution is defined there.
   In particular it holds on fixed nested annuli through an open upper time endpoint.]
] <ana:l2>

#proof[
  We recall an interpolation proof of the replacement of the supremum term.
    On three nested interior cylinders, with a gap of parabolic size $a$,
    the estimate already proved bounds $parallel D_z u parallel_oo$ and $parallel u_t
    parallel_oo$ on the middle cylinder by $C
    a^(- k) \( parallel u parallel_(oo \; upright("outer")) + \| f \|_alpha \)$.
    Average $u$ on a preceding cylinder of radius $q < a \/ 4$ ending at the point being estimated.
    Its volume is a fixed multiple of $q^(d + 4)$, so
  $ \| u \( z \, t \) \| lt.eq C q^(- \( d + 4 \) \/ 2) parallel u parallel_(L^2 \( upright("outer") \)) +
    C \( q + q^4 \) a^(- k) \( parallel u parallel_(oo \; upright("outer")) + \| f \|_alpha \) . $
  Choose $q$ to be a sufficiently small fixed multiple of a suitable power of $a$.
    The last supremum coefficient can be made any prescribed $theta.alt > 0$,
    at the cost of another fixed inverse power of $a$ on the other terms.
    Iteration over geometrically decreasing gaps, with $theta.alt$ smaller than the corresponding geometric growth
    factor, bounds the inner supremum by $C \( parallel u parallel_(L^2) + \| f \|_alpha \)$.
    Lemma 13 on one further nested cylinder proves (4.12); finite covering handles $U_1$ and the time interval.
    All averaging cylinders use preceding times. First carry this out up to any closed upper face $b' <
    b$ on which the local norms are finite, then let $b' arrow.t b$.
    The constants use only the fixed lower time buffer. Pairs of points approaching $b$ are included by this
    limiting argument. ◻
]

=== 4.4 The outer forward problem <the-outer-forward-problem>

The following formulation permits the localization scale to tend to zero.
  Fix a compact smooth manifold without boundary and a time-independent positive Lipschitz scale $s \( z \)$.
  Assume that on balls of radius $4 a_0 s \( z \)$ the scale is comparable to its center value,
  with uniform comparison constants and uniformly bounded coordinate changes in scaled units.
  We impose the coefficient assumptions of (4.5) uniformly after scaling space by $s \( z \)$ and time by
  $s \( z \)^4$; an original coefficient of spatial order $j$ is thus multiplied by $s \( z \)^(4 - j)$.
  The ellipticity and Hölder constants in these units are denoted again by $lambda \, K$.
  These hypotheses hold for $s = s_beta$ in the later application.

#thm([Lemma 4.4.])[
  (Uniform zero-data forward estimate).  #emph[Fix $p in bb(R)$, $0 < alpha < 1$,
    and the preceding scale and coefficient constants. There exist $eta_0 > 0$ and $C < oo$,
    independent of $inf s$, with the following property. If
$ 0 < T lt.eq eta_0 \( inf s \)^4 \, wide cal(L) u = f quad upright("on ") M times \[ 0 \, T \] \, wide
  u \( dot.op \, 0 \) = 0 \, $

 then, with $eta = T \/ \( inf s \)^4$,
#[#set math.equation(numbering: n => "(4.13)")
 $ parallel u parallel_(X_(alpha \, p) \( s \)) lt.eq C parallel f parallel_(Y_(alpha \, p) \( s \)) \, wide
   sup_(z \, t) s \( z \)^(- p) \| u \( z \, t \) \| lt.eq C eta parallel f parallel_(Y_(alpha \, p) \( s \)) .
   $ <ana:short-bounds>]

 For each fixed positive scale and smooth coefficients the zero-data Cauchy problem has a unique solution with
   this regularity for $f in Y_(alpha \, p) \( s \)$. The same estimates hold on every interval $\[ 0 \, T' \)$,
   $T' lt.eq T$, on which the coefficients and source obey the stated bounds.]
] <ana:short>

#proof[
  Choose $eta_0 < a_0^4$. Every defining box meets the initial face,
    and its full time interval has length at most $eta_0$ in center-scale units.
    Apply (4.7) on a fixed spatial enlargement of each such box, rescaling its fixed spatial radius if necessary.
    Scale comparability and the covering observation after Definition 12 give
  $ parallel u parallel_(X_(alpha \, p) \( s \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel f
    parallel_(Y_(alpha \, p) \( s \)) + S #scale(x: 120%, y: 120%)[\)] \, wide S =
    sup_(z \, t) s \( z \)^(- p) \| u \( z \, t \) \| . $
  The pointwise time-derivative bound in this norm and zero initial data imply
  $ S lt.eq sup_z frac(T, s \( z \)^4) parallel u parallel_(X_(alpha \, p) \( s \)) lt.eq
    eta parallel u parallel_(X_(alpha \, p) \( s \)) . $
  Decrease $eta_0$ so that $C eta_0 lt.eq 1 \/ 2$, and absorb.
    This proves both estimates in (4.13) with constants independent of the number or size of the spatial boxes.
  Fixed-scale existence and uniqueness follow from #cite(label("Huang2026")) Theorem 2.4,
    with the trivial real line bundle, $r = 4$, exponent $alpha$, $L_t = - A \( t \)$, and zero initial data,
    where $cal(L) = partial_t + A \( t \)$. Its solution is $C^(4 + alpha \, 1 + alpha \/ 4)$ on the closed time
    slab, without requiring $f \( dot.op \, 0 \) = 0$; the equation gives $u_t \( dot.op \, 0 \) =
    f \( dot.op \, 0 \)$. Constants in this fixed-scale existence argument need not be uniform in $inf s$;
    uniformity of the asserted estimates has already been established locally.
    Truncation before an open terminal face and passage to the limit prove the last statement. ◻
]

#thm([Lemma 4.5.])[
  (Small spatial derivatives on a short interval).  #emph[Under the hypotheses of Lemma 15,
    the local scaled parabolic $C^alpha$ norms of the spatial derivatives of order $0 lt.eq j lt.eq 3$,
    with weight $p - j$, satisfy
#[#set math.equation(numbering: n => "(4.14)")
 $ sup_P \| D_y^j \( s_0^(- p) u compose Psi_P \) #scale(x: 120%, y: 120%)[\|]_(alpha \; D_P) lt.eq
   C eta^(\( 4 - j - alpha \) \/ 4) parallel f parallel_(Y_(alpha \, p) \( s \)) . $ <ana:lower-small>]

 If the coefficient and source bounds also hold at an exponent $alpha' in \( alpha \, 1 \)$, then
#[#set math.equation(numbering: n => "(4.15)")
 $ parallel u parallel_(X'_(alpha \, p) \( s \)) lt.eq C eta^(\( alpha' - alpha \) \/ 4) parallel f
   parallel_(Y_(alpha' \, p) \( s \)) . $ <ana:fourth-small>]

 Constants may depend on $alpha'$ but remain independent of the scale and elapsed time.]
] <ana:interpolation>

#proof[
  On a fixed enlarged scaled box, (4.13) gives $U lt.eq C eta parallel f parallel_Y$ and $M lt.eq
    C parallel f parallel_Y$ in the notation of (4.3). That inequality proves (4.14).
    In particular, all derivatives entering a commutator of a fourth-order spatial operator with a spatial cutoff
    have a common sufficient small factor $eta^(\( 1 - alpha \) \/ 4)$.
  For the second claim apply Lemma 15 at exponent $alpha'$, decreasing $eta_0$ if necessary.
    Every spatial derivative of $u$ through order four has zero initial trace.
    Indeed the solution and these derivatives are continuous to the initial face,
    and the trace function $u \( dot.op \, 0 \)$ is identically zero.
    For each $g = D_y^j \( s_0^(- p) u compose Psi_P \)$, $0 lt.eq j lt.eq 4$,
    the temporal $alpha' \/ 4$ seminorm and the elapsed scaled time therefore give
  $ parallel g parallel_oo lt.eq C eta^(alpha' \/ 4) parallel f parallel_(Y_(alpha' \, p) \( s \)) \,
    wide \[ g \]_(alpha') lt.eq C parallel f parallel_(Y_(alpha' \, p) \( s \)) . $
  On any metric space, splitting distances where the estimates $\| g \( P \) - g \( Q \) \| lt.eq
    2 parallel g parallel_oo$ and $\| g \( P \) - g \( Q \) \| lt.eq \[ g \]_(alpha')
    d \( P \, Q \)^(alpha')$ agree proves
  $ \[ g \]_alpha lt.eq C parallel g parallel_oo^(1 - alpha \/ alpha') \[ g \]_(alpha')^(alpha \/ alpha') . $
  Apply this with the parabolic metric and take the supremum over boxes.
    It proves (4.15), including temporal Hölder quotients of $D^4 u$ with one point at the initial face. ◻
]

#prodef([Remark 4.6.])[
  The exponent gap and omission of $u_t$ in (4.15) are necessary. On a circle the exact zero-data solution
  $ u_N \( z \, t \) = N^(- 4 - a) \( 1 - e^(- N^4 t) \) cos \( N z \) \, wide f_N \( z \) =
    N^(- a) cos \( N z \) \, wide T_N = N^(- 4) \, $
  of $u_t + partial_z^4 u = f_N$ has $\[ partial_z^4 u_N \]_alpha$ of order $N^(alpha - a)$ on $\[ 0 \, T_N \]$.
    This need not tend to zero when $a = alpha$, whereas $a = alpha'$ gives precisely the power in (4.15).
    Moreover $u_t \( 0 \) = f_N$. Thus the argument gives smallness of the full spatial norm $X'$,
    while making no smallness assertion for the time derivative.
] <ana:no-time-smallness>

== 5 An ancient inverse for the flat linearization <sec:flat>

Fix the profile supplied by Theorem 6, and put

$ rho = sqrt(- t) \, wide x = \| z \|^2 \, wide h \( y \) = frac(G \( y \) - 1, y) \, wide F \( z \, t \) =
  rho^(- 1) h \( \| z \|^2 \/ rho \) \, wide z in bb(R)^m \, $

where $m = 24$ and $h \( 0 \) = G' \( 0 \)$. Throughout this section the time domain is the entire interval
  $\( - oo \, 0 \)$. The flat linearization is

#[#set math.equation(numbering: n => "(5.1)")
 $ hat(cal(P)) V = V_t + frac(A \( z \, t \), 16) Delta_z^2 V + B \( z \, t \) V \, quad A =
   G \( \| z \|^2 \/ rho \)^2 \, quad B = 2 \| z \|^2 G \( \| z \|^2 \/ rho \) hat(cal(A)) F \, wide hat(cal(A)) =
   1 / 16 Delta_z^2 . $ <flat:operator>]

The spaces below are the radial versions of Definition 12, with scale $sigma = \( \| z \|^2 + rho \)^(1 \/ 2)$.

#thm([Theorem 5.1.])[
  (Ancient flat right inverse).  #emph[There is a number $delta in \( 0 \, 1 \)$ such that,
    for every fixed $alpha in \( 0 \, 1 \)$, the operator (5.1) has a bounded real linear right inverse
$ hat(D) : Y arrow.r X \, wide hat(cal(P)) hat(D) f = f \, wide parallel hat(D) f parallel_X lt.eq
  C parallel f parallel_Y \, wide p_0 = - 2 + 2 delta . $

 Here $Y$ has weight $p_0 - 4$ and parabolic exponent $alpha$,
   and $X$ has weight $p_0$ and includes the parabolic $alpha$ norms of all spatial derivatives through order four
   and of the first time derivative. The solution is radial and classical on $t < 0$.
   Its initial values are selected by the construction. The constant depends only on the fixed profile, $delta$,
   $alpha$, and the fixed choices in the local norms.]
] <flat:inverse>

=== 5.1 Similarity coordinates and coefficient bounds <similarity-coordinates-and-coefficient-bounds>

The flat equation for $F$ in Theorem 6 and the radial operator identity of Lemma 4 yield

#[#set math.equation(numbering: n => "(5.2)")
 $ 1 / 16 Delta_zeta^2 #scale(x: 120%, y: 120%)[\(] h \( \| zeta \|^2 \) #scale(x: 120%, y: 120%)[\)] = -
   frac(G' \( y \), 2 G \( y \)^2) \, wide y = \| zeta \|^2 \, wide F_t +
   G \( \| z \|^2 \/ rho \)^2 hat(cal(A)) F = 0 . $ <flat:profile-identities>]

In particular, with

$ A_f \( zeta \) = G \( \| zeta \|^2 \)^2 \, wide B_f \( zeta \) =
  frac(2 \| zeta \|^2 G \( \| zeta \|^2 \), 16) Delta_zeta^2 #scale(x: 120%, y: 120%)[\(] h \( \| zeta \|^2 \)
  #scale(x: 120%, y: 120%)[\)] = - frac(y G' \( y \), G \( y \)) \, $

one has $A \( z \, t \) = A_f \( z \/ sqrt(rho) \)$ and $B \( z \, t \) = rho^(- 2) B_f \( z \/ sqrt(rho) \)$.
  These coefficients are smooth at the origin. Positivity and the differentiated asymptotic expansion in Theorem 6 imply

#[#set math.equation(numbering: n => "(5.3)")
 $ inf A_f > 0 \, wide \| partial_zeta^nu \( A_f - c^2 \) \| + \| partial_zeta^nu B_f \| lt.eq
   C_nu \( 1 + \| zeta \| \)^(- 4 - \| nu \|) . $ <flat:symbols>]

In particular all derivatives, including any fixed number of applications of $zeta dot.op nabla$, are bounded.

Set

$ tau = - log \( - t \) \, wide zeta = z \/ sqrt(rho) \, wide V \( z \, t \) = rho^(- 1) v \( zeta \, tau \) \,
  wide f^(\#) \( zeta \, tau \) = rho^3 f \( sqrt(rho) thin zeta \, t \) . $

Since $upright(d) tau \/ upright(d) t = rho^(- 2)$ and $partial_t zeta = zeta \/ \( 4 rho^2 \)$,
  direct differentiation gives

$ V_t = rho^(- 3) (v_tau + 1 / 4 zeta dot.op nabla v + 1 / 2 v) \, wide Delta_z^2 V = rho^(- 3) Delta_zeta^2 v . $

Thus (5.1) becomes the autonomous equation

#[#set math.equation(numbering: n => "(5.4)")
 $ v_tau + A_f / 16 Delta^2 v + 1 / 4 zeta dot.op nabla v + \( 1 / 2 + B_f \) v = f^(\#) . $ <flat:similarity-equation>]

We shall first solve it in $E = C_(0 \, upright("rad")) \( bb(R)^m \; bb(C) \)$, with the supremum norm.
  This denotes continuous radial functions tending to zero at spatial infinity;
  complex scalars are needed only for spectral theory.

=== 5.2 Evolution on continuous functions vanishing at infinity <evolution-on-continuous-functions-vanishing-at-infinity>

We give the evolution construction since the unbounded drift in (5.4) and the change in the principal coefficient
  both matter. On a time interval beginning at $tau_0$, put

$ u \( eta \, s \) = v \( e^(s \/ 4) eta \, tau_0 + s \) \, wide 0 lt.eq s lt.eq 1 . $

Then

#[#set math.equation(numbering: n => "(5.5)")
 $ u_s + a \( eta \, s \) Delta_eta^2 u + b \( eta \, s \) u = l \( eta \, s \) \, wide a = e^(- s) /
   16 A_f \( e^(s \/ 4) eta \) \, quad b = 1 / 2 + B_f \( e^(s \/ 4) eta \) . $ <flat:moving-equation>]

The right side is the corresponding dilation of $f^(\#)$.
  By (5.3), $a \, b$ have bounded derivatives of every order on this slab, and $0 < kappa lt.eq a lt.eq
  kappa^(- 1)$ for a fixed $kappa$. The following construction also applies without radial symmetry.
  It is the scalar whole-space version of the higher-order heat-kernel parametrix;
  see also #cite(label("HeZeng2021")) Appendix A.

Let

$ k_theta \( w \) = \( 2 pi \)^(- m) integral_(bb(R)^m) e^(i w dot.op xi - theta \| xi \|^4) thin upright(d) xi \,
  wide theta > 0 . $

Its integral is one. Scaling and integration by parts in the Fourier integral show that,
  uniformly for $kappa lt.eq a_(*) lt.eq kappa^(- 1)$,

#[#set math.equation(numbering: n => "(5.6)")
 $ \| partial_(a_(*))^ell partial_w^nu k_(a_(*) q) \( w \) \| lt.eq
   C_(N \, ell \, nu) thin q^(- \( m + \| nu \| \) \/ 4) \( 1 + \| w \| \/ q^(1 \/ 4) \)^(- N) \, wide 0 < q lt.eq
   1 . $ <flat:kernel-bounds>]

Indeed after scaling $xi = q^(- 1 \/ 4) xi'$ the multipliers and all their derivatives form a bounded set of
  Schwartz functions. No sign property of $k_theta$ is used.

Freeze the principal coefficient at the source point and time:

$ K_(s \, r) \( eta \, y \) = k_(a \( y \, r \) \( s - r \)) \( eta - y \) \, wide r < s \, $

and also denote by $K_(s \, r)$ the associated integral operator.
  Applying the left side of (5.5) at the evaluation point gives the residual kernel

#[#set math.equation(numbering: n => "(5.7)")
 $ J_(s \, r) \( eta \, y \) = #scale(x: 120%, y: 120%)[\(] a \( eta \, s \) -
   a \( y \, r \) #scale(x: 120%, y: 120%)[\)] Delta_eta^2 k_(a \( y \, r \) \( s - r \)) \( eta - y \) +
   b \( eta \, s \) K_(s \, r) \( eta \, y \) . $ <flat:residual>]

The global Lipschitz bound for $a$ and (5.6) give

#[#set math.equation(numbering: n => "(5.8)")
 $ parallel K_(s \, r) parallel_(C_0 arrow.r C_0) lt.eq C \, wide
   parallel J_(s \, r) parallel_(C_0 arrow.r C_0) lt.eq C #scale(x: 120%, y: 120%)[\(] \( s - r \)^(- 3 \/ 4) +
   1 #scale(x: 120%, y: 120%)[\)] lt.eq C' \( s - r \)^(- 3 \/ 4) . $ <flat:residual-bound>]

For the first residual term, the spatial difference $\| eta -
  y \|$ contributes $\( s - r \)^(1 \/ 4)$ against a fourth derivative of size $\( s - r \)^(- 1)$;
  the temporal difference contributes $\( s - r \)$. The kernel bounds first show that both operators preserve
  $C_0$ for compactly supported continuous inputs, by decay in $eta$,
  and then for all $C_0$ inputs by uniform approximation.

These kernels give a strong approximate identity. To see this explicitly,
  replace $a \( y \, r \)$ by $a \( eta \, r \)$ in $K_(s \, r)$.
  The operator norm of the difference is $O \( \( s - r \)^(1 \/ 4) \)$,
  by the parameter derivative bound in (5.6). For the replacement kernel,
  its integral in $y$ is one at each $eta$; uniform continuity of a $C_0$ function,
  followed by the uniform kernel tail bound, proves convergence to that function in supremum norm. Consequently

#[#set math.equation(numbering: n => "(5.9)")
 $ K_(s \, r) d arrow.r d quad upright("in ") C_0 quad upright("as ") s - r arrow.b 0 \, $ <flat:approximate-identity>]

uniformly in the initial time $r$. This is strong convergence;
  only the difference between the two frozen kernels was estimated in operator norm.

For $d in C_0$ and $l in C \( \[ 0 \, 1 \] \; C_0 \)$ solve

#[#set math.equation(numbering: n => "(5.10)")
 $ j \( s \) + integral_0^s J_(s \, r) j \( r \) thin upright(d) r & = l \( s \) - J_(s \, 0) d \,\
u \( s \) & = K_(s \, 0) d + integral_0^s K_(s \, r) j \( r \) thin upright(d) r . $ <flat:volterra>]

All integrals are Bochner integrals. The inverse of the first equation is its Volterra series.
  For completeness, if $H \( s \) = C s^(- 3 \/ 4)$, its $k$-fold convolution on the positive half-line is

$ H^(* k) \( s \) = frac(C^k Gamma \( 1 \/ 4 \)^k, Gamma \( k \/ 4 \)) s^(k \/ 4 - 1) quad \( k gt.eq 1 \) . $

This identity follows by the beta integral and induction.
  Since the right side of the first equation in (5.10) is bounded by $C
  s^(- 3 \/ 4) \( parallel d parallel_oo + parallel l parallel_(C \( \[ 0 \, 1 \] \; C_0 \)) \)$,
  the same formula and the growth of the gamma function prove convergence of the series and the estimates

#[#set math.equation(numbering: n => "(5.11)")
 $ parallel j \( s \) parallel_oo lt.eq
   C s^(- 3 \/ 4) \( parallel d parallel_oo + parallel l parallel_(C \( \[ 0 \, 1 \] \; C_0 \)) \) \, wide
   sup_(0 lt.eq s lt.eq 1) parallel u \( s \) parallel_oo lt.eq
   C \( parallel d parallel_oo + parallel l parallel_(C \( \[ 0 \, 1 \] \; C_0 \)) \) . $ <flat:evolution-bound>]

The integral in the formula for $u$ tends to zero as $O \( s^(1 \/ 4) \)$.
  Together with (5.9), this proves $u in C \( \[ 0 \, 1 \] \; C_0 \)$ and $u \( 0 \) = d$.
  Continuity at positive times follows by dominated convergence,
  splitting off a short interval adjacent to the diagonal.

The kernel identity (5.7) proves that $u$ solves (5.5) distributionally:
  apply the equation to the second line of (5.10), obtaining $J_(s \, 0) d + j \( s \) +
  integral_0^s J_(s \, r) j \( r \) thin upright(d) r = l \( s \)$.
  This calculation can be made first with a positive separation from the diagonal and smooth compactly supported
  tests; the diagonal term converges to $j$ by (5.9), and (5.8) justifies the remaining integrals.
  Lemma 13 and interior regularity then give smoothness for positive times in the homogeneous case,
  and classical local regularity for locally parabolic Hölder sources.

We also record uniqueness in the class just constructed. If $u$ is the difference of two such solutions,
  it solves the homogeneous equation with zero $C_0$ initial value.
  Let $W \( eta \) = exp \( - sqrt(1 + \| eta \|^2) \)$. Its derivatives are bounded by constant multiples of $W$.
  For $s gt.eq epsilon > 0$, interior regularity supplies globally bounded spatial derivatives of $u$.
  Integration by parts, first with compact spatial cutoffs, gives

$ Re integral W overline(u) thin a Delta^2 u = Re integral Delta \( a W overline(u) \) Delta u gt.eq kappa /
  2 parallel Delta u parallel_(L^2 \( W \))^2 - C parallel u parallel_(L^2 \( W \))^2 . $

Here the mixed terms are absorbed using

$ parallel nabla u parallel_(L^2 \( W \))^2 lt.eq epsilon.alt parallel Delta u parallel_(L^2 \( W \))^2 +
  C_epsilon.alt parallel u parallel_(L^2 \( W \))^2 . $

This last inequality follows by integrating $integral W \| nabla u \|^2$ once by parts and using $\| nabla W \|
  lt.eq C W$ and Young’s inequality. Exponential decay of $W$ allows removal of the cutoffs.
  The bounded zeroth order coefficient therefore gives

$ frac(upright(d), upright(d) s) parallel u \( s \) parallel_(L^2 \( W \))^2 lt.eq
  C parallel u \( s \) parallel_(L^2 \( W \))^2 . $

Gronwall’s inequality, followed by $epsilon arrow.b 0$, proves $u = 0$,
  because the zero $C_0$ initial trace implies a zero weighted $L^2$ trace.
  This also proves uniqueness for the inhomogeneous construction by subtraction.

Undoing the dilation now gives a strongly continuous homogeneous semigroup $S \( s \)$ on $C_0 \( bb(R)^m \)$ for
  (5.4); concatenation is justified by the uniqueness just proved.
  Dilation is strongly continuous on $C_0$, and the equation is autonomous.
  On $0 lt.eq s lt.eq 1$ one has $parallel S \( s \) parallel lt.eq C$.
  Inhomogeneous evolution for a continuous $C_0$ source is

#[#set math.equation(numbering: n => "(5.12)")
 $ v \( tau_0 + s \) = S \( s \) v \( tau_0 \) + integral_0^s S \( s - r \) f^(\#) \( tau_0 + r \) thin upright(d)
   r . $ <flat:duhamel>]

The formula follows either from the distributional equation and uniqueness or by approximation with smooth
  sources. Rotation and complex conjugation preserve the equation and the construction.
  In particular $S \( s \)$ preserves $E$ and its real subspace.

=== 5.3 Compactness at positive time <compactness-at-positive-time>

Write $P = S \( 1 \) \|_E$, reserving this symbol here for a bounded operator,
  and let $P_c$ be the corresponding operator with $A_f = c^2$ and $B_f = 0$. We prove

#[#set math.equation(numbering: n => "(5.13)")
 $ P - P_c : E arrow.r E quad upright("is compact") . $ <flat:compact-difference>]

Both time-one evolutions map their unit balls to locally equicontinuous functions by the interior estimates.
  It remains to prove uniform decay of their difference at spatial infinity.

Suppose this decay fails. There are $d_j in E$ with $parallel d_j parallel_oo lt.eq 1$,
  points $zeta_j$ with $\| zeta_j \| arrow.r oo$, and $epsilon.alt_0 > 0$ such that $\| \( P - P_c \)
  d_j \( zeta_j \) \| gt.eq epsilon.alt_0$. In the moving coordinates (5.5), translate by $eta_j =
  e^(- 1 \/ 4) zeta_j$. The two solutions, denoted by $u_j$ and $u_(c \, j)$ after translation,
  have the same initial value $d_j \( eta + eta_j \)$ and uniform supremum bounds.
  Their coefficients converge, smoothly on compact subsets of $bb(R)^m times \[ 0 \, 1 \]$, to

$ a_c \( s \) = frac(c^2 e^(- s), 16) \, wide b_c = 1 / 2 . $

This follows from (5.3); it also controls time derivatives in the moving coordinates.

After passing to a subsequence, the translated initial functions converge weakly star in $L^oo \( bb(R)^m \)$ to
  some $d_oo$. Sequential extraction is available because $L^1 \( bb(R)^m \)$ is separable.
  Interior estimates and a diagonal extraction give smooth local limits $u_oo \, u_(c \, oo)$ for $s > 0$,
  including convergence of their values at $s = 1$. Both limits are bounded on the whole slab.
  To identify their initial traces, for $psi in C_c^oo \( bb(R)^m \)$ integrate the translated equation:

#[#set math.equation(numbering: n => "(5.14)")
 $ lr(|integral u_j \( s \) psi - integral d_j \( eta + eta_j \) psi|) lt.eq
   C s thin sup_(j \, thin 0 lt.eq r lt.eq 1)
   (parallel Delta^2 \( a_j \( dot.op \, r \) psi \) parallel_(L^1) + parallel b_j \( dot.op \, r \) psi
   parallel_(L^1)) lt.eq C_psi s . $ <flat:translated-trace>]

All four spatial derivatives have fallen on the coefficient times the test function.
  Uniform coefficient bounds make the last constant independent of $j$.
  The identity extends down to $s = 0$ using the individual $C_0$ initial traces.
  The same estimate holds for $u_(c \, j)$. Passing to the limit proves that both limits have distributional
  initial value $d_oo$.

Here is the required whole-space uniqueness for these bounded limits;
  a $C_0$ initial trace of the limits is not needed. Their difference $w$ solves

$ w_s + a_c \( s \) Delta^2 w + 1 / 2 w = 0 $

and has zero distributional initial value. For a fixed $t_1 in \( 0 \, 1 \]$ and $psi in cal(S) \( bb(R)^m \)$,
  use the backward test function

$ phi.alt \( s \) = e^(- \( t_1 - s \) \/ 2) k_(integral_s^(t_1) a_c \( r \) thin upright(d) r) * psi \, wide
  0 lt.eq s lt.eq t_1 \, $

with $phi.alt \( t_1 \) = psi$. It solves $- phi.alt_s + a_c \( s \) Delta^2 phi.alt + 1 / 2 phi.alt = 0$,
  is continuous in the Schwartz topology, and hence $integral w \( s \) phi.alt \( s \)$ is constant for $s > 0$.
  One may justify the pairing by compact cutoffs and then use the Schwartz decay.
  Boundedness of $w$ extends its zero initial trace from compactly supported tests to every Schwartz test;
  $phi.alt \( s \) arrow.r phi.alt \( 0 \)$ in $L^1$ also permits this changing test.
  The constant pairing is therefore zero. Since $psi$ is arbitrary, $w \( t_1 \) = 0$.
  This contradicts $\| u_oo \( 0 \, 1 \) - u_(c \, oo) \( 0 \, 1 \) \| gt.eq epsilon.alt_0$.

We have proved uniform vanishing of the tails of $\( P - P_c \)$ on the unit ball.
  Together with local equicontinuity, the Arzelà–Ascoli criterion for $C_0$ proves (5.13):
  restrict to a large ball, extract there, and use the common small tails to obtain uniform convergence on the
  whole space. The closed radial subspace is preserved.

=== 5.4 A spectral weight and the two-sided recursion <a-spectral-weight-and-the-two-sided-recursion>

For the constant coefficient equation, the moving-coordinate formula on an interval of length $k$ is explicit:

#[#set math.equation(numbering: n => "(5.15)")
 $ \( P_c^k d \) \( zeta \) = e^(- k \/ 2) \( k_(theta_k) * d \) \( e^(- k \/ 4) zeta \) \, wide theta_k = c^2 /
   16 \( 1 - e^(- k) \) \, wide k gt.eq 1 . $ <flat:constant-powers>]

The $L^1$ norm of $k_theta$ is independent of $theta > 0$ by scaling.
  Thus $parallel P_c^k parallel lt.eq C e^(- k \/ 2)$, and the Neumann resolvent series converges for $\|
  lambda \| > e^(- 1 \/ 2)$.

We spell out the spectral consequence of (5.13). On the connected domain $Omega =
  { \| lambda \| > e^(- 1 \/ 2) }$ factor

$ lambda I - P = [I - \( P - P_c \) \( lambda I - P_c \)^(- 1)] \( lambda I - P_c \) . $

The operator subtracted from the identity is compact and analytic in $lambda$.
  The analytic Fredholm alternative implies that $\( lambda I - P \)^(- 1)$ is meromorphic on $Omega$,
  with finite rank principal parts, since it is invertible for large $\| lambda \|$.
  One way to obtain this alternative is to approximate the compact operator at any one parameter by a finite rank
  operator, invert the remaining operator of norm less than one in a neighborhood,
  and reduce invertibility to a finite-dimensional analytic determinant.
  The required approximation is available here: identify radial $E$ with $C_0 \( \[ 0 \, oo \) \)$,
  and use bounded polygonal interpolation operators with compact support,
  which converge strongly to the identity and hence uniformly on compact subsets of $E$.
  The determinant either vanishes identically or has isolated zeros;
  continuation through overlapping neighborhoods and invertibility at a large parameter exclude the first
  alternative. The same reduction makes every coefficient of a pole finite rank.
  It follows that the spectrum in $Omega$ consists of isolated eigenvalues of finite algebraic multiplicity,
  with no accumulation inside $Omega$; these are the usual compact-operator and resolvent arguments of
  #cite(label("Kato1995")) Chapter VII, Section 1.3, and the supplementary notes.

Choose

#[#set math.equation(numbering: n => "(5.16)")
 $ e^(- 1 \/ 2) < q < 1 \, wide { \| lambda \| = q } ∩ "spec" \( P \) = diameter \, wide gamma = -
   log q in \( 0 \, 1 / 2 \) \, wide delta = 2 gamma . $ <flat:weight-choice>]

Such a circle exists by the discreteness just proved. There are only finitely many eigenvalues outside it:
  they lie in a bounded closed annulus contained in $Omega$.
  Let $Pi_u$ be their summed Riesz projection, defined by resolvent integration around these eigenvalues,
  and put $Pi_s = I - Pi_u$. The resolvent identity gives commuting projections and the invariant decomposition

$ E = E_s xor E_u \, wide E_s = Pi_s E \, quad E_u = Pi_u E \, wide P_s = P \|_(E_s) \, quad P_u = P \|_(E_u) . $

The space $E_u$ is finite dimensional, $P_u$ is invertible,
  and the two restricted spectra lie strictly inside and strictly outside the chosen circle, respectively.
  If $E_u = { 0 }$, all terms involving it below are omitted.
  Compactness of the restricted spectra and the spectral radius formula give numbers $r_s < q < r_u$ such that

#[#set math.equation(numbering: n => "(5.17)")
 $ parallel P_s^k parallel lt.eq C r_s^k \, wide parallel P_u^(- k) parallel lt.eq C r_u^(- k) \, wide k gt.eq
   0 . $ <flat:dichotomy-bounds>]

For example choose $r_s$ strictly between $r \( P_s \)$ and $q$,
  and $r_u$ strictly between $q$ and the smallest modulus of an eigenvalue of $P_u$;
  the spectral radius formula controls all sufficiently large powers,
  and their finitely many predecessors are absorbed in $C$.
  The projections commute with complex conjugation because the enclosed spectral sets are invariant under conjugation.

Fix this $delta$. If $M = parallel f parallel_Y$, the source weight gives the exact estimate

#[#set math.equation(numbering: n => "(5.18)")
 $ \| f^(\#) \( zeta \, tau \) \| lt.eq M rho^delta \( 1 + \| zeta \|^2 \)^(- 3 + delta) =
   M e^(- gamma tau) \( 1 + \| zeta \|^2 \)^(- 3 + delta) . $ <flat:source-decay>]

Indeed $sigma^2 = rho \( 1 + \| zeta \|^2 \)$ and $rho^3 sigma^(p_0 - 4) =
  rho^delta \( 1 + \| zeta \|^2 \)^(- 3 + delta)$. This proves that $f^(\#) \( tau \) in E$.
  It also proves continuity with values in $E$: on any compact $tau$ interval its spatial tails are uniformly
  small by (5.18), while on a fixed spatial ball local Hölder continuity of $f$ and smoothness of the change of
  coordinates give uniform continuity in $tau$.

Let the one-step source increments be

$ l_j = integral_0^1 S \( 1 - s \) f^(\#) \( j + s \) thin upright(d) s \, wide j in bb(Z) . $

Then $parallel l_j parallel_E lt.eq C M q^j$. Define

#[#set math.equation(numbering: n => "(5.19)")
 $ v_j = sum_(k = 0)^oo P_s^k Pi_s l_(j - 1 - k) - sum_(k = 0)^oo P_u^(- k - 1) Pi_u l_(j + k) .
   $ <flat:recursion-solution>]

Both series converge absolutely for every integer $j$. More explicitly, their norms are at most

$ C M q^j [q^(- 1) sum_(k = 0)^oo \( r_s \/ q \)^k + r_u^(- 1) sum_(k = 0)^oo \( q \/ r_u \)^k] lt.eq C' M q^j . $

Shifting the summation indices proves $v_(j + 1) = P v_j + l_j$.
  On $\[ j \, j + 1 \]$ define $v$ by (5.12) with initial value $v_j$. The definitions agree at the endpoints and give

#[#set math.equation(numbering: n => "(5.20)")
 $ parallel v \( tau \) parallel_E lt.eq C M e^(- gamma tau) \, wide \| V \( z \, t \) \| lt.eq
   C M rho^(- 1 + delta) . $ <flat:preliminary-bound>]

The continuous joining creates no distributional time-boundary term, so (5.4) holds across every joined face.
  Interior regularity makes it a classical equation there. The construction is linear and real on real sources.
  The second sum in (5.19) selects the outside spectral components using future forcing;
  its use is permitted precisely because no initial values have been imposed.

=== 5.5 The full weighted parabolic estimate <the-full-weighted-parabolic-estimate>

We finish by strengthening (5.20) to the $X$ estimate. This step uses $delta > 0$ as well as $delta < 1$.
  For a box centered at $\( z_0 \, t_0 \)$ with $r_0^2 = \| z_0 \|^2 lt.eq rho_0$,
  one has $sigma_0^2 asymp rho_0$. On a fixed enlargement of this box,
  chosen small in units $\( sigma_0 \, sigma_0^4 \)$, the time stays strictly negative, $rho asymp rho_0$,
  and $\| z \|^2 \/ rho$ stays bounded. In these units the coefficients $A$ and $sigma_0^4
  B$ have bounded derivatives of every fixed order, and the principal coefficient has a uniform positive lower
  bound. The source has scaled $C^alpha$ norm at most $C M$, after division by $sigma_0^(p_0 - 4)$. Also

$ \| V \| lt.eq C M rho_0^(- 1 + delta) lt.eq C' M sigma_0^(p_0) . $

Lemma 13, with the fixed preceding-time enlargement, therefore gives the required full $X$ bound on every such box.

For the remaining boxes a separate estimate restores the spatial weight. Fix $a > 0$ and write

$ z = a y \, wide t = a^4 s \, wide U \( y \, s \) = a^(- p_0) V \( a y \, a^4 s \) \, wide g \( y \, s \) =
  a^(4 - p_0) f \( a y \, a^4 s \) . $

Use the fixed annuli

$ cal(U) = { 1 / 2 < \| y \| < 2 } \, wide cal(U)' = { 3 / 4 < \| y \| < 5 / 4 } . $

On $cal(U) times \( - 4 \, 0 \)$ the rescaled equation is

#[#set math.equation(numbering: n => "(5.21)")
 $ U_s + frac(G \( \| y \|^2 \/ sqrt(- s) \)^2, 16) Delta_y^2 U + frak(b) \( y \, s \) U = g \, wide
   frak(b) \( y \, s \) = \( - s \)^(- 1) B_f #scale(x: 120%, y: 120%)[\(] y \/ \( - s \)^(1 \/ 4)
   #scale(x: 120%, y: 120%)[\)] . $ <flat:annular-equation>]

All coefficients are independent of $a$. Their smooth bounds remain uniform as $s arrow.t 0$.
  To verify the assertion for the zeroth order term explicitly, put $Y = \| y \|^2 \/ sqrt(- s)$ and use

$ frak(b) \( y \, s \) = - \( - s \)^(- 1) frac(Y G' \( Y \), G \( Y \)) . $

The expansion of $G$ in powers of $Y^(- 2)$ gives an expansion of $- Y G' \/ G$ starting at $Y^(- 2)$.
  Since $Y^(- 2) = \( - s \) \/ \| y \|^4$, division by $- s$ leaves a smooth expansion in nonnegative integral
  powers of $- s$. Differentiated remainders of arbitrarily high order show that both this coefficient and the
  principal coefficient extend smoothly to $s = 0$ on the annulus.
  Away from $s = 0$ their bounds follow from ordinary smoothness of $G$.
  The principal coefficient stays uniformly positive throughout.

Furthermore

$ frac(sigma \( a y \, a^4 s \), a) = #scale(x: 120%, y: 120%)[\(] \| y \|^2 +
  sqrt(- s) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) $

is bounded above and below on the larger annular slab. A fixed covering by the local boxes of Definition 12
  therefore gives $parallel g parallel_(C^alpha \( cal(U) times \( - 4 \, 0 \) \)) lt.eq C M$.
  Here and below the norm is parabolic; pairs outside a common small box are controlled by the supremum bound and
  their fixed positive separation.

The preliminary estimate becomes

$ \| U \( y \, s \) \| lt.eq C M \( - s \)^(\( - 1 + delta \) \/ 2) \, $

with no factor of $a$: indeed $a^(- p_0) \( a^2 sqrt(- s) \)^(- 1 + delta) = \( - s \)^(\( - 1 + delta \) \/ 2)$.
  Consequently

#[#set math.equation(numbering: n => "(5.22)")
 $ parallel U parallel_(L^2 \( cal(U) times \( - 4 \, 0 \) \))^2 lt.eq
   C M^2 \| cal(U) \| integral_0^4 q^(- 1 + delta) thin upright(d) q = C M^2 \| cal(U) \| 4^delta /
   delta < oo . $ <flat:annular-l2>]

The value of $delta$ has already been fixed, so the dependence on $1 \/ delta$ is harmless.

Apply Lemma 14 to (5.21) on nested annuli, with the preceding-time buffer from $- 4$ to $- 2$. It gives

#[#set math.equation(numbering: n => "(5.23)")
 $ sum_(j = 0)^4 parallel D_y^j U parallel_(C^alpha \( cal(U)' times \( - 2 \, 0 \) \)) +
   parallel U_s parallel_(C^alpha \( cal(U)' times \( - 2 \, 0 \) \)) lt.eq C M . $ <flat:annular-full>]

One first applies the estimate with terminal time $b < 0$.
  On each such truncated slab $U$ has finite supremum norm by (5.20); the coefficient, source,
  and $L^2$ bounds above are independent of $b$. Letting $b arrow.t 0$ then proves (5.23),
  including Hölder quotients between times arbitrarily close to zero.
  The estimate uses preceding times and requires no terminal value at $s = 0$.

Finally take an arbitrary remaining center with $r_0^2 > rho_0$ and choose $a = r_0$.
  Its rescaled time satisfies $- 1 < s_0 < 0$ and $1 < sigma_0 \/ a < sqrt(2)$.
  The entire defining $X$ box lies in $cal(U)' times \( - 2 \, 0 \)$ when the fixed box radius $a_0$ is small:
  its spatial radius is at most $sqrt(2) a_0$ and its time radius at most $4 a_0^4$.
  In particular a box near the dividing time $s = - 1$ has the required preceding-time buffer.
  Rescaling (5.23) gives its weighted $X$ norm at most $C M$. The core and annular cases cover all centers.
  Thus $parallel V parallel_X lt.eq C parallel f parallel_Y$, completing the proof of Theorem 18.

== 6 A concentrating solution on the compact manifold <glue:section>

We now correct the flat solution on the auxiliary sphere.
  All functions and operators in this Section are restricted to the $O \( m \) times
  O \( 6 \)$ invariant subspace, where $m = 24$ and $Sigma = S^29 subset bb(R)^24 times bb(R)^6$.
  We use the spaces of Definition 12, on $Sigma times \[ - T \, 0 \)$, with

$ r = sqrt(x) \, wide rho = sqrt(- t) \, wide sigma = \( r^2 + rho \)^(1 \/ 2) \, wide p_0 = - 2 + 2 delta . $

When necessary, a subscript specifies the Hölder exponent or the scale:
  for example, $X_alpha \( s \)$ has weight $p_0$ and scale $s$, and $Y_alpha \( s \)$ has weight $p_0 - 4$.
  Without a specified scale, it is $sigma$. The space $X'_alpha$ includes the parabolic $C^alpha$ norm of every
  spatial derivative of order at most four; only the time derivative is omitted.

#thm([Theorem 6.1.])[
  (Compact realization).  #emph[Let $G$ be the profile of Theorem 6, put
$ h \( y \) = frac(G \( y \) - 1, y) \, wide F \( t \, x \) = rho^(- 1) h \( x \/ rho \) \, $

 and fix $0 < alpha < alpha' < 1$. Choose $delta in \( 0 \, 1 \)$ and the ancient right inverse supplied by
   Theorem 18. For every sufficiently small $epsilon > 0$, there are $T > 0$ and a real invariant function $V in
   X_alpha$ on $Sigma times \[ - T \, 0 \)$ such that $lr(bar.v.double V bar.v.double)_(X'_alpha) lt.eq
   epsilon$ and $H = F + V$ satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ H_t + \( 1 + v_(*) H \)^2 cal(A) H = 0 \, wide v_(*) = x \( 1 - x \) . $ <glue:equation>]

 The function $H$ is smooth on $Sigma times \( - T \, 0 \)$, and there are constants $0 < c_1 < c_2 < oo$,
   independent of $t$, such that
#[#set math.equation(numbering: n => "(6.2)")
 $ c_1 lt.eq 1 + v_(*) H lt.eq c_2 . $ <glue:positive>]

 In particular, $H \( t \, dot.op \)$ is smooth as a function of $x in \[ 0 \, 1 \]$, and
#[#set math.equation(numbering: n => "(6.3)")
 $ V \( t \, 0 \) = O \( rho^(- 1 + delta) \) wide \( t arrow.t 0 \) . $ <glue:center>]

]
] <glue:solution>

We first establish the estimates and the right inverse needed in the proof.
  All constants below may depend on the fixed profile, the exponents, the sphere,
  and the fixed box radius in Definition 12. They do not depend on the localization radius $beta$ or on $T$,
  subject to the restrictions explicitly stated. Changing that fixed box radius to another sufficiently small
  fixed radius changes the norms by uniform constants, by the covering property in Definition 12.

=== 6.1 Background estimates and the compact error <background-estimates-and-the-compact-error>

Write

$ g_c & = 1 + v_(*) F = x + \( 1 - x \) G \( x \/ rho \) \, & A_c & = g_c^2 \, & B_c & = 2 v_(*) g_c cal(A) F \,\
g_f & = 1 + x F = G \( x \/ rho \) \, & A_f & = g_f^2 \, & B_f & = 2 x g_f hat(cal(A)) F . $

Here $B_f$ is in the original flat variables, before the similarity change of variables in Section 5. Set

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(P) = partial_t + A_c cal(A) + B_c \, wide hat(cal(P)) = partial_t + A_f hat(cal(A)) + B_f \, wide E_c =
   F_t + A_c cal(A) F . $ <glue:linearizations>]

The profile equation gives $F_t + A_f hat(cal(A)) F = 0$. Moreover, if

$ mu = min \( 1 \, inf G \) > 0 \, wide M = max \( 1 \, sup G \) \, $

then

#[#set math.equation(numbering: n => "(6.5)")
 $ mu lt.eq g_c lt.eq M . $ <glue:background-positive>]

We make the meaning of all the scaled estimates explicit.
  In a box with center $\( z_0 \, t_0 \)$ and center scale $b = sigma \( z_0 \, t_0 \)$,
  $O_(upright("sc")) \( b^q \)$ means that, for every pair of nonnegative integers $j \, k$,
  the spatial derivatives of order $j$ and time derivatives of order $k$ are bounded by $C_(j \, k)
  b^(q - j - 4 k)$ on that box. The scale $b$ is held fixed when differentiating.
  These bounds also give the corresponding scaled parabolic Hölder bounds of any exponent less than one,
  on slightly smaller boxes. The notation will only be used for smooth background quantities,
  not for arbitrary members of $X$ or $Y$.

#thm([Lemma 6.2.])[
  (Scaled background and mismatch).  #emph[For $0 < T lt.eq 1$, on the compact domain one has
#[#set math.equation(numbering: n => "(6.6)")
 $ F = O_(upright("sc")) \( b^(- 2) \) \, wide cal(A) F = O_(upright("sc")) \( b^(- 6) \) \, wide A_c =
   O_(upright("sc")) \( 1 \) \, wide B_c = O_(upright("sc")) \( b^(- 4) \) \, wide v_(*) =
   O_(upright("sc")) \( b^2 \) . $ <glue:background-bounds>]

 The analogous flat bounds hold in a fixed neighborhood of $r = 0$. In the common coordinates there, write
$ cal(P) - hat(cal(P)) = sum_(\| nu \| lt.eq 4) d_nu \( z \, t \) partial_z^nu . $

 For each $j \, k gt.eq 0$, the rescaled coefficients satisfy
#[#set math.equation(numbering: n => "(6.7)")
 $ b^(4 - \| nu \| + j + 4 k) \| partial_z^j partial_t^k d_nu \| lt.eq C_(j \, k) b^2 . $ <glue:mismatch-coeff>]

 Finally, near $r = 0$,
#[#set math.equation(numbering: n => "(6.8)")
 $ E_c = O_(upright("sc")) \( b^(- 4) \) . $ <glue:error-order>]

 Away from a fixed neighborhood of $r = 0$, all these background quantities extend smoothly to $t =
   0$ with bounds of every finite order.]
] <glue:background>

#proof[
  In the region $r^2 lt.eq C rho$, the formula for $F$, smoothness of $h$ at zero, and the change $z =
    sqrt(rho) thin zeta$ give
  $ \| partial_z^j partial_t^k F \| lt.eq C_(j \, k) rho^(- 1 - j \/ 2 - 2 k) lt.eq
    C'_(j \, k) sigma^(- 2 - j - 4 k) . $
  In the region $r^2 gt.eq rho$, use the differentiable expansion from Theorem 6. For arbitrary $N$ it has the form
  #[#set math.equation(numbering: n => "(6.9)")
   $ F \( t \, r^2 \) = frac(c - 1, r^2) + sum_(ell = 1)^N a_ell frac(\( - t \)^ell, r^(4 ell + 2)) +
     upright("remainder") . $ <glue:outer-expansion>]
  The all-order remainder estimates allow $N$ to be chosen larger than any prescribed number of differentiations.
    Differentiating the displayed terms and the remainder gives $\| partial_z^j partial_t^k F \| lt.eq
    C_(j \, k) r^(- 2 - j - 4 k)$. This proves the first bound and also proves the asserted smooth extension away
    from the core. In particular it supplies time derivative bounds up to the open terminal face,
    which do not follow from spatial decay alone.
  Near the core, write a point of the sphere as $\( z \, sqrt(1 - \| z \|^2) thin theta \)$, $theta in S^5$.
    Invariant functions are independent of $theta$, and on these functions
  #[#set math.equation(numbering: n => "(6.10)")
   $ Delta_Sigma = Delta_z - sum_(i \, j) z_i z_j partial_(i j) - 29 sum_i z_i partial_i . $ <glue:laplace-coordinate>]
  The product coordinates and ordinary sphere coordinates have uniformly controlled transition maps on a fixed
    smaller neighborhood. Thus their scaled norms are uniformly equivalent for the functions considered here.
    Lemma 4 gives
  $ cal(A) = 1 / 16 Delta_Sigma^2 - 37 / 4 Delta_Sigma + 312 \, wide hat(cal(A)) = 1 / 16 Delta_z^2 . $
  In $cal(A) - hat(cal(A))$, the coefficients of orders four, three, and two have sizes $O \( r^2 \)$,
    $O \( r \)$, and $O \( 1 \)$, respectively; those of orders one and zero are smooth and bounded.
    After multiplication by $b^4$ and rescaling space by $b$, every coefficient is $O_(upright("sc")) \( b^2 \)$.
    For example the first three sizes become $O \( r^2 \)$, $O \( b r \)$, and $O \( b^2 \)$, and $r lt.eq b$.
    Differentiating these polynomial coefficients preserves the stated scaled bound.
    The bounds for $cal(A) F$ follow; away from this coordinate neighborhood they follow from the smooth extension
    and the positive lower bound for $sigma$.
  The function $v_(*) = x - x^2$ has size $O_(upright("sc")) \( b^2 \)$, and $v_(*) - x = - x^2 =
    O_(upright("sc")) \( b^4 \)$. Hence
  $ g_c - g_f = - x^2 F = O_(upright("sc")) \( b^2 \) \, wide A_c - A_f = O_(upright("sc")) \( b^2 \) . $
  Products give the remaining bounds in (6.6). For the zeroth-order mismatch, use
  $ B_c - B_f = 2 \( v_(*) g_c - x g_f \) hat(cal(A)) F + 2 v_(*) g_c \( cal(A) - hat(cal(A)) \) F . $
  The two terms have size $O_(upright("sc")) \( b^(- 2) \)$, since $v_(*) g_c - x g_f =
    O_(upright("sc")) \( b^4 \)$ and $\( cal(A) - hat(cal(A)) \) F = O_(upright("sc")) \( b^(- 4) \)$.
    Together with the principal multiplier difference, this proves (6.7) in every derivative order. Finally,
  $ E_c = \( A_c - A_f \) hat(cal(A)) F + A_c \( cal(A) - hat(cal(A)) \) F = O_(upright("sc")) \( b^(- 4) \) \, $
  using the exact flat equation, as required. ◻
]

One consequence that we will use repeatedly is that the local $Y_theta.alt$ size of $E_c$, for either $theta.alt =
  alpha$ or $theta.alt = alpha'$, is at most

#[#set math.equation(numbering: n => "(6.11)")
 $ C b^(6 - 2 delta) b^(- 4) = C b^(2 - 2 delta) $ <glue:error-weight>]

near the core. The same statement holds with any fixed finite number of extra scaled derivatives.
  Globally $lr(bar.v.double E_c bar.v.double)_(Y_theta.alt) lt.eq C$.
  If it is multiplied by a smooth cutoff supported in $r lt.eq
  C_0 beta$ and varying only where $r$ is comparable to $beta$, then, whenever $T lt.eq beta^4$,

#[#set math.equation(numbering: n => "(6.12)")
 $ lr(bar.v.double upright("cutoff") thin E_c bar.v.double)_(Y_theta.alt) lt.eq
   C beta^(2 - 2 delta) . $ <glue:core-error-small>]

Indeed every box meeting this support has $b lt.eq C beta$; cutoff derivatives have bounded scaled size.
  The strict inequality $delta < 1$ is used here.

=== 6.2 Localization of the ancient inverse <localization-of-the-ancient-inverse>

Multiplying a flat correction by a spatial cutoff produces a commutator on the transition annulus.
  This error is bounded but need not be small. We will include its negative in the forcing for the outer forward
  problem, so it cancels in the combined equation. The errors that remain are the geometric mismatch,
  made small by shrinking the core, and the outer cutoff commutator, made small by shortening the time interval.
  The nested cutoffs below ensure that these cancellations are exact.

Choose once and for all a smooth function $chi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$,
  equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$.
  All its compositions below are smooth at $r = 0$ because they are constant there.
  Take $beta > 0$ so small that $r lt.eq 5 beta$ lies in the common coordinate neighborhood above,
  and assume $T lt.eq beta^4$. Define

#[#set math.equation(numbering: n => "(6.13)")
 $ chi_i = chi \( r \/ beta \) \, wide chi_b = chi \( r \/ \( 2 beta \) \) \, wide chi_o = 1 -
   chi \( 2 r \/ beta \) \, wide kappa = 1 - chi \( 4 r \/ beta \) . $ <glue:cutoffs>]

Thus the inner input cutoff $chi_i$ is supported in $r lt.eq 2 beta$;
  the inner output cutoff $chi_b$ is one there and supported in $r lt.eq 4 beta$.
  The outer output cutoff $chi_o$ is zero for $r lt.eq beta \/ 2$ and one for $r gt.eq beta$.
  The coefficient cutoff $kappa$ is already one for $r gt.eq beta \/ 2$ and is zero for $r lt.eq beta \/ 4$.

Figure 1 records these nested regions. In particular, the inner output cutoff is one on the support of the inner
  input, and the modified outer coefficients agree with the compact coefficients where the outer output cutoff can
  be nonzero. The cutoff commutators are supported on the corresponding transition annuli.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.27), (0, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((0, 2.76), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  line((0.96, 0.27), (0.96, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((0.96, 2.76), [#text(size: 9pt)[$beta"/"4$]], anchor: "south", padding: 0.1176cm)
  line((1.92, 0.27), (1.92, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((1.92, 2.76), [#text(size: 9pt)[$beta"/"2$]], anchor: "south", padding: 0.1176cm)
  line((2.88, 0.27), (2.88, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((2.88, 2.76), [#text(size: 9pt)[$beta$]], anchor: "south", padding: 0.1176cm)
  line((4.32, 0.27), (4.32, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((4.32, 2.76), [#text(size: 9pt)[$2 beta$]], anchor: "south", padding: 0.1176cm)
  line((5.76, 0.27), (5.76, 2.76), stroke: (paint: rgb("#d1d1d1"), thickness: 0.4pt, miter-limit: 10))
  content((5.76, 2.76), [#text(size: 9pt)[$4 beta$]], anchor: "south", padding: 0.1176cm)
  line((0, 2.76), (6.528, 2.76), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6.528, 2.76), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  rect((0, 2.292), (6.336, 2.508), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))
  content((-0.24, 2.4), [#text(size: 9pt)[$chi_i$]], anchor: "east", padding: 0.1176cm)
  rect((0, 1.692), (6.336, 1.908), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))
  content((-0.24, 1.8), [#text(size: 9pt)[$chi_b$]], anchor: "east", padding: 0.1176cm)
  rect((0, 1.092), (6.336, 1.308), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))
  content((-0.24, 1.2), [#text(size: 9pt)[$chi_o$]], anchor: "east", padding: 0.1176cm)
  rect((0, 0.492), (6.336, 0.708), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))
  content((-0.24, 0.6), [#text(size: 9pt)[$kappa$]], anchor: "east", padding: 0.1176cm)
  rect((0, 2.292), (2.88, 2.508), fill: rgb("#28536f"), stroke: (paint: rgb("#28536f"), thickness: 0.4pt, miter-limit: 10))
  rect((2.88, 2.292), (4.32, 2.508), fill: black, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, 1.692), (4.32, 1.908), fill: rgb("#28536f"), stroke: (paint: rgb("#28536f"), thickness: 0.4pt, miter-limit: 10))
  rect((4.32, 1.692), (5.76, 1.908), fill: black, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.92, 1.092), (2.88, 1.308), fill: black, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.88, 1.092), (6.336, 1.308), fill: rgb("#28536f"), stroke: (paint: rgb("#28536f"), thickness: 0.4pt, miter-limit: 10))
  rect((0.96, 0.492), (1.92, 0.708), fill: black, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.92, 0.492), (6.336, 0.708), fill: rgb("#28536f"), stroke: (paint: rgb("#28536f"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.288, -0.078), (0.144, 0.078), fill: rgb("#28536f"), stroke: (paint: rgb("#28536f"), thickness: 0.4pt, miter-limit: 10))
  content((0.2112, 0), [#text(size: 9pt)[identically $1$]], anchor: "west", padding: 0.1176cm)
  rect((2.256, -0.078), (2.688, 0.078), fill: black, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((2.755, 0), [#text(size: 9pt)[may vary]], anchor: "west", padding: 0.1176cm)
  rect((4.656, -0.078), (5.088, 0.078), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10))
  content((5.155, 0), [#text(size: 9pt)[identically $0$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The cutoff regions in (6.13). Distances are schematic. Solid bands indicate the value one, blank bands the value zero, and hatched bands the intervals where a cutoff may vary in $\[ 0 \, 1 \]$; no shape or monotonicity of the transition is assumed. ],
) <fig:cutoffs>

#thm([Lemma 6.3.])[
  (Extension of the inner source).  #emph[There is a real linear extension $cal(E)_i : Y_alpha arrow.r
    Y_alpha \( bb(R)^m times \( - oo \, 0 \) \)$, uniformly bounded for $T lt.eq beta^4$,
    which equals $chi_i f$ in flat coordinates for $- T lt.eq t < 0$, and is supported spatially in $r lt.eq 2 beta$.]
] <glue:extension>

#proof[
  Put $f_i = chi_i f$, view it in the flat coordinates, and extend it by zero beyond their neighborhood.
    The spatial extension is bounded because the cutoff vanishes before the boundary of that neighborhood.
    The $Y_alpha$ norm gives a spatial $C^alpha$ trace $f_i \( - T \, z \)$ at the lower time face.
    Choose a smooth $psi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ equal to one near zero and zero for arguments at
    least one. For $t < - T$ set
  #[#set math.equation(numbering: n => "(6.14)")
   $ \( cal(E)_i f \) \( t \, z \) = f_i \( - T \, z \) thin psi (frac(- t - T, \( \| z \|^2 + sqrt(T) \)^2)) .
     $ <glue:extension-formula>]
  Let $b_0 = \( \| z \|^2 + sqrt(T) \)^(1 \/ 2)$. Wherever this expression is nonzero,
  $ T lt.eq - t lt.eq T + b_0^4 \, wide b_0^2 lt.eq \| z \|^2 + sqrt(- t) lt.eq \( 1 + sqrt(2) \) b_0^2 . $
  The ancient scale is therefore comparable to $b_0$. The argument of $psi$ has bounded derivatives in spatial
    units $b_0$ and temporal units $b_0^4$ on its transition region.
    The trace norm, Hölder multiplication, and scale comparability prove the required estimate below $- T$.
    Across that face the values agree. Splitting a temporal increment at $-
    T$ bounds its $alpha \/ 4$ Hölder quotient by the sum of the two one-sided bounds;
    a spatial increment is handled by the trace bound on comparable boxes.
    This proves the full parabolic $C^alpha$ bound. No time derivative of the source is required.
    The construction is real, linear, and radial. Its continuation below $- T$ is in fact supported in $-
    26 beta^4 lt.eq t < - T$, though a temporal support restriction is unnecessary for the ancient inverse. ◻
]

Apply Theorem 18 to obtain

$ W_f = hat(D) cal(E)_i f \, wide V_i = chi_b W_f \, $

where $V_i$ is regarded as a function on the sphere and extended by zero.
  Invariant norm equivalence and the cutoff bounds give $lr(bar.v.double V_i bar.v.double)_(X_alpha) lt.eq
  C lr(bar.v.double f bar.v.double)_(Y_alpha)$. Define

#[#set math.equation(numbering: n => "(6.15)")
 $ R_i f = \( cal(P) - hat(cal(P)) \) \( chi_b W_f \) \, wide
   J_i f = \[ hat(cal(P)) \, chi_b \] W_f . $ <glue:inner-errors>]

Both expressions are taken in the common coordinates and extended by zero.
  Since $chi_b f_i = f_i$, the exact identity is

#[#set math.equation(numbering: n => "(6.16)")
 $ cal(P) V_i = f_i + R_i f + J_i f . $ <glue:inner-identity>]

Lemma 20 and $b lt.eq C beta$ on the relevant boxes give

#[#set math.equation(numbering: n => "(6.17)")
 $ lr(bar.v.double R_i f bar.v.double)_(Y_alpha) lt.eq C beta^2 lr(bar.v.double f bar.v.double)_(Y_alpha) \, wide
   lr(bar.v.double J_i f bar.v.double)_(Y_alpha) lt.eq C lr(bar.v.double f bar.v.double)_(Y_alpha) .
   $ <glue:inner-error-bounds>]

Here $R_i f$ is supported in $r lt.eq 4 beta$, and $J_i f$ in $2 beta lt.eq r lt.eq 4 beta$.
  The commutator has order at most three; on its support $b$ is comparable to $beta$,
  so every derivative of $chi_b$ is uniformly bounded in scale units.
  The definition of $R_i$ includes the mismatch applied to the cutoff itself,
  and hence accounts for all mixed cutoff and mismatch terms.

=== 6.3 The outer Cauchy problem and the exact right inverse <the-outer-cauchy-problem-and-the-exact-right-inverse>

Set

$ s_beta = max \( beta \, r \) \, wide eta = T \/ beta^4 \, $

and use the nonsingular weighted spaces with scale $s_beta$.
  Equivalently one can use the smooth comparable scale $\( beta^2 + r^2 \)^(1 \/ 2)$;
  the norms and all following estimates are uniformly equivalent. Define a modified operator on the entire sphere by

#[#set math.equation(numbering: n => "(6.18)")
 $ cal(P)_beta = partial_t + A_beta cal(A) + B_beta \, wide A_beta = kappa A_c + \( 1 - kappa \) \, wide B_beta =
   kappa B_c . $ <glue:modified-operator>]

Its principal multiplier is bounded above and below by positive constants, and $cal(P)_beta = cal(P)$ for $r gt.eq
  beta \/ 2$. Lemma 20 shows, for every $j \, k$, uniform bounds for the derivatives of $A_beta$ and $s_beta^4
  B_beta$ in units $\( s_beta \, s_beta^4 \)$, with the scale fixed at the center of each box.
  On the transition annulus $r asymp beta$ these are exactly its scaled background bounds and the cutoff bounds.
  Inside $r lt.eq beta \/ 4$ the coefficients are $1$ and $0$;
  outside the transition they are the original coefficients with $sigma asymp s_beta$.
  The sphere coefficients of $cal(A)$ also have uniform bounds in these units.
  These facts verify all coefficient and ellipticity hypotheses of Lemma 15, uniformly for $eta lt.eq 1$.

The outer source is

#[#set math.equation(numbering: n => "(6.19)")
 $ f_o = f - f_i - J_i f . $ <glue:outer-source>]

It vanishes for $r < beta$ and has

#[#set math.equation(numbering: n => "(6.20)")
 $ lr(bar.v.double f_o bar.v.double)_(Y_alpha \( s_beta \)) lt.eq
   C lr(bar.v.double f bar.v.double)_(Y_alpha) . $ <glue:outer-source-bound>]

Indeed $s_beta asymp sigma$ on its support and on every sufficiently small box meeting that support.
  The latter assertion follows from the Lipschitz bound for $r$ and the box radius $a_0 sigma$;
  it also handles boxes crossing a support boundary. The same comparison holds for outputs supported in $r gt.eq
  beta \/ 2$.

For each fixed $beta \, T$, solve the closed-manifold Cauchy problem

#[#set math.equation(numbering: n => "(6.21)")
 $ cal(P)_beta Z_o = f_o \, wide Z_o \( - T \) = 0 . $ <glue:outer-cauchy>]

The modified coefficients extend smoothly to $t = 0$ by (6.9), and $f_o$ extends Hölder continuously there:
  for fixed $beta$ its nonsingular weighted norm is an ordinary Hölder bound on a compact cylinder.
  Thus the solvability assertion in Lemma 15 applies, or one may solve on truncated cylinders and use its uniform
  bounds. Uniqueness makes $Z_o$ invariant and the solution operator real linear.

Choose a fixed $eta_0 > 0$ small enough for Lemma 15 at both exponents $alpha$ and $alpha'$.
  That Lemma gives, for $0 < eta lt.eq eta_0$,

#[#set math.equation(numbering: n => "(6.22)")
 $ lr(bar.v.double Z_o bar.v.double)_(X_alpha \( s_beta \)) & lt.eq
   C lr(bar.v.double f_o bar.v.double)_(Y_alpha \( s_beta \)) \,\
sup s_beta^(- p_0) \| Z_o \| & lt.eq C eta lr(bar.v.double f_o bar.v.double)_(Y_alpha \( s_beta \)) .
  $ <glue:outer-bound>]

The constants are uniform in $beta \, T$ by the coefficient and scale bounds verified above.
  The small parameter in Lemma 15 is precisely $eta = T \/ beta^4$, since $inf s_beta = beta$.
  That lemma applies to zero initial data even when $f_o \( - T \)$ is nonzero.

Put $V_o = chi_o Z_o$. On the support of this product the coefficients have already become those of $cal(P)$,
  and $chi_o f_o = f_o$. Consequently

#[#set math.equation(numbering: n => "(6.23)")
 $ cal(P) V_o = f_o + J_o f \, wide J_o f = \[ cal(P)_beta \, chi_o \] Z_o . $ <glue:outer-identity>]

This commutator is supported in $beta \/ 2 lt.eq r lt.eq beta$ and involves spatial derivatives of $Z_o$ of order
  at most three. For these derivatives, Lemma 16 and (6.22)–(6.22) give the scaled parabolic $C^alpha$ bound $C
  eta^(\( 1 - alpha \) \/ 4) lr(bar.v.double f_o bar.v.double)_(Y_alpha \( s_beta \))$.
  Since $s_beta asymp sigma asymp beta$ on the commutator annulus,

#[#set math.equation(numbering: n => "(6.24)")
 $ lr(bar.v.double J_o f bar.v.double)_(Y_alpha) lt.eq C eta^(\( 1 - alpha \) \/ 4)
   lr(bar.v.double f bar.v.double)_(Y_alpha) . $ <glue:outer-error-small>]

In particular, no fourth derivative needs to be made small for this commutator estimate.

#thm([Proposition 6.4.])[
  (Uniform compact right inverse).  #emph[There are $beta_0 \, eta_0 \, C_D > 0$ such that, for $0 < beta lt.eq
    beta_0$ and $0 < T lt.eq eta_0 beta^4$, the operator $cal(P)$ has a real invariant right inverse $D :
    Y_alpha arrow.r X_alpha$ with $lr(bar.v.double  bar.v.double) D lt.eq C_D$.
    No initial value is prescribed for $D f$.]
] <glue:inverse>

#proof[
  Define
  $ D_(upright("app")) f = V_i + V_o \, wide cal(R) = R_i + J_o . $
  Equations (6.16), (6.19), and (6.23) give the exact operator identity
  #[#set math.equation(numbering: n => "(6.25)")
   $ cal(P) D_(upright("app")) = I + cal(R) \, wide
     lr(bar.v.double D_(upright("app")) bar.v.double)_(Y_alpha arrow.r X_alpha) lt.eq C \, wide
     lr(bar.v.double cal(R) bar.v.double)_(Y_alpha arrow.r Y_alpha) lt.eq C #scale(x: 120%, y: 120%)[\(] beta^2 +
     eta^(\( 1 - alpha \) \/ 4) #scale(x: 120%, y: 120%)[\)] . $ <glue:parametrix>]
  Choose $beta_0$ and then $eta_0$ small enough that the last bound is at most $1 \/
    2$ throughout the asserted range, decreasing the earlier $eta_0$ if necessary. The convergent Neumann series defines
  #[#set math.equation(numbering: n => "(6.26)")
   $ D = D_(upright("app")) \( I + cal(R) \)^(- 1) . $ <glue:neumann>]
  It satisfies $cal(P) D = I$, is real and invariant, and has uniform norm at most twice the bound for
    $D_(upright("app"))$. This is a right inverse construction and requires no assertion of injectivity. ◻
]

=== 6.4 Smallness of the corrected error <smallness-of-the-corrected-error>

The right inverse need not have small norm. What is needed for the nonlinear problem is its small value on the
  particular error $E_c$ in the weaker space $X'_alpha$.

#thm([Lemma 6.5.])[
  #emph[For the right inverses of Proposition 22,
#[#set math.equation(numbering: n => "(6.27)")
 $ lr(bar.v.double D E_c bar.v.double)_(X'_alpha) lt.eq
   C (beta^(2 - 2 delta) + eta^(\( alpha' - alpha \) \/ 4) + eta^(\( 1 - alpha \) \/ 4)) . $ <glue:DE-small>]

 In particular this norm becomes arbitrarily small by choosing $beta$ and then $eta = T \/ beta^4$ sufficiently small.]
] <glue:special-error>

#proof[
  Use the inner output cutoff, rather than the inner input cutoff, to split
  $ E_c = f_c + f_e \, wide f_c = chi_b E_c \, wide f_e = \( 1 - chi_b \) E_c . $
  Equation (6.12) gives $lr(bar.v.double D f_c bar.v.double)_(X_alpha) lt.eq C beta^(2 - 2 delta)$.
    The remaining source vanishes for $r lt.eq 2 beta$, so $chi_i f_e = 0$ exactly.
    Its inner extension, flat correction, $R_i f_e$, and $J_i f_e$ all vanish.
    Thus $D_(upright("app")) f_e$ consists solely of the outer zero-data solution for source $f_e$,
    followed by multiplication by $chi_o$, and $cal(R) f_e = J_o f_e$.
  The extra regularity in Lemma 20 gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ lr(bar.v.double f_e bar.v.double)_(Y_(alpha') \( s_beta \)) lt.eq C . $ <glue:outer-error-high>]
  The constant is uniform in $beta \, T$: in the transition annulus all cutoff derivatives have bounded scaled
    size, and elsewhere this is (6.11) or the fixed exterior smooth bound.
    Apply Lemma 15 at exponent $alpha'$ to the outer zero-data problem with source $f_e$.
    The coefficient bounds hold at that exponent, so its solution has uniformly bounded $X_(alpha') \( s_beta \)$
    norm. Equation (4.15) of Lemma 16 gives an $X'_alpha \( s_beta \)$ bound of $C
    eta^(\( alpha' - alpha \) \/ 4)$. Multiplication by $chi_o$ is bounded in these scaled spaces,
    and $s_beta$ is comparable to $sigma$ on the output support.
    This proves the first estimate below; the commutator bound (6.24) proves the second:
  #[#set math.equation(numbering: n => "(6.29)")
   $ lr(bar.v.double D_(upright("app")) f_e bar.v.double)_(X'_alpha) lt.eq C eta^(\( alpha' - alpha \) \/ 4) \,
     wide lr(bar.v.double cal(R) f_e bar.v.double)_(Y_alpha) lt.eq
     C eta^(\( 1 - alpha \) \/ 4) . $ <glue:app-special-small>]
  The first estimate includes the temporal Hölder seminorms of all spatial derivatives through order four,
    as supplied by (4.15). It makes no claim that the first time derivative is small:
    the outer zero-data solution has time derivative $f_e$ at the initial face.
  Finally, (6.26) gives $D \( I + cal(R) \) = D_(upright("app"))$, so
  #[#set math.equation(numbering: n => "(6.30)")
   $ D f_e = D_(upright("app")) f_e - D cal(R) f_e . $ <glue:special-neumann-identity>]
  The uniform bound for $D$ and (6.29) prove the desired estimate for $f_e$.
    Combining it with the estimate for $f_c$ proves (6.27). ◻
]

=== 6.5 The nonlinear correction and finite-time obstruction <the-nonlinear-correction-and-finite-time-obstruction>

#proof[
  Expanding (6.1) at $F$ gives
  #[#set math.equation(numbering: n => "(6.31)")
   $ cal(P) V + E_c + N \( V \) = 0 \, $ <glue:nonlinear-equation>]
  where
  #[#set math.equation(numbering: n => "(6.32)")
   $ N \( V \) = v_(*)^2 V^2 cal(A) F + #scale(x: 120%, y: 120%)[\(] 2 v_(*) g_c V +
     v_(*)^2 V^2 #scale(x: 120%, y: 120%)[\)] cal(A) V . $ <glue:nonlinearity>]
  This expression contains only spatial derivatives of $V$, so is defined on $X'_alpha$.
    For clarity, on a box of scale $b$, a function with $lr(bar.v.double V bar.v.double)_(X'_alpha) lt.eq
    epsilon$ has scaled sizes
  $ V = O \( epsilon b^(- 2 + 2 delta) \) \, wide cal(A) V = O \( epsilon b^(- 6 + 2 delta) \) \, $
  where these statements include the scaled parabolic $C^alpha$ norms.
    By Lemma 20, the two quadratic terms in (6.32) therefore have size $C epsilon^2 b^(- 6 + 4 delta)$,
    and the cubic term has size $C epsilon^3 b^(- 6 + 6 delta)$.
    Relative to the $Y$ weight these gain $b^(2 delta)$ and $b^(4 delta)$, respectively.
    Since $b$ is bounded above on the compact domain, Hölder multiplication and the factorization of differences
    of products give uniform bounds
  #[#set math.equation(numbering: n => "(6.33)")
   $ lr(bar.v.double N \( V \) bar.v.double)_(Y_alpha) & lt.eq C_N \( epsilon^2 + epsilon^3 \) \,\
lr(bar.v.double N \( V \) - N \( W \) bar.v.double)_(Y_alpha) & lt.eq
  C_N \( epsilon + epsilon^2 \) lr(bar.v.double V - W bar.v.double)_(X'_alpha) $ <glue:nonlinear-size>]
  on the closed ball of radius $epsilon$ in $X'_alpha$. The fixed sphere coefficients in $cal(A)$ have bounded
    rescaled norms, so these estimates apply on the whole sphere, including the other endpoint $x = 1$.
  We specify the parameter choices to avoid a dependence on an inverse norm that is still being chosen.
    First fix the profile, exponents, flat inverse, and the constants $beta_0 \, eta_0 \, C_D$ of Proposition 22.
    The nonlinear constant $C_N$ is uniform throughout this parameter range.
    Choose the requested ball radius $epsilon > 0$ so small that
  $ C_D C_N \( epsilon + epsilon^2 \) lt.eq 1 / 4 \, wide C_(*) epsilon lt.eq 1 / 2 mu \, $
  where $C_(*)$ bounds $\| v_(*) V \| \/ lr(bar.v.double V bar.v.double)_(X'_alpha)$ uniformly.
    Such a $C_(*)$ exists because $v_(*) V$ has scaled size $C epsilon b^(2 delta)$ and $b lt.eq sqrt(2)$.
    Now take $beta lt.eq beta_0$ sufficiently small, and next $eta lt.eq
    min \( eta_0 \, a_0^4 \)$ sufficiently small, that Lemma 23 gives
    $lr(bar.v.double D E_c bar.v.double)_(X'_alpha) lt.eq epsilon \/ 2$; put $T = eta beta^4$.
  The map
  $ cal(T) \( V \) = - D E_c - D N \( V \) $
  takes the closed $X'_alpha$ ball of radius $epsilon$ into itself by (6.33), and is a contraction by (6.33).
    The real invariant subspace is closed, so the Banach fixed point theorem gives a real invariant fixed point
    there. Its fixed point identity also shows that this same $V$ belongs to $X_alpha$, because $E_c +
    N \( V \) in Y_alpha$ and $D : Y_alpha arrow.r X_alpha$. Applying $cal(P) D =
    I$ therefore yields (6.31) in the classical Hölder sense and proves (6.1).
    This recovers the time derivative after the contraction has been performed.
  By (6.5) and the radius choice,
  $ 1 / 2 mu lt.eq 1 + v_(*) \( F + V \) lt.eq M + 1 / 2 mu \, $
  which proves (6.2). On each compact time subinterval of $\( - T \, 0 \)$, the weight is bounded above and below,
    and the equation for $H$ is a uniformly parabolic scalar equation with principal multiplier
    $\( 1 + v_(*) H \)^2$. Its current regularity is $C^(4 + alpha \, 1 + alpha \/ 4)$.
    Interior spatial difference quotients in this equation have the same principal operator;
    their sources are bounded in $C^alpha$ because the coefficient is a smooth function of $x \,
    H$ and $H$ already has four spatial derivatives. The interior estimate of Lemma 13,
    followed by passage to the difference-quotient limit on a smaller cylinder, gains one spatial derivative.
    Repetition gains every spatial derivative. The equation then gives corresponding spatial bounds for $H_t$;
    differentiating the equation in time and repeating the interior estimates gives all mixed derivatives.
    Thus $H$ is smooth on $Sigma times \( - T \, 0 \)$. Invariant smoothness gives smoothness in $x
    in \[ 0 \, 1 \]$ by Lemma 4. At $x = 0$, the $X'$ weight reads
  $ \| V \( t \, 0 \) \| lt.eq epsilon sigma \( t \, 0 \)^(- 2 + 2 delta) = epsilon rho^(- 1 + delta) \, $
  up to the fixed equivalent-norm constant. This proves (6.3) and finishes the construction. ◻
]

#proof[
  Apply Theorem 19 to the nonconstant profile of Theorem 6.
    Proposition 3 turns the smooth positive coefficient $H$ into a Calabi flow in the Fubini–Study class on
    $bb(C P)^10$. Choose its slice at $t = - T \/ 2$ as the initial metric and translate time so that this slice
    has time zero. It is a smooth Kähler metric in a class containing the Fubini–Study metric.
    At the distinguished point,
  $ H \( t \, 0 \) = rho^(- 1) G' \( 0 \) + O \( rho^(- 1 + delta) \) \, wide G' \( 0 \) < 0 . $
  Lemma 5 shows that the maximal smooth existence time is exactly $T_(*) = T \/ 2$ and that, in the elapsed time $tau$,
  $ S \( omega \( tau \) \) \( p \) tilde.op a \( T_(*) - tau \)^(- 1 \/ 2) \, wide a = - 110 G' \( 0 \) > 0 . $
  The metric is $U \( 10 \)$ invariant by the radial reconstruction. These are all the assertions of Theorem 1. ◻
]

#proof[
  For a product metric the determinant factors and the inverse is block diagonal, so scalar curvatures add.
    The product volume form also shows that their averages add. Writing $c_eta = S \( eta \)$, we obtain
  $ S \( Omega \( t \) \) = pi_X^(*) S \( omega \( t \) \) + c_eta \, wide macron(S)_Omega = macron(S)_omega + c_eta . $
  Thus $pi_X^(*) phi.alt \( t \)$, initially zero, satisfies (1.1) for $Omega_0$.
    Smooth local uniqueness #cite(label("ChenHe2008")) Theorem 3.2 identifies this explicit solution with the
    unrestricted flow on $\[ 0 \, T_(*) \)$. The displayed scalar-curvature identity gives the stated asymptotic.
    A smooth extension across $T_(*)$ would have bounded scalar curvature on the compact product,
    so the maximal time is exactly $T_(*)$.
  For the final assertion put $m = n - 10$. When $m > 0$, choose $Y = bb(C P)^m$ and $eta =
    frac(m + 1, 11) omega_(upright("FS") \, m)$. In our normalization,
    $"Ric" \( omega_(upright("FS") \, j) \) = \( j + 1 \) omega_(upright("FS") \, j)$.
    Constant scaling leaves the Ricci form unchanged, so $omega_(upright("FS") \, 10)$ and $eta$ both have
    Einstein constant $11$. Their product form is therefore Kähler–Einstein and lies in $\[ Omega_0 \]$.
    For $m = 0$, use Theorem 1 itself, with the second factor a point. ◻
]

== 7 Certification of the finite shooting calculation <cert:appendix>

This Appendix proves the finite part of the shooting argument.
  The calculation uses integer interval arithmetic, Taylor expansion on complex disks,
  and a separate estimate for the nonlinear dependence on the shooting parameters.
  Every terminating decimal in this Appendix denotes its exact rational value.

#thm([Proposition 7.1.])[
  (Finite shooting bounds).  #emph[For every parameter $z_(*) in \[ - R \, R \]^2$, where $R =
    5 dot.op 10^(- 10)$, let $\( k \, d \)$ be given by (3.6),
    and let $p$ be the origin solution of (3.5) supplied by Lemma 7.
    This solution extends to $0 lt.eq s lt.eq S_0 = 56$ and satisfies
$ 1 + p \( s \) > 0 . $

 For the coordinates of its jet relative to $p_(upright(a))$, defined in (3.12), one has
#[#set math.equation(numbering: n => "(7.1)")
 $ \| q \| lt.eq .25 R \, wide parallel \( Re xi \, Im xi \) - z_(*) parallel_oo lt.eq .13 R . $ <cert:conclusion>]

]
] <cert:shoot>

The proof compares the entire family of shots with a sequence of reference trajectories at the central parameter
  $d = d_0$. The state is $\( p \, p' \, p'' \, d \)$, with $d' = 0$.
  We divide $\[ 1 \, 56 \]$ into finitely many blocks. On each block,
  the reference trajectory is the exact solution starting from a rounded three-component jet at its left endpoint.
  At the right endpoint, an interval enclosure supplies the rounded starting jet for the next block.
  Thus successive reference trajectories may have small jumps at block boundaries;
  their size is included in the error estimate.

The interval calculation encloses the reference endpoint jets and the first-variation matrices of the
  four-component state across each block. Products of these matrices give a linear prediction for the effect of
  the two shooting parameters through all blocks. Rounding the reference jets and variation matrices introduces
  separate errors. A perturbation estimate compares products of the rounded variation matrices with the exact
  transfers and bounds the propagation of those errors. The origin series supplies the initial central jet,
  its two parameter variations, and a bound for the nonlinear parameter remainder.

It remains to compare these linear predictions with the actual solutions for every $z_(*) in \[ - R \, R \]^2$.
  The only nonlinear term in the state equation depends on $p$;
  its remainder after linearization is quadratic in the difference from the reference value.
  A uniform bootstrap bounds this remainder using the certified positive lower bounds for $1 +
  p$ along the reference trajectories and the transfer estimates.
  It proves continuation and positivity for the whole shooting family and bounds its endpoint error.
  Projecting the endpoint jets into the matching coordinates then gives (7.1).

We use the maximum norm on vectors and the induced maximum row-sum norm on matrices,
  including rectangular matrices. For a $4 times 4$ matrix, its superscript $\( 3 \)$ denotes its leading $3 times
  3$ block. We first describe the interval arithmetic and the series recurrences,
  then justify their analytic enclosures and the separate nonlinear comparison.

=== 7.1 Integer intervals and the two series recurrences <cert:arithmetic>

Put $Q_(upright("int")) = 2^256$. An integer pair $\( a \, b \)$ represents the closed interval
  $\[ a \/ Q_(upright("int")) \, b \/ Q_(upright("int")) \]$.
  All arithmetic in #raw("verification/certificate.py") is integer arithmetic.
  Addition and multiplication by an integer are exact, with endpoint reversal for a negative multiplier.
  For multiplication, let $m$ and $M$ be the minimum and maximum of the four products of integer endpoints.
  The output pair is

$ (⌊m / Q_(upright("int"))⌋ \, ⌈M / Q_(upright("int"))⌉) . $

For a same-sign interval $\( a \, b \)$ excluding zero, the reciprocal pair is

$ (⌊Q_(upright("int"))^2 / b⌋ \, ⌈Q_(upright("int"))^2 / a⌉) . $

These formulas are valid also for negative intervals. Division by a positive integer rounds each endpoint outward
  in the same way. Python’s integer division is floor division, so the identity $ceil.l x ceil.r = - floor.l -
  x floor.r$ implements the required upper roundings. In particular,
  #raw("rat(a,b)") encloses the exact rational $a \/ b$. The function #raw("mag") bounds absolute value;
  the function #raw("norm") bounds the matrix norm specified above.

The operation #raw("widen") enlarges an interval at each end by the upper endpoint of a nonnegative error
  allowance. The operation #raw("mid") instead selects the grid point

$ Q_(upright("int"))^(- 1) ⌊frac(a + b, 2)⌋ . $

For an interval of real width $w$, its distance from every enclosed number is at most $w \/ 2 +
  Q_(upright("int"))^(- 1)$. The origin and block estimates below explicitly charge this error;
  midpoint selection is never used as an enclosure operation.

Here are the coefficient identities underlying the computation.
  If $z \( theta \) = sum_(i gt.eq 0) z_i theta^i$ and $b \( theta \) = 1 \/ z \( theta \) =
  sum_(i gt.eq 0) b_i theta^i$, then

#[#set math.equation(numbering: n => "(7.2)")
 $ b_0 = z_0^(- 1) \, wide b_i = - z_0^(- 1) sum_(t = 1)^i z_t b_(i - t) quad \( i gt.eq 1 \) . $ <cert:reciprocal>]

Writing a dot for any one parameter variation gives, for $i gt.eq 0$,

#[#set math.equation(numbering: n => "(7.3)")
 $ dot(b)_i = - z_0^(- 1) (sum_(t = 0)^i dot(z)_t b_(i - t) + sum_(t = 1)^i z_t dot(b)_(i - t)) .
   $ <cert:tangent-reciprocal>]

The second sum is empty at $i = 0$. In the first sum the coefficient $b_i$ has already been computed by (7.2).
  This is exactly the ordering in #raw("recip"); it includes the variation of the constant coefficient $z_0$.

At the origin, write $r = s^(3 \/ 2)$ locally and

$ z = 1 + p = 1 + d + k r + sum_(i gt.eq 2) a_i r^i . $

Equation (3.5) gives

#[#set math.equation(numbering: n => "(7.4)")
 $ a_i = frac(b_(i - 2) - upright(bold(1))_({ i = 2 }), \( 27 \/ 8 \) \( i - 1 \) \( i + 9 \) \( i + 10 \)) \,
   wide i gt.eq 2 \, $ <cert:origin-recurrence>]

where now $b_i$ are the coefficients of the reciprocal series in $r$.
  The loop in #raw("origin") computes $a_2 \, dots.h \, a_60$,
  together with their two variations under the parameter map (3.6).
  The weights for evaluation of $p \, p' \, p''$ at $s = 1$ are

$ 1 \, wide frac(3 i, 2) \, wide frac(3 i, 2) (frac(3 i, 2) - 1) . $

The code subtracts the constant $1$ from $z$ only in the zeroth state entry, as required.

For an ordinary Taylor step, let $ell = 1 \/ h$ be the block length, $s_c$ the step’s initial point, $theta =
  h \( s - s_c \)$, and $frak(r) = h s_c + theta$. The equation for $z = 1 + p$, with $E = 1 + d$, is

#[#set math.equation(numbering: n => "(7.5)")
 $ 4 frak(r)^3 z_(theta theta theta) + 120 frak(r)^2 z_(theta theta) + 751 frak(r) z_theta - 1215 \( z - E \) =
   4 / h^3 frak(r)^3 \( z^(- 1) - 1 \) . $ <cert:scaled-ode>]

This identity also gives the four tangent equations upon differentiation.
  For completeness, put $frak(R) = 8 h s_c$ and $F_i = b_i - upright(bold(1))_({ i = 0 })$,
  with negative-index coefficients zero. The scalar coefficient update used in #raw("evolve") is

#[#set math.equation(numbering: n => "(7.6)")
 $ 4 \( i + 1 \) \( i + 2 \) \( i + 3 \) frak(R)^3 z_(i + 3) =  & 4 / h^3 sum_(a = 0)^3 c_a frak(R)^(3 - a) F_(i - a)\
 & - \( 96 i + 960 \) frak(R)^2 \( i + 1 \) \( i + 2 \) z_(i + 2)\
 & - 64 frak(R) \( i + 1 \) #scale(x: 120%, y: 120%)[\(] 12 i \( i - 1 \) + 240 i +
   751 #scale(x: 120%, y: 120%)[\)] z_(i + 1)\
 & - 512 #scale(x: 120%, y: 120%)[\(] 4 i \( i - 1 \) \( i - 2 \) + 120 i \( i - 1 \) + 751 i -
   1215 #scale(x: 120%, y: 120%)[\)] z_i\
 & - 1215 dot.op 512 E upright(bold(1))_({ i = 0 }) \,
   wide \( c_0 \, c_1 \, c_2 \, c_3 \) = \( 1 \, 24 \, 192 \, 512 \) . $ <cert:step-recurrence>]

Indeed $c_a frak(R)^(3 - a)$ are the coefficients of $\( frak(R) + 8 theta \)^3$.
  The initial three coefficients are $z_0 \, z_theta \( 0 \) \, z_(theta theta) \( 0 \) \/ 2$.
  For a tangent column one differentiates every term of (7.6); the constant $E$ has variation $0 \, 0 \, 0 \,
  1$ in the four columns. Thus the same update computes both state and tangent coefficients.
  The values $i = 0 \, dots.h \, 43$ produce coefficients through degree $46$.
  Horner evaluation at $theta = 1 \/ 8$, after the appropriate one or two differentiations,
  evaluates the three state entries through degrees $46 \, 45 \, 44$, respectively.
  The analytic justification for their common remainder allowance is given in Subsection 7.3.

=== 7.2 The complete error at the origin <cert:origin-error>

The parameter family of Lemma 7 is holomorphic on the complex polydisc

$ \| k - k_0 \| lt.eq .1 \, wide \| d - d_0 \| lt.eq .1 \, $

and its coefficients satisfy

#[#set math.equation(numbering: n => "(7.7)")
 $ sum_(i gt.eq 1) \| a_i \| 3^i < .8 \, wide a_1 = k . $ <cert:origin-majorant>]

One can check the constants directly from (7.4): the nonfree denominators exceed $440$, $3 \| k \| < .585$,
  and $\| 1 + d \| > 1.30$. The majorant improves itself because

$ .585 + 9 / 440 (1 + frac(1, 1.30 - .8)) = 711 / 1100 < .8 . $

The reciprocal remains nonsingular throughout this construction.
  In particular the real solutions are positive up to $s = 1$. Also $\| d \| < .501$, and (7.7) gives

$ \| p \( 1 \) \| < .501 + .8 / 3 < .768 \, quad \| p' \( 1 \) \| lt.eq .8 max_(i gt.eq 1) frac(3 i \/ 2, 3^i)
  lt.eq .4 \, quad \| p'' \( 1 \) \| lt.eq .8 max_(i gt.eq 1) frac(\( 3 i \/ 2 \) \( 3 i \/ 2 - 1 \), 3^i) < .534 . $

In particular the uniform bound $2$ for every jet entry is available on the parameter polydisc.

Let

#[#set math.equation(numbering: n => "(7.8)")
 $ E_60 = .8 thin frac(\( 3 dot.op 61 \/ 2 \)^2, 3^61) < 5.267 dot.op 10^(- 26) . $ <cert:origin-tail>]

The sequence $\( 3 i \/ 2 \)^2 \/ 3^i$ decreases for $i gt.eq 61$.
  Consequently $E_60$ bounds the omitted tail of each of the three jet entries.
  Cauchy’s estimate in either parameter bounds the corresponding first derivative of this tail at the center by
  $10 E_60$. For the matrix in (3.6), the sum of the absolute values of all four entries,
  including the factor $10^(- 8)$, is $.01169933$. Thus the row norm of the omitted tail of the two
  $z_(*)$-variation columns is at most $.12 E_60$.

Each of the two original parameter displacements has absolute value at most $.011 R$.
  The multivariable Cauchy estimate, with $t_(*) = .11 R$, bounds the terms of total degree at least two in the
  parameter expansion of any jet entry by

#[#set math.equation(numbering: n => "(7.9)")
 $ E_(upright("par")) = 2 sum_(j gt.eq 2) \( j + 1 \) t_(*)^j =
   2 #scale(x: 120%, y: 120%)[\(] \( 1 - t_(*) \)^(- 2) - 1 -
   2 t_(*) #scale(x: 120%, y: 120%)[\)] < 1.816 dot.op 10^(- 20) . $ <cert:parameter-tail>]

The factor $j + 1$ counts the monomials of total degree $j$ in two parameters.

The width assertion in #raw("origin") bounds every computed state or variation interval by $10^(- 20)$.
  Let $U_0 in bb(R)^3$ be the three selected state midpoints.
  Let $Z$ have their two selected variation columns in its first three rows,
  and in its fourth row the exact second row of the parameter map (3.6).
  The code stores intervals containing that exact fourth row;
  its matrix estimates therefore apply to this choice of $Z$.
  Combining the state midpoint error, the state and variation tails, the two variation midpoint errors, and (7.9), gives

#[#set math.equation(numbering: n => "(7.10)")
 $ ∥vec(p \( 1 \), p' \( 1 \), p'' \( 1 \), d) - vec(U_0, d_0) - Z z_(*)∥_oo & lt.eq 5 dot.op 10^(- 21) + E_60 +
   E_(upright("par")) + .12 E_60 R + 10^(- 20) R + 3 / Q_(upright("int"))\
 & < 2.316 dot.op 10^(- 20) < 2 dot.op 10^(- 19) . $ <cert:initial-error>]

The fourth component of the error is exactly zero. All uncertainty in the interval construction of the central
  rational parameters is already included in the width assertion.

=== 7.3 Analytic continuation and Taylor remainder on a step <cert:disks>

The 288 blocks run from $s = 1$ to $s = 56$, with the following lengths:

$ upright("range") & ell & upright("number of blocks")\
\[ 1 \, 2 \] & 1 \/ 32 & 32\
\[ 2 \, 4 \] & 1 \/ 16 & 32\
\[ 4 \, 8 \] & 1 \/ 8 & 32\
\[ 8 \, 56 \] & 1 \/ 4 & 192 . $

Each block consists of eight Taylor steps of length $ell \/ 8$.
  At every step start the interval assertions imply, for the exact reference state,

#[#set math.equation(numbering: n => "(7.11)")
 $ - .76 < p \( 0 \) < .4 \, wide \| p_theta \( 0 \) \| < .06 \,
   wide \| p_(theta theta) \( 0 \) \| < .01 . $ <cert:step-start>]

Every entry in the first three rows of the four-column scaled variation matrix has modulus less than $6$;
  its fourth row is $\( 0 \, 0 \, 0 \, 1 \)$. The step schedule gives $h s_c gt.eq 32$.

We now justify an analytic bound on the full complex disk $\| theta \| lt.eq 1 \/ 2$,
  using only these starting bounds. On a disk where $\| p \( theta \) - p \( 0 \) \| lt.eq .1$, one has

$ \| frak(r) \| gt.eq 31.5 \, wide \| 1 + p \| > .14 \, wide \| p \| < .86 \, wide \| p - d_0 \| < 1.3 . $

Let $H_2$ be the supremum of $\| p_(theta theta) \|$ on any smaller concentric disk.
  Integrate the equation for $p_(theta theta)$ along radial line segments and apply the integral Gronwall
  inequality. Since

$ 30 / 31.5 < .954 \, wide B / 31.5^2 < .190 \, wide frac(\| C \|, 31.5^3) < .011 \, wide h^(- 3) lt.eq .015625 \, $

and $\| p_theta \| lt.eq .06 + H_2 \/ 2$, this gives

#[#set math.equation(numbering: n => "(7.12)")
 $ H_2 lt.eq e^(.954 \/ 2) [.01 + 1 / 2 {.190 \( .06 + H_2 \/ 2 \) + .011 dot.op 1.3 + .015625 .86 / .14}] .
   $ <cert:disk-h2>]

The coefficient of $H_2$ on the right is less than one. Solving this linear inequality yields
  $H_2 < .123602 < .13$. Therefore

#[#set math.equation(numbering: n => "(7.13)")
 $ \| p \( theta \) - p \( 0 \) \| lt.eq .06 \/ 2 + .13 \/ 8 = .04625 < .1 . $ <cert:disk-displacement>]

This strictly improves the bootstrap. On every disk of radius at most $1 \/ 2$,
  the state and its first two derivatives are bounded and both denominators $frak(r)$ and $1 +
  p$ stay uniformly away from zero. The local holomorphic ODE theorem then continues the solution across any
  putative boundary of its disk of existence. Uniqueness makes the continuations agree.
  Thus the solution is holomorphic on a neighborhood of the closed disk of radius $1 \/ 2$, with the displayed bounds.

In the scaled state $\( p \, p_theta \, p_(theta theta) \, d \)$, the Jacobian is

#[#set math.equation(numbering: n => "(7.14)")
 $ cal(J) \( theta \) =
   mat(delim: "(", 0, 1, 0, 0; 0, 0, 1, 0; - C \/ frak(r)^3 - h^(- 3) \/ \( 1 + p \)^2, - B \/ frak(r)^2, - 30 \/
   frak(r), C \/ frak(r)^3; 0, 0, 0, 0) . $ <cert:scaled-jacobian>]

On the complex disk its norm is bounded by the maximum of $1$ and

$ 30 / 31.5 + frac(751 \/ 4, 31.5^2) + frac(1215 \/ 2, 31.5^3) + frac(1 \/ 64, .14^2) < 2.1 . $

Each actual variation column, with initial norm at most $6$,
  consequently has norm at most $6 e^(2.1 \/ 2) < 17.146 < 32$ throughout the disk.
  The state entries themselves also have modulus less than $32$.
  These estimates apply to the actual block variation already propagated from the block’s initial identity matrix;
  a new identity is not assumed at each substep.

If a scalar holomorphic function is bounded by $32$ on this disk,
  Cauchy’s coefficient estimate gives a tail after degree $44$, at $theta = 1 \/ 8$, bounded by

#[#set math.equation(numbering: n => "(7.15)")
 $ 32 sum_(i gt.eq 45) (frac(1 \/ 8, 1 \/ 2))^i = 128 / 3 thin 4^(- 45) < 48 thin 4^(- 45) . $ <cert:step-tail>]

Every state entry and every tangent entry is approximated to at least degree $44$.
  Hence the allowance $48 thin 4^(- 45)$ added by #raw("evolve") encloses all their Taylor tails.
  The interval recurrences then inductively enclose the exact reference solution and its exact first variation
  through all eight substeps.

On a real substep, the sharper displacement bound is

#[#set math.equation(numbering: n => "(7.16)")
 $ \| p \( theta \) - p \( 0 \) \| lt.eq .06 \/ 8 + frac(.13, 2 dot.op 8^2) = .008515625 < .01 .
   $ <cert:real-step-displacement>]

Accordingly, the smallest lower starting endpoint for $1 + p$,
  reduced by $\( floor.l Q_(upright("int")) \/ 100 floor.r + 1 \) \/ Q_(upright("int")) > .01$,
  is a valid lower bound $m_j$ on the entire reference block.
  This is the variable #raw("mini") divided by $Q_(upright("int"))$.

=== 7.4 The finite inequalities and their exact interpretation <cert:ledger>

Write the block endpoints as $s_0 = 1 \, dots.h \, s_N = 56$, $N = 288$.
  On block $j$, the reference solution has initial physical jet $U_j$ and parameter $d_0$;
  it is evolved exactly on that block. The rounded jet selected for the next block is $U_(j + 1)$.
  Let $M_j$ be the exact $4 times 4$ transfer of the linearized four-component physical state along this reference
  block.

The conversion from scaled derivatives to physical derivatives is essential. With

$ S_j = "diag" \( 1 \, ell_j \, ell_j^2 \, 1 \) \, $

a scaled transfer $T$ becomes $S_j^(- 1) T S_j$. Thus its entry in row $a$, column $b$, for $a \, b in { 0 \, 1 \,
  2 }$, is multiplied by $h_j^a \/ h_j^b$; column $3$ is multiplied by $h_j^a$.
  The fourth row remains $\( 0 \, 0 \, 0 \, 1 \)$. The code performs this conversion before asserting the widths.
  Consequently its assertions imply

#[#set math.equation(numbering: n => "(7.17)")
 $ parallel U_(j + 1) - \( p_(upright("ref")) \, p'_(upright("ref")) \, p''_(upright("ref")) \) \( s_(j + 1) \)
   parallel_oo < 10^(- 19) \, wide \| \( M_j - tilde(M)_j \)_(a b) \| < 10^(- 15) \, $ <cert:local-errors>]

where $tilde(M)_j$ is the selected matrix of transfer midpoints.
  The state and transfer widths are, respectively, less than $10^(- 19)$ and $10^(- 15)$;
  the stated looser midpoint bounds follow from the midpoint estimate in Subsection 7.1.
  All fourth-component errors in (7.17) are zero.

Define the products of these point matrices by

$ tilde(T)_(i \, j) = tilde(M)_(i - 1) dots.h.c tilde(M)_j quad \( i > j \) \, wide tilde(T)_(i \, i) = I_4 . $

The exact integer comparisons in #raw("check") give

#[#set math.equation(numbering: n => "(7.18)")
 $ m_j & > .23 \, wide parallel Z parallel < .02 \,\
max_(i gt.eq j) parallel tilde(T)_(i \, j) parallel & lt.eq
  8500 \, & max_i sum_(j < i) parallel tilde(T)_(i \, j + 1)^(\( 3 \)) parallel & lt.eq 570000 \,\
max_i sum_(j < i) ell_j / m_j^3 parallel tilde(T)_(i \, j + 1)^(\( 3 \)) parallel & lt.eq
  246000 \, & max_i parallel tilde(T)_(i \, 0) Z parallel & lt.eq 2.7 . $ <cert:finite-products>]

Here and below a maximum over endpoints includes endpoint $0$;
  the assertion for it follows from $parallel Z parallel < .02$.

To explain the summation indices, for each endpoint $i$ the inner loop starts with the identity and takes $j = i -
  1 \, dots.h \, 0$. Immediately before multiplying by $tilde(M)_j$,
  its current interval matrix encloses $tilde(T)_(i \, j + 1)$.
  The update #raw("T=mm(T,allm[j])") therefore produces the desired forward product in the correct order.
  If $r_j = Q_(upright("int")) m_j$ and $frak(d)$ is the integer interval bound for the leading $3 times 3$ norm, then

$ frac(frak(d) Q_(upright("int"))^(thin 2), h_j r_j^3) = ell_j / m_j^3 frak(d) / Q_(upright("int")) . $

The expression used for #raw("K") is its floor plus one, hence an upper bound even when the quotient is integral.
  Thus the interval product arithmetic and the weighted sum both round in the required direction.

Let $P_(upright(a)) \( d \) = \( p_(upright(a)) \, p'_(upright(a)) \, p''_(upright(a)) \) \( 56 \)$,
  and put $Y = \( tilde(T)_(N \, 0) Z \)_(upright("top") thin 3)$. The final comparisons in #raw("check") give

#[#set math.equation(numbering: n => "(7.19)")
 $ parallel U_N - P_(upright(a)) \( d_0 \) parallel_oo & < .04 R \, & parallel
   Lambda \( U_N - P_(upright(a)) \( d_0 \) \) parallel_oo & < .006 R \,\
parallel \( Lambda Y \)_(1 \, dot.op) parallel_(upright("row")) & < .116 \, &
  parallel \( Lambda Y \)_(upright("bottom") thin 2) - I_2 parallel & < .001 . $ <cert:finite-matching>]

The jet factors used for the term $d_m s^(- 3 m)$ are $1 \, - 3 m \, 3 m \( 3 m + 1 \)$,
  with denominators $56^(3 m)$, $56^(3 m + 1)$, $56^(3 m + 2)$, respectively.
  After multiplication by $d_m$, these give its value and first two derivatives at $s = 56$.
  The index test in the last assertion subtracts the $2 times 2$ identity from the two nonreal-coordinate rows.

The listed comparisons are finite integer statements: the displayed source constructs their operands and asserts
  them. Subsection 7.8 gives the command for checking them with assertions enabled.
  The preceding recurrence and disk arguments prove that these finite statements bound the specified analytic
  trajectories and variations.

=== 7.5 Transfer errors and estimates within a block <cert:transfer-errors>

Let $T_(i \, j) = M_(i - 1) dots.h.c M_j$ be the exact products.
  By (7.17), $parallel M_j - tilde(M)_j parallel < 4 dot.op 10^(- 15)$.
  Expand a product of at most $288$ factors, choosing the error factor at $k$ positions.
  Each intervening, possibly empty, product of approximate factors has norm at most $8500$, by (7.18).
  Summing the bounds for $k gt.eq 1$ gives

#[#set math.equation(numbering: n => "(7.20)")
 $ parallel T_(i \, j) - tilde(T)_(i \, j) parallel lt.eq 8500
   [\( 1 + 4 dot.op 10^(- 15) dot.op 8500 \)^288 - 1] < .001 . $ <cert:product-perturbation>]

In particular $parallel T_(i \, j) parallel < 8501$. Since the lengths of all the blocks sum to $55$, (7.18) implies

#[#set math.equation(numbering: n => "(7.21)")
 $ max_i sum_(j < i) parallel T_(i \, j + 1)^(\( 3 \)) parallel lt.eq 580000 \, wide max_i sum_(j < i) ell_j /
   m_j^3 parallel T_(i \, j + 1)^(\( 3 \)) parallel lt.eq 250000 \, $ <cert:exact-sums>]

using the elementary comparisons

$ 570000 + 288 dot.op .001 < 580000 \, wide 246000 + frac(55 dot.op .001, .23^3) < 250000 . $

Also

#[#set math.equation(numbering: n => "(7.22)")
 $ parallel T_(i \, 0) Z parallel lt.eq 2.7 + .001 dot.op .02 < 2.72 . $ <cert:linear-size>]

We need two estimates for transfers between any two ordered points of one reference block,
  including points in different Taylor substeps. The real scaled Jacobian (7.14) has norm at most

$ L_(upright("real")) = max {1 \, 30 / 32 + frac(751 \/ 4, 32^2) + frac(1215 \/ 2, 32^3) + frac(1 \/ 64, .23^2)} . $

An interval of at most one block unit therefore has scaled transfer norm at most $e^(L_(upright("real"))) < 4.3$.
  Let $Phi_j \( s \, t \)$ denote its physical transfer. Conjugation by $S_j$ does not increase either the
  first-row norm or the maximum norm of the third column: in the first row the scaling factors are $1 \, ell_j \,
  ell_j^2 \, 1$, and in the third column they are $ell_j^2 \, ell_j \, 1 \, ell_j^2$.
  Thus, with $e_3 = \( 0 \, 0 \, 1 \, 0 \)^t$,

#[#set math.equation(numbering: n => "(7.23)")
 $ parallel \( Phi_j \( s \, t \) \)_(1 \, dot.op) parallel_(upright("row")) lt.eq 4.3 \, wide
   parallel Phi_j \( s \, t \) e_3 parallel_oo lt.eq 4.3 quad \( s_j lt.eq t lt.eq s lt.eq s_(j + 1) \) .
   $ <cert:partial-transfer>]

Only these two parts of a physical transfer are needed. Its full norm need not satisfy the same estimate.

All exponential comparisons just used, and the one in (7.12), can be checked by rational arithmetic.
  For $0 lt.eq x < 82$, let

$ E_80 \( x \) = sum_(j = 0)^80 frac(x^j, j !) + frac(x^81, 81 !) frac(1, 1 - x \/ 82) . $

The positive exponential tail has successive ratios at most $x \/ 82$, so $e^x lt.eq E_80 \( x \)$.
  Substituting the displayed rational values in this formula verifies all the strict numerical comparisons.
  The supplementary #raw("verification/arithmetic_allowances.py") performs these rational checks,
  including (7.10), (7.20), and the remaining comparisons below.

=== 7.6 Uniform nonlinear error and closure of the bootstrap <cert:nonlinear>

Fix $z_(*) in \[ - R \, R \]^2$. On each block compare its actual shot with the reference solution on that block,
  and write $delta p = p - p_(upright("ref"))$. For the only nonlinear term in the physical third-component equation,

$ - frac(p, 1 + p) + frac(p_(upright("ref")), 1 + p_(upright("ref"))) +
  frac(delta p, \( 1 + p_(upright("ref")) \)^2) = frac(\( delta p \)^2, \( 1 + p_(upright("ref")) \)^2 \( 1 + p \)) . $

It follows that the difference equation, beyond the reference linearization, has forcing $e_3 cal(N)$, where

#[#set math.equation(numbering: n => "(7.24)")
 $ \| cal(N) \| = frac(\| delta p \|^2, \| 1 + p_(upright("ref")) \|^2 \| 1 + p \|) . $ <cert:nonlinear-remainder>]

The $d$-dependence is linear and is already included in the fourth variation component.

Temporarily assume $\| delta p \| lt.eq 14 R$ throughout the portions of the blocks reached so far.
  Since $m_j > .23$ and $m_j \/ \( m_j - 14 R \) < 1.001$, (7.24) implies

$ \| cal(N) \| lt.eq frac(1.001 \( 14 R \)^2, m_j^3) . $

The error accumulated by the end of block $j$, before multiplication by subsequent complete-block transfers,
  has zero fourth component. Its norm is bounded by

$ 10^(- 19) + 4.3 thin ell_j frac(1.001 \( 14 R \)^2, m_j^3) . $

The first term is the reference jump (7.17); the second follows by variation of constants and the third-column
  estimate in (7.23).

Define the endpoint error $e_i$ by

$ vec(p \( s_i \), p' \( s_i \), p'' \( s_i \), d) = vec(U_i, d_0) + T_(i \, 0) Z z_(*) + e_i . $

Its fourth component is zero. By (7.10), (7.21), and the preceding local error estimate,

#[#set math.equation(numbering: n => "(7.25)")
 $ parallel e_i parallel_oo & lt.eq 580000 dot.op 10^(- 19) + 8501 dot.op \( 2 dot.op 10^(- 19) \) +
   4.3 dot.op 250000 dot.op 1.001 \( 14 R \)^2\
 & = .1055747504 R < .11 R . $ <cert:endpoint-error>]

For an interior point of a block, the first-row estimate in (7.23), (7.22), and the forcing estimate give

#[#set math.equation(numbering: n => "(7.26)")
 $ \| delta p \| & lt.eq 4.3 \( 2.72 + .11 \) R + 4.3 frac(1.001 \( 14 R \)^2, .23^3)\
 & < 12.169035 R < 14 R . $ <cert:bootstrap-improvement>]

Here replacing the remaining block length by $1$ is a harmless overestimate.
  This improves the bootstrap strictly both at block starts and in block interiors, including the reference jumps.
  At $s = 1$ it starts from $parallel Z parallel < .02$ and (7.10).
  Continuation over the finitely many blocks therefore proves (7.25) at every block endpoint.

For clarity, existence is part of this continuation argument.
  As long as the bootstrap holds, $1 + p gt.eq .23 - 14 R > 0$.
  On the finite interval $1 lt.eq s lt.eq 56$, the equations for $p'$ and $p''$ form a linear system with bounded
  coefficients and bounded forcing once $p$ stays in this range.
  Gronwall’s inequality bounds these derivatives on every such interval.
  Thus no other finite-time escape can interrupt continuation.
  Positivity before $s = 1$ was established in Subsection 7.2.
  This proves the existence and positivity statements of Proposition 24.

=== 7.7 Projection at the matching point <cert:projection>

Let $Gamma$ denote the exact real coordinate matrix of (3.12). Lemma 8 gives

$ \| Gamma_(a b) - Lambda_(a b) \| < .001 \, wide parallel Gamma_(1 \, dot.op) parallel_(upright("row")) < .92 \,
  wide parallel Gamma_(a \, dot.op) parallel_(upright("row")) < .68 quad \( a = 2 \, 3 \) . $

Thus $parallel Gamma - Lambda parallel < .003$. The polynomial $P_(upright(a))$ also satisfies

#[#set math.equation(numbering: n => "(7.27)")
 $ parallel P_(upright(a)) \( d \) - P_(upright(a)) \( d_0 \) parallel_oo lt.eq .01 \| d -
   d_0 \| lt.eq .01 dot.op .011 R \; $ <cert:pa-variation>]

this follows by differentiating the four explicit coefficients in (3.11), as detailed in the proof of Lemma 9.

Set $A_(*) = U_N - P_(upright(a)) \( d_0 \)$. The endpoint error and transfer error give

$ vec(p, p', p'') \( 56 \) - P_(upright(a)) \( d \) = A_(*) + Y z_(*) + epsilon.alt_(*) -
  #scale(x: 120%, y: 120%)[\(] P_(upright(a)) \( d \) - P_(upright(a)) \( d_0 \) #scale(x: 120%, y: 120%)[\)] \,
  wide parallel epsilon.alt_(*) parallel_oo lt.eq #scale(x: 120%, y: 120%)[\(] .11 + .001 dot.op .02
  #scale(x: 120%, y: 120%)[\)] R . $

In fact $epsilon.alt_(*)$ is the sum of the top three entries of $e_N$ and
  $\( \( T_(N \, 0) - tilde(T)_(N \, 0) \) Z z_(*) \)_(upright("top") thin 3)$. Apply one row of $Gamma$.
  The contribution of $A_(*)$, using (7.19), is at most $\( .006 + .003 dot.op .04 \) R$.
  For the first row the linear contribution is bounded by $\( .116 + .003 dot.op 2.7 \) R$.
  For row $a = 2 \, 3$, after subtracting the corresponding coordinate of $z_(*)$,
  it is bounded by $\( .001 + .003 dot.op 2.7 \) R$. The remaining contribution is bounded by the row norm of
  $Gamma$ times

$ #scale(x: 120%, y: 120%)[\(] .11 + .001 dot.op .02 + .01 dot.op .011 #scale(x: 120%, y: 120%)[\)] R . $

Consequently, in units of $R$, the two required estimates are

$ \| q \| \/ R & lt.eq .006 + .003 dot.op .04 + .116 + .003 dot.op
  2.7 + .92 \( .11 + .001 dot.op .02 + .01 dot.op .011 \)\
 & = .2315396 < .25 \,\
parallel \( Re xi \, Im xi \) - z_(*) parallel_oo \/ R & lt.eq .006 + .003 dot.op .04 + .001 + .003 dot.op
  2.7 + .68 \( .11 + .001 dot.op .02 + .01 dot.op .011 \)\
 & = .0901084 < .13 . $

These are exact rational comparisons and establish (7.1), completing the proof of Proposition 24.

=== 7.8 Executable source and reproducibility <cert:provenance>

The complete source printed in Appendix 8 is #raw("verification/certificate.py"), comprising $6594$ UTF-8 bytes.
  Its SHA-256 digest is

263389fd7217d84d0e5b66869797fc9f7998 309d524a95f7ad7d3d0f538ea742

where the line break is for typesetting only. It uses no imported libraries, floating-point operations,
  external data, or platform-dependent numerical routines. From the paper directory, the verification command is

#quote(block: true)[
  python3 verification/certificate.py
]

with Python assertions enabled (no #raw("-O") or #raw("-OO"),
  and no #raw("PYTHONOPTIMIZE") setting that disables assertions). The program is silent when every assertion succeeds.

The supplementary rational check

#quote(block: true)[
  python3 verification/arithmetic\_allowances.py
]

verifies the analytic allowances used above by exact fraction arithmetic; its decimal report is descriptive only.
  The optional script #raw("verification/tail-check.py") checks the explicit root and tail estimates in Section 3
  by exact rational arithmetic. The finite integer assertions,
  the analytic enclosure argument in Subsections 7.2–7.3, and the nonlinear argument in Subsections 7.5–7.7
  together prove the finite shooting proposition.

== 8 The exact-arithmetic certificate <app:code>

The following Python program is the certificate used in Appendix Section 7.
  It uses only Python’s standard library and integer arithmetic. Run it with assertions enabled.
  Successful termination means that all its assertions hold;
  the analytic interpretation of those assertions is proved in Appendix Section 7.

#raw(block: true, lang: "", "")

#bibliography("refs.bib", style: "ieee", title: [References])
