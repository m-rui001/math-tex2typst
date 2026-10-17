#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp integral fillings in CAT(0) spaces]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Euclidean isoperimetric inequality bounds the volume enclosed by a boundary of prescribed area. Its current-theoretic form asks for a filling of a cycle and permits singular supports, integer multiplicities, and arbitrary codimension. We prove that the sharp Euclidean filling bound holds in every proper CAT(0) space, in all cycle dimensions at least two.

Write $upright(bold(I))_j \( X \)$ for the integral $j$-currents of Ambrosio and Kirchheim #cite(label("AK2000")), $partial$ for current boundary, and $upright(bold(M))$ for mass. An integral $n$-cycle is a current $T in upright(bold(I))_n \( X \)$ with $partial T = 0$; an integral filling is a current $S in upright(bold(I))_(n + 1) \( X \)$ with $partial S = T$. A metric space is #emph[proper] if its closed bounded balls are compact. A CAT(0) space is a geodesic metric space in which the distance between two points on a geodesic triangle is at most the distance between the corresponding points of its Euclidean comparison triangle.

Let $omega_j$ be the volume of the unit ball in $bb(R)^j$ and put

#[#set math.equation(numbering: n => "(1.1)")
 $ s_n = \( n + 1 \) omega_(n + 1) = "area" \( bb(S)^n \) \, #h(2em) c_n = frac(1, \( n + 1 \) s_n^(1 \/ n)) . $ <eq:constants>]

Here and throughout the filling argument, $n$ denotes the cycle dimension.

#thm([Theorem 1.1.])[
  (Sharp integral filling).  #emph[Let $X$ be a proper CAT(0) space and $n gt.eq 2$ an integer. Every compactly supported $T in upright(bold(I))_n \( X \)$ with $partial T = 0$ admits a compactly supported $S in upright(bold(I))_(n + 1) \( X \)$ such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ partial S = T \, #h(2em) upright(bold(M)) \( S \) lt.eq c_n upright(bold(M)) \( T \)^(\( n + 1 \) \/ n) = frac(upright(bold(M)) \( T \)^(\( n + 1 \) \/ n), \( n + 1 \)^(\( n + 1 \) \/ n) omega_(n + 1)^(1 \/ n)) . $ <eq:main>]

 There is no restriction on the dimension of $X$ or on the integer multiplicities of the currents. The coefficient is optimal.]
] <thm:main>

For the first two dimensions, $s_2 = 4 pi$ and $s_3 = 2 pi^2$, so

$ c_2 = frac(1, 6 sqrt(pi)) \, #h(2em) c_3 = \( 128 pi^2 \)^(- 1 \/ 3) . $

Euclidean spheres attain the coefficient, as verified in Section 8.

=== 1.1 The Cartan–Hadamard consequence <the-cartanhadamard-consequence>

A #emph[Cartan–Hadamard manifold] is a complete, simply connected Riemannian manifold of nonpositive sectional curvature. The Euclidean Cartan–Hadamard conjecture asks whether domains in such a manifold satisfy the same volume–perimeter bound as Euclidean domains. Theorem 1, applied to boundary currents, gives the following positive answer in dimensions at least three.

#thm([Corollary 1.2.])[
  #emph[Let $M$ be a Cartan–Hadamard manifold of dimension $d gt.eq 3$. For every bounded domain $Omega subset M$ with smooth boundary, 
#[#set math.equation(numbering: n => "(1.3)")
 $ "area" \( partial Omega \) gt.eq d omega_d^(1 \/ d) "vol" \( Omega \)^(\( d - 1 \) \/ d) . $ <eq:classical>]

 The same inequality holds for relatively compact sets of finite perimeter, with ambient perimeter in place of boundary area.]
] <cor:cartan-hadamard>

The reduction uses the uniqueness of a compactly supported top-dimensional filling of a prescribed boundary. Its proof, and the classical two-dimensional case, appear in Section 8. Together they give the Euclidean inequality for bounded smooth domains in every ambient dimension $d gt.eq 2$.

The smooth domain problem has a long independent history. The surface inequality goes back to Weil and Beckenbach–Radó #cite(label("Weil1926")) #cite(label("BeckenbachRado1933")); Kleiner proved the three-dimensional comparison #cite(label("Kleiner1992")), and Croke proved the four-dimensional Euclidean inequality #cite(label("Croke1984")). Ghomi and Spruck showed that a corresponding total-curvature bound implies the domain inequality in every dimension #cite(label("GhomiSpruck2022")) Theorem 7.1.

Recent results extend these comparisons in several directions. Chen, Ghomi and Wang prove the Euclidean comparison in dimensions three through nine #cite(label("ChenGhomiWang2026HigherDimensions")) Theorem 1.1. Wheeler proves it in all dimensions under a controlled variation condition on the negative-curvature scale #cite(label("Wheeler2026")) Theorem 1.1 and Definition 1.2. Agnoletto, Da Silva, Nardulli and Resende prove small-volume comparison with the constant-curvature model under a nonpositive sectional-curvature upper bound and a Ricci lower bound, and reduce unrestricted-volume comparison to equality rigidity in a class of Alexandrov spaces #cite(label("AgnolettoDaSilvaNardulliResende2026")) Theorems 1.1 and 1.3; Assumption 1. Our domain corollary follows from the integral filling theorem and top-dimensional constancy; it requires no separate smooth comparison argument or additional curvature hypothesis.

=== 1.2 The filling problem and its predecessors <the-filling-problem-and-its-predecessors>

Almgren established the sharp isoperimetric inequality for integral currents in Euclidean space in arbitrary dimension and codimension #cite(label("Almgren1986")). In a general metric space, a comparable statement first requires notions of orientation, integer multiplicity, mass, and boundary that do not depend on an ambient smooth structure. Ambrosio and Kirchheim supplied this theory, including rectifiable representation, slicing, and compactness #cite(label("AK2000")). Kirchheim’s metric differentiation theorem #cite(label("Kirchheim1994")) provides the local normed geometry of its rectifiable charts. In CAT(0) spaces these chart norms are Euclidean; we give the short comparison argument and the exact mass normalization in Section 2.

For Lipschitz loops in complete CAT(0) spaces, Reshetnyak’s majorization theorem already gives a Lipschitz disc whose parametrized Hausdorff area is at most the squared loop length divided by $4 pi$; see #cite(label("LytchakWenger2018")) Section 3.2, Lemma 3.2. Wenger proved isoperimetric inequalities with the Euclidean exponent in complete spaces with a convex geodesic bicombing, including CAT(0) spaces #cite(label("Wenger2005Iso")). His constant depends on the cycle dimension. He also established the relation between weak convergence and filling convergence used to obtain variational extremizers here #cite(label("Wenger2007Flat")). Theorem 1 identifies the optimal coefficient. For two-cycles in smooth Cartan–Hadamard manifolds, Schulze proved the sharp constant-curvature model comparison in every codimension, together with equality rigidity #cite(label("Schulze2020")) Theorems 1.2–1.3. The present theorem extends the Euclidean filling bound to all cycle dimensions $n gt.eq 2$ and singular CAT(0) ambient spaces.

Recent work identifies geometric hypotheses under which fillings have smaller growth exponents at large mass. In complete CAT(0) spaces of finite asymptotic Nagata dimension, Lang, Stadler and Urech obtain almost-linear bounds for compact integral $k$-cycles, $k gt.eq 2$, when the asymptotic rank is at most two #cite(label("LangStadlerUrech2026")) Theorem 1.1. With the same Nagata dimension hypothesis and finite asymptotic rank $k_0$, Peteranderl obtains linear bounds for integral $k$-cycles with $k gt.eq max { k_0 \, 1 }$, and compact fillings for compact inputs #cite(label("Peteranderl2026")) Theorem 1.2. The constants depend on the space. The estimate here fixes the universal Euclidean coefficient at every mass in an arbitrary proper CAT(0) space.

The problem also belongs to the broader study of filling geometry developed by Gromov #cite(label("Gromov1983")). His sharp shrinking and filling formulation for CAT(0) targets asks for volume-controlled extensions of maps on specified domains #cite(label("Gromov2014")) Section 2.3. Theorem 1 concerns integral-current fillings: it does not prescribe the topology or parametrization of the filling. Those additional extension requirements are not supplied by a mass and boundary estimate alone.

=== 1.3 Main ideas and proof route <main-ideas-and-proof-route>

The extremizer/curvature-estimate strategy is motivated by Almgren #cite(label("Almgren1986")) Section 0, p. 454, and the two-dimensional curvature estimate also by Schulze #cite(label("Schulze2020")) Theorem 1.4. The singular CAT(0) radial implementation is established here; these references are methodological motivation, not imports of a smooth curvature theorem into the singular setting.

The proof proceeds by induction on $n$, with its two-dimensional case proved directly. A closed convex ball containing the given compact support reduces the problem to a compact CAT(0) space $Y$. For an integral cycle $B$ in $Y$, let $V \( B \)$ be its least integral filling mass. If the sharp bound fails, compactness and filling continuity give a nonzero cycle $A$ maximizing

$ V \( B \) - c upright(bold(M)) \( B \)^(\( n + 1 \) \/ n) #h(2em) \( c > c_n \) . $

A constant rescaling makes its mass $m = upright(bold(M)) \( A \)$ smaller than $s_n$. This is the small-mass inequality that the rest of the proof contradicts.

The first step varies $A$ inward along geodesics from a fixed center $y$. Write $r \( x \) = d \( y \, x \)$, and let $D r$ denote the differential of $r$ along the Euclidean current charts. Triangle comparison bounds the deformation by a quadratic form in the time and chart variables. Its determinant retains the factor $sqrt(1 - \| D r \|^2)$ in the swept-mass bound. In a smooth Euclidean model this is the transverse component of the radial unit direction. The argument needs neither an ambient normal bundle nor normality of a separate chart restriction. Section 3 proves the resulting radial inequality. For $n = 2$, an inverse-square cutoff and Euclidean lower density already force $m gt.eq 4 pi = s_2$, establishing the base case.

For $n > 2$, the induction hypothesis fills the boundaries of small restrictions of $A$. Replacing each restriction by such a filling gives an almost Euclidean small-set perimeter estimate. Intrinsic coarea and rearrangement turn this into a critical Sobolev inequality in Section 4. The sharp coefficient is the classical Aubin–Talenti coefficient #cite(label("Aubin1976")) #cite(label("Talenti1976")); its radial form is proved here by the mass-transport method of Cordero-Erausquin, Nazaret and Villani #cite(label("CorderoNazaretVillani2004")) Section 2.

To use this estimate variationally, we close the chart gradient in $L^2 \( mu \)$, where $mu = parallel A parallel$ is the mass measure. We prove compactness by first projecting whole weighted currents and then isolating charts in total variation. With $beta = 1 \/ \( n - 2 \)$ and $p = 2 n \/ \( n - 2 \)$, the almost sharp inequality and Brézis–Lieb splitting #cite(label("BrezisLieb1983")) produce a nonnegative minimizer of

$ frac(4 beta integral \| D u \|^2 thin d mu + n integral u^2 thin d mu, #scale(x: 120%, y: 120%)[\(] integral \| u \|^p thin d mu #scale(x: 120%, y: 120%)[\)]^(2 \/ p)) $

on the completion for the norm $\( parallel u parallel_2^2 + integral \| D u \|^2 thin d mu \)^(1 \/ 2)$. Section 5 normalizes this minimizer $v$ so that $0 < W := integral v^p thin d mu < s_n$, and establishes the moment estimates needed for its nonlinear tests.

The final comparison concerns the weighted chord

$ v \( y \)^beta d \( y \, x \) v \( x \)^beta $

and the probability measure $d nu = v^p thin d mu \/ W$. Radial variation and the minimizer equation control a scalar transform of the chord distribution. Euclidean tangent density then bounds its mean square by $2 \( W \/ s_n \)^(2 \/ n) < 2$ for almost every center $y$. The actual composite tests remain differentiable at $v = 0$, even when $beta < 1$; no Sobolev regularity of $v^beta$ is presumed. Section 6 supplies this upper bound. Section 7 uses CAT(0) variance to show that the average of the same squared chords is at least $2$. The contradiction completes the induction and yields attained, compactly supported integral fillings.

== 2 Compact fillings and Euclidean current charts <sec:currents>

We first reduce the filling problem to a compact ambient space. Standard compactness and filling continuity then turn a hypothetical failure of the sharp bound into a normalized extremizing cycle. To vary this cycle without losing the sharp coefficient, we derive exact Euclidean chart mass and density formulas. These local formulas apply to every integral current. All current dimensions in this section are finite positive integers; the ambient space has no dimension bound.

=== 2.1 Reduction to a compact convex ball <reduction-to-a-compact-convex-ball>

#thm([Lemma 2.1.])[
  (Compact reduction).  #emph[Suppose that the asserted filling inequality in a fixed cycle dimension holds in every compact $"CAT" \( 0 \)$ space. Then it holds for every compactly supported integral cycle of that dimension in every proper $"CAT" \( 0 \)$ space, with a compactly supported integral filling.]
] <lem:compact-reduction>

#proof[
  Let $T$ be the cycle in a proper $"CAT" \( 0 \)$ space $X$. If $T = 0$, take the zero filling. Otherwise choose a closed ball $Y = overline(B) \( o \, R \)$ whose interior contains $"spt" T$. Properness makes $Y$ compact. Triangle comparison implies that balls are convex, so the induced metric makes $Y$ a compact $"CAT" \( 0 \)$ space.
  For $x in X$, let $P \( x \)$ be the point of the segment $\[ o \, x \]$ at distance $min { R \, d \( o \, x \) }$ from $o$. Geodesics in a $"CAT" \( 0 \)$ space are unique. Comparing two such radial points with their counterparts in the Euclidean comparison triangle, and then using nonexpansion of Euclidean radial projection onto a closed ball, gives
  $ d \( P \( x \) \, P \( x' \) \) lt.eq d \( x \, x' \) . $
  One can also identify $P \( x \)$ as the nearest point of $Y$: the triangle inequality bounds the distance from $x$ to $Y$ below by $max { 0 \, d \( o \, x \) - R }$, and the radial point attains this bound.
  Lipschitz pushforward therefore gives an integral cycle $P_(\#) T$ in $Y$ with $upright(bold(M)) \( P_(\#) T \) lt.eq upright(bold(M)) \( T \)$. If $iota : Y arrow.r.hook X$ denotes inclusion, locality gives $iota_(\#) P_(\#) T = T$, because $iota compose P$ is the identity on a neighborhood of $"spt" T$. Apply the compact-space inequality to $P_(\#) T$ and include its filling into $X$. Its mass does not increase, its boundary is $T$, and its support is contained in the compact set $Y$. ◻
]

We work henceforth in a fixed compact $"CAT" \( 0 \)$ space $Y$. The elementary comparison facts just used, and the midpoint and geodesic contraction inequalities used below, follow from the defining triangle comparison; see also #cite(label("BridsonHaefliger1999")) Chapter II.2.

For an integral $k$-cycle $B$ in $Y$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ V \( B \) = inf { upright(bold(M)) \( S \) : S in upright(bold(I))_(k + 1) \( Y \) \, med partial S = B } . $ <eq:filling-volume-definition>]

The mass measure of a current $C$ is denoted by $parallel C parallel$, and its total mass by $upright(bold(M)) \( C \)$. We use the Ambrosio–Kirchheim convention for the action $C \( b \, pi_1 \, dots.h \, pi_k \)$: the first coefficient is bounded Lipschitz, and the differentiated scalar coordinates are Lipschitz. The mass bound extends the first coefficient to bounded Borel functions. In particular, if a finite Borel measure $eta$ satisfies

#[#set math.equation(numbering: n => "(2.2)")
 $ \| C \( b \, pi_1 \, dots.h \, pi_k \) \| lt.eq integral \| b \| thin d eta $ <eq:mass-controlling-measure>]

for every bounded Lipschitz $b$ and every tuple of $1$-Lipschitz coordinates, then $parallel C parallel lt.eq eta$. This is the minimality property in the definition of mass.

=== 2.2 The current-theoretic inputs <the-current-theoretic-inputs>

The following theorem records the standard foundations in the precise form used here. The current representation, compactness, closure and slicing assertions are theorems of Ambrosio–Kirchheim; the product and filling assertions use Wenger’s results. We include the verifications specific to the present ambient space.

#thm([Theorem 2.2.])[
  (Current background in a compact $"CAT" \( 0 \)$ space).  #emph[Let $Y$ be compact and $"CAT" \( 0 \)$, and let $k gt.eq 1$. The following statements hold.]
  + #emph[Lipschitz pushforward preserves integral currents, commutes with boundary, and satisfies the Lipschitz mass bound. Restrictions by bounded Borel coefficients have the usual mass-measure bound; for a Borel set $E subset Y$, 
$ parallel C corner.l.b E parallel = parallel C parallel corner.l.b E . $

 The restricted current need not be normal. If $u : Y arrow.r bb(R)$ is Lipschitz and $C in upright(bold(I))_k \( Y \)$, then $C corner.l.b { u > t }$ is integral for almost every $t$. In particular its boundary is an integral $\( k - 1 \)$-cycle.]
  + #emph[If $C_j in upright(bold(I))_k \( Y \)$ and $sup_j \( upright(bold(M)) \( C_j \) + upright(bold(M)) \( partial C_j \) \) < oo$, a subsequence converges weakly to an integral current. Boundary commutes with weak convergence, and mass is lower semicontinuous.]
  + #emph[Every $C in upright(bold(I))_k \( Y \)$ admits a representation by bi-Lipschitz maps $phi.alt_i : E_i arrow.r Y$, where $E_i subset bb(R)^k$ are bounded Borel sets and the images $Z_i = phi.alt_i \( E_i \)$ are pairwise disjoint Borel sets, and by signed integer multiplicities $theta_i in L^1 \( E_i \)$, such that 
#[#set math.equation(numbering: n => "(2.3)")
 $ C \( b \, pi_1 \, dots.h \, pi_k \) = sum_i integral_(E_i) theta_i \( z \) b \( phi.alt_i \( z \) \) det D #scale(x: 120%, y: 120%)[\(] \( pi_1 \, dots.h \, pi_k \) compose phi.alt_i #scale(x: 120%, y: 120%)[\)] \( z \) thin d z . $ <eq:chart-action>]

 The chart summands have summable masses. Zero multiplicities may be discarded. Scalar functions on a Borel chart domain are differentiated by Lipschitz extension to $bb(R)^k$; their derivatives are independent of that extension at almost every density point of the domain.]
  + #emph[For $h > 0$, the whole-current product $\[ 0 \, h \] times C$, with the Euclidean product metric, is an integral $\( k + 1 \)$-current and obeys 
#[#set math.equation(numbering: n => "(2.4)")
 $ partial \( \[ 0 \, h \] times C \) = \[ h \] times C - \[ 0 \] times C - \[ 0 \, h \] times partial C . $ <eq:interval-product-boundary>]

 Writing $b_t \( x \) = b \( t \, x \)$ and $pi_(a \, t) \( x \) = pi_a \( t \, x \)$, its action is 
#[#set math.equation(numbering: n => "(2.5)")
 $ & \( \[ 0 \, h \] times C \) \( b \, pi_1 \, dots.h \, pi_(k + 1) \)\
 & quad = sum_(a = 1)^(k + 1) \( - 1 \)^(a + 1) integral_0^h C #scale(x: 120%, y: 120%)[\(] b_t thin partial_t pi_a \( t \, dot.op \) \, pi_(1 \, t) \, dots.h \, hat(pi_(a \, t)) \, dots.h \, pi_(k + 1 \, t) #scale(x: 120%, y: 120%)[\)] thin d t . $ <eq:interval-product-action>]

 The hat indicates omission. The time derivative is interpreted almost everywhere and as a bounded Borel first coefficient in the current action.]
  + #emph[There are finite constants $K_k \, L_k$, independent of the cycle, such that every integral $k$-cycle $B$ in $Y$ satisfies 
#[#set math.equation(numbering: n => "(2.6)")
 $ V \( B \) lt.eq K_k upright(bold(M)) \( B \)^(\( k + 1 \) \/ k) \, #h(2em) V \( B \) lt.eq L_k upright(bold(M)) \( B \) . $ <eq:coarse-fillings>]

 Every such $B$ has a mass-minimizing integral filling in $Y$. If integral $k$-cycles $B_j$ have bounded masses and converge weakly to an integral cycle $B$, then 
#[#set math.equation(numbering: n => "(2.7)")
 $ V \( B_j - B \) arrow.r 0 \, #h(2em) V \( B_j \) arrow.r V \( B \) . $ <eq:filling-continuity>]

]
] <thm:current-background>

