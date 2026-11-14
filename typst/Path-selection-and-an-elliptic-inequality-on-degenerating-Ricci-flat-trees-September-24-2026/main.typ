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

#align(center)[#text(size: 16pt, weight: "bold")[Path selection and an elliptic inequality \
on degenerating Ricci-flat trees]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Ricci-flat metrics can degenerate by developing regions at several widely separated length scales.
  In four dimensions, an asymptotically locally Euclidean end of one region can join a neighborhood of an orbifold
  point in another. Repeating this configuration produces a finite rooted tree.
  The geometry on every fixed vertex region may converge smoothly while ratios of scales tend to zero.
  An estimate useful in this situation must control the whole joined metric,
  including the regions between its limiting pieces.

We study a renormalized Einstein–Hilbert functional on such metrics.
  The leading Euclidean divergence in the scalar-curvature density is subtracted at the exterior end of the root.
  The resulting quantity, denoted by $E$, has length degree two.
  Its differential is the integral pairing with the Einstein tensor $1 / 2 R g - "Ric"$.
  A fixed root with decay $g - delta = O \( r^(- q) \)$, $q > 1$,
  makes the quadratic remainder and the first-variation pairing integrable.
  The individual scalar integral and boundary flux need not converge.

Renormalization of curvature energies on noncompact spaces has several established forms.
  Haslhofer’s renormalized Perelman functional treats relative energies near steady
  solitons #cite(label("Haslhofer2011")). Deruelle and Ozuch subtract the mass contribution in their analytic ALE
  functional and discuss explicitly the corresponding renormalized Hilbert–Einstein
  expression #cite(label("DeruelleOzuch2025")) Definition 4.2, Remark 4.3, and Proposition 4.4.
  Their weighted Łojasiewicz inequality near a fixed Ricci-flat ALE background holds without an integrability
  hypothesis; integrability gives an improved exponent #cite(label("DeruelleOzuch2025")) Theorem 1.3.
  The functional $E$ here is the unminimized scalar-curvature-minus-flux expression,
  whereas their $lambda_(upright("ALE"))$ also minimizes over a potential.
  Our estimate concerns simultaneous degeneration of the joining scales in a fixed tree,
  outside one fixed weighted neighborhood of a smooth ALE metric.

The main theorem, stated with the geometric hypotheses in Section 2,
  gives a strict improvement over the direct first-variation estimate.
  Let $M$ control ten scaled derivatives of the dimensionless Ricci tensor,
  with positive exponential decay on joining half-ends and decay $r^(- q)$ at the root.
  For a fixed limiting tree and sequences with $M arrow.r 0$ and all joining lengths tending to infinity,
  Theorem 2 proves $E = o \( M \)$. The metrics converge to the specified vertex metrics on compact sets,
  and their end bounds are uniform through order twenty. Kernels and cokernels of the linearized equations are
  retained in the argument.

This is a sequential statement for one fixed tree. Joining lengths may diverge at unrelated rates,
  and the proof does not require the infinitesimal Ricci-flat deformations to integrate to a smooth moduli space.
  These features are relevant to four-dimensional Ricci-flow concentration,
  where the tree is obtained only after choosing a sequence of times.
  For a compact four-dimensional Ricci flow on a finite time interval with bounded scalar curvature,
  a curvature blow-up that converges smoothly to an ancient flow has a Ricci-flat ALE limit
  #cite(label("BamlerZhangI")) arXiv version, Corollary 1.9.
  Related distance-control and compactness results appear in #cite(label("BamlerZhangII"))
  #cite(label("BamlerConvergence")). The present article proves the static estimate;
  its hypotheses are stated independently of a flow.

=== 1.1 Why an analytic path enters the proof <why-an-analytic-path-enters-the-proof>

On a fixed finite-dimensional analytic family, a gradient inequality relates a function to its differential near a
  critical set. The parameters here include neck lengths $L_e arrow.r oo$.
  Their boundary is outside an ordinary analytic coordinate neighborhood, and a change such as $t_e =
  e^(- L_e)$ need not make the family analytic at $t_e = 0$.
  Asymptotic power-logarithm expansions can exist to every finite order without defining a convergent power series.

Our substitute is a path-selection statement for a precise class of holomorphic functions.
  In each length these functions have expansions in $e^(- d L)$ with polynomial coefficients in $L$,
  where the nonnegative exponent sets are locally finite. The coefficients admit the same expansions in the other
  lengths. Remainders are strictly better than the requested exponential order,
  and all recursively extracted coefficients are holomorphic on a common ordinary-parameter neighborhood.
  These hypotheses are defined in Definition 3.

Theorem 4 realizes finite sign conditions and finite prescribed limits along a real analytic path.
  Every actual length coordinate and every bounded ordinary coordinate is eventually monotone or constant.
  Therefore the path has finite variation in the weighted differential form

$ sum_alpha \| d z_alpha \| + sum_e e^(- c L_e) \| d L_e \| \, wide c > 0 . $

This finite variation is the exact property used in the elliptic argument.
  The construction does not replace an all-order expansion by a convergent series.

Quasianalytic asymptotic algebras provide the ancestry of this approach.
  Speissegger #cite(label("SpeisseggerQA")) develops one-variable Ilyashenko algebras, and Galal, Kaiser,
  and Speissegger #cite(label("GalalKaiserSpeissegger")) construct algebras based on transserial asymptotic
  expansions. Their one-variable field and differentiation results provide precedents for the clock calculus used
  here. Our simultaneous length specialization, ordinary parameter normalization,
  and path selection are proved in Section 3; no multivariable selection theorem is imported from those works.

=== 1.2 The elliptic reduction and its quantitative output <the-elliptic-reduction-and-its-quantitative-output>

The analytic family is built in a gauge whose principal part is a componentwise scalar elliptic operator.
  The cancellation underlying this use of coordinates is part of the Ricci-coordinate method;
  see DeTurck and Kazdan #cite(label("DeTurckKazdan1981")) for its classical geometric setting.
  On each fixed vertex, finite core tests separate the kernel,
  while finitely many compactly supported sources represent the cokernel.
  On a joined edge, the two Cauchy matching conditions are supplemented by the value in the critical spherical
  channel. Explicit radial mode matrices then give an inverse whose bound is uniform as the lengths diverge.

This reduction has close predecessors in Einstein desingularization.
  Biquard constructs metrics modulo a finite-dimensional obstruction space in the Eguchi–Hanson gluing problem
  #cite(label("Biquard2011")) arXiv version, Proposition 8.1.
  Ozuch develops uniform inverse estimates and nearby Einstein-modulo-obstructions families for desingularization
  trees, including ALE orbifolds #cite(label("Ozuch2022II")) arXiv version, Proposition 11 and Theorem 4.6.
  The original development was also informed by Ozuch’s treatment of potentially nonintegrable Einstein
  deformations #cite(label("Ozuch2021Integrability")). This is methodological motivation,
  not an invocation of that paper’s results for the tree inequality proved here.
  Our proof retains that obstruction-space viewpoint. The additional interfaces needed here are continuation in
  complex length regions, recursive finite-order expansions with a common ordinary-parameter domain,
  and a differential estimate for the renormalized observable.

The ordinary parameters $z$ record these finite data. The length parameters are continued to quadratic complex
  regions. A uniform contraction there gives a small family $h_(*) \( L \, z \)$ and,
  for a metric $g$ in the theorem, the comparison

$ parallel g - h_(*) parallel lt.eq C M \, wide parallel "Ric" \( h_(*) \) parallel lt.eq C M \,
  wide \| E \( g \) - E \( h_(*) \) \| lt.eq C M^2 . $

The norms and the gauge are specified in Section 4. This comparison is why the finite-dimensional family is
  sufficient even though the original metrics depend on infinitely many variables.

Set $F = E \( h_(*) \)$. Let $J$ be the nonnegative squared Ricci norm defined in Equation (4.10),
  with an additional weight on the root tail. The first variation and the shrinking physical volumes of descendant
  regions imply

$ \| d F \| lt.eq C sqrt(J) (sum_alpha \| d z_alpha \| + sum_e e^(- c L_e) \| d L_e \|) . $

The remaining analytic obligation is to place $F$ and $J$ in the path-selection class.
  We establish this by opening one edge at a time. Solutions on an opened end have integer exponential tails.
  Finite incoming modes cancel the seam mismatch, and triangular linear auxiliary equations produce each
  additional asymptotic coefficient. Finite-part integration transfers the expansions to $F$ and $J$.
  Every order uses the same small nonlinear branch and the same basic inverse;
  coefficients with greater prescribed growth enter only linear solves.
  This preserves one ordinary-parameter domain through all orders.

If the tree inequality failed, the comparison would produce a sequence with $F eq.not 0$, $F arrow.r 0$,
  and $F^2 gt.eq c_0 J$ for some $c_0 > 0$. Path selection would preserve those conditions on a path of finite
  weighted variation. Dividing the differential estimate by $\| F \|$ would then give finite variation of $log \|
  F \|$, contradicting $F arrow.r 0$. Corollary 5 isolates this short final argument from the substantial analytic
  work needed to apply it.

=== 1.3 Organization and conventions <organization-and-conventions>

Section 2 defines the tree geometry, the Ricci error, and the functional and states the main theorem.
  Section 3 proves path selection. Section 4 constructs the inverses, gauge, analytic family,
  and comparison with the original sequence. Sections 5 and 6 prove the end and length expansions.
  Section 7 establishes the scalar expansion class and completes the theorem.

We use $Delta = "tr" nabla^2$. Metric and tensor components on a quotient end are equivariant Cartesian components
  on its Euclidean cover; all integrals are quotient integrals.
  Scaled derivative norms insert one local length factor per derivative.
  Tensor magnitudes are physical unless vertex units are explicitly specified.
  Constants may depend on the fixed tree, its charts, and a fixed finite differentiation order.
  Uniformity in diverging lengths or in an approximation index is asserted at the point where it is needed.

== 2 Tree geometry and the renormalized functional <sec:elliptic>

The result of this section is sequential. Its constants, its auxiliary analytic family,
  and its small exponents belong to one fixed limiting tree.
  No uniform exponent over different trees is asserted or needed.

=== 2.1 The geometric data and the functional <ell:setup>

Let $cal(T)$ be a finite rooted tree of four-dimensional Ricci-flat spaces $\( V_v \, h_v \)$.
  A vertex has one exterior end and one punctured end for each child.
  Every end has Cartesian coordinates on a Euclidean annulus modulo a finite subgroup of $O \( 4 \)$ acting freely
  on $S^3$. The group on a joined end is nontrivial. The two groups on an edge are identified;
  a fixed orthogonal identification is included in the charts.
  Put $tau = log r$ on an exterior end and $tau = - log r$ at a puncture. In these charts, in vertex units,

#[#set math.equation(numbering: n => "(2.1)")
 $ h_v = delta + O \( e^(- mu tau) \) $ <ell:end-decay>]

on joined ends, with derivatives at scale, for some $mu > 0$.
  On the unjoined exterior end of the root we require instead $h_v - delta = O \( r^(- q) \)$, where $q > 1$.
  All remaining parts are smooth compact manifolds with the indicated boundary collars.
  Bounds through order $20$ suffice in the data below.

For an edge $e$ from $p$ to $c$, truncate both end coordinates at $tau = L_e$ and identify the boundary collars by

#[#set math.equation(numbering: n => "(2.2)")
 $ x_p = e^(- 2 L_e) x_c \, wide a_c = a_p e^(- 2 L_e) \, wide a_(upright("root")) = 1 . $ <ell:scales>]

Thus the metric tensor in vertex units is multiplied by $a_v^2$ in physical units.
  The physical radius $rho = a_v r$ agrees in both charts, and $tau_p + tau_c = 2 L_e$.
  Gluing just the boundary faces, with their compatible smooth collars, gives the same manifold.
  Figure 1 records how the two logarithmic coordinates meet at one physical radius and how edge lengths determine
  descendant scales.

Consider a sequence of metrics $g$ for which every $L_e arrow.r oo$,
  which converges to $h_v$ on each compact subset of every open vertex.
  Assume the same end estimates as in Equation (2.1) on each joining half, and the stated root estimate,
  with uniform finite derivative bounds. On a compact core put $rho = a_v$. Suppose $M arrow.r 0$ and

#[#set math.equation(numbering: n => "(2.3)")
 $ \| rho^2 "Ric" \( g \) \|_j lt.eq
   C M
   cases(delim: "{", e^(- mu tau) \, & upright("on joined half-ends") \,, r^(- q) \, &
   upright("on the root exterior end") \,, 1 \, & upright("on vertex cores") \,) wide j = 10 . $ <eq:tree-ricci-error>]

Here the tensor magnitude is physical, and the subscript includes covariant derivatives multiplied by the
  corresponding powers of $rho$. The metric bounds convert these to coordinate estimates.
  Decreasing $mu$ or $q$, while retaining $mu > 0$ and $q > 1$, is allowed.

The subtraction below is the linear Euclidean boundary flux in the scalar-curvature density.
  Compare the mass-subtracted variational construction in #cite(label("DeruelleOzuch2025")) Remark 4.3 and
  Proposition 4.4. We give its normalization and first variation directly for the present finite-tree geometry.
  Define, in physical root units,

#[#set math.equation(numbering: n => "(2.4)")
 $ E \( g \) = lim_(D arrow.r oo) {integral_(r < D) R \( g \) thin d mu_g -
   integral_(r = D) \( partial_j g_(i j) - partial_i g_(j j) \) n_i thin d S_delta} . $ <eq:energy-functional>]

All chart integrals are quotient integrals. The two terms inside the braces need not converge separately.

#thm([Lemma 2.1.])[
  (Renormalization and first variation).  #emph[The functional in Equation (2.4) is defined on the preceding
    metrics. For a variation with the same root decay,
#[#set math.equation(numbering: n => "(2.5)")
 $ D E_g \( dot(g) \) = integral ⟨1 / 2 R \( g \) g - "Ric" \( g \) \, dot(g)⟩_g thin d mu_g . $ <ell:first-variation>]

 It is invariant under diffeomorphisms isotopic to the identity whose root displacement,
   including scaled derivatives throughout the isotopy, is $O \( r^(1 - q') \)$ for some $q' > 1$.
   A global length scaling by $s$, accompanied by a coordinate dilation at infinity restoring the leading tensor
   $delta$, multiplies $E$ by $s^2$. Under Equation (2.3), $\| E \( g \) \| lt.eq C M$.]
] <ell:functional>

#proof[
  Write $g = delta + p$ on the root end. The scalar-curvature density is
  $ R \( g \) sqrt(det g) = partial_i \( partial_j p_(i j) - partial_i p_(j j) \) +
    O \( \| p \| \| partial^2 p \| + \| partial p \|^2 \) . $
  The last expression is $O \( r^(- 2 q - 2) \)$ and its radial integral is bounded by $C integral_(r_0)^oo
    r^(1 - 2 q) thin d r$. This proves convergence. The linear boundary term in the variation of scalar curvature
    cancels the variation of the subtracted integral. Every remaining boundary product is $O \( D^(2 - 2 q) \)$;
    it tends to zero. Integration by parts therefore gives Equation (2.5).
    For a Lie derivative, the contracted Bianchi identity makes the interior divergence vanish.
    The remaining boundary term vanishes with the stated displacement decay.
    Integration along the isotopy gives invariance. Changing variables under a dilation in Equation (2.4) gives
    the scaling law.
  Differentiate this law at $s = 1$. Choose the compensating dilation to be the identity inside a fixed outer root
    region. Its metric variation equals $2 g$ on the interior and decays like $r^(- q)$ on the root tail.
    Its pairing with Ricci on the root is integrable by $q > 1$. On a punctured half the interior estimate costs
  $ C M a_p^2 integral_(tau_0)^(L_e) e^(- \( 2 + mu \) tau) thin d tau lt.eq C M a_p^2 . $
  On a child exterior half the corresponding quantity is
  $ C M a_c^2 integral_(tau_0)^(L_e) e^(\( 2 - mu \) tau) thin d tau lt.eq
    C M a_p^2 \( 1 + L_e \) e^(- min \( 2 + mu \, 4 \) L_e) \, $
  with a harmless change of constant for the fixed lower endpoint.
    The finite sum of core contributions is bounded as well, since $a_v lt.eq 1$.
    Equation (2.5) now gives $2 \| E \( g \) \| lt.eq C M$. In particular $E = 0$ when $"Ric" = 0$. ◻
]

#thm([Theorem 2.2.])[
  (Tree inequality).  #emph[Fix a finite rooted tree with the end identifications and order-$20$ metric bounds of
    Section 2.1. Let $\( g_j \, L^(\( j \)) \, M_j \)$ satisfy the compact vertex convergence,
    the same uniform half-end and root-end bounds, and Equation (2.3) through order $10$,
    with every $L_e^(\( j \)) arrow.r oo$ and $M_j arrow.r 0$. Then, in physical root units,
#[#set math.equation(numbering: n => "(2.6)")
 $ E \( g_j \) = o \( M_j \) . $ <ell:little-oh>]

 For an index with $M_j = 0$, the assertion means $E \( g_j \) = 0$.
   The little-oh is taken for this fixed tree; it does not assert a power exponent uniform over different trees.]
] <thm:tree-inequality>

