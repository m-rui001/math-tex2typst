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

#align(center)[#text(size: 16pt, weight: "bold")[Spectral scalar curvature \
and uniform Urysohn width]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

Positive scalar curvature is expected to force a manifold to lose two dimensions at a controlled geometric scale.
  A spectral lower bound mixes scalar curvature with the energy of a test function and permits negative scalar
  curvature on parts of the manifold. We show that the uniform width conclusion survives this weakening.
  The geometric input is the stabilized width theorem of #cite(label("OpenAIWidth")),
  stated precisely in Theorem 2; the work here constructs its hypotheses from the spectral inequality.

Let $\( M^n \, g \)$ be a connected complete smooth Riemannian manifold without boundary.
  We use $Delta_g = "div"_g nabla_g$ and integrate against the Riemannian volume density.
  The #emph[normalized spectral scalar-curvature bound] is

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_M #scale(x: 120%, y: 120%)[\(] 4 \| nabla_g phi.alt \|_g^2 +
   "Scal"_g phi.alt^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) upright("vol")_g gt.eq
   integral_M phi.alt^2 thin upright(d) upright("vol")_g wide
   #scale(x: 120%, y: 120%)[\(] phi.alt in C_c^oo \( M \; bb(R) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:spectral-bound>]

Thus $- 4 Delta_g + "Scal"_g gt.eq 1$ in the quadratic-form sense.
  This is the definition on noncompact manifolds as well; it does not require a lowest eigenvalue to be attained.

For a metric space $X$ and an integer $d gt.eq 0$, its #emph[Urysohn $d$-width] is

$ "UW"_d \( X \) = inf_(f : X arrow.r K) med sup_(y in K) "diam"_X f^(- 1) \( y \) \, $

where $f$ is continuous and $K$ is a simplicial complex of dimension at most $d$ with its usual polyhedral
  topology. The diameter refers to the entire fiber, including all its components; empty fibers may be omitted.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 4$ there is a finite constant $C_n$ with the following property.
    Every connected complete smooth Riemannian $n$-manifold $\( M \, g \)$ without boundary satisfying (1.1)
    admits a continuous map $f : M arrow.r K$ to a simplicial complex of dimension at most $n - 2$ such that
$ "diam"_g f^(- 1) \( y \) lt.eq C_n wide \( y in K \) . $

 In particular, $"UW"_(n - 2) \( M \, g \) lt.eq C_n$.]
] <thm:main>

The constant depends only on the dimension. The theorem applies to compact and noncompact manifolds,
  without orientability, spin, or bounded-geometry assumptions.
  If the right side of (1.1) is multiplied by $lambda > 0$,
  scaling the metric to $lambda g$ gives the fiber bound $C_n \/ sqrt(lambda)$.

=== 1.1 History and relation to earlier work <history-and-relation-to-earlier-work>

Gromov’s macroscopic dimension program relates positive scalar curvature to the dimension of a space seen at large
  scales. The quantitative formulation asks whether a fixed positive scalar-curvature normalization forces a
  dimension-dependent bound for the fibers of a map to an $\( n - 2 \)$-dimensional polyhedron.
  This formulation goes back to #cite(label("Gromov1986")) § 2.A(c); see also #cite(label("Gromov1996")) § $2 1 /
  2$ and #cite(label("Gromov2023")). Uniform width is stronger than merely asking for a finite fiber bound for
  each individual metric. The stabilized partition theorem used here is the geometric input from
  #cite(label("OpenAIWidth")) that gives the uniform conclusion.

Several earlier results illustrate the distinction between the geometric and topological versions of the problem.
  Early three-dimensional distance-level diameter estimates of Gromov–Lawson #cite(label("GromovLawson1983")) use
  vanishing rational first homology, as clarified in Gromov’s later account #cite(label("Gromov2023")).
  That account also gives a uniform Urysohn $1$-width bound for arbitrary complete three-manifolds with scalar
  curvature bounded below by a positive constant. Under such a uniform lower bound,
  Liokumovich–Maximo #cite(label("LiokumovichMaximo2023")) and
  Liokumovich–Wang #cite(label("LiokumovichWang2026")) construct Morse functions with simultaneous area and
  diameter bounds on connected level components, in the closed and complete noncompact cases, respectively.
  In dimensions four and five, Chodosh–Li–Liokumovich proved finite Urysohn $1$-width for universal covers of
  closed positive-scalar-curvature manifolds under the respective assumptions $pi_2 = 0$ and $pi_2 = pi_3 =
  0$ #cite(label("ChodoshLiLiokumovich2023")) Theorem 4. That conclusion is qualitative and uses the topology of a
  compact quotient. The setting of Theorem 1 instead allows arbitrary complete manifolds and asks for one constant
  depending only on the dimension.

The coefficient $4$ in (1.1) is natural in weighted scalar curvature.
  On closed manifolds, Perelman’s $cal(F)$-functional and its lowest eigenvalue formulation involve $- 4 Delta +
  "Scal"$, together with the expression $"Scal" + 2 Delta t - \| upright(d)
  t \|^2$ #cite(label("Perelman2002")) §§1–2. Gromov’s torus-stabilized scalar curvature makes the same connection
  through diagonal warped products #cite(label("Gromov2024")) §§1.A–1.B.
  Spectral curvature bounds also enter the band and cube inequalities of Hirsch–Kazaras–Khuri–Zhang
  #cite(label("HirschKazarasKhuriZhang2024")), whose hypotheses depend on the dimension, topology,
  and coefficient of the scalar-curvature term. Those inequalities control separations of boundary sets,
  rather than the fibers of a map on an arbitrary complete manifold.

Our starting point is the partition theorem in #cite(label("OpenAIWidth")),
  including its locally finite stabilized input. The spectral-to-positive-solution passage and the warped-product
  formula are established tools. The additional work is to create a quadratic reserve from an unrestricted
  logarithmic drift and to adapt the local stretching argument to a signed drift.
  These constructions retain the original metric as the metric in which the final fibers are measured.
  In particular, no control of a conformal factor or of the weight at infinity is needed.

=== 1.2 The new constructions and the proof <the-new-constructions-and-the-proof>

The spectral hypothesis supplies a positive smooth function $v$ with $- 4 Delta_g v + "Scal"_g v gt.eq v$.
  For a metric $h$ and a smooth real function $t$, write

#[#set math.equation(numbering: n => "(1.2)")
 $ cal(D) \( h \, t \) = "Scal"_h + 2 Delta_h t - \| upright(d) t \|_h^2 . $ <eq:drift-scalar>]

Then $w = - 2 log v$ satisfies $cal(D) \( g \, w \) gt.eq 1$.
  This identity produces a weighted curvature bound, but gives no control on the value or oscillation of $w$.
  The stretching construction needs an additional reserve that grows quadratically with its drift.

The first new ingredient supplies that reserve without estimating $w$.
  For an arbitrary complete metric $h$ and smooth $w$, we construct a smooth function $u$,
  a global graph metric $h^(+) = h + upright(d) u^2$, and a new signed drift $t^(+)$ such that

$ cal(D) \( h^(+) \, t^(+) \) gt.eq cal(D) \( h \, w \) + \( t^(+) \)^2 - C \( n \) . $

Here $C \( n \)$ is independent of the geometry and of $w$.
  The graph equation has pressure proportional to the discrepancy $u - w$;
  subtracting the graph height in the drift update turns that discrepancy into the required square.
  Local barriers and an angle estimate give a global solution even when $w$ and the geometry are unbounded at
  infinity. The precise statement and proof are in Proposition 4.

The second ingredient stretches selected pairs of sets by increasing the metric on a compact neighborhood.
  Its pressure depends on a possibly negative drift. For a dimension-dependent $T$, the reserve is $V \( t \) =
  t^2 + T^2$. When the drift increases from $t$ to $t' gt.eq t$,
  the local estimate retains the positive part of $V \( t' \) - V \( t \)$,
  because increasing a signed drift need not increase $V$. Its loss is paid by a decrease of $"tr"_h h_0$,
  where $h_0$ is fixed during one round of stretching, together with an arbitrarily small summable error.
  The inverse construction of the pressure is given in Proposition 8, and the resulting geometric estimate is Lemma 9.

To assemble these tools, choose a radius $D$ depending only on $n$ and maximal $D$-separated centers $x_i$ in the
  original metric. Their closed radius-$D$ balls cover $M$,
  and their closed radius-$2 D$ balls are locally finite. The local lemma is applied in rounds until each inner
  ball is as far as prescribed from the exterior of its outer ball.
  The trace decreases telescope within each round, independently of the number of overlapping balls.
  Each index $i$ requires only finitely many rounds, and every compact set meets only finitely many outer balls,
  so the final metric and drift are smooth and eventually unchanged on each compact neighborhood.

The final bound $cal(D) \( h \, t \) gt.eq 1 \/ 2$ is converted into the stabilized scalar-curvature inequality by
  expressing $- t$ as a locally finite sum of compactly supported logarithmic warps and subdividing each summand
  until the sum of squared gradients is small. Theorem 2 then supplies a map whose entire fibers are bounded in
  $g$. Section 6 carries out the parameter choice and this last passage.
  Thus the graph reserve and the signed stretching estimate are the analytic contributions;
  the topological dimension drop is the conclusion of the stated geometric input.

== 2 A partition theorem for stretched data <sec:interface>

The passage from scalar curvature to a map of controlled fiber diameter uses the partition construction of
  #cite(label("OpenAIWidth")). We state the precise consequence needed here.
  Its distances are measured in two metrics: a metric $g$ fixes the scale of the eventual fibers,
  while a larger metric $h$ separates prescribed pairs of subsets.
  The work of the subsequent sections is to construct such an $h$ from the spectral hypothesis.
  Here $h gt.eq g$ means quadratic-form domination: $h_x \( v \, v \) gt.eq
  g_x \( v \, v \)$ for every $x in M$ and $v in T_x M$.

For a smooth metric $h$ and a finite family of smooth real functions $p_alpha$,
  the scalar curvature of the diagonal circle metric

$ h + sum_alpha e^(2 p_alpha) thin upright(d) theta_alpha^2 $

is given by the standard multiple-warp formula #cite(label("Gromov2024")) Section 1.A:

#[#set math.equation(numbering: n => "(2.1)")
 $ R \( h \, \( p_alpha \) \) = "Scal"_h - 2 Delta_h P - \| upright(d) P \|_h^2 -
   sum_alpha \| upright(d) p_alpha \|_h^2 \, wide P = sum_alpha p_alpha . $ <interface:scalar>]

We call $p_alpha$ a #emph[log warp]. The same expression makes sense for a countable family whose compact supports
  are locally finite: every point has a neighborhood meeting only finitely many supports.
  On that neighborhood, (2.1) is the scalar curvature of a metric on its product with finitely many circles.
  Adjoining a circle of constant length one changes neither the formula nor the weight $e^P thin upright(d)
  upright("vol")_h$.

#thm([Theorem 2.1.])[
  (Partition theorem for stretched data #cite(label("OpenAIWidth"))).  #emph[For each integer $n gt.eq 4$,
    there is a finite number $D_(upright("nat")) \( n \) > 0$ with the following property.
    Let $\( M^n \, g \)$ be a connected complete smooth Riemannian manifold without boundary, and let $D gt.eq
    D_(upright("nat")) \( n \)$. Choose a maximal $D$-separated set of centers $\( x_i \)_(i in I)$, where $I =
    { 1 \, dots.h \, N }$ or $I = bb(N)$, and put
$ A_i = overline(B)_g \( x_i \, D \) \, wide B_i = M \\ B_g \( x_i \, 2 D \) . $

 Suppose every $B_i$ is nonempty. Choose positive numbers $p_i^(*)$ for $i in { 0 } union I$ such that
$ sum_(i in { 0 } union I) p_i^(*) = 1 / 20 . $

 Assume there are a complete smooth metric $h gt.eq g$ and a finite or countable family of smooth real functions
   $\( p_alpha \)$ with locally finite compact supports such that
#[#set math.equation(numbering: n => "(2.2)")
 $ "dist"_h \( A_i \, B_i \) > 10 + 2 pi sqrt(2 \/ p_i^(*)) quad \( i in I \) \, wide
   R \( h \, \( p_alpha \) \) gt.eq 2 / 5 quad upright("on ") M . $ <interface:width-hypothesis>]

 Then there is a continuous map $f : M arrow.r K$ to a simplicial complex of dimension at most $n - 2$,
   with its usual polyhedral topology, such that
$ sup_(y in K) "diam"_g f^(- 1) \( y \) lt.eq 4 D + 2 . $

 The diameter bounds the entire fiber, including all its components.]
] <interface:width>

We use this theorem as an imported result. It follows from Lemma 6.1 and Proposition 6.6 of
  #cite(label("OpenAIWidth")), followed by Proposition 7.1 and Equation (7.14) there.
  The threshold $D_(upright("nat")) \( n \)$ retains the scale chosen in that paper,
  where the initial scale may be enlarged.

The pointwise scalar-curvature theorem of #cite(label("OpenAIWidth")) first constructs $h$ and the log warps from
  $"Scal"_g gt.eq 1$. Its partition construction begins with these data already in hand.
  Lemma 6.1 there uses the separations in (2.2) and the initial scalar requirement

