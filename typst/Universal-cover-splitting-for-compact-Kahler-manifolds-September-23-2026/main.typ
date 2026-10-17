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

#align(center)[#text(size: 16pt, weight: "bold")[Universal-cover splitting for compact Kähler manifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:intro>

If a complex manifold is a product, its holomorphic tangent bundle is the direct sum of the tangent bundles of the factors. The converse starts with a specified holomorphic decomposition

$ T_X = E_1 xor E_2 $

and asks whether the infinitesimal factors come from a product on the universal cover. Compatibility with the given subbundles is part of the question: an abstract product decomposition need not realize the specified embeddings of $E_1$ and $E_2$ into $T_X$. A subbundle is #emph[integrable] if its local holomorphic sections are closed under the Lie bracket. When both summands are integrable, holomorphic Frobenius gives simultaneous local product coordinates. The problem is to continue these local products globally.

This question is closely related to the distinction between a local product structure and a complete product geometry. For a complete Riemannian metric, parallel complementary orthogonal distributions lead to the de Rham decomposition [10]. A holomorphic splitting supplies no complete metric making the distributions parallel. Compactness makes every smooth metric complete, but it does not turn the given foliations into parallel distributions. The missing step is therefore a continuation theorem for the specified local products.

=== The compatible splitting problem <the-compatible-splitting-problem>

Beauville formulated the compatible universal-cover conjecture for compact Kähler manifolds with integrable partial sums of the tangent summands [2] Section 2.3, and proved major positive cases, including Kähler–Einstein manifolds and compact Kähler surfaces [2] Theorems A and C. In the Kähler–Einstein case, Beauville refines an earlier splitting result of Yau [31], as he explains in his introduction. For two summands, the partial-sum condition means precisely that both are integrable. For this formulation, see also [20] Conjecture 1.4.

The distinction between a product and a compatible product is already visible in Beauville’s example on $A times bb(P)^1$, where $A$ is an abelian surface [2] Section 2.2. Take independent translation-invariant vector fields $U \, V$ on $A$ and vector fields $S \, T$ on $bb(P)^1$ with $\[ S \, T \] eq.not 0$, viewed as fields on the product. The rank-two subbundle spanned by $U + S \, V + T$ complements $T_(bb(P)^1)$, but is not integrable: its two generators have the nonzero vertical bracket $\[ S \, T \]$. Thus even an underlying product need not realize a specified tangent splitting.

Several later results establish global continuation under additional geometric hypotheses. Druel treats projective manifolds whose tangent bundle is a sum of line bundles, with the relevant partial sums integrable, and obtains automatic integrability in the minimal projective case [12] Theorems 1 and 2. Brunella, Pereira, and Touzet treat the case of a line summand with integrable complement on a compact Kähler manifold [5] Theorem 1.1(i). Their work also gives uniformization results when the tangent bundle is a sum of line bundles. Their proof uses leafwise Poincaré metrics and transverse invariant metrics to control continuation. Theorem 1 below permits both summands to have arbitrary positive rank.

In higher rank, Pereira and Touzet obtain a compatible Euclidean factor when one involutive direct summand is Hermitian flat [27] Theorem B. Druel, Pereira, Pym, and Touzet show that a regular foliation with numerically flat tangent bundle—meaning that the bundle and its dual are nef—is Hermitian flat and admits an integrable complement, again producing a compatible Euclidean factor [14] Theorem 1.1. A different continuation mechanism applies when a foliation has a compact leaf. Druel, Pereira, Pym, and Touzet prove compatible universal-cover splitting when one foliation has a compact leaf with finite holonomy [13] Theorem 1.4. Their argument uses global Reeb stability and a flat Ehresmann connection. Our proof replaces these additional flatness or leaf hypotheses by extension estimates for maps adapted to the two distributions.

In the projective setting, integrability and product decomposition are distinct issues. Höring proves automatic integrability for split tangent bundles on non-uniruled projective manifolds [19] Theorem 1.3. His proof combines the positivity theorem for cotangent quotients of Campana and Peternell [6] Theorems 0.1 and 1.8 with Demailly’s integrability theorem for holomorphic forms valued in the inverse of a pseudoeffective line bundle [8] Main Theorem. His recent work proves algebraic integrability for tangent summands on normal $upright(bold(Q))$-factorial projective klt varieties of Fano type; its product corollary, which does not require $upright(bold(Q))$-factoriality, gives compatible products after finite quasi-étale covers [20] Theorem 1.1 and Corollary 1.2. The companion [26] Theorem 1.1 proves that, on a smooth connected rationally connected projective complex manifold, both summands of every specified holomorphic splitting $T_X = E_1 xor E_2$ into positive-rank subbundles are integrable. These results address the geometry that forces a splitting to define foliations. In our main theorem integrability is an explicit hypothesis, while the ambient manifold is only assumed to be compact Kähler.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a compact connected Kähler manifold of complex dimension $n gt.eq 2$, and let 
$ T_X = E_1 xor E_2 $

 be a specified decomposition into integrable holomorphic subbundles of positive ranks $r_1 \, r_2$. If $pi : tilde(X) arrow.r X$ is the ordinary universal covering map, there are connected simply connected complex manifolds $Y_1 \, Y_2$ and a biholomorphism $Phi : tilde(X) arrow.r Y_1 times Y_2$ such that 
$ upright(d) Phi \( pi^(*) E_i \) = "pr"_i^(*) T_(Y_i) #h(2em) \( i = 1 \, 2 \) \, $

 where $upright(d) pi$ identifies $T_(tilde(X))$ with $pi^(*) T_X$. In particular, $dim_(bb(C)) Y_i = r_i$.]
] <thm:main>

Theorem 1 proves the two-summand form of Beauville’s compatible splitting conjecture. Its factors are the universal covers of the intrinsic leaves through a common point. The leaves and factors can be noncompact. The conclusion is about the ordinary universal cover; it does not assert that a finite cover of $X$ is a product. If a summand has rank zero, the corresponding factor is a point, so the positive-rank formulation removes only the trivial case.

#thm([Corollary 1.2.])[
  (Non-uniruled projective manifolds).  #emph[Let $X$ be a smooth connected non-uniruled projective complex manifold, and let $T_X = E_1 xor E_2$ be a specified holomorphic splitting into subbundles of positive ranks. Then both summands are integrable and the ordinary universal cover has a compatible product decomposition as in Theorem 1.]
] <cor:non-uniruled>

#proof[
  Höring’s theorem [19] Theorem 1.3 makes both summands integrable. Since a smooth projective complex manifold is compact Kähler, Theorem 1 applies. ◻
]

=== The nef-and-big application <the-nef-and-big-application>

For a smooth projective manifold, a line bundle is #emph[nef] if it has nonnegative degree on every curve, and it is #emph[big] if its sections have maximal asymptotic growth. When $K_X$ is nef and big, its pluricanonical sections define a birational contraction $f : X arrow.r Z$ to the canonical model. We call $X^0 = f^(- 1) \( Z_(upright("reg")) \)$, the inverse image of the smooth locus of $Z$, the #emph[regular canonical locus].

Corollary 2 already gives the product conclusion in this case. Our metric argument proves an additional statement: the canonical Kähler–Einstein connection preserves both supplied summands on $X^0$. This parallelism is the input for the alternative continuation method in the appendices. We first record the product conclusion.

#thm([Corollary 1.3.])[
  #emph[Let $X$ be a smooth connected projective complex manifold of dimension $n gt.eq 2$ with nef and big canonical bundle $K_X$. Every specified holomorphic splitting $T_X = E_1 xor E_2$ into positive-rank subbundles is integrable and induces a compatible product decomposition of the ordinary universal cover as in Theorem 1.]
] <thm:nef-big>

When $K_X$ is ample, the negative Kähler–Einstein metric and Beauville’s theorem already give this conclusion. For nef and big $K_X$, we use the canonical Kähler–Einstein approximation on a smooth crepant resolution, as developed by Song [29]. The integrated squared second fundamental forms of the supplied summands are $O \( epsilon \)$ along the approximation. Their limit vanishes on the regular canonical locus, where the limiting metric makes both summands parallel. The holomorphic Frobenius obstructions then vanish on all of $X$. This supplies the precise hypothesis needed to apply Theorem 1. The approximate Kähler–Einstein method belongs to the stability theory developed by Enoki [15]; the passage from vanishing second fundamental forms to a parallel splitting is used explicitly by Guenancia [17] Section 3.4, Step 4.

=== The analytic continuation argument <the-analytic-continuation-argument>

Local product coordinates alone do not show that a path in one foliation can be transported all the way along a path in the other. We first solve that extension problem for holomorphic maps, and then pass to continuous paths. A holomorphic #emph[box] in two scalar parameters is a map $f$ whose $s$-derivative lies in $E_1$ and whose $t$-derivative lies in $E_2$. In a simultaneous product chart it has the separated form $\( f_1 \( s \) \, f_2 \( t \) \)$. We do not impose an immersion or full-rank condition.

The first analytic step fills a Hartogs figure by a holomorphic box (Proposition 6). Ivashkovich’s theorem gives a meromorphic extension to the envelope of holomorphy [21,22]. The separate tangencies then exclude positive-dimensional fibres of its graph. If a first target coordinate varied along such a fibre, fixing that coordinate together with $s$ would give an isolated level at a general fibre point. Nearby ordinary graph points instead lie on one-dimensional levels, because the same coordinate is independent of $t$. A compact local analytic level would result, which is impossible in a coordinate ball. The argument works for every summand rank and for boxes with deficient rank.

The second step crosses a smooth convex boundary at which the complex tangent has nonzero components in both parameter directions (Proposition 8). Bounded projections onto $E_1$ and $E_2$ compare the normal and tangential speeds of the box. Stokes’ theorem for a Kähler form then bounds the areas of shrinking complex tangent disks. Among many disjoint annuli, one has small area; a local derivative rescaling argument gives a small image. Product coordinates on that image build a Hartogs shell whose size exceeds the remaining distance to the boundary. The first step fills it. Closedness of the Kähler form enters the area estimate, while its metric need not make the two summands orthogonal.

These extension results combine two holomorphic disk axes into a box on their entire bidisk. A finite coordinate construction proves holomorphic dependence on additional parameters, yielding full polydisk boxes (Section 5). This is stronger than continuation of individual germs: after transport, an edge still has a holomorphic representative on its whole original parameter polydisk. Consequently a finite rectangular grid combines arbitrary continuous plaque paths, and a second grid realizes any continuous path as the diagonal of a rectangle (Section 6). The rectangles continue both the local product map and its inverse. Monodromy and basepoint-matched covering lifts then give inverse biholomorphisms on the simply connected covers.

=== An alternative through collapsed fibres <an-alternative-through-collapsed-fibres>

The canonical contraction also permits a different continuation method. We develop it in the appendices because it supplies a useful neighborhood theorem for singular projective sets as well as another proof of Corollary 3. If $P$ is a compact simply connected projective set in a smooth projective manifold with complementary integrable tangent subbundles, and every two points of $P$ are joined by rational chains, ordinary local crossing extends to a holomorphic map $c : U times U arrow.r M$ on a neighborhood of the whole set $P$ (Theorem 25).

The proof first fills products of rational curves, using meromorphic Hartogs extension and the same complementary-tangency obstruction to exceptional curves. It then uses proper stable-map spaces [16], semialgebraic path lifting, and monodromy to continue #emph[ambient] germs near the possibly singular or reducible set $P$. For the canonical contraction, Hacon–McKernan’s rational-chain theorem and Takayama’s local simple-connectedness theorem provide the required fibre topology [18,30]. Song’s metric completion supplies a continuous pseudodistance that collapses exactly those fibres. Crossings are separately nonexpanding for this pseudodistance, and a finite grid gives path rectangles even for paths contained in a collapsed fibre. No length bound on those paths is required.

The main proof occupies Sections 2–6. Section 7 proves the metric estimate and the nef-and-big application. Appendices 8–11 give the alternative continuation mechanism in its dependency order. All manifolds and varieties are complex. All covers and fundamental groups are taken in the ordinary topology, and leaves carry their intrinsic manifold topology.

== 2 Product charts and boxes <sec:prelim>

Throughout the proof, $X \, E_1 \, E_2$ satisfy the hypotheses of Theorem 1. Write $bb(D) = { z in bb(C) : \| z \| < 1 }$. Fix a Kähler form $omega$ on $X$ and its Hermitian metric $g \( a \, b \) = omega \( a \, J b \)$ on the real tangent bundle, where $J$ is the complex structure. We identify the real tangent bundle with the holomorphic tangent bundle as complex vector bundles, so multiplication by $i$ on real tangent vectors means application of $J$. The splitting therefore has complex-linear projections $P_i$ on real tangent vectors. Compactness gives

#[#set math.equation(numbering: n => "(2.1)")
 $ sup_(x in X) ∥P_i \( x \)∥ < oo #h(2em) \( i = 1 \, 2 \) . $ <eq:projection-bounds>]

No orthogonality of the two summands is assumed.

#thm([Lemma 2.1.])[
  #emph[Every point of $X$ has a holomorphic coordinate neighborhood with coordinates $z = \( z_1 \, z_2 \)$ and range $bb(D)^(r_1) times bb(D)^(r_2)$, in which $E_i$ is tangent to the $z_i$-directions. Changes between these charts are locally of the following form, with each $h_i$ a local biholomorphism: 
#[#set math.equation(numbering: n => "(2.2)")
 $ z'_1 = h_1 \( z_1 \) \, #h(2em) z'_2 = h_2 \( z_2 \) . $ <eq:separated-transition>]

]
] <lem:product-charts>

#proof[
  Holomorphic Frobenius gives a local submersion with kernel $E_i$ for each $i$. To recall the local construction, choose a coordinate projection that is nonsingular on the distribution and lift its coordinate fields to a frame in the distribution. Their brackets belong to the distribution by integrability and project to zero; the projection is an isomorphism on the distribution, so the brackets vanish. The commuting local holomorphic flows applied to a transverse slice give foliation coordinates and the asserted submersion.
  Combine the submersion with kernel $E_2$ and the submersion with kernel $E_1$. Their combined differential is an isomorphism by complementarity. The holomorphic inverse function theorem and restriction to a product of polydisks give the desired coordinates. A chart change preserves both distributions, so its wrong-block derivatives vanish. On small product neighborhoods this is exactly (2.2), and invertibility of the chart change makes each block a local biholomorphism. ◻
]

We call these #emph[product charts]. A #emph[first plaque] is a slice with $z_2$ fixed, and a #emph[second plaque] is a slice with $z_1$ fixed. A continuous path is a first or second #emph[plaque path] if it locally lies in plaques of the corresponding type. Transitions are required to be separated only locally; no assertion is made about a single formula on a disconnected chart overlap.

#prodef([Definition 2.2.])[
  Let $U subset bb(C)^a times bb(C)^b$ be open, with parameter blocks $\( s \, t \)$. A holomorphic map $f : U arrow.r X$ is a #emph[holomorphic box] if
  $ upright(d) f \( T bb(C)^a xor 0 \) subset E_1 \, #h(2em) upright(d) f \( 0 xor T bb(C)^b \) subset E_2 . $
  The conditions are imposed at every point of $U$. They do not require $f$ to be an immersion.
] <def:box>

