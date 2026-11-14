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

#align(center)[#text(size: 16pt, weight: "bold")[The metric Blaschke theorem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

On a round sphere, every geodesic minimizes from its starting point to the antipode,
  at a distance equal to the diameter. The standard real, complex and quaternionic projective spaces and the
  Cayley plane have the same common minimizing-distance property.
  The metric Blaschke conjecture asks whether this property characterizes these compact rank-one symmetric spaces.

For a connected closed smooth Riemannian manifold $\( M \, g \)$, write

$ "inj" \( M \, g \) = inf_(p in M) "inj"_p \( M \, g \) \, wide "diam" \( M \, g \) =
  sup_(p \, q in M) d_g \( p \, q \) . $

Here $"inj"_p \( M \, g \)$ is the supremum of the radii on whose open tangent balls $exp_p$ is a diffeomorphism
  onto its image. We call $M$ a #emph[Blaschke manifold] if it has positive dimension and $"inj" \( M \, g \) =
  "diam" \( M \, g \)$. The global equality implies that every unit-speed geodesic minimizes precisely up to the
  common diameter; we give the short deduction in Lemma 4.

#thm([Theorem 1.1.])[
  (The metric Blaschke theorem).  #emph[Let $\( M \, g \)$ be a connected closed smooth Riemannian manifold of
    positive dimension. If $"inj" \( M \, g \) = "diam" \( M \, g \)$, then $\( M \, g \)$ is isometric,
    up to multiplication of the metric by a positive constant, to a round sphere, a standard real,
    complex or quaternionic projective space, or the Cayley plane.]
] <thm:blaschke>

The classification includes every quaternionic dimension. Its hypothesis is the global equality just defined.
  Classical Blaschke structure associates to $M$ a compact rank-one symmetric #emph[model] $M_0$ by its cut-locus
  and integral cohomology type. Throughout the volume comparisons,
  the standard metric $g_0$ on $M_0$ is scaled to have the same diameter as $\( M \, g \)$.
  Prime geodesics have length twice the diameter, so fixing the diameter is equivalent to fixing their prime period.

=== 1.1 The problem and its predecessors <the-problem-and-its-predecessors>

Blaschke’s original question concerned surfaces with a common reconvergence property for geodesics.
  Green settled the surface problem #cite(label("Blaschke1921")) #cite(label("Green1963"));
  the later geometric formulation and its development are described in #cite(label("Besse1978"), form: "prose")
  and in the corrected account of #cite(label("McKay2016"), form: "prose").
  The classical theory connects the minimizing condition to closed geodesics,
  smooth cut loci and fibrations of tangent spheres by great spheres.
  The topological restrictions of Bott and Samelson explain the appearance of the compact rank-one symmetric
  models #cite(label("Besse1978")) Theorem 7.2.

The sphere and real-projective metric cases were established through the work of Berger, Kazdan,
  Weinstein and Yang; see #cite(label("Besse1978"), form: "prose") Appendices D–E and
  #cite(label("McKay2016"), form: "prose") Sections 11–12. Berger’s sphere argument combines the geometric volume
  problem with Kazdan’s scalar integral inequality #cite(label("Berger1978AppendixD"))
  #cite(label("Kazdan1978AppendixE")). Berger subsequently proved the sharp isoembolic inequality by a weighted
  comparison of Jacobi determinants and Jensen’s inequality #cite(label("Berger1980")) pp. 263–264.
  These comparisons are central predecessors of the analytic part of the present proof.

Under additional hypotheses on families of totally geodesic round spheres of curvature $4$,
  #cite(label("RovenskiiToponogov1996"), form: "prose") Theorem 26,
  pp. 8–11 obtain a sharp projective volume comparison. Their Jacobi determinant splits into an exact
  curvature-$4$ factor and a complementary factor controlled by Kazdan’s inequality.
  Our fixed-chart Schur-complement argument uses the cut-time intersection pattern without requiring that
  geometric splitting.

For the projective models, it is useful to distinguish three kinds of information:
  topology, volume at a fixed geodesic period, and metric isometry.
  Yang proved that a Blaschke manifold of complex projective #emph[homotopy type] has the model volume at the same
  prime geodesic period #cite(label("Yang1991")) Theorem, p. 380.
  For the projective planes, smooth incidence geometry and the classification of
  #cite(label("KramerStolz2007"), form: "prose") Corollary C identify the point manifold diffeomorphically.
  Wilking records the equal-volume theorem for a manifold homeomorphic to a compact rank-one symmetric space whose
  unit geodesics all have the same least period, attributing it to Reznikov #cite(label("Wilking2001")) p. 282.
  Reznikov’s earlier work on the quaternionic weak Blaschke conjecture #cite(label("Reznikov1985HP")) is another
  predecessor of this volume approach. The homeomorphism hypothesis in the result recorded by Wilking,
  and the other hypotheses just stated, will be verified at their uses.
  In higher quaternionic dimensions our upper bound is intrinsic:
  it is proved from the Blaschke geometry and integral topology in Sections 6–9.

=== 1.2 Two volume bounds and their common equality case <two-volume-bounds-and-their-common-equality-case>

The first part of the proof establishes a comparison valid for every model type.

#thm([Theorem 1.2.])[
  (Sharp volume comparison).  #emph[Every Blaschke manifold and its model at the same diameter satisfy
$ "Vol" \( M \, g \) gt.eq "Vol" \( M_0 \, g_0 \) . $

 Equality holds if and only if $\( M \, g \)$ is isometric to $\( M_0 \, g_0 \)$.]
] <thm:comparison>

#thm([Corollary 1.3.])[
  (Reduction to an upper volume bound).  #emph[If a Blaschke manifold has volume at most that of its model at the
    same diameter, then it is isometric to that model.]
] <thm:volume-reduction>

After the circle, sphere and real-projective cases are separated,
  the analytic comparison in each remaining type starts along one closed geodesic.
  Normal Jacobi fields that vanish at a specified time form a Lagrangian plane in the symplectic space of Jacobi
  fields. A fixed graph chart separates the determinant of their endpoint pairing into a regular factor and a
  Schur-complement factor. The size of the Schur block is the dimension of the space of normal Jacobi fields
  vanishing at both the starting point and its cut point; the regular block has the complementary normal
  dimension. Both determinant factors can be bounded by scalar interval integrals,
  including when the actual endpoint order is reversed. This construction uses the cut-time intersection pattern;
  it does not require parallel eigenspaces of the curvature operator.

The resulting scalar estimates are combined by a logarithmic form of Kazdan’s weighted cancellation
  #cite(label("Kazdan1978AppendixE")) Appendix E, especially E.4–E.8.
  Its reflection symmetry cancels the integrated endpoint terms against interval averages.
  The scalar reference profiles are reciprocal-square sines,
  one on the full geodesic period and the other on a half-period.
  Folding the latter factor onto the two half-periods produces four weights,
  one for each choice of a half-period for each endpoint. Their equal,
  symmetric row and column sums allow both comparisons to contribute with the correct multiplicities.
  A nonnegative strict-convexity remainder records equality.
  Integrating over the unit tangent bundle gives the volume lower bound.
  Equality makes every radial volume density equal to its model value,
  and Szabó’s classification of compact simply connected harmonic manifolds then gives metric rigidity
  #cite(label("Szabo1990")) #cite(label("Szabo1988")).

The quaternionic upper bound has a different source. Fix dimension $4 r$, with $r gt.eq 2$.
  Pairs of points at the cut distance form a smooth incidence manifold.
  Its actual normal four-plane bundle identifies the great-three-sphere families of tangent directions.
  Two different direction planes at one point intersect only at zero.
  The rank of their complement forces a formula for the tangent Pontryagin class;
  the signature theorem and a uniform estimate in every rank then determine its coefficient.
  Characteristic-class and signature theory enter here in their usual integral and oriented forms
  #cite(label("MilnorStasheff1974")).

Next consider the space of oriented geodesics, forgetting the marked starting point.
  The period-normalized contact form expresses volume as a top power of the Euler class of its geodesic-circle
  bundle. Integral Gysin sequences first determine the lattice of classes and the determinant of a middle pairing.
  The first negative bundle of the free-loop energy transfers the incidence coefficient to this space.
  This step uses the fixed-endpoint Morse index theorem of #cite(label("Milnor1963"), form: "prose") and the
  equivariant negative-bundle attachment developed in closed-geodesic Morse theory;
  we use the formulation of #cite(label("OttosenBokstedt2007"), form: "prose") Section 7,
  following #cite(label("Klingenberg1978"), form: "prose").
  The required primitive attaching coefficient is established over every prime field.
  The attaching map from the sphere bundle of the descended negative bundle to $M$ also pulls back its cohomology
  generator; the vanishing of the $\( r + 1 \)$st power supplies the relations for the final algebraic
  calculation. Finally, a complete-intersection calculation turns the middle determinant into the sharp upper
  volume bound. Rational cohomology alone would not retain the arithmetic that normalizes this bound.

Section 2 fixes the geometric conventions. Sections 3 and 4 prove the geodesic comparison,
  and Section 5 completes its global volume and equality argument.
  Sections 6 and 7 establish the quaternionic characteristic class.
  Sections 8 and 9 convert it to the upper bound. Section 10 checks the remaining classical inputs and completes
  the metric classification.

=== 1.3 Recent related rigidity results <recent-related-rigidity-results>

There are also rigidity theorems with additional geometric hypotheses.
  Shankar, Spatzier and Wilking treat an upper sectional-curvature bound
  #cite(label("ShankarSpatzierWilking2005")) Proposition 2.1, and Su,
  Sun and Wang prove the corresponding normalized lower-curvature result #cite(label("SuSunWang2016")).
  Connell, Islam, Nguyen and Spatzier obtain rigidity under curvature bounds and agreement with a model away from
  a prescribed convex set #cite(label("ConnellIslamNguyenSpatzier2026")).

Song’s September 2026 preprint proves Blaschke metric rigidity assuming an adapted complex structure on the entire
  tangent bundle #cite(label("Song2026")) Theorem 1.3. This entire-extension hypothesis is additional to the
  Blaschke condition.

== 2 Blaschke geometry and model normalization <geom:section>

#thm([Lemma 2.1.])[
  #emph[Let $D = "inj" \( M \, g \) = "diam" \( M \, g \)$.
    Every unit-speed geodesic segment of length at most $D$ is minimizing.
    A segment of length less than $D$ is the unique minimizing segment between its endpoints,
    and no segment of length greater than $D$ is minimizing.]
] <geom:cut-time>

#proof[
  Compactness and positive dimension give $0 < D < oo$, and every pointwise injectivity radius is at least $D$.
    For $0 < t < D$, the exponential map at a point $p$ is injective and nonsingular on a tangent ball containing
    the sphere of radius $t$. A minimizing geodesic to $exp_p \( t v \)$ exists by completeness and has length at
    most $t$. Its initial vector lies in that ball and maps to the same endpoint as $t v$,
    so injectivity identifies the two vectors. This proves both minimality and uniqueness.
    Taking $t arrow.t D$ and using continuity of distance proves minimality at $D$.
    If a segment of length greater than $D$ minimized, the distance between its endpoints would exceed the diameter. ◻
]

In dimension one, a connected closed manifold is a circle.
  Arclength identifies its metric with a round circle of the same length. We henceforth suppose $n = dim M gt.eq 2$.

We use the following classical structure conclusions #cite(label("Besse1978")) Chapters 5 and 7.
  Precise statements in the corrected survey are #cite(label("McKay2016"), form: "prose") Section 4, Corollary 1,
  Theorem 1, and Sections 7, 11–12.

#thm([Proposition 2.2.])[
  (Classical Blaschke structure).  #emph[Every unit-speed geodesic is simply closed with period $2 D$.
    For each $p in M$, the map $v mapsto exp_p \( D v \)$ from $S_p
    M$ onto the cut locus is a smooth sphere fibration whose fibers are great spheres of one dimension $k$,
    independent of $p$. Its differential has nullity $k$. The model is determined as follows:]
  + #emph[If $k = n - 1$, the model is a sphere; if $k = 0$, it is a real projective space.
    In these two cases the metric classification is known: the manifold is isometric to its equally scaled model.]
  + #emph[If $0 < k < n - 1$, the manifold is simply connected and its integral cohomology ring has one generator
    of degree $k + 1$. The possibilities are complex-projective type, quaternionic-projective type,
    and Cayley-plane type, with the dimensions listed below.]
] <geom:structure>

The common period is the prime period, and each geodesic is simple.
  Indeed, if two distinct points of its parameter circle represented the same point of $M$,
  one of the two arcs between them would have length at most $D$ and positive length.
  Lemma 4 would make that arc minimizing between equal endpoints, a contradiction.
  This also explains the freeness of the period action used later.

The simple-connectivity assertion in the intermediate case also has a short topological explanation.
  The homotopy sequence of $S^k arrow.r S^(n - 1) arrow.r "Cut" \( p \)$ gives $pi_1 \( "Cut" \( p \) \) = 0$:
  the total sphere is simply connected and the fiber is connected.
  The exponential map identifies $M$ with the space obtained by attaching a closed $n$-ball to its cut locus along
  this fibration. Indeed, it gives a continuous bijection from that compact quotient to the Hausdorff manifold
  $M$, hence a homeomorphism. Attaching this $n$-cell does not change the fundamental group,
  since the intermediate cases have $n gt.eq 4$.

Only the intermediate cases require the new comparison. From now on rescale the metric so that

#[#set math.equation(numbering: n => "(2.1)")
 $ D = pi / 2 \, wide T = 2 D = pi \, wide d = n - 1 \, wide m = d - k . $ <geom:normalization>]

Both $m$ and $k$ are positive. The intermediate model data are

$ upright("model") & n & k & m\
bb(C) upright(P)^r med \( r gt.eq 2 \) & 2 r & 1 & 2 r - 2\
bb(H) upright(P)^r med \( r gt.eq 2 \) & 4 r & 3 & 4 r - 4\
bb(O) upright(P)^2 & 16 & 7 & 8 $

The projective lines are already included in the sphere case.

On a standard model at this scale, the normal radial curvature operator has parallel eigenspaces of dimensions $m$
  and $k$, with eigenvalues $1$ and $4$. Solving the scalar Jacobi equations with initial value zero and
  derivative one gives the polar density

#[#set math.equation(numbering: n => "(2.2)")
 $ w \( t \) = \( sin t \)^m lr(|frac(sin 2 t, 2)|)^k \, wide 0 lt.eq t lt.eq T . $ <geom:model-density>]

It is positive away from $0 \, D \, T$ and satisfies $w \( T - t \) = w \( t \)$.
  Let $sigma_d = \| S^d \|$ denote ordinary unit-sphere area. The model volume is

#[#set math.equation(numbering: n => "(2.3)")
 $ V_0 = sigma_d integral_0^D w \( t \) thin d t . $ <geom:model-volume>]

The eigenspace description is used only to calculate this model quantity.
  No curvature splitting or curvature bound is imposed on $M$.

Write $U = S M$, let $phi.alt_t$ be its geodesic flow, and use Liouville measure with unnormalized angular area:

#[#set math.equation(numbering: n => "(2.4)")
 $ d mu \( xi \) = d "vol"_g \( p \) thin d sigma_p \( xi \) \, wide xi in S_p M . $ <geom:liouville>]

This measure is invariant under the flow and has full support; if $V = "Vol" \( M \, g \)$, then $mu \( U \) =
  sigma_d V$. Proposition 5 gives $phi.alt_T = upright("Id")_U$.
  Below, all determinants of Jacobi tensors are taken in absolute value, including beyond the cut time.

== 3 A Lagrangian comparison along a closed geodesic <sec:lagrangian>

We work in the intermediate case

$ D = pi / 2 \, wide T = 2 D = pi \, wide d = n - 1 \, wide 0 < k < d \, wide m = d - k . $

Fix a unit-speed geodesic $gamma : bb(R) arrow.r M$. The structural conclusions in Proposition 5 give the common
  period $T$, the absence of conjugate points at separations in $\( 0 \, D \)$,
  and conjugate multiplicity $k$ at separation $D$. This section uses these geometric conclusions and the Jacobi
  equation. Its comparison requires no assumption about the volume of $M$.

The purpose of the construction is to separate a Jacobi determinant into two factors with different scalar
  comparison profiles. Unlike the curvature-invariant splitting supplied by the totally geodesic curvature-four
  sphere families of #cite(label("RovenskiiToponogov1996"), form: "prose") Theorem 26,
  this separation takes place in a fixed coordinate chart on the space of Jacobi fields.
  No splitting of the curvature operator is assumed.

=== 3.1 The symplectic curve of vanishing Jacobi fields <the-symplectic-curve-of-vanishing-jacobi-fields>

We use the classical symplectic description of Jacobi fields; see, for example,
  #cite(label("Zelditch2017Notes"), form: "prose") Sections 2.1.2 and 10.5.2 and the variational-index framework
  of #cite(label("Duistermaat1976"), form: "prose"). We derive the required identities to fix the signs and the
  normalization of the endpoint pairing.

Let $cal(J)$ be the real vector space of normal Jacobi fields along $gamma$.
  A prime on a field denotes covariant differentiation along $gamma$.
  Prescribing the normal pair $\( J \( t \) \, J' \( t \) \)$ at one time identifies $cal(J)$ with a vector space
  of dimension $2 d$. The form

#[#set math.equation(numbering: n => "(3.1)")
 $ omega \( I \, J \) = chevron.l I \, J' chevron.r - chevron.l I' \, J chevron.r $ <eq:lag-wronskian>]

is independent of the evaluation time: its derivative vanishes by the Jacobi equation and the self-adjointness of
  $X mapsto R \( X \, dot(gamma) \) dot(gamma)$. Evaluation of the initial data identifies it with the standard
  nondegenerate symplectic form.

For each $t in bb(R)$, set

$ L_t = { J in cal(J) : J \( t \) = 0 } . $

The Jacobi initial-value problem shows that $L_t$ depends smoothly on $t$, has dimension $d$,
  and is isotropic for $omega$. It is therefore Lagrangian. Its motion carries a natural positive inner product.
  For $I \, J in L_t$, choose a smooth local section $J_s in L_s$ with $J_t = J$, and define

$ G_t \( I \, J \) = omega \( I \, dot(J)_t \) \, wide dot(J)_t = frac(d, d s)\|_(s = t) J_s in cal(J) . $

The definition is independent of the extension: a section of $L_s$ vanishing as an element of $cal(J)$ at $s =
  t$ has derivative in $L_t$, which pairs to zero with $I$.
  Differentiating $J_s \( s \) = 0$ gives $dot(J)_t \( t \) = - J' \( t \)$.
  Since $I \( t \) = 0$, our sign convention yields

#[#set math.equation(numbering: n => "(3.2)")
 $ G_t \( I \, J \) = chevron.l I' \( t \) \, J' \( t \) chevron.r . $ <eq:lag-velocity>]

Thus $G_t$ is symmetric and positive definite, and $J mapsto
  J' \( t \)$ is an isometry from $\( L_t \, G_t \)$ to the normal space $dot(gamma) \( t \)^perp$.

We will need periodicity of the fields themselves. For any normal initial data $\( a \, b \)$ at time zero,
  the connection splitting of $T \( S M \)$ realizes $\( a \, b \)$ as the derivative of a smooth curve of unit
  initial velocities. The associated variation through unit-speed geodesics has Jacobi field with initial data
  $\( a \, b \)$; it is normal because its tangential component and its derivative vanish initially.
  All geodesics in this variation satisfy the same identity $phi.alt_T = upright("Id")_(S M)$.
  Differentiating that identity, or differentiating the equality of the varied positions and velocities after time
  $T$, gives

#[#set math.equation(numbering: n => "(3.3)")
 $ J \( t + T \) = J \( t \) \, wide J' \( t + T \) = J' \( t \) quad \( J in cal(J) \) . $ <eq:lag-periodicity>]

These are equalities in the same tangent space, since $gamma \( t + T \) = gamma \( t \)$.
  They do not assert that parallel transport around $gamma$ is the identity. In particular,

$ \( L_(t + T) \, G_(t + T) \) = \( L_t \, G_t \) . $

The intersection pattern is consequently

#[#set math.equation(numbering: n => "(3.4)")
 $ dim \( L_x ∩ L_y \) = cases(delim: "{", 0 \, & 0 < y - x < T \, quad y - x eq.not D \,, k \, & y - x = D .)
   $ <eq:lag-intersections>]

For $0 < y - x < D$, this is exponential nonsingularity. At separation $D$, evaluation at $y = x +
  D$ of the fields vanishing at $x$ identifies the kernel with the kernel of the angular differential of the
  cut-locus fibration, whose dimension is $k$. If $D < y - x < T$,
  a field in the intersection also vanishes at $x + T$ by (3.3); the separation from $y$ to $x +
  T$ is less than $D$, so the field is zero.