$ R \( h \, \( p_alpha \) \) gt.eq 1 / 4 + 1.12 sum_(i in { 0 } union I) p_i^(*) = .306 \, $

which follows from $2 \/ 5$. Its scalar hypothesis concerns $R \( h \, \( p_alpha \) \)$;
  a lower bound for $"Scal"_g$ is not required at this stage.

The countable version in #cite(label("OpenAIWidth")) expressly permits local finiteness of the initial log warps.
  The measure $e^P thin upright(d) upright("vol")_h$ is smooth and positive,
  and every compact region has a neighborhood on which only finitely many factors occur.
  The cited construction first separates $M$ into pieces confined to compact radial regions;
  label $0$ is reserved for this step. Product cylinders are then attached along boundary hypersurfaces,
  with the metric and warp data independent of the cylinder coordinate.
  The localization and induction in Propositions 6.4 and 6.6 ensure that each analytic piece at every later finite
  stage has only finitely many relevant initial warps on its entire extent, including its product ends.
  Thus the initial data need no uniform bounds on the geometry or the weight at infinity.
  The finiteness and geometric bounds needed on the later pieces are conclusions of the imported construction.

The reconstruction produces a continuous map $q : M arrow.r
  M$ with $d_g \( x \, q \( x \) \) < 1$ and continuous coordinates $a_i :
  M arrow.r \[ 0 \, 1 \]$ with locally finite supports. They satisfy

$ a_i = 1 med upright("on ") q^(- 1) \( A_i \) \, wide a_i = 0 med upright("on ") q^(- 1) \( B_i \) \, $

and at each point some coordinate equals $1$ while at most $n - 2$ coordinates lie strictly between $0$ and $1$.
  These vectors lie in a cubical complex of dimension at most $n - 2$.
  Its compatible staircase triangulations give $K$. Local finiteness of the coordinate supports places the map
  locally in a finite subcomplex, which gives continuity for the polyhedral topology.
  Equality of images preserves the full coordinate vector. Thus two points in one fiber have a common coordinate
  equal to $1$; their $q$-images lie in the same original outer ball, and their $g$-distance is less than $4 D + 2$.

To apply Theorem 2 under the spectral hypothesis, we must construct the data in (2.2) at a uniform initial
  stretching scale even though the positive supersolution associated with the spectral inequality can have
  unbounded logarithm and gradient.

== 3 From spectral positivity to a quadratic reserve <sec:preprocessing>

Recall the weighted scalar expression $cal(D)$, and define its associated weighted divergence by

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(D) \( h \, t \) = "Scal"_h + 2 Delta_h t - \| upright(d) t \|_h^2 \, wide "div"_(h \, t) Y = "div"_h Y -
   upright(d) t \( Y \) . $ <pre:drift-scalar>]

The spectral hypothesis first supplies a function $w$ with $cal(D) \( g \, w \) gt.eq 1$.
  The difficulty is that it supplies no uniform control of $w$.
  Our aim in this section is to enlarge the metric and replace $w$ by a new function for which the scalar
  inequality contains a positive quadratic term. This term will pay for the later distance enlargements.

The passage from a quadratic-form inequality to a positive solution is part of Allegretto–Piepenbrink theory
  #cite(label("Allegretto1974")) #cite(label("MossPiepenbrink1978")).
  We include the exhaustion argument in the form needed here.

#thm([Lemma 3.1.])[
  (Positive supersolution).  #emph[Let $\( M \, g \)$ be a connected complete smooth manifold without boundary
    satisfying the normalized spectral bound in Theorem 1. There is a smooth positive function $v$ on $M$ such that
$ - 4 Delta_g v + "Scal"_g v gt.eq v . $

 Consequently $w = - 2 log v$ is smooth and satisfies $cal(D) \( g \, w \) gt.eq 1$.]
] <pre:supersolution>

#proof[
  If $M$ is compact, take a positive first eigenfunction of $- 4 Delta_g + "Scal"_g$.
    For noncompact $M$, choose a nested exhaustion by relatively compact connected smooth domains $Omega_j$,
    with $overline(Omega)_j subset Omega_(j + 1)$, all containing a fixed point $o$.
    Let $v_j$ be a positive Dirichlet first eigenfunction on $Omega_j$, normalized by $v_j \( o \) = 1$,
    and let $lambda_j$ be its eigenvalue. These eigenfunctions exist by the variational principle,
    compact Sobolev embedding on each domain, elliptic regularity, and the strong maximum principle.
    The potential is smooth and bounded on each domain closure.
    Approximation in the Dirichlet form domain shows that $lambda_j gt.eq 1$.
    One fixed nonzero test function supported in $Omega_1$ bounds all $lambda_j$ from above.
  After passing to a subsequence, $lambda_j arrow.r lambda gt.eq 1$.
    On every fixed compact subset of $M$, interior Harnack inequalities and finite chains of coordinate balls
    bound $v_j$ above and below, using the normalization at $o$.
    Interior elliptic estimates and a diagonal subsequence then give a smooth positive limit $v$ satisfying $-
    4 Delta_g v + "Scal"_g v = lambda v$. All estimates use only fixed compact subsets;
    no uniform geometry at infinity is required. Finally,
  $ 2 Delta_g \( - 2 log v \) - \| upright(d) \( - 2 log v \) \|_g^2 = - 4 frac(Delta_g v, v) \, $
  which proves the assertion for $w$. ◻
]

The reserve construction applies to arbitrary smooth functions,
  not only to the function supplied by the spectral hypothesis.

#thm([Proposition 3.2.])[
  (Quadratic reserve).  #emph[For every integer $n gt.eq 4$ there is a constant $C \( n \) <
    oo$ with the following property. If $h$ is a complete smooth metric on a connected boundaryless $n$-manifold
    $M$ and $w in C^oo \( M \)$, there are a smooth complete metric $h^(+) gt.eq
    h$ and a smooth real-valued function $t^(+)$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ cal(D) \( h^(+) \, t^(+) \) gt.eq cal(D) \( h \, w \) + \( t^(+) \)^2 - C \( n \) quad
   upright("on ") M . $ <pre:reserve-bound>]

 One may take $C \( n \) = 100 n + 203$.]
] <pre:reserve>

We shall use the metric induced by a graph of height $u$ in $\( M \, h \) times bb(R)$,
  prescribing its weighted mean curvature by

$ "div"_(h \, w) (frac(nabla_h u, sqrt(1 + \| upright(d) u \|_h^2))) = p \, wide p = 10 \( u - w \) . $

The pressure measures the discrepancy between the graph height and the original function,
  even when both are unbounded. For a candidate height $u$,
  put $s = \| upright(d) u \|_h$ and $l = \( 1 + s^2 \)^(- 1 \/ 2)$.
  The induced metric is $h_u = h + upright(d) u ⊗ upright(d) u$,
  and its volume density is $l^(- 1) upright(d) upright("vol")_h$.
  Thus $t_u = t - log l$ is exactly the change preserving the weighted density:

$ e^(- t_u) upright(d) upright("vol")_(h_u) = e^(- t) upright(d) upright("vol")_h . $

For $t = w$ and pressure $p = 10 \( u - w \)$, our final drift will satisfy

$ t^(+) = t_u - u = - p \/ 10 - log l . $

This is the quantity whose square the graph equation must supply.
  The scalar calculation below produces a positive $p^2$ term,
  together with slope and derivative terms that we will also estimate.
  We first construct a smooth solution of the graph equation;
  the scalar comparison and the square completion will then be carried out consecutively.

=== 3.1 The angle equation and elliptic estimates <pre:elliptic-tools>

To construct the prescribed graph, we need an a priori gradient estimate on a possibly noncompact manifold.
  The useful gradient variable is the vertical component of the graph normal:
  a positive lower bound for this component is an upper bound for the slope.
  We record the equation it satisfies, allowing angle-dependent pressure for use in the later local construction.
  The use of normal variation and comparison to estimate graph gradients has a classical predecessor in Korevaar’s
  treatment of prescribed mean curvature #cite(label("Korevaar1984"));
  we give the weighted calculation and all estimates used here.

#thm([Lemma 3.3.])[
  (Graph angle equation).  #emph[Let $u$ be smooth on an open subset of a Riemannian manifold $\( M \, h \)$.
    On its graph $Gamma$ in $\( M \, h \) times bb(R)$, with vertical coordinate $z$, put
$ omega = \( 1 + \| upright(d) u \|_h^2 \)^(- 1 \/ 2) \, wide nu = \( omega nabla_h u \, - omega \) \, wide Z = -
  partial_z . $

 Let $t$ be a smooth function on the base, extended constantly in $z$, and let $X = - nabla t$.
   Suppose that a smooth function $p \( x \, z \, omega \)$, defined near the graph data, satisfies
$ H_Gamma + chevron.l X \, nu chevron.r = p \( x \, u \( x \) \, omega \) . $

 Here $H_Gamma$ is the trace of the second fundamental form $upright("II") = nabla nu$. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(L) omega & = - p_z \,\
cal(L) =  & Delta_Gamma + chevron.l X^top - p_omega Z^top \, nabla_Gamma thin dot.op thin chevron.r\
 & + \| upright("II") \|^2 + "Ric"_(upright("amb")) \( nu \, nu \) + "Hess"_(upright("amb")) t \( nu \, nu \) +
   partial_nu^(upright("fix") thin omega) p . $ <pre:angle-equation>]

 The superscript $top$ denotes tangential projection to $Gamma$;
   the final derivative differentiates the ambient variables while holding the angle argument of $p$ fixed.]
] <pre:angle>

#proof[
  Extending the displayed normal independently of $z$ gives $H_Gamma = "div"_h \( omega nabla_h u \)$.
    For a normal variation with speed $V$, the variation formulas in our convention are
  $ dot(nu) = - nabla_Gamma V \, wide dot(H)_Gamma = - Delta_Gamma V -
    #scale(x: 120%, y: 120%)[\(] \| upright("II") \|^2 + "Ric"_(upright("amb")) \( nu \, nu \)
    #scale(x: 120%, y: 120%)[\)] V . $
  Since $X = - nabla t$ and $omega = chevron.l Z \, nu chevron.r$, one has
  $ frac(upright(d), upright(d) a) \|_(a = 0) chevron.l X \, nu chevron.r & = -
    "Hess"_(upright("amb")) t \( nu \, nu \) V - chevron.l X^top \, nabla_Gamma V chevron.r \,\
dot(p) & = partial_nu^(upright("fix") thin omega) p thin V - p_omega chevron.l Z^top \, nabla_Gamma V chevron.r . $
  Thus the linearization of $H_Gamma + chevron.l X \, nu chevron.r - p$ is $- cal(L) V$.
    Translation in the direction $Z = - partial_z$ has normal speed $omega$.
    It leaves the geometric left-hand side and the angle unchanged, while its derivative of the residual is $+
    p_z$. The tangential component differentiates a residual which vanishes identically on $Gamma$.
    Hence $- cal(L) omega = p_z$. ◻
]

We will use the following local elliptic facts in both graph constructions. In coordinates, the equations have the form

#[#set math.equation(numbering: n => "(3.4)")
 $ partial_i frak(A)^i \( x \, D u \) = frak(B) \( x \, u \, D u \) \, $ <pre:quasilinear-equation>]

where the volume density may be included in $frak(A)$ and $frak(B)$.
  Suppose these functions are smooth on a neighborhood of a compact range of $\( x \, u \, D u \)$,
  with bounded derivatives there, and that $frak(A)_(p_m)^i$ is uniformly elliptic on that range.
  For a family of equations, the stated coefficient and ellipticity bounds are assumed uniform over the parameters
  under consideration. Uniform height and gradient bounds for smooth solutions then give interior bounds of every
  order. For completeness, differentiating in $x_j$ and writing $b = partial_j u$ gives

#[#set math.equation(numbering: n => "(3.5)")
 $ partial_i #scale(x: 120%, y: 120%)[\(] frak(A)_(p_m)^i partial_m b #scale(x: 120%, y: 120%)[\)] -
   frak(B)_(p_m) partial_m b = frak(B)_u b + frak(B)_(x_j) -
   partial_i frak(A)_(x_j)^i . $ <pre:differentiated-equation>]

Subscripts $x_j$ on the coefficient functions mean explicit derivatives, with the other arguments held fixed.
  Thus this is a uniformly elliptic divergence equation with bounded coefficients, bounded lower-order terms,
  bounded scalar data, and the divergence of bounded vector data.
  The interior De Giorgi–Nash estimate #cite(label("GilbargTrudinger2001")) Theorem 8.24 gives a uniform Hölder
  bound for $b$, and hence a $C^(1 \, alpha)$ bound for $u$, for some $alpha > 0$.
  The nondivergence form of (3.4) now has Hölder coefficients and right-hand side.
  Interior Schauder estimates #cite(label("GilbargTrudinger2001")) Theorem 6.2 and Corollary 6.3 give
  $C^(2 \, alpha)$ bounds, and differentiation yields bounds of all higher orders;
  compare also #cite(label("GilbargTrudinger2001")) Theorem 13.1 for this differentiation argument.
  On a closed manifold a finite coordinate cover makes these estimates global.

