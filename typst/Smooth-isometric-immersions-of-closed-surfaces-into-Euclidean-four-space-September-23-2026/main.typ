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

#align(center)[#text(size: 16pt, weight: "bold")[Smooth isometric immersions of closed surfaces \
into Euclidean four-space]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $M$ be a closed smooth surface: a compact smooth two-dimensional manifold without boundary. We do not assume that $M$ is orientable or connected. For a smooth positive definite metric $g$ on $M$, an isometric immersion into Euclidean four-space is a smooth map $F : M arrow.r bb(R)^4$ satisfying

$ chevron.l d F_p \( v \) \, d F_p \( w \) chevron.r = g_p \( v \, w \) #h(2em) \( p in M \, med v \, w in T_p M \) . $

Positive definiteness then makes $d F_p$ injective at every point. The question is whether every such metric can be realized in this dimension.

#thm([Theorem 1.1.])[
  #emph[Every closed smooth Riemannian surface $\( M \, g \)$ admits a $C^oo$ isometric immersion into $\( bb(R)^4 \, delta_4 \)$, where $delta_4 = sum_(i = 1)^4 d x_i^2$.]
] <thm:main>

The result concerns immersion; self-intersections are allowed. There is no restriction on Gaussian curvature or on the topology of the closed surface. In particular, the construction applies directly to nonorientable surfaces.

=== 1.1 Context <context>

Gromov explicitly recorded the question of smooth isometric immersion of arbitrary smooth Riemannian surfaces into $bb(R)^4$ #cite(label("Gromov2000")) §I, Remark (d), p. 3 of the author version. He later attributed the four-space surface question to Chern around 1950, while expressing uncertainty about the compactness qualification #cite(label("Gromov2015")) p. 4, footnote 6. Theorem 1 concerns the compact boundaryless case of this question.

Nash’s smooth embedding theorem gives a global realization of a compact $n$-dimensional Riemannian manifold in dimension $n \( 3 n + 11 \) \/ 2$, which is $17$ for surfaces #cite(label("Nash1956")) Theorem 2, p. 59. A closer surface comparison is Gromov’s construction of smooth isometric immersions of closed surfaces into $bb(R)^5$: his retrospective explicitly recalls this result and refers to §3.2.4 of #emph[Partial Differential Relations] #cite(label("Gromov2015")) p. 59#cite(label("GromovPDR1986")). Theorem 1 lowers this immersion dimension to four.

The local analytic theory reaches a smaller dimension. The theorem of Janet and Cartan places an analytic Riemannian surface locally and isometrically in $bb(R)^3$ #cite(label("Janet1926")) #cite(label("Cartan1927")); see also the formulation in #cite(label("Gromov2015")) §1.2. Both the analytic hypothesis and the local conclusion matter here. For comparison, the companion #cite(label("OpenAILocalObstruction2026")) Theorem A constructs a smooth positive definite metric on $\( - 1 \, 1 \)^2$ for which no neighborhood of the origin admits a smooth isometric immersion into $bb(R)^3$.

There is also a smooth four-dimensional theory on planar domains. Poznyak proved that $C^(3 \, alpha)$ data admit $C^(2 \, alpha)$ isometric immersions into $bb(R)^4$ on compact portions of a simply connected planar domain with regular boundary #cite(label("Poznyak1973")) Theorem 4, p. 67. The smooth version of this construction is stated and explained in Lewicka’s modern account #cite(label("Lewicka2026v3")) Theorem 9.1, p. 57. Passing from planar domains to a closed surface requires the corrections to remain compatible through a global construction. Here we achieve this by preserving the normal geometry needed for successive local metric corrections.

Regularity gives a second distinction. An immersion is #emph[strictly short] if the prescribed metric minus its induced metric is positive definite. Nash’s oscillatory construction and Kuiper’s codimension-one refinement show that a strictly short immersion in positive codimension can be uniformly approximated by $C^1$ isometric immersions #cite(label("Nash1954")) #cite(label("Kuiper1955")); the contemporaneous account #cite(label("Choquet1958")) Theorems 1–2 states the immersion form explicitly. Lewicka proves a finer flexibility theorem in $bb(R)^4$ for metrics of low Hölder regularity. In the August 2026 version, the domain is bounded, planar, and diffeomorphic to a disk, the metric is $C^(r \, beta)$ on its closure with $0 < r + beta lt.eq 2$, and strictly short $C^1$ immersions admit uniform approximation by $C^(1 \, alpha)$ isometric immersions for $0 < alpha < min { \( r + beta \) \/ 2 \, 1 }$ #cite(label("Lewicka2026v3")) Theorem 1.1, p. 2. These domain and regularity hypotheses differ from the smooth closed-surface statement of Theorem 1.

The proof uses the established ideas of positive rank-one metric decomposition, oscillatory metric correction, and smoothing to control derivative loss. We give the corresponding attribution where these ideas enter the construction. The mode equations, finite correctors, smooth convergence argument, and propagation of the normal geometry are proved below. Whitney’s ordinary immersion theorem supplies the starting map #cite(label("Whitney1944")) Theorem 8, p. 274; Sard’s equal-dimensional critical-value theorem is used to choose the support boundaries and phases #cite(label("Sard1942")) Theorem 4.1, p. 885.

=== 1.2 The construction <the-construction>

The proof has four stages. First prepare a smooth immersion into a small round three-sphere in $bb(R)^4$ together with a finite decomposition of its metric deficit. Its induced metric $g_0$ is strictly below $g$, and the negative radial direction is a globally defined normal, including when $M$ is nonorientable. The decomposition has the form

#[#set math.equation(numbering: n => "(1.1)")
 $ g - g_0 = sum_(j = 1)^(J_0) a_j^2 thin d x_j^2 \, $ <eq:intro-sum>]

where each $x_j$ is a coordinate function on a disk and $a_j$ is smooth, positive in that disk, and zero outside it. The decomposition is arranged so that each phase has a positive transverse Hessian for the metric immediately preceding its addition.

Second, let $F$ be the current immersion and consider one addition $a^2 d x^2$. Write $y$ for a complementary coordinate. The relevant plane is perpendicular to both $F_y$ and $F_(y y)$. A periodic path on a circle in this plane has the prescribed average and adds $a^2 d x^2$ to the leading metric. Orthogonality to $F_(y y)$ removes the first transverse metric error. A finite expansion then cancels the oscillatory errors to an arbitrarily prescribed order. Its remaining mean terms form a finite differential perturbation of the induced-metric map. Small corrections on a slower scale reduce this perturbed map’s error to the required finite accuracy.

Third, turn the resulting approximate metric into an exact one. We prove a smooth correction theorem under the pointwise hypothesis that the vector-valued second fundamental form is nonzero. A finite construction solves the linearized equation on individual oscillatory modes to arbitrarily high finite accuracy, with suitably chosen phase directions. Smoothing between successive steps controls the lost derivatives; increasing the accuracy in successive blocks gives convergence in every smooth norm. No global inverse of the linearized metric map is required.

Finally, retain the geometric conditions needed for the remaining disks. The large oscillation may rotate the second fundamental form. Conditions on the later boundary curves, and a choice of large transverse derivatives at the turns of the velocity loop, prevent its relevant normal directions from vanishing or becoming opposite to the preferred normal. The small $C^2$ exact correction preserves the required derivative asymptotics. Together with the exact Gauss equation, these asymptotics establish the strict boundary and crossing conditions. After the finite list of additions, the induced metric is $g$ by (1.1).

The two analytical devices used here have separate roles. The small-mode construction supplies high-order metric accuracy while its displacement is small in $C^2$. The large circle construction changes the metric by a prescribed positive primitive tensor while retaining selected second-derivative information. Their combination is what permits a finite global construction in codimension two. The number of global primitive additions is finite; within each addition, however, the exact correction uses an infinite smoothing iteration converging to one map in every $C^m$ norm.

=== 1.3 Organization <organization>

Section 2 sets up normal geometry and admissible phases. Section 3 states the primitive-addition theorem, including the boundary conditions it preserves. Sections 4 and 5 prove the small increment and exact correction results. Sections 6 and 7 construct the velocity loop and realize the primitive metric. Section 8 completes the primitive-addition proof. Section 9 prepares the finite list and proves Theorem 1.

== 2 Normal geometry and admissible phases <sec:preliminaries>

We begin with the geometric information used by both corrections. A nonzero second fundamental form supplies enough directions for the small oscillations; it need not satisfy any rank condition beyond being nonzero as a tensor.

Fix a smooth background metric and a finite collection of precompact coordinate patches on $M$. All $C^m$ norms and unmarked tangent norms use these fixed data. For a smooth immersion $F : M arrow.r bb(R)^4$, write

$ gamma \( F \) = F^(*) delta_4 \, #h(2em) N_F = \( d F \( T M \) \)^perp \, #h(2em) B_F \( V \, W \) = "proj"_(N_F) D_V \( d F \( W \) \) . $

The last expression is tensorial; in coordinates $B_(F \, i j)$ is the normal projection of $F_(i j)$. Let $K_gamma$ denote the Gaussian curvature of $gamma = gamma \( F \)$. Our sign convention for the Gauss equation is

#[#set math.equation(numbering: n => "(2.1)")
 $ chevron.l B_F \( V \, V \) \, B_F \( W \, W \) chevron.r - \| B_F \( V \, W \) \|^2 = K_gamma thin \| V and W \|_gamma^2 . $ <eq:gauss>]

In coordinates $x \, y$, the right side is $K_gamma det gamma$ for $V = partial_x \, W = partial_y$. The Hessian convention gives $"Hess"_gamma x \( partial_y \, partial_y \) = - Gamma_(y y)^x$. To check (2.1), choose Riemannian normal coordinates for $gamma$, orthonormal at the point under consideration. There $Gamma = 0$, so $F_(x x) \, F_(x y) \, F_(y y)$ are normal vectors, and the coordinate curvature formula is

$ K_gamma = partial_(x y) gamma_(x y) - 1 / 2 #scale(x: 120%, y: 120%)[\(] partial_(x x) gamma_(y y) + partial_(y y) gamma_(x x) #scale(x: 120%, y: 120%)[\)] . $

Substituting $gamma_(i j) = chevron.l F_i \, F_j chevron.r$ cancels the third derivatives and gives $K_gamma = chevron.l F_(x x) \, F_(y y) chevron.r - \| F_(x y) \|^2$ at that point. Tensoriality gives (2.1) for arbitrary $V \, W$.

A #emph[preferred normal] is a smooth unit section of $N_F$. This is less than a normal frame: we will use complementary normal vectors only within coordinate disks. None of the following local constructions requires an orientation of $M$.

#prodef([Definition 2.1.])[
  A nonzero covector $xi in T_p^(*) M$ is #emph[good for $F$] if $B_F \( Y \, Y \) eq.not 0$ for a nonzero vector $Y in ker xi$. This condition is independent of the choice of $Y$ in that line.
]

If $B_F \( p \) eq.not 0$, there are only finitely many bad projective covectors at $p$. Indeed, take a normal component of $B_F \( p \)$ that is a nonzero scalar quadratic form. Its zeros in the projective tangent line are finite, and a zero of the vector-valued quadratic form must be one of these zeros.

We choose these good directions for the small oscillatory corrections. They need not be the phases $x_j$ of the prescribed primitive additions in (1.1): those phases will satisfy a transverse Hessian condition, and their transverse second fundamental form may vanish in the interior of the support disk.

Writing a positive metric as a sum of positive rank-one forms is a basic part of Nash’s construction #cite(label("Nash1954")); see #cite(label("Gromov2015")) §3.5.4, p. 32 and footnote 30 and #cite(label("Kallen1978")) Lemmas 2.2–2.3 for related decompositions. Here the individual phases and their relevant pairwise combinations must also be good for the current second fundamental form. The following construction supplies those additional conditions.

#thm([Lemma 2.2.])[
  (Positive phase decompositions).  #emph[Let $F : M arrow.r bb(R)^4$ be a smooth immersion with $B_F \( p \) eq.not 0$ for every $p$, and let $h_0$ be a smooth positive definite tensor. There are finitely many functions $phi.alt_nu$ defined on coordinate patches, smooth cutoffs $psi_nu$ supported compactly in those patches, and smooth fiberwise linear forms $q_nu$ on symmetric tensors, such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ H = sum_nu b_nu \( H \)^2 thin d phi.alt_nu^2 \, #h(2em) b_nu \( H \) = psi_nu sqrt(q_nu \( H \)) $ <eq:phase-decomposition>]

 whenever $H$ is sufficiently close to $h_0$ in $C^0$. Every square root has a strict positive lower bound before multiplication by the cutoff. On the appropriate supports the differentials of $phi.alt_nu$, $2 phi.alt_nu$, and $phi.alt_nu plus.minus phi.alt_mu$ for $nu eq.not mu$ are nonzero and good. These conclusions persist for immersions in a sufficiently small $C^2$ neighborhood of $F$. Each phase or phase combination has a smooth complementary coordinate coframe on the support where it is used.]
] <lem:phase-data>

#proof[
  At a point choose an $h_0$-orthonormal coframe and three covectors with angles $0 \, pi \/ 3 \, 2 pi \/ 3$, rotated by a common angle. Their squares form a basis of the three-dimensional space of symmetric tensors, and $h_0$ is a positive linear combination of them. A rotation avoids the finite bad set simultaneously for all three directions. Extend the covectors as differentials of coordinate-linear functions on a small patch. The basis, positivity, and goodness conditions persist after shrinking the patch. The three coefficient forms in this basis are smooth in position. A finite such cover and a partition $sum_alpha psi_alpha^2 = 1$, with each cutoff supported in its patch, give (2.2), using three indices over each patch.
  It remains to control combinations from different indices. Multiply successive phases by sufficiently rapidly increasing positive constants, and divide their coefficient forms by the squares of those constants. For two intersecting supports, the differential of either sum or difference, after normalization, is arbitrarily close to that of the member with the larger weight. There are only finitely many supports, and goodness has a positive angular margin on their compact closures. Inductively chosen weights therefore make every required combination good and nonzero. Doubles and signs change no kernel line. A coordinate complementary to the dominant phase remains complementary to the combination. All conditions are strict conditions on the first two jets of the immersion; compactness gives their persistence. ◻
]

The small-oscillation argument is local on these coframes. If a combination is not globally injective as a coordinate function, the dual coordinate vector fields still make sense where its differential and the chosen complement are independent. Subdivision gives actual coordinate neighborhoods when necessary. Amplitudes are compactly supported there, so extension by zero is smooth.

For the exact correction, the phase data must also be controlled when the input immersion varies with a small parameter. We record this quantitative version separately. In the statement, a quantity is #emph[polynomially bounded] if its absolute value is at most $C z^(- A)$ for some finite $A gt.eq 0$; the exponent may depend on a specified finite derivative order, but not on $z$.

#thm([Lemma 2.3.])[
  (Phase data for a varying family).  #emph[Fix a metric $h_(*)$ and suppose that $f_z$, $0 < z < z_0$, are smooth immersions satisfying uniform upper and positive lower metric bounds, 
$ parallel f_z parallel_(C^j) = O \( z^(- j) \) quad \( 0 lt.eq j lt.eq 3 \) \, #h(2em) inf_(p in M) max_(\| Y \| = 1) \| B_(f_z) \( Y \, Y \) \| gt.eq c > 0 . $

 Then the phase data of Lemma 3, with $h_0 = h_(*)$, can be chosen on cells of diameter comparable to $z^6$. The number of cells and all fixed-order derivatives of their cutoff and phase data are polynomially bounded. The good-direction estimates and metric nondegeneracy persist throughout the $C^2$ ball of radius $z^4$ about $f_z$, for all sufficiently small $z$.]
  #emph[No regularity with respect to $z$ is required. The construction uses a bounded number of phase weights, independent of the number of cells. The inverse coframes and the reciprocals of the relevant second-form lengths have polynomial bounds. Consequently every fixed finite differential construction formed from these data by sums, products, derivatives, metric inversion, normal projection, and division by the stated nonzero quantities has polynomial bounds, provided its input has the required finite polynomial derivative bounds. Its exponents depend only on the derivative orders and on the input exponents, not on their implicit constants.]
] <lem:polynomial-phase-data>

#proof[
  Metric bounds imply $d f_z = O \( 1 \)$. Differentiating the formula for normal projection gives
  $ B_(f_z) = O \( z^(- 2) \) \, #h(2em) D B_(f_z) = O \( z^(- 4) \) . $
  For example, $D "proj"_(N_(f_z)) = O \( z^(- 2) \)$ and multiplication by $D^2 f_z = O \( z^(- 2) \)$ gives the latter exponent; the $D^3 f_z$ term is smaller. The constants depend only on the fixed background data, metric bounds, and specified family bounds.
  At each cell center normalize the second fundamental form to have norm one. The space of normalized normal-valued symmetric forms, in background orthonormal frames, is compact. For each such form a rotated positive triple avoids all its bad directions. Thus the maximum, over rotations, of the least of the three second-form lengths has a strictly positive lower bound over this compact set. Shrinking a uniform angular neighborhood preserves a fixed fraction of this bound. This supplies a uniform angular margin and an estimate
  $ \| B_(f_z) \( Y \, Y \) \| gt.eq kappa \| B_(f_z) \| $
  for normalized kernel vectors in the selected directions, with $kappa > 0$ independent of the cell. Fixed coordinate-frame comparisons only alter $kappa$ by a uniform factor.
  Use grids of mesh $z^6$ in the fixed charts, restricted to fixed compact subpatches covering $M$. Smooth cutoffs equal to one on the covering cells and supported in their fixed enlargements have derivatives $O \( z^(- 6 j) \)$ of order $j$. Divide them by the square root of their sum of squares. This gives a partition by squares with the same type of bounds. A fixed lattice coloring, combined with the finite chart index, gives a bounded number of colors such that enlarged supports of the same color are disjoint. The number of cells is $O \( z^(- 12) \)$.
  On an enlarged cell the second form varies by $O \( z^2 \)$; its nonzero lower bound makes this variation small relative to its length. The center’s phase triple therefore stays good. The fixed smooth tensor $h_(*)$ varies by $O \( z^6 \)$, so the positive basis decomposition has a uniform positivity margin. Assign one successive weight to each color and each place in the triple. Intersecting supports have different such labels. Since the angular margins are uniform, a fixed finite sequence of dominant weights makes every pairwise combination good. Derivatives of the resulting coframes and their inverses are bounded at every fixed order by the fixed charts and these weights. No weight depends on the total number of cells.
  If $parallel G - f_z parallel_(C^2) lt.eq z^4$, projection onto the tangent and normal spaces changes by $O \( z^4 \)$. Hence
  $ \| B_G - B_(f_z) \| lt.eq C z^4 \( 1 + z^(- 2) \) = O \( z^2 \) \, $
  so the direction and metric margins persist. Local unit normals used in mode solves are obtained by normalizing a perpendicular product of two tangent vectors and a nonzero vector $B_G \( Y \, Y \)$. Their denominators are bounded below by the metric and direction margins. The coefficient forms in (2.2) retain positive arguments for their square roots on a fixed $C^0$ neighborhood of $h_(*)$. Product and chain rules now prove the last assertion: finitely many inversions and differentiations multiply only finitely many polynomial bounds. The polynomial number of summands can be absorbed in another finite exponent. ◻
]