=== 3.2 The determinant and a fixed graph chart <the-determinant-and-a-fixed-graph-chart>

#thm([Proposition 3.1.])[
  (Jacobi determinant normalization).  #emph[Choose $G_x$- and $G_y$-orthonormal frames
    $Z_x = \( Z_(x \, 1) \, dots.h \, Z_(x \, d) \)$ and $Z_y = \( Z_(y \, 1) \, dots.h \, Z_(y \, d) \)$ of $L_x$
    and $L_y$. Then
#[#set math.equation(numbering: n => "(3.5)")
 $ f \( x \, y \) =
   lr(|det #scale(x: 120%, y: 120%)[\(] omega \( Z_(x \, a) \, Z_(y \, b) \)
   #scale(x: 120%, y: 120%)[\)]_(a \, b = 1)^d|) $ <eq:lag-f>]

 is independent of these choices. It is continuous, symmetric in its arguments, and separately $T$-periodic.
   It is the absolute normal Jacobi determinant at $y$ of fields vanishing at $x$ with orthonormal initial
   derivatives there. In particular, for $0 < y - x < D$ it is the polar volume density with respect to $d
   t$ and ordinary sphere area at $gamma \( x \)$.]
  #emph[Use the same orthonormal basis of $dot(gamma) \( 0 \)^perp$ for the coordinates
$ \( q \, p \) = \( J \( 0 \) \, J' \( 0 \) \) in bb(R)^d xor bb(R)^d \, $

 choosing its first $k$ vectors to be the initial derivatives of a basis of $L_0 ∩ L_D$. On
$ cal(I) = \( 0 \, D \) union \( D \, T \) $

 there is a smooth symmetric matrix $A \( t \)$ such that $L_t = { \( q \, A \( t \) q \) : q in bb(R)^d }$,
   and $A' \( t \) > 0$. For $x \, y in cal(I)$,
#[#set math.equation(numbering: n => "(3.6)")
 $ f \( x \, y \) = frac(\| det \( A \( y \) - A \( x \) \) \|, sqrt(det A' \( x \) det A' \( y \))) .
   $ <eq:lag-graph-determinant>]

]
] <lag:determinant>

#proof[
  Changing either orthonormal frame multiplies the pairing matrix by an orthogonal matrix.
    This leaves its absolute determinant unchanged. Local smooth orthonormal frames exist,
    so $f$ is continuous even when the pairing is singular. Skew-symmetry of $omega$ replaces the matrix by its
    negative transpose when the arguments are exchanged, proving symmetry. Periodicity follows from (3.3) and (3.2).
  Evaluation of the pairing at $y$ gives
  $ omega \( Z_(x \, a) \, Z_(y \, b) \) = chevron.l Z_(x \, a) \( y \) \, Z'_(y \, b) \( y \) chevron.r . $
  The vectors $Z'_(y \, b) \( y \)$ form an orthonormal normal basis,
    and the fields $Z_(x \, a)$ have zero values and orthonormal derivatives at $x$.
    This proves the claimed determinant interpretation. More explicitly,
    an angular variation of a unit direction with derivative $e$ gives the Jacobi field $J$ with $J \( x \) =
    0$ and $J' \( x \) = e$. Its value at $x + r$ is the angular derivative of
    $exp_(gamma \( x \)) \( r thin dot.op \)$. Together with the unit radial derivative and Gauss’s lemma,
    this gives the polar density $f \( x \, x + r \) thin d r thin d sigma$.
    There is no additional power of $r$ in this polar formula;
    the Cartesian normal-coordinate density would be $f \( x \, x + r \) \/ r^d$.
  In the stated coordinates,
  $ omega \( \( q \, p \) \, \( tilde(q) \, tilde(p) \) \) = q^(sans(T)) tilde(p) - p^(sans(T)) tilde(q) \, wide
    L_0 = { q = 0 } . $
  Equation (3.4) makes $L_t$ transverse to $L_0$ for $t in cal(I)$, proving the graph representation.
    Isotropy is equivalent to $A = A^(sans(T))$. For the graph frame $E_t q = \( q \, A \( t \) q \)$,
  $ G_t \( E_t q \, E_t r \) = q^(sans(T)) A' \( t \) r \, wide omega \( E_x q \, E_y r \) =
    q^(sans(T)) \( A \( y \) - A \( x \) \) r . $
  Positivity of $G_t$ gives $A' \( t \) > 0$. The frames $E_t A' \( t \)^(- 1 \/ 2)$ are orthonormal for $G_t$,
    so taking determinants in the last identity proves (3.6). ◻
]

The coordinate basis is now fixed. Split both $q$ and $p$ into their first $k$ and last $m$ coordinates and write

#[#set math.equation(numbering: n => "(3.7)")
 $ A \( t \) = mat(delim: "(", V_b \( t \), C \( t \); C \( t \)^(sans(T)), H \( t \)) \, wide S \( t \) =
   V'_b \( t \) - C' \( t \) H' \( t \)^(- 1) C' \( t \)^(sans(T)) . $ <eq:lag-blocks>]

The subscript in $V_b$ distinguishes this matrix from the volume of the manifold.
  Here $H$ is an $m times m$ matrix and $S$ is a $k times k$ matrix.
  Positive definiteness of $A'$ and block elimination give

#[#set math.equation(numbering: n => "(3.8)")
 $ H' \( t \) > 0 \, wide S \( t \) > 0 \, wide det A' \( t \) =
   det H' \( t \) det S \( t \) quad \( t in cal(I) \) . $ <eq:lag-velocity-factorization>]

For comparison, on the standard model the adapted chart has

$ A_(upright("mod")) \( t \) = "diag" #scale(x: 120%, y: 120%)[\(] - 2 cot \( 2 t \) upright("Id")_k \, -
  cot \( t \) upright("Id")_m #scale(x: 120%, y: 120%)[\)] . $

Thus $H'_(upright("mod")) \( t \) = csc^2 \( t \) upright("Id")_m$ and $S_(upright("mod")) \( t \) =
  4 csc^2 \( 2 t \) upright("Id")_k$. These formulas motivate the scalar reference profiles below.

=== 3.3 The chart poles and determinant-root profiles <the-chart-poles-and-determinant-root-profiles>

The curve $L_t$ remains smooth at $0 \, D \, T$; it is the projection from $L_t$ to the fixed $q$-coordinate space
  that ceases to be invertible. Its kernel has dimension $d$ at $0 \, T$ and dimension $k$ at $D$.
  The following expansion shows how this loss of transversality enters $A$:
  at $D$ the pole lies entirely in the first $k$ coordinates, while the complementary block $H$ remains regular.
  Smooth remainders are needed because the comparison uses derivatives of the graph matrices.

#thm([Lemma 3.2.])[
  (Pole expansions).  #emph[There is a positive definite $k times
    k$ matrix $B$ such that the graph matrix has the expansions
#[#set math.equation(numbering: n => "(3.9)")
 $ A \( t \) & = - frac(1, t - D) mat(delim: "(", B, 0; 0, 0) + R_D \( t \) \, &  & upright("near ") D \,\
A \( t \) & = - frac(1, t - t_0) upright("Id")_d + R_(t_0) \( t \) \, &  & upright("near ") t_0 = 0 \, T \,
  $ <eq:lag-middle-pole>]

 where each remainder extends smoothly across its indicated point.
   In particular, $C$ and $H$ extend smoothly across $D$, and $H' \( D \) > 0$.]
] <lag:poles>

#proof[
  Put $tau = t - D$. Choose a local smooth frame of $L_t$, written as the columns of
  $ F \( t \) = vec(X \( t \), P \( t \)) \, $
  whose first $k$ columns at $D$ are the vertical vectors $\( 0 \, e_a \)$ for $1 lt.eq a lt.eq k$.
    These are exactly the chosen coordinate basis of $L_0 ∩ L_D$.
    Isotropy with these vectors forces every vector in the image of $X \( D \)$ to have its first $k$ coordinates
    zero. The kernel of the value projection on $L_D$ is $L_0 ∩ L_D$,
    so that image has dimension $m$ and is the entire last coordinate space.
    Choose the remaining frame columns so that their value projections give a basis of this image.
    In blocks, their last $m$ value coordinates form an invertible matrix $M$.
  The first $k$ columns of $X \( D \)$ vanish. Dividing these columns by $tau$ gives a smooth matrix
    $tilde(X) \( t \)$ satisfying
  $ X \( t \) = tilde(X) \( t \) mat(delim: "(", tau upright("Id")_k, 0; 0, upright("Id")_m) . $
  Let $G$ be the matrix of $G_D$ on the first $k$ frame vectors.
    For $1 lt.eq a \, b lt.eq k$, the definition of the velocity form in the fixed coordinates gives
  $ G_(a b) = omega \( \( 0 \, e_a \) \, dot(F)_b \( D \) \) = - e_a^(sans(T)) X'_b \( D \) . $
  Consequently
  #[#set math.equation(numbering: n => "(3.10)")
   $ tilde(X) \( D \) = mat(delim: "(", - G, 0; N, M) \, wide G > 0 \, quad M upright(" invertible") \,
     $ <eq:lag-divided-frame>]
  for some matrix $N$. In particular $tilde(X) \( D \)$ is invertible. For $tau eq.not 0$ sufficiently small,
  $ A \( t \) = P \( t \) mat(delim: "(", tau^(- 1) upright("Id")_k, 0; 0, upright("Id")_m) tilde(X) \( t \)^(- 1) . $
  To identify its residue, let $P_1 \( t \)$ denote the first $k$ columns of $P \( t \)$ and let $U_1 \( t \)$
    denote the first $k$ rows of $tilde(X) \( t \)^(- 1)$. Then the only possibly singular summand is $tau^(- 1)
    P_1 \( t \) U_1 \( t \)$. At $D$,
  $ P_1 \( D \) = vec(upright("Id")_k, 0) \, wide U_1 \( D \) = mat(delim: "(", - G^(- 1), 0) . $
  Their product is $- "diag" \( G^(- 1) \, 0 \)$. The difference $P_1 \( t \) U_1 \( t \) -
    P_1 \( D \) U_1 \( D \)$ divided by $tau$ is smooth, as is the summand from the other frame columns.
    This proves (3.9) with $B = G^(- 1) > 0$, including the absence of any off-diagonal residue.
  For fixed $z in bb(R)^m$, the graph vectors
  $ E_z \( t \) = (vec(0, z) \, vec(C \( t \) z, H \( t \) z)) $
  extend smoothly through $D$. Their limits lie in $L_D$ by continuity of $L_t$, and are nonzero if $z eq.not 0$.
    The velocity identity in the fixed symplectic coordinates, now also at $D$, gives
  $ z^(sans(T)) H' \( D \) z = omega \( E_z \( D \) \, dot(E)_z \( D \) \) =
    G_D \( E_z \( D \) \, E_z \( D \) \) > 0 . $
  This proves strict positivity of the extended derivative.
  At $t_0 = 0$, take a frame whose value at $0$ is the whole vertical coordinate basis.
    All $X$-columns then vanish at $0$. The velocity metric on this basis is $upright("Id")_d$ by (3.2);
    hence $X' \( 0 \) = - upright("Id")_d$ and $P \( 0 \) = upright("Id")_d$.
    Dividing all value columns by $t$ and repeating the preceding calculation gives residue $- upright("Id")_d$.
    At $t_0 = T$, periodicity identifies both $L_T$ and its velocity metric with their values at zero in these
    same fixed coordinates. The same argument gives residue $- upright("Id")_d$ there, proving (3.9). ◻
]

#thm([Proposition 3.3.])[
  (Scalar profiles).  #emph[Define
#[#set math.equation(numbering: n => "(3.11)")
 $ h \( t \) & = det \( H' \( t \) \)^(1 \/ m) &  & \( 0 < t < T \) \,\
s \( t \) & = det \( S \( t \) \)^(1 \/ k) &  & \( t in cal(I) \) \,\
s_i \( t \) & = s \( t + i D \) &  & \( 0 < t < D \, med i = 0 \, 1 \) . $ <eq:lag-profiles>]

 The function $h$ is smooth and positive across $D$. There are positive constants $c_H \, C_H \, c_i \, C_i$,
   depending on the fixed geodesic and its chart, such that
#[#set math.equation(numbering: n => "(3.12)")
 $ c_H & lt.eq h \( t \) sin^2 t lt.eq C_H &  & \( 0 < t < T \) \,\
c_i & lt.eq frac(s_i \( t \) sin^2 \( 2 t \), 4) lt.eq C_i &  & \( 0 < t < D \, med i = 0 \, 1 \) . $ <eq:lag-h-bounds>]

 Equivalently, the logarithms of the ratios of $h$ to $1 \/ sin^2 t$ and of $s_i$ to $4 \/
   sin^2 \( 2 t \)$ are bounded.]
] <lag:profiles>

#proof[
  Lemma 7 and (3.8) show that $H'$ is positive throughout $\( 0 \, T \)$, including $D$.
    Near $t_0 = 0 \, T$, put $tau = t - t_0$. Differentiating the smooth-remainder expansion gives
  $ H' \( t \) = tau^(- 2) upright("Id")_m + O \( 1 \) \, wide V'_b \( t \) = tau^(- 2) upright("Id")_k +
    O \( 1 \) \, wide C' \( t \) = O \( 1 \) . $
  Here and below $O \( 1 \)$ denotes a matrix bounded in operator norm as the indicated time is approached.
    Since $H' \( t \)^(- 1) = O \( tau^2 \)$, the Schur complement satisfies
  #[#set math.equation(numbering: n => "(3.13)")
   $ S \( t \) = tau^(- 2) upright("Id")_k + O \( 1 \) wide \( t arrow.r 0 \, T \) . $ <eq:lag-S-end>]
  At $D$, both $C'$ and $H'$ are smooth and $H' \( D \)$ is invertible. The middle pole therefore yields
  #[#set math.equation(numbering: n => "(3.14)")
   $ S \( t \) = \( t - D \)^(- 2) B + O \( 1 \) wide \( t arrow.r D \) . $ <eq:lag-S-middle>]
  Taking determinant roots gives the positive limits
  $ & upright("left endpoint") & upright("right endpoint")\
h \( t \) sin^2 t quad \( 0 < t < T \) & 1 & 1\
s_0 \( t \) sin^2 \( 2 t \) \/ 4 quad \( 0 < t < D \) & 1 & det \( B \)^(1 \/ k)\
s_1 \( t \) sin^2 \( 2 t \) \/ 4 quad \( 0 < t < D \) & det \( B \)^(1 \/ k) & 1 . $
  Each ratio thus extends continuously and positively to its compact closed interval.
    Its minimum and maximum supply the stated bounds. ◻
]

=== 3.4 Schur complements for arbitrary endpoint order <schur-complements-for-arbitrary-endpoint-order>

The Schur complement and determinant-root concavity are standard matrix tools #cite(label("BoydVandenberghe2004"))
  Appendix A.5.5 and Exercises 3.18(b), 3.26(b). Here the essential point is to apply the factorization with
  either actual endpoint order. We retain the matrix calculation so that its signs and integration paths are explicit.

For distinct $x \, y in cal(I)$, use $Delta$ to denote the difference of the values at $y$ and $x$.
  Since $H$ is smooth and $H' > 0$ throughout $\( 0 \, T \)$,

#[#set math.equation(numbering: n => "(3.15)")
 $ Delta H = H \( y \) - H \( x \) = integral_x^y H' \( t \) thin d t $ <eq:lag-H-difference>]

is positive definite for $y > x$ and negative definite for $y < x$.
  In particular it is invertible in either order. Define

#[#set math.equation(numbering: n => "(3.16)")
 $ Q \( x \, y \) = Delta V_b - \( Delta C \) \( Delta H \)^(- 1) \( Delta C \)^(sans(T)) . $ <eq:lag-Q>]

Thus $Q$ is the Schur complement of the regular block in the endpoint difference $Delta A$,
  whereas $S$ in (3.7) is the Schur complement in the velocity $A'$.
  The next proposition relates them by differentiating in either endpoint;
  the diagonal and cut-pair zeros of $Q$ then anchor the two interval bounds.

#thm([Proposition 3.4.])[
  (Two Schur-complement bounds).  #emph[The matrix $Q \( x \, y \)$ is symmetric and satisfies
#[#set math.equation(numbering: n => "(3.17)")
 $ det \( Delta A \) = det \( Delta H \) det Q \( x \, y \) \, wide Q \( y \, x \) = -
   Q \( x \, y \) . $ <eq:lag-Schur-factorization>]

 It extends continuously by zero to $y = x in cal(I)$, and
#[#set math.equation(numbering: n => "(3.18)")
 $ Q \( u \, u + D \) = Q \( u + D \, u \) = 0 wide \( 0 < u < D \) . $ <eq:lag-Q-zeros>]

 Whenever its distinct endpoints remain in $cal(I)$, it obeys the positive-semidefinite matrix inequalities
#[#set math.equation(numbering: n => "(3.19)")
 $ partial_y Q \( x \, y \) gt.eq S \( y \) \, wide - partial_x Q \( x \, y \) gt.eq
   S \( x \) . $ <eq:lag-Q-derivatives>]

 Consequently, for every $0 < u < v < D$ and $i \, j in { 0 \, 1 }$,
#[#set math.equation(numbering: n => "(3.20)")
 $ Q \( u + i D \, v + j D \) & gt.eq integral_u^v S \( t + j D \) thin d t \,\
Q \( u + i D \, v + j D \) & gt.eq integral_u^v S \( t + i D \) thin d t . $ <eq:lag-Q-bound-j>]

 In particular, this $Q$ is positive definite for all four choices of $i \, j$, including $i = 1 \, j = 0$.]
] <lag:schur>

