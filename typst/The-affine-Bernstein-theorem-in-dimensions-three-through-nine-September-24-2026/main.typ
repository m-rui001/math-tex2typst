#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[The-affine-Bernstein-theorem-in-dimensions-three-through-nine-September-24-2026]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The affine Bernstein problem asks whether a complete locally uniformly convex affine maximal hypersurface must be
  an elliptic paraboloid. The meaning of completeness is essential:
  completeness for the metric induced from Euclidean space and completeness for the affine metric are different
  hypotheses. We prove the Euclidean-complete graph assertion in dimensions three through nine.

Let $Omega subset bb(R)^n$ be a nonempty open convex domain,
  and let $u in C^oo \( Omega \)$ have positive-definite Hessian. Write

$ U^(i j) = det \( D^2 u \) \( D^2 u \)_(i j)^(- 1) \, wide w = \( det D^2 u \)^(- \( n + 1 \) \/ \( n + 2 \)) . $

The affine maximal equation is

#[#set math.equation(numbering: n => "(1.1)")
 $ U^(i j) w_(i j) = 0 . $ <eq:affine-maximal>]

It is the Euler equation for affine area $integral \( det D^2 u \)^(1 \/ \( n + 2 \)) thin #h(-0.16667em) upright(d) x$.

#thm([Theorem 1.1.])[
  #emph[Let $3 lt.eq n lt.eq 9$. Suppose $u in C^oo \( Omega \)$ has positive-definite Hessian and satisfies
    (1.1). If its graph is complete for the induced Euclidean metric
$ g_(i j) = delta_(i j) + u_i u_j \, $

 then $Omega = bb(R)^n$ and
$ u \( x \) = 1 / 2 x^(sans(T)) A x + b dot.op x + c $

 for a positive-definite symmetric matrix $A$, a vector $b$, and a constant $c$.
   In particular, the graph is an invertible affine image of the standard elliptic paraboloid.]
] <thm:main>

Theorem 1 resolves the Euclidean-complete affine Bernstein conjecture for smooth locally uniformly convex graphs
  in dimensions three through nine. It includes the entire graph assertion and imposes neither a growth bound nor
  completeness of the affine metric.

Chern asked whether an entire locally uniformly convex affine maximal surface must be an elliptic paraboloid
  #cite(label("Chern1979")). Calabi developed the affine variational framework and proved the surface conclusion
  under both Euclidean and affine completeness #cite(label("Calabi1982"));
  see also #cite(label("TW2002")) Section 1. For a graph, the affine (Berwald–Blaschke) metric is

$ g_(i j)^(upright("aff")) = \( det D^2 u \)^(- 1 \/ \( n + 2 \)) u_(i j) \, $

so its completeness is a different condition from that in Theorem 1.
  Trudinger and Wang proved the Euclidean-complete surface theorem,
  dispensing with affine completeness #cite(label("TW2000")) Theorem 1.1.
  Li and Jia gave a separate proof of the surface theorem under affine completeness alone #cite(label("LiJia2001")).

The analytic reduction in higher dimensions is also due to Trudinger and Wang.
  Their interior estimates and rescaling argument prove rigidity for Euclidean-complete graphs in every dimension
  provided the separation of the graph from its tangent planes has a modulus of strict convexity that remains
  uniform under normalization of tangent-plane sublevel sets #cite(label("TW2000")) Theorem 4.2 and Corollary 4.3.
  They establish this uniform control in dimension two by studying convex limits and their supporting contact sets
  #cite(label("TW2000")) Section 5. Obtaining it in higher dimensions without an additional hypothesis is the
  obstacle addressed here. Later work has developed alternative analytic approaches:
  Wang and Zhou give a proof of the entire-surface theorem using the partial Legendre transform,
  and higher-dimensional rigidity results under integral bounds on the Hessian and the inverse Hessian determinant
  #cite(label("WangZhou2023")) Theorem 1.2 and Corollary 1.6.
  Our proof instead derives the required convexity control from the geometry of affine limits,
  with no growth or integral bound assumed.

For locally uniformly convex hypersurfaces in dimension at least two,
  Trudinger and Wang proved that affine completeness implies Euclidean completeness #cite(label("TW2002"))
  Theorem A; the converse fails in general. Their global graph theorem #cite(label("TW2002")) Corollary 1
  therefore extends our conclusion to connected smooth open affine-complete locally uniformly convex immersed
  hypersurfaces that are classically affine maximal, without an initial graph assumption.
  The precise statement and proof appear in Corollary 21.

The singular entire affine maximal graph constructed by Trudinger and Wang in dimension ten #cite(label("TW2000"))
  Section 7 is a weak solution. It is not smooth and does not furnish a counterexample under the hypotheses of
  Theorem 1. Our argument identifies the dimension restriction in a quadratic coercivity estimate,
  whose strict positivity holds through dimension nine.

The distinction between the classical equation and its determinant-power generalizations is also relevant.
  For affine maximal type equations with $w = \( det D^2 u \)^a$, Sun,
  Xing and Xu construct nonquadratic Euclidean-complete examples in every dimension $n gt.eq
  2$ for $a in \[ - n \/ \( n + 1 \) \, 0 \)$ #cite(label("SunXingXu2026")) Theorem 1.3.
  This interval excludes the classical exponent $- \( n + 1 \) \/ \( n + 2 \)$ in Equation (1.1).

=== The main ideas <the-main-ideas>

For $a in Omega$, let

$ l_a \( x \) = u \( a \) + D u \( a \) dot.op \( x - a \) \, wide S_u \( a \, t \) = { x in Omega :
  u \( x \) < l_a \( x \) + t } quad \( t > 0 \) . $

These tangent sections measure the separation of the graph from its supporting planes.
  The geometric objective is uniform balance: for one $rho > 0$,
  reflection about the base point followed by contraction by $rho$ takes every closed section into itself.
  This control must hold at every base point and every height.

We obtain balance by studying full-dimensional closed convex limits of affine images of the epigraph $D =
  { \( x \, z \) : x in Omega \, med z gt.eq u \( x \) }$. Write the coordinates of such a limit as $\( s \, y \)
  in bb(R)^k times bb(R)^(n + 1 - k)$. A model with $k$ directions is supported in $s_i gt.eq 0$,
  contains ${ \( s \, 0 \) : s_i gt.eq 0 }$, and has compact caps cut out by $sum_i s_i lt.eq T$.
  Its transverse fibers are $K_s = { y : \( s \, y \) in D_(upright("lim")) }$,
  where $D_(upright("lim"))$ denotes the limiting body. Maximizing $k$ forces a uniform centering estimate $-
  K_s subset C_(*) K_s$ for all positive fibers: failure of this estimate produces an additional nonnegative
  direction by a further affine rescaling. Normalized caps and convex limits also play a central role in the
  two-dimensional argument of Trudinger and Wang #cite(label("TW2000")) Section 5;
  here the rescaling is organized by the maximal number of nonnegative directions.

The analytic step excludes $k gt.eq 2$. Support functions of the fibers give a positive second form and a natural
  invariant measure. The affine maximal equation yields an integral inequality in logarithmic coordinates,
  forcing exponential growth of a related measure. A cap identity and estimates for Hessian minors bound its mass
  on each normalized log cell, allowing only polynomial growth.
  Both estimates are used on smooth approximants over one sufficiently large finite box;
  the limiting body needs no regularity.

These two ingredients—increasing the number of model directions when centering degenerates,
  and combining a logarithmic integral inequality with affine-invariant cell bounds—are the principal technical
  contributions. The resulting uniform balance of tangent sections supplies a scale-independent modulus of strict
  convexity. We then use the interior estimates and section-rescaling argument of Trudinger and Wang
  #cite(label("TW2000")) Sections 2 and 4: normalized third derivatives stay bounded,
  while transforming them back gives a bound tending to zero.
  John’s ellipsoid theorem #cite(label("John1948")) #cite(label("Ball1992")) supplies the normalizations.
  The compactness arguments and the cap and tube estimates used here are proved below.

=== Notation and organization <notation-and-organization>

Closed sections use the corresponding non-strict inequality.
  The symbol $B_r \( x \)$ denotes an open Euclidean ball, and $B_r = B_r \( 0 \)$;
  its ambient dimension will be clear. The notation $H^(- 1)$ for a positive second form specifies the dual norm
  on covectors. All constants in uniform estimates may depend on the fixed dimension and, where stated,
  on the family of affine limits of the given epigraph.

Section 2 establishes the compactness and centering argument.
  Sections 3 and 4 derive the cap identity and the tube inequality.
  Section 5 excludes models with several directions, and Section 6 deduces section control and proves Theorem 1.

== 2 Convex limits and centered fibers <sec:geometry>

The objective of this section is to show that fibers are uniformly centered once the number of model directions is
  maximal. We first obtain compact caps from graph completeness,
  then normalize a hypothetical sequence of increasingly asymmetric fibers.
  Its limit supplies the additional direction that contradicts maximality.

Throughout this section, $n gt.eq 2$, $Omega subset bb(R)^n$ is nonempty, open and convex,
  and $u in C^oo \( Omega \)$ has positive-definite Hessian.
  We assume only that its graph is complete for the induced Euclidean metric.
  No differential equation is needed in this section. For $a in Omega$, write

$ l_a \( x \) = u \( a \) + D u \( a \) dot.op \( x - a \) \, wide g_a \( x \) = u \( x \) - l_a \( x \) . $

#thm([Lemma 2.1.])[
  #emph[At every finite boundary point $b in partial Omega$,
$ lim_(Omega in.rev x arrow.r b) u \( x \) = + oo . $

 The epigraph
$ D = { \( x \, z \) : x in Omega \, med z gt.eq u \( x \) } $

 is a closed full-dimensional convex set with boundary equal to the graph of $u$.
   For every $a in Omega$ and $t gt.eq 0$, the set ${ x in Omega : g_a \( x \) lt.eq
   t }$ is compact and contained in $Omega$. Consequently the cap $D ∩ { z - l_a \( x \) lt.eq t }$ is compact.]
] <lem:proper-sections>

#proof[
  Suppose $x_j arrow.r b in partial Omega$ and $u \( x_j \) lt.eq A$. Fix $a in Omega$.
    Convexity, followed by continuity at the interior point $a + q \( b - a \)$, gives
  $ u \( a + q \( b - a \) \) lt.eq \( 1 - q \) u \( a \) + q A \, wide 0 lt.eq q < 1 . $
  An affine supporting function at $a$ gives a lower bound on the same segment.
    The resulting bounded convex function of $q$ has finite total variation and a finite limit as $q arrow.t 1$.
    Its lifted curve has finite Euclidean length, since
  $ integral_0^1 sqrt(\| b - a \|^2 + lr(|frac(#h(-0.16667em) upright(d), #h(-0.16667em) upright(d) q)
    u \( a + q \( b - a \) \)|)^2) thin #h(-0.16667em) upright(d) q lt.eq \| b - a \| +
    integral_0^1 lr(|frac(#h(-0.16667em) upright(d), #h(-0.16667em) upright(d) q) u \( a + q \( b - a \) \)|) thin
    #h(-0.16667em) upright(d) q < oo . $
  Its tail is therefore Cauchy in the graph metric, but its base coordinate tends to $b in.not Omega$.
    This contradicts completeness. The asserted boundary limit follows.
    It also shows that a bounded convergent sequence of points of $D$ cannot have its base limit on $partial
    Omega$. Thus $D$ is closed, and its boundary is exactly the graph.
  Choose $r \, c > 0$ such that $overline(B)_r \( a \) subset Omega$ and $D^2 u gt.eq
    c upright("Id")$ on this ball. Along every ray from $a$, convexity of $g_a$, together with $g_a \( a \) = 0$, gives
  $ g_a \( x \) gt.eq frac(c r, 2) \| x - a \| wide \( x in Omega \, med \| x - a \| gt.eq r \) . $
  Indeed, $g_a gt.eq c r^2 \/ 2$ at the point of the ray at distance $r$,
    and its quotient by the distance is nondecreasing. Thus each stated sublevel is bounded.
    The boundary limit just proved makes it closed in $bb(R)^n$ and contained in $Omega$.
    On such a compact base, both $l_a$ and the cap height are bounded, which proves the last claim. ◻
]

We use local convergence of nonempty closed convex sets in the sense of locally uniform convergence of their
  distance functions. This topology has the following elementary properties.
  Every point of a limit is approximated by points of the approximating sets,
  and every limit of a convergent sequence of such points belongs to the limit.
  If the limit has nonempty interior, every compact subset of its interior is eventually contained in the
  interiors of the approximants. For the latter statement, enclose a point in a simplex whose vertices lie in the
  limit, approximate its vertices, and then use a finite cover of the compact subset.
  A sequence of closed convex sets meeting a fixed bounded set has a locally convergent subsequence:
  their distance functions are locally equibounded and $1$-Lipschitz,
  and a diagonal application of compactness gives the distance function of a nonempty closed convex set.

Let $cal(F) \( D \)$ be the family of all full-dimensional local limits of invertible affine images of $D$,
  including those images themselves. The family is invariant under invertible affine maps and closed under further
  full-dimensional local limits. To justify the last assertion explicitly,
  the distance-function topology is metrizable by

$ d_(upright("loc")) \( C \, E \) = sum_(q = 1)^oo 2^(- q) min {1 \,
  sup_(\| X \| lt.eq q) \| "dist" \( X \, C \) - "dist" \( X \, E \) \|} . $

If $C_j in cal(F) \( D \)$ tends to a full-dimensional set $C$,
  choose an affine image $E_j$ of $D$ with $d_(upright("loc")) \( E_j \, C_j \) < 1 \/ j$. Then $E_j arrow.r C$.
  Affine invariance follows because a fixed invertible affine map and its inverse take bounded sets to bounded
  sets and preserve the two pointwise convergence properties above.
  Thus affine maps varying with $j$ may be applied before this diagonal choice.

#thm([Lemma 2.2.])[
  #emph[Suppose $C_j arrow.r C$ locally, and let $ell$ be an affine function.
    If $C ∩ { ell lt.eq b }$ is bounded and contains a point $q$ with $ell \( q \) < b$,
    then the caps $C_j ∩ { ell lt.eq b }$ are eventually uniformly bounded.
    They converge in Hausdorff distance to $C ∩ { ell lt.eq b }$.]
] <lem:cap-compactness>