#proof[
  The pushforward and Borel-coefficient properties are part of the basic current calculus of #cite(label("AK2000")). The exact restriction identity also follows from the restriction mass bound and the decomposition $C = C corner.l.b E + C corner.l.b \( Y \\ E \)$, using minimality of the mass measure in both directions. The representation in (iii) is the integer-rectifiable representation #cite(label("AK2000")) Lemma 4.1 and Theorem 4.5; subdivision makes chart domains bounded and disjointification makes their images disjoint. The slicing assertion is #cite(label("AK2000")) Theorems 5.6–5.7. The compactness and closure theorems #cite(label("AK2000")) Theorems 5.2 and 8.5 give (ii): completeness is automatic, the bounded normal masses are assumed, and compactness of $Y$ supplies uniform tightness. The product statements, including the action convention, are #cite(label("Wenger2007Flat")) Definition 3.1 and Theorem 3.2. They apply because an integral current is normal and its support in $Y$ is bounded.
  Here is the geometric verification of the filling hypotheses. Choose a point $o$ in the support of a nonzero cycle $B$, and let $H \( t \, x \)$ be the point at fraction $t$ along $\[ o \, x \]$. Triangle comparison gives
  $ d \( H \( t \, x \) \, H \( t \, x' \) \) lt.eq t thin d \( x \, x' \) \, #h(2em) d \( H \( t \, x \) \, H \( s \, x \) \) = \| t - s \| d \( o \, x \) . $
  Thus $H$ is jointly Lipschitz on $\[ 0 \, 1 \] times Y$. On the support of $B$, its time speed is bounded by $D = "diam" \( "spt" B \)$, and its spatial Lipschitz constant is at most one. In each of the $k + 1$ terms of (2.5), a $1$-Lipschitz scalar test after composition with $H$ has time derivative at most $D$, and the remaining spatial derivatives have Lipschitz bounds at most one. The mass bound therefore gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ upright(bold(M)) #scale(x: 120%, y: 120%)[\(] H_(\#) \( \[ 0 \, 1 \] times B \) #scale(x: 120%, y: 120%)[\)] lt.eq \( k + 1 \) D upright(bold(M)) \( B \) . $ <eq:cone-mass-bound>]
  The boundary is $B$: the terminal map is the identity, the initial map is constant and hence has zero pushforward in positive dimension, and $partial B = 0$. The filling is supported on segments from $o$ to $"spt" B$, all lying within distance $D$ of $o$. Consequently the space has local cone inequalities in every positive current dimension. Taking $D lt.eq "diam" Y$ gives the second estimate in (2.6), for example with $L_k = \( k + 1 \) "diam" Y$.
  The complete space $Y$ has the convex geodesic bicombing given by its unique geodesics. Wenger’s Euclidean-exponent isoperimetric theorem #cite(label("Wenger2005Iso")) Theorem 1.2 and Corollary 1.4, or its cone-inequality form applied successively in dimension, gives the first estimate in (2.6) for every $k gt.eq 1$. No sharp value of $K_k$ is used here.
  For a fixed boundary $B$, the cone gives at least one filling. A minimizing sequence has bounded mass and fixed boundary, so (ii) gives an integral weak limit with that boundary. Lower semicontinuity proves attainment. Finally, $Y$ is complete and geodesic, hence quasiconvex, and it has the local cone inequalities in dimensions $1 \, dots.h \, k$ just verified. The cycle assertion in #cite(label("Wenger2007Flat")) Theorem 1.4 applies to the weakly convergent sequence $B_j$: its normal masses are bounded because its boundary masses are zero. It gives $V \( B_j - B \) arrow.r 0$ directly. Finiteness and subadditivity of filling volume imply
  $ \| V \( B_j \) - V \( B \) \| lt.eq V \( B_j - B \) \, $
  which proves the second limit. ◻
]

=== 2.3 An extremizing cycle and its normalization <an-extremizing-cycle-and-its-normalization>

Fix a cycle dimension $n gt.eq 2$, and put $q_0 = \( n + 1 \) \/ n$. The following variational device turns a hypothetical violation of the sharp filling bound into a cycle with a controlled first variation.

#thm([Lemma 2.3.])[
  (Positive extremizer).  #emph[Let $c > 0$. If the functional 
$ B mapsto V \( B \) - c upright(bold(M)) \( B \)^(q_0) $

 is positive on some integral $n$-cycle in $Y$, it attains a positive maximum on such cycles. A maximizing cycle $A$, with $m = upright(bold(M)) \( A \) > 0$, satisfies 
#[#set math.equation(numbering: n => "(2.9)")
 $ c #scale(x: 120%, y: 120%)[\(] m^(q_0) - upright(bold(M)) \( B \)^(q_0) #scale(x: 120%, y: 120%)[\)] lt.eq V \( A - B \) #h(2em) upright("for every integral ") n upright("-cycle ") B upright(" in ") Y . $ <eq:extremizer>]

]
] <lem:extremizer>

#proof[
  The linear bound in (2.6) implies
  $ V \( B \) - c upright(bold(M)) \( B \)^(q_0) lt.eq L_n upright(bold(M)) \( B \) - c upright(bold(M)) \( B \)^(q_0) . $
  The right side has finite supremum, and positivity implies $upright(bold(M)) \( B \) < \( L_n \/ c \)^n$. A positive maximizing sequence therefore has uniformly bounded masses and zero boundaries. By Theorem 4, a subsequence converges weakly to an integral cycle $A$. Filling continuity and lower semicontinuity of mass give
  $ V \( A \) - c upright(bold(M)) \( A \)^(q_0) gt.eq limsup_j #scale(x: 120%, y: 120%)[\(] V \( B_j \) - c upright(bold(M)) \( B_j \)^(q_0) #scale(x: 120%, y: 120%)[\)] . $
  Thus $A$ attains the positive supremum, and in particular $upright(bold(M)) \( A \) > 0$. Maximality and subadditivity now give
  $ c #scale(x: 120%, y: 120%)[\(] upright(bold(M)) \( A \)^(q_0) - upright(bold(M)) \( B \)^(q_0) #scale(x: 120%, y: 120%)[\)] lt.eq V \( A \) - V \( B \) lt.eq V \( A - B \) \, $
  which is (2.9). ◻
]

Suppose that the desired sharp inequality fails in dimension $n$ in a compact $"CAT" \( 0 \)$ space. Attainment in Theorem 4 makes the failure a strict inequality $V \( B \) > c_n upright(bold(M)) \( B \)^(q_0)$ for some nonzero cycle. Choose $c > c_n$ below this ratio, and apply Lemma 5. We write $mu = parallel A parallel$ and $m = upright(bold(M)) \( A \)$.

Multiplication of all distances by a positive factor $a$ multiplies the mass of a $j$-current by exactly $a^j$. The upper bound follows from Lipschitz pushforward under the identity map, and the reverse bound follows by applying the same estimate to its inverse. This identifies the integral chain groups before and after scaling and gives the same scaling law for filling volume. Both terms of the maximizing functional therefore scale by $a^(n + 1)$, so maximality is preserved. Choose the factor to arrange

#[#set math.equation(numbering: n => "(2.10)")
 $ m = \( \( n + 1 \) c \)^(- n) < s_n \, #h(2em) c q_0 m^(1 \/ n) = 1 / n . $ <eq:normalization>]

The strict inequality follows from $c > c_n = 1 \/ \( \( n + 1 \) s_n^(1 \/ n) \)$. We retain the notation $Y \, A \, mu \, m$ for these rescaled objects. The space is still compact and $"CAT" \( 0 \)$, and the current-theoretic inputs remain applicable.

=== 2.4 Metric differentiation and Euclidean chart norms <metric-differentiation-and-euclidean-chart-norms>

The contradiction now rests on an extremizing cycle of mass $m < s_n$. To compare its mass loss under radial variation with the mass swept out, we need chart formulas with their exact Euclidean coefficients. We prove these formulas for a general integral current $C$: first identify the metric differential, then recover the mass by scalar current tests, and finally use integer multiplicity to obtain a lower density.

Fix $C in upright(bold(I))_k \( Y \)$ and charts as in Theorem 4. Kirchheim’s metric differentiation theorem #cite(label("Kirchheim1994")) Theorem 2, in the two-moving-point formulation #cite(label("Duda2007")) Definition (1.3) and Theorem 1.1, gives at almost every chart point $z$ a seminorm $N_z$ such that

#[#set math.equation(numbering: n => "(2.11)")
 $ d #scale(x: 120%, y: 120%)[\(] phi.alt_i \( z + w \) \, phi.alt_i \( z + w' \) #scale(x: 120%, y: 120%)[\)] = N_z \( w - w' \) + o \( \| w \| + \| w' \| \) $ <eq:two-point-metric-differential>]

as the two domain points tend to $z$ within $E_i$.

To apply the Euclidean-domain statement to a Borel domain, first embed $Y$ isometrically into $ell^oo \( Y \)$. More explicitly, choose $z_(*) in E_i$ and use the coordinates

$ z mapsto d \( phi.alt_i \( z \) \, y \) - d \( phi.alt_i \( z_(*) \) \, y \) \, #h(2em) y in Y . $

Each coordinate is $L$-Lipschitz for $L = "Lip" \( phi.alt_i \)$ and vanishes at $z_(*)$. By McShane’s scalar extension theorem, extend each separately to $bb(R)^k$ with the same Lipschitz constant; see #cite(label("Rieffel2006")) Theorem 2.1 and Proposition 2.2 for the scalar and coordinatewise formulations. These extensions have absolute value at most $L \| z - z_(*) \|$, uniformly over the coordinates, so together they define an $ell^oo \( Y \)$-valued Lipschitz map. Metric differentiation of this extension gives (2.11) on the original domain. This auxiliary extension is used only for differentiation; all curvature comparisons below concern original image points in $Y$.

#thm([Lemma 2.4.])[
  (Euclidean chart metrics).  #emph[For almost every density point $z in E_i$, the seminorm in (2.11) is a Euclidean norm. Thus there is a measurable positive definite matrix $G_i \( z \)$ with 
#[#set math.equation(numbering: n => "(2.12)")
 $ N_z \( w \)^2 = w^(sans(T)) G_i \( z \) w \, #h(2em) J_i \( z \) = sqrt(det G_i \( z \)) . $ <eq:chart-metric>]

 In particular, 
#[#set math.equation(numbering: n => "(2.13)")
 $ d \( phi.alt_i \( z + w \) \, phi.alt_i \( z \) \) = \| w \|_(G_i \( z \)) + o \( \| w \| \) quad \( z + w in E_i \) . $ <eq:centered-metric-differential>]

]
] <lem:euclidean-chart-metrics>

#proof[
  At a density-one point $z$ of $E_i$, every fixed finite configuration in $bb(R)^k$ can be approximated by points of $\( E_i - z \) \/ t$ as $t arrow.b 0$. Indeed, a point of such a configuration that stayed a positive distance from $\( E_i - z \) \/ t$ along a sequence of scales would give a missing Euclidean ball of radius comparable to $t$ at distance $O \( t \)$ from $z$, contradicting density one. Applying this observation to a single direction and using the bi-Lipschitz lower bound for $phi.alt_i$ shows that $N_z \( w \) gt.eq "Lip" \( phi.alt_i^(- 1) \)^(- 1) \| w \|$. The upper Lipschitz bound gives $N_z \( w \) lt.eq "Lip" \( phi.alt_i \) \| w \|$. Thus $N_z$ is a norm.
  For any four points $a \, b \, c \, d$ of a $"CAT" \( 0 \)$ space,
  #[#set math.equation(numbering: n => "(2.14)")
   $ d \( a \, c \)^2 + d \( b \, d \)^2 lt.eq d \( a \, b \)^2 + d \( b \, c \)^2 + d \( c \, d \)^2 + d \( d \, a \)^2 . $ <eq:cat0-quadrilateral>]
  To verify this, let $m$ be the midpoint of $\[ a \, c \]$. Midpoint comparison bounds $d \( b \, m \)^2$ and $d \( d \, m \)^2$ by the corresponding average squared distances to $a \, c$, minus $d \( a \, c \)^2 \/ 4$. Combine these bounds with $d \( b \, d \)^2 lt.eq 2 d \( b \, m \)^2 + 2 d \( d \, m \)^2$ to obtain (2.14).
  Approximate the four Euclidean domain points $0 \, u \, u + v \, v$ by scaled points of $E_i - z$. Apply (2.14) to their images, divide by $t^2$, and use the two-point differential (2.11). It follows that
  $ N_z \( u + v \)^2 + N_z \( u - v \)^2 lt.eq 2 N_z \( u \)^2 + 2 N_z \( v \)^2 . $
  Apply the same inequality to $\( u + v \) \/ 2$ and $\( u - v \) \/ 2$, and use homogeneity, to obtain the reverse inequality. The parallelogram law therefore holds. Polarization produces a positive definite inner product and the matrix $G_i \( z \)$ in (2.12). Its entries are measurable, since they are finite linear combinations of squared metric differentials in fixed rational directions. Setting $w' = 0$ proves (2.13). ◻
]

The same bounds give, on each chart separately,

#[#set math.equation(numbering: n => "(2.15)")
 $ "Lip" \( phi.alt_i^(- 1) \)^(- 2) I lt.eq G_i \( z \) lt.eq "Lip" \( phi.alt_i \)^2 I \, #h(2em) "Lip" \( phi.alt_i^(- 1) \)^(- k) lt.eq J_i \( z \) lt.eq "Lip" \( phi.alt_i \)^k . $ <eq:chart-metric-bounds>]

These constants may depend on the chart; no uniform bound across the chart family will be needed.

For a Lipschitz scalar function $u$ on $Y$, define its chart covector $D u$ by differentiating $u compose phi.alt_i$ and transporting that covector to $Z_i$. Norms and inner products of these covectors use the dual matrix $G_i^(- 1)$. Differentiating the scalar Lipschitz inequality at density points gives

#[#set math.equation(numbering: n => "(2.16)")
 $ \| D u \| lt.eq "Lip" \( u \) . $ <eq:gradient-lipschitz>]

Indeed, the derivative in every direction is bounded by $"Lip" \( u \) N_z$, which is exactly the dual-norm bound. The chart covectors obey the linear and product rules and the usual chain rule for continuously differentiable scalar compositions. A scalar Lipschitz function has zero chart derivative almost everywhere on any fixed level set: differentiate at density points of that level set. These statements initially hold almost everywhere in each Euclidean chart. Proposition 8 below identifies the same exceptional sets as mass-null sets.

=== 2.5 Quadratic mass bounds and exact chart mass <quadratic-mass-bounds-and-exact-chart-mass>

The chart differential is Euclidean. The next two statements convert that infinitesimal geometry into mass estimates with no dimensional loss: a quadratic upper form controls mass from above, and inverse chart coordinates recover the matching lower bound.

#thm([Lemma 2.5.])[
  (A quadratic majorant for mass).  #emph[Suppose that a finite-mass $d$-current $C$ has a representation by countably many determinant integrals with Lipschitz maps $psi_i : F_i arrow.r Y$, Borel sets $F_i subset bb(R)^d$, and real signed weights $theta.alt_i$. Suppose that, at almost every point carrying these weights, there is a measurable nonnegative quadratic form $P_i \( z \)$ such that 
#[#set math.equation(numbering: n => "(2.17)")
 $ d \( psi_i \( z + w \) \, psi_i \( z \) \)^2 lt.eq P_i \( z \) \[ w \, w \] + o \( \| w \|^2 \) \, #h(2em) z + w in F_i . $ <eq:quadratic-distance-majorant>]

 If the measure 
#[#set math.equation(numbering: n => "(2.18)")
 $ eta = sum_i \( psi_i \)_(\#) #scale(x: 120%, y: 120%)[\(] \| theta.alt_i \| sqrt(det P_i) thin d z #scale(x: 120%, y: 120%)[\)] $ <eq:quadratic-mass-majorant>]

 is finite, then $parallel C parallel lt.eq eta$. No normality of the separate chart currents is required.]
] <lem:quadratic-mass>

#proof[
  Fix a tuple of $d$ scalar $1$-Lipschitz tests. Almost everywhere on each domain their compositions with $psi_i$ are differentiable in the sense of scalar Lipschitz extensions. If $ell$ is one of the resulting derivative rows, (2.17) gives
  $ \| ell \( w \) \| lt.eq sqrt(P_i \( z \) \[ w \, w \]) #h(2em) \( w in bb(R)^d \) . $
  To see the bound in an arbitrary direction, approximate that direction by rescaled domain points at a density-one point, and then use differentiability and (2.17). If $P_i$ is positive definite, transform it to the identity and apply Hadamard’s inequality to the rows. Their absolute determinant is at most $sqrt(det P_i)$. If $P_i$ is singular, all rows vanish on its kernel; the full determinant and $det P_i$ both vanish, giving the same bound. Substitution in the representation yields (2.2) with the measure $eta$.
  The exceptional set is allowed to depend on the fixed test tuple. The measure $eta$ is independent of that tuple and controls every tuple separately; this is precisely what the definition of mass requires. ◻
]

#thm([Proposition 2.6.])[
  (Exact chart mass).  #emph[For the representation (2.3), let $G_i \, J_i$ be as in (2.12). Then 
#[#set math.equation(numbering: n => "(2.19)")
 $ parallel C parallel = sum_i \( phi.alt_i \)_(\#) #scale(x: 120%, y: 120%)[\(] \| theta_i \| J_i thin d z #scale(x: 120%, y: 120%)[\)] . $ <eq:chart-mass>]

 Thus, with $rho_i = \| theta_i \| J_i$, integration against the current mass is integration against $rho_i thin d z$ on the disjoint charts.]
] <prop:chart-mass>

#proof[
  Denote the right side of (2.19) by $eta$, initially allowing $eta \( Y \) = oo$. We first prove $eta lt.eq parallel C parallel$; this will also establish finiteness before we apply the preceding lemma.
  Fix $0 < epsilon < 1$. Each chart domain, up to a Lebesgue-null set, has a countable Borel partition into pieces $E$ on which there is a fixed positive definite matrix $Q$, depending on the piece, satisfying
  #[#set math.equation(numbering: n => "(2.20)")
   $ \( 1 - epsilon \) \| z - z' \|_Q lt.eq d \( phi.alt_i \( z \) \, phi.alt_i \( z' \) \) lt.eq \( 1 + epsilon \) \| z - z' \|_Q \, #h(2em) z \, z' in E . $ <eq:almost-isometric-chart-piece>]
  Here is a construction. Approximate the measurable matrix $G_i \( z \)$ by an element of a countable dense family of positive definite matrices, with a sufficiently small relative error. The centered estimate (2.13) then gives a radius $1 \/ l$, depending on the point, on which the two inequalities with this fixed matrix and the prescribed $epsilon$ hold against every other point of the original chart domain. Group points according to the matrix and $l$, subdivide into sets of diameter less than $1 \/ l$, and disjointify. These sets can be chosen Borel. Indeed, for any fixed matrix and radius, the non-strict distance inequalities against all domain points with $0 < \| z - z' \| < 1 \/ l$ can be tested on a fixed countable dense subset of the domain, using continuity in $z'$. All metric differentiability points are covered by this countable construction.
  At almost every density point of a piece $E$, differentiation of (2.20) in domain directions gives
  $ \| w \|_(G_i \( z \)) lt.eq \( 1 + epsilon \) \| w \|_Q \, #h(2em) J_i \( z \) lt.eq \( 1 + epsilon \)^k sqrt(det Q) . $
  On $phi.alt_i \( E \)$, every scalar coordinate of $Q^(1 \/ 2) phi.alt_i^(- 1)$ is $\( 1 - epsilon \)^(- 1)$-Lipschitz by the lower inequality in (2.20). By McShane’s theorem #cite(label("Rieffel2006")) Theorem 2.1, extend these coordinates separately to all of $Y$, preserving that Lipschitz constant, and call the resulting tuple $pi$.
  For any Borel subset $D subset E$, choose the bounded Borel first coefficient supported on $phi.alt_i \( D \)$ and equal there to $"sgn" \( theta_i \) compose phi.alt_i^(- 1)$. At density points of $E$, the extended coordinates have the same derivatives as $Q^(1 \/ 2) z$, since they agree with them on the piece. The images of all original charts are disjoint. Hence (2.3), applied to this coefficient and tuple, gives exactly
  $ integral_D \| theta_i \| sqrt(det Q) thin d z = C \( b \, pi_1 \, dots.h \, pi_k \) lt.eq \( 1 - epsilon \)^(- k) parallel C parallel \( phi.alt_i \( D \) \) . $
  The mass bound is legitimate for this Borel coefficient by its standard extension from the first slot. Combining the last two estimates gives
  $ integral_D \| theta_i \| J_i thin d z lt.eq (frac(1 + epsilon, 1 - epsilon))^k parallel C parallel \( phi.alt_i \( D \) \) . $
  For a Borel set $B subset Y$, take $D = E ∩ phi.alt_i^(- 1) \( B \)$ and sum over all pieces and all charts. Their images are disjoint, while discarded Lebesgue-null sets make no contribution to $eta$. Thus
  $ eta \( B \) lt.eq (frac(1 + epsilon, 1 - epsilon))^k parallel C parallel \( B \) . $
  This proves that $eta$ is finite; letting $epsilon arrow.b 0$ gives $eta lt.eq parallel C parallel$.
  Conversely, (2.13) gives the quadratic majorant $P_i = G_i$ for every chart. Its measure (2.18) is exactly the now finite measure $eta$. Lemma 7 yields $parallel C parallel lt.eq eta$, which completes the proof of the equality. ◻
]

We have established the exact mass formula, including arbitrary signed integer multiplicities. Its next consequence is a lower density with the Euclidean unit-ball coefficient; this is where integrality will enter the sharp radial contradiction quantitatively.

#thm([Lemma 2.7.])[
  (Euclidean lower density).  #emph[For an integral $k$-current $C$ in $Y$, 
#[#set math.equation(numbering: n => "(2.21)")
 $ liminf_(rho arrow.b 0) rho^(- k) parallel C parallel \( B \( y \, rho \) \) gt.eq omega_k #h(2em) upright("for ") parallel C parallel upright("-almost every ") y . $ <eq:euclidean-lower-density>]

 The balls in this statement are open.]
] <lem:euclidean-density>

#proof[
  By Proposition 8, it suffices to take $y = phi.alt_i \( z \)$, where $z$ is a density-one point of $E_i$, the metric differential exists, $z$ is a Lebesgue point of $rho_i = \| theta_i \| J_i$ extended by zero off $E_i$, and $\| theta_i \( z \) \| gt.eq 1$. These conditions hold at almost every point carrying chart mass. Fix $epsilon > 0$. For all sufficiently small $rho$, the domain points in the ellipsoid
  $ { z + w : \| w \|_(G_i \( z \)) < rho \/ \( 1 + epsilon \) } $
  map into $B \( y \, rho \)$, by (2.13). This ellipsoid has volume
  $ frac(omega_k rho^k, \( 1 + epsilon \)^k J_i \( z \)) . $
  Lebesgue differentiation on dilates of this fixed ellipsoid shows that the contribution of this chart to $rho^(- k) parallel C parallel \( B \( y \, rho \) \)$ has lower limit at least $omega_k \| theta_i \( z \) \| \/ \( 1 + epsilon \)^k$. Other charts contribute nonnegative mass. Letting $epsilon arrow.b 0$ and using $\| theta_i \( z \) \| gt.eq 1$ proves (2.21). ◻
]

All subsequent chart covectors and their inner products are understood with these metrics and the exact mass formula. In particular (2.16) holds $parallel C parallel$-almost everywhere. For a cycle $C$, the boundary action and the product rule give