#proof[
  With $R = \( Delta C \) \( Delta H \)^(- 1)$, block congruence gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ mat(delim: "(", upright("Id")_k, - R; 0, upright("Id")_m) \( Delta A \)
     mat(delim: "(", upright("Id")_k, 0; - R^(sans(T)), upright("Id")_m) =
     mat(delim: "(", Q, 0; 0, Delta H) . $ <eq:lag-block-congruence>]
  This proves the determinant identity and identifies the nullity of $Delta A$ with that of $Q$.
    Exchanging the endpoints changes the sign of each difference, and hence changes $Q$ to $- Q$.
  For a matched pair $\( u \, u + D \)$, the kernel of $Delta A$ parametrizes $L_u ∩
    L_(u + D)$ by the common $q$ coordinate. It has dimension $k$ by (3.4).
    The matrix $Q$ has size $k times k$ and therefore has full nullity: it is the zero matrix.
    This proves (3.18), also in the reversed order. Near a diagonal point within the chart, Taylor expansion gives
  $ Delta H = \( y - x \) H' \( x \) + O \( \( y - x \)^2 \) \, quad Delta C = \( y - x \) C' \( x \) +
    O \( \( y - x \)^2 \) \, $
  and the corresponding expansion for $Delta V_b$. Invertibility of $H' \( x \)$ then gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ Q \( x \, y \) = \( y - x \) S \( x \) + O \( \( y - x \)^2 \) . $ <eq:lag-Q-diagonal>]
  This establishes the zero extension needed at the endpoints of the integrations below.
  Direct differentiation of (3.16), using $partial_y \( Delta H \)^(- 1) = - \( Delta H \)^(- 1)
    H' \( y \) \( Delta H \)^(- 1)$, gives
  $ partial_y Q & = V'_b \( y \) - C' \( y \) R^(sans(T)) - R C' \( y \)^(sans(T)) + R H' \( y \) R^(sans(T))\
 & = mat(delim: "(", upright("Id")_k, - R) A' \( y \) vec(upright("Id")_k, - R^(sans(T))) . $
  The identical calculation with $- partial_x$ gives the same expression with $A' \( x \)$.
    For either endpoint $a = x$ or $a = y$, completing the square gives the exact identity
  #[#set math.equation(numbering: n => "(3.23)")
   $ & mat(delim: "(", upright("Id")_k, - R) A' \( a \) vec(upright("Id")_k, - R^(sans(T)))\
 & quad = S \( a \) + #scale(x: 120%, y: 120%)[\(] R - C' \( a \) H' \( a \)^(- 1) #scale(x: 120%, y: 120%)[\)]
   H' \( a \) #scale(x: 120%, y: 120%)[\(] R - C' \( a \) H' \( a \)^(- 1)
   #scale(x: 120%, y: 120%)[\)]^(sans(T)) . $ <eq:lag-square-completion>]
  The second summand is positive semidefinite. This proves (3.19).
    The calculation used invertibility of $Delta H$, but did not require its positive definiteness.
  To obtain (3.20), fix the first endpoint $u + i D$ and move the second from $u + j D$ to $v + j D$.
    The starting value of $Q$ is zero by the diagonal extension if $i = j$, and by (3.18) otherwise.
    Integrating $partial_y Q gt.eq S \( y \)$ on this interval gives the result.
    For (3.20), fix the second endpoint $v + j D$ and move the first from $u + i D$ to $v + i D$.
    The terminal value is zero, so integration of $- partial_x Q gt.eq S \( x \)$ gives the second result.
    When $i = j$, one can first integrate on a shortened interval and pass to the diagonal endpoint using (3.22).
  Figure 1 displays these integrations with the half-period indices held fixed.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (4.935, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.935, 0), [#text(size: 9pt)[$a$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.83), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 4.83), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (4.2, 4.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.2, 0), (4.2, 4.2), (0, 4.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((4.2, 0), [#text(size: 9pt)[$D$]], anchor: "north", padding: 0.1176cm)
  content((0, 4.2), [#text(size: 9pt)[$D$]], anchor: "east", padding: 0.1176cm)
  line((1.05, -0.063), (1.05, 0.063), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.05, -0.04283), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  line((-0.063, 1.05), (0.063, 1.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.04283, 1.05), [#text(size: 9pt)[$u$]], anchor: "east", padding: 0.1176cm)
  line((3.15, -0.063), (3.15, 0.063), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.15, -0.04283), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  line((-0.063, 3.15), (0.063, 3.15), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.04283, 3.15), [#text(size: 9pt)[$v$]], anchor: "east", padding: 0.1176cm)
  line((1.05, 0), (1.05, 1.05), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((0, 3.15), (1.05, 3.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((1.05, 1.05), (1.05, 3.15), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.05, 3.15), (3.15, 3.15), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((1.05, 1.05), radius: 0.05997, fill: black, stroke: none)
  circle((1.05, 3.15), radius: 0.05997, fill: black, stroke: none)
  circle((3.15, 3.15), radius: 0.05997, fill: black, stroke: none)
  content((1.05, 1.05), [#text(size: 9pt)[$Q(u+"iD",u+"jD")=0$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.315, 3.728), [#text(size: 9pt)[$Q(u+"iD",v+"jD")$]], anchor: "east", padding: 0.1176cm)
  line((-0.315, 3.728), (0.945, 3.234), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((3.15, 3.15), [#text(size: 9pt)[$Q(v+"iD",v+"jD")=0$]], anchor: "west", padding: 0.1176cm)
  content((0.9345, 2.1), [#text(size: 9pt)[$partial_"yQ" gt.eq S(y)$]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  content((2.1, 3.171), [#text(size: 9pt)[$- partial_"xQ" gt.eq S(x)$]], anchor: "south", padding: 0.1176cm)
  content((2.1, 5.303), [#text(size: 9pt)[$x=a+"iD", y=b+"jD", i,j in \{0,1\}$]])
  content((2.1, -0.945), [#text(size: 9pt)[$0<u<v<D$ \(folded endpoint coordinates\)]])
})],
    caption: [Figure 1: The two paths in folded endpoint coordinates $x = a + i D$, $y = b + j D$, for $0 < u < v < D$. The first starts at $Q = 0$ and increases the second endpoint; the second increases the first endpoint toward another zero. The zeros come from the diagonal when $i = j$ and from the cut-pair identity otherwise. Each moving endpoint stays in one open half-period. When $i = 1 \, j = 0$, the actual order is $u + D > v$, and both positive-semidefinite lower bounds still apply. ],
  ) <fig:schur-endpoint-paths>
  Both moving endpoints stay in one open half-period, so neither path passes through a chart pole.
    In particular, when $i = 1 \, j = 0$ the actual endpoint order is $u + D > v$.
    The first path starts at $\( u + D \, u \)$ and the second ends at $\( v + D \, v \)$;
    the same zero values and the same derivative inequalities apply.
    Thus neither matrix inequality reverses in this case. Finally,
    the integrals on their right sides are positive definite, so $Q \( u + i D \, v + j D \) > 0$. ◻
]

=== 3.5 Scalar lower bounds for the two factors <scalar-lower-bounds-for-the-two-factors>

For distinct $x \, y in cal(I)$, define

#[#set math.equation(numbering: n => "(3.24)")
 $ f_H \( x \, y \) = frac(\| det \( H \( y \) - H \( x \) \) \|, sqrt(det H' \( x \) det H' \( y \))) \, wide
   f_K \( x \, y \) = frac(\| det Q \( x \, y \) \|, sqrt(det S \( x \) det S \( y \))) . $ <eq:lag-two-factors>]

These auxiliary factors are symmetric under exchanging the actual endpoints. Combining (3.6), (3.8), and (3.17) gives

#[#set math.equation(numbering: n => "(3.25)")
 $ f \( x \, y \) = f_H \( x \, y \) f_K \( x \, y \) . $ <eq:lag-factorization>]

The factors are positive away from the cut pairs $\| y - x \| = D$; at those pairs $f_K = 0$.

#thm([Proposition 3.5.])[
  (Scalar block bounds).  #emph[With the profiles of Proposition 8, every pair of distinct chart endpoints satisfies
#[#set math.equation(numbering: n => "(3.26)")
 $ f_H \( x \, y \)^(1 \/ m) gt.eq lr(|integral_x^y h \( t \) thin d t|) /
   sqrt(h \( x \) h \( y \)) . $ <eq:lag-H-scalar-bound>]

 For $0 < u < v < D$ and $i \, j in { 0 \, 1 }$ one has
#[#set math.equation(numbering: n => "(3.27)")
 $ f_K \( u + i D \, v + j D \)^(1 \/ k) gt.eq
   frac((integral_u^v s_i \( t \) thin d t)^(1 \/ 2) (integral_u^v s_j \( t \) thin d t)^(1 \/ 2), sqrt(s_i \(
   u \) s_j \( v \))) . $ <eq:lag-K-scalar-bound>]

 Together with endpoint exchange, these bounds cover the full square $\( 0 \, T \)^2$ except the chart, diagonal,
   and cut lines, a set of planar measure zero.]
] <lag:block-bounds>

#proof[
  We first record the determinant inequality used in both blocks.
    For a positive definite $r times r$ matrix $M$, write $delta_r \( M \) = det \( M \)^(1 \/ r)$.
    The elementary variational formula
  #[#set math.equation(numbering: n => "(3.28)")
   $ delta_r \( M \) = inf_(P > 0\
det P = 1) 1 / r "tr" \( P M \) $ <eq:lag-determinant-variational>]
  follows by applying the arithmetic–geometric mean inequality to the eigenvalues of $M^(1 \/ 2) P M^(1 \/ 2)$.
    Equality is attained at $P = delta_r \( M \) M^(- 1)$. The formula proves monotonicity under the
    positive-semidefinite order. It also proves, for any continuous positive definite matrix function on a compact
    interval,
  #[#set math.equation(numbering: n => "(3.29)")
   $ delta_r (integral_a^b M \( t \) thin d t) gt.eq integral_a^b delta_r \( M \( t \) \) thin d t .
     $ <eq:lag-Minkowski>]
  Indeed, for every admissible $P$ the integral of $"tr" \( P M \( t \) \) \/ r$ is at least the right side,
    and one then takes the infimum over $P$. This is the integral form of Minkowski’s determinant inequality;
    it retains the degree-one homogeneity of the determinant root.
  Apply (3.29) to $H'$ on the interval between $x$ and $y$. Equation (3.15) gives
  $ \| det \( Delta H \) \|^(1 \/ m) gt.eq lr(|integral_x^y det \( H' \( t \) \)^(1 \/ m) thin d t|) . $
  For $y < x$ this uses the positive matrix $- Delta H$. Division by
  $ #scale(x: 120%, y: 120%)[\(] det H' \( x \) det H' \( y \) #scale(x: 120%, y: 120%)[\)]^(1 \/ \( 2 m \)) =
    sqrt(h \( x \) h \( y \)) $
  proves (3.26).
  Now put $Q = Q \( u + i D \, v + j D \) > 0$. Each of the two matrix bounds in Proposition 9,
    followed by determinant monotonicity and (3.29), gives
  $ delta_k \( Q \) gt.eq integral_u^v s_i \( t \) thin d t \, wide delta_k \( Q \) gt.eq
    integral_u^v s_j \( t \) thin d t . $
  Thus $delta_k \( Q \)$ dominates their maximum and therefore their geometric mean.
    The denominator in the $k$th root of $f_K$ is exactly
  $ #scale(x: 120%, y: 120%)[\(] det S \( u + i D \) det S \( v + j D \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ \( 2 k \)) = sqrt(s_i \( u \) s_j \( v \)) \, $
  which proves (3.27) with the displayed powers.
  Finally, every endpoint in $cal(I)$ has a unique expression $u + i D$ with $0 < u < D$ and $i in { 0 \, 1 }$.
    For a pair whose folded parameters differ, order those parameters as $u < v$,
    exchanging the actual endpoints if necessary. The preceding bounds apply for every choice of the two
    half-period indices. Equal folded parameters mean either a diagonal pair or a cut pair.
    The remaining excluded pairs have an endpoint at $D$. These are finitely many lines,
    and symmetry of both factors justifies the endpoint exchange everywhere else. ◻
]

The two determinant roots have now been compared with scalar interval integrals.
  Proposition 8 supplies exactly their endpoint control. The next section combines these bounds by a weighted
  logarithmic identity.

== 4 Weighted comparison along a closed geodesic <weighted:section>

We retain $D = pi \/ 2$, $T = pi$, $d = n - 1$, and $m = d - k$, with $m \, k gt.eq 1$.
  The factorization $f = f_H f_K$ turns the logarithm of the ratio to the model density into a sum of two block
  contributions. We will show that each contribution has nonnegative integral with weight $w \( \| y - x \| \)$.
  The scalar identity below cancels the integrated endpoint terms in the block bounds.
  A strict-convexity remainder will then give the determinant comparison and identify its equality case,
  without separately classifying equality in the matrix estimates.

The scalar identity is a logarithmic form of the weighted cancellation in Kazdan’s proof of the Berger–Kazdan
  inequality #cite(label("Kazdan1978AppendixE")) Appendix E, especially E.4–E.8.
  At interval length $pi$, writing Kazdan’s profile as $phi.alt \( t \) = sin \( t \) e^(u \( t \))$ gives $p =
  phi.alt^(- 2)$, $p_0 \( t \) = sin^(- 2) t$, $g = log \( p \/ p_0 \) = - 2 u$, and weight $rho \( t \) =
  W \( t \) \/ sin t$. We give the version needed here, with bounded logarithmic ratios and a measurable weight,
  including the endpoint integrability. Its application to the two factors depends on the folded symmetry proved below.

#thm([Lemma 4.1.])[
  (Weighted scalar identity).  #emph[Let $b > 0$, $lambda = pi \/ b$, and
$ p_0 \( t \) = frac(lambda^2, sin^2 \( lambda t \)) \, wide 0 < t < b . $

 Let $p : \( 0 \, b \) arrow.r \( 0 \, oo \)$ be continuous and suppose that $g = log \( p \/ p_0 \)$ is bounded.
   Let $W$ be nonnegative and measurable on $\( 0 \, b \)$, with $W \( b - z \) =
   W \( z \)$ almost everywhere and $W \( z \) \/ sin \( lambda z \)$ essentially bounded. Write
$ Delta_b = { \( x \, y \) : 0 < x < y < b } \, wide d nu_(x y) \( t \) =
  frac(p_0 \( t \) thin d t, integral_x^y p_0) \, quad x < t < y . $

 Then all the following integrals are finite, and
#[#set math.equation(numbering: n => "(4.1)")
 $ & integral_(Delta_b) W \( y - x \)
   [log frac(integral_x^y p, integral_x^y p_0) - frac(g \( x \) + g \( y \), 2)] d x thin d y\
 & wide =
   integral_(Delta_b) W \( y - x \)
   [log integral_x^y e^(g \( t \)) thin d nu_(x y) \( t \) - integral_x^y g \( t \) thin d nu_(x y) \( t \)] d x
   thin d y med gt.eq med 0 . $ <weighted:scalar-identity>]

]
] <weighted:scalar>

#proof[
  Direct integration gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ P_0 \( x \, y \) := integral_x^y p_0 =
     frac(lambda sin \( lambda \( y - x \) \), sin \( lambda x \) sin \( lambda y \)) \, wide
     frac(P_0 \( x \, y \), sqrt(p_0 \( x \) p_0 \( y \))) = frac(sin \( lambda \( y - x \) \), lambda) .
     $ <weighted:chord>]
  The measure $nu_(x y)$ is a probability measure. Both its average of $g$ and $log integral e^g thin d nu_(x y) =
    log \( integral p \/ integral p_0 \)$ have absolute value at most $parallel g parallel_oo$.
    Since $W$ is essentially bounded, the asserted finiteness follows already from these bounds.
    Jensen’s inequality makes the integrand on the second line of (4.1) nonnegative.
    It remains to establish the equality of the integrated linear terms.
  Set $K \( z \) = W \( z \) \/ sin \( lambda z \)$ and $I_W = integral_0^b W \( z \) thin d z$, and define
  $ F \( t \) = integral_(0 < x < t < y < b) K \( y - x \) sin \( lambda x \) sin \( lambda y \) thin d x thin d y . $
  Here the two-variable kernel $q \( x \, y \) = K \( y - x \) sin \( lambda x \)
    sin \( lambda y \)$ is essentially bounded. Fubini gives
  $ F \( t \) = integral_0^t (integral_x^b q \( x \, y \) thin d y) d x -
    integral_0^t (integral_0^y q \( x \, y \) thin d x) d y . $
  Thus $F$ is absolutely continuous on $\[ 0 \, b \]$, $F \( 0 \) = 0$, and, for almost every $t$,
  $ F' \( t \) & =
    sin \( lambda t \)
    [integral_0^(b - t) K \( z \) sin \( lambda \( t + z \) \) thin d z - integral_0^t K \( z \) sin \( lambda \(
    t - z \) \) thin d z]\
 & = sin \( lambda t \) integral_0^b K \( z \) sin \( lambda \( t + z \) \) thin d z\
 & = I_W sin \( lambda t \) cos \( lambda t \) . $
  For the second equality substitute $b - z$ in the subtracted integral:
    $K \( b - z \) = K \( z \)$ and $sin \( lambda \( t - b + z \) \) = - sin \( lambda \( t + z \) \)$.
    For the last equality, symmetry gives $integral_0^b K \( z \) cos \( lambda z \) thin d z = 0$,
    while $integral_0^b K \( z \) sin \( lambda z \) thin d z = I_W$. Integration therefore yields
  #[#set math.equation(numbering: n => "(4.3)")
   $ F \( t \) = frac(I_W, 2 lambda) sin^2 \( lambda t \) \, wide frac(p_0 \( t \), lambda) F \( t \) = I_W /
     2 . $ <weighted:coefficient>]
  This argument has not differentiated the measurable weight.
  Using (4.2) and then (4.3), the integrated interval averages are
  $ integral_(Delta_b) W \( y - x \) integral_x^y g \( t \) thin d nu_(x y) \( t \) thin d x thin d y & =
    integral_0^b g \( t \) frac(p_0 \( t \), lambda) F \( t \) thin d t\
 & = I_W / 2 integral_0^b g \( t \) thin d t . $
  The exchange is absolutely integrable: replacing $g$ by $\| g \|$ in the left side bounds it by $parallel g
    parallel_oo integral_(Delta_b) W \( y - x \) thin d x thin d y$.
    In particular, no integral of $p_0$ over the entire interval is taken.
    The endpoint terms have exactly the same value, since
  $ & 1 / 2 integral_(Delta_b) W \( y - x \) \( g \( x \) + g \( y \) \) thin d x thin d y\
 & wide = 1 / 2 integral_0^b g \( t \) [integral_0^(b - t) W \( z \) thin d z + integral_0^t W \( z \) thin d z] d
   t = I_W / 2 integral_0^b g \( t \) thin d t . $
  The final equality again uses $W \( b - z \) = W \( z \)$.
    Subtracting these equal finite quantities proves the identity and hence the lemma. ◻
]

#thm([Theorem 4.2.])[
  (Comparison on each geodesic).  #emph[In the normalized intermediate case of Proposition 5,
    let $f \( x \, y \)$ be the Jacobi determinant of any fixed unit-speed geodesic, as in Proposition 6. Put
$ cal(R) = \( 0 \, T \)^2 \, wide w \( z \) = \( sin z \)^m lr(|frac(sin \( 2 z \), 2)|)^k
  quad \( 0 lt.eq z lt.eq T \) . $

 Then
#[#set math.equation(numbering: n => "(4.4)")
 $ integral_(cal(R)) f \( x \, y \) thin d x thin d y med gt.eq med
   integral_(cal(R)) w \( \| y - x \| \) thin d x thin d y . $ <weighted:comparison>]

 Equality holds if and only if $f \( x \, y \) = w \( \| y - x \| \)$ for every $\( x \, y \) in \[ 0 \, T \]^2$.]
] <weighted:geodesic>

#proof[
  All constants in this proof may depend on the chosen geodesic. Write $w_(x y) = w \( \| y - x \| \)$.
    We first work off the null set
  $ E = { \( x \, y \) in cal(R) : x = D upright(" or ") y = D upright(" or ") x = y upright(" or ") \| y - x \| =
    D } . $
  There $f \, w_(x y)$, and the two determinant factors $f_H \, f_K$ of Proposition 10 are positive, and $f =
    f_H f_K$. Define
  $ L_H \( x \, y \) = log frac(f_H \( x \, y \), sin^m \( \| y - x \| \)) \, wide L_K \( x \, y \) =
    log frac(f_K \( x \, y \), \| sin \( 2 \| y - x \| \) \/ 2 \|^k) . $
  Set their values on $E$ equal to zero for integration. Both are symmetric in the actual endpoint slots $x \, y$.
  ===== 4.1 Finiteness of the logarithmic integrals. <finiteness-of-the-logarithmic-integrals.>
  The profile bounds in Proposition 8 give constants $0 < alpha lt.eq beta < oo$ such that
  $ alpha & lt.eq frac(h \( t \), csc^2 t) lt.eq beta &  & \( 0 < t < T \) \,\
