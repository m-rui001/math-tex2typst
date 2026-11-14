#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A local Penrose inequality for conformal perturbations \
of Schwarzschild--anti-de Sitter data]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Penrose inequality relates the total mass of gravitational initial data to the area of a black-hole boundary.
  Its original formulation arose from the relation between gravitational collapse and cosmic
  censorship #cite(label("Penrose1973")). In the asymptotically flat,
  time-symmetric setting it was proved by Huisken and Ilmanen for a connected horizon and by Bray for the total
  area of possibly disconnected horizons #cite(label("HuiskenIlmanen2001")) #cite(label("Bray2001")).
  For negative cosmological constant, the Schwarzschild–anti-de Sitter family suggests the three-dimensional inequality

#[#set math.equation(numbering: n => "(1.1)")
 $ m_(upright("AH")) gt.eq sqrt(frac(A, 16 pi)) (1 + frac(A, 4 pi)) \, $ <eq:intro-penrose>]

when the cosmological constant is normalized to $- 3$. Here $m_(upright("AH"))$ is the Lorentz norm of the
  hyperbolic mass covector. In the outermost, outer area-minimizing formulation of Corollary 2,
  $A$ is the least enclosing area of the future marginally outer trapped boundary.

We prove (1.1) for a local conformal class of maximal vacuum data with a marginally outer trapped boundary.
  The background is a time-symmetric Schwarzschild–anti-de Sitter exterior of arbitrary positive mass.
  One fixes a smooth decaying transverse-traceless (TT) tensor $q$ and considers any solution branch of the
  conformal constraint equation with conformal second fundamental form $epsilon.alt q$.
  The parameter interval in the result may depend on this fixed seed and branch.
  Theorem 1 imposes neither symmetry nor an additional comparison between the size of the seed in the interior and
  at the boundary.

This setting is closely related to the perturbative theorem of Khuri and
  Kopiński #cite(label("KhuriKopinski2023")) Theorem 2. Their sufficient condition requires the
  static-lapse-weighted integral of the squared seed norm to dominate a multiple of the squared $H^1$ norm of its
  normal component on a domain containing the boundary; see their Equation (2.5).
  Both sides scale quadratically when the seed is multiplied by $epsilon.alt$,
  so shrinking $epsilon.alt$ alone does not remove that condition.
  The argument below replaces it by a sharp TT boundary identity and treats the equality directions of the
  resulting quadratic estimate. It thereby proves the fixed-seed local form of the Penrose inequality in this
  conformal class without the domination hypothesis. In particular,
  it applies when the boundary is outermost and outer area-minimizing, as in the usual local Penrose formulation.

Two related geometric ingredients have established precedents.
  The hyperbolic mass covector and its covariance are studied by Chruściel and
  Herzlich #cite(label("ChruscielHerzlich2003")). Neves and Tian construct constant mean curvature (CMC)
  foliations near infinity under positive-mass Schwarzschild–anti-de Sitter asymptotic
  hypotheses #cite(label("NevesTian2009")); Ambrozio uses CMC foliations to prove a local Riemannian Penrose
  inequality near Schwarzschild–anti-de Sitter #cite(label("Ambrozio2015")).
  We derive directly the mass and CMC identities needed here.
  Only finite Taylor families of surfaces are used, so the proof does not require an actual global CMC foliation
  for a nonzero parameter.

=== The mechanism of the proof <the-mechanism-of-the-proof>

Write $frak(D)_q \( epsilon.alt \)$ for the difference between the two sides of (1.1), with $A$ the boundary area.
  In the notation of Section 2, $g_0$ is the background metric of mass $m_0$, $s$ is proper radial distance,
  $r \( s \)$ is the area radius, and $N = r' \( s \)$ is the static lapse.
  The constant and linear deficit coefficients vanish. The quadratic calculation combines a CMC Hawking-mass
  identity with the static TT identity

$ N Q \( v \) = "sym" nabla \( N thin upright(d) v - v thin upright(d) N \) \, wide Q \( v \) = nabla^2 v -
  v \( "Ric"_(g_0) + 3 g_0 \) . $

After the boundary area correction, the quadratic coefficient is a sum of nonnegative terms (Proposition 15).
  Its kernel is the four-dimensional space of tensors $Q \( v \)$, where $\( Delta_(g_0) - 3 \) v = 0$,
  $v$ decays, and $v \|_S$ contains only constant and degree-one spherical harmonics (Corollary 16).

The degree-one directions are a real obstruction to concluding from second order.
  They have zero first-order shear and lapse fluctuation, and a radial component can make their boundary normal
  component nonnegative. We remove their first extrinsic-curvature coefficient by a change of spacetime slice at
  the level of finite Taylor expansions. The resulting quartic coefficient is again a sum of nonnegative terms.
  If it vanishes, the changed metric must be a round warped-product jet through second order.
  Conformality of the original branch then forces the radial profile $V \( s \)$ of the degree-one part of $v$ to
  satisfy (with primes denoting $s$-derivatives)

$ (V' - r' / r V)^2 = frac(6 m_0, r^3) V^2 . $

This is incompatible with a nonzero decaying profile. Thus the quartic coefficient is strictly positive in every
  nonradial quadratic-null direction (Proposition 18). The remaining radial directions satisfy an exact
  conserved-mass identity (Proposition 23).

Three parts of the method may be useful beyond this application:
  the sharp static TT boundary square; the passage from CMC surface jets to a positive mass-coefficient identity
  by integrating first at finite radius; and the use of a null boundary transport together with a change of slice
  to detect a quartic obstruction. Analytically, an exact Green formula converts the derivative-defined mass into
  convergent integrals. It allows actual remainder estimates in a weighted function norm,
  and rotation averaging then covers seeds with arbitrary angular dependence.
  Proposition 8 then identifies the finite Taylor calculations with the actual deficit.

The result concerns this fixed-seed local conformal problem.
  No existence of a solution branch for every seed is asserted.
  The proof does not use a general spacetime Penrose inequality, a constrained extension through the boundary,
  or a global spacetime development.

== 2 Geometric setting and the theorem <sec:setting>

Fix $m_0 > 0$, and let $a > 0$ be the unique positive root of $1 + a^2 - 2 m_0 \/ a = 0$. On

$ M = \[ 0 \, oo \) times S^2 \, wide S = { 0 } times S^2 \, $

let

#[#set math.equation(numbering: n => "(2.1)")
 $ g_0 = upright(d) s^2 + r \( s \)^2 sigma \, wide r \( 0 \) = a \, wide r' \( s \) > 0 quad \( s > 0 \) \,
   wide \( r' \)^2 = 1 + r^2 - frac(2 m_0, r) \, $ <eq:background>]

where $sigma$ is the unit round metric. The coordinate $s$ is smooth at the boundary, and $n =
  partial_s$ points from $S$ toward infinity. On the end, $r = r \( s \)$ is a coordinate and

#[#set math.equation(numbering: n => "(2.2)")
 $ b = frac(upright(d) r^2, 1 + r^2) + r^2 sigma = upright(d) eta^2 + sinh^2 eta thin sigma \, wide eta =
   "arsinh" r . $ <eq:hyperbolic-reference>]

In particular, $r$ is asymptotic to a positive constant times $e^s$.

Our Laplacian is $Delta = "div" "grad"$, with nonpositive eigenvalues on a closed manifold.
  The spaces $C_tau^(k \, alpha)$ use the hyperbolic metric $b$ in the end:
  the tensor and its covariant derivatives through order $k$ are $O \( e^(- tau s) \)$,
  and the correspondingly weighted $alpha$-Hölder seminorms on unit background balls are bounded.
  On a compact set we use ordinary $C^(k \, alpha)$ regularity.
  This definition is equivalent to one using hyperbolic distance.

Fix $0 < alpha < 1$, $3 \/ 2 < tau < 3$, and a smooth symmetric tensor $q in C_tau^(1 \, alpha)$,
  smooth up to $S$, satisfying

#[#set math.equation(numbering: n => "(2.3)")
 $ "tr"_(g_0) q = 0 \, wide "div"_(g_0) q = 0 . $ <eq:tt-seed>]

Throughout the paper the seed $q$ is independent of $epsilon.alt$.
  Suppose a smooth branch of positive solutions, defined for $0 lt.eq epsilon.alt < epsilon.alt_(*)$, satisfies

#[#set math.equation(numbering: n => "(2.4)")
 $ Delta_(g_0) phi.alt_epsilon.alt & = 3 / 4 \( phi.alt_epsilon.alt^5 - phi.alt_epsilon.alt \) - epsilon.alt^2 /
   8 \| q \|_(g_0)^2 phi.alt_epsilon.alt^(- 7) &  & upright("on ") M \,\
partial_s phi.alt_epsilon.alt & = epsilon.alt / 4 q_(s s) phi.alt_epsilon.alt^(- 3) &  & upright("on ") S \,\
phi.alt_0 & = 1 \, wide phi.alt_epsilon.alt - 1 in C_tau^(2 \, alpha) \, wide parallel phi.alt_epsilon.alt -
  1 parallel_(C_tau^(2 \, alpha)) arrow.r 0 &  & upright("as ") epsilon.alt arrow.r 0 . $ <eq:conformal-equation>]

No differentiability in stronger weighted spaces is assumed. Set

#[#set math.equation(numbering: n => "(2.5)")
 $ g_epsilon.alt = phi.alt_epsilon.alt^4 g_0 \, wide K_epsilon.alt = epsilon.alt phi.alt_epsilon.alt^(- 2) q \,
   wide A_epsilon.alt = \| S \|_(g_epsilon.alt) . $ <eq:actual-data>]

=== 2.1 Mass and boundary conventions <mass-and-boundary-conventions>

Let $x_i$, $1 lt.eq i lt.eq 3$, be the coordinate functions on the unit sphere.
  Define $V_0 = sqrt(1 + r^2)$, $V_i = r x_i$, and $e_epsilon.alt = g_epsilon.alt - b$. We use the flux normalization

#[#set math.equation(numbering: n => "(2.6)")
 $ p_mu \( epsilon.alt \) = frac(1, 16 pi) lim_(R arrow.r oo) integral_({ r = R }) #scale(x: 120%, y: 120%)[\[] &
   V_mu \( "div"_b e_epsilon.alt - upright(d) "tr"_b e_epsilon.alt \)\
 & + \( "tr"_b e_epsilon.alt \) upright(d) V_mu - e_epsilon.alt \( "grad"_b V_mu \, dot.op \)
   #scale(x: 120%, y: 120%)[\]] \( nu_b \) thin upright(d) A_b \, $ <eq:mass-flux>]

where $nu_b$ points toward increasing $r$. All operators and the area form in this formula are those of $b$.
  Assume that these limits are finite and that the covector is future timelike for all sufficiently small positive
  $epsilon.alt$. Thus

$ m_(upright("AH")) \( epsilon.alt \) = sqrt(p_0 \( epsilon.alt \)^2 - sum_(i = 1)^3 p_i \( epsilon.alt \)^2) $

is the positive mass norm. This normalization gives $p_0 \( 0 \) = m_0$ and $p_i \( 0 \) = 0$.
  The $p_i$ are spatial components of the hyperbolic mass covector, not angular momentum charges.

For a two-sided surface with unit normal $nu$ toward the chosen end, put

$ H = "div"_Sigma nu \, wide theta_(+) = H + "tr"_Sigma K . $

For a spacetime realization our convention is $K \( X \, Y \) =
  macron(g) \( macron(nabla)_X n_(upright("future")) \, Y \)$;
  in Gaussian normal coordinates this means $partial_t g = 2 K$.
  A future marginally outer trapped surface, or MOTS, has $theta_(+) = 0$.

The standard conformal identities give

#[#set math.equation(numbering: n => "(2.7)")
 $ "tr"_(g_epsilon.alt) K_epsilon.alt = 0 \, wide "div"_(g_epsilon.alt) K_epsilon.alt = 0 \, wide
   R_(g_epsilon.alt) + 6 = \| K_epsilon.alt \|_(g_epsilon.alt)^2 . $ <eq:constraints>]

Indeed, for a tracefree $q$ the divergence identity is $"div"_(phi.alt^4 g_0) \( phi.alt^(- 2) q \) =
  phi.alt^(- 6) "div"_(g_0) q$. Also

$ R_(phi.alt^4 g_0) = phi.alt^(- 5) \( - 8 Delta_(g_0) phi.alt - 6 phi.alt \) = - 6 +
  epsilon.alt^2 phi.alt^(- 12) \| q \|_(g_0)^2 . $

The boundary $S$ is totally geodesic for $g_0$. Its normal in $g_epsilon.alt$ is $phi.alt_epsilon.alt^(- 2)
  partial_s$, and

#[#set math.equation(numbering: n => "(2.8)")
 $ H_(g_epsilon.alt) \( S \) = 4 phi.alt_epsilon.alt^(- 3) partial_s phi.alt_epsilon.alt =
   epsilon.alt phi.alt_epsilon.alt^(- 6) q_(s s) \, wide "tr"_S K_epsilon.alt = -
   epsilon.alt phi.alt_epsilon.alt^(- 6) q_(s s) . $ <eq:boundary-mots>]

Consequently it is a future MOTS. Its mean curvature need not vanish.

=== 2.2 Statement <statement>

Define

#[#set math.equation(numbering: n => "(2.9)")
 $ b_(*) \( A \) = sqrt(frac(A, 16 pi)) (1 + frac(A, 4 pi)) \, wide frak(D)_q \( epsilon.alt \) =
   m_(upright("AH")) \( epsilon.alt \) - b_(*) \( A_epsilon.alt \) . $ <eq:deficit>]

A tensor is called #emph[radial] if it is invariant under every rotation of the $S^2$ factor.

#thm([Theorem 2.1.])[
  #emph[For every background, fixed TT seed, and solution branch satisfying (2.1)–(2.4) and the mass assumptions
    above, there is $0 < epsilon.alt_0 lt.eq epsilon.alt_(*)$ such that
$ m_(upright("AH")) \( epsilon.alt \) gt.eq sqrt(frac(A_epsilon.alt, 16 pi)) (1 + frac(A_epsilon.alt, 4 pi))
  wide \( 0 lt.eq epsilon.alt < epsilon.alt_0 \) . $

 For all sufficiently small positive $epsilon.alt$, equality holds if the seed is radial,
   and the inequality is strict otherwise.]
] <thm:main>

The theorem makes no sign assumption on $q_(s s) \|_S$. It also does not require outermostness or outer
  area-minimization. In particular it implies the following formulation with the usual geometric boundary
  hypotheses. Here an enclosing surface separates $S$ from the end and bounds with $S$ a compact region.
  Write $A_min \( S \)$ for the infimum of areas of smooth enclosing surfaces,
  allowing disconnected competitors and $S$ itself.

#thm([Corollary 2.2.])[
  #emph[In addition to the hypotheses of Theorem 1, suppose $q_(s s) gt.eq 0$ on $S$.
    Assume, for every sufficiently small positive $epsilon.alt$,
    that no compact smooth embedded two-sided surface in the interior enclosing $S$ has $theta_(+) lt.eq
    0$ everywhere, and that every smooth enclosing surface has area at least $A_epsilon.alt$.
    Disconnected enclosing competitors are allowed, and $S$ itself is allowed in the area infimum.
    Then the exact local Penrose inequality holds with $A_min \( S \) = A_epsilon.alt$.]
] <cor:penrose>

The outermostness condition excludes all weakly future outer trapped enclosing surfaces, not only additional MOTS.
  These additional assumptions are relevant to the geometric formulation of the conjecture but are not needed in
  the coefficient argument below.

=== 2.3 Static operators and Taylor notation <sec:taylor>

We use

#[#set math.equation(numbering: n => "(2.10)")
 $ N = r' \, wide kappa = N' \( 0 \) = frac(1 + 3 a^2, 2 a) \, wide B = "Ric"_(g_0) + 3 g_0 \,\
L = Delta_(g_0) - 3 \, wide D = - Delta_(a^2 sigma) + frac(2 kappa, a) . $ <eq:static-operators>]

The letter $D$ denotes the boundary operator, while $frak(D)_q$ denotes the mass deficit.

#thm([Lemma 2.3.])[
  #emph[The tensor $B$ and the static lapse satisfy
#[#set math.equation(numbering: n => "(2.11)")
 $ B = B_s thin upright(d) s^2 + B_t r^2 sigma \, wide B_s = 1 - frac(2 m_0, r^3) \, wide B_t = 1 + m_0 / r^3 \,\
nabla^2 N = N B \, wide "tr"_(g_0) B = 3 \, wide "div"_(g_0) B = 0 \, wide L N = 0 . $ <eq:B-components>]

 Moreover $D$ is positive on all spherical harmonics and
#[#set math.equation(numbering: n => "(2.12)")
 $ b_(*) \( 4 pi a^2 \) = m_0 \, wide b'_(*) \( 4 pi a^2 \) = frac(kappa, 8 pi) . $ <eq:boundary-constants>]

]
] <lem:static>

#proof[
  The radial and tangential sectional curvatures of $upright(d) s^2 + r^2 sigma$ are $-
    r'' \/ r$ and $\( 1 - \( r' \)^2 \) \/ r^2$. Differentiating (2.1) gives $N' = r + m_0 \/ r^2$ and $N'' =
    N \( 1 - 2 m_0 \/ r^3 \)$. The Ricci eigenvalues are therefore $- 2 - 2 m_0 \/ r^3$ and $- 2 + m_0 \/ r^3$,
    giving (2.11) and $R_(g_0) = - 6$. The radial and tangential Hessian eigenvalues of $N$ are $N''$ and $N' N \/
    r$, respectively, proving the first identity in (2.11). Its trace gives $L N = 0$.
    The divergence identity follows from the contracted Bianchi identity and the constant scalar curvature.
    At $S$, $B_t = kappa \/ a$ and $2 kappa \/ a > 0$, so $D > 0$.
    Finally $2 m_0 = a \( 1 + a^2 \)$ gives (2.12) by direct differentiation. ◻
]

We write $\[ cal(F) \]_j$ for the coefficient of $epsilon.alt^j$ in a Taylor expansion;
  coefficients do not include an extra factorial. Thus $u_j \[ q \] = \[ phi.alt_epsilon.alt - 1 \]_j$ and
  $c_j \[ q \] = \[ frak(D)_q \]_j$ when the indicated actual expansions have been established.
  For a tensor $T$ we also use the weighted function norm

$ parallel T parallel_beta = sup_M e^(beta s) \| T \|_(g_0) . $

On the end this is equivalent to using $b$. Finite angular type means that the span of all rotational pullbacks of
  the function or tensor is finite-dimensional. For functions this is precisely a finite sum of spherical-harmonic
  spaces, with arbitrary smooth radial coefficients.

Some geometric arguments use Taylor families of metrics and surfaces only to order $p$,
  with identities read in the finite Taylor algebra $bb(R) \[ epsilon.alt \] \/ \( epsilon.alt^(p + 1) \)$.
  On any compact radial interval, their coefficients can be represented by a smooth family and all
  differential-geometric identities then hold to the retained order.
  At $S$, a formal displacement may have negative first coefficient.
  It is evaluated using the given smooth one-sided jets: extend sufficiently many coefficients smoothly across
  $s = 0$, perform the finite Taylor calculation, and retain only the prescribed order.
  Every boundary derivative of an identity holding on $s gt.eq 0$ is fixed by those jets.
  This convention does not assume a constrained extension at a fixed point with $s < 0$.
  The time-recursion argument below will specify how the constraint identities are used after such a displacement.

== 3 Weighted coefficients and actual expansions <ana:section>

We first justify the passage between finite Taylor calculations and the given solution branch.
  Throughout this section, fix

#[#set math.equation(numbering: n => "(3.1)")
 $ 3 / 2 < beta < min { tau \, sqrt(3) } . $ <ana:beta>]