== 3 The primitive metric addition <sec:primitive-statement>

The global construction will add finitely many positive tensors of rank one. We first state the local step, including the boundary conditions that allow one step to be followed by the next. Only a preferred unit normal is propagated; a full normal frame is chosen locally when needed.

Let $F : M arrow.r bb(R)^4$ be a smooth immersion, and write $gamma = gamma \( F \)$. Suppose $C_0 \, dots.h \, C_m$ are smooth embedded closed curves with nonzero smooth vector fields $Y_i$ defined on neighborhoods of $C_i$. The fields $Y_i$ are not required to be tangent to the curves; in the application they are the transverse coordinate directions of later phases. Set

$ A_i \( F \) = B_F \( Y_i \, Y_i \) quad upright("on ") C_i . $

For $i eq.not l$, wherever the curves intersect and $A_i \( F \) eq.not 0$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ Q_(i l) \( F \) = ⟨B_F \( Y_i \, Y_l \) \, frac(A_i \( F \), \| A_i \( F \) \|)⟩^2 + K_gamma \| Y_i and Y_l \|_gamma^2 . $ <eq:crossing-invariant>]

Here $K_gamma$ is Gauss curvature, and $\| u and v \|_gamma^2 = gamma \( u \, u \) gamma \( v \, v \) - gamma \( u \, v \)^2$. The Gauss equation gives a useful interpretation. With $hat(A)_i = A_i \( F \) \/ \| A_i \( F \) \|$ and $Z_(i l) = B_F \( Y_i \, Y_l \)$,

#[#set math.equation(numbering: n => "(3.2)")
 $ Q_(i l) \( F \) = chevron.l A_i \( F \) \, A_l \( F \) chevron.r - \| Z_(i l) - chevron.l Z_(i l) \, hat(A)_i chevron.r hat(A)_i #scale(x: 120%, y: 120%)[\|]^2 . $ <eq:crossing-gauss-interpretation>]

Thus $Q_(i l) > 0$ forces the two pure second-form vectors to have positive inner product. It also shows that $Q_(i l)$ depends continuously on the $2$-jet of $F$ wherever $A_i eq.not 0$, despite its curvature expression in (3.1). Both observations will be used when the preferred normal is joined across the support boundary. For a preferred normal $n$, the conditions to be preserved are

#[#set math.equation(numbering: n => "(3.3)")
 $ & A_i \( F \) eq.not 0 \, #h(2em) A_i \( F \) \/ \| A_i \( F \) \| eq.not - n &  & upright("on ") C_i \,\
 & chevron.l A_i \( F \) \, n chevron.r > 0 \, #h(2em) Q_(i l) \( F \) > 0 &  & upright("on ") C_i ∩ C_l quad \( i eq.not l \) . $ <eq:boundary-invariants>]

The crossing conditions are imposed in both orders. In particular they require positivity of the dot product with $n$ for each of the two pure second-form vectors. The numbers $Q_(i l)$ do not depend on the chosen preferred normal.

#thm([Proposition 3.1.])[
  (Primitive addition with preserved boundary conditions).  #emph[Let $M$ be a closed smooth surface and $F : M arrow.r bb(R)^4$ a smooth immersion whose second fundamental form is nonzero as a tensor at every point. Assume $F$ has a preferred normal $n$. Let $D$ be a disk with smooth boundary $C_0$ and coordinates $\( x \, y \)$ on a neighborhood of $overline(D)$. Let $a in C^oo \( M \)$ be nonnegative, positive exactly on $D$, and put $Y_0 = partial_y$. Suppose 
#[#set math.equation(numbering: n => "(3.4)")
 $ "Hess"_(gamma \( F \)) x \( partial_y \, partial_y \) > 0 quad upright("on ") overline(D) . $ <eq:primitive-hessian>]

 Let $C_1 \, dots.h \, C_m$ be finitely many later curves with nonzero smooth vector fields $Y_i$ on their neighborhoods. Assume the following:]
  + #emph[All curves $C_0 \, dots.h \, C_m$ are pairwise transverse and have no triple intersection.]
  + #emph[On the portion of each later curve $C_i$, $1 lt.eq i lt.eq m$, in $overline(D)$, the vector $partial_y$ is tangent to $C_i$ at only finitely many points.]
  + #emph[At every $C_i ∩ C_l ∩ D$ with distinct $i \, l > 0$, $d x \( Y_i \) eq.not 0$ and $d x \( Y_l \) eq.not 0$.]
  + #emph[Conditions (3.3) hold for all indices $0 \, dots.h \, m$.]
  #emph[Then, for every $epsilon > 0$, there are a smooth immersion $F_(+) : M arrow.r bb(R)^4$ and a preferred normal $n_(+)$ such that 
$ gamma \( F_(+) \) = gamma_(+) := gamma \( F \) + a^2 thin d x^2 \, #h(2em) B_(F_(+)) eq.not 0 med upright("at every point") \, $

 conditions (3.3) hold for $\( F_(+) \, n_(+) \)$ and all later indices $1 \, dots.h \, m$, and 
$ parallel F_(+) - F parallel_(C^2 \( M \\ D \)) < epsilon . $

 The tensor $a^2 d x^2$ is extended by zero outside the coordinate neighborhood.]
] <prop:primitive-addition>

Because $a$ is smooth and vanishes outside $D$, it and all its derivatives vanish on $C_0$. This makes the extended tensor smooth. The proposition allows the map itself to change on the exterior; the stated $C^2$ control is what will preserve the boundary data of the later steps.

The hypotheses have different roles. Table 1 records how they are established initially and passed to the next primitive step. In particular, the phase-Hessian condition depends on the current metric, whereas the boundary conditions also depend on the immersion and normal.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Condition
], table.cell(rowspan: 1, colspan: 1)[Initial construction
], table.cell(rowspan: 1, colspan: 1)[Use
], table.cell(rowspan: 1, colspan: 1)[Preservation
]),
  table.cell(rowspan: 1, colspan: 1)[$B_F eq.not 0$ everywhere
], table.cell(rowspan: 1, colspan: 1)[Radial component of a spherical immersion
], table.cell(rowspan: 1, colspan: 1)[Good phases and exact correction
], table.cell(rowspan: 1, colspan: 1)[Nonzero transverse second form on the disk; exterior $C^2$ control
],
  table.cell(rowspan: 1, colspan: 1)[Global unit normal $n$
], table.cell(rowspan: 1, colspan: 1)[Negative radial section
], table.cell(rowspan: 1, colspan: 1)[Choice of velocity-plane frame and boundary directions
], table.cell(rowspan: 1, colspan: 1)[Local adjustments, projection and normalized interpolation
],
  table.cell(rowspan: 1, colspan: 1)[Positive transverse phase Hessian
], table.cell(rowspan: 1, colspan: 1)[Convex phases and sufficiently many finite cycles
], table.cell(rowspan: 1, colspan: 1)[Independence of $F_y \, F_(y y)$
], table.cell(rowspan: 1, colspan: 1)[Each actual partial metric is prescribed in advance
],
  table.cell(rowspan: 1, colspan: 1)[$A_i eq.not 0$ and $A_i \/ \| A_i \| eq.not - n$
], table.cell(rowspan: 1, colspan: 1)[Positive radial projection
], table.cell(rowspan: 1, colspan: 1)[Velocity frame near each later support boundary
], table.cell(rowspan: 1, colspan: 1)[Gauss identity and the turn construction
],
  table.cell(rowspan: 1, colspan: 1)[Positive normal projections and both ordered $Q_(i l) > 0$ at crossings
], table.cell(rowspan: 1, colspan: 1)[Second form in $S^3$ made zero at the finite crossing set
], table.cell(rowspan: 1, colspan: 1)[Collar estimates and successive boundary control
], table.cell(rowspan: 1, colspan: 1)[Mixed–pure comparison and local normal adjustments
],
)
]],
  caption: [Table 1: The geometric data carried through the finite construction. Section 9 supplies the initial data and verifies the phase-Hessian condition for every prescribed partial metric. Sections 6–8 preserve the immersion and normal conditions. A single unit normal suffices. ],
)

We prove the proposition in three parts. After the analytic correction results, Section 6 constructs a periodic velocity whose averaged displacement is zero and whose leading metric adds $a^2 d x^2$. Section 7 realizes this velocity by exact smooth immersions with controlled derivatives. Section 8 proves the boundary conditions and constructs the new global preferred normal.

== 4 Small oscillatory metric increments <sec:small-modes>

We first construct a correction whose amplitude and wavelength are both small. A good phase, in the sense of Section 2, permits an oscillation in the normal direction perpendicular to its transverse second form. Finite differential corrections make this oscillation solve the homogeneous linearized equation to high order. Its leading quadratic mean is a positive rank-one tensor. Combining finitely many such oscillations will add a prescribed positive tensor to finite accuracy while changing the map by a quantity small in $C^2$.

We carry out the construction for the metric map and for a finite polynomial differential perturbation of it. In Section 7, removing the large velocity loop’s oscillating errors leaves mean terms that are differential operators of the slow map, multiplied by powers of the fast scale. Here we allow those terms as part of the operator being corrected. The perturbation changes the required relation between scales. We will bound it using a power of the short scale that is independent of the requested finite accuracy.

=== 4.1 Weighted bounds and the increment statement <weighted-bounds-and-the-increment-statement>

For a smooth function, vector field, or tensor on the fixed coordinate atlas, set

$ \| f \|_(m \, s) = sum_(j = 0)^m s^j parallel f parallel_(C^j) \, #h(2em) 0 < s lt.eq 1 . $

For a map $G$, the notation $\| j^2 G \|_(m \, s)$ means $sum_(j = 0)^m s^j parallel G parallel_(C^(j + 2))$. We write $f = O_s \( b \)$ if, for every fixed $m$, $\| f \|_(m \, s) lt.eq C_m b$. In statements concerning a family of inputs, the constants may depend on its indicated weighted bounds and on the fixed coordinate data. Product estimates and smooth composition estimates hold in these norms by the product and chain rules. In particular,

#[#set math.equation(numbering: n => "(4.1)")
 $ \| partial^r G \|_(m \, s) lt.eq C_m s^(2 - r) quad \( r gt.eq 2 \) \, #h(2em) upright("if ") j^2 G = O_s \( 1 \) . $ <eq:weighted-derivative>]

Fix positive phase data from Lemma 3: phases $phi.alt_nu$, cutoffs $psi_nu$, and linear forms $q_nu$. Choose concentric $C^0$ balls $cal(U)_0 \, cal(U)_1$ about a metric $h_0$, with radii $0 < r_0 < r_1$, so that for $A in cal(U)_1$,

#[#set math.equation(numbering: n => "(4.2)")
 $ b_nu \( A \) = psi_nu sqrt(q_nu \( A \)) \, #h(2em) A = sum_nu b_nu \( A \)^2 thin d phi.alt_nu^2 . $ <eq:small-positive-decomposition>]

All square-root arguments have a uniform positive lower bound for $A in cal(U)_1$ on their coordinate neighborhoods. The prescribed tensor belongs to $cal(U)_0$; the larger ball allows the finite intermediate tensor adjustments below. The differentials of $phi.alt_nu$, $2 phi.alt_nu$, and $phi.alt_nu plus.minus phi.alt_mu$ are good wherever the corresponding supports meet. For each such phase choose local coordinates with that phase as the first coordinate. All these finitely many coframes and their inverses have fixed bounds. We require the relevant immersion 2-jets to remain in a compact subset of the open set where these conditions hold.

A differential operator is called #emph[polynomial above order two] if each of its coordinate components is a finite sum of terms

#[#set math.equation(numbering: n => "(4.3)")
 $ c \( x \, j^2 G \) product_(ell = 1)^d partial^(alpha_ell) G^(k_ell) \, #h(2em) \| alpha_ell \| > 2 \, $ <eq:polynomial-jet-monomial>]

where $c$ is smooth; the empty product is allowed. This definition permits arbitrary smooth dependence on the low jets within the prescribed open set.

#thm([Proposition 4.1.])[
  (Small increment).  #emph[Let the phase data above be fixed. Let $P_1 \, dots.h \, P_d$ be fixed smooth tensor-valued differential operators polynomial above order two, and put 
$ cal(P) \( G \) = gamma \( G \) + sum_(i = 1)^d epsilon.alt^i P_i \( G \) \, #h(2em) 0 lt.eq epsilon.alt lt.eq 1 . $

 There is a finite exponent $p$, depending on these operators and independent of the integer $q$ below, with the following property. Suppose $G$ is an immersion whose 2-jets satisfy the stated compact margins, $H in cal(U)_0$, and 
$ j^2 G = O_s \( 1 \) \, #h(2em) H = O_s \( 1 \) . $

 For every positive integer $q$, every $delta > 0$, and scales $0 < tau lt.eq s lt.eq 1$, define 
$ eta = tau / s + epsilon.alt tau^(- p) . $

 If $eta$ and $delta \/ tau$ are sufficiently small, there is a smooth displacement $U$ such that 
#[#set math.equation(numbering: n => "(4.4)")
 $ U = O_tau \( delta tau \) \, #h(2em) cal(P) \( G + U \) - cal(P) \( G \) - delta^2 H = O_tau (delta eta^q + delta^3 / tau) . $ <eq:small-increment-estimate>]

 The smallness thresholds and every fixed output norm use only finitely many weighted input bounds. Their required orders may increase with $q$. Each local summand of $U$ is supported in an original phase support or an intersection of two such supports. If the perturbation sum is absent, take $eta = tau \/ s$.]
] <prop:small-increment>

The proof has three finite steps: solve the nonzero linear modes to high order, adjust their quadratic mean, and cancel the remaining quadratic modes. There is no infinite series of differential operators in this construction.

=== 4.2 The conjugated linearized equation <the-conjugated-linearized-equation>

Fix one permitted phase and call its coordinates $x \, y$. Complexify all vector spaces linearly. Let $g = gamma \( G \)$ and $D_G = gamma' \( G \)$. Decompose a complex amplitude $Z$ as

$ Z = G_k g^(k ell) u_ell + v \, #h(2em) u_i = chevron.l G_i \, Z chevron.r \, #h(2em) v perp "span" \( G_x \, G_y \) . $

Since $G_(i j) = Gamma_(i j)^k G_k + B_(i j)$, direct differentiation gives

$ \( D_G Z \)_(i j) = partial_i u_j + partial_j u_i - 2 Gamma_(i j)^k u_k - 2 chevron.l B_(i j) \, v chevron.r . $

Here and in this subsection $B = B_G$. This identity already accounts for the normal component; no derivative of the normal frame is omitted. Conjugating by $e^(i x \/ tau)$ gives

#[#set math.equation(numbering: n => "(4.5)")
 $ \( D_G^x Z \)_(i j) = partial_i u_j + partial_j u_i - 2 Gamma_(i j)^k u_k + i / tau \( delta_(i x) u_j + delta_(j x) u_i \) - 2 chevron.l B_(i j) \, v chevron.r . $ <eq:conjugated-metric-linearization>]

The good-phase condition says that $b = B_(y y)$ does not vanish. Given a target amplitude $h$ and a normal amplitude $v_0$ perpendicular to $b$, define

#[#set math.equation(numbering: n => "(4.6)")
 $ c_(i j) = frac(chevron.l B_(i j) \, b chevron.r, \| b \|^2) \, #h(2em) v = v_0 + frac(b, \| b \|^2) (partial_y u_y - Gamma_(y y)^k u_k - h_(y y) / 2) . $ <eq:normal-elimination>]

The $y y$ equation in $D_G^x Z = h$ is then exact. The $x x$ equation, divided by 2, and the $x y$ equation become

#[#set math.equation(numbering: n => "(4.7)")
 $ i / tau u_x + partial_x u_x - Gamma_(x x)^k u_k - c_(x x) \( partial_y u_y - Gamma_(y y)^k u_k \) & = h_(x x) / 2 + chevron.l B_(x x) \, v_0 chevron.r - frac(c_(x x) h_(y y), 2) \,\
i / tau u_y + partial_x u_y + partial_y u_x - 2 Gamma_(x y)^k u_k - 2 c_(x y) \( partial_y u_y - Gamma_(y y)^k u_k \) & = h_(x y) + 2 chevron.l B_(x y) \, v_0 chevron.r - c_(x y) h_(y y) . $ <eq:conjugated-xx>]

Thus the remaining system is

$ i / tau u + L u = k \( h \, v_0 \) \, $

where $L$ is first order and $k$ is algebraic and linear. All coefficients are smooth functions of the 2-jet of $G$ on the permitted compact set.

Define $S \( h \, v_0 \)$ by taking $u = \( tau \/ i \) k \( h \, v_0 \)$ and reconstructing $v \, Z$ from (4.6). Weighted differentiation gives

#[#set math.equation(numbering: n => "(4.8)")
 $ \| S \( h \, v_0 \) \|_(m \, s) & lt.eq C_m #scale(x: 120%, y: 120%)[\(] \| h \|_(m + 1 \, s) + \| v_0 \|_(m + 1 \, s) #scale(x: 120%, y: 120%)[\)] \,\
\| D_G^x S \( h \, v_0 \) - h \|_(m \, s) & lt.eq C_m tau / s #scale(x: 120%, y: 120%)[\(] \| h \|_(m + 1 \, s) + \| v_0 \|_(m + 1 \, s) #scale(x: 120%, y: 120%)[\)] . $ <eq:first-parametrix-bound>]

Indeed the residual is $L u$, and the reconstructed normal component contains at most one derivative of $u$. In the homogeneous case the leading term is exactly the chosen normal amplitude:

#[#set math.equation(numbering: n => "(4.9)")
 $ \| S \( 0 \, v_0 \) - v_0 \|_(m \, s) lt.eq C_m tau / s \| v_0 \|_(m + 1 \, s) . $ <eq:free-mode-leading>]

These are differential formulas, so they preserve supports.

=== 4.3 A fixed exponent for polynomial perturbations <a-fixed-exponent-for-polynomial-perturbations>

We next quantify the effect of the operators $P_i$. This is the point at which independence from the approximation order $q$ is needed.

For a monomial (4.3), let

$ E_alpha = sum_(ell = 1)^d \( \| alpha_ell \| - 2 \) \, #h(2em) E = max E_alpha \, $

where the maximum runs over all monomials of all $P_i$. For an empty collection take $E = 0$. A permissible choice will be

#[#set math.equation(numbering: n => "(4.10)")
 $ p = E + 6 . $ <eq:fixed-perturbation-power>]

To verify this, consider a variation of order $k lt.eq 3$. Suppose $h$ arguments replace higher-jet factors of orders $r_1 \, dots.h \, r_h$ and the other $k - h$ arguments differentiate the smooth low-jet coefficient. The unvaried factors have excess weight $E_alpha - sum_(j = 1)^h \( r_j - 2 \)$. The variation arguments carry at most $sum_j r_j + 2 \( k - h \)$ derivatives. The total short-scale power is therefore at most

