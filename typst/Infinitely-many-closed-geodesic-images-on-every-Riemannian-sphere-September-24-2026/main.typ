#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Infinitely many closed geodesic images \
on every Riemannian sphere]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The closed-geodesic infinitude problem asks whether every closed Riemannian manifold of dimension at least two has
  infinitely many geometrically distinct closed geodesics. A closed geodesic is #emph[prime] if it traverses its
  periodic trajectory once. Geometric distinction means distinction of images:
  changing the initial point, reversing orientation, or taking an iterate produces no new image.
  A prime geodesic may have self-intersections. We resolve the sphere case of the infinitude problem.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 2$ and every smooth Riemannian metric on the standard smooth sphere $S^n$,
    there are infinitely many prime closed geodesics with pairwise different images.]
] <thm:spheres>

Birkhoff developed a minimax construction for closed geodesics on surfaces of genus
  zero #cite(label("Birkhoff1917")) Section 17. The existence of a nonconstant closed geodesic on every
  positive-dimensional closed Riemannian manifold goes back to Lyusternik and
  Fet #cite(label("LyusternikFet1951")). Infinitude requires separating new geodesics from repeated traversals of
  old ones. Bott’s iteration theory #cite(label("Bott1956Iteration")) and the local Morse theory of Gromoll and
  Meyer #cite(label("GromollMeyer1969")) make that distinction quantitative.
  In particular, for a simply connected closed manifold, unbounded Betti numbers of the free loop space over a
  field force infinitely many geometrically distinct closed geodesics.
  Vigué-Poirrier and Sullivan #cite(label("ViguePoirrierSullivan1976")) showed that rational cohomology requiring
  at least two algebra generators supplies this topological growth.
  Spheres have one-generator cohomology and bounded degreewise loop homology,
  so this criterion does not settle their infinitude problem.

The two-sphere case is classical. It follows from Bangert’s work together with that of Franks or
  Hingston #cite(label("Bangert1993")) #cite(label("Franks1992")) #cite(label("Hingston1993")).
  De Philippis, Marini, Mazzucchelli and Suhr extended this result to reversible Finsler
  two-spheres #cite(label("DePhilippisMariniMazzucchelliSuhr2022")) Theorem 1.5.
  Albach’s more recent work gives a growth exponent of at least two for the number of geodesic images of bounded
  length in that reversible Finsler setting #cite(label("Albach2026")) Theorem 1.1.

In higher dimensions, Rademacher proved infinitude for strongly bumpy metrics on compact simply connected
  manifolds and proved that such metrics are generic #cite(label("Rademacher1994")) Theorems 1.1–1.3.
  Finite multiplicity results also hold without genericity:
  Long and Duan proved the existence of at least two geometrically distinct closed geodesics on every Riemannian
  three-sphere #cite(label("LongDuan2009")). These results do not establish infinitude for arbitrary degenerate
  metrics; a limiting argument from generic metrics need not preserve distinct prime images.
  For manifolds with positive first Betti number, Contreras and Mazzucchelli recently proved infinitude for
  generic metrics #cite(label("ContrerasMazzucchelli2025")) Corollary B.
  Our higher-dimensional argument addresses the unrestricted metric problem.

Earlier infinitude claims also require care. Asselle and Mazzucchelli #cite(label("AsselleMazzucchelli2018"))
  Introduction identify the proof in Klingenberg’s monograph #cite(label("Klingenberg1978")) as erroneous.
  Charles #cite(label("Charles2019")) Theorem 6.14 later claimed infinitude on every closed Riemannian manifold.
  We identify two unsupported steps in that argument: the boundary-rank equality in Equation (53) requires maximal
  ranks not established there, and the constant-ball modification in Equation (54) does not provide the
  nondegenerate Morse critical points used in the conclusion.
  These are objections to the proofs, not counterexamples to their conclusions.

#thm([Corollary 1.2.])[
  #emph[Let $N$ be a closed manifold admitting a finite smooth cover diffeomorphic to a standard sphere $S^n$,
    where $n gt.eq 2$. Every smooth Riemannian metric on $N$ has infinitely many geometrically distinct prime
    closed geodesics.]
] <cor:finite-cover>

This includes real projective spaces and smooth spherical space forms.
  The passage between a manifold and its finite covers is classical #cite(label("ViguePoirrierSullivan1976"))
  pp. 633–634. Section 11 proves the stated form by showing that projection has finite fibers on prime geodesic
  images, including self-intersections and nonregular covers. The conclusion concerns the number of images.
  Even on a round sphere, all prime geodesics have the same length.

The finite-cover corollary also combines with a theorem of Rademacher and Taimanov to settle the infinitude
  problem in dimension three.

#thm([Corollary 1.3.])[
  (Closed three-manifolds).  #emph[Let $M$ be a nonempty closed smooth three-manifold, not necessarily orientable.
    Every smooth Riemannian metric on $M$ has infinitely many prime closed geodesics with pairwise distinct images.]
] <cor:three-manifolds>

#proof[
  It suffices to work on one connected component, so assume that $M$ is connected.
    If $pi_1 \( M \)$ is infinite, Rademacher and Taimanov #cite(label("RademacherTaimanov2018")) Theorem 2 give
    infinitely many geometrically distinct closed geodesics for the given metric.
    Their Riemannian convention identifies geodesics exactly when their images coincide
    #cite(label("RademacherTaimanov2018")) Section 3. Taking the least positive period gives a prime
    representative with the same image. Their theorem includes the nonorientable case.
  If $pi_1 \( M \)$ is finite, the elliptization case of Perelman’s geometrization theorem says that $M$ is
    diffeomorphic to a spherical space form $S^3 \/ Gamma$, where $Gamma$ is finite and acts freely and smoothly
    on $S^3$ #cite(label("MorganTian2007")) Corollary 0.2(b).
    Composing the quotient map with a diffeomorphism $S^3 \/ Gamma arrow.r
    M$ gives a finite smooth cover $S^3 arrow.r M$. Corollary 2 therefore applies.
    Only the smooth covering is used, so the given Riemannian metric remains arbitrary. ◻
]

This corollary uses only the infinitude conclusion from Rademacher–Taimanov.
  It carries no quantitative length-counting assertion for the finite-fundamental-group case.

=== 1.1 Idea of the proof <idea-of-the-proof>

Assume that a metric on $S^n$, $n gt.eq 3$, has only finitely many prime geodesic images.
  Every nonconstant critical loop is then an iterate of one of finitely many oriented trajectories.
  Their local homology has uniformly bounded rank and lies near finitely many lines relating index to length.
  The difficulty is that sublevel homology can also contain classes that disappear at a later level.
  We first control these temporary classes and then use the symmetry of double loops to obtain a contradiction.

The ordinary homological input is a uniform filling statement for every metric,
  independent of the finite-prime assumption. Square-root energy is the $L^2$-norm of the velocity of a period-one
  loop. There is a constant $D$ such that a cycle below square-root energy $a$ which bounds in the full loop space
  already bounds below $a + D$, in every degree (Theorem 24).
  Fixed-degree shortening first gives a bound that may depend on degree.
  A cut operation paired with a cohomology power lowers a high degree into a fixed finite range,
  and a loop product restores it. The resonance theorem of Hingston and
  Rademacher #cite(label("HingstonRademacher2013")) makes the lengths removed and added differ by a bounded amount.

The operations underlying this step come from Chas and Sullivan’s loop product #cite(label("ChasSullivan1999"))
  and Goresky and Hingston’s relative cohomology product and its length
  filtration #cite(label("GoreskyHingston2009")). Cohen and Jones gave a Thom-spectrum realization of the loop
  product and its unit #cite(label("CohenJones2002")). Quantitative shortening of loop families has a related
  history in the work of Nabutovsky and Rotman #cite(label("NabutovskyRotman2013"));
  the fixed-degree additive filling estimate of Block, Manin and Weinberger
  #cite(label("BlockManinWeinberger2025")) Theorem 5.1 is a direct predecessor of the first step here.
  We prove that step in the strong $H^1$ topology before removing its degree dependence.
  Recent work of Cieliebak, Oancea and Shelukhin extends resonance to further compact rank-one symmetric spaces
  under dimension and coefficient restrictions, and to finite sphere quotients with local coefficients
  #cite(label("CieliebakOanceaShelukhin2026")) Theorem 6.1 and Corollary 8.4.

The essential comparison is the filtered cut–join identity of Theorem 21.
  Its chain constructions build on the string-topology models of Hingston and
  Wahl #cite(label("HingstonWahl2023")). The comparison uses an absolute cut with a diagonal-relative Thom
  cocycle; its value on a suitable power is the constant-loop fundamental class,
  the unit for the loop product (Proposition 23). We prove both the identity and this unit statement,
  including their filtration bounds.

The remaining argument uses reflection of loops and translation by half a period.
  With coefficients in $bb(F)_2$, let $B_a$ denote reflection-equivariant cohomology below square-root energy $a$,
  relative to constant loops, and let $B_oo$ denote the corresponding global group. Define

$ T \( a \) = dim "coker" \( B_oo arrow.r B_a \) \, $

where the dimension is summed over all degrees. Thus $T \( a \)$ counts the extra reflection classes at that
  sublevel. Theorem 33 shows that $T \( a \)$ is uniformly bounded under the finite-prime assumption.
  The proof compares two filtrations on the half-translation fixed locus:
  the actual equivariant degree and the degree of its half-length root.
  An exact-sequence calculation bounds their total discrepancy by $O \( a \)$ (Theorem 32).
  A long string of extra classes would give $Omega \( a^2 \)$ discrepancy.
  The ordinary filling estimate excludes the remaining possibilities.

Finally, the full orthogonal-group action gives

$ T \( 2 a \) gt.eq T \( a \) . $

At each stage of the round-metric filtration, the global basis has a lower-degree family, called the bottoms,
  and a second family obtained by cup product with the sphere class pulled back by evaluation at time zero.
  The equality case requires every nonzero bottom restriction from an odd round-filtration stage to have a partner
  whose restriction is independent modulo all bottom restrictions in its degree (Theorem 37).
  Because $T$ is a bounded integer, an interval where it attains its maximum propagates to arbitrarily large
  intervals under doubling. A bottom generator must first appear at some crossing in such an interval.
  Evaluation cup vanishes on that local crossing, so its partner is still zero. This contradicts the equality case.

=== 1.2 Organization and reusable ingredients <organization-and-reusable-ingredients>

Section 2 fixes the loop-space, coefficient and symmetry conventions.
  Section 3 establishes the local crossing theorem with one common flow defining all restriction maps.
  Its rank proof reduces arbitrary degeneracy to finitely many root types;
  it also includes primes of zero mean index. Sections 4–6 prove uniform ordinary filling.
  Section 7 computes the global generators and their lifts by natural Gysin sequences and the round filtration.
  Sections 8–10 give the finite-cut estimate, the transient bound and the contradiction.

Two features are useful beyond the final rank argument. The filtered cut–join comparison turns fixed-degree
  filling into a bound independent of degree. The finite-cut comparison controls actual restriction images before
  localization has become an isomorphism. These statements are isolated with their assumptions and outputs so that
  their uses do not depend on the surrounding contradiction argument.

== 2 Loop spaces, actions and sublevels <sec:setup>

We fix notation for the geometric filtration and the three symmetry groups.
  Except for the use of the classical two-sphere theorem, assume $n gt.eq
  3$ and fix a smooth Riemannian metric $g$ on $S^n$. Put $d = n - 1$ and

$ Lambda = H^1 \( bb(R) \/ bb(Z) \, S^n \) \, wide M = { upright("constant loops") } tilde.equiv S^n . $

We use the strong $H^1$ topology. The energy, its square root, and length are

$ E \( gamma \) = integral_0^1 \| dot(gamma) \( t \) \|_g^2 #h(-0.16667em) upright(d) t \, wide F \( gamma \) =
  sqrt(E \( gamma \)) \, wide ell \( gamma \) = integral_0^1 \| dot(gamma) \( t \) \|_g #h(-0.16667em) upright(d) t . $

Then $ell lt.eq F$, with equality for constant-speed loops. Write

$ X_a = { F < a } \, wide cal(A)_a = { ell < a } wide \( a in bb(R) \) . $

Both spaces are empty for $a lt.eq 0$; pairs relative to $M$ are used only for $a > 0$.
  A positive cut $a$ is #emph[regular] if $a^2$ is a regular value of $E$.
  At regular cuts we freely use the corresponding closed finite-dimensional sublevel models,
  through the homotopy equivalences constructed in Section 3.
  All maps between sublevels are the maps induced by inclusion.

The orthogonal group $G = O \( 2 \)$ acts by changing the loop parameter.
  We single out reflection $r$ and half-translation $tau$:

$ \( r gamma \) \( t \) = gamma \( - t \) \, wide \( tau gamma \) \( t \) = gamma \( t + 1 / 2 \) \, wide R =
  chevron.l r chevron.r \, quad K = chevron.l r \, tau chevron.r . $

Thus $K tilde.equiv C_2 times C_2$. The fixed locus of $tau$ consists of double loops. The map

$ delta : Lambda arrow.r Lambda^tau \, wide \( delta gamma \) \( t \) = gamma \( 2 t \) \, $

is an $R$-equivariant homeomorphism, and $F \( delta gamma \) = 2 F \( gamma \)$.
  In particular, $\( X_(2 a) \)^tau$ is the double of $X_a$.

All homology and cohomology have coefficients $bb(F)_2$. For an $H$-invariant pair $\( Y \, Z \)$, let

$ H_H^j \( Y \, Z \) = H^j \( E H times_H Y \, E H times_H Z \; bb(F)_2 \) . $

Ordinary groups have no group subscript. Negative-degree groups are zero,
  and a total graded group always means the direct sum of its homogeneous components. We use

$ B_a^j = H_R^j \( X_a \, M \) \, wide B_oo^j = H_R^j \( Lambda \, M \) . $

The determinant character of $G$ defines $w in H^1 \( B G \; bb(F)_2 \)$,
  with the same notation for its restrictions. Let $U in H^2 \( B G \; bb(F)_2 \)$ be the mod-two Euler class of
  the standard plane. On $K$, let $v$ be the degree-one character which is nonzero on $tau$ and zero on $r$.
  Proposition 25 establishes the ring formulas and the natural sequences used below.

Evaluation at zero is $R$-equivariant for the trivial action on $S^n$.
  If $sigma in H^n \( S^n \; bb(F)_2 \)$ is its nonzero class, write

$ e = "ev"_0^(*) sigma in H_R^n \( Lambda \; bb(F)_2 \) . $

Cup product by $e$ acts on every relative reflection group.
  This operation will distinguish a global pair of classes whose two members cannot first appear at the same
  isolated critical crossing.

== 3 Local control without nondegeneracy <sec:local>

We establish uniform bounds for the local groups of all iterates of a finite collection of prime geodesics.
  The bounds include geodesics of zero mean index. We also retain the actual restriction maps to the
  half-translation fixed locus and show that evaluation cup product vanishes at each reflection crossing.
  The analytic preliminaries below apply to every smooth Riemannian metric,
  independently of the finite-geodesic hypothesis.

=== 3.1 Energy sublevels and finite-dimensional models <energy-sublevels-and-finite-dimensional-models>

#thm([Lemma 3.1.])[
  (Analytic foundations).  #emph[The energy $E$ is smooth on $Lambda = H^1 \( S^1 \, S^n \)$,
    satisfies the Palais–Smale condition, and has precisely the smooth closed geodesics and the constants as
    critical points. There is a complete strong Riemannian metric on $Lambda$, invariant under $G = O \( 2 \)$,
    for which a bounded normalized negative gradient of $E$ has a complete equivariant flow.
    Sufficiently small energy sublevels retract equivariantly to $M$.]
] <lem:local-analytic>

#proof[
  Embed the sphere in $bb(R)^(n + 1)$. Pointwise exponential charts,
    the embedding $H^1 \( S^1 \) subset C^0 \( S^1 \)$, and the one-dimensional $H^1$ product rule make $Lambda$ a
    smooth Hilbert submanifold of $H^1 \( S^1 \, bb(R)^(n + 1) \)$. Its induced strong metric is complete.
    Indeed, an intrinsic Cauchy sequence is ambient Cauchy; its limit still takes values in the closed sphere,
    and a local Hilbert chart near that limit bounds intrinsic path distances by ambient distances.
    Time translations and reflection are isometries. Each acts smoothly,
    and their action is jointly continuous in the strong $H^1$ topology.
  Extend $g$ to a smooth positive symmetric matrix $A \( x \)$ along the ambient tangent bundle,
    preserving the tangent–normal splitting. Then
  $ E \( gamma \) = integral_0^1 chevron.l A \( gamma \) dot(gamma) \,
    dot(gamma) chevron.r thin #h(-0.16667em) upright(d) t $
  is smooth. To check compactness, suppose that $E \( gamma_r \)$ is bounded and $parallel #h(-0.16667em)
    upright(d) E \( gamma_r \) parallel arrow.r 0$. Pass to a subsequence converging weakly in $H^1$ and uniformly
    to $gamma$. Let $P_x$ denote Euclidean tangent projection. The tangent fields
  $ eta_r = P_(gamma_r) \( gamma_r - gamma \) $
  are bounded in $H^1$. Testing $#h(-0.16667em) upright(d) E \( gamma_r \)$ on $eta_r$,
    every term containing $gamma_r - gamma$ without a derivative tends to zero:
    its uniform norm tends to zero, while the squared velocities have bounded integrals.
    This includes the terms from differentiating $A \( gamma_r \)$ and $P_(gamma_r)$. Consequently
  $ integral_0^1 #h(-0.16667em) chevron.l A \( gamma_r \) dot(gamma)_r \, dot(gamma)_r -
    dot(gamma) chevron.r thin #h(-0.16667em) upright(d) t arrow.r 0 . $
  Uniform convergence of the coefficients and weak convergence of the velocities now give convergence of their
    energy norms. Uniform positivity of $A$ proves strong $H^1$ convergence.
  At a critical point the weak Euler–Lagrange equation says, in a coordinate interval,
    that the distributional derivative of the metric momentum is an $L^1$ quadratic expression in the velocity.
    The momentum, hence the velocity, is continuous. The geodesic equation then gives smoothness.
    Its periodic boundary condition follows from the first variation. Conversely, geodesics and constants are critical.
  Normalize the negative gradient by
  $ Z = - frac(nabla E, sqrt(1 + parallel nabla E parallel^2)) . $
  This is a smooth invariant vector field of norm at most one, strict away from the critical set.
    A bounded vector field on a complete strong Riemannian manifold has a complete flow:
    a trajectory of finite time has finite length and a limit, through which the local flow extends it.
  Finally, near the constants use coordinates $gamma \( t \) = exp_x xi \( t \)$,
    where $xi in H^1 \( S^1 \, T_x M \)$ has mean zero. The inverse function theorem gives a uniform tube over the
    compact zero section. The normal Hessian of energy is positive coercive by the mean-zero Poincaré inequality.
    Taylor integration and the positive square-root change of normal coordinates make the energy an exact positive
    quadratic form there. These constructions are equivariant.
    Small energy forces both the diameter and the ambient $L^2$ derivative norm of a loop to be small,
    so all sufficiently small sublevels lie in this tube. Radial contraction gives the claim. ◻
]

#thm([Lemma 3.2.])[
  (Regular strips).  #emph[If a closed bounded energy interval contains no critical value,
    the gradient flow gives equivariant sublevel equivalences across it.
    At regular cuts, open and closed sublevel pairs compute the same equivariant cohomology,
    naturally for inclusions and fixed loci.]
] <lem:local-strips>

#proof[
  Palais–Smale implies a positive lower bound on $parallel nabla E parallel$ in such an interval.
    The normalized flow therefore decreases energy at a uniformly positive rate there.
    A fixed sufficiently long time moves its upper sublevel into its lower sublevel,
    and the intervening flow gives the required homotopies. A small regular collar at an endpoint similarly
    compares the open and closed sublevels. Apply these constructions simultaneously at the endpoints of a pair.
    All maps are equivariant because they use the same invariant flow. ◻
]

We shall use closed regular polygon sublevels in the local constructions.
  Lemma 5 identifies their crossing groups with those of the open sublevels $X_a = { F < a }$ used elsewhere.
  Here and below, a cut for polygon energy is the square of the corresponding cut for $F = sqrt(E)$.

#thm([Lemma 3.3.])[
  (Polygon models).  #emph[Fix $B < oo$. For every sufficiently large integer $N$, the energy sublevel ${ E lt.eq
    B^2 }$ retracts onto its broken-geodesic polygons with $N$ equal time cells.
    The retraction preserves every smaller energy sublevel. It commutes with reflection and all time shifts
    preserving the vertex grid, hence with $K$ when $N$ is even.
    Regular polygon sublevels through this bound are compact smooth manifolds with boundary.
    At every critical point in the band, polygon and Hilbert indices and nullities agree.
    Regular energy cuts are dense in the band, and their sublevels have finite CW models.]
] <lem:local-polygons>

#proof[
  Choose $rho > 0$ below the injectivity radius. The open manifold
  $ P_N = { \( x_0 \, dots.h \, x_(N - 1) \) in M^N : d_g \( x_j \, x_(j + 1) \) < rho } $
  is identified with the polygons formed by minimizing constant-speed segments; subscripts are cyclic. Its energy is
  $ f_N = N sum_(j = 0)^(N - 1) d_g \( x_j \, x_(j + 1) \)^2 . $
  Choose $N$ so large that $B \/ sqrt(N) < rho$. On each time cell,
    replace the central subinterval of proportion $s$, $0 lt.eq s lt.eq 1$, by its minimizing segment.
    Cauchy–Schwarz makes all endpoint distances shorter than $rho$,
    and shows that this replacement does not increase energy.
    At $s = 1$ the loop is a polygon, and polygons are fixed throughout.
  For positive subinterval width, strong $H^1$ continuity follows from smooth dependence of short geodesics on
    endpoints and continuity of restriction and rescaling in $L^2$.
    As the width tends to zero, the replacement energy is bounded by the original energy on the disappearing
    intervals. Those integrals tend uniformly to zero along any strongly $H^1$-convergent sequence.
    This proves continuity also at $s = 0$. Centering the replacements proves the stated symmetries.
  On the closed sublevel $f_N lt.eq B^2$, every edge has length at most $B \/ sqrt(N) < rho$,
    so this sublevel is compactly contained in $P_N$. Its boundary is smooth at a regular value.
    The polygon first variation imposes matching velocities at every vertex,
    so its critical points are exactly the smooth closed geodesics in the band.
  At such a geodesic, decompose an $H^1$ variation field into its piecewise Jacobi interpolation and a field
    vanishing at every vertex. Integration by parts makes the two summands orthogonal for the index form.
    On a cell the second summand satisfies the Dirichlet Poincaré inequality.
    A curvature upper bound, the speed bound $B$, and sufficiently small cell width make its index form positive
    definite. The polygon Hessian is the first summand, which therefore has the full Hilbert index and nullity.
    Sard’s theorem for $f_N$ gives dense regular cuts, since its critical values in the band are exactly those of
    $E$. Compact smooth manifolds with boundary have finite CW models, completing the claim. ◻
]

If $k divides N$, the fixed manifold of shift by $1 \/ k$ in $P_N$ is the repeated copy of $P_(N \/ k)$, and

#[#set math.equation(numbering: n => "(3.1)")
 $ f_N \|_(P_(N \/ k)) = k^2 f_(N \/ k) . $ <eq:local-energy-scaling>]

In particular, the half-translation fixed manifold has energy $4 f_(N \/ 2)$.
  These identities follow directly from the sum defining $f_N$.

=== 3.2 Prime images and iteration <prime-images-and-iteration>

#thm([Lemma 3.4.])[
  (Counting prime images).  #emph[On any smooth Riemannian manifold,
    every nonconstant closed geodesic is an iterate of a prime geodesic.
    Two prime geodesics with the same image differ by phase and possibly reversal.
    Reversal never preserves an oriented phase orbit.]
] <lem:local-prime-images>

