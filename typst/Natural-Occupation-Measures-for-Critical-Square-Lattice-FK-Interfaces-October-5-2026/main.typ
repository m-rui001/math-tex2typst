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

#align(center)[#text(size: 16pt, weight: "bold")[Natural Occupation Measures for \
Critical Square-Lattice FK Interfaces]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A scaling limit of an interface describes its shape, but does not by itself describe how many lattice steps it takes to traverse that shape. The latter question requires a measure on the limiting curve. For Schramm–Loewner evolution (SLE), the appropriate measure is its dimensional Minkowski content. The problem here is to identify that measure as the limit of the unweighted number of steps of a critical Fortuin–Kasteleyn (FK) interface on the square lattice.

The distinction between shape and occupation is quantitative. A visitation exponent predicts the appropriate power of the mesh, but does not rule out a slowly varying or nonconvergent factor. We prove convergence with a single constant multiplying the power law. We also control the mass near the boundary, so the result concerns the whole interface, including its total number of steps.

=== 1.1 The lattice model and the main result <the-lattice-model-and-the-main-result>

Fix $q in \[ 1 \, 4 \)$ and put

#[#set math.equation(numbering: n => "(1.1)")
 $ p_q = frac(sqrt(q), 1 + sqrt(q)) \, #h(2em) kappa = frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) \, #h(2em) d = 1 + kappa / 8 \, #h(2em) x = 2 - d . $ <eq:parameters>]

Thus $4 < kappa lt.eq 6$ and $1 \/ 4 lt.eq x < 1 \/ 2$. Let $D = \( 0 \, 1 \)^2$, with marked corners $a = \( 0 \, 0 \)$ and $b = \( 1 \, 1 \)$. The counterclockwise boundary arc from $a$ to $b$, consisting of the bottom and right sides, is denoted by $F$. The complementary arc is $W$.

For $n gt.eq 1$, the graph has vertex set $n^(- 1) bb(Z)^2 ∩ overline(D)$ and all nearest-neighbor edges in $overline(D)$. Identify all vertices on $W$, including $a \, b$, in a single block; all other vertices are distinct. Denote this partition by $xi$. Remove the boundary edges on $W$ from the sampled set of edges, and call the remaining set $E'_n$. The probability of a set of open edges $A subset E'_n$ is

$ bb(P)_n \( A \) = 1 / Z_n p_q^(\| A \|) \( 1 - p_q \)^(\| E'_n \| - \| A \|) q^(k_xi \( A \)) \, $

where $k_xi \( A \)$ counts connected components after the prescribed identification, including isolated vertices. The removed edges on $W$ are declared open for drawing the interface. Edges on $F$ remain random.

We use the Dobrushin medial strand from $a$ to $b$. Medial vertices are midpoints of primal edges; medial edges join midpoints of consecutive sides of a lattice square. At an open primal edge, pair the four medial half-edges in the two turns around the adjacent dual faces. At a closed primal edge, use the turns around the primal endpoints. The boundary turns separate the primal wired arc from the complementary dual wired arc. Two distinguished terminal half-edges occur at the boundary changes. The pairing determines the strand and its order, including the order at a medial vertex visited twice.

Let $e_(n \, 1) \, dots.h \, e_(n \, N_n)$ be the full medial-edge traversals of this strand, including boundary traversals but excluding the two terminal half-edges. Let $z_(n \, j)$ be the midpoint of $e_(n \, j)$. Define

$ Pi \( u \, v \) = #scale(x: 120%, y: 120%)[\(] max \( 0 \, min \( 1 \, u \) \) \, max \( 0 \, min \( 1 \, v \) \) #scale(x: 120%, y: 120%)[\)] . $

Project the drawn strand by $Pi$ and join its terminal points to $a \, b$ by straight segments. The resulting oriented curve is $eta_n$. The terminal connectors lie within $O \( n^(- 1) \)$ of the marked corners and carry no counting mass. For $c > 0$, set

#[#set math.equation(numbering: n => "(1.2)")
 $ nu_(n \, c) = c n^(- d) sum_(j = 1)^(N_n) delta_(Pi \( z_(n \, j) \)) . $ <eq:counting-measure>]

This convention counts traversals, not Euclidean length. In fact, a full medial edge cannot recur on this strand: after resolving the pairings, the strand is a component of a graph of degree two, with its two terminal ends. A medial vertex can nevertheless be visited twice. This distinction will matter when we replace counting by local hit indicators.

For continuous oriented curves $gamma_1 \, gamma_2 : \[ 0 \, 1 \] arrow.r overline(D)$, use the distance

#[#set math.equation(numbering: n => "(1.3)")
 $ d_(upright("curv")) \( gamma_1 \, gamma_2 \) = inf_(phi.alt_1 \, phi.alt_2) sup_(0 lt.eq t lt.eq 1) \| gamma_1 \( phi.alt_1 \( t \) \) - gamma_2 \( phi.alt_2 \( t \) \) \| \, $ <eq:curve-metric>]

where the infimum is over increasing homeomorphisms of $\[ 0 \, 1 \]$. We identify curves at distance zero. This topology retains traversal order, unlike a topology on trace sets alone.

Let $eta$ be chordal $upright("SLE")_kappa$ in $\( D \; a \, b \)$, oriented from $a$ to $b$. Its $d$-dimensional Minkowski-content measure is normalized by

#[#set math.equation(numbering: n => "(1.4)")
 $ mu_(eta \, r) = r^(- x) Pi_(*) #scale(x: 120%, y: 120%)[\[] upright(bold(1)) { "dist" \( z \, "tr" eta \) < r } thin upright(d) A \( z \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) mu_(eta \, r) arrow.r mu_eta quad upright("in probability as ") r arrow.b 0 . $ <eq:content-measure>]

Here the area measure is on the whole plane, not only on $D$. The convergence is weak convergence of finite measures on $overline(D)$. The existence of this whole-trace measure, including the stated projection convention, is justified in Lemma 28 from the SLE content and Green-function theorems.

#thm([Theorem 1.1.])[
  #emph[For each fixed $q in \[ 1 \, 4 \)$ there is a deterministic constant $c \( q \) in \( 0 \, oo \)$ such that, along all positive integers $n$, 
$ #scale(x: 120%, y: 120%)[\(] \[ eta_n \] \, nu_(n \, c \( q \)) #scale(x: 120%, y: 120%)[\)] med arrow.r.double med #scale(x: 120%, y: 120%)[\(] \[ eta \] \, mu_eta #scale(x: 120%, y: 120%)[\)] . $

 The first coordinate has the ordered curve topology (1.3), and the second has the weak topology of finite measures on $overline(D)$. The two limiting coordinates belong to the same SLE sample. In particular, 
$ c \( q \) n^(- d) N_n med arrow.r.double med mu_eta \( overline(D) \) $

 jointly with the curve and all continuous spatial tests of its measure.]
] <thm:main>

The value of $c \( q \)$ depends on the stated discrete and continuum units; its numerical evaluation is not needed. Every estimate below is for a fixed $q$. We make no claim of uniformity as $q arrow.t 4$.

=== 1.2 Context and inputs <context-and-inputs>

Schramm introduced SLE to describe conformally invariant limits of planar lattice interfaces #cite(label("Schramm")). Beffara proved that the SLE trace has dimension $1 + kappa \/ 8$ for $kappa lt.eq 8$ #cite(label("Beffara")). Dimension predicts the exponent in (1.2); it does not identify a counting-measure limit. Lawler and Sheffield introduced a Doob–Meyer construction of natural parametrization #cite(label("LawlerSheffield")); Lawler and Zhou established its existence throughout $0 < kappa < 8$ #cite(label("LawlerZhou")). Lawler and Rezaei proved that the resulting natural measure agrees, up to normalization, with $d$-dimensional Minkowski content #cite(label("LawlerRezaeiContent")). We use their interior content theorem and Euclidean Green-function estimates #cite(label("LawlerRezaeiBasic")), and supply the whole-square boundary argument in Section 8.

There are two particularly relevant precedents for passing from a lattice curve to its natural measure. For critical triangular-lattice site percolation, Garban, Pete, and Schramm constructed an interface measure measurable from the limiting SLE$""_6$ curve, with conformal covariance exponent $7 \/ 4$ #cite(label("GPS")). Their normalization at mesh $eta$ is $eta^2 \/ alpha_2^eta \( eta \, 1 \)$, where $alpha_2^eta \( eta \, 1 \)$ is the alternating two-arm probability. Holden, Li, and Sun identified the resulting measure with Minkowski content and proved convergence in natural parametrization #cite(label("HLS")). The later sharp alternating-arm asymptotics of Du, Gao, Li, and Zhuang #cite(label("DGLZ")) permit that normalization to be replaced by a constant times $eta^(7 \/ 4)$. These are triangular-site percolation results, not occupation results for square-lattice FK interfaces.

For square-lattice loop-erased random walk, Lawler and Viklund proved convergence to SLE$""_2$ when each step receives a deterministic constant times the $5 \/ 4$ power of the mesh #cite(label("LawlerViklund")). Their result uses model-specific Green-function estimates and is stated for bounded simply connected domains with analytic boundary. In the FK setting, the Ising case already has ordered-trace convergence to SLE$""_(16 \/ 3)$ #cite(label("IsingInterfaces")). These precedents distinguish the geometric trace limit from the microscopic estimates required for natural measure convergence.

For the present FK model we take chordal ordered-trace convergence from the companion manuscript #cite(label("FKCompanion")) Theorem #raw("chordal:trace"). This is the trace input specified in Input 2. We separately identify the additional companion results used in the argument: buffered FK comparison and passage estimates, the whole-plane loop limit, and the square-row representation. They are cited at their stated scopes in Section 2; none supplies the occupation asymptotic proved here. The public crossing and arm-separation inputs are due to Duminil-Copin, Manolescu, and Tassion #cite(label("DMT")), building on the FK-Ising separation arguments of Chelkak, Duminil-Copin, and Hongler #cite(label("CDCH")). The electric normalization is fixed by the six-vertex height covariance #cite(label("DKLM")) #cite(label("GFFCompanion")).

One parameter issue requires care. The angular-current proofs in the GFF companion are presented in a parameter interval different from the FK interval. In Section 4 we apply their algebraic arguments to the FK companion’s row representation and verify the required hypotheses there. We do not import an angular-spectrum theorem outside its stated range.

=== 1.3 How the normalization is determined <how-the-normalization-is-determined>

There are two distinct obstacles. First, one must obtain information more precise than an arm exponent. Second, one must compare that information with visits to a single medial edge. The proof separates these tasks.

We orient loops and insert phases depending on their winding around marked lattice points. Summing the orientations gives scalar loop weights; for small charges these weights are positive. Regeneration across surrounding open circuits gives quantitative loss of dependence on the exterior and zero-free complex neighborhoods for the associated partition functions. These estimates are developed in Section 3.

The height potential associated with small electric charges is nearly harmonic, with a summable power error. The proof uses two directions of row slicing: the untwisted current controls the potential away from the line of insertions, and twisted rows control its differences near that line. Step-two lattice potential theory then gives a Coulomb correlation formula with a power remainder. Complex continuation extends it to charges that impose arm events, and a reflection symmetry removes the remaining linear ambiguity in the local normalization. Sections 4 and 5 contain this part of the argument.

To reach a single lattice edge, we condition two opposite-color arms to reach a large radius. Section 6 constructs a coupling that makes the exterior configurations identical with power accuracy. The successful separating band has exactly two medial strands crossing it, so its exterior continuation is independent of the microscopic starting configuration. This last property is stronger than separation of two chosen arms; it is what makes the coupling useful for counting a distinguished interface.

Section 7 compares two electric charges at a mesoscopic separation with charges at neighboring lattice points. The coupling applies even though the remaining electric factor is signed. A nonzero mesoscopic amplitude controls the relative error, and a summable comparison between scales $n$ and $N in \[ n \, 2 n \]$ gives a genuine microscopic amplitude. A second comparison, with a disk probe, produces deterministic constants for replacing lattice visits by neighborhood area.

Finally, Section 8 performs this replacement in $L^2$. Ordered-trace convergence identifies the disk probes, while SLE Minkowski content identifies their small-radius limit. Integrable boundary-strip estimates complete the passage to measures on the closed square.

The potentially reusable ingredients are the complex stability of radially tilted loop partition functions, the two-direction estimate for the electric height potential, and the separating-band coupling used to convert mesoscopic correlation amplitudes into microscopic normalization. Their roles are quantitative: they remove errors that an exponent-only argument cannot detect.

== 2 Model conventions and inputs <sec:inputs>

Throughout the proof $q in \[ 1 \, 4 \)$ is fixed. Constants may depend on $q$, on a compact set of charge parameters, and on the stated geometric separations. No estimate is asserted uniformly as $q arrow.t 4$. Write

$ m = sqrt(q) = 2 cos lambda \, #h(2em) rho = lambda / pi in \( 0 \, 1 \/ 3 \] \, #h(2em) kappa = frac(4 pi, pi - lambda) . $

We use unit square tiles in the intermediate arguments. Their corners alternate between primal and dual sites, and the primal edges are tile diagonals. Thus the primal mesh is $sqrt(2)$ times the tile-edge length. Each tile has one of the two noncrossing pairings of its four side midpoints. An actual primal or dual path uses open edges of that color; boundary identifications are not path edges. This distinction is essential when a crossing must reach a wall or separate two arm clusters.

The two arcs in each tile can be drawn disjointly, with their order at successive ports retained. This rounded drawing and the usual medial drawing have uniform distance $O \( 1 \)$ in tile units under corresponding parametrizations. In physical coordinates their distance is $O \( n^(- 1) \)$. When a strand visits a medial vertex twice, the two occurrences retain their traversal order. For a simply connected domain, the usual Dobrushin completion pairs the boundary ports along the wired and free arcs. More generally, a positive cap completion wires each designated primal boundary interval separately and adds no primal identification on a dual interval. The switch law with weight $m$ per completed loop is then exactly the critical FK law, up to a deterministic factor. Indeed, Euler’s formula gives

$ \# { upright("completed loops") } = 2 k_xi \( omega \) + \| omega \| + C \, #h(2em) m^2 = q \, #h(2em) frac(p_q, 1 - p_q) = m . $

Consequently all conditional laws obtained by exposing switches have the FK domain Markov property with their induced boundary partitions. These conventions are those of #cite(label("FKCompanion")) Section “Tiles, positive laws, and localization,” Lemma “The positive loop law”.

=== 2.1 Trace and local FK estimates <trace-and-local-fk-estimates>

#prodef([Input 2.1.])[
  (Chordal trace convergence).  For the marked uniform polygon approximations of a bounded marked Jordan domain used in Theorem 1, the critical Dobrushin interface converges in law to chordal $upright("SLE")_kappa$ in the uniform Euclidean oriented-curve topology modulo increasing reparametrization.
] <inp:trace>

This is precisely #cite(label("FKCompanion")) Theorem “Dobrushin convergence for $1 lt.eq q < 4$,” label #raw("chordal:trace"). We use it as the trace input, without deriving any assertion about occupation measures from trace convergence alone.

Here and below, a buffer has fixed positive relative width and at least a sufficiently large fixed number of mesh layers. A collar is a full annulus, or one of the fixed rectangular or straight-wall sector geometries explicitly described below. The graph and deterministic wire portions are fixed inside the collar; only the partition transmitted from the unobserved side varies. Only the number of prescribed deterministic through-wire blocks is bounded, and no additional identification jumps the collar. The exterior-induced partition on the unobserved side is arbitrary: its number of blocks is not bounded. Nor is any bound imposed on the number of random open components crossing the collar. The full annuli used for inward comparison have no prescribed through-wires.

#prodef([Input 2.2.])[
  (FK localization).  The following estimates hold for critical square-lattice FK at the fixed parameter $q$.
  + An actual crossing of a discrete simple-polygon quadrilateral with bounded extremal distance has probability bounded below uniformly in the boundary partition. The dual statement holds as well. Arm separation, quasi-multiplicativity, and localization to fixed separated landing intervals hold for each fixed color word, in particular for one arm and for a primal–dual pair.
  + If two positive laws agree on a collar between radii $r$ and $16 r$, their marginals beyond its fixed side have mutually bounded densities. Equivalently, expectations of every nonnegative function on the remote edge set are comparable. This holds for a full annulus, for a bounded number of sectors separated by straight coordinate walls with matching deterministic wire portions, and for a fixed-shape rectangular bulk collar. Coincident banks of a slit are treated as distinct boundary incidences.
  + Through $k$ sufficiently separated full annuli, the ratio of remote expectations improves to $1 + O \( \( 1 - c \)^k \)$, or both expectations are zero. The assertion holds in either radial direction and after positive modifications supported on the unobserved side.
  + If $X$ counts disjoint raw strand passages through a fixed buffered annulus or one of the preceding sectors, then, for every fixed $B < oo$,
    $ bb(E) #scale(x: 120%, y: 120%)[\[] e^(B X) divides upright("exterior") #scale(x: 120%, y: 120%)[\]] lt.eq C_B . $
    The bound is uniform in scale and in the exterior-induced boundary partition. It also holds for a fixed finite family of such counts.
  + Let $r_j$ be dyadic radii and $N_j$ the number of raw nests wholly inside $r_j$, in a geometry extending beyond the largest cutoff by a buffer. A bulk nest is a closed loop surrounding the marked point. The increment satisfies $0 lt.eq N_j - N_(j - 1) lt.eq X_j$, where the buffer of $X_j$ is disjoint from $B_(r_(j - k_0))$ for a fixed $k_0$. For $b > 0$, set $F_j = bb(E) b^(N_j)$ and $thin upright(d) nu_j = F_j^(- 1) b^(N_j) thin upright(d) bb(P)$. Then
    $ C_b^(- 1) lt.eq F_j / F_(j - 1) lt.eq C_b \, #h(2em) bb(E)_(nu_j) e^(B X_i) lt.eq C_(b \, B) quad \( i gt.eq j \) . $
    These statements remain valid conditionally on exterior data of the specified geometry, and with a fixed family of buffered passage counts adjoined at or beyond the outer tilt level. The constants can be chosen uniformly for $b$ in a compact subset of $\( 0 \, oo \)$.
] <inp:fk>

Part (i) is #cite(label("DMT")) Theorem 1.2 and Propositions 6.2, 6.3, and 6.5. The last three propositions apply to fixed color words, including the two words needed here. Parts (ii)–(v) are respectively the lemmas “Bounded densities across a collar,” “Relative comparison,” “Exponential passage moments,” and “Local tilt bounds” in #cite(label("FKCompanion")) Section “Tiles, positive laws, and localization”; their source labels are #raw("prelim:collar"), #raw("prelim:relative-collar"), #raw("prelim:passages"), and #raw("prelim:tilts"). The compact-uniform assertion in Part (v) follows from those proofs by bounding $\| log b \|$ on the compact set. We require Part (iii) only in full annuli. In particular, these inputs do not assert comparison across arbitrary irregular walls or under complex-valued tilts.

The separation argument with high probability used in Section 6 is the actual-cluster construction of #cite(label("CDCH")) Lemma 5.9, whose original statement concerns FK-Ising. For our range of $q$, its conditional crossing steps are supplied by #cite(label("DMT")) Theorem 1.2, as in the proof of that paper’s Proposition 6.2. Section 6 specifies the extra buffers and the arm continuations needed for the coupling; we do not identify ordinary separation up to constants with that stronger conclusion.

The free and wired plane laws coincide, are invariant under lattice symmetries, and are exchanged by primal–dual symmetry at these self-dual weights; see #cite(label("DCLM")) Theorem 1.1 and its square-lattice specialization in #cite(label("FKCompanion")) Section “Crossing estimates and finite plane loops”. Buffered circuits of both colors show that every plane medial strand is almost surely a finite loop. A translation by one tile may interchange the two colors, but preserves this loop law.

=== 2.2 Plane loops and angular rows <plane-loops-and-angular-rows>

#prodef([Input 2.3.])[
  (The nested plane loop limit).  The entire loop collection of the free infinite-volume critical square-lattice FK law converges, through the full mesh sequence, to nested whole-plane $upright("CLE")_kappa$. Convergence is in spherical loop-matching topology, with curves compared modulo their traversal parametrizations, and includes all nested generations. The limit is invariant under similarities and, more generally, Möbius maps.
] <inp:loops>

This is the separately cited Theorem “Nested full-plane convergence for $q < 4$,” label #raw("loop:plane"), in #cite(label("FKCompanion")) Section “From squares to the free plane law and the sphere”. Its statement concerns exactly the plane law used here. It is stronger than Input 2, and is used for the finite-resolution nesting limits in Sections 3 and 7. Passage moments from Input 3 provide the required uniform integrability when nesting functionals are unbounded.

Orienting a completed contractible loop and assigning total turning weights $e^(i lambda)$ and $e^(- i lambda)$ recovers its unoriented weight $m$. Summing the local orientations gives the homogeneous six-vertex weights

$ a = b = 1 \, #h(2em) c = 2 cos \( lambda \/ 2 \) \, #h(2em) Delta = frac(2 - c^2, 2) = - cos lambda . $

The induced height changes by one across an arrow. The plane arrow law is the zero-slope law obtained by first taking the longitudinal limit of balanced even-width tori and then letting the width tend to infinity. Here balance means zero total arrow flux across a transverse section. The identification of finite local arrow and phase words with the FK loop expansion is part of the plane-kernel construction in #cite(label("FKCompanion")) Section “Row algebra and the infinite-plane state”. It agrees with the balanced-plane law in #cite(label("DKLM")) Theorem 2.2 and Equation (18).

#prodef([Input 2.4.])[
  (Physical angular representation).  At $0 < lambda lt.eq pi \/ 3$, the normalized homogeneous rows have a plane Hilbert-space representation with vacuum $Omega$. Finite ordinary spin and diagonal phase words have the expectations of the preceding physical plane law. With the angular coordinate normalized so that the strip is $\| "Re" z \| < pi \/ 2$, marked rows $A^D \( z \)$ are bounded and holomorphic, satisfy $parallel A^D \( z \) parallel lt.eq 2 parallel D parallel$, and obey
  $ A^D \( z + i b \) = U_b A^D \( z \) U_b^(- 1) \, #h(2em) U_b = e^(i b B) \, $
  where $B$ is self-adjoint. For a diagonal unitary twist, the normalized commuting row family has scalar spectral functions which, under $w = e^(i z)$, are inner in the right half-plane. They continue without zeros through a common-width band at each strip edge. In particular, their zeros lie in a fixed cone $"Re" w_j gt.eq c_(*) \| w_j \|$, and their general factorization has the form
  $ f \( w \) = eta exp \( - a_(*) w - b_(*) \/ w \) product_j beta_j \( w \) \, #h(2em) a_(*) \, b_(*) gt.eq 0 \, quad \| eta \| = 1 \, $
  where $beta_j$ are normalized half-plane Blaschke factors and $sum_j "Re" w_j \/ \( 1 + \| w_j \|^2 \) < oo$. The sum may initially be infinite.
] <inp:rows>

These are the plane-kernel, angle-generator, and fixed-band continuation lemmas, labels #raw("bulk:plane-kernels"), #raw("bulk:boost"), and #raw("bulk:edge-band"), together with Equation #raw("bulk:inner-factorization"), in #cite(label("FKCompanion")) Section “Angular transfer and its two leading modes”. The argument in #cite(label("GFFCompanion")) Section 4 for the current cocycle, finite-inner spectrum, spectral-width tails, and variogram is stated there for $pi \/ 3 < lambda < pi$. Those stronger conclusions are not included in Input 5. In Section 4 we transfer the needed arguments to the representation above and prove the conclusions at our parameter.

=== 2.3 The covariance normalization <the-covariance-normalization>

Only a separated-increment covariance, rather than a pointwise Gaussian limit for the height, is needed to determine the electric constant. Let $h_delta$ be the height of the preceding balanced plane law on mesh $delta$, with an arbitrary additive constant, and put $G \( u \, v \) = - \( 2 pi \)^(- 1) log \| u - v \|$.

#prodef([Input 2.5.])[
  (Separated height covariance).  For four distinct points $u \, u' \, v \, v'$ and lattice approximants tending to them,
  $ & lim_(delta arrow.b 0) bb(E) #scale(x: 120%, y: 120%)[\[] \( h_delta \( u' \) - h_delta \( u \) \) \( h_delta \( v' \) - h_delta \( v \) \) #scale(x: 120%, y: 120%)[\]]\
 & #h(2em) = sigma^2 #scale(x: 120%, y: 120%)[\(] G \( u' \, v' \) - G \( u' \, v \) - G \( u \, v' \) + G \( u \, v \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sigma^2 = frac(2, pi - lambda) . $
  The convergence is locally uniform away from endpoint collisions.
] <inp:covariance>

Indeed, $c = 2 cos \( lambda \/ 2 \) in \[ sqrt(3) \, 2 \)$, so the covariance part of #cite(label("DKLM")) Definition 2.7 and Theorem 2.8 applies directly to this physical law and unit-height convention. Its multiplier is $1 \/ arcsin \( c \/ 2 \) = 2 \/ \( pi - lambda \)$. The same normalization is recorded in the main theorem of #cite(label("GFFCompanion")). In Section 5 we use Input 6 only for four distinct collinear points. Thus this use needs neither the smaller-$c$ part of that companion’s GFF theorem nor an extension of the DKLM theorem beyond its stated range.

== 3 Radial regeneration and normalized correlations <sec:radial>

The first normalization problem is local. A loop surrounding a marked point can be arbitrarily small, so convergence of macroscopic loops does not directly give convergence of an insertion which weights every such loop. We prove that the dependence on these small loops cancels in ratios of partition functions. The cancellation must remain bounded under a complex perturbation of the weights, because Section 5 will use analytic continuation.

We work in unit tile coordinates. For a rounded loop $ell$ and a tile vertex $u$, put

$ R_u \( ell \) = max_(z in ell) \| z - u \| . $

Enclosure refers to the disjoint switch drawing from Section 2. A circuit state $gamma$ consists of an actual primal-open circuit surrounding $u$, with all its vertices wired, and the ordinary FK law in its interior. Its size is $R$ if its inscribed and outer radii about $u$ lie between fixed positive multiples of $R$. No further regularity of the circuit is required. At a circuit edge, the two switch arcs belong to its respective sides. Consequently the interior loop configuration separates exactly from the exterior, also when a loop uses an inward arc beside the circuit.

Let $N_gamma$ count its interior loops enclosing $u$, and define

