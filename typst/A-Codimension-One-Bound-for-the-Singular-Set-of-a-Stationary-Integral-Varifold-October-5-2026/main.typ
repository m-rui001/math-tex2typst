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

#align(center)[#text(size: 16pt, weight: "bold")[A Codimension-One Bound for the Singular Set \
of a Stationary Integral Varifold]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Stationarity is the weakest variational condition naturally imposed on a minimal submanifold:
  the first variation of area vanishes under every compactly supported ambient deformation.
  Integral varifolds retain this condition under weak limits while allowing integer multiplicity,
  self-intersections, and singularities. Their general regularity problem asks how much of the support must
  nevertheless be a smooth embedded minimal submanifold.

Let $m \, n gt.eq 1$ and let $U subset bb(R)^(m + n)$ be open.
  An integral $m$-varifold $V$ has weight $mu = theta cal(H)^m corner.l.b E$,
  where $E$ is countably $m$-rectifiable and $theta$ is positive, integer-valued, and locally integrable.
  At $mu$-almost every $x$, write $T_x V$ for the approximate tangent $m$-plane and $P_(T_x V)$ for its orthogonal
  projection. Stationarity means

#[#set math.equation(numbering: n => "(1.1)")
 $ integral "tr" \( P_(T_x V) D X \( x \) \) thin upright(d) mu \( x \) = 0 wide
   upright("for every ") X in C_c^1 \( U \; bb(R)^(m + n) \) . $ <eq:stationarity>]

A point $p in "spt" mu ∩ U$ is #emph[regular] if some neighborhood $W$ of $p$ contains a smooth embedded minimal
  $m$-submanifold $Sigma$, without boundary in $W$, such that $"spt" mu ∩ W = Sigma$ and $V corner.l.b W =
  q \| Sigma \|$ for a positive integer $q$. We denote the remaining support points by $"Sing" V$.
  Thus regularity includes equality of the local support with one embedded submanifold,
  not merely a smooth parametrization on a set of full measure.
  For stationary integral varifolds this is equivalent to local $C^1$ embeddedness of the support,
  by constancy and elliptic regularity.

#thm([Theorem 1.1.])[
  #emph[For every stationary integral $m$-varifold $V$ in an open set $U subset bb(R)^(m + n)$, where $m \, n gt.eq 1$,
$ dim_(cal(H)) "Sing" V lt.eq m - 1 . $

]
] <thm:main>

Theorem 1 proves the Euclidean conjecture recorded as Conjecture 1.1 by Brena, Decio,
  and De Lellis #cite(label("BDD2025")). There is no stability, minimizing, orientability, density-upper-bound,
  or codimension hypothesis. The estimate is sharp: the sum of the varifolds of two distinct $m$-planes meeting
  along an $\( m - 1 \)$-plane is stationary, and its singular set is exactly that intersection.

=== 1.1 Context and antecedents <context-and-antecedents>

Allard’s compactness and regularity theory #cite(label("Allard1972")) supplies the basic passage from weak
  convergence to geometric information and gives a relatively open dense regular set.
  The dimension-reduction method originating in #cite(label("Federer1970")) leads to the classical stratification
  by translation symmetries of tangent cones. For stationary integral varifolds,
  the set of points admitting no planar tangent has Hausdorff dimension at most $m - 1$.
  Naber and Valtorta #cite(label("NV2020")) proved rectifiability of these classical strata for integral varifolds
  with bounded mean curvature. The remaining difficulty is therefore the singular set at higher-multiplicity
  planar tangents, where Allard’s multiplicity-one regularity theorem does not apply.
  Standard treatments of the compactness, monotonicity, and tangent-cone theory used here include
  #cite(label("Federer1969")) #cite(label("Simon1983")).

For area-minimizing integral currents, Almgren’s regularity theory #cite(label("Almgren2000")) gives an interior
  singular-set bound of dimension $m - 2$ in arbitrary codimension.
  De Lellis and Spadaro developed a new proof based on multiple-valued functions, center manifolds,
  and a frequency analysis of the blow-up #cite(label("DLS2011")) #cite(label("DLS2016II"))
  #cite(label("DLS2016III")). These techniques explain the role of subtracting a well-chosen smooth center before
  normalizing the height. Their regularity theorems do not apply to arbitrary stationary integral varifolds;
  even the crossing example above prevents the same dimension bound in our setting.

Hirsch and Spolaor proved the $m - 1$ bound for two-valued stationary Lipschitz graphs #cite(label("HSgraphs")).
  Their use of generalized-gradient Young measures retains height and gradient information under weak convergence
  and is a methodological antecedent of our measure-valued blow-up,
  which does not assume graphicality or two-valuedness. Hirsch and Spolaor also proved almost-everywhere
  regularity for stationary codimension-one integral currents whose density is at most two at every support point
  #cite(label("HS2025")). Krummel, Minter, and Wickramasekera #cite(label("KMW2026")) obtained singular-set bounds
  of dimension at most $m - 1$ at controlled densities in classes satisfying an explicit epsilon-regularity assumption.

A different line of work addresses higher-order rectifiability.
  Brakke’s work gives $C^(1 \, alpha)$ rectifiability, for every $0 < alpha < 1$,
  of stationary integral varifolds #cite(label("Brakke1978")).
  Menne proved second-order rectifiability under locally bounded first variation #cite(label("Menne2013")).
  Brena, De Lellis, and Franceschini #cite(label("BDLF2025")) established smooth rectifiability for stationary
  integral varifolds; Kolasiński #cite(label("Kolasinski2026")) subsequently gave an independent alternative
  proof, following a program he attributes to Menne. Smooth rectifiability describes the measure up to a null set
  by smooth pieces; it does not assert that the entire support near almost every point equals one such piece.
  This distinction is essential for the singular set defined above.

The ambient geometry is also important. De Lellis, Hirsch, Lihn,
  and Spolaor #cite(label("DLHLS2026")) construct stationary integral varifolds with planar tangents and infinite
  local topology in smooth, generally non-Euclidean metrics.
  Their examples do not contradict the Euclidean dimension bound proved here.

Brena, Decio, and De Lellis #cite(label("BDD2025")) Conjectures 1.1 and 1.2 separate the dimension bound from the
  weaker assertion $cal(H)^m \( "Sing" V \) = 0$. The latter Euclidean assertion is proved in
  #emph[Almost-everywhere regularity of stationary integral varifolds] #cite(label("AE")),
  which we henceforth call AE. Our proof uses AE’s signed-excess theorem and local estimates from its fitting and
  frequency arguments. The elliptic correction of the averaged graph in #cite(label("BDLF2025")) Sections 6.3–6.4
  is an antecedent of this fitting construction. The almost-everywhere regularity conclusion itself is not an
  input: a set can have zero $cal(H)^m$ measure and still have Hausdorff dimension greater than $m - 1$.
  We state the imported measure estimates in Section 3. Section 4 specifies the local fitting estimates and
  verifies the hypotheses needed for their use at the prescribed scales.

=== 1.2 The proof and its new components <the-proof-and-its-new-components>

Suppose that $dim_(cal(H)) "Sing" V > m - 1$ and choose an exponent $s$ strictly between these two numbers.
  A first dimension-reduction argument produces a singular point, placed at the origin, an integer $Q$,
  and radii $L_i arrow.b 0$ for which the rescaled varifolds converge to the multiplicity-$Q$ plane.
  At these same scales there are nonzero measures $sigma_i$ carried by density-$Q$ points in a fixed compact ball,
  with mass bounded above and away from zero and the estimate

$ sigma_i \( upright(bold(B))_r \( x \) \) lt.eq C r^s . $

Here $upright(bold(B))_r \( x \)$ is an ambient Euclidean ball.
  The limiting measure of centers cannot be carried by an $\( m - 1 \)$-plane.
  This first reduction, proved in Section 2, is the familiar geometric starting point of dimension reduction;
  the challenge is to retain these centers in a further, height-normalized limit.

The proof has four further stages. First, we construct smooth reference graphs at the prescribed scales $L_i$.
  AE’s minimal fitting gives intervals of radii on which a centered height admits frequency control.
  Section 4 proves that these intervals cover every sufficiently small prescribed flat scale,
  including their transition regions. Section 5 then normalizes the height by numbers $a_i arrow.b 0$.
  The normalized second moment is nonzero, the first moment tends to zero,
  and the reference graphs’ mean curvature and its first derivative are $o \( a_i \)$.
  Both moment conclusions are needed: subtracting a reference graph must neither remove the entire limit nor leave
  an arbitrary translation in it.

Second, Section 6 passes the first variations and signed excess to measures on the limiting plane.
  The resulting data consist of a nonnegative height measure, a positive-semidefinite tilt measure,
  a mixed height–tilt measure, and a signed mass measure. They satisfy linear first-variation identities,
  a positive-semidefinite block inequality, and a one-sided comparison of mass and tilt.
  This formulation avoids assuming that the limiting sheets can be globally labeled or represented by a
  single-valued function.

Third, the density of the points carrying $sigma_i$ must still be visible after division by $a_i^2$.
  Ordinary uncorrected radial comparison does not provide that precision on curved reference graphs.
  Section 7 uses geodesic radial fields weighted by the inverse reference-volume density.
  The resulting curvature error can be averaged against $sigma_i$ at every radius down to zero.
  For a fixed $l > 0$, its decisive integral is

$ integral_0^l t^(s - m) thin upright(d) t < oo \, $

which holds exactly when $s > m - 1$. The centered first-moment estimate then removes the translation terms and
  yields a density comparison at every limiting center.

Finally, Section 8 isolates an abstract dimension-reduction statement for these measures.
  Its frequency is monotone at the retained centers. A second blow-up makes that frequency constant at enough
  independent centers. Equality in the positive-semidefinite inequality then forces the height measure to vanish,
  contrary to its normalization. This is the contradiction that proves Theorem 1.

The prescribed-scale construction, the averaged curved radial comparison,
  and the final measure-valued reduction are the parts needed to strengthen AE’s almost-everywhere conclusion to a
  dimension bound. The center-manifold and frequency viewpoint belongs to the broader regularity tradition
  described above; our specific local fitting and signed-excess inputs are those of AE.
  The initial and final reductions use the classical measure-theoretic framework of #cite(label("Federer1969"))
  #cite(label("Mattila1995")).

=== 1.3 Conventions <conventions>

All assertions are local in $U$, and supports are relative to $U$ until a blow-up is taken.
  If $eta_r \( x \) = x \/ r$, then $V_r = \( eta_r \)_(\#) V$ is the varifold pushforward,
  whose weight is $r^(- m) \( eta_r \)_(\#) mu$. Translated blow-ups will be specified explicitly.
  Bold balls $upright(bold(B))_r$ are ambient, whereas $B_r$ denotes a base-coordinate ball.
  The letters $C \, c > 0$ denote constants depending only on previously fixed data and may change between
  occurrences. Weak convergence of Radon measures is always tested on continuous compactly supported functions.
  Positive semidefiniteness of a symmetric matrix-valued measure means that its contraction with every constant
  vector is a nonnegative measure.

== 2 Flat scales carrying many singular centers <sec:flat-scales>

The first reduction uses only stationary monotonicity and Hausdorff measure theory.
  If the singular set has dimension greater than $m - 1$, we shall find a singular point with a planar tangent
  cone and retain, at the same scales, a nonzero measure of nearby points having exactly the same density.
  Retaining this measure is essential: a planar tangent cone at a single singular point gives no contradiction.

For $p in U$ and $r > 0$, write

$ eta_(p \, r) \( X \) = frac(X - p, r) \, wide V_(p \, r) = \( eta_(p \, r) \)_(\#) V . $

Thus the weight of $V_(p \, r)$ is $r^(- m) \( eta_(p \, r) \)_(\#) mu$.
  After translating $p$ to the origin we abbreviate $V_(p \, r)$ to $V_r$.
  We use $upright(bold(B))_r$ for ambient balls and, later, $B_r$ for balls in an $m$-dimensional base plane.
  The stationary density is

$ Theta_V \( p \) = lim_(r arrow.b 0) frac(mu \( upright(bold(B))_r \( p \) \), omega_m r^m) . $

It exists at every support point, is at least one, and is locally bounded and upper semicontinuous.
  Moreover, under locally mass-bounded convergence of stationary integral varifolds,

#[#set math.equation(numbering: n => "(2.1)")
 $ V_i harpoon.rt V_oo \, quad p_i arrow.r p quad arrow.r.double quad Theta_(V_oo) \( p \) gt.eq
   limsup_i Theta_(V_i) \( p_i \) . $ <eq:density-upper-limit>]

These facts follow from monotonicity and integral compactness #cite(label("Allard1972"))
  #cite(label("Simon1983")). For example, to obtain (2.1), bound each density by its mass ratio on a fixed ball,
  pass to the limit at radii whose boundary has zero limiting mass, and then let the radius decrease to zero.

We shall also use two consequences of these facts. First,
  supports converge locally under this varifold convergence.
  The lower density bound prevents support points from persisting where the limit has zero mass; conversely,
  any neighborhood of a limiting support point has positive limiting mass and therefore meets the approximating
  supports. Second, $"spt" mu$ has locally finite $cal(H)^m$ measure.
  Indeed the lower density bound gives $mu \( upright(bold(B))_r \( p \) \) gt.eq
  omega_m r^m$ whenever the ball is interior and $p in "spt" mu$.
  A disjoint-ball covering argument on a compact subset of $U$ bounds its Hausdorff measure by a dimensional
  constant times the mass in a slightly larger compact set.
  No local Hausdorff-measure assumption on the support is needed.

#thm([Proposition 2.1.])[
  (Flat scales and a measure of centers).  #emph[Suppose that $V$ is a stationary integral $m$-varifold in an open
    subset of $bb(R)^(m + n)$ and that
$ m - 1 < s < dim_(cal(H)) "Sing" \( V \) . $

 After a translation there exist a fixed point $0 in "Sing" \( V \)$, an integer $Q gt.eq 1$,
   an $m$-plane $Pi$ through zero, radii $L_i arrow.b 0$, and positive Radon measures $sigma_i$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ Theta_V \( 0 \) = Q \, wide V_(L_i) harpoon.rt Q \| Pi \| quad
   upright("locally in ") bb(R)^(m + n) . $ <eq:flat-targets>]

 Each $sigma_i$ is supported in $overline(upright(bold(B)))_1$ on singular points of $V_(L_i)$ having density
   exactly $Q$. There are constants $c \, C > 0$, independent of $i$, for which
#[#set math.equation(numbering: n => "(2.3)")
 $ sigma_i \( upright(bold(B))_u \( X \) \) lt.eq C u^s quad \( X in bb(R)^(m + n) \, med u > 0 \) \, wide c lt.eq
   sigma_i \( overline(upright(bold(B)))_1 \) lt.eq C . $ <eq:center-measure-bounds>]

]
] <prop:flat-scales>

