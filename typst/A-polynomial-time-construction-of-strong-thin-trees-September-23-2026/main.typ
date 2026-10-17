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

#align(center)[#text(size: 16pt, weight: "bold")[A polynomial-time construction of strong thin trees]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A spanning tree retains connectivity with only $n - 1$ edges. A thin spanning tree must also use a small fraction of every cut, with the same tree serving all cuts simultaneously. We give a deterministic polynomial-bit construction at the inverse-connectivity scale.

Throughout, graphs are finite undirected loopless multigraphs, and every parallel copy counts separately. For $S subset.eq V \( G \)$, let $delta_G \( S \)$ be the multiset of edges with one endpoint in $S$ and the other in its complement. The graph is $k$-edge-connected if $\| delta_G \( S \) \| gt.eq k$ for every nonempty proper $S$. A spanning tree $T$ is #emph[$alpha$-thin] in $G$ if

$ \| delta_T \( S \) \| lt.eq alpha \| delta_G \( S \) \| #h(2em) \( diameter eq.not S subset.neq V \( G \) \) . $

We consider two input representations: an explicit list of labelled edge copies, or a list of endpoint pairs with nonnegative integer multiplicities written in binary. In the second representation, the number of edge copies may be exponential in the input length.

#thm([Theorem 1.1.])[
  (Algorithmic strong thin trees).  #emph[There is an absolute constant $C$ with the following property. Given a finite $k$-edge-connected multigraph $G$ on at least one vertex and an integer $k gt.eq 1$, a deterministic algorithm returns a spanning tree $T$ satisfying 
#[#set math.equation(numbering: n => "(1.1)")
 $ \| delta_T \( S \) \| lt.eq C / k thin \| delta_G \( S \) \| #h(2em) \( diameter eq.not S subset.neq V \( G \) \) $ <eq:ta-thin>]

 in time polynomial in the total binary input length, whether edges are listed explicitly or multiplicities are encoded in binary. For a one-vertex graph the answer is the empty tree.]
] <thm:tt-algorithm>

The universal $C \/ k$ bound is the strong thin-tree conjecture. The companion article #emph[The strong thin tree conjecture] #cite(label("ThinTreesCompanion")) proves the existence statement and supplies the complete hierarchy geometry used here. Theorem 1 gives the positive algorithmic resolution in both finite input models. Its order in $k$ is necessary: for two vertices joined by $k$ parallel edges, the unique cut contains exactly one tree edge.

The construction also gives simultaneous cost-and-cut rounding. Given nonnegative rational edge weights whose mass on every cut is at least one, and any nonnegative rational edge costs, we find a tree in the positive support with every cut load and its total cost bounded by constant multiples of the corresponding fractional quantities (Corollary 15). No metric assumption on the costs is needed.

=== 1.1 Context and prior work <context-and-prior-work>

Goddyn’s qualitative conjecture asks whether every positive thinness bound follows from sufficiently large edge connectivity, independently of graph order #cite(label("Goddyn2004")) Problem 4. The strong form specifies the rate $C \/ k$; the distinction is made explicitly in #cite(label("AnariOveisGharan2015")) Conjecture 1.3 and the following discussion. One source of algorithmic interest is the asymmetric traveling salesman problem, which asks for a minimum-cost tour through the vertices of a directed metric. Asadpour, Goemans, Mądry, Oveis Gharan, and Saberi used maximum-entropy spanning-tree distributions to obtain an $O \( log n \/ log log n \)$ approximation #cite(label("AsadpourEtAl2017")). Their rounding method also gives the constructive $O \( log n \/ \( k log log n \) \)$ thin-tree scale; see #cite(label("AnariOveisGharan2015")) Section 1.

For planar graphs, and more generally on each fixed orientable surface, Oveis Gharan and Saberi obtained constructive inverse-connectivity bounds #cite(label("OveisGharanSaberi2011")) Theorem 5.1. For general multigraphs, Anari and Oveis Gharan introduced effective-resistance-reducing flows and locally connected hierarchies, and proved the existence of $"poly" \( log log n \) \/ k$-thin trees #cite(label("AnariOveisGharan2015")) Corollary 1.8. Their geometric method is the principal foundation of the hierarchy argument in the companion and its extension below. The existence theorem does not itself give a polynomial-time construction of those trees.

Recent work has obtained inverse-connectivity bounds for structured families of cuts. Klein and Olver treat every prescribed laminar family #cite(label("KleinOlver2023")). Klein, Olver, and Yeoh construct a tree crossing each cut of size less than $\( 1 + 1 \/ 40 \) k$ at most $88$ times #cite(label("KleinOlverYeoh2026")) Theorem 1. Our conclusion controls all cuts of an arbitrary multigraph. Thin trees remain an independent structural problem: constant-factor approximation for asymmetric traveling salesman was already established by Svensson, Tarnawski, and Végh and subsequently improved by Traub and Vygen #cite(label("SvenssonTarnawskiVegh2020")) #cite(label("TraubVygen2022")).

=== 1.2 From the geometric existence proof to an algorithm <from-the-geometric-existence-proof-to-an-algorithm>

High edge connectivity supplies many edge-disjoint spanning trees by the Nash–Williams–Tutte theorem #cite(label("NashWilliams1961")) #cite(label("Tutte1961")). A packing bounds the average tree load on each fixed cut, but does not identify one tree that is small on every cut. The companion retains a large packing through successive sparsifications, reducing cut sizes and packing size by almost the same factor. Two vector representations allow the same edge subset to preserve cut control and enough rank information to certify all partition inequalities for tree packing. Iterated matrix halving with a bounded product of losses was used by Harvey and Olver to obtain spectrally thin trees under an effective-resistance hypothesis #cite(label("HarveyOlver2014")) full version, Appendix F. Here the additional packing representation permits iteration from edge connectivity.

A shortcut matrix is a positive quadratic form that bounds cut sizes; its inverse assigns each edge a resistance, and edges of low resistance are the candidates retained for sparsification. Three steps of the existence argument require new computational work. The shortcut matrix must be consistent with partitions determined by that same matrix; its construction by compactness and a fixed point does not provide a uniform finite search bound. Real whitening may introduce irrational entries, so a polynomial-bit algorithm must specify its numerical data and control every precision loss. Finally, the existential matrix partition theorem of Marcus, Spielman, and Srivastava must be replaced by an algorithm that finds the signs. We use the public constructive method of Ezeunala and Jiang, with a quantitative implementation proved below, while retaining the packing argument.

===== 1.2.1 A larger cone of geometric tests. <a-larger-cone-of-geometric-tests.>

The companion bounds a shortcut matrix on cut vectors. For optimization we use centered positive semidefinite matrices whose squared distances satisfy triangle inequalities. This cone has polynomially many displayed constraints. Enlarging the cone strengthens the required shortcut inequality, so the companion’s cut-only statement cannot simply be applied. We extend its proof by constructing a doubled distance-profile polytope in which radii about vertex images are affine and radial motion has exactly its metric length. The underlying distance-profile isometry is classical #cite(label("Frechet1910")) #cite(label("Kuratowski1935")); the additional radial identities make the bag and charging arguments work in the new geometry.

===== 1.2.2 Continuous capacities and finite optimization. <continuous-capacities-and-finite-optimization.>

Instead of selecting edges abruptly at a resistance threshold, we assign capacities through a continuous ramp. A convex response lowers the resistance cutoff while maintaining the partition inequalities with a controlled loss in packing size. Uncrossing reduces a putative obstruction to a chain of partitions, where the geometric response applies simultaneously. Exact rational separation and a quantitative interior ball turn each response into a finite computation using the ellipsoid method #cite(label("GLS1988")). Constructive graphic matroid partition then recovers an integer packing #cite(label("Edmonds1968")) #cite(label("Terao2023")).

===== 1.2.3 Exact data and certified sparsification. <exact-data-and-certified-sparsification.>

A log-determinant normalization, following the variational method behind radial isotropic position #cite(label("Barthe1998")) Section 2.2, gives the second vector representation. We approximate the stacked vectors rationally, complete their covariance exactly to the identity, and apply constructive matrix signing. This step builds on the Kadison–Singer partition theorem of Marcus, Spielman, and Srivastava #cite(label("MarcusSpielmanSrivastava2015")) and the public rank-one discrepancy method of Ezeunala and Jiang #cite(label("EzeunalaJiang2026")); the exact interface and the constant used are proved in Appendix 8. Rational matrix certificates imply every cut and packing estimate needed for the next step. The product of the multiplicative losses remains bounded through the iteration. A separate truncation and rounding reduction handles binary multiplicities before any edge expansion: it produces a graph with polynomially many explicit copies, independently of the numerical values of the multiplicities and $k$. The final tree lifts to original edge copies.

===== 1.2.4 Organization. <organization.>

Section 2 proves the metric-cone hierarchy estimate and its simultaneous response to a partition chain. Section 3 constructs a rational shortcut and a large packing of low-resistance edges. Section 4 builds the rank-preserving frame. Section 5 provides exact rational padding and signing certificates. Section 6 combines the two representations, iterates the sparsification, and proves the binary-multiplicity reduction. Section 7 records a simultaneous cost-and-cut rounding consequence for rational fractional inputs. Appendix 8 gives the quantitative rational implementation of the public rank-one signing method.

== 2 Metric-cone shortcuts for thin trees <tg:section>

We next develop the geometric input to the thin-tree algorithm. The shortcut theorem of the companion #cite(label("ThinTreesCompanion")) tests a matrix on cuts. Convex optimization in the next section will use a larger, finitely described cone of tests. We establish the corresponding hierarchy estimate by extending its complete geometric arguments, which follow the hierarchy and effective-resistance framework of Anari and Oveis Gharan #cite(label("AnariOveisGharan2015")) Sections 5–7.

Throughout this section graphs are finite loopless multigraphs on a vertex set $V$, with $n = \| V \| gt.eq 2$; edge sets retain multiplicities. All symmetric matrices act on the Euclidean space $sans(E) = upright(bold(1))^perp subset bb(R)^V$. Equivalently, they are centered full matrices, with their zero action on $"span" { upright(bold(1)) }$ understood. Write $I_(sans(E))$ for the identity on this space, $b_(u v) = e_u - e_v$, and $L_G = sum_(e in E \( G \)) b_e b_e^T$, using arbitrary edge orientations. Matrix pairings are $chevron.l A \, Z chevron.r = "tr" \( A Z \)$. Define the closed convex cone

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(N) = {Z succ.curly.eq 0 : b_(u w)^T Z b_(u w) lt.eq b_(u v)^T Z b_(u v) + b_(v w)^T Z b_(v w) quad \( u \, v \, w in V \)} . $ <tg:test-cone>]

Its trace-dual cone is $cal(N)^(*) = { A : chevron.l A \, Z chevron.r gt.eq 0 upright(" for all ") Z in cal(N) }$. The Gram-matrix representation of squared Euclidean distances is classical #cite(label("Schoenberg1935")); the additional triangle inequalities give the standard $ell_2^2$ metric relaxation #cite(label("AroraRaoVazirani2009")) Section 2. For $Z in cal(N)$, the numbers $d \( u \, v \) = b_(u v)^T Z b_(u v)$ form a squared Euclidean pseudometric. The centered identity belongs to $cal(N)$. So does $c_S c_S^T$, where $c_S = upright(bold(1))_S - \( \| S \| \/ n \) upright(bold(1))$: its squared distances are precisely the $0$–$1$ cut metric of $S$.

A #emph[hierarchy] is a rooted tree of distinct nonempty subsets of $V$, with root $V$, singleton leaves, and children partitioning their parent into at least two sets. For a nonroot node $A$, with parent $A^(*)$, set

$ P \( A \) = delta_G \( A \) \, #h(2em) O \( A \) = E_G \( A \, A^(*) \\ A \) . $

The hierarchy is #emph[locally $h$-connected] if every $G \[ A \]$ is $h$-edge-connected, with the singleton condition vacuous. Each $\| O \( A \) \| gt.eq h$. Each graph edge belongs to exactly two parent boundaries: those of the two children of its endpoints’ least common ancestor. In particular its multiplicity in any selected collection of parent boundaries is at most two.

#thm([Theorem 2.1.])[
  (Hierarchy bound for the metric test cone).  #emph[There is an absolute integer $h_0$ such that, for every integer $h gt.eq h_0$, every locally $h$-connected hierarchy of $G$, and every collection $cal(M)$ of nonroot nodes satisfying $\| O \( A \) \| gt.eq \| P \( A \) \| \/ h$, there is a matrix $D succ 0$ on $sans(E)$ with 
#[#set math.equation(numbering: n => "(2.2)")
 $ chevron.l D \, Z chevron.r & lt.eq chevron.l L_G \, Z chevron.r &  & \( Z in cal(N) \) \,\
frac(1, \| O \( A \) \|) sum_(e in O \( A \)) b_e^T D^(- 1) b_e & lt.eq h^(- 31 \/ 40) &  & \( A in cal(M) \) . $ <tg:shortcut>]

 The cutoff is independent of the graph and the hierarchy depth.]
] <thm:tg-hierarchy>

The proof first expresses the shortcut objective as a ratio whose denominator is total edge length. We then represent its numerator by collections of disjoint balls and charge their radii to edge lengths; the resulting estimate will give simultaneous responses to partition chains.

=== 2.1 The conic dual <the-conic-dual>

#thm([Lemma 2.2.])[
  (A geometric upper bound for the shortcut program).  #emph[Let $G$ be connected and $cal(M)$ a nonempty finite collection of nonroot nodes with nonempty parent boundaries. Let $p_(*)$ be the infimum, over $D succ 0$ satisfying (2.2), of the largest marked average resistance. Then 
#[#set math.equation(numbering: n => "(2.3)")
 $ p_(*) lt.eq sup_(p \, U) frac(sum_(A in cal(M)) frac(1, \| O \( A \) \|) (sum_(e = u v in O \( A \)) a_e)^2, sum_(e = u v in E \( G \)) d \( u \, v \)) \, #h(2em) a_e = \| chevron.l u_e \, p_u - p_v chevron.r \| . $ <tg:dual-ratio>]

 Here $p_v$ are Euclidean points whose squared distances $d \( u \, v \) = ∥p_u - p_v∥_2^2$ satisfy the triangle inequalities, the denominator is positive, and $U$ has orthonormal rows $u_e^T$. The Euclidean dimension may be enlarged.]
] <tg:dual>

#proof[
  Put $A_A = \| O \( A \) \|^(- 1) sum_(e in O \( A \)) b_e b_e^T$ and $f_A \( D \) = "tr" \( A_A D^(- 1) \)$. These functions are convex, since
  $ b^T D^(- 1) b = sup_x \( 2 b^T x - x^T D x \) . $
  The conic constraint is $L_G - D in cal(N)^(*)$. Choose $D_0 = delta I_(sans(E))$ with $0 < delta < lambda_min \( L_G \|_(sans(E)) \)$. Then $L_G - D_0 succ 0$ lies in the interior of $cal(N)^(*)$, because the positive semidefinite cone is contained in $cal(N)^(*)$. Taking an epigraph height above all $f_A \( D_0 \)$ makes the other inequalities strict as well.
  For completeness, finite-dimensional separation gives the needed strong duality even if the infimum is not attained. Separate $\( 0 \, 0 \, p_(*) \)$ from the open convex set of $\( a \, M \, z \)$ for which some $D succ 0$ and $t in bb(R)$ satisfy
  $ f_A \( D \) - t < a_A \, #h(2em) M - D + L_G in "int" cal(N)^(*) \, #h(2em) t < z . $
  Monotonicity in the three coordinates makes the separating coefficients $\( lambda \, Z \, gamma \)$ satisfy $lambda gt.eq 0$, $Z in cal(N)$, and $gamma gt.eq 0$. The strictly feasible point just constructed rules out $gamma = 0$: one may take all $a_A < 0$ and $M$ in $- "int" cal(N)^(*)$, making the pairing strictly negative for every nonzero $\( lambda \, Z \)$. Normalize $gamma = 1$. The unrestricted variable $t$ then forces $sum_A lambda_A = 1$. Taking limits to the boundary of the open set, and using weak duality for the reverse inequality, gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ p_(*) = sup_(lambda gt.eq 0 \, med sum_A lambda_A = 1\
Z in cal(N)) [inf_(D succ 0) { "tr" \( A \( lambda \) D^(- 1) \) + "tr" \( Z D \) } - "tr" \( Z L_G \)] \, quad A \( lambda \) = sum_A lambda_A A_A . $ <tg:lagrange>]
  For any $A \, Z succ.curly.eq 0$,
  #[#set math.equation(numbering: n => "(2.5)")
   $ inf_(D succ 0) { "tr" \( A D^(- 1) \) + "tr" \( Z D \) } = 2 "tr" #scale(x: 120%, y: 120%)[\(] \( Z^(1 \/ 2) A Z^(1 \/ 2) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <tg:matrix-infimum>]
  When $A \, Z succ 0$, set $H = Z^(1 \/ 2) D Z^(1 \/ 2)$ and $C = Z^(1 \/ 2) A Z^(1 \/ 2)$. The objective minus $2 "tr" \( C^(1 \/ 2) \)$ is $∥H^(- 1 \/ 2) C^(1 \/ 2) - H^(1 \/ 2)∥_(upright(F))^2$, and vanishes at $H = C^(1 \/ 2)$. For singular $A$ or $Z$, add $eta I_(sans(E))$ to both. The positive definite identity at each fixed $D$, followed by $eta arrow.b 0$, proves the lower bound. The unperturbed infimum is at most the perturbed infimum, whose limit gives the upper bound. These are auxiliary perturbations for the identity, not extra dual feasibility assumptions.
  For $Z eq.not 0$ in $cal(N)$, connectivity gives $cal(E) = "tr" \( L_G Z \) > 0$. Writing $N_0 = "tr" \( \( Z^(1 \/ 2) A \( lambda \) Z^(1 \/ 2) \)^(1 \/ 2) \)$, optimization over the scale $tau Z$ gives
  $ sup_(tau gt.eq 0) \( 2 sqrt(tau) N_0 - tau cal(E) \) = N_0^2 \/ cal(E) . $
  The zero multiplier contributes zero. Represent $Z$ as the centered Gram matrix of points $p_v$, and put
  $ w_e = sum_(A : e in O \( A \)) frac(lambda_A, \| O \( A \) \|) . $
  Then $N_0$ is the nuclear norm of the matrix with columns $sqrt(w_e) \( p_u - p_v \)$. The singular value decomposition, after adding zero coordinates if needed, gives
  $ N_0 = max_(U U^T = I) sum_e sqrt(w_e) chevron.l u_e \, p_u - p_v chevron.r . $
  Changing individual row signs preserves row orthonormality, so take the displayed contributions nonnegative. For such a maximizing $U$,
  $ N_0 & lt.eq sum_A sqrt(frac(lambda_A, \| O \( A \) \|)) sum_(e in O \( A \)) a_e \,\
N_0^2 & lt.eq sum_A frac(1, \| O \( A \) \|) (sum_(e in O \( A \)) a_e)^2 . $
  The first line uses $sqrt(sum_j x_j) lt.eq sum_j sqrt(x_j)$ and the second uses $sum_A lambda_A = 1$. Overlapping boundaries are allowed. Substitution into (2.4) proves the claim. ◻
]

=== 2.2 A convex realization with exact radial motion <a-convex-realization-with-exact-radial-motion>