#[#set math.equation(numbering: n => "(3.1)")
 $ F \( gamma \; v \) = bb(E)_gamma v^(N_gamma) \, #h(2em) frac(thin upright(d) bb(P)_(gamma \, v), thin upright(d) bb(P)_gamma) = frac(v^(N_gamma), F \( gamma \; v \)) \, #h(2em) v > 0 . $ <eq:radial-partition>]

A plane state of size $R$ uses the plane FK law and counts precisely the loops enclosing $u$ with $R_u \( ell \) lt.eq R$. We use the notation $F \( gamma \; v \)$ for this state as well. An exchange of the two colors gives the corresponding statements for dual circuits. In comparisons the color of $u$ is fixed, or transported by a lattice symmetry together with the two color names.

#thm([Proposition 3.1.])[
  (Radial estimates).  #emph[Fix $1 lt.eq q < 4$, fixed radius-comparison constants, and a compact interval $V subset \( 0 \, oo \)$. The following bounds are uniform over the above circuit and plane states and over $v in V$.]
  #emph[For states $gamma \, gamma'$ of sizes $R \, R' gt.eq r_0$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ lr(|log frac(F \( gamma \; v \), F \( gamma' \; v \))|) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| log \( R \/ R' \) \| #scale(x: 120%, y: 120%)[\)] . $ <eq:radial-comparison>]

 There is $delta > 0$ such that every $F \( gamma \; v e^w \)$ is nonzero for $\| w \| < delta$. Its logarithm, continued from its real value at $w = 0$, has absolute value at most $C log \( 2 + R \)$. Moreover 
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|log frac(F \( gamma \; v e^w \), F \( gamma \; v \)) - log frac(F \( gamma' \; v e^w \), F \( gamma' \; v \))|) lt.eq C \| w \| #scale(x: 120%, y: 120%)[\(] 1 + \| log \( R \/ R' \) \| #scale(x: 120%, y: 120%)[\)] . $ <eq:radial-complex-ratio>]

]
  #emph[For two states of comparable size $R$, their positively tilted laws can be coupled so that their configurations agree inside a common surrounding primal-open circuit containing $B \( u \, s \)$, except with probability $C \( s \/ R \)^c$, for $r_0 lt.eq s lt.eq R \/ C$. Conditional on the common circuit, the common continuation has its circuit law tilted by $v$.]
  #emph[Finally, let $F_(gt.eq h) \( gamma \; v \)$ count only the eligible loops with $R_u \( ell \) gt.eq h$. For comparable starts of size $R$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ frac(F_(gt.eq epsilon.alt R) \( gamma \; v \) \/ F_(gt.eq epsilon.alt R) \( gamma' \; v \), F \( gamma \; v \) \/ F \( gamma' \; v \)) = 1 + o \( 1 \) $ <eq:radial-truncation>]

 uniformly as $epsilon.alt arrow.b 0$ and $epsilon.alt R arrow.r oo$. The same real comparison and regeneration bounds hold with any such lower cutoff on the counted radii.]
] <prop:radial>

=== 3.1 Passage bounds at a circuit and under a tilt <passage-bounds-at-a-circuit-and-under-a-tilt>

The FK estimates used here are the bounded-density collar lemma, exponential passage moments, and local tilt bounds in #cite(label("FKCompanion")) Section 2, “Comparison through a collar” and “Passages and positive local tilts”; their precise scope is recorded in Input 3. We first explain the extension to an irregular wired circuit, where a bulk-buffer assertion alone would not suffice.

A newly counted enclosing loop whose maximum radius crosses a specified cutoff has a passage in one of a fixed number of buffers at that scale: it either goes around $u$ in the band or leaves the band. The same observation charges every enclosing loop whose status changes when a subannulus is resampled. Loops which do not enclose $u$ need not be charged. Thus, for passage counts $X_j$ on $l$ geometrically spaced bands, finite coloring of their buffers and conditional iteration give

#[#set math.equation(numbering: n => "(3.5)")
 $ bb(E) exp (t sum_(j = 1)^l X_j) lt.eq exp \( C_t \( l + 1 \) \) \, #h(2em) t < oo . $ <eq:radial-band-moments>]

The bound is conditional on data beyond the buffered cuts.

At the outer wall of a primal-wired circuit, count large enclosing loops using their dual sides. Those sides have free boundary at the wall. In a cropped annular or rectangular passage region, the ordered medial separators force distinct actual dual crossing components: two neighboring sides may use one component, so a factor two and bounded end effects are allowed. The crop ends lie strictly inside the region traversed by the separators. An inward switch arc beside an open circuit edge still has an actual interior dual gap on its other side; it cannot use a fictitious path through the exterior.

Explore complete actual dual components from one end of the crop, including unsuccessful components. After a component is removed, its incident unexplored boundary edges are closed in the explored color. The remaining law is dominated by filling the cropped box and wiring its cut boundary. The original wall is free in this color, and conditioning farther away can identify cut-boundary vertices only. Filling the missing vertices and, if necessary, wiring the entire boundary can only increase actual crossing probabilities. A blocker in the filled box has uniformly positive probability by the crossing bounds of Input 3, including the wall version of #cite(label("DMT")) Theorem 1.2. Successive component discoveries therefore give a geometric tail. To obtain an arbitrary fixed exponential rate, subdivide the passage distance into $J$ separated slices, cover each by buffered small boxes, and apply the same exploration to the boxes intersected with the circuit interior. Every original passage crosses a small buffer in each slice. If $X$ is the original count and $X_i$ the $O \( J^2 \)$ small-buffer counts, then $J X lt.eq sum_i X_i$. Their buffers have a coloring with $k$ colors independent of $J$. Conditional iteration in each color class, followed by Hölder across classes, therefore bounds $bb(E) e^(c J X \/ k)$ using the common first exponential rate $c$ of the $X_i$. The prefactor may depend on $J$, which is harmless: choose $J$ large and fixed to obtain any prescribed rate. The finitely many scales where these boxes do not fit are covered by a deterministic finite-size bound. This proves (3.5) also in the outer circuit collar. The argument uses the specified wired wall, not an arbitrary partition on a jagged boundary.

Now first count nests only up to a radius a fixed factor inside the inscribed radius of the circuit. The local tilt bounds compare successive cutoff masses and give every fixed passage moment at the last weighted level. They are uniform for $v in V$: in their proof, the Hölder exponents can be chosen using $sup_(v in V) \| log v \|$, on either side of $1$. Moving the cutoff back a bounded number of levels leaves the passage buffers outside the tilt. Hölder’s inequality then restores those levels. The preceding wall estimate restores the remaining boundedly many outer levels at bounded cost. Negative powers have the same comparison, by Jensen’s inequality followed, when needed, by this cutoff argument. Bounded densities across a full bulk collar now compare the interior cutoff mass to that for any other comparable state. This proves (3.2), first for comparable sizes and then by multiplying comparisons across scales.

These statements remain uniform if counting begins at a lower maximum-radius threshold $h$. Start the cutoff induction with no weight below $h$. In particular, under a tilt supported below the inner end of $l$ bands, their joint passage moments still obey (3.5); the innermost boundedly many buffers use the local tilt bounds, and all others are separated from its support. Adding the weights in those $l$ bands changes the density, including its normalization, by a factor whose fixed moments cost $exp \( C \( l + 1 \) \)$. Hence (3.5) holds under the full positive tilt up to the outer end of those bands as well. These are the real estimates needed for regeneration.

=== 3.2 Stopping circuits and exponential waiting times <stopping-circuits-and-exponential-waiting-times>

Fix $K$ sufficiently large and use levels $r_i = r_0 K^i$, $i gt.eq 0$, with $r_0$ large enough for all crossing constructions. Each trial band has radii comparable to $r_i$ and $3 r_i$ and has full collars on both sides. The value of $K$ leaves these enlarged trial regions disjoint and leaves an unused inward collar after a starting circuit. Assign a state the level just below its inscribed radius; states at one level have sizes within a fixed factor. A plane cutoff is assigned in the same way, and its first trial lies well inside that cutoff.

Inspect trials inward until finding a surrounding primal-open circuit, choosing the outermost circuit in that band. The usual outer exploration is a stopping exploration: no edge strictly inside the selected circuit need be queried. Intersecting candidate circuits can be merged by taking their outer boundary. Failed tests concern previous, disjoint bands. At level zero use a terminal symbol with continuation mass one. Conditional on a stopped circuit, the ordinary continuation is its wired FK law. If $D$ counts the weighted enclosing loops outside that circuit, then

#[#set math.equation(numbering: n => "(3.6)")
 $ F \( gamma \; v \) = bb(E)_gamma #h(-0.16667em) [v^D F \( gamma_1 \; v \)] \, $ <eq:radial-transition>]

where $gamma_1$ denotes the stopped state, including the terminal case. For a plane start, $D$ also respects its original maximum-radius cutoff. The assignment of circuit-side arcs makes this factorization exact. It follows that the stopped process remains a regeneration process under the tilt.

Let $J$ be the number of levels crossed in one transition. Assigning the loops counted by $D$ to their maximum-radius bands gives, under any of the positive tilts under discussion,

#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E)_(gamma \, v) \[ e^(t D) \; J = j \] lt.eq e^(C_t \( j + 1 \)) \, #h(2em) t < oo . $ <eq:radial-jump-cost>]

We next prove

#[#set math.equation(numbering: n => "(3.8)")
 $ bb(P)_(gamma \, v) \( J > l \) lt.eq C e^(- c l) . $ <eq:radial-jump-tail>]

This needs more than a crossing bound after arbitrary neighboring edges have been exposed, because such an exposure need not leave a favorable conditional law under the tilt.

For each of the first $l$ trials, designate its central band as a region to be resampled by the ordinary FK conditional law. All counts used below have buffers in that trial’s enlarged collar. A trial is called typical if the old passage counts which can charge changed enclosing loops are at most $H$, and, for every boundary partition which changes outside its collar, the ordinary conditional redraw has probability at least $b$ of producing a surrounding circuit and at most $H$ new charging passages. Here $b > 0$ and $H < oo$ will be fixed independently of $l$ and of the lattice scale. The second condition depends only on collar edges outside the resampled band, so remains true after other trial bands are changed.

We justify that typicality fails with arbitrarily small ordinary conditional probability. Expose the collar up to its far cuts, and let $Y$ count its actual components joining the band-facing cuts to the far cuts, on both radial sides, plus one. Only these components can acquire new identifications when the far partition is changed. For fixed collar edges, any two redraw kernels thus have density ratio at most $q^(C Y)$. Complete-component exploration in cropped subcollars, as above, gives a uniform exponential tail for $Y$. First fix a large bound $Y_0$. Given $Y lt.eq Y_0$, the worst conditional probability, over the induced far partitions, of more than $H$ new passages is at most $q^(C Y_0)$ times that probability under the actual partition, or its conditional mixture. The latter probability has arbitrarily small expectation as $H arrow.r oo$, by the ordinary conditional passage estimate. Markov’s inequality then makes the collar-edge event on which this worst probability exceeds a fixed tolerance arbitrarily rare. Success without the passage restriction has conditional probability at least $2 b > 0$ by RSW. Choose the tolerance below $b$, and then $H$ large. The old passage test is handled by the same moment bound.

All these estimates hold conditional on data outside the enlarged trial collar, uniformly in its induced partition. For any prescribed set of trials their failures therefore have probability at most a chosen small constant to the size of that set, by conditional iteration. A binomial sum proves, at any desired exponential rate, that fewer than $l \/ 3$ typical trials is unlikely under ordinary FK. To transfer this statement to the fully tilted law, first retain only the tilt below the inner end of these $l$ trials, omitting boundedly many end trials for the buffers. The same ordinary conditional argument still applies: the retained weight counts loops wholly inside that lower cutoff, so is measurable outside each enlarged trial collar. Conditional on the exterior of a collar, it is constant, and the conditional law in the collar is ordinary FK. The remaining change of density has second moment at most $e^(C \( l + 1 \))$, by (3.5) and the real mass comparisons. Cauchy–Schwarz, choosing the preceding ordinary rate larger than $C$, gives

#[#set math.equation(numbering: n => "(3.9)")
 $ bb(P)_(gamma \, v) \( \| T \| < l \/ 3 \) lt.eq C e^(- c l) \, $ <eq:radial-typical>]

where $T$ is the set of typical trials. This proof applies equally when a lower radius threshold is present.

For completeness, the insertion argument converting (3.9) into (3.8) is as follows. Write $A_l$ for failure at all $l$ trials, and for a fixed subset $S$ of the trials put $A_S = A_l ∩ { S subset T }$. Redraw the bands in $S$ successively with their ordinary FK heat baths, retaining only outcomes with success and at most $H$ new passages. Each retention has probability at least $b$, even after the preceding redraws. At one accepted redraw, at most $C H$ old or new enclosing loops change their weight. Consequently the ratio of input to output tilt densities is at most $M = exp \( C H sup_(v in V) \| log v \| \)$ per redraw. Ordinary heat baths preserve the ordinary law, including their successive composition. If $E_S$ is the event with exact success set $S$ among these $l$ trials, integration of the accepted transitions therefore gives

$ bb(P)_(gamma \, v) \( E_S \) gt.eq \( b \/ M \)^(\| S \|) bb(P)_(gamma \, v) \( A_S \) . $

The events $E_S$ are disjoint. With $delta = b \/ M$, summing over $S$ yields the useful integrated inequality

#[#set math.equation(numbering: n => "(3.10)")
 $ 1 gt.eq bb(E)_(gamma \, v) [upright(bold(1))_(A_l) \( 1 + delta \)^(\| T \|)] . $ <eq:radial-insertion>]

The set $T$ stays inside the expectation; no deterministic choice of typical trials is required. Equations (3.9) and (3.10) prove (3.8).

Combining the tail with (3.7) gives a joint exponential moment: there exist $a \, t > 0$ such that

#[#set math.equation(numbering: n => "(3.11)")
 $ sup_(gamma \, v) bb(E)_(gamma \, v) e^(a J + t D) < oo . $ <eq:radial-joint-moment>]

Indeed fix an exponent $T_0 > 0$ in (3.7) and apply Hölder on ${ J = j }$:

$ bb(E) \[ e^(t D) \; J = j \] lt.eq bb(E) \[ e^(T_0 D) \; J = j \]^(t \/ T_0) bb(P) \( J = j \)^(1 - t \/ T_0) . $

For $t \/ T_0$ small, the resulting exponent in $j$ is negative; then choose $a > 0$ smaller than its absolute value.

=== 3.3 Coupling states at different levels <coupling-states-at-different-levels>

At a common level, the next-band transitions of any two states have a common part of uniformly positive mass. To see this, use bounded densities through the unused collar to minorize both ordinary band marginals by a fixed fraction of one reference marginal, and restrict to its successful circuits. Given the next screen, its continuation mass compares to any reference mass at that level by (3.2). The number of newly charged loops can be restricted to $D lt.eq H_1$ at arbitrarily small discarded ordinary probability, by the fixed-band passage estimate. On this restriction $v^D$ is bounded above and below uniformly. Subtract the two discarded parts from the reference marginal and then take its common minimum. The normalizations also compare to the same continuation mass, so the common part retains a fixed mass $p_0 > 0$ under the tilted laws. In particular a jump of one level has probability bounded below.

For starts at the same or neighboring levels, advance whichever state has the higher remaining level; when the levels agree, attempt coupling on this common part. Use a fixed mass strictly smaller than the available overlap. After a failed attempt the residual transition moments are bounded by the original moments divided by $1 - p_0$. This avoids conditioning estimates depending on an overlap which might itself be close to one.

Here is the quantitative reason this procedure also works for asynchronous levels. If their current difference is $d gt.eq 1$ and the higher state jumps by $J$, the new difference is $\| d - J \|$. For sufficiently small $a > 0$, (3.11) gives an exponential drift outside a fixed finite set:

$ bb(E) e^(a \| d - J \|) lt.eq e^(a d) bb(E) \[ e^(- a J) \; J lt.eq d \] + bb(E) \[ e^(a \( J - d \)) \; J > d \] lt.eq theta e^(a d) \, #h(2em) d gt.eq d_0 \, $

with $theta < 1$. The last tail term is exponentially small relative to $e^(a d)$, while $J gt.eq 1$ bounds the first coefficient below one. From ${ 0 \, dots.h \, d_0 }$, finitely many one-level jumps bring the levels together with uniformly positive probability, followed by the common-part coupling. The exponential drift bounds return times, and the failed-attempt residual moments remain bounded. Geometrically summing these returns proves an exponential moment for the number of transitions until meeting. More explicitly, the kernel of one unsuccessful excursion from this finite set has mass strictly below one at discount one and a bounded exponential moment; the same is true at a sufficiently small positive time exponent. Summing its powers proves the assertion.

Iterating (3.11) and reducing its exponents then bounds total distance and charged-loop cost up to meeting. If $L$ denotes the largest number of levels descended by either chain, and $D_1^(*) \, D_2^(*)$ their respective costs before the common state,

#[#set math.equation(numbering: n => "(3.12)")
 $ bb(E) exp { c \( L + D_1^(*) + D_2^(*) \) } lt.eq C . $ <eq:radial-meeting-moment>]

One may require each chain to take one transition before permitting meeting; the bound is unchanged. The terminal symbol provides the same construction at the finitely many bottom levels.

If the initial size is $R$, reaching a radius comparable to $s$ without meeting requires order $log \( R \/ s \)$ descended levels. Equation (3.12), with a smaller exponent to cover a final overshoot, bounds this probability by $C \( s \/ R \)^c$. On meeting, both chains have exactly the same surrounding circuit and the same conditional tilted continuation. Their configurations can therefore be made identical inside it. This proves the inward coupling assertion in Proposition 7. Terminal exhaustion, though a valid meeting for partition-function identities, is counted as failure in this spatial coupling; the coupling attempts here are stopped before the radii drop below $s$.

=== 3.4 Complex stability and removal of the inner cutoff <complex-stability-and-removal-of-the-inner-cutoff>

Fix a real $v in V$. For a state $gamma$ at level $i$ define

$ G_gamma \( w \) = frac(F \( gamma \; v e^w \), F \( gamma \; v \)) = bb(E)_(gamma \, v) e^(w N_gamma) . $

At finite scale these are holomorphic functions. We prove by induction on the level that they do not vanish and that, for states at the same or neighboring levels,

#[#set math.equation(numbering: n => "(3.13)")
 $ \| log G_gamma \( w \) - log G_(gamma') \( w \) \| lt.eq B \| w \| . $ <eq:radial-induction>]

All logarithms start at zero at $w = 0$. The terminal levels have uniformly bounded size and give the initial assertion directly.

To compare two new starts, use the preceding coupling, requiring one transition in each chain so that their meeting state lies below the highest level being proved. Regeneration gives

$ G_(gamma_j) \( w \) = bb(E) \[ e^(w D_j^(*)) G_(gamma_(*)) \( w \) \] \, #h(2em) j = 1 \, 2 \, $

with the same random meeting state $gamma_(*)$. Divide both sides by $G_sigma \( w \)$ for any reference state $sigma$ at the preceding level. Chaining the inductive bounds through the lower levels gives

$ Q \( w \) = frac(G_(gamma_(*)) \( w \), G_sigma \( w \)) \, #h(2em) \| log Q \( w \) \| lt.eq B \| w \| \( L + 2 \) . $

By (3.12), for each fixed $B$ and all sufficiently small $\| w \|$, both divided expectations lie in ${ z : \| z - 1 \| < 1 \/ 4 }$. Their difference has the sharper bound

$ lr(|bb(E) \[ \( e^(w D_1^(*)) - e^(w D_2^(*)) \) Q \( w \) \]|) & lt.eq \| w \| bb(E) [\( D_1^(*) + D_2^(*) \) e^(\| w \| \( D_1^(*) + D_2^(*) \) + B \| w \| \( L + 2 \))]\
 & lt.eq C_0 \| w \| . $

Here $C_0$ is independent of $B$, provided $B \| w \|$ is smaller than a fixed fraction of the exponent in (3.12). The logarithm is uniformly Lipschitz on the displayed disk. Thus choose $B$ larger than the resulting fixed multiple of $C_0$, and only then choose $delta > 0$ so that the disk and exponent conditions hold for $\| w \| < delta$. This closes both the nonvanishing induction and (3.13). Telescoping levels proves (3.3). The real comparison to a terminal state bounds $\| log F \( gamma \; v \) \|$ by $C log \( 2 + R \)$, and another telescoping sum proves the asserted logarithmic bound in the complex neighborhood.

It remains to compare full and thresholded masses. Put $h = epsilon.alt R$ and let $l$ be the number of levels between $R$ and $h$. In each regeneration path stop at its first screen whose level is at most $J$ levels above $h$, where $1 lt.double J lt.eq l \/ 2$. Call this stop typical if its level is between one and $J + O \( 1 \)$ levels above $h$. The probability of an atypical stop is $C e^(- c J)$ under both the full and thresholded tilts: sum the jump-tail bound over its possible origins, each level being visited at most once. On a typical path every loop already charged encloses the stopping screen or lies outside it, and hence has maximum radius above $h$. The two weighting rules have therefore agreed up to this stop.

Write

$ Q_h \( sigma \) = F_(gt.eq h) \( sigma \; v \) \/ F \( sigma \; v \) $

for the continuation quotient. Normalize by its value $q_h$ at any reference screen at the threshold level. Real comparisons, including their thresholded version, give on typical stops

#[#set math.equation(numbering: n => "(3.14)")
 $ e^(- C \( J + 1 \)) lt.eq Q_h \( sigma \) \/ q_h lt.eq e^(C \( J + 1 \)) . $ <eq:radial-cutoff-quotient>]

Couple the two full-tilt paths from the original comparable states. Their stopped screens agree except with probability $C e^(- c l)$, after changing $c$ to account for $J lt.eq l \/ 2$. On typical stopped paths regeneration gives the exact identity

$ I_gamma := bb(E)_(gamma \, v) \[ upright(bold(1))_(upright("typ")) Q_h \( sigma \) \] = frac(F_(gt.eq h) \( gamma \; v \), F \( gamma \; v \)) bb(P)_(gamma \, v \, gt.eq h) \( upright("typ") \) \, $

where the probability on the right uses the thresholded tilt. The difference of the two $I_gamma$, divided by $q_h$, is at most $C e^(C \( J + 1 \) - c l)$. The lower bound in (3.14) converts this into a relative error $C e^(C' \( J + 1 \) - c l)$.

The omitted atypical paths also have small #emph[relative] weight. Indeed their fraction of the full mass is their probability under the full tilt, and their fraction of the thresholded mass is their probability under the thresholded tilt. Both are $C e^(- c J)$. The factorization is used only on typical paths, where the already charged counts agree; an overshoot below $h$ does not require such a factorization. Taking $J$ a sufficiently small positive fraction of $l$ proves (3.4) and completes the proof of Proposition 7.

=== 3.5 Several marked points <several-marked-points>

Fix $p gt.eq 2$ labeled tile vertices $upright(bold(u)) = \( u_1 \, dots.h \, u_p \)$. For $diameter eq.not I subset.neq { 1 \, dots.h \, p }$ let $N_I$ be the number of plane loops enclosing exactly the points with labels in $I$. Assign relative weights $upright(bold(v)) = \( v_I \)$, with $v_diameter = v_({ 1 \, dots.h \, p }) = 1$, and define

$ C \( upright(bold(v)) \; upright(bold(u)) \) = bb(E) product_(diameter eq.not I subset.neq { 1 \, dots.h \, p }) v_I^(N_I) . $

This is well defined even for complex weights. Every separating loop intersects a fixed finite collection of tile paths joining the points; only finitely many switch strands use those paths. Let $b_0 in \( 1 \, 2 \)$ be a fixed continuity cutoff for the limiting loop law, and write

$ F_n \( v \) = bb(E) v^(\# { ell : u upright(" inside ") ell \, R_u \( ell \) lt.eq b_0 n }) . $

Translation and duality make this function independent of the choice of tile vertex $u$. Rounding and color conventions are transported by these symmetries.

#thm([Proposition 3.2.])[
  (Normalized multipoint correlations).  #emph[Suppose $p$ is fixed, $max_j \| u_j \| lt.eq C n$, and $a = min_(i eq.not j) \| u_i - u_j \| gt.eq r_0$. Around every parameter whose singleton weights $v_({ j })$ are strictly positive real numbers, the normalized correlation 
#[#set math.equation(numbering: n => "(3.15)")
 $ cal(C)_n \( upright(bold(v)) \; upright(bold(u)) \) = frac(C \( upright(bold(v)) \; upright(bold(u)) \), product_(j = 1)^p F_n \( v_({ j }) \)) $ <eq:normalized-correlations>]

 is holomorphic and bounded in a fixed complex neighborhood of the singleton weights, uniformly when the other weights range over a bounded set, with bound $C \( n \/ a \)^C$. For $a gt.eq c n$, if $u_j \/ n$ converge to distinct points and the point parities are fixed, (3.15) has a limit locally uniformly in these complex parameter neighborhoods.]
  #emph[When all nontrivial weights lie in a fixed compact subset of $\( 0 \, oo \)$ and $a gt.eq c n$, the normalized correlations are bounded above and below by positive constants. Their tilted laws are local at each point in the following quantitative sense. Consider two possibly different collections with bounded point counts, all weights in the stated positive compact set, and sizes comparable to the same $n$, satisfying the same fixed geometric bounds. Align one chosen point in each by a lattice symmetry, transporting its color, and suppose its singleton weight is the same in both. The two laws admit a coupling with identical configuration inside a common surrounding circuit containing $B \( u \, s \)$, with error $C \( s \/ n \)^c$. For minimum separation $a$ the analogous error is at most $C \( n \/ a \)^C \( s \/ a \)^c$, whenever $r_0 lt.eq s lt.eq a \/ C$.]
] <prop:normalization>