In particular, a continuation on a fixed closed manifold is closed once uniform height and gradient bounds keep
  the solutions in a compact subset of the open equation domain.
  It is open when the linearization has strictly negative zeroth-order coefficient.
  Indeed, for the resulting smooth uniformly elliptic operator, interpolation with $Delta - 1$,
  the maximum principle, and Schauder estimates give invertibility $C^(2 \, alpha) arrow.r C^(0 \, alpha)$.
  The starting operator $Delta - 1$ is invertible by the energy method and elliptic regularity.
  The implicit function theorem then gives openness, and elliptic regularity gives smooth solutions.
  All constants in this discussion may depend on the individual compact manifold or the fixed coordinate charts.

=== 3.2 A global graph with linear discrepancy pressure <a-global-graph-with-linear-discrepancy-pressure>

We now solve the graph equation without imposing any global size condition on $w$.
  The positive derivative of the pressure with respect to height will provide both comparison and the angle bound.

#thm([Lemma 3.4.])[
  (Global prescribed graph).  #emph[Let $h$ be a complete smooth metric on a connected manifold $M$ without
    boundary, and let $w in C^oo \( M \)$. With $c = 10$, there is a smooth function $u$ on $M$ satisfying
#[#set math.equation(numbering: n => "(3.6)")
 $ "div"_(h \, w) (frac(nabla_h u, sqrt(1 + \| upright(d) u \|_h^2))) = c \( u - w \) . $ <pre:global-equation>]

]
] <pre:global-graph>

#proof[
  First suppose $M$ is closed. Replace $w$ by $tau w$ in both occurrences of (3.6), with $0 lt.eq tau lt.eq 1$.
    The zero function solves the equation at $tau = 0$. Comparison with constants gives $\| u \| lt.eq
    max_M \| w \|$ along the continuation. In ordinary mean-curvature form, the equation has $t = tau w$ and $p =
    c \( z - tau w \( x \) \)$ in Lemma 5; in particular $p_z = c$ and $p_omega = 0$.
    The zeroth-order coefficient of $cal(L)$, after discarding $\| upright("II") \|^2$, is bounded below by $- C$,
    uniformly in $tau$ and the solution. This uses only the compact bounds for the ambient Ricci tensor,
    $"Hess" w$, and $upright(d) w$, since
  $ partial_nu^(upright("fix") thin omega) p = c #scale(x: 120%, y: 120%)[\(] nu_z -
    tau upright(d) w \( nu_h \) #scale(x: 120%, y: 120%)[\)] . $
  At a minimum of $omega$, Equation (3.3) gives
  $ - c = cal(L) omega gt.eq - C omega . $
  Thus $omega gt.eq c \/ C > 0$, after increasing $C$ if necessary, and the gradient is uniformly bounded.
    The mean-curvature flux has principal eigenvalues $\( 1 + s^2 \)^(- 1 \/ 2)$ orthogonal to $nabla
    u$ and $\( 1 + s^2 \)^(- 3 \/ 2)$ in its direction, where $s = \| upright(d) u \|_h$.
    The gradient bound therefore gives uniform ellipticity. The linearization has zeroth-order coefficient $- c$;
    the preceding elliptic facts give existence at $tau = 1$.
  For noncompact $M$, choose closed manifolds extending successively larger relatively compact regions,
    with extensions of $h$ and $w$ agreeing with the original data near each region closure.
    To obtain them, take smooth compact domain enlargements, modify the data outside the region to be product data
    in a boundary collar, and double. This construction does not require orientability.
    Solve the equation on each closed extension. It remains to obtain estimates on every fixed compact subset of
    the original manifold that do not depend on the extension.
  Fix a sufficiently small normal coordinate ball $B$ of radius $R$,
    whose closure is contained in a normal coordinate neighborhood.
    We consider only extensions agreeing with the original data near $overline(B)$.
    Write $r$ for radial distance from its center. Choose a nonnegative smooth radial function $b$ on $B$,
    constant near the center and equal to $\( R - r \)^(- 1)$ near the boundary.
    The expression $"div"_(h \, w) \( nabla_h b \/ sqrt(1 + \| upright(d) b \|_h^2) \)$ is bounded on $B$.
    In fact, near the boundary,
  $ b' / sqrt(1 + \( b' \)^2) = \( 1 + \( R - r \)^4 \)^(- 1 \/ 2) \, wide (b' / sqrt(1 + \( b' \)^2))' =
    frac(2 \( R - r \)^3, \( 1 + \( R - r \)^4 \)^(3 \/ 2)) \, $
  and the remaining terms use bounded $Delta_h r$ and $upright(d) w$ there.
    Taking $C$ sufficiently large makes $C + b$ an upper solution and $- C - b$ a lower solution of (3.6) on $B$.
    Both barriers diverge with the appropriate sign at the boundary.
    Each solution under consideration is smooth across $overline(B)$, so a violation attains an interior extremum.
    At such an extremum the gradients agree, ellipticity compares the second-order terms,
    and the strict increase of $c \( u - w \)$ in $u$ gives a contradiction.
    We obtain uniform height bounds on every smaller ball.
  To bound the gradient there, choose a nonnegative smooth cutoff $zeta_0$ compactly supported in $B$ and positive
    on that smaller ball. Use Lemma 5 with $t = w$ and $p = c \( z - w \( x \) \)$.
    The height bound on $"supp" zeta_0$ bounds $p$ and hence $H_Gamma$.
    Viewing $zeta_0$ as a function on the graph, one has
  $ Delta_Gamma zeta_0 = "tr"_(T Gamma) "Hess"_(upright("amb")) zeta_0 - H_Gamma chevron.l nabla zeta_0 \,
    nu chevron.r . $
  Thus its intrinsic Laplacian and gradient are bounded independently of the slope.
    The drift $X^top$ is bounded, and the zeroth-order coefficient of $cal(L)$ is bounded below after discarding
    $\| upright("II") \|^2$.
  Let $A = max \( zeta_0 \/ omega \) > 0$. At a point attaining this maximum, $omega -
    zeta_0 \/ A$ has value and gradient zero and nonnegative Laplacian. Therefore
  #[#set math.equation(numbering: n => "(3.7)")
   $ - c = cal(L) omega gt.eq A^(- 1) cal(L) zeta_0 gt.eq - C' \/ A . $ <pre:cutoff-angle>]
  The last bound is uniform on the fixed ball: the possibly unbounded term $\| upright("II") \|^2
    zeta_0$ is nonnegative, and every other term has the bounds just established.
    It follows that $A lt.eq C' \/ c$. Since $zeta_0$ has a positive lower bound on any compact subball on which
    it is positive, this is the required interior gradient bound.
  The elliptic estimates above now give uniform bounds of every order on fixed compact subsets.
    A diagonal subsequence of the extension solutions converges smoothly locally on $M$ and solves (3.6).
    None of the constants in this limiting argument requires a uniform geometric bound at infinity. ◻
]

=== 3.3 Scalar comparison for a graph enlargement <pre:scalar-subsection>

The global graph is now available, and we turn to its scalar curvature.
  For the later localized construction we allow a more general metric which stretches only the line normal to a
  level set of the height function. Writing this length multiplier as $1 \/ l$, we again use $t_u = t -
  log l$ to preserve the weighted density. The following calculation extends the graph comparison underlying the
  local deformation in #cite(label("OpenAIWidth")) Section 3.5, Lemma 3.4.

#thm([Lemma 3.5.])[
  (Scalar graph comparison).  #emph[Let $h$ be a smooth metric on an $n$-manifold, let $t \,
    u$ be smooth functions, and work on an open set where $s = \| upright(d) u \|_h > 0$.
    Let $theta = theta \( s \)$ be a smooth function with $0 < theta < 1$, and put
$ l = sqrt(1 - theta) \, wide beta = log l \, wide k_1 = sqrt(theta) \, wide e = nabla_h u \/ s . $

 Assume $0 lt.eq - s beta_s lt.eq 2$. Define
#[#set math.equation(numbering: n => "(3.8)")
 $ h_u = h + frac(theta, \( 1 - theta \) s^2) thin upright(d) u ⊗ upright(d) u \, wide t_u = t -
   beta . $ <pre:graph-update>]

 Let $J$ be the second fundamental form of the level sets of $u$ with normal $e$, let $H = "tr" J$, and set
$ S = H - e \( t \) \, wide K = l^2 / theta e \( beta \) \, wide M_1 = S - K . $

 Then $K = - e \( log k_1 \)$, and
#[#set math.equation(numbering: n => "(3.9)")
 $ "div"_(h \, t) \( k_1 e \) = k_1 M_1 . $ <pre:weighted-divergence>]

 Moreover,
#[#set math.equation(numbering: n => "(3.10)")
 $ cal(D) \( h_u \, t_u \) - cal(D) \( h \, t \) & gt.eq theta E \,\
E & = \| J \|^2 + M_1^2 + K^2 \/ l^2 - 2 M_1 K + 2 e \( M_1 \) . $ <pre:scalar-comparison>]

 All norms of level tensors in this formula use the metric induced by $h$.]
] <pre:graph-comparison>

#proof[
  Use $q = u$ as a transverse coordinate and transport the remaining coordinates along the flow orthogonal to the
    levels. Locally,
  $ h = v_1^2 thin upright(d) q^2 + gamma_q \, wide v_1 = s^(- 1) \, wide e = v_1^(- 1) partial_q \, wide J =
    frac(1, 2 v_1) partial_q gamma_q . $
  The Gauss equation and the mean-curvature variation formula give
  $ "Scal"_h = "Scal"_(gamma_q) - \| J \|^2 - H^2 - 2 e \( H \) - 2 frac(Delta_(gamma_q) v_1, v_1) . $
  Indeed, the normal variation with speed $v_1$ has mean-curvature derivative $-
    Delta_(gamma_q) v_1 - \( \| J \|^2 + "Ric"_h \( e \, e \) \) v_1$. The Laplacian of $t$ is
  $ Delta_h t = Delta_(gamma_q) t + e \( e \( t \) \) + H e \( t \) + chevron.l upright(d)_gamma log v_1 \,
    upright(d)_gamma t chevron.r . $
  Consequently
  #[#set math.equation(numbering: n => "(3.11)")
   $ cal(D) \( h \, t \) =  & - \| J \|^2 - S^2 - 2 e \( S \) + "Scal"_(gamma_q) +
     2 Delta_(gamma_q) t - \| upright(d)_gamma t \|^2\
 & - 2 frac(Delta_(gamma_q) v_1, v_1) + 2 chevron.l upright(d)_gamma log v_1 \,
   upright(d)_gamma t chevron.r . $ <pre:foliation-scalar>]
  Here $upright(d)_gamma$ denotes tangential differentiation on a level set.
  For the new metric, $v_1$ is replaced by $v_1 \/ l$ and $t$ by $t - beta$.
    The resulting change in the last four tangential terms of (3.11) is
  $ 2 chevron.l upright(d)_gamma log v_1 \, upright(d)_gamma beta chevron.r - \| upright(d)_gamma beta \|^2 =
    f \( 2 - f \) \| upright(d)_gamma log s \|^2 gt.eq 0 \, wide f = - s beta_s . $
  Differentiating $l^2 + k_1^2 = 1$ gives $K = - e \( log k_1 \)$ and then (3.9).
    The new normal and level second fundamental form are $l e$ and $l J$, respectively. The new value of $S$ is
  $ l \( S + e \( beta \) \) = l M_1 + K \/ l . $
  Substitute these expressions into the first three terms of (3.11).
    Using $e \( l \) = theta K \/ l$, their difference is
  $ & - l^2 \| J \|^2 - \( l M_1 + K \/ l \)^2 - 2 l thin e \( l M_1 + K \/ l \)\
 & #h(14mm)  + \| J \|^2 + \( M_1 + K \)^2 + 2 e \( M_1 + K \)\
 & wide = theta #scale(x: 120%, y: 120%)[\(] \| J \|^2 + M_1^2 + K^2 \/ l^2 - 2 M_1 K +
   2 e \( M_1 \) #scale(x: 120%, y: 120%)[\)] . $
  In particular, the derivatives of $K$ cancel. Adding the nonnegative tangential change proves (3.10). ◻
]

Identity (3.9) explains the role of $M_1$: it is the weighted divergence of $k_1 e$, divided by $k_1$.
  For the ordinary graph choice $theta = s^2 \/ \( 1 + s^2 \)$, the vector field is $k_1 e =
  nabla_h u \/ sqrt(1 + \| upright(d) u \|_h^2)$. If this divergence is prescribed to be $p$, then $M_1 =
  p \/ k_1$ and the term $theta M_1^2$ in (3.10) is precisely $p^2$.
  The terms involving $K$ and $e \( M_1 \)$ still have to be controlled.
  For the graph just constructed, the linear discrepancy pressure will control them through the following square
  completion.

=== 3.4 Completion of the reserve estimate <completion-of-the-reserve-estimate>

We can now turn the discrepancy pressure into the square in Proposition 4.
  The argument is pointwise; consequently the compact-data constants needed to construct $u$ will not enter the
  reserve constant.