We use the weighted norms and Taylor conventions of Section 2.3.
  Boundary norms without a weight are uniform norms on $S$.

=== 3.1 A scalar inverse and its asymptotics <a-scalar-inverse-and-its-asymptotics>

Equivariant linear differential operations preserve finite angular type.
  Products and contractions preserve it after enlarging the angular space by a finite tensor product.
  On functions, the round Laplacian preserves these spaces:
  it is the sum of squares of the three infinitesimal rotation fields.
  Its restriction is self-adjoint, so we may split into finitely many eigenspaces with eigenvalues $lambda gt.eq
  0$ for $- Delta_sigma$.

#thm([Lemma 3.1.])[
  (Comparison and finite angular inverse).  #emph[There are constants $c_beta \,
    C_beta > 0$ with the following properties. Suppose $z = o \( e^(- beta s) \)$ uniformly at infinity and
$ \( L - V \) z = F \, wide parallel V parallel_(C^0 \( M \)) lt.eq c_beta . $

 If either $z \|_S = b$ or $partial_s z \|_S = b$, then
#[#set math.equation(numbering: n => "(3.2)")
 $ parallel z parallel_beta lt.eq C_beta #scale(x: 120%, y: 120%)[\(] parallel F parallel_beta +
   parallel b parallel_(C^0 \( S \)) #scale(x: 120%, y: 120%)[\)] . $ <ana:comparison>]

 The constants do not depend on an angular cutoff. The same estimate holds for $partial_s z - a_(*) z =
   b$ if $parallel a_(*) parallel_(C^0 \( S \)) lt.eq beta \/ 2$.]
  #emph[If $F$ and $b$ are smooth and of finite angular type, and $F =
    O \( e^(- gamma s) \)$ for some $gamma > 3$, there is a unique decaying finite angular type solution of $L u =
    F$ with either of the above Dirichlet or Neumann data. It satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ u = r^(- 3) zeta \( x \) + o \( r^(- 3) \) \, wide partial_s #scale(x: 120%, y: 120%)[\(] u -
   r^(- 3) zeta \( x \) #scale(x: 120%, y: 120%)[\)] = o \( r^(- 3) \) $ <ana:inverse-asymptotic>]

 for a smooth finite angular type function $zeta$. These statements hold after any fixed number of angular
   differentiations. If $partial_s^j F = O \( e^(- gamma s) \)$ for $0 lt.eq j lt.eq k$,
   the remainder in (3.3) can also be differentiated in $s$ through order $k + 2$,
   with each resulting remainder $o \( r^(- 3) \)$.]
] <lem:inverse>

#proof[
  Let $h = e^(- beta s)$. Since $N \/ r gt.eq 0$,
  $ L h = \( beta^2 - 2 beta N \/ r - 3 \) h lt.eq - \( 3 - beta^2 \) h . $
  Choose $c_beta < \( 3 - beta^2 \) \/ 2$. A sufficiently large multiple $A h$ satisfies $\( L - V \) \( A h \)
    lt.eq - \| F \|$. For Dirichlet data, enlarge $A$ to dominate $\| b \|$.
    For Neumann data, enlarge it so that $- beta A - b < 0$ and $- beta A + b < 0$ on $S$.
    The functions $A h - z$ and $A h + z$ are positive sufficiently far out.
    A negative interior minimum contradicts their differential inequalities,
    because the zeroth-order coefficient of $L - V$ is negative.
    A negative minimum on $S$ is impossible in the Neumann case:
    the inward derivative at such a minimum is nonnegative, whereas the chosen derivative is negative.
    This proves (3.2). For the Robin condition, apply the maximum argument to $z \/ h$.
    At a positive boundary maximum its inward derivative is nonpositive,
    whereas $partial_s \( z \/ h \) = \( beta + a_(*) \) \( z \/ h \) + b$ on $S$.
    Since $beta + a_(*) gt.eq beta \/ 2$, a sufficiently large positive maximum is impossible;
    apply the same argument to $- z \/ h$.
  For the existence assertion, work in each angular eigenspace. The radial equation is
  #[#set math.equation(numbering: n => "(3.4)")
   $ y'' + 2 N / r y' - (3 + lambda / r^2) y = F_lambda . $ <ana:radial-ode>]
  First impose the required condition at $0$ and $y \( T \) = 0$ on a finite interval.
    The homogeneous problem has trivial kernel: multiplication by $r^2 y$ and integration gives
  $ 0 = - integral_0^T r^2 \( y' \)^2 thin upright(d) s - integral_0^T \( 3 r^2 + lambda \) y^2 thin upright(d) s \, $
  with zero boundary terms. Thus the finite-interval linear problem is solvable.
    The barrier estimate is independent of $T$. On each compact interval, the equation bounds $y'$ and then $y''$:
    the mean value theorem supplies a point with bounded $y'$,
    and the first-order equation for $y'$ propagates that bound.
    A subsequence therefore converges on compact intervals to a solution with $y = O \( e^(- beta s) \)$.
    The same local argument on unit intervals gives $y' = O \( e^(- beta s) \)$.
  Now $N \/ r = 1 + O \( e^(- 2 s) \)$ and $r^(- 2) = O \( e^(- 2 s) \)$. Hence
  $ y'' + 2 y' - 3 y = G \, wide G = O \( e^(- gamma' s) \) \, wide gamma' = min { gamma \, beta + 2 } > 3 . $
  Variation of constants for the roots $1 \, - 3$ eliminates the growing homogeneous term and gives
  $ y = c e^(- 3 s) + O \( e^(- gamma' s) \) \, wide y' = - 3 c e^(- 3 s) + O \( e^(- gamma' s) \) . $
  For example the particular solution is a linear combination of $e^s integral_s^oo e^(- t) G \( t \) thin
    upright(d) t$ and $e^(- 3 s) integral_s^oo e^(3 t) G \( t \) thin upright(d) t$;
    both integrals converge with the claimed bounds. Since $r = C e^s \( 1 + O \( e^(- 2 s) \) \)$, this is (3.3).
    The equation gives the second differentiated remainder, and differentiated equations give the rest.
    Angular differentiations are bounded operations on the fixed finite spaces.
    Any other solution tending uniformly to zero also satisfies the initial weighted bound:
    compare on sufficiently long intervals with $A h + delta$, where $delta > 0$ dominates the far boundary value,
    and then let $delta arrow.b 0$. The same ODE improvement applies.
    The improved decay permits comparison for a difference of two solutions, proving uniqueness. ◻
]

=== 3.2 Coefficient equations and the required spatial derivatives <coefficient-equations-and-the-required-spatial-derivatives>

Put $psi = phi.alt - 1$, $h_q = q_(s s) \|_S$, and $Q_q = \| q \|_(g_0)^2$. Define

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(A) \( z \) & = 15 / 2 z^2 + 15 / 2 z^3 + 15 / 4 z^4 + 3 / 4 z^5 \,\
cal(N)_(epsilon.alt \, q) \( z \) & = cal(A) \( z \) - epsilon.alt^2 / 8 Q_q \( 1 + z \)^(- 7) \,\
cal(B)_(epsilon.alt \, q) \( z \) & = epsilon.alt / 4 h_q \( 1 + z \)^(- 3) . $ <ana:nonlinearities>]

The actual equations become

#[#set math.equation(numbering: n => "(3.6)")
 $ L psi = cal(N)_(epsilon.alt \, q) \( psi \) \, wide partial_s psi \|_S =
   cal(B)_(epsilon.alt \, q) \( psi \|_S \) . $ <ana:actual-equations>]

For a finite angular type seed, define $u_j = u_j \[ q \]$ recursively.
  Set $P_(j - 1) = sum_(i < j) epsilon.alt^i u_i$, and let

#[#set math.equation(numbering: n => "(3.7)")
 $ F_j = \[ cal(N)_(epsilon.alt \, q) \( P_(j - 1) \) \]_j \, wide
   B_j = \[ cal(B)_(epsilon.alt \, q) \( P_(j - 1) \|_S \) \]_j \,\
L u_j = F_j \, wide partial_s u_j \|_S = B_j \, wide u_j arrow.r 0 . $ <ana:coefficient-recursion>]

Here $\[ dot.op \]_j$ extracts the coefficient of $epsilon.alt^j$; inverse powers are Taylor expanded at $1$.
  The first two equations are explicitly

#[#set math.equation(numbering: n => "(3.8)")
 $ F_1 & = 0 \, & B_1 & = 1 / 4 h_q \,\
F_2 & = 15 / 2 u_1^2 - 1 / 8 Q_q \, & B_2 & = - 3 / 4 h_q u_1 \|_S . $ <ana:first-two>]

Only preceding coefficients occur on the right of (3.7). The construction does not require an actual solution
  branch for the seed.

#thm([Lemma 3.2.])[
  (Finite coefficient asymptotics).  #emph[For every smooth finite angular type seed in $C_tau^(1 \, alpha)$,
    the coefficients through degree two are well defined and
$ u_j = r^(- 3) zeta_j \( x \) + o \( r^(- 3) \) \, wide j = 1 \, 2 . $

 The first coefficient has this asymptotic with arbitrarily many spatial derivatives.
   The second has it with the first spatial derivatives, in particular with every derivative needed at degree two
   below.]
  #emph[For the fourth-order construction, suppose specifically that
#[#set math.equation(numbering: n => "(3.9)")
 $ q = "Hess" v - B v \, wide L v = 0 \, wide v arrow.r 0 \,\
v \|_S upright(" has only constant and degree-one spherical modes") . $ <ana:kernel-seed>]

 Corollary 16 will show that every seed with zero quadratic deficit has this form,
   so fourth-order estimates are needed only in this class. Then $q$ and all its derivatives have
   $O \( r^(- 3) \)$ scaled components. The coefficients $u_1 \, dots.h \,
   u_4$ exist and have the above asymptotic with arbitrarily many spatial derivatives.]
  #emph[Let $p = 2$ in the first case and $p = 4$ in the second.
    In the coordinate $eta = "arsinh" r$, the conformal metric jet
    $G = \( 1 + sum_(j = 1)^p epsilon.alt^j u_j \)^4 g_0$, taken through degree $p$, satisfies
#[#set math.equation(numbering: n => "(3.10)")
 $ G - b = r^(- 3) #scale(x: 120%, y: 120%)[\(] C thin upright(d) eta^2 +
   E r^2 sigma #scale(x: 120%, y: 120%)[\)] + o \( r^(- 3) \) \,\
C = 2 m_0 + 4 sum_(j = 1)^p epsilon.alt^j zeta_j \, wide E =
  4 sum_(j = 1)^p epsilon.alt^j zeta_j . $ <ana:metric-asymptotic>]

 For coefficient $j$, the remainder has this decay after angular and $eta$ derivatives through order $p - j + 1$,
   in scaled coframes $upright(d) eta \, r thin upright(d) x$.]
] <ana:coefficients>

#proof[
  Lemma 4 constructs $u_1$ with homogeneous interior equation.
    Its derivatives have the asserted asymptotics by (3.4). In degree two the interior source is a sum of $u_1^2 =
    O \( r^(- 6) \)$ and $\| q \|^2 = O \( r^(- 2 tau) \)$, with $min { 6 \, 2 tau } > 3$.
    Its first radial derivative has the same bound because $q in C_tau^(1 \, alpha)$.
    Finite angular type supplies any fixed number of angular derivatives.
    The inverse lemma therefore gives the claimed second coefficient and, in particular,
    its first differentiated asymptotic. No bound on higher radial derivatives of a general seed is asserted here.
  For (3.9), solve the homogeneous Dirichlet problem separately in its four boundary modes.
    The homogeneous ODE gives $v = O \( r^(- 3) \)$ with all differentiated versions.
    The scaled components of the connection, $B$, and all their derivatives are bounded at infinity.
    It follows that $"Hess" v - B v$ has $O \( r^(- 3) \)$ components with all derivatives.
    Inductively, every interior source in (3.7) is a sum of products containing at least two factors among lower
    solution coefficients and $q$. It therefore has $O \( r^(- 6) \)$ decay with all derivatives.
    Another application of the inverse lemma completes the induction through degree four.
  Finally $g_0 - b = 2 m_0 r^(- 3) upright(d) eta^2 + O \( r^(- 5) \)$ in scaled components, with all derivatives.
    In each positive degree the only $r^(- 3)$ term in $\( 1 + sum epsilon.alt^j u_j \)^4 -
    1$ is $4 r^(- 3) zeta_j$; products of two solution coefficients are $O \( r^(- 6) \)$. This proves (3.10).
    At $p = 2$, the derivative count is two for coefficient one and one for coefficient two,
    both already established. At $p = 4$ all the needed derivatives are available from the stronger case. ◻
]

=== 3.3 An exact Green formula for the mass <an-exact-green-formula-for-the-mass>

Define the test functions

#[#set math.equation(numbering: n => "(3.11)")
 $ W_0 = N \, wide W_i = r x_i quad \( 1 lt.eq i lt.eq 3 \) . $ <ana:tests>]

The background identities and the radial equation give

#[#set math.equation(numbering: n => "(3.12)")
 $ L W_0 = 0 \, wide L W_i = - 3 m_0 r^(- 2) x_i . $ <ana:tests-equations>]

#thm([Lemma 3.3.])[
  (Green representation of the mass).  #emph[For every sufficiently small member of the actual branch,
#[#set math.equation(numbering: n => "(3.13)")
 $ p_mu \( epsilon.alt \) - p_mu \( 0 \) = frac(1, 2 pi) {integral_S #scale(x: 120%, y: 120%)[\(] psi partial_s
   W_mu - W_mu partial_s psi #scale(x: 120%, y: 120%)[\)] thin upright(d) A_(g_0) -
   integral_M #scale(x: 120%, y: 120%)[\(] W_mu L psi - psi L W_mu #scale(x: 120%, y: 120%)[\)] thin upright(d)
   V_(g_0)} . $ <ana:green>]

 In particular the right-hand side is an absolutely convergent integral expression. More generally the linear functional
#[#set math.equation(numbering: n => "(3.14)")
 $ cal(G)_mu \( u \, F \, B \) = frac(1, 2 pi) {integral_S \( u partial_s W_mu - W_mu B \) thin upright(d)
   A_(g_0) - integral_M \( W_mu F - u L W_mu \) thin upright(d) V_(g_0)} $ <ana:green-functional>]

 is bounded in the norms $parallel u parallel_beta + parallel F parallel_(2 beta) +
   parallel B parallel_(C^0 \( S \))$. For finite angular type coefficient jets,
   this same functional computes the coefficient of their metric mass.]
] <lem:green>

#proof[
  First fix $epsilon.alt$; no parameter limit is taken in this argument.
    The assumed weighted regularity gives $psi \, nabla^b psi = O \( r^(- tau) \)$.
    The difference between the actual metric perturbation $phi.alt^4 g_0 -
    g_0$ and $4 psi b$ consists of terms with scaled components and first derivatives
  $ O \( r^(- 2 tau) \) + O \( r^(- tau - 3) \) . $
  Indeed $phi.alt^4 - 1 - 4 psi = O \( psi^2 \)$ and $g_0 - b = O_1 \( r^(- 3) \)$.
    Since a mass test function and its derivative have size $O \( r \)$ and the sphere area has size
    $O \( r^2 \)$, these terms give flux errors
  #[#set math.equation(numbering: n => "(3.15)")
   $ O \( r^(3 - 2 tau) \) + O \( r^(- tau) \) arrow.r 0 . $ <ana:flux-errors>]
  For the tensor $4 psi b$ in dimension three,
  $ "div"_b \( 4 psi b \) - upright(d) "tr"_b \( 4 psi b \) = - 8 upright(d) psi \, $
  and the remaining two terms of the prescribed mass integrand add $8 psi thin upright(d) V_mu$.
    Thus the flux difference is $1 \/ \( 2 pi \)$ times the flux of $psi "grad"_b V_mu - V_mu "grad"_b psi$.
    Replacing the hyperbolic normal by $partial_s$ produces a vanishing error since the relative normal change is
    $O \( r^(- 3) \)$. For the time test, replacing $sqrt(1 + r^2)$ by $N$ also produces a vanishing error,
    because their difference and its first radial derivative are $O \( r^(- 2) \)$. The sphere area forms are the same.
  The $g_0$ divergence of $psi "grad" W_mu - W_mu "grad" psi$ is $psi L W_mu - W_mu L psi$.
    Apply the divergence theorem to $\[ 0 \, T \] times S^2$.
    The outward normal of this integration domain at its inner boundary is $- partial_s$,
    yielding exactly the sign of the boundary term in (3.13).
    Finally $L psi = O \( r^(- 2 tau) \)$ by (3.6); hence the bulk integrals converge, and $T arrow.r
    oo$ proves the identity.
  For the asserted boundedness, $W_mu = O \( e^s \)$ and $upright(d) V_(g_0) =
    O \( e^(2 s) \) thin upright(d) s thin upright(d) omega$. The $W_mu F$ term is dominated by a constant times
  $ parallel F parallel_(2 beta) e^(\( 3 - 2 beta \) s) \, $
  which is integrable by (3.1). The $u L W_i$ term is dominated by $C parallel u parallel_beta e^(- beta s)$,
    and $L W_0 = 0$. The boundary terms are bounded by the stated norms.
    For finite coefficient jets, apply the same finite-radius identity coefficientwise.
    Lemma 5 supplies their differentiated asymptotics, and all nonlinear coefficient products discarded from the
    flux are $O \( r^(- 6) \)$ with first derivatives. Thus their coefficient flux is also (3.14). ◻
]

=== 3.4 Approximation on the full space of seeds <approximation-on-the-full-space-of-seeds>

Let $cal(T)_(tau \, alpha)$ denote the real vector space of smooth TT tensors in $C_tau^(1 \, alpha)$.
  No boundary sign is imposed on this space. We shall construct coefficient functionals on it even when no actual
  branch is being considered.