#proof[
  Take disjoint patches $P_j$ centered at $u_j$, of radii a small fixed multiple of $a$, and with disjoint larger collars. At a positive singleton base point $v_j = v_({ j })$, use the positive auxiliary weight
  $ U = product_j v_j^(M_j) \, #h(2em) M_j = \# { ell : u_j upright(" inside ") ell \, med ell subset P_j } \, #h(2em) Z_U = bb(E) U . $
  Write $bb(P)_U = U bb(P) \/ Z_U$. The collar comparison and Proposition 7 give
  #[#set math.equation(numbering: n => "(3.16)")
   $ Z_U asymp product_j F_a \( v_j \) . $ <eq:radial-proxy-mass>]
  Patches can be round, with a bounded whole-tile rounding; the mass comparison is unaffected by a fixed change in their radii.
  Every weighted loop not assigned to these local nests can be charged to a passage at patch scale or larger. To make the count explicit, join the points by a fixed spanning tree of paths of total length $O \( n \)$. A separating loop hits a tree path. If this contact occurs inside a patch but the loop is not contained there, follow the loop to its first departure through a patch-scale buffer. Otherwise choose its nearest approach to a marked point and use a buffer at the corresponding geometric scale. Its diameter is comparable to or larger than that scale. A loop enclosing several points has such a witness as well. A bounded number of buffers at each scale suffices because $p$ is fixed; choose them where the distance to the nearest point is comparable to the scale. Their overlap has a bounded coloring. Thus the total witness count $X$ satisfies
  #[#set math.equation(numbering: n => "(3.17)")
   $ bb(E)_U e^(t X) lt.eq C_t \( n \/ a \)^(C_t) \, #h(2em) t < oo . $ <eq:radial-macro-moments>]
  For the lowest buffers, move the local cutoff back a bounded number of levels and use the local tilt bounds before restoring it by Hölder. Higher buffers are separated from the local tilts. Conditioning through the disjoint patch collars treats all $p$ patches at once. This proves (3.17) directly from the band estimates; it applies to arbitrarily large excursions, since the finite tree already provides their witnesses.
  At the positive singleton base, the absolute value of the remaining weight is bounded by $K^X$, for a fixed $K$, even if some nonsingleton weights vanish. Equations (3.16) and (3.17), followed by scale comparison from $a$ to $n$, prove the asserted real-base upper bound. If all weights are bounded above and below positively, the remaining weight is also bounded below by $K^(- X)$. Jensen’s inequality and (3.17) then give the lower comparison.
  For the complex bound, in every patch search inward for the first stopping circuit with the same clear collars as before. Under $bb(P)_U$, its waiting time $L_j$ and the number $D_j$ of local charged loops completed before it have a joint exponential moment, uniformly in scale. The proof of (3.8) applies with a patch cutoff in place of the initial circuit: its ordinary crossing and collar estimates are conditional through the same free space. The argument also applies to lower-threshold local tilts. Conditional on these stopping circuits $gamma_j$, both the true correlation and the auxiliary weight factor into their exterior factors and the continuation masses $F \( gamma_j \; v_j \)$.
  Write the perturbed singleton weight as $v_j e^(w_j)$. Before the stops it changes the local weight by at most $exp \( sum_j \| w_j \| D_j \)$ in absolute value. After dividing by the reference factors in (3.15), (3.3) bounds the continuation corrections by
  $ exp (C sum_j \| w_j \| \[ 1 + L_j + log \( 2 + n \/ a \) \]) . $
  The remaining nonsingleton factors are bounded by $K^X$. Apply Hölder, use every fixed moment in (3.17), and then choose $max_j \| w_j \|$ small enough for the joint exponential moments of $L_j \, D_j$. This proves the uniform complex bound, including exhaustion at the terminal scale. Nonvanishing of the denominator is supplied by Proposition 7.
  We now prove convergence, retaining $a gt.eq c n$. First let the singleton weights be real and positive; other weights may be arbitrary fixed complex numbers in their bounded set. Remove singleton weighting from all loops of maximum radius below $epsilon.alt n$ about their point, and truncate each reference $F_n$ by exactly this prescription. Denote the resulting normalized quantity by $cal(C)_(n \, epsilon.alt)$. The preceding bounds imply
  #[#set math.equation(numbering: n => "(3.18)")
   $ lim_(epsilon.alt arrow.b 0) limsup_(n arrow.r oo) \| cal(C)_n - cal(C)_(n \, epsilon.alt) \| = 0 . $ <eq:radial-normalized-truncation>]
  Here are the details ensuring cancellation of the small-loop masses. The first-screen waiting times in all patches can be restricted to any fixed large number $L_0$ of bands with arbitrarily small additive error, before or after thresholding. Use their exponential tails and Hölder with the bounded moments of the absolute exterior factor; the uniform threshold version gives the same estimate for the truncated expression. On the retained stops the screens have size at least a fixed multiple of $n K^(- L_0)$. For sufficiently small $epsilon.alt$, every completed exterior loop with nontrivial weight is unchanged by thresholding: a loop enclosing the point outside its screen encloses that screen, and every other exterior factor is already macroscopic. The only changes are therefore in the continuation masses. Their ratios to the reference $F_n$ agree to $1 + o \( 1 \)$ by (3.4), uniformly at these boundedly many levels. The integral of the absolute exterior factor is bounded. First let $n arrow.r oo$, then $epsilon.alt arrow.b 0$, and finally $L_0 arrow.r oo$. This proves (3.18).
  For fixed $epsilon.alt > 0$, the truncated expression has a limit by the plane nested-loop convergence in Input 4. We specify the continuity and integrability requirements. Loops deciding the truncated test have spherical diameter bounded below after rescaling, and the cited topology retains their individual curves. A fixed continuum point lies on no macroscopic loop almost surely: RSW screening bounds the probability that a loop arriving from a fixed distance reaches a shrinking disk about it. Enclosure is therefore a continuous winding test at each prescribed point. Choose maximum-radius thresholds outside the at most countable set of atoms of the relevant radius variables. Loops separating the marked points but escaping an arbitrarily large fixed ball can first be discarded. They must meet the finite joining tree, so successive annular screens make the discarded probability tend to zero uniformly in the mesh. Passage moments give uniform integrability, including for complex exterior factors. Thus convergence of the truncated expectations follows from the stated plane theorem, without a bounded-domain loop limit. The real truncated reference masses stay bounded away from zero: their counts have uniformly bounded moments at fixed $epsilon.alt$, and Jensen’s inequality applies when the weight is below one.
  The cutoff $b_0$ can be chosen once for the finitely many limiting reference tests. Plane homogeneity gives the same choice at translated points. Equation (3.18) then gives convergence of the untruncated normalized expression for real positive singletons. The complex bounds give a normal family. Two subsequential holomorphic limits agree on the real singleton box, with arbitrary fixed remaining weights; repeated one-variable uniqueness makes them identical throughout each complex neighborhood. Hence the convergence is locally uniform.
  Finally assume all weights are positive and bounded above and below. The true tilted mass compares both ways to $Z_U$ by the $K^(plus.minus X)$ bounds. Under that true law, Hölder and (3.17) preserve an exponential tail for the first patch screen, with the additional factor $\( n \/ a \)^C$ when the separation varies. Conditional on that screen, the inward law is exactly the singleton tilt at its point. Apply the circuit coupling from Proposition 7, allowing for its random initial level by the first-screen tail. This yields the final coupling assertion. It also couples local observables obtained by averaging orientation marks on loops contained in the common screen: a mark strictly inside the screen cannot lie on an exterior loop. ◻
]

#thm([Corollary 3.3.])[
  (Macroscopic tests with local insertions).  #emph[Let $u_j \/ n$ converge to distinct points, with their point parities fixed, and let $P_j$ be disjoint round patches centered at $u_j$, of radii fixed positive multiples of $n$, with disjoint larger collars. Fix $v_j > 0$ and define 
$ U_n = product_j v_j^(\# { ell : u_j upright(" inside ") ell \, med ell subset P_j }) . $

 Suppose $T_n$ is a uniformly bounded discretization, $sup_n parallel T_n parallel_oo < oo$, of a fixed bounded functional $T$ of the rescaled plane loop collection, determined in a fixed bounded region by loops of diameter at least a fixed $delta > 0$. Suppose that this functional is almost surely continuous for the plane loop limit, with its marked-point, patch-boundary and contact tests taken at continuity radii. Here discretization means that $T_n \( omega_n \) arrow.r T \( omega \)$ whenever the relevant rescaled loop collections $omega_n$ converge to a continuity configuration $omega$. Then the following sequence converges as $n arrow.r oo$: 
#[#set math.equation(numbering: n => "(3.19)")
 $ frac(bb(E) \[ U_n T_n \], product_j F_n \( v_j \)) . $ <eq:radial-macroscopic-test>]

]
  #emph[The conclusion also applies to tests obtained by first excluding arbitrarily large excursions, provided the discarded part tends to zero in probability under the normalized $U_n$ law uniformly in $n$. Boundedness of $T_n$ may be replaced by $\| T_n \| lt.eq K^(X_n)$, where $X_n$ is the sum of a fixed finite family of macroscopic passage counts satisfying 
#[#set math.equation(numbering: n => "(3.20)")
 $ sup_n frac(bb(E) \[ U_n e^(t X_n) \], bb(E) U_n) < oo #h(2em) upright("for every fixed ") t < oo \, $ <eq:radial-test-integrability>]

 also after the inner-radius truncations of the local weights. The bounded truncations of the test must satisfy the preceding continuity requirement.]
] <cor:macroscopic-test>

#proof[
  Choose $eta > 0$ smaller than the patch radii and, taking account of the fixed band-radius factors, small enough that every screen sought below $eta n$ has diameter less than $delta n$. Under the normalized $U_n$ law, regeneration between radii $eta n$ and $epsilon.alt n$ supplies a surrounding circuit at each marked point, except with probability $C \( epsilon.alt \/ eta \)^c$. The same statement holds for thresholded local weights. A loop used by the test has diameter at least $delta n$, so cannot be contained inside these circuits; it cannot cross them either. Thus the events where a tested macroscopic loop enters the $epsilon.alt n$ neighborhoods of the marked points can be discarded with an error tending to zero. Under (3.20), Hölder’s inequality makes the same discarded contribution small for the unbounded test.
  Search for the first screens below $eta n$. Conditional on these screens the test, after this exclusion, is determined by their exterior. Restrict their waiting times to a fixed number of bands, use their exponential tails for the remainder, and truncate the local weights and all reference factors at the same radius $epsilon.alt n$. Exactly the continuation-quotient argument proving (3.18) shows that this changes (3.19) by $o \( 1 \)$, uniformly for large $n$ as $epsilon.alt arrow.b 0$. For fixed $epsilon.alt$, all remaining weights and tests concern macroscopic loops. Input 4 and the stated continuity assumptions give convergence. Large excursions are removed before this step and restored afterwards using their assumed small probability and uniform integrability.
  For an unbounded test, truncate at $\| T_n \| lt.eq M$. The mass comparison (3.16) bounds $bb(E) U_n \/ product_j F_n \( v_j \)$ above and below. Condition (3.20) therefore makes the discarded normalized expectations tend to zero as $M arrow.r oo$, uniformly in $n$ and in the inner cutoff. This proves the extension. For the passage counts used below, condition (3.20) follows from (3.17): their buffers are outside the local patch cores, with a bounded cutoff rollback at the innermost buffers. ◻
]

== 4 Electric potentials and angular spectra <sec:spectral>

The radial estimates control changes of boundary data. To obtain a convergent normalization, we also need an equation for the spatial dependence of an electric insertion. The equation proved below is approximate harmonicity with a summable power error. Its proof uses two slicings of the square array. Slicing parallel to the insertion line gives an improved estimate from the vacuum spectrum; slicing perpendicularly gives derivative bounds which carry that estimate up to the line.

Throughout this section the lattice spacing is one in tile coordinates, and $0 < lambda lt.eq pi \/ 3$ is fixed. We use the plane row representation of Input 5. Some spectral arguments below adapt those of #cite(label("GFFCompanion")) Section 4, “Finite inner functions and a measure on dilation orbits” and “The height variogram”. That section is stated for $lambda > pi \/ 3$. We therefore give the arguments in the present representation, identifying the row identities they require. No assertion about an angular representation outside its stated parameter range is used as an input.

=== 4.1 Rows, currents, and their spectral measure <rows-currents-and-their-spectral-measure>

We first specify the row coordinates and the exchange identity. Put $v_0 = pi \/ 2$. A strip angle $z$, with $\| Re z \| < v_0$, corresponds to the half-plane argument $w = e^(i z)$; conversely $z = - i "Log" w$, using the logarithm on $Re w > 0$. The argument of the local matrix in a homogeneous row is

$ u \( z \) = rho \( v_0 - z \) \, #h(2em) R \( u \) = mat(delim: "(", sin \( lambda - u \) \/ sin lambda, 0, 0, 0; 0, sin u \/ sin lambda, 1, 0; 0, 1, sin u \/ sin lambda, 0; 0, 0, 0, sin \( lambda - u \) \/ sin lambda) . $

On an even spatial circle of size $N$, with quantum spin space $\( bb(C)^2 \)^(⊗ N)$, define the monodromy and marked row by

$ cal(M)_(N \, c) \( z \) = R_(c 0) \( u \( z \) \) dots.h.c R_(c \, N - 1) \( u \( z \) \) \, #h(2em) T_N^D \( z \) = "tr"_c #scale(x: 120%, y: 120%)[\(] D_c cal(M)_(N \, c) \( z \) #scale(x: 120%, y: 120%)[\)] . $

The index $c$ denotes a two-dimensional auxiliary space. Let $Omega_N$ be the positive unit Perron vector of the untwisted rows on the zero-total-spin sector, and let $Lambda_N \( z \)$ be its eigenvalue for real strip angles, analytically continued using that common eigenvector. The marked rows themselves act on the full quantum spin space; in particular a local matrix $O$ need not preserve the zero-total-spin sector. For real strip angles, divide by $Lambda_N \( z \)$ and take plane word limits. Denote the resulting row and its bounded holomorphic continuation by $hat(A)^D \( z \)$. We use $A^D \( w \) = hat(A)^D \( - i "Log" w \)$ below. A finite row word means a vector

$ hat(A)^(D_r) \( z_r \) dots.h.c hat(A)^(D_1) \( z_1 \) Omega \, #h(2em) r < oo \, $

initially with real $z_j in \( - v_0 \, v_0 \)$; the empty word is the vacuum $Omega$.

The local Yang–Baxter identity, and its row consequence, are

#[#set math.equation(numbering: n => "(4.1)")
 $ R_12 \( u - u' \) R_13 \( u \) R_23 \( u' \) & = R_23 \( u' \) R_13 \( u \) R_12 \( u - u' \) \,\
cal(R)_12 \( z \, z' \) cal(M)_(N \, 1) \( z \) cal(M)_(N \, 2) \( z' \) & = cal(M)_(N \, 2) \( z' \) cal(M)_(N \, 1) \( z \) cal(R)_12 \( z \, z' \) \,\
cal(R)_12 \( z \, z' \) & = R_12 #scale(x: 120%, y: 120%)[\(] rho \( z' - z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:row-exchange>]

These are the finite identities in the Row Algebra and the Infinite-Plane State subsection of #cite(label("FKCompanion")). In particular, if $cal(R)$ is invertible and

$ cal(R) \( D ⊗ E \) cal(R)^(- 1) = sum_ell D_ell ⊗ E_ell \, $

then auxiliary tracing, followed by the plane limit, gives the marked exchange rule

#[#set math.equation(numbering: n => "(4.2)")
 $ hat(A)^D \( z \) hat(A)^E \( z' \) = sum_ell hat(A)^(E_ell) \( z' \) hat(A)^(D_ell) \( z \) . $ <eq:marked-row-exchange>]

There are at most sixteen terms after expansion in tensor matrix units. The normalization cancels on the two sides. Analyticity extends this identity wherever its intertwiner is invertible.

Set

$ Z = mat(delim: "(", 1, 0; 0, - 1) \, #h(2em) X = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) K \( zeta \) = "diag" \( zeta \, zeta^(- 1) \) \, #h(2em) \| zeta \| = 1 \, $

and

$ P_zeta \( w \) = A^(K \( zeta \)) \( w \) \, #h(2em) P \( w \) = A^I \( w \) \, #h(2em) J \( w \) = A^Z \( w \) . $

The Hilbert space completion of the row words is denoted by $cal(H)$, and $Omega$ has norm one. The rows are bounded and holomorphic for $Re w > 0$, with $parallel A^D \( w \) parallel lt.eq 2 parallel D parallel$. Their reflection rule is

#[#set math.equation(numbering: n => "(4.3)")
 $ hat(A)^D \( z \)^(*) = hat(A)^(X overline(D) X) \( - overline(z) \) \, #h(2em) A^D \( w \)^(*) = A^(X overline(D) X) \( overline(w) \) . $ <eq:row-adjoint>]

This is Equation #raw("bulk:adjoint") of #cite(label("FKCompanion")), continued holomorphically from real strip angles. In particular, $J \( w \)^(*) = - J \( overline(w) \)$. The $P_zeta$ rows with the same twist commute and are normal; $P_zeta \( 1 \)$ is self-adjoint. Every $P_zeta \( w \)$ is a contraction in the closed right half-plane away from zero. At its two boundary arguments the untwisted rows are the spatial shift and its inverse:

#[#set math.equation(numbering: n => "(4.4)")
 $ P \( i \) = S \, #h(2em) P \( - i \) = S^(- 1) \, #h(2em) A^D \( i \) = S D_0 \, #h(2em) A^D \( - i \) = \( X D^t X \)_0 S^(- 1) . $ <eq:spectral-endpoints>]

Here $D_0$ acts at one site and $S Omega = Omega$. Dilation of the argument is implemented by a strongly continuous unitary group fixing $Omega$. Also $P \( w \) Omega = Omega$.

These facts follow from the Plane Kernels, Angle Generator, and Scalar Continuation in a Fixed Band lemmas in #cite(label("FKCompanion")) Section “Angular transfer and its two leading modes”. We record the analytic estimates in the latter proof which will also justify differentiation at an endpoint. For one radius $r_lambda > 0$, independent of all sufficiently large even $N$, the two quotients

#[#set math.equation(numbering: n => "(4.5)")
 $ T_N^D \( z \) T_N^I \( z \)^(- 1) \, #h(2em) T_N^I \( z \)^(- 1) T_N^D \( z \) $ <eq:finite-endpoint-division>]

are holomorphic and bounded by $C_lambda parallel D parallel$ on the discs $\| z - v_0 \| < r_lambda$ and $\| z + v_0 \| < r_lambda$. This is Equation #raw("bulk:division") and the crossing argument in that proof. On these endpoint discs $T_N^I \( z \)$ is invertible, so $Lambda_N \( z \)$ is nonzero there. We use nonvanishing of its complex continuation only on these discs. In particular, the marked vacuum vectors have uniform holomorphic bounds on these discs.

For clarity, the dense set used to extend these vectors consists of finite words whose real angles lie in $\( - v_0 \/ 3 \, v_0 \/ 3 \)$. It is dense because orthogonality to such words extends, one argument at a time, by holomorphy. Exchanging an endpoint row through any one such word uses Equation (4.2). Its finitely many intertwiners stay invertible on a common disc about that endpoint: the word angles are separated from the endpoint by the middle third of the strip. The continuation radius is independent of the word, although its vector bound may depend on the word. This is the dense-set continuation step in the proof of the same Scalar Continuation lemma. The denominators of those intertwiners do not depend on $D$. Thus the scalar continuation discs, and the constants in the low-band arguments below, are uniform for the unit diagonal marks $K \( zeta \)$.

We will need the following concrete consequence for a fixed local spin matrix $O$. For the finite vacuum $Omega_N$ just specified, there are some $r_O > 0$ and $C_O < oo$,

#[#set math.equation(numbering: n => "(4.6)")
 $ sup_N sup_(\| z - v_0 \| < r_O) ∥frac(T_N^I \( z \), Lambda_N \( z \)) O Omega_N∥ lt.eq C_O . $ <eq:local-endpoint-bound>]

Only sufficiently large circles containing the support of $O$ are included. To obtain this bound, translate the fixed support into an interval, expand $O$ in tensor matrix units, and express each resulting vector by a finite product of positive endpoint rows, using Equation (4.4). Translation commutes with the unmarked row. Move the row at $z$ to the vacuum through those endpoint rows. The intertwiners are now near $R \( 0 \)$, the invertible swap, so their coefficients are bounded on a sufficiently small disc. The remaining endpoint rows are bounded shifts with local marks, and the marked vacuum vector is bounded by Equation (4.5). This proves Equation (4.6) without a bound depending on $N$. Cauchy’s formula consequently bounds the $k$th vector Taylor coefficient by $C_O r_O^(- k)$ after decreasing $r_O$. Plane word convergence and these bounds pass endpoint derivatives and their Gram pairings to the plane.

The untwisted commuting rows have spectral functions $f$ satisfying

#[#set math.equation(numbering: n => "(4.7)")
 $ \| f \( w \) \| lt.eq 1 quad \( Re w > 0 \) \, #h(2em) f \( overline(w) \) = overline(f \( w \)) \, #h(2em) \| f \( i t \) \| = 1 quad \( t eq.not 0 \) . $ <eq:spectral-inner-input>]

They continue through the imaginary axis away from zero. Their zeros $a_j$ lie in a fixed cone $Re a_j gt.eq c_0 \| a_j \|$; the same cone and continuation statements hold for a fixed twist. The resulting inner factorization has the form

#[#set math.equation(numbering: n => "(4.8)")
 $ f \( w \) = gamma e^(- a w - b \/ w) product_j frac(w - a_j, w + overline(a_j)) thin gamma_j \, #h(2em) a \, b gt.eq 0 \, quad \| gamma \| = \| gamma_j \| = 1 \, $ <eq:general-spectral-factorization>]

with the usual summability condition on the zeros. This is precisely the factorization established in the Inner Factorization and Low Spectral Bands subsection of #cite(label("FKCompanion")).

Let $cal(D)$ be the closed subspace generated by words whose marks are diagonal. It is invariant under $P \, J$ and their adjoints, and contains finite height-phase insertions, by Equation (4.4). All untwisted spectral statements in the next proposition are on this subspace.

The proposition supplies two different estimates for the electric potential. Dilation decay first forces the spectral functions to be finite products, and the current cocycle then supplies their measure. Its width tail makes modes containing both very small and very large zeros rare; this will give the extra power in the off-axis Laplacian estimate. The degree moment has a separate role: it makes the logarithmic height variogram integrable, giving the growth bound needed for potential inversion in Section 5.

#thm([Proposition 4.1.])[
  (The current spectrum).  #emph[Almost every spectral function on $cal(D)$ is either $1$ or a finite Blaschke product with 
#[#set math.equation(numbering: n => "(4.9)")
 $ f \( 0 \) = f \( oo \) = 1 \, #h(2em) f \( overline(w) \) = overline(f \( w \)) . $ <eq:finite-spectral-inner>]

 There is a spectral vector $sans(h)$, not necessarily of finite norm, such that 
#[#set math.equation(numbering: n => "(4.10)")
 $ J \( w \) Omega = \( 1 - f \( w \) \) sans(h) . $ <eq:current-cocycle>]

 The measure $mu$ given by the squared fiber norm of $sans(h)$ is invariant under dilation. On the cross-section of products whose smallest zero has modulus one, it decomposes as 
#[#set math.equation(numbering: n => "(4.11)")
 $ mu = thin upright(d) s thin nu \( thin upright(d) F \) \, #h(2em) f \( w \) = F \( e^s w \) \, #h(2em) nu \( 1 \) < oo . $ <eq:current-disintegration>]

 If $cal(W) \( F \)$ is the difference between the largest and smallest logarithmic zero moduli, and $2 n_F$ is the degree, then, for some $eta_0 > 0$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ nu { cal(W) > t } lt.eq C e^(- 2 eta_0 t) \, #h(2em) integral n_F thin nu \( thin upright(d) F \) < oo . $ <eq:current-width-tail>]

 The physical plane height has logarithmic variance. More precisely, after an axial symmetry, write a nonzero displacement as $\( k \, j \)$ with $k gt.eq 1$ and $\| j \| lt.eq k$. Then 
#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] h \( k \, j \) - h \( 0 \, 0 \) #scale(x: 120%, y: 120%)[\)]^2 & = 2 Re integral #scale(x: 120%, y: 120%)[\(] 1 - f \( 1 \)^k f \( plus.minus i \)^(\| j \|) #scale(x: 120%, y: 120%)[\)] thin mu \( thin upright(d) f \)\
 & = 4 nu \( 1 \) log k + O \( 1 \) \, $ <eq:spectral-variogram>]

 where the sign agrees with the direction of the second coordinate. The error is uniform over these displacements.]
] <prop:spectral>