#proof[
  The regular set is relatively open in $"spt" mu$, so the singular set is Borel.
    The compact-subset theorem for Hausdorff measure #cite(label("Mattila1995")) Theorem 8.13 gives a compact
    subset of $"Sing" \( V \)$ with finite positive $cal(H)^s$ measure.
    We recall the two measure-theoretic refinements that we need #cite(label("Federer1969"))
    #cite(label("Mattila1995")). On a set of finite positive $cal(H)^s$ measure,
    the upper $s$-density is positive and finite almost everywhere.
    By restricting to a positive-measure subset where its upper bound is uniform,
    and then taking a compact subset, we obtain a compact set $K$ such that
  #[#set math.equation(numbering: n => "(2.4)")
   $ 0 < cal(H)^s \( K \) < oo \, wide cal(H)^s \( K ∩ upright(bold(B))_r \( X \) \) lt.eq
     C r^s . $ <eq:initial-frostman>]
  An upper bound initially obtained for centers in $K$ extends to arbitrary centers by doubling the radius.
    Enlarging $C$ handles the remaining large radii. Lusin’s theorem permits a further compact restriction of
    positive measure on which $Theta_V$ is continuous. The upper bound in (2.4) is preserved.
  For $cal(H)^s$-almost every $p in K$, positive upper density supplies radii $r_i arrow.b
    0$ and a constant $c_p > 0$ with
  $ cal(H)^s \( K ∩ upright(bold(B))_(r_i) \( p \) \) gt.eq c_p r_i^s . $
  Pass to a subsequence on which $V_(p \, r_i)$ converges to a stationary integral tangent cone $C_p$.
    Define measures on the closed unit ball by
  $ lambda_i = r_i^(- s) \( eta_(p \, r_i) \)_(\#) #scale(x: 120%, y: 120%)[\(] cal(H)^s #h(-0.16667em)
    corner.l.b \( K ∩ overline(upright(bold(B)))_(r_i) \( p \) \) #scale(x: 120%, y: 120%)[\)] . $
  They have uniformly bounded mass, mass bounded away from zero, and the upper ball bound in (2.4).
    A further subsequence converges to a nonzero measure $lambda$ with the same upper ball bound.
    Its support lies in $"spt" C_p$.
  Set $q_p = Theta_V \( p \)$; at this point $q_p$ is not assumed to be an integer.
    If $z in "spt" lambda$, there are points $p_i in K$ with $\( p_i - p \) \/ r_i arrow.r z$.
    Continuity on $K$ and (2.1) imply
  $ Theta_(C_p) \( z \) gt.eq q_p . $
  On the other hand, the density at infinity of $C_p$ about $z$ equals $q_p$:
    sandwich $upright(bold(B))_R \( z \)$ between the balls about zero of radii $R - \| z \|$ and $R + \| z \|$,
    and use conicality about zero. Monotonicity about $z$ consequently has equality at every radius.
  We spell out the geometric consequence of this equality. The radial displacement $X -
    z$ lies in the tangent plane of $C_p$ almost everywhere. Testing stationarity with $phi \( X \) \( X - z \)$ gives
  $ integral #scale(x: 120%, y: 120%)[\(] m phi + \( X - z \) dot.op nabla phi #scale(x: 120%, y: 120%)[\)] thin
    upright(d) parallel C_p parallel = 0 . $
  Differentiating dilated scalar integrals shows that the weight is $m$-homogeneous about $z$.
    Since a rectifiable weight determines its tangent plane almost everywhere,
    the varifold is conical about $z$ as well. Composing dilations about $z$ and about zero now gives translation
    invariance along the whole line $bb(R) z$.
  The support of $lambda$ spans at least $m$ linearly independent directions.
    Otherwise it lies in a linear space of dimension at most $m - 1$;
    covering its bounded support by $O \( epsilon^(- \( m - 1 \)) \)$ balls of radius $epsilon$ would give
    $lambda \( bb(R)^(m + n) \) lt.eq C epsilon^(s - m + 1) arrow.r 0$.
    Choose $m$ independent such directions and let $P$ be their span.
    The cone is invariant under every translation in $P$. If its support contained a point outside $P$,
    subtracting its $P$-component would give $w in P^perp \\ { 0 }$ in the support.
    Conicality and translation invariance would then place every disk $t w + \( P ∩ upright(bold(B))_1 \)$,
    $1 lt.eq t lt.eq 2$, in the support. These are disjoint disks of equal positive $m$-dimensional measure,
    all in a bounded region, contradicting local finiteness of $cal(H)^m \( "spt" C_p \)$.
    Thus its support is precisely $P$. Tangential stationarity on this plane gives constant multiplicity,
    and integrality gives
  $ C_p = q_p \| P \| \, wide q_p in { 1 \, 2 \, dots.h } . $
  We have proved that $Theta_V$ is integer-valued at $cal(H)^s$-almost every point of $K$.
    One of its countably many integer level sets therefore has positive $cal(H)^s$ measure.
    Choose a compact positive-measure subset $K_Q$ of that level set.
    Repeating the preceding argument with $K_Q$, choose a fixed point $p in K_Q$ and radii $L_i arrow.b
    0$ on which its normalized $s$-mass is bounded below. The resulting tangent cone is a $Q$-plane.
    Translate $p$ to zero, denote that plane by $Pi$, and set
  $ sigma_i = L_i^(- s) \( eta_(p \, L_i) \)_(\#) #scale(x: 120%, y: 120%)[\(] cal(H)^s #h(-0.16667em)
    corner.l.b \( K_Q ∩ overline(upright(bold(B)))_(L_i) \( p \) \) #scale(x: 120%, y: 120%)[\)] . $
  Compactness of $K_Q$ ensures that the support consists entirely of points from that integer-density level set.
    Dilation preserves both density and singularity. The asserted convergence and bounds follow. ◻
]

== 3 Normal cylinders and signed excess <sec:normal-inputs>

The next construction compares the varifold with a smooth reference disk, not necessarily a plane.
  We fix the geometric conventions and state the two measure estimates from #cite(label("AE")) used throughout the
  proof. The local minimal-fitting statements will be introduced when the reference disk is constructed in Section 4.

=== 3.1 Geometry and units <geometry-and-units>

Let $S$ be a small-slope $C^J$ graph over an $m$-plane, with a fixed normal tube and uniform bounds through a
  sufficiently large finite order $J$. In that tube write

$ X = y + z \, wide y = pi \( X \) in S \, wide z in N_y S . $

The horizontal and vertical subspaces are $T_y S$ and $N_y S$.
  Let $P_T$ denote orthogonal projection onto the approximate tangent plane of the varifold at $X$.
  For $v in N_y S$, the shape operator $cal(S)_v$ is defined by

$ chevron.l cal(S)_v a \, b chevron.r = chevron.l upright("II")_S \( a \, b \) \, v chevron.r \, wide a \,
  b in T_y S . $

Set

#[#set math.equation(numbering: n => "(3.1)")
 $ B = I - \( P_T \)_(h h) \, wide e = "tr" B = "tr" \( P_T \)_(v v) \, wide J_z = I - cal(S)_z \, wide K_z =
   J_z^(- 1) . $ <eq:normal-tensors>]

The tube is chosen so that $J_z$ and $K_z$ are uniformly bounded.
  The tensor $B$ is positive semidefinite, $0 lt.eq e lt.eq m$, and

#[#set math.equation(numbering: n => "(3.2)")
 $ \( P_T \)_(h v) \( P_T \)_(v h) = B - B^2 \, wide \| \( P_T \)_(v h) a \|^2 lt.eq B \[ a \, a \] \,
   wide \| \( P_T \)_(v h) \| lt.eq C sqrt(e) . $ <eq:projection-blocks>]

These follow by taking blocks in $P_T^2 = P_T$.

We restrict to an interior cylinder whose support is separated from its artificial vertical boundary above every
  compact subset of the base. Every field has compact base support and is multiplied by a vertical cutoff equal to
  one near the relevant support. Thus the restriction has no vertical boundary term in its first variation.
  All enlargements below stay inside this cylinder.

For the positive integer $Q$ being considered, define measures on $S$ by

#[#set math.equation(numbering: n => "(3.3)")
 $ M = pi_(\#) mu - Q "vol"_S \, wide D = pi_(\#) \( e mu \) . $ <eq:normal-measures>]

Here $M$ is signed and $D$ is nonnegative. In a specified physical system of Euclidean units,
  let $z_(upright("phys"))$ denote the unscaled normal displacement and put

#[#set math.equation(numbering: n => "(3.4)")
 $ Lambda = pi_(\#) \( lambda mu \) \, wide lambda = \| z_(upright("phys")) \|^2 + \| cal(H)_S \|^2 + \|
   nabla^perp cal(H)_S \|^2 \, wide cal(H)_S = "tr" upright("II")_S . $ <eq:physical-error>]

The curvature and its derivative in this formula are evaluated in those physical units.
  On scaling a base chart of physical radius $l$ to unit radius, all measures, including reference volume,
  are pushed forward and divided by $l^m$. The factor $lambda$ is still evaluated physically;
  it is not replaced by the squared rescaled height or the rescaled curvature.
  For a flat reference plane the estimates of #cite(label("AE")) use $Lambda = 0$.
  Charging an additional nonnegative height term in an upper bound does not weaken their applicability.

Normal frames are transported radially from the chart center,
  and base coordinates are normalized to have Euclidean metric at that center.
  For an interior subchart using the inherited frames, the small geometric parameter remains the original

#[#set math.equation(numbering: n => "(3.5)")
 $ gamma = l + sup \| z_(upright("phys")) \| . $ <eq:physical-gamma>]

This convention matters when the signed-excess theorem is used on much smaller cells:
  changing the coordinates alone does not improve a physical curvature error.

=== 3.2 The two imported measure estimates <the-two-imported-measure-estimates>

The first statement identifies an integer using a smooth projected mass average,
  then controls the total variation of $M$. The projected count $N \( y \)$ counts normal-fiber entries with their
  integer multiplicities at almost every base point; exceptional projection fibers are immaterial for the statement.

#thm([Lemma 3.1.])[
  (Scalar mass and propagation of the integer).  #emph[Fix dimensions, a bound for $Q$, bounded chart geometry,
    a mass bound, and an interior enlargement factor $c > 1$. Suppose
$ s^(- m) pi_(\#) mu \( B_(c s) \) lt.eq C_0 \, wide s^(- m) \( D + Lambda \) \( B_(c s) \) lt.eq epsilon.alt $

 with $epsilon.alt$ sufficiently small. Put $b = \( 1 + c \) \/ 2$.
   On the intermediate ball $B_(b s)$, the count selects an integer $q gt.eq 0$ with $"vol"_S { y in B_(b s) :
   N \( y \) eq.not q } lt.eq C epsilon.alt s^m$. There is a fixed finite test order $J_(upright("sc"))$ such
   that, for every smooth scalar test $eta$ supported in $B_(b s)$,
#[#set math.equation(numbering: n => "(3.6)")
 $ lr(|integral eta thin upright(d) \( pi_(\#) mu - q "vol"_S \)|) & lt.eq
   C epsilon.alt s^m parallel eta parallel_(C_s^(J_(upright("sc")))) \,\
parallel eta parallel_(C_s^(J_(upright("sc")))) & = max_(0 lt.eq j lt.eq J_(upright("sc"))) s^j parallel D^j eta
  parallel_oo . $ <eq:scalar-distribution-before-count>]

 The derivatives are in base coordinates; this test order is included among the finite orders fixed for the
   argument. For every nonnegative smooth test $chi$ supported in $B_(b s)$,
   with reference integral one and $s^m parallel chi parallel_(C_s^(J_(upright("sc")))) lt.eq
   C_1$ for a fixed constant $C_1$, one also has
#[#set math.equation(numbering: n => "(3.7)")
 $ lr(|integral chi thin upright(d) \( pi_(\#) mu \) - q|) lt.eq C epsilon.alt . $ <eq:scalar-average-before-count>]

 Here the constant may depend on $C_1$; the factor $s^m$ accounts for the size of a test whose integral,
   rather than its supremum, is one. In particular, if such an average is within $1 \/ 4$ of $Q$, then $q = Q$, and
#[#set math.equation(numbering: n => "(3.8)")
 $ \| M \| \( B_s \) + "vol"_S { y in B_s : N \( y \) eq.not Q } lt.eq
   C \( D + Lambda \) \( B_(c s) \) . $ <eq:scalar-input>]

 The same integer propagates along comparable working balls $B_s$ satisfying these bounds,
   provided their overlaps have fixed positive relative volume.
   The smallness threshold depends on that overlap fraction.]
] <lem:scalar-input>

This is #cite(label("AE")) Lemma 2.5 and its proof, including its distributional, smooth-average,
  and overlap conclusions. The distributional estimate first compares the projected measure with a scalar
  constant; the integer-count argument places that constant within $C epsilon.alt$ of $q$.
  It therefore gives Equation (3.6) before any identification with $Q$.
  The enlargement $c$ can be any fixed number greater than one, by a finite interior covering.
  In particular we use $c = 2$ when the room has already been fixed.
  The integer must be identified before applying Equation (3.8);
  a bound for the tilt alone does not specify which integer to subtract.

For a positive integer $j$, write $exp_j$ and $log_j$ for $j$-fold composition. For sufficiently large $T$, let

#[#set math.equation(numbering: n => "(3.9)")
 $ F_Q \( T \) = exp_(2 Q) #scale(x: 120%, y: 120%)[\(] sqrt(log_(2 Q) T) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:signed-rate>]

We will use only the properties

$ \( log T \)^a = o \( F_Q \( T \) \) quad upright("for every fixed ") a > 0 \, wide F_Q \( T \) = T^(o \( 1 \)) . $

#thm([Theorem 3.2.])[
  (Signed excess).  #emph[Fix an integer $Q gt.eq 1$ and $kappa > 0$.
    In the normal-cylinder setting above, scale a physical base radius $l$ to one and suppose $B_4$ is available.
    Set $tau = \| M \| + D + Lambda$. If
#[#set math.equation(numbering: n => "(3.10)")
 $ tau \( B_4 \) lt.eq d = e^(- T) \, wide l + sup \| z_(upright("phys")) \| lt.eq d^kappa \, $ <eq:signed-hypotheses>]

 where the supremum is over the restricted support above the available chart, then, for $T$ sufficiently large,
#[#set math.equation(numbering: n => "(3.11)")
 $ integral w thin upright(d) \( 2 M - D - C_Q Lambda \) lt.eq d exp \[ - F_Q \( T \) \] $ <eq:signed-input>]

 whenever $w$ is supported in $B_1$, $0 lt.eq w lt.eq 1$, and $"Lip" w lt.eq 1$.
   The finite derivative order $J$, threshold, and constants depend only on the stated fixed data.
   For a subchart in inherited frames, the second condition is imposed on $gamma$ in Equation (3.5).
   For a flat reference, take $Lambda = 0$ and omit the second condition.]
] <thm:signed-input>

This is #cite(label("AE")) Theorem 3.1. Multiplying the test by a fixed constant allows any fixed Lipschitz bound,
  with that constant on the right-hand side. The theorem does not assume that the multiplicity is bounded by $Q$:
  $Q$ is the integer subtracted in $M$.

=== 3.3 Fixed parameters <fixed-parameters>

All dimensional constants and interior enlargement factors are fixed before small scales are sent to zero.
  Fix an integer kernel exponent $p gt.eq 4$, put $J_0 = m + p + 4$, and choose

#[#set math.equation(numbering: n => "(3.12)")
 $ 0 < beta_1 < 1 / 4 \, wide 0 < zeta < min { 1 \, 1 \/ m } \, wide kappa > 0 \, wide
   kappa \( 2 J_0 + 4 \) < 2 beta_1 \, wide 3 kappa < zeta . $ <eq:parameter-order>]

We then fix derivative orders large enough for Theorem 4 and the compactness arguments below.
  Finally we choose the fitting order and its small height coefficient in Section 4. This order is noncircular:
  $J_0$, $beta_1$, $zeta$, and $kappa$ do not depend on the fitting order.
  The two inequalities in Equation (3.12) will respectively permit the signed comparison in the frequency estimate
  and in the height-normalized limit.

== 4 Fitting intervals and frequency control <sec:fitting>

Fix the singular origin, integer $Q$, plane $Pi$, and target scales $L_i arrow.b 0$ supplied by Proposition 2.
  The scales $L_i$ retain the measure of density-$Q$ centers,
  but were not chosen by any height or frequency criterion.
  We shall cover them by intervals on which a fitted center has uniform height doubling.
  The construction of the local fits comes from #cite(label("AE")) Section 7;
  the selection and comparison of successive fitting intervals are needed here because the origin need not satisfy
  a typical-point multiplicity condition.

At each start, local minimal graphs fit the support until their height test first fails.
  We glue these graphs to one reference disk. The failure scales determine the smallest radius on which we
  estimate its height and frequency. There are then two possibilities.
  If this radius is zero, the frequency estimates apply inward indefinitely.
  Otherwise we restart at a smaller scale where the varifold is again close to a plane.
  On late intervals carrying the targets, the preceding failure bounds the frequency at the outer end,
  and the new failure bounds it at the inner end. These two endpoint bounds are what make height doubling uniform.
  The last subsection proves that the resulting intervals contain every sufficiently late $L_i$;
  no coverage of arbitrary small scales is required.

=== 4.1 Local fits and their gluing <local-fits-and-their-gluing>

A #emph[good start] is a sufficiently small dyadic scale $R$ for which $V_R$ is within a fixed small weak-varifold
  distance of a multiplicity-$Q$ plane through the origin in $upright(bold(B))_2000$.
  Use a metric on varifolds with bounded mass, and choose a plane whose distance realizes,
  or approximates within a fixed factor, the best distance.
  In particular, if this distance tends to zero, the corresponding varifolds converge to their chosen planes after
  taking a subsequence. Throughout a start we work in units of $R$ and take its chosen plane as horizontal;
  $mu$ denotes the weight of $V_R$ until target units are introduced explicitly.

The goodness threshold will be decreased a finite number of times below.
  Weak convergence to a plane, support convergence, and monotonicity then provide a cylinder with base containing
  $B_300$, fixed vertical room, and a support-free gap at its vertical boundary.
  From now on $mu$ is restricted to this working cylinder, as in Section 3;
  every support condition in the fitting construction refers to this restriction.
  On its interior we have the upper mass bound $mu \( upright(bold(B))_u \( X \) \) lt.eq
  C u^m$ at all radii used below, arbitrarily small support height and weak mass error, and small tilt.
  The scalar estimate of #cite(label("AE")) Lemma 2.5 also gives small projected mass defect on smaller cylinders.
  These statements concern all support points in the cylinder, not a selected collection of sheets.
  Since the density at the origin is $Q$, we require the start to be small enough that all needed smaller and
  fixed-factor larger density ratios at the origin are uniformly as close to $Q$ as prescribed.

Choose a finite center derivative order $J > m \/ 2 + 6$,
  larger than the orders needed for the signed estimate and subsequent compactness arguments.
  Apply the fitting lemma with order at least $J + 1$; denote its exponent $k_0$ by $k$. In particular,

#[#set math.equation(numbering: n => "(4.1)")
 $ k > 4 + m \/ 2 . $ <eq:fitting-order>]

Next choose its height parameter $m_0 > 0$ sufficiently small. We recall precisely the fitting information to be used.

#thm([Lemma 4.1.])[
  (Local fitting inputs).  #emph[For every $x in B_5$, there are smooth minimal graphs $S_(x \, ell) =
    "graph" f_(x \, ell)$ over $B_(80 ell) \( x \)$, at descending dyadic scales $ell = 2^(- j)$ starting at $j =
    0$, through the first scale at which
$ sup { \| X_v - f_(x \, ell) \( X_h \) \| : X in "spt" mu \, med X_h in B_(64 ell) \( x \) } lt.eq m_0 ell^k $

 fails. Every constructed fit, including the first failed one,
   has support height at most $C m_0 ell^k$ on the fixed interior enlargements of this test ball.
   On $B_(70 ell) \( x \)$ its normalized tilt and projected mass defect are bounded by $C m_0^2 ell^(2 k - 2)$.
   For a fixed-base smooth vector test $eta$ supported in $B_(70 ell) \( x \)$, put $eta_(x \, ell) \( w \) =
   eta \( x + ell w \)$ on $B_70$. Its first height moment is bounded by $C m_0^2 ell^(m + 2 k - 1) parallel
   eta_(x \, ell) parallel_(H^q \( B_70 \))$, for some fixed integer $q$.
   Thus the test norm is taken after rescaling the base ball by $ell^(- 1)$, with no additional amplitude factor.
   Comparable overlapping fits differ in derivative order $j lt.eq J +
   1$ by at most $C m_0^2 ell^(2 k - 1 - j)$ on smaller common balls.
   Their fixed-coordinate derivatives are uniformly bounded,
   and their slopes are arbitrarily small when $m_0$ is small.]
  #emph[At a first failure $\( x \, ell \)$, every fixed sufficiently small comparable base subball with center in
    $B_(30 ell) \( x \)$ contains a set of base volume at least $c
    ell^m$ whose normal fibers contain two entries separated by at least $c m_0 ell^k$.
    Both entries have small tangent tilt relative to the fit and lie at height at most $C m_0 ell^k$ from it.
    The constants may depend on the fixed relative subball radius and tilt threshold,
    but not on the start or the failed scale.]
] <lem:local-fits>