The proof constructs a finite-dimensional analytic family with complex length parameters.
  It does not assume that Einstein deformations are unobstructed,
  or that the given metrics or the coefficients of a fixed core metric are spatially analytic.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (9.3, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 1.395), (9.3, 1.395), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((0, 0), (4.65, 1.395), fill: rgb("#ebebff"), stroke: none)
  rect((4.65, 0), (9.3, 1.395), fill: rgb("#ebf5eb"), stroke: none)
  rect((0, 0), (9.3, 1.395), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((4.65, -0.279), (4.65, 1.674), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((2.325, 0.7254), [#text(size: 9pt)[Parent punctured half]])
  content((6.975, 0.7254), [#text(size: 9pt)[Child exterior half]])
  line((0.744, -0.465), (4.185, -0.465), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.465, -0.465), [#text(size: 9pt)[$tau_p=- log r_p$]], anchor: "north", padding: 0.1176cm)
  line((8.556, -0.465), (5.115, -0.465), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.835, -0.465), [#text(size: 9pt)[$tau_c= log r_c$]], anchor: "north", padding: 0.1176cm)
  content((4.65, 1.674), [#text(size: 9pt)[Seam: $tau_p= tau_c=L_e$]], anchor: "south", padding: 0.1176cm)
  content((4.65, -1.097), [#text(size: 9pt)[$rho =a_"pr"_p=a_"cr"_c, a_c=a_"pe"^(-2L_e)$]], anchor: "north", padding: 0.1176cm)
  content((1.86, -2.79), [#text(size: 9pt)[$a_( upright(r) "oot")=1$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.65, -2.604), [#text(size: 9pt)[$a_c$]], frame: "circle", padding: 0.1058cm, fill: rgb("#ebf5eb"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.44, -2.139), [#text(size: 9pt)[$a_d$]], frame: "circle", padding: 0.1058cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.44, -3.395), [#text(size: 9pt)[$a_f$]], frame: "circle", padding: 0.1058cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.86, -2.79), (4.65, -2.604), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.255, -2.697), [#text(size: 9pt)[$L_1$]], anchor: "south", padding: 0.1176cm)
  line((4.65, -2.604), (7.44, -2.139), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.045, -2.372), [#text(size: 9pt)[$L_2$]], anchor: "south", padding: 0.1176cm)
  line((4.65, -2.604), (7.44, -3.395), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.045, -2.999), [#text(size: 9pt)[$L_3$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A joined parent puncture and child exterior use opposite logarithmic coordinates. Their seam has physical radius $a_p e^(- L_e) = a_c e^(L_e)$ and $a_c \/ a_p = e^(- 2 L_e)$. The inset records a finite tree with independently diverging edge lengths; neither relative length ratios nor rates of divergence are fixed. The diagram is schematic. ],
) <fig:tree-scales>

== 3 Selection of paths at several exponential ends <sec:path>

The reduction used to prove Theorem 2 needs a path on which every original parameter has finite weighted
  variation. The parameters include several independently diverging neck lengths.
  Ordinary analytic curve selection does not directly apply at those ends.
  We give the precise asymptotic class and the selection argument used below.
  In particular, the argument includes the specialization of several lengths;
  one-variable quasianalyticity alone would not supply that step.

=== 3.1 The class of functions and the selection statement <the-class-of-functions-and-the-selection-statement>

Put

$ Q \( A \, c \) = { L in bb(C) : Re L > A \, med \| Im L \| < c \( Re L \)^2 } . $

An ordinary parameter is a variable in a fixed complex neighborhood of a finite real point.
  A real holomorphic function is one satisfying $P \( overline(L) \, overline(z) \) = overline(P \( L \, z \))$.

#prodef([Definition 3.1.])[
  An admissible family in $m$ lengths consists of real holomorphic functions $P \( L_1 \, dots.h \, L_m \, z \)$,
    with the following properties. These properties are required for every recursively extracted coefficient as
    well as for the initial functions.
  + The functions are bounded on a product of regions $Q \( A \, c \)$, locally uniformly in the ordinary parameters.
  + For each length there is an expansion
    #[#set math.equation(numbering: n => "(3.1)")
     $ P \( L \, z \) tilde.op sum_(d in D_i) e^(- d L_i) sum_(k = 0)^(k_d) L_i^k P_(d k) \( L_(hat(i)) \, z \) .
       $ <path:eq-expansion>]
    Here $D_i subset \[ 0 \, oo \)$ is locally finite, each $k_d$ is finite, and $k_0 = 0$ if $0 in D_i$.
      For every cutoff $B$, subtracting the terms with $d lt.eq
      B$ leaves a remainder bounded by $C_B e^(- \( B + epsilon.alt_B \) Re L_i)$, for some $epsilon.alt_B > 0$,
      on possibly smaller quadratic regions. Bounds are uniform on each fixed smaller ordinary-parameter polydisc.
  + For every subset of expanded lengths, all its coefficient formulas, at all orders,
    are holomorphic on one common tail band
    $ product_(j upright(" unexpanded")) { Re L_j > A' \, med \| Im L_j \| < c' } \, wide c' > 0 \, $
    times one common open ordinary-parameter neighborhood. These domains may be shrunk once when a finite number
      of families are used together. The constants and thresholds in asymptotic #emph[estimates] may depend on the
      order; the common domains of #emph[analyticity] do not.
  + If a subset of real parts has the form $Re L_i = c_i U + o \( U \)$, where $c_i > 0$,
    the corresponding iterated expansion can be grouped by weights $sum_i c_i d_i$.
    The grouped weights are locally finite, and each finite cutoff has a remainder of strictly better exponential
    order in $U$. The assertion holds on the complex neighborhoods in (i) and locally uniformly on the common
    ordinary-parameter neighborhood. It is enough to establish it by successive single-length expansions.
  When $m = 0$, admissible families are ordinary holomorphic germs.
] <path:def-admissible>

The distinction in (iii) will be used when an expansion has infinitely many zero coefficients.
  It is not an assertion that all remainder estimates hold beyond a single order-independent threshold.

#thm([Theorem 3.2.])[
  (Path selection).  #emph[Let $P_1 \, dots.h \, P_s$ be an admissible finite family,
    and let a finite Boolean combination of conditions $P_j > 0$, $P_j = 0$, and $P_j < 0$ hold along a sequence
$ L_i^(\( n \)) arrow.r + oo \, wide z^(\( n \)) arrow.r z_0 . $

 There is a real analytic map $u mapsto \( L \( u \) \, z \( u \) \)$,
   defined for all sufficiently large real $u$, with the same limits and satisfying those conditions on its tail.
   Each actual coordinate $L_i \( u \)$ and $z_a \( u \)$ is eventually monotone or constant.
   Given any additional finite admissible list, its values on the path can also be required to be eventually
   monotone or constant. Finite prescribed limits of functions can be imposed at the same time.]
] <thm:path-selection>

A path germ here means analyticity at every sufficiently large finite $u$;
  analyticity at the limiting endpoint is not asserted. To impose $P arrow.r ell$,
  introduce an ordinary variable $v arrow.r ell$ and impose $P - v = 0$.
  If there are no length variables, add an unused length. This also provides positive infinitesimals for strict
  sign conditions at an ordinary limiting point.

#thm([Corollary 3.3.])[
  (The variation consequence).  #emph[Suppose admissible functions $F \, J$, with $J gt.eq 0$, satisfy
$ \| d F \| lt.eq C sqrt(J) (sum_a \| d z_a \| + sum_i e^(- c L_i) \| d L_i \|) \, wide c > 0 \, $

 on real parameter domains. There cannot be a sequence with $L_i arrow.r oo$,
   an interior ordinary-parameter limit, and $F eq.not 0$, $F^2 gt.eq c_0 J$, $F arrow.r 0$, where $c_0 > 0$.]
] <path:variation>

#proof[
  Theorem 4 realizes all these conditions on one path with monotone actual coordinates. Along it,
  $ \| d log \| F \| \| lt.eq C / sqrt(c_0) (sum_a \| d z_a \| + sum_i e^(- c L_i) \| d L_i \|) . $
  Each $z_a$ has finite total variation because it is monotone with a finite limit.
    Each length tends monotonically to infinity on its tail, and
  $ integral_(u_0)^oo e^(- c L_i \( u \)) \| L'_i \( u \) \| thin d u = c^(- 1) e^(- c L_i \( u_0 \)) < oo . $
  Thus $log \| F \|$ has finite total variation and a finite limit, whereas $F arrow.r
    0$ forces $log \| F \| arrow.r - oo$, a contradiction. ◻
]

The remaining subsections prove Theorem 4. The geometric construction resumes in Section 4 and uses Definition 3
  and Corollary 5 as its analytic interface.

=== 3.2 Sectors, uniqueness, and clocks <sectors-uniqueness-and-clocks>

#prodef([Definition 3.4.])[
  An admissible angular loss is a positive continuous function $omega \( r \)$, for large $r$, such that
  $ omega \( r \) gt.eq \( log r \)^(- 2) \, wide sum_(n gt.eq n_0) sup_(2^n < r < 2^(n + 2)) omega \( r \) < oo . $
  Its sector is the open set $S_omega = { z : \| z \| > R \, med \| arg z \| < pi \/ 2 - omega \( \| z \| \) }$.
    Every positive loss satisfying the displayed bounds has a continuous admissible enlargement:
    at dyadic radii choose a summable majorant of the neighboring shell suprema and interpolate linearly in $log
    r$. Thus enlarging a loss to make its sector open only shrinks that sector.
    Increasing a loss by a fixed factor or taking a continuous majorant of the suprema over finitely many
    neighboring dyadic shells is permitted. Given finitely many losses we can dominate all of them by another
    admissible loss. We can also arrange that the domination ratio tends to infinity:
    if $a_n gt.eq 0$ is summable, choose increasing constants $c_n arrow.r oo$,
    sufficiently slowly that $sum c_n a_n < oo$.
] <path:def-sector>

The principle that a bounded holomorphic function is determined by its exponentially accurate expansion is central
  to Ilyashenko quasianalyticity; see #cite(label("SpeisseggerQA")) Fact 1.5 in the published version.
  We prove the following variant with a summable angular loss, which is the form preserved by the clock changes below.

#thm([Lemma 3.5.])[
  (Sector uniqueness).  #emph[Suppose $f$ is bounded and holomorphic on an admissible sector and,
    on the central subsector $\| arg z \| lt.eq pi \/ 4$, satisfies $f \( z \) =
    O_B \( e^(- B \| z \|) \)$ for every $B > 0$. Then $f = 0$.]
] <path:sector-uniqueness>

#proof[
  Let $w_n$ be the supremum of the prescribed loss on a fixed enlargement of the $n$-th dyadic shell.
    Choose summable $a_n gt.eq 0$ with $a_n \/ w_n arrow.r oo$; enlarge them by a fixed factor if necessary.
    On the right half-plane define
  $ A \( z \) = sum_n frac(a_n, 1 + z \/ 2^n) \, wide Phi \( z \) = z exp A \( z \) . $
  The series is normally convergent there, $A \( z \) arrow.r 0$ uniformly as $\| z \| arrow.r oo$,
    and $\| Phi \( z \) \| asymp \| z \|$. For $Im z > 0$, every summand has nonpositive imaginary part.
    If $pi \/ 4 lt.eq arg z lt.eq pi \/ 2$, the terms with $2^n asymp \|
    z \|$ have negative imaginary part of magnitude at least a fixed multiple of $a_n$.
    Thus the change in argument pushes the outer part of the half-plane inside the prescribed sector.
    Reflection proves the assertion below the real axis; on the central part it follows from $A = o \( 1 \)$.
    Translating the half-plane sufficiently far to the right puts its whole image in the domain of $f$.
  The bounded pullback $F = f compose Phi$ is superexponentially small on a fixed central sector,
    for example $\| arg z \| lt.eq pi \/ 8$. In a half-disc of radius $r$,
    the harmonic measure at a fixed positive interior point of the central part of its semicircular boundary is at
    least $c \/ r$. One can see this directly by scaling to the unit half-disc:
    the Poisson kernel on a compact subarc away from its endpoints is comparable to the distance of the rescaled
    axial point from the straight boundary, namely a constant times $1 \/ r$. Write $M$ for a bound for $\| F \|$.
    On that arc $log \| F \| lt.eq - B c_1 r + C_B$, and on the rest of the boundary $log \| F \| lt.eq log M$.
    The subharmonic maximum principle gives
  $ log \| F \( z_(*) \) \| lt.eq log M - c_2 B + O_B \( r^(- 1) \) . $
  Zeros cause no difficulty: use the subharmonic function $max { log \| F \| \, - N }$ and then let $N arrow.r
    oo$. First let $r arrow.r oo$, then $B arrow.r oo$. Hence $F$ vanishes at every fixed axial point.
    The Identity Theorem gives $F = 0$, and then $f = 0$, since $Phi$ is nonconstant and its image is open. ◻
]

We now describe the one-variable fields into which the selected paths will be placed.
  Begin with a positive variable $x_1 arrow.r oo$ and the field $B_0$ of convergent meromorphic Puiseux germs in
  $1 \/ x_1$. At stage $j$, the clock $x_j$ belongs to $B_(j - 1)$, and for $j > 1$ it satisfies $x_(j - 1) =
  o \( x_j \)$. The first clock is $x_1$, or a positive constant multiple of it. A germ in $B_j$ has an expansion

#[#set math.equation(numbering: n => "(3.2)")
 $ f tilde.op sum_(beta in E) e^(beta x_j) b_beta \, wide b_beta in B_(j - 1) \, $ <path:eq-clock-series>]

where the real set $E$ is bounded above and finite above each cutoff.
  The germ and the continued coefficients are holomorphic on admissible sectors in the variable $x_j$.
  After a finite cutoff the remainder has a strictly better exponential rate in $Re x_j$,
  on a possibly smaller admissible sector. This includes sector estimates for an empty expansion.
  The same definition is used for holomorphic families on fixed ordinary-parameter polydiscs,
  with estimates on smaller polydiscs. At the Puiseux level a parameter family has a common finite ramification
  denominator and pole order, holomorphic coefficient functions on the ordinary polydisc,
  and a convergent series locally uniform there; bounds are taken on smaller polydiscs.

#thm([Lemma 3.6.])[
  (Clock calculus and change of clock).  #emph[The preceding construction has the following properties,
    established simultaneously by induction.]
  + #emph[Each $B_j$ is a field, closed under differentiation in $x_1$ and conjugation.
    A nonzero scalar has a leading equivalent
#[#set math.equation(numbering: n => "(3.3)")
 $ C x_1^p exp #h(-0.16667em) (sum_(k = 1)^j beta_k x_k) \, wide C eq.not 0 \, $ <path:eq-leading-monomial>]

 uniformly on a suitable admissible sector. Its real subfield is a Hardy field:
   every nonzero real germ has a fixed eventual sign, and its derivative either vanishes or has a fixed eventual sign.]
  + #emph[If $H in B_j$ is positive and $x_j = o \( H \)$, it is a valid new sector variable.
    Finitely many prescribed earlier-clock sectors can be reached by taking a sufficiently narrow admissible
    $H$-sector. If $f in B_j$ is positive, unbounded, and $f = O \( H \)$,
    then on such a sector its modulus is comparable to its value at the corresponding positive real $H = \| H \|$;
    it maps into any finitely prescribed admissible $f$-sectors.
    If $f = o \( H \)$ on the real ray, then $Re f = o \( Re H \)$ throughout the narrowed sector.]
] <path:clock>