#proof[
  A nonconstant geodesic has constant positive speed and is an immersion.
    Its periods form a closed discrete subgroup of $bb(R)$, so there is a least positive period.
    Dividing by that period gives its prime root.
  To compare two primes with the same image, first use unit-speed parameters.
    Cover the parameter circle of the first by finitely many compact intervals on which it is an embedded arc.
    The inverse images of those arcs under the second geodesic form a finite closed cover of its parameter circle.
    By Baire’s theorem, one contains an interval. Within this interval choose a point whose image is not an
    endpoint of the chosen arc; an immersion cannot take an interval into that finite endpoint set.
    Near this point both geodesics lie in the same embedded arc and have the same tangent line.
    Their unit velocities agree up to sign. Uniqueness for the geodesic equation identifies them globally up to
    translation and reversal. Their least unit-speed periods agree,
    giving the assertion for period-one parametrizations as well. This proof allows self-intersections of either prime.
  If reversal preserved an oriented phase orbit, one would have $gamma \( t \) = gamma \( a - t \)$.
    Differentiation at a fixed point of this parameter reflection gives $dot(gamma) = - dot(gamma)$,
    impossible for a nonconstant geodesic. ◻
]

Suppose henceforth, when discussing a finite collection of critical labels,
  that there are only finitely many prime images. Let $c_1 \, dots.h \,
  c_p$ be prime representatives and $ell_i > 0$ their lengths.
  By Lemma 7, the critical set at positive energy consists of the two oriented phase circles for each iterate
  $c_i^m$. Its critical $F$-values are $m ell_i$. There are at most $2 p$ oriented labels at a level and

#[#set math.equation(numbering: n => "(3.2)")
 $ O \( 1 + b \) quad upright("labels below ") b \, wide O \( 1 + D \) quad
   upright("labels in an interval of width ") D . $ <eq:local-event-count>]

The constants depend only on the finite list of lengths. In particular, positive critical values are locally finite.

Write $I_(i \, m)$ for the periodic Morse index of $c_i^m$.
  The following elementary form of the iteration estimate suffices;
  it is consistent with the sharper classical iteration theory #cite(label("Bott1956Iteration")).

#thm([Lemma 3.5.])[
  (Index and root types).  #emph[For each prime $c_i$, there is a number $Delta_i gt.eq 0$ such that
#[#set math.equation(numbering: n => "(3.3)")
 $ \| I_(i \, m + k) - I_(i \, m) - I_(i \, k) \| lt.eq n \, wide \| I_(i \, m) - m Delta_i \| lt.eq
   n . $ <eq:local-index>]

 There is an integer $D_i gt.eq 1$ such that, for $s = gcd \( m \, D_i \)$,
   every null field at $c_i^m$ repeats a null field at $c_i^s$. Thus only finitely many root kernels occur.
   For even $m$,
#[#set math.equation(numbering: n => "(3.4)")
 $ \| I_(i \, m) - 2 I_(i \, m \/ 2) \| lt.eq n . $ <eq:local-even-index>]

]
] <lem:local-iteration>

#proof[
  Use the periodic index form over integer intervals at prime speed.
    In the form domain for the $\( m + k \)$-period problem, require that the value at time $m$ equal the initial
    value. In the direct sum of the $m$- and $k$-period domains, require that the two initial values agree.
    Both are restrictions of codimension at most $n$, and the restricted forms identify.
    If the two indices drop by $a \, b in \[ 0 \, n \]$, their original difference is $a - b$.
    This proves the first estimate. The indices are finite since the index form is a positive derivative form plus
    a compact zeroth-order perturbation.
  The sequences $I_(i \, m) + n$ and $I_(i \, m) - n$ are respectively subadditive and superadditive.
    Their normalized limits agree; applying the inequalities along multiples of each fixed $m$ gives
  $ frac(I_(i \, m) - n, m) lt.eq Delta_i lt.eq frac(I_(i \, m) + n, m) . $
  Nonnegative indices give $Delta_i gt.eq 0$. Equation (3.4) is the first estimate with two equal summands.
  Let $P_i$ be the real Jacobi Cauchy-data monodromy over one prime period.
    The periodic kernel is $ker \( P_i^m - 1 \)$. Take $D_i$ to be the least common multiple of the orders of its
    root-of-unity eigenvalues, with value one if there are none.
    For $s = gcd \( m \, D_i \)$, the same eigenvalues satisfy $lambda^m = 1$ and $lambda^s = 1$.
    On a contributing complex Jordan block, $z^m - 1$ has a simple root, so its kernel is the ordinary eigenspace.
    All other blocks contribute zero. Hence
  $ ker \( P_i^m - 1 \) = ker \( P_i^s - 1 \) . $
  ODE uniqueness identifies the corresponding fields as repeated root fields.
    This computation is over $bb(R)$ or $bb(C)$; it makes no division by multiplicity in $bb(F)_2$-cohomology. ◻
]

In particular, $Delta_i = 0$ implies $0 lt.eq I_(i \, m) lt.eq n$ for every $m$.
  We shall retain these iterates; they may occur at arbitrarily large lengths.

=== 3.3 A common flow for local restriction maps <a-common-flow-for-local-restriction-maps>

The next lemma is also useful for a compact Morse–Bott critical manifold.
  It does not require finitely many prime geodesics. Here a #emph[good pair] means a closed pair whose second
  space is a strong deformation retract of an open neighborhood;
  its relative singular cohomology is the reduced cohomology of its pointed quotient.

#thm([Lemma 3.6.])[
  (Flow lenses).  #emph[Let a compact group $H$ act on a finite-dimensional or Hilbert manifold,
    and let $f$ be a smooth $H$-invariant function with a complete bounded $H$-equivariant strict descending flow
    $phi.alt$. Suppose the critical set in a closed energy band is a finite disjoint union of compact sets at a
    single level $c$, and that $H$ permutes these sets. Assume that the energy drop is bounded below away from
    every neighborhood of those sets, and that the corresponding assertion holds on the annuli of nested
    neighborhoods. These conditions hold for the normalized energy flow of Lemma 4, and on compact polygon bands.]
  #emph[For a common sufficiently large $T$ and sufficiently tight regular cuts $a < c < b$, set
$ X = { f lt.eq b } \, quad X_(-) = { f lt.eq a } \, quad f_T = f compose phi.alt_T \, $

#[#set math.equation(numbering: n => "(3.5)")
 $ Y = { x in X : f_T \( x \) lt.eq a } \, wide N = { x in X : f_T \( x \) gt.eq a } \, wide Q =
   N ∩ Y . $ <eq:local-lens>]

 There are natural relative cohomology isomorphisms, also after Borel construction, induced by
#[#set math.equation(numbering: n => "(3.6)")
 $ \( X \, X_(-) \) arrow.r \( X \, Y \) arrow.l \( N \, Q \) . $ <eq:local-lens-maps>]

 The lens splits into clopen pairs in the chosen disjoint critical neighborhoods.
   All maps commute with restriction to a fixed submanifold when the same flow is restricted there,
   with subgroup restriction, and with cup product by ambient absolute classes.]
] <lem:local-lens>

#proof[
  Choose disjoint neighborhoods $W_alpha$ of the compact critical sets,
    and smaller $V_alpha$ with positive distance from the complement of $W_alpha$;
    the choices are equivariantly permuted. Work first in a fixed isolating band.
    Uniform drop outside the $V_alpha$ makes a sufficiently long segment remaining in that band visit one of them.
    Traversing the annulus between $V_alpha$ and the complement of $W_alpha$ takes positive time,
    since the speed is bounded and its width is positive. The traversal costs a uniformly positive amount of
    energy. Choose the final width $b - a$ smaller than all these costs.
    Every segment of duration $T$ with initial energy at most $b$ and terminal energy at least $a$ is then trapped
    in a single $W_alpha$, before and after its visit to $V_alpha$.
  The first map in (3.6) is a pair homotopy equivalence: its inverse is the map induced by $phi.alt_T$.
    The intermediate flow preserves the relevant subspaces. The finite closed cover $X = N union Y$ gives
  $ N \/ Q tilde.equiv X \/ Y $
  by closed pasting. This does not require $X$ to be compact.
    At $f_T = a$, the derivative of $f_T$ along the flow is strictly negative.
    Transverse first hitting of this level is continuous, with hitting time zero on the lower side.
    Flowing for a fraction of that time gives a neighborhood retraction onto $Y$ in $X$.
    On the upper side, stop at equality to obtain the corresponding retraction onto $Q$ in $N$.
    The condition $f lt.eq b$ is preserved by descent. These are good pairs,
    so their quotient homeomorphism gives the second relative isomorphism.
    If a collapse set is empty, adjoin a disjoint basepoint.
  The constructions are equivariant. Finite invariant closed covers remain closed covers after Borel construction,
    and the neighborhood homotopies descend. This proves the equivariant version without asserting compactness of
    a Borel space. Trapping makes $N ∩ W_alpha$ and $Q ∩ W_alpha$ clopen label pairs.
    Restriction to a fixed manifold intersects every space in (3.6) with that manifold, using the original flow.
    Finally, the maps in that diagram are inclusions and hence respect ambient cup products and connecting
    homomorphisms. ◻
]

For the normalized energy flow, the drop hypotheses in Lemma 9 follow from Palais–Smale:
  a sequence away from the chosen critical neighborhoods with drop tending to zero would converge to a critical
  point outside them. For a finite polygon band they follow from compactness.

#thm([Theorem 3.7.])[
  (Uniform local control).  #emph[Assume there are finitely many prime images.
    There are constants $A \, B < oo$ such that every sufficiently tight crossing of a positive critical level has
    the following properties.]
  + #emph[It decomposes into unoriented labels $\( i \, m \)$ at that level.
    Let $cal(P)_(i \, m)$ be the ordinary pair for one orientation. Then
$ sum_j dim H^j \( cal(P)_(i \, m) \; bb(F)_2 \) lt.eq B \, wide H^j \( cal(P)_(i \, m) \; bb(F)_2 \) = 0 quad
  upright("if ") \| j - I_(i \, m) \| > A . $

]
  + #emph[Its reflection block is induced from $cal(P)_(i \, m)$;
    its $K$-block is induced from the $chevron.l tau chevron.r$-action on that pair.
    For odd $m$ the fixed label is empty. For even $m$, the ordinary fixed pair has total rank at most $B$ and
    support $\| j - I_(i \, m \/ 2) \| lt.eq A$.]
  + #emph[Full-to-fixed restriction respects the labels. These identifications are compatible with ambient maps
    and connecting homomorphisms.]
  + #emph[Cup product by $e = "ev"_0^(*) \[ S^n \]^(*) in H_R^n \( Lambda \; bb(F)_2 \)$ vanishes on the
    reflection crossing, including each individual label.]
  #emph[The constants depend on the metric and the finite prime list,
    and include all degenerate iterates and all zero-mean-index primes.]
] <thm:local-control>

#proof[
  Choose an even polygon order adequate for the event. Start with one complete $K$-invariant strict descending
    gradient flow for the original $f_N$. Its gradient is tangent to $"Fix" \( tau \)$.
    Thus a critical point of the restriction is exactly a full critical point there,
    and the restricted flow is strict away from them.
  By Lemma 7, the critical circles come in disjoint reversed pairs.
    The half-shift preserves each orientation circle and fixes it pointwise exactly when $m$ is even; for odd $m$,
    choose its neighborhood disjoint from the fixed locus. Use Lemma 9 with disjoint equivariantly permuted
    neighborhoods of these oriented circles. Reflection induction identifies a block with the ordinary pair of one
    orientation, while $K$ induction retains its half-shift action.
    Literal intersection of the original lenses with the fixed manifold gives the full-to-fixed map.
    In particular, the actual diagrams are
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$H_K^j \( X \, X_(-) \)$])
  content((3.51, 0), [$H_K^j \( N \, Q \)$])
  content((0, -1.239), [$H_K^j \( X^tau \, X_(-)^tau \)$])
  content((3.51, -1.239), [$H_K^j \( N^tau \, Q^tau \) \,$])
  line((1.062, 0), (2.58, 0), mark: (end: ">"))
  content((1.821, 0.2266), [#text(size: 0.73em)[$tilde.equiv$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.4186, -0.6193), [#text(size: 0.73em)[$"res"$]])
  line((3.51, -0.2725), (3.51, -0.9661), mark: (end: ">"))
  content((3.928, -0.6193), [#text(size: 0.73em)[$"res"$]])
  line((1.326, -1.239), (2.25, -1.239), mark: (end: ">"))
  content((1.788, -1.012), [#text(size: 0.73em)[$tilde.equiv$]])
})
  with $N^tau = N ∩ "Fix" \( tau \)$ and likewise for $Q$. They commute with ambient relative maps and the
    associated exact sequences. No alternative local normal form is being used to identify these maps.
  The finite union of prime images does not fill $S^n$, for $n gt.eq 2$.
    Choose $q$ outside it, and choose all critical neighborhoods inside the invariant open set
  $ ⋂_(g in K) g^(- 1) #scale(x: 120%, y: 120%)[\(] "ev"_0^(- 1) \( S^n \\ { q } \) #scale(x: 120%, y: 120%)[\)] . $
  The entire lens therefore evaluates into the punctured sphere.
    Evaluation at zero is reflection invariant, so it induces $E R times_R N arrow.r S^n \\ { q }$.
    The top sphere class pulls back to zero. Hence its cup product on $H_R^(*) \( N \, Q \)$ is zero.
    The inclusion isomorphisms of Lemma 9 transfer this vanishing to the actual crossing.
    This uses only reflection invariance of evaluation; half-translation invariance is not needed.
    All choices are common to the finitely many labels at a simultaneous level.
    The uniform rank statements are proved next. ◻
]

=== 3.4 Computing ranks while retaining the original maps <computing-ranks-while-retaining-the-original-maps>

The finite-root reduction is the local mechanism in classical iteration arguments
  #cite(label("GromollMeyer1969")). We give the required rank calculation explicitly, including its relative Thom pair.

Fix one oriented label at energy $c$. Add small nonnegative bumps, constant near the other circles at $c$,
  supported away from the selected neighborhood $W$. On their compact transition regions the original strict drop
  is bounded away from zero. Taking the amplitudes sufficiently small leaves the same original flow strict for the
  modified energy $f_i$. No new critical points appear, and only the selected circle remains in a sufficiently
  narrow band about $c$.

Choose one large time and tight cuts for the original energy and this finite list of bumped energies.
  The total lens for $f_i$ is exactly its original labeled lens:
  in either direction every relevant segment is trapped in $W$, where the functions agree.
  The same construction on the fixed manifold identifies its ordinary label with an isolated crossing.
  Its ordinary rank is now independent of the strict flow and of smaller regular cuts, by strip deformations.
  We may compute these ranks using a split flow. The original flow remains the one defining all maps in Theorem 10.

#thm([Lemma 3.8.])[
  (The normal shift).  #emph[Put $s = gcd \( m \, D_i \)$ and $k = m \/ s$.
    The ordinary local rank at $c_i^m$, in degree $j$, equals the ordinary local rank of the corresponding root
    label at $c_i^s$, in degree $j - \( I_(i \, m) - I_(i \, s) \)$.]
] <lem:local-shift>

#proof[
  #emph[Normal coordinates.] Take $N$ divisible by $k$ and sufficiently large.
    The fixed manifold $Z = P_(N \/ k) subset P_N$ of the $1 \/ k$-shift has restricted energy $h =
    k^2 f_(N \/ k)$. Near the selected orbit the bump vanishes. Use a cyclically invariant tubular metric.
    Symmetry makes the normal first derivative vanish along $Z$.
    The Hessian has reducing fixed and normal summands, and Lemma 8 places its full kernel inside the fixed
    tangent space. The normal block is therefore nonsingular, of negative rank
  $ b_(-) = I_(i \, m) - I_(i \, s) gt.eq 0 . $
  We record the normal coordinate construction to keep the degenerate base unchanged. Taylor integration writes
  $ f_i \( z \, nu \) = h \( z \) + chevron.l A \( z \, nu \) nu \, nu chevron.r \, $
  where $A_0 \( z \) = A \( z \, 0 \)$ is symmetric and invertible. Normalize by $\| A_0 \|^(1 \/ 2)$, putting
  $ B = \| A_0 \|^(- 1 \/ 2) A \| A_0 \|^(- 1 \/ 2) \, wide J = "sign" \( A_0 \) . $
  Near the zero section, $B$ is close to $J$. The near-identity series $D = \( J B \)^(1 \/ 2)$ is
    $J$-self-adjoint, and $D^(*) J D = B$. Thus the fiber inverse function theorem applied to $D \|
    A_0 \|^(1 \/ 2) nu$ gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ f_i = h \( z \) - \| u \|^2 + \| y \|^2 . $ <eq:local-split>]
  The construction is uniform near the compact orbit. The positive and negative bundles can be nontrivial;
    no trivialization of them is required.
  #emph[The local quotient.] Let $psi_t$ be a complete strict descending flow for the unmodified $h$.
    In (3.7), lift it using metric connections, expand $u$ exponentially, and contract $y$ exponentially.
    The energy derivative is
  $ #h(-0.16667em) upright(d) h \( dot(psi) \) - 2 \| u \|^2 - 2 \| y \|^2 < 0 $
  off the critical set. Convex interpolation with a normalized negative gradient gives a complete strict full
    field agreeing with this one near the orbit.
  Choose a full trap $W_f$ whose base projection has compact closure inside the base chart and avoids all other
    $h$-critical points. The exact-field region contains uniform fiber balls over this closure.
    A smaller selected base trap $W_h$ lies under uniform small fiber balls contained in $W_f$;
    all other base traps lie outside its projection. First choose a common sufficiently large time $T$ for full
    and base trapping, then sufficiently tight regular cuts $a < c < b$.
    In particular, $sqrt(b - a)$ is smaller than the available fiber radius.
  Apply Lemma 9 to the isolated full crossing. On its quotient $N \/ Q = X \/ Y$, shrink $y$ to zero.
    The new first $T$-paths have the same base and negative coordinate, and a scaled positive coordinate,
    so they stay in the exact region. Both initial and terminal energies decrease.
    Thus the maps take $N$ into $X$ and $Q$ into $Y$, and descend continuously to the quotient;
    some points may collapse. This retracts onto the $y = 0$ subset together with the basepoint.
  Apply the full forward flow to this subset. While a point remains uncollapsed,
    every shifted $T$-segment is trapped in the exact region, so $y = 0$ persists and the base follows $psi$.
    On the compact base projection where $h gt.eq b > c$, its drop has a positive lower bound.
    A single further time therefore sends all survivors into $h lt.eq b$.
    This last subset is preserved up to collapse, so its inclusion is a homotopy equivalence.
    The homotopies are continuous on the pointed quotient; products of a quotient map with the compact interval
    remain quotient maps.
  Write $h_T = h compose psi_T$. The invariant subset $h lt.eq b$ used in this homotopy equivalence,
    with its equality boundary before collapse, is described by
  #[#set math.equation(numbering: n => "(3.8)")
   $ P = { h lt.eq b \, med h_T gt.eq a }_(upright("selected")) \, wide A_P = { h_T = a } ∩ P \,
     wide \| u \| lt.eq e^(- T) sqrt(h_T \( z \) - a) . $ <eq:local-base-lens>]
  For one direction, the projected segment stays in the base band and the projection of the full trap,
    so it belongs to the selected base label. Conversely, a selected base path is trapped in $W_h$,
    and $e^t \| u \| lt.eq sqrt(b - a)$ for $0 lt.eq t lt.eq T$.
    Its lift therefore stays in the exact region and satisfies the full lens inequalities.
    Equality in the radius bound is precisely its exit.
  Let $D_(-)$ and $S_(-)$ be the unit disk and sphere bundles of the negative bundle over $P$.
    Scaling by the continuous radius in (3.8) gives a homeomorphism from
  #[#set math.equation(numbering: n => "(3.9)")
   $ D_(-) \/ \( S_(-) union \( D_(-) \)_(A_P) \) $ <eq:local-thom-quotient>]
  onto the final pointed subset. Indeed it is bijective away from the collapsed union;
    its domain is compact and its target is Hausdorff. The radius vanishes exactly over $A_P$.
    This also handles rank zero and the disjoint-basepoint convention.
  #emph[Relative Thom calculation.] For completeness, we prove the relative Thom calculation for this lens,
    without requiring a manifold structure on its base. On $P$,
    let $t_p$ be the first forward time until $h_T lt.eq a$, truncated at a fixed $T_0 > 0$. It is continuous.
    Finite hits are transverse since $a$ is regular; at a point that has not hit by $T_0$,
    either the hit occurs transversely at $T_0$, or the strict terminal inequality persists in a neighborhood.
    The base flow stays in its clopen label until equality.
  For a unit-disk coordinate put
  $ t \( z \, u \) = min { t_p \( z \) \, - log \| u \| } \, wide - log 0 = + oo . $
  This is continuous also at $u = 0$, where the radial entry is inactive for $\| u \| < e^(- T_0)$.
    Its zero set is $cal(A) = S_(-) union \( D_(-) \)_(A_P)$.
    On the open neighborhood $t < T_0$, flow the base for time $lambda t$, parallel transport $u$,
    and multiply its norm by $e^(lambda t)$. Neither the base exit nor the sphere is passed before the stopping
    time. The residual minimum time is $\( 1 - lambda \) t$, so the neighborhood is preserved, the union is fixed,
    and at $lambda = 1$ it is reached. This proves that $\( D_(-) \, cal(A) \)$ is a good pair.
    Rank zero simply removes the radial alternative.
  The sphere pairs are good by radial collars. Closed pasting identifies
  $ H^(*) \( cal(A) \, S_(-) \) tilde.equiv H^(*) \( \( D_(-) \)_(A_P) \, \( S_(-) \)_(A_P) \) . $
  Under the natural absolute mod-2 Thom isomorphisms, restriction from $H^(*) \( D_(-) \, S_(-) \)$ to this group
    is the restriction $H^(* - b_(-)) \( P \) arrow.r H^(* - b_(-)) \( A_P \)$.
    The exact sequence of the triple $S_(-) subset cal(A) subset D_(-)$ gives
  $ 0 arrow.r & "coker" #scale(x: 120%, y: 120%)[\(] H^(j - b_(-) - 1) \( P \) arrow.r
    H^(j - b_(-) - 1) \( A_P \) #scale(x: 120%, y: 120%)[\)] arrow.r H^j \( D_(-) \, cal(A) \)\
arrow.r & ker #scale(x: 120%, y: 120%)[\(] H^(j - b_(-)) \( P \) arrow.r
  H^(j - b_(-)) \( A_P \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  The base-pair exact sequence has the same kernel and cokernel. Thus
  #[#set math.equation(numbering: n => "(3.10)")
   $ dim H^j \( D_(-) \, cal(A) \) = dim H^(j - b_(-)) \( P \, A_P \) . $ <eq:local-thom-dimension>]
  This argument compares vector spaces, rather than subtracting possibly infinite dimensions.
  Absolute Thom applies to these compact metrizable bases as follows.
    Pull the bundle back along the CW weak equivalence $\| "Sing" P \| arrow.r P$.
    The disk and sphere bundle projections are fibrations, so their induced total-space maps are weak
    equivalences. They give singular cohomology isomorphisms,
    including the relative disk/sphere groups and their restriction maps.
    Apply the usual mod-2 Thom isomorphism on the CW model, naturally under the same construction for $A_P$.
    The rank-zero case is the base pair itself.
  Finally, divide the base cuts by $k^2$ in (3.1). The selected base label is the root label at $c_i^s$,
    so (3.10) proves the asserted normal shift. Iteration is a homeomorphism onto the repeated-loop subspace,
    including its oriented phase circles; this identification uses no covering transfer or division by multiplicity. ◻
]