These are #cite(label("AE")) Lemmas 7.1–7.2 and Equations (7.7)–(7.8).
  Only small initial height and mass error are required for these inputs.
  Indeed the scale-zero correction uses the horizontal plane and smooth mass averages identifying $Q$;
  subsequent corrections use the preceding fit and its selected integer.
  Compatibility and failed-fit separation use these estimates and the failed height test.
  The multiplicity-defect condition imposed later in that source is not used in these arguments.
  At every new scale the preceding fit already bounds all support heights on a horizontal enlargement.
  Consequently the normal cylinders used in the estimates retain a support-free vertical gap and sufficient
  interior room. The initial cylinder supplies this property at scale zero.

Write $ell_x$ for the first failed scale, and put $ell_x = 0$ if no failure occurs.
  We use the failures in two ways. Their tents prescribe a spatially varying scale for gluing the local fits;
  the largest failure whose $16$-fold base ball contains the origin determines the lower end of the radial
  interval. Define these two quantities by

#[#set math.equation(numbering: n => "(4.2)")
 $ t \( w \) = sup_(x in B_5) \( ell_x - \| w - x \| \)_(+) \, wide b =
   max #scale(x: 120%, y: 120%)[\(] { ell_x : \| x \| lt.eq 16 ell_x } union { 0 } #scale(x: 120%, y: 120%)[\)] .
   $ <eq:tents>]

The maximum exists because the nonzero scales are dyadic.
  The function $t$ is $1$-Lipschitz, $t \( 0 \) lt.eq b$, and hence $t \( w \) lt.eq b + \| w \|$.
  By decreasing the goodness threshold, every failure scale can be made smaller than any prescribed fixed positive
  number. Otherwise the separated entries in Lemma 5, whose direction is nearly vertical,
  contradict convergence of the support to the start plane on the initial cylinder.

Glue the fits using the construction in the proof of #cite(label("AE")) Proposition 7.3,
  before its multiplicity-defect argument. For clarity, regularize $t$ by $t_epsilon.alt =
  max \( t \, epsilon.alt \)$, cover by balls of radii a small fixed multiple of $t_epsilon.alt$,
  and choose a partition of unity with derivatives controlled at those scales.
  At a cell center use a constructed dyadic fit of scale comparable to $t_epsilon.alt$ and larger than its failure
  scale. The overlap estimate in Lemma 5 controls derivatives of the partitioned differences.
  Passing to a $C^J$ limit as $epsilon.alt arrow.b 0$ gives a graph $S$ with small slope and uniformly bounded
  $C^J$ geometry, for which

#[#set math.equation(numbering: n => "(4.3)")
 $ \| cal(H)_S \| + \| nabla^perp cal(H)_S \| lt.eq C m_0^2 t^(2 k - 4) \, wide \| z \| lt.eq C m_0 t^k quad
   upright("on the support") . $ <eq:glued-center>]

Here $t$ is evaluated at the fixed horizontal argument; in the height bound one may equivalently use the
  horizontal argument of the nearest projection. The same estimate holds for vertical graph-height differences at
  fixed horizontal argument. On a cell of size comparable to $t > 0$,
  the glued graph differs from a constructed fit of comparable scale by at most $C m_0^2 t^(2 k - 1)$ in height.
  These statements follow from the overlap estimate for the finitely many comparable fits in each partition sum;
  they require no density statement about ${ t > 0 }$.

We make slopes, normal tubes, and geodesic coordinate neighborhoods small enough that the relevant
  parametrizations and nearest projections have Lipschitz constants below $3 \/ 2$.
  The point of $S$ over horizontal $0$ is at distance at most $C m_0 b^k$ from ambient $0$.
  Use this point as radial center on $S$, and denote geodesic distance from it by $rho$.
  Fix $B_(*) = 100$ and a sufficiently small $r_(*) > 0$. We shall work on

#[#set math.equation(numbering: n => "(4.4)")
 $ B_(*) b lt.eq r lt.eq 4 r_(*) \, wide r > 0 . $ <eq:fitting-radius-range>]

All these radii lie strictly inside one geodesic chart. The maximum failure scale is taken small enough that the
  interval has the required interior room.

=== 4.2 Weighted height on a fitting interval <weighted-height-on-a-fitting-interval>

Using the integer $p gt.eq 4$ fixed in Section 3, define

$ phi.alt = \( 1 - rho^2 \/ r^2 \)_(+)^p \, wide psi = 2 p \( 1 - rho^2 \/ r^2 \)_(+)^(p - 1) . $

Use the normal-cylinder notation of the preceding section.
  In particular, $B = I - \( P_T \)_(h h)$, $e = "tr" B$, $J_z = I - cal(S)_z$, and $K_z = J_z^(- 1)$.
  Put $u = nabla_S rho$, $v_z = K_z u$, and

$ b_z = B \[ v_z \, v_z \] \, wide h = 1 - b_z \/ \| v_z \|^2 . $

Then $0 lt.eq h lt.eq 1$. On the central fiber choose any horizontal unit vector in place of $u$.
  If this fiber has positive mass, its tangent is purely vertical almost everywhere on the fiber by
  rectifiability, so $h = 0$ there almost everywhere. The reason for this factor is the sharp projection inequality

$ \| \( P_T \)_(v h) v_z \|^2 = B \[ v_z \, v_z \] - \| B v_z \|^2 lt.eq b_z - frac(b_z^2, \| v_z \|^2) = b_z h . $

Weighting squared height by $h$ will therefore pair it directly with the radial tilt $b_z$ in Cauchy–Schwarz.
  No positive lower bound for $h$ is assumed. Define

#[#set math.equation(numbering: n => "(4.5)")
 $ H & = r^(- m) integral psi \| z \|^2 h thin upright(d) mu \, & delta & =
   r^(- 1) sup_(rho < r \, med X in "spt" mu) \| z \| \,\
A & = r^(2 - m) integral phi.alt thin upright(d) M \, & E_(*) & = r^(2 - m) integral phi.alt thin upright(d) D \,\
R_(*) & = r^(- m) integral rho^2 psi b_z thin upright(d) mu . $ <eq:interval-quantities>]

The radius in the supremum refers to the projected point.
  These quantities will compare neighboring radii without requiring that the center be minimal.

#thm([Lemma 4.2.])[
  (Weighted bounds).  #emph[On (4.4), $delta > 0$, $delta lt.eq C r^(k - 1)$, and normalized mass is bounded.
    For $J_0 = m + p + 4$ as fixed in Section 3,
#[#set math.equation(numbering: n => "(4.6)")
 $ c delta^(J_0) & lt.eq H \/ r^2 lt.eq C delta^2 \,\
\| cal(H)_S \| + \| nabla^perp cal(H)_S \| & lt.eq C delta r quad \( rho < r \) \,\
integral phi.alt #scale(x: 120%, y: 120%)[\(] \| cal(H)_S \|^2 + \| nabla^perp cal(H)_S \|^2
  #scale(x: 120%, y: 120%)[\)] thin upright(d) mu & lt.eq C integral phi.alt \| z \|^2 thin upright(d) mu .
  $ <eq:height-power-bounds>]

 Moreover a nonnegative smooth test $chi_r$, with reference integral one and support in ${ rho < r \/ 4 }$,
   can be chosen so that its projected mass average is within $1 \/ 8$ of $Q$ and $r^m parallel chi_r
   parallel_(C_r^(J_(upright("sc")))) lt.eq C$. All constants are uniform among good starts.]
] <lem:weighted-bounds>

#proof[
  If $t \( w \) > 0$ and $rho \( w \) < r$, choose a failure $\( x \, ell \)$ for which $ell - \| w -
    x \| > t \( w \) \/ 2$. Since $\| w \| lt.eq r$, either $\| x \| lt.eq 16 ell$ or $16 ell < r + ell$. Thus
  #[#set math.equation(numbering: n => "(4.7)")
   $ ell lt.eq max \( b \, r \/ 15 \) lt.eq r \/ 15 . $ <eq:witness-size>]
  Equation (4.3) gives $delta lt.eq C r^(k - 1)$. The projected cylinder is contained in an ambient ball of
    comparable radius, so monotonicity gives its normalized mass bound.
  If $delta = 0$, the support lies on $S$ in a neighborhood of ambient $0$:
    its projection lies inside ${ rho < r }$ because its distance from the radial center is $O \( m_0 b^k \)$.
    Tangential stationarity then makes the multiplicity, extended by zero on the disk, constant.
    It is positive because $0$ belongs to the support. Normal stationarity and elliptic regularity make $S$ smooth
    and minimal there. This contradicts the singularity of $0$.
  We next locate the height that pays for a witness. The argument is the weighted construction of
    #cite(label("AE")) Proposition 7.4, with (4.7) replacing its typical-point estimate.
    If the witness is near the kernel boundary, move inward by $ell$ along the radial geodesic and take a ball of
    radius a sufficiently small fixed multiple of $ell$; otherwise take a nearby such ball.
    This ball lies within the kernel support, and its center remains within $B_(30 ell) \( x \)$ in the fitting
    coordinates. On it $phi.alt$ and $psi$ dominate, up to fixed constants,
    their suprema on a small cell containing the original point, and $psi gt.eq c \( ell \/ r \)^(p - 1)$.
    Lemma 5 supplies separated entries above a set of base volume $c ell^m$.
    Two entries separated in a nearly vertical direction cannot both lie within a sufficiently small multiple of
    their separation from a small-slope graph. After transferring to $S$,
    at least one entry therefore has height at least $c m_0 ell^k$ and $h gt.eq 3 \/ 4$.
    Small slopes and the height bounds make changes of horizontal argument smaller than the available subball
    margin. The projection Jacobian bound converts base volume into the same lower bound for mass.
  In particular $delta r gt.eq c m_0 ell^k$. At a point approaching the height supremum,
    the witness also satisfies $delta r lt.eq C m_0 ell^k$, by (4.3). Hence
  $ H \/ r^2 gt.eq c delta^2 \( ell \/ r \)^(m + p - 1) \, wide ell \/ r gt.eq c delta^(1 \/ k) \, $
  where the last inequality uses $r lt.eq 1$. This proves the lower bound in (4.6), for example with $J_0 gt.eq
    2 + \( m + p - 1 \) \/ k$; its upper bound follows from the mass bound.
    The comparison $delta r gt.eq c m_0 ell^k$, together with $k > 4$, proves (4.6).
  To prove (4.6), group witnesses by dyadic scale and use each covering grid cell once at its scale.
    By (4.3), the curvature-square integral on a cell of size $ell$ is at most $C m_0^4 ell^(4 k - 8 + m) sup
    phi.alt$. Its paying ball contributes at least $c m_0^2 ell^(2 k + m) sup
    phi.alt$ to the height-square integral. At each scale the paying balls have bounded overlap,
    since they are moved by only $O \( ell \)$. Summing the factors $C m_0^2 ell^(2 k - 8)$ proves the assertion.
    The cells may be used as an overcover, so no measurable choice of witnesses is necessary.
  Finally choose a smooth decreasing radial mass test on a small fixed fraction of $r$.
    Compare it with the corresponding ambient radial test at $0$.
    The displacement of the center is $O \( m_0 b^k \)$, the support height is $O \( r^k \)$,
    and chord and geodesic radii on $S$ differ by $O \( r^3 \)$.
    The radius replacement has error $O \( r^2 \)$, so the normalized averages differ by $O \( r \)$,
    including their reference normalizations. All support encountered by the ambient test lies in the cylinder and
    has projected radius below $r \/ 2$. The ambient average is close to $Q$ by the density-ratio requirement at
    the start. Decreasing the fixed parameters gives the stated $1 \/ 8$ bound. ◻
]

=== 4.3 Frequency estimates and their inward consequences <frequency-estimates-and-their-inward-consequences>

The preceding lemma gives positive height and the single-radius hypotheses for the frequency calculation. Set

$ P = A \/ H \, wide n_(*) = E_(*) \/ H \, wide q_(*) = R_(*) \/ H \, wide T = log \( r^2 \/ H \) \, wide g =
  T^(- 20) . $

Then $T$ is comparable to $\| log delta \|$ and $T gt.eq 2 \| log r \| - C$.
  A dot denotes differentiation with respect to $log r$.

The use of signed mass in $P = A \/ H$ is dictated by horizontal stationarity, which controls $dot(A)$.
  To see the intended cancellation, temporarily omit the geometric errors in the estimates below.
  Signed excess gives $2 P lt.eq n_(*)$, the sharp flux inequality gives $n_(*)^2 lt.eq q_(*)$,
  and the variation identities give $dot(A) \/ H = 2 P - n_(*) + q_(*)$ and $dot(H) \/ H lt.eq 2 n_(*)$.
  For $P gt.eq 0$ these imply

$ dot(P) gt.eq 2 P - n_(*) + n_(*)^2 - 2 P n_(*) = \( n_(*) - 1 \) \( n_(*) - 2 P \) . $

This expression is nonnegative when $P gt.eq 1 \/ 2$. The next two lemmas quantify the errors and recover the
  inward bounds and height comparison needed on a fitting interval.

#thm([Lemma 4.3.])[
  (Frequency on a fitting interval).  #emph[After fixing $r_(*)$ sufficiently small,
    on (4.4) the following inequalities hold:
#[#set math.equation(numbering: n => "(4.8)")
 $ \| P \| & lt.eq C \( n_(*) + r^2 \) + eta q_(*) \,\
2 P & lt.eq n_(*) + C g \( n_(*) + 1 \) + C r^2 + eta q_(*) \,\
n_(*) & lt.eq sqrt(q_(*)) + C r^2 + eta n_(*) \,\
lr(|dot(A) \/ H - \( 2 P - n_(*) + q_(*) \)|) & lt.eq C { r sqrt(q_(*)) + r^2 \( 1 + n_(*) \) } +
  eta \( n_(*) + q_(*) \) \,\
- m lt.eq dot(H) \/ H & lt.eq 2 n_(*) + C r + eta \( n_(*) + q_(*) \) . $ <eq:freq-absolute>]

 Here $eta = C delta^alpha lt.eq C' e^(- c T)$ for fixed positive $alpha \, c$,
   and constants are uniform among intervals. The functions whose derivatives occur are locally absolutely
   continuous in $log r$.]
] <lem:interval-frequency>

#proof[
  We verify the transfer of the calculation in #cite(label("AE")) Lemmas 8.1–8.2;
    this also identifies the precise single-radius inputs. The definitions and positivity of $B$ give
  #[#set math.equation(numbering: n => "(4.9)")
   $ r^(- m) integral phi.alt \| z \|^2 thin upright(d) mu & lt.eq C \( H + delta^2 E_(*) \) \,\