Starting from the classical distance-profile isometry into $ell_oo$ #cite(label("Frechet1910")) #cite(label("Kuratowski1935")), we construct a continuous geometry for an arbitrary finite metric. It will be used for balls and shells; the Euclidean points $p_v$ remain the inputs to the spectral argument. 1 contrasts the Euclidean spectral points with the distance-profile realization of the same vertex labels and illustrates the exact radial motion of 4.

#thm([Lemma 2.3.])[
  (Doubled distance profiles).  #emph[Every finite metric $\( S \, d \)$ has an isometric realization $x mapsto c_x$ in a convex polytope $Q$ in a finite-dimensional normed space with the following properties. Distance $rho_x \( q \) = ∥q - c_x∥$ is affine on $Q$. There is a common $R > 0$ and a point $c_x^(-) in Q$ such that 
#[#set math.equation(numbering: n => "(2.6)")
 $ ∥q - c_x∥ + ∥q - c_x^(-)∥ = R #h(2em) \( q in Q \) . $ <tg:opposite-radii>]

 From any $q in Q$ one can reach every radial value in $\[ 0 \, R \]$ by moving toward $c_x$ or $c_x^(-)$, and the change in radius equals the distance moved. Every straight segment in $Q$ has its norm length, and clamped radial functions are piecewise affine on it.]
] <tg:profiles>

#proof[
  Take $R > 2 max_(x \, y) d \( x \, y \)$ and two copies $x^(+) \, x^(-)$ of each point. On the doubled set define
  $ hat(d) \( x^(+) \, y^(+) \) = hat(d) \( x^(-) \, y^(-) \) = d \( x \, y \) \, #h(2em) hat(d) \( x^(+) \, y^(-) \) = R - d \( x \, y \) . $
  This is a metric. A triangle with all signs equal is an original triangle. A triangle with two equal signs has two cross-copy sides; an inequality with a cross-copy side on the left reduces to an original triangle inequality. The remaining inequality follows from $d \( x \, y \) + d \( x \, z \) + d \( z \, y \) lt.eq 3 "diam" \( d \) < 2 R$.
  For a doubled point $a$, let $c_a = \( hat(d) \( a \, z \) \)_z$ be its distance profile in $ell_oo$, and set $Q = "conv" { c_a }$. The triangle inequality and coordinate $a$ show $∥c_a - c_b∥_oo = hat(d) \( a \, b \)$. More generally, for $q = sum_b theta_b c_b$,
  #[#set math.equation(numbering: n => "(2.7)")
   $ ∥q - c_a∥_oo = sum_b theta_b hat(d) \( a \, b \) = q_a \, #h(2em) theta_b gt.eq 0 \, quad sum_b theta_b = 1 . $ <tg:affine-radius>]
  Indeed, convexity of the norm gives the upper bound, and coordinate $a$ gives the lower bound. Thus the radius is the restriction of a linear coordinate function, independently of the representation of $q$. Set $c_x = c_(x^(+))$ and $c_x^(-) = c_(x^(-))$. The identity $hat(d) \( x^(+) \, b \) + hat(d) \( x^(-) \, b \) = R$ for every doubled point $b$ proves (2.6).
  If $rho = rho_x \( q \)$, the segment $q_t = \( 1 - t \) q + t c_x$ has $∥q_t - q∥ = t rho$ and $rho_x \( q_t \) = \( 1 - t \) rho$. The segment $q_t^(-) = \( 1 - t \) q + t c_x^(-)$ has $∥q_t^(-) - q∥ = t \( R - rho \)$ and $rho_x \( q_t^(-) \) = rho + t \( R - rho \)$. These formulas prove the exact-motion assertion, including the endpoint cases. Convexity of $Q$ keeps all segments in $Q$; the final assertion follows from (2.7) and clamping. ◻
]