#proof[
  Take $u$ from Lemma 6, set $s = \| upright(d) u \|_h$, and use Lemma 7 with $t = w$ and
  $ theta = frac(s^2, 1 + s^2) \, wide l = \( 1 + s^2 \)^(- 1 \/ 2) \, wide k_1 = l s \, wide beta = log l . $
  Here $0 lt.eq - s beta_s lt.eq 1$. Define
  #[#set math.equation(numbering: n => "(3.12)")
   $ h^(+) = h + upright(d) u ⊗ upright(d) u = h_u \, wide t^(+) = w - beta - u = t_u - u . $ <pre:reserve-output>]
  Both expressions are smooth also where $upright(d) u = 0$.
  Write $p = c \( u - w \)$, with $c = 10$. The weighted volume densities satisfy
  $ e^(- t_u) upright(d) upright("vol")_(h_u) = e^(- w) upright(d) upright("vol")_h . $
  Since $nabla_(h_u) u = l k_1 e$, this gives, where $s > 0$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ Delta_(h_u) u - chevron.l upright(d) t_u \, upright(d) u chevron.r_(h_u) = "div"_(h \, w) \( l k_1 e \) =
     l p + frac(k_1 theta K, l) \, wide \| upright(d) u \|_(h_u)^2 = k_1^2 . $ <pre:graph-laplacian>]
  Equation (3.6) and (3.9) give $M_1 = p \/ k_1$, and hence
  #[#set math.equation(numbering: n => "(3.14)")
   $ e \( M_1 \) = M_1 K + frac(c \( s - e \( w \) \), k_1) \, wide e \( w \) = H - M_1 -
     K . $ <pre:pressure-derivative>]
  Subtracting $u$ from $t_u$ changes $cal(D)$ by $- 2 Delta_(h_u) u + 2 chevron.l upright(d) t_u \,
    upright(d) u chevron.r_(h_u) - \| upright(d) u \|_(h_u)^2$. Substituting (3.13)–(3.14) into (3.10) therefore yields
  #[#set math.equation(numbering: n => "(3.15)")
   $ cal(D) \( h^(+) \, t^(+) \) - cal(D) \( h \, w \) gt.eq  & k_1^2 \| J \|^2 + p^2 + frac(k_1^2 K^2, l^2) +
     2 c k_1 \( s - H + M_1 + K \)\
 & - 2 (l p + frac(k_1 theta K, l)) - k_1^2 . $ <pre:reserve-expansion>]
  There are three square completions. Since the level sets have dimension $n - 1$,
  $ k_1^2 \| J \|^2 - 2 c k_1 H & gt.eq - \( n - 1 \) c^2 \,\
frac(k_1^2 K^2, l^2) + 2 k_1 \( c - theta \/ l \) K & gt.eq - \( c l - theta \)^2 \,\
p^2 + 2 \( c - l \) p & gt.eq 1 / 2 p^2 - 2 \( c - l \)^2 . $
  For $c = 10$, $0 < l lt.eq 1$, and $0 lt.eq theta < 1$, we have $\| c l - theta \| lt.eq 10$, $\| c - l \| lt.eq
    10$, and $k_1^2 lt.eq 1$. Thus (3.15) implies
  #[#set math.equation(numbering: n => "(3.16)")
   $ cal(D) \( h^(+) \, t^(+) \) - cal(D) \( h \, w \) gt.eq 1 / 2 p^2 +
     20 k_1 s - \( 100 n + 201 \) . $ <pre:reserve-intermediate>]
  It remains to compare the right-hand side with $\( t^(+) \)^2$.
    Since $t^(+) = - p \/ c - beta$, the elementary inequality
  $ - beta = 1 / 2 log \( 1 + s^2 \) lt.eq log \( 1 + s \) lt.eq sqrt(s) $
  gives
  $ \( t^(+) \)^2 lt.eq frac(2 p^2, c^2) + 2 s . $
  For $s gt.eq 1$, $k_1 gt.eq 1 \/ sqrt(2)$, so $20 k_1 s gt.eq 2 s$.
    For $s < 1$, the term $2 s$ costs at most $2$. Together with (3.16), this proves (3.2) with $C \( n \) =
    100 n + 203$ wherever $s > 0$.
  The resulting inequality extends to boundary points of ${ s > 0 }$ by smoothness.
    On the interior of ${ s = 0 }$, the function $u$ is locally constant and (3.6) gives $u = w$ there;
    thus $t^(+) = 0$ and the inequality holds directly. Finally, $h^(+) gt.eq h$ implies completeness:
    an $h^(+)$-Cauchy sequence is $h$-Cauchy, and its $h$-limit is also its $h^(+)$-limit by local equivalence of
    smooth metrics. ◻
]

The new function $t^(+)$ may have either sign and need not be bounded below.
  Proposition 4 controls its square with a constant depending only on the dimension.
  The local enlargement must therefore use a pressure law that works for every real value of the drift parameter;
  this is the purpose of the next section.

== 4 A pressure law for a signed drift <sec:pressure>

The local metric enlargement will be obtained from a graph equation whose right-hand side depends on a height
  discrepancy and on the drift. We need this dependence to be increasing in the discrepancy,
  with poles that confine the graph height. We also need quantitative control of its drift derivative for every
  real value of the drift. The following construction adapts the pressure method of #cite(label("OpenAIWidth"))
  Theorem 2.1 to this signed parameter.

#thm([Proposition 4.1.])[
  (Signed pressure law).  #emph[For every $A_0 \, P_0 \, epsilon.alt \, b_0 > 0$,
    there are constants $S_0 in \( 0 \, 1 \]$, $T gt.eq 10$, and a smooth function
$ F : \( - S_0 \, S_0 \) times bb(R) arrow.r bb(R) $

 that is odd in its first variable and has the following properties. Set
#[#set math.equation(numbering: n => "(4.1)")
 $ N \( t \) = sqrt(t^2 + T^2) \, wide V \( t \) = N \( t \)^2 = t^2 + T^2 . $ <pressure:reserve>]

 At every $\( x \, t \) in \( - S_0 \, S_0 \) times bb(R)$,
#[#set math.equation(numbering: n => "(4.2)")
 $ F_x gt.eq A_0 N \( t \) \, wide \| F_t \| lt.eq epsilon.alt \| F \| \, wide F F_t lt.eq epsilon.alt F_x \,\
F_x lt.eq b_0 N \( t \)^2 quad upright("or") quad - F F_t gt.eq P_0 F_x \,\
F_x lt.eq b_0 N \( t \)^2 + epsilon.alt F^2 . $ <pressure:bounds>]

 Moreover, $F \( x \, t \) arrow.r + oo$ as $x arrow.t S_0$ and $F \( x \, t \) arrow.r - oo$ as $x arrow.b -
   S_0$, uniformly for $t$ in each compact subset of $bb(R)$.]
] <pressure:law>

In the local scalar-curvature comparison, the alternative permits a negative term proportional to $F_x$ to be
  controlled either by a small multiple of the reserve $V \( t \)$ or by a positive contribution from $- F F_t$.
  Where the graph is nearly horizontal, the comparison also contains a positive multiple of $F^2$.
  The last inequality lets us absorb the $epsilon.alt F^2$ part of the derivative loss into this positive term and
  reduce the remaining reserve loss by making the metric modification small there.

#proof[
  It is easier to prescribe the discrepancy $x = X \( f \, t \)$ as a function of a positive pressure value $f$,
    and then invert. Indeed, the implicit relation $X \( F \( x \, t \) \, t \) = x$ gives
  $ F_x = 1 / X_f \, wide frac(F F_t, F_x) = - f X_t . $
  Thus small positive $X_f$ gives a large height derivative, while the sign of $X_t$ controls the mixed term.
    We will arrange two regions: one where $F_x lt.eq b_0 N^2$, and one where $- F F_t gt.eq P_0 F_x$.
  ===== 4.1 Choosing the inverse form. <choosing-the-inverse-form.>
  Choose
  $ k gt.eq max { A_0 \, epsilon.alt^(- 1) \, pi \/ 2 } \, wide Y gt.eq 1 \, wide Y^(- 3) lt.eq frac(b_0, 12 k) . $
  For now let $T gt.eq 10$ be arbitrary. The simple candidate $F \( x \, t \) =
    N \( t \) tan \( k x \)$ has the desired poles. However, for fixed $t > 0$,
    its derivative $F_x \/ N \( t \)^2$ tends to infinity near a pole while $F F_t > 0$.
    It therefore satisfies neither part of the required alternative there.
    We will retain this candidate at small pressure values and change it at large ones to make $F_t < 0$ when $F > 0$.
  Given $f > 0$ and $t in bb(R)$, set
  $ q = f^(2 \/ 3) \, wide y = t / q \, wide z = T / q \, wide R = sqrt(y^2 + z^2) = frac(N \( t \), q) . $
  For fixed $t$, increasing $f$ moves $\( y \, z \)$ toward the origin along a ray; for fixed $f$,
    varying $t$ moves it horizontally. For a positive smooth function $G$ on $bb(R)^2$, to be chosen below,
    consider the inverse expression
  #[#set math.equation(numbering: n => "(4.3)")
   $ X \( f \, t \) = 1 / k arctan #h(-0.16667em) (frac(sqrt(q), G \( y \, z \))) \, wide S_0 =
     frac(pi, 2 k) lt.eq 1 . $ <pressure:inverse>]
  The identity $q^(3 \/ 2) = f$ ensures that, wherever $G = R$, we have $sqrt(q) \/ G = f \/ N \( t \)$,
    recovering the tangent candidate. Differentiating the inverse expression identifies the properties we need from $G$:
  #[#set math.equation(numbering: n => "(4.4)")
   $ A_G = G + 2 \( y G_y + z G_z \) \,\