#proof[
  For $B_0$, inversion and all assertions follow by convergent Puiseux inversion.
    A positive unbounded Puiseux germ is a positive constant times a positive power of the real variable,
    with a relative error tending to zero. If $f = O \( H \)$,
    the corresponding power is at most the power for $H$. A strictly smaller power leaves a fixed angular margin.
    Equal powers require only an enlarged admissible loss. Pullback of a loss under comparable positive power
    growth preserves dyadic summability.
  Assume both assertions at lower levels, and write $x = x_j$.
    Their change-of-clock assertion permits evaluation of lower germs on $x$-sectors and gives $Re x_k =
    o \( Re x \)$ for $k < j$. Consequently every fixed nonzero lower scalar and its reciprocal have magnitude
    $exp \( o \( Re x \) \)$. The largest exponent in a nonempty expansion therefore determines its leading term,
    separated from the rest by a positive exponential gap. Induction gives Equation (3.3).
    Sums and products are calculated termwise: above any cutoff only finitely many pairs of exponents occur.
    To invert, factor the leading term and use a geometric series in the exponentially small remainder.
    A finite desired cutoff uses only finitely many geometric terms.
    A zero expansion is bounded on the sector supplied by any one of its remainder estimates and
    superexponentially small on the central sector. Lemma 7 then makes the germ zero.
    Thus the leading-term test is valid also after cancellation.
  Cauchy’s formula on successively smaller sectors differentiates each finite expansion and its remainder.
    The radii of the Cauchy discs can be chosen with logarithmic relative loss,
    after enlarging the angular loss on neighboring shells. Their reciprocal costs,
    and the lower-field factor from differentiating the clock,
    can be absorbed in an arbitrarily small loss of an exponential remainder rate.
    The chain rule and the induction hypothesis give closure under differentiation in $x_1$.
    Reflection gives conjugation. A real leading monomial has a nonzero real leading constant, hence a fixed sign.
    Applying this to the derivative proves the Hardy-field assertion.
    These steps use only the lower-level change of clock, not the still-to-be-proved change of clock in $B_j$.
  We prove that change next. On every strip within a bounded distance of the real $x$-ray,
    a nonzero lower scalar has ratio $1 + o \( 1 \)$ to its value at a neighboring real point.
    Indeed the earlier clocks have size $o \( x \)$, uniformly on fixed proportional discs by the induction
    hypothesis, and Cauchy’s estimate makes their derivatives $o \( 1 \)$.
    The logarithmic derivative of the factor $x_1^p$ has the same property.
    The leading equivalent and a smaller sector give the assertion for every nonzero lower scalar.
    The assertion applies to a nonzero lower-field derivative as well;
    division by $d x \/ d x_1$ expresses differentiation in $x$ inside the lower field.
  Write
  #[#set math.equation(numbering: n => "(3.4)")
   $ H = e^(b x) h \( 1 + E \) \, wide h in B_(j - 1) \, quad h > 0 \, quad E =
     O \( e^(- epsilon.alt Re x) \) . $ <path:eq-H-leading>]
  Since $H$ is unbounded, $b gt.eq 0$. First suppose $b > 0$. On bounded strips, $\( log H \)' = b + o \( 1 \)$.
    Analytic inversion along the arcs $H = rho e^(i theta)$, $\| theta \| lt.eq pi \/ 2$, gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ x \( rho e^(i theta) \) = x \( rho \) + i theta \/ b + o \( 1 \) \, wide partial_theta x = i \/ b +
     o \( 1 \) \, $ <path:eq-clock-inverse>]
  uniformly in $theta$. For completeness, solve the inverse equation first on a fixed small $theta$-interval by
    the Analytic Inverse Theorem, using the uniform lower bound $\| \( log H \)' \| gt.eq b \/ 2$.
    Continue over finitely many such intervals. Integrating the inverse derivative gives Equation (3.5),
    keeps the solution in a bounded strip, and guarantees uniqueness on overlaps.
    The resulting branches agree with the real inverse and hence agree where their sector domains overlap.
  If $f = e^(a x) g \( 1 + O \( e^(- epsilon.alt' Re x) \) \)$, where $g > 0$ is lower level,
    then unboundedness and $f = O \( H \)$ give $0 lt.eq a lt.eq b$.
    When $a < b$, its argument tends uniformly to $a theta \/ b$, so there is a fixed angular margin.
    Its real size relative to $H$ decays exponentially in $x$,
    which proves real-part separation even after division by a logarithmic angular margin.
    When $a = b$, put $J = g \/ h$. This is a positive bounded lower scalar, and
  $ f \/ H = J \( 1 + O \( e^(- epsilon.alt_1 Re x) \) \) . $
  The strip estimate implies, uniformly for $\| theta \| lt.eq pi \/ 2$,
  $ frac(Re f, \| H \|) = O \( J \( x \( rho \) \) cos theta \) +
    O \( \| J'_x \( x \( rho \) \) \| + e^(- epsilon.alt_2 x \( rho \)) \) . $
  If $J arrow.r 0$, its derivative is eventually negative unless it is zero.
    More precisely, put $q = J'_x \/ J$, $t = x \( rho \)$, and $D = \( log H \)'$.
    Equation (3.5) and the strip estimate give
  $ frac(d, d theta) arg J \( x \( rho e^(i theta) \) \) = Re
    frac(q \( x \( rho e^(i theta) \) \), D \( x \( rho e^(i theta) \) \)) = frac(q \( t \), b) \( 1 + o \( 1 \) \) . $
  Thus its phase changes toward the real axis for positive $theta$; reflection handles negative $theta$.
    If $J$ has a positive limit, either direction of its vanishing phase error is allowed.
  The strip estimate also gives $J \( x \( rho e^(i theta) \) \) = J \( t \) + O \( \| J'_x \( t \) \| \)$, and hence
  $ frac(\| Re f \|, Re H) lt.eq C J \( t \) + C frac(\| J'_x \( t \) \| + e^(- epsilon.alt_2 t), omega_H \( rho \)) . $
  Choose the angular loss for $H$ to dominate $\| J'_x \| +
    e^(- epsilon.alt_2 x)$ by a factor tending to infinity. This is an admissible choice.
    In fact $J$ is eventually monotone with a finite limit, so $integral \| J'_x \| thin d x < oo$.
    Its suprema on bounded $x$-intervals are comparable to its integrals there,
    by the strip estimate for the derivative; a zero derivative needs no estimate.
    Since $log H = b x + o \( x \)$ and its derivative tends to $b$,
    these intervals correspond to dyadic $H$-shells. The preceding displayed estimate now gives $Re f =
    o \( Re H \)$ when $J arrow.r 0$. Prescribed losses for the $f$-sector can also be pulled back:
    here $d log f \/ d log H arrow.r 1$, so a dyadic shell in either variable meets only a bounded number of
    shells of comparable logarithmic width in the other. Their pulled-back suprema are summable.
    Enlarging the $H$-loss once more gives the sector mapping and modulus assertions.
  It remains to consider $b = 0$. Use $h$ first as variable at the previous level.
    It is larger than $x$, and $log h = o \( x \)$, because the logarithm of a lower scalar is controlled by
    earlier clocks. The lower change-of-clock assertion applies both to $x$ and to the leading lower factor of
    $f$; $f$ also has top exponent zero. In the $h$-variable,
    the map from $h$ to $H$ in Equation (3.4) is a relative perturbation $O \( e^(- epsilon.alt Re x) \)$.
    Take a wider and a narrower admissible sector with margins at least a fixed multiple of
    $\( log \| h \| \)^(- 2)$. On the wider sector
  $ Re x gt.tilde \| x \| \( log \| x \| \)^(- 2) \, wide \| x \| asymp x \( \| h \| \) . $
  Here are quantitative inverse estimates. At a target point $H_0$ put $r = \| H_0 \|$, $w = log r$, $X_0 =
    x \( r \)$, and $rho = c w^(- 2)$. Enlarge the losses on neighboring shells so that $D \( H_0 \, 4 rho r \)$
    lies in the wider sector. The positive harmonic function $Re x$ satisfies Harnack’s inequality there,
    so on $D \( H_0 \, 2 rho r \)$ the perturbation is bounded by
  $ eta = C exp { - c_1 epsilon.alt X_0 \/ \( log X_0 \)^2 } . $
  Since $w = o \( X_0 \)$, one has $eta w^N arrow.r 0$ for each fixed $N$.
    Rouché’s Theorem on a disc of radius $rho r$, followed by Cauchy’s estimate, gives a unique nearby inverse $u$ with
  $ \| u - H_0 \| = O \( eta r \) \, wide frac(d H, d h) \( u \) = 1 + O \( eta \/ rho \) . $
  Uniqueness glues these inverse branches on overlaps. For any positive unbounded lower factor $F = O \( h \)$,
    its sectorial logarithm is $O \( w \)$. Cauchy’s estimate therefore gives
  $ \| log F \( u \) - log F \( H_0 \) \| = O \( eta w^3 \) = o \( w^(- 2) \) . $
  This proves modulus comparability and preserves every enlarged angular margin.
    If $F = o \( h \)$, induction gives $Re F \( u \) = o \( Re u \)$, whereas $Re u \/ Re H_0 = 1 +
    O \( eta w^2 \)$. The extra relative exponential perturbation in $f$ contributes at most $O \( eta w^2 \)$
    after division by $Re H_0$, using a smaller common exponential rate for the finitely many functions.
    Thus real-part separation is unchanged. This completes the simultaneous induction. ◻
]

Only finitely many sector requirements are imposed at a time in Lemma 8.
  Different truncation orders may use different losses and different initial radii.

#thm([Lemma 3.7.])[
  (Sectorial limits of holomorphic families).  #emph[Let $F$ be a holomorphic family in a finite clock hierarchy,
    on an ordinary polydisc $D$. Suppose that on the positive path ray it converges to a finite holomorphic family
    $F_oo$, locally uniformly on $D$. Then on every fixed smaller polydisc $D' subset.double D$,
    it converges uniformly to the same family on some admissible sector of its last clock.
    The conclusion remains valid after passing to a faster admissible clock by Lemma 8.
    Finitely many such requirements can be imposed on one sector.
    In particular, a normalized limit which is nonzero on a fixed compact contour stays uniformly nonzero there,
    and finitely many composition arguments with limiting images in prescribed open domains stay in those domains.]
] <path:family-limits>

#proof[
  First note a uniform growth consequence of the parameter expansion calculus.
    A lower-level family, together with any fixed finite list of its ordinary derivatives,
    is $exp \( o \( Re x_j \) \)$ on a suitable sector of a faster clock $x_j$,
    uniformly on a smaller ordinary polydisc. At the Puiseux level convergence gives a polynomial bound in the
    first clock. At a higher level take a finite cutoff below the largest exponent.
    There are only finitely many retained lower coefficient families;
    their inductive bounds and the prescribed remainder bound control the family by an exponential in its last
    clock. After passing to $x_j$, Lemma 8 makes the real parts of all these earlier clocks $o \( Re x_j \)$;
    its modulus comparability treats the polynomial factors. Cauchy’s formula on one fixed smaller ordinary
    polydisc gives the same assertion for any specified finite derivative list.
    No nonzero normalization of these families is required for this upper bound.
  We now prove the finite-limit assertion by induction on the hierarchy.
    At the Puiseux level, real-ray boundedness eliminates negative powers of the small ramified variable.
    The convergent series with holomorphic coefficients then converges to its constant term also for complex small
    argument, locally uniformly in the ordinary parameters.
  At level $j$, write the expansion as $sum_beta e^(beta x_j) B_beta$.
    If a positive exponent has a nonzero coefficient family, choose the largest such exponent and an ordinary
    Taylor coefficient of $B_beta$ which is a nonzero scalar germ.
    Cauchy’s formula makes the corresponding Taylor coefficient of $F$ bounded on the positive ray.
    Its scalar expansion, however, has a positive leading top exponent and a nonzero lower scalar coefficient.
    That coefficient and its reciprocal are subexponential in $x_j$ by Lemma 8, contradicting boundedness.
    Zero coefficient families can be discarded; finiteness above each cutoff ensures that the largest nonzero
    positive exponent exists if there is one. Thus every positive top coefficient vanishes.
  Take the cutoff at zero and put $B_0 = 0$ when that weight is absent. The strict remainder gain gives
  $ F = B_0 + O \( e^(- epsilon.alt Re x_j) \) $
  uniformly on a smaller ordinary polydisc and a suitable sector.
    If a truncation convention retains finitely many negative terms as well,
    the preliminary uniform subexponential bound absorbs those terms into this estimate with a smaller positive
    $epsilon.alt$. Consequently $B_0$ has the same finite locally uniform limit on the positive ray as $F$.
    By induction it has that limit on a sector of the preceding clock.
    Map the $x_j$-sector into this sector by Lemma 8. Modulus comparability ensures that the preceding clock tends
    to infinity uniformly there. This proves convergence of $B_0$, however slow its real-ray rate may be.
    The displayed remainder tends uniformly to zero because $Re x_j gt.tilde \| x_j \| \/ \( log \| x_j \| \)^2
    arrow.r oo$. The induction is complete.
  A further faster clock maps into the sector just obtained and sends its tail to uniformly large moduli there,
    again by Lemma 8. Thus the limit persists. A finite collection of requirements uses a common admissible
    majorant of the finitely many losses and a common sufficiently large radius.
    Finally, the modulus of a limiting unit has a positive minimum on a compact contour.
    Apply uniform convergence on a finite covering by smaller ordinary polydiscs to make the error less than half
    this minimum. For a composition argument choose a compact neighborhood of its limiting image inside the
    prescribed domain and apply the same uniform convergence. These are finitely many requirements, as claimed. ◻
]

=== 3.3 Regular systems and finite analytic operations <regular-systems-and-finite-analytic-operations>

We now collect the properties that must survive when another length is introduced.
  Every nonzero analytic family must have a scalar normalization;
  finite analytic operations must preserve controlled domains;
  and the resulting expressions must still be realizable on paths of the clock class.
  The definition below makes these requirements an induction invariant.
  Preparation and root extraction will then be finite operations within that invariant.

Fix a nonprincipal ultrafilter $cal(U)$ on the indices of the given sequence.
  Such a filter exists by the maximal principle applied to the cofinite filter.
  For every subset of indices, exactly one of that subset and its complement lies in $cal(U)$.
  Compactness therefore gives limits in compact spaces, including the extended real line.
  All comparisons made at the distinguished sequence in the construction below are in this sense.
  Only a finite number of these comparisons is used to construct any particular path.

#prodef([Definition 3.8.])[
  A domain base is a directed family of connected real open domains in auxiliary independent variables,
    each containing the distinguished sequence for a set of indices in $cal(U)$.
    A germ on the base is an analytic function on one such domain, with its local complexification;
    two functions are identified if they agree on a smaller domain.
    Extra ordinary variables range over complex polydiscs about specified standard values.
  A regular system $cal(A)$, with scalar field $K$, has the following properties.
  + Every nonzero family $F \( q \, zeta \)$ admits a nonzero scalar $k in K$ such that $F \/ k$ has a finite,
    nonzero holomorphic limit as a germ in $zeta$, locally uniformly on a polydisc, along the domain base.
    The scalar reciprocal $1 \/ k$ is in the system. For real families $k$ can be chosen real.
    Every scalar comparison or finite scalar limit made at the distinguished sequence holds along the base after
    the appropriate restrictions.
  + For every positive scalar size $a$ and integer $n > 0$,
    there is a positive scalar $rho$ with $rho^n \/ a$ tending to a finite positive constant.
    Scalars and reciprocals have magnitude at most $exp \( C max_i L_i^(*) \)$,
    where $L_i^(*)$ are the current centers. For an empty tuple the bound is constant.
  + The system is closed under finite sums and products, reflection,
    ordinary holomorphic composition at finite limiting arguments,
    inversion after a nonvanishing normalized limit has been specified,
    and Cauchy integration on fixed compact contours. Integrals over fixed compact segments are allowed by a
    finite cover of their holomorphic parameter neighborhoods.
    Domain restrictions for these operations are part of the finite data of the expression.
  + Given a domain and finitely many normalization, comparison, and limit requirements,
    there are families of real analytic paths eventually in that domain preserving them.
    The expressions used belong on each path to a clock hierarchy of Lemma 8,
    with parameter versions for any finite specified uses. The path families have real constant parameters in open
    sets and are analytic in those constants where defined. At every sufficiently large fixed path time,
    their evaluation into the independent-variable domain is locally submersive.
    The starting time may depend on the constants.
  Limits of families in (R1) mean uniform limits on each fixed smaller polydisc.
    A nonzero holomorphic limit need not be nonzero at its central point.
    An inverse requires nonvanishing on the particular polydisc or contour where that inverse is used.
] <path:def-regular>

The expression “finite analytic operation” always includes its inputs and the domain data needed for them.
  This prevents an implicit request to preserve infinitely many normalizing comparisons on a path.
  Two elementary consequences will be useful.

#thm([Lemma 3.9.])[
  (Preparation on fixed contours).  #emph[Let $F \( q \, zeta \, y \)$ belong to a regular system.
    Suppose that after scalar normalization its limiting germ is regular of degree $d$ in the $y$-direction at
    $\( zeta \, y \) = \( 0 \, 0 \)$. Then its Weierstrass polynomial, its unit,
    and division of any other family by that polynomial are obtained by the operations in (R3) on fixed contours
    and fixed smaller parameter polydiscs. Arbitrarily high Taylor coefficients of these operations use the same
    denominator zero sets and the same contours.]
] <path:prepared-contours>

#proof[
  Choose a circle $\| y \| = r$ on which the limiting germ is nonzero and inside which it has precisely $d$ zeros
    at $zeta = 0$, counted with multiplicity. After shrinking the $zeta$-polydisc and the domain in the base,
    normalized $F$ is uniformly nonzero on that circle. The power sums of its enclosed roots are
  $ s_ell \( q \, zeta \) = frac(1, 2 pi i) integral_(\| y \| = r) y^ell
    frac(partial_y F \( q \, zeta \, y \), F \( q \, zeta \, y \)) thin d y \, wide 1 lt.eq ell lt.eq d . $
  Newton’s identities give the monic polynomial $W$ from these power sums, by finite polynomial operations.
    The quotient $F \/ W$ is a holomorphic unit on a smaller disc by cancellation of the enclosed zeros;
    its values there can also be expressed by a fixed-circle Cauchy formula.
    A useful explicit division formula for a holomorphic family $G$ is
  $ G \( y \) = W \( y \) frac(1, 2 pi i) integral_(\| w \| = r) frac(G \( w \), W \( w \) \( w - y \)) thin d w +
    frac(1, 2 pi i) integral_(\| w \| = r) frac(G \( w \), W \( w \)) frac(W \( w \) - W \( y \), w - y) thin d w . $
  The second term is a polynomial in $y$ of degree less than $d$. These formulas prove the asserted closure.
    Differentiating or expanding them introduces powers of the existing nonzero contour denominators,
    not new denominators with new zero sets. All Taylor orders are holomorphic on the same smaller polydisc;
    their Cauchy constants may depend on the order. ◻
]

#thm([Lemma 3.10.])[
  (Roots in a regular scalar system).  #emph[Suppose (R1)–(R3) hold, including divisibility of positive sizes.
    Then the complex scalar field is algebraically closed and its real part is real closed.]
] <path:roots>

#proof[
  We factor monic polynomials by induction on degree. Translate the variable to remove the coefficient of degree
    $d - 1$. If all the remaining coefficients vanish, the polynomial is a pure power and the claim follows.
    Otherwise write it as
  $ y^d + sum_(j = 2)^d a_j y^(d - j) . $
  Choose, from finitely many positive root-size representatives of the nonzero $a_j$, one of largest size,
    denoted $rho$. Replacing $y$ by $rho v$ makes all coefficients bounded and makes at least one non-leading
    coefficient have a nonzero limit. The limiting depressed polynomial has at least two distinct roots:
    a polynomial with a single root is $\( v - c \)^d$, and its vanishing degree-$d - 1$ coefficient forces $c = 0$.
  Choose disjoint small fixed circles around the distinct limiting roots.
    The contour power sums used in Lemma 11 give monic factors for the corresponding clusters.
    Their coefficients are in the system, and all their degrees are strictly smaller than $d$.
    Induction factors each cluster completely. Undo the scaling and translation.
    For a real polynomial, conjugation pairs the nonreal factors and fixes every real-valued root.
    The real scalar field is ordered by eventual sign. Every positive element has a real square root,
    and every odd-degree real polynomial has a real root: at the real points of a sufficiently small base domain
    these assertions hold for the factorizations just constructed,
    and the finite sign and conjugacy alternatives can be fixed on the domain base.
    These two properties characterize a real closed ordered field. ◻
]

#thm([Lemma 3.11.])[
  (Detection of analytic identities).  #emph[Path families with the submersivity property in (R4) detect analytic
    germs. Namely, if an analytic function vanishes on the tail of every path in such a family,
    then it vanishes as a domain germ. The same holds for a holomorphic family in extra ordinary variables.]
] <path:detection>

#proof[
  Let $V$ be an open parameter set for one family and use integer path times $N$.
    At a fixed $N$, evaluation is analytic on an open subset $V_N subset V$.
    On the subset where its differential is surjective, the composition with a nonzero domain germ is a nonzero
    real analytic function on every connected parameter neighborhood:
    otherwise submersivity would give an open set of zeros in the domain.
    The zero set of a nonzero real analytic function has Lebesgue measure zero.
    This last fact follows by induction on the number of variables:
    in one variable zeros are discrete; in higher dimension separate the points where a nonzero Taylor coefficient
    in the last variable is nonzero and use the one-dimensional result and Fubini,
    with induction on the exceptional coefficient-zero set.
  Every parameter lies, for all sufficiently large integers,
    in a submersive evaluation domain and in the zero set of the composition.
    If the original germ were nonzero, countably many local parameter charts for these integer evaluations would
    thus cover $V$ by sets of measure zero, a contradiction. An open set of domain zeros makes the germ zero by
    connectedness and the Analytic Identity Theorem. For a family in extra variables,
    apply this argument to each of its Taylor coefficients, or fix the extra variables in a countable dense set
    and then use continuity. ◻
]