The definition imposes only tangency; the standing integrability hypothesis supplies the product charts. In such a chart, a box is locally $\( f_1 \( s \) \, f_2 \( t \) \)$. Conversely, this local separation implies the two tangencies. The scalar case $a = b = 1$ will be used first. Its parameters $\( s \, t \)$ retain their prescribed directions even when we describe a domain using other affine coordinates.

All uses of the identity theorem below are for holomorphic maps or holomorphic bundle maps on connected domains. In particular, tangency persists under holomorphic extension: the wrong-summand projections of the differential vanish wherever the initial box is defined and therefore throughout the connected extension domain.

== 3 Hartogs extension for boxes <sec:hartogs>

Our first extension step is local in the source but uses the compact Kähler target. A general meromorphic extension can acquire exceptional fibers. For a box, the two separate tangencies exclude these fibers, even when the box has deficient rank.

#thm([Proposition 3.1.])[
  (Hartogs extension).  #emph[Let $\( s \, t \)$ be the standard coordinates of $bb(C)^2$, and let $\( w \, v \)$ be any invertible complex-affine coordinate system. For real numbers $0 < e < a$ and $0 < c < b$, put 
$ H = { \| w \| < e \, med \| v \| < b #scale(x: 120%, y: 120%)[}] med union med { \| w \| < a \, med c < \| v \| < b #scale(x: 120%, y: 120%)[}] \, #h(2em) Q = { \| w \| < a \, med \| v \| < b #scale(x: 120%, y: 120%)[}] . $

 Every holomorphic map $f : H arrow.r X$ satisfying 
$ upright(d) f \( partial_s \) in E_1 \, #h(2em) upright(d) f \( partial_t \) in E_2 $

 extends uniquely to a holomorphic map $Q arrow.r X$ with the same tangencies. Thus the affine coordinates defining the Hartogs figure need not be the coordinates defining the box.]
] <prop:hartogs>

#proof[
  We first obtain a meromorphic extension. We then rule out curves in its graph fibers by comparing two types of level sets: a level isolated at a putative exceptional curve, and nearby levels containing a parameter direction. Finally we show that the remaining finite fibers are singletons.
  #emph[Meromorphic extension and tangency.] The envelope of holomorphy of $H$ is $Q$. Indeed, expand a scalar holomorphic function on the shell in a Laurent series in $v$. The coefficients of the negative powers are holomorphic functions of $w$; they vanish for $\| w \| < e$, and hence for $\| w \| < a$. Cauchy estimates on any intermediate circle $c < \| v \| < b$ give normal convergence of the resulting power series on compact subsets of $Q$. This is the usual Hartogs extension calculation; since the bidisk $Q$ is a domain of holomorphy, it also identifies the envelope.
  Ivashkovich’s extension theorem states that a meromorphic map from a domain in a Stein manifold to a compact Kähler manifold extends meromorphically to the envelope of holomorphy [22] Theorem 2.2; see also [21]. Here $H$ is a domain in the Stein manifold $bb(C)^2$, and $f$ is holomorphic, so the theorem gives a meromorphic extension to $Q$.
  Let $Gamma subset Q times X$ be its graph, with its reduced analytic structure, and let $rho : Gamma arrow.r Q$ be the first projection. The graph is an irreducible analytic surface, $rho$ is proper, and there is a proper analytic subset $A subset Q$, disjoint from $H$, such that over $U = Q \\ A$ the graph is the ordinary graph of a holomorphic map $F : U arrow.r X$. This ordinary graph is dense in $Gamma$. The set $U$ is connected: the complement of a proper complex analytic subset of a connected complex manifold is connected. Consequently, the identity theorem applied to the two holomorphic bundle-valued expressions gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ P_2 upright(d) F \( partial_s \) = 0 \, #h(2em) P_1 upright(d) F \( partial_t \) = 0 quad upright("on ") U . $ <eq:meromorphic-box-tangency>]
  Here $P_i : T_X arrow.r E_i$ is the holomorphic projection determined by the specified splitting.
  #emph[No positive-dimensional fiber.] We use the local irreducible decomposition, dimension theorem, and regular-locus properties of complex analytic sets; see [9] Chapter II, Section 4. We record first a point that is important when $Gamma$ is singular or locally reducible. On every local irreducible surface branch of $Gamma$, both source coordinates $s$ and $t$ are nonconstant. To see this, choose a relatively open part of that branch away from the other local branches. It meets the dense ordinary graph. Near such a point, $rho$ is an isomorphism onto an open subset of $Q$, and $s \, t$ are source coordinates. Neither coordinate can therefore be constant on the branch. It follows that, for every $s_0$, the analytic set
  #[#set math.equation(numbering: n => "(3.2)")
   $ Gamma ∩ { s = s_0 } $ <eq:graph-coordinate-level>]
  has local dimension at most one; the same holds with $t$ in place of $s$.
  Suppose a fiber over $\( s_0 \, t_0 \)$ has positive dimension. Since it is contained in (3.2), it has a curve component $C$. Take a small piece of $C$ in a product chart $z = \( z_1 \, z_2 \)$ of $X$. Some scalar component $h$ of $z_1$ or $z_2$ is nonconstant on this piece: otherwise the fiber curve, which lies in ${ \( s_0 \, t_0 \) } times X$, would be a point.
  First suppose $h$ belongs to $z_1$. The curve piece is a component of the reduced set (3.2), since that set has dimension at most one. Choose a general point $q$ of the curve piece such that the reduced set (3.2) is a smooth curve near $q$ and $h$ is nonconstant on its germ. This is possible because the one-dimensional analytic set has locally finitely many curve components, distinct components meet discretely, and the singular points of a reduced curve are discrete. In particular, $q$ is an isolated point of the level set
  $ \( s \, h \)^(- 1) #scale(x: 120%, y: 120%)[\(] s_0 \, h \( q \) #scale(x: 120%, y: 120%)[\)] subset Gamma . $
  This assertion concerns the reduced coordinate level, and does not require $Gamma$ itself to be smooth along $C$.
  Work in ambient complex coordinates on $Q times X$ around $q$, and choose a sufficiently small closed Euclidean ball $overline(B)$ centered at $q$. Its closure lies in this coordinate neighborhood, and the indicated level set misses $Gamma ∩ partial B$. The image of this boundary intersection under the holomorphic map
  $ Psi = \( s \, h \) $
  is compact and does not contain $Psi \( q \)$. Choose points $q_j$ of the ordinary graph tending to $q$. For all sufficiently large $j$, the level value $Psi \( q_j \)$ also misses that compact image. Therefore
  $ K_j = Gamma ∩ overline(B) ∩ Psi^(- 1) #scale(x: 120%, y: 120%)[\(] Psi \( q_j \) #scale(x: 120%, y: 120%)[\)] $
  is a compact analytic subset of the open ball $B$: it has no points on $partial B$, so there is no boundary truncation of the analytic level. On the ordinary graph near $q_j$, however, (3.1) says that $h$ is independent of $t$. Varying $t$ with $s$ fixed gives a one-dimensional germ in $K_j$ through $q_j$. This contradicts the fact that a compact analytic subset of an open set in Euclidean complex space has no positive-dimensional component. One way to see the latter fact is to maximize the strictly plurisubharmonic squared coordinate norm on such a component and restrict it to a nonconstant analytic curve germ through a maximum point.
  If $h$ belongs to $z_2$, the identical argument uses $Psi = \( t \, h \)$ and varies $s$. Thus every fiber of $rho$ has dimension zero. Properness then makes each fiber finite.
  #emph[Singleton fibers and holomorphic removal.] Fix $p in Q$, and write its fiber as ${ \( p \, x_1 \) \, dots.h \, \( p \, x_k \) }$. Choose pairwise disjoint target neighborhoods $V_1 \, dots.h \, V_k$ with pairwise disjoint closures and $x_i in V_i$. Properness implies that, after shrinking a base ball $D$ about $p$, every point of $rho^(- 1) \( D \)$ has its target coordinate in $union.big_i V_i$. Otherwise a sequence of graph points over points tending to $p$, outside this union, would have a limit in the central fiber. The ordinary locus $D \\ A$ is connected, so its image under $F$ lies in a single $V_i$. Density of the ordinary graph then places every $x_j$ in $overline(V)_i$. The disjoint closures imply $k = 1$.
  The proper bijection $rho$ is a homeomorphism. Its inverse followed by the second projection defines a continuous extension $hat(F) : Q arrow.r X$. Near each source point its image lies in a target coordinate chart. The coordinate functions are continuous and holomorphic off $A$, hence holomorphic by the removable-singularity theorem for locally bounded holomorphic functions across analytic subsets of a complex manifold. Thus $hat(F)$ is holomorphic. Equation (3.1) extends by the identity theorem, giving the required box tangencies. Uniqueness follows from the identity theorem on the connected bidisk $Q$. ◻
]

== 4 Extension across a mixed boundary <sec:boundary>

We next extend a box across a smooth boundary point whose complex tangent involves both source directions. The Kähler form controls the areas of shrinking slices. An annulus of small area then supplies the shell of a Hartogs figure large enough to cross the boundary. We first isolate the elementary compactness argument that converts small area into a small image. Its proof is a local form of the derivative normalization used in Brody’s reparametrization argument [4], with vanishing area providing the contradiction.

#thm([Lemma 4.1.])[
  (Small area).  #emph[Let $M$ be a compact Hermitian manifold, with associated positive $\( 1 \, 1 \)$-form $omega_M$, and let $U subset bb(C)$ be a domain. Suppose that $h_j : U arrow.r M$ are holomorphic and 
$ integral_U h_j^(*) omega_M arrow.r 0 . $

 Then $∥upright(d) h_j∥$ tends to zero uniformly on every compact subset of $U$. Here the source has its Euclidean metric. Closedness of $omega_M$ is not required.]
] <lem:small-area>

#proof[
  It suffices to work on a disk $D$ with $overline(D) subset U$. Put $d \( z \) = "dist" \( z \, partial D \)$ and
  $ M_j = max_(overline(D)) d \( z \) ∥upright(d) h_j \( z \)∥ . $
  If $M_j ↛ 0$, pass to a subsequence with $M_j gt.eq epsilon > 0$. Choose a maximizing point $z_j in D$, and set $a_j = ∥upright(d) h_j \( z_j \)∥$ and $d_j = d \( z_j \)$, so $a_j d_j = M_j$. The maps
  $ k_j \( zeta \) = h_j \( z_j + zeta \/ a_j \) $
  are defined for $\| zeta \| < epsilon \/ 4$. On this disk, $d \( z_j + zeta \/ a_j \) gt.eq d_j \/ 2$, and maximality gives
  $ ∥upright(d) k_j \( zeta \)∥ lt.eq 2 \, #h(2em) ∥upright(d) k_j \( 0 \)∥ = 1 . $
  After taking a subsequence, $k_j \( 0 \)$ converges to a point of $M$. The derivative bound puts the images of a fixed smaller disk in a relatively compact coordinate neighborhood of that point. Montel’s theorem and the Cauchy estimates give a further subsequence converging there together with its derivatives. Its limit has derivative norm $1$ at the origin and therefore positive area on a smaller disk. This contradicts the vanishing areas of $k_j$, which are bounded by the areas of $h_j$ and are unchanged by the affine reparametrization. Thus $M_j arrow.r 0$. On each smaller disk $d$ is bounded below, so the derivatives tend uniformly to zero. A finite covering proves the assertion on any compact subset of $U$. ◻
]

#thm([Proposition 4.2.])[
  (Mixed-boundary extension).  #emph[Let $B subset bb(C)_(s \, t)^2$ be a convex open set, and let $f : B arrow.r X$ be a holomorphic box. Suppose that $p in partial B$ has a $C^2$ defining function with nonzero differential. If the complex tangent line to $partial B$ at $p$ is generated by a vector with both components nonzero, then $f$ extends as a holomorphic box to a neighborhood of $p$, agreeing with $f$ on its intersection with $B$.]
] <prop:mixed>