#proof[
  We begin with the decay furnished by Equation (4.2). If $w = e^s$ and $w'$ is fixed, then $z = - i s$ and the exchange parameter in Equation (4.1) is $rho \( z' - z \) = rho z' + i rho s$. Put $b \( u \) = sin u \/ sin lambda$. For $u = u_0 + i rho s$, the displayed matrix gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ frac(R \( u \), b \( u \)) = "diag" \( - e^(plus.minus i lambda) \, 1 \, 1 \, - e^(plus.minus i lambda) \) + O \( e^(- rho \| s \|) \) #h(2em) \( s arrow.r plus.minus oo \) . $ <eq:normalized-intertwiner-limit>]
  Indeed $sin \( lambda - u \) \/ sin u = - e^(plus.minus i lambda) + O \( e^(- 2 rho \| s \|) \)$, while the off-diagonal entries become $1 \/ b \( u \) = O \( e^(- rho \| s \|) \)$. The limit is diagonal and invertible, and the normalized inverse is bounded for large $\| s \|$. Scalar normalization does not change auxiliary conjugation in Equation (4.2). This calculation holds for every fixed $0 < lambda < pi$.
  Move a row $P \( e^s \)$ through a fixed diagonal word $v$ to the vacuum. The limiting diagonal intertwiner commutes with the joint diagonal mark. Each exchange therefore differs from a commuting exchange by $O \( e^(- rho \| s \|) \)$ in operator norm. The number of exchanges is fixed, all marked rows are bounded, and $P \( e^s \) Omega = Omega$. Thus, with some $eta_0 > 0$ which we may decrease below $rho$,
  #[#set math.equation(numbering: n => "(4.15)")
   $ parallel \( 1 - P \( e^s \) \) v parallel lt.eq C_v e^(- eta_0 \| s \|) quad upright("outside a fixed bounded interval of ") s . $ <eq:diagonal-dilation-decay>]
  The endpoints are included by their strong limits. Thus the decay uses the explicit exchange rule and the target-range row bounds.
  For a countable total set of diagonal words, the spectral integral of $\| 1 - f \( e^s \) \|^2$ over $s$ is finite by Equation (4.15). Therefore it is finite for almost every spectral function on $cal(D)$. In Equation (4.8), a positive $a$ or $b$ would make $f \( e^s \)$ tend to zero at one end; hence $a = b = 0$. For a zero $a_j$ of modulus $r_j$, the identity
  $ lr(|frac(t - a_j, t + overline(a_j))|)^2 = 1 - frac(4 t Re a_j, \| t + overline(a_j) \|^2) $
  and the cone condition give fixed constants $c_1 \, c_2 > 0$ such that $1 - \| f \( e^s \) \| gt.eq c_1$ on $\| s - log r_j \| lt.eq c_2$. Infinitely many zeros would escape towards zero or infinity and yield infinitely many disjoint such intervals. Thus there are only finitely many zeros. Integrability forces both endpoint limits to be one. Reality pairs nonreal zeros with their conjugates, and the quotient of the endpoint limits is $\( - 1 \)^(deg f)$, so the degree is even. A constant spectral function must be one. This proves Equation (4.9).
  Differentiate commutation of two equally twisted rows with respect to their common twist at $zeta = 1$ and apply it to $Omega$. Linearity in the auxiliary mark gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ \( 1 - P \( w' \) \) J \( w \) Omega = \( 1 - P \( w \) \) J \( w' \) Omega . $ <eq:twist-derivative-cocycle>]
  There is no current on the spectral set $f = 1$. To see this, let $Q$ be its spectral projection. This set is invariant under dilation, so $Q$ commutes with the dilation group; also $Q S = S Q = Q$. The endpoint formulas give $J \( - i \) = - S^(- 1) J \( i \) S^(- 1)$. Compressing and then dilating yields
  $ Q J \( - i r \) Q = - Q J \( i r \) Q #h(2em) \( r > 0 \) . $
  These are the matching boundary values for the continuation of $Q J \( w \) Q$ to the left half-plane by odd reflection. The continued function is bounded on the punctured plane, and thus extends across zero and infinity. Liouville’s theorem and oddness make it zero. Since $Omega$ belongs to this spectral set, this also shows $Q J \( w \) Omega = 0$. On every other fiber $\| f \( 1 \) \| < 1$, so define $sans(h) = J \( 1 \) Omega \/ \( 1 - f \( 1 \) \)$ there. Equation (4.16) proves Equation (4.10), first on a countable dense set of arguments and then by analyticity and endpoint continuity.
  Dilation covariance fixes the vacuum and transforms this quotient without a scalar factor. Its squared fiber norm therefore defines a dilation-invariant measure $mu$. Normalize a nonconstant product by making its smallest zero modulus one. Translation invariance in the remaining logarithmic coordinate gives Equation (4.11), initially with a sigma-finite transversal measure. Every normalized product has a fixed-depth, fixed-width dip at that first zero, whereas
  $ integral \| 1 - f \( 1 \) \|^2 thin mu \( thin upright(d) f \) = parallel J \( 1 \) Omega parallel^2 < oo . $
  Integration over the dip proves $nu \( 1 \) < oo$.
  Apply Equation (4.15) to $v = J \( 1 \) Omega$. In the current measure this says
  $ I \( l \) := integral \| 1 - f \( 1 \) \|^2 \| 1 - f \( e^l \) \|^2 thin mu \( thin upright(d) f \) lt.eq C e^(- 2 eta_0 l) #h(2em) \( l gt.eq 1 \) . $
  For an orbit of width $cal(W)$, first put the argument $1$ in the dip at its smallest zero, and then put $e^l$ in the dip at its largest zero. Both choices occupy intervals of fixed positive length and both factors are bounded below. Consequently
  $ c thin nu { cal(W) > t } lt.eq integral_(t - C)^oo I \( l \) thin thin upright(d) l \, $
  with an adjustment for bounded $t$. This proves the width tail.
  We next justify the degree integrability needed for the height variance. This step records the local energy argument rather than presuming an integrability property of the transversal measure. For this local computation use the full untwisted representation on $cal(H)$, and let $E$ be its nonnegative spectral endpoint generator
  $ E \( f \) = - frac(thin upright(d), thin upright(d) s) arg f \( i e^s \)\|_(s = 0) . $
  In the general factorization its two exponential factors contribute $a + b$, and each zero contributes $2 Re a_j \/ \| i - a_j \|^2 gt.eq 0$. On $cal(D)$ the exponential factors have already been excluded. At finite circumference, differentiating the endpoint swap row gives the local link
  $ h_(j \, j + 1) = - rho thin "swap"_(j \, j + 1) R'_(j \, j + 1) \( 0 \) = mat(delim: "(", rho cot lambda, 0, 0, 0; 0, 0, - rho \/ sin lambda, 0; 0, - rho \/ sin lambda, 0, 0; 0, 0, 0, rho cot lambda)_(j \, j + 1) . $
  For a local spin matrix $O$, the vacuum normalization subtracts the vacuum energy, and therefore
  #[#set math.equation(numbering: n => "(4.17)")
   $ E \( O Omega \) = [sum_j h_(j \, j + 1) \, O] Omega . $ <eq:local-energy-action>]
  Only commutator terms whose links meet the support of $O$ survive. Equation (4.6) gives a disc and uniform vector Taylor bounds for this fixed $O$. Cauchy’s formula therefore passes the first derivative, and its Gram pairings with fixed local vectors, to the plane, proving Equation (4.17). Iterated commutators stay local and obey $parallel E^k O Omega parallel lt.eq C_O^(k + 1) k !$, since each commutator enlarges the support by at most two sites. These analytic vectors identify the closure of the local commutator operator with the spectral generator on the local-spin subspace. Thus Equation (4.17) also justifies its quadratic forms and the following Fourier computation.
  Write $p = arg f \( i \)$ modulo $2 pi$, and let $"sym"$ average a measure at $p$ and $- p$. The spectral measure of $Z_0 Omega = S^(- 1) J \( i \) Omega$ is $\| 1 - f \( i \) \|^2 mu$. Set
  $ D_0 = - chevron.l Omega \, \[ Z_0 \, \[ Z_0 \, h_(0 \, 1) \] \] Omega chevron.r . $
  Since $\[ h_(0 \, 1) \, Z_0 + Z_1 \] = 0$, the Fourier transform of the vacuum double commutators has only three coefficients, at $0 \, 1 \, - 1$, equal to $2 D_0 \, - D_0 \, - D_0$. By Equation (4.17), the same transform is twice the symmetrized energy-weighted spectral measure of $Z_0 Omega$. Dividing by $\| 1 - e^(i p) \|^2$ on compact subsets of $p eq.not 0$ gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ 2 "sym" #scale(x: 120%, y: 120%)[\(] p_(*) \( E mu \) #scale(x: 120%, y: 120%)[\)] = D_0 frac(thin upright(d) p, 2 pi) #h(2em) \( p eq.not 0 \) . $ <eq:current-energy-sum-rule>]
  On a degree-$2 n_F$ orbit the boundary phase is strictly decreasing and makes $n_F$ full turns along the positive imaginary ray. The change of variables $- thin upright(d) p = E thin thin upright(d) s$ therefore gives
  $ p_(*) \( E thin thin upright(d) s thin nu \) = (integral n_F thin nu \( thin upright(d) F \)) thin upright(d) p #h(2em) \( p eq.not 0 \) . $
  One may first restrict to measurable sets of orbits with bounded degree and width and to a bounded range of $s$, and then exhaust these sets by monotone convergence. Comparing with Equation (4.18) proves $4 pi integral n_F thin nu \( thin upright(d) F \) = D_0 < oo$.
  It remains to recover the height variance. A directed path of physical or endpoint steps has arguments $w_j in { 1 \, i \, - i }$ and multipliers $t_j = f \( w_j \)$. By Equations (4.3) and (4.10), the left vacuum current is $- \( 1 - f \( w \) \) sans(h)^(*)$ and the right vacuum current is $\( 1 - f \( w \) \) sans(h)$. Thus, for $a < b$,
  #[#set math.equation(numbering: n => "(4.19)")
   $ ⟨Omega \, J \( w_a \) (product_(a < j < b) P \( w_j \)) J \( w_b \) Omega⟩ = - integral \( 1 - t_a \) t_(a + 1) dots.h.c t_(b - 1) \( 1 - t_b \) thin thin upright(d) mu . $ <eq:two-current-coefficient>]
  For any directed tile step, its transverse spin is $+ 1$ when the arrow points along the left normal to that step. The height on the left of an arrow exceeds the height on its right by one, so the increment along the directed step is minus its transverse spin. This convention applies to the physical step and to both endpoint directions; the two minus signs cancel in the product. Taking the real part of Equation (4.19) gives their physical covariance in path order. At an endpoint the single-increment variance one equals $2 Re integral \( 1 - f \( i \) \) thin thin upright(d) mu$, by $\| f \( i \) \| = 1$ and $parallel Z_0 Omega parallel = 1$. The corresponding physical-step identity follows by moving the integration ray for $\( 1 - F \( w \) \) thin upright(d) w \/ w$ from $i bb(R)_(+)$ to $bb(R)_(+)$ on each orbit. The small and large circular arcs vanish because $F \( 0 \) = F \( oo \) = 1$; the integrable bounds below justify the integration over orbits. Now use the telescoping identity
  $ 1 - product_(a = 1)^m t_a = sum_a \( 1 - t_a \) - sum_(a < b) \( 1 - t_a \) t_(a + 1) dots.h.c t_(b - 1) \( 1 - t_b \) . $
  This proves the first equality in Equation (4.13), initially with truncated orbit integrals.
  Outside the zero range by logarithmic distance $d$, the factor formula gives
  $ \| 1 - F \( e^s \) \| + \| 1 - F \( plus.minus i e^s \) \| lt.eq C n_F e^(- d) \, $
  or the trivial uniform bound if it is smaller. Thus the integral outside the zero range enlarged at each end by $log k + log \( 1 + n_F \)$ is bounded uniformly. The additional interval lengths cost at most $C \( 1 + cal(W) + log \( 1 + n_F \) \)$. On an interval of radius $log k$ about any one logarithmic zero modulus $s_0$, the cone condition gives
  $ \| F \( e^s \) \|^k lt.eq exp { - c k e^(- \| s - s_0 \|) } . $
  Its integral on that interval is bounded uniformly in $k$. Multiplication by $F \( plus.minus i e^s \)^(\| j \|)$ does not change the bound. Consequently the real part of the orbit integral in Equation (4.13) is
  $ 2 log k + O \( 1 + cal(W) + log \( 1 + n_F \) \) . $
  The error is integrable by Equation (4.12) and degree integrability. These same majorants justify the ray move and telescoping passage. Axial symmetry of the plane law, which follows from the physical plane identification in Input 5, supplies the asserted bound for every displacement. ◻
]

=== 4.2 Electric insertions and the estimate away from their line <electric-insertions-and-the-estimate-away-from-their-line>

Fix $p$ distinct tile vertices $u_1 \, dots.h \, u_p$ on one tile axis, in a disk of radius $M n$, where $M$ and $p$ are fixed and $n gt.eq 2$. For real charges $t = \( t_1 \, dots.h \, t_p \)$ with $sum_j t_j = 0$, define

#[#set math.equation(numbering: n => "(4.20)")
 $ U_t = exp (i sum_j t_j h \( u_j \)) \, #h(2em) C \( t \; u \) = bb(E) U_t . $ <eq:electric-characteristic>]

Neutrality makes the expression independent of the additive height constant. Its loop expansion gives relative weight

#[#set math.equation(numbering: n => "(4.21)")
 $ v_I \( t \) = frac(cos \( lambda + sum_(j in I) t_j \), cos lambda) $ <eq:electric-loop-weight>]

to a loop enclosing exactly the point set $I$. Indeed a diagonal height string contributes $e^(i t)$ when a counterclockwise loop encloses charge $t$, while its two winding weights before the insertion are $e^(i lambda)$ and $e^(- i lambda)$. Summing their orientations gives Equation (4.21). The same identity follows for endpoint strings from Equation (4.4); ice conservation permits rerouting the strings. These finite-word identities use the plane-kernel identification in Input 5. Spin reversal also gives $C \( t \; u \) = C \( - t \; u \)$.

Choose $b > 0$ sufficiently small in terms of $p$ and $lambda$, and assume $max_j \| t_j \| lt.eq b$. All factors in either winding expansion are then positive. The number of charged loops has mean $O \( 1 + log n \)$ by the buffered passage estimates: assign loops to geometric scales about the marked points until scale $M n$, and use a bounded number of buffers at each scale. Since $log v_I \( t \) gt.eq - C b$, Jensen’s inequality gives

#[#set math.equation(numbering: n => "(4.22)")
 $ C \( t \; u \) gt.eq c n^(- C b) . $ <eq:small-charge-lower-bound>]

The constants do not require a lower bound on the separation of distinct marked vertices.

Fix a tile vertex $z_0$ and define the complex-valued potential

#[#set math.equation(numbering: n => "(4.23)")
 $ H \( z \) = frac(bb(E) \[ \( h \( z \) - h \( z_0 \) \) U_t \], C \( t \; u \)) . $ <eq:electric-potential>]

Changing $z_0$ adds a constant. Its unit increments are bounded uniformly in $n$: condition on the unoriented loops in the positive tilt of Equation (4.21). A marked spin lies on one loop, and its orientation average is a ratio of two orientation sums with denominator bounded away from zero for these charges. The numerator is uniformly bounded. Proposition 10 also gives, for each fixed insertion experiment,

#[#set math.equation(numbering: n => "(4.24)")
 $ \| H \( z \) - H \( z' \) \| lt.eq C_(t \, u) sqrt(1 + log \( 2 + \| z - z' \| \)) . $ <eq:potential-growth>]

This is Cauchy–Schwarz in the positive physical six-vertex law, using $\| U_t \| = 1$ and the logarithmic variance.

For a function on tile vertices, write

$ Delta_2 H \( z \) = H \( z + 2 e_1 \) + H \( z - 2 e_1 \) + H \( z + 2 e_2 \) + H \( z - 2 e_2 \) - 4 H \( z \) . $

The factor two removes the signs of the slowly damped row modes.

#thm([Lemma 4.2.])[
  (Off-axis Laplacian estimate).  #emph[There are constants $c_(*) > 0$ and $C < oo$, depending on the fixed parameter and on $p \, M$, such that, if $z$ has distance $r gt.eq 10$ from the axis containing the insertions, then 
#[#set math.equation(numbering: n => "(4.25)")
 $ \| Delta_2 H \( z \) \| lt.eq C n^(C b) r^(- 2 - c_(*)) . $ <eq:off-axis-laplacian>]

 For each fixed experiment, unit increments in either coordinate direction tend to zero when their base points tend to infinity along either normal to the insertion axis.]
] <lem:off-axis>

#proof[
  Take rows parallel to the insertion axis, with time increasing towards $z$. On the insertion slice, $U_t$ is a finite product of on-site diagonal unitaries, since all height differences can be written along that slice. The exterior vector therefore has norm at most one. The other side is the vacuum. The $r + O \( 1 \)$ ordinary rows between the two carry the damping $P \( 1 \)^k$, while translation along the slice carries powers of the unitary $P \( i \)$.
  For completeness, current placement in the stencil can be handled before any inverse is introduced. Start all height differences at one location a bounded number of rows before the stencil. A step issued from the vacuum has spectral vector $\( 1 - f \( w \) \) sans(h)$. Telescoping a path of such steps gives the difference of its endpoint translation multipliers. Thus the Laplacian stencil is, up to a common sign, the multiplier
  #[#set math.equation(numbering: n => "(4.26)")
   $ f \( 1 \)^k f \( i \)^j B \( f \) sans(h) \, #h(2em) B \( f \) = f \( 1 \)^2 + f \( 1 \)^(- 2) + f \( i \)^2 + f \( i \)^(- 2) - 4 \, $ <eq:laplacian-fiber>]
  where $k = r + O \( 1 \)$ and $j in bb(Z)$. With the vacuum on the bra side, the same calculation uses the conjugate multipliers. The inverse time powers in this notation cancel against already present ordinary rows. Thus it represents a finite sum of legitimate nonnegative row products even when $f \( 1 \)$ is small. Cauchy–Schwarz and Equation (4.22) reduce the lemma to a bound on the norm of Equation (4.26).
  Put $u_f = - log \| f \( 1 \) \|$ and consider a small dyadic band $u \/ 2 < u_f lt.eq u$. Evaluation of the factorization at $1$ and the zero cone give the budget
  #[#set math.equation(numbering: n => "(4.27)")
   $ sum_j min \( \| a_j \| \, \| a_j \|^(- 1) \) lt.eq C u . $ <eq:spectral-zero-budget>]
  Each zero is either of modulus at most $C u$ or of modulus at least $\( C u \)^(- 1)$. On the unit semicircle the logarithm of $f$ relative to its approximate sign is $O \( u \)$. Hence $B \( f \) = O \( u^2 \)$ on the whole band. If all zeros are small, expansion of the factors gives
  $ log f \( w \) = a_f \/ w + O \( u^2 \) \, #h(2em) \| a_f \| lt.eq C u \, #h(2em) \| w \| = 1 \, med Re w gt.eq 0 \, $
  with a real $a_f$; if all zeros are large, it instead gives $log f \( w \) = b_f w + O \( u^2 \)$ with real $b_f$ and $\| b_f \| lt.eq C u$. The logarithms are taken relative to the same sign; the squares of $f$ in $B$ remove that sign. The quadratic terms in $B$ cancel, because $1^2 + i^2 = 0$ and $1^(- 2) + i^(- 2) = 0$. Therefore
  #[#set math.equation(numbering: n => "(4.28)")
   $ \| B \( f \) \| lt.eq C u^3 quad upright("if the band has only small zeros or only large zeros") . $ <eq:pure-band-cancellation>]
  The bounds on the remainders follow by summing the factor expansions; Equation (4.27) bounds both their first moments and the sums of their quadratic remainders.
  We now quantify the cost of the remaining, mixed-zero band. Along one dilation orbit, a dyadic band occupies a bounded logarithmic length on each exterior tail: there $u_f$ is comparable to the sum of the small zero moduli, or to the sum of the reciprocal large zero moduli, and these sums vary geometrically with dilation. The intervening part has length at most $cal(W) + C$. In particular
  $ mu { u \/ 2 < u_f lt.eq u } lt.eq C integral \( 1 + cal(W) \) thin thin upright(d) nu lt.eq C . $
  A mixed-zero band requires $cal(W) gt.eq 2 log \( 1 \/ u \) - C$. By Equation (4.12), its measure is at most
  $ C integral_({ cal(W) gt.eq 2 log \( 1 \/ u \) - C }) \( 1 + cal(W) \) thin thin upright(d) nu lt.eq C u^(2 eta_0) \, $
  after decreasing $eta_0$ if needed. Combining this with the $O \( u^2 \)$ bound on that set and Equation (4.28), and then taking square roots, proves
  #[#set math.equation(numbering: n => "(4.29)")
   $ (integral_({ u \/ 2 < u_f lt.eq u }) \| B \( f \) \|^2 thin thin upright(d) mu)^(1 \/ 2) lt.eq C u^(2 + c_(*)) $ <eq:laplacian-band-norm>]
  for some $c_(*) > 0$.
  On this band the time rows contribute $e^(- c r u)$. Summing the dyadic estimates in Equation (4.29) gives $C r^(- 2 - c_(*))$. On the complement of the small bands, expand the stencil into its finitely many current increments before estimating. The current measure of ${ u_f gt.eq u_0 }$ is finite for each $u_0 > 0$, since $\| 1 - f \( 1 \) \| gt.eq 1 - e^(- u_0)$ there and $integral \| 1 - f \( 1 \) \|^2 thin thin upright(d) mu < oo$. Cancel the at most two inverse time powers in Equation (4.26) first. At least $r - O \( 1 \)$ time rows remain, giving exponential damping on this finite-measure set. The constant spectral function contributes no current. This proves Equation (4.25).
  The last assertion needs no power rate. Each unit increment is paired with a bounded exterior vector and contains arbitrarily many ordinary rows acting on $J \( 1 \) Omega$ or $J \( plus.minus i \) Omega$. On the nonconstant current spectrum $\| f \( 1 \) \| < 1$, and the constant spectrum has zero current. Dominated convergence in its finite current-vector norm therefore makes the increment tend to zero. ◻
]

=== 4.3 Twisted rows and finite differences near the axis <twisted-rows-and-finite-differences-near-the-axis>

The preceding proof uses a vacuum half-plane and thus loses its damping at the insertion line. A different slicing supplies bounds there: an interval between insertions contains a constant diagonal twist, and a step-two height increment is small on its low bands.

For a fixed unit twist define

$ J_zeta \( w \) = A^(Z K \( zeta \)) \( w \) \, #h(2em) H_zeta = - log \| P_zeta \( 1 \) \| \, #h(2em) Q_zeta \( u \) = upright(bold(1))_(\[ 0 \, u \]) \( H_zeta \) . $

Split $Q_zeta \( u \)$ further into the two signs of $P_zeta \( 1 \)$. For each fixed argument $w$, the joint spectral projection of ${ f : f \( w \) = 0 }$ is zero, by the Scalar Continuation in a Fixed Band lemma, label #raw("bulk:edge-band"), in #cite(label("FKCompanion")). In particular this holds at $w = 1$, so $H_zeta$ is a densely defined nonnegative self-adjoint operator. The same zero budget as in Equation (4.27), now including the possible exponential factors in Equation (4.8), shows that on $Q_zeta \( u \)$ both $P_zeta \( w \)$ and its inverse are uniformly bounded for

#[#set math.equation(numbering: n => "(4.30)")
 $ A u < \| w \| < a \/ u \, #h(2em) Re w gt.eq 0 \, $ <eq:twisted-annulus>]

and on the unit semicircle

#[#set math.equation(numbering: n => "(4.31)")
 $ P_zeta \( w \) Q_zeta^sigma \( u \) = sigma Q_zeta^sigma \( u \) + O \( u \) \, #h(2em) sigma in { + 1 \, - 1 } . $ <eq:twisted-sign>]

The constants $A \, a$ and the errors are uniform over unit twists.

#thm([Lemma 4.3.])[
  (Twisted finite differences).  #emph[Suppose a row interval contains no insertion, has one fixed unit twist, and leaves at least $l$ physical rows on each side of an observation stencil. For every fixed $k gt.eq 1$, every $k$-fold coordinate difference with steps of length two satisfies 
#[#set math.equation(numbering: n => "(4.32)")
 $ \| D_2^(\( k \)) H \( z \) \| lt.eq C_k n^(C b) l^(- k) \, #h(2em) l gt.eq 10 k . $ <eq:twisted-derivative-bound>]

 The estimate is uniform in the twist and in the spatial position of the stencil. The directions of the differences may be mixed.]
] <lem:twisted-differences>

#proof[
  Write $U = P_zeta \( i \)$. The twisted endpoint formulas give
  $ J_zeta \( i \) = U Z_0 \, #h(2em) J_zeta \( - i \) = - Z_0 U^(- 1) \, #h(2em) J_zeta \( - i \) = - U^(- 1) J_zeta \( i \) U^(- 1) \, $
  and the analogous identity on the other ray. This follows by substituting $Z K \( zeta \)$ in Equation (4.4); $Z$ commutes with the diagonal twist and changes sign under $X$. Dilate the endpoint identity before compressing. The compressed current $J_(zeta \, u) \( w \) = Q_zeta \( u \) J_zeta \( w \) Q_zeta \( u \)$ consequently extends to the other half of Equation (4.30) by
  #[#set math.equation(numbering: n => "(4.33)")
   $ J_(zeta \, u) \( - w \) = - P_zeta \( w \)^(- 1) J_(zeta \, u) \( w \) P_zeta \( w \)^(- 1) \, $ <eq:twisted-current-gluing>]
  where the inverses are restricted to the low band. The formulas agree on both imaginary rays by strong endpoint continuity. Morera’s theorem applied to matrix coefficients gives a bounded holomorphic function on the full annulus. Its Laurent expansion $sum_j w^j J_(zeta \, u \, j)$ satisfies
  $ parallel J_(zeta \, u \, j) parallel lt.eq C \( C u \)^(\| j \|) . $
  In particular its odd part on $\| w \| = 1$ is $O \( u \)$.
  On an equal-sign block, Equations (4.31) and (4.33) show that the even part is bounded by $C u$ times the whole block. Absorbing this term proves that the whole equal-sign block is $O \( u \)$. A two-step height difference is, up to its sign convention and a fixed factor, the doubled current
  $ J_zeta \( w \) P_zeta \( w \) + P_zeta \( w \) J_zeta \( w \) . $
  For a spatial difference the precise endpoint compensation is
  $ U^(- 2) #scale(x: 120%, y: 120%)[\(] J_zeta \( i \) U + U J_zeta \( i \) #scale(x: 120%, y: 120%)[\)] = U^(- 1) Z_0 U + Z_0 . $
  The compensating inverse is unitary and preserves the low bands. On opposite-sign blocks its leading signs cancel, leaving $O \( u \)$ by boundedness of the current. Thus the doubled current is $O \( u \)$ on the full low band. This argument does not require a separate decay bound for an undoubled opposite-sign current.
  We describe why these row estimates apply to observations at any spatial position. In a finite row the auxiliary mark measures the spin at the insertion seam. Differentiate $\[ P_zeta \( w \) \, U \] = 0$ in $theta$, where $zeta = e^(i theta)$. Since $partial_theta P_zeta \( w \) = i J_zeta \( w \)$ and $partial_theta U = i U Z_0$, the result is the exact identity
  #[#set math.equation(numbering: n => "(4.34)")
   $ U^(- 1) J_zeta \( w \) U = J_zeta \( w \) + Z_0 P_zeta \( w \) - P_zeta \( w \) Z_0 . $ <eq:translated-current>]
  The local conservation law $\[ Z_c + Z_0 \, R_(c 0) \] = 0$ identifies the right-hand side as the row with the measured auxiliary spin moved across tile $0$, while the diagonal twist remains at the original seam. Iteration gives the probe at site $j$ by conjugation with $U^j$. Equivalently, the diagonal factors acquired in a translated seam move it back by ice conservation. A spatial height step is the on-site operator $Z$, which commutes with these factors. These are identities of a finite tensor array with no wraparound; only finitely many translations occur in every plane correlation. They therefore pass through the plane-kernel limit. All compensating shifts are unitary, so their number introduces no factor into the estimate.
  On a low band, Equation (4.31) gives $P_zeta \( i \)^2 = I + O \( u \)$ and $P_zeta \( 1 \)^2 = I + O \( u \)$. Accordingly each additional spatial two-step difference, acting by translation on both sides of the probe, contributes another factor $u$: for its translation $T$ and compressed probe $O$, use $T^(- 1) O T - O = T^(- 1) \[ O \, T - I \]$. A temporal two-step difference shifts two rows from one side of the probe to the other and has the same property. The inverses used in this low-band calculation are bounded there; before compression, all expressions retain their common nonnegative damping rows. Induction on the number of differences therefore gives $C_k u^k$ for a $k$-fold difference of $H$, before division by $C \( t \; u \)$, when both adjacent states have cutoff $u$. For unequal cutoffs the estimate holds with their maximum, since both projections lie in that larger low band.
  The remaining rows turn these band estimates into spatial estimates. Split each side into $\[ 0 \, l^(- 1) \]$, dyadic bands above $l^(- 1)$ up to a small fixed threshold, and the remaining spectral projection. A band of lower endpoint $u$ is damped by $e^(- l u)$ by its $l$ physical rows. The low-band terms are bounded by the convergent double dyadic sum
  $ C_k sum_(u \, u') max \( u \, u' \, l^(- 1) \)^k e^(- c l \( u + u' \)) lt.eq C_k l^(- k) . $
  For the remaining bands, expand the finitely many differences and keep $l - O \( k \)$ rows; their contribution decays exponentially. All exterior strings are products of unit-twist rows and diagonal unitaries. Their norms are at most one. Finally divide by $C \( t \; u \) gt.eq c n^(- C b)$ to obtain Equation (4.32). ◻
]

#thm([Proposition 4.4.])[
  (A summable Laplacian error).  #emph[For the neutral small-charge experiments of Equation (4.20), there are $c_1 > 0$ and $C < oo$ such that 
#[#set math.equation(numbering: n => "(4.35)")
 $ \| Delta_2 H \( z \) \| lt.eq C n^(C b) (1 + min_j \| z - u_j \|)^(- 2 - c_1) #h(2em) \( z in bb(Z)^2 \) . $ <eq:laplacian>]

 The constants are uniform over the stated geometry and charges.]
] <prop:laplacian>