#proof[
  Choose $q_j in C_j$ with $q_j arrow.r q$, so $ell \( q_j \) < b$ eventually.
    If points $p_j in C_j ∩ { ell lt.eq b }$ escape every bounded set, pass to a subsequence for which
  $ frac(p_j - q_j, \| p_j - q_j \|) arrow.r v \, wide \| v \| = 1 . $
  For each fixed $t gt.eq 0$, the points $q_j + t \( p_j - q_j \) \/ \| p_j -
    q_j \|$ eventually lie on the segments $\[ q_j \, p_j \]$.
    Their limit $q + t v$ therefore belongs to $C ∩ { ell lt.eq b }$, contradicting boundedness.
  Uniform boundedness and local convergence show that every limit point of the approximating caps lies in the
    limit cap. Conversely, if $x$ belongs to the limit cap, then $\( 1 - eta \) x +
    eta q$ lies strictly below the top for every $0 < eta lt.eq
    1$ and is approximated by points of the approximating caps.
    Letting $eta arrow.b 0$ and using compactness gives the reverse Hausdorff inclusion. ◻
]

#prodef([Definition 2.3.])[
  A #emph[model with $k$ directions], or a #emph[$k$-model],
    is a member $C$ of $cal(F) \( D \)$ equipped with affine coordinates
  $ \( s \, y \) in bb(R)^k times bb(R)^m \, wide m = n + 1 - k \, wide 1 lt.eq k lt.eq n + 1 \, $
  such that
  $ { \( s \, 0 \) : s_i gt.eq 0 } subset C subset { \( s \, y \) : s_i gt.eq 0 } \, $
  and every cap $C ∩ { sum_i s_i lt.eq T }$, $T gt.eq 0$, is compact. Its transverse fibers are
  $ K_s = { y : \( s \, y \) in C } . $
  The coordinates are part of the model data.
] <def:model>

#thm([Lemma 2.4.])[
  #emph[For a $k$-model, addition of any vector $\( v \, 0 \)$ with $v_i gt.eq 0$ preserves $C$.
    Every fiber $K_s$ with $s_i > 0$ is compact, full-dimensional in $bb(R)^m$, and contains zero. Moreover,
#[#set math.equation(numbering: n => "(2.1)")
 $ K_s subset K_t quad \( s_i lt.eq t_i \) \, wide K_(lambda s) subset lambda K_s quad \( lambda gt.eq 1 \) .
   $ <eq:fiber-monotonicity>]

 At least one $1$-model exists.]
] <lem:model-fibers>

#proof[
  The recession assertion holds for any closed convex set containing the indicated orthant,
    without a full-dimensionality assumption. For $X in C$ and $v_i gt.eq 0$, take the limit as $eta arrow.b 0$ of
  $ \( 1 - eta \) X + eta \( v \/ eta \, 0 \) in C $
  to obtain $X + \( v \, 0 \) in C$. This proves fiber monotonicity.
    Since the ambient origin belongs to $C$, contraction toward it proves the second inclusion in (2.1).
    Containment of zero and compactness follow from the definition.
  Take an interior ball of $C$ centered at $\( s^0 \, y^0 \)$; all coordinates of $s^0$ are positive.
    Given $s_i > 0$, choose $0 < eta lt.eq 1$ with $eta s_i^0 lt.eq s_i$.
    Contract the transverse slice of this ball by $eta$ about the ambient origin,
    and increase the $s$ coordinates to $s$. The resulting transverse ball lies in $K_s$, proving full dimension.
    When $m = 0$ this assertion uses the usual convention for $bb(R)^0$.
  Finally, for any $a in Omega$, the coordinates $s = z - l_a \( x \)$ and $y = x -
    a$ make $D$ a $1$-model by Lemma 2. ◻
]

We shall use the following precise consequence of the ellipsoid theorem of John #cite(label("John1948"));
  see also the contact-point formulation and nonsymmetric outer-radius deduction in #cite(label("Ball1992"))
  Section 0. The normalization is linear and therefore preserves the distinguished origin.

#thm([Lemma 2.5.])[
  #emph[Let $K subset bb(R)^d$, $d gt.eq 1$, be compact and convex with nonempty interior and $0 in K$.
    There are an invertible linear map $A$ and a vector $c$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ overline(B)_1 \( c \) subset A K subset overline(B)_d \( c \) \, wide \| c \| lt.eq d . $ <eq:linear-normalization>]

 In particular $A K subset overline(B)_(2 d)$; the origin is allowed to lie on $partial K$.
   If in addition $- K subset C_(*) K$ for some $C_(*) gt.eq 1$, then
#[#set math.equation(numbering: n => "(2.3)")
 $ overline(B)_(2 \/ \( C_(*) + 1 \)) subset A K subset overline(B)_(2 d) . $ <eq:centered-normalization>]

]
] <lem:linear-normalization>

#proof[
  Choose a maximum-volume inscribed ellipsoid and take the linear part of its normalization to a unit ball.
    John’s Theorem gives the two inclusions in (2.2). Since $0 in A K$, the outer inclusion implies $\| c \| lt.eq
    d$. The centering assumption also gives $overline(B)_(1 \/ C_(*)) \( - c \/ C_(*) \) subset A K$.
    The convex combination of this ball and $overline(B)_1 \( c \)$ with respective weights
    $C_(*) \/ \( C_(*) + 1 \)$ and $1 \/ \( C_(*) + 1 \)$ is the centered ball in (2.3). ◻
]

By Lemma 5, the set of direction numbers achieved by models is a nonempty subset of ${ 1 \, dots.h \, n + 1 }$.
  Let $k$ be its maximum.

#thm([Proposition 2.6.])[
  (Uniform centering at maximal direction number).  #emph[Suppose $m = n + 1 - k > 0$.
    There is a constant $C_(*) gt.eq 1$, depending on the family $cal(F) \( D \)$, such that
#[#set math.equation(numbering: n => "(2.4)")
 $ - K_s subset C_(*) K_s wide \( s_i > 0 \) $ <eq:model-centering>]

 for every $k$-model and every admissible choice of its coordinates.
   In particular, zero is an interior point of every such fiber.]
] <prop:centering>