For a pseudometric, first identify zero-distance points to apply 4. This identification concerns only the geometric point set. Every graph vertex, edge copy, hierarchy node, and center-vertex label is retained. In particular coincident vertex images do not contract the graph.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.7, 2.6), [Two realizations of the vertex labels])
  content((2.7, 1.55), [#box(width: 4.5cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$p_v$ and $Y_v="Up"_v$ in Euclidean space#linebreak() $ Y_u-Y_v "rVert"_2^2 lt.eq d(u,v)$]]])])
  content((2.7, -0.2), [#box(width: 4.5cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$c_v$ in the profile polytope $Q$#linebreak() $ c_u-c_v "rVert"_ infinity =d(u,v)$]]])])
  line((2.7, 1.029), (2.7, 0.3214), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.7, 0.675), [#text(size: 8pt)[selected vertex labels]], anchor: "west", padding: 0.1176cm)
  content((10.2, 2.6), [Exact radial motion in $Q$])
  line((10.2, -0.2), (7.6, 1.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((10.2, -0.2), (12.8, 1.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((7.6, 1.3), radius: 0.07056, fill: black, stroke: none)
  circle((10.2, -0.2), radius: 0.07056, fill: black, stroke: none)
  circle((12.8, 1.3), radius: 0.07056, fill: black, stroke: none)
  content((7.6, 1.48), [#text(size: 8pt)[$c_x$#linebreak()radius $0$]], anchor: "south", padding: 0.1176cm)
  content((12.8, 1.48), [#text(size: 8pt)[$c_x^-$#linebreak()radius $R$]], anchor: "south", padding: 0.1176cm)
  content((8.55, 0.03), [#text(size: 8pt)[move inward#linebreak()length $rho$]], anchor: "north", padding: 0.1176cm)
  content((11.85, 0.03), [#text(size: 8pt)[move outward#linebreak()length $R- rho$]], anchor: "north", padding: 0.1176cm)
  content((10.2, -0.4), [#text(size: 8pt)[$q$#linebreak()radius $rho$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Spectral packing uses Euclidean points; balls and shells use the distance-profile realization with the same vertex labels. The radial paths are schematic: in the ambient norm, distance traveled along either indicated segment equals change of radius. The two segments need not form one straight segment in $Q$. ],
) <tg:geometry-figure>

=== 2.3 Transferring the bag and charging estimates <transferring-the-bag-and-charging-estimates>

The next lemma extends the bag-selection and shell-charging arguments of #cite(label("ThinTreesCompanion")) Propositions B.7, B.8, and B.10 to $Q$. We retain those constructions and their scalar accounting, but verify the geometric steps below: their stated cube hypotheses do not cover all tests in $cal(N)$. The two charging alternatives explain the division into compact and assigned bags. Compact bags charge disjoint geometric objects. Assigned bags may overlap geometrically, provided their hierarchy labels separate the graph edges used for charging.

Use relative open balls $B \( c \, delta \) = { q in Q : ∥q - c∥ < delta }$ and strict shells $B \( c \; a \, b \) = { q in Q : a < ∥q - c∥ < b }$. An ordinary ball includes its center, whereas a shell with $a = 0$ excludes it. Both are called radial objects. An ordinary ball $B \( c \, b \)$ has #emph[numerical] inner radius $a = 0$ and width $b$; a shell has width $b - a$. All radial tests and width formulas below apply to both types with these numerical radii, but membership and intersection always use the actual support. In particular, an unchanged ordinary ball keeps its center. A radial restriction to $a lt.eq a' < b' lt.eq b$ means replacement by the strict shell $B \( c \; a' \, b' \)$, even when $a' = 0$. Such a replacement is a subset of the old support; it is an operation, not an identification of a ball with a punctured shell. Proposed intervals of nonpositive width are discarded. A #emph[bag] consists of mutually disjoint balls of a common radius $delta$, centered at vertex images $c_v$. It is #emph[$beta$-compact of type $\( delta \, Delta \)$] if it has at least two balls, its center diameter is at most $Delta$, and $beta Delta lt.eq delta \| upright("Bag") \|$. It is #emph[$eta$-assigned to $A$] if $\| upright("Bag") \| gt.eq eta \| O \( A \) \|$ and every ball has a designated center vertex $u in A$ with an edge $u v in O \( A \)$ of length $d \( u \, v \) < delta$. A family has all its balls mutually disjoint and a common radius. A compact family has a common type $\( delta \, Delta \)$. An assigned family has one bag for each of a set of distinct assigned nodes. Bags assigned to the same node at one scale may always be merged: this preserves every witnessing edge, the assignment bound, and the total mass. Fix $0 < rho < 1$. A sequence of compact families is $rho$-geometric when $Delta_(i + 1) < rho delta_i$; a sequence of assigned families is $rho$-geometric when $delta_(i + 1) < rho delta_i$ and its assigned nodes are distinct across families. In either case its mass is

$ sans(M) = sum_i delta_i sum_(upright("Bag") in cal(F)_i) \| upright("Bag") \| . $

#thm([Lemma 2.4.])[
  (Geometric transfer).  #emph[Let $p_v in bb(R)^(d_(upright(E)))$ be points for which $d \( u \, v \) = ∥p_u - p_v∥_2^2$ is a pseudometric. Realize $d$ in $Q$ as in 4. Let $U : bb(R)^(d_(upright(E))) arrow.r bb(R)^(E \( G \))$ be a contraction, change its row signs so $a_e = chevron.l u_e \, p_u - p_v chevron.r gt.eq 0$, and set 
$ d_e = d \( u \, v \) \, #h(2em) N_A = frac(\( sum_(e in O \( A \)) a_e \)^2, \| O \( A \) \|) \, #h(2em) cal(E) = sum_(e in E \( G \)) d_e . $

 The following three assertions hold in $Q$.]
  + #emph[ Let $T$ be a nonempty set of nodes with $N_A > 0$ and $N_A gt.eq alpha sum_(e in O \( A \)) d_e$, where $0 < alpha lt.eq 1$. Define 
$ J & = 1 + ceil.l log_2 \( 256 \/ alpha^2 \) ceil.r \, & C_2 & = 128 J^4 \, & sigma & = alpha \/ C_2 \,\
L & = 2 + ceil.l log_2 \( 1 \/ sigma \) ceil.r \, & H_0 & = 1 + ceil.l log_2 \( 24 \/ \( rho sigma^2 \) \) ceil.r \, & C_1 & = 1024 epsilon.alt^(- 2) . $

 If $beta > 1$, $0 < epsilon.alt < 1 \/ 3$, $0 < rho < 1$, and $sigma^epsilon.alt lt.eq \( 48 beta C_1 \)^(- 1)$, there is a $rho$-geometric sequence consisting either of $beta$-compact families or of $sigma^(1 + 2 epsilon.alt)$-assigned families, with 
#[#set math.equation(numbering: n => "(2.8)")
 $ sans(M) gt.eq frac(sigma^epsilon.alt, 384 beta C_1 C_2 L H_0) sum_(A in T) N_A . $ <tg:captured-mass>]

]
  + #emph[ For $G$ $k$-edge-connected, a $rho$-geometric sequence of $beta$-compact families with $rho lt.eq 1 \/ 12$ and $beta gt.eq 36$ satisfies $cal(E) gt.eq \( k \/ 4 \) sans(M)$.]
  + #emph[ For a locally $k$-connected hierarchy, selected nodes satisfying $\| O \( A \) \| gt.eq k rho \| P \( A \) \|$, and a $rho$-geometric sequence of $\( 24 C_3 \/ k \)$-assigned families, one has 
#[#set math.equation(numbering: n => "(2.9)")
 $ cal(E) gt.eq frac(k C_4, 96 C_3) sans(M) $ <tg:assigned-charge>]

 provided $C_4 gt.eq 3$, $rho lt.eq \( 6 C_4 \)^(- 1)$, and $C_3 gt.eq 2 \( \( C_4 + 1 \) + 4 \( C_4 + 2 \)^2 \)$.]
] <tg:transfer>

#proof[
  We follow the constructions in Sections B.2–B.4 of #cite(label("ThinTreesCompanion")), keeping their scale choices and scalar potentials. All balls, shells, and intersections now lie in the continuous polytope $Q$. New shells inherit vertex centers, so (2.7) remains available. We first obtain the bags, then explain how each of the two charging constructions operates in this realization.
  #emph[Extraction and the spectral step.] The two truncations and homogeneity arguments in #cite(label("ThinTreesCompanion")) Section B.2.2 use only $a_e^2 lt.eq d_e$, nonnegative boundary sums, and multiplicity at most two. They select nonempty subsets $O' \( A \) subset.eq O \( A \)$ retaining a fixed fraction of each squared boundary sum, and group the nodes so that both positive quantities $a_e^2$ and $d_e$ vary by a factor less than four within $F = union.big_A O' \( A \)$. For one such group put $N = sum_A \| O \( A \) \|$, $N' = \| F \|$, $c_1 = min_(e in F) a_e^2$, and $c_2 = max_(e in F) d_e$. The truncation and grouping estimates give $c_1 N' gt.eq sigma N c_2$. For the Euclidean points $Y_v = U p_v$ and $tilde(alpha) = sigma N \/ N'$ this implies
  $ \( bb(E)_(e in F) a_e \)^2 gt.eq c_1 gt.eq accent(alpha c, ̃)_2 gt.eq tilde(alpha) bb(E)_(e in F) ∥Y_u - Y_v∥_2^2 . $
  This is the exact hypothesis of the Euclidean spectral-packing Lemma B.3 of #cite(label("ThinTreesCompanion")); that lemma places no binary restriction on its points. Its selected centers have squared Euclidean separation at least $4 r$. Since
  #[#set math.equation(numbering: n => "(2.10)")
   $ ∥Y_u - Y_v∥_2^2 lt.eq d \( u \, v \) = ∥c_u - c_v∥_oo \, $ <tg:spectral-to-metric>]
  the corresponding $Q$-balls of radius $r$ are disjoint. If $b_0$ is their number, the spectral lemma gives $b_0 r gt.eq tilde(alpha)^epsilon.alt c_1 N' \/ C_1$. Shrink their common radius to $delta$ defined by $b_0 delta = tilde(alpha)^epsilon.alt c_1 N' \/ C_1$. Only the selected vertex labels pass from the Euclidean geometry to $Q$; a map on intermediate points is unnecessary.
  The rest of the one-family construction uses a maximal disjoint collection of balls of radius $D = max { delta \, 2 c_2 }$, centered at images $c_u$ for which $u in A$ and $u v in O' \( A \)$ for some $A$. Maximality puts every candidate center within $2 D$ of a selected center: intersection of two relative balls implies this distance bound by the triangle inequality. Every endpoint center is within $c_2$ of an assigned endpoint, hence within $3 D$ of a selected center. Grouping by those centers gives diameter at most $6 D$ in the compact case. In the assigned case the witnessing edge has length at most $c_2 < D$. The cardinality estimates of #cite(label("ThinTreesCompanion")) Lemma B.6 give compactness, assignment strength, and radius range $\[ sigma c_1 \, 12 c_1 \/ sigma \]$. Its final grouping by dyadic size and then by residue class modulo $H_0$ is numerical: each scale lies between $sigma 2^j$ and $24 thin 2^j \/ sigma$, so scales in the same residue class meet the stated geometric separation. The losses $C_2$, $L$, $2 H_0$, and $192 beta C_1 \/ sigma^epsilon.alt$ are exactly those in (2.8). This proves (i).
  #emph[Length charging and compact radial objects.] The resource charged by both arguments is one fixed straight segment $\[ c_u \, c_v \]$ of length $d_e$ for each graph edge, retaining parallel edges as separate resources. For a radial object with numerical radii $a < b$, its clamped radial function is $f \( q \) = min { b \, max { a \, ∥q - c∥ } }$. It is $1$-Lipschitz and piecewise affine on each edge segment. If the object has vertex witnesses at radius at most $a$ and at least $b$, all its intermediate radial cuts are nontrivial. Consequently
  $ k \( b - a \) lt.eq integral_a^b \| delta_G { v : ∥c_v - c∥ < t } \| thin d t = sum_(u v in E \( G \)) \| f \( c_u \) - f \( c_v \) \| . $
  For disjoint radial objects, subdivide an edge segment at the finitely many breakpoints of these functions. At most one clamped function is nonconstant on each open subsegment, and its variation is bounded by that subsegment’s length. The total charge is therefore at most $d_e$, including edges along a boundary or of zero length. This proves the length bound of #cite(label("ThinTreesCompanion")) Lemma B.9 in $Q$. For an ordinary ball, nonconstant portions of the clamped function lie at strictly positive radius. Its center contributes no charged length, but remains part of the ball in membership tests.
  For compact bags, process the families in decreasing order of radius, as in #cite(label("ThinTreesCompanion")) Proposition B.8. An input ball inserted at the current scale is called fresh and is left intact until the next scale; all other live objects are called old. Thus a fresh ordinary ball becomes an old ordinary ball at the next scale unless a subsequent operation restricts it. Disjoint equal-radius balls have centers separated by at least $2 delta$, since their midpoint belongs to $Q$. For any live object with center $c$ and numerical radii $a \, b$, call $B \( c_u \, delta \)$ interior when
  $ a + delta + Delta lt.eq ∥c_u - c∥ lt.eq b - delta - Delta . $
  This conservative two-sided test also applies when the object is an ordinary ball, with $a = 0$. If one ball of a compact bag is interior, its containing object is old, since fresh balls and unprocessed balls belong to the same disjoint family. All bag centers have radial values in an interval $\[ l \, u \] subset.eq \[ a + delta \, b - delta \]$ of width at most $Delta$. Replacing the old object by the strict shells with intervals $\( a \, l - delta \)$ and $\( u + delta \, b \)$ leaves room for all the new balls, including when the old object was ordinary. The extremal centers supply the new outer and inner witnesses; the previous witnesses supply the other two. Every inserted ball has its own center and a different bag center as witnesses. All supports are disjoint by $1$-Lipschitzness of radius. When no interior bag remains, shrinking each old interval at both ends by $2 delta + Delta$ separates it from every remaining ball. Indeed, failure at the lower margin puts the entire candidate at radius less than $a + 2 delta + Delta$, and failure at the upper margin puts it beyond $b - 2 delta - Delta$. This includes candidates near the center of an old ordinary ball: the shrink removes that center neighborhood. Witnesses are preserved because the inner radius increases and the outer radius decreases; an inner witness need not belong to the remaining strict shell. The capacities $\[ w - 6 Delta_i \]_(+)$ for all old objects and $delta_i - 6 Delta_(i + 1)$ for fresh balls depend only on widths and the inequalities $2 delta_i lt.eq Delta_i$, $6 Delta_(i + 1) lt.eq delta_i \/ 2$, and $\| upright("Bag") \| delta_i gt.eq 36 Delta_i$, all verified here. The split loses numerical width $\( u - l \) + 2 delta$, and the shrink loses $2 \( 2 delta + Delta \)$, with the same positive-part accounting when a residual is discarded. Removing the center alone adds no width loss. A retained fresh ball has the same capacity after becoming old. Thus the split and scale-transition inequalities in the cited proof retain at least one quarter of the input mass as final radial-object width. Applying the preceding length bound proves (ii).
  #emph[Assigned labels, pruning, and path charging.] Assigned bags require the labeled records of #cite(label("ThinTreesCompanion")) Section B.4.1. We give their definitions because geometric overlap is allowed. Write $cal(T) \[ A \]$ for the hierarchy subtree rooted at $A$, identifying its leaves with the vertices in $A$. A record $H$ has an ordinary ball or shell as its support, an owner $A_H$, a set $cal(P)_H$ of strict descendants of $A_H$, and optionally one avoided strict descendant $D_H$. Define its conflict domain and leaf set by
  $ C \( H \) = cal(T) \[ A_H \] \\ (union.big_(P in cal(P)_H) cal(T) \[ P \] med union med cal(T) \[ D_H \]) \, #h(2em) L \( H \) = C \( H \) ∩ V \, $
  omitting the final subtree when there is no avoided label. The record is called avoiding precisely when $D_H$ is present. For center $c$ and numerical radii $a < b$, validity means:
  + the labels have the stated form, so $A_H in C \( H \)$;
  + both endpoints of every edge of $delta_G \( P \)$, for every $P in cal(P)_H$, have radius at least $b$ from $c$;
  + some $u in L \( H \)$ has radius at most $a$ and starts at least $k \/ 4$ edge-disjoint paths to vertices of radius at least $b$. These paths lie in $G \[ A_H \]$, or in $G \[ A_H \\ D_H \]$ for an avoiding record;
  + geometrically intersecting records have disjoint conflict domains.
  The initial paths in (c) need not avoid the predecessor subtrees in $cal(P)_H$; condition (b) will remove those subtrees from the portions used for charging. Its inner witness is a graph vertex in $L \( H \)$, not necessarily a point of the support: for a strict shell it can lie on or inside the excluded inner boundary.
  For a node $A$ assigned at scale $delta_i$, its predecessors are the strict descendants assigned at earlier, larger scales. An input ball is noninsertable if it contains an endpoint of a boundary edge of any predecessor. Otherwise give it owner $A$, no avoided label, and excluded set equal to the predecessors.
  At one scale, disjoint center-inclusive balls contain at most $2 \| P \( A \) \|$ endpoint vertices of $P \( A \)$. Thus a predecessor $A$, whose own scale is $delta_i$, deletes mass at most $4 rho delta_i \| P \( A \) \|$, which the boundary ratio and assignment bound pay as in the source’s Lemma B.13. Deleting noninsertable balls and bags losing more than half their balls retains mass at least $sans(M) \/ 2$ and assignment at least $12 C_3 \/ k$. Insertability puts the designated center vertex in its conflict domain: otherwise its witnessing edge in $O \( A \)$ would be a forbidden predecessor-boundary edge whose endpoint lies in the ball. Another ball of the bag supplies an outer vertex; local connectivity supplies the required paths. The retained bag has more than one ball, since $\| O \( A \) \| gt.eq k$ and its assignment is at least $12 C_3 \/ k$. Thus the resulting input records satisfy (a)–(c), including when distinct vertices have coincident images.
  For a valid collection, stop each witnessing graph path at its first outer vertex. It cannot enter an excluded predecessor subtree earlier, because the entering edge would have an endpoint inside the outer radius. On the resulting continuous path keep the portion from the last inner-radius point to the first outer-radius point. Its length is at least the record’s numerical width by $1$-Lipschitzness. Apart from endpoints it lies in $a < ∥q - c∥ < b$, which is contained in either type of support. For an ordinary ball $a = 0$ and the center carries no charged length. Paths within one record are edge-disjoint. Both endpoints of every edge in a stopped path belong to $L \( H \)$: an entrance into an excluded subtree, even at the stopping vertex, would have a preceding endpoint inside the outer radius, contradicting (b). Two records charging the same graph edge therefore have intersecting conflict domains, so (d) makes their actual supports disjoint and they charge disjoint open portions of that edge. This proves the source’s Lemma B.14 in $Q$, at rate $k \/ 4$.
  It remains to construct a valid arrangement with enough total width. Start with the empty arrangement and process scales in decreasing order and, within each scale, bags in increasing depth of their assigned nodes. As in the compact construction, original balls inserted during the current phase are fresh and remain intact until the next phase; all other records are old. A candidate $J = B \( c_u \, delta_i \)$ is interior to a current record $H$ with center $c$ and numerical radii $a \, b$ when
  $ C \( J \) ∩ C \( H \) eq.not diameter \, #h(2em) a + C_3 delta_i < ∥c_u - c∥ < b - C_3 delta_i . $
  A candidate interior to no current record is called a border candidate. In particular old ordinary balls participate in this test with $a = 0$, including its lower margin. A record containing an interior candidate has width greater than $2 C_3 delta_i$, so it cannot be a fresh ball of width $delta_i$. An interior candidate is contained in $H$. The processing order implies that the owner of any conflicting current record is an ancestor of the candidate’s owner $A$, and that $A in C \( H \)$. Two conflicting records therefore cannot both contain this candidate, by (d). The strict concentric restrictions defined above retain (a)–(c) with the old labels: the old inner witness still has radius at most the new inner radius, and the old paths still reach the smaller outer radius. This remains true when an ordinary ball is replaced by a shell and its center witness no longer lies in the support. Restricting both support and conflict domain preserves (d). Discard any proposed radial interval of nonpositive width. Such restrictions cannot turn a border candidate into an interior candidate. These are the order and inheritance properties of #cite(label("ThinTreesCompanion")) Lemmas B.17–B.20.
  #emph[Meeting a record and carving its interior.] The following consequence of 4 identifies the record affected by a carving operation. If a live record $H$ with center $c$ and numerical radii $r_1 < r_2$, and a vertex center $z$, satisfy
  $ r_1 - delta < ∥z - c∥ < r_2 + delta \, $
  then $B \( z \, delta \)$ meets the actual support of $H$. Choose a radius in $\( r_1 \, r_2 \)$ less than $delta$ away from $∥z - c∥$ and use the exact inward or outward motion to reach it. Its traveled distance is less than $delta$. There is no radius-range obstruction: condition (c) provides an outer vertex witness, so $r_2 lt.eq "diam" \( d \) < R$. For an ordinary ball $r_1 = 0$; the chosen radius is positive and belongs to that ball, even when $z = c$ and outward motion is needed. This replaces motion toward the binary center or its opposite cube vertex in #cite(label("ThinTreesCompanion")) Section B.4.3.
  At scale $delta$, process the interior candidates of a bag assigned to $A$ while at least half its original balls remain interior and untreated. Candidates that cease to be interior are kept as border candidates. Carving an avoiding shell around an interior candidate replaces its radial interval $\( r_1 \, r_2 \)$ by $\( r_1 \, q - delta \)$ and $\( q + delta \, r_2 \)$, and inserts the candidate. Here $q$ is its center’s radius from the shell center. Every avoiding record is indeed a strict shell: input records are nonavoiding, only the central shell $H_4$ below introduces an avoided label, and later restrictions are strict shells. Radial Lipschitzness gives disjointness; witnesses and labels survive in the restrictions. If no remaining interior candidate belongs to an avoiding shell, the other two operations first split $G \[ A^(*) \\ A \]$ into $j lt.eq 2 \| O \( A \) \| \/ k$ induced subgraphs that are $k \/ 4$-edge-connected. This count follows by successive cuts smaller than $k \/ 4$ and the $k$-connectivity of $G \[ A^(*) \]$; it is independent of the embedding. Assignment and the half-bag loop condition give one piece adjacent along edges of length less than $delta$ to at least $3 C_3$ candidate centers. Radial coordinates of these neighbors differ by less than $delta$ from those of their candidate centers.
  Choose a nonavoiding record $H$ containing one of those candidates in its interior, with center $c$ and numerical radii $r_1 \, r_2$, and write $𝜚 \( v \) = ∥c_v - c∥$. It may be an old ordinary ball, in which case $r_1 = 0$. Let $\[ a \, b \] subset.eq \[ r_1 \, r_2 \]$ be the radial range of the neighbors in the selected piece, clipped to this numerical interval. Select for treatment the $m$ still-interior candidates whose centers have radii in $\( a - delta \, b + delta \)$. Each meets the chosen record by the preceding exact-motion argument. All candidates of the bag have the same labels, so each has conflict domain meeting $C \( H \)$. If such a candidate is interior to another record $H'$, its entire ball lies in $H'$, so $H$ and $H'$ intersect. The processing-order property puts its owner $A$ in both conflict domains, contrary to (d). Thus every selected candidate is interior to $H$ itself. The radial count in the cited proof gives $m gt.eq 3 \( C_3 - 1 \)$ in the dense case below and $b - a gt.eq \( C_3 - 1 \) delta$ in the sparse case. It uses only the $3 C_3$ adjacent centers, their interior margins, and the fact that neighbor radii differ by less than $delta$.
  For the dense case, with $m delta > 3 \( b - a \)$, retain intervals $\( r_1 \, a - 2 delta \)$ and $\( b + 2 delta \, r_2 \)$ and insert the $m$ balls. The expanded radial interval and Lipschitzness give every required separation. For the sparse case $m delta lt.eq 3 \( b - a \)$, retain $\( r_1 \, a \)$ and $\( b \, r_2 \)$ and create the central shells $H_3 = B \( c \; a + delta \, b - delta \)$ and $H_4 = B \( c \; a \, b \)$. Give $H_3$ owner $A$, no avoided label, and the old excluded nodes strictly below $A$. Give $H_4$ the old owner and excluded set, and avoided label $A$. Their domains are respectively $C \( H \) ∩ cal(T) \[ A \]$ and $C \( H \) \\ cal(T) \[ A \]$. The old owner is a strict ancestor of $A$. An original ball with owner $A$ cannot come from an earlier scale, since assigned nodes are distinct across families; at the current scale it is disjoint from every unprocessed candidate. A synthetic shell with owner $A$ can only have been created while processing this same bag. It has already treated every then-interior candidate in its expanded interval; later restrictions only reduce its support, and border candidates never become interior. Hence neither an original ball nor a synthetic shell with owner $A$ can be the chosen record. Thus both new labels have the required form. For the changed-label path witnesses, extremal neighbors $v_1 \, v_2$ in the selected piece and their adjacent candidates $u_1 \, u_2 in A$ satisfy
  $ 𝜚 \( v_1 \) lt.eq a \, quad 𝜚 \( v_2 \) gt.eq b \, #h(2em) 𝜚 \( u_1 \) < a + delta \, quad 𝜚 \( u_2 \) > b - delta . $
  Connectivity of $G \[ A \]$ supplies $k$ paths for the inner central shell; connectivity of the selected piece supplies at least $k \/ 4$ paths for the avoiding shell. Their initial vertices avoid excluded subtrees: membership in one would make the short edge $u_1 v_1$ an excluded boundary edge with an endpoint inside the old outer radius, or make that excluded subtree an ancestor of $A$, contradicting $A$’s conflict membership. The sparse-case width bound gives $a + delta < b lt.eq r_2$, so the initial vertices used here lie strictly inside the old outer radius. This verifies (c) for both new labels; (b) follows from the smaller outer radii and excluded sets. Other records inherit separation by support and conflict-domain inclusion. Remaining interior candidates have centers outside $\( a - delta \, b + delta \)$, so miss both central shells. If $a = 0$, $H_4$ excludes its center but may still use $v_1$ at radius zero as its inner witness, as condition (c) permits.
  #emph[The scalar accounting and the phase transition.] The potentials in Section B.4.3 are $delta_i - C_4 delta_(i + 1)$ for fresh balls, $\[ w - C_4 delta_i \]_(+)$ for other nonavoiding records, and the latter divided by $2 \( C_4 + 2 \)$ for avoiding records. An original ball becomes old when its phase ends and then uses the second formula with width equal to its radius; if retained unchanged, it still has its center-inclusive support. These functions use the same numerical widths and radii in $Q$. The three replacements have formal width losses $2 delta$ across the two avoiding residual shells in the first operation, $\( b - a \) + 4 delta$ across the two nonavoiding residual shells in the second, and $2 delta$ across the three nonavoiding pieces in the third. Its numerical inequalities preserve old credit and supply $C_4 delta \/ \( 6 C_3 \)$ per treated candidate, counting sparse-case candidates as treated even though their balls are not inserted. Finally, Section B.4.4 either retains every record when the gain from changing scale supplies the required border credit, or shrinks every old object, including old ordinary balls, at both ends by $\( C_3 + 1 \) delta_i$ and inserts remaining border balls when the gain is insufficient. For a conflicting old object, border status means the candidate center has radius at most $a + C_3 delta_i$ or at least $b - C_3 delta_i$. Its whole ball therefore lies below the new inner radius or above the new outer radius, respectively. This proves separation also at the center of an old ordinary ball; fresh balls are disjoint within the current family. Restrictions retain witnesses. Each old width decreases by $2 \( C_3 + 1 \) delta_i$, unless the object is discarded, while the potential threshold decreases from $C_4 delta_i$ to $C_4 delta_(i + 1)$. These are the same changes for a ball and a shell. The source’s width calculation bounds the lost potential by half the inserted mass, leaving at least $C_4 \/ \( 6 C_3 \)$ of each border ball’s radius for its node. The half-bag stopping rule leaves final width at least $C_4 \/ \( 12 C_3 \)$ times the retained mass. Combined with the pruning factor $1 \/ 2$ and the path-charging rate $k \/ 4$, this is exactly (2.9).
  Thus the inherited constructions give (i)–(iii), with the same scalar losses and with every length charge measured by $cal(E) = sum_e d_e$ in the profile realization. ◻
]

=== 2.4 Choosing parameters and responding to a partition chain <choosing-parameters-and-responding-to-a-partition-chain>

#proof[
  If $cal(M)$ is empty, a sufficiently small positive centered identity satisfies (2.2). Otherwise use 3. Fix one of its embeddings and row-orthonormal systems, with $cal(E) > 0$, and set
  $ alpha = h^(- 4 \/ 5) \, #h(2em) epsilon.alt = 1 \/ 10 \, #h(2em) beta = 36 \, #h(2em) rho = \( 2 h^2 \)^(- 1) \, #h(2em) C_3 = 10^4 \, #h(2em) C_4 = 3 . $
  Let $T$ consist of the marked nodes with positive $N_A$ and $N_A gt.eq alpha sum_(e in O \( A \)) d_e$. Boundary multiplicity at most two gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ sum_(A in cal(M) \\ T) N_A lt.eq 2 alpha cal(E) . $ <tg:good-nodes>]
  If $T$ is nonempty, apply 5(i). Its parameters obey
  $ C_2 = O \( \( 1 + log h \)^4 \) \, quad L \, H_0 = O \( 1 + log h \) \, quad sigma = h^(- 4 \/ 5) \/ C_2 . $
  The smallness condition holds for all sufficiently large absolute $h$. So does the assignment requirement, because
  $ h sigma^(1 + 2 epsilon.alt) = h^(1 \/ 25) \/ C_2^(6 \/ 5) arrow.r oo \, #h(2em) sigma^(1 + 2 epsilon.alt) gt.eq 24 C_3 \/ h . $
  The marked-node condition implies $\| O \( A \) \| gt.eq \| P \( A \) \| \/ h gt.eq h rho \| P \( A \) \|$. For large $h$, $rho lt.eq 1 \/ 18$; also $10^4 gt.eq 2 \( 4 + 4 dot.op 25 \) = 208$. Both charging conclusions of 5 therefore apply, according to the family type, and give the common bound
  $ cal(E) gt.eq c_(*) h sans(M) \, #h(2em) c_(*) = frac(C_4, 96 C_3) = 1 / 320000 . $
  Together with (2.8), this yields
  $ frac(sum_(A in T) N_A, cal(E)) lt.eq frac(384 beta C_1 C_2 L H_0, c_(*) h sigma^epsilon.alt) = O #scale(x: 120%, y: 120%)[\(] h^(- 23 \/ 25) \( 1 + log h \)^7 #scale(x: 120%, y: 120%)[\)] . $
  Indeed $sigma^epsilon.alt = h^(- 2 \/ 25) C_2^(- 1 \/ 10)$, so the exact logarithmic exponent before rounding upward is $32 \/ 5 < 7$. Including (2.11), or using it alone when $T$ is empty, every ratio in (2.3) is at most
  #[#set math.equation(numbering: n => "(2.12)")
   $ 2 h^(- 4 \/ 5) + O #scale(x: 120%, y: 120%)[\(] h^(- 23 \/ 25) \( 1 + log h \)^7 #scale(x: 120%, y: 120%)[\)] = o \( h^(- 31 \/ 40) \) . $ <tg:final-ratio>]
  The exponent margins are $1 \/ 40$ and $29 \/ 200$, respectively. Increase $h_0$ so the bound is at most $h^(- 31 \/ 40) \/ 2$. Then $p_(*) lt.eq h^(- 31 \/ 40) \/ 2$, and the defining property of the infimum supplies a feasible positive definite $D$ with marked averages less than $h^(- 31 \/ 40)$. No attainment assumption is used. ◻
]

For a fixed connected ambient graph $H$, define

#[#set math.equation(numbering: n => "(2.13)")
 $ cal(K)_H = { X succ.curly.eq L_H : chevron.l X \, Z chevron.r lt.eq 3 chevron.l L_H \, Z chevron.r quad \( Z in cal(N) \) } . $ <tg:compact-domain>]

This set is nonempty, convex, and compact. It contains $L_H$; closedness is immediate, and the test $I_(sans(E))$ bounds $"tr" X$ by $3 "tr" L_H$. For $X succ 0$ write $R_X \( e \) = b_e^T X^(- 1) b_e$. Two elementary identities used below are

#[#set math.equation(numbering: n => "(2.14)")
 $ X succ.curly.eq D succ 0 med arrow.r.double med R_X \( e \) lt.eq R_D \( e \) \, #h(2em) X succ.curly.eq t b_e b_e^T med arrow.l.r.double med t R_X \( e \) lt.eq 1 quad \( t > 0 \) . $ <tg:resistance-order>]

The first follows by inverse order, and the second by congruence with $X^(- 1 \/ 2)$ and the single nonzero eigenvalue of a rank-one matrix.

#thm([Proposition 2.5.])[
  (Simultaneous response).  #emph[Let $H$ be connected and let $G subset.eq H$ be a spanning subgraph. Let $r$ be a sufficiently large integer, put $h = floor.l r \/ 2 floor.r$, and suppose $G$ and the subgraphs induced by all parts of a nested sequence of partitions are $h$-edge-connected, with the singleton condition vacuous. If $0 < s lt.eq r^(1 \/ 4)$, there is $Y in cal(K)_H$ such that, at every partition $cal(P)$ in the sequence, all but at most $r^(- 1 \/ 3) \| E_G \( cal(P) \) \|$ crossing edges satisfy 
#[#set math.equation(numbering: n => "(2.15)")
 $ Y succ.curly.eq 6 s thin b_e b_e^T . $ <tg:response-edge>]

 Here $E_G \( cal(P) \)$ denotes the edges whose endpoints lie in different parts of $cal(P)$.]
] <prop:tg-response>

#proof[
  Use the dyadic assembly of #cite(label("ThinTreesCompanion")) Lemma 4.2, with the hierarchy estimate and threshold just proved; we give the counting argument to specify both constants. In each occupied bin $2^a lt.eq \| E_G \( cal(P) \) \| < 2^(a + 1)$ choose the finest partition. List these representatives from fine to coarse as $cal(P)_0 \, dots.h \, cal(P)_(ell - 1)$, and append $cal(P)_ell = { V }$. Put $B_i = E_G \( cal(P)_i \)$ and $M_i = \| B_i \|$, with $M_ell = 0$. Distinct parts of these representative partitions, together with $V$ and singleton leaves, form a locally $h$-connected hierarchy. Mark precisely the nodes with $\| O \( A \) \| gt.eq \| P \( A \) \| \/ h$, and take $D$ from 2. Then
  $ Y = L_H + D in cal(K)_H \, $
  because $Y succ.curly.eq L_H$ and, for every $Z in cal(N)$, $chevron.l Y \, Z chevron.r lt.eq chevron.l L_H + L_G \, Z chevron.r lt.eq 2 chevron.l L_H \, Z chevron.r$.
  At transition $j$ to $j + 1$, the parent of each changing part is the part of $cal(P)_(j + 1)$ containing it. Every disappearing edge in $B_j \\ B_(j + 1)$ belongs to parent boundaries of changing parts, whose total full-boundary size is at most $2 M_j$. Unmarked parts therefore cover at most $2 M_j \/ h$ such edges. For marked parts, (2.14) and Markov’s inequality give
  $ \| { e in O \( A \) : R_Y \( e \) > 1 \/ \( 6 s \) } \| lt.eq 6 s thin h^(- 31 \/ 40) \| O \( A \) \| . $
  Thus at most $2 \( h^(- 1) + 6 s h^(- 31 \/ 40) \) M_j$ disappearing edges fail (2.15). Double counting only increases this upper bound.
  There is at most one representative per dyadic bin, and its bin index strictly decreases. Hence $sum_(j = i)^(ell - 1) M_j < 4 M_i$. Each edge of $B_i$ disappears at exactly one subsequent transition, so its bad-edge count is at most $8 \( h^(- 1) + 6 s h^(- 31 \/ 40) \) M_i$. For a skipped partition with positive crossing count $M$, its representative is finer and has $M_i < 2 M$. Consequently its bad-edge count is at most
  #[#set math.equation(numbering: n => "(2.16)")
   $ 16 \( h^(- 1) + 6 s h^(- 31 \/ 40) \) M = O \( r^(- 1) + r^(- 21 \/ 40) \) M lt.eq r^(- 1 \/ 3) M $ <tg:response-fraction>]
  for a sufficiently large absolute cutoff. The final inequality uses $21 \/ 40 - 1 \/ 3 = 23 \/ 120 > 0$. Partitions with no crossing edges need no estimate. One matrix $Y$ therefore works for the whole nested sequence. ◻
]

== 3 Constructive shortcut extraction <sec:ta-algorithm>

We now turn the simultaneous response of 6 into an algorithm. Throughout this section, an explicit multigraph has distinct labels for its parallel edges, and loops are discarded. Write $E_H \( cal(P) \)$ for the edges crossing a partition $cal(P)$ of the vertex set. Matrices act on $upright(bold(1))^perp$, with its inherited Euclidean inner product. We retain the cone $cal(N)$ and compact convex set $cal(K)_H$ from the preceding section:

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(K)_H = { X succ.curly.eq L_H : X bullet Z lt.eq 3 L_H bullet Z quad \( Z in cal(N) \) } . $ <eq:ta-K>]

Here $A bullet Z = "tr" \( A Z \)$ always means the inherited trace, even when rational, nonorthonormal coordinates are used for computation.

The construction follows the packing-preserving sparsification strategy of #cite(label("ThinTreesCompanion")). Convex continuation produces a rational shortcut together with a large integer packing supported on its low-resistance edges. Nonnegative capacities permit partition uncrossing; the nearly tight partitions then have highly connected parts, which is precisely the input required by the simultaneous geometric response.

=== 3.1 A ramp of packing capacities <a-ramp-of-packing-capacities>

We use two standard algorithmic inputs in precise forms. The Nash–Williams–Tutte tree-packing theorem #cite(label("NashWilliams1961")) #cite(label("Tutte1961")) says that a multigraph contains $q$ edge-disjoint spanning trees if and only if

#[#set math.equation(numbering: n => "(3.2)")
 $ \| E_H \( cal(P) \) \| gt.eq q \( \| cal(P) \| - 1 \) quad upright("for every partition ") cal(P) \; $ <eq:ta-integer-packing>]