#proof[
  Let $r = min_j \| z - u_j \|$, and first suppose $r$ is sufficiently large. Choose $delta > 0$ so small that $\( 2 + c_(*) \) \( 1 - delta \) > 2$, where $c_(*)$ is supplied by Lemma 11. If the transverse distance of $z$ from the insertion axis is at least $r^(1 - delta)$, that lemma gives the result immediately with exponent $\( 2 + c_(*) \) \( 1 - delta \) - 2 > 0$.
  Otherwise move $z$ in the normal direction to a vertex $z'$ in the same coordinate-parity coset whose transverse distance lies between $r^(1 - delta)$ and $r^(1 - delta) + 2$. Its longitudinal distance from every insertion is at least a fixed multiple of $r$. The entire intervening stencil therefore has, in the slicing with time along the insertion axis, an insertion-free interval with $l gt.eq c r$ rows on both sides. Each normal step of length two changes $Delta_2 H$ by a sum of third differences, since each central second difference is a translate of two successive step-two differences. By Lemma 12, summing at most $C r^(1 - delta)$ steps gives
  $ \| Delta_2 H \( z \) - Delta_2 H \( z' \) \| lt.eq C n^(C b) r^(1 - delta) r^(- 3) = C n^(C b) r^(- 2 - delta) . $
  At $z'$ use Lemma 11. Taking $c_1 = min { delta \, \( 2 + c_(*) \) \( 1 - delta \) - 2 } > 0$ proves the claim for large $r$. For bounded $r$, the uniform bound on unit increments of $H$ proves the same estimate after enlarging $C$. ◻
]

The power in Equation (4.35) makes its right-hand side summable on each of the four coordinate-parity cosets. Together with the sublogarithmic growth in Equation (4.24), this is the input needed to recover the potential from its discrete Laplacian.

== 5 Electric correlations and their amplitudes <sec:electric>

The Laplacian estimate of Proposition 13 determines the interaction between separated electric charges. Its integrable power remainder is essential: it gives a convergent amplitude, rather than only a logarithmic exponent. We first obtain that interaction for small charges, then continue it to the charges that suppress microscopic loops around the marked points.

We retain the neutral axial correlation

$ C \( upright(bold(t)) \; upright(bold(u)) \) = bb(E) exp #h(-0.16667em) (i sum_(j = 1)^p t_j h \( u_j \)) \, #h(2em) sum_(j = 1)^p t_j = 0 \, $

and its potential $H_(upright(bold(t)))$ from Section 4. In the positive winding convention a loop enclosing the set $I$ of marked points has relative weight

$ v_I^(+) \( upright(bold(t)) \) = frac(cos \( lambda + sum_(j in I) t_j \), cos lambda) . $

The opposite convention has $v_I^(-) \( upright(bold(t)) \) = v_I^(+) \( - upright(bold(t)) \)$ and gives the same correlation. In particular, $C \( upright(bold(t)) \; upright(bold(u)) \) = C \( - upright(bold(t)) \; upright(bold(u)) \)$. Write

$ v \( t \) = frac(cos \( lambda + t \), cos lambda) \, #h(2em) I_lambda = \( - pi \/ 2 - lambda \, pi \/ 2 - lambda \) . $

Thus $v \( t \) > 0$ on $I_lambda$. As in Section 3, $F_n \( v \)$ uses the fixed plane cutoff $b_0 n$ and fixed lattice rounding.

=== 5.1 The potential kernel and local charge profiles <the-potential-kernel-and-local-charge-profiles>

Set $A = 1 \/ \[ 2 pi \( pi - lambda \) \]$. The covariance calculation below identifies this constant in the potential-kernel argument.

#thm([Proposition 5.1.])[
  (Coulomb formula).  #emph[Fix a number $p$ of marked points. There are $b \, c \, xi > 0$ and a real-analytic function $f$ on a neighborhood of $\[ - b \, b \]$, with $f \( 0 \) = 0$, such that, for neutral real charges $max_j \| t_j \| lt.eq b$ and distinct points on a tile axis satisfying 
$ max_j \| u_j \| lt.eq M n \, #h(2em) min_(i eq.not j) \| u_i - u_j \| gt.eq n^(1 - xi) \, $

 one has 
#[#set math.equation(numbering: n => "(5.1)")
 $ log C \( upright(bold(t)) \; upright(bold(u)) \) = sum_(j = 1)^p f \( t_j \) + 2 A sum_(i < j) t_i t_j log \| u_i - u_j \| + O \( n^(- c) \) \, #h(2em) f \( 0 \) = 0 . $ <eq:coulomb>]

 Here the same local function $f$ is used for every number of points, on their common small-charge neighborhood; it is independent of the geometry and of the point parities. The constants can depend on $p \, M$ and $q$.]
  #emph[For either choice of sign, the corresponding multiplicative statement has analytic continuation along compact paths from zero in 
$ cal(D)_p^plus.minus = { upright(bold(t)) in bb(R)^p : med sum_j t_j = 0 \, med plus.minus t_j in I_lambda upright(" for every ") j } . $

 More precisely, on a sufficiently thin complex neighborhood of each such compact path within the neutral hyperplane $sum_j t_j = 0$, there is a holomorphic function $M_p$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ frac(C \( upright(bold(t)) \; upright(bold(u)) \), product_(i < j) \| u_i - u_j \|^(2 A t_i t_j)) = M_p \( upright(bold(t)) \) + O \( n^(- c) \) . $ <eq:coulomb-continued>]

 The positive constants $c$ and $xi$ may decrease with the path. Near zero, $M_p \( upright(bold(t)) \) = exp \( sum_j f \( t_j \) \)$. The error in (5.2) is additive; a relative error is asserted only where $M_p$ is nonzero.]
] <prop:coulomb>

We first derive (5.1) for real charges with an unspecified coefficient in place of $A$; the continuation and the identification of that coefficient will follow below. Choose $b$ small enough that all subset weights in both winding conventions are strictly positive. The inward coupling of Proposition 7, in its multipoint form in Proposition 8, shows that the unit increments of $H_(upright(bold(t)))$ near $u_j$ approach a profile depending only on $t_j$. Indeed, inside a common surrounding stopping circuit a marked spin belongs to a loop inside that circuit. Its orientation average depends only on whether that loop encloses $u_j$, and hence only on the single charge $t_j$. No remote charge enters this average. Comparing configurations at separation scales $a$ and $2 a$ gives a power error; summing these errors over successive doublings constructs a unique limiting increment profile. Neutrality can always be maintained by splitting the remote compensating charge into finitely many small charges. The same coupling compares two different remote configurations, including different numbers of compensators: pad them with zero charges to obtain a common finite number of marked points. Thus the limit is independent of that choice.

Let $phi.alt_t \( y \)$ be the step-two Laplacian of this limiting potential, with its charge at the origin. Translation invariance, including an odd tile translation with the corresponding color exchange, identifies these profiles for every possible location of the charge. They also agree when the remote points are placed on the other tile axis: the conditional loop law and the orientation average inside the matched stopping circuit are identical. This observation will allow us to compare all four parity classes of the step-two Laplacian.

The profiles have a summable power tail. To see this at a point $y$, compare the limiting profile to an experiment whose separation is $\( 1 + \| y \| \)^B$. First choose $B$ so large that the inward coupling error is smaller than $\( 1 + \| y \| \)^(- 2 - c_2)$ for some $c_2 > 0$. Then decrease $b$ so that the factor $n^(C b)$ in (4.35), at this value of $n$, does not exhaust the power gain of that estimate. It follows that

#[#set math.equation(numbering: n => "(5.3)")
 $ \| phi.alt_t \( y \) \| lt.eq C \( 1 + \| y \| \)^(- 2 - c_2) . $ <eq:profile-tail>]

All constants here can be chosen uniformly for the small charges under consideration, since their positive weights lie in a fixed neighborhood of one.

Put $g_(upright(bold(t))) \( z \) = Delta_2 H_(upright(bold(t))) \( z \)$. The local convergence just established gives the following useful quantitative form. After decreasing $b$ and $xi$, there is $c_3 > 0$ such that

#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(z in bb(Z)^2) lr(|g_(upright(bold(t))) \( z \) - sum_j phi.alt_(t_j) \( z - u_j \)|) log \( n + \| z \| + 2 \) = O \( n^(- c_3) \) . $ <eq:profile-approximation>]

Here and below the tile coordinate lattice is identified with $bb(Z)^2$. For completeness, take disjoint balls of radius $n^epsilon$ around the $u_j$. Within these balls the coupling has a fixed power gain, with a possible loss $n^(C xi)$ from the ratio between the configuration scale and its least separation. Choose $xi$ and then $epsilon$ small enough that summing over $O \( n^(2 epsilon) \)$ sites, and multiplying by a logarithm, still leaves a power gain. Outside the balls, (4.35) and (5.3) give a bound of order $n^(C b - epsilon c_1)$, with a possibly smaller exponent than $c_1$ and an extra logarithm. Decrease $b$ once more to make this a negative power. The same estimates on the unbounded part of the lattice include the displayed logarithmic weight. This proves (5.4).

We now apply ordinary lattice potential theory, keeping its parity issue explicit. For each $a in { 0 \, 1 }^2$ let $Lambda_a = a + 2 bb(Z)^2$. Let $K$ be the potential kernel on $2 bb(Z)^2$, normalized by

$ Delta_2 K = delta_0 \, #h(2em) K \( y \) = k log \| y \| + k' + O \( \| y \|^(- 1) \) quad \( \| y \| arrow.r oo \) \, #h(2em) k eq.not 0 . $

The kernel normalization, asymptotic and increment estimates follow from #cite(label("LawlerLimic2010")) Proposition 4.4.2, Theorem 4.4.4 and Corollary 4.4.5, after rescaling each parity coset to the integer lattice and adjusting the generator normalization. The same kernel is used on each translated lattice. By (4.35), the convolution

$ U_a \( z \) = sum_(w in Lambda_a) K \( z - w \) g_(upright(bold(t))) \( w \) \, #h(2em) z in Lambda_a \, $

is absolutely convergent, has growth $O_n \( 1 + log \( 2 + \| z \| \) \)$, and has Laplacian $g_(upright(bold(t)))$. On the other hand, the exact variogram bound in Proposition 10 and Cauchy–Schwarz give

$ \| H_(upright(bold(t))) \( z \) - H_(upright(bold(t))) \( z_0 \) \| lt.eq \| C \( upright(bold(t)) \; upright(bold(u)) \) \|^(- 1) #scale(x: 120%, y: 120%)[\(] bb(E) \| h \( z \) - h \( z_0 \) \|^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) = O_n #h(-0.16667em) (1 + sqrt(log \( 2 + \| z - z_0 \| \))) . $

Thus $H_(upright(bold(t))) - U_a$ is a sublinearly growing harmonic function on $Lambda_a$, and the lattice Liouville theorem makes it constant; this is the sublinear-growth consequence of the gradient estimate #cite(label("LawlerLimic2010")) Theorem 6.3.8(a), with the same rescaling. The tail bound also gives

$ U_a \( z \) = (sum_(w in Lambda_a) g_(upright(bold(t))) \( w \)) \( k log \| z \| + k' \) + o \( 1 \) . $

The sublogarithmic growth of $H_(upright(bold(t)))$ therefore forces

#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(w in Lambda_a) g_(upright(bold(t))) \( w \) = 0 quad upright("for every ") a . $ <eq:zero-coset-mass>]

In particular $U_a \( z \) arrow.r 0$ at infinity. The unit increments of $H_(upright(bold(t)))$ tend to zero along the off-axis normals, as proved in Section 4. Evaluating neighboring parity classes along those normals shows that their four additive constants agree. Consequently the convolution formula determines all point differences of $H_(upright(bold(t)))$, not only differences within one parity class.

Let

$ b_a \( t \) = sum_(y in Lambda_a) phi.alt_t \( y \) . $

Equation (5.4), followed by (5.5) and $n arrow.r oo$, implies

$ sum_j b_(a - u_j) \( t_j \) = 0 $

in every separated neutral experiment; the subscripts are taken modulo two. In a two-charge experiment, changing one point by one tile along the axis shows that $b_a \( t \)$ is independent of the corresponding coordinate parity. Repeating the experiment on the other axis proves independence of both parities. Denote the common sum by $b_(*) \( t \)$. Two charges give $b_(*) \( - t \) = - b_(*) \( t \)$, and three give $b_(*) \( s + t \) = b_(*) \( s \) + b_(*) \( t \)$ whenever these charges are small. The uniform bound from (5.3) excludes discontinuous additive functions. Hence $b_(*) \( t \) = b_1 t$ for a constant $b_1$.

Evaluate the convolution formula at $u_i$. The contribution of its own profile is

$ g_0 \( t_i \) = sum_(y in 2 bb(Z)^2) K \( - y \) phi.alt_(t_i) \( y \) \, $

which depends only on $t_i$. Every other profile contributes

$ b_(*) \( t_j \) #scale(x: 120%, y: 120%)[\(] k log \| u_i - u_j \| + k' #scale(x: 120%, y: 120%)[\)] + O \( n^(- c) \) \, $

after possibly decreasing $c$. To justify the power error, split the profile sum at a small power of $\| u_i - u_j \|$; use the kernel asymptotic and its increment bound on the inner part, and (5.3) on the remaining part. The error from replacing $g_(upright(bold(t)))$ by its profiles is already controlled by (5.4). Neither this argument nor the self contribution depends on the point parity.

For $0 lt.eq l lt.eq 1$ differentiation of the characteristic function gives the exact identity

$ frac(thin upright(d), thin upright(d) l) log C \( l upright(bold(t)) \; upright(bold(u)) \) = i sum_i t_i H_(l upright(bold(t))) \( u_i \) . $

The common additive constant disappears by neutrality. The cross terms integrate to $2 A sum_(i < j) t_i t_j log \| u_i - u_j \|$ with $2 A = i k b_1$. The self terms integrate separately at each point. The terms involving $k'$ are also single-point terms, since $sum_(i eq.not j) t_i t_j = - sum_i t_i^2$. Absorb them into $f \( t_i \)$, taking $f \( 0 \) = 0$. Uniformity of the preceding estimates for $l in \[ 0 \, 1 \]$ proves (5.1) for small real charges.

=== 5.2 Analytic continuation and the electric constant <analytic-continuation-and-the-electric-constant>

The complex estimates of Section 3 turn this local calculation into a formula at finite charges. First they determine the scaling exponent of each positive nesting weight, without yet determining its amplitude. On thin complex neighborhoods of compact subintervals of $I_lambda$, the functions

$ frac(log F_n \( v \( t \) \), log n) $

form a locally bounded holomorphic family; logarithms are continued from real positive weights. Extract any convergent subsequence. For small neutral systems, the all-positive comparison in Proposition 8 bounds the normalized correlation above and below. Equation (5.1), with separations of order $n$, therefore shows that its limiting exponent $g$ satisfies

$ sum_j g \( t_j \) = - A sum_j t_j^2 . $

The two- and three-charge identities imply $g \( t \) = - A t^2 + B t$ near zero. Holomorphic uniqueness extends this identity along $I_lambda$. Since

$ v \( t \) = v \( - 2 lambda - t \) \, $

the same symmetry holds for $g$, and it forces $B = - 2 lambda A$. Every subsequential exponent is thus the same. We have proved, locally uniformly also in those complex neighborhoods,

#[#set math.equation(numbering: n => "(5.6)")
 $ F_n \( v \( t \) \) = exp { beta \( t \) log n + o \( log n \) } \, #h(2em) beta \( t \) = - A \( t^2 + 2 lambda t \) . $ <eq:nest-log-exponent>]

Divide $C \( upright(bold(t)) \; upright(bold(u)) \)$ by the cross-distance product in (5.2). Neutrality gives $sum_j beta \( t_j \) = - A sum_j t_j^2$, so Proposition 8 and (5.6) bound this quotient by $n^(o \( 1 \))$ on compact complex neighborhoods with macroscopic separations. If the least separation is only $n^(1 - xi)$, the bound is $n^(o \( 1 \) + C xi)$. These are bounds for the quotient itself; no nonvanishing claim about the correlation is needed here.

Here is the quantitative continuation argument. Fix a reference configuration with macroscopic separations and fixed parities. Compare its quotients at sizes $n$ and $N$, uniformly for $n lt.eq N lt.eq 2 n$. Equation (5.1) makes their difference $O \( n^(- c) \)$ on a small real neighborhood of zero. Apply the two-constants theorem in disks slit along a compact real segment, successively in the $p - 1$ independent charge variables. A negative power on the segment and an $n^(o \( 1 \))$ bound on the other boundary give a negative power on a smaller complex neighborhood. A finite chain of overlapping disks carries this estimate along any prescribed compact path in $cal(D)_p^(+)$. The resulting exponent may be smaller, but remains positive. Summing the comparison over dyadic scales, and using its uniformity for every $N in \[ n \, 2 n \]$, gives a holomorphic limit $M_p$ through all integers with a power error.

Next subtract the reference quotient from the quotient of any allowed configuration. Their difference has the same small-charge power bound by (5.1), while its bound along the continuation path is $n^(o \( 1 \) + C xi)$. Choose $xi$ sufficiently small after fixing that path. The same finite sequence of two-constants estimates still leaves a negative power. This proves the geometry-uniform statement in (5.2). The opposite winding convention proves the assertion on $cal(D)_p^(-)$. The initial amplitude is therefore real analytic. To obtain the same conclusion for $f$, compare the logarithmic amplitudes of the neutral triples $\( s \, t \, - s - t \)$ and pairs $\( s + t \, - s - t \)$. Their difference is the analytic function $f \( s \) + f \( t \) - f \( s + t \)$. Averaging this identity in $s$ over a fixed small interval first shows that the continuous function $f$ is continuously differentiable; differentiation at $s = 0$ then expresses $f' \( t \)$ as a constant minus an analytic function. Hence $f$ is real analytic.

It remains to identify $A$. Take four distinct collinear continuum points $a \, b \, c \, d$ and the neutral charges $\( - s \, s \, - t \, t \)$ at their lattice approximations. The mixed derivative at zero of $log C$ is minus the covariance of the two height increments. In (5.1) it kills all single-point terms and yields

$ - 2 A log frac(\| a - c \| thin \| b - d \|, \| a - d \| thin \| b - c \|) $

for that covariance in the limit. Differentiation of the limit is legitimate by the locally uniform analytic convergence just proved. Input 6, with $G \( z \, w \) = - \( 2 pi \)^(- 1) log \| z - w \|$ and $c = 2 cos \( lambda \/ 2 \)$ in the six-vertex parametrization, gives

#[#set math.equation(numbering: n => "(5.7)")
 $ 2 A = frac(sigma \( 2 cos \( lambda \/ 2 \) \)^2, 2 pi) = frac(1, pi \( pi - lambda \)) \, #h(2em) A = frac(1, 2 pi \( pi - lambda \)) . $ <eq:stiffness>]

This is the separated-endpoint covariance assertion of #cite(label("GFFCompanion")) Theorem 1.1, Part (iii); at the present parameters it lies in the established interval $sqrt(3) lt.eq c < 2$ of #cite(label("DKLM")) Theorem 2.8. Only the covariance statement at that scope is used here. This completes the proof of Proposition 14.

=== 5.3 Pure nesting amplitudes and nonzero special charges <pure-nesting-amplitudes-and-nonzero-special-charges>

#thm([Proposition 5.2.])[
  (Individual nesting amplitudes).  #emph[There is $epsilon_0 > 0$ and a nonvanishing holomorphic function $a \( t \)$ near $\[ - epsilon_0 \, epsilon_0 \]$, positive for real $t$, such that 
$ F_n \( v \( t \) \) = a \( t \) n^(beta \( t \)) \( 1 + o \( 1 \) \) $

 locally uniformly on a complex neighborhood of that interval. The limit uses the fixed cutoff and rounding in the definition of $F_n$. No rate is asserted for this individual amplitude.]
] <prop:pure-nest>

#proof[
  Set
  $ L_n \( t \) = log F_n \( v \( t \) \) - beta \( t \) log n \, #h(2em) L_n \( 0 \) = 0 . $
  For fixed macroscopic two- and three-point configurations, Proposition 8 gives a holomorphic limit of $C \/ product_j F_n \( v \( t_j \) \)$, nonzero near zero because its value at zero is one. Proposition 14 gives the corresponding nonzero limit after division by $n^(sum_j beta \( t_j \))$. Taking the logarithms normalized at zero shows that $sum_j L_n \( t_j \)$ converges holomorphically for each such neutral system. Subtract the identities for $\( s \, t \, - s - t \)$ and $\( s + t \, - s - t \)$. It follows that
  $ L_n \( s \) + L_n \( t \) - L_n \( s + t \) $
  converges near $\( 0 \, 0 \)$. Differentiation at $s = 0$ shows that $L'_n \( t \) - L'_n \( 0 \)$ converges. Hence, with the real number $b_n = L'_n \( 0 \)$, the functions $L_n \( t \) - b_n t$ converge holomorphically near zero. Neutral correlations alone have left precisely this linear ambiguity.
  To determine $b_n$, choose one charge $t$ in a small interval about $- 2 lambda$ and choose sufficiently many other charges $s_1 \, dots.h \, s_k$ in the neighborhood just considered, with $sum_j s_j = - t$. They can be chosen strictly inside that neighborhood. All these individual charges belong to $I_lambda$, and the entire neutral parameter set connects to zero inside $cal(D)_(k + 1)^(+)$. For this fixed macroscopic configuration both the continued amplitude in Proposition 14 and the limit in Proposition 8 are analytic and are not identically zero. Their restrictions cannot vanish on an open real parameter set. Choose real parameters in the indicated open set where both are nonzero. Taking absolute values and ordinary real logarithms then shows that
  $ L_n \( t \) + sum_j L_n \( s_j \) $
  converges. Put $t' = - 2 lambda - t$, which is near zero. The identities $v \( t' \) = v \( t \)$ and $beta \( t' \) = beta \( t \)$ give $L_n \( t \) = L_n \( t' \)$ exactly. Substituting the already convergent remainders $L_n \( z \) - b_n z$ leaves
  $ b_n (t' + sum_j s_j) = b_n \( t' - t \) . $
  The fixed coefficient $t' - t$ is nonzero, so $b_n$ converges. Exponentiating the resulting locally uniform limit of $L_n$ proves the proposition. ◻
]

We next specify the charges used to detect microscopic arms. A single group consists of one charge $alpha = pi \/ 2 - lambda$ and at least two small negative charges whose sum is $- alpha$. Choose sufficiently many compensators that each lies, with its negative, in the interval of Proposition 15. The number of charges is now fixed. They need not all lie in the small-system neighborhood used in the proof of (4.35) for that number of points.

#thm([Proposition 5.3.])[
  (Two special core charges).  #emph[Two separately neutral groups of the preceding kind can be chosen so that their combined amplitude in (5.2) is nonzero. The formula then has a relative power error, including when the two $alpha$-points have opposite colors and least separation $r gt.eq n^(1 - xi)$, for a sufficiently small fixed $xi > 0$.]
  #emph[Place the first core at the origin, the second at odd axial separation $r asymp n^(1 - xi)$, and all compensators at distinct positions $n z_j + O \( 1 \)$, with fixed nonzero axial $z_j$. Write $B_(*) = sum_(j thin upright("remote")) beta \( t_j \)$. There is a constant $M_(*) eq.not 0$, depending only on those charges, their macroscopic positions, and the fixed microscopic conventions, such that 
#[#set math.equation(numbering: n => "(5.8)")
 $ C_r \( n \) = M_(*) n^(B_(*) - x) r^(2 A alpha^2) \( 1 + O \( n^(- c) \) \) = M_(*) n^(B_(*)) r^(- 2 x_1) \( r \/ n \)^x \( 1 + O \( n^(- c) \) \) \, #h(2em) x_1 = - beta \( alpha \) . $ <eq:special-close-pair>]

 The same conclusion is uniform for $n^(1 - xi) lt.eq r lt.eq n^(1 - xi')$, with fixed $0 < xi' lt.eq xi$, after decreasing $c$. For $r = a n$ with fixed small $a > 0$, the full Coulomb product applies; its remaining geometric factor tends to $M_(*)$ as $a arrow.b 0$ and stays bounded above and away from zero.]
] <prop:special-charges>