#proof[
  Suppose that no uniform constant exists. Choose $k$-models and positive fibers for which the inclusion with
    constant $j$ fails. Positive diagonal changes in $s$ put those fibers at
    $upright(bold(1)) = \( 1 \, dots.h \, 1 \)$, and Lemma 6 provides linear changes in $y$.
    Denote the resulting models by $C_j$ and their fibers at $upright(bold(1))$ by $F_j$. Thus
  #[#set math.equation(numbering: n => "(2.5)")
   $ overline(B)_1 \( c_j \) subset F_j subset overline(B)_(2 m) \, wide \| c_j \| lt.eq m \, wide -
     F_j subset.not j F_j . $ <eq:asymmetric-normalization>]
  All these coordinate changes preserve the model properties and the failed inclusion.
  For $T gt.eq 1$ and $0 lt.eq s_i lt.eq T$, Lemma 5 gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ K_s^(\( j \)) subset K_(T upright(bold(1)))^(\( j \)) subset T F_j subset overline(B)_(2 m T) .
     $ <eq:normalized-cap-bound>]
  Pass to a local limit $C$ and a subsequence with $c_j arrow.r c$.
    The limit is contained in the nonnegative $s$ halfspaces, contains the entire orthant at $y = 0$,
    and has compact caps by (2.6). Moreover,
  $ \[ 1 \, 2 \]^k times overline(B)_1 \( c_j \) subset C_j \, $
  so its limit has nonempty interior. The closure properties of $cal(F) \( D \)$ show that $C$ is a $k$-model.
  Its fiber $F = K_(upright(bold(1)))$ is the Hausdorff limit of $F_j$. Only one inclusion needs explanation.
    If $\( s^(\( j \)) \, y_j \) in C_j$ tends to $\( upright(bold(1)) \, y \) in C$, let
  $ a_j = min {1 \, 1 / s_1^(\( j \)) \, dots.h \, 1 / s_k^(\( j \))} . $
  The denominators are positive for large $j$, and $a_j arrow.r 1$.
    Contracting by $a_j$ and then increasing the $s$ coordinates gives $\( upright(bold(1)) \, a_j y_j \) in C_j$.
    Thus every point of $F$ is approximated from the exact fibers $F_j$;
    the other inclusion follows from local convergence. Uniform boundedness makes this Hausdorff convergence.
    If zero were interior to $F$, the $F_j$ would eventually contain a fixed ball centered at zero.
    Their common outer bound would then give a fixed centering constant, contrary to (2.5). Hence $0 in partial F$.
  A supporting linear functional of $F$ at zero can be made the coordinate $y_1$, with $F subset { y_1 gt.eq 0 }$.
    This inequality holds on all of $C$: contract any $\( s \, y \) in C$ until each $s_i lt.eq 1$,
    then increase the $s$ coordinates to $upright(bold(1))$ and apply the inequality on $F$.
    Since $F$ has nonempty interior, an additional invertible linear choice of transverse coordinates makes an
    interior point of $F$ equal to $\( y_1 \, y' \) = \( 1 \, 0 \)$, while retaining the global support $y_1 gt.eq 0$.
  We now construct a model with $k + 1$ directions. Put $d = m - 1$. For $0 < epsilon.alt < 1 \/ 2$, let
  $ F_epsilon.alt = { y' in bb(R)^d : \( upright(bold(1)) \, epsilon.alt \, y' \) in C } . $
  This compact slice contains zero in its interior when $d > 0$.
    Indeed, if $overline(B)_r \( \( 1 \, 0 \) \) subset F$, contracting by $epsilon.alt$ about the ambient origin
    and then adding $\( 1 - epsilon.alt \) upright(bold(1))$ in the $s$ coordinates shows that
  $ overline(B)_(epsilon.alt r) subset F_epsilon.alt subset bb(R)^d . $
  When $d > 0$, apply Lemma 6 to choose an invertible linear map $A_epsilon.alt$ on $bb(R)^d$ so that
  $ overline(B)_1 \( c_epsilon.alt \) subset A_epsilon.alt F_epsilon.alt subset overline(B)_(2 d) \,
    wide \| c_epsilon.alt \| lt.eq d . $
  If $d = 0$, take $A_epsilon.alt$ to be the unique linear automorphism of $bb(R)^0$ and omit all statements about
    its balls. Use the affine images
  $ C_epsilon.alt = { \( s \, r \, z \) : \( s \, epsilon.alt r \, A_epsilon.alt^(- 1) z \) in C } . $
  They are supported in $s_i \, r gt.eq 0$, contain the origin,
    and their slice at $\( s \, r \) = \( upright(bold(1)) \, 1 \)$ has the stated normalization.
  Figure 1 illustrates the supporting fiber and the slice used in this rescaling.
    The remaining step is to turn control of that one slice into a uniform bound for every fixed cap.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.25), radius: (1.18, 1.25), fill: rgb("#f2f2ff"), stroke: none)
  circle((0, 1.25), radius: (1.18, 1.25), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  line((-1.65, 0), (1.75, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((1.75, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$y'$]]], anchor: "west", padding: 0.1176cm)
  line((0, -0.24), (0, 2.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((0, 2.85), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$y_1$]]], anchor: "south", padding: 0.1176cm)
  line((-1.46, 0.44), (1.43, 0.44), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((-0.899, 0.44), (0.899, 0.44), stroke: (paint: rgb("#000099"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  content((-1.46, 0.44), [#text(size: 9pt)[$epsilon$]], anchor: "east", padding: 0.1176cm)
  content((0.27, 0.49), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$F_ epsilon$]]], anchor: "south-west", padding: 0.1176cm)
  circle((0, 0), radius: 0.04586, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  circle((0, 1.25), radius: 0.04586, fill: black, stroke: none)
  content((0.08, 1.25), [#text(size: 9pt)[$(1,0)$]], anchor: "west", padding: 0.1176cm)
  content((-0.52, 1.8), [#text(size: 9pt)[$F$]])
  content((0, -0.7), [#text(size: 9pt)[Original fiber#linebreak()$s= bold(1)$]])
  line((2.15, 1.32), (4.15, 1.32), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.15, 1.84), [#text(size: 9pt)[$r=y_1"/"epsilon$#linebreak()$z=A_ epsilon y'$]])
  line((4.4, 0), (7.8, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((7.8, 0), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$z$]]], anchor: "west", padding: 0.1176cm)
  line((6, -0.24), (6, 2.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((6, 2.85), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$r$]]], anchor: "south", padding: 0.1176cm)
  line((4.57, 0.92), (7.43, 0.92), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((4.84, 0.92), (7.16, 0.92), stroke: (paint: rgb("#000099"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  content((4.57, 0.92), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  content((6.14, 0.99), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$A_ epsilon F_ epsilon$]]], anchor: "south-west", padding: 0.1176cm)
  circle((6, 0), radius: 0.04586, fill: black, stroke: none)
  content((6, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  circle((6, 2.32), radius: 0.04586, fill: black, stroke: none)
  content((6.08, 2.32), [#text(size: 9pt)[$( epsilon^(-1),0)$]], anchor: "west", padding: 0.1176cm)
  content((6, -0.7), [#text(size: 9pt)[Rescaled slice#linebreak()$s= bold(1)$]])
})],
    caption: [Figure 1: The change from $\( y_1 \, y' \)$ to $\( r \, z \)$ at the fixed base point $s = upright(bold(1))$, shown schematically with one $y'$ coordinate. The actual fiber need not have the smooth or symmetric shape drawn here. The slice $y_1 = epsilon.alt$ becomes the slice $r = 1$, while $A_epsilon.alt$ normalizes its remaining transverse coordinates. The interior point $\( 1 \, 0 \)$ of $F$ is sent to $\( epsilon.alt^(- 1) \, 0 \)$. The right panel shows only this point, the origin, and the distinguished slice; the shape of the transformed fiber is omitted. ],
  ) <fig:thin-slice>
  Here is a uniform bound for their caps. Suppose $\( s \, r \, z \) in C_epsilon.alt$ with $s_i \, r lt.eq T$,
    where $T gt.eq 1$. Increase $s$ to $T upright(bold(1))$ and contract by $1 \/ T$. This gives
  $ \( upright(bold(1)) \, q \, z \/ T \) in C_epsilon.alt \, wide q = r \/ T in \[ 0 \, 1 \] . $
  The point $\( upright(bold(1)) \, 2 \, 0 \)$ also belongs to $C_epsilon.alt$,
    since $2 epsilon.alt < 1$ and it is obtained by contracting $\( upright(bold(1)) \, 1 \, 0 \) in
    C$ and then increasing $s$. Interpolate these two points with weight
  $ a = frac(1, 2 - q) in \[ 1 \/ 2 \, 1 \] $
  on $\( upright(bold(1)) \, q \, z \/ T \)$. The resulting point is $\( upright(bold(1)) \, 1 \, a z \/ T \)$,
    so the normalized slice gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ \| z \| lt.eq 4 d T wide \( d > 0 \) . $ <eq:thin-slice-cap-bound>]
  Equivalently, a slice outer radius $R$ gives the bound $2 T R$.
    When $d = 0$, the bounds on $s$ and $r$ themselves suffice.
    Thus caps in the new nonnegative coordinates are uniformly bounded.
  Extract a local limit $C_0$ as $epsilon.alt arrow.b 0$, also taking $c_epsilon.alt arrow.r c_0$ if $d > 0$.
    For each fixed $s_i > 0$ and $r gt.eq 0$, the point $\( s \, r \, 0 \)$ belongs to $C_epsilon.alt$ as soon as
  $ epsilon.alt r lt.eq min { 1 \, s_1 \, dots.h \, s_k } . $
  For $r > 0$, this follows by contracting $\( upright(bold(1)) \, 1 \, 0 \) in C$ by $epsilon.alt
    r$ and then increasing $s$; for $r = 0$ it follows from the original orthant.
    Hence $C_0$ contains these points. Closedness adds all faces with some $s_i = 0$,
    so it contains the entire nonnegative $\( s \, r \)$ orthant at $z = 0$.
    The support inequalities pass to the limit, and (2.7) makes its caps compact.
  For $d > 0$, the limit also contains ${ \( upright(bold(1)) \, 1 \) } times overline(B)_1 \( c_0 \)$.
    The recession argument in Lemma 5, which does not require full dimension,
    permits addition of every nonnegative $\( s \, r \)$ direction. Thus
  $ \[ 1 \, 2 \]^(k + 1) times overline(B)_1 \( c_0 \) subset C_0 \, $
  which proves full dimension. For $d = 0$, the contained orthant already has full dimension.
    Finally, affine invariance and diagonal closure of $cal(F) \( D \)$ give $C_0 in cal(F) \( D \)$.
    It is a $\( k + 1 \)$-model, contradicting maximality.
  This contradiction allowed the initial models, fibers, and admissible coordinates to vary arbitrarily.
    It therefore proves the uniform assertion (2.4). Its last conclusion follows, for example, from (2.3). ◻
]

We record the quantitative geometric consequence needed for the later estimates on fixed boxes.

#thm([Corollary 2.7.])[
  #emph[Under the hypotheses of Proposition 7, any chosen positive fiber of any $k$-model can be moved to $s =
    upright(bold(1))$ by positive diagonal changes in $s$ and normalized by an invertible linear change in $y$ so that
$ overline(B)_(r_0) subset K_(upright(bold(1))) subset overline(B)_(R_0) \, wide r_0 = frac(2, C_(*) + 1) \, quad
  R_0 = 2 m . $

 For every fixed $0 < a < 1 < b$, these normalized models satisfy
#[#set math.equation(numbering: n => "(2.8)")
 $ overline(B)_(a r_0) subset K_s subset overline(B)_(b R_0) wide \( s in \[ a \, b \]^k \) .
   $ <eq:normalized-fiber-box>]

 Their caps for fixed positive linear forms in $s$ and fixed positive top levels have uniform bounds,
   and they contain a fixed interior ball about $\( upright(bold(1)) \, 0 \)$.]
  #emph[For any sequence of affine images of $D$ converging to one of these models,
    comparable cap and fiber bounds hold eventually, uniformly on each fixed positive box.
    The constants are independent of the chosen fiber; the required index may depend on its normalization.
    For finitely many chosen fibers, one index suffices for all of them.]
] <cor:normalized-fibers>

#proof[
  The normalization follows from Proposition 7 and Lemma 6.
    Monotonicity and contraction toward zero give $a K_(upright(bold(1))) subset K_s subset b
    K_(upright(bold(1)))$ on $\[ a \, b \]^k$, proving (2.8).
    If $ell \( s \) = sum_i a_i s_i$ with $a_i > 0$ and $B > 0$, put $T = max { 1 \, B \/ min_i a_i }$. Then
  $ C ∩ { ell lt.eq B } subset \[ 0 \, T \]^k times overline(B)_(T R_0) . $
  Also $K_s supset overline(B)_(r_0 \/ 2)$ whenever each $s_i gt.eq 1 \/ 2$,
    which supplies the fixed interior ball about $\( upright(bold(1)) \, 0 \)$.
  Lemma 3 transfers each cap bound to the approximants; the strict point below its top is the origin.
    For a fixed box $\[ a \, b \]^k$, a smaller product $\[ a \, b \]^k times
    overline(B)_(a r_0 \/ 2)$ is a compact subset of the interior of the model,
    as is seen by first enlarging the positive $s$ box slightly.
    Interior convergence therefore gives the lower fiber bound on the entire box,
    and a containing cap gives the upper bound. These constants depend only on the displayed fixed parameters.
    Taking the maximum of the finitely many necessary indices proves the final statement. ◻
]

== 3 Affine area and a cap identity <sec:area>

From this section onward, the original graph also satisfies Equation (1.1).
  We derive stationarity in arbitrary affine coordinates and a cap identity that will control the inverse-Hessian
  weight in the logarithmic cell estimate. The affine-area variational framework is due to
  Calabi #cite(label("Calabi1982")); the formulas needed here are derived explicitly. Throughout,

$ delta = frac(1, n + 2) . $

For a smooth locally strictly convex hypersurface parametrized by $X$,
  an #emph[inward conormal] is a covector $nu$ annihilating its tangent space and pointing into the convex body.
  Its second form is $H_(i j) = nu X_(i j)$; we choose the sign so that $H$ is positive definite.
  If $nu xi = 1$, its affine area density is

#[#set math.equation(numbering: n => "(3.1)")
 $ #h(-0.16667em) upright(d) A = \( det H \)^delta \| det \( X_1 \, dots.h \, X_n \, xi \)
   #scale(x: 120%, y: 120%)[\|]^(n delta) thin #h(-0.16667em) upright(d) x_1 dots.h.c #h(-0.16667em) upright(d)
   x_n . $ <eq:affine-area>]

Changing $xi$ by a tangent vector leaves the determinant unchanged.
  Multiplying $nu$ by a positive scalar multiplies the two factors by reciprocal powers.
  A parameter change contributes the Jacobian to the power $2 delta + n delta = 1$,
  so (3.1) is a well-defined density. For the graph $X \( x \) = \( x \, u \( x \) \)$,
  choose $nu = \( - D u \, 1 \)$, $xi = \( 0 \, 1 \)$; then

$ #h(-0.16667em) upright(d) A = \( det D^2 u \)^delta thin #h(-0.16667em) upright(d) x . $

An invertible affine map with linear part $L$ replaces the conormal by $nu L^(- 1)$.
  The second form is unchanged and the tangential determinant acquires a factor $det L$. Thus

#[#set math.equation(numbering: n => "(3.2)")
 $ #h(-0.16667em) upright(d) A_(L \( M \)) = \| det L \|^(n delta) thin #h(-0.16667em) upright(d) A_M .
   $ <eq:area-covariance>]

With the unit inward normal, the same formula reads $#h(-0.16667em) upright(d) A =
  K^delta thin #h(-0.16667em) upright(d) S$, where $K$ is Gauss curvature and $#h(-0.16667em) upright(d)
  S$ is Euclidean hypersurface area.

#thm([Lemma 3.1.])[
  (Stationarity).  #emph[The equation in Theorem 1 implies stationarity of affine area under every smooth
    compactly supported variation of the graph. Every invertible affine image of the graph is stationary under
    such variations as well.]
] <lem:stationarity>

#proof[
  The Hessian cofactor matrix satisfies $partial_i U^(i j) = partial_j U^(i j) = 0$.
    This follows by differentiating its alternating determinant formula:
    terms cancel in pairs by symmetry of the third derivatives. Since
  $ \( det D^2 u \)^delta \( D^2 u \)^(- 1) = w U \, $
  the first variation in a compactly supported graph direction $eta$ is
  $ delta integral_Omega "tr" #scale(x: 120%, y: 120%)[\(] \( D^2 u \)^(- 1) D^2 eta #scale(x: 120%, y: 120%)[\)]
    thin #h(-0.16667em) upright(d) A = delta integral_Omega eta U^(i j) w_(i j) thin #h(-0.16667em) upright(d) x = 0 . $
  Here and below repeated coordinate indices are summed. For a compactly supported parametrized variation,
    its normal part can be represented locally as a graph variation,
    while its tangential part is a reparametrization. A partition of unity therefore gives stationarity for
    parametrized variations. Formula (3.2) transfers this statement to every affine image. ◻
]

#thm([Lemma 3.2.])[
  (Area in a ball).  #emph[For each $n$ and $R > 0$, the affine area of the part in $B_R$ of any smooth positively
    curved convex boundary in $bb(R)^(n + 1)$ is bounded by a constant depending only on $n \, R$.]
] <lem:area-bound>

#proof[
  The Gauss map is injective: two distinct contact points with the same supporting normal would force a boundary
    segment in their supporting hyperplane, contrary to positive curvature.
    Thus $integral K thin #h(-0.16667em) upright(d) S$ over the part in the ball is at most the area of $S^n$.
  For the Euclidean area bound, cover this part by the $2 \( n + 1 \)$ sets on which some signed component of the
    unit normal is at least $\( n + 1 \)^(- 1 \/ 2)$. On each set,
    convexity makes projection to the corresponding coordinate hyperplane injective:
    points with a given projection lie on a line meeting the body in an interval,
    and the chosen sign selects one endpoint. The projection Jacobian is at least $\( n + 1 \)^(- 1 \/ 2)$,
    and its image lies in the radius-$R$ ball. This bounds $integral #h(-0.16667em) upright(d) S$.
    Finally, Hölder’s inequality gives
  $ integral K^delta thin #h(-0.16667em) upright(d) S lt.eq
    (integral K thin #h(-0.16667em) upright(d) S)^delta (integral #h(-0.16667em) upright(d) S)^(1 - delta) . $
  ◻
]

#thm([Lemma 3.3.])[
  (Cap identity).  #emph[Let $M$ be an affine image of the original graph, bounding its convex body $D'$.
    Let $o in "int" D'$, let $ell$ be an affine function on the ambient space, and let $psi in C^oo \( bb(R) \)$.
    Suppose that the restrictions of $psi \( ell \) \, psi' \( ell \) \,
    psi'' \( ell \)$ vanish outside a compact subset of $M$. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ integral_M [nu \( o - X \) \| #h(-0.16667em) upright(d) ell \|_(H^(- 1))^2 psi'' \( ell \) +
   n #scale(x: 120%, y: 120%)[\(] ell \( o \) - ell \( X \) #scale(x: 120%, y: 120%)[\)] psi' \( ell \) -
   n \( n + 1 \) psi \( ell \)] #h(-0.16667em) upright(d) A = 0 . $ <eq:cap-identity>]

 Here $#h(-0.16667em) upright(d) ell$ is restricted to the tangent space.
   The first term does not depend on the scaling of the inward conormal.]
] <lem:cap-identity>

#proof[
  The identity is affine invariant up to the common area factor in (3.2),
    so it suffices to work on the original graph. Put $H = D^2 u$, write $o = \( o' \, o_(n + 1) \)$,
    and use $nu = \( - D u \, 1 \)$. Set
  $ q \( x \) = ell \( x \, u \( x \) \) \, wide Z \( x \) = nu \( o - X \) = o_(n + 1) -
    u + \( x - o' \) dot.op D u . $
  If $ell_z$ denotes the ambient vertical coefficient of $ell$, then
  $ D Z = H \( x - o' \) \, wide "tr" \( H^(- 1) D^2 Z \) = n + \( x - o' \) dot.op D log det H \, wide D^2 q =
    ell_z H . $
  Testing Lemma 9 with $Z psi \( q \)$ gives
  $ 0 = integral_M #scale(x: 120%, y: 120%)[\[] & Z \| #h(-0.16667em) upright(d) q \|_(H^(- 1))^2 psi'' \( q \) +
    n Z ell_z psi' \( q \) + 2 \( x - o' \) dot.op D q thin psi' \( q \)\
 & + n psi \( q \) + psi \( q \) \( x - o' \) dot.op D log det H #scale(x: 120%, y: 120%)[\]] thin #h(-0.16667em)
   upright(d) A . $
  Because $#h(-0.16667em) upright(d) A = \( det H \)^delta thin #h(-0.16667em) upright(d) x$,
    integration by parts in the last term replaces it by
  $ - delta^(- 1) [n psi \( q \) + \( x - o' \) dot.op D q thin psi' \( q \)] . $
  The coefficient of $psi$ is consequently $- n \( n + 1 \)$. The coefficient of $psi'$ is
  $ n #scale(x: 120%, y: 120%)[\[] Z ell_z - \( x - o' \) dot.op D q #scale(x: 120%, y: 120%)[\]] =
    n #scale(x: 120%, y: 120%)[\[] ell \( o \) - q #scale(x: 120%, y: 120%)[\]] . $
  This is (3.3). Compact support justifies both integrations by parts. ◻
]

#prodef([Remark 3.4.])[
  For later use, $psi$ may be convex and zero above a fixed cap height,
    without having compact support as a function on $bb(R)$. If that cap is compact,
    its restriction to $M$ satisfies the support condition in Lemma 11.
    Also, if $B_r \( o \) subset D'$, the supporting-plane inequality gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ nu \( o - X \) gt.eq r \| nu \| wide \( X in M \) . $ <eq:interior-support>]
] <rem:cap-tests>

== 4 An integral inequality for convex tubes <sec:tubes>

Let $E subset bb(R)^(n + 1)$ be a closed full-dimensional convex set whose boundary is smooth,
  has positive second fundamental form, and is stationary for affine area.
  In the applications, $E$ will be an affine image of the original epigraph. Fix a splitting

$ bb(R)^(n + 1) = bb(R)_s^k times bb(R)_y^m \, wide 2 lt.eq k lt.eq n \, wide m = n + 1 - k \, $

and an open box $cal(B) subset \( 0 \, oo \)^k$. Suppose that for every $s in cal(B)$ the fiber

$ K_s = { y in bb(R)^m : \( s \, y \) in E } $

is compact and contains $0$ in its interior. Our goal is the logarithmic inequality in Proposition 13,
  whose constant depends only on $n$, independently of the box and the shapes of its fibers.

=== 4.1 Support coordinates and invariant measures <support-coordinates-and-invariant-measures>

Fibers over compact subsets of $cal(B)$ are uniformly bounded.
  Otherwise there would be $\( s_j \, y_j \) in E$ with $s_j$ bounded and $\| y_j \| arrow.r oo$.
  After passage to a subsequence, $y_j \/ \| y_j \| arrow.r e in S^(m - 1)$.
  Fix $s_0 in cal(B)$, so that $\( s_0 \, 0 \) in E$. For every fixed $t gt.eq 0$, convexity and closedness give

$ \( s_0 \, t e \) =
  lim_(j arrow.r oo) [(1 - frac(t, \| y_j \|)) \( s_0 \, 0 \) + frac(t, \| y_j \|) \( s_j \, y_j \)] in E . $

This contradicts compactness of $K_(s_0)$. Thus the part of $E$ over any compact base subset is compact.

The projection of $partial E$ to the $s$ variables has full rank above $cal(B)$.
  Indeed, otherwise a conormal at such a point would have zero $y$ component.
  Its supporting hyperplane would then give a supporting hyperplane to the projection of $E$ at an interior point
  of that projection, which is impossible. Thus $partial K_s$ is smooth,
  and the restriction of the second fundamental form makes it strictly positively curved.
  Its outward Gauss map is a diffeomorphism onto $S^(m - 1)$ when $m > 1$.
  The Gauss maps also depend smoothly on $s$, since their angular differentials are invertible.
  Consequently the support function $h \( s \, e \) = max_(y in K_s) e dot.op y$ is smooth and positive on

$ cal(T) = cal(B) times S^(m - 1) \, $

and the corresponding part of $partial E$ is parametrized by

#[#set math.equation(numbering: n => "(4.1)")
 $ X \( s \, e \) = \( s \, Y \( s \, e \) \) \, wide Y = h e + nabla_S h . $ <eq:tube-parametrization>]