#proof[
  Use the fixed Kähler form $omega$ and its Hermitian norm, and recall the bounded projections $P_i$ from (2.1).
  Write $p = \( s_(*) \, t_(*) \)$. Choose complex-affine coordinates $\( u \, v \)$ with
  #[#set math.equation(numbering: n => "(4.1)")
   $ \( s \, t \) = \( s_(*) \, t_(*) \) + \( a_1 \, a_2 \) u + \( b_1 \, b_2 \) v \, #h(2em) b_1 b_2 eq.not 0 \, $ <eq:boundary-affine>]
  where the $v$-direction is complex tangent and the positive real $u$-direction points outward. All constants below may depend on this boundary point and these coordinates.
  ===== 4.1 Shrinking slices and bounded area. <shrinking-slices-and-bounded-area.>
  Take a local defining function $rho$ with $B = { rho < 0 }$ near $p$. For real $x$ and small $v$, Taylor’s theorem gives
  $ rho \( x \, v \) lt.eq c x + M \( x^2 + \| v \|^2 \) \, #h(2em) c > 0 \, $
  because both real derivatives in the complex tangent direction vanish. Choose $k > 0$ sufficiently small. For all $x < 0$ sufficiently close to zero, the closed disks
  $ D_x = { u = x \, med \| v \| lt.eq r \( x \) } \, #h(2em) r \( x \) = k sqrt(- x) \, $
  are compactly contained in $B$.
  Let $e_u = partial_("Re" u)$ and $e_v = partial_("Re" v)$. The box tangencies and complex linearity give the exact identity
  $ upright(d) f \( e_u \) = sum_(i = 1)^2 a_i / b_i P_i upright(d) f \( e_v \) . $
  Consequently
  #[#set math.equation(numbering: n => "(4.2)")
   $ ∥upright(d) f \( e_u \)∥ lt.eq C ∥upright(d) f \( e_v \)∥ \, #h(2em) C = sum_(i = 1)^2 lr(|a_i / b_i|) sup_X ∥P_i∥ . $ <eq:boundary-speed>]
  Holomorphicity makes $∥upright(d) f \( e_v \)∥$ equal to the speed in every unit real direction of the $v$-plane, including the radial direction.
  Set $Omega = f^(*) omega$ and $A \( x \) = integral_(D_x) Omega$. Closedness of $Omega$ and Stokes’ theorem, applied to the moving disks, yield
  $ A' \( x \) = integral_0^(2 pi) Omega #scale(x: 120%, y: 120%)[\(] e_u + r' \( x \) partial_r \, partial_theta #scale(x: 120%, y: 120%)[\)] \|_(u = x \, med v = r \( x \) e^(i theta)) thin upright(d) theta . $
  Indeed the boundary velocity is $e_u + r' \( x \) partial_r$, and the circles have their counterclockwise orientation. On a boundary circle put $q = ∥upright(d) f \( e_v \)∥$. Since $partial_theta = r J partial_r$,
  $ Omega \( partial_r \, partial_theta \) = r q^2 \, #h(2em) \| Omega \( e_u \, partial_theta \) \| lt.eq C r q^2 . $
  Thus
  $ A' \( x \) lt.eq integral_0^(2 pi) r \( x \) #scale(x: 120%, y: 120%)[\(] C + r' \( x \) #scale(x: 120%, y: 120%)[\)] q^2 thin upright(d) theta . $
  Here $r' \( x \) = - k \/ \( 2 sqrt(- x) \)$. Choose $x_0 < 0$ sufficiently close to zero that $r' \( x \) lt.eq - C$ for $x_0 lt.eq x < 0$. We obtain the uniform bound
  #[#set math.equation(numbering: n => "(4.3)")
   $ 0 lt.eq A \( x \) lt.eq A \( x_0 \) < oo #h(2em) \( x_0 lt.eq x < 0 \) . $ <eq:boundary-area>]
  No product property of the Kähler metric has been used.
  ===== 4.2 A small-image annulus. <a-small-image-annulus.>
  Let $x_j = - delta_j$ with $delta_j arrow.b 0$. Among the scales $lambda = 5^ell delta_j^(3 \/ 4)$, with integer $ell gt.eq 0$, in $\[ delta_j^(3 \/ 4) \, delta_j^(5 \/ 8) \]$, the annuli
  $ lambda \/ 2 < \| v \| < 2 lambda $
  are pairwise disjoint, and their number tends to infinity. For large $j$ they lie in $D_(x_j)$. By (4.3), one of them, with scale $lambda_j$, has area tending to zero. These choices satisfy
  #[#set math.equation(numbering: n => "(4.4)")
   $ delta_j / lambda_j lt.eq delta_j^(1 \/ 4) arrow.r 0 \, #h(2em) lambda_j / sqrt(delta_j) lt.eq delta_j^(1 \/ 8) arrow.r 0 . $ <eq:boundary-scales>]
  Apply Lemma 7 to $h_j \( zeta \) = f \( x_j \, lambda_j zeta \)$ on $1 \/ 2 < \| zeta \| < 2$. The derivatives tend uniformly to zero on a neighborhood of $3 \/ 4 lt.eq \| zeta \| lt.eq 3 \/ 2$. This compact annulus has bounded intrinsic diameter, so the image of
  $ u = x_j \, #h(2em) 3 lambda_j \/ 4 < \| v \| < 3 lambda_j \/ 2 $
  has diameter tending to zero. A finite cover of $X$ by product charts has a Lebesgue number. Hence, for large $j$, this entire image lies in one product chart $z : V arrow.r V_1 times V_2$. Write its coordinate functions as $\( g_1 \( v \) \, g_2 \( v \) \)$.
  Figure 1 separates the two scale comparisons.
  #figure(
    [(430,145) (100,125)(0,0)normal real slice ($v = 0$) (15,75)(1,0)180 (35,75)(1,0)130 (100,71)(0,1)8 (116,68)(0,1)14 (100,75) (116,75) (91,58)(0,0)$x_j = - delta_j$ (127,91)(0,0)$p : u = 0$ (35,101)(1,0)130 (35,98)(0,1)6 (165,98)(0,1)6 (100,111)(0,0)shell width $2 eta lambda_j$ (193,63)(0,0)$u$ (108,37)(0,0)$delta_j \/ lambda_j arrow.r 0$ (320,125)(0,0)complex tangent slice ($u = x_j$) (320,69) (320,69)(320,69) (320,69) (320,69)(1,0)45 (376,58)(0,0)\[l\]$r \( x_j \)$ (320,69)(-4,3)16 (300,90)(0,0)\[r\]$lambda_j$ (320,8)(0,0)$lambda_j \/ sqrt(delta_j) arrow.r 0$],
    caption: [Figure 1: The two scale inequalities used to cross the boundary. On the left, the filled Hartogs domain extends in the $u$ direction farther than the distance $delta_j$ from the slice to $p$. On the right, its shell has radius comparable to $lambda_j$ and fits well inside the slice disk of radius $r \( x_j \) = k sqrt(delta_j)$. The annulus has a small image in one target product chart. These are separate source slices in the affine coordinates $\( u \, v \)$, drawn schematically and not at a common scale. ],
  ) <fig:boundary-scales>
  We have found an annulus whose radius is much larger than the remaining distance $delta_j$ to the boundary. We now extend it transversely to make a Hartogs shell.
  ===== 4.3 The shell and its agreement with the old box. <the-shell-and-its-agreement-with-the-old-box.>
  Put $w = u - x_j$ and $c_i = a_i \/ b_i$. Choose $eta > 0$, independent of $j$, so that $eta max \( 1 \, \| c_1 \| \, \| c_2 \| \) < 1 \/ 8$. On
  $ S_j = { \| w \| < eta lambda_j \, quad lambda_j < \| v \| < 5 lambda_j \/ 4 } $
  define
  #[#set math.equation(numbering: n => "(4.5)")
   $ F_j \( w \, v \) = z^(- 1) #scale(x: 120%, y: 120%)[\(] g_1 \( v + c_1 w \) \, g_2 \( v + c_2 w \) #scale(x: 120%, y: 120%)[\)] . $ <eq:boundary-shell>]
  Both shifted arguments stay in $3 lambda_j \/ 4 < \| v \| < 3 lambda_j \/ 2$. The range of $z$ is a product, so combining the two valid factor coordinates in (4.5) needs no further target-chart margin. Moreover,
  $ v + c_1 w = frac(s - s_(*) - a_1 x_j, b_1) \, #h(2em) v + c_2 w = frac(t - t_(*) - a_2 x_j, b_2) . $
  Thus $F_j$ is a box in the original $\( s \, t \)$ directions.
  The two maps agree on an open germ at every point of $S_j$ with $w = 0$. To see this, continuity puts the old map $f$ in $V$ on a neighborhood of that point. There its separated expression is $\( phi_1 \( s \) \, phi_2 \( t \) \)$. Restriction to $u = x_j$ gives the local expressions for $g_i$, and the displayed identities show that (4.5) reproduces $f$ on a full neighborhood. This is stronger than equality merely on the slice $w = 0$.
  The closed slice disk $u = x_j$, $\| v \| lt.eq 5 lambda_j \/ 4$ is contained in $B$. Hence there is $0 < e_j < eta lambda_j$ such that the original map is defined on
  $ C_j = { \| w \| < e_j \, med \| v \| < 5 lambda_j \/ 4 } . $
  The overlap $C_j ∩ S_j$ is a connected product of a disk and an annulus. The identity theorem for maps into $X$ therefore extends the open-germ agreement to this entire overlap, even if the old map elsewhere leaves $V$. We have a box on the Hartogs figure $C_j union S_j$.
  By Proposition 6, it extends to a box on
  $ Q_j = { \| w \| < eta lambda_j \, med \| v \| < 5 lambda_j \/ 4 } . $
  Both $Q_j$ and $B$ are convex in the underlying real affine space. Their intersection is connected and contains $C_j$, so the extension agrees with $f$ throughout $Q_j ∩ B$. Finally $p$ has coordinates $\( w \, v \) = \( delta_j \, 0 \)$, which belong to $Q_j$ for large $j$ by (4.4). This gives the required extension across $p$. ◻
]

== 5 Boxes with prescribed axes <sec:boxes>

The mixed-boundary extension result lets us combine two holomorphic maps on full disks, not just their germs. We then establish the parameter dependence needed to combine maps from higher-dimensional polydisks.

#thm([Proposition 5.1.])[
  (Disk axes).  #emph[Let $alpha \, beta : bb(D) arrow.r X$ be holomorphic maps with $upright(d) alpha \( T_(bb(D)) \) subset E_1$, $upright(d) beta \( T_(bb(D)) \) subset E_2$, and $alpha \( 0 \) = beta \( 0 \)$. There is a unique holomorphic box $F : bb(D)^2 arrow.r X$ such that 
$ F \( s \, 0 \) = alpha \( s \) \, #h(2em) F \( 0 \, t \) = beta \( t \) . $

]
] <prop:disk-axes>

#proof[
  Product coordinates at the common initial point give a unique box germ: take the first coordinate from $alpha$ and the second from $beta$. Any two boxes extending this germ agree on a connected common domain by the identity theorem.
  Fix an integer $m gt.eq 1$, and consider the convex domains
  $ B_m \( R \) = { \( s \, t \) : \| s \|^(2 m) + \| t \|^(2 m) < R^(2 m) } \, #h(2em) 0 < R lt.eq 1 . $
  Let $R_(*)$ be the supremum of the radii to which the germ extends as a box. The nested extensions agree and give a box on $B_m \( R_(*) \)$. Its values on the two axes are the prescribed maps, by the one-variable identity theorem. Suppose that $R_(*) < 1$.
  At a boundary point with $s t eq.not 0$, the complex tangent line has both components nonzero: both coefficients of $partial \( \| s \|^(2 m) + \| t \|^(2 m) \)$ are nonzero there. Proposition 8 therefore extends the box across that point. At a boundary point $\( s_(*) \, 0 \)$, choose a disk $U$ around $s_(*)$, with $overline(U) subset bb(D)$, such that $alpha \( U \)$ lies in a product chart $z = \( z_1 \, z_2 \)$. Choose $s' in U$ with $\| s' \| < R_(*)$. For sufficiently small $epsilon.alt > 0$, the formula
  $ G \( s \, t \) = z^(- 1) #scale(x: 120%, y: 120%)[\(] z_1 \( alpha \( s \) \) \, z_2 \( F \( s' \, t \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( s \, t \) in U times bb(D)_epsilon.alt \, $
  is defined and is a box. Here $bb(D)_epsilon.alt = { \| t \| < epsilon.alt }$. The product range of the chart makes the formula well-defined. Local separation shows that $G = F$ near $\( s' \, 0 \)$. Their common domain $\( U times bb(D)_epsilon.alt \) ∩ B_m \( R_(*) \)$ is convex, so they agree throughout it. The other axis is treated symmetrically.
  These boundary extensions glue. Indeed, restrict each one to an ordinary Euclidean ball centered at its boundary point. If two such balls intersect, their intersection contains a point of the segment joining their centers. That segment lies in $overline(B_m \( R_(*) \))$ by convexity. Since the intersection is open, it consequently meets $B_m \( R_(*) \)$. The two extensions agree there, hence on their connected intersection. A finite subcollection covers the compact boundary, giving an extension to a neighborhood of $overline(B_m \( R_(*) \))$. This neighborhood contains $B_m \( R' \)$ for some $R_(*) < R' < 1$, a contradiction.
  Thus the germ extends to $B_m \( 1 \)$ for every $m$. These domains increase to $bb(D)^2$, and the resulting boxes agree on their connected overlaps. Their union is the required box. The initial uniqueness observation proves uniqueness on $bb(D)^2$. ◻
]

We will also use boxes with real parameters. A #emph[continuous box] on a product of closed intervals is a continuous map into $X$ that is locally separated in product coordinates. Equivalently, every horizontal slice locally follows an $E_1$-plaque and every vertical slice locally follows an $E_2$-plaque. If a whole subrectangle maps into one product chart, its first coordinate depends only on the horizontal parameter and its second only on the vertical parameter: the unwanted coordinate is locally constant along each connected slice.

#thm([Lemma 5.2.])[
  (Uniqueness of continuous boxes).  #emph[Two continuous boxes on $\[ 0 \, 1 \]^2$ with the same bottom and left edges are equal.]
] <lem:box-unique>

#proof[
  Choose a Lebesgue number $lambda > 0$ for a finite product-chart cover of the compact metric space $X$. Uniform continuity gives one finite rectangular grid such that the image of each closed tile under either map has diameter less than $lambda \/ 3$. Whenever the two maps agree at a tile’s lower-left corner, the union of their tile images has diameter less than $2 lambda \/ 3$, so both images lie in one product chart. In that chart each box is determined by its bottom first coordinate and left second coordinate. Starting with the prescribed edges and proceeding by increasing sum of the tile indices proves equality on the whole grid. ◻
]

#thm([Proposition 5.3.])[
  (Polydisk axes).  #emph[Let $S$ and $T$ be unit polydisks of positive dimensions. Suppose $alpha : S arrow.r X$ and $beta : T arrow.r X$ are holomorphic maps tangent to $E_1$ and $E_2$, respectively, and $alpha \( p_0 \) = beta \( q_0 \)$ for some $\( p_0 \, q_0 \) in S times T$. There is a unique holomorphic box $F : S times T arrow.r X$ with 
$ F \( p \, q_0 \) = alpha \( p \) \, #h(2em) F \( p_0 \, q \) = beta \( q \) . $

]
] <prop:polydisk-axes>

#proof[
  Polydisk automorphisms reduce the problem to $p_0 = q_0 = 0$. For fixed $\( p \, q \)$, the maps
  $ sigma mapsto alpha \( sigma p \) \, #h(2em) tau mapsto beta \( tau q \) $
  are holomorphic on disks of radii greater than one. After rescaling, Proposition 9 gives a box whose restriction to the closed real square is denoted by $R_(p \, q)$. Set
  $ F \( p \, q \) = R_(p \, q) \( 1 \, 1 \) . $
  The constant-axis cases and Lemma 10 give the prescribed axis values. It remains to prove holomorphicity and the two tangencies; pointwise existence of $R_(p \, q)$ alone does not give parameter continuity.
  Fix $\( p_(*) \, q_(*) \)$, and choose a finite grid whose closed tile images under $R_(p_(*) \, q_(*))$ lie in product charts. We reconstruct this square for nearby $\( p \, q \)$, using these fixed charts. Begin with its two given axes, and process tiles from the bottom and left. The induction maintains the following properties: each constructed tile depends jointly continuously on its real parameters and on $\( p \, q \)$; it is a continuous box in the real parameters; and, at each fixed pair of real parameters, it is holomorphic in $\( p \, q \)$, with the $p$-directions in $E_1$ and the $q$-directions in $E_2$. These properties hold on the initial axes.
  To fill one tile, denote its already constructed bottom and left edges by $B \( sigma \; p \, q \)$ and $L \( tau \; p \, q \)$. At the reference parameter their images lie in the selected product chart $z = \( z_1 \, z_2 \)$. Joint continuity and compactness of those edges put both images in that same chart after shrinking the parameter neighborhood. Define the tile by
  #[#set math.equation(numbering: n => "(5.1)")
   $ z^(- 1) #scale(x: 120%, y: 120%)[\(] z_1 \( B \( sigma \; p \, q \) \) \, z_2 \( L \( tau \; p \, q \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:parameter-tile>]
  The edges meet at a common corner. Plaque constancy on each edge shows that this formula reproduces both of them. It is jointly continuous and is separated in $sigma \, tau$. For each fixed $sigma \, tau$, it is holomorphic in $\( p \, q \)$; moreover, the induction hypothesis gives
  $ partial_q #scale(x: 120%, y: 120%)[\(] z_1 compose B #scale(x: 120%, y: 120%)[\)] = 0 \, #h(2em) partial_p #scale(x: 120%, y: 120%)[\(] z_2 compose L #scale(x: 120%, y: 120%)[\)] = 0 . $
  Thus the two parameter tangencies are preserved as well. At $\( p_(*) \, q_(*) \)$, the reconstructed tile is the original tile, so the induction continues. There are only finitely many tiles and therefore only finitely many shrinkings.
  The tile maps agree on common edges and form a continuous box across the seams. To check the latter assertion at a seam or a vertex, use a product chart around its common image. On a sufficiently small real neighborhood, the unwanted coordinate along a horizontal or vertical slice is constant on each tile piece and agrees at their endpoints; it is therefore constant across the seam. By Lemma 10, the reconstructed square is $R_(p \, q)$ for every nearby parameter pair. Its upper-right value is consequently $F \( p \, q \)$, proving that $F$ is a holomorphic box near $\( p_(*) \, q_(*) \)$, and hence everywhere. Finally, the axes determine its germ at $\( 0 \, 0 \)$, so the identity theorem proves uniqueness. ◻
]

== 6 Path rectangles and the universal cover <sec:global>