=== 3.4 Adjoining a reciprocal fastest length <adjoining-a-reciprocal-fastest-length>

The next Lemma is the analytic specialization step. It is stated with its quantitative separation hypothesis,
  since that hypothesis rules out uncontrolled cancellation against the lower field.

#thm([Lemma 3.12.])[
  (One independent reciprocal).  #emph[Let $cal(A)$ be a regular system for a nonempty lower tuple
    $L' = \( L'_1 \, dots.h \, L'_r \)$, with real scalar field $K_(bb(R))$.
    Assume that each $L'_i$ is a positive unbounded element of $K_(bb(R))$, and put $M' = 1 + sum_(i = 1)^r L'_i$.
    Assume in addition that, for every finite use of its path property,
    the lower paths can be chosen with last clock $x_(upright("prev")) = O \( M' \)$.
    This is an additional property of the length systems constructed below;
    it is not part of the abstract conditions (R1)–(R4). Let a new independent positive variable $p$ have the
    distinguished limits
$ p arrow.r 0 \, wide p max L' arrow.r 0 \, wide \| p - c \| gt.tilde p^2 quad \( c in K_(bb(R)) \) . $

 The constant in the last comparison may depend on $c$. Use domain fibers in $p$ which are open intervals cut out
   by finitely many strict comparisons with lower scalars. There is a regular system $cal(A) \[ p \]$ containing
   the lower system and $p \, p^(- 1)$, closed under the finite analytic operations,
   with the following size bound for each nonzero scalar and its reciprocal:
#[#set math.equation(numbering: n => "(3.6)")
 $ \| a \| + \| a \|^(- 1) lt.eq e^(C \( 1 + max L' \)) p^(- C) . $ <path:eq-p-size>]

 Its finite path requirements can be realized by substituting for $p$ an expression in lower scalars,
   with an additional real constant varying in an open interval, and preserving $p M' arrow.r 0$.
   On the resulting lower paths one therefore has $p x_(upright("prev")) arrow.r 0$.]
  #emph[For the empty lower tuple the same conclusion holds with ordinary holomorphic germs and the choice $p =
    theta \/ x_1$, $theta > 0$.]
] <path:adjoin-p>

#proof[
  We give the chart construction, the normalization argument, and the path argument separately.
    Real closedness of the lower field is available from Lemma 12.
  #emph[Charts and their common refinements.] For a real center $c in K_(bb(R))$, let $s = \| p - c \|$;
    fix its sign on the domain base. If $s$ is comparable to a positive lower scalar, use a disc coordinate
  $ u = \( p - c \) \/ R $
  with finite limiting value, where $R > 0$ is in $K_(bb(R))$.
    If no positive lower scalar has size comparable to $s$, call the size unmatched and use a ramified annular chart
  #[#set math.equation(numbering: n => "(3.7)")
   $ u = \( s \/ R \)^(1 \/ n) \, wide v = \( r \/ s \)^(1 \/ n) \, wide u \, v arrow.r 0 \, $ <path:eq-annulus>]
  where $R \, r$ are lower positive scalars, $r = 0$ is allowed, and the positive real branches are used.
    In the latter chart permit scalar prefactors $k s^q$, with $k in K$, $q in bb(Q)$.
    Functions are lower analytic families in these bounded coordinates, at their specified standard values,
    times such prefactors. Disc charts require only lower scalar prefactors.
  Here is the finite refinement rule. Include zero and every center in the finite data,
    and choose a center whose distance from $p$ is smallest in order.
    If its distance is matched, a disc at that scale expresses all other required coordinates by bounded analytic
    substitutions, after normalizing their nonzero distances.
    In the unmatched case each nonzero difference of two centers is either $o \( s \)$ or much larger than $s$:
    it cannot be comparable to $s$, since that would match $s$ with a lower scalar. Write
  $ p - c' = \( p - c \) + \( c - c' \) $
  as the larger term times one plus the smaller ratio. Choose annular bounds $r lt.double s lt.double
    R$ recording every one of these finitely many ratios. Rational powers are analytic in the factor tending to
    one, and a common root denominator handles all ramification.
    A required bounded ratio of prefactors is treated in exactly this way:
    a ratio $k s^q$ has, for $q eq.not 0$, a threshold at a lower root-size representative of $\|
    k \|^(- 1 \/ q)$. Add these finitely many thresholds to the bounds $r \, R$.
    This proves the common-refinement rule, including bounded analytic representation of every needed ratio.
  #emph[Normalization in an annulus.] On the relation $u v = lambda = \( r \/ R \)^(1 \/ n)$,
    decompose a bounded lower analytic family $H \( u \, v \, zeta \)$ as
  $ H_(+) \( u \, zeta \) + H_(-) \( v \, zeta \) \, $
  where the second series has only positive powers of $v$. This is an actual convergent decomposition on a smaller
    bidisc. For example, substitute $\( w \, lambda \/ w \)$ on a fixed circle in the original $u$-disc and take
    its nonnegative Laurent part by Cauchy projection; the negative part is the positive series in $v$.
    Both belong to the lower system, since $lambda$ is a bounded lower scalar and the circle is fixed.
    If $r = 0$, set $v = 0$ and use just the first series.
  Normalize a nonzero one of these families in the lower system, with its series variable still ordinary.
    Let $N$ be the first degree whose coefficient has nonzero standard holomorphic limit in $zeta$.
    The terms of degrees less than $N$ have finitely many lower scalar normalizers.
    The tail beginning at degree $N$, factored by that power,
    is bounded with nonzero standard limit at the origin. Thus only finitely many candidate sizes occur.
    Distinct powers of $s$ cannot have comparable sizes after lower scalar multiplication:
    such a comparison, together with divisibility of lower sizes, would match $s$.
    Choose the largest candidate size over both Laurent parts.
    It is unique up to terms with the identical power, which are combined before this comparison.
    All smaller candidate ratios have zero limit, and the factored tails remain bounded by the refinement rule.
    Division by the largest size therefore gives a bounded analytic representation with nonzero holomorphic
    standard limit. If both projected series vanish, the original family vanishes.
  #emph[Normalization in a disc.] Translate the disc coordinate to have limit zero and normalize the family
    $H \( u \, zeta \)$ in the lower system before substituting $p$.
    If it is nonzero, choose a Taylor coefficient $b \( u \)$ in $zeta$ whose standard limit is a nonzero germ in
    $u$. Preparation and division in $u$, by Lemma 11, give
  #[#set math.equation(numbering: n => "(3.8)")
   $ H \( u \, zeta \) = b \( u \) G \( u \, zeta \) + S \( u \, zeta \) \, $ <path:eq-disc-division>]
  where $G$ is bounded and $S$ is a polynomial in $u$. Also $b$ is a unit times a monic polynomial in $u$.
  The finite-dimensional $K$-span of the coefficient germs in $zeta$ of $S$ has a basis $psi_1 \, dots.h \,
    psi_h$ whose standard limits are linearly independent over $bb(C)$, with each $psi_j$ bounded.
    To construct it, normalize a nonzero element, choose one of its Taylor coefficients with nonzero limit,
    and normalize that coefficient to be one. Pass to the kernel of the corresponding coefficient functional in
    the original span and repeat. The dimension drops by one at each step.
    The resulting triangular Taylor-coefficient matrix has nonzero limiting diagonal, proving the assertion. Hence
  $ S \( u \, zeta \) = sum_(j = 1)^h A_j \( u \) psi_j \( zeta \) \, $
  where the $A_j$ are polynomials over $K$; its size after specialization is the largest of their nonzero sizes.
  Factor these finitely many polynomials, together with the polynomial for $b$, over $K$.
    Include the real parts of their roots, expressed in the $p$-coordinate, among the centers of the refinement.
    The imaginary parts are lower scalars; their sizes are additional comparison thresholds.
    Every factor then has a bounded normalized analytic representation, using either a disc or an annulus.
    The largest size among $b \, A_1 \, dots.h \, A_h$ normalizes $H$.
    If an $A_j$-size strictly dominates that of $b$, independence of the standard $psi_j$ prevents cancellation.
    Otherwise $b$ itself is a Taylor coefficient of $H$, so a normalized limit of $H$ cannot vanish identically.
    The boundedness of the representation and Cauchy’s formula make this coefficient argument valid for
    holomorphic limits.
  #emph[Bounds and analytic closure.] All resulting sizes are products of lower scalar sizes and rational powers
    of distances and scales. Every nonzero distance from $p$ to a real lower center is at least a fixed multiple
    of $p^2$. Upper bounds for centers and scales, and bounds for their reciprocals, are lower exponential bounds.
    The preceding finite factorizations therefore give Equation (3.6).
    Positive root-size representatives follow from ramification and the lower representatives.
    For a bounded scalar the chart formula gives its finite standard limit;
    prefactor ratios are controlled by the recorded comparisons. Nonzero real scalars have a fixed sign.
    A complex normalizer for a real family can be replaced by a real or imaginary part of comparable size,
    and then by a positive representative if desired.
  After common refinement, sums, products, ordinary composition,
    and normalized unit inversion are the corresponding lower analytic operations on bounded families.
    Contour integrals are treated by finitely many chart neighborhoods covering the contour.
    The same argument works for a compact segment. This proves (R1)–(R3) for the extension.
    Comparisons such as $\| p - c \| gt.tilde p^2$ can be expressed by interval endpoints in the real lower field:
    factor the relevant real polynomial inequalities using Lemma 12, order their roots,
    and choose the interval containing the distinguished points.
  #emph[Finite specialization and path families.] Refine using all chart centers,
    all endpoints of the required interval, and zero. In a matched chart,
    with positive scale $d$ and limiting coordinate $a$, choose
  #[#set math.equation(numbering: n => "(3.9)")
   $ p = c + a d + theta d eta \, $ <path:eq-matched-choice>]
  where $eta > 0$ is a lower infinitesimal and $theta$ varies in a small open interval of constants.
    Its sign can be fixed to meet the fiber constraints. Every included endpoint has nonzero normalized distance
    at its own recorded scale. Choose $eta$ smaller than the finitely many required relative margins.
    Then all comparisons persist and every required coordinate has its exact limiting standard part.
    If an endpoint were nearer than the chosen center-scale data,
    it would already have been selected by the closest-center refinement;
    thus this choice omits no cancellation relevant to the finite data.
  In an unmatched chart choose a lower scale strictly between all required lower and upper bounds,
    for instance their geometric mean after taking the largest lower and smallest upper bound.
    If the lower bound is zero, multiply the upper bound by a positive lower infinitesimal.
    Set $s$ equal to this scale times $theta$ in a bounded positive open interval, and set $p =
    c plus.minus s$ with its recorded sign. Thresholds required by bounded prefactors were already included,
    so these substitutions preserve all finite normalization requirements.
    They use only lower scalar and ordinary analytic operations.
  Include among the finite requirements $p arrow.r 0$ and $p M' arrow.r 0$.
    The latter uses only the already defined positive lower scalar $M'$:
    it is the requirement $p \/ \( 1 \/ M' \) arrow.r 0$, handled by the same disc or annular refinement.
    The lower system contains positive infinitesimals, for example $1 \/ M'$.
    Apply the lower path property, with its assumed clock bound,
    to these and all other expressions and comparisons used in the chosen substitutions.
    Then $p x_(upright("prev")) = O \( p M' \) arrow.r 0$; no comparison involving a clock chosen only later is
    imposed on the domain base. Formula (3.9), or its unmatched counterpart,
    has nonzero derivative in the new constant $theta$. Together with submersivity of the lower evaluation,
    the triangular differential gives submersivity into the extended domain.
    Interval fibers over connected lower domains are connected after ordering their endpoints;
    they remain the domain base under these restrictions. This proves (R4).
    In the empty case, $p = theta \/ x_1$ gives the stated meromorphic Puiseux families directly. ◻
]

=== 3.5 Construction for several lengths <construction-for-several-lengths>

We now construct the regular system of Definition 10 for the original tuple of length variables.
  The induction separates lengths of comparable size from strictly slower differences,
  applies the reciprocal-length construction when necessary, and preserves the common coefficient domains.
  Its output will leave only the ordinary-variable sign conditions to solve in the final subsection.

For example, the admissible equation

$ e^(- L_1) - L_2 e^(- L_2) = 0 $

has the path $L_2 = e^u$, $L_1 = e^u - u$. The lengths have ratio tending to one,
  but their difference is the unbounded slower quantity $- u = - log L_2$.
  Thus grouping lengths by their limiting ratios must retain the magnitudes of unbounded slower differences as new
  centers.

#thm([Proposition 3.13.])[
  (Centers and regular systems).  #emph[For a distinguished sequence of $m$ lengths tending to infinity,
    there are centers $L_1^(*) \, dots.h \, L_m^(*)$, differing from the sequence values by bounded additive
    amounts, and a regular system on a domain base with the following additional properties.]
  + #emph[The system contains the centers, $e^(b L_i^(*))$ for every real $b$,
    and every admissible family evaluated at these centers.]
  + #emph[Every finite expression built with the allowed analytic operations has coefficient formulas on a common
    connected domain of the base and a common ordinary-parameter neighborhood.
    The same formulas remain valid to all orders on paths preserving its finite preparation data.
    Remainder sectors and thresholds may depend on order.]
  + #emph[On the path families, the grouped centers have the form $c_i X + D_i^(*)$, $c_i > 0$,
    where the positive magnitudes of the unbounded $D_i^(*)$ are slower centers.
    All required quadratic holomorphy domains are reached after narrowing the clock sectors.]
  + #emph[For a nonempty tuple, its path families can be chosen so that the last clock is the selected fastest
    center $X$. Every center is $O \( X \)$, and one of the centers equals $X$.
    In particular the last clock is comparable to $max_i L_i^(*)$,
    independently of which finite expression requirements are imposed.]
] <path:centers>