$ E_alpha - sum_(j = 1)^h \( r_j - 2 \) + sum_(j = 1)^h r_j + 2 \( k - h \) = E_alpha + 2 k lt.eq E + 6 . $

Weighted differentiation does not increase this exponent: (4.1) controls each differentiated higher-jet factor, and the chain rule controls the smooth low-jet coefficient. For conjugated amplitudes, each derivative of an exponential costs a power of $tau^(- 1)$, while a slow derivative costs $s^(- 1) lt.eq tau^(- 1)$.

Put $cal(R) = cal(P) - gamma$. For $1 lt.eq k lt.eq 3$, this proves, with a fixed finite derivative loss $ell$, the bounds

#[#set math.equation(numbering: n => "(4.11)")
 $ & lr(|e^(- i \( phi.alt_1 + dots.h.c + phi.alt_k \) \/ tau) cal(R)^(\( k \)) \( G \) #scale(x: 120%, y: 120%)[\(] e^(i phi.alt_1 \/ tau) Z_1 \, dots.h \, e^(i phi.alt_k \/ tau) Z_k #scale(x: 120%, y: 120%)[\)]|)_(m \, s)\
 & #h(35mm)  lt.eq C_m epsilon.alt tau^(- p) product_(j = 1)^k \| Z_j \|_(m + ell \, s) . $ <eq:conjugated-perturbation-bound>]

The phases in this estimate belong to the fixed finite collection. At scale $tau$, the same estimate without exponentials holds for arbitrary variations at every map $K$ with $j^2 K = O_tau \( 1 \)$ in the permitted low-jet domain. The constants use finitely many corresponding weighted bounds. The inequality $epsilon.alt^i lt.eq epsilon.alt$ handles all the perturbation coefficients.

Let $cal(L) = \( cal(P)' \( G \) \)^x$ and $S_0 \( h \) = S \( h \, 0 \)$. Combining (4.8)–(4.8) with (4.11) gives

$ \| cal(L) S \( h \, v_0 \) - h \|_(m \, s) lt.eq C_m eta #scale(x: 120%, y: 120%)[\(] \| h \|_(m + ell \, s) + \| v_0 \|_(m + ell \, s) #scale(x: 120%, y: 120%)[\)] \, $

after increasing $ell$. Starting with $Z_0 = S \( h \, v_0 \)$, define

$ r_j = cal(L) Z_j - h \, #h(2em) Z_(j + 1) = Z_j - S_0 \( r_j \) . $

The exact identity

$ r_(j + 1) = - \( cal(L) S_0 - "Id" \) r_j $

shows by finite induction that, for any integer $q$, the resulting amplitude $Z$ satisfies

#[#set math.equation(numbering: n => "(4.12)")
 $ \| Z \|_(m \, s) & lt.eq C_(m \, q) #scale(x: 120%, y: 120%)[\(] \| h \|_(m + ell_q \, s) + \| v_0 \|_(m + ell_q \, s) #scale(x: 120%, y: 120%)[\)] \,\
\| cal(L) Z - h \|_(m \, s) & lt.eq C_(m \, q) eta^q #scale(x: 120%, y: 120%)[\(] \| h \|_(m + ell_q \, s) + \| v_0 \|_(m + ell_q \, s) #scale(x: 120%, y: 120%)[\)] . $ <eq:finite-mode-bound>]

For $h = 0$ it also satisfies

#[#set math.equation(numbering: n => "(4.13)")
 $ \| Z - v_0 \|_(m \, s) lt.eq C_(m \, q) eta \| v_0 \|_(m + ell_q \, s) . $ <eq:finite-free-mode>]

The integer $ell_q$ and the constants may increase with $q$, but the exponent $p$ in (4.10) has already been fixed. Every step is differential and support preserving.

We have now solved every allowed nonzero mode to any fixed power of $eta$. It remains to select the free amplitudes so that their quadratic mean is the desired tensor and then remove the oscillatory quadratic error.

=== 4.4 The quadratic mean and its finite adjustment <the-quadratic-mean-and-its-finite-adjustment>

Finite inner corrections to oscillatory amplitudes also occur in Källén’s low-regularity embedding construction #cite(label("Kallen1978")) Lemma 3.3 and its proof. We derive the mean equation and its finite substitution estimates for the differential operators considered here.

In a phase chart choose a smooth unit normal $n_nu$ perpendicular to $\( B_G \)_(y y)$. One explicit choice is the normalized ambient perpendicular product of $G_x \, G_y \, \( B_G \)_(y y)$. The vectors in this product are independent. The choice depends smoothly on the 2-jet and uses only the orientation of this chart and of $bb(R)^4$.

For a trial tensor $A in cal(U)_1$, use

$ v_(0 \, nu) = sqrt(2) thin delta tau b_nu \( A \) n_nu \, #h(2em) h = 0 \, $

in the finite mode construction, and denote its amplitude by $Z_nu \( A \)$. Define the real displacement

$ U_1 \( A \) = sum_nu "Re" #scale(x: 120%, y: 120%)[\(] e^(i phi.alt_nu \/ tau) Z_nu \( A \) #scale(x: 120%, y: 120%)[\)] . $

Then $U_1 = O_tau \( delta tau \)$. Before multiplication by the exponential, the leading complex amplitude of $d U_1 \/ delta$ in the $nu$th mode is

$ i sqrt(2) thin b_nu \( A \) n_nu thin d phi.alt_nu \, $

with error $O_s \( eta \)$. This follows from (4.13); a slow derivative of the leading amplitude contributes $O_s \( tau \/ s \)$. Furthermore,

#[#set math.equation(numbering: n => "(4.14)")
 $ cal(P)' \( G \) U_1 = O_tau \( delta tau eta^q \) . $ <eq:free-sum-linear-error>]

Expand the quadratic tensor

$ Q \( A \) = 1 / 2 cal(P)'' \( G \) \( U_1 \( A \) \, U_1 \( A \) \) $

using the positive and negative mode labels. Its #emph[zero-phase part], denoted $Q_0 \( A \)$, consists of a mode paired with its own complex conjugate. All other terms have phases $plus.minus 2 phi.alt_nu$ or $plus.minus phi.alt_nu plus.minus phi.alt_mu$ with $nu eq.not mu$. The latter phases have nonzero differentials on their supports, by hypothesis; in particular they do not contribute another zero-phase term. Repeated nonzero phases may simply be grouped.

For one leading real mode, the metric quadratic term is

$ 2 delta^2 b_nu \( A \)^2 sin^2 \( phi.alt_nu \/ tau \) thin d phi.alt_nu^2 = delta^2 b_nu \( A \)^2 #scale(x: 120%, y: 120%)[\(] 1 - cos \( 2 phi.alt_nu \/ tau \) #scale(x: 120%, y: 120%)[\)] thin d phi.alt_nu^2 . $

Its zero-phase term is $delta^2 b_nu \( A \)^2 d phi.alt_nu^2$. Thus (4.2) and the amplitude error give

#[#set math.equation(numbering: n => "(4.15)")
 $ delta^(- 2) Q_0 \( A \) = A + T \( A \) \, #h(2em) T \( A \) = O_s \( eta \) . $ <eq:quadratic-mean-map>]

The contribution of $cal(R)''$ has the same bound, since (4.11) bounds it by $C epsilon.alt tau^(- p) \( delta tau \)^2 lt.eq C delta^2 eta$. Every nonzero-mode coefficient of $Q$ is $O_s \( delta^2 \)$.

The map $T$ has a finite derivative-loss difference estimate:

#[#set math.equation(numbering: n => "(4.16)")
 $ \| T \( A \) - T \( macron(A) \) \|_(m \, s) lt.eq C_m eta \| A - macron(A) \|_(m + L_q \, s) $ <eq:mean-map-difference>]

on bounded sets of weighted norms in $cal(U)_1$. To see this, the square roots in $b_nu$ have positive lower bounds, so their chain-rule difference estimates apply. The finite mode construction is linear in $b_nu \( A \) n_nu$. In the difference of the two sides of (4.15), the leading contribution $A - macron(A)$ cancels exactly. Every remaining bilinear term contains either one $O_s \( eta \)$ mode error or the factor $epsilon.alt tau^(- p)$ from the perturbation. The product rule then gives (4.16) with a finite $L_q$.

Set $A_0 = H$ and successively define

$ A_(j + 1) = H - T \( A_j \) . $

For any fixed number of substitutions, all these tensors remain in $cal(U)_1$ and have bounded weighted norms when $eta$ is sufficiently small. The positive gap $r_1 - r_0$ and the estimate $T \( A_j \) = O_s \( eta \)$ give this domain condition using only finitely many input derivatives: for a fixed number of substitutions, work backward through their finite derivative losses to obtain the required $C^0$ bounds. Once all iterates lie in $cal(U)_1$, the finite formulas give bounds in each higher weighted norm by the chain rule, without a further domain restriction. Their successive differences gain one power of $eta$ by (4.16). More explicitly, for $j gt.eq 1$,

$ A_j + T \( A_j \) - H = T \( A_j \) - T \( A_(j - 1) \) = O_s \( eta^(j + 1) \) . $

After finitely many substitutions, choose the resulting $A$ so that

#[#set math.equation(numbering: n => "(4.17)")
 $ Q_0 \( A \) = delta^2 H + O_s \( delta^2 eta^q \) . $ <eq:adjusted-quadratic-mean>]

This is a finite algebraic procedure on smooth tensors, not a contraction argument in a function space with derivative loss.

=== 4.5 Cancellation and the cubic remainder <cancellation-and-the-cubic-remainder>

Use the amplitude $A$ just obtained. On each nonzero quadratic phase, apply (4.12)–(4.12) with target the negative corresponding coefficient of $Q - Q_0$ and with $v_0 = 0$. Taking real parts gives $U_2$ such that

#[#set math.equation(numbering: n => "(4.18)")
 $ U_2 = O_tau \( delta^2 \) \, #h(2em) cal(P)' \( G \) U_2 + \( Q - Q_0 \) = O_tau \( delta^2 eta^q \) . $ <eq:quadratic-cancellation>]

The supports are intersections of the original supports, or original supports for doubled phases. Since $delta \/ tau$ is small,

$ U = U_1 + U_2 = O_tau \( delta tau \) \, #h(2em) d U_1 = O_tau \( delta \) \, #h(2em) d U_2 = O_tau \( delta^2 \/ tau \) . $

The metric quadratic terms involving $U_2$ are bounded by

$ C_m (delta^3 / tau + delta^4 / tau^2) lt.eq C_m delta^3 / tau . $

The corresponding terms from $cal(R)''$ are, by (4.11) at scale $tau$, bounded by

$ C_m epsilon.alt tau^(- p) \( delta^3 tau + delta^4 \) lt.eq C_m delta^3 / tau . $

Here $epsilon.alt tau^(- p) lt.eq eta lt.eq 1$ and $delta \/ tau lt.eq 1$ suffice.

For completeness, the third-order Taylor estimate is uniform along the whole segment $G + t U$, $0 lt.eq t lt.eq 1$. Indeed

$ \| j^2 U \|_(m \, tau) lt.eq C_m (delta / tau + delta^2 / tau^2) \, $

so smallness of $delta \/ tau$ keeps the low jets inside the permitted domain. Also $j^2 \( G + t U \) = O_tau \( 1 \)$, since $tau lt.eq s$. The arbitrary-variation version of (4.11) therefore bounds the integral Taylor remainder of $cal(R)$ by

$ C_m epsilon.alt tau^(- p) \( delta tau \)^3 lt.eq C_m delta^3 / tau . $

There is no third-order remainder for $gamma$ itself.

Finally combine (4.14), (4.17), and (4.18). Their errors are bounded by $C_m delta eta^q$, because $delta \, tau lt.eq 1$. The remaining terms have just been bounded by $C_m delta^3 \/ tau$. This proves (4.4) and Proposition 6. Every local formula is smooth and differential in cutoff amplitudes, so extension by zero gives the asserted global smooth displacement and support properties. None of the local normal choices requires orientability of $M$.

#prodef([Remark 4.2.])[
  (Dependence on geometric bounds).  For $cal(P) = gamma$, the constants and inverse smallness thresholds at any fixed accuracy and fixed output order can be bounded polynomially in finitely many input and phase-data bounds and reciprocal nondegeneracy margins. Indeed the coordinate construction uses metric inversion, contractions, division by $\| B_(y y) \|^2$, and normalized perpendicular products. Derivatives of these expressions have polynomial bounds in their entries, derivatives, and reciprocal denominators. The square roots in (4.2) have the same property on a positive input interval. The finite residual corrections and mean substitutions use only a fixed number of these operations. Summing over a varying finite phase collection adds a polynomial dependence on its cardinality. This observation will allow the geometric bounds to depend polynomially on the parameter of an approximate immersion family.
] <rem:small-polynomial-control>

== 5 An exact smooth correction <sec:exact-correction>

The small increment of Proposition 6 leaves a metric error. We now remove that error while keeping the immersion close in $C^2$. Smoothing is used only to construct each increment; the current map itself is never replaced by its smoothing. This preserves its higher derivatives until a sufficiently late stage can control them.

Smoothing in an iteration with derivative loss originates in Nash’s smooth embedding argument #cite(label("Nash1956")) Part A and was developed by Moser #cite(label("Moser1966")) Chapter I, §§1 and 5; Hamilton gives a systematic inverse-function formulation #cite(label("Hamilton1982")) Part III. Here we establish the correction estimates and the passage through the derivative orders directly, without assuming a smooth family of inverses of the full linearized metric map.

#thm([Proposition 5.1.])[
  (Exact correction).  #emph[Let $M$ be a closed smooth surface, and let $h_(*)$ be a smooth Riemannian metric on $M$. Fix background norms. There are positive integers $R \, N$ with the following property. Suppose that $f_z : M arrow.r bb(R)^4$ are smooth immersions for sufficiently small $z > 0$, and that 
#[#set math.equation(numbering: n => "(5.1)")
 $ parallel f_z parallel_(C^m) & = O \( z^(- m) \) &  & \( 0 lt.eq m lt.eq R + 2 \) \,\
parallel gamma \( f_z \) - h_(*) parallel_(C^R) & = O \( z^N \) \,\
min_(p in M) max_(\| u \| = 1) \| B_(f_z) \( u \, u \) \| & gt.eq c > 0 . $ <eq:exact-input-jets>]

 Then, for all sufficiently small $z$, there is a smooth immersion $tilde(f)_z : M arrow.r bb(R)^4$ such that 
$ gamma \( tilde(f)_z \) = h_(*) \, #h(2em) parallel tilde(f)_z - f_z parallel_(C^2) = o \( 1 \) . $

 The integers $R \, N$ do not depend on the constants in (5.1)–(5.1). The threshold on $z$ may depend on them. No regularity of the family with respect to $z$ is required or asserted.]
] <prop:exact-correction>

The proof has two parts. First we obtain a recurrence valid in every fixed derivative order, from a bound in only one finite order. We then let that controlled order increase, waiting a finite number of steps whenever necessary. The distinction between these two orders is what gives a smooth limit from the finite assumptions above.

=== 5.1 Smoothing with a finite input bound <smoothing-with-a-finite-input-bound>

We use the weighted norms introduced in the preceding section. The following elementary smoothing facts also apply to tensor fields.

#thm([Lemma 5.2.])[
  #emph[For each positive integer $r$, there are linear smoothing operators $S_s$, $0 < s lt.eq s_0$, on smooth sections of any fixed smooth vector bundle over $M$, with the following properties. For fixed nonnegative integers $q \, m$, and $0 lt.eq j lt.eq r$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ parallel S_s u parallel_(C^(q + m)) & lt.eq C_(q \, m \, r) s^(- m) parallel u parallel_(C^q) \,\
parallel u - S_s u parallel_(C^(q + j)) & lt.eq C_(q \, j \, r) s^(r - j) parallel u parallel_(C^(q + r)) \,\
parallel S_s u parallel_(C^m) & lt.eq C_(m \, r) parallel u parallel_(C^m) . $ <eq:smooth-derivative>]

 The constants use only the fixed atlas, bundle, and displayed orders.]
] <lem:finite-order-smoothing>

#proof[
  Choose a compactly supported smooth kernel $K$ on $bb(R)^2$ with integral one. A finite linear combination of its distinct dilates can be chosen to have integral one and all moments of degrees $1 \, dots.h \, r$ equal to zero. Indeed, if the dilation factors are distinct positive numbers $b_0 \, dots.h \, b_r$, choose their coefficients $c_i$ by
  $ sum_(i = 0)^r c_i b_i^d = cases(delim: "{", 1 \, & d = 0 \,, 0 \, & 1 lt.eq d lt.eq r .) $
  The coefficient matrix is a Vandermonde matrix. Every moment of multi-degree $alpha$ scales by $b_i^(\| alpha \|)$, so these equations cancel all the required moments. The resulting kernel need not be positive.
  Take a finite coordinate and bundle atlas with a subordinate smooth partition of unity. Extend each localized component by zero in its coordinate chart, convolve at scale $s$, and multiply by a second cutoff equal to one near the original support. For sufficiently small fixed $s_0$, all these operations occur within the charts. Sum the resulting sections. At scale zero this sum is exactly $u$. Taylor’s formula and the moment conditions give (5.2). Moving derivatives between the localized component and the kernel gives (5.2); moving all derivatives onto the component gives (5.2). Derivatives of the fixed cutoffs and bundle frames introduce only lower derivatives with fixed coefficients. This proves all three bounds. ◻
]

We record how these facts will be used. Let $G : M arrow.r bb(R)^4$ be smooth, let $H$ be a smooth symmetric tensor, and define

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(S)_m \( t \; G \, H \) = sum_(j = 0)^m t^j #scale(x: 120%, y: 120%)[\(] parallel G parallel_(C^(j + 2)) + parallel H parallel_(C^j) #scale(x: 120%, y: 120%)[\)] . $ <eq:exact-weighted-input>]

Suppose $cal(S)_r \( t \; G \, H \) lt.eq B$, and let $0 < tau lt.eq s lt.eq t lt.eq 1$. Set $G_s = S_s G$ and $H_s = S_s H$ using Lemma 9. Then, for every fixed $m$,

#[#set math.equation(numbering: n => "(5.4)")
 $ \| j^2 G_s \|_(m \, s) + \| H_s \|_(m \, s) & lt.eq C_(m \, r) B \,\
\| j^2 \( G - G_s \) \|_(m \, tau) + \| H - H_s \|_(m \, tau) & lt.eq C_(m \, r) [B \( s \/ t \)^r + cal(S)_m \( t \; G \, H \) \( tau \/ t \)^r] . $ <eq:exact-smoothed-bounds>]

For the first inequality use (5.2) with $q = 2$ and $q = 0$, respectively. To prove the second, split the derivatives at $r$. A derivative of order $j lt.eq r$ of $j^2 G$ or $H$ contributes at most

$ C B t^(- r) s^(r - j) tau^j = C B \( s \/ t \)^r \( tau \/ s \)^j lt.eq C B \( s \/ t \)^r . $

For $j > r$, boundedness of smoothing in the original derivative norm gives a contribution at most

$ C_m \( tau \/ t \)^j cal(S)_m \( t \; G \, H \) lt.eq C_m \( tau \/ t \)^r cal(S)_m \( t \; G \, H \) . $