We now turn the holomorphic box theorem into continuation along arbitrary continuous paths. The important point is that a transported edge retains a holomorphic parametrization on an entire polydisk. Its image need not remain small or lie in a single original chart.

#thm([Proposition 6.1.])[
  (Path rectangles).  #emph[The following assertions hold.]
  + #emph[If $alpha \, beta : \[ 0 \, 1 \] arrow.r X$ locally follow $E_1$- and $E_2$-plaques, respectively, and $alpha \( 0 \) = beta \( 0 \)$, there is a continuous box $R : \[ 0 \, 1 \]^2 arrow.r X$ with $R \( s \, 0 \) = alpha \( s \)$ and $R \( 0 \, t \) = beta \( t \)$.]
  + #emph[Every continuous path $gamma : \[ 0 \, 1 \] arrow.r X$ is the diagonal of a continuous box: $R \( s \, s \) = gamma \( s \)$.]
] <prop:rectangles>

#proof[
  For the first assertion, subdivide the horizontal interval into pieces $I_i = \[ u_(i - 1) \, u_i \]$ and the vertical interval into pieces $J_j = \[ v_(j - 1) \, v_j \]$ on which the respective paths lie in single plaques. Each horizontal piece has a representation
  $ alpha \( s \) = A_i \( a_i \( s \) \) \, #h(2em) s in I_i \, $
  where $a_i : I_i arrow.r bb(D)^(r_1)$ is continuous and $A_i : bb(D)^(r_1) arrow.r X$ is a holomorphic plaque parametrization tangent to $E_1$. Similarly write $beta \( t \) = B_j \( b_j \( t \) \)$, with $b_j : J_j arrow.r bb(D)^(r_2)$ continuous and $B_j$ holomorphic and tangent to $E_2$. Here $r_i = "rank" E_i$.
  Fill the tiles $I_i times J_j$ from the bottom and left. Inductively, the known edges of a tile have the forms $A \( a_i \( s \) \)$ and $B \( b_j \( t \) \)$, where $A$ and $B$ are holomorphic on the #emph[entire] polydisks $bb(D)^(r_1)$ and $bb(D)^(r_2)$, tangent to the respective bundles. They agree at their common corner. Apply Proposition 11 with origins $a_i \( u_(i - 1) \)$ and $b_j \( v_(j - 1) \)$, obtaining a holomorphic box $G : bb(D)^(r_1) times bb(D)^(r_2) arrow.r X$. Its evaluation
  $ R \( s \, t \) = G \( a_i \( s \) \, b_j \( t \) \) $
  fills the tile. The opposite horizontal and vertical edges have the holomorphic representatives
  $ a mapsto G \( a \, b_j \( v_j \) \) \, #h(2em) b mapsto G \( a_i \( u_i \) \, b \) \, $
  again on the whole original polydisks. This proves the induction without any shrinking of the edge domains.
  For the second assertion, choose a subdivision $0 = u_0 < dots.h.c < u_N = 1$ such that each $gamma \( I_i \)$, $I_i = \[ u_(i - 1) \, u_i \]$, lies in a product chart with inverse $theta_i : bb(D)^(r_1) times bb(D)^(r_2) arrow.r X$. Write $gamma \( s \) = theta_i \( a_i \( s \) \, b_i \( s \) \)$ on that interval. Define the diagonal tile by
  $ R \( s \, t \) = theta_i \( a_i \( s \) \, b_i \( t \) \) \, #h(2em) \( s \, t \) in I_i^2 . $
  These tiles agree at consecutive diagonal vertices, and their edges have the full-polydisk representations used above.
  Fill the remaining tiles $I_i times I_j$ in successive bands away from the diagonal, that is, in increasing order of $\| i - j \|$. If $i < j$, use the already filled bottom and right edges; if $i > j$, use the top and left edges. The same polydisk box construction works from any corner, since the origins in Proposition 11 are arbitrary. The two input edges have matching corner values: for $\| i - j \| = 1$ this is the prescribed diagonal value, and for $\| i - j \| > 1$ it follows from the intervening tile closer to the diagonal. More explicitly, when $i < j - 1$, the bottom-right corner is shared with the previously filled tile $I_(i + 1) times I_(j - 1)$. The case $i > j + 1$ is symmetric. Tiles filled at the same stage share no edge, and all their shared vertices already lie on prescribed input edges. Thus every tile is consistent with the previously assigned values, and its output edges retain their full-polydisk representatives.
  In either construction, the finite collection of tiles glues continuously. The local plaque condition holds across seams for the same reason as in the proof of Proposition 11: in a product chart near a seam point, the unwanted coordinate is constant on consecutive slice pieces and agrees at their common endpoints. The resulting map is a continuous box. ◻
]

Figure 2 illustrates both filling orders. The transported edges retain their full-polydisk representatives; this, rather than a bound on their image sizes, is what allows each new tile to be filled.

#figure(
  [(430,175) (102,163)(0,0)(a) prescribed axes (322,163)(0,0)(b) prescribed diagonal
  (55,45)
  #line(length: 100%, stroke: 0.6pt)
  (275,45)
  #line(length: 100%, stroke: 0.6pt)
  (305,75)
  #line(length: 100%, stroke: 0.6pt)
  (335,105)
  #line(length: 100%, stroke: 0.6pt)
  (85,45)
  #line(length: 100%, stroke: 0.6pt)
  (305,45)
  #line(length: 100%, stroke: 0.6pt)
  (55,45)(30,0)4(0,1)90 (55,45)(0,30)4(1,0)90 (275,45)(30,0)4(0,1)90 (275,45)(0,30)4(1,0)90 (275,45)(1,1)90  (55,45)(1,0)90 (85,45)(1,0)30 (305,75)(1,0)30  (55,45)(0,1)90 (85,45)(0,1)30 (305,75)(0,-1)30 (85,45) (305,75) (100,60)(0,0)$R$ (320,60)(0,0)$R$ (100,30)(0,0)$alpha \( s \)$ (47,90)(0,0)\[r\]$beta \( t \)$ (155,45)(0,0)$s$ (55,144)(0,0)$t$ (375,45)(0,0)$s$ (275,144)(0,0)$t$ (320,29)(0,0)$R \( s \, s \) = gamma \( s \)$
  (105,5)
  #line(length: 100%, stroke: 0.6pt)
  (120,9)(0,0)\[l\]completed tiles
  (255,5)
  #line(length: 100%, stroke: 0.6pt)
  (270,9)(0,0)\[l\]next tile],
  caption: [Figure 2: The two grid constructions in the parameter square. In (a), the bottom and left axes are prescribed, and tiles are filled in increasing order of the sum of their indices. In (b), the diagonal tiles are prescribed first, and the remaining tiles are filled in successive bands away from the diagonal. In each highlighted tile, the blue horizontal edge and red vertical edge are already known and meet at the marked corner. The box with these axes supplies the other two edges. The reversed red arrow in (b) indicates that the same construction can start at any corner. No target-space size estimate is depicted. ],
) <fig:grid>

Fix a basepoint $o in X$. For $i = 1 \, 2$, let $L_i$ be the leaf through $o$, endowed with its intrinsic plaque topology, not the subspace topology inherited from $X$.

#thm([Lemma 6.2.])[
  (Intrinsic leaves).  #emph[Each $L_i$ is a connected, Hausdorff, second-countable complex manifold of dimension $r_i$, and its inclusion into $X$ is an injective holomorphic immersion. It admits a connected simply connected cover $tilde(L)_i$, also a second-countable complex manifold. A path locally following $E_i$-plaques is continuous in the intrinsic topology of its leaf.]
] <lem:leaves>

#proof[
  The leaf consists of points reachable from $o$ by finite chains of $E_i$-plaques. Plaque coordinates give its complex atlas: near a point of intersection, two plaques through that point coincide, and their coordinate change is holomorphic. The inclusion into $X$ is an injective continuous immersion. In particular, distinct points of the leaf are separated by inverse images of disjoint ambient open sets, so the leaf is Hausdorff. The definition by plaque chains gives path connectedness and the asserted continuity of plaque paths.
  For second countability, take a countable ambient product atlas. Start with a plaque through $o$. For each plaque already reached and each ambient chart, their intersection has at most countably many connected components: it is an open subset of a second-countable plaque. Each component lies in a single plaque of the new chart, since the transverse coordinate is locally constant. Adjoin these plaques and repeat. There are only countably many plaques after all finite stages, and every plaque path from $o$ is covered by a finite chain of this kind. Their countable coordinate bases form a countable basis for the leaf.
  The usual covering-space construction applies because a manifold is locally path connected and semilocally simply connected. Its universal cover is second countable as well. One way to see the latter detail is to refine the countable atlas to simply connected coordinate disks. There are countably many components of their pairwise overlaps. A based loop is described, up to homotopy, by a finite sequence of these charts and overlap components; fixing paths within the charts and components supplies representatives for all such descriptions. Hence the fundamental group is countable. The lifted countable chart basis has only countably many sheets and is therefore a countable basis for the universal cover. Lifting the holomorphic charts gives its complex structure. ◻
]

A product chart at $o$ supplies mutually inverse germs

$ H_o : \( L_1 times L_2 \, \( o \, o \) \) arrow.r \( X \, o \) \, #h(2em) K_o : \( X \, o \) arrow.r \( L_1 times L_2 \, \( o \, o \) \) . $

The first combines coordinates on the two plaques through $o$; the second projects onto them. Separated chart transitions show that the germs do not depend on the chosen product chart. The next result gives analytic continuation in both directions.

#thm([Proposition 6.3.])[
  (Transport of inverse germs).  #emph[Let $R : \[ 0 \, 1 \]^2 arrow.r X$ be a continuous box with $R \( 0 \, 0 \) = o$, and set 
$ alpha \( r \) = R \( r \, 0 \) in L_1 \, #h(2em) beta \( r \) = R \( 0 \, r \) in L_2 \, #h(2em) gamma \( r \) = R \( r \, r \) in X . $

 There are mutually inverse local biholomorphism germs $H_r \, K_r$ at $\( alpha \( r \) \, beta \( r \) \)$ and $gamma \( r \)$, respectively, which give analytic continuation of $H_o$ along $\( alpha \, beta \)$ and of $K_o$ along $gamma$.]
] <prop:germ-transport>

#proof[
  Transport a first-coordinate germ from the $L_1$-plaque at $alpha \( r \)$ along the vertical path $u mapsto R \( r \, r u \)$, $0 lt.eq u lt.eq 1$. To define this transport, subdivide the path into finitely many subsegments lying in product charts, and choose a local separated transition at each junction. Within a subsegment the first coordinate is constant; at a junction it changes by the first-coordinate local biholomorphism of that transition. Their composition transports a variable first coordinate to the endpoint. Refining the subdivision or changing intermediate charts does not change the germ: separated transitions satisfy the cocycle identity. On a common vertical subsegment, the first-coordinate transition germ at the fixed first coordinate is locally constant, since local separated transitions are independent of the second coordinate. It is therefore constant along the connected subsegment. Common refinements identify any two constructions. Similarly, transport a second-coordinate germ from the $L_2$-plaque at $beta \( r \)$ along $u mapsto R \( r u \, r \)$. Combining the two transported coordinates in one product chart at $gamma \( r \)$ gives a local biholomorphism germ $H_r$; let $K_r$ be its inverse.
  We must show genuine analytic continuation, rather than merely continuous dependence of a collection of germs. Fix $r_0$. Choose the finite chart chains for the two reference transport paths, a fixed small overlap neighborhood at each junction, and a common final chart $z$ around $gamma \( r_0 \)$. By joint continuity of $R$, the same compact subsegments lie in the same charts, and the same junctions lie in the same overlap neighborhoods, for all $r$ sufficiently near $r_0$. Also $alpha \( r \)$ and $beta \( r \)$ remain in fixed intrinsic leaf plaques by Lemma 13.
  Use coordinates $a$ and $b$ on those two starting plaques. Every first-coordinate transition in the vertical chain is now one fixed holomorphic map, independent of the second coordinate. After shrinking the initial coordinate neighborhood, their finite composition is a single local biholomorphism $A$ defined near $a \( alpha \( r_0 \) \)$. It describes the transport for every nearby $r$, not just for $r_0$. The horizontal chain similarly gives one fixed second-coordinate local biholomorphism $B$. Consequently one holomorphic map
  #[#set math.equation(numbering: n => "(6.1)")
   $ \( x \, y \) mapsto z^(- 1) #scale(x: 120%, y: 120%)[\(] A \( a \( x \) \) \, B \( b \( y \) \) #scale(x: 120%, y: 120%)[\)] $ <eq:fixed-transport>]
  represents $H_r$ at $\( alpha \( r \) \, beta \( r \) \)$ for every nearby $r$, and sends that point to $gamma \( r \)$. After one further shrinking, its single holomorphic inverse represents all the nearby $K_r$. At $r = 0$, both transport paths are constant, so these germs are precisely $H_o$ and $K_o$. This is the required analytic continuation. ◻
]

#proof[
  Every path from $\( o \, o \)$ in $L_1 times L_2$ consists of two intrinsically continuous leaf paths. Proposition 12 provides a box with these as its axes, and Proposition 14 continues $H_o$ along the given path. Conversely, every path from $o$ in $X$ is the diagonal of a box, so the same two Propositions continue $K_o$ along every such path.
  Let $pi : tilde(X) arrow.r X$ and $q_i : Y_i = tilde(L)_i arrow.r L_i$ be the based connected simply connected covers, and put $q = q_1 times q_2$. The product $Y_1 times Y_2$ is the universal cover of $L_1 times L_2$. The monodromy theorem, applied on these simply connected source covers, gives holomorphic maps
  $ H : Y_1 times Y_2 arrow.r X \, #h(2em) K : tilde(X) arrow.r L_1 times L_2 $
  with the prescribed initial germs. Here the usual monodromy argument applies to manifold-valued holomorphic germs: uniqueness follows from the identity theorem, and finite chains of local representatives are stable under small path variations, so homotopic paths with fixed endpoints produce the same terminal germ.
  Since both source manifolds are simply connected, these maps lift to holomorphic maps
  $ tilde(H) : Y_1 times Y_2 arrow.r tilde(X) \, #h(2em) tilde(K) : tilde(X) arrow.r Y_1 times Y_2 . $
  Choose the lifts that send the based points to one another. Their germs there are mutually inverse, because $H_o$ and $K_o$ were inverse. Thus $tilde(H) compose tilde(K)$ and $tilde(K) compose tilde(H)$ agree with the respective identity maps on neighborhoods of the basepoints. The identity theorem on the connected source manifolds makes both compositions identities everywhere. In particular, $Phi = tilde(K)$ is a biholomorphism $tilde(X) tilde.eq Y_1 times Y_2$.
  It remains to retain the specified splitting. Near the basepoint, the initial product chart gives
  $ upright(d) Phi \( pi^(*) E_1 \) subset "pr"_1^(*) T_(Y_1) \, #h(2em) upright(d) Phi \( pi^(*) E_2 \) subset "pr"_2^(*) T_(Y_2) . $
  Equivalently, the two wrong-factor components of $upright(d) Phi$ vanish there. They are holomorphic bundle maps, so they vanish on all of the connected manifold $tilde(X)$. Finally, $upright(d) Phi$ is invertible and $dim_(bb(C)) Y_i = r_i$ by Lemma 13; hence these inclusions are equalities. The factors are connected and simply connected by construction, proving the asserted compatible splitting. ◻
]