#proof[
  We induct on $m$, establishing all regularity and path assertions together,
    including the last-clock invariant in (d). The empty tuple has ordinary holomorphic germs, constant scalars,
    and a point as its independent-variable domain. Its normalization and contour assertions are immediate;
    the path assertion has zero-dimensional target and is vacuous.
  #emph[Splitting the fastest block.] Choose a fastest length $X$,
    so that every ratio $L_i \/ X$ has a finite ultrafilter limit.
    This is possible by taking a maximal one among the finitely many lengths. For the indices with positive limit write
  $ L_i = c_i X + D_i \, wide c_i > 0 \, quad D_i = o \( X \) . $
  Ignore bounded $D_i$ for now, replacing them by zero in the centers.
    For each unbounded difference take its absolute value and record its eventual sign.
    These magnitudes and the lengths with ratio zero to $X$ form a lower tuple of at most $m - 1$ entries.
    Indeed a fastest block of size $k$ contributes at most $k - 1$ differences, and the other block has $m -
    k$ lengths. Apply the induction hypothesis to that tuple and denote the resulting positive centers by $L'$.
    Reinsert the recorded signs in the differences $D_i^(*)$.
  If some real lower scalar approximates the original $X$ to bounded absolute error, replace $X$ by it.
    Its positivity, its divergence, and $max L' = o \( X \)$ are finite lower-system requirements.
    Otherwise adjoin $p = 1 \/ X$ as an independent variable. For every real lower scalar $c$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ \| p - c \| gt.tilde p^2 . $ <path:eq-separation>]
  In fact failure, or even a bounded ultrafilter value of $\| p - c \| \/ p^2$, would give $c \/ p arrow.r 1$ and
  $ X - 1 \/ c = frac(c - p, p c) = O \( 1 \) \, $
  contrary to the case distinction. Thus Lemma 14 applies. In both cases call the resulting coefficient system
    $cal(A)'$. Every nonzero scalar of $cal(A)'$, and its reciprocal, is $e^(o \( X \))$, by Equation (3.6),
    $max L' = o \( X \)$, and $log X = o \( X \)$. The final centers in the fastest block are $c_i X + D_i^(*)$,
    including $X$ itself. All errors relative to the distinguished original tuple are bounded.
  #emph[Initial grouped expansions and their domains.] Adjoin $e^(alpha X)$, $alpha in bb(R)$,
    and the initial admissible functions evaluated at the centers. Their fastest-block expansions have the form
  #[#set math.equation(numbering: n => "(3.11)")
   $ sum_d e^(- d X) B_d \, wide B_d in cal(A)' \, $ <path:eq-grouped>]
  with locally finite weights and strict exponential remainder gains.
    To obtain the coefficient, expand a term with fastest-block indices $d_i$ as
  $ product_i e^(- d_i \( c_i X + D_i^(*) \)) \( c_i X + D_i^(*) \)^(k_i) . $
  Its top exponential is $e^(- \( sum_i c_i d_i \) X)$. Its remaining factors are polynomials in $X \, D_i^(*)$,
    exponentials of the signed lower centers, and recursively extracted initial coefficients in the slower
    lengths. All are in $cal(A)'$. Definition 3 supplies both the grouped remainder and the common analytic
    domains of every coefficient formula.
  The inductive lower construction supplies $x_(upright("prev")) = O \( 1 + sum_i L'_i \)$,
    and contains the positive lower centers as real scalars. Thus it meets the additional hypotheses of Lemma 14.
    In the independent case that specialization preserves $p \( 1 + sum_i L'_i \) arrow.r 0$;
    hence $x_(upright("prev")) = o \( X \)$, where $X = 1 \/ p$.
    In the dependent case $X$ is a lower scalar, and the already required comparison $\( 1 + sum_i L'_i \) \/ X
    arrow.r 0$ can be imposed using the lower path property; it again gives $x_(upright("prev")) = o \( X \)$.
    Thus in either case $X$ belongs to the lower path field and is an admissible next clock by Lemma 8.
    Declare it to be the last clock of the new hierarchy. All fastest-block centers are $c_i X + o \( X \)$,
    the other centers are $o \( X \)$, and one center is $X$, proving (d).
    When the lower tuple is empty, the independent choice $p = theta \/ x_1$ gives the first clock $X =
    x_1 \/ theta$. Subsequent finite analytic operations and domain requirements introduce no further clocks.
    The slower centers and the positive magnitudes of the differences satisfy
  $ Re L' = o \( Re X \) \, wide \| L' \| = o \( \| X \| \) $
  on a narrowed sector. Consequently $Re \( c_i X + D_i^(*) \) asymp Re X$ and $\| c_i X + D_i^(*) \| =
    O \( \| X \| \)$. The admissible loss gives $Re X gt.tilde \| X \| \/ \( log \| X \| \)^2$,
    so for every fixed $c > 0$ and sufficiently large $\| X \|$,
  $ \| Im \( c_i X + D_i^(*) \) \| lt.eq C \| X \| < c #scale(x: 120%, y: 120%)[\(] Re \( c_i X + D_i^(*) \)
    #scale(x: 120%, y: 120%)[\)]^2 . $
  Bounded ordinary shifts satisfy the same estimate. This verifies evaluation in every required quadratic region.
  This initial substitution assertion is unconditioned: it holds for every recursively extracted initial
    coefficient on every path just described, without prescribing its leading nonzero size.
    At a slower grouping level one repeats the same expansion,
    using its positive ratios and separated smaller real parts.
    Only initial coefficient expansions, clock powers, and clock exponentials occur.
    This observation is essential because infinitely many initial coefficients can occur in the all-order formulas
    for one finite expression.
  #emph[Closure for prepared finite expressions.] Consider an expression tree formed by the allowed operations.
    At each inverse node record the input’s first nonzero coefficient, a lower scalar normalizing it,
    and a fixed disc or contour on which its normalized limit is nonzero.
    At each composition node record the finite limiting arguments and a pair of nested polydiscs inside the
    analyticity domain of the outer function. At each contour or segment integral record a finite cover of the
    fixed integration set. At a preparation or division node use the fixed-circle formulas of Lemma 11.
    Call these finitely many records the preparation data of the expression.
    They are constructed from the bottom of the expression tree upward;
    no inverse is taken before its input has been classified.
  Sums and products preserve Equation (3.11). At an inverse node,
    factor the first nonzero exponential term and invert its coefficient on the recorded unit domain.
    A geometric expansion then gives all coefficients and strict remainder gains.
    At a composition node a bounded family has no nonzero growing exponential term,
    because at an ordinary argument where the first normalized coefficient is nonzero such a term would be
    unbounded. Its full weight-zero coefficient is bounded too, by the same lower normalization argument.
    Expand the outer holomorphic function at that full weight-zero coefficient.
    The remaining argument is exponentially small; a finite Taylor polynomial suffices at each cutoff,
    and the Cauchy remainder on the fixed nested polydiscs has a strictly better exponential order.
    If there is no weight-zero term, use zero as the center. Contour and segment integration preserve the
    estimates on the finite covering patches.
  These rules describe every coefficient by a finite formula.
    At arbitrary coefficient order, that formula can involve derivatives of arbitrarily high order,
    but only powers and derivatives of the #emph[same] prepared denominators,
    and evaluations on the #emph[same] prepared domains. A derivative of a function holomorphic on a fixed
    polydisc is holomorphic on that polydisc; all its Cauchy bounds are available on one fixed smaller polydisc,
    with order-dependent constants. There are only finitely many nodes in the expression tree.
    Choosing nested neighborhoods for these nodes once therefore gives a common ordinary-parameter domain for all
    coefficients. The common initial coefficient domains and the finitely many recorded restrictions give a common
    connected domain in the base as well. Increasing an asymptotic threshold does not change these analytic formulas.
  #emph[The path assertion for those same formulas.] Put the finitely many lower families in the preparation data
    into the charts of Lemma 14, where needed. Specialize $p$ there and impose all their finite domain and
    normalization requirements on lower paths. Such chart substitutions are regular lower operations.
    In the empty lower case they are meromorphic ramified functions of $1 \/ x_1$.
    Lemma 9 gives sectorial convergence of each of the finitely many bounded normalized lower families in the
    preparation data, locally uniformly on the chosen ordinary polydiscs.
    The compact-contour and composition conclusions of that Lemma keep the recorded units nonzero and the recorded
    arguments inside their domains on one common sector. Thus the contour estimates are valid there.
  Every unconditioned initial coefficient, including ones not listed in the preparation data,
    has a clock expansion by the earlier initial substitution argument.
    Every further coefficient is made from these by the finite-expression rules just proved:
    sums, products, ordinary derivatives, evaluations and unit inversions on the prepared domains,
    and fixed integrals. The lower path calculus therefore gives those same coefficient formulas and remainder
    estimates at all orders. Coefficients may unexpectedly vanish on a particular path;
    their formulas and the remainder estimates still hold. This does not require the leading sizes of infinitely
    many coefficients to be preserved. Sectors and thresholds can be narrowed separately at each order.
  #emph[Normalization and the zero-series alternative.] If an expression has a first nonzero coefficient in
    Equation (3.11), normalize that coefficient in $cal(A)'$ and multiply its scalar normalizer by the
    corresponding exponential. Every lower nonzero scalar and its reciprocal is subexponential in $X$,
    so the exponential gap makes the remainder negligible after this normalization,
    locally uniformly on the ordinary polydisc. This supplies (R1).
    The size is an exponential times a lower scalar size; it is divisible up to a positive constant,
    and it and its reciprocal obey the required exponential growth bound.
    Scalar signs and bounded scalar limits follow from the same leading-term calculation.
    Real normalizers follow by reflection and choosing a real component of nonzero leading size.
  If every coefficient is zero as a lower germ, each coefficient vanishes on its entire common connected domain by
    the Identity Theorem. This uses common analyticity, not a common remainder threshold.
    On every path preserving the finite preparation data, the expression therefore has zero clock expansion.
    One remainder estimate gives boundedness on a sector, while estimates of arbitrary order give superexponential
    decay on the central subsector. Lemma 7 makes the expression zero on every such path.
    The path families are submersive by Lemma 14 and the induction hypothesis;
    Lemma 13 consequently makes the expression zero as a domain germ.
    This proves the alternative used to classify inputs before further inversions.
  For finitely many expressions, preserve the finite coefficient normalizations and comparisons just identified.
    The preceding path argument proves (R4) and the claimed clock membership, while the closure rules prove (R3).
    Lemma 12 then supplies scalar roots at the new level for the next induction step.
    The exponential growth bounds have maximum center comparable to $X$, so (R2) also holds.
    The induction is complete. ◻
]

=== 3.6 Eliminating ordinary variables and preserving their limits <eliminating-ordinary-variables-and-preserving-their-limits>

We record the algebraic sign test used to eliminate one ordinary variable.
  Its mechanism is the classical Hermite trace form and sign determination from Tarski queries;
  see #cite(label("PerrucciRoy2017")) arXiv version, Theorem 7 and Proposition 11.
  We include the finite calculation and check its use over our regular scalar field.
  The multivariable path construction remains the one proved above.

#thm([Lemma 3.14.])[
  (Univariate sign elimination).  #emph[For a finite list of real polynomials $P_i \( y \)$ of bounded degrees,
    existence of a real $y$ realizing any specified Boolean combination of their signs is determined by finitely
    many polynomial sign tests in their coefficients. The same tests are valid for polynomial coefficients that
    are real scalar germs in a regular system.]
] <path:sign-elimination>

#proof[
  First separate the finitely many alternatives for degrees and identically zero polynomials.
    Constant signs are already coefficient signs. Let $D$ be the product of the nonconstant polynomials.
    On the real line, every sign pattern is attained at a root of $D$, in a bounded complementary interval,
    or in one of the two unbounded intervals. Rolle’s Theorem gives a root of $D'$ in every bounded interval
    between consecutive distinct roots of $D$; none of the $P_i$ vanishes inside such an interval,
    so all its signs are constant. The two unbounded intervals are tested by degree and leading-coefficient signs.
    It therefore suffices to count sign types at the distinct real roots of $Q = D$ and, when nonconstant, $Q = D'$.
  For $h_i in { 0 \, 1 \, 2 }$, put $P = product_i P_i^(h_i)$, with the zeroth power interpreted as one, and consider
  #[#set math.equation(numbering: n => "(3.12)")
   $ cal(H)_(Q \, P) \( v \, w \) = "Tr"_(bb(R) \[ y \] \/ \( Q \)) \( P v w \) . $ <path:eq-trace-form>]
  The right-hand side is the trace of multiplication by $P v w$. Its signature is
  $ T_h = sum_(a : thin Q \( a \) = 0 \, med a in bb(R))^(upright("distinct")) product_i
    "sign" \( P_i \( a \) \)^(h_i) . $
  To verify this even for repeated roots, decompose the algebra into its local factors.
    At a real root of multiplicity $m$, trace is $m$ times evaluation; nilpotent directions are in the radical,
    and the remaining one-dimensional form has sign $"sign" P \( a \)$.
    At a nonreal conjugate pair, the value coordinates form one complex line viewed as a real plane.
    If $P \( a \) eq.not 0$, the form is a nonzero multiple of $Re \( P \( a \) v w \)$ and has one positive and
    one negative direction; if $P \( a \) = 0$, it is zero. Its signature is therefore zero.
  For a sign $s in { - 1 \, 0 \, 1 }$, its three indicator polynomials are
  $ upright(bold(1))_(s = 0) = 1 - s^2 \, wide upright(bold(1))_(s = 1) = 1 / 2 \( s^2 + s \) \, wide
    upright(bold(1))_(s = - 1) = 1 / 2 \( s^2 - s \) . $
  Multiplying these identities shows that the number of roots of any specified sign type is a rational linear
    combination of the finitely many $T_h$. Its positivity tests existence of that type.
  In a monomial basis the matrix of Equation (3.12) is obtained by rational operations on polynomial coefficients,
    after the leading coefficient of $Q$ is known to be nonzero.
    Its signature is determined by finitely many sign tests: pivot on a nonzero diagonal entry and pass to its
    Schur complement; if the diagonal is zero but an off-diagonal entry is nonzero,
    replace a basis vector by the sum of the corresponding two vectors to obtain a nonzero diagonal pivot.
    A zero matrix ends the procedure. This finite algorithm, with its finitely many pivot alternatives,
    uses only rational functions of the coefficients. Clearing denominators with their recorded signs gives
    polynomial sign tests.
  For scalar germs, factor the polynomials using Lemma 12, fix the order and real or conjugate status of the
    finitely many roots, and restrict the domain base accordingly.
    At every real point of that domain the preceding real-polynomial argument applies,
    with the same sign alternatives. Thus the same finite tests hold as germ statements;
    no transfer principle or additional quantifier-elimination theorem is needed. ◻
]

#proof[
  Apply Proposition 15 to the given lengths. Add the bounded differences between the original lengths and their
    centers to the ordinary variables. Their ultrafilter limits are finite.
    For an initial admissible family, these bounded shifts preserve admissibility:
    a bounded complex shift maps a smaller quadratic region into the original one;
    exponential-polynomial terms transform by ordinary analytic operations;
    and a smaller common fixed-width band remains inside the original common bands.
    Thus its shifted values belong to the regular system of the Proposition.
  There are only finitely many complete sign patterns for the functions in a Boolean formula.
    Choose one realized on a set in $cal(U)$. Translate all ordinary limiting values to zero.
    Normalize every nonzero family by a real scalar, recording its fixed sign.
    A family with nonzero limiting value at zero is a unit of fixed sign on a smaller domain;
    an identically zero family has known sign. For the remaining finite list choose one real direction in which
    every nonzero limiting germ is regular. Such a direction exists:
    the lowest nonzero homogeneous Taylor polynomial of each germ excludes a proper real algebraic subset,
    and a finite union of those subsets does not exhaust the space of directions.
    Complete this direction to a fixed real linear coordinate change.
  Use the last coordinate $y$ in that direction. By Lemma 11,
    each remaining condition is the sign condition of a monic polynomial in $y$,
    multiplied by a unit of fixed sign. At the limit of the remaining ordinary variables its polynomial tends to a
    pure power $y^d$. All its roots therefore tend to zero: if its non-leading coefficients tend to zero,
    the elementary root bound applied outside any fixed disc excludes roots there for sufficiently small
    coefficients. Lemma 16 replaces existence of the designated signs by finitely many coefficient sign tests in
    one fewer ordinary variable. Choose the realizable finite alternative at the distinguished sequence and
    repeat. Each step uses normalization and a fixed generic direction for only its finite list;
    it is an operation of the regular system with finite preparation data.
  Once no ordinary variables remain, all conditions are scalar comparisons on the domain base.
    Lift the choices in the reverse order. The relevant polynomial roots belong to the scalar field by Lemma 12.
    A realizable sign pattern can be attained at a real root, at the midpoint of two consecutive real roots,
    or just beyond an extreme root. For the last choice add or subtract any sufficiently small positive scalar
    infinitesimal. If there are no real roots, take zero; if necessary a positive or negative infinitesimal also
    gives the required constant interval pattern. All roots tend to zero, so every such choice tends to zero.
    Finitely many required neighborhood bounds on units can be imposed when choosing the infinitesimal.
    The previously chosen ordinary variables already have their prescribed limits.
    Repeating the lifting realizes every ordinary variable as a scalar-system element,
    with all signs and limits valid on a domain of the base.
  Now choose a path using the finite uses of these scalar operations,
    the finite normalization and unit requirements, and the additional finite admissible list in the statement.
    This is precisely the finite-data path assertion of Proposition 15.
    Undo the fixed linear coordinate changes and restore the bounded shifts.
    The #emph[actual] coordinates are sums and linear combinations of scalar-system elements on the path, so they,
    and each specified additional function, lie in a real Hardy field by Lemma 8.
    Their derivatives either vanish or have fixed eventual sign.
    Hence these actual coordinates and functions are eventually monotone or constant.
    All their required limits were preserved in the construction. This proves the Theorem. ◻
]

== 4 Augmented inverses and the analytic family <sec:family>

We now reduce the metrics in Theorem 2 to a finite-dimensional family.
  The reduction keeps every kernel and cokernel direction as finite data.
  Uniform estimates across long seams will give a comparison error quadratic in the Ricci size.

=== 4.1 Weighted operators, finite augmentations, and seams <ell:inverses>

The weighted Fredholm framework on cylindrical ends, including exceptional weights and separate weights at
  different ends, was established by Lockhart and McOwen #cite(label("LockhartMcOwen1985")) Theorems 1.1, 6.2,
  and 8.1. The finite-dimensional gluing reductions of Biquard and Ozuch are close precedents for keeping the
  obstruction variables #cite(label("Biquard2011")) arXiv version,
  Proposition 8.1 #cite(label("Ozuch2022II")) arXiv version, Theorem 4.6.
  We prove the disconnected and seam estimates below in the precise weights and finite trace spaces required for
  the later complex continuation.

Choose

$ q_0 = 1 + 1 / 2 #scale(x: 120%, y: 120%)[\(] min \( q \, 2 \) - 1 #scale(x: 120%, y: 120%)[\)] \, wide q_1 = 1 /
  2 \( 1 + q_0 \) \,\
lambda = 1 \/ n < 1 / 100 min \( mu \, 1 \) \, wide nu = lambda \/ 4 \, quad nu' = lambda \/ 2 \, quad gamma_g =
  2 lambda . $

Here $n$ is an integer chosen once. Decrease $mu$ first if necessary to account for any previous weakening of the
  end estimates. We use metric Sobolev order $k = 8$, orders $6$ through $9$ when taking traces or variations,
  and one additional vector order for the gauge. There is ample room in the assumed derivative bounds for these choices.

On an end use the cylindrical measure $d tau thin d theta$ and derivatives $partial_tau$ and angular derivatives.
  For metric tensors let $X_gamma^k$ be the sum of the ordinary core $H^k$ norms and the $H^k$ norms of
  $e^(gamma tau) U$ on joined ends, together with the root norm of $r^(q_0) U$.
  Components are Cartesian components in vertex units. For a displacement vector use $V \/
  r$ in the same definition. A second-order source space $Y_gamma^(k - 2)$ has two fewer derivatives and includes
  multiplication of the equation by the square of the local length scale;
  for vectors use also the normalization by $r$. These conventions make all coefficients bounded on fixed-size
  cylindrical coordinate patches. Finite dimensional unknowns and tests carry fixed Euclidean norms.

Replace $h$ by a smooth background $b = b_H$ which agrees with $h$ up to a large fixed $tau =
  H$ and is exactly flat for $tau gt.eq H + 1$; make the corresponding fixed truncation of the root end.
  The background has no length dependence in vertex coordinates.
  Its defect tends to zero in the indicated spaces as $H arrow.r oo$.

The vector operator is the linearized tension of the identity map with both metrics equal to $b$.
  The metric operator is the linearization of

#[#set math.equation(numbering: n => "(4.1)")
 $ P_b \( g \) = "Ric" \( g \) - 1 / 2 cal(L)_(W_b \( g \)) g \, wide W_b \( g \)^i =
   g^(j k) #scale(x: 120%, y: 120%)[\(] Gamma \( g \)_(j k)^i -
   Gamma \( b \)_(j k)^i #scale(x: 120%, y: 120%)[\)] . $ <ell:deturck>]

The principal part of $P_b$ is $- 1 / 2 g^(a b) partial_a partial_b g_(i j)$:
  the two derivatives of the divergence of $g$ cancel. On a flat end both linear operators are component
  Laplacians, up to a fixed nonzero factor.

#thm([Lemma 4.1.])[
  (Disconnected augmented inverses).  #emph[There are finitely many fixed smooth core-supported sources and
    finitely many fixed linear tests on core compact sets such that each disconnected operator,
    augmented by these sources and tests, is an isomorphism $X_gamma^k xor bb(R)^a arrow.r
    Y_gamma^(k - 2) xor bb(R)^b$. The same choices work for the selected orders and nearby sufficiently small
    positive joining weights. They work for $b_H$, with uniformly bounded inverse, when $H$ is sufficiently large.]
] <ell:disconnected-inverse>