#proof[
  For one group use the opposite winding convention. Every subset charge lies between $- alpha$ and $alpha$, so all scalar weights are nonnegative. The only possible zero is a loop enclosing every compensator and excluding the $alpha$-point. Every singleton weight is strictly positive: at the core this uses $lambda > 0$, and at the compensators it follows from their smallness. The group thus lies strictly inside $cal(D)_p^(-)$, where the continued formula has a power error.
  Its real correlation compares above and below to the product of its opposite-convention singleton factors $F_n \( v \( - t_j \) \)$. For the lower comparison, impose surrounding primal circuits in the separated point patches and connect them by primal paths outside the smaller cores. At least two compensators are used. A loop enclosing all compensators but not the core could not lie within one patch and could not cross this connected collection of circuits and paths; therefore the zero-weight loops are excluded. The circuit and connection event costs a fixed positive probability by RSW and collar comparison. More explicitly, first integrate the positive singleton tilts in the smaller cores, leave full collars to the connecting event, and then use the passage estimates and the local tilt bounds of Section 3. All remaining charged macroscopic loop counts have fixed exponential moments under this proxy law. Truncate them at a sufficiently large fixed number, losing less than half the lower probability of the connecting event. On the retained event every nonzero scalar factor is bounded below, which proves the lower comparison. The upper comparison follows from the same passage moments.
  By (5.6) this comparison fixes the logarithmic exponent of the group correlation. After division by its Coulomb product the result is bounded below by $n^(- o \( 1 \))$. If its amplitude vanished, (5.2) would instead bound that quotient by $O \( n^(- c) \)$, a contradiction. Thus the single-group amplitude is nonzero. For two independently neutral groups, the identity
  $ M_(p + p') \( upright(bold(t)) \, upright(bold(s)) \) = M_p \( upright(bold(t)) \) M_(p') \( upright(bold(s)) \) $
  holds near zero by the single-point form of (5.1), and hence throughout the continuation with each group separately neutral. The combined amplitude is nonzero as well. The combined positive-convention scalar weights may have either sign; nonvanishing of the combined amplitude has been proved using the opposite convention and analytic continuation.
  Finally separate the core-core factor $r^(2 A alpha^2)$ in the Coulomb product. Every other distance divided by $n$ is a fixed nonzero number plus $O \( r \/ n + n^(- 1) \)$. Neutrality and (5.7) give
  $ 2 x_1 + 2 A alpha^2 = 4 A alpha \( alpha + lambda \) = frac(pi - 2 lambda, 2 \( pi - lambda \)) = x . $
  The exponent of $n$ in the remaining product is consequently $B_(*) - x$. When $r \/ n$ tends to zero at a power rate its geometric factor has a power-rate limit $M_(*)$, proving (5.8). Keeping $r \/ n = a$ instead gives the last assertion directly from the uncontracted Coulomb product. ◻
]

=== 5.4 Arm estimates needed for microscopic comparison <arm-estimates-needed-for-microscopic-comparison>

Let $pi_1 \( R \)$ be the plane probability that a point is connected in its own color to distance $R$, with a fixed bounded microscopic inner scale. Let $pi_2 \( r \, R \)$ be the plane probability of a primal arm and a dual arm across the concentric square annulus with radii $r \, R$. All connections here are actual lattice paths. Bounded changes of these radii are harmless by the arm estimates in Input 3.

#thm([Lemma 5.4.])[
  (Sharp one-arm comparison).  #emph[There are constants $0 < c < C < oo$ such that 
#[#set math.equation(numbering: n => "(5.9)")
 $ c R^(- x_1) lt.eq pi_1 \( R \) lt.eq C R^(- x_1) \, #h(2em) x_1 = - beta \( alpha \) \, $ <eq:one-arm>]

 for all radii above the fixed microscopic scale.]
] <lem:one-arm>

#proof[
  Use one of the neutral single-core groups above at mutual separations of order $R$, now in the positive winding convention. Its singleton core weight is $v \( alpha \) = 0$. Thus no loop wholly inside its core patch may enclose the point. In the switched-region description this is exactly connection of the point’s color to the patch rim, up to a bounded resizing of a whole-tile box. All weights of this single group are nonnegative. Localize the small positive compensator weights in their disjoint patches. Passage bounds through collars give the upper comparison
  $ C \( upright(bold(t)) \; upright(bold(u)) \) lt.eq C pi_1 \( R \) product_(j thin upright("remote")) F_R \( v \( t_j \) \) . $
  For the reverse comparison, give the core arm a separated landing and continue it through a fixed corridor to a circuit of the same color around one compensator patch. Any loop enclosing the core point must then enclose that circuit and its compensator as well: otherwise it would cross the connected color path. Hence no remaining loop has the zero core-only weight. The landing extension, corridor, and circuit cost a bounded factor by Input 3, uniformly after the positive tilts inside the compensator cores, since full collars separate those tilts from the construction. The macroscopic loop counts still have every fixed exponential moment with a bounded cost relative to the arm probability. To apply that bound, first cut the arm requirement back through a fixed-factor buffer, use arm quasimultiplicativity and localization, and leave space between its support and the passage buffers. The local tilt bounds deal with the compensator cutoffs. A fixed truncation of these counts then retains a positive fraction of the constructed event and bounds all nonzero weights below. Therefore
  $ C \( upright(bold(t)) \; upright(bold(u)) \) asymp pi_1 \( R \) product_(j thin upright("remote")) F_R \( v \( t_j \) \) . $
  The nonzero Coulomb amplitude makes the left side comparable to $R^(sum_j beta \( t_j \))$, and Proposition 15 supplies the compensator powers. Canceling them proves (5.9). ◻
]

#thm([Lemma 5.5.])[
  (Logarithmic two-arm exponent).  #emph[For every $delta > 0$ there is $C_delta < oo$ such that 
#[#set math.equation(numbering: n => "(5.10)")
 $ C_delta^(- 1) \( r \/ R \)^(x + delta) lt.eq pi_2 \( r \, R \) lt.eq C_delta \( r \/ R \)^(x - delta) \, #h(2em) R gt.eq r gt.eq r_0 \, $ <eq:two-arm-log>]

 where $r_0$ is a fixed microscopic scale.]
] <lem:two-arm-log>

#proof[
  In a Dobrushin square of size $R$, place the test disk at its center. For $r lt.eq R \/ C$, the probability that the distinguished interface enters this disk compares to $pi_2 \( r \, R \)$, allowing fixed factors in the radii. A disk visit requires both color paths to distance comparable to $R$, giving the upper comparison through full collars. For the lower comparison, separate both ends of the annular arms by the landing-extension result in Input 3. Continue the outer primal arm to a flat portion of the wired wall and the outer dual arm to a flat portion of the complementary dual wall, away from the marked corners, through disjoint corridors. Up-to-wall crossings cost a bounded factor. Continue both inner ends into a fixed enlargement of the disk. The distinguished strand separating these two boundary regions must then enter that enlargement. These are the usual landing and localization arguments of #cite(label("DMT")) Section 6; the paths reach the actual wall neighborhoods and do not use boundary identification as an annular crossing. Removing the wired perimeter edges from the sampled set does not alter the argument, since their endpoints are already identified and those edges are declared open when drawing the strand.
  Fix a large annulus ratio $K$ and let the inner radius tend to infinity. Input 2 applies to these square approximations. Open and closed disk-hitting events, with a fixed enlargement or contraction of the radius, give upper and lower limiting bounds even without selecting a radius of continuity. The Euclidean SLE Green function estimate #cite(label("LawlerRezaeiBasic")) Theorem 2.3, Equation (12), applied at the fixed interior center of the square by local conformal distortion, gives a positive asymptotic proportional to $K^(- x)$ as $K arrow.r oo$. Its hypothesis $kappa < 8$ holds here. The constants in the preceding arm-to-disk comparisons do not depend on $K$. Consequently there are constants $c \, C > 0$, independent of large $K$, such that, for each fixed $K$ and all sufficiently large $r$,
  $ c K^(- x) lt.eq pi_2 \( r \, K r \) lt.eq C K^(- x) . $
  Let $Q$ be a quasimultiplicativity constant. Choose $K$ so large that the fixed factors $Q$, $c^(- 1)$, and $C$ in a product over one annulus are absorbed by $K^(delta \/ 2)$. Iterate the last display on annuli of ratio $K$, once their inner radii exceed the corresponding threshold. Quasimultiplicativity gives the powers $x plus.minus delta \/ 2$. A final annulus of bounded ratio is handled by RSW, and the finitely many scales below the threshold are absorbed in $C_delta$ using finite energy and fixed-factor arm extensions. Enlarging the constant and relaxing to $x plus.minus delta$ proves (5.10) for all the stated radii. This argument supplies the logarithmic exponent; the sharp two-arm comparison will be obtained from the microscopic calibration in Section 7. ◻
]

== 6 An outward coupling conditioned on two arms <sec:coupling>

The electric correlations will compare a pair of points at a growing separation with the two sites adjacent to a single interface segment. The comparison requires more than an estimate for an arm probability: after conditioning the two colors to reach a distant rim, the exterior configurations must become identical with high probability. We prove this statement here. The same coupling will also compare a segment with a small disk.

All distances in this section are in tile units. A cut is the boundary of a finite union of whole tiles. A strand is cut at every port on this boundary. We use square cuts for the successive coupling trials and allow either a square or a round cut for the final target. Round cuts are simple whole-tile approximations to circles, at bounded Hausdorff distance from those circles. In particular, reaching a cut means reaching an exposed gap of the appropriate color. Boundary identifications do not supply edges of a color path.

=== 6.1 Three starting configurations <three-starting-configurations>

Fix a center and a target cut of radius $R$. We consider the following starts, contained well inside that cut.

+ A tile side $e$. Its two end sites have opposite colors, and the associated full medial segment crosses that side. The event $S_R \( e \)$ requires an actual path of each color from its end site to the target cut.
+ Two sites $u \, v$ of opposite colors, with $\| u - v \| asymp r$ and both within distance $O \( r \)$ of the center. The event $S_R \( u \, v \)$ requires their respective color paths to reach the target cut.
+ A round whole-tile disk of radius $r$. The event $S_R \( r \)$ requires both colors to cross the intervening annulus, starting at gaps of the disk boundary.

We sometimes write $S_R$ when the start is specified separately. Every path in this definition is restricted to the region between the start and its first arrival at the target cut.

These definitions have useful descriptions in the strand picture. For a point start, its color region reaches the target cut if and only if no completed loop inside that cut surrounds the point. Indeed, a region that does not reach the cut has a boundary loop separating it from the cut; conversely, an actual color path cannot cross a loop. Thus in cases (i) and (ii), $S_R$ says that no completed loop surrounds either starting site. In case (iii), $S_R \( r \)$ is equivalent to the existence of a strand subarc joining the two rims. To see the latter assertion, cut all strands at both rims. An arc with both ends on the same rim cuts off a region incident only to that rim. If there are no through-arcs, at most one color can have a region incident to both rims. If there are through-arcs, the regions between consecutive through-arcs give paths of both colors between the rims. The rounded drawing makes this a statement about disjoint arcs, even when the straight medial drawing has a double visit.

Write $pi_1 \( r \)$ for the plane one-arm probability to radius $r$, and $pi_2 \( r \, R \)$ for the plane alternating two-arm probability across a square annulus. Their estimates from Lemmas 17 and 18 are available below. A fixed change of a radius, or of the shape of a rim between the round and square choices, changes the following comparisons by a constant only.

#thm([Lemma 6.1.])[
  (Probabilities of the three starts).  #emph[There is a fixed minimum radius $r_0$ such that, for $R$ sufficiently larger than the start, 
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(P) \( S_R \) asymp cases(delim: "{", pi_2 \( r_0 \, R \) \, & upright("for a tile-side start") \,, pi_1 \( r \)^2 pi_2 \( r \, R \) \, & upright("for two sites at separation ") asymp r \,, pi_2 \( r \, R \) \, & upright("for a disk of radius ") r .) $ <eq:start-probabilities>]

 The same constants apply in an ambient FK law with a full bulk collar beyond the target cut, including after a nonnegative integrable reweighting supported beyond that collar. In the second line, the constants can depend on the fixed comparability bounds for the two sites.]
] <lem:start-probabilities>

#proof[
  For the upper bound in the second line, choose disjoint boxes of radius $c r$ about the two sites, with $c > 0$ small enough. Each site must have a one-arm connection to its own box boundary. Outside a square of radius $C r$ about the center there must also be an alternating pair of arms extending to a fixed fraction of $R$. Leave fixed-ratio collars between these three observations. Bounded-density comparison through these collars, as recorded in Input 3, bounds their joint probability by $C pi_1 \( c r \)^2 pi_2 \( C r \, R \/ C \)$. One-arm extension and quasimultiplicativity give the asserted upper bound.
  For the lower bound, require a one-arm event in each small box with a landing extension pointing into a designated corridor. Require alternating arms in the outer annulus with separated inner landings. The two corridors can be chosen disjoint, one for each color. Uniform crossing estimates and same-color FKG connect the corresponding landings at a positive fixed cost. The collars give a lower comparison for the events before this gluing, and quasimultiplicativity removes the fixed changes of radii. This proves the second line. It also explains why no favorable boundary partition is required: each crossing estimate is uniform in the partition induced by the already observed edges.
  For a tile-side start, the initial part of the two paths can be imposed inside a fixed box by finite energy, after which the same two-arm extension argument applies. Cropping gives the reverse inequality. For a disk start, crop or extend at its two rims and use the annular two-arm event directly. These arguments take place before the remaining bulk collar. Conditioning on all data beyond that collar proves the bounds uniformly in the exterior state. Integration proves the assertion for a nonnegative exterior reweighting. ◻
]

#thm([Proposition 6.2.])[
  (Outward conditioned coupling).  #emph[Fix $q in \[ 1 \, 4 \)$. Consider one ambient FK law whose graph is the full tile lattice throughout the region bounded by the target cut and in a fixed-ratio bulk collar beyond it. All imposed wires and nontrivial identifications are supported outside this region and collar. The law may be multiplied by a common nonnegative integrable function supported beyond the collar, with positive finite normalizing expectation. Let two starts of the types above be contained in a disk of radius $s$, where $1 lt.eq s lt.eq R \/ C$. Their laws, conditioned on their respective events $S_R$, have a coupling such that, except with probability 
#[#set math.equation(numbering: n => "(6.2)")
 $ C \( s \/ R \)^c \, $ <eq:outward-error>]

 the configurations agree on and outside an annular band lying between the starts and the target cut. There are exactly two strand subarcs joining the rims of this band. Each start reaches the same transmitted primal region and the same transmitted dual region of the band. Consequently the exterior sees the same pairing of its exposed strand ends in the two configurations.]
  #emph[Here $c > 0$ and $C < oo$ depend only on $q$, the fixed collar geometry, and the fixed comparability constants of the starts. The assertion is uniform in the exterior reweighting.]
] <prop:outward>

The proof constructs an annular band which has positive probability and transmits exactly one region of each color. We first explain its geometry and the gluing that preserves an arbitrary event on its central edges. We then show that a conditioned exploration has enough opportunities to use this band.

=== 6.2 A band with exactly two through-arcs <a-band-with-exactly-two-through-arcs>

#thm([Lemma 6.3.])[
  (The reference band).  #emph[At every sufficiently large scale $l$, there is a fixed-shape square annular band $cal(B)_l$, of inner and outer radii comparable to $l$, and an event of probability bounded below in the plane FK law with the following properties. Both colors cross $cal(B)_l$; there are exactly two strand through-arcs; and each of the two crossing color regions has separated landing extensions beyond both rims. The extension boxes can be chosen a positive relative distance from the central band and from each other. The constants and the relative sizes of all these regions are independent of $l$.]
] <lem:reference-band>