#proof[
  #emph[Completion of Theorem 10.] There are only finitely many root levels $\( s ell_i \)^2$,
    with $s divides D_i$. Around each distinct level choose a fixed isolated interval with regular endpoints.
    Choose one coarse polygon order $N_0$ adequate up to every upper endpoint.
  The total crossing pairs in $P_(N_0)$ have finite total cohomological rank:
    their regular sublevels are compact smooth manifolds with boundary, and the pair exact sequence applies.
    Their relative cohomology vanishes outside $0 \, dots.h \, n N_0 + 1$.
    Every selected root label is a direct summand of such a total crossing by Lemma 9.
    This includes coincident root levels.
  At an arbitrary event, choose the fine polygon order divisible by $k N_0$ for every label, where $k =
    m \/ gcd \( m \, D_i \)$. For every even label also impose divisibility by $2 k' N_0$, where
  $ k' = frac(m \/ 2, gcd \( m \/ 2 \, D_i \)) . $
  These are finitely many conditions. After the normal shift,
    polygon retractions through the Hilbert pair identify each finer root crossing with its coarse pair.
    Tight cuts within the fixed isolating intervals give the same groups by regular-strip deformations.
    The finite maximum of their total ranks is therefore a bound $B$ for every iterate label.
  If the root group in degree $a$ is nonzero in the shift calculation, then
  $ j - I_(i \, m) = a - I_(i \, s) \, wide 0 lt.eq a lt.eq n N_0 + 1 . $
  For example,
  $ A = n N_0 + 1 + max_(i \, med s divides D_i) I_(i \, s) $
  is a uniform support constant. Enlarge the constants if necessary for the fixed computations:
    on $"Fix" \( tau \)$ start with $4 f_(N \/ 2)$, apply the same argument to $m \/ 2$,
    and divide cuts by $4 \( k' \)^2$. The support is centered at $I_(i \, m \/ 2)$.
  The normal shift changes no total rank. All degeneracy remains in finitely many root crossings,
    so the proof assumes neither nondegeneracy nor analyticity.
    It never divides by $Delta_i$; zero-mean-index primes satisfy the same conclusions. ◻
]

The uniform total-rank assertion is for ordinary local groups.
  The half-shift Borel group may have an infinite polynomial tail.
  The Gysin sequence of Proposition 25 converts the ordinary bound into a uniform bound in each equivariant degree
  and an eventual multiplication isomorphism. The finite-cut comparison will use these consequences together with
  the original, label-preserving restriction maps established here.

== 4 Shortening families in a fixed degree <sec:shortening>

We first prove a filling estimate whose constant may depend on the homological degree.
  The geometric argument works on every compact simply connected Riemannian manifold.
  Its two ingredients are continuous arclength parametrization and a shortening procedure with only finitely many
  simultaneous changes. Throughout this section, chains have coefficients in $bb(F)_2$;
  for the manifold $M$ under consideration, write $Lambda = H^1 \( S^1 \, M \)$ and $cal(A)_a =
  { gamma in Lambda : ell \( gamma \) < a }$. Block, Manin and Weinberger established fixed-degree additive
  filling bounds for based and free Lipschitz loop spaces #cite(label("BlockManinWeinberger2025")) Theorem 5.1.
  We give a direct proof in the strong $H^1$ topology for the length filtration used here.

=== 4.1 Arclength parametrization in $H^1$ <arclength-parametrization-in-h1>

#thm([Lemma 4.1.])[
  (Continuous arclength homotopy).  #emph[Let $M$ be a compact Riemannian manifold. There is a jointly continuous map
$ Psi : \[ 0 \, 1 \] times H^1 \( \[ 0 \, 1 \] \, M \) arrow.r H^1 \( \[ 0 \, 1 \] \, M \) $

 in the strong $H^1$ topology such that $Psi_0$ is the identity, $Psi_1 gamma$ has constant speed,
   and every $Psi_u$ preserves length and endpoints. Constant paths and constant-speed paths are fixed. Moreover,
#[#set math.equation(numbering: n => "(4.1)")
 $ E \( Psi_u gamma \) lt.eq \( 1 - u \) E \( gamma \) + u ell \( gamma \)^2 lt.eq
   E \( gamma \) . $ <eq:shortening-energy>]

 The homotopy commutes with reversal. In particular, on loops it preserves evaluation at zero and the
   constant-loop subspace.]
] <lem:arclength>

#proof[
  Write $v \( t \) = \| dot(gamma) \( t \) \|$ and $L = integral_0^1 v \( t \) thin #h(-0.16667em) upright(d) t$.
    When $L > 0$, put
  $ sigma \( t \) = 1 / L integral_0^t v \( s \) thin #h(-0.16667em) upright(d) s \, wide
    phi.alt_u \( t \) = \( 1 - u \) t + u sigma \( t \) . $
  For $u < 1$, the absolutely continuous map $phi.alt_u$ is an increasing homeomorphism with Lipschitz inverse.
    Set $Psi_u gamma = gamma compose phi.alt_u^(- 1)$. At $u = 1$ the inverse need not exist.
    Instead, define $Psi_1 gamma \( s \)$ to be the value of $gamma$ on the fiber $sigma^(- 1) \( s \)$.
    Each fiber is an interval on which $v = 0$ almost everywhere,
    so absolute continuity makes this definition unambiguous. For $L = 0$ leave the constant path fixed for every $u$.
  For $s_1 < s_2$, choose ordered preimages $t_1 < t_2$ under $sigma$. Then
  $ d #scale(x: 120%, y: 120%)[\(] Psi_1 gamma \( s_1 \) \,
    Psi_1 gamma \( s_2 \) #scale(x: 120%, y: 120%)[\)] lt.eq integral_(t_1)^(t_2) v \( t \) thin #h(-0.16667em)
    upright(d) t = L \( s_2 - s_1 \) . $
  Thus $Psi_1 gamma$ is $L$-Lipschitz. Since $gamma = \( Psi_1 gamma \) compose
    sigma$ and $sigma$ is a nondecreasing surjection, comparison of partitions gives $ell \( gamma \) lt.eq
    ell \( Psi_1 gamma \)$. The Lipschitz estimate gives the reverse inequality.
    Consequently $Psi_1 gamma$ has length $L$ and speed $L$ almost everywhere, and its energy is $L^2$.
  For $u < 1$, change of variables by $phi.alt_u$ gives
  $ E \( Psi_u gamma \) = integral_0^1 frac(v \( t \)^2, \( 1 - u \) + u v \( t \) \/ L) thin #h(-0.16667em)
    upright(d) t . $
  On ${ v > 0 }$, convexity of the reciprocal bounds the integrand by $\( 1 - u \) v^2 + u L v$; on ${ v =
    0 }$ it is zero. This proves (4.1), including $u = 1$ by the preceding argument.
    The same change of variables preserves length for $u < 1$.
    Endpoints are unchanged, and constant-speed paths have $sigma \( t \) = t$.
  We verify joint strong continuity, including the possibly flat fibers at $u = 1$.
    Fix a smooth embedding of $M$ in a Euclidean space and extend its metric to a smooth positive definite matrix
    on a neighborhood of $M$. Suppose $gamma_i arrow.r gamma$ strongly in $H^1$ and $u_i arrow.r u$.
    The one-dimensional Sobolev embedding gives uniform convergence of the paths.
    Smoothness of the metric gives $v_i arrow.r v$ in $L^2$, and hence $L_i arrow.r L$.
  If $L > 0$, the maps $sigma_i$ and $phi.alt_(u_i)$ converge uniformly to $sigma$ and $phi.alt_u$.
    Given $s_i arrow.r s$, choose $t_i$ in the inverse fiber defining $Psi_(u_i) gamma_i \( s_i \)$.
    Every subsequential limit $t$ satisfies $phi.alt_u \( t \) = s$. The path $gamma$ has one value on that fiber:
    for $u < 1$ the fiber is a singleton, and for $u = 1$ this was proved above. Therefore
  $ Psi_(u_i) gamma_i \( s_i \) = gamma_i \( t_i \) arrow.r Psi_u gamma \( s \) . $
  A compactness argument makes this convergence uniform in $s$.
    If $L = 0$, the image of each output is contained in the image of its input,
    so uniform convergence to the constant path follows directly.
  The energies also converge. If $L > 0$ and $u < 1$, the reciprocals in the integral formula are uniformly
    bounded and converge in measure; combining this with $v_i^2 arrow.r
    v^2$ in $L^1$ proves convergence of the integrals. If $u = 1$, Cauchy–Schwarz and (4.1) give
  $ L_i^2 lt.eq E \( Psi_(u_i) gamma_i \) lt.eq \( 1 - u_i \) E \( gamma_i \) + u_i L_i^2 arrow.r L^2 . $
  If $L = 0$, the upper bound $E \( Psi_(u_i) gamma_i \) lt.eq E \( gamma_i \)$ tends to zero.
  For completeness, energy convergence here implies strong, rather than merely weak, convergence of derivatives.
    Uniform convergence and the energy bound give weak $H^1$ convergence to the already identified output.
    In the squared derivative norms, replace the metric matrix at the varying outputs by its value at the limiting
    output. The resulting error tends to zero, because the matrices converge uniformly and the derivatives are
    bounded in $L^2$. The derivative norms thus converge in one fixed positive weighted $L^2$ Hilbert norm.
    Weak convergence together with convergence of these norms gives strong convergence.
    This proves the asserted joint continuity.
  Finally, for the reversed path the arclength map is $1 - sigma \( 1 - t \)$.
    This identity proves commutation with reversal, also at the quotient endpoint $u = 1$. ◻
]

We shall use this homotopy only for ordinary homology. Fixed-time concatenation of finitely many $H^1$ paths is
  continuous and adds their lengths; Lemma 12 then puts the concatenation at constant speed.
  The same is true when some paths are constant. Restriction to a moving initial interval,
  followed by linear rescaling, is also continuous in $H^1$, including a collapsed interval:
  for $gamma_t \( s \) = gamma \( t s \)$,

$ E \( gamma_t \) = t integral_0^t \| dot(gamma) \( r \) \|^2 thin #h(-0.16667em) upright(d) r arrow.r 0 quad
  upright("as ") t arrow.r 0 . $

Continuity away from zero follows from continuity of dilation in $L^2$.

=== 4.2 A bounded local path replacement <a-bounded-local-path-replacement>

The following elementary construction is the source of the uniform constant in the shortening argument.

#thm([Lemma 4.2.])[
  (Local replacement of paths).  #emph[Fix $L_0 < oo$ and let $M$ be compact and simply connected.
    Pairs of paths with common endpoints and Lipschitz constants at most $L_0$ admit a finite cover by relative
    $C^0$ neighborhoods in this path-pair space with the following property.
    On each neighborhood there is a relative-endpoint homotopy from the first path to the second,
    continuous in the strong $H^1$ topology of the input paths and the homotopy parameter.
    Every path occurring in these homotopies has length at most a constant $K = K \( M \, L_0 \)$.]
] <lem:shortening-recipes>

#proof[
  The space of such pairs is compact in $C^0$ by the Arzelà–Ascoli theorem.
    Consider one pair $\( alpha_0 \, beta_0 \)$ from this space, with endpoints $x_0 \, y_0$.
    Simple connectivity gives a continuous homotopy between them, fixing the endpoints.
    Replace its paths by polygons on one sufficiently fine, fixed subdivision of the path parameter.
    Uniform continuity of the original homotopy ensures that all consecutive vertices are within the injectivity
    radius. Polygonal interpolation then gives an $H^1$-continuous homotopy with a finite length bound.
    Short pointwise geodesic interpolation joins its two endpoint polygons to $alpha_0 \, beta_0$.
    These interpolations also have a finite length bound, since the original endpoint paths are Lipschitz.
  This construction extends to nearby pairs with varying common endpoints $x \, y$.
    Attach the short geodesics from $x$ to $x_0$ and from $y_0$ to $y$ to each prototype path, using fixed,
    small positive time intervals at its ends. First choose those intervals small enough that the retimed
    prototype endpoints are uniformly close to the original endpoints; this uses their Lipschitz bounds.
    Then restrict $x \, y$ and the input paths to a sufficiently small $C^0$ neighborhood.
    Short pointwise geodesic interpolation joins the actual first path to the adjusted prototype first path,
    and similarly at the other end. Both interpolations fix $x \, y$.
    Their derivatives are bounded by a fixed multiple of the derivatives of the two interpolated paths.
    Consequently their lengths have a common bound on this neighborhood.
    Every operation just described is continuous in the strong $H^1$ topology.
    A finite subcover of the compact pair space, and the maximum of its finitely many bounds, give $K$. ◻
]

Here and below a local homotopy is a specified choice on a neighborhood;
  no global choice of a minimizing geodesic is needed. We next use these local choices to shorten a long path
  block with bounded overhead.

#thm([Lemma 4.3.])[
  (Shortening one block).  #emph[Let $M$ be compact and simply connected.
    There are constants $C \, D > 0$, depending only on $M$, with the following property.
    Suppose a path is divided into finitely many pieces, each of which, on a unit interval,
    has Lipschitz constant at most one. Near any such path, within this space of piecewise Lipschitz paths,
    there is a relative-endpoint homotopy to a path of length at most $D$.
    At every stage its length is at most its original length plus $C$.
    The homotopy is continuous in $H^1$ on that neighborhood. The constants are independent of the number of pieces.]
] <lem:shortening-block>

#proof[
  Set $D = "diam" \( M \) + 1$. For a fixed prototype choose shortest paths, called spokes,
    from its initial point to all its piece vertices. For nearby inputs extend these choices by short endpoint
    connectors, using fixed thirds of the unit interval. Shrink the neighborhood so that each spoke has length at
    most $D$ and Lipschitz constant at most $3 D$. At the initial vertex use the constant spoke.
  Proceed through the pieces in order. Assume the preceding prefix has already been replaced by its spoke.
    Retime that spoke and the next piece to halves of the enlarged prefix.
    This retiming preserves length and is continuous in $H^1$:
    every nonconstant path has a positive time interval throughout the retiming.
    In the first step, where the prefix is empty, insert a constant wait at the initial point and retime the first
    piece. The two paths to be compared are now the spoke followed by the next piece,
    and the spoke to the next vertex. On a unit interval both have Lipschitz constant at most
  $ L_0 = 2 max { 1 \, 3 D } . $
  Apply Lemma 13 to replace the first by the second, and leave the remaining suffix unchanged.
  During a replacement the active prefix has length at most $K \( M \, L_0 \)$;
    during a retiming it has length at most $D + 1$. The suffix still consists of original pieces.
    Thus $C = max { K \( M \, L_0 \) \, D + 1 }$ bounds the increase over the length of the entire original path
    at every stage. At the end the path is its final spoke, of length at most $D$.
    For a particular input there are finitely many pieces, hence finitely many local choices.
    Intersecting their neighborhoods makes the entire construction continuous on one neighborhood.
    This affects the neighborhood, but neither $C$ nor $D$. ◻
]

The intermediate energies in Lemma 14 need not have a uniform bound:
  a long prefix may be assigned a short time interval. Only its length estimate is used.
  All time intervals for nonconstant pieces remain positive, and the construction is an $H^1$ homotopy.
  Lemma 12 restores constant speed whenever required.

=== 4.3 Coloring a finite family <coloring-a-finite-family>

#thm([Lemma 4.4.])[
  (A fixed-dimensional family shortens by one).  #emph[Let $M$ be compact and simply connected.
    For each integer $j gt.eq 0$ there are $a_j \, H_j > 0$ such that every $H^1$-continuous family $Gamma :
    P arrow.r cal(A)_a$, where $P$ is a finite polyhedron of dimension at most $j$ and $a gt.eq a_j$,
    is homotopic to a family in $cal(A)_(a - 1)$ through $cal(A)_(a + H_j)$.
    The constants do not depend on $P$ or on the number of its simplices.]
] <lem:shortening-family>

#proof[
  Normalize the family by Lemma 12. A loop of length $L < a$ now has constant speed $L$.
    Let $C \, D$ be the constants of Lemma 14. Choose $B$ so large that
  #[#set math.equation(numbering: n => "(4.2)")
   $ B \/ 2 > D + j C + 2 . $ <eq:shortening-B>]
  For sufficiently large $a$, the integer $k = floor.l a \/ B floor.r$ is at least $j + 1$.
    Divide the loop into $k$ equal time blocks, and each block into $ceil.l a \/ k ceil.r$ equal pieces.
    Every piece, rescaled to a unit interval, has Lipschitz constant at most one. Every block has length $L \/ k$.
  For each parameter point, Lemma 14 supplies local recipes for the first $j + 1$ blocks.
    There are only finitely many blocks and pieces in this particular family.
    Choose a common neighborhood for these recipes, and cover $P$ by finitely many such neighborhoods.
    Subdivide a triangulation finely enough that the closed stars in a final barycentric subdivision are
    subordinate to this cover. Color each vertex by the dimension of the simplex of the preceding triangulation
    whose barycenter it is. The colors lie in ${ 0 \, dots.h \, j }$ and are distinct on each simplex.
  At a vertex $v$ of color $h$, use its local recipe on block $h + 1$.
    If $lambda_v$ is its barycentric coordinate, at homotopy time $s$ run that recipe for the fraction
  $ s min { 1 \, \( j + 1 \) lambda_v } . $
  Two positive-coordinate stars of the same color are disjoint;
    at the boundary of either star the fraction is zero and the recipe is the identity.
    Recipes of different colors affect different blocks, keeping their endpoints fixed.
    They therefore paste to one continuous $H^1$ homotopy. At each parameter at most $j + 1$ blocks are changed,
    and the length throughout is less than $a + \( j + 1 \) C$.
  At the terminal time some barycentric coordinate is at least $1 \/ \( j + 1 \)$,
    so one block has been completely shortened. The final length is consequently at most
  #[#set math.equation(numbering: n => "(4.3)")
   $ L - L \/ k + D + j C . $ <eq:shortening-terminal>]
  If $L gt.eq a \/ 2$, then $k lt.eq a \/ B$ gives $L \/ k gt.eq B \/ 2$, and (4.2) makes (4.3) less than $a - 1$.
    If $L < a \/ 2$, the rough bound $L + \( j + 1 \) C < a \/ 2 + \( j + 1 \)
    C$ has the same consequence once $a > 2 \( \( j + 1 \) C + 1 \)$.
    Choose $a_j$ larger than this threshold and large enough that $k gt.eq j + 1$. We may take $H_j = \( j + 1 \) C$. ◻
]

=== 4.4 Filling the remaining bounded family <filling-the-remaining-bounded-family>

#thm([Lemma 4.5.])[
  (A fixed bounded level).  #emph[For every $b > 0$ and $j gt.eq
    0$ there is $R_(b \, j) < oo$ such that every finite $j$-cycle in $cal(A)_b$ which is null-homologous in
    $Lambda$ bounds a finite chain in $cal(A)_(R_(b \, j))$.]
] <lem:shortening-bounded>

#proof[
  Normalize by Lemma 12; the resulting cycle has $F = ell < b$.
    We describe a single finite model for all such normalized cycles.
    Choose an integer $N$ large enough that paths of energy at most $\( b + 1 \)^2$ move less than a fixed small
    injectivity radius on intervals of length $1 \/ N$. Sampling at these times and joining successive vertices by
    minimizing geodesics gives a continuous polygonal map. For the discrete energy
  $ E_N \( x_0 \, dots.h \, x_(N - 1) \) = N sum_(i = 0)^(N - 1) d \( x_i \, x_(i + 1) \)^2 \, wide x_N = x_0 \, $
  Cauchy–Schwarz gives $E_N lt.eq E$ on sampled loops. Choose $b'
    in \( b \, b + 1 \)$ such that $\( b' \)^2$ is a regular value of $E_N$. The set
  $ Q = { E_N lt.eq \( b' \)^2 } $
  is contained strictly inside the open set of vertex tuples whose successive distances are smaller than the
    injectivity radius. It is a compact smooth manifold with boundary and therefore has finite-dimensional
    homology in every degree. Polygonal interpolation maps $Q$ to loops of length at most $b'$.
  There is also a homotopy from each normalized loop to its sampled polygon,
    with one uniform energy bound depending only on $b$ and $M$.
    Indeed, on each interval both paths stay in a small normal neighborhood of its initial vertex.
    Pointwise short-geodesic interpolation is $H^1$-continuous,
    and the derivative of this interpolation is bounded by a fixed multiple of the two path derivatives.
    Its square-root energy is thus at most $2 C_0 b$ for a fixed metric constant $C_0$.
    This also gives a uniform length bound for the homotopy.
  The kernel of $H_j \( Q \; bb(F)_2 \) arrow.r H_j \( Lambda \; bb(F)_2 \)$ is finite-dimensional.
    Choose finite cycles representing a basis and finite global fillings of their polygonal images.
    Their supports are compact, so their lengths have a common finite bound.
    The sampled image of any cycle in the lemma represents a linear combination of this basis.
    The difference bounds in $Q$, whose entire image has length at most $b'$.
    Adding that comparison chain, the finitely many chosen fillings,
    and the two normalization and polygonal homotopies proves the claim with one $R_(b \, j)$ strictly larger than
    all these bounds. No bound on the number of simplices in the original cycle is needed. ◻
]

#thm([Proposition 4.6.])[
  (Fixed-degree filling).  #emph[Let $M$ be compact and simply connected.
    For every integer $j gt.eq 0$ there is $D_j > 0$ such that, for every real $a > 0$,
    each finite $j$-cycle in $cal(A)_a$ which is null-homologous in $Lambda$ bounds a finite chain in
    $cal(A)_(a + D_j)$.]
] <prop:fixed-degree-death>

#proof[
  A finite singular cycle over $bb(F)_2$ can be regarded as the image of a cycle on a finite polyhedron of
    dimension at most $j$. One explicit construction takes the finitely many singular simplices,
    pairs equal faces that cancel in their boundary, and glues these faces by their ordered affine
    identifications. The first barycentric subdivision has embedded closed simplices and vertices distinguished by
    their original face dimensions; a second subdivision removes multiple simplices with the same vertex set.
    This gives a finite polyhedron with its top-dimensional cycle and the original map to $Lambda$.
    The usual subdivision and prism chains identify its image with the original singular cycle.
    All these chains have image in the union of the original simplices.
    Thus the number of parameter simplices plays no role in a length estimate.
  Apply Lemma 15 repeatedly, normalizing between successive applications.
    Starting at level $a$, the successive starting levels are $a \, a - 1 \, a - 2 \, dots.h$,
    until the family lies below one fixed level $b_j > a_j + 1$.
    The prism chains at the successive stages all lie in $cal(A)_(a + H_j)$:
    the peak at stage $r$ is bounded by $a - r + H_j$, so these bounds are not added over the stages.
    Only finitely many stages are needed for each input cycle.
  The resulting cycle is still globally null-homologous. Apply Lemma 16 at the fixed level $b_j$.
    Taking $D_j > max { H_j \, R_(b_j \, j) }$ gives the required filling after adjoining the shortening prisms.
    If the original $a$ is already at most $b_j$, the bounded-level lemma applies immediately.
    This proves the assertion for every positive level, without a regular-value assumption. ◻
]

The constants $D_j$ presently depend on the degree. For spheres,
  the cut–join operations in the next section reduce all sufficiently large degrees to a fixed finite range.
  This will turn Proposition 17 into one filling bound valid in every degree.

== 5 A filtered cut–join identity <sec:cutjoin>

We now construct a degree-lowering operation which removes a long part of a loop.
  Its essential property is an interchange identity with the loop product,
  with an additive length cost independent of the degree. Applied to the sphere’s product powers,
  this identity makes the cut of a suitable cycle equal to the constant-loop fundamental class.
  These constructions apply to every smooth metric on $S^n$, $n gt.eq 3$;
  no assumption about the number of closed geodesics is made in this section.

We retain $cal(A)_a = { ell < a }$ and $d = n - 1$. A chain is always a finite singular chain with coefficients in
  $bb(F)_2$. Writing $c tilde.eq c'$ in a subspace means that their difference bounds a chain in that subspace.

=== 5.1 The sphere classes and their length thresholds <the-sphere-classes-and-their-length-thresholds>

Write $bullet$ for the Chas–Sullivan homology product #cite(label("ChasSullivan1999")), of degree $- n$,
  and $convolve.o$ for the Goresky–Hingston product on $H^(*) \( Lambda \, M \)$
  #cite(label("GoreskyHingston2009")), of degree $n - 1$. We use the following precise consequences of sphere
  resonance and the calculation of these products.