f X_t = - frac(G_y, k \( 1 + G^2 \/ q \)) \, wide X_f = frac(A_G, 3 k q^2 \( 1 + G^2 \/ q \)) .
  $ <pressure:inverse-derivatives>]
  These identities follow by differentiating $q = f^(2 \/ 3)$, using $y_q = - y \/ q$, $z_q = -
    z \/ q$ for the second one. Thus $A_G > 0$ will make $X$ increasing in $f$,
    while $G_y < 0$ will give the favorable mixed sign. Taking $G =
    R$ outside a compact set recovers the tangent candidate at small $f$.
    The modification near the origin will control large $f$.
  ===== 4.2 Constructing the auxiliary function. <constructing-the-auxiliary-function.>
  We now construct $G$ on the whole $\( y \, z \)$-plane, with $R = sqrt(y^2 + z^2)$.
    It will equal $R$ outside a compact set and be strictly decreasing in $y$ on the disk $R lt.eq Y$. Define
  $ m \( y \) = D_G exp #scale(x: 120%, y: 120%)[\(] - arctan \( y \) \/ 8 #scale(x: 120%, y: 120%)[\)] \, $
  where $D_G > 0$ will be fixed shortly. Choose a nonnegative smooth probability density $𝜚$ with compact support
    in $\( 1 \, 2 \)$, and set
  #[#set math.equation(numbering: n => "(4.5)")
   $ G \( y \, z \) = integral_1^2 max { R \, lambda m \( y \) } 𝜚 \( lambda \) thin upright(d) lambda .
     $ <pressure:rounded-max>]
  To see that this averaging produces a smooth function, let
  $ Phi \( v \) = integral_1^2 max { v \, lambda } 𝜚 \( lambda \) thin upright(d) lambda . $
  Then $Phi'' = 𝜚$, with the density extended smoothly by zero, and $G = m Phi \( R \/ m \)$.
    This proves smoothness away from the origin. Near the origin every integrand in (4.5) equals $lambda m$,
    so $G$ is smooth there as well. Since $m$ is bounded above and below by positive constants, $G gt.eq R$,
    $G > 0$, and $G = R$ outside a compact set.
  The derivatives needed for inversion are
  #[#set math.equation(numbering: n => "(4.6)")
   $ G_y lt.eq 1 \, wide G / 2 lt.eq A_G lt.eq 3 G . $ <pressure:G-bounds>]
  Here $m' = - m \/ \( 8 \( 1 + y^2 \) \)$, so $\| y m' \| lt.eq m \/ 16$.
    On the radial branch $R$, the corresponding expressions are $R_y lt.eq 1$ and $R + 2 \( y R_y + z R_z \) =
    3 R$. On the other branch $lambda m$, the first derivative is nonpositive and
  $ 7 / 8 lambda m lt.eq lambda \( m + 2 y m' \) lt.eq 9 / 8 lambda m . $
  Averaging these branchwise inequalities gives (4.6); the equality set of the two branches has measure zero in
    $lambda$ at each point away from the origin.
  Let $c_𝜚 = integral_1^2 lambda 𝜚 \( lambda \) thin upright(d) lambda$, so $1 < c_𝜚 < 2$.
    Increase $D_G$ until, for $\| y \| lt.eq Y$,
  $ m \( y \) > Y \, wide m \( y \) gt.eq 16 k P_0 \( 1 + Y^2 \) . $
  On the disk $R lt.eq Y$, we then have $G = c_𝜚 m$ and
  #[#set math.equation(numbering: n => "(4.7)")
   $ G_y = - frac(c_𝜚 m, 8 \( 1 + y^2 \)) lt.eq - 2 k P_0 . $ <pressure:G-inner>]
  The function $G$, as well as $k$ and $Y$, depends only on the four given constants and not on $T$.
  ===== 4.3 Inversion and the basic bounds. <inversion-and-the-basic-bounds.>
  For every $T gt.eq 10$, the function $G$ just constructed gives $X_f > 0$ by (4.4) and (4.6).
    For fixed $t$, as $f arrow.b 0$ we eventually have $G = R = N \( t \) \/ q$, and hence
  #[#set math.equation(numbering: n => "(4.8)")
   $ X \( f \, t \) = 1 / k arctan #h(-0.16667em) (frac(f, N \( t \))) . $ <pressure:near-zero>]
  As $f arrow.r oo$, the point $\( y \, z \)$ tends to the origin and $sqrt(q) \/ G \( y \, z \) arrow.r oo$.
    Therefore $X \( dot.op \, t \)$ increases smoothly from $0$ to $S_0$.
    The implicit-function theorem and $X_f > 0$ give a jointly smooth inverse $F \( x \, t \) > 0$ for $0 < x <
    S_0$. Formula (4.8) holds uniformly for $t$ in compact ranges; its inverse is $F \( x \, t \) =
    N \( t \) tan \( k x \)$ near $x = 0$. We may thus extend $F$ smoothly by oddness across $x = 0$.
  For completeness, the pole assertion is also uniform in the parameter.
    Given a compact set $K subset bb(R)$ and $f_0 > 0$, continuity gives $max_(t in K) X \( f_0 \, t \) < S_0$.
    For $x$ above this maximum, monotonicity implies $F \( x \, t \) > f_0$ for every $t in K$.
    Oddness gives the assertion at the other endpoint.
  It remains to choose $T$ so that this smooth inverse satisfies all the quantitative bounds.
    At $x > 0$, with $f = F \( x \, t \)$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ frac(F F_t, F_x) = - f X_t \, wide F_t / F = frac(3 G_y, q A_G) . $ <pressure:implicit-derivatives>]
  By (4.6) and $R lt.eq G$,
  $ N \( t \) X_f = frac(R A_G, 3 k \( q + G^2 \)) lt.eq 1 / k \, wide - f X_t lt.eq 1 / k . $
  Thus $F_x gt.eq A_0 N \( t \)$ and $F F_t lt.eq epsilon.alt F_x$. The finite constant
  $ C_G = sup_(\( y \, z \) in bb(R)^2) frac(R \| G_y \|, A_G) $
  controls the remaining drift derivative: it is finite on compact sets by positivity of $A_G$,
    and outside a compact set we have $G = R$ and $A_G = 3 R$. Consequently,
  #[#set math.equation(numbering: n => "(4.10)")
   $ lr(|F_t / F|) lt.eq frac(3 C_G, N \( t \)) lt.eq frac(3 C_G, T) . $ <pressure:t-derivative>]
  ===== 4.4 The two regions and the final choice of $T$. <the-two-regions-and-the-final-choice-of-t.>
  For $R > Y$, let $B = sup_(R > Y) G \/ R < oo$. Since $q = N \( t \) \/ R gt.eq T \/ R$, (4.4) gives
  $ N \( t \)^2 X_f = frac(R^2 A_G, 3 k \( 1 + G^2 \/ q \)) gt.eq frac(R^3, 6 k \( 1 + B^2 R^3 \/ T \)) . $
  In particular,
  #[#set math.equation(numbering: n => "(4.11)")
   $ frac(F_x, N \( t \)^2) lt.eq 6 k (R^(- 3) + B^2 / T) lt.eq 6 k (Y^(- 3) + B^2 / T) . $ <pressure:outer-bound>]
  This will be at most $b_0$.
  The disk $R lt.eq Y$ corresponds to $f gt.eq \( N \( t \) \/ Y \)^(3 \/ 2)$, the large-pressure region. Set
  $ M_G = max_(R lt.eq Y) G \, wide a_G = min_(R lt.eq Y) A_G > 0 . $
  Here $q gt.eq T \/ Y$, so choosing $T gt.eq Y M_G^2$ ensures $G^2 \/ q lt.eq 1$. Combining this with (4.7) yields
  $ f X_t gt.eq P_0 \, wide f^2 X_f = frac(q A_G, 3 k \( 1 + G^2 \/ q \)) gt.eq frac(T a_G, 6 k Y) . $
  The first inequality is exactly $- F F_t gt.eq P_0 F_x$; the second will give $F_x lt.eq epsilon.alt F^2$.
  All constants in these conditions were fixed before $T$. We now choose
  #[#set math.equation(numbering: n => "(4.12)")
   $ T gt.eq max {10 \, frac(3 C_G, epsilon.alt) \, frac(12 k B^2, b_0) \, med Y M_G^2 \,
     frac(6 k Y, epsilon.alt a_G)} . $ <pressure:T-choice>]
  Then (4.10) proves $\| F_t \| lt.eq epsilon.alt \| F \|$, and (4.11), together with the choice of $Y$,
    proves $F_x lt.eq b_0 N \( t \)^2$ when $R > Y$. On $R lt.eq Y$, we have both $- F F_t gt.eq
    P_0 F_x$ and $F_x lt.eq epsilon.alt F^2$. These are precisely the asserted alternative,
    and in either region they also imply the last inequality in (4.2).
    Finally, under $x mapsto - x$, both $F$ and $F_t$ change sign while $F_x$ does not.
    All the bounds therefore hold for negative $x$, and continuity gives them at zero.
    No step restricted the sign of $t$. ◻
]

== 5 Local stretching with a signed drift <sec:stretching>

We now enlarge the distance between two closed sets while retaining the quadratic reserve constructed in
  Proposition 4. The enlargement must have compact support:
  this will allow infinitely many applications on a noncompact manifold.
  We adapt the local graph construction of #cite(label("OpenAIWidth")) Theorem 3.1,
  using Proposition 8 to allow the drift to take either sign.

The loss in the following statement has two parts. One is charged to a decrease of a metric trace;
  these trace decreases telescope in the iteration. The other can be chosen arbitrarily small.
  We write $a_(+) = max { a \, 0 }$ for the positive part of a real number.

#thm([Lemma 5.1.])[
  (Local stretching).  #emph[Let $n gt.eq 4$ and $0 < delta < 1 \/ 10$.
    There are constants $W gt.eq 1$ and $T gt.eq 10$, depending only on $n \, delta$, with the following property.
    Let $M$ be a connected smooth $n$-manifold without boundary, let $h_0$ be a complete smooth metric on $M$,
    let $h gt.eq h_0$ be a smooth metric, and let $t in C^oo \( M \, bb(R) \)$.
    Suppose that $A subset M$ is nonempty and compact, that $B subset M$ is nonempty and closed,
    and that $"dist"_(h_0) \( A \, B \) gt.eq W$. Put
$ V \( t \) = t^2 + T^2 \, wide L_(*) = 1.004 . $

 For every $0 < d < delta$, there exist a smooth complete metric $h' gt.eq h$ and a smooth function $t' gt.eq t$,
   whose changes from $h \, t$ have compact support in ${ x : "dist"_(h_0) \( A \, x \) < W }$, such that
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(D) \( h' \, t' \) gt.eq  & cal(D) \( h \, t \) + \( V \( t' \) - V \( t \) \)_(+)\
 & - delta #scale(x: 120%, y: 120%)[\(] "tr"_h h_0 - "tr"_(h') h_0 #scale(x: 120%, y: 120%)[\)] V \( t' \) -
   d V \( t' \) \,\
"dist"_(h') \( A \, B \) gt.eq  & L_(*) W . $ <stretch:conclusion>]

]
] <stretch:local>

The proof constructs a graph that follows a large height function near $A$ and becomes small before leaving its
  $W$-neighborhood. At appreciable slope, the graph metric increases lengths.
  At small slope, a modified graph metric makes the curvature error arbitrarily small.
  After solving the graph equation on a compact extension, we estimate its scalar curvature and then cut off the change.

=== 5.1 Slope modification and spatial cutoffs <stretch:setup>

Fix the constants

#[#set math.equation(numbering: n => "(5.2)")
 $ s_0 = 1 / 100 \, wide A_0 = 1000 \, wide P_0 = 20 \, wide C_(*) = s_0^(- 1) \,\
b_0 = frac(delta s_0^2, 2000) \, wide epsilon.alt = min {s_0 / 100 \, frac(1, 8 n) \,
  frac(1, 8 C_(*))} . $ <stretch:constants>]

Apply Proposition 8 with these parameters, obtaining $S_0 \, T \, F$.
  Throughout this section, $N \( t \) = sqrt(t^2 + T^2)$ and $V \( t \) = N \( t \)^2$.
  We may take $W$ to be a numerical constant at least $10^5$;
  this size allows the cutoffs below and the final length comparison.

Let $0 < a lt.eq 1 \/ 2$. This parameter will be fixed small enough in terms of the prescribed loss $d$.
  Choose a smooth nondecreasing function $sigma : \[ 0 \, oo \)
  arrow.r \[ 0 \, 1 \]$ that is zero on $\[ 0 \, s_0 \]$, one on $\[ 5 s_0 \, oo \)$, and satisfies $0 lt.eq
  sigma' lt.eq 60$. For $s gt.eq 0$ set

#[#set math.equation(numbering: n => "(5.3)")
 $ mu = a^2 + \( 1 - a^2 \) sigma \( s \) \, wide theta = frac(mu s^2, 1 + s^2) \, wide l = sqrt(1 - theta) \,
   quad beta = log l \, quad k_1 = sqrt(theta) . $ <stretch:slope-functions>]

Thus the graph modification of Lemma 7 is the ordinary graph metric when $s gt.eq 5 s_0$,
  whereas its size is reduced by $a^2$ near zero slope. For the graph equation, we use the multiplier

$ j \( s \) = sqrt(theta + a^2 s_0^2) . $

It is smooth as a function of the gradient covector, and $j \( 0 \) = a s_0 > 0$.
  This keeps the derivative of the pressure with respect to height positive at critical points of the graph.
  The same multiplier will also make the small-slope curvature error proportional to $a^2$.

We next arrange the spatial support. Write $r_A \( x \) = "dist"_(h_0) \( A \, x \)$.
  Choose smooth compactly supported functions $psi gt.eq 0$ and $eta_1 \, zeta in \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(5.4)")
 $ inf_A psi > W \/ 5 \, wide \| upright(d) psi \|_(h_0) lt.eq 1 \, wide "supp" psi subset { r_A < W \/ 2 } \,\
eta_1 = 1 upright(" on ") { r_A lt.eq .55 W } \, wide eta_1 = 0 upright(" on ") { r_A gt.eq .8 W } \,
  wide \| upright(d) eta_1 \|_(h_0) lt.eq s_0 \/ 8 \,\
zeta = 1 upright(" on ") { r_A lt.eq .82 W } \, wide zeta = 0 upright(" on ") { r_A gt.eq .98 W } . $ <stretch:cutoffs>]

These cutoffs require only completeness of $h_0$. Indeed,
  finite-radius closed neighborhoods of the compact set $A$ are compact.
  Start with Lipschitz functions of $r_A$, leaving positive buffers around each specified constant region.
  In particular, smooth $\( W \/ 3 - r_A \)_(+)$ with value error less than $W \/ 100$ and gradient bound $1.05$,
  then divide by $1.05$ to obtain $psi$. The profile for $eta_1$ can be smoothed with gradient at most $12 \/ W
  lt.eq s_0 \/ 8$. To carry out the smoothing, use convolutions in sufficiently small charts on the compact
  neighborhood, where metric distortion is as small as desired, and a partition of unity.
  Choose the local approximation errors small enough to control the partition derivatives.
  Nonnegative kernels preserve the range, and the buffers preserve the stated constant regions.
  The same procedure supplies $zeta$.

For $0 < rho lt.eq 1 \/ 2$, put

#[#set math.equation(numbering: n => "(5.5)")
 $ eta = eta_rho = rho + \( 1 - rho \) eta_1^2 . $ <stretch:eta>]

Thus $eta = 1$ near $"supp" psi$, while $eta = rho$ outside ${ r_A < .8 W }$. Moreover, since $h gt.eq h_0$,

#[#set math.equation(numbering: n => "(5.6)")
 $ \| upright(d) eta \|_h lt.eq s_0 \/ 4 \, wide frac(\| upright(d) eta \|_h^2, eta) lt.eq 1 . $ <stretch:eta-bounds>]