r^(- m) integral psi \| z \|^2 thin upright(d) mu & lt.eq C { H + delta^2 \( E_(*) + R_(*) \) } \,\
r^(- m) integral phi.alt thin upright(d) Lambda & lt.eq C \( H + delta^2 E_(*) \) . $ <eq:weighted-height-comparisons>]
  For the first bound use $1 - h lt.eq C e$; for the second split at $r \/ 2$ and use $1 - h lt.eq
    C b_z$ on the outer part. The last bound also uses (4.6), with physical units equal to the current start units.
  Here are the details of the mass comparison, where preserving the coefficient one in (4.8) is essential.
    For the fixed $0 < beta_1 < 1 \/ 4$ put $gamma_1 = delta^(beta_1)$.
    Away from the outer collar we use signed excess; on the collar we use a radial first-variation test.
    Choose a radial cutoff $chi$ equal to one at relative depth $1 - rho \/ r lt.eq
    gamma_1^2$ and zero at depth at least $2 gamma_1^2$, and put
  $ phi.alt_(upright("thin")) = chi phi.alt \, wide phi.alt_(upright("bulk")) = \( 1 - chi \) phi.alt . $
  Cover the support of $phi.alt_(upright("bulk"))$ by cells centered at $x_j$ of radius $lambda_1 =
    c_1 gamma_1^2 r$, with a smooth partition of unity $theta.alt_j$ and bounded overlap of fixed enlargements.
    Choose $c_1$ small enough that these enlargements stay inside ${ rho <
    r }$ and $phi.alt$ is comparable there to $phi.alt_j = phi.alt \( x_j \)$.
    Their mass is $O \( lambda_1^m \)$ because $delta r = o \( lambda_1 \)$.
    Testing normal stationarity with a cutoff times $z$ and using (4.6) yields
  $ lambda_1^(- m) \( D + Lambda \) \( B_(c lambda_1) \) lt.eq C delta^(2 - 4 beta_1) . $
  This is the local estimate in #cite(label("AE")) Equation (8.6).
    The scalar estimate selects an integer on each cell; the small exceptional projection sets cannot fill the
    prescribed overlaps, so the integers agree throughout the connected bulk; call their value $q$.
    Put $epsilon.alt = C delta^(2 - 4 beta_1)$. Partition the smooth mass test from Lemma 6 over the cells.
    Each piece has the scaled derivative norm in Equation (3.6) bounded by $C r^(- m)$.
    That homogeneous estimate bounds its error relative to $q$ by $C epsilon.alt lambda_1^m r^(- m)$,
    without dividing by the piece’s possibly small integral. Bounded overlap gives $sum lambda_1^m lt.eq C r^m$,
    so the total error is $O \( epsilon.alt \)$. Since the test average is within $1 \/ 8$ of $Q$,
    integrality gives $q = Q$.
  The scalar estimate now bounds $\| M \| \( B_(4 lambda_1) \( x_j \) \)$ by
    $C \( D + Lambda \) \( B_(8 lambda_1) \( x_j \) \)$. Summing with comparable weights gives the absolute bulk
    estimate
  #[#set math.equation(numbering: n => "(4.10)")
   $ r^(2 - m) integral phi.alt_(upright("bulk")) thin upright(d) \| M \| lt.eq
     C r^(2 - m) integral phi.alt thin upright(d) \( D + Lambda \) lt.eq C \( E_(*) + r^2 H \) . $ <eq:bulk-absolute>]
  In the last inequality a small multiple of $E_(*)$ is absorbed using (4.9).
  For signed excess, use fresh charts on the cells and set
  $ d_j = max { C lambda_1^(- m) tau \( B_(4 lambda_1) \( x_j \) \) \, delta^(2 J_0 + 4) } \, wide T_j = -
    log d_j \, wide tau = \| M \| + D + Lambda . $
  The local bounds and the floor give $c \| log delta \| lt.eq T_j lt.eq \( 2 J_0 + 4 \) \| log delta \|$.
    The physical smallness hypothesis follows from
  $ lambda_1 + sup \| z \| lt.eq C delta^(2 beta_1) \, wide kappa \( 2 J_0 + 4 \) < 2 beta_1 . $
  These are precisely the fixed parameter choices in Equation (3.12);
    the required derivative orders were chosen after $J_0$ and $kappa$, and before the fitting exponent.
    The partitioned tests $theta.alt_j phi.alt_(upright("bulk")) \/ \( C phi.alt_j \)$ have size and Lipschitz
    constant at most one in cell units. Applying signed excess to these tests and restoring the measure factors gives
  $ 2 r^(2 - m) integral phi.alt_(upright("bulk")) thin upright(d) M & lt.eq
    r^(2 - m) integral phi.alt_(upright("bulk")) thin upright(d) D +
    C_Q r^(2 - m) integral phi.alt_(upright("bulk")) thin upright(d) Lambda\
 & quad + C r^(2 - m) sum_j phi.alt_j lambda_1^m d_j e^(- F_Q \( T_j \)) . $
  The weighted budgets satisfy
  $ sum_j phi.alt_j lambda_1^m d_j lt.eq C integral phi.alt thin upright(d) \( D + Lambda \) +
    C r^m delta^(2 J_0 + 4) \, $
  by scalar control on the enlarged cells and bounded overlap.
    The exponential factor is smaller than any fixed negative power of $T$,
    and the floor costs $r^2 delta^(2 J_0 + 4) lt.eq C delta^(J_0 + 4) H$ by (4.6).
    The signed-excess remainder is therefore at most $C g \( E_(*) + H \)$.
    The separate $C_Q Lambda$ term is bounded by $C r^2 H + C r^2 delta^2 E_(*)$; since $r^2 delta^2 = o \( g \)$,
    it contributes only $C r^2 H + C g E_(*)$. This proves the bulk signed comparison with leading tilt coefficient one.
  For the thin part, let $a$ be a multiplier with $sup \( \| a \| + r \| nabla_S a \| \) lt.eq 1$.
    The radial primitive constructed in #cite(label("AE")) Lemma 8.1, Equation (8.11),
    cut off at relative depths between $gamma_1$ and $2 gamma_1$, gives a compactly supported tangent field $X$ with
  $ "div"_S X = a phi.alt_(upright("thin")) + q_c \, wide \| X \| \/ r + \| nabla^S X -
    a phi.alt_(upright("thin")) u ⊗ u \| lt.eq C gamma_1^2 phi.alt . $
  Here $q_c$ is supported on that thicker cutoff collar and $\| q_c \| lt.eq C gamma_1^(p + 1) phi.alt$.
    Its mass contribution is controlled by the absolute bulk estimate (4.10).
    In horizontal stationarity, the principal derivative of $X$ pairs with radial tilt $B \[ u \, u \]$;
    the remaining derivative has the small factor $gamma_1^2$. The resulting bound is
  $ r^(2 - m) lr(|integral a phi.alt_(upright("thin")) thin upright(d) M|) & lt.eq
    C r^(2 - m) integral phi.alt_(upright("thin")) B \[ u \, u \] thin upright(d) mu + C delta^alpha E_(*) + C r^2 H\
 & lt.eq C delta^(alpha') \( E_(*) + R_(*) \) + C r^2 H . $
  For the last inequality use, on the thin collar, $phi.alt_(upright("thin")) lt.eq
    C gamma_1^2 \( rho \/ r \)^2 psi$ and $B \[ u \, u \] lt.eq 2 b_z + C \| z \|^2 e$.
    The errors use only horizontal stationarity, fixed geodesic geometry, and (4.9).
    Combining the absolute bulk and thin estimates proves (4.8),
    including its version with any bounded scaled $C^1$ multiplier.
    For the signed estimate take $a = 1$ and combine with the signed bulk bound.
    The small tilt error is absorbed in $C g E_(*)$, since every positive power of $delta$ is $o \( g \)$;
    the radial error remains $eta R_(*)$. This proves (4.8).
  Normal stationarity gives the flux estimate
  $ lr(|E_(*) - r^(- m) integral rho psi thin z dot.op \( P_T \)_(v h) v_z thin upright(d) mu|) lt.eq C r^2 H +
    eta E_(*) . $
  Projection algebra gives the exact inequality $\| \( P_T \)_(v h) v_z \|^2 lt.eq b_z h$;
    Cauchy–Schwarz proves (4.8). Horizontal stationarity with the lift of $rho u$ gives (4.8),
    as in #cite(label("AE")) Lemma 8.2. Its geodesic volume-distortion multiplier has bounded scaled $C^1$ norm,
    so the preceding absolute estimate applies with a uniform constant.
  One modification is needed for the height identity because our center need not pass through ambient $0$.
    Off the central fiber put
  $ Y = frac(rho K_z u, \| K_z u \|^2) . $
  Then $D Y = P_h + O \( rho + \| z \| \)$, where $P_h$ is horizontal projection at the nearest point of $S$.
    To see this, the pulled-back radial field $rho u$ has derivative $P_h + O \( rho + \| z \| \)$.
    Its correction in $Y$ is $rho$ times a function of the tube coordinates and $u$ that is $O \( \| z \| \)$,
    including its angular derivatives. Angular differentiation therefore costs $rho dot.op O \( \| z \| \) \/
    rho = O \( \| z \| \)$, and the remaining derivative costs $O \( rho \)$.
    Testing with $psi \| z \|^2 Y$ gives the following identity,
    whose integrand is extended by zero on the central fiber:
  #[#set math.equation(numbering: n => "(4.11)")
   $ dot(H) = r^(- m) integral psi {\| z \|^2 \( "tr" \( P_T D Y \) - m h \) +
     frac(2 rho z dot.op \( P_T \)_(v h) K_z u, \| K_z u \|^2)} thin upright(d) mu . $ <eq:interval-height-identity>]
  This is #cite(label("AE")) Equation (8.18). First omit the central fiber using a radial cutoff.
    The transition term tends to zero because $Y = O \( rho \)$ and the mass of the open shrinking transition
    annulus tends to zero. On the fiber $h = 0$ almost everywhere, so the left-hand side is unchanged;
    the flux term has a factor $rho$. The error in $D Y$ is $O \( r \)$ on the support,
    and (4.9) and the normal flux estimate give the upper bound in (4.8).
    The lower bound follows by direct differentiation of the nonnegative weight $r^(- m) psi$.
    All parameter choices have been fixed independently of the start. ◻
]

We now extract the ODE consequences before selecting successive starts.
  The proof adapts #cite(label("AE")) Proposition 8.3 to finite intervals with controlled endpoint values.

#thm([Lemma 4.4.])[
  (Inward control).  #emph[There is a fixed large $K$ such that, writing $v_0 = dot(A) \/ H$,
#[#set math.equation(numbering: n => "(4.12)")
 $ \| P \| gt.eq K quad arrow.r.double quad q_(*) \/ \| P \| gt.eq c min \( \| P \| \, eta^(- 1) \) \, wide
   v_0 gt.eq c q_(*) . $ <eq:large-frequency>]

 When $K lt.eq P lt.eq T^4$,
#[#set math.equation(numbering: n => "(4.13)")
 $ dot(P) gt.eq - C \( r P + g P^2 \) . $ <eq:moderate-frequency>]

 A lower bound for $P$ at the smaller-radius endpoint of a finite interval gives a lower bound throughout that
   interval. On an interval extending to zero, $P$ is bounded below for all sufficiently small radii.
   If at a sufficiently small starting radius $r_0$ one has $P_0 lt.eq T_0^2$, then inward throughout the interval
#[#set math.equation(numbering: n => "(4.14)")
 $ P lt.eq exp \( 1 \) max \( K \, P_0 \) . $ <eq:inward-upper>]

 Such a starting radius exists on every interval extending to zero.
   Finally, wherever $\| P \| lt.eq C_0$ and $eta$ is sufficiently small depending on $C_0$,
   every fixed bounded-ratio subinterval satisfies
#[#set math.equation(numbering: n => "(4.15)")
 $ H \( r' \) asymp H \( r'' \) \, wide integral q_(*) thin upright(d) log r lt.eq C . $ <eq:height-doubling>]

 The constants in the last conclusion depend on $C_0$ and the radius ratio, not on the position of the interval.]
] <lem:inward-control>

#proof[
  Equations (4.8) and (4.8) imply $\| P \| lt.eq C \( sqrt(q_(*)) + r^2 \) + C eta q_(*)$.
    For $\| P \|$ large, either the square-root term or the last term controls a fixed fraction of $\| P \|$,
    proving the first assertion of (4.12). Equation (4.8) then gives its second assertion,
    after increasing $K$ and decreasing $r_(*)$.
  For positive $P$, quotient differentiation and the upper height bound give the principal expression $2 P -
    n_(*) + q_(*) - 2 P n_(*)$, with the errors displayed in Lemma 7.
    If $q_(*)$ is larger than a sufficiently large fixed multiple of $P^2$, it absorbs all negative terms,
    since $n_(*) lt.eq C sqrt(q_(*)) + C r^2$ and $eta T^4 = o \( 1 \)$. Otherwise $n_(*) lt.eq C P$ and
  $ q_(*) gt.eq n_(*)^2 - C r^2 P - C eta P^2 \, wide n_(*) gt.eq 2 P - C \( g P + r^2 + eta P^2 \) . $
  For large $K$ the principal terms factor as $\( n_(*) - 1 \) \( n_(*) - 2 P \)$, bounded below by $-
    C P \( g P + r^2 + eta P^2 \)$. Since $eta T^4 lt.eq g$ at small radii,
    the term $eta P^3$ is absorbed by $g P^2$. This proves (4.13).
  If $P lt.eq - K$, the lower height bound gives $dot(P) = v_0 - P dot(H) \/ H gt.eq c q_(*) - m \| P \| > 0$.
    Thus $P$ decreases in inward time $- log r$ whenever it is below $- K$.
    This proves the finite-interval lower bound from the inner endpoint.
    On an infinite interval, such an excursion would also make $A <
    0$ decrease inward and remain below a fixed negative value. That is impossible because $A arrow.r 0$:
    its normalized mass integral is bounded and it has a factor $r^2$.
  To prove the upper bound, work on a component where $P gt.eq K$ before any exit through $P = T^4$.
    In inward time, (4.13) gives
  $ \( log P \)' lt.eq C \( r + T^(- 16) \) . $
  The integral of this right-hand side from a sufficiently small radius to zero is less than one, since $T gt.eq
    2 \| log r \| - C$. Moreover $Z = T - log P = log \( r^2 \/ A \)$ satisfies $Z' = v_0 \/ P - 2 > 0$ by (4.12).
    If the component starts at $r_0$ with $P_0 lt.eq T_0^2$, then $P lt.eq exp \( 1 \) P_0$ and $T gt.eq T_0 -
    log P_0 + log K gt.eq T_0 \/ 2$. For large $T_0$ these inequalities exclude $P = T^4$.
    Components starting later at $P = K$ satisfy the same argument, giving (4.14).
  On an infinite interval, suppose no sufficiently small radius satisfied $P lt.eq T^2$.
    Then eventually $P > T^2$, and (4.12) implies $Z' gt.eq c T^2 - 2$.
    The lower bound for $T$ makes $Z$ positive eventually. Since $Z lt.eq T$ in this regime,
    one then has $Z' gt.eq c' Z^2$, which forces blow-up in finite inward time.
    The continuous positive quantities $A \, H$ are defined at every finite time in this regime, a contradiction.
  Finally, for $\| P \| lt.eq C_0$, use the upper height derivative bound if $P gt.eq
    0$ and the lower bound if $P < 0$. Absorbing $eta q_(*)$ gives
  $ dot(P) gt.eq c q_(*) - C_(C_0) . $
  Integration bounds $integral q_(*) thin upright(d) log r$ on every bounded-ratio interval.
    Equation (4.8) and Cauchy–Schwarz bound $integral n_(*) thin upright(d) log r$,
    and (4.8) gives both height comparisons in (4.15). ◻
]

=== 4.4 Covering the prescribed target scales <covering-the-prescribed-target-scales>

We have obtained height comparison whenever the frequency can be bounded above and below on a radial interval.
  For a finite interval, Lemma 8 uses an upper bound at its outer endpoint and a lower bound at its inner
  endpoint. The restart construction supplies them from different failures:
  the preceding start’s failure supplies the outer bound, and the current start’s failure supplies the inner
  bound. If no failure occurs near the origin, the interval extends to zero and the infinite-interval conclusions
  of that lemma apply instead.

We first define the starts and prove that their intervals contain the prescribed targets.
  Fix $N_(*) = 1000$, and choose a dyadic factor

#[#set math.equation(numbering: n => "(4.16)")
 $ F > 10 N_(*) B_(*) \/ r_(*) . $ <eq:restart-factor>]

Decrease the maximum failure scale so that $F b < 1 \/ 4$ and $8 N_(*) B_(*) b < r_(*)$ for every good start.
  Its target interval is

#[#set math.equation(numbering: n => "(4.17)")
 $ B_(*) b R lt.eq L lt.eq \( r_(*) \/ N_(*) \) R \, wide L > 0 . $ <eq:target-interval>]

Starting at one good dyadic $R$, if $b > 0$ choose the next start to be the largest good dyadic scale at most $F b
  R$; if $b = 0$, stop. Such a next start always exists: every dyadic scale comparable to a sufficiently late
  $L_i$ by fixed factors is good, because $V_(L_i) arrow.r Q \| Pi \|$ locally.

#thm([Proposition 4.5.])[
  (Uniform comparison at the targets).  #emph[All sufficiently late $L_i$ belong to intervals (4.17).
    After passing to a subsequence, either one interval extends to zero and contains all these targets,
    or the indices of their covering intervals tend to infinity.
    In the latter case, on each sufficiently late covering interval,
#[#set math.equation(numbering: n => "(4.18)")
 $ \| P \( r \) \| lt.eq C wide \( B_(*) b lt.eq r lt.eq r_(*) \) \, $ <eq:uniform-frequency-range>]

 and (4.15) holds there with uniform constants. In the former case the same conclusions hold on the sufficiently
   small-radius part of the fixed interval.]
] <prop:target-frequency>