== 7 Nef and big canonical bundle: parallelism and integrability <sec:canonical>

Throughout this section, $X$ and $T_X = E_1 xor E_2$ satisfy the hypotheses of Corollary 3; integrability is not assumed. We prove it by an estimate for the second fundamental forms of the summands. This estimate also gives parallelism on the regular canonical locus, the additional input needed for the alternative proof in the appendices.

#thm([Proposition 7.1.])[
  #emph[There is a projective birational morphism with connected fibers 
$ f : X arrow.r Z $

 onto a normal projective variety with canonical singularities and ample $upright(bold(Q))$-Cartier canonical divisor. Moreover, $K_X = f^(*) K_Z$, and $f$ is an isomorphism over $Z_(upright("reg"))$.]
] <canon:contraction>

#proof[
  The base-point-free theorem applies to $D = K_X$: $D$ is nef and $a D - K_X = \( a - 1 \) K_X$ is nef and big for an integer $a > 1$ [23] Theorem 3.3. The associated contraction, with its Stein factorization, has normal projective target and connected fibers. For some positive integer $m$ and ample line bundle $L$ on $Z$,
  $ cal(O)_X \( m K_X \) tilde.eq f^(*) L . $
  Bigness makes $f$ generically finite; connected fibers then make it birational. A proper birational morphism onto a normal variety is an isomorphism over an open set whose complement has codimension at least two. On this open set $L$ agrees with $cal(O)_Z \( m K_Z \)$. Reflexive extension therefore identifies $L$ with $cal(O)_Z \( m K_Z \)$ everywhere. Thus $K_Z$ is $upright(bold(Q))$-Cartier and ample.
  Choose compatible canonical divisors. The divisor $K_X - f^(*) K_Z$ is exceptional and $upright(bold(Q))$-linearly trivial. A principal exceptional divisor is zero: the corresponding rational function has no divisor on the normal projective variety $Z$, hence is constant. Consequently $K_X = f^(*) K_Z$. The discrepancies on any higher resolution are nonnegative because $X$ is smooth, so $Z$ has canonical, and in particular klt, singularities.
  Over $Z_(upright("reg"))$, the relative Jacobian has zero divisor. It is therefore nowhere zero, and $f$ is a local biholomorphism there. Properness and birationality imply that this restriction is an isomorphism. ◻
]

Set

$ X^0 = f^(- 1) \( Z_(upright("reg")) \) . $

This is a connected dense open subset of $X$; we identify it with $Z_(upright("reg"))$. Our convention is $"Ric" \( omega \) = - sqrt(- 1) thin partial macron(partial) log omega^n$, so $\[ "Ric" \( omega \) \] = 2 pi c_1 \( X \)$.

#thm([Lemma 7.2.])[
  (The canonical metric).  #emph[Fix a Kähler form $omega_A$ from a polarization of $X$. There are smooth Kähler metrics $g_epsilon$ on $X$, for $0 < epsilon < 1$, whose forms satisfy 
$ "Ric" \( omega_epsilon \) = - omega_epsilon + epsilon omega_A \, #h(2em) \[ omega_epsilon \] = 2 pi c_1 \( K_X \) + epsilon \[ omega_A \] . $

 As $epsilon arrow.r 0$, they converge smoothly on compact subsets of $X^0$ to a Kähler metric $g$ with $"Ric" \( g \) = - g$. The completion of the intrinsic Riemannian distance of $\( X^0 \, g \)$ is naturally homeomorphic to $Z$.]
] <canon:metric-input>

#proof[
  Proposition 15 makes $f$ a smooth projective crepant resolution of a canonical model. The completion statement is [29] Theorem 1.2. The approximating metrics and their smooth convergence are [29] Equation (4.28) and Lemma 4.1, with $epsilon = e^(- t)$. The cohomology identity follows directly from the Ricci equation. ◻
]

#thm([Proposition 7.3.])[
  #emph[The connection of $g$ preserves both $E_1 \|_(X^0)$ and $E_2 \|_(X^0)$. Both subbundles are integrable on all of $X$. They admit simultaneous local holomorphic product coordinates.]
] <canon:parallel>

#proof[
  We use the subbundle-curvature method of approximate Kähler–Einstein geometry, developed in the stability results of Enoki [15] and used for parallel splittings by Guenancia [17] Section 3.4, Step 4, Equations (3.12)–(3.13). Here the equality of the two summands’ total first Chern class with $c_1 \( T_X \)$ gives a direct cancellation. Give $T_X$ the Hermitian metric induced by $g_epsilon$. Let $P_(j \, epsilon)$ be orthogonal projection onto $E_j$, and let $B_(j \, epsilon)$ be its second fundamental form. These orthogonal projections need not be projections along the specified complementary summands.
  Write $F_V$ for the Chern curvature of a Hermitian bundle $V$. The subbundle curvature formula gives
  $ "tr" #h(-0.16667em) (sqrt(- 1) Lambda_(omega_epsilon) F_(E_j)) = "tr" #h(-0.16667em) (P_(j \, epsilon) sqrt(- 1) Lambda_(omega_epsilon) F_(T_X)) - \| B_(j \, epsilon) \|^2 . $
  Here and below the second fundamental forms have their complex Hermitian norms. This formula follows by writing the connection in blocks for $E_j xor E_j^perp$; the off-diagonal blocks are $B_(j \, epsilon)$ and $- B_(j \, epsilon)^(*)$. In the Kähler case the mean curvature endomorphism $sqrt(- 1) Lambda_(omega_epsilon) F_(T_X)$ is the Ricci endomorphism
  $ H_epsilon = - I + epsilon A_epsilon \, #h(2em) A_epsilon = omega_epsilon^(- 1) omega_A > 0 . $
  Integrating the trace formula computes first Chern degrees. Since $c_1 \( E_1 \) + c_1 \( E_2 \) = c_1 \( T_X \)$, and writing $d V_epsilon = omega_epsilon^n \/ n !$, we obtain
  $ integral_X sum_(j = 1)^2 \| B_(j \, epsilon) \|^2 thin d V_epsilon = integral_X "tr" \( C_epsilon H_epsilon \) thin d V_epsilon \, #h(2em) C_epsilon = P_(1 \, epsilon) + P_(2 \, epsilon) - I . $
  The ranks add to $n$, so $"tr" C_epsilon = 0$. Moreover $- I lt.eq C_epsilon lt.eq I$, since each $P_(j \, epsilon)$ is an orthogonal projection. Positivity of $A_epsilon$ therefore gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ 0 & lt.eq integral_X sum_j \| B_(j \, epsilon) \|^2 thin d V_epsilon lt.eq epsilon integral_X "tr" \( A_epsilon \) thin d V_epsilon\
 & = frac(epsilon, \( n - 1 \) !) integral_X omega_A and omega_epsilon^(n - 1) = O \( epsilon \) . $ <canon:energy>]
  The last integral is a bounded polynomial in $epsilon$, by Lemma 16. No angle bound between the summands is used.
  On compact subsets of $X^0$, the metrics, their connections, the orthogonal projections, and the second fundamental forms converge smoothly. A nonzero limiting second fundamental form would have a fixed positive integral on some compact neighborhood, contradicting (7.1). Both limiting second fundamental forms are therefore zero.
  The connection of a Kähler metric is torsion-free. Hence each summand is integrable on $X^0$. Its Frobenius obstruction
  $ Lambda^2 E_j arrow.r T_X \/ E_j \, #h(2em) u and v mapsto \[ u \, v \] med mod med E_j \, $
  is a holomorphic bundle morphism on $X$. It vanishes on the dense open set $X^0$, hence everywhere. Local Frobenius submersions for the two complementary foliations, taken together, give holomorphic coordinates $\( z \, w \)$ in which the summands are the $z$- and $w$-directions. Transitions between such charts locally preserve the two factors. ◻
]

#proof[
  A smooth projective complex manifold is compact Kähler. By Proposition 17, the supplied summands are integrable. Theorem 1 therefore applies and gives precisely the compatible product claimed in the corollary. ◻
]

The argument just given uses the canonical metric only to establish integrability. The appendices retain a second route to the global product: the metric completion controls the size of crossings near an entire exceptional fibre, while rational curves provide their holomorphic continuation. The parallelism proved here is needed for that metric argument, even though integrability alone also follows from [19] Theorem 1.3.

== 8 The canonical distance and its fibres <app:collapsed>

This appendix begins an alternative proof of the nef-and-big application, Corollary 3. It uses the canonical metric and the geometry of its collapsed fibres, rather than the holomorphic box-extension theorem used in the proof of Theorem 1. The three subsequent appendices construct crossings around each whole fibre, prove that these crossings do not increase the canonical distance in either variable, and use that estimate to fill finite grids along arbitrary paths.

Let $X$ satisfy the hypotheses of Corollary 3. Proposition 15 gives the crepant canonical morphism $f : X arrow.r Z$, and Lemma 16 gives its limiting Kähler–Einstein metric $g$ on $X^0 = f^(- 1) \( Z_(upright("reg")) \)$. By Proposition 17, the supplied summands are parallel on $X^0$ and integrable on all of $X$. We first make them orthogonal without changing the completion, then establish the two topological properties of the fibres that the crossing argument needs.

#thm([Proposition 8.1.])[
  #emph[There is a real-analytic Kähler metric $h$ on $X^0$, uniformly equivalent to $g$, for which the given splitting is orthogonal and locally a Riemannian product. Its intrinsic distance completion is canonically homeomorphic to $Z$. Denoting the resulting distance on $Z$ by $rho$, the function 
#[#set math.equation(numbering: n => "(8.1)")
 $ d \( x \, y \) = rho \( f \( x \) \, f \( y \) \) $ <canon:d>]

 is a continuous pseudodistance on $X$, and $d \( x \, y \) = 0$ exactly when $f \( x \) = f \( y \)$.]
] <canon:pseudodistance>

#proof[
  Let $Q_j : T_X arrow.r E_j$ denote projection along the other supplied summand, and define
  $ h \( v \, w \) = g \( Q_1 v \, Q_1 w \) + g \( Q_2 v \, Q_2 w \) . $
  Proposition 17 implies $nabla^g Q_j = 0$, hence $nabla^g h = 0$. Thus $nabla^g$ is also the Levi-Civita connection of $h$. It preserves the complex structure, so $h$ is Kähler.
  The positive $g$-self-adjoint endomorphism representing $h$ is parallel. Its eigenvalues are constant on connected $X^0$. Consequently there are global positive constants $a \, b$ such that
  $ a g lt.eq h lt.eq b g . $
  In local product coordinates, first- and second-factor real coordinate fields $V \, W$ commute. The equality $nabla_V W = nabla_W V$, together with preservation of the complementary summands, makes both sides zero. Since $nabla h = 0$, the first block of $h$ depends only on first coordinates and the second block only on second coordinates.
  A Kähler–Einstein metric is real analytic in holomorphic coordinates and their conjugates [11] Theorem 6.1(c). The $Q_j$ are holomorphic, so the displayed formula for $h$ proves its real analyticity.
  Uniform equivalence of the metrics makes the identity on $X^0$ bi-Lipschitz for their intrinsic distances. It therefore extends uniquely to a bi-Lipschitz homeomorphism of their completions. Lemma 16 identifies that completion with $Z$, extending the given identification on $X^0$. The assertions about $d$ follow from continuity of $f$ and from $rho$ being a distance. ◻
]

#thm([Lemma 8.2.])[
  #emph[For every $z in Z$, the reduced fiber $P = f^(- 1) \( z \)_(upright("red"))$ is a compact connected projective algebraic set. Any two points of $P$ are joined inside $P$ by a chain of images of rational curves, and $pi_1 \( P \) = 1$ in the ordinary complex topology.]
] <canon:fibers>

#proof[
  Projectivity and connectedness follow from the construction of $f$. The rational-chain assertion is the fiber theorem for resolutions of klt varieties [18] Corollary 1.6, arXiv v2.
  For simple connectedness we use the resolution-fiber consequence of Takayama’s local argument: the fiber of a proper birational morphism from a smooth complex variety to a klt variety is simply connected in the ordinary topology [30] Theorem 1.1 and the first paragraph on p. 829. This consequence is also used explicitly in [25] proof of Theorem 3.10, arXiv v4. Here $X$ is smooth and $Z$ is klt by Proposition 15, so it applies to $f : X arrow.r Z$ and gives $pi_1 \( f^(- 1) \( z \) \) = 1$. Replacing the fiber by its reduction does not change its underlying topological space, hence $pi_1 \( P \) = 1$. ◻
]

The two conclusions of Lemma 19 have distinct roles. Rational chains will supply continuation routes, whereas ordinary simple connectedness will remove their monodromy. The latter conclusion is not inferred from rational chain connectedness of a possibly singular fibre.

== 9 Rational boxes and ambient crossing germs <app:rational>

Our immediate objective is to continue ordinary local crossing along rational trees, with enough information to retain a holomorphic germ on the ambient manifold at every parameter pair. Throughout this appendix, $M$ is a smooth projective complex manifold with a holomorphic splitting

$ T_M = E_1 xor E_2 $

into integrable subbundles. Write $cal(F)_i$ for the corresponding regular foliations. Frobenius submersions for the two foliations, taken together, give holomorphic product charts $z = \( z_1 \, z_2 \)$ in which $E_i$ is the $i$th coordinate distribution. Changes between these charts have, locally, the form

$ \( z_1 \, z_2 \) mapsto #scale(x: 120%, y: 120%)[\(] F \( z_1 \) \, G \( z_2 \) #scale(x: 120%, y: 120%)[\)] . $

Consequently the local crossing

#[#set math.equation(numbering: n => "(9.1)")
 $ kappa \( x \, y \) = z^(- 1) #scale(x: 120%, y: 120%)[\(] z_1 \( x \) \, z_2 \( y \) #scale(x: 120%, y: 120%)[\)] $ <rat:local-crossing>]

is independent, as a germ along the diagonal, of the product chart. Our eventual application, Theorem 25, requires continuation of these #emph[ambient] germs, rather than just crossing values on curves.

#prodef([Definition 9.1.])[
  Let $A \, B$ be locally path connected spaces. A continuous map $R : A times B arrow.r M$ is a #emph[box] if, near every parameter pair, there are a product neighborhood $A' times B'$ and a product chart on its image in which
  $ z #scale(x: 120%, y: 120%)[\(] R \( a \, b \) #scale(x: 120%, y: 120%)[\)] = #scale(x: 120%, y: 120%)[\(] r_1 \( a \) \, r_2 \( b \) #scale(x: 120%, y: 120%)[\)] . $
  Thus first-parameter slices locally follow $cal(F)_1$ plaques and second-parameter slices locally follow $cal(F)_2$ plaques. In particular these slices are continuous into their leaves with the leaf topology. A #emph[rational tree] is a connected nodal curve whose irreducible components are copies of $bb(P)^1$ and whose dual graph is a finite tree.
] <rat:definition>

For continuous maps on products of rational trees, holomorphic on each product of components, the box condition follows from the corresponding separate tangencies. Indeed, in a product chart each wrong-coordinate function is constant on every branch of its parameter slice; continuity makes these constants agree at a node.

The local charts agree with those of Section 2; the definition here also allows singular and merely topological parameter spaces. We recall two elementary facts about holonomy in this setting. A continuous plaque-wise path in an $cal(F)_2$ leaf transports first transverse coordinates by composing the first-coordinate changes in a finite chain of product charts. This gives a biholomorphic germ between first transversals. Reversing the path gives the inverse germ. The germ is unchanged under a leafwise homotopy with fixed endpoints: subdivide the compact homotopy square into pieces mapping into foliation charts, and cancel the transverse changes around their boundaries. The same statements hold with the two foliations interchanged.