alpha & lt.eq frac(s_i \( t \), 4 csc^2 \( 2 t \)) lt.eq beta &  & \( 0 < t < D \, med i = 0 \, 1 \) . $
  Set $eta = alpha \/ beta lt.eq 1$. For $x < y$, the first bound in Proposition 10 and the chord identity (4.2) imply
  $ f_H \( x \, y \)^(1 \/ m) gt.eq frac(integral_x^y h, sqrt(h \( x \) h \( y \))) gt.eq eta sin \( y - x \) . $
  Symmetry gives this lower bound for either endpoint order.
    Similarly, put $B_0 \( z \) = sin \( 2 z \) \/ 2$ for $0 < z < D$.
    For $0 < u < v < D$ and $i \, j in { 0 \, 1 }$, the second block bound gives
  $ f_K \( u + i D \, v + j D \)^(1 \/ k) gt.eq
    frac(\( integral_u^v s_i \)^(1 \/ 2) \( integral_u^v s_j \)^(1 \/ 2), sqrt(s_i \( u \) s_j \( v \))) gt.eq
    eta B_0 \( v - u \) . $
  In these coordinates $B_0 \( v - u \) = \| sin \( 2 \| y - x \| \) \/ 2 \|$.
    Every pair outside $E$ has this form, possibly after exchanging endpoints. Consequently
  #[#set math.equation(numbering: n => "(4.5)")
   $ L_H gt.eq m log eta \, wide L_K gt.eq k log eta \, wide L_H + L_K = L :=
     log \( f \/ w_(x y) \) . $ <weighted:log-lower-bounds>]
  With $a^(+) = max \( a \, 0 \)$, the elementary estimate
  $ w_(x y) L^(+) lt.eq f $
  and continuity of $f$ on the compact square prove integrability of $w_(x y) L^(+)$.
    The individual negative parts are bounded by (4.5); also
  $ L_H^(+) lt.eq L^(+) - k log eta \, wide L_K^(+) lt.eq L^(+) - m log eta . $
  Thus $w_(x y) L_H$, $w_(x y) L_K$, and $w_(x y) L$ are all absolutely integrable.
    The following additions of logarithmic integrals therefore involve only finite quantities.
  ===== 4.2 The $H$ factor on the full square. <the-h-factor-on-the-full-square.>
  Apply Lemma 11 with $b = T$, $lambda = 1$, $p = h$, and $W = w$. Its assumptions hold by Proposition 8 and
  $ w \( T - z \) = w \( z \) \, wide frac(w \( z \), sin z) = sin^(m - 1) z lr(|frac(sin \( 2 z \), 2)|)^k \, $
  which is bounded because $m gt.eq 1$. Writing $g_H = log \( h \/ csc^2 t \)$,
    the first block bound and (4.2) give, for $0 < x < y < T$ outside $E$,
  $ frac(L_H \( x \, y \), m) gt.eq log frac(integral_x^y h \( t \) thin d t, integral_x^y csc^2 t thin d t) -
    frac(g_H \( x \) + g_H \( y \), 2) . $
  After multiplication by $w \( y - x \)$, Lemma 11 makes the integral of the right side nonnegative.
    Multiplication by $m$ and endpoint symmetry then yield
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral_(cal(R)) w_(x y) L_H \( x \, y \) thin d x thin d y gt.eq 0 . $ <weighted:H-log>]
  ===== 4.3 The $K$ factor and the four folded weights. <the-k-factor-and-the-four-folded-weights.>
  Put $p_0 \( t \) = 4 csc^2 \( 2 t \)$ on $\( 0 \, D \)$ and define
  $ g_i \( t \) = log frac(s_i \( t \), p_0 \( t \)) \, wide A_i \( u \, v \) =
    log frac(integral_u^v s_i \( t \) thin d t, integral_u^v p_0 \( t \) thin d t) quad \( i = 0 \, 1 \) . $
  For $\( u \, v \) in Delta_D$, $z = v - u$, $x = u + i D$, and $y = v + j D$,
    the second block bound gives the precise logarithmic inequality
  #[#set math.equation(numbering: n => "(4.7)")
   $ frac(L_K \( u + i D \, v + j D \), k) gt.eq 1 / 2 #scale(x: 120%, y: 120%)[\[] A_i \( u \, v \) +
     A_j \( u \, v \) - g_i \( u \) - g_j \( v \) #scale(x: 120%, y: 120%)[\]] . $ <weighted:folded-bound>]
  Indeed, (4.2) with $lambda = 2$ converts the reference interval integral and its endpoint factors into
    $B_0 \( z \)$. The actual separation is $z$ if $i = j$, $D + z$ if $\( i \, j \) = \( 0 \, 1 \)$, and $D -
    z$ if $\( i \, j \) = \( 1 \, 0 \)$. In the last case $x > y$;
    the bound in Proposition 10 includes this order. All three separations have the same absolute fast model
    factor $B_0 \( z \)$.
  The four weights $w_(i j) \( z \) = w \( \| z + \( j - i \) D \| \)$ form the matrix
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( w_(i j) \( z \) \)_(i \, j = 0)^1 = B_0 \( z \)^k mat(delim: "(", sin^m z, cos^m z; cos^m z, sin^m z) .
     $ <weighted:weight-matrix>]
  Every row and every column sums to
  $ W_D \( z \) = \( sin^m z + cos^m z \) B_0 \( z \)^k . $
  This is symmetric under $z mapsto D - z$, and
  $ frac(W_D \( z \), sin \( 2 z \)) = 2^(- k) \( sin^m z + cos^m z \) sin^(k - 1) \( 2 z \) $
  is bounded for every $k gt.eq 1$. When $k = 1$, its limit at either endpoint is $1 \/ 2$,
    so this case also satisfies Lemma 11.
  Multiply (4.7) by $w_(i j) \( z \)$ and sum over $i \, j$.
    The row sums control the terms indexed by $i$, and the column sums control those indexed by $j$, giving exactly
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_(i \, j = 0)^1 w_(i j) \( z \) frac(L_K \( u + i D \, v + j D \), k) & gt.eq
     W_D \( z \) sum_(i = 0)^1 [A_i \( u \, v \) - frac(g_i \( u \) + g_i \( v \), 2)] . $ <weighted:folded-sum>]
  Lemma 11, applied on $\( 0 \, D \)$ separately to $s_0$ and $s_1$ with weight $W_D$,
    shows that the right side has nonnegative integral over $Delta_D$.
  For completeness, the four images of $Delta_D$ used above consist precisely of pairs whose first endpoint has
    smaller residue modulo $D$ than the second. Their transposes contain precisely the opposite residue order.
    These eight disjoint regions cover $cal(R) \\ E$; each coordinate change has Jacobian one.
    Since $w_(x y) L_K \( x \, y \)$ is symmetric, it follows that
  #[#set math.equation(numbering: n => "(4.10)")
   $ & integral_(cal(R)) w_(x y) L_K \( x \, y \) thin d x thin d y\
 & wide = 2 k integral_(Delta_D) sum_(i \, j = 0)^1 w_(i j) \( v - u \) frac(L_K \( u + i D \, v + j D \), k) thin
   d u thin d v med gt.eq med 0 . $ <weighted:K-log>]
  Here the factor $2$ accounts for endpoint exchange and the factor $k$ restores the logarithm of $f_K$ from that
    of its $k$th root.
  ===== 4.4 Comparison and equality. <comparison-and-equality.>
  Adding (4.6) and (4.10) gives
  $ integral_(cal(R)) w_(x y) log \( f \/ w_(x y) \) thin d x thin d y gt.eq 0 . $
  For $r > 0$, the strictly convex function
  $ Phi \( r \) = r - 1 - log r $
  is nonnegative and vanishes exactly at $r = 1$. On $cal(R) \\ E$ put $r = f \/ w_(x y)$. All terms in the identity
  #[#set math.equation(numbering: n => "(4.11)")
   $ integral_(cal(R)) \( f - w_(x y) \) thin d x thin d y = integral_(cal(R)) w_(x y) log r thin d x thin d y +
     integral_(cal(R)) w_(x y) Phi \( r \) thin d x thin d y $ <weighted:strict-gap>]
  are finite by the preceding integrability argument. Both terms on the right are nonnegative, proving (4.4).
    If equality holds, the last integral is zero. Since $w_(x y) > 0$ off the diagonal and cut lines,
    $Phi \( r \) = 0$ almost everywhere, hence $f = w_(x y)$ almost everywhere in $cal(R)$.
    Continuity of both functions on $\[ 0 \, T \]^2$ extends this identity to every pair,
    including the exceptional lines and boundary. Conversely, that pointwise identity gives equality in (4.4). ◻
]

== 5 Global comparison and the equality case <rig:section>

We retain all intermediate model types and the normalization of Section 2.
  The preceding geodesic comparison now gives the global volume bound.
  Its nonnegative defect will also retain enough information to identify the equality metric.

For $xi in U$, write $gamma_xi$ for the geodesic with initial velocity $xi$ and $f_xi$ for the determinant of
  Proposition 6. Put

$ J \( xi \, t \) = f_xi \( 0 \, t \) . $

This is the absolute determinant of the normal Jacobi tensor with initial value zero and derivative
  $upright("Id")$. It is continuous in $\( xi \, t \)$, positive for $0 < t < D$,
  and agrees there with the usual polar volume density.

#thm([Lemma 5.1.])[
  (Polar integration over a full period).  #emph[For every $p in M$,
$ integral_(S_p M) integral_0^D J \( xi \, t \) thin d t thin d sigma_p \( xi \) = V \, wide
  integral_(S_p M) integral_0^T J \( xi \, t \) thin d t thin d sigma_p \( xi \) = 2 V . $

]
] <rig:polar>

#proof[
  The open injectivity ball maps diffeomorphically onto the complement of the cut locus.
    The latter is a smooth submanifold of dimension $d - k < n$, hence has zero Riemannian volume.
    Polar coordinates therefore prove the first formula. Periodicity of the Jacobi data and reversal of the
    geodesic give
  $ J \( xi \, T - t \) = J \( xi \, - t \) = J \( - xi \, t \) . $
  The sign in the reversed initial derivative disappears under the absolute determinant.
    The substitution $t mapsto T - t$ in the second half-period,
    followed by the area-preserving antipodal map on $S_p M$, proves the second formula. ◻
]

#proof[
  The circle, sphere-type, and real-projective-type cases are already covered in Section 2.
    In an intermediate case use the normalization (2.1). Theorem 12 says that
  #[#set math.equation(numbering: n => "(5.1)")
   $ delta \( xi \) := integral_0^T integral_0^T #scale(x: 120%, y: 120%)[\(] f_xi \( x \, y \) -
     w \( \| y - x \| \) #scale(x: 120%, y: 120%)[\)] thin d x thin d y gt.eq 0 . $ <rig:geodesic-defect>]
  Time translation along a geodesic gives
  $ f_xi \( x \, y \) = J #scale(x: 120%, y: 120%)[\(] phi.alt_x xi \, \( y - x \) med mod med
    T #scale(x: 120%, y: 120%)[\)] . $
  The possible choice of endpoint for the residue modulo $T$ has no effect on any integral.
    Fubini’s theorem, translation on the time circle, flow invariance of $mu$, and Lemma 13 yield
  $ integral_U integral_0^T integral_0^T f_xi \( x \, y \) thin d x thin d y thin d mu \( xi \) & =
    T integral_U integral_0^T J \( xi \, t \) thin d t thin d mu \( xi \)\
 & = 2 T V^2 . $
  All integrands are continuous and bounded on the compact domains in question.
    Since $w \( T - t \) = w \( t \)$, its periodic extension gives likewise
  $ integral_U integral_0^T integral_0^T w \( \| y - x \| \) thin d x thin d y thin d mu \( xi \) & =
    sigma_d V T integral_0^T w \( t \) thin d t\
 & = 2 T V V_0 . $
  Integrating (5.1) and dividing by $2 T V > 0$ proves $V gt.eq V_0$.
  If $V = V_0$, the nonnegative function $delta$ has integral zero.
    It is continuous, because the underlying Jacobi tensors depend smoothly on the initial velocity and taking the
    absolute determinant preserves continuity. Full support of $mu$ forces $delta \( xi \) = 0$ for every $xi$.
    The equality assertion in Theorem 12 now gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ J \( xi \, t \) = w \( t \) \, wide xi in U \, quad 0 < t < D . $ <rig:radial-density>]
  In Cartesian normal coordinates at any point, the volume density is $J \( xi \, t \) \/ t^d$.
    By (5.2) it depends only on $t$. At the origin it extends smoothly with value one,
    as also follows directly from the normal-coordinate volume form. Thus $M$ is harmonic.
    It is compact and simply connected by Proposition 5. The compact simply connected case of the Lichnerowicz
    conjecture, proved by #cite(label("Szabo1990"), form: "prose"),
    identifies its metric with a compact rank-one symmetric metric up to scale.
    Its type identifies the model, and the fixed diameter identifies the scale.
    For the radial-density definition and the concluding metric classification,
    see also the author’s original preprint #cite(label("Szabo1988")) pp. 2–4 and Lemmas 4.9–4.10.
  Conversely, a model is isometric to itself and has volume $V_0$.
    Finally both sides of the volume comparison scale by the same factor under a constant metric rescaling.
    Undoing (2.1) proves the assertion at every diameter. ◻
]

#proof[
  The upper bound and Theorem 2 give equal volumes, so its equality case applies. ◻
]

== 6 Incidence and the quaternionic Pontryagin class <inc:section>

The lower-volume comparison and its metric equality case are now proved.
  To obtain the quaternionic upper bound, we first determine the characteristic class of an actual bundle supplied
  by the cut geometry: the normal four-plane bundle of cut incidence.
  The later loop-energy construction will use this same bundle, not only its sphere-fibration homotopy type.
  We use the standard integral bundle and cohomology tools in #cite(label("Hatcher2002"), form: "prose") and
  #cite(label("MilnorStasheff1974"), form: "prose"); the geometric constructions and the relations needed here are
  proved below. In this section and the next three, suppose that $M$ has quaternionic type, so $n = 4 r$, $r gt.eq
  2$, and $k = 3$. Choose an integral generator $u in H^4 \( M \; bb(Z) \)$ and an orientation with $integral_M
  u^r = 1$. Write $C_p = "Cut" \( p \)$. The cell attachment in Section 2 gives

$ H^(*) \( C_p \; bb(Z) \) = bb(Z) \[ u \|_(C_p) \] \/ \( \( u \|_(C_p) \)^r \) . $

Indeed restriction is an isomorphism in every degree below $4 r - 1$, and $C_p$ has dimension $4 r - 4$.
  In particular it is orientable, and its fundamental class is dual to $plus.minus u$ in $M$.

=== 6.1 The actual normal bundle <the-actual-normal-bundle>

#thm([Proposition 6.1.])[
  #emph[The cut incidence
$ F = { \( p \, q \) in M times M : q in C_p } $

 is a smooth embedded submanifold. Both projections are smooth fiber bundles with fiber a cut locus.
   If $u_1 \, u_2$ are the two pullbacks of $u$, its rank-four normal bundle $cal(V)$ can be oriented so that
#[#set math.equation(numbering: n => "(6.1)")
 $ e \( cal(V) \) = u_1 - u_2 \, wide p_1 \( cal(V) \) = 2 s \( u_1 + u_2 \) \, wide s in 2 bb(Z) +
   1 . $ <inc:normal-classes>]

 Projection of $cal(V)_(\( p \, q \))$ into $T_p M$ identifies it with $N_p C_q$.
   The unit sphere of this four-plane is exactly the great sphere of initial directions of minimizing geodesics
   from $p$ to $q$.]
] <inc:normal>

#proof[
  The full cut map
  $ c : S M arrow.r M times M \, wide c \( xi \) = \( pi \( xi \) \, exp_(pi \( xi \)) \( D xi \) \) $
  has constant rank $4 r + \( 4 r - 4 \) = 8 r - 4$. Its fibers are the connected great three-spheres from
    Proposition 5. Here constant rank and compactness give an embedded image, as follows.
    Constant-rank charts give local image germs through any image point.
    Charts overlapping along its fiber have the same germ, so connectedness of that fiber makes all these germs
    agree. Cover the compact fiber by finitely many such charts.
    Properness excludes additional inverse images outside their union over a sufficiently small neighborhood of
    the image point. Thus the whole image in that neighborhood is the one smooth submanifold germ.
    This proves the assertion. The first projection is a submersion because its composition with $c$ is $pi$;
    symmetry gives the same conclusion for the second. Proper submersions are smooth fiber bundles.
  For $\( a \, b \) in cal(V)_(\( p \, q \)) subset T_p M xor T_q M$,
    orthogonality to $\( T_p C_q \, 0 \)$ gives $a in N_p C_q$.
    If $a = 0$, surjectivity of the second projection on $T_(\( p \, q \)) F$ forces $b = 0$.
    The projection to $N_p C_q$ is therefore injective and, both spaces having dimension four, an isomorphism.
    First variation for the constant distance $D$ shows that the initial directions from $p$ to $q$ are normal to
    $C_q$. Their great sphere has the full dimension of $S \( N_p C_q \)$, proving the last assertion.
    In particular, if $q_1 \, q_2 in C_p$ are distinct, then
  #[#set math.equation(numbering: n => "(6.2)")
   $ N_p C_(q_1) ∩ N_p C_(q_2) = { 0 } : $ <inc:disjoint-planes>]
  a common nonzero direction would reach both points at time $D$.
  The cut loci and $M$ are simply connected, so the fibration makes $F$ simply connected.
    Its normal bundle is orientable. Leray–Hirsch #cite(label("Hatcher2002")) Theorem 4D.1, using $1 \, u_2 \,
    dots.h \, u_2^(r - 1)$ on the fibers, and disjointness from the diagonal give the integral presentation
  #[#set math.equation(numbering: n => "(6.3)")
   $ H^(*) \( F \; bb(Z) \) = bb(Z) \[ u_1 \, u_2 \] \/ \( u_1^(r + 1) \, Delta \( u_1 \, u_2 \) \) \, wide
     Delta \( a \, b \) = sum_(j = 0)^r a^j b^(r - j) . $ <inc:ring>]
  To justify completeness, the displayed relation is the restriction of the diagonal class in $M times M$.
    It is monic of degree $r$ in $u_2$, so the proposed quotient has exactly the Leray–Hirsch basis.
    The dual of $F$ in $M times M$ restricts on either factor slice to $plus.minus u$.
    Its restriction to the disjoint diagonal is zero. Its two factor coefficients are consequently opposite,
    and after an orientation choice its restriction to $F$ is $u_1 - u_2$.
    The self-intersection formula gives the asserted Euler class.
  The interchange of factors preserves the unoriented normal bundle.
    Since $u_1 \, u_2$ are an integral basis of $H^4 \( F \; bb(Z) \)$, we have $p_1 \( cal(V) \) =
    t \( u_1 + u_2 \)$ for an integer $t$. Also $H^2 \( F \; bb(Z) \/ 2 \) = 0$, so $cal(V)$ is spin.
    We use the classical identification $"Spin" \( 4 \) = "SU" \( 2 \) times
    "SU" \( 2 \)$ and its two complex two-dimensional half-spin representations;
    see #cite(label("Moore2010"), form: "prose") Sections 2.1–2.2.
    For an oriented spin four-plane bundle, its two complex half-spin bundles have second Chern classes
  $ frac(- p_1 \( cal(V) \) + 2 e \( cal(V) \), 4) \, wide frac(- p_1 \( cal(V) \) - 2 e \( cal(V) \), 4) . $
  This follows directly from the formal half-spin weights $plus.minus \( t_1 + t_2 \) \/
    2$ and $plus.minus \( t_1 - t_2 \) \/ 2$, where $p_1 = t_1^2 + t_2^2$ and $e = t_1 t_2$.
    Integrality in the basis $u_1 \, u_2$ implies $t equiv 2 med \( mod med 4 \)$.
    Writing $t = 2 s$ proves the proposition. ◻
]

Changing $u$ to $- u$ replaces $s$ by $- s$. Reverse the orientation of $cal(V)$ at the same time to retain
  $e \( cal(V) \) = u_1 - u_2$, and reverse the orientation of $M$ exactly when $r$ is odd to retain $integral_M
  u^r = 1$. We may therefore take $s gt.eq 1$.

=== 6.2 The rank constraint from two direction planes <the-rank-constraint-from-two-direction-planes>

For distinct $q_1 \, q_2 in C_p$, (6.2) places two four-planes with zero intersection inside $T_p M$.
  Their direct sum has a complement of rank $4 \( r - 2 \)$,
  which limits the degree of its total Pontryagin class. We will use this rank restriction to determine
  $p \( T M \)$ from $s$. The parameter space must therefore exclude coincident cut points; put

$ Z = { \( p \, q_1 \, q_2 \) : q_1 \, q_2 in C_p \, med q_1 eq.not q_2 } . $

Use $v \, x_1 \, x_2$ for the pullbacks of $u$ from its three points.
  In this section polynomial degree is one quarter of cohomological degree.
  In degrees divisible by four the rational cohomology of $Z$ is the algebra

#[#set math.equation(numbering: n => "(6.4)")
 $ A = bb(Q) \[ v \, x_1 \, x_2 \] \/ \( v^(r + 1) \, Delta \( v \, x_1 \) \, S \( v \, x_1 \, x_2 \) \) \, quad
   S \( v \, x_1 \, x_2 \) = sum_(i + j + ell = r - 1) v^i x_1^j x_2^ell . $ <inc:triple-ring>]

Here and below this assertion identifies the subalgebra consisting of these degrees;
  no claim about other degrees is needed.

For completeness, before removing $q_1 = q_2$, Leray–Hirsch gives the relations $v^(r + 1)$,
  $Delta \( v \, x_1 \)$ and $Delta \( v \, x_2 \)$. The relative diagonal has codimension $4 \( r - 1 \)$.
  Its dual is $plus.minus S$. To see this, the dual is a homogeneous polynomial of degree $r -
  1$ annihilated by $x_1 - x_2$. In degree $r$ the only relations are the two displayed $Delta$ polynomials;
  their difference is $\( x_1 - x_2 \) S$. More explicitly, multiplying a representative of the dual by $x_1 -
  x_2$ gives a constant linear combination of those two relations.
  Setting $x_1 = x_2$ makes the two constants opposite. Cancellation of $x_1 -
  x_2$ then takes place in the ordinary polynomial ring, before passage to cohomology,
  and shows that the dual is proportional to $S$. Restriction to a fixed-$p$ fiber gives the ordinary diagonal
  class of $C_p times C_p$, fixing the factor as $plus.minus 1$.
  The Thom sequence for removing the relative diagonal is surjective onto the complement in degrees divisible by
  four, because the relevant next cohomology group of $F$ is zero.
  Restriction from the ambient fiber product to that diagonal is surjective,
  so the projection formula identifies the kernel with the ideal of its dual.
  The relation $Delta \( v \, x_2 \)$ then becomes redundant, proving (6.4).
  Successive division by its two monic relations proves that $A$ is free over $bb(Q) \[ v \] \/ \( v^(r + 1) \)$,
  with basis

#[#set math.equation(numbering: n => "(6.5)")
 $ { x_1^a x_2^b : 0 lt.eq a < r \, med 0 lt.eq b < r - 1 } . $ <inc:free-basis>]

#thm([Theorem 6.2.])[
  #emph[The total Pontryagin class of $M$ is
#[#set math.equation(numbering: n => "(6.6)")
 $ p \( T M \) = frac(\( 1 + 2 s u + u^2 \)^(r + 1), 1 + 4 s u) quad
   upright("in ") H^(*) \( M \; bb(Q) \) . $ <inc:pontryagin-formula>]

 The quotient means its power-series expansion truncated by $u^(r + 1) = 0$.]
] <inc:pontryagin>