#proof[
  #emph[Coverage of the targets.] The top of the interval belonging to $R$ is $\( r_(*) \/ N_(*) \) R$.
    Successive tops decrease to zero unless the construction stops,
    since the next start is at most $F b R < R \/ 4$. Suppose a target $L_i$ lies below one top and above the
    next, but misses the first interval. It must then lie below its lower endpoint,
    so $L_i < B_(*) b R$ and $F b R > 10 N_(*) L_i \/ r_(*)$.
    A dyadic scale between $2 N_(*) L_i \/ r_(*)$ and $4 N_(*) L_i \/
    r_(*)$ is therefore eligible for the next start. For all sufficiently late $i$ it is good,
    by convergence at $L_i$ to a plane. Maximality of the next start would make its top larger than $L_i$,
    a contradiction. Hence all sufficiently late targets are covered.
  A fixed interval containing targets tending to zero necessarily has $b = 0$.
    On that interval Lemma 8 first supplies a lower bound and a sufficiently small radius with $P lt.eq T^2$,
    then an upper bound and height doubling inward. This proves the assertion in the fixed-interval case.
    After taking a subsequence, we may therefore restrict to targets whose covering interval indices tend to
    infinity. There are then infinitely many starts, all with positive failure parameter $b$.
  #emph[Geometry of the late starts.] We first show that the $b$ values of these covering intervals tend to zero.
    Otherwise their start scales would be comparable to their target scales, since $B_(*) b lt.eq L_i \/ R lt.eq
    r_(*) \/ N_(*)$. The start varifolds would then converge to planes,
    contradicting failed-fit separation at a scale bounded away from zero.
  In fact the start varifolds converge to multiplicity-$Q$ planes even without comparability to the targets.
    Any subsequential limit is a stationary tangent cone at $0$, of density $Q$.
    Pass also to limits of the start coordinates and their uniformly controlled center graphs.
    Because $t \( w \) lt.eq b + \| w \|$ and $b arrow.r 0$, the limiting cone lies within $C \|
    w \|^k$ of a $C^1$ graph through $0$. Every conical ray is therefore in the tangent plane of that graph at
    $0$. Constancy gives a multiplicity-$Q$ plane. Thus, if a minus sign denotes the preceding interval, eventually
  #[#set math.equation(numbering: n => "(4.19)")
   $ R = F b_(-) R_(-) . $ <eq:exact-restart>]
  Indeed the right-hand side is dyadic. If it exceeded the chosen $R$, then $2 R$ would still be eligible;
    planar convergence of $V_R$ on every fixed ball makes $2 R$ good, contradicting maximality.
    It follows also that $b_(-) arrow.r 0$. If not, the preceding starts would be comparable to the current planar
    starts, again contradicting separation.
  #emph[The outer endpoint: the preceding failure.] We now work entirely in the current start’s units.
    The preceding failure will give an upper support-height bound and a matching lower height integral on fixed
    room. Together these bounds will control $P \( r_(*) \)$. Define the preceding failure height in current units by
  $ h_0 = frac(m_0 b_(-)^k, F b_(-)) . $
  In every required fixed bounded region of the current start,
    all support points are within $C h_0$ of the preceding center, expressed in current units:
    in preceding units the region has radius $O \( F b_(-) \)$, and (4.3) applies with $t lt.eq b_(-) + \| w \|$.
    The preceding and current start planes make a small angle. To verify this, take a subsequence:
    the preceding centers in current units have small slope and pass within $C h_0$ of $0$,
    and the current planar support limit lies in their limiting graphs.
    The current chosen planes converge to this support plane.
    This proves the asserted angle bound, allowing a fixed enlargement of the small slope threshold.
  The current center consequently satisfies
  #[#set math.equation(numbering: n => "(4.20)")
   $ \| z \| lt.eq C h_0 $ <eq:restart-height-upper>]
  on the region containing ${ rho < 4 r_(*) }$. Indeed a current witness of scale $ell$ supplies two entries
    separated by $c m_0 ell^k$ in a direction nearly vertical also for the preceding plane.
    Both lie within $C h_0$ of its small-slope center, so $c m_0 ell^k lt.eq C h_0$.
    Equation (4.3) now proves (4.20). By Lemma 6 at radius $4 r_(*)$,
    the mean curvature and its first normal derivative are at most $C h_0$ there as well.
    Every comparison is internal to both cylinders: the current cylinder has fixed room,
    whereas its required region in preceding units shrinks with $F b_(-) arrow.r 0$.
  A preceding failure attaining $b_(-)$ supplies the complementary bound
  #[#set math.equation(numbering: n => "(4.21)")
   $ H \( r_(*) \) gt.eq c h_0^2 . $ <eq:restart-height-lower>]
  Its center is within $16 b_(-)$ of horizontal $0$, so the failed-fit lemma may be used on a subball centered
    near horizontal $0$. The entries lie within ambient radius $C b_(-)$ in preceding units:
    their heights over the fit are $O \( m_0 b_(-)^k \)$, and the glued center has the same bound at $0$.
    In current units they are well inside ${ rho < r_(*) }$ by (4.16);
    their mass is bounded below by a constant times $F^(- m)$.
    Their tilt remains small relative to the current center. At least one entry of each separated pair has height
    at least $c h_0$ over that center, proving (4.21).
  The cutoff normal test with $z$ on fixed room around $r_(*)$, using (4.20) and its curvature bound,
    gives $E_(*) \( r_(*) \) + R_(*) \( r_(*) \) lt.eq C h_0^2$.
    Hence (4.8) and (4.21) bound $\| P \( r_(*) \) \|$ uniformly, while $T \( r_(*) \) arrow.r oo$.
    In particular $P \( r_(*) \) lt.eq T \( r_(*) \)^2$ for all sufficiently late covering intervals,
    as required for the inward upper bound.
  #emph[The inner endpoint: the current failure.] For $b > 0$ we use the same height-versus-tilt comparison at
    radius $B_(*) b$, now supplied by the current failure. On a fixed enlargement, $\| z \| lt.eq
    C m_0 b^k$ follows from $t lt.eq b + \| w \|$; the curvature bounds of Lemma 6 apply there.
    The cutoff tilt estimate on room of scale $b$ gives
  $ E_(*) \( B_(*) b \) + R_(*) \( B_(*) b \) lt.eq C m_0^2 b^(2 k) . $
  The inverse-square scale in that estimate is canceled by the factors in (4.5).
    A failure attaining $b$, tested on a subball of radius $10^(- 2) b$ near horizontal $0$,
    supplies low-tilt entries well inside the kernel and proves $H \( B_(*) b \) gt.eq c m_0^2 b^(2 k)$.
    Thus $\| P \( B_(*) b \) \|$ is bounded as well.
  The outer bound controls $P$ from above as the radius decreases. The inner bound controls it from below:
    once $P < - K$, it decreases inward, so a value below the inner-endpoint bound could not recover before that
    endpoint. Lemma 8 therefore gives (4.18). Its final smallness requirement on $eta$ is uniform on late
    intervals: use $delta lt.eq C r$ on the sufficiently small radii and (4.20) on the remaining radii.
    This proves the uniform height comparison. ◻
]

== 5 A centered height blow-up <sec:centered-blowup>

The interval construction has supplied height comparison at the target scales without changing the sequence that
  carries the density centers. We now normalize height at those scales.
  The resulting centers have mean curvature negligible at the height scale, and their first height moments vanish.
  These two properties will allow both first variation and the density comparison to pass to the limit.

#thm([Proposition 5.1.])[
  (Centered blow-up at the target scales).  #emph[Let the stationary integral varifold, singular origin,
    integer $Q$, plane $Pi$, and sequence $L_i arrow.b 0$ be as in Proposition 2.
    After taking a subsequence and identifying $Pi$ with the horizontal plane, there are positive $a_i arrow.r
    0$ and $C^J$ graph disks $S_i$ over a fixed enlargement of $B_8 subset Pi$,
    converging to $Pi$ through all derivative orders needed below, with the following properties.
    In target units let $mu_i$ be the weight of $V_(L_i)$, let $pi_i$ be nearest projection to $S_i$, and set
$ z_i = X - pi_i X \, wide M_i = \( pi_i \)_(\#) mu_i - Q "vol"_(S_i) \, wide D_i = \( pi_i \)_(\#) \( e_i mu_i \) . $

 All measures are restricted to one fixed interior normal cylinder containing the support in question,
   with a support-free gap at its vertical boundary. On the part over $B_8$,
#[#set math.equation(numbering: n => "(5.1)")
 $ D_i + \| M_i \| = O \( a_i^2 \) quad upright("in total mass") \, wide \| z_i \| lt.eq C a_i quad
   upright("on the support") \,\
sup #scale(x: 120%, y: 120%)[\(] \| cal(H)_(S_i) \| + \| nabla^perp cal(H)_(S_i) \| #scale(x: 120%, y: 120%)[\)] =
  o \( a_i \) \, wide a_i^(- 1) \( pi_i \)_(\#) \( z_i mu_i \) harpoon.rt 0 . $ <eq:centered-interface>]

 Moreover the normalized height-square measures have uniformly bounded mass there and are quantitatively nonzero
   on a fixed compact subset of $B_4$; in particular, for all sufficiently large $i$,
#[#set math.equation(numbering: n => "(5.2)")
 $ c lt.eq a_i^(- 2) integral_(pi_i X in B_3) \| z_i \|^2 thin upright(d) mu_i lt.eq
   a_i^(- 2) integral_(pi_i X in B_8) \| z_i \|^2 thin upright(d) mu_i lt.eq C . $ <eq:nonzero-second-moment>]

 Balls in this statement are understood through the graph coordinates over $Pi$.
   The weak convergence in (5.1) holds against compactly supported tests in $B_8$.]
] <prop:centered-blowup>

#proof[
  We prove successively the integral normalization, negligible curvature, uniform support height,
    and first-moment centering. In all intermediate estimates we retain larger fixed interior regions than those
    in the statement.
  ==== Integral normalization and convergence of the centers <integral-normalization-and-convergence-of-the-centers>
  For the interval covering $L_i$, let $R$ be its start, use its center $S$, and put
  #[#set math.equation(numbering: n => "(5.3)")
   $ r_i = L_i \/ R \, wide a_i = sqrt(H \( r_i \)) / r_i > 0 . $ <eq:height-normalization>]
  The notation $R$ and $S$ here may depend on $i$. If $r_i arrow.r 0$, then $a_i arrow.r
    0$ by (4.6) and $delta lt.eq C r_i^(k - 1)$. If $r_i$ stays bounded away from zero,
    we are in the multiple-interval case, and (4.20), with $h_0 arrow.r 0$, gives the same conclusion.
    These cases also show that $delta \( c r_i \) arrow.r 0$ for every fixed enlargement used below.
    Subsequences suffice to handle them.
  Proposition 9 yields
  #[#set math.equation(numbering: n => "(5.4)")
   $ r_i^(- m) integral_(rho < 200 r_i) \| z \|^2 thin upright(d) mu & lt.eq C a_i^2 r_i^2 \,\
r_i^(- m) D \( B_(200 r_i)^S \) & lt.eq C a_i^2 \, $ <eq:target-energy>]
  where these expressions remain in start units. Indeed (4.15) supplies a radius in $\[ 400 r_i \, 600 r_i \]$ at
    which $q_(*)$, and hence $n_(*)$, is bounded. These radii lie below $r_(*)$ because $r_i lt.eq r_(*) \/ 1000$.
    The weights at that radius are bounded below on ${ rho < 200 r_i }$, so (4.9) gives the height bound,
    and the definition of $E_(*)$ gives the tilt bound. There is also a converse height lower bound $c a_i^2
    r_i^2$ already on ${ rho < 2 r_i }$, directly from $H \( r_i \) = a_i^2 r_i^2$.
  Dilate the center into target units and denote it by $S_i$.
    Its graphs have uniform high derivative bounds on fixed balls:
    their start derivatives are uniformly bounded and the dilation introduces factors $r_i^(j - 1)$ in derivative
    order $j$. Their heights at horizontal $0$ before dilation are at most $C m_0 b^k$,
    and their slopes are small. Since $b lt.eq r_i \/ B_(*)$, the center positions remain bounded after dilation.
    The sup height estimates show that support points on each needed fixed region are at distance tending to zero
    from these graphs in target units. For example, support points in an ambient ball of radius $60$ have
    projected geodesic radius below $180$, by the fixed projection bounds and the position of the radial center.
    Support convergence to $Q \| Pi \|$ therefore places a corresponding patch of $Pi$ in every subsequential
    graph limit. A small-slope graph containing this patch must equal the plane there.
    Compactness with extra derivative orders gives the asserted smooth-enough convergence.
    Passing to a subsequence also fixes the limiting rotations of the start coordinates.
    We may now regraph over $Pi$ on smaller fixed room.
  ==== Curvature below the height scale <curvature-below-the-height-scale>
  We claim that, on a fixed region larger than the one in the statement,
  #[#set math.equation(numbering: n => "(5.5)")
   $ sup #scale(x: 120%, y: 120%)[\(] \| cal(H)_(S_i) \| + \| nabla^perp cal(H)_(S_i) \|
     #scale(x: 120%, y: 120%)[\)] = o \( a_i \) . $ <eq:center-curvature>]
  Temporarily return to start units. At a point with horizontal argument of norm at most $40 r_i$ and $t > 0$,
    choose a witness $\( x \, ell \)$. The argument for (4.7) gives $ell lt.eq max \( b \, 40 r_i \/ 15 \) lt.eq
    3 r_i$. Apply failed-fit separation on a small subball near that point;
    its center lies within the allowed $30 ell$ of $x$. The subball,
    and the changes between its fitting and normal projections, remain inside the upper-bound region in (5.4).
    Separation and small slopes give height at least $c m_0 ell^k$ on mass at least $c ell^m$. Consequently
  #[#set math.equation(numbering: n => "(5.6)")
   $ a_i r_i gt.eq c m_0 ell^k \( ell \/ r_i \)^(m \/ 2) . $ <eq:witness-normalization>]
  All such witness scales tend to zero uniformly. This is immediate when $r_i arrow.r 0$,
    and otherwise follows from $a_i arrow.r 0$ in (5.6).
  The pointwise start-unit curvature estimate is $C m_0^2 ell^(2 k - 4)$, by (4.3) and $t lt.eq 2 ell$.
    Mean curvature and its first normal derivative acquire factors $r_i$ and $r_i^2$, respectively,
    in target units. Thus, for mean curvature, (5.6) gives
  $ frac(r_i m_0^2 ell^(2 k - 4), a_i) lt.eq C m_0 r_i^(2 + m \/ 2) ell^(k - 4 - m \/ 2) arrow.r 0 . $
  The derivative has one additional factor $r_i lt.eq 1$. The exponent of $ell$ is positive by (4.1).
    At $t = 0$ both curvature quantities vanish by (4.3). This proves (5.5).
  ==== A uniform bound for support height <a-uniform-bound-for-support-height>
  Integral control alone would not suffice for all later expansions. We strengthen it to
  #[#set math.equation(numbering: n => "(5.7)")
   $ \| z_i \| lt.eq C a_i $ <eq:target-height>]
  on fixed inner room. The normal-displacement trace formula #cite(label("AE")) Equation (7.9) is
  #[#set math.equation(numbering: n => "(5.8)")
   $ P_T : D z_i = e_i - cal(H)_(S_i) dot.op z_i +
     O \( \| upright("II")_(S_i) \|^2 \| z_i \|^2 + \| upright("II")_(S_i) \| e_i \| z_i \| \) .
     $ <eq:normal-displacement-trace>]
  Since $nabla \| z_i \|^2 = 2 z_i$, the nonnegative ambient function $G = \| z_i \|^2 + a_i^2$ satisfies,
    on the support,
  #[#set math.equation(numbering: n => "(5.9)")
   $ "tr" \( P_T D^2 G \) gt.eq - C G . $ <eq:height-subsolution>]
  Here the positive $2 e_i$ term absorbs its small multiple in (5.8),
    and (5.5) bounds the term linear in height by $C \( \| z_i \|^2 + a_i^2 \)$.
  For completeness, (5.9) has the requisite mean-value consequence on a stationary varifold.
    Fix a support point $X_(*)$, put $d = \| X - X_(*) \|$, and take a nonnegative decreasing smooth radial kernel
    $f \( d \/ l \)$, supported in $d < l$ and positive at $d = 0$. Define
  $ I \( l \) = l^(- m) integral f \( d \/ l \) G thin upright(d) mu_i . $
  Radial stationarity gives
  $ frac(upright(d) I, upright(d) log l) gt.eq l^(- m) integral f \( d \/ l \) nabla_T G dot.op \( X - X_(*) \)
    thin upright(d) mu_i . $
  The discarded term is nonnegative because $f$ is decreasing.
    Use the primitive $F_l \( d \) = integral_d^oo t f \( t \/ l \) thin upright(d) t$, whose gradient is $-
    f \( d \/ l \) \( X - X_(*) \)$ and which satisfies $F_l lt.eq C l^2 f \( d \/ l \)$.
    Stationarity and (5.9) bound the right-hand side below by $- C l^2 I \( l \)$.
    Integration of this differential inequality down to zero, using density at least one,
    bounds $G \( X_(*) \)$ by a fixed-radius integral of $G$ around $X_(*)$.
    The integral is $O \( a_i^2 \)$ by (5.4) and the mass bound, proving (5.7).
  These tests may be made for all points with horizontal arguments in a fixed ball of radius $25$ in target units,
    using small fixed ambient balls. Their heights already tend to zero by the earlier sup height estimate.
    To check that the normal coordinates include all relevant support, in start units use $t \( w \) lt.eq
    b + \| w \|$ and (4.3): on these arguments the heights are small compared with $r_i$,
    and changes from horizontal to projected arguments are smaller still by the small slope.
    Decreasing $r_(*)$ once fixes all needed tube and chart margins.
    Regraphing over $Pi$ preserves smaller fixed interior regions.
  ==== Vanishing of the first height moment <vanishing-of-the-first-height-moment>
  It remains to prove
  #[#set math.equation(numbering: n => "(5.10)")
   $ a_i^(- 1) \( pi_i \)_(\#) \( z_i mu_i \) harpoon.rt 0 . $ <eq:centered-first-moment>]
  We first use horizontal tests and vertical graph-height differences in the start coordinates.
    Take an arbitrary fixed smooth test of $w \/ r_i$, supported in horizontal $B_(12 r_i)$,
    so that its derivatives are bounded at that scale. We do not yet pull tests back through the changing centers.
    By convergence of their coordinate changes, this region contains the supports of target tests on $B_8 subset
    Pi$ for all large $i$; coordinate conversion will be made after proving the fixed-coordinate limit.
    Cover ${ t > 0 }$ there by balls of radii a small fixed multiple of $t$ at their centers,
    selecting a disjoint smaller family and a bounded-overlap enlargement.
    The Lipschitz property of $t$ gives a partition of unity whose derivatives are bounded at the corresponding
    cell scales. Height is zero off ${ t > 0 }$.
  On a cell choose a constructed fit of dyadic scale $L$ comparable to $t$ and sufficiently large compared with
    it, as in the gluing construction. Cells meeting the test support have centers in an $O \( r_i \)$ region.
    More explicitly, choose the enlarged cell radius at most $c t \( w \)$ with $c < 1 \/ 10$.
    A cell meeting $B_(12 r_i)$ has
  $ \| w \| lt.eq 12 r_i + c t \( w \) lt.eq 12 r_i + c \( b + \| w \| \) \, wide \| w \| < 14 r_i \, $
  because $b lt.eq r_i \/ 100$. In particular $L lt.eq C r_i$ and these centers lie strictly inside the $40
    r_i$ region used for (5.6). Applying the first-moment estimate in Lemma 5 to the partitioned test,
    whose required scaled derivatives are bounded, gives an error at most
  #[#set math.equation(numbering: n => "(5.11)")
   $ C L^m m_0^2 L^(2 k - 1) . $ <eq:cell-moment-error>]
  This controls the height over the local fit. Its difference from the glued center has height $C m_0^2
    L^(2 k - 1)$, so the same bound controls that remaining contribution, using the cell mass bound.
  To compare (5.11) with the target height scale, choose a witness at the cell center.
    It satisfies $ell gt.eq t \/ 2$, hence $L lt.eq C ell$, though no converse comparison is required.
    Equation (5.6) implies
  $ frac(m_0^2 L^(2 k - 1), a_i r_i) lt.eq C m_0 r_i^(m \/ 2) ell^(k - 1 - m \/ 2) arrow.r 0 $
  uniformly over the cells. Positivity of the exponent follows from (4.1),
    and the witness scales tend uniformly to zero as proved above.
    Independently, bounded overlap of the cells and $L asymp t$ give $sum L^m lt.eq C r_i^m$.
    Summing (5.11) therefore gives an error $o \( a_i r_i^(m + 1) \)$.
    This is exactly the vanishing first moment after mass and height are expressed in target units.
  Finally convert from vertical graph-height differences to normal displacements.
    At first order this conversion is the normal projection at the graph point,
    with uniformly bounded quadratic error. By (5.7) the vertical differences also have size $O \( a_i \)$.
    The quadratic error is therefore $O \( a_i^2 \)$, and test arguments change by $O \( a_i \)$,
    which has the same harmless effect. The coefficient matrices converge uniformly on the fixed chart.
    The normalized first-moment measures have bounded total variation,
    so their convergence against fixed smooth tests extends to these converging tests and matrices. This proves (5.10).
  We can now collect the conclusions in target units. The tilt estimate in (5.4) gives $D_i =
    O \( a_i^2 \)$ on the required room. The scalar estimate, Lemma 3, with (5.5) and (5.7), gives $\| M_i \| =
    O \( a_i^2 \)$ there as well. Its integer is $Q$, identified by smooth averages and convergence to $Q \|
    Pi \|$. If a fixed small physical radius is needed for that estimate, a fixed dilation changes only constants.
    The lower height bound after (5.4), originally in geodesic radius $2 r_i$,
    lies in graph-coordinate $B_3$ for all large $i$, because the centers converge to $Pi$ and their radial
    origins tend to $0$. This proves (5.2). All calculations retained enough room to select the fixed cylinder
    over $B_8$, with a vertical cutoff in a support-free gap.
    Hence they concern the full local varifold measure required in the statement, and the proposition follows. ◻
]