#proof[
  Choose one radial lane on the top flat sides of two concentric squares and another on their bottom flat sides. All lane widths and the gaps between lanes are fixed positive multiples of $l$. The top lane will carry primal crossings and the bottom lane dual crossings. In each lane choose three parallel rectangular strips: a main strip and a flanking strip on each side. Require longitudinal crossings of all three strips. The main crossing is extended beyond both square cuts into prescribed, separated landing boxes. Inside the central annulus, require transverse same-color crossings joining each flanking crossing to the main crossing. A transverse crossing runs across the full width of a flank strip, so it meets every longitudinal crossing of that strip. Crossing estimates and FKG give a positive fixed probability for these requirements. The regions for the two colors are disjoint, so the colors can be treated successively using the conditional crossing bounds.
  In each flanking strip choose the extremal longitudinal crossing closest to the main strip and expose it from the main-strip side. The transverse joining paths can be stopped at their first contact with this crossing. Thus the resulting event still contains the crossing event just imposed, but its verification does not inspect the two corridors between opposing flanks of different colors. This is the usual extremal-crossing exposure: the path and the configuration on its searched side determine the extremal path, whereas edges strictly on its other side retain an FK conditional law. The main roads and their tethers are connected within the central annulus.
  We next join the two color lanes around both sides of the annulus. In either remaining corridor, the dual flank is one target side. The other target side consists of dual cells adjacent to the corridor side of the primal flank. We give the lattice detail needed for this second side, since replacing it by a wired identification would not produce the required barrier.
  Take the central square cuts along dual-lattice rim lines, adjusting by boundedly many rows. The primal flank starts half a mesh before the first rim line and ends half a mesh after the second. Retain its portion ending at its first visit to the ending line and beginning at its last visit to the starting line before that ending-line visit. Its interior then avoids both lines. Follow the centers of the dual cells incident to the path on its corridor side. At a turn, continue through the centers in that side’s sector around the primal vertex. Consecutive centers are nearest neighbors; none of these dual steps crosses an edge of the primal path. The resulting walk reaches both dual rim lines. Retain a crossing subwalk with its interior off those lines and erase loops. This gives a simple dual side arc, still in the flank strip and incident to the primal path. All its edges are on the unsearched side of the extremal exposure. Together with the dual flank and the two rim intervals, it bounds a dual-lattice quadrilateral in the unrevealed corridor.
  The extremal distance between the two target sides of this quadrilateral is uniformly bounded above. Indeed, a family of square contours at intermediate radii crosses the fixed-width gap between the lane strips. Continue each contour to its first hits of the two target sides. There are order $l$ such disjoint contours, each of length $O \( l \)$. The corresponding parallel paths, or the extremal-length variational formula, give a constant upper bound independent of the jagged flank geometry. The quadrilateral crossing theorem in Input 3 therefore gives an actual dual crossing from the dual flank to a dual cell incident to the primal flank, with conditional probability bounded below. Already open edges on the dual flank only help. The two corridors are treated in succession, each with its induced boundary partition.
  The two corridor crossings, the tethers, and the two main roads now form a closed route around the inner square. One portion is an actual primal path and the other an actual dual path. They are joined by exactly two steps between adjacent sites of opposite colors. Its winding number about the inner square is one: its portions lie successively in the top lane, the right corridor, the bottom lane, and the left corridor. Erasing detours within any of these four regions does not change that winding number. Such a route is a barrier even if it was not initially chosen simple.
  Figure 1 shows this closed route and the two adjacency steps at which it can meet medial strands. An actual color path does not cross a medial strand. Each of the two steps between adjacent opposite-color sites crosses exactly one medial segment. Every strand through-arc of a slightly wider central band must intersect the closed route, because the route separates the two rims. Distinct through-arcs are disjoint in the rounded drawing, and therefore use different crossing segments of the route. There are at most two through-arcs. The longitudinal roads give crossings of both colors, so the elementary annular description above gives at least two. There are exactly two. Enlarge the central band by fixed margins while keeping both ends of the main roads and their landing boxes outside it. This gives the stated extensions without changing the barrier argument. Every construction has used finitely many crossing requirements of fixed geometry, so their total probability has a positive scale-independent lower bound. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-2.58, -1.72), (2.58, 1.72), fill: rgb("#f2f2f2"), stroke: none)
  rect((-0.86, -0.559), (0.86, 0.559), fill: rgb("#ffffff"), stroke: none)
  rect((-2.58, -1.72), (2.58, 1.72), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((-0.86, -0.559), (0.86, 0.559), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[inner rim]])
  content((2.683, -1.548), [#text(size: 9pt)[outer rim]], anchor: "west", padding: 0.1176cm)
  line((2.606, -1.548), (2.666, -1.548), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.559), (0, 2.021), stroke: (paint: rgb("#0000b2"), thickness: 1.35pt, miter-limit: 10))
  line((0, -0.559), (0, -2.021), stroke: (paint: rgb("#bf0000"), thickness: 1.35pt, miter-limit: 10, dash: "densely-dashed"))
  content((0.1032, 1.952), [#text(fill: rgb("#0000b2"))[#text(size: 9pt)[primal road]]], anchor: "west", padding: 0.1176cm)
  content((0.1032, -1.952), [#text(fill: rgb("#bf0000"))[#text(size: 9pt)[dual road]]], anchor: "west", padding: 0.1176cm)
  line((-1.393, 0.86), (-0.688, 1.049), (0, 1.075), (0.688, 1.049), (1.393, 0.86), stroke: (paint: rgb("#0000b2"), thickness: 1.6pt, miter-limit: 10))
  line((1.428, 0.817), (1.72, 0.129), (1.72, -1.032), (-1.72, -1.032), (-1.72, 0.129), (-1.428, 0.817), stroke: (paint: rgb("#bf0000"), thickness: 1.6pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.393, 0.86), (1.428, 0.817), stroke: (paint: rgb("#000000"), thickness: 1.1pt, miter-limit: 10))
  line((-1.393, 0.86), (-1.428, 0.817), stroke: (paint: rgb("#000000"), thickness: 1.1pt, miter-limit: 10))
  bezier((0.86, 0.387), (1.41, 0.8385), (1.084, 0.5762), (1.204, 0.6794), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.41, 0.8385), (2.494, 1.72), (1.703, 1.066), (2.167, 1.428), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  bezier((-0.86, 0.387), (-1.41, 0.8385), (-1.084, 0.5762), (-1.204, 0.6794), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  bezier((-1.41, 0.8385), (-2.494, 1.72), (-1.703, 1.066), (-2.167, 1.428), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  circle((1.41, 0.8385), radius: 0.06192, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10))
  circle((-1.41, 0.8385), radius: 0.06192, fill: rgb("#ffffff"), stroke: (paint: rgb("#000000"), thickness: 0.6pt, miter-limit: 10))
  content((1.367, 0.946), [#text(size: 9pt)[$a_2$]], anchor: "south-east", padding: 0.1176cm)
  content((-1.367, 0.946), [#text(size: 9pt)[$a_1$]], anchor: "south-west", padding: 0.1176cm)
  content((2.683, 0.473), [#text(size: 9pt)[through-arcs]], anchor: "west", padding: 0.1176cm)
  line((2.623, 0.5504), (1.952, 1.256), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((1.29, -1.419), [#text(size: 9pt)[barrier]])
})],
  caption: [Figure 1: The topological consequence of the reference-band construction. A primal path and a dual path form a route of winding number one around the inner rim, with exactly two adjacency steps $a_1 \, a_2$ between colors. Only those steps can cross medial strands. Hence at most two strand arcs can cross the band; the two radial color roads force both to be present. The picture is schematic: the adjacency steps are enlarged, the flanking crossings used to construct the route are omitted, and neither the color paths nor the medial arcs are asserted to be straight or smooth. ],
) <fig:barrier>

=== 6.3 Landing extensions and gluing <landing-extensions-and-gluing>

We use a strengthened form of arm separation which retains the crossing clusters. For a fixed-ratio bulk annulus and every $epsilon > 0$, the probability in the plane FK law that some crossing arms admit no separated landing extensions in their respective original color clusters is at most $epsilon$, when the separation parameter is chosen small enough. This is precisely the event $B_n$ preceding Lemma 5.9 of #cite(label("CDCH")). The replacement arms there are required to belong to the same respective primal or dual clusters. The proof uses the quadrilateral crossing bounds, including at the exposed jagged sides, the small- and large-extremal-length bounds, and an upper bound on the number of crossing components. These are all available for $1 lt.eq q < 4$ by #cite(label("DMT")) Theorem 1.2 and Section 6; indeed its proof of Proposition 6.2 invokes this argument. Thus we use the proof at its stated probabilistic inputs, rather than an Ising-specific identity.

We need two geometric features of these extensions. Their endpoints stay away from the corners of the square cut, and the extension boxes can be much smaller than the separation between different landings. In the proof of #cite(label("CDCH")) Lemma 5.9, separation occurs at the scale denoted there by $delta^3 n$, whereas extensions are constructed at smaller scales $delta^k n$, $k gt.eq 4$. Only finitely many such scales are needed for a specified error tolerance. The arms consequently protrude a positive relative distance beyond their landing cut, inside disjoint boxes having a fixed-factor margin between them. All constants may depend on the error tolerance. Bounded lattice rounding is harmless once the trial scale exceeds a corresponding fixed minimum.

Suppose a past has been exposed up to a square cut of radius $l$, and the conditional, unconditioned-FK probability that the specified start reaches a larger cut of radius $8 l$ is at least $h > 0$. Here and below the factors $8$ and $16$ may be increased by fixed amounts to accommodate collars. Apply the preceding landing statement on an annulus strictly between those two cuts. Its failure event can be assigned ordinary plane probability less than $h \/ \( 2 C \)$, where $C$ is the collar-comparison constant. Its conditional probability given the past is then less than $h \/ 2$. Thus, with conditional probability at least $h \/ 2$, the two start-connected clusters have separated outer extensions before radius $16 l$. The crossing portions are taken after their last visits to the annulus’s inner rim. Replacing those portions within their same clusters preserves connection to the start. A finite cover of the landing rim by small boxes allows the landing locations to be restricted to one pair of boxes, at a cost depending on $h$ only.

There is a corresponding construction facing inward from the remaining annulus toward $R$. Arms beginning at a scale comparable to $K l$, where $K$ is a sufficiently large fixed number, can have separated inward protrusions and can be required to reach a little beyond the target cut. Their probability is bounded below by $c pi_2 \( l \, R \)$. To check the relative cost of the landing failure, crop the remaining arms through a fixed-ratio buffer before the annulus where the landing test is performed. Collar comparison and quasimultiplicativity bound the joint probability of that failure and the remaining arms by $C epsilon pi_2 \( l \, R \)$. Choose $epsilon$ small, or use the equivalent well-separated-arm comparison. This also shows that the construction is uniform under conditioning on data separated from it by the specified collars.

The two sets of protrusions can be joined through the free space between them. Group their locations on a sufficiently fine but fixed grid along each cut. For every resulting pair of location choices, there are disjoint corridors joining the primal tabs and the dual tabs, with widths bounded below by a positive multiple of $l$. The constants can be small functions of $h$; they do not change the total number of geometric trial scales. In a protrusion box, require a transverse crossing at a level between the landing cut and the protrusion’s outermost required level. It must meet the protruding arm. Overlapping longitudinal and transverse crossings then carry that contact through its corridor. Only one color is involved in each corridor and its overlap boxes. The conditional crossing estimates and FKG in that color give a positive fixed gluing probability. This is the tube construction of #cite(label("CDCH")) Proof of Proposition 5.4.

The distinction between the central band and its extensions is essential here. An arbitrary event $E$ may fix #emph[every edge] of the central band, so no gluing edge is allowed to lie there. The protrusions extend outside that band; their overlap boxes and the connecting corridors lie strictly outside it. Within an overlap box the only requirement inherited from the extension is a connection in that box’s color, which is increasing in its color edges. Thus FKG applies after $E$ is fixed. The auxiliary extensions are integrated out when we take a measure on the central-band configurations. They are not additional band data that must agree in the eventual coupling.

=== 6.4 Frequent opportunities under the conditioned law <frequent-opportunities-under-the-conditioned-law>

We now prove Proposition 20. Denote the common ambient law, including its permitted exterior reweighting, by $bb(P)_0$, and write

$ Q_a = bb(P)_0 \( thin dot.op divides S_R \( a \) \) $

for a particular start $a$. Until the target scale, all conditional edge laws before the $S_R \( a \)$ conditioning are ordinary FK laws with induced partitions, or mixtures of such laws. Consequently the collar and crossing comparisons just established apply to $bb(P)_0$ as well.

Choose a fixed large ratio $K$ leaving room for the past-extension annulus, the reference band with its two collars, and the outer-extension annulus. Trial radii are $l_i = K^i l_0$, where $l_0$ is a fixed large multiple of $s$, increased to a fixed minimum mesh scale when necessary. Stop the trials before a fixed fraction of $R$. The number $k$ of available trials satisfies

$ k gt.eq frac(log \( R \/ s \), log K) - C . $

When the right side is bounded, enlarging the constant in (6.2) suffices. We may therefore assume there are many trials.

Let $cal(F)_i$ contain all edges inside the radius-$l_i$ cut, together with the identities of the start-connected color regions there. Call trial $i$ good for start $a$ if

#[#set math.equation(numbering: n => "(6.3)")
 $ bb(P)_0 \( S_(8 l_i) \( a \) divides cal(F)_i \) gt.eq h . $ <eq:good-trial>]

The threshold $h > 0$ is chosen after $K$. The preceding separation and gluing constructions then use narrower corridors if necessary; they require no increase of $K$ depending on $h$.

Under $Q_a$, with probability at least $1 - C e^(- c k)$, at least $3 k \/ 4$ of the trials are good. Here is the conditioning calculation. The event $S_R \( a \)$ implies $S_(8 l_i) \( a \)$ at every trial. For a specified collection $J$ of bad trials, expose success to $8 l_i$ before passing to the next selected trial. Since badness is $cal(F)_i$-measurable, the tower property and the negation of (6.3) give a factor at most $h$ for each $i in J$. Moreover, by (6.1) and quasimultiplicativity,

$ frac(bb(P)_0 \( S_R \( a \) \), bb(P)_0 \( S_(l_0) \( a \) \)) gt.eq C^(- 1) e^(- C_0 k) . $

The microscopic or one-arm factors in (6.1) cancel in this ratio. Summing over collections of at least $k \/ 4$ bad trials gives

#[#set math.equation(numbering: n => "(6.4)")
 $ Q_a { upright("at least ") k \/ 4 upright(" bad trials") } lt.eq C e^(C_0 k) 2^k h^(k \/ 4) . $ <eq:good-trial-tail>]

Choose $h$ so small that the right side decreases exponentially in $k$. This choice is uniform over all the permitted starts and exterior laws.

=== 6.5 A common band measure and loss of the past <a-common-band-measure-and-loss-of-the-past>

At a good trial, place a scaled copy of the reference band between the past-extension and outer-extension annuli. Its central configuration has a subprobability measure $nu_l$ defined as follows: take the plane FK law, restrict to the successful reference-band construction of Lemma 21, including the auxiliary protrusions, and then retain only the central-band edges. There is a fixed $v_0 > 0$ such that $nu_l \( upright("all band data") \) gt.eq v_0$.

For every event $E$ of central-band data and every good past,

#[#set math.equation(numbering: n => "(6.5)")
 $ bb(P)_0 { upright("band data") in E \, med S_R \( a \) divides cal(F)_i } gt.eq c_h thin nu_l \( E \) thin pi_2 \( l \, R \) . $ <eq:band-minorization-raw>]

Indeed, the good past supplies the separated start-connected extensions with probability bounded below in terms of $h$. Require the reference-band event with its protrusions, and separated arms continuing toward $R$. Before gluing, these observations are separated by full collars. Bounded-density comparison can therefore be applied successively from the two sides of the central band. It preserves the factor $nu_l \( E \)$ for an arbitrary, possibly nonmonotone, set $E$, and gives the factor $pi_2 \( l \, R \)$ for the remaining arms. There is still unobserved space for the two-color tube construction. Its same-color overlap requirements leave $E$ fixed, as explained above, and complete both paths from the start to the target. This proves (6.5).

To make the averaging explicit, condition beyond a collar containing all these constructions, and let $xi$ denote the resulting exterior state. Given the already fixed past, write $p_xi$ for the conditional probability of reaching $8 l$ and $mu$ for the conditional distribution of $xi$. Goodness means $integral p_xi thin mu \( thin upright(d) xi \) gt.eq h$; it does not assert $p_xi gt.eq h$ for each $xi$. Uniform collar comparison makes the landing-error probability at most $epsilon$ for every $xi$, with $epsilon < h \/ 2$. In the preceding construction, keep the probability of the start-connected extensions as a factor instead of replacing it by a constant. The finitely many landing-location choices all have the same lower gluing bound. The conditional lower bound is therefore

$ c nu_l \( E \) pi_2 \( l \, R \) \( p_xi - epsilon \)_(+) . $

Its integral is at least $c nu_l \( E \) pi_2 \( l \, R \) \( h - epsilon \)$, as required in (6.5). This proves the assertion for the exterior mixture without imposing pointwise goodness. No identification jumps an annulus used in these comparisons.

In the reverse direction, any successful continuation from the past must have two arms in the remaining annulus. Cropping through a collar and using (6.1) gives

#[#set math.equation(numbering: n => "(6.6)")
 $ bb(P)_0 \( S_R \( a \) divides cal(F)_i \) lt.eq C pi_2 \( l \, R \) . $ <eq:band-denominator>]

Dividing (6.5) by (6.6) shows that, under $Q_a$, the band marginal after every good past dominates $c nu_l$. Hence two good pasts, even for different starts, have a uniformly positive common part on identical central-band data.

It remains to check that coupling this band is enough. Cut its strands at both rims. There are two through-arcs. All remaining arcs have both ends on the same rim. Whatever the configuration inside the inner rim, completing its pairings joins the two through-arcs to one another: they are the only two strand ends left after the same-rim arcs and the interior pairings are followed. Interior loops can change in number, but their loop weight is then a factor depending solely on that interior completion. The effective pairing seen on the outer rim is fixed by the band.

The same fact can be expressed in FK terms. Exactly one primal region and one dual region transmit through the band. An exterior connection that enters the past must do so through the transmitted region of its color, whose trace on the outer rim is already determined by the band. Thus the induced exterior primal partition is independent of the earlier past. On $S_R \( a \)$, the starting regions have made contact with these two transmitted regions. Conditional on that contact, the remaining constraint is only that the transmitted regions continue to the target cut. Paths that cross the band repeatedly use the same transmitted region and impose no additional constraint. The domain Markov property now shows that the conditional law on and outside the outer rim, given the common band and successful continuation, is identical for the two pasts. A common exterior weight or an ambient wall farther out changes this common law in the same way in both cases.

We can therefore complete the coupling as follows. At each trial, if both pasts are good, use the common submeasure $c nu_l$ to couple the central-band configurations with probability at least $p > 0$. On success, fill the interior gaps according to their respective conditional laws and sample the exterior from the common conditional law just described. On failure, use the residual band marginals and fill the data up to the next trial cut with their correct conditional laws. No edges beyond that next cut are inspected merely to decide whether a coupling attempt failed. This is a coupling of the successive conditional kernels, so each complete marginal remains $Q_a$ throughout.

For completeness, this iteration does not require the trials to be independent. By (6.4) and a union bound over the two marginals, except with probability $C e^(- c k)$ there are at least $k \/ 2$ jointly good trials. Their goodness is known from the two pasts before the corresponding attempt. At each such trial, conditional on the entire coupled past and on all earlier failures, the overlap probability is at least $p$. Iterating at these predictable trial times bounds the probability of $k \/ 2$ failed good attempts by $\( 1 - p \)^(k \/ 2)$. The total failure probability is consequently at most $C e^(- c' k) lt.eq C \( s \/ R \)^c$. On success the band and its exterior agree, and the two transmitted color regions have been reached by both starts. This proves Proposition 20.

For a tile-side start, the common through-strand passes through the associated medial segment: otherwise that segment would lie on a completed inner loop surrounding one of its two end sites, contrary to $S_R \( e \)$. For a disk start, the common through-strand meets the disk, since every disk-to-target strand must pass through the band. Thus an exterior rule selecting the distinguished Dobrushin strand gives the same verdict for a microscopic segment and for a disk after successful coupling. This is the form used in the occupation comparison.

== 7 From electric correlations to microscopic normalization <sec:calibration>

The electric formula is accurate when marked points remain separated by a mesoscopic distance. Counting an edge requires two opposite-color marked points at distance one. The outward coupling bridges these scales. We first obtain a pure-power amplitude for a neighboring pair, then compare that pair with a disk. The latter comparison is the normalization needed for occupation measures.

=== 7.1 A signed factor with positive local conditioning <a-signed-factor-with-positive-local-conditioning>

Fix the two neutral charge groups of Proposition 16. Each group has a core charge $alpha = pi \/ 2 - lambda$ and sufficiently many small negative compensating charges. Place the compensators at distinct points $u_j \( n \)$ on the axis by fixed, color-preserving lattice roundings $u_j \( n \) = n zeta_j + O \( 1 \)$, where the $zeta_j$ are distinct fixed locations away from the origin. The two cores lie within distance $r = o \( n \)$ of the origin, in opposite colors. The first core is held fixed. Write $e$ for the neighboring pair corresponding to a medial segment, and write $r$ for the separated pair, with the appropriate odd lattice separation. All rounding conventions preserve these colors.

Let

$ B_(*) = sum_(j upright(" remote")) beta \( t_j \) \, #h(2em) beta \( t \) = - A \( t^2 + 2 lambda t \) \, #h(2em) A = frac(1, 2 pi \( pi - lambda \)) . $

Choose disjoint small patches of radius a fixed multiple of $n$ around the remote points. Reweight only the loops wholly contained in these patches, using their single-point weights $v \( t_j \) = cos \( lambda + t_j \) \/ cos lambda$. These weights are positive. Let $Z_(*) \( n \)$ be the mass of this local reweighting and let $bb(P)_n^(*)$ be its normalized probability law. The cutoff comparison and the pure-nest asymptotic give

#[#set math.equation(numbering: n => "(7.1)")
 $ Z_(*) \( n \) asymp product_(j upright(" remote")) F_n \( v \( t_j \) \) asymp n^(B_(*)) . $ <eq:proxy-mass>]

Constants are uniform over the finitely many rounding classes used below. We use the positive-winding expansion of the electric correlation. Its remaining loop factor, denoted by $Y_r$, need not be nonnegative.

Let $R$ be larger than the core separation by a fixed factor and smaller than a sufficiently small multiple of $n$. The event $S_R \( r \)$ means that both core colors reach the tile rim of radius $R$. The scalar weight of a loop enclosing just one core and no remote point is zero, because $cos \( lambda + alpha \) = 0$. A completed loop inside the $R$-disk enclosing both opposite-color cores contains another loop separating them. Thus any nonzero configuration has $S_R \( r \)$. Conversely, factoring out its indicator merely restricts the original loop product. Consequently the full electric correlation satisfies

#[#set math.equation(numbering: n => "(7.2)")
 $ C_r \( n \) = Z_(*) \( n \) bb(P)_n^(*) \( S_R \( r \) \) bb(E)_n^(*) \[ Y_r divides S_R \( r \) \] . $ <eq:core-factorization>]

The same identity holds for the neighboring pair $e$.

We record two uniform bounds used throughout this section. For every fixed $j gt.eq 1$,

#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E)_n^(*) \[ \| Y_r \|^j divides S_R \( r \) \] & lt.eq C_j \,\
frac(bb(P)_n^(*) \( S_R \( r \) \), bb(P) \( S_R \( r \) \)) & = 1 + O \( \( R \/ n \)^(c_0) \) . $ <eq:macro-moments>]

Here $bb(P)$ denotes the ordinary plane FK law; the same statements hold with $r$ replaced by $e$. To justify the first bound, discard configurations on which $Y_r = 0$. Every non-unit factor remaining on the other configurations belongs to a macroscopic loop. A separating loop must enclose a remote point, and an ancestor enclosing both cores contains such a separating loop. A loop charged only at remote points but not included in the local reweighting has left its remote patch. Each such loop therefore has a passage through one of finitely many buffered regions of size comparable to $n$. These buffers may be chosen away from the support of $S_R \( r \)$. Even a loop with an arbitrarily large excursion has such a passage. Conditional passage moments and the local-tilt estimate of Input 3 control every fixed moment of the product. Cutting the arm event back by a fixed factor leaves collars before the passage buffers, so the estimates cost its ordinary probability, not its reciprocal. This gives (7.3) after normalization. The relative collar comparison gives (7.3), because the nonnegative local reweighting is supported at distance comparable to $n$.

#thm([Lemma 7.1.])[
  #emph[Consider two opposite-color core pairs contained in a disk of radius $s$, with the same remote charges and local reweighting. If $C s < R < c n$, then 
$ lr(|bb(E)_n^(*) \[ Y_1 divides S_R \( 1 \) \] - bb(E)_n^(*) \[ Y_2 divides S_R \( 2 \) \]|) lt.eq C \( s \/ R \)^(c_1) . $

 The constants are independent of the microscopic separations of the pairs.]
] <lem:signed-comparison>

#proof[
  Apply Proposition 20 to the two starts, with the common nonnegative remote reweighting. On successful coupling the band and the entire exterior agree. Exactly one global loop has the two through-arcs in that band. It separates the opposite-color cores: an inner closure separating them would contradict $S_R$. Its enclosures of remote points are the same in both configurations. Every other loop outside the band either encloses both cores or neither, and the ancestors of the through-loop enclose both. Inside the band no completed loop can enclose a core under $S_R$. The factors $Y_1 \, Y_2$ therefore agree on successful coupling. Hölder’s inequality and (7.3) bound their contribution on coupling failure by a positive power of its probability. Reducing the exponent in Proposition 20 proves the claim. No positivity of $Y_i$ is used. ◻
]

=== 7.2 The neighboring-pair amplitude <the-neighboring-pair-amplitude>

Set $x_1 = - beta \( alpha \)$. The parameter identities are

#[#set math.equation(numbering: n => "(7.4)")
 $ 2 x_1 + 2 A alpha^2 = x \, #h(2em) x = frac(pi - 2 lambda, 2 \( pi - lambda \)) . $ <eq:exponent-identity>]

For a sufficiently small fixed $xi > 0$, choose an odd separation $r asymp n^(1 - xi)$. Proposition 16 gives

#[#set math.equation(numbering: n => "(7.5)")
 $ C_r \( n \) & = M_(*) n^(B_(*) - x) r^(2 A alpha^2) \( 1 + O \( n^(- c_2) \) \)\
 & = M_(*) n^(B_(*)) r^(- 2 x_1) \( r \/ n \)^x \( 1 + O \( n^(- c_2) \) \) \, #h(2em) M_(*) eq.not 0 . $ <eq:mesoscopic-core>]

The amplitude depends on the fixed remote geometry, charges, and rounding convention, but not on $n$ or $r$ in this regime. Indeed the full Coulomb formula uses the actual pairwise distances; replacing the remote distances from either core by their limiting values changes its product by $O \( r \/ n \) + O \( n^(- 1) \)$. These errors can be included in the power remainder. We will not use this equivalence with a fixed $M_(*)$ when $r \/ n$ is held positive.

#thm([Proposition 7.2.])[
  #emph[For the fixed remote experiment there exists $c_(*) eq.not 0$ such that 
#[#set math.equation(numbering: n => "(7.6)")
 $ C_e \( n \) = c_(*) n^(B_(*) - x) \( 1 + O \( n^(- c_3) \) \) . $ <eq:microscopic-amplitude>]

 In particular this limit holds through all positive integers $n$.]
] <prop:microscopic-amplitude>

#proof[
  Take
  $ r asymp n^(1 - xi) \, #h(2em) R asymp n^(1 - b xi) \, #h(2em) 0 < b < 1 . $
  All radii are chosen once for the comparison interval $\[ n \, 2 n \]$. From (7.2), (7.1), (7.5), the one-arm bound, and (6.1), we obtain, for every small $delta > 0$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ lr(|bb(E)_n^(*) \[ Y_r divides S_R \( r \) \]|) gt.eq c_delta \( R \/ n \)^x \( r \/ R \)^delta . $ <eq:expectation-lower>]
  For example the upper estimate $bb(P) \( S_R \( r \) \) lt.eq C_delta r^(- 2 x_1) \( r \/ R \)^(x - delta)$ in the denominator gives precisely this inequality. Its right side has order $n^(- \[ b x + delta \( 1 - b \) \] xi)$, whereas the signed comparison error is $O \( n^(- c_1 \( 1 - b \) xi) \)$. Choose $b > 0$ sufficiently small and then $delta > 0$ sufficiently small that
  $ c_1 \( 1 - b \) > b x + delta \( 1 - b \) . $
  Lemma 22 is then a relative power-error comparison of the two conditional expectations.
  Apply the same argument with the remote geometry at any integer scale $N in \[ n \, 2 n \]$, using the #emph[same] core positions, $r$, and $R$. Equation (7.3) removes the remote tilt from the arm probabilities with a power error. Uniformly in this interval,
  #[#set math.equation(numbering: n => "(7.8)")
   $ frac(C_e \( N \), C_r \( N \)) = frac(bb(P) \( S_R \( e \) \), bb(P) \( S_R \( r \) \)) \( 1 + O \( n^(- c_4) \) \) . $ <eq:fixed-radii-ratio>]
  The ordinary probability ratio on the right does not depend on $N$. The mesoscopic formula therefore yields
  #[#set math.equation(numbering: n => "(7.9)")
   $ frac(N^(x - B_(*)) C_e \( N \), n^(x - B_(*)) C_e \( n \)) = 1 + O \( n^(- c_5) \) \, #h(2em) n lt.eq N lt.eq 2 n . $ <eq:dyadic-amplitude-ratio>]
  The denominator is nonzero for all sufficiently large $n$, since (7.7) dominates the coupling error.
  Write $a_n = n^(x - B_(*)) C_e \( n \)$. On a dyadic sequence, the consecutive ratios of $a_n$ differ from one by a summable sequence. Their product converges to a nonzero value, with tail error $O \( n^(- c_5) \)$. Equation (7.9) compares every intervening integer to the preceding dyadic scale. Hence the entire sequence has the same nonzero limit and the stated power error. ◻
]

#thm([Proposition 7.3.])[
  #emph[For all radii above a fixed lattice scale, 
#[#set math.equation(numbering: n => "(7.10)")
 $ bb(P) \( S_R \( e \) \) asymp R^(- x) \, #h(2em) pi_2 \( r \, R \) asymp \( r \/ R \)^x . $ <eq:sharp-arms>]

 The estimates hold with fixed-factor changes of the inner and outer rims and with a further bulk collar.]
] <prop:sharp-arms>

#proof[
  First choose $R = theta n$, with $theta > 0$ a sufficiently small fixed constant. Equations (7.2), (7.3), and (7.6) give the lower bound $bb(P) \( S_R \( e \) \) gt.eq c n^(- x)$.
  For the reverse bound, compare the neighboring pair with an opposite-color pair at separation $r asymp a R$, where $a > 0$ is a small fixed constant. Use the full Coulomb formula, not the $r = o \( n \)$ simplification with its limiting amplitude. Its magnitude is uniformly comparable to $n^(B_(*)) r^(- 2 x_1) \( r \/ n \)^x$ as first $n arrow.r oo$ and then $a arrow.b 0$. The nonzero amplitude and the remote-distance factors vary continuously in this limit. It follows that
  $ lr(|bb(E)_n^(*) \[ Y_r divides S_R \( r \) \]|) gt.eq c_delta theta^x a^delta . $
  Choose $delta < c_1$ and then $a$ small enough that $C a^(c_1) < 1 / 2 c_delta theta^x a^delta$. Lemma 22 gives a strictly positive lower bound for the magnitude of the conditional expectation at $e$. Equation (7.2) now gives $bb(P) \( S_R \( e \) \) lt.eq C n^(- x)$. Fixed-factor extensions cover all large $R$, and finite energy covers the remaining bounded scales.
  The first line of (6.1) identifies $bb(P) \( S_R \( e \) \)$ with $pi_2 \( C \, R \)$. Quasimultiplicativity therefore gives
  $ pi_2 \( r \, R \) asymp frac(pi_2 \( C \, R \), pi_2 \( C \, r \)) asymp \( r \/ R \)^x . $
  All comparisons used buffered events, so their collar and rounding versions follow from the same fixed-factor estimates. ◻
]

=== 7.3 Calibration by disk probes <calibration-by-disk-probes>

A disk does not carry a prescribed electric charge. We therefore introduce a diagnostic loop factor which agrees with the neighboring pair’s factor after successful outward coupling. Its purpose is only to determine deterministic normalization constants.

Let $s = epsilon.alt n < R$. Under the same remote local reweighting, let $S_R \( s \)$ be the disk two-arm event. If exactly one global loop touches the disk and leaves the $R$-cut, assign that loop the factor it would receive as a separator of the two cores, with its actual remote enclosures. Give its ancestors the factors corresponding to enclosing both cores, and give other loops no core charge. Divide out the local remote weights already included in $bb(P)_n^(*)$. Call the resulting factor $Y_s$. In every other case set $Y_s = 0$. In particular the distinguished loop receives value zero when it encloses no remote point. Define the deterministic quantity

#[#set math.equation(numbering: n => "(7.11)")
 $ W_s \( n \) = Z_(*) \( n \) bb(P)_n^(*) \( S_R \( s \) \) bb(E)_n^(*) \[ Y_s divides S_R \( s \) \] . $ <eq:disk-diagnostic>]

The moment bound (7.3) also holds for $Y_s$: every charged loop in a nonzero configuration spans between the disk and a remote patch, or leaves a remote patch.

In the coupling of the disk start and the edge start, the factors $Y_s$ and $Y_e$ coincide on success. The unique band through-loop touches the disk, and no second loop can both touch the disk and leave $R$. Replacing its inside portion preserves its remote enclosures; the same is true for its ancestors. Thus

#[#set math.equation(numbering: n => "(7.12)")
 $ lr(|bb(E)_n^(*) \[ Y_s divides S_R \( s \) \] - bb(E)_n^(*) \[ Y_e divides S_R \( e \) \]|) lt.eq C \( s \/ R \)^(c_6) . $ <eq:disk-signed-comparison>]

#thm([Lemma 7.4.])[
  #emph[For almost every fixed pair of scaled radii $0 < epsilon.alt < theta$ in the permissible range, with $s = epsilon.alt n$ and $R = theta n$, the limit 
#[#set math.equation(numbering: n => "(7.13)")
 $ lim_(n arrow.r oo) n^(- B_(*)) W_s \( n \) $ <eq:diagnostic-limit>]

 exists. Tile-rim roundings do not change the limit.]
] <lem:disk-diagnostic>

#proof[
  We use Corollary 9. First remove the nest weights below radius $delta n$ at each remote point, dividing by the corresponding single-point nest partition functions. Their inward coupling and cutoff insensitivity make the normalized error tend to zero as $delta arrow.b 0$, uniformly in $n$.
  There is a minor extra condition here: a loop deciding the disk diagnostic might enter one of those small neighborhoods. It can be discarded at a vanishing cost. Indeed the positive remote tilt produces a surrounding screen before reaching the neighborhood with probability tending to one. A loop arriving from the distant disk cannot cross that screen. More annular trials reduce the exceptional probability, and the moment bound for the remaining loop factors makes its weighted contribution vanish. Thus, outside a vanishing exceptional event, the diagnostic is determined by the truncated macroscopic configuration.
  For fixed $delta$, truncate excursions beyond a large fixed multiple of $n$ and the number of charged macroscopic passages. The remaining test uses finitely many loops of diameter bounded below after scaling. It reads their ordered trajectories, their windings about the remote points, and their intersections with the two disk rims. In a nonzero diagnostic, ancestors of the distinguished loop can be recognized among the remote-enclosing loops by whether they enclose the disk center: any other such loop is disjoint from the disk, since otherwise it too would touch the disk and leave $R$.
  Input 4 gives convergence of these loop tests. Fixed marked points are almost surely off all macroscopic loop traces. For almost every choice of radii, no relevant loop is at a tangency threshold, so intersection tests are continuity events. This follows also by Fubini from the countable loop collection and its matching topology. Bounded tile-rounding errors do not affect such tests. The passage moment bounds remove the count and excursion truncations. Finally let $delta arrow.b 0$. The pure-power asymptotics of the remote nest factors identify their normalization with $n^(B_(*))$, proving (7.13). ◻
]

#thm([Proposition 7.5.])[
  #emph[There is a sequence $epsilon.alt arrow.b 0$, a choice of radii $R \/ n asymp epsilon.alt^b$, and positive deterministic numbers $L_epsilon.alt asymp epsilon.alt^(- x)$ such that 
#[#set math.equation(numbering: n => "(7.14)")
 $ limsup_(n arrow.r oo) lr(|frac(n^x bb(P) \( S_R \( e \) \), L_epsilon.alt bb(P) \( S_R \( epsilon.alt n \) \)) - 1|) lt.eq C epsilon.alt^(c_7) . $ <eq:disk-calibration>]

 The exponent $b > 0$ may be chosen sufficiently small in advance to satisfy any additional finitely many inequalities of the form $\( 1 - b \) c > b x$, with $c > 0$ fixed. The same constants apply to every translate and rotation of the edge start, including color exchange.]
] <prop:disk-calibration>

#proof[
  Write $t = R \/ n$. Equations (7.2), (7.1), (7.6), and (7.10) imply
  #[#set math.equation(numbering: n => "(7.15)")
   $ lr(|bb(E)_n^(*) \[ Y_e divides S_R \( e \) \]|) asymp t^x . $ <eq:edge-expectation-size>]
  For $t asymp epsilon.alt^b$, the relative error in (7.12) is bounded by $C epsilon.alt^(\( 1 - b \) c_6 - b x)$. Choose $b$ so that this exponent is positive; it can simultaneously satisfy the stated finite collection of further inequalities. The relative collar error in (7.3) is $O \( epsilon.alt^(b c_0) \)$. Consequently
  #[#set math.equation(numbering: n => "(7.16)")
   $ frac(n^x C_e \( n \), W_s \( n \)) = frac(n^x bb(P) \( S_R \( e \) \), bb(P) \( S_R \( s \) \)) \( 1 + O \( epsilon.alt^(c_7) \) \) $ <eq:disk-ratio-identity>]
  for a positive exponent $c_7$ after it is decreased if necessary. Although the two correlations can be signed, their ratio in this display is positive for small $epsilon.alt$, by the relative comparison.
  Choose a sequence of continuity pairs for Lemma 25, with $R \/ n asymp epsilon.alt^b$. The sharp arm estimates show that the right side of (7.16) is comparable to $epsilon.alt^(- x)$. Thus the limit of $n^(- B_(*)) W_s \( n \)$ is nonzero for each sufficiently small chosen $epsilon.alt$. Define
  $ L_epsilon.alt = frac(c_(*), lim_(n arrow.r oo) n^(- B_(*)) W_s \( n \)) . $
  The numerator is the amplitude in (7.6). This definition and (7.16) give positivity, $L_epsilon.alt asymp epsilon.alt^(- x)$, and (7.14).
  All probabilities in (7.14) are ordinary plane probabilities. Translation, square symmetries, and planar self-duality identify them for the different edge locations and orientations, using covariant tile-disk roundings. Therefore the calibration does not depend on the checkerboard class or orientation of the probe. ◻
]