#proof[
  Over $Z$, the two actual normal four-planes in (6.2) have direct sum inside the pullback of $T M$ from $p$.
    Choose a complementary bundle $W$ of rank $4 \( r - 2 \)$. Set
  $ D_s \( v \, x \) = 1 + 2 s \( v + x \) + \( v - x \)^2 \, wide p_0 \( v \) =
    frac(\( 1 + 2 s v + v^2 \)^(r + 1), 1 + 4 s v) . $
  The rank-four identity $p_2 = e^2$ #cite(label("MilnorStasheff1974")) Corollary 15.8 and Proposition 14 give
  #[#set math.equation(numbering: n => "(6.7)")
   $ p \( W \) = frac(p \( T M \) \( v \), D_s \( v \, x_1 \) D_s \( v \, x_2 \)) . $ <inc:complement>]
  Its polynomial degree is at most $t_0 = 2 r - 4$.
  We will prove that the formal characteristic class
  $ cal(W)_0 = frac(p_0 \( v \), D_s \( v \, x_1 \) D_s \( v \, x_2 \)) in A $
  has degree at most $t_0$ and a degree-$t_0$ component that is nonzero modulo $v$.
    The freeness in (6.5) will then show that any first discrepancy between $p \( T M \) \( v \)$ and
    $p_0 \( v \)$ violates the rank bound on $W$. For the degree bound we use only the algebra (6.4),
    without presuming the answer for $T M$. Successive monic polynomial divisions factor
  $ T^(r + 1) = \( T - v \) \( T - x_1 \) \( T - x_2 \) product_(j = 4)^(r + 1) \( T - z_j \) $
  in an extension of $A$ obtained by adjoining roots of monic polynomials.
    Give each root degree one; the monic relations are homogeneous for this grading.
    Each adjoining algebra is free with a basis containing $1$, so this extension is injective.
    The positive-degree elementary symmetric functions of all $r + 1$ roots vanish.
    Consequently, the product of $D_s \( v \, z \)$ over all these roots is $\( 1 + 2 s v + v^2 \)^(r + 1)$.
    The factor at $z = v$ is $1 + 4 s v$. Dividing these constant-one series therefore gives
  $ cal(W)_0 = product_(j = 4)^(r + 1) D_s \( v \, z_j \) . $
  There are $r - 2$ factors, each of degree at most two, as required.
  We also need the top component $\( cal(W)_0 \)_(t_0)$ to be nonzero modulo $v$. For $r = 2$ it is $1$.
    For $r gt.eq 3$, let
  $ \( 1 + 2 s x + x^2 \)^(- 1) = sum_(j gt.eq 0) a_j x^j . $
  The recursion $a_0 = 1$, $a_1 = - 2 s$ and $a_j = - 2 s a_(j - 1) - a_(j - 2)$ gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ a_j^2 - a_(j - 1) a_(j + 1) = 1 wide \( j gt.eq 1 \) . $ <inc:reciprocal-identity>]
  Indeed the left side is unchanged on replacing $j$ by $j - 1$, and its initial value is one.
    Modulo $v$ the algebra can also be presented as
  $ bb(Q) \[ x_1 \, x_2 \] \/ (x_1^r \, x_2^r \, sum_(j = 0)^(r - 1) x_1^j x_2^(r - 1 - j)) . $
  In degree $2 r - 4$ the surviving monomials after the first two truncations are
  $ x_1^(r - 3) x_2^(r - 1) \, wide x_1^(r - 2) x_2^(r - 2) \, wide x_1^(r - 1) x_2^(r - 3) . $
  The remaining ideal gives exactly their sum as a relation:
    multiplying its generator by any monomial of degree $r - 3$ gives this same sum.
    Their coefficients in $cal(W)_0$ are, in order, $a_(r - 3) a_(r - 1) \, a_(r - 2)^2 \, a_(r - 3) a_(r - 1)$.
    Equation (6.8) makes the middle coefficient differ from either outside coefficient by one.
    Thus the component modulo $v$ is the nonzero class of $x_1^(r - 2) x_2^(r - 2)$, one of the monomials in (6.5).
  Finally suppose that $p \( T M \) \( v \) \/ p_0 \( v \)$ first differs from $1$ in degree $i$, where $1 lt.eq
    i lt.eq r$. Write its first coefficient as $b eq.not 0$. In degree $t_0 + i$, modulo $v^(i + 1)$,
    (6.7) is $b v^i \( cal(W)_0 \)_(t_0)$. This is nonzero by (6.5) and the preceding calculation:
    in a free module over $bb(Q) \[ v \] \/ \( v^(r + 1) \)$,
    a coefficient nonzero modulo $v$ remains nonzero after multiplication by $v^i$, modulo $v^(i + 1)$,
    for $i lt.eq r$. It contradicts the rank bound on $W$. Therefore there is no such $i$, which proves the theorem. ◻
]

== 7 The signature determines the incidence coefficient <sig:section>

The incidence construction has reduced the bundle calculation to one odd integer $s$.
  The signature theorem determines it in every quaternionic rank.
  The small ranks follow from exact coefficients; a single contour estimate treats all larger ranks.

#thm([Theorem 7.1.])[
  #emph[In Proposition 14, $\| s \| = 1$. In particular, the actual tautological four-plane bundle of every
    tangent great-sphere fibration at a point of $M$ satisfies $p_1 = plus.minus 2 e$.]
] <sig:coefficient>

#proof[
  Keep the choices $s gt.eq 1$ and $integral_M u^r = 1$. Set
  $ a_(+) a_(-) = 1 \, wide a_(+)^2 + a_(-)^2 = 2 s \, wide a_(+) gt.eq a_(-) > 0 \, wide c = 2 sqrt(s) \, quad
    f \( y \) = frac(sqrt(y), tanh sqrt(y)) . $
  Hirzebruch’s signature theorem #cite(label("MilnorStasheff1974")) Signature Theorem 19.4, applied to Theorem 15 gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ sigma_r = \[ u^r \] frac(\( f \( a_(+)^2 u \) f \( a_(-)^2 u \) \)^(r + 1), f \( c^2 u \)) . $ <sig:formula>]
  Here $f$ is its power series at zero; the two factors reflect $1 + 2 s u +
    u^2 = \( 1 + a_(+)^2 u \) \( 1 + a_(-)^2 u \)$. The integral cohomology ring of $M$ gives
  $ sigma_r = cases(delim: "{", 1 \, & r upright(" even") \,, 0 \, & r upright(" odd") .) $
  Indeed for even $r$ the middle pairing has the positive basis $u^(r \/ 2)$,
    and for odd $r$ its middle cohomology is zero. Expanding $f \( y \) = 1 + y \/ 3 - y^2 \/ 45 + 2 y^3 \/ 945 +
    dots.h.c$ in (7.1) gives
  $ sigma_2 - 1 = frac(8 \( s^2 - 1 \), 15) \, wide sigma_3 = - frac(32 s \( s^2 - 1 \), 105) . $
  These prove the assertion for $r = 2 \, 3$.
  We give uniform estimates for all $r gt.eq 4$. Since $s$ is odd, the contrary case is $s gt.eq 3$.
    We express the signature as a residue and show that the two nearest nonzero poles give a main term that
    dominates the remaining contour integral, forcing $\( - 1 \)^r sigma_r > 1$. Put
  $ tau = a_(-) / a_(+) = s - sqrt(s^2 - 1) \, wide b = c / a_(+) = sqrt(2 \( 1 + tau^2 \)) \, wide Q \( z \) =
    tan z tan \( tau z \) \, wide rho = frac(pi, 2 b) . $
  Then $0 < tau lt.eq 3 - sqrt(8) < 0.172$ and $sqrt(2) < b < 1.435$. Substitute $u = - t^2$ in (7.1).
    Since $f \( - a^2 t^2 \) = a t \/ tan \( a t \)$ and $a_(+) a_(-) = 1$,
    taking the coefficient by a residue and then putting $z = a_(+) t$ gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ \( - 1 \)^r sigma_r = tau / b "Res"_(z = 0) frac(tan \( b z \), Q \( z \)^(r + 1)) thin d z . $ <sig:residue>]
  The change of variables contributes the factor $1 \/ \( c a_(+) \) = tau \/ b$;
    this fixes the normalization of the residue.
  ===== 7.1 Contour representation. <contour-representation.>
  Take the rectangle with vertical sides $Re z = plus.minus X$, $X = 3 pi \/ 4$, and horizontal sides $Im z =
    plus.minus 4$. Apart from zero, the only poles of the integrand in this rectangle are at $z = plus.minus rho$.
    Zeros of $tan z$ occur only at multiples of $pi$, zeros of $tan \( tau z \)$ only at multiples of $pi \/ tau$,
    and the next poles of $tan \( b z \)$ are outside because $3 pi \/ \( 2 b \) > X$.
    The poles of $tan z$ at $plus.minus pi \/ 2$ give zeros of the reciprocal denominator, not poles.
    Both residues at $plus.minus rho$ equal $- b^(- 1) Q \( rho \)^(- r - 1)$, with $Q \( rho \) > 0$.
    The residue theorem therefore expresses (7.2) as
  #[#set math.equation(numbering: n => "(7.3)")
   $ \( - 1 \)^r sigma_r = L + cal(E) \, wide L = frac(2 tau, b^2) Q \( rho \)^(- r - 1) . $ <sig:main-term>]
  Symmetry of the four sides and the triangle inequality bound $\| cal(E) \| \/ L$ by the sum of
  #[#set math.equation(numbering: n => "(7.4)")
   $ E_v & = b / pi integral_0^4 \| tan \( b \( X + i y \) \) \|
     (frac(Q \( rho \), \| Q \( X + i y \) \|))^(r + 1) thin d y \,\
E_h & = b / pi integral_0^X \| tan \( b \( x + 4 i \) \) \| (frac(Q \( rho \), \| Q \( x + 4 i \) \|))^(r + 1)
  thin d x . $ <sig:vertical>]
  ===== 7.2 Uniform bounds. <uniform-bounds.>
  The same contour works for every $r gt.eq 4$ once both boundary ratios are bounded by constants below one:
    their fifth powers then control every exponent $r + 1 gt.eq 5$.
    We retain the $tau$ dependence in the numerator and denominator so these bounds remain uniform as $tau arrow.b
    0$. All finite decimals below denote the exact indicated rational numbers. Using $3.14 < pi < 3.142$ gives
  $ rho < 1.111 \, wide tan rho < 2.022 \, wide tau rho < 0.192 \, wide Q \( rho \) < 2.30 tau . $
  For the last inequality, the increase of $tan t \/ t$ and the Taylor bounds on $\[ 0 \, 0.192 \]$ give $tan t \/
    t < 1.013$, and $2.022 dot.op 1.111 dot.op 1.013 < 2.30$. The same monotonicity gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ frac(Q \( rho \), tan \( tau X \)) lt.eq frac(rho tan rho, X) < 0.955 . $ <sig:ratio>]
  On the vertical sides, $\| tan \( X + i y \) \| = 1$. Also $cos \( 2 b X \) gt.eq 0$, since $2 b X =
    3 b pi \/ 2 in \( 2 pi \, 5 pi \/ 2 \)$, and hence $\| tan \( b \( X + i y \) \) \| lt.eq 1$.
    The elementary complex tangent identity gives
  $ frac(\| tan \( tau \( X + i y \) \) \|^2, tan^2 \( tau X \)) & =
    frac(1 + sinh^2 \( tau y \) \/ sin^2 \( tau X \), 1 + sinh^2 \( tau y \) \/ cos^2 \( tau X \))\
 & gt.eq 1 + 0.08 y^2 wide \( 0 lt.eq y lt.eq 4 \) . $
  For this last bound, the numerator is at least $1 + y^2 \/ X^2$,
    whereas $cos \( tau X \) > 0.917$ and $sinh \( tau y \) lt.eq 1.082 tau y$ bound the denominator by $1 +
    A y^2$ with $A = \( 1.082 dot.op 0.172 \/ 0.917 \)^2$. The inequality follows from $X^(- 2) gt.eq A + 0.08 +
    16 \( 0.08 \) A$. Since $r + 1 gt.eq 5$, (7.5) now implies
  $ E_v & < 1.435 / 3.14 \( 0.955 \)^5 integral_0^4 \( 1 + 0.08 y^2 \)^(- 5 \/ 2) thin d y\
 & < 0.783 . $
  Here the integral equals
  $ frac(4 \( 1 + 2 dot.op 0.08 dot.op 16 \/ 3 \), \( 1 + 0.08 dot.op 16 \)^(3 \/ 2)) < 2.154 . $
  On a horizontal side the identity for the modulus of tangent gives
  $ \| Q \( x + 4 i \) \| gt.eq tanh 4 thin tanh \( 4 tau \) \, wide \| tan \( b \( x + 4 i \) \) \| lt.eq
    coth \( 4 b \) < 1.001 . $
  Since $tau \/ tanh \( 4 tau \)$ is increasing,
  $ frac(Q \( rho \), tanh 4 thin tanh \( 4 tau \)) < frac(2.30 dot.op 0.172, 0.999 dot.op 0.595) . $
  Substitution in (7.4), with $X \/ pi = 3 \/ 4$, therefore gives
  $ E_h < frac(3 dot.op 1.435, 4) thin 1.001 (frac(2.30 dot.op 0.172, 0.999 dot.op 0.595))^5 < 0.142 . $
  The numerical trigonometric inequalities used here can be checked without numerical approximation: use
  $ sin t lt.eq t - t^3 \/ 6 + t^5 \/ 120 \, wide cos t gt.eq 1 - t^2 \/ 2 + t^4 \/ 24 -
    t^6 \/ 720 quad \( 0 lt.eq t lt.eq 1.111 \) $
  for $tan rho$ and the smaller real arguments. For the hyperbolic inequalities use
  $ frac(sinh t, t) lt.eq 1 + t^2 / 6 + frac(t^4 \/ 120, 1 - t^2 \/ 42) quad \( 0 lt.eq t lt.eq 0.688 \) . $
  The first seven terms of the exponential series at $1.376$ give $tanh \( 0.688 \) > 0.595$,
    while $e^8 > 2000$ gives $tanh 4 > 0.999$. The same bound and $b > sqrt(2)$ imply $coth \( 4 b \) < 1.001$.
  Finally $Q \( rho \) < 2.30 tau < 1$, so (7.3) and $r + 1 gt.eq 5$ imply
  $ L > frac(tau, 1 + tau^2) \( 2.30 tau \)^(- 5) gt.eq frac(1, \( 1 + 0.172^2 \) thin 2.30^5 thin 0.172^4) > 17 . $
  Combining these estimates yields
  $ \( - 1 \)^r sigma_r > \( 1 - 0.783 - 0.142 \) 17 = 1.275 > 1 \, $
  contradicting either possible cohomological signature. Thus $s = 1$.
    Restricting (6.1) to a fixed-$p$ fiber gives $e \( cal(V) \) = - u_2$ and $p_1 \( cal(V) \) = 2 u_2$ there.
    Proposition 14 identifies this restriction with the actual tautological four-plane bundle,
    which proves the last assertion as well. ◻
]

== 8 The geodesic space and its integral classes <geo:section>

Throughout this section, $M$ has quaternionic model type, so that

$ n = 4 r \, wide r gt.eq 2 \, wide d = 4 r - 1 \, wide k = 3 \, wide H^(*) \( M \; bb(Z) \) =
  bb(Z) \[ u \] \/ \( u^(r + 1) \) \, quad \| u \| = 4 . $

We retain the normalization $D = pi \/ 2$ and $T = 2 D = pi$.
  Choose the sign of $u$ as permitted by Theorem 16, so that the actual four-plane bundle $cal(V)$ on cut
  incidence $F$ satisfies

#[#set math.equation(numbering: n => "(8.1)")
 $ p_1 \( cal(V) \) = 2 \( u_1 + u_2 \) . $ <geo:incidence-input>]

Orient $M$ by $integral_M u^r = 1$. Only the characteristic-class conclusion (8.1) and the bundle identification
  in Proposition 14 are used from the incidence argument.

Let $U = S M$, let $pi : U arrow.r M$ be the unit tangent projection, and write $z = pi^(*) u$.
  The prime period is $T$, so the action

$ \( bb(R) \/ bb(Z) \) times U arrow.r U \, wide \( a \, w \) mapsto phi.alt_(T a) \( w \) $

is free. Its quotient and quotient map will be denoted by

$ B = U \/ S^1 \, wide rho : U arrow.r B . $

Thus $B$ is the closed smooth manifold of oriented, unmarked geodesics, of dimension $2 n - 2$.

=== 8.1 The contact normalization and the two Gysin sequences <the-contact-normalization-and-the-two-gysin-sequences>

The contact calculation is the volume method for periodic geodesic flows associated with Weinstein
  #cite(label("Weinstein1974")); we include it to fix the period, Euler sign and angular-area factors exactly.
  The ensuing integral Gysin sequences, universal coefficient theorem and Poincaré duality are used in their
  standard forms #cite(label("Hatcher2002")) #cite(label("MilnorStasheff1974")).
  Yang’s complex-projective volume calculation also uses the Gysin sequences of the unit-tangent sphere bundle and
  the geodesic-circle bundle #cite(label("Yang1991")) pp. 381–382.
  Here the degree-four generator leads to a different middle-degree lattice.

Let $lambda$ be the unit tangent contact form,

$ lambda_w \( zeta \) = chevron.l w \, d pi_w zeta chevron.r . $

Its Reeb flow is the unit-speed geodesic flow. Consequently $theta =
  lambda \/ T$ is a connection for the above $bb(R) \/ bb(Z)$ action:
  it is invariant and integrates to one on each orbit. Its curvature is the pullback of a symplectic form
  $omega_B$ on $B$. We fix the Euler-class sign convention by

$ rho^(*) omega_B = d theta \, wide e = \[ omega_B \] in H^2 \( B \; bb(Z) \) \, $

and give $B$ its symplectic orientation.

#thm([Proposition 8.1.])[
  (Contact volume).  #emph[With this orientation and Euler class,
#[#set math.equation(numbering: n => "(8.2)")
 $ N := integral_B e^(4 r - 1) = frac(\( 4 r - 1 \) ! thin \| S^(4 r - 1) \| thin "Vol" \( M \), T^(4 r)) > 0 .
   $ <geo:contact-formula>]

 For the standard quaternionic model at the same diameter, this number is
#[#set math.equation(numbering: n => "(8.3)")
 $ N_0 = frac(1, 2 r + 1) binom(4 r, 2 r) . $ <geo:model-number>]

]
] <geo:contact>

#proof[
  Integration over the circle fibers gives
  $ integral_B e^d = integral_U theta and \( d theta \)^d =
    T^(- \( d + 1 \)) integral_U lambda and \( d lambda \)^d \, $
  where $U$ has the orientation induced by the positive circle direction and the chosen orientation of $B$.
    To compute the last form as a density, use the connection splitting of $T_w
    U$ into horizontal and vertical directions. Choose an orthonormal frame $\( w \, e_1 \, dots.h \, e_d \)$ at
    $pi \( w \)$. The contact form reads off the horizontal $w$ coordinate,
    and $d lambda$ pairs each horizontal $e_i$ coordinate with its vertical $e_i$ coordinate,
    up to one common sign convention. In the $d$-fold exterior power each pairing occurs once in each of $d !$
    orders. Hence
  $ \| lambda and \( d lambda \)^d \| = d ! thin d mu \, $
  where $d mu$ is base Riemannian volume times unit tangent sphere area.
    The chosen orientation makes the contact integral positive, and $mu \( U \) = \| S^d \| "Vol" \( M \)$.
    Since $d + 1 = 4 r$, this proves (8.2).
  The model’s polar density on $\( 0 \, D \)$ is $sin^(4 r - 1) t cos^3 t$. With $y = sin^2 t$,
  $ integral_0^(pi \/ 2) sin^(4 r - 1) t cos^3 t thin d t = 1 / 2 integral_0^1 y^(2 r - 1) \( 1 - y \) thin d y =
    frac(1, 4 r \( 2 r + 1 \)) . $
  Using $\| S^(4 r - 1) \| = 2 pi^(2 r) \/ \( 2 r - 1 \) !$ and $T = pi$ in (8.2) gives
  $ N_0 = frac(\( 4 r - 1 \) !, r \( 2 r + 1 \) \( \( 2 r - 1 \) ! \)^2) =
    frac(\( 4 r \) !, \( 2 r \) ! \( 2 r + 1 \) !) \, $
  which is (8.3). ◻
]

Thus the desired upper volume bound is $N lt.eq N_0$. The integral cohomology calculation below computes the
  determinant of a middle pairing whose entries are top-degree products, including this characteristic number.