== 6 Linearized measures and signed excess <sec:linearized>

The centered blow-up of Proposition 10 has small height, small tilt,
  and negligible mean curvature at the height scale. We now retain its second-order information as measures on the
  limiting plane. This formulation allows tilt to concentrate:
  no compactness theorem for a limiting collection of graphs is required.
  A related use of measure-valued limits for stationary two-valued graphs appears in the generalized-gradient
  Young measures and linear measure solutions of Hirsch and Spolaor #cite(label("HSgraphs")) Sections 2–3.
  The measure equations needed here are derived directly below.

For a concrete model, let $u : Omega arrow.r bb(R)^n$ be a smooth harmonic map on an open subset of $bb(R)^m$.
  Its squared height, height flux, and gradient energy define the measures

$ nu_u & = \| u \|^2 thin upright(d) y \, & \( f_u \)_a & = u dot.op partial_a u thin upright(d) y \,\
\( beta_u \)_(a b) & = partial_a u dot.op partial_b u thin upright(d) y \, & frak(m)_u & = 1 /
  2 \| D u \|^2 thin upright(d) y \, $

where $1 lt.eq a \, b lt.eq m$. Their block matrix is a Gram matrix, and harmonicity gives $nabla nu_u = 2 f_u$,
  $"div" f_u = "tr" beta_u$, and $"div" beta_u = nabla frak(m)_u$ in distributions.
  Moreover $2 frak(m)_u = "tr" beta_u$. The proposition below retains these identities and block positivity,
  with the last equality replaced by a one-sided inequality.
  The model explains the roles of the measures; the actual limit is not assumed to admit such a harmonic-map
  representation.

#thm([Proposition 6.1.])[
  (The limiting measure equations).  #emph[Let $V_i$ be stationary integral $m$-varifolds converging locally to
    $Q \| Pi \|$, where $Q$ is a positive integer and $Pi$ is an $m$-plane.
    Let $S_i$ be reference graphs converging to $Pi$ in every fixed finite derivative order used below,
    on a normal cylinder with fixed interior room over a connected disk $Omega subset Pi$.
    The cylinders contain all support used below and have a support-free gap at their artificial vertical
    boundaries above each compact base subset. Let $mu_i$ denote the weight of $V_i$ restricted to this cylinder,
    $pi_i$ nearest projection onto $S_i$, and $z_i = X - pi_i X$. All pushforwards below use this restriction.
    Use the horizontal and vertical tangent blocks relative to $S_i$ to set $B_i = I - \( P_T \)_(h h)$, $e_i =
    "tr" B_i$, $D_i = \( pi_i \)_(\#) \( e_i mu_i \)$, and $M_i = \( pi_i \)_(\#) mu_i - Q "vol"_(S_i)$.
    Suppose $a_i arrow.b 0$ and, on each compact subdisk with interior room,
$ \| M_i \| + D_i = O \( a_i^2 \) \, wide \| z_i \| lt.eq C a_i quad upright("on the support") \,\
\| cal(H)_(S_i) \| + \| nabla^perp cal(H)_(S_i) \| = o \( a_i \) \, wide
  a_i^(- 1) \( pi_i \)_(\#) \( z_i mu_i \) harpoon.rt 0 . $

 Assume also that $a_i^(- 2) \( pi_i \)_(\#) \( \| z_i \|^2 mu_i \)$ has a positive uniform lower mass bound on a
   fixed compact subset of $Omega$. Identify the bases by their converging graph coordinates.
   After passage to a subsequence there are Radon measures satisfying
#[#set math.equation(numbering: n => "(6.1)")
 $ a_i^(- 2) \( pi_i \)_(\#) \( \| z_i \|^2 mu_i \) & harpoon.rt nu \, &
   a_i^(- 2) \( pi_i \)_(\#) \( B_i mu_i \) & harpoon.rt beta \,\
a_i^(- 2) D_i & harpoon.rt d_0 = "tr" beta \, & a_i^(- 2) M_i & harpoon.rt frak(m) \,\
a_i^(- 2) \( pi_i \)_(\#) #scale(x: 120%, y: 120%)[\(] z_i dot.op \( P_T \)_(v h) thin mu_i
  #scale(x: 120%, y: 120%)[\)] & harpoon.rt f . $ <eq:limit-measures>]

 Here $nu eq.not 0$ and $d_0$ are nonnegative measures, $f$ is vector-valued, $beta$ is symmetric matrix-valued,
   and $frak(m)$ is signed. They obey
#[#set math.equation(numbering: n => "(6.2)")
 $ mat(delim: "(", nu, f^(sans(t)); f, beta) gt.eq 0 $ <eq:limit-psd>]

 as a matrix-valued measure, and
#[#set math.equation(numbering: n => "(6.3)")
 $ nabla nu = 2 f \, wide "div" f = d_0 \, wide integral_Omega "div" X thin upright(d) frak(m) =
   integral_Omega D X : upright(d) beta quad \( X in C_c^oo \( Omega \; bb(R)^m \) \) . $ <eq:limit-identities>]

 Finally, locally on $Omega$,
#[#set math.equation(numbering: n => "(6.4)")
 $ 2 frak(m) lt.eq d_0 \, wide \| frak(m) \| lt.eq C d_0 . $ <eq:limit-sign>]

 The data supplied by Proposition 10 satisfy these hypotheses,
   with a fixed disk containing the closed unit ball of density centers.]
] <prop:linearized>

#proof[
  All estimates are on compact subdisks with a fixed enlargement.
    Graph volume factors are included when measures are transported to $Omega$,
    and tensor components are taken in smoothly converging orthonormal frames.
    The assumed mass bounds give weak compactness. The projection identity
  $ \( P_T \)_(h v) \( P_T \)_(v h) = B_i - B_i^2 lt.eq B_i $
  shows both that the flux measures have bounded mass and that the block matrix before passage to the limit is
    positive semidefinite. This proves (6.2); the lower second-moment bound gives $nu eq.not 0$.
  === Vanishing geometric errors <vanishing-geometric-errors>
  We record the horizontal first variation carefully, since the height normalization may be much smaller than the
    curvature of the reference graph. Suppress $i$ temporarily.
    For a tangent field $Y$ on $S$, let $J_z = I - cal(S)_z$, where $cal(S)_z$ is the shape operator,
    and lift $Y$ to the ambient field $J_z Y$. The curved first-variation calculation in #cite(label("AE"))
    Lemma 2.2 gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ P_T : D \( J_z Y \) = "div"_S Y - B : nabla^S Y + cal(E)_Y \, $ <eq:horizontal-error>]
  with the following sharper error in the present setting. Choose $epsilon_i arrow.r
    0$ dominating the fixed geometric derivatives of $S_i$ that tend to zero and such that $\|
    cal(H)_(S_i) \| + \| nabla^perp cal(H)_(S_i) \| lt.eq epsilon_i a_i$. Then
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| cal(E)_Y \| lt.eq C epsilon_i {\| z_i \| e_i \| nabla^(S_i)
     Y \| + \( a_i \| z_i \| + \| z_i \|^2 + sqrt(e_i) thin \| z_i \| \) \| Y \|} . $ <eq:horizontal-error-bound>]
  Indeed, in frames whose tangent and normal connections vanish at the point of calculation,
    the horizontal derivative has blocks
  $ D \( J_z Y \)_(h h) = J_z \( nabla^S Y \) J_z^(- 1) - cal(K)_z J_z^(- 1) \, wide
    cal(K)_z \( a \) = \( nabla_a cal(S) \)_z Y . $
  Conjugation preserves the trace of $nabla^S Y$, and its pairing with $B$ has error
    $O \( epsilon_i \| z \| e \| nabla^S Y \| \)$. Codazzi gives $"tr" cal(K)_z =
    chevron.l nabla_Y^perp cal(H)_S \, z chevron.r$. The remaining horizontal terms are bounded by $C
    epsilon_i \( a_i \| z \| + \| z \|^2 + e \| z \| \) \| Y \|$.
    The symmetric sum of the off-diagonal blocks is, when paired with a tangent vector $a$ and a normal vector $v$,
  $ chevron.l a \, J_z^(- 1) \[ cal(S)_z \, cal(S)_v \] Y chevron.r . $
  It is $O \( epsilon_i^2 \| z \| \| a \| \| v \| \| Y \| \)$;
    pairing with $\( P_T \)_(v h)$ costs at most $C sqrt(e)$. This proves (6.6), including in arbitrary codimension.
  The corresponding normal formula, obtained from $D pi = J_z^(- 1) P_h$, is
  #[#set math.equation(numbering: n => "(6.7)")
   $ P_T : D z = e - cal(H)_S dot.op z +
     O \( \| upright("II")_S \|^2 \| z \|^2 + \| upright("II")_S \| e \| z \| \) . $ <eq:normal-trace>]
  This is the normal trace computation used in the minimal-fitting argument of #cite(label("AE")) Equation (7.9).
    At normalization $a_i^(- 2)$, every error in (6.6) and (6.7) tends to zero in mass:
    use $\| z_i \| lt.eq C a_i$, $integral e_i thin upright(d) mu_i = O \( a_i^2 \)$,
    and Cauchy–Schwarz for $integral \| z_i \| sqrt(e_i) thin upright(d) mu_i$.
  Stationarity tested with $J_(z_i) Y$ now yields the last identity in (6.3);
    the reference-volume integral of a divergence is zero. Testing instead with $\| z_i \|^2 J_(z_i)
    Y$ gives $nabla nu = 2 f$. Terms containing both $B_i$ and $\| z_i \|^2$ disappear,
    and the differentiated height contributes $2 z_i dot.op \( P_T \)_(v h) J_(z_i) Y$;
    replacing $J_(z_i)$ by the identity has vanishing normalized error.
    Finally, the normal test $phi z_i$, with $phi$ a smooth base function,
    gives $integral phi thin upright(d) d_0 + integral nabla phi dot.op upright(d) f = 0$ by (6.7).
    Thus all equations in (6.3) hold.
  === Applying signed excess at the height normalization <applying-signed-excess-at-the-height-normalization>
  It remains to prove (6.4). There are two requirements for applying Theorem 4 at this normalization.
    First, its geometric error $Lambda_i$ must be $o \( a_i^2 \)$;
    in target units its height-square term is only $O \( a_i^2 \)$. We achieve this by changing physical units.
    Second, the physical chart radius and support height must be small relative to the local excess budget.
    We meet that condition by dividing the base into cells whose radii are powers of $a_i$.
    These choices do not require a rate relating $a_i$ to the original target scales.
  Fix a compact test support and an interior enlargement. Dilate physical space by $d'_i arrow.b
    0$ sufficiently slowly that all required finite geometric derivatives remain bounded and
  $ frac(\| cal(H)_(S_i) \|, d'_i a_i) arrow.r 0 \, wide frac(\| nabla^perp cal(H)_(S_i) \|, \( d'_i \)^2 a_i)
    arrow.r 0 . $
  Such a choice exists because each numerator divided by $a_i$ tends to zero,
    and all the finitely many graph derivatives tend to their flat values.
    To obtain a uniform normal tube after dilation, write the graph as $g_i$ and extend it using a fixed smooth
    cutoff $chi$ equal to one on the enlargement. The new physical graph and its derivatives are
  $ g_i^(upright("phys")) \( v \) = d'_i \( chi g_i \) \( v \/ d'_i \) \, wide
    D^j g_i^(upright("phys")) \( v \) = \( d'_i \)^(1 - j) D^j \( chi g_i \) \( v \/ d'_i \) . $
  The cutoff graph tends to zero through all the required finite orders, including order zero.
    Choosing $d'_i$ still more slowly keeps these derivatives bounded and the second derivatives small,
    which provides the fixed tube. The mean-curvature bounds are needed only on the unchanged inner region.
    The cylinder restriction has a support gap at its artificial vertical boundary,
    so this operation introduces no first-variation term.
  In the new physical units, the geometric measure $Lambda_i$ charges
  $ \( d'_i \)^2 \| z_i \|^2 + \( d'_i \)^(- 2) \| cal(H)_(S_i) \|^2 + \( d'_i \)^(- 4) \| nabla^perp
    cal(H)_(S_i) \|^2 . $
  Expressed with mass returned to target units, it therefore satisfies $Lambda_i = o \( a_i^2 \)$.
    The measures $M_i \, D_i$ in target normalization are unchanged.
    Thus the geometric error will disappear after division by $a_i^2$;
    we now arrange the local hypotheses for signed excess.
  Use $zeta$ and $kappa$ fixed in Equation (3.12), and cover the test support by cells of target radius
    $lambda_i = a_i^zeta$, with bounded overlap of their fixed enlargements. In particular $3 kappa < zeta$.
    On each enlarged cell use a normalized budget $b_(i \, j)$ for $\| M_i \| + D_i + Lambda_i$,
    enlarged by fixed constants and with floor $a_i^3$. Thus, uniformly in the cells,
  #[#set math.equation(numbering: n => "(6.8)")
   $ a_i^3 lt.eq b_(i \, j) lt.eq C a_i^2 lambda_i^(- m) + a_i^3 = o \( 1 \) \, wide sum_j lambda_i^m b_(i \, j) =
     O \( a_i^2 \) . $ <eq:signed-cell-budget>]
  Fresh normal charts on these cells have physical radius $O \( d'_i lambda_i \)$ and physical support height
    $O \( d'_i a_i \)$. Since $3 kappa < zeta < 1$, these are at most $b_(i \, j)^kappa$ for all large $i$,
    with the fixed factors absorbed by strictness of the inequality.
    All physical hypotheses of signed excess are satisfied.
  Partition a nonnegative smooth test by a smooth partition of unity at scale $lambda_i$.
    After the fixed normalization of its size and Lipschitz constant,
    the signed-excess error on a cell is $o \( 1 \) b_(i \, j)$, uniformly because $b_(i \, j) arrow.r
    0$ uniformly. Multiplying by $lambda_i^m$, summing (6.8), and dividing by $a_i^2$ proves $2 frak(m) lt.eq d_0$.
  For the absolute bound, apply Lemma 3, from #cite(label("AE")) Lemma 2.5,
    in the same physical units on any fixed interior ball and its enlargement.
    Smooth mass averages identify its integer as $Q$ for all large $i$.
    Since $Lambda_i = o \( a_i^2 \)$, passage to the limit gives, after harmless fixed changes of radii,
  $ \| frak(m) \| \( B_u \( y \) \) lt.eq C d_0 \( B_(3 u) \( y \) \) . $
  This inflated-ball estimate implies domination as measures, without a doubling assumption.
    For a compact $K subset O subset.double Omega$, cover $K$ by sufficiently fine equal-radius balls whose triple
    enlargements lie in $O$ and have bounded overlap. Summing gives $\| frak(m) \| \( K \) lt.eq C d_0 \( O \)$.
    Outer regularity as $O$ decreases to $K$, followed by inner regularity, proves $\| frak(m) \| lt.eq C d_0$.
    This completes the proof. ◻
]

== 7 Density centers survive the height blow-up <sec:density-centers>

The measures of Section 6 retain height and tilt, but the final dimension argument also needs the large set of
  density-$Q$ centers. Ordinary monotonicity about those centers is not accurate enough at the height-square
  scale: a curvature error depending only on the reference graph could dominate $a_i^2$.
  We remove that error by measuring radius along the reference graph and compensating its volume density.

Fix the integer $p gt.eq 4$ chosen above. For $x \, y in Pi$ and $l > 0$, set

#[#set math.equation(numbering: n => "(7.1)")
 $ phi.alt_(x \, l) \( y \) = l^(- m) (1 - frac(\| y - x \|^2, l^2))_(+)^p \, wide psi_(x \, l) \( y \) =
   2 p thin l^(- m) (1 - frac(\| y - x \|^2, l^2))_(+)^(p - 1) . $ <eq:limit-kernels>]