The square in (5.5) gives the second estimate uniformly as $rho arrow.b 0$.
  For each $rho$ we will construct a smooth graph height $u_rho$ close to $psi$.
  The arrangement in Figure 1 leaves a region where the graph tends to zero before the final cutoff $zeta$ begins
  to vary.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((6.86, -0.32), (10.78, 2.04), fill: rgb("#f4f4f4"), stroke: none)
  line((3.92, -0.44), (3.92, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((4.9, -0.44), (4.9, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((6.86, -0.44), (6.86, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((7.84, -0.44), (7.84, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((9.8, -0.44), (9.8, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((10.78, -0.44), (10.78, 2), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  rect((0, 1.44), (3.724, 1.88), fill: rgb("#ffe3c7"), stroke: none)
  rect((0, 1.44), (3.724, 1.88), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.862, 1.66), [#text(size: 9pt)[$"supp" psi$]])
  content((-0.245, 1.66), [#text(size: 9pt)[target support]], anchor: "east", padding: 0.1176cm)
  rect((0, 0.64), (4.9, 1.08), fill: rgb("#d9d9ff"), stroke: none)
  rect((4.9, 0.64), (6.86, 1.08), fill: black, stroke: none)
  rect((0, 0.64), (6.86, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.9, 0.64), (4.9, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.45, 0.86), [#text(size: 9pt)[$eta_1=1$]])
  content((8.82, 0.86), [#text(size: 9pt)[$eta_1=0, eta = rho$]])
  rect((0, -0.16), (7.84, 0.28), fill: rgb("#d9d9ff"), stroke: none)
  rect((7.84, -0.16), (9.8, 0.28), fill: black, stroke: none)
  rect((0, -0.16), (9.8, 0.28), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.84, -0.16), (7.84, 0.28), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.92, 0.06), [#text(size: 9pt)[$zeta =1$]])
  content((-0.245, 0.06), [#text(size: 9pt)[final cutoff]], anchor: "east", padding: 0.1176cm)
  line((0, -0.52), (11.37, -0.52), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.48), (0, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.576), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((3.92, -0.48), (3.92, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.92, -0.576), [#text(size: 9pt)[$.50$]], anchor: "north", padding: 0.1176cm)
  line((4.9, -0.48), (4.9, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.9, -0.576), [#text(size: 9pt)[$.55$]], anchor: "north", padding: 0.1176cm)
  line((6.86, -0.48), (6.86, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.86, -0.576), [#text(size: 9pt)[$.80$]], anchor: "north", padding: 0.1176cm)
  line((7.84, -0.48), (7.84, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.84, -0.576), [#text(size: 9pt)[$.82$]], anchor: "north", padding: 0.1176cm)
  line((9.8, -0.48), (9.8, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.8, -0.576), [#text(size: 9pt)[$.98$]], anchor: "north", padding: 0.1176cm)
  line((10.78, -0.48), (10.78, -0.576), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.78, -0.576), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((11.42, -0.52), [#text(size: 9pt)[$r_A"/"W$]], anchor: "west", padding: 0.1176cm)
  line((6.86, 2.24), (10.78, 2.24), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((8.82, 2.24), [#text(size: 9pt)[$u_ rho arrow.r.long 0$ locally]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The spatial cutoffs, with $eta = rho + \( 1 - rho \) eta_1^2$. The first bar shows the containment $"supp" psi subset { r_A < W \/ 2 }$; hatching indicates where a cutoff may vary. The graph heights $u_rho$ constructed below tend to zero in $C^3$ locally outside ${ r_A lt.eq .8 W }$ as $rho arrow.b 0$, leaving room for the final metric and drift cutoff. Spacing is schematic; endpoints are exact multiples of $W$. ],
) <stretch:figure>

=== 5.2 Solving the graph equation and obtaining locality <stretch:equation>

Work for the moment on a closed auxiliary manifold extending a neighborhood of ${ r_A lt.eq 1.1 W }$.
  If $M$ is compact, use $M$ itself. Otherwise, enclose this compact neighborhood in a relatively compact smooth
  domain, modify the data to product form near its boundary, and double.
  Extend $h \, t$ smoothly and the compactly supported cutoffs by zero.
  Define $eta$ from the extended $eta_1$ as above. This auxiliary manifold is fixed as $rho$ tends to zero;
  all geometric constants in this subsection may depend on it.

For $0 lt.eq lambda lt.eq 1$, consider the equation

#[#set math.equation(numbering: n => "(5.7)")
 $ "div"_(h \, t) cal(A) \( upright(d) u \) = j \( s \) F (frac(u - lambda psi, eta) \, t) \,\
cal(A) \( upright(d) u \) = sqrt(mu) / sqrt(1 + s^2) nabla_h u \, wide j \( s \) = sqrt(theta + a^2 s_0^2) \, wide
  s = \| upright(d) u \|_h . $ <stretch:pde>]

We solve it within the open domain $\| u - lambda psi \| \/ eta < S_0$.
  Both $cal(A)$ and $j$ are smooth functions of the covector $upright(d) u$, including at zero.
  The flux derivative has tangential and radial eigenvalues $k_1 \/ s$ and $\( k_1 \)_s$, respectively;
  both are positive for $s > 0$ and tend to $a$ at zero.

We first obtain estimates for every smooth solution in this domain.
  There is $S_1 < S_0$, independent of $rho \, lambda$, such that

#[#set math.equation(numbering: n => "(5.8)")
 $ \| u - lambda psi \| lt.eq S_1 eta . $ <stretch:height>]

To see this, compare with $lambda psi plus.minus S eta$ for $S < S_0$.
  Their first two derivatives are uniformly bounded as $S arrow.t S_0$, whereas $j gt.eq
  a s_0$ and the poles of $F$ are uniform on the compact range of $t$.
  For $S$ sufficiently close to $S_0$, these functions are strict upper and lower barriers.
  At a positive maximum of a violation, the gradients agree, ellipticity orders the second derivatives,
  and $F_x > 0$ orders the right sides, a contradiction. The same fixed $S$ therefore works for all $rho \, lambda$.

There is also a gradient bound independent of $rho \, lambda$.
  At a point of maximum slope, there is nothing to prove if $s < 1$.
  Otherwise $mu = 1$ in a neighborhood, and (5.7) is the ordinary graph equation of Lemma 5, with

$ p \( x \, z \, omega \) = sqrt(1 - omega^2 + a^2 s_0^2) thin F
  (frac(z - lambda psi \( x \), eta \( x \)) \, t \( x \)) \, wide omega = \( 1 + s^2 \)^(- 1 \/ 2) . $

By (5.8), the values of $F \, F_t \, F_x$ range in a compact set uniformly in $rho \, lambda$.
  Holding $omega$ fixed and writing $xi = \( u - lambda psi \) \/ eta$, we have on the graph

$ partial_nu (frac(z - lambda psi, eta)) =
  frac(nu_z - lambda thin upright(d) psi \( nu_h \) - xi thin upright(d) eta \( nu_h \), eta) . $

Thus the zeroth order coefficient of the angle operator is bounded below by $- C \/ eta$,
  after discarding the nonnegative term $\| upright("II") \|^2$. Here $C$ is independent of $rho \, lambda$.
  On the other hand,

$ p_z = frac(j F_x, eta) gt.eq frac(A_0 T, sqrt(2) thin eta) $

at the point under consideration. At this minimum of $omega$, the angle equation gives

$ - p_z = cal(L) omega gt.eq - C / eta omega . $

It follows that $omega$ is uniformly bounded below, as required.

For each fixed $rho > 0$, these estimates confine the solutions to compact jet ranges strictly inside the domain
  of the equation. The elliptic estimates described in Section 3.1 give all higher bounds.
  The linearization of the left side minus the right side has zeroth order coefficient $- j F_x \/ eta < 0$,
  so it is invertible on the closed manifold by the maximum principle and linear elliptic theory.
  The method of continuity therefore applies from the solution $u = 0$ at $lambda = 0$ to $lambda = 1$.
  Write $u_rho$ for the resulting smooth solution. The higher estimates used for this continuation may depend on
  $rho$; the height and gradient estimates do not.

The graph equation has now produced a height close to $psi$.
  Its next property is what permits a compactly supported change of metric:

#[#set math.equation(numbering: n => "(5.9)")
 $ u_rho arrow.r 0 quad upright("in ") C^3 upright(" on compact subsets of any open region where ") psi = eta_1 =
   0 . $ <stretch:locality>]

In such a region $eta = rho$. Expanding (5.7) in a coordinate chart gives

#[#set math.equation(numbering: n => "(5.10)")
 $ a^(i j) partial_i partial_j u_rho + b^i partial_i u_rho - c_rho / rho u_rho = 0 \, wide c_rho =
   j integral_0^1 F_x \( q u_rho \/ rho \, t \) thin upright(d) q . $ <stretch:reaction>]

The previously established gradient bound makes $\( a^(i j) \)$ uniformly elliptic and bounded and makes $b^i$
  bounded. The first order terms have this form because the flux vanishes at zero covector.
  By (5.8) and Proposition 8, $c_rho$ is bounded above and below by positive constants, independently of $rho$.

On a coordinate box with closure in this region, let $ell_f$ be the inward affine distance from its face $f$.
  For sufficiently small fixed $gamma > 0$, the function

$ C sum_f exp \( - gamma ell_f \/ sqrt(rho) \) $

is a supersolution of the operator in (5.10), for all small $rho$.
  Indeed, its second derivative terms are bounded by a constant times $gamma^2 \/ rho$,
  its first derivative terms by a constant times $gamma \/ sqrt(rho)$,
  and its negative zeroth order term dominates both. Choose $C$ to dominate the uniform height bound on the faces
  and compare with $u_rho$ and $- u_rho$. This proves exponential decay of the height on every interior subbox.

To turn this into derivative decay, rescale around an interior point by $x = x_0 + rho y$ and $u_rho \( x \) =
  rho v \( y \)$. The equation takes the divergence form

$ partial_(y_i) frak(A)^i \( x_0 + rho y \, D v \) = rho thin frak(B) \( x_0 + rho y \, v \, D v \) . $

Here $\| v \| lt.eq S_1$ by (5.8), while $D v = D u_rho$ is uniformly bounded.
  All coefficient derivatives on these ranges are uniformly bounded, and ellipticity is uniform.
  The interior estimates from Section 3.1 give bounded derivatives of $v$ of every order on smaller fixed balls.
  Returning to the original coordinates yields bounds $C_j rho^(1 - j)$ for derivatives of order $j$.
  For fixed nested subboxes $K subset "int" K'$, interior interpolation gives

$ parallel u_rho parallel_(C^3 \( K \)) lt.eq C parallel u_rho parallel_(C^0 \( K' \))^(1 \/ 4) parallel u_rho
  parallel_(C^4 \( K' \))^(3 \/ 4) + C parallel u_rho parallel_(C^0 \( K' \)) . $

The $C^4$ norm is at most $C rho^(- 3)$, while the $C^0$ norm decays exponentially in $1 \/ sqrt(rho)$.
  The right side tends to zero, proving (5.9).

=== 5.3 Curvature balance <stretch:curvature>

For the slope functions (5.3),

$ 0 lt.eq - s beta_s lt.eq 2 . $

Indeed, $- s beta_s = s theta_s \/ \[ 2 \( 1 - theta \) \]$;
  on the switching interval use $s lt.eq .05$ and $sigma' lt.eq 60$, and outside it the formula is immediate.
  Thus Lemma 7 applies to $u = u_rho$. Denote its output by

#[#set math.equation(numbering: n => "(5.11)")
 $ h_u = h + frac(theta, \( 1 - theta \) s^2) thin upright(d) u^2 \, wide t_u = t - beta . $ <stretch:raw-data>]

Here $upright(d) u^2$ denotes $upright(d) u ⊗ upright(d) u$. These expressions are smooth across $s = 0$:
  the coefficient of $upright(d) u^2$ extends as $mu \/ \[ 1 + \( 1 - mu \) s^2 \]$.
  All comparisons with $h_0$ below take place in the original neighborhood of $A$; no extension of $h_0$ is needed.

On ${ s > 0 }$, put $e = nabla_h u \/ s$ and $b = sqrt(h_0 \( e \, e \)) lt.eq 1$.
  The rank-one inverse metric formula gives

#[#set math.equation(numbering: n => "(5.12)")
 $ "tr"_h h_0 - "tr"_(h_u) h_0 = theta b^2 . $ <stretch:trace>]

Use $J \, H \, K \, M_1$ as in Lemma 7: $J$ is the second fundamental form of the levels of $u$, $H = "tr" J$,
  $K = - e log k_1$, and $M_1 = H - e t - K$. In particular,

$ cal(D) \( h_u \, t_u \) - cal(D) \( h \, t \) gt.eq theta E \, wide E = \| J \|^2 + M_1^2 + K^2 \/ l^2 -
  2 M_1 K + 2 e M_1 . $

Increasing the drift by $- beta$ has a controlled effect on the reserve:

#[#set math.equation(numbering: n => "(5.13)")
 $ frac(\( V \( t - beta \) - V \( t \) \)_(+), theta) lt.eq 4 \( 1 + s \) N \( t \) \, wide
   s > 0 . $ <stretch:reserve-increment>]

Indeed, if $b_(*) = - beta gt.eq 0$, the numerator is at most $2 N \( t \) b_(*) + b_(*)^2$.
  When $theta lt.eq 1 \/ 2$ one has $b_(*) lt.eq theta$. When $theta > 1 \/ 2$, one has $s > 1$ and $b_(*) lt.eq
  1 / 2 log \( 1 + s^2 \) lt.eq sqrt(s)$; these inequalities give (5.13).

Together with (5.12), this identifies the estimate needed at slopes $s gt.eq s_0$:
  it suffices to prove $E gt.eq 4 \( 1 + s \) N \( t \) - delta b^2 V \( t_u \)$.
  Below $s_0$, we will instead use the adjustable small error in Lemma 9.

To express the graph equation in the normal variables, put, for $s > 0$,

#[#set math.equation(numbering: n => "(5.14)")
 $ chi = j / k_1 = sqrt(1 + frac(a^2 s_0^2, theta)) \, wide m_1 = frac(upright(d) log chi, upright(d) log k_1) = -
   frac(a^2 s_0^2, theta + a^2 s_0^2) . $ <stretch:chi>]

The factor $chi$ normalizes the pressure after division by $k_1$, and $m_1$ records its derivative.
  Directly from these formulas,

#[#set math.equation(numbering: n => "(5.15)")
 $ - 1 lt.eq m_1 lt.eq 0 \, wide 1 lt.eq chi lt.eq 2 quad \( s gt.eq s_0 \) \,\
m_1 lt.eq - 1 / 2 \, wide chi gt.eq s_0 \/ s \, wide theta chi^2 lt.eq
  2 a^2 s_0^2 quad \( 0 < s lt.eq s_0 \) . $ <stretch:slope-bounds>]

For $s lt.eq s_0$, substitute $theta = a^2 s^2 \/ \( 1 + s^2 \)$; for $s gt.eq s_0$, use $theta gt.eq
  a^2 s^2 \/ \( 1 + s^2 \)$ to bound $chi$.

Equation (5.7) at $lambda = 1$ says $M_1 = chi F$, with $F$ evaluated at $\( xi \, t \)$ and
  $xi = \( u - psi \) \/ eta$. Since $e log chi = - m_1 K$ and $e t = H - M_1 - K$, differentiation gives

$ e M_1 = - m_1 K M_1 + chi #scale(x: 120%, y: 120%)[\(] F_t \( H - M_1 - K \) +
  F_x e xi #scale(x: 120%, y: 120%)[\)] . $

Completing the $H$- and $K$-squares now yields

#[#set math.equation(numbering: n => "(5.16)")
 $ E & gt.eq chi^2 cal(C) + 2 chi F_x e xi \,\
cal(C) & = \[ 1 - l^2 \( 1 + m_1 \)^2 \] F^2 - 2 \[ 1 + l^2 \( 1 + m_1 \) \] F F_t -
  n F_t^2 . $ <stretch:square-estimate>]

For clarity, the discarded quantity is exactly

$ \| J \|^2 - frac(H^2, n - 1) + frac(\( H + \( n - 1 \) chi F_t \)^2, n - 1) +
  (K / l - l chi \( \( 1 + m_1 \) F + F_t \))^2 + theta chi^2 F_t^2 \, $

which is nonnegative. The choice of $j$ now has two useful effects.
  At small slope, $m_1 lt.eq - 1 \/ 2$ leaves the coefficient of $F^2$ at least $3 \/ 4$, while $theta chi^2 =
  O \( a^2 \)$ makes its eventual error small. At larger slope,
  the two alternatives in the pressure law supply the balance:
  a large value of $F_x$ is accompanied by a favorable term $- F F_t$.

===== 5.3.1 Slopes at least $s_0$. <slopes-at-least-s_0.>

The pressure bounds imply $F_t^2 lt.eq epsilon.alt \| F F_t \|$.
  Since $n epsilon.alt lt.eq 1 \/ 8$ and $0 lt.eq 1 + m_1 lt.eq 1$, they give

#[#set math.equation(numbering: n => "(5.17)")
 $ cal(C) gt.eq - 5 epsilon.alt F_x \, wide - F F_t gt.eq P_0 F_x med arrow.r.double med cal(C) gt.eq
   P_0 F_x . $ <stretch:large-C>]

Indeed, if $F F_t gt.eq 0$, its coefficient has absolute value at most $4$; if $F F_t < 0$,
  that coefficient contributes at least $2 \| F F_t \|$, whereas the last term costs at most $n epsilon.alt \| F
  F_t \|$.

If $eta eq.not 1$, then $psi = 0$ in a neighborhood, so

$ e xi = frac(s - xi e eta, eta) gt.eq frac(3 s, 4 eta) \, $

using $\| xi \| lt.eq S_1 < 1$, (5.6), and $s gt.eq s_0$.
  Equations (5.16)–(5.17) therefore give $E gt.eq \( 3 s \/ 2 - 20 epsilon.alt \) F_x gt.eq s F_x$.
  If $eta = 1$, then $upright(d) eta = 0$ and $e xi gt.eq s - b$ by $\| upright(d) psi \|_(h_0) lt.eq 1$.
  For $s > 8 b$ the same estimates give $E gt.eq \( 7 s \/ 4 - 20 epsilon.alt \) F_x gt.eq s F_x$.

It remains to consider $s_0 lt.eq s lt.eq 8 b$ with $eta = 1$.
  Here $2 chi \( s - b \) - s gt.eq - 4$, so $E gt.eq s F_x - 10 F_x$.
  On the pressure alternative $- F F_t gt.eq P_0 F_x$, the positive term $chi^2 P_0
  F_x$ more than pays this loss and gives $E gt.eq s F_x$. Otherwise $F_x lt.eq b_0 N \( t \)^2$,
  and the deficit is at most $10 b_0 N \( t \)^2$. Since $s lt.eq 8$, we have $0 lt.eq - beta < 3$, and $T gt.eq
  10$ implies

$ N \( t \)^2 lt.eq 2 V \( t_u \) . $

This comparison is valid for signed $t$: for $0 lt.eq c < 3$, $2 V \( t + c \) - V \( t \) = \( t + 2 c \)^2 +
  T^2 - 2 c^2 > 0$. Moreover, $b gt.eq s_0 \/ 8$, and hence

$ 10 b_0 N \( t \)^2 lt.eq 20 b_0 V \( t_u \) = frac(delta s_0^2, 100) V \( t_u \) lt.eq delta b^2 V \( t_u \) . $

We have proved throughout ${ s gt.eq s_0 }$ that

#[#set math.equation(numbering: n => "(5.18)")
 $ E gt.eq s F_x - delta b^2 V \( t_u \) gt.eq 4 \( 1 + s \) N \( t \) - delta b^2 V \( t_u \) \,
   $ <stretch:large-slope>]

where the last inequality uses $F_x gt.eq 1000 N \( t \)$ and $s gt.eq .01$.
  Together with (5.13) and (5.12), this proves the required curvature inequality without the small loss $d$ on
  this slope range.

===== 5.3.2 Slopes below $s_0$. <slopes-below-s_0.>

Here $1 + m_1 lt.eq 1 \/ 2$. The pressure estimate $\| F_t \| lt.eq epsilon.alt \| F \|$ therefore gives

$ cal(C) gt.eq \( 3 \/ 4 - 3 epsilon.alt - n epsilon.alt^2 \) F^2 gt.eq F^2 \/ 2 . $

When $eta = 1$, we have $e xi \/ chi gt.eq - 1$. When $eta eq.not 1$ and $e xi < 0$,
  we have $s lt.eq \| upright(d) eta \|_h$ and, by (5.15) and (5.6),

$ frac(\| e xi \|, chi) lt.eq frac(\| upright(d) eta \|_h s, s_0 eta) lt.eq
  frac(\| upright(d) eta \|_h^2, s_0 eta) lt.eq C_(*) . $

Using the last bound in Proposition 8, we conclude that

$ E & gt.eq chi^2 #scale(x: 120%, y: 120%)[\[] \( 1 \/ 2 - 2 C_(*) epsilon.alt \) F^2 -
  2 C_(*) b_0 V \( t \) #scale(x: 120%, y: 120%)[\]]\
 & gt.eq - C_2 chi^2 V \( t \) \, wide C_2 = 2 C_(*) b_0 . $

The small metric modification now pays for this error. Namely, $theta chi^2 lt.eq 2 a^2 s_0^2$ and $b_(*) = -
  beta lt.eq theta lt.eq a^2 s_0^2$, so

$ \( V \( t_u \) - V \( t \) \)_(+) lt.eq 3 a^2 V \( t \) \, wide V \( t \) lt.eq 2 V \( t_u \) . $

Fix $a in \( 0 \, 1 \/ 2 \]$ small enough that

#[#set math.equation(numbering: n => "(5.19)")
 $ \( 2 C_2 + 3 \) a^2 lt.eq d \/ 4 . $ <stretch:a-choice>]

Then the scalar error and the increase in reserve together cost at most $\( d \/ 2 \) V \( t_u \)$.
  This choice is made before taking $rho$ small in the locality argument.

Combining the two slope ranges gives

#[#set math.equation(numbering: n => "(5.20)")
 $ cal(D) \( h_u \, t_u \) gt.eq  & cal(D) \( h \, t \) + \( V \( t_u \) - V \( t \) \)_(+)\
 & - delta \( "tr"_h h_0 - "tr"_(h_u) h_0 \) V \( t_u \) - \( d \/ 2 \) V \( t_u \) . $ <stretch:raw-estimate>]

The inequality extends to boundary points of ${ s > 0 }$ by smoothness.
  On the interior of ${ s = 0 }$ the metric and drift are unchanged, so it holds there as well.
  We have thus retained the full positive increase of the reserve,
  apart from the trace loss and half the prescribed small error. The remaining half will absorb the final cutoff.

=== 5.4 Compact support and distance gain <stretch:finish>

Define the actual output on the original manifold by

#[#set math.equation(numbering: n => "(5.21)")
 $ h' = h + zeta \( h_u - h \) \, wide t' = t + zeta \( t_u - t \) \, $ <stretch:output>]

extending the increments by zero. The resulting data are smooth and satisfy $h' gt.eq h$ and $t' gt.eq t$;
  their changes from $h \, t$ have compact support in ${ r_A < W }$.
  On the compact annulus ${ .81 W lt.eq r_A lt.eq .99 W }$, which contains every point where $0 < zeta < 1$,
  (5.9) gives $C^3$ convergence $u_rho arrow.r 0$. Consequently both the uncut and cut metric and drift increments
  tend to zero in $C^2$ there.

To verify the inequality after cutoff without assuming any monotonicity of $V$, consider its residual

$ cal(R) \( hat(h) \, hat(t) \) =  & cal(D) \( hat(h) \, hat(t) \) -
  cal(D) \( h \, t \) - \( V \( hat(t) \) - V \( t \) \)_(+)\
 & + delta \( "tr"_h h_0 - "tr"_(hat(h)) h_0 \) V \( hat(t) \) + d V \( hat(t) \) . $

By (5.20), $cal(R) \( h_u \, t_u \) gt.eq \( d \/ 2 \) V \( t_u \) gt.eq d T^2 \/ 2$.
  The residual is continuous in the indicated $C^2$ data, including the positive-part term.
  Thus $cal(R) \( h' \, t' \) - cal(R) \( h_u \, t_u \) arrow.r 0$ uniformly on the annulus.
  For sufficiently small $rho$, (5.1) follows there. Outside this annulus, $zeta$ is locally constant,
  with value one or zero. The data then agree locally with $h_u \, t_u$, where (5.20) applies,
  or with the original $h \, t$. Completeness follows from $h' gt.eq h_0$.

It remains to quantify the distance gained. Use the effective height $zeta u_rho$, extended by zero.
  By (5.8) and (5.4), it exceeds $W \/ 5 - 1$ on $A$ and vanishes on $B$.
  Decrease $rho$ further so that $\| upright(d) \( zeta u_rho \) \|_h lt.eq .01$ throughout the cutoff transition.
  Suppose a piecewise smooth curve from $A$ to $B$ had $h'$-length at most $L_(*) W$.
  Its $h$-length is also at most $L_(*) W$, and is at least $W$.
  The absolute height variation in the cutoff transition, together with that on ${ zeta = 1 \, s < .05 }$,
  is at most $.06 L_(*) W$; repeated visits are included by integrating the absolute derivative along the curve.
  Where $zeta = 0$ there is no height variation. Thus the remaining portion, where $zeta = 1$ and $s gt.eq .05$,
  carries variation greater than

$ \( 1 \/ 5 - .06 L_(*) \) W - 1 > .11 W . $

On that portion $mu = 1$ and $h' = h + upright(d) u_rho^2$. Everywhere else $h' gt.eq h$.
  Applying the integral triangle inequality to the pair consisting of the $h$-speed and the absolute height
  derivative restricted to this portion gives

$ "length"_(h') \( gamma \) > sqrt(W^2 + \( .11 W \)^2) > L_(*) W \, $

a contradiction. This proves (5.1) and completes the proof of Lemma 9.

== 6 Stretching rounds and the width bound <sec:assembly>

We now construct the metric and log warps required by Theorem 2.
  The local stretching lemma increases one separation at a time.
  Its loss is measured by a decrease in the trace of a fixed background metric,
  so a whole family of separations can be treated without a bound on the overlap of their neighborhoods.
  Changing the working scale after each round restores the quadratic reserve.

=== 6.1 Summing the local losses <summing-the-local-losses>

The following form of the round argument accommodates a drift of either sign.
  It extends the iteration in #cite(label("OpenAIWidth")) Section 4 using the positive-part term in Lemma 9.

#thm([Lemma 6.1.])[
  (One round of separations).  #emph[Let $n gt.eq 4$, let $0 < delta < min { 1 \/ 10 \, 1 \/ \( n + 1 \) }$,
    and let $W \, T$ be supplied by Lemma 9. Put $V \( t \) = t^2 + T^2$ and $L_(*) = 1.004$.
    Let $h_0$ be a complete smooth metric on a connected smooth $n$-manifold $M$ without boundary, and let $t_0 :
    M arrow.r bb(R)$ be smooth. Suppose that, for a real constant $c$,
$ cal(D) \( h_0 \, t_0 \) gt.eq c + V \( t_0 \) . $

 Let $\( A_i \, B_i \)$ be a finite or countable family of nonempty closed pairs,
   with each $A_i$ compact and $"dist"_(h_0) \( A_i \, B_i \) gt.eq W$.
   Suppose there is a locally finite family of compact sets $K_i$ such that
$ { x : "dist"_(h_0) \( A_i \, x \) < W } subset K_i \\ B_i . $

 Then there are smooth $h_1 gt.eq h_0$ and $t_1 gt.eq t_0$ such that
#[#set math.equation(numbering: n => "(6.1)")
 $ "dist"_(h_1) \( A_i \, B_i \) & gt.eq L_(*) W quad upright("for every ") i \,\
cal(D) \( h_1 \, t_1 \) & gt.eq c + #scale(x: 120%, y: 120%)[\(] 1 - \( n + 1 \) delta
  #scale(x: 120%, y: 120%)[\)] V \( t_1 \) . $ <assembly:round-distance>]

 The changes are a locally finite sequence of compactly supported changes inside the sets $K_i$, and $h_1$ is complete.]
] <assembly:round>

#proof[
  Enumerate the pairs and choose $d_i > 0$ with $sum_i d_i < delta$.
    Apply Lemma 9 to them successively, keeping $h_0$ as the background metric throughout the round.
    The separation hypothesis is therefore fixed, and increasing the current metric preserves its domination of
    $h_0$. For the current metric and drift $\( H \, z \)$, define the pointwise functions
  $ Q = "tr"_H h_0 \, wide Lambda = 1 - delta \( n - Q \) - Sigma \, $
  where $Sigma$ is the sum of the losses $d_i$ already used.
    We claim that the inequality maintained after every finite number of steps is
  #[#set math.equation(numbering: n => "(6.2)")
   $ cal(D) \( H \, z \) gt.eq c + Lambda V \( z \) . $ <assembly:trace-invariant>]
  Initially $Q = n$, $Sigma = 0$, and $Lambda = 1$. At every subsequent step $0 < Q lt.eq n$ and $Sigma < delta$,
    hence $0 < Lambda lt.eq 1$. Denote the next metric, drift, trace, and coefficient by $H' \, z' \, Q' \,
    Lambda'$, and its small loss by $d$. Then $Lambda' = Lambda - delta \( Q - Q' \) - d$.
    The local lemma and (6.2) give
  $ cal(D) \( H' \, z' \) & gt.eq c + Lambda V \( z \) + \( V \( z' \) - V \( z \) \)_(+) -
    #scale(x: 120%, y: 120%)[\(] delta \( Q - Q' \) + d #scale(x: 120%, y: 120%)[\)] V \( z' \)\
 & gt.eq c + Lambda' V \( z' \) . $
  Here $\( a \)_(+) = max { a \, 0 }$, and the second inequality follows from $a_(+) gt.eq Lambda a$ for $0 lt.eq
    Lambda lt.eq 1$. This comparison is valid even when $V \( z' \) < V \( z \)$.
    Since $Lambda gt.eq 1 - \( n + 1 \) delta$, it proves the asserted reserve at every finite stage.
  Each processed pair attains separation at least $L_(*) W$, and later metric enlargements preserve that bound.
    The changes are supported in the locally finite compact family $\( K_i \)$.
    Thus near every point the metric and drift are unchanged after finitely many steps.
    Their limits $h_1 \, t_1$ are smooth and satisfy the same local scalar inequality;
    metric monotonicity preserves every separation in the limit.
    Finally, a smooth metric dominating a complete metric is complete:
    an $h_1$-Cauchy sequence converges in $h_0$, and local equivalence of the two smooth metrics gives convergence
    in $h_1$. ◻
]

=== 6.2 Proof of Theorem 1 <proof-of-theorem-thmmain>

#proof[
  #strong[Initialization.] Fix $n gt.eq 4$. Choose $delta > 0$, depending only on $n$, so that
  #[#set math.equation(numbering: n => "(6.3)")
   $ delta < 1 / 10 \, wide 2 \( n + 1 \) delta < 1 - L_(*)^(- 2) \, wide L_(*) = 1.004 . $ <assembly:delta>]
  Take $W \, T$ from Lemma 9, and write $V \( t \) = t^2 + T^2$. Let $C \( n \)$ be the constant in Proposition 4.
    Choose $R_0 gt.eq 1$, depending only on $n$, such that
  #[#set math.equation(numbering: n => "(6.4)")
   $ R_0^2 / 2 gt.eq C \( n \) + T^2 \, wide W R_0 gt.eq D_(upright("nat")) \( n \) \, wide D =
     W R_0 . $ <assembly:scale>]
  These choices precede all metric-dependent constructions.
  Let $\( M \, g \)$ satisfy the spectral hypothesis; we may assume $M$ is nonempty.
    Choose a maximal $D$-separated set of centers $\( x_i \)_(i in I)$, and set
  $ A_i = overline(B)_g \( x_i \, D \) \, wide B_i = M \\ B_g \( x_i \, 2 D \) \, wide K_i =
    overline(B)_g \( x_i \, 2 D \) . $
  The $A_i$ cover $M$, and properness of $g$ makes $\( K_i \)$ locally finite:
    centers whose outer balls meet a compact set lie in a compact $2 D$-neighborhood of that set,
    which contains only finitely many $D$-separated points. Second countability makes $I$ finite or countable.
    If some $B_i$ is empty, then $"diam"_g M lt.eq 4 D$ and a constant map proves the theorem.
    Henceforth every $B_i$ is nonempty. Choose positive numbers $p_i^(*)$, including $p_0^(*)$,
    with total $1 \/ 20$, and prescribe
  #[#set math.equation(numbering: n => "(6.5)")
   $ L_i = 10 + 2 pi sqrt(2 \/ p_i^(*)) quad \( i in I \) . $ <assembly:targets>]
  By Lemma 3, there is a smooth real function $w$ with $cal(D) \( g \, w \) gt.eq 1$.
    Dividing a metric by $R^2$ multiplies scalar curvature, the Laplacian, and squared gradient norms by $R^2$.
    Consequently $cal(D) \( g \/ R_0^2 \, w \) gt.eq R_0^2$. Apply Proposition 4 to $\( g \/ R_0^2 \, w \)$,
    and multiply its output metric by $R_0^2$. Call the resulting metric $h^(\[ 0 \])$ and its drift
    $t^(\[ 0 \])$. Then $h^(\[ 0 \]) gt.eq g$ is complete and
  #[#set math.equation(numbering: n => "(6.6)")
   $ cal(D) \( h^(\[ 0 \]) \/ R_0^2 \, t^(\[ 0 \]) \) & gt.eq R_0^2 + \( t^(\[ 0 \]) \)^2 - C \( n \)\
 & gt.eq R_0^2 / 2 + V \( t^(\[ 0 \]) \) . $ <assembly:initial-reserve>]
  The original drift $w$ may be unbounded. The uniform scale in (6.4) is available because preprocessing supplies
    the quadratic term in the new drift.
  #strong[Successive rounds.]
  Put $R_j = L_(*)^j R_0$. At the start of round $j$ we maintain complete smooth data
    $\( h^(\[ j \]) \, t^(\[ j \]) \)$ satisfying
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(D) \( h^(\[ j \]) \/ R_j^2 \, t^(\[ j \]) \) gt.eq R_j^2 / 2 + V \( t^(\[ j \]) \) . $ <assembly:start>]
  A label is called active when $"dist"_(h^(\[ j \])) \( A_i \, B_i \) lt.eq L_i$; every active label will also satisfy
  #[#set math.equation(numbering: n => "(6.8)")
   $ "dist"_(h^(\[ j \])) \( A_i \, B_i \) gt.eq W R_j . $ <assembly:active-distance>]
  Both assertions hold at $j = 0$: the reserve is (6.6), and $h^(\[ 0 \]) gt.eq g$ gives separation at least $D =
    W R_0$.
  Use the working metric $h_0 = h^(\[ j \]) \/ R_j^2$ for round $j$.
    For each active label, its open $h_0$-distance-$W$ neighborhood of $A_i$ misses $B_i$, by (6.8).
    Therefore it lies in the fixed original ball $B_g \( x_i \, 2 D \) subset K_i$.
    Lemma 10, with $c = R_j^2 \/ 2$, applies to the active pairs.
    Multiply its output metric by $R_j^2$ to obtain $h^(\[ j + 1 \])$,
    and denote its output drift by $t^(\[ j + 1 \])$. If there are no active pairs,
    keep the metric and drift unchanged. In either case, $h^(\[ j + 1 \]) gt.eq h^(\[ j \])$.
    Every label still active at the next round now has separation at least $L_(*) W R_j = W R_(j + 1)$.
  The reserve is restored by the new working scale:
  $ cal(D) \( h^(\[ j + 1 \]) \/ R_(j + 1)^2 \, t^(\[ j + 1 \]) \) & gt.eq R_(j + 1)^2 / 2 +
    L_(*)^2 #scale(x: 120%, y: 120%)[\(] 1 - \( n + 1 \) delta #scale(x: 120%, y: 120%)[\)] V \( t^(\[ j + 1 \]) \)\
 & gt.eq R_(j + 1)^2 / 2 + V \( t^(\[ j + 1 \]) \) \, $
  where (6.3) makes the coefficient of $V$ greater than one. Thus (6.7) holds at every round.
    In original units its constant scalar reserve remains $1 \/ 2$.
  #strong[The limit and its log warps.]
  Each label is active for only finitely many rounds, because its separation is at least $W
    R_j$ while active and $R_j arrow.r oo$. It remains inactive once its target is exceeded,
    since all metrics increase. Every change associated with label $i$, in every round,
    is supported in the same original compact ball $K_i$. A compact set meets only finitely many such balls,
    and each of their labels is used only finitely many times.
    Hence on a neighborhood of any compact set the metric and drift are unchanged after finitely many changes in
    the entire construction. We obtain smooth data $\( h \, t \)$ with
  #[#set math.equation(numbering: n => "(6.9)")
   $ h gt.eq g \, wide cal(D) \( h \, t \) gt.eq 1 / 2 \, wide
     "dist"_h \( A_i \, B_i \) > L_i quad \( i in I \) . $ <assembly:final-drift>]
  The metric $h$ is complete by domination of $g$.
  It remains to realize the drift by log warps while spending at most $1 \/ 10$ of the scalar reserve.
    Dividing a log warp into many equal parts preserves its sum and reduces the sum of its squared gradients;
    see #cite(label("Gromov2024")) Section 1.A. We use the localized construction of #cite(label("OpenAIWidth"))
    Theorem 4.3, applied to a compactly supported decomposition of our signed drift.
    Take a finite or countable smooth partition of unity $\( phi_nu \)_(nu gt.eq 1)$ with locally finite compact
    supports, and put $tau_nu = - phi_nu t$. Then $sum_nu tau_nu = - t$.
    For each $nu$, choose an integer $m_nu gt.eq 1$ so large that
  $ 1 / m_nu sup_M \| upright(d) tau_nu \|_h^2 lt.eq 2^(- nu) / 10 . $
  The supremum is finite because $tau_nu$ has compact support.
    Introduce $m_nu$ log warps all equal to $tau_nu \/ m_nu$, and list all these functions as $\( p_alpha \)$.
    Repeating each support only finitely many times preserves local finiteness. Therefore
  $ P = sum_alpha p_alpha = - t \, wide sum_alpha \| upright(d) p_alpha \|_h^2 =
    sum_nu frac(\| upright(d) tau_nu \|_h^2, m_nu) lt.eq 1 / 10 . $
  Substitution into (2.1) gives
  $ R \( h \, \( p_alpha \) \) = cal(D) \( h \, t \) - sum_alpha \| upright(d) p_alpha \|_h^2 gt.eq 2 / 5 . $
  Equations (6.5) and (6.9) now supply all hypotheses of Theorem 2.
    Its map has whole fibers of diameter at most $4 D + 2$ in the original metric $g$. Taking
  $ C_n = 4 W R_0 + 2 $
  proves the theorem, since $W$ and $R_0$ depend only on $n$. ◻
]

For a quadratic-form lower bound $lambda > 0$, the metric $lambda g$ has normalized lower bound $1$,
  since its scalar curvature and Laplacian are $lambda^(- 1)$ times those of $g$.
  Its distances are $sqrt(lambda)$ times those of $g$, giving the bound $C_n \/
  sqrt(lambda)$ stated in the introduction.

#bibliography("refs.bib", style: "ieee", title: [References])