#proof[
  For a spherical harmonic of degree $ell$, a harmonic Cartesian component has radial powers $r^ell$ and
    $r^(- ell - 2)$. Thus the exponents in $e^(kappa tau)$ are
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Components
], table.cell(rowspan: 1, colspan: 1)[Punctured end
], table.cell(rowspan: 1, colspan: 1)[Exterior end
]),
  table.cell(rowspan: 1, colspan: 1)[Metric
], table.cell(rowspan: 1, colspan: 1)[$- ell \, med ell + 2$
], table.cell(rowspan: 1, colspan: 1)[$ell \, med - ell - 2$
],
  table.cell(rowspan: 1, colspan: 1)[Normalized vector $V \/ r$
], table.cell(rowspan: 1, colspan: 1)[$1 - ell \, med ell + 3$
], table.cell(rowspan: 1, colspan: 1)[$ell - 1 \, med - ell - 3$
],
)
]
  Restrict these lists to the equivariant degree spaces. The chosen weights avoid every exponent,
    on the joined ends and on the root. After factoring a harmonic channel into two first-order factors,
    integrate each factor toward the end where its weighted exponential decays.
    Partial fractions supply a divisor $\| kappa_1 - kappa_2 \| = 2 \( ell + 1 \)$.
    Except in the finitely many lowest channels, the weighted kernels are bounded by
  #[#set math.equation(numbering: n => "(4.2)")
   $ frac(C, 1 + ell) exp { - c \( 1 + ell \) \| tau - tau' \| } . $ <ell:kernel-bound>]
  The finitely many other channels have a positive gap fixed by the weight.
    Integration and the equation give two derivatives of gain:
    the kernel $L^1$ norm is $O \( \( 1 + ell \)^(- 2) \)$, and differentiation uses one power of $1 +
    ell$ per derivative. Summing squared harmonic coefficients proves the Sobolev estimate.
  Cut off these full-cylinder inverses on the ends and combine them with local interior elliptic parametrices on
    the compact cores. Commutators have one derivative less than the operator;
    after restriction to a compact set their errors are compact by the Rellich theorem.
    The difference between the actual and flat operators has arbitrarily small norm sufficiently far along each
    end. This gives both a left and a right parametrix modulo compact operators and a small operator,
    hence a Fredholm operator. Choose core tests separating its finite-dimensional kernel.
    Compactly supported sources are dense in the source space,
    so finitely many such sources span its finite-dimensional cokernel;
    enlarge the designated core to contain their supports. Splitting off kernel and cokernel shows directly that
    adding these sources as unknowns and adjoining the tests gives a bijection.
    The bounded inverse theorem gives the estimate.
  The kernels and cokernels are unchanged when a small positive weight moves without crossing a root.
    On flat half-ends this follows by separating modes; for the original decaying coefficient perturbation,
    the same argument bootstraps decay up to the next root. This permits common choices at the finitely many
    weights. Elliptic regularity makes the inverses agree at the different Sobolev orders.
    Finally, the operator difference for $b_H - h$ tends to zero:
    the same weight is present on input and output, and all scale-normalized coefficient differences and their
    needed derivatives tend to zero. If $C_0$ bounds the chosen inverses,
    choose this difference below $\( 2 C_0 \)^(- 1)$ and apply the Neumann series.
    The new inverse norm is at most $2 C_0$. ◻
]

At a finite seam match the value and the opposite normal $tau$-derivatives of the normalized components.
  Also specify the common value in the critical spherical channel:
  degree zero for metrics and degree one for vectors. In problems with jumps use the parent-side value for this
  last test. For a vector, $V \/ r = V_(upright("phys")) \/ rho$ in both charts,
  so these conditions match the physical vector and its first derivatives.
  The opposite normal signs are forced by $tau_p + tau_c = 2 L_e$.

#thm([Lemma 4.2.])[
  (Uniform inverse with finite seams).  #emph[Adjoin these seam data to the disconnected augmentations.
    For all sufficiently large real lengths the resulting piecewise problem is an isomorphism,
    uniformly in the lengths. Its data norms at an edge are $e^(gamma L_e)
    H^(k - 1 \/ 2)$ for value jumps and critical tests and $e^(gamma L_e) H^(k - 3 \/ 2)$ for derivative jumps.
    The assertion includes any partial disconnection of the tree, with the tests and matching omitted on opened edges.]
] <ell:seam-inverse>

#proof[
  Extend the source from each finite half boundedly across its endpoint to the corresponding infinite end,
    and apply Lemma 17. We correct the resulting seam errors by all nondecaying modes,
    not just strictly growing ones. In a noncritical metric channel the incoming roots are $alpha = ell +
    2$ on the point side and $beta = ell$ on the exterior side.
    For vectors they are $alpha = ell + 3$ and $beta = ell - 1$. The vector degree-zero channel is absent:
    an invariant constant vector would give a fixed point on $S^3$ for every nonidentity element of a nontrivial
    freely acting group.
  Normalize incoming amplitudes at the seam. The leading map to value and derivative jumps is
  $ binom(A - B, alpha A + beta B) \, wide mat(delim: "(", 1, - 1; alpha, beta) \, wide det = 2 \( ell + 1 \) . $
  This inverse has exactly the orders required by the two trace spaces.
    In a critical channel there are a point-side constant, a point-side growing mode,
    and an exterior-side constant. For their amplitudes $\( A \, B \, C \)$ the three data are
  #[#set math.equation(numbering: n => "(4.3)")
   $ \( A + B - C \, med kappa B \, med A + B \) \, wide mat(delim: "(", 1, 1, - 1; 0, kappa, 0; 1, 1, 0) \, quad
     kappa = 2 upright(" or ") 4 . $ <ell:critical-matrix>]
  Its determinant is $kappa eq.not 0$.
  Cut each incoming wave $A e^(kappa \( tau - L_e \))$ off before the fixed core.
    Correct its equation error there with the disconnected inverse.
    This makes a globally homogeneous augmented-equation variation,
    with its accompanying finite source coefficients. A unit weighted seam amplitude has core error
    $O \( e^(- gamma L_e) \)$ for a constant wave and still smaller error for a growing wave.
    On another far end the correction is a decaying homogeneous sum,
    whose first allowed decay has a strict gap beyond $gamma$.
    Thus its weighted seam traces tend to zero, including when the receiving edge has a different length.
    The factor $e^(- \( 1 + ell \) \( L_e - H \))$ controls all higher harmonics.
    The full trace map is therefore a vanishing-norm perturbation of the preceding block maps, and is invertible.
  For completeness, a homogeneous solution has on each flat half a sum of incoming and outgoing modes.
    Subtract the corrected incoming waves with its incoming coefficients.
    The remainder continues with decay on the disconnected ends and has zero core tests,
    so the disconnected inverse makes it zero. The trace orders of these coefficients follow from Cauchy data and
    the root gap. This proves injectivity as well as the stated bound.
    The construction never uses an edge that has been opened, proving the partial-disconnection assertion.
    Piecewise $H^k$ is sufficient; no higher normal matching is imposed in advance. ◻
]

=== 4.2 Complex lengths and a small analytic family <ell:complex-family>

#thm([Lemma 4.3.])[
  (Contours and complex inverses).  #emph[For some $A \, c_0 > 0$ the inverse of Lemma 18 continues to
#[#set math.equation(numbering: n => "(4.4)")
 $ Re L_e > A \, wide \| Im L_e \| < c_0 \( Re L_e \)^2 . $ <ell:quadratic-domain>]

 The field norm is measured on increasing-real-part contours.
   One strengthens the source norm on the portion $u gt.eq Re L_e \/
   5$ and the seam norm by a fixed polynomial in $1 + Re L_e$. With these norms the inverse is uniform.
   The same assertion holds for opened ends continued along such contours and for every partial disconnection.]
] <ell:complex-inverse>

#proof[
  Write $ell_e = Re L_e$ and choose a fixed smooth function $chi$ which is zero on $\( - oo \, 1 \/ 3 \]$ and one
    on $\[ 9 \/ 10 \, oo \)$. Use
  $ tau \( u \) = u + i \( Im L_e \) chi \( u \/ ell_e \) \, wide u lt.eq ell_e . $
  It is real before $ell_e \/ 3$, has endpoint $L_e$, and has $tau' = 1$ near the endpoint.
    Its derivatives satisfy $\| tau' \| lt.eq C \( 1 + ell_e \)$, $\| tau^(\( j \)) \| lt.eq
    C_j \( 1 + ell_e \)^2$ for each of the fixed orders used here, and $\| tau' \| gt.eq 1$.
    All bends lie in the exactly flat region after increasing $A$.
  For a real root $kappa$,
  $ \| e^(kappa \( tau \( u \) - tau \( u' \) \)) \| = e^(kappa \( u - u' \)) . $
  Thus Equation (4.2) remains valid in modulus. The integration element $d
    tau'$ and finitely many $u$ derivatives cost only a polynomial in $1 + ell_e$.
    The root gap still gives the two derivative gain, with local terms controlled by the equation.
    Fix the polynomial exponent by bounding each differentiation, product, trace,
    and extension appearing in this proof by its elementary polynomial degree,
    and choosing $P$ to be one plus the sum of those finitely many nonnegative degrees.
    Only the fixed Sobolev orders enter this choice; no asymptotic expansion order enters it.
    Choose a fixed smooth cutoff $chi_0$ equal to zero for $u lt.eq 1 \/ 6$ and to one for $u gt.eq 1 \/ 5$,
    and put $chi_(ell_e) \( u \) = chi_0 \( u \/ ell_e \)$. On this half use the strengthened source norm
  $ parallel f parallel_(Y_gamma^(k - 2)) + \( 1 + ell_e \)^P parallel chi_(ell_e) f parallel_(Y_gamma^(k - 2)) \, $
  and multiply the seam-data norms by $\( 1 + ell_e \)^P$. The first summand retains control through the
    transition. Indeed, decompose $f = \( 1 - chi_(ell_e) \) f + chi_(ell_e) f$.
    The first source is supported where $u lt.eq ell_e \/ 5$,
    and its Sobolev norm is bounded by the basic source norm, since the cutoff derivatives are uniformly bounded.
    Every transfer from its support to the bend, which starts at $ell_e \/ 3$,
    gains $e^(- delta_0 \( 2 ell_e \/ 15 \))$ for a fixed weighted root gap $delta_0 > 0$;
    this pays any polynomial contour loss. On the unbent portion there is no such loss.
    The second summand of the strengthened norm pays the polynomial losses for the remaining source.
  To use a disconnected core inverse, solve forced data in the flat part by these kernels,
    cut that solution off on a real collar, and apply the real disconnected inverse to the remaining compact
    error. Its decaying homogeneous far field is continued by the same exponentials.
    This also constructs the inverse on an opened end with a bend followed by a return to the real ray farther
    out. If a bend starts increasingly far out, a cutoff for the forced solve can be moved with it inside the flat
    region. The real core estimate remains the fixed estimate, and the flat estimates are unchanged.
    This proves the needed uniformity for such bends.
  Extend finite-half data through the seam and apply this disconnected construction.
    Correct traces by the incoming modes from Lemma 18. They have polynomially bounded norms relative to their
    weighted seam amplitudes. Their leading trace matrices are unchanged because $tau' = 1$ at the endpoint.
    The core correction is exponentially small. Its outgoing homogeneous traces at every receiving seam have a
    strict extra decay rate, absorbing the polynomial at that receiving length.
    For the initially forced solution, data before $ell_e \/ 5$ reach the seam with exponential gain;
    data after that point have the strengthened norm on that very end.
    Increase $P$ once to pay the subsequent trace correction as well.
    This proves a uniform bound and a vanishing perturbation of the block trace map.
    The same representation proves injectivity.
  Finally, a coefficient perturbation with size $O \( e^(- sigma u) \)$ is small in the strengthened operator norm
    on a bent region, since $\( 1 + ell_e \)^P e^(- sigma ell_e \/ 5) arrow.r 0$.
    Small perturbations on the remaining real portions are handled by the real inverse.
    A Neumann series proves the perturbative version that will be used below.
    This argument is unchanged if any subset of the ends is left open. ◻
]

Here and below “uniform” permits increasing the fixed lower length threshold.
  The choices have the following order, which avoids a circular truncation requirement.
  Fix weights, derivative orders, the augmented operators at $h$, and their inverse bound $C_0$.
  Fix a contraction radius $delta > 0$ so that the product and inverse constants give a nonlinear Lipschitz
  constant at most $1 \/ 4$ on the $2 delta$ ball. Choose $H$ so that the operator perturbation is below
  $\( 2 C_0 \)^(- 1)$ and the reference defect is below $delta \/ \( 8 C_0 \)$.
  Choose the finite parameter radius so that its additional defect has the same bound.
  Finally choose $A > 10 \( H + 1 \)$ large enough that all trace perturbations have norm at most $1 \/
  4$ and that the required polynomial times exponential bounds hold.
  The finite number of partial disconnections permits the same choices for all of them.
  The inverse constants used to choose $delta$ are uniform in $H$ by Lemma 17.
  The scale-normalized tensors $b_H$ have a uniform positive-definite lower bound, and $b_H$,
  $b_H^(- 1)$ and their derivatives through the fixed orders used here have bounds independent of $H$:
  the transition uses a fixed-width cutoff translated into regions where $h$ approaches $delta$.
  Consequently the local product and inverse-matrix constants used to choose $delta$ are independent of $H$ as
  well. No new smallness radius is chosen after increasing the expansion order.

#thm([Lemma 4.4.])[
  (Gauge for the real sequence).  #emph[After a diffeomorphism of the invariance class in Lemma 1,
    each sufficiently late metric in the sequence satisfies
#[#set math.equation(numbering: n => "(4.5)")
 $ W_b \( g \) = m dot.op psi \, $ <ell:gauge-equation>]

 where $psi$ is the finite list of vector augmentation sources, rescaled in physical units, and $m$ is small.
   The gauged metric retains Equation (2.3) in weaker admissible weights and is close to $b$ at the joining weight
   $gamma_g$.]
] <ell:gauge>

#proof[
  Solve for a map $f : \( N \, g \) arrow.r \( N \, b \)$ near the identity with $tau \( f \; g \, b \) = -
    m dot.op psi \( f \)$. Parametrize it by the background exponential map of a displacement $V$,
    and impose zero core and critical-seam tests on $V$. The derivative in $\( V \, m \)$ is the augmented vector
    isomorphism. On every coordinate patch of scale $r$, this is the ordinary tension equation with bounded smooth
    target coefficients. Sobolev multiplication at the chosen orders, with locally comparable weights,
    bounds its quadratic remainder and its Lipschitz difference.
    The uniform inverse and the smallness of $g - b$ give a contraction.
    The latter smallness follows from compact convergence and the integrable dominating tail
    $e^(- \( mu - gamma_g \) tau)$; the root argument uses $q - q_0 > 0$.
  Smallness of $V \/ r$ in scaled $C^1$ makes the entire displacement isotopy locally invertible.
    It is proper, since the displacement is small relative to radius and decays on the root,
    so it is a degree-one covering and hence a diffeomorphism.
    The equation in the image metric reads $- W_b \( f_(*) g \) = - m dot.op psi$.
    Seam matching of $V \/ r$ and its first derivatives gives a genuine solution across the seam;
    the smooth equation then supplies the higher compatibility.
    At infinity $V = O \( r^(1 - q_0) \)$, which is admissible for Lemma 1.
    Small scaled coordinate changes preserve the end estimates after decreasing exponents. ◻
]

We now write $g$ for the gauged metric. Choose the metric augmentation sources $phi$ from Lemma 17 and solve

#[#set math.equation(numbering: n => "(4.6)")
 $ P_b \( h_(*) \) + 1 / 2 cal(L)_(m dot.op psi) h_(*) = d dot.op phi \, wide h_(*) = b + U . $ <ell:family-equation>]

We make the scaling of the augmentation sources explicit.
  On a vertex of physical length $a_v$, let $D_(a_v) \( x \) =
  a_v x$ denote passage from vertex to physical coordinates.
  A vector source in the tension equation has physical components $a_v^(- 1) psi_v$:
  its pullback as a vector field is $a_v^(- 2) psi_v$. A covariant two-tensor source has physical components
  $a_v^(- 2) phi_v$, so $D_(a_v)^(*) phi_(upright("phys")) = phi_v$.
  Consequently, writing $k_v$ for a metric in vertex coordinates,

$ D_(a_v)^(*) #scale(x: 120%, y: 120%)[\(] cal(L)_(m psi_(upright("phys"))) k_(upright("phys"))
  #scale(x: 120%, y: 120%)[\)] = cal(L)_(m psi_v) k_v quad upright("when ") D_(a_v)^(*) k_(upright("phys")) =
  a_v^2 k_v . $

These are equation-source scalings; a displacement itself scales as $a_v V_v$.
  With these conventions the normalized bulk equations and core tests have no length dependence.

Here $d$ is an unknown finite vector. The core test values for $U$, the vector $m$,
  and the coefficients of the critical seam values

#[#set math.equation(numbering: n => "(4.7)")
 $ pi U \|_e = e^(- lambda L_e) z_e $ <ell:seam-prescription>]

make up a finite parameter vector $z$. Values and first derivatives genuinely match on every remaining seam.
  On an opened edge omit its matching and its critical prescription.

#thm([Lemma 4.5.])[
  (Analytic small branch).  #emph[On a fixed complex polydisc in $z$ and the quadratic length domain of
    Equation (4.4), Equation (4.6) has a unique small solution $\( U \, d \)$.
    It obeys uniform bounds at both joining weights $nu$ and $nu'$.
    Its augmented linearization has the same uniform inverse bounds.
    These assertions hold for every partial disconnection on common smaller domains.
    The family, its compact observables, and its endpoint values are single-valued holomorphic functions of the
    length parameters.]
] <ell:analytic-family>