In particular, the constants in (5.4) do not use any derivative of the true input above order $r + 2$; the possibly large higher derivatives occur only linearly in (5.4).

=== 5.2 A recurrence at every derivative order <a-recurrence-at-every-derivative-order>

Fix a small $z$ for the moment. Lemma 4 provides phase data for $f_z$ with reference metric $h_(*)$. They remain admissible in the $C^2$ ball of radius

$ rho_z = z^4 $

about $f_z$. Their bounds in every fixed order are polynomial in $z^(- 1)$. Put $B = z^(- 4)$. The current integer $k gt.eq 10$ controls the amplitude and the number of derivatives to be retained. We use

#[#set math.equation(numbering: n => "(5.5)")
 $ beta = 6 / 5 \, #h(2em) lambda = 11 / 10 \, #h(2em) tau = t^beta \, #h(2em) s = t^lambda \, #h(2em) delta = t^k \, #h(2em) r \( k \) = q \( k \) = 40 \( k + 1 \) . $ <eq:exact-scales>]

Here $q \( k \)$ is the accuracy order in Proposition 6. The integer $r \( k \)$ is the order controlled at the current step; the estimates below will also hold at every fixed observation order $m > r \( k \)$, without assuming a bound there.

For a current map $G$, define the normalized defect

#[#set math.equation(numbering: n => "(5.6)")
 $ H = delta^(- 2) \( h_(*) - gamma \( G \) \) \, #h(2em) cal(S)_m = cal(S)_m \( t \; G \, H \) . $ <eq:exact-normalized-defect>]

The step will be applied under the finite-order hypotheses

#[#set math.equation(numbering: n => "(5.7)")
 $ parallel G - f_z parallel_(C^2) lt.eq rho_z \/ 2 \, #h(2em) parallel H - h_(*) parallel_(C^0) < epsilon_(*) \, #h(2em) cal(S)_(r \( k \)) lt.eq B \, $ <eq:exact-step-hypotheses>]

where $epsilon_(*) > 0$ is a fixed sufficiently small radius for the positive tensor decompositions.

#thm([Lemma 5.3.])[
  (One smoothing step).  #emph[Under (5.7), take either $delta' = tau^k$ or $delta' = tau^(k + 1)$. For sufficiently small $t$, there is a smooth increment $U$ such that, with 
$ G' = G + U \, #h(2em) H' = delta' ""^(- 2) \( h_(*) - gamma \( G' \) \) \, #h(2em) cal(S)'_m = cal(S)_m \( tau \; G' \, H' \) \, $

 for every fixed $m gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ \| U \|_(m \, tau) & lt.eq C_m \( z \, k \) delta tau \,\
cal(S)'_m & lt.eq parallel G parallel_(C^2) + parallel h_(*) parallel_(C^0) + C_m \( z \, k \) t^(1 \/ 5) \( 1 + cal(S)_m \) . $ <eq:exact-increment-bound>]

 The scale threshold and the constants are independent of derivatives of the true inputs $G \, H$ above the controlled orders $r \( k \) + 2 \, r \( k \)$. For fixed $k$, the inverse threshold is polynomially bounded in $z^(- 1)$; for fixed $k \, m$, the constants have the same property.]
] <lem:exact-step>

The same construction therefore has two different uses. At the controlled order $r \( k \)$, a small scale preserves its bound. At any higher fixed order, the current norm may be large, but it is multiplied by a coefficient that tends to zero. The latter fact will let us increase $k$ after a finite number of steps.

#proof[
  Smooth with moment order $r \( k \)$. By (5.4), $G_s$ belongs to the admissible $C^2$ ball for small $t$. The tensor
  $ H_s - \( delta' \/ delta \)^2 h_(*) $
  belongs to the required neighborhood of $h_(*)$: the smoothing tail tends to zero, and $delta' \/ delta arrow.r 0$. Apply Proposition 6 in its unperturbed case to this tensor at $G_s$, with amplitude $delta$ and accuracy $q \( k \)$. Write the resulting increment as $U$. The proposition gives (5.8) and
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| E \|_(m \, tau) lt.eq C_m \( z \, k \) [delta \( tau \/ s \)^(q \( k \)) + delta^3 \/ tau] \, $ <eq:exact-mode-error>]
  where
  $ E = gamma \( G_s + U \) - gamma \( G_s \) - delta^2 #scale(x: 120%, y: 120%)[\[] H_s - \( delta' \/ delta \)^2 h_(*) #scale(x: 120%, y: 120%)[\]] . $
  The constants have the stated independence from higher true-input norms because (5.4) bounds every required weighted derivative of $G_s \, H_s$. For fixed orders they are bounded by fixed powers of $z^(- 1)$, by the polynomial phase bounds and the polynomial dependence in Remark 7.
  The increment was constructed using $G_s \, H_s$, but we add it to the unsmoothed map $G$. To compare the two metric increments, define the symmetric tensor
  $ cal(C) \( V \, W \)_(i j) = chevron.l partial_i V \, partial_j W chevron.r + chevron.l partial_j V \, partial_i W chevron.r . $
  Since the induced metric is quadratic in the first derivatives,
  #[#set math.equation(numbering: n => "(5.10)")
   $ delta' ""^2 \( H' - h_(*) \) = delta^2 \( H - H_s \) - E - cal(C) \( G - G_s \, U \) . $ <eq:exact-error-identity>]
  In particular, there is no square of the smoothing tail. From (5.8), $\| d U \|_(m \, tau) lt.eq C_m \( z \, k \) delta$; (5.4) bounds the other factor in the last term. Hence the high derivatives of the true input enter the new defect only linearly.
  For completeness, the powers needed to divide (5.10) by $delta' ""^2$ are displayed below. The smaller choice $delta' = tau^(k + 1)$ is the more demanding one. Using (5.5), the respective exponents of $t$ are
  #[#set math.equation(numbering: n => "(5.11)")
   $ upright("term") & upright("exponent after division by ") delta' ""^2\
delta \( tau \/ s \)^(q \( k \)) & \( 13 k + 8 \) \/ 5\
delta^3 \/ tau & \( 3 k - 18 \) \/ 5\
delta^2 B \( s \/ t \)^(r \( k \)) & \( 18 k + 8 \) \/ 5\
delta^2 cal(S)_m \( tau \/ t \)^(r \( k \)) & \( 38 k + 28 \) \/ 5\
delta B \( s \/ t \)^(r \( k \)) & \( 13 k + 8 \) \/ 5\
delta cal(S)_m \( tau \/ t \)^(r \( k \)) & \( 33 k + 28 \) \/ 5 . $ <eq:exact-exponent-table>]
  The factors $B$ are included in the constants for fixed $z$. Every exponent is positive for $k gt.eq 10$. We obtain, in particular,
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| H' - h_(*) \|_(m \, tau) lt.eq C_m \( z \, k \) t^(1 \/ 5) \( 1 + cal(S)_m \) #h(2em) \( m gt.eq 0 \) . $ <eq:exact-defect-recurrence>]
  This weaker common exponent will also control the map derivatives. Indeed, inherited derivatives of $G$ of positive weighted order gain at least $tau \/ t = t^(1 \/ 5)$, while
  $ \| j^2 U \|_(m \, tau) lt.eq C_m \( z \, k \) delta \/ tau = C_m \( z \, k \) t^(k - 6 \/ 5) . $
  The fixed tensor satisfies $\| h_(*) \|_(m \, tau) lt.eq parallel h_(*) parallel_(C^0) + C_m tau$. Together these estimates give (5.8). Its constants use only the smoothed-input bounds, while all higher true-input derivatives have remained in the displayed linear term $cal(S)_m$. The polynomial bounds already noted for the phase data and finite mode formulas, with the strict positive powers of $t$ in (5.11), give the stated polynomial thresholds. ◻
]

It remains to initialize this step from the finite assumptions of Proposition 8, keep the maps in the allowed $C^2$ ball, and schedule increases of $k$.

=== 5.3 Initialization and passage through the derivative orders <initialization-and-passage-through-the-derivative-orders>

Because $parallel f_z parallel_(C^2) = O \( z^(- 2) \)$, for small $z$ the distance condition in (5.7) implies

#[#set math.equation(numbering: n => "(5.13)")
 $ parallel G parallel_(C^2) + parallel h_(*) parallel_(C^0) < B \/ 4 . $ <eq:exact-baseline>]

For each fixed $z \, k$, choose a positive scale threshold that makes Lemma 10 applicable, preserves the defect neighborhood, and, by (5.8) with $m = r \( k \)$, preserves $cal(S)_(r \( k \)) lt.eq B$. Impose also

#[#set math.equation(numbering: n => "(5.14)")
 $ parallel U parallel_(C^(floor.l k \/ 2 floor.r)) lt.eq rho_z t . $ <eq:exact-summable-increment>]

This last threshold is available because (5.8) gives the upper bound

$ C \( z \, k \) t^(k + \( 6 \/ 5 \) \( 1 - floor.l k \/ 2 floor.r \)) \, $

and its exponent is greater than one for every $k gt.eq 10$. The thresholds can cover both choices of $delta'$ at once.

For the initial block $k = 10$, only finitely many orders and inequalities have been used. Their constants are polynomial in $z^(- 1)$, and every smallness condition has a strict positive power of $t$. Therefore there is a fixed $mu > 1$ such that all these conditions hold for $t lt.eq z^mu$ and sufficiently small $z$. Enlarge $mu$ if necessary, and set

$ R = r \( 10 \) = 440 \, #h(2em) N > 20 mu + 1 \, $

with $N$ an integer. These choices use polynomial exponents, not the implicit constants in the assumptions of the proposition.

Start at $t = z^mu$, $k = 10$, $delta = t^10$, and

$ G = sqrt(1 - delta^2) thin f_z . $

Its normalized defect has the exact form

$ H = h_(*) + \( 1 - delta^(- 2) \) \( gamma \( f_z \) - h_(*) \) . $

It therefore tends to $h_(*)$ in $C^R$. The weighted derivatives of $G$ through the required order are bounded by

$ C z^(- 2) sum_(j = 0)^R z^(\( mu - 1 \) j) \, $

so $cal(S)_R < B \/ 2$ for small $z$. The initial displacement is $O \( z^(20 mu - 2) \)$, which is at most $rho_z \/ 4$ for sufficiently small $z$, since $mu > 1$ and $20 mu - 2 > 4$. This verifies all the initial conditions.

At every subsequent step replace $t$ by $t^(6 \/ 5)$. Thus, if $t_n$ is the scale at step $n$,

$ t_n = t_0^(\( 6 \/ 5 \)^n) \, #h(2em) sum_(n = 0)^oo t_n < 1 \/ 4 $

for small enough $t_0$. Equations (5.14) and the initial displacement keep all maps within $rho_z \/ 2$ of $f_z$ in $C^2$. Hence the phase data and (5.13) remain valid.

We explain why no derivative order prevents the construction from advancing. Suppose that $k$ is held fixed and let $m$ be any fixed integer. Apply Lemma 10 repeatedly with $delta' = tau^k$. Its all-order recurrence says that the numbers $x_n = cal(S)_m \( t_n \; G_n \, H_n \)$ satisfy

$ x_(n + 1) lt.eq B \/ 4 + c_n \( 1 + x_n \) \, #h(2em) c_n = C_m \( z \, k \) t_n^(1 \/ 5) arrow.r 0 . $

Every $x_n$ is finite because all finite-stage maps are smooth. Once $c_n lt.eq 1 \/ 4$, this recurrence first bounds the sequence; subsequently $c_n arrow.r 0$ gives $limsup x_n lt.eq B \/ 4$. In particular, after finitely many further steps $x_n lt.eq B$.

Apply this observation with $m = r \( k + 1 \)$. Wait in the block with integer $k$ until that higher bound holds and the scale is below the threshold for the block with integer $k + 1$. Wait also until

$ C_(r \( k + 1 \)) \( z \, k \) t^(1 \/ 5) \( 1 + B \) lt.eq B \/ 2 \, $

where the constant is the one for the current block in (5.8). All three conditions hold after finitely many steps. Now choose $delta' = tau^(k + 1)$. That recurrence, already proved for this smaller target amplitude, bounds the new higher norm by $B \/ 4 + B \/ 2 < B$. The new scale $tau < t$ also satisfies the next block’s threshold. Thus each block has finite length and $k$ tends to infinity.

For every fixed $m$, all sufficiently late blocks satisfy $floor.l k \/ 2 floor.r gt.eq m$. Equation (5.14) then makes the tail of the increments absolutely summable in $C^m$. The maps converge in every $C^m$ to a smooth map $tilde(f)_z$. Their defects tend to zero in $C^0$, since $delta = t^k arrow.r 0$ and $H$ stays in a fixed $C^0$ neighborhood of $h_(*)$. Continuity of the induced metric in $C^1$ yields $gamma \( tilde(f)_z \) = h_(*)$. Finally,

$ parallel tilde(f)_z - f_z parallel_(C^2) lt.eq rho_z \/ 4 + rho_z sum_(n = 0)^oo t_n lt.eq rho_z \/ 2 arrow.r 0 . $

This proves Proposition 8.

#prodef([Remark 5.4.])[
  The finite assumptions control the first block uniformly by powers of $z$. Derivatives above order $R + 2$ may be arbitrarily large; at a fixed $z$ they affect only the finite waiting times in later blocks. The construction gives $C^2$ proximity on the whole surface. It does not assert that the exact correction vanishes outside a prescribed support.
]

== 6 A velocity circle with controlled turns <sec:velocity-loop>

We now construct the leading oscillation for Proposition 5. Throughout this section its data $F \, D \, a \, x \, y \, n$ and the later curves are fixed. The basic choice is to oscillate in the plane perpendicular to both $G_y$ and $G_(y y)$, for a slow map $G$ near $F$. Orthogonality to the second derivative will remove the first error in the $y y$ metric coefficient. A separate choice at the two turning points of the velocity path will preserve the later boundary conditions. For a $2 pi$-periodic function $b$ we write $"avg" b = \( 2 pi \)^(- 1) integral_0^(2 pi) b \( theta \) thin d theta$. For a nonzero vector $b$, write $hat(b) = b \/ \| b \|$.

The use of a periodic velocity to add a rank-one metric tensor belongs to the oscillatory constructions of Nash and Kuiper #cite(label("Nash1954")) #cite(label("Kuiper1955")); see also #cite(label("Choquet1958")) §4 and #cite(label("Gromov2015")) §§3.2–3.3. The second-derivative constraint on the velocity plane and the behavior prescribed at its turns are part of the construction proved here.

=== 6.1 The plane and the leading metric <the-plane-and-the-leading-metric>

For a 2-jet near that of $F$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ Y = G_y \, #h(2em) C = G_(y y) \, #h(2em) P = "span" \( Y \, C \)^perp \, #h(2em) v = P G_x \, #h(2em) R_0 = \( \| v \|^2 + a^2 \)^(1 \/ 2) . $ <eq:velocity-plane>]

We use $P$ also for orthogonal projection to this plane. The following facts justify these definitions and the frame we will use.

#thm([Lemma 6.1.])[
  #emph[On a neighborhood of $overline(D)$ and a sufficiently small neighborhood of the 2-jet section of $F$, the vectors $Y \, C$ are independent, $P$ is a smooth 2-plane, and $R_0$ is bounded below by a positive constant. Projection to $P$ restricts to an isomorphism on the normal plane of $G$. There is a smooth orthonormal frame $\( e_1 \, e_2 \)$ of $P$, depending smoothly on these jets, such that $e_1 = v \/ \| v \|$ on a collar of $C_0$.]
] <lem:velocity-plane>

#proof[
  In the coordinates $\( x \, y \)$,
  $ "Hess"_(gamma \( G \)) x \( partial_y \, partial_y \) = - Gamma_(y y)^x \, #h(2em) C = Gamma_(y y)^x G_x + Gamma_(y y)^y G_y + B_G \( partial_y \, partial_y \) . $
  By (3.4), $Gamma_(y y)^x < 0$ at $F$ on $overline(D)$, and this inequality persists on the indicated neighborhoods. The tangential projections of $Y \, C$ are therefore independent. If a normal vector belongs to $"span" \( Y \, C \)$, its zero tangential projection forces both coefficients to vanish. Projection from the normal plane to $P$ is consequently an isomorphism. Projecting the displayed decomposition of $C$ gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ P B_G \( partial_y \, partial_y \) = - Gamma_(y y)^x v . $ <eq:projected-yy-form>]
  At $F$, $A_0 eq.not 0$ on $C_0$, so $v eq.not 0$ on a collar. Moreover $v$ and $P n$ are not opposite rays there, by (3.3), (6.2), and the injectivity of projection on the old normal plane.
  The vector $P n$ is nonzero over the whole disk at $F$, and remains so for nearby jets. On a smaller collar set $e_1 = hat(v)$, and in the interior set $e_1 = accent(P n, ̂)$. In the intervening collar, normalize a smooth convex interpolation of these two non-antipodal vectors. Orient $P$ using the ordered pair $\( Y \, C \)$ and the orientation of $bb(R)^4$, and complete $e_1$ to $e_2$ with that orientation. These choices are local to this coordinate disk.
  Finally $R_0 > 0$ because $a > 0$ in $D$ and $v eq.not 0$ near its boundary. Compactness gives a positive lower bound, which persists after shrinking the jet neighborhood and the exterior neighborhood. ◻
]

For an angular function $alpha$ to be chosen, set

#[#set math.equation(numbering: n => "(6.3)")
 $ p = cos alpha thin e_1 + sin alpha thin e_2 \, #h(2em) V = R_0 p \, #h(2em) w = V - v \, #h(2em) X = G_x + w . $ <eq:leading-velocity>]

Since $G_x - v in "span" \( Y \, C \)$ and $V \, v in P$,

#[#set math.equation(numbering: n => "(6.4)")
 $ \| X \|^2 = \| G_x \|^2 + a^2 \, #h(2em) X dot.op Y = G_x dot.op G_y . $ <eq:leading-metric>]

Thus the pair $\( X \, Y \)$ has exactly the required leading metric. What remains is to make the periodic mean of $w$ zero, while controlling the places where the velocity stops along its circle.

=== 6.2 A prescribed mean and smooth vanishing <a-prescribed-mean-and-smooth-vanishing>

Initially use an angular parameter $t in bb(R) \/ \( 2 pi bb(Z) \)$ and angles

#[#set math.equation(numbering: n => "(6.5)")
 $ alpha = h_(upright("turn")) + A cos t . $ <eq:unreparametrized-angle>]

Here $h_(upright("turn"))$ will be a smooth function supported in a fixed compact subset of $D$ and small in value. We first choose $A$, independently of that function.

On a sufficiently small collar, $e_1 = hat(v)$ and $a \/ \| v \|$ is small. There is a nonnegative smooth amplitude $A_(upright("sm"))$ satisfying

#[#set math.equation(numbering: n => "(6.6)")
 $ frac(1, 2 pi) integral_0^(2 pi) cos \( A_(upright("sm")) cos t \) thin d t = frac(\| v \|, R_0) . $ <eq:small-arc-mean>]