#thm([Lemma 9.2.])[
  (Germs supplied by a box).  #emph[Let $T$ be a rational tree or an interval, let $R : T times T arrow.r M$ be a box, and put $u \( s \) = R \( s \, s \)$. There is a coherent family of holomorphic map germs 
$ c_(s \, t) : \( M times M \, \( u \( s \) \, u \( t \) \) \) arrow.r \( M \, R \( s \, t \) \) $

 which agrees with ordinary crossing when $s = t$ and satisfies 
#[#set math.equation(numbering: n => "(9.2)")
 $ upright(d)_1 c_(s \, t) \( T_M \) & subset E_1 \, & #h(2em) upright(d)_1 c_(s \, t) \( E_2 \) & = 0 \,\
upright(d)_2 c_(s \, t) \( T_M \) & subset E_2 \, & #h(2em) upright(d)_2 c_(s \, t) \( E_1 \) & = 0 . $ <rat:differential>]

 Here coherence means that near each parameter pair a single ambient holomorphic map represents all the nearby germs. This family is unique among coherent families agreeing with ordinary crossing on the diagonal.]
] <rat:germs>

#proof[
  Fix $s \, t$ and a path $gamma$ in $T$ from $s$ to $t$. Set $p = u \( s \)$, $q = u \( t \)$ and $r = R \( s \, t \)$, and choose product charts $z \, zeta \, w$ at $p \, q \, r$, respectively. The path $R \( s \, gamma \)$ runs from $p$ to $r$ in an $cal(F)_2$ leaf. Its holonomy gives a first-coordinate germ $h_1 : z_1 arrow.r w_1$. Similarly, $R \( gamma^(- 1) \, t \)$ gives a second-coordinate germ $h_2 : zeta_2 arrow.r w_2$. Define
  #[#set math.equation(numbering: n => "(9.3)")
   $ c_(s \, t) \( x \, y \) = w^(- 1) #scale(x: 120%, y: 120%)[\(] h_1 \( z_1 \( x \) \) \, h_2 \( zeta_2 \( y \) \) #scale(x: 120%, y: 120%)[\)] . $ <rat:germ-formula>]
  Chart changes cancel in this formula, and (9.2) follows immediately. Both slices are continuous into their leaves. Since $T$ is simply connected, two choices of $gamma$ give fixed-endpoint leafwise homotopies, so the formula is independent of this choice.
  For completeness, coherence concerns the entire formula, not merely its value. Choose finite chains of product charts along $R \( s \, gamma \)$ and $R \( gamma^(- 1) \, t \)$ realizing $h_1 \, h_2$. For $s'$ near $s$ and $t'$ near $t$, continuity on these compact paths ensures that the same chains apply to $R \( s' \, gamma \)$ and $R \( gamma^(- 1) \, t' \)$. Join $s'$ to $s$ and $t$ to $t'$ inside small connected parameter neighborhoods. All the resulting endpoint segments lie in the endpoint product charts, so introduce no additional transverse-coordinate change. The same holomorphic representative (9.3) therefore represents $c_(s' \, t')$. At a node one uses a small star neighborhood and connectors through the node; no differentiability of the parameters is involved.
  When $s = t$, choose the constant path to recover (9.1). Finally, a coherent family is analytic continuation along paths in the connected space $T times T$ of its germ at any chosen diagonal parameter. Uniqueness of continuation of ambient holomorphic germs proves the asserted uniqueness. ◻
]

#prodef([Remark 9.3.])[
  Coherence in Lemma 21 is local over the parameter space. Distinct parameter pairs with the same ambient input need not yet give the same germ. That identification is the purpose of the monodromy argument in Theorem 25. Likewise, the value and (9.2) alone do not specify an ambient germ.
] <rat:coherence>

#thm([Lemma 9.4.])[
  (Extension of a rational box).  #emph[Put $S = bb(P)^1 times bb(P)^1$. A holomorphic box on a neighborhood of the diagonal, or of the union 
$ D = \( bb(P)^1 times { t_0 } \) union \( { s_0 } times bb(P)^1 \) \, $

 extends uniquely to a holomorphic box on $S$.]
] <rat:extension>

#proof[
  In either case the divisor has class $\( 1 \, 1 \)$ and is a hyperplane section of the Segre embedding of $S$. Its complement $V$ is therefore a smooth affine, hence Stein, surface. Shrink the given neighborhood to a connected neighborhood $W$ of the divisor. Removing a complex hypersurface does not disconnect $W$, so $W \\ D$ is connected, where here $D$ also denotes the diagonal in the first case. The set $K = S \\ W$ is compact in $V$, and $V \\ K = W \\ D$. Meromorphic Hartogs extension on Stein surfaces, in the form of [24] Theorem 2.2, extends meromorphic functions from $V \\ K$ to $V$.
  Embed $M$ in projective space and choose a coordinate hyperplane not containing the image of the given map. Extend its projective coordinate ratios and glue to their original values on $W$. They define a meromorphic map $F : S arrow.r.dashed M$: the equations of the embedded $M$ hold on $W$ and hence identically. The two slice tangencies also persist on the holomorphic locus by the identity theorem.
  The meromorphic graph is a closed analytic subset of the projective manifold $S times M$, so it is algebraic by Chow’s theorem [28] Proposition 13. Thus $F$ is a rational map. Clearing the poles of its finitely many projective coordinate ratios expresses it by a finite-dimensional linear system on $S$. Remove the fixed divisorial part of this system and resolve its base ideal by point blowups. This is the classical surface elimination-of-indeterminacy argument [1]; the local intersection calculation gives termination in the present setting. Successively blow up the remaining basepoints: the local intersection number of two general members of the resulting linear system drops by their positive multiplicity product at each unresolved basepoint. The finite sum of these intersection numbers therefore forces termination. This gives $mu : hat(S) arrow.r S$ and a holomorphic map $H : hat(S) arrow.r M$. We show that every exceptional curve is contracted by $H$. At a generic point of an exceptional component $C$ over $\( s_0 \, t_0 \)$, choose coordinates $\( x \, y \)$ with $C = { x = 0 }$. For local product coordinates $s \, t$ downstairs, write
  $ s compose mu - s_0 = x^a U \( x \, y \) \, #h(2em) t compose mu - t_0 = x^b V \( x \, y \) \, $
  where $a \, b > 0$ and $U \, V$ are units. The holomorphic vector fields
  $ W_s = - x U_y partial_x + \( a U + x U_x \) partial_y \, #h(2em) W_t = - x V_y partial_x + \( b V + x V_x \) partial_y $
  annihilate $upright(d) \( s compose mu \)$ and $upright(d) \( t compose mu \)$, respectively. Off the exceptional locus, slice tangency gives
  $ upright(d) H \( W_s \) in E_2 \, #h(2em) upright(d) H \( W_t \) in E_1 . $
  These inclusions extend holomorphically to $C$. There both vector fields are nonzero multiples of $partial_y$, whence
  $ upright(d) H \( T_C \) subset E_1 ∩ E_2 = 0 . $
  Thus $H$ is constant on each exceptional component. Fibers of $mu$ are connected, so each whole fiber has a single image. Around this image choose a target coordinate chart; properness gives a neighborhood downstairs whose inverse image maps into the chart. Its coordinate functions descend holomorphically, since $mu_(*) cal(O)_(hat(S)) = cal(O)_S$, equivalently by removal of the isolated singularity downstairs. Hence $F$ is holomorphic. Its slice tangencies give the box condition, and uniqueness follows from the identity theorem. ◻
]

We have extended a box from one diagonal or one pair of axes. A rational tree has a unique route between components; this lets us repeat the axes construction without making a new compatibility choice.

#thm([Proposition 9.5.])[
  (Rational boxes).  #emph[For every holomorphic map $u : T arrow.r M$ from a rational tree there is a unique continuous box 
$ R_u : T times T arrow.r M \, #h(2em) R_u \( s \, s \) = u \( s \) \, $

 holomorphic on every product of irreducible components. If a rational tree $T'$ contains $T$ as a subtree and $u' : T' arrow.r M$ extends $u$, then $R_(u') \|_(T times T) = R_u$. The ambient germ families of Lemma 21 agree on this restriction as well.]
] <rat:boxes>

#proof[
  First take $T = bb(P)^1$. Applying local crossing to $u \( s \) \, u \( t \)$ gives coherent holomorphic germs along the diagonal of $S$. Compactness allows them to be glued on a neighborhood of the diagonal: take a finite family of representatives, shrink their domains, and then shrink around the diagonal so that overlapping representatives agree. Lemma 23 gives a box on $S$. In a product chart any box near $\( s \, s \)$ has the form $\( a \( s \) \, b \( t \) \)$; its diagonal specifies both functions. This proves uniqueness near the diagonal and hence on $S$.
  We also need the corresponding construction from axes. Suppose $alpha : bb(P)^1 arrow.r M$ is tangent to $E_1$, $beta : bb(P)^1 arrow.r M$ is tangent to $E_2$, and $alpha \( s_0 \) = beta \( t_0 \)$. Transport the germ of $beta$ at $t_0$ along $alpha$, using $cal(F)_1$ holonomy. There is no path ambiguity: a loop in the parameter sphere contracts, and its image gives a leafwise homotopy. In product charts the resulting map near $\( s \, t_0 \)$ has first coordinate supplied by $alpha \( s \)$ and second coordinate a holomorphic germ in $t$. It is jointly holomorphic and the germs are coherent by the finite-chart argument above. Do the symmetric construction along the other axis. Near their intersection both maps are ordinary crossing, so, after shrinking, they glue on a neighborhood of the axes. Lemma 23 extends the box over $S$. The two prescribed axes determine its germ at $\( s_0 \, t_0 \)$, so the extension is unique. This includes constant curves.
  For a general tree, first construct the box on the square of each component. Proceed through ordered pairs of distinct components by increasing distance in the dual tree. On $C_i times C_j$, prescribe the two axes at the nodes pointing toward each other along the unique component route. These axes have already been defined at smaller distances; they are tangent to $E_1 \, E_2$, respectively, and agree at their corner by the previous edge identifications. Apply the axes construction. Every common edge matches: for two adjacent components, their distances to a fixed third component differ by one, and the common edge is an inward axis for the later pair. The finitely many component maps therefore glue continuously, and their separate tangencies imply the box condition also at nodes.
  The same induction proves uniqueness, first on component squares and then from the inward axes. Restriction to a subtree is consequently $R_u$. To compare its ambient germs, compute the two holonomies along paths lying in $T$. The paths and box values are unchanged in $T'$, so Equation (9.3) gives precisely the same germs. ◻
]

== 10 Crossing near a rationally chain connected set <app:crossing>

The rational boxes now give a crossing map on a neighborhood of an entire projective set. The passage has two tasks: provide continuation along enough paths in the set, and remove path dependence while retaining ambient holomorphic germs. In this appendix $M$ is smooth and projective, and $T_M = E_1 xor E_2$ is an integrable splitting. A set is #emph[joined by rational chains] if every two of its points can be joined inside it by a finite chain of images of $bb(P)^1$.

#thm([Theorem 10.1.])[
  (Neighborhood crossing).  #emph[Let $P subset M$ be a nonempty connected projective algebraic set. Suppose that $P$ is simply connected and joined by rational chains. There are a connected open neighborhood $U$ of $P$ and a holomorphic map $c : U times U arrow.r M$ that agrees near the diagonal with ordinary crossing in product charts. Throughout $U times U$, it satisfies 
#[#set math.equation(numbering: n => "(10.1)")
 $ c \( x \, x \) = x \, #h(2em) upright(d)_1 c \( T_M \) subset E_1 \, quad upright(d)_1 c \( E_2 \) = 0 \,\
upright(d)_2 c \( T_M \) subset E_2 \, quad upright(d)_2 c \( E_1 \) = 0 . $ <cross:identities>]

 The image subbundles in these formulas are evaluated at $c \( x \, y \)$.]
] <thm:crossing>

=== 10.1 Continuation of ambient germs <continuation-of-ambient-germs>

Put $Q = P times P$, fix $p in P$, and write $q_(*) = \( p \, p \)$. All germs below are germs of holomorphic maps from $M times M$ to $M$, even when their basepoints lie in $Q$.

#prodef([Definition 10.2.])[
  A germ over $\( a \, b \) in Q$ is #emph[attained] if it is the crossing germ of Lemma 21 associated to a rational-tree box $R_u$ of Proposition 24, at two distinct smooth marked points $s \, t$ of its parameter tree, with $u \( s \) = a$ and $u \( t \) = b$.
] <cross:attained>

The ordinary crossing at $q_(*)$ is attained using a constant sphere. We do not assume that different realizing trees give the same germ.

#thm([Lemma 10.3.])[
  #emph[Let $k : D arrow.r Q$ be a holomorphic map from a rational tree with distinct smooth markings $m_1 \, m_2$. Every attained germ at $k \( m_1 \)$ continues along the image of any path from $m_1$ to $m_2$. Its terminal germ is attained and is independent of the path in $D$.]
] <cross:tree-path>

#proof[
  Choose a realizing tree $T$ with markings $s \, t$ for the initial germ. Attach two separate copies of $D$ to $T$, identifying their first markings with $s$ and $t$, respectively. Map the copies to $M$ by the two components of $k$. The resulting curve is again a rational tree, and the maps agree at the attachment points. Its box restricts to the original box, including its ambient germs, by the uniqueness and branch compatibility in Proposition 24 and Lemma 21.
  Move the two parameter points along the copies of a path in $D$. Lemma 21 gives exactly the asserted continuation along its image under $k$. Its terminal markings are smooth and distinct, so the terminal germ is attained. All paths between the markings are homotopic in the simply connected tree; the corresponding leafwise holonomy is unchanged. ◻
]

We will use the following elementary stability fact. It applies to holomorphic germs on any complex manifold, with values in another complex manifold.

#thm([Lemma 10.4.])[
  (Stability of continuation).  #emph[Suppose that a germ continues along a continuous path $gamma : \[ 0 \, 1 \] arrow.r N$ in a complex manifold $N$. There are a representative of its terminal germ and a uniform neighborhood of $gamma$ in the space of paths starting at $gamma \( 0 \)$ such that continuation along every path in that neighborhood exists and ends in that representative.]
] <cross:stability>

#proof[
  Choose a finite subdivision and holomorphic representatives on open neighborhoods of the compact subpaths. Consecutive representatives agree on an open neighborhood of each subdivision point. After shrinking the subpath neighborhoods and these overlaps, every sufficiently uniformly close path stays in the same domains and crosses through the same equality overlaps. The same finite chain of representatives works. ◻
]

Continuation along a fixed path from a fixed germ is unique. Indeed, two continuation chains that agree initially agree locally at the first possible separation point, by the identity theorem in overlapping ambient neighborhoods. This also proves that continuation along a path followed by its reverse returns the initial germ.

=== 10.2 A compact family of rational routes <a-compact-family-of-rational-routes>