#thm([Proposition 7.1.])[
  (Comparison at the density centers).  #emph[In the setting of Proposition 11,
    suppose that $Omega$ contains a fixed neighborhood of $overline(B)_1 subset Pi$.
    Let $sigma_i$ be positive measures supported on density-$Q$ points of $V_i$ in the ambient closed unit ball, with
$ c lt.eq sigma_i \( overline(upright(bold(B)))_1 \) lt.eq C \, wide
  sigma_i \( upright(bold(B))_r \( X \) \) lt.eq C r^s quad \( X in bb(R)^(m + n) \, med r > 0 \) \, wide s > m - 1 . $

 Pass to a weak limit $sigma$ along the subsequence defining the linearized measures.
   Then $sigma eq.not 0$, its support lies in $overline(B)_1 subset Pi$, and it has the same upper ball bound.
   There is $l_(*) > 0$ such that
#[#set math.equation(numbering: n => "(7.2)")
 $ 2 l^2 integral phi.alt_(x \, l) thin upright(d) frak(m) gt.eq
   integral psi_(x \, l) thin upright(d) nu wide \( x in "spt" sigma \, 0 < l < l_(*) \) . $ <eq:center-comparison>]

]
] <prop:density-comparison>

#proof[
  Weak compactness and the stated conclusions about $sigma$ follow from the mass and ball bounds and from
    convergence of the varifold supports to $Pi$. We prove (7.2) for each fixed $0 < l < l_(*)$,
    where $l_(*)$ is chosen so all the following constructions have common interior room.
    All estimates below are uniform over $X_0 in "spt" sigma_i$.
  === A radial test adapted to the reference graph <a-radial-test-adapted-to-the-reference-graph>
  Write $w = X_0 - pi_i X_0$ and translate the reference graph to $S = S_i + w$, which passes through $X_0$.
    By the height bound, $\| w \| lt.eq C a_i$. In this part of the proof, $pi \, z \, B \, e \,
    J_z$ refer to this translated graph, and $rho$ is geodesic distance on $S$ from $X_0$, pulled back by $pi$.
    Translation preserves its geometric estimates. Changing the reference tangent plane by this translation and
    the nearby projection changes squared tilt by at most
  #[#set math.equation(numbering: n => "(7.3)")
   $ e lt.eq C \( e_i + a_i^2 \) . $ <eq:translated-tilt>]
  Indeed the two projections differ by $O \( a_i \)$ and the second fundamental forms are uniformly bounded;
    squared tilt is comparable to the squared distance of the corresponding orthogonal projections.
  Define
  $ d^2 = rho^2 + \| z \|^2 \, wide U = rho nabla_S rho \, wide G = nabla \( d^2 \/ 2 \) = J_z^(- 1) U + z \, wide
    Y = J_z U + z . $
  These fields are smooth at the central fiber, and $Y dot.op G = d^2$.
    Let $W$ be the inverse volume density in geodesic normal coordinates on $S$ centered at $X_0$,
    again pulled back by projection. Thus integration of $W "vol"_S$ is ordinary integration in those coordinates.
    Enlarging the sequence $epsilon_i arrow.r 0$ from (6.6) if necessary, geodesic coordinate estimates give
  #[#set math.equation(numbering: n => "(7.4)")
   $ \| nabla_S W \| lt.eq C epsilon_i rho \, wide \| nabla^S U - upright("Id") \| lt.eq C epsilon_i rho^2 \,\
W \( "div"_S U - m \) + U dot.op nabla_S W = 0 . $ <eq:geodesic-compensation>]
  The last identity is exact: $U$ is the coordinate radial field and $W$ is the reciprocal volume density.
  Apply (6.5) to $U$ and add the normal trace (6.7). Their leading tilt terms cancel.
    The identity in (7.4) then cancels the reference-volume error. The result is
  #[#set math.equation(numbering: n => "(7.5)")
   $ cal(E) & = P_T : D \( W Y \) - m W \,\
\| cal(E) \| & lt.eq C epsilon_i { e \( rho^2 + \| z \| \) + \( a_i \| z \| + \| z \|^2 \) \( 1 + rho \) +
  rho sqrt(e) thin \| z \| #scale(x: 120%, y: 120%)[}] . $ <eq:radial-error>]
  For completeness, pairing $nabla^S U - upright("Id")$ with $B$ costs $C epsilon_i rho^2 e$.
    Differentiating $W$ in the horizontal part gives $U dot.op nabla_S W$ and another error of this size.
    Its vertical pairing costs $C epsilon_i rho sqrt(e) thin \| z \|$.
    The remaining terms are exactly those bounded in (6.6) and (6.7).
  Put
  $ Phi_t \( d \) = (1 - d^2 / t^2)_(+)^p \, wide Psi_t \( d \) = 2 p (1 - d^2 / t^2)_(+)^(p - 1) \, wide
    I_i \( X_0 \, t \) = t^(- m) integral W Phi_t \( d \) thin upright(d) mu_i . $
  Differentiate in $log t$ and test stationarity with $W Phi_t \( d \) Y$. Since $Y dot.op G = d^2$, this gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ dot(I)_i \( X_0 \, t \) = t^(- m) integral {Psi_t / t^2 W Y dot.op \( I - P_T \) G +
     Phi_t cal(E)} thin upright(d) mu_i . $ <eq:radial-derivative>]
  The test is compactly supported within the normal tube; the cutoff power $p gt.eq
    4$ gives more regularity than this calculation requires.
  Here the estimate must hold down to arbitrarily small $t$, with no comparison between $t$ and $a_i$.
    On $d lt.eq t lt.eq l_(*) lt.eq 1$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ Y dot.op \( I - P_T \) G & gt.eq 1 / 2 \| \( I - P_T \) G \|^2 - C epsilon_i^2 \| z \|^2 t^2 \,\
\| z \| & lt.eq \| \( I - P_T \) G \| + C t sqrt(e) . $ <eq:radial-normal-control>]
  The first inequality follows from $\| Y - G \| lt.eq C epsilon_i \| z \| rho$.
    For the second, take the vertical component of $G$ and use $\| P_v P_T \| lt.eq C sqrt(e)$ and $\| G \| lt.eq
    C t$. Set $b' = \| \( I - P_T \) G \| \/ t$. Then both $\| z \| lt.eq t$ and $\| z \| lt.eq
    t \( b' + C sqrt(e) \)$ hold. In particular,
  $ e \| z \| lt.eq t e \, wide a_i \| z \| lt.eq C t #scale(x: 120%, y: 120%)[\(] \( b' \)^2 + e +
    a_i^2 #scale(x: 120%, y: 120%)[\)] \, wide \| z \|^2 lt.eq C t^2 #scale(x: 120%, y: 120%)[\(] \( b' \)^2 +
    e #scale(x: 120%, y: 120%)[\)] . $
  Using $Phi_t lt.eq C Psi_t$, every adverse term in (7.6) is therefore at most $C epsilon_i t
    Psi_t \( \( b' \)^2 + e + a_i^2 \)$. Absorb the $\( b' \)^2$ term into the positive term from (7.7).
    Equation (7.3) and comparison of $d$ with ambient distance yield
  #[#set math.equation(numbering: n => "(7.8)")
   $ dot(I)_i \( X_0 \, t \) gt.eq -
     C epsilon_i t^(1 - m) integral_(upright(bold(B))_(C t) \( X_0 \)) \( e_i + a_i^2 \) thin upright(d) mu_i .
     $ <eq:radial-almost-monotonicity>]
  === Averaging over the centers <averaging-over-the-centers>
  Let $c_Phi = integral_(bb(R)^m) \( 1 - \| y \|^2 \)_(+)^p thin upright(d) y$.
    At the center $X_0$, the squared radius $d^2$ agrees with the squared ambient distance to leading order and
    $W \( X_0 \) = 1$. Since $X_0$ has density $Q$,
  $ lim_(t arrow.b 0) I_i \( X_0 \, t \) = Q c_Phi . $
  Take any bounded nonnegative continuous center weight $g$.
    Average (7.8) against $g thin upright(d) sigma_i$ and integrate in logarithmic radius.
    Fubini’s theorem and the upper ball bound for $sigma_i$ give
  #[#set math.equation(numbering: n => "(7.9)")
   $ & integral g \( X_0 \) #scale(x: 120%, y: 120%)[\(] I_i \( X_0 \, l \) -
     Q c_Phi #scale(x: 120%, y: 120%)[\)] thin upright(d) sigma_i \( X_0 \)\
 & wide  gt.eq - C parallel g parallel_oo epsilon_i (integral \( e_i + a_i^2 \) thin upright(d) mu_i) integral_0^l
   t^(s - m) thin upright(d) t = - o \( a_i^2 \) . $ <eq:averaged-density>]
  The first integral is over fixed interior room and is $O \( a_i^2 \)$.
    The second is finite precisely because $s > m - 1$. To justify the lower endpoint,
    first integrate between positive radii, then use Fatou’s lemma for the nonnegative functions $g
    I_i$ and the displayed density limit. This avoids any uniform rate of density convergence in $X_0$.
  The averaged inequality now gives a lower bound with error $o \( a_i^2 \)$.
    To obtain the asserted comparison, we need an upper bound for the same integrand in terms of the original mass
    defect and squared height. Translating the reference graph introduces a cross term and an additional negative
    square in this upper expansion. The vanishing first moment removes the cross term,
    and the negative square can be discarded.
  === Expansion at a fixed radius <expansion-at-a-fixed-radius>
  Keep $l > 0$ fixed. Write $y = pi_i X$ and $z_i = X - y$.
    After translating the new base back to $S_i$, its projection and residual are
  $ y' = pi_i \( X - w \) \, wide z' = X - w - y' . $
  All relevant support points satisfy $\| z_i \| + \| z' \| lt.eq C a_i$ in common interior room.
    Functions such as $q \( y \) = W \( y + w \) Phi_l \( rho \( y + w \) \)$,
    and the analogous function with $Psi_l$, have uniform $C^2$ bounds and compact interior support.
    We claim that, uniformly in the centers,
  #[#set math.equation(numbering: n => "(7.10)")
   $ integral q \( y' \) thin upright(d) mu_i = integral q \( y \) thin upright(d) mu_i +
     o \( a_i^2 \) . $ <eq:translated-base-test>]
  Indeed the nearest-projection formula and smooth convergence to a plane give
  $ y' - y = - P_h \( y \) w + o \( a_i^2 \) \, wide sup_y \| P_h \( y \) w \| = o \( a_i \) . $
  For the first estimate, $D pi_i \( X \) = J_(z_i)^(- 1) P_h \( y \)$ differs from $P_h \( y \)$ by
    $O \( epsilon_i a_i \)$, and the second derivative of $pi_i$ is $o \( 1 \)$.
    For the second, $w$ is normal to $S_i$ at the center and all tangent planes tend uniformly to $Pi$.
    Taylor expansion thus leaves only $- integral nabla^(S_i) q dot.op P_h w thin upright(d) mu_i$,
    up to $o \( a_i^2 \)$. Replacing the projected measure by $Q "vol"_(S_i)$ costs $o \( a_i^2 \)$ because $\|
    M_i \| = O \( a_i^2 \)$. Integration by parts then uses
  $ "div"_(S_i) \( P_h w \) = cal(H)_(S_i) dot.op w = o \( a_i^2 \) $
  to prove (7.10). Compact support eliminates all boundary terms.
  Taylor expansion in the squared normal height gives, uniformly on the test region,
  $ Phi_l #scale(x: 120%, y: 120%)[\(] \( rho^2 + \| z' \|^2 \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] =
    Phi_l \( rho \) - frac(\| z' \|^2, 2 l^2) Psi_l \( rho \) + o \( a_i^2 \) . $
  The normalized reference-volume integral of $W Phi_l \( rho \)$ is exactly $c_Phi$,
    by its geodesic-coordinate definition. Hence (7.10) expresses the zeroth-order term of $I_i -
    Q c_Phi$ as an integral against $M_i$, with error $o \( a_i^2 \)$.
  For the height term, $z' = z_i - w + o \( a_i \)$ uniformly.
    Put $q_Psi \( y \) = W \( y + w \) Psi_l \( rho \( y + w \) \) gt.eq 0$.
    Moving its argument from $y'$ to $y$ costs $o \( a_i^2 \)$ in the height-square integral, and
  $ integral q_Psi \| z_i - w \|^2 thin upright(d) mu_i = integral q_Psi \| z_i \|^2 thin upright(d) mu_i + \|
    w \|^2 integral q_Psi thin upright(d) mu_i - 2 w dot.op integral q_Psi z_i thin upright(d) mu_i . $
  This integral enters $I_i$ with the negative coefficient $- l^(- m) \/ \( 2 l^2 \)$,
    so discarding the $\| w \|^2$ term gives an upper bound. The mixed term is $o \( a_i^2 \)$ by the centering
    assumption. We spell out its uniformity, since the centers move with $i$.
    The vector measures $a_i^(- 1) \( pi_i \)_(\#) \( z_i mu_i \)$ have uniformly bounded total variation and
    converge weakly to zero. At fixed $l$, the above center-dependent tests and their smooth coefficient factors
    form a relatively compact family in the uniform norm on common interior room.
    A finite approximation of this family therefore makes the weak convergence uniform over all its members.
    Multiplication by the bounded vectors $w \/ a_i$ preserves this conclusion; these vectors need not converge.
  It follows that, after division by $a_i^2$, the limiting upper bound for $I_i \( X_0 \, l \) -
    Q c_Phi$ at a center tending to $x in Pi$ is
  #[#set math.equation(numbering: n => "(7.11)")
   $ F_l \( x \) = integral phi.alt_(x \, l) thin upright(d) frak(m) -
     frac(1, 2 l^2) integral psi_(x \, l) thin upright(d) nu . $ <eq:center-expression>]
  More explicitly, let $"pr"_Pi$ denote orthogonal projection onto the limiting plane.
    The same compact-test argument applied to the bounded measure sequences in (6.1) gives
  #[#set math.equation(numbering: n => "(7.12)")
   $ a_i^(- 2) #scale(x: 120%, y: 120%)[\(] I_i \( X_0 \, l \) - Q c_Phi #scale(x: 120%, y: 120%)[\)] lt.eq
     F_l \( "pr"_Pi X_0 \) + o \( 1 \) quad upright("uniformly for ") X_0 in "spt" sigma_i .
     $ <eq:uniform-center-upper>]
  The function $F_l$ is continuous. Combining this uniform upper bound with (7.9),
    and passing to the limit against any nonnegative continuous $g$,
    gives $integral g F_l thin upright(d) sigma gt.eq 0$. Continuity implies $F_l gt.eq 0$ on $"spt" sigma$,
    which is (7.2). Since $l in \( 0 \, l_(*) \)$ was arbitrary, the comparison holds for every such radius. ◻
]

== 8 Dimension reduction for the limiting measures <sec:dimension-reduction>

We now separate the final argument from the varifold construction.
  The preceding sections produced a nonzero height measure, its flux and stress measures,
  and a density inequality at many centers. The following proposition shows that these data cannot have more than
  $m - 1$ dimensions of such centers. Its proof uses a second blow-up:
  the frequency becomes constant at several independent centers,
  and equality in a positive matrix measure then forces the height to vanish.

Fix an integer $p gt.eq 4$. For $x in bb(R)^m$ and $l > 0$ write

#[#set math.equation(numbering: n => "(8.1)")
 $ phi.alt_(x \, l) \( y \) = l^(- m) (1 - frac(\| y - x \|^2, l^2))_(+)^p \, wide psi_(x \, l) \( y \) =
   2 p thin l^(- m) (1 - frac(\| y - x \|^2, l^2))_(+)^(p - 1) . $ <eq:reduction-kernels>]

We retain the kernels of (7.1) in order to state the measure-theoretic argument independently.

#thm([Proposition 8.1.])[
  (Dimension reduction for height and stress).  #emph[Let $Omega subset bb(R)^m$ be connected and open.
    Let $nu$ be a nonzero nonnegative Radon measure, $f$ an $bb(R)^m$-valued Radon measure,
    $beta$ a symmetric matrix-valued Radon measure, and $frak(m)$ a signed Radon measure on $Omega$. Suppose that
#[#set math.equation(numbering: n => "(8.2)")
 $ mat(delim: "(", nu, f^(upright(t)); f, beta) quad
   upright("is a positive semidefinite matrix-valued measure") \, wide d_0 = "tr" beta \, $ <eq:abstract-psd>]

 and that, in distributions,
#[#set math.equation(numbering: n => "(8.3)")
 $ nabla nu = 2 f \, wide "div" f = d_0 \, wide integral "div" X thin upright(d) frak(m) = integral D X :
   upright(d) beta quad \( X in C_c^oo \( Omega \; bb(R)^m \) \) . $ <eq:abstract-identities>]

 Assume also that for every open $Omega' subset.double Omega$ there is a constant $C_(Omega')$ such that, on $Omega'$,