#thm([Lemma 3.4.])[
  (Rotation approximation and coefficient continuity).  #emph[Every $q in cal(T)_(tau \, alpha)$ is a limit,
    in $parallel dot.op parallel_beta$, of finite angular type tensors $q_nu in cal(T)_(tau \, alpha)$.
    The approximants may be chosen as averages of rotated copies of $q$.
    Their weighted norms are uniformly bounded, and the construction preserves a nonnegative boundary value
    $q_(s s) \|_S$ when that condition holds.]
  #emph[The maps $q mapsto u_1 \[ q \]$ and $q mapsto u_2 \[ q \]$ defined for finite angular type seeds extend
    uniquely by these approximations to continuous, respectively linear and quadratic,
    maps on $cal(T)_(tau \, alpha)$ with values in the weighted uniform norm.
    The corresponding pairs $\( F_j \, B_j \)$ in (3.8) extend continuously in the norms $parallel dot.op
    parallel_(2 beta)$ and $parallel dot.op parallel_(C^0 \( S \))$.]
] <lem:rotation>

#proof[
  Let $U \( R \) q$ denote the pullback by a rotation $R in S O \( 3 \)$,
    and let $upright(d) R$ be normalized invariant volume. Define
  $ k_nu \( R \) = c_nu (frac(1 + "tr" R, 4))^nu \, wide integral_(S O \( 3 \)) k_nu thin upright(d) R = 1 \, wide
    q_nu = integral_(S O \( 3 \)) k_nu \( R \) U \( R \) q thin upright(d) R . $
  The expression raised to the power $nu$ lies in $\[ 0 \, 1 \]$ and attains one only at the identity.
    The normalized densities therefore concentrate there. To verify this directly,
    outside any fixed neighborhood their base is at most $1 - delta$,
    whereas on a smaller neighborhood of positive volume it is at least $1 - delta \/ 2$;
    the ratio of the corresponding integrals tends to zero.
  The map $R mapsto U \( R \) q$ is continuous in $parallel dot.op parallel_beta$.
    On a compact part of $M$ this follows from smoothness. On the tail,
    the bound $C e^(- \( tau - beta \) s)$ is uniform in $R$, so the strict weight margin controls it.
    Concentration gives $parallel q_nu - q parallel_beta arrow.r 0$.
    Rotations preserve $g_0$, the end background, and $s$. They commute with trace and divergence and preserve the
    weighted regularity. Consequently each average is smooth and TT, with the asserted uniform bounds.
    They also preserve the radial normal, so positivity of $q_(s s) \|_S$ is retained by the nonnegative average.
  For fixed $nu$, the density is a polynomial in matrix entries.
    After a change of integration variable, the rotation orbit of $q_nu$ depends on translates of this polynomial.
    These translates lie in a finite-dimensional polynomial space;
    their coefficients multiply finitely many fixed averaged tensors. Thus $q_nu$ has finite angular type.
  It remains to check that the coefficient limits are independent of the approximation.
    On a bounded set in $parallel q parallel_beta$, comparison applied to (3.8) gives, for finite type seeds $q \,
    hat(q)$,
  $ parallel u_1 \[ q \] - u_1 \[ hat(q) \] parallel_beta & lt.eq C parallel q - hat(q) parallel_beta \,\
parallel F_2 \[ q \] - F_2 \[ hat(q) \] parallel_(2 beta) + parallel B_2 \[ q \] -
  B_2 \[ hat(q) \] parallel_(C^0 \( S \)) & lt.eq C parallel q - hat(q) parallel_beta \,\
parallel u_2 \[ q \] - u_2 \[ hat(q) \] parallel_beta & lt.eq C parallel q - hat(q) parallel_beta . $
  Here the elementary product estimate is
  $ parallel \| q \|^2 - \| hat(q) \|^2 #scale(x: 120%, y: 120%)[parallel]_(2 beta)
    lt.eq \( parallel q parallel_beta + parallel hat(q) parallel_beta \) parallel q - hat(q) parallel_beta . $
  The comparison constant has no angular-cutoff dependence.
    These estimates prove existence, uniqueness, and continuity of the limits in the complete weighted uniform
    space. Formula (3.8) preserves their linear and quadratic dependence.
    No derivative convergence of the limiting coefficients is needed in this construction or in the mass functional. ◻
]

=== 3.5 Actual expansions and mass coefficients <actual-expansions-and-mass-coefficients>

#thm([Proposition 3.5.])[
  (Expansions of the given branch).  #emph[For every prescribed seed and branch in the theorem, set $p =
    2$ and take $u_j \, F_j \, B_j$ from Lemma 7. If the seed has the form (3.9), we may instead take $p =
    4$ with the finite coefficient construction. In both cases,
#[#set math.equation(numbering: n => "(3.16)")
 $ ∥psi - sum_(j = 1)^p epsilon.alt^j u_j∥_beta & = O \( epsilon.alt^(p + 1) \) \,\
∥L psi - sum_(j = 1)^p epsilon.alt^j F_j∥_(2 beta) & = O \( epsilon.alt^(p + 1) \) \,\
∥partial_s psi \|_S - sum_(j = 1)^p epsilon.alt^j B_j∥_(C^0 \( S \)) & =
  O \( epsilon.alt^(p + 1) \) . $ <ana:three-remainders>]

 The area and all four mass components have actual expansions to the same order. Their mass coefficients are
#[#set math.equation(numbering: n => "(3.17)")
 $ a_(mu j) \[ q \] = cal(G)_mu \( u_j \, F_j \, B_j \) \, wide p_mu \( epsilon.alt \) = p_mu \( 0 \) +
   sum_(j = 1)^p epsilon.alt^j a_(mu j) \[ q \] + O \( epsilon.alt^(p + 1) \) . $ <ana:mass-coefficients>]

]
  #emph[In particular, the actual deficit satisfies
#[#set math.equation(numbering: n => "(3.18)")
 $ frak(D)_q \( epsilon.alt \) = c_2 \[ q \] epsilon.alt^2 + O \( epsilon.alt^3 \) $ <ana:deficit-second>]

 for every seed under consideration. The coefficient $c_2$ is a continuous quadratic form on
   $cal(T)_(tau \, alpha)$ in the $parallel dot.op parallel_beta$ topology, invariant under rotations.
   For seeds of the form (3.9) there is additionally the actual expansion
#[#set math.equation(numbering: n => "(3.19)")
 $ frak(D)_q \( epsilon.alt \) = c_2 \[ q \] epsilon.alt^2 + c_3 \[ q \] epsilon.alt^3 +
   c_4 \[ q \] epsilon.alt^4 + O \( epsilon.alt^5 \) . $ <ana:deficit-fourth>]

 The subsequent geometric arguments determine the signs and the vanishing of these coefficients.]
] <prop:expansions>

#proof[
  #emph[Initial estimate.] The given convergence of $psi$ in $C_tau^(2 \, alpha)$ implies that $parallel psi
    parallel_(C^0)$ is small. Write $cal(A) \( psi \) = V_psi psi$, extending the quotient by zero at $psi = 0$.
    Then $parallel V_psi parallel_(C^0) = o \( 1 \)$. Moving this term to the potential in (3.6) leaves an
    interior source bounded by $C epsilon.alt^2 e^(- 2 tau s)$ and boundary derivative bounded by $C epsilon.alt$.
    Since $psi = o \( e^(- beta s) \)$, Lemma 4 gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ parallel psi parallel_beta = O \( epsilon.alt \) . $ <ana:initial-bound>]
  #emph[Finite angular type seeds.] Suppose first that the needed coefficients have been constructed by (3.7).
    The first bound (3.20) starts an induction. If
  $ parallel psi - P_(j - 1) parallel_beta = O \( epsilon.alt^j \) \, $
  then $psi$ and $P_(j - 1)$ are both $O \( epsilon.alt e^(- beta s) \)$.
    For such arguments, the mean value theorem applied to (3.5) gives
  $ \| cal(N)_(epsilon.alt \, q) \( psi \) - cal(N)_(epsilon.alt \, q) \( P_(j - 1) \) \| lt.eq
    C epsilon.alt e^(- beta s) \| psi - P_(j - 1) \| = O \( epsilon.alt^(j + 1) e^(- 2 beta s) \) . $
  Taylor substitution into the finite polynomial $P_(j - 1)$ leaves an error of this same order after its
    coefficients through degree $j$ are extracted. Every interior term contains at least two decaying factors,
    counting the factor $Q_q$ as two. On $S$,
  $ \| cal(B)_(epsilon.alt \, q) \( psi \) - cal(B)_(epsilon.alt \, q) \( P_(j - 1) \) \| lt.eq
    C epsilon.alt \| psi - P_(j - 1) \| = O \( epsilon.alt^(j + 1) \) \, $
  and the boundary Taylor error has the same order. Thus $psi -
    P_j$ has interior source $O \( epsilon.alt^(j + 1) e^(- 2 beta s) \)$ and boundary derivative
    $O \( epsilon.alt^(j + 1) \)$. It is $o \( e^(- beta s) \)$ at infinity,
    so comparison improves its weighted norm to $O \( epsilon.alt^(j + 1) \)$.
    This proves all three assertions in (3.16) inductively through the required degree.
    In particular, it proves the fourth-order assertions in the special case (3.9).
  #emph[Arbitrary seeds through degree two.] Let $q_nu$ be the approximants of Lemma 7, and put $d_nu =
    parallel q - q_nu parallel_beta$. Write $u_(j \, nu) \, F_(j \, nu) \, B_(j \, nu)$ for their coefficients.
    These have uniform bounds in the norms of that lemma. We compare them directly with the given branch for $q$;
    no branch for $q_nu$ is introduced. Using (3.20), the equation for $psi -
    epsilon.alt u_(1 \, nu)$ has source $O \( epsilon.alt^2 e^(- 2 beta s) \)$ and boundary derivative
    $O \( epsilon.alt d_nu + epsilon.alt^2 \)$. Hence
  #[#set math.equation(numbering: n => "(3.21)")
   $ parallel psi - epsilon.alt u_(1 \, nu) parallel_beta lt.eq
     C \( epsilon.alt d_nu + epsilon.alt^2 \) . $ <ana:approx-first>]
  Expanding the nonlinearities once more, formula (3.8) and (3.21) imply
  #[#set math.equation(numbering: n => "(3.22)")
   $ parallel L psi - epsilon.alt^2 F_(2 \, nu) parallel_(2 beta) & lt.eq C \( epsilon.alt^2 d_nu + epsilon.alt^3 \) \,\
parallel partial_s psi \|_S - epsilon.alt B_(1 \, nu) - epsilon.alt^2 B_(2 \, nu) parallel_(C^0 \( S \)) & lt.eq
  C #scale(x: 120%, y: 120%)[\(] \( epsilon.alt + epsilon.alt^2 \) d_nu +
  epsilon.alt^3 #scale(x: 120%, y: 120%)[\)] . $ <ana:approx-sources>]
  For clarity, the only quadratic interior discrepancies are $psi^2 -
    epsilon.alt^2 u_(1 \, nu)^2$ and $epsilon.alt^2 \( Q_q - Q_(q_nu) \)$;
    their weighted norms are bounded by the first right-hand side.
    At the boundary the linear discrepancy is $epsilon.alt \( h_q - h_(q_nu) \) \/ 4$,
    and the next one contains $epsilon.alt h_q psi - epsilon.alt^2 h_(q_nu) u_(1 \, nu)$,
    producing exactly the second bound. All remaining terms are cubic with the stated weights.
    Comparison applied to $psi - epsilon.alt u_(1 \, nu) - epsilon.alt^2 u_(2 \, nu)$ now gives
  $ parallel psi - epsilon.alt u_(1 \, nu) - epsilon.alt^2 u_(2 \, nu) parallel_beta lt.eq
    C #scale(x: 120%, y: 120%)[\(] \( epsilon.alt + epsilon.alt^2 \) d_nu +
    epsilon.alt^3 #scale(x: 120%, y: 120%)[\)] . $
  The constants are independent of $nu$. Letting $nu arrow.r
    oo$ and using coefficient continuity proves the full three estimates (3.16) for $p =
    2$ and the original arbitrary seed.
  #emph[Mass, area, and the deficit.] Apply the bounded functional in Lemma 6 to the three remainders.
    This proves (3.17) directly. The area is the compact-boundary integral
  $ A_epsilon.alt = integral_S \( 1 + psi \)^4 thin upright(d) A_(g_0) \, $
  so its expansion follows from the first remainder alone. If $A_epsilon.alt = A_0 + epsilon.alt A_1 +
    epsilon.alt^2 A_2 + O \( epsilon.alt^3 \)$, then
  $ A_1 = 4 integral_S u_1 thin upright(d) A_(g_0) \, wide A_2 =
    integral_S \( 4 u_2 + 6 u_1^2 \) thin upright(d) A_(g_0) . $
  The mass norm is smooth near $\( m_0 \, 0 \, 0 \, 0 \)$ and $b_(*)$ is smooth near $A_0 = 4 pi a^2$.
    Their expansions therefore have the same controlled remainders. The constant deficit is zero.
    Also $F_1 = 0$, $N \|_S = 0$, $partial_s N \|_S = kappa$, and $L N = 0$, so
  $ a_01 = frac(kappa, 2 pi) integral_S u_1 thin upright(d) A_(g_0) = b'_(*) \( A_0 \) A_1 . $
  The spatial mass components have zero base value and first enter the mass norm quadratically.
    This proves that the linear deficit coefficient vanishes.
  In degree two the scalar expression is explicitly
  #[#set math.equation(numbering: n => "(3.23)")
   $ c_2 \[ q \] = a_02 - frac(1, 2 m_0) sum_(i = 1)^3 a_(i 1)^2 - b'_(*) \( A_0 \) A_2 - 1 /
     2 b''_(*) \( A_0 \) A_1^2 . $ <ana:quadratic-functional>]
  Lemma 7 and the bounded Green functional show that this is a continuous quadratic form on the entire formal seed
    space $cal(T)_(tau \, alpha)$. Formula (3.23) uses only the coefficient functions and absolutely convergent
    Green integrals; it does not assume a geometric integral formula for arbitrary seeds.
    Rotations leave the area invariant, fix the time mass component, and rotate the three spatial components.
    Thus $c_2$ is rotation invariant. The identical finite coefficient argument through degree four proves (3.19). ◻
]

#prodef([Remark 3.6.])[
  The derivative control used in (3.15) comes from each actual member’s assumed $C_tau^(2 \, alpha)$ decay.
    It is not a consequence of the weighted uniform Taylor estimates.
    The radius limit is taken for each fixed member to obtain the exact identity (3.13);
    only then are its integrals expanded. Similarly, each finite angular type coefficient is identified with its
    own flux before passing to an approximant limit in the bounded functional (3.14).
    No uniform convergence of discarded derivative flux errors in either parameter or angular cutoff is used.
] <ana:order-of-limits>

== 4 CMC sphere jets and their Hawking mass <sec:cmc>

We use the finite Taylor conventions of Section 2.3. Taylor expansions of inverses, compositions,
  and other smooth geometric operations at a rotation-invariant background preserve finite angular type at each
  fixed order: each coefficient uses only finitely many linear differential operations and tensor products.

=== 4.1 The sphere construction <the-sphere-construction>

In the end put $eta = "arsinh" r$, so that

$ b = upright(d) eta^2 + sinh^2 eta thin sigma . $

An estimate for a tensor below refers to its components in scaled coframes $upright(d) eta \,
  r thin upright(d) x^A$, in fixed smooth angular coordinate charts.
  A differentiated little-oh estimate includes all mixed radial and angular derivatives of the stated total order.

#thm([Proposition 4.1.])[
  (CMC sphere jets).  #emph[Let $p gt.eq 1$, and let $G$ be a smooth Riemannian metric jet of order $p$,
    with base $G_0 = g_0$, whose coefficients have finite angular type.
    Suppose that there are angular scalar jets $C \, E$, with $C_0 = 2 m_0$ and $E_0 = 0$, such that
#[#set math.equation(numbering: n => "(4.1)")
 $ G - b = r^(- 3) #scale(x: 120%, y: 120%)[\(] C thin upright(d) eta^2 +
   E r^2 sigma #scale(x: 120%, y: 120%)[\)] + o \( r^(- 3) \) . $ <cmc:metric-asymptotics>]

 For the coefficient of degree $j$, $1 lt.eq j lt.eq p$, suppose that the remainder satisfies this estimate after
   every mixed radial and angular derivative of total order at most $p - j + 1$.]
  #emph[There is a smooth family of sphere jets $Sigma_s$, $0 lt.eq s < oo$, given by graphs over ${ s } times
    S^2$, with the following properties:]
  + #emph[$Sigma_s$ has constant outward mean curvature through order $p$, and $Sigma_0$ is minimal through that order.]
  + #emph[The graph coefficients have finite angular type. The normal lapse $f$ for variation in $s$ has base
    value $f_0 = 1$.]
  + #emph[If $A \( s \)$ and $H \( s \)$ are the area and mean curvature jets, then the CMC Hawking mass
#[#set math.equation(numbering: n => "(4.2)")
 $ m_H \( Sigma_s \) = sqrt(frac(A \( s \), 16 pi)) (1 - frac(\( H \( s \)^2 - 4 \) A \( s \), 16 pi))
   $ <cmc:hawking-definition>]

 satisfies, coefficientwise,
#[#set math.equation(numbering: n => "(4.3)")
 $ lim_(s arrow.r oo) m_H \( Sigma_s \) = m_(upright("AH")) \( G \) :=
   sqrt(p_0 \( G \)^2 - sum_(i = 1)^3 p_i \( G \)^2) . $ <cmc:hawking-limit>]

 Here $p_mu \( G \)$ is the coefficientwise flux (2.6), and the square root is its formal branch with base value
   $m_0 > 0$.]
] <prop:cmc-jets>

The expression (4.2) is the CMC specialization of the asymptotically hyperbolic Hawking mass used in
  #cite(label("Ambrozio2015")) Equation (2). The proof below checks its limiting normalization against (2.6) directly.