#[#set math.equation(numbering: n => "(2.22)")
 $ C \( b \, u \, pi_1 \, dots.h \, pi_(k - 1) \) = - C \( u \, b \, pi_1 \, dots.h \, pi_(k - 1) \) $ <eq:cycle-product-rule>]

for Lipschitz scalar tests. Indeed, the sum of the two sides before moving a term is $C \( 1 \, b u \, pi \) = partial C \( b u \, pi \) = 0$. These identities concern the whole cycle. None of the preceding arguments asserts that the separate restrictions to Borel chart images have finite boundary mass.

The normalized cycle $A$ has all the chart formulas just proved. In the next section we apply them to its radial deformation and to the swept current, and compare the two masses through (2.9).

== 3 Radial variation and the two-dimensional base case <sec:radial>

Fix a dimension $n gt.eq 2$ and suppose that the sharp filling inequality fails in a compact CAT(0) space. Let $Y$, $A$, $mu = parallel A parallel$, $m$, and $c > c_n$ be the rescaled space, cycle, mass measure, mass, and constant provided by Lemma 5. Thus (2.9) and (2.10) hold, with $q_0 = \( n + 1 \) \/ n$. The differential notation throughout this section is that of Proposition 8; in particular, norms and inner products of spatial covectors use the inverse chart metric.

#thm([Proposition 3.1.])[
  (Radial first variation).  #emph[For every center $y in Y$, write $r \( x \) = d \( y \, x \)$. Every nonnegative Lipschitz function $g : Y arrow.r bb(R)$ satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ integral_Y #scale(x: 120%, y: 120%)[\(] n g + r thin D r dot.op D g #scale(x: 120%, y: 120%)[\)] thin d mu lt.eq n integral_Y r g sqrt(1 - \| D r \|^2) thin d mu . $ <eq:radial>]

 The square root is defined $mu$-almost everywhere by $\| D r \| lt.eq 1$.]
] <prop:radial>