== 8 Occupation measures and the whole trace <sec:occupation>

Proposition 26 compares a microscopic segment with a disk whose radius is a fixed fraction of the domain size. We first make this comparison inside second moments. The resulting approximation permits us to use ordered-curve convergence at a fixed disk radius, and only afterwards let that radius tend to zero. We also control the boundary strip, since weak convergence of finite measures on the closed square includes convergence of total mass.

=== 8.1 Segment probes and their replacement by disks <segment-probes-and-their-replacement-by-disks>

Let $cal(E)_n$ be the deterministic set of full medial segments available in the discrete square, including the boundary collar of Section 1. A segment here is an edge of the drawn medial graph, before applying $Pi$. Write $z_e$ for its projected midpoint and $I_e$ for the indicator that it belongs to the distinguished strand. The pairing at every medial vertex splits that vertex into two vertices of degree two. In the resulting finite graph, the component containing a distinguished terminal half-edge is a path, with the other distinguished half-edge as its other end. It cannot repeat an edge: a repeated edge would put that component on a cycle, which cannot contain its degree-one terminal vertices. Consequently the counting multiplicity in (1.2) is exactly $I_e$, even when the unsplit medial vertex is visited twice. Distinct collar edges are still counted separately if their projections coincide.

There is a constant $A_0 > 0$, determined by the density of medial midpoints in the stated lattice units, such that

#[#set math.equation(numbering: n => "(8.1)")
 $ A_0 n^(- 2) sum_(e in cal(E)_n) h \( z_e \) arrow.r integral_D h \( z \) thin upright(d) A \( z \) #h(2em) #scale(x: 120%, y: 120%)[\(] h in C \( overline(D) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:probe-riemann>]

Indeed the bulk midpoints form a periodic set of fixed density, and there are only $O \( n \)$ additional boundary probes. Define

#[#set math.equation(numbering: n => "(8.2)")
 $ X_n \( f \) = A_0 n^(- 2) sum_(e in cal(E)_n) f \( z_e \) n^x I_e = A_0 n^(- d) sum_(e in cal(E)_n) f \( z_e \) I_e . $ <eq:microscopic-test>]

Use the sequence of radii $epsilon.alt arrow.b 0$ supplied by Proposition 26, together with its constants $L_epsilon.alt asymp epsilon.alt^(- x)$. The physical scale of a unit tile is $a_0 \/ n$. For a probe $e$ in the bulk, let $B_e^epsilon.alt$ be the whole-tile disk of radius $s = epsilon.alt n$ used in that proposition, translated to the probe. Its physical radius is $a_0 epsilon.alt$, up to $O \( n^(- 1) \)$. Let $J_e^epsilon.alt$ indicate that the distinguished strand enters this disk; the occurrence of an unrelated loop does not count. For $f in C_c \( D \)$, put

#[#set math.equation(numbering: n => "(8.3)")
 $ X_(n \, epsilon.alt) \( f \) = A_0 n^(- 2) sum_(e in cal(E)_n) f \( z_e \) L_epsilon.alt J_e^epsilon.alt . $ <eq:disk-test>]

For fixed $epsilon.alt$ sufficiently small, every disk occurring in this sum is inside $D$ once $n$ is sufficiently large.

#thm([Proposition 8.1.])[
  (Replacement in second moment).  #emph[For every real $f in C_c \( D \)$, 
#[#set math.equation(numbering: n => "(8.4)")
 $ lim_(epsilon.alt arrow.b 0) limsup_(n arrow.r oo) bb(E) #scale(x: 120%, y: 120%)[\[] \| X_n \( f \) - X_(n \, epsilon.alt) \( f \) \|^2 #scale(x: 120%, y: 120%)[\]] = 0 \, $ <eq:l2-replacement>]

 where $epsilon.alt$ tends to zero through the sequence in Proposition 26. The same approximation holds for every finite vector of such tests.]
] <prop:l2-replacement>

#proof[
  Fix a compact set $K subset.double D$ containing $"supp" f$, and abbreviate
  $ H_e^0 = I_e \, #h(2em) H_e^1 = J_e^epsilon.alt \, #h(2em) w_0 = n^x \, #h(2em) w_1 = L_epsilon.alt \, #h(2em) V_e^a = w_a H_e^a quad \( a in { 0 \, 1 } \) . $
  We first compare products at two probes $e \, e'$ satisfying $z_e \, z_(e') in K$ and $\| z_e - z_(e') \| gt.eq g$, where $g > 0$ is fixed. Constants in this comparison may depend on $K$ and $g$. Choose $ell = c_(K \, g) n$ in tile units, with $c_(K \, g) > 0$ small enough that balls of radius several times $ell$ about the two probes are disjoint and contained in the square. All auxiliary cuts below leave fixed annular collars. Let $cal(F)$ be the edges outside the ball of radius $ell$ about $e$.
  Take $R asymp epsilon.alt^b n$ as in Proposition 26, where $b > 0$ will be sufficiently small, and write $h_epsilon.alt = R \/ n asymp epsilon.alt^b$. Let $S_R^a$ denote the local two-color reaching event from the segment start when $a = 0$ and from $B_e^epsilon.alt$ when $a = 1$. For sufficiently small $epsilon.alt$, these events and their collars are inside the $ell$-ball. On every exterior configuration of positive probability, set
  $ p_a^(cal(F)) = bb(P)_n \( S_R^a divides cal(F) \) \, #h(2em) Q_a^(cal(F)) = bb(P)_n \( thin dot.op divides cal(F) \, S_R^a \) \, #h(2em) Lambda_a = w_a p_a^(cal(F)) . $
  The conditional FK law has the partition induced by the exposed exterior; the uniformity in that partition is essential here.
  Write $p_a$ for the corresponding ordinary plane probability. The relative comparison through the full collar in Input 3 gives, for some $c_(upright("mix")) > 0$,
  #[#set math.equation(numbering: n => "(8.5)")
   $ p_a^(cal(F)) = p_a #scale(x: 120%, y: 120%)[\(] 1 + O_(K \, g) \( h_epsilon.alt^(c_(upright("mix"))) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:occupation-relative-comparison>]
  Proposition 24, Equation (6.1), and Proposition 26 consequently imply
  #[#set math.equation(numbering: n => "(8.6)")
   $ Lambda_a & lt.eq C_(K \, g) h_epsilon.alt^(- x) \,\
\| Lambda_0 - Lambda_1 \| & lt.eq C_(K \, g) h_epsilon.alt^(- x) #scale(x: 120%, y: 120%)[\(] epsilon.alt^(c_(upright("cal"))) + h_epsilon.alt^(c_(upright("mix"))) + o_(n \, epsilon.alt) \( 1 \) #scale(x: 120%, y: 120%)[\)] $ <eq:occupation-lambda-bound>]
  for some $c_(upright("cal")) > 0$. Here and below $o_(n \, epsilon.alt) \( 1 \)$ tends to zero as $n arrow.r oo$ for each fixed admissible $epsilon.alt$; it can be chosen uniformly over the probes and exposed exteriors under consideration. Translation, rotation, and the color exchange in Proposition 26 identify their plane ratios.
  Fix a second probe type $v in { 0 \, 1 }$. Let $T_(e')^v$ be its two-color reaching event to a cut of radius $ell \/ C$ about $e'$, with $C$ a sufficiently large fixed constant, defined using actual paths inside that cut rather than connections supplied by exterior wiring. This event is $cal(F)$-measurable and is necessary for $H_(e')^v = 1$. Define
  $ q_a^(cal(F)) = bb(E)_(Q_a^(cal(F))) \[ H_e^a H_(e')^v \] . $
  Proposition 20 couples $Q_0^(cal(F))$ and $Q_1^(cal(F))$ with failure probability at most $C \( s \/ R \)^(c_(upright("out")))$, for some $c_(upright("out")) > 0$. On success there is an identical intermediate band with exactly two through strands, and the completions outside that band agree. The two through strands have one possible connection through the interior. In the segment experiment that connection contains $e$, while in the disk experiment it enters $B_e^epsilon.alt$. Whether the connection belongs to the distinguished strand is therefore the same in both completions. The identical outer connection also preserves its hit verdict at $e'$. This last observation is needed because $H_(e')^v$ itself need not be $cal(F)$-measurable. It gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ \| q_0^(cal(F)) - q_1^(cal(F)) \| lt.eq C_(K \, g) \( s \/ R \)^(c_(upright("out"))) upright(bold(1))_(T_(e')^v) . $ <eq:occupation-q-difference>]
  A hit by the distinguished strand also requires continuation from $R$ to a cut of radius comparable to $ell$ about $e$. By the start comparisons, sharp arms, and their conditional collar versions,
  #[#set math.equation(numbering: n => "(8.8)")
   $ q_a^(cal(F)) lt.eq C_(K \, g) h_epsilon.alt^x upright(bold(1))_(T_(e')^v) . $ <eq:occupation-q-bound>]
  One can obtain this bound by taking the ratio of the start probability to radius $ell \/ C$ and that to radius $R$ in the conditional FK law. Both cuts have collars before the exposed exterior; the start factors in Equation (6.1) cancel, leaving $pi_2 \( R \, ell \/ C \) lt.eq C_(K \, g) h_epsilon.alt^x$.
  Since $H_e^a = 1$ implies $S_R^a$, the conditional expectation of $V_e^a H_(e')^v$ is $Lambda_a q_a^(cal(F))$. Subtracting these expressions and using Equations (8.6)–(8.8) yields
  #[#set math.equation(numbering: n => "(8.9)")
   $ & lr(|bb(E) #scale(x: 120%, y: 120%)[\[] \( V_e^0 - V_e^1 \) H_(e')^v divides cal(F) #scale(x: 120%, y: 120%)[\]]|)\
 & quad lt.eq C_(K \, g) upright(bold(1))_(T_(e')^v) [h_epsilon.alt^(- x) \( s \/ R \)^(c_(upright("out"))) + epsilon.alt^(c_(upright("cal"))) + h_epsilon.alt^(c_(upright("mix"))) + o_(n \, epsilon.alt) \( 1 \)] . $ <eq:conditional-product-replacement>]
  Thus the continuation bound cancels the factor $h_epsilon.alt^(- x)$ in the normalization error. The coupling error retains this factor. Finally, the necessary arms at the second probe satisfy
  $ w_v bb(P)_n \( T_(e')^v \) lt.eq C_(K \, g) . $
  Multiplication of Equation (8.9) by $w_v$ and integration therefore show that
  #[#set math.equation(numbering: n => "(8.10)")
   $ limsup_(n arrow.r oo) sup_(z_e \, z_(e') in K\
\| z_e - z_(e') \| gt.eq g) lr(|bb(E) \[ \( V_e^0 - V_e^1 \) V_(e')^v \]|) lt.eq C_(K \, g) eta \( epsilon.alt \) \, $ <eq:separated-product-replacement>]
  where
  $ eta \( epsilon.alt \) = epsilon.alt^(\( 1 - b \) c_(upright("out")) - b x) + epsilon.alt^(c_(upright("cal"))) + epsilon.alt^(b c_(upright("mix"))) . $
  Choose $b$ sufficiently small that $\( 1 - b \) c_(upright("out")) - b x > 0$, in addition to the requirements in Proposition 26. Then $eta \( epsilon.alt \) arrow.r 0$. Interchanging the probes gives the analogous replacement in the second factor.
  It remains to control nearby probes. The first-moment arm bound on $K$ is
  #[#set math.equation(numbering: n => "(8.11)")
   $ bb(E) V_e^a lt.eq C_K #h(2em) \( a = 0 \, 1 \) . $ <eq:interior-probe-first-moment>]
  For two probes at distance $y gt.eq C epsilon.alt$, impose their necessary arms separately to radii comparable to $y$, using disjoint collars. Conditioning on the exterior of either collar leaves the other event measurable, so the uniform conditional bounds multiply. They give
  #[#set math.equation(numbering: n => "(8.12)")
   $ bb(E) \[ V_e^a V_(e')^v \] lt.eq C_K y^(- 2 x) . $ <eq:probe-pair-bound>]
  When $a = v = 0$, this holds down to a fixed multiple of the mesh; at smaller distances use the bound $n^(2 x)$. Thus its right side can there be replaced by $C_K \( y or n^(- 1) \)^(- 2 x)$. If $y lt.eq C epsilon.alt$ and at least one probe is a disk probe, Equation (8.11) instead gives
  #[#set math.equation(numbering: n => "(8.13)")
   $ bb(E) \[ V_e^a V_(e')^v \] lt.eq C_K epsilon.alt^(- x) . $ <eq:overlapping-disk-bound>]
  For a mixed pair bound the disk factor by $L_epsilon.alt$ and use the microscopic first moment; for two disk probes use the first moment of either one.
  The periodic probe set has at most $C \( 1 + n^2 u^2 \)$ points in a ball of radius $u$. Summing Equation (8.12) in dyadic distance annuli with $y < g$ shows that its contribution to the double Riemann sum is at most $C_K \( g^(2 - 2 x) + n^(2 x - 2) \)$. The contribution of Equation (8.13), after taking the upper limit in $n$, is at most $C_K epsilon.alt^(2 - x)$. Both exponents are positive. Expanding the square in Equation (8.4), use these bounds for pairs at distance less than $g$ and Equation (8.10) for all other pairs. For fixed $g$ and sufficiently small $epsilon.alt$ this proves
  $ limsup_n bb(E) \| X_n \( f \) - X_(n \, epsilon.alt) \( f \) \|^2 lt.eq C_K parallel f parallel_oo^2 #scale(x: 120%, y: 120%)[\(] g^(2 - 2 x) + epsilon.alt^(2 - x) #scale(x: 120%, y: 120%)[\)] + C_(K \, g) parallel f parallel_oo^2 eta \( epsilon.alt \) . $
  Let $epsilon.alt arrow.b 0$ first and then $g arrow.b 0$. Applying the scalar result to each component proves the assertion for finite vectors. ◻
]

=== 8.2 Minkowski content in the closed square <minkowski-content-in-the-closed-square>

We record the whole-domain consequence of the SLE content theorems, including the boundary estimate needed to match the convention of Equation (1.4).

#thm([Lemma 8.2.])[
  (Whole-square content).  #emph[Let $eta$ be chordal $upright("SLE")_kappa$ in $\( D \; a \, b \)$, with the parameters of Equation (1.1). Its interior $d$-dimensional Euclidean Minkowski-content measure extends by zero on $partial D$ to a finite random measure $mu_eta$ on $overline(D)$. For every real $f in C \( overline(D) \)$, 
#[#set math.equation(numbering: n => "(8.14)")
 $ r^(- x) integral_(bb(C)) f \( Pi z \) upright(bold(1))_({ "dist" \( z \, "tr" eta \) < r }) thin upright(d) A \( z \) arrow.r mu_eta \( f \) quad upright("in probability as ") r arrow.b 0 . $ <eq:whole-content-convergence>]

 Its expected total mass is finite, and some nonnegative $f in C_c \( D \)$ has $bb(E) mu_eta \( f \) > 0$. If $U_delta = { z in overline(D) : "dist" \( z \, partial D \) lt.eq delta }$, then 
#[#set math.equation(numbering: n => "(8.15)")
 $ bb(E) mu_eta \( U_delta \) lt.eq C delta^(1 - x) . $ <eq:continuum-boundary-strip>]

]
] <lem:whole-content>

#proof[
  Here $4 < kappa lt.eq 6 < 8$ and $0 < x < 1$. Theorem 3.1 of #cite(label("LawlerRezaeiContent")) establishes almost sure and $L^2$ convergence of the full-trace neighborhood-area approximations on interior dyadic squares in the half-plane. Together with its measure construction and Theorem 1.1, this gives the interior content measure and convergence against continuous tests of compact support. The normalization there is precisely radius to the power $d - 2$ times Euclidean neighborhood area.
  For completeness, this interior conclusion is preserved by the conformal map $F : bb(H) arrow.r D$ taking $0 \, oo$ to $a \, b$. The inverse image of a compact subset of $D$ is a compact subset of $bb(H)$. Given $theta.alt > 0$, subdivide a neighborhood of that compact set into patches with centers $w_j$ on which $\| F' \| \/ \| F' \( w_j \) \|$ lies between $1 - theta.alt$ and $1 + theta.alt$. For sufficiently small $r$, conformal distortion bounds the preimage of a physical $r$-neighborhood on the $j$th patch between neighborhoods with radii $\( 1 plus.minus C theta.alt + o_r \( 1 \) \) r \/ \| F' \( w_j \) \|$. Neighborhoods of the whole trace may be used: a trace portion outside a larger patch cannot affect a sufficiently small neighborhood of its inner patch. Changing area by $\| F' \|^2$ and applying the half-plane convergence squeezes the limit between the corresponding patchwise integrals. Taking $r arrow.b 0$ first and then $theta.alt arrow.b 0$ identifies the measure as
  $ F_(*) #scale(x: 120%, y: 120%)[\(] \| F' \|^d mu_(bb(H)) #scale(x: 120%, y: 120%)[\)] quad upright("on ") D \, $
  and gives convergence in probability for compactly supported tests. Continuous nonnegative tests can first be approximated on these patches; the signed case follows by subtraction.
  Theorem 2.3 of #cite(label("LawlerRezaeiBasic")) applies to chordal SLE in any simply connected domain. It gives a Euclidean one-point asymptotic, with an error bounded by a power of $r \/ "dist" \( z \, partial D \)$ when this ratio is below $1 \/ 10$. Its Green function is a constant times the conformal radius to the power $- x$, multiplied by the angular factor $sin^(8 \/ kappa - 1) theta$. This factor is at most one, and Koebe’s theorem compares conformal radius to boundary distance. Hence, with $y = "dist" \( z \, partial D \)$,
  #[#set math.equation(numbering: n => "(8.16)")
   $ bb(P) { "dist" \( z \, "tr" eta \) < r } lt.eq C \( r \/ y \)^x #h(2em) \( 0 < r < y \/ 10 \) . $ <eq:sle-distance-upper-bound>]
  The constants are uniform in $z in D$, including near the corners. The interior Green moment identity in Theorem 3.1 of #cite(label("LawlerRezaeiContent")), transported by $F$, implies positive expected content against every nonzero nonnegative continuous interior test. This uses the Green function with the Euclidean content constant absorbed, as in that paper.
  Let $M_r$ denote the random approximation measure on the left side of Equation (8.14). For $r < delta \/ 10$, integrating Equation (8.16) over $10 r < y lt.eq delta$ gives
  $ bb(E) M_r #scale(x: 120%, y: 120%)[\(] { z in D : 10 r < "dist" \( z \, partial D \) lt.eq delta } #scale(x: 120%, y: 120%)[\)] lt.eq C integral_0^delta y^(- x) thin upright(d) y lt.eq C delta^(1 - x) . $
  The interior strip $y lt.eq 10 r$ has area $O \( r \)$, so its contribution is at most $C r^(1 - x)$ even without a probability bound. Outside $D$, only the $r$-neighborhood of $overline(D)$ contributes. Its area is $O \( r \)$, and $Pi$ maps it onto the boundary. We have therefore shown
  #[#set math.equation(numbering: n => "(8.17)")
   $ bb(E) M_r \( U_delta \) lt.eq C delta^(1 - x) + C r^(1 - x) . $ <eq:content-approximation-boundary>]
  The interior Green bound is integrable over the square. Local convergence, Fatou’s lemma, and an exhaustion of $D$ consequently give a finite interior measure with finite expected total mass. The same argument in boundary strips gives Equation (8.15). Extend this measure by assigning zero mass to $partial D$. For a continuous test on $overline(D)$, multiply it by a continuous cutoff vanishing on $U_delta$ and equal to one outside $U_(2 delta)$. Local convergence applies to the cutoff test. Equations (8.15) and (8.17), followed by Markov’s inequality, make the discarded parts arbitrarily small, first as $r arrow.b 0$ and then as $delta arrow.b 0$. This proves Equation (8.14) with exactly the prescribed projection and normalization. The conformal map extends to the marked corners by Jordan-domain boundary continuity, so this argument includes both chordal endpoints. ◻
]

=== 8.3 Identification of the joint limit <identification-of-the-joint-limit>

#proof[
  Fix an admissible $epsilon.alt > 0$ and $f in C_c \( D \)$. Input 2 implies, jointly with the ordered curve, that
  #[#set math.equation(numbering: n => "(8.18)")
   $ X_(n \, epsilon.alt) \( f \) med arrow.r.double med L_epsilon.alt integral_D f \( z \) upright(bold(1))_({ "dist" \( z \, "tr" eta \) < a_0 epsilon.alt }) thin upright(d) A \( z \) . $ <eq:fixed-radius-joint-limit>]
  To verify the approximation of the disk tests, consider any sequence of curves converging in the ordered-curve metric. Their trace sets then converge in Hausdorff distance. The tile rounding, disk center choice, and rounded switch drawing change distances by $O \( n^(- 1) \)$. Sandwich the disk indicators between Euclidean distance indicators with radii $a_0 epsilon.alt plus.minus o \( 1 \)$ and apply Equation (8.1). For every closed set $T subset bb(C)$ and every $r > 0$, the level set ${ z : "dist" \( z \, T \) = r }$ has area zero: the distance function has gradient of magnitude one almost everywhere off $T$, whereas its gradient vanishes almost everywhere on any positive-area level set. Thus the sandwich has the asserted limit, and the continuous mapping theorem gives Equation (8.18). This reasoning uses no simplicity of $"tr" eta$ and applies to any finite collection of tests.
  The deterministic quantities $L_epsilon.alt \( a_0 epsilon.alt \)^x$ are bounded above and below by positive constants. Choose a subsequence of the admissible radii, still denoted by $epsilon.alt$, on which
  #[#set math.equation(numbering: n => "(8.19)")
   $ L_epsilon.alt \( a_0 epsilon.alt \)^x arrow.r L in \( 0 \, oo \) . $ <eq:occupation-limit-constant>]
  By Lemma 28, the right side of Equation (8.18) tends in probability to $L mu_eta \( f \)$ on the same SLE probability space. The finite-vector version of Proposition 27 and the converging-together argument now give
  #[#set math.equation(numbering: n => "(8.20)")
   $ #scale(x: 120%, y: 120%)[\(] \[ eta_n \] \, X_n \( f_1 \) \, dots.h \, X_n \( f_k \) #scale(x: 120%, y: 120%)[\)] med arrow.r.double med #scale(x: 120%, y: 120%)[\(] \[ eta \] \, L mu_eta \( f_1 \) \, dots.h \, L mu_eta \( f_k \) #scale(x: 120%, y: 120%)[\)] $ <eq:interior-joint-limit>]
  for all real $f_1 \, dots.h \, f_k in C_c \( D \)$, along all integers $n$. Indeed, at each fixed radius the approximation converges along the entire mesh sequence; its replacement error tends to zero in the successive order $n arrow.r oo$, $epsilon.alt arrow.b 0$. Extracting radii in Equation (8.19) does not extract meshes. This also shows directly why the limiting measure and curve in Equation (8.20) belong to the same SLE sample.
  To pass to the closed square, regard $X_n$ as the measure defined by Equation (8.2). If a probe is at physical boundary distance $y gt.eq C \/ n$, a hit requires its two color arms to a cut of radius comparable to $n y$ in tile units. That cut and a full collar can be placed inside the square. The conditional arm bound from Proposition 24 gives
  #[#set math.equation(numbering: n => "(8.21)")
   $ bb(E) \[ n^x I_e \] lt.eq C y^(- x) . $ <eq:lattice-near-boundary-first-moment>]
  There are $O \( n \)$ probes in every strip of width $1 \/ n$ adjacent to the square boundary. Consequently, for a sufficiently large fixed integer $j_0$ and $delta gt.eq j_0 \/ n$,
  #[#set math.equation(numbering: n => "(8.22)")
   $ bb(E) X_n \( U_delta \) & lt.eq C n^(x - 1) + C n^(- 1) sum_(j = j_0)^(ceil.l delta n ceil.r) \( j \/ n \)^(- x)\
 & lt.eq C n^(x - 1) + C delta^(1 - x) . $ <eq:lattice-boundary-strip>]
  The first term includes all probes in the remaining bounded-width mesh strip and in the collar, using $I_e lt.eq 1$. Projecting them does not change their number. The terminal connectors have no mass. Thus all boundary contributions vanish in the successive limits $n arrow.r oo$, $delta arrow.b 0$.
  Use the same continuous interior cutoffs as in the proof of Lemma 28. For every $f in C \( overline(D) \)$ the discarded discrete part has first moment at most $C parallel f parallel_oo \( delta^(1 - x) + n^(x - 1) \)$, and the discarded limit has first moment at most $C L parallel f parallel_oo delta^(1 - x)$. Equation (8.20) therefore extends to every finite set of continuous tests on $overline(D)$, including $f = 1$. The same first-moment estimates give $sup_n bb(E) X_n \( overline(D) \) < oo$, after absorbing finitely many small meshes. For each finite $M$, the set of nonnegative measures of total mass at most $M$ is compact in the weak topology on the compact square, so the measures are tight. Together with curve tightness from Input 2, a countable determining family of continuous tests identifies the joint limit as
  $ \( \[ eta_n \] \, X_n \) med arrow.r.double med \( \[ eta \] \, L mu_eta \) . $
  Finally, by the edge-counting identity preceding Equation (8.2), $X_n = A_0 n^(- d) sum_(j = 1)^(N_n) delta_(Pi \( z_(n \, j) \))$. Taking the single deterministic constant
  $ c \( q \) = A_0 / L in \( 0 \, oo \) $
  proves the asserted convergence in the product of the ordered-curve and weak finite-measure topologies, including convergence of total mass. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