#thm([Proposition 5.1.])[
  (Sphere powers and resonance).  #emph[There are constants $alpha > 0$ and $C_H$ depending on $g$ such that
#[#set math.equation(numbering: n => "(5.1)")
 $ \| k - alpha "cr" \( z \) #scale(x: 120%, y: 120%)[\|] lt.eq C_H $ <eq:cj-resonance>]

 for every nonzero homogeneous ordinary homology or cohomology class $z$ of degree $k$.
   For homology, $"cr"$ is the infimum of the levels $a$ carrying the class in $X_a = { F < a }$;
   for cohomology it is the supremum of the levels on which its restriction vanishes.
   Moreover, each ordinary homology and cohomology group in a fixed degree has dimension at most one. There are classes
$ Theta in H_(3 n - 2) \( Lambda \) \, wide omega in H^(n - 1) \( Lambda \, M \) \, wide
  theta in H^(3 n - 2) \( Lambda \, M \) $

 with $chevron.l theta \, Theta chevron.r = 1$ such that, for every $m gt.eq 1$,
#[#set math.equation(numbering: n => "(5.2)")
 $ \| Theta^(bullet m) \| & = n + 2 m d \, & \| omega^(convolve.o m) \| & = \( 2 m - 1 \) d \,\
chevron.l theta convolve.o omega^(convolve.o m) \, Theta^(bullet \( m + 1 \))
  #scale(x: 120%, y: 120%)[chevron.r] & = 1 . $ <eq:cj-power-degrees>]

 In particular these powers are nonzero, and $H_n \( Lambda \) = bb(F)_2 thin \[ M \]$.]
] <prop:sphere-powers>

#proof[
  The resonance statement is Theorem 1.1 of #cite(label("HingstonRademacher2013")).
    Its cohomological critical levels may be computed in singular cohomology:
    the open energy sublevels and $Lambda$ are paracompact, locally contractible Hilbert manifolds,
    where singular and Čech cohomology agree. Their Lemma 5.3 gives the rank bound;
    Lemma 5.4 and Equation (12) give the powers and the pairing, with the index in that equation replaced by $m +
    1$. These statements apply for every $n > 2$ and every field.
    The indicated powers and pairing may also be taken integrally and reduced modulo two:
    the integral pairing is one, so its reduction is one in both parities of $n$.
    The absolute class of degree $3 n - 2$ has a unique relative lift because $3 n - 2 > n + 1$.
    Finally evaluation retracts the inclusion of constant loops, so $\[ M \] eq.not 0$;
    the rank bound gives the last assertion. ◻
]

For sufficiently large $m$, set

#[#set math.equation(numbering: n => "(5.3)")
 $ q = 2 m d \, wide p = q - d \, wide l = frac(n + q + C_H, alpha) + 2 \, wide L = frac(p - C_H, alpha) -
   2 > 0 . $ <eq:cj-thresholds>]

We also require $p > n + 1$. Choose a cycle $S$ representing $Theta^(bullet m)$ in $cal(A)_l$.
  Such a cycle exists already in $X_l$ by (5.1). Choose a normalized cocycle $T$ representing
  $omega^(convolve.o m)$ and vanishing on $cal(A)_L$. Indeed its absolute class,
  identified with the relative class since $p > n + 1$, vanishes on $X_L$ by resonance.
  The cohomology exact sequence gives a cocycle relative to $X_L$.
  Pull it back by the arclength map of Lemma 12; this sends $cal(A)_L$ into $X_L$, fixes constants,
  and is homotopic to the identity. Normalization preserves the relative condition. Notice the fixed difference

#[#set math.equation(numbering: n => "(5.4)")
 $ l - L = frac(2 n - 1 + 2 C_H, alpha) + 4 \, $ <eq:cj-fixed-difference>]

independent of $m$. This is the length available for the eventual degree reduction.

=== 5.2 Supported caps on small chains <supported-caps-on-small-chains>

We use unnormalized singular chains and normalized cochains.
  The shuffle cross product is associative and, over $bb(F)_2$, symmetric under permutation of factors.
  Our cap evaluates a cochain on the front face and retains the back face.
  Thus successive caps correspond to cup products in the same order, and

$ partial \( c frown b \) = \( partial c \) frown b + c frown delta b . $

The degenerate chains form an acyclic subcomplex in every subspace;
  the usual normalization homotopies preserve simplex images.
  Consequently an equality modulo degenerate chains between cycles gives a homology in the same length sublevel.

All tubes, arcs and rotations in the construction use a fixed round metric on $M$; all length estimates use $g$. Put

$ F_eta = { \( z \, z' \) in M^2 : d_(upright("rd")) \( z \, z' \) gt.eq eta } . $

A cochain relative to $F_eta$ vanishes on every simplex contained in this set.
  Its nonzero evaluation on a face therefore supplies a point of that face with distance less than $eta$.
  Subdividing a finite parameter family sufficiently finely makes the corresponding distance less than $2
  eta$ on the entire parent simplex. For product chains we impose this condition on the whole product rectangles
  before shuffling. Maps used below are defined on the larger $4 eta$ tubes,
  so uniform continuity on an intermediate closed tube allows successive support conditions to be imposed together.

The following observation also deals with cochains whose maps are defined only on a tube.

#thm([Lemma 5.2.])[
  (Supported cochain calculus).  #emph[Let $U$ be a pulled-back Thom cocycle,
    and let $h$ be a continuous map from its larger tube $O$ to a space carrying a cocycle $T$.
    Extend $h^(*) T$ by zero on simplices not wholly contained in $O$, and write $b = U smile accent(h^(*) T, ̃)$.
    Subdivide the finite parameter families factorwise so that a nonzero $U$-face forces its entire product
    rectangle into a fixed closed intermediate tube contained in $O$.
    Its preimage in each finite compact parameter domain is compact.
    Then $delta b = 0$ on the shuffled simplices and every later face or image-preserving comparison prism in
    these rectangles.]
  #emph[If $T$ vanishes on loops of length less than $L$, the subdivision may also ensure the following:
    a contributing term with a nonzero $U$-face and a nonzero $T$-face has $ell \( h \) gt.eq L -
    epsilon$ throughout its whole rectangle, for any fixed $epsilon > 0$.
    The same conclusion holds for the block and skip faces used by cup-one,
    and for all later image-preserving subdivision prisms.]
] <lem:cj-small-chains>

#proof[
  Extension by zero defines a cochain, although generally not a cocycle.
    The ordinary cochain identity nevertheless gives
  $ delta b = U smile delta accent(h^(*) T, ̃) . $
  If its front $U$-face is zero, the evaluation is zero. Otherwise the entire parent lies in $O$,
    and every face entering the remaining coboundary is an actual pullback of $T$.
    They cancel because $delta T = 0$. This proves the assertion without discarding any extension-by-zero terms
    separately. Each block or skip face is contained in its parent image and has the same property.
  In a contributing term the $U$-face first puts the whole rectangle in the closed intermediate tube,
    where $h$ is defined and uniformly continuous on the compact parameter set.
    Its nonzero $T$-face cannot have its entire image in ${ ell < L }$,
    and hence contains a point with $ell \( h \) gt.eq L$. Refining the factors so that $ell compose
    h$ oscillates by less than $epsilon$ on each such rectangle proves the estimate.
    The tube conditions follow in the same way from the gap between support and intermediate radii.
    Include all homotopy intervals among the factors before refining.
    The finitely many conditions then hold simultaneously. All later subdivision prisms and block or skip faces
    stay in the original rectangles, so both the domain and length conditions persist. ◻
]

We will always use such small chains. Boundary comparisons have the following concrete meaning.
  Subdivide a finite homology adequately, then apply the cap boundary formula.
  Its subdivided boundary is compared with any earlier adequate representative by the subdivision prism inside the
  original simplex images. Factor subdivisions are compared by crossing these prisms with the other factors.
  For a homotopy of evaluation or output maps, cross with its interval #emph[before] capping and refine all
  factors, so the endpoint chains are the original shuffled constructions.
  This proves compatibility with refinements and finite fillings at the same whole-parent length bounds.
  A single subdivision depth on the entire loop space is neither chosen nor needed.
  The shuffle step counts below are applied to these factorwise refined product chains.
  Comparison prisms need not have that form; they are handled by the supported boundary formula instead.

=== 5.3 The cut and the join <the-cut-and-the-join>

Fix $epsilon = 10^(- 3)$. Choose a small cut radius $eta_c$ so that a short round arc at distance less than $4
  eta_c$ has $g$-length less than $epsilon$. The diagonal Thom class has a normalized representative

#[#set math.equation(numbering: n => "(5.5)")
 $ U_c in C^n \( M^2 \, F_(eta_c) union Delta M \) . $ <eq:cj-diagonal-cocycle>]

To see this, its restriction to $Delta M$ is the mod-two Euler class of $T M$,
  which vanishes because $chi \( S^n \)$ is even. The exact sequence of the triple $F_(eta_c) subset F_(eta_c)
  union Delta M subset M^2$ therefore lifts the Thom class to this relative group.
  A relative cocycle representative, followed by normalization, gives (5.5).