Embed $Q$ in a projective space $bb(P)^N$. We use the following standard properties of genus-zero stable maps: fixed-degree spaces with three markings have projective coarse moduli spaces; evaluations are algebraic; maps factoring through a fixed projective subscheme form a closed locus; and locally the projective-space moduli problem has finite-quotient charts with universal families of nodal curves. These statements follow from Fulton–Pandharipande [16] Theorem 1, Proposition 3, and Sections 1.3, 4.1, 4.4, and 5.1. For the local families we always use the ambient target $bb(P)^N$, which is convex, and restrict to the locus of maps into $Q$.

#thm([Lemma 10.5.])[
  #emph[There is a compact semialgebraic space $S_(*)$ of three-pointed rational-tree maps into $Q$ whose first evaluation is $q_(*)$ and whose second evaluation 
$ e : S_(*) arrow.r Q $

 is surjective.]
] <cross:parameter-space>

#proof[
  For each degree $d gt.eq 0$, take the closed locus $S_d$ in $overline(M)_(0 \, 3) \( bb(P)^N \, d \)$ of maps into $Q$ with first evaluation $q_(*)$. Its second evaluation image $F_d$ is closed algebraic. Every point of $Q$ lies in some $F_d$: join it to $q_(*)$ by moving first in one factor and then in the other along rational chains. Represent the chain by a rational tree. Insert contracted components if needed to put the endpoints at distinct smooth markings, add a third marking, and stabilize. This does not change the endpoint evaluations.
  Write $Q = Q_1 union dots.h.c union Q_r$ for its irreducible components. For each $i$,
  $ Q_i = union.big_(d gt.eq 0) \( Q_i ∩ F_d \) . $
  If none of the $F_d$ contained $Q_i$, this would express the compact complex variety $Q_i$ as a countable union of closed nowhere dense sets, contradicting the Baire category theorem. Choose $d_i$ with $Q_i subset F_(d_i)$. The disjoint union of the finitely many spaces $S_(d_i)$, omitting repetitions, is the required $S_(*)$. ◻
]

#thm([Lemma 10.6.])[
  (Routes in a degenerating tree).  #emph[Fix a stable-map parameter in $S_(*)$ and a path between its first two markings, chosen along smooth component arcs and through the intervening nodes. For every sufficiently nearby parameter one can choose a path between its corresponding markings whose image in $Q$, after parametrization on $\[ 0 \, 1 \]$, is uniformly as close as desired to the fixed image path.]
] <cross:nearby-routes>

#proof[
  Choose a representative of the limiting stable map in a local finite-quotient chart with a family. A finite quotient map is open, so nearby coarse parameters admit representatives close to this one; no continuous choice is required.
  Follow the finite component route between the markings. Away from small segments around its nodes, finitely many relative smooth charts move the chosen arcs to nearby fibers, with the prescribed marked ends. At a node the family is locally $x y = a$, where $a$ is a function of the parameter. The incoming and outgoing nearby pieces can be joined within an arbitrarily small plumbing neighborhood when $a$ is small; the same assertion holds for $a = 0$. The family map is continuous, so all images in that neighborhood lie close to the limiting nodal value. Parametrize these joining pieces on the corresponding small subintervals. The resulting paths have uniformly close images. Contracted components cause no difficulty, since their limiting images are constant. Restricting the parameter locus to maps into $Q$ keeps all these image paths inside $Q$. ◻
]

#thm([Lemma 10.7.])[
  #emph[Every continuous semialgebraic path $sigma : \[ 0 \, 1 \] arrow.r Q$ has a finite subdivision such that on each closed subinterval it admits a continuous lift to $S_(*)$. Lifts on consecutive subintervals need not agree at their common endpoint.]
] <cross:semialgebraic-lift>

#proof[
  Semialgebraic choice applied to
  $ { \( t \, s \) in \[ 0 \, 1 \] times S_(*) : e \( s \) = sigma \( t \) } arrow.r \[ 0 \, 1 \] $
  gives a semialgebraic section. It is continuous on finitely many open subintervals. Compactness of $S_(*)$ and one-variable semialgebraic monotonicity give one-sided limits at every endpoint. Continuity of $e$ makes those limits lift the correct endpoint values. Extend each interval lift by its one-sided limits. We use the standard semialgebraic choice and one-variable finiteness results in [7] Theorems 2.1, 3.1, and 3.4; see also [3]. ◻
]

=== 10.3 Monodromy and an actual neighborhood <monodromy-and-an-actual-neighborhood>

#thm([Lemma 10.8.])[
  #emph[Every attained germ continues along every continuous semialgebraic path in $Q$ starting at its basepoint, and the terminal germ is attained.]
] <cross:all-paths>

#proof[
  Use Lemma 31 and consider one lifted interval $\[ a \, b \]$, with prescribed attained germ $g_a$ at $sigma \( a \)$. Continue $g_a$ backwards along a marked route in the tree at $a$, obtaining an attained germ $h$ at $q_(*)$ by Lemma 27. For each $t in \[ a \, b \]$, continue this #emph[fixed] germ $h$ forwards through the tree over $t$, and denote the endpoint germ by $g_t$. The choice of route does not affect it. At $t = a$, reverse-path uniqueness gives the prescribed $g_a$.
  For $t$ near any $t_0$, Lemma 30 permits uniformly close image routes from the common point $q_(*)$. Lemma 28 then supplies one ambient representative giving all $g_t$ near $t_0$. Thus these germs are analytic continuation along $sigma$ on the whole interval. Each is attained by Lemma 27. Repeat from the terminal germ on the next interval. The intermediate germ $h$ at $q_(*)$ is not assumed to be the original ordinary crossing; only its being fixed on the current interval is used. ◻
]

#proof[
  The compact family of routes has supplied continuation along every semialgebraic path, including through singularities and changes of component. It remains to identify the terminal germs and glue them. Triangulate $Q$ semialgebraically [7] Theorem 4.4. Since $P$ is simply connected, so is $Q$. Start with the ordinary crossing germ at $q_(*)$, and continue it along piecewise linear paths in the triangulation. These paths are semialgebraic in $Q$, so Lemma 32 applies. Any two such paths with the same endpoints are homotopic relative endpoints through paths with semialgebraic slices: apply relative piecewise linear approximation to a nullhomotopy in the finite triangulation. For a fixed slice, compact-path stability (Lemma 28) and uniform continuity of the homotopy show that nearby slices have the same terminal germ. The terminal germ is consequently constant throughout the homotopy. We obtain well-defined ambient germs at every point of $Q$.
  These germs are locally coherent along $Q$. Indeed, choose a small relative path-connected neighborhood of an endpoint inside the domain of its representative. Appending small paths that are piecewise linear in the fixed semialgebraic triangulation, after subdivision, and lie in that neighborhood shows that the same representative gives the assigned germs there. Such neighborhoods are available from the triangulation.
  For completeness, this coherent family has a representative on an actual neighborhood of $Q$. Choose finitely many representatives $c_i : V_i arrow.r M$ giving the family on $Q ∩ V_i$, and smaller open sets $W_i$ with compact closures in $V_i$, still covering $Q$. On $V_i ∩ V_j$, the set where the germs of $c_i \, c_j$ agree is a union of connected components, by the identity theorem. Its complement is therefore relatively closed. The compact sets
  $ B_(i j) = { x in overline(W)_i ∩ overline(W)_j : \( c_i \)_x eq.not \( c_j \)_x } $
  are disjoint from $Q$. Removing their finite union and restricting to $union.big_i W_i$ gives a neighborhood of $Q$ on which the representatives glue holomorphically. Notice that equality here is equality of #emph[ambient germs], not merely of values on $Q$.
  Compactness of $P$ gives an open neighborhood $U$ of $P$ whose square lies in this domain. Since $P$ is connected, take the connected component of $U$ containing it. The glued map restricts to $c : U times U arrow.r M$. Its differential identities in (10.1) hold near $\( p \, p \)$ and hence throughout connected $U times U$ by holomorphicity. The identity on the diagonal extends throughout connected $U$. In a product chart about any $x in U$, these differential identities make the first output coordinate depend only on the first coordinate of the first input, and the second output only on the second coordinate of the second input. The diagonal identity identifies both functions with the corresponding coordinates. Hence $c$ is ordinary crossing near every diagonal point, as required. ◻
]

== 11 Nonexpansion and finite grids <app:global>

We return to the canonical morphism $f : X arrow.r Z$. Put $X^0 = f^(- 1) \( Z_(upright("reg")) \)$, and let $h$ be the orthogonal product metric associated with the parallel splitting on $X^0$ from Proposition 18. We use the following established properties of $h$: it is real analytic, it is locally a product metric for $E_1 xor E_2$, and its intrinsic length metric has a completion identified homeomorphically with $Z$. Write $rho$ for the resulting distance on $Z$, and recall

$ d \( x \, x' \) = rho \( f \( x \) \, f \( x' \) \) #h(2em) \( x \, x' in X \) . $

Thus $d$ is a continuous pseudodistance, whose zero-distance classes are the fibers of $f$. Diameters below are taken for $d$.

For each reduced fiber $P = f^(- 1) \( z \)_(upright("red"))$, Theorem 25 provides a connected open neighborhood $U supset P$ and a holomorphic crossing map $c : U times U arrow.r X$. We will use its identities

#[#set math.equation(numbering: n => "(11.1)")
 $ c \( x \, x \) = x \, #h(2em) upright(d)_1 c \( T_X \) subset E_1 \, quad upright(d)_1 c \( E_2 \) = 0 \,\
upright(d)_2 c \( T_X \) subset E_2 \, quad upright(d)_2 c \( E_1 \) = 0 . $ <global:crossing-identities>]

Near a diagonal point, $c$ is the ordinary operation that takes the first coordinate of the first input and the second coordinate of the second.

=== 11.1 Nonexpansion across the exceptional locus <nonexpansion-across-the-exceptional-locus>

#thm([Lemma 11.1.])[
  #emph[For each fiber value $z in Z$, one can choose a crossing map as above and $r > 0$ such that $f^(- 1) \( B_rho \( z \, r \) \) subset U$ and 
#[#set math.equation(numbering: n => "(11.2)")
 $ d #scale(x: 120%, y: 120%)[\(] c \( a \, b \) \, c \( a' \, b \) #scale(x: 120%, y: 120%)[\)] & lt.eq d \( a \, a' \) \,\
d #scale(x: 120%, y: 120%)[\(] c \( a \, b \) \, c \( a \, b' \) #scale(x: 120%, y: 120%)[\)] & lt.eq d \( b \, b' \) $ <global:lipschitz>]

 whenever all the inputs in the relevant inequality belong to $f^(- 1) \( B_rho \( z \, r \/ 10 \) \)$.]
] <global:nonexpansion>

#proof[
  On the open set
  $ V = { \( a \, b \) in U times U : a \, b \, c \( a \, b \) in X^0 } $
  we claim the tensor identities
  #[#set math.equation(numbering: n => "(11.3)")
   $ parallel upright(d)_1 c \( v \) #scale(x: 120%, y: 120%)[parallel]_(h \, c \( a \, b \))^2 & = lr(bar.v.double v_1 bar.v.double)_(h \, a)^2 \,\
parallel upright(d)_2 c \( w \) #scale(x: 120%, y: 120%)[parallel]_(h \, c \( a \, b \))^2 & = lr(bar.v.double w_2 bar.v.double)_(h \, b)^2 \, $ <global:metric-identities>]
  where $v = v_1 + v_2$ and $w = w_1 + w_2$ denote the supplied splittings of real tangent vectors. The identities hold near any regular diagonal point by the local product expression for $h$. The complement of $V$ is a proper complex analytic subset of the connected manifold $U times U$, so $V$ is connected. Both sides of each identity are real analytic on $V$. The real analytic identity principle proves (11.3) throughout $V$.
  Properness of $f$ and the topology induced by $rho$ give $r > 0$ with $f^(- 1) \( B_rho \( z \, r \) \) subset U$. Consider the first inequality in (11.2). Approximate $\( a \, a' \, b \)$ in $X^3$ by triples $\( a_m \, a'_m \, b_m \)$ for which all three inputs and both output points are in $X^0$. Such triples are dense: each excluded condition is a proper analytic subset of $U^3$, and properness of the output conditions follows from the regular values of $c$ near a regular diagonal point.
  For large $m$ all inputs lie over $B_rho \( z \, r \/ 9 \)$. Join $a_m$ to $a'_m$ in $X^0$ by a piecewise smooth path of $h$-length less than $d \( a_m \, a'_m \) + eta$, with $eta > 0$ arbitrarily small. This is possible because $d$ on $X^0$ is its intrinsic length distance. Every point of this path lies over $B_rho \( z \, r \/ 3 + eta \)$: the initial point has distance less than $r \/ 9$ from $z$, and the path length is less than $2 r \/ 9 + eta$. In particular the path remains in $U$, with a margin for perturbation.
  For this fixed $b_m$, the set
  $ A_m = { x in U ∩ X^0 : c \( x \, b_m \) in.not X^0 } $
  is a proper analytic subset, since the output at $a_m$ is regular. It has real codimension at least two. Keeping the endpoints fixed, we may perturb the path to avoid $A_m$ with arbitrarily small length error. Indeed, on a neighborhood of the compact path the metric is smooth; general position relative to an analytic stratification gives such a perturbation within that neighborhood. Along the perturbed path, (11.3) bounds the output speed by the input speed, because the two summands are $h$-orthogonal. Integration, followed by letting the length errors tend to zero, proves
  $ d #scale(x: 120%, y: 120%)[\(] c \( a_m \, b_m \) \, c \( a'_m \, b_m \) #scale(x: 120%, y: 120%)[\)] lt.eq d \( a_m \, a'_m \) . $
  Continuity of $c$ and $d$ gives the first inequality for the original inputs. Interchanging the two variables proves the second. ◻
]

Compactness of $Z$ now supplies a uniform constant $delta > 0$ with the following property:

#[#set math.equation(numbering: n => "(11.4)")
 $ upright("Every set ") S subset X upright(" with ") "diam"_d \( S \) lt.eq 2 delta upright(" lies in a crossing domain ") U \,\
upright("and ") upright("(11.2)") upright(" holds for all inputs taken from ") S . $ <global:uniform>]

To see this, take a finite subcover of $Z$ by the smaller balls in Lemma 33, and choose $2 delta$ strictly below a Lebesgue number. No ordinary diameter bound for the fibers is asserted or needed here.

=== 11.2 Two finite grid constructions <two-finite-grid-constructions>

For intervals $I \, J$, the box condition of Definition 20 says that the first product coordinate of $R : I times J arrow.r X$ depends locally only on the parameter in $I$, and the second only on the parameter in $J$. Its horizontal and vertical paths consequently follow the $E_1$- and $E_2$-plaques, respectively. We first record the rule for filling one tile.

Suppose two prescribed edges $alpha : I arrow.r X$ and $beta : J arrow.r X$ meet at a corner $p$, follow the first and second foliations respectively, and each have diameter at most $delta$. Their union has diameter at most $2 delta$. Choose a crossing map by (11.4) and set

#[#set math.equation(numbering: n => "(11.5)")
 $ R \( s \, t \) = c \( alpha \( s \) \, beta \( t \) \) . $ <global:tile>]

This is a box and agrees with both prescribed edges. For example, for fixed $s$, vary the second input along the part of $alpha$ joining $p$ to $alpha \( s \)$. The identity $upright(d)_2 c \( E_1 \) = 0$ makes the value constant, and therefore

$ c \( alpha \( s \) \, p \) = c \( alpha \( s \) \, alpha \( s \) \) = alpha \( s \) . $