#thm([Lemma 8.2.])[
  (Integral Gysin information).  #emph[The manifolds $U$ and $B$ are simply connected.
    There is an integral class $v in H^4 \( B \; bb(Z) \)$ with $rho^(*) v = z$.
    For $2 j < n$, the following is an integral basis:
#[#set math.equation(numbering: n => "(8.4)")
 $ H^(2 j) \( B \; bb(Z) \) : wide e^(j - 2 a) v^a \, wide 0 lt.eq a lt.eq floor.l j \/ 2 floor.r . $ <geo:low-basis>]

 All odd cohomology of $B$ vanishes, and its even cohomology is free abelian.
   In particular $H^2 \( B \; bb(Z) \) = bb(Z) e$ and $H^4 \( B \; bb(Z) \) = bb(Z) e^2 xor bb(Z) v$.
   The rational cohomology ring is generated by $e \, v$, and
#[#set math.equation(numbering: n => "(8.5)")
 $ dim_(bb(Q)) H^(*) \( B \; bb(Q) \) = 2 r \( r + 1 \) . $ <geo:total-betti>]

]
  #emph[Multiplication by $e$ at the middle fits into an exact sequence
#[#set math.equation(numbering: n => "(8.6)")
 $ 0 arrow.r H^(n - 2) \( B \; bb(Z) \) arrow.r^(med e smile med) H^n \( B \; bb(Z) \) arrow.r
   bb(Z) \/ \( r + 1 \) arrow.r 0 . $ <geo:middle-sequence>]

 Consequently the integral bilinear form
#[#set math.equation(numbering: n => "(8.7)")
 $ \( a \, b \) mapsto integral_B e a b \, wide a \, b in H^(n - 2) \( B \; bb(Z) \) \, $ <geo:middle-form>]

 has determinant of absolute value $r + 1$ in any integral basis.
   The map $e smile : H^n \( B \; bb(Z) \) arrow.r H^(n + 2) \( B \; bb(Z) \)$ is an isomorphism.]
] <geo:gysin>

#proof[
  The sphere fiber of $pi$ has dimension $n - 1 gt.eq 7$. Its homotopy sequence and simple connectivity of $M$
    give $pi_1 \( U \) = 0$. The homotopy sequence of the circle bundle then gives $pi_1 \( B \) = 0$.
  The Euler number of $T M$ is $chi \( M \) = r + 1$. The chosen orientation therefore gives
  $ e \( T M \) = \( r + 1 \) u^r . $
  The integral Gysin sequence of the oriented sphere bundle $pi$ has the form
  $ H^(q - n) \( M \) arrow.r^(med e \( T M \) smile med) H^q \( M \) arrow.r^(med pi^(*) med) H^q \( U \)
    arrow.r^(med pi_(!) med) H^(q - n + 1) \( M \) arrow.r^(med e \( T M \) smile med) H^(q + 1) \( M \) . $
  It gives the complete additive calculation
  #[#set math.equation(numbering: n => "(8.8)")
   $ H^q \( U \; bb(Z) \) =
     cases(delim: "{", bb(Z) { z^a } \, & q = 4 a \, quad 0 lt.eq a < r \,, bb(Z) \/ \( r + 1 \) { z^r } \, & q =
     n \,, bb(Z) { y_a } \, & q = n - 1 + 4 a \, quad 1 lt.eq a lt.eq r \,, 0 \, & upright("otherwise") .)
     $ <geo:unit-cohomology>]
  Here the upper generators may be chosen with $pi_(!) y_a = u^a$ and $y_a = z^(a - 1) y_1$;
    the latter assertion follows from the projection formula and the fact that $pi_(!)$ is an isomorphism in these
    upper degrees. At degree $n - 1$, the Gysin map from $H^0 \( M \)$ to $H^n \( M \)$ is multiplication by the
    nonzero integer $r + 1$, so $H^(n - 1) \( U \) = 0$. This also explains the sole torsion group in (8.8).
  Apply next the integral Gysin sequence of $rho$. The vanishing of odd groups of $U$ below degree $n$ inductively
    gives $H^(2 j - 1) \( B \) = 0$ for $2 j - 1 < n$. For positive even $2 j < n$ the remaining terms give
  #[#set math.equation(numbering: n => "(8.9)")
   $ 0 arrow.r H^(2 j - 2) \( B \) arrow.r^(med e smile med) H^(2 j) \( B \) arrow.r^(med rho^(*) med)
     H^(2 j) \( U \) arrow.r 0 . $ <geo:low-exact>]
  For $2 j = 2$ this says $H^2 \( B \) = bb(Z) e$. For $2 j = 4$, the last group is freely generated by $z$,
    so choose an integral lift $v$. If $j$ is odd, the last group in (8.9) vanishes and multiplication by $e$
    gives the next basis. If $j = 2 a$ is even, the last group is generated by $z^a$,
    and the class $v^a$ lifts that generator. Induction proves exactly the integral basis (8.4).
  In all degrees at most $n - 2$, the homology groups of $B$ are free and have the same ranks as its cohomology
    groups. Indeed the universal coefficient theorem detects torsion in $H_i \( B \; bb(Z) \)$ as torsion in
    $H^(i + 1) \( B \; bb(Z) \)$, and the latter groups are free through degree $n - 1$.
    Poincaré duality on the oriented $\( 2 n - 2 \)$-manifold $B$ now supplies all its cohomology in degrees at
    least $n$. It is free in even degrees and zero in odd degrees;
    together with the low-degree calculation this proves the asserted global statement.
  The circle Gysin sequence at degree $n$ uses $H^(n - 1) \( U \) = H^(n - 1) \( B \) = 0$ and $H^n \( U \) =
    bb(Z) \/ \( r + 1 \)$, and is precisely (8.6). The Poincaré pairing
  $ H^(n - 2) \( B \; bb(Z) \) times H^n \( B \; bb(Z) \) arrow.r bb(Z) $
  is unimodular, since these two groups are free. Composing one factor with the injection of index $r +
    1$ in (8.6) proves the determinant assertion (8.7). Finally $H^(n + 1) \( U \) = H^(n + 2) \( U \) =
    0$ by (8.8). The next portion of the circle Gysin sequence therefore makes multiplication by $e$ from degree
    $n$ to degree $n + 2$ an isomorphism.
  In every even degree $q gt.eq n$, the group $H^q \( U \; bb(Q) \)$ vanishes.
    The rational circle Gysin sequence therefore makes $e smile : H^(q - 2) \( B \; bb(Q) \) arrow.r
    H^q \( B \; bb(Q) \)$ surjective. The low-degree bases now show that the full rational ring is generated by
    $e \, v$. Below degree $n$, the basis ranks sum to
  $ sum_(j = 0)^(2 r - 1) #scale(x: 120%, y: 120%)[\(] floor.l j \/ 2 floor.r + 1 #scale(x: 120%, y: 120%)[\)] =
    2 sum_(a = 0)^(r - 1) \( a + 1 \) = r \( r + 1 \) . $
  Poincaré duality supplies another $r \( r + 1 \)$ dimensions above degree $n - 1$,
    and the middle odd group is zero. This proves (8.5). ◻
]

=== 8.2 The first free-loop attachment <the-first-free-loop-attachment>

The Gysin sequences determine the low-degree integral lattice and its middle determinant,
  but not the relations among $e$ and $v$. Those relations will come from the first nonconstant critical manifold
  of the free-loop energy.

Write $Lambda M = H^1 \( bb(R) \/ T bb(Z) \, M \)$ for the Sobolev free loop space,
  with rotation of the parameter as its circle action. The continuous-loop and Sobolev-loop models have the same
  homotopy type, compatibly with evaluation and rotation. We use the energy

$ cal(E) \( c \) = 1 / 2 integral_0^T \| dot(c) \( t \) \|^2 thin d t . $

For a circle space $A$, write $A_(h S^1) = E S^1 times_(S^1) A$.
  The constant-loop subspace has trivial action, hence its Borel construction is $M times B S^1$.

#thm([Proposition 8.3.])[
  (The first attachment and its coefficient).  #emph[There is an oriented rank-three vector bundle $E arrow.r
    B$ and an attaching map
$ f : S \( E \) arrow.r M . $

 Let $p : S \( E \) arrow.r B$ and put $x = f^(*) u in H^4 \( S \( E \) \; bb(Z) \)$. The following properties hold:]
  + #emph[The pullback $rho^(*) E$ is the first negative bundle for the free-loop energy.
    It is isomorphic as a real vector bundle to the rank-three bundle $K arrow.r U$ with fiber
$ K_w = { a in w^perp : J_a \( D \) = 0 } \, quad J_a \( 0 \) = 0 \, quad J'_a \( 0 \) = a \, $

 where $J_a$ is the normal Jacobi field along $gamma_w$.]
  + #emph[Let $tilde(p) : S \( rho^(*) E \) arrow.r U$ and $hat(rho) : S \( rho^(*) E \) arrow.r
    S \( E \)$ be the pullback square. Then
#[#set math.equation(numbering: n => "(8.10)")
 $ hat(rho)^(*) x = tilde(p)^(*) z . $ <geo:attachment-pullback>]

]
  + #emph[After choosing the orientation of $E$, one has
#[#set math.equation(numbering: n => "(8.11)")
 $ p_(!) x = e . $ <geo:primitive-boundary>]

 With either orientation its coefficient is $plus.minus 1$.]
  + #emph[The actual negative bundle satisfies
#[#set math.equation(numbering: n => "(8.12)")
 $ rho^(*) p_1 \( E \) = 4 z . $ <geo:negative-pontryagin>]

]
] <geo:attachment>

The attaching map makes $x^(r + 1) = f^(*) \( u^(r + 1) \) = 0$.
  The sphere integral $p_(!) x = e$ fixes the coefficient of the fiber part of $x$, while $rho^(*) p_1 \( E \) =
  4 z$ carries the incidence coefficient to the actual negative bundle.
  Separating $x$ into base and fiber parts will turn its nilpotence into relations on $B$.
  The middle determinant will then fix the scale of the top-degree pairing used to evaluate $N$.