For paths $gamma \, zeta$ with matching endpoints, let $gamma \#
  zeta$ denote concatenation with half the time assigned to each.
  Brackets $\[ z \, z' \]$ denote a short round arc. On the cut tube define

#[#set math.equation(numbering: n => "(5.6)")
 $ C_1 \( x \, t \) & = x \[ 0 \, t \] \# \[ x \( t \) \, x \( 0 \) \] \,\
C_2 \( x \, t \) & = \[ x \( 0 \) \, x \( t \) \] \# x \[ t \, 1 \] \, $ <eq:cj-cut-maps>]

where restrictions of a path are rescaled to the unit interval.
  Figure 1 shows the tested prefix and retained complement, with the short arcs which close them.
  These maps are jointly continuous in $H^1$, including $t = 0 \, 1$.
  Indeed the derivative energy of a restriction to $\[ s \, t \]$ rescaled to unit time is $\( t - s \)
  integral_s^t \| x' \|^2$, which tends to zero at a collapsing interval, uniformly along an $H^1$-convergent family.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  bezier((0, 0), (2.632, 0), (0.282, 1.363), (2.35, 1.363), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  bezier((2.632, 0), (0, 0), (2.35, -1.363), (0.282, -1.363), stroke: (thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  circle((2.632, 0), radius: 0.05292, fill: black, stroke: none)
  content((-0.1411, 0), [#text(size: 9pt)[$z$]], anchor: "east", padding: 0.1176cm)
  content((2.773, 0), [#text(size: 9pt)[$y$]], anchor: "west", padding: 0.1176cm)
  content((1.316, 1.121), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$x[0,t]$]]], anchor: "south", padding: 0.1176cm)
  content((1.316, -1.121), [#text(size: 9pt)[$x[t,1]$]], anchor: "north", padding: 0.1176cm)
  line((3.29, 0), (4.042, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((4.7, 0), (7.332, 0), (4.982, 1.363), (7.05, 1.363), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((7.332, -0.0752), (4.7, -0.0752), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  circle((4.7, 0), radius: 0.05292, fill: black, stroke: none)
  circle((7.332, 0), radius: 0.05292, fill: black, stroke: none)
  content((4.594, 0), [#text(size: 9pt)[$z$]], anchor: "east", padding: 0.1176cm)
  content((7.438, 0), [#text(size: 9pt)[$y$]], anchor: "west", padding: 0.1176cm)
  content((6.016, -0.5452), [#text(size: 9pt)[$C_1(x,t)$]])
  content((6.016, -0.987), [#text(size: 9pt)[tested by $T$]])
  content((8.319, 0), [#text(size: 9pt)[and]])
  line((9.4, 0.0752), (12.03, 0.0752), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  bezier((12.03, 0), (9.4, 0), (11.75, -1.363), (9.682, -1.363), stroke: (thickness: 1.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((9.4, 0), radius: 0.05292, fill: black, stroke: none)
  circle((12.03, 0), radius: 0.05292, fill: black, stroke: none)
  content((9.294, 0), [#text(size: 9pt)[$z$]], anchor: "east", padding: 0.1176cm)
  content((12.14, 0), [#text(size: 9pt)[$y$]], anchor: "west", padding: 0.1176cm)
  content((10.72, 0.517), [#text(size: 9pt)[$C_2(x,t)$]])
  content((10.72, 0.9588), [#text(size: 9pt)[retained]])
})],
  caption: [Figure 1: The native cut at $y = x \( t \)$, with $z = x \( 0 \)$. Short round arcs (dashed) close the prefix and the remaining path. The cut tests the first loop and retains the second. The drawing separates the nearby endpoints to show the two arcs. ],
) <fig:native-cut>

For a normalized $p$-cocycle $T$ vanishing on $cal(A)_L$, put $q = n + p - 1$ and define on adequate chains

#[#set math.equation(numbering: n => "(5.7)")
 $ D_T x = \( C_2 \)_(\#) #scale(x: 120%, y: 120%)[\(] \( x times I \) frown U_c \( x \( 0 \) \, x \( t \) \)
   frown T \( C_1 \( x \, t \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cj-cut-definition>]

Pullback notation in this formula is abbreviated; the second cap is defined on the supported cut tube.
  Absolute extensions of the loop coproduct and their Euler-characteristic boundary correction were studied by
  Cieliebak, Hingston and Oancea #cite(label("CieliebakHingstonOancea2023")) Section 8.1.
  Their odd-sphere calculation also exhibits constant-loop output terms
  #cite(label("CieliebakHingstonOancea2023")) Proposition 8.3 and Remark 8.4.
  The filtered comparison for the cut defined here is proved below.

For joining, choose an arbitrarily small radius $eta_j$ and a normalized diagonal Thom cocycle $U_j$ relative to
  $F_(eta_j)$. For close $z \, z'$, let $J_(z \, z')$ be the shortest plane rotation taking $z$ to $z'$,
  and the identity at equality. The rotations $J_(z \, z')^u$, $- 1 lt.eq u lt.eq 1$,
  depend smoothly on the two points and converge smoothly to the identity as the points approach.
  Their $g$-length distortion is at most $1 + kappa$, with $kappa arrow.r 0$ as $eta_j arrow.r 0$. Define

#[#set math.equation(numbering: n => "(5.8)")
 $ mu \( x \, y \) = #scale(x: 120%, y: 120%)[\(] \( J_(x \( 0 \) \, y \( 0 \)) x \) \# y
   #scale(x: 120%, y: 120%)[\)]_(\#) #scale(x: 120%, y: 120%)[\(] \( x times y \) frown
   U_j \( x \( 0 \) \, y \( 0 \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cj-join-definition>]

#thm([Lemma 5.3.])[
  (Boundary and length properties).  #emph[The cut has degree $- q$, takes absolute cycles to absolute cycles,
    and preserves global null-homology. For a cycle in $cal(A)_a$ it is supported in
#[#set math.equation(numbering: n => "(5.9)")
 $ cal(A)_(a - L + 1) . $ <eq:cj-cut-bound>]

 The same cut estimate holds on finite fillings. The join has degree $-
   n$ and satisfies the product boundary formula. On any prescribed finite collection of chains and fillings its
   radius can be chosen so that its output length is less than the sum of the two input length bounds plus $1$.
   All these statements are compatible with the refinement comparisons above.]
  #emph[If $c$ is a fundamental cycle of constant loops, then
#[#set math.equation(numbering: n => "(5.10)")
 $ mu \( c \, x \) tilde.eq x quad upright("in ") cal(A)_a $ <eq:cj-chain-unit>]

 for every cycle $x$ in $cal(A)_a$.]
] <lem:cj-operations>

#proof[
  The cut degree is $1 - n - p = - q$. The cap boundary formula applies by Lemma 19;
    its time-end terms vanish because $\( x \( 0 \) \, x \( t \) \)$ is exactly diagonal at $t = 0 \, 1$.
    Applying the same construction to a finite filling proves null-homology preservation.
    On a surviving parent the tested first loop has length at least $L - epsilon$, while
  $ ell \( C_1 \( x \, t \) \) + ell \( C_2 \( x \, t \) \) lt.eq ell \( x \) + 2 epsilon . $
  This gives (5.9). If its upper level is nonpositive, no term survives.
    The join boundary formula uses the closed cocycle $U_j$. Its output length is at most $\( 1 + kappa \)
    ell \( x \) + ell \( y \)$, and $eta_j$ may be chosen after all finite length bounds have been specified.
  For the unit, consider a shuffle of $c times x$. A constant-factor step remaining after the $n$-cap makes the
    output degenerate: the rotated constant is exactly $x \( 0 \)$, so the output is independent of that factor.
    The remaining terms have all $n$ constant-factor steps first.
    Their coefficient is the Thom evaluation on $\[ M \] times { x \( 0 \) }$,
    at the initial parameter vertex of the $x$-simplex, and equals one.
    Thus the output is a constant half followed by $x$. Removing the waiting half by reparametrization gives
    (5.10) without changing length. ◻
]

=== 5.4 Interchanging which factor is cut <interchanging-which-factor-is-cut>

#thm([Theorem 5.4.])[
  (Filtered interchange).  #emph[Let $T$ be a normalized cocycle of degree $p gt.eq 1$ vanishing on $cal(A)_L$,
    where $L > 0$, and put $q = n + p - 1$. Let $x$ and $y$ be arbitrary absolute cycles of respective degrees
    $j \, N$ with
$ j > n + p \, wide N > n + p \, $

 supported in $cal(A)_a$ and $cal(A)_b$. With sufficiently small join radius and adequate refinements,
#[#set math.equation(numbering: n => "(5.11)")
 $ mu \( D_T x \, y \) tilde.eq mu \( D_T y \, x \) quad upright("in ") cal(A)_(a + b - L + c_(upright("cj"))) \,
   wide c_(upright("cj")) = 4 . $ <eq:cj-interchange>]

 Both sides have degree $j + N - q - n$. The constant $c_(upright("cj"))$ is independent of both degrees,
   the cocycle, and all length bounds. The join radius may be chosen for any additional prescribed finite
   collection of fillings without changing this constant.]
] <thm:filtered-interchange>

#proof[
  Write $J = J_(x \( 0 \) \, y \( 0 \))$ and $Z = \( J x \) \# y$.
    On $x times I_s times y$, first cap with $sigma = U_j \( x \( 0 \) \, y \( 0 \) \)$,
    then with $U_c \( Z \( 0 \) \, Z \( s \) \)$, then with $T \( C_1 \( Z \, s \) \)$,
    and output $C_2 \( Z \, s \)$. Call this cycle $P \( x \, y \)$. Its time endpoints vanish by (5.5). We prove
  #[#set math.equation(numbering: n => "(5.12)")
   $ mu \( D_T x \, y \) tilde.eq P \( x \, y \) tilde.eq P \( y \, x \) tilde.eq mu \( D_T y \, x \) .
     $ <eq:cj-three-comparisons>]
  All homologies will have the bound in (5.11).
  ===== 5.4.1 The second half vanishes. <the-second-half-vanishes.>
  Split $I_s$ at $1 \/ 2$. At the seam $Z \( 1 \/ 2 \) = Z \( 0 \)$,
    so each piece is separately a cycle after capping. For $s gt.eq 1 \/ 2$,
    both the cut evaluation and the second-cut output depend only on $\( y \, s \)$.
    A shuffle contains $j$ steps from $x$. Its join face uses at most $n$ of them, and its $T$-face at most $p$.
    Since $j > n + p$, another such step belongs either to the cut Thom face or to the retained output face.
    In the first case the normalized Thom evaluation is zero; in the second the output simplex is degenerate.
    In fact projection drops the unused $x$-step, and the output factors through the corresponding standard
    degeneracy map. Deleting a repeated projected vertex uses a face of the original simplex,
    so this factorization stays within the cut domain. The second-half cycle therefore bounds in its image sublevel.
  ===== 5.4.2 The first half gives the native cut. <the-first-half-gives-the-native-cut.>
  Put $t = 2 s$ on the first half. The first cut is exactly $J C_1 \( x \, t \)$.
    The second cut consists of an arc, the rotated $x$-tail and $y$, with respective durations
  $ 1 / 2 \, wide frac(1 - t, 2 \( 2 - t \)) \, wide frac(1, 2 \( 2 - t \)) . $
  Interpolate them linearly to $1 \/ 4 \, 1 \/ 4 \, 1 \/ 2$. The result is $\( J C_2 \( x \, t \) \) \# y$.
    Length is unchanged, and continuity at $t = 1$ follows because the shrinking tail contributes at most a fixed
    multiple of $integral_t^1 \| x' \|^2$ to the energy.
  Keep this output fixed and move the cut evaluation and tested first loop from those of $J x$ to those of $J^u
    x$, with $u$ decreasing from $1$ to $0$. Cross with this parameter before capping.
    Round rotations preserve the cut distance, so all surviving parents support the fixed output throughout.
    The cap boundary formula gives a homology: it requires continuous supported maps,
    not an identity between the fixed output and an intermediate tested cut. Its time endpoints remain diagonal.
    Small rotation distortion keeps the first-cut plus output length within a fixed small error of $ell \( x \) +
    ell \( y \)$.
  At $u = 0$ put
  $ gamma = U_c \( x \( 0 \) \, x \( t \) \) smile T \( C_1 \( x \, t \) \) \, $
  using extension by zero as in Lemma 19. This normalized cochain has degree $n + p$ and is independent of $y$.
    Impose the native cut smallness even before the join cap. We may then commute $sigma$ and $gamma$ using
  #[#set math.equation(numbering: n => "(5.13)")
   $ delta \( sigma smile_1 gamma \) = sigma smile gamma + gamma smile sigma +
     sigma smile_1 delta gamma . $ <eq:cj-cup-one>]
  For completeness, if the degrees of cochains $u \, v$ are $r \, s$,
    their mod-two cup-one on a simplex of dimension $r + s - 1$ is
  $ sum_(i = 0)^(r - 1) u \[ 0 \, dots.h \, i \, i + s \, dots.h \, r + s - 1 \] thin v \[ i \, dots.h \, i + s \] . $
  The coboundary formula follows by pairing deletions outside and inside the block;
    the shared-end deletions cancel in adjacent summands except for the two outer cups.
    This gives (5.13) since $delta sigma = 0$.
  Lemma 19 makes $delta gamma$ zero on every block involved, including all extension-by-zero terms.
    Each nonzero summand of the primitive has a join face and a cut/test block.
    Its parent is therefore in both tubes and has high first-cut length.
    On either time endpoint the cut part of every $gamma$-face vanishes.
    Capping with the primitive and pushing to the fixed output supplies the required homology between the two cap
    orders.
  With $gamma$ first, a $y$-step in its front face gives a degenerate evaluation.
    The surviving shuffles start with $n + p$ steps from $x times I$.
    Their suffixes are exactly the shuffles of the retained cut face with $y$.
    The native second cut starts at $x \( 0 \)$, so the remaining join cap and output are precisely those of
    $mu \( D_T x \, y \)$. Common factor refinements compare any independently chosen join subdivision.
    This proves the first comparison in (5.12).
  ===== 5.4.3 Symmetry of the joined cut. <symmetry-of-the-joined-cut.>
  Keep the cut interval whole during the following homotopies. Rotate the entire loop by $J^(- u)$, obtaining
  $ \( J^(1 - u) x \) \# \( J^(- u) y \) \, wide 0 lt.eq u lt.eq 1 . $
  Then translate the circle parameter of $x \# \( J^(- 1) y \)$ through half a period,
    ending at $\( J^(- 1) y \) \# x$. Translation is jointly continuous in $H^1$ and preserves length.
    At every stage the evaluations at cut times zero and one are diagonal.
    An intermediate half-time seam need not be diagonal; any seam terms cancel because we use the full interval.
  The swapped join cochain represents the same Thom class relative to $F_(eta_j)$,
    and hence differs from $sigma$ by the coboundary of a cochain relative to that far set.
    A nonzero face of this primitive forces its whole adequate parent into the join tube.
    Cap with the primitive followed by the cut and test cochains and use the boundary formula;
    the cut kills the time endpoints. Shuffle symmetry now identifies the result with $P \( y \, x \)$.
    Repeating the first-half argument in the opposite order proves the last comparison in (5.12);
    the second half vanishes because $N > n + p$.
  ===== 5.4.4 One length bound for all these homologies. <one-length-bound-for-all-these-homologies.>
  Choose the join radius so that each partial rotation changes the length of every path with the prescribed finite
    bounds by less than $epsilon$. This is possible after including the bounds for any additional finite fillings.
    In the whole-loop homotopies a surviving test saves at least $L - epsilon$ from the common joined length,
    at a cost of two short arcs and small rotations. In the first-half homotopy with fixed output,
    compare the tested $J^u C_1$ with $C_1$; each differs in length by less than $epsilon$.
    Together with the two cut arcs and the output rotation this gives a cost less than $8 epsilon$.
    Timing changes preserve length. The cup-one and primitive comparisons satisfy the same bound by whole-parent
    support and oscillation. Thus each individual homology lies already below $a + b - L +
    1$ after sufficiently small choices. Their sum, together with the image-preserving refinement and
    normalization homologies, satisfies the generous common bound $a + b - L + 4$.
    The number of chain terms does not add lengths: the support of a sum is contained in the union of their
    supports. Neither a larger degree nor a finer subdivision traverses an additional long loop.
    This proves the claimed uniformity. ◻
]

=== 5.5 Relative scalar comparison and the absolute unit <relative-scalar-comparison-and-the-absolute-unit>

The remaining identification uses the established singular models of the two string-topology products.
  We state the scalar comparison separately because it does not determine constant-loop output components.

#thm([Lemma 5.5.])[
  (Comparison with the string-topology products).  #emph[The join $mu$ induces $bullet$ on ordinary homology.
    If $T$ represents a relative class $\[ T \] in H^p \( Lambda \, M \)$ and $b$ is a normalized relative cocycle
    of degree $r$, then for every absolute cycle $z$ of degree $p + r + n - 1$,
#[#set math.equation(numbering: n => "(5.14)")
 $ chevron.l b \, D_T z chevron.r = chevron.l \[ T \] convolve.o \[ b \] \, \[ z \] chevron.r .
   $ <eq:cj-scalar-comparison>]

 Here the brackets on the right also denote the image of $z$ in relative homology.]
] <lem:cj-public-comparison>

#proof[
  Hingston–Wahl give singular chain models on $H^1$ loops by capping with the evaluation pullback of a diagonal
    Thom cocycle, then adding short arcs and concatenating or cutting #cite(label("HingstonWahl2023")) Theorem A,
    Definitions 1.2 and 1.4. The dual relative operation is the Goresky–Hingston product
    #cite(label("HingstonWahl2023")) Theorem 2.13; all sign differences disappear over $bb(F)_2$.
    We use these models with the auxiliary round metric and compare the actual maps and cochains.
    Choose their support radius to equal ours and their map domain to contain our larger tube;
    both choices can be made within their injectivity-radius requirement.
  For joining, partially rotate the first input by $J^u$ and apply their short-arc retraction,
    whose values have equal starts throughout. Writing $z = x \( 0 \)$ and $z' = y \( 0 \)$,
    the residual mismatch satisfies $d_(upright("rd")) \( J^u z \, z' \) = \( 1 - u \)
    d_(upright("rd")) \( z \, z' \)$, so all inputs remain in its domain.
    At $u = 0$ this is their retraction; at $u = 1$ the inputs already have equal starts,
    so their retraction is the identity and gives our rotation retraction.
    This is a homotopy inside equal-start pairs. Interpolate their energy-optimal concatenation times to halves.
    For path pieces of square-root energies $P \, Q$, the optimal time for the first piece is $P \/ \( P + Q \)$;
    during this interpolation its energy contribution is bounded by
  $ max { 2 P^2 \, P \( P + Q \) } . $
  This tends to zero if that piece collapses. The other piece is handled in the same way,
    and if both collapse both contributions vanish. Thus the timing homotopy is continuous also at constant pieces.
  For cutting, their short-arc retraction followed by cutting gives exactly the two paths in (5.6),
    with optimal instead of half timings. The same interpolation compares them.
    At either time endpoint one of the two paths remains constant.
    Pairing with $T$ and $b$ evaluates on $z times I$ the cochain
  $ U_c \( x \( 0 \) \, x \( t \) \) smile chi \, wide chi = T \( C_1 \( x \, t \) \) smile b \( C_2 \( x \, t \) \) . $
  Both tests are relative to constants. Hence $chi$ vanishes at $t = 0$ through its first factor and at $t =
    1$ through its second factor.
  Replace $U_c$ by the reduced ordinary Thom representative used in that model.
    They differ by a coboundary relative to the far set. Although its primitive need not vanish on the diagonal,
    all of its time-end contributions are multiplied by $chi$ and vanish.
    If a cap convention reverses the cup order, the cup-one formula supplies the comparison.
    On a small simplex in the tube, $chi$ is a closed pullback; on a simplex in the far set,
    every face of the accompanying Thom cochain or relative primitive vanishes.
    Thus extension-by-zero errors contribute nothing, exactly as in Lemma 19.
    The same argument permits replacement of either relative test by a cohomologous representative.
    Join Thom representatives are compared in the same way, without interval-end terms.
  Finally the Alexander–Whitney map in the coproduct evaluates $T ⊗ b$ as the displayed cup of the two pullbacks.
    Their small-chain replacement and our refined products represent the same relative chain class:
    both are homologous to the input, and small-chain inclusion is a quasi-isomorphism,
    also relative to the time ends, by subdivision. This proves (5.14) and the asserted join identification.
    The argument compares two relative tests; it makes no assertion about a canonical absolute extension of the
    coproduct. ◻
]

#thm([Proposition 5.6.])[
  (The cut of the power is the absolute unit).  #emph[For the choices $S \, T \, l \, L$ in (5.3),
#[#set math.equation(numbering: n => "(5.15)")
 $ \[ D_T S \] = \[ M \] quad upright("in ") H_n \( Lambda \) . $ <eq:cj-absolute-unit>]

 Moreover $D_T S$ is supported in $cal(A)_(l - L + 1)$, and there is a constant $B$ independent of $m$ such that
   it is homologous to a fundamental constant-loop cycle in $cal(A)_B$.]
] <prop:absolute-unit>

#proof[
  Represent $Theta^(bullet \( m + 1 \))$ by a finite cycle $z$.
    Its cut has degree $n + 2 \( m + 1 \) d - q = 3 n - 2$. Lemma 22,
    commutativity of the relative product over $bb(F)_2$, and (5.2) give $chevron.l theta \, D_T z chevron.r = 1$.
    The rank-one calculation therefore yields $\[ D_T z \] = Theta$.
  Both $\| z \|$ and $\| S \| = n + q$ exceed $n + p = q + 1$.
    Apply Theorem 21 to these cycles, now forgetting the finite output length bound. Using the join identification,
  $ 0 eq.not Theta^(bullet \( m + 1 \)) = \[ mu \( D_T z \, S \) \] = \[ mu \( D_T S \, z \) \] . $
  If $D_T S$ were null-homologous, its join with $z$ would bound, by Lemma 20.
    Thus $D_T S eq.not 0$ in $H_n \( Lambda \) = bb(F)_2 \[ M \]$, proving (5.15).
    This determines the absolute constant component by interchange and nonvanishing,
    rather than by the relative scalar test alone.
  The cut bound gives support in $cal(A)_(l - L + 1)$. Its difference from a constant fundamental cycle is
    globally null in degree $n$; Proposition 17 fills that difference in $cal(A)_(l - L + 1 + D_n)$.
    By (5.4), this is one fixed level $B$. ◻
]

The canonical absolute coproduct of #cite(label("HingstonWahl2023")) Theorem B removes evaluation components;
  the cut used here retains the component determined in Proposition 23.
  The comparison proved above is specific to this cut and its degree range.
  It is not an invocation of a general Frobenius identity; the canonical extension fails such an identity
  #cite(label("HingstonWahl2023")) Remark 4.14.

We have obtained three compatible pieces of information: a cut which lowers degree and saves length,
  an interchange homology with fixed length cost, and a bounded-length correction of $D_T S$ to the unit.
  The next section combines them with fixed-degree filling to remove the dependence of the filling increment on
  the homological degree.

== 6 One filling increment in every degree <sec:ordinary>

We combine fixed-degree shortening with the filtered cut–join identity.
  The cut removes a degree-dependent amount of length, while its join with a sphere power restores that length up
  to one fixed difference. The result is a filling increment independent of both degree and level.

#thm([Theorem 6.1.])[
  (Uniform ordinary death).  #emph[For every smooth Riemannian metric on $S^n$, $n gt.eq 3$,
    there is a constant $D > 0$ such that, for every integer $j gt.eq 0$ and every real $a > 0$,
#[#set math.equation(numbering: n => "(6.1)")
 $ ker #scale(x: 120%, y: 120%)[\(] H_j \( X_a \) arrow.r H_j \( Lambda \) #scale(x: 120%, y: 120%)[\)] &
   subset.eq ker #scale(x: 120%, y: 120%)[\(] H_j \( X_a \) arrow.r H_j \( X_(a + D) \) #scale(x: 120%, y: 120%)[\)] \,\
ker #scale(x: 120%, y: 120%)[\(] H_j \( X_a \, M \) arrow.r
  H_j \( Lambda \, M \) #scale(x: 120%, y: 120%)[\)] & subset.eq ker #scale(x: 120%, y: 120%)[\(]
  H_j \( X_a \, M \) arrow.r H_j \( X_(a + D) \, M \) #scale(x: 120%, y: 120%)[\)] . $ <eq:ordinary-absolute>]

 The same constant works at regular and nonregular levels.
   No assumption on the number of prime geodesic images is required.]
] <thm:ordinary-death>

#proof[
  We first prove the absolute assertion for the length filtration $cal(A)_a$,
    then pass to square-root energy and to the relative pair.
  ===== 6.1 Choosing the degree reduction. <choosing-the-degree-reduction.>
  Let $d = n - 1$ and let $alpha \, C_H$ be the constants of Proposition 18. For sufficiently large $j$ put
  #[#set math.equation(numbering: n => "(6.2)")
   $ m = ⌊frac(j - 2, 2 d)⌋ \, wide q = 2 m d \, wide p = q - d \, wide N = n + q . $ <eq:ordinary-degrees>]
  Then
  #[#set math.equation(numbering: n => "(6.3)")
   $ 2 lt.eq r := j - q lt.eq 2 d + 1 = 2 n - 1 \, wide j > q + 1 = n + p \, wide N > n + p . $ <eq:ordinary-remainder>]
  Choose an integer $J > 2 n$ so large that, whenever $j gt.eq J$, these choices have $m gt.eq 1$, $p > n + 1$,
    and $L > 0$ in (5.3). Take $S \, T \, l \, L$ as in that equation. Write
  #[#set math.equation(numbering: n => "(6.4)")
   $ C_(upright("gap")) = l - L = frac(2 n - 1 + 2 C_H, alpha) + 4 \, wide D_(*) = max_(0 lt.eq s < J) D_s \,
     $ <eq:ordinary-gap>]
  where $D_s$ is furnished by Proposition 17. All the remainder degrees in (6.3), and the degree $n$,
    occur in this finite maximum.
  ===== 6.2 Filling a high-degree null cycle. <filling-a-high-degree-null-cycle.>
  Let $x$ be a finite globally null $j$-cycle in $cal(A)_a$, with $j gt.eq J$.
    Its cut $D_T x$ is a globally null $r$-cycle in $cal(A)_(a - L + 1)$ by Lemma 20.
    If $a - L + 1 > 0$, Proposition 17 gives a chain $W$ such that
  $ partial W = D_T x \, wide "supp" W subset cal(A)_(a - L + 1 + D_r) . $
  If $a - L + 1 lt.eq 0$, the cut has no surviving term and we take $W = 0$.
  Fix a fundamental constant-loop cycle $c$. By Proposition 23, the cycle $D_T S -
    c$ is globally null in degree $n$ and is supported in $cal(A)_(C_(upright("gap")) + 1)$.
    Fixed-degree filling gives a chain $V$ with
  #[#set math.equation(numbering: n => "(6.5)")
   $ partial V = D_T S - c \, wide "supp" V subset cal(A)_(C_(upright("gap")) + 1 + D_n) . $ <eq:ordinary-correction>]
  This length bound is independent of $j$, although the chain $V$ itself may depend on the chosen power.
  Choose the join radius after these finite length bounds have been specified.
    Lemma 20 and Theorem 21 permit one choice for the interchange homology and both joined fillings.
    Refinement comparisons are included in the same bounds. The relevant chains have the following supports:
  #[#set math.equation(numbering: n => "(6.6)")
   $ mu \( W \, S \) & upright(" lies in ") cal(A)_(a + C_(upright("gap")) + D_(*) + 2) \,\
mu \( V \, x \) & upright(" lies in ") cal(A)_(a + C_(upright("gap")) + D_(*) + 2) . $ <eq:ordinary-joined-filling>]
  The first assertion is omitted when $W = 0$; otherwise it follows by adding the input bounds $a - L + 1 +
    D_r$ and $l$ and the join allowance $1$. The second follows from (6.5) in the same way.
    Both chains have degree $j + 1$.
  The degree inequalities (6.3) are precisely the two hypotheses needed for the interchange homology. It gives
  $ mu \( D_T x \, S \) tilde.eq mu \( D_T S \, x \) quad upright("in ") cal(A)_(a + C_(upright("gap")) + 4) . $
  The chain $mu \( W \, S \)$ has boundary $mu \( D_T x \, S \)$,
    while $mu \( V \, x \)$ has boundary $mu \( D_T S \, x \) - mu \( c \, x \)$.
    Finally (5.10) joins $mu \( c \, x \)$ to $x$ in $cal(A)_a$.
    Adding these chains and the interchange homology therefore fills $x$.
  Thus one permissible length increment is
  #[#set math.equation(numbering: n => "(6.7)")
   $ D = C_(upright("gap")) + D_(*) + 6 . $ <eq:ordinary-D>]
  It exceeds every bound just used. For $j < J$, the conclusion follows directly from Proposition 17,
    since $D_j lt.eq D_(*) < D$. We have proved that every globally null finite cycle in $cal(A)_a$,
    in any degree, fills in $cal(A)_(a + D)$. The constants in (6.7) depend only on the metric and $n$,
    and every construction used above is independent of a finite-prime hypothesis.
  ===== 6.3 Returning to square-root energy. <returning-to-square-root-energy.>
  A cycle $x$ in $X_a$ is in $cal(A)_a$ because $ell lt.eq F$.
    Fill it by the length assertion and apply $Psi_1$ to that filling.
    Lemma 12 gives $F \( Psi_1 gamma \) = ell \( gamma \)$, so the new filling lies in $X_(a + D)$ and has
    boundary $Psi_1 x$. The normalization prism from $x$ to $Psi_1 x$ lies entirely in $X_a$ by (4.1).
    Adding this prism proves (6.1) with the same $D$. Strict sublevel inequalities are preserved throughout;
    no approximation by regular levels is involved.
  ===== 6.4 Passing to constants-relative homology. <passing-to-constants-relative-homology.>
  Let $i : M arrow.r Lambda$ include constants and let $"ev"_0 : Lambda arrow.r M$ be evaluation at zero.
    Since $"ev"_0 compose i = "id"_M$, the chain map
  $ P = "id" - i_(\#) \( "ev"_0 \)_(\#) $
  annihilates $C_(*) \( M \)$ and preserves $C_(*) \( X_a \)$ for every $a > 0$.
    If $z$ represents a relative cycle in $\( X_a \, M \)$, then $partial z in C_(*) \( M \)$,
    so $P z$ is an absolute cycle representing the same relative class.
    If $z$ is globally null relative to $M$, there are finite chains $U$ in $Lambda$ and $c'$ in $M$ with $partial
    U = z + c'$. Applying $P$ gives $partial \( P U \) = P z$. Hence $P z$ is globally null absolutely.
    By (6.1) it fills in $X_(a + D)$, and passage to the relative chain quotient proves (6.1).
    This argument includes degree zero and uses exactly the same increment. ◻
]

The restriction $a > 0$ ensures that the constant loops belong to the relative pair.
  For nonpositive $a$ the open absolute sublevel is empty. Theorem 24 supplies the degree-uniform control of
  ordinary transient classes needed for the reflection-equivariant argument below.

== 7 Global equivariant classes <sec:equivariant>

We now compute the global reflection cohomology and construct the full-group classes needed in the doubling
  argument. The computation uses a round metric only to filter the loop space;
  the resulting classes belong to the same global groups for every metric.
  The distinction between odd and even round stages will be essential.
  It is independent of the parity of the sphere dimension.

=== 7.1 Natural Gysin sequences <natural-gysin-sequences>

Let $w in H^1 \( B G \; bb(F)_2 \)$ and $U in H^2 \( B G \; bb(F)_2 \)$ be the Stiefel–Whitney classes of the
  standard two-dimensional representation of $G = O \( 2 \)$. We use the same letter $w$ for its restrictions.
  Let $v in H^1 \( B K \; bb(F)_2 \)$ be the character which is nontrivial on $tau$ and trivial on $R$. Then

#[#set math.equation(numbering: n => "(7.1)")
 $ H^(*) \( B G \; bb(F)_2 \) = bb(F)_2 \[ w \, U \] \, wide H^(*) \( B K \; bb(F)_2 \) = bb(F)_2 \[ v \, w \] \,
   wide "res"_K U = v \( v + w \) . $ <eqv:coefficient-rings>]

Indeed, the standard plane restricts to the two characters $v$ and $v + w$.
  Its projectivization over $B G$ is $B K$, so the projective-bundle formula makes restriction injective
  #cite(label("HatcherVBKT2017")) Section 3.1, pp. 78–79. Conjugation in $G$ interchanges the two coordinate lines
  of $K$, whereas inner conjugation acts trivially on $H^(*) \( B G \)$.
  The image is consequently contained in the symmetric polynomials in $v \, v + w$.
  It contains their sum $w$ and product $U$, which generate that symmetric polynomial ring. This proves (7.1).

For an $H$-pair $\( Y \, A \)$, write $H_H^(*) \( Y \, A \)$ for its Borel cohomology.
  These groups are zero in negative degrees.

#thm([Proposition 7.1.])[
  (Natural Gysin sequences).  #emph[For every $G$-pair $\( Y \, A \)$, there are natural exact sequences
#[#set math.equation(numbering: n => "(7.2)")
 $ dots.h.c arrow.r H_G^(j - 2) \( Y \, A \) & arrow.r^(thin U thin) H_G^j \( Y \, A \) arrow.r^("res"_R)
   H_R^j \( Y \, A \) arrow.r^integral H_G^(j - 1) \( Y \, A \) arrow.r^(thin U thin) H_G^(j + 1) \( Y \, A \)
   arrow.r dots.h.c \,\
0 arrow.r H_G^j \( Y \, A \) & arrow.r^("res"_K) H_K^j \( Y \, A \) arrow.r^integral H_G^(j - 1) \( Y \, A \)
  arrow.r 0 . $ <eqv:standard-gysin>]

 For an $R$-pair and a $K$-pair, respectively, the sign-line sequences are
#[#set math.equation(numbering: n => "(7.3)")
 $ dots.h.c arrow.r H_R^(j - 1) \( Y \, A \) & arrow.r^(thin w thin) H_R^j \( Y \, A \) arrow.r
   H^j \( Y \, A \) arrow.r H_R^j \( Y \, A \) arrow.r^(thin w thin) H_R^(j + 1) \( Y \, A \) arrow.r dots.h.c \,\
dots.h.c arrow.r H_K^(j - 1) \( Y \, A \) & arrow.r^(thin v thin) H_K^j \( Y \, A \) arrow.r
  H_R^j \( Y \, A \) arrow.r H_K^j \( Y \, A \) arrow.r^(thin v thin) H_K^(j + 1) \( Y \, A \) arrow.r
  dots.h.c . $ <eqv:reflection-gysin>]

 The maps commute with maps of pairs and subgroup restriction wherever the latter applies,
   and satisfy the projection formula for absolute base classes.]
] <prop:gysin>

#proof[
  For a real rank-$r$ representation of $H$, its associated bundle over $Y_H$ restricts to a bundle over $A_H$.
    Suppose that its unit sphere is $H \/ H'$. The sphere-bundle pair is then the Borel pair for $H'$.
    The relative Thom sequence gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ dots.h.c arrow.r H_H^(j - r) \( Y \, A \) arrow.r^(thin w_r thin) H_H^j \( Y \, A \) arrow.r
     H_(H')^j \( Y \, A \) arrow.r^integral H_H^(j - r + 1) \( Y \, A \) arrow.r dots.h.c . $ <eqv:general-gysin>]
  Here is a cochain construction that also justifies (7.4) when the inclusion $A_H subset
    Y_H$ is not a cofibration. For a vector bundle over $Z supset A_0$, let $D \,
    S$ denote its disk and sphere bundles, and let $D_(A_0) \, S_(A_0)$ be their restrictions.
    In the singular chain complex of $D$, put
  $ cal(L) = C_(*) \( S \) + C_(*) \( D_(A_0) \) . $
  The two summands intersect in $C_(*) \( S_(A_0) \)$, since singular chains have the singular simplices as a
    basis. Restriction of cochains gives degreewise exact sequences
  $ 0 & arrow.r "Ann" cal(L) arrow.r C^(*) \( D \, S \) arrow.r C^(*) \( D_(A_0) \, S_(A_0) \) arrow.r 0 \,\
0 & arrow.r "Ann" cal(L) arrow.r C^(*) \( D \, D_(A_0) \) arrow.r C^(*) \( S \, S_(A_0) \) arrow.r 0 . $
  Surjectivity follows by extending linear functionals on chain subspaces.
    Cup with a Thom cocycle sends a relative base cochain into $"Ann" cal(L)$:
    on $S$ the Thom factor vanishes, and on $D_(A_0)$ the base factor vanishes.
    Comparison of the first sequence with the base-pair sequence, using the absolute Thom isomorphisms, proves
  $ H^(j - r) \( Z \, A_0 \) tilde.equiv H^j \( "Ann" cal(L) \) . $
  The second sequence and the disk contraction give (7.4). The map back to the base is cup with the zero-section
    pullback of the Thom class, namely $w_r$. Pullback of Thom classes gives naturality and the projection
    formula. The absolute Thom isomorphism used here is the ordinary mod-two one #cite(label("HatcherVBKT2017"))
    Section 3.2, pp. 88–89; for a general base it follows by pulling back to its singular CW replacement and using
    the disk and sphere fibrations. This argument uses the sum of two chain subspaces and does not require an
    excision assertion for their union.
  The standard $G$-plane has sphere stabilizer $R$ and Euler class $U$, proving (7.2).
    Let $rho_2$ be the representation that doubles rotation angles and sends the chosen reflection to
    $"diag" \( 1 \, - 1 \)$. Its sphere stabilizer is $K$. On $K$ it has a fixed line,
    so its Euler class restricts to zero. The injectivity in (7.1) makes that Euler class zero already on $B G$,
    giving (7.2). Finally, the sign representations with kernels $1 subset R$ and $R subset
    K$ have Euler classes $w$ and $v$, respectively. ◻
]

=== 7.2 The classes to be constructed <the-classes-to-be-constructed>

Evaluation at zero is $R$-invariant. If $sigma in H^n \( S^n \; bb(F)_2 \)$ is the nonzero class, set

$ e = "ev"_0^(*) sigma in H_R^n \( Lambda \; bb(F)_2 \) . $

In particular $e^2 = 0$. Recall that $d = n - 1$, and put

$ a_m = \( 2 m - 1 \) d wide \( m gt.eq 1 \) . $

#thm([Theorem 7.2.])[
  (Global generators and full-group lifts).  #emph[For $n gt.eq 3$, there are classes
$ X_m in B_oo^(a_m) = H_R^(a_m) \( Lambda \, M \) \, wide m gt.eq 1 \, $

 with the following properties.]
  + #emph[The classes
$ xi_(m \, k) = w^k X_m \, wide eta_(m \, k) = e thin w^k X_m \, wide m gt.eq 1 \, quad 0 lt.eq k lt.eq d \, $

 form a graded $bb(F)_2$-basis of $B_oo$. Their degrees are