#proof[
  Fix $y$ and $g$. Put $R = "diam" Y$ and $M_g = parallel g parallel_oo$, and choose $h > 0$ small enough that $h M_g lt.eq 1 \/ 2$. For $0 lt.eq t lt.eq h$, let
  $ lambda \( t \, x \) = 1 - t g \( x \) \, #h(2em) F \( t \, x \) = \[ y \, x \]_(lambda \( t \, x \)) \, #h(2em) F_t \( x \) = F \( t \, x \) \, $
  where $\[ y \, x \]_a$ denotes the point at fraction $a$ along the geodesic from $y$ to $x$. In particular, $F_0$ is the identity and $1 \/ 2 lt.eq lambda lt.eq 1$. Equal-fraction CAT(0) comparison and the constant-speed parametrization of a geodesic give
  $ d \( F \( t \, x \) \, F \( t' \, x' \) \) & lt.eq d \( x \, x' \) + R thin \| t g \( x \) - t' g \( x' \) \|\
 & lt.eq #scale(x: 120%, y: 120%)[\(] 1 + h R "Lip" \( g \) #scale(x: 120%, y: 120%)[\)] d \( x \, x' \) + R M_g \| t - t' \| . $
  Thus $F$ is jointly Lipschitz. The currents
  $ B_h = \( F_h \)_(\#) A in upright(bold(I))_n \( Y \) \, #h(2em) D_h = F_(\#) \( \[ 0 \, h \] times A \) in upright(bold(I))_(n + 1) \( Y \) $
  are integral by Theorem 4. Their boundaries are $partial B_h = 0$ and $partial D_h = B_h - A$.
  #emph[Comparison forms.] We first establish precise differential upper bounds for these maps. For $x \, x' in Y$ and two fractions $lambda \, lambda' in \[ 0 \, 1 \]$, Euclidean comparison for the triangle with vertices $y \, x \, x'$ gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ d \( \[ y \, x \]_lambda \, \[ y \, x' \]_(lambda') \)^2 lt.eq \( lambda r - lambda' r' \)^2 + lambda lambda' #scale(x: 120%, y: 120%)[\(] d \( x \, x' \)^2 - \( r - r' \)^2 #scale(x: 120%, y: 120%)[\)] \, $ <eq:radial-two-point>]
  where $r = d \( y \, x \)$ and $r' = d \( y \, x' \)$. Indeed, the expression on the right is exactly the squared distance between the corresponding points in the Euclidean comparison triangle. This remains valid for degenerate triangles.
  Take the disjoint charts $phi.alt_i : E_i arrow.r Y$ from Proposition 8, with metric matrices $G_i$, $J_i = sqrt(det G_i)$, and signed multiplicities $theta_i$. At almost every density point $z in E_i$, the metric differential (2.12) and the derivatives of $r compose phi.alt_i$ and $g compose phi.alt_i$ exist. At such a point write
  $ alpha = D \( r compose phi.alt_i \) \( z \) \, #h(2em) gamma = D \( g compose phi.alt_i \) \( z \) \, $
  and abbreviate $r = r \( phi.alt_i \( z \) \)$, $g = g \( phi.alt_i \( z \) \)$, and $lambda = 1 - t g$. Thus $alpha$ and $gamma$ represent $D r$ and $D g$ in this chart. Equation (2.16) yields $\| alpha \|_(G_i^(- 1)) lt.eq 1$ and $\| gamma \|_(G_i^(- 1)) lt.eq "Lip" \( g \)$.
  Set $F_i \( t \, z \) = F \( t \, phi.alt_i \( z \) \)$. The quadratic forms
  #[#set math.equation(numbering: n => "(3.3)")
   $ P_(upright("tot")) & = lambda^2 \( G_i - alpha ⊗ alpha \) + \( lambda alpha - t r gamma - r g thin d t \) ⊗ \( lambda alpha - t r gamma - r g thin d t \) \,\
P_(upright("sp")) & = lambda^2 \( G_i - alpha ⊗ alpha \) + \( lambda alpha - t r gamma \) ⊗ \( lambda alpha - t r gamma \) $ <eq:radial-total-form>]
  are nonnegative. In the first expression, the first summand acts only on spatial vectors. For increments $\( s \, w \)$ for which $\( t + s \, z + w \) in \[ 0 \, h \] times E_i$, they satisfy
  #[#set math.equation(numbering: n => "(3.4)")
   $ d \( F_i \( t + s \, z + w \) \, F_i \( t \, z \) \)^2 lt.eq P_(upright("tot")) \( \( s \, w \) \, \( s \, w \) \) + o \( \| s \|^2 + \| w \|^2 \) . $ <eq:radial-differential-upper>]
  To see this, the derivative of $\( 1 - t g \) r$ is $lambda alpha - t r gamma - r g thin d t$, while
  $ d \( phi.alt_i \( z + w \) \, phi.alt_i \( z \) \)^2 - \( r \( phi.alt_i \( z + w \) \) - r \( phi.alt_i \( z \) \) \)^2 = \( G_i - alpha ⊗ alpha \) \( w \, w \) + o \( \| w \|^2 \) . $
  Substitution into (3.2) proves (3.4); changing the factor $lambda lambda'$ to $lambda^2$ contributes only a higher-order error. Taking $s = 0$ gives the corresponding upper bound with $P_(upright("sp"))$ for the fixed-time map. These statements are needed separately for each fixed $y$ and $g$; no common exceptional set for all centers or all functions is required.
  #emph[Determinants of the upper forms.] We next compute the determinants. At the point under consideration choose spatial coordinates orthonormal for $G_i$. In these coordinates (3.3) becomes
  $ P_(upright("sp")) & = lambda^2 I - lambda t r \( alpha gamma^top + gamma alpha^top \) + t^2 r^2 gamma gamma^top\
 & = I - t #scale(x: 120%, y: 120%)[\(] 2 g I + r \( alpha gamma^top + gamma alpha^top \) #scale(x: 120%, y: 120%)[\)] + O \( t^2 \) . $
  The derivative at the identity of $H mapsto sqrt(det H)$ is $H' mapsto 1 / 2 "tr" H'$. Returning to the original chart coordinates therefore gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ sqrt(det P_(upright("sp"))) / J_i = 1 - t #scale(x: 120%, y: 120%)[\(] n g + r thin D r dot.op D g #scale(x: 120%, y: 120%)[\)] + O \( t^2 \) . $ <eq:radial-spatial-jacobian>]
  After decreasing $h$ if necessary, the remainder is bounded in absolute value by $C t^2$, where $C$ depends only on $n \, R \, M_g \,$ and $"Lip" \( g \)$. In particular it is independent of the chart and the base point: all the matrix entries in the orthonormal coordinates are controlled by these bounds.
  For the full form, put $H = lambda^2 \( I - alpha alpha^top \)$ in the same coordinates and $u = lambda alpha - t r gamma$. Its matrix in time-first coordinates is
  $ mat(delim: "(", 0, 0; 0, H) + vec(- r g, u) mat(delim: "(", - r g, u^top) . $
  Its determinant is $\( r g \)^2 det H$. For positive definite $H$ this follows directly by subtracting suitable multiples of the first row and column, or by a block determinant calculation; replacing $H$ by $H + epsilon I$ and letting $epsilon arrow.b 0$ proves the identity for every nonnegative $H$. Since $det \( I - alpha alpha^top \) = 1 - \| alpha \|^2$, we obtain the exact identity
  #[#set math.equation(numbering: n => "(3.6)")
   $ sqrt(det P_(upright("tot"))) / J_i = r g lambda^n sqrt(1 - \| D r \|^2) . $ <eq:radial-total-jacobian>]
  Here $r \, g \, lambda$ are nonnegative. In particular, the formula also covers $r g = 0$ and $\| D r \| = 1$.
  Figure 1 separates the fixed-time current from the swept current and illustrates the unequal-fraction comparison. The forms above are upper bounds for the deformed metric; the exact identity is the determinant calculation for the comparison form.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.3, 3.4), [#text(size: 9pt)[\(a\) Slice and sweep]], anchor: "west", padding: 0.1176cm)
  rect((0, 0.2), (2.6, 2.5), fill: rgb("#f2f2ff"), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.2), (2.6, 0.2), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.66), (2.6, 0.66), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.12), (2.6, 1.12), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.58), (2.6, 1.58), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.04), (2.6, 2.04), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.5), (2.6, 2.5), stroke: (paint: rgb("#b2b2ff"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.58), (2.6, 1.58), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-0.35, 0.1), (-0.35, 2.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-0.35, 2.7), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  content((-0.35, 0.2), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  content((-0.35, 2.5), [#text(size: 9pt)[$h$]], anchor: "east", padding: 0.1176cm)
  content((1.3, 2.2), [#text(size: 9pt)[product]])
  content((1.3, 0.9), [#text(size: 9pt)[$[0,h] times A$]])
  content((2.75, 1.58), [#text(size: 9pt)[$\{t\} times A$]], anchor: "west", padding: 0.1176cm)
  content((0, -1.7), [#text(size: 9pt)[$\{t\} times A arrow.r.bar (F_t)_\#A$]], anchor: "west", padding: 0.1176cm)
  content((0, -0.2), [#text(size: 9pt)[$B_h=(F_h)_\#A$]], anchor: "west", padding: 0.1176cm)
  content((0, -0.7), [#text(size: 9pt)[$D_h=F_\#([0,h] times A)$]], anchor: "west", padding: 0.1176cm)
  content((0, -1.2), [#text(size: 9pt)[$partial D_h=B_h-A$]], anchor: "west", padding: 0.1176cm)
  content((5.9, 3.4), [#text(size: 9pt)[\(b\) Unequal fractions]], anchor: "west", padding: 0.1176cm)
  line((6, 0.15), (9.7, 0.15), (8.4, 2.55), close: true, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((8.701, 0.15), (7.272, 1.422), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((6, 0.15), radius: 0.04939, fill: black, stroke: none)
  circle((9.7, 0.15), radius: 0.04939, fill: black, stroke: none)
  circle((8.4, 2.55), radius: 0.04939, fill: black, stroke: none)
  circle((8.701, 0.15), radius: 0.04939, fill: black, stroke: none)
  circle((7.272, 1.422), radius: 0.04939, fill: black, stroke: none)
  content((6, 0.15), [#text(size: 9pt)[$macron(y)$]], anchor: "north-east", padding: 0.1176cm)
  content((9.7, 0.15), [#text(size: 9pt)[$macron(x)$]], anchor: "north-west", padding: 0.1176cm)
  content((8.4, 2.55), [#text(size: 9pt)[$macron(x) '$]], anchor: "south", padding: 0.1176cm)
  content((8.701, 0.15), [#text(size: 9pt)[$p$]], anchor: "north", padding: 0.1176cm)
  content((7.272, 1.422), [#text(size: 9pt)[$p'$]], anchor: "east", padding: 0.1176cm)
  content((7.332, 0.15), [#text(size: 9pt)[$lambda r$]], anchor: "north", padding: 0.1176cm)
  content((6.648, 0.798), [#text(size: 9pt)[$lambda 'r'$]], anchor: "south-east", padding: 0.1176cm)
  content((6, -0.65), [#text(size: 9pt)[$lambda =1-"tg"(x), lambda '=1-"tg"(x')$]], anchor: "west", padding: 0.1176cm)
  content((6, -1.2), [#text(size: 9pt)[$d(F_t(x),F_t(x')) lt.eq |p-p'|$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Radial variation in the whole-current product and its Euclidean comparison triangle. Panel (a) distinguishes a fixed-time slice from the swept current; the stack is symbolic and makes no regularity or injectivity assertion about its image in $Y$. In panel (b), the barred vertices correspond to $y \, x \, x'$; $p$ and $p'$ lie at fractions $lambda$ and $lambda'$ on their radial sides. The fractions may differ even at the same time because $g$ varies with the point. The comparison distance gives the upper bound (3.2). The exact determinant in (3.6) belongs to the quadratic upper form, rather than an asserted exact differential of the deformed map. ],
  ) <fig:radial-variation>
  #emph[From whole-current products to mass.] The spatial determinant will bound the endpoint cycle mass; the full determinant will bound the swept filling mass. We now pass from the comparison forms to these two current bounds. The chart formula (2.3) gives, for a bounded Lipschitz coefficient $b$ and Lipschitz functions $pi_1 \, dots.h \, pi_n$ on $Y$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ B_h \( b \, pi_1 \, dots.h \, pi_n \) = sum_i integral_(E_i) & theta_i \( z \) b \( F_i \( h \, z \) \)\
 &  dot.op det D_z \( pi_1 compose F_i \( h \, dot.op \) \, dots.h \, pi_n compose F_i \( h \, dot.op \) \) \( z \) thin d z . $ <eq:radial-pushforward-action>]
  For the homotopy current, the corresponding formula is
  #[#set math.equation(numbering: n => "(3.8)")
   $ D_h \( b \, pi_1 \, dots.h \, pi_(n + 1) \) = sum_i integral_0^h integral_(E_i) & theta_i \( z \) b \( F_i \( t \, z \) \)\
 &  dot.op det D_(\( t \, z \)) \( pi_1 compose F_i \, dots.h \, pi_(n + 1) compose F_i \) \( t \, z \) thin d z thin d t . $ <eq:radial-product-action>]
  To obtain this formula, apply the interval product to the whole current $A$. Write $psi_a \( t \, x \) = pi_a \( F \( t \, x \) \)$ and $tilde(b) \( t \, x \) = b \( F \( t \, x \) \)$. Inserting these functions into (2.5) expresses the left side as
  $ integral_0^h sum_(a = 1)^(n + 1) \( - 1 \)^(a + 1) A #scale(x: 120%, y: 120%)[\(] tilde(b)_t thin partial_t psi_a \( t \, dot.op \) \, psi_1 \( t \, dot.op \) \, dots.h \, accent(psi_a \( t \, dot.op \), ̂) \, dots.h \, psi_(n + 1) \( t \, dot.op \) #scale(x: 120%, y: 120%)[\)] thin d t . $
  The time derivatives admit bounded Borel versions and exist for $d t thin d mu$-almost every $\( t \, x \)$. For a fixed test tuple they have uniform bounds, as do the spatial chart-covector norms of the $psi_a \( t \, dot.op \)$. Inserting (2.3), every cofactor in the resulting expansion is bounded by a constant times $J_i$, by Euclidean determinant bounds. The sum of the absolute integrals is consequently bounded by $C h sum_i integral_(E_i) \| theta_i \| J_i thin d z = C h m$. Fubini’s theorem therefore permits both the insertion and the interchange of the sum and integrals. Expansion in the time column gives exactly (3.8). The separate derivatives agree almost everywhere with the joint derivatives of the Lipschitz scalar compositions on $\[ 0 \, h \] times E_i$. This proves the formula without assigning a boundary to any individual chart piece.
  The two action formulas are determinant representations of the finite-mass currents $B_h$ and $D_h$. Their maps have the respective quadratic majorants $P_(upright("sp")) \( h \, z \)$ and $P_(upright("tot")) \( t \, z \)$ from (3.4). Consider the measures obtained by pushing forward
  $ \| theta_i \( z \) \| sqrt(det P_(upright("sp")) \( h \, z \)) thin d z quad upright("and") quad \| theta_i \( z \) \| sqrt(det P_(upright("tot")) \( t \, z \)) thin d t thin d z $
  under $F_i \( h \, dot.op \)$ and $F_i$, respectively, and summing over $i$. They are finite: (3.5) bounds the spatial density by a uniform multiple of $\| theta_i \| J_i$, while (3.6) bounds the product density by $R M_g \| theta_i \| J_i$. Their integrals are therefore controlled by $m$ and $h m$, using (2.19). Lemma 7 now bounds the two current mass measures by these measures. That lemma includes singular quadratic forms and permits differentiation null sets to depend on the fixed test tuple.
  Combining these bounds with (2.19), (3.5), and (3.6), and using $lambda^n lt.eq 1$, gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ upright(bold(M)) \( B_h \) & lt.eq m - h integral_Y \( n g + r thin D r dot.op D g \) thin d mu + O \( h^2 \) \,\
upright(bold(M)) \( D_h \) & lt.eq h integral_Y r g sqrt(1 - \| D r \|^2) thin d mu . $ <eq:radial-spatial-mass>]
  The constant in the first remainder is finite because the pointwise remainder was uniform and $mu \( Y \) = m < oo$.
  #emph[Using maximality.] The spatial mass decrease and the swept filling mass are now controlled by the same radial test. We apply the extremizer inequality to compare them. Set
  $ I_g = integral_Y \( n g + r thin D r dot.op D g \) thin d mu \, #h(2em) H_g = integral_Y r g sqrt(1 - \| D r \|^2) thin d mu . $
  Choose a constant $C$ so that $upright(bold(M)) \( B_h \) lt.eq U_h := m - h I_g + C h^2$ for all sufficiently small $h > 0$. Since $m > 0$, also $U_h > 0$ for such $h$. The current $- D_h$ fills $A - B_h$, so (2.9) and the monotonicity of $s mapsto s^(q_0)$ give
  $ c \( m^(q_0) - U_h^(q_0) \) lt.eq c \( m^(q_0) - upright(bold(M)) \( B_h \)^(q_0) \) lt.eq V \( A - B_h \) lt.eq upright(bold(M)) \( D_h \) lt.eq h H_g . $
  Dividing by $h$ and letting $h arrow.b 0$ yields $c q_0 m^(1 \/ n) I_g lt.eq H_g$. The normalization $c q_0 m^(1 \/ n) = 1 \/ n$ in (2.10) is precisely (3.1). ◻
]

The radial inequality already settles the first dimension of the induction. An inverse-square cutoff isolates the Euclidean density at one center and recovers exactly the sphere area $4 pi$.

#thm([Proposition 3.2.])[
  (Sharp filling in cycle dimension two).  #emph[Let $Y$ be a compact CAT(0) space. Every integral two-cycle $T in upright(bold(I))_2 \( Y \)$ admits $S in upright(bold(I))_3 \( Y \)$ with 
$ partial S = T \, #h(2em) upright(bold(M)) \( S \) lt.eq c_2 upright(bold(M)) \( T \)^(3 \/ 2) = frac(upright(bold(M)) \( T \)^(3 \/ 2), 6 sqrt(pi)) . $

]
] <prop:base>

#proof[
  If this inequality failed, Lemma 5 in dimension $n = 2$ would produce a normalized nonzero cycle $A$ as above with
  #[#set math.equation(numbering: n => "(3.10)")
   $ m < s_2 = 4 pi . $ <eq:base-small-mass>]
  Choose a center $y$ for which Lemma 9 gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ liminf_(epsilon arrow.b 0) epsilon^(- 2) mu \( B \( y \, epsilon \) \) gt.eq omega_2 = pi . $ <eq:base-density>]
  Such a center exists because the density statement holds $mu$-almost everywhere and $m > 0$.
  Let $r = d \( y \, dot.op \)$. For $0 < epsilon < 1$ such that $mu { r = epsilon } = 0$, the function
  $ g_epsilon \( x \) = max { r \( x \) \, epsilon }^(- 2) $
  is a nonnegative Lipschitz function on $Y$, so it is admissible in Proposition 10. On ${ r < epsilon }$ its gradient is zero and
  $ 2 g_epsilon + r thin D r dot.op D g_epsilon = 2 epsilon^(- 2) \, #h(2em) 2 r g_epsilon sqrt(1 - \| D r \|^2) lt.eq 2 epsilon^(- 1) . $
  On ${ r > epsilon }$ the chain rule gives $D g_epsilon = - 2 r^(- 3) D r$. Writing $b = r^(- 1) sqrt(1 - \| D r \|^2)$ there, the same two integrands are $2 b^2$ and $2 b$, respectively. The separating level has zero $mu$-measure by our choice of $epsilon$. Therefore (3.1) implies
  #[#set math.equation(numbering: n => "(3.12)")
   $ \( 2 - 2 epsilon \) epsilon^(- 2) mu \( B \( y \, epsilon \) \) & lt.eq integral_({ r > epsilon }) \( 2 b - 2 b^2 \) thin d mu\
 & lt.eq m / 2 \, $ <eq:base-cutoff-estimate>]
  where the last inequality is the elementary bound $2 b - 2 b^2 = 1 / 2 - 2 \( b - 1 / 2 \)^2 lt.eq 1 / 2$.
  Only countably many levels of a real function can carry positive mass under a finite measure, so eligible $epsilon$ tend to zero. Taking the lower limit of (3.12) along such radii and using (3.11) yields $2 pi lt.eq m \/ 2$, or $m gt.eq 4 pi$. This contradicts (3.10). The least filling mass is therefore at most $c_2 upright(bold(M)) \( T \)^(3 \/ 2)$, and attainment from Theorem 4 supplies the required integral filling. The zero cycle is filled by the zero current. ◻
]

The induction is now initialized, with an attained integral filling in dimension two. In the remaining sections $n > 2$, and the only sharp lower-dimensional input is the theorem in dimension $n - 1$, applied to boundaries of small restrictions of the extremizing $n$-cycle.

== 4 An almost Euclidean critical Sobolev inequality <sec:sobolev>

Throughout this section, $n > 2$, and the sharp filling theorem in dimension $n - 1$ is assumed. We work with the extremizing cycle $A in upright(bold(I))_n \( Y \)$ of Lemma 5, normalized as in (2.10). In particular, $Y$ is compact and CAT(0), $mu = parallel A parallel$, $m = upright(bold(M)) \( A \) > 0$, and

$ q_0 = frac(n + 1, n) \, #h(2em) c q_0 m^(1 \/ n) = 1 / n . $

The covectors $D u$ and their norms are those of Proposition 8. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ beta = frac(1, n - 2) \, #h(2em) p = frac(2 n, n - 2) \, #h(2em) S_(*) = n s_n^(2 \/ n) \, #h(2em) E \( u \) = integral_Y \| D u \|^2 thin d mu . $ <eq:sobolev-notation>]

Unless another measure is specified, function norms in this section are taken with respect to $mu$.

Our objective is an almost sharp critical estimate

$ \( S_(*) - epsilon.alt \) parallel u parallel_p^2 lt.eq 4 beta E \( u \) + C_epsilon.alt parallel u parallel_2^2 $

uniformly over Lipschitz $u$. We first use the dimension $n - 1$ filling theorem to control the boundary mass of small restrictions of $A$. Coarea and rearrangement transfer this estimate to functions with small support; a level truncation then gives the displayed bound for every $u$.

=== 4.1 Small sets and intrinsic coarea <small-sets-and-intrinsic-coarea>

#thm([Proposition 4.1.])[
  (Uniform small-set isoperimetry).  #emph[For every $eta in \( 0 \, 1 \)$ there is a number $delta in \( 0 \, m \/ 2 \)$, independent of the Lipschitz function $u : Y arrow.r bb(R)$, with the following property. Put 
$ a \( t \) = mu { u > t } \, #h(2em) U_t = A corner.l.b { u > t } \, #h(2em) P \( t \) = upright(bold(M)) \( partial U_t \) \, $

 where $U_t$ and its boundary are integral for almost every $t$. At almost every level for which $a \( t \) lt.eq delta$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ P \( t \) gt.eq \( 1 - eta \) n omega_n^(1 \/ n) a \( t \)^(\( n - 1 \) \/ n) . $ <eq:small-set>]

]
] <prop:small-set>

#proof[
  Fix a level at which $U_t$ is integral, and write $a = a \( t \)$ and $P = P \( t \)$. Its boundary is an integral $\( n - 1 \)$-cycle. By the induction hypothesis there is an integral $n$-current $R$ in $Y$ satisfying
  $ partial R = partial U_t \, #h(2em) d := upright(bold(M)) \( R \) lt.eq (frac(P, n omega_n^(1 \/ n)))^(n \/ \( n - 1 \)) . $
  Indeed, the coefficient on the right is the sharp filling coefficient in dimension $n - 1$. The currents $B = A - U_t + R$ and $A - B = U_t - R$ are integral cycles. Restriction decomposes the mass measure exactly, so
  $ upright(bold(M)) \( B \) lt.eq m - a + d \, #h(2em) upright(bold(M)) \( A - B \) lt.eq a + d . $
  No disjointness involving $R$ is needed for these upper bounds.
  Suppose first that $d < a lt.eq m \/ 2$. The extremizer inequality (2.9) and the coarse filling estimate in Theorem 4 give
  $ c q_0 \( m \/ 2 \)^(1 \/ n) \( a - d \) & lt.eq c #scale(x: 120%, y: 120%)[\(] m^(q_0) - \( m - a + d \)^(q_0) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq V \( A - B \) lt.eq K_n \( a + d \)^(q_0) lt.eq K_n \( 2 a \)^(q_0) . $
  The first inequality follows by integrating the derivative of $s^(q_0)$ over $\[ m - a + d \, m \] subset \[ m \/ 2 \, m \]$. Thus
  #[#set math.equation(numbering: n => "(4.3)")
   $ d gt.eq a - C a^(1 + 1 \/ n) \, #h(2em) C = frac(K_n 2^(q_0), c q_0 \( m \/ 2 \)^(1 \/ n)) = n K_n 2^(1 + 2 \/ n) . $ <eq:small-set-replacement>]
  If $d gt.eq a$, the same lower bound holds automatically. Choose $0 < delta < m \/ 2$ so small that
  $ C delta^(1 \/ n) lt.eq 1 - \( 1 - eta \)^(n \/ \( n - 1 \)) . $
  For $0 < a lt.eq delta$, combining (4.3) with the upper bound for $d$ yields
  $ P gt.eq n omega_n^(1 \/ n) a^(\( n - 1 \) \/ n) \( 1 - C a^(1 \/ n) \)^(\( n - 1 \) \/ n) gt.eq \( 1 - eta \) n omega_n^(1 \/ n) a^(\( n - 1 \) \/ n) . $
  The case $a = 0$ is immediate. All constants used to choose $delta$ depend only on the fixed extremizer, the dimension, and $eta$. ◻
]

We now have the Euclidean perimeter coefficient, up to an arbitrarily small loss, for every sufficiently small superlevel restriction. To turn this into an energy inequality, coarea must retain the chart derivative $\| D u \|$. Its uniform upper bound $"Lip" \( u \)$ would lose the required Dirichlet energy. The next lemma recovers each slice’s total mass from countably many scalar evaluations, so that the integrated cycle identity can be used at almost every level.

#thm([Lemma 4.2.])[
  (A countable family of mass tests).  #emph[Let $Z$ be a nonempty compact metric space and let $k gt.eq 1$. There is a countable collection $cal(T)_k \( Z \)$ of finite lists 
$ #scale(x: 120%, y: 120%)[\(] \( b_1 \, pi^1 \) \, dots.h \, \( b_N \, pi^N \) #scale(x: 120%, y: 120%)[\)] \, $

 where the $b_j$ are Lipschitz, $sum_j \| b_j \| lt.eq 1$ pointwise, and each $pi^j$ is a $k$-tuple of $1$-Lipschitz functions, such that every $k$-current $C$ of finite mass on $Z$ satisfies 
#[#set math.equation(numbering: n => "(4.4)")
 $ upright(bold(M)) \( C \) = sup_(cal(T) in cal(T)_k \( Z \)) sum_(\( b \, pi \) in cal(T)) C \( b \, pi \) . $ <eq:countable-mass-tests>]

 The collection is independent of $C$.]
] <lem:countable-mass-tests>

#proof[
  Fix a point $z_0 in Z$ and normalize each differentiated test by $pi_i \( z_0 \) = 0$; adding constants does not change its current evaluation. The normalized $1$-Lipschitz functions form a compact metric space in the uniform topology, by the Arzelà–Ascoli theorem. Choose a countable dense family of normalized $k$-tuples $\( pi^j \)_(j gt.eq 1)$.
  Write $lambda = parallel C parallel$. For each tuple $pi$, the first-slot extension to bounded Borel functions gives a finite signed measure $b mapsto C \( b \, pi \)$ with density $rho_pi$ relative to $lambda$, where $\| rho_pi \| lt.eq 1$ almost everywhere. Choose measurable versions for the countable family and put
  $ rho \( z \) = sup_(j gt.eq 1) \| rho_(pi^j) \( z \) \| . $
  This satisfies $0 lt.eq rho lt.eq 1$. If a normalized tuple $pi$ is approximated uniformly by tuples in the family, current continuity, with their common Lipschitz bound, shows for every Lipschitz $b$ that
  $ \| C \( b \, pi \) \| lt.eq integral_Z \| b \| rho thin d lambda . $
  Thus $rho lambda$ is a mass-controlling measure for all normalized $1$-Lipschitz tuples and hence, by rescaling the differentiated slots, for all tests. Minimality of the mass measure gives $lambda lt.eq rho lambda$. It follows that $rho = 1$ almost everywhere.
  For any finite set of the tuples, select at each point the first index where the largest $\| rho_(pi^j) \|$ is attained and select its sign. This produces bounded Borel functions $b_j$ with $sum_j \| b_j \| lt.eq 1$ and
  $ sum_j C \( b_j \, pi^j \) = integral_Z max_j \| rho_(pi^j) \| thin d lambda . $
  These coefficients can be replaced, with an arbitrarily small error in the displayed sum, by Lipschitz coefficients satisfying the same constraint. To see this, regularity of the finite Borel measure $lambda$ gives Lipschitz approximations to each $b_j$ in $L^1 \( lambda \)$. For example, an indicator is approximated between a compact set and an open neighborhood by a Lipschitz function obtained from distances to those sets, and simple functions suffice for the general case. Apply to the vector of approximations the Lipschitz map
  $ \( v_1 \, dots.h \, v_N \) mapsto frac(\( v_1 \, dots.h \, v_N \), max { 1 \, sum_j \| v_j \| }) . $
  This retains $L^1$ convergence and enforces the constraint. Monotone convergence of the finite maxima to $rho = 1$ now proves that the supremum over #emph[all] admissible finite Lipschitz lists equals $upright(bold(M)) \( C \)$; the reverse inequality follows directly from the mass bound.
  It remains to make the lists countable without depending on $C$. For each fixed list length, the admissible lists of coefficients and normalized tuples form a separable metric space in the uniform topology: they are a subspace of a finite product of $C \( Z \)$, which is separable because $Z$ is compact metric. Choose a countable dense subset within that admissible space and take the union over list lengths. An admissible list can be approximated by these lists with its constraint and differentiated Lipschitz bounds preserved. The first-slot errors are controlled by their uniform norms times $upright(bold(M)) \( C \)$, and convergence in the differentiated slots follows from current continuity. Hence the countable collection has the same supremum. A common Lipschitz bound on the first coefficients is neither asserted nor needed. ◻
]

#thm([Lemma 4.3.])[
  (Intrinsic coarea inequalities).  #emph[For a real Lipschitz function $u$ on $Y$, put 
$ a \( t \) = mu { u > t } \, #h(2em) e \( t \) = integral_({ u > t }) \| D u \|^2 thin d mu \, #h(2em) P \( t \) = upright(bold(M)) #scale(x: 120%, y: 120%)[\(] partial \( A corner.l.b { u > t } \) #scale(x: 120%, y: 120%)[\)] $

 at the almost every level where the restriction is integral. Then 
#[#set math.equation(numbering: n => "(4.5)")
 $ P \( t \)^2 lt.eq \( - a' \( t \) \) \( - e' \( t \) \) \, #h(2em) P \( t \) lt.eq "Lip" \( u \) \( - a' \( t \) \) quad upright("for almost every ") t . $ <eq:intrinsic-coarea>]

 The derivatives are the densities of the absolutely continuous parts of the corresponding distribution measures; neither distribution function is assumed absolutely continuous.]
] <lem:intrinsic-coarea>

#proof[
  For a bounded open interval $I$, define the bounded Lipschitz function
  $ H \( s \) = integral_I 1_({ t < s }) thin d t . $
  Let $b$ be Lipschitz and let $pi$ be an $\( n - 1 \)$-tuple of $1$-Lipschitz functions. Restriction, the chart representation, and Fubini give
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral_I partial U_t \( b \, pi \) thin d t = A \( H \( u \) \, b \, pi \) = - A \( b \, H \( u \) \, pi \) . $ <eq:integrated-slice>]
  For the first equality, the boundary evaluation has the measurable representative $U_t \( 1 \, b \, pi \)$, obtained by integrating the chart determinants with the factor $1_({ u > t })$. It is integrable on bounded intervals. The second equality is the product rule applied to the cycle identity $partial A = 0$.
  The chain rule in the charts gives
  $ D \( H \( u \) \) = 1_({ u in I }) D u #h(2em) mu upright("-almost everywhere") . $
  There is no ambiguity at the two endpoints of $I$: the differential of a Lipschitz scalar function vanishes almost everywhere on each fixed level set. This follows by applying Euclidean differentiation at density points of that level set in each chart. At points of the charts the other differentiated covectors have norm at most one, so the Euclidean determinant bound in Proposition 8 applies.
  In particular, for an admissible finite list $cal(T)$ as in Lemma 13, (4.6) yields
  #[#set math.equation(numbering: n => "(4.7)")
   $ lr(|integral_I sum_(\( b \, pi \) in cal(T)) partial U_t \( b \, pi \) thin d t|) lt.eq integral_({ u in I }) \| D u \| thin d mu . $ <eq:integrated-mass-list>]
  Let $gamma = u_(\#) \( \| D u \| mu \)$. Lebesgue differentiation of (4.7), simultaneously for the countable collection of lists on $Y$, gives
  $ P \( t \) lt.eq frac(d gamma_(upright("ac")), d t) \( t \) #h(2em) upright("for almost every ") t . $
  Here we used (4.4) for each integral slice. Thus the passage from a signed integrated evaluation to total slice mass excludes only a countable union of null sets.
  Set $lambda = u_(\#) mu$ and $zeta = u_(\#) \( \| D u \|^2 mu \)$. For every interval $I$, Cauchy–Schwarz on $u^(- 1) \( I \)$ and the bound $\| D u \| lt.eq "Lip" \( u \)$ imply
  $ gamma \( I \)^2 lt.eq lambda \( I \) zeta \( I \) \, #h(2em) gamma \( I \) lt.eq "Lip" \( u \) lambda \( I \) . $
  Divide by the appropriate powers of the interval length and let symmetric intervals shrink to an almost every point. The densities of $lambda_(upright("ac"))$ and $zeta_(upright("ac"))$ are respectively $- a'$ and $- e'$. Combining the resulting inequalities with the bound for $P$ proves (4.5). ◻
]

=== 4.2 Rearrangement with an arbitrary distribution function <rearrangement-with-an-arbitrary-distribution-function>

The small-set perimeter bound and intrinsic coarea now have their Euclidean coefficients up to the prescribed loss. We construct a radial Euclidean function with the same distribution of values and controlled energy. The distribution may have atoms or a singular continuous part; the generalized inverse below includes both.

#thm([Lemma 4.4.])[
  (Rearranged energy).  #emph[Fix $eta in \( 0 \, 1 \)$ and the corresponding $delta$ from Proposition 12. If $u gt.eq 0$ is Lipschitz and $mu { u > 0 } lt.eq delta$, there is a nonnegative, radial nonincreasing, compactly supported Lipschitz function $u^(*)$ on $bb(R)^n$ such that 
#[#set math.equation(numbering: n => "(4.8)")
 $ integral_(bb(R)^n) \( u^(*) \)^q thin d x = integral_Y u^q thin d mu quad \( q > 0 \) \, #h(2em) integral_(bb(R)^n) \| nabla u^(*) \|^2 thin d x lt.eq \( 1 - eta \)^(- 2) E \( u \) . $ <eq:rearranged-energy-bound>]

]
] <lem:rearranged-energy>

#proof[
  If $u = 0$ almost everywhere, take $u^(*) = 0$. Otherwise let $L = "Lip" \( u \)$ and $U = "ess sup"_mu u$. Then $U > 0$ and $L > 0$: a function with Lipschitz constant zero is constant, and a positive constant would have positivity set of mass $m > delta$. For $0 lt.eq t lt.eq U$, define
  $ a \( t \) = mu { u > t } \, #h(2em) R \( t \) = (frac(a \( t \), omega_n))^(1 \/ n) . $
  The function $R$ is nonincreasing and right-continuous, $R \( t \) > 0$ for $t < U$, and $R \( U \) = 0$. For almost every $t in \( 0 \, U \)$, Proposition 12 and Lemma 14 give
  #[#set math.equation(numbering: n => "(4.9)")
   $ - R' \( t \) = frac(- a' \( t \), n omega_n R \( t \)^(n - 1)) gt.eq c_0 \, #h(2em) c_0 = frac(1 - eta, L) > 0 . $ <eq:radius-distribution-slope>]
  This estimate also controls finite differences, even if $R$ has a singular part. Indeed, on every compact subinterval of $\( 0 \, U \)$, the nonnegative measure $- d R$ has absolutely continuous density $- R' gt.eq c_0$ and a nonnegative singular part. Therefore
  #[#set math.equation(numbering: n => "(4.10)")
   $ R \( s \) - R \( t \) gt.eq c_0 \( t - s \) #h(2em) \( 0 < s < t < U \) . $ <eq:radius-distribution-difference>]
  Define the generalized inverse for $rho gt.eq 0$ by
  #[#set math.equation(numbering: n => "(4.11)")
   $ h \( rho \) = sup { 0 lt.eq t < U : rho < R \( t \) } \, #h(2em) sup diameter := 0 . $ <eq:generalized-inverse>]
  It is nonincreasing, $h \( 0 \) = U$, and $h \( rho \) = 0$ for $rho gt.eq R \( 0 \)$. It is also $c_0^(- 1)$-Lipschitz. To check the latter claim, let $rho_1 < rho_2$ with $h \( rho_1 \) > h \( rho_2 \)$ and choose
  $ h \( rho_2 \) < s < t < h \( rho_1 \) . $
  The definition and monotonicity imply $R \( s \) lt.eq rho_2$ and $R \( t \) > rho_1$, whence $c_0 \( t - s \) lt.eq R \( s \) - R \( t \) lt.eq rho_2 - rho_1$. Letting $s$ and $t$ approach the two inverse values proves the claim.
  For $0 < t < U$, right continuity of $R$ implies
  #[#set math.equation(numbering: n => "(4.12)")
   $ h \( rho \) > t quad arrow.l.r.double quad rho < R \( t \) . $ <eq:inverse-superlevels>]
  In the reverse implication, if $rho < R \( t \)$, right continuity supplies some $s > t$ with $rho < R \( s \)$; the other implication follows from monotonicity. Consequently $u^(*) \( x \) = h \( \| x \| \)$ is Lipschitz and compactly supported, and its superlevel sets have Euclidean volume $a \( t \)$. The layer-cake formula proves the asserted equality of all positive power integrals.
  We give the exact energy substitution, including possible atoms and singular continuous parts of $a$. Strict decrease in (4.10) implies
  #[#set math.equation(numbering: n => "(4.13)")
   $ h \( R \( t \) \) = t #h(2em) \( 0 < t < U \) . $ <eq:inverse-identity>]
  Indeed, all levels $s < t$ satisfy $R \( s \) > R \( t \)$, while no $s gt.eq t$ is eligible in (4.11) with $rho = R \( t \)$. If $R$ is continuous at $t$, (4.12) and this continuity show that the entire fiber $h^(- 1) \( { t } \)$ is the singleton ${ R \( t \) }$.
  The monotone function $R$ is continuous except at countably many points and differentiable with finite derivative almost everywhere. Its derivative, wherever it is relevant to (4.9), is nonzero. Let $N$ be the null set where the Lipschitz function $h$ is not differentiable. The set $h \( N \)$ is null because Lipschitz functions map Lebesgue null sets to null sets. By (4.13), every level $t$ with $R \( t \) in N$ lies in $h \( N \)$. It follows that for almost every $t in \( 0 \, U \)$ both derivatives needed below exist, and differentiating the inverse identity gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ h' \( R \( t \) \) = frac(1, R' \( t \)) . $ <eq:inverse-derivative>]
  For example, this follows directly by letting $s arrow.r t$ in $h \( R \( s \) \) - h \( R \( t \) \) = s - t$ at a continuity and differentiability point of $R$.
  Since $h$ is absolutely continuous and nonincreasing on $\[ 0 \, R \( 0 \) \]$, the measure $\| h' \( rho \) \| thin d rho$ pushes forward under $h$ to Lebesgue measure on $\( 0 \, U \)$. One may verify this first on an interval $\( a \, b \) subset \( 0 \, U \)$: integration of $- h'$ over its inverse image equals $b - a$ by the fundamental theorem of calculus; constant portions have zero derivative. Intervals determine the measure. At almost every target level the fiber consists of the single point $R \( t \)$, so this substitution and (4.14) give
  #[#set math.equation(numbering: n => "(4.15)")
   $ integral_(bb(R)^n) \| nabla u^(*) \|^2 thin d x & = n omega_n integral_0^(R \( 0 \)) rho^(n - 1) \| h' \( rho \) \|^2 thin d rho\
 & = integral_0^U frac(n omega_n R \( t \)^(n - 1), - R' \( t \)) thin d t\
 & = integral_0^U frac(#scale(x: 120%, y: 120%)[\(] n omega_n R \( t \)^(n - 1) #scale(x: 120%, y: 120%)[\)]^2, - a' \( t \)) thin d t . $ <eq:rearranged-energy-identity>]
  The denominators are positive and finite almost everywhere by (4.9). The preceding substitution also justifies the equality for a nonnegative integrand before its finiteness is known.
  For clarity, a jump of $R$ produces an interval on which $h$ is constant. In particular, an atom at $U$ produces a central constant part of $u^(*)$. Such intervals contribute no energy. A singular continuous decrease causes no additional term either: the exact substitution uses the absolutely continuous measure $\| h' \| thin d rho$, and the inverse image of any null set of levels has zero measure for this measure. Thus no absolute-continuity assumption on $a$ has entered (4.15).
  Finally, (4.2) gives
  $ #scale(x: 120%, y: 120%)[\(] n omega_n R \( t \)^(n - 1) #scale(x: 120%, y: 120%)[\)]^2 lt.eq \( 1 - eta \)^(- 2) P \( t \)^2 . $
  Using (4.5) in (4.15) therefore yields
  $ integral_(bb(R)^n) \| nabla u^(*) \|^2 thin d x lt.eq \( 1 - eta \)^(- 2) integral_0^U \( - e' \( t \) \) thin d t lt.eq \( 1 - eta \)^(- 2) E \( u \) . $
  The last inequality only uses monotonicity of $e$ and remains true if its distributional derivative has a singular part. ◻
]

=== 4.3 The sharp radial Euclidean inequality <the-sharp-radial-euclidean-inequality>

Rearrangement reduces the small-support estimate to a radial function on $bb(R)^n$. The next lemma identifies its sharp energy coefficient; afterwards only the truncation to arbitrary functions remains. This is the radial case of the sharp Sobolev inequality of Aubin and Talenti #cite(label("Aubin1976")) #cite(label("Talenti1976")). Its proof is an explicit radial version of the mass-transport argument of Cordero-Erausquin, Nazaret and Villani #cite(label("CorderoNazaretVillani2004")) Section 2: cumulative masses determine the transport, and determinant comparison followed by integration by parts recovers the sharp coefficient.

#thm([Lemma 4.5.])[
  (Sharp radial Sobolev inequality).  #emph[For every nonnegative, radial nonincreasing, compactly supported Lipschitz function $f$ on $bb(R)^n$, where $n > 2$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ n s_n^(2 \/ n) (integral_(bb(R)^n) f^p thin d x)^(2 \/ p) lt.eq frac(4, n - 2) integral_(bb(R)^n) \| nabla f \|^2 thin d x . $ <eq:radial-sobolev>]

]
] <lem:radial-sobolev>

#proof[
  The assertion is immediate for $f = 0$. By homogeneity, assume $integral f^p thin d x = 1$. Write $f = f \( r \)$, $r = \| x \|$. Continuity and radial monotonicity give a finite $r_0 > 0$ such that $f > 0$ on $\[ 0 \, r_0 \)$ and $f = 0$ on $\[ r_0 \, oo \)$. For $D > 0$ define
  $ g_D \( r \) = A_D \( 1 + r^2 \)^(- \( n - 2 \) \/ 2) quad \( 0 lt.eq r < D \) \, #h(2em) g_D \( r \) = 0 quad \( r gt.eq D \) \, $
  where $A_D > 0$ is chosen so that $integral g_D^p thin d x = 1$. For $0 < r < r_0$ match the cumulative radial masses by
  #[#set math.equation(numbering: n => "(4.17)")
   $ n omega_n integral_0^r s^(n - 1) f \( s \)^p thin d s = n omega_n integral_0^(t \( r \)) s^(n - 1) g_D \( s \)^p thin d s . $ <eq:radial-transport-cdf>]
  Both cumulative functions are $C^1$ with strictly positive derivative on their open radial intervals. Their inverse composition $t$ is therefore $C^1$ on $\( 0 \, r_0 \)$, strictly increasing, and satisfies $t \( 0 + \) = 0$ and $t \( r_0 - \) = D$. Differentiation gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ d_T := t' \( r \) (frac(t \( r \), r))^(n - 1) = frac(f \( r \)^p, g_D \( t \( r \) \)^p) . $ <eq:radial-transport-jacobian>]
  The radial map $T \( x \) = t \( \| x \| \) x \/ \| x \|$ has positive eigenvalues $t'$ and $n - 1$ copies of $t \/ r$ and transports $f^p thin d x$ to $g_D^p thin d x$. This follows either from (4.17) by radial integration, or from the change of variables and (4.18). The jump of $g_D$ at $D$ is harmless: the calculation uses its positive continuous interior profile and never differentiates the cutoff.
  Let
  $ ell = p (1 - 1 / n) = frac(2 \( n - 1 \), n - 2) \, #h(2em) ell - 1 = p / 2 . $
  Change of variables, the arithmetic–geometric mean inequality for the positive eigenvalues of $D T$, and radial integration by parts give
  #[#set math.equation(numbering: n => "(4.19)")
   $ n integral_(bb(R)^n) g_D^ell thin d x & = n integral_(\| x \| < r_0) f^ell d_T^(1 \/ n) thin d x\
 & lt.eq integral_(\| x \| < r_0) f^ell (t' + \( n - 1 \) t / r) thin d x\
 & = - ell integral_(\| x \| < r_0) f^(p \/ 2) f' t thin d x\
 & lt.eq ell (integral_(bb(R)^n) \| nabla f \|^2 thin d x)^(1 \/ 2) (integral_(bb(R)^n) \| x \|^2 g_D^p thin d x)^(1 \/ 2) . $ <eq:radial-transport-estimate>]
  The last equality needed for Cauchy–Schwarz is the transport identity $integral f^p t^2 thin d x = integral \| x \|^2 g_D^p thin d x$. To justify the integration by parts, first integrate over $epsilon < r < R < r_0$. The boundary term is $n omega_n \[ r^(n - 1) t f^ell \]_epsilon^R$. It tends to zero at $r_0$ because $f \( r_0 \) = 0$ and $t lt.eq D$, and at zero because $n > 1$ and $t \, f$ are bounded. The resulting derivative integral is absolutely integrable: $f'$ is essentially bounded, $t$ is bounded, and the source ball is bounded. The source profile is Lipschitz, so its radial integration by parts is justified by absolute continuity.
  Now put
  $ I_0 = integral_(bb(R)^n) \( 1 + \| x \|^2 \)^(- n) thin d x \, #h(2em) A_oo = I_0^(- 1 \/ p) \, #h(2em) g \( r \) = A_oo \( 1 + r^2 \)^(- \( n - 2 \) \/ 2) . $
  The normalizing constants $A_D$ converge to $A_oo$ as $D arrow.r oo$. Moreover,
  $ integral g_D^ell thin d x arrow.r integral g^ell thin d x \, #h(2em) integral \| x \|^2 g_D^p thin d x arrow.r integral \| x \|^2 g^p thin d x . $
  For both integrals the unnormalized radial integrand is of order $r^(1 - n)$ at infinity. Thus both are finite for every $n > 2$, and the convergence follows by monotone convergence for the unnormalized integrals and convergence of $A_D$. In particular, no limit of the transport maps is required.
  The ratio on the limiting left side of (4.19) can be evaluated from $g$ itself. Direct differentiation shows that
  $ - g' \( r \) = K r g \( r \)^(p \/ 2) \, #h(2em) K = \( n - 2 \) A_oo^(- 2 \/ \( n - 2 \)) > 0 . $
  If $J = integral g^ell thin d x$ and $M_2 = integral \| x \|^2 g^p thin d x$, radial integration by parts with the vector field $x$ gives
  $ n J = - ell integral g^(p \/ 2) g' r thin d x = ell K M_2 \, #h(2em) integral \| nabla g \|^2 thin d x = K^2 M_2 . $
  Its boundary term $r^n g \( r \)^ell$ vanishes at zero and is $O \( r^(2 - n) \)$ at infinity. Therefore
  #[#set math.equation(numbering: n => "(4.20)")
   $ frac(n J, ell M_2^(1 \/ 2)) = (integral \| nabla g \|^2 thin d x)^(1 \/ 2) . $ <eq:bubble-transport-ratio>]
  Taking $D arrow.r oo$ in (4.19) proves $integral \| nabla f \|^2 thin d x gt.eq integral \| nabla g \|^2 thin d x$.
  The transport argument has reduced the lower energy bound to the single comparison profile $g$. It remains to compute this energy and thus fix the threshold used in the current’s critical minimization. The inverse stereographic map
  $ x mapsto frac(\( 2 x \, \| x \|^2 - 1 \), 1 + \| x \|^2) in bb(S)^n $
  pulls the sphere metric back to $4 \( 1 + \| x \|^2 \)^(- 2)$ times the Euclidean metric. Its volume Jacobian is $2^n \( 1 + \| x \|^2 \)^(- n)$, so
  #[#set math.equation(numbering: n => "(4.21)")
   $ I_0 = 2^(- n) s_n . $ <eq:stereographic-integral>]
  For $w \( r \) = \( 1 + r^2 \)^(- \( n - 2 \) \/ 2)$, direct differentiation gives
  $ - Delta w = n \( n - 2 \) \( 1 + r^2 \)^(- \( n + 2 \) \/ 2) . $
  Integration by parts consequently yields
  $ integral_(bb(R)^n) \| nabla g \|^2 thin d x & = n \( n - 2 \) A_oo^2 I_0\
 & = n \( n - 2 \) I_0^(1 - 2 \/ p) = frac(n \( n - 2 \), 4) s_n^(2 \/ n) . $
  Here the boundary term $r^(n - 1) g \( r \) g' \( r \)$ vanishes at zero and is $O \( r^(2 - n) \)$ at infinity; also $1 - 2 \/ p = 2 \/ n$. Multiplying the energy lower bound by $4 \/ \( n - 2 \)$ proves (4.16) for the normalized $f$, and homogeneity proves the general statement. All moments and boundary limits used above remain valid when $n = 3$ or $n = 4$; no $L^2$ integrability of the full profile $g$ is needed.
  The coefficient is also optimal within the class in the statement. Indeed, choose a nonnegative nonincreasing Lipschitz cutoff $chi$ equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$, and set $g_R \( x \) = g \( x \) chi \( \| x \| \/ R \)$. Then $g_R arrow.r g$ in $L^p$, and $nabla g_R arrow.r nabla g$ in $L^2$: the tail of $nabla g$ tends to zero, while the extra cutoff energy is bounded by
  $ frac("Lip" \( chi \)^2, R^2) integral_(R < \| x \| < 2 R) g \( x \)^2 thin d x = O \( R^(2 - n) \) arrow.r 0 . $
  Each $g_R$ is admissible, and its Sobolev quotient tends to the computed value for $g$. ◻
]

=== 4.4 Globalization <globalization>

The preceding two lemmas give the sharp coefficient, with an arbitrarily small loss, for functions supported on a small amount of current mass. Truncation at a level controlled by $parallel u parallel_2$ yields the section’s asserted inequality for every Lipschitz function.

#thm([Proposition 4.6.])[
  (Almost Euclidean critical Sobolev bound).  #emph[For every $epsilon.alt in \( 0 \, S_(*) \)$ there is a finite constant $C_epsilon.alt gt.eq 0$ such that every real Lipschitz function $u$ on $Y$ satisfies 
#[#set math.equation(numbering: n => "(4.22)")
 $ \( S_(*) - epsilon.alt \) parallel u parallel_p^2 lt.eq 4 beta E \( u \) + C_epsilon.alt parallel u parallel_2^2 . $ <eq:almost-sobolev>]

 The constant is independent of $u$.]
] <prop:almost-sobolev>

#proof[
  Fix temporarily $eta in \( 0 \, 1 \)$ and its corresponding $delta$. Combining Lemmas 15 and 16 gives
  #[#set math.equation(numbering: n => "(4.23)")
   $ S_(*) \( 1 - eta \)^2 parallel z parallel_p^2 lt.eq 4 beta E \( z \) quad upright("if ") z gt.eq 0 upright(" is Lipschitz and ") mu { z > 0 } lt.eq delta . $ <eq:small-support-sobolev>]
  This also holds when $z = 0$ almost everywhere.
  For a general Lipschitz $u$ with $parallel u parallel_2 > 0$, set
  $ tau = frac(parallel u parallel_2, sqrt(delta)) \, #h(2em) z = \( \| u \| - tau \)_(+) . $
  Chebyshev’s inequality gives $mu { z > 0 } lt.eq delta$. Scalar Lipschitz composition in the charts gives $E \( z \) lt.eq E \( u \)$; at the finitely many corner levels the gradient vanishes almost everywhere on the corresponding level sets, so the usual almost-everywhere chain rule applies. In addition, $0 lt.eq \| u \| - z lt.eq tau$, whence
  $ parallel \| u \| - z parallel_p lt.eq m^(1 \/ p) tau . $
  For every $xi > 0$, the triangle inequality followed by $\( b + d \)^2 lt.eq \( 1 + xi \) b^2 + \( 1 + xi^(- 1) \) d^2$ now yields
  $ frac(S_(*) \( 1 - eta \)^2, 1 + xi) parallel u parallel_p^2 & lt.eq S_(*) \( 1 - eta \)^2 parallel z parallel_p^2 + frac(S_(*) \( 1 - eta \)^2, xi) m^(2 \/ p) tau^2\
 & lt.eq 4 beta E \( u \) + frac(S_(*) \( 1 - eta \)^2 m^(2 \/ p), xi delta) parallel u parallel_2^2 . $
  Choose $eta > 0$ and $xi > 0$ sufficiently small that $S_(*) \( 1 - eta \)^2 \/ \( 1 + xi \) gt.eq S_(*) - epsilon.alt$, and then fix the associated $delta$. The last display proves the assertion with, for example,
  $ C_epsilon.alt = frac(S_(*) \( 1 - eta \)^2 m^(2 \/ p), xi delta) . $
  If $parallel u parallel_2 = 0$, then $parallel u parallel_p = 0$ and the asserted inequality is immediate. ◻
]