#proof[
  On cores, inverse metric matrices and the tensor operations in Equation (4.6) are analytic in $U$ near zero;
    the fixed spatial coefficients need only be smooth. On an exactly flat end, in neutralized Cartesian components,
  #[#set math.equation(numbering: n => "(4.8)")
   $ cal(P) U = cal(N) \( U \) \, $ <ell:flat-equation>]
  where $cal(P)$ is the flat cylindrical component Laplacian and $cal(N)$ vanishes to second order.
    Its Taylor operations contain at most two derivatives and have polynomial angular coefficients.
    Indeed $r partial_(x_i)$ is a combination of $partial_tau$ and tangential derivatives with polynomial
    coefficients in the unit Cartesian coordinates. Consequently finite angular harmonic sums remain finite at
    each Taylor order.
  Apply Lemma 19 to the equation and all tests. A quadratic term has one additional factor of decay relative to
    the source weight. Its basic source norm is bounded by $C delta^2$,
    and the additional strengthened contribution is bounded by
  $ C delta^2 \( 1 + ell_e \)^P e^(- nu ell_e \/ 6) \, $
  because the cutoff support lies in $u gt.eq ell_e \/ 6$. For differences the corresponding bound replaces
    $delta^2$ by $delta parallel U - V parallel_(X_nu^k)$. Taking the supremum over $ell_e$ gives constants
    independent of the truncation and of all other lengths. The seam data have size at most a polynomial times
    $e^(- \( lambda - nu \) ell_e) \| z_e \|$. The order of choices stated above makes the equation a uniform
    contraction, at both $nu$ and $nu'$. Uniqueness identifies the solutions.
    A Neumann series around the augmented linear operator proves invertibility of the branch linearization.
    Analytic convergence of the contraction proves analyticity in ordinary parameters and in local holomorphic
    variations of endpoints on a fixed contour.
  We specify why this is analyticity in $L$, despite a smooth rather than holomorphic global choice of contours.
    In a local parametrization of a flat contour, a holomorphic endpoint change changes the coefficients
    analytically through $partial_tau = \( d tau \/ d u \)^(- 1) partial_u$.
    For an infinitesimal parametrization change $v \( u \) = delta tau \( u \)$ fixing the endpoints,
    the candidate variation $v partial_tau U$ satisfies the differentiated equations.
    The normal operator varies by $delta partial_tau = - \( partial_tau v \) partial_tau$, so
  $ delta \( partial_tau U \) = partial_tau \( v partial_tau U \) - \( partial_tau v \) partial_tau U =
    v partial_tau^2 U . $
  Thus $v = 0$ at each endpoint preserves both matching conditions and the critical-value tests;
    on the fixed core portions it also preserves the core tests.
    This variation belongs to $X_nu^(k - 1) = X_nu^7$. The lower-order inverse already supplied by Lemmas 17–19
    uses the same sources and tests, with value and critical traces in $H^(13 \/ 2)$ and normal traces in
    $H^(11 \/ 2)$. The same small-perturbation argument gives this inverse for the branch linearization.
    Its uniqueness therefore identifies $v partial_tau U$ with the actual solution variation,
    with zero variation of the compact unknowns. Integrating it through a homotopy shows contour independence
    where the coordinate is fixed. Monotone-real-part contours with fixed endpoints are deformable through the
    same class; this identifies the local holomorphic continuations and excludes monodromy.
    For an open end take a bend returning to the real ray; deformations are compactly supported in its flat
    region. Tail limits on the unchanged ray are consequently unchanged.
    An autonomous analytic density integrated with $d tau$ changes by the endpoint term $v$ times that density,
    and therefore its integral is also invariant under fixed-endpoint deformations.
    The same shape calculation applies to linearized solutions. ◻
]

#thm([Lemma 4.6.])[
  (Comparison with the actual metric).  #emph[Choose $z$ from the core tests and gauge coefficients of $g$,
    and from Equation (4.7) at its seams. Then
#[#set math.equation(numbering: n => "(4.9)")
 $ parallel g - h_(*) parallel_(X_nu^k) lt.eq C M \, wide parallel "Ric" \( h_(*) \) parallel_(Y_nu^(k - 2)) lt.eq
   C M \, wide \| E \( g \) - E \( h_(*) \) \| lt.eq C M^2 . $ <ell:comparison-estimates>]

]
] <ell:comparison>

#proof[
  The seam parameters are small because $g - b$ has weight $gamma_g > lambda$.
    All parameters lie strictly inside the chosen small polydisc by taking the truncation and sequence thresholds
    sufficiently large. In the gauge Equation (4.5), the actual metric solves Equation (4.6) with $d =
    0$ and the extra source $"Ric" \( g \)$. Its source norm is $O \( M \)$ by Equation (2.3).
    Subtraction and the uniform inverse, absorbing the small nonlinear Lipschitz term, prove the first estimate,
    including the difference in compact unknowns. The local Ricci map from $X_nu^k$ to $Y_nu^(k - 2)$ is Lipschitz
    on the small ball, proving the second estimate.
  Along the segment from $g$ to $h_(*)$ the Ricci source and the metric variation are both $O \( M \)$.
    In the interior the pairing in Equation (2.5) costs integrals of $rho^2$ against products of the joining
    weights; these are bounded by the scale calculation in Lemma 1.
    On the root the radial integral is $integral r^(1 - 2 q_0) thin d r < oo$.
    Integrating the first variation proves the third estimate. ◻
]

Define real functions on the real family by

#[#set math.equation(numbering: n => "(4.10)")
 $ F = E \( h_(*) \) \, wide J = integral \| "Ric" \( h_(*) \) \|_(h_(*))^2 thin d mu_(h_(*)) +
   integral_(upright("root end")\
r > r_0) r^(2 q_1) \| "Ric" \( h_(*) \) \|_delta^2 thin d x . $ <ell:observables>]

For complex metrics the squares are analytic bilinear contractions, without complex conjugation.
  These give bounded holomorphic continuations of $F \, J$ on the quadratic domains.
  For $F$, integrate the quadratic subtracted scalar density on a fixed root tail and retain its linear boundary
  contribution at $r_0$. For $J$, the root weighted radial bound is $integral r^(2 q_1 - 2 q_0 - 1) thin d r <
  oo$. Interior Ricci-square integrals are scale invariant in dimension four and integrable in cylindrical
  measure. Scalar-volume integrals carry the factor $a_v^2 r^2$:
  on a child half this is $a_p^2 e^(- 4 L_e) e^(2 tau)$, whose modulus stays bounded.
  Every contour polynomial is absorbed by the available exponential decay. On the approximants in Lemma 22,

#[#set math.equation(numbering: n => "(4.11)")
 $ 0 lt.eq J lt.eq C M^2 . $ <ell:J-small>]

== 5 Tail expansions and prescribed growth <ell:tail-calculus>

Bounded holomorphy alone does not allow the application of Theorem 4.
  We prove the all-order expansion and common-domain assertions needed there.
  All expansions below are finite to each requested precision.
  An infinite formal power-logarithm sum is never used as an inverse or a solution.

#prodef([Definition 5.1.])[
  (Tail expansion to finite precision).  On an opened joined-type end, a field has an integer tail if,
    for each nonintegral rate $B$, it can be written
  #[#set math.equation(numbering: n => "(5.1)")
   $ Y \( tau \, theta \) = sum_(l < B) e^(- l tau) sum_(j = 0)^(d_l) tau^j Y_(l j) \( theta \) +
     Y_(> B) . $ <ell:tail-series>]
  Here $l in bb(Z)$. There is a lower bound for $l$, each $Y_(l j)$ is a finite equivariant spherical harmonic
    sum, and the sum is finite. The remainder belongs to the cylindrical Sobolev space with any fixed weight
    strictly below $B$. A bound to finite precision controls the finitely many displayed coefficients and that
    remainder norm. Polynomial contour costs can be paid by a strictly smaller remainder rate.
    For a growing field this is a bound after subtraction of the finite nondecaying tail;
    it is not a bound on the unsubtracted field at infinity.
] <ell:tail-definition>

The extraction of homogeneous exponential terms when a weight crosses an indicial root is part of the classical
  change-of-weight method #cite(label("LockhartMcOwen1985")) Section 5.
  Here the componentwise flat operators allow an explicit polynomial calculation,
  including the resonant logarithmic terms.

#thm([Lemma 5.2.])[
  (Constant-operator tail improvement).  #emph[Let $cal(P)$ be either flat operator above.
    Suppose a field has a finite growth bound and its source has an expansion to rate $B$,
    where the intermediate remainder weights avoid the indicial roots.
    Then the field has an expansion to that rate, with free homogeneous coefficients recorded at the crossed
    roots. Estimates involve the source coefficients and remainder, a fixed inner trace,
    and the previous growth bound. They are uniform on the contours of Lemma 19,
    with an arbitrarily small loss in a strictly available exponential rate.]
] <ell:flat-tail>

#proof[
  In one angular channel, apply $\( partial_tau - kappa_1 \) \( partial_tau - kappa_2 \)$ to $e^(- l tau)
    p \( tau \)$. It gives $e^(- l tau)$ times a constant coefficient differential operator on the polynomial $p$.
    If $- l$ is not a root, this is invertible on polynomials of a given maximum degree by a triangular
    coefficient calculation. If $- l$ is a root, integrate one polynomial factor, increasing the degree by one;
    prescribe zero constant term for that primitive and record the omitted constant as a free homogeneous
    coefficient. The roots are distinct, so this exhausts resonance.
    Only finitely many angular channels occur in the forced finite sum.
  Subtract these primitives. Extend the remaining forcing by a fixed cutoff to a full-cylinder source and solve it
    by the root kernels at a new noncritical weight. The difference from the original field is homogeneous on the
    tail. The previous growth bound excludes roots growing faster than it permits;
    the roots between the old and new weights are recorded explicitly.
    The remaining faster-decaying homogeneous modes are bounded by the inner trace,
    using the exponential root gap and summing their squared coefficients.
    This proves both the improvement and its estimate. The kernel calculation on contours is the one in Lemma 19;
    polynomial losses are absorbed by decreasing the remainder weight within its strict gap.
    No parameter-dependent global inverse at the new weight has been invoked. ◻
]

#thm([Lemma 5.3.])[
  (Nonlinear tails and finite prescribed growth).  #emph[The small solution of Lemma 21 on every partial
    disconnection has integer tails with only $l > 0$. Its augmented linearization, denoted $cal(A)_U$,
    can be solved for a source with a finite-growth integer tail,
    with arbitrary finitely supported prescriptions of free homogeneous coefficients in the nondecaying indicial
    channels. Unspecified coefficients are zero, so the prescribed growth has a finite maximum.
    The result has an integer tail; its growth does not exceed the maximum of zero, the forced growth,
    and the prescribed growth, apart from polynomial factors.
    The solution is unique with these prescriptions and the other augmented data.
    Estimates to any fixed finite precision are linear in the data,
    with constants allowed to depend on that precision and growth.
    Every finite tail coefficient depends analytically on the parameters on one common domain.]
] <ell:prescribed-tails>

#proof[
  First consider the small nonlinear solution. Its initial positive-weight estimate and Equation (4.8) give a
    source at twice a slightly weaker positive decay rate. Apply Lemma 24.
    Suppose finitely many powers have already been extracted and the remainder has positive rate $B$.
    In the difference between the nonlinear expression and its finite Taylor expansion,
    every occurrence of that remainder is multiplied by a field or derivative with a fixed positive decay rate.
    The analytic Taylor remainder is controlled by Sobolev multiplication,
    since $H^k$ is an algebra at the chosen orders. Consequently the next source remainder has rate at least $B +
    epsilon.alt$ for one fixed sufficiently small $epsilon.alt > 0$,
    using intervening noncritical weights when needed. This improves indefinitely.
    The initial roots are integers; Taylor products add their degrees.
    The angular property in Lemma 21 makes each resulting coefficient a finite harmonic sum.
    The original positive decay excludes all nonpositive degrees.
    This proves the first assertion, including estimates on the complex contours.
  On an opened end the linearization is $cal(A)_U = cal(P) + cal(B)_U$,
    where the coefficients of the differential operator $cal(B)_U$ have positive integer tails and decay.
    Start at the most growing required power of the desired solution.
    Use the polynomial primitives in Lemma 24 to cancel it. Multiplication by $cal(B)_U$ improves the degree by a
    positive integer, so the recursion is triangular in degree.
    At each indicial channel fix the log-free homogeneous coefficient to be its prescribed value;
    use the zero-constant polynomial primitive for the forced part.
    Continue through finitely many degrees until the residual decays strictly faster than the basic weight $nu$.
    This constructs a finite sum $T$, with no growth greater than the allowed maximum.
  Choose a fixed cutoff $zeta$ supported on the opened end and equal to one sufficiently far out.
    With all finite seam data, core tests, and compact source unknowns included in $cal(A)_U$, set
  #[#set math.equation(numbering: n => "(5.2)")
   $ Y = zeta T + cal(A)_U^(- 1) #scale(x: 120%, y: 120%)[\(] f -
     cal(A)_U \( zeta T \) #scale(x: 120%, y: 120%)[\)] . $ <ell:finite-growth-inverse>]
  The term in parentheses is in the basic decaying source space.
    The inverse is exactly the inverse already constructed in Lemma 21.
    No smallness of $T$ or of this source is required: this is a linear solve.
    The correction decays and cannot change any prescribed nondecaying coefficient.
    Applying Lemma 24 to its equation, and using the coefficient tails of $cal(B)_U$, obtains all further orders.
    If two solutions have the same data, their difference has no nondecaying tail,
    hence belongs to the basic decaying space and vanishes by its inverse.
    This proves uniqueness and the growth assertion.
  All steps in Equation (5.2) are finite polynomial operations, fixed cutoffs,
    and the same analytic inverse family. A leading coefficient can alternatively be extracted by multiplying the
    tail by its leading exponential and removing its known polynomial terms, then taking its limit at infinity.
    The remainder estimates are locally uniform in the parameters, so these limits are holomorphic.
    Repeat only finitely many times for any requested coefficient.
    The parameter domain never shrinks as the precision or prescribed growth increases;
    only estimates and a convenient tail-start threshold may change.
    In particular, a cutoff moved farther out on an opened infinite end does not change the admissible range of
    another edge’s finite length. ◻
]

#thm([Lemma 5.4.])[
  (Triangular auxiliary equations).  #emph[Lemma 25 applies successively to every finite system appended to the
    small solution in which each equation has diagonal operator $cal(A)_U$ and source given by Taylor differential
    operations on earlier fields. Allow finite growth at already opened ends,
    and free asymptotic conditions depending polynomially on finitely many earlier tail coefficients.
    On still-finite seams impose homogeneous matching and zero added critical tests.
    Require that sources on those halves have at least two decaying factors,
    counting the base field and its derivatives. On opening a new pair of ends, start with decay there.
    The resulting fields and the inverse of the triangular linearization have uniform finite-precision bounds and
    the same analytic parameter domain.]
] <ell:triangular>

#proof[
  Solve the equations in their given order by Equation (5.2).
    Products of finitely many fields with finite growth still have finite growth.
    Forced nondecaying coefficients are determined by the equation;
    only the free indicial constants are prescribed. Thus a forced power is never incorrectly set to zero by an
    asymptotic boundary condition. Conditions involving earlier coefficients are known data at the relevant step.
    On a finite bent end the two decaying factors supply the exponential surplus needed to pay the polynomial
    strengthening on that same end. Linearizing the finite triangular system leaves $cal(A)_U$ on every diagonal,
    so induction gives its inverse as well.
  At a newly opened end every earlier field initially decays.
    The off-diagonal coefficients of this linearization therefore decay there.
    This fact will preserve the leading incoming mode calculation when this end is closed again.
    On older opened ends the off-diagonal coefficients can grow,
    but their growth is finite and is handled at each successive step.
    Arbitrarily large bounds for a finite auxiliary field do not affect the smallness of the base metric or the
    domain of its inverse. This proves all the assertions. ◻
]

== 6 Expansion in one length <ell:length-expansion>

Fix an edge length $L$ that is still finite. Open that edge, retaining all other lengths and ordinary parameters.
  Let $Y_0$ denote the resulting solution, including compact unknowns and any finite triangular system already
  appended. At the two new ends it is initially decaying. We will close those ends by adding finitely many terms
  of the form

#[#set math.equation(numbering: n => "(6.1)")
 $ e^(- p L) L^j Y_(p j) . $ <ell:length-terms>]

The coefficient fields are solutions of the disconnected triangular linearization.
  They may grow at the two new ends. If their largest growth exponent there is $b$, assign the term the usable order

#[#set math.equation(numbering: n => "(6.2)")
 $ s = p - max \( 0 \, b \) . $ <ell:usable-order>]

Take the maximum over both ends. Polynomial powers in $tau$ or $L$ do not change this order.
  All $p \, s$ are on the grid $lambda bb(Z)$, because the tail powers and indicial roots are integers and the
  seam prescription uses $lambda = 1 \/ n$. The terms constructed below have $s > 0$.

Coefficient fields decay on every other still-finite half-end and may have prescribed finite growth on older
  opened ends. At the pair now being closed, the scalar factor in each length term compensates its incoming growth
  through the usable order $s$. The remainder estimate will keep these three bounds separate.

#thm([Lemma 6.1.])[
  (Finite length expansion).  #emph[For every desired exponential precision,
    the actual small solution and every appended field have an expansion by finitely many terms in Equation (6.1),
    with an exponentially better remainder. It is uniform in the remaining finite lengths on their quadratic
    regions, in a fixed smaller ordinary-parameter polydisc. For older opened ends the conclusion holds in every
    specified finite tail norm. Coefficient fields are obtained by the finite constructions in Lemmas 25 and 26.]
] <ell:one-length>