Figure 2 distinguishes the pullback square from the evaluation homotopy used in part (ii).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3, 1.8), [#text(size: 9pt)[$S( rho^*E)$]])
  content((1, 1.8), [#text(size: 9pt)[$S(E)$]])
  content((-3, -0.2), [#text(size: 9pt)[$U="SM"$]])
  content((1, -0.2), [#text(size: 9pt)[$B=U"/"S^1$]])
  content((4, 1.8), [#text(size: 9pt)[$M$]])
  line((-2.328, 1.8), (0.4626, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-1, 1.8), [#text(size: 9pt)[$hat( rho )$]], anchor: "south", padding: 0.1176cm)
  line((1.537, 1.8), (3.748, 1.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.5, 1.8), [#text(size: 9pt)[$f$]], anchor: "south", padding: 0.1176cm)
  line((-3, 1.514), (-3, 0.04624), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-3, 0.8), [#text(size: 9pt)[$tilde(p)$#linebreak()$S^2 "fibers"$]], anchor: "east", padding: 0.1176cm)
  line((1, 1.517), (1, 0.09304), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1, 0.8), [#text(size: 9pt)[$p$#linebreak()$S^2 "fibers"$]], anchor: "west", padding: 0.1176cm)
  line((-2.415, -0.2), (0.2801, -0.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-1, -0.2), [#text(size: 9pt)[$rho (S^1 "fibers" )$]], anchor: "north", padding: 0.1176cm)
  content((-1, 0.8), [#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[pullback]]])])
  content((-3, -1.15), [#text(size: 9pt)[marked unit-speed#linebreak()oriented geodesic]])
  content((1, -1.15), [#text(size: 9pt)[oriented geodesic#linebreak()with no marked point]])
  content((0.2, -2.25), [#text(size: 9pt)[$f compose hat( rho ) tilde.eq pi compose tilde(p)$ \(evaluation homotopy\)]])
  content((0.2, -3), [#text(size: 9pt)[$x=f^*u, z= pi^*u, hat( rho )^*x= tilde(p)^*z$]])
})],
  caption: [Figure 2: The sphere bundle of the descended rank-three bundle $E$ and its pullback to $U = S M$. The square is a pullback, with vertical fibers $S^2$ and horizontal fibers $S^1$. The attaching map $f$ is not point evaluation of an unmarked geodesic. Evaluation of the attachment gives the displayed homotopy and hence the equality of cohomology classes. ],
) <fig:attachment-pullback>

#proof[
  We give the index, attachment, and integral-coefficient details.
  ===== 8.2.1 Critical manifolds and indices. <critical-manifolds-and-indices.>
  The positive critical levels are $j^2 T \/ 2$, $j gt.eq 1$; the critical manifold at each is a copy of $U$,
    parametrized by $w mapsto \( t mapsto gamma_w \( j t \) \)$.
    These are all the nonconstant critical loops because every geodesic has prime length $T$.
  For the $j$th iterate, reparametrize variations by arclength on $\[ 0 \, j T \]$.
    The kernel of the periodic Hessian consists of all periodic Jacobi fields.
    All normal Jacobi fields are $T$-periodic by the differential of $phi.alt_T = upright("Id")$,
    so their dimension is $2 d$. A tangential Jacobi field is an affine scalar multiple of the velocity;
    the periodic boundary conditions force its scalar to be constant.
    The kernel therefore has dimension $2 d + 1 = dim U$. Variations of the initial unit tangent vector,
    including the time-shift direction, realize precisely these fields.
    Thus the Hessian kernel is the tangent space to the critical manifold, as required by the Morse–Bott condition.
  The periodic index equals the fixed-endpoint index. To see this without an index correction formula,
    evaluation at the marked initial point maps the periodic kernel onto $T_(pi \( w \)) M$:
    arbitrary normal initial values are possible, and the constant tangent field supplies the remaining direction.
    Choose a linear right inverse to this evaluation. Subtracting the corresponding kernel field from a periodic
    test field makes both endpoint values zero. The index form is unchanged, including its mixed terms,
    because a kernel field pairs to zero with every periodic test field by integration by parts.
    This subtraction is injective on every negative definite subspace.
    Conversely, fixed-endpoint test fields form a subspace of the periodic domain.
    The two indices are consequently equal.
  Interior conjugate instants on $\[ 0 \, j T \]$ occur at the $j$ odd multiples of $D$, with multiplicity three,
    and the $j - 1$ positive multiples of $T$, with multiplicity $d$.
    The fixed-endpoint Morse index theorem #cite(label("Milnor1963")) Theorem 15.1, p. 83 gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ lambda_j = 3 j + d \( j - 1 \) . $ <geo:iterate-index>]
  In particular $lambda_1 = 3$, while every later index is at least $d + 6 = n + 5 gt.eq 13$.
    The index count is unchanged on completing the piecewise smooth zero-endpoint fields in $H^1$:
    the index form is continuous, and any finite negative Gram matrix remains negative after sufficiently close
    smooth approximation.
  ===== 8.2.2 Negative bundles and attachment. <negative-bundles-and-attachment.>
  Let $nu arrow.r U$ be the negative spectral bundle of the periodic $L^2$ Jacobi operator
  $ cal(A)_w V = - nabla_t^2 V - R \( V \, dot(gamma)_w \) dot(gamma)_w . $
  This self-adjoint operator has domain the periodic $H^2$ fields,
    and its quadratic form is the index form on periodic $H^1$ fields.
    Its negative eigenvalues form an isolated finite cluster.
    The constant index and nullity, together with compactness of $U$,
    make the corresponding spectral projections locally smooth in the initial data.
    Elliptic regularity makes their eigenfields smooth, so $nu$ is a genuine rank-three bundle.
    It represents the negative bundle for the Hilbert-space Morse–Bott attachment as well.
    Indeed, projection from the negative subspace of the bounded $H^1$-Riesz Hessian to $nu_w$ is injective:
    a vector in its kernel would have nonnegative index form in the $L^2$ spectral decomposition.
    Equal negative ranks make this a bundle isomorphism. Each fixed parameter rotation intertwines these operators
    and projections with those at the rotated geodesic. The resulting action on $nu$ is continuous and covers the
    free smooth circle action on $U$. Hence $nu$ descends to a real bundle $E arrow.r B$,
    with $nu tilde.equiv rho^(*) E$. Since $B$ is simply connected, $E$ is orientable.
  We use the Morse–Bott disk-attachment theorem for the energy on the $H^1$ loop space of a closed Riemannian
    manifold. The energy satisfies the Palais–Smale condition.
    Its Hessian is nondegenerate normal to each compact critical manifold just described,
    and has finite negative index. The bounded $H^1$ Hessian is Fredholm;
    its identified kernel therefore gives an invertible restriction normal to the critical manifold,
    as in the formulation cited below. Thus sublevels bracketing one critical value differ, up to homotopy,
    by the disk and sphere bundles of its negative bundle. This construction also respects parameter rotation.
    Indeed each fixed rotation is a smooth isometry for the natural loop-space metric, preserves energy,
    commutes with the gradient deformation, and preserves the Hessian splitting.
    The local normal form and the contraction of its positive directions may be constructed from these invariant
    metrics and splittings. Joint differentiability of the circle action on the whole $H^1$ manifold is not
    needed. For this equivariant negative-bundle formulation see
    #cite(label("OttosenBokstedt2007"), form: "prose") Section 7, pp. 2190–2192,
    following the Hilbert-space attachment of #cite(label("Klingenberg1978"), form: "prose") Theorem 2.4.10.
    The associated Borel vector bundle and Thom quotient are described in
    #cite(label("OttosenBokstedt2007"), form: "prose") Lemma 5.1, pp. 2185–2186.
  Here is the attaching map and its evaluation property explicitly.
    Start a sufficiently small negative disk at every first-level geodesic by pointwise exponential of the
    negative fields. Its boundary lies strictly below the first positive critical value, uniformly over $U$.
    That lower sublevel deforms equivariantly to the constants.
    This follows from the noncritical energy deformation between the boundary level and a small positive level,
    followed by contraction of small loops to constants. For the latter, embed $M$ in Euclidean space,
    average a sufficiently short loop, and project the straight contraction to a tubular neighborhood of $M$.
    Small energy gives uniformly small length, so this is defined and continuous, preserves the constants,
    and commutes with rotation. The projection has bounded derivative,
    so choosing the initial small level sufficiently small keeps this contraction below the first critical value.
  Insert the boundary deformation in an outer collar of the small negative disk bundle.
    This produces an equivariant map of pairs
  $ cal(F)_1 : \( D \( nu \) \, S \( nu \) \) arrow.r \( Lambda M \, M \) $
  whose zero section is the first critical manifold and which represents its Morse–Bott attachment.
    On the boundary it takes values in the constants. Because the action on the constants is trivial,
    this boundary map descends to $f : S \( E \) arrow.r M$. Evaluation at time zero composed with $cal(F)_1$ is
    homotopic, by radial contraction of the disk fibers, to $pi$ composed with their bundle projection.
    Restrict this homotopy to $S \( nu \) tilde.equiv S \( rho^(*) E \)$.
    Its boundary value is $f compose hat(rho)$, which proves (8.10).
  Choose regular sublevels $Lambda_(-)$ and $Lambda_(+)$ immediately below and above the first positive critical
    value. The preceding attachment gives, over $bb(Z)$ or any field $bb(F)$,
  #[#set math.equation(numbering: n => "(8.14)")
   $ H^q \( Lambda_(+) \, M \; bb(F) \) & tilde.equiv H^(q - 3) \( U \; bb(F) \) \,\
H^q \( \( Lambda_(+) \)_(h S^1) \, M times B S^1 \; bb(F) \) & tilde.equiv H^(q - 3) \( B \; bb(F) \) .
  $ <geo:ordinary-relative>]
  These are Thom isomorphisms; in the second one the free first critical action identifies the Borel negative
    bundle with $E$ up to homotopy. One can take finite-dimensional free approximations to $E S^1$ throughout,
    apply the invariant attachment, and then pass to the limit.
    For every later critical level, the Borel negative bundle still exists over the Borel critical manifold even
    though the action has finite stabilizers. Its relative cohomology vanishes below its rank $lambda_j$,
    with any necessary orientation local system. The same statement holds without the Borel construction.
    Equation (8.13) therefore shows that subsequent attachments do not change cohomology in degrees at most five.
    The exhaustion by sublevels causes no extra term in these degrees:
    the restriction systems in the relevant degrees are eventually constant,
    so their inverse-limit obstruction vanishes.
  We have constructed the attachment and isolated the degrees in which no later attachment can alter it.
    What remains is to fix its coefficient integrally and identify its actual negative bundle.
  ===== 8.2.3 The coefficient is a unit over every prime field. <the-coefficient-is-a-unit-over-every-prime-field.>
  Since $H^2 \( B \; bb(Z) \) = bb(Z) e$, write $p_(!) x = c e$ with $c in bb(Z)$.
    Under (8.14), the connecting homomorphism
  $ H^4 \( M times B S^1 \; bb(F) \) arrow.r H^5 \( \( Lambda_(+) \)_(h S^1) \, M times B S^1 \; bb(F) \)
    tilde.equiv H^2 \( B \; bb(F) \) $
  sends the class $u$ from $M$ to $p_(!) x$, up to the Thom orientation sign.
    Indeed the connecting map first restricts to the attaching sphere, where that class is $x$,
    and then uses the boundary map for $\( D \( E \) \, S \( E \) \)$;
    the inverse Thom isomorphism identifies this last map with integration over the oriented sphere fiber.
  Suppose that $c$ vanished modulo a prime $ell$, and put $bb(F) = bb(Z) \/ ell$.
    Exactness would extend the pure class $u in H^4 \( M times B S^1 \; bb(F) \)$ over $\( Lambda_(+) \)_(h S^1)$
    and hence over $\( Lambda M \)_(h S^1)$, by the higher-index gap.
    After forgetting equivariance, its restriction would be the evaluation class
  $ a = "ev"_0^(*) u in H^4 \( Lambda M \; bb(F) \) . $
  To justify uniqueness here, (8.14) gives $H^4 \( Lambda_(+) \, M \; bb(F) \) = H^1 \( U \; bb(F) \) = 0$.
    Higher attachments have no effect in this range, so restriction $H^4 \( Lambda M \; bb(F) \) arrow.r
    H^4 \( M \; bb(F) \)$ is injective. The evaluation class is already one extension of $u$, and thus is the only one.
  An ordinary class restricted from the Borel construction has zero action slant.
    For completeness, if $Y$ is any circle space, fix $e_0 in E S^1$ and let $i \( y \) = \[ e_0 \, y \] in
    Y_(h S^1)$. For the action map $A : S^1 times Y arrow.r Y$, the two maps $i compose A$ and $i compose
    "pr"_Y$ are homotopic:
  $ \[ e_0 \, g y \] = \[ e_0 g \, y \] \, $
  and the loop $g mapsto e_0 g$ contracts in $E S^1$. Consequently the pullback of a Borel class under $i compose
    A$ has no component in $H^1 \( S^1 \; bb(F) \) ⊗ H^(* - 1) \( Y \; bb(F) \)$.
    Equivalently its slant with $\[ S^1 \]$ is zero. This is also the usual action description of the Borel $d_2$
    differential.
  The evaluation class $a$ has a nonzero action slant over every prime field.
    The integral cohomology ring of $M$ and the universal coefficient theorem give $H_2 \( M \; bb(Z) \) =
    H_3 \( M \; bb(Z) \) = 0$. Simple connectivity and successive applications of the Hurewicz theorem
    #cite(label("Hatcher2002")) Theorem 4.32 make $M$ three-connected;
    Hurewicz then identifies $pi_4 \( M \)$ with $H_4 \( M \; bb(Z) \) = bb(Z)$.
    Choose a based map $g : S^4 arrow.r M$ with $chevron.l g^(*) u \, \[ S^4 \] chevron.r = 1$, and let $hat(g) :
    S^3 arrow.r Omega M subset Lambda M$ be its adjoint. Evaluation of the rotated based loops on $S^1 times
    S^3$ factors, up to the orientation convention, through the smash quotient
  $ S^1 times S^3 arrow.r S^1 and S^3 = S^4 arrow.r^(med g med) M . $
  The quotient takes the cross-product fundamental class to the fundamental class of $S^4$, up to sign. Therefore
  $ ⟨hat(g)^(*) #scale(x: 120%, y: 120%)[\(] A^(*) "ev"_0^(*) u \/ \[ S^1 \]
    #scale(x: 120%, y: 120%)[\)] \, \[ S^3 \]⟩ = plus.minus 1 $
  integrally, and remains nonzero after reduction modulo $ell$.
    This contradicts the zero slant required of the hypothesized Borel extension.
    No prime divides $c$, so $c = plus.minus 1$. Reverse the orientation of $E$ if necessary to obtain (8.11).
  ===== 8.2.4 The negative bundle is the cut-fiber tangent bundle. <the-negative-bundle-is-the-cut-fiber-tangent-bundle.>
  For $a in K_w$, truncate $J_a$ to the first half-period and extend it by zero on the second half:
  $ hat(J)_a \( t \) = cases(delim: "{", J_a \( t \) \, & 0 lt.eq t lt.eq D \,, 0 \, & D lt.eq t lt.eq T .) $
  The endpoint values agree, so this is an $H^1$ periodic test field.
    Integration by parts on $\[ 0 \, D \]$, with the vanishing endpoint values and the Jacobi equation,
    gives zero index form on this entire three-dimensional space.
    Project these fields to the negative spectral space $nu_w$.
    If a projected vector were zero, its zero index form and its membership in the nonnegative spectral subspace
    would force it into the Hessian kernel. It would then be a smooth periodic Jacobi field.
    But a nonzero $J_a$ has nonzero derivative at $D$, since both zero value and zero derivative would make it
    identically zero. Its truncation has a derivative jump at $D$ and cannot be a kernel field.
    The projection is thus injective, and equal ranks make it an isomorphism $K_w arrow.r nu_w$.
    The truncation depends continuously in the $H^1$ norm on $w$ and $a$,
    and the spectral projections vary continuously as above. We obtain an isomorphism of real bundles $K
    tilde.equiv nu tilde.equiv rho^(*) E$. The truncations are used in the $H^1$ form domain,
    not in the $H^2$ operator domain; their derivative jump is the reason that a nonzero truncation cannot lie in
    the smooth kernel.
  Finally define the full cut map
  $ frak(a) : U arrow.r F \, wide frak(a) \( w \) = \( pi \( w \) \, exp_(pi \( w \)) \( D w \) \) . $
  By the actual bundle identification in Proposition 14, its pullback of $cal(V)$ is the initial-direction
    four-plane. The marked unit direction $w$ gives a trivial line in this plane;
    its orthogonal complement is exactly $K_w$, the tangent space of the great-three-sphere fiber. Hence
  $ frak(a)^(*) cal(V) tilde.equiv bb(R) xor K tilde.equiv bb(R) xor rho^(*) E . $
  The two point maps from $U$ to $M$ in $frak(a)$ are $pi$ and $pi compose phi.alt_D$.
    The geodesic flow provides a homotopy between them, so $frak(a)^(*) u_1 = frak(a)^(*) u_2 = z$.
    Taking first Pontryagin classes and using (8.1) proves (8.12). ◻
]

=== 8.3 Half-integral lifts and the middle pairing <half-integral-lifts-and-the-middle-pairing>

On each sphere fiber, half the Euler class of its tangent bundle integrates to one.
  This gives a normalized fiber class with which to separate $x$ into base and fiber parts.
  The base class may be only half-integral; we will track its displacement from the integral lift $v$ so that the
  middle determinant is preserved.

#thm([Proposition 8.4.])[
  (Arithmetic parameters).  #emph[Let $p : S \( E \) arrow.r B$ and $x$ be as in Proposition 19, and let
$ xi = 1 / 2 e \( T_(upright("vert")) S \( E \) \) in H^2 \( S \( E \) \; bb(Q) \) \, wide X =
  e^2 in H^4 \( B \; bb(Z) \) . $

 There is a class $Y in H^4 \( B \; bb(Q) \)$ such that, with pullbacks by $p$ suppressed,
#[#set math.equation(numbering: n => "(8.15)")
 $ x = Y + e xi \, wide xi^2 = p_1 \( E \) \/ 4 \, wide p_(!) xi = 1 \, wide rho^(*) Y = z \, wide
   2 Y in H^4 \( B \; bb(Z) \) . $ <geo:sphere-parameters>]

 For an integer $b$,
#[#set math.equation(numbering: n => "(8.16)")
 $ Y = v + b / 2 e^2 . $ <geo:Y-lift>]

 There are rational numbers $alpha \, beta$ with
#[#set math.equation(numbering: n => "(8.17)")
 $ L := e^2 p_1 \( E \) \/ 4 = alpha X^2 + beta X Y \, wide 4 alpha in bb(Z) \, wide \| beta \| =
   1 . $ <geo:L-parameters>]

 Here $beta = 1$ for (8.1); retaining $beta$ also allows the opposite generator convention, for which $beta = -
   1$. Moreover
#[#set math.equation(numbering: n => "(8.18)")
 $ \( Y + e xi \)^(r + 1) = \( Y - e xi \)^(r + 1) = 0 quad
   upright("in ") H^(*) \( S \( E \) \; bb(Q) \) . $ <geo:two-nilpotents>]

]
  #emph[Count $X \, Y$ as polynomial degree one, corresponding to cohomological degree four.
    For homogeneous polynomials of degree $2 r - 1$, set
$ ell \( P \) = integral_B e P \( X \, Y \) . $

 Then the middle moment matrix satisfies
#[#set math.equation(numbering: n => "(8.19)")
 $
   lr(|det [ell #scale(x: 120%, y: 120%)[\(] X^(2 r - 1 - i - j) Y^(i + j) #scale(x: 120%, y: 120%)[\)]]_(0 lt.eq
   i \, j < r)|) = r + 1 \, wide ell \( X^(2 r - 1) \) = N . $ <geo:moment-determinant>]

 Pullback $p^(*) : H^(*) \( B \; bb(Q) \) arrow.r H^(*) \( S \( E \) \; bb(Q) \)$ is injective,
   and multiplication by $e$ on $H^n \( B \; bb(Q) \)$ is injective.]
] <geo:parameters>

#proof[
  Give each unit sphere fiber the boundary orientation from $E$.
    The marked unit vector in $p^(*) E$ spans a trivial line,
    with orthogonal complement the oriented vertical tangent two-plane:
  $ p^(*) E tilde.equiv bb(R) xor T_(upright("vert")) S \( E \) . $
  For an oriented real two-plane bundle, the first Pontryagin class is the square of its Euler class.
    Thus $xi^2 = p^(*) p_1 \( E \) \/ 4$. On a sphere fiber the Euler class of its tangent bundle integrates to
    two, giving $p_(!) xi = 1$.
  The Euler class of the oriented rank-three bundle $E$ lies in $H^3 \( B \; bb(Z) \) = 0$, so it vanishes.
    The sphere-bundle Gysin sequence then gives, in every degree,
    a short exact sequence whose first map is $p^(*)$ and whose last map is $p_(!)$.
    In particular $p^(*)$ is injective. Over $bb(Q)$, the classes $1 \,
    xi$ restrict to a basis of each sphere’s cohomology, so Leray–Hirsch gives the module decomposition
  $ H^(*) \( S \( E \) \; bb(Q) \) = p^(*) H^(*) \( B \; bb(Q) \) xor xi thin p^(*) H^(* - 2) \( B \; bb(Q) \) . $
  Since $p_(!) x = e$, there is a unique rational class $Y$ with $x = p^(*) Y + p^(*) e thin xi$. The integral class
  $ 2 x - p^(*) e thin e \( T_(upright("vert")) S \( E \) \) $
  has zero sphere integral. Integral Gysin exactness expresses it as $p^(*) Y_2$ for $Y_2 in
    H^4 \( B \; bb(Z) \)$. Rational injectivity of $p^(*)$ gives $Y_2 = 2 Y$.
    This proves half-integrality without assuming that $Y$ itself is integral.
  Pull back to the square over $U$ in Proposition 19. The class $rho^(*) e$ vanishes,
    as it does for the Euler class pulled to its own circle bundle. Equation (8.10) now gives
  $ tilde(p)^(*) \( rho^(*) Y \) = hat(rho)^(*) x = tilde(p)^(*) z . $
  The pullback sphere bundle also has zero Euler class; its rational Gysin sequence makes $tilde(p)^(*)$
    injective. It follows that $rho^(*) Y = z$. Write $2 Y = a v +
    b e^2$ in the integral basis supplied by Lemma 18. Since $rho^(*) v =
    z$ is a primitive generator of $H^4 \( U \; bb(Z) \)$, pulling back gives $a = 2$. This proves (8.16).
  Similarly, integrality of $p_1 \( E \)$ and (8.12) give
  $ p_1 \( E \) = A e^2 + 4 v \, wide A in bb(Z) . $
  If the opposite sign of the incidence coefficient is retained, this reads $p_1 \( E \) = A e^2 + 4 beta v$,
    with $beta = plus.minus 1$. In either convention substitution of $v = Y - \( b \/ 2 \) e^2$ gives
  $ L = frac(A - 2 beta b, 4) X^2 + beta X Y . $
  Thus $4 alpha = A - 2 beta b$ is integral, proving (8.17).
  The first equality in (8.18) is $x^(r + 1) = f^(*) \( u^(r + 1) \) = 0$.
    Fiber antipodal reflection covers the identity of $B$ and reverses the orientation of the two-dimensional
    sphere fibers. Its pullback fixes base classes and sends the vertical Euler class, hence $xi$,
    to its negative. Pulling back the first equality proves the second one.
  It remains to identify the moment determinant. An integral basis of $H^(n - 2) \( B \; bb(Z) \)$ from (8.4) is
  $ b_i = e X^(r - 1 - i) v^i \, wide 0 lt.eq i < r . $
  The matrix of (8.7) in this basis has entries
  $ integral_B e b_i b_j = integral_B e X^(2 r - 1 - i - j) v^(i + j) . $
  Replace $v$ in these basis vectors by $Y = v + \( b \/ 2 \) X$.
    The change of basis over $bb(Q)$ is triangular with every diagonal entry equal to one.
    Hence its determinant is one and it does not change the determinant of the bilinear form.
    Lemma 18 proves the first assertion in (8.19). The second follows from $e X^(2 r - 1) =
    e^(4 r - 1)$ and the definition of $N$. The final injectivity statements were proved above for $p^(*)$ and in
    Lemma 18 for multiplication by $e$. ◻
]

== 9 The sharp quaternionic volume bound <alg:section>

We retain the notation of Section 8. Thus $n = 4 r$, $r gt.eq 2$, and

$ X = e^2 \, wide L = e^2 p_1 \( E \) \/ 4 = alpha X^2 + beta X Y \, wide 4 alpha in bb(Z) \, quad \| beta \| = 1 . $

In this section the polynomial degrees of $X$ and $Y$ are both one;
  one polynomial degree therefore means cohomological degree four. Let

#[#set math.equation(numbering: n => "(9.1)")
 $ ell \( P \) = integral_B e P \( X \, Y \) \, wide deg P = 2 r - 1 . $ <alg:functional>]

The inputs of Proposition 20 include

#[#set math.equation(numbering: n => "(9.2)")
 $ I_j = ell \( X^(2 r - 1 - j) Y^j \) \, wide lr(|det \( I_(i + j) \)_(0 lt.eq i \, j < r)|) = r + 1 \, wide N =
   I_0 > 0 . $ <alg:middle-input>]

Our goal is $N lt.eq binom(4 r, 2 r) \/ \( 2 r + 1 \)$, the model value computed in Proposition 17.
  The attachment gives polynomial relations; the middle determinant fixes the scale of the top functional;
  an explicit coefficient sum then gives the bound. We do not prescribe the cohomology ring of the geodesic
  quotient in advance.

=== 9.1 The power relations and the nonzero parameter <the-power-relations-and-the-nonzero-parameter>

Introduce a formal variable $Z$ with $Z^2 = L$ and define homogeneous polynomials in $X \, Y$ by

#[#set math.equation(numbering: n => "(9.3)")
 $ Q \( X \, Y \) & = frac(\( Y + Z \)^(r + 1) - \( Y - Z \)^(r + 1), 2 Z) =
   sum_(j gt.eq 0) binom(r + 1, 2 j + 1) Y^(r - 2 j) L^j \,\
R \( X \, Y \) & = frac(\( Y + Z \)^(r + 1) + \( Y - Z \)^(r + 1), 2) =
  sum_(j gt.eq 0) binom(r + 1, 2 j) Y^(r + 1 - 2 j) L^j . $ <alg:Q>]

Only the terms with valid binomial indices are included. The quotient in (9.3) is a polynomial identity;
  it involves no division by a cohomology class. The degrees of $Q \, R$ are $r \, r + 1$, respectively.

#thm([Lemma 9.1.])[
  #emph[The classes $Q \( X \, Y \)$ and $R \( X \, Y \)$ vanish in $H^(*) \( B \; bb(Q) \)$.
    Moreover $alpha eq.not 0$, and consequently $\| 4 alpha \| gt.eq 1$.]
] <alg:relations>

#proof[
  On the sphere bundle $p : S \( E \) arrow.r B$, the attachment class is $x = Y +
    e xi$ and satisfies $x^(r + 1) = 0$. The fiber antipode sends $xi$ to $- xi$, so $\( Y - e xi \)^(r + 1) =
    0$ as well. Taking the sum gives $p^(*) R = 0$. The rational Leray–Hirsch decomposition with basis $1 \,
    xi$ makes $p^(*)$ injective, hence $R = 0$. Taking the difference and integrating over the sphere fiber,
    using $p_(!) xi = 1$, gives $e Q = 0$. The class $Q$ has cohomological degree $4 r = n$,
    and multiplication by $e$ is injective from $H^n \( B \; bb(Q) \)$ to $H^(n + 2) \( B \; bb(Q) \)$ by
    Lemma 18. Therefore $Q = 0$.
  Suppose now that $alpha = 0$. We use the nondegenerate moment pairing in (9.2) to obtain a contradiction. Write
  $ q \( y \) = Q \( 1 \, y \) \, wide a \( y \) = R \( 1 \, y \) \, wide A_0 = bb(C) \[ y \] \/ \( q \) . $
  The polynomial $q$ has degree $r$ and leading coefficient $r + 1$.
    The relations $Q = 0$ imply that the rule $y^j mapsto I_j$, for $0 lt.eq j lt.eq 2 r - 1$,
    agrees with reduction modulo $q$ followed by a functional $F : A_0 arrow.r bb(C)$.
    Indeed, every multiple of $q$ needed in dividing a polynomial of this degree has multiplier of degree at most
    $r - 1$, and its homogenization is a top-degree multiple of $Q$.
    Thus the matrix of $\( f \, g \) mapsto F \( f g \)$ in $1 \, y \, dots.h \,
    y^(r - 1)$ is precisely the nonsingular matrix in (9.2). The relation $R = 0$ similarly gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ F \( a \( y \) y^j \) = 0 wide \( 0 lt.eq j lt.eq r - 2 \) . $ <alg:orthogonal-R>]
  Let $epsilon : A_0 arrow.r bb(C)$ extract the coefficient of $y^(r - 1)$ in the remainder of degree less than
    $r$. Its product pairing is nondegenerate: the entry $epsilon \( y^(i + j) \)$ is zero when $i + j < r -
    1$ and one when $i + j = r - 1$, for $0 lt.eq i \, j < r$.
    Reversing the columns gives a triangular matrix with diagonal entries one.
    Hence there is a unique $b in A_0$ such that $F \( f \) = epsilon \( b f \)$ for all $f$.
    Nondegeneracy of the $F$ pairing means that multiplication by $b$ is invertible, so $b$ is a unit.
    For the $epsilon$ pairing the orthogonal complement of $1 \, y \, dots.h \,
    y^(r - 2)$ consists exactly of the constants. To see this, write a remainder $c_0 + dots.h.c +
    c_(r - 1) y^(r - 1)$ and successively test against $1 \, y \, dots.h \, y^(r - 2)$;
    the tests force $c_(r - 1) \, c_(r - 2) \, dots.h \, c_1$ to vanish in that order.
    Equation (9.4) therefore says that $b a$ is constant. In particular any nonzero class $a$ satisfying that
    equation must be a unit: its product with the unit $b$ is a nonzero constant.
  But the class of $a = R \( 1 \, y \)$ is nonzero and is not a unit.
    Both $q$ and $a$ vanish at $y = 0$ when $alpha = 0$, so evaluation at zero precludes invertibility.
    To check that the class is nonzero, choose an $\( r + 1 \)$st root of unity $eta eq.not 1 \, - 1$, and put
  $ c_eta = frac(eta - 1, eta + 1) \, wide y_0 = beta / c_eta^2 \, wide Z_0 = c_eta y_0 . $
  These numbers are nonzero, $Z_0^2 = beta y_0$, and $y_0 + Z_0 = eta \( y_0 - Z_0 \)$ with $y_0 - Z_0 eq.not 0$.
    The formulas for $Q \, R$ give $q \( y_0 \) = 0$ but $a \( y_0 \) = \( y_0 - Z_0 \)^(r + 1) eq.not 0$.
    Thus $a$ cannot be zero modulo $q$, a contradiction. We conclude that $alpha eq.not 0$.
    Its stated integrality then gives $\| 4 alpha \| gt.eq 1$. ◻
]

#thm([Lemma 9.2.])[
  #emph[For $alpha eq.not 0$, the polynomials $Q \, R$ have no common nonzero zero over $bb(C)$. The algebra
$ cal(A) = bb(C) \[ X \, Y \] \/ \( Q \, R \) $

 has Hilbert series
#[#set math.equation(numbering: n => "(9.5)")
 $
   frac(\( 1 - t^r \) \( 1 - t^(r + 1) \), \( 1 - t \)^2) = \( 1 + t + dots.h.c + t^(r - 1) \) \( 1 + t +
   dots.h.c + t^r \) . $ <alg:hilbert>]

 In particular its top degree is $2 r - 1$, with dimension one, and
#[#set math.equation(numbering: n => "(9.6)")
 $ X : cal(A)_(r - 1) arrow.r cal(A)_r quad upright("is an isomorphism") \, wide dim cal(A)_(r - 1) =
   dim cal(A)_r = r . $ <alg:middle-isomorphism>]

 Furthermore the complete rational relation ideal of the classes $e \,
   Y$ is generated by $Q \( e^2 \, Y \)$ and $R \( e^2 \, Y \)$.]
] <alg:complete-intersection>

#proof[
  At a common zero $\( X \, Y \)$ choose a complex square root $Z$ of $alpha X^2 + beta X Y$.
    If $Z eq.not 0$, simultaneous vanishing of $Q \, R$ would force both $\( Y + Z \)^(r + 1)$ and
    $\( Y - Z \)^(r + 1)$ to vanish, which is impossible unless $Y = Z = 0$.
    If $Z = 0$, the formulas become $Q = \( r + 1 \) Y^r$ and $R = Y^(r + 1)$, so $Y = 0$; then $alpha X^2 =
    0$ forces $X = 0$ as well.
  The two homogeneous polynomials are therefore relatively prime.
    Multiplication by $Q$ in $bb(C) \[ X \, Y \]$ is injective, and multiplication by $R$ is injective modulo $Q$:
    in the polynomial unique factorization domain, $Q divides R f$ and relative primality imply $Q divides f$.
    The two resulting multiplication exact sequences give (9.5).
    On setting $X = 0$, the quotient becomes $bb(C) \[ Y \] \/ \( Y^r \)$.
    Thus the degree-$r$ cokernel of multiplication by $X$ vanishes.
    The two dimensions read from (9.5) are equal, which proves (9.6).
  For the assertion about the whole cohomology ring, Lemma 18 gives generation of $H^(*) \( B \; bb(Q) \)$ by
    $e \, v$ and total dimension $2 r \( r + 1 \)$. Since $Y = v + \( b \/ 2 \) e^2$ by (8.16),
    the same ring is generated by $e \, Y$.
  The polynomial algebra $bb(C) \[ e \, Y \]$ is free on $1 \, e$ over $bb(C) \[ X \, Y \]$ under $X = e^2$.
    Quotienting by the two displayed relations therefore gives $cal(A) xor e cal(A)$,
    of dimension $2 r \( r + 1 \)$ by (9.5). Its surjection to $H^(*) \( B \; bb(C) \)$ is an isomorphism by the
    equality of dimensions. The relations and maps are defined over $bb(Q)$, giving the rational assertion as well. ◻
]