== 5 A subthreshold minimizer on the cycle <sec:minimizer>

Throughout this section, $n > 2$ and $A$ is the extremizing cycle constructed in Lemma 5, with the normalization (2.10). Thus $mu = parallel A parallel$ is a finite measure on the compact space $Y$, and

$ 0 < m := mu \( Y \) < s_n . $

We use the charts, multiplicities, and covector norms of Proposition 8. In particular, the chart images $Z_i$ are pairwise disjoint, their multiplicities $theta_i$ are nonzero signed integers, and

$ mu = sum_i \( phi.alt_i \)_(\#) #scale(x: 120%, y: 120%)[\(] \| theta_i \| J_i thin d z #scale(x: 120%, y: 120%)[\)] \, #h(2em) J_i = sqrt(det G_i) . $

Set, as in Section 4,

$ beta = frac(1, n - 2) \, #h(2em) p = frac(2 n, n - 2) \, #h(2em) S_(*) = n s_n^(2 \/ n) \, #h(2em) E \( u \) = integral_Y \| D u \|^2 thin d mu . $

All function norms in this section are taken with respect to $mu$. We use the almost sharp estimate (4.22); in particular, its constant $C_epsilon.alt$ is independent of the Lipschitz function to which it is applied.

We seek a nonnegative minimizer of

$ frac(4 beta E \( u \) + n parallel u parallel_2^2, parallel u parallel_p^2) \, $

initially defined for Lipschitz functions with $parallel u parallel_p > 0$. To pass to a minimizing limit, we first close the chart gradient and prove compactness in $L^2$. The almost sharp inequality from Section 4 then prevents loss of critical $L^p$ mass below $S_(*)$.

=== 5.1 The closed gradient and calculus <the-closed-gradient-and-calculus>

#thm([Proposition 5.1.])[
  (The Sobolev space and its calculus).  #emph[Identify real Lipschitz functions on $Y$ that agree $mu$-almost everywhere. Their completion in the norm 
$ parallel u parallel_(cal(H))^2 = parallel u parallel_2^2 + E \( u \) $

 is a Hilbert space $cal(H)$ of functions in $L^2 \( mu \)$. Its gradient is a well-defined closed operator with values in the Hilbert space of square-integrable chart covectors. The inclusion $cal(H) arrow.r L^p \( mu \)$ is continuous, and (4.22) holds for all $u in cal(H)$.]
  #emph[The following calculus properties hold.]
  + #emph[If $u_1 \, dots.h \, u_k in cal(H)$ and $Phi in C^1 \( bb(R)^k \)$ has bounded first derivatives, then $Phi \( u_1 \, dots.h \, u_k \) in cal(H)$ and 
$ D Phi \( u_1 \, dots.h \, u_k \) = sum_(a = 1)^k partial_a Phi \( u_1 \, dots.h \, u_k \) D u_a . $

]
  + #emph[For every $u in cal(H)$ and every fixed $t in bb(R)$, $D u = 0$ almost everywhere on ${ u = t }$. Consequently, the scalar chain rule also holds for Lipschitz, piecewise $C^1$ functions with finitely many corners, with any derivative values assigned at the corners.]
  + #emph[The map $u mapsto u_(+)$ is continuous from $cal(H)$ to itself. Every nonnegative element of $cal(H)$ has nonnegative Lipschitz approximants converging in $cal(H)$.]
  + #emph[For each fixed center $y in Y$, the radial inequality (3.1) holds for every nonnegative $g in cal(H)$, with $r = d \( y \, dot.op \)$ and its chart gradient $D r$.]
] <prop:sobolev-space>

#proof[
  Let $cal(L)^2$ denote the Hilbert space of chart covector fields $L$ with $integral \| L \|^2 thin d mu < oo$. The Lipschitz level-set property from Section 2, applied to the difference of two representatives, shows that their gradients agree whenever the functions agree $mu$-almost everywhere. We first prove that the graph of the Lipschitz gradient in $L^2 \( mu \) times cal(L)^2$ is closable. Suppose that $u_j$ are Lipschitz,
  $ u_j arrow.r 0 quad upright("in ") L^2 \( mu \) \, #h(2em) D u_j arrow.r L quad upright("in ") cal(L)^2 . $
  For a Lipschitz scalar function $b$ and a Lipschitz $\( n - 1 \)$-tuple $pi$, the identity $partial A = 0$ gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ A \( b \, u_j \, pi \) = - A \( u_j \, b \, pi \) . $ <eq:cycle-gradient-identity>]
  The right-hand side tends to zero by the mass bound and $parallel u_j parallel_1 lt.eq m^(1 \/ 2) parallel u_j parallel_2$. For the fixed tuple $pi$, the limit of the left-hand side is integration of $b$ against the signed measure
  $ nu_pi \( B \) = sum_i integral_(phi.alt_i^(- 1) \( B ∩ Z_i \)) theta_i det #scale(x: 120%, y: 120%)[\(] L_i \, D \( pi compose phi.alt_i \) #scale(x: 120%, y: 120%)[\)] thin d z \, #h(2em) B subset Y med upright("Borel") . $
  Here $L_i$ is the row of coordinate components of $L$ in the $i$th chart. The determinant estimate of Proposition 8 shows that this is a finite signed measure and that
  $ parallel nu_pi parallel_(upright("TV")) lt.eq (product_(a = 1)^(n - 1) "Lip" \( pi_a \)) integral \| L \| thin d mu . $
  The same estimate applied to $D u_j - L$ justifies the asserted limit. Thus $integral b thin d nu_pi = 0$ for every Lipschitz $b$ on $Y$. Lipschitz functions are uniformly dense in $C \( Y \)$, so they determine finite signed measures on the compact metric space $Y$. It follows that $nu_pi = 0$ as a measure.
  Fix a chart $i$. Extend each coordinate of $phi.alt_i^(- 1) : Z_i arrow.r bb(R)^n$ to a Lipschitz scalar function $F^a$ on $Y$. At almost every density point of $E_i$,
  $ D \( F^a compose phi.alt_i \) = e_a^(*) . $
  Take for $pi$ each of the $n$ tuples obtained by omitting one member of $\( F^1 \, dots.h \, F^n \)$. Restricting the corresponding zero measures $nu_pi$ to $Z_i$ shows, component by component, that $theta_i L_i = 0$ almost everywhere on $E_i$. The multiplicity is nonzero, so $L_i = 0$. There are only countably many charts and finitely many tuples per chart; hence $L = 0$ in $cal(L)^2$. Notice the order of this argument: we first obtained zero signed measures by testing on the whole cycle, and then localized those measures. No boundary or normality property of a chart restriction is used.
  The closure of the graph is therefore the graph of an operator $D$, and, with its graph norm, it is the asserted Hilbert space $cal(H)$. In particular, functions that agree almost everywhere have the same gradient. Applying (4.22) to differences of Lipschitz approximants shows that a graph-norm Cauchy sequence is Cauchy in $L^p$. Its $L^p$ limit agrees with its $L^2$ limit, and passing to the limit proves both the continuous inclusion and the extension of (4.22).
  To prove the first calculus assertion, choose Lipschitz approximants $u_(a \, j) arrow.r u_a$ in $cal(H)$, and pass to a common subsequence converging almost everywhere. Write $U_j = \( u_(1 \, j) \, dots.h \, u_(k \, j) \)$ and $U = \( u_1 \, dots.h \, u_k \)$. Bounded first derivatives give $Phi \( U_j \) arrow.r Phi \( U \)$ in $L^2$. The constant $Phi \( 0 \)$ is harmless because $mu$ is finite. The chart chain rule gives
  $ D Phi \( U_j \) = sum_a partial_a Phi \( U_j \) D u_(a \, j) . $
  For each summand, subtract the proposed limit by writing
  $ partial_a Phi \( U_j \) \( D u_(a \, j) - D u_a \) + #scale(x: 120%, y: 120%)[\(] partial_a Phi \( U_j \) - partial_a Phi \( U \) #scale(x: 120%, y: 120%)[\)] D u_a . $
  The first term tends to zero in $cal(L)^2$ by the derivative bound; the second does so by dominated convergence. Closedness proves assertion (i).
  For assertion (ii), fix a level $t$ and choose $eta in C_c^oo \( \( - 1 \, 1 \) \)$ with $0 lt.eq eta lt.eq 1$ and $eta \( 0 \) = 1$. The functions
  $ Phi_epsilon.alt \( s \) = integral_(- oo)^s eta #scale(x: 120%, y: 120%)[\(] \( a - t \) \/ epsilon.alt #scale(x: 120%, y: 120%)[\)] thin d a $
  converge uniformly to zero, their derivatives are bounded by one, and $Phi'_epsilon.alt \( s \) arrow.r upright(bold(1))_({ t }) \( s \)$. Assertion (i) and dominated convergence give
  $ Phi_epsilon.alt \( u \) arrow.r 0 quad upright("in ") L^2 \, #h(2em) D Phi_epsilon.alt \( u \) arrow.r upright(bold(1))_({ u = t }) D u quad upright("in ") cal(L)^2 . $
  Closedness forces the latter limit to be zero. A Lipschitz, piecewise $C^1$ scalar function with finitely many corners can now be smoothed by convolution. The smoothed functions converge uniformly, their derivatives have a common bound, and the derivatives converge at every point other than the corners. The level-set conclusion removes the contribution of those corners, so dominated convergence and closedness give the claimed chain rule.
  In particular, $D \( u_(+) \) = upright(bold(1))_({ u > 0 }) D u$. If $u_j arrow.r u$ in $cal(H)$, the positive parts converge in $L^2$, and their gradient difference is
  $ upright(bold(1))_({ u_j > 0 }) \( D u_j - D u \) + #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ u_j > 0 }) - upright(bold(1))_({ u > 0 }) #scale(x: 120%, y: 120%)[\)] D u . $
  Along any subsequence with almost-everywhere convergence, the second term tends to zero in $cal(L)^2$ by the level-set conclusion at zero and dominated convergence. The first term is bounded in norm by $parallel D u_j - D u parallel_2$. Applying this observation to subsequences proves continuity for the original sequence. Taking positive parts of Lipschitz approximants proves assertion (iii).
  Finally fix $y in Y$. The distance $r = d \( y \, dot.op \)$ is bounded, $\| D r \| lt.eq 1$ almost everywhere, and $mu$ is finite. Each term of (3.1) is therefore continuous as a linear functional of $g$ in the graph norm. Approximate a nonnegative $g in cal(H)$ by the nonnegative Lipschitz functions just constructed and pass to the limit. This proves assertion (iv). ◻
]