#proof[
  We first solve the Jacobi equations on finite radial intervals.
    At infinity, hyperbolic boosts account for the order-one degree-one displacement.
    The asymptotic CMC equation selects a frame in which the spatial mass components vanish.
    We then choose the free graph means to join those spheres to the minimal first leaf.
  ===== 4.1.1 The graph equation on finite radial intervals. <the-graph-equation-on-finite-radial-intervals.>
  For a normal variation with speed $w$, the mean-curvature variation is
  #[#set math.equation(numbering: n => "(4.4)")
   $ J w = - Delta_Sigma w - #scale(x: 120%, y: 120%)[\(] "Ric"_G \( nu \, nu \) + \| upright("II") \|^2
     #scale(x: 120%, y: 120%)[\)] w . $ <cmc:jacobi-general>]
  Indeed, the induced metric varies by $2 w upright("II")$, the variation of the unit normal is $-
    "grad"_Sigma w$, and differentiation of the second form gives the Hessian term, the ambient curvature term,
    and the quadratic second-form term. Tracing, including the variation of the inverse induced metric,
    gives (4.4). A tangential velocity adds the directional derivative of $H$.
  For a background coordinate sphere, $H_0 = 2 N \/ r$ and
  $ "Ric"_(g_0) \( partial_s \, partial_s \) = - 2 - frac(2 m_0, r^3) \, wide \| upright("II")_0 \|^2 =
    frac(2 N^2, r^2) . $
  Thus its Jacobi operator is
  #[#set math.equation(numbering: n => "(4.5)")
   $ J_s^0 = - Delta_(r^2 sigma) - 2 / r^2 + frac(6 m_0, r^3) . $ <cmc:background-jacobi>]
  On degree-$ell$ spherical harmonics its eigenvalue is
  #[#set math.equation(numbering: n => "(4.6)")
   $ lambda_ell \( s \) = frac(ell \( ell + 1 \) - 2, r^2) + frac(6 m_0, r^3) . $ <cmc:jacobi-eigenvalues>]
  It is strictly positive on every nonconstant mode. In particular,
    the degree-one eigenvalue is $6 m_0 \/ r^3 > 0$. At $s = 0$, using $2 m_0 = a \( 1 + a^2 \)$,
    the constant eigenvalue is
  $ - 2 / a^2 + frac(6 m_0, a^3) = 3 + 1 / a^2 = frac(2 kappa, a) \, $
  and hence $J_0^0 = D$, positive on all modes.
  Write a graph as $s + rho \( s \, x \; epsilon.alt \)$, with $rho_0 = 0$.
    At degree $j$, its mean-curvature coefficient is
  $ J_s^0 rho_j + cal(R)_j \( s \, x \) \, $
  where $cal(R)_j$ is known from the metric coefficients and the lower graph coefficients.
    To make the first sphere minimal, solve this equation at $s = 0$ with right-hand side zero, using $D^(- 1)$.
    At general $s$, prescribe any smooth round mean for $rho_j$ that agrees with this value at zero,
    and solve the projection of the equation onto the nonconstant modes.
    The operator (4.5) preserves the splitting into constants and nonconstants,
    so the latter equation has a unique solution. At each order it is a finite-dimensional linear equation with a
    smooth invertible coefficient matrix at every finite radius.
    This produces smooth coefficients on each finite interval.
    Induction also shows that the resulting graph at zero is exactly the minimal graph jet already constructed
    there. The constant eigenvalue need not be inverted away from zero.
  ===== 4.1.2 The flux aspect. <the-flux-aspect.>
  For an angular scalar $F$, write $chevron.l F chevron.r_sigma = \( 4 pi \)^(- 1) integral_(S^2) F thin
    upright(d) A_sigma$. The asymptotic form (4.1) gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( p_0 \( G \) \, p_1 \( G \) \, p_2 \( G \) \, p_3 \( G \) \) = ⟨mu \( x \) \( 1 \, x \)⟩_sigma \, wide mu =
     frac(C + 3 E, 2) . $ <cmc:mass-aspect>]
  Here $mu$ denotes only a flux aspect. To verify the formula directly, let $e = G - b$.
    Its leading trace is $\( C + 2 E \) r^(- 3)$, and its radial divergence-minus-trace derivative is
  $ \( "div"_b e - upright(d) "tr"_b e \) \( partial_eta \) & = 2 coth eta \( C - E \) r^(- 3) -
    2 partial_eta \( E r^(- 3) \) + o \( r^(- 3) \)\
 & = \( 2 C + 4 E \) r^(- 3) + o \( r^(- 3) \) . $
  For $V_0 = sqrt(1 + r^2)$ or $V_i = r x_i$, let $v = 1$ or $x_i$, respectively.
    Both $V$ and $partial_eta V$ have leading term $r v$. The terms $\( "tr"_b e \) upright(d) V -
    e \( "grad"_b V \, dot.op \)$ add $2 E v r^(- 2) + o \( r^(- 2) \)$ to the normal flux integrand.
    The total is therefore $\( 2 C + 6 E \) v r^(- 2) + o \( r^(- 2) \)$.
    Multiplying by $r^2 upright(d) A_sigma \/ \( 16 pi \)$ proves (4.7).
    The first differentiated remainder assumed in (4.1) makes every omitted flux integral tend to zero.
  ===== 4.1.3 Boosted coordinates. <boosted-coordinates.>
  Realize hyperbolic space as
  $ \( cosh eta \, sinh eta thin x \) subset bb(R)^(3 \, 1) . $
  Let $cal(B) \( d \)$ be the exponential of the Lorentz Lie-algebra matrix with time-space entries $d in
    bb(R)^3$ and zero spatial rotation part. Thus $cal(B) \( 0 \)$ is the identity.
    Write its action on future null vectors as
  #[#set math.equation(numbering: n => "(4.8)")
   $ cal(B) \( d \) \( 1 \, x \) = k \( x \) \( 1 \, y \( x \) \) . $ <cmc:boost-null>]
  For small $d$, $k > 0$. In pullback coordinates the old radius is $k r + O \( r^(- 1) \)$,
    the old radial distance is $eta + log k + O \( r^(- 2) \)$,
    and the old radial unit covector agrees with the new one up to $O \( r^(- 1) \)$ in hyperbolic norm.
    These statements, including all their needed derivatives,
    follow by applying the matrix $cal(B) \( d \)$ to the displayed hyperboloid coordinates.
    Since $cal(B) \( d \)$ preserves $b$, the leading coefficients of its pullback of $G$ are
  #[#set math.equation(numbering: n => "(4.9)")
   $ C_d = k^(- 3) C compose y \, wide E_d = k^(- 3) E compose y . $ <cmc:boost-aspect>]
  For example, the angular part of $upright(d) log k$ has hyperbolic norm $O \( r^(- 1) \)$;
    it therefore changes neither leading scaled diagonal coefficient in (4.1).
  Differentiating (4.8) tangentially and taking Minkowski inner products gives $y^(*) sigma = k^(- 2) sigma$.
    Consequently $upright(d) A_sigma \( y \) = k^(- 2) upright(d) A_sigma \( x \)$, and $\( 1 \, x \) =
    k cal(B) \( d \)^(- 1) \( 1 \, y \)$. Changing angular variables proves the exact leading-flux transformation
  #[#set math.equation(numbering: n => "(4.10)")
   $ ⟨k^(- 3) mu \( y \) \( 1 \, x \)⟩_sigma = cal(B) \( d \)^(- 1) ⟨mu \( x \) \( 1 \, x \)⟩_sigma .
     $ <cmc:boost-mass>]
  This establishes the needed covariance directly for the specified flux.
  ===== 4.1.4 The asymptotic CMC equation. <the-asymptotic-cmc-equation.>
  For large $s$, put $R = r \( s \)$ and $eta_R = "arsinh" R$.
    In the coordinates obtained from $cal(B) \( d \)$, seek a graph
  #[#set math.equation(numbering: n => "(4.11)")
   $ eta = eta_R + frac(h \( x \), R) \, $ <cmc:far-graph>]
  where $d$ and $h$ are jets with zero base values, and every coefficient of $h$ has zero constant and degree-one
    components. The parameters $d \, h$ are held fixed when computing an individual leaf.
    We claim, coefficientwise for bounded input jets in fixed finite angular spaces, that
  #[#set math.equation(numbering: n => "(4.12)")
   $ R^3 #scale(x: 120%, y: 120%)[\(] H - 2 coth eta_R #scale(x: 120%, y: 120%)[\)] = - \( Delta_sigma + 2 \)
     h - \( C_d + 3 E_d \) + o \( 1 \) . $ <cmc:mean-curvature-asymptotic>]
  Here are the estimates underlying this claim. In $b$, the unit normal to (4.11) is
  $ frac(partial_eta - r^(- 2) "grad"_sigma \( h \/ R \), sqrt(1 + r^(- 2) \| upright(d) \( h \/ R \) \|_sigma^2)) . $
  Its divergence gives
  $ H_b = 2 coth eta_R - R^(- 3) \( Delta_sigma + 2 \) h + O \( R^(- 4) \) . $
  Indeed the slope has hyperbolic norm $O \( R^(- 2) \)$, its normalization differs from one by $O \( R^(- 4) \)$,
    and the second Taylor term in $2 coth \( eta_R + h \/ R \)$ is $O \( R^(- 4) \)$.
    These estimates hold for every coefficient of the finite Taylor expansion when the input coefficients are bounded.
  On an unshifted sphere the perturbation in (4.1), after boosting,
    changes the radial lapse by $C_d R^(- 3) \/ 2 + o \( R^(- 3) \)$.
    This contributes $- C_d R^(- 3) + o \( R^(- 3) \)$ to $H$.
    The relative area density changes by $E_d R^(- 3) + o \( R^(- 3) \)$;
    its radial logarithmic derivative contributes $- 3 E_d R^(- 3) + o \( R^(- 3) \)$.
    The mixed components in the remainder contribute $o \( R^(- 3) \)$,
    including their tangential-divergence term. For completeness,
    on a fixed surface the comparison between two metrics $b$ and $hat(g)$ is
  $ upright("II")_(hat(g)) \( X \, Y \) = hat(g) \( nu_(hat(g)) \, nu_b \) upright("II")_b \( X \, Y \) -
    hat(g) #scale(x: 120%, y: 120%)[\(] nu_(hat(g)) \, \( nabla^(hat(g)) - nabla^b \)_X Y
    #scale(x: 120%, y: 120%)[\)] . $
  It follows by splitting $nabla_X^b Y$ into its tangential and normal parts and using normal orthogonality.
    After tracing, the linear metric correction depends smoothly on the tangent plane,
    the background shape operator, and the scaled components of $hat(g) - b \, nabla^b \( hat(g) - b \)$.
    The slope of (4.11) tends to zero, and its background shape operator differs by $o \( 1 \)$ from that of a
    coordinate sphere. Its displacement is $O \( R^(- 1) \)$ in radial distance.
    The leading metric correction on that graph is consequently still $- \( C_d + 3 E_d \) R^(- 3)$.
    Quadratic metric corrections are $O \( R^(- 6) \)$. This proves (4.12).
  The estimate just proved also justifies its use at every Taylor order through $p$.
    A coefficient of $G$ of degree $j$ can undergo at most $p -
    j$ spatial differentiations from Taylor composition with the graph and the boost.
    Mean curvature requires one additional derivative of the metric.
    Thus the mixed derivative allowance $p - j + 1$ in (4.1) controls the coefficient of every remainder after
    multiplication by $R^3$. The base $g_0$ has the required bounds to all orders.
    Angular differential operators cause no further restriction within a fixed finite-dimensional angular space.
    More explicitly, denote the degree-$j$ residual in (4.1) by $cal(E)_j$, and set
  $ omega_j \( R \) = max_(a + b lt.eq p - j + 1) med sup_(r gt.eq R \/ 2) ∥partial_eta^a
    nabla_sigma^b \( r^3 cal(E)_j^(upright("scaled")) \)∥_oo . $
  Then $omega_j \( R \) arrow.r 0$. For every $n lt.eq p$, bounded coefficients of $d \,
    h$ in fixed finite angular spaces give the estimate
  $ ∥\[ thin R^3 \( H - 2 coth eta_R \) + \( Delta_sigma + 2 \) h + C_d + 3 E_d thin \]_n∥_oo lt.eq
    C_(p \, cal(V) \, M) (R^(- 1) + sum_(j = 1)^n omega_j \( R \)) . $
  Here $cal(V)$ denotes the finitely many angular spaces and $M$ a bound for the input coefficients;
    the fixed metric coefficients may also enter the constant.
    The explicit base residual is $O \( r^(- 5) \)$ with all derivatives and is included in the $R^(- 1)$ bound.
    The preceding graph estimates, the product rule, and the derivative count prove this estimate term by term.
    It is an estimate for Taylor coefficients, exactly as needed for the recursion.
  ===== 4.1.5 Solving the rescaled equation. <solving-the-rescaled-equation.>
  Project $R^3 \( H - 2 coth eta_R \)$ onto the nonconstant modes and set the projection equal to zero,
    through order $p$. At the background, the finite-radius linearization preserves the splitting between the
    $h$-modes, of degrees at least two, and the three boost modes. Set
  $ alpha_R = frac(sqrt(1 + R^2), N \( R \)) . $
  A graph variation $h \/ R$ in $eta$ has physical normal displacement $alpha_R h \/ R$.
    Equations (4.5)–(4.6) give its exact degree-$ell$ multiplier in the rescaled equation:
  #[#set math.equation(numbering: n => "(4.13)")
   $ alpha_R #scale(x: 120%, y: 120%)[\(] ell \( ell + 1 \) - 2 + 6 m_0 \/ R #scale(x: 120%, y: 120%)[\)] \, wide
     ell gt.eq 2 . $ <cmc:scaled-inverse-blocks>]
  An infinitesimal boost has $eta$-displacement $d dot.op x$.
    Its physical normal displacement is $alpha_R d dot.op x$, so its multiplier is $6 m_0 alpha_R$.
    These blocks converge respectively to $ell \( ell + 1 \) - 2$ and $6 m_0$, both invertible.
    Equivalently, the latter sign and coefficient follow by differentiating $2 m_0 k^(- 3)$ in (4.12), since $k =
    1 + d dot.op x + O \( \| d \|^2 \)$.
  At each Taylor order only fixed finite angular spaces are involved.
    In particular, the Taylor coefficients at $d = 0$ of the boost map and its compositions are finite sums of
    coordinate functions and angular derivatives of the given profiles.
    This assertion concerns the finite Taylor expansion: it does not require a finite harmonic cutoff to be
    preserved by a finite nonzero boost. One can see the closure directly from the infinitesimal boost field
  $ cal(K)_a = \( a dot.op x \) partial_eta + coth eta thin "grad"_sigma \( a dot.op x \) . $
  It follows by differentiating the hyperboloid coordinates.
    Its Lie derivative, repeated finitely many times, uses only radial derivatives, angular derivatives,
    and multiplication by degree-one profiles, also for tensor fields.
    It follows that the inverses of the finite-dimensional blocks above are bounded for all sufficiently large $R$
    and converge as $R arrow.r oo$.
  Now solve successively for the coefficients of $h \, d$. At each order their linear operator is the displayed
    background linearization. The remaining source depends only on lower solved coefficients and the prescribed
    metric coefficients. Equation (4.12), with its uniform coefficientwise remainder estimate,
    shows inductively that this source converges once the lower coefficients do.
    The converging inverse then gives bounded coefficients of $h \, d$ with limits.
    This starts at degree one and proves the assertion through order $p$.
    Smooth dependence on $s$ follows at every finite radius from the smooth finite-dimensional equations.
  In original coordinates these spheres are graph jets over the background sphere:
    the angular map has identity as base and can be inverted formally.
    Their round mean graph heights are smooth scalar functions of $s$.
    Choose the free means in the finite-radius recursion to agree with these functions for all sufficiently large
    $s$, and to agree with the minimal graph’s means at zero, using a smooth interpolation.
    Inductive uniqueness of the nonconstant graph coefficients makes the resulting recursion coincide with the far
    construction. This gives the family on the whole half-line.
    Its base is the coordinate-sphere family, so its lapse has base one.
  ===== 4.1.6 The Hawking mass limit. <the-hawking-mass-limit.>
  Let $d_oo$ be the coefficientwise limiting boost. The degree-one projection of (4.12) gives
  $ ⟨mu_(d_oo) x_i⟩_sigma = 0 \, wide mu_d = \( C_d + 3 E_d \) \/ 2 . $
  Writing
  $ H_b \( R \) = 2 coth eta_R \, wide B_R = R^3 \( H - H_b \( R \) \) \, $
  the round average of that same equation gives
  $ B_R = - 2 chevron.l mu_d chevron.r_sigma + o \( 1 \) . $
  The area of (4.11) satisfies
  #[#set math.equation(numbering: n => "(4.14)")
   $ frac(A, 4 pi R^2) = 1 + delta_R \, wide delta_R = O \( R^(- 2) \) $ <cmc:area-error>]
  coefficientwise. To see the relevant cancellation, the relative hyperbolic area density is
  $ 1 + 2 coth eta_R thin h / R + O \( R^(- 2) \) \, $
  and the metric correction is $O \( R^(- 3) \)$. The sole possible relative term of order $R^(- 1)$ integrates to
    zero because every coefficient of $h$ has zero round mean.
  Since $H_b \( R \)^2 - 4 = 4 \/ R^2$, direct substitution into (4.2) gives
  $ m_H =  & - frac(R delta_R, 2) sqrt(1 + delta_R) - frac(H_b \( R \) B_R, 4) \( 1 + delta_R \)^(3 \/ 2)\
 & - frac(B_R^2, 8 R^3) \( 1 + delta_R \)^(3 \/ 2) . $
  Therefore
  $ lim_(s arrow.r oo) m_H \( Sigma_s \) = chevron.l mu_(d_oo) chevron.r_sigma . $
  By (4.10), this last scalar is the time component of $cal(B) \( d_oo \)^(- 1) p \( G \)$,
    whose spatial components vanish. Lorentz invariance and its positive base value $m_0$ identify it with the
    formal square root in (4.3). ◻
]

#prodef([Remark 4.2.])[
  For the conformal jets used in the quadratic argument, the coefficient of degree one solves a homogeneous
    finite-mode equation $L u = 0$; Lemma 4 gives all its differentiated asymptotics.
    The degree-two coefficient needs only the first differentiated asymptotic in Proposition 10,
    which is supplied by the given $C_tau^(1 \, alpha)$ decay of a finite-angular-type seed and the same radial
    equation. The fourth-order construction will be used only after the seed has been reduced to $Q \( v \) =
    "Hess" v - B v$, with $v$ a homogeneous solution containing only constant and degree-one angular modes.
    Then all spatially differentiated decay estimates needed above hold.
    These are distinct uses of the proposition; higher radial decay derivatives of an arbitrary seed are not required.
] <cmc:regularity-budget>

=== 4.2 The Hawking variation identity <the-hawking-variation-identity>

On the sphere jets of Proposition 10, write

$ chevron.l u chevron.r = 1 / A integral_(Sigma_s) u thin upright(d) A_G \, wide macron(f) =
  chevron.l f chevron.r \, wide delta f = f - macron(f) . $

Here averages are with respect to the induced metric; the round average retains the subscript $sigma$.
  Let $J$ be the full Jacobi operator (4.4), and let $upright("II")^compose$ be the tracefree second fundamental form.

#thm([Lemma 4.3.])[
  (CMC Hawking variation).  #emph[The following identity holds through the order of the sphere and metric jets:
#[#set math.equation(numbering: n => "(4.15)")
 $ frac(upright(d), upright(d) s) m_H = sqrt(frac(A, 16 pi)) frac(H A, 8 pi)
   [macron(f) ⟨frac("Scal"_G + 6 + \| upright("II")^compose \|^2, 2)⟩ + 1 / macron(f) chevron.l delta f thin J
   delta f chevron.r] . $ <cmc:hawking-variation>]

]
] <lem:hawking-variation>