=== 9.2 An explicit top functional and its determinant <an-explicit-top-functional-and-its-determinant>

The algebraic method is the classical perfect-pairing duality for finite graded complete intersections;
  see #cite(label("Huneke1999"), form: "prose") Corollary 3.5 and the discussion following Theorem 9.1.
  We make the pairing explicit to determine its normalization and the required determinant.

The power relations suggest replacing $Y + Z$ and $Y - Z$ by two nilpotent variables $a_1 \, a_2$.
  With $Y = \( a_1 + a_2 \) \/ 2$ and $Z = \( a_1 - a_2 \) \/ 2$, the equation $Z^2 =
  L$ becomes a quadratic relation for $X$. The resulting algebra admits explicit coefficient extraction;
  the involution exchanging $a_1 \, a_2$ will recover the pairing on $cal(A)$ without cancelling $Z$.

For any complex $alpha eq.not 0$ and any complex $beta$, set

#[#set math.equation(numbering: n => "(9.7)")
 $ cal(D)_(alpha \, beta) =
   frac(bb(C) \[ a_1 \, a_2 \, X \], #scale(x: 120%, y: 120%)[\(] a_1^(r + 1) \, a_2^(r + 1) \, 4 alpha X^2 + 2
   beta \( a_1 + a_2 \) X - \( a_1 - a_2 \)^2 #scale(x: 120%, y: 120%)[\)]) . $ <alg:extraction-algebra>]

All three variables have polynomial degree one. Every class has a unique remainder that has $X$-degree at most one
  and each $a_i$-degree at most $r$. Denote extraction of $X a_1^r a_2^r$ in that remainder by $epsilon_(cal(D))$.
  On homogeneous polynomials of degree $2 r - 1$ define

#[#set math.equation(numbering: n => "(9.8)")
 $ Phi_(alpha \, beta) \( P \) = epsilon_(cal(D)) (\( a_1 - a_2 \)^2 P (X \, frac(a_1 + a_2, 2))) . $ <alg:Phi>]

#thm([Lemma 9.3.])[
  #emph[The functional $Phi_(alpha \, beta)$ descends to the top degree of $cal(A)$ and is nonzero. If
$ J_j = Phi_(alpha \, beta) \( X^(2 r - 1 - j) Y^j \) \, $

 then for every $alpha eq.not 0$ and every $beta in bb(C)$,
#[#set math.equation(numbering: n => "(9.9)")
 $
   det \( J_(i + j) \)_(0 lt.eq i \, j < r) = \( - 1 \)^(r \( r + 1 \) \/ 2) \( r + 1 \) \( 4 alpha \)^(- r \( r -
   1 \) \/ 2) . $ <alg:determinant-formula>]

 For the geometric parameters there is consequently a scalar $K$ with
#[#set math.equation(numbering: n => "(9.10)")
 $ ell = K Phi_(alpha \, beta) \, wide \| K \| = \| 4 alpha \|^(\( r - 1 \) \/ 2) . $ <alg:normalization>]

]
] <alg:determinant>

#proof[
  Put $Y = \( a_1 + a_2 \) \/ 2$ and $Z = \( a_1 - a_2 \) \/ 2$ inside $cal(D)$.
    Its quadratic relation becomes $Z^2 = L$ and its other relations become
  $ R = 0 \, wide Z Q = 0 . $
  It follows at once that multiplying either $R$ or $Q$ by $4 Z^2$ gives zero,
    so (9.8) annihilates the top-degree multiples of both relations.
  We next prove nondegeneracy, uniformly in the complex parameter $beta$. The coefficient functional on
  $ D_0 = bb(C) \[ a_1 \, a_2 \] \/ \( a_1^(r + 1) \, a_2^(r + 1) \) $
  extracting $a_1^r a_2^r$ has a perfect product pairing, since every monomial pairs with its complementary
    monomial. The quadratic relation in (9.7) is monic after division by $4 alpha$, so $cal(D) = D_0 xor X D_0$.
    Its coefficient pairing is perfect as well. Indeed, if $f + X g$ annihilates every element of $D_0$,
    extraction shows that $g = 0$; testing then against $X D_0$ shows that $f = 0$.
    The grading makes this a perfect pairing between complementary degrees summing to $2 r + 1$.
  The involution exchanging $a_1 \, a_2$ preserves $epsilon_(cal(D))$.
    Its even and odd subspaces are therefore orthogonal, and the odd subspaces in complementary degrees pair
    perfectly. Their exact module description is particularly useful.
    Before imposing $R \, Z Q$, the relation $Z^2 = L$ gives the direct sum
  $ bb(C) \[ X \, Y \] xor Z bb(C) \[ X \, Y \] . $
  The ideal generated by $R \, Z Q$ has even part $\( R \, L Q \)$ and odd part $Z \( R \, Q \)$. Consequently
  #[#set math.equation(numbering: n => "(9.11)")
   $ cal(D)^(-) tilde.eq Z cal(A) quad upright("as a graded module, with a shift by one") . $ <alg:odd-module>]
  This follows by taking the two summands of the ideal; no cancellation of $Z$ in the quotient is used.
  By (9.6), multiplication by $X$ carries $cal(D)_r^(-)$ isomorphically onto $cal(D)_(r + 1)^(-)$. In the basis
  $ \( a_1 - a_2 \) X^(r - 1 - i) Y^i \, wide 0 lt.eq i < r \, $
  of $cal(D)_r^(-)$, the bilinear pairing $\( f \, g \) mapsto
    epsilon_(cal(D)) \( f X g \)$ has matrix $\( J_(i + j) \)$.
    It is nondegenerate because the odd complementary-degree pairing is perfect.
    This proves in particular that $Phi$ is nonzero.
  For fixed nonzero $alpha$, reduction of powers of $X$ by its monic quadratic relation makes every $J_j$ a
    polynomial in $beta$. The determinant is thus a polynomial in $beta$ which, by the preceding argument,
    has no complex zero. It is a nonzero constant in $beta$. It remains to evaluate it at $beta = 0$.
  First set $alpha = 1 \/ 4$ as well, so that $X^2 = \( a_1 - a_2 \)^2$. In $cal(A)$ use the linear coordinates
  $ A_1 = Y + X \/ 2 \, wide A_2 = Y - X \/ 2 . $
  For $p + q = 2 r - 1$, the coefficient of $X$ in the quadratic remainder of $A_1^p A_2^q$ is the polynomial
  $ frac(a_1^p a_2^q - a_1^q a_2^p, 2 \( a_1 - a_2 \)) . $
  The numerator is divisible by $a_1 - a_2$. Multiplying by $\( a_1 - a_2 \)^2$ and extracting $a_1^r a_2^r$ gives
  #[#set math.equation(numbering: n => "(9.12)")
   $ Phi_(1 \/ 4 \, 0) \( A_1^p A_2^q \) =
     cases(delim: "{", - 1 \, & \( p \, q \) = \( r \, r - 1 \) \,, 1 \, & \( p \, q \) = \( r - 1 \, r \) \,,
     0 \, & upright("otherwise") .) $ <alg:base-functional>]
  In the degree-$\( r - 1 \)$ monomial basis $A_1^(r - 1 - i) A_2^i$, the matrix of the middle $X = A_1 -
    A_2$ pairing has entries $- 2$ for $i + j = r - 1$, entries $1$ for $i + j = r - 2$ or $r$,
    and zero otherwise. Reversing columns gives the tridiagonal matrix with diagonal $-
    2$ and adjacent entries $1$. Its size-$r$ determinant is $\( - 1 \)^r \( r + 1 \)$:
    expansion along the last row gives the recurrence $d_r = - 2 d_(r - 1) - d_(r - 2)$ with $d_0 = 1 \, d_1 = -
    2$. Column reversal has sign $\( - 1 \)^(r \( r - 1 \) \/ 2)$.
    The linear change from $X \, Y$ to $A_1 \, A_2$ has determinant one,
    so its degree-$\( r - 1 \)$ monomial change also has determinant one.
    We have proved (9.9) at $\( alpha \, beta \) = \( 1 \/ 4 \, 0 \)$.
  At $beta = 0$ for general $alpha eq.not 0$, odd-indexed $J_j$ vanish. For $j = 2 h$, quadratic reduction gives
  $ J_(2 h) \( alpha \, 0 \) = \( 4 alpha \)^(- \( r - 1 - h \)) J_(2 h) \( 1 \/ 4 \, 0 \) . $
  Every nonzero permutation term in the size-$r$ determinant therefore has parameter exponent
  $ - sum_(i = 0)^(r - 1) (r - 1 - frac(i + sigma \( i \), 2)) = - frac(r \( r - 1 \), 2) . $
  This proves (9.9) for $beta = 0$, and its independence of $beta$ proves the full identity.
  Finally, $ell$ and $Phi$ are nonzero functionals on the same one-dimensional top degree of $cal(A)$, so $ell =
    K Phi$. Taking absolute determinants in (9.2) and (9.9) gives
  $ r + 1 = \| K \|^r \( r + 1 \) \| 4 alpha \|^(- r \( r - 1 \) \/ 2) \, $
  which is (9.10). ◻
]

=== 9.3 The model upper bound <the-model-upper-bound>

#thm([Theorem 9.4.])[
  #emph[For a quaternionic-type Blaschke manifold of dimension $4 r$, $r gt.eq 2$,
    the contact characteristic number of Proposition 17 satisfies
#[#set math.equation(numbering: n => "(9.13)")
 $ N = integral_B e^(4 r - 1) lt.eq frac(1, 2 r + 1) binom(4 r, 2 r) . $ <alg:sharp-upper>]

]
] <alg:upper>

#proof[
  The quadratic relation in (9.7) is
  $ X^2 = frak(a) X + frak(b) \, wide frak(a) = - frac(beta, 2 alpha) \( a_1 + a_2 \) \, quad frak(b) =
    frac(\( a_1 - a_2 \)^2, 4 alpha) . $
  The coefficient of $X$ in the remainder of $X^q$ satisfies $D_1 = 1$, $D_2 = frak(a)$, and $D_q =
    frak(a) D_(q - 1) + frak(b) D_(q - 2)$. Induction on this recurrence yields
  $ D_(2 r - 1) = sum_(j = 0)^(r - 1) binom(2 r - 2 - j, j) frak(a)^(2 r - 2 - 2 j) frak(b)^j . $
  Consequently, with ordinary polynomial coefficient extraction,
  #[#set math.equation(numbering: n => "(9.14)")
   $ Phi_(alpha \, beta) \( X^(2 r - 1) \) = sum_(j = 0)^(r - 1) binom(2 r - 2 - j, j)
     (- frac(beta, 2 alpha))^(2 r - 2 - 2 j) \( 4 alpha \)^(- j) c_j \, $ <alg:finite-sum>]
  where
  $ c_j = \[ a_1^r a_2^r \] \( a_1 + a_2 \)^(2 r - 2 - 2 j) \( a_1 - a_2 \)^(2 j + 2) . $
  The exact sign of this central coefficient is
  #[#set math.equation(numbering: n => "(9.15)")
   $ "sign" \( c_j \) = \( - 1 \)^(j + 1) . $ <alg:central-sign>]
  Indeed, substitute $a_1 = e^(i t)$, $a_2 = e^(- i t)$ and average over a full period.
    The coefficient becomes $\( - 1 \)^(j + 1)$ times the strictly positive integral of a positive constant times
    $cos^(2 r - 2 - 2 j) \( t \) sin^(2 j + 2) \( t \)$.
  By Lemmas 21 and 23, the parameter factor in the absolute value of each summand of $K
    Phi_(alpha \, beta) \( X^(2 r - 1) \)$, apart from its binomial and central coefficients, is
  $ \| K \| lr(|frac(beta, 2 alpha)|)^(2 r - 2 - 2 j) \| 4 alpha \|^(- j) & =
    2^(2 r - 2 - 2 j) \| 4 alpha \|^(j - 3 \( r - 1 \) \/ 2)\
 & lt.eq 2^(2 r - 2 - 2 j) . $
  Here $\| beta \| = 1$, $\| 4 alpha \| gt.eq 1$, and $j - 3 \( r - 1 \) \/ 2 lt.eq - \( r - 1 \) \/ 2 < 0$.
    The bound on the right is attained by the formal parameters $alpha = - 1 \/ 4$, $beta = 1$,
    for which the normalization factor $\| 4 alpha \|^(\( r - 1 \) \/ 2)$ is one.
    At those parameters (9.15) shows that all the summands in (9.14) have the same, negative, sign.
    The sum of the termwise absolute bounds therefore equals the absolute value of that single formal evaluation.
  We evaluate it explicitly. When $alpha = - 1 \/ 4$, $beta = 1$,
    the two formal roots of the quadratic in $X$ are $\( sqrt(a_1) + sqrt(a_2) \)^2$ and
    $\( sqrt(a_1) - sqrt(a_2) \)^2$. Their divided difference gives the polynomial
  $ D_(2 r - 1) & =
    frac(\( sqrt(a_1) + sqrt(a_2) \)^(4 r - 2) - \( sqrt(a_1) - sqrt(a_2) \)^(4 r - 2), 4 sqrt(a_1 a_2))\
 & = 1 / 2 sum_(h = 0)^(2 r - 2) binom(4 r - 2, 2 h + 1) a_1^(2 r - 2 - h) a_2^h . $
  Thus multiplication by $\( a_1 - a_2 \)^2$ and central coefficient extraction give
  $ lr(|Phi_(- 1 \/ 4 \, 1) \( X^(2 r - 1) \)|) = binom(4 r - 2, 2 r - 1) - binom(4 r - 2, 2 r - 3) =
    frac(1, 2 r + 1) binom(4 r, 2 r) . $
  Since $N = ell \( X^(2 r - 1) \) > 0$, the preceding termwise comparison proves (9.13). ◻
]

== 10 Completion of the metric classification <completion:section>

Theorem 2 reduces metric rigidity to a volume upper bound at the same diameter.
  The intrinsic quaternionic bound has now been proved. We first check the precise classical inputs for the
  complex and plane cases, then assemble the model list. For $bb(H) upright(P)^2$,
  the classical plane argument is an alternative to the intrinsic bound,
  which already includes every quaternionic rank $r gt.eq 2$.

#thm([Corollary 10.1.])[
  (Complex-projective type).  #emph[A Blaschke manifold of complex-projective type is isometric to its equally
    scaled standard complex projective model.]
] <rig:complex>

#proof[
  Write its real dimension as $2 r$, with $r gt.eq 2$; the projective line is a sphere.
    Its integral cohomology ring is $bb(Z) \[ u \] \/ \( u^(r + 1) \)$, where $u$ has degree two,
    and it is simply connected. Represent $u$ by a map to $bb(C)
    upright(P)^oo$ #cite(label("Hatcher2002")) Theorem 4.57. A closed smooth $2
    r$-manifold has the homotopy type of a finite $2 r$-dimensional CW complex,
    so cellular approximation #cite(label("Hatcher2002")) Theorem 4.8 places the map in the $2 r$-skeleton $bb(C)
    upright(P)^r$. Pullback identifies the integral cohomology generators and all their powers.
    The universal coefficient theorem for these finite CW complexes then gives an integral homology isomorphism.
    The homology Whitehead theorem for simply connected CW complexes #cite(label("Hatcher2002")) Corollary 4.33
    makes this map a homotopy equivalence. Yang’s volume theorem #cite(label("Yang1991")) Theorem,
    p. 380 therefore gives equality with the model at the same prime geodesic period,
    equivalently the same diameter. Corollary 3 applies. ◻
]

#thm([Corollary 10.2.])[
  (Quaternionic and Cayley planes).  #emph[A Blaschke manifold with model $bb(H) upright(P)^2$ or $bb(O)
    upright(P)^2$ is isometric to that model at the same diameter.]
] <rig:planes>

#proof[
  The projective-plane structure of such a Blaschke manifold is given by #cite(label("McKay2016"), form: "prose")
    Lemma 5. The classification of smooth topological projective planes #cite(label("KramerStolz2007"))
    Corollary C makes $M$ diffeomorphic to its standard model. Both metrics are Zoll:
    all their unit-speed geodesics are simply closed with the same prime length $T = 2 D$.
    After a common rescaling to $T = pi$, the Riemannian weak Blaschke volume theorem recorded by Wilking and
    attributed there to Reznikov applies: a manifold with this common least period that is homeomorphic to a
    compact rank-one symmetric space has the same volume as its model #cite(label("Wilking2001")) p. 282.
    The diffeomorphism above supplies its homeomorphism hypothesis.
    Thus $V = V_0$, and this equality persists when the common rescaling is undone. Corollary 3 applies. ◻
]

#thm([Corollary 10.3.])[
  (Quaternionic type).  #emph[A Blaschke manifold of quaternionic type is isometric to its standard quaternionic
    model at the same diameter.]
] <rig:quaternionic>

#proof[
  For $bb(H) upright(P)^r$ with $r gt.eq 2$, use Theorem 24 and Proposition 17.
    At the common period $T = pi$, the contact formula has the same positive volume factor for $M$ and its model, so
  $ N / N_0 = frac("Vol" \( M \, g \), "Vol" \( bb(H) upright(P)^r \)) . $
  Here $N_0$ is the model number in (8.3), and the model volume computed there is
  $ "Vol" \( bb(H) upright(P)^r \) = frac(pi^(2 r), \( 2 r + 1 \) !) . $
  Theorem 24 gives $N lt.eq N_0$, hence $"Vol" \( M \, g \) lt.eq "Vol" \( bb(H) upright(P)^r \)$.
    Corollary 3 proves the metric statement. The projective line is already the sphere case. ◻
]

#proof[
  Lemma 4 gives the common minimizing distance from the stated global injectivity-radius equality.
    The one-dimensional, sphere-type and real-projective-type cases are covered by Section 2.
    The classical structure list leaves complex type, quaternionic type, and the Cayley plane.
    These are respectively Corollaries 25, 27, and 26. Each conclusion is a metric isometry with the model at
    equal diameter. Undoing the normalization therefore gives exactly the asserted classification up to scale. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