Indeed the left side is $1 - A_(upright("sm"))^2 \/ 4 + O \( A_(upright("sm"))^4 \)$. The implicit function theorem applied to the squared amplitude gives

#[#set math.equation(numbering: n => "(6.7)")
 $ A_(upright("sm")) = frac(a, \| v \|) thin c (frac(a^2, \| v \|^2)) \, #h(2em) c \( 0 \) = sqrt(2) \, $ <eq:smooth-small-amplitude>]

where $c$ is positive and smooth. Thus $A_(upright("sm"))$ is smooth and flat on $C_0$, and it is zero on the exterior. When $h_(upright("turn")) = 0$, the sine average vanishes as well, so the unweighted mean of $R_0 p$ is exactly $v$ on this collar.

Farther inward, while still in a region where $e_1 = hat(v)$ and the small formula is defined, interpolate $A$ from $A_(upright("sm"))$ to a fixed number larger than $pi$, keeping $A gt.eq A_(upright("sm"))$. Use that constant on the remaining interior. For $a > 0$ the point $v \/ R_0$ lies strictly inside the convex hull of the path $p$ when $h_(upright("turn")) = 0$. On the small arc this follows because its unweighted mean lies strictly between the endpoint chord and the point $\( 1 \, 0 \)$ in the $\( e_1 \, e_2 \)$ coordinates. Increasing $A$ retains this arc; when $A > pi$ the path covers the circle and $\| v \| \/ R_0 < 1$. On any fixed compact subset of the interior, this strict membership persists for sufficiently small $parallel h_(upright("turn")) parallel_(C^0)$, uniformly on a compact neighborhood of the permitted jet data.

We use the following elementary fact to adjust the mean.

#thm([Lemma 6.2.])[
  (Smooth densities for interior averages).  #emph[Let a smooth family of circle-valued paths $p_b \( t \) in bb(R)^2$ and targets $c_b in bb(R)^2$ be parametrized by a finite-dimensional parameter $b$. On a compact parameter set, suppose each $c_b$ lies in the interior of the convex hull of $p_b$. Then, on a neighborhood of that set, there are smoothly varying strictly positive densities $rho_b \( t \)$ such that 
$ "avg"_t rho_b = 1 \, #h(2em) "avg"_t \( rho_b p_b \) = c_b . $

 These densities may be patched with any already prescribed positive solutions on an overlapping parameter neighborhood.]
] <lem:loop-density>

#proof[
  At a fixed parameter choose finitely many path values whose convex hull contains the target in its interior. Choose strictly positive weights with this barycenter and total mass one. Replacing the point masses by sufficiently narrow smooth bumps, and adding a sufficiently small positive constant density, preserves the interior condition. The three linear constraints, for mass and the two coordinates, have rank three. A fixed right inverse of their coefficient matrix gives nearby positive weights solving the constraints smoothly as the parameter varies. A finite parameter cover and a smooth partition of unity patch these local solutions: the constraints are linear in the density and positivity is preserved by convex combinations. The same argument patches with an already prescribed solution. ◻
]

Apply the lemma in the frame $\( e_1 \, e_2 \)$, with $c = v \/ R_0$, and use $rho = 1$ on a smaller collar where (6.6) applies and $h_(upright("turn")) = 0$. Here the parameters are position and the $2$-jet of $G$. The frame identifies all the velocity planes with $bb(R)^2$, and the remaining parameter set is compact and lies in $a > 0$. The interior hypothesis therefore has the required uniform margin, and the lemma patches a smooth density with the prescribed collar solution. Put

$ theta = integral_0^t rho \( s \) thin d s $

and replace $t$ by the smooth inverse of this orientation-preserving circle diffeomorphism. We henceforth use $theta$ as periodic parameter. Its uniform mean satisfies

#[#set math.equation(numbering: n => "(6.8)")
 $ "avg"_theta V = v \, #h(2em) "avg"_theta w = 0 . $ <eq:velocity-mean>]

All data are smooth functions of position and the 2-jet of $G$. On the exterior $A = 0$, $h_(upright("turn")) = 0$, and $rho = 1$, so $V = v$. Equations (6.7) and (6.6) show that $w$ is smooth across $C_0$ and vanishes there with every spatial derivative.

In the interior $A > 0$. There are exactly two zeros of $alpha_theta$, corresponding to $t = 0 \, pi$. At these turns,

#[#set math.equation(numbering: n => "(6.9)")
 $ alpha = h_(upright("turn")) plus.minus A \, #h(2em) alpha_y = \( h_(upright("turn")) \)_y plus.minus A_y . $ <eq:turn-derivative>]