#proof[
  The area and mean-curvature variation formulas give
  $ A' = A H macron(f) \, wide H' = J f . $
  The latter is a constant on each leaf; any tangential transport term vanishes since $H$ is constant there.
    For brevity put
  $ c = frac(4 pi, A) + 3 - frac(3 H^2, 4) \, wide Q_H = frac("Scal"_G + 6 + \| upright("II")^compose \|^2, 2) . $
  Differentiation of (4.2) gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ m'_H = sqrt(frac(A, 16 pi)) frac(H A, 8 pi) \( c macron(f) - H' \) . $ <cmc:raw-variation>]
  The Gauss equation and $\| upright("II") \|^2 = H^2 \/ 2 + \| upright("II")^compose \|^2$ imply
  $ J 1 = K_Sigma + 3 - frac(3 H^2, 4) - Q_H \, $
  where $K_Sigma$ is intrinsic Gauss curvature. The sphere jets have $integral K_Sigma thin upright(d) A_G =
    4 pi$ coefficientwise. One can verify this without a limiting argument:
    the variation of integrated scalar curvature on a closed two-dimensional metric is the integral of a
    divergence minus its variation tensor paired with $"Ric" - 1 / 2 "Scal" thin g$.
    The latter tensor is zero in dimension two, so that integral is constant under every variation and equals its
    round value. Applying the same identity to the Taylor coefficients proves the assertion for jets. Consequently
  $ chevron.l J 1 chevron.r = c - chevron.l Q_H chevron.r . $
  The operator $J$ is self-adjoint on the closed leaf. Since $chevron.l delta f chevron.r = 0$ and $J f =
    H'$ is constant,
  $ H' & = macron(f) #scale(x: 120%, y: 120%)[\(] c - chevron.l Q_H chevron.r #scale(x: 120%, y: 120%)[\)] +
    chevron.l delta f thin J 1 chevron.r \,\
0 & = chevron.l delta f thin J f chevron.r = macron(f) chevron.l delta f thin J 1 chevron.r +
  chevron.l delta f thin J delta f chevron.r . $
  The scalar jet $macron(f)$ is invertible because its base value is one. Eliminating the common term gives
  $ c macron(f) - H' = macron(f) chevron.l Q_H chevron.r + macron(f)^(- 1) chevron.l delta f thin J delta f
    chevron.r . $
  Substitution into (4.16) proves the identity. All calculations may first be made on a compact radial interval.
    Smooth representatives of the metric and graph jets realize the ordinary geometric variation identities there,
    and the imposed CMC identities hold to the required Taylor order. ◻
]

=== 4.3 The first nonzero coefficient <the-first-nonzero-coefficient>

#thm([Proposition 4.4.])[
  (Leading coefficient as a positive integral).  #emph[Use the construction of Proposition 10 through order $2 l$,
    where $l gt.eq 1$, and let $A_(upright("leaf")) = A \( 0 \)$ be the area jet of its minimal first leaf.
    Suppose, as ambient and leafwise coefficient identities, respectively, that
#[#set math.equation(numbering: n => "(4.17)")
 $ "Scal"_G + 6 = epsilon.alt^(2 l) \| k \|_(g_0)^2 + O \( epsilon.alt^(2 l + 1) \) \, wide
   upright("II")^compose = epsilon.alt^l U + O \( epsilon.alt^(l + 1) \) \, wide delta f = epsilon.alt^l F +
   O \( epsilon.alt^(l + 1) \) . $ <cmc:leading-assumptions>]

 Here $k$ is a smooth tensor on $M$; the fields $U \, F$ on the background spheres are identified with fields on
   $M$. Then every coefficient below degree $2 l$ of $m_(upright("AH")) \( G \) -
   b_(*) \( A_(upright("leaf")) \)$ vanishes, and
#[#set math.equation(numbering: n => "(4.18)")
 $ & #scale(x: 120%, y: 120%)[\[] m_(upright("AH")) \( G \) -
   b_(*) \( A_(upright("leaf")) \) #scale(x: 120%, y: 120%)[\]]_(2 l)\
 & quad = frac(1, 16 pi) integral_0^oo N \( s \) integral_({ s } times S^2) (\| k \|^2 + \| U \|^2 + 2 F J_s^0 F)
   upright(d) A_(g_0) thin upright(d) s gt.eq 0 . $ <cmc:leading-integral>]

 All norms in this formula use the background metrics. The displayed iterated integral is finite.
   If it vanishes, then $k \, U \, F$ vanish for $s > 0$, and also at the boundary by continuity.]
] <prop:leading-energy>

#proof[
  The first nonzero coefficient $F$ has zero round mean on each background sphere:
    extract degree $l$ from $integral_(Sigma_s) delta f thin upright(d) A_G = 0$,
    using the vanishing of all lower coefficients of $delta f$.
    Every term in the bracket in (4.15) starts at degree $2 l$.
    At that degree, all exterior factors can therefore be evaluated at the background:
  $ A_0 = 4 pi r^2 \, quad H_0 = 2 N \/ r \, quad macron(f)_0 = 1 \, quad sqrt(frac(A_0, 16 pi)) H_0 = N . $
  The same reasoning evaluates the norms, the induced measure,
    and the Jacobi operator inside the leading terms at the background.
    Composing the ambient scalar coefficient with a graph displacement changes only higher degrees. It follows that
  #[#set math.equation(numbering: n => "(4.19)")
   $ \[ m'_H \]_(2 l) = frac(N \( s \), 16 pi) integral_({ s } times S^2) #scale(x: 120%, y: 120%)[\(] \|
     k \|^2 + \| U \|^2 + 2 F J_s^0 F #scale(x: 120%, y: 120%)[\)] upright(d) A_(g_0) \, $ <cmc:leading-derivative>]
  and all lower coefficient derivatives vanish.
  The integrand in (4.19) is nonnegative after sphere integration. Indeed, on the mean-zero field $F$,
  $ integral_({ s } times S^2) F J_s^0 F thin upright(d) A_(g_0) =
    sum_(ell gt.eq 1) (frac(ell \( ell + 1 \) - 2, r^2) + frac(6 m_0, r^3)) parallel F_ell
    parallel_(L^2 \( r^2 sigma \))^2 . $
  Only finitely many modes occur, and every displayed eigenvalue is strictly positive at a finite radius.
    Also $N \( s \) > 0$ for $s > 0$.
  For any finite $T$, integrate the coefficient identities on $\[ 0 \, T \]$.
    The first leaf is minimal to the required order, so $m_H \( Sigma_0 \) =
    b_(*) \( A_(upright("leaf")) \)$ through that order. The coefficientwise endpoint limits exist by (4.3).
    For degree $2 l$, the right-hand side of the integrated (4.19) is an increasing function of $T$ and its limit
    equals the finite limiting endpoint coefficient. This proves both its convergence and (4.18).
    For lower degrees the integrated derivative is zero, proving their claimed vanishing.
  This order of operations uses only smooth jets on finite radial intervals and coefficientwise endpoint limits.
    In particular, convergence of the derivatives of the asymptotic graph coefficients or of their lapse is not
    needed to obtain the integral’s convergence. If the integral is zero,
    each of its continuous nonnegative sphere-integrated summands is zero for every $s > 0$.
    The positivity just established forces $k = U = F = 0$ there. Smoothness gives their boundary values. ◻
]

== 5 The quadratic estimate and its complete kernel <sec:quadratic>

All contractions in this section, unless a different metric is indicated, use $g_0$.
  We write $upright(d) V_0$ and $upright(d) A_0$ for its volume form and its induced area form.
  A function appearing in an integral over $S$ is understood to be restricted to $S$. Introduce

$ Q \( v \) = "Hess"_(g_0) v - v B . $

The boundary normal $n = partial_s$ points into $M$; the outward normal of the domain $M$ along its inner boundary
  is therefore $- n$.

#thm([Lemma 5.1.])[
  (The weighted TT square identity).  #emph[Let $k$ be a smooth TT tensor of finite angular type, with decay $k =
    O \( r^(- gamma) \)$ for some $gamma > 3 \/ 2$. Let $v$ be the decaying solution of
#[#set math.equation(numbering: n => "(5.1)")
 $ L v = 0 \, wide v \|_S = D^(- 1) \( k_(s s) \|_S \) . $ <eq:tt-dirichlet>]

 Then $Q \( v \)$ is TT, $Q \( v \)_(s s) \|_S = k_(s s) \|_S$, and
#[#set math.equation(numbering: n => "(5.2)")
 $ integral_M N \| k \|^2 thin upright(d) V_0 - kappa integral_S v D v thin upright(d) A_0 = integral_M N \| k -
   Q \( v \) \|^2 thin upright(d) V_0 . $ <eq:tt-square>]

 All integrals in this identity converge. In particular, no sign assumption on $k_(s s) \|_S$ is needed.]
] <lem:tt-square>

#proof[
  The operator $D = - Delta_S + 2 kappa \/ a$ is strictly positive on all spherical harmonics.
    Lemma 4, applied to the finitely many modes of the boundary datum, gives the unique solution of (5.1);
    it has $v = O \( r^(- 3) \)$ with the differentiated asymptotics needed below.
  The background identities $"tr" B = 3$, $"div" B = 0$, and $B = "Ric"_(g_0) + 3 g_0$ imply,
    by commuting the derivatives of a function,
  $ "tr" Q \( v \) = Delta v - 3 v = L v \, wide \( "div" Q \( v \) \)_i =
    nabla_i Delta v + \( "Ric"_(i j) - B_(i j) \) nabla^j v = nabla_i L v . $
  Thus $Q \( v \)$ is TT. Since $S$ is totally geodesic, the tangential trace of $"Hess" v$ on $S$ is $Delta_S v$.
    Moreover $B_t \( 0 \) = kappa \/ a$. Taking the tangential trace of $Q \( v \)$ and using its vanishing full
    trace therefore yields
  #[#set math.equation(numbering: n => "(5.3)")
   $ Q \( v \)_(s s) \|_S = - Delta_S v + 2 \( kappa \/ a \) v = D v . $ <eq:q-normal-boundary>]
  Set $omega = N thin upright(d) v - v thin upright(d) N$. With the averaged convention for the symmetric
    gradient, $"sym" nabla omega = \( nabla_i omega_j + nabla_j omega_i \) \/ 2$,
    the mixed products cancel and the static identity $"Hess" N = N B$ gives
  $ "sym" nabla omega = N "Hess" v - v "Hess" N = N Q \( v \) . $
  Symmetry and vanishing divergence of $k$ consequently give, on $M_R = { 0 lt.eq s lt.eq s \( R \) }$,
  $ integral_(M_R) N chevron.l k \, Q \( v \) chevron.r thin upright(d) V_0 =
    integral_(partial M_R) k \( nu \, omega^sharp \) thin upright(d) A_0 . $
  On $S$, $N = 0$ and $upright(d) N = kappa thin upright(d) s$, so that $omega^sharp = - kappa v n$.
    Since $nu = - n$ there, the inner contribution is $+ kappa integral_S v k_(s s) thin upright(d) A_0$.
    At infinity, $\| omega \| = O \( r^(- 2) \)$, and hence the outer contribution is $O \( r^(- gamma) \)$ and
    tends to zero. We obtain
  #[#set math.equation(numbering: n => "(5.4)")
   $ integral_M N chevron.l k \, Q \( v \) chevron.r thin upright(d) V_0 =
     kappa integral_S v k_(s s) thin upright(d) A_0 = kappa integral_S v D v thin upright(d) A_0 . $ <eq:tt-pairing>]
  The same calculation with $k$ replaced by $Q \( v \)$ gives $integral_M N \| Q \( v \) \|^2 thin upright(d)
    V_0 = kappa integral_S v D v thin upright(d) A_0$. Expanding the square proves (5.2).
    Finally, $N upright(d) V_0$ has radial size $O \( r^3 \) thin upright(d) s thin upright(d) A_sigma$,
    so the integral of $N \| k \|^2$ converges because $2 gamma > 3$.
    The stronger decay of $Q \( v \)$ gives all remaining convergence assertions. ◻
]

=== 5.1 The boundary area correction <the-boundary-area-correction>

For the moment let $q$ have finite angular type, and use the conformal metric jet $g =
  phi.alt^4 g_0$ through order two. Write $u = u_1 \[ q \]$, so that $L u = 0$ and $u_s \|_S = q_(s s) \/ 4$.
  Apply Proposition 10, and let $A_(upright("leaf"))$ denote the area of its first, minimal Taylor leaf.
  This notation concerns that formal leaf alone; it is not an enclosing-area infimum. Let

$ U = \[ upright("II")^compose \]_1 \, wide F = \[ f - macron(f) \]_1 \, $

where $f$ is the lapse and $macron(f)$ its area average on each leaf.
  Thus $F$ has zero round mean on each background sphere.

Let $v$ solve (5.1) with $k = q$. At the fixed boundary, the conformal boundary equation gives

$ H_g \( S \) = epsilon.alt phi.alt^(- 6) q_(s s) . $

If $h_1$ is the first normal height of the minimal Taylor leaf, its mean-curvature equation is

$ D h_1 + q_(s s) = 0 \, wide h_1 = - v \|_S . $

The height difference from that leaf to $S$ is therefore $epsilon.alt v \|_S + O \( epsilon.alt^2 \)$.
  Area has zero first variation at a minimal leaf, and its Hessian at the base sphere is $D$.
  Taylor expansion about the minimal leaf gives

#[#set math.equation(numbering: n => "(5.5)")
 $ A \( S \) - A_(upright("leaf")) = epsilon.alt^2 / 2 integral_S v D v thin upright(d) A_0 +
   O \( epsilon.alt^3 \) quad upright("as an identity of jets") . $ <eq:quadratic-area-gap>]

Indeed, a first-order perturbation of the area Hessian would multiply two first-order displacements and first
  enter order three. The first variation at the minimal Taylor leaf vanishes to the order needed.
  This reasoning also applies when its leading displacement points across the boundary:
  it uses only the smooth boundary jets and their Taylor extension, as in the construction of the formal leaves.

#thm([Proposition 5.2.])[
  (The quadratic deficit).  #emph[On the real linear space of all smooth TT seeds with the prescribed decay,
    the first deficit coefficient is zero and the second coefficient $c_2 \[ q \]$ is a continuous,
    rotation-invariant, nonnegative quadratic form. For a finite-angular-type seed it is given by
#[#set math.equation(numbering: n => "(5.6)")
 $ c_2 \[ q \] = frac(1, 16 pi) integral_M N (\| q - Q \( v \) \|^2 + \| U \|^2 + 2 F J_s^0 F) thin upright(d) V_0 \,\
J_s^0 = - Delta_(r^2 sigma) - 2 / r^2 + frac(6 m_0, r^3) . $ <eq:quadratic-positive-form>]

 The last term is integrated on the spheres before radial integration. For every actual branch in Theorem 1,
#[#set math.equation(numbering: n => "(5.7)")
 $ frak(D)_q \( epsilon.alt \) = c_2 \[ q \] epsilon.alt^2 + o \( epsilon.alt^2 \) . $ <eq:actual-quadratic-deficit>]

 In particular, $c_2 \[ q \] > 0$ implies a strictly positive deficit for all sufficiently small positive
   $epsilon.alt$.]
] <prop:quadratic>

#proof[
  For a finite-angular-type seed the scalar constraint gives $"Scal"_g + 6 = epsilon.alt^2 \| q \|^2 +
    O \( epsilon.alt^3 \)$. Proposition 13, with $l = 1$, shows that the constant and first coefficients of the
    mass norm minus $b_(*) \( A_(upright("leaf")) \)$ vanish, and that its second coefficient is
  $ frac(1, 16 pi) integral_M N #scale(x: 120%, y: 120%)[\(] \| q \|^2 + \| U \|^2 +
    2 F J_s^0 F #scale(x: 120%, y: 120%)[\)] thin upright(d) V_0 . $
  The areas in (5.5) agree through order one, so the first coefficient of the original deficit is also zero.
    Since $b'_(*) \( 4 pi a^2 \) = kappa \/ \( 8 pi \)$, the contribution to its second coefficient from that area
    difference is $- kappa \( 16 pi \)^(- 1) integral_S v D v thin upright(d) A_0$.
    Lemma 14 now proves (5.6) with precisely the displayed factor and sign.
  On a spherical harmonic with $- Delta_sigma$ eigenvalue $lambda gt.eq 2$, the eigenvalue of $J_s^0$ is
  $ frac(lambda - 2, r^2) + frac(6 m_0, r^3) > 0 . $
  Thus its quadratic form is strictly positive on mean-zero functions at every finite $s$,
    and $N > 0$ for $s > 0$. This proves nonnegativity for finite-angular-type seeds without any boundary sign
    restriction.
  Proposition 8 defines $c_2$ on the full real space $cal(T)_(tau \, alpha)$ of smooth TT seeds as a continuous,
    rotation-invariant quadratic form, independently of branch existence and boundary sign, and proves $c_1 = 0$.
    For an arbitrary seed $q$, take the finite-angular-type TT approximants $q_nu$ from Lemma 7.
    The formula proved above gives $c_2 \[ q_nu \] gt.eq 0$, and continuity in $parallel dot.op
    parallel_beta$ gives $c_2 \[ q \] gt.eq 0$. Proposition 8 also supplies (5.7) for every prescribed actual branch. ◻
]

=== 5.2 All null directions <all-null-directions>

Define the fixed vector space

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(K) = {Q \( v \) : L v = 0 \, med v upright(" decays") \, quad v \|_S in "span"_(bb(R)) { 1 \, x_1 \, x_2 \,
   x_3 }} . $ <eq:kernel-space>]

The decaying solutions in this definition have finite angular type and $O \( r^(- 3) \)$ decay with all the
  differentiated bounds obtained from their homogeneous radial equations.

#thm([Corollary 5.3.])[
  (The complete quadratic kernel).  #emph[The kernel of $c_2$ is exactly $cal(K)$,
    a four-dimensional real vector space. In particular, the nonzero degree-one directions are genuine quadratic
    null directions.]
] <cor:kernel>