see #cite(label("Kaiser2012")) Theorem 1. A maximum union of $q$ graphic matroids can be constructed by matroid partition, originating with Edmonds #cite(label("Edmonds1968")); we use the polynomial-time independence-oracle algorithm of #cite(label("Terao2023")) Theorem 14. The algorithm returns disjoint forests of maximum total cardinality. Their total size is $q \( n - 1 \)$ exactly when all $q$ forests are spanning trees. Acyclicity is a polynomial-time independence test, including for parallel edges. We reject $q \( n - 1 \) > m$ before invoking this procedure; thus the number of matroid copies is polynomial for an explicit graph.

#thm([Proposition 3.1.])[
  (Constructive shortcut extraction).  #emph[There are absolute constants $A$ and $r_0$ such that the following holds. If an explicit multigraph $H$ on at least two vertices contains $r gt.eq r_0$ edge-disjoint spanning trees, one can deterministically compute a rational $X in cal(K)_H$ and at least 
$ \( 1 - A r^(- 1 \/ 16) \) r $

 edge-disjoint spanning trees, every edge $e$ of which satisfies $b_e^T X^(- 1) b_e lt.eq r^(- 1 \/ 4)$. The running time and output encoding length are polynomial in $\| V \( H \) \| + \| E \( H \) \|$.]
] <prop:ta-extraction>

Fix such an $H$, put $m = \| E \( H \) \|$, and set

#[#set math.equation(numbering: n => "(3.3)")
 $ kappa = frac(1, m + 1) \, #h(2em) t = kappa / 32 \, #h(2em) r^(- 1 \/ 8) lt.eq g lt.eq 2 r^(- 1 \/ 8) \, $ <eq:ta-parameters>]

where $g$ is dyadic. Comparing eighth powers computes $g$ exactly with $O \( log r \)$ bits. At a parameter $s > 0$ and matrix $X in cal(K)_H$, define

#[#set math.equation(numbering: n => "(3.4)")
 $ R_e \( X \) = b_e^T X^(- 1) b_e \, #h(2em) p_e = min { 2 \, \( s R_e \( X \) \)^(- 1) } \, #h(2em) u_e = max { 0 \, p_e - 1 } . $ <eq:ta-ramp>]

The maintained invariant is

#[#set math.equation(numbering: n => "(3.5)")
 $ sum_(e in E_H \( cal(P) \)) \( u_e + kappa \) gt.eq Q \( \| cal(P) \| - 1 \) #h(2em) upright("for every ") cal(P) . $ <eq:ta-invariant>]

Initially take $s = 1 \/ 2$, $X = L_H$, and $Q = r$. Since $L_H succ.curly.eq b_e b_e^T$, each $R_e \( L_H \) lt.eq 1$, so $u_e = 1$ and the initial invariant follows from the given packing.

One step replaces

#[#set math.equation(numbering: n => "(3.6)")
 $ s^(+) = \( 1 + t \) s \, #h(2em) X^(+) = \( 1 - t \) X + t Y \, #h(2em) Q^(+) = Q - 2 g r t \, $ <eq:ta-step>]

where $Y in cal(K)_H$ is to be found. Steps are performed while $s^4 < r$, an exact rational comparison. The final step may overshoot $r^(1 \/ 4)$; every response is invoked at an old parameter $s lt.eq r^(1 \/ 4)$. There are $O \( t^(- 1) \( 1 + log r \) \)$ steps, since $log \( 1 + t \) gt.eq t \/ 2$. Consequently

#[#set math.equation(numbering: n => "(3.7)")
 $ r gt.eq Q gt.eq r #scale(x: 120%, y: 120%)[\(] 1 - O \( r^(- 1 \/ 8) \( 1 + log r \) \) #scale(x: 120%, y: 120%)[\)] gt.eq 3 r \/ 4 $ <eq:ta-target-bound>]

after increasing the absolute cutoff $r_0$.

Let $G$ be the active subgraph with edges $u_e > 0$. Choose variables $0 lt.eq y_e lt.eq 1$ for $e in E \( G \)$ and impose

#[#set math.equation(numbering: n => "(3.8)")
 $ Y succ.curly.eq 6 s y_e b_e b_e^T . $ <eq:ta-response-LMI>]

For these variables define concave lower capacities on all edges of $H$:

#[#set math.equation(numbering: n => "(3.9)")
 $ a_e \( y \) = cases(delim: "{", kappa + min { 1 \, u_e + t \( 5 y_e - 4 \) } \, & e in E \( G \) \,, kappa \, & e in.not E \( G \) .) $ <eq:ta-lower-capacity>]

They are nonnegative, in fact $a_e gt.eq kappa - 4 t = 7 kappa \/ 8$. This small baseline will also make the uncrossing argument valid.

To check the lower bound, recall that $X succ.curly.eq alpha b b^T$ is equivalent to $alpha lt.eq \( b^T X^(- 1) b \)^(- 1)$ for $X succ 0$. Thus $X succ.curly.eq s p_e b_e b_e^T$, and (3.8) gives

$ frac(1, s^(+) R_e \( X^(+) \)) gt.eq frac(\( 1 - t \) p_e + 6 t y_e, 1 + t) gt.eq p_e + t \( 5 y_e - 4 \) . $

Indeed the numerator of the difference in the last inequality, divided by $t$, is $\( 1 - 5 t \) y_e + 4 + 4 t - 2 p_e gt.eq 0$, since $p_e lt.eq 2$ and $t < 1 \/ 5$. Taking the ramp at $s^(+) \, X^(+)$, including both its upper cap and its lower truncation, proves

#[#set math.equation(numbering: n => "(3.10)")
 $ u_e^(+) + kappa gt.eq a_e \( y \) . $ <eq:ta-ramp-lower>]

Off $G$ this follows just from $u_e^(+) gt.eq 0$.

#thm([Lemma 3.2.])[
  (A feasible continuation response).  #emph[Under (3.5), (3.7), with $s lt.eq r^(1 \/ 4)$, there exist $Y in cal(K)_H$ and $y$ satisfying (3.8) and 
#[#set math.equation(numbering: n => "(3.11)")
 $ sum_(e in E_H \( cal(P) \)) a_e \( y \) gt.eq \( Q - g r t \) \( \| cal(P) \| - 1 \) #h(2em) upright("for every ") cal(P) . $ <eq:ta-strong-target>]

]
] <lem:ta-continuation>

#proof[
  Let $cal(C)$ be the compact convex set of admissible $\( Y \, y \)$ before the partition inequalities are imposed. It is nonempty: take $Y = L_H$ and $y = 0$. Put $q = Q - g r t > 0$ and let
  $ S_(cal(P)) \( y \) = sum_(e in E_H \( cal(P) \)) a_e \( y \) - q \( \| cal(P) \| - 1 \) . $
  Each slack is continuous and concave. Its vector image need not be convex, but the downward set
  $ cal(D) = { v : med v_(cal(P)) lt.eq S_(cal(P)) \( y \) upright(" for some ") \( Y \, y \) in cal(C) } $
  is convex and closed. Convexity follows coordinatewise from concavity; closedness follows by taking a convergent subsequence of witnesses in $cal(C)$. The set $cal(D)$ is unbounded downward. If it does not meet the nonnegative orthant, its distance from that orthant is positive: the norm of the negative part of $S \( y \)$ has a positive minimum on the compact set $cal(C)$, and passing downward cannot reduce that norm. Separation therefore supplies nonnegative weights $w_(cal(P))$, normalized to sum to one, for which
  #[#set math.equation(numbering: n => "(3.12)")
   $ F \( w \) := max_(\( Y \, y \) in cal(C)) sum_(cal(P)) w_(cal(P)) S_(cal(P)) \( y \) < 0 . $ <eq:ta-separated>]
  There are finitely many partitions. Hence $F$ is continuous on their probability simplex and has a minimizer. Among minimizers choose one maximizing $sum_(cal(P)) w_(cal(P)) \| cal(P) \|^2$. Its support is a chain under refinement. To prove this, suppose incomparable $cal(P) \, cal(Q)$ have positive mass. Move equal mass from them to their common refinement $cal(P) and cal(Q)$ and finest common coarsening $cal(P) or cal(Q)$. For each edge,
  $ upright(bold(1))_(E_H \( cal(P) and cal(Q) \)) + upright(bold(1))_(E_H \( cal(P) or cal(Q) \)) lt.eq upright(bold(1))_(E_H \( cal(P) \)) + upright(bold(1))_(E_H \( cal(Q) \)) . $
  Moreover,
  $ \| cal(P) and cal(Q) \| + \| cal(P) or cal(Q) \| gt.eq \| cal(P) \| + \| cal(Q) \| . $
  For the second inequality, form the bipartite graph whose vertices are parts of $cal(P)$ and $cal(Q)$ and whose edges are their nonempty intersections. Its edges count refinement parts, and its connected components count coarsening parts; edges plus components are at least vertices. Since $a_e gt.eq 0$ and $q > 0$, uncrossing decreases the weighted slack for every $\( Y \, y \)$, hence cannot increase $F$. Writing $a = \| cal(P) \|$, $b = \| cal(Q) \|$, $c = \| cal(P) and cal(Q) \|$ and $d = \| cal(P) or cal(Q) \|$, incomparability gives $c > max \( a \, b \)$ and $d < min \( a \, b \)$. Thus
  $ c^2 + d^2 - a^2 - b^2 = \( c - a \) \( c - b \) + \( d - a \) \( d - b \) + \( a + b \) \( c + d - a - b \) > 0 . $
  This contradicts the tie-breaking choice. The one-part partition has zero slack and is comparable with every partition, so it creates no exception.
  It remains to satisfy (3.11) simultaneously on any chain. Let the old slack in (3.5) be $sigma_(cal(P)) gt.eq 0$. If $sigma_(cal(P)) > 1$, the worst possible loss $4 t m < 1$ already leaves the desired inequality. Retain only partitions with $sigma_(cal(P)) lt.eq 1$, omitting the one-part partition. Every part of every retained partition induces an $h$-edge-connected graph in $G$, where $h = floor.l r \/ 2 floor.r$. Indeed, split one such part by any nontrivial internal cut. Subtracting the old partition capacity from the invariant for the refined partition shows that the internal cut has capacity at least $Q - 1$. Removing all baselines loses less than $kappa m < 1$, and $u_e lt.eq 1$ then shows that the active internal cut has more than $Q - 2 gt.eq h$ edges. The same argument using a two-part partition at the root gives more than $Q - 1$ active edges across every root cut. Singleton parts require no check.
  Apply 6 to this chain, with its root, and set $y_e = 1$ on edges satisfying $Y succ.curly.eq 6 s b_e b_e^T$, and $y_e = 0$ otherwise. These choices satisfy (3.8). Fix a retained partition, write $d = \| cal(P) \| gt.eq 2$ and $M = \| E_G \( cal(P) \) \|$, and call its at most $r^(- 1 \/ 3) M$ exceptional crossing edges bad. Good edges never lose capacity; bad edges lose at most $4 t$ each. If $M lt.eq 8 r \( d - 1 \)$, the total loss is at most
  $ 4 t r^(- 1 \/ 3) M lt.eq 32 t r^(2 \/ 3) \( d - 1 \) lt.eq g r t \( d - 1 \) $
  for sufficiently large $r$, as required.
  If $M > 8 r \( d - 1 \)$, near-tightness gives $sum_(E_G \( cal(P) \)) u_e lt.eq Q \( d - 1 \) + 1 lt.eq r \( d - 1 \) + 1$. Fewer than half of these $M$ edges can have $u_e > 1 \/ 2$: their number is at most $2 r \( d - 1 \) + 2 < M \/ 2$ for the chosen cutoff. Each good edge with $u_e lt.eq 1 \/ 2$ gains exactly $t$, since $t < 1 \/ 2$. The total gain minus loss is therefore at least
  $ t #scale(x: 120%, y: 120%)[\(] M \/ 2 - r^(- 1 \/ 3) M #scale(x: 120%, y: 120%)[\)] - 4 t r^(- 1 \/ 3) M gt.eq 0 . $
  This also proves the desired inequality. Every chain thus admits a simultaneous nonnegative slack vector, contradicting (3.12). The lemma follows. ◻
]

=== 3.2 Exact separation and a uniform interior ball <exact-separation-and-a-uniform-interior-ball>

The existence lemma leaves a margin $g r t$ beyond the actual target $Q^(+) = Q - 2 g r t$. We next use that margin to compute a response, including when the stronger solution has $y_e = 0$ or $1$.

For distinct vertices put $T_(i j k) = b_(i j) b_(i j)^T + b_(j k) b_(j k)^T - b_(i k) b_(i k)^T$. The dual cone has the exact representation

#[#set math.equation(numbering: n => "(3.13)")
 $ cal(N)^(*) = { P + sum_(i j k) lambda_(i j k) T_(i j k) : P succ.curly.eq 0 \, med lambda_(i j k) gt.eq 0 } . $ <eq:ta-dual-cone>]

Here and below all ordered distinct triples may be used; repetitions of an identical generator are harmless. To verify closedness, note that $"tr" T_(i j k) = 2$. If matrices on the right converge, their traces bound both $"tr" P$ and $sum lambda_(i j k)$. The PSD summands and coefficients therefore have convergent subsequences. The represented cone is closed, and its dual is exactly the PSD cone intersected with all triangle halfspaces, namely $cal(N)$. The finite-dimensional bipolar theorem proves (3.13). This trace argument uses full centered matrices; an ordinary trace in arbitrary reduced coordinates would not justify it. Also, for any connected $G$, choosing $0 < epsilon.alt < lambda_min \( L_G \|_(upright(bold(1))^perp) \)$ makes $L_G - epsilon.alt I$ positive definite and hence interior to $cal(N)^(*)$. This supplies strict conic feasibility whenever it is needed in the shortcut domain.

Use variables $Y$, $lambda_(i j k) gt.eq 0$, and $y_e \, z_e$ for $e in E \( G \)$. Besides (3.8), impose

#[#set math.equation(numbering: n => "(3.14)")
 $ & Y - L_H succ.curly.eq 0 \, #h(2em) 3 L_H - Y - sum_(i j k) lambda_(i j k) T_(i j k) succ.curly.eq 0 \,\
 & 0 lt.eq y_e lt.eq 1 \, #h(2em) 0 lt.eq z_e lt.eq kappa + 1 \, #h(2em) z_e lt.eq kappa + u_e + t \( 5 y_e - 4 \) . $ <eq:ta-conic-representation>]

Define $z_e = kappa$ off $G$ and add

#[#set math.equation(numbering: n => "(3.15)")
 $ sum_(e in E_H \( cal(P) \)) z_e gt.eq Q^(+) \( \| cal(P) \| - 1 \) quad upright("for all ") cal(P) . $ <eq:ta-computational-packing>]

By (3.13), the two LMIs in (3.14) describe exactly $Y in cal(K)_H$. The two upper bounds on $z_e$ describe $z_e lt.eq a_e \( y \)$.

#thm([Lemma 3.3.])[
  (Partition separation by minimum spanning trees).  #emph[For nonnegative rational capacities $z$ and rational $q gt.eq 0$, the inequalities $z \( E_H \( cal(P) \) \) gt.eq q \( \| cal(P) \| - 1 \)$ have an exact polynomial-time separation oracle. Consequently the full feasible set defined by (3.8), (3.14), (3.14), (3.15) has such an oracle at rational points.]
] <lem:ta-separation>