$ \| xi_(m \, k) \| = a_m + k \, wide \| eta_(m \, k) \| = a_m + n + k . $

 We call the $xi_(m \, k)$ the #emph[bottoms] and the $eta_(m \, k)$ the #emph[tops] at stage $m$.
   Multiplication by $w^n$ annihilates $B_oo$.]
  + #emph[Every $X_m$ is the restriction of a class $zeta_m in H_G^(a_m) \( Lambda \, M \)$.
    If $m$ is odd, then $U^n zeta_m = 0$. If $m$ is even, there is also a class $Y_m in
    H_G^(a_m + n) \( Lambda \, M \)$ with $"res"_R Y_m = e X_m$.]
  + #emph[For the round metric, let $Z_p$ be an open regular sublevel containing exactly the first $p$ positive
    critical manifolds, and choose $Z_0$ below the first one.
    For $H = R \, G$, every crossing sequence for $\( Z_p \, Z_(m_0 - 1) \)$, $p gt.eq m_0$, is short exact.
    A chosen class of the $m$-th crossing has a unique extension to $H_H^j \( Lambda \, Z_(m - 1) \)$ whenever
    $j < a_(m + 1)$, for $H = R \, G$. The lifts in (ii) and the classes $X_m$ can be obtained from these relative
    extensions.]
] <thm:global-generators>

The top classes in (ii) are chosen lifts; they need not be canonical.
  Only their reflection restrictions will be used. Also, the annihilation statement in (i) is relative to
  constants. The absolute constant-loop Borel summand retains its polynomial $w$-tower.

=== 7.3 Round crossings <round-crossings>

Give $S^n$ its unit round metric and write $E_0$ for its energy.
  The positive critical values are $c_m = \( 2 pi m \)^2$. The critical manifold at $c_m$ consists of the loops

#[#set math.equation(numbering: n => "(7.5)")
 $ gamma_(x \, u) \( t \) = x cos \( 2 pi m t \) + u sin \( 2 pi m t \) \, wide \| x \| = \| u \| = 1 \, quad
   x perp u . $ <eqv:round-loops>]

It is $C_m = S T S^n$, the manifold of orthonormal two-frames in $bb(R)^(n + 1)$.

#thm([Lemma 7.3.])[
  (Round attachment).  #emph[The negative bundle of $C_m$ has rank $a_m$,
    and the kernel of the round Hessian is exactly $T C_m$. For every closed subgroup $H subset G$,
    the crossing has a Thom isomorphism
#[#set math.equation(numbering: n => "(7.6)")
 $ H_H^j \( Z_m \, Z_(m - 1) \) tilde.equiv H_H^(j - a_m) \( C_m \) . $ <eqv:crossing-thom>]

 These isomorphisms commute with subgroup restriction and cup by absolute classes.
   The small sublevel $Z_0$ retracts $G$-equivariantly to $M$.]
] <eqv:round-attachment>

#proof[
  Along (7.5), put
  $ e_t = - x sin \( 2 pi m t \) + u cos \( 2 pi m t \) . $
  A tangent field is $a \( t \) e_t + b \( t \)$, where $b \( t \) perp "span" { x \, u }$. Half the Hessian is
  #[#set math.equation(numbering: n => "(7.7)")
   $ integral_0^1 #scale(x: 120%, y: 120%)[\(] \| a' \|^2 + \| b' \|^2 - \( 2 pi m \)^2 \| b \|^2
     #scale(x: 120%, y: 120%)[\)] thin d t . $ <eqv:round-hessian>]
  In each of the $d$ normal directions, the negative Fourier frequencies are $\| k \| < m$.
    Their real dimension is $2 m - 1$. The null modes are the two normal modes at frequency $m$,
    together with the constant tangential mode. They have dimension $2 d +
    1$ and are precisely the variations of the frame $\( x \, u \)$.
    The nonzero Fourier eigenvalues, divided by the corresponding squared $H^1$-norms, are bounded away from zero.
    Thus the Hessian is invertible on the orthogonal complement of its kernel.
    At constants, the Hessian is $2 integral \| V' \|^2$, positive and invertible off its constant kernel.
  We describe why the resulting attachment respects the full group.
    Use the strong metric induced by the Euclidean $H^1$-norm.
    Each parameter symmetry is a smooth isometry, and the action is continuous.
    Pointwise exponential gives a chart on the Hilbert normal bundle of the compact manifold $C_m$,
    at a uniform small radius. In these coordinates Taylor’s formula writes the energy difference as $chevron.l
    A \( z \, y \) y \, y chevron.r$, with $A \( z \, 0 \)$ an invertible symmetric operator on the normal fiber.
    Normalize first by $\| A \( z \, 0 \) \|^(1 \/ 2)$, and let $J = "sign" A \( z \, 0 \)$.
    For the resulting operator $B$ near $J$, the norm-convergent power series $C = \( J B \)^(1 \/ 2)$ satisfies
    $C^(*) J C = B$. The change $y mapsto C \( z \, y \) y$ is a diffeomorphism after shrinking the tube.
    All these constructions commute with the parameter isometries. They give the exact normal form
  #[#set math.equation(numbering: n => "(7.8)")
   $ E_0 = c_m - \| u_(-) \|^2 + \| u_(+) \|^2 $ <eqv:round-normal-form>]
  on the negative and positive bundles.
  For completeness, the sublevel attachment uses the original Hilbert space,
    rather than a polygon model with only finite rotational symmetry.
    Patch a complete normalized descending gradient field to the split field
  $ dot(z) = 0 \, wide dot(u)_(-) = u_(-) \, wide dot(u)_(+) = - u_(+) $
  inside the normal tube, using an invariant squared-radius cutoff.
    Both fields strictly decrease $E_0$ away from $C_m$ within the isolating energy band.
    The coordinate derivatives are uniformly bounded in a small tube over the compact zero section,
    so the patched field remains bounded. The ambient strong metric is complete; hence this field is complete.
    Palais–Smale and regular-band deformation (Lemmas 4 and 5) give a uniform decrease outside any smaller tube in
    an isolating energy band. The flow-lens construction of Lemma 9 therefore computes the crossing in that
    smaller tube. Use its notation $X \, Y \, N \, Q$, with lower energy cut $t_(-) < c_m$.
    In split coordinates, contraction of $u_(+)$ decreases both endpoint energies of a trapped flow segment.
    It defines maps $N arrow.r X$ taking $Q$ into $Y$, even when a contracted point leaves $N$ through the lower
    endpoint. Via $N \/ Q tilde.equiv X \/ Y$, these maps induce a contraction to the negative disk with its
    boundary collapsed. For flow time $T$, the surviving disk before applying the flow has radius $e^(- T)
    sqrt(c_m - t_(-))$; its boundary flows to the lower cut. The flow multiplies $u_(-)$ by $e^T$,
    identifying this disk and sphere with the usual negative-bundle disk and sphere.
    The disk is closed in the lens and meets $Q$ exactly in its sphere.
    These statements remain true after Borel construction. The disk/sphere quotient consequently embeds in the
    lens quotient: the saturation of a closed subset of the disk is that subset,
    possibly together with the closed collapse set. The contraction fixes its image.
    The disk/sphere inclusion is a good pair. This proves (7.6) by the mod-two Thom isomorphism.
  All pair maps just used are $G$-equivariant. The negative bundle carries its actual derivative action;
    no triviality of that action is assumed. Restriction to a subgroup and cup by an absolute class therefore
    commute with the attachment isomorphism. Wider regular cuts give the same assertion by regular-band
    deformation. Finally, sufficiently small energy places a loop in the positive normal chart of the constants,
    where contraction of the normal coordinate proves the last assertion. ◻
]

=== 7.4 Cohomology of the critical manifolds <cohomology-of-the-critical-manifolds>

Reflection sends $\( x \, u \)$ to $\( x \, - u \)$. It acts freely on $C_m$, and

$ \( C_m \)_R tilde.eq P \( T S^n \) . $

The sign line is the tautological line in this projective bundle.
  Since $T S^n xor bb(R)$ is trivial, its positive Stiefel–Whitney classes vanish. The projective-bundle formula gives

#[#set math.equation(numbering: n => "(7.9)")
 $ H_R^(*) \( C_m \) = bb(F)_2 \[ w \, e \] \/ \( w^n \, e^2 \) . $ <eqv:reflection-critical-ring>]

Here $e$ is pulled back from the first frame vector $x$. This computation uses mod-two coefficients also when $n$
  is even. Write $x_m$ for the bottom Thom class of the crossing, with the group understood.
  Its subgroup restrictions are the corresponding bottom classes. Thus the reflection crossing has basis

#[#set math.equation(numbering: n => "(7.10)")
 $ w^k x_m \, quad e w^k x_m \, wide 0 lt.eq k lt.eq d \, $ <eqv:reflection-local-basis>]

with degrees $a_m + k$ and $a_m + n + k$.

For $j gt.eq 1$, let $rho_j : G arrow.r O \( 2 \)$ multiply rotation angles by $j$ and preserve the chosen
  reflection. The pullbacks of the two plane classes are

#[#set math.equation(numbering: n => "(7.11)")
 $ w_1 \( rho_j \) = w \, wide w_2 \( rho_j \) = \( j med mod med 2 \) U . $ <eqv:weight-classes>]

To check the second identity, restrict to $B S O \( 2 \)$,
  where a weight-$j$ complex line multiplies the first Chern class by $j$.
  The only possible additional degree-two term is a multiple of $w^2$; restriction to $B R$,
  where the plane has a trivial line, excludes that term.

#thm([Lemma 7.4.])[
  (Odd and even critical modules).  #emph[Define homogeneous polynomials $A_i in bb(F)_2 \[ w \, U \]$ by
#[#set math.equation(numbering: n => "(7.12)")
 $ A_0 = 1 \, wide A_1 = w \, wide A_i = w A_(i - 1) + U A_(i - 2) quad \( i gt.eq 2 \) . $ <eqv:grassmann-recurrence>]

 If $m$ is odd, the $G$-crossing is generated over $bb(F)_2 \[ w \, U \]$ by $x_m$, and
#[#set math.equation(numbering: n => "(7.13)")
 $ A_(d + 1) x_m = A_(d + 2) x_m = 0 . $ <eqv:grassmann-relations>]

 If $m$ is even, multiplication by $U$ is injective on the $G$-crossing,
   and that crossing is generated over $bb(F)_2 \[ w \, U \]$ by $x_m$ and a chosen class $y_m$ of degree $a_m +
   n$ whose reflection restriction is $e x_m$.]
] <eqv:critical-modules>

#proof[
  The $G$-action on frames is the right action through $rho_m$, up to the convention for inverse precomposition.
    For odd $m$, the map from the critical Borel space to $upright("Gr")_2 \( bb(R)^(n + 1) \)$ has fiber the
    classifying space of the cyclic group of order $m$. Local choices of frames give local trivializations.
    That fiber has no positive-degree mod-two cohomology, by transfer,
    so the map induces a cohomology isomorphism. The tautological plane pulls back to the plane of $rho_m$;
    its classes are $w \, U$ by (7.11).
  These two classes generate the Grassmann cohomology. Indeed, projectivize the tautological plane.
    On the resulting ordered-line flag space, let $s \, t$ be the first Stiefel–Whitney classes of its two lines.
    Over the Grassmannian, the projective-bundle formula gives a free module with basis $1 \, s$.
    Over $bb(R P)^n$, the same flag space is the projectivization of the first line’s perpendicular bundle,
    so its ring is generated by $s \, t$. Since $s + t = w$, $s t = U$, and $s^2 = w s + U$,
    every polynomial in $s \, t$ reduces to $P \( w \, U \) + s Q \( w \, U \)$.
    Uniqueness of the free-module expansion implies that every class pulled back from the Grassmannian is a
    polynomial in $w \, U$. The complementary bundle has rank $d$,
    with total Stiefel–Whitney class $\( 1 + w + U \)^(- 1)$.
    Its components are the polynomials $A_i$, proving (7.13) and the odd-stage assertion.
  If $m$ is even, $tau$ acts trivially on the critical manifold. Consequently
  $ H_K^(*) \( C_m \) = H_R^(*) \( C_m \) \[ v \] . $
  The same statement holds for the crossing modules after the Thom shift,
    with the actual equivariant negative bundle retained. The polynomial $U = v \( v + w \)$ is monic in $v$,
    hence acts injectively even though the coefficient ring in (7.9) has zero divisors.
    The injection in (7.2) makes $U$ injective on the $G$-crossing as well.
    Sequence (7.2) therefore identifies the quotient of the $G$-crossing by $U$ with the $R$-crossing.
    Choose a lift $y_m$ of $e x_m$; the bottom $x_m$ already lifts.
    Their $w$-multiples generate modulo $U$, by (7.10). Subtracting such a combination and dividing the remainder
    by $U$ reduces degree by two, so induction from the bottom degree proves generation. ◻
]

=== 7.5 Collapse on all round intervals <collapse-on-all-round-intervals>

#thm([Lemma 7.5.])[
  (Interval collapse and supported extensions).  #emph[Fix $m_0 gt.eq 1$.
    For $H = R \, G$ and $p gt.eq m_0$, the crossing sequence is short exact:
#[#set math.equation(numbering: n => "(7.14)")
 $ 0 arrow.r H_H^j \( Z_p \, Z_(p - 1) \) arrow.r H_H^j \( Z_p \, Z_(m_0 - 1) \) arrow.r
   H_H^j \( Z_(p - 1) \, Z_(m_0 - 1) \) arrow.r 0 . $ <eqv:interval-short-exact>]

 Restriction induces an isomorphism
#[#set math.equation(numbering: n => "(7.15)")
 $ H_H^j \( Lambda \, Z_(m - 1) \) arrow.r H_H^j \( Z_m \, Z_(m - 1) \) wide
   upright("if ") j < a_(m + 1) . $ <eqv:unique-relative-lift>]

]
] <eqv:interval-collapse>

#proof[
  First use $H = R$, inducting on $p$. By (7.10), the earlier interval module is generated over the ambient
    classes $w \, e$ by chosen extensions of its bottoms $x_j$, $m_0 lt.eq j < p$.
    The connecting homomorphism sends such a bottom into the new crossing in degree $a_j + 1 < a_p$,
    where the crossing is zero. It is linear over $w \, e$, hence vanishes on the whole earlier module.
    This proves (7.14) for $R$, and also justifies the inductive generation assertion.
  For $G$, Lemma 28 gives the same induction with the bottom generators and, at even stages $j$,
    the chosen top generators of degree $a_j + n$. Bottoms again have zero connecting image.
    For a top, the only potentially relevant degree is $a_j + n + 1$.
    If $d > 2$, then $n + 1 = d + 2 < 2 d$, so this degree is less than $a_p$.
    If $d = 2$, equality can occur only when $j = p - 1$ is even.
    In this case $p$ is odd, and the target is its one-dimensional bottom $G$-crossing.
    Restriction to the corresponding reflection bottom is injective:
    both bottom Thom classes restrict to the nonzero bottom class.
    The reflection connecting map has already been proved zero.
    Naturality therefore kills the $G$-connecting map in this last case as well.
    This proves (7.14) in every dimension $n gt.eq 3$.
  We pass to the global pair degree by degree. Every singular chain in the Borel construction is finite and has
    bounded round energy, since energy descends to a continuous invariant function. Thus
  $ H_j^H \( Lambda \, Z_(m - 1) \) = "inj lim"_(p gt.eq m) H_j^H \( Z_p \, Z_(m - 1) \) . $
  Universal coefficients over the field $bb(F)_2$ identify its dual with the inverse limit of the degree-$j$
    cohomology groups. The local crossing groups vanish below $a_p$, which tends to infinity.
    Sequence (7.14) consequently stabilizes in every degree. For $j < a_(m + 1)$,
    no subsequent crossing contributes, proving (7.15). All limits in this argument are taken in a fixed degree;
    the total cohomology module is the graded direct sum. ◻
]

Since $Z_0$ retracts equivariantly to $M$, the triple exact sequence identifies $H_H^(*) \( Z_p \, Z_0 \)$ with
  $H_H^(*) \( Z_p \, M \)$, and likewise $H_H^(*) \( Lambda \, Z_0 \)$ with $H_H^(*) \( Lambda \, M \)$.
  Thus the first interval filtration computes precisely the global groups relative to constants used below.

Choose the relative extension

$ tilde(zeta)_m in H_G^(a_m) \( Lambda \, Z_(m - 1) \) $

of the bottom Thom class. Map it to $H_G^(a_m) \( Lambda \, M \)$, and call the resulting class $zeta_m$.
  Let $X_m = "res"_R zeta_m$. For even $m$, choose $y_m$ as in Lemma 28. Since

#[#set math.equation(numbering: n => "(7.16)")
 $ n = d + 1 < 2 d \, $ <eqv:strict-top-gap>]

it has a unique relative extension in degree $a_m + n$. Call its image in $H_G^(*) \( Lambda \, M \)$ $Y_m$.
  Restriction and cup by $e$ commute with the relative extensions; both have local value $e x_m$.
  Uniqueness in (7.15) therefore gives

#[#set math.equation(numbering: n => "(7.17)")
 $ "res"_R Y_m = e X_m wide \( m med upright("even") \) . $ <eqv:even-top-restriction>]

Similarly, $w^n "res"_R tilde(zeta)_m$ has local value zero by (7.9). Its offset is $n < 2 d$, so uniqueness gives

#[#set math.equation(numbering: n => "(7.18)")
 $ w^n X_m = 0 . $ <eqv:global-w-relation>]

The products $w^k X_m \, e w^k X_m$, $0 lt.eq k lt.eq d$, now form a basis of $B_oo$.
  To see independence, restrict a finite relation to the lowest round stage occurring in it:
  later classes vanish there, while the remaining leading terms form the local basis (7.10).
  Repeat with successive stages. For spanning, in each fixed degree the interval short exact sequences give
  precisely the sum of the local dimensions, and only finitely many stages contribute.
  Equation (7.18) and multiplication by $e$ show that $w^n$ annihilates the entire relative module.

=== 7.6 Odd-stage torsion <odd-stage-torsion>

The remaining full-group relation follows from one integration calculation.
  This will also keep the dimension-three case within the strict extension range.

#thm([Lemma 7.6.])[
  (Torsion of odd bottoms).  #emph[For every odd $m$ and every $n gt.eq 3$,
$ U^n zeta_m = 0 . $

 When $n = 3$, the supported relative lift also satisfies
$ w^3 tilde(zeta)_m = 0 \, wide U \( w^2 + U \) tilde(zeta)_m = 0 . $

]
] <eqv:odd-torsion>

#proof[
  The recurrence (7.12) implies
  #[#set math.equation(numbering: n => "(7.19)")
   $ A_i^2 + A_(i - 1) A_(i + 1) = U^i wide \( i gt.eq 1 \) . $ <eqv:determinant-identity>]
  Indeed, substitution of the recurrence makes the left side for $i gt.eq
    2$ equal to $U$ times the left side for $i - 1$; the initial value is $w^2 + A_2 = U$.
  At an odd crossing, (7.13) gives
  $ U A_d x_m = \( A_(d + 2) + w A_(d + 1) \) x_m = 0 . $
  The class $A_d x_m$ is nonzero: on restriction to $R$, it becomes $w^d x_m$, which is nonzero in (7.10).
    The relevant part of the standard-plane Gysin sequence is
  $ H_R^(a_m + d + 1) \( Z_m \, Z_(m - 1) \) arrow.r^integral H_G^(a_m + d) \( Z_m \, Z_(m - 1) \) arrow.r^U
    H_G^(a_m + d + 2) \( Z_m \, Z_(m - 1) \) . $
  Its source is one-dimensional, spanned by $e x_m$. Since its image contains the nonzero class $A_d x_m$,
    exactness over $bb(F)_2$ forces
  #[#set math.equation(numbering: n => "(7.20)")
   $ integral e x_m = A_d x_m . $ <eqv:local-integration>]
  Apply the same integration map to $e thin "res"_R tilde(zeta)_m$ in the pair $\( Lambda \, Z_(m - 1) \)$.
    Naturality and (7.20) identify its restriction to the crossing with $A_d x_m$.
    Both sides have offset $d < 2 d$, so (7.15) gives
  $ integral #scale(x: 120%, y: 120%)[\(] e thin "res"_R tilde(zeta)_m #scale(x: 120%, y: 120%)[\)] =
    A_d tilde(zeta)_m . $
  The next map in Gysin is multiplication by $U$, hence
  #[#set math.equation(numbering: n => "(7.21)")
   $ U A_d tilde(zeta)_m = 0 . $ <eqv:integrated-relation>]
  Also $A_(d + 1) tilde(zeta)_m = 0$, because its local value is zero and $d + 1 < 2 d$.
    Multiplying (7.19) at $i = d$ by $U tilde(zeta)_m$ therefore gives
  $ U^(d + 1) tilde(zeta)_m = U A_d^2 tilde(zeta)_m + U A_(d - 1) A_(d + 1) tilde(zeta)_m = 0 . $
  Its image in $H_G^(*) \( Lambda \, M \)$ is $U^n zeta_m = 0$.
  For $n = 3$, one has $d = 2$, $A_2 = w^2 + U$, and $A_3 = w^3$. The two intermediate global relations are exactly
  $ w^3 tilde(zeta)_m = 0 \, wide U \( w^2 + U \) tilde(zeta)_m = 0 . $
  Their proof used uniqueness only at offsets two and three, both strictly less than the next-bottom gap four.
    It did not extend an offset-four relation across that gap. ◻
]

The basis construction, (7.17), and Lemma 30 complete the proof of Theorem 26.
  For later use, the degree intervals for the bottom family are $\[ a_m \, a_m + d \]$,
  and those for the top family are $\[ a_m + n \, a_m + n + d \]$.
  Intervals within either family are disjoint, since their starting degrees differ by $2 d$;
  a bottom and a top can have the same degree. Thus restrictions of tops will be counted modulo all restricted
  bottoms. The next sections compare those global restrictions with the extra classes present at a finite cut.

== 8 A finite-cut defect bound <sec:budget>

Throughout this section we assume that there are finitely many prime geodesic images.
  Our objective is to compare a sublevel with its half-translation fixed locus while retaining the information
  lost by localization. The comparison has two degrees: the total equivariant degree upstairs and the degree of a
  root loop downstairs. An exact-sequence calculation will bound their discrepancy,
  summed over all degree cutoffs, by the number of critical events.

Write

$ B_a^l = H_R^l \( X_a \, M \) \, wide B_oo^l = H_R^l \( Lambda \, M \) . $

At a regular cut these reflection groups have finite total dimension:
  Theorem 10 identifies each reflection crossing with a finite sum of ordinary one-orientation crossing groups,
  and there are only finitely many crossings below a finite cut. All sublevels in the statements are open.
  At regular endpoints, the deformations of Lemmas 5 and 6 identify them,
  naturally under inclusion and fixed restriction, with closed regular polygon models.
  We use those compact models in the localization argument.

#thm([Lemma 8.1.])[
  (Finite-pair localization).  #emph[Let $2 a > 0$ be regular.
    Then $a$ is regular, and restriction to the half-translation fixed locus induces an isomorphism
$ H_K^(*) \( X_(2 a) \, M \) \[ v^(- 1) \] arrow.r H_K^(*) \( X_(2 a)^tau \, M \) \[ v^(- 1) \] . $

 It is an actual isomorphism in every sufficiently high degree, with the threshold allowed to depend on $a$.
   The same localization assertion holds for crossing pairs and respects their individual prime labels.]
  #emph[For an ambient crossing at the $m$-th iterate of a prime,
    its actual $K$-group has uniformly bounded dimension in every degree, is zero below $I_m - A$,
    and maps isomorphically to its stabilized fixed target above $I_m + A$,
    after increasing the uniform constant $A$. For odd $m$ that target is zero;
    for even $m$ its root labels satisfy $\| l - I_(m \/ 2) \| lt.eq A$.]
] <bud:localization>