#proof[
  First suppose $q$ has finite angular type and $c_2 \[ q \] = 0$.
    Equation (5.6) and the strict positivity just proved imply
  #[#set math.equation(numbering: n => "(5.9)")
   $ q = Q \( v \) \, wide U = 0 \, wide F = 0 quad upright("on ") s > 0 . $ <eq:quadratic-equality-conditions>]
  Smoothness extends these equalities to the boundary. Coordinate spheres are umbilic under conformal changes of
    $g_0$. At the base minimal sphere, the tracefree second-form variation due to a normal height $h_1$ is
    $- \( "Hess"_S h_1 \)^compose$: the radial curvature term is pure trace.
    Since $h_1 = - v \|_S$, the vanishing of $U \|_S$ implies $\( "Hess"_sigma \( v \|_S \) \)^compose = 0$.
    For completeness, the divergence of this equation on the unit sphere gives
    $upright(d) \( Delta_sigma v + 2 v \) = 0$. Subtracting the mean reduces it to
    $"Hess"_sigma \( v - macron(v) \) = - \( v - macron(v) \) sigma$.
    This equation determines its solution along every geodesic from its value and differential at one point,
    and its solutions are precisely the linear coordinate functions. Thus $v \|_S$ is a constant plus a linear harmonic.
  Uniqueness of the decaying Dirichlet problem for $L$ then excludes every other angular mode throughout $M$.
    Each degree-one radial coefficient is a multiple of the same decaying solution of
  #[#set math.equation(numbering: n => "(5.10)")
   $ V'' + 2 N / r V' - (3 + 2 / r^2) V = 0 . $ <eq:dipole-radial-ode>]
  Hence $q in cal(K)$. Conversely, every element of $cal(K)$ is null, as we now check; the conditions $U = F =
    0$ do not impose a further restriction on its degree-one part.
  Take $q = Q \( v \) in cal(K)$. The first conformal coefficient $u$ also has only constant and linear modes,
    by its Neumann equation and decaying uniqueness. Let $h \( s \, x \)$ be the first height coefficient of the
    CMC spheres, and put $p = N \/ r$. Conformal variation of mean curvature and first variation of the lapse give
  #[#set math.equation(numbering: n => "(5.11)")
   $ \[ H \]_1 = J_s^0 h + 4 \( u_s - p u \) \, wide \[ f \]_1 = h_s + 2 u . $ <eq:first-cmc-conformal-variations>]
  Here the second identity follows by taking the normal component of the velocity of the graph $s +
    epsilon.alt h \( s \, x \)$ in $g_0 + 4 epsilon.alt u g_0$. On the degree-one part, the CMC equation therefore fixes
  #[#set math.equation(numbering: n => "(5.12)")
   $ h = - frac(2 r^3, 3 m_0) \( u_s - p u \) . $ <eq:dipole-cmc-height>]
  All formulas in the next calculation are componentwise on that part. The background equations and (5.10) give
  $ p' = frac(3 m_0, r^3) - 1 / r^2 \, wide p^2 = 1 + 1 / r^2 - frac(2 m_0, r^3) \, wide u'' = - 2 p u' +
    (3 + 2 / r^2) u . $
  Consequently,
  #[#set math.equation(numbering: n => "(5.13)")
   $ 1 / r^3 partial_s #scale(x: 120%, y: 120%)[\[] r^3 \( u' - p u \) #scale(x: 120%, y: 120%)[\]] & =
     3 p \( u' - p u \) + u'' - p' u - p u'\
 & = (3 + 2 / r^2 - p' - 3 p^2) u = frac(3 m_0, r^3) u . $ <eq:dipole-cancellation>]
  It follows that $h_s = - 2 u$ on the degree-one part, so its lapse fluctuation vanishes.
    The freely chosen radial mean of $h$ changes $\[ f \]_1$ only by a radial function,
    which disappears upon subtracting the mean. Thus $F = 0$ independently of the radial labeling.
  At every background sphere, the tracefree second-form variation of these graphs is
    $- \( "Hess"_(r^2 sigma) h \)^compose$; the conformal variation and radial curvature terms are pure trace.
    The constant and linear modes of $h$ have vanishing tracefree spherical Hessian, so $U = 0$ as well.
    At $S$ there is also exact agreement with the prescribed first minimal height: on degree one,
  $ D_1 = frac(6 m_0, a^3) \, wide h \( 0 \) = - frac(4 u_s \( 0 \), D_1) = - v \( 0 \) . $
  We already have $q = Q \( v \)$, and hence (5.6) proves $c_2 \[ q \] = 0$.
    Existence and uniqueness for each of the four boundary modes show that $cal(K)$ has dimension at most four;
    it has dimension exactly four because (5.3) and invertibility of $D$ make the map from these boundary data to
    $Q \( v \)$ injective.
  It remains to rule out additional null directions of arbitrary angular type.
    Let $cal(Z) = { q : c_2 \[ q \] = 0 }$ in the full smooth TT space.
    A nonnegative quadratic form has a linear kernel: if $c_2 \[ q \] = 0$,
    nonnegativity of $c_2 \[ q + t h \]$ for all real $t$ forces its polarized bilinear form to vanish on
    $\( q \, h \)$ for every $h$. By Proposition 15, $cal(Z)$ is also closed in $parallel dot.op
    parallel_beta$ and invariant under rotations. For $q in cal(Z)$,
    let $q_j$ be its polynomial rotational averages from Lemma 7.
    Each such average is a norm limit of finite linear combinations of rotations of $q$;
    therefore $q_j in cal(Z)$. Each $q_j$ has finite angular type, so the preceding argument puts it in $cal(K)$.
    Since $q_j arrow.r q$ in norm and the fixed finite-dimensional space $cal(K)$ is closed in that norm,
    $q in cal(K)$. This proves the full assertion without applying a pointwise geometric limit to the CMC fields
    $U$ and $F$. ◻
]

#prodef([Remark 5.4.])[
  (The boundary sign and the null space).  If $v \|_S = c + d dot.op x$, then
  $ Q \( v \)_(s s) \|_S = D_0 c + D_1 d dot.op x \, wide D_0 = frac(2 kappa, a) \, quad D_1 = 2 / a^2 +
    frac(2 kappa, a) = frac(6 m_0, a^3) . $
  Thus $Q \( v \)_(s s) \|_S gt.eq 0$ is equivalent to $D_0 c gt.eq D_1 \| d \|$.
    A nonzero pure dipole fails that condition, but a sufficiently large positive radial component makes a mixed
    radial–dipole seed satisfy it. This is a compatibility statement about seeds,
    not an existence claim for branches satisfying outermostness and outer area-minimization.
    In particular, the boundary sign cannot be used to discard the degree-one null directions from the proof.
] <rem:kernel-sign>

== 6 Fourth order in the quadratic kernel <sec:quartic>

We now treat the kernel left by Proposition 15. A statement about a fourth-order jet is an identity modulo
  $epsilon.alt^5$, in the conventions of Section 2.3; it does not assert the existence of the corresponding
  geometric object at a nonzero parameter.

#thm([Proposition 6.1.])[
  (The quartic coefficient).  #emph[Suppose that $c_2 \[ q \] = 0$.
    Write the representation furnished by Corollary 16 as
$ q = Q \( v \) := "Hess"_(g_0) v - B v \, wide L v = 0 \, wide v = v_0 \( s \) + v_1 \( s \, x \) \, $

 where $v_1$ has only degree-one spherical modes and $v$ decays at infinity. Then
$ c_0 \[ q \] = c_1 \[ q \] = c_2 \[ q \] = c_3 \[ q \] = 0 \, wide c_4 \[ q \] gt.eq 0 . $

 If $v_1 equiv.not 0$, then $c_4 \[ q \] > 0$. In particular,
   in that case the actual deficit $frak(D)_q \( epsilon.alt \)$ is strictly positive for all sufficiently small
   positive $epsilon.alt$.]
] <prop:quartic>

The proof has three steps. Lemmas 19 and 20 change the slice and compare its boundary area with a minimal leaf,
  giving a quartic TT square. If that square vanishes, Sections 6.4–6.5 force the degree-one profile to vanish.
  The actual expansion from Proposition 8 then proves the assertion for the given branch.

Throughout the proof we use the stronger decay supplied by the kernel representation.
  The homogeneous separated equations for $v$, and Lemma 4,
  give $O \( r^(- 3) \)$ decay with every required derivative for $v$ and $q = Q \( v \)$.
  The conformal coefficients through degree four consequently have differentiated $O \( r^(- 3) \)$ decay and
  finite angular type. Put

$ u = \[ phi.alt_epsilon.alt \]_1 \, wide L u = 0 . $

We use the fourth-order jets of the original data $g_epsilon.alt = phi.alt_epsilon.alt^4 g_0$ and $K_epsilon.alt =
  epsilon.alt phi.alt_epsilon.alt^(- 2) q$. Their initial constraints and their boundary expansion equation hold
  as Taylor identities.

=== 6.1 A change of slice at the level of jets <a-change-of-slice-at-the-level-of-jets>

#thm([Lemma 6.2.])[
  (The corrected slice).  #emph[There is a decaying finite-angular-type function $w$, with $w \|_S = 0$,
    for which the following construction is defined through degree four.
    Formally evolve the initial jets in Gaussian time and take the graph
#[#set math.equation(numbering: n => "(6.1)")
 $ T = - epsilon.alt v + epsilon.alt^2 w . $ <quart:time-graph>]

 The induced metric and future second fundamental form, denoted by $tilde(g)$ and $tilde(K)$, satisfy
#[#set math.equation(numbering: n => "(6.2)")
 $ tilde(K) & = epsilon.alt^2 k + O \( epsilon.alt^3 \) \, & "tr"_(g_0) k & = 0 \, & "div"_(g_0) k & = 0 \,\
"Scal"_(tilde(g)) + 6 & = epsilon.alt^4 \| k \|_(g_0)^2 + O \( epsilon.alt^5 \) . $ <quart:leading-k>]

 Here $k = O \( r^(- 3) \)$, with all derivatives needed for the fourth-order CMC construction.
   Coefficientwise through degree four,
#[#set math.equation(numbering: n => "(6.3)")
 $ tilde(g) - g_epsilon.alt = O \( r^(- 6) \) $ <quart:metric-decay>]

 with the required differentiated bounds. Thus the mass covectors and their Lorentz norms agree through that
   degree. Moreover,
#[#set math.equation(numbering: n => "(6.4)")
 $ \[ tilde(g) - g_epsilon.alt \]_2 = - 2 v q - B v^2 - upright(d) v ⊗ upright(d) v = - "Hess"_(g_0) \( v^2 \) +
   upright(d) v ⊗ upright(d) v + B v^2 . $ <quart:metric-two>]

]
] <lem:slice>

#proof[
  We give the formal evolution and its constraint justification before performing the graph calculation. Write
  $ overline(g) = - upright(d) t^2 + gamma \( t \) \, wide gamma \( 0 \) = g_epsilon.alt \, wide cal(K) \( 0 \) =
    K_epsilon.alt \, $
  and determine a full formal time series recursively from
  #[#set math.equation(numbering: n => "(6.5)")
   $ partial_t gamma & = 2 cal(K) \,\
partial_t cal(K) & = - "Ric"_gamma - 3 gamma - \( "tr"_gamma cal(K) \) cal(K) +
  2 cal(K) compose_gamma cal(K) . $ <quart:gaussian-evolution>]
  The coefficients take values in the ring of smooth spatial jets modulo $epsilon.alt^5$.
    At each time order the right side is a known spatial differential expression in previously determined
    coefficients, so the recursion is well defined. A substitution $t = T =
    O \( epsilon.alt \)$ uses only finitely many of these coefficients.
    Keeping a full time series here ensures that taking time derivatives never treats an omitted time coefficient
    as zero.
  Let $H = "tr"_gamma cal(K)$. The time-index Christoffel symbols are
  $ overline(Gamma)_(i j)^t = cal(K)_(i j) \, wide overline(Gamma)_(t j)^i = cal(K)^i zws_j \, $
  and direct contraction of the curvature gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ overline("Ric")_(i j) & = "Ric"_(gamma \, i j) + partial_t cal(K)_(i j) + H cal(K)_(i j) -
     2 \( cal(K) compose_gamma cal(K) \)_(i j) \,\
overline("Ric")_(t t) & = - "tr"_gamma \( partial_t cal(K) \) + \| cal(K) \|_gamma^2 \, &
  overline("Ric")_(t i) & = \( "div"_gamma cal(K) \)_i - partial_i H . $ <quart:gaussian-ricci>]
  Consequently $E := overline("Ric") + 3 overline(g)$ has $E_(i j) = 0$.
    The initial Hamiltonian and momentum constraints give $E_(t t) = E_(t i) = 0$ at $t = 0$.
    For completeness, the Hamiltonian constraint is $"Scal"_gamma + H^2 - \| cal(K) \|_gamma^2 = - 6$;
    tracing (6.5) at $t = 0$ therefore gives $"tr"_gamma partial_t cal(K) = - 3 + \| cal(K) \|_gamma^2$,
    which proves the asserted $t t$ equation with the required sign.
  The contracted Bianchi identity propagates these remaining equations formally.
    Indeed, if $e = E_(t t)$ and $j_i = E_(t i)$, the trace reversal of $E$ has components
  $ hat(E)_(t t) = e \/ 2 \, wide hat(E)_(t i) = j_i \, wide hat(E)_(i j) = e gamma_(i j) \/ 2 . $
  Its vanishing divergence, evaluated with the displayed Christoffel symbols, is
  #[#set math.equation(numbering: n => "(6.7)")
   $ partial_t e = 2 "div"_gamma j - 2 H e \, wide partial_t j_i = 1 / 2 partial_i e - H j_i . $ <quart:bianchi-system>]
  This homogeneous system determines each next time coefficient of $\( e \, j \)$ from the preceding ones.
    All coefficients vanish by induction. Thus
  #[#set math.equation(numbering: n => "(6.8)")
   $ overline("Ric") = - 3 overline(g) $ <quart:formal-einstein>]
  as a formal time series modulo $epsilon.alt^5$.
  There is no extension hypothesis hidden in this construction.
    The original coefficient fields are smooth up to $S$, and their constraint residuals and all one-sided spatial
    derivatives vanish there. The recursion and (6.7) therefore also hold in their spatial Taylor jets at $S$.
    Each finite calculation below involves only finitely many such derivatives.
    They may, if desired, be realized in a collar across $S$ by their Taylor polynomials in $s$,
    to an order larger than the differential order of that calculation.
    Curvature and its residual are formed before substituting a displacement of order $epsilon.alt$.
    Their retained boundary jets vanish, so the substitution is valid even when the leading displacement is
    negative. This neither constructs nor uses an actual Einstein extension on the other side of $S$.
  Gauss–Codazzi applied as a differential identity to any spacelike graph now gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ "Scal"_(upright("slice")) + 6 = \| K_(upright("slice")) \|^2 - \( "tr" K_(upright("slice")) \)^2 \, wide
     "div" #scale(x: 120%, y: 120%)[\(] K_(upright("slice")) - \( "tr" K_(upright("slice")) \)
     g_(upright("slice")) #scale(x: 120%, y: 120%)[\)] = 0 . $ <quart:slice-constraints>]
  Equivalently one can form Gaussian coordinates about that graph by the Taylor recursion for its normal geodesics
    and use (6.6). Either interpretation needs only differential identities of finite jets.
  We next compute the graph second form explicitly. With $T_i = partial_i T$, its tangent fields are $X_i =
    partial_i + T_i partial_t$, and its future unit normal is
  $ n_T = frac(partial_t + "grad"_(gamma \( t \)) T, sqrt(1 - \| upright(d) T \|_(gamma \( t \))^2)) \|_(t = T) . $
  Using $- overline(g) \( n_T \, overline(nabla)_(X_i) X_j \)$ gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ tilde(K)_(i j) =
     frac(cal(K)_(i j) \( t \) + \( "Hess"_(gamma \( t \)) T \)_(i j) - T_k #scale(x: 120%, y: 120%)[\(] T_i
     cal(K)^k zws_j \( t \) + T_j cal(K)^k zws_i \( t \) #scale(x: 120%, y: 120%)[\)], sqrt(1 - \| upright(d)
     T \|_(gamma \( t \))^2))\|_(t = T) . $ <quart:graph-k>]
  The Hessian connection in this formula is taken at fixed time before evaluation at $t = T$.
    The induced metric is $tilde(g) = gamma \( T \) - upright(d) T ⊗ upright(d) T$.
  At the background initial slice, $cal(K) = 0$ and $partial_t cal(K) = - B$.
    A first-order time displacement $b$ therefore changes the second form by $"Hess" b - B b = Q \( b \)$.
    Equation (6.1) gives
  $ \[ tilde(K) \]_1 = q - Q \( v \) = 0 . $
  We choose $w$ to remove the trace at the next degree. This can be done with an explicit scalar source.
    Since $\[ gamma \( 0 \) \]_1 = 4 u g_0$, the conformal Ricci variation and $L u = 0$ give
  $ \[ partial_t cal(K) \( 0 \) \]_1 = 2 "Hess" u - 6 u g_0 \, wide \[ cal(K) \( 0 \) \]_2 = - 2 u q . $
  At the background $partial_t^2 cal(K) \( 0 \) = 0$: differentiating (6.5) there uses $partial_t gamma \( 0 \) =
    0$ and $cal(K) \( 0 \) = 0$. Expanding (6.10) to degree two thus gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ k =  & Q \( w \) - 2 u q - 2 v "Hess" u + 6 u v g_0\
 & quad + 2 upright(d) u ⊗ upright(d) v + 2 upright(d) v ⊗ upright(d) u - 2 chevron.l upright(d) u \,
   upright(d) v chevron.r_(g_0) g_0 . $ <quart:k-explicit>]
  In particular,
  $ "tr"_(g_0) k = L w + 12 u v - 2 chevron.l upright(d) u \, upright(d) v chevron.r_(g_0) . $
  Choose the unique decaying solution of
  #[#set math.equation(numbering: n => "(6.12)")
   $ L w = 2 chevron.l upright(d) u \, upright(d) v chevron.r_(g_0) - 12 u v \, wide w \|_S = 0 . $ <quart:w-equation>]
  Its right side is $O \( r^(- 6) \)$, with differentiated bounds, so Lemma 4 applies and gives $w =
    O \( r^(- 3) \)$ with the corresponding derivatives. Formula (6.11) gives the asserted decay of $k$.
    The degree-two momentum equation in (6.9), together with $"tr"_(g_0) k = 0$, gives $"div"_(g_0) k = 0$.
  The full transformed trace is $O \( epsilon.alt^3 \)$. Its square consequently begins in degree six, whereas
  $ \| tilde(K) \|_(tilde(g))^2 = epsilon.alt^4 \| k \|_(g_0)^2 + O \( epsilon.alt^5 \) . $
  This proves (6.2); maximality at higher orders on the changed slice is not needed.
  Finally,
  $ gamma \( T \) - gamma \( 0 \) = 2 cal(K) \( 0 \) T + 1 / 2 partial_t^2 gamma \( 0 \) T^2 + dots.h.c . $
  In every retained coefficient the first term is $O \( r^(- 6) \)$,
    and every subsequent term has at least two decaying time-displacement factors multiplying bounded background
    time coefficients. The recursion preserves these bounded differentiated estimates:
    in the scaled coframe $upright(d) s \, r thin upright(d) x$, the background connection and curvature,
    with their required derivatives, are bounded; each coefficient is obtained by finitely many covariant
    differentiations, contractions, and inverse-metric Taylor operations from the smooth initial coefficients.
    The same bounds hold for $upright(d) T ⊗ upright(d) T$, proving (6.3).
    An $O \( r^(- 6) \)$ metric coefficient with its first covariant derivative contributes $O \( r^(- 3) \)$ to
    the integrated mass flux, since the test potentials and their gradients are $O \( r \)$ and the sphere area is
    $O \( r^2 \)$. Thus the leading asymptotic data, every mass component,
    and the mass norm are unchanged through degree four.
  Since $partial_t^2 gamma \( 0 \) = - 2 B$ at the background, the degree-two difference is $- 2 v q - B v^2 -
    upright(d) v ⊗ upright(d) v$. Substituting $q = "Hess" v - B v$ and using $"Hess" \( v^2 \) = 2 v "Hess" v +
    2 upright(d) v ⊗ upright(d) v$ proves (6.4). ◻
]