#proof[
  The partition inequalities are equivalent to
  #[#set math.equation(numbering: n => "(3.16)")
   $ z dot.op ell gt.eq q thin "MST" \( ell \) #h(2em) \( 0 lt.eq ell_e lt.eq 1 \) \, $ <eq:ta-MST-inequalities>]
  where $"MST" \( ell \)$ is minimum spanning tree length in $H$. For one direction, assign length one to edges crossing a partition and zero to all other edges. Every spanning tree has at least $\| cal(P) \| - 1$ crossing edges. Conversely, let $cal(P)_a$ be the components of the subgraph of edges of length less than $a$. Kruskal’s algorithm gives
  $ "MST" \( ell \) = integral_0^1 \( \| cal(P)_a \| - 1 \) thin d a . $
  Every edge crossing $cal(P)_a$ has length at least $a$, so integration of the partition inequalities gives $q "MST" \( ell \) lt.eq sum_e z_e ell_e$.
  To separate (3.16), solve the rational linear program
  #[#set math.equation(numbering: n => "(3.17)")
   $ max { q v - z dot.op ell : med 0 lt.eq ell lt.eq 1 \, med 0 lt.eq v lt.eq n \, med v lt.eq ell \( T \) med upright("for all spanning trees ") T #scale(x: 120%, y: 120%)[}] . $ <eq:ta-MST-LP>]
  All facet coefficients have polynomial encoding length. A minimum spanning tree supplies exact separation for the exponentially many tree constraints. The rational polyhedral optimization theorem #cite(label("GLS1988")) Theorem 6.4.9 therefore computes the exact optimum and a rational optimizer in polynomial work. The optimum is nonnegative. If it is zero all inequalities hold; if positive, the returned length vector gives a violated valid linear inequality in $z$.
  The scalar constraints have immediate rational separators. Exact symmetric elimination either certifies a rational symmetric matrix as PSD or produces a rational vector of negative quadratic form. Applied to an affine matrix constraint, that vector supplies a rational linear separator of polynomial encoding length. This completes the oracle. ◻
]

#thm([Lemma 3.4.])[
  (Quantitative feasibility and bounded output denominators).  #emph[Every continuation step can be computed in polynomial binary time. Its returned variables may be taken on a fixed rational grid whose encoding length depends only on $n + m$, not on the denominators of the old capacities $u_e$.]
] <lem:ta-bits>

#proof[
  We give deliberately loose uniform bounds. Put $P = n + m + 2 gt.eq 5$ and use the upper-triangular entries of the upper-left $\( n - 1 \) times \( n - 1 \)$ block as free coordinates of a centered symmetric matrix. If that block is $A$, its full completion is $C A C^T$, where $C = \[ e_1 - e_n med dots.h.c med e_(n - 1) - e_n \]$. Thus a free-coordinate perturbation of Euclidean norm $eta$ changes the full matrix in operator norm by at most $2 P eta$. Include $lambda \, y \, z$ as ordinary scalar coordinates. Their total number $D$ is at most $P^3$.
  A connected unweighted multigraph has
  #[#set math.equation(numbering: n => "(3.18)")
   $ lambda_min \( L_H \|_(upright(bold(1))^perp) \) gt.eq P^(- 3) = : mu \, #h(2em) parallel L_H parallel_(upright("op")) lt.eq 2 m . $ <eq:ta-spectral-size>]
  For the first bound, for a centered unit vector choose its largest and smallest coordinates and a path between them of length at most $n - 1$. The coordinate range is at least $n^(- 1 \/ 2)$, so Cauchy–Schwarz along that path already gives energy at least $1 \/ \( n \( n - 1 \) \) gt.eq P^(- 3)$.
  Consider an auxiliary point, without requiring its partition constraints:
  #[#set math.equation(numbering: n => "(3.19)")
   $ Y_0 = 2 L_H \, #h(2em) lambda_(i j k \, 0) = P^(- 8) \, #h(2em) y_(e \, 0) = P^(- 8) \, #h(2em) z_(e \, 0) = kappa \/ 2 . $ <eq:ta-auxiliary>]
  There are at most $P^3$ generators, each of norm at most $6$, so their weighted sum has norm at most $6 P^(- 5) < mu \/ 2$. Since $s lt.eq r^(1 \/ 4) lt.eq m + 1 < P$ and $parallel b_e b_e^T parallel = 2$, the response LMI at this point has margin at least $2 mu - 12 P^(- 7) > mu$. The other two LMIs have margins at least $mu \/ 2$. The $lambda$ and lower $y$ faces have margin $P^(- 8)$, the upper $y$ face has margin at least $1 \/ 2$, and the $z$ lower and upper faces have margins at least $kappa \/ 2$ and $1$, respectively. Finally
  $ kappa + u_e + t \( 5 y_(e \, 0) - 4 \) - z_(e \, 0) gt.eq kappa \/ 2 - 4 t = 3 kappa \/ 8 . $
  All scalar normal norms and affine matrix Lipschitz constants are at most $20 P^3$ in these coordinates. It follows that the entire ball of radius
  #[#set math.equation(numbering: n => "(3.20)")
   $ rho_0 = P^(- 20) $ <eq:ta-aux-radius>]
  about this auxiliary point satisfies all non-packing constraints. In particular these estimates are uniform even when an active $u_e$ is extremely small.
  By 8, choose a stronger feasible point $x_(*)$, using $z_e = a_e \( y \)$ and any representation (3.14). Let $beta = g r t$. Every nontrivial partition has slack at least $beta \( \| cal(P) \| - 1 \) gt.eq beta$ at $x_(*)$ relative to (3.15). Moreover,
  $ beta gt.eq frac(1, 32 \( m + 1 \)) gt.eq frac(1, 32 P) . $
  At the auxiliary point every such slack is at least $- P^2$, because all capacities are nonnegative and $Q^(+) lt.eq r lt.eq m$. Mix a fraction $theta = P^(- 8)$ of the auxiliary point into $x_(*)$. Since $P gt.eq 5$, the new partition slacks are at least $\( 1 - theta \) beta - theta P^2 gt.eq beta \/ 2$. Convexity gives a ball of radius $theta rho_0 = P^(- 28)$ satisfying the non-packing constraints about the mixture. A partition normal has at most $m$ unit coefficients in the $z$ coordinates, so its norm is at most $sqrt(m)$. Thus the smaller ball of radius
  #[#set math.equation(numbering: n => "(3.21)")
   $ rho = P^(- 30) $ <eq:ta-inradius>]
  satisfies every partition constraint as well. Their exponential number does not change this uniform estimate.
  There is also a uniform outer ball. Testing (3.1) against the centered identity gives $"tr" Y lt.eq 6 m$. Taking traces in the second LMI of (3.14) gives $sum lambda_(i j k) lt.eq 3 m$. Together with $0 lt.eq y_e lt.eq 1$ and $0 lt.eq z_e lt.eq kappa + 1 lt.eq 2$, these bounds place all free coordinates in the ball of radius $P^3$. We may impose the larger radius $2 P^3$ with slack. This ball also has an exact rational separator: for a rational query $a$ with $parallel a parallel > R$, the inequality $a dot.op x lt.eq \( R^2 + parallel a parallel^2 \) \/ 2$ contains the radius-$R$ ball and strictly excludes $a$, by Cauchy–Schwarz and the arithmetic–geometric mean inequality. All ball constants have logarithmic encoding length in $P$. The rational central-cut ellipsoid procedure, using 9, now finds an exactly feasible point in polynomial work #cite(label("GLS1988")) Theorem 3.2.1 and its proof. Indeed, use our exact membership test at every oracle query and choose the enclosing-volume cutoff below $\( 2 rho \/ D \)^D$, the volume of a coordinate cube contained in the proved radius-$rho$ inner ball. The small-volume outcome is impossible, so the algorithm must terminate at an exactly accepted rational point. This argument uses the displayed positive inradius; it does not assume exact solvability of an arbitrary semidefinite feasibility problem.
  To bound the returned denominators independently of those in $u$, put $L = ceil.l log_2 P ceil.r$, $eta = 2^(- 32 L)$ and $gamma = 2^(- 36 L)$, and instead find $x$ such that
  #[#set math.equation(numbering: n => "(3.22)")
   $ x plus.minus eta e_j in cal(F) #h(2em) \( 1 lt.eq j lt.eq D \) \, $ <eq:ta-translated>]
  where $cal(F)$ is the full step feasible set, including the outer bound. The intersection of these $2 D$ translates still contains a ball of radius at least $rho - eta gt.eq 3 rho \/ 4$, and has a separation oracle by translating the queries. Use the corresponding volume cutoff with $3 rho \/ 4$ in place of $rho$. Convexity implies that the cross-polytope ${ x + v : parallel v parallel_1 lt.eq eta }$ lies in $cal(F)$. Round each coordinate of $x$ to the fixed dyadic mesh $gamma$. Its total rounding error is at most $D gamma \/ 2 lt.eq eta \/ \( 2 P \) < eta$, so the rounded point remains feasible. The outer bound gives at most $39 L + O \( 1 \)$ bits per coordinate. This argument does not round a boundary solution without a margin.
  Finally $s$ and $Q$ have polynomial encoding length throughout the prescribed schedule. At a rational $X succ.curly.eq L_H$, its centered inverse and all old $u_e$ are computed exactly with polynomial bit operations. Every new $Y$ lies on the fixed grid just described. Forming $X^(+) = \( 1 - t \) X + t Y$ increases encoding length by only a polynomial additive amount per step. Over the polynomial number of steps neither denominators nor oracle work can cascade beyond polynomial size. ◻
]

#proof[
  Apply Lemma 3.2, Lemma 3.4 at every step. The computed capacities satisfy (3.15); (3.10) therefore preserves (3.5) with target $Q^(+)$. At termination $s gt.eq r^(1 \/ 4)$, and every active edge has $R_e \( X \) < 1 \/ s lt.eq r^(- 1 \/ 4)$. Dropping the baselines loses less than one across any partition, and $u_e lt.eq 1$ gives
  $ \| E_G \( cal(P) \) \| gt.eq Q \( \| cal(P) \| - 1 \) - 1 gt.eq \( Q - 1 \) \( \| cal(P) \| - 1 \) quad \( \| cal(P) \| gt.eq 2 \) . $
  Hence (3.2) supplies $floor.l Q - 1 floor.r$ disjoint spanning trees. Construct them by the graphic-matroid union procedure stated above. By (3.7), their number is $r \( 1 - O \( r^(- 1 \/ 8) \( 1 + log r \) \) \) - O \( 1 \)$, which is at least $\( 1 - A r^(- 1 \/ 16) \) r$ after enlarging $A$ and $r_0$. All steps have the claimed polynomial bit complexity. ◻
]

== 4 A rank-preserving normalized frame <sec:normalization>

The shortcut controls effective resistances. A second vector system encodes the spanning-tree packing, so that signing can preserve both properties simultaneously. The normalization uses the log-determinant variational method for radial isotropic position #cite(label("Barthe1998")) Section 2.2. We prove the approximate positive-weight form and its bit bounds directly, so no attainment assumption is needed.

#thm([Lemma 4.1.])[
  (A computable normalized frame).  #emph[Suppose $B$ is the union of $q$ edge-disjoint spanning trees, where $r \/ 2 lt.eq q lt.eq r$ and $r$ exceeds an absolute constant. There are vectors $z_e in bb(R)^(n - 1)$, obtained from faithful reduced incidence columns by one common invertible linear map and positive individual scalings, such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(e in B) z_e z_e^T = I \, #h(2em) parallel z_e parallel^2 lt.eq frac(1 + 4 \/ r, q) . $ <eq:ta-frame>]

 They admit rational approximations to Euclidean error $2^(- b)$ in time polynomial in $n + \| B \| + r + b$. An exact specification uses polynomial-bit positive rational edge weights followed by whitening; in particular, every subset has exactly its original incidence rank.]
] <lem:ta-frame>

#proof[
  Delete one row of the incidence matrix and write the resulting columns as $c_e$. Put $M = \| B \| = q \( n - 1 \)$ and consider
  #[#set math.equation(numbering: n => "(4.2)")
   $ N \( d \) = sum_(e in B) exp \( d_e \) c_e c_e^T \, #h(2em) f \( d \) = log det N \( d \) - 1 / q sum_(e in B) d_e . $ <eq:ta-logdet>]
  By Cauchy–Binet, $det N \( d \) = sum_T exp \( sum_(e in T) d_e \)$, where $T$ ranges over the spanning trees of $B$: reduced incidence determinants of trees have absolute value one, and other maximal minors vanish. Keeping the $q$ specified disjoint trees and applying the arithmetic–geometric mean inequality gives
  $ det N \( d \) gt.eq q exp (1 / q sum_(e in B) d_e) \, #h(2em) f \( d \) gt.eq log q . $
  Also $f \( 0 \) lt.eq \( n - 1 \) log \( 2 M \)$, so the initial gap above the infimum is bounded by $n log \( 2 M \)$. Differentiation gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ partial_e f \( d \) = exp \( d_e \) c_e^T N \( d \)^(- 1) c_e - 1 / q . $ <eq:ta-gradient>]
  The Hessian is the covariance matrix of the tree indicator under the probability distribution proportional to $exp \( sum_(e in T) d_e \)$. Hence it is PSD with operator norm at most $M$, since these indicators have squared norm $n - 1 lt.eq M$. Each leverage score in (4.3) lies in $\[ 0 \, 1 \]$; consequently $parallel nabla f parallel lt.eq sqrt(M)$.
  Start at $d = 0$. At each step compute a rational gradient estimate $v$ with $parallel v - nabla f \( d \) parallel lt.eq 1 \/ \( 10 r^2 \)$. If $parallel v parallel lt.eq 2 \/ r^2$, stop; otherwise update $d arrow.l d - v \/ \( 2 \( M + 1 \) \)$. The norm comparison can be made by squaring rational quantities. The Hessian bound yields
  $ f \( d - alpha v \) lt.eq f \( d \) - alpha nabla f \( d \) dot.op v + 1 / 2 M alpha^2 parallel v parallel^2 \, #h(2em) alpha = frac(1, 2 \( M + 1 \)) . $
  At a nonstopping step the gradient error is at most $parallel v parallel \/ 20$. Thus the decrease is at least $alpha parallel v parallel^2 \/ 2 gt.eq 2 alpha \/ r^4$. The gap bound permits at most $O \( \( M + 1 \) r^4 n log \( 2 M \) \)$ such steps. At termination
  #[#set math.equation(numbering: n => "(4.4)")
   $ parallel nabla f \( d \) parallel lt.eq 3 \/ r^2 . $ <eq:ta-gradient-stop>]
  Here is an explicit precision justification for this descent. Its iteration bound is prescribed in advance, and each coordinate changes by at most two in one step. Thus $\| d_e \| lt.eq B_0$ for a known polynomial $B_0$ in $n + M + r$. On that entire box,
  $ e^(- B_0) N \( 0 \) prec.curly.eq N \( d \) prec.curly.eq e^(B_0) N \( 0 \) . $
  The matrix $N \( 0 \)$ is positive definite, has norm at most $2 M$, and has positive integral determinant. Its smallest eigenvalue is therefore at least $\( 2 M \)^(- \( n - 2 \))$. The upper norm and inverse-norm bounds for $N \( d \)$ have polynomial logarithms. Computing exponentials to polynomially many bits, forming rational approximations to $N \( d \)$, and solving rational linear systems therefore evaluates (4.3) to the requested error in polynomial bit work. For example, the identity $tilde(N)^(- 1) - N^(- 1) = tilde(N)^(- 1) \( N - tilde(N) \) N^(- 1)$ controls the inverse error once $parallel tilde(N) - N parallel lt.eq lambda_min \( N \) \/ 2$. Gradient estimates may be rounded on one fixed dyadic grid $2^(- b_0)$ sufficiently fine for the stated error. Starting at zero, every iterate then lies on the grid $\[ 2 \( M + 1 \) 2^(b_0) \]^(- 1) bb(Z)^M$. The prescribed iteration and magnitude bounds therefore keep every $d_e$ a polynomial-bit rational.
  At the terminal $d$, choose positive rational weights $a_e$ satisfying $\| a_e \/ exp \( d_e \) - 1 \| lt.eq 1 \/ \( 100 r^2 \)$ and put $N_a = sum_e a_e c_e c_e^T$. Compute its rational diagonal elimination $N_a = L D_a L^T$ with positive diagonal $D_a$, set $F = D_a^(- 1 \/ 2) L^(- 1)$, and define $z_e = sqrt(a_e) F c_e$. Then $F N_a F^T = I$. The relative matrix bounds on $N_a$ and (4.4) imply
  $ parallel z_e parallel^2 lt.eq frac(1 + 1 \/ \( 100 r^2 \), 1 - 1 \/ \( 100 r^2 \)) (1 / q + 3 / r^2) lt.eq 1 / q + 4 / r^2 lt.eq frac(1 + 4 \/ r, q) . $
  Their outer products sum exactly to $I$. All $a_e$ are strictly positive and $F$ is invertible, proving rank preservation.
  For the promised approximations, perform exact rational diagonal elimination on the positive definite $N_a$ and then approximate the positive square roots of its pivots. Every pivot and inverse pivot has polynomial logarithmic bounds, either by the preceding spectral bounds or by determinant bounds for rational principal submatrices. Triangular solves and scalar square roots therefore approximate $F$ and all $z_e$ to $2^(- b)$ with polynomially many guard bits and polynomial work. These approximations refer to the single exact frame just defined; rounding does not redefine its subset ranks. ◻
]

== 5 Exact rational padding and certified signing <sec:signing>

The deterministic signing theorem proved in Appendix 8 has an exact input promise. For explicit rational columns $v_1 \, dots.h \, v_M in \( bb(Q) + i bb(Q) \)^d$ satisfying $sum_i v_i v_i^(*) = I$, it returns signs $sigma_i in { - 1 \, 1 }$ with

#[#set math.equation(numbering: n => "(5.1)")
 $ ∥sum_i sigma_i v_i v_i^(*)∥_(upright("op")) lt.eq 40 sqrt(Delta) \, #h(2em) Delta = max_i parallel v_i parallel^2 \, $ <eq:ta-signing-input>]

in time polynomial in the full binary input length. This is 16, a quantitative form of the method of Ezeunala and Jiang #cite(label("EzeunalaJiang2026")). Real rational columns are a special case. We first establish an elementary exact factorization, then prove the transfer required here, including identity completion and a rational success certificate.

#thm([Lemma 5.1.])[
  (Rational positive semidefinite decomposition).  #emph[Every rational Hermitian positive semidefinite matrix $A$ can be written exactly as 
$ A = sum_(j = 1)^M v_j v_j^(*) \, #h(2em) v_j in bb(Q) \( upright(i) \)^n \, $

 in polynomial bit time, with $M$ and the total encoding length of the columns polynomial in the encoding length of $A$. If $A$ is real, the columns may be taken real. For $A = 0$, the sum may be empty.]
] <lem:rational-psd>