Here $nabla_S$ is the round connection. This support-function reconstruction and its angular matrix are classical;
  see, for example, #cite(label("TW2005")) preprint version, Section 7, Equations (7.15)–(7.17).
  We compute below how they enter the second form and affine-area density of the present tube.
  When $m = 1$, we regard $S^0 = { - 1 \, 1 }$ as the two outward directions of the interval $K_s$;
  Equation (4.1) then means $Y = h e$ on the two endpoint sheets.
  Throughout this section, angular matrices in this case have size zero, their determinants equal $1$,
  and angular derivatives, traces, and contractions equal $0$.
  The measure $#h(-0.16667em) upright(d) omega$ on $S^0$ is counting measure.

Set

$ B = - D_s^2 h \, wide R = nabla_S^2 h + h upright("Id") \, wide nu = \( D_s h \, - e \) . $

The identities $e dot.op Y = h$, $e dot.op Y_s = h_s$, and $e dot.op #h(-0.16667em) upright(d)_e Y =
  0$ show that $nu$ annihilates the tangent vectors of $X$.
  It is inward because the fiber lies on the side $e dot.op y lt.eq h \( s \, e \)$.
  Differentiating the same identities gives

$ nu X_(s_i s_j) = - h_(s_i s_j) \, wide nu X_(s_i e_a) = 0 \, wide nu X_(e_a e_b) = R_(a b) . $

For the last equality we used $#h(-0.16667em) upright(d)_e Y = R$ in round orthonormal frames.
  Thus the second form for this conormal is

#[#set math.equation(numbering: n => "(4.2)")
 $ H = "diag" \( B \, R \) . $ <eq:tube-second-form>]

Both blocks are positive definite. Taking $xi = \( 0 \, - e \)$ gives $nu xi =
  1$ and $\| det \( X_1 \, dots.h \, X_n \, xi \) \| = det R$. The affine-area formula therefore becomes

#[#set math.equation(numbering: n => "(4.3)")
 $ #h(-0.16667em) upright(d) A = I_0 thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega \, wide
   I_0 = \( det B \)^delta \( det R \)^(1 - delta) \, $ <eq:tube-area>]

where we used $\( n + 1 \) delta = 1 - delta$.

To compare fibers after linear normalizations, we also need a measure invariant under separate linear changes of
  $s$ and $y$. The vector $V = \( 0 \, - Y \)$ points from the fiber boundary toward its origin, and $nu V =
  h > 0$. Normalizing the conormal to take value $1$ on $V$ therefore defines the positive metric

$ G = H \/ h . $

Its Riemannian volume is

#[#set math.equation(numbering: n => "(4.4)")
 $ #h(-0.16667em) upright(d) mu = mu_0 thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega \,
   wide mu_0 = h^(- n \/ 2) sqrt(det B thin det R) . $ <eq:tube-volume>]

This definition makes $G$ and $mu$ invariant under separate invertible linear changes of $s$ and $y$.
  To check the normalization explicitly, let $\( s' \, y' \) = \( A s \, L y \)$ and, for an old unit normal $e$, put

$ t = \| L^(- sans(T)) e \| \, wide e' = L^(- sans(T)) e \/ t . $

The new support function obeys $h' \( A s \, e' \) = h \( s \, e \) \/ t$,
  and its conormal is $"diag" \( A \, L \)^(- sans(T)) nu \/ t$.
  Under the induced parameter map the new second form pulls back to $H \/ t$.
  Dividing it by $h' = h \/ t$ recovers $G$, including the change in angular parameters.

For $s$ covectors we henceforth use the inner product and norm given by $h B^(- 1)$,
  and for angular covectors those given by $h R^(- 1)$. We write both as $chevron.l dot.op \,
  dot.op chevron.r$ and $\| dot.op \|$, with the variables specifying the block. Thus, for example,

$ \| D_s g \|^2 = h thin \( D_s g \)^(sans(T)) B^(- 1) D_s g . $

All unqualified integrals below are over $cal(T)$. Every cutoff in the $s$ variables has compact support in
  $cal(B)$, so these integrals and the corresponding variations have compact support on the hypersurface.

=== 4.2 The stationarity equation in support coordinates <the-stationarity-equation-in-support-coordinates>

The support coordinates have identified both affine area and the invariant volume.
  We next express stationarity through their density ratio.
  This supplies the differential identity whose weighted integral will have a strictly positive quadratic part in
  dimensions three through nine.

We first record the cofactor identities needed for integration by parts.
  Since $B = D_s^2 \( - h \)$, its cofactor is divergence free in the flat variables. The angular tensor $R$ is Codazzi:

$ nabla_a R_(b c) = nabla_b R_(a c) . $

One way to see this is to differentiate $#h(-0.16667em) upright(d)_e Y = R$ in the ambient Euclidean space.
  Commuting the two derivatives of $Y$ and taking tangential components gives the displayed identity;
  the normal components cancel because $R$ is symmetric. Equivalently,
  the curvature terms from commuting third derivatives of $h$ cancel the derivatives of $h upright("Id")$.

For completeness, if $A$ is any symmetric Codazzi tensor of positive size $r$, its cofactor is divergence free.
  In normal orthonormal frames the cofactor is