=== 5.2 Compactness <compactness>

The gradient is now defined on the completed space, and its critical embedding is continuous. We still need strong $L^2$ convergence for bounded sequences. The proof obtains compactness for projections of whole weighted currents, then isolates charts in total variation.

#thm([Proposition 5.2.])[
  (Compact inclusion).  #emph[The inclusion $cal(H) arrow.r L^2 \( mu \)$ is compact.]
] <prop:compact-embedding>

#proof[
  #emph[Projecting the whole weighted current.] First consider Lipschitz functions $u_j$ with $sup_j parallel u_j parallel_(cal(H)) lt.eq M_0 < oo$. Fix a chart $i$, extend its inverse coordinates to a Lipschitz map $F = \( F^1 \, dots.h \, F^n \) : Y arrow.r bb(R)^n$, and fix a Lipschitz function $chi$ on $Y$. Define finite signed measures $lambda_(j \, chi)$ on $bb(R)^n$ by
  #[#set math.equation(numbering: n => "(5.2)")
   $ integral h thin d lambda_(j \, chi) = A #scale(x: 120%, y: 120%)[\(] \( h compose F \) chi u_j \, F^1 \, dots.h \, F^n #scale(x: 120%, y: 120%)[\)] $ <eq:projected-function-measure>]
  for bounded Borel $h$. The chart representation defines these measures directly. They are supported in the fixed compact set $F \( Y \)$, and the current mass bound gives
  $ sup_j parallel lambda_(j \, chi) parallel_(upright("TV")) lt.eq (product_(a = 1)^n "Lip" \( F^a \)) parallel chi parallel_oo m^(1 \/ 2) M_0 . $
  For $h in C_c^oo \( bb(R)^n \)$, expanding the row $D \( h compose F \) = sum_a \( partial_a h compose F \) D F^a$ in a determinant shows that
  $ integral partial_l h thin d lambda_(j \, chi) = A #scale(x: 120%, y: 120%)[\(] chi u_j \, F^1 \, dots.h \, F^(l - 1) \, h compose F \, F^(l + 1) \, dots.h \, F^n #scale(x: 120%, y: 120%)[\)] . $
  All terms except $a = l$ in the row expansion vanish because they have a repeated row. Apply the cycle identity (5.1), with a permutation of rows if necessary, to move $h compose F$ to the first coefficient. The intrinsic determinant bound then gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ lr(|integral partial_l h thin d lambda_(j \, chi)|) lt.eq C_F parallel h parallel_oo integral \| D \( chi u_j \) \| thin d mu lt.eq C_chi parallel h parallel_oo \, $ <eq:projected-measure-derivative>]
  uniformly in $j$ and $l$. Indeed,
  $ integral \| D \( chi u_j \) \| thin d mu lt.eq m^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] parallel chi parallel_oo parallel D u_j parallel_2 + "Lip" \( chi \) parallel u_j parallel_2 #scale(x: 120%, y: 120%)[\)] . $
  Constants here may depend on the fixed chart, $chi$, and $M_0$.
  #emph[Translation compactness.] We give the compactness consequence of (5.3) in detail. This is the usual translation and mollification proof of Euclidean BV compactness #cite(label("Simon2014")) Chapter 2, Theorem 2.6, expressed directly for the projected signed measures. Let $tau_w \( x \) = x + w$. For a smooth compactly supported test $h$, the fundamental theorem of calculus along $x + t w$ and (5.3) imply
  $ lr(|integral h thin d #scale(x: 120%, y: 120%)[\(] \( tau_w \)_(\#) lambda_(j \, chi) - lambda_(j \, chi) #scale(x: 120%, y: 120%)[\)]|) lt.eq C_chi parallel h parallel_oo sum_(l = 1)^n \| w_l \| . $
  Smooth compactly supported tests recover the total variation of finite signed Radon measures, by regularity and approximation of continuous tests. After changing the constant, we obtain
  #[#set math.equation(numbering: n => "(5.4)")
   $ parallel \( tau_w \)_(\#) lambda_(j \, chi) - lambda_(j \, chi) parallel_(upright("TV")) lt.eq C_chi \| w \| . $ <eq:measure-translation-bound>]
  Choose a nonnegative smooth convolution kernel $rho_epsilon.alt$ of integral one supported in the ball of radius $epsilon.alt$. Averaging (5.4) gives
  $ parallel lambda_(j \, chi) - \( rho_epsilon.alt * lambda_(j \, chi) \) thin d x parallel_(upright("TV")) lt.eq C_chi epsilon.alt . $
  For fixed $epsilon.alt$, the densities $rho_epsilon.alt * lambda_(j \, chi)$ have a common compact support and uniform bounds on their values and first derivatives. The Arzelà–Ascoli theorem makes them precompact in the uniform norm on that support and hence in $L^1 \( bb(R)^n \)$. Approximation by these families, first fixing $epsilon.alt$ and then letting it decrease to zero, proves that ${ lambda_(j \, chi) : j gt.eq 1 }$ is totally bounded in total variation. The space of finite signed measures is complete in that norm, so this family is precompact.
  #emph[Isolating a chart in total variation.] We now isolate the chart. Formula (5.2) also defines $lambda_(j \, upright(bold(1))_(Z_i))$, using the bounded Borel coefficient $upright(bold(1))_(Z_i)$. By regularity of $mu$ and distance cutoffs on the compact metric space $Y$, choose Lipschitz $chi_k$ with
  $ parallel chi_k - upright(bold(1))_(Z_i) parallel_2 arrow.r 0 . $
  The mass bound and Cauchy–Schwarz give, uniformly in $j$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel lambda_(j \, chi_k) - lambda_(j \, upright(bold(1))_(Z_i)) parallel_(upright("TV")) & lt.eq (product_(a = 1)^n "Lip" \( F^a \)) integral \| chi_k - upright(bold(1))_(Z_i) \| thin \| u_j \| thin d mu\
 & lt.eq C_F M_0 parallel chi_k - upright(bold(1))_(Z_i) parallel_2 . $ <eq:chart-cutoff-approximation>]
  For each fixed $k$ the family on the left with coefficient $chi_k$ is precompact by the preceding argument. Uniform approximation (5.5) therefore makes ${ lambda_(j \, upright(bold(1))_(Z_i)) : j gt.eq 1 }$ precompact as well. There is no need for the Lipschitz constants of $chi_k$ to remain bounded.
  Since $F compose phi.alt_i$ is the identity on $E_i$, the density of the isolated measure is exactly
  $ d lambda_(j \, upright(bold(1))_(Z_i)) \( z \) = upright(bold(1))_(E_i) \( z \) theta_i \( z \) \( u_j compose phi.alt_i \) \( z \) thin d z . $
  Consequently, for any $j \, k$,
  $ parallel u_j - u_k parallel_(L^1 \( Z_i \, mu \)) & = integral_(E_i) \| theta_i \| J_i \| \( u_j - u_k \) compose phi.alt_i \| thin d z\
 & lt.eq "Lip" \( phi.alt_i \)^n parallel lambda_(j \, upright(bold(1))_(Z_i)) - lambda_(k \, upright(bold(1))_(Z_i)) parallel_(upright("TV")) . $
  Here $J_i lt.eq "Lip" \( phi.alt_i \)^n$. This calculation allows arbitrary signed, unbounded integer multiplicities: the fixed $theta_i$ appears as $\| theta_i \|$ in the total variation of a difference. Likewise, (5.5) already uses the full mass measure $\| theta_i \| J_i thin d z$, so it requires no bound or regularity of the multiplicities. All integrations by parts above concerned the whole cycle $A$ with a Lipschitz coefficient. None concerned a restriction to one chart.
  #emph[Assembling the charts.] We may now take a diagonal subsequence that is Cauchy in $L^1 \( Z_i \, mu \)$ for every $i$. The omitted charts have uniformly small contributions, because
  $ integral_(union.big_(i > N) Z_i) \| u_j \| thin d mu lt.eq M_0 thin mu (union.big_(i > N) Z_i)^(1 \/ 2) arrow.r 0 $
  uniformly in $j$. The chart images cover $mu$ up to a null set, and $mu$ is finite. The subsequence is thus Cauchy in $L^1 \( mu \)$. Proposition 18 supplies a uniform $L^p$ bound. Since $p > 2$, interpolation with $alpha = \( p - 2 \) \/ \( 2 \( p - 1 \) \) > 0$ gives
  $ parallel u_j - u_k parallel_2 lt.eq parallel u_j - u_k parallel_1^alpha parallel u_j - u_k parallel_p^(1 - alpha) arrow.r 0 . $
  Finally, approximate the $j$th member of an arbitrary bounded sequence in $cal(H)$ by a Lipschitz function with graph-norm error at most $1 \/ j$. The result just proved for those approximants proves compactness for the original sequence. ◻
]

=== 5.3 A minimizer and its powers <a-minimizer-and-its-powers>

We now have weak compactness in $cal(H)$ and strong compactness in $L^2$. These do not alone give strong convergence at the critical exponent $p$. The strict inequality $m < s_n$ places the quotient infimum below $S_(*)$; the almost sharp estimate will exclude any missing $L^p$ mass.

Define the quadratic functional and its critical constrained infimum by

#[#set math.equation(numbering: n => "(5.6)")
 $ Q \( u \) = 4 beta E \( u \) + n parallel u parallel_2^2 \, #h(2em) Lambda = inf { Q \( u \) : u in cal(H) \, med parallel u parallel_p = 1 } . $ <eq:critical-variational-problem>]

#thm([Proposition 5.3.])[
  (Existence and normalization of the minimizer).  #emph[One has $0 < Lambda < S_(*)$. There exists a nonzero nonnegative $v in cal(H)$ minimizing $Q \( u \) \/ parallel u parallel_p^2$ over nonzero $u in cal(H)$ and satisfying 
#[#set math.equation(numbering: n => "(5.7)")
 $ 0 < W := integral v^p thin d mu = (Lambda / n)^(n \/ 2) < s_n \, #h(2em) Q \( v \) = n W . $ <eq:minimizer-normalization>]

 For every $psi in cal(H)$ it satisfies the weak equation 
#[#set math.equation(numbering: n => "(5.8)")
 $ 4 beta integral D v dot.op D psi thin d mu + n integral v psi thin d mu = n integral v^(p - 1) psi thin d mu . $ <eq:euler>]

]
] <prop:minimizer>

#proof[
  Taking $epsilon.alt = S_(*) \/ 2$ in (4.22) shows that
  $ S_(*) / 2 parallel u parallel_p^2 lt.eq 4 beta E \( u \) + C_(S_(*) \/ 2) parallel u parallel_2^2 lt.eq max { 1 \, C_(S_(*) \/ 2) \/ n } thin Q \( u \) . $
  Thus $Lambda > 0$. The constant function $m^(- 1 \/ p)$ has $L^p$ norm one, so
  #[#set math.equation(numbering: n => "(5.9)")
   $ Lambda lt.eq n m^(1 - 2 \/ p) = n m^(2 \/ n) < n s_n^(2 \/ n) = S_(*) . $ <eq:strict-subthreshold>]
  Let $u_j$ be an $L^p$-normalized minimizing sequence. It is bounded in $cal(H)$, since $Q$ is a positive definite quadratic form equivalent to the squared graph norm. By weak compactness in a Hilbert space and Proposition 19, after taking a subsequence we have
  $ u_j harpoon.rt u quad upright("in ") cal(H) \, #h(2em) u_j arrow.r u quad upright("in ") L^2 \( mu \) quad upright("and almost everywhere") . $
  Put $z_j = u_j - u$ and $t = integral \| u \|^p thin d mu$. Fatou’s lemma gives $0 lt.eq t lt.eq 1$. We give the Brézis–Lieb splitting #cite(label("BrezisLieb1983")) Theorem 1 in the form needed here:
  #[#set math.equation(numbering: n => "(5.10)")
   $ integral \| z_j \|^p thin d mu arrow.r 1 - t . $ <eq:critical-mass-splitting>]
  For every $epsilon.alt > 0$, the mean-value theorem and Young’s inequality give a finite $C_epsilon.alt$ such that, for real $a \, b$,
  $ \| \| a + b \|^p - \| a \|^p #scale(x: 120%, y: 120%)[\|] lt.eq epsilon.alt \| a \|^p + C_epsilon.alt \| b \|^p . $
  Apply this with $a = z_j$ and $b = u$, and set $R_j = \| u_j \|^p - \| z_j \|^p - \| u \|^p$. The functions
  $ #scale(x: 120%, y: 120%)[\(] \| R_j \| - epsilon.alt \| z_j \|^p #scale(x: 120%, y: 120%)[\)]_(+) $
  converge to zero almost everywhere and are bounded by $\( C_epsilon.alt + 1 \) \| u \|^p$. Dominated convergence, followed by $epsilon.alt arrow.b 0$, shows that $R_j arrow.r 0$ in $L^1$, since the $L^p$ norms of $z_j$ are bounded. This proves (5.10).
  Weak convergence in $cal(H)$ also gives the quadratic splitting
  $ Q \( u_j \) = Q \( u \) + Q \( z_j \) + o \( 1 \) . $
  The definition of $Lambda$ gives $Q \( u \) gt.eq Lambda t^(2 \/ p)$, with the same conclusion if $u = 0$. For fixed $epsilon.alt > 0$, apply (4.22) to $z_j$ and use $parallel z_j parallel_2 arrow.r 0$ to obtain
  $ liminf_j Q \( z_j \) gt.eq \( S_(*) - epsilon.alt \) \( 1 - t \)^(2 \/ p) . $
  Letting $epsilon.alt arrow.b 0$ therefore yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ Lambda gt.eq Lambda t^(2 \/ p) + S_(*) \( 1 - t \)^(2 \/ p) . $ <eq:no-critical-mass-loss>]
  If $t < 1$, the inequalities $a^(2 \/ p) gt.eq a$ for $0 lt.eq a lt.eq 1$ and $S_(*) > Lambda$ make the right-hand side strictly larger than $Lambda$: indeed it is at least $Lambda t + S_(*) \( 1 - t \) > Lambda$. Thus $t = 1$. Weak lower semicontinuity now gives $Q \( u \) lt.eq Lambda$, so $u$ is a minimizer with $parallel u parallel_p = 1$. Replacing it by $\| u \|$ preserves both its $L^p$ norm and its energy, by Proposition 18. We take $u gt.eq 0$.
  For each $psi in cal(H)$, differentiate the quotient $Q \( u + s psi \) \/ parallel u + s psi parallel_p^2$ at $s = 0$. Its denominator is nonzero for sufficiently small $s$, and Hölder’s inequality justifies the derivative of the $L^p$ integral: for $\| s \| lt.eq 1$ the derivative integrand is bounded by $p \( \| u \| + \| psi \| \)^(p - 1) \| psi \| in L^1$. Since $u$ is a minimizer and $parallel u parallel_p = 1$, this gives
  $ 4 beta integral D u dot.op D psi thin d mu + n integral u psi thin d mu = Lambda integral u^(p - 1) psi thin d mu . $
  Set
  $ v = (Lambda / n)^(1 \/ \( p - 2 \)) u . $
  Homogeneity preserves the quotient minimum, and $Lambda \( Lambda \/ n \)^(- 1) = n$ gives (5.8). Since $p \/ \( p - 2 \) = n \/ 2$, its $p$th moment is $W = \( Lambda \/ n \)^(n \/ 2) < s_n$ by (5.9). Testing (5.8) with $psi = v$ gives $Q \( v \) = n W$, completing (5.7). ◻
]

The normalized minimizer has the strict weighted mass bound $W < s_n$ needed for the contradiction. The remaining task is to justify nonlinear tests in its weak equation and radial first variation. The following moment and weighted-energy estimates do so without assuming that $v$ is positive everywhere, smooth, or essentially bounded. The proof adapts the critical-potential absorption method of Brézis and Kato #cite(label("BrezisKato1979")) to the closed chart gradient. For the truncated-power formulation, see also #cite(label("Brezis1986")) Lemma 6, p. 178. The adaptation is given in full, without invoking a Euclidean regularity theorem in the present Sobolev space.

#thm([Lemma 5.4.])[
  (Powers of the minimizer).  #emph[For every real $gamma gt.eq 1$, 
$ v^gamma in cal(H) ∩ L^p \( mu \) \, #h(2em) D \( v^gamma \) = gamma v^(gamma - 1) D v . $

 Moreover, $integral v^q thin d mu < oo$ for every finite $q > 0$, and 
#[#set math.equation(numbering: n => "(5.12)")
 $ integral v^q \| D v \|^2 thin d mu < oo #h(2em) upright("for every finite ") q gt.eq 0 . $ <eq:polynomial-weighted-energy>]

]
] <lem:powers>

#proof[
  We first prove the power assertion under the additional assumption $v in L^(2 gamma)$. It is immediate for $gamma = 1$, so suppose $gamma > 1$. For $N gt.eq 1$ define
  $ w_N = v min \( v \, N \)^(gamma - 1) \, #h(2em) psi_N = v min \( v \, N \)^(2 gamma - 2) \, #h(2em) d_gamma = frac(2 gamma - 1, gamma^2) . $
  The scalar functions in these definitions, extended by zero for negative arguments, are Lipschitz and piecewise $C^1$. Thus both compositions belong to $cal(H)$. Their derivatives show that
  $ D v dot.op D psi_N gt.eq d_gamma \| D w_N \|^2 . $
  Indeed there is equality below $N$, while above $N$ the ratio of the coefficients is one and $0 < d_gamma lt.eq 1$. The gradient vanishes on the level set ${ v = N }$, so no value at the corner matters. Testing (5.8) with $psi_N$ is legitimate; for example, $v^(p - 1) psi_N lt.eq N^(2 gamma - 2) v^p$ is integrable. Dropping the nonnegative term $n integral v psi_N thin d mu$ gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ 4 beta d_gamma E \( w_N \) lt.eq n integral v^(p - 2) w_N^2 thin d mu . $ <eq:truncated-power-energy>]
  Apply (4.22) to $w_N$ with $epsilon.alt = S_(*) \/ 2$ and multiply by $d_gamma$. By (5.13),
  $ frac(d_gamma S_(*), 2) parallel w_N parallel_p^2 lt.eq n integral v^(p - 2) w_N^2 thin d mu + d_gamma C_(S_(*) \/ 2) parallel w_N parallel_2^2 . $
  Hölder’s inequality with conjugate exponents $p \/ \( p - 2 \)$ and $p \/ 2$ gives
  $ n integral_({ v > K }) v^(p - 2) w_N^2 thin d mu lt.eq n (integral_({ v > K }) v^p thin d mu)^(\( p - 2 \) \/ p) parallel w_N parallel_p^2 . $
  Since $v in L^p$, choose $K gt.eq 1$, depending on $gamma$ but not $N$, so that the coefficient on the right is at most $d_gamma S_(*) \/ 4$. The contribution of ${ v lt.eq K }$ is at most $n K^(p - 2) parallel w_N parallel_2^2$. Absorbing the tail yields
  $ frac(d_gamma S_(*), 4) parallel w_N parallel_p^2 lt.eq #scale(x: 120%, y: 120%)[\(] n K^(p - 2) + d_gamma C_(S_(*) \/ 2) #scale(x: 120%, y: 120%)[\)] parallel w_N parallel_2^2 . $
  The assumed $L^(2 gamma)$ moment bounds the right-hand side uniformly in $N$, because $w_N lt.eq v^gamma$. Thus $parallel w_N parallel_p$ is uniformly bounded. Equation (5.13), with another application of Hölder, then uniformly bounds $E \( w_N \)$.
  On ${ v < N }$ the gradient of $w_N$ is $gamma v^(gamma - 1) D v$. Monotone convergence in these sets shows that $gamma v^(gamma - 1) D v$ belongs to $cal(L)^2$. At every truncation level the formulas and the level-set property give
  $ \| w_N \| lt.eq v^gamma \, #h(2em) \| D w_N \| lt.eq gamma v^(gamma - 1) \| D v \| . $
  The values and gradients converge almost everywhere to $v^gamma$ and $gamma v^(gamma - 1) D v$, respectively. The displayed bounds give strong $L^2$ convergence of both by dominated convergence. Closedness proves $v^gamma in cal(H)$ with the asserted gradient, and the continuous inclusion into $L^p$ gives $v^gamma in L^p$.
  Starting with $v in L^p$, set $ell_j = p \( p \/ 2 \)^j$ for $j gt.eq 0$. The conditional assertion just proved, with $gamma = ell_j \/ 2$, shows
  $ v in L^(ell_j) quad arrow.r.double quad v in L^(ell_(j + 1)) . $
  Since $p \/ 2 > 1$, these exponents tend to infinity. Finiteness of $mu$ then gives every finite positive moment of $v$. The conditional assertion therefore applies to every $gamma gt.eq 1$. Finally, for $q gt.eq 0$ take $gamma = 1 + q \/ 2$ to obtain
  $ integral v^q \| D v \|^2 thin d mu = gamma^(- 2) E \( v^gamma \) < oo \, $
  which is (5.12). ◻
]

All positive moments and polynomially weighted energies are now finite. We next turn those integrability statements into an admissible chain rule for the actual two-variable tests used in the chord comparison.