#proof[
  If a positive semidefinite matrix has all diagonal entries zero, it is zero, since its two-by-two principal minors give $\| a_(i j) \|^2 lt.eq a_(i i) a_(j j)$. Otherwise permute a positive diagonal entry into the first position and write
  $ A = mat(delim: "(", d, b^(*); b, C) = d vec(1, b \/ d) vec(1, b \/ d)^(#h(-0.16667em) *) + mat(delim: "(", 0, 0; 0, C - b b^(*) \/ d) . $
  Here $d$ is positive rational and the Schur complement is positive semidefinite: evaluate the quadratic form of $A$ at $\( - b^(*) x \/ d \, x \)$. Repetition gives a rational pivoted $L D L^(*)$ factorization, or equivalently $A = sum_j d_j u_j u_j^(*)$ with positive rational $d_j$ and rational complex $u_j$.
  All elimination entries have polynomial encoding length. To see this directly, clear the input denominators by one positive integer $q$. The resulting Gaussian-integer matrix has polynomial-bit entries, and every minor has polynomial bit length by the determinant expansion. At any pivot order, the pivots and elimination coefficients are ratios of these minors, with an additional factor $q$ for the pivots. There are at most $n$ pivots, so rational elimination takes polynomial bit time.
  For a pivot $d = a \/ b > 0$ with positive integers $a \, b$, expand $a b = sum_k c_k 4^k$, where $c_k in { 0 \, 1 \, 2 \, 3 }$. Then
  $ d = sum_k c_k (2^k / b)^2 . $
  Replace $d u u^(*)$ by $c_k$ copies of the outer product of $\( 2^k \/ b \) u$ for each $k$. The number of copies and their bit lengths are polynomial in those of $a \, b \, u$. This proves every assertion, including the real case. ◻
]

#thm([Lemma 5.2.])[
  (Checked signing of the stacked frame).  #emph[Let $X$ and the union $B$ of $q$ trees be as in 7, retaining $r \/ 2 lt.eq q lt.eq r$ trees, and let $z_e$ be the frame of 11. Put 
#[#set math.equation(numbering: n => "(5.2)")
 $ w_e = \( X^(- 1 \/ 2) b_e \, z_e \) #h(2em) \( e in B \) . $ <eq:ta-stacked>]

 For an absolute constant $C_s$, a deterministic polynomial-time procedure finds $A subset.eq B$ satisfying 
#[#set math.equation(numbering: n => "(5.3)")
 $ ∥sum_(e in A) w_e w_e^T - 1 / 2 sum_(e in B) w_e w_e^T∥_(upright("op")) lt.eq C_s r^(- 1 \/ 8) . $ <eq:ta-half-frame>]

 An exact polynomial-time rational PSD test certifies the output.]
] <lem:ta-signing>

#proof[
  The first block of (5.2) is expressed in orthonormal coordinates on $upright(bold(1))^perp$; its particular orthogonal basis is irrelevant. Since $L_B prec.curly.eq L_H prec.curly.eq X$, its outer-product sum is at most $I$, while the second block sums to $I$. Block Cauchy–Schwarz therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_(e in B) w_e w_e^T prec.curly.eq 2 I . $ <eq:ta-subisotropic>]
  Individual squared norms are at most $r^(- 1 \/ 4) + \( 1 + 4 \/ r \) \/ q lt.eq 5 r^(- 1 \/ 4)$ for the chosen cutoff.
  Write $n = \| V \( H \) \|$, $m = \| E \( H \) \|$, and $P = n + m + 2$, as in 10. The centered positive definite $X$ has polynomial-bit rational entries, with smallest eigenvalue at least $P^(- 3)$ and norm at most $6 m$. As in the proof of 11, elimination, square-root approximation, and solves compute a whitening of this block to any requested polynomial number of bits. More explicitly, in the rational coordinates used above write $X = C A_X C^T$ and $b_e = C c_e$. Then $c_e^T A_X^(- 1) c_f = b_e^T X^(- 1) b_f$, so whitening $A_X$ gives the same Gram matrix as the displayed block and differs from it only by an orthogonal map. The smallest eigenvalue of $A_X$ is at least $P^(- 3) \/ n$, because the centered projection of $\( v \, 0 \)$ has squared norm at least $parallel v parallel^2 \/ n$. Thus this computation has the same polynomial precision bounds. Combining it with 11, compute rational columns $a_e$ approximating $w_e \/ 2$ to Euclidean error at most $1 \/ \( 1000 \| B \| r \)$. Because (5.4) implies $parallel w_e \/ 2 parallel lt.eq 1$, the outer-product identity
  $ a a^T - v v^T = \( a - v \) a^T + v \( a - v \)^T $
  shows that
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(e in B) parallel a_e a_e^T - w_e w_e^T \/ 4 parallel_(upright("op")) lt.eq frac(1, 100 r) \, #h(2em) Sigma := sum_(e in B) a_e a_e^T prec.curly.eq 3 / 4 I . $ <eq:ta-approximate-data>]
  The same estimate controls every signed sum, without knowing the signs. Also $parallel a_e parallel^2 lt.eq 3 r^(- 1 \/ 4)$.
  Apply 12 to the rational PSD residual $I - Sigma$, obtaining polynomially many polynomial-bit real rational columns $v_1 \, dots.h \, v_J$ with
  #[#set math.equation(numbering: n => "(5.6)")
   $ V V^T = sum_(j = 1)^J v_j v_j^T = I - Sigma \, #h(2em) V = \[ v_1 med dots.h.c med v_J \] . $ <eq:ta-padding-factor>]
  In particular $parallel V parallel_(upright("op")) lt.eq 1$ and each $parallel v_j parallel lt.eq 1$. Extend the data columns by zeros in $J$ additional coordinates. Set $N = 2 r$. For each $j$, add $N^2$ columns
  #[#set math.equation(numbering: n => "(5.7)")
   $ p_(j \, k) = 1 / N \( v_j \, tau_(j \, k) f_j \) \, #h(2em) 1 lt.eq k lt.eq N^2 \, $ <eq:ta-padding-columns>]
  where $f_j$ is the $j$th extra coordinate vector and exactly half the $tau_(j \, k)$ equal $1$, half $- 1$. The parity requirement holds because $N$ is even. Their unsigned sum is
  $ sum_(j \, k) p_(j \, k) p_(j \, k)^T = mat(delim: "(", I - Sigma, 0; 0, I_J) . $
  Together with the extended data this is exactly the identity. Every padding squared norm is at most $2 \/ N^2$, so the maximum squared norm $Delta$ of the entire rational system satisfies $Delta lt.eq 3 r^(- 1 \/ 4)$. The number $\| B \| + J N^2$ of explicit columns and their binary lengths are polynomial, since $r lt.eq m$.
  Apply (5.1). Write $S$ for the augmented signed matrix, and distinguish the output signs $sigma_(j \, k)$ from the fixed construction signs $tau_(j \, k)$. Its lower principal block is
  $ D_0 = "diag" (N^(- 2) sum_k sigma_(1 \, k) \, dots.h \, N^(- 2) sum_k sigma_(J \, k)) . $
  The padding contribution to its upper principal block is exactly
  #[#set math.equation(numbering: n => "(5.8)")
   $ V D_0 V^T . $ <eq:ta-padding-removal>]
  If $parallel S parallel lt.eq T$, then $parallel D_0 parallel lt.eq T$ and $parallel V D_0 V^T parallel lt.eq T$. Subtracting the latter from the full upper block gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ ∥sum_(e in B) sigma_e a_e a_e^T∥ lt.eq 2 T . $ <eq:ta-data-signing>]
  No assertion about the signed off-diagonal block is needed.
  For a fully rational certificate, choose a dyadic $d_0$ with $sqrt(Delta) lt.eq d_0 lt.eq 2 sqrt(Delta)$ by squared comparisons and set $T = 2^15 d_0$. Check $T I - S succ.curly.eq 0$ and $T I + S succ.curly.eq 0$ exactly by rational elimination. Since $40 < 2^15$, the signing theorem guarantees that both tests pass. The certified output satisfies (5.9) and $T lt.eq 2^16 sqrt(Delta)$.
  Return the positive data signs $A = { e : sigma_e = 1 }$. By (5.5), (5.9), its centered half sum has norm at most
  $ 1 / 2 ∥sum_e sigma_e w_e w_e^T∥ lt.eq 4 T + frac(2, 100 r) lt.eq 2^20 r^(- 1 \/ 8) . $
  Thus one may take $C_s = 2^20$. The rational PSD tests have polynomial cost and certify all the required matrix estimates simultaneously. The signing algorithm and all numerical routines above have prescribed polynomial precision and iteration bounds. This proves deterministic polynomial bit complexity. ◻
]

== 6 Packing-preserving sparsification and the final tree <sec:iteration>

#thm([Lemma 6.1.])[
  (One sparsification step).  #emph[For all sufficiently large integers $r$, from an explicit graph $H$ containing $r$ disjoint spanning trees one can construct a subgraph $H' = \( V \( H \) \, A \)$ and an integer $r'$ such that 
#[#set math.equation(numbering: n => "(6.1)")
 $ & r \/ 4 lt.eq r' lt.eq r \/ 2 \, #h(2em) H' upright(" contains ") r' upright(" disjoint spanning trees") \,\
 & \| delta_(H') \( S \) \| lt.eq a_r \| delta_H \( S \) \| quad upright("for every cut") \, #h(2em) a_r = 1 / 2 + 3 C_s r^(- 1 \/ 8) \,\
 & frac(a_r, r' \/ r) lt.eq 1 + C_1 r^(- 1 \/ 16) $ <eq:ta-packing-halving>]

 for an absolute $C_1$. The construction is deterministic and takes polynomial bit time, with the certificate in 13.]
] <lem:ta-sparsification>

#proof[
  Use 7 and discard excess trees to obtain a union $B$ of $q$ trees with $\( 1 - A r^(- 1 \/ 16) \) r lt.eq q lt.eq r$. Increase the cutoff so $q gt.eq r \/ 2$, and apply Lemma 4.1, Lemma 5.2. Put $epsilon.alt_r = C_s r^(- 1 \/ 8)$. The two principal blocks of (5.3) give
  #[#set math.equation(numbering: n => "(6.2)")
   $ L_A prec.curly.eq 1 / 2 L_B + epsilon.alt_r X prec.curly.eq 1 / 2 L_H + epsilon.alt_r X \, #h(2em) sum_(e in A) z_e z_e^T succ.curly.eq \( 1 / 2 - epsilon.alt_r \) I . $ <eq:ta-two-blocks>]
  A centered cut indicator $x$ has $x x^T in cal(N)$. By (3.1), $x^T X x lt.eq 3 x^T L_H x$; evaluating the first inequality on $x$ proves (6.1).
  For packing, fix a partition into $d$ parts. Let $W$ be the span of all $z_e$ with endpoints in a common part, and let $Pi$ be the orthogonal projection onto $W^perp$. Rank preservation from 11 gives $dim W lt.eq sum_(P in cal(P)) \( \| P \| - 1 \) = n - d$, hence $"rank" Pi gt.eq d - 1$. Taking the trace after projection in the second inequality of (6.2), and then using (4.1), gives
  $ \( 1 / 2 - epsilon.alt_r \) \( d - 1 \) lt.eq sum_(e in E_A \( cal(P) \)) parallel Pi z_e parallel^2 lt.eq \| E_A \( cal(P) \) \| frac(1 + 4 \/ r, q) . $
  The integer packing criterion thus supplies at least
  #[#set math.equation(numbering: n => "(6.3)")
   $ ⌊frac(q \( 1 \/ 2 - epsilon.alt_r \), 1 + 4 \/ r)⌋ $ <eq:ta-projected-packing>]
  spanning trees in $H'$. Compute its maximum packing number, capped at $floor.l r \/ 2 floor.r$, by binary search with the constructive graphic-matroid union algorithm, and denote the result by $r'$. The lower bound in (6.3) is already at most $floor.l r \/ 2 floor.r$, so capping does not reduce that guarantee. Consequently
  $ r' / r gt.eq 1 / 2 \( 1 - C_2 r^(- 1 \/ 16) \) $
  for an absolute $C_2$, absorbing the floor loss $1 \/ r$, the extraction loss, and $epsilon.alt_r$. Taking a sufficiently large absolute cutoff gives (6.1). Dividing $a_r = 1 / 2 \( 1 + 6 epsilon.alt_r \)$ by this lower bound and enlarging the absolute constant proves (6.1). ◻
]

#proof[
  First suppose $n gt.eq 2$. Put $r_(upright("init")) = max { 1 \, floor.l k \/ 2 floor.r }$. For a partition into $d gt.eq 2$ parts, summing the $k$-edge-connectivity bounds on its parts gives $\| E_G \( cal(P) \) \| gt.eq k d \/ 2$. Thus (3.2) supplies $floor.l k \/ 2 floor.r$ trees, and connectedness supplies one when $k = 1$. Construct this initial packing. Notice that $r_(upright("init")) gt.eq k \/ 3$.
  Starting with $H_0 = G$ and $r_0 = r_(upright("init"))$, apply 14 whenever the current parameter is at least the fixed absolute cutoff $R_0$. Write $H_i \, r_i$ for the resulting sequence. At termination $1 lt.eq r_J < R_0$, and every $H_i$ remains connected. Return any spanning tree of $H_J$.
  The ratio estimate gives, for every cut,
  $ \| delta_(H_J) \( S \) \| & lt.eq \| delta_G \( S \) \| product_(i < J) a_(r_i)\
 & lt.eq \| delta_G \( S \) \| thin r_J / r_(upright("init")) product_(i < J) \( 1 + C_1 r_i^(- 1 \/ 16) \) . $
  Since $r_(i + 1) lt.eq r_i \/ 2$, reading the parameters backwards bounds
  $ sum_(i < J) r_i^(- 1 \/ 16) lt.eq R_0^(- 1 \/ 16) sum_(j gt.eq 0) 2^(- j \/ 16) . $
  Thus the product is bounded by one absolute constant, independently of the initial packing number. With $r_J < R_0$ and $r_(upright("init")) gt.eq k \/ 3$, the displayed estimate implies (1.1) for a universal $C$. The same calculation covers $J = 0$, with empty product one: in that case $r_(upright("init")) < R_0$ and any spanning tree suffices.
  There are at most $J_max = 1 + ceil.l log_2 \( m + 1 \) ceil.r$ iterations. Every iteration consists of deterministic polynomial-time routines, including the rational signing algorithm of 16. The arithmetic and precision bounds proved above ensure that all intermediate encodings and the total work remain polynomial in the explicit input length. When $n = 1$, return the empty tree before any packing or matrix call. ◻
]

===== 6.1 Binary multiplicities. <binary-multiplicities.>

It remains to reduce a succinct multigraph to an explicit one without work polynomial in the numerical value of $k$. For $n gt.eq 2$, let $c_(u v)$ be the binary multiplicity of the unordered pair $u v$ and set

#[#set math.equation(numbering: n => "(6.4)")
 $ c'_(u v) = min { c_(u v) \, k } \, #h(2em) a_(u v) = ⌊frac(2 n^2 c'_(u v), k)⌋ . $ <eq:ta-binary-reduction>]

Every nontrivial cut still has $c'$-capacity at least $k$: either one crossing pair already contributes $k$, or no crossing multiplicity was changed. Rounding loses less than one per crossing pair, of which there are at most $n^2 \/ 4$. Consequently the explicit graph $tilde(G)$ with multiplicities $a_(u v)$ satisfies

#[#set math.equation(numbering: n => "(6.5)")
 $ \| delta_(tilde(G)) \( S \) \| gt.eq 2 n^2 - n^2 \/ 4 gt.eq n^2 \, #h(2em) \| delta_(tilde(G)) \( S \) \| lt.eq frac(2 n^2, k) \| delta_G \( S \) \| . $ <eq:ta-binary-cuts>]

Each $a_(u v) lt.eq 2 n^2$ and there are fewer than $n^2 \/ 2$ pairs, so $\| E \( tilde(G) \) \| < n^4$. Apply the explicit algorithm with connectivity bound $n^2$. Its output tree is $C \/ n^2$-thin in $tilde(G)$, and hence $2 C \/ k$-thin in the original graph by (6.5). Although temporary scaling can make $a_(u v) > c_(u v)$, a tree uses at most one edge of any parallel pair. Every selected pair has $c_(u v) > 0$, so its tree edge maps to a genuine original edge. All arithmetic in (6.4) is polynomial in $log k$, the multiplicity encoding lengths, and $n$; the main routine uses the new parameter $n^2$. Enlarging the universal constant by two completes 1 in the binary model.

== 7 Simultaneous cost-and-cut rounding <sec:fractional-rounding>

The all-cut theorem also permits control of one nonnegative cost functional. The reduction combines the truncation and rounding in (6.4) with repeated deletion and selection of the least-cost tree, as in Oveis Gharan and Saberi #cite(label("OveisGharanSaberi2011")) full preprint, Proposition 5.1. The rational compression below keeps the auxiliary graph polynomial in the input bit length.

#thm([Corollary 7.1.])[
  (Thin and cheap rounding of fractional cuts).  #emph[Fix once and for all an integer $B gt.eq max { 1 \, C }$, where $C$ is the constant in Theorem 1. Let $G = \( V \, E \)$ be a finite undirected graph on $n gt.eq 2$ vertices, given by an explicit list of edge records; in this corollary, loops and parallel records are allowed. Given nonnegative rational numbers $x_e \, c_e$ in binary, suppose that 
$ x \( delta_G \( S \) \) := sum_(e in delta_G \( S \)) x_e gt.eq 1 #h(2em) \( diameter eq.not S subset.neq V \) . $

 There is a deterministic algorithm, polynomial in the total binary input length, that returns a spanning tree $T subset.eq { e in E : x_e > 0 }$ satisfying simultaneously 
#[#set math.equation(numbering: n => "(7.1)")
 $ \| delta_T \( S \) \| & lt.eq 24 B thin x \( delta_G \( S \) \) &  & \( diameter eq.not S subset.neq V \) \,\
c \( T \) := sum_(e in T) c_e & lt.eq 24 B sum_(e in E) c_e x_e . $ <eq:ta-fractional-cuts>]

 The cut inequalities are a promise on the input; no metric assumption on the costs is required.]
] <cor:ta-fractional-rounding>

#proof[
  Discard loops, which affect no cut and can only reduce the nonnegative cost sum. For each unordered nonloop pair $p$, let $E_p$ be its set of edge records and put $X_p = sum_(e in E_p) x_e$. Discard pairs with $X_p = 0$; otherwise choose an original edge $e_p$ with $x_(e_p) > 0$ of minimum cost among such edges, and put $d_p = c_(e_p)$. This preserves every cut mass and gives
  $ sum_p d_p X_p lt.eq sum_(e in E) c_e x_e . $
  Set $K = n^2$, $y_p = min { X_p \, 1 }$, and $a_p = floor.l 2 K y_p floor.r$. Form an explicit loopless multigraph $A$ with $a_p$ labelled copies of pair $p$, each of cost $d_p$. Every cut has $y$-mass at least one: if a crossing coordinate was truncated, that coordinate alone contributes one, and otherwise the cut mass is unchanged. A cut crosses at most $n^2 \/ 4$ unordered pairs, so rounding down loses at most $n^2 \/ 4$ from its scaled mass. Hence
  #[#set math.equation(numbering: n => "(7.2)")
   $ \| delta_A \( S \) \| & gt.eq 2 K - n^2 \/ 4 gt.eq K \,\