=== 6.2 Transport of the boundary and its area <transport-of-the-boundary-and-its-area>

#thm([Lemma 6.3.])[
  (The null cut).  #emph[For the changed slice of Lemma 19 there is a sphere jet $S^sharp$, based at $S$, such that
#[#set math.equation(numbering: n => "(6.13)")
 $ \| S^sharp \|_(tilde(g)) & = \| S \|_(g_epsilon.alt) + O \( epsilon.alt^5 \) \,\
H_(tilde(g)) \( S^sharp \) & = epsilon.alt^2 k_(s s) \|_S + O \( epsilon.alt^3 \) . $ <quart:null-area>]

 Let $S_min$ be the minimal Taylor leaf of the CMC construction for $tilde(g)$.
   Their height jets agree through degree one. If
#[#set math.equation(numbering: n => "(6.14)")
 $ z = D^(- 1) \( k_(s s) \|_S \) \, $ <quart:z>]

 then the height of $S^sharp$ minus that of $S_min$ is $epsilon.alt^2 z + O \( epsilon.alt^3 \)$, and
#[#set math.equation(numbering: n => "(6.15)")
 $ \| S^sharp \|_(tilde(g)) - \| S_min \|_(tilde(g)) = 1 /
   2 epsilon.alt^4 integral_S z D z thin upright(d) A_(g_0) + O \( epsilon.alt^5 \) . $ <quart:area-hessian>]

 These statements remain valid when some leading boundary displacements are negative.]
] <lem:null-cut>

#proof[
  On the original initial slice take the future outward null normal $ell = n_(upright("future")) + nu$ to $S$.
    Its affinely parametrized null geodesics determine a null hypersurface jet,
    with parameter $lambda$ zero at $S$. These are Taylor solutions of the geodesic and Jacobi equations for the
    formal metric $overline(g)$ constructed above. At the initial sphere the expansion is identically zero by the
    original boundary equation.
  Write $chi$ for the null second form and $theta = "tr" chi$ for its expansion.
    The initial sphere is umbilic in $phi.alt_epsilon.alt^4 g_0$.
    Moreover the coefficient of $epsilon.alt$ in the tracefree tangential part of $K_epsilon.alt$ equals the
    tracefree tangential part of $Q \( v \)$. Since $S$ is totally geodesic in $g_0$,
    that part is $\( "Hess"_(a^2 sigma) \( v \|_S \) \)^compose$.
    It vanishes for the constant and degree-one modes of $v \|_S$.
    The vanishing initial expansion and this shear calculation together give
  #[#set math.equation(numbering: n => "(6.16)")
   $ chi \( 0 \, epsilon.alt \) = O \( epsilon.alt^2 \) . $ <quart:initial-chi>]
  The screen space is the positive-definite quotient $ell^perp \/ "span" { ell }$.
    In a parallel orthonormal frame of this space the null shape operator obeys the optical Riccati equation
  $ partial_lambda chi = - chi^2 - cal(R)_ell \, wide partial_lambda theta = - \| chi \|^2 -
    overline("Ric") \( ell \, ell \) . $
  These equations follow directly from the Jacobi equation:
    angular Jacobi fields remain orthogonal to $ell$, and their derivative matrix times their inverse is the shape
    operator. At $\( lambda \, epsilon.alt \) = \( 0 \, 0 \)$,
    spherical symmetry makes $cal(R)_ell$ a scalar multiple of the screen identity.
    Its trace is $overline("Ric") \( ell \, ell \) = 0$ by (6.8) and nullness,
    so this curvature endomorphism is zero. Thus $partial_lambda chi \( 0 \, 0 \) = 0$.
  It follows from (6.16) that every retained monomial of $chi$ has total degree at least two in
    $\( lambda \, epsilon.alt \)$. Raychaudhuri and the identically zero initial expansion then imply
  #[#set math.equation(numbering: n => "(6.17)")
   $ chi = O_(upright("tot")) \( 2 \) \, wide theta = O_(upright("tot")) \( 5 \) . $ <quart:optical-orders>]
  Here $O_(upright("tot")) \( j \)$ means that each monomial $lambda^a epsilon.alt^b$ has $a + b gt.eq j$.
    The order statements are made in the formal series modulo $epsilon.alt^5$.
    Equivalently one can choose any sufficiently high finite Taylor lift:
    an Einstein residual of order $epsilon.alt^5$ integrated along a segment $lambda =
    O \( epsilon.alt \)$ contributes only beyond every degree used here.
    Since the logarithmic screen area density has derivative $theta$,
    its change along such a segment vanishes through degree four.
  Intersect this null hypersurface jet with $t = T$. At the background initial point, the derivative of $t -
    T$ along its generator is one. Successive Taylor substitution therefore solves for the intersection parameter,
    which is $O \( epsilon.alt \)$. The angular projection has identity background differential and likewise has a
    formal inverse. The resulting cut $S^sharp$ is a graph over $S$ in the changed slice.
  The area conclusion also holds for this variable-parameter cut.
    If $J_A$ are the transported angular Jacobi fields, its tangent fields are $J_A + \( partial_A lambda \) ell$.
    Nullness and $overline(g) \( J_A \, ell \) = 0$ show that the additional terms do not change the induced
    metric. Its area density is just the transported screen density evaluated at the variable parameter.
    This proves (6.13).
  The outward future null normal obtained from the new slice differs from $ell$ by a scalar with positive,
    nonzero background value. Expansion is multiplied by that scalar,
    so it still vanishes through the needed orders. At leading order
  $ "tr"_(S^sharp \, tilde(g)) tilde(K) = - epsilon.alt^2 k_(s s) \|_S + O \( epsilon.alt^3 \) \, $
  because $"tr"_(g_0) k = 0$. Its zero null expansion gives (6.13).
  Both $S^sharp$ and the minimal Taylor leaf have zero mean-curvature coefficients through degree one.
    The difference of their first height coefficients is therefore annihilated by the background operator $D$,
    which is invertible. At degree two, their already equal first coefficients make all common nonlinear terms
    cancel, leaving $D \( h_2^sharp - h_2^min \) = k_(s s) \|_S$. This proves (6.14).
    The first variation of area at the minimal Taylor leaf vanishes to the retained order.
    A height difference beginning with $epsilon.alt^2 z$ consequently has, at degree four,
    only the base second-variation contribution $1 / 2 integral_S z D z thin upright(d) A_(g_0)$. This is (6.15).
  All of these assertions are identities in the joint spatial, $lambda$,
    and $epsilon.alt$ Taylor jets at the original boundary. The boundary-jet justification in Lemma 19 permits
    their evaluation at negative leading displacements. Neither the sign of an affine segment nor that of a height
    coefficient changes the order calculation or the area Hessian.
    No area inequality for an actually extended manifold is being applied. ◻
]

=== 6.3 The quartic square and its vanishing consequences <the-quartic-square-and-its-vanishing-consequences>

The two boundary comparisons in Lemma 20 are summarized in Figure 1.
  Null transport preserves the boundary area to the degree being studied;
  the subsequent minimal-graph correction produces the boundary term that the TT identity will absorb.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.3cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S$ in $g_ epsilon$#linebreak()$H=O( epsilon )$]]])])
  content((4.4, 0), [#box(width: 2.3cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S^ sharp$ in $tilde(g)$#linebreak()$H=O( epsilon^2)$]]])])
  content((8.8, 0), [#box(width: 2.3cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S_( min )$ in $tilde(g)$#linebreak()$H=0$]]])])
  line((1.15, 0), (3.25, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.2, 0), [#text(size: 9pt)[null#linebreak()transport]], anchor: "south", padding: 0.1176cm)
  line((5.55, 0), (7.65, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.6, 0), [#text(size: 9pt)[minimal#linebreak()graph]], anchor: "south", padding: 0.1176cm)
  content((2.2, -1.2), [#box(width: 3.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[area unchanged#linebreak()through degree four]]])])
  content((6.6, -1.2), [#box(width: 3.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[height gap $epsilon^2z$;#linebreak()quartic area gap]]])])
})],
  caption: [Figure 1: The boundary comparisons in the changed slice. The diagram describes finite Taylor families, including the possibility of negative leading displacements. The signed height gap is $h^sharp - h^min = epsilon.alt^2 z + O \( epsilon.alt^3 \)$, and the corresponding area gap is $\| S^sharp \|_(tilde(g)) - \| S_min \|_(tilde(g)) = 1 / 2 epsilon.alt^4 integral_S z D z thin upright(d) A_(g_0) + O \( epsilon.alt^5 \)$; see (6.15). All displayed geometric statements are understood through the required Taylor order. ],
) <fig:boundary-comparisons>

Apply Proposition 10 to $tilde(g)$ through degree four. Its hypotheses follow from Lemma 19,
  including the unchanged leading asymptotic data. Denote by $f$ the lapse,
  by $macron(f)$ its area average on each leaf, and set

$ delta f = f - macron(f) \, wide U_j = \[ upright("II")^compose \]_j \, wide cal(F)_j = \[ delta f \]_j . $

At degree two, the scalar contribution is zero by (6.2). Equations (6.13) and (6.15), and the preserved mass,
  identify the quadratic coefficient of mass minus $b_(*)$ of the minimal-leaf area with the original zero
  coefficient $c_2 \[ q \]$. The leading-energy identity, Proposition 13, with its scalar tensor equal to zero, gives

$ 0 = frac(1, 16 pi) integral_M N #scale(x: 120%, y: 120%)[\(] \| U_1 \|^2 +
  2 cal(F)_1 J_s^0 cal(F)_1 #scale(x: 120%, y: 120%)[\)] thin upright(d) V_(g_0) . $

The lapse coefficient is mean free on each background sphere, and $J_s^0$ is strictly positive on that space.
  Since $N > 0$ for $s > 0$, sphere integration and smoothness imply

#[#set math.equation(numbering: n => "(6.18)")
 $ U_1 = 0 \, wide cal(F)_1 = 0 . $ <quart:first-geometric-zero>]

We can now use Proposition 13 at order four: the scalar-curvature defect starts with $epsilon.alt^4 \| k \|^2$,
  and both geometric square terms start in degree four. It follows first that mass minus $b_(*)$ of the
  minimal-leaf area has no coefficients below degree four. The area correction (6.15) also starts in that degree.
  Thus $c_3 \[ q \] = 0$, as well as the previously known lower vanishings.

Let $v_k$ be the decaying solution

#[#set math.equation(numbering: n => "(6.19)")
 $ L v_k = 0 \, wide v_k \|_S = z = D^(- 1) \( k_(s s) \|_S \) . $ <quart:vk>]

It is supplied by Lemma 4. The TT tensor $k$ has the decay and finite angular type required in Lemma 14.
  Since $b'_(*) \( 4 pi a^2 \) = kappa \/ \( 8 pi \)$, subtracting the area correction from the leading-energy
  identity and applying that lemma gives

#[#set math.equation(numbering: n => "(6.20)")
 $ c_4 \[ q \] =
   frac(1, 16 pi) integral_M N (\| k - Q \( v_k \) \|_(g_0)^2 + \| U_2 \|^2 + 2 cal(F)_2 J_s^0 cal(F)_2) thin
   upright(d) V_(g_0) . $ <quart:square>]

Indeed the subtracted boundary term is exactly $kappa \( 16 pi \)^(- 1) integral_S z D z thin upright(d) A_(g_0)$.
  The integrals are understood with sphere integration first, as in Proposition 13;
  no pointwise sign is asserted for $cal(F)_2 J_s^0 cal(F)_2$. Its sphere integral is nonnegative.
  This proves $c_4 \[ q \] gt.eq 0$, and equality implies

#[#set math.equation(numbering: n => "(6.21)")
 $ delta f = O \( epsilon.alt^3 \) \, wide upright("II")^compose =
   O \( epsilon.alt^3 \) $ <quart:second-geometric-zero>]

on every leaf. Boundary values follow by smoothness. We show next that (6.21) excludes a nonzero degree-one part of $v$.

=== 6.4 Round angular jets and conformal coordinates <quart:round-section>

We now assume equality in the quartic square. The vanishing in (6.21) makes the changed metric a warped product
  through degree two. The following lemma will round its angular metric before we compare it with the conformal
  class of $g_0$.

#thm([Lemma 6.4.])[
  (Rounding a two-jet on the sphere).  #emph[Let $gamma_epsilon.alt = sigma + epsilon.alt P_1 +
    epsilon.alt^2 P_2$ be a smooth metric two-jet on $S^2$ of finite angular type.
    Suppose its scalar curvature is angularly constant through degree two.
    Then there are a positive scalar two-jet $a_epsilon.alt$, with $a_0 = 1$,
    and a diffeomorphism two-jet $Phi_epsilon.alt$, based at the identity, such that
$ gamma_epsilon.alt = a_epsilon.alt Phi_epsilon.alt^(*) sigma + O \( epsilon.alt^3 \) . $

 All coefficients can be chosen of finite angular type.]
] <lem:round-jet>

#proof[
  We first prove the infinitesimal decomposition used twice below.
    For a symmetric tensor $P$ on the round sphere, there are a vector field $Y$ and a function $h$ such that
  #[#set math.equation(numbering: n => "(6.22)")
   $ P = cal(L)_Y sigma + h sigma . $ <quart:sphere-splitting>]
  For finite-angular-type $P$, the choices may retain that property.
  Let $P^compose = P - 1 / 2 \( "tr"_sigma P \) sigma$, and identify vector fields and one-forms using $sigma$. Define
  $ cal(C) \( Y \)_(i j) = nabla_i Y_j + nabla_j Y_i - \( "div" Y \) sigma_(i j) . $
  On the curvature-one sphere, commuting covariant derivatives gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ "div" cal(C) \( Y \) = \( Delta_sigma + 1 \) Y \, wide \( Delta_sigma + 1 \) upright(d) f =
     upright(d) \( Delta_sigma + 2 \) f . $ <quart:conformal-divergence>]
  Here the Laplacian on one-forms is the rough Laplacian $nabla^i nabla_i$.
    The second identity also holds after applying the parallel Hodge star $*$ to one-forms.
  Put $alpha = "div" P^compose$. To decompose it, solve the scalar equations
  $ Delta_sigma phi = "div" alpha \, wide Delta_sigma psi = - "div" \( * alpha \) $
  with zero means. Both right sides have zero integral. In finite angular spaces these equations are solved by
    inversion on the nonconstant spherical modes. The residual $omega = alpha -
    upright(d) phi - * upright(d) psi$ is closed and co-closed.
    Commuting derivatives of a closed one-form of zero divergence gives $nabla^i nabla_i omega = omega$;
    integration against $omega$ forces $omega = 0$. We have therefore obtained
  $ alpha = upright(d) phi + * upright(d) psi . $
  The one-forms $upright(d) x_i$ and $* upright(d) x_i$ correspond to conformal Killing vector fields.
    Integration by parts against the tracefree tensor $P^compose$ consequently shows that $alpha$ is orthogonal to
    all of them. It follows that both $phi$ and $psi$ have zero degree-one components. Thus we may solve
  $ \( Delta_sigma + 2 \) A = phi \, wide \( Delta_sigma + 2 \) C = psi $
  on their angular modes, and set $Y^flat = upright(d) A + * upright(d) C$.
    Equation (6.23) gives $"div" cal(C) \( Y \) = "div" P^compose$.
  The tracefree tensor $P_(*) = P^compose - cal(C) \( Y \)$ is consequently divergence free.
    Such a tensor vanishes on the round sphere; here is a direct verification.
    In an orthonormal frame write its components as $mat(delim: "(", a, b; b, - a)$.
    Its two divergence equations are precisely the two independent Codazzi equations $nabla_i \( P_(*) \)_(j k) =
    nabla_j \( P_(*) \)_(i k)$. Contracting and commuting these equations on the curvature-one sphere gives
  $ nabla^i nabla_i \( P_(*) \)_(j k) = 2 \( P_(*) \)_(j k) - sigma_(j k) "tr"_sigma P_(*) = 2 \( P_(*) \)_(j k) . $
  Integration yields $- integral \| nabla P_(*) \|^2 = 2 integral \| P_(*) \|^2$, hence $P_(*) = 0$.
    Taking $h = 1 / 2 "tr"_sigma P - "div" Y$ proves (6.22). Every operation used above commutes with rotations or
    inverts a scalar operator within finitely many spherical eigenspaces, so it preserves finite angular type.
  The scalar-curvature derivative in the direction $h sigma$ is
  $ \( D "Scal" \)_sigma \( h sigma \) = - Delta_sigma h - 2 h . $
  The derivative in a Lie direction is zero because the background scalar curvature is constant.
    If the scalar-curvature variation of $P$ is constant, (6.22) therefore implies that $h$ consists only of a
    constant and degree-one modes. A degree-one function $h_1$ satisfies $"Hess"_sigma h_1 = - h_1 sigma$, so
  $ h_1 sigma = cal(L)_(- 1 / 2 "grad"_sigma h_1) sigma . $
  Thus $P$ is a Lie derivative plus a constant multiple of $sigma$.
  Apply this conclusion to $P_1$. A formal inverse flow and a scalar scaling remove its first coefficient.
    Both operations preserve the property that curvature is angularly constant.
    The resulting metric two-jet has the form $sigma + epsilon.alt^2 hat(P)_2$,
    so its degree-two curvature equation is the same linearized equation,
    with no quadratic contribution from a first coefficient. The argument just given removes $hat(P)_2$ by a
    degree-two flow and scaling. Undoing the two operations proves the stated rounding.
    This proves only an identity of two-jets, which is exactly what is required. ◻
]

===== 6.4.1 Local conformal tangency forced by equality. <local-conformal-tangency-forced-by-equality.>

Suppose now that $c_4 \[ q \] = 0$. Fix a compact interval $I subset.double \( 0 \, oo \)$.
  In coordinates of the CMC sphere jets we can remove tangential shift through degree two by integrating its
  tangential reparametrization equation on $I$. Its background value is zero,
  so the coordinate change is based at the identity. In these coordinates (6.21) says that the lapse is a function
  of the leaf parameter only and that $upright("II") = \( H \/ 2 \) g_(upright("leaf"))$ through degree two.
  Since $H$ is constant on each leaf, the normal metric variation is

$ partial_s g_(upright("leaf")) = 2 f upright("II") = f H g_(upright("leaf")) . $

Consequently on $I times S^2$ the metric has the form

#[#set math.equation(numbering: n => "(6.24)")
 $ f_(*) \( s \)^2 upright(d) s^2 + b \( s \)^2 gamma_epsilon.alt \( x \) + O \( epsilon.alt^3 \) \,
   $ <quart:warped-two>]

where all quantities are two-jets, with backgrounds $f_(*) = 1$, $b = r$, and $gamma_0 = sigma$.
  Angular finiteness is preserved by these Taylor coordinate changes and integrations.

For this warped metric the scalar curvature through degree two is