#thm([Lemma 5.5.])[
  (Compositions with polynomial growth).  #emph[Let $r in cal(H)$ satisfy $0 lt.eq r lt.eq R < oo$ almost everywhere and $\| D r \| in L^oo \( mu \)$. Suppose that $F$ is $C^1$ on an open neighborhood of $\[ 0 \, R \] times \[ 0 \, oo \)$ and that, on this strip, 
$ \| F \( a \, t \) \| + \| partial_1 F \( a \, t \) \| + \| partial_2 F \( a \, t \) \| lt.eq C \( 1 + t \)^M $

 for some finite $C$ and nonnegative integer $M$. Then $F \( r \, v \) in cal(H)$ and 
#[#set math.equation(numbering: n => "(5.14)")
 $ D \( F \( r \, v \) \) = partial_1 F \( r \, v \) D r + partial_2 F \( r \, v \) D v . $ <eq:polynomial-composite-chain-rule>]

 In particular, this applies with $r = d \( y \, dot.op \)$ for each fixed $y in Y$.]
] <lem:composites>

#proof[
  Let $t_N = min \( v \, N \)$. The scalar calculus in Proposition 18 gives $t_N in cal(H)$ and $D t_N = upright(bold(1))_({ v < N }) D v$, where the level-set property handles $v = N$. For each $N$, choose a smooth, compactly supported cutoff in the given open neighborhood and equal to one on a neighborhood of the compact rectangle $\[ 0 \, R \] times \[ 0 \, N \]$. Multiply $F$ by this cutoff and extend by zero to obtain a global $C^1$ function with bounded first derivatives. It agrees with $F$ and its first derivatives on the rectangle. The bounded-derivative calculus consequently gives $F \( r \, t_N \) in cal(H)$ and
  $ D \( F \( r \, t_N \) \) = partial_1 F \( r \, t_N \) D r + partial_2 F \( r \, t_N \) upright(bold(1))_({ v < N }) D v . $
  Writing $L = parallel thin \| D r \| thin parallel_oo$, the growth assumption gives bounds independent of $N$,
  $ \| F \( r \, t_N \) \| lt.eq C \( 1 + v \)^M \, #h(2em) \| D \( F \( r \, t_N \) \) \| lt.eq C \( 1 + v \)^M \( L + \| D v \| \) . $
  The squares of these bounds are integrable by Lemma 21: they are bounded by a constant times $\( 1 + v^(2 M) \) \( 1 + \| D v \|^2 \)$. Since $v$ is finite almost everywhere, the values and the displayed gradient formulas converge almost everywhere to the values and right-hand side in (5.14). Dominated convergence gives strong convergence in the two $L^2$ spaces, and closedness proves the result. A distance function has bounded values and $\| D r \| lt.eq 1$, so it satisfies the hypotheses. ◻
]

== 6 Conformally weighted chords <sec:chords>

Throughout this section, $n > 2$ and the normalized extremizing cycle $A$ is as in Section 3. We assume the sharp filling inequality in dimension $n - 1$, so that Sections 4 and 5 apply. Keep the notation

$ beta = frac(1, n - 2) \, #h(2em) p = frac(2 n, n - 2) \, #h(2em) Q \( u \) = 4 beta E \( u \) + n lr(bar.v.double u bar.v.double)_2^2 . $

Let $v gt.eq 0$ be the quotient minimizer from Proposition 20. In particular,

#[#set math.equation(numbering: n => "(6.1)")
 $ 0 < W := integral_Y v^p thin d mu < s_n \, #h(2em) Q \( v \) = n W \, #h(2em) thin d nu = v^p / W thin d mu . $ <chord:normalization>]

The last expression defines a probability measure. By Lemma 21, $v$ has all finite positive moments and

#[#set math.equation(numbering: n => "(6.2)")
 $ integral_Y v^q \| D v \|^2 thin d mu < oo #h(2em) \( q gt.eq 0 \) . $ <chord:weighted-energy>]

Choose a finite nonnegative Borel representative of $v$; changing it on a $mu$-null set has no effect on these assertions.

For a fixed center $y in Y$ with $v \( y \) > 0$, set

#[#set math.equation(numbering: n => "(6.3)")
 $ kappa = v \( y \)^beta \, #h(2em) r \( x \) = d \( y \, x \) \, #h(2em) s \( x \) = kappa r \( x \) v \( x \)^beta \, #h(2em) L_y = integral_Y s^2 thin d nu . $ <chord:data>]

These are finite Borel functions or numbers. In particular, with $D = "diam" Y$,

$ L_y lt.eq frac(kappa^2 D^2, W) integral_Y v^(p + 2 beta) thin d mu < oo . $

We study the chord distribution through the transform

#[#set math.equation(numbering: n => "(6.4)")
 $ J_y \( a \) = integral_Y \( 1 + a s^2 \)^(- n) thin d nu #h(2em) \( a gt.eq 0 \) . $ <chord:transform-definition>]

Our first comparison will give $J_y \( a \) lt.eq \( 1 + 2 a L_y \)^(- n \/ 2)$ for every center with $v \( y \) > 0$. Euclidean tangent density will then give a lower bound for $liminf_(a arrow.r oo) a^(n \/ 2) J_y \( a \)$ at almost every center, forcing

$ L_y lt.eq 2 \( W \/ s_n \)^(2 \/ n) < 2 quad upright("for ") nu upright("-almost every center ") y . $

Section 7 will show that the average of these same moments is at least $2$.

Every chart derivative in this section is taken in the variable $x$, at this fixed center $y$. We shall not require $s in cal(H)$. Instead, define the square-integrable chart covector field

#[#set math.equation(numbering: n => "(6.5)")
 $ xi = kappa #scale(x: 120%, y: 120%)[\(] v^(1 + beta) D r + beta r v^beta D v #scale(x: 120%, y: 120%)[\)] . $ <chord:xi>]

Its square integrability follows from $\| D r \| lt.eq 1$, boundedness of $r$, the moments of $v$, and (6.2) with $q = 2 beta$. On ${ v > 0 }$ it is the formal expression $v D s$; the explicit formula (6.5) defines it also on ${ v = 0 }$.

=== 6.1 Admissible chord tests <admissible-chord-tests>

For $a > 0$, the profile $w \( t \) = \( 1 + a t^2 \)^(- \( n - 2 \) \/ 2)$ is the rescaled Euclidean Sobolev profile used in Lemma 16. Its exponent is suited to the transform because $w \( s \)^p = \( 1 + a s^2 \)^(- n)$. We will compare the quotient of $v w \( s \)$ with that of $v$, using $v w \( s \)^2$ in the minimizer equation. The following lemma first justifies these tests and the radial tests needed to control their energy, including at points where $v = 0$.

#thm([Lemma 6.1.])[
  (Admissibility of the chord tests).  #emph[Fix $a > 0$ and put 
$ w \( t \) = \( 1 + a t^2 \)^(- \( n - 2 \) \/ 2) #h(2em) \( t in bb(R) \) . $

 Then $v w \( s \)$ and $v w \( s \)^2$ belong to $cal(H)$, and 
#[#set math.equation(numbering: n => "(6.6)")
 $ D \( v w \( s \) \) & = w \( s \) D v + w' \( s \) xi \,\
D \( v w \( s \)^2 \) & = w \( s \)^2 D v + 2 w \( s \) w' \( s \) xi . $ <chord:product-rules>]

 If $f : bb(R) arrow.r \[ 0 \, oo \)$ is smooth with bounded value and bounded first derivative, then 
#[#set math.equation(numbering: n => "(6.7)")
 $ g = kappa^2 v^(2 + 2 beta) f \( s \) \, #h(2em) psi = beta kappa^2 r^2 v^(1 + 2 beta) f \( s \) $ <chord:radial-tests>]

 also belong to $cal(H)$. In particular, $g$ is an admissible nonnegative test in the extended radial inequality, and $psi$ is an admissible test in (5.8).]
] <lem:chord-tests>

#proof[
  We verify the hypotheses of Lemma 22 for the actual functions of $\( r \, v \)$ that occur here. This is necessary when $beta < 1$, since the scalar function $v^beta$ itself is not $C^1$ at zero.
  For $j = 1 \, 2$ and $z > 0$, define
  $ F_j \( r \, z \) = z thin w \( kappa r z^beta \)^j \, #h(2em) t = kappa r z^beta . $
  On this half-plane,
  $ partial_z F_j = w \( t \)^j + j beta t thin w \( t \)^(j - 1) w' \( t \) \, #h(2em) partial_r F_j = j kappa z^(1 + beta) w \( t \)^(j - 1) w' \( t \) . $
  As $z arrow.b 0$, uniformly for $r$ in bounded intervals, $w \( t \) = 1 + O \( t^2 \)$ and $w' \( t \) = O \( t \)$. Thus
  $ F_j \( r \, z \) = z + O \( z^(1 + 2 beta) \) \, #h(2em) partial_z F_j \( r \, z \) arrow.r 1 \, #h(2em) partial_r F_j \( r \, z \) arrow.r 0 . $
  Extension by $F_j \( r \, z \) = z$ on $z lt.eq 0$ is therefore jointly $C^1$. The functions and their first derivatives have polynomial growth in $z gt.eq 0$ on bounded $r$ intervals.
  For the other tests, write
  $ F_g \( r \, z \) = kappa^2 z^(2 + 2 beta) f \( kappa r z^beta \) \, #h(2em) F_psi \( r \, z \) = beta kappa^2 r^2 z^(1 + 2 beta) f \( kappa r z^beta \) quad \( z > 0 \) . $
  Their partial derivatives are
  $ partial_z F_g & = kappa^2 z^(1 + 2 beta) #scale(x: 120%, y: 120%)[\(] \( 2 + 2 beta \) f \( t \) + beta t f' \( t \) #scale(x: 120%, y: 120%)[\)] \,\
partial_r F_g & = kappa^3 z^(2 + 3 beta) f' \( t \) \,\
partial_z F_psi & = beta kappa^2 r^2 #scale(x: 120%, y: 120%)[\(] \( 1 + 2 beta \) z^(2 beta) f \( t \) + beta kappa r z^(3 beta) f' \( t \) #scale(x: 120%, y: 120%)[\)] \,\
partial_r F_psi & = beta kappa^2 #scale(x: 120%, y: 120%)[\(] 2 r z^(1 + 2 beta) f \( t \) + kappa r^2 z^(1 + 3 beta) f' \( t \) #scale(x: 120%, y: 120%)[\)] . $
  Their values and all these derivatives tend to zero as $z arrow.b 0$, uniformly for bounded $r$. The smallest power of $z$ in the derivative formulas is $2 beta > 0$. Consequently, extension by zero on $z lt.eq 0$ makes both functions jointly $C^1$, even if $f \( 0 \)$ or $f' \( 0 \)$ is nonzero. Their values and first derivatives again have polynomial growth on the range of $r$.
  These $C^1$ extensions and polynomial bounds satisfy all the hypotheses of Lemma 22. That lemma gives membership in $cal(H)$ and the chain rules without a boundedness assumption on $v$. On ${ v > 0 }$, differentiation gives (6.6). On ${ v = 0 }$, Proposition 18 gives $D v = 0$ almost everywhere, while (6.5) gives $xi = 0$. Thus these formulas hold $mu$-almost everywhere on all of $Y$. ◻
]

#thm([Lemma 6.2.])[
  (A consequence of the radial inequality).  #emph[For every center $y in Y$, with $r = d \( y \, dot.op \)$, and every nonnegative $g in cal(H)$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ integral_Y #scale(x: 120%, y: 120%)[\(] n g \| D r \|^2 + r chevron.l D r \, D g chevron.r #scale(x: 120%, y: 120%)[\)] thin d mu lt.eq n / 4 integral_Y r^2 g thin d mu . $ <chord:completed-radial>]

]
] <lem:completed-radial>

#proof[
  The extension of (3.1) to these tests is part of Proposition 18. Pointwise, with $b = sqrt(1 - \| D r \|^2)$,
  $ 1 - r b - \| D r \|^2 + r^2 / 4 = (b - r / 2)^2 gt.eq 0 . $
  Multiply by $n g gt.eq 0$ and combine this inequality with (3.1). All terms are integrable by boundedness of $r$, $\| D r \| lt.eq 1$, finite $mu$, and $g in cal(H)$. ◻
]

=== 6.2 Distribution comparison <distribution-comparison>

All required composite tests are now admissible, including on the zero set of $v$. We combine quotient minimality with radial variation to control the chord transform. Once the integral estimate is obtained, the remaining comparison is a scalar differential inequality.

#thm([Proposition 6.3.])[
  (Distribution comparison).  #emph[For every center $y$ with $v \( y \) > 0$, and every $a gt.eq 0$, 
#[#set math.equation(numbering: n => "(6.9)")
 $ J_y \( a \) = integral_Y \( 1 + a s^2 \)^(- n) thin d nu lt.eq \( 1 + 2 a L_y \)^(- n \/ 2) \, $ <eq:chord-transform>]

 where $s$ and $L_y$ are defined in (6.3).]
] <prop:chord-transform>

#proof[
  Fix the center and suppress its subscript on $J$. For $a > 0$ let $w \( t \) = \( 1 + a t^2 \)^(- \( n - 2 \) \/ 2)$ as in Lemma 23. Since $p \( n - 2 \) \/ 2 = n$,
  $ integral_Y w \( s \)^p thin d nu = J \( a \) . $
  Testing (5.8) with $v w \( s \)^2$ and using the two product formulas (6.6) gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ Q \( v w \( s \) \) = n integral_Y v^p w \( s \)^2 thin d mu + 4 beta integral_Y w' \( s \)^2 \| xi \|^2 thin d mu . $ <chord:ground-state>]
  Indeed the terms $w^2 \| D v \|^2 + 2 w w' chevron.l D v \, xi chevron.r$ in $\| D \( v w \) \|^2$ equal $chevron.l D v \, D \( v w^2 \) chevron.r$. The quotient minimality of $v$ gives, on the other hand,
  #[#set math.equation(numbering: n => "(6.11)")
   $ Q \( v w \( s \) \) gt.eq frac(Q \( v \), lr(bar.v.double v bar.v.double)_p^2) lr(bar.v.double v w \( s \) bar.v.double)_p^2 = n W J \( a \)^(\( n - 2 \) \/ n) . $ <chord:quotient>]
  The test $v w \( s \)$ is nonzero because $w$ is strictly positive and $W > 0$.
  We next control the last integral in (6.10). Let $f$ be smooth, bounded and nonnegative with bounded derivative, and use $g \, psi$ from (6.7). Add (6.8) to (5.8) divided by $4 beta$, with test $psi$. The identity $v psi = beta r^2 g$ cancels the two undifferentiated terms and yields
  #[#set math.equation(numbering: n => "(6.12)")
   $ integral_Y #scale(x: 120%, y: 120%)[\(] n g \| D r \|^2 + r chevron.l D r \, D g chevron.r + chevron.l D v \, D psi chevron.r #scale(x: 120%, y: 120%)[\)] thin d mu lt.eq n / 4 integral_Y s^2 f \( s \) v^p thin d mu . $ <chord:added-tests>]
  Here we used $v^(p - 1) psi = beta s^2 f \( s \) v^p$. For completeness, after removing the common factor $kappa^2$, the coefficients of $\| D r \|^2$, $chevron.l D r \, D v chevron.r$, and $\| D v \|^2$ in the left integrand are respectively
  $ & v^(2 + 2 beta) #scale(x: 120%, y: 120%)[\(] n f + s f' #scale(x: 120%, y: 120%)[\)] \,\
 & r v^(1 + 2 beta) #scale(x: 120%, y: 120%)[\(] \( 2 + 4 beta \) f + 2 beta s f' #scale(x: 120%, y: 120%)[\)] \,\
 & beta r^2 v^(2 beta) #scale(x: 120%, y: 120%)[\(] \( 1 + 2 beta \) f + beta s f' #scale(x: 120%, y: 120%)[\)] . $
  The scalar functions $f \, f'$ in this display are evaluated at $s$. Since
  #[#set math.equation(numbering: n => "(6.13)")
   $ 1 + 2 beta = n beta \, #h(2em) 2 + 4 beta = 2 n beta = p \, $ <chord:exponent-identities>]
  these are precisely the coefficients of $\( n f \( s \) + s f' \( s \) \) \| xi \|^2 \/ kappa^2$. Thus
  #[#set math.equation(numbering: n => "(6.14)")
   $ integral_Y #scale(x: 120%, y: 120%)[\(] n f \( s \) + s f' \( s \) #scale(x: 120%, y: 120%)[\)] \| xi \|^2 thin d mu lt.eq n / 4 integral_Y s^2 f \( s \) v^p thin d mu . $ <chord:energy>]
  To bound the energy term in (6.10), we want $n f \( t \) + t f' \( t \) = w' \( t \)^2$ in (6.14). Integrating this first-order equation leads to the choice
  #[#set math.equation(numbering: n => "(6.15)")
   $ f \( t \) = integral_0^1 tau^(n - 1) w' \( tau t \)^2 thin d tau #h(2em) \( t in bb(R) \) . $ <chord:f>]
  This is smooth and nonnegative. Both $w'$ and $w''$ are bounded on $bb(R)$, so $f$ and $f' \( t \) = 2 integral_0^1 tau^n w' \( tau t \) w'' \( tau t \) thin d tau$ are bounded. Integrating the derivative of $tau^n w' \( tau t \)^2$ gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ n f \( t \) + t f' \( t \) = w' \( t \)^2 . $ <chord:f-identity>]
  The boundary term at $tau = 0$ is zero. Combining (6.10), (6.11), (6.14), and (6.16), and dividing by $n W$, we obtain
  #[#set math.equation(numbering: n => "(6.17)")
   $ J \( a \)^(\( n - 2 \) \/ n) lt.eq integral_Y #scale(x: 120%, y: 120%)[\(] w \( s \)^2 + beta s^2 f \( s \) #scale(x: 120%, y: 120%)[\)] thin d nu . $ <chord:scalar-start>]
  The current and variational estimates have now reduced the comparison to (6.17). We evaluate its scalar right side and solve the resulting differential inequality for the transform. Put $b = a s^2 gt.eq 0$ and $q = \( n - 2 \) \/ 2 > 0$. Since
  $ w' \( t \)^2 = \( n - 2 \)^2 a^2 t^2 \( 1 + a t^2 \)^(- n) \, $
  the substitution $u = tau^2$ in (6.15) gives
  $ w \( s \)^2 + beta s^2 f \( s \) = \( 1 + b \)^(- \( n - 2 \)) + q b^2 integral_0^1 frac(u^(n \/ 2), \( 1 + b u \)^n) thin d u . $
  The exact derivative identity
  $ frac(thin d, thin d u) (frac(u^q, \( 1 + b u \)^(n - 2))) = q frac(u^(q - 1) \( 1 - b^2 u^2 \), \( 1 + b u \)^n) $
  has an integrable right side on $\( 0 \, 1 \)$; this includes $n = 3$, when $q - 1 = - 1 \/ 2$. Integrating it shows that
  #[#set math.equation(numbering: n => "(6.18)")
   $ w \( s \)^2 + beta s^2 f \( s \) = q integral_0^1 frac(u^(q - 1), \( 1 + a s^2 u \)^n) thin d u . $ <chord:scalar-identity>]
  In particular this expression lies in $\( 0 \, 1 \]$. Tonelli’s theorem therefore turns (6.17) into
  #[#set math.equation(numbering: n => "(6.19)")
   $ J \( a \)^(\( n - 2 \) \/ n) lt.eq G \( a \) \, #h(2em) G \( a \) = q integral_0^1 J \( a u \) u^(q - 1) thin d u . $ <chord:J-G>]
  We have $G \( 0 \) = 1$ and $G \( a \) > 0$. For $a > 0$, changing variable $t = a u$ gives
  $ G \( a \) = q a^(- q) integral_0^a J \( t \) t^(q - 1) thin d t \, #h(2em) a G' \( a \) = q #scale(x: 120%, y: 120%)[\(] J \( a \) - G \( a \) #scale(x: 120%, y: 120%)[\)] . $
  Continuity of $J$ suffices for this differentiation. The finite second moment in (6.3) also allows differentiation at zero from the right, because
  $ lr(|frac(partial, partial a) \( 1 + a s^2 \)^(- n)|) lt.eq n s^2 #h(2em) \( a gt.eq 0 \) . $
  Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ J' \( 0 + \) = - n L_y \, #h(2em) G' \( 0 + \) = frac(q, q + 1) J' \( 0 + \) = - \( n - 2 \) L_y . $ <chord:initial-derivatives>]
  Set $h = G^(- 1 \/ q) = G^(- 2 \/ \( n - 2 \))$. For $a > 0$,
  $ a h' = h - J G^(- n \/ \( n - 2 \)) gt.eq h - 1 \, $
  where the last step follows from (6.19). Thus
  $ (frac(h \( a \) - 1, a))' = frac(a h' \( a \) - h \( a \) + 1, a^2) gt.eq 0 . $
  By (6.20), the quotient on the left has limit $2 L_y$ at zero. It follows that $h \( a \) gt.eq 1 + 2 a L_y$. Finally (6.19) gives
  $ J \( a \) lt.eq G \( a \)^(n \/ \( n - 2 \)) = h \( a \)^(- n \/ 2) lt.eq \( 1 + 2 a L_y \)^(- n \/ 2) . $
  At $a = 0$ both sides equal one. If $L_y = 0$, then $s = 0$ $nu$-almost everywhere, so $J = G = h = 1$ and the same conclusion holds. No higher chord moment is needed in the scalar comparison. ◻
]

=== 6.3 Tangent density <tangent-density>

The transform estimate bounds $J_y$ in terms of its second moment $L_y$, but does not yet bound that moment. At almost every center, integer Euclidean tangent density supplies a lower coefficient for $J_y$ at large parameter. Combining the two estimates gives the required strict bound on $L_y$.

#thm([Lemma 6.4.])[
  (Tangent density of the chord transform).  #emph[For $nu$-almost every center $y$, 
#[#set math.equation(numbering: n => "(6.21)")
 $ liminf_(a arrow.r oo) a^(n \/ 2) J_y \( a \) gt.eq frac(s_n, 2^n W) . $ <chord:transform-density>]

 Consequently, 