\| delta_A \( S \) \| & lt.eq 2 K thin x \( delta_G \( S \) \) \, #h(2em) c \( A \) := sum_p a_p d_p lt.eq 2 K sum_(e in E) c_e x_e . $ <eq:ta-fractional-lower>]
  Each $a_p lt.eq 2 n^2$, and fewer than $n^2 \/ 2$ pairs occur, so $\| E \( A \) \| < n^4$. In particular, $A$ is connected.
  If $K < 12 B$, select any spanning tree of $A$. Its load on each cut is at most that of $A$, and its cost is at most $c \( A \)$ by nonnegativity. Equation (7.2) and $2 K < 24 B$ therefore give both asserted bounds, including when the cost sum is zero.
  Suppose now that $K gt.eq 12 B$, and set $k = floor.l K \/ 2 floor.r$ and $m = floor.l K \/ \( 6 B \) floor.r$. Starting with $R_0 = A$, apply Theorem 1 with connectivity parameter $k$ to $R_i$, obtain a tree $T_i$, and delete its labelled edges to form $R_(i + 1)$, for $0 lt.eq i < m$. To verify that every call is legal, inductively we have, for all cuts and $0 lt.eq i lt.eq m$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| delta_(R_i) \( S \) \| gt.eq \( 1 - 3 B i \/ K \) \| delta_A \( S \) \| gt.eq 1 / 2 \| delta_A \( S \) \| . $ <eq:ta-fractional-residual>]
  Indeed, the second inequality follows from $m lt.eq K \/ \( 6 B \)$. Together with (7.2), it makes $R_i$ $k$-edge-connected before its call. Since $k gt.eq K \/ 3$, the returned tree obeys
  $ \| delta_(T_i) \( S \) \| lt.eq C / k \| delta_(R_i) \( S \) \| lt.eq frac(3 B, K) \| delta_A \( S \) \| \, $
  which proves the next instance of (7.3). Equation (7.2) then makes every $T_i$ at most $6 B$-thin relative to $x$. The trees are edge-disjoint in $A$, and $m gt.eq K \/ \( 12 B \)$ because $K \/ \( 6 B \) gt.eq 2$. Nonnegative costs therefore give
  $ min_(0 lt.eq i < m) c \( T_i \) lt.eq frac(c \( A \), m) lt.eq 24 B sum_(e in E) c_e x_e . $
  Select a least-cost $T_i$.
  In either case, a selected tree uses at most one copy of any parallel pair. Replace that copy by $e_p$. The resulting original edges still form a spanning tree, have the same cut loads and cost, and all have positive $x_e$. Different extracted trees may lift to the same original edge, which is harmless because only one tree is output.
  All pair sums, truncations, floors, and cost comparisons use exact rational or integer arithmetic of polynomial bit length; no common denominator is expanded into edge copies. The positive support is connected by the cut promise, so it contains at least $n - 1$ distinct nonloop pairs. Thus even if $n$ is encoded in binary, it is bounded by the length of the explicit input. There are $O \( n^2 \)$ calls on graphs with fewer than $n^4$ explicit edges and an $O \( log n \)$-bit parameter $k$. Deleting labelled copies, summing and comparing tree costs, and lifting the selected tree are polynomial-bit operations. Very small positive coordinates may round to zero, but (7.2) preserves connectivity. No division by $sum_e c_e x_e$ occurs; if this sum is zero, $c \( A \) = 0$ and the output cost is zero. This proves the stated bit bound and covers zero values. ◻
]

===== 7.1 The historical thin-and-cheap formulation. <the-historical-thin-and-cheap-formulation.>

The author full manuscript of Asadpour, Goemans, Mądry, Oveis Gharan, and Saberi defines an $\( alpha \, s \)$-thin tree for a point $z$ in a spanning-tree polytope by the all-cut bound $\| delta_T \( S \) \| lt.eq alpha z \( delta \( S \) \)$ and the cost bound $c \( T \) lt.eq s c \( z \)$, with $alpha gt.eq 1$. Its Conjecture 6.1 asks for absolute constants and a polynomial-time construction for every feasible Held–Karp solution #cite(label("AsadpourEtAl2017")) author full manuscript, Definition 4.1 and Conjecture 6.1.

For rational data on $n gt.eq 2$ vertices in that paper’s directed-metric setting, let $h$ be a feasible Held–Karp vector and use its normalized symmetrization

$ z_({ u \, v }) = frac(n - 1, n) \( h_(u v) + h_(v u) \) $

from equation (3.5) of the full manuscript. The feasibility calculation in the proof of its Lemma 3.1 puts $z$ in the corresponding spanning-tree polytope #cite(label("AsadpourEtAl2017")) author full manuscript, equation (3.5) and proof of Lemma 3.1. In particular, flow balance and the cut constraint give

$ z \( delta \( S \) \) = frac(2 \( n - 1 \), n) h \( delta^(+) \( S \) \) gt.eq frac(2 \( n - 1 \), n) gt.eq 1 . $

For each support pair $p = { u \, v }$, set $d_p = min { c_(u v) \, c_(v u) }$, the cost of the cheaper of both orientations. Its induced fractional cost satisfies

$ c \( z \) = sum_p d_p z_p lt.eq frac(n - 1, n) sum_a c_a h_a . $

Apply Corollary 15 with $x = z$ and costs $d_p$. With the same cost function on the tree and the fractional point, the corollary gives $c \( T \) lt.eq 24 B c \( z \)$ and the required all-cut bound. It therefore supplies the two $\( 24 B \, 24 B \)$ inequalities on the undirected support, with deterministic polynomial-bit construction for rationally encoded data. The cheaper orientation of a selected pair need not have positive $h$-value; the support requirement is $z_p > 0$. More generally, every rational point in a spanning-tree polytope satisfies the cut promise, since each constituent spanning tree meets every nontrivial cut. The bit guarantee here is not a claim for arbitrary real-oracle inputs.

The earlier SODA version instead fixes an optimum Held–Karp solution and defines its cost bound as $c \( T \) lt.eq s thin O P T_(upright("HK"))$ in Definition 5.1; its Theorem 6.1 is the tour-augmentation theorem, not the full-manuscript conjecture #cite(label("AsadpourEtAl2010")) Definition 5.1 and Theorem 6.1. Constant-factor approximation for ATSP was already established independently by Svensson, Tarnawski, and Végh and improved by Traub and Vygen #cite(label("SvenssonTarnawskiVegh2020")) #cite(label("TraubVygen2022")). The consequence proved here concerns the underlying simultaneous rounding formulation; no new approximation-order claim is made.

== 8 A finite-bit signing interface <app:signing>

We record a conservative quantitative form of the rank-one signing method of Ezeunala and Jiang #cite(label("EzeunalaJiang2026")). The constants below suffice for the exact padding argument. We include their accounting and the finite-precision implementation to make the input interface explicit.

#thm([Theorem 8.1.])[
  (Rational rank-one signing).  #emph[Given rational Hermitian matrices $H_1 \, dots.h \, H_N$ of rank at most one, a deterministic algorithm returns signs $sigma_i in { - 1 \, 1 }$ such that 
$ ∥sum_i sigma_i H_i∥ lt.eq 40 ∥sum_i H_i^2∥^(1 \/ 2) . $

 Its running time is polynomial in the total binary encoding length. Consequently, for rational columns $v_i$ with $sum_i v_i v_i^(*) = I$, the same algorithm gives discrepancy at most $40 sqrt(max_i parallel v_i parallel^2)$.]
] <thm:rational-signing>

The last assertion follows from $\( v_i v_i^(*) \)^2 = parallel v_i parallel^2 v_i v_i^(*)$ and positivity. Forming the outer products has polynomial bit cost. We prove the matrix assertion next.

=== 8.1 The potential and its quantitative estimates <the-potential-and-its-quantitative-estimates>

In dimension zero, any signs suffice. Otherwise discard zero matrices; if none remain, any signs again suffice. A nonzero rank-one Hermitian matrix has one nonzero eigenvalue, equal to its trace. With $D = sum_i \| "Tr" H_i \|$, put

$ A_i = D^(- 1) "sign" \( "Tr" H_i \) H_i \, #h(2em) nu_0 = ∥sum_i A_i^2∥ . $

These are rational positive semidefinite matrices and $sum_i "Tr" A_i = 1$. Matrix Cauchy–Schwarz gives $1 \/ \( N d^2 \) lt.eq nu_0 lt.eq 1$, where $d$ is the matrix order. Rational positive-semidefiniteness tests and bisection compute rational parameters

$ nu_0 lt.eq nu lt.eq min { 1 \, 1.001 nu_0 } \, #h(2em) epsilon = nu \/ d \, #h(2em) frac(sqrt(nu), 200 N) lt.eq lambda lt.eq frac(sqrt(nu), 100 N) . $

Set $c = 384$, $K = 100$, and $sigma = lambda^2 \/ nu$. Thus $epsilon gt.eq 1 \/ \( N d^3 \)$ and $1 \/ \( 40000 N^2 \) lt.eq sigma lt.eq 1 \/ \( 10000 N^2 \)$.

For $x in \[ - 1 \, 1 \]^N$, let

$ S \( x \) = sum_i x_i A_i \, quad psi_i = \( 1 - x_i^2 \)^(1 \/ 3) \, quad eta_x \( Z \) = c sum_i psi_i A_i Z A_i . $

Define $R \( x \)$ as the minimum of $t + epsilon "Tr" \( X + Y \)$ over $X \, Y succ 0$ subject to

#[#set math.equation(numbering: n => "(8.1)")
 $ X^(- 1) + S \( x \) + eta_x \( Y \) prec.curly.eq t I \, #h(2em) Y^(- 1) - S \( x \) + eta_x \( X \) prec.curly.eq t I \, $ <eq:sign-potential>]

and put $Psi \( x \) = R \( x \) + lambda sum_i psi_i$.

The variational argument of Ezeunala and Jiang #cite(label("EzeunalaJiang2026")) Section 4.1 uses only $c > 0$ and gives

#[#set math.equation(numbering: n => "(8.2)")
 $ parallel S \( x \) parallel lt.eq R \( x \) lt.eq parallel S \( x \) parallel + 2 sqrt(\( c + 2 \) nu) \, #h(2em) Psi \( 0 \) lt.eq \( 2 sqrt(386) + 0.01 \) sqrt(nu) . $ <eq:sign-potential-bound>]

For clarity, its quantitative ingredients are as follows. The minimizer is unique; with its positive definite dual multipliers $P \, Q$ it satisfies

#[#set math.equation(numbering: n => "(8.3)")
 $ \( 2 K \)^(- 1) I prec.curly.eq X \, Y prec.curly.eq \( K \/ epsilon \) I \, quad P \, Q prec.curly.eq I \, quad "Tr" \( P + Q \) = 1 \,\
P = X eta_x \( Q \) X + epsilon X^2 \, #h(2em) Q = Y eta_x \( P \) Y + epsilon Y^2 \, $ <eq:sign-dual>]

and both inequalities in (8.1) are tight. Indeed, the scalar choice $X = Y = a I$ proves the upper bound in (8.2); its value is below $42 < K$. On the sublevel set of objective at most $K$, the constraints bound the inverse matrices and the trace penalty bounds $X \, Y$. Compactness gives attainment. Stationarity gives (8.3); positive dual multipliers imply tightness. Strict convexity of $"Tr" \( P X^(- 1) \) + "Tr" \( Q Y^(- 1) \)$ gives uniqueness.

On pairs of Hermitian matrices define

$ cal(L) \( U \, V \) = \( X^(- 1) U X^(- 1) - eta_x \( V \) \, thin Y^(- 1) V Y^(- 1) - eta_x \( U \) \) . $

The positive-map argument of #cite(label("EzeunalaJiang2026")) Claim 4.1 yields the following bound, with the Frobenius norm specified explicitly:

#[#set math.equation(numbering: n => "(8.4)")
 $ parallel cal(L)^(- 1) parallel lt.eq epsilon^(- 1) \, #h(2em) cal(L) \( P \, Q \) = epsilon \( I \, I \) . $ <eq:sign-L>]

All operator norms on spaces of matrix pairs here are induced by the Frobenius norm. To verify the norm bound, write $cal(L) = cal(C) \( I - cal(T) \)$, where

$ cal(C) \( U \, V \) = \( X^(- 1) U X^(- 1) \, Y^(- 1) V Y^(- 1) \) \, #h(2em) cal(T) \( U \, V \) = \( X eta_x \( V \) X \, Y eta_x \( U \) Y \) . $

Both $cal(T)$ and $cal(C)^(- 1)$ preserve positive semidefinite matrix pairs. The dual identities give

$ cal(T) \( P \, Q \) = \( P \, Q \) - epsilon \( X^2 \, Y^2 \) . $

Since all four matrices are positive definite, there is a $delta > 0$ such that the right side is at most $\( 1 - delta \) \( P \, Q \)$ in componentwise Loewner order. Thus $cal(T)$ is a strict contraction in the norm

$ parallel \( U \, V \) parallel_(P \, Q) = inf { s gt.eq 0 : - s \( P \, Q \) prec.curly.eq \( U \, V \) prec.curly.eq s \( P \, Q \) } . $

The convergent series $cal(L)^(- 1) = sum_(j gt.eq 0) cal(T)^j cal(C)^(- 1)$ is positive. Its value on $\( I \, I \)$ is $\( P \, Q \) \/ epsilon prec.curly.eq \( I \, I \) \/ epsilon$. Consequently its induced norm for $parallel \( U \, V \) parallel_max = max { parallel U parallel_(upright("op")) \, parallel V parallel_(upright("op")) }$ is at most $epsilon^(- 1)$. Finally, $cal(L)$ and its inverse are self-adjoint for the Frobenius pairing. The Frobenius operator norm of $cal(L)^(- 1)$ therefore equals its spectral radius, which is bounded by every induced norm. This proves (8.4).

The Hessian $cal(H)$ of the Lagrangian in $\( X \, Y \)$ satisfies

#[#set math.equation(numbering: n => "(8.5)")
 $ frac(2 epsilon^2, K) I prec.curly.eq cal(H) \, #h(2em) parallel cal(H) parallel lt.eq 16 K^3 . $ <eq:sign-H>]

The lower bound follows by substituting $P succ.curly.eq epsilon X^2$ in $2 "Tr" \( P X^(- 1) U X^(- 1) U X^(- 1) \)$ and using $X^(- 1) succ.curly.eq \( epsilon \/ K \) I$; the other block is identical. The upper bound uses three inverse factors of norm at most $2 K$ in each of the two terms of a Hessian block.

=== 8.2 A quantified direction of decrease <a-quantified-direction-of-decrease>

A coordinate is active when $\| x_i \| < 1$; let $n$ be their number. In the following differential calculations, vectors and derivatives are restricted to these coordinates, with the other coordinates fixed on the current open face. Write $A_i = u_i u_i^(*)$ in this analysis and set

$ a_i = u_i^(*) X u_i \, quad b_i = u_i^(*) Y u_i \, quad p_i = u_i^(*) P u_i \, quad q_i = u_i^(*) Q u_i . $

The factors $u_i$ need not be rational: the algorithm below uses only the rational matrices $A_i$. If $c psi_i b_i gt.eq 1 - x_i$, moving $x_i$ to $1$ preserves feasibility in (8.1) with the same $\( t \, X \, Y \)$ and decreases $Psi$ by at least $lambda psi_i$. The symmetric condition $c psi_i a_i gt.eq 1 + x_i$ permits the move to $- 1$. We may therefore assume

#[#set math.equation(numbering: n => "(8.6)")
 $ c psi_i a_i < 1 + x_i \, #h(2em) c psi_i b_i < 1 - x_i quad upright("for all active ") i . $ <eq:sign-light>]

Put $alpha_i = 1 + c psi'_i b_i$, $beta_i = 1 - c psi'_i a_i$, and

$ T_i^2 = alpha_i beta_i \/ psi_i \, quad ell_i = alpha_i \/ T_i \, quad m_i = beta_i \/ T_i \, #h(2em) tilde(a)_i = ell_i a_i \, quad tilde(b)_i = m_i b_i \, quad z_i = ell_i p_i \, quad w_i = m_i q_i . $

For $k_i = - psi''_i$, elementary substitution in (8.6) gives

#[#set math.equation(numbering: n => "(8.7)")
 $ frac(k_i, alpha_i beta_i) gt.eq 1 / 3 \, quad k_i / T_i^2 gt.eq 1 / 3 \, quad T_i^(- 2) lt.eq 3 / 2 \, quad frac(\| psi'_i \|, psi_i k_i) lt.eq 1 \, quad tilde(a)_i tilde(b)_i lt.eq c^(- 2) \, quad tilde(a)_i^2 \, tilde(b)_i^2 lt.eq 3 c^(- 2) . $ <eq:sign-scalar>]

Here is a direct check. By symmetry take $x_i gt.eq 0$ and put $r = 1 - x_i^2$. Then $2 \/ 3 lt.eq alpha_i beta_i lt.eq 2 \/ r$ and $k_i = \( 2 \/ 3 \) r^(- 5 \/ 3) \( 1 + x_i^2 \/ 3 \)$. Also $tilde(a)_i tilde(b)_i = psi_i a_i b_i lt.eq r^(2 \/ 3) \/ c^2$. For $u = c psi_i a_i \/ \( 1 + x_i \)$ and $v = c psi_i b_i \/ \( 1 - x_i \)$ in $\( 0 \, 1 \)$,

$ c^2 tilde(a)_i^2 = r^(2 \/ 3) u^2 frac(1 + x_i - 2 x_i v \/ 3, 1 - x_i + 2 x_i u \/ 3) \, #h(2em) c^2 tilde(b)_i^2 = r^(2 \/ 3) v^2 frac(1 - x_i + 2 x_i u \/ 3, 1 + x_i - 2 x_i v \/ 3) . $

Maximizing the first in $u$ and minimizing $v$, and maximizing the second in $u \, v$, bounds them by $3$ and $1$. For negative $x_i$ the roles interchange. These formulas also prove the remaining assertions of (8.7).

We quantify the covariance construction in #cite(label("EzeunalaJiang2026")) Lemma 4.5. Define the real symmetric, entrywise nonnegative positive semidefinite matrices

$ sans(A)_(i j) = c ell_i ell_j \| u_i^(*) X u_j \|^2 \, #h(2em) sans(B)_(i j) = c m_i m_j \| u_i^(*) Y u_j \|^2 \, $

and $D_F = "diag" \( tilde(a)_i z_i \)$, $D_G = "diag" \( tilde(b)_i w_i \)$. The dual identities give $sans(A) w lt.eq z$ and $sans(B) z lt.eq w$ coordinatewise. Moreover,

$ parallel D_G^(1 \/ 2) sans(A) D_F^(- 1 \/ 2) parallel_F^2 lt.eq n \/ c \, #h(2em) parallel D_F^(1 \/ 2) sans(B) D_G^(- 1 \/ 2) parallel_F^2 lt.eq n \/ c . $

For example, $sans(A)_(i j)^2 lt.eq c tilde(a)_i tilde(a)_j sans(A)_(i j)$ and $tilde(a)_i tilde(b)_i lt.eq c^(- 2)$ bound the first sum by $c^(- 1) sum_j \( sans(A) w \)_j \/ z_j$.

Restrict $D_F^(1 \/ 2) F$ and $D_G^(1 \/ 2) G$ to right singular directions with singular value at most $1 \/ 2$ for these two maps. Each restriction has codimension at most $4 n \/ c$. Impose also $\( I - sans(A) \) F + \( I - sans(B) \) G = 0$. The resulting subspace $cal(G) subset.eq bb(R)^(2 n)$ has dimension at least $n - 8 n \/ c$. The covariance theorem of Bansal and Garg #cite(label("BansalGarg2017")) Theorem 6, in the form stated by Bansal #cite(label("Bansal2024")) Theorem 2.5 and recalled in #cite(label("EzeunalaJiang2026")) Lemma 2.1, supplies a positive semidefinite $Gamma$ with

$ "range" Gamma subset.eq cal(G) \, quad Gamma prec.curly.eq 4 "diag" Gamma \, quad Gamma_(j j) lt.eq 1 \, quad "Tr" Gamma gt.eq \( 1 \/ 2 - 8 \/ c \) n = 23 n \/ 48 . $

Take a centered finitely supported $\( F \, G \)$ with covariance $Gamma$ and set $H = F - sans(B) G = sans(A) F - G$, $h_i = H_i \/ T_i$, and $omega_i = bb(E) H_i^2$. The two singular-value restrictions give

$ parallel F parallel_(D_F)^2 + parallel G parallel_(D_G)^2 lt.eq 4 sum_i \( tilde(a)_i z_i + tilde(b)_i w_i \) H_i^2 . $

The response matrices are $dot(X) = X \( sum_i ell_i F_i A_i \) X$ and $dot(Y) = Y \( sum_i m_i G_i A_i \) Y$. The diagonal of their inversion-energy quadratic form

$ E_h = "Tr" \( P X^(- 1) dot(X) X^(- 1) dot(X) X^(- 1) \) + "Tr" \( Q Y^(- 1) dot(Y) Y^(- 1) dot(Y) Y^(- 1) \) $

is $\( D_F \, D_G \)$. Hence

#[#set math.equation(numbering: n => "(8.8)")
 $ bb(E) E_h lt.eq 16 sum_i \( tilde(a)_i z_i + tilde(b)_i w_i \) omega_i . $ <eq:sign-energy>]