$ \( "cof" A \)^(i j) = frac(1, \( r - 1 \) !) delta_(j j_2 dots.h.c j_r)^(i i_2 dots.h.c i_r) A_(i_2 j_2)
  dots.h.c A_(i_r j_r) \, $

where the symbol on the right is the alternating Kronecker symbol.
  On differentiating and contracting the derivative index with $i$,
  each resulting term contains $nabla_i A_(i_a j_a) = nabla_(i_a) A_(i j_a)$,
  symmetric in two indices against which that symbol is alternating. Each term is therefore zero.
  Symmetry gives the divergence identity in either contracted index.
  For $r = 1$ the cofactor is the constant $1$; for the empty angular block no identity is needed. In particular,

#[#set math.equation(numbering: n => "(4.5)")
 $ partial_(s_i) \( "cof" B \)^(i j) = 0 \, wide nabla_a \( "cof" R \)^(a b) = 0 . $ <eq:tube-cofactor-divergence>]

Define

#[#set math.equation(numbering: n => "(4.6)")
 $ a = (frac(det B, det R))^delta \, wide f = log \( a \/ h \) \, wide c = frac(n + 2, 2) . $ <eq:tube-af-definitions>]

The function $f$ records the ratio of affine area to invariant volume: by Equations (4.3) and (4.4),

$ frac(#h(-0.16667em) upright(d) A, #h(-0.16667em) upright(d) mu) =
  h^(n \/ 2) (frac(det B, det R))^(- n \/ \( 2 \( n + 2 \) \)) = (a / h)^(- n \/ 2) = e^(- n f \/ 2) . $

A variation $h + epsilon eta$, with $eta in C_c^oo \( cal(T) \)$,
  gives a compactly supported smooth variation of $X$. Positivity persists for sufficiently small $epsilon$ on its
  compact support. Differentiating Equation (4.3), using stationarity, and dividing by $delta$ gives

$ 0 = integral [- I_0 B^(- 1) : D_s^2 eta + \( n + 1 \) I_0 R^(- 1) : \( nabla_S^2 eta + eta upright("Id") \)]
  #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega . $

The colon denotes contraction in the indicated orthonormal frames. The scalar factors in this expression satisfy

$ I_0 B^(- 1) = \( "cof" B \) a^(- \( n + 1 \)) \, wide I_0 R^(- 1) = \( "cof" R \) a . $

Two integrations by parts using Equation (4.5) therefore yield

#[#set math.equation(numbering: n => "(4.7)")
 $ - \( "cof" B \) :
   D_s^2 \( a^(- \( n + 1 \)) \) + \( n + 1 \) \( "cof" R \) : \( nabla_S^2 a + a upright("Id") \) =
   0 . $ <eq:tube-euler>]

There is no angular boundary term. In the case $m = 1$, the calculation is performed separately on the two
  endpoint sheets and the second term is absent.

Writing $t = log a$, we have

$ D_s^2 \( a^(- \( n + 1 \)) \) & = \( n + 1 \) a^(- \( n + 1 \)) #scale(x: 120%, y: 120%)[\(] -
  D_s^2 t + \( n + 1 \) D_s t ⊗ D_s t #scale(x: 120%, y: 120%)[\)] \,\
nabla_S^2 a & = a #scale(x: 120%, y: 120%)[\(] nabla_S^2 t + nabla_S t ⊗ nabla_S t #scale(x: 120%, y: 120%)[\)] . $

Dividing Equation (4.7) by $\( n + 1 \) I_0$ gives

#[#set math.equation(numbering: n => "(4.8)")
 $ B^(- 1) : D_s^2 log a & - \( n + 1 \) \( D_s log a \)^(sans(T)) B^(- 1) D_s log a\
 + R^(- 1) : nabla_S^2 log a & + \( nabla_S log a \)^(sans(T)) R^(- 1) nabla_S log a + "tr" R^(- 1) =
   0 . $ <eq:tube-log-euler>]

Introduce

$ p = D_s log h \, wide d = D_s f \, wide p_e = nabla_S log h \, wide d_e = nabla_S f \,\
T_s g = h B^(- 1) : D_s^2 g \, wide T_e g = h R^(- 1) : nabla_S^2 g . $

Direct differentiation of $h$ gives

#[#set math.equation(numbering: n => "(4.9)")
 $ T_s log h = - k - \| p \|^2 \, wide T_e log h = n - k - h "tr" R^(- 1) - \| p_e \|^2 . $ <eq:tube-log-h>]

Substitute $log a = log h + f$ in Equation (4.8) and multiply by $h$.
  The angular trace and $\| p_e \|^2$ terms cancel, and Equation (4.9) gives

#[#set math.equation(numbering: n => "(4.10)")
 $ n - 2 k + T_s f - \| p \|^2 - \( n + 1 \) \| p + d \|^2 + T_e f + 2 chevron.l p_e \,
   d_e chevron.r + \| d_e \|^2 = 0 . $ <eq:tube-f-equation>]

=== 4.3 Weighted integration and coercivity <weighted-integration-and-coercivity>

Equation (4.10) contains derivatives with different drifts in the base and angular variables.
  We integrate with the invariant measure $mu$, retaining both drifts until the cancellation in Equation (4.15).
  The dimension restriction enters only in the quadratic form that remains.

The matrix densities for $T_s$ and $T_e$ relative to $#h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d)
  omega$ are

#[#set math.equation(numbering: n => "(4.11)")
 $ mu_0 h B^(- 1) = \( "cof" B \) h^(- n) e^(- c f) \, wide
   mu_0 h R^(- 1) = \( "cof" R \) h^2 e^(c f) . $ <eq:tube-matrix-densities>]

For example, the first follows from $sqrt(det R \/ det B) = a^(- c)$ and $h^(1 - n \/ 2) a^(- c) =
  h^(- n) e^(- c f)$; the second follows in the same way with the signs of the exponents reversed.

Let $v in C_c^oo \( cal(B) \)$. The logarithmic derivatives of the scalar factors in Equation (4.11) are $- n p -
  c d$ and $2 p_e + c d_e$, respectively. One integration by parts and Equation (4.5) therefore give,
  for every smooth $g$ on $cal(T)$,

#[#set math.equation(numbering: n => "(4.12)")
 $ integral v^2 T_s g thin #h(-0.16667em) upright(d) mu & =
   integral [v^2 chevron.l n p + c d \, D_s g chevron.r - 2 v chevron.l D_s v \, D_s g chevron.r] #h(-0.16667em)
   upright(d) mu \,\
integral v^2 T_e g thin #h(-0.16667em) upright(d) mu & = - integral v^2 chevron.l 2 p_e + c d_e \,
  nabla_S g chevron.r thin #h(-0.16667em) upright(d) mu . $ <eq:tube-integration-parts>]

The angular identity has no cutoff term because $v$ depends only on $s$.
  Taking $g = log h$ in the first identity and using Equation (4.9) yields

#[#set math.equation(numbering: n => "(4.13)")
 $ integral v^2 [k + \( n + 1 \) \| p \|^2 + c chevron.l d \, p chevron.r] #h(-0.16667em) upright(d) mu =
   2 integral v chevron.l D_s v \, p chevron.r thin #h(-0.16667em) upright(d) mu . $ <eq:tube-p-identity>]

Next integrate Equation (4.10) against $v^2$ and apply Equation (4.12) with $g = f$. Expanding the squares gives

#[#set math.equation(numbering: n => "(4.14)")
 $ integral v^2 #scale(x: 240%, y: 240%)[\[] n / 2 #scale(x: 120%, y: 120%)[\(] \| d \|^2 + \| d_e \|^2
   #scale(x: 120%, y: 120%)[\)] + \( n + 2 \) #scale(x: 120%, y: 120%)[\(] \| p \|^2 + chevron.l p \,
   d chevron.r #scale(x: 120%, y: 120%)[\)] - \( n - 2 k \) #scale(x: 240%, y: 240%)[\]] #h(-0.16667em) upright(d) mu\
= - 2 integral v chevron.l D_s v \, d chevron.r thin #h(-0.16667em) upright(d) mu . $ <eq:tube-d-identity>]

In particular, subtracting twice Equation (4.13) gives the exact cancellation

#[#set math.equation(numbering: n => "(4.15)")
 $ n / 2 integral v^2 #scale(x: 120%, y: 120%)[\(] \| d \|^2 + \| d_e \|^2 - 2 \| p \|^2 -
   2 #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) mu =  & - 2 integral v chevron.l D_s v \,
   d chevron.r thin #h(-0.16667em) upright(d) mu\
 & - 4 integral v chevron.l D_s v \, p chevron.r thin #h(-0.16667em) upright(d) mu . $ <eq:tube-cancellation>]

We combine these identities to control both the $mu$-mass and the derivative terms.
  For a parameter $lambda > 0$, add $2 lambda \/ n$ times Equation (4.15) to Equation (4.13).
  The resulting left integrand is

$ F_lambda = k - 2 lambda + \( n + 1 - 2 lambda \) \| p \|^2 + c chevron.l p \, d chevron.r +
  lambda #scale(x: 120%, y: 120%)[\(] \| d \|^2 + \| d_e \|^2 #scale(x: 120%, y: 120%)[\)] \, $

and the identity is

#[#set math.equation(numbering: n => "(4.16)")
 $ integral v^2 F_lambda thin #h(-0.16667em) upright(d) mu = integral v ⟨D_s v \, (2 - frac(8 lambda, n)) p -
   frac(4 lambda, n) d⟩ #h(-0.16667em) upright(d) mu . $ <eq:tube-coercive-identity>]

In an orthonormal frame for the $s$ covectors, the coefficient matrix for each paired component of $p \, d$ is

$ mat(delim: "(", n + 1 - 2 lambda, \( n + 2 \) \/ 4; \( n + 2 \) \/ 4, lambda) . $

At $lambda = 1$, its determinant is

$ n - 1 - frac(\( n + 2 \)^2, 16) = frac(\( n - 2 \) \( 10 - n \), 16) . $

This is positive for $3 lt.eq n lt.eq 9$, but the scalar term $k - 2$ vanishes when $k = 2$.
  Choosing $lambda$ slightly below one makes the scalar term positive while preserving the positive quadratic
  form. For the rest of the argument impose $3 lt.eq n lt.eq 9$ and fix $lambda = 15 \/ 16$,
  which works throughout this range. Then $k - 2 lambda gt.eq 1 \/ 8$, and the determinant satisfies

$ lambda \( n + 1 - 2 lambda \) - frac(\( n + 2 \)^2, 16) = frac(- 8 n^2 + 88 n - 137, 128) gt.eq 7 /
  128 wide \( 3 lt.eq n lt.eq 9 \) \, $

where the last inequality follows by concavity of the quadratic and its endpoint values.
  Both diagonal entries are positive. Thus there is a constant $kappa_n > 0$ such that

$ F_lambda gt.eq kappa_n #scale(x: 120%, y: 120%)[\(] 1 + \| p \|^2 + \| d \|^2 + \| d_e \|^2
  #scale(x: 120%, y: 120%)[\)] . $

Young’s inequality absorbs the right side of Equation (4.16), giving

#[#set math.equation(numbering: n => "(4.17)")
 $ integral v^2 #scale(x: 120%, y: 120%)[\(] 1 + \| p \|^2 + \| d \|^2 + \| d_e \|^2 #scale(x: 120%, y: 120%)[\)]
   thin #h(-0.16667em) upright(d) mu lt.eq C_n integral \| D_s v \|^2 thin #h(-0.16667em) upright(d) mu .
   $ <eq:tube-energy>]

All constants here depend only on $n$; the estimates are uniform for $2 lt.eq k lt.eq n$.

=== 4.4 The logarithmic inequality <the-logarithmic-inequality>

For $1 lt.eq i lt.eq k$, put $alpha_i = log s_i$ and define the measure

#[#set math.equation(numbering: n => "(4.18)")
 $ #h(-0.16667em) upright(d) sigma = (1 + sum_(i = 1)^k \| D_s log s_i \|^2) #h(-0.16667em) upright(d) mu \,
   wide \| D_s log s_i \|^2 = frac(h \( B^(- 1) \)_(i i), s_i^2) . $ <eq:log-measure>]

This measure is invariant under invertible linear changes in $y$ and positive diagonal changes in $s$:
  the metric $G$ and its volume are invariant, while each $alpha_i$ changes only by an additive constant.

#thm([Proposition 4.1.])[
  #emph[Let $3 lt.eq n lt.eq 9$ and $2 lt.eq k lt.eq n$. On any tube satisfying the hypotheses of this section,
    there is a constant $C_n$, depending only on $n$, such that every $tilde(v) in C_c^oo \( log cal(B) \)$ satisfies