#[#set math.equation(numbering: n => "(8.4)")
 $ 2 frak(m) lt.eq d_0 \, wide \| frak(m) \| lt.eq C_(Omega') d_0 . $ <eq:abstract-sign>]

 Let $Z subset Omega$ be a Borel set such that for each $x in Z$,
#[#set math.equation(numbering: n => "(8.5)")
 $ 2 l^2 integral phi.alt_(x \, l) thin upright(d) frak(m) gt.eq
   integral psi_(x \, l) thin upright(d) nu $ <eq:abstract-center>]

 for every sufficiently small $l > 0$. Then $dim_(cal(H)) Z lt.eq m - 1$.]
] <prop:measure-reduction>

All tensor inequalities in this statement are measure inequalities.
  For instance, (8.2) means that contraction with every constant vector in $bb(R)^(m + 1)$ gives a nonnegative
  measure. Equivalently, the matrix density with respect to its trace measure is positive semidefinite almost
  everywhere. This latter formulation also allows contraction with bounded, point-dependent vectors.

=== 8.1 Kernel identities and positive height <kernel-identities-and-positive-height>

For the moment fix an arbitrary center $x in Omega$, not necessarily in $Z$,
  and restrict to radii with $overline(B)_l \( x \) subset Omega$. Define

#[#set math.equation(numbering: n => "(8.6)")
 $ H \( l \) & = integral psi_(x \, l) thin upright(d) nu \, & A \( l \) & =
   l^2 integral phi.alt_(x \, l) thin upright(d) frak(m) \,\
D \( l \) & = l^2 integral phi.alt_(x \, l) thin upright(d) d_0 \, & R \( l \) & =
  integral psi_(x \, l) \( y \) thin upright(d) beta \( y \) \[ y - x \, y - x \] . $ <eq:abstract-frequencies>]

Dots denote derivatives with respect to $log l$. The distributional identities imply

#[#set math.equation(numbering: n => "(8.7)")
 $ dot(A) = 2 A - D + R \, wide D = integral psi_(x \, l) \( y \) \( y - x \) dot.op upright(d) f \( y \) \, wide
   dot(H) = 2 D \, wide R H gt.eq D^2 \, wide 2 A lt.eq D . $ <eq:exact-frequency-identities>]

Here is the calculation. The identities

$ nabla phi.alt_(x \, l) = - l^(- 2) \( y - x \) psi_(x \, l) \, wide dot(psi)_(x \, l) = -
  "div" #scale(x: 120%, y: 120%)[\(] \( y - x \) psi_(x \, l) #scale(x: 120%, y: 120%)[\)] $

give the second and third formulas. In the stress identity use $X = \( y - x \) phi.alt_(x \, l)$;
  differentiating $A$ then gives the first formula. Cauchy–Schwarz for the positive matrix measure gives $D^2
  lt.eq R H$, and the signed inequality gives $2 A lt.eq D$.
  Although the kernels are compactly supported powers rather than $C^oo$ functions,
  their use is justified by approximation in $C^2$ on a compact interior set.
  The choice $p gt.eq 4$ provides that regularity. All quantities and their displayed derivatives are continuous
  in the admissible center and radius.

We need positive height before dividing by $H$. The next lemma is the finite-radius continuation argument used in
  the failed-fit analysis of AE; we give it in the measure form required here #cite(label("AE")) Proof of Lemma 7.2.

#thm([Lemma 8.2.])[
  (No open zero-height region).  #emph[For the nonzero measure $nu$ on the connected set $Omega$ in
    Proposition 13, equations (8.2)–(8.4) imply $H \( l \) > 0$ whenever $overline(B)_l \( x \) subset
    Omega$ and $l > 0$.]
] <lem:positive-limit-height>

#proof[
  Suppose that $nu$ vanishes on a nonempty open subset. Because $nu eq.not 0$ and $Omega$ is connected,
    choose a point $x$ outside $"spt" nu$ so close to its boundary that
  $ l_0 = "dist" \( x \, "spt" nu \) > 0 \, wide overline(B)_(2 l_0) \( x \) subset Omega . $
  Then $H \( l \) = 0$ for $l lt.eq l_0$ and $H \( l \) > 0$ for $l_0 < l lt.eq l_1$,
    where $l_1 > l_0$ is fixed and interior. Put $t = log l$, $t_j = log l_j$, and on $\( t_0 \, t_1 \]$ define
  $ P = A \/ H \, wide n = D \/ H \, wide q = R \/ H . $
  By (8.7),
  #[#set math.equation(numbering: n => "(8.8)")
   $ n gt.eq 0 \, quad n gt.eq 2 P \, quad q gt.eq n^2 \, wide dot(P) = 2 P - n + q -
     2 P n gt.eq \( n - 1 \) \( n - 2 P \) . $ <eq:finite-radius-frequency>]
  For $P gt.eq 1$ the right-hand side is nonnegative. Therefore, going inward from $t_1$, $P \( t \) lt.eq
    max { 1 \, P \( t_1 \) }$.
  On $B_(l_0) \( x \)$, the distributional identities give $f = 0$ and $d_0 = 0$, and (8.4) gives $frak(m) = 0$.
    The compact kernels converge uniformly and vanish on the boundary sphere, so $A \( t \) arrow.r
    0$ as $t arrow.b t_0$, even if $frak(m)$ charges that sphere. Moreover,
  $ \( e^(- 2 t) A \)^dot.op = e^(- 2 t) \( R - D \) gt.eq - 1 / 4 e^(- 2 t) H \, $
  because $q - n gt.eq n^2 - n gt.eq - 1 \/ 4$. Since $dot(H) = 2 D gt.eq 0$, integration from $t_0$ yields
  $ P \( t \) gt.eq - frac(e^(2 \( t - t_0 \)) - 1, 8) . $
  Thus $P$ is bounded on this finite interval. Using $q gt.eq n^2$ in the exact equation for $dot(P)$ now gives
  $ dot(P) gt.eq 1 / 2 n^2 - C . $
  Integrating from $t_0 + epsilon$ to $t_1$ bounds $integral_(t_0 + epsilon)^(t_1) n^2 thin upright(d)
    t$ independently of $epsilon$. In particular $n$ is integrable down to $t_0$.
    But $\( log H \)^dot.op = 2 n$, which prevents $H$ from tending to zero there.
    This contradiction excludes every nonempty open zero-height region.
    Since the kernel is positive in its open ball, the stated conclusion follows. ◻
]

=== 8.2 A second blow-up at the centers <a-second-blow-up-at-the-centers>

#proof[
  The preceding lemma makes $P \( x \, l \) = A \( x \, l \) \/
    H \( x \, l \)$ well defined at every interior ball. In the harmonic-map model from Section 6,
    this quotient is half the weighted Dirichlet frequency
  $
    frac(l^2 integral phi.alt_(x \, l) \| D u \|^2 thin upright(d) y, integral psi_(x \, l) \| u \|^2 thin
    upright(d) y) . $
  For a nonzero harmonic map homogeneous of degree $d$ about $x$,
    the flux identity in (8.7) makes this frequency equal to $d$, so $P = d \/ 2$.
    For the measure data, constant frequency at the retained centers, together with the lower bound $2 P gt.eq
    1$ supplied by their density comparison, will force the radial measure identity used below.
  At a center in $Z$, the additional hypothesis (8.5) gives $2 P gt.eq 1$ for small radii. Hence (8.8) improves to
  #[#set math.equation(numbering: n => "(8.9)")
   $ 2 P gt.eq 1 \, wide n gt.eq 2 P \, wide dot(P) gt.eq \( n - 1 \) \( n - 2 P \) gt.eq
     0 . $ <eq:center-frequency-monotonicity>]
  In particular the finite limit $P \( x \, 0 + \)$ exists and is at least $1 \/ 2$.
  Suppose that $dim_(cal(H)) Z > m - 1$, and choose $m - 1 < s' < dim_(cal(H)) Z$.
    We may first restrict to centers in a compact interior region for which (8.5) holds on one common interval
    $0 < l < l_(*)$. To justify this restriction, exhaust $Omega$ by compact sets with positive boundary distance
    and impose the comparison for all rational radii below $1 \/ k$.
    The resulting sets are Borel by continuity of the kernels, their union is $Z$,
    and continuity in radius supplies the comparison at every radius. One of them still has dimension greater than $s'$.
  The compact-subset theorem and Egoroff’s theorem now give a compact set $K$ of positive finite $cal(H)^(s')$
    measure on which
  #[#set math.equation(numbering: n => "(8.10)")
   $ P \( y \, l \) arrow.r P \( y \, 0 + \) quad upright("uniformly as ") l arrow.b 0 .
     $ <eq:uniform-center-frequency>]
  Indeed first apply Egoroff at dyadic radii; monotonicity supplies the same conclusion between them.
    Since each function $P \( dot.op \, l \)$ is continuous, its uniform limit is continuous on $K$.
    A further compact restriction gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ cal(H)^(s') \( K ∩ B_u \( y \) \) lt.eq C u^(s') . $ <eq:second-center-frostman>]
  Choose $x in K$ with positive upper $s'$-density, and radii $l_j arrow.b
    0$ such that $cal(H)^(s') \( K ∩ B_(l_j) \( x \) \) gt.eq c l_j^(s')$.
  We next normalize the measure tuple at these scales. Fix an open neighborhood $Omega' subset.double
    Omega$ of $x$, so that the constant in (8.4) is fixed on $Omega'$.
    Put $T_j \( y \) = \( y - x \) \/ l_j$ and $N_j = l_j^m H \( x \, l_j \)$.
    On the expanding domains $T_j \( Omega \)$ define
  #[#set math.equation(numbering: n => "(8.12)")
   $ nu_j = N_j^(- 1) \( T_j \)_(\#) nu \, wide f_j = l_j N_j^(- 1) \( T_j \)_(\#) f \,
     wide \( beta_j \, d_j \, frak(m)_j \) = l_j^2 N_j^(- 1) \( T_j \)_(\#) \( beta \, d_0 \, frak(m) \) .
     $ <eq:second-measure-normalization>]
  The identities and inequalities (8.2)–(8.4) are invariant under this normalization,
    and the new height at center zero and radius one equals one.
  Here are the local mass bounds needed to pass to a limit.
    At the fixed center $x$, $P$ is bounded on $0 < l < l_(*) \/ 2$.
    The exact quotient equation and $n lt.eq sqrt(q)$ therefore give
  $ dot(P) = q - \( 1 + 2 P \) n + 2 P gt.eq 1 / 2 q - C . $
  On every interval of radii with bounded ratio, this bounds $integral q thin upright(d) log l$.
    Since $dot(H) \/ H = 2 n lt.eq 2 sqrt(q)$, Cauchy–Schwarz gives two-sided comparison of $H$ on the same interval.
  To see the resulting mass estimates explicitly, fix $R > 0$ and discard finitely many $j$ so that all balls used
    below lie in $Omega'$. Comparison on the interval from $min { 1 \, R } l_j$ to $max { 1 \,
    4 R } l_j$ gives $H \( x \, tau l_j \) lt.eq C_R H \( x \, l_j \)$ for $R lt.eq tau lt.eq 4 R$.
    The kernel $psi_(x \, 2 R l_j)$ is at least $c_R l_j^(- m)$ on $B_(R l_j) \( x \)$; hence
  $ nu \( B_(R l_j) \( x \) \) lt.eq C_R l_j^m H \( x \, l_j \) . $
  The integrated bound for $q$ on $\[ 2 R l_j \, 4 R l_j \]$ supplies $tau_j
    in \[ 2 R \, 4 R \]$ with $n \( x \, tau_j l_j \) lt.eq C_R$.
    The kernel $phi.alt_(x \, tau_j l_j)$ is also at least $c_R l_j^(- m)$ on $B_(R l_j) \( x \)$,
    so the definition of $D = n H$ gives
  $ d_0 \( B_(R l_j) \( x \) \) lt.eq C_R l_j^(m - 2) H \( x \, l_j \) \, wide nu_j \( B_R \) +
    d_j \( B_R \) lt.eq C_R . $
  Positivity bounds $beta_j$ by its trace $d_j$, and Cauchy–Schwarz for (8.2) bounds $f_j$.
    Finally, $\| frak(m)_j \| lt.eq C_(Omega') d_j$ on every fixed ball for all sufficiently large $j$.
    In particular the same constant is available on all fixed balls of the eventual limit.
  Pass to a diagonal subsequence with local weak limits on $bb(R)^m$, and denote them by
  $ nu_oo \, quad f_oo \, quad beta_oo \, quad d_oo \, quad frak(m)_oo . $
  They satisfy the same measure identities and inequalities.
    The normalization gives $H_oo \( 0 \, 1 \) = 1$, so $nu_oo eq.not 0$ and Lemma 14 applies on all of $bb(R)^m$.
  The rescaled center measures
  $ lambda_j = l_j^(- s') \( T_j \)_(\#) #scale(x: 120%, y: 120%)[\(] cal(H)^(s') #h(-0.16667em)
    corner.l.b \( K ∩ overline(B)_(l_j) \( x \) \) #scale(x: 120%, y: 120%)[\)] $
  have a nonzero weak limit $lambda$ on $overline(B)_1$, with the upper ball bound (8.11).
    Consequently $"spt" lambda$ spans $bb(R)^m$. Otherwise its bounded support lies in an
    $\( m - 1 \)$-dimensional linear space and can be covered by $O \( epsilon^(- \( m - 1 \)) \)$ balls of radius
    $epsilon$. The ball bound would give $lambda \( bb(R)^m \) lt.eq C epsilon^(s' - m + 1) arrow.r 0$,
    contradicting its nonzero mass.
  We have now retained enough centers in the second blow-up.
    Its remaining feature is that they all have the same constant frequency.
    If $z in "spt" lambda$, choose $y_j in K$ with $T_j \( y_j \) arrow.r z$. At every fixed radius $r > 0$,
  $ P_j \( T_j \( y_j \) \, r \) = P \( y_j \, l_j r \) arrow.r P \( x \, 0 + \) = : P_0 . $
  This follows from (8.10) and continuity of the limiting frequency on $K$.
    Local mass bounds and continuous compact kernels permit passage to the weak limits even with these moving
    centers. Since the limiting height is positive,
  #[#set math.equation(numbering: n => "(8.13)")
   $ P_oo \( z \, r \) = P_0 quad \( z in "spt" lambda union { 0 } \, med r > 0 \) \, wide P_0 gt.eq 1 /
     2 . $ <eq:constant-frequency-centers>]
  The comparison inequality also passes to these centers.
  ==== Equality at independent centers <equality-at-independent-centers>
  Fix $z in "spt" lambda union { 0 }$. In the limit, (8.9) and (8.13) give
  $ 0 = dot(P)_oo gt.eq \( n - 1 \) \( n - 2 P_0 \) gt.eq 0 . $
  As $n gt.eq 2 P_0 gt.eq 1$, this forces $n = 2 P_0 = : n_0$, including the case $P_0 = 1 \/ 2$.
    The exact quotient equation then gives $q = n_0^2$, or equivalently $D = n_0 H$ and $R = n_0^2 H$.
  Let $cal(M)_oo$ be the positive matrix measure in (8.2) for the limiting data.
    Contract it with $\( - n_0 \, y - z \)$ and integrate against $psi_(z \, r)$. The result is
  $ n_0^2 H - 2 n_0 D + R = 0 . $
  With respect to the trace measure, a positive semidefinite matrix whose quadratic form vanishes on a vector
    annihilates that vector. Since $psi_(z \, r) > 0$ on $B_r \( z \)$, the first row therefore gives
  $ \( y - z \) dot.op upright(d) f_oo \( y \) = n_0 thin upright(d) nu_oo \( y \) quad upright("on ") B_r \( z \) . $
  The radius is arbitrary, so this is an identity on $bb(R)^m$.
    Subtracting the identity for center zero yields $z dot.op f_oo = 0$.
    The support of $lambda$ spans $bb(R)^m$, and hence $f_oo = 0$.
    The identity at zero then gives $n_0 nu_oo = 0$, contradicting $n_0 gt.eq 1$ and $H_oo \( 0 \, 1 \) = 1$.
    This proves the proposition. ◻
]

=== 8.3 Completion of the varifold argument <completion-of-the-varifold-argument>

#proof[
  Suppose that $dim_(cal(H)) "Sing" \( V \) > m - 1$, and choose $m - 1 < s < dim_(cal(H)) "Sing" \( V \)$.
    Proposition 2 gives the fixed singular point, flat target scales, and center measures satisfying (2.3).
    Proposition 10 supplies the centered, nonzero height normalization at these scales.
    Proposition 11 then gives on the connected base ball $B_4 subset
    Pi$ the nonzero measure tuple satisfying (6.2), (6.3), and (6.4). These are precisely the hypotheses (8.2)–(8.4).
  Pass to a weak limit $sigma$ of the center measures. It is nonzero,
    is supported in $Pi ∩ overline(upright(bold(B)))_1$, and retains the upper ball bound with exponent $s$.
    The mass distribution principle therefore gives $dim_(cal(H)) "spt" sigma gt.eq s$.
    Proposition 12 supplies (7.2) at every point of $"spt" sigma$, which is (8.5).
    Applying Proposition 13 with $Z = "spt" sigma$ gives
  $ s lt.eq dim_(cal(H)) "spt" sigma lt.eq m - 1 \, $
  a contradiction.
  For sharpness, take two distinct $m$-planes intersecting in an $\( m - 1 \)$-plane, each with multiplicity one.
    Their sum is stationary by additivity of first variation.
    Away from the intersection it is locally a single smooth plane,
    whereas at the intersection its support is not a smooth embedded $m$-submanifold.
    Its singular set therefore has dimension exactly $m - 1$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