We expand the first and second variation calculation of #cite(label("EzeunalaJiang2026")) Lemma 4.3 and its proof to obtain

$ partial_i R = T_i \( z_i - w_i \) \, #h(2em) h^T nabla^2 R h lt.eq 3 E_h - c / 2 sum_i k_i h_i^2 \( b_i p_i + a_i q_i \) . $

The first identity is the envelope formula $partial_i R = alpha_i p_i - beta_i q_i$. For the second, keep $t$ fixed and replace $x$ by $x + tau h$. Invertibility of $cal(L)$ and the implicit function theorem give a local curve $\( X \( tau \) \, Y \( tau \) \)$ satisfying both tight constraints. Its first derivatives are the response matrices above: the identities $H = F - sans(B) G = sans(A) F - G$ verify the linearized constraints. This curve stays positive definite for small $tau$, and its objective bounds $R \( x + tau h \)$ from above with equality at $tau = 0$. Differentiating twice and pairing with $P \, Q$, using $cal(L) \( P \, Q \) = epsilon \( I \, I \)$, therefore gives

$ h^T nabla^2 R h & lt.eq 2 E_h - c sum_i k_i h_i^2 \( b_i p_i + a_i q_i \)\
 & quad + 2 c sum_i psi'_i h_i #scale(x: 120%, y: 120%)[\(] q_i u_i^(*) dot(X) u_i + p_i u_i^(*) dot(Y) u_i #scale(x: 120%, y: 120%)[\)] . $

Write $E_X \, E_Y$ for the two summands of $E_h$. Since $P succ.curly.eq X eta_x \( Q \) X$,

$ E_X gt.eq "Tr" \( eta_x \( Q \) dot(X) X^(- 1) dot(X) \) = c sum_i psi_i q_i u_i^(*) dot(X) X^(- 1) dot(X) u_i . $

The inequality $\| u_i^(*) dot(X) u_i \|^2 lt.eq a_i u_i^(*) dot(X) X^(- 1) dot(X) u_i$ and weighted Cauchy–Schwarz bound the $X$ mixed sum by

$ lr(|c sum_i psi'_i h_i q_i u_i^(*) dot(X) u_i|) lt.eq sqrt(E_X B_X) \, #h(2em) B_X = c sum_i \( psi'_i \)^2 psi_i^(- 1) h_i^2 a_i q_i . $

The corresponding $Y$ bound uses $B_Y = c sum_i \( psi'_i \)^2 psi_i^(- 1) h_i^2 b_i p_i$. Thus the full mixed term is at most $2 sqrt(E_h B_h)$, where $B_h = B_X + B_Y$. Finally, $\( psi'_i \)^2 \/ \( psi_i k_i \) lt.eq 1 \/ 2$ gives $B_h lt.eq \( c \/ 2 \) sum_i k_i h_i^2 \( b_i p_i + a_i q_i \)$, and $2 sqrt(E_h B_h) lt.eq E_h + B_h$ proves the asserted Hessian bound.

Let $Sigma = bb(E) h h^T$ and choose $mu_i = - 24 T_i^(- 1) \( tilde(a)_i - tilde(b)_i \) omega_i$. Using (8.7) and (8.8), the operator $cal(D) f = nabla f dot.op mu + 1 / 2 "Tr" \( nabla^2 f Sigma \)$ satisfies

$ cal(D) R & lt.eq \( 24 - c \/ 12 \) sum_i \( tilde(a)_i w_i + tilde(b)_i z_i \) omega_i lt.eq 0 \,\
cal(D) #scale(x: 180%, y: 180%)[\(] sum_i psi_i #scale(x: 180%, y: 180%)[\)] & lt.eq - (1 / 2 - 48 / c) sum_i frac(k_i omega_i, T_i^2) lt.eq - 1 / 8 sum_i omega_i . $

The first line uses cancellation of $24 sum_i \( tilde(a)_i z_i + tilde(b)_i w_i \) omega_i$ by the drift. For the second, the identity $T_i \( tilde(a)_i + tilde(b)_i \) = a_i + b_i$ and (8.6) give $\| psi'_i mu_i \| lt.eq \( 48 \/ c \) k_i omega_i \/ T_i^2$.

All movement bounds are polynomial and uniform in the state. Indeed (8.3) gives

$ sans(A) w lt.eq \( 1 - s_0 \) z \, quad sans(B) z lt.eq \( 1 - s_0 \) w \, quad s_0 = epsilon \/ \( 4 K^2 \) \, quad parallel sans(A) parallel \, parallel sans(B) parallel lt.eq 3 N . $

The spectral radius of $sans(A) sans(B)$ is at most $\( 1 - s_0 \)^2$. Using its positive semidefinite conjugate yields

$ parallel \( I - sans(A) sans(B) \)^(- 1) parallel \, parallel \( I - sans(B) sans(A) \)^(- 1) parallel lt.eq J := 1 + 36 K^2 N^2 \/ epsilon . $

Solving the two response equations gives $parallel F parallel^2 + parallel G parallel^2 lt.eq E_0 parallel H parallel^2$, where $E_0 = 2 J^2 \( 1 + 3 N \)^2$. Consequently, with

$ C_1 = max { 1 \, 48 E_0 \/ 23 \, 4 \( 1 + 9 N^2 \) } \, #h(2em) C_0 = 8 C_1 \, $

we have $sum_i omega_i gt.eq n \/ C_1$, $omega_i lt.eq C_1$ and

#[#set math.equation(numbering: n => "(8.9)")
 $ parallel mu parallel_oo lt.eq C_0 \, quad "Tr" Sigma lt.eq C_0 n \, quad cal(D) Psi lt.eq - lambda n \/ C_0 . $ <eq:sign-progress>]

This proves a quantitative descent alternative for $c = 384$. The covariance and drift are used only to prove that a direction of decrease exists. The algorithm below computes neither of them nor the possibly irrational spectral subspaces used in their construction.

Here is the deterministic alternative that the algorithm will use. Suppose at least one coordinate is active, every active coordinate is farther than $sigma$ from its endpoints, and put $a = lambda \/ \( 8 C_0^2 \)$. Either an endpoint test above succeeds, giving a decrease of at least $lambda sigma$, or

#[#set math.equation(numbering: n => "(8.10)")
 $ parallel nabla Psi \( x \) parallel_oo gt.eq a quad upright("or") quad lambda_min \( nabla^2 Psi \( x \) \) lt.eq - 8 a . $ <eq:sign-deterministic-alternative>]

The endpoint estimate uses $psi_i gt.eq sigma$. If all endpoint tests fail, (8.6) holds and the preceding calculation applies. If also $parallel nabla Psi parallel_oo < a$, then $nabla Psi dot.op mu gt.eq - a C_0 n$, whereas $cal(D) Psi lt.eq - lambda n \/ C_0 = - 8 a C_0 n$. Hence

$ 1 / 2 "Tr" \( nabla^2 Psi thin Sigma \) lt.eq - 7 a C_0 n . $

Together with $"Tr" Sigma lt.eq C_0 n$, this gives a Hessian eigenvalue at most $- 14 a$, and therefore the asserted $- 8 a$ bound. The remaining task is to find one of these decreases using rational value queries.

=== 8.3 Uniform derivatives and a rational value oracle <uniform-derivatives-and-a-rational-value-oracle>

We next make the descent computable. On any open face, let $z = \( t \, X \, Y \, P \, Q \)$ and write its tight constraints and stationarity equations as $F \( x \, z \) = 0$. The source’s smoothness proof #cite(label("EzeunalaJiang2026")) Section 4.1 applies to our parameters. Here we record a uniform quantitative bound. Write $B = cal(L)^(- 1)$ and $E = \( I \, I \)$. An inhomogeneous linearized system has the form

$ cal(L) u + h E = f \, #h(2em) cal(L) p - cal(H) u = g \, #h(2em) chevron.l E \, p chevron.r = r . $

Eliminating $u \, p$ determines $h$ with denominator $chevron.l B E \, cal(H) B E chevron.r$. By (8.4), $B E = \( P \, Q \) \/ epsilon$; thus

$ parallel B E parallel_F lt.eq epsilon^(- 1) \, #h(2em) chevron.l B E \, cal(H) B E chevron.r gt.eq frac(2 epsilon^2, K) parallel B E parallel_F^2 gt.eq frac(1, K d) . $

The last inequality uses $parallel P parallel_F^2 + parallel Q parallel_F^2 gt.eq 1 \/ \( 2 d \)$. The upper bound uses $"Tr" \( P + Q \) = 1$ and positivity. Back substitution in the three equations and (8.4)–(8.5) bound the complete Jacobian inverse by a constant times $\( d + 1 \) \( 1 + epsilon^(- 1) \)^4$.

When every active coordinate is at least $sigma \/ 2$ from its endpoints, the first three derivatives of $psi_i$ are bounded by $100 \( 2 \/ sigma \)^3$. All derivatives of $F$ through order three are therefore bounded by a computable polynomial in $N \, d \, epsilon^(- 1) \, sigma^(- 1)$. Three implicit differentiations give a uniform polynomial bound $M gt.eq 1$ for both $parallel nabla^2 Psi parallel$ and $parallel nabla^3 Psi parallel$ on these strips. There is no dependence on the number of faces. For an explicit choice, let

$ A = 10^18 \( d + 1 \) \( 1 + epsilon^(- 1) \)^4 \,\
D_(*) = 10^20 \( N + 1 \)^3 \( d + 1 \)^3 \( 1 + epsilon^(- 1) \)^3 \( 1 + sigma^(- 1) \)^3 \,\
Z_1 = A D_(*) \, quad Z_2 = A D_(*) \( 1 + Z_1 \)^2 \, quad Z_3 = A D_(*) #scale(x: 120%, y: 120%)[\(] \( 1 + Z_1 \)^3 + 3 \( 1 + Z_1 \) Z_2 #scale(x: 120%, y: 120%)[\)] \,\
M = ⌈1 + \( 1 + 2 d epsilon \) \( Z_2 + Z_3 \) + 800 lambda N sigma^(- 3)⌉ . $

The product rule, the inverse bound $2 K$, and Frobenius product inequalities verify these deliberately loose bounds.

A value of $Psi$ to additive accuracy $eta > 0$ is computable in polynomial time in the input length and $log eta^(- 1)$. Approximate every $psi_i$ by a nonnegative rational in $\[ 0 \, 1 \]$ to error $delta$. This changes the optimal value by at most $\( c K d + lambda N \) delta$: in either direction, increase $t$ by $c K d delta$ to absorb the perturbation of the matrix constraints. Indeed, $sum_i A_i^2 prec.curly.eq nu I$ and $parallel Y parallel lt.eq K \/ epsilon$ bound the change in $eta_x \( Y \)$ by $c delta nu parallel Y parallel lt.eq c delta nu K \/ epsilon = c K d delta$; the other block is identical. The resulting rational program is a semidefinite program by the Schur-complement formula. Impose the rational bounds

$ I \/ 400 prec.curly.eq X \, Y prec.curly.eq \( 200 \/ epsilon \) I \, #h(2em) 0 lt.eq t lt.eq 100 . $

The scalar upper bound and sublevel estimates hold for every coefficient vector in $\[ 0 \, 1 \]^N$, so these boxes contain the minimizers both before and after approximation. The preceding comparison of unboxed optimal values therefore applies to the boxed programs as well. The point $X = Y = I \/ 20$, $t = 50$ has constraint slack at least $50 - 20 - 2 - 384 \/ 20 = 8.8$ and lies strictly inside the bounds. It supplies an inverse-polynomial interior radius: each Schur block dominates $mat(delim: "(", 28.8 I, I; I, 0.05 I) succ.curly.eq I \/ 100$, since subtracting $I \/ 100$ leaves the scalar determinant $28.79 dot.op 0.04 - 1 = 0.1516 > 0$. In upper-triangular real and imaginary coordinates, a ball of radius $10^(- 6)$ preserves this margin and all the boxes: a matrix-pair perturbation changes either Schur block by at most $\| Delta t \| + 384 parallel Delta Y parallel_F + parallel Delta X parallel_F$ or its symmetric counterpart. An outer radius $400 \( d + 1 \) \/ epsilon$ suffices. Rational weak optimization #cite(label("GLS1988")) therefore evaluates the rational program to error $eta \/ 2$ in polynomial work. Choosing $delta lt.eq eta \/ \[ 2 \( c K d + lambda N \) \]$ gives the claimed oracle. Rational bisection computes the cube roots. This value oracle also works on lower-dimensional faces and at vertices.

=== 8.4 Rational descent and termination <rational-descent-and-termination>

At the start of an iteration, move every active coordinate at distance $z lt.eq sigma$ from its nearest endpoint to that endpoint. This never increases the exact potential, since

$ Delta Psi lt.eq z sqrt(nu) - lambda \[ z \( 2 - z \) \]^(1 \/ 3) lt.eq z sqrt(nu) - lambda sqrt(z) lt.eq 0 . $

There are at most $N$ such permanent freezes. Every remaining active coordinate is more than $sigma$ from either endpoint. If none remain, return the resulting vertex; all derivative and direction computations below are performed only when $n gt.eq 1$.

With $a = lambda \/ \( 8 C_0^2 \)$ as above, choose positive powers of two $s \, h$, each within a factor two below its indicated bound, with

$ s lt.eq min { sigma \/ 4 \, a \/ \( 4 M \) \, 1 \/ 4 } \, #h(2em) h lt.eq min { sigma \/ 8 \, 1 \, a \/ \( 64 M N \) } \, #h(2em) Delta = a s^2 . $

Central first differences, central diagonal second differences, and four-corner mixed second differences of the value oracle, each query to error at most $a h^2 \/ \( 128 N \)$, give rational approximations $hat(g) \, hat(H)$ to $nabla Psi \, nabla^2 Psi$ satisfying

$ parallel hat(g) - nabla Psi parallel_oo < a \/ 8 \, #h(2em) parallel hat(H) - nabla^2 Psi parallel < a \/ 16 . $

Taylor’s theorem and the third-derivative bound prove these estimates; all stencil points stay in the $sigma \/ 2$ strips.

Consider all $2 n$ single-coordinate endpoint moves and the coordinate move $x - s "sign" \( hat(g)_i \) e_i$, where $\| hat(g)_i \|$ is maximal. Test the rational matrix $hat(H) + 7 a I$ for positive semidefiniteness by exact elimination. If it fails, elimination supplies a nonzero rational vector of negative quadratic form. Set $beta = a \/ \( 4096 M \)$ and $tau = a \/ \( 1024 M \)$ and normalize that vector, using a rational upper approximation to its norm, to obtain $w$ with $1 - beta lt.eq parallel w parallel lt.eq 1$. Its Rayleigh quotient for $hat(H)$ is strictly below $- 7 a$. Choose $rho$ as the largest dyadic power at most $s a \/ \( 4096 M N \)$; it divides the dyadic $s$. Round $s \( 1 - tau \) w$ to $rho bb(Z)^n$ to obtain $q$. The rounding error is at most $sqrt(n) rho \/ 2 lt.eq s tau \/ 8$, so $parallel q parallel lt.eq s$ and $parallel q - s w parallel lt.eq 9 s tau \/ 8$. The negative-direction certificate and the Hessian error bound give

$ w^T nabla^2 Psi thin w < - 111 / 16 a \( 1 - beta \)^2 \, #h(2em) \| q^T nabla^2 Psi thin q - s^2 w^T nabla^2 Psi thin w \| lt.eq 9 / 4096 a s^2 . $

In particular,

$ q^T nabla^2 Psi thin q lt.eq - 6 a s^2 . $

Include both $x + q$ and $x - q$. If the positive-semidefiniteness test passes, omit these two candidates. Whenever $lambda_min \( nabla^2 Psi \) lt.eq - 8 a$, the test necessarily fails, so a curvature candidate is available when it is needed. The two displacements are exact negatives, so their linear Taylor terms cancel.

By (8.10), one candidate decreases the true potential by at least $2 Delta$. An available endpoint move gives a decrease at least $lambda sigma gt.eq 2 Delta$. In the remaining case, if $parallel nabla Psi parallel_oo gt.eq a$, the selected coordinate has the correct sign and derivative magnitude at least $3 a \/ 4$, giving decrease at least $\( 3 \/ 4 \) a s - M s^2 \/ 2 gt.eq \( 5 \/ 8 \) a s gt.eq \( 5 \/ 2 \) Delta$. Otherwise (8.10) gives $lambda_min \( nabla^2 Psi \) lt.eq - 8 a$; averaging the two curvature candidates gives decrease at least $3 a s^2 - M s^3 \/ 6 > 2 Delta$. Evaluate all final candidates to error $Delta \/ 4$ and choose the smallest reported value. Selection loses at most $Delta \/ 2$ against the best true candidate. Every accepted step thus decreases the exact potential by at least $3 Delta \/ 2$.

Starting from $x = 0$, every live coordinate stays on the fixed mesh $rho bb(Z)$; frozen coordinates equal $plus.minus 1$. All coordinates, parameters, and query points have polynomial encoding length. There are at most $Psi \( 0 \) \/ Delta$ main iterations, each with polynomially many rational semidefinite value queries and one exact rational positive-semidefiniteness test. The normalized lower bounds on $nu$, $epsilon$, $lambda$, and $sigma$ imply that $C_0$ and $M$ are bounded by fixed polynomials in $N + d$. In turn, $a$ and the chosen $s \, h$ are bounded below by fixed inverse polynomials, as is $Delta = a s^2$. Since $Psi \( 0 \) < 40$, the iteration count is polynomial as well. Together with the encoding and oracle bounds, this proves deterministic polynomial bit complexity on every execution.

At the final vertex $x^f$, the coordinate term vanishes and (8.2) gives

$ ∥sum_i x_i^f A_i∥ lt.eq \( 2 sqrt(386) + 0.01 \) sqrt(nu) lt.eq \( 2 sqrt(386) + 0.01 \) sqrt(1.001 nu_0) < 40 sqrt(nu_0) . $

Undoing the rational normalization and folding the signs of the original traces into $x_i^f$ proves Theorem 16.


#bibliography("refs.bib", style: "ieee", title: [References])