#[#set math.equation(numbering: n => "(6.22)")
 $ L_y lt.eq 2 (W / s_n)^(2 \/ n) < 2 #h(2em) upright("for ") nu upright("-almost every ") y . $ <eq:chord-upper>]

]
] <lem:chord-density>

#proof[
  Use the disjoint chart representation of Proposition 8. For one chart $phi.alt_i : E_i arrow.r Z_i subset Y$, write
  $ u_i = v compose phi.alt_i \, #h(2em) rho_i = \| theta_i \| J_i \, #h(2em) J_i = sqrt(det G_i) \, $
  and extend $u_i$ and $rho_i$ by zero to $bb(R)^n$. The bi-Lipschitz bounds give a positive lower bound for $J_i$ on this chart almost everywhere. Since $\| theta_i \| gt.eq 1$, $v in L^p \( mu \)$ and $mu \( Y \) < oo$, $u_i$ is Lebesgue integrable. The function $rho_i$ is integrable as well, by the mass representation. Thus ordinary Lebesgue differentiation applies to both functions and to $1_(E_i)$.
  For $nu$-almost every $y = phi.alt_i \( z \)$, we may therefore require all of the following: $z$ is a density point of $E_i$; the centered metric differential is the Euclidean norm $\| dot.op \|_(G_0)$, with $G_0 = G_i \( z \) > 0$; and $u_i \, rho_i$ have Lebesgue values
  #[#set math.equation(numbering: n => "(6.23)")
   $ v_0 = v \( y \) > 0 \, #h(2em) rho_0 = \| theta_i \( z \) \| sqrt(det G_0) > 0 . $ <chord:lebesgue-values>]
  Indeed the exceptional coordinate sets are Lebesgue-null and therefore have zero chart mass, while ${ v = 0 }$ has zero $nu$-mass. There are only countably many charts. The representative of $v$ agrees with its Lebesgue value at almost every such point. Fix a center with these properties.
  Let $ell = liminf_(a arrow.r oo) a^(n \/ 2) J_y \( a \)$. If $ell = oo$, the desired lower bound is automatic. Otherwise, choose $a_j arrow.r oo$ realizing this lower limit and put $epsilon_j = a_j^(- 1 \/ 2)$. On every bounded set of $h in bb(R)^n$, the functions
  $ u_i \( z + epsilon_j h \) \, #h(2em) rho_i \( z + epsilon_j h \) \, #h(2em) 1_(E_i) \( z + epsilon_j h \) $
  converge in measure to $v_0 \, rho_0 \, 1$, respectively. For example, this follows by changing variables in the defining mean convergence at the Lebesgue point $z$. A diagonal subsequence over bounded balls makes all three convergences hold almost everywhere in $bb(R)^n$. The subsequence still realizes $ell$.
  At almost every $h$, the points $z + epsilon_j h$ consequently belong to $E_i$ for all sufficiently large $j$. The centered metric differential then gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ R_j \( h \) := epsilon_j^(- 1) d #scale(x: 120%, y: 120%)[\(] y \, phi.alt_i \( z + epsilon_j h \) #scale(x: 120%, y: 120%)[\)] arrow.r \| h \|_(G_0) . $ <chord:rescaled-distance>]
  When the chart point is absent, define the integrand below to be zero. Restricting the nonnegative integral defining $J_y$ to this chart and changing variables gives, for every fixed bounded ball $D_R subset bb(R)^n$ centered at zero,
  $ W a_j^(n \/ 2) J_y \( a_j \) gt.eq integral_(D_R) frac(1_(E_i) \( z + epsilon_j h \) u_i \( z + epsilon_j h \)^p rho_i \( z + epsilon_j h \), #scale(x: 120%, y: 120%)[\(] 1 + kappa^2 R_j \( h \)^2 u_i \( z + epsilon_j h \)^(2 beta) #scale(x: 120%, y: 120%)[\)]^n) thin d h . $
  The factor $a_j^(n \/ 2)$ has canceled the Jacobian $epsilon_j^n$. Fatou’s lemma, (6.23), and (6.24) now imply
  $ W ell gt.eq v_0^p rho_0 integral_(D_R) #scale(x: 120%, y: 120%)[\(] 1 + v_0^(4 beta) \| h \|_(G_0)^2 #scale(x: 120%, y: 120%)[\)]^(- n) thin d h . $
  This step uses no uniform integrability of the rescaled densities. Letting $R arrow.r oo$ and applying monotone convergence gives the same bound with $D_R$ replaced by $bb(R)^n$.
  The linear substitution $H = v_0^(2 beta) G_0^(1 \/ 2) h$ has Jacobian $v_0^(2 n beta) sqrt(det G_0)$. Since $2 n beta = p$, we obtain
  $ W ell & gt.eq \| theta_i \( z \) \| integral_(bb(R)^n) \( 1 + \| H \|^2 \)^(- n) thin d H\
 & = \| theta_i \( z \) \| thin 2^(- n) s_n gt.eq 2^(- n) s_n . $
  The middle equality is the stereographic integral (4.21). The final inequality uses the nonzero integer multiplicity $\| theta_i \( z \) \| gt.eq 1$. This proves (6.21) without a bound on the multiplicity.
  If $L_y > 0$, Proposition 25 and (6.21) give
  $ frac(s_n, 2^n W) lt.eq \( 2 L_y \)^(- n \/ 2) . $
  Rearranging yields (6.22). If $L_y = 0$, that upper bound is immediate. Its strict inequality follows from $W < s_n$. ◻
]

#prodef([Remark 6.5.])[
  (The round sphere).  The constants can be checked simultaneously in every dimension on the unit round $S^n subset bb(R)^(n + 1)$ with $v = 1$. Here $W = s_n$, $nu$ is normalized area, and $L_y = 2$ by rotational symmetry. In stereographic coordinates chosen so that $\| x - y \|^2 = 4 \| z \|^2 \/ \( 1 + \| z \|^2 \)$,
  $ J_y \( a \) = 2^n / s_n integral_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] 1 + \( 1 + 4 a \) \| z \|^2 #scale(x: 120%, y: 120%)[\)]^(- n) thin d z = \( 1 + 4 a \)^(- n \/ 2) . $
  Thus the transform estimate is an equality, and its limiting coefficient is $2^(- n)$, exactly the value in (6.21) when $W = s_n$.
] <rem:chord-sphere>

Only the scalar values $v \( y \) \, v \( x \)$ and the distance $d \( y \, x \)$ occur in (6.22). The kernel

$ \( y \, x \) mapsto v \( y \)^(2 beta) d \( y \, x \)^2 v \( x \)^(2 beta) $

is Borel and is integrable against $nu ⊗ nu$, since $Y$ has finite diameter and $v^(p + 2 beta) in L^1 \( mu \)$. Accordingly, the almost-everywhere upper bound can be averaged without any jointly measurable choice of the covectors $D_x d \( y \, x \)$.

== 7 Averaging and completion of the proof <sec:conclusion>

We first derive the lower bound that contradicts the chord estimate of Section 6. Throughout this argument, $n > 2$, and we retain the normalized extremizing cycle $A$, its mass measure $mu$, and the nonnegative minimizer $v$ of Proposition 20. Thus

$ beta = frac(1, n - 2) \, #h(2em) p = frac(2 n, n - 2) = 2 + 4 beta \, #h(2em) W = integral_Y v^p thin d mu > 0 \, #h(2em) thin d nu = v^p / W thin d mu . $

We use the same finite, nonnegative Borel representative of $v$ as in Section 6.

#thm([Lemma 7.1.])[
  (Opposite averaged chord bound).  #emph[Define 
#[#set math.equation(numbering: n => "(7.1)")
 $ B_(*) := integral_Y v^(p + 2 beta) thin d mu \, #h(2em) I \( y \) := integral_Y d \( y \, x \)^2 v \( x \)^(p + 2 beta) thin d mu \( x \) . $ <finish:weighted-moment>]

 Then $0 < B_(*) < oo$, the function $I$ is finite and continuous on $Y$, and 
#[#set math.equation(numbering: n => "(7.2)")
 $ W^2 lt.eq B_(*) I \( y \) #h(2em) upright("for every ") y in Y . $ <finish:all-centers>]

 In particular, for the chord moments 
$ L_y = integral_Y #scale(x: 120%, y: 120%)[\[] v \( y \)^beta d \( y \, x \) v \( x \)^beta #scale(x: 120%, y: 120%)[\]]^2 thin d nu \( x \) \, $

 one has 
#[#set math.equation(numbering: n => "(7.3)")
 $ integral_Y L_y thin d nu \( y \) gt.eq 2 . $ <finish:opposite-average>]

]
] <lem:opposite-average>

#proof[
  Lemma 21 gives all finite moments of $v$, so $B_(*)$ is finite. It is positive because $W > 0$. Write $D_Y = "diam" Y$. Then $0 lt.eq I \( y \) lt.eq D_Y^2 B_(*)$, and the triangle inequality gives
  $ \| I \( y \) - I \( z \) \| lt.eq 2 D_Y B_(*) d \( y \, z \) #h(2em) \( y \, z in Y \) . $
  This proves the stated continuity.
  Fix any $y in Y$ and put $r = d \( y \, dot.op \)$. By Lemma 21, the nonnegative function $g = v^p$ belongs to $cal(H)$, and $D g = p v^(p - 1) D v$. The extension of the radial inequality (3.1) furnished by Proposition 18 therefore applies to this $g$. Dividing by $n$ and using $p \/ n = 2 beta$ gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ W lt.eq integral_Y r (v^p sqrt(1 - \| D r \|^2) - 2 beta v^(p - 1) chevron.l D r \, D v chevron.r) thin d mu . $ <finish:radial-test>]
  At almost every point of each current chart, take the direct sum of its cotangent inner-product space with $bb(R)$. The vector
  $ (sqrt(1 - \| D r \|^2) \, D r) $
  has norm one. Moreover, the identities
  $ p / 2 + beta + 1 + beta = p \, #h(2em) p / 2 + beta + beta = p - 1 $
  give the factorization
  $ & v^p sqrt(1 - \| D r \|^2) - 2 beta v^(p - 1) chevron.l D r \, D v chevron.r\
 & quad = v^(p \/ 2 + beta) ⟨(sqrt(1 - \| D r \|^2) \, D r) \, (v^(1 + beta) \, - 2 beta v^beta D v)⟩\
 & quad lt.eq v^(p \/ 2 + beta) (v^(2 + 2 beta) + 4 beta^2 v^(2 beta) \| D v \|^2)^(1 \/ 2) . $
  All powers in this formula are nonnegative powers of $v$, and the identity also holds on ${ v = 0 }$. Applying the integral Cauchy–Schwarz inequality to (7.4) now yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ W^2 lt.eq I \( y \) integral_Y (v^(2 + 2 beta) + 4 beta^2 v^(2 beta) \| D v \|^2) thin d mu . $ <finish:cauchy>]
  Both factors are finite: the first was bounded above, and the second is finite by the moment estimates and the Sobolev power $v^(1 + beta)$ in Lemma 21.
  To identify the last integral, use $psi = v^(1 + 2 beta) in cal(H)$ in the Euler equation (5.8). Its gradient is $D psi = \( 1 + 2 beta \) v^(2 beta) D v$. Thus
  $ 4 beta \( 1 + 2 beta \) integral_Y v^(2 beta) \| D v \|^2 thin d mu + n integral_Y v^(2 + 2 beta) thin d mu = n integral_Y v^(p + 2 beta) thin d mu . $
  Since $1 + 2 beta = n beta$, division by $n$ proves
  #[#set math.equation(numbering: n => "(7.6)")
   $ integral_Y (v^(2 + 2 beta) + 4 beta^2 v^(2 beta) \| D v \|^2) thin d mu = B_(*) . $ <finish:euler-moment>]
  Equations (7.5) and (7.6) prove (7.2). The argument fixed an arbitrary center before taking chart derivatives. Hence its conclusion holds for every center, although the null set on which $D r$ is undefined may depend on that center.
  We have proved the all-center estimate $W^2 lt.eq B_(*) I \( y \)$. It remains to combine it with the CAT(0) variance inequality #cite(label("Sturm2003")) Proposition 4.4, which doubles this lower contribution when we average over centers. We recall its proof for the finite measure $v^(p + 2 beta) mu$. Compactness of $Y$ and continuity of $I$ provide a minimizer $o in Y$. This is a barycenter of the finite measure $v^(p + 2 beta) mu$. For $y in Y$, let $o_t$ be the point at fraction $t in \( 0 \, 1 \)$ on the segment from $o$ to $y$. The CAT(0) squared-distance inequality, integrated against $v \( x \)^(p + 2 beta) thin d mu \( x \)$, gives
  $ I \( o \) lt.eq I \( o_t \) lt.eq \( 1 - t \) I \( o \) + t I \( y \) - t \( 1 - t \) B_(*) d \( o \, y \)^2 . $
  Subtracting $\( 1 - t \) I \( o \)$, dividing by $t$, and letting $t arrow.b 0$ proves the variance inequality
  #[#set math.equation(numbering: n => "(7.7)")
   $ I \( y \) gt.eq I \( o \) + B_(*) d \( o \, y \)^2 #h(2em) \( y in Y \) . $ <finish:variance>]
  This uses only the segment from $o$ to $y$.
  The chord kernel is a nonnegative Borel function on $Y times Y$. Its integral is finite, since its expression below is bounded above by $D_Y^2 B_(*)^2 \/ W^2$. Tonelli’s theorem and (7.1) give
  #[#set math.equation(numbering: n => "(7.8)")
   $ integral_Y L_y thin d nu \( y \) & = integral.double_(Y times Y) #scale(x: 120%, y: 120%)[\[] v \( y \)^beta d \( y \, x \) v \( x \)^beta #scale(x: 120%, y: 120%)[\]]^2 thin d nu \( x \) thin d nu \( y \)\
 & = 1 / W^2 integral_Y I \( y \) v \( y \)^(p + 2 beta) thin d mu \( y \)\
 & gt.eq 1 / W^2 (B_(*) I \( o \) + B_(*) integral_Y d \( o \, y \)^2 v \( y \)^(p + 2 beta) thin d mu \( y \))\
 & = frac(2 B_(*) I \( o \), W^2) gt.eq 2 . $ <finish:double-integral>]
  Here the first inequality is (7.7), and the last is (7.2) at $y = o$. The averaged expressions contain only distances and values of the Borel representative of $v$; the proof requires no joint choice of the derivatives of distance functions. This proves (7.3). ◻
]

#proof[
  We first prove the statement in every compact CAT(0) space by induction on the cycle dimension $n gt.eq 2$. For such a space $Y$, let $V \( T \)$ denote the infimum of the masses of integral fillings of an integral $n$-cycle $T$ in $Y$. Theorem 4 ensures that this infimum is finite and attained. It therefore suffices in each dimension to prove
  #[#set math.equation(numbering: n => "(7.9)")
   $ V \( T \) lt.eq c_n upright(bold(M)) \( T \)^(\( n + 1 \) \/ n) #h(2em) upright("for every integral ") n upright("-cycle ") T upright(" in ") Y . $ <finish:compact-bound>]
  The zero cycle has the zero current as a filling.
  In dimension $n = 2$, a violation of (7.9) would, by Lemma 5, produce a nonzero extremizing cycle that can be rescaled to satisfy (2.10). Proposition 11 excludes this cycle: its radial inequality and Euclidean lower density force $upright(bold(M)) \( A \) gt.eq s_2$, whereas the normalization requires $upright(bold(M)) \( A \) < s_2$. Thus (7.9) holds in dimension two, and attainment gives an integral filling with that mass bound.
  Now let $n > 2$, and assume the asserted existence of sharp integral fillings in dimension $n - 1$ in every compact CAT(0) space. Suppose that (7.9) fails for a cycle $T$ in a compact CAT(0) space $Y$. Since $T eq.not 0$, we may choose
  $ c_n < c < frac(V \( T \), upright(bold(M)) \( T \)^(\( n + 1 \) \/ n)) . $
  Lemma 5 produces a nonzero cycle $A$ maximizing $V \( B \) - c upright(bold(M)) \( B \)^(\( n + 1 \) \/ n)$ over integral $n$-cycles. After a constant rescaling of the metric it satisfies (2.9) and (2.10), in particular
  $ m := upright(bold(M)) \( A \) = \( \( n + 1 \) c \)^(- n) < s_n . $
  The rescaled space remains compact and CAT(0), so the induction hypothesis continues to apply there.
  Proposition 10 gives (3.1) for this cycle. The sharp filling statement in dimension $n - 1$ is exactly the induction input to Proposition 12. Consequently Section 4, and in particular the almost sharp Sobolev inequality of Proposition 17, applies. Propositions 18 and 19 supply the completed calculus and compactness used in Proposition 20. We therefore obtain a nonnegative minimizer $v$ satisfying (5.8) and (5.7), with
  $ 0 < W = integral_Y v^p thin d mu < s_n . $
  Lemmas 21 and 22 justify the powers and nonlinear tests used in Section 6 and in Lemma 28.
  For the probability measure $nu = v^p mu \/ W$, the chord upper bound (6.22) holds for $nu$-almost every center. Integrating that bound and using Lemma 28 gives
  $ 2 lt.eq integral_Y L_y thin d nu \( y \) lt.eq 2 (W / s_n)^(2 \/ n) < 2 \, $
  a contradiction. Hence no violating cycle $T$ exists, and (7.9) holds in dimension $n$. By attainment in Theorem 4, every integral $n$-cycle has an integral filling realizing $V \( T \)$, with the required mass bound. Its support is compact because it is a closed subset of $Y$. This completes the induction for every $n gt.eq 2$.
  Lemma 3 now transfers this bound to every compactly supported integral cycle $T in upright(bold(I))_n \( X \)$ in a proper CAT(0) space. It supplies a compactly supported integral filling $S$ with
  $ partial S = T \, #h(2em) upright(bold(M)) \( S \) lt.eq c_n upright(bold(M)) \( T \)^(\( n + 1 \) \/ n) = frac(upright(bold(M)) \( T \)^(\( n + 1 \) \/ n), \( n + 1 \)^(\( n + 1 \) \/ n) omega_(n + 1)^(1 \/ n)) . $
  The zero cycle has the zero filling. This proves the theorem. ◻
]

== 8 The classical domain inequality and sharpness <sec:classical>

We prove Corollary 2 and verify the optimality of the filling coefficient. Both conclusions use the absence of compactly supported top-dimensional cycles in a connected noncompact oriented manifold.

#thm([Lemma 8.1.])[
  #emph[Let $M$ be a connected, noncompact, oriented Riemannian manifold of dimension $d$. If $C in upright(bold(I))_d \( M \)$ has compact support and $partial C = 0$, then $C = 0$.]
] <lem:top-dimensional-constancy>

#proof[
  In a relatively compact oriented coordinate ball, the top-dimensional representation of an integral current is integration against an integer-valued locally integrable coefficient $theta$. Testing $partial C = 0$ with compactly supported smooth $\( d - 1 \)$-forms shows that every distributional partial derivative of $theta$ is zero. Thus $theta$ is constant almost everywhere on that ball. For completeness, convolution with a smooth kernel gives functions with zero ordinary gradient on each smaller ball; passing to the local $L^1$ limit proves the assertion. Compatibility on overlaps and connectedness give one constant on $M$. Some nonempty open set lies outside the compact support, so this constant is zero. ◻
]

#proof[
  By the Cartan–Hadamard theorem and Hopf–Rinow, $M$ is a proper CAT(0) space and is diffeomorphic to $bb(R)^d$; in particular it is oriented and noncompact. See #cite(label("BridsonHaefliger1999")) Sections I.3, II.1A and II.4 for the metric comparison and completeness statements. Let $\[ \[ Omega \] \]$ be its integration current. Its mass is $"vol" \( Omega \)$, and the mass of $T = partial \[ \[ Omega \] \]$ is $"area" \( partial Omega \)$. Theorem 1, with $n = d - 1$, gives a compactly supported $S in upright(bold(I))_d \( M \)$ with $partial S = T$ and
  $ upright(bold(M)) \( S \) lt.eq frac("area" \( partial Omega \)^(d \/ \( d - 1 \)), d^(d \/ \( d - 1 \)) omega_d^(1 \/ \( d - 1 \))) . $
  Lemma 29 applies to $S - \[ \[ Omega \] \]$, so $S = \[ \[ Omega \] \]$. Rearranging its mass bound proves (1.3).
  For a relatively compact set $Omega$ of finite perimeter, the standard representation of its integration current gives $\[ \[ Omega \] \] in upright(bold(I))_d \( M \)$, with mass $"vol" \( Omega \)$ and boundary mass equal to its perimeter; see #cite(label("Simon2014")) Chapter 3, Section 4, Theorem 4.3; Chapter 6, Section 3, Remark 3.15. The same argument applies verbatim. ◻
]

For $d = 2$, the classical disk inequality gives $L \( partial D \)^2 gt.eq 4 pi "area" \( D \)$ for a smooth Riemannian disk of Gaussian curvature at most zero; see #cite(label("Izmestiev2014")) Section 1.2, Theorem 3 for this formulation. Filling the holes in a bounded smooth domain on a Cartan–Hadamard surface increases area and decreases boundary length. Applying the disk inequality to each resulting component, and then summing, proves the same bound for the domain because $\( sum_j L_j \)^2 gt.eq sum_j L_j^2$. Together with Corollary 2, this establishes the Euclidean Cartan–Hadamard domain inequality in every ambient dimension.

To see that the coefficient in Theorem 1 is optimal, take $X = bb(R)^(n + 1)$ and let $T$ be the oriented boundary of the Euclidean ball $B_R$. Its mass is $s_n R^n$, while

$ upright(bold(M)) \( \[ \[ B_R \] \] \) = omega_(n + 1) R^(n + 1) = c_n \( s_n R^n \)^(\( n + 1 \) \/ n) . $

Any compactly supported integral filling of $T$ equals $\[ \[ B_R \] \]$ by Lemma 29. Hence equality occurs and no smaller universal coefficient is possible.


#bibliography("refs.bib", style: "ieee", title: [References])