The other edge follows from $upright(d)_1 c \( E_2 \) = 0$. This argument applies to continuous plaque paths, since the corresponding functions are locally constant on their parameter intervals. Finally, (11.2) shows that every horizontal or vertical partial slice of this tile has diameter at most $delta$. Thus the same bound is available for its two new edges.

#thm([Lemma 11.2.])[
  #emph[The following boxes exist.]
  + #emph[For every continuous path $lambda : \[ 0 \, 1 \] arrow.r X$, there is a box $R : \[ 0 \, 1 \]^2 arrow.r X$ such that $R \( s \, s \) = lambda \( s \)$.]
  + #emph[For continuous paths $alpha$ and $beta$ in leaves of the first and second foliations, respectively, with $alpha \( 0 \) = beta \( 0 \)$, there is a box on $\[ 0 \, 1 \]^2$ satisfying $R \( s \, 0 \) = alpha \( s \)$ and $R \( 0 \, t \) = beta \( t \)$.]
  #emph[Here continuity of the prescribed leaf paths is in the intrinsic leaf topology.]
] <global:boxes>

#proof[
  For the first assertion choose a subdivision $0 = t_0 < dots.h.c < t_N = 1$ such that each $lambda \( I_i \)$ has diameter at most $delta$, where $I_i = \[ t_(i - 1) \, t_i \]$. On every diagonal tile $I_i^2$ put
  $ R \( s \, t \) = c_i \( lambda \( s \) \, lambda \( t \) \) \, $
  using (11.4). Its diagonal is $lambda$, and each of its partial slices has diameter at most $delta$ by (11.2). These tiles agree at their common vertices.
  Fill the remaining tiles $I_i times I_j$ by increasing $\| i - j \|$. Above the diagonal, the bottom and right edges of a new tile have already been defined; below it, the top and left edges have already been defined. In either case these are one horizontal and one vertical edge, meeting at a corner. Apply (11.5). The induction invariant is that every partial slice of each completed tile has diameter at most $delta$. The tile rule proves both agreement on its old edges and preservation of this invariant. Tiles at the same stage share no edge. If they share a vertex, its value is already fixed by an intervening tile from an earlier stage. Thus the finite filling is consistent everywhere.
  For the second assertion, subdivide each prescribed axis so that the image of every edge segment has diameter at most $delta$. Fill the rectangular array in increasing order of the sum of its two indices. The bottom and left edges of a new tile have already been prescribed, so precisely the same rule and invariant apply.
  In both constructions the tile maps glue continuously. The box property also holds across seams: near a seam value, continuity places the adjacent path pieces in one foliation chart, and both follow the plaque through their common endpoint. This proves the assertions. ◻
]

The filling orders are the same as in Figure 2. Here the one-tile rule (11.5) propagates the diameter bound $delta$ by separate nonexpansion, rather than preserving a holomorphic parametrization on a full polydisk.

The construction uses only continuity and diameter control. In particular it applies to paths inside a collapsed fiber, whose pseudodiameter is zero, without assigning those paths any finite length for the limiting metric.

=== 11.3 The resulting product of universal covers <the-resulting-product-of-universal-covers>

The two grid constructions have now supplied the exact inputs for transport of inverse germs in Proposition 14. That proposition uses only product charts and a continuous box; it does not use the compact Kähler splitting theorem or the construction of boxes in Sections 3–6. We spell out the remaining application to keep the alternative argument independent of that theorem.

Fix $o in X$, and give the leaves $L_1 \, L_2$ through $o$ their intrinsic complex-manifold structures, as in Lemma 13. Let

$ H_o : \( L_1 times L_2 \, \( o \, o \) \) arrow.r \( X \, o \) \, #h(2em) K_o : \( X \, o \) arrow.r \( L_1 times L_2 \, \( o \, o \) \) $

be inverse local product germs. Every path in $X$ from $o$ is the diagonal of a box by Lemma 34(1). Its axes lie continuously in the fixed intrinsic leaves, so Proposition 14 continues $K_o$ along that path. Conversely, a path in $L_1 times L_2$ consists of two intrinsically continuous leaf paths. Lemma 34(2) supplies a box with those axes, and the same transport proposition continues $H_o$ along the prescribed path. All continued germs are local biholomorphisms.

#thm([Proposition 11.3.])[
  #emph[Under the hypotheses of Corollary 3, let $Y arrow.r X$ be the universal cover and $tilde(L)_i arrow.r L_i$ the universal covers of the leaves through $o$. Then 
$ Y tilde.eq tilde(L)_1 times tilde(L)_2 $

 biholomorphically, with the lifts of $E_i$ identified with the respective tangent bundles of the factors.]
] <global:product>

#proof[
  All-path continuation and monodromy give holomorphic maps
  $ F : Y arrow.r L_1 times L_2 \, #h(2em) G : tilde(L)_1 times tilde(L)_2 arrow.r X . $
  With compatible basepoints, the covering lifting theorem gives holomorphic lifts
  $ hat(F) : Y arrow.r tilde(L)_1 times tilde(L)_2 \, #h(2em) hat(G) : tilde(L)_1 times tilde(L)_2 arrow.r Y . $
  Their initial germs are inverse. Each composite is therefore the identity near its basepoint, and hence everywhere on its connected source by the identity theorem. The wrong-factor components of their differentials are holomorphic bundle morphisms that vanish in the initial product chart. They vanish identically, giving the asserted compatibility with the supplied splitting. ◻
]

Proposition 35 completes the alternative proof of Corollary 3. Its continuation mechanism is the separate nonexpansion of crossings around collapsed canonical fibres together with the finite-grid diameter bounds.

#heading(level: 1)[References]
#bibitem([1])[Arnaud Beauville, #emph[Complex Algebraic Surfaces], second edition, London Mathematical Society Student Texts, vol.~34, Cambridge University Press, Cambridge, 1996. #link("https://doi.org/10.1017/CBO9780511623936")[doi:10.1017/CBO9780511623936].]
#bibitem([2])[Arnaud Beauville, #emph[Complex manifolds with split tangent bundle], in Thomas Peternell and Frank-Olaf Schreyer (eds.), #emph[Complex Analysis and Algebraic Geometry: A Volume in Memory of Michael Schneider], de Gruyter, Berlin, 2000, pp.~61--70. #link("https://doi.org/10.1515/9783110806090-004")[doi:10.1515/9783110806090-004].]
#bibitem([3])[Jacek Bochnak, Michel Coste, and Marie-Françoise Roy, #emph[Real Algebraic Geometry], Ergebnisse der Mathematik und ihrer Grenzgebiete, 3.~Folge, vol.~36, Springer-Verlag, Berlin, 1998. #link("https://doi.org/10.1007/978-3-662-03718-8")[doi:10.1007/978-3-662-03718-8].]
#bibitem([4])[R.~Brody, #emph[Compact manifolds and hyperbolicity], Trans. Amer. Math. Soc. #strong[235] (1978), 213--219. #link("https://doi.org/10.1090/S0002-9947-1978-0470252-3")[doi:10.1090/S0002-9947-1978-0470252-3].]
#bibitem([5])[Marco Brunella, Jorge Vitório Pereira, and Frédéric Touzet, #emph[Kähler manifolds with split tangent bundle], Bulletin de la Société Mathématique de France #strong[134] (2006), no.~2, 241--252. #link("https://doi.org/10.24033/bsmf.2507")[doi:10.24033/bsmf.2507].]
#bibitem([6])[Frédéric Campana and Thomas Peternell, #emph[Geometric stability of the cotangent bundle and the universal cover of a projective manifold], with an appendix by Matei Toma, Bull. Soc. Math. France #strong[139] (2011), no.~1, 41--74. #link("https://doi.org/10.24033/bsmf.2599")[doi:10.24033/bsmf.2599].]
#bibitem([7])[Michel Coste, #emph[An Introduction to O-minimal Geometry], lecture notes, November 1999. #link("https://perso.univ-rennes1.fr/michel.coste/polyens/OMIN.pdf").]
#bibitem([8])[Jean-Pierre Demailly, #emph[On the Frobenius integrability of certain holomorphic $p$-forms], in #emph[Complex Geometry], Springer, Berlin, 2002, pp.~93--98. #link("https://doi.org/10.1007/978-3-642-56202-0_6")[doi:10.1007/978-3-642-56202-0\_6].]
#bibitem([9])[J.-P.~Demailly, #emph[Complex Analytic and Differential Geometry], manuscript, version of June 21, 2012. #link("https://people.math.harvard.edu/~demarco/Math274/Demailly_ComplexAnalyticDiffGeom.pdf").]
#bibitem([10])[G.~de Rham, #emph[Sur la réductibilité d'un espace de Riemann], Comment. Math. Helv. #strong[26] (1952), 328--344. #link("https://doi.org/10.1007/BF02564308")[doi:10.1007/BF02564308].]
#bibitem([11])[Dennis M.~DeTurck and Jerry L.~Kazdan, #emph[Some regularity theorems in Riemannian geometry], Annales Scientifiques de l'École Normale Supérieure (4) #strong[14] (1981), no.~3, 249--260. #link("https://doi.org/10.24033/asens.1405")[doi:10.24033/asens.1405].]
#bibitem([12])[S.~Druel, #emph[Variétés algébriques dont le fibré tangent est totalement décomposé], J. Reine Angew. Math. #strong[522] (2000), 161--171. #link("https://arxiv.org/abs/math/9901138v2")[arXiv:math/9901138v2].]
#bibitem([13])[S.~Druel, J.~V.~Pereira, B.~Pym, and F.~Touzet, #emph[A global Weinstein splitting theorem for holomorphic Poisson manifolds], Geom. Topol. #strong[26] (2022), no.~6, 2831--2853. #link("https://doi.org/10.2140/gt.2022.26.2831")[doi:10.2140/gt.2022.26.2831].]
#bibitem([14])[Stéphane Druel, Jorge Vitório Pereira, Brent Pym, and Frédéric Touzet, #emph[Numerically flat foliations and holomorphic Poisson geometry], preprint, 2024. #link("https://arxiv.org/abs/2411.08806v1")[arXiv:2411.08806v1].]
#bibitem([15])[Ichiro Enoki, #emph[Stability and negativity for tangent sheaves of minimal Kähler spaces], in #emph[Geometry and Analysis on Manifolds], Lecture Notes in Mathematics, vol.~1339, Springer, Berlin, 1988, pp.~118--126. #link("https://doi.org/10.1007/BFb0083051")[doi:10.1007/BFb0083051].]
#bibitem([16])[William Fulton and Rahul Pandharipande, #emph[Notes on stable maps and quantum cohomology], in János Kollár, Robert Lazarsfeld, and David R.~Morrison (eds.), #emph[Algebraic Geometry---Santa Cruz 1995], Proceedings of Symposia in Pure Mathematics, vol.~62, part~2, American Mathematical Society, Providence, RI, 1997, pp.~45--96. #link("https://arxiv.org/abs/alg-geom/9608011")[arXiv:alg-geom/9608011].]
#bibitem([17])[Henri Guenancia, #emph[Semistability of the tangent sheaf of singular varieties], Algebraic Geometry #strong[3] (2016), no.~5, 508--542. #link("https://doi.org/10.14231/AG-2016-024")[doi:10.14231/AG-2016-024].]
#bibitem([18])[Christopher D.~Hacon and James McKernan, #emph[On Shokurov's rational connectedness conjecture], Duke Mathematical Journal #strong[138] (2007), no.~1, 119--136. #link("https://doi.org/10.1215/S0012-7094-07-13813-4")[doi:10.1215/S0012-7094-07-13813-4]\; #link("https://arxiv.org/abs/math/0504330v2")[arXiv:math/0504330v2].]
#bibitem([19])[Andreas Höring, #emph[Uniruled varieties with split tangent bundle], Mathematische Zeitschrift #strong[256] (2007), no.~3, 465--479. #link("https://doi.org/10.1007/s00209-006-0072-5")[doi:10.1007/s00209-006-0072-5]\; #link("https://arxiv.org/pdf/math/0505327v3")[arXiv:math/0505327v3].]
#bibitem([20])[Andreas Höring, #emph[Fano varieties with split tangent sheaf], preprint, 2026. #link("https://arxiv.org/abs/2602.15427v1")[arXiv:2602.15427v1].]
#bibitem([21])[S.~M.~Ivashkovich, #emph[The Hartogs-type extension theorem for meromorphic maps into compact Kähler manifolds], Invent. Math. #strong[109] (1992), 47--54. #link("https://doi.org/10.1007/BF01232018")[doi:10.1007/BF01232018].]
#bibitem([22])[S.~Ivashkovich, #emph[Extra extension properties of equidimensional holomorphic mappings: results and open questions], preprint, 2008. #link("https://arxiv.org/abs/0810.4588v2")[arXiv:0810.4588v2].]
#bibitem([23])[János Kollár and Shigefumi Mori, #emph[Birational Geometry of Algebraic Varieties], Cambridge Tracts in Mathematics, vol.~134, Cambridge University Press, Cambridge, 1998. #link("https://doi.org/10.1017/CBO9780511662560")[doi:10.1017/CBO9780511662560].]
#bibitem([24])[Joël Merker and Egmont Porten, #emph[The Hartogs extension theorem on $\( n - 1 \)$-complete complex spaces], Journal für die reine und angewandte Mathematik #strong[637] (2009), 23--39. #link("https://doi.org/10.1515/CRELLE.2009.088")[doi:10.1515/CRELLE.2009.088].]
#bibitem([25])[Yusuke Nakamura and Kohsuke Shibata, #emph[A counterexample to the PIA conjecture for minimal log discrepancies], Duke Mathematical Journal #strong[175] (2026), no.~10, 1715--1736. #link("https://arxiv.org/abs/2404.06164v4")[arXiv:2404.06164v4].]
#bibitem([26])[OpenAI, #emph[Integrability of split tangent bundles on rationally connected manifolds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Integrability-of-split-tangent-bundles-on-rationally-connected-manifolds-September-23-2026/main.pdf")[OAI:Integrability-of-split-tangent-bundles-on-rationally-connected-manifolds-September-23-2026], 2026.]
#bibitem([27])[J.~V.~Pereira and F.~Touzet, #emph[Foliations with vanishing Chern classes], Bull. Braz. Math. Soc. (N.S.) #strong[44] (2013), no.~4, 731--754. #link("https://arxiv.org/abs/1210.5916v1")[arXiv:1210.5916v1].]
#bibitem([28])[Jean-Pierre Serre, #emph[Géométrie algébrique et géométrie analytique], Annales de l'Institut Fourier #strong[6] (1956), 1--42. #link("https://doi.org/10.5802/aif.59")[doi:10.5802/aif.59].]
#bibitem([29])[Jian Song, #emph[Riemannian geometry of Kähler--Einstein currents], preprint, 2014. #link("https://arxiv.org/abs/1404.0445v1")[arXiv:1404.0445v1].]
#bibitem([30])[Shigeharu Takayama, #emph[Local simple connectedness of resolutions of log-terminal singularities], International Journal of Mathematics #strong[14] (2003), no.~8, 825--836. #link("https://doi.org/10.1142/S0129167X0300196X")[doi:10.1142/S0129167X0300196X].]
#bibitem([31])[Shing-Tung Yau, #emph[A splitting theorem and an algebraic geometric characterization of locally Hermitian symmetric spaces], Communications in Analysis and Geometry #strong[1] (1993), 473--486.]