#[#set math.equation(numbering: n => "(4.19)")
 $ integral_(cal(T)) tilde(v) \( log s \)^2 thin #h(-0.16667em) upright(d) sigma lt.eq
   C_n integral_(cal(T)) \| nabla tilde(v) \( log s \) \|_(bb(R)^k)^2 thin #h(-0.16667em) upright(d) sigma .
   $ <eq:log-inequality>]

 Here $log s = \( log s_1 \, dots.h \, log s_k \)$ and the gradient on the right is Euclidean.
   No completeness of the metric $G$ is required.]
] <prop:log-inequality>

#proof[
  Since $T_s alpha_i = - \| D_s alpha_i \|^2$, Equation (4.12) gives
  $ integral v^2 \| D_s alpha_i \|^2 thin #h(-0.16667em) upright(d) mu =  & - integral v^2 chevron.l n p + c d \,
    D_s alpha_i chevron.r thin #h(-0.16667em) upright(d) mu\
 & + 2 integral v chevron.l D_s v \, D_s alpha_i chevron.r thin #h(-0.16667em) upright(d) mu . $
  Young’s inequality, followed by Equation (4.17), therefore gives
  $ integral v^2 \| D_s alpha_i \|^2 thin #h(-0.16667em) upright(d) mu lt.eq
    C_n integral \| D_s v \|^2 thin #h(-0.16667em) upright(d) mu . $
  Summing these inequalities and the term controlling $integral v^2 #h(-0.16667em) upright(d)
    mu$ in Equation (4.17), we obtain
  $ integral v^2 thin #h(-0.16667em) upright(d) sigma lt.eq
    C_n integral \| D_s v \|^2 thin #h(-0.16667em) upright(d) mu . $
  Finally take $v \( s \) = tilde(v) \( log s \)$. The chain rule and Cauchy–Schwarz in the positive inner product
    $h B^(- 1)$ imply
  $ \| D_s v \|^2 & = lr(|sum_(i = 1)^k \( partial_i tilde(v) \) \( log s \) D_s alpha_i|)^2\
 & lt.eq \| nabla tilde(v) \( log s \) \|_(bb(R)^k)^2 sum_(i = 1)^k \| D_s alpha_i \|^2 . $
  Equation (4.19) follows from Equation (4.18). Every integration used a compactly supported cutoff on the smooth
    tube, which also proves the last assertion. ◻
]

== 5 Excluding models with several directions <sec:bounds>

We now combine the logarithmic inequality with estimates on smooth approximants of a model.
  All curvature quantities in this section belong to the approximants;
  no differentiability of the limiting body is used.

#thm([Proposition 5.1.])[
  #emph[Suppose $3 lt.eq n lt.eq 9$. The largest number of directions of a model in $cal(F) \( D \)$,
    in the sense of Definition 4, is one.]
] <prop:one-direction>

We first establish the area estimate that prevents the measures in the logarithmic inequality from vanishing.
  The comparison uses concavity of the affine-area integrand and stationarity,
  as in the local maximization argument of Trudinger and Wang #cite(label("TW2000")) Section 6,
  Equations (6.2)–(6.4). Here the comparison is applied to uniformly normalized caps of smooth approximants.

#thm([Lemma 5.2.])[
  #emph[Let $D_j$ be affine images of $D$ converging locally to a full-dimensional closed convex set $C$.
    Suppose that a nonzero linear function $ell$ and a number $b$ satisfy
$ C ∩ { ell lt.eq b } med upright("is compact") \, wide "int" C ∩ { ell < b } eq.not diameter . $

 There are $c > 0$ and $j_0$ such that
$ integral_(partial D_j ∩ { ell < b }) #h(-0.16667em) upright(d) A_j gt.eq c wide \( j gt.eq j_0 \) . $

]
] <lem:positive-cap-area>

#proof[
  Lemma 3 gives a uniform bound for these caps. Choose a closed ball $overline(B)_r \( o \)$ in $"int" C ∩ { ell <
    b }$. After decreasing $r$, the same ball lies in $D_j$ for all sufficiently large $j$.
    Fix $epsilon_0 > 0$ with $ell \( o \) lt.eq b - epsilon_0$.
  Let $e_j$ be the unit vector in the image of the original upward vertical direction under the affine map
    defining $D_j$. It is a recession direction of $D_j$, and $partial D_j$ is graphical along it.
    The component $ell \( e_j \)$ is bounded below by a positive constant.
    Indeed, the ray $o + t e_j$ lies in $D_j$; if $ell \( e_j \) lt.eq 0$, the whole ray lies in the cap,
    and otherwise its initial segment of length $\( b - ell \( o \) \) \/ ell \( e_j \)$ lies there.
    Uniform boundedness of the caps excludes both a nonpositive component and components tending to zero. Consequently
  $ V_j = frac(e_j, ell \( e_j \)) quad upright("satisfies") quad ell \( V_j \) = 1 \, wide \| V_j \| lt.eq C . $
  Use the coordinates
  $ X = zeta + tau V_j \, wide zeta in ker ell . $
  These coordinate maps and their inverses are uniformly bounded.
    With an orthonormal basis of $ker ell$, their determinants have absolute value $1 \/ \| ell \|$,
    where $\| ell \|$ is the Euclidean norm of the covector. In these coordinates $partial
    D_j$ is the graph of a smooth strictly convex function $g_j$, and the cap corresponds to $tau lt.eq b$.
  The sets
  $ E_j = { zeta : g_j \( zeta \) < b } $
  are uniformly bounded. Every closed sublevel of $g_j$ at a level at most $b$ is compact within its domain:
    its lifted graph lies in a compact cap, and the closed hypersurface $partial
    D_j$ is precisely the graph in this direction. Writing $zeta_j = o - ell \( o \) V_j$,
    the common interior ball gives
  $ g_j \( zeta \) lt.eq b - epsilon_0 wide #scale(x: 120%, y: 120%)[\(] zeta in B_(ker ell) \( zeta_j \, r \)
    #scale(x: 120%, y: 120%)[\)] . $
  Here $B_(ker ell) \( zeta_j \, r \)$ is the radius-$r$ ball in $ker ell$ centered at $zeta_j$.
    The centers $zeta_j$ and the sets $E_j$ are uniformly bounded.
    We may therefore choose one $alpha > 0$ so small that the quadratics
  $ q_j \( zeta \) = b - frac(2 epsilon_0, 3) + alpha \| zeta - zeta_j \|^2 $
  satisfy
  $ b - frac(2 epsilon_0, 3) lt.eq q_j lt.eq b - epsilon_0 / 3 wide upright("on ") E_j . $
  Let $chi$ be a smooth convex regularization of the positive part, with $0 lt.eq chi' lt.eq 1$,
    equal to $0$ for arguments at most $- eta$ and equal to the argument for arguments at least $eta$,
    where $0 < eta < epsilon_0 \/ 6$. On $E_j$ set
  $ tilde(g)_j = g_j + chi \( q_j - g_j \) . $
  This equals $q_j$ on the indicated base ball and equals $g_j$ near the level $b$.
    Extending by $g_j$ outside $E_j$ gives a smooth perturbation whose difference from $g_j$ has compact support
    in $E_j$. Its Hessian is positive definite, since it is a convex combination of $D^2 g_j$ and $D^2 q_j$,
    plus a positive semidefinite matrix.
  The function $F \( H \) = \( det H \)^delta$ is concave on positive definite matrices:
    the determinant $n$-th root is concave, and $n delta = n \/ \( n + 2 \) < 1$. Concavity and Lemma 9 give
  $ integral_(E_j) F \( D^2 tilde(g)_j \) thin #h(-0.16667em) upright(d) zeta & lt.eq
    integral_(E_j) F \( D^2 g_j \) thin #h(-0.16667em) upright(d) zeta\
 & quad + delta integral_(E_j) F \( D^2 g_j \) \( D^2 g_j \)^(- 1) :
   D^2 \( tilde(g)_j - g_j \) thin #h(-0.16667em) upright(d) zeta\
 & = integral_(E_j) F \( D^2 g_j \) thin #h(-0.16667em) upright(d) zeta . $
  The first integral is bounded below by $\| B_(ker ell) \( 0 \, r \) \| \( 2 alpha \)^(n delta) > 0$.
    Affine covariance of area, with the uniformly controlled coordinate determinants above, proves the assertion. ◻
]

=== 5.1 Positive mass away from the coordinate faces <positive-mass-away-from-the-coordinate-faces>

Fix a model $C$ with the maximal number $k$ of directions, and choose affine images $D_j arrow.r C$.
  Write its coordinates as $\( s \, y \) in bb(R)^k times bb(R)^m$, where $m = n + 1 - k$.
  Choose $b > 0$ so that the cap for $ell_0 \( s \) = s_1 + dots.h.c +
  s_k$ contains an interior ball strictly below its top. Such a choice is possible because $C$ has nonempty
  interior. The cap is compact by Definition 4. Lemma 15 gives

#[#set math.equation(numbering: n => "(5.1)")
 $ A_j #scale(x: 120%, y: 120%)[\(] partial D_j ∩ { ell_0 < b } #scale(x: 120%, y: 120%)[\)] gt.eq
   c > 0 $ <eq:cap-area-positive>]

for large $j$, and all these caps lie in a fixed ball.

For any fixed $0 < epsilon < 1$, convergence and the uniform cap bound imply that $s_i gt.eq -
  epsilon$ everywhere on the approximant caps once $j$ is sufficiently large.
  In the part where $s_i lt.eq epsilon$, stretch the single coordinate $s_i$ by $1 \/ epsilon$.
  The transformed boundary part lies in a fixed ball, independent of $epsilon$ and $j$.
  Lemma 10 and the $\| det L \|^(n delta)$ covariance of affine area give

#[#set math.equation(numbering: n => "(5.2)")
 $ A_j #scale(x: 120%, y: 120%)[\(] partial D_j ∩ { ell_0 < b \, med s_i lt.eq
   epsilon } #scale(x: 120%, y: 120%)[\)] lt.eq C epsilon^(n delta) . $ <eq:strip-area>]

Only the boundary part under consideration needs to lie in the ball.
  Choose $epsilon$ so small that the sum of these $k$ bounds is less than $c \/ 2$,
  and then choose $j$ large enough. Equations (5.1) and (5.2) leave area at least $c \/
  2$ in a fixed bounded region where all $s_i > epsilon$.

If $m = 0$, the model is the nonnegative orthant in $bb(R)^(n + 1)$.
  The remaining region is contained in a compact subset of its interior, which lies in $"int" D_j$ for large $j$.
  It cannot contain any points of $partial D_j$, a contradiction. Hence

#[#set math.equation(numbering: n => "(5.3)")
 $ k lt.eq n \, wide m gt.eq 1 . $ <eq:transverse-dimension>]

For the rest of the section, suppose that $k gt.eq 2$. On every fixed compact box of positive $s$’s,
  the fibers of $D_j$ are uniformly bounded and contain zero in their interiors for large $j$.
  This follows from Proposition 7, Lemma 5, and Lemma 3. Thus the tube coordinates and measures (4.3), (4.4),
  and (4.18) are available there. For a base set $E subset \( 0 \, oo \)^k$,
  write $mu_j \( E \)$ and $sigma_j \( E \)$ for the masses of $E times S^(m - 1)$. In particular, define

$ Q_L = { s in \( 0 \, oo \)^k : \| log s \|_oo lt.eq L } \, wide log s = \( log s_1 \, dots.h \, log s_k \) . $

The preceding area bound gives a fixed positive box $Q$ such that $integral_(Q times S^(m - 1)) I_0 thin
  #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega gt.eq c \/ 2$ for large $j$.
  On this box $h$ is uniformly bounded above, and

$ integral_(Q times S^(m - 1)) det R thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega lt.eq C . $

Indeed, $det R thin #h(-0.16667em) upright(d) omega$ is Euclidean area on the boundary of a uniformly bounded
  convex fiber. When $m = 1$, it is counting measure on the two endpoints, with $det R = 1$.
  Using the density $mu_0$ from (4.4), the exact factorization

$ I_0 = mu_0^(2 delta) h^(n delta) \( det R \)^(1 - 2 delta) $

and Hölder’s inequality yield

$ c / 2 lt.eq integral_(Q times S^(m - 1)) I_0 thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d)
  omega lt.eq C mu_j \( Q \)^(2 delta) . $

Since $sigma_j gt.eq mu_j$, enlarging $Q$ to a fixed $Q_(L_0)$ proves that there are $L_0 \, c_0 > 0$ with