#[#set math.equation(numbering: n => "(6.25)")
 $ b^(- 2) "Scal"_(gamma_epsilon.alt) - frac(4, f_(*) b) frac(upright(d), upright(d) s) (b' / f_(*)) -
   2 (frac(b', f_(*) b))^2 . $ <quart:warped-scalar>]

Equation (6.2) makes it the constant $- 6$ through degree two.
  The last two terms in (6.25) are radial, so $"Scal"_(gamma_epsilon.alt)$ is angularly constant to that order.
  Lemma 21 makes $gamma_epsilon.alt$ round up to diffeomorphism and scaling.
  Absorbing the scaling into $b$, we obtain $f_(*)^2 upright(d) s^2 + b^2 sigma$.

This last two-jet is locally conformal to a pullback of $g_0$. Indeed solve, coefficientwise on $I$,

#[#set math.equation(numbering: n => "(6.26)")
 $ frac(y', r \( y \)) = f_(*) / b \, $ <quart:radial-coordinate>]

with background $y = s$ and a fixed identity background initial value at an interior point of $I$.
  This is a nonsingular scalar ODE, and it gives

$ f_(*)^2 upright(d) s^2 + b^2 sigma = frac(b^2, r \( y \)^2) #scale(x: 120%, y: 120%)[\(] upright(d) y^2 +
  r \( y \)^2 sigma #scale(x: 120%, y: 120%)[\)] quad med mod med epsilon.alt^3 . $

Composing the coordinate changes already made shows, in the original coordinates on the interval, that

#[#set math.equation(numbering: n => "(6.27)")
 $ tilde(g) = omega_epsilon.alt Psi_epsilon.alt^(*) g_0 + O \( epsilon.alt^3 \) \, wide omega_0 = 1 \, quad
   Psi_0 = upright("id") . $ <quart:conformal-pullback>]

Only this local statement is used.

There is a useful consequence of the known first coefficient in (6.27).
  Write $omega_epsilon.alt = 1 + epsilon.alt a_1 + epsilon.alt^2 a_2$ and express the diffeomorphism two-jet as

$ Psi_epsilon.alt^(*) g_0 = g_0 + epsilon.alt cal(L)_X g_0 +
  epsilon.alt^2 #scale(x: 120%, y: 120%)[\(] cal(L)_Z g_0 + 1 / 2 cal(L)_X^2 g_0 #scale(x: 120%, y: 120%)[\)] . $

The graph calculation shows that $tilde(g) - g_epsilon.alt$ starts in degree two, so $\[ tilde(g) \]_1 = 4 u g_0$.
  Hence $cal(L)_X g_0 = lambda g_0$ for some function $lambda$. It follows that

$ cal(L)_X^2 g_0 = \( X lambda + lambda^2 \) g_0 \, $

and the mixed scalar term $a_1 cal(L)_X g_0$ is pure trace as well. Therefore

#[#set math.equation(numbering: n => "(6.28)")
 $ \[ tilde(g) \]_2 = cal(L)_Z g_0 + c g_0 $ <quart:second-tangent>]

for a function $c$ on $I times S^2$. The original metric coefficient $\[ g_epsilon.alt \]_2$ is itself pure trace.
  Thus the same Lie-derivative-plus-trace conclusion holds for their difference.
  Since $"Hess" \( v^2 \) = 1 / 2 cal(L)_("grad" \( v^2 \)) g_0$, (6.4) gives the necessary condition

#[#set math.equation(numbering: n => "(6.29)")
 $ upright(d) v ⊗ upright(d) v + B v^2 = cal(L)_Y g_0 + c g_0 quad upright("on ") I times
   S^2 $ <quart:necessary-tangent>]

for some local $Y \, c$. Their choices may depend on $I$.

=== 6.5 The degree-one obstruction <quart:obstruction-section>

#thm([Lemma 6.5.])[
  (A nonzero degree-one mode is obstructed).  #emph[Let $v = v_0 \( s \) + V \( s \) x$ solve $L v = 0$,
    where $x$ is one fixed unit-axis linear coordinate on $S^2$ and $V = O \( r^(- 3) \)$.
    If (6.29) holds on every compact radial interval in the interior,
    with possibly different local vector fields and functions, then $V equiv 0$.]
] <lem:dipole-obstruction>

#proof[
  Set $Y_2 = x^2 - 1 \/ 3$, a degree-two spherical eigenfunction.
    Project (6.29) onto its scalar, gradient, and tangential Hessian modes.
    Write the contributing radial vector-field coefficient as $p \( s \) Y_2 partial_s$,
    its tangential coefficient as $d \( s \) "grad"_sigma Y_2$,
    and the scalar-multiple coefficient as $c \( s \) Y_2$. These are the only generator components contributing
    to the tested modes. This follows either from the one-form decomposition in Lemma 21 or by integration by
    parts, using $Delta_sigma Y_2 = - 6 Y_2$. In particular, the coexact component is orthogonal to both the
    gradient test and the electric Hessian test, and the other spherical eigenspaces are orthogonal as well.
  For clarity, the angular identity
  $ upright(d) x ⊗ upright(d) x = 1 / 2 "Hess"_sigma Y_2 + x^2 sigma $
  shows all terms of the left side in these modes. With $B = B_s upright(d) s^2 + B_t r^2 sigma$,
    equality of the radial, mixed, Hessian, and tangential scalar coefficients respectively gives
  #[#set math.equation(numbering: n => "(6.30)")
   $ V' ""^2 + B_s V^2 & = 2 p' + c \, & frac(V V', 2) & = p + r^2 d' \,\
V^2 / 2 & = 2 r^2 d \, & V^2 + r^2 B_t V^2 & = 2 r N p + r^2 c . $ <quart:projection-system>]
  Terms involving $v_0$ have only degrees zero or one and do not enter these equations.
    Solving the last three equations yields
  $ d = frac(V^2, 4 r^2) \, wide p = frac(N V^2, 2 r) \, wide c = frac(3 m_0 V^2, r^3) . $
  Substitute these expressions in the first equation and use
  $ B_s = 1 - frac(2 m_0, r^3) \, wide B_t = 1 + m_0 / r^3 \, wide N' = r + m_0 / r^2 \, wide N^2 = 1 + r^2 -
    frac(2 m_0, r) . $
  After cancellation one obtains
  #[#set math.equation(numbering: n => "(6.31)")
   $ (V' - N / r V)^2 = frac(6 m_0, r^3) V^2 . $ <quart:dipole-identity>]
  The local generators have disappeared from this relation.
    Because the radial interval was arbitrary, it holds throughout the end even though their choices need not
    agree on overlapping intervals.
  For $z = V \/ r$, (6.31) reads
  $ \| z' \| = sqrt(6 m_0) thin r^(- 3 \/ 2) \| z \| . $
  The coefficient on the right is integrable toward infinity, and $z arrow.r 0$.
    The integral differential inequality, applied backwards between $s$ and $S > s$, gives
  $ \| z \( s \) \| lt.eq \| z \( S \) \| exp (integral_s^S sqrt(6 m_0) thin r \( t \)^(- 3 \/ 2) thin upright(d) t) . $
  Letting $S arrow.r oo$ proves $z = 0$ on the end. The homogeneous degree-one ODE obtained from $L v =
    0$ then gives $V equiv 0$ by uniqueness. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 18.] The coefficient vanishings and nonnegativity were proved in
    (6.18)–(6.20). Suppose that the degree-one part of $v$ is nonzero and that $c_4 \[ q \] = 0$.
    All three degree-one radial coefficients solve the same decaying homogeneous ODE.
    Decaying uniqueness makes them proportional, so after a fixed rotation their sum is $V \( s \)
    x$ for one axis and a nonzero radial function $V$. The vanishing consequences of (6.20) give (6.29) on each
    interior radial interval. Lemma 22 forces $V = 0$, a contradiction. Thus $c_4 \[ q \] > 0$.
  Finally this is a statement about the actual deficit, not only a formal inequality.
    The kernel representation gives precisely the finite angular type and differentiated decay needed for the
    fourth-order expansion in Proposition 8. Lemma 6 converts the weighted function and equation remainders to the
    mass remainder. Consequently
  $ frak(D)_q \( epsilon.alt \) = c_4 \[ q \] epsilon.alt^4 + O \( epsilon.alt^5 \) $
  in the case under consideration. Its positive coefficient gives strict positivity for all sufficiently small
    positive $epsilon.alt$, with the interval allowed to depend on the fixed data.
    The radial kernel, including the zero seed, is handled by the exact argument in the next section. ◻
]

== 7 Radial equality and the nonlinear conclusion <sec:conclusion>

#thm([Proposition 7.1.])[
  (Exact radial equality).  #emph[Suppose the fixed TT seed $q$ is invariant under rotations of $S^2$.
    Every branch in Theorem 1 is radial for all sufficiently small $epsilon.alt$, and on that parameter interval
$ m_(upright("AH")) \( epsilon.alt \) = b_(*) \( A_epsilon.alt \) . $

 This includes the zero seed, and requires no sign for $q_(s s) \|_S$.]
] <prop:radial>

#proof[
  We first prove radiality of the actual solution, rather than merely of its Taylor coefficients.
    Fix a rotation $cal(R)$, and set $hat(phi.alt) = phi.alt_epsilon.alt compose cal(R)$ and $w = hat(phi.alt) -
    phi.alt_epsilon.alt$. Because $q$ is radial, $hat(phi.alt)$ satisfies the same equation and boundary condition
    as $phi.alt_epsilon.alt$. Their difference satisfies
  #[#set math.equation(numbering: n => "(7.1)")
   $ \( Delta_(g_0) - c_epsilon.alt \) w = 0 \, wide w_s \|_S = c_epsilon.alt^(*) w \|_S \,
     $ <eq:radial-uniqueness-equation>]
  where divided differences of the nonlinearities give, uniformly on $M$ and uniformly in $cal(R)$,
  $ c_epsilon.alt = 3 + o \( 1 \) \, wide c_epsilon.alt^(*) = O \( epsilon.alt \) . $
  Indeed, the derivatives of the interior and boundary nonlinearities with respect to their positive scalar
    argument $z$ are respectively
  $ 3 / 4 \( 5 z^4 - 1 \) + frac(7 epsilon.alt^2, 8) \| q \|^2 z^(- 8) \, wide -
    frac(3 epsilon.alt, 4) q_(s s) z^(- 4) . $
  The asserted bounds follow from boundedness of $q$ and the given uniform convergence $phi.alt_epsilon.alt arrow.r 1$.
  Choose $3 \/ 2 < beta < min \( tau \, sqrt(3) \)$. Then $w = o \( e^(- beta s) \)$,
    and (7.1) has the form of Lemma 4 with $V = c_epsilon.alt - 3$, Robin coefficient $a_(*) = c_epsilon.alt^(*)$,
    and zero interior and boundary data. For sufficiently small $epsilon.alt$, uniformly in the rotation,
    $parallel V parallel_oo lt.eq c_beta$ and $parallel a_(*) parallel_oo lt.eq beta \/ 2$.
    The comparison estimate gives $w = 0$, so the actual $phi.alt_epsilon.alt$ is radial.
  Write the invariant seed as $q = A_q \( s \) thin upright(d) s^2 + B_q \( s \) r^2 sigma$.
    Its trace and divergence equations give
  $ B_q = - A_q \/ 2 \, wide A'_q + 3 \( N \/ r \) A_q = 0 . $
  Consequently, for a constant $C_q in bb(R)$,
  #[#set math.equation(numbering: n => "(7.2)")
   $ q = C_q r^(- 3) (upright(d) s^2 - 1 / 2 r^2 sigma) . $ <eq:radial-tt-tensor>]
  Fix a sufficiently small parameter. Define proper radial distance $ell$ and the actual area radius $R$ by
  $ upright(d) ell = phi.alt_epsilon.alt^2 thin upright(d) s \, wide R = r phi.alt_epsilon.alt^2 . $
  Then the actual metric and second-form data are
  $ g_epsilon.alt = upright(d) ell^2 + R^2 sigma \, wide K_epsilon.alt = - 2 k thin upright(d) ell^2 +
    k R^2 sigma \, wide k = - frac(epsilon.alt C_q, 2 R^3) . $
  A dot denotes an $ell$-derivative. The momentum and scalar constraints are therefore
  #[#set math.equation(numbering: n => "(7.3)")
   $ dot(k) = - 3 dot(R) / R k \, wide - frac(4 dot.double(R), R) + frac(2 \( 1 - dot(R)^2 \), R^2) + 6 =
     6 k^2 . $ <eq:radial-constraints>]
  The scalar-curvature formula here follows from the sectional curvatures $-
    dot.double(R) \/ R$ and $\( 1 - dot(R)^2 \) \/ R^2$ of this warped product.
  Define
  #[#set math.equation(numbering: n => "(7.4)")
   $ cal(M) = R / 2 (1 + R^2 - dot(R)^2 + R^2 k^2) . $ <eq:radial-conserved-mass>]
  Direct differentiation, using the momentum equation, gives
  $ dot(cal(M)) = dot(R) / 2 (1 + 3 R^2 - dot(R)^2 - 2 R dot.double(R) - 3 R^2 k^2) = 0 $
  by the scalar equation in (7.3). No division by $dot(R)$ has been used,
    so conservation is valid at turning points of $R$ as well. At the boundary the MOTS equation reads
  $ frac(2 dot(R), R) + 2 k = 0 . $
  Substitution in (7.4) yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ cal(M) \|_S = frac(R \|_S, 2) #scale(x: 120%, y: 120%)[\(] 1 + \( R \|_S \)^2 #scale(x: 120%, y: 120%)[\)] =
     b_(*) #scale(x: 120%, y: 120%)[\(] 4 pi \( R \|_S \)^2 #scale(x: 120%, y: 120%)[\)] =
     b_(*) \( A_epsilon.alt \) . $ <eq:radial-mass-at-boundary>]
  We identify the same constant with the specified mass flux at infinity. Put $psi = phi.alt_epsilon.alt - 1$.
    Its actual radial equation gives
  $ psi'' + 2 N / r psi' - 3 psi = O \( psi^2 \) + O \( r^(- 6) \) \, $
  where (7.2) was used in the source estimate. The assumed weighted decay gives $psi \, psi' =
    O \( e^(- tau s) \)$, and $N \/ r = 1 + O \( e^(- 2 s) \)$. It follows that
  $ psi'' + 2 psi' - 3 psi = O \( e^(- gamma s) \) \, wide gamma = min \( 2 tau \, tau + 2 \, 6 \) > 3 . $
  Variation of constants for the roots $1 \, - 3$ excludes the growing solution by the prescribed decay and
    yields, as in Lemma 4, a constant $c = c \( epsilon.alt \)$ with
  #[#set math.equation(numbering: n => "(7.6)")
   $ phi.alt_epsilon.alt = 1 + c r^(- 3) + o \( r^(- 3) \) \, wide partial_s phi.alt_epsilon.alt = -
     3 c N r^(- 4) + o \( r^(- 3) \) . $ <eq:radial-actual-asymptotic>]
  In particular,
  $ R = r + 2 c r^(- 2) + o \( r^(- 2) \) \, wide dot(R) = N +
    2 r frac(partial_s phi.alt_epsilon.alt, phi.alt_epsilon.alt) = N - 6 c N r^(- 3) + o \( r^(- 2) \) . $
  Using $N^2 = 1 + r^2 - 2 m_0 \/ r$, we obtain
  $ 1 + R^2 - dot(R)^2 = frac(2 m_0 + 16 c, r) + o \( r^(- 1) \) . $
  Also $R^3 k^2 = O \( R^(- 3) \)$, so
  #[#set math.equation(numbering: n => "(7.7)")
   $ lim_(ell arrow.r oo) cal(M) = m_0 + 8 c . $ <eq:radial-mass-at-infinity>]
  For a direct flux normalization check, rotational invariance implies $p_i = 0$ for $i = 1 \, 2 \, 3$.
    Equation (7.6) implies
  $ g_epsilon.alt - g_0 = 4 c r^(- 3) b + o \( r^(- 3) \) $
  in scaled components, with its first differentiated asymptotic.
    For a perturbation $f b$ in dimension three, the mass-flux covector integrand with test function $V$
    simplifies to $2 \( f thin upright(d) V - V thin upright(d) f \)$.
    With $f = 4 c r^(- 3)$, $V = V_0 = sqrt(1 + r^2)$, and $nu_b = sqrt(1 + r^2) thin partial_r$,
    its normal component is
  $ 2 #scale(x: 120%, y: 120%)[\(] f partial_(nu_b) V_0 - V_0 partial_(nu_b) f #scale(x: 120%, y: 120%)[\)] =
    32 c r^(- 2) + 24 c r^(- 4) . $
  The error terms give zero limiting flux. Integrating over a coordinate sphere of area $4 pi
    r^2$ and dividing by $16 pi$ gives $p_0 - m_0 = 8 c$. Since $p_0 arrow.r m_0 > 0$ as $epsilon.alt arrow.r 0$,
  $ m_(upright("AH")) = p_0 = m_0 + 8 c = cal(M) = b_(*) \( A_epsilon.alt \) $
  for sufficiently small $epsilon.alt$, by (7.5)–(7.7). This argument includes $C_q = 0$.
    In that case one can also apply the comparison estimate of Lemma 4 to $phi.alt_epsilon.alt -
    1$ and conclude $phi.alt_epsilon.alt equiv 1$ directly. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Fix the seed and the given solution branch.
    If $q$ is radial, Proposition 23 gives exact equality on a sufficiently small parameter interval.
    Suppose henceforth that $q$ is not radial. Proposition 15 gives the actual expansion
  $ frak(D)_q \( epsilon.alt \) = c_2 \[ q \] epsilon.alt^2 + o \( epsilon.alt^2 \) \, wide c_2 \[ q \] gt.eq 0 . $
  If $c_2 \[ q \] > 0$, this proves strict positivity of the deficit for every sufficiently small positive
    $epsilon.alt$.
  If $c_2 \[ q \] = 0$, Corollary 16 gives $q = Q \( v \)$ with $L v =
    0$ and with only constant and linear angular modes. Its linear part is nonzero,
    for otherwise $q$ would be radial. These homogeneous modes have the stronger differentiated decay needed for
    the actual fourth-order expansion in Proposition 8. Proposition 18 then gives
  $ frak(D)_q \( epsilon.alt \) = c_4 \[ q \] epsilon.alt^4 + o \( epsilon.alt^4 \) \, wide c_4 \[ q \] > 0 \, $
  with all coefficients below order four equal to zero. Again the actual deficit is strictly positive for every
    sufficiently small positive $epsilon.alt$.
  At $epsilon.alt = 0$ the background identity $m_0 = b_(*) \( 4 pi a^2 \)$ gives equality.
    The preceding alternatives exhaust all fixed seeds. Choose $epsilon.alt_0 >
    0$ small enough for the applicable alternative and the given branch, with $epsilon.alt_0 lt.eq
    epsilon.alt_(*)$. This proves the exact inequality on $0 lt.eq epsilon.alt < epsilon.alt_0$,
    equality for radial seeds, and strict inequality for nonradial seeds at positive parameters in that interval.
    The size of the interval is allowed to depend on the fixed seed and branch;
    no uniform positive lower bound for $c_2$ or $c_4$ is asserted or required. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