#proof[
  A critical root doubles to a critical loop, so regularity of $2 a$ implies regularity of $a$.
    Doubling identifies $X_a$ with $X_(2 a)^tau$ as an $R$-space.
    Since $tau$ acts trivially there, a product universal model and the field Künneth formula give
  #[#set math.equation(numbering: n => "(8.1)")
   $ H_K^J \( X_(2 a)^tau \, M \) = xor.big_(l lt.eq J) v^(J - l) B_a^l . $ <bud:fixed-product>]
  The same identification holds for fixed crossing pairs.
  Choose a common even polygon model through the cut, and double its compact regular sublevel along an invariant
    collar. Denote the resulting closed smooth $K$-manifold by $cal(D)$.
    Inclusion of the original sublevel and the fold map make its restriction arrow to the fixed locus a retract of
    the corresponding arrow for $cal(D)$. The fixed submanifold $cal(D)^tau$ has an invariant open tubular
    neighborhood $O_0$ which retracts equivariantly onto it. The compact complement of $O_0$ is covered by
    finitely many invariant open sets $O_1 \, dots.h \, O_s$,
    each admitting an equivariant map to $K \/ H_i$ with $tau in.not H_i$.
    Indeed, use a small stabilizer-invariant neighborhood disjoint from its translates by other cosets,
    and then saturate it.
  The possible groups $H_i$ are $1$, $R = chevron.l r chevron.r$, and $chevron.l tau r chevron.r$.
    On each, $U = v \( v + w \)$ restricts to zero. Thus $U$ lifts to $H_K^2 \( cal(D) \, O_i \)$.
    Cup these lifts with a class relative to $O_0$. The relative cup product for the open cover has target
    relative to $union.big_(i = 0)^s O_i = cal(D)$, so $U^s$ annihilates $H_K^(*) \( cal(D) \, O_0 \)$.
    The exact sequence of this pair proves localization at $U$.
    Passing to the retract proves it on the original sublevel.
    The exact sequences for a pair of regular sublevels, and for the pair relative to $M$,
    give the corresponding assertions for pairs.
  The class $w$ is zero on each ambient local block, because that block is induced from the $chevron.l tau
    chevron.r$-pair of one orientation. It is therefore nilpotent on each finite-cut relative group by induction
    over the crossing exact sequences. The same argument applies to the fixed reflection groups and to crossing
    pairs. On these modules localization at $U$ is equivalent to localization at $v$:
    after inverting $v$, the factor $1 + w \/ v$ in $U = v^2 \( 1 + w \/ v \)$ is invertible; after inverting $U$,
    the element $\( v + w \) \/ U$ is an inverse for $v$.
  Apply the sign-line Gysin sequence of Proposition 25 to one orientation of a local block.
    The total ordinary rank bound and index support in Theorem 10 imply the claimed per-degree bound,
    vanishing below the index window, and that multiplication by $v$ is an isomorphism above it.
    The fixed local group has the product description in (8.1).
    Its root support is within a fixed distance of $I_(m \/ 2)$, and
  $ \| I_m - 2 I_(m \/ 2) \| lt.eq n . $
  Consequently both source and target have already stabilized above $I_m + A$, with a uniform enlarged $A$.
    The localized restriction isomorphism is then an actual isomorphism there:
    clear a power of $v$ and invert the intervening, already invertible multiplication maps.
    For an odd iterate the fixed block is empty, so its stabilized source is zero.
    Labelwise naturality follows from the common full/fixed lens in Theorem 10.
  Finally, the sign-line Gysin sequence from $K$ to $R$ and the finite total dimension of $B_(2 a)$ make
    multiplication by $v$ an isomorphism on the ambient relative group in all sufficiently high degrees.
    The fixed group has the same property by (8.1). The same clearing argument upgrades localization to actual
    restriction in high degrees at this cut. ◻
]

For a paired regular cut $\( 2 a \, a \)$, put

$ cal(V)_a = xor.big_l B_a^l \, wide A_J = H_K^J \( X_(2 a) \, M \) . $

Dropping the powers $v^(J - l)$ in (8.1) defines the normalized actual restriction $epsilon.alt_J : A_J arrow.r
  cal(V)_a$. Set

$ E_J = "im" epsilon.alt_J \, wide t_J = dim ker epsilon.alt_J . $

The image $E_J$ lies in labels at most $J$; it need not be graded by root label,
  and it need not equal the stabilized target. In these normalized coordinates,
  multiplication by $v$ leaves a vector unchanged, whereas multiplication by $w$ applies the root $w$ to each
  component and raises its label by one.

Let $P_j$ denote projection to root labels at most $j$. We record three defects:
  the dimension missing from the projected low root degrees,
  the dimension of actual-image vectors supported entirely above the cutoff,
  and the dimension of actual classes invisible on the fixed locus.
  They are, respectively, $D_(j \, q)$, $H_(j \, J)$, and $t_J$.
  The potential also includes the preceding-degree deficit $D_(j \, 2 j - 1)$;
  this compensates for the degree shift in the connecting homomorphism. Define

#[#set math.equation(numbering: n => "(8.2)")
 $ D_(j \, q) & = dim P_j cal(V)_a - dim P_j E_q \,\
H_(j \, J) & = dim \( E_J ∩ ker P_j \) \, wide J = 2 j \,\
Phi_j \( a \) & = D_(j \, 2 j) + D_(j \, 2 j - 1) + H_(j \, 2 j) + t_(2 j) \, wide j gt.eq 1 . $ <bud:potential>]

All four terms are nonnegative. Lemma 31 shows that they vanish for sufficiently large $j$ at any fixed cut.

#thm([Theorem 8.2.])[
  (Finite-cut defect bound).  #emph[There is a constant $C$ such that, whenever $2 a > 0$ is regular,
#[#set math.equation(numbering: n => "(8.3)")
 $ sum_(j gt.eq 1) Phi_j \( a \) lt.eq C \( 1 + a \) . $ <bud:linear-budget>]

]
] <thm:finite-cut-budget>