#[#set math.equation(numbering: n => "(5.4)")
 $ sigma_j \( Q_(L_0) \) gt.eq c_0 wide upright("for all sufficiently large ") j . $ <eq:positive-log-mass>]

=== 5.2 A uniform bound on each logarithmic cell <a-uniform-bound-on-each-logarithmic-cell>

We now have positive mass in one fixed logarithmic box. To control growth,
  we need a bound for the mass of every cell that is independent of its logarithmic position.
  Centering provides this uniformity after affine normalization.
  The cap identity controls an inverse-Hessian integral, and bounds for Hessian minors provide the complementary
  factor in a weighted interpolation.

#thm([Lemma 5.3.])[
  #emph[There is a constant $C_(upright("cell"))$, independent of $a in bb(R)^k$, such that
$ sigma_j {s : 1 / 2 e^(a_i) lt.eq s_i lt.eq 2 e^(a_i) upright(" for every ") i} lt.eq C_(upright("cell")) $

 for every sufficiently large $j$. The threshold for $j$ may depend on $a$.]
] <lem:log-cell-bound>

#proof[
  Rescale $s_i$ by $e^(- a_i)$ and make an invertible linear change in $y$.
    By Corollary 8, these changes can be chosen so that the limit fiber above
    $upright(bold(1)) = \( 1 \, dots.h \, 1 \)$ satisfies
  $ B_(r_(*)) subset K_(upright(bold(1))) subset B_(R_(*)) \, $
  where $r_(*) \, R_(*) > 0$ are independent of $a$. We use the same affine change on the approximants.
    The measures $sigma_j$ are preserved by these normalizations.
  Corollary 8 also gives uniform fiber bounds on the fixed box $\[ 1 \/ 4 \, 4 \]^k$,
    uniform bounds for caps with fixed positive linear forms and fixed top levels,
    and a fixed interior ball centered at $o = \( upright(bold(1)) \, 0 \)$.
    Applying its approximation statement on a slightly larger positive box gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ 0 < c_1 lt.eq h lt.eq C_1 quad upright("on ") \[ 1 \/ 4 \, 4 \]^k times S^(m - 1) $ <eq:normalized-fiber-bounds>]
  and the same uniform cap and interior-ball bounds for all sufficiently large $j$.
    These constants are independent of $a$; only the required index depends on the normalization.
  Let $Q = \[ 1 \/ 2 \, 2 \]^k$ and $cal(T) = Q times S^(m - 1)$. By (4.18) and (5.5),
  $ sigma_j \( Q \) lt.eq C integral_(cal(T)) sqrt(det B thin det R) thin \( 1 + "tr" B^(- 1) \) thin
    #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega \, $
  since $s_i^(- 2) lt.eq 4$ on $Q$. To control the inverse-Hessian factor in this integral, we first prove
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_(cal(T)) I_0 thin "tr" B^(- 1) thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega
     lt.eq C . $ <eq:cap-inverse-hessian>]
  For $r = 1 \, dots.h \, k$, set
  $ a^(\( r \)) = upright(bold(1)) + e_r \, wide ell_r \( s \) = a^(\( r \)) dot.op s . $
  Their values on $Q$ lie in $J = \[ \( k + 1 \) \/ 2 \, thin 2 \( k + 1 \) \]$.
    Choose a smooth nonnegative function $rho$, compactly supported below a fixed number $b_0 > 2 \( k + 1 \)$,
    with $rho gt.eq 1$ on $J$, and put
  $ psi \( t \) = integral_t^(b_0) \( r - t \) rho \( r \) thin #h(-0.16667em) upright(d) r . $
  Then $psi'' = rho gt.eq 0$, and $psi$ vanishes above $b_0$.
    Although it is affine sufficiently far below, its surface test is compactly supported in the bounded cap
    $ell_r lt.eq b_0$. The functions $psi \, psi'$ and the levels $ell_r$ are bounded there by uniform constants.
  Apply Lemma 11 with the center $o$ of the fixed interior ball.
    If its radius is $r_0$, the supporting-plane inequality gives
  $ nu \( o - X \) gt.eq r_0 \| nu \| . $
  The integrand involving $psi''$ in that identity is nonnegative over the whole cap.
    On the tube, take the conormal $nu = \( D_s h \, - e \)$; it has norm at least one, and
  $ \| d ell_r \|_(H^(- 1))^2 = \( a^(\( r \)) \)^(sans(T)) B^(- 1) a^(\( r \)) . $
  The other terms in the cap identity have bounded integrals by Lemma 10 and the uniform cap bound. Hence
  $ integral_(cal(T)) I_0 thin \( a^(\( r \)) \)^(sans(T)) B^(- 1) a^(\( r \)) thin #h(-0.16667em) upright(d) s
    thin #h(-0.16667em) upright(d) omega lt.eq C . $
  Summing over $r$ proves (5.6), since
  $ sum_(r = 1)^k a^(\( r \)) \( a^(\( r \)) \)^(sans(T)) =
    upright("Id") + \( k + 2 \) upright(bold(1)) upright(bold(1))^(sans(T)) med gt.eq med upright("Id") . $
  We next claim that
  #[#set math.equation(numbering: n => "(5.7)")
   $ integral_(cal(T)) det B thin \( 1 + "tr" B^(- 1) \) thin #h(-0.16667em) upright(d) s thin #h(-0.16667em)
     upright(d) omega lt.eq C . $ <eq:hessian-minor-bound>]
  For each fixed $e$, the function $- h \( thin dot.op thin \, e \)$ is strictly convex.
    Its gradient is uniformly bounded on $Q$ by (5.5) on the larger box.
    For a principal minor, hold the unused $s$-coordinates fixed and consider the gradient in the selected
    coordinates. It is injective, because the corresponding Hessian is positive definite,
    and its image lies in a fixed bounded box. The change-of-variables formula bounds the integral of its
    Jacobian, which is precisely that principal minor. Integrating in the unused coordinates and in $e$ gives a
    uniform bound. The determinant itself is the full principal minor,
    and $det B thin "tr" B^(- 1)$ is the sum of the principal minors of order $k - 1$. This proves (5.7).
    As before, the uniform fiber bound also gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral_(cal(T)) det R thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega lt.eq
     C . $ <eq:fiber-area-bound>]
  Equations (5.7) and (5.8), together with Cauchy–Schwarz, give
  $ integral_(cal(T)) sqrt(det B thin det R) thin #h(-0.16667em) upright(d) s thin #h(-0.16667em) upright(d) omega
    lt.eq C . $
  For the inverse-Hessian weight, set
  $ theta = frac(1, 2 \( 1 - delta \)) = frac(n + 2, 2 \( n + 1 \)) \, wide t_B = "tr" B^(- 1) . $
  The interpolation identity is
  #[#set math.equation(numbering: n => "(5.9)")
   $ sqrt(det B thin det R) thin t_B = \( I_0 t_B \)^theta \( det B thin t_B \)^(1 - theta) .
     $ <eq:weighted-interpolation>]
  Since $0 < theta < 1$, Hölder’s inequality applied to (5.9), using (5.6) and (5.7), gives
  $ integral_(cal(T)) sqrt(det B thin det R) thin "tr" B^(- 1) thin #h(-0.16667em) upright(d) s thin
    #h(-0.16667em) upright(d) omega lt.eq C . $
  The last two bounds control both terms in the target integral and hence $sigma_j \( Q \)$.
    Its invariance under the preceding coordinate changes proves the lemma. ◻
]

=== 5.3 The growth contradiction <the-growth-contradiction>

#proof[
  A model with one direction exists by Lemma 2. Suppose that the maximal number $k$ is at least two,
    and fix the model and approximants used above. The case $k = n + 1$ has already been excluded in (5.3);
    hence $2 lt.eq k lt.eq n$.
  Covering a logarithmic box by finitely many of the cells in Lemma 16 gives a constant $C_(upright("box"))$ such
    that, for every fixed $L gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ sigma_j \( Q_L \) lt.eq C_(upright("box")) \( L + 1 \)^k wide
     upright("for every sufficiently large ") j . $ <eq:polynomial-log-growth>]
  The constant is independent of $L$ and $j$. The index threshold may depend on $L$,
    because only finitely many cells are involved for each fixed $L$.
    By increasing that threshold, the tube coordinates are also available on $Q_(L + 2)$.
  For an integer $l gt.eq 1$, choose a smooth cutoff $tilde(v)_l$ on $bb(R)^k$,
    equal to one on ${ \| t \|_oo lt.eq l }$, zero outside ${ \| t \|_oo < l + 1 }$,
    and with a uniformly bounded Euclidean gradient. Its gradient is supported in the intervening shell.
    Proposition 13, applied with $v_l \( s \) = tilde(v)_l \( log s \)$, implies
  $ sigma_j \( Q_l \) lt.eq C_(upright("grow")) #scale(x: 120%, y: 120%)[\(] sigma_j \( Q_(l + 1) \) -
    sigma_j \( Q_l \) #scale(x: 120%, y: 120%)[\)] $
  whenever the tube is available through $Q_(l + 1)$. Here $C_(upright("grow"))$ is independent of $l$ and $j$.
    Box boundaries have zero mass, because these measures have smooth densities in the tube coordinates.
    Writing $q = 1 + C_(upright("grow"))^(- 1) > 1$ and taking an integer $l_0 gt.eq max \( 1 \, L_0 \)$,
    iteration from (5.4) gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ sigma_j \( Q_L \) gt.eq c_0 q^(L - l_0) wide \( L gt.eq l_0 \, med L upright(" an integer") \)
     $ <eq:exponential-log-growth>]
  for approximants on which all the indicated estimates hold.
  Choose one finite integer $L$ large enough that
  $ c_0 q^(L - l_0) > C_(upright("box")) \( L + 1 \)^k . $
  Then choose one $j$ large enough for the initial mass bound, the finitely many cell bounds through $Q_L$,
    and tube coordinates through $Q_(L + 2)$. For this same $j$, (5.10) and (5.11) contradict each other.
    Thus no maximal model has $k gt.eq 2$, proving the proposition. ◻
]

== 6 Section balance and rigidity <sec:rigidity>

We now convert the exclusion of models with two or more directions into uniform control of tangent sections.
  This control supplies the modulus of convexity needed for the interior estimates of Trudinger and Wang.

#thm([Lemma 6.1.])[
  (Uniform balance of tangent sections).  #emph[There is a constant $0 < rho lt.eq 1$ such that,
    for every $a in Omega$ and $t > 0$, the compact convex body
$ K_a \( t \) = overline(S_u \( a \, t \)) - a $

 satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ - rho K_a \( t \) subset K_a \( t \) . $ <eq:uniform-section-balance>]

 The same $rho$ works for all base points and heights.]
] <lem:uniform-balance>

#proof[
  For a fixed $a$, use the ambient affine coordinates
  $ s = z - l_a \( x \) \, wide y = x - a . $
  The epigraph lies in $s gt.eq 0$, contains the ray ${ s gt.eq 0 \, med y = 0 }$,
    and has compact caps by Lemma 2. It is therefore a model with one direction,
    whose fiber at height $t$ is $K_a \( t \)$. Proposition 14 says that the maximal direction number is one.
    The uniformity over models and coordinates in Proposition 7 consequently gives $-
    K_a \( t \) subset C K_a \( t \)$ with one finite constant $C$.
    Taking $rho = min { 1 \, C^(- 1) }$ proves the claim. ◻
]

#thm([Lemma 6.2.])[
  (Doubling and extension of rays).  #emph[The domain is $Omega = bb(R)^n$.
    Moreover, there are constants $beta > 1$ and $A > 1$, depending only on $rho$,
    such that every tangent-subtracted line restriction
$ g \( r \) = u \( a + r e \) - u \( a \) - r thin D u \( a \) dot.op e $

 satisfies
#[#set math.equation(numbering: n => "(6.2)")
 $ g \( beta r \) lt.eq A g \( r \) wide \( r > 0 \) . $ <eq:gap-doubling>]

 One may take
#[#set math.equation(numbering: n => "(6.3)")
 $ beta = 1 + rho / 2 \, wide A = frac(\( 2 + rho \) \( 1 + rho \), rho) . $ <eq:doubling-constants>]

]
] <lem:doubling-entire>