#proof[
  We give the induction and then its remainder estimate. Process usable orders $s = lambda \, 2 lambda \, dots.h$.
    Products add lower bounds for usable order, since
  $ max \( 0 \, b_1 + b_2 \) lt.eq max \( 0 \, b_1 \) + max \( 0 \, b_2 \) . $
  No initial bulk residual is present: $Y_0$ solves the opened equations.
    Expand the remaining bulk equations by a finite Taylor formula about $Y_0$,
    placing their full linearization on the left. Core equations, compact coefficients,
    and previously imposed asymptotic conditions are part of these equations.
    At order $s$ only finitely many products of the earlier positive-order terms occur.
    For each coefficient of $e^(- p L)$ times a polynomial in $L$,
    cancel its complete forced field by the disconnected linearized inverse,
    with zero free incoming constants on the two new ends. A source assigned order $s$ has growth at most $p -
    s$ there; by Lemmas 25 and 26 its correction has the same upper growth bound.
    When this bound is negative the inverse may also contribute decaying homogeneous terms;
    these still have positive usable order. More uniformly, record each individual product with its product lower
    bound and allow the bound $max \( 0 \, p - s \)$. For the terms at issue $p gt.eq s$, by Equation (6.2).
    The newly solved linear terms vanish exactly. Their later bulk interactions are higher-order products.
  Next evaluate the value, normal trace, and critical-test residuals at $tau = L$,
    using integer tails to finite precision. At order $s$ they are finite harmonic sums times $e^(- s L)$ and
    polynomials in $L$; include the prescribed $e^(- lambda L) z_e$ term.
    For every incoming root $b gt.eq 0$ there is a homogeneous disconnected variation with prescribed leading mode
    $e^(b tau)$ on its selected side. Prescribe zero free nondecaying constants elsewhere.
    Its difference from that leading mode has strictly smaller growth at the two new ends,
    because the coefficients coupling channels decay there. For $b = 0$ all other new-end components decay.
    Multiply this variation by $e^(- \( s + b \) L)$ times a polynomial in $L$.
    Its leading seam data have order $s$. The block matrices in Lemma 18 solve every leading seam residual.
    Their lower tails contribute only later orders. Matching at all other finite seams is preserved by the
    disconnected inverse. This completes the induction step. Finiteness follows from the positive minimum tag
    $lambda$, the finite harmonic support at each previously reached order, and the integer root lists.
    In particular, no angular analyticity estimate uniform in all expansion orders is used.
  We now justify that the construction approximates the actual fields.
    Restrict each coefficient to the new halves $Re tau lt.eq Re L$.
    Before applying the basic weight, a term with usable order $s$ has field norm,
    or source norm with two fewer derivatives, bounded by
  #[#set math.equation(numbering: n => "(6.3)")
   $ C \( 1 + Re L \)^C e^(- s Re L) . $ <ell:tag-bound>]
  For a decaying coefficient this uses its whole half-cylinder norm;
    for a growing coefficient it uses the finite tail and $e^(b Re tau) lt.eq e^(b Re L)$.
    Products consequently cost only polynomials in this unweighted estimate.
    Analytic Taylor remainders beyond a fixed tag cutoff contain arbitrarily many positive-order factors if the
    Taylor degree is chosen large enough. The base nonlinear field and its corrections on these halves are small,
    so those Taylor estimates are valid. Apply the basic weight only after the product estimate;
    it costs $e^(nu Re L)$ once, not once per factor. The fixed polynomial source strengthening costs an
    arbitrarily small additional exponential rate. The same reasoning applies to seam tails and their first normal
    traces, which have been expanded to a strictly higher rate before evaluation.
    It follows that a sufficiently high finite tag cutoff gives any requested residual order in all basic norms.
  On another still-finite half, the coefficient fields decay in the fixed basic weight.
    Residual bulk products contain the two factors required by Lemma 26,
    which absorb the polynomial loss in that other length. There is no seam residual there.
    On an older opened end, every term retains its full scalar factor $e^(- p L)$.
    Products there are estimated to a higher finite tail precision to offset the finite growth of the other
    factors. For unexpanded analytic operations on the base metric,
    its own corrections at old opened ends remain decaying: their equations and old-end conditions depend only on
    the base metric and its own corrections. Thus Taylor remainders there are controlled by extracting additional
    finite Taylor powers; growing auxiliary fields appear only in finite differential products and triangular
    equations. This proves residual estimates in all required old-end tail norms as well.
  Compare the nonlinear approximate metric first in the basic decaying spaces, allowing its seam jumps as data.
    The small-branch inverse and the small nonlinear Lipschitz bound give the same arbitrary exponential accuracy
    for its difference from the true metric. On an old opened end the difference equation has flat principal
    operator, decaying coefficients with integer tails, and the residual just bounded to higher precision.
    Apply Lemma 24 repeatedly. It upgrades the initial small error to the same exponential accuracy for any
    specified tail coefficients and remainder. For an appended field, work in triangular order:
    its difference equation has the same diagonal inverse and errors from previous members multiplied by at most
    finite growth. Apply Lemma 25, also to differences of its free prescriptions.
    This proves the asserted comparison in finite tail norms,
    without ever trying to put a growing field itself in a decaying space.
  All estimates use a fixed high Sobolev order. A Taylor source uses at most two derivatives and its inverse
    regains those two derivatives. Thus iteration creates no accumulating differential loss.
    Traces and contour shape differentiation may use one lower order,
    and parameter derivatives use Cauchy estimates in the independent analytic variables. ◻
]

== 7 Scalar expansions and the tree inequality <ell:scalar-calculus>

#thm([Lemma 7.1.])[
  (Finite-part integration).  #emph[Integration of the coefficient fields constructed in Lemma 27 preserves
    exponential-polynomial length expansions for $F$ and $J$.
    Each resulting coefficient is a finite sum of core or root-tail integrals,
    finite-part integrals on opened ends, and evaluations of finite tail coefficients,
    on the corresponding partial disconnection. These operations are analytic and continuous in sufficiently high
    finite tail precision.]
] <ell:finite-parts>

#proof[
  For clarity fix a normalization of finite parts. Let an integrand density on a complete opened end,
    already integrated over its cross-section, be $f \( tau \) d tau$.
    Subtract a fixed cutoff times every nondecaying term of its finite tail,
    and denote this finite sum by $T \( tau \) = sum_(alpha gt.eq 0 \, j) c_(alpha j) e^(alpha tau) tau^j$.
    Let $Q_(alpha j)$ be a chosen polynomial-exponential primitive of $e^(alpha tau) tau^j$,
    with zero additive constant. The remainder $f - zeta T$ is integrable once its tail rate is positive.
    There is then a uniquely normalized constant $C_f$ such that
  #[#set math.equation(numbering: n => "(7.1)")
   $ integral_(tau_0)^L f \( tau \) thin d tau = C_f + sum_(alpha gt.eq 0 \, j) c_(alpha j) Q_(alpha j) \( L \) -
     integral_L^oo \( f - T \) \( tau \) thin d tau $ <ell:finite-part-formula>]
  when $L$ is beyond the cutoff. Define $C_f$ by integrating $f - zeta T$ and the fixed compact correction.
    The final integral uses the exact tail after subtraction and can also be expanded by subtracting its finitely
    many decaying terms. If the remaining rate is $eta > 0$, its integral is bounded by $C_eta$ times that finite
    tail norm, by Cauchy–Schwarz against $e^(- eta u)$. This proves continuity.
    It also proves analyticity by locally uniform dominated integration; the coefficients themselves are analytic.
    On complex contours, use $d tau$ and the contour-independence argument from Lemma 21.
    A strict exponential margin pays the polynomial length of the contour.
  Apply this formula to each Taylor coefficient of the densities in Equation (4.10).
    They are finite analytic differential operations on the base field,
    or finite Taylor operations on appended fields. The interior Ricci-square density is scale neutral.
    A scalar-volume density has the additional factor $a_v^2 e^(plus.minus 2 tau)$.
    On a newly opened child half its endpoint factor is accompanied by $e^(- 4 L)$.
    Thus all primitives still have integer exponential powers and polynomial logarithmic factors,
    with the stated grid after multiplication by the factors in Equation (6.1).
  Core integration is continuous in the basic Sobolev norm.
    Root-tail integration is continuous in the fixed root weights,
    using $q_0 > 1$ for the subtracted density and $q_1 < q_0$ for the weighted Ricci square.
    On other finite edges the child scale factors still accompany the $e^(2 tau)$ radial factor,
    so the boundedness estimates following Equation (4.10) apply there.
    Their integrands have the requisite decaying field factors.
    Evaluation of a finite part or tail coefficient on an older opened end has no loss in the new length:
    it is continuous in a fixed sufficient finite tail norm, where Lemma 27 retained that new-length factor.
  To reach a scalar cutoff $B$, choose a tag cutoff strictly greater than $B + nu + 2 +
    delta$ for some $delta > 0$, then choose the tail precision higher still if required by the finitely many
    auxiliary growth exponents. The allowance $nu$ pays the basic weight, $2$ pays the worst radial factor,
    and the strict surplus pays every polynomial factor. The actual child factor $e^(- 4 L)$ only improves this
    bound. Thus the formal integration and endpoint truncation have genuine exponentially better remainders. ◻
]

#thm([Proposition 7.2.])[
  (All-order scalar expansion).  #emph[The functions $F \, J$ satisfy the analytic expansion hypotheses of
    Theorem 4. Their length exponents belong to the discrete nonnegative grid $lambda bb(N) union { 0 }$.
    In any length, and recursively after taking any finite list of coefficients,
    expansions have exponentially better remainders at every cutoff.
    All recursively obtained coefficients are analytic on a common fixed-width complex tail band of the remaining
    lengths and one common open complex neighborhood of the ordinary parameters.
    The neighborhood does not decrease with the expansion order.]
] <ell:all-orders>

#proof[
  Lemmas 27 and 28 give an expansion in one length. Its coefficients are finite constructions of the same kind:
    triangular field equations with finite free asymptotic data, followed by core and root integrals,
    finite parts, and tail-coefficient evaluations. On every still-finite seam the added fields have homogeneous
    matching and zero critical tests. Opening the next edge therefore uses the same lemmas;
    variations of conditions at older opened ends expand their linear free-coefficient equations in triangular order.
  We check that each such coefficient is bounded uniformly in the lengths still finite.
    Fix its entire finite construction and a sufficient finite tail precision.
    A prescribed growing tail is cut off on an already opened end in Equation (5.2).
    The correction is obtained from the fixed basic inverse, so it still decays on every finite half-end.
    Repeating the finitely many triangular solves preserves uniform field and tail bounds.
    Polynomial prescriptions in earlier tail coefficients are bounded by the preceding steps,
    and the two decaying factors on still-finite halves pay their strengthened source norms.
    Constants may depend on this coefficient, its growth and its chosen precision,
    but not on the remaining lengths or parameters in a fixed smaller polydisc.
  The scalar operations preserve these bounds. Core and root integrals are continuous in the fixed norms.
    Tail-coefficient evaluation and finite-part integration on an older opened end are bounded maps at the chosen
    sufficient precision, by Lemma 28. On a still-finite edge keep the physical scale factors belonging to
    unexpanded lengths. Scale-neutral Ricci-square terms have two decaying factors and hence a uniformly bounded
    cylindrical integral. For scalar-volume terms, the parent punctured half has the integrable factor $a_p^2
    e^(- 2 tau)$, while the child half satisfies
  $ a_c^2 integral_(tau_0)^(L_e) e^(2 tau) thin d tau lt.eq C a_p^2 e^(- 2 L_e) \, wide a_c = a_p e^(- 2 L_e) . $
  The bounded normalized fields multiply these factors. On complex contours the corresponding bounds use real
    parts; polynomial contour costs are absorbed by decay on the bent portion or by the displayed child factor.
    Thus each recursively extracted scalar coefficient has the required uniform bound on quadratic regions,
    with thresholds and constants allowed to depend on its finite construction.
  Every scalar exponent lies on $lambda bb(Z)$. Group equal exponents.
    For fixed real remaining parameters, boundedness as the expanded length tends to infinity excludes a nonzero
    negative exponent and a positive polynomial degree at exponent zero:
    the first such term would dominate all later terms. The recursive bounds just proved permit the same argument
    after any previous coefficient extraction. Finite expansions are unique,
    since a nonzero polynomial cannot decay exponentially after multiplication by the exponential of the smallest
    differing exponent. Applying this at real remaining parameters and then using analytic continuation makes the
    formulas from different cutoffs agree. This gives consistent expansions on the nonnegative grid.
  We give the common-domain argument separately, since merely having an expansion to every finite order would not
    imply it. For each of the finitely many partial disconnections,
    fix its small solution and its augmented basic inverse from Lemma 21.
    Take once the minimum of their parameter radii and the maximum of their length thresholds,
    and restrict to a smaller polydisc compactly contained in all of them. Their common quadratic regions include a band
  #[#set math.equation(numbering: n => "(7.2)")
   $ Re L_e > A_(*) \, quad \| Im L_e \| < c_(*) \; wide \| z - z_(*) \| < rho_(*) . $ <ell:common-domain>]
  Every coefficient of every finite order is constructed on this same domain by finite polynomial primitives,
    cutoff tails, and the same basic inverse, as in Equation (5.2).
    A large growing coefficient never becomes the input of a new nonlinear contraction.
    Its correction is an unrestricted-size linear solve. Increasing weights in Lemma 24 uses only constant root
    kernels to identify tails; it does not introduce a new parameter-dependent global inverse.
    Tail limits are locally uniform on this domain, and finite parts are locally uniformly integrable after the
    finite subtraction. These observations prove analyticity on Equation (7.2) for every degree.
  For the remainder bounds on quadratic regions it is permissible to increase length thresholds and constants with
    the finite precision and finite auxiliary system. The ordinary-parameter polydisc remains the one fixed above.
    Choose a fixed slightly larger polydisc still inside the basic inverse domain whenever Cauchy estimates are
    needed; this choice is also made once. No intersection of infinitely many decreasing parameter neighborhoods
    occurs. On complete opened ends used for coefficient formulas one may use real contours to establish this
    common-band analyticity, then the contour estimates to obtain the stronger asymptotic bounds.
  Finally consider a subset of lengths with $Re L_i = c_i U + o \( U \)$, $c_i > 0$.
    There are only finitely many grid multi-indices with $sum_i d_i c_i lt.eq B$ for any fixed $B$.
    Expand the first length sufficiently far that its remainder has order greater than $\( B + epsilon.alt \) \/
    c_1$. For each of its finitely many retained coefficients,
    expand the next length sufficiently far to put the resulting weighted remainder above $B + epsilon.alt$,
    and continue. Uniform coefficient bounds in the still unexpanded lengths make this a legitimate finite
    procedure. Choose the strict surplus before making the finitely many choices.
    The $o \( U \)$ changes of the length ratios and all logarithmic polynomials consume less than that surplus
    for large $U$. This gives the required grouped weighted expansions with strictly better remainders,
    including after previous coefficients have been taken. These are precisely the remaining expansion conditions
    in Theorem 4. ◻
]

=== 7.1 The differential estimate and the contradiction <ell:conclusion>

#thm([Lemma 7.3.])[
  (Differential of the scalar observable).  #emph[On the real small family, for some $c > 0$,
#[#set math.equation(numbering: n => "(7.3)")
 $ \| d F \| lt.eq C sqrt(J) (sum_alpha \| d z_alpha \| + sum_e e^(- c L_e) \| d L_e \|) . $ <ell:dF>]

]
] <ell:differential>

#proof[
  For ordinary-parameter derivatives the uniform linearized inverse gives the fixed weighted field bounds.
    Pair the first variation with the first Ricci-square term of $J$ on the physical interior.
    Its dual metric-variation $L^2$ norm is uniformly bounded:
    core volumes scale by $a_v^4$, and the half-end volume calculation uses $a_v^4 e^(plus.minus 4 tau) d tau$,
    with the factor $e^(- 8 L_e)$ on a child side. The scalar part of the Einstein tensor costs only a
    dimension-dependent multiple of $\| "Ric" \|$. On the root use instead the weighted part of $J$ and
    Cauchy–Schwarz. The dual integral is bounded by
  $ C integral_(r_0)^oo r^(- 2 q_1) r^(- 2 q_0) r^3 thin d r < oo \, $
  since $q_0 + q_1 > 2$. This proves the $d z$ part.
  Now differentiate one length $L_e$, initially at fixed vertex and end coordinates.
    The normalized bulk equations and the compact tests have no dependence on this length.
    Only the seam data acquire an inhomogeneity: derivatives of the prescribed $e^(- lambda L_e) z_e$,
    and endpoint normal derivatives of the solution in its matching conditions.
    The solution has the stronger joining weight $nu' > nu$. The trace theorem,
    using one fewer derivative if necessary, therefore bounds these differentiated data in the basic weighted norms by
  $ C #scale(x: 120%, y: 120%)[\(] e^(- \( nu' - nu \) L_e) +
    e^(- \( lambda - nu \) L_e) #scale(x: 120%, y: 120%)[\)] \| d L_e \| . $
  The linearized inverse gives this same bound throughout the normalized field.
    Its first-variation pairing is bounded by $C sqrt(J) e^(- c_1 L_e) \| d L_e \|$ for any fixed $0 < c_1 < nu' -
    nu$, by the preceding dual-norm estimates.
  To interpret this derivative on a fixed smooth manifold, move the endpoints in a collar of fixed logarithmic
    width at the seam. The additional transport variation is bounded in relative metric norm and supported at
    physical radius $rho lt.eq C a_p e^(- L_e)$. Its $L^2$ norm is therefore at most $C a_p^2 e^(- 2 L_e) \| d
    L_e \|$. Moreover the physical squared scale of every descendant changes at a bounded relative rate,
    since $partial_(L_e) a_v^2 = - 4 a_v^2$ there. The whole descendant region has volume at most $C a_p^4
    e^(- 4 L_e)$. To verify this last assertion, the first child exterior half has volume
  $ C a_c^4 integral^(L_e) e^(4 tau) thin d tau lt.eq C a_p^4 e^(- 4 L_e) \; $
  its core and each further subtree are smaller by their additional scale factors, and the tree is finite.
    The descendant scaling variation thus has the same exponentially small $L^2$ bound.
    Pair both variations with the unweighted Ricci-square term of $J$.
    Choosing $0 < c < min \( nu' - nu \, 2 \)$ proves Equation (7.3).
    All identifications here use real lengths; no positivity of a complex bilinear square is used. ◻
]

#proof[
  The case $M = 0$ is Lemma 1. Suppose the assertion fails on a subsequence with $M > 0$.
    Then $\| E \( g \) \| gt.eq epsilon.alt M$ for some fixed $epsilon.alt > 0$.
    By Lemma 22 and Equation (4.11), late terms satisfy
  $ F eq.not 0 \, wide F^2 gt.eq c_2 J \, wide F arrow.r 0 \, $
  for some $c_2 > 0$. The finite parameter vectors have an interior subsequential limit:
    all the earlier smallness choices can be strict inside the parameter polydisc.
    On real parameters, $J gt.eq 0$ by Equation (4.10). Proposition 29 supplies admissibility,
    and Lemma 30 supplies Equation (7.3). The resulting sequence therefore satisfies every hypothesis excluded by
    Corollary 5, a contradiction. This proves Equation (2.6). ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