In this formula spatial differentiation holds the new parameter $theta$ fixed. The additional chain-rule term from the inverse reparametrization is zero because it is multiplied by $sin t$. Figure 1 separates the velocity circle from its angular parametrization. The two stationary angles persist under the positive reparametrization; their transverse derivatives are the quantities we will prescribe along the later curves.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-2.068, 0), (2.332, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  line((0, -1.98), (0, 2.024), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  circle((0, 0), radius: 1.628, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  circle((0.66, 0), radius: 0.07056, fill: black, stroke: none)
  content((0.7348, -0.07484), [#text(size: 9pt)[$v$]], anchor: "north-west", padding: 0.1176cm)
  line((0, 0), (0.814, 1.41), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.407, 0.7049), [#text(size: 9pt)[$R_0$]], anchor: "east", padding: 0.1176cm)
  line((0.66, 0), (0.814, 1.41), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  content((0.8428, 0.7049), [#text(size: 9pt)[$V-v$]], anchor: "west", padding: 0.1176cm)
  circle((0.814, 1.41), radius: 0.07056, fill: black, stroke: none)
  content((0.814, 1.41), [#text(size: 9pt)[$V$]], anchor: "south-west", padding: 0.1176cm)
  content((0, -2.508), [#text(size: 9pt)[Velocity circle]])
  line((3.52, -1.452), (3.52, 1.716), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((3.52, 1.716), [#text(size: 9pt)[$alpha$]], anchor: "south", padding: 0.1176cm)
  line((3.52, 0), (6.732, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((6.732, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((3.52, 1.056), (6.424, 1.056), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((3.52, -1.056), (6.424, -1.056), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((3.52, 1.056), [#text(size: 9pt)[$h_( upright("turn") )+A$]], anchor: "east", padding: 0.1176cm)
  content((3.52, 0), [#text(size: 9pt)[$h_( upright("turn") )$]], anchor: "east", padding: 0.1176cm)
  content((3.52, -1.056), [#text(size: 9pt)[$h_( upright("turn") )-A$]], anchor: "east", padding: 0.1176cm)
  line((3.52, 1.056), (3.556, 1.053), (3.593, 1.043), (3.629, 1.027), (3.665, 1.004), (3.702, 0.9756), (3.738, 0.9409), (3.774, 0.9004), (3.81, 0.8543), (3.847, 0.803), (3.883, 0.7467), (3.919, 0.6858), (3.956, 0.6207), (3.992, 0.5518), (4.028, 0.4794), (4.064, 0.4041), (4.101, 0.3263), (4.137, 0.2465), (4.173, 0.1652), (4.21, 0.08285), (4.246, 6.466e-17), (4.282, -0.08285), (4.319, -0.1652), (4.355, -0.2465), (4.391, -0.3263), (4.428, -0.4041), (4.464, -0.4794), (4.5, -0.5518), (4.536, -0.6207), (4.573, -0.6858), (4.609, -0.7467), (4.645, -0.803), (4.682, -0.8543), (4.718, -0.9004), (4.754, -0.9409), (4.79, -0.9756), (4.827, -1.004), (4.863, -1.027), (4.899, -1.043), (4.936, -1.053), (4.972, -1.056), (5.008, -1.053), (5.045, -1.043), (5.081, -1.027), (5.117, -1.004), (5.154, -0.9756), (5.19, -0.9409), (5.226, -0.9004), (5.262, -0.8543), (5.299, -0.803), (5.335, -0.7467), (5.371, -0.6858), (5.408, -0.6207), (5.444, -0.5518), (5.48, -0.4794), (5.516, -0.4041), (5.553, -0.3263), (5.589, -0.2465), (5.625, -0.1652), (5.662, -0.08285), (5.698, -1.94e-16), (5.734, 0.08285), (5.771, 0.1652), (5.807, 0.2465), (5.843, 0.3263), (5.88, 0.4041), (5.916, 0.4794), (5.952, 0.5518), (5.988, 0.6207), (6.025, 0.6858), (6.061, 0.7467), (6.097, 0.803), (6.134, 0.8543), (6.17, 0.9004), (6.206, 0.9409), (6.242, 0.9756), (6.279, 1.004), (6.315, 1.027), (6.351, 1.043), (6.388, 1.053), (6.424, 1.056), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  circle((3.52, 1.056), radius: 0.07056, fill: rgb("#000099"), stroke: none)
  circle((4.972, -1.056), radius: 0.07056, fill: rgb("#000099"), stroke: none)
  circle((6.424, 1.056), radius: 0.07056, fill: rgb("#000099"), stroke: none)
  content((3.52, 1.1), [#text(size: 9pt)[turn]], anchor: "south-west", padding: 0.1176cm)
  content((4.972, -1.144), [#text(size: 9pt)[turn]], anchor: "north", padding: 0.1176cm)
  content((3.52, 0), [#text(size: 9pt)[$0$]], anchor: "north-west", padding: 0.1176cm)
  line((4.972, 0.0528), (4.972, -0.0528), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.972, -0.0528), [#text(size: 9pt)[$pi$]], anchor: "north", padding: 0.1176cm)
  line((6.424, 0.0528), (6.424, -0.0528), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.424, -0.0528), [#text(size: 9pt)[$2 pi$]], anchor: "north", padding: 0.1176cm)
  content((4.972, -2.508), [#text(size: 9pt)[Angle before reparametrization]])
  circle((9.504, 0), radius: 1.716, fill: rgb("#f0f0f0"), stroke: none)
  circle((9.504, 0), radius: 1.373, fill: rgb("#ffffff"), stroke: none)
  circle((9.504, 0), radius: 1.716, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((9.504, 0), radius: 1.373, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  bezier((7.48, -1.012), (11.44, 0.836), (8.888, -0.616), (9.856, 0.704), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  bezier((7.92, 1.628), (11.48, -1.1), (8.712, 0.264), (10.3, -0.176), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  content((11.31, 0.836), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$C_i$]]], anchor: "south-west", padding: 0.1176cm)
  content((11.35, -1.038), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[$C_l$]]], anchor: "north-west", padding: 0.1176cm)
  content((10.49, 1.434), [#text(size: 9pt)[$C_0$]], anchor: "south", padding: 0.1176cm)
  content((8.272, -1.892), [#text(size: 9pt)[collar]])
  line((8.58, -1.795), (8.932, -1.514), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.3, 0.704), [#text(size: 9pt)[$D$]])
  content((9.504, -2.508), [#text(size: 9pt)[Support collar]])
})],
  caption: [Figure 1: Velocity circle, its angular parametrization, and the support collar. The circle in $P = "span" \( Y \, C \)^perp$ has radius $R_0 = \( \| v \|^2 + a^2 \)^(1 \/ 2)$; $V - v$ is the correction vector. The middle panel plots $alpha = h_(upright("turn")) + A cos t$ before the positive reparametrization that gives mean velocity $v$. It has two turns per period, at $t = 0 equiv 2 pi$ and $t = pi$. There $alpha_y = \( h_(upright("turn")) \)_y plus.minus A_y$, even after reparametrization, so a large transverse derivative can control both turns. The angle graph also applies when $A > pi$ and the velocity path wraps around the circle. As $a$ vanishes at $C_0$, the path contracts smoothly to $v$, while the circle retains radius $\| v \| > 0$. The exact immersions approach the old map in $C^2$ outside $D$ as the fast scale tends to zero. ],
) <fig:velocity-collar>

=== 6.3 A small function with a prescribed transverse derivative <a-small-function-with-a-prescribed-transverse-derivative>

We will need a large value of $\( h_(upright("turn")) \)_y$ along the later curves away from the boundary, while keeping $h_(upright("turn"))$ small in value. The finite-tangency hypothesis of Proposition 5 gives exactly this freedom.

#thm([Lemma 6.3.])[
  #emph[Let $K$ be a compact subset of a finite union of smooth embedded curves in the interior of a coordinate disk. Suppose the curves have only finitely many intersections and only finitely many tangencies to $partial_y$ near $K$, with no shared curve arcs. Given $B > 0$ and $epsilon.alt > 0$, there is $h in C_c^oo \( D \)$ such that 
$ parallel h parallel_(C^0) < epsilon.alt \, #h(2em) h_y = B quad upright("on ") K . $

 The support may be kept in any fixed precompact open neighborhood of $K$.]
] <lem:small-value-derivative>

#proof[
  Place the finitely many intersections and vertical tangencies in pairwise disjoint small disks centered at points $p$. Choose bumps $chi_p$ equal to one on smaller disks and supported in the larger ones. The function
  $ h^(upright("pre")) = sum_p chi_p B \( y - y \( p \) \) $
  has arbitrarily small sup norm when the disks are sufficiently small, and $\( h^(upright("pre")) \)_y = B$ on the smaller disks. Choose still smaller cores. Outside those cores, the relevant compact curve set is covered by finitely many patches containing just one curve. In such a patch choose a defining function $f_j$ with $\( f_j \)_y eq.not 0$; the latter condition expresses transversality to $partial_y$. Choose smooth patch cutoffs $chi_j$ whose sum is one on the part of $K$ where $\( h^(upright("pre")) \)_y eq.not B$. Add the functions
  $ h_j = chi_j f_j frac(B - \( h^(upright("pre")) \)_y, \( f_j \)_y) eta_j \( f_j \/ delta_j \) \, $
  where $eta_j$ is one near zero and has compact support. On the curve $f_j = 0$, differentiation gives exactly
  $ \( h_j \)_y = chi_j #scale(x: 120%, y: 120%)[\(] B - \( h^(upright("pre")) \)_y #scale(x: 120%, y: 120%)[\)] . $
  All derivatives of the cutoffs in this identity have a factor $f_j$ and therefore vanish there. Thus $h = h^(upright("pre")) + sum_j h_j$ has $h_y = B$ on $K$, including the transition annuli of the special-point bumps. Each quotient is bounded on its fixed patch, so taking the finitely many $delta_j$ sufficiently small makes the additional sup norms as small as desired. The supports stay within the prescribed neighborhood. ◻
]

=== 6.4 Uniform normal bounds and the choice at turns <uniform-normal-bounds-and-the-choice-at-turns>

For the rest of this section evaluate the slow data at $G = F$. Let $S_0$ be the length of the projection of $C$ to $"span" \( X \, Y \)^perp$, and let $n_0^(*)$ be its unit direction. This projection never vanishes: if $C$ belonged to $"span" \( X \, Y \)$, applying $P$ would force its $X$ coefficient to be zero since $P X = V eq.not 0$, contradicting independence of $C \, Y$. Compactness gives positive lower and upper bounds for $S_0$, uniformly over all angular values. A complementary unit normal is

$ m_0^(*) = - sin alpha thin e_1 + cos alpha thin e_2 . $

It is perpendicular to $X \, Y \, C$, and hence also to $n_0^(*)$. Set

#[#set math.equation(numbering: n => "(6.10)")
 $ D_0^(*) = chevron.l X_y \, n_0^(*) chevron.r \, #h(2em) N_0^(*) = chevron.l X_y \, m_0^(*) chevron.r . $ <eq:limiting-mixed-components>]

The derivative here holds the periodic parameter fixed. Directly,

$ X_y = \( F_x - v \)_y + \( R_0 \)_y p + R_0 #scale(x: 120%, y: 120%)[\(] cos alpha \( e_1 \)_y + sin alpha \( e_2 \)_y + alpha_y m_0^(*) #scale(x: 120%, y: 120%)[\)] . $

The term containing $alpha_y$ drops out of $D_0^(*)$, so

#[#set math.equation(numbering: n => "(6.11)")
 $ \| D_0^(*) \| lt.eq C_0 \, #h(2em) N_0^(*) = R_0 alpha_y + E_0 \, quad \| E_0 \| lt.eq C_0 \, $ <eq:derivative-independent-bounds>]

where $C_0$ is independent of $h_(upright("turn"))$, its derivatives, and the reparametrization. These estimates hold over all angular values. The same independence holds for the bounds on $S_0$ and $1 \/ S_0$.

Write

$ k_(+) = K_(gamma_(+)) det \( gamma_(+) \) $

with determinant in $\( x \, y \)$ coordinates, and write $Y_i = b_i partial_x + c_i partial_y$ on the disk. At a crossing $C_i ∩ C_0$, the loop is constant and $X = F_x$. Since $a$ is flat, the prescribed metric $gamma_(+)$ has the old curvature there. Consequently the strict condition $Q_(0 i) \( F \) > 0$ is exactly

#[#set math.equation(numbering: n => "(6.12)")
 $ \( D_0^(*) b_i + S_0 c_i \)^2 + k_(+) b_i^2 > 0 . $ <eq:collar-inequality>]

It remains valid on the later curves in a sufficiently thin collar for all path angles. Indeed $A_(upright("sm"))$ tends to zero at the boundary, and $D_0^(*)$ contains no angular derivative. Compactness confines the later curve portions of a thin collar to neighborhoods of their finitely many crossings with $C_0$. The collar can also avoid every later mutual crossing, because there are no triple intersections. The same inequality holds if the path angles are translated by any sufficiently small value of $h_(upright("turn"))$. Thus this collar estimate remains available even if the eventual interior support neighborhood of $h_(upright("turn"))$ overlaps its inner part.

Let $K$ be the compact union of the later curve portions in the disk outside this collar. By Lemma 14, we may prescribe $\( h_(upright("turn")) \)_y = B_(*)$ on $K$ with arbitrarily small values of $h_(upright("turn"))$. The support can lie in a fixed compact neighborhood of $K$ inside $D$, while a smaller boundary collar remains unchanged. On any overlap with the collar estimate, smallness in value preserves that estimate. For any fixed threshold $T$, choose

#[#set math.equation(numbering: n => "(6.13)")
 $ B_(*) > parallel A_y parallel_(C^0) + frac(T + C_0 + 1, min R_0) . $ <eq:turn-size-choice>]

Equations (6.9) and (6.11) then give $N_0^(*) > T + 1$ at both turns on $K$. After making the values of $h_(upright("turn"))$ small enough to retain convex-hull membership, choose the positive density as above. That reparametrization does not change the turn derivative identity.

We summarize the construction in the form needed by the next section.

#thm([Lemma 6.4.])[
  (Velocity loop).  #emph[Under the hypotheses of Proposition 5, fix any finite threshold $T$. There is a neighborhood of the 2-jet section of $F$ over $overline(D)$ and a small exterior neighborhood, on which one can choose smooth $2 pi$-periodic vectors $V \, w$ as in (6.1)–(6.3), with 
$ \| V \| = R_0 > 0 \, #h(2em) "avg" V = v \, #h(2em) "avg" w = 0 . $

 They depend smoothly on position and the 2-jet; $w$ extends smoothly by zero outside $D$. The leading derivatives $\( X \, Y \)$ have metric $gamma \( G \) + a^2 d x^2$. At $G = F$, the limiting normal data defined in (6.10) have uniform bounds (6.11), a positive lower bound for $S_0$, and the collar inequality (6.12). On the remaining compact portions of the later curves, the only zeros of $alpha_theta$ are the two turns, and there $\| N_0^(*) \| > T$. The bounds for $S_0 \, 1 \/ S_0 \, D_0^(*)$ and the error $E_0$ can be fixed before choosing $T$ and $B_(*)$.]
] <lem:velocity-loop>

All choices in this section are now fixed before the fast oscillation scale is sent to zero. In particular their higher derivatives may be large but are finite. The next section will use this fixed smooth loop to produce exact immersions. We will choose $T$ from explicit crossing bounds in Section 8; those bounds use only the quantities just shown to be independent of $T$.

== 7 Realizing the primitive metric addition <sec:primitive-realization>

The velocity loop gives the desired metric at leading order. We now remove its oscillating errors to arbitrarily high finite order, correct the remaining mean error by small increments, and apply Proposition 8. The resulting exact immersions retain the first and second derivatives needed to control the later boundary curves.

#thm([Proposition 7.1.])[
  (Realization of a velocity loop).  #emph[Let $M$ be a closed smooth surface and let $F : M arrow.r bb(R)^4$ be a smooth immersion whose second fundamental form is nonzero at every point. Let $D$ be a disk with coordinates $x \, y$ on a neighborhood of its closure, and let $a$ be a smooth nonnegative function, positive on $D$ and zero on its exterior. Suppose the following data are defined smoothly on a neighborhood of the $2$-jets of $F$ over $overline(D)$ and a collar. For a map $G$ with jets in that neighborhood, set 
$ Y = G_y \, #h(2em) C = G_(y y) \, #h(2em) P = "span" \( Y \, C \)^perp \, #h(2em) v = P G_x \, #h(2em) R_0 = \( \| v \|^2 + a^2 \)^(1 \/ 2) . $

 Assume that $Y \, C$ are independent and $R_0 > 0$. Suppose there is a smooth $2 pi$-periodic vector $V = V \( G \; theta \)$, depending only on position and the $2$-jet of $G$, such that 
$ V in P \, #h(2em) \| V \| = R_0 \, #h(2em) "avg"_theta V = v . $

 Assume also that $V - v$ extends smoothly by zero across the boundary of $D$. These hypotheses hold for the loop of Lemma 15.]
  #emph[Put $h_(*) = gamma \( F \) + a^2 d x^2$, extending the added tensor by zero. For all sufficiently small $z > 0$ there is a smooth immersion $tilde(f)_z : M arrow.r bb(R)^4$ with $gamma \( tilde(f)_z \) = h_(*)$. To state its derivatives, evaluate the preceding quantities at $G = F$ and write $X = F_x - v + V$. Uniformly on $overline(D)$, with periodic arguments evaluated at $theta = x \/ z$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ \( tilde(f)_z \)_x & = X + o \( 1 \) \, & \( tilde(f)_z \)_y & = Y + o \( 1 \) \,\
\( tilde(f)_z \)_(y y) & = C + o \( 1 \) \, & \( tilde(f)_z \)_(x y) & = X_y + o \( 1 \) \,\
z \( tilde(f)_z \)_(x x) & = V_theta + o \( 1 \) . $ <eq:realization-asymptotics>]

 Here $X_y$ means differentiation with $theta$ held fixed. On the exterior of $D$, $tilde(f)_z$ converges to $F$ in $C^2$. There is a constant $c > 0$, independent of sufficiently small $z$, such that 
$ min_(p in M) max_(\| u \| = 1) \| B_(tilde(f)_z) \( u \, u \) \| gt.eq c \, $

 where the unit vectors use the fixed background tangent norm.]
] <prop:primitive-realization>

All compact neighborhoods of jets used below are chosen inside the open sets in this statement. Thus the stated nondegeneracies have positive uniform margins. Derivatives of periodic coefficients in $x \, y$ will always hold $theta$ fixed. We write $b_z = o_s \( c_z \)$ when $\| b_z \|_(k \, s) \/ c_z arrow.r 0$ for every fixed weighted differentiation order $k$.

=== 7.1 Removing the oscillating coefficients <removing-the-oscillating-coefficients>

Finite-order asymptotic isometric constructions also occur in Poznyak’s planar immersion problem in $bb(R)^3$ #cite(label("Poznyak1973")) §2.3, Theorem 5. For the present velocity loop, we give the periodic correctors and their support properties by an explicit recursion.

For a periodic scalar or vector $b$, define

$ "avg" b = frac(1, 2 pi) integral_0^(2 pi) b \( theta \) thin d theta \, #h(2em) Pi b = b - "avg" b . $

For $"avg" b = 0$, let $cal(I) b$ be its unique periodic primitive with mean zero. These operations commute with differentiation in the slow variables $x \, y$.

#thm([Lemma 7.2.])[
  (Finite periodic expansion).  #emph[Under the hypotheses of Proposition 16, for each integer $L gt.eq 2$ there are periodic differential operators $U_1 \, dots.h \, U_L$ with values in $bb(R)^4$, and symmetric tensor differential operators $E_1 \, dots.h \, E_(L - 1)$, for which 
#[#set math.equation(numbering: n => "(7.2)")
 $ f_z \[ G \] = G + sum_(j = 1)^L z^j U_j \( G \; x \/ z \) $ <eq:finite-ansatz>]

 has the exact expansion 
#[#set math.equation(numbering: n => "(7.3)")
 $ gamma \( f_z \[ G \] \) = a^2 d x^2 + cal(P)_z \( G \) + sum_(r = L)^(2 L) z^r cal(R)_r \( G \; x \/ z \) \, #h(2em) cal(P)_z \( G \) = gamma \( G \) + sum_(r = 1)^(L - 1) z^r E_r \( G \) . $ <eq:finite-metric-expansion>]

 Each $U_j$ has mean zero. The operators $U_j \, E_r \, cal(R)_r$ are smooth, supported on $overline(D)$, and polynomial in jets above order two, with smooth coefficients in the $2$-jet and position, and, where appropriate, $theta$. One may take the differential orders of $U_j$ and $E_r$ to be at most $2 j$ and $2 r + 2$, respectively.]
] <lem:finite-periodic-expansion>

#proof[
  Put $w = V - v$ and $X = G_x + w$, and take $U_1 = cal(I) w$. Orthogonal decomposition into $P$ and $P^perp$ gives
  $ \| X \|^2 = \| G_x - v \|^2 + R_0^2 = \| G_x \|^2 + a^2 \, #h(2em) X dot.op Y = G_x dot.op G_y . $
  Thus $X \, Y$ induce exactly the leading metric $gamma \( G \) + a^2 d x^2$. Moreover $Y dot.op U_1 = C dot.op U_1 = 0$, so
  #[#set math.equation(numbering: n => "(7.4)")
   $ Y dot.op U_(1 \, y) = \( Y dot.op U_1 \)_y - C dot.op U_1 = 0 . $ <eq:first-yy-cancellation>]
  This cancels the $y y$ coefficient at order $z$ before any higher corrector is introduced.
  We construct $U_(r + 1)$ from $U_1 \, dots.h \, U_r$. In the formal first derivatives of (7.2), write
  $ f_x = X + sum_(i gt.eq 1) z^i sans(A)_i \, #h(2em) f_y = Y + sum_(i gt.eq 1) z^i sans(B)_i \, #h(2em) sans(A)_i = U_(i \, x) + U_(i + 1 \, theta) \, quad sans(B)_i = U_(i \, y) . $
  Absent terms are set to zero; in particular $sans(A)_L = U_(L \, x)$. At step $r$, all $sans(A)_i$ with $i < r$ and all $sans(B)_i$ with $i lt.eq r$ are already known. The new $U = U_(r + 1)$ occurs in the $x x \, x y$ coefficients at order $z^r$, and in the $y y$ coefficient at order $z^(r + 1)$. Removing their fluctuations requires
  #[#set math.equation(numbering: n => "(7.5)")
   $ Y dot.op U_theta = h \, #h(2em) Y dot.op U_y = j \, #h(2em) Pi \( X dot.op U_theta \) = e \, $ <eq:periodic-corrector-system>]
  where
  #[#set math.equation(numbering: n => "(7.6)")
   $ h & = - Pi (X dot.op sans(B)_r + Y dot.op U_(r \, x) + sum_(i = 1)^(r - 1) sans(A)_i dot.op sans(B)_(r - i)) \,\
e & = - Pi (X dot.op U_(r \, x) + 1 / 2 sum_(i = 1)^(r - 1) sans(A)_i dot.op sans(A)_(r - i)) \,\
j & = - 1 / 2 Pi sum_(i = 1)^r sans(B)_i dot.op sans(B)_(r + 1 - i) . $ <eq:periodic-rhs-h>]
  For example, at $r = 1$ these are
  $ h = - Pi \( X dot.op U_(1 \, y) + Y dot.op U_(1 \, x) \) \, #h(2em) e = - Pi \( X dot.op U_(1 \, x) \) \, #h(2em) j = - 1 / 2 Pi \| U_(1 \, y) \|^2 . $
  Thus the first correction removes the $x x \, x y$ fluctuations at order $z$ and the $y y$ fluctuation at order $z^2$. Every right side has mean zero. This is precisely the compatibility required by the first two equations of (7.5) when $"avg" U = 0$.
  Set $H = cal(I) h$. There is a unique $T in "span" \( Y \, C \)$ satisfying
  #[#set math.equation(numbering: n => "(7.7)")
   $ Y dot.op T = H \, #h(2em) C dot.op T = H_y - j . $ <eq:corrector-span-part>]
  It is obtained by inverting the Gram matrix of $Y \, C$, and has mean zero. Since $Y_y = C$, these equations imply
  $ Y dot.op T_theta = h \, #h(2em) Y dot.op T_y = j . $
  If $Z in P$, then $Y dot.op Z = C dot.op Z = 0$ and hence $Y dot.op Z_y = 0$. The remaining part of $U$ can therefore be written $Z = cal(I) W$, where $W in P$ has mean zero and must solve
  #[#set math.equation(numbering: n => "(7.8)")
   $ Pi \( V dot.op W \) = r_0 \, #h(2em) r_0 = e - Pi \( X dot.op T_theta \) . $ <eq:covariance-equation>]
  Here is an explicit solution which remains regular at $a = 0$. Regard the following matrices as operators on the Euclidean plane $P$:
  $ Sigma = "avg" #scale(x: 120%, y: 120%)[\(] \( V - v \) ⊗ \( V - v \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sans(M) = "Id"_P - Sigma / R_0^2 . $
  For a unit vector $q in P$,
  #[#set math.equation(numbering: n => "(7.9)")
   $ R_0^2 chevron.l sans(M) q \, q chevron.r = "avg" #scale(x: 120%, y: 120%)[\(] R_0^2 - \( q dot.op V \)^2 #scale(x: 120%, y: 120%)[\)] + \( q dot.op v \)^2 . $ <eq:covariance-positive>]
  Both terms are nonnegative. Equality would force $V$ to take values only in ${ R_0 q \, - R_0 q }$. Continuity on the period circle would make $V$ constant, contrary to the additional equality $q dot.op v = 0$. Consequently $sans(M)$ is positive definite. Its inverse is smooth and uniformly bounded on the compact family under consideration. At $a = 0$, the loop is constant, $V = v$, and $sans(M) = "Id"_P$.
  Define
  #[#set math.equation(numbering: n => "(7.10)")
   $ m & = sans(M)^(- 1) "avg" \( V r_0 \) \,\
h_1 & = r_0 + frac(\( V - v \) dot.op m, R_0^2) \,\
W & = frac(V h_1 - m, R_0^2) . $ <eq:covariance-solve>]
  Then $"avg" h_1 = 0$ and
  $ "avg" \( V h_1 \) = "avg" \( V r_0 \) + frac(Sigma m, R_0^2) = m . $
  Hence $"avg" W = 0$, and $\| V \|^2 = R_0^2$ gives
  $ Pi \( V dot.op W \) = h_1 - frac(\( V - v \) dot.op m, R_0^2) = r_0 . $
  Thus $U_(r + 1) = T + cal(I) W$ solves (7.5) with mean zero.
  This construction is triangular: it changes no previously fixed lower coefficient. Induction through $r = L - 1$, together with (7.4), makes every metric coefficient of orders $1 \, dots.h \, L - 1$ independent of $theta$. Define $E_r$ to be that coefficient. The remaining finite coefficients give $cal(R)_L \, dots.h \, cal(R)_(2 L)$ in (7.3).
  It remains to check the regularity properties needed for the next stage. The initial coefficient $U_1$ is a smooth function of the $2$-jet. Differentiation preserves the class of polynomials in higher jets with smooth low-jet coefficients, as do multiplication, averaging and $cal(I)$. The Gram and covariance inverses depend only on the $2$-jet. Equations (7.6)–(7.10) therefore preserve this class. If $U_i$ has order at most $2 i$ for $i lt.eq r$, the right side $h$ has order at most $2 r + 1$; the derivative $H_y$ raises this by at most one. All other terms have order at most $2 r + 2$. This proves the asserted order of $U_(r + 1)$, and the same coefficient formulas give order at most $2 r + 2$ for $E_r$.
  Finally, $w$ is smoothly zero on the exterior, so $U_1$ is as well. If the previous correctors vanish there, all right sides in (7.6)–(7.6) vanish there and the linear construction gives $U_(r + 1) = 0$. The formulas are smooth on the collar, including its boundary, so this is smooth extension by zero to every order. The same reasoning applies to $E_r$ and $cal(R)_r$. ◻
]

=== 7.2 Correcting the mean and selecting the scales <correcting-the-mean-and-selecting-the-scales>

The preceding lemma leaves two errors: a finite mean operator $cal(P)_z - gamma$, and a remainder beginning at $z^L$. We first record how the latter behaves when the slow map depends on $z$. Suppose

#[#set math.equation(numbering: n => "(7.11)")
 $ G arrow.r F upright(" in ") C^3 \, #h(2em) j^2 G = O_s \( 1 \) \, #h(2em) s = z^sigma \, #h(2em) 0 < sigma < 1 . $ <eq:slow-map-bounds>]

A jet of order $k > 2$ is $O_s \( s^(2 - k) \)$. Since the expansion has finitely many coefficients, Lemma 17 supplies an integer $p_1 gt.eq 0$ such that they and their required periodic derivatives are all $O_s \( s^(- p_1) \)$. This exponent is independent of the weighted differentiation order; the constants may depend on that order. Indeed each higher-jet monomial loses the sum of the quantities $k - 2$ for its factors, while weighted differentiation of its coefficients loses no additional power of $s$.

Substitution of $theta = x \/ z$ changes these estimates to $O_z \( s^(- p_1) \)$: a derivative in $theta$ costs $z^(- 1)$, and a slow derivative costs $s^(- 1) lt.eq z^(- 1)$. In particular,

#[#set math.equation(numbering: n => "(7.12)")
 $ gamma \( f_z \[ G \] \) - a^2 d x^2 - cal(P)_z \( G \) = O_z \( z^L s^(- p_1) \) . $ <eq:fast-remainder-bound>]

For later use, differentiating the finite ansatz gives

$ f_x & = X + sum_(j = 1)^L z^j U_(j \, x) + sum_(j = 2)^L z^(j - 1) U_(j \, theta) \,\
f_y & = Y + sum_(j = 1)^L z^j U_(j \, y) \, & f_(y y) & = C + sum_(j = 1)^L z^j U_(j \, y y) \,\
f_(x y) & = X_y + sum_(j = 1)^L z^j U_(j \, x y) + sum_(j = 2)^L z^(j - 1) U_(j \, theta y) \,\
z f_(x x) & = V_theta + z G_(x x) + sum_(j = 1)^L z^(j + 1) U_(j \, x x) + 2 sum_(j = 1)^L z^j U_(j \, x theta) + sum_(j = 2)^L z^(j - 1) U_(j \, theta theta) . $

All coefficients on these right sides are evaluated at $G$ and $theta = x \/ z$. Each error contains a positive power of $z$ and at most two further slow derivatives. Thus

#[#set math.equation(numbering: n => "(7.13)")
 $ sigma \( p_1 + 2 \) < 1 $ <eq:fast-asymptotic-scale>]

makes these errors uniformly small. The leading terms converge uniformly to their values at $F$, including $X_y$, because of the $C^3$ convergence in (7.11). The same estimates show $parallel f_z \[ G \] parallel_(C^k) = O \( z^(- k) \)$ for each fixed $k$.

We now construct a slow map satisfying (7.11) for which the mean error is small enough for exact correction.

#proof[
  Choose the integers $R \, N$ in Proposition 8 for the fixed positive metric $h_(*)$. Fix an integer
  $ L > N + R + 1 $
  and construct the operators in Lemma 17. Obtain $p_1$ as above and let $p$ be the exponent in Proposition 6 for $cal(P)_z$, with its perturbation parameter equal to $z$. These exponents may depend on $L$. The exponent $p$ is independent of the accuracy parameter in that proposition.
  Define
  $ d_1 = 1 / 4 \, #h(2em) d_(l + 1) = 6 / 5 d_l \, $
  and choose a finite $m gt.eq 2$ with $2 d_m > N + R + 1$. Next choose $sigma > 0$ so small that
  #[#set math.equation(numbering: n => "(7.14)")
   $ sigma < 1 \, #h(2em) sigma \( p_1 + 2 \) < 1 \, #h(2em) sigma p < 1 / 2 \, #h(2em) sigma < 1 / 4 d_1 \, #h(2em) L - R - sigma p_1 > N . $ <eq:slow-scale-choice>]
  Set
  $ sigma_l = frac(l sigma, m - 1) quad \( 0 lt.eq l lt.eq m - 1 \) \, #h(2em) s_l = z^(sigma_(l - 1)) \, #h(2em) delta_l = z^(d_l) quad \( 1 lt.eq l lt.eq m \) . $
  Thus $s_1 = 1$ and $s_m = z^sigma$. Fix phase data for $F$ from Lemma 3, with reference tensor $h_0 = gamma \( F \)$.
  Start with
  $ G_1 = \( 1 - delta_1^2 \)^(1 \/ 2) F \, #h(2em) H_l = delta_l^(- 2) #scale(x: 120%, y: 120%)[\(] gamma \( F \) - cal(P)_z \( G_l \) #scale(x: 120%, y: 120%)[\)] . $
  The family $G_1$ is uniformly smooth and $cal(P)_z - gamma$ begins with $z$, whereas $delta_1^2 = z^(1 \/ 2)$. Hence $H_1 arrow.r h_0$ in every smooth norm. We inductively construct $G_l$ so that
  #[#set math.equation(numbering: n => "(7.15)")
   $ j^2 G_l \, H_l = O_(s_l) \( 1 \) \, #h(2em) G_l arrow.r F upright(" in ") C^3 \, #h(2em) H_l arrow.r h_0 upright(" in ") C^0 . $ <eq:slow-induction>]
  For $l < m$, apply Proposition 6 at $G_l$ with amplitude $delta_l$, scales $s_l$ and $tau = s_(l + 1)$, and input tensor
  $ H_l - \( delta_(l + 1) \/ delta_l \)^2 h_0 . $
  This tensor lies in the allowed neighborhood for small $z$. If
  $ kappa = min {frac(sigma, m - 1) \, 1 / 2} > 0 \, $
  the smallness parameter of that proposition satisfies
  $ eta = s_(l + 1) / s_l + z s_(l + 1)^(- p) = O \( z^kappa \) . $
  Only now choose its finite accuracy $q_l$ so large that
  $ d_l + kappa q_l > 2 d_(l + 1) . $
  The other error exponent is positive as well:
  $ 3 d_l - sigma_l - 2 d_(l + 1) = 3 / 5 d_l - sigma_l > 0 . $
  Thus the increment $U$ supplied by that proposition gives
  $ cal(P)_z \( G_l + U \) = gamma \( F \) - delta_(l + 1)^2 h_0 + o_(s_(l + 1)) \( delta_(l + 1)^2 \) . $
  Set $G_(l + 1) = G_l + U$. Then $H_(l + 1) = h_0 + o_(s_(l + 1)) \( 1 \)$. Furthermore
  $ \| j^2 U \|_(k \, s_(l + 1)) lt.eq C_k z^(d_l - sigma_l) arrow.r 0 \, #h(2em) parallel U parallel_(C^3) lt.eq C z^(d_l - 2 sigma_l) arrow.r 0 . $
  Bounds on the old terms improve when the weighted scale decreases, so (7.15) is preserved. All choices are finite. The choice of $q_l$ affects only the eventual threshold on $z$; it does not change $p$ or the already fixed scales.
  Take $G = G_m$ and $s = s_m$. The construction gives
  $ cal(P)_z \( G \) - gamma \( F \) = O_s \( z^(2 d_m) \) . $
  With $f_z = f_z \[ G \]$, equation (7.12) now yields
  #[#set math.equation(numbering: n => "(7.16)")
   $ parallel gamma \( f_z \) - h_(*) parallel_(C^R) lt.eq C #scale(x: 120%, y: 120%)[\(] z^(2 d_m - sigma R) + z^(L - R - sigma p_1) #scale(x: 120%, y: 120%)[\)] = O \( z^N \) . $ <eq:realization-metric-error>]
  The first exponent exceeds $N$ because $2 d_m > N + R + 1$ and $sigma < 1$; the second was imposed in (7.14). We also have $parallel f_z parallel_(C^k) = O \( z^(- k) \)$ through $k = R + 2$, and the displayed derivative formulas prove (7.1) for $f_z$ before exact correction. On the exterior $f_z = G$, so $f_z arrow.r F$ in $C^3$ there. Moreover, (7.16) and positivity of $h_(*)$ guarantee that $f_z$ is immersive for small $z$.
  To check the remaining hypothesis of Proposition 8, project $C = F_(y y)$ to the orthogonal complement of $"span" \( X \, Y \)$. This projection never vanishes: if $C = b X + c Y$, projection to $P$ gives $0 = b V$, hence $b = 0$, contrary to the independence of $C \, Y$. Its length consequently has a positive minimum on the compact position–phase set. The convergence of $\( f_z \)_x \, \( f_z \)_y \, \( f_z \)_(y y)$ implies a uniform positive lower bound for $\| B_(f_z) \( partial_y \, partial_y \) \|$ on $overline(D)$. The fixed upper bound on the background length of $partial_y$ converts this to the unit-vector bound. On the exterior the same bound follows from $C^2$ convergence to $F$ and the nonvanishing of $B_F$.
  Proposition 8 therefore gives smooth $tilde(f)_z$ inducing $h_(*)$ with $parallel tilde(f)_z - f_z parallel_(C^2) = o \( 1 \)$. This preserves all the derivative asymptotics, including the scaled $x x$ derivative, and gives the stated exterior $C^2$ convergence. The same argument using the $y y$ component on the disk, and convergence to $F$ on the exterior, gives the positive second-form lower bound for $tilde(f)_z$. ◻
]

The primitive metric is now realized exactly. The next section uses the unscaled $y y$ and $x y$ limits together with the exact Gauss equation to determine the component of $B_(x x)$ along $B_(y y)$. The scaled $x x$ limit controls the complementary normal component. These are precisely the second-form data needed to preserve the normal and crossing conditions for the remaining disks.

== 8 Preserving the later boundary conditions <sec:geometry-preservation>

We complete Proposition 5. The analytic construction in Proposition 16 supplies exact immersions for $gamma_(+)$ with the leading derivatives of the chosen loop. We must show that their second forms preserve the later curve conditions and that their preferred normals extend globally. The crossing calculation below also specifies a turn threshold using only the bounds that were fixed before the loop’s large derivative.

=== 8.1 The exact second form <the-exact-second-form>

Choose the loop of Lemma 15, with the turn threshold to be specified below, and let $tilde(f)_z$ be the resulting exact immersions from Proposition 16. On the disk their $y y$ second form has the representation

$ B_(tilde(f)_z) \( partial_y \, partial_y \) = S n^(*) \, #h(2em) \| n^(*) \| = 1 \, #h(2em) S > 0 \, $

for all sufficiently small $z$. Indeed its limiting value is $S_0 n_0^(*)$ and $S_0$ has a positive minimum. Project $m_0^(*)$ to the line in the new normal plane perpendicular to $n^(*)$ and normalize; the resulting $m^(*)$ is well defined and close to $m_0^(*)$. Write

$ B_(tilde(f)_z) \( partial_x \, partial_y \) = D^(*) n^(*) + N^(*) m^(*) \, #h(2em) k = K_(gamma_(+)) det \( gamma_(+) \) . $

The determinant is in the $\( x \, y \)$ coordinates. The Gauss equation gives

#[#set math.equation(numbering: n => "(8.1)")
 $ B_(y y) = \( S \, 0 \) \, #h(2em) B_(x y) = \( D^(*) \, N^(*) \) \, #h(2em) B_(x x) = (frac(k + \( D^(*) \)^2 + \( N^(*) \)^2, S) \, thin L^(*)) $ <eq:exact-second-form>]

in the orthonormal frame $\( n^(*) \, m^(*) \)$. We have used $chevron.l B_(x x) \, B_(y y) chevron.r - \| B_(x y) \|^2 = k$. Thus the exact metric determines the first component of $B_(x x)$ from the unscaled $y y$ and $x y$ data. Only its second component, $L^(*)$, requires the scaled $x x$ asymptotic from the realization theorem. The derivative asymptotics of the exact realization imply, uniformly on $overline(D)$,

#[#set math.equation(numbering: n => "(8.2)")
 $ S = S_0 + o \( 1 \) \, #h(2em) n^(*) = n_0^(*) + o \( 1 \) \, #h(2em) D^(*) = D_0^(*) + o \( 1 \) \, #h(2em) N^(*) = N_0^(*) + o \( 1 \) \,\
z L^(*) = R_0 alpha_theta + o \( 1 \) . $ <eq:second-form-limits>]

The final identity follows because $V_theta = R_0 alpha_theta m_0^(*)$ is already normal to the limiting pair $\( X \, Y \)$.

For later use, write $Y_i = b_i partial_x + c_i partial_y$. Formula (8.1) gives the exact identities

#[#set math.equation(numbering: n => "(8.3)")
 $ S chevron.l B \( Y_i \, Y_i \) \, n^(*) chevron.r & = \( D^(*) b_i + S c_i \)^2 + \( k + \( N^(*) \)^2 \) b_i^2 \,\
chevron.l B \( Y_i \, Y_i \) \, m^(*) chevron.r & = L^(*) b_i^2 + 2 N^(*) b_i c_i . $ <eq:pure-direction-components>]

These two expressions separate the two mechanisms of the construction: a large angular velocity gives a large $L^(*)$, whereas at a turn a large transverse derivative gives a large $N^(*)$.

=== 8.2 Crossing thresholds without circular choices <crossing-thresholds-without-circular-choices>

At a mutual later crossing inside $D$, both $b_i \, b_l$ are nonzero. Put

$ u_i = partial_x + t_i partial_y \, #h(2em) u_l = partial_x + t_l partial_y \, #h(2em) t_i = c_i \/ b_i \, quad t_l = c_l \/ b_l . $

The finitely many slopes are bounded. From (8.1), the pure and mixed vectors are

#[#set math.equation(numbering: n => "(8.4)")
 $ P_i := B \( u_i \, u_i \) & = (frac(\( N^(*) \)^2 + k + \( D^(*) + S t_i \)^2, S) \, med L^(*) + 2 N^(*) t_i) \,\
P_l := B \( u_l \, u_l \) & = (frac(\( N^(*) \)^2 + k + \( D^(*) + S t_l \)^2, S) \, med L^(*) + 2 N^(*) t_l) \,\
Z_(i l) := B \( u_i \, u_l \) & = (frac(\( N^(*) \)^2 + k + \( D^(*) + S t_i \) \( D^(*) + S t_l \), S) \, med L^(*) + N^(*) \( t_i + t_l \)) . $ <eq:crossing-components>]

In particular

#[#set math.equation(numbering: n => "(8.5)")
 $ Z_(i l) - P_i = \( t_l - t_i \) \( D^(*) + S t_i \, N^(*) \) . $ <eq:mixed-pure-difference>]

Choose bounds $0 < s_(-) lt.eq S lt.eq s_(+)$, $\| D^(*) \| lt.eq d_(+)$, and $\| k \| lt.eq K_0$ on the entire closed disk and over all angular values, together with a fixed bound on the finitely many crossing slopes. They can be chosen before the turn derivative: the limiting bounds for $S_0 \, 1 \/ S_0 \, D_0^(*)$ are independent of that derivative, and after the loop is fixed, (8.2) transfers slightly enlarged bounds to the exact immersions for sufficiently small $z$. There are constants $C_1 \, C_2$ depending only on these bounds such that

#[#set math.equation(numbering: n => "(8.6)")
 $ chevron.l P_j \, n^(*) chevron.r & gt.eq \( N^(*) \)^2 \/ s_(+) - C_1 \,\
⟨Z_(i l) \, frac(P_j, \| P_j \|)⟩ & gt.eq \( N^(*) \)^2 \/ s_(+) - C_2 \( 1 + \| N^(*) \| \) \, #h(2em) j = i \, l \, $ <eq:uniform-crossing-bound>]

whenever the right side of the first line is positive. To see the second line, use $chevron.l Z_(i l) \, hat(P)_j chevron.r gt.eq \| P_j \| - \| Z_(i l) - P_j \|$ and (8.5). In particular these estimates do not depend on $L^(*)$.

Also

$ K_(gamma_(+)) \| u_i and u_l \|_(gamma_(+))^2 = k \( t_i - t_l \)^2 . $

We can therefore fix a finite threshold $T$ so large that $T^2 > K_0 + 1$ and, when $\| N^(*) \| > T$, both pure vectors have positive dot with $n^(*)$ and both mixed projections in (8.6) exceed

$ sqrt(max { 0 \, - k \( t_i - t_l \)^2 }) + 1 $

at every crossing. Use a margin, for example $T + 2$, as the turn threshold in Lemma 15, and then fix the loop. No constant used to select this threshold depends on the resulting large value of $\( h_(upright("turn")) \)_y$. The sufficiently small choice of $z$ may depend on this now fixed loop.

We next show positivity of both ordered crossing invariants for all small $z$. If a sequence of crossing phases tends to a turn, (8.2) gives $\| N^(*) \| > T$, so the preceding estimate applies. If its limiting phase is not a turn, then $\| L^(*) \| arrow.r oo$, while $N^(*)$ stays bounded for the fixed loop. All three vectors in (8.4) have the same leading second component $L^(*)$; hence

$ ⟨Z_(i l) \, hat(P)_i⟩ arrow.r + oo \, #h(2em) ⟨Z_(i l) \, hat(P)_l⟩ arrow.r + oo . $

These two cases and compactness of the phase circle give positivity at the finitely many crossings uniformly for small $z$. Returning to the original directions changes each ordered invariant by the positive factor $b_i^2 b_l^2$. Indeed pure second forms scale by squares, so their unit directions do not change even if either $b$ is negative. We have proved

#[#set math.equation(numbering: n => "(8.7)")
 $ Q_(i l) \( tilde(f)_z \) > 0 \, #h(2em) Q_(l i) \( tilde(f)_z \) > 0 quad upright("at all later mutual crossings in ") D . $ <eq:preserved-crossing-q>]

=== 8.3 Avoidance along the full curves <avoidance-along-the-full-curves>

We now prove that on every later curve inside the disk, $B \( Y_i \, Y_i \)$ is nonzero and its unit direction is not $- n^(*)$. Suppose otherwise along a sequence $z arrow.b 0$. At a point of failure the second component in (8.3) is zero and the first is nonpositive, so

#[#set math.equation(numbering: n => "(8.8)")
 $ \( D^(*) b_i + S c_i \)^2 + \( k + \( N^(*) \)^2 \) b_i^2 lt.eq 0 \, #h(2em) L^(*) b_i^2 + 2 N^(*) b_i c_i = 0 . $ <eq:opposite-ray-failure>]

Take a subsequence with limiting position and periodic phase. The limiting $b_i$ cannot be zero: the vector field $Y_i$ is nonzero, so then $c_i eq.not 0$ and the first inequality would give $S_0^2 c_i^2 lt.eq 0$. Multiplying the second equality by $z$ and using (8.2) now forces $alpha_theta = 0$ at the limiting phase.

In the boundary collar, (6.12) rules out the first inequality of (8.8), even without its nonnegative $\( N^(*) \)^2 b_i^2$ term. On the remaining compact curve portions, the limiting phase must be one of the two turns and $k + \( N_0^(*) \)^2 > 0$ by the threshold just chosen. This again contradicts the first inequality. Therefore, for all sufficiently small $z$,

#[#set math.equation(numbering: n => "(8.9)")
 $ B \( Y_i \, Y_i \) eq.not 0 \, #h(2em) frac(B \( Y_i \, Y_i \), \| B \( Y_i \, Y_i \) \|) eq.not - n^(*) quad upright("on ") C_i ∩ overline(D) . $ <eq:disk-ray-avoidance>]

This argument needs boundedness of $N^(*)$ only for the fixed loop while $z$ tends to zero. Such a bound may depend on the chosen turn size; it is distinct from the derivative-independent bounds used to choose that size.

=== 8.4 Adjusting the normal at crossings <adjusting-the-normal-at-crossings>

It remains to give both pure vectors positive dot product with a preferred normal at each crossing. If their dots with $n^(*)$ are already positive, no change is needed. At each crossing, choose small neighborhoods of the two turning phases on which $\| N_0^(*) \| > T + 1$. The uniform limits and (8.6) make both dot products positive on these neighborhoods for small $z$. Consequently any crossing requiring adjustment has phase in their compact complement, where $\| alpha_theta \|$ has a positive lower bound. There $\| L^(*) \| arrow.r oo$ uniformly, and the two pure unit vectors are arbitrarily close to the same sign of $m^(*)$. For small $z$, denote this sign by $m$ and use the path

#[#set math.equation(numbering: n => "(8.10)")
 $ n_t = frac(\( 1 - t \) n^(*) + t hat(P)_i, \| \( 1 - t \) n^(*) + t hat(P)_i \|) \, #h(2em) 0 lt.eq t lt.eq 1 . $ <eq:normal-crossing-path>]

This path is defined and avoids the opposite of either pure unit vector. Its numerator has nonnegative $m$ component, strictly positive for $t > 0$, whereas the opposite pure vectors have negative $m$ component. At $t = 0$, use $n^(*) perp m$. At the endpoint both required dot products are positive because $hat(P)_i$ and $hat(P)_l$ are close.

The vectors in this construction extend smoothly to a neighborhood of the crossing. Strictness, together with compactness of $\[ 0 \, 1 \]$, gives a neighborhood on which the whole path remains defined and avoids the opposite pure directions. Replacing $t$ by a smooth spatial cutoff, equal to one at the crossing, makes a smooth local normal adjustment. Since there are no triple intersections, its support can avoid every other curve. The finitely many crossing neighborhoods can be chosen pairwise disjoint and disjoint from the boundary collar. These changes preserve (8.9); they do not affect (8.7), whose quantities are independent of the preferred normal.

=== 8.5 Extension through the exterior collar <extension-through-the-exterior-collar>

We finish with a global preferred normal. The exact realization converges to $F$ in $C^2$ on the exterior of $D$. Thus the normalized projection of the old normal $n$ to the new normal bundle defines a smooth unit normal $n_(upright("out"))$ there for small $z$. On a thin exterior collar, the new $y y$ second form is nonzero and its unit direction $n^(*)$ is close to the old direction $hat(A)_0$. By (3.3), $hat(A)_0$ and $n$ are not antipodal on $C_0$. After narrowing the collar, the normalized convex interpolation between $n^(*)$ and $n_(upright("out"))$ is consequently defined. Use it to match the unchanged $n^(*)$ near the disk boundary to $n_(upright("out"))$ farther outside.

We check the later curves during this interpolation. At an old crossing $C_i ∩ C_0$, the Gauss interpretation (3.2) gives

#[#set math.equation(numbering: n => "(8.11)")
 $ chevron.l A_0 \( F \) \, A_i \( F \) chevron.r = \| B_F \( Y_0 \, Y_i \) \|^2 + K_gamma \| Y_0 and Y_i \|_gamma^2 gt.eq Q_(0 i) \( F \) > 0 . $ <eq:old-pure-crossing-dot>]

Thus both old endpoint normals have positive dot product with the later pure vector: one by this inequality, and the other by (3.3). Continuity and exterior $C^2$ convergence retain positivity near these crossings for the new immersion, and convex interpolation preserves it. A sufficiently thin collar meets later curves only in these crossing neighborhoods. It can avoid all later mutual crossings. Away from the disk and collar, every old strict condition persists by exterior $C^2$ convergence and compactness. The resulting normal $n_(+)$ is global and satisfies all of (3.3) for the later indices.

The second fundamental form is nonzero on the disk because $S > 0$, and it is nonzero on the exterior by $C^2$ convergence to $F$. Choose $z$ small enough for these properties, all the finite crossing conditions, and the prescribed exterior error $epsilon$. The exact metric is $gamma_(+)$ by Proposition 16. This completes the proof of Proposition 5.

All frame orientations in this argument were chosen inside a coordinate disk. The global object carried from one step to the next is only the unit section $n_(+)$ of the normal bundle. The construction therefore applies equally to orientable and nonorientable surfaces.

== 9 Global preparation and finite assembly <sec:global-construction>

We now arrange a finite sequence of primitive additions to which Proposition 5 applies. The main point is the order of the choices. The initial immersion will be modified at the crossings of the support boundaries, although those boundaries depend on the number of primitive additions. Uniform second-derivative bounds for the initial modification allow us to choose the number of additions first.

The assertion is immediate if $M$ is empty. The connected components of a smooth manifold are open. Compactness therefore implies that $M$ has only finitely many components. It suffices to carry out the construction on each component: the resulting maps together define one smooth isometric immersion on $M$. We may thus assume in this section that $M$ is connected.

=== 9.1 A spherical starting immersion <a-spherical-starting-immersion>

Every closed smooth surface admits an ordinary smooth immersion into $S^3$. Indeed, the two-dimensional case of Whitney’s immersion theorem gives a $C^1$ immersion into $bb(R)^3$ #cite(label("Whitney1944")) Theorem 8, p. 274. Approximation in $C^1$ by a smooth map preserves injectivity of the differential on a compact domain. Such an approximation can be obtained by mollifying in finitely many charts and combining the approximations with a smooth partition of unity. Finally, inverse stereographic projection is a diffeomorphism from $bb(R)^3$ onto a punctured $S^3$. Neither step requires an orientation of the surface.

For an immersion $I : M arrow.r S^3$, denote its second fundamental form in $S^3$ by $B_I^(S^3)$, regarded as an $bb(R)^4$-valued tensor. This notation avoids any choice of unit normal to the surface in $S^3$.

#thm([Lemma 9.1.])[
  (Finite-point spherical preparation).  #emph[Let $M$ be a closed smooth surface and let $I : M arrow.r S^3$ be a smooth immersion. There are constants $C \, c > 0$ and $epsilon_0 > 0$ with the following property. For every finite set $P subset M$ and every $0 < epsilon < epsilon_0$, there is a smooth immersion $I_P : M arrow.r S^3$ such that 
$ B_(I_P)^(S^3) \( p \) = 0 quad \( p in P \) \, #h(2em) parallel I_P - I parallel_(C^1) < epsilon \, #h(2em) parallel I_P parallel_(C^2) lt.eq C \, #h(2em) I_P^(*) delta_4 gt.eq c thin g_(upright("bg")) \, $

 where $g_(upright("bg"))$ is the fixed background metric. The constants are independent of the number and separation of the points of $P$.]
] <lem:spherical-preparation>

#proof[
  Choose a finite atlas with precompact smaller charts covering $M$. For each $p in P$, use one of these charts, translated so that $p$ has coordinates $u = 0$. Choose radii $r_p > 0$ so that the corresponding coordinate balls have pairwise disjoint closures and lie in the larger charts. Let $chi$ be a fixed smooth bump, equal to one near zero and supported in the unit ball. In the chart at $p$, put
  $ Q_p \( u \) = - 1 / 2 chi \( u \/ r_p \) sum_(i \, j = 1)^2 B_I^(S^3) \( partial_i \, partial_j \) \( p \) u_i u_j \, $
  and extend this function by zero. Set
  $ J = I + sum_(p in P) Q_p \, #h(2em) I_P = frac(J, \| J \|) . $
  For sufficiently small radii, $\| J \|$ stays uniformly away from zero.
  At $p$, the value and first derivative of $Q_p$ vanish and $partial_i partial_j Q_p = - B_I^(S^3) \( partial_i \, partial_j \) \( p \)$. The latter vector is tangent to $S^3$ at $I \( p \)$ and normal to $d I \( T_p M \)$. The derivative of $v mapsto v \/ \| v \|$ at $I \( p \)$ is projection to $T_(I \( p \)) S^3$. Comparing its second-derivative chain rule for $J$ and for $I$ therefore gives
  $ d I_P \( p \) = d I \( p \) \, #h(2em) partial_i partial_j I_P \( p \) = partial_i partial_j I \( p \) - B_I^(S^3) \( partial_i \, partial_j \) \( p \) . $
  Thus the spherical normal part of the second derivative vanishes at $p$.
  The $C^0 \, C^1 \, C^2$ norms of $Q_p$ are bounded respectively by $C_0 r_p^2 \, C_0 r_p \, C_0$, with $C_0$ uniform in $p$. Since the supports are disjoint, the corresponding norms of the sum are bounded by the maximum of these bounds, up to the fixed atlas constants. Normalization has uniformly bounded derivatives on the range in question. Taking the radii small gives the prescribed $C^1$ closeness and a uniform $C^2$ bound. Compactness and the immersion property of $I$ then give the metric lower bound and preserve immersion, after fixing $epsilon_0$ sufficiently small. ◻
]

Only the first two derivatives are controlled uniformly in this lemma. Higher derivatives may grow when the points are close together. The preparation below uses only the stated bounds; constants requiring higher derivatives will be chosen after the finite set has been fixed.

For later use, consider $F^0 = lambda I_P$, where $lambda > 0$, and write $gamma^0 = gamma \( F^0 \)$. The vector field $n^0 = - I_P$ is a global unit normal in $bb(R)^4$. The second fundamental forms satisfy

#[#set math.equation(numbering: n => "(9.1)")
 $ B_(F^0) \( v \, w \) = lambda B_(I_P)^(S^3) \( v \, w \) + lambda^(- 1) gamma^0 \( v \, w \) n^0 . $ <eq:spherical-radial-form>]

In particular, $chevron.l B_(F^0) \( v \, v \) \, n^0 chevron.r > 0$ for $v eq.not 0$. At each point of $P$, the first term vanishes and the Gauss equation gives $K_(gamma^0) = lambda^(- 2)$. For any nonzero vectors $Y_i \, Y_l$ at such a point, the quantity in (3.3) is consequently

#[#set math.equation(numbering: n => "(9.2)")
 $ Q_(i l) = lambda^(- 2) #scale(x: 120%, y: 120%)[\(] gamma^0 \( Y_i \, Y_l \)^2 + \| Y_i and Y_l \|_(gamma^0)^2 #scale(x: 120%, y: 120%)[\)] = lambda^(- 2) gamma^0 \( Y_i \, Y_i \) gamma^0 \( Y_l \, Y_l \) > 0 . $ <eq:initial-crossing-positivity>]

This identity also holds when the two vectors are proportional.

=== 9.2 A finite list with prescribed intermediate metrics <a-finite-list-with-prescribed-intermediate-metrics>

#thm([Lemma 9.2.])[
  (Global primitive preparation).  #emph[Let $\( M \, g \)$ be a closed smooth Riemannian surface. There exist a smooth immersion $F^0 : M arrow.r bb(R)^4$, a smooth unit normal $n^0$, and a finite list 
$ \( D_j \, x_j \, y_j \, a_j \) \, #h(2em) 1 lt.eq j lt.eq K \, $

 with the following properties. Each $D_j$ is a coordinate disk with smooth boundary $C_j$; $\( x_j \, y_j \)$ are coordinates on a neighborhood of $overline(D)_j$; and $a_j$ is smooth, positive on $D_j$, and zero on its exterior. Set $Y_j = partial_(y_j)$ and 
$ gamma^j = gamma \( F^0 \) + sum_(i = 1)^j a_i^2 \( d x_i \)^2 \, #h(2em) gamma^0 = gamma \( F^0 \) . $

 Then:]
  + #emph[$gamma^K = g$, and $"Hess"_(gamma^(j - 1)) x_j \( Y_j \, Y_j \) > 0$ on $overline(D)_j$.]
  + #emph[The boundaries are pairwise transverse and have no triple intersection. For $i eq.not j$, $Y_j$ is tangent to $C_i$ at only finitely many points of $overline(D)_j$. At $C_i ∩ C_l ∩ D_j$, with $i \, l \, j$ distinct, both $d x_j \( Y_i \)$ and $d x_j \( Y_l \)$ are nonzero.]
  + #emph[$B_(F^0)$ is nowhere the zero tensor, and $F^0 \, n^0$ satisfy all boundary conditions (3.3) for this list.]
] <lem:global-preparation>

#proof[
  Fix a spherical immersion $I$ and the uniform family of modifications in Lemma 18, without yet specifying the finite set. We make the choices below uniformly for this family.
  ===== 9.2.1 Metric and cone margins. <metric-and-cone-margins.>
  At any point, take a $g$-orthonormal coframe $e^1 \, e^2$ and the covectors
  $ ell_1 = e^1 \, #h(2em) ell_2 = - 1 / 2 e^1 + sqrt(3) / 2 e^2 \, #h(2em) ell_3 = - 1 / 2 e^1 - sqrt(3) / 2 e^2 . $
  Their squares form a basis of symmetric tensors and $g = 2 / 3 sum_r ell_r^2$ at that point. On the compact sets in the fixed atlas, these triples have uniform bounds, inverse-basis bounds, and a uniform neighborhood in which all three coefficients remain positive. Choose $lambda > 0$ sufficiently small that, for every allowed modification $macron(I)$, the metrics
  $ gamma_(macron(I))^0 = lambda^2 macron(I)^(*) delta_4 \, #h(2em) h_(macron(I)) = g - gamma_(macron(I))^0 $
  are positive, and $h_(macron(I))$ lies within this fixed cone margin around $g$. This one scaling works for all centers subsequently chosen. The paths
  $ gamma_(macron(I) \, s) = gamma_(macron(I))^0 + s h_(macron(I)) \, #h(2em) 0 lt.eq s lt.eq 1 \, $
  have uniform positive metric lower bounds and uniform $C^1$ bounds. Their Christoffel symbols in the fixed atlas are therefore uniformly bounded.
  ===== 9.2.2 Convex phases and disks. <convex-phases-and-disks.>
  In background coordinates $u$ centered at a disk center, replace the linear phases by
  $ x_r \( u \) = ell_r dot.op u + 1 / 2 L \| u \|^2 . $
  For every metric in the above family,
  $ \( "Hess"_gamma x_r \)_(a b) = L delta_(a b) - Gamma_(a b)^c \( gamma \) \( ell_(r \, c) + L u_c \) . $
  Choose $L$ large using the uniform connection and covector bounds, and then choose radii so small that $L \| u \|$ is small on the enlarged disks. The displayed Hessians are uniformly positive definite there. Shrinking further preserves the positive basis decompositions of $h_(macron(I))$ and the nonvanishing of $d x_r$. A linear complementary coordinate $y_r$ makes $\( x_r \, y_r \)$ a chart: along each line slice with fixed $y_r$, the derivative of $x_r$ in the $ell_r$ direction is strictly positive. Take finitely many such disks $D_nu$ covering $M$, with their closures inside the enlarged charts.
  Let $q_(nu r)^0$ be the smooth linear coefficient forms determined by the three unperturbed phase squares on the enlarged disk. Thus
  $ H = sum_(r = 1)^3 q_(nu r)^0 \( H \) \( d x_(nu r) \)^2 $
  for every symmetric tensor there, and the coefficients of every $h_(macron(I))$ have a uniform positive lower bound. Choose smooth nonnegative functions $psi_nu$, positive exactly on $D_nu$, with $sum_nu psi_nu^2 = 1$. To obtain them, take flat positive bumps on the disks and divide by the square root of the sum of their squares. The sum is positive because the disks cover $M$.
  ===== 9.2.3 Perturbed cycles and their exact amplitudes. <perturbed-cycles-and-their-exact-amplitudes.>
  One cycle consists of the finite disk/triple list. Permit small independent changes of each disk radius and of each phase’s linear part, leaving its quadratic part fixed. A small dilation gives a cutoff $psi_j$ positive exactly on the changed disk and close to the old cutoff in $C^1$. Restrict the perturbations so that the charts, cone margins and positive phase Hessians for all path metrics retain uniform strict margins. For each perturbed cycle, indexed by $c$ starting at zero, define its own bundle endomorphism of $"Sym"^2 T^(*) M$ by
  $ cal(A)_c \( H \) = sum_(j = \( nu \, r \) upright(" in cycle ") c) psi_j^2 q_(nu r)^0 \( H \) \( d x_j \)^2 . $
  The terms extend smoothly by zero. At zero perturbation, $cal(A)_c = "Id"$. Hence, in a sufficiently small fixed perturbation neighborhood, $cal(A)_c$ is invertible with a uniformly bounded $C^1$ inverse. For example, the derivative bound follows in local frames from $d \( cal(A)_c^(- 1) \) = - cal(A)_c^(- 1) \( d cal(A)_c \) cal(A)_c^(- 1)$. Shrinking that neighborhood preserves a uniform positive lower bound for $q_(nu r)^0 \( cal(A)_c^(- 1) h_(macron(I)) \)$.
  If there are $N_c$ cycles, define the amplitudes for $j$ in cycle $c$ by
  #[#set math.equation(numbering: n => "(9.3)")
   $ a_j = N_c^(- 1 \/ 2) psi_j sqrt(q_(nu r)^0 \( cal(A)_c^(- 1) h_(macron(I)) \)) . $ <eq:global-amplitudes>]
  The square root is smooth on a neighborhood of the cutoff support. Thus $a_j$ extends smoothly by zero and is positive exactly on its disk. The defining endomorphism gives the exact identity
  #[#set math.equation(numbering: n => "(9.4)")
   $ sum_(j upright(" in cycle ") c) a_j^2 \( d x_j \)^2 = N_c^(- 1) cal(A)_c \( cal(A)_c^(- 1) h_(macron(I)) \) = N_c^(- 1) h_(macron(I)) . $ <eq:cycle-identity>]
  Every tensor on the left has $C^1$ norm at most $C \/ N_c$, uniformly over allowed starting modifications and all permitted perturbations. The number of terms in one cycle is fixed. Consequently every partial cycle differs from its starting path metric $gamma_(macron(I))^0 + \( c \/ N_c \) h_(macron(I))$ by at most $C' \/ N_c$ in $C^1$, where $c$ is the number of completed cycles. All partial metrics are uniformly positive. On this bounded set, the Christoffel symbols are Lipschitz functions of the metric coefficients and their first derivatives. Choose $N_c$ large enough that the Hessian change caused by a partial cycle is less than half the fixed positive margin. Every phase then has positive Hessian for the metric immediately before its own addition. This choice does not depend on the crossing set.
  At this stage the number of terms and the admissible perturbation neighborhoods are fixed. It remains to choose the perturbations and the particular starting map; all of the estimates just proved hold for those choices.
  ===== 9.2.4 Boundary and phase transversality. <boundary-and-phase-transversality.>
  Write $rho_i$ for the squared coordinate radius defining the $i$th disk. For each pair of disks, apply Sard’s theorem #cite(label("Sard1942")) Theorem 4.1, p. 885 to $\( rho_i \, rho_l \)$ on the overlap of their enlarged charts. Outside a null set of level pairs, the boundary curves intersect transversely. For each triple, the image of $\( rho_i \, rho_l \, rho_j \)$ has three-dimensional measure zero. Indeed, on a compact coordinate box this smooth map has bounded derivative; a cover by $O \( epsilon.alt^(- 2) \)$ squares of side $epsilon.alt$ gives an image cover by cubes of total volume $O \( epsilon.alt \)$. Countable compact exhaustion proves the assertion on the overlap. Squaring the positive radii is a smooth change of parameters with a locally Lipschitz inverse. Each exceptional set remains null when lifted to the finite product of the other allowed radius intervals. There are only finitely many pairs and triples, so their exceptions can be avoided simultaneously in every permitted open parameter box. Repeated copies of the same disk cause no difficulty: distinct nearby radii give disjoint boundaries. The resulting boundaries are compact embedded circles, and their transverse pairwise intersections are finite.
  Keep these boundaries fixed and vary the phase linear parts. On a regular parametrized boundary arc $u \( t \)$ in the enlarged phase chart $U_j$, put
  $ H \( t \, ell \) = frac(d, d t) x_ell \( u \( t \) \) = \( ell + L u \( t \) \) dot.op u' \( t \) . $
  Since $partial_ell H = u' \( t \) eq.not 0$, the set $Z = { H = 0 }$ is a smooth two-dimensional surface in the three variables $\( t \, ell \)$. Its tangent equation
  $ H_t thin dot(t) + partial_ell H dot.op dot(ell) = 0 $
  shows that the projection $Z arrow.r bb(R)_ell^2$ is singular precisely when $H_t = 0$. Sard’s theorem in countably many coordinate charts of $Z$ therefore excludes a null set of linear-phase parameters, outside which every critical point of the restricted phase is nondegenerate. Use a countable collection of boundary arcs covering the entire open set $C_i ∩ U_j$. The set $C_i ∩ overline(D)_j$ is compact and lies inside $U_j$; an infinite sequence of critical points there would accumulate at another critical point and contradict its nondegeneracy. Thus there are only finitely many tangencies of $ker d x_j$, equivalently $Y_j$, to $C_i$ on this compact portion.
  At each already fixed crossing $p in C_i ∩ C_l ∩ D_j$, require $d x_j \( p \)$ to be nonproportional to both $d x_i \( p \)$ and $d x_l \( p \)$. Holding the other phase parameters fixed, each forbidden choice of $ell_j$ lies on a proper affine line: varying $ell_j$ varies $d x_j \( p \)$ arbitrarily, and all phase covectors remain nonzero in the allowed neighborhood. Fubini’s theorem makes these exceptions null in the full phase parameter space. The preceding single-phase exceptions remain null there as well. Since there are finitely many index pairs and crossings, all these requirements can be satisfied simultaneously in every permitted open parameter box. In two dimensions the determinant conditions say exactly $d x_j \( Y_i \) eq.not 0$ and $d x_j \( Y_l \) eq.not 0$ at these crossings.
  ===== 9.2.5 The final choice of the starting map. <the-final-choice-of-the-starting-map.>
  Let $P$ be the finite set of all boundary crossings just selected. Apply Lemma 18 to this set, and set $F^0 = lambda I_P$, $n^0 = - I_P$ and $h = g - gamma \( F^0 \)$. Use this actual $h$ in (9.3). The uniform family bounds ensure that all previous cone, cycle and Hessian estimates remain valid. Summing (9.4) over the $N_c$ cycles gives $gamma^K = gamma^0 + h = g$.
  Equation (9.1) gives a positive dot product with $n^0$ for every pure second-form direction, everywhere on $M$. It implies nonvanishing of $B_(F^0)$ and the non-antipodality conditions on all the boundaries. At every crossing, (9.2) gives both ordered inequalities $Q_(i l) > 0$ and $Q_(l i) > 0$. This proves all the assertions. ◻
]

=== 9.3 Completion of the global construction <completion-of-the-global-construction>

#proof[
  Take the finite list supplied by Lemma 19. Starting from $F^0 \, n^0$, apply Proposition 5 to $D_1 \, x_1 \, y_1 \, a_1$, with the remaining boundaries as the later curves. The proposition produces a smooth immersion with metric $gamma^1$, a global preferred unit normal, a nowhere-zero second-form tensor, and the boundary conditions for all remaining indices.
  Inductively, before step $j$, the current metric is exactly $gamma^(j - 1)$. Its required phase-Hessian inequality was established in Lemma 19; the curve and direction conditions are fixed throughout the construction. The previous primitive step supplies the other hypotheses. Thus the proposition applies at each of the finitely many steps. Its constants and oscillation parameters are chosen for the current fixed smooth data; no uniform higher-derivative bounds over different steps are needed.
  The resulting smooth map $F^K$ has
  $ \( F^K \)^(*) delta_4 = gamma^K = g . $
  Since $g$ is positive definite, $d F^K$ is injective at every point. This is the required isometric immersion.
  All maps and corrections were constructed on $M$. The starting normal was the radial section $- I_P$, and Proposition 5 propagates a single global normal section using local disk constructions and exterior $C^2$ closeness. It does not require the new map to equal the old map on the exterior. Neither a global oriented normal frame nor an orientation of $M$ was used, so the argument includes nonorientable surfaces. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