#proof[
  Initially let $I = { r : a + r e in Omega }$, an open interval containing zero,
    and choose $R in I$ with $R > 0$. For $0 < r_0 < R$, the tangent section based at $a + r_0 e$ and having height
  $ b = r_0 g' \( r_0 \) - g \( r_0 \) > 0 $
  contains $a$ on its boundary. Applying (6.1) to the displacement $-
    r_0 e$ puts the displacement $rho r_0 e$ in the same translated section.
    In particular $\( 1 + rho \) r_0 in I$, and the section inequality gives
  $ g \( \( 1 + rho \) r_0 \) lt.eq \( 1 + rho \) r_0 g' \( r_0 \) . $
  Convexity and $g gt.eq 0$ give
  $ g' \( r_0 \) lt.eq frac(g \( R \) - g \( r_0 \), R - r_0) lt.eq frac(g \( R \), R - r_0) . $
  Set
  $ theta = frac(2 + rho, 2 \( 1 + rho \)) \, wide r_0 = theta R . $
  Then $\( 1 + rho \) theta = beta$, with $beta$ as in (6.3), and
  $ beta R in I \, wide g \( beta R \) lt.eq frac(beta, 1 - theta) g \( R \) = A g \( R \) . $
  Iterating the domain inclusion shows that the positive ray from $a$ in direction $e$ is contained in $Omega$.
    Every oriented direction admits an initial positive interval by openness, so all rays from $a$ lie in $Omega$.
    This proves $Omega = bb(R)^n$, as well as (6.2) on every ray. ◻
]

Fix a base point, translate it to zero, and subtract its tangent, so that $u \( 0 \) = 0$, $D u \( 0 \) = 0$,
  and $u gt.eq 0$. Each section $S_u \( 0 \, t \)$ can be normalized by a linear map that preserves zero,
  with constants uniform in $t$. For $K = overline(S_u \( 0 \, t \))$, apply Lemma 6 with $d = n$ and $C_(*) =
  rho^(- 1)$. It gives an invertible linear map $L$ with

$ overline(B_(2 rho \/ \( 1 + rho \))) subset L K subset overline(B_(2 n)) . $

A scalar adjustment therefore produces invertible maps $A_t$ and a fixed $R gt.eq 1$, depending only on $n \,
  rho$, for which

#[#set math.equation(numbering: n => "(6.4)")
 $ v_t \( y \) = t^(- 1) u \( A_t y \) \, wide B_1 subset S_(v_t) \( 0 \, 1 \) subset B_R . $ <eq:normalized-sections>]

The scalar adjustment may be made with a strict margin, so the inner inclusion holds for the open section.
  Balance and (6.2) are unchanged by these horizontal linear maps and positive vertical rescalings.

#thm([Lemma 6.3.])[
  (A uniform normalized modulus).  #emph[For all functions $v_t$ in (6.4),
    there is one positive function $b : \( 0 \, oo \) arrow.r \( 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(6.5)")
 $ S_(v_t) \( x \, b \( r \) \) subset x + B_r wide #scale(x: 120%, y: 120%)[\(] x in B_(1 \/ 4) \, med
   r > 0 #scale(x: 120%, y: 120%)[\)] . $ <eq:normalized-modulus>]

 In particular, with $gamma = \( 4 R \)^(- 1)$,
#[#set math.equation(numbering: n => "(6.6)")
 $ S_u \( x \, t b \( r \) \) subset x + r S_u \( 0 \, t \) wide
   #scale(x: 120%, y: 120%)[\(] x in gamma S_u \( 0 \, t \) \, med r \,
   t > 0 #scale(x: 120%, y: 120%)[\)] . $ <eq:uniform-strict-convexity>]

]
] <lem:normalized-modulus>

#proof[
  Write $v = v_t$. Since $v \( 0 \) = D v \( 0 \) = 0$ and $v lt.eq 1$ on $overline(B_1)$,
    convexity gives $0 lt.eq v \( x \) lt.eq 1 \/ 4$ on $B_(1 \/ 4)$. Fix such an $x$.
    For every unoriented line through $x$, choose its unit direction $e$ so that $D v \( x \) dot.op e lt.eq 0$.
    The ray in this direction meets $partial S_v \( 0 \, 1 \)$ at a distance at most $2 R$.
    At that intersection, its tangent-subtracted gap
  $ g_(x \, e) \( r \) = v \( x + r e \) - v \( x \) - r thin D v \( x \) dot.op e $
  is at least $1 - v \( x \) gt.eq 3 \/ 4$. Thus the positive-ray radius of the closed tangent section of height
    $1 \/ 4$, based at $x$, is at most $2 R$. Balance of that section bounds the opposite-ray radius by $2 R \/
    rho$: a point on the opposite ray, reflected and contracted by $rho$, must still fit on the first ray.
    Consequently every unit direction $e$ satisfies
  #[#set math.equation(numbering: n => "(6.7)")
   $ g_(x \, e) \( R_(*) \) gt.eq 1 / 4 \, wide R_(*) = frac(2 R, rho) . $ <eq:fixed-radius-gap>]
  The gap $g_(x \, e)$ is nondecreasing on the positive ray. Define
  #[#set math.equation(numbering: n => "(6.8)")
   $ N \( r \) = max {0 \, ⌈log_beta R_(*) / r⌉} \, wide b \( r \) = frac(1, 8 A^(N \( r \))) . $ <eq:explicit-modulus>]
  Iterating (6.2) and using (6.7) gives
  $ A^(N \( r \)) g_(x \, e) \( r \) gt.eq g_(x \, e) #scale(x: 120%, y: 120%)[\(] beta^(N \( r \)) r
    #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 4 . $
  Thus the tangent gap is at least $2 b \( r \)$ at every point of distance $r$ from $x$,
    and at every point farther away. This proves (6.5).
  If $x in gamma S_v \( 0 \, 1 \)$, then $\| x \| < 1 \/ 4$. Since $B_1 subset S_v \( 0 \, 1 \)$, we obtain
  $ S_v \( x \, b \( r \) \) subset x + B_r subset x + r S_v \( 0 \, 1 \) . $
  Applying $A_t$ gives (6.6). All constants and the function $b$ are independent of the height $t$,
    the base $x$ in the stated range, and the line direction. ◻
]

Condition (6.6) is precisely the uniform strict convexity condition of #cite(label("TW2000")) Condition (4.10),
  with base point zero. For the final step we use its underlying interior estimate,
  so that the effect of the section rescaling is explicit.

#thm([Theorem 6.4.])[
  (Trudinger–Wang interior estimate).  #emph[Let $O subset bb(R)^n$ be a bounded convex domain and let $f in
    C^4 \( O \)$ have positive-definite Hessian and solve the affine maximal equation.
    Suppose $- 1 lt.eq f lt.eq 0$. If a positive function $b_0$ gives the section control
$ S_(f \|_O) \( x \, b_0 \( r \) \) subset B_r \( x \) wide \( x in O \, med r > 0 \) \, $

 then $f in C^oo \( O \)$, and for each $O' subset.double O$ and integer $q gt.eq
   2$ there are positive constants $c \, C_q$ such that
$ D^2 f gt.eq c upright("Id") \, wide \| D^q f \| lt.eq C_q quad upright("on ") O' . $

 The constants depend only on $n$, $"diam" O$, $"dist" \( O' \, partial O \)$,
   and the specified lower modulus $b_0$, with additional dependence on $q$ for $C_q$.]
] <thm:tw-interior>

This is #cite(label("TW2000")) Theorem 4.2, stated in terms of a prescribed lower bound for the modulus of
  convexity. Its dimension is arbitrary. The sections $S_(f \|_O)$ here are taken within $O$.
  Its proof combines the linearized Monge–Ampère estimates of Caffarelli and
  Gutiérrez #cite(label("CaffarelliGutierrez1997")), Caffarelli’s Monge–Ampère regularity
  theory #cite(label("Caffarelli1990")), and Schauder estimates; see #cite(label("TW2000")) Section 4.
  The rescaling in the following proof is the reduction in #cite(label("TW2000")) Theorem 2.1 and its proof,
  with the uniform modulus now supplied by Lemma 19.

#proof[
  Proposition 14 applies for every $3 lt.eq n lt.eq 9$. Lemmas 17 and 18 therefore give $Omega =
    bb(R)^n$ and uniform section balance. Fix any base point, translate it to zero, subtract its tangent,
    and use the normalized functions $v_t$ from (6.4).
  These functions solve the same affine maximal equation. Indeed, for $v \( y \) = t^(- 1) u \( A y \)$, set
  $ c_t = t^(- n) \( det A \)^2 \, wide a = frac(n + 1, n + 2) . $
  Then
  $ w_v = c_t^(- a) w_u compose A \, wide U_v = t^(1 - n) \( det A \)^2 A^(- 1) \( U_u compose A \) A^(- sans(T)) \, $
  so the contraction $U_v^(i j) \( w_v \)_(i j)$ is a nonzero constant multiple of
    $\( U_u^(i j) \( w_u \)_(i j) \) compose A$, and vanishes.
    Subtracting an affine function leaves the equation unchanged as well.
  Apply Theorem 20 to $f_t = v_t - 1$ on $O = B_(1 \/ 4)$, with $O' = B_(1 \/ 8)$.
    There $- 1 lt.eq f_t lt.eq - 3 \/ 4$, and Lemma 19 supplies the same lower modulus at every point of $O$.
    Restricting a section to $O$ only decreases it. We obtain constants independent of $t$ such that
  #[#set math.equation(numbering: n => "(6.9)")
   $ D^2 v_t \( 0 \) gt.eq c_0 upright("Id") \, wide \| D^3 v_t \( 0 \) \| lt.eq
     C_0 . $ <eq:normalized-derivative-bounds>]
  Put $H = D^2 u \( 0 \) > 0$. The identity
  $ D^2 v_t \( 0 \) = t^(- 1) A_t^(sans(T)) H A_t $
  and the first bound in (6.9) imply
  $ t c_0 \| z \|^2 lt.eq \( A_t z \)^(sans(T)) H \( A_t z \) lt.eq lambda_max \( H \) \| A_t z \|^2 \, $
  and hence
  #[#set math.equation(numbering: n => "(6.10)")
   $ parallel A_t^(- 1) parallel lt.eq sqrt(lambda_max \( H \) \/ c_0) thin t^(- 1 \/ 2) .
     $ <eq:inverse-normalization-bound>]
  For any three vectors $z_1 \, z_2 \, z_3$, differentiation of $u \( x \) = t thin v_t \( A_t^(- 1) x \)$ gives
  $ D^3 u \( 0 \) \[ z_1 \, z_2 \, z_3 \] =
    t thin D^3 v_t \( 0 \) \[ A_t^(- 1) z_1 \, A_t^(- 1) z_2 \, A_t^(- 1) z_3 \] . $
  Equations (6.9) and (6.10) therefore give
  $ \| D^3 u \( 0 \) \| lt.eq C t^(- 1 \/ 2) arrow.r 0 wide upright("as ") t arrow.r oo . $
  The base point was arbitrary, so $D^3 u equiv 0$. Thus
  $ u \( x \) = 1 / 2 x^(sans(T)) Q x + b dot.op x + c $
  on $bb(R)^n$, with $Q > 0$. Its graph is an invertible affine image of ${ \( z \, \| z \|^2 \) :
    z in bb(R)^n }$, as required. ◻
]

=== The affine-complete consequence <the-affine-complete-consequence>

The graph theorem now gives the consequence announced in the introduction.
  The completeness and global graph results of Trudinger and Wang represent the hypersurface as a complete convex graph.

#thm([Corollary 6.5.])[
  (Affine-complete hypersurfaces).  #emph[Let $3 lt.eq n lt.eq 9$.
    Let $M$ be a smooth locally uniformly convex immersed hypersurface in $bb(R)^(n + 1)$ whose underlying
    manifold is connected and open (noncompact and without boundary).
    Suppose that $M$ is complete for the affine (Berwald–Blaschke) metric and is classically affine maximal
    (stationary for affine area under compactly supported smooth variations).
    Then $M$ is an invertible affine image of the standard elliptic paraboloid.]
] <cor:affine-complete>

#proof[
  By #cite(label("TW2002")) Theorem A, $M$ is complete for the induced Euclidean metric.
    By #cite(label("TW2002")) Corollary 1, an invertible affine change of coordinates gives an affine image
    $tilde(M)$ that is the global graph of a convex function $u$ over a nonempty open convex domain $Omega subset
    bb(R)^n$, not assumed to equal $bb(R)^n$. The linear part $L$ of this change uniformly compares Euclidean
    lengths by its least and greatest singular values, preserving completeness.
    By Equation (3.2), it multiplies affine area on compact patches by the fixed positive factor $\| det
    L \|^(n \/ \( n + 2 \))$, preserving stationarity. Smoothness and local uniform convexity give $u in
    C^oo \( Omega \)$ with positive-definite Hessian, and classical stationarity gives (1.1).
    Theorem 1 now implies $Omega = bb(R)^n$ and that $u$ is a quadratic polynomial with positive-definite Hessian.
    Undoing the affine change of coordinates proves the conclusion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