#proof[
  Grow the ambient cut through its critical events, using primes for the groups just after an event.
    Let $C^q$ be its actual local $K$-group and $cal(W)$ its total fixed root reflection group.
    The comparison maps fit into the following diagram, whose rows are exact:
  (8.4)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$A_(q - 1)$])
  content((1.53, 0), [$C^q$])
  content((2.994, 0), [$A'_q$])
  content((4.457, 0), [$A_q$])
  content((5.987, 0), [$C^(q + 1)$])
  content((0, -1.239), [$cal(V)$])
  content((1.53, -1.239), [$cal(W)$])
  content((2.994, -1.239), [$cal(V)'$])
  content((4.457, -1.239), [$cal(V)$])
  content((5.987, -1.239), [$cal(W) .$])
  line((0.6, 0), (1.062, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.4668, -0.6193), [#text(size: 0.73em)[$epsilon.alt_(q - 1)$]])
  line((1.998, 0), (2.46, 0), mark: (end: ">"))
  line((1.53, -0.2725), (1.53, -0.9661), mark: (end: ">"))
  content((1.159, -0.6193), [#text(size: 0.73em)[$lambda_q$]])
  line((3.528, 0), (3.989, 0), mark: (end: ">"))
  line((2.994, -0.2725), (2.994, -0.9661), mark: (end: ">"))
  content((2.575, -0.6193), [#text(size: 0.73em)[$epsilon.alt'_q$]])
  line((4.925, 0), (5.387, 0), mark: (end: ">"))
  line((4.457, -0.2725), (4.457, -0.9661), mark: (end: ">"))
  content((4.087, -0.6193), [#text(size: 0.73em)[$epsilon.alt_q$]])
  line((5.987, -0.2725), (5.987, -0.9661), mark: (end: ">"))
  content((6.454, -0.6193), [#text(size: 0.73em)[$lambda_(q + 1)$]])
  line((0.336, -1.239), (1.194, -1.239), mark: (end: ">"))
  content((0.7649, -1.465), [#text(size: 0.73em)[$delta$]])
  line((1.866, -1.239), (2.592, -1.239), mark: (end: ">"))
  content((2.229, -1.465), [#text(size: 0.73em)[$f$]])
  line((3.396, -1.239), (4.121, -1.239), mark: (end: ">"))
  content((3.758, -1.465), [#text(size: 0.73em)[$i$]])
  line((4.793, -1.239), (5.585, -1.239), mark: (end: ">"))
  content((5.189, -1.465), [#text(size: 0.73em)[$delta$]])
})
  The bottom row is the fixed exact sequence after inverting $v$ and normalizing powers consistently in
    neighboring degrees. Its maps $f \, i$ preserve root labels, and $delta$ raises a root label by one.
    In particular, the repeated terms denote the total graded groups in an exact sequence,
    not an assertion of ungraded periodicity.
  Fix $j gt.eq 1$ and put $J = 2 j$. Call this cutoff #emph[far] from the event if every participating iterate
    satisfies $\| I_m - 2 j \| > C_0$, for a sufficiently large fixed $C_0$. Lemma 31 and the index comparison then give
  #[#set math.equation(numbering: n => "(8.5)")
   $ cal(W)^j = cal(W)^(j + 1) = 0 \, wide lambda_(J - 1) \, lambda_J \,
     lambda_(J + 1) upright(" injective with image ") P_j cal(W) . $ <bud:far-local>]
  Indeed, the blocks below the window are already in their actual stable range and have all root labels below $j$;
    those above it have zero actual source in these three degrees and no low root labels.
  Write $P = P_j$, $L = P cal(V)$, $L' = P cal(V)'$, and
  $ A_0 = f \( P cal(W) \) \, wide r = "rank" \( delta \|_L \) \, wide r_q =
    "rank" \( delta \|_(P E_q) \) quad \( q = J - 1 \, J \) . $
  There is no connecting term across the projection edge, so low-label exactness gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ dim P cal(W) = dim A_0 + r \, wide dim L' - dim L = dim A_0 - r . $ <bud:low-dimensions>]
  We next justify the projected-image calculation, including mixed low and high components.
    For $z in E_q$, commutativity and (8.5) place $delta z$ in $P cal(W)$.
    Also $delta \( P z \)$ is low, since $cal(W)^(j + 1) = 0$,
    while $delta \( \( 1 - P \) z \)$ has labels greater than $j$. These disjoint label ranges imply
  $ delta \( \( 1 - P \) z \) = 0 \, wide delta z = delta \( P z \) . $
  Given $x in P E_q ∩ ker delta$, choose $z in E_q$ projecting to $x$ and an actual representative in $A_q$.
    Its actual connecting class restricts to zero. The target $lambda_(q + 1)$ is injective,
    so actual exactness lifts the representative to $A'_q$. Projecting its fixed restriction proves
  $ i \( P E'_q \) = P E_q ∩ ker delta . $
  The kernel of this map is exactly $A_0$: stable exactness gives the inclusion in $A_0$,
    and every element of $P cal(W)$ has an actual local lift. Therefore
  #[#set math.equation(numbering: n => "(8.7)")
   $ D'_(j \, q) - D_(j \, q) = - \( r - r_q \) \, wide q = J - 1 \, J . $ <bud:deficit-change>]
  The actual connecting ranks are precisely $r_q$, again by target injectivity. Hence
  $ dim A'_J - dim A_J = dim P cal(W) - r_(J - 1) - r_J . $
  Using $H_(j \, J) + t_J = dim A_J - dim P E_J$ and (8.6) gives
  $ \( H_(j \, J) + t_J \)' - \( H_(j \, J) + t_J \) = r - r_(J - 1) . $
  Together with (8.7), this proves the exact change
  #[#set math.equation(numbering: n => "(8.8)")
   $ Phi'_j - Phi_j = - \( r - r_J \) lt.eq 0 . $ <bud:far-change>]
  The preceding-degree deficit cancels the possible increase in the high-image and kernel terms.
    This is why all four terms were retained.
  For a cutoff which is not far, local restriction need not be injective.
    Nevertheless the change is uniformly bounded. Choose $M_0$ bounding $dim
    cal(W)$ and all the relevant actual local dimensions. Since $i$ preserves labels,
    $i \( P E'_q \) subset P E_q$. Its kernel has dimension at most $M_0$ by stable exactness.
    Its cokernel is bounded using the surjections
  $ A_q \/ "im" A'_q med arrow.r med E_q \/ i E'_q med arrow.r med P E_q \/ i \( P E'_q \) . $
  The first source has dimension at most $dim C^(q + 1) lt.eq M_0$. Thus $\| dim P E'_q - dim P E_q \| lt.eq M_0$.
    The same kernel and cokernel argument bounds $\| dim L' - dim L \|$ by $M_0$,
    and actual exactness bounds $\| dim A'_J - dim A_J \|$ by $M_0$. Since
  $ Phi_j = 2 dim L - 2 dim P E_J - dim P E_(J - 1) + dim A_J \, $
  we obtain $\| Phi'_j - Phi_j \| lt.eq 6 M_0$.
  Each prime contributes at most one iterate to a given positive event.
    The finite prime list therefore bounds the number of participating blocks,
    and only a bounded number of integers $j$ lie in their fixed index windows.
    Thus every event increases the sum of the potentials by at most a fixed constant.
    The number of events below $2 a$ is at most $sum_i floor.l 2 a \/ ell_i floor.r$.
    The potentials start at zero below the first positive event and are unchanged on no-critical strips.
    Their finite support at each cut permits summation of (8.8) and the exceptional bounds, proving (8.3). ◻
]

The estimate controls all degree cutoffs at once. In the next section,
  a single persistent extra reflection class will produce quadratically many units of this linear budget.
  Degree zero, which is not included in (8.2), will be bounded separately by ordinary death.

== 9 A uniform bound for transient reflection classes <sec:transients>

We now bound the total dimension of reflection-equivariant classes at a finite cut modulo those coming from the
  full loop space. Ordinary death forces such a class, away from finitely many index bands,
  to propagate through a long string of powers of $w$. The finite-cut budget rules out that string.
  Bounds in the remaining degrees then give a bound on the total dimension.

Throughout this section $n gt.eq 3$, $d = n - 1$, and we assume that there are only finitely many prime
  closed-geodesic images. Let $ell_i > 0$ and $Delta_i gt.eq 0$ be their prime lengths and mean indices,
  as in Theorem 10; thus

#[#set math.equation(numbering: n => "(9.1)")
 $ \| I_(i \, m) - m Delta_i \| lt.eq n \, wide beta_i = Delta_i \/ ell_i . $ <trans:index-slope>]

For every positive regular cut $a$, retain

$ B_a^j = H_R^j \( X_a \, M \) \, wide B_oo^j = H_R^j \( Lambda \, M \) \,\
Q_a^j = "coker" \( B_oo^j arrow.r B_a^j \) \, wide T \( a \) = sum_(j gt.eq 0) dim Q_a^j . $

All coefficients are $bb(F)_2$. The local crossing bounds imply that $xor.big_j
  B_a^j$ is finite-dimensional at each such cut.

#thm([Theorem 9.1.])[
  (Bounded total transients).  #emph[Under the finite-prime-image assumption, there is a constant $C$,
    independent of the positive regular cut $a$, such that
#[#set math.equation(numbering: n => "(9.2)")
 $ T \( a \) lt.eq C . $ <trans:total-bound>]

]
] <thm:bounded-transients>

We use four previously established inputs. Theorem 24 provides a single filling increment $D$ in ordinary homology
  relative to $M$, independent of both degree and cut. Theorem 10 bounds local ranks and their index supports.
  Theorem 26 gives $w^n B_oo = 0$. Finally, Theorem 32 controls the discrepancy between actual ambient degree and
  root degree. The ordinary rank and resonance statements used below are those of Proposition 18;
  write $alpha > 0$ for its resonance slope. Constants in this section may depend on the metric, $n$,
  and the finite list of prime images, but never on $a$ or $j$.

=== 9.1 Degree gaps and multiplication by $w$ <degree-gaps-and-multiplication-by-w>

Let

$ cal(S) = { 0 \, alpha \, beta_i : upright("prime labels ") i } = { s_0 < s_1 < dots.h.c < s_N } $

be the list of distinct slopes. Thus $s_0 = 0$ and $N gt.eq 1$.
  For a fixed margin $c > 0$ and consecutive slopes $s < s'$, define the integer degree gap

$ cal(I)_(s \, s') \( a \) = { j in bb(Z)_(gt.eq 0) : s a + c < j < s' a - c } . $

Since $alpha$ is among the slopes, each gap lies entirely below or entirely above $alpha a$.
  We call these gaps present and absent, respectively.

#thm([Lemma 9.2.])[
  (Comparison on degree gaps).  #emph[There is a fixed margin $c$ such that,
    for every positive regular $a$ and every consecutive pair $s < s'$ in $cal(S)$, the following statements hold.]
  + #emph[In a present gap, $B_oo^j arrow.r B_a^j$ is injective for every $j in cal(I)_(s \, s') \( a \)$.]
  + #emph[In an absent gap, $B_oo^j arrow.r B_a^j$ is zero for every $j in cal(I)_(s \, s') \( a \)$.]
  + #emph[Whenever $j \, j + 1 in cal(I)_(s \, s') \( a \)$,
    multiplication by $w$ induces an isomorphism $Q_a^j arrow.r Q_a^(j + 1)$.]
  #emph[Moreover $B_a^j = 0$ for $j > s_N a + c$.]
] <trans:degree-gaps>

#proof[
  We first prove the ordinary comparison away from fixed-width bands.
    Choose a regular endpoint $a_(+) in \( a + D \, a + D + 1 \)$.
    A local group at an event $m ell_i in \[ a \, a_(+) \]$ can contribute in degree $j$ or its neighboring
    degrees only if
  $ \| j - I_(i \, m) \| lt.eq C_(upright("loc")) . $
  By (9.1), this implies
  #[#set math.equation(numbering: n => "(9.3)")
   $ \| j - beta_i a \| lt.eq C_(upright("loc")) + n + beta_i \( D + 1 \) . $ <trans:horizon-band>]
  The right-hand side is bounded uniformly over the finite prime list.
    Thus, outside fixed-width bands about the $beta_i a$, the ordinary map
  $ H_j \( X_a \, M \) arrow.r H_j \( X_(a_(+)) \, M \) $
  is injective, by the crossing exact sequences. A class in its source that is zero globally is already zero in
    $X_(a + D)$ by Theorem 24. Injectivity therefore makes the map $H_j \( X_a \, M \) arrow.r
    H_j \( Lambda \, M \)$ injective. Field duality gives surjectivity of ordinary cohomology restriction.
  In degrees above a fixed low threshold, the ordinary groups relative to $M$ identify with the absolute groups,
    by the evaluation retraction and the cohomology of the constant sphere.
    In these degrees Proposition 18 gives global rank at most one.
    Its resonance estimate implies that every nonzero global class restricts nontrivially to $X_a$ when $j < alpha
    a - c_0$, and restricts to zero when $j > alpha a + c_0$, for a fixed $c_0$.
    Together with the preceding surjectivity, this proves
  #[#set math.equation(numbering: n => "(9.4)")
   $
     cases(delim: "{", H^j \( Lambda \, M \) arrow.r H^j \( X_a \, M \) upright(" is an isomorphism") \, & j <
     alpha a - c_0 \,, H^j \( X_a \, M \) = 0 \, & j > alpha a + c_0 \,) $ <trans:ordinary-gaps>]
  provided $j$ also lies outside the fixed low-degree interval and the bands in (9.3).
    When the global group is zero, surjectivity gives the first assertion as an isomorphism between zero groups.
    Increase $c_0$ to absorb all these restrictions.
  Consider a present gap and put $P_a^j = H_R^j \( Lambda \, X_a \)$ for this proof.
    Ordinary triple exactness and (9.4) give $H^j \( Lambda \, X_a \) =
    0$ whenever the needed two neighboring ordinary restrictions are isomorphisms.
    The sign-line Gysin sequence of Proposition 25 consequently makes $w : P_a^j arrow.r
    P_a^(j + 1)$ an isomorphism in the corresponding interior.
    After allowing $n$ further degrees below, every element of $P_a^j$ is divisible by $w^n$ there.
    Its image in $B_oo^j$ is zero, since $w^n B_oo = 0$. Applying this at $j$ and $j +
    1$ to the triple $\( Lambda \, X_a \, M \)$ gives a natural short exact sequence
  #[#set math.equation(numbering: n => "(9.5)")
   $ 0 arrow.r B_oo^j arrow.r B_a^j arrow.r P_a^(j + 1) arrow.r 0 . $ <trans:present-sequence>]
  The quotient identification commutes with $w$. It gives both the claimed injection and the isomorphisms on $Q_a$
    in a present gap.
  In an absent gap, (9.4) and sign Gysin make $w : B_a^j arrow.r B_a^(j + 1)$ an isomorphism in the interior.
    Allowing $n$ further degrees above makes $w^n$ injective there.
    The image of $B_oo^j$ is killed by that power, so it is zero.
    Hence $Q_a^j = B_a^j$ and the claimed isomorphisms also hold in an absent gap.
  Choose the margin $c$ larger than $c_0 + 2 n + 6$ and the fixed low-degree threshold.
    Then all neighboring degrees and all powers just used lie in the required untrimmed ordinary ranges whenever
    the statements of the lemma apply. This is one fixed choice for all cuts and gaps.
    Finally, any reflection local contribution below cut $a$ has
  $ j lt.eq I_(i \, m) + C_(upright("loc")) lt.eq beta_i a + n + C_(upright("loc")) wide \( m ell_i < a \) . $
  The relative groups start at zero below the first event. The local crossing sequences therefore give $B_a^j =
    0$ above $s_N a + c$, after one final increase of $c$. ◻
]

=== 9.2 The finite-cut budget excludes long strings <the-finite-cut-budget-excludes-long-strings>

#thm([Lemma 9.3.])[
  (No transients inside a long degree gap).  #emph[For all sufficiently large regular cuts $a$ with $2 a$ regular,
    $Q_a^j = 0$ on every gap $cal(I)_(s \, s') \( a \)$ of Lemma 34.]
] <trans:no-interior>

#proof[
  Fix consecutive slopes $s < s'$ and write
  $ A = s a \, wide r = \( s' - s \) a . $
  There is a fixed $delta > 0$ such that $r gt.eq delta a$ for every such gap,
    since the list of distinct slopes is finite. Suppose that some $Q_a^j$ in this gap is nonzero.
    The isomorphisms in Lemma 34 make it nonzero throughout the integer gap. For large $a$, choose
  $ l_0 = ceil.l A + 0.10 r ceil.r $
  and a class $y_(l_0) in B_a^(l_0)$ with nonzero image in $Q_a^(l_0)$.
    Set $y_l = w^(l - l_0) y_(l_0)$ through $l lt.eq floor.l A + 0.90 r floor.r$.
    Every resulting quotient class is nonzero. In particular, with
  $ cal(L) = bb(Z) ∩ \[ A + 0.15 r \, A + 0.20 r \] \, wide q = floor.l 0.50 r floor.r \, $
  the classes $y_l$, $l in cal(L)$, are independent in $xor.big_j B_a^j$, as are their powers $w^q y_l$.
    Indeed they occupy distinct root degrees, and their quotient classes remain nonzero between degrees $A +
    0.65 r - O \( 1 \)$ and $A + 0.70 r$. Figure 2 displays the intervals used below.
  At the ambient cut $2 a$, let $E_J$ and $P_k$ be the actual normalized restriction image and root-degree
    projection from Theorem 32. Recall its nonnegative terms
  $ D_(k \, J) = dim P_k #scale(x: 180%, y: 180%)[\(] xor.big_l B_a^l #scale(x: 180%, y: 180%)[\)] -
    dim P_k E_J \, wide H_(k \, J) = dim \( E_J ∩ ker P_k \) . $
  In particular that theorem gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ sum_(k gt.eq 1) #scale(x: 120%, y: 120%)[\(] D_(k \, 2 k) + H_(k \, 2 k) #scale(x: 120%, y: 120%)[\)] lt.eq
     C \( 1 + a \) . $ <trans:used-budget>]
  Average $D_(k \, 2 k)$ over the integers $k in \[ A + 0.30 r \, A + 0.35 r \]$.
    There are a fixed positive multiple of $r$ such integers for large $r$,
    so some $k$ satisfies $D_(k \, 2 k) lt.eq C_1$, independently of $a$, because $r gt.eq delta a$. The space
  $ W_0 = "span" { y_l : l in cal(L) } $
  lies in the root degrees at most $k$. Thus
  $ dim \( W_0 ∩ P_k E_(2 k) \) gt.eq dim W_0 - D_(k \, 2 k) gt.eq c_1 r $
  for a fixed $c_1 > 0$ and sufficiently large $r$.
  Choose a basis $z_1 \, dots.h \, z_nu$ of this intersection and actual ambient lifts
  $ u_mu in H_K^(2 k) \( X_(2 a) \, M \) . $
  The normalized fixed restriction of $u_mu$ has the form $z_mu + c_mu$,
    where every root label in $c_mu$ is greater than $k$. Multiply the actual classes by $w^q$.
    The selected terms $w^q z_mu$ remain independent, since $w^q$ is injective on $W_0$.
    Their labels are at most $A + 0.70 r$, whereas the other terms have labels greater than
  $ k + q gt.eq A + 0.80 r - 1 $
  or vanish. The latter terms cannot cancel any of the selected ones.
    Moreover all labels of these normalized images exceed $A + 0.64 r$ for sufficiently large $r$.
  For any integer $k' in \[ A + 0.61 r \, A + 0.64 r \]$, there is enough actual degree to multiply further by a
    nonnegative power of $v$, since
  #[#set math.equation(numbering: n => "(9.7)")
   $ 2 k + q lt.eq 2 A + 1.20 r < 2 A + 1.22 r lt.eq 2 k' . $ <trans:degree-room>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, -0.468), (11.07, -0.468), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b9b9b9"))))
  line((0, -0.5184), (0, -0.4176), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((0, -0.6242), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((2.7, -0.5184), (2.7, -0.4176), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((2.7, -0.6242), [#text(size: 9pt)[$.25$]], anchor: "north", padding: 0.1176cm)
  line((5.4, -0.5184), (5.4, -0.4176), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((5.4, -0.6242), [#text(size: 9pt)[$.50$]], anchor: "north", padding: 0.1176cm)
  line((8.1, -0.5184), (8.1, -0.4176), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((8.1, -0.6242), [#text(size: 9pt)[$.75$]], anchor: "north", padding: 0.1176cm)
  line((10.8, -0.5184), (10.8, -0.4176), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  content((10.8, -0.6242), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((5.4, -1.224), [#text(size: 9pt)[normalized root degree $(l-A)"/"r$]], anchor: "north", padding: 0.1176cm)
  content((-0.2469, 2.592), [#text(size: 9pt)[selected classes#linebreak()in $W_0$]], anchor: "east", padding: 0.1176cm)
  line((1.62, 2.592), (2.16, 2.592), stroke: (paint: rgb("#0000a6"), thickness: 4.0pt, miter-limit: 10))
  content((1.89, 2.733), [#text(size: 9pt)[$[.15,.20]$]], anchor: "south", padding: 0.1176cm)
  content((-0.2469, 1.8), [#text(size: 9pt)[first cutoff#linebreak()$k$]], anchor: "east", padding: 0.1176cm)
  line((3.24, 1.8), (3.78, 1.8), stroke: (thickness: 4.0pt, miter-limit: 10))
  content((3.51, 1.941), [#text(size: 9pt)[$[.30,.35]$]], anchor: "south", padding: 0.1176cm)
  content((-0.2469, 1.008), [#text(size: 9pt)[later cutoffs#linebreak()$k'$]], anchor: "east", padding: 0.1176cm)
  line((6.588, 1.008), (6.912, 1.008), stroke: (thickness: 4.0pt, miter-limit: 10))
  content((6.75, 1.149), [#text(size: 9pt)[$[.61,.64]$]], anchor: "south", padding: 0.1176cm)
  content((-0.2469, 0.216), [#text(size: 9pt)[lifted images#linebreak()after $w^q$]], anchor: "east", padding: 0.1176cm)
  line((7.02, 0.216), (7.56, 0.216), stroke: (paint: rgb("#0000a6"), thickness: 4.0pt, miter-limit: 10))
  content((7.29, 0.3571), [#text(size: 9pt)[$[.65,.70]$]], anchor: "south", padding: 0.1176cm)
  line((8.694, 0.216), (10.58, 0.216), stroke: (paint: rgb("#808080"), thickness: 3.0pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((9.666, 0.3571), [#text(fill: rgb("#666666"))[#text(size: 9pt)[possible tail $>.80$]]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 2: The degree intervals in Lemma 35, normalized by the gap width $r$; the drawing suppresses rounding errors of order $r^(- 1)$. Multiplication by $w^q$, with $q \/ r approx .50$, moves the selected root degrees above every later cutoff $k'$ while keeping them separate from the other terms. Multiplication by $v$ then raises actual degree without changing root labels; the inequality $2 k + q < 2 k'$ provides the required degree room. ],
  ) <fig:degree-gap>
  The classes
  $ v^(thin 2 k' - \( 2 k + q \)) w^q u_mu in H_K^(2 k') \( X_(2 a) \, M \) $
  have unchanged normalized fixed images: multiplication by $v$ changes the actual degree and leaves the root
    coefficients unchanged. Multiplication by $w$ raises each root label by one, as used above.
    Thus the images are independent and lie entirely above root cutoff $k'$, proving
  $ H_(k' \, 2 k') gt.eq c_1 r quad upright("for every integer ") k' in \[ A + 0.61 r \, A + 0.64 r \] . $
  There are at least $c_2 r$ such cutoffs for large $r$. The left side of (9.6) is therefore at least $c_1 c_2 r^2
    gt.eq c_1 c_2 delta^2 a^2$, contradicting its linear upper bound.
    This proves the assertion for the chosen gap. The finite number of gaps allows one common lower threshold for $a$. ◻
]

=== 9.3 Bounding the remaining degrees <bounding-the-remaining-degrees>

#proof[
  First let $a$ be large with $2 a$ regular. By Lemma 35, transient classes can occur only within distance $c$ of
    one of the finitely many degrees $s_i a$. Lemma 34 excludes degrees above the last such band.
    Thus only a bounded number of integer degrees can contribute. We now bound the dimension in each of them uniformly.
  For high degrees, the reflection local ranks of Theorem 10 give
  #[#set math.equation(numbering: n => "(9.8)")
   $ dim B_a^j lt.eq C sum_i \# { m gt.eq 1 : m ell_i < a \, med \| j - m Delta_i \| lt.eq C_(upright("loc")) +
     n } . $ <trans:high-ranks>]
  This follows by summing the crossing exact-sequence bounds,
    starting with the zero relative group below the first event.
    If $Delta_i > 0$, the number in braces is bounded by $1 + 2 \( C_(upright("loc")) + n \) \/ Delta_i$,
    up to an integer rounding constant. If $Delta_i = 0$, it is zero once $j > C_(upright("loc")) + n$.
    The finite prime list therefore gives a uniform bound on $dim B_a^j$ in every sufficiently high degree.
  The fixed low-degree interval needs a different argument, which also accounts for all zero-mean-index iterates.
    Choose a regular $a_(+) in \( a + D \, a + D + 1 \)$. By ordinary death,
  #[#set math.equation(numbering: n => "(9.9)")
   $ ker #scale(x: 120%, y: 120%)[\(] H_j \( X_a \, M \) arrow.r
     H_j \( Lambda \, M \) #scale(x: 120%, y: 120%)[\)] = ker #scale(x: 120%, y: 120%)[\(] H_j \( X_a \, M \)
     arrow.r H_j \( X_(a_(+)) \, M \) #scale(x: 120%, y: 120%)[\)] . $ <trans:kernel-window>]
  The kernel on the right is bounded in dimension by the sum of local ordinary ranks in this interval of cut
    values of width at most $D + 1$. The number of its events is at most
  $ sum_i (2 + frac(D + 1, ell_i)) \, $
  independently of $a$. Uniform local ranks bound the kernel,
    and the global-image rank is bounded by the fixed global degree rank.
    Consequently $dim H^j \( X_a \, M \)$ is bounded uniformly in $a$ for each fixed low degree $j$.
  The sign-line Gysin sequence gives
  $ dim B_a^j lt.eq dim B_a^(j - 1) + dim H^j \( X_a \, M \) \, wide B_a^(- 1) = 0 . $
  Induction, including degree zero, bounds $B_a^j$ uniformly throughout any fixed low-degree interval.
    Combining this with (9.8), every degree in the finitely many remaining bands has uniformly bounded dimension.
    Since the number of such degrees is also bounded, their sum bounds $T \( a \)$ as asserted.
  Cuts $a$ in a bounded interval have only finitely many crossing stages, so they satisfy a common bound as well.
    Finally, if $a$ is regular but $2 a$ is not, choose a nearby $a'$ in the same no-critical interval such that
    $2 a'$ is regular. The critical values and their halves are locally finite.
    The no-critical restriction isomorphism between the root sublevels is natural with respect to global
    restriction, and hence preserves both $B_a$ and its global image. In particular $T \( a \) = T \( a' \)$.
    This proves (9.2) for every positive regular cut. ◻
]

We have bounded the total excess dimension at each regular cut without assuming monotonicity as the cut varies.
  The next section proves monotonicity under doubling. Together,
  these statements will force an interval of maximal transient dimension on which the activation of a new global
  class is incompatible with the local evaluation-cup relation.

== 10 Doubling and the first activation <sec:activation>

Theorem 33 bounds the total number of reflection classes which do not come from the whole loop space.
  We now compare that number at a cut and its double. Equality in this comparison will require each visible
  odd-stage bottom class to have a visible evaluation-cup partner.
  At the first appearance of such a bottom, local evaluation vanishing prevents its partner from appearing.
  This gives the final contradiction.

Retain the finite-prime assumption and write

$ V \( a \) = sum_j "rank" \( B_oo^j arrow.r B_a^j \) \, wide T \( a \) = sum_j dim B_a^j - V \( a \) . $

Both sums are finite at a regular cut. We first record the full-group rank calculation that makes the doubling
  comparison exact.

#thm([Lemma 10.1.])[
  (Free rank and torsion at a finite cut).  #emph[Suppose that $2 L > 0$ is regular, and put $H =
    xor.big_j H_G^j \( X_(2 L) \, M \)$. This is a finitely generated graded $bb(F)_2 \[ U \]$-module.
    Its torsion submodule $cal(T)$ is finite-dimensional and annihilated by a power of $U$. If
$ t = dim \( cal(T) \/ U cal(T) \) = dim ker \( U \|_H \) \, wide rho = "rank"_(bb(F)_2 \[ U \]) \( H \/ cal(T) \) \, $

 then
#[#set math.equation(numbering: n => "(10.1)")
 $ sum_j dim B_(2 L)^j = rho + 2 t \, wide rho = sum_j dim B_L^j . $ <act:total-rank>]

]
] <act:module-rank>

#proof[
  The standard-plane Gysin sequence in Proposition 25 embeds $H \/ U H$ into $xor.big_j B_(2 L)^j$,
    which has finite dimension. Lift a finite homogeneous basis of $H \/ U H$. These lifts generate $H$:
    subtract their contributions modulo $U$, divide the remainder by $U$, and induct down the nonnegative degree.
    This is an induction decreasing degree by two at each step.
  If a polynomial $p \( U \)$ has nonzero constant term, it acts injectively on $H$.
    Indeed, the lowest nonzero homogeneous component of a nonzero element survives in its product with
    $p \( U \)$. Factoring an annihilating polynomial as $U^s
    p \( U \)$ therefore shows that every torsion element is killed by a power of $U$.
    The ring $bb(F)_2 \[ U \]$ is Noetherian, so $cal(T)$ has finitely many generators and is killed by one common
    power of $U$. It is consequently finite-dimensional. Rank-nullity on $cal(T)$ gives
  $ dim ker \( U \|_H \) = dim ker \( U \|_(cal(T)) \) = dim \( cal(T) \/ U cal(T) \) . $
  Moreover $U H ∩ cal(T) = U cal(T)$, since $U h$ torsion implies that $h$ is torsion.
  Set $cal(F) = H \/ cal(T)$. Multiplication by $U$ is injective on $cal(F)$.
    Lift a homogeneous basis of $cal(F) \/ U cal(F)$. Degree induction again proves generation.
    These lifts are free: in a homogeneous relation cancel the least power of $U$ and reduce modulo $U$.
    Independence of the selected basis excludes the terms with that least power, a contradiction.
    Thus $cal(F)$ has a homogeneous free basis of size $rho$, and
  $ dim \( H \/ U H \) = rho + t . $
  Summing the standard-plane Gysin sequence over degrees gives the first identity in (10.1),
    since its two contributions are $H \/ U H$ and a shifted copy of $ker U$.
  For sufficiently large $D$, the torsion no longer contributes in degrees $D \, D - 1$.
    The dimensions of those two free degrees add to $rho$, one contribution from each free generator according to
    parity. The weight-two-plane Gysin sequence gives
  $ rho = dim H_G^D \( X_(2 L) \, M \) + dim H_G^(D - 1) \( X_(2 L) \, M \) = dim H_K^D \( X_(2 L) \, M \) . $
  By Lemma 31 and (8.1), the last dimension equals $sum_j dim B_L^j$ in high degree.
    This proves the second identity without requiring surjectivity of full-group restriction to the fixed locus. ◻
]

Use the global basis from Theorem 26:

$ xi_(m \, k) = w^k X_m \, wide eta_(m \, k) = e xi_(m \, k) \, wide m gt.eq 1 \, quad 0 lt.eq k lt.eq d . $

At a regular cut $a$, let $b_(m \, k) \( a \)$ be one if $xi_(m \, k)$ restricts nontrivially and zero otherwise.
  Let $h_(m \, k) \( a \)$ be one if the restriction of $eta_(m \, k)$ is independent modulo all bottom
  restrictions in its degree, and zero otherwise. Degrees within the bottom family are distinct,
  as are degrees within the top family: their consecutive starting degrees differ by $2 d$,
  while each family at a stage spans an interval of width $d$. Therefore

#[#set math.equation(numbering: n => "(10.2)")
 $ V \( a \) = sum_(m \, k) #scale(x: 120%, y: 120%)[\(] b_(m \, k) \( a \) +
   h_(m \, k) \( a \) #scale(x: 120%, y: 120%)[\)] \, wide h_(m \, k) \( a \) lt.eq
   b_(m \, k) \( a \) . $ <act:visibility-count>]

The inequality follows from $eta_(m \, k) = e xi_(m \, k)$.
  Write $V_o \( a \)$ and $V_e \( a \)$ for the contributions of odd and even stages $m$ to this sum.
  Stage parity here refers to the round-filtration label $m$.

#thm([Theorem 10.2.])[
  (Doubling and its equality condition).  #emph[For every regular $2 L > 0$,
#[#set math.equation(numbering: n => "(10.3)")
 $ T \( 2 L \) gt.eq T \( L \) . $ <act:doubling>]

 If equality holds, then
#[#set math.equation(numbering: n => "(10.4)")
 $ h_(m \, k) \( 2 L \) = b_(m \, k) \( 2 L \) wide \( m med upright("odd") \, med 0 lt.eq k lt.eq d \) .
   $ <act:odd-equality>]

]
] <thm:doubling>

#proof[
  Use the notation of Lemma 36, and put
  $ N = sum_(m med upright("odd") \, k) b_(m \, k) \( 2 L \) . $
  The selected odd bottoms have global $G$-equivariant $U$-torsion lifts by Theorem 26.
    Their restrictions to $H \/ U H$ are independent, since that quotient injects into reflection cohomology and
    their bottom restrictions are independent. They thus occupy an $N$-dimensional subspace of $cal(T) \/ U
    cal(T)$. Write
  #[#set math.equation(numbering: n => "(10.5)")
   $ t = N + J_0 \, wide J_0 gt.eq 0 . $ <act:residual-torsion>]
  The selected even bottoms and tops also have global full-group lifts.
    Their classes modulo $U$ are jointly independent with the selected odd bottoms:
    this follows from their reflection restrictions and the rule that a top is counted only modulo all bottoms in
    its degree. In the projection
  $ H \/ U H arrow.r cal(F) \/ U cal(F) \, $
  the kernel is $cal(T) \/ U cal(T)$, of dimension $N + J_0$.
    The odd span already occupies $N$ of these dimensions. Hence the image of the even span has dimension at least
    $V_e \( 2 L \) - J_0$.
  Choose a maximal homogeneous independent family among these even projections;
    its size is at least $V_e \( 2 L \) - J_0$. Multiply the corresponding global lifts by powers of $U$ to put
    them in two common large degrees $D \, D - 1$, according to parity. Independence persists in $cal(F)$:
    from a relation in one of the common degrees, cancel the least power of $U$ and reduce modulo $U$,
    then repeat if necessary. Thus the sum of the ambient full-group global-image ranks in these two degrees is at
    least $V_e \( 2 L \) - J_0$.
  We compare these images with the fixed locus, including the image-level Gysin maps.
    The subspace $X_(2 L)^tau$ is $G$-invariant. Under its identification with $X_L$,
    rotations act with doubled parameter and reflection acts as before. In sufficiently high degree the map
  $ H_G^q \( X_(2 L) \, M \) arrow.r H_G^q \( X_(2 L)^tau \, M \) $
  is injective. Indeed, compose it with the injective fixed $G$-to-$K$ restriction.
    The same composite factors through the ambient $G$-to-$K$ injection and the high actual $K$ restriction
    isomorphism of Lemma 31.
  For $H' = G \, K$, set
  $ I_(H')^q = "im" #scale(x: 120%, y: 120%)[\[] H_(H')^q \( Lambda^tau \, M \) arrow.r
    H_(H')^q \( X_(2 L)^tau \, M \) #scale(x: 120%, y: 120%)[\]] . $
  Naturality places the ambient global images inside these fixed global images.
    Apply the weight-two-plane Gysin sequence to the fixed global and fixed finite pairs.
    Its global push is surjective, so on images the finite push gives a surjection
  $ pi : I_K^D arrow.r I_G^(D - 1) . $
  The finite $G$-to-$K$ injection identifies $I_G^D$ with a subspace of $ker pi$. Consequently
  $ dim I_G^D + dim I_G^(D - 1) lt.eq dim I_K^D . $
  On the fixed $K$-spaces the global restriction is the coefficientwise map $B_oo \[ v \] arrow.r B_L \[ v \]$.
    Since $B_L$ has finite total dimension, $dim I_K^D = V \( L \)$ for sufficiently large $D$.
    Choose $D$ large enough for all the preceding comparisons. We have proved
  #[#set math.equation(numbering: n => "(10.6)")
   $ V \( L \) gt.eq V_e \( 2 L \) - J_0 . $ <act:image-inequality>]
  Subtract global-image dimensions from (10.1) and use (10.5)–(10.6):
  $ T \( 2 L \) - T \( L \) & = 2 \( N + J_0 \) - V_o \( 2 L \) - V_e \( 2 L \) + V \( L \)\
 & gt.eq J_0 + 2 N - V_o \( 2 L \)\
 & = J_0 + sum_(m med upright("odd") \, k) #scale(x: 120%, y: 120%)[\(] b_(m \, k) \( 2 L \) -
   h_(m \, k) \( 2 L \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  All summands in the final line are nonnegative. Equality therefore forces (10.4) for each individual odd bottom. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1 for $n gt.eq 3$.] Suppose that there are only finitely many prime
    geodesic images. By Theorem 33, $T$ is a bounded nonnegative integer on regular positive cuts.
    It is constant on every no-critical interval, so its maximum is attained on a nonempty bounded open regular
    interval $I subset \( 0 \, oo \)$.
  Every regular point $x in 2^k I$ has regular successive halves:
    a critical half would double to a critical point. Iterating (10.3) therefore gives $T \( x \) gt.eq
    T \( x \/ 2^k \)$, which is already the global maximum. Thus every regular point in every expanded interval
    attains that maximum. For $k gt.eq 1$, equality holds between $x$ and $x \/ 2$,
    so (10.4) holds at every such $x$. This uses monotonicity under doubling only;
    no monotonicity between arbitrary cuts is asserted.
  Take $k$ large and choose regular $x_1 < x_2$ in the lower and upper quarters of $2^k I$.
    The interval of degrees strictly between $alpha x_1$ and $alpha x_2$,
    after removing the fixed endpoint margins of Lemma 34, has length tending to infinity.
    Remove also the fixed-width bands about every $beta_i x_1$ and $beta_i x_2$.
    They remove a bounded total number of possible degrees. The odd bottom degrees
  $ a_m = \( 2 m - 1 \) d \, wide m med upright("odd") \, $
  form an arithmetic progression of spacing $4 d$. For sufficiently large $k$, one such degree $j = a_m$ remains,
    beyond the fixed low-degree range. Lemma 34 makes $xi_(m \, 0)$ invisible at $x_1$ and visible at $x_2$.
    At $x_1$ the degree lies in an absent gap, where the global image is zero, or above the last band,
    where the sublevel group is zero. At $x_2$ it lies in a present gap where global reflection restriction is
    injective.
  A global class nonzero at a smaller sublevel cannot become zero at a larger one,
    since restriction to the smaller sublevel factors through the larger.
    There are only finitely many events between $x_1$ and $x_2$.
    Choose the first event at which $xi_(m \, 0)$ becomes nonzero,
    and tight regular cuts $x_(-) < x_(+)$ around it, still inside $2^k I$.
    The exact sequence of the crossing puts its post-event restriction in the image of
  $ H_R^j \( X_(x_(+)) \, X_(x_(-)) \) arrow.r B_(x_(+))^j \, $
  because its pre-event restriction is zero. By Theorem 10,
    cup with $e$ vanishes on this whole reflection crossing, including simultaneous prime labels.
    Naturality of the cup action therefore gives
  $ eta_(m \, 0) \|_(X_(x_(+))) = e thin xi_(m \, 0) \|_(X_(x_(+))) = 0 . $
  Hence $b_(m \, 0) \( x_(+) \) = 1$ while $h_(m \, 0) \( x_(+) \) = 0$.
    Since $m$ is odd, this contradicts (10.4) at the regular point $x_(+)$ of the expanded interval.
    The finite-prime-image assumption is impossible. ◻
]

== 11 Finite spherical covers <sec:covers>

#proof[
  Let $pi : tilde(M) arrow.r M$ be a finite smooth covering of degree $r$,
    where $tilde(M)$ is diffeomorphic to $S^n$. Equip $tilde(M)$ with the pullback of the given metric.
    The map $pi$ is then a local isometry, so it sends every nonconstant closed geodesic upstairs to a nonconstant
    closed geodesic downstairs. Taking the least positive period of the latter does not change its image.
  We show that at most $r$ upstairs prime images project to any one downstairs prime image.
    Choose an oriented unit-speed representative $sigma : bb(R) arrow.r M$ of that image, of least period $L > 0$,
    and put $p = sigma \( 0 \)$. For each $q in pi^(- 1) \( p \)$ there is a unique lift of $sigma$ starting at
    $q$, with initial velocity $\( #h(-0.16667em) upright(d) pi_q \)^(- 1) dot(sigma) \( 0 \)$.
    Lifting one period permutes the finite fiber $pi^(- 1) \( p \)$;
    lifting the reversed path gives the inverse permutation. After $m lt.eq
    r$ periods a lift therefore returns to its initial point.
    Its velocity also returns, because the downstairs velocity returns and $#h(-0.16667em) upright(d)
    pi_q$ is invertible. The lift is a closed geodesic. If $m$ is the first return of that fiber point,
    its least period is $m L$: any period upstairs projects to a period of $sigma$ and hence is an integer
    multiple of $L$.
  By Lemma 7, unit-speed geodesics with the same image agree after a parameter shift and possibly reversal.
    Consequently any upstairs prime geodesic whose projected image is the chosen one can be parametrized so that
    its projection is exactly $sigma$. It is then one of the lifts starting at the $r$ points above $p$.
    This proves the finite-fiber bound. The argument permits self-intersections and does not require the covering
    to be regular; phase or reversal can only identify some of these finitely many images.
  Theorem 1 gives infinitely many upstairs prime images for the pullback metric.
    Since every downstairs prime image has at most $r$ preimages in this set,
    there are infinitely many downstairs prime images as well. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
